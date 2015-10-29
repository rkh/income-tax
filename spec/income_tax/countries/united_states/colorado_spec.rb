describe IncomeTax::Countries::UnitedStates::Colorado do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Colorado') }
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
    its(:rate)         { should be == Rational(73, 499)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "853.7".to_d                 }
    its(:taxes)        { should be == "146.3".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(73, 499)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8537                         }
    its(:taxes)        { should be == 1463                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(71, 289)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75432.75".to_d              }
    its(:taxes)        { should be == "24567.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(414, 937)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55815495.75".to_d           }
    its(:taxes)        { should be == "44184504.25".to_d           }
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
    its(:rate)         { should be == Rational(19, 138)            }
    its(:gross_income) { should be == "1159.658872461640628".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "159.658872461640628".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(19, 138)            }
    its(:gross_income) { should be == "11596.588724616406266".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1596.588724616406266".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(55, 224)            }
    its(:gross_income) { should be == "132545.4011350529517".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32545.4011350529517".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(102, 247)           }
    its(:gross_income) { should be == "170342365.952933745".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "70342365.952933745".to_d    }
  end
end
