describe IncomeTax::Countries::SaintVincentAndTheGrenedines do
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
    its(:rate)         { should be == Rational(4, 25) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8400                         }
    its(:taxes)        { should be == 1600                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(89, 250) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 64_400                        }
    its(:taxes)        { should be == 35_600                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1483, 3708) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 60_004_400                     }
    its(:taxes)        { should be == 39_995_600                     }
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
    its(:rate)         { should be == Rational(8, 43)              }
    its(:gross_income) { should be == '12285.7142857142857'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '2285.7142857142857'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(89, 239)            }
    its(:gross_income) { should be == '159333.333333333333'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '59333.3333333333333'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(2199, 5498)         }
    its(:gross_income) { should be == '166659333.333333333'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '66659333.3333333333'.to_d }
  end
end
