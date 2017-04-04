source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0.rc1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

gem 'pundit', '~> 1.1'
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'graphql', '~> 1.5', '>= 1.5.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'graphiql-rails'
  gem 'faker', '~> 1.7', '>= 1.7.3'

  # For the sake of graphiql
  gem 'sass-rails'
  gem 'uglifier'
  gem 'coffee-rails'

end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'graphiql-rails', group: :development
gem 'graphql-batch'