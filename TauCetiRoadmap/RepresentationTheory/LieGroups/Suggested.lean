import Mathlib
import TauCeti.Geometry.Lie.Tangent.LieEquiv
import TauCeti.Geometry.Lie.Exponential.Basic
import TauCeti.Geometry.Lie.Adjoint.Derivation
import TauCeti.Geometry.Lie.Functor
import TauCeti.Geometry.Lie.Subgroup.LieAlgebra
import TauCeti.Geometry.Lie.Subgroup.Embedded

/-!
# Lie groups and the Lie algebra correspondence: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions
those statements need. The native floor is consumed by name, never restated: `lieExp`,
`oneParameterSubgroup`, `existsUnique_eq_oneParameterSubgroup`, `lieExp_eq_expUnit`,
`TauCeti.Lie.Ad`, `TauCeti.Lie.conj_lieExp`, `TauCeti.Lie.Ad_lieExp_units`, `lieMap`,
`TauCeti.Lie.lieMap_injective`, `TauCeti.Lie.contMDiff_of_continuous_monoidHom`,
`TauCeti.Lie.lieSubalgebraOfSubgroup`, `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`,
`TauCeti.Lie.mem_lieSubalgebraOfSubgroup_iff_exists_seq`, `TauCeti.UniversalCover.instLieGroup` and
`TauCeti.UniversalCover.lieMap_projHom_bijective`.

Headline theorems of the README that are not statable at the pins, and what each lacks:

* Layer 3, the global Baker–Campbell–Hausdorff series and its convergence, remainder and
  functoriality laws: the pins have no carrier for the degreewise Dynkin series (only the local
  germ `TauCeti.lieLocalBCH`), and a `sorry`'d function would be sorry'd data.
* Layer 6, the identification of the geometric Weyl group `N_G(T)/T` with `RootPairing.weylGroup`
  of the compact real root datum, and the positive-root form `∏ |1 − α(t)⁻¹|²` of the Weyl
  density: no root datum is attached to a compact Lie group at the pins; `weylDensity` below is the
  determinant form.
* Layer 7, the compact real form of a complex semisimple Lie algebra, its conjugacy, the
  compact-complexification criterion and the algebraization `𝐊(ℂ) ≃ K_ℂ`: only the existence and
  universal property of the complexification and the holomorphic extension of representations are
  statable; the Lie-algebra formula `Lie(G_ℂ) = 𝔤 ⊗ ℂ` needs a complexification carrier.
* Layer 8, the flag manifold as a compact complex manifold, the Bruhat decomposition as a
  `TauCeti.TitsSystem` on `G_ℂ`, Borel–Weil and Borel–Weil–Bott: the pins have no complex reductive
  group carrier with its Borel subgroup, maximal torus and character lattice, and no comparison of
  such a group with `L(λ)`.
* Layer 9, the restricted root system and the uniqueness of the middle KAK factor modulo the
  restricted Weyl group: stated in the README on the `IwasawaData` fields; only existence of the
  factorizations is stated here.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieGroups

open scoped Manifold ContDiff Pointwise
open MeasureTheory

universe u v w

/-! ## A. The Lie functor: from groups to algebras -/

section LieFunctor

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- The Lie algebra of a finite-dimensional real Lie group is finite-dimensional: the native
derivation–tangent equivalence at the identity, packaged as an instance so that the bounded-operator
statements below elaborate. -/
noncomputable instance instFiniteDimensionalLeftInvariantDerivation :
    FiniteDimensional ℝ (LeftInvariantDerivation I G) :=
  finiteDimensional_leftInvariantDerivation BoundarylessManifold.isInteriorPoint

/-! ### Layer 1: the adjoint representations -/

/-- **`Ad (lieExp X) = exp (ad X)`** for every finite-dimensional real Lie group, as an identity of
bounded operators on `𝔤` with its canonical norm; the units case `G = Rˣ` is native
(`TauCeti.Lie.Ad_lieExp_units`). Kirillov, online author copy, Thm. 3.7(5) and §3.6. -/
theorem Ad_lieExp_eq_exp_ad (X : LeftInvariantDerivation I G) :
    (TauCeti.Lie.Ad (I := I) (lieExp (I := I) X)).toLinearEquiv.toContinuousLinearEquiv.toContinuousLinearMap
      = NormedSpace.exp
          (LinearMap.toContinuousLinearMap (LieAlgebra.ad ℝ (LeftInvariantDerivation I G) X)) := sorry

/-! ### Layer 2: the closed-subgroup theorem -/

