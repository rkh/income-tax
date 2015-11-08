describe IncomeTax::Countries::UnitedStates::Oregon do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Oregon') }
  let(:type) { :gross }

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
    its(:rate)         { should be == Rational(8, 59)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "864.4".to_d                 }
    its(:taxes)        { should be == "135.6".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(97, 621)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8437.92".to_d               }
    its(:taxes)        { should be == "1562.08".to_d               }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(110, 409)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "73105.0225".to_d            }
    its(:taxes)        { should be == "26894.9775".to_d            }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(199, 437)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "54462766.28275".to_d        }
    its(:taxes)        { should be == "45537233.71725".to_d        }
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
    its(:rate)         { should be == Rational(22, 167)            }
    its(:gross_income) { should be == "1151.711111111111111".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "151.711111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(64, 427)            }
    its(:gross_income) { should be == "11763.1911111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1763.1911111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(82, 307)            }
    its(:gross_income) { should be == "136442.705".to_d            }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "36442.705".to_d             }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(49, 114)            }
    its(:gross_income) { should be == "175386215.205880794".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "75386215.205880794".to_d    }
  end
end
