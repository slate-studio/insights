# -----------------------------------------------------------------------------
# Authors: Maksym Melnyk <maxim@slatestudio.com>,
#          Alexander Kravets <alex@slatestudio.com>,
#          Slate Studio (http://www.slatestudio.com)
# -----------------------------------------------------------------------------
# INPUT CHART
# -----------------------------------------------------------------------------
class @InputChartTable extends InputChart
  _chart_options: ->
    type: 'TABLE'
    options:
      width: '100%'

chr.formInputs['chart-table'] = InputChartTable
