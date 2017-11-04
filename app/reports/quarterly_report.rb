class QuarterlyReport < Ruport::Controller
  stage :header

  def setup
  end

  class Html < Ruport::Formatter
    renders :html, :for => QuarterlyReport

    def build_header
      output << "<h1>Quarterly Report for individuals.</h1>"      
    end

  end
end