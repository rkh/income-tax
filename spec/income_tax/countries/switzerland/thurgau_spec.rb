describe IncomeTax::Countries::Switzerland::Thurgau do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Thurgau') }
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
    its(:rate)         { should be == Rational(4, 447)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '991.058'.to_d               }
    its(:taxes)        { should be == '8.942'.to_d                 }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(4, 447) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9910.58'.to_d               }
    its(:taxes)        { should be == '89.42'.to_d                 }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(41, 186) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '77957.811191'.to_d          }
    its(:taxes)        { should be == '22042.188809'.to_d          }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(287, 338) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '15089564.985373'.to_d       }
    its(:taxes)        { should be == '84910435.014627'.to_d       }
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
    its(:rate)         { should be == Rational(2, 225)             }
    its(:gross_income) { should be == '1008.9725065221753963353'.to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '8.9725065221753963353'.to_d }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(2, 225) }
    its(:gross_income) { should be == '10089.725065221753963353'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '89.725065221753963353'.to_d }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(37, 182) }
    its(:gross_income) { should be == '125517.406165938413853163'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '25517.406165938413853163'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(193, 361) }
    its(:gross_income) { should be == '214882532.10033034965433726545'.to_d }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '114882532.10033034965433726545'.to_d }
  end
end
