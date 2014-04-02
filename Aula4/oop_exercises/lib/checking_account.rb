require_relative 'bank_account'

class CheckingAccount < BankAccount

  def deposit(amount)
    @balance += amount
    log_transaction('Deposit', amount)
  end

  def withdraw(amount)
    if(@balance+CREDIT_LINE > amount)
      @balance -= amount
      log_transaction('Withdrawal', amount)
    end
  end

  def transfer(account, amount)
    if(@balance >= 8+amount)
      withdraw(8)
      withdraw(amount)
      account.deposit(amount)
    end
  end

end
