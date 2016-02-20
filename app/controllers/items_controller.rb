class ItemsController < ApplicationController

	def index
		@items = Item.all
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
end
