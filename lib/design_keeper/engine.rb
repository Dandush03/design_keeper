
module DesignKeeper
  class Engine < ::Rails::Engine
    isolate_namespace DesignKeeper

    initializer "design_keeper.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
    end

    initializer "design_keeper.importmap_draw", after: "importmap" do |app|
      app.importmap.draw do
        pin "design_keeper/application", to: "design_keeper/application.js"

        pin_all_from DesignKeeper::Engine.root.join("app/javascript/design_keeper/controllers"),
          under: "design_keeper/controllers",
          integrity: true

        pin_all_from DesignKeeper::Engine.root.join("app/javascript/design_keeper/utils"),
          under: "design_keeper/utils",
          integrity: true
      end


      app.config.importmap.cache_sweepers << root.join("app/javascript")
    end
  end
end
