describe IncomeTax::Countries::Ghana do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

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
    its(:rate)         { should be == Rational(55, 426) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8709                         }
    its(:taxes)        { should be == 1291                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(43, 194) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 77_835                        }
    its(:taxes)        { should be == 22_165                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1630, 6521) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 75_002_835                     }
    its(:taxes)        { should be == 24_997_165                     }
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
    its(:rate)         { should be == Rational(41, 303)            }
    its(:gross_income) { should be == '11564.8484848484848'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1564.84848484848485'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(73, 320)            }
    its(:gross_income) { should be == '129553.333333333333'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '29553.3333333333333'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1999, 7997)         }
    its(:gross_income) { should be == '133329553.333333333'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '33329553.3333333333'.to_d }
  end
end
