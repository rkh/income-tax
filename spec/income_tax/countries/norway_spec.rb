describe IncomeTax::Countries::Norway do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'tax year 2015' do
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
      its(:rate)         { should be == Rational(1, 4) }
      its(:gross_income) { should be == 10_000 }
      its(:net_income)   { should be == 7500                         }
      its(:taxes)        { should be == 2500                         }
    end

    describe 'from gross income of 100000000' do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100_000_000 }
      its(:rate)         { should be == Rational(95, 246) }
      its(:gross_income) { should be == 100_000_000 }
      its(:net_income)   { should be == '61381707.86'.to_d           }
      its(:taxes)        { should be == '38618292.14'.to_d           }
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
  end
end
