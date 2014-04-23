class FbOauthController < ApplicationController
  def start
   redirect_to client.authorization.authorize_url(:redirect_uri => "http://#{request.env['HTTP_HOST']}/fb_oauth/callback/" ,
      :client_id => '714335148588435', :scope => 'email')
  end

  def callback
    @access_token = client.authorization.process_callback(params[:code], :redirect_uri => "http://#{request.env['HTTP_HOST']}/fb_oauth/callback/")
    session[:access_token] = @access_token
    @fb_user = client.selection.me.info!
    user = User.find_or_create_by(email: @fb_user.email)
    user.update_attributes(email: @fb_user.email, fb_access_token: @access_token, fb_pic: client.selection.me.picture)
    user.save(:validate => false)
    sign_in(:user, user)
    @current_user = user
    redirect_to root_path
  end

  def invite_friends    
  end

  def convert_account
    current_user.register_user
    sign_out current_user
    flash[:notice] = "Your password is sent to your email Please Login using that"
    redirect_to root_path
  end

  def gmail_contacts
    @contacts = request.env['omnicontacts.contacts']
    @user = request.env['omnicontacts.user']
  end

  protected
  def client
    @client ||= FBGraph::Client.new(:client_id => '714335148588435',
      :secret_id => "db400315b81ab02e45f4339dec34a21b",
      :token => session[:access_token])
  end
end