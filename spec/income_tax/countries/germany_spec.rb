describe IncomeTax::Countries::Germany do
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
    its(:rate)         { should be == Rational(11, 200)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 945                          }
    its(:taxes)        { should be == 55                           }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(17, 216)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9213                         }
    its(:taxes)        { should be == 787                          }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(144, 367)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 60762                        }
    its(:taxes)        { should be == 39238                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(261, 517)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 49515784                     }
    its(:taxes)        { should be == 50484216                     }
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
    its(:rate)         { should be == Rational(11, 200)            }
    its(:gross_income) { should be == "1058.2010582010582".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "58.2010582010582".to_d      }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(69, 862)            }
    its(:gross_income) { should be == "10870.010582010582".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "870.010582010582".to_d      }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(199, 510)           }
    its(:gross_income) { should be == "163989.10582010582".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "63989.10582010582".to_d     }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(99, 212)            }
    its(:gross_income) { should be == "187609588.82010582".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "87609588.82010582".to_d     }
  end
end
