module

public import Mathlib
public import TauCeti.Topology.VectorBundle.Orientation.ThomClass
public import TauCeti.Analysis.Normed.Module.Ball.IntUnitsAction
public import TauCeti.AlgebraicTopology.Cohomology.FundamentalClass
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Chart
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.Orientation.Linear
public import TauCeti.AlgebraicTopology.Cellular.EulerCharacteristic.FiniteCWType
public import TauCeti.Geometry.Manifold.Orientation.Basic

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

Stated also is the headline of C2.3, `⟨e(TM), [M]⟩ = χ(M)` for a closed oriented
manifold of positive dimension, on the pinned Euler characteristic `TauCeti.eulerChar` of a
space of finite CW type, the evaluation `TauCeti.HomologicalOrientation.evalFundamentalClass`
on the fundamental class, and the pinned local orientations
`TauCeti.localOrientationOfManifoldOrientation` that a manifold orientation selects through
its oriented charts; the Thom class is normalized on every fibre by the pinned generator
`Orientation.localOrientation` of the tangent orientation. Finite CW type is a hypothesis,
since the pins have no such instance for compact manifolds. The self-map form
`⟨f* e(TM), [M]⟩ = deg(f) χ(M)` of C2.3 is not a separate headline: the pins define no degree
of a self-map, and for an integer `d` with `f_*[M] = d • [M]` (the pinned
`TauCeti.HomologicalOrientation.mapFundamentalClass` and
`TauCeti.HomologicalOrientation.fundamentalClass`) it follows from
this theorem, the pinned
`TauCeti.HomologicalOrientation.evalFundamentalClass_id_singularCohomologyMap`, which gives
`⟨f* c, [M]⟩ = ⟨c, f_*[M]⟩`, and linearity of the Kronecker pairing.

