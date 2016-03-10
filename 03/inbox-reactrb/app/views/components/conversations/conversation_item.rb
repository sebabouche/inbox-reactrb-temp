module Components
  module Conversations
    class ConversationItem < React::Component::Base

      param :conversation
      param :current_user

      def render
        div class: "conversation-link flexbox-start" do
          span class: "flex-item-shrink" do
            # TODO image_tag
            # conversation.other_user(current_user).one_avatar_url, class: "avatar-square"
            params.conversation.created_at.strftime("%b %e")
          end
          div class: "conversation-preview flexbox-columns flex-item" do
            ul class: "conversation-header list-unstyled list-inline flex-item" do
              #li { h6 { params.conversation.other_user(params.current_user).first_name } }
              #li(class: "date") { conversation.last_message.created_at.strftime("%b %e") }
              "TEST"
            end
            div class: "message-preview flex-item" do
              # span { params.conversation.last_message.content }
              "TEST"
            end
          end
        end
      end
    end
  end
end
