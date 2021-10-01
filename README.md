# README
This is a job challenge code for Gumroad. You can read [about it here](https://gumroad.notion.site/Coding-challenge-f7aa85150edd41eeb3537aae4632619f)

### The stack
Rails + React

## Though proccess
This repo is here to probe my knowledge of programing (a bit) and how I think when I develop features.
You can follow my though proccess through [Pull requests in chronological order](https://github.com/andresgutgon/gumstars/pulls?q=is%3Apr+is%3Aclosed)

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
- [x] Show product reviews (No auth required for the challenge).

## Fix deploy Heroku
- [x] Assets are not compiled CSS and JS. It was adding the [Nodejs Buildpack in Heroku](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app)

## Make review vanilla JS (well, Hotwire)
- [x] Make modal with Hotwired (aka kind of Vanilla JS).
- [x] Implement review creating logic in the backend.
- [x] Implement better stars CSS styles components with exported SVGs from Gumroad styleguide. I just discovered it :facepalm:
- [x] System tests to check creating a review works as expected.

## TODO Realtime
- [ ] Use ActionCable to get by Websockets latest changes on product reviews
- [ ] Add Redis addon to Heroku or deploy to Digital Ocean. Heroku requires to add a credit card even for a free addon.

## TODO React
- [ ] Make React version of rating system UI
- [ ] Make React version realtime with an ActionCable channel. In the vanilla version I'm using TurboStreams that sends HTML over the Wire (troll). So it doesn't work

## Fixes
- [x] Fix DB reference to delete on cascade all reviews when a product is deleted
- [x] Fix modal width and scroll on mobile.

## Compromises
Things I would do different or I have doubts.

1- ~Stars SVG as in Figma. I wanted full fidelity to Figma (Kind of, I used Tailwind defaults) regarding how stars looks
in the UI. For that reason I used original SVGs with their filters. The stars looks nice but I couldn't
find a nicer way of not repeating this SVG. One solution would be transform in Figma those gradients (not sure, I don't have this Figma knowledge). Other option could be to simplify these stars and be plain SVG without filters~ Stupid mistake. Export SVGs as files and that's it

2- I use [Hotwire](https://hotwired.dev/) for the vanilla JS version. Is not pure vanilla. Is better!. Less code. I think any Rails app that is not using a JS framework in 2021 should try Hotwire

3- Assets (the stars icons SVGs) are deployed in /public. This is not how works Rails assets pipeline. Doing well means put in app/assets/images but is was not working on Heroku free tier and didn't wanted to expend time on this.

## Administrative
I use [aministrative](https://github.com/thoughtbot/administrate) for having a CRUD interface and
make easy to generate products and reviews. I could do seed data but I wanted to use this gem : )
Also in general all companies I have worked has a god mode admin place where you can see all data.

To generate new dashboards in administrative do this:
```
rails generate administrate:dashboard YourRailsModel
```

## Resources
I like to document the resources I found to do what I need. This way I can re-read and understand why I took a decision
- [Get started with Heroku and Rails 7](https://devcenter.heroku.com/articles/getting-started-with-rails7)
- [How to create modals using Hotwire](https://bramjetten.dev/articles/how-to-create-modals-using-hotwire)
- [Great post about Hotwire TurboStreams](https://www.colby.so/posts/turbo-streams-on-rails)
