
def all_chart_info ()
    run_sql("SELECT * from reports ORDER by report_id;")
end

