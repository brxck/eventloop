# [eventloop](https://hidden-retreat-34011.herokuapp.com/)

This is a project for [The Odin Project: Associations.](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)

Check it out [here!](https://hidden-retreat-34011.herokuapp.com/)

In addition to working with associations, I used this project to experiment with Haml views, which I found much easier to work with than the default erb. It seems that Slim faster and better maintained than Haml, and I plan on trying that in my next project. 

## Features

- Associations
  - The user which creates an event becomes its host
  - Many users can attend an event
  - Users can view their upcoming and past events
- Authentication & authorization
  - Sign up and log in
  - Event actions are only available to logged in users
  - Only the host of an event can delete it
- Scopes
  - Differentiate between upcoming and past events
  - Order most recent/soonest events
- s t y l e 
  - Haml views used instead of erb
  - Page responds to whether a user is logged in or attending an event
  - No framework used!
