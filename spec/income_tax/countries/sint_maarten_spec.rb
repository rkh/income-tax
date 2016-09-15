describe IncomeTax::Countries::SintMaarten do
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
    its(:rate)         { should be == Rational(1, 8)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 875                          }
    its(:taxes)        { should be == 125                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 8) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 8750                         }
    its(:taxes)        { should be == 1250                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(5, 21) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '76190.5625'.to_d            }
    its(:taxes)        { should be == '23809.4375'.to_d            }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(216, 455) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '52526497.8875'.to_d         }
    its(:taxes)        { should be == '47473502.1125'.to_d         }
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
    its(:rate)         { should be == Rational(1, 8)               }
    its(:gross_income) { should be == '1142.8571428571429'.to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '142.857142857142857'.to_d   }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(1, 8)               }
    its(:gross_income) { should be == '11428.571428571429'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1428.57142857142857'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(1339, 4686)         }
    its(:gross_income) { should be == '140004.02380952381'.to_d    }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '40004.02380952381'.to_d     }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(85, 179)            }
    its(:gross_income) { should be == '190425718.309523809'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '90425718.30952381'.to_d }
  end
end
