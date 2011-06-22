Feature: Tumblelogs can look up their most-used tags
  In order to increase connectedness
  A Tumblelog
  Can look up its most-used tags

@tumblr_movingtompls
Scenario: get tags
  Given I am on the home page
   When I fill in "Tumblelog name" with "movingtompls"
    And I fill in "Limit" with "6"
    And I press "Tag Me"
   Then I should be on the tags page for "movingtompls"
    And I should see these tags:
      | minneapolis | 48 |
      | art         | 12 |
      | st. paul    |  8 |
      | food        |  6 |
      | minnesota   |  6 |
      | biking      |  5 |
