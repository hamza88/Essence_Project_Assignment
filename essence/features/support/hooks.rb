require 'watir-webdriver'

Before do
  @browser = Watir::Browser.new :firefox
  @browser.cookies.clear
  @browser.window.resize_to(1200, 1020)
end


After do |scenario|
	scenario_name = "#{scenario.name}"
	link_text = "#{scenario_name}"
  encoded_img = @browser.driver.screenshot_as(:base64)
  if scenario.failed?
    embed("data:image/png;base64,#{encoded_img}", 'image/png', "***** #{link_text} *****")
  else
    embed("data:image/png;base64,#{encoded_img}", 'image/png', "#{link_text}")
  end
  @browser.close unless @browser.nil?
end