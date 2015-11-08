describe IncomeTax::Countries::UnitedStates::Indiana do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Indiana') }
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
    its(:rate)         { should be == Rational(27, 203)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 867                          }
    its(:taxes)        { should be == 133                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(27, 203)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8670                         }
    its(:taxes)        { should be == 1330                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(56, 241)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "76762.75".to_d              }
    its(:taxes)        { should be == "23237.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1685, 3932)         }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "57145495.75".to_d           }
    its(:taxes)        { should be == "42854504.25".to_d           }
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
    its(:rate)         { should be == Rational(35, 276)            }
    its(:gross_income) { should be == "1145.2372745030449269".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "145.2372745030449269".to_d  }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(35, 276)            }
    its(:gross_income) { should be == "11452.37274503044926".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1452.37274503044926".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(79, 333)            }
    its(:gross_income) { should be == "131103.24133919338159".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "31103.24133919338159".to_d  }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(113, 277)           }
    its(:gross_income) { should be == "168900206.157074175".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "68900206.157074175".to_d    }
  end
end
