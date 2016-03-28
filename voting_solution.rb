class VotingSolution < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    erb :questions
  end

end
