module Api
  class Engine < Rails::Engine
    isolate_namespace Api
  end
end

require 'api/responders'
