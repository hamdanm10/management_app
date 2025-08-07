module PaginationHelper
  def custom_pagy_nav(pagy)
    p_prev = pagy.prev
    p_next = pagy.next

    content_tag :div, class: 'flex gap-2 text-xs lg:text-sm' do
      create_nav_btn(pagy, p_prev, 'rounded-lg') +
      create_num_btn(pagy) +
      create_nav_btn(pagy, p_next, 'rounded-lg', false)
    end
  end

  private

  def create_nav_btn(pagy, page, button_class, previous = true)
    link = 'javascript:void(0);'
    addition = ''

    if page.present?
      link = pagy_url_for(pagy, page)
      addition = 'bg-white cursor-pointer'
    end

    link_to link,
            class: "#{button_class} #{addition} cursor-default bg-gray-100 text-center font-medium inline-flex items-center justify-center border border-light-300 focus-within:ring-gray-300 px-3 lg:px-5 py-2.5 text-xs lg:text-sm focus-within:ring-4 focus-within:outline-hidden rounded-lg text-gray-700 hover:bg-gray-100" do
      if previous
        content_tag(:span, 'Prev')
      else
        content_tag(:span, 'Next')
      end
    end
  end

  def create_num_btn(pagy)
    content_tag(:ul, class: 'flex gap-2') do
      pagy.series.map do |item|
        label = item
        if label.is_a?(String)
          class_a = 'text-center font-medium inline-flex items-center justify-center focus-within:ring-blue-300 px-3 lg:px-5 py-2.5 text-xs lg:text-sm focus-within:ring-4 focus-within:outline-hidden rounded-lg bg-blue-50 text-blue-600'
          url = 'javascript:void(0);'
        elsif label.eql? :gap
          label = '...'
          class_a = ''
          url = 'javascript:void(0);'
        else
          class_a = 'text-center font-medium inline-flex items-center justify-center focus-within:ring-blue-300 px-3 lg:px-5 py-2.5 text-xs lg:text-sm focus-within:ring-4 focus-within:outline-hidden rounded-lg bg-white text-gray-700 hover:bg-blue-50 hover:text-blue-600'
          url = pagy_url_for(pagy, item)
        end

        content_tag(:li) do
          link_to label, url, class: class_a
        end
      end.join.html_safe
    end
  end
end