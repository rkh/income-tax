describe IncomeTax::Countries::Portugal do
  subject(:result) { described_class.new(income: income, income_type: type) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(29, 200)            }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 855                          }
    its(:taxes)        { should be == 145                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(23, 123)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8130                         }
    its(:taxes)        { should be == 1870                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(151, 392)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 61480                        }
    its(:taxes)        { should be == 38520                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(191, 398)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 52009480                     }
    its(:taxes)        { should be == 47990520                     }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(29, 200)            }
    its(:gross_income) { should be == "1169.5906432748538".to_d    }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "169.5906432748538".to_d     }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(17, 82)             }
    its(:gross_income) { should be == "12615.3846153846154".to_d   }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2615.38461538461538".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(20, 47)             }
    its(:gross_income) { should be == "174076.923076923077".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "74076.923076923077".to_d    }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(335, 698)           }
    its(:gross_income) { should be == "192289461.538461538".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "92289461.538461538".to_d    }
  end
end
