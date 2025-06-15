import Foundation

extension String {
    /// A type that represents localized strings from the ‘Pentacles‘
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
    /// with the `String`.``Swift/String/init(pentacles:locale:)``
    /// initializer:
    ///
    /// ```swift
    /// // Accessing the localized value directly
    /// let value = String(pentacles: ._2_of_pentaclesReversedMeaning)
    /// value // "Reversed, overwhelm hits: balls drop, payments lapse, emotions swing. Multitasking\nfractures focus."
    /// ```
    ///
    /// Starting in iOS 16/macOS 13/tvOS 16/watchOS 9, `LocalizedStringResource` can also
    /// be used:
    ///
    /// ```swift
    /// var resource = LocalizedStringResource(pentacles: ._2_of_pentaclesReversedMeaning)
    /// resource.locale = Locale(identifier: "fr") // customise language
    /// let value = String(localized: resource)    // defer lookup
    /// ```
    ///
    /// ### SwiftUI
    ///
    /// In SwiftUI, it is recommended to use `Text`.``SwiftUI/Text/init(pentacles:)``
    /// or `LocalizedStringKey`.``SwiftUI/LocalizedStringKey/pentacles(_:)``
    /// in order for localized values to be resolved within the SwiftUI environment:
    ///
    /// ```swift
    /// var body: some View {
    ///     List {
    ///         Text(pentacles: .listContent)
    ///     }
    ///     .navigationTitle(.pentacles(.navigationTitle))
    ///     .environment(\.locale, Locale(identifier: "fr"))
    /// }
    /// ```
    ///
    /// - SeeAlso: [XCStrings Tool Documentation - Using the generated source code](https://swiftpackageindex.com/liamnichols/xcstrings-tool/1.2.0/documentation/documentation/using-the-generated-source-code)
    internal struct Pentacles: Hashable, Sendable {
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
        /// Reversed, overwhelm hits: balls drop, payments lapse, emotions swing. Multitasking
        /// fractures focus.
        /// ```
        internal static var _2_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_2_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Simplify. Delegate, automate, or say no until stability returns.
        /// ```
        internal static var _2_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_2_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A juggler dances with two coins bound by an infinity loop as waves rise and fall
        /// behind him. The Two of Pentacles symbolizes balance amid change—managing time,
        /// money, or moods with adaptability.
        /// ```
        internal static var _2_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_2_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Prioritize flexibly. Use schedules, humor, and mindful pauses to keep plates
        /// spinning without burnout.
        /// ```
        internal static var _2_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_2_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, miscommunication, shoddy workmanship, or ego disrupt cooperation. Craft
        /// suffers when vision is siloed.
        /// ```
        internal static var _3_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_3_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Clarify roles, improve skills, and rebuild trust through transparent standards.
        /// ```
        internal static var _3_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_3_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// An artisan displays cathedral plans to monk and patron—skill, collaboration, and
        /// mastery in progress. The Three of Pentacles affirms teamwork founded on respect and
        /// complementary talents.
        /// ```
        internal static var _3_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_3_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Share drafts, invite feedback, and honour every contributor. Collective excellence
        /// elevates the project.
        /// ```
        internal static var _3_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_3_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, money slips away or rigidity breaks open. Greed isolates; guarded hearts
        /// miss connection.
        /// ```
        internal static var _4_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_4_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Adopt balanced flow: budget with purpose, share resources, and trust circulation
        /// over hoarding.
        /// ```
        internal static var _4_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_4_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A figure clutches coins to crown, heart, and feet—security, control, and fear of
        /// loss. The Four of Pentacles marks stable finances yet warns against possessiveness
        /// or stagnation.
        /// ```
        internal static var _4_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_4_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Protect assets wisely but loosen grip where generosity or investment would foster
        /// growth.
        /// ```
        internal static var _4_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_4_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, recovery begins or debt deepens. Pride may block assistance, or newfound
        /// resource eases strain.
        /// ```
        internal static var _5_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_5_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Accept help with gratitude, rebuild foundations, and cultivate mindset of abundance.
        /// ```
        internal static var _5_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_5_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Snow falls on two destitute figures limping past a lit church window. The Five of
        /// Pentacles represents material hardship, illness, or feeling excluded. Yet sanctuary
        /// glows nearby, hinting aid exists.
        /// ```
        internal static var _5_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_5_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Seek support—community programs, friends, or spiritual refuge—and remember worth is
        /// not measured in coin.
        /// ```
        internal static var _5_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_5_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, strings attach: unequal giving, debts, or exploitation distort generosity.
        /// ```
        internal static var _6_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_6_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Set healthy boundaries, repay dues, and create fair agreements.
        /// ```
        internal static var _6_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_6_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A wealthy donor balances scales while giving coins to the needy. The Six of
        /// Pentacles speaks of generosity, charity, and the cyclical nature of
        /// prosperity—sometimes giver, sometimes receiver.
        /// ```
        internal static var _6_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_6_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Share surplus responsibly; receive aid with humility. Ensure exchanges empower, not
        /// enable.
        /// ```
        internal static var _6_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_6_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, impatience or misallocation drains returns. Toil without direction wastes
        /// seasons.
        /// ```
        internal static var _7_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_7_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Adjust goals or cut losses; nurture projects aligned with values and realistic
        /// timelines.
        /// ```
        internal static var _7_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_7_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A gardener pauses, leaning on his tool, assessing seven growing coins. The Seven of
        /// Pentacles is patience, evaluation, and long‑term investment. Progress is sprouting
        /// but harvest lies ahead.
        /// ```
        internal static var _7_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_7_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Review strategy: weed inefficiencies, water strengths, and trust the timetable of
        /// organic growth.
        /// ```
        internal static var _7_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_7_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, monotony, sloppy effort, or perfectionism stalls mastery.
        /// ```
        internal static var _8_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_8_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Re‑engage curiosity, diversify methods, or rest before returning with fresh eyes.
        /// ```
        internal static var _8_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_8_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A craftsman carves coin after coin on a bench. The Eight of Pentacles praises
        /// diligence, apprenticeship, and skill refinement through repetition. Mastery is
        /// forged in focused labor.
        /// ```
        internal static var _8_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_8_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Commit to deliberate practice. Enroll in courses, track progress, and take pride in
        /// incremental gains.
        /// ```
        internal static var _8_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_8_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, over‑spending, isolation, or work‑life imbalance tarnish enjoyment.
        /// ```
        internal static var _9_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_9_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Practice mindful budgeting, enrich social ties, and reconnect to purpose beyond
        /// possessions.
        /// ```
        internal static var _9_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_9_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A well‑dressed figure strolls a lush vineyard with falcon gloved—self‑sufficiency,
        /// luxury, and grace earned through discipline. The Nine of Pentacles celebrates
        /// independence and cultivated comfort.
        /// ```
        internal static var _9_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_9_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Savour achievements, maintain standards, and share wisdom. Wealth of spirit enhances
        /// material success.
        /// ```
        internal static var _9_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_9_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, inheritance disputes, financial instability, or short‑sighted spending
        /// threaten foundations.
        /// ```
        internal static var _10_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "_10_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Address conflicts transparently, revise wills, and build resilience through
        /// diversification.
        /// ```
        internal static var _10_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "_10_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Three generations gather under an arch of coins—legacy, family wealth, and long‑term
        /// security. The Ten of Pentacles signifies completion of material cycle and the duty
        /// to steward resources wisely.
        /// ```
        internal static var _10_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "_10_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Plan estates, invest ethically, and honour heritage while supporting future
        /// generations.
        /// ```
        internal static var _10_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "_10_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the seed dries: missed chance, poor planning, or fear of scarcity blocks
        /// flow. Resources slip through unfocused hands.
        /// ```
        internal static var ace_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "ace_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Review budgets, clear clutter, and commit to disciplined habits before new
        /// opportunities can take root.
        /// ```
        internal static var ace_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "ace_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A shining coin emerges from a garden cloud, archway leading to distant peaks. The
        /// Ace of Pentacles is the seed of manifestation: a job offer, funding, home, or bodily
        /// renewal. It promises tangible prosperity if nurtured with steady effort and
        /// gratitude.
        /// ```
        internal static var ace_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "ace_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ground your vision—open the savings account, draft the plan, plant the garden.
        /// Respect beginnings and tend them daily.
        /// ```
        internal static var ace_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "ace_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, greed, rigidity, or fear of change corrodes leadership; resources stagnate
        /// or exploit.
        /// ```
        internal static var king_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "king_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Loosen attachment to status, practice philanthropy, and update strategies for
        /// evolving markets.
        /// ```
        internal static var king_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "king_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The King of Pentacles sits on a carved throne of bulls and grapes, symbol of wealth
        /// mastered and shared. He is strategic, generous, and grounded, turning visions into
        /// lasting structures.
        /// ```
        internal static var king_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "king_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Lead with integrity: fund worthwhile ventures, mentor fledgling talents, and secure
        /// stability for community.
        /// ```
        internal static var king_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "king_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, stagnation, stubbornness, or workaholism replaces healthy perseverance.
        /// ```
        internal static var knight_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "knight_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Introduce flexibility, delegate tasks, and balance duty with renewal.
        /// ```
        internal static var knight_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "knight_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Knight of Pentacles sits on a steady draught horse, surveying fields. He
        /// embodies reliability, methodical progress, and diligent service. Slow and sure wins
        /// this race.
        /// ```
        internal static var knight_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "knight_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Stick to the plan, honour commitments, and optimise routines; incremental effort
        /// yields harvest.
        /// ```
        internal static var knight_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "knight_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, procrastination, unrealistic goals, or lack of progress stunt potential.
        /// ```
        internal static var page_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "page_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Set concrete milestones, seek mentorship, and convert ideas into measurable action.
        /// ```
        internal static var page_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "page_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A youthful scholar gazes at a pentacle held like a cherished textbook. The Page of
        /// Pentacles heralds study, new jobs, or grounded curiosity. Practical dreams begin to
        /// take shape.
        /// ```
        internal static var page_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "page_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Enroll in training, research markets, or craft a budget. Curiosity plus discipline
        /// equals opportunity.
        /// ```
        internal static var page_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "page_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, over‑giving, financial disarray, or neglect of self‑care drains reserves.
        /// ```
        internal static var queen_of_pentaclesReversedMeaning: Pentacles {
            Pentacles(
                key: "queen_of_pentacles.reversed.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Re‑prioritise budgets and boundaries; tend personal well‑being before caretaking
        /// others.
        /// ```
        internal static var queen_of_pentaclesReversedRecommendation: Pentacles {
            Pentacles(
                key: "queen_of_pentacles.reversed.recommendation",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Throned among vines and rabbits, the Queen of Pentacles nurtures home, body, and
        /// enterprise with earthy wisdom. She fuses practicality with warmth, turning resources
        /// into comfort for all.
        /// ```
        internal static var queen_of_pentaclesUprightMeaning: Pentacles {
            Pentacles(
                key: "queen_of_pentacles.upright.meaning",
                arguments: [],
                table: "Pentacles"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Create supportive spaces, cook nourishing meals, mentor others in fiscal literacy,
        /// and honour your own body.
        /// ```
        internal static var queen_of_pentaclesUprightRecommendation: Pentacles {
            Pentacles(
                key: "queen_of_pentacles.upright.recommendation",
                arguments: [],
                table: "Pentacles"
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

        internal static func ==(lhs: Pentacles, rhs: Pentacles) -> Bool {
            lhs._key == rhs._key && lhs.arguments == rhs.arguments && lhs.table == rhs.table
        }
    }

    internal init(pentacles: Pentacles, locale: Locale? = nil) {
        let key = String(describing: pentacles.key)
        self.init(
            format: pentacles.bundle.localizedString(forKey: key, value: nil, table: pentacles.table),
            locale: locale,
            arguments: pentacles.arguments.map(\.value)
        )
    }

    /// Creates a `String` that represents a localized value in the ‘Pentacles‘ strings table.
    internal static func pentacles(_ pentacles: String.Pentacles) -> String {
        String(pentacles: pentacles)
    }
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
extension LocalizedStringResource {
    internal init(pentacles: String.Pentacles) {
        self.init(
            pentacles.key,
            defaultValue: pentacles.defaultValue,
            table: pentacles.table,
            bundle: .atURL(pentacles.bundle.bundleURL)
        )
    }

    /// Creates a `LocalizedStringResource` that represents a localized value in the ‘Pentacles‘ strings table.
    internal static func pentacles(_ pentacles: String.Pentacles) -> LocalizedStringResource {
        LocalizedStringResource(pentacles: pentacles)
    }
}

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Text {
    /// Creates a text view that displays a localized string defined in the ‘Pentacles‘ strings table.
    internal init(pentacles: String.Pentacles) {
        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            self.init(LocalizedStringResource(pentacles: pentacles))
            return
        }

        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: pentacles.arguments.count)
        for argument in pentacles.arguments {
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
        key.overrideKeyForLookup(using: pentacles._key)

        self.init(key, tableName: pentacles.table, bundle: pentacles.bundle)
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LocalizedStringKey {
    /// Creates a localized string key that represents a localized value in the ‘Pentacles‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal init(pentacles: String.Pentacles) {
        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: 1)

        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            stringInterpolation.appendInterpolation(LocalizedStringResource(pentacles: pentacles))
        } else {
            stringInterpolation.appendInterpolation(Text(pentacles: pentacles))
        }

        let makeKey = LocalizedStringKey.init(stringInterpolation:)
        self = makeKey(stringInterpolation)
    }

    /// Creates a `LocalizedStringKey` that represents a localized value in the ‘Pentacles‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal static func pentacles(_ pentacles: String.Pentacles) -> LocalizedStringKey {
        LocalizedStringKey(pentacles: pentacles)
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
