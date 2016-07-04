describe IncomeTax::Countries::Iceland do
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
    its(:rate)         { should be == Rational(116, 311)           }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 627                          }
    its(:taxes)        { should be == 373                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(116, 311) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 6270                         }
    its(:taxes)        { should be == 3730                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(116, 311) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 62_700                        }
    its(:taxes)        { should be == 37_300                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(145, 314) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '53821909.276'.to_d          }
    its(:taxes)        { should be == '46178090.724'.to_d          }
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
    its(:rate)         { should be == Rational(116, 311)           }
    its(:gross_income) { should be == '1594.896331738437'.to_d     }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '594.896331738437'.to_d      }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(116, 311)           }
    its(:gross_income) { should be == '15948.96331738437'.to_d     }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '5948.96331738437'.to_d      }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(116, 311)           }
    its(:gross_income) { should be == '159489.6331738437'.to_d     }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '59489.6331738437'.to_d      }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(67, 145)            }
    its(:gross_income) { should be == '185896746.138392857'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '85896746.138392857'.to_d }
  end
end
