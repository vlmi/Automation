class HomePage
  include PageObject
  page_url 'http://demo.redmine.org'
  link(:register, :class => 'register')
  link(:login, :class => 'login')
  link(:logout, :class => 'logout')
  link(:home, :class => 'home')

  def log_out
    self.logout
  end
end