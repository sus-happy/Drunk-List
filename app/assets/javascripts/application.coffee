# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

$(document).on 'ready page:load', ->
    Ink.requireModules ['Ink.UI.Drawer_1'], (Drawer) ->
        new Drawer()
        return

    $ '.star-check'
        .each ->
            $parent = $ this
            $child  = $parent.find 'li'
            $ this
                .find 'input'
                .off 'change'
                .on 'change', (event) ->
                    $child.removeClass 'on'
                    $ this
                        .closest 'li'
                        .prevAll 'li'
                        .addClass 'on'
                    return
                .filter ':checked'
                .trigger 'change'
            return
  return