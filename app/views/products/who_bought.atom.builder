atom_feed do |feed|
  feed.title "#{@product.title} এর ক্রেতাদের তালিকা"

  latest_order = @product.orders.sort_by(&:updated_at).last
  feed.updated( latest_order && latest_order.updated_at )

  @product.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "অর্ডারঃ  #{order.id}"
      entry.summary :type => 'xhtml' do |xhtml|
        xhtml.p "ঠিকানাঃ #{order.address}"

        xhtml.table do
          xhtml.tr do
            xhtml.th 'পণ্যের নাম'
            xhtml.th 'পরিমান'
            xhtml.th 'মোট মূল্য'
          end
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              xhtml.td number_to_currency item.total_price
            end
          end
          xhtml.tr do
            xhtml.th 'সর্বমোট', :colspan => 2
            xhtml.th number_to_currency \
              order.line_items.map(&:total_price).sum
          end
        end

      end
      entry.author do |author|
        entry.name order.name
      end
    end
  end
end
