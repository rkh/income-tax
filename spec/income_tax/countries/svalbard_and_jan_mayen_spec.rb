describe IncomeTax::Countries::SvalbardAndJanMayen do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 940                          }
    its(:taxes)        { should be == 60                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 50) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9400                         }
    its(:taxes)        { should be == 600                          }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(3, 50) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 94_000                        }
    its(:taxes)        { should be == 6000                         }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(3, 50) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 94_000_000                     }
    its(:taxes)        { should be == 6_000_000                      }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == '1063.82978723404255'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '63.8297872340425532'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == '10638.2978723404255'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '638.29787234042553'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == '106382.978723404255'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '6382.9787234042553'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(3, 50)              }
    its(:gross_income) { should be == '106382978.723404255'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '6382978.7234042553'.to_d }
  end
end
