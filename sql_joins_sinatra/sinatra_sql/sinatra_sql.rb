require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require "pg"

set :public_folder, File.dirname(__FILE__) + '/public'
conn = PG.connect( dbname: 'testing' )

get '/' do
  users = []
  conn.exec("SELECT * FROM authors") do |result|
    result.each do |row|
      if(!users.include? row)
        users << row
      end
    end
  end
  @users = users
  erb :hi
end

get '/add' do
  erb :add
end

post '/add' do
  conn.exec('INSERT INTO AUTHORS (name) values ($1)', [ params[:user] ] )
  redirect '/'
end

get '/edit/:id' do
  id = params[:id].to_i
  user = conn.exec('SELECT * FROM authors WHERE id = ($1)', [ id ] )
  @user = user[0]
  erb :edit
end

put '/edit/:id' do
  id = params[:id].to_i
  conn.exec('UPDATE AUTHORS SET (name) = ($1) WHERE id = ($2)', [ params[:user], id ] )
  redirect '/'
end

delete '/delete/:id' do
  id = params[:id].to_i
  conn.exec('DELETE FROM AUTHORS WHERE id = ($1)', [ id ] )
  redirect '/'
end