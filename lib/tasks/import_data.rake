namespace :import_data do
  task run: [:environment] do
    ::ImportMovies.new.call
  end
end
