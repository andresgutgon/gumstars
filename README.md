# README
This is a job challenge code for Gumroad. You can read [about it here](https://gumroad.notion.site/Coding-challenge-f7aa85150edd41eeb3537aae4632619f)

### The stack
Rails + React

### TODO data modeling
- [x] Setup a new Rails 7 project with Heroku deploy
- [x] Add [aministrative](https://github.com/thoughtbot/administrate) for adding products and review seed data. Not necessary but wanted to try this.
- [x] Abstract ActiveRecord in controller `Product.all`
- [x] Add Rspec to the project and test review has rating validation
- [x] Setup GitHub action to run specs on Pull requests
- [x] Dummy List of products
- [x] Dummy Product detail route

## TODO Styles
- [ ] Add Tailwind to style the pages
- [ ] Show product reviews (No auth required for the challenge)
- [ ] Stars overall rating with all reviews

## TODO Vanilla JS interactivity
- [ ] Make backend to add review by AJAX
- [ ] Generate UI to rate with vanilla JS

## TODO React
- Make React version of rating system

## TODO Realtime
- [ ] Use ActionCable to get by Websockets latest changes on product reviews

## Administrative
I use [aministrative](https://github.com/thoughtbot/administrate) for having a CRUD interface and
make easy to generate products and reviews. I could do seed data but I wanted to use this gem : )
Also in general all companies I have worked has a god mode admin place where you can see all data.

To generate new dashboards in administrative do this:
```
rails generate administrate:dashboard YourRailsModel
```

