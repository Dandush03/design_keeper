## Requirements

* Ruby 3.3+ (might work with older versions, but not tested)
* Rails 7.1+ (Turbo is hard requirement for complex components like server based Chips)
* Turbo
* Stimulus
* Importmaps
* Tailwind

That list is based on the project from which this library is being extracted. If you like to make it less demanding, feel free to submit PRs. Only strict requirements are Turbo and Stimulus.

## Usage

Run `rails design_keeper:install` to install the gem and add necessary files to your project. Alternatively, you can follow the steps below.

Run `rails tailwindcss:engines` to setup Tailwind Engines support.

Add following to your `app/assets/tailwind/application.css` after `@import "tailwindcss";`:
```css
@import "../builds/tailwind/design_keeper.css";
```

Add following to your `app/javascript/application.js` at the top of the file:
```javascript
  import "design_keeper/application"
```

If you want to be able to preview components in isolation, mount the DesignKeeper engine in your `config/routes.rb`:
```ruby
  mount DesignKeeper::Engine, at: "/design_keeper"
```

and include to your application configuration in `config/application.rb` or in an environment specific file like `config/environments/development.rb`:
```ruby
  config.lookbook.preview_paths << DesignKeeper::Engine.root.join("test/components/previews")
```

Don't forget that this library requires importmaps, Turbo, Stimulus, and Tailwind to be setup in your project. Including and not less important the Tailwind Engines support and the `javascript_importmap_tags` in your layout.
