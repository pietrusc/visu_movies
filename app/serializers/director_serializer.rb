class DirectorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :fb_likes
end
