class TraitsController < ApplicationController
  before_action :set_trait, only: [:show, :update, :destroy]

  # GET /traits
  def index
    @traits = Trait.all

    render json: @traits
  end

  # GET /traits/1
  def show
    render json: @trait
  end

  # POST /traits
  def create
    @trait = Trait.new(trait_params)

    if @trait.save
      render json: @trait, status: :created, location: @trait
    else
      render json: @trait.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /traits/1
  def update
    if @trait.update(trait_params)
      render json: @trait
    else
      render json: @trait.errors, status: :unprocessable_entity
    end
  end

  # DELETE /traits/1
  def destroy
    @trait.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trait
      @trait = Trait.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trait_params
      params.require(:trait).permit(:title, :description)
    end
end
