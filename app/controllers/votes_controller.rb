class VotesController < ApplicationController
  before_action :get_fixpoint, only: :create

  def create
    @vote = Vote.create(fixpoint: @fixpoint, user: current_user)
    authorize @vote
    # render json: vote
  end

  def destroy
    @vote = current_user.votes.find(params[:id])
    authorize @vote
  end

  private

  def get_fixpoint
    @fixpoint = Fixpoint.find(params[:fixpoint_id])
  end
end
