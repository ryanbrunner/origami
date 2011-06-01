# Rubygems 1.5.0 changes the yaml parsing default from syck to psych and psych doesn't like the ":<<" in yaml files.
require 'yaml'
YAML::ENGINE.yamler= 'syck'

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Origami::Application.initialize!
