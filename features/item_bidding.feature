Feature: Set a new bid for the given item
  As a user
  Such that I want to buy item from auction
  I want to set bit for the item

  Scenario: Setting a new bid (with success)
    Given the following items available
          | description                             | price   | closing_date |
          | Roller Derby Bron Blade Skote (Size 7)  | 29.00   | 2019-01-28 |
          | Chicago Bullet Speed Skate (Size 7)     | 59.00   | 2019-01-25 |
          | Riedell Dart Derby Skates (size 8)      | 106.00  | 2019-01-23 |
    And I want to offer 62.00$ for "Chicago Bullet Speed Skate (Size 7)"
    And I open project web page
    And I select item which description is "Chicago Bullet Speed Skate (Size 7)"
    And I enter the 62.00$ into the field
    When I submit the place bid button
    Then I should get the confrimation message

  Scenario: Setting a new bid (with rejection)
    Given the following items available
          | description                             | price   | closing_date |
          | Roller Derby Bron Blade Skote (Size 7)  | 29.00   | 2019-01-28 |
          | Chicago Bullet Speed Skate (Size 7)     | 59.00   | 2019-01-25 |
          | Riedell Dart Derby Skates (size 8)      | 106.00  | 2019-01-23 |
    And I want to offer 50.00$ for "CRiedell Dart Derby Skates (size 8)"
    And I open project web page
    And I select item which description is "CRiedell Dart Derby Skates (size 8)"
    And I enter the 50.00$ into the field
    When I submit the place bid button
    Then I should get the rejection message
