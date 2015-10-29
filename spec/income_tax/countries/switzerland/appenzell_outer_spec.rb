describe IncomeTax::Countries::Switzerland::AppenzellOuter do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, canton: 'Appenzell Outer Rhodes') }
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
    its(:rate)         { should be == Rational(2, 325)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "993.840625".to_d            }
    its(:taxes)        { should be == "6.159375".to_d              }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(2, 325)             }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9938.40625".to_d            }
    its(:taxes)        { should be == "61.59375".to_d              }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(80, 437)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "81692.782634375".to_d       }
    its(:taxes)        { should be == "18307.217365625".to_d       }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(187, 295)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "36610027.85359375".to_d     }
    its(:taxes)        { should be == "63389972.14640625".to_d     }
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
    its(:rate)         { should be == Rational(1, 163)             }
    its(:gross_income) { should be == "1006.176050335906948763125".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "6.176050335906948763125".to_d }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(1, 163)             }
    its(:gross_income) { should be == "10061.76050335906948763125".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "61.76050335906948763125".to_d }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(23, 133)            }
    its(:gross_income) { should be == "120908.42399114178727383628125".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "20908.42399114178727383628125".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(89, 200)            }
    its(:gross_income) { should be == "180183230.4277903938386248861875".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "80183230.4277903938386248861875".to_d }
  end
end
