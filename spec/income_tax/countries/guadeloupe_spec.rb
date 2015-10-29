describe IncomeTax::Countries::Guadeloupe do
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
    its(:rate)         { should be == Rational(6, 253)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9762.785".to_d              }
    its(:taxes)        { should be == "237.215".to_d               }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(107, 383)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "72061.975".to_d             }
    its(:taxes)        { should be == "27938.025".to_d             }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(613, 1533)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "60012061.975".to_d          }
    its(:taxes)        { should be == "39987938.025".to_d          }
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
    its(:rate)         { should be == Rational(6, 245)             }
    its(:gross_income) { should be == "10251.021164021164".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "251.021164021164021".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(61, 192)            }
    its(:gross_income) { should be == "146563.375".to_d            }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "46563.375".to_d             }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(971, 2428)          }
    its(:gross_income) { should be == "166646563.375".to_d         }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "66646563.375".to_d          }
  end
end
