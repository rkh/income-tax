describe IncomeTax::Countries::Denmark do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 920                          }
    its(:taxes)        { should be == 80                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9200                         }
    its(:taxes)        { should be == 800                          }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(134, 545)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 75412                        }
    its(:taxes)        { should be == 24588                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(171, 389)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 56041882                     }
    its(:taxes)        { should be == 43958118                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == "1086.95652173913043".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "86.956521739130435".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == "10869.5652173913043".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "869.56521739130435".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(169, 602)           }
    its(:gross_income) { should be == "139028.571428571429".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "39028.571428571429".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(73, 166)            }
    its(:gross_income) { should be == "178496639.28571429".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "78496639.285714286".to_d    }
  end
end
