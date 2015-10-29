describe IncomeTax::Countries::UnitedStates::Arkansas do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Arkansas') }
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
    its(:rate)         { should be == Rational(39, 343)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8862.985".to_d              }
    its(:taxes)        { should be == "1137.015".to_d              }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(52, 201)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74129.19".to_d              }
    its(:taxes)        { should be == "25870.81".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(304, 653)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "53446562.19".to_d           }
    its(:taxes)        { should be == "46553437.81".to_d           }
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
    its(:rate)         { should be == Rational(89, 800)            }
    its(:gross_income) { should be == "11251.639316239316228".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1251.639316239316228".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(77, 303)            }
    its(:gross_income) { should be == "134070.79704301075269".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "34070.79704301075269".to_d  }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(46, 109)            }
    its(:gross_income) { should be == "173013324.8286334822".to_d  }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "73013324.8286334822".to_d   }
  end
end
