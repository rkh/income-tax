describe IncomeTax::Countries::UnitedStates::WestVirginia do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'West Virginia') }
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
    its(:rate)         { should be == Rational(31, 250)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8760                         }
    its(:taxes)        { should be == 1240                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(69, 274)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74817.75".to_d              }
    its(:taxes)        { should be == "25182.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(35, 76)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "53946750.75".to_d           }
    its(:taxes)        { should be == "46053249.25".to_d           }
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
    its(:rate)         { should be == Rational(36, 301)            }
    its(:gross_income) { should be == "11358.533791523482234".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1358.533791523482234".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(319, 1277)          }
    its(:gross_income) { should be == "133300.2506684491979".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33300.2506684491979".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(92, 219)            }
    its(:gross_income) { should be == "172438119.2296454999".to_d  }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "72438119.2296454999".to_d   }
  end
end
