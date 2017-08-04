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
    display: 'text'
    allowClear: true
    source: result
    limit: 20
    templates:
      empty: [
        '<div class="empty-message">'
          'Unable to find any.'
        '</div>'
      ].join('\n')
      suggestion: (result) ->
        if result.object_type == 'User'
          if !result.avatar
            result.avatar = '/empty_avatar_44.png'
          """
            <div class="conteiner-fluid">
              <div class="row">
                <a href= "/profile/#{result.id}" >
                  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <img src="#{result.avatar}", class="img-circle">
                  </div>
                  <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                    #{result.full_name}
                  </div>
                </a>
              </div>
            </div>
          """
        else if result.object_type == 'Tag'
          """
            <a href= "/tags/#{result.id}" >
              <div class="row">
                <div class="col-md-12">
                  #{result.text}
                </div>
              </div>
            </a>
          """
