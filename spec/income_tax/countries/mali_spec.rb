describe IncomeTax::Countries::Mali do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 970                          }
    its(:taxes)        { should be == 30                           }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9700                         }
    its(:taxes)        { should be == 300                          }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 97000                        }
    its(:taxes)        { should be == 3000                         }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 97000000                     }
    its(:taxes)        { should be == 3000000                      }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == "1030.92783505154639".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "30.9278350515463918".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == "10309.2783505154639".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "309.27835051546392".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == "103092.783505154639".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "3092.7835051546392".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 100)             }
    its(:gross_income) { should be == "103092783.505154639".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "3092783.5051546392".to_d    }
  end
end
