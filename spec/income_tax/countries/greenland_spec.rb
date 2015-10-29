describe IncomeTax::Countries::Greenland do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 630                          }
    its(:taxes)        { should be == 370                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 6300                         }
    its(:taxes)        { should be == 3700                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 63000                        }
    its(:taxes)        { should be == 37000                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 63000000                     }
    its(:taxes)        { should be == 37000000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == "1587.3015873015873".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "587.3015873015873".to_d     }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == "15873.015873015873".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "5873.015873015873".to_d     }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == "158730.15873015873".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "58730.15873015873".to_d     }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == "158730158.73015873".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "58730158.73015873".to_d     }
  end
end
