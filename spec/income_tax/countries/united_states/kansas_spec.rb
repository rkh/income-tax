describe IncomeTax::Countries::UnitedStates::Kansas do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Kansas') }
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
    its(:rate)         { should be == Rational(26, 215) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8790.75'.to_d               }
    its(:taxes)        { should be == '1209.25'.to_d               }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(62, 255) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '75685.75'.to_d              }
    its(:taxes)        { should be == '24314.25'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(55, 124) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '55645918.75'.to_d           }
    its(:taxes)        { should be == '44354081.25'.to_d           }
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
    its(:rate)         { should be == Rational(37, 316)            }
    its(:gross_income) { should be == '11326.167637318716444'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1326.167637318716444'.to_d  }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(72, 295)            }
    its(:gross_income) { should be == '132288.3140756302521'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '32288.3140756302521'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(67, 162)            }
    its(:gross_income) { should be == '170529162.2968723906'.to_d  }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '70529162.2968723906'.to_d }
  end
end