Stated also is the integral headline of C2.4a, Thom's representation of homology classes in
codimensions one and two: on a compact oriented boundaryless smooth manifold of dimension
`m + c`, `c ∈ {1, 2}`, every class of `H_m(M; ℤ)` is `i_*[N]` for a compact oriented smooth
`m`-manifold `N` and a smooth embedding `i : N → M` (Mathlib's `Manifold.IsSmoothEmbedding`),
with `i_*[N]` the pinned `TauCeti.HomologicalOrientation.mapFundamentalClass`.

Stated as well is the headline of C7.3a, Whitney's theorem that `ℝP^(2^k)`
admits no smooth immersion into `ℝ^(2^(k+1)-2)`. Here `ℝPᵐ` is the orbit space
of the antipodal action of `ℤˣ` on the unit sphere `Sᵐ` (the pinned action of
`TauCeti.Analysis.Normed.Module.Ball.IntUnitsAction`, which is free), with
Mathlib's quotient charts `MulAction.instChartedSpaceQuotient`. The smooth-action
instance `ContMDiffConstSMul (𝓡 m) ω ℤˣ Sᵐ` is a target of C7.3a, proved from
`contMDiff_neg_sphere` for `g = -1` and `contMDiff_id` for `g = 1`; with it the
pinned `TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence
smooth, atlas, and the pinned `Manifold.IsImmersion.id` applies. Immersions are
Mathlib's `Manifold.IsImmersion`, whose charts range over `IsManifold.maximalAtlas`,
which is defined without that instance.

Not statable at the pins, and therefore not stated here:
* the mod 2 form of C2.4a, that every class of `H_(m-1)(M; 𝔽₂)` of a compact, possibly
  non-orientable, smooth `m`-manifold is `i_*[N]` for an embedded, possibly non-orientable,
  `N`: the pinned fundamental class `TauCeti.HomologicalOrientation.fundamentalClass` is
  integral and needs an orientation, so a non-orientable `N` has no fundamental class at the
  pins;
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
* Borel's theorem `H*(BG;ℚ)≃H*(BT;ℚ)^W` and the universal Chern–Weil
  isomorphism (C5.2): no classifying space and no Chern–Weil map exist at
  the pins;
* the singular/de Rham Chern–Weil comparison (C4.2): the pins have de Rham
  cohomology `TauCeti.deRhamCohomology` (`Geometry/Manifold/DeRham/Basic.lean`)
  and Tau Ceti's curvature operator `CovariantDerivative.curvatureOperator`
  (`Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Basic.lean`) of
  a Mathlib `CovariantDerivative`, but no Chern–Weil form `P(F)` of an invariant polynomial on the curvature,
  no de Rham/singular comparison map, and no Chern or Pontryagin class in
  singular cohomology to compare with;
* the exterior Hopf isomorphism `H*(K;ℚ) ≅ Λ_ℚ(z₁,…,z_r)`, `|zᵢ| = 2dᵢ − 1`,
  of a compact connected Lie group (C5a.5): the pinned cup `TopCat.singularCup`
  is a family of bilinear maps `H^p × H^q → H^(p+q)`, with no graded
  cohomology algebra `⨁ₖ Hᵏ(K;ℚ)` to compare with an exterior algebra, and
  spelling out exterior monomials through iterated degreewise cups would be
  an ad hoc encoding;
* the comparison `H*_dR(K) ≅ H*(CE(𝔤;ℝ))` of the de Rham cohomology ring of a compact
  connected Lie group with the cohomology of its Chevalley–Eilenberg complex (C5a.1): the
  pinned Lie-algebra cochains of Mathlib's `LieModule.Cohomology` and of Tau Ceti's
  `Algebra/Lie/Cochain.lean` stop at 2-cochains, with coboundaries `d₁₂` and `d₂₃`, so there is
  no Chevalley–Eilenberg complex in all degrees;
* the universal transgression `d_(2dᵢ)(zᵢ) = uᵢ` in the Serre spectral sequence of
  `K → EK → BK` (C5a.5): the pins have no classifying space of a Lie group of positive
  dimension (`TauCeti.classifyingSpace G` is the join of `G` as a discrete group) and no
  cohomological Serre spectral sequence (the pinned
  `TauCeti.filteredSpaceSpectralSequence` is the homological spectral sequence of a filtered
  space);
* the rational Chern-character isomorphism on finite CW pairs, its Thom
  correction `ch(Thom_K(a)) = Thom_H(ch(a)·Td(E)⁻¹)` for the dual-Koszul Thom class
  (C6.3–C6.4) and the resulting Riemann–Roch identity for embedding pushforwards
  (C6.5): the pins have no topological K-theory and no Chern class.

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

/-! ## C2.3: the Euler number of a closed oriented manifold -/

open scoped Manifold ContDiff in
/-- **The Euler number of the tangent bundle is the Euler characteristic** (C2.3;
Milnor–Stasheff, Corollary 11.12). Let `M` be a compact Hausdorff boundaryless smooth manifold
of dimension `n + 1` modelled on a finite-dimensional real inner product space `E`, of finite
CW type, with an orientation `o`. Let `oh` be a homological orientation whose local
orientation at every point is the one `o` selects through its oriented charts, and let `u` be
a class of `H^(n+1)(TM, TM ∖ 0; ℤ)` whose restriction to the fibre at every point pairs to `1`
with the generator of `H_(n+1)(E, E ∖ {0}; ℤ)` selected by the tangent orientation of `o`
there. Then the Euler class `e(u) ∈ H^(n+1)(M; ℤ)` evaluates to `χ(M)` on the fundamental
class of `oh`. Reversing `o` negates both `u` and `[M]`. -/
theorem eval_eulerClass_tangent_eq_eulerChar {M E : Type} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M] [TauCeti.FiniteCWType M]
    {n : ℕ} (hE : finrank ℝ E = n + 1)
    (o : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin (n + 1)))
    (oh : TauCeti.HomologicalOrientation M E (n + 1))
    (hoh : ∀ x, oh x = TauCeti.localOrientationOfManifoldOrientation o hE x)
    (u : (TauCeti.thomPair E (TangentSpace 𝓘(ℝ, E) : M → Type)).singularCohomology
      (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) (n + 1))
    (hu : ∀ b : M,
      (TopPair.singularKronecker (TopPair.ofSubset (X := TopCat.of E) ({0}ᶜ : Set E)) ℤ (n + 1)
        (TopPair.singularCohomologyMap
          (TauCeti.fiberThomPairMap E (TangentSpace 𝓘(ℝ, E) : M → Type) b) (n + 1) u)).hom
        (Orientation.localOrientation
          (show Orientation ℝ E (Fin (n + 1)) from o.toVectorBundleOrientation b) hE).1 =
        ULift.up 1) :
    oh.evalFundamentalClass (hE ▸ rfl) (ModuleCat.of ℤ (ULift.{0} ℤ)) (ContinuousMap.id M)
        (TauCeti.eulerClass (ModuleCat.of ℤ (ULift.{0} ℤ)) ℤ (ModuleCat.of ℤ (ULift.{0} ℤ)) E
          (TangentSpace 𝓘(ℝ, E) : M → Type) (n + 1) u) =
      ULift.up (TauCeti.eulerChar M) := by
  sorry

/-! ## C2.4a: embedded representatives in codimensions one and two -/

open scoped Manifold ContDiff in
/-- **Thom's representation theorem in codimensions one and two, integral form** (C2.4a;
Thom 1954, Théorème II.27, p. 55). Let `M` be a compact Hausdorff boundaryless smooth manifold
of dimension `m + c` with `c = 1` or `c = 2`, modelled on a finite-dimensional real normed space
`E`, with an orientation `oM`. Every class `x ∈ H_m(M; ℤ)` is the image `i_*[N]` of the
fundamental class of a compact Hausdorff boundaryless smooth `m`-manifold `N`, for some
orientation `oN` of `N`, under a smooth embedding `i : N → M`. The representative may be empty
(for `x = 0`) or disconnected, and torsion classes are included. -/
theorem exists_isSmoothEmbedding_mapFundamentalClass_eq {E M : Type} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace M] [T2Space M]
    [CompactSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) ∞ M]
    {m c : ℕ} (hc : c = 1 ∨ c = 2) (hE : finrank ℝ E = m + c)
    (oM : TauCeti.HomologicalOrientation M E (m + c))
    (x : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) m).obj
      (ModuleCat.of ℤ (ULift.{0} ℤ))).obj (TopCat.of M)) :
    ∃ (N : Type) (_ : TopologicalSpace N) (_ : T2Space N) (_ : CompactSpace N)
      (_ : ChartedSpace (EuclideanSpace ℝ (Fin m)) N) (_ : IsManifold (𝓡 m) ∞ N)
      (oN : TauCeti.HomologicalOrientation N (EuclideanSpace ℝ (Fin m)) m) (i : C(N, M)),
      Manifold.IsSmoothEmbedding (𝓡 m) 𝓘(ℝ, E) ∞ i ∧
        oN.mapFundamentalClass finrank_euclideanSpace_fin i = x := by
  sorry

/-! ## C7.3a: real projective spaces and the immersion obstruction -/

open Metric in
open scoped Manifold ContDiff in
/-- **Whitney's non-immersion theorem for `ℝP^(2^k)`** (C7.3a). For `k ≥ 1` and `m = 2^k`,
real projective space `ℝPᵐ`, the orbit space of the antipodal action of `ℤˣ` on the unit sphere
`Sᵐ ⊆ ℝᵐ⁺¹` with its quotient charts, admits no smooth immersion into `ℝ^(2m − 2)`. The proof
computes the dual Stiefel–Whitney class `w̄_(m−1)(ℝPᵐ) = a^(m−1) ≠ 0` from
`w(T ℝPᵐ) = (1 + a)^(m+1)`, which an immersion with normal rank `m − 2` would kill
(Cohen, *The Topology of Fiber Bundles*, Corollary 3.28, p. 106; Milnor–Stasheff, §4). -/
theorem not_exists_isImmersion_realProjectiveSpace (k : ℕ) (hk : 1 ≤ k) :
    ¬ ∃ f : MulAction.orbitRel.Quotient ℤˣ (sphere (0 : EuclideanSpace ℝ (Fin (2 ^ k + 1))) 1) →
        EuclideanSpace ℝ (Fin (2 ^ (k + 1) - 2)),
      Manifold.IsImmersion (𝓡 (2 ^ k)) 𝓘(ℝ, EuclideanSpace ℝ (Fin (2 ^ (k + 1) - 2))) ∞ f := by
  sorry

end TauCetiRoadmap.CharacteristicClasses
