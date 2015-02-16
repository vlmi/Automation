require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

#check if user is logged in

driver.find_element(class: 'login').click
driver.find_element(id: 'username').send_keys 'testuser1'
driver.find_element(id: 'password').send_keys 'qwerty'
driver.find_element(name: 'login').click

driver.find_element(class: 'my-account').click
driver.find_element(link: 'Изменить пароль').click
driver.find_element(id: 'password').send_keys 'qwerty'
driver.find_element(id: 'new_password').send_keys 'qwerty1'
driver.find_element(id: 'new_password_confirmation').send_keys 'qwerty1'
driver.find_element(name: 'commit').click
