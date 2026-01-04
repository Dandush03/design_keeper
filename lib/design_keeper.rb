require "design_keeper/version"
require "design_keeper/configuration"
require "design_keeper/engine"
require "view_component"
require "lookbook"

module DesignKeeper
  class << self
    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end

    # Optional: reset config in tests
    def reset!
      @config = Configuration.new
    end
  end
end
