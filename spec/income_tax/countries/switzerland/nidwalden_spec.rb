describe IncomeTax::Countries::Switzerland::Nidwalden do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Nidwalden') }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(13, 423)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "969.26315789473684".to_d    }
    its(:taxes)        { should be == "30.7368421052631579".to_d   }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(13, 423)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "9692.6315789473684".to_d    }
    its(:taxes)        { should be == "307.368421052631579".to_d   }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(34, 249)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "86345.61618421052631815228".to_d }
    its(:taxes)        { should be == "13654.38381578947368184772".to_d }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(128, 243)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "47324821.3188447368511299598376".to_d }
    its(:taxes)        { should be == "52675178.6811552631488700401624".to_d }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(41, 1354)           }
    its(:gross_income) { should be == "1031.2366281557552418326272999572100984".to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "31.2366281557552418326272999572100984".to_d }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(41, 1354)           }
    its(:gross_income) { should be == "10312.366281557552418326272999572100984".to_d }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "312.366281557552418326272999572100984".to_d }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(45, 343)            }
    its(:gross_income) { should be == "115099.730663707721054244576861055691896632".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "15099.730663707721054244576861055691896632".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(123, 311)           }
    its(:gross_income) { should be == "165426769.322525139357111982759414772765352832".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "65426769.322525139357111982759414772765352832".to_d }
  end
end
