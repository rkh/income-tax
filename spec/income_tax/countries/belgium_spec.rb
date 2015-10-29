describe IncomeTax::Countries::Belgium do
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
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 750                          }
    its(:taxes)        { should be == 250                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(68, 265)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 7434                         }
    its(:taxes)        { should be == 2566                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(99, 218)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "54587.5".to_d               }
    its(:taxes)        { should be == "45412.5".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(4474, 8949)         }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "50004587.5".to_d            }
    its(:taxes)        { should be == "49995412.5".to_d            }
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
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == "1333.33333333333333".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "333.33333333333333".to_d    }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(40, 143)            }
    its(:gross_income) { should be == "13883.3333333333333".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "3883.33333333333333".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(99, 208)            }
    its(:gross_income) { should be == 190825                       }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == 90825                        }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(7590, 15181)        }
    its(:gross_income) { should be == 199990825                    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == 99990825                     }
  end
end
