require 'spec_helper'

# These are the high level job story specifications / features.
# They are essentially black box tests of the application from the end-user
# perspective.
#
# These should, in general, not employ mocks or stubs. Instead they setup any
# necessary environment state and check for the proper side effects / output.
describe "Running the adder tool from the command line" do

  # This is a 'job story'. It is similar to a 'user story' but is a bit more
  # free form. Allowing for a wider range of descriptions and inclusion.
  # For more information on job stories see Alan Klement's post on replacing the
  # user story with the job story: http://bit.ly/JFfy8M
  #
  # In order to figure out how to use the tool,
  # When I run it from the command line,
  # I should see the usage displayed.
  it "displays the usage when not provided any arguments" do
    expect( exec_io "adder" ).to eq "USAGE: adder NUM1 [NUM2] [NUM3]...\n"
  end

  # In order to check an number identity,
  # When I run the adder with a single number,
  # I should see the same number.
  it "reflects the provided number" do
    expect( exec_io %w[ adder 132 ] ).to eq "132.00\n"
  end

  # In order to be useful to me,
  # I need to be able to add multiple numbers, including floating numbers
  # with arbitrary precision.
  # I should see the sum to two decimal places.
  it "sums numbers and floats to two decimal places" do
    expect( exec_io %w[ adder 1 2.1 3.22 ] ).to eq "6.32\n"
  end

  # When adding numbers with precision greater than 2 decimal places,
  # Standard rules for rounding to two decimal places are used.
  context "rounds sum to two decimal places using standard rounding" do
    it "rounds up on .5 or greater" do
      expect( exec_io %w[ adder 1 11.2245 0.4405 ] ).to eq "12.67\n"
    end

    it "rounds down on .49 or greater" do
      expect( exec_io %w[ adder 1 11.2245 0.4404 ] ).to eq "12.66\n"
    end
  end

end
