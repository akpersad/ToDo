class ItemsController < ApplicationController

	def home

		if user_signed_in?
			@items = Item.where(user_id: current_user.id).order(sort_column + " " + sort_direction)
		else
			@items = Item.where(user_id:0).order(sort_column + " " + sort_direction)
		end
	end

	def create
		
		@item = Item.create(item_params)
		if user_signed_in?
			@item.user_id = current_user.id
			if @item.save
			end
		else
			@item.user_id = 0
			if@item.save
			end
		end

		respond_to do |format|
		format.html {redirect_to root_path}
		format.js
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy

		respond_to do |format|
		format.html {redirect_to root_path}
		format.js
		end
	end

	def item_params
		params.require(:item).permit(:name)
		# binding.pry
	end
	
	def sort_column
    	Item.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
  
	def sort_direction
	    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
	end

end
