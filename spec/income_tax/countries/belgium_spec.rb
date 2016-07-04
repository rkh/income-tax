describe IncomeTax::Countries::Belgium do
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
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 750                          }
    its(:taxes)        { should be == 250                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(68, 265) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 7434                         }
    its(:taxes)        { should be == 2566                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(99, 218) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '54587.5'.to_d               }
    its(:taxes)        { should be == '45412.5'.to_d               }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(4474, 8949) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '50004587.5'.to_d            }
    its(:taxes)        { should be == '49995412.5'.to_d            }
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
    its(:rate)         { should be == Rational(1, 4)               }
    its(:gross_income) { should be == '1333.33333333333333'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '333.33333333333333'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(40, 143)            }
    its(:gross_income) { should be == '13883.3333333333333'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '3883.33333333333333'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(99, 208) }
    its(:gross_income) { should be == 190_825                       }
    its(:net_income)   { should be == 100_000                       }
    its(:taxes)        { should be == 90_825                        }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(7590, 15_181) }
    its(:gross_income) { should be == 199_990_825                    }
    its(:net_income)   { should be == 100_000_000                    }
    its(:taxes)        { should be == 99_990_825                     }
  end
end
