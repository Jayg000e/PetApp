require 'simplecov'
SimpleCov.start 'rails' do
  SimpleCov.command_name "Cucumber"
  add_filter %w[app/channels app/jobs app/mailers bin config db lib log node_modules public storage tmp vendor]
  #add_filter 'spec/' # Exclude test code
end
