class WebController < ApplicationController

  before_filter :authenticate_user!

end
