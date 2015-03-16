require 'selenium-webdriver'

@driver = Selenium::WebDriver.for :firefox
@driver.get 'http://demo.redmine.org'

#logging is implemented with help of "puts" method after each logical step.
# Putting this inside of methods (like in check_visibility) is not so convenient

number = rand(100..2000)
@email1 = "vlmiruby+#{number}@gmail.com"
@user_login1 = "testuser#{number}"
@email2 = "vlmiruby+#{number+1}@gmail.com"
@user_login2 = "testuser#{number+1}"
@pass1 = 'qwerty'
@pass2 = 'qwerty1'
@project = "TestProject#{number}"
@version = "Version#{number}"
@bug_name = "Bug#{number}"
@feature_name = "Feature#{number}"
@support_name = "Support#{number}"
@manager = "(//input[@name='membership[role_ids][]'])[5]"
@developer = "(//input[@name='membership[role_ids][]'])[6]"
@reporter = "(//input[@name='membership[role_ids][]'])[7]"
@bug = 'Bug'
@feature = 'Feature'
@support = 'Support'

def register_new_user(user_login, email)
  @driver.find_element(class: 'register').click
  @driver.find_element(id: 'user_login').send_keys user_login
  @driver.find_element(id: 'user_password').send_keys @pass1
  @driver.find_element(id: 'user_password_confirmation').send_keys @pass1
  @driver.find_element(id: 'user_firstname').send_keys 'Firstname'
  @driver.find_element(id: 'user_lastname').send_keys 'Lastname'
  @driver.find_element(id: 'user_mail').send_keys email
  @driver.find_element(name: 'commit').click
end

def log_out
  @driver.find_element(class: 'logout').click
end

def log_in(login, pass)
  @driver.find_element(class: 'login').click
  @driver.find_element(id: 'username').send_keys login
  @driver.find_element(id: 'password').send_keys pass
  @driver.find_element(name: 'login').click
end

def change_password(oldpass, newpass)
  @driver.find_element(class: 'my-account').click
  @driver.find_element(:css, '.icon-passwd').click
  @driver.find_element(id: 'password').send_keys oldpass
  @driver.find_element(id: 'new_password').send_keys newpass
  @driver.find_element(id: 'new_password_confirmation').send_keys newpass
  @driver.find_element(name: 'commit').click
end

def create_new_project(project)
  @driver.find_element(class: 'projects').click
  @driver.find_element(:css, '.icon-add').click
  @driver.find_element(:id, "project_name").clear
  @driver.find_element(id: 'project_name').send_keys project
  @driver.find_element(name: 'commit').click
end

def add_user(user, role)
  @driver.find_element(id: 'tab-members').click
  @driver.find_element(:xpath, "//div[@id='tab-content-members']/p/a").click
  sleep 2
  @driver.find_element(:xpath, ".//*[@id='principal_search']").send_keys user
  sleep 2
  @driver.find_element(name: 'membership[user_ids][]').click
  @driver.find_element(:xpath, "#{role}").click
  @driver.find_element(id: 'member-add-submit').click
  sleep 3
end

def change_role(role)
  @driver.find_element(:css, '.even a.icon-edit').click
  sleep 3
  @driver.find_element(:xpath, "#{role}").click
  @driver.find_element(:xpath, "(//input[@name='commit'])[4]").click
end

def add_version(version)
  @driver.find_element(id: 'tab-versions').click
  @driver.find_element(:xpath, "//*[@id='tab-content-versions']/p[2]/a").click
  @driver.find_element(id: 'version_name').send_keys version
  @driver.find_element(name: 'commit').click
end

def create_task(type, name)
  @driver.find_element(class: 'new-issue').click
  sleep 2
  drop_down_menu = @driver.find_element(id: 'issue_tracker_id')
  option = Selenium::WebDriver::Support::Select.new(drop_down_menu)
  option.select_by(:text, type)
  sleep 2
  @driver.find_element(id: 'issue_subject').send_keys name
  @driver.find_element(name: 'commit').click
end

def show_tasks
  @driver.find_element(:css, '.issues.selected').click
  sleep 2
end

def check_visibility(link_name)
  if @driver.find_element(:link, link_name).displayed?
    puts "#{link_name} present on page"
  else
    fail "#{link_name} not found"
  end
end

register_new_user(@user_login1, @email1)
log_out
#puts "First user registered: name - #{@user_login1}, email - #{@email1}"
register_new_user(@user_login2, @email2)
log_out
#puts "Second user registered: name - #{@user_login2}, email - #{@email2}"
log_in(@user_login2, @pass1)
change_password(@pass1, @pass2)
#puts "#{@user_login2} user changed password to #{@pass2}"
create_new_project(@project)
#puts "New project #{@project} created"
add_user(@user_login1, @reporter)
#puts "User #{@user_login1} added to #{@project}"
change_role(@developer)
#puts "Role for #{@user_login1} changed to another"
add_version(@version)
#puts "#{@version} added"
create_task(@bug, @bug_name)
#puts "#{@bug_name} created"
create_task(@feature, @feature_name)
#puts "#{@feature_name} created"
create_task(@support, @support_name)
#puts "#{@support_name} created"
show_tasks
check_visibility(@bug_name)
check_visibility(@support_name)
check_visibility(@feature_name)

#puts "Everything completed successfully"
