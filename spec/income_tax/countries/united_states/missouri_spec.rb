describe IncomeTax::Countries::UnitedStates::Missouri do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Missouri') }
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
    its(:rate)         { should be == Rational(44, 365) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8794.5'.to_d                }
    its(:taxes)        { should be == '1205.5'.to_d                }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(10, 41) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '75609.985'.to_d             }
    its(:taxes)        { should be == '24390.015'.to_d             }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(19, 44) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '56819117.005'.to_d          }
    its(:taxes)        { should be == '43180882.995'.to_d          }
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
    its(:rate)         { should be == Rational(25, 208)            }
    its(:gross_income) { should be == '11366.1111111111111'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1366.1111111111111'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1378, 5511)         }
    its(:gross_income) { should be == '133339.625'.to_d            }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '33339.625'.to_d             }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(168, 403)           }
    its(:gross_income) { should be == '171487238.817880794'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '71487238.817880794'.to_d }
  end
end
