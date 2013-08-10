module ApplicationHelper

  def active_tab tab
    return "active" if params[:controller] == tab
    return ""
  end

  def spinner_tag id
    #Assuming spinner image is called "spinner.gif"
    image_tag("spinner.gif", :id => id, :alt => t(:loading, :scope => 'myinfo.buttons'), :style => "display:none")
  end  
  
  def avatar_url(user)
    if user.image_url.present?
      user.image_url
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?r=g&s=25&d=mm"
    end
  end

  # --- fetch strings from en.header_text.yml
  
  def get_header_text (params)
    page_name, element, add_in, no_scope, no_msg = params.values_at(:page_name, :element, :add_in, :no_scope, :no_msg)
    return fix_me_statement("element") if element.blank?
   
    scope = (no_scope || page_name.blank?) ? '' : "header_text"
    key = "#{page_name}.#{element}"
    msg = (no_msg) ? '' : fix_me_statement(key)
    default_key = "#{(scope.blank?) ? 'header_text.' : ''}default.#{element}"

    t(key, scope: scope, branding: branding_text, add_in: "#{add_in}", default: [:"#{default_key}", msg])
  end

   def get_view_text(element)
    return fix_me_statement("element") if element.blank?
    t(".#{element}", default: fix_me_statement(".#{element}"))
  end

  def branding_text
    t('branding', scope: :"header_text", default: '')
  end

  def fix_me_statement(thing = "")
    t('fix_me', scope: :"header_text", thing: thing)
  end
  # --- end en.header_text.yml
  
  
  # --- set meta tags

  def seo_tag(element, page_name, add_options={})
    content_for (:"#{element}") {get_header_text({element: element, page_name: page_name}.merge(add_options))}
  end
  
  def yield_or_default(section, default="")
    tag_text = content_for(section)
    # if content_for() not set, check locale file for controller/action default
    if tag_text.blank?
      tag_text = get_header_text(element: section, page_name: "#{controller_name}.#{action_name}", no_scope: true, no_msg: true)
      tag_text = default if tag_text.blank? # use optional default as last resort
    end
    tag_text
  end
  # --- end set meta tags

end
