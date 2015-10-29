describe IncomeTax::Countries::UnitedStates::NewJersey do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'New Jersey') }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(42, 373)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8874                         }
    its(:taxes)        { should be == 1126                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(41, 170)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75882.7".to_d               }
    its(:taxes)        { should be == "24117.3".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(179, 369)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "51490711.7".to_d            }
    its(:taxes)        { should be == "48509288.3".to_d            }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "1111.111111111111111".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "111.111111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(14, 127)            }
    its(:gross_income) { should be == "11238.900157764255116".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1238.900157764255116".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(91, 374)            }
    its(:gross_income) { should be == "132155.0594761294457".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32155.0594761294457".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(58, 135)            }
    its(:gross_income) { should be == "175324768.824801589".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "75324768.824801589".to_d    }
  end
end
