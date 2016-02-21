class ItemsController < ApplicationController

	def home
		@items = Item.all
		# binding.pry
	end

	def create
		@item = Item.create(item_params)

		respond_to do |format|
		format.html { redirect_to root_path}
		format.js
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy

		respond_to do |format|
		format.html { redirect_to root_path}
		format.js
		end
	end

	def item_params
		params.require(:item).permit(:name, :done)
	end
end
