describe IncomeTax::Countries::Tuvalu do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 700                          }
    its(:taxes)        { should be == 300                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 10) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 7000                         }
    its(:taxes)        { should be == 3000                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(3, 10) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 70_000                        }
    its(:taxes)        { should be == 30_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(3, 10) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 70_000_000                     }
    its(:taxes)        { should be == 30_000_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == '1428.57142857142857'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '428.571428571428571'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == '14285.7142857142857'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '4285.7142857142857'.to_d    }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == '142857.142857142857'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '42857.1428571428571'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(3, 10)              }
    its(:gross_income) { should be == '142857142.857142857'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '42857142.857142857'.to_d }
  end
end
