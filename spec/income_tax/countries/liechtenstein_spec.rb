describe IncomeTax::Countries::Liechtenstein do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "821.8".to_d                 }
    its(:taxes)        { should be == "178.2".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8218                         }
    its(:taxes)        { should be == 1782                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 82180                        }
    its(:taxes)        { should be == 17820                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 82180000                     }
    its(:taxes)        { should be == 17820000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == "1216.84108055487953".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "216.841080554879533".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == "12168.4108055487953".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2168.41080554879533".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == "121684.108055487953".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "21684.108055487953".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(891, 5000)          }
    its(:gross_income) { should be == "121684108.055487953".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "21684108.055487953".to_d    }
  end
end
