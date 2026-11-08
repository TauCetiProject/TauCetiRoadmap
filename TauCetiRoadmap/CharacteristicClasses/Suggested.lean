module

public import Mathlib
public import TauCeti.Topology.VectorBundle.Orientation.ThomClass
public import TauCeti.Analysis.Normed.Module.Ball.IntUnitsAction

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
arbitrary base. Stated here, on those carriers, are the headline of C2.1,
existence and uniqueness of the Thom class of an oriented real vector bundle
over an arbitrary base, prescribed on every fibre by the orientation, and the
headline of C2.2, the Euler class as the primary obstruction: over a CW
complex of dimension at most the rank `n ≥ 2`, an integral Euler class
vanishes exactly when a nowhere-zero section exists.

Stated as well is the headline of C7.3a, Whitney's theorem that `ℝP^(2^k)`
admits no smooth immersion into `ℝ^(2^(k+1)-2)`. Here `ℝPᵐ` is the orbit space
of the antipodal action of `ℤˣ` on the unit sphere `Sᵐ` (the pinned action of
`TauCeti.Analysis.Normed.Module.Ball.IntUnitsAction`, which is free), with
Mathlib's quotient charts `MulAction.instChartedSpaceQuotient`. The antipodal
map is analytic (`contMDiff_neg_sphere`), so the pinned
`TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence smooth,
atlas; immersions are Mathlib's `Manifold.IsImmersion`.

Not statable at the pins, and therefore not stated here:
* the Thom isomorphism `H^k(X;L) ≃ H^(k+n)(E,E∖0;π*L⊗o(E))` (C2.1): there is no
  relative cup product `H^k(E) ⊗ H^n(E,E₀) → H^(k+n)(E,E₀)` at the pins, so
  the Thom map `a ↦ π*a ∪ U_E` has no carrier;
* the Gysin sequence `⋯ → Hᵏ(X) → Hᵏ⁺ⁿ(X) → Hᵏ⁺ⁿ(E₀) → Hᵏ⁺¹(X) → ⋯` (C2.2): its
  third map is the connecting map of the Thom pair followed by the inverse of
  the Thom isomorphism, which has no carrier for the reason just given (the
  pinned absolute cup `TopCat.singularCup` gives the first map `a ↦ a ∪ e`,
  but not the third);
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
  `TauCeti.Manifold.Orientation.toVectorBundleOrientation` of an oriented
  manifold, but no identification of a tangent-bundle orientation with the
  homological orientation that fixes `[M]`, so the sign of `e(TM)[M]` has no
  carrier;
* Borel's theorem `H*(BG;ℚ)≃H*(BT;ℚ)^W` and the universal Chern–Weil
  isomorphism (C5.2): no classifying space and no Chern–Weil map exist at
  the pins;
* the singular/de Rham Chern–Weil comparison (C4.2): the pins have de Rham
  cohomology `TauCeti.deRhamCohomology` and the curvature operator
  `CovariantDerivative.curvatureOperator` of a Mathlib `CovariantDerivative`,
  but no Chern–Weil form `P(F)` of an invariant polynomial on the curvature,
  no de Rham/singular comparison map, and no Chern or Pontryagin class in
  singular cohomology to compare with;
* the exterior Hopf isomorphism `H*(K;ℚ) ≅ Λ_ℚ(z₁,…,z_r)`, `|zᵢ| = 2dᵢ − 1`,
  of a compact connected Lie group (C5a.5): the pinned cup `TopCat.singularCup`
  is a family of bilinear maps `H^p × H^q → H^(p+q)`, with no graded
  cohomology algebra `⨁ₖ Hᵏ(K;ℚ)` to compare with an exterior algebra, and
  spelling out exterior monomials through iterated degreewise cups would be
  an ad hoc encoding;
* the rational Chern-character isomorphism on finite CW pairs and its Thom
  correction `ch(Thom_K(a)) = Thom_H(ch(a)·Td(E)⁻¹)` (C6.3–C6.4): the pins have
  no topological K-theory and no Chern class.

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

section Bundle

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

/-! ## C2.2: the Euler class as the primary obstruction -/

/-- **The Euler class is the complete obstruction to a nowhere-zero section in the
primary range** (Milnor–Stasheff, §12). Let `E → B` be a real vector bundle of rank
`n = dim F ≥ 2` over a Hausdorff CW complex `B` with no cells of dimension above `n`, and
let `u ∈ Hⁿ(E, E₀; ℤ)` be an integral Thom class, integral coefficients being lifted to the
universe of the base. Then the Euler class `e(u) ∈ Hⁿ(B; ℤ)` vanishes exactly when the
bundle has a continuous section with no zero. The direction from a section to `e(u) = 0` is
the pinned `TauCeti.eulerClass_eq_zero_of_forall_ne_zero`; the dimension bound cannot be
dropped (rank three over the four-sphere, C7). -/
theorem eulerClass_eq_zero_iff_exists_ne_zero [T2Space B] [Topology.CWComplex (univ : Set B)]
    (hdim : ∀ m, finrank ℝ F < m → IsEmpty (Topology.RelCWComplex.cell (univ : Set B) m))
    (hn : 2 ≤ finrank ℝ F)
    (u : (TauCeti.thomPair F E).singularCohomology (ModuleCat.of ℤ (ULift.{w} ℤ)) ℤ
      (ModuleCat.of ℤ (ULift.{w} ℤ)) (finrank ℝ F)) (hu : TauCeti.IsThomClass F E u) :
    TauCeti.eulerClass (ModuleCat.of ℤ (ULift.{w} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{w} ℤ)) F E
        (finrank ℝ F) u = 0 ↔
      ∃ s : ∀ b, E b, Continuous (fun b ↦ TotalSpace.mk' F b (s b)) ∧ ∀ b, s b ≠ 0 := by
  sorry

end Bundle

/-! ## C7.3a: real projective spaces and the immersion obstruction -/

open Metric in
open scoped Manifold ContDiff in
/-- **Whitney's non-immersion theorem for `ℝP^(2^k)`** (C7.3a). For `k ≥ 1` and `m = 2^k`,
real projective space `ℝPᵐ`, the orbit space of the antipodal action of `ℤˣ` on the unit sphere
`Sᵐ ⊆ ℝᵐ⁺¹` with its quotient charts, admits no smooth immersion into `ℝ^(2m − 2)`. The proof
computes the dual Stiefel–Whitney class `w̄_(m−1)(ℝPᵐ) = a^(m−1) ≠ 0` from
`w(T ℝPᵐ) = (1 + a)^(m+1)`, which an immersion with normal rank `m − 2` would kill
(Milnor–Stasheff, §4). -/
theorem not_exists_isImmersion_realProjectiveSpace (k : ℕ) (hk : 1 ≤ k) :
    ¬ ∃ f : MulAction.orbitRel.Quotient ℤˣ (sphere (0 : EuclideanSpace ℝ (Fin (2 ^ k + 1))) 1) →
        EuclideanSpace ℝ (Fin (2 ^ (k + 1) - 2)),
      Manifold.IsImmersion (𝓡 (2 ^ k)) 𝓘(ℝ, EuclideanSpace ℝ (Fin (2 ^ (k + 1) - 2))) ∞ f := by
  sorry

end TauCetiRoadmap.CharacteristicClasses
