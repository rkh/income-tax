describe IncomeTax::Countries::Montenegro do
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
    its(:rate)         { should be == Rational(9, 100)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 910                          }
    its(:taxes)        { should be == 90                           }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(16, 163)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9018.4".to_d                }
    its(:taxes)        { should be == "981.6".to_d                 }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(53, 366)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "85518.4".to_d               }
    its(:taxes)        { should be == "14481.6".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "85000518.4".to_d            }
    its(:taxes)        { should be == "14999481.6".to_d            }
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
    its(:rate)         { should be == Rational(9, 100)             }
    its(:gross_income) { should be == "1098.9010989010989".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "98.9010989010989".to_d      }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(41, 396)            }
    its(:gross_income) { should be == "11154.8235294117647".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1154.82352941176471".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(23, 158)            }
    its(:gross_income) { should be == "117037.176470588235".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "17037.1764705882353".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == "117646448.94117647".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "17646448.941176471".to_d    }
  end
end
