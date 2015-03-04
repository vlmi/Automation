Feature: Testing redmine.org portal
  In order to prepare my homework
  As a student
  I want to learn cucumber

Scenario: Testing main features of Redmine portal in a one big "from_start_to_end" flow
  Given Register new user
  Then Registered user logs out
  Then Register another user
  Then Registered user logs out
  Then Registered user logs in
  Then User changes password to new
  Then Create new project
  Then User added to project
  Then Role for user changed to another
  Then Version added
  Then New bug created
  Then New feature created
  Then New support created
  Then Show 'tasks' tab
  Then Check that created bug present on page
  Then Check that created feature present on page
  Then Check that created support present on page