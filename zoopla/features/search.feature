Feature: As a Property searcher i should be able to search a property from the zoopla home page

  Scenario Outline: search property in a valid city with multiple criteria
   Given i am on zoopla home page
    And i click on For sale button
   Given  Given i search for "<bedrooms>" bedroom "<property_type>" in "<city>"  between "<min>" and "<max>"" price range
   When i click the search button
   Then i should be on the result page
    And I close the browser
    Examples:
      | bedrooms | property_type | city | min | max |
      | 2+        | Houses        | london | £100,000 | £400,000 |

    Scenario: The autocomplete search should work when I start writing into the search field
      Given  i am on zoopla home page
      When i seach for " Sheffield" on the home page
      Then  i should see  "Sheffield, South Yorkshire" within autocomplete list

