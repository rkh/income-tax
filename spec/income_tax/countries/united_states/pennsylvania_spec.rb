describe IncomeTax::Countries::UnitedStates::Pennsylvania do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Pennsylvania') }
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
    its(:rate)         { should be == Rational(43, 329)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '869.3'.to_d                 }
    its(:taxes)        { should be == '130.7'.to_d                 }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(43, 329) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8693                         }
    its(:taxes)        { should be == 1307                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(101, 439) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '76992.75'.to_d              }
    its(:taxes)        { should be == '23007.25'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(289, 678) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '57375495.75'.to_d           }
    its(:taxes)        { should be == '42624504.25'.to_d           }
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
    its(:rate)         { should be == Rational(236, 1889)          }
    its(:gross_income) { should be == '1142.783451975652533'.to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '142.783451975652533'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(236, 1889)          }
    its(:gross_income) { should be == '11427.83451975652532'.to_d  }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1427.83451975652532'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(54, 229)            }
    its(:gross_income) { should be == '130857.8590864541422'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '30857.8590864541422'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(46, 113)            }
    its(:gross_income) { should be == '168654823.904334936'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '68654823.904334936'.to_d }
  end
end
