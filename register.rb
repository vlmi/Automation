require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

#login = testuser+(random)
#email = vlmiruby+(random)@gmail.com

driver.find_element(class: 'register').click
driver.find_element(id: 'user_login').send_keys 'testuser1'
driver.find_element(id: 'user_password').send_keys 'qwerty'
driver.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
driver.find_element(id: 'user_firstname').send_keys 'Firstname'
driver.find_element(id: 'user_lastname').send_keys 'Lastname'
driver.find_element(id: 'user_mail').send_keys 'vlmiruby+1@gmail.com'
driver.find_element(name: 'commit').click

fail 'Expected message did not meet' unless driver.find_element(id: 'flash_notice').text == 'Your account has been activated. You can now log in.asdf'

