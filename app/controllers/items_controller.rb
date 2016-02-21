class ItemsController < ApplicationController
	# before_filter :authenticate_user!

	def home

		if user_signed_in?
			@items = Item.where(user_id: current_user.id)
		else
			@items = Item.where(user_id:0)
		end
		# binding.pry
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
	end
end
