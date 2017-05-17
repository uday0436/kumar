class Api::UsersController < ApplicationController
	#http_basic_authenticate_with name:"uday",password: "12345"
def index
	@users = User.all
	respond_to do |format|
	format.json {render json: @users}
end
end
def create
	@user = User.new(user_params)
	respond_to do |format|
		if @user.save
			format.json {render json: @user}
		else
			format.json {render json: @user.errors}
		end
	end
end
def update
	@user = User.find(params[:id])
	respond_to do |format|
		if @user.update(user_params)
			format.json {render json: @user}
		else
			format.json {render json: @user.errors}
		end
	end
end
def destroy
	@user = User.where(id: params[:id]).first

		if @user.destroy
			head(:ok)
			
		else
			head(:unprocessable_entity)
		end
	end
end




private
def user_params
	params.require(:user).permit!
end
