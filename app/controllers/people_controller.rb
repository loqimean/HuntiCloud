class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]

  def index
    @people = Person.includes(:childhood_city, :current_city).ordered
  end

  def show; end

  def new
    @person = Person.new
  end

  def edit; end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to people_path, notice: 'Person was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @person.update(person_params)
      redirect_to person_url(@person), notice: 'Person was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    redirect_to people_url, notice: 'Person was successfully destroyed.'
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :second_name, :last_name, :photo,
                                    :phone_number, :email, :birthday, :gender,
                                    :childhook_city_id, :current_city_id, :characteristic,
                                    :blue_personality, :red_personality, :green_personality,
                                    :yellow_personality, :instagram_url, :telegram,
                                    :photo_cache)
  end
end
