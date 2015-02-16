require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
driver.get 'http://demo.redmine.org'

#login variable = testuser+(random)
#email variable = vlmiruby+(random)@gmail.com
#pass variable = qwerty+(random)
#new pass variable = pass+1
#project_name variable = ProjectName+(random)



driver.find_element(class: 'register').click #register new user
driver.find_element(id: 'user_login').send_keys 'testuser8'
driver.find_element(id: 'user_password').send_keys 'qwerty'
driver.find_element(id: 'user_password_confirmation').send_keys 'qwerty'
driver.find_element(id: 'user_firstname').send_keys 'Firstname'
driver.find_element(id: 'user_lastname').send_keys 'Lastname'
driver.find_element(id: 'user_mail').send_keys 'vlmiruby+8@gmail.com'
driver.find_element(name: 'commit').click

driver.find_element(class: 'logout').click #logout

driver.find_element(class: 'login').click #login
driver.find_element(id: 'username').send_keys 'testuser8'
driver.find_element(id: 'password').send_keys 'qwerty'
driver.find_element(name: 'login').click

driver.find_element(class: 'my-account').click #change password
driver.find_element(link: 'Изменить пароль').click
driver.find_element(id: 'password').send_keys 'qwerty'
driver.find_element(id: 'new_password').send_keys 'qwerty1'
driver.find_element(id: 'new_password_confirmation').send_keys 'qwerty1'
driver.find_element(name: 'commit').click

driver.find_element(class: 'projects').click #create new project
driver.find_element(link: 'Новый проект').click
driver.find_element(id: 'project_name').send_keys 'TestProject2'
driver.find_element(name: 'commit').click

driver.find_element(class: 'projects').click #add user
driver.find_element(id: 'tab-members').click
driver.find_element(id: 'principal_search').send_keys 'testuser8'
driver.find_element(name: 'membership[user_ids][]').click
driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[7]").click
driver.find_element(id: 'member-add-submit').click

driver.find_element(:css, "#member-90327 > td.buttons > a.icon.icon-edit").click #change users role
driver.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[6]").click
driver.find_element(:xpath, "(//input[@name='commit'])[4]").click

driver.find_element(id: 'tab-versions').click #add version
driver.find_element(link: 'Новая версия').click
driver.find_element(id: 'version_name').send_keys 'Version1'
driver.find_element(name: 'commit').click

driver.find_element(link: 'Новая задача').click #create bug
driver.find_element(id: 'issue_subject').send_keys 'bug1'
driver.find_element(name: 'commit').click

driver.find_element(link: 'Новая задача').click #create feature
driver.find_element(:id, "issue_tracker_id").select_by(:text, "Feature")
driver.find_element(id: 'issue_subject').send_keys 'feature1'
driver.find_element(name: 'commit').click

driver.find_element(link: 'Новая задача').click #create support
driver.find_element(:id, "issue_tracker_id").select_by(:text, "Support")
driver.find_element(id: 'issue_subject').send_keys 'support1'
driver.find_element(name: 'commit').click

driver.find_element(link: 'Задачи').click #check visibility (doesnt work)
driver.find_element(name: 'commit').checkifpresent
driver.find_element(name: 'commit').click
driver.find_element(name: 'commit').click