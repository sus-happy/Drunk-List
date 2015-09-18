# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
    $table = $ '#beers tbody'
    $ 'input#s'
        .off 'keyup'
        .on 'keyup', (event) ->
            reg = new RegExp $(this).val(), 'i'
            $table
                .find 'tr'
                .each (event) ->
                    name = $ this
                                .find 'td'
                                .eq 0
                                .text()
                    if !name.match reg
                        $ this
                            .hide()
                    else
                        $ this
                            .show()
                    return
            return
        return