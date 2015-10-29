describe IncomeTax::Countries::SouthKorea do
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
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 920                          }
    its(:taxes)        { should be == 80                           }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9200                         }
    its(:taxes)        { should be == 800                          }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 92000                        }
    its(:taxes)        { should be == 8000                         }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(24, 103)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 76700000                     }
    its(:taxes)        { should be == 23300000                     }
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
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == "1086.95652173913043".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "86.956521739130435".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == "10869.5652173913043".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "869.56521739130435".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == "108695.652173913043".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "8695.6521739130435".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(157, 595)           }
    its(:gross_income) { should be == "135846153.846153846".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "35846153.846153846".to_d    }
  end
end
