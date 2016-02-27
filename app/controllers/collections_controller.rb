class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  load_and_authorize_resource

  # GET /collections
  # GET /collections.json
  def index
    unless user_signed_in?
      render 'pages/welcome'
      return
    end
    @collections = current_user.collections
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    authenticate_user! unless @collection.share
    @show_modal=flash[:show_modal]
    # @new_link = @collection.links.build
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params.merge user_id: current_user.id)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      notice='Collection was successfully updated.'
      if collection_params[:share]=='true'
        notice ='Collection was successfully shared.'
        flash[:show_modal]=true
      elsif collection_params[:share]=='false'
        notice ='Collection was successfully unshared.'
      end

      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: notice }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = Collection.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def collection_params
    params.require(:collection).permit(:name, :share)
  end
end
