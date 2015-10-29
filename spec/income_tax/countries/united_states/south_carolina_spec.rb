describe IncomeTax::Countries::UnitedStates::SouthCarolina do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'South Carolina') }
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
    its(:rate)         { should be == Rational(11, 100)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8900                         }
    its(:taxes)        { should be == 1100                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(39, 149)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "73825.35".to_d              }
    its(:taxes)        { should be == "26174.65".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(277, 595)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "53446258.35".to_d           }
    its(:taxes)        { should be == "46553741.65".to_d           }
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
    its(:rate)         { should be == Rational(35, 323)            }
    its(:gross_income) { should be == "11215.277777777777767".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1215.277777777777767".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(97, 379)            }
    its(:gross_income) { should be == "134397.5067204301075".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "34397.5067204301075".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(46, 109)            }
    its(:gross_income) { should be == "173013651.5383109015".to_d  }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "73013651.5383109015".to_d   }
  end
end
