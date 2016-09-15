require 'money'

describe IncomeTax do
  example { expect(IncomeTax.new('DE', 60_000).gross_income) .to be == 60_000 }
  example { expect(IncomeTax.new('DE', '€5k/mo').gross_income) .to be == 60_000 }
  example { expect(IncomeTax.new('DE', 60_000, :net).net_income) .to be == 60_000 }
  example { expect(IncomeTax.new('DE', Money.new(6_000_000, 'EUR')).gross_income) .to be == 60_000 }
  example { expect { IncomeTax.new(:DE, 60_000) } .to raise_error(ArgumentError) }
end
