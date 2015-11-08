describe IncomeTax::Countries::UnitedStates::Maryland do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Maryland') }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(31, 244)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8729.5".to_d                }
    its(:taxes)        { should be == "1270.5".to_d                }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(71, 290)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75517.25".to_d              }
    its(:taxes)        { should be == "24482.75".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(135, 298)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "54697294.75".to_d           }
    its(:taxes)        { should be == "45302705.25".to_d           }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "1111.111111111111111".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "111.111111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(89, 727)            }
    its(:gross_income) { should be == "11395.100612423447058".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1395.100612423447058".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(25, 102)            }
    its(:gross_income) { should be == "132466.9407894736842".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32466.9407894736842".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(131, 314)           }
    its(:gross_income) { should be == "171586476.820533313".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "71586476.820533313".to_d    }
  end
end
