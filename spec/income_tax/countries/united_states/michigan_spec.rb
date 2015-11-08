describe IncomeTax::Countries::UnitedStates::Michigan do
  subject(:result) { IncomeTax::Countries::UnitedStates.new(income: income, income_type: type, tax_year: tax_year, state: 'Michigan') }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(56, 393)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == "857.5".to_d                 }
    its(:taxes)        { should be == "142.5".to_d                 }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(56, 393)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8575                         }
    its(:taxes)        { should be == 1425                         }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(67, 277)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "75812.75".to_d              }
    its(:taxes)        { should be == "24187.25".to_d              }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(99, 226)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "56195495.75".to_d           }
    its(:taxes)        { should be == "43804504.25".to_d           }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(51, 379)            }
    its(:gross_income) { should be == "1155.497534087612416".to_d  }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "155.497534087612416".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(51, 379)            }
    its(:gross_income) { should be == "11554.97534087612415".to_d  }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1554.97534087612415".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(80, 329)            }
    its(:gross_income) { should be == "132129.2672976501305".to_d  }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "32129.2672976501305".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(93, 226)            }
    its(:gross_income) { should be == "169926232.115530924".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "69926232.115530924".to_d    }
  end
end
