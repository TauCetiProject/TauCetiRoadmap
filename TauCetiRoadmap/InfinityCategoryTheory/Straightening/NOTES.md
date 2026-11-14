# Notes on the Straightening draft (Linear-Firm)

1. **Arbitrary-base route for HTT 3.3.1.3 (§2.4).** The route reduces to the ∞-category-base results of
   CartesianFibrations §7.2–§7.3 (Theorem 1, Corollary 3) through §2.1; it is not Lurie's mapping-simplex route.
   The routes for 3.3.1.4 (fibrant cospan) and 3.3.1.5 (strict marked-anodyne square) follow Lurie's proofs.

2. **Suggested.lean (2026-11-12).** Stated: HTT Cor. 3.3.1.2 (§2.2, new), Prop. 3.3.1.7 (§2.3), Prop. 3.3.1.3 and
   Prop. 3.3.1.5 (1) ⇔ (2) (§2.4), Nikolaus–Scholze Lemma A.17 (§3.4, new, as `CatInfty.colimit_induction`, with
   small diagrams read as `K : SSet.{u + 1}` whose simplex types are `Small.{u}`). Definitions restated from Part
   InfinityCategoryFoundations (§2.1, §9.4): `IsCategoricalEquivalence`, `categoricalEquivalences`, `categoricalFibrations`
   (a morphism property, no `CategoricalFibration` class, as InfinityCategoryFoundations §9.4 asks); local: `CatInfty.vertex`.
   The old file's other statements (HTT 2.4.1.5, 2.4.2.4, 2.4.2.10, 2.4.4.6, 2.4.6.1, 2.4.6.5, 1.2.7.3, 2.2.5.7,
   3.1.1.6, 3.3.1.8) now belong to Parts InfinityCategoryFoundations and CartesianFibrations.

3. **Opposite twist in the coCartesian classification (resolved).** §1.8 defines the involution op of `Cat∞`
   through twisted arrows (C ↦ Cᵒᵖ only reaches `(Cat^Δ_∞)^co`), and the coCartesian straightening equivalence
   composes with it, so values are the fibers. The twisted-arrow input is owned in §1.8 itself (no other Part has
   `Tw`): for a Kan complex K, `Tw(K) ⟶ K` is a trivial fibration, by a Kan–Quillen argument (left properness and
   the Reedy colimit lemma), in place of HA Props. 5.2.1.3 and 5.2.1.10, which no Part owns. From it, for any
   locally Kan D, `N(D) ⟵ N(Tw_*D) ⟶ N(D^co)` are trivial fibrations, and op is the strict map
   `N(π) ∘ N(τ) ∘ s` with s normalized on the 1-skeleton, so op(C) = Cᵒᵖ and op(g) = gᵒᵖ hold on the nose. §5.1
   uses the comparison for its bi-fibration subcategory D', and §5.3 reads the Δ[2] composition 2-cell off a
   mapping simplex (§2.5 over Δ[n]). §2.1's dual reading of "classifies" uses `(op ∘ f)ᵒᵖ`, departing from
   HTT Def. 3.3.2.2's literal wording (which gives opposite fibers) in favour of HTT Prop. 3.2.5.21 (3). §2.5, §5.1
   (2) and §5.3 cite it. The suggested locator "HTT Thm. 5.2.9.1" for autoequivalences of `Cat∞` does not exist in
   the 2017 PDF; the Check uses an explicit poset instead.

## Needs Tau Ceti pin bump

Names that exist on Tau Ceti main (bb8823c) but not at the roadmap pin 2fd255d.
- Used in Suggested.lean (Lemma A.17 only): modules `TauCeti.AlgebraicTopology.Quasicategory.CatInfty`,
  `…Quasicategory.Limit`, `…SimplicialNerve.Basic`; `SSet.catInfty`, `SSet.CatInftyΔ`, `SSet.CoreEnriched`,
  `SSet.coslice.IsColimit`, `CategoryTheory.SimplicialNerve.fromNerve`.
- Cited in README only: `SSet.core_sHom_eq_top`, `SSet.slice.IsLimit`, `SSet.RightFibration`, `SSet.LeftFibration`,
  `SSet.Edge.isEquivalence_iff_hornFilling_zero`. All exist on main.
