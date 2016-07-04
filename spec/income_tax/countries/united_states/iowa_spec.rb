describe IncomeTax::Countries::UnitedStates::Iowa do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Iowa') }
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
    its(:rate)         { should be == Rational(10, 97)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '896.904'.to_d               }
    its(:taxes)        { should be == '103.096'.to_d               }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(31, 254) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8779.509'.to_d              }
    its(:taxes)        { should be == '1220.491'.to_d              }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(41, 162) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '74690.76805'.to_d           }
    its(:taxes)        { should be == '25309.23195'.to_d           }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(112, 249) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '55019307.88465'.to_d        }
    its(:taxes)        { should be == '44980692.11535'.to_d        }
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
    its(:rate)         { should be == Rational(48, 467)            }
    its(:gross_income) { should be == '1114.567111111111111'.to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '114.567111111111111'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(34, 281)            }
    its(:gross_income) { should be == '11376.6021111111111'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1376.6021111111111'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(84, 325)            }
    its(:gross_income) { should be == '134852.972'.to_d            }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '34852.972'.to_d             }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(35, 82)             }
    its(:gross_income) { should be == '174465772.164880794'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '74465772.164880794'.to_d }
  end
end
