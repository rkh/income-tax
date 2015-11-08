describe IncomeTax::Countries::Germany do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "tax year 2002" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2002                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2002                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2002                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(3, 47)              }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9361.725".to_d              }
      its(:taxes)        { should be == "638.275".to_d               }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2002                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(119, 292)           }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "59247.46".to_d              }
      its(:taxes)        { should be == "40752.54".to_d              }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2002                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(199, 389)           }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "48842914.96".to_d           }
      its(:taxes)        { should be == "51157085.04".to_d           }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2002                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2002                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2002                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(56, 463)            }
      its(:gross_income) { should be == "11376.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "1376.010582010582".to_d     }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2002                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(156, 349)           }
      its(:gross_income) { should be == "180826.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "80826.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2002                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(3532, 7065)         }
      its(:gross_income) { should be == "199975693.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "99975693.82010582".to_d     }
    end
  end

  describe "tax year 2004" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2004                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2004                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2004                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(11, 250)            }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9560.065".to_d              }
      its(:taxes)        { should be == "439.935".to_d               }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2004                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(37, 97)             }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "61856.475".to_d             }
      its(:taxes)        { should be == "38143.525".to_d             }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2004                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(103, 217)           }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "52534331.475".to_d          }
      its(:taxes)        { should be == "47465668.525".to_d          }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2004                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2004                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2004                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(20, 201)            }
      its(:gross_income) { should be == "11105.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "1105.010582010582".to_d     }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2004                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(161, 386)           }
      its(:gross_income) { should be == "171555.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "71555.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2004                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(92, 197)            }
      its(:gross_income) { should be == "187622204.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "87622204.82010582".to_d     }
    end
  end

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
      its(:rate)         { should be == Rational(11, 262)            }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9580.11".to_d               }
      its(:taxes)        { should be == "419.89".to_d                }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(73, 203)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "64039.27".to_d              }
      its(:taxes)        { should be == "35960.73".to_d              }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(206, 465)           }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "55698349.27".to_d           }
      its(:taxes)        { should be == "44301650.73".to_d           }
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
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(41, 421)            }
      its(:gross_income) { should be == "11079.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "1079.010582010582".to_d     }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(166, 423)           }
      its(:gross_income) { should be == "164589.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "64589.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2005                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(79, 180)            }
      its(:gross_income) { should be == "178220253.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "78220253.82010582".to_d     }
    end
  end

  describe "tax year 2007" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2007                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2007                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2007                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(11, 262)            }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9580.11".to_d               }
      its(:taxes)        { should be == "419.89".to_d                }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2007                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(73, 203)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "64039.27".to_d              }
      its(:taxes)        { should be == "35960.73".to_d              }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2007                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(383, 807)           }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "52541261.77".to_d           }
      its(:taxes)        { should be == "47458738.23".to_d           }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2007                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2007                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2007                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(41, 421)            }
      its(:gross_income) { should be == "11079.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "1079.010582010582".to_d     }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2007                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(166, 423)           }
      its(:gross_income) { should be == "164589.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "64589.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2007                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(99, 212)            }
      its(:gross_income) { should be == "187610260.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "87610260.82010582".to_d     }
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
      its(:rate)         { should be == Rational(16, 437)            }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9633.915".to_d              }
      its(:taxes)        { should be == "366.085".to_d               }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(237, 662)           }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "64198.575".to_d             }
      its(:taxes)        { should be == "35801.425".to_d             }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(28, 59)             }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "52541432.68".to_d           }
      its(:taxes)        { should be == "47458567.32".to_d           }
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
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(10, 109)            }
      its(:gross_income) { should be == "11010.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "1010.010582010582".to_d     }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(110, 281)           }
      its(:gross_income) { should be == "164328.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "64328.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2009                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(99, 212)            }
      its(:gross_income) { should be == "187609966.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "87609966.82010582".to_d     }
    end
  end

  describe "tax year 2010" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2010                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2010                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2010                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(10, 301)            }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9667.675".to_d              }
      its(:taxes)        { should be == "332.325".to_d               }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2010                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(96, 269)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "64312.515".to_d             }
      its(:taxes)        { should be == "35687.485".to_d             }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2010                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(28, 59)             }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "52541558.225".to_d          }
      its(:taxes)        { should be == "47458441.775".to_d          }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2010                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2010                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2010                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(25, 283)            }
      its(:gross_income) { should be == "10969.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "969.010582010582".to_d      }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2010                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(127, 325)           }
      its(:gross_income) { should be == "164143.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "64143.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2010                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(99, 212)            }
      its(:gross_income) { should be == "187609750.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "87609750.82010582".to_d     }
    end
  end

  describe "tax year 2013" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2013                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2013                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2013                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(4, 129)             }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9689.83".to_d               }
      its(:taxes)        { should be == "310.17".to_d                }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2013                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(97, 272)            }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "64337.835".to_d             }
      its(:taxes)        { should be == "35662.165".to_d             }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2013                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(28, 59)             }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "52541583.545".to_d          }
      its(:taxes)        { should be == "47458416.455".to_d          }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2013                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2013                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2013                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(13, 151)            }
      its(:gross_income) { should be == "10942.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "942.010582010582".to_d      }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2013                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(25, 64)             }
      its(:gross_income) { should be == "164102.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "64102.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2013                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(99, 212)            }
      its(:gross_income) { should be == "187609706.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "87609706.82010582".to_d     }
    end
  end

  describe "tax year 2014" do

    describe "from gross income of 0" do
      let(:tax_year)     { 2014                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 1000" do
      let(:tax_year)     { 2014                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2014                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(26, 963)            }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9729.92".to_d               }
      its(:taxes)        { should be == "270.08".to_d                }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2014                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(26, 73)             }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "64383.2".to_d               }
      its(:taxes)        { should be == "35616.8".to_d               }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2014                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(28, 59)             }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "52541628.91".to_d           }
      its(:taxes)        { should be == "47458371.09".to_d           }
    end

    describe "from net income of 0" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2014                                      }
      let(:income)       { 0                                         }
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 0                            }
      its(:net_income)   { should be == 0                            }
      its(:taxes)        { should be == 0                            }
    end

    describe "from net income of 1000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2014                                      }
      let(:income)       { 1000                                      }
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2014                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(27, 329)            }
      its(:gross_income) { should be == "10894.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "894.010582010582".to_d      }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2014                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(89, 228)            }
      its(:gross_income) { should be == "164027.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "64027.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2014                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(99, 212)            }
      its(:gross_income) { should be == "187609628.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "87609628.82010582".to_d     }
    end
  end

  describe "tax year 2015" do

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
      its(:rate)         { should be == Rational(0, 1)               }
      its(:gross_income) { should be == 1000                         }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == 0                            }
    end

    describe "from gross income of 10000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(1, 40)              }
      its(:gross_income) { should be == 10000                        }
      its(:net_income)   { should be == "9749.965".to_d              }
      its(:taxes)        { should be == "250.035".to_d               }
    end

    describe "from gross income of 100000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(21, 59)             }
      its(:gross_income) { should be == 100000                       }
      its(:net_income)   { should be == "64406.41".to_d              }
      its(:taxes)        { should be == "35593.59".to_d              }
    end

    describe "from gross income of 100000000" do
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(28, 59)             }
      its(:gross_income) { should be == 100000000                    }
      its(:net_income)   { should be == "52541652.12".to_d           }
      its(:taxes)        { should be == "47458347.88".to_d           }
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
      its(:rate)         { should be == Rational(11, 200)            }
      its(:gross_income) { should be == "1058.2010582010582".to_d    }
      its(:net_income)   { should be == 1000                         }
      its(:taxes)        { should be == "58.2010582010582".to_d      }
    end

    describe "from net income of 10000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 10000                                     }
      its(:rate)         { should be == Rational(69, 862)            }
      its(:gross_income) { should be == "10870.010582010582".to_d    }
      its(:net_income)   { should be == 10000                        }
      its(:taxes)        { should be == "870.010582010582".to_d      }
    end

    describe "from net income of 100000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000                                    }
      its(:rate)         { should be == Rational(199, 510)           }
      its(:gross_income) { should be == "163989.10582010582".to_d    }
      its(:net_income)   { should be == 100000                       }
      its(:taxes)        { should be == "63989.10582010582".to_d     }
    end

    describe "from net income of 100000000" do
      let(:type)         { :net                                      }
      let(:tax_year)     { 2015                                      }
      let(:income)       { 100000000                                 }
      its(:rate)         { should be == Rational(99, 212)            }
      its(:gross_income) { should be == "187609588.82010582".to_d    }
      its(:net_income)   { should be == 100000000                    }
      its(:taxes)        { should be == "87609588.82010582".to_d     }
    end
  end
end
