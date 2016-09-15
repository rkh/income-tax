describe IncomeTax::Countries::Philippines do
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 950                          }
    its(:taxes)        { should be == 50                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 20) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9500                         }
    its(:taxes)        { should be == 500                          }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(29, 200) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 85_500                        }
    its(:taxes)        { should be == 14_500                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(109, 341) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 68_035_000                     }
    its(:taxes)        { should be == 31_965_000                     }
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == '1052.63157894736842'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '52.631578947368421'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 19)              }
    its(:gross_income) { should be == '10555.5555555555556'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '555.55555555555556'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(29, 189) }
    its(:gross_income) { should be == 118_125                       }
    its(:net_income)   { should be == 100_000                       }
    its(:taxes)        { should be == 18_125                        }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(55, 172)            }
    its(:gross_income) { should be == '147007352.94117647'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '47007352.9411764706'.to_d }
  end
end
