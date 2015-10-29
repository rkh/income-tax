describe IncomeTax::Countries::Lebanon do
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
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 980                          }
    its(:taxes)        { should be == 20                           }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 9800                         }
    its(:taxes)        { should be == 200                          }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 98000                        }
    its(:taxes)        { should be == 2000                         }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(30, 277)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 89170000                     }
    its(:taxes)        { should be == 10830000                     }
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
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == "1020.40816326530612".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "20.4081632653061224".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == "10204.0816326530612".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "204.081632653061224".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(1, 50)              }
    its(:gross_income) { should be == "102040.81632653061".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "2040.81632653061224".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(33, 292)            }
    its(:gross_income) { should be == "112741176.470588235".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "12741176.4705882353".to_d   }
  end
end
