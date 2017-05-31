def scroll_down_until_I_see(id)
  until_element_exists("* marked:'#{id}'", :action => lambda { scroll("ScrollView", :down) })   
end