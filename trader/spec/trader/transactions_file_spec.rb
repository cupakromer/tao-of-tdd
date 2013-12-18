require 'spec_helper'
require 'trader/transactions_file'

describe Trader::TransactionsFile do

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
        with_temp_file("transactions.csv", <<-EOF) do |csv_filepath|
          store,sku,amount
          Yonkers,DM1210,70.00 USD
          Yonkers,DM1182,19.68 AUD
          Nashua,DM1182,58.58 AUD
          Scranton,DM1210,68.76 USD
          Camden,DM1182,54.64 USD
          EOF

          # We haven't decided yet what this should return. We are deferring
          # that decision until we actually use whatever it is.
          #
          # We are giving it a descriptive symbol name for when we use it later
          # and things fail. We'll know it was a placeholder and that we need
          # to fix it. It also, makes it easier for use to grep the code to find
          # where we used it.
          expect(Trader::TransactionsFile.read(csv_filepath))
            .to eq :transactions_placeholder
        end
      end
    end
  end

  context "given an improperly formatted file"

end
