class CommentsController < ApplicationController
		before_action :authenticate_user!
		before_action :find_item
		before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
		before_action :comment_owner, only: [:destroy, :edit, :update]



	def create
		@comment = @item.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.save
		
		if @comment.save
			redirect_to items_path(@item)
		else
			render 'new'
		end
		
	end


	def destroy
		@comment.destroy
		redirect_to item_path(@item)

	end


	def edit

	end


	def update 

		if (@comment.update(params[:comment].permit(:content)))
			redirect_to item_path(@item)

		else

			render 'edit'
		end

	end

	private

	def find_item
		@item = Item.find(params[:item_id])
	end


	def find_comment
		@comment = @item.comments.find(params[:id])


	end

	def comment_owner
		unless current_user.id == @comment.user_id
			flash[:notice] = "You are not able to pass, you must be the owner of the commment and also a member"
			redirect_to @item
		end

	end

	



end