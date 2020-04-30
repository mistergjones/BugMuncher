require 'bcrypt'

def all_engineers ()
  run_sql("SELECT * from engineers ORDER by eng_id;")
end

def find_one_engineer_by_id(eng_id)
  sql = "SELECT * FROM engineers WHERE eng_id = $1;"
  run_sql(sql, [eng_id])[0]
end

def find_one_engineer_by_email(email)
  records = run_sql("SELECT * FROM engineers WHERE email = $1;", [email])
  if records.count == 0
    return nil
  else
    return records[0]
  end
end

def create_engineer(name, email, password)
  password_digest = BCrypt::Password.create(password)
  sql = "INSERT INTO engineers (name, email, password_digest) VALUES ($1, $2, $3);"
  run_sql(sql, [name, email, password_digest])
end

def update_engineer(eng_id, name, email, role)
  sql = "UPDATE engineers SET defect_title = $1, description = $2, status = $3, eng_id = $4 WHERE defect_id = $5;"
  run_sql(sql, [defect_title, description, status, eng_id, defect_id])
end