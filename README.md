# petrovic_elixir

[![petrovich](https://camo.githubusercontent.com/4555ec1b7aa15e0cd22f8ff619c965da0596399a/68747470733a2f2f7261772e6769746875622e636f6d2f726f637363692f706574726f766963682f6d61737465722f706574726f766963682e706e67)](https://github.com/petrovich/petrovich_elixir)

[![test](https://github.com/petrovich/petrovich_elixir/workflows/test/badge.svg)](https://github.com/petrovich/petrovich_elixir/actions?query=workflow%3Atest)
[![Coverage Status](https://coveralls.io/repos/github/petrovich/petrovich_elixir/badge.svg?branch=master)](https://coveralls.io/github/petrovich/petrovich_elixir?branch=master)
[![Hex Version](https://img.shields.io/hexpm/v/petrovich_elixir.svg)](https://hex.pm/packages/petrovich_elixir)
[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

Elixir library to inflect Russian first, last, and middle names.


## Installation

```elixir
def deps do
  [
    {:petrovich_elixir, "~> 1.0"}
  ]
end
```


## Usage

### Do I need to know Russian to use it?

Yes, you will need some basic Russian knowledge to work with this library.
You need to understand how [grammatical cases](https://en.wikipedia.org/wiki/Grammatical_case) work in Russian language.

### Inflection

```elixir
Petrovich.firstname!("Александр", :accusative)
# => Александра

Petrovich.middlename!("Сергеевич", :accusative)
# => Сергеевича

Petrovich.lastname!("Пушкин", :accusative, :male)
# => Пушкина
```

### Gender detection

```elixir
alias Petrovich.Detector

Detector.detect_gender("Александр", :firstname)
# => {:ok, "male"}
```


## Configuration

You will need to add these lines into your `config.exs`:

```elixir
config :petrovich_elixir,
  rules_path: "rules/rules.json",
  gender_path: "rules/gender.json",
  json_codec: Jason
```

You can swap our default ([`Jason`](https://github.com/michalmuskala/jason))
codec to any of your choice.


## Rules

This package uses [`petrovich-rules`](https://github.com/petrovich/petrovich-rules) as the source for all transformations. If you ever experience wrong result or other issues with the data itself, please open an issue [here](https://github.com/petrovich/petrovich-rules/issues).


## License

MIT. See [LICENSE](/LICENSE) for details.

