module IncomeTax
  class Register
    include Enumerable

    def initialize(type = 'entry')
      @type     = type
      @register = {}
    end

    def add(key, value)
      @register[normalize(key)] = value
    end

    def get(key)
      @register.fetch(normalize(key)) do
        raise ArgumentError, "unknown #{@type} #{key.inspect}"
      end
    end

    def each(&block)
      @register.values.uniq(&block)
    end

    def include?(key)
      @register.include? normalize(key)
    end

    def normalize(key)
      key.to_s
         .tr('_ÅåÉé', ' AaEe')
         .gsub(/republic of (the)?/i, 'republic')
         .downcase
         .gsub(' and ', '')
         .gsub(/\W/, '')
    end

    alias []= add
    alias [] get
    private :normalize
  end
end
