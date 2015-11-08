describe IncomeTax::Countries::UnitedStates::Louisiana do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Louisiana') }
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
    its(:rate)         { should be == Rational(23, 211)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8910                         }
    its(:taxes)        { should be == 1090                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(62, 267)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "76778.985".to_d             }
    its(:taxes)        { should be == "23221.015".to_d             }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(326, 755)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "56820286.005".to_d          }
    its(:taxes)        { should be == "43179713.995".to_d          }
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
    its(:rate)         { should be == Rational(37, 340)            }
    its(:gross_income) { should be == "11221.1111111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1221.1111111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(83, 341)            }
    its(:gross_income) { should be == "132170.625".to_d            }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32170.625".to_d             }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(173, 415)           }
    its(:gross_income) { should be == "171486069.817880794".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "71486069.817880794".to_d    }
  end
end
