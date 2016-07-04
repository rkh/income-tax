describe IncomeTax::Countries::Switzerland::Solothurn do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Solothurn') }
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
    its(:rate)         { should be == Rational(73, 225)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '675.559603'.to_d            }
    its(:taxes)        { should be == '324.440397'.to_d            }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(16, 253) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9367.543549'.to_d           }
    its(:taxes)        { should be == '632.456451'.to_d            }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(67, 317) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '78864.967226'.to_d          }
    its(:taxes)        { should be == '21135.032774'.to_d          }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(151, 1238) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '87803868.6496'.to_d         }
    its(:taxes)        { should be == '12196131.3504'.to_d         }
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
    its(:rate)         { should be == Rational(73, 283)            }
    its(:gross_income) { should be == '1347.62712632594021214934'.to_d }
    its(:net_income)   { should be == 1000 }
    its(:taxes)        { should be == '347.62712632594021214934'.to_d }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(7, 117) }
    its(:gross_income) { should be == '10636.26801468369707331862'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '636.26801468369707331862'.to_d }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(43, 217) }
    its(:gross_income) { should be == '124712.72390489812115758449'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '24712.72390489812115758449'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(23, 191)            }
    its(:gross_income) { should be == '113690481.6432813559'.to_d  }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '13690481.6432813559'.to_d }
  end
end
