class ToiletsController < ApplicationController
  
  def find
    @toilets = Toilet.find(:all, :origin => params[:find][:address], :within => params[:find][:distance])
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
