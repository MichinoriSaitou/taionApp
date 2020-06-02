module ApplicationHelper

        def header_link_item(name, path)
            class_name = 'nav-item'
            class_name  <<  'active' if current_page?(path)
    
            content_tag :li, class: class_name do
                link_to name, path, class: 'nav-link'
            end
        end
    
        def logged_in?
            session[:user_id].present?
        end
    
        def flash_message(message, klass)
            content_tag(:div, class: "alert alert-#{klass}") do
              concat content_tag(:button, 'x', class: 'close', data: {dismiss: 'alert'})
              concat raw(message)
            end
        end
    
end
