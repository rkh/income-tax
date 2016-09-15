describe IncomeTax::Countries::Guernsey do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 800                          }
    its(:taxes)        { should be == 200                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 5) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8000                         }
    its(:taxes)        { should be == 2000                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 5) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 80_000                        }
    its(:taxes)        { should be == 20_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1, 5) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 80_000_000                     }
    its(:taxes)        { should be == 20_000_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 5)               }
    its(:gross_income) { should be == 1250                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 250                          }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 5) }
    its(:gross_income) { should be == 12_500                        }
    its(:net_income)   { should be == 10_000                        }
    its(:taxes)        { should be == 2500                         }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 5) }
    its(:gross_income) { should be == 125_000                       }
    its(:net_income)   { should be == 100_000                       }
    its(:taxes)        { should be == 25_000                        }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1, 5) }
    its(:gross_income) { should be == 125_000_000                    }
    its(:net_income)   { should be == 100_000_000                    }
    its(:taxes)        { should be == 25_000_000                     }
  end
end
