Income.create!(
  [
    #所得が関係ない場合
    { id: 1, min: 0, max: 1000000000, is_myself: 0 },
    #生活保護以上で270万円未満の場合
    { id: 2, min: 0, max: 2700000, is_myself: 1 },
    { id: 3, min: 2700000, max: 3600000, is_myself: 1 },
    { id: 4, min: 3600000, max: 6800000, is_myself: 1 },
    { id: 5, min: 6800000, max: 7300000, is_myself: 1 },
    { id: 6, min: 7300000, max: 1000000000, is_myself: 1 },
    { id: 7, min: 0, max: 570000, is_myself: 0 },
    { id: 8, min: 0, max: 2440000, is_myself: 1 },
    { id: 9, min: 0, max: 950000, is_myself: 0 },
    { id: 10, min: 0, max: 2820000, is_myself: 1 },
    { id: 11, min: 0, max: 1330000, is_myself: 0 },
    { id: 12, min: 0, max: 3200000, is_myself: 1 },
    { id: 13, min: 0, max: 1710000, is_myself: 0 },
    { id: 14, min: 0, max: 3580000, is_myself: 1 },
    { id: 15, min: 0, max: 2000000, is_myself: 0 },
    { id: 16, min: 0, max: 2380000, is_myself: 0 },
    { id: 17, min: 0, max: 2760000, is_myself: 0 },
    { id: 18, min: 0, max: 3140000, is_myself: 0 },
    { id: 19, min: 0, max: 3684000, is_myself: 0 },
    { id: 20, min: 0, max: 4064000, is_myself: 0 },
    { id: 21, min: 0, max: 4444000, is_myself: 0 },
    { id: 22, min: 0, max: 4824000, is_myself: 0 },
  ]
)
