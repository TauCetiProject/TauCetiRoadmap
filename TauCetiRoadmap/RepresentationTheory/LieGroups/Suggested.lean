import Mathlib
import TauCeti.Geometry.Lie.Tangent.LeftInvariantDerivation
import TauCeti.Geometry.Lie.Exponential.Basic
import TauCeti.Geometry.Lie.Functor
import TauCeti.Geometry.Lie.Subgroup.LieAlgebra
import TauCeti.Geometry.Lie.Subgroup.Immersed.Basic
import TauCeti.Geometry.Lie.InvariantVectorField.Foliation
import TauCeti.Geometry.Lie.Subgroup.Torus
import TauCeti.Geometry.Lie.Subgroup.Weyl.Density
import TauCeti.Algebra.Group.NormalizerQuotient.Basic
import TauCeti.Analysis.Matrix.Normed
import TauCeti.Geometry.Lie.Exponential.CommutativeGroup.Basic
import TauCeti.Geometry.Lie.ContinuousFunctor

/-!
# Lie groups and the Lie algebra correspondence: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions
those statements need. The carriers the pins provide are used by name: the Lie algebra
`LeftInvariantDerivation I G`, `lieExp`, `lieMap`, `TauCeti.Lie.lieSubalgebraOfSubgroup`, the
immersed-subgroup predicate `TauCeti.Lie.IsImmersedLieSubgroup`, maximal tori
`TauCeti.Lie.IsMaximalTorus`, the Weyl group `Subgroup.normalizerQuotient` and the Weyl density
`TauCeti.Lie.weylDensity`.

Headline theorems of the README that the pinned Tau Ceti proves, and which are therefore not
restated here: the Lie-algebra comparison of the closed-subgroup theorem
(`TauCeti.Lie.EmbeddedLieSubgroupData.range_lieMapSubtypeVal_eq`), the finiteness of the Weyl group
of a maximal torus of a compact group (`TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`),
`ker Ad = Z(G)` for connected `G` (`TauCeti.Lie.mem_centralizer_iff_forall_Ad_apply_eq_self` for
the whole group), and `Ad (lieExp X) = exp (ad X)` on left-invariant derivations
(`LeftInvariantDerivation.Ad_lieExp`).

Headline theorems of the README that are not statable at the pins, and what each lacks:
* Layer 3, the global Baker–Campbell–Hausdorff series and its convergence, remainder and
  functoriality laws: the pins have no carrier for the degreewise Dynkin series (only the local
  germs `TauCeti.lieLocalBCH` and `NormedSpace.localBCH`), and a `sorry`'d function would be
  sorry'd data.
* Layer 4, the coreflection of §4.3 (integration left adjoint to the Lie functor): the pins have
  neither category nor the Lie functor, and the integration functor is data whose objects are the
  groups of Lie's third theorem, so a `sorry`'d functor would be `sorry`'d data.
* Layer 6, the equivalence `T ↦ ker(exp_T)` of §6.1 from compact connected commutative Lie groups
  to finitely generated free `ℤ`-modules: the pins have neither category, and the functor is data;
  its full faithfulness is stated (`existsUnique_continuousMonoidHom_lieMap_ker`).
* Layer 6, the identification of the geometric Weyl group `N_G(T)/T` with `RootPairing.weylGroup`
  of the compact real root datum, and the positive-root form `∏ |1 − α(t)⁻¹|²` of the Weyl
  density: no root datum is attached to a compact Lie group at the pins; `TauCeti.Lie.weylDensity`
  is the determinant form.
* Layer 7, the compact-complexification criterion and the algebraization `𝐊(ℂ) ≃ K_ℂ`: only the
  existence and universal property of the complexification (for every connected `G`, and with
  injectivity for compact connected `G`) are statable, and the holomorphic extension of a
  representation of compact `G` is that universal property applied to `GL(V) = (V →L[ℂ] V)ˣ`; the
  Lie-algebra formula `Lie(G_ℂ) = (𝔤 ⊗ ℂ)/Lie(N)` and the period subgroup `N` need a
  complexification carrier. The universal properties are stated for target groups in the
  universes of the source; the README states them for every universe.
