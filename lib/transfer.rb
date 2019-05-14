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
    if valid? && @balance
      @receiver.each {|m| m + amount}
      @sender - amount
    else
      "Transaction rejected. Please check your account balance."
      @receiver.status = "rejected"
    end 
  end
end
 
 
