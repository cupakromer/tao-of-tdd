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

end
