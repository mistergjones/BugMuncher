def run_sql(sql, params = [])
    conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'bugmuncher'})
    # conn = PG.connect(dbname: 'bugmuncher')
    records = conn.exec_params(sql, params)
    conn.close
    records
end

def all_defects ()
    run_sql("SELECT * from defects ORDER by defect_id;")
end

def defect_summary()
    #run_sql("SELECT status, COUNT (status) from defects group by status;")
    run_sql("SELECT status, COUNT (status) from defects group by status UNION ALL select 'Total' Status, COUNT(status) from defects;")
end

def find_one_defect_by_id(defect_id)
    sql = "SELECT * FROM defects WHERE defect_id = $1;"
    run_sql(sql, [defect_id])[0]
end

def create_new_defect(defect_title, description, status, eng_id)
    sql = ("INSERT INTO defects (defect_title, description, status, eng_id) VALUES ($1, $2, $3, $4);")
    run_sql(sql, [defect_title, description, status, eng_id])
end

def update_defect(defect_id, defect_title, description, status, eng_id)
    sql = "UPDATE defects SET defect_title = $1, description = $2, status = $3, eng_id = $4 WHERE defect_id = $5;"
    run_sql(sql, [defect_title, description, status, eng_id, defect_id])
end

def delete_defect(defect_id)
    sql = "DELETE FROM defects WHERE defect_id = $1;"
    run_sql(sql, [defect_id])
end