
# 📱 Tarot App – "Explore All Cards" Block – Technical Specification

## 🎯 Purpose
Provide a teaser of the full tarot card list on the Home Screen and visually indicate locked content (paywalled), encouraging user engagement and subscription.

---

## 🧱 Layout: Home Screen Block

- **Title:** `"Explore All Cards"` or `"All Tarot Cards"`
- **Structure:** Grid layout with 2 rows and 3 cards per row (total: 6 cards previewed)

### Card Display:
- **Top 2 Cards:**
  - Fully visible (e.g., The Fool, The Magician)
  - Tappable to open Card Detail Screen
- **Remaining 4 Cards:**
  - Displayed with dimmed/blurred images
  - Overlayed with a lock icon (indicates paywall)
  - Tapping triggers Paywall Modal or Subscription Prompt

---

## 🔒 Paywall Interaction

- Locked cards cannot be accessed unless the user has a premium subscription
- Tapping locked cards results in:
  - A modal or full-screen paywall
  - Optional text: *"Unlock all cards with Premium"*

---

## 🔗 Navigation Behavior

- **Entire block is optionally tappable**, and should contain:
  - A `"View all cards →"` text button in the top-right
  - OR a simple right-arrow icon next to the title

- **Tapping this block or button** takes the user to the **Full Card List Screen**, organized by:
  - Major Arcana
  - Minor Arcana (Cups, Swords, Wands, Pentacles)

---

## 🗂️ Full Card List Screen Rules

- Cards grouped by Arcana
- **Only first 2 cards of each group are unlocked**
- All other cards:
  - Blurred/dimmed
  - Have lock icon
  - Trigger paywall screen if tapped

---

## 💡 UX/Visual Suggestions

- Use animation or fade for locked state
- Make lock icon subtle but clear
- Optional tooltip on locked cards: *"Upgrade to access"*
