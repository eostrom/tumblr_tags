class TagCollection < Array
  def descend_by_count(&block)
    sort_by(&:count).reverse.each(&block)
  end
end
