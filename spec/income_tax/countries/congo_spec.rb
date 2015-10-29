describe IncomeTax::Countries::Congo do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 700                          }
    its(:taxes)        { should be == 300                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 7000                         }
    its(:taxes)        { should be == 3000                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 70000                        }
    its(:taxes)        { should be == 30000                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 70000000                     }
    its(:taxes)        { should be == 30000000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == "1428.57142857142857".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "428.571428571428571".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == "14285.7142857142857".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "4285.7142857142857".to_d    }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == "142857.142857142857".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "42857.1428571428571".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == "142857142.857142857".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "42857142.857142857".to_d    }
  end
end
