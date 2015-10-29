describe IncomeTax::Countries::UnitedStates::Mississippi do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Mississippi') }
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
    its(:rate)         { should be == Rational(14, 125)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8880                         }
    its(:taxes)        { should be == 1120                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(143, 584)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75512.75".to_d              }
    its(:taxes)        { should be == "24487.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(45, 101)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55445945.75".to_d           }
    its(:taxes)        { should be == "44554054.25".to_d           }
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
    its(:rate)         { should be == Rational(41, 373)            }
    its(:gross_income) { should be == "11234.822451317296667".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1234.822451317296667".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(38, 155)            }
    its(:gross_income) { should be == "132480.0986842105263".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32480.0986842105263".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(104, 251)           }
    its(:gross_income) { should be == "170750274.02840710979".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "70750274.02840710979".to_d  }
  end
end
