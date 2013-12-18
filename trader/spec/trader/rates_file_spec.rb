require "spec_helper"
require "trader/rates_file"

describe Trader::RatesFile do

  # We add top level contexts for each of the states we wish to have.
  context "given an empty file"

  context "given a properly formatted file" do
    # Add an inner context for the behavior we are testing
    context "reading the file" do
      it "returns the parsed rates" do
        # We start writing this test long form. Putting our state directly into
        # the test. While we think we have properly listed out or states (via
        # the top level contexts) we won't really be sure until we write a few
        # tests.
        #
        # Keeping everything in the test to start with prevent issues that may
        # arise during premature extraction when you extracted the wrong things.
        with_temp_file("rates.xml", <<-EOF) do |xml_filepath|
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
          EOF

          # We haven't decided yet what this should return. We are deferring
          # that decision until we actually use whatever it is.
          #
          # We are giving it a descriptive symbol name for when we use it later
          # and things fail. We'll know it was a placeholder and that we need
          # to fix it. It also, makes it easier for use to grep the code to find
          # where we used it.
          expect(Trader::RatesFile.read(xml_filepath)).to eq :rates_placeholder
        end
      end
    end
  end

  context "given an improperly formatted file"

end
