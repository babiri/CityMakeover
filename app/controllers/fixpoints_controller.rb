class FixpointsController < ApplicationController

  before_action :set_fixpoint, only: [:show, :edit, :update]


  def index
    @fixpoints = Fixpoint.all
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
