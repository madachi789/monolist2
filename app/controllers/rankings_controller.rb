class RankingsController < ApplicationController

  def have
    item_ids = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
    @items = Item.find(item_ids).sort_by{|item| item_ids.index(item.id)}
  end

  def want
    item_ids = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id').keys
    @items = Item.find(item_ids).sort_by{|item| item_ids.index('item.id')}
  end

end