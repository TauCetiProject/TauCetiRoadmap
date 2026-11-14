# Notes on the InfinityCategoryFoundations draft (Linear-Firm)

1. **§10.2 Needs.** ALT2-STRUCTURE.md §2.2 cites "§3.3 (HTT 2.1.2.6)" for the prism filtration; HTT 2.1.2.6 lives in
   §3.2. Statement (a) also needs §4.2 (slices along an inner fibration, dual form) and §3.1 (reflection and lifting of
   equivalences along right fibrations), not only §5.1. The README states (a) as a relative lifting problem (square
   with `Λ[n,0] → C`, `Δ[n] → D`). The prism form (b) fills its last horn with the absolute outer-horn theorem (the
   filler lies over Δ[n] automatically); (a) is the plan's general statement; its consumer is the HTT 2.4.6.5 statement at the end of §10.2.
2. **§10.2 (b) route.** ALT2 says to pull the last horn back to Δⁿ⁺¹. Over Δⁿ⁺¹ the first edge lies over the
   nondegenerate edge 0 → 1, so it is not an equivalence of the pullback and (a) does not apply. The README pulls back
   along σ : Δⁿ → S instead, where the edge lies in a fiber.
3. **Joyal-fibrancy (HTT 2.4.6.1) and HTT 2.4.6.5 live in this Part.** §9.5 states Joyal's theorem with HTT's
   route (Lemma 2.4.5.1 in slice form for finite K, Lemmas 2.4.6.2–2.4.6.4) unpacked on inputs of Layers 2–9, so
   the restriction-map clause of Cartesian closedness and the second Layer 9 Example are proved here. Step 2 avoids
   HTT's appeal to Prop. 1.2.9.3 (second assertion, proved in HTT through Cor. 2.4.4.4, coCartesian fibrations): it
   needs only that h₀ is equivalent in `D_{/pf₀}` to the image of a vertex of `C_{/f₀}`, which follows from
   essential surjectivity, lifting of equivalences along the right fibration `D_{/pf₀} → D`, and step 1. HTT 2.4.6.5
   is stated at the end of §10.2, after the relative outer-horn lemma that its sufficiency route needs; its
   necessity uses the fiber of evaluation at 0 on `Fun(Δ[1], D^≃)` instead of HTT's unspecified contractible Kan
   complex. CartesianFibrations §3.3 should cite both (CROSS).
4. **§10.7.** "(−2)-truncated ⇔ equivalence" is routed through Yoneda in hC (§2.3, §8.1), not through slices. It cites
   §10.1 (truncated objects), which final_plan.json's cites for 9.6 omit.
5. **§10.6.** HTT Def. 2.3.4.15 overlaps KanQuillen §5.1. It is written as KanQuillen's notion extended to k = −2,
   not as a second definition.
6. **§7.7 / §7.1.** The universal right fibration is `(Sᵒᵖ)_{/∗} → Sᵒᵖ`. Statement (3) gives the
   zigzag of pointwise equivalences that §7.1 uses for "classifies". The draft cites no HTT Def. 3.3.2.2.
7. **Suggested.lean (2026-11-12).** 73 theorems and 39 definitions, elaborated against Mathlib 1b1ccf4 and Tau Ceti
   main bb8823c with only `sorry` warnings. It merges the old InfinityCategoryFoundations file with the Definitions-file material
   this Part now owns (Layer 1 limit vocabulary, `Kan`, `spaces`, `HomotopicRelBoundary`, `IsNCategory`) and adds the
   statable headlines that were not stated before. Formalization choices worth a look:
   - Categorical equivalences are Joyal's form `IsCategoricalEquivalence` (restriction on `h Fun(−, C)`), as the
     CartesianFibrations Conventions already assume; HTT's form needs `C[−]`. The agreement (HTT, Props. 2.2.5.7
     and 2.2.5.8) is README §9.7, after Joyal's theorem; it was moved here from CartesianFibrations §3.4, which
     now cites §9.7 (as do the LimitsAndKanExtensions and Straightening citations of it). The forward direction of
     2.2.5.8 is routed through §9.3 and 2.2.5.7 directly, not through HTT, Prop. 1.2.7.3, which stays in
     CartesianFibrations §3.4.
   - The Joyal, covariant and contravariant model structures are stated through their two weak factorization systems;
     covariant/contravariant classes live on Mathlib's `Over S`, contravariant equivalences through `Over.post opFunctor`.
   - `Sᵒᵖ` is the opposite simplicial set of `spaces`, not `N(Kanᵒᵖ)` (no opposite simplicial-category instance is
     used); the universal right fibration is the opposite of the coslice projection `S_{∗/} → S`, the vertex ∗ is
     `spacesPoint`, built through `SimplicialNerve.fromNerve`. Classification uses `Relation.EqvGen` for the zigzag, each step between two right (left) fibrations: without
     that condition, a discrete simplicial set over Δ[1] would join non-equivalent right fibrations.
   - `exists_classifies`/`exists_classifiesLeft` take K and X in `SSet.{u+1}` with `Small.{u}` hypotheses on every
     degree, instead of lifting a small base along `SSet.uliftFunctor` (statement hygiene: no `ULift` in
     signatures). The lift was not needed: maps into `Sᵒᵖ` force the base into `SSet.{u+1}`, and smallness is a
     hypothesis there.
   - `IsTruncated` copies KanQuillen's ℕ-indexed definition, so §10.8 is stated for k ≥ 0 only, and
     `exists_isNCategory_iff_isTruncated` (HTT 2.3.4.18, (2) ⇔ (3)) for HTT's n ≥ 1, with `Hom^R` as mapping
     spaces and their Kan instances taken as an instance argument; the minimal-model clause is not stated.
   - Added 2026-11-12: the prism form `exists_extension_unionProd_of_isEquivalence` and the relative pointwise
     criterion `isEquivalence_fiber_pullbackObjObjπ_iff` (§10.2).
   - Statable but not stated (definitions only, or too long for the gain): Hom^L and Hom of §5.2, homotopic morphisms
     (§2.3), essential surjectivity (§2.4), the skeletal criterion (§10.6), truncated objects (§10.1).

## Needs Tau Ceti pin bump

Suggested.lean uses these Tau Ceti modules and names that exist on main (bb8823c) but not at the roadmap pin 2fd255d:

- Modules: `TauCeti.AlgebraicTopology.Quasicategory.InitialVertex`, `…Quasicategory.Limit`,
  `…Quasicategory.TerminalVertex`, `…SimplicialNerve.Basic`, `…SimplicialSet.AnodyneExtensions.LeftRight.Basic`,
  `…SimplicialSet.Fiber`, `…SimplicialSet.WeakHomotopyEquivalence`.
- Names: `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.leftFibrations`, `SSet.leftAnodyneExtensions`,
  `SSet.rightAnodyneExtensions`, `SSet.IsTerminalVertex`, `SSet.IsInitialVertex`, `SSet.slice.IsLimit`,
  `SSet.coslice.IsColimit`, `SSet.coslice.map`, `SSet.coslice.map_comp`, `SSet.fiber`, `SSet.kanComplex_of_isTerminal`,
  `SSet.IsWeakHomotopyEquivalence`, `CategoryTheory.simplicialNerveMap`, `CategoryTheory.SimplicialNerve.fromNerve`.
