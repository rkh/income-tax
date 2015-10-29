module IncomeTax
  module Models
    def self.Delegate(base)
      Class.new(Delegate) { delegate_to(base) }
    end

    class Delegate < Generic
      def self.delegate_to(base = nil)
        @delegate_to   = base if base
        @delegate_to ||= superclass.delegate_to
      end

      def setup(options)
        @delegate = delegate_to.new(**options)
        super
      end

      def delegate_to
        self.class.delegate_to
      end

      def calculate
        @rate         = @delegate.rate
        @taxes        = @delegate.taxes
        @net_income   = @delegate.net_income
        @gross_income = @delegate.gross_income
      end
    end
  end
end
