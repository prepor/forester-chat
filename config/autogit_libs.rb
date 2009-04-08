require File.join RAILS_ROOT, 'lib/autogit.rb'
AutoGit.base_path = "/var/autogit"

AutogitSources = %w{
    git://github.com/
  }
AutogitLibs = {
  "maccman/juggernaut_gem"                         => "21394a47a5d3821e37bc0bfdc72c1cac2c78a2cb"

}
 
AutogitPlugins = {
  "maccman/juggernaut_plugin"                  => "5748b9c1aed6d856f4fd56acf206b178073c2b64"
}
 
 
AutogitPaths = {}
 
AutogitLibs.each do |path, commit|
  AutogitPaths[path] = autogit(AutogitSources.map{|s| s + path }, commit)
end