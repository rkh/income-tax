describe IncomeTax::Countries::SaintMartin do
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(5, 228) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9780.605'.to_d              }
    its(:taxes)        { should be == '219.395'.to_d               }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(19, 69) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '72464.47'.to_d              }
    its(:taxes)        { should be == '27535.53'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(191, 466) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '59013464.47'.to_d           }
    its(:taxes)        { should be == '40986535.53'.to_d           }
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
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(11, 485)            }
    its(:gross_income) { should be == '10232.164021164021'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '232.164021164021164'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(533, 1675)          }
    its(:gross_income) { should be == '146670.389830508475'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '46670.389830508475'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(157, 383)           }
    its(:gross_income) { should be == '169468704.28813559'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '69468704.288135593'.to_d }
  end
end
