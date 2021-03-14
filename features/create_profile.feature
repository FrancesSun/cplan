Feature: Create Profile
    As a first time user, I need to fill out my profile to proceed to other features
    If I am not logged in, I should redirect to homepage

Background: 
    Given I am logged in
    Given the following students exist:
    | first_name        | last_name | email                   |
    | Yunbo             | Liang     | yunboliang@columbia.edu |
    | leo               | lee       | leolee@columbia.edu     |
    | Joy               | Li        | joyli@columbia.edu      |

Scenario: CS major, Software systems track
    Given I am on the create profile page for "Yunbo"
    When I select "Software Systems" from "Select Your Track"
    When I fill in "Expected Graduation Year" with "2023"
    When I select "Fall" from "Expected Graduation Semester"
    And I press "Submit"
    Then I should be on the audit degree page for "Yunbo"
    And I should see "2023"
    And I should see "Yunbo"

Scenario: CS major, Machine Learning track
    Given I am on the create profile page for "leo"
    When I select "Machine Learning" from "Select Your Track"
    When I fill in "Expected Graduation Year" with "2022"
    When I select "Spring" from "Expected Graduation Semester"
    And I press "Submit"
    Then I should be on the audit degree page for "leo"
    And I should see "2022"
    And I should see "leo"
