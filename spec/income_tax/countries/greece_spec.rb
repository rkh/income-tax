describe IncomeTax::Countries::Greece do
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
    its(:rate)         { should be == Rational(11, 50)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 780                          }
    its(:taxes)        { should be == 220                          }
  end

  describe "from gross income of 30000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 30000                                     }
    its(:rate)         { should be == Rational(71, 300)            }
    its(:gross_income) { should be == 30000                        }
    its(:net_income)   { should be == 22900                        }
    its(:taxes)        { should be == 7100                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(305, 864)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 64700                        }
    its(:taxes)        { should be == 35300                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(118, 281)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 58006700                     }
    its(:taxes)        { should be == 41993300                     }
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
    its(:rate)         { should be == Rational(11, 50)             }
    its(:gross_income) { should be == "1282.0512820512821".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "282.051282051282051".to_d   }
  end

  describe "from net income of 30000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 30000                                     }
    its(:rate)         { should be == Rational(71, 275)            }
    its(:gross_income) { should be == "40441.176470588235".to_d    }
    its(:net_income)   { should be == 30000                        }
    its(:taxes)        { should be == "10441.1764705882353".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(269, 711)           }
    its(:gross_income) { should be == "160862.068965517241".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "60862.068965517241".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(181, 431)           }
    its(:gross_income) { should be == "172402241.379310344".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "72402241.379310344".to_d    }
  end
end
