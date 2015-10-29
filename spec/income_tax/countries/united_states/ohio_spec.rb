describe IncomeTax::Countries::UnitedStates::Ohio do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Ohio') }
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
    its(:rate)         { should be == Rational(26, 245)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8938.75".to_d               }
    its(:taxes)        { should be == "1061.25".to_d               }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(69, 298)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "76846.28".to_d              }
    its(:taxes)        { should be == "23153.72".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(40, 89)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55056155.339".to_d          }
    its(:taxes)        { should be == "44943844.661".to_d          }
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
    its(:rate)         { should be == Rational(40, 381)            }
    its(:gross_income) { should be == "11173.023574469040949".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1173.023574469040949".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(59, 249)            }
    its(:gross_income) { should be == "131051.6176854754441".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "31051.6176854754441".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(42, 101)            }
    its(:gross_income) { should be == "171184085.263297672".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "71184085.263297672".to_d    }
  end
end
