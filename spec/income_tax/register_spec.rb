describe IncomeTax::Register do
  subject(:register) { IncomeTax::Register.new('example') }
  before { register.add('Foo And Bar', 42) }

  example { expect(register['Foo And Bar']) .to be == 42 }
  example { expect(register['foo-bar'])     .to be == 42 }

  example { expect(register) .to     include('Foo And Bar') }
  example { expect(register) .to     include('foo and bar') }
  example { expect(register) .to     include('Foo Bar')     }
  example { expect(register) .to_not include('Foo')         }

  example { expect { register['Foo'] }.to raise_error(ArgumentError, 'unknown example "Foo"') }
end
