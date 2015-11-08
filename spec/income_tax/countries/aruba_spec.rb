describe IncomeTax::Countries::Aruba do
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
    its(:rate)         { should be == Rational(33, 446)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 926                          }
    its(:taxes)        { should be == 74                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(30, 371)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9191.365".to_d              }
    its(:taxes)        { should be == "808.635".to_d               }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(103, 416)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75239.655".to_d             }
    its(:taxes)        { should be == "24760.345".to_d             }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(182, 309)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "41099412.638".to_d          }
    its(:taxes)        { should be == "58900587.362".to_d          }
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
    its(:rate)         { should be == Rational(33, 446)            }
    its(:gross_income) { should be == "1079.9136069114471".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "79.913606911447084".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(8, 97)              }
    its(:gross_income) { should be == "10898.9827682045581".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "898.9827682045581".to_d     }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(127, 411)           }
    its(:gross_income) { should be == "144717.78308823529".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "44717.7830882352941".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(518, 879)           }
    its(:gross_income) { should be == "243484987.483556638".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "143484987.483556638".to_d   }
  end
end
