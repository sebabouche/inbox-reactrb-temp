## Inbox the ReactRb way 
# Chapter 0 - a vanilla rails app

This README.md is updated with instructions for each chapter.

This is a fork of __inbox__, a simple yet powerful one3one chat module for a Rails app taking advantage of React server/client rendering.
In this version, we will make it event simpler using __ReactRb__  and __react components__. Yay!

Credits and links:

+ [Inbox](https://github.com/Eschults/inbox) by [Eschults](https://github.com/Eschults)
+ [ReactRb Tutorial](https://github.com/loicboutet/reactrb_tutorial/) by [Loïc Boutet](https://github.com/loicboutet/reactrb_tutorial/)
+ [ReactRb](http://reactrb.org) website
+ Ask questions about ReactRb to the creators [![Gitter](https://badges.gitter.im/zetachang/react.rb.svg)](https://gitter.im/zetachang/react.rb?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Instructions
### 1. Download this repo
### 2. Update it
	bundle update
### 3. Create and seed the DB
	rake db:create
	rake db:seed
### 4. Run the server
	rails s
### 5. Check the UI
If you checked the `db/seed.rb`, you'll see that 4 users were created.  
You can log in with any of those to check the UI. For example:

+ login: __edward@lewagon.com__
+ password: __azertyuiop__ (excuse my French keyboard layout ^^)

### 6. Go to chapter 1
Here is a link to the next readme
TODO Add link

    git checkout chapter-1


___
> See? I told you. It's easy.

In a prefect workd, everything worked like a charm.  
Don't hesitate to contact me [@seb_nicolaidis](http://twitter.com/seb_nicolaidis) or [Sébabouche](https://github.com/sebabouche) if in trouble.