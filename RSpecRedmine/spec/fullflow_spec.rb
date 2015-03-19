require 'spec_helper'
require_relative '../pages/home_page'
require_relative '../pages/register_page'
require_relative '../../RSpecRedmine/pages/my_account_page'

describe "Full redmine site test flow" do
  before :all do
    number = rand(1..50000)
    @login = "TestUser+#{number}"
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
    @bug = 'Bug'
    @feature = 'Feature'
    @support = 'Support'
  end
  describe "Registration" do
    context "When registering new user" do
      before :all do
        visit(HomePage).register
      end
      it "has /account/register in url" do
        expect(on(RegisterPage).current_url).to include "/account/register"
      end
      context 'when valid registration data submitted, ' do
        before :all do
          on(RegisterPage).register_new_user
        end
        describe "browser" do
          it "has 'my/account' in url" do
            expect(on(MyAccountPage).current_url).to include "/my/account"
          end
        end
        describe "user" do
          it 'is logged in' do
            expect(on(MyAccountPage).active_user_element.text).to include @user_login1
          end
        end
      end
    end
  end

 end

