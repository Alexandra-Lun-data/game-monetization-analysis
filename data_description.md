# Data Description

## `fantasy.users`
Contains user-level information.

Fields:
- `id` — player ID
- `race_id` — selected character race
- `payer` — flag showing whether the player bought premium currency for real money

## `fantasy.race`
Contains character race reference data.

Fields:
- `race_id` — race ID
- `race` — race name

## `fantasy.events`
Contains information about in-game item purchases.

Fields:
- `id` — player ID
- `item_code` — purchased item code
- `amount` — purchase amount in premium currency

## `fantasy.items`
Contains item reference data.

Fields:
- `item_code` — item code
- `game_items` — item name
