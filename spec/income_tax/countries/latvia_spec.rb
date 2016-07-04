describe IncomeTax::Countries::Latvia do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(6, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(6, 25)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 760                          }
    its(:taxes)        { should be == 240                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(6, 25) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 7600                         }
    its(:taxes)        { should be == 2400                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(6, 25) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 76_000                        }
    its(:taxes)        { should be == 24_000                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(6, 25) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 76_000_000                     }
    its(:taxes)        { should be == 24_000_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(6, 25)              }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(6, 25)              }
    its(:gross_income) { should be == '1315.78947368421053'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '315.78947368421053'.to_d    }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(6, 25)              }
    its(:gross_income) { should be == '13157.8947368421053'.to_d   }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '3157.89473684210526'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(6, 25)              }
    its(:gross_income) { should be == '131578.947368421053'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '31578.9473684210526'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(6, 25)              }
    its(:gross_income) { should be == '131578947.368421052'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '31578947.368421053'.to_d }
  end
end
