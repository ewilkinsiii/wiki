module ArticlesHelper
   def find_version_author_name(version)
    user = User.find_version_author(version) 
    user ? user.name : ''
  end
  
  def diff(content1, content2)
   changes = Diffy::Diff.new(content1, content2, 
                             include_plus_and_minus_in_html: true, 
                             include_diff_info: true)
   changes.to_s.present? ? changes.to_s(:html).html_safe : 'No Changes'
  end

  def article_status_color article
    'color: red;' if article.draft?
  end
end
