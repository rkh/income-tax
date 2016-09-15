describe IncomeTax::Countries::Greenland do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 630                          }
    its(:taxes)        { should be == 370                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(37, 100) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 6300                         }
    its(:taxes)        { should be == 3700                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(37, 100) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 63_000                        }
    its(:taxes)        { should be == 37_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(37, 100) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 63_000_000                     }
    its(:taxes)        { should be == 37_000_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == '1587.3015873015873'.to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '587.3015873015873'.to_d     }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == '15873.015873015873'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '5873.015873015873'.to_d     }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == '158730.15873015873'.to_d    }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '58730.15873015873'.to_d     }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(37, 100)            }
    its(:gross_income) { should be == '158730158.73015873'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '58730158.73015873'.to_d }
  end
end
