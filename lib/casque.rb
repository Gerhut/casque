require "casque/version"
require "casque/constants"
require "casque/parse"
require "casque/list"
require "casque/install"

stack = Faraday::RackBuilder.new do |builder|
  builder.response :logger
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end
Octokit.middleware = stack
