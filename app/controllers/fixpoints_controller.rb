class FixpointsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_fixpoint, only: [:show, :edit, :update]

  def index
    @fixpoints = policy_scope(Fixpoint)
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
    authorize @fixpoint
  end

  def new
    @fixpoint = Fixpoint.new
    @fixpoint_attachment = @fixpoint.fixpoint_attachments.build
    authorize @fixpoint
  end

  def create
    @fixpoint = Fixpoint.new(fixpoint_params)
    @fixpoint.user = current_user
    authorize @fixpoint

    if @fixpoint.save
      save_photos if params[:fixpoint_attachments]

      redirect_to fixpoints_path, notice: 'fixpoint was successfully created.'
     else
       render action: 'new'
     end
  end

  def edit
    authorize @fixpoint
  end

  def update
    if @fixpoint.update(fixpoint_params)
      redirect_to @fixpoint
    else
      render :edit
    end
  end

  private

  def save_photos
    params[:fixpoint_attachments]['photo'].each do |ph|
      @fixpoint_attachment = @fixpoint.fixpoint_attachments.create!(photo: ph)
    end
  end

  def set_fixpoint
    @fixpoint = Fixpoint.find(params[:id])
  end

  def fixpoint_params
    params.require(:fixpoint).permit(:address, :category, :longitude, :latitude, :fix_date, :fixed, fixpoint_attachments_attributes: [:id, :fixpoint_id, :photo, :fixed])
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
