describe IncomeTax::Countries::Switzerland::Jura do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Jura') }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(28, 145)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "80690.1724631578947435191277".to_d }
    its(:taxes)        { should be == "19309.8275368421052564808723".to_d }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(134, 181)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "25966598.845473684235930509976".to_d }
    its(:taxes)        { should be == "74033401.154526315764069490024".to_d }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(35, 186)            }
    its(:gross_income) { should be == "123180.211412363224406205351353105328055033".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "23180.211412363224406205351353105328055033".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(197, 372)           }
    its(:gross_income) { should be == "212569829.79091689055616160885484411666107945".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "112569829.79091689055616160885484411666107945".to_d }
  end
end
