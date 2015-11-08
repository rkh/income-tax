describe IncomeTax::Countries::Eritrea do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 660                          }
    its(:taxes)        { should be == 340                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 6600                         }
    its(:taxes)        { should be == 3400                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 66000                        }
    its(:taxes)        { should be == 34000                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 66000000                     }
    its(:taxes)        { should be == 34000000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == "1515.15151515151515".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "515.15151515151515".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == "15151.5151515151515".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "5151.5151515151515".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == "151515.151515151515".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "51515.151515151515".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(17, 50)             }
    its(:gross_income) { should be == "151515151.51515152".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "51515151.515151515".to_d    }
  end
end
