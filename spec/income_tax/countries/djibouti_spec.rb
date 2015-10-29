describe IncomeTax::Countries::Djibouti do
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
    its(:rate)         { should be == Rational(33, 230)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8565.16".to_d               }
    its(:taxes)        { should be == "1434.84".to_d               }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(131, 503)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "73957.24".to_d              }
    its(:taxes)        { should be == "26042.76".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(608, 2027)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "70003957.24".to_d           }
    its(:taxes)        { should be == "29996042.76".to_d           }
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
    its(:rate)         { should be == Rational(17, 112)            }
    its(:gross_income) { should be == "11789.45".to_d              }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1789.45".to_d               }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(125, 461)           }
    its(:gross_income) { should be == "137203.942857142857".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "37203.942857142857".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(797, 2657)          }
    its(:gross_income) { should be == "142851489.657142857".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "42851489.657142857".to_d    }
  end
end
