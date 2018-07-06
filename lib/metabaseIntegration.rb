require "metabaseIntegration/version"
require 'jwt'

module MetabaseIntegration
  def self.payload(dashboard_id)
    {
        :resource => {:dashboard => dashboard_id},
        # :params => params
    }
  end

  def self.dark_style
    "#theme=night&bordered=false&titled=false"
  end

  def self.light_style
    "#bordered=true&titled=false"
  end

  def self.iframe_url(token)
    secret_keys =  Rails.application.secrets
    @iframe_url = secret_keys.metabase_site_url + "/embed/dashboard/" + token + light_style
  end

  def self.jwt_endode_metabase(dashboard_id)
    secret_keys =  Rails.application.secrets
    # parameters = permitted_params.empty? ? {} : permitted_params
    return JWT.encode payload(dashboard_id), secret_keys.metabase_secret_key
  end
end