* Layer 8, the flag manifold as a compact complex manifold, the Bruhat decomposition as a
  `TauCeti.TitsSystem` on `G_ℂ`, Borel–Weil and Borel–Weil–Bott: the pins have no complex reductive
  group carrier with its Borel subgroup, maximal torus and character lattice, and no comparison of
  such a group with `L(λ)`.

README targets that are not headline theorems, and so are not stated here: the compact real form of
a complex semisimple Lie algebra and its conjugacy (Layer 7); the restricted root system, the
uniqueness of the middle `KAK` factor modulo `N_K(𝔞)/Z_K(𝔞)`, and the smoothness of the inverse of
the exponential bijection of a connected immersed subgroup of the positive triangular group
(Layer 9).
-/

namespace TauCetiRoadmap.RepresentationTheory.LieGroups

open scoped Manifold ContDiff Pointwise
open MeasureTheory

universe u v w u' v' w'

section LieFunctor

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- The Lie algebra of a finite-dimensional real Lie group is finite-dimensional: the derivation–tangent
equivalence at the identity, registered as an instance so that the bounded-operator statements below
elaborate. -/
noncomputable instance instFiniteDimensionalLeftInvariantDerivation :
    FiniteDimensional ℝ (LeftInvariantDerivation I G) :=
  finiteDimensional_leftInvariantDerivation BoundarylessManifold.isInteriorPoint

/-! ## Layer 1: the adjoint representations -/

/-- **The left-trivialized derivative of the exponential map**: for every finite-dimensional real
Lie group and every `X ∈ 𝔤`, the derivative of `lieExp` at `X`, read through the
derivation–tangent equivalence, is `d(L_{lieExp X})_1 ∘ ∫_{s ∈ [0,1]} exp(−s · ad X) ds`, the
operator integral being the Bochner integral on `𝔤 →L[ℝ] 𝔤` (so the notation `(1 − exp(−ad X))/ad X`
has a meaning also at singular `ad X`). Convention witness: in `GL₂(ℝ)` with `X = diag(1, 0)`,
`Y = E₁₂`, both sides give `(1 − e⁻¹) E₁₂` (README, §1.4). Hall, *Lie Groups, Lie Algebras, and
Representations*, 2nd ed., Thm. 5.4 for the matrix case. -/
theorem mfderiv_lieExp_eq_integral (X : LeftInvariantDerivation I G) :
    mfderiv 𝓘(ℝ, LeftInvariantDerivation I G) I (lieExp (I := I)) X =
      (mfderiv I I (fun y : G => lieExp (I := I) X * y) 1).comp
        (((leftInvariantDerivationEquivGroupLieAlgebra (I := I) (G := G)
            BoundarylessManifold.isInteriorPoint).toContinuousLinearEquiv :
              LeftInvariantDerivation I G →L[ℝ] GroupLieAlgebra I G).comp
          (∫ s in (0 : ℝ)..1, NormedSpace.exp
            (-(s • LinearMap.toContinuousLinearMap
              (LieAlgebra.ad ℝ (LeftInvariantDerivation I G) X))))) := sorry

/-! ## Layer 2: the closed-subgroup theorem -/

/-- **The direction set of an arbitrary subgroup is a Lie subalgebra**: for every subgroup `K`,
closed or not, the Lie span `TauCeti.Lie.lieSubalgebraOfSubgroup K` adds nothing to the set of
derivations whose one-parameter subgroups lie in `K` (for closed `K` this is
`TauCeti.Lie.mem_lieSubalgebraOfSubgroup`). README, §2.1. -/
theorem mem_lieSubalgebraOfSubgroup_iff (K : Subgroup G) (X : LeftInvariantDerivation I G) :
    X ∈ TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K ↔
      ∀ t : ℝ, lieExp (I := I) (t • X) ∈ K := sorry

