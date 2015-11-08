#!/usr/bin/env ruby
# go to https://www.estv.admin.ch/estv/de/home/direkte-bundessteuer/dienstleistungen/quellensteuer/tarife-herunterladen.html
# download "20xx Schweiz TXT"
# unpack and place text files in tmp/switzerland

$:.unshift 'lib'
require 'income_tax'

cantons = {
  Aargau:         ["AG", "Aargau", "Argovia"],
  AppenzellInner: ["AI", "Appenzell Inner Rhodes", "Appenzell Innerrhoden"],
  AppenzellOuter: ["AR", "Appenzell Outer Rhodes", "Appenzell Ausserrhoden"],
  BaselLand:      ["BL", "Basel-Landschaft", "Baselland", "Baselbiet", "Basel-Country"],
  BaselCity:      ["BS", "Basel-Stadt", "Basel-City", "Basel"],
  Bern:           ["BE", "Bern", "Berne"],
  Fribourg:       ["FR", "Fribourg", "Freiburg"],
  Geneva:         ["GE", "Geneva"],
  Glarus:         ["GL", "Glarus"],
  Grisons:        ["GR", "Grisons", "Graubünden", "Grigioni", "Grischun"],
  Jura:           ["JU", "Jura"],
  Lucerne:        ["LU", "Lucerne", "Luzern"],
  Neuchatel:      ["NE", "Neuchâtel", "Neuchatel"],
  Nidwalden:      ["NW", "Nidwalden"],
  Obwalden:       ["OW", "Obwalden"],
  Schaffhausen:   ["SH", "Schaffhausen"],
  Schwyz:         ["SZ", "Schwyz"],
  Solothurn:      ["SO", "Solothurn"],
  StGallen:       ["SG", "St. Gallen"],
  Thurgau:        ["TG", "Thurgau"],
  Ticino:         ["TI", "Ticino"],
  Uri:            ["UR", "Uri"],
  Valais:         ["VS", "Valais", "Wallis"],
  Vaud:           ["VD", "Vaud"],
  Zug:            ["ZG", "Zug"],
  Zurich:         ["ZH", "Zurich", "Zürich"]
}

print "Loading cantons            "
cantons = cantons.map do |class_name, names|
  print ?.
  code = names.shift
  [code, {class_name: class_name, names: [*names, code], levels: {}}]
end.to_h
puts

print "Loading raw data           "
source = ""
Dir.glob("#{__dir__}/../tmp/switzerland/*.txt") do |file|
  print ?.
  source << File.read(file)
end
puts

if source.empty?
  puts "!!! No data found. Please download an place in tmp/switzerland !!!"
  exit 1
end

print "Scanning lines (x10.000)   "
counter = 0
source.scan(/^0601(.{2})([AB].)N {7}(\d{04})\d{04}(\d{9})(\d{9}) \d{2}\d{9}0(\d{4})/) do |canton, code, year, lower_boundry, interval, rate_digits|
  counter += 1
  print ?. if counter % 10_000 == 0
  boundry   = lower_boundry.to_i + interval.to_i
  years     = cantons.fetch(canton)[:levels] ||= {}
  year_data = years[Integer(year)]           ||= {}
  levels    = year_data[code.to_sym]         ||= IncomeTax::Models::Progressive::Levels.new
  levels.level(boundry * 0.12r - 1, "0.#{rate_digits}".to_r)
end
puts


print "Setting remainder          "
cantons.each_value do |canton|
  print ?.
  canton[:levels].each_value do |map|
    map.each_value do |level|
      levels = level.instance_variable_get("@levels")
      level.remainder levels.last.last
    end
  end
end
puts

print "Generating files           "
cantons.each_value do |data|
  file_name = data[:class_name].to_s.gsub(/(\w)([A-Z])/, '\1_\2').downcase
  print ?.
  File.write("lib/income_tax/countries/switzerland/data/#{file_name}.dat", Marshal.dump(data[:levels]))
end
puts
