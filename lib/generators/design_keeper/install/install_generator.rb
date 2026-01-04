
require "rails/generators"

module DesignKeeper
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def logo
        green = "\e[38;5;54m"
        cyan  = "\e[36m"
        reset = "\e[0m"

        say <<~ART
#{green}██████╗ ███████╗███████╗██╗ ██████╗ ███╗   ██╗#{reset}
#{green}██╔══██╗██╔════╝██╔════╝██║██╔════╝ ████╗  ██║#{reset}
#{green}██║  ██║█████╗  ███████╗██║██║  ███╗██╔██╗ ██║#{reset}
#{green}██║  ██║██╔══╝  ╚════██║██║██║   ██║██║╚██╗██║#{reset}
#{green}██████╔╝███████╗███████║██║╚██████╔╝██║ ╚████║#{reset}
#{green}╚═════╝ ╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝#{reset}
        #{cyan}██╗  ██╗███████╗███████╗██████╗ ███████╗██████╗#{reset}
        #{cyan}██║ ██╔╝██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗#{reset}
        #{cyan}█████╔╝ █████╗  █████╗  ██████╔╝█████╗  ██████╔╝#{reset}
        #{cyan}██╔═██╗ ██╔══╝  ██╔══╝  ██╔═══╝ ██╔══╝  ██╔══██╗#{reset}
        #{cyan}██║  ██╗███████╗███████╗██║     ███████╗██║  ██║#{reset}
        #{cyan}╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝#{reset}
        ART
      end

      def copy_initializer
        template "design_keeper.rb", "config/initializers/design_keeper.rb"
      end

      def mount_engine
        route %(mount DesignKeeper::Engine => "/design_keeper"\n)
      end

      def add_lookbook_config
        application <<~RUBY, env: "development"
          config.lookbook.preview_paths << DesignKeeper::Engine.root.join("test/components/previews")
        RUBY
      end

      def add_js_import
        append_to_file "app/javascript/application.js", <<~JS
          import "design_keeper"
        JS
      end

      def add_css_import_to_tailwind_file
        file = File.exist?("app/assets/tailwind/application.tailwind.css") ? "app/assets/tailwind/application.tailwind.css" : "app/assets/tailwind/application.css"
        append_to_file file, <<~CSS
          @import "../builds/tailwind/design_keeper.css";
        CSS
      end

      def notice
        say "\nDesignKeeper installed.", :green
        say "\nEnsure javascript_importmap_tags are included in your layout", :yellow
        say "for DesignKeeper to function properly.\n", :yellow
      end
    end
  end
end
