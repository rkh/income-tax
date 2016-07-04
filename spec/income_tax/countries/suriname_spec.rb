describe IncomeTax::Countries::Suriname do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 17) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9411.68'.to_d               }
    its(:taxes)        { should be == '588.32'.to_d                }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(149, 482) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '69087.92'.to_d              }
    its(:taxes)        { should be == '30912.08'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(106, 279) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '62007087.92'.to_d           }
    its(:taxes)        { should be == '37992912.08'.to_d           }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(11, 183)            }
    its(:gross_income) { should be == '10639.47826087'.to_d        }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '639.47826087'.to_d          }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(174, 523) }
    its(:gross_income) { should be == '149858.193548387096774194'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '49858.193548387096774194'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(144, 379) }
    its(:gross_income) { should be == '161278890.451612903225806452'.to_d }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '61278890.451612903225806452'.to_d }
  end
end
