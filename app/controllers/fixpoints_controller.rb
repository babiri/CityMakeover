class FixpointsController < ApplicationController
  before_action :set_fixpoint, only: [:show, :edit, :update]

  def index
    @fixpoints = Fixpoint.all
  end

  def show
    @fixpoint_attachments = @fixpoint.fixpoint_attachments.all
  end

  def new
    @fixpoint = Fixpoint.new
    @fixpoint_attachment = @fixpoint.fixpoint_attachments.build
  end

  def create
    @fixpoint = Fixpoint.new(fixpoint_params)
    @fixpoint.user = current_user

    respond_to do |format|
      if @fixpoint.save
        params[:fixpoint_attachments]['avatar'].each do |a|
          @fixpoint_attachment = @fixpoint.fixpoint_attachments.create!(:avatar => a,     :fixpoint_id => @fixpoint.id)
        end
       format.html { redirect_to @fixpoint, notice: 'fixpoint was successfully     created.' }
     else
       format.html { render action: 'new' }
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
    params.require(:fixpoint).permit(:longitude, :latitude, :fix_date, :fixed, fixpoint_attachments_attributes: [:id, :fixpoint_id, :photo, :fixed])
  end
end
