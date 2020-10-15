const webpack = require('webpack')

const {
  environment
} = require('@rails/webpacker')

const customConfig  = require('./custom')

environment.config.merge(customConfig)

environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery/src/jquery',
  jQuery: 'jquery/src/jquery',
  jquery: 'jquery',
  'window.jQuery': 'jquery',
  Popper: ['popper.js', 'default']
}))

module.exports = environment