end LieFunctor

/-- **`SU(2)` is simply connected**, with its subspace topology from the matrices, through the
identification `SU(2) ≃ S³` by the first column. This is the simply connected rank-one source that
Layer 6 integrates Lie-algebra homomorphisms out of. README, §2.4. -/
theorem simplyConnectedSpace_SU2 :
    SimplyConnectedSpace (Matrix.specialUnitaryGroup (Fin 2) ℂ) := sorry

/-! ## Layer 4: Frobenius, Lie's third theorem, and the equivalence of categories -/

section Integration

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **The subalgebra–immersed-subgroup correspondence** (Frobenius): every Lie subalgebra
`𝔥 ≤ 𝔤` is the Lie algebra of a connected immersed Lie subgroup, the leaf through `1` of the
involutive left-invariant distribution `x ↦ d(L_x)_1 𝔥`. The immersed-subgroup predicate is
`TauCeti.Lie.IsImmersedLieSubgroup`: a connected Lie group with an injective immersive homomorphism
onto `K`, carrying its own (leaf) topology. Kirillov, online author copy, Thms. 3.43 and 3.46;
README, §4.1. -/
theorem exists_immersedLieSubgroup_lieSubalgebra
    (𝔥 : LieSubalgebra ℝ (LeftInvariantDerivation I G)) :
    ∃ K : Subgroup G, TauCeti.Lie.IsImmersedLieSubgroup (I := I) K ∧
      TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K = 𝔥 := sorry

end Integration

section Correspondence

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G]

-- `LieSubalgebra.integralLeafSubgroup` takes an `IsManifold I (1 + 1) G` instance, which instance
-- search does not identify with the `IsManifold I 2 G` instance of `LieGroup I ∞ G`.
local instance : IsManifold I (1 + 1) G := inferInstanceAs (IsManifold I 2 G)

