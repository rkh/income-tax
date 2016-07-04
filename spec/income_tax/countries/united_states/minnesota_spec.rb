describe IncomeTax::Countries::UnitedStates::Minnesota do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Minnesota') }
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
    its(:rate)         { should be == Rational(50, 377) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8673.65'.to_d               }
    its(:taxes)        { should be == '1326.35'.to_d               }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(159, 602) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '73587.1'.to_d               }
    its(:taxes)        { should be == '26412.9'.to_d               }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(206, 417) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '50599998.9'.to_d            }
    its(:taxes)        { should be == '49400001.1'.to_d            }
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
    its(:rate)         { should be == Rational(38, 299)            }
    its(:gross_income) { should be == '11455.90773023419615'.to_d  }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1455.90773023419615'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(92, 357)            }
    its(:gross_income) { should be == '134717.9174579489962'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '34717.9174579489962'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(149, 344)           }
    its(:gross_income) { should be == '176408828.69752583'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '76408828.69752583'.to_d }
  end
end
