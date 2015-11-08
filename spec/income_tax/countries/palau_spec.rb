describe IncomeTax::Countries::Palau do
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
    its(:rate)         { should be == Rational(69, 742)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 907                          }
    its(:taxes)        { should be == 93                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(13, 107)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8785                         }
    its(:taxes)        { should be == 1215                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(93, 512)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 81835                        }
    its(:taxes)        { should be == 18165                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(39, 199)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 80401435                     }
    its(:taxes)        { should be == 19598565                     }
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
    its(:rate)         { should be == Rational(69, 742)            }
    its(:gross_income) { should be == "1102.53583241455347".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "102.535832414553473".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(211, 1687)          }
    its(:gross_income) { should be == "11429.4117647058824".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1429.41176470588235".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(54, 293)            }
    its(:gross_income) { should be == "122593.283582089552".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "22593.2835820895522".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(39, 199)            }
    its(:gross_income) { should be == "124376324.626865671".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "24376324.626865671".to_d    }
  end
end
