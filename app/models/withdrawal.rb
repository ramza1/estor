class Withdrawal < ActiveRecord::Base
  belongs_to :shop
  #attr_accessible :amount, :state

  state_machine :initial => 'pending' do
    event :activate do
      transition :to => 'paid', :from => ['pending']
    end
  end

end
