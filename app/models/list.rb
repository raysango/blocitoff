class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  
   def send_delete_emails
     self.items.each do |item|
       @item = item
       if item.created_at <= (Time.now - 6.days)
         DeleteMailer.new_item(item.list.user, self, item).deliver
       end
     end
   end
end
