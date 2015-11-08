describe IncomeTax::Countries::Venezuela do
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
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 940                          }
    its(:taxes)        { should be == 60                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9400                         }
    its(:taxes)        { should be == 600                          }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 94000                        }
    its(:taxes)        { should be == 6000                         }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(107, 316)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "66138648.44".to_d           }
    its(:taxes)        { should be == "33861351.56".to_d           }
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
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == "1063.82978723404255".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "63.8297872340425532".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == "10638.2978723404255".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "638.29787234042553".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == "106382.978723404255".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "6382.9787234042553".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(59, 174)            }
    its(:gross_income) { should be == "151305078.121212121".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "51305078.121212121".to_d    }
  end
end
