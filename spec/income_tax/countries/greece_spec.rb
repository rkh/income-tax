describe IncomeTax::Countries::Greece do
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
    its(:rate)         { should be == Rational(13, 50)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 740                          }
    its(:taxes)        { should be == 260                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(13, 50)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 7400                         }
    its(:taxes)        { should be == 2600                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(59, 200)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 70500                        }
    its(:taxes)        { should be == 29500                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(98, 297)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 67003500                     }
    its(:taxes)        { should be == 32996500                     }
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
    its(:rate)         { should be == Rational(13, 50)             }
    its(:gross_income) { should be == "1351.35135135135135".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "351.351351351351351".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(13, 50)             }
    its(:gross_income) { should be == "13513.5135135135135".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "3513.51351351351351".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(59, 193)            }
    its(:gross_income) { should be == "144029.850746268657".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "44029.8507462686567".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(131, 397)           }
    its(:gross_income) { should be == "149248507.462686567".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "49248507.462686567".to_d    }
  end
end
