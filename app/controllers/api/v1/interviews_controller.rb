require 'date'
# Comment

module Api::V1
  class InterviewsController < ApplicationController
    before_action :set_interview, only: %i[show update destroy]
    before_action :set_time, only: %i[create update]

    def index
      @interviews = Interview.all
    end

    def show; end

    def create
      @interview = Interview.new(title: params[:title],
                                 description: params[:description],
                                 startdt: @startdt, enddt: @enddt)
      params[:participants].each do |participant_id|
        participant = Participant.where(id: participant_id)
        @interview.participants << participant if participant.count != 0
      end

      @interview.save!
    end

    def edit; end

    def update
      @interview.title = params[:title]
      @interview.description = params[:description]
      @interview.startdt = @startdt
      @interview.enddt = @enddt
      @interview.participants = []
      params[:participants].each do |participant_id|
        participant = Participant.where(id: participant_id)
        @interview.participants << participant if participant.count != 0
      end
      @interview.save!
    end

    def destroy
      @interview.destroy
    end

    private

    def set_interview
      @interview = Interview.find(params[:id])
    end

    def set_time
      @startdt = DateTime.parse(params[:startDate] + ' ' + params[:startTime])
      @enddt = DateTime.parse(params[:endDate] + ' ' + params[:endTime])
    end

    def interview_params
      params.permit(:title, :description,  :startDate, :startTime, :endDate, :endTime, participants: [])
    end
  end
end
