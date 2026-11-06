module

public import Mathlib
public import TauCeti.Topology.VectorBundle.Orientation.ThomClass

/-!
# Characteristic classes and Chern–Weil theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`.

The pinned Tau Ceti already carries the Thom pair `TauCeti.thomPair`, the
Thom-class predicate `TauCeti.IsThomClass`, the Euler class
`TauCeti.eulerClass` with its naturality and its vanishing on a bundle with a
nowhere-zero section, bundle orientations `TauCeti.VectorBundleOrientation`,
the orientation double cover and its sign local system
`TauCeti.VectorBundleOrientationCover.signLocalSystem`, the existence of a
Thom class of an oriented bundle over a compact base
(`TauCeti.VectorBundleOrientation.exists_isThomClass`), and the vanishing of
the relative cohomology of the Thom pair below the rank together with the
unique gluing of compatible top-degree classes over an arbitrary trivializing
cover (`TauCeti.existsUnique_singularCohomology_thomPairOver_iUnion`), over an
arbitrary base. Stated here, on those carriers, is the headline of C2.1:
existence and uniqueness of the Thom class of an oriented real vector bundle
over an arbitrary base, prescribed on every fibre by the orientation.

Not statable at the pins, and therefore not stated here:
* the Thom isomorphism `H^k(X;L) ≃ H^(k+n)(E,E∖0;π*L⊗o(E))` (C2.1): there is no
  relative cup product `H^k(E) ⊗ H^n(E,E₀) → H^(k+n)(E,E₀)` at the pins, so
  the Thom map `a ↦ π*a ∪ U_E` has no carrier;
* the universal rings `H*(BU(r);ℤ)=ℤ[c₁,…,c_r]`, `H*(BO(n);𝔽₂)` and the
  BSO rings (C3.4, C3.6): the pins have the finite Grassmannians
  `TauCeti.finiteGrassmannian` with their tautological bundles and
  stabilization maps, the finite oriented Grassmannians
  `TauCeti.finiteOrientedGrassmannian`, and the discrete-group Milnor join
  `TauCeti.classifyingSpace G`, but no infinite Grassmannian, no classifying
  space of a topological group, no universal bundle, and no Chern or
  Stiefel–Whitney class;
* `e(TM)[M]=χ(M)` (C2.3) and the Euler-pullback identity for a self-map:
  the pins have the Euler characteristic `TauCeti.eulerChar` of a space of
  finite CW type, the evaluation `TauCeti.HomologicalOrientation.evalFundamentalClass`
  on the fundamental class of a compact manifold with a homological
  orientation, and the tangent-bundle orientation
  `Orientation.toVectorBundleOrientation` of an oriented manifold, but no
  identification of a tangent-bundle orientation with the homological
  orientation that fixes `[M]`, so the sign of `e(TM)[M]` has no carrier;
* Borel's theorem `H*(BG;ℚ)≃H*(BT;ℚ)^W` and the universal Chern–Weil
  isomorphism (C5.2): no classifying space and no Chern–Weil map exist at
  the pins;
* the singular/de Rham Chern–Weil comparison (C4.2): no curvature form of a
  connection or de Rham comparison for bundles at the pins.

The formal power series of C6.1 and the low-degree genus polynomials of C7.1
are proved at the pin (`TauCeti.hirzebruchLSeries`, `TauCeti.aHatSeries`,
`PowerSeries.multiplicativeSequence` and `TauCeti/RingTheory/PowerSeries/
GenusPolynomials.lean`) and are cited in the README, not restated here.
-/

@[expose] public section
noncomputable section

namespace TauCetiRoadmap.CharacteristicClasses

open Bundle CategoryTheory Module Set

universe w

/-! ## C2.1: the Thom class of an oriented bundle over an arbitrary base -/

variable {B : Type w} [TopologicalSpace B] {F : Type w} [NormedAddCommGroup F]
  [NormedSpace ℝ F] [FiniteDimensional ℝ F] {E : B → Type w}
  [TopologicalSpace (TotalSpace F E)] [∀ b, AddCommMonoid (E b)] [∀ b, Module ℝ (E b)]
  [∀ b, TopologicalSpace (E b)] [FiberBundle F E] [VectorBundle ℝ F E]
  {ι : Type*} [Fintype ι]

/-- **The Thom class of an oriented bundle over an arbitrary base** (Milnor–Stasheff,
Theorem 10.4, existence and uniqueness; the base is arbitrary, by the directed-union
argument of the proof). Let `o` be an orientation of a real vector bundle `E → B` with
fibres of dimension `r = card ι`, `ω` an orientation of the model fibre `F`, and
`g ∈ Hʳ(F, F ∖ {0}; R, M)` with `R` projective. There is exactly one class of
`Hʳ(E, E₀; R, M)` whose restriction to the fibre pair `(E_b, E_b ∖ {0})` is the pull-back of
`g` along every linear trivialization carrying `o b` to `ω`, and the negative of that
pull-back along every linear trivialization carrying `o b` to `-ω`. The pinned
`TauCeti.VectorBundleOrientation.exists_singularCohomology_thomPair_fiber` is the existence
half over a compact base. -/
theorem existsUnique_singularCohomology_thomPair_fiber {K : Type*} [CommRing K]
    {R M : ModuleCat.{w} K} [Module.Projective K R]
    (hι : Fintype.card ι = finrank ℝ F) (o : TauCeti.VectorBundleOrientation F E ι)
    (ω : Orientation ℝ F ι)
    (g : (TopPair.ofSubset (X := TopCat.of F) ({0}ᶜ : Set F)).singularCohomology R K M
      (finrank ℝ F)) :
    ∃! u : (TauCeti.thomPair F E).singularCohomology R K M (finrank ℝ F),
      (∀ (e : Trivialization F (π F E)) [e.IsLinear ℝ] (b : B) (hb : b ∈ e.baseSet),
        e.mapOrientation ι hb (o b) = ω →
          TopPair.singularCohomologyMap (TauCeti.fiberThomPairMap F E b) _ u =
            TopPair.singularCohomologyMap
              (e.continuousLinearEquivAt ℝ b hb).complZeroPairIso.hom _ g) ∧
      ∀ (e : Trivialization F (π F E)) [e.IsLinear ℝ] (b : B) (hb : b ∈ e.baseSet),
        e.mapOrientation ι hb (o b) = -ω →
          TopPair.singularCohomologyMap (TauCeti.fiberThomPairMap F E b) _ u =
            -TopPair.singularCohomologyMap
              (e.continuousLinearEquivAt ℝ b hb).complZeroPairIso.hom _ g := by
  sorry

/-- **Every oriented real vector bundle has a Thom class**, over an arbitrary base and with
coefficients in any commutative ring `K`, integral coefficients included: a class of
`Hʳ(E, E₀; K, K)`, `r = dim F`, restricting to a generator of `Hʳ(E_b, E_b ∖ {0}; K, K) ≅ K`
on every fibre (Milnor–Stasheff, Theorem 10.4). The pinned
`TauCeti.VectorBundleOrientation.exists_isThomClass` is the case of a compact base. -/
theorem exists_isThomClass_of_orientation (hι : Fintype.card ι = finrank ℝ F)
    (o : TauCeti.VectorBundleOrientation F E ι) (K : Type w) [CommRing K] :
    ∃ u : (TauCeti.thomPair F E).singularCohomology (ModuleCat.of K K) K (ModuleCat.of K K)
      (finrank ℝ F), TauCeti.IsThomClass F E u := by
  sorry

end TauCetiRoadmap.CharacteristicClasses
