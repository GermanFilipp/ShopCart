$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shop_cart/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shop_cart"
  s.version     = ShopCart::VERSION
  s.authors     = ["GermanFilipp"]
  s.email       = ["ger772@yandex.ru"]
  s.homepage    = "https://github.com/GermanFilipp/ShopCart"
  s.summary     = "Summary of ShopCart."
  s.description = "Description of ShopCart."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "aasm",  '~> 4.2.0'
  s.add_dependency 'bootstrap-sass', '~> 3.0'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'shoulda-matchers'
end
