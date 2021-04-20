class ActorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :fb_likes
end
