class Admin::MailingListsController < Admin::BaseController

  def index
    @mailing_lists = MailingList.all
  end

end
