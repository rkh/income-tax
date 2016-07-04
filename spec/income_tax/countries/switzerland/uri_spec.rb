describe IncomeTax::Countries::Switzerland::Uri do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, tax_year: tax_year, canton: 'Uri') }
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
    its(:rate)         { should be == Rational(52, 147)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '646.2576'.to_d              }
    its(:taxes)        { should be == '353.7424'.to_d              }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(81, 1175) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '9310.545197'.to_d           }
    its(:taxes)        { should be == '689.454803'.to_d            }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(67, 454) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '85242.737087'.to_d          }
    its(:taxes)        { should be == '14757.262913'.to_d          }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(107, 189) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '43386778.242619'.to_d       }
    its(:taxes)        { should be == '56613221.757381'.to_d       }
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
    its(:rate)         { should be == Rational(228, 821)           }
    its(:gross_income) { should be == '1384.50260869565217391313'.to_d }
    its(:net_income)   { should be == 1000 }
    its(:taxes)        { should be == '384.50260869565217391313'.to_d }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(5, 77)              }
    its(:gross_income) { should be == '10694.41421709712'.to_d     }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '694.41421709712'.to_d       }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(12, 85) }
    its(:gross_income) { should be == '116438.00675870618730641203'.to_d }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '16438.00675870618730641203'.to_d }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(152, 365) }
    its(:gross_income) { should be == '171363119.52462284897801785542'.to_d }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '71363119.52462284897801785542'.to_d }
  end
end
