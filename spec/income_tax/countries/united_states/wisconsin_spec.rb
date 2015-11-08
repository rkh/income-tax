describe IncomeTax::Countries::UnitedStates::Wisconsin do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Wisconsin') }
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
    its(:rate)         { should be == Rational(14, 125)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 888                          }
    its(:taxes)        { should be == 112                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(45, 328)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8628                         }
    its(:taxes)        { should be == 1372                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(67, 259)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74131.21".to_d              }
    its(:taxes)        { should be == "25868.79".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(59, 125)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "52799158.492".to_d          }
    its(:taxes)        { should be == "47200841.508".to_d          }
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
    its(:rate)         { should be == Rational(56, 509)            }
    its(:gross_income) { should be == "1123.611111111111111".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "123.611111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(52, 399)            }
    its(:gross_income) { should be == "11498.6111111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1498.6111111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(33, 130)            }
    its(:gross_income) { should be == "134018.95104288915".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "34018.95104288915".to_d     }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(239, 563)           }
    its(:gross_income) { should be == "173767326.967853723".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "73767326.967853723".to_d    }
  end
end
