source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.6'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'devise', '~> 4.5'
gem 'bootstrap', '~> 4.1', '>= 4.1.3'
gem 'mini_racer', '~> 0.2.0'
gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.4'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'gritter', '~> 1.2'
gem 'redcarpet', '~> 3.4'
gem 'pygments.rb', '~> 1.2', '>= 1.2.1'
gem 'acts_as_paranoid', '~> 0.6.0'
gem 'impressionist', '~> 1.6', '>= 1.6.1'
gem 'rails_admin', '~> 1.3'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'paper_trail', '~> 10.0', '>= 10.0.1'
gem 'diffy', '~> 3.2', '>= 3.2.1'
gem 'redis', '~> 4.0', '>= 4.0.2'
gem 'carrierwave', '~> 1.2', '>= 1.2.3'
gem 'mini_magick', '~> 4.9', '>= 4.9.2'
gem 'carrierwave-aws', '~> 1.3'
gem 'cocoon', '~> 1.2', '>= 1.2.12'
gem 'dotenv-rails', '~> 2.5'
gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'
gem 'slack-notifier', '~> 2.3', '>= 2.3.2'
gem 'acts_as_votable', '~> 0.11.1'
gem 'rails_admin_simplemde', '~> 0.1.0.1'
gem 'petergate', '~> 2.0', '>= 2.0.1'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry', '~> 0.11.3'
  gem 'pry-byebug', '~> 3.6'
  gem "awesome_print", require:"ap"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "awesome_print", require:"ap"
  gem "better_errors"
  gem "binding_of_caller"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
