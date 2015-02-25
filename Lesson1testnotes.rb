number = 31
email1 = "vlmiruby+#{number}@gmail.com"
user_login1 = "testuser#{number}"
email2 = "vlmiruby+#{number+1}@gmail.com"
user_login2 = "testuser#{number+1}"
pass1 = 'qwerty'
pass2 = 'qwerty1'
project = "TestProject#{number}"

class LoginProcess
  attr_accessor :email1, :password1
  def initialize (email, password)
    @email1 = email
    @password1 = password
  end
  def register ()
    @email1 = email
    @password1 = password
          end
end
LoginProcess.new(3,4)
