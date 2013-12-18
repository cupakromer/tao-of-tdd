# Adder

A simple CLI tool for adding numbers together.

## Installation

Add this line to your application's Gemfile:

    gem 'adder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install adder

## Usage

To use this tool simple run the executable passing it various numbers:

    $ adder 1 2 3
    6.00

It will output the sum, rounded using standard rounding, to two decimal places.
You can also pass it floats of arbitrary precision:

    $ adder 1 11.2245 0.4405
    12.67
