class Comment < ActiveRecord::Base

  belongs_to :customer
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  belongs_to :author, :class_name => 'User', :foreign_key => "created_by"
  belongs_to :user, :counter_cache => true

  validates :note,              :presence => true,       :length => { :maximum => 1255 }
  validates :commentable_type,  :presence => true
  #validates :commentable_id,    :presence => true

end
