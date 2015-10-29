describe IncomeTax::Countries::Tunisia do
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
    its(:rate)         { should be == Rational(52, 341)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8475                         }
    its(:taxes)        { should be == 1525                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(163, 534)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 69475                        }
    its(:taxes)        { should be == 30525                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(323, 923)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 65004475                     }
    its(:taxes)        { should be == 34995525                     }
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
    its(:rate)         { should be == Rational(49, 290)            }
    its(:gross_income) { should be == "12033.3333333333333".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2033.33333333333333".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(85, 266)            }
    its(:gross_income) { should be == "146961.538461538462".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "46961.538461538462".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(449, 1283)          }
    its(:gross_income) { should be == "153839269.23076923".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "53839269.230769231".to_d    }
  end
end
