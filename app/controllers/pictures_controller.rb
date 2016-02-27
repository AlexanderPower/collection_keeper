class PicturesController < ApplicationController
  before_action :set_picture, only: [:destroy]
  before_action :set_collection, only: [:new, :create]

  before_action :authenticate_user!

  load_and_authorize_resource :collection
  load_and_authorize_resource :picture, :through => :collection

  # GET /pictures/new
  def new
    @picture = @collection.pictures.build
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @collection.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture.collection, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to @picture.collection, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image) if params[:picture]
    end

    def set_collection
      @collection = Collection.find params[:collection_id]
    end
end
