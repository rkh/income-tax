describe IncomeTax::Models::Progressive do
  class ExampleModel < IncomeTax::Models::Progressive
    level 100, '0%'
    level 200, '10%'
    level 300, '20%'
    remainder  '50%'
  end

  subject(:result) { ExampleModel.new(income: income, income_type: income_type) }

  describe 'from gross income' do
    let(:income_type) { :gross }

    describe 'no income' do
      let(:income) { 0 }
      its(:rate)         { should be == IncomeTax::Rate('0%') }
      its(:gross_income) { should be == 0                     }
      its(:net_income)   { should be == 0                     }
      its(:taxes)        { should be == 0                     }
    end

    describe 'first bracket' do
      let(:income) { 80 }
      its(:rate)         { should be == IncomeTax::Rate('0%') }
      its(:gross_income) { should be == 80                    }
      its(:net_income)   { should be == 80                    }
      its(:taxes)        { should be == 0                     }
    end

    describe 'second bracket' do
      let(:income) { 190 }
      its(:rate)         { should be == Rational(9, 190)  }
      its(:gross_income) { should be == 190               }
      its(:net_income)   { should be == 181               }
      its(:taxes)        { should be == 9                 }
    end

    describe 'third bracket' do
      let(:income) { 290 }
      its(:rate)         { should be == Rational(28, 290) }
      its(:gross_income) { should be == 290               }
      its(:net_income)   { should be == 262               }
      its(:taxes)        { should be == 28                }
    end

    describe 'remainder' do
      let(:income) { 5000 }
      its(:rate)         { should be == Rational(2380, 5000) }
      its(:gross_income) { should be == 5000                 }
      its(:net_income)   { should be == 2620                 }
      its(:taxes)        { should be == 2380                 }
    end
  end

  describe 'from gross income' do
    let(:income_type) { :net }

    describe 'no income' do
      let(:income) { 0 }
      its(:rate)         { should be == IncomeTax::Rate('0%') }
      its(:gross_income) { should be == 0                     }
      its(:net_income)   { should be == 0                     }
      its(:taxes)        { should be == 0                     }
    end

    describe 'first bracket' do
      let(:income) { 80 }
      its(:rate)         { should be == IncomeTax::Rate('0%') }
      its(:gross_income) { should be == 80                    }
      its(:net_income)   { should be == 80                    }
      its(:taxes)        { should be == 0                     }
    end

    describe 'second bracket' do
      let(:income) { 181 }
      its(:rate)         { should be == Rational(9, 190)  }
      its(:gross_income) { should be == 190               }
      its(:net_income)   { should be == 181               }
      its(:taxes)        { should be == 9                 }
    end

    describe 'third bracket' do
      let(:income) { 262 }
      its(:rate)         { should be == Rational(28, 290) }
      its(:gross_income) { should be == 290               }
      its(:net_income)   { should be == 262               }
      its(:taxes)        { should be == 28                }
    end

    describe 'remainder' do
      let(:income) { 2620 }
      its(:rate)         { should be == Rational(2380, 5000) }
      its(:gross_income) { should be == 5000                 }
      its(:net_income)   { should be == 2620                 }
      its(:taxes)        { should be == 2380                 }
    end
  end
end
