import Foundation

extension String {
    /// A type that represents localized strings from the ‘Wands‘
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
    /// with the `String`.``Swift/String/init(wands:locale:)``
    /// initializer:
    ///
    /// ```swift
    /// // Accessing the localized value directly
    /// let value = String(wands: ._2_of_wandsReversedMeaning)
    /// value // "Reversed, the card warns of over‑planning or fear of leaving comfort. The globe\nfeels heavy, options paralyze, and adventures stay fantasies."
    /// ```
    ///
    /// Starting in iOS 16/macOS 13/tvOS 16/watchOS 9, `LocalizedStringResource` can also
    /// be used:
    ///
    /// ```swift
    /// var resource = LocalizedStringResource(wands: ._2_of_wandsReversedMeaning)
    /// resource.locale = Locale(identifier: "fr") // customise language
    /// let value = String(localized: resource)    // defer lookup
    /// ```
    ///
    /// ### SwiftUI
    ///
    /// In SwiftUI, it is recommended to use `Text`.``SwiftUI/Text/init(wands:)``
    /// or `LocalizedStringKey`.``SwiftUI/LocalizedStringKey/wands(_:)``
    /// in order for localized values to be resolved within the SwiftUI environment:
    ///
    /// ```swift
    /// var body: some View {
    ///     List {
    ///         Text(wands: .listContent)
    ///     }
    ///     .navigationTitle(.wands(.navigationTitle))
    ///     .environment(\.locale, Locale(identifier: "fr"))
    /// }
    /// ```
    ///
    /// - SeeAlso: [XCStrings Tool Documentation - Using the generated source code](https://swiftpackageindex.com/liamnichols/xcstrings-tool/1.2.0/documentation/documentation/using-the-generated-source-code)
    internal struct Wands: Hashable, Sendable {
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
        /// Reversed, the card warns of over‑planning or fear of leaving comfort. The globe
        /// feels heavy, options paralyze, and adventures stay fantasies.
        /// ```
        internal static var _2_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_2_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Shrink the decision to a first doable step. Test the waters, gather real‑world
        /// feedback, and let momentum guide the next move.
        /// ```
        internal static var _2_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_2_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A figure stands on a battlement, globe in hand, one wand fixed behind him and
        /// another grasped forward. The Two of Wands is strategic foresight—knowing the world
        /// is larger than your current domain and plotting how to reach it. Plans,
        /// partnerships, and calculated risks dominate this stage. In relationships, it
        /// suggests discussing a shared future; in business, expanding into new markets;
        /// personally, mapping the next horizon of growth.
        /// ```
        internal static var _2_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_2_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Turn vision into a roadmap. Research, budget, negotiate alliances. Bold expansion
        /// succeeds when rooted in clear structure.
        /// ```
        internal static var _2_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_2_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, delays, poor foresight, or limited support stall growth. Perhaps you set
        /// sail without enough supplies or ignored changing tides.
        /// ```
        internal static var _3_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_3_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Review logistics, strengthen communication, and adjust course rather than abandoning
        /// the voyage entirely.
        /// ```
        internal static var _3_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_3_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A traveler gazes over sea and mountains as ships sail outward. The Three of Wands
        /// signals progress: you’ve acted on a plan, and results begin to manifest. It is a
        /// card of expansion, trade, and optimism. Your venture—creative, romantic, or
        /// entrepreneurial—is leaving harbor, destined for wider shores.
        /// ```
        internal static var _3_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_3_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Maintain a long view. Delegate, network across distances, and remain patient as
        /// returns travel back to you.
        /// ```
        internal static var _3_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_3_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, festivities feel postponed or overshadowed by tension: family discord,
        /// delayed relocation, or recognition that arrives without real satisfaction.
        /// ```
        internal static var _4_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_4_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Address underlying fractures before the party. Honest conversation or practical
        /// fixes restore harmony.
        /// ```
        internal static var _4_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_4_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Four wands form a flower‑garlanded arch, welcoming dancers into celebration. The
        /// Four of Wands embodies homecoming, milestones, and communal joy—weddings,
        /// housewarmings, completed projects. Stability blends with festivity, affirming that
        /// solid foundations make true revelry possible.
        /// ```
        internal static var _4_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_4_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Pause to honor achievements with those you love. Shared gratitude fortifies future
        /// endeavors.
        /// ```
        internal static var _4_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_4_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, conflict turns toxic or is swept under the rug. Avoidance breeds
        /// resentment; groupthink stifles innovation.
        /// ```
        internal static var _5_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_5_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Facilitate mediation, clarify roles, or withdraw from battles that erode rather than
        /// sharpen you.
        /// ```
        internal static var _5_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_5_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Five youths brandish sticks in spirited conflict. The Five of Wands depicts
        /// competition, brainstorming, or chaotic disagreement. Energy is high but unfocused:
        /// useful in sports or debate, draining in ego clashes. It can mark rivalry in love or
        /// tension among colleagues.
        /// ```
        internal static var _5_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_5_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Channel conflict into constructive play. Establish rules, listen actively, and aim
        /// for creative synthesis.
        /// ```
        internal static var _5_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_5_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, acclaim feels hollow or absent. Pride precedes a stumble, or efforts go
        /// unnoticed.
        /// ```
        internal static var _6_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_6_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Evaluate motivation: seek mastery, not applause. Strengthen weaknesses quietly and
        /// success will follow.
        /// ```
        internal static var _6_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_6_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A laureled rider parades through a cheering crowd. The Six of Wands proclaims
        /// victory, public recognition, and restored confidence. Praise is deserved; leadership
        /// validated.
        /// ```
        internal static var _6_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_6_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Accept compliments gracefully and share credit with your supporters. Use momentum to
        /// pursue the next goal.
        /// ```
        internal static var _6_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_6_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, defenses crumble or feel exhausting. You doubt your stance or face
        /// overwhelming odds.
        /// ```
        internal static var _7_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_7_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reassess what’s worth protecting. Seek allies, adjust tactics, or choose a new hill
        /// altogether.
        /// ```
        internal static var _7_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_7_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Atop a hill, a defender fends off attackers below. The Seven of Wands is standing
        /// your ground when success breeds challengers. Courage, stamina, and conviction are
        /// necessary to maintain your position.
        /// ```
        internal static var _7_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_7_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Assert boundaries and believe in your right to be here. Preparation and moral
        /// clarity turn defense into triumph.
        /// ```
        internal static var _7_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_7_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, momentum stalls: lost mail, travel hiccups, or scattered focus thwart
        /// speed.
        /// ```
        internal static var _8_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_8_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Slow down to troubleshoot bottlenecks. Clear priorities and streamline channels
        /// before pushing again.
        /// ```
        internal static var _8_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_8_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Eight wands streak through the sky, swift and unblocked. The Eight of Wands heralds
        /// rapid progress, travel, or messages in motion—emails answered, plans finalized,
        /// romance accelerating.
        /// ```
        internal static var _8_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_8_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Stay nimble. Respond quickly, keep communication clear, and ride the surge while it
        /// lasts.
        /// ```
        internal static var _8_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_8_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, fatigue turns to paranoia or surrender. Wounds fester; defenses rigidify.
        /// ```
        internal static var _9_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_9_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Tend to healing, delegate burdens, and release grudges that sap strength.
        /// ```
        internal static var _9_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_9_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A weary warrior leans on his wand, bandaged yet vigilant. The Nine of Wands is
        /// resilience after trials—the last push before success. Experience has hardened you,
        /// but determination endures.
        /// ```
        internal static var _9_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_9_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Protect your progress. Rest briefly, then finish the mission; victory is near.
        /// ```
        internal static var _9_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_9_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, oppression breaks: either you collapse or finally drop what is not yours
        /// to carry.
        /// ```
        internal static var _10_of_wandsReversedMeaning: Wands {
            Wands(
                key: "_10_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Identify which obligations are self‑imposed. Lighten the load before burnout makes
        /// the choice for you.
        /// ```
        internal static var _10_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "_10_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A figure labors under ten heavy staves, vision obscured by the load. The Ten of
        /// Wands depicts responsibility turned to overload—success carried to an unsustainable
        /// extreme.
        /// ```
        internal static var _10_of_wandsUprightMeaning: Wands {
            Wands(
                key: "_10_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Prioritize and delegate. Finish essential tasks, then lay burdens down; the village
        /// is in sight.
        /// ```
        internal static var _10_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "_10_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// When reversed, the match sputters. Inspiration feels blocked, false starts exhaust
        /// you, or passion burns too quickly to light anything lasting. You may doubt your
        /// creative worth or struggle to channel scattered energy.
        /// ```
        internal static var ace_of_wandsReversedMeaning: Wands {
            Wands(
                key: "ace_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Clear space for new fire: finish lingering tasks, rest a fatigued body, and seek
        /// environments that kindle curiosity. A delayed spark is not a dead one—prepare the
        /// tinder and inspiration will return.
        /// ```
        internal static var ace_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "ace_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A hand thrusts a blazing wand from a gray cloud, symbolizing the raw spark of
        /// creation. The Ace of Wands is the divine match that lights ambition, passion, and
        /// spiritual vitality. It heralds a surge of inspiration: a business idea that wakes
        /// you at dawn, an artistic vision that tingles in your fingertips, a sudden yearning
        /// to travel or begin a romance. The landscape beneath—fertile yet unexplored—reminds
        /// you that potential requires cultivation. In love, expect chemistry that feels
        /// electric; in career, a project that sets your pulse racing; in personal growth, a
        /// fiery urge to live more boldly. The Ace is promise, not guarantee: it hands you the
        /// torch, but you must choose to run.
        /// ```
        internal static var ace_of_wandsUprightMeaning: Wands {
            Wands(
                key: "ace_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Seize the first moment of excitement and translate it into action. Draft the
        /// outline, make the call, book the class. Protect the flame from critics and
        /// procrastination until it gains steady heat.
        /// ```
        internal static var ace_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "ace_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, arrogance, impulsivity, or ruthlessness cloud leadership. Vision blurs
        /// into ego‑driven dominance.
        /// ```
        internal static var king_of_wandsReversedMeaning: Wands {
            Wands(
                key: "king_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Practice humble listening. Re‑align goals with collective benefit and rein in
        /// reckless impulses.
        /// ```
        internal static var king_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "king_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Crowned with a budding wand and dressed in salamander‑patterned robes, the King of
        /// Wands masters vision, entrepreneurship, and charismatic leadership. He sees the long
        /// game and inspires others to act boldly.
        /// ```
        internal static var king_of_wandsUprightMeaning: Wands {
            Wands(
                key: "king_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Claim the mantle of leadership. Articulate the grand plan, delegate skillfully, and
        /// maintain ethical passion.
        /// ```
        internal static var king_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "king_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the Knight becomes restless, reckless, or commitment‑averse. Starts
        /// abound; finishes are rare.
        /// ```
        internal static var knight_of_wandsReversedMeaning: Wands {
            Wands(
                key: "knight_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Channel excess energy into a single mission. Slow the tempo enough to honor promises
        /// and complete journeys.
        /// ```
        internal static var knight_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "knight_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Knight of Wands gallops on a fiery steed, armor adorned with salamanders. He
        /// embodies adventurous pursuit, charisma, and rapid action. Passion drives him toward
        /// conquest—creative, romantic, or geographic.
        /// ```
        internal static var knight_of_wandsUprightMeaning: Wands {
            Wands(
                key: "knight_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Strike while inspired, but keep one eye on long‑term consequences. Let passion lead
        /// without trampling prudence.
        /// ```
        internal static var knight_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "knight_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, immaturity, pessimism, or false starts dim the spark. Messages are delayed
        /// or overhyped.
        /// ```
        internal static var page_of_wandsReversedMeaning: Wands {
            Wands(
                key: "page_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Cultivate discipline, verify facts, and convert enthusiasm into consistent practice.
        /// ```
        internal static var page_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "page_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A youthful messenger admires his budding wand under a desert sky. The Page of Wands
        /// is enthusiastic news, exploration, and the first steps of a creative quest.
        /// Curiosity outweighs experience.
        /// ```
        internal static var page_of_wandsUprightMeaning: Wands {
            Wands(
                key: "page_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Approach learning with play. Say yes to new studies, travels, or flirtations that
        /// expand perspective.
        /// ```
        internal static var page_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "page_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, confidence wavers into insecurity or domineering behavior. The inner fire
        /// smolders or scorches.
        /// ```
        internal static var queen_of_wandsReversedMeaning: Wands {
            Wands(
                key: "queen_of_wands.reversed.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Recenter self‑worth internally. Temper pride with empathy and reignite passion
        /// through self‑care.
        /// ```
        internal static var queen_of_wandsReversedRecommendation: Wands {
            Wands(
                key: "queen_of_wands.reversed.recommendation",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Throne aflame, black cat at her feet, the Queen of Wands radiates confidence,
        /// warmth, and magnetic creativity. She balances introverted intuition with extroverted
        /// leadership, drawing admirers through authenticity.
        /// ```
        internal static var queen_of_wandsUprightMeaning: Wands {
            Wands(
                key: "queen_of_wands.upright.meaning",
                arguments: [],
                table: "Wands"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Lead by shining, not shouting. Share your vision openly, nurture others’ sparks, and
        /// trust your instincts.
        /// ```
        internal static var queen_of_wandsUprightRecommendation: Wands {
            Wands(
                key: "queen_of_wands.upright.recommendation",
                arguments: [],
                table: "Wands"
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

        internal static func ==(lhs: Wands, rhs: Wands) -> Bool {
            lhs._key == rhs._key && lhs.arguments == rhs.arguments && lhs.table == rhs.table
        }
    }

    internal init(wands: Wands, locale: Locale? = nil) {
        let key = String(describing: wands.key)
        self.init(
            format: wands.bundle.localizedString(forKey: key, value: nil, table: wands.table),
            locale: locale,
            arguments: wands.arguments.map(\.value)
        )
    }

    /// Creates a `String` that represents a localized value in the ‘Wands‘ strings table.
    internal static func wands(_ wands: String.Wands) -> String {
        String(wands: wands)
    }
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
extension LocalizedStringResource {
    internal init(wands: String.Wands) {
        self.init(
            wands.key,
            defaultValue: wands.defaultValue,
            table: wands.table,
            bundle: .atURL(wands.bundle.bundleURL)
        )
    }

    /// Creates a `LocalizedStringResource` that represents a localized value in the ‘Wands‘ strings table.
    internal static func wands(_ wands: String.Wands) -> LocalizedStringResource {
        LocalizedStringResource(wands: wands)
    }
}

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Text {
    /// Creates a text view that displays a localized string defined in the ‘Wands‘ strings table.
    internal init(wands: String.Wands) {
        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            self.init(LocalizedStringResource(wands: wands))
            return
        }

        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: wands.arguments.count)
        for argument in wands.arguments {
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
        key.overrideKeyForLookup(using: wands._key)

        self.init(key, tableName: wands.table, bundle: wands.bundle)
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LocalizedStringKey {
    /// Creates a localized string key that represents a localized value in the ‘Wands‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal init(wands: String.Wands) {
        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: 1)

        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            stringInterpolation.appendInterpolation(LocalizedStringResource(wands: wands))
        } else {
            stringInterpolation.appendInterpolation(Text(wands: wands))
        }

        let makeKey = LocalizedStringKey.init(stringInterpolation:)
        self = makeKey(stringInterpolation)
    }

    /// Creates a `LocalizedStringKey` that represents a localized value in the ‘Wands‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal static func wands(_ wands: String.Wands) -> LocalizedStringKey {
        LocalizedStringKey(wands: wands)
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
