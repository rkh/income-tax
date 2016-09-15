describe IncomeTax::Countries::Mexico do
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
    its(:rate)         { should be == Rational(10, 521)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '980.8'.to_d                 }
    its(:taxes)        { should be == '19.2'.to_d                  }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(14, 375) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9626.6944'.to_d             }
    its(:taxes)        { should be == '373.3056'.to_d              }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(29, 325) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '91076.4672'.to_d            }
    its(:taxes)        { should be == '8923.5328'.to_d             }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(112, 321) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '65109295.8848'.to_d         }
    its(:taxes)        { should be == '34890704.1152'.to_d         }
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
    its(:rate)         { should be == Rational(10, 521)            }
    its(:gross_income) { should be == '1019.57585644371941'.to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '19.5758564437194127'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(13, 339)            }
    its(:gross_income) { should be == '10398.830769230769'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '398.830769230769231'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(22, 227)            }
    its(:gross_income) { should be == '110730.575845410628'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '10730.575845410628'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(73, 209)            }
    its(:gross_income) { should be == '153678006.331076923'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '53678006.331076923'.to_d }
  end
end
