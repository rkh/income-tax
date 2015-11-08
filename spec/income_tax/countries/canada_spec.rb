describe IncomeTax::Countries::Canada do
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 850                          }
    its(:taxes)        { should be == 150                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8500                         }
    its(:taxes)        { should be == 1500                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(82, 425)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 80705                        }
    its(:taxes)        { should be == 19295                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(109, 376)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "71010862.55".to_d           }
    its(:taxes)        { should be == "28989137.45".to_d           }
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == "1176.47058823529412".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "176.470588235294118".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == "11764.705882352941".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1764.70588235294118".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(85, 411)            }
    its(:gross_income) { should be == "126074.324324324324".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "26074.3243243243243".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(69, 238)            }
    its(:gross_income) { should be == "140829771.056338028".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "40829771.056338028".to_d    }
  end
end
