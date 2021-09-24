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
- [x] Add Tailwind to style the pages
- [x] Add Gunroad favicon
- [x] Stars average rating with all reviews
- [ ] Show product reviews (No auth required for the challenge)
- [ ] Make modal with Hotwired (aka kind of Vanilla JS)

## TODO React
- Make React version of rating system

## TODO Realtime
- [ ] Add Redis addon to Heroku or deploy to Digital Ocean. Heroku requires to add a credit card even for a free addon.
- [ ] Use ActionCable to get by Websockets latest changes on product reviews

## Compromises
Things I would do different or I have doubts.

1- Stars SVG as in Figma. I wanted full fidelity to Figma (Kind of, I used Tailwind defaults) regarding how stars looks
in the UI. For that reason I used original SVGs with their filters. The stars looks nice but I couldn't
find a nicer way of not repeating this SVG. One solution would be transform in Figma those gradients (not sure, I don't have this Figma knowledge). Other option could be to simplify these stars and be plain SVG without filters

## Administrative
I use [aministrative](https://github.com/thoughtbot/administrate) for having a CRUD interface and
make easy to generate products and reviews. I could do seed data but I wanted to use this gem : )
Also in general all companies I have worked has a god mode admin place where you can see all data.

To generate new dashboards in administrative do this:
```
rails generate administrate:dashboard YourRailsModel
```

## Resources
I like to document the resources I found to do what I need. This way I can re-read in understand why I took a decision
- [How to create modals using Hotwire](https://bramjetten.dev/articles/how-to-create-modals-using-hotwire)
