require 'bigdecimal'
require 'bigdecimal/util'
require 'forwardable'

module IncomeTax
  class Rate < Numeric
    PROTOTYPE = new
    private_constant :PROTOTYPE

    include Comparable

    def self.new(input, other = nil)
      return super unless other.nil?
      input.is_a?(Rate) ? input : super
    end

    def self.decimal(input)
      return input.to_d unless input.is_a? Rational
      input.to_d(input.to_f.to_s.size)
    end

    def self.rational(input, other)
      return 0r if input == 0
      Rational(input, other).to_r.rationalize(0.00001r)
    end

    attr_reader :to_d, :to_r, :to_f, :to_s, :to_i, :preferred_coercion
    protected :preferred_coercion

    extend Forwardable
    def_delegators :to_r, :denominator, :numerator, :rationalize
    def_delegators :to_f, :nan?, :finite?, :infinite?, :arg, :angle, :magnitude, :next_float, :phase, :prev_float
    def_delegators :to_d, :exponent, :fix, :frac, :precs, :sign, :split, :to_digits

    def initialize(value, other = nil)
      value     = "100%" if value.respond_to? :infinite? and value.infinite?
      value     = Rate.rational(value, other) if other
      _, value  = case value
                  when /^\-?\d+(\.\d+)?\%$/ then @preferred_coercion, @to_r = :to_r, value.to_r / 100
                  when /^[10\-?]\.\d+$/     then @preferred_coercion, @to_r = :to_r, value.to_r
                  when BigDecimal           then @preferred_coercion, @to_d = :to_d, value
                  when Rational             then @preferred_coercion, @to_r = :to_r, value
                  when Float                then @preferred_coercion, @to_f = :to_f, value
                  when Integer              then @preferred_coercion, @to_r = :to_r, value.to_r / 100
                  else raise ArgumentError, "cannot handle %p as rate input" % [value]
                  end

      @to_d ||= Rate.decimal(value)
      @to_r ||= Float === value ? value.to_s.to_r : value.to_r
      @to_f ||= value.to_f
      @to_i ||= value.to_i
      @to_s ||= (@to_d * 100).to_s("F") + "%"
      @to_s.sub! ".0%", "%"

      @preferred_coercion = :to_i if @to_i == value
    end

    def gross(value)
      math(value) do |rate, net|
        if rate == 1
          net == 0 ? 0 : BigDecimal('Infinity')
        else
          net / (1 - rate)
        end
      end
    end

    def net(value)
      math(value) do |rate, gross|
        gross * (1 - rate)
      end
    end

    def gross_taxes(value)
      self * value
    end

    def net_taxes(value)
      math(value) do |rate, net|
        rate == 1 ? net : net / (1 - rate) - net
      end
    end

    def preferred_representation
      send(@preferred_coercion)
    end

    def inspect
      "#<%p:%p, %p>" % [ self.class, to_s, to_r ]
    end

    def -@
      self.class.new(-preferred_representation)
    end

    def +(other)   math(other,        &:+)   end
    def -(other)   math(other,        &:-)   end
    def *(other)   math(other,        &:*)   end
    def /(other)   math(other,        &:/)   end
    def **(other)  math(other,        &:**)  end
    def <=>(other) math(other, false, &:<=>) end

    def eql?(other)
      other.class == self.class and other == self
    end

    def ==(other)
      return false unless other.is_a? Numeric
      super
    end

    def hash
      to_s.hash ^ to_d.hash
    end

    def coerce(other)
      case other
      when Rate       then [ other,                                 self                            ]
      when Rational   then [ other,                                 to_r                            ]
      when BigDecimal then [ other,                                 to_d                            ]
      when Integer    then [ other.public_send(preferred_coercion), public_send(preferred_coercion) ]
      else                 [ Float(other),                          to_f                            ]
      end
    end

    def math(other, cast = nil)
      if other.is_a? Rate
        coercion = preferred_coercion == other.preferred_coercion ? preferred_coercion : :to_d
        result   = yield(public_send(coercion), other.public_send(coercion))
        cast == false ? result : Rate.new(result)
      else
        b, a   = coerce(other)
        result = yield(a, b)
        cast ? Rate.new(result) : cast(result, other)
      end
    end

    def cast(result, input)
      return result unless input.is_a? Integer and not result.is_a? Integer
      return result if result.respond_to?(:infinite?) and result.infinite?
      return result if result.respond_to?(:nan?)      and result.nan?
      result == result.to_i ? result.to_i : result
    end

    private :math, :cast

    module BigDecimalExtension
      def BigDecimal(input, *)
        Rate === input ? input.to_d : super
      end

      private :BigDecimal
      Object.prepend(self)
    end

    private_constant :BigDecimalExtension
  end
end
