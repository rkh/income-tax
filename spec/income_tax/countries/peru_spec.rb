describe IncomeTax::Countries::Peru do
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
    its(:rate)         { should be == Rational(9, 40) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 77_500                        }
    its(:taxes)        { should be == 22_500                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(353, 1177) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 70_007_500                     }
    its(:taxes)        { should be == 29_992_500                     }
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
    its(:rate)         { should be == Rational(9, 37)              }
    its(:gross_income) { should be == '132142.857142857143'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '32142.857142857143'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(482, 1607)          }
    its(:gross_income) { should be == '142846428.571428571'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '42846428.5714285714'.to_d }
  end
end
