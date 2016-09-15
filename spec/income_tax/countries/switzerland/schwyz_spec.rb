describe IncomeTax::Countries::Switzerland::Schwyz do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Schwyz') }
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
    its(:rate)         { should be == Rational(1, 923) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9989.264386206896551735744'.to_d }
    its(:taxes)        { should be == '10.735613793103448264256'.to_d }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(40, 293) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '86348.667682758620701306256'.to_d }
    its(:taxes)        { should be == '13651.332317241379298693744'.to_d }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(45, 68) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '33823590.834682758679799286616'.to_d }
    its(:taxes)        { should be == '66176409.165317241320200713384'.to_d }
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
    its(:rate)         { should be == Rational(1, 920) }
    its(:gross_income) { should be == '10010.78739328085153563585519458920057656'.to_d }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '10.78739328085153563585519458920057656'.to_d }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(175, 1356) }
    its(:gross_income) { should be == '114816.65913429461854772169860518332844056'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '14816.65913429461854772169860518332844056'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(271, 599) }
    its(:gross_income) { should be == '182619218.6847586528823006658883712352406504'.to_d }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '82619218.6847586528823006658883712352406504'.to_d }
  end
end
