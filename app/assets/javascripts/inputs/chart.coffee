# -----------------------------------------------------------------------------
# Authors: Maksym Melnyk <maxim@slatestudio.com>,
#          Alexander Kravets <alex@slatestudio.com>,
#          Slate Studio (http://www.slatestudio.com)
# -----------------------------------------------------------------------------
# INPUT CHART
# -----------------------------------------------------------------------------
class @InputChart
  constructor: (@name, @value, @config, @object) ->
    @_create_el()

  # PRIVATE ===================================================================

  _create_el: ->
    id   = "#{ @config.fieldName }_chart_container"
    @$el = $("<div id='#{ id }' class='input-chart'>")

  _chart_options: ->
    @config.chart

  _set_default_query_options: ->
    @config.query.dimensions ||= "ga:date"
    @config.query["start-date"] ||= "30daysAgo"
    @config.query["end-date"] ||=  "today"

  # PUBLIC ====================================================================

  showErrorMessage: (message) -> ;

  hideErrorMessage: -> ;

  initialize: ->
    @_set_default_query_options()

    # Provides flexibility of options customization for child input classes
    options = @_chart_options()
    options.options = $.extend(options.options, @config.chartOptions)

    @dataChart = new gapi.analytics.googleCharts.DataChart
      query: @config.query
      chart: options

    @dataChart.set
      query:
        ids: "ga:#{ GA_TABLE_ID }"
      chart:
        container: "#{ @config.fieldName }_chart_container"

    @dataChart.execute()

    @config.onInitialize?(this)

  hash: (hash={}) -> ;

  updateValue: (@value) -> ;

chr.formInputs['chart'] = InputChart
