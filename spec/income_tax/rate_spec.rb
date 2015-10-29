describe IncomeTax::Rate do
  subject(:rate) { IncomeTax::Rate(input) }
  let(:input) { "20%" }

  describe "calculating taxes" do
    example { expect(rate.net(100))         .to eql(80)  }
    example { expect(rate.gross(80))        .to eql(100) }
    example { expect(rate.gross_taxes(100)) .to eql(20)  }
    example { expect(rate.net_taxes(80))    .to eql(20)  }

    describe "with a negative tax rate" do
      let(:input) { -20 }
      example { expect(rate.net(100))         .to eql(120) }
      example { expect(rate.gross(120))       .to eql(100) }
      example { expect(rate.gross_taxes(100)) .to eql(-20) }
      example { expect(rate.net_taxes(120))   .to eql(-20) }
    end

    describe "with a tax rate of 0%" do
      let(:input) { 0 }
      example { expect(rate.net(100))         .to eql(100) }
      example { expect(rate.gross(100))       .to eql(100) }
      example { expect(rate.gross_taxes(100)) .to eql(0)   }
      example { expect(rate.net_taxes(100))   .to eql(0)   }
    end

    describe "with a tax rate of 100%" do
      let(:input) { 1.0 }
      example { expect(rate.net(100))         .to eql(0)   }
      example { expect(rate.net(0))           .to eql(0)   }
      example { expect(rate.gross_taxes(100)) .to eql(100) }
      example { expect(rate.net_taxes(100))   .to eql(100) }

      example { expect(rate.gross(100)).to be_infinite }
    end
  end

  example { expect(rate)              .to be_a(Numeric) }
  example { expect(Numeric === rate)  .to be            }

  describe "new" do
    shared_examples "20%" do
      its(:to_s)    { should be == "20%"                      }
      its(:to_r)    { should be == 0.2r                       }
      its(:to_f)    { should be == 0.2                        }
      its(:to_i)    { should be == 0                          }
      its(:to_d)    { should be == "0.2".to_d                 }
      its(:inspect) { should be == '#<IncomeTax::Rate:"20%">' }

      example { String(rate)     .should be == "20%"      }
      example { Rational(rate)   .should be == 0.2r       }
      example { Float(rate)      .should be == 0.2        }
      example { Integer(rate)    .should be == 0          }
      example { BigDecimal(rate) .should be == "0.2".to_d }

      describe "#==" do
        it { should     be == rate                   }
        it { should     be == IncomeTax::Rate("20%") }
        it { should     be == IncomeTax::Rate(0.2)   }
        it { should     be == 0.2r                   }
        it { should     be == 0.2                    }
        it { should_not be == "20%"                  }
        it { should_not be == 0.3r                   }
        it { should_not be == 0.3                    }
        it { should_not be == IncomeTax::Rate("30%") }
        it { should_not be == IncomeTax::Rate(0.3)   }
      end
    end

    describe "from float" do
      include_examples "20%"
      let(:input) { 0.2 }
    end

    describe "from rational" do
      let(:input) { 0.2r }
      include_examples "20%"
    end

    describe "from integer" do
      let(:input) { 20 }
      include_examples "20%"
    end

    describe "from string" do
      let(:input) { "0.2" }
      include_examples "20%"
    end

    describe "from percentage string" do
      include_examples "20%"
    end

    describe "from two integers" do
      subject(:rate) { IncomeTax::Rate(1,5) }
      include_examples "20%"
    end

    describe "from percentage string with digits" do
      let(:input) { "20.3%" }

      its(:to_s) { should be == "20.3%"      }
      its(:to_r) { should be == 0.203r       }
      its(:to_f) { should be == 0.203        }
      its(:to_d) { should be == "0.203".to_d }
    end

    describe "invalid string input" do
      let(:input) { "foo" }

      example do
        expect { rate }.to \
        raise_error(ArgumentError, 'cannot handle "foo" as rate input')
      end
    end
  end

  describe "#+" do
    describe "with another rate" do
      let(:other) { IncomeTax::Rate("50%") }
      example { expect(rate + other).to be_eql(IncomeTax::Rate("70%")) }
      example { expect(other + rate).to be_eql(IncomeTax::Rate("70%")) }
    end

    describe "with a float" do
      let(:other) { 0.5 }
      example { expect(rate + other).to be_eql(0.7) }
      example { expect(other + rate).to be_eql(0.7) }
    end

    describe "with a rational" do
      let(:other) { 0.5r }
      example { expect(rate + other).to be_eql(0.7r) }
      example { expect(other + rate).to be_eql(0.7r) }
    end

    describe "with a big decimal" do
      let(:other) { "0.5".to_d }
      example { expect(rate + other).to be_eql("0.7".to_d) }
      example { expect(other + rate).to be_eql("0.7".to_d) }
    end

    describe "with an integer" do
      let(:other) { 1 }
      example { expect(rate + other).to be_eql(1.2r) }
      example { expect(other + rate).to be_eql(1.2r) }

      describe "based on rational" do
        let(:input) { 0.2r }
        example { expect(rate + other).to be_eql(1.2r) }
        example { expect(other + rate).to be_eql(1.2r) }
      end

      describe "based on float" do
        let(:input) { 0.2 }
        example { expect(rate + other).to be_eql(1.2) }
        example { expect(other + rate).to be_eql(1.2) }
      end

      describe "at 0%" do
        let(:input) { 0 }
        example { expect(rate + other).to be_eql(1) }
        example { expect(other + rate).to be_eql(1) }
      end

      describe "at 100%" do
        let(:input) { 1.0 }
        example { expect(rate + other).to be_eql(2) }
        example { expect(other + rate).to be_eql(2) }
      end
    end
  end

  describe "#-" do
    describe "with another rate" do
      let(:other) { IncomeTax::Rate("10%") }
      example { expect(rate - other).to be_eql(IncomeTax::Rate("10%"))  }
      example { expect(other - rate).to be_eql(IncomeTax::Rate("-10%")) }
    end

    describe "with a float" do
      let(:other) { 0.1 }
      example { expect(rate - other).to be_eql(0.1) }
      example { expect(other - rate).to be_eql(-0.1) }
    end

    describe "with a rational" do
      let(:other) { 0.1r }
      example { expect(rate - other).to be_eql(0.1r) }
      example { expect(other - rate).to be_eql(-0.1r) }
    end

    describe "with a big decimal" do
      let(:other) { "0.1".to_d }
      example { expect(rate - other).to be_eql("0.1".to_d) }
      example { expect(other - rate).to be_eql(-"0.1".to_d) }
    end

    describe "with an integer" do
      let(:other) { 1 }
      example { expect(rate - other).to be_eql(-0.8r) }
      example { expect(other - rate).to be_eql(0.8r) }

      describe "based on rational" do
        let(:input) { 0.2r }
        example { expect(rate - other).to be_eql(-0.8r) }
        example { expect(other - rate).to be_eql(0.8r) }
      end

      describe "based on float" do
        let(:input) { 0.2 }
        example { expect(rate - other).to be_eql(-0.8) }
        example { expect(other - rate).to be_eql(0.8) }
      end

      describe "at 0%" do
        let(:input) { 0 }
        example { expect(rate - other).to be_eql(-1) }
        example { expect(other - rate).to be_eql(1) }
      end

      describe "at 100%" do
        let(:input) { 1.0 }
        example { expect(rate - other).to be_eql(0) }
        example { expect(other - rate).to be_eql(0) }
      end
    end
  end

  describe "#-@" do
    example { expect(-rate)     .to be_eql(IncomeTax::Rate("-20%")) }
    example { expect(-(-rate))  .to be_eql(IncomeTax::Rate("20%"))  }
  end

  describe "#coerce" do
    example("with a rate")     { expect(rate.coerce(rate))       .to be == [ rate,       rate       ] }
    example("with a rational") { expect(rate.coerce(0.3r))       .to be == [ 0.3r,       0.2r       ] }
    example("with a decirmal") { expect(rate.coerce("0.3".to_d)) .to be == [ "0.3".to_d, "0.2".to_d ] }
    example("with an integer") { expect(rate.coerce(1))          .to be == [ 1.to_d,     "0.2".to_d ] }
    example("with a float")    { expect(rate.coerce(0.3))        .to be == [ 0.3,        0.2        ] }
  end

  describe "as hash index" do
    let(:hash) { { rate => 42 } }

    # wanted to use the include matcher, but rspec uses Rate#== instead of Hash#include?
    example { expect(hash[ rate                   ]).to     be == 42 }
    example { expect(hash[ IncomeTax::Rate("20%") ]).to     be == 42 }
    example { expect(hash[ IncomeTax::Rate(0.2r)  ]).to     be == 42 }
    example { expect(hash[ rate.to_r              ]).not_to be == 42 }
    example { expect(hash[ rate.to_s              ]).not_to be == 42 }
    example { expect(hash[ rate.to_d              ]).not_to be == 42 }
  end

  describe "with ranges" do
  end
end
