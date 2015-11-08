describe IncomeTax::Countries::UnitedStates::Alabama do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Alabama') }
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
    its(:rate)         { should be == Rational(23, 179)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8715                         }
    its(:taxes)        { should be == 1285                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(34, 143)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "76224.6125".to_d            }
    its(:taxes)        { should be == "23775.3875".to_d            }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(152, 357)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "57423385.9625".to_d         }
    its(:taxes)        { should be == "42576614.0375".to_d         }
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
    its(:rate)         { should be == Rational(47, 372)            }
    its(:gross_income) { should be == "11446.1111111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1446.1111111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(67, 273)            }
    its(:gross_income) { should be == "132525.625".to_d            }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32525.625".to_d             }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(160, 387)           }
    its(:gross_income) { should be == "170487424.817880794".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "70487424.817880794".to_d    }
  end
end
