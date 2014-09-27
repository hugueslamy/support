# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('change', 'input.initial', () ->
  $.ajax
    url: '/statuses/' + $(this).val()
    type: 'patch'
    data: {
      'authenticity_token': $('meta[name="csrf-token"]').attr('content')
      'status[initial]': 'true'
    }
    dataType: "script"
)

$(document).on('change', 'input.holding', () ->
  $.ajax
    url: '/statuses/' + $(this).data("id")
    type: 'patch'
    data: {
      'authenticity_token': $('meta[name="csrf-token"]').attr('content')
      'status[holding]': $(this).is(':checked')
    }
    dataType: "script"
)
 
$(document).on('change', 'input.closing', () ->
  $.ajax
    url: '/statuses/' + $(this).data("id")
    type: 'patch'
    data: {
      'authenticity_token': $('meta[name="csrf-token"]').attr('content')
      'status[closing]': $(this).is(':checked')
    }
    dataType: "script"
) 
