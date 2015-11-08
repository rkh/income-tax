describe IncomeTax::Countries::Germany do
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
    its(:rate)         { should be == Rational(1, 40)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9749.965".to_d              }
    its(:taxes)        { should be == "250.035".to_d               }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(21, 59)             }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "64406.41".to_d              }
    its(:taxes)        { should be == "35593.59".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(28, 59)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "52541652.12".to_d           }
    its(:taxes)        { should be == "47458347.88".to_d           }
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
    its(:rate)         { should be == Rational(11, 200)            }
    its(:gross_income) { should be == "1058.2010582010582".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "58.2010582010582".to_d      }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(69, 862)            }
    its(:gross_income) { should be == "10870.010582010582".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "870.010582010582".to_d      }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(199, 510)           }
    its(:gross_income) { should be == "163989.10582010582".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "63989.10582010582".to_d     }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(99, 212)            }
    its(:gross_income) { should be == "187609588.82010582".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "87609588.82010582".to_d     }
  end
end
