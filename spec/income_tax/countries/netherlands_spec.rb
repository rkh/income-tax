describe IncomeTax::Countries::Netherlands do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
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
    its(:rate)         { should be == Rational(21, 359)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "941.5".to_d                 }
    its(:taxes)        { should be == "58.5".to_d                  }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(21, 359)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9415                         }
    its(:taxes)        { should be == 585                          }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(69, 197)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "64973.9245".to_d            }
    its(:taxes)        { should be == "35026.0755".to_d            }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(118, 227)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "48016973.9245".to_d         }
    its(:taxes)        { should be == "51983026.0755".to_d         }
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
    its(:rate)         { should be == Rational(21, 359)            }
    its(:gross_income) { should be == "1062.13489113117366".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "62.134891131173659".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(21, 359)            }
    its(:gross_income) { should be == "10621.3489113117366".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "621.34891131173659".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(27, 64)             }
    its(:gross_income) { should be == "172970.990625".to_d         }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "72970.990625".to_d          }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(235, 452)           }
    its(:gross_income) { should be == "208297970.990625".to_d      }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "108297970.990625".to_d      }
  end
end
