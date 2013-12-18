# Trader

A CLI tool implementing the solution for the Puzzle Node problem:
[[#1] International trade](http://www.puzzlenode.com/puzzles/1-international-trade)

## Installation

Add this line to your application's Gemfile:

    gem 'trader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install trader

## Usage

Given input file `RATES.xml` with the format:

```xml
<?xml version="1.0"?>
<rates>
  <rate>
    <from>AUD</from>
    <to>CAD</to>
    <conversion>1.0079</conversion>
  </rate>
  <rate>
    <from>CAD</from>
    <to>USD</to>
    <conversion>1.0090</conversion>
  </rate>
  <rate>
    <from>USD</from>
    <to>CAD</to>
    <conversion>0.9911</conversion>
  </rate>
</rates>
```

and a `TRANS.csv` listing transactions with the format:

```text
store,sku,amount
Yonkers,DM1210,70.00 USD
Yonkers,DM1182,19.68 AUD
Nashua,DM1182,58.58 AUD
Scranton,DM1210,68.76 USD
Camden,DM1182,54.64 USD
```

The executable is run by providing a `sku` and a currency along with the above
two files:

```bash
# USAGE:
# trader SKU    CURRENCY RATES      TRANS
$ trader DM1182 USD      RATES.xml  TRANS.csv
134.22
```

The result is the grand total of sales for item `DM1182` across all stores in
`USD` (US Dollars).
