describe IncomeTax::Countries::Switzerland::Fribourg do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, canton: 'Fribourg') }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(78, 427)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "81732.5716656".to_d         }
    its(:taxes)        { should be == "18267.4283344".to_d         }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(216, 323)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "33127301.6055528".to_d      }
    its(:taxes)        { should be == "66872698.3944472".to_d      }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(17, 96)             }
    its(:gross_income) { should be == "121517.783936940170725182376".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "21517.783936940170725182376".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(127, 264)           }
    its(:gross_income) { should be == "192701703.639683140843140924096".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "92701703.639683140843140924096".to_d }
  end
end
