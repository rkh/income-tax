describe IncomeTax::Countries::UnitedStates::Connecticut do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Connecticut') }
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
    its(:rate)         { should be == Rational(1, 10) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9000                         }
    its(:taxes)        { should be == 1000                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(85, 351) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '75782.75'.to_d              }
    its(:taxes)        { should be == '24217.25'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(290, 627) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '53748883.75'.to_d           }
    its(:taxes)        { should be == '46251116.25'.to_d           }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == '11111.1111111111111'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1111.1111111111111'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(106, 435)           }
    its(:gross_income) { should be == '132219.7255291005291'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '32219.7255291005291'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(109, 259)           }
    its(:gross_income) { should be == '172665094.641031919'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '72665094.641031919'.to_d }
  end
end
