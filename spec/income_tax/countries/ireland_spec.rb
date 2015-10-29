describe IncomeTax::Countries::Ireland do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 800                          }
    its(:taxes)        { should be == 200                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8000                         }
    its(:taxes)        { should be == 2000                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(118, 355)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 66760                        }
    its(:taxes)        { should be == 33240                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1031, 2578)         }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 60006760                     }
    its(:taxes)        { should be == 39993240                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 1250                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 250                          }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 12500                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 2500                         }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(118, 331)           }
    its(:gross_income) { should be == 155400                       }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == 55400                        }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(1583, 3958)         }
    its(:gross_income) { should be == 166655400                    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == 66655400                     }
  end
end
