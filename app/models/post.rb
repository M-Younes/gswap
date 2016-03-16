class Post < ActiveRecord::Base

	CONSOLE_LIST = ["PS4", "PS3", "XBOX", "WII"]

	validates_presence_of :name, :console, :category, :image
	validates :console, :inclusion=> { :in => CONSOLE_LIST }


	default_scope -> { order('created_at DESC') }

end
