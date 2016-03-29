class VotingSolution < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    erb :votes
  end

  get "/questions" do
    erb :questions
  end

  post "/vote" do
    redirect '/'
  end

end
