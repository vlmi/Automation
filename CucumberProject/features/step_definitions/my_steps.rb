Before do
  require 'selenium-webdriver'
@driver = Selenium::WebDriver.for :firefox
@driver.get 'http://demo.redmine.org'

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
@bug = "//*[@id='issue_tracker_id']/option[1]"
@feature = "//*[@id='issue_tracker_id']/option[2]"
@support = "//*[@id='issue_tracker_id']/option[3]"

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
    @driver.find_element(id: "issue_tracker_id").click
    @driver.find_element(:xpath, type).click
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
end
Given(/^Register new user$/) do
register_new_user(@user_login1, @email1)
end

Then(/^Registered user logs out$/) do
  log_out
end

Then(/^Register another user$/) do
  register_new_user(@user_login2, @email2)
end

Then(/^Registered user logs in$/) do
  log_in(@user_login2, @pass1)
end

Then(/^User changes password to new$/) do
  change_password(@pass1, @pass2)
end

Then(/^Create new project$/) do
  create_new_project(@project)
end

Then(/^User added to project$/) do
  add_user(@user_login1, @reporter)
end

Then(/^Role for user changed to another$/) do
  change_role(@developer)
end

Then(/^Version added$/) do
  add_version(@version)
end

Then(/^New bug created$/) do
  create_task(@bug, @bug_name)
end

Then(/^New feature created$/) do
  create_task(@feature, @feature_name)
end

Then(/^New support created$/) do
  create_task(@support, @support_name)
end

Then(/^Show 'tasks' tab$/) do
  show_tasks
end

Then(/^Check that created bug present on page$/) do
  check_visibility(@bug_name)
end

Then(/^Check that created feature present on page$/) do
  check_visibility(@support_name)
end

Then(/^Check that created support present on page$/) do
  check_visibility(@feature_name)
end