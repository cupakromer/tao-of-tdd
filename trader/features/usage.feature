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

  # As with any new feature we tag it as a work in progress
  @wip
  Scenario: Usage Instructions
    # Now we write gherkin to explain how this usage scenario works. The
    # majority of the heavy lifting regarding the steps has already been done
    # for us by the Aruba gem.
    When I run `trader`
    Then the output should contain:
      """
      USAGE: trader ITEM CURRENCY RATES TRANSACTIONS
      """
