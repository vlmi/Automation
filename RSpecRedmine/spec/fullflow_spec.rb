require 'spec_helper'
require_relative '../pages/home_page'
require_relative '../pages/register_page'

describe "Full redmine site test flow" do
  before :all do
  end
  context "When registering new user" do
    before do
      visit(RegisterPage).register_new_user(fggfd)
      on(HomePage).wait_until{@current_page.text.include}
    end
    it "new user should be successfully registered"

  end
  it_behaves_like
  context "When Logging in" do
    it "user should log in"

  end
  describe "Log out" do
  end
  describe "Change password" do
  end
  describe "Create new project" do
  end
  describe "Add new user to project" do
  end
end