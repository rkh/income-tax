describe IncomeTax::Countries::Luxembourg do
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(22, 249)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9116.42".to_d               }
    its(:taxes)        { should be == "883.58".to_d                }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1089, 3539)         }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "69229.59".to_d              }
    its(:taxes)        { should be == "30770.41".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(783, 1958)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "60009229.59".to_d           }
    its(:taxes)        { should be == "39990770.41".to_d           }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(27, 302)            }
    its(:gross_income) { should be == "10981.7555555555556".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "981.75555555555556".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(20, 59)             }
    its(:gross_income) { should be == "151284.016666666667".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "51284.016666666667".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1225, 3063)         }
    its(:gross_income) { should be == "166651284.016666666".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "66651284.016666666".to_d    }
  end
end
