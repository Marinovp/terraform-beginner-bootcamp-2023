require 'sinatra'
require 'json'
require 'pry'
require 'active_model'

# We will mock having a state or database for this development server
# by setting a global variable. You would never use a global variable 
# in a PROD server.
$home = {}

# This is a ruby class that includes validations from ActiveRecord.
# RThis will represent our Home resources as a ruby object
class Home
  # ActiveModel is part of Ruby on Rails.
  # it is used as an ORM. It has a module within
  # ActiveModel that provides validations.
  # The production Terratowns server is rails and uses
  # very similar and in most cases identical validation
  # https://guides.rubyonrails.org/active_model_basics.html
  # https://guides.rubyonrails.org/active_record_validations.html
  include ActiveModel::Validations

  # Create some virtual actributes to stored on this object.
  # This will set a getter and setter
  # eg.
  # home = new Home()
  # home.town = 'Hello' # setter
  # home.town() # Getter
   attr_accessor :town, :name, :description, :domain_name, :content_version

  # gamers-togo
  # cooker-cove
  validates :town, presence: true ,inclusion: { in: [
    'missingo',
    'cooker-cove',
    'melomaniac-mansion',
    'gamers-grotto',
    'video-valley',
    'the-nomad-pad'
    ]}
  validates :name, presence: true
  validates :description, presence: true
  validates :domain_name, 
    format: { with: /\.cloudfront\.net\z/, message: "domain must be from .cloudfront.net" }
    # uniqueness: true, 

  # content_version has to be an integer
  # we will make sure is an increemental version in the controller  
  validates :content_version, numericality: { only_integer: true }
end


# WE are extending a calss from Sinatra::Base to
# turn this generic class to utilize the sinatra-web-framework
class TerraTownsMockServer < Sinatra::Base

  def error code, message
    halt code, {'Content-Type' => 'application/json'}, {err: message}.to_json
  end

  def error_json json
    halt code, {'Content-Type' => 'application/json'}, json
  end

  def ensure_correct_headings
    unless request.env["CONTENT_TYPE"] == "application/json"
      error 415, "expected Content_type header to be application/json"
    end

    unless request.env["HTTP_ACCEPT"] == "application/json"
      error 406, "expected Accept header to be application/json"
    end
  end

  # Return an hardcoded access token
  def x_access_code
    return '9b49b3fb-b8e9-483c-b703-97ba88eef8e0'
  end

  def x_user_uuid
    return 'e328f4ab-b99f-421c-84c9-4ccea042c7d1'
  end

  def find_user_by_bearer_token
    auth_header = request.env["HTTP_AUTHORIZATION"]
    if auth_header.nil? || !auth_header.start_with?("Bearer ")
      error 401, "a1000 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end

    code = auth_header.split("Bearer ")[1]
    if code != x_access_code
      error 401, "a1001 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end

    if params['user_uuid'].nil?
      error 401, "a1002 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end

    unless code == x_access_code && params['user_uuid'] == x_user_uuid
      error 401, "a1003 Failed to authenicate, bearer token invalid and/or teacherseat_user_uuid invalid"
    end
  end

  # CREATE
  post '/api/u/:user_uuid/homes' do
    ensure_correct_headings 
    find_user_by_bearer_token
    puts "# create - POST /api/homes"

    begin
      payload = JSON.parse(request.body.read)
    rescue JSON::ParserError
      halt 422, "Malformed JSON"
    end

    # Validate payload data
    name = payload["name"]
    description = payload["description"]
    domain_name = payload["domain_name"]
    content_version = payload["content_version"]
    town = payload["town"]

    puts "name #{name}"
    puts "description #{description}"
    puts "domain_name #{domain_name}"
    puts "content_version #{content_version}"
    puts "town #{town}"

    home = Home.new
    home.town = town
    home.name = name
    home.description = description
    home.domain_name = domain_name
    home.content_version = content_version
    
    unless home.valid?
      error 422, home.errors.messages.to_json
    end

    uuid = SecureRandom.uuid
    puts "uuid #{uuid}"
    $home = {
      uuid: uuid,
      name: name,
      town: town,
      description: description,
      domain_name: domain_name,
      content_version: content_version
    }

    return { uuid: uuid }.to_json
  end

  # READ
  get '/api/u/:user_uuid/homes/:uuid' do
    ensure_correct_headings
    find_user_by_bearer_token
    puts "# read - GET /api/homes/:uuid"

    # checks for house limit

    content_type :json
    if params[:uuid] == $home[:uuid]
      return $home.to_json
    else
      error 404, "failed to find home with provided uuid and bearer token"
    end
  end

  # UPDATE
  put '/api/u/:user_uuid/homes/:uuid' do
    ensure_correct_headings
    find_user_by_bearer_token
    puts "# update - PUT /api/homes/:uuid"
    begin
      # Parse JSON payload from the request body
      payload = JSON.parse(request.body.read)
    rescue JSON::ParserError
      halt 422, "Malformed JSON"
    end

    # Validate payload data
    name = payload["name"]
    description = payload["description"]
    content_version = payload["content_version"]

    unless params[:uuid] == $home[:uuid]
      error 404, "failed to find home with provided uuid and bearer token"
    end




    home = Home.new
    home.town = $home[:town]
    home.domain_name = $home[:domain_name]
    home.name = name
    home.description = description
    home.content_version = content_version

    unless home.valid?
      error 422, home.errors.messages.to_json
    end

    return { uuid: params[:uuid] }.to_json
  end

  # DELETE
  delete '/api/u/:user_uuid/homes/:uuid' do
    ensure_correct_headings
    find_user_by_bearer_token
    puts "# delete - DELETE /api/homes/:uuid"
    content_type :json

    if params[:uuid] != $home[:uuid]
      error 404, "failed to find home with provided uuid and bearer token"
    end

    #delete from mock database
    uuid = $home[:uuid]
    $home = {}
    { uuid: uuid}.to_json
  end
end

# This i what will run the server
TerraTownsMockServer.run!