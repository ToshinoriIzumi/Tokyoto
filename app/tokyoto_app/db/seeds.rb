begin
  ActiveRecord::Base.transaction do
    Support.create!(
      [
        {
          support_name: "ひとり親家庭等医療費助成",
          content: "18歳（18歳に達した最初の3月31日まで）のお子さん、あるいは規則に定める障害の状態にある20歳未満のお子さんを養育しているひとり親家庭の方（所得制限未満の方に限る）が、医療機関等で診療を受けた時に、 保険診療の自己負担分の一部もしくは全部を品川区が助成します。（通院・入院）",
          application_method: "申請を行う方により必要書類が異なるため、「子ども家庭部子ども家庭課育成支援係（区役所本庁舎2階16番窓口）」へ事前にご連絡をお願いします。交付申請をした日から助成の対象となります。公式HPを参照",
          application_limit: "",
          url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000001247.html"
        },
        {
          support_name: "認証保育所・認可外保育施設の保育料助成",
          content: "都内の認証保育所・認可外保育施設（認証保育所を除く、一定の要件を満たす施設が対象）を利用する方の負担を軽減するため、保育料の助成を実施しています。",
          application_method: "申請書を記入し、必要書類を添付して区に郵送していただくか、直接お持ちください。
          ",
          application_limit: "",
          url: "https://www.city.shinjuku.lg.jp/kodomo/file03_04_00011.html"
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
          application_method: "公式HP参照",
          application_limit: "",
          url: "https://www.city.shinjuku.lg.jp/hoken/file02_04_00007.html"
        },
        {
          support_name: "就学援助",
          content: "新宿区では、就学援助制度に基づき、経済的な理由から就学が困難と認められるご家庭に、学習に必要な費用の一部を援助しています。公立中学校夜間学級（夜間中学）に通学する生徒の方も、この制度を利用することができます。",
          application_method: "新宿区立小・中学校へお子さんが通学されている方は、学校に申請書がありますので、ご記入の上、必要書類（詳細は申請書に記載しています。）を添付して学校へご提出ください。",
          application_limit: "なし",
          url: "https://www.city.shinjuku.lg.jp/kodomo/file04_04_00005.html"
        },
        {
          support_name: "産後の家事育成助成",
          content: "産前産後に、育児や家事などの支援を必要とするご家庭に援助者（ヘルパー又は産後ドゥーラ）を派遣することによって、養育者の精神的・身体的負担を軽減し、産前産後の生活を支援をします。",
          application_method: "公式HP参照",
          application_limit: "なし",
          url: "https://www.city.shinjuku.lg.jp/kodomo/file03_02_00001.html"
        },
        {
          support_name: "私立幼稚園補助金",
          content: "新宿区内在住（住民登録をしていること）で、次の[1]又は[2]の園に通園する園児（満3歳児・3歳児・4歳児・5歳児）の保護者を対象に、国の幼児教育・保育の無償化制度に上乗せして入園料や保育料の補助金を交付します。",
          application_method: "郵送か窓口申請",
          application_limit: "",
          url: "https://www.city.shinjuku.lg.jp/kodomo/file04_07_00003.html"
        },
        {
          support_name: "児童扶養手当",
          content: "国の制度で、父または母と生計を同じくしていない児童が、養育される家庭の生活の安定と自立の促進に寄与し、児童の福祉の増進を図ることを目的としています。品川区内に住所があり、父母の離婚や死亡などにより母子家庭・父子家庭になった方や父母に重度の障害がある場合、または父母に養育されないなど以下の状態の児童（18歳に達した最初の3月31日までの児童、また中度以上の障害がある場合は20歳未満）を扶養している父・母または養育者に支給されます。",
          application_method: "",
          application_limit: "",
          url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000001248.html"
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
          support_name: "自立支援教育訓練給付金",
          content: "ひとり親家庭の経済的自立を促進するため、「就業に結びつきやすい技術や資格を得たい」「能力を高め増収を図りたい」というひとり親家庭のお母さんやお父さんに、次の給付金を支給します。",
          application_method: "",
          application_limit: "",
          url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/hpg000016382.html"
        },
        {
          support_name: "ひとり親家庭住宅入居支援事業",
          content: "住宅に困窮するひとり親家庭に対して民間賃貸住宅への入居を支援するため、連帯保証人が立てられない方を対象として、保証会社に支払う「初回保証委託料」を助成します。",
          application_method: "",
          application_limit: "",
          url: "https://www.city.shinagawa.tokyo.jp/PC/kodomo/kodomo-hitorioya/20200116093231.html"
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
          money: 1920000,
          is_myself: 0
        },
        {
          money: 2300000,
          is_myself: 0
        },
        {
          money: 2680000,
          is_myself: 0
        },
        {
          money: 2360000,
          is_myself: 1
        },
        {
          money: 2740000,
          is_myself: 1
        },
        {
          money: 3120000,
          is_myself: 1
        },
        {
          money: 5200000,
          is_myself: 2
        }
      ]
    )

    City.create!(
      [
        {id:1, city_name: '品川区'},
        {id:2, city_name: '新宿区'},
        {id:3, city_name: '中央区'},
        {id:4, city_name: '港区'},
        {id:5, city_name: '千代田区'},
        {id:6, city_name: '文京区'},
        {id:7, city_name: '台東区'},
        {id:8, city_name: '墨田区'},
        {id:9, city_name: '江東区'},
        {id:10, city_name: '目黒区'},
        {id:11, city_name: '太田区'},
        {id:12, city_name: '世田谷区'},
        {id:13, city_name: '渋谷区'},
        {id:14, city_name: '中野区'},
        {id:15, city_name: '杉並区'},
        {id:16, city_name: '豊島区'},
        {id:17, city_name: '北区'},
        {id:18, city_name: '荒川区'},
        {id:19, city_name: '板橋区'},
        {id:20, city_name: '練馬区'},
        {id:21, city_name: '足立区'},
        {id:22, city_name: '葛飾区'},
        {id:23, city_name: '江戸川区'},
      ]
    )

    # ConditionsSupport.create!(
    #   [
    #     {
    #       support_id: 1,
    #       city_id: 1,
    #       dependents_num: 0,
    #       income_id: 1,
    #       age_id: 1,
    #       status_id: 4,
    #       benefit_id: 1,
    #     }
    #   ]
    # )

    Hospital.create!(
      [
        {
          id: 1,
          name: '総合東京病院病児保育室',
          latitude: 35.727936,
          longitude: 139.66392,
          address: '東京都中野区江古田3-15-2',
          city_id: 14
        },
        {
          id: 2,
          name: '仲町保育園病後児保育室',
          latitude: 35.699898,
          longitude: 139.671558,
          address: '東京都中野区中央3-41-12',
          city_id: 14
        },
        {
          id: 3,
          name: '聖オディリアホーム乳児院',
          latitude: 35.732182,
          longitude: 139.627424,
          address: '東京都中野区上鷺宮5-28-28',
          city_id: 14
        },
      ]
    )
  end
rescue => e
  puts e.message
  ActiveRecord::Rollback
end
