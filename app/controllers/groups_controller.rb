class GroupsController < ApplicationController


  def index
    name = params[:search]
    @groups = Group.search(name)
    json_response(@groups)
  end

  def show
    @group = Group.find(params[:id])
    json_response(@group)
  end

  def create
    @group = Group.create!(group_params)
    json_response(@group)
  end

  def update
    @group = Group.find(params[:id])
    if @group.update!(group_params)
      render status: 200, json: {
        message: "This group has been updated successfully."
      }
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def group_params
    params.permit(:name, :description)
  end
end
