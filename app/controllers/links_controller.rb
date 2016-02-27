class LinksController < ApplicationController
  before_action :set_link, only: [:edit, :update, :destroy]
  before_action :set_collection, only: [:new, :create]

  before_action :authenticate_user!

  load_and_authorize_resource :collection
  load_and_authorize_resource :link, :through => :collection

  # GET /links/new
  def new
    @link = @collection.links.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = @collection.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link.collection, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link.collection, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to @link.collection, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:text)
    end

    def set_collection
      @collection = Collection.find params[:collection_id]
    end
end
