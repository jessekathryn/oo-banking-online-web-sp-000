class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if self.status == "pending" && valid? && sender.balance >= amount
     @sender.balance -= amount
     @receiver.balance += amount
     self.status = "complete"
    else
     "Transaction rejected. Please check your account balance."
   end
  end
  
  def reverse_transfer
     @receiver.balance -= amount
     @sender.balance += amount
     amount
  end
end
 
 
