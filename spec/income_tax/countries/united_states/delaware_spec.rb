describe IncomeTax::Countries::UnitedStates::Delaware do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Delaware') }
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
    its(:rate)         { should be == Rational(47, 374)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8743.29".to_d               }
    its(:taxes)        { should be == "1256.71".to_d               }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(62, 243)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74486.51".to_d              }
    its(:taxes)        { should be == "25513.49".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(6, 13)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "53846519.51".to_d           }
    its(:taxes)        { should be == "46153480.49".to_d           }
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
    its(:rate)         { should be == Rational(89, 734)            }
    its(:gross_income) { should be == "11379.724556489262361".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1379.724556489262361".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(103, 409)           }
    its(:gross_income) { should be == "133660.9033725910064".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33660.9033725910064".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(230, 547)           }
    its(:gross_income) { should be == "172552874.871413984".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "72552874.871413984".to_d    }
  end
end
