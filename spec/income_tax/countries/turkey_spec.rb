describe IncomeTax::Countries::Turkey do
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 850                          }
    its(:taxes)        { should be == 150                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8500                         }
    its(:taxes)        { should be == 1500                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(145, 564)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 74290                        }
    its(:taxes)        { should be == 25710                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(176, 503)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 65009290                     }
    its(:taxes)        { should be == 34990710                     }
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == "1176.47058823529412".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "176.470588235294118".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 19)              }
    its(:gross_income) { should be == 11875                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 1875                         }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(53, 187)            }
    its(:gross_income) { should be == "139553.846153846154".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "39553.8461538461538".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(253, 723)           }
    its(:gross_income) { should be == "153831861.538461538".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "53831861.5384615385".to_d   }
  end
end
