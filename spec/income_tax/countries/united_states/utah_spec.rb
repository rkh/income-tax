describe IncomeTax::Countries::UnitedStates::Utah do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Utah') }
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 850                          }
    its(:taxes)        { should be == 150                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8500                         }
    its(:taxes)        { should be == 1500                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(98, 393)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75062.75".to_d              }
    its(:taxes)        { should be == "24937.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(45, 101)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55445495.75".to_d           }
    its(:taxes)        { should be == "44554504.25".to_d           }
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
    its(:rate)         { should be == Rational(28, 199)            }
    its(:gross_income) { should be == "1163.742690058479532".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "163.742690058479532".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(28, 199)            }
    its(:gross_income) { should be == "11637.42690058479531".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1637.42690058479531".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(29, 117)            }
    its(:gross_income) { should be == "132953.78289473684211".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32953.78289473684211".to_d  }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(104, 251)           }
    its(:gross_income) { should be == "170750747.7126176361".to_d  }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "70750747.7126176361".to_d   }
  end
end
