describe IncomeTax::Countries::Azerbaijan do
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
    its(:rate)         { should be == Rational(7, 50)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 860                          }
    its(:taxes)        { should be == 140                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(7, 50)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8600                         }
    its(:taxes)        { should be == 1400                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(74, 341)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 78300                        }
    its(:taxes)        { should be == 21700                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1454, 5817)         }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 75003300                     }
    its(:taxes)        { should be == 24996700                     }
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
    its(:rate)         { should be == Rational(7, 50)              }
    its(:gross_income) { should be == "1162.7906976744186".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "162.7906976744186".to_d     }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(7, 50)              }
    its(:gross_income) { should be == "11627.906976744186".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1627.906976744186".to_d     }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(57, 254)            }
    its(:gross_income) { should be == "128933.333333333333".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "28933.3333333333333".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1799, 7197)         }
    its(:gross_income) { should be == "133328933.333333333".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "33328933.3333333333".to_d   }
  end
end
