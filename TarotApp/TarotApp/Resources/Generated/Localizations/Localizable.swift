import Foundation

extension String {
    /// A type that represents localized strings from the ‘Localizable‘
    /// strings table.
    ///
    /// Do not initialize instances of this type yourself, instead use one of the static
    /// methods or properties that have been generated automatically.
    ///
    /// ## Usage
    ///
    /// ### Foundation
    ///
    /// In Foundation, you can resolve the localized string using the system language
    /// with the `String`.``Swift/String/init(localizable:locale:)``
    /// initializer:
    ///
    /// ```swift
    /// // Accessing the localized value directly
    /// let value = String(localizable: ._2_of_cups)
    /// value // "2 Of Cups"
    /// ```
    ///
    /// Starting in iOS 16/macOS 13/tvOS 16/watchOS 9, `LocalizedStringResource` can also
    /// be used:
    ///
    /// ```swift
    /// var resource = LocalizedStringResource(localizable: ._2_of_cups)
    /// resource.locale = Locale(identifier: "fr") // customise language
    /// let value = String(localized: resource)    // defer lookup
    /// ```
    ///
    /// ### SwiftUI
    ///
    /// In SwiftUI, it is recommended to use `Text`.``SwiftUI/Text/init(localizable:)``
    /// or `LocalizedStringKey`.``SwiftUI/LocalizedStringKey/localizable(_:)``
    /// in order for localized values to be resolved within the SwiftUI environment:
    ///
    /// ```swift
    /// var body: some View {
    ///     List {
    ///         Text(localizable: .listContent)
    ///     }
    ///     .navigationTitle(.localizable(.navigationTitle))
    ///     .environment(\.locale, Locale(identifier: "fr"))
    /// }
    /// ```
    ///
    /// - SeeAlso: [XCStrings Tool Documentation - Using the generated source code](https://swiftpackageindex.com/liamnichols/xcstrings-tool/1.2.0/documentation/documentation/using-the-generated-source-code)
    internal struct Localizable: Hashable, Sendable {
        #if !SWIFT_PACKAGE
        private class BundleLocator {
        }
        #endif

        enum Argument: Hashable, Sendable {
            case int(Int)
            case uint(UInt)
            case float(Float)
            case double(Double)
            case object(String)

            var value: any CVarArg {
                switch self {
                case .int(let value):
                    value
                case .uint(let value):
                    value
                case .float(let value):
                    value
                case .double(let value):
                    value
                case .object(let value):
                    value
                }
            }
        }

        let key: StaticString
        let arguments: [Argument]
        let table: String?

        fileprivate init(
            key: StaticString,
            arguments: [Argument],
            table: String?
        ) {
            self.key = key
            self.arguments = arguments
            self.table = table
        }

