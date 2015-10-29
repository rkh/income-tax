describe IncomeTax::Countries::IsleOfMan do
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9000                         }
    its(:taxes)        { should be == 1000                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(29, 169)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 82840                        }
    its(:taxes)        { should be == 17160                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(9, 50)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 82000840                     }
    its(:taxes)        { should be == 17999160                     }
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
    its(:rate)         { should be == Rational(24, 229)            }
    its(:gross_income) { should be == "11170.7317073170732".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1170.73170731707317".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(104, 601)           }
    its(:gross_income) { should be == "120926.829268292683".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "20926.8292682926829".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(9, 50)              }
    its(:gross_income) { should be == "121950195.121951219".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "21950195.12195122".to_d     }
  end
end
