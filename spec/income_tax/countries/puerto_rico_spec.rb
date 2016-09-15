describe IncomeTax::Countries::PuertoRico do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 960                          }
    its(:taxes)        { should be == 40                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 25) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9600                         }
    its(:taxes)        { should be == 400                          }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 25) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 96_000                        }
    its(:taxes)        { should be == 4000                         }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1, 25) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 96_000_000                     }
    its(:taxes)        { should be == 4_000_000                      }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(1, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(1, 25)              }
    its(:gross_income) { should be == '1041.66666666666667'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '41.6666666666666667'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 25)              }
    its(:gross_income) { should be == '10416.6666666666667'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '416.66666666666667'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1, 25)              }
    its(:gross_income) { should be == '104166.666666666667'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '4166.6666666666667'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(1, 25)              }
    its(:gross_income) { should be == '104166666.666666667'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '4166666.66666666667'.to_d }
  end
end
