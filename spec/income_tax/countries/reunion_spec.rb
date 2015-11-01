describe IncomeTax::Countries::Reunion do
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 230)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9956.6".to_d                }
    its(:taxes)        { should be == "43.4".to_d                  }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(64, 233)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "72531.78".to_d              }
    its(:taxes)        { should be == "27468.22".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(112, 249)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55019610.02".to_d           }
    its(:taxes)        { should be == "44980389.98".to_d           }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 199)             }
    its(:gross_income) { should be == "10050.46511627907".to_d     }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "50.465116279069767".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(142, 447)           }
    its(:gross_income) { should be == "146556.305084745763".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "46556.305084745763".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(193, 429)           }
    its(:gross_income) { should be == "181782527.236363636".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "81782527.236363636".to_d    }
  end
end
