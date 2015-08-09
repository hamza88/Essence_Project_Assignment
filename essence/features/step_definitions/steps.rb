Given(/^I navigate to apple site$/) do
	@browser.goto "http://concierge.apple.com/reservation/us/en/techsupport/"
end

Given(/^I select US locale$/) do
	@browser.ul(:class => "grb").li(:id => /en_US/).when_present.click
	fail unless @browser.text.include? "Contact Apple Support"
end

Given(/^I select device "([^"]*)"$/) do |device|
	@browser.td(:text => device).click
end

Given(/^I select Battery, Power & Charging$/) do 
	Watir::Wait.until { @browser.text.include? 'Need help with iPhone?' }
	@browser.div(:class => "clr ht72").click
end

Given(/^I select fault "([^"]*)"$/) do |fault_type|
	Watir::Wait.until(30){ 
		@browser.ul(:id => "dataList1").visible? }
	@browser.link(:text, "Application or system is unresponsive").click
end

Given(/^I select Yes for the next option$/) do 
	Watir::Wait.until(10){ 
		@browser.div(:id => "slidePanel").visible? }
	@browser.button(:id => "Yes").click
end

Given(/^I skip sending personal information$/) do 
	Watir::Wait.until(10){ 
		@browser.div(:class => "declineContainer2").visible? }
	@browser.element(:css,".declineContainer2").click
	@browser.div(:class => "declineContainer2").button(:class => "declineDiagnostic").click

end

Given(/^I proceed to make a Genius Bar Reservation$/) do 
	@browser.link(:text => "Make a Genius Bar Reservation").when_present.click
end

Then(/^I set my location as location as "([^"]*)" and set any carrier to "([^"]*)"$/) do |city, provider|
	@browser.span(:id => "location_txt_reset").when_present.click
	@browser.text_field(:id, 'q').set(city)
	@browser.select_list(:id, "carrier").select(provider)
end

Given(/^I submit my search$/) do 
	@browser.button(:id => "showMap").when_present.click
end

Given(/^I choose the Upper West Side store$/) do 
	Watir::Wait.until(10){ 
		@browser.div(:class => "map_holder").visible? }
	@browser.div(:id => "stores_wrapper").div(:id => "4").h1(:title => "APPLE STORE, UPPER WEST SIDE").click
	@browser.div(:id => "stores_wrapper").div(:id => "4").div(:class => "confirm_reservation acc-clickable").click
end

Given(/^I sign in with the test account you previously created$/) do 
	Watir::Wait.until(30) { @browser.text.include? 'Contact Apple Support' }
	sleep 5
	@browser.text_field(:id, "accountname").set("appletestorange@gmail.com")
	@browser.text_field(:id, "accountpassword").set("Qwert12345!")
	@browser.button(:value,"Sign in").when_present.click
end

Then(/^I select any available slot AND any available time$/) do
	Watir::Wait.until(30) { @browser.div(:class => "slide_time_selection_wrapper").visible? }
	@browser.element(:css => ".right_arrow").click
	sleep 5
	@browser.element(:xpath => ".//*[@id='slide_timeslot']/div[2]/div[2]/div[2]/div/div[3]/div/div[2]/div[2]/div[4]").click
	@browser.element(:xpath => ".//*[@id='slide_timeslot']/div[2]/div[2]/div[2]/div/div[3]/div/div[2]/div[2]/div[8]/div[2]/div[2]/div/div[3]").click
	sleep 5
	@browser.button(:id => "timeslot_continue").click
end

Then(/^I check that the confirmation message is displayed$/) do
	Watir::Wait.until(60) { @browser.text.include? 'Your reservation is confirmed.' }
end


