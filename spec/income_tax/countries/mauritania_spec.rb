describe IncomeTax::Countries::Mauritania do
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
    its(:rate)         { should be == Rational(3, 20) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 85_000                        }
    its(:taxes)        { should be == 15_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(130, 329) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 60_486_000                     }
    its(:taxes)        { should be == 39_514_000                     }
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == '11764.705882352941'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1764.70588235294118'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == '117647.058823529412'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '17647.0588235294118'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(299, 753)           }
    its(:gross_income) { should be == '165856666.666666667'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '65856666.6666666667'.to_d }
  end
end
