class VersionsController < ApplicationController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  before_action :set_version, except: [:index, :new, :create, :upload]

  # GET /versions
  # GET /versions.json
  def index
    @versions = smart_listing_create(:versions, Version.all, partial: "versions/listing")
  end

  # GET /versions/new
  def new
    @version = Version.new
  end

  # GET /versions/1/edit
  def edit
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = Version.create(version_params)

    # respond_to do |format|
    #   if @version.save
    #     format.html { redirect_to @version, notice: 'Version was successfully created.' }
    #     format.json { render :show, status: :created, location: @version }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @version.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    @version.update_attributes(version_params)
    # respond_to do |format|
    #   if @version.update(version_params)
    #     format.html { redirect_to @version, notice: 'Version was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @version }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @version.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def upload
    temp_file = params[:version]
    @name = temp_file.original_filename
    @temp_path = temp_file.path

    file = VersionUploader.new

    if file.store!(temp_file)
      Version.import(@temp_path)
    end
    redirect_to root_path
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @version.destroy
    redirect_to versions_url
    # respond_to do |format|
    #   format.html { redirect_to versions_url, notice: 'Version was successfully destroyed.' }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = Version.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:version).permit(:path, :str_ru, :str_en, :str_de, :str_fr, :str_tr, :version)
    end
end
