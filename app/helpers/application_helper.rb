# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def flash_mes
    if flash[:error]
  		{:class => 'error', :mes => flash[:error]}
		elsif flash[:notice]
  		{:class => 'notice', :mes => flash[:notice]}
  	elsif flash[:success]
    	{:class => 'success', :mes => flash[:success]}
		else
      nil
    end
  end
  
  def show_message(message)
    str = ''
    if message.crew && message.player
      str << "#{message.crew.title}[#{message.player.name}]: "
    elsif message.player && message.player.staff
      str << "Штаб[#{message.player.name}]: "
    end 
      
    str << "#{message.text}<br/>"    
    str = content_tag('strong', str) if message.vis == 'update'
    str = content_tag('strong', str, {:style => 'color: red'}) if message.vis == 'alert'
    str
  end
  def show_version(version)
    str = "#{version.title}"    
    str = content_tag 'strike', str if version.status == 'checked'
    str << " <script type=\"text/javascript\">
    	new Tip('version-str-#{version.id}', '#{version.desc}');
    	</script>" if version.desc
    "<span id='version-#{version.id}'><span id='version-str-#{version.id}'>#{str}</span>
    #{link_to_remote 'Удалить', :method => :delete, :url => version_path(version)} 
    #{link_to_remote 'Проверена', :method => :put, :url => check_version_path(version) if version.status != 'checked'}
    #{link_to_remote 'Поехать', :method => :put, :url => go_version_path(version) if version.status != 'checked' }<br/></span> "
  end
  
  def show_crew(crew)
    str = "<span id='crew-#{crew.id}'>#{crew.title}[#{crew.players.active.count}]: #{crew.location}<br/>
  	<script type=\"text/javascript\">
  	new Tip('crew-#{crew.id}', '#{crew.players.active.map{|v| v.name}.join(', ')}');
  	</script></span>"
  end
end
