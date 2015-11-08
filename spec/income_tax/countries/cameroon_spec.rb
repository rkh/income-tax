describe IncomeTax::Countries::Cameroon do
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
    its(:rate)         { should be == Rational(11, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 890                          }
    its(:taxes)        { should be == 110                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(11, 100)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8900                         }
    its(:taxes)        { should be == 1100                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(11, 100)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 89000                        }
    its(:taxes)        { should be == 11000                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(428, 1141)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 62490000                     }
    its(:taxes)        { should be == 37510000                     }
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
    its(:rate)         { should be == Rational(11, 100)            }
    its(:gross_income) { should be == "1123.59550561797753".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "123.595505617977528".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(11, 100)            }
    its(:gross_income) { should be == "11235.9550561797753".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1235.95505617977528".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(11, 100)            }
    its(:gross_income) { should be == "112359.550561797753".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "12359.5505617977528".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(86, 227)            }
    its(:gross_income) { should be == "160991869.918699186".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "60991869.918699186".to_d    }
  end
end
