class SitesController < WebController

  before_filter :find_sites

  def index
    @site = Site.new
  end

  def create
    @site = current_user.sites.new(site_params)
    if @site.save
      redirect_to sites_path
    else
      render :index
    end
  end

  private

  def site_params
    params.require(:site).permit(:url)
  end

  def find_sites
    @sites = current_user.sites
  end

end