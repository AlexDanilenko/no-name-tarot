import Foundation

extension String {
    /// A type that represents localized strings from the ‘Swords‘
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
    /// with the `String`.``Swift/String/init(swords:locale:)``
    /// initializer:
    ///
    /// ```swift
    /// // Accessing the localized value directly
    /// let value = String(swords: ._2_of_swordsReversedMeaning)
    /// value // "Reversed, tension breaks: either decision is forced or anxiety floods clarity.\nInternal conflict spills outward."
    /// ```
    ///
    /// Starting in iOS 16/macOS 13/tvOS 16/watchOS 9, `LocalizedStringResource` can also
    /// be used:
    ///
    /// ```swift
    /// var resource = LocalizedStringResource(swords: ._2_of_swordsReversedMeaning)
    /// resource.locale = Locale(identifier: "fr") // customise language
    /// let value = String(localized: resource)    // defer lookup
    /// ```
    ///
    /// ### SwiftUI
    ///
    /// In SwiftUI, it is recommended to use `Text`.``SwiftUI/Text/init(swords:)``
    /// or `LocalizedStringKey`.``SwiftUI/LocalizedStringKey/swords(_:)``
    /// in order for localized values to be resolved within the SwiftUI environment:
    ///
    /// ```swift
    /// var body: some View {
    ///     List {
    ///         Text(swords: .listContent)
    ///     }
    ///     .navigationTitle(.swords(.navigationTitle))
    ///     .environment(\.locale, Locale(identifier: "fr"))
    /// }
    /// ```
    ///
    /// - SeeAlso: [XCStrings Tool Documentation - Using the generated source code](https://swiftpackageindex.com/liamnichols/xcstrings-tool/1.2.0/documentation/documentation/using-the-generated-source-code)
    internal struct Swords: Hashable, Sendable {
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
        /// Reversed, tension breaks: either decision is forced or anxiety floods clarity.
        /// Internal conflict spills outward.
        /// ```
        internal static var _2_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_2_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Seek mediation, journal conflicting voices, and act before paralysis becomes crisis.
        /// ```
        internal static var _2_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_2_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A blindfolded woman crosses two swords before a moonlit sea—stalemate, indecision,
        /// or guarded heart. The Two of Swords shows balanced arguments and the need to choose
        /// by integrating logic with intuition.
        /// ```
        internal static var _2_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_2_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Remove the blindfold. Acknowledge feelings, gather missing data, and commit to one
        /// path.
        /// ```
        internal static var _2_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_2_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, wounds start closing—or linger as suppressed resentment. Silence breeds
        /// infection.
        /// ```
        internal static var _3_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_3_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Forgive, seek therapy, and replace rumination with self‑compassionate action.
        /// ```
        internal static var _3_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_3_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A heart pierced by three swords under storm clouds depicts sorrow, betrayal, or
        /// painful truth. The Three of Swords is grief revealed so it can be healed.
        /// ```
        internal static var _3_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_3_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Feel the pain without dodging it. Talk, write, or cry it through; honest expression
        /// begins repair.
        /// ```
        internal static var _3_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_3_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, rest turns to stagnation or insomnia. You may resist downtime yet feel
        /// drained.
        /// ```
        internal static var _4_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_4_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Schedule true rest or gentle activity to restart circulation—balance motion with
        /// mindfulness.
        /// ```
        internal static var _4_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_4_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A knight lies in a chapel, hands folded in rest. The Four of Swords prescribes
        /// retreat, recovery, and mental stillness after strife.
        /// ```
        internal static var _4_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_4_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Unplug. Meditate, sleep, or take a digital sabbath; clarity returns in quiet.
        /// ```
        internal static var _4_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_4_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, old grudges resurface or a chance to apologise appears. Pride blocks
        /// peace.
        /// ```
        internal static var _5_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_5_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Initiate honest dialogue, own mistakes, and rebuild trust through fair action.
        /// ```
        internal static var _5_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_5_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A smirking figure gathers swords from defeated foes. The Five of Swords signals
        /// conflict won by questionable means: hollow victory, ego clashes, or ethical
        /// compromise.
        /// ```
        internal static var _5_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_5_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Evaluate the cost of winning. Choose reconciliation or strategic retreat over
        /// pyrrhic triumph.
        /// ```
        internal static var _5_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_5_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, you resist necessary departure or carry unresolved baggage into new
        /// shores.
        /// ```
        internal static var _6_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_6_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Release the past intentionally before moving on; unfinished grief will follow
        /// otherwise.
        /// ```
        internal static var _6_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_6_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A ferryman carries passengers across calm water—transition, recovery, and mental
        /// passage from strife to serenity. Travel, therapy, or intellectual shift helps you
        /// heal.
        /// ```
        internal static var _6_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_6_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Allow the journey. Seek supportive environments, mentors, or literal relocation to
        /// smoother seas.
        /// ```
        internal static var _6_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_6_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, lies surface or self‑deception breaks. Guilt presses for confession.
        /// ```
        internal static var _7_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_7_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Come clean, revise the plan openly, and rebuild credibility.
        /// ```
        internal static var _7_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_7_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A figure sneaks from a camp clutching stolen blades. The Seven of Swords represents
        /// strategy, secrecy, or deceit—sometimes clever solo manoeuvre, sometimes betrayal.
        /// ```
        internal static var _7_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_7_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Act tactically but ethically. If stealth is required, ensure motives are honourable.
        /// ```
        internal static var _7_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_7_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, liberation dawns—or denial deepens. You glimpse escape yet doubt it’s
        /// possible.
        /// ```
        internal static var _8_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_8_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Take a small courageous action; each proof of agency loosens the bonds.
        /// ```
        internal static var _8_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_8_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Blindfolded and bound, a woman stands amid eight swords on marshy ground. The Eight
        /// of Swords depicts mental imprisonment—limiting beliefs more than literal traps.
        /// ```
        internal static var _8_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_8_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Challenge negative self‑talk. Ask for perspective, imagine freedom steps, and cut
        /// one tie at a time.
        /// ```
        internal static var _8_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_8_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, nightmares wane or spiral into depression; suppressed fears ask for
        /// daylight.
        /// ```
        internal static var _9_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_9_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Pursue professional help, journal repetitively, and replace rumination with embodied
        /// presence.
        /// ```
        internal static var _9_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_9_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A figure sits up at night, hands on face, haunted by nine hanging swords. The Nine
        /// of Swords is anxiety, guilt, or insomnia—torment born in the mind.
        /// ```
        internal static var _9_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_9_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Speak worries aloud, seek counsel, practice grounding rituals; reality is kinder
        /// than imagined doom.
        /// ```
        internal static var _9_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_9_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, ruin is avoided or healing begins, yet scars remind you to change
        /// patterns.
        /// ```
        internal static var _10_of_swordsReversedMeaning: Swords {
            Swords(
                key: "_10_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Learn the lesson, seek therapy or renewal, and prevent repetition.
        /// ```
        internal static var _10_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "_10_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A figure lies pierced by ten swords under a black sky turning to dawn. The Ten of
        /// Swords marks painful endings, betrayal, or burnout—but also finality and inevitable
        /// sunrise.
        /// ```
        internal static var _10_of_swordsUprightMeaning: Swords {
            Swords(
                key: "_10_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Accept closure. Mourn, then stand when light returns; the worst is done and dawn is
        /// rising.
        /// ```
        internal static var _10_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "_10_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, thoughts tangle: confusion, misinformation, or self‑doubt blunts the
        /// blade. Words wound, contracts mislead, or justice stalls.
        /// ```
        internal static var ace_of_swordsReversedMeaning: Swords {
            Swords(
                key: "ace_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Pause analysis. Verify facts, seek counsel, and clear mental clutter before choosing
        /// your stance.
        /// ```
        internal static var ace_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "ace_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A radiant sword pierces a crown amid flaring clouds. The Ace of Swords is the first
        /// flash of truth, a decisive insight that cuts illusion away. It heralds mental
        /// clarity, honest communication, legal victory, or a bold new idea. In love it favours
        /// direct discussion; in career it sparks strategic planning; spiritually it is the
        /// awakening that comes when you name reality exactly as it is.
        /// ```
        internal static var ace_of_swordsUprightMeaning: Swords {
            Swords(
                key: "ace_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Speak the unvarnished truth and begin the plan. Write, debate, sign the contract—let
        /// clean logic lead while integrity stays sharp.
        /// ```
        internal static var ace_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "ace_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, tyranny, manipulative rhetoric, or mental rigidity corrupt leadership.
        /// ```
        internal static var king_of_swordsReversedMeaning: Swords {
            Swords(
                key: "king_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Invite counsel, balance head with heart, and correct policies that harm trust.
        /// ```
        internal static var king_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "king_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The King of Swords commands from a throne of authority, representing strategic
        /// mastery, law, and ethical reasoning. He unites logic with moral code to govern
        /// wisely.
        /// ```
        internal static var king_of_swordsUprightMeaning: Swords {
            Swords(
                key: "king_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Lead with clarity, uphold justice, and craft policies that protect the greater good.
        /// ```
        internal static var king_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "king_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, haste breeds errors, aggression alienates allies, or dogma overrides
        /// empathy.
        /// ```
        internal static var knight_of_swordsReversedMeaning: Swords {
            Swords(
                key: "knight_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Check motives, pause for feedback, and integrate compassion into strategy.
        /// ```
        internal static var knight_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "knight_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Knight charges on a swift steed, sword pointed forward. He is decisive action,
        /// bold intellect, and crusading justice—yet prone to tunnel vision.
        /// ```
        internal static var knight_of_swordsUprightMeaning: Swords {
            Swords(
                key: "knight_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Advance with clarity, but remember to listen and adapt mid‑charge.
        /// ```
        internal static var knight_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "knight_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, gossip, impatience, or scattered focus disrupts learning and trust.
        /// ```
        internal static var page_of_swordsReversedMeaning: Swords {
            Swords(
                key: "page_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Verify sources, slow the pace, and think before posting or speaking.
        /// ```
        internal static var page_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "page_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A vigilant youth wields a raised sword in gusty winds. The Page of Swords is curious
        /// intellect, news, study, or spirited debate. Ideas flutter, asking investigation.
        /// ```
        internal static var page_of_swordsUprightMeaning: Swords {
            Swords(
                key: "page_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Research thoroughly, ask incisive questions, and refine communication skills.
        /// ```
        internal static var page_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "page_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, bitterness, coldness, or over‑critical judgement wounds connections.
        /// ```
        internal static var queen_of_swordsReversedMeaning: Swords {
            Swords(
                key: "queen_of_swords.reversed.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Temper candour with empathy, heal old sorrows, and invite supportive dialogue.
        /// ```
        internal static var queen_of_swordsReversedRecommendation: Swords {
            Swords(
                key: "queen_of_swords.reversed.recommendation",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Crowned and throned in clear air, the Queen of Swords melds intellect with
        /// perceptive truth. She is analytical, independent, and fair, cutting through
        /// confusion with direct speech.
        /// ```
        internal static var queen_of_swordsUprightMeaning: Swords {
            Swords(
                key: "queen_of_swords.upright.meaning",
                arguments: [],
                table: "Swords"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Communicate boundaries, make unbiased decisions, and mentor others through honest
        /// wisdom.
        /// ```
        internal static var queen_of_swordsUprightRecommendation: Swords {
            Swords(
                key: "queen_of_swords.upright.recommendation",
                arguments: [],
                table: "Swords"
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

        internal static func ==(lhs: Swords, rhs: Swords) -> Bool {
            lhs._key == rhs._key && lhs.arguments == rhs.arguments && lhs.table == rhs.table
        }
    }

    internal init(swords: Swords, locale: Locale? = nil) {
        let key = String(describing: swords.key)
        self.init(
            format: swords.bundle.localizedString(forKey: key, value: nil, table: swords.table),
            locale: locale,
            arguments: swords.arguments.map(\.value)
        )
    }

    /// Creates a `String` that represents a localized value in the ‘Swords‘ strings table.
    internal static func swords(_ swords: String.Swords) -> String {
        String(swords: swords)
    }
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
extension LocalizedStringResource {
    internal init(swords: String.Swords) {
        self.init(
            swords.key,
            defaultValue: swords.defaultValue,
            table: swords.table,
            bundle: .atURL(swords.bundle.bundleURL)
        )
    }

    /// Creates a `LocalizedStringResource` that represents a localized value in the ‘Swords‘ strings table.
    internal static func swords(_ swords: String.Swords) -> LocalizedStringResource {
        LocalizedStringResource(swords: swords)
    }
}

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Text {
    /// Creates a text view that displays a localized string defined in the ‘Swords‘ strings table.
    internal init(swords: String.Swords) {
        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            self.init(LocalizedStringResource(swords: swords))
            return
        }

        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: swords.arguments.count)
        for argument in swords.arguments {
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
        key.overrideKeyForLookup(using: swords._key)

        self.init(key, tableName: swords.table, bundle: swords.bundle)
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LocalizedStringKey {
    /// Creates a localized string key that represents a localized value in the ‘Swords‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal init(swords: String.Swords) {
        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: 1)

        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            stringInterpolation.appendInterpolation(LocalizedStringResource(swords: swords))
        } else {
            stringInterpolation.appendInterpolation(Text(swords: swords))
        }

        let makeKey = LocalizedStringKey.init(stringInterpolation:)
        self = makeKey(stringInterpolation)
    }

    /// Creates a `LocalizedStringKey` that represents a localized value in the ‘Swords‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal static func swords(_ swords: String.Swords) -> LocalizedStringKey {
        LocalizedStringKey(swords: swords)
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
