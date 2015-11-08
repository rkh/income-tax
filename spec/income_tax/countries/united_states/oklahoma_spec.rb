describe IncomeTax::Countries::UnitedStates::Oklahoma do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Oklahoma') }
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
    its(:rate)         { should be == Rational(64, 507)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8737.75".to_d               }
    its(:taxes)        { should be == "1262.25".to_d               }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(82, 329)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75075.5".to_d               }
    its(:taxes)        { should be == "24924.5".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(69, 154)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55195758.5".to_d            }
    its(:taxes)        { should be == "44804241.5".to_d            }
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
    its(:rate)         { should be == Rational(39, 320)            }
    its(:gross_income) { should be == "11387.89211374963353".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1387.89211374963353".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(29, 117)            }
    its(:gross_income) { should be == "132954.2133905013193".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32954.2133905013193".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(76, 183)            }
    its(:gross_income) { should be == "171028209.606798999".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "71028209.606798999".to_d    }
  end
end
