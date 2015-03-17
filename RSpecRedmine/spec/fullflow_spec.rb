require 'spec_helper'
require_relative '../pages/home_page'
require_relative '../pages/register_page'

describe "Full redmine site test flow" do
    context "When registering new user" do
    before :all do
      visit(RegisterPage)
      end
    it "new user should be successfully registered" do
    on(RegisterPage).login = 'Testuser'
    on(RegisterPage).password = 'qwerty'
    on(RegisterPage).password_confirm = 'qwerty'
    on(RegisterPage).first_name = 'lol'
    on(RegisterPage).last_name = 'lolita'
    on(RegisterPage).email = 'Testuser@gmail.com'
    on(RegisterPage).commit
  end
    end
end