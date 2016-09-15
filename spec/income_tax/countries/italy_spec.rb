describe IncomeTax::Countries::Italy do
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
    its(:rate)         { should be == Rational(23, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 770                          }
    its(:taxes)        { should be == 230                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(23, 100) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 7700                         }
    its(:taxes)        { should be == 2300                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(17, 47) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 63_830                        }
    its(:taxes)        { should be == 36_170                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(135, 314) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 57_006_830                     }
    its(:taxes)        { should be == 42_993_170                     }
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
    its(:rate)         { should be == Rational(23, 100)            }
    its(:gross_income) { should be == '1298.7012987012987'.to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '298.7012987012987'.to_d     }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(23, 100)            }
    its(:gross_income) { should be == '12987.012987012987'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '2987.012987012987'.to_d     }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(158, 407)           }
    its(:gross_income) { should be == '163456.14035087719'.to_d    }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '63456.140350877193'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(89, 207)            }
    its(:gross_income) { should be == '175426614.03508772'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '75426614.035087719'.to_d }
  end
end
