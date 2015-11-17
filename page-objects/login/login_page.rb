class LoginPage
  #include PageObject
  #require 'page-object'

  text_field :username, id: "user_email"
  text_field :password, id: "user_password"
  # checkbox :remember_me, css: '[type="checkbox"]'
  # button :login, css: '[locator="loginButton"]'

  # def login_with(user, pass)
  #   try_login(user, pass)
  #   HomePage.new(browser)
  # end
  #
  # def try_login(user, pass)
  #   return HomePage.new(browser) if body?
  #   self.username = user
  #   self.password = pass
  #   check_remember_me
  #   login
  # end
end