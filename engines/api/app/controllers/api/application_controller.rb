class Api::ApplicationController < ActionController::Base
  self.responder = Api::Responders::AppResponder
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |error|
    render :json => { :message => error.message }, :status => 404
  end

  rescue_from "ActiveRecord::RecordInvalid" do |error|
    render :json => { :errors => error.record.errors }, :status => 404
  end
end
