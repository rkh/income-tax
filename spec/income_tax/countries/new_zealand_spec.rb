describe IncomeTax::Countries::NewZealand do
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
    its(:rate)         { should be == Rational(21, 200)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 895                          }
    its(:taxes)        { should be == 105                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(21, 200) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8950                         }
    its(:taxes)        { should be == 1050                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(72, 301) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 76_080                        }
    its(:taxes)        { should be == 23_920                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(161, 488) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 67_009_080                     }
    its(:taxes)        { should be == 32_990_920                     }
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
    its(:rate)         { should be == Rational(21, 200)            }
    its(:gross_income) { should be == '1117.31843575419'.to_d      }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '117.318435754189944'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(21, 200)            }
    its(:gross_income) { should be == '11173.1843575418994'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1173.18435754189944'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(176, 669)           }
    its(:gross_income) { should be == '135701.492537313433'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '35701.492537313433'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(97, 294)            }
    its(:gross_income) { should be == '149240179.10447761'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '49240179.104477611'.to_d }
  end
end