/-- **Naturality of the correspondence**: a smooth homomorphism maps the integral leaf subgroup of
`𝔥` onto the integral leaf subgroup of the image of `𝔥` under its Lie map. README, §4.4. -/
theorem map_integralLeafSubgroup
    {E' : Type u'} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    {H' : Type v'} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'} [I'.Boundaryless]
    {G' : Type w'} [TopologicalSpace G'] [ChartedSpace H' G'] [Group G'] [LieGroup I' ∞ G']
    [T2Space G']
    (φ : ContMDiffMonoidMorphism I I' ∞ G G')
    (𝔥 : LieSubalgebra ℝ (LeftInvariantDerivation I G)) :
    (𝔥.integralLeafSubgroup (I := I)).map φ.toMonoidHom =
      (𝔥.map (lieMap φ)).integralLeafSubgroup (I := I') := sorry

/-- **Normal subgroups and ideals**: in a connected Lie group, a connected immersed Lie subgroup is
normal exactly when its Lie algebra is an ideal. README, §4.4. -/
theorem normal_iff_exists_lieIdeal [ConnectedSpace G] {K : Subgroup G}
    (hK : TauCeti.Lie.IsImmersedLieSubgroup (I := I) K) :
    K.Normal ↔ ∃ 𝔞 : LieIdeal ℝ (LeftInvariantDerivation I G),
      (𝔞 : LieSubalgebra ℝ (LeftInvariantDerivation I G)) =
        TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) K := sorry

/-- **The Lie algebra of the integral leaf subgroup** of `𝔥` is `𝔥`, with no closedness
assumption: the identity in which the route of §4.1 ends. README, §§4.1 and 4.4. -/
theorem lieSubalgebraOfSubgroup_integralLeafSubgroup
    (𝔥 : LieSubalgebra ℝ (LeftInvariantDerivation I G)) :
    TauCeti.Lie.lieSubalgebraOfSubgroup (I := I) (𝔥.integralLeafSubgroup (I := I)) = 𝔥 := sorry

/-- **The Galois connection**: for every Lie subalgebra `𝔥` and every subgroup `Q`, closed or
not, `integralLeafSubgroup 𝔥 ≤ Q ↔ 𝔥 ≤ lieSubalgebraOfSubgroup Q`. With
`lieSubalgebraOfSubgroup_integralLeafSubgroup` it is a Galois coinsertion. Joins of connected
immersed subgroups are therefore the abstract subgroups they generate. README, §4.4. -/
theorem gc_integralLeafSubgroup_lieSubalgebraOfSubgroup :
    GaloisConnection
      (fun 𝔥 : LieSubalgebra ℝ (LeftInvariantDerivation I G) ↦ 𝔥.integralLeafSubgroup (I := I))
      (TauCeti.Lie.lieSubalgebraOfSubgroup (I := I)) := sorry

end Correspondence

/-- **Lie's third theorem**: every finite-dimensional real Lie algebra is `Lie(G)` for a
simply-connected Lie group `G`, stated as existence of a Lie group whose left-invariant derivations
are Lie-isomorphic to `L`. Kirillov, online author copy, Thm. 3.48; README, §4.2. -/
theorem exists_simplyConnected_lieGroup (L : Type u) [LieRing L] [LieAlgebra ℝ L]
    [Module.Finite ℝ L] :
    ∃ (E : Type u) (_ : NormedAddCommGroup E) (_ : NormedSpace ℝ E) (_ : FiniteDimensional ℝ E)
      (H : Type u) (_ : TopologicalSpace H) (I : ModelWithCorners ℝ E H)
      (G : Type u) (_ : TopologicalSpace G) (_ : ChartedSpace H G)
      (_ : Group G) (_ : LieGroup I ∞ G),
      SimplyConnectedSpace G ∧ Nonempty (LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ L) := sorry

/-- **The equivalence of categories** (morphism half): for **simply-connected** `G`, `lieMap` is a
bijection `Hom(G, G') ≃ Hom(𝔤, 𝔤')`. Existence integrates a Lie-algebra homomorphism; uniqueness is
`lieMap_injective`. Kirillov, online author copy, Thm. 3.38 and Cor. 3.50; README, §4.3. -/
theorem exists_monoidHom_of_lieHom
    {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
    [Group G] [LieGroup I ∞ G] [SimplyConnectedSpace G]
    {E' : Type u'} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    {H' : Type v'} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {G' : Type w'} [TopologicalSpace G'] [ChartedSpace H' G']
    [Group G'] [LieGroup I' ∞ G']
    (f : LeftInvariantDerivation I G →ₗ⁅ℝ⁆ LeftInvariantDerivation I' G') :
    ∃ (φ : G →* G') (hφ : ContMDiff I I' ∞ (φ : G → G')),
      lieMap (⟨φ, hφ⟩ : ContMDiffMonoidMorphism I I' ∞ G G') = f := sorry

/-! ## Layer 5: simply-connected covers and the enveloping algebra -/

section Covers

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- **The exponential map of a connected nilpotent Lie group is surjective**: the simply connected
integration of a nilpotent Lie algebra is the global polynomial BCH group, on which `lieExp` is the
identity in coordinates, and `lieExp` descends along the universal covering homomorphism. The
circle `ℝ/ℤ` shows it need not be injective, and `SL₂(ℝ)` (not nilpotent, `diag(−2, −1/2)` not an
exponential) shows the hypothesis is needed. Kirillov, online author copy, Thm. 3.34 for the local
input; README, §5.3. -/
theorem lieExp_surjective_of_isNilpotent [ConnectedSpace G]
    [LieRing.IsNilpotent (LeftInvariantDerivation I G)] :
    Function.Surjective (lieExp (I := I) (G := G)) := sorry

end Covers

/-! ## Layer 6: maximal tori, the Weyl group, and Weyl integration -/

section Tori

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]
  [IsMulCommutative G] [CompactSpace G] [ConnectedSpace G]
  {E' : Type u'} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {H' : Type v'} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
  {G' : Type w'} [TopologicalSpace G'] [ChartedSpace H' G']
  [Group G'] [LieGroup I' ∞ G'] [T2Space G'] [BoundarylessManifold I' G']
  [IsMulCommutative G'] [CompactSpace G'] [ConnectedSpace G']

/-- **Tori and their exponential lattices** (full faithfulness): for compact connected
commutative Lie groups `G` and `G'`, every additive map between the kernels of their exponentials
is the restriction of the Lie map of exactly one continuous homomorphism `G →ₜ* G'`. With
essential surjectivity onto finitely generated free `ℤ`-modules this is the equivalence
`T ↦ ker(exp_T)` of the README, §6.1; for `Circle` the kernel is `2πℤ`, and `z ↦ z²` restricts to
multiplication by `2`. -/
theorem existsUnique_continuousMonoidHom_lieMap_ker
    (g : (TauCeti.lieExpAddMonoidHom (I := I) (G := G)).ker →+
      (TauCeti.lieExpAddMonoidHom (I := I') (G := G')).ker) :
    ∃! f : G →ₜ* G', ∀ X : (TauCeti.lieExpAddMonoidHom (I := I) (G := G)).ker,
      ContinuousMonoidHom.lieMap (I := I) (I' := I') f X = g X := sorry

end Tori

section Structure

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

include I in
/-- **Torus exhaustion** for a compact connected group: every element lies in some maximal torus
(`TauCeti.Lie.IsMaximalTorus`, a compact connected commutative subgroup maximal under inclusion).
On `U(n)` this is the spectral theorem. Bröcker–tom Dieck, Ch. IV, §1; README, §6.3. -/
theorem exists_mem_maximalTorus [CompactSpace G] [ConnectedSpace G] (g : G) :
    ∃ T : Subgroup G, TauCeti.Lie.IsMaximalTorus T ∧ g ∈ T := sorry

include I in
/-- **Conjugacy of maximal tori** for a compact connected group (stated as conjugacy of the
underlying sets). Bröcker–tom Dieck, Ch. IV, §1; README, §6.3. -/
theorem isConj_of_isMaximalTorus [CompactSpace G] [ConnectedSpace G]
    {S T : Subgroup G} (hS : TauCeti.Lie.IsMaximalTorus S) (hT : TauCeti.Lie.IsMaximalTorus T) :
    ∃ g : G, (S : Set G) = (fun x => g * x * g⁻¹) '' (T : Set G) := sorry

/-- Consequently `lieExp` is **surjective** for compact connected `G`. README, §6.3. -/
theorem lieExp_surjective [CompactSpace G] [ConnectedSpace G] :
    Function.Surjective (lieExp (I := I) (G := G)) := sorry

include I in
/-- **Conjugacy in a maximal torus is conjugacy by its normalizer**: two elements of `T` conjugate
in a compact connected `G` are conjugate by an element of `N_G(T)`. With exhaustion, `T` modulo the
normalizer action is the space of conjugacy classes of `G`. Bröcker–tom Dieck, Ch. IV, §2; README,
§6.4. -/
theorem exists_mem_normalizer_conj [CompactSpace G] [ConnectedSpace G]
    (T : Subgroup G) (hT : TauCeti.Lie.IsMaximalTorus T) {t u : G} (ht : t ∈ T) (hu : u ∈ T)
    (g : G) (hg : g * t * g⁻¹ = u) :
    ∃ n ∈ Subgroup.normalizer (T : Set G), n * t * n⁻¹ = u := sorry

include I in
/-- **A maximal torus is its own centralizer** in a compact connected group: an element
centralizing `T` lies in a maximal torus `S`, and `S` and `T` are maximal tori of the connected
centralizer of that element, hence conjugate inside it by an element fixing it. So the Weyl group
`T.normalizerQuotient = N_G(T)/T` acts faithfully on `T`. Bröcker–tom Dieck, Ch. IV, §1; README,
§6.7. -/
theorem centralizer_eq_of_isMaximalTorus [CompactSpace G] [ConnectedSpace G]
    (T : Subgroup G) (hT : TauCeti.Lie.IsMaximalTorus T) :
    Subgroup.centralizer (T : Set G) = T := sorry

/-- **The general Weyl integration formula**: for a continuous class function `f` on a compact
connected `G` with maximal torus `T`, `∫_G f dμ_G = |W|⁻¹ ∫_T f · D dμ_T` with `W = N_G(T)/T` and
`D = TauCeti.Lie.weylDensity T`, `D(t) = |det((Ad(t⁻¹) − 1) on 𝔤 / Lie(T))|`. The measures are
pinned as normalized Haar: with free `μG`, `μT` and density the formula is false (`f = 1`, density
`0`). Bröcker–tom Dieck, Ch. IV, §1; README, §6.9. -/
theorem weyl_integration_formula [CompactSpace G] [ConnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (T : Subgroup G) (hT : TauCeti.Lie.IsMaximalTorus T) [MeasurableSpace T] [BorelSpace T]
    (μG : Measure G) [μG.IsHaarMeasure] [IsProbabilityMeasure μG]
    (μT : Measure T) [μT.IsHaarMeasure] [IsProbabilityMeasure μT]
    (f : G → ℝ) (hf : ∀ g x : G, f (x * g * x⁻¹) = f g) (hf_cont : Continuous f) :
    ∫ g, f g ∂μG
      = (Nat.card T.normalizerQuotient : ℝ)⁻¹
        * ∫ t, f (t : G) * TauCeti.Lie.weylDensity (I := I) T t ∂μT := sorry

/-- **The weighted conjugation pushforward**: the image of `(D/|W|) · (μ_{G/T} ⊗ μ_T)` under
`([g], t) ↦ g t g⁻¹` is `μ_G`. This measure identity, rather than boundedness of `D`, supplies the
weighted `L¹` restriction law of the README, §6.9. -/
theorem weyl_conjugation_pushforward [CompactSpace G] [ConnectedSpace G]
    [MeasurableSpace G] [BorelSpace G]
    (T : Subgroup G) (hT : TauCeti.Lie.IsMaximalTorus T)
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
        ENNReal.ofReal (TauCeti.Lie.weylDensity (I := I) T p.2 /
          (Nat.card T.normalizerQuotient : ℝ)))) = muG := sorry

end Structure

/-! ## Layer 7: complexification and real forms -/

section Complexification

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

include I in
/-- **The universal complexification of a connected Lie group**: a complex Lie group `G_ℂ` with a
continuous homomorphism `η : G → G_ℂ`, universal among continuous homomorphisms of `G` into complex
Lie groups. No injectivity is claimed: `η` is the descent of the integrated real inclusion
`G̃ → H` along the period subgroup `N`, and for the universal cover of `SL₂(ℝ)` its kernel is
nontrivial. Without the universal property the bare existential would be vacuous (the trivial
group satisfies it). Heins, arXiv 2512.07479, Prop. 2.1; README, §7.3. -/
theorem exists_connected_complexification [ConnectedSpace G] :
    ∃ (Ec : Type u) (_ : NormedAddCommGroup Ec) (_ : NormedSpace ℂ Ec)
      (_ : FiniteDimensional ℂ Ec) (Hc : Type v) (_ : TopologicalSpace Hc)
      (Ic : ModelWithCorners ℂ Ec Hc)
      (Gc : Type w) (_ : TopologicalSpace Gc) (_ : ChartedSpace Hc Gc)
      (_ : Group Gc) (_ : LieGroup Ic ∞ Gc) (ι : G →* Gc),
      Continuous (ι : G → Gc) ∧
      ∀ (Ec' : Type u) (_ : NormedAddCommGroup Ec') (_ : NormedSpace ℂ Ec')
        (_ : FiniteDimensional ℂ Ec')
        (Hc' : Type v) (_ : TopologicalSpace Hc') (Ic' : ModelWithCorners ℂ Ec' Hc')
        (Gc' : Type w) (_ : TopologicalSpace Gc') (_ : ChartedSpace Hc' Gc')
        (_ : Group Gc') (_ : LieGroup Ic' ∞ Gc')
        (φ : G →* Gc'), Continuous (φ : G → Gc') →
        ∃! ψ : Gc →* Gc', ContMDiff Ic Ic' ∞ (ψ : Gc → Gc') ∧ ψ.comp ι = φ := sorry

include I in
/-- **The complexification of a compact connected Lie group** is moreover injective on `G`: the
connected statement with `Function.Injective ι` added, proved through a faithful finite-dimensional
unitary representation. On the classical groups `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`.
README, §7.6. -/
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

end Complexification

/-! ## Layer 9: the Cartan, Iwasawa, and KAK decompositions

These decompositions are false for arbitrary subgroups of an arbitrary Lie group: they hold only for
a real reductive `G` with a global matrix-cover model and a genuine Iwasawa triple / restricted-root
chamber. The structures below carry that data, and the theorems consume it rather than assert a
factorization for bare subgroups. -/

section RealReductive

variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type v} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {G : Type w} [TopologicalSpace G] [ChartedSpace H G]
  [Group G] [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]

/-- A global matrix-cover model (README, §9.1): a closed transpose-stable subgroup `H` of
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
reductivity criterion: the Euclidean motion group `ℝⁿ ⋊ O(n)`, `n ≥ 2`, with `(v, k) ↦ (−v, k)` has
compact fixed `O(n)` and a translation radical (README, §9.2). -/
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
positive chamber with its split-centre lineality. `N` is not forced to be `Nplus`; a closed
spanning cone without restricted-root data is not a positive chamber. -/
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
  /-- the whole split central direction is lineality -/
  chamber_split_center : ∀ X ∈ chamber,
    ∀ Z ∈ (LieAlgebra.center ℝ (LeftInvariantDerivation I G)).toSubmodule,
      Z ∈ 𝔞 → X + Z ∈ chamber

/-- **`IsIwasawaTriple K A N`**: `(K, A, N)` are the subgroups of some Iwasawa datum. -/
def IsIwasawaTriple (K A N : Subgroup G) : Prop :=
  ∃ D : IwasawaData I G, D.K = K ∧ D.A = A ∧ D.N = N

/-- **The Iwasawa decomposition** `G = KAN`: for an Iwasawa triple `(K, A, N)` (whose datum
carries the Cartan involution, so `G` is real reductive), every `g` factors uniquely as `k a n`.
Knapp, Ch. VI, §4; README, §9.4. -/
theorem iwasawaDecomposition
    (K A N : Subgroup G) (hKAN : IsIwasawaTriple (I := I) K A N) :
    ∀ g : G, ∃! p : K × A × N, g = (p.1 : G) * (p.2.1 : G) * (p.2.2 : G) := sorry

/-- **The KAK (Cartan) decomposition** `G = K · exp(closed chamber) · K`, with `K` and the chamber
drawn from the same Iwasawa datum; uniqueness of the middle factor modulo the restricted Weyl group
is in the README. Knapp, Ch. VII, §3; README, §9.5. -/
theorem kakDecomposition (D : IwasawaData I G) :
    ∀ g : G, ∃ (k₁ k₂ : D.K) (a : G),
      a ∈ lieExp (I := I) '' D.chamber ∧ g = (k₁ : G) * a * (k₂ : G) := sorry

/-- **The global Cartan (polar) decomposition** `G = K · exp 𝔭`: for a Cartan involution datum,
every `g` factors uniquely as `k · lieExp X` with `θ k = k` and `X` in the `−1`-eigenspace of `dθ`.
Knapp, Ch. VI, §3; README, §9.2. -/
theorem cartan_polar_decomposition (D : CartanInvolution I G) (g : G) :
    ∃! p : {k : G // D.θ k = k} ×
        {X : LeftInvariantDerivation I G //
          lieMap (⟨D.θ.toMonoidHom, D.smooth⟩ : ContMDiffMonoidMorphism I I ∞ G G) X = -X},
      g = (p.1 : G) * lieExp (I := I) (p.2 : LeftInvariantDerivation I G) := sorry

end RealReductive

/-! ### The positive triangular group and its connected immersed subgroups (README, §9.3) -/

/-- The upper-triangular complex matrices with real diagonal, the Lie algebra `𝔞𝔫` of the positive
triangular group. -/
def triangularRealDiagonal (m : ℕ) : Set (Matrix (Fin m) (Fin m) ℂ) :=
  {X | (∀ i j : Fin m, j < i → X i j = 0) ∧ ∀ i, (X i i).im = 0}

/-- The upper-triangular complex matrices with strictly positive real diagonal, the positive
triangular group `AN ⊂ GL_m(ℂ)`. -/
def positiveTriangular (m : ℕ) : Set (Matrix (Fin m) (Fin m) ℂ) :=
  {g | (∀ i j : Fin m, j < i → g i j = 0) ∧ ∀ i, (g i i).im = 0 ∧ 0 < (g i i).re}

/-- **The exponential of the positive triangular group is a global bijection** `𝔞𝔫 → AN`, with
inverse the triangular logarithm recovered gap by gap (diagonal entries `log g_ii`, then the
coefficient `(e^{X_ii} − e^{X_jj})/(X_ii − X_jj)` of `X_ij`, with value `e^{X_ii}` on equal
diagonal entries). For `m = 1` this is the real exponential onto `ℝ_{>0}`; `diag(−1, 1)` shows the
positivity of the diagonal is what makes the map onto. README, §9.3. -/
theorem bijOn_exp_triangular (m : ℕ) :
    Set.BijOn NormedSpace.exp (triangularRealDiagonal m) (positiveTriangular m) := sorry

section PositiveTriangular

open scoped Matrix.Norms.Operator

-- the operator-norm topology on matrices, under which `GL_m(ℂ)` is a real Lie group of units
attribute [local instance] Matrix.linftyOpTopologicalSpace

/-- **The exponential map of a connected immersed subgroup of the positive triangular group is a
global bijection** (and a diffeomorphism for the subgroup's own Lie-group topology, README, §9.3):
for a connected Lie group `C` with an injective smooth immersive homomorphism into `GL_m(ℂ)`, as a
real Lie group of units, whose image lies in `positiveTriangular m`, `lieExp : Lie(C) → C` is
bijective. No closedness or embeddedness of the image is assumed. -/
theorem lieExp_bijective_of_immersed_positiveTriangular (m : ℕ)
    {E' : Type u} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    {H' : Type v} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {C : Type w} [TopologicalSpace C] [ChartedSpace H' C] [Group C] [LieGroup I' ∞ C]
    [T2Space C] [BoundarylessManifold I' C] [ConnectedSpace C]
    (φ : C →* (Matrix (Fin m) (Fin m) ℂ)ˣ)
    (hφ : ContMDiff I' 𝓘(ℝ, Matrix (Fin m) (Fin m) ℂ) ∞ (φ : C → (Matrix (Fin m) (Fin m) ℂ)ˣ))
    (hinj : Function.Injective φ)
    (himm : ∀ c, Function.Injective
      (mfderiv I' 𝓘(ℝ, Matrix (Fin m) (Fin m) ℂ) (φ : C → (Matrix (Fin m) (Fin m) ℂ)ˣ) c))
    (hAN : ∀ c, ((φ c : (Matrix (Fin m) (Fin m) ℂ)ˣ) : Matrix (Fin m) (Fin m) ℂ) ∈
      positiveTriangular m) :
    Function.Bijective (lieExp (I := I') (G := C)) := sorry

end PositiveTriangular

end TauCetiRoadmap.RepresentationTheory.LieGroups
