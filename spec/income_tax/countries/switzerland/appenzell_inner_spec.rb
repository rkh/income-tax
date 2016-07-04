describe IncomeTax::Countries::Switzerland::AppenzellInner do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Appenzell Inner Rhodes') }
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
    its(:rate)         { should be == Rational(1, 192) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9947.926827'.to_d           }
    its(:taxes)        { should be == '52.073173'.to_d             }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(43, 284) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '84859.267116'.to_d          }
    its(:taxes)        { should be == '15140.732884'.to_d          }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(136, 261) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '47893632.444953'.to_d       }
    its(:taxes)        { should be == '52106367.555047'.to_d       }
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
    its(:rate)         { should be == Rational(1, 191) }
    its(:gross_income) { should be == '10052.64702557880901829864'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '52.64702557880901829864'.to_d }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(121, 832) }
    its(:gross_income) { should be == '117019.45809458958863654636'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '17019.45809458958863654636'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(113, 284) }
    its(:gross_income) { should be == '166081508.79234403075945875291'.to_d }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '66081508.79234403075945875291'.to_d }
  end
end
