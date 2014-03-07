if Rails.env.production? || Rails.env.staging?
  # for Pdp pokes and campaigns sync
  raise "PDP_HOST is missing"      if ENV['PDP_HOST'].nil?
  raise "PDP_API_TOKEN is missing" if ENV['PDP_API_TOKEN'].nil?
end