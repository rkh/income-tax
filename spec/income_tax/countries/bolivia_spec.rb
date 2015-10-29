describe IncomeTax::Countries::Bolivia do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 870                          }
    its(:taxes)        { should be == 130                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8700                         }
    its(:taxes)        { should be == 1300                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 87000                        }
    its(:taxes)        { should be == 13000                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 87000000                     }
    its(:taxes)        { should be == 13000000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == "1149.42528735632184".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "149.425287356321839".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == "11494.2528735632184".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1494.25287356321839".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == "114942.528735632184".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "14942.5287356321839".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == "114942528.735632183".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "14942528.735632183".to_d    }
  end
end
