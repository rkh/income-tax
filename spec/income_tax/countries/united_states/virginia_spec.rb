describe IncomeTax::Countries::UnitedStates::Virginia do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Virginia') }
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
    its(:rate)         { should be == Rational(35, 226)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == '845.125'.to_d               }
    its(:taxes)        { should be == '154.875'.to_d               }
  end

  describe 'from gross income of 10000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(42, 305) }
    its(:gross_income) { should be == 10_000 }
    its(:net_income)   { should be == '8623.025'.to_d              }
    its(:taxes)        { should be == '1376.975'.to_d              }
  end

  describe 'from gross income of 100000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(74, 291) }
    its(:gross_income) { should be == 100_000 }
    its(:net_income)   { should be == '74570.25'.to_d              }
    its(:taxes)        { should be == '25429.75'.to_d              }
  end

  describe 'from gross income of 100000000' do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(82, 181) }
    its(:gross_income) { should be == 100_000_000 }
    its(:net_income)   { should be == '54695753.25'.to_d           }
    its(:taxes)        { should be == '45304246.75'.to_d           }
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
    its(:rate)         { should be == Rational(62, 433)            }
    its(:gross_income) { should be == '1167.1060090702947845'.to_d }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == '167.1060090702947845'.to_d  }
  end

  describe 'from net income of 10000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10_000 }
    its(:rate)         { should be == Rational(19, 145)            }
    its(:gross_income) { should be == '11507.92690058479531'.to_d  }
    its(:net_income)   { should be == 10_000 }
    its(:taxes)        { should be == '1507.92690058479531'.to_d   }
  end

  describe 'from net income of 100000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000 }
    its(:rate)         { should be == Rational(60, 239)            }
    its(:gross_income) { should be == '133518.2112068965517'.to_d  }
    its(:net_income)   { should be == 100_000 }
    its(:taxes)        { should be == '33518.2112068965517'.to_d   }
  end

  describe 'from net income of 100000000' do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100_000_000 }
    its(:rate)         { should be == Rational(63, 151)            }
    its(:gross_income) { should be == '171588112.364299892'.to_d   }
    its(:net_income)   { should be == 100_000_000 }
    its(:taxes)        { should be == '71588112.364299892'.to_d }
  end
end
