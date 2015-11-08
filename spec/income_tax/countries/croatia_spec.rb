describe IncomeTax::Countries::Croatia do
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
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 880                          }
    its(:taxes)        { should be == 120                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8800                         }
    its(:taxes)        { should be == 1200                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(11, 51)             }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 78432                        }
    its(:taxes)        { should be == 21568                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(395, 988)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 60019272                     }
    its(:taxes)        { should be == 39980728                     }
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
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == "1136.36363636363636".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "136.363636363636364".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == "11363.6363636363636".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1363.63636363636364".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(19, 74)             }
    its(:gross_income) { should be == "134546.666666666667".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "34546.6666666666667".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(637, 1593)          }
    its(:gross_income) { should be == "166634546.666666667".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "66634546.6666666667".to_d   }
  end
end
