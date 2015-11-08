describe IncomeTax::Countries::Switzerland::Schaffhausen do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Schaffhausen') }
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
    its(:rate)         { should be == Rational(15, 283)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 947                          }
    its(:taxes)        { should be == 53                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(13, 360)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9638.819204".to_d           }
    its(:taxes)        { should be == "361.180796".to_d            }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(44, 229)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "80785.864392".to_d          }
    its(:taxes)        { should be == "19214.135608".to_d          }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(169, 235)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "28085598.891728".to_d       }
    its(:taxes)        { should be == "71914401.108272".to_d       }
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
    its(:rate)         { should be == Rational(28, 543)            }
    its(:gross_income) { should be == "1054.35897435897435892".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "54.35897435897435892".to_d  }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(12, 341)            }
    its(:gross_income) { should be == "10364.7185660910835100482".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "364.7185660910835100482".to_d }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(27, 148)            }
    its(:gross_income) { should be == "122314.63715018898838151528".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "22314.63715018898838151528".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(119, 241)           }
    its(:gross_income) { should be == "197537312.90894628733017072428".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "97537312.90894628733017072428".to_d }
  end
end
