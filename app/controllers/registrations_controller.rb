class RegistrationsController < Devise::RegistrationsController
  def edit
    debugger
    @cohorts = Cohort.all
    @cohorts.map! {|cohort| ["#{cohort.name} #{cohort.year}", cohort.id] }
    super
  end
end
