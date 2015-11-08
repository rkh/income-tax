describe IncomeTax::Countries::UnitedStates::Kentucky do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Kentucky') }
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
    its(:rate)         { should be == Rational(36, 301)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "880.4".to_d                 }
    its(:taxes)        { should be == "119.6".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(59, 423)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8605.16".to_d               }
    its(:taxes)        { should be == "1394.84".to_d               }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(85, 332)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74397.95".to_d              }
    its(:taxes)        { should be == "25602.05".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(251, 551)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "54445830.95".to_d           }
    its(:taxes)        { should be == "45554169.05".to_d           }
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
    its(:rate)         { should be == Rational(51, 440)            }
    its(:gross_income) { should be == "1131.111111111111111".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "131.111111111111111".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(43, 324)            }
    its(:gross_income) { should be == "11530.26185421089879".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1530.26185421089879".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(88, 349)            }
    its(:gross_income) { should be == "133717.0079787234043".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33717.0079787234043".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(304, 727)           }
    its(:gross_income) { should be == "171870211.9455403685".to_d  }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "71870211.9455403685".to_d   }
  end
end
