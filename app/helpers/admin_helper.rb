module AdminHelper

def display_last_login(user)
  str = user.confirmation_sent_at if user.confirmation_sent_at
  str = user.last_sign_in_at if user.last_sign_in_at
  str = user.current_sign_in_at if user.current_sign_in_at
  return (l str, :format => "%Y-%m-%d") if str
  ''
end

def display_last_ip(user)
  str = user.last_sign_in_ip if user.last_sign_in_ip
  str = user.current_sign_in_ip if user.current_sign_in_ip
  (str) ? str : ''
end

def display_provider(user)
  (user.provider.blank?) ? '' : user.provider.downcase.humanize
end

end
