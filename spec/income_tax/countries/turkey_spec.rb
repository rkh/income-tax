describe IncomeTax::Countries::Turkey do
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 850                          }
    its(:taxes)        { should be == 150                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 20) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8500                         }
    its(:taxes)        { should be == 1500                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(145, 564) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 74_290                        }
    its(:taxes)        { should be == 25_710                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(176, 503) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 65_009_290                     }
    its(:taxes)        { should be == 34_990_710                     }
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == '1176.47058823529412'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '176.470588235294118'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 19) }
    its(:gross_income) { should be == 11_875                        }
    its(:net_income)   { should be == 10_000                        }
    its(:taxes)        { should be == 1875                         }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(53, 187)            }
    its(:gross_income) { should be == '139553.846153846154'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '39553.8461538461538'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(253, 723)           }
    its(:gross_income) { should be == '153831861.538461538'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '53831861.5384615385'.to_d }
  end
end
