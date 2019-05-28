class FixpointsController < ApplicationController
  before_action :set_fixpoint, only: [:show, :edit, :update]

  def index
    @fixpoints = Fixpoint.all
  end

  def show
  end

  def new
    @fixpoint = Fixpoint.new
    @photo = @fixpoint.photos.build
  end

  def create
    @fixpoint = Fixpoint.new(fixpoint_params)
    @fixpoint.user = current_user
    # if @fixpoint.save
    #   redirect_to @fixpoint
    # else
    #   render :new
    # end

    respond_to do |format|

     if @fixpoint.save
      params[:photos]['url'].each do |a|
        @photo = @fixpoint.photos.create!(:url => a)
      end
      format.html { redirect_to @fixpoint, notice: 'Post was successfully created.' }
     else
       format.html { render 'new' }
      end
    end

  end

  def edit
  end

  def update
    if @fixpoint.update(fixpoint_params)
      redirect_to @fixpoint
    else
      render :edit
    end
  end

  private

  def set_fixpoint
    @fixpoint = Fixpoint.find(params[:id])
  end

  def fixpoint_params
    params.require(:fixpoint).permit(:longitude, :latitude, :fix_date, :fixed, photos_attributes: [:id, :fixpoint_id, :url, :fixed])
  end
end
