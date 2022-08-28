Support.create!(
  [
    {
      support_name: "ひとり親家庭等医療費助成",
      content: "18歳（18歳に達した最初の3月31日まで）のお子さん、あるいは規則に定める障害の状態にある20歳未満のお子さんを養育しているひとり親家庭の方（所得制限未満の方に限る）が、医療機関等で診療を受けた時に、 保険診療の自己負担分の一部もしくは全部を品川区が助成します。（通院・入院）",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000001247.html"
    },
    {
      support_name: "認証保育所・認可外保育施設の保育料助成",
      content: "都内の認証保育所・認可外保育施設（認証保育所を除く、一定の要件を満たす施設が対象）を利用する方の負担を軽減するため、保育料の助成を実施しています。",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinjuku.lg.jp/kodomo/file03_04_00011.html"
    },
    {
      support_name: "児童扶養手当",
      content: "国の制度で、父または母と生計を同じくしていない児童が、養育される家庭の生活の安定と自立の促進に寄与し、児童の福祉の増進を図ることを目的としています。品川区内に住所があり、父母の離婚や死亡などにより母子家庭・父子家庭になった方や父母に重度の障害がある場合、または父母に養育されないなど以下の状態の児童（18歳に達した最初の3月31日までの児童、また中度以上の障害がある場合は20歳未満）を扶養している父・母または養育者に支給されます。",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000001248.html"
    },
    {
      support_name: "民間賃貸住宅家賃助成",
      content: "区内の民間賃貸住宅に住む世帯の家賃を助成することで負担を軽減し、定住化の促進を目的とした制度です。年に一度、期間を定めて子育てファミリー世帯向けの申し込みを受け付けます。",
      application_method: "",
      application_limit: "令和3年度の募集期間は、10月1日（金）から10月15日（金）",
      url: "https://www.city.shinjuku.lg.jp/seikatsu/file07_02_00001.html"
    },
    {
      support_name: "出産育児一時金",
      content: "新宿区の国民健康保険に加入している被保険者が出産したときに、出産育児一時金として42万円（出生児一人あたり）が支給されます。妊娠12週と1日（85日）以上の出産であれば、死産、流産の場合でも支給されます。",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinjuku.lg.jp/hoken/file02_04_00007.html"
    },
    {
      support_name: "児童育成手当",
      content: "児童の心身の健やかな成長に寄与し、児童福祉の増進を図ることを目的としています。児童育成手当を受けるためには申請が必要です。
      ",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000001249.html"
    },
    {
      support_name: "ひとり親家庭住宅入居支援事業",
      content: "住宅に困窮するひとり親家庭に対して民間賃貸住宅への入居を支援するため、連帯保証人が立てられない方を対象として、保証会社に支払う「初回保証委託料」を助成します。",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/20200116093231.html"
    },
    {
      support_name: "自立支援教育訓練給付金",
      content: "ひとり親家庭の経済的自立を促進するため、「就業に結びつきやすい技術や資格を得たい」「能力を高め増収を図りたい」というひとり親家庭のお母さんやお父さんに、次の給付金を支給します。",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000016382.html"
    },
    {
      support_name: "東京都母子及び父子福祉資金",
      content: "ひとり親家庭の方々が経済的に自立して、安定した生活を送れるよう、母子・父子自立支援員が相談に応じ、審査のうえ、必要な資金を貸し付けます。",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000030884.html"
    },
    {
      support_name: "令和4年度低所得の子育て世帯生活支援特別給付金（ひとり親世帯分）",
      content: "新型コロナウイルス感染症による影響が長期化する中で 、食費等の物価高騰等に直面する低所得の子育て世帯に対し 、その実情を踏まえた生活の支援を行う観点から支給を行うものです。",
      application_method: "",
      application_limit: "",
      url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/20220602092306.html"
    },
  ]
)

Income.create!(
  [
    {
      money: 200,
      is_myself: 0
    }
  ]
)

ConditionsSupport.create!(
  [
    {
      support_id: 1,
      city_id: 1,
      income_id: 1,
      age_id: 1,
      status_id: 1,
      benefit_id: 1,
    }
  ]
)
