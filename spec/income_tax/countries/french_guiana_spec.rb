describe IncomeTax::Countries::FrenchGuiana do
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(5, 228)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9780.605".to_d              }
    its(:taxes)        { should be == "219.395".to_d               }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(19, 69)             }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "72464.47".to_d              }
    its(:taxes)        { should be == "27535.53".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(112, 249)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "55019512.47".to_d           }
    its(:taxes)        { should be == "44980487.53".to_d           }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(11, 485)            }
    its(:gross_income) { should be == "10232.164021164021".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "232.164021164021164".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(533, 1675)          }
    its(:gross_income) { should be == "146670.389830508475".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "46670.389830508475".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(193, 429)           }
    its(:gross_income) { should be == "181782704.6".to_d           }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "81782704.6".to_d            }
  end
end
