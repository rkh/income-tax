describe IncomeTax::Countries::Montserrat do
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 950                          }
    its(:taxes)        { should be == 50                           }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 10) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 9000                         }
    its(:taxes)        { should be == 1000                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(111, 400) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 72_250                        }
    its(:taxes)        { should be == 27_750                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(479, 1198) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 60_015_750                     }
    its(:taxes)        { should be == 39_984_250                     }
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
    its(:rate)         { should be == Rational(1, 20)              }
    its(:gross_income) { should be == '1052.63157894736842'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '52.631578947368421'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(2, 17)              }
    its(:gross_income) { should be == '11333.3333333333333'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1333.33333333333333'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(97, 337)            }
    its(:gross_income) { should be == '140416.666666666667'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '40416.6666666666667'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(767, 1918)          }
    its(:gross_income) { should be == '166640416.666666667'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '66640416.6666666667'.to_d }
  end
end
