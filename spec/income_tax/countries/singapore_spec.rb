describe IncomeTax::Countries::Singapore do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "tax year 2015" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(10, 177)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == 94350                        }
      its(:taxes)        { should be == 5650                         }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(177, 886)           }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == 80021650                     }
      its(:taxes)        { should be == 19978350                     }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(59, 983)            }
      its(:gross_income) { should be == "106384.180790960452".to_d   }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "6384.180790960452".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(219, 1096)          }
      its(:gross_income) { should be == "124972937.5".to_d           }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "24972937.5".to_d            }
    end
  end

  describe "tax year 2017" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2017                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2017                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2017                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2017                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(10, 177)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == 94350                        }
      its(:taxes)        { should be == 5650                         }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2017                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(69, 314)            }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == 78025850                     }
      its(:taxes)        { should be == 21974150                     }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2017                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2017                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2017                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2017                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(59, 983)            }
      its(:gross_income) { should be == "106384.180790960452".to_d   }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "6384.180790960452".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2017                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(91, 414)            }
      its(:gross_income) { should be == "128171987.179487179".to_d   }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "28171987.179487179".to_d    }
    end
  end
end
