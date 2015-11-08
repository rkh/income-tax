describe IncomeTax::Countries::Libya do
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 950                          }
    its(:taxes)        { should be == 50                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9500                         }
    its(:taxes)        { should be == 500                          }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(36, 383)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 90600                        }
    its(:taxes)        { should be == 9400                         }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 90000600                     }
    its(:taxes)        { should be == 9999400                      }
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == "1052.63157894736842".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "52.631578947368421".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == "10526.3157894736842".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "526.31578947368421".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(40, 423)            }
    its(:gross_income) { should be == "110444.444444444444".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "10444.4444444444444".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "111110444.444444444".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "11110444.4444444444".to_d   }
  end
end
