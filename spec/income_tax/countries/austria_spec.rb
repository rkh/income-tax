describe IncomeTax::Countries::Austria do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "tax year 2005" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2005                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2005                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2005                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(42, 101)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "58415.09".to_d              }
      its(:taxes)        { should be == "41584.91".to_d              }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(2655, 5311)         }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "50008415.09".to_d           }
      its(:taxes)        { should be == "49991584.91".to_d           }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(84, 185)            }
      its(:gross_income) { should be == "183169.82".to_d             }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "83169.82".to_d              }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(4800, 9601)         }
      its(:gross_income) { should be == "199983169.82".to_d          }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "99983169.82".to_d           }
    end
  end

  describe "tax year 2009" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2009                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2009                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2009                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(103, 256)           }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "59764.995".to_d             }
      its(:taxes)        { should be == "40235.005".to_d             }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(2322, 4645)         }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "50009764.995".to_d          }
      its(:taxes)        { should be == "49990235.005".to_d          }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(103, 231)           }
      its(:gross_income) { should be == "180470.01".to_d             }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "80470.01".to_d              }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(4250, 8501)         }
      its(:gross_income) { should be == "199980470.01".to_d          }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "99980470.01".to_d           }
    end
  end
end
