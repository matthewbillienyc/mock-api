# have a method to return accounts for all users
class DataHelper

  def self.get_account_info_by_user(id)
    @acc_info = { employer: 'something', account_number: '12345', organization: { name: 'CIA', state: 'VA' } }
    @acc_info
  end

end
