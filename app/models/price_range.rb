class PriceRange < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '〜¥5,000' },
    { id: 3, name: '¥5,000〜¥10,000' },
    { id: 4, name: '¥10,000〜¥20,000' },
    { id: 5, name: '¥20,000〜¥30,000' },
    { id: 6, name: '¥30,000〜¥50,000' },
    { id: 7, name: '¥50,000〜¥100,000' },
    { id: 8, name: '¥100,000〜¥300,000' },
    { id: 7, name: '¥300,000〜' }
  ]
  
  end