describe IncomeTax::Countries::Niue do
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(43, 250)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8280                         }
    its(:taxes)        { should be == 1720                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(123, 269)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 54275                        }
    its(:taxes)        { should be == 45725                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(4739, 9479)         }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 50004275                     }
    its(:taxes)        { should be == 49995725                     }
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
    its(:gross_income) { should be == "1111.1111111111111".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "111.111111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(43, 193)            }
    its(:gross_income) { should be == "12866.6666666666667".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2866.66666666666667".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(107, 224)           }
    its(:gross_income) { should be == 191450                       }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == 91450                        }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(7968, 15937)        }
    its(:gross_income) { should be == 199991450                    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == 99991450                     }
  end
end
