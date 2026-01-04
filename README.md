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

Add following to your `app/javascript/controllers/index.js` after `eagerLoadControllersFrom("controllers", application)` line:

```javascript
eagerLoadControllersFrom("design_keeper", application)
```
