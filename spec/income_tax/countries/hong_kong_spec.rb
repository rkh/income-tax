describe IncomeTax::Countries::HongKong do
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
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 980                          }
    its(:taxes)        { should be == 20                           }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9800                         }
    its(:taxes)        { should be == 200                          }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 94000                        }
    its(:taxes)        { should be == 6000                         }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(44, 259)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 83012000                     }
    its(:taxes)        { should be == 16988000                     }
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
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == "1020.40816326530612".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "20.4081632653061224".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == "10204.0816326530612".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "204.081632653061224".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 47)              }
    its(:gross_income) { should be == "106818.181818181818".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "6818.1818181818182".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(35, 206)            }
    its(:gross_income) { should be == "120467469.879518072".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "20467469.879518072".to_d    }
  end
end
