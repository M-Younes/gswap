class Post < ActiveRecord::Base
	belongs_to :user
	CONSOLE_LIST = ["PS4", "PS3", "XBOX", "WII"]

	validates_presence_of :name, :console, :category, :image
	validates :console, :inclusion=> { :in => CONSOLE_LIST }

	default_scope -> { order('created_at DESC') }
	scope :by_console, -> (console){where(console: console)}

	has_attached_file :post_img, styles: { post_index: "250x350>", post_show: "325x475>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/

  def can_edit?(current_user,post) 
  	if (current_user && current_user.id == post.user_id) || current_user.try(:admin?)
  		return true
  	end
  end
  
  def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	  where("console LIKE ?", "%#{search}%")
	end

end
