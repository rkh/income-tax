describe IncomeTax::Countries::SouthAfrica do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
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
    its(:rate)         { should be == Rational(9, 50)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 820                          }
    its(:taxes)        { should be == 180                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(9, 50) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8200                         }
    its(:taxes)        { should be == 1800                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(9, 50) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 82_000                        }
    its(:taxes)        { should be == 18_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(151, 369) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 59_078_946                     }
    its(:taxes)        { should be == 40_921_054                     }
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
    its(:rate)         { should be == Rational(9, 50)              }
    its(:gross_income) { should be == '1219.51219512195122'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '219.51219512195122'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(9, 50)              }
    its(:gross_income) { should be == '12195.1219512195122'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '2195.1219512195122'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(9, 50)              }
    its(:gross_income) { should be == '121951.219512195122'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '21951.219512195122'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(206, 503)           }
    its(:gross_income) { should be == '169357718.6440678'.to_d     }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '69357718.6440678'.to_d }
  end
end
