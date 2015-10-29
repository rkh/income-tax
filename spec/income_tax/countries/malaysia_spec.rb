describe IncomeTax::Countries::Malaysia do
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
    its(:rate)         { should be == Rational(1, 200)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9950                         }
    its(:taxes)        { should be == 50                           }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(52, 437)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 88100                        }
    its(:taxes)        { should be == 11900                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(383, 1533)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 75015350                     }
    its(:taxes)        { should be == 24984650                     }
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
    its(:gross_income) { should be == "10050.5050505050505".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "50.5050505050505051".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(31, 229)            }
    its(:gross_income) { should be == "115657.89473684211".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "15657.8947368421053".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(500, 2001)          }
    its(:gross_income) { should be == "133312866.666666667".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "33312866.6666666667".to_d   }
  end
end
