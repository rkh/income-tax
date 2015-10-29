module IncomeTax
  module Countries
    class HongKong < Models::Progressive
      register "Hong Kong", "HK", "HKG"
      currency "HKD"

      bucket_size = 40000
      level offset(bucket_size), "2%"
      level offset(bucket_size), "7%"
      level offset(bucket_size), "12%"
      remainder "17%"
      # TODO: cap at 15%
    end
  end
end
