class HomePage
  include PageObject
  page_url 'http://demo.redmine.org'
  button(:register, :class => 'register')
  button(:login, :class => 'login')
  button(:logout, :class => 'logout')

  def go_to_log_in_page
    self.login
  end

  def log_out
    self.logout
  end
end