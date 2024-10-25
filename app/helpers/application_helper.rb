module ApplicationHelper
    def show_navbar?
        !(controller_name == "home" && action_name == "index")
      end
end
