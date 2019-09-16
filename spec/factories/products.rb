FactoryBot.define do

  factory :product do
    id                    {nil}
    seller_id             {1}
    buyer_id              {nil}
    name                  {"itigo"}
    description           {"aaaaa"}
    category_id           {20}
    brand_id              {nil}
    state_id              {1}
    size_id               {1}
    paying_side_id        {1}
    prefecture_id         {1}
    delivery_day_id       {1}
    price                 {10000}
    listing_stop          {false}
    parent_id             {1}
    child_id              {2}
    delivery_method_id    {1}
  end

  factory :user do
    id                    {1}
  end

  factory :category do
    id                    {20}
  end

end
