class LoginPage
  include PageObject
  page_url 'http://demo.redmine.org/login'
  text_field(:login, :id => 'username')
  text_field(:pass, :id => 'password')
  button(:submit, :name => 'submit')

  def log_in(login, pass)
    self.login = login
    self.pass = pass
    self.submit
  end
end