        /// ### Source Localization
        ///
        /// ```
        /// 2 Of Cups
        /// ```
        internal static var _2_of_cups: Localizable {
            Localizable(
                key: "2_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 2 Of Pentacles
        /// ```
        internal static var _2_of_pentacles: Localizable {
            Localizable(
                key: "2_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 2 Of Swords
        /// ```
        internal static var _2_of_swords: Localizable {
            Localizable(
                key: "2_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 2 Of Wands
        /// ```
        internal static var _2_of_wands: Localizable {
            Localizable(
                key: "2_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 3 Of Cups
        /// ```
        internal static var _3_of_cups: Localizable {
            Localizable(
                key: "3_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 3 Of Pentacles
        /// ```
        internal static var _3_of_pentacles: Localizable {
            Localizable(
                key: "3_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 3 Of Swords
        /// ```
        internal static var _3_of_swords: Localizable {
            Localizable(
                key: "3_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 3 Of Wands
        /// ```
        internal static var _3_of_wands: Localizable {
            Localizable(
                key: "3_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 4 Of Cups
        /// ```
        internal static var _4_of_cups: Localizable {
            Localizable(
                key: "4_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 4 Of Pentacles
        /// ```
        internal static var _4_of_pentacles: Localizable {
            Localizable(
                key: "4_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 4 Of Swords
        /// ```
        internal static var _4_of_swords: Localizable {
            Localizable(
                key: "4_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 4 Of Wands
        /// ```
        internal static var _4_of_wands: Localizable {
            Localizable(
                key: "4_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 5 Of Cups
        /// ```
        internal static var _5_of_cups: Localizable {
            Localizable(
                key: "5_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 5 Of Pentacles
        /// ```
        internal static var _5_of_pentacles: Localizable {
            Localizable(
                key: "5_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 5 Of Swords
        /// ```
        internal static var _5_of_swords: Localizable {
            Localizable(
                key: "5_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 5 Of Wands
        /// ```
        internal static var _5_of_wands: Localizable {
            Localizable(
                key: "5_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 6 Of Cups
        /// ```
        internal static var _6_of_cups: Localizable {
            Localizable(
                key: "6_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 6 Of Pentacles
        /// ```
        internal static var _6_of_pentacles: Localizable {
            Localizable(
                key: "6_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 6 Of Swords
        /// ```
        internal static var _6_of_swords: Localizable {
            Localizable(
                key: "6_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 6 Of Wands
        /// ```
        internal static var _6_of_wands: Localizable {
            Localizable(
                key: "6_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 7 Of Cups
        /// ```
        internal static var _7_of_cups: Localizable {
            Localizable(
                key: "7_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 7 Of Pentacles
        /// ```
        internal static var _7_of_pentacles: Localizable {
            Localizable(
                key: "7_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 7 Of Swords
        /// ```
        internal static var _7_of_swords: Localizable {
            Localizable(
                key: "7_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 7 Of Wands
        /// ```
        internal static var _7_of_wands: Localizable {
            Localizable(
                key: "7_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 8 Of Cups
        /// ```
        internal static var _8_of_cups: Localizable {
            Localizable(
                key: "8_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 8 Of Pentacles
        /// ```
        internal static var _8_of_pentacles: Localizable {
            Localizable(
                key: "8_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 8 Of Swords
        /// ```
        internal static var _8_of_swords: Localizable {
            Localizable(
                key: "8_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 8 Of Wands
        /// ```
        internal static var _8_of_wands: Localizable {
            Localizable(
                key: "8_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 9 Of Cups
        /// ```
        internal static var _9_of_cups: Localizable {
            Localizable(
                key: "9_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 9 Of Pentacles
        /// ```
        internal static var _9_of_pentacles: Localizable {
            Localizable(
                key: "9_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 9 Of Swords
        /// ```
        internal static var _9_of_swords: Localizable {
            Localizable(
                key: "9_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 9 Of Wands
        /// ```
        internal static var _9_of_wands: Localizable {
            Localizable(
                key: "9_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 10 Of Cups
        /// ```
        internal static var _10_of_cups: Localizable {
            Localizable(
                key: "10_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 10 Of Pentacles
        /// ```
        internal static var _10_of_pentacles: Localizable {
            Localizable(
                key: "10_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 10 Of Swords
        /// ```
        internal static var _10_of_swords: Localizable {
            Localizable(
                key: "10_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 10 Of Wands
        /// ```
        internal static var _10_of_wands: Localizable {
            Localizable(
                key: "10_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ace Of Cups
        /// ```
        internal static var ace_of_cups: Localizable {
            Localizable(
                key: "ace_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ace Of Pentacles
        /// ```
        internal static var ace_of_pentacles: Localizable {
            Localizable(
                key: "ace_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ace Of Swords
        /// ```
        internal static var ace_of_swords: Localizable {
            Localizable(
                key: "ace_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ace Of Wands
        /// ```
        internal static var ace_of_wands: Localizable {
            Localizable(
                key: "ace_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Back
        /// ```
        internal static var back_button: Localizable {
            Localizable(
                key: "back_button",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Guidance
        /// ```
        internal static var card_guidance_title: Localizable {
            Localizable(
                key: "card_guidance_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Meaning
        /// ```
        internal static var card_meaning_title: Localizable {
            Localizable(
                key: "card_meaning_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Daily
        /// ```
        internal static var daily_tab_title: Localizable {
            Localizable(
                key: "daily_tab_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Death
        /// ```
        internal static var death: Localizable {
            Localizable(
                key: "death",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Explore All Cards
        /// ```
        internal static var explore_all_cards_title: Localizable {
            Localizable(
                key: "explore_all_cards_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 5 Cards Spread
        /// ```
        internal static var five_cards_spread: Localizable {
            Localizable(
                key: "five_cards_spread",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Hide
        /// ```
        internal static var hide_button_title: Localizable {
            Localizable(
                key: "hide_button_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Judgement
        /// ```
        internal static var judgement: Localizable {
            Localizable(
                key: "judgement",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Justice
        /// ```
        internal static var justice: Localizable {
            Localizable(
                key: "justice",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// King Of Cups
        /// ```
        internal static var king_of_cups: Localizable {
            Localizable(
                key: "king_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// King Of Pentacles
        /// ```
        internal static var king_of_pentacles: Localizable {
            Localizable(
                key: "king_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// King Of Swords
        /// ```
        internal static var king_of_swords: Localizable {
            Localizable(
                key: "king_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// King Of Wands
        /// ```
        internal static var king_of_wands: Localizable {
            Localizable(
                key: "king_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Knight Of Cups
        /// ```
        internal static var knight_of_cups: Localizable {
            Localizable(
                key: "knight_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Knight Of Pentacles
        /// ```
        internal static var knight_of_pentacles: Localizable {
            Localizable(
                key: "knight_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Knight Of Swords
        /// ```
        internal static var knight_of_swords: Localizable {
            Localizable(
                key: "knight_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Knight Of Wands
        /// ```
        internal static var knight_of_wands: Localizable {
            Localizable(
                key: "knight_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Learn how to read cards
        /// ```
        internal static var learn_cards_title: Localizable {
            Localizable(
                key: "learn_cards_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// See all cards
        /// ```
        internal static var look_all_cards_button_title: Localizable {
            Localizable(
                key: "look_all_cards_button_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Continue
        /// ```
        internal static var onboarding_button_continue: Localizable {
            Localizable(
                key: "onboarding_button_continue",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Getting started
        /// ```
        internal static var onboarding_get_started: Localizable {
            Localizable(
                key: "onboarding_get_started",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reveal My Path
        /// ```
        internal static var onboarding_personalization_button_title: Localizable {
            Localizable(
                key: "onboarding_personalization_button_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Date Of Birth
        /// ```
        internal static var onboarding_personalization_date_of_birth: Localizable {
            Localizable(
                key: "onboarding_personalization_date_of_birth",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Female
        /// ```
        internal static var onboarding_personalization_gender_female: Localizable {
            Localizable(
                key: "onboarding_personalization_gender_female",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Male
        /// ```
        internal static var onboarding_personalization_gender_male: Localizable {
            Localizable(
                key: "onboarding_personalization_gender_male",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Career & Ambition
        /// ```
        internal static var onboarding_personalization_interest_career: Localizable {
            Localizable(
                key: "onboarding_personalization_interest_career",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Money & Finances
        /// ```
        internal static var onboarding_personalization_interest_finance: Localizable {
            Localizable(
                key: "onboarding_personalization_interest_finance",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Future Insights
        /// ```
        internal static var onboarding_personalization_interest_future: Localizable {
            Localizable(
                key: "onboarding_personalization_interest_future",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Love & Relationships
        /// ```
        internal static var onboarding_personalization_interest_love: Localizable {
            Localizable(
                key: "onboarding_personalization_interest_love",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Mood & Energy
        /// ```
        internal static var onboarding_personalization_interest_moodAndEnergy: Localizable {
            Localizable(
                key: "onboarding_personalization_interest_moodAndEnergy",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Choose what speaks to you for a more meaningful experience
        /// ```
        internal static var onboarding_personalization_subtitle: Localizable {
            Localizable(
                key: "onboarding_personalization_subtitle",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Let’s Get to Know You
        /// ```
        internal static var onboarding_personalization_title: Localizable {
            Localizable(
                key: "onboarding_personalization_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Card Reading Experience
        /// ```
        internal static var onboarding_read_cards_title: Localizable {
            Localizable(
                key: "onboarding_read_cards_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Skip
        /// ```
        internal static var onboarding_skip: Localizable {
            Localizable(
                key: "onboarding_skip",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Enable notifications to receive timely insights.
        /// ```
        internal static var onboarding_subtitle_notifications: Localizable {
            Localizable(
                key: "onboarding_subtitle_notifications",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Three-Card Tarot Spread
        /// ```
        internal static var onboarding_three_card_title: Localizable {
            Localizable(
                key: "onboarding_three_card_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Receive magical advice
        /// every day.
        /// ```
        internal static var onboarding_title_magical_advice: Localizable {
            Localizable(
                key: "onboarding_title_magical_advice",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Find out what lies
        /// ahead.
        /// ```
        internal static var onboarding_title_what_lies: Localizable {
            Localizable(
                key: "onboarding_title_what_lies",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Uncover the secrets of your
        /// zodiac sign.
        /// ```
        internal static var onboarding_title_zodiac_signs: Localizable {
            Localizable(
                key: "onboarding_title_zodiac_signs",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Page Of Cups
        /// ```
        internal static var page_of_cups: Localizable {
            Localizable(
                key: "page_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Page Of Pentacles
        /// ```
        internal static var page_of_pentacles: Localizable {
            Localizable(
                key: "page_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Page Of Swords
        /// ```
        internal static var page_of_swords: Localizable {
            Localizable(
                key: "page_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Page Of Wands
        /// ```
        internal static var page_of_wands: Localizable {
            Localizable(
                key: "page_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Cancel at any time
        /// ```
        internal static var paywall_button_subtitle: Localizable {
            Localizable(
                key: "paywall_button_subtitle",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Continue
        /// ```
        internal static var paywall_button_title: Localizable {
            Localizable(
                key: "paywall_button_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Advanced spreads, personalized forecasts,
        /// unique subscriber-only content.
        /// ```
        internal static var paywall_header_subtitle: Localizable {
            Localizable(
                key: "paywall_header_subtitle",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Unlock the Magic of Tarot
        /// and Horoscopes
        /// ```
        internal static var paywall_header_title: Localizable {
            Localizable(
                key: "paywall_header_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Open
        /// Taro magic
        /// and horoscope
        /// ```
        internal static var paywall_title: Localizable {
            Localizable(
                key: "paywall_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Queen Of Cups
        /// ```
        internal static var queen_of_cups: Localizable {
            Localizable(
                key: "queen_of_cups",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Queen Of Pentacles
        /// ```
        internal static var queen_of_pentacles: Localizable {
            Localizable(
                key: "queen_of_pentacles",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Queen Of Swords
        /// ```
        internal static var queen_of_swords: Localizable {
            Localizable(
                key: "queen_of_swords",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Queen Of Wands
        /// ```
        internal static var queen_of_wands: Localizable {
            Localizable(
                key: "queen_of_wands",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Try again!
        /// ```
        internal static var retry_spread_title: Localizable {
            Localizable(
                key: "retry_spread_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reveal
        /// ```
        internal static var reveal_button_title: Localizable {
            Localizable(
                key: "reveal_button_title",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// AI Tarot
        /// ```
        internal static var spread_ai_tarot: Localizable {
            Localizable(
                key: "spread_ai_tarot",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Open the cards to reveal additional answers
        /// ```
        internal static var spread_more_answers: Localizable {
            Localizable(
                key: "spread_more_answers",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ask question **«‎what should I do to …»** and open cards one by one.
        /// ```
        internal static var spread_think_text: Localizable {
            Localizable(
                key: "spread_think_text",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Strength
        /// ```
        internal static var strength: Localizable {
            Localizable(
                key: "strength",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Tarot
        /// ```
        internal static var tarot_tab: Localizable {
            Localizable(
                key: "tarot_tab",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Temperance
        /// ```
        internal static var temperance: Localizable {
            Localizable(
                key: "temperance",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Chariot
        /// ```
        internal static var the_chariot: Localizable {
            Localizable(
                key: "the_chariot",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Devil
        /// ```
        internal static var the_devil: Localizable {
            Localizable(
                key: "the_devil",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Emperor
        /// ```
        internal static var the_emperor: Localizable {
            Localizable(
                key: "the_emperor",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Empress
        /// ```
        internal static var the_empress: Localizable {
            Localizable(
                key: "the_empress",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Fool
        /// ```
        internal static var the_fool: Localizable {
            Localizable(
                key: "the_fool",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Hanged Man
        /// ```
        internal static var the_hanged_man: Localizable {
            Localizable(
                key: "the_hanged_man",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Hermit
        /// ```
        internal static var the_hermit: Localizable {
            Localizable(
                key: "the_hermit",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Hierophant
        /// ```
        internal static var the_hierophant: Localizable {
            Localizable(
                key: "the_hierophant",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The High Priestess
        /// ```
        internal static var the_high_priestess: Localizable {
            Localizable(
                key: "the_high_priestess",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Lovers
        /// ```
        internal static var the_lovers: Localizable {
            Localizable(
                key: "the_lovers",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Magician
        /// ```
        internal static var the_magician: Localizable {
            Localizable(
                key: "the_magician",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Moon
        /// ```
        internal static var the_moon: Localizable {
            Localizable(
                key: "the_moon",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Star
        /// ```
        internal static var the_star: Localizable {
            Localizable(
                key: "the_star",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Sun
        /// ```
        internal static var the_sun: Localizable {
            Localizable(
                key: "the_sun",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Tower
        /// ```
        internal static var the_tower: Localizable {
            Localizable(
                key: "the_tower",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The World
        /// ```
        internal static var the_world: Localizable {
            Localizable(
                key: "the_world",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// 3 Card Spread
        /// ```
        internal static var three_card_spread: Localizable {
            Localizable(
                key: "three_card_spread",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Today
        /// ```
        internal static var today: Localizable {
            Localizable(
                key: "today",
                arguments: [],
                table: "Localizable"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Wheel Of Fortune
        /// ```
        internal static var wheel_of_fortune: Localizable {
            Localizable(
                key: "wheel_of_fortune",
                arguments: [],
                table: "Localizable"
            )
        }

        var bundle: Bundle {
            #if SWIFT_PACKAGE
            .module
            #else
            Bundle(for: BundleLocator.self)
            #endif
        }

        @available(macOS 12, iOS 15, tvOS 15, watchOS 8, *)
        fileprivate var defaultValue: String.LocalizationValue {
            var stringInterpolation = String.LocalizationValue.StringInterpolation(literalCapacity: 0, interpolationCount: arguments.count)
            for argument in arguments {
                switch argument {
                case .int(let value):
                    stringInterpolation.appendInterpolation(value)
                case .uint(let value):
                    stringInterpolation.appendInterpolation(value)
                case .float(let value):
                    stringInterpolation.appendInterpolation(value)
                case .double(let value):
                    stringInterpolation.appendInterpolation(value)
                case .object(let value):
                    stringInterpolation.appendInterpolation(value)
                }
            }
            let makeDefaultValue = String.LocalizationValue.init(stringInterpolation:)
            return makeDefaultValue(stringInterpolation)
        }

        fileprivate var _key: String {
            String(describing: key)
        }

        internal func hash(into hasher: inout Hasher) {
            hasher.combine(_key)
            hasher.combine(arguments)
            hasher.combine(table)
        }

        internal static func ==(lhs: Localizable, rhs: Localizable) -> Bool {
            lhs._key == rhs._key && lhs.arguments == rhs.arguments && lhs.table == rhs.table
        }
    }

    internal init(localizable: Localizable, locale: Locale? = nil) {
        let key = String(describing: localizable.key)
        self.init(
            format: localizable.bundle.localizedString(forKey: key, value: nil, table: localizable.table),
            locale: locale,
            arguments: localizable.arguments.map(\.value)
        )
    }

    /// Creates a `String` that represents a localized value in the ‘Localizable‘ strings table.
    internal static func localizable(_ localizable: String.Localizable) -> String {
        String(localizable: localizable)
    }
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
extension LocalizedStringResource {
    internal init(localizable: String.Localizable) {
        self.init(
            localizable.key,
            defaultValue: localizable.defaultValue,
            table: localizable.table,
            bundle: .atURL(localizable.bundle.bundleURL)
        )
    }

    /// Creates a `LocalizedStringResource` that represents a localized value in the ‘Localizable‘ strings table.
    internal static func localizable(_ localizable: String.Localizable) -> LocalizedStringResource {
        LocalizedStringResource(localizable: localizable)
    }
}

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Text {
    /// Creates a text view that displays a localized string defined in the ‘Localizable‘ strings table.
    internal init(localizable: String.Localizable) {
        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            self.init(LocalizedStringResource(localizable: localizable))
            return
        }

        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: localizable.arguments.count)
        for argument in localizable.arguments {
            switch argument {
            case .int(let value):
                stringInterpolation.appendInterpolation(value)
            case .uint(let value):
                stringInterpolation.appendInterpolation(value)
            case .float(let value):
                stringInterpolation.appendInterpolation(value)
            case .double(let value):
                stringInterpolation.appendInterpolation(value)
            case .object(let value):
                stringInterpolation.appendInterpolation(value)
            }
        }
        let makeKey = LocalizedStringKey.init(stringInterpolation:)

        var key = makeKey(stringInterpolation)
        key.overrideKeyForLookup(using: localizable._key)

        self.init(key, tableName: localizable.table, bundle: localizable.bundle)
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LocalizedStringKey {
    /// Creates a localized string key that represents a localized value in the ‘Localizable‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal init(localizable: String.Localizable) {
        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: 1)

        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            stringInterpolation.appendInterpolation(LocalizedStringResource(localizable: localizable))
        } else {
            stringInterpolation.appendInterpolation(Text(localizable: localizable))
        }

        let makeKey = LocalizedStringKey.init(stringInterpolation:)
        self = makeKey(stringInterpolation)
    }

    /// Creates a `LocalizedStringKey` that represents a localized value in the ‘Localizable‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal static func localizable(_ localizable: String.Localizable) -> LocalizedStringKey {
        LocalizedStringKey(localizable: localizable)
    }

    /// Updates the underlying `key` used when performing localization lookups.
    ///
    /// By default, an instance of `LocalizedStringKey` can only be created
    /// using string interpolation, so if arguments are included, the format
    /// specifiers make up part of the key.
    ///
    /// This method allows you to change the key after initialization in order
    /// to match the value that might be defined in the strings table.
    fileprivate mutating func overrideKeyForLookup(using key: String) {
        withUnsafeMutablePointer(to: &self) { pointer in
            let raw = UnsafeMutableRawPointer(pointer)
            let bound = raw.assumingMemoryBound(to: String.self)
            bound.pointee = key
        }
    }
}
#endif
