describe IncomeTax::Countries::Switzerland do
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
    its(:rate)         { should be == Rational(2, 351)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "994.306".to_d               }
    its(:taxes)        { should be == "5.694".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 176)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9943.230382".to_d           }
    its(:taxes)        { should be == "56.769618".to_d             }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(46, 363)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "87327.285125".to_d          }
    its(:taxes)        { should be == "12672.714875".to_d          }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(359, 443)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "18962237.553013".to_d       }
    its(:taxes)        { should be == "81037762.446987".to_d       }
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
    its(:rate)         { should be == Rational(1, 176)             }
    its(:gross_income) { should be == "1005.7088429917786244212".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "5.7088429917786244212".to_d }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 177)             }
    its(:gross_income) { should be == "10056.90619286287089013684".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "56.90619286287089013684".to_d }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(40, 327)            }
    its(:gross_income) { should be == "113936.22605333554054089603".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "13936.22605333554054089603".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(23, 43)             }
    its(:gross_income) { should be == "215000749.62033184731851254306".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "115000749.62033184731851254306".to_d }
  end
end
