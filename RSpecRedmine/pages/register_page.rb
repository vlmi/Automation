class RegisterPage
  include PageObject
  page_url 'http://demo.redmine.org/account/register'
  text_field(:login, :id => 'user_login')
  text_field(:password, :id => 'user_password')
  text_field(:password_confirm, :id => 'user_password_confirmation')
  text_field(:first_name, :id => 'user_firstname')
  text_field(:last_name, :id => 'user_lastname')
  text_field(:email, :id => 'user_mail')
  button(:commit, :name => 'commit')

  def register_new_user(data)
    self.login = data[@user_login1]
    self.password = data[@password]
    self.password_confirm  = data[@password]
    self.first_name = data['firstname']
    self.last_name = data['lastname']
    self.email = data[@email1]
    commit
  end
end