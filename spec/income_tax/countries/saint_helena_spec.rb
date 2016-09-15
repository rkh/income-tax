describe IncomeTax::Countries::SaintHelena do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 750                          }
    its(:taxes)        { should be == 250                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 4) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 7500                         }
    its(:taxes)        { should be == 2500                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 4) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 75_000                        }
    its(:taxes)        { should be == 25_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1, 4) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 75_000_000                     }
    its(:taxes)        { should be == 25_000_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == '1333.33333333333333'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '333.33333333333333'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == '13333.3333333333333'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '3333.33333333333333'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == '133333.333333333333'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '33333.3333333333333'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == '133333333.333333333'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '33333333.3333333333'.to_d }
  end
end
