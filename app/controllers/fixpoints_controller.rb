class FixpointsController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_fixpoint, only: [:show, :edit, :update]

  def index
    #@fixpoints = Fixpoint.all

    @fixpoints = Fixpoint.where.not(latitude: nil, longitude: nil)

    @markers = @fixpoints.map do |fixpoint|
      {
        lat: fixpoint.latitude,
        lng: fixpoint.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { fixpoint: fixpoint }),
        image_url: url_for_marker(fixpoint)
      }
    end
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
        params[:fixpoint_attachments]['photo'].each do |ph|
          @fixpoint_attachment = @fixpoint.fixpoint_attachments.create!(photo: ph, fixpoint_id: @fixpoint.id)
        end
       format.html { redirect_to @fixpoint, notice: 'fixpoint was successfully created.' }
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

  def url_for_marker(fixpoint)
    if fixpoint.user == current_user
      helpers.asset_url('placeholder3.png')
    elsif fixpoint.fixed? == false
      helpers.asset_url('placeholder1.png')
    else
      helpers.asset_url('placeholder2.png')
    end
  end
end
