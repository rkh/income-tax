describe IncomeTax::Countries::Switzerland::Lucerne do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, canton: 'Lucerne') }
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
    its(:rate)         { should be == Rational(2, 281)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "992.884375".to_d            }
    its(:taxes)        { should be == "7.115625".to_d              }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(2, 281)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9928.84375".to_d            }
    its(:taxes)        { should be == "71.15625".to_d              }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(59, 352)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "83239.171475".to_d          }
    its(:taxes)        { should be == "16760.828525".to_d          }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(77, 109)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "29356881.946515625".to_d    }
    its(:taxes)        { should be == "70643118.053484375".to_d    }
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
    its(:rate)         { should be == Rational(1, 141)             }
    its(:gross_income) { should be == "1007.1391843082171164759375".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "7.1391843082171164759375".to_d }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 141)             }
    its(:gross_income) { should be == "10071.391843082171171875".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "71.391843082171171875".to_d }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(56, 351)            }
    its(:gross_income) { should be == "118983.1110301144493329419375".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "18983.1110301144493329419375".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(52, 107)            }
    its(:gross_income) { should be == "194548567.10410636279464975184375".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "94548567.10410636279464975184375".to_d }
  end
end
