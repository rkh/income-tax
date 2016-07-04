describe IncomeTax::Countries::UnitedStates::RhodeIsland do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Rhode Island') }
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
    its(:rate)         { should be == Rational(44, 357) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8767.5'.to_d                }
    its(:taxes)        { should be == '1232.5'.to_d                }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(159, 665) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '76089.25'.to_d              }
    its(:taxes)        { should be == '23910.75'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(143, 314) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '54457999.57'.to_d           }
    its(:taxes)        { should be == '45542000.43'.to_d           }
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
    its(:rate)         { should be == Rational(28, 235)            }
    its(:gross_income) { should be == '11352.669552669552658'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1352.669552669552658'.to_d  }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(65, 269)            }
    its(:gross_income) { should be == '131862.2785433070866'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '31862.2785433070866'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(120, 287)           }
    its(:gross_income) { should be == '171856589.052004823'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '71856589.052004823'.to_d }
  end
end
