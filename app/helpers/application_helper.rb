module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to '#', class: "add_fields btn btn-primary", data: {id: id, fields: fields.gsub("\n", "")} do
      html = <<-HTML
      <i class="icon-plus-sign"></i> #{name}
      HTML

      html.html_safe
    end
  end

  def active_controller(name, action = nil)
    if action.nil?
      if controller_name == name
        "active"
      end
    else
      if controller_name == name && action_name == action
        "active"
      end
    end
  end

  def opened_tab(name)
    if controller_name == name
      "opened"
    else
      "collapsed"
    end
  end

  def in_open(name)
  if controller_name == name
    "in"
  end
  end

  def devise_error_messages_custom!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_shop",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-error alert-login">
      <h5>#{sentence}</h5>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end


  def remove_child_link(name, f)
    f.hidden_field(:_destroy) + link_to(name, "javascript:void(0)", :class => "remove_child btn btn-danger")
  end

  def add_child_link(name, association)
    link_to(name, "javascript:void(0);", :class => "add_child btn btn-primary", :"data-association" => association)
  end

  def add_child_button(name, association)
    link_to(name, "javascript:void(0);", :class => "add_child button btn btn-primary", :"data-association" => association)
  end

  def new_child_fields_template(form_builder, association, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize
    options[:locals] ||= {}
    options[:form_builder_local] ||= :f

    content_tag(:div, :id => "#{association}_fields_template", :style => "display: none") do
      form_builder.fields_for(association, options[:object], :child_index => "new_#{association}") do |f|
        raw( render(:partial => options[:partial], :locals => {options[:form_builder_local] => f }.merge(options[:locals])) )
      end
    end
  end

end
