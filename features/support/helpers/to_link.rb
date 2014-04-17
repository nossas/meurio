def to_link string
  case string
  when "the load more users button"
    "load_more_users_button"
  when "the load more funders button"
    "load_more_funders_button"
  when "the users button"
    "users_button"
  when "the team button"
    "team_button"
  when "the funders button"
    "funders_button"
  when "the edit mobilization button"
    "edit_mobilization_button"
  when "the load more mobilizations button"
    "load_more_mobilizations_button"
  else
    nil
  end
end
