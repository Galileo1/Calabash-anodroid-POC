require_relative('./CreditMyAccount')

And(/^user selects to enter card details$/) do
  tap_when_element_exists(CreditMyAccount::DONOT_USE_SAVED_CC)
end

Then(/^user enters the cc number$/) do
  cardNumber = query(CreditMyAccount::CARD_NUMBER)
  if cardNumber.nil?
    wait_for_element_exists(CreditMyAccount::CARD_NUMBER)
    enter_text(CreditMyAccount::CARD_NUMBER, '4111111111111111')
  else
    enter_text(CreditMyAccount::CARD_NUMBER, '4111111111111111')
  end
end

Then(/^user enters the cc name$/) do
  cardNumber = query(CreditMyAccount::CARDHOLDER_NAME)
  if cardNumber.nil?
    wait_for_element_exists(CreditMyAccount::CARDHOLDER_NAME)
    enter_text(CreditMyAccount::CARDHOLDER_NAME, 'test user')
  else
    enter_text(CreditMyAccount::CARDHOLDER_NAME, 'test user')
  end
end

Then(/^user enters the cc expiry date$/) do
  element = CreditMyAccount::CC_MONTH
  wait_poll(:until_exists => element,
          :timeout => Constants::WAIT_TIMEOUT) do
           scroll_down
  end
  enter_text(CreditMyAccount::CC_MONTH, '01')
  enter_text(CreditMyAccount::CC_YEAR, '19')
end

Then(/^user enters the cc CVV number$/) do
  enter_text(CreditMyAccount::CVV_NUMBER, '999')
end

Then(/^user select to save this card$/) do
  element = CreditMyAccount::SAVE_THIS_CARD
  wait_poll(:until_exists => element,
          :timeout => Constants::WAIT_TIMEOUT) do
           scroll_down
  end
  touch(element)
end

Then(/^user makes the payment$/) do
  touch(CreditMyAccount::MAKE_PAYMENT)
  tap_when_element_exists(CreditMyAccount::PAYMENT_CONFIRMATION_OK)

end
