describe IncomeTax::Countries::Nepal do
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
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 990                          }
    its(:taxes)        { should be == 10                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 100) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9900                         }
    its(:taxes)        { should be == 100                          }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 100) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 99_000                        }
    its(:taxes)        { should be == 1000                         }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(88, 353) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 75_070_000                     }
    its(:taxes)        { should be == 24_930_000                     }
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
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == '1010.10101010101'.to_d      }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '10.1010101010101'.to_d      }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == '10101.0101010101'.to_d      }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '101.01010101010101'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 100)             }
    its(:gross_income) { should be == '101010.101010101'.to_d      }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '1010.10101010101'.to_d      }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(117, 469) }
    its(:gross_income) { should be == 133_240_000                    }
    its(:net_income)   { should be == 100_000_000                    }
    its(:taxes)        { should be == 33_240_000                     }
  end
end