/-- **The direction set of an arbitrary subgroup is a Lie subalgebra**: for every subgroup `K`,
closed or not, the native Lie span `TauCeti.Lie.lieSubalgebraOfSubgroup K` adds nothing to the set
of derivations whose one-parameter subgroups lie in `K` (native for closed `K`,
`TauCeti.Lie.mem_lieSubalgebraOfSubgroup`). -/
theorem mem_lieSubalgebraOfSubgroup_iff (K : Subgroup G) (X : LeftInvariantDerivation I G) :
    X ∈ TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K ↔
      ∀ t : ℝ, lieExp (I := I) (t • X) ∈ K := sorry

/-- **The Lie algebra of a closed subgroup is its direction set**: the embedded Lie-subgroup
structure that the native closed-subgroup theorem gives a closed `K`, with model space
`lieSubalgebraOfSubgroup K`, has a smooth inclusion whose differential at `1` has range exactly
`lieSubalgebraOfSubgroup K`. Kirillov, online author copy, Thms. 2.8 and 3.19. -/
theorem exists_embeddedLieSubgroupData_lieMap_range_eq (K : Subgroup G)
    (hK : IsClosed (K : Set G)) :
    ∃ d : TauCeti.Lie.EmbeddedLieSubgroupData I K
        (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule,
      letI := d.chartedSpace
      letI := d.lieGroup
      (lieMap (⟨K.subtype, d.contMDiff_subtypeVal⟩ :
          ContMDiffMonoidMorphism
            𝓘(ℝ, (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule) I ∞ K G)).range =
        TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K := sorry

end LieFunctor

/-! ## B. Integrating algebras to groups -/

/-! ### Layer 4: Frobenius, Lie's third theorem, and the equivalence of categories -/

/-- **Immersed-Lie-subgroup data**: a connected Lie group `X` with an injective smooth immersive
homomorphism onto `K`. The carrier is a separate type with its own (leaf) topology, finer than the
subspace topology in general (irrational winding), which is why `↥K` with its subtype topology cannot
carry this structure and a bare `Subgroup G` cannot express it. -/
structure ImmersedLieSubgroupData
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
    [Group G] [LieGroup I ∞ G] (K : Subgroup G) where
  (X : Type w) [grp : Group X] [xtop : TopologicalSpace X]
  (E' : Type u) [normed : NormedAddCommGroup E'] [nsp : NormedSpace ℝ E']
  [fd : FiniteDimensional ℝ E']
  (H' : Type v) [htop : TopologicalSpace H']
  (I' : ModelWithCorners ℝ E' H')
  [charted : ChartedSpace H' X]
  [lie : LieGroup I' ∞ X]
  [conn : ConnectedSpace X]
  toHom : X →* G
  injective : Function.Injective toHom
  range_eq : MonoidHom.range toHom = K
  smooth : ContMDiff I' I ∞ (toHom : X → G)
  immersion : ∀ x : X, Function.Injective (mfderiv I' I (toHom : X → G) x)

section Integration

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **`IsImmersedLieSubgroup K`**: `K` is the image of a connected immersed Lie subgroup. -/
def IsImmersedLieSubgroup (K : Subgroup G) : Prop :=
  Nonempty (ImmersedLieSubgroupData I K)

/-- **The subalgebra ↔ immersed-subgroup correspondence** (Frobenius): every Lie subalgebra
`𝔥 ≤ 𝔤` is the Lie algebra of a connected immersed Lie subgroup, the leaf through `1` of the
involutive left-invariant distribution `x ↦ d(L_x)_1 𝔥`. Kirillov, online author copy, Thms. 3.43
and 3.46. -/
theorem exists_immersedLieSubgroup_lieSubalgebra
    (𝔥 : LieSubalgebra ℝ (LeftInvariantDerivation I G)) :
    ∃ K : Subgroup G, IsImmersedLieSubgroup (I := I) K ∧
      TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K = 𝔥 := sorry

end Integration

/-- **Lie's third theorem**: every finite-dimensional real Lie algebra is `Lie(G)` for a
simply-connected Lie group `G`, stated as existence of a Lie group whose left-invariant derivations
are Lie-isomorphic to `L`. Kirillov, online author copy, Thm. 3.48. -/
theorem exists_simplyConnected_lieGroup (L : Type u) [LieRing L] [LieAlgebra ℝ L]
    [Module.Finite ℝ L] :
    ∃ (E : Type u) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E) (_ : FiniteDimensional ℝ E)
      (H : Type u) (_ : TopologicalSpace H) (I : ModelWithCorners ℝ E H)
      (G : Type u) (_ : TopologicalSpace G) (_ : ChartedSpace H G)
      (_ : Group G) (_ : LieGroup I ∞ G),
      SimplyConnectedSpace G ∧ Nonempty (LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ L) := sorry

/-- **The equivalence of categories** (morphism half): for **simply-connected** `G`, `lieMap` is a
bijection `Hom(G, G') ≃ Hom(𝔤, 𝔤')`. Existence integrates a Lie-algebra homomorphism (simple
connectedness and the local BCH group law); uniqueness is native `TauCeti.Lie.lieMap_injective`.
Kirillov, online author copy, Thm. 3.38 and Cor. 3.50. -/
theorem exists_monoidHom_of_lieHom
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
    [Group G] [LieGroup I ∞ G] [SimplyConnectedSpace G]
    {E' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    {H' : Type v} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {G' : Type w} [TopologicalSpace G'] [ChartedSpace H' G']
    [Group G'] [LieGroup I' ∞ G']
    (f : LeftInvariantDerivation I G →ₗ⁅ℝ⁆ LeftInvariantDerivation I' G') :
    ∃ (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G')),
      lieMap (⟨φ, hφ⟩ : ContMDiffMonoidMorphism I I' ∞ G G') = f := sorry

/-! ### Layer 5: simply-connected covers and the enveloping algebra -/

section Covers

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **`ker Ad = Z(G)` for connected `G`**: an element acts trivially on the Lie algebra exactly when
it is central, because it then commutes with every `lieExp X`, and these generate a connected group.
Kirillov, online author copy, Thm. 3.32. -/
theorem Ad_eq_refl_iff_mem_center [ConnectedSpace G] (g : G) :
    TauCeti.Lie.Ad (I := I) g = LieEquiv.refl ↔ g ∈ Subgroup.center G := sorry

end Covers

/-! ## C. The structure of compact and reductive Lie groups -/

/-! ### Layer 6: maximal tori, the Weyl group, and Weyl integration -/

section Structure

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **A torus** is a compact connected abelian subgroup; **`IsMaximalTorus T`** is a torus maximal
under inclusion. The body is purely topological-group-theoretic: the native closed-subgroup theorem
upgrades a maximal torus to an embedded Lie subgroup, so no smooth structure needs to be carried in
the predicate. -/
def IsMaximalTorus (T : Subgroup G) : Prop :=
  (IsCompact (T : Set G) ∧ IsConnected (T : Set G) ∧ ∀ x ∈ T, ∀ y ∈ T, x * y = y * x) ∧
    ∀ T' : Subgroup G,
      (IsCompact (T' : Set G) ∧ IsConnected (T' : Set G) ∧ ∀ x ∈ T', ∀ y ∈ T', x * y = y * x) →
      T ≤ T' → T' = T

include I in
/-- **Torus exhaustion** for a compact connected group: every element lies in some maximal torus. On
`U(n)` this is the spectral theorem. Bröcker–tom Dieck, Ch. IV, §1. -/
theorem exists_mem_maximalTorus [CompactSpace G] [ConnectedSpace G] (g : G) :
    ∃ T : Subgroup G, IsMaximalTorus T ∧ g ∈ T := sorry

include I in
/-- **Conjugacy of maximal tori** for a compact connected group (stated as conjugacy of the
underlying sets). Bröcker–tom Dieck, Ch. IV, §1. -/
theorem isConj_of_isMaximalTorus [CompactSpace G] [ConnectedSpace G]
    {S T : Subgroup G} (hS : IsMaximalTorus S) (hT : IsMaximalTorus T) :
    ∃ g : G, (S : Set G) = (fun x => g * x * g⁻¹) '' (T : Set G) := sorry

/-- Consequently `lieExp` is **surjective** for compact connected `G`. -/
theorem lieExp_surjective [CompactSpace G] [ConnectedSpace G] :
    Function.Surjective (lieExp (I := I) (G := G)) := sorry

include I in
/-- **Conjugacy in a maximal torus is conjugacy by its normalizer**: two elements of `T` conjugate
in a compact connected `G` are conjugate by an element of `N_G(T)`. With exhaustion, `T` modulo the
normalizer action is the space of conjugacy classes of `G`. Bröcker–tom Dieck, Ch. IV, §2. -/
theorem exists_mem_normalizer_conj [CompactSpace G] [ConnectedSpace G]
    (T : Subgroup G) (hT : IsMaximalTorus T) {t u : G} (ht : t ∈ T) (hu : u ∈ T)
    (g : G) (hg : g * t * g⁻¹ = u) :
    ∃ n ∈ Subgroup.normalizer (T : Set G), n * t * n⁻¹ = u := sorry

/-- **The Weyl group** `weylGroup T = N_G(T) / T`, the quotient of the normalizer by `T`. In the
reductive case it is isomorphic to `RootPairing.weylGroup` of the root system (not statable here,
see the module docstring). -/
abbrev weylGroup (T : Subgroup G) : Type w :=
  ↥(Subgroup.normalizer (T : Set G)) ⧸ Subgroup.subgroupOf T (Subgroup.normalizer (T : Set G))

include I in
/-- The Weyl group of a maximal torus of a compact connected group is finite. -/
theorem finite_weylGroup [CompactSpace G] [ConnectedSpace G] (T : Subgroup G)
    (hT : IsMaximalTorus T) :
    Finite (weylGroup T) := sorry

omit [BoundarylessManifold I G] in
/-- `Ad(t⁻¹) − 1` carries `Lie(T)` into itself for `t ∈ T`: the Lie algebra of a subgroup is
invariant under the adjoint action of its elements (native `TauCeti.Lie.Ad_mem_lieSubalgebraOfSubgroup`).
This is what lets the Weyl density be a determinant on the quotient `𝔤 / Lie(T)`. -/
theorem ad_lieSubalgebraOfSubgroup_le (T : Subgroup G) (t : T) :
    (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) T).toSubmodule ≤
      (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) T).toSubmodule.comap
        ((TauCeti.Lie.Ad (I := I) ((t : G)⁻¹)).toLinearEquiv.toLinearMap - LinearMap.id) := by
  intro X hX
  change TauCeti.Lie.Ad (I := I) ((t : G)⁻¹) X - X ∈
    (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) T).toSubmodule
  exact Submodule.sub_mem _ (TauCeti.Lie.Ad_mem_lieSubalgebraOfSubgroup (inv_mem t.2) hX) hX

/-- **The Weyl density** `D(t) = |det_ℝ((Ad(t⁻¹) − 1) on 𝔤 / Lie(T))|`, equal to the positive-root
form `∏_{α>0} |1 − α(t)⁻¹|²` once the root system is attached (README, Layer 6). -/
noncomputable def weylDensity (T : Subgroup G) (t : T) : ℝ :=
  |LinearMap.det
      (Submodule.mapQ _ _
        ((TauCeti.Lie.Ad (I := I) ((t : G)⁻¹)).toLinearEquiv.toLinearMap - LinearMap.id)
        (ad_lieSubalgebraOfSubgroup_le (I := I) T t))|

/-- **The general Weyl integration formula**: for a continuous class function `f` on a compact
connected `G` with maximal torus `T`, `∫_G f dμ_G = |W|⁻¹ ∫_T f · D dμ_T` with `D = weylDensity`.
The measures are pinned as normalized Haar: with free `μG`, `μT` and density the formula is false
(`f = 1`, density `0`). Bröcker–tom Dieck, Ch. IV, §1. -/
theorem weyl_integration_formula [CompactSpace G] [ConnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (T : Subgroup G) (hT : IsMaximalTorus T) [MeasurableSpace T] [BorelSpace T]
    (μG : Measure G) [μG.IsHaarMeasure] [IsProbabilityMeasure μG]
    (μT : Measure T) [μT.IsHaarMeasure] [IsProbabilityMeasure μT]
    (f : G → ℝ) (hf : ∀ g x : G, f (x * g * x⁻¹) = f g) (hf_cont : Continuous f) :
    ∫ g, f g ∂μG
      = (Nat.card (weylGroup T) : ℝ)⁻¹
        * ∫ t, f (t : G) * weylDensity (I := I) T t ∂μT := sorry

/-- **The weighted conjugation pushforward**: the image of `(D/|W|) · (μ_{G/T} ⊗ μ_T)` under
`([g], t) ↦ g t g⁻¹` is `μ_G`. This measure identity, rather than boundedness of `D`, supplies the
weighted `L¹` restriction law of the README. -/
theorem weyl_conjugation_pushforward [CompactSpace G] [ConnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (T : Subgroup G) (hT : IsMaximalTorus T)
    [MeasurableSpace T] [BorelSpace T]
    [MeasurableSpace (G ⧸ T)] [BorelSpace (G ⧸ T)]
    (muG : Measure G) [muG.IsHaarMeasure] [IsProbabilityMeasure muG]
    (muT : Measure T) [muT.IsHaarMeasure] [IsProbabilityMeasure muT]
    (muQ : Measure (G ⧸ T))
    (hmuQ : muQ = Measure.map (QuotientGroup.mk : G → G ⧸ T) muG)
    (hq : Measurable (QuotientGroup.mk : G → G ⧸ T))
    (conjMap : (G ⧸ T) × T → G) (hconj : Measurable conjMap)
    (hconj_eq : ∀ (g : G) (t : T),
      conjMap (QuotientGroup.mk g, t) = g * (t : G) * g⁻¹) :
    Measure.map conjMap
      ((muQ.prod muT).withDensity (fun p =>
        ENNReal.ofReal (weylDensity (I := I) T p.2 /
          (Nat.card (weylGroup T) : ℝ)))) = muG := sorry

end Structure

/-! ### Layer 7: complexification and real forms -/

section Complexification

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

include I in
/-- **The complexification** `G_ℂ` of a compact connected Lie group: a complex Lie group with a
continuous injective homomorphism from `G`, universal among continuous homomorphisms of `G` into
complex Lie groups. Without the universal property the bare existential would be vacuous (the trivial
group satisfies it). On the classical groups `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`. -/
theorem exists_complexification [CompactSpace G] [ConnectedSpace G] :
    ∃ (Ec : Type u) (_ : NormedAddCommGroup Ec) (_ : NormedSpace ℂ Ec)
      (_ : FiniteDimensional ℂ Ec) (Hc : Type v) (_ : TopologicalSpace Hc)
      (Ic : ModelWithCorners ℂ Ec Hc)
      (Gc : Type w) (_ : TopologicalSpace Gc) (_ : ChartedSpace Hc Gc)
      (_ : Group Gc) (_ : LieGroup Ic ∞ Gc) (ι : G →* Gc),
      Continuous (ι : G → Gc) ∧ Function.Injective ι ∧
      ∀ (Ec' : Type u) (_ : NormedAddCommGroup Ec') (_ : NormedSpace ℂ Ec')
        (_ : FiniteDimensional ℂ Ec')
        (Hc' : Type v) (_ : TopologicalSpace Hc') (Ic' : ModelWithCorners ℂ Ec' Hc')
        (Gc' : Type w) (_ : TopologicalSpace Gc') (_ : ChartedSpace Hc' Gc')
        (_ : Group Gc') (_ : LieGroup Ic' ∞ Gc')
        (φ : G →* Gc'), Continuous (φ : G → Gc') →
        ∃! ψ : Gc →* Gc', ContMDiff Ic Ic' ∞ (ψ : Gc → Gc') ∧ ψ.comp ι = φ := sorry

include I in
/-- **Representations of compact `G` ↔ holomorphic representations of `G_ℂ`** (Weyl's unitary trick
at the group level): every continuous finite-dimensional representation of a compact `G` extends to a
holomorphic representation of its complexification. `Gc` must be the complexification: an injective
continuous `ι` alone is not enough (`U(1)` in `SL₂(ℂ)`: its weight-one character extends to no
holomorphic character of `SL₂(ℂ)`), so the universal property is a hypothesis, matching the
conclusion of `exists_complexification`. -/
theorem exists_holomorphic_extension [CompactSpace G] [ConnectedSpace G]
    {V : Type u} [NormedAddCommGroup V] [NormedSpace ℂ V] [FiniteDimensional ℂ V]
    {Ec : Type u} [NormedAddCommGroup Ec] [NormedSpace ℂ Ec] [FiniteDimensional ℂ Ec]
    {Hc : Type v} [TopologicalSpace Hc] {Ic : ModelWithCorners ℂ Ec Hc}
    {Gc : Type w} [TopologicalSpace Gc] [ChartedSpace Hc Gc]
    [Group Gc] [LieGroup Ic ∞ Gc] (ι : G →* Gc) (hι : Continuous (ι : G → Gc))
    (hινj : Function.Injective ι)
    (huniv : ∀ (Ec' : Type u) (_ : NormedAddCommGroup Ec') (_ : NormedSpace ℂ Ec')
      (_ : FiniteDimensional ℂ Ec')
      (Hc' : Type v) (_ : TopologicalSpace Hc') (Ic' : ModelWithCorners ℂ Ec' Hc')
      (Gc' : Type w) (_ : TopologicalSpace Gc') (_ : ChartedSpace Hc' Gc')
      (_ : Group Gc') (_ : LieGroup Ic' ∞ Gc')
      (φ : G →* Gc'), Continuous (φ : G → Gc') →
      ∃! ψ : Gc →* Gc', ContMDiff Ic Ic' ∞ (ψ : Gc → Gc') ∧ ψ.comp ι = φ)
    (ρ : G →* (V →L[ℂ] V)ˣ) (hρ : Continuous (ρ : G → (V →L[ℂ] V)ˣ)) :
    ∃ ρc : Gc →* (V →L[ℂ] V)ˣ,
      ρc.comp ι = ρ ∧
      ContMDiff Ic 𝓘(ℂ, V →L[ℂ] V) ∞ (fun g : Gc => ((ρc g : (V →L[ℂ] V)ˣ) : V →L[ℂ] V)) := sorry

end Complexification

/-! ### Layer 9: the Cartan, Iwasawa, and KAK decompositions

These decompositions are false for arbitrary subgroups of an arbitrary Lie group: they hold only for
a real reductive `G` with a global matrix-cover model and a genuine Iwasawa triple / restricted-root
chamber. The structures below carry that data, and the theorems consume it rather than assert a
factorization for bare subgroups. -/

section RealReductive

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- A global matrix-cover model (README, Layer 9): a closed transpose-stable subgroup `H` of
`GL_n(ℝ)` with finitely many components, a finite central covering `G → H`, and an involution
`theta` of `G` lifting transpose-inverse and fixing the whole compact preimage of `H ∩ O(n)`
pointwise. No polar or KAK conclusion is a field. -/
structure FiniteCartanMatrixModel (G : Type w) [TopologicalSpace G] [Group G]
    (theta : G ≃* G) where
  n : ℕ
  H : Subgroup (Matrix.GeneralLinearGroup (Fin n) ℝ)
  closed : IsClosed (H : Set (Matrix.GeneralLinearGroup (Fin n) ℝ))
  star_stable : ∀ h ∈ H, star h ∈ H
  finite_components : Finite (ConnectedComponents H)
  cover : G →* H
  continuous_cover : Continuous (cover : G → H)
  surjective_cover : Function.Surjective cover
  covering : IsCoveringMap (cover : G → H)
  finite_kernel : Finite cover.ker
  compact_preimage_fixed : ∀ g : G,
    star (((cover g : H) : Matrix.GeneralLinearGroup (Fin n) ℝ)) *
      (((cover g : H) : Matrix.GeneralLinearGroup (Fin n) ℝ)) = 1 → theta g = g
  central_kernel : ∀ z ∈ cover.ker, ∀ g : G, z * g = g * z
  theta_compatible : ∀ g : G,
    ((cover (theta g) : H) : Matrix.GeneralLinearGroup (Fin n) ℝ) =
      star ((((cover g : H) : Matrix.GeneralLinearGroup (Fin n) ℝ))⁻¹)

/-- **A Cartan involution datum** for `G`: a smooth involutive automorphism `θ`, a global
finite-cover matrix model, a compact fixed subgroup, and the reductive splitting of `Lie(G)` into
its centre and a semisimple derived algebra. Compactness of the fixed group alone is not a
reductivity criterion: the Euclidean motion group with `(v, k) ↦ (−v, k)` has compact fixed `O(n)`
and a translation radical. -/
structure CartanInvolution (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [Group G] [LieGroup I ∞ G] [T2Space G]
    [BoundarylessManifold I G] where
  θ : G ≃* G
  smooth : ContMDiff I I ∞ (θ : G → G)
  involutive : ∀ g : G, θ (θ g) = g
  global_model : FiniteCartanMatrixModel G θ
  compact_fixed : IsCompact {g : G | θ g = g}
  reductive_compl :
    IsCompl (LieAlgebra.center ℝ (LeftInvariantDerivation I G)).toSubmodule
      (LieAlgebra.derivedSeries ℝ (LeftInvariantDerivation I G) 1).toSubmodule
  derived_semisimple :
    LieAlgebra.IsSemisimple ℝ ↥(LieAlgebra.derivedSeries ℝ (LeftInvariantDerivation I G) 1)

/-- **`IsRealReductive I G`**: `G` carries a Cartan involution datum. -/
def IsRealReductive (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [Group G] [LieGroup I ∞ G] [T2Space G]
    [BoundarylessManifold I G] : Prop :=
  Nonempty (CartanInvolution I G)

/-- **Iwasawa data**: the Cartan datum, the maximal compact `K = G^θ`, a maximal abelian `𝔞 ⊆ 𝔭`
with its restricted roots and root spaces, an arbitrary closed connected exponential complement
`N` normalized by `𝔞` (the `KAN` input), the canonical root-generated `Nplus`, and the closed
positive chamber with its normalizer coverage and split-centre lineality. `N` is not forced to be
`Nplus`; a closed spanning cone without restricted-root data is not a positive chamber. -/
structure IwasawaData (I : ModelWithCorners ℝ E H) (G : Type w) [TopologicalSpace G]
    [ChartedSpace H G] [Group G] [LieGroup I ∞ G] [T2Space G]
    [BoundarylessManifold I G] where
  cartan : CartanInvolution I G
  K : Subgroup G
  K_eq_fixed : (K : Set G) = {g : G | cartan.θ g = g}
  𝔞 : Submodule ℝ (LeftInvariantDerivation I G)
  /-- the restricted weights of the selected maximal abelian subspace -/
  restrictedRoots : Set (𝔞 →ₗ[ℝ] ℝ)
  positiveRestrictedRoots : Set (𝔞 →ₗ[ℝ] ℝ)
  positiveRoots_subset : positiveRestrictedRoots ⊆ restrictedRoots
  restrictedRoots_neg : ∀ α, α ∈ restrictedRoots ↔ -α ∈ restrictedRoots
  positiveRoots_nonzero : ∀ α ∈ positiveRestrictedRoots, α ≠ 0
  positiveRoots_sign_choice : ∀ α ∈ restrictedRoots, α = 0 ∨
    α ∈ positiveRestrictedRoots ∨ -α ∈ positiveRestrictedRoots
  positiveRoots_no_opposites : ∀ α ∈ positiveRestrictedRoots,
    -α ∉ positiveRestrictedRoots
  positiveRoots_additive : ∀ α ∈ positiveRestrictedRoots, ∀ β ∈ positiveRestrictedRoots,
    α + β ∈ restrictedRoots → α + β ∈ positiveRestrictedRoots
  /-- the restricted root space of `α`, the simultaneous eigenspace of `ad(𝔞)` -/
  restrictedRootSpace : (α : 𝔞 →ₗ[ℝ] ℝ) → Submodule ℝ (LeftInvariantDerivation I G)
  restrictedRootSpace_eq : ∀ α ∈ restrictedRoots,
    (restrictedRootSpace α : Set (LeftInvariantDerivation I G)) =
      {X | ∀ H : 𝔞, ⁅(H : LeftInvariantDerivation I G), X⁆ = (α H) • X}
  restrictedRoots_exact : ∀ α, α ∈ restrictedRoots ↔ α ≠ 0 ∧
    ∃ X : LeftInvariantDerivation I G, X ≠ 0 ∧
      ∀ H : 𝔞, ⁅(H : LeftInvariantDerivation I G), X⁆ = (α H) • X
  𝔞_in_p : ∀ X ∈ 𝔞,
    lieMap (⟨cartan.θ.toMonoidHom, cartan.smooth⟩ : ContMDiffMonoidMorphism I I ∞ G G) X = -X
  𝔞_abelian : ∀ X ∈ 𝔞, ∀ Y ∈ 𝔞, ⁅X, Y⁆ = 0
  𝔞_maximal : ∀ 𝔞' : Submodule ℝ (LeftInvariantDerivation I G),
    (∀ X ∈ 𝔞',
      lieMap (⟨cartan.θ.toMonoidHom, cartan.smooth⟩ : ContMDiffMonoidMorphism I I ∞ G G) X = -X) →
    (∀ X ∈ 𝔞', ∀ Y ∈ 𝔞', ⁅X, Y⁆ = 0) → 𝔞 ≤ 𝔞' → 𝔞' = 𝔞
  A : Subgroup G
  A_eq : (A : Set G) = lieExp (I := I) '' 𝔞
  N : Subgroup G
  N_closed : IsClosed (N : Set G)
  N_connected : IsConnected (N : Set G)
  /-- `N` is globally the exponential of its Lie algebra; with connectedness this rules out discrete
  counterfeits (`ℤ` inside `ℝ`) whose Lie algebra satisfies the complement fields while the global
  factorization fails -/
  N_exp : (N : Set G)
    = lieExp (I := I) ''
      ((TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) N).toSubmodule :
        Set (LeftInvariantDerivation I G))
  /-- `lieExp` is injective on `𝔞` (global uniqueness of the `A`-factor) -/
  A_exp_injOn : Set.InjOn (lieExp (I := I)) (𝔞 : Set (LeftInvariantDerivation I G))
  N_normalized : ∀ X ∈ 𝔞, ∀ Y ∈ (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) N).toSubmodule,
    ⁅X, Y⁆ ∈ (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) N).toSubmodule
  iwasawa_disjoint : Disjoint (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule 𝔞
  iwasawa_compl :
    IsCompl ((TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K).toSubmodule ⊔ 𝔞)
      (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) N).toSubmodule
  chamber : Set (LeftInvariantDerivation I G)
  chamber_root_inequalities : ∀ X (hX : X ∈ (𝔞 : Set (LeftInvariantDerivation I G))),
    X ∈ chamber ↔ ∀ α ∈ positiveRestrictedRoots, 0 ≤ α ⟨X, hX⟩
  /-- the canonical root-generated subgroup, distinct from the arbitrary `KAN` complement `N` -/
  Nplus : Subgroup G
  Nplus_closed : IsClosed (Nplus : Set G)
  Nplus_connected : IsConnected (Nplus : Set G)
  Nplus_positiveRootGeneration :
    (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) Nplus).toSubmodule =
      Submodule.span ℝ (⋃ α ∈ positiveRestrictedRoots, restrictedRootSpace α)
  chamber_subset : chamber ⊆ (𝔞 : Set (LeftInvariantDerivation I G))
  chamber_cone : ∀ X ∈ chamber, ∀ Y ∈ chamber, X + Y ∈ chamber
  chamber_smul : ∀ X ∈ chamber, ∀ c : ℝ, 0 ≤ c → c • X ∈ chamber
  /-- the closed positive restricted-root chamber spans `𝔞` -/
  chamber_span : Submodule.span ℝ chamber = 𝔞
  /-- closed in the canonical tangent-space topology -/
  chamber_closed : IsClosed
    ((leftInvariantDerivationEquivGroupLieAlgebra (I := I) (G := G)
      BoundarylessManifold.isInteriorPoint) '' chamber)
  /-- every element of `𝔞` is carried into the chamber by the normalizer of `𝔞` in `K` -/
  chamber_normalizer_cover : ∀ X ∈ 𝔞, ∃ k : K,
    (∀ Y ∈ 𝔞, TauCeti.Lie.Ad (I := I) (k : G) Y ∈ 𝔞) ∧
    TauCeti.Lie.Ad (I := I) (k : G) X ∈ chamber
  /-- the whole split central direction is lineality -/
  chamber_split_center : ∀ X ∈ chamber,
    ∀ Z ∈ (LieAlgebra.center ℝ (LeftInvariantDerivation I G)).toSubmodule,
      Z ∈ 𝔞 → X + Z ∈ chamber

/-- **`IsIwasawaTriple K A N`**: `(K, A, N)` are the subgroups of some Iwasawa datum. -/
def IsIwasawaTriple (K A N : Subgroup G) : Prop :=
  ∃ D : IwasawaData I G, D.K = K ∧ D.A = A ∧ D.N = N

/-- **The Iwasawa decomposition** `G = KAN`: for a real reductive `G` and an Iwasawa triple
`(K, A, N)`, every `g` factors uniquely as `k a n`. Knapp, Ch. VI, §4. -/
theorem iwasawaDecomposition (hG : IsRealReductive I G)
    (K A N : Subgroup G) (hKAN : IsIwasawaTriple (I := I) K A N) :
    ∀ g : G, ∃! p : K × A × N, g = (p.1 : G) * (p.2.1 : G) * (p.2.2 : G) := sorry

/-- **The KAK (Cartan) decomposition** `G = K · exp(closed chamber) · K`, with `K` and the chamber
drawn from the same Iwasawa datum; uniqueness of the middle factor modulo the restricted Weyl group
is in the README. Knapp, Ch. VII, §3. -/
theorem kakDecomposition (D : IwasawaData I G) :
    ∀ g : G, ∃ (k₁ k₂ : D.K) (a : G),
      a ∈ lieExp (I := I) '' D.chamber ∧ g = (k₁ : G) * a * (k₂ : G) := sorry

/-- **The global Cartan (polar) decomposition** `G = K · exp 𝔭`: for a Cartan involution datum,
every `g` factors uniquely as `k · lieExp X` with `θ k = k` and `X` in the `−1`-eigenspace of `dθ`.
Knapp, Ch. VI, §2. -/
theorem cartan_polar_decomposition (D : CartanInvolution I G) (g : G) :
    ∃! p : {k : G // D.θ k = k} ×
        {X : LeftInvariantDerivation I G //
          lieMap (⟨D.θ.toMonoidHom, D.smooth⟩ : ContMDiffMonoidMorphism I I ∞ G G) X = -X},
      g = (p.1 : G) * lieExp (I := I) (p.2 : LeftInvariantDerivation I G) := sorry

end RealReductive

end TauCetiRoadmap.RepresentationTheory.LieGroups
