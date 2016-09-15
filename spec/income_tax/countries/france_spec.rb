describe IncomeTax::Countries::France do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'tax year 2015' do
    describe 'from gross income of 0' do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from gross income of 1000' do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from gross income of 10000' do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 10_000 }
      its(:rate)         { should be == Rational(5, 228) }
      its(:gross_income) { should be == 10_000 }
      its(:net_income)   { should be == '9780.605'.to_d              }
      its(:taxes)        { should be == '219.395'.to_d               }
    end

    describe 'from gross income of 100000' do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100_000 }
      its(:rate)         { should be == Rational(19, 69) }
      its(:gross_income) { should be == 100_000 }
      its(:net_income)   { should be == '72464.47'.to_d              }
      its(:taxes)        { should be == '27535.53'.to_d              }
    end

    describe 'from gross income of 100000000' do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100_000_000 }
      its(:rate)         { should be == Rational(112, 249) }
      its(:gross_income) { should be == 100_000_000 }
      its(:net_income)   { should be == '55019512.47'.to_d           }
      its(:taxes)        { should be == '44980487.53'.to_d           }
    end

    describe 'from net income of 0' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from net income of 1000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from net income of 10000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 10_000 }
      its(:rate)         { should be == Rational(11, 485)            }
      its(:gross_income) { should be == '10232.164021164021'.to_d    }
      its(:net_income)   { should be == 10_000 }
      its(:taxes)        { should be == '232.164021164021164'.to_d   }
    end

    describe 'from net income of 100000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100_000 }
      its(:rate)         { should be == Rational(533, 1675)          }
      its(:gross_income) { should be == '146670.389830508475'.to_d   }
      its(:net_income)   { should be == 100_000 }
      its(:taxes)        { should be == '46670.389830508475'.to_d    }
    end

    describe 'from net income of 100000000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100_000_000 }
      its(:rate)         { should be == Rational(193, 429)           }
      its(:gross_income) { should be == '181782704.6'.to_d           }
      its(:net_income)   { should be == 100_000_000 }
      its(:taxes)        { should be == '81782704.6'.to_d            }
    end
  end

  describe 'tax year 2016' do
    describe 'from gross income of 0' do
      let(:tax_year)     { 2016                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from gross income of 1000' do
      let(:tax_year)     { 2016                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from gross income of 10000' do
      let(:tax_year)     { 2016                                      }
      let(:income)       { 10_000 }
      its(:rate)         { should be == Rational(1, 230) }
      its(:gross_income) { should be == 10_000 }
      its(:net_income)   { should be == '9956.6'.to_d                }
      its(:taxes)        { should be == '43.4'.to_d                  }
    end

    describe 'from gross income of 100000' do
      let(:tax_year)     { 2016                                      }
      let(:income)       { 100_000 }
      its(:rate)         { should be == Rational(64, 233) }
      its(:gross_income) { should be == 100_000 }
      its(:net_income)   { should be == '72531.78'.to_d              }
      its(:taxes)        { should be == '27468.22'.to_d              }
    end

    describe 'from gross income of 100000000' do
      let(:tax_year)     { 2016                                      }
      let(:income)       { 100_000_000 }
      its(:rate)         { should be == Rational(112, 249) }
      its(:gross_income) { should be == 100_000_000 }
      its(:net_income)   { should be == '55019610.02'.to_d           }
      its(:taxes)        { should be == '44980389.98'.to_d           }
    end

    describe 'from net income of 0' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2016                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from net income of 1000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2016                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe 'from net income of 10000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2016                                      }
      let(:income)       { 10_000 }
      its(:rate)         { should be == Rational(1, 199)             }
      its(:gross_income) { should be == '10050.46511627907'.to_d     }
      its(:net_income)   { should be == 10_000 }
      its(:taxes)        { should be == '50.465116279069767'.to_d    }
    end

    describe 'from net income of 100000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2016                                      }
      let(:income)       { 100_000 }
      its(:rate)         { should be == Rational(142, 447)           }
      its(:gross_income) { should be == '146556.305084745763'.to_d   }
      its(:net_income)   { should be == 100_000 }
      its(:taxes)        { should be == '46556.305084745763'.to_d    }
    end

    describe 'from net income of 100000000' do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2016                                      }
      let(:income)       { 100_000_000 }
      its(:rate)         { should be == Rational(193, 429)           }
      its(:gross_income) { should be == '181782527.236363636'.to_d   }
      its(:net_income)   { should be == 100_000_000 }
      its(:taxes)        { should be == '81782527.236363636'.to_d }
    end
  end
end
