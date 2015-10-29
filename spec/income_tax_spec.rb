require 'money'

describe IncomeTax do
  example { expect(IncomeTax.new("DE", 60000).gross_income)                     .to be == 60000                }
  example { expect(IncomeTax.new("DE", "€5k/mo").gross_income)                  .to be == 60000                }
  example { expect(IncomeTax.new("DE", 60000, :net).net_income)                 .to be == 60000                }
  example { expect(IncomeTax.new("DE", Money.new(6000000, "EUR")).gross_income) .to be == 60000                }
  example { expect{IncomeTax.new(:DE,  60000)}                                  .to raise_error(ArgumentError) }
end
