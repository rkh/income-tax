describe IncomeTax::Countries::Netherlands do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }

  context "tax year 2016" do
    let(:tax_year) { 2016 }

    context "gross income" do
      let(:type) { :gross }

      context "AOW age not reached" do
        describe "of 0" do
          let(:income) { 0 }
          its(:rate) { is_expected.to eq(Rational(0, 1)) }
          its(:gross_income) { is_expected.to eq(0) }
          its(:net_income) { is_expected.to eq(0) }
          its(:taxes) { is_expected.to eq(0) }
        end

        describe "of 1000" do
          let(:income) { 1000 }
          its(:rate) { is_expected.to eq(Rational(125, 342)) }
          its(:gross_income) { is_expected.to eq(1000) }
          its(:net_income) { is_expected.to eq("634.5".to_d) }
          its(:taxes) { is_expected.to eq("365.5".to_d) }
        end

        describe "of 10000" do
          let(:income) { 10000 }
          its(:rate) { is_expected.to eq(Rational(125, 342)) }
          its(:gross_income) { is_expected.to eq(10000) }
          its(:net_income) { is_expected.to eq(6345) }
          its(:taxes) { is_expected.to eq(3655) }
        end

        describe "of 100000" do
          let(:income) { 100000 }
          its(:rate) { is_expected.to eq(Rational(232, 533)) }
          its(:gross_income) { is_expected.to eq(100000) }
          its(:net_income) { is_expected.to eq("56471.833".to_d) }
          its(:taxes) { is_expected.to eq("43528.167".to_d) }
        end

        describe "of 100000000" do
          let(:income) { 100000000 }
          its(:rate) { is_expected.to eq(Rational(222, 427)) }
          its(:gross_income) { is_expected.to eq(100000000) }
          its(:net_income) { is_expected.to eq("48008471.833".to_d) }
          its(:taxes) { is_expected.to eq("51991528.167".to_d) }
        end
      end

      context "AOW age reached" do
        subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year, birthday: birthday) }

        context "born before 1946" do
          let(:birthday) { Date.new(1939, 12, 31) }

          describe "of 0" do
            let(:income) { 0 }
            its(:rate) { is_expected.to eq(Rational(0, 1)) }
            its(:gross_income) { is_expected.to eq(0) }
            its(:net_income) { is_expected.to eq(0) }
            its(:taxes) { is_expected.to eq(0) }
          end

          describe "of 1000" do
            let(:income) { 1000 }
            its(:rate) { is_expected.to eq(Rational(47, 252)) }
            its(:gross_income) { is_expected.to eq(1000) }
            its(:net_income) { is_expected.to eq("813.5".to_d) }
            its(:taxes) { is_expected.to eq("186.5".to_d) }
          end

          describe "of 10000" do
            let(:income) { 10000 }
            its(:rate) { is_expected.to eq(Rational(47, 252)) }
            its(:gross_income) { is_expected.to eq(10000) }
            its(:net_income) { is_expected.to eq(8135) }
            its(:taxes) { is_expected.to eq(1865) }
          end

          describe "of 100000" do
            let(:income) { 100000 }
            its(:rate) { is_expected.to eq(Rational(149, 398)) }
            its(:gross_income) { is_expected.to eq(100000) }
            its(:net_income) { is_expected.to eq("62562.666".to_d) }
            its(:taxes) { is_expected.to eq("37437.334".to_d) }
          end
        end

        context "born after January 1st 1946 and before October 1950" do
          let(:birthday) { Date.new(1950, 9, 30) }

          describe "of 0" do
            let(:income) { 0 }
            its(:rate) { is_expected.to eq(Rational(0, 1)) }
            its(:gross_income) { is_expected.to eq(0) }
            its(:net_income) { is_expected.to eq(0) }
            its(:taxes) { is_expected.to eq(0) }
          end

          describe "of 1000" do
            let(:income) { 1000 }
            its(:rate) { is_expected.to eq(Rational(47, 252)) }
            its(:gross_income) { is_expected.to eq(1000) }
            its(:net_income) { is_expected.to eq("813.5".to_d) }
            its(:taxes) { is_expected.to eq("186.5".to_d) }
          end

          describe "of 10000" do
            let(:income) { 10000 }
            its(:rate) { is_expected.to eq(Rational(47, 252)) }
            its(:gross_income) { is_expected.to eq(10000) }
            its(:net_income) { is_expected.to eq(8135) }
            its(:taxes) { is_expected.to eq(1865) }
          end

          describe "of 100000" do
            let(:income) { 100000 }
            its(:rate) { is_expected.to eq(Rational(601, 1603)) }
            its(:gross_income) { is_expected.to eq(100000) }
            its(:net_income) { is_expected.to eq("62506.818".to_d) }
            its(:taxes) { is_expected.to eq("37493.182".to_d) }
          end
        end
      end
    end

    context "net income" do
      let(:type) { :net }

      describe "of 0" do
        let(:income) { 0 }
        its(:rate) { is_expected.to eq(Rational(0, 1)) }
        its(:gross_income) { is_expected.to eq(0) }
        its(:net_income) { is_expected.to eq(0) }
        its(:taxes) { is_expected.to eq(0) }
      end

      describe "of 1000" do
        let(:income) { 1000 }
        its(:rate) { is_expected.to eq(Rational(125, 342)) }
        its(:gross_income) { is_expected.to eq("1576.0441292356186".to_d) }
        its(:net_income) { is_expected.to eq(1000) }
        its(:taxes) { is_expected.to eq("576.0441292356186".to_d) }
      end

      describe "of 10000" do
        let(:income) { 10000 }
        its(:rate) { is_expected.to eq(Rational(125, 342)) }
        its(:gross_income) { is_expected.to eq("15760.441292356186".to_d) }
        its(:net_income) { is_expected.to eq(10000) }
        its(:taxes) { is_expected.to eq("5760.441292356186".to_d) }
      end

      describe "of 100000" do
        let(:income) { 100000 }
        its(:rate) { is_expected.to eq(Rational(146, 307)) }
        its(:gross_income) { is_expected.to eq("190683.68125".to_d) }
        its(:net_income) { is_expected.to eq(100000) }
        its(:taxes) { is_expected.to eq("90683.68125".to_d) }
      end

      describe "of 100000000" do
        let(:income) { 100000000 }
        its(:rate) { is_expected.to eq(Rational(417, 802)) }
        its(:gross_income) { is_expected.to eq("208315683.68125".to_d) }
        its(:net_income) { is_expected.to eq(100000000) }
        its(:taxes) { is_expected.to eq("108315683.68125".to_d) }
      end
    end
  end
end
