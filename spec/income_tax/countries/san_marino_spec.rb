describe IncomeTax::Countries::SanMarino do
  subject(:result) { described_class.new(income: income, income_type: type) }
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
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 880                          }
    its(:taxes)        { should be == 120                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(52, 421)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8764.811".to_d              }
    its(:taxes)        { should be == "1235.189".to_d              }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(49, 164)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "70122.5547".to_d            }
    its(:taxes)        { should be == "29877.4453".to_d            }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(820, 1641)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "50029489.6882".to_d         }
    its(:taxes)        { should be == "49970510.3118".to_d         }
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
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == "1136.36363636363636".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "136.363636363636364".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(25, 193)            }
    its(:gross_income) { should be == "11488.179518072289156627".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1488.179518072289156627".to_d }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(121, 364)           }
    its(:gross_income) { should be == "149795.742166666666666667".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "49795.742166666666666667".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1587, 3175)         }
    its(:gross_income) { should be == "199941020.6236".to_d        }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "99941020.6236".to_d         }
  end
end
