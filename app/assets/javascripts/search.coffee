# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  result = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.whitespace
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote:
      url: '/search?query=%QUERY'
      wildcard: '%QUERY')
  $('#remote_search').typeahead null,
    theme: 'bootstrap'
    tags: true
    allowClear: true
    source: result
    templates:
      empty: [
        '<div class="empty-message">'
          'Unable to find any.'
        '</div>'
      ].join('\n')
      suggestion: (result) ->
        """
          <a href= "tags/#{result.text}" >
            <div class="row">
              <div class="col-md-12">
                #{result.text}
              </div>
            </div>
          </a>
        """