require 'spec_helper'
require 'adder/machine'

describe Adder::Machine do

  # Normally, we will add top level `context` blocks that represent different
  # states of the object. This adder machine has no state. So we'll go straight
  # into behavior.
  subject(:machine) { Adder::Machine.new }

  context "summing a single number" do
    # Here we aren't going to test every possible permutation of what can be
    # provided to us. While that is how "strict TDD" works, it often has
    # diminishing returns in real applications.
    it "returns the same number as a BigDecimal" do
      expect(machine.sum(132)).to eq BigDecimal.new(132)
    end
  end

  context "summing several numbers" do
    # At this point, we can be clever in our choice of test case. We can now
    # pass in several different types of numbers to verify that they are all
    # handled correctly.
    it "returns the arithmetic sum as a BigDecimal without rounding" do
      expect(machine.sum([100, 32], 1.22212, "53.123149"))
        .to eq BigDecimal.new("186.345269")
    end
  end

  context "summing non-numeric strings" do
    it "treats them as zeros" do
      expect(machine.sum(1, 2, "foo")).to eq 3
    end
  end

end
