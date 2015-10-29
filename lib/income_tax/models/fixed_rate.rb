module IncomeTax
  module Models
    class FixedRate < Generic
      def self.rate(value = nil)
        @rate   = Rate.new(value) if value
        @rate ||= superclass.rate
      end

      def calculate
        @rate = self.class.rate
      end
    end
  end
end
