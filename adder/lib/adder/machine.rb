require 'bigdecimal'

module Adder
  class Machine
    # Takes a list of numbers, which can be represented as integers, floats, or
    # numeric strings.
    #
    # All numbers are converted to BigDecimals before summing. The resulting sum
    # is returned.
    #
    # Any strings that are non-numeric are treated as zeros.
    def sum(*numbers)
      numbers.map{ |n| BigDecimal.new(n) }.reduce(:+)
    end
  end
end
