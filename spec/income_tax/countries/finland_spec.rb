describe IncomeTax::Countries::Finland do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "tax year 2015" do

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
      its(:rate)         { should be == Rational(35, 183)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == 80875                        }
      its(:taxes)        { should be == 19125                        }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(254, 847)           }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == 70010875                     }
      its(:taxes)        { should be == 29989125                     }
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
      its(:rate)         { should be == Rational(50, 233)            }
      its(:gross_income) { should be == "127321.428571428571".to_d   }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "27321.4285714285714".to_d   }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(350, 1167)          }
      its(:gross_income) { should be == "142841607.142857143".to_d   }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "42841607.142857143".to_d    }
    end
  end
end
