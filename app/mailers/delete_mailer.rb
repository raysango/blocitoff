class DeleteMailer < ActionMailer::Base
  default from: "remongeorge@live.com"
  def new_item(user,list,item)
    headers["Message-ID"] = "<items/#{item.id}@blocitoff.com>"
    headers["In-Reply-To"] = "<list/#{list.id}@blocitoff.com>"
    headers["References"] = "<list/#{list.id}@blocitoff.com>"
    
    @user = user
    @list = list
    @item = item
    
    mail(to: user.email, subject: "Your to-do item #{item.name} will be deleted in one day")
  end
end
