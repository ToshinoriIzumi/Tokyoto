Income.create!(
  [
    { id: 1, min: 0, max: 1000000000, is_myself: 0 },
    #生活保護以上で270万円未満の場合
    { id: 2, min: 0, max: 2700000, is_myself: 1 },
    { id: 3, min: 2700000, max: 3600000, is_myself: 1 },
    { id: 4, min: 3600000, max: 6800000, is_myself: 1 },
    { id: 5, min: 6800000, max: 7300000, is_myself: 1 },
    { id: 6, min: 7300000, max: 1000000000, is_myself: 1 },
  ]
)
