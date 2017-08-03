# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:before-cache', ->
  $('.tags-select').select2 'destroy'

$(document).on 'turbolinks:load', ->
  return unless $('.tags-select').length
  $('.tags-select').empty()
  window.select2 = $('.tags-select').select2
    theme: 'bootstrap'
    tags: true
    allowClear: true
    placeholder: 'Enter your tags...'
    tokenSeparators: [',', ' ', '_']
    createTag: (params) ->
      term = $.trim(params.term)
      unless term.match(/^#[\da-zA-Zа-яА-ЯёЁ]{1,20}$/)
        if term.match(/^[\da-zA-Zа-яА-ЯёЁ]{1,19}$/)
          term = "\##{term}"
        else
          return null
      {
        id: term
        text: term
      }
    insertTag: (data, tag) ->
      data.unshift tag unless data.filter((el) ->
        tag.text == el.text
      ).length
