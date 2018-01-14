# eventloop

This is a project for [The Odin Project: Associations.](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations)
Check it out [here!](https://hidden-retreat-34011.herokuapp.com/)

## Features

- Authentication & authorization
  - Sign up and log in
  - Event actions are only available to logged in users
  - Only the host of an event can delete it
- Associations
  - The user which creates an event becomes its host (`has\_many, belongs_to`)
  - Many users can attend an event (`has_many, through:`)
- Scopes
  - Differentiate between upcoming and past events
  - Order most recent/soonest events
- s t y l e
  - No framework used!
  - Minimal
  - Web fonts
