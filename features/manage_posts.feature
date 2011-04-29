Feature: Manage posts
  In order to learn about things
  vistors
  want to list posts on the system
  
  Scenario: Listing Posts
    Given the following posts:
      | title        | content           |
      | My post      | Cool post         |
      | My 2nd post  | Cooler post       |
    And I am on the posts page
    Then I should see "My post"
    And I should see "My 2nd post"
