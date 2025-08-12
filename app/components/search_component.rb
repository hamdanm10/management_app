# frozen_string_literal: true

class SearchComponent < ViewComponent::Base
  include LucideRails::RailsHelper
  include Ransack::Helpers::FormHelper

  attr_reader :search_for, :url, :search_query, :kwargs

  def initialize(search_for:, url:, search_query:, **kwargs)
    @search_for = search_for
    @url = url
    @search_query = search_query
    @kwargs = kwargs
  end
end