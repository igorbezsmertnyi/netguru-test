class MovieDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def cover
    "https://pairguru-api.herokuapp.com/" + additional_data[:poster]
  end

  def rating
    additional_data[:rating]
  end

  def plot
    additional_data[:plot]
  end
end
