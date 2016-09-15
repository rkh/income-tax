module IncomeTax
  module Countries
    class VirginIslandsBritish < Models::FixedRate
      register 'Virgin Islands, British', 'Virgin Islands (British)', 'VG', 'VGB'
      currency 'USD'
      rate     '8%'
    end
  end
end
