const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
var CaseSensitivePathsPlugin = require('case-sensitive-paths-webpack-plugin')

// Get a pre-configured plugin
const manifestPlugin = environment.plugins.get('Manifest')
manifestPlugin.options.writeToFileEmit = false

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
  'Provide',
  new CaseSensitivePathsPlugin(),
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.Tether': 'tether',
    Popper: ['popper.js', 'default'],
    ActionCable: 'actioncable',
    Vue: 'vue',
    VueResource: 'vue-resource',
  })
)

module.exports = environment
