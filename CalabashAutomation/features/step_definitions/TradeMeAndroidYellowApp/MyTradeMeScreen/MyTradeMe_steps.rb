require_relative  '../HomeScreen/MainLandingPage'
require_relative  '../MyTradeMeScreen/MTMFrame'
require_relative  '../LogInScreen/LoginPage'
require_relative  '../Helpers&Others/Constants'

When(/^I select "([^"]*)" from MTM$/) do |arg1|
  element = "android.support.v7.widget.AppCompatTextView marked:'#{arg1}'"
  elementByText =  query("android.support.v7.widget.AppCompatTextView {text CONTAINS '#{arg1}'}")
  found = false
  if !element_exists(element)
      if !elementByText.empty?
        found = true
        touch(elementByText)
      else
        wait_poll(:until_exists => element,
                :timeout => Constants::WAIT_TIMEOUT) do
                 scroll_down
        end
      end
      if !found
        if element_exists(element)
          touch(element)
        else
          screenshot_and_raise(Constants::ELEMENT_NOT_FOUND + "'#{arg1}'")
        end
      end
  else
      touch(element)
  end
end
