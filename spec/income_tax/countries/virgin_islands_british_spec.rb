describe IncomeTax::Countries::VirginIslandsBritish do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 920                          }
    its(:taxes)        { should be == 80                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(2, 25) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9200                         }
    its(:taxes)        { should be == 800                          }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(2, 25) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 92_000                        }
    its(:taxes)        { should be == 8000                         }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(2, 25) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 92_000_000                     }
    its(:taxes)        { should be == 8_000_000                      }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == '1086.95652173913043'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '86.956521739130435'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == '10869.5652173913043'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '869.56521739130435'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == '108695.652173913043'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '8695.6521739130435'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == '108695652.173913043'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '8695652.1739130435'.to_d }
  end
end
