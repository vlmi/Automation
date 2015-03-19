require_relative 'basic_page'

class RegisterPage < BasicPage
  include PageObject
  include DataMagic

  DEFAULT_DATA = {
  'login' => 'lolka',
  'password' => 'qwerty',
  'first_name' => 'tester',
  'last_name' => 'nobody',
  'email' => 'lol@gmail.com'
  }

  page_url 'http://demo.redmine.org/account/register'
  text_field(:login, :id => 'user_login')
  text_field(:password, :id => 'user_password')
  text_field(:password_confirm, :id => 'user_password_confirmation')
  text_field(:first_name, :id => 'user_firstname')
  text_field(:last_name, :id => 'user_lastname')
  text_field(:email, :id => 'user_mail')
  button(:commit, :name => 'commit')

  def register_new_user(data = {})
    data = DEFAULT_DATA.merge(data)
    self.login = data[:login]
    self.password = data[:password]
    self.password_confirm = data[:password]
    self.first_name = data[:first_name]
    self.last_name = data[:last_name]
    self.email = data[:email]
    commit
  end
end