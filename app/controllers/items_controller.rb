class ItemsController < ApplicationController

	def home
		@items = Item.all
		# binding.pry
	end

	def create
		Item.create(item_params)
		redirect_to root_path
	end

	def destroy
		item = Item.find(params[:id])
		item.destroy
		redirect_to root_path
	end

	def item_params
		params.require(:item).permit(:name, :done)
	end
end
