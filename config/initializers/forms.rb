# NOTE: Override Rails field renderer to avoid wrapping inputs with a <div class="field_with_errors" />
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag
end
