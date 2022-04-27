class Evaluation < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '星1' },
    { id: 3, name: '星2' },
    { id: 4, name: '星3' },
    { id: 5, name: '星4' },
    { id: 6, name: '星5' }
  ]

  include ActiveHash::Associations
  has_many :reviews

end