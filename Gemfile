source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'remotipart', github:"urielhdz/remotipart"    #Upload files via AJAX
gem 'aasm'    #Maquina de estados
gem 'activemodel-serializers-xml',github:"rails/activemodel-serializers-xml" #Necesario para draper
gem 'draper', github:"audionerd/draper",branch:"rails5"


gem 'haml-rails'						
gem 'devise', '~> 4.2'
gem 'omniauth-facebook', '~> 4.0'		#Autenticación facebook
gem 'annotate'
gem 'best_in_place', '~> 3.0.1'     #editar formularios
gem "paperclip", "~> 5.0.0"
gem "mini_magick"

gem "will_paginate"

gem "sidekiq"                       #Para trabajos en el background
gem 'sinatra',github:"sinatra/sinatra" ,require: nil


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'shoulda-matchers'						#Metodos de ayuda validaciones rails
  gem 'rspec-rails', '~> 3.5.0.beta1'	#Framework pruebas
  gem 'factory_girl', '~> 4.0'					#Permite crear objetos a base de datos para pruebas
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
