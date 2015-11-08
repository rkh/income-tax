describe IncomeTax::Countries::UnitedStates::NorthDakota do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'North Dakota') }
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
    its(:rate)         { should be == Rational(39, 295)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "867.8".to_d                 }
    its(:taxes)        { should be == "132.2".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8800                         }
    its(:taxes)        { should be == 1200                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(38, 177)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "78530.6".to_d               }
    its(:taxes)        { should be == "21469.4".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(71, 166)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "57228747.65".to_d           }
    its(:taxes)        { should be == "42771252.35".to_d           }
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
    its(:rate)         { should be == Rational(27, 214)            }
    its(:gross_income) { should be == "1144.3824481642212577".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "144.3824481642212577".to_d  }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(31, 267)            }
    its(:gross_income) { should be == "11313.581246766101989".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1313.581246766101989".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(67, 296)            }
    its(:gross_income) { should be == "129258.3626445308503".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "29258.3626445308503".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(139, 341)           }
    its(:gross_income) { should be == "168811363.428130845".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "68811363.428130845".to_d    }
  end
end
