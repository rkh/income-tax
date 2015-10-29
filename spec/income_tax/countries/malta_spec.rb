describe IncomeTax::Countries::Malta do
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
    its(:rate)         { should be == Rational(7, 311)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9775                         }
    its(:taxes)        { should be == 225                          }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(67, 255)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 73725                        }
    its(:taxes)        { should be == 26275                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(183, 523)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 65008725                     }
    its(:taxes)        { should be == 34991275                     }
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
    its(:rate)         { should be == Rational(9, 349)             }
    its(:gross_income) { should be == "10264.705882352941".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "264.705882352941176".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(211, 733)           }
    its(:gross_income) { should be == "140423.076923076923".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "40423.076923076923".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(267, 763)           }
    its(:gross_income) { should be == "153832730.769230769".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "53832730.769230769".to_d    }
  end
end
