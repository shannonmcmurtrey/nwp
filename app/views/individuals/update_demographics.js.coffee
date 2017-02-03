$("#report_data").empty();
$("#report_data").append("<%= escape_javascript(render(:partial => @cohort)) %>")