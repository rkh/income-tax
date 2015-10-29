module IncomeTax
  module Countries
    Dir.glob("#{__dir__}/countries/*.rb") { |f| require(f) }
  end
end
