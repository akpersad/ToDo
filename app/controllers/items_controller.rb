class ItemsController < ApplicationController

	def home
		@items = Item.all
	end

	def create
		Item.create
		redirect_to root_path
	end

	def destroy
		item = Item.find(params[:id])
		item.destroy
		redirect_to root_path
	end
end
