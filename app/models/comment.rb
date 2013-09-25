class Comment < ActiveRecord::Base
  def tweet?
    relname == "tweets"
  end
end
