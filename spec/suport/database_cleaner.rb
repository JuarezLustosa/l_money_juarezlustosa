RSpec.configure do |config|
  config.before :suite do
    DatabaseRewinder.clean_all multiple: false
  end

  config.after :each do
    DatabaseRewinder.clean multiple: false
  end
end
