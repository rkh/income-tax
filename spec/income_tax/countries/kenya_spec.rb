describe IncomeTax::Countries::Kenya do
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
    its(:rate)         { should be == Rational(66, 263)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74905.6".to_d               }
    its(:taxes)        { should be == "25094.4".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(509, 1697)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "70004905.6".to_d            }
    its(:taxes)        { should be == "29995094.4".to_d            }
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
    its(:rate)         { should be == Rational(72, 689)            }
    its(:gross_income) { should be == "11166.8235294117647".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1166.82352941176471".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(19, 72)             }
    its(:gross_income) { should be == "135849.142857142857".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "35849.1428571428571".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(677, 2257)          }
    its(:gross_income) { should be == "142850134.857142857".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "42850134.857142857".to_d    }
  end
end
