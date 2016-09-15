describe IncomeTax::Countries::Gibraltar do
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
    its(:rate)         { should be == Rational(58, 227) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 74_450                        }
    its(:taxes)        { should be == 25_550                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(19, 369) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 94_851_200                     }
    its(:taxes)        { should be == 5_148_800                      }
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
    its(:rate)         { should be == Rational(2, 25)              }
    its(:gross_income) { should be == '1086.95652173913043'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '86.956521739130435'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 11) }
    its(:gross_income) { should be == 11_000                        }
    its(:net_income)   { should be == 10_000                        }
    its(:taxes)        { should be == 1000                         }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(95, 359)            }
    its(:gross_income) { should be == '135985.915492957746'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '35985.915492957746'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(11, 214)            }
    its(:gross_income) { should be == '105419789.47368421'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '5419789.473684211'.to_d }
  end
end
