describe IncomeTax::Countries::Zimbabwe do
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
    its(:rate)         { should be == Rational(16, 125)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8720                         }
    its(:taxes)        { should be == 1280                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(427, 1494)          }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 71420                        }
    its(:taxes)        { should be == 28580                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(726, 1453)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 50033420                     }
    its(:taxes)        { should be == 49966580                     }
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
    its(:rate)         { should be == Rational(4, 29)              }
    its(:gross_income) { should be == 11600                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 1600                         }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(57, 181)            }
    its(:gross_income) { should be == "145966.666666666667".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "45966.6666666666667".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1411, 2823)         }
    its(:gross_income) { should be == 199933160                    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == 99933160                     }
  end
end
