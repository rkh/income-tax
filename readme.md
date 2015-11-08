# Income Tax Estimation

Given a country and either the gross or net income, this library can estimate
the personal income tax. These are very rough estimates, mostly ignoring any
potential tax deductions.

It has the following goals:

* Zero external dependencies.
* Compatible with the [money gem](http://rubymoney.github.io/money/).
* Full test coverage.

## Usage

``` ruby
require 'income_tax'

# €4k per month before taxes in Estonia, which has a fixed 20% tax rate
tax_info = IncomeTax.new("Estonia", "4k/mo")
tax_info.gross_income # => 48000
tax_info.net_income   # => 38400
tax_info.taxes        # => 9600
tax_info.rate         # => "20%"
tax_info.to_f         # => 0.2
tax_info.to_r         # => (1/5)

# Making €4k after taxes
tax_info = IncomeTax.new("Estonia", "4k/mo", :net)
tax_info.gross_income # => 60000
tax_info.net_income   # => 48000

# Using the money gem (will automatically convert to appropriate currency)
require "money"
tax_info = IncomeTax.new("Estonia", Money.new(100_000, "USD"))
tax_info.gross_income # => 89000 (depending on exchange rate)
```

Unless handed in as [money](http://rubymoney.github.io/money/) object, values
are assumed to be in the local currency, with the notable exception of Zimbabwe,
for which USD is used.

## Supported Locations

### Countries

This gem uses a very broad definition of countries, whereby the following are counted as separate entities:

* UN member states.
* Overseas territories, outermost regions and colonies.
* Some autonomous regions enjoying partial sovereignty, esp. if they have full autonomy over tax regime and collection (like Hong Kong).
* States with limited but widespread recognition (like Taiwan, Kosovo, Palestine).

Things not considered separate countries:

* Sovereign entities without any actual territory (The Holy See, Sovereign Military Order of Malta).
* States with very limited recognition (like Northern Cyprus, South Ossetia).
* Scotland, Wales, England and Northern Ireland (they are collectively treated as one country).
* Unclaimed or heavily disputed territories.
* Antarctica.

These decisions and differentiations are made to best model international income taxes and are not meant to convey any political opinion.

Of course, suggestions and patches are always welcome.

There is also a [full list of countries](locations.md).

### Country Divisions

#### United States

* **Federal only:** By default only federal taxes are calculated.
* **State taxes:** Passing in the `state` option with either the full name of the state of the two letter abbreviation will also take state taxes into account.
* **Washington, D.C.:** Use the state option as if it was a state, which by the way it should be.
* **Guam, Puerto Rico, and other territories:** Treat them like separate countries.

``` ruby
IncomeTax.new("US", "100k")
IncomeTax.new("US", "100k", state: "California")

IncomeTax.new("Guam", "100k")
```

#### Switzerland

You can use the `canton` option with either the full canton name or the two letter abbreviation.
If not passed in, it will default to `ZH` (Zurich).

``` ruby
IncomeTax.new("CH", "100k", canton: "Bern")
```

#### Tanzania

You can set the `location` option to Mainland (default) or Zanzibar.

``` ruby
IncomeTax.new("TZ", "16m", location: "Zanzibar")
```

## Other Options

* **`married`:** Whether or not the tax payer is married. Respected by the French, German, Irish, Maltese, Nepali, Nicaraguan, Swiss and U.S. American tax model.
* **`children`:** Number of children the tax payer has to provide for. Respected by the French, Maltese and Swiss tax model.
* **`joint_statement`:** If married, whether or not both spouses file a joint statement. Respected by the U.S. American tax model.
* **`head_of_household`:** Whether or not the tax payer is the head of the household. Respected by the U.S. American tax model.
* **`self_employed`:** Whether the tax payer is employed or freelancing. Respected by the Costa Rican and Nicaraguan tax model.
* **`age` or `birthday`:** To determine age depended taxes. Respected by the Australian, Bangladeshi and Barbadian tax model.
* **`gender`:** `male` or `female`, respected by the Bangladeshi tax model.
* **`disabled`:** Whether or not the tax payer has a physical or psychological disability, respected by the Bangladeshi tax model.
* **`wounded_freedom_fighter`:** Whether or not the tax payer is a war-wounded freedom fighter, respected by the Bangladeshi tax model.
* **`presumptive`:** Whether or not presumptive taxes are paid. Respected by the Tanzanian tax model. This value has a smart default.
* **`tax_year`:** Year this income tax is due for. Supported by all tax models but tax rates might be incomplete for past or future tax years (will fall back on previous year if data is missing).

## Limitations

General limitations:

* It only calculates personal income tax (ie, the tax the employee has to pay).
* Religious taxes (like church taxes in Germany or Khums in Iran) are currently
not taken into account.
* Tax deductions are largely not taken into account.
* Double taxation is not taken into account.
* Rules around multiple tax regimes based on citizenship are not taken into account.
* Differentiation between domestic and foreign income.
* It does not differentiate on tax year. Wherever possible, rates for the current or even upcoming year have been used.

Specific examples of what is not taken into account:

* French citizens (or in some cases, any new citizens) living in overseas territories often have to pay French income tax for the first five years.
* French citizens living or working in Monaco have to pay French income tax instead.
* German citizens living in Switzerland may have to pay German income tax for the first five years depending on the source of income.
* Employees in the West Bank have a high likelihood of paying Israeli income tax instead of Palestinian income tax.
* For people living in Puerto Rico and Guam, there is a chance that they may have to pay US federal income tax instead.
* Mali has a [choose your own tax adventure](http://www.bbc.co.uk/news/magazine-31907670), and livestock is acceptable currency when paying taxes.

These lists are very much incomplete.

Suggestions and patches on addressing any of these are, of course, more than welcome.
