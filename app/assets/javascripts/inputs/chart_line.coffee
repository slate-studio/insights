# -----------------------------------------------------------------------------
# Authors: Maksym Melnyk <maxim@slatestudio.com>,
#          Alexander Kravets <alex@slatestudio.com>,
#          Slate Studio (http://www.slatestudio.com)
# -----------------------------------------------------------------------------
# INPUT CHART
# -----------------------------------------------------------------------------
class @InputChartLine extends InputChart
  _chart_options: ->
    type: 'LINE'
    options:
      width: '100%'

chr.formInputs['chart-line'] = InputChartLine
