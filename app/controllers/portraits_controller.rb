class PortraitsController < ApplicationController
  before_action :find_portrait, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @portraits = Portrait.all.order("created_at DESC")
  end

  def show
  end

  def new
    @portrait = current_user.portraits.build
  end

  def create
    @portrait = current_user.portraits.build(portrait_params)

    if @portrait.save
      redirect_to @portrait, notice: "Successfully created new Portrait"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @portrait.update(portrait_params)
      redirect_to @portrait, notice: "Portrait was Successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @portrait.destroy
    redirect_to root_path
  end

  def upvote
    @portrait.upvote_by current_user
    redirect_to :back
  end

  private
  def portrait_params
    params.require(:portrait).permit(:title, :description, :image)
  end

  def find_portrait
    @portrait = Portrait.find(params[:id])
  end
end
