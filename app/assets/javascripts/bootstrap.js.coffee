jQuery ->
  $('a[rel~=popover], .has-popover').popover()
  $('a[rel~=tooltip], .has-tooltip').tooltip()
  $('.datepicker').datepicker({format: 'dd-mm-yyyy'})