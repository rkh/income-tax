describe IncomeTax::Countries::SaintHelena do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 750                          }
    its(:taxes)        { should be == 250                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 7500                         }
    its(:taxes)        { should be == 2500                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 75000                        }
    its(:taxes)        { should be == 25000                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 75000000                     }
    its(:taxes)        { should be == 25000000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == "1333.33333333333333".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "333.33333333333333".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == "13333.3333333333333".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "3333.33333333333333".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == "133333.333333333333".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "33333.3333333333333".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == "133333333.333333333".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "33333333.3333333333".to_d   }
  end
end
