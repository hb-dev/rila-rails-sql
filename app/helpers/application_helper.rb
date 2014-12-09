module ApplicationHelper

  def page_header(title)
    @title = strip_tags title
    "<div class='row'>
      <div class='col-lg-12'>
        <div class='page-header'>
          <h1>#{title.to_s}</h1>
        </ div>
      </div>
    </ div>".html_safe
  end

  def certificates_html(enrollment)
    html = "<div class='textfield'>" +
    "<h1>#{enrollment.run.name.gsub('(', '<br />(')}</h1>" +
    "<h2>#{enrollment.runner_display_name}</h2>" +
    "<h3>#{enrollment.runner_organisation}</h3>" + 
    "<p class='time'>#{enrollment.finishtime.blank? ? "" : (l enrollment.finishtime, format: :time)}</p>" +
    "<p class='mainplace'>#{enrollment.place}. Platz <span class='title'>in der Gesamtwertung</span></p>" +
    "<p class='secplace'>#{enrollment.place_age_group}. Platz <span class='title'>in der AK #{enrollment.age_group}<span/></p>" +
    "</div>"
    Base64.encode64(html)
  end

  def certificates_html_relay(relay)
    html = "<div class='textfield relay'>" +    
    "<h1>#{relay.run.name}</h1>" +
    "<h2>#{relay.name}</h2>" +
    "<p>#{relay.runners_string}</p>" + # $urkundenhtml .= '<p>' . str_replace(',','<br>',$daten[5]) . '</p>';
    "<p class='time'>#{ l relay.finishtime, format: :time}</p>" +
    "<p class='mainplace'>#{relay.place}. Platz <span class='title'>in der Gesamtwertung</span></p>" +
    "<p class='secplace'>#{relay.place_age_group}. Platz <span class='title'>in der AK #{relay.age_group}<span/></p>" +
    "</div>"
    Base64.encode64(html)
  end  

  def certificate_link(enrollment)
    certificates_url + "/" + certificates_html(enrollment) + "?year=" + enrollment.run.event.event_date.year.to_s
  end

  def certificate_link_relay(relay)
    certificates_url + "/" + certificates_html_relay(relay) + "?year=" + relay.run.event.event_date.year.to_s
  end

end
