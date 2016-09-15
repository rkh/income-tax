describe IncomeTax::Countries::Switzerland::StGallen do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'St. Gallen') }
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
    its(:rate)         { should be == Rational(4, 351)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '988.604'.to_d               }
    its(:taxes)        { should be == '11.396'.to_d                }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(4, 351) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9886.04'.to_d               }
    its(:taxes)        { should be == '113.96'.to_d                }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(107, 473) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '77379.071319'.to_d          }
    its(:taxes)        { should be == '22620.928681'.to_d          }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(91, 107) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '14953149.6648'.to_d         }
    its(:taxes)        { should be == '85046850.3352'.to_d         }
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
    its(:rate)         { should be == Rational(3, 265)             }
    its(:gross_income) { should be == '1011.446364001607071054'.to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '11.446364001607071054'.to_d }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 265) }
    its(:gross_income) { should be == '10114.463640016070711058'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '114.463640016070711058'.to_d }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(82, 393) }
    its(:gross_income) { should be == '126365.48495938581446222766'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '26365.48495938581446222766'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(279, 520) }
    its(:gross_income) { should be == '215770832.00396017088043599659'.to_d }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '115770832.00396017088043599659'.to_d }
  end
end
