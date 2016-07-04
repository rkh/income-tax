describe IncomeTax::Countries::UnitedStates::Montana do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Montana') }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(37, 329) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8875.4'.to_d                }
    its(:taxes)        { should be == '1124.6'.to_d                }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(109, 440) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '75228.04025'.to_d           }
    its(:taxes)        { should be == '24771.95975'.to_d           }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(108, 247) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '56275446.16325'.to_d        }
    its(:taxes)        { should be == '43724553.83675'.to_d        }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == '1111.111111111111111'.to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '111.111111111111111'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(25, 222)            }
    its(:gross_income) { should be == '11268.9111111111111'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1268.9111111111111'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(139, 549)           }
    its(:gross_income) { should be == '133901.005'.to_d            }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '33901.005'.to_d             }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(97, 231)            }
    its(:gross_income) { should be == '172386900.197880794'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '72386900.197880794'.to_d }
  end
end
