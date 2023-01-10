require 'http'

stash_url = ENV['stash_url']
stash_username = ENV['stash_username']
stash_password = ENV['stash_password']

git_hash = ENV['git_hash']
project_slug = ENV['project_slug']
repo_slug = ENV['repo_slug']

if (stash_url.nil? || stash_username.nil? || stash_password.nil? || git_hash.nil? || project_slug.nil? || repo_slug.nil?) 
  abort("please provide the needed parameters (git_hash, project_slug and repo_slug)")
  fail
end

class Request
  def initialize(base_url, user_name, password) 
    @base_url = base_url
    @user_name = user_name
    @password = password
  end

  def get_authenticated_base_url() 
    "https://#{@user_name}:#{@password}@#{@base_url}"
  end

  def invoke(request) 
    p "making request '#{request}'"
    response = HTTP.get("#{self.get_authenticated_base_url()}/#{request}", :params => {})
    p response
    response
  end
end

request = Request.new(stash_url, stash_username, stash_password)
request.invoke("MOO")
request.invoke("MOO")
request.invoke("MOO")