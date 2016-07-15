class Popsicle < ActiveRecord::Base
  has_one :stick
  belongs_to :company

  def self.get_all_summaries
    self.all.map do |popsicle|
       {
        serial_number: popsicle.serial_number,
        flavor: popsicle.flavor,
        joke_funniness: popsicle.stick.joke.funniness,
        stick_wood_type: popsicle.stick.wood_type,
        company_name: popsicle.company.name
       }
    end
  end

  def details
    { 
        serial_number: self.serial_number, 
        flavor: self.flavor, 
        color: self.color, 
        rating: self.rating, 
        shape: self.shape,
        stick: {
                wood_type: self.stick.wood_type,
                color: self.stick.color,
                centimeters: self.stick.centimeters,
                joke: {
                       question: self.stick.joke.question,
                       punchline: self.stick.joke.punchline,
                       funniness: self.stick.joke.funniness,
                       dirtiness: self.stick.joke.dirtiness,
                       author: self.stick.joke.author
                      }
               },
        company: {
                  name: self.company.name,
                  popsicle_varieties: self.company.popsicles.length
                 }
       }
  end
end