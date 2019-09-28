class Card < ApplicationRecord
  belongs_to :user
  def self.set_card_brand_icon(card_brand)
    case card_brand
    when "Visa"
      card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/visa.svg?575670517"
    when "JCB"
      card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?575670517"
    when "MasterCard"
      card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?575670517"
    when "American Express"
      card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?575670517"
    when "Diners Club"
      card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?575670517"
    when "Discover"
      card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/discover.svg?575670517"
    when "SaisonCard"
      card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/saison-card.svg?575670517"
    end
    return card_src
  end
end
