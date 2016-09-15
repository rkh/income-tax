module IncomeTax
  module Countries
    class BosniaAndHerzegovina < Models::FixedRate
      register 'Bosnia And Herzegovina', 'Bosnia', 'Herzegovina', 'Srpska', 'Republika Srpska', 'BA', 'BIH'
      currency 'BAM'
      rate     '10%'
    end
  end
end
