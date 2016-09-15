describe IncomeTax::Countries::SaoTomeAndPrincipe do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 870                          }
    its(:taxes)        { should be == 130                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(13, 100) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8700                         }
    its(:taxes)        { should be == 1300                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(13, 100) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 87_000                        }
    its(:taxes)        { should be == 13_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(13, 100) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 87_000_000                     }
    its(:taxes)        { should be == 13_000_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == '1149.42528735632184'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '149.425287356321839'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == '11494.2528735632184'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1494.25287356321839'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == '114942.528735632184'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '14942.5287356321839'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(13, 100)            }
    its(:gross_income) { should be == '114942528.735632183'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '14942528.735632183'.to_d }
  end
end
