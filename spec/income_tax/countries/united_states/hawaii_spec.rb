describe IncomeTax::Countries::UnitedStates::Hawaii do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Hawaii') }
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
    its(:rate)         { should be == Rational(361, 2707)          }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8666.52".to_d               }
    its(:taxes)        { should be == "1333.48".to_d               }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(67, 245)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "72653.53".to_d              }
    its(:taxes)        { should be == "27346.47".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(46, 91)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "49451242.99".to_d           }
    its(:taxes)        { should be == "50548757.01".to_d           }
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
    its(:rate)         { should be == Rational(53, 415)            }
    its(:gross_income) { should be == "11463.99999999999999".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1463.99999999999999".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(49, 186)            }
    its(:gross_income) { should be == "135766.0691416893733".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "35766.0691416893733".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(137, 313)           }
    its(:gross_income) { should be == "177840682.806644838".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "77840682.806644838".to_d    }
  end
end
