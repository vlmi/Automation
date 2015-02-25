require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

number = 31
@email1 = "vlmiruby+#{number}@gmail.com"
@user_login1 = "testuser#{number}"
@email2 = "vlmiruby+#{number+1}@gmail.com"
@user_login2 = "testuser#{number+1}"
@pass1 = 'qwerty'
@pass2 = 'qwerty1'
@project = "TestProject#{number}"


def fill_text(textfield, text)
  @driver.find_element(:id, textfield).send_keys text
end
@driver.find_element(class: 'register').click
fill_text('user_login', @user_login1)
fill_text('user_password', @pass1)
fill_text('user_password_confirmation', @pass1)
fill_text('user_firstname', 'Firstname')
fill_text('user_lastname', 'Lastname')
fill_text('user_mail', @email1)
@driver.find_element(name: 'commit').click


#register new user1

  def register_new_user(@user_login, @email)
    driver.find_element(class: 'register').click
    driver.find_element(id: 'user_login').send_keys @user_login1
    driver.find_element(id: 'user_password').send_keys @pass1
    driver.find_element(id: 'user_password_confirmation').send_keys @pass1
    driver.find_element(id: 'user_firstname').send_keys 'Firstname'
    driver.find_element(id: 'user_lastname').send_keys 'Lastname'
    driver.find_element(id: 'user_mail').send_keys @email1
    driver.find_element(name: 'commit').click
  end

