describe IncomeTax::Countries::Togo do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 930                          }
    its(:taxes)        { should be == 70                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9300                         }
    its(:taxes)        { should be == 700                          }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 93000                        }
    its(:taxes)        { should be == 7000                         }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 93000000                     }
    its(:taxes)        { should be == 7000000                      }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == "1075.2688172043011".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "75.268817204301075".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == "10752.688172043011".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "752.68817204301075".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == "107526.88172043011".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "7526.8817204301075".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(7, 100)             }
    its(:gross_income) { should be == "107526881.72043011".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "7526881.7204301075".to_d    }
  end
end
