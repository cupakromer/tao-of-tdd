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
  it "reflects the provided number", :wip do
    expect( exec_io %w[ adder 132 ] ).to eq "132.00\n"
  end

end
