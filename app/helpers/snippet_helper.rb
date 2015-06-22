module SnippetHelper

  def cms_snippet_content(key)
    { :locale => ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
    out = translate(key)
    return (out.to_str.include? 'class="translation_missing"') ? "" : out   # (link_to "Define #{key}", new_translation_path(:key => key, :locale => I18n.locale)).html_safe
  end

end