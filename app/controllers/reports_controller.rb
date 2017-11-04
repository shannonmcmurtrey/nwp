class ReportsController < ApplicationController
  def quarterly
    @report = QuarterlyReport.render_html(@individuals)
  end
end
