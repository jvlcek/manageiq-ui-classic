class MiddlewareDomainController < ApplicationController
  include EmsCommon
  include MiddlewareCommonMixin

  before_action :check_privileges
  before_action :get_session_data
  after_action :cleanup_action
  after_action :set_session_data

  def show
    return unless init_show
    case params[:display]
    when 'middleware_server_groups' then show_middleware_entities(MiddlewareServerGroup)
    else show_middleware
    end
  end

  menu_section :cnt
end
