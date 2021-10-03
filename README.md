# README
This is a job challenge code for [Gumroad](https://gumroad.com). You can read [about it here](https://gumroad.notion.site/Coding-challenge-f7aa85150edd41eeb3537aae4632619f).
The challenge is deployed in Heroku, [check demo](https://ancient-plains-61613.herokuapp.com/). Be patience, is a free Heroku instance :)

## Though proccess
This repo is here to prove my knowledge of programing (a bit) and how I think when I develop features.
You can follow my though proccess through [Pull requests in chronological order](https://github.com/andresgutgon/gumstars/pulls?q=is%3Apr+is%3Aclosed)

## Requirements for the challenge
- [x] Front-end: display product rating in vanilla JS / jQuery (I used Hotwire, in 2021 is way better than jQuery). I know too jQuery : )
- [x] Back-end: store a list of products *and* product reviews (5-star rating + text for review)

Using this MVP, add a bunch of ratings to the product. Then, for V2:

- [x] Migrate the display of the product's rating to React
- [x] Make the display of the rating real-time (e.g. if a new rating is added from another page)
- [x] Update the ratings back-end and front-end to support half-star reviews

## Bonus points
- [x] Setup CI with a GitHub Action to run tests on each Pull request
- [x] Make the [implementation switcher UI](https://github.com/andresgutgon/gumstars/pull/7)
- [x] Learn [Hotwire](https://hotwired.dev/) to use TurboStreams as a realtime solution in VanillaJS version
- [x] Learn [ActionCable](https://guides.rubyonrails.org/action_cable_overview.html) as a realtime solution for React version.
- [x] Make systems tests that works on both implementations (React and VanillaJS)

### Product with reviews and implementation switcher
![show](https://user-images.githubusercontent.com/49499/135743484-e83ab728-ea47-469b-a34c-3df0dac173cf.png)
### Create review modal
![create review](https://user-images.githubusercontent.com/49499/135248683-6ffca0e3-eb10-4e91-ab18-0c90ace057c2.png)

### The stack
Backend with Rails and frontend with (Hotwire | React).

## Compromises/Considerations
Things I would do different or I have doubts.

1- ~Stars SVG as in Figma. I wanted full fidelity to Figma (Kind of, I used Tailwind defaults) regarding how stars looks
in the UI. For that reason I used original SVGs with their filters. The stars looks nice but I couldn't
find a nicer way of not repeating this SVG. One solution would be transform in Figma those gradients (not sure, I don't have this Figma knowledge). Other option could be to simplify these stars and be plain SVG without filters~ Stupid mistake. Export SVGs as files and that's it

2- I use [Hotwire](https://hotwired.dev/) for the vanilla JS version. Is not pure vanilla. Is better!. Less code. I think any Rails app that is not using a JS framework in 2021 should try Hotwire

3- Assets (the stars icons SVGs) are deployed in /public. This is not how works Rails assets pipeline. Doing well means put in app/assets/images but is was not working on Heroku free tier and didn't wanted to expend time on this.

4- In a real app reviews should be paginated or lazy loaded. Lazyloaded if SEO is not a concern.

5- I made modal component from 0. In a real app I would use something like [react-portal](https://github.com/tajo/react-portal). Is not a complicated code but works nicely. DRY when makes sense.

## React implementation
When doing the React version I was wondering what was the desired implementation. It depends on what we want to achieve. It can be one of these possibilities (I'm sure there are more).
To build a React UI in an existing Rails app I would do...
1. A new SSR app in Node like NextJS if SEO is important.
2. A SPA or a [Inertia.js](https://inertiajs.com/) if all the UI is going to be migrated to React and SEO is not important.
3. Just some React components inserted in the `.erb` files if is only a small part that we want to be interactive.

I chose doing React UI in [Inertia.js](https://inertiajs.com/) because SEO is not important for this test :). And also because I wanted to try it. It looks super interesting to have a React UI but not need to have an independent API to interact with it. In my previous job we had a separated repo with a React SPA application that talked to a Rails Rest JSON API backend. And the client data was stored in [Mobx stores](https://github.com/masylum/mobx-rest)

## TODOs
I usually do a todo list for each feature/PR. This way I can track progress. I do or in the PR description or in a separate file like in this case.

### TODO data modeling
- [x] Setup a new Rails 7 project with Heroku deploy
- [x] Add [aministrative](https://github.com/thoughtbot/administrate) for adding products and review seed data. Not necessary but wanted to try this.
- [x] Abstract ActiveRecord in controller `Product.all`
- [x] Add Rspec to the project and test review has rating validation
- [x] Setup GitHub action to run specs on Pull requests
- [x] ~Dummy List of products~ Nothing visible just in the database
- [x] Dummy Product detail route

### TODO Styles
- [x] Add Tailwind to style the pages
- [x] Add Gunroad favicon
- [x] Stars average rating with all reviews
- [x] Show product reviews (No auth required for the challenge).

### Fix deploy Heroku
- [x] Assets are not compiled CSS and JS. It was adding the [Nodejs Buildpack in Heroku](https://devcenter.heroku.com/articles/using-multiple-buildpacks-for-an-app)

### Make review vanilla JS (well, Hotwire)
- [x] Make modal with Hotwired (aka kind of Vanilla JS).
- [x] Implement review creating logic in the backend.
- [x] Implement better stars CSS styles components with exported SVGs from Gumroad styleguide. I just discovered it :facepalm:
- [x] System tests to check creating a review works as expected.

### TODO Realtime
- [x] Use ActionCable to get by Websockets latest changes on product reviews
- [x] ~Add Redis addon to Heroku or deploy to Digital Ocean. Heroku requires to add a credit card even for a free addon.~ Not necessary for the challenge. Rails has a dummy implementation of Redis to handle ActionCable in development `async` and I used it in Heroku.

### TODO React
- [x] Make React version of rating system UI
- [x] Make React version realtime with an ActionCable channel. In the vanilla version I'm using TurboStreams that sends HTML over the Wire (troll). So it doesn't work

### Fixes
- [x] Fix DB reference to delete on cascade all reviews when a product is deleted
- [x] Fix modal width and scroll on mobile.


#### Administrative
I use [aministrative](https://github.com/thoughtbot/administrate) for having a CRUD interface and
make easy to generate products and reviews. I could do seed data but I wanted to use this gem : )
Also in general all companies I have worked has a god mode admin place where you can see all data.
You can create your own products going to `/admin` 😃

To generate new dashboards in administrative do this:
```
rails generate administrate:dashboard YourRailsModel
```

## Development
``` ruby
git clone git@github.com:andresgutgon/gumstars.git
cd gumstars
bundle
yarn
rails db:migrate

// Run JS/CSS bundle watch and Rails server. Recommended way in Rails 7
./bin/dev
```

## Resources
I like to document the resources I found to do what I need. This way I can re-read and understand why I took a decision
- [Get started with Heroku and Rails 7](https://devcenter.heroku.com/articles/getting-started-with-rails7)
- [How to create modals using Hotwire](https://bramjetten.dev/articles/how-to-create-modals-using-hotwire)
- [Great post about Hotwire TurboStreams](https://www.colby.so/posts/turbo-streams-on-rails)
- [Inertia.js. An interesting way of using React in a Rails app](https://inertiajs.com/)
- [Interesting read on how to manage Rails CSRF token and Ajax requests (with Axios). Check inertia_csrf.rb concern](https://pragmaticstudio.com/tutorials/rails-session-cookies-for-api-authentication)
- [React realtimne implementation with ActionCable](https://dev.to/doctolib/rails-react-actioncable-without-the-fuss-4ebn)
