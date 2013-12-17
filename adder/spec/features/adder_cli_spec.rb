require 'spec_helper'

# These are the high level job story specifications / features.
# They are essentially black box tests of the application from the end-user
# perspective.
#
# These should, in general, not employ mocks or stubs. Instead they setup any
# necessary environment state and check for the proper side effects / output.
describe "Running the adder tool from the command line" do

  # Feature specs can be very involved and not pass for some time. In order to
  # keep the build passing until the feature is fully baked, the spec is marked
  # as `:wip`; for "work in progress".
  #
  # This is a 'job story'. It is similar to a 'user story' but is a bit more
  # free form. Allowing for a wider range of descriptions and inclusion.
  # For more information on job stories see Alan Klement's post on replacing the
  # user story with the job story: http://bit.ly/JFfy8M
  #
  # In order to figure out how to use the tool,
  # When I run it from the command line,
  # I should see the usage displayed.
  it "displays the usage when not provided any arguments", :wip do
    expect( exec_io "adder" ).to eq "USAGE: adder NUM1 [NUM2] [NUM3]...\n"
  end

end
