require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'models/defect'
require_relative 'models/engineer'
require_relative 'lib'

enable :sessions # plural - this is a sinatra feature

get '/' do
  # how about show current defect summary at the start. The users to login to see more detail
  defect_summary = defect_summary()
  #puts defect_summary.to_a
  erb(:index, locals: {
    defect_summary: defect_summary
  })
end


get '/defects' do
  # Want to show all defects once logged in

  #1. route to login if the user is not logged in
  redirect "/login" unless logged_in?

  #2 if login is okay, obtain all defects
  all_defects = all_defects()

  erb(:show, locals: {
    all_defects: all_defects
  })


end

get '/login' do
  erb(:login)
end

post '/login' do
  # After a user submits their login details, we need to verify them.
  # 1. obtain the current engineer's email address who is attempting to login
  engineer = find_one_engineer_by_email( params[:email] )

  #2
  if engineer && BCrypt::Password.new(engineer["password_digest"]) == params[:password]
    session[:eng_id] = engineer['eng_id'] # write down that this user is logged in
    redirect "/defects"
    
  else
    erb :login
  end

end

# This allows an engineer to utilise a form to submit a new defect
get '/defects/new' do
  erb(:new)
end

# here, we are going to insert a new defects
post '/defects' do
  # guard condition
  redirect "/login" unless logged_in?
  create_new_defect(params[:defect_title], params[:description], params[:status], current_engineer['eng_id'])
  redirect "/"
end

get '/defects/:defect_id' do

  defect = find_one_defect_by_id(params[:defect_id])
  engineer = find_one_engineer_by_id(defect["eng_id"])
  erb(:showdefect, locals: { defect: defect, engineer: engineer} )
end

get '/defects/:defect_id/edit' do
  defect = find_one_defect_by_id(params[:defect_id])
  engineer = find_one_engineer_by_id(defect["eng_id"])

  erb(:edit, locals: { defect: defect, engineer: engineer })
end


# here, we are updating defect itself
patch '/defects' do

  update_defect(
    params[:defect_id], 
    params[:defect_title], 
    params[:description],
    params[:status],
    session['eng_id']
  )
  redirect "/defects/#{params[:defect_id]}"  
end


delete '/logout' do
  # 1 its crud - destroy - what?
  session[:eng_id] = nil

  # 2 not a safe method so redirect to a get
  # redirect to where???
  # login page may be????
  redirect "/login"
end





