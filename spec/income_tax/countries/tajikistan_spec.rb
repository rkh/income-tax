describe IncomeTax::Countries::Tajikistan do
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
    its(:rate)         { should be == Rational(20, 329)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "939.2".to_d                 }
    its(:taxes)        { should be == "60.8".to_d                  }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(26, 333)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9219.2".to_d                }
    its(:taxes)        { should be == "780.8".to_d                 }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(41, 348)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "88219.2".to_d               }
    its(:taxes)        { should be == "11780.8".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(62, 477)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "87001219.2".to_d            }
    its(:taxes)        { should be == "12998780.8".to_d            }
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
    its(:rate)         { should be == Rational(15, 242)            }
    its(:gross_income) { should be == "1066.08695652173913".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "66.08695652173913".to_d     }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(23, 294)            }
    its(:gross_income) { should be == "10848.695652173913".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "848.695652173913".to_d      }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(13, 109)            }
    its(:gross_income) { should be == "113541.149425287356".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "13541.1494252873563".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(75, 577)            }
    its(:gross_income) { should be == "114941127.356321839".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "14941127.356321839".to_d    }
  end
end
