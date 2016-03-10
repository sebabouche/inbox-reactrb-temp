## Inbox the ReactRb way 
# Chapter 1 - gems and folders

This README.md is updated with instructions for each chapter/branch (go to the master branch for more information).

## Instructions

### 1. Reactive Rails Generator

Loic Boutet created this handy reactrb generator we will use throughout the tutorial.  
Starting now!  
Add to your `Gemfile`:

    gem 'reactive_rails_generator'

Then run on the console:

    bundle install

### 2. Install the remaining gems

Back to your console, run the two following commands:

    rails g reactrb:install --all
    bundle update

### 3. Fix a small glitch with the generator
It might be fixed when you read these lines but the generator might mess up things in the `application.js` manifest file. Just double-check that your `app/assets/javascripts/application.js` looks like so:

	//= require 'components'
	//= require 'react_ujs'
	//
	//= require jquery
	//= require jquery_ujs
	Opal.load('components');
	//= require turbolinks
	//= require_tree .

### 6. Go to chapter 2
Here is a link to the next readme
TODO Add link

    git checkout chapter-2

___
> See? I told you. It's easy.

In a prefect workd, everything worked like a charm.  
Don't hesitate to contact me [@seb_nicolaidis](http://twitter.com/seb_nicolaidis) or [Sébabouche](https://github.com/sebabouche) if in trouble.