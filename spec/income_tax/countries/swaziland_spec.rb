describe IncomeTax::Countries::Swaziland do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(33, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(33, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 670                          }
    its(:taxes)        { should be == 330                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(33, 100) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 6700                         }
    its(:taxes)        { should be == 3300                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(33, 100) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 67_000                        }
    its(:taxes)        { should be == 33_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(33, 100) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 67_000_000                     }
    its(:taxes)        { should be == 33_000_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(33, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(33, 100)            }
    its(:gross_income) { should be == '1492.53731343283582'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '492.537313432835821'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(33, 100)            }
    its(:gross_income) { should be == '14925.3731343283582'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '4925.3731343283582'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(33, 100)            }
    its(:gross_income) { should be == '149253.731343283582'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '49253.731343283582'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(33, 100)            }
    its(:gross_income) { should be == '149253731.34328358'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '49253731.343283582'.to_d }
  end
end
