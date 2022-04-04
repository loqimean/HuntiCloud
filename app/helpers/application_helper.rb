module ApplicationHelper
  def active_link(path)
    'bg-blue-200 ml-[-20px] rounded-r-full text-blue-900 dark:bg-gray-700 dark:text-white pl-8' if current_page?(path)
  end
end
