describe IncomeTax::Countries::UnitedStates::NewMexico do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'New Mexico') }
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
    its(:rate)         { should be == Rational(74, 665) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8887.3'.to_d                }
    its(:taxes)        { should be == '1112.7'.to_d                }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(77, 316) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '75633.35'.to_d              }
    its(:taxes)        { should be == '24366.65'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(469, 1055) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '55545966.35'.to_d           }
    its(:taxes)        { should be == '44454033.65'.to_d           }
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
    its(:rate)         { should be == Rational(34, 311)            }
    its(:gross_income) { should be == '11227.536730945821844'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1227.536730945821844'.to_d  }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(153, 626)           }
    its(:gross_income) { should be == '132348.24855415352261'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '32348.24855415352261'.to_d  }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(77, 186)            }
    its(:gross_income) { should be == '170639566.053422329'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '70639566.053422329'.to_d }
  end
end
