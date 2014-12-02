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

end
