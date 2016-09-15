describe IncomeTax::Countries::Uzbekistan do
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
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 880                          }
    its(:taxes)        { should be == 120                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 25) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8800                         }
    its(:taxes)        { should be == 1200                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(3, 25) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 88_000                        }
    its(:taxes)        { should be == 12_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(69, 304) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 77_302_832                     }
    its(:taxes)        { should be == 22_697_168                     }
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
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == '1136.36363636363636'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '136.363636363636364'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == '11363.6363636363636'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1363.63636363636364'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(3, 25)              }
    its(:gross_income) { should be == '113636.363636363636'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '13636.3636363636364'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(79, 347)            }
    its(:gross_income) { should be == '129476841.558441558'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '29476841.558441558'.to_d }
  end
end
