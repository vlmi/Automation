require_relative 'basic_page'

class MyAccountPage < BasicPage
  include PageObject
    link(:active_user, css: '#sidebar .user')
  end