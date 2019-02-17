module Wallaby
  module Resources
    module Index
      class TsrangeHtml < Cell
        def render(object:, field_name:, value:, metadata:)
          if value.nil?
            null
          else
            concat content_tag(:span, I18n.l(value.first, format: :short), class: 'from')
            concat '...'
            concat content_tag(:span, I18n.l(value.last, format: :short), class: 'to')
            itooltip "#{I18n.l value.first} ... #{I18n.l value.last}", 'clock-o'
          end
        end
      end
    end
  end
end
