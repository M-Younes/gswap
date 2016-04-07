module ApplicationHelper

	def selected_platform
		 params[:console].blank? ? "Selected platform" : params[:console]
	end
end
