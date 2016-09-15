describe IncomeTax::Countries::Yemen do
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
    its(:rate)         { should be == Rational(1, 20) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 95_000                        }
    its(:taxes)        { should be == 5000                         }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(31, 207) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 85_024_000                     }
    its(:taxes)        { should be == 14_976_000                     }
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == '10526.3157894736842'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '526.31578947368421'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == '105263.157894736842'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '5263.15789473684211'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(37, 247)            }
    its(:gross_income) { should be == '117618823.529411764'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '17618823.5294117647'.to_d }
  end
end
