Feature: Tumblelogs can look up their most-used tags
  In order to increase connectedness
  A Tumblelog
  Can look up its most-used tags

Scenario: get tags
  Given I am on the home page
   When I fill in "Tumblelog name" with "erikostrom"
    And I press "Tag Me"
   Then I should be on the tags page for "erikostrom"
    And I should see these tags:
      | politics    | 8 |
      | minneapolis | 6 |
      | city life   | 5 |
