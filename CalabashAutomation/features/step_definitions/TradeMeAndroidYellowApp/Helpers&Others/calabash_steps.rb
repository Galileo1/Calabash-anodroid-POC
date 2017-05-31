require 'calabash-android/calabash_steps'
# require_relative  'MainLandingPage'
# require_relative  'MTMFrame'
# require_relative  'LoginPage'


When(/^I print things$/) do
  # check_element_exists(MainLandingPage::BROWSE_CATEGORY_BUTTON)
  # check_element_exists(MainLandingPage::SEARCH_BAR)
  # check_element_exists(MainLandingPage::HAMBURGER_MENU)
  # check_element_exists(MainLandingPage::LEARN_MORE)
  # check_element_exists(MainLandingPage::AD_OPTIONS_YOUR_INFO)
  #perform_action('drag_coordinates', 0,1080, 1515,888)
  perform_action('drag',95,10,50,50,1)
  #scroll("android.widget.ScrollView id:debug_drawer", :left)
  # numberOfItems = query(MTMFrame::MTM_LIST, :count)
  # puts numberOfItems
  # for elementIndex in 0..11
  #   item =  execute_uiquery("android.support.v7.widget.AppCompatTextView id:'textViewNavItemLink' index:#{elementIndex}")
  #   puts item["text"]
  # end
  # scroll_down
  # items =  query("android.support.v7.widget.AppCompatTextView index:13")
  # puts items
  # item =  query("android.support.v7.widget.AppCompatTextView id:'textViewNavItemLink'", :text)
  # puts item
  # items1 =  query("android.support.v7.widget.AppCompatTextView {text CONTAINS 'Items I\\'m selling'}")
  # puts items1
  # # itemIndex =  query("android.support.v7.widget.AppCompatTextView id:'textViewNavItemLink'", :index)
  # # puts itemIndex
  #touch(items)
end


When(/^I select environment "([^"]*)" from "([^"]*)"$/) do |arg1, arg2|
   spinner = query("android.widget.Spinner marked:'#{arg2}'")
   if spinner.empty?
    tap_when_element_exists("android.widget.Spinner * marked:'#{arg2}'")
  else
    touch(spinner)
  end

  touch("* {text CONTAINS '#{arg1}'}")
end

# When(/^I login to trademe as '(\d+)'$/) do |arg1|
#    hamBurgerMenu = query(MainLandingPage::HAMBURGER_MENU)
#    if hamBurgerMenu.nil?
#       tap_when_element_exists(MainLandingPage::HAMBURGER_MENU)
#    else
#       touch(hamBurgerMenu)
#    end
#    wait_for_element_exists(MTMFrame::MTM_FRAME_LAYOUT, timeout: 20)
#    touch(MTMFrame::LOGIN_HEADER)
#    wait_for_element_exists(LoginPage::EMAIL_TEXT, timeout: 20)
#    enter_text(LoginPage::EMAIL_TEXT, arg1)
#    touch(LoginPage::LOGIN_BUTTON)
# end


When(/^I swipe the drawer "([^"]*)" left$/) do |arg1|
    # envDrawer = execute_uiquery("all android.widget.FrameLayout marked:'#{arg1}'")
    # puts envDrawer
    # # # toX = envDrawer["rect"]["x"]
    # # # toY = envDrawer["rect"]["y"]
    # toX = envDrawer["rect"]["center_x"]
    # toY = envDrawer["rect"]["center_y"]
    # perform_action('drag_coordinates', 0, 0, toX, toY)
    #puts pan("all android.widget.FrameLayout marked:'#{arg1}'", :left, from: {x: 0, y: 50}, to: {x: -100, y:50})
    #pan("button", :left, from: {x: 0, y: 50}, to: {x: 100, y:50})

    ########### for login drawer perform_action('drag_coordinates', 0,1080, 1515,888)
    execute_uiquery("all android.widget.FrameLayout marked:'debug_view'")
    perform_action('drag_coordinates', 1080,1920,555,1920)

end

# Then(/^I should be logged in$/) do
#     wait_for_element_exists(MainLandingPage::HAMBURGER_MENU, timeout: 20)
#     hamBurgerMenu = query("ImageButton marked:'Navigate up'")
#     # puts hamBurgerMenu
#     if hamBurgerMenu.nil?
#       tap_when_element_exists("ImageButton marked:'Navigate up'")
#     else
#       touch(hamBurgerMenu)
#       #execute_uiquery("* id marked:'Log in'")
#     end
#     wait_for_element_exists("android.widget.TextView marked:'textViewMyAccount'",timeout: 20)
#     actual_text = query("android.widget.TextView marked:'textViewMyAccount'", :text).first
#     unless actual_text == "My account"
#       fail "Login Failed. Expected '#{actual_text}'."
#     end
#
# end
