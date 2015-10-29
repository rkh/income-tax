describe IncomeTax::Countries::Kosovo do
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
    its(:rate)         { should be == Rational(1, 622)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "998.4".to_d                 }
    its(:taxes)        { should be == "1.6".to_d                   }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(19, 259)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9266.4".to_d                }
    its(:taxes)        { should be == "733.6".to_d                 }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(11, 113)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "90266.4".to_d               }
    its(:taxes)        { should be == "9733.6".to_d                }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "90000266.4".to_d            }
    its(:taxes)        { should be == "9999733.6".to_d             }
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
    its(:rate)         { should be == Rational(1, 598)             }
    its(:gross_income) { should be == "1001.66666666666667".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "1.66666666666666667".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(15, 199)            }
    its(:gross_income) { should be == "10815.1111111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "815.11111111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(53, 543)            }
    its(:gross_income) { should be == "110815.111111111111".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "10815.1111111111111".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "111110815.11111111".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "11110815.1111111111".to_d   }
  end
end
