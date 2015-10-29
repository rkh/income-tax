describe IncomeTax::Countries::Romania do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 840                          }
    its(:taxes)        { should be == 160                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8400                         }
    its(:taxes)        { should be == 1600                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 84000                        }
    its(:taxes)        { should be == 16000                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 84000000                     }
    its(:taxes)        { should be == 16000000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == "1190.47619047619048".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "190.476190476190476".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == "11904.7619047619048".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1904.76190476190476".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == "119047.619047619048".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "19047.6190476190476".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == "119047619.047619047".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "19047619.047619048".to_d    }
  end
end
