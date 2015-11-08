describe IncomeTax::Countries::CongoRepublic do
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
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 990                          }
    its(:taxes)        { should be == 10                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9900                         }
    its(:taxes)        { should be == 100                          }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 99000                        }
    its(:taxes)        { should be == 1000                         }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(171, 389)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 56041760                     }
    its(:taxes)        { should be == 43958240                     }
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
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == "1010.10101010101".to_d      }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "10.1010101010101".to_d      }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == "10101.0101010101".to_d      }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "101.01010101010101".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == "101010.101010101".to_d      }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "1010.10101010101".to_d      }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(203, 457)           }
    its(:gross_income) { should be == "179924072.727272727".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "79924072.727272727".to_d    }
  end
end
