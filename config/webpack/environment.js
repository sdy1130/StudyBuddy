const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
var CaseSensitivePathsPlugin = require('case-sensitive-paths-webpack-plugin')

environment.plugins.append('Provide', 
    new CaseSensitivePathsPlugin(),
    new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}))

module.exports = environment

module.exports = environment
