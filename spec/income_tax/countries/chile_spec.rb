describe IncomeTax::Countries::Chile do
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(84, 319)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 73668000                     }
    its(:taxes)        { should be == 26332000                     }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(61, 200)            }
    its(:gross_income) { should be == "143886666.666666667".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "43886666.666666667".to_d    }
  end
end
