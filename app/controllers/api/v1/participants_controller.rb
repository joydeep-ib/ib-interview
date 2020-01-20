# frozen_string_literal: true

module Api::V1
  # Comment
  class ParticipantsController < ApplicationController

    before_action :set_participant, only: %i[show update destroy]
    def show; end

    def index
      @participants = Participant.all
    end

    def create
      @participant = Participant.create!(participant_params)
    end

    def update
      @participant.update(participant_params)
    end

    def destroy
      @participant.destroy
      head :no_content
    end

    def by_email
      @participant = Participant.where(email: params[:email])
      raise ActiveRecord::RecordNotFound if @participant.empty?

      @participant = @participant[0]
    end

    private

    def participant_params
      params.permit(:name, :email)
    end

    def set_participant
      @participant = Participant.find(params[:id])
    end
  end
end

