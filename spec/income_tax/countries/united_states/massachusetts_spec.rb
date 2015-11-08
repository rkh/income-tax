describe IncomeTax::Countries::UnitedStates::Massachusetts do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Massachusetts') }
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
    its(:rate)         { should be == Rational(183, 1208)          }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "848.5".to_d                 }
    its(:taxes)        { should be == "151.5".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(183, 1208)          }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8485                         }
    its(:taxes)        { should be == 1515                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(72, 287)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74912.75".to_d              }
    its(:taxes)        { should be == "25087.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(249, 557)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55295495.75".to_d           }
    its(:taxes)        { should be == "44704504.25".to_d           }
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
    its(:rate)         { should be == Rational(22, 155)            }
    its(:gross_income) { should be == "1165.40736835939788".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "165.40736835939788".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(22, 155)            }
    its(:gross_income) { should be == "11654.07368359397879".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1654.07368359397879".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(52, 209)            }
    its(:gross_income) { should be == "133120.25072482867686".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33120.25072482867686".to_d  }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(139, 335)           }
    its(:gross_income) { should be == "170917215.54270947".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "70917215.54270947".to_d     }
  end
end
