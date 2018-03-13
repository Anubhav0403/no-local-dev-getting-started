# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class Opportunity < ActiveRecord::Base
  self.table_name = 'salesforce.opportunity'
end

get "/opportunitys" do
  @opportunitys = opportunity.all
  erb :index
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
