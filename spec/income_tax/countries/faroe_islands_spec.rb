describe IncomeTax::Countries::FaroeIslands do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 585                          }
    its(:taxes)        { should be == 415                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 5850                         }
    its(:taxes)        { should be == 4150                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 58500                        }
    its(:taxes)        { should be == 41500                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 58500000                     }
    its(:taxes)        { should be == 41500000                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == "1709.4017094017094".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "709.4017094017094".to_d     }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == "17094.017094017094".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "7094.017094017094".to_d     }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == "170940.17094017094".to_d    }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "70940.17094017094".to_d     }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == "170940170.94017094".to_d    }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "70940170.94017094".to_d     }
  end
end
