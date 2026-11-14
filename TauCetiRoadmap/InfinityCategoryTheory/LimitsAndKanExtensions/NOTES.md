# Drafting notes: LimitsAndKanExtensions (Linear-Firm)

1. **§4.1 and the plan.** HTT, Cor. 3.3.2.8 (classification of left fibrations) is stated once, in Part
   InfinityCategoryFoundations §7.7 (4), and cited from here; the plan's label HTT.3.3.2.8 under §4.1 should move to
   InfinityCategoryFoundations §7.7. §4.1 is titled "Representability of the universal right fibration, and unstraightened
   functors": it keeps HTT 3.3.2.7 and states that `Un_K(F)` is classified by the adjoint of F (no HTT locator; the
   base-change step of the route of InfinityCategoryFoundations §7.7 (3)), which §8.2 needs.
2. **Restated hypotheses.** Per GATEWAYS §3, §1.5 (HTT 4.2.2.4), §1.6 (4.2.2.7) and §8.1 (5.1.2.1–5.1.2.2)
   carry the added hypothesis "q is a categorical fibration". Step 1 of §1.5 uses inner anodyne base change over
   any base (CartesianFibrations §7.1).
4. **Lean names.** `Suggested.lean` keeps every name of the old LimitsAndCofinality and KanExtensions files and
   adds `isCofinal_of_isCategoricalEquivalence` (§2.6), `exists_isColimit_spaces` (§3.3),
   `exists_isLimit_spaces` (§3.7), `exists_isLimit_catInfty`, `exists_isColimit_catInfty` (§3.8),
   `isCofinal_comp_iff_of_isCategoricalEquivalence` (§4.4), `isCofinal_iff_rlp_monomorphisms` (§4.5),
   `exists_isCofinal_nerve_elements_op` (§6.4), `exists_isColimit_ihom`,
   `isColimit_iff_forall_isColimit_evalAt`, `exists_isColimit_presheaf`, `exists_isLimit_presheaf` (§8.2), and the
   definitions `IsRelativeColimit` (body now `(monomorphisms SSet).rlp`, the README's "trivial fibration"),
   `presheaf`, `simplicialObjects`, `augmentedSimplicialObjects` from old Definitions. The README now says
   "`Suggested.lean` declaration(s)" for all of them; "proposed" and "is to state" are gone.
   Repeated from Part InfinityCategoryFoundations with the old InfinityCategoryFoundations/Definitions bodies: `IsCategoricalEquivalence`
   (Joyal form), `Kan`, `spaces`, and (sim-firm R01) `spacesPoint`, `universalLeftFibration`, `IsPointwiseEquivalence`, `ClassifiesLeft`
   for `isColimit_iff_isWeakHomotopyEquivalence` (§8.3). Evaluation at a vertex is Tau Ceti's `SSet.evalAt` (sim-firm R03). If that Part's new `Suggested.lean` changes the name or body, re-sync here.
   Large targets (`spaces`, `catInfty`, `presheaf`) take diagrams `K : SSet.{u+1}` with `Small.{u}` simplices
   (no `ULift` in signatures).
5. **Labels.** GATEWAYS' Corollary 5 is §2.6 and Theorem 6′ is §4.2 ("Colimit-preserving maps are cofinal"); the README
   uses no numbered labels, matching CartesianFibrations.
6. **§7.6 pointwise form.** Stated for functors of ∞-categories only (Kerodon 7.3.2.11's hypothesis). The comparison
   `M^op(δ) ⟶ K ⋆_{K′} K′` is a categorical equivalence but not a monomorphism in general, hence the factorization
   in the route.

## Needs Tau Ceti pin bump

Used by `Suggested.lean`, present on Tau Ceti main (bb8823c) but not at 2fd255d: modules
`Quasicategory.Limit`, `Quasicategory.CatInfty`, `SimplicialSet.AnodyneExtensions.LeftRight.Basic`,
`SimplicialSet.InternalHom`, `SimplicialSet.WeakHomotopyEquivalence`; names `SSet.coslice.IsColimit`,
`SSet.slice.IsLimit`, `SSet.coslice.map`, `SSet.coslice.map_comp`, `SSet.ihomOver`, `SSet.ihomOver.homEquiv`,
`SSet.ihomObj₀Equiv`, `SSet.RightFibration`, `SSet.IsWeakHomotopyEquivalence`, `SSet.rightAnodyneExtensions`,
`SSet.catInfty`. (The old files had the same dependence.)
