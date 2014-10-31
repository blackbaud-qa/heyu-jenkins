require 'active_support'
require 'jenkins_api_client'
require 'yaml'

PROJECT_FILE_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..'))
yaml_file = File.join PROJECT_FILE_PATH, 'config.yml'
config = YAML.load_file(yaml_file)

@jenkins = JenkinsApi::Client.new(:server_ip => "jenkins-qa.blackbaudcloud.com", :server_port => 80, :username => config['username'], :password => config['password'])

failed = false
@jenkins.api_get_request('/view/Peer to Peer/view/Smoke Test')['jobs'].each do |job|
  if job['color'] != 'blue'
    failed = true
    break
  end
end

status = failed ? 'on' : 'off'
`/usr/local/bin/heyu #{status} a2`

