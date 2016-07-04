describe IncomeTax::Countries::UnitedStates::NewYork do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'New York') }
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
    its(:rate)         { should be == Rational(19, 174) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8908                         }
    its(:taxes)        { should be == 1092                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(43, 168) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '74404.65'.to_d              }
    its(:taxes)        { should be == '25595.35'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(279, 577) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '51647342.665'.to_d          }
    its(:taxes)        { should be == '48352657.335'.to_d          }
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
    its(:rate)         { should be == Rational(7, 65)              }
    its(:gross_income) { should be == '11206.944444444444433'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1206.944444444444433'.to_d  }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(134, 531)           }
    its(:gross_income) { should be == '133751.7926486341725'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '33751.7926486341725'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(136, 317)           }
    its(:gross_income) { should be == '175136803.55444583'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '75136803.55444583'.to_d }
  end
end
