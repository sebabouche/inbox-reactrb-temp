## Inbox the ReactRb way 
# Chapter 2 - our first React component

This README.md is updated with instructions for each chapter/branch (go to the master branch for more information).

## Instructions

Now that we have all the gems and folders in place, let's start moving our UI parts to React Compononents.

### 1. Split the UI
What's great about React in comparison with other js frameworks is the fact that it's not monolithic, it's more of a library. You can start with the smaller parts of your UI and you don't have to override all your serverside-only templates if you feel like it.

To slice a UI in the React way, check this awesome [Thinking in React](http://facebook.github.io/react/docs/thinking-in-react.html) resource on Reactjs website.  

We'll have:

	+-- Inbox
		|-- ConversationList
		|	|-- ConversationItem 1
		|	|-- ConversationItem 2
		|	|-- ConversationItem 3
		|	|-- ...
		|
		|--MessageList
		|	|-- MessageItem 1
		|	|-- MessageItem 2
		|	|-- MessageItem 3
		|
		|-- MessageForm
		
### 2. Spot the html-erb code of your component
Let's spot the html-erb code representing a __ConversationItem__ in `app/views/conversations/index.html.erb`

You found it! (l. 14 to l. 25)
	
	  <div class="conversation-link flexbox-start">
	    <span class="flex-item-shrink"><%= image_tag conversation.other_user(current_user).one_avatar_url, class: "avatar-square" %></span>
	    <div class="conversation-preview flexbox-columns flex-item">
	      <ul class="conversation-header list-unstyled list-inline flex-item">
	        <li><h6><%= conversation.other_user(current_user).first_name %></h6></li>
	        <li class="date"><%= conversation.last_message.created_at.strftime("%b %e") %></li>
	      </ul>
	      <div class="message-preview flex-item">
	        <span><%= conversation.last_message.content %></span>
	      </div>
	    </div>
	  </div>

It's this block that gets iterated with the `<% @conversations.each do |conversation| %>` block.

Cut this part and replace it with the invocation fo the react component we are about to create:

	<%= react_component "ConversationItem" %>

We'll talk more about that later. You can save `index.html.erb`.

### 3. Now let's use the generator to create the component

	rails g reactrb:component Conversations::ConversationItem

This will create a file, let's open it `app/views/components/conversations/conversation_item.rb`. This file is filled with neat sample code to help us understand how they work. But for now, let's delete all comments and all methods __except the #render method__.

You can now reload the page and you will see that each conversation on the left has been replaced with a `Conversations::ConversationItem` string. This means React is correctly set!

### 4. Translate the html.erb to Ruby
You can now check the `#render` method in `conversation_item`. This is the code that makes the component render `Conversations::ConversationItem` in the view. 

Now we are going to replace this code with our sliced html from above. Your file should look like:

	module Components
	  module Conversations
	    class ConversationItem < React::Component::Base
	      def render
	        <div class="conversation-link flexbox-start">
	          <span class="flex-item-shrink"><%= image_tag conversation.other_user(current_user).one_avatar_url, class: "avatar-square" %></span>
	          <div class="conversation-preview flexbox-columns flex-item">
	            <ul class="conversation-header list-unstyled list-inline flex-item">
	              <li><h6><%= conversation.other_user(current_user).first_name %></h6></li>
	              <li class="date"><%= conversation.last_message.created_at.strftime("%b %e") %></li>
	            </ul>
	            <div class="message-preview flex-item">
	              <span><%= conversation.last_message.content %></span>
	            </div>
	          </div>
	        </div>
	      end
	    end
	  end
	end

As a good rubyist, you know that this won't work, a weird mix of ruby and html code. Let's translate the html using the awesome ruby DSL ReactRb provides:

    def render
      div(class: "conversation-link flexbox-start") do
        span(class: "flex-item-shrink") do
          # TODO image_tag
          # conversation.other_user(current_user).one_avatar_url, class: "avatar-square"
        end
        div(class: "conversation-preview flexbox-columns flex-item") do
          ul(class: "conversation-header list-unstyled list-inline flex-item") do
            li { h6 { conversation.other_user(current_user).first_name } }
            li(class: "date") { conversation.last_message.created_at.strftime("%b %e") }
          end
          div class: "message-preview flex-item" do
            span { conversation.last_message.content }
          end
        end
      end
    end

### 4. Passing instance variables to React Components
Now if you save and reload the page… Nothing! Open the console in your browser and you'll see that `NoMethodError: undefined method `conversation' for #<ConversationItem:0x29a>`.

That's right, we are calling `conversation` and `current_user` variables inside the `#render` method but we didn't passed these variables. React Components are very encapsulated, they don't guess variables (like in helpers), you need to pass them what they need to render.

In `index.html.erb` let's modify our invocation of the component and pass it the `conversation` resulting from the loop on `@conversations` plus the `current_user` from Devise.

    <% @conversations.each do |conversation| %>
      <%= react_component "ConversationItem", conversation: conversation, current_user: current_user %>
    <% end %>

Still no luck. Same error… Oh, we need to catch that conversation on the other side, inside our React Component. To do so:

+ add `param :conversation` at the top of the class.
+ and prefix all the `conversation` calls inside the render method with `params.`
	+ `params.conversation.other_us…`
	+ `params.conversation.last_mess…`

### 5. A shared model between server and client
Ok now it should work, no ? We nee the client to be able to access our model too!


___
> See? I told you. It's easy.

In a prefect workd, everything worked like a charm.  
Don't hesitate to contact me [@seb_nicolaidis](http://twitter.com/seb_nicolaidis) or [Sébabouche](https://github.com/sebabouche) if in trouble.