class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
    @healthrand = rand(1-24) + 100
    @strengthrand = rand(1-24) + 24
    @dexterityrand = rand(1-24) + 24
    @magicrand = rand(1-24) + 24
    @charismarand = rand(1-24) + 24
    @intelligencerand = rand(1-24) + 24
  end

  def create
    @character = current_user.characters.build(character_params)
    @character.user_id = current_user.id

    if @character.save
      redirect_to @character
    else
      render :new
    end
  end

  def show
    @character = Character.find_by_id(params[:id])
  end

  def edit
    @character = Character.find_by_id(params[:id])
  end

  def update
    @character = Character.find_by_id(params[:id])
    @character.health = @character.health
    @character.update(character_params)
    redirect_to character_path(@character)
  end

  def destroy
    @character = Character.find_by_id(params[:id])
    @character.destroy
    redirect_to characters_path
  end

  private
  def character_params
    params.require(:character).permit(:first_name, :last_name, :health, :strength,
      :dexterity, :magic, :charisma, :intelligence, :job, :race, :gender, :age,
      :eye_color, :hair_color, :size, :description, :user_id, :avatar)
  end
end
