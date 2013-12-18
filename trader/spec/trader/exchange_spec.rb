require 'spec_helper'
require 'trader/exchange'

describe Trader::Exchange do

  # We currently know nothing about what we want the exchange to do, so there is
  # no state to utilize
  #
  # This is a temporary test just to make sure we create the class. We'll flag
  # it with a tbd tag so we can easily search for it later if necessary.
  it "takes some rates", :tbd do
    rates = double("Some rates")
    expect(Trader::Exchange.new(rates)).to be_a Trader::Exchange
  end

end
