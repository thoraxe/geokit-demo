class ToiletsController < ApplicationController
  
  def find
    @toilets = Toilet.find(:all, :origin => params[:find][:address], :within => params[:find][:distance])

    # want to find lat/lng for the entered address to center the map
    location = Geokit::Geocoders::MultiGeocoder.geocode(params[:find][:address])

    #map stuff
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([location.lat,location.lng],12)

    @toilets.each do |toilet|
      @map.overlay_init(GMarker.new([toilet.lat,toilet.lng], :info_window => "#{toilet.rating} star(s)<br>#{toilet.distance} mi" ))
    end

  end

  def index
    @toilets = Toilet.all
  end
  
  def show
    @toilet = Toilet.find(params[:id])
  end
  
  def new
    @toilet = Toilet.new
  end
  
  def create
    @toilet = Toilet.new(params[:toilet])
    if @toilet.save
      flash[:notice] = "Successfully created toilet."
      redirect_to @toilet
    else
      render :action => 'new'
    end
  end
  
  def edit
    @toilet = Toilet.find(params[:id])
  end
  
  def update
    @toilet = Toilet.find(params[:id])
    if @toilet.update_attributes(params[:toilet])
      flash[:notice] = "Successfully updated toilet."
      redirect_to @toilet
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @toilet = Toilet.find(params[:id])
    @toilet.destroy
    flash[:notice] = "Successfully destroyed toilet."
    redirect_to toilets_url
  end
end
