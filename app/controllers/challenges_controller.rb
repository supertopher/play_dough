class ChallengesController < ApplicationController

  def index
    # this needs to be dry-er
    @days = [1,2,3,4,5,6,7]
    @events = Event.all
    @events_with_times = []
    @events.each do |event|
      event.event_times.each do |event_time|
        @events_with_times << [event, event_time]
      end
    end
    @recently_completed_challenges = ChallengeAttempt.limit(10) if current_user.staff
    return unless current_user && current_user.cohort
    @random_animation = ["Left", "Right"]
    # loop through all of the user's events and fill two
    # arrays, one for the day and one for the week
    phase_time = current_user.cohort.current_phase_day
    phase_day = phase_time.last
    phase_week = phase_time.first
    @events_for_today = []
    @events_for_week = []
    current_user.cohort.phase.events.each do |event|
      event.event_times.each do |event_time|
        if event_time.week.to_i == phase_time.first
          @events_for_week << [event, event_time]

          if event_time.day.to_i == phase_time.last
            @events_for_today << [event, event_time]
          end
        end
      end
    end
    # Changes for understanding legacy logic, not permanent
    required_list = current_user.cohort.phase.challenges.where(default_week: phase_week, default_day: phase_day, required: true)
    optional_list = current_user.cohort.phase.challenges.where(default_week: phase_week, default_day: phase_day, required: false)
    @challenge_list = [required_list, optional_list]
    # @challenge_list =  @challenge_list.find_all_by_required(true)
    # @challenge_list << @challenge_list.find_all_by_required(false)
    # debugger
    # @challenge_list = Challenge.find_all_by_default_week(1)
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      :autolink => true, :space_after_headers => true,
      :fenced_code_blocks => true)
  end

  def show
    @challenge = Challenge.find(params[:id])
    # markdown to HTML
    # @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    #   :autolink => true, :space_after_headers => true,
    #   :fenced_code_blocks => true, :highlight => true)
    @comment = Comment.new
    @comment.challenge = @challenge
    @comment.user = current_user
  end

  def new
    redirect_to challenges_path unless current_user.staff
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(params[:challenge])
    redirect_to challenge_path(@challenge)
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update_attributes(params[:challenge])
    redirect_to challenge_path(params[:id])
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path
  end

end


