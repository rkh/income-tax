describe IncomeTax::Countries::IsleOfMan do
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
    its(:rate)         { should be == Rational(1, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 900                          }
    its(:taxes)        { should be == 100                          }
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
    its(:rate)         { should be == Rational(29, 169) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 82_840                        }
    its(:taxes)        { should be == 17_160                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(9, 50) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 82_000_840                     }
    its(:taxes)        { should be == 17_999_160                     }
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
    its(:gross_income) { should be == '1111.1111111111111'.to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '111.111111111111111'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(24, 229)            }
    its(:gross_income) { should be == '11170.7317073170732'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1170.73170731707317'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(104, 601)           }
    its(:gross_income) { should be == '120926.829268292683'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '20926.8292682926829'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(9, 50)              }
    its(:gross_income) { should be == '121950195.121951219'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '21950195.12195122'.to_d }
  end
end
