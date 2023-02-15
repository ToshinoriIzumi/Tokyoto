# 対象者の条件はenumで管理？string？
Status.create!(
  [
    { id: 1, status: '扶養人数0人' },
    { id: 2, status: '扶養人数1人' },
    { id: 3, status: '扶養人数2人' },
    { id: 4, status: '扶養人数3人' },
    { id: 5, status: '第1子' },
    { id: 6, status: '第2子' },
    { id: 7, status: '第3子' },
    { id: 8, status: '住民税課税世帯' },
    { id: 9, status: '住民税非課税世帯' },
    { id: 10, status: '生活保護を受けていない' },
    { id: 11, status: '健康保険加入している' },
    { id: 12, status: '児童が児童福祉施設等に措置入所していない' },
    { id: 13, status: '外来(個人)' },
    { id: 14, status: '入院(個人)' },
    { id: 15, status: '世帯' },
    { id: 16, status: '身体に中度以上の障害がある児童' },
  ]
)
