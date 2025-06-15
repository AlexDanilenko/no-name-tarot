import Foundation

extension String {
    /// A type that represents localized strings from the ‘MajorArcana‘
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
    /// with the `String`.``Swift/String/init(majorArcana:locale:)``
    /// initializer:
    ///
    /// ```swift
    /// // Accessing the localized value directly
    /// let value = String(majorArcana: .deathReversedMeaning)
    /// value // "Reversed, you resist the scythe—clinging to expired circumstances out of fear. Stagnation and decay replace change."
    /// ```
    ///
    /// Starting in iOS 16/macOS 13/tvOS 16/watchOS 9, `LocalizedStringResource` can also
    /// be used:
    ///
    /// ```swift
    /// var resource = LocalizedStringResource(majorArcana: .deathReversedMeaning)
    /// resource.locale = Locale(identifier: "fr") // customise language
    /// let value = String(localized: resource)    // defer lookup
    /// ```
    ///
    /// ### SwiftUI
    ///
    /// In SwiftUI, it is recommended to use `Text`.``SwiftUI/Text/init(majorArcana:)``
    /// or `LocalizedStringKey`.``SwiftUI/LocalizedStringKey/majorArcana(_:)``
    /// in order for localized values to be resolved within the SwiftUI environment:
    ///
    /// ```swift
    /// var body: some View {
    ///     List {
    ///         Text(majorArcana: .listContent)
    ///     }
    ///     .navigationTitle(.majorArcana(.navigationTitle))
    ///     .environment(\.locale, Locale(identifier: "fr"))
    /// }
    /// ```
    ///
    /// - SeeAlso: [XCStrings Tool Documentation - Using the generated source code](https://swiftpackageindex.com/liamnichols/xcstrings-tool/1.2.0/documentation/documentation/using-the-generated-source-code)
    internal struct MajorArcana: Hashable, Sendable {
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
        /// Reversed, you resist the scythe—clinging to expired circumstances out of fear. Stagnation and decay replace change.
        /// ```
        internal static var deathReversedMeaning: MajorArcana {
            MajorArcana(
                key: "death.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Surrender gently. Trust that letting go frees energy for healthier beginnings and prevents prolonged struggle.
        /// ```
        internal static var deathReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "death.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Death rides the white horse, banner of the rose raised high. Upright, he brings unavoidable endings that clear soil for new growth. Transformation, release, and rebirth follow. Relationships evolve, careers shift, identities shed.
        /// ```
        internal static var deathUprightMeaning: MajorArcana {
            MajorArcana(
                key: "death.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Embrace the ending. Mourn what passes, then look for emerging shoots of possibility. Life renews when space is made.
        /// ```
        internal static var deathUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "death.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, doubt muffles the trumpet. Avoidance of accountability or fear of change stalls evolution.
        /// ```
        internal static var judgementReversedMeaning: MajorArcana {
            MajorArcana(
                key: "judgement.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Face lessons directly, practice self‑compassion, and choose growth over stagnation.
        /// ```
        internal static var judgementReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "judgement.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Angels sound the trumpet and figures rise from coffins. Judgement calls for awakening, forgiveness, and decisive transition to a higher phase. Past actions culminate; self‑evaluation is required.
        /// ```
        internal static var judgementUprightMeaning: MajorArcana {
            MajorArcana(
                key: "judgement.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reflect honestly, own your story, release guilt, and answer the call to evolve. The next chapter awaits.
        /// ```
        internal static var judgementUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "judgement.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, Justice signals dishonesty, bias, or avoidance of responsibility. Outcomes may feel unfair or delayed.
        /// ```
        internal static var justiceReversedMeaning: MajorArcana {
            MajorArcana(
                key: "justice.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Face truth, correct wrongs, and advocate for fairness even if uncomfortable. Accountability is the path to restoration.
        /// ```
        internal static var justiceReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "justice.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Justice sits with scales in one hand and a sword in the other, embodying truth, accountability, and karmic balance. Upright, decisions are weighed fairly, contracts honored, and integrity rewarded. Legal matters, relationship dynamics, or personal ethics come to the forefront.
        /// ```
        internal static var justiceUprightMeaning: MajorArcana {
            MajorArcana(
                key: "justice.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Act transparently, own consequences, and seek equitable solutions. Let facts guide, and rectify imbalances compassionately.
        /// ```
        internal static var justiceUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "justice.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, Strength falters into self‑doubt, repressed anger, or dominance by impulse. Confidence shakes, and reactions overpower responses.
        /// ```
        internal static var strengthReversedMeaning: MajorArcana {
            MajorArcana(
                key: "strength.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Cultivate inner calm through breath, support, or therapy. Small acts of brave authenticity rebuild trust in your own power.
        /// ```
        internal static var strengthReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "strength.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A maiden gently closes a lion’s jaws under the sign of infinity. Strength embodies quiet courage, compassion, and mastery of instinct. Upright, it signals resilience gained through patience, not brute force. In love it brings healing intimacy; at work it encourages diplomatic leadership; spiritually it teaches self‑acceptance.
        /// ```
        internal static var strengthUprightMeaning: MajorArcana {
            MajorArcana(
                key: "strength.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Lead with kindness. Channel passions constructively, practice forgiveness, and remember that softness can tame the fiercest fears.
        /// ```
        internal static var strengthUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "strength.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, imbalance surfaces: excess, impatience, or clashing elements disrupt flow and health.
        /// ```
        internal static var temperanceReversedMeaning: MajorArcana {
            MajorArcana(
                key: "temperance.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Step back, reassess proportions, and make deliberate adjustments to restore equilibrium.
        /// ```
        internal static var temperanceReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "temperance.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// An angel pours water between golden cups, one foot on land, one in water. Temperance signifies harmony, healing, and artful blending. Opposites merge into synergy; moderation prevails.
        /// ```
        internal static var temperanceUprightMeaning: MajorArcana {
            MajorArcana(
                key: "temperance.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Integrate extremes. Practice patience, balance work with rest, and allow gradual progress to weave sustainable results.
        /// ```
        internal static var temperanceUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "temperance.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, The Chariot loses traction. Lack of control, aggression, or scattered goals cause stall or crash. Motivation wavers or force backfires.
        /// ```
        internal static var the_chariotReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_chariot.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Pause to realign objectives, moderate ego, and ensure opposing impulses work together. Then resume the journey deliberately.
        /// ```
        internal static var the_chariotReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_chariot.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Charioteer stands armored beneath a starry canopy, reins invisible as black and white sphinxes pull forward. Upright, this card proclaims willpower, victory, and disciplined momentum. Conflicting forces are harnessed toward a single aim. In love it means steering the relationship with clarity; in work it heralds promotions or successful launches; personally it demands self‑mastery.
        /// ```
        internal static var the_chariotUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_chariot.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Set a definite destination and drive forward with focus. Maintain emotional control and align actions to purpose—distractions will test resolve.
        /// ```
        internal static var the_chariotUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_chariot.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the chains loosen. Liberation from destructive patterns or awakening to hidden control becomes possible.
        /// ```
        internal static var the_devilReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_devil.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Commit to the path of freedom. Seek support, substitute nurturing habits, and celebrate incremental victories.
        /// ```
        internal static var the_devilReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_devil.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Devil presides over chained lovers, symbolizing bondage to desire, addiction, and limiting beliefs. Upright, he reveals where you feel trapped by fear or material obsession and invites honest recognition of shadow.
        /// ```
        internal static var the_devilUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_devil.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Name your chains. Acknowledge compulsions and reclaim power through conscious choice and healthy boundaries.
        /// ```
        internal static var the_devilUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_devil.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the Emperor becomes tyrant or absent ruler. Rigidity, power abuse, or abdication breeds chaos. A situation lacks discipline or is constrained by authoritarian forces.
        /// ```
        internal static var the_emperorReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_emperor.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Balance firmness with empathy. Release excessive control, or reclaim lost responsibility. Structure should serve life, not stifle it.
        /// ```
        internal static var the_emperorReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_emperor.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Armored and enthroned on a barren mountain, the Emperor embodies authority, logic, and structural power. Upright, he brings order, protection, and strategic leadership. He favors concrete plans, stable foundations, and disciplined action. In love he signals commitment based on mutual respect; in career he supports management roles or ambitious enterprises; personally he teaches sovereignty over one’s domain.
        /// ```
        internal static var the_emperorUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_emperor.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Set clear rules and long‑term goals. Use reason over impulse, and defend your boundaries while leading others with fairness.
        /// ```
        internal static var the_emperorUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_emperor.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the Empress withholds her bounty. Creative blocks, neglect, or over‑mothering drain vitality. Dependence or self‑denial upsets natural flow, leaving the garden untended.
        /// ```
        internal static var the_empressReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_empress.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Restore balance by prioritizing self‑care and healthy boundaries. Reconnect with nature, sensuality, and art to reopen creative channels.
        /// ```
        internal static var the_empressReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_empress.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Seated amidst wheat and flowing water, crowned with stars, the Empress radiates fertility, sensuality, and maternal abundance. Upright, she blesses projects with growth and relationships with nurturing love. She invites pleasure, creativity, and connection to nature. In business she forecasts profitable harvests; in health she encourages holistic self‑care; spiritually she grounds you in the sacred body.
        /// ```
        internal static var the_empressUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_empress.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Nurture what you wish to see thrive. Feed your body nourishing experiences, tend projects patiently, and allow yourself to receive as generously as you give.
        /// ```
        internal static var the_empressUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_empress.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, The Fool stumbles. Either you leap without looking—courting chaos—or refuse to leave the ledge at all. Naivety, avoidance of responsibility, or fear of the unknown may be at play. Plans lack grounding; red flags are waved off. The adventure stalls or becomes folly when awareness and preparation are absent.
        /// ```
        internal static var the_foolReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_fool.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Anchor enthusiasm with mindfulness. Check resources, outline a loose plan, and face fears directly. Balance risk with realism so the journey can unfold safely.
        /// ```
        internal static var the_foolReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_fool.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Fool is the sacred zero, the traveller stepping off the cliff with a white rose of innocence and a tiny pack of faith. His eyes are on the sky, trusting the path to appear beneath his feet. Upright, he heralds a clean slate, a surge of possibility, and the courage to meet life with wonder. In love he opens the heart to unexpected connections; at work he sparks start‑ups and bold career shifts; in personal growth he asks you to dismantle limiting stories and play. The Fool reminds you that wisdom grows after the first step, not before it, and that life rewards those who dare to begin.
        /// ```
        internal static var the_foolUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_fool.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Say yes. Pack lightly, name your dream aloud, and move before doubt settles. Accept that missteps are tuition, not failure. Trust instinct over guarantee, and let curiosity lead.
        /// ```
        internal static var the_foolUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_fool.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, stagnation lacks purpose. You may cling to victimhood, resist surrender, or sacrifice needlessly without reward.
        /// ```
        internal static var the_hanged_manReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_hanged_man.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Decide: move forward or let go authentically. End fruitless martyrdom and choose purposeful action or honest release.
        /// ```
        internal static var the_hanged_manReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_hanged_man.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Hung upside‑down by one foot, halo aglow, the Hanged Man surrenders willingly to gain new perspective. Upright, he heralds suspension, sacrifice, and enlightenment through letting go. Progress pauses so insight can emerge.
        /// ```
        internal static var the_hanged_manUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_hanged_man.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Release control, accept temporary limbo, and view the situation from a fresh angle. Patience now seeds future clarity.
        /// ```
        internal static var the_hanged_manUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_hanged_man.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, solitude becomes isolation. Advice is ignored, or fear keeps you withdrawn. Alternatively, you may avoid necessary self‑reflection by clinging to company.
        /// ```
        internal static var the_hermitReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_hermit.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Seek balanced connection—either reach out for support or reclaim quiet space. Let wisdom flow between inner and outer life.
        /// ```
        internal static var the_hermitReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_hermit.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Clad in gray, lantern held high, the Hermit climbs a solitary peak seeking inner light. Upright, he calls for introspection, retreat, and wisdom gained in silence. Relationships may need pause; career decisions benefit from research; personal growth comes through meditation and honest self‑inquiry.
        /// ```
        internal static var the_hermitUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_hermit.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Step back from noise, consult your inner guide, and trust the answers found in stillness before re‑engaging the world.
        /// ```
        internal static var the_hermitUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_hermit.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the Hierophant challenges outdated dogma or stifling conformity. Rebellion, unconventional paths, or spiritual doubt arise when external rules override inner wisdom.
        /// ```
        internal static var the_hierophantReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_hierophant.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Examine traditions critically. Keep rituals that nourish your soul, release those that confine, and craft practices that reflect authentic values.
        /// ```
        internal static var the_hierophantReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_hierophant.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Hierophant sits between stone pillars, hand raised in blessing, keys of heaven at his feet. He represents tradition, spiritual lineage, and communal wisdom. Upright, he encourages learning from mentors, honoring rituals, and engaging in institutions that preserve shared values. Love may progress toward formal commitment; career benefits from certification or adherence to best practices; inner growth comes through disciplined study and ethical frameworks.
        /// ```
        internal static var the_hierophantUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_hierophant.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Seek guidance from trusted teachers, participate in meaningful ceremony, and respect proven methods while adapting them to your truth.
        /// ```
        internal static var the_hierophantUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_hierophant.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the veil stays shut. You ignore intuition, overshare secrets, or cling to superficial data. Mistrust, hidden agendas, or self‑deception cloud perception, stalling progress.
        /// ```
        internal static var the_high_priestessReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_high_priestess.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Re‑enter stillness. Discern which voices are yours and which are fear. Guard sensitive plans, and honor the timing of inner truth before external action.
        /// ```
        internal static var the_high_priestessReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_high_priestess.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Veiled in moonlight between the black and white pillars, the High Priestess guards the scroll of esoteric knowledge. Upright, she invites you to trust intuition over intellect, to listen to dreams, symbols, and gut whispers. Hidden information is gestating; spiritual insight arrives in silence. In relationships she signals soulful bonds and unspoken truths; in work she points to research, strategy, or waiting for the right moment; inner growth unfolds through meditation and shadow work.
        /// ```
        internal static var the_high_priestessUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_high_priestess.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Withdraw from noise. Journal dreams, consult oracles, and keep counsel private. Let answers surface organically—forcing clarity now would dim the revelation.
        /// ```
        internal static var the_high_priestessUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_high_priestess.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, discord appears: misaligned values, temptation, or avoidance of responsibility. Internal conflict can manifest as relationship tension or poor decisions.
        /// ```
        internal static var the_loversReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_lovers.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Identify fractures honestly. Reconcile inner contradictions, engage in truthful dialogue, and delay commitments until harmony is restored.
        /// ```
        internal static var the_loversReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_lovers.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Under the angel’s gaze, Adam and Eve face one another, mountains and sun behind them. The Lovers speak of union, choice, and harmony between inner opposites. Upright, the card heralds aligned relationships, ethical decisions, and commitments made from the heart. In romance it marks soulful partnership; in career it signals projects requiring collaboration; spiritually it calls for integrating head and heart.
        /// ```
        internal static var the_loversUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_lovers.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Choose with authenticity. Communicate desires openly, honor shared values, and align actions with love’s highest good.
        /// ```
        internal static var the_loversUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_lovers.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// In reverse, the Magician’s altar becomes a stage for illusion. Power disperses through half‑hearted plans, deception, or vanity. Skills are wasted or wielded manipulatively. Opportunities slip when intention and action misalign.
        /// ```
        internal static var the_magicianReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_magician.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Strip away showmanship and return to purpose. Close unfinished tasks, ground ideas in a practical roadmap, and practice transparent communication—first with yourself, then others.
        /// ```
        internal static var the_magicianReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_magician.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Magician stands beneath the lemniscate, one hand toward the heavens, the other toward earth, channeling idea into matter. Wand, cup, sword, and pentacle lie ready: proof that all elements obey focused will. Upright, he signals mastery, manifestation, and charisma. In love he sparks magnetic attraction; in career he promises a breakthrough when vision meets skilled execution; spiritually he reveals that the universe is not separate from you—you are its co‑creator. Everything needed is within reach; only deliberate intent is required.
        /// ```
        internal static var the_magicianUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_magician.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Define one clear objective, gather essential tools, and act. Speak intentions like spells, then move immediately. Guard focus; talent joined with integrity turns vision into reality.
        /// ```
        internal static var the_magicianUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_magician.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, illusions lift or deepen. Fears may be released, secrets revealed, or confusion heightened by denial.
        /// ```
        internal static var the_moonReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_moon.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ground yourself in factual checkpoints, seek counsel, and differentiate projection from reality before deciding.
        /// ```
        internal static var the_moonReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_moon.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The Moon’s pale light reveals a winding path between dog and wolf. Upright, it evokes intuition, dreams, and emotional tides. Illusion and shadow blend with insight, requiring navigation by feeling.
        /// ```
        internal static var the_moonUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_moon.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Trust instincts, track dreams, and proceed gently through uncertainty. Clarity will emerge with patience.
        /// ```
        internal static var the_moonUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_moon.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, discouragement dims the Star. Cynicism, fatigue, or loss of faith cloud vision and block intuition.
        /// ```
        internal static var the_starReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_star.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Tend your inner flame with rest, supportive community, and small acts of wonder to reignite optimism.
        /// ```
        internal static var the_starReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_star.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Under a crystal sky, a maiden pours water upon land and pool. The Star brings hope, inspiration, and spiritual renewal after turmoil. It realigns you with purpose and cosmic guidance.
        /// ```
        internal static var the_starUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_star.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Dream boldly, practice gratitude, and share your light. Healing and creative flow return when you trust the larger plan.
        /// ```
        internal static var the_starUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_star.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, clouds momentarily cover the Sun: delays, self‑doubt, or hidden pride may dim joy.
        /// ```
        internal static var the_sunReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_sun.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Identify obstacles to warmth—internal or external—and clear them. Remember that the Sun’s essence is always present.
        /// ```
        internal static var the_sunReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_sun.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// A joyful child rides a white horse beneath a radiant sun. Upright, this card heralds success, vitality, and unfiltered happiness. Illumination banishes doubt; everything grows in the light.
        /// ```
        internal static var the_sunUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_sun.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Celebrate achievements openly, pursue goals with confidence, and share optimism—it multiplies under the Sun.
        /// ```
        internal static var the_sunUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_sun.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, you may narrowly avoid disaster or prolong crisis by resisting necessary change. Foundations remain shaky.
        /// ```
        internal static var the_towerReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_tower.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Initiate honest restructuring before external forces do it for you. Proactive change lessens upheaval.
        /// ```
        internal static var the_towerReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_tower.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Lightning strikes the crowned tower, ejecting figures into the storm. Upright, this card signals sudden upheaval, shocking truth, and the collapse of false structures. Though disruptive, it clears the way for authenticity.
        /// ```
        internal static var the_towerUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_tower.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Let crumble what cannot stand. Face reality, release attachment to illusion, and salvage only what is true.
        /// ```
        internal static var the_towerUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_tower.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, closure eludes you: unfinished tasks, delays, or reluctance to leave comfort keep the circle open.
        /// ```
        internal static var the_worldReversedMeaning: MajorArcana {
            MajorArcana(
                key: "the_world.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Tie up loose ends, seek completion, and step boldly into new territory once wholeness is achieved.
        /// ```
        internal static var the_worldReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "the_world.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Encircled by a laurel wreath, the dancer completes the journey begun by the Fool. The World signifies fulfillment, integration, and global perspective. A major cycle closes with harmony.
        /// ```
        internal static var the_worldUprightMeaning: MajorArcana {
            MajorArcana(
                key: "the_world.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Celebrate milestones, share wisdom gained, and rest before embarking on the next spiral of growth.
        /// ```
        internal static var the_worldUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "the_world.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Reversed, the Wheel sticks. Bad timing, resistance, or feeling victim to fate causes frustration. Lessons may be repeating.
        /// ```
        internal static var wheel_of_fortuneReversedMeaning: MajorArcana {
            MajorArcana(
                key: "wheel_of_fortune.reversed.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Identify patterns, adjust strategy, and release control. Patience and perspective reset the gears of progress.
        /// ```
        internal static var wheel_of_fortuneReversedRecommendation: MajorArcana {
            MajorArcana(
                key: "wheel_of_fortune.reversed.recommendation",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// The great Wheel turns, crowned by a sphinx, flanked by alchemical beasts. Upright, it announces cycles, destiny, and sudden shifts of fortune. External events accelerate; synchronicities multiply. In love and work, change brings fresh opportunity or closure; spiritually it reminds you of the eternal ebb and flow.
        /// ```
        internal static var wheel_of_fortuneUprightMeaning: MajorArcana {
            MajorArcana(
                key: "wheel_of_fortune.upright.meaning",
                arguments: [],
                table: "MajorArcana"
            )
        }

        /// ### Source Localization
        ///
        /// ```
        /// Ride momentum with flexibility. Plant good intentions, stay alert to openings, and trust the rhythm of timing.
        /// ```
        internal static var wheel_of_fortuneUprightRecommendation: MajorArcana {
            MajorArcana(
                key: "wheel_of_fortune.upright.recommendation",
                arguments: [],
                table: "MajorArcana"
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

        internal static func ==(lhs: MajorArcana, rhs: MajorArcana) -> Bool {
            lhs._key == rhs._key && lhs.arguments == rhs.arguments && lhs.table == rhs.table
        }
    }

    internal init(majorArcana: MajorArcana, locale: Locale? = nil) {
        let key = String(describing: majorArcana.key)
        self.init(
            format: majorArcana.bundle.localizedString(forKey: key, value: nil, table: majorArcana.table),
            locale: locale,
            arguments: majorArcana.arguments.map(\.value)
        )
    }

    /// Creates a `String` that represents a localized value in the ‘MajorArcana‘ strings table.
    internal static func majorArcana(_ majorArcana: String.MajorArcana) -> String {
        String(majorArcana: majorArcana)
    }
}

@available(macOS 13, iOS 16, tvOS 16, watchOS 9, *)
extension LocalizedStringResource {
    internal init(majorArcana: String.MajorArcana) {
        self.init(
            majorArcana.key,
            defaultValue: majorArcana.defaultValue,
            table: majorArcana.table,
            bundle: .atURL(majorArcana.bundle.bundleURL)
        )
    }

    /// Creates a `LocalizedStringResource` that represents a localized value in the ‘MajorArcana‘ strings table.
    internal static func majorArcana(_ majorArcana: String.MajorArcana) -> LocalizedStringResource {
        LocalizedStringResource(majorArcana: majorArcana)
    }
}

#if canImport(SwiftUI)
import SwiftUI

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Text {
    /// Creates a text view that displays a localized string defined in the ‘MajorArcana‘ strings table.
    internal init(majorArcana: String.MajorArcana) {
        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            self.init(LocalizedStringResource(majorArcana: majorArcana))
            return
        }

        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: majorArcana.arguments.count)
        for argument in majorArcana.arguments {
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
        key.overrideKeyForLookup(using: majorArcana._key)

        self.init(key, tableName: majorArcana.table, bundle: majorArcana.bundle)
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension LocalizedStringKey {
    /// Creates a localized string key that represents a localized value in the ‘MajorArcana‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal init(majorArcana: String.MajorArcana) {
        var stringInterpolation = LocalizedStringKey.StringInterpolation(literalCapacity: 0, interpolationCount: 1)

        if #available(macOS 13, iOS 16, tvOS 16, watchOS 9, *) {
            stringInterpolation.appendInterpolation(LocalizedStringResource(majorArcana: majorArcana))
        } else {
            stringInterpolation.appendInterpolation(Text(majorArcana: majorArcana))
        }

        let makeKey = LocalizedStringKey.init(stringInterpolation:)
        self = makeKey(stringInterpolation)
    }

    /// Creates a `LocalizedStringKey` that represents a localized value in the ‘MajorArcana‘ strings table.
    @available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
    internal static func majorArcana(_ majorArcana: String.MajorArcana) -> LocalizedStringKey {
        LocalizedStringKey(majorArcana: majorArcana)
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
