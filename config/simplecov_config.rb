require 'simplecov'

SimpleCov.start 'rails' do
  SimpleCov.command_name "RSpec"
  add_filter %w[app/channels app/jobs app/mailers bin config db lib log node_modules public storage tmp vendor]

end
