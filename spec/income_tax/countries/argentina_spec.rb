describe IncomeTax::Countries::Argentina do
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
    its(:rate)         { should be == Rational(9, 100)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 910                          }
    its(:taxes)        { should be == 90                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(9, 100) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9100                         }
    its(:taxes)        { should be == 900                          }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(64, 287) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 77_700                        }
    its(:taxes)        { should be == 22_300                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(127, 363) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 65_013_500                     }
    its(:taxes)        { should be == 34_986_500                     }
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
    its(:rate)         { should be == Rational(9, 100)             }
    its(:gross_income) { should be == '1098.9010989010989'.to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '98.9010989010989'.to_d      }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(9, 95)              }
    its(:gross_income) { should be == '11046.5116279069767'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1046.51162790697674'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(43, 173)            }
    its(:gross_income) { should be == '133076.923076923077'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '33076.923076923077'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(183, 523)           }
    its(:gross_income) { should be == '153825384.61538462'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '53825384.6153846154'.to_d }
  end
end
