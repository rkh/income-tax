describe IncomeTax::Countries::UnitedStates::Nebraska do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, state: 'Nebraska') }
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
    its(:rate)         { should be == Rational(13, 107)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "878.4996".to_d              }
    its(:taxes)        { should be == "121.5004".to_d              }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(43, 327)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8684.9226".to_d             }
    its(:taxes)        { should be == "1315.0774".to_d             }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(90, 347)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "74063.5684".to_d            }
    its(:taxes)        { should be == "25936.4316".to_d            }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(193, 416)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "53606336.5684".to_d         }
    its(:taxes)        { should be == "46393663.4316".to_d         }
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
    its(:rate)         { should be == Rational(47, 400)            }
    its(:gross_income) { should be == "1133.1537602806825689".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "133.1537602806825689".to_d  }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(45, 358)            }
    its(:gross_income) { should be == "11437.650027060950462".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1437.650027060950462".to_d  }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(57, 224)            }
    its(:gross_income) { should be == "134130.2789287247746".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "34130.2789287247746".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(67, 159)            }
    its(:gross_income) { should be == "172828894.220628754".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "72828894.220628754".to_d    }
  end
end
