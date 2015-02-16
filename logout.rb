require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

#check if user is logged in

driver.find_element(name: 'logout').click