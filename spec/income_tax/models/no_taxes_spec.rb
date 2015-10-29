describe IncomeTax::Models::NoTaxes do
  let(:model)      { Class.new(described_class)                       }
  subject(:result) { model.new(income: 100, income_type: income_type) }

  describe "from gross income" do
    let(:income_type)  { :gross }
    its(:rate)         { should be == IncomeTax::Rate("0%") }
    its(:gross_income) { should be == 100                   }
    its(:net_income)   { should be == 100                   }
    its(:taxes)        { should be == 0                     }
  end

  describe "from net income" do
    let(:income_type)  { :net }
    its(:rate)         { should be == IncomeTax::Rate("0%") }
    its(:gross_income) { should be == 100                   }
    its(:net_income)   { should be == 100                   }
    its(:taxes)        { should be == 0                     }
  end
end
