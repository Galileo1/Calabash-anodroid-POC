require_relative  '../HomeScreen/MainLandingPage'
require_relative  '../MyTradeMeScreen/MTMFrame'
require_relative  '../LogInScreen/LoginPage'
require_relative  '../Helpers&Others/Constants'

When(/^I login to trademe as user '(\d+)'$/) do |arg1|
   hamBurgerMenu = query(MainLandingPage::HAMBURGER_MENU)

   if hamBurgerMenu.nil?
      tap_when_element_exists(MainLandingPage::HAMBURGER_MENU)
   else
      touch(MainLandingPage::HAMBURGER_MENU)
   end
   wait_for_element_exists(MTMFrame::LOGIN_HEADER, timeout:Constants::WAIT_TIMEOUT)
   loginHeader = query(MTMFrame::LOGIN_HEADER)
   if loginHeader.nil?
     tap_when_element_exists(MTMFrame::LOGIN_HEADER)
   else
     touch(MTMFrame::LOGIN_HEADER)
   end
   emailText = query(LoginPage::EMAIL_TEXT)
   wait_for_element_exists(LoginPage::EMAIL_TEXT, timeout:Constants::WAIT_TIMEOUT)
   if !emailText.nil?
     enter_text(LoginPage::EMAIL_TEXT, arg1)
     touch(LoginPage::LOGIN_BUTTON)
   else
     screenshot_and_raise(Constants::LOGIN_FAILED)
   end
end


Then(/^I should be logged in$/) do
    wait_for_element_exists(MainLandingPage::HAMBURGER_MENU, timeout:Constants::WAIT_TIMEOUT)
    hamBurgerMenu = query(MainLandingPage::HAMBURGER_MENU)
    if hamBurgerMenu.nil?
      tap_when_element_exists(MainLandingPage::HAMBURGER_MENU)
    else
      touch(hamBurgerMenu)
    end
    wait_for_element_exists(MTMFrame::MY_ACCOUNT, timeout:Constants::WAIT_TIMEOUT)
    actual_text = query(MTMFrame::MY_ACCOUNT, :text).first
    unless actual_text == "My account"
      screenshot_and_raise(Constants::LOGIN_FAILED + "'#{actual_text}'.")
    end

    tap_when_element_exists(MTMFrame::MY_ACCOUNT)
end

Then(/^I should be logged out$/) do
    element = UserAccountPage::LOG_OUT
    if !element_exists(element)
        wait_poll(:until_exists => element,
                :timeout => Constants::WAIT_TIMEOUT) do
                 scroll_down
        end
        touch(element)
   else
        touch(element)
   end
   wait_for_element_exists(UserAccountPage::POPUP)
   touch(UserAccountPage::LOGOUT_POPUP_CONFIRM)
end

When(/^I open hamburger menu$/) do
  hamBurgerMenu = query(MainLandingPage::HAMBURGER_MENU)
  if hamBurgerMenu.nil?
     tap_when_element_exists(MainLandingPage::HAMBURGER_MENU)
  else
     touch(hamBurgerMenu)
  end
end


When(/^I am navigated to '([^"]*)' screen$/) do |arg1|
  element = query(Shared::TOOLBAR)
  screen_name = query(Shared::TOOLBAR, :text).first
  # puts element
  # puts screen_name
end
