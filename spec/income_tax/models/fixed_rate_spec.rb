describe IncomeTax::Models::FixedRate do
  let(:model)      { Class.new(described_class) { rate "10%" }           }
  subject(:result) { model.new(income: income, income_type: income_type) }

  describe "from gross income" do
    let(:income_type) { :gross }
    let(:income)      { 1000   }

    its(:rate)         { should be == IncomeTax::Rate("10%") }
    its(:gross_income) { should be == 1000                   }
    its(:net_income)   { should be == 900                    }
    its(:taxes)        { should be == 100                    }
  end

  describe "from net income" do
    let(:income_type) { :net }
    let(:income)      { 900  }

    its(:rate)         { should be == IncomeTax::Rate("10%") }
    its(:gross_income) { should be == 1000                   }
    its(:net_income)   { should be == 900                    }
    its(:taxes)        { should be == 100                    }
  end
end
