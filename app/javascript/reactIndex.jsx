import React from 'react'
import { render } from 'react-dom'
import { createInertiaApp } from '@inertiajs/inertia-react'

// NOTE: This should be fixed. Inertia can do code splitting
// By default it works with Webpack/Babel. but because I use ESBuild dynamic imports are
// not supported out of the box. For now I hardcode the component required for the exercise
// because there is only one page : )
import ProductShow from './Pages/Product/Show'

createInertiaApp({
  resolve: name => ProductShow,
  setup({ el, App, props }) {
    render(<App {...props} />, el)
  },
})
