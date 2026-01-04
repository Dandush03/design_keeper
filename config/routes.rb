require "lookbook"

DesignKeeper::Engine.routes.draw do
  mount Lookbook::Engine, at: "/"
end
