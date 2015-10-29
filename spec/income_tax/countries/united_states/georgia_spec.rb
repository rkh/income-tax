describe IncomeTax::Countries::UnitedStates::Georgia do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Georgia') }
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
    its(:rate)         { should be == Rational(75, 601)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8752                         }
    its(:taxes)        { should be == 1248                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(131, 512)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74414.75".to_d              }
    its(:taxes)        { should be == "25585.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(251, 551)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "54445847.75".to_d           }
    its(:taxes)        { should be == "45554152.25".to_d           }
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
    its(:rate)         { should be == Rational(11, 91)             }
    its(:gross_income) { should be == "11374.940898345153653".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1374.940898345153653".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(92, 365)            }
    its(:gross_income) { should be == "133699.1356382978723".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33699.1356382978723".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(304, 727)           }
    its(:gross_income) { should be == "171870194.0731999429".to_d  }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "71870194.0731999429".to_d   }
  end
end
