Feature: Book an appointment via apple store

Scenario: As a User I want to book an appointment
Given I navigate to apple site
And I select US locale
And I select device "iPhone"
And I select Battery, Power & Charging
And I select fault "Application or system is unresponsive"
And I select Yes for the next option
And I skip sending personal information
Then I proceed to make a Genius Bar Reservation
And I set my location as location as "new york" and set any carrier to "AT&T"
When I submit my search
And I choose the Upper West Side store
Then I sign in with the test account you previously created
And I select any available slot AND any available time
And I check that the confirmation message is displayed
