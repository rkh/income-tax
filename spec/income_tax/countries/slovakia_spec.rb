describe IncomeTax::Countries::Slovakia do
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
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 810                          }
    its(:taxes)        { should be == 190                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8100                         }
    its(:taxes)        { should be == 1900                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(25, 109)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "77064.06".to_d              }
    its(:taxes)        { should be == "22935.94".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(2040, 8161)         }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "75002064.06".to_d           }
    its(:taxes)        { should be == "24997935.94".to_d           }
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
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == "1234.5679012345679".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "234.5679012345679".to_d     }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == "12345.679012345679".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2345.679012345679".to_d     }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(63, 269)            }
    its(:gross_income) { should be == "130581.253333333333".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "30581.2533333333333".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(2453, 9813)         }
    its(:gross_income) { should be == "133330581.253333333".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "33330581.253333333".to_d    }
  end
end
