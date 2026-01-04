module DesignKeeper
  module V1
    class CardComponentPreview < ViewComponent::Preview
      def default
        render(V1::CardComponent.new)
      end
    end
  end
end
