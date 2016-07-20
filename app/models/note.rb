class Note < ActiveRecord::Base
  def popsicle
    Popsicle.where('popsicles.serial_number = ?', self.popsicle_serial_number).first
  end
end
