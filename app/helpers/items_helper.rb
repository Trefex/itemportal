module ItemsHelper
  def format_date(date, blank_message="")
    #time.blank? ? blank_message : time.to_s(format)
    date.nil? ? blank_message : date.to_formatted_s(:ddmmyyyy_trains)
  end
end

#  @item.selldate = @item.selldate.to_formatted_s(:ddmmyyyy_trains)
#  @item.dateval_date = @item.dateval_date.to_formatted_s(:ddmmyyyy_trains)
