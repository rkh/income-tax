describe IncomeTax::Countries::Spain do
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
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 810                          }
    its(:taxes)        { should be == 190                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8100                         }
    its(:taxes)        { should be == 1900                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(191, 532)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "64098.5".to_d               }
    its(:taxes)        { should be == "35901.5".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(229, 509)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55009098.5".to_d            }
    its(:taxes)        { should be == "44990901.5".to_d            }
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
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == "1234.5679012345679".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "234.5679012345679".to_d     }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(19, 100)            }
    its(:gross_income) { should be == "12345.679012345679".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2345.679012345679".to_d     }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(47, 119)            }
    its(:gross_income) { should be == "165275.454545454545".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "65275.4545454545455".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(382, 849)           }
    its(:gross_income) { should be == "181801639.09090909".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "81801639.09090909".to_d     }
  end
end
