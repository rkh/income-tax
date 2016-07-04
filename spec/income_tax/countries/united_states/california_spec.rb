describe IncomeTax::Countries::UnitedStates::California do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'California') }
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
    its(:rate)         { should be == Rational(40, 377) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8939.06'.to_d               }
    its(:taxes)        { should be == '1060.94'.to_d               }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(23, 87) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '73563.51'.to_d              }
    its(:taxes)        { should be == '26436.49'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(28, 53) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '47169131.25'.to_d           }
    its(:taxes)        { should be == '52830868.75'.to_d           }
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
    its(:rate)         { should be == Rational(36, 343)            }
    its(:gross_income) { should be == '11172.666666666666656'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1172.666666666666656'.to_d  }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(61, 236)            }
    its(:gross_income) { should be == '134856.26998346196251'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '34856.26998346196251'.to_d  }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(101, 226)           }
    its(:gross_income) { should be == '180800582.3207643'.to_d     }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '80800582.3207643'.to_d }
  end
end
