# Notes on the AccessibleInfinityCategories draft (Linear-Firm)

1. **HTT 3.3.1.7 over an arbitrary base in §6.1 and Layer 8.** `final_plan.json` resolves some 3.3.1.7 citations
   to CartesianFibrations §7.4, which covers only ∞-category bases and their pullbacks. Where the base is an
   arbitrary small simplicial set, the README cites Part Straightening §2.3 (the general form, earlier in the
   order). §8.7, whose base is Δ[1], keeps CartesianFibrations §7.4.
2. **Mislabelled cites in the plan data, corrected by label in the README:**
   - 2.3: HTT 5.2.3.5 and 5.2.4.2 are AdjunctionsAndLocalizations §1.4 and §1.5, not PresheavesAndCompletions.
   - 3.2: HTT 4.2.4.1 is LimitsAndKanExtensions §3.2, not §7.6. HTT 4.1.2.15 is LimitsAndKanExtensions §5.2,
     not PresheavesAndCompletions §4.4.
   - 3.1 and 4.4: HTT 5.3.1.18 is PresheavesAndCompletions §4.3, not §6.1.
3. **Classification.** For the right and left fibrations of §3.2, §5.5 and §8.3, the README uses the
   classification through the universal right fibration (InfinityCategoryFoundations §7.1, §7.7), and Straightening §2.5
   for agreement with the `Z`/`Cat∞` reading, which §8.3 needs to apply §8.1. §8.1, §8.7 and §8.9 keep HTT
   Def. 3.3.2.2 (Straightening §2.1), since they concern coCartesian fibrations.
4. **No consumers.** No later Part in the plan cites §8.1–8.3 (HA 5.2.2.36–39). They stay as planned.
5. **`Suggested.lean` (2026-11-12).** States 11 theorems and 8 definitions (3 repeated: `IsCategoricalEquivalence`
   from Part InfinityCategoryFoundations §2.1, `sectionsRestrict` and `IsCofinal` from Part LimitsAndKanExtensions §2.1, same
   bodies as that Part's file; re-check if those Parts change). Targets: HTT Lemma 5.4.5.3 (§1.1), Prop. 5.4.1.2
   (3) ⇔ (4) (§3.1), Prop. 5.4.1.7 and Example 5.4.1.8 (§4.2), Def. 5.4.5.8, Example 5.4.5.9, Lemmas 5.4.6.4,
   5.4.5.11, 5.4.5.12 (§6.4) and Lemma 5.4.5.14 (§6.5). The case κ = κ' of HTT Lemma 5.4.2.8 was dropped from the
   Lean file as a boundary case; the README keeps it because Part PresentableInfinityCategories §1.3 cites it for κ = τ.
   `HasCardinalFilteredColimits` ("admits small κ-filtered colimits", small = `Small.{w}` nondegenerate
   simplices, w the cardinal's universe, so C may be large) is defined here; if Part PresheavesAndCompletions
   defines the same notion, this file should repeat its name and body instead.
6. **HTT Lemma 5.4.5.11 (1).** HTT assumes p only κ-small; false for κ > τ (N(ℕ), κ = ℵ₁, τ = ω, f = p = 𝟙:
   `I_{p/}` empty). README and Lean assume p τ-small instead (the route never uses κ-smallness; a κ-small p is
   τ-small for κ ≤ τ; all uses have K = Δ[0] or κ < τ).
   HTT's proof also applies Lemma 5.4.5.10 to a non-weakly-contractible `K'`; the README route avoids it.
7. **README names.** No "planned declaration" names remain; backticked names of this Part are those
   `Suggested.lean` declares. `isLimit_of_rightAdjointable_conservative` and the other unstatable names were
   dropped from README and docstring.

## Needs Tau Ceti pin bump

The wrapper elaborates against Tau Ceti main (bb8823c); these names used by `Suggested.lean` are not at 2fd255d:

- modules `TauCeti.AlgebraicTopology.Quasicategory.{CategoricalEquivalence, CategoricalFibration, Limit}` and
  `TauCeti.AlgebraicTopology.SimplicialSet.{AnodyneExtensions.LeftRight.Basic, Fiber, InternalHom,
  WeakHomotopyEquivalence}`;
- `SSet.QCat.IsCategoricalEquivalence`, `SSet.CategoricalFibration`, `SSet.coslice.IsColimit`, `SSet.coslice.map`,
  `SSet.fiber`, `SSet.RightFibration`, `SSet.ihomOver` (with `SSet.ihomOver.homEquiv`),
  `SSet.IsWeakHomotopyEquivalence`.

The README also cites, as Tau Ceti at the pin, `SSet.LeftFibration`, `SSet.catInfty` and `SSet.slice.IsLimit`,
which exist only on main (as do `SSet.QCat.IsCategoricalEquivalence`, `SSet.CategoricalFibration`,
`SSet.coslice.IsColimit`, `SSet.RightFibration`). All README Mathlib and Tau Ceti names exist on main.
