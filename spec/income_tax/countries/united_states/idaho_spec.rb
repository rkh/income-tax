describe IncomeTax::Countries::UnitedStates::Idaho do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Idaho') }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(33, 268) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8768.755'.to_d              }
    its(:taxes)        { should be == '1231.245'.to_d              }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(115, 429) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '73194.346'.to_d             }
    its(:taxes)        { should be == '26805.654'.to_d             }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(131, 279) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '53046027.346'.to_d          }
    its(:taxes)        { should be == '46953972.654'.to_d          }
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == '1111.111111111111111'.to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '111.111111111111111'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(30, 251)            }
    its(:gross_income) { should be == '11357.378416755413549'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1357.378416755413549'.to_d  }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(33, 127)            }
    its(:gross_income) { should be == '135107.9079373650108'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '35107.9079373650108'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(133, 314)           }
    its(:gross_income) { should be == '173478376.431271722'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '73478376.431271722'.to_d }
  end
end
