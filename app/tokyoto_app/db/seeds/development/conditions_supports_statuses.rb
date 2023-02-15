ConditionsSupportStatus.create!(
  [
    # 児童手当・児童育成手当
    { id: 1, condition_id: 1, status_id: 1 }, # 扶養人数0人 第1子
    { id: 2, condition_id: 1, status_id: 5 },
    { id: 3, condition_id: 2, status_id: 2 }, # 扶養人数1人 第1子
    { id: 4, condition_id: 2, status_id: 5 },
    { id: 5, condition_id: 3, status_id: 3 }, # 扶養人数2人 第1子
    { id: 6, condition_id: 3, status_id: 5 },
    { id: 7, condition_id: 4, status_id: 3 }, # 扶養人数2人 第2子
    { id: 8, condition_id: 4, status_id: 6 },
    { id: 9, condition_id: 5, status_id: 4 }, # 扶養人数3人 第1子
    { id: 10, condition_id: 5, status_id: 5 },
    { id: 11, condition_id: 6, status_id: 4 }, # 扶養人数3人 第2子
    { id: 12, condition_id: 6, status_id: 6 },
    { id: 13, condition_id: 7, status_id: 4 }, # 扶養人数3人 第3子
    { id: 14, condition_id: 7, status_id: 7 },

    { id: 15, condition_id: 8, status_id:  },
    { id: 16, condition_id: 8, status_id:  },
    { id: 17, condition_id: , status_id:  },
    { id: 18, condition_id: , status_id:  },
    { id: 19, condition_id: , status_id:  },
    { id: 20, condition_id: , status_id:  },
    { id: 21, condition_id: , status_id:  },
  ]
)
