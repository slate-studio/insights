# -----------------------------------------------------------------------------
# Authors: Maksym Melnyk <maxim@slatestudio.com>,
#          Alexander Kravets <alex@slatestudio.com>,
#          Slate Studio (http://www.slatestudio.com)
# -----------------------------------------------------------------------------
# INSIGHTS DASHBOARD
# -----------------------------------------------------------------------------
# Dependencies:
#= require_tree ./inputs
# -----------------------------------------------------------------------------
class @InsightsDashboard
  constructor: (config) ->
    @title = config.title
    @subtitle = config.subtitle
    @disableSave = true
    @objectStore = new ObjectStore({ data: {} })
    @formSchema = {}

    for k, v of config.charts
      @_add_chart(k, v)

  ## PRIVATE ==================================================================

  _add_chart: (name, config) ->
    @formSchema["#{name}_panel"] =
      type: "group"
      groupClass: "group-panel"
      title: config.title || name.titleize()
      inputs: {}

    @formSchema["#{name}_panel"].inputs[name] =
      type: config.type || "chart-line"
      query: config.query
      chartOptions: config.chartOptions
