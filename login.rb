require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

driver.find_element(class: 'login').click
driver.find_element(id: 'username').send_keys 'testuser1'
driver.find_element(id: 'password').send_keys 'qwerty'
driver.find_element(name: 'login').click