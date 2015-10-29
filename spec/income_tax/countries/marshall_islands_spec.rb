describe IncomeTax::Countries::MarshallIslands do
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
    its(:rate)         { should be == Rational(30, 259)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 88416                        }
    its(:taxes)        { should be == 11584                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 88000416                     }
    its(:taxes)        { should be == 11999584                     }
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
    its(:rate)         { should be == Rational(31, 379)            }
    its(:gross_income) { should be == "10890.909090909091".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "890.90909090909091".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(52, 447)            }
    its(:gross_income) { should be == "113163.636363636364".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "13163.6363636363636".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == "113635890.90909091".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "13635890.9090909091".to_d   }
  end
end
