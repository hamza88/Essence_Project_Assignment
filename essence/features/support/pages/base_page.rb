#-- encoding: UTF-8
class BasePage
  include DataMagic
  include PageObject

  def assert_page_load(timeout = 125)
    wait_for_ajax
  end

   def assert_error_message(message)
    @browser.text.include?(message).should == true
  end

  
  end
