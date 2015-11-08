describe IncomeTax::Countries::Brazil do
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
    its(:rate)         { should be == Rational(86, 447)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8076.15225".to_d            }
    its(:taxes)        { should be == "1923.84775".to_d            }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(219, 821)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "73326.15225".to_d           }
    its(:taxes)        { should be == "26673.84775".to_d           }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(11, 40)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "72500826.15225".to_d        }
    its(:taxes)        { should be == "27499173.84775".to_d        }
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
    its(:rate)         { should be == Rational(82, 391)            }
    its(:gross_income) { should be == "12653.583103448275862069".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2653.583103448275862069".to_d }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(39, 145)            }
    its(:gross_income) { should be == "136791.514137931034482759".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "36791.514137931034482759".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(11, 40)             }
    its(:gross_income) { should be == "137929894.962413793103448276".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "37929894.962413793103448276".to_d }
  end
end
