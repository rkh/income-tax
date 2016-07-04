describe IncomeTax::Countries::Poland do
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
    its(:rate)         { should be == Rational(24, 193) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8756.38'.to_d               }
    its(:taxes)        { should be == '1243.62'.to_d               }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(22, 113) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '80530.3'.to_d               }
    its(:taxes)        { should be == '19469.7'.to_d               }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(95, 297) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '68012530.3'.to_d            }
    its(:taxes)        { should be == '31987469.7'.to_d            }
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
    its(:rate)         { should be == Rational(32, 243)            }
    its(:gross_income) { should be == '11516.609756097561'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1516.60975609756098'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(67, 301)            }
    its(:gross_income) { should be == '128631.911764705882'.to_d   }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '28631.911764705882'.to_d    }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(135, 422)           }
    its(:gross_income) { should be == '147040396.617647058'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '47040396.617647058'.to_d }
  end
end
