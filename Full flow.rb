require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

user_login1 = 'testuser31'
user_login2 = 'testuser32'
email1 = 'vlmiruby+31@gmail.com'
email2 = 'vlmiruby+32@gmail.com'
pass1 = 'qwerty'
pass2 = 'qwerty1'
project = 'TestProject31'

driver.find_element(class: 'register').click #register new user1
driver.find_element(id: 'user_login').send_keys user_login1
driver.find_element(id: 'user_password').send_keys pass1
driver.find_element(id: 'user_password_confirmation').send_keys pass1
driver.find_element(id: 'user_firstname').send_keys 'Firstname'
driver.find_element(id: 'user_lastname').send_keys 'Lastname'
driver.find_element(id: 'user_mail').send_keys email1
driver.find_element(name: 'commit').click

driver.find_element(class: 'logout').click #logout

driver.find_element(class: 'register').click #register new user2
driver.find_element(id: 'user_login').send_keys user_login2
driver.find_element(id: 'user_password').send_keys pass1
driver.find_element(id: 'user_password_confirmation').send_keys pass1
driver.find_element(id: 'user_firstname').send_keys 'Firstname'
driver.find_element(id: 'user_lastname').send_keys 'Lastname'
driver.find_element(id: 'user_mail').send_keys email2
driver.find_element(name: 'commit').click

driver.find_element(class: 'logout').click #logout

driver.find_element(class: 'login').click #login
driver.find_element(id: 'username').send_keys user_login2
driver.find_element(id: 'password').send_keys pass1
driver.find_element(name: 'login').click

driver.find_element(class: 'my-account').click #change password
driver.find_element(:css, '.icon-passwd').click
driver.find_element(id: 'password').send_keys pass1
driver.find_element(id: 'new_password').send_keys pass2
driver.find_element(id: 'new_password_confirmation').send_keys pass2
driver.find_element(name: 'commit').click

driver.find_element(class: 'projects').click #create new project
driver.find_element(:css, '.icon-add').click
driver.find_element(:id, "project_name").clear
driver.find_element(id: 'project_name').send_keys project
driver.find_element(name: 'commit').click

driver.find_element(id: 'tab-members').click #add user
driver.find_element(id: 'principal_search').send_keys user_login1
sleep 2
driver.find_element(name: 'membership[user_ids][]').click
driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[7]").click
driver.find_element(id: 'member-add-submit').click
sleep 3
driver.find_element(:css, '.even a.icon-edit').click #change users role
sleep 3
driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[6]").click
driver.find_element(:xpath, "(//input[@name='commit'])[4]").click

driver.find_element(id: 'tab-versions').click #add version
driver.find_element(:css, '.icon-add').click
driver.find_element(id: 'version_name').send_keys 'Version1'
driver.find_element(name: 'commit').click

driver.find_element(class: 'new-issue').click #create bug
driver.find_element(id: 'issue_subject').send_keys 'bug1'
driver.find_element(name: 'commit').click

driver.find_element(class: 'new-issue').click #create feature
driver.find_element(id: "issue_tracker_id").click
driver.find_element(:xpath, "//*[@id='issue_tracker_id']/option[2]").click
driver.find_element(id: 'issue_subject').send_keys 'feature1'
driver.find_element(name: 'commit').click

driver.find_element(class: 'new-issue').click #create support
driver.find_element(id: "issue_tracker_id").click
driver.find_element(:xpath, "//*[@id='issue_tracker_id']/option[3]").click
driver.find_element(id: 'issue_subject').send_keys 'support1'
driver.find_element(name: 'commit').click

driver.find_element(:css, '.issues.selected').click #check visibility
sleep 2

def check_visibility(driver, link_name)
  if driver.find_element(:link, link_name).displayed?
    puts "#{link_name} present on page"
  else
    fail "#{link_name} fail message"
  end
end

check_visibility(driver, 'bug1')
check_visibility(driver, 'support1')
check_visibility(driver, 'feature1')
