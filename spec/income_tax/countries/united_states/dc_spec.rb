describe IncomeTax::Countries::UnitedStates::Dc do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Washington, D.C.') }
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
    its(:rate)         { should be == Rational(207, 1553)          }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8667                         }
    its(:taxes)        { should be == 1333                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(97, 358)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "72905.125".to_d             }
    its(:taxes)        { should be == "27094.875".to_d             }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(178, 367)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "51498420.6625".to_d         }
    its(:taxes)        { should be == "48501579.3375".to_d         }
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
    its(:rate)         { should be == Rational(64, 503)            }
    its(:gross_income) { should be == "11457.9861111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1457.9861111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(38, 145)            }
    its(:gross_income) { should be == "135513.1659836065574".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "35513.1659836065574".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(119, 277)           }
    its(:gross_income) { should be == "175314141.259396444".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "75314141.259396444".to_d    }
  end
end
