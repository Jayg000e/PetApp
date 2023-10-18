require 'simplecov'

SimpleCov.start 'rails' do
  add_filter %w[app/channels app/jobs app/mailers bin config db lib log node_modules public storage tmp vendor]
end
