describe IncomeTax::Countries::Kazakhstan do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9000                         }
    its(:taxes)        { should be == 1000                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 90000                        }
    its(:taxes)        { should be == 10000                        }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 90000000                     }
    its(:taxes)        { should be == 10000000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "1111.1111111111111".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "111.111111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "11111.1111111111111".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1111.1111111111111".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "111111.111111111111".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "11111.1111111111111".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "111111111.11111111".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "11111111.1111111111".to_d   }
  end
end
