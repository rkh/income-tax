describe IncomeTax::Countries::Slovenia do
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
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 840                          }
    its(:taxes)        { should be == 160                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(52, 283) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8162.51'.to_d               }
    its(:taxes)        { should be == '1837.49'.to_d               }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(106, 263) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '59695.53'.to_d              }
    its(:taxes)        { should be == '40304.47'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(2337, 4675) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '50009695.53'.to_d           }
    its(:taxes)        { should be == '49990304.47'.to_d           }
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
    its(:rate)         { should be == Rational(4, 25)              }
    its(:gross_income) { should be == '1190.47619047619048'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '190.476190476190476'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(37, 184)            }
    its(:gross_income) { should be == '12517.1095890410959'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '2517.1095890410959'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(133, 298)           }
    its(:gross_income) { should be == '180608.94'.to_d             }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '80608.94'.to_d              }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(4275, 8551)         }
    its(:gross_income) { should be == '199980608.94'.to_d          }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '99980608.94'.to_d }
  end
end
