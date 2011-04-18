module CssHelper

def call_status_css(csstate)
  # quoi faire
  if csstate.status == 0
    'open'
  elsif csstate.status == 1
    'warning'
  else
    'closed'
  end
end
end
