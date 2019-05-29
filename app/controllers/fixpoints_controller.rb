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
        infoWindow: render_to_string(partial: "infowindow", locals: { fixpoint: fixpoint })
      }
    end
  end

  def show
  end

  def new
  end

  def create
    @fixpoint = Fixpoint.new
  end

  def edit
  end

  def update

  end

 private

  def set_fixpoint
    @fixpoint = Fixpoint.find(params[:id])
  end


end
