describe IncomeTax::Countries::UnitedStates::Illinois do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Illinois') }
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
    its(:rate)         { should be == Rational(11, 80)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "862.5".to_d                 }
    its(:taxes)        { should be == "137.5".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(11, 80)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8625                         }
    its(:taxes)        { should be == 1375                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(158, 667)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "76312.75".to_d              }
    its(:taxes)        { should be == "23687.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(97, 224)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "56695495.75".to_d           }
    its(:taxes)        { should be == "43304504.25".to_d           }
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
    its(:rate)         { should be == Rational(89, 682)            }
    its(:gross_income) { should be == "1150.072150072150072".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "150.072150072150072".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(89, 682)            }
    its(:gross_income) { should be == "11500.72150072150071".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1500.72150072150071".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(175, 729)           }
    its(:gross_income) { should be == "131586.7288961038961".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "31586.7288961038961".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(213, 520)           }
    its(:gross_income) { should be == "169383693.7139846901".to_d  }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "69383693.7139846901".to_d   }
  end
end
