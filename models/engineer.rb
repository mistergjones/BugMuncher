require 'bcrypt'

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