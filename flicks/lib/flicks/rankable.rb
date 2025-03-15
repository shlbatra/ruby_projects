module Rankable # Only deal with rankable things

  def thumbs_up
    self.rank += 1 # self instance of class
  end

  def thumbs_down
    self.rank -= 1
  end

end