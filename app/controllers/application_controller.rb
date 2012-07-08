class ApplicationController < ActionController::Base
  protect_from_forgery except: [:mobileupload, :mobiledownload]
  include SessionsHelper
end
 