import Foundation

extension String {
    /// A type that represents localized strings from the ‘Cups‘
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
    /// with the `String`.``Swift/String/init(cups:locale:)``
    /// initializer:
    ///
    /// ```swift
    /// // Accessing the localized value directly
    /// let value = String(cups: ._2_of_cupsReversedMeaning)
    /// value // "Reversed, harmony falters: misunderstandings, unequal effort, or codependency\nsurface. Promises may feel hollow."
    /// ```
    ///
    /// Starting in iOS 16/macOS 13/tvOS 16/watchOS 9, `LocalizedStringResource` can also
    /// be used:
    ///
    /// ```swift
    /// var resource = LocalizedStringResource(cups: ._2_of_cupsReversedMeaning)
    /// resource.locale = Locale(identifier: "fr") // customise language
    /// let value = String(localized: resource)    // defer lookup
    /// ```
    ///
    /// ### SwiftUI
    ///
    /// In SwiftUI, it is recommended to use `Text`.``SwiftUI/Text/init(cups:)``
    /// or `LocalizedStringKey`.``SwiftUI/LocalizedStringKey/cups(_:)``
    /// in order for localized values to be resolved within the SwiftUI environment:
    ///
    /// ```swift
    /// var body: some View {
    ///     List {
    ///         Text(cups: .listContent)
    ///     }
    ///     .navigationTitle(.cups(.navigationTitle))
    ///     .environment(\.locale, Locale(identifier: "fr"))
    /// }
    /// ```
    ///
    /// - SeeAlso: [XCStrings Tool Documentation - Using the generated source code](https://swiftpackageindex.com/liamnichols/xcstrings-tool/1.2.0/documentation/documentation/using-the-generated-source-code)
    internal struct Cups: Hashable, Sendable {
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
        /// Reversed, harmony falters: misunderstandings, unequal effort, or codependency
        /// surface. Promises may feel hollow.
        /// ```
        internal static var _2_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_2_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Address imbalance directly. Clarify needs, renegotiate commitments, or part amicably
        /// before resentment blooms.
        /// ```
        internal static var _2_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_2_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Two figures exchange chalices beneath a winged lion and caduceus, signifying
        /// balanced partnership blessed by spirit. The Two of Cups heralds mutual attraction,
        /// heartfelt agreements, and emotional reciprocity. It can be romantic union,
        /// trustworthy friendship, or business collaboration rooted in respect.
        /// ```
        internal static var _2_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_2_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Meet halfway. Speak honestly, listen fully, and celebrate shared values. A bond
        /// tended now may outshine expectations.
        /// ```
        internal static var _2_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_2_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, overindulgence, gossip, or a clique’s exclusivity dampens celebration.
        /// Creativity stalls amid comparison.
        /// ```
        internal static var _3_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_3_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Set boundaries with excess and nurture sincere connections over superficial revelry.
        /// ```
        internal static var _3_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_3_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Three maidens raise goblets in a circle of harvest fruits—symbol of community,
        /// sisterhood, and joyful collaboration. The Three of Cups celebrates shared victories,
        /// creative synergy, and rites of passage like births or graduations.
        /// ```
        internal static var _3_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_3_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Gather your tribe. Toast milestones, brainstorm together, and let collective joy
        /// fertilise new dreams.
        /// ```
        internal static var _3_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_3_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, stagnation lifts or intensifies into restlessness. Either you re‑engage
        /// with life or sink deeper into distraction.
        /// ```
        internal static var _4_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_4_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Choose movement: accept invitations, start a modest goal, or seek counsel to
        /// reignite interest.
        /// ```
        internal static var _4_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_4_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A figure under a tree crosses arms as a hand offers a fourth cup from the clouds.
        /// The Four of Cups depicts apathy, contemplation, or spiritual boredom. You may ignore
        /// a subtle gift because you’re preoccupied with what you lack or with past
        /// disappointments.
        /// ```
        internal static var _4_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_4_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Shift perspective: practise gratitude, meditate, or change scenery so you can
        /// recognise the quiet opportunity extending itself to you.
        /// ```
        internal static var _4_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_4_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, sorrow begins to lift or festers into bitterness. The choice is to heal or
        /// to rehearse the pain.
        /// ```
        internal static var _5_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_5_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Engage in rituals of closure: therapy, ceremony, or heartfelt apologies that release
        /// the past’s grip.
        /// ```
        internal static var _5_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_5_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A cloaked mourner fixates on three spilled chalices, unaware two remain upright
        /// behind him. The Five of Cups symbolises grief, regret, and focusing on loss. Yet
        /// hope stands quietly in the unspilt cups and a bridge to new ground.
        /// ```
        internal static var _5_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_5_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Allow mourning its due—then turn slowly toward what still lives. Repair, forgive, or
        /// seek new support across the bridge.
        /// ```
        internal static var _5_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_5_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, clinging to the past blocks growth, or painful memories resurface
        /// unhealed.
        /// ```
        internal static var _6_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_6_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Balance nostalgia with present goals. Heal childhood wounds through adult
        /// understanding and self‑parenting.
        /// ```
        internal static var _6_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_6_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Children exchange flowers in a quiet courtyard, evoking nostalgia, innocence, and
        /// kind memories. The Six of Cups invites reconnection with the past—old friends,
        /// childhood joys, or simple pleasures that remind you who you were before life became
        /// complex.
        /// ```
        internal static var _6_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_6_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Visit a treasured place, dust off a hobby, or reach out to someone from earlier
        /// chapters. Let innocence refresh the present.
        /// ```
        internal static var _6_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_6_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, confusion clears—or delusion deepens. Analysis paralysis may break, or
        /// escapism may intensify.
        /// ```
        internal static var _7_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_7_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Pick one cup, act, and learn. Reality testing is the cure for castles in the air.
        /// ```
        internal static var _7_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_7_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A dreamer beholds seven cups filled with jewels, a dragon, a laurel, and
        /// more—visions of temptation and potential. The Seven of Cups represents choices,
        /// imagination, and illusion. Options abound, but some glittering paths are mirages.
        /// ```
        internal static var _7_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_7_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ground fantasies with research. Prioritise based on values and feasibility before
        /// committing resources.
        /// ```
        internal static var _7_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_7_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, you resist leaving due to fear or return after exploring. Some lessons
        /// require staying; others require moving on.
        /// ```
        internal static var _8_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_8_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Discern whether commitment or release serves growth. Consult inner truth, then act
        /// decisively.
        /// ```
        internal static var _8_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_8_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A solitary figure climbs away from eight stacked cups beneath an eclipsed moon. The
        /// Eight of Cups is voluntary departure from something once fulfilling that no longer
        /// nourishes—jobs, relationships, habits. It is a quest for deeper meaning.
        /// ```
        internal static var _8_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_8_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Acknowledge the call of the soul. Plan your exit with integrity and walk toward
        /// higher purpose, even into unknown terrain.
        /// ```
        internal static var _8_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_8_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, indulgence tips to excess or emptiness. Wishes granted may not satisfy the
        /// soul.
        /// ```
        internal static var _9_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_9_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Practice moderation and align the next goal with deeper meaning rather than surface
        /// comfort.
        /// ```
        internal static var _9_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_9_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A satisfied host sits before nine arranged chalices. The Nine of Cups is the wish
        /// card—contentment, sensual pleasure, and emotional fulfillment achieved through
        /// effort.
        /// ```
        internal static var _9_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_9_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Enjoy the fruits of your labor with gratitude. Share abundance, and set a fresh
        /// intention before complacency sets in.
        /// ```
        internal static var _9_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_9_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, domestic discord, unrealistic ideals, or hidden tensions disturb serenity.
        /// ```
        internal static var _10_of_cupsReversedMeaning: Cups {
            Cups(
                key: "_10_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Address fractures honestly, adjust expectations, and rebuild intimacy step by step.
        /// ```
        internal static var _10_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "_10_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A rainbow of ten cups arcs above a joyful family. The Ten of Cups epitomises lasting
        /// harmony, unconditional love, and communal bliss. This is the happily‑ever‑after of
        /// emotional cards.
        /// ```
        internal static var _10_of_cupsUprightMeaning: Cups {
            Cups(
                key: "_10_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Nurture relationships through gratitude, open communication, and shared rituals.
        /// Preserve unity with conscious effort.
        /// ```
        internal static var _10_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "_10_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the cup drains or refuses to fill. Emotional wounds block receptivity,
        /// creativity feels dry, or self‑protection dams the flow. You may fear vulnerability
        /// or dwell on past hurt that sours fresh encounters.
        /// ```
        internal static var ace_of_cupsReversedMeaning: Cups {
            Cups(
                key: "ace_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Begin with gentle self‑compassion. Cry, create, or confide in a trusted friend to
        /// unclog the spring. Small acts of care reopen the channel.
        /// ```
        internal static var ace_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "ace_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A chalice overflows as five streams cascade into a tranquil pool, symbolising love,
        /// spirit, creativity, intuition, and compassion pouring freely into your life. The Ace
        /// of Cups is the heart’s awakening—a pregnancy of feeling that wants to be born as
        /// affection, artistic expression, or spiritual devotion. In romance it marks
        /// butterflies and first confessions; in work it inspires projects fuelled by empathy
        /// and imagination; on the soul level it signals an open channel to the Divine, where
        /// forgiveness and grace flow without judgement.
        /// ```
        internal static var ace_of_cupsUprightMeaning: Cups {
            Cups(
                key: "ace_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Say yes to what softens and expands you. Journal dreams, start the love letter,
        /// volunteer where kindness is needed. Protect tenderness from cynicism until it finds
        /// safe harbour.
        /// ```
        internal static var ace_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "ace_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, mood swings, manipulation, or emotional withdrawal undermine leadership.
        /// ```
        internal static var king_of_cupsReversedMeaning: Cups {
            Cups(
                key: "king_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Examine triggers, seek balanced counsel, and cultivate transparency to regain trust.
        /// ```
        internal static var king_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "king_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The King of Cups sits on a stone throne amid rolling seas, mastering emotion within
        /// turbulence. He is diplomatic, wise, and compassionate, balancing intellect with
        /// feeling.
        /// ```
        internal static var king_of_cupsUprightMeaning: Cups {
            Cups(
                key: "king_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Respond, don’t react. Mediate conflicts, guide with empathy, and use creative
        /// maturity to steer situations calmly.
        /// ```
        internal static var king_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "king_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the Knight drifts into moodiness, jealousy, or escapism; promises lose
        /// follow‑through.
        /// ```
        internal static var knight_of_cupsReversedMeaning: Cups {
            Cups(
                key: "knight_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Steady emotions, set realistic timelines, and match inspiration with consistent
        /// action.
        /// ```
        internal static var knight_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "knight_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Knight of Cups rides with a winged helm, offering a chalice. He embodies
        /// romantic pursuit, artistic mission, and diplomacy. He follows the heart’s quest with
        /// grace and charm.
        /// ```
        internal static var knight_of_cupsUprightMeaning: Cups {
            Cups(
                key: "knight_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Advance your vision with poetic persuasion—pitch the proposal, confess feelings, or
        /// create beauty in motion.
        /// ```
        internal static var knight_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "knight_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, emotional immaturity, insecure daydreaming, or ignored intuition blocks
        /// growth.
        /// ```
        internal static var page_of_cupsReversedMeaning: Cups {
            Cups(
                key: "page_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Develop emotional vocabulary, seek feedback, and ground fantasies in skill‑building
        /// practice.
        /// ```
        internal static var page_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "page_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A youth gazes at a fish emerging from his chalice—surprise inspiration, intuitive
        /// messages, and emotional curiosity. The Page of Cups signals creative ideas and fresh
        /// feelings that ask for playful exploration.
        /// ```
        internal static var page_of_cupsUprightMeaning: Cups {
            Cups(
                key: "page_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Record sudden insights, respond to kind gestures, and experiment artistically
        /// without fear of imperfection.
        /// ```
        internal static var page_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "page_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, emotional overload, martyrdom, or repressed feelings cloud clarity.
        /// ```
        internal static var queen_of_cupsReversedMeaning: Cups {
            Cups(
                key: "queen_of_cups.reversed.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Practice self‑care first; seek therapy or energy clearing to restore equilibrium.
        /// ```
        internal static var queen_of_cupsReversedRecommendation: Cups {
            Cups(
                key: "queen_of_cups.reversed.recommendation",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Throned at the water’s edge, the Queen of Cups holds a lidded chalice—guardian of
        /// empathy, psychic insight, and loving counsel. She feels deeply yet remains composed,
        /// guiding others through intuition.
        /// ```
        internal static var queen_of_cupsUprightMeaning: Cups {
            Cups(
                key: "queen_of_cups.upright.meaning",
                arguments: [],
                table: "Cups"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Lead from the heart with healthy boundaries. Offer compassion, trust dreams, and
        /// nourish creativity through reflection.
        /// ```
        internal static var queen_of_cupsUprightRecommendation: Cups {
            Cups(
                key: "queen_of_cups.upright.recommendation",
                arguments: [],
                table: "Cups"
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

        internal static func ==(lhs: Cups, rhs: Cups) -> Bool {
            lhs._key == rhs._key && lhs.arguments == rhs.arguments && lhs.table == rhs.table
        }
    }

    internal init(cups: Cups, locale: Locale? = nil) {
        let key = String(describing: cups.key)
        self.init(
            format: cups.bundle.localizedString(forKey: key, value: nil, table: cups.table),
            locale: locale,
            arguments: cups.arguments.map(\.value)
        )
    }

    /// Creates a `String` that represents a localized value in the ‘Cups‘ strings table.
    internal static func cups(_ cups: String.Cups) -> String {
        String(cups: cups)
    }
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
extension LocalizedStringResource {
    internal init(cups: String.Cups) {
        self.init(
            cups.key,
            defaultValue: cups.defaultValue,
            table: cups.table,
            bundle: .atURL(cups.bundle.bundleURL)
        )
    }

    /// Creates a `LocalizedStringResource` that represents a localized value in the ‘Cups‘ strings table.
    internal static func cups(_ cups: String.Cups) -> LocalizedStringResource {
        LocalizedStringResource(cups: cups)
    }
}

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Text {
    /// Creates a text view that displays a localized string defined in the ‘Cups‘ strings table.
    internal init(cups: String.Cups) {
        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            self.init(LocalizedStringResource(cups: cups))
            return
        }

        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: cups.arguments.count)
        for argument in cups.arguments {
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
        key.overrideKeyForLookup(using: cups._key)

        self.init(key, tableName: cups.table, bundle: cups.bundle)
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LocalizedStringKey {
    /// Creates a localized string key that represents a localized value in the ‘Cups‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal init(cups: String.Cups) {
        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: 1)

        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            stringInterpolation.appendInterpolation(LocalizedStringResource(cups: cups))
        } else {
            stringInterpolation.appendInterpolation(Text(cups: cups))
        }

        let makeKey = LocalizedStringKey.init(stringInterpolation:)
        self = makeKey(stringInterpolation)
    }

    /// Creates a `LocalizedStringKey` that represents a localized value in the ‘Cups‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal static func cups(_ cups: String.Cups) -> LocalizedStringKey {
        LocalizedStringKey(cups: cups)
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
