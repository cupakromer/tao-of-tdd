# We start by naming the feature. This can be any English sentence or phrase.
# Since this is about usage of the tool, we name it respectively
Feature: Using Trader

  Given two files `RATES.xml` and `TRANS.csv` respectively:

    1. The first is an XML file containing the conversion rates for exchanging
       one currency with another

    2. The second is a CSV file containing sales data by transaction for an
       international business.

  Running `trader` will output the grand total of sales for the requested item,
  in the desired currency.

  # Above is a high level overview of what this feature is. For use, the feature
  # is how to interact with the command line tool. So here we simply explain
  # how that works at a very high level.

  Scenario: Usage Instructions
    # Now we write gherkin to explain how this usage scenario works. The
    # majority of the heavy lifting regarding the steps has already been done
    # for us by the Aruba gem.
    When I run `trader`
    Then the output should contain:
      """
      USAGE: trader ITEM CURRENCY RATES TRANSACTIONS
      """

  @wip
  Scenario: Basic Usage
    The provided `RATES.xml` file has a direct mapping of all currencies to each
    other.

    The search criteria is a single `sku` value in one or more of the line items
    in the `TRANS.csv` file.

    In order to find the desired sum total for a given `sku` across all stores,
    I additionally need to provide the conversion exchange rates, all of the
    transactions, and what target currency the sum total must be in.
    This allows me to understand how our projects are selling nation wide so
    we can better provide what our customers want.

    # Here we write out job story. It doesn't follow typical "user story",
    # format as before. Instead it provides more details and background on the
    # whys for the scenario.
    #
    # Anything up until the first Given, When, Then is considered free text by
    # Cucumber and is not run.

    Given a file named "RATES.xml" with:
      """xml
      <?xml version="1.0"?>
      <rates>
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
      """
    And a file named "TRANS.csv" with:
      """csv
      store,sku,amount
      Yonkers,DM1210,70.00 USD
      Yonkers,DM1182,19.68 CAD
      Nashua,DM1182,58.58 CAD
      Scranton,DM1210,68.76 USD
      Camden,DM1182,54.64 USD
      """
    When I run `trader DM1182 USD RATES.xml TRANS.csv`
    Then the output should contain "133.60"
