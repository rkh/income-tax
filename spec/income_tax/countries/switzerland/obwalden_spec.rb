describe IncomeTax::Countries::Switzerland::Obwalden do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Obwalden') }
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
    its(:rate)         { should be == Rational(5, 141)             }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '964.54098360655738'.to_d    }
    its(:taxes)        { should be == '35.459016393442623'.to_d    }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(18, 773) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9767.23425114754098328372'.to_d }
    its(:taxes)        { should be == '232.76574885245901671628'.to_d }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(39, 242) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '83883.466655737704899666'.to_d }
    its(:taxes)        { should be == '16116.533344262295100334'.to_d }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(237, 382) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '37957756.26654163927416209584'.to_d }
    its(:taxes)        { should be == '62042243.73345836072583790416'.to_d }
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
    its(:rate)         { should be == Rational(9, 259)             }
    its(:gross_income) { should be == '1035.99900141466256143451943080635766'.to_d }
    its(:net_income)   { should be == 1000 }
    its(:taxes)        { should be == '35.99900141466256143451943080635766'.to_d }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(5, 219) }
    its(:gross_income) { should be == '10233.6067330915887361668332988924061046'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '233.6067330915887361668332988924061046'.to_d }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(65, 428) }
    its(:gross_income) { should be == '117907.02416120799965159254595243177987'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '17907.02416120799965159254595243177987'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(92, 211) }
    its(:gross_income) { should be == '177313825.625437172552886108474725559000121'.to_d }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '77313825.625437172552886108474725559000121'.to_d }
  end
end
