class Category < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'イヤホン' },
    { id: 3, name: 'ヘッドホン' },
    { id: 4, name: 'スピーカー' },
    { id: 5, name: 'プレイヤー' },
    { id: 6, name: 'アクセサリ' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :reviews

end