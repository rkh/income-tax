describe IncomeTax::Countries::UnitedStates::Vermont do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Vermont') }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(41, 337)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8783.45".to_d               }
    its(:taxes)        { should be == "1216.55".to_d               }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(56, 221)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74659.7".to_d               }
    its(:taxes)        { should be == "25340.3".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(97, 200)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "51500408.7".to_d            }
    its(:taxes)        { should be == "48499591.3".to_d            }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == "1111.111111111111111".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "111.111111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(37, 314)            }
    its(:gross_income) { should be == "11335.631588042163459".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1335.631588042163459".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(103, 410)           }
    its(:gross_income) { should be == "133550.7659978308026".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33550.7659978308026".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(180, 419)           }
    its(:gross_income) { should be == "175311957.802504627".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "75311957.802504627".to_d    }
  end
end
