describe IncomeTax::Countries::FaroeIslands do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe 'from gross income of 0' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from gross income of 1000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 585                          }
    its(:taxes)        { should be == 415                          }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(83, 200) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == 5850                         }
    its(:taxes)        { should be == 4150                         }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(83, 200) }
    its(:gross_income) { should be == 100_000                       }
    its(:net_income)   { should be == 58_500                        }
    its(:taxes)        { should be == 41_500                        }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015 }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(83, 200) }
    its(:gross_income) { should be == 100_000_000                    }
    its(:net_income)   { should be == 58_500_000                     }
    its(:taxes)        { should be == 41_500_000                     }
  end

  describe 'from net income of 0' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe 'from net income of 1000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == '1709.4017094017094'.to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '709.4017094017094'.to_d     }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == '17094.017094017094'.to_d    }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '7094.017094017094'.to_d     }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == '170940.17094017094'.to_d    }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '70940.17094017094'.to_d     }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(83, 200)            }
    its(:gross_income) { should be == '170940170.94017094'.to_d    }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '70940170.94017094'.to_d }
  end
end
