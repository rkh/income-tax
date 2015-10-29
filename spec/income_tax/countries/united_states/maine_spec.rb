describe IncomeTax::Countries::UnitedStates::Maine do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Maine') }
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
    its(:rate)         { should be == Rational(38, 359)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8941.5".to_d                }
    its(:taxes)        { should be == "1058.5".to_d                }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(80, 297)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "73063.85".to_d              }
    its(:taxes)        { should be == "26936.15".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(276, 581)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "52496446.85".to_d           }
    its(:taxes)        { should be == "47503553.15".to_d           }
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
    its(:rate)         { should be == Rational(25, 238)            }
    its(:gross_income) { should be == "11173.6779560308972".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1173.6779560308972".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(6, 23)              }
    its(:gross_income) { should be == "135293.99273492667".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "35293.99273492667".to_d     }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(106, 249)           }
    its(:gross_income) { should be == "174123167.112829191".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "74123167.112829191".to_d    }
  end
end
