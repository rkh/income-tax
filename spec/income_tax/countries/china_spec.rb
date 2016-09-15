describe IncomeTax::Countries::China do
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
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 970                          }
    its(:taxes)        { should be == 30                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(17, 200) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9150                         }
    its(:taxes)        { should be == 850                          }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(118, 393) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 69_975                        }
    its(:taxes)        { should be == 30_025                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(148, 329) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 55_014_975                     }
    its(:taxes)        { should be == 44_985_025                     }
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
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == '1030.92783505154639'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '30.9278350515463918'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(17, 177)            }
    its(:gross_income) { should be == '11062.5'.to_d               }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1062.5'.to_d                }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(107, 303)           }
    its(:gross_income) { should be == '154590.90909090909'.to_d    }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '54590.909090909091'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(247, 549)           }
    its(:gross_income) { should be == '181790954.545454545'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '81790954.545454545'.to_d }
  end
end
