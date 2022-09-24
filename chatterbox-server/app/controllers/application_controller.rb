class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # Add routes

  get '/' do
    'Hello World'
  end

  get "/messages" do
    messages = Message.all
    messages.to_json
  end

  post "/messages" do
    message = Message.create(body:params[:body], username:params[:username],
    created_at:params[:created_at], updated_at:params[:updated_at], )

    message.to_json
  end

  get "/messages/:id" do
    message = Message.find(params[:id])
    message.to_json
  end

  patch "/messages/:id" do
    message = Message.find(params[:id])
    message.update(body:params[:body], username:params[:username],
    created_at:params[:created_at], updated_at:params[:updated_at], )

    message.to_json
  end

  delete "/messages/:id" do
    Message.destroy(params[:id])
  end

end
