describe IncomeTax::Countries::UnitedStates::NorthCarolina do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'North Carolina') }
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
    its(:rate)         { should be == Rational(73, 462)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 842                          }
    its(:taxes)        { should be == 158                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(73, 462) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8420                         }
    its(:taxes)        { should be == 1580                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(96, 373) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '74262.75'.to_d              }
    its(:taxes)        { should be == '25737.25'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(83, 183) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '54645495.75'.to_d           }
    its(:taxes)        { should be == '45354504.25'.to_d           }
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
    its(:rate)         { should be == Rational(43, 292)            }
    its(:gross_income) { should be == '1172.682236376503892'.to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '172.682236376503892'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(43, 292)            }
    its(:gross_income) { should be == '11726.82236376503891'.to_d  }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1726.82236376503891'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(22, 87)             }
    its(:gross_income) { should be == '133847.7375265392781'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '33847.7375265392781'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(48, 115)            }
    its(:gross_income) { should be == '171644702.344420072'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '71644702.344420072'.to_d }
  end
end
