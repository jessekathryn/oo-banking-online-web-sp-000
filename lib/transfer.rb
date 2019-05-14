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
    elsif !valid? 
      @receiver.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end
  
  def reverse_transfer
    @receiver.balance - amount
    amount
  end
end
 
 
