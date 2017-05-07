class RankingsController < ApplicationController

  # ranking/have	持っているものの多い順のアイテムを上位10個表示
  # itemのhaveリストを全件取得
  # 上位10件のみ @items = response.first(10)

  # Have
  #   user_1
  #   item_1
  #
  #   user_2
  #   item_1

  def have
    # @haves = {1=>3, 15=>3, 3=>2, 17=>2, 25=>2, 2=>1, 4=>1, 5=>1, 7=>1, 9=>1}
    @haves = Have.group(:item_id).order('count_item_id DESC').limit(10).count(:item_id)

    # ヒント
    # 1. @haves.keys を使うと key の一覧が取得できます
    # 2. .sort_by を使うと，並び替えができます
    @items = @haves.keys.sort_by { |_, b| b }.reverse
  end

  def want
    @wants = Want.group(:item_id).order('count_item_id DESC').limit(10).count(:item_id)
    @items = @wants.keys.sort_by { |_, b| b }.reverse
  end

end