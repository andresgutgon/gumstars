const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js'
  ],
  theme: {
    container: {
      center: true,
      padding: '2rem',
    },
    fontFamily: {
      sans: [
        'Roboto',
        ...defaultTheme.fontFamily.sans,
      ]
    }
  },
  variants: {
    container: [],
  }
}
