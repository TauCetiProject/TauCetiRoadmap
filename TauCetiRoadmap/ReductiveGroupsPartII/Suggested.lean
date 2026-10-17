import Mathlib
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Smooth.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.UpperTriangular.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Basic
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.Algebra.AlgebraicGroup.Tangent.Representation
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Adjoint.Classification
import TauCeti.Algebra.AlgebraicGroup.Derived.Basic
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.NumberTheory.LocalField.NormalizedValuation
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

/-!
# Reductive algebraic groups, Part II: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the pinned Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer.

Design choices.
* An affine group scheme over a commutative ring `k` is a commutative Hopf `k`-algebra `H`; its
  `R`-points are the Tau Ceti convolution group `WithConv (H →ₐ[k] R)`.
* `ModelField K`: a field with a nontrivial discrete valuative relation of rank one whose ring of
  integers `𝒪[K]` is henselian with perfect residue field `𝓀[K]`. A nonarchimedean local field
  (Mathlib's `IsNonarchimedeanLocalField`) is one.
* The point topology on `X(R) = Hom_k(A, R)` is the coarsest topology making every evaluation
  continuous; it is a scoped instance of `PointTopology`.
* Abstract root data, valuations and apartments follow Bruhat–Tits I, §6, over a Mathlib
  `RootPairing ι ℝ M N` (roots in `M = V*`, coroots in `N = V`).
-/

namespace TauCetiRoadmap.ReductiveGroupsPartII


noncomputable section

open _root_.CategoryTheory
open scoped TensorProduct

universe u v w

/-! ## Conventions: the valued fields -/

/-- The context of Bruhat–Tits II, 5.1.1, pp. 145–146: `K` is henselian for a nontrivial discrete
valuation of rank one, so that `𝒪[K]` is a discrete valuation ring, and `𝓀[K]` is perfect. Rank one
is a separate field because `ValuativeRel.IsDiscrete` alone also holds for the lexicographic value
group `ℤ × ℤ`. -/
class ModelField (K : Type u) [Field K] [ValuativeRel K] : Prop where
  discrete : ValuativeRel.IsDiscrete K
  nontrivial : ValuativeRel.IsNontrivial K
  rankLeOne : ValuativeRel.IsRankLeOne K
  henselian : HenselianLocalRing (Valuation.integer (ValuativeRel.valuation K))
  perfectResidue : PerfectField (IsLocalRing.ResidueField (Valuation.integer (ValuativeRel.valuation K)))

attribute [instance] ModelField.discrete ModelField.nontrivial ModelField.rankLeOne
  ModelField.henselian ModelField.perfectResidue

/-- A nonarchimedean local field is a `ModelField`. -/
instance {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : ModelField K := by sorry

-- Test ModelField.padic
example (p : ℕ) [Fact p.Prime] : ModelField ℚ_[p] := inferInstance

-- Test ModelField.isDiscreteValuationRing
/- The valuation ring of a `ModelField` is a discrete valuation ring. -/
open ValuativeRel in
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K] :
    IsDiscreteValuationRing 𝒪[K] := sorry

-- Test ModelField.trivial_excluded (non-example)
example {K : Type u} [Field K] [ValuativeRel K] (h : ¬ ValuativeRel.IsNontrivial K) :
    ¬ ModelField K := fun hK => h hK.nontrivial

/-! ## Layer RG2.0: topologies on rational points -/

namespace PointTopology

variable (k : Type u) [CommRing k] (A : Type v) [CommRing A] [Algebra k A]
  (R : Type w) [CommRing R] [Algebra k R] [TopologicalSpace R]

/-- The point topology on `X(R) = Hom_k(A, R)`: the coarsest topology for which every evaluation
map `f ↦ f a` (`a : A`) is continuous ([Conrad], Prop. 2.1, p. 2). -/
@[reducible] def topology : TopologicalSpace (A →ₐ[k] R) :=
  ⨅ a : A, TopologicalSpace.induced (fun f : A →ₐ[k] R => f a) ‹TopologicalSpace R›

/-- The point topology, as a scoped instance. -/
scoped instance instTopologicalSpace : TopologicalSpace (A →ₐ[k] R) := topology k A R

/-- The point topology on the convolution-group carrier `WithConv (A →ₐ[k] R)` of points. -/
scoped instance instTopologicalSpaceWithConv : TopologicalSpace (WithConv (A →ₐ[k] R)) :=
  TopologicalSpace.induced WithConv.ofConv (topology k A R)

end PointTopology

namespace PointTopology

open scoped PointTopology

section Affine

variable {k : Type u} [CommRing k] {A : Type v} [CommRing A] [Algebra k A]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R] [IsTopologicalRing R]

/-- The universal property of the point topology. -/
theorem continuous_iff {Y : Type*} [TopologicalSpace Y] (g : Y → (A →ₐ[k] R)) :
    Continuous g ↔ ∀ a : A, Continuous fun y => g y a := sorry

/-- The point topology is the subspace topology of the product topology on `A → R`. -/
theorem isEmbedding_toPi : Topology.IsEmbedding fun f : A →ₐ[k] R => (⇑f : A → R) := sorry

/-- For a finite generating family and `T1` coefficients, evaluation at the generators is a closed
embedding into `R^ι` ([Conrad], Prop. 2.1 and its proof, pp. 2–3). -/
theorem isClosedEmbedding_eval_generators [T1Space R] {ι : Type*} [Finite ι] (a : ι → A)
    (ha : Algebra.adjoin k (Set.range a) = ⊤) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => fun i => f (a i) := sorry

/-- For `R` locally compact Hausdorff and `A` of finite type, `Hom_k(A, R)` is locally compact. -/
theorem locallyCompactSpace_of_finiteType [T2Space R] [LocallyCompactSpace R]
    [Algebra.FiniteType k A] : LocallyCompactSpace (A →ₐ[k] R) := sorry

/-- Points of a tensor product: `Hom_k(A ⊗_k B, R) ≅ Hom_k(A, R) × Hom_k(B, R)`. -/
theorem isHomeomorph_tensorProduct {B : Type*} [CommRing B] [Algebra k B] :
    IsHomeomorph fun f : A ⊗[k] B →ₐ[k] R =>
      (f.comp (Algebra.TensorProduct.includeLeft (S := k)),
        f.comp (Algebra.TensorProduct.includeRight)) := sorry

/-- Localizations give open embeddings when `R^×` is open with continuous inversion
([Conrad], §3 and proof of Prop. 3.1, pp. 3–4). -/
theorem isOpenEmbedding_localization (f : A) (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    Topology.IsOpenEmbedding fun x : Localization.Away f →ₐ[k] R =>
      x.comp (IsScalarTower.toAlgHom k A (Localization.Away f)) := sorry

-- Test PointTopology.polynomial_homeomorph
example : IsHomeomorph (fun f : Polynomial k →ₐ[k] R => f Polynomial.X) := by sorry

-- Test PointTopology.discrete_of_discrete
example [DiscreteTopology R] [Algebra.FiniteType k A] : DiscreteTopology (A →ₐ[k] R) := by sorry

-- Test PointTopology.pi_compat
example : (PointTopology.topology k A R) =
    TopologicalSpace.induced (fun f : A →ₐ[k] R => (⇑f : A → R)) Pi.topologicalSpace := by
  rw [induced_to_pi]

-- Test PointTopology.not_discrete_infinite
/- Without finite type, discrete coefficients do not give a discrete space: the points of
`𝔽₂[x₀, x₁, …]` with values in `𝔽₂` form the product space `𝔽₂^ℕ`. -/
example : ¬ DiscreteTopology (MvPolynomial ℕ (ZMod 2) →ₐ[ZMod 2] ZMod 2) := sorry

-- Test PointTopology.units_hyperbola
/- On `G_m(ℚ_p)` the hyperbola topology is the subspace topology of `ℚ_p`. -/
example (p : ℕ) [Fact p.Prime] :
    Topology.IsEmbedding fun f : LaurentPolynomial ℤ →ₐ[ℤ] ℚ_[p] => f (LaurentPolynomial.T 1) :=
  sorry

end Affine

section Group

variable {k : Type u} [CommRing k] {H : Type v} [CommRing H] [HopfAlgebra k H]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R]

/-- The convolution group of points over a topological ring is a topological group. -/
theorem isTopologicalGroup [IsTopologicalRing R] : IsTopologicalGroup (WithConv (H →ₐ[k] R)) :=
  sorry

/-- For `GL_n`, Tau Ceti's `TauCeti.GeneralLinear.pointsMulEquiv` is a homeomorphism from the
points with the point topology onto `GL_n(R)` with the units topology of `M_n(R)`. -/
def generalLinearPointsHomeomorph [IsTopologicalRing R] (n : ℕ) :
    WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra k n →ₐ[k] R) ≃ₜ
      Matrix.GeneralLinearGroup (Fin n) R where
  toEquiv := (TauCeti.GeneralLinear.pointsMulEquiv (R := k) n (A := R)).toEquiv
  continuous_toFun := sorry
  continuous_invFun := sorry

-- Test PointTopology.generalLinearPointsHomeomorph_isOpenEmbedding
example (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (n : ℕ) :
    Topology.IsOpenEmbedding
      (fun x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra E n →ₐ[E] E) =>
        ((generalLinearPointsHomeomorph (k := E) (R := E) n x) :
          Matrix (Fin n) (Fin n) E)) := by sorry

end Group

section LocalInstances

variable {E : Type u} [Field E] [TopologicalSpace E] {H : Type v} [CommRing H] [HopfAlgebra E H]

/-- Points of an affine group over a nonarchimedean local field form a Hausdorff space. -/
instance instT2SpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    T2Space (WithConv (H →ₐ[E] E)) := sorry

instance instLocallyCompactSpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E]
    [Algebra.FiniteType E H] : LocallyCompactSpace (WithConv (H →ₐ[E] E)) := sorry

instance instSecondCountableTopologyLocal [ValuativeRel E] [IsNonarchimedeanLocalField E]
    [Algebra.FiniteType E H] : SecondCountableTopology (WithConv (H →ₐ[E] E)) := sorry

/-- Points over a nonarchimedean local field form a totally disconnected space. -/
instance instTotallyDisconnectedSpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    TotallyDisconnectedSpace (WithConv (H →ₐ[E] E)) := sorry

instance instIsTopologicalGroupLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    IsTopologicalGroup (WithConv (H →ₐ[E] E)) :=
  isTopologicalGroup

-- Test PointTopology.real_units_not_totallyDisconnected
/- The local-field hypothesis is needed: the points of `G_m` over `ℝ` form `ℝ^×`, whose half-line
of positive reals is connected. -/
example : ¬ TotallyDisconnectedSpace (WithConv (LaurentPolynomial ℝ →ₐ[ℝ] ℝ)) := sorry

end LocalInstances

section Integral

open ValuativeRel

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Integral points of a finite-type `𝒪[E]`-algebra are open inside rational points. -/
theorem isOpenEmbedding_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] :
    Topology.IsOpenEmbedding fun f : A →ₐ[𝒪[E]] 𝒪[E] =>
      (Algebra.ofId 𝒪[E] E).comp f := sorry

/-- Integral points of a finite-type `𝒪[E]`-algebra form a compact space. -/
theorem compactSpace_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] : CompactSpace (A →ₐ[𝒪[E]] 𝒪[E]) := sorry

-- Test PointTopology.generalLinear_integral_iff_det
/- An `E`-matrix lifts to a point of `GL_n` over `𝒪[E]` exactly when it lifts to a matrix over
`𝒪[E]` with unit determinant. -/
example (n : ℕ) (g : Matrix (Fin n) (Fin n) E) :
    (∃ x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] n →ₐ[𝒪[E]] 𝒪[E]),
      (TauCeti.GeneralLinear.pointsMulEquiv (R := 𝒪[E]) n (A := 𝒪[E]) x :
        Matrix (Fin n) (Fin n) 𝒪[E]).map (algebraMap 𝒪[E] E) = g) ↔
    ∃ M : Matrix (Fin n) (Fin n) 𝒪[E],
      M.map (algebraMap 𝒪[E] E) = g ∧ IsUnit M.det := by
  constructor
  · rintro ⟨x, hx⟩
    exact ⟨_, hx, (Matrix.isUnit_iff_isUnit_det _).mp (Units.isUnit _)⟩
  · rintro ⟨M, hM, hdet⟩
    obtain ⟨u, hu⟩ := (Matrix.isUnit_iff_isUnit_det M).mpr hdet
    refine ⟨(TauCeti.GeneralLinear.pointsMulEquiv (R := 𝒪[E]) n (A := 𝒪[E])).symm u, ?_⟩
    simpa only [MulEquiv.apply_symm_apply, hu] using hM

-- Test PointTopology.diag_uniformizer_not_integral
/- `diag(ϖ, 1)` has integral entries and nonzero determinant but is not a point of `GL_2` over
`𝒪[E]`. -/
example (ϖ : 𝒪[E]) (hϖ : Irreducible ϖ) :
    ¬ ∃ x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] 2 →ₐ[𝒪[E]] 𝒪[E]),
      (TauCeti.GeneralLinear.pointsMulEquiv (R := 𝒪[E]) 2 (A := 𝒪[E]) x :
        Matrix (Fin 2) (Fin 2) 𝒪[E]) = Matrix.diagonal ![ϖ, 1] := by
  rintro ⟨x, hx⟩
  apply hϖ.not_isUnit
  have hM : IsUnit (Matrix.diagonal ![ϖ, 1]) := hx ▸ Units.isUnit _
  rw [Matrix.isUnit_iff_isUnit_det, Matrix.det_diagonal] at hM
  simpa [Fin.prod_univ_two] using hM

end Integral

end PointTopology

namespace CongruenceSubgroup

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  (H : Type u) [CommRing H] [HopfAlgebra 𝒪[E] H]

/-- The `n`-th congruence subgroup: the kernel of reduction `𝒢(𝒪) → 𝒢(𝒪/𝓂^n)`. -/
def subgroup (n : ℕ) : Subgroup (WithConv (H →ₐ[𝒪[E]] 𝒪[E])) :=
  (TauCeti.AlgHom.mapValue (H := H) (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n))).ker

instance normal (n : ℕ) : (subgroup E H n).Normal := MonoidHom.normal_ker _

open scoped PointTopology in
/-- The congruence subgroups of a finite-type model form a neighbourhood basis of the identity. -/
theorem hasBasis_nhds_one [Algebra.FiniteType 𝒪[E] H] :
    (nhds (1 : WithConv (H →ₐ[𝒪[E]] 𝒪[E]))).HasBasis (fun _ : ℕ => True)
      fun n => (subgroup E H n : Set (WithConv (H →ₐ[𝒪[E]] 𝒪[E]))) := sorry

open scoped PointTopology in
/-- The first congruence subgroup of a finite-type model is pro-`p`, `p = char 𝓀[E]`. -/
theorem isProP_one [Algebra.FiniteType 𝒪[E] H] :
    TauCeti.IsProP (ringChar 𝓀[E]) (subgroup E H 1) := sorry

/-- For a smooth model and `n ≥ 1`, the consecutive congruence quotient has `q^d` elements, `d` the
rank of the cotangent space `ker ε / (ker ε)²` at the identity. -/
theorem natCard_quotient_succ [Algebra.Smooth 𝒪[E] H] (n : ℕ) (hn : 1 ≤ n) :
    Nat.card ((subgroup E H n) ⧸ (subgroup E H (n + 1)).subgroupOf (subgroup E H n)) =
      Nat.card 𝓀[E] ^
        Module.finrank 𝒪[E] (RingHom.ker (Bialgebra.counitAlgHom 𝒪[E] H : H →+* 𝒪[E])).Cotangent :=
  sorry

-- Test CongruenceSubgroup.natCard_quotient_zero_multiplicative
/- The hypothesis `1 ≤ n` is needed: for `G_m` the quotient `𝒢(𝒪)_0/𝒢(𝒪)_1 ≅ 𝓀^×` has `q − 1`
elements, not `q`. -/
example : Nat.card ((subgroup E (LaurentPolynomial 𝒪[E]) 0) ⧸
    (subgroup E (LaurentPolynomial 𝒪[E]) 1).subgroupOf (subgroup E (LaurentPolynomial 𝒪[E]) 0)) =
      Nat.card 𝓀[E] - 1 := sorry

-- Test CongruenceSubgroup.not_isProP_zero_generalLinear
/- The level `1` in `isProP_one` is needed: `𝒢(𝒪)_0/𝒢(𝒪)_1 = GL_2(𝓀)` has order
`q(q − 1)(q² − 1)`, not a power of `p`. -/
open scoped PointTopology in
example : ¬ TauCeti.IsProP (ringChar 𝓀[E])
    (subgroup E (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] 2) 0) := sorry

-- Test CongruenceSubgroup.iInf_eq_bot
example : (⨅ n : ℕ, subgroup E H n) = ⊥ := by sorry

end CongruenceSubgroup

/-! ## Layer RG2.0a: Weil restriction and norm tori -/

namespace WeilRestriction

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  (A' : Type u) [CommRing A'] [Algebra k' A']

/-- The functor of points of the Weil restriction: `R ↦ Hom_{k'}(A', k' ⊗_k R)`. -/
def functor : CommAlgCat.{u} k ⥤ Type u where
  obj R := A' →ₐ[k'] k' ⊗[k] R
  map {R S} f := TypeCat.ofHom fun g => (Algebra.TensorProduct.map (AlgHom.id k' k') f.hom).comp g
  map_id _ := by
    ext g a
    simp
  map_comp _ _ := by
    ext g a
    simp [Algebra.TensorProduct.map_id_comp]

/-- For `k → k'` finite locally free, the Weil restriction of every affine `k'`-scheme is an affine
`k`-scheme: its functor of points is corepresentable (Bruhat–Tits II, 1.5.1–1.5.7, pp. 26–29). -/
theorem functor_isCorepresentable [Module.Finite k k'] [Module.Projective k k'] :
    (functor k k' A').IsCorepresentable := sorry

-- Test WeilRestriction.functor_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (B : Type u) [CommRing B] [Algebra k B] :
    (functor k k B).obj (CommAlgCat.of k R) ≃ (B →ₐ[k] R) :=
  AlgEquiv.arrowCongr AlgEquiv.refl (Algebra.TensorProduct.lid k R)

-- Test WeilRestriction.functor_empty
/- The restriction of the empty scheme `Spec 0` has no points as soon as `k' ⊗_k R ≠ 0`. -/
example (R : Type u) [CommRing R] [Algebra k R] [Nontrivial (k' ⊗[k] R)] :
    IsEmpty ((functor k k' PUnit.{u + 1}).obj (CommAlgCat.of k R)) := by
  refine ⟨fun (f : PUnit.{u + 1} →ₐ[k'] k' ⊗[k] R) => ?_⟩
  have h1 : f 1 = 1 := map_one f
  have h0 : f 0 = 0 := map_zero f
  rw [show (1 : PUnit.{u + 1}) = 0 from Subsingleton.elim _ _, h0] at h1
  exact zero_ne_one h1

-- Test WeilRestriction.functor_affineLine
example (R : Type u) [CommRing R] [Algebra k R] :
    (functor k k' (Polynomial k')).obj (CommAlgCat.of k R) ≃ (k' ⊗[k] R) := by sorry

-- Test WeilRestriction.res_not_commutative_of_commutative_base
example :
    ((!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℂ) * !![1, 0; 1, 1]) ≠
      (!![1, 0; 1, 1] : Matrix (Fin 2) (Fin 2) ℂ) * !![1, 1; 0, 1] := by sorry

end WeilRestriction

namespace NormTorus

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']

/-- The norm `Res_{k'/k} G_m → G_m` on points: the algebra norm of `R ⊗_k k'` over `R`, on units. -/
def norm (R : Type u) [CommRing R] [Algebra k R] : (k' ⊗[k] R)ˣ →* Rˣ :=
  (Units.map (Algebra.norm R : (R ⊗[k] k') →* R)).comp
    (Units.map (Algebra.TensorProduct.comm k k' R).toMonoidHom)

/-- The kernel subgroup of the norm on units. For finite separable extensions of fields
these are the points of the norm-one torus. -/
def normOne (R : Type u) [CommRing R] [Algebra k R] : Subgroup (k' ⊗[k] R)ˣ := (norm k k' R).ker

/-- On the diagonal `G_m ⊂ Res_{k'/k} G_m` the norm is the `d`-th power, `d = rank_k k'`: the
specialisation of Mathlib's `Algebra.norm_algebraMap` and `Module.finrank_baseChange` to the carrier
`k' ⊗[k] R` through `Algebra.TensorProduct.comm`. -/
theorem norm_comp_diagonal [Module.Finite k k'] [Module.Free k k'] (R : Type u) [CommRing R]
    [Algebra k R] (r : Rˣ) :
    norm k k' R (Units.map (Algebra.TensorProduct.includeRight).toMonoidHom r) =
      r ^ Module.finrank k k' := sorry

/-- A finite-type Hopf algebra representing the norm-one points naturally is a torus. -/
theorem normOne_isTorus (K : Type u) [Field K] (K' : Type u) [Field K'] [Algebra K K']
    [FiniteDimensional K K'] [Algebra.IsSeparable K K']
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (e : ∀ (R : Type u) [CommRing R] [Algebra K R],
      WithConv ((H : Type u) →ₐ[K] R) ≃* normOne K K' R)
    (he : ∀ (R S : Type u) [CommRing R] [Algebra K R] [CommRing S] [Algebra K S]
      (ψ : R →ₐ[K] S) (x : WithConv ((H : Type u) →ₐ[K] R)),
      (e S (WithConv.toConv (ψ.comp x.ofConv)) : (K' ⊗[K] S)ˣ) =
        Units.map (Algebra.TensorProduct.map (AlgHom.id K K') ψ).toMonoidHom
          (e R x : (K' ⊗[K] R)ˣ)) :
    TauCeti.torusCommHopfAlgProperty K H := sorry

/-- Over a separably closed field the norm-one torus splits, of rank `[K' : K] - 1`. -/
theorem characterGroup_normOne (K : Type u) [Field K] (K' : Type u) [Field K'] [Algebra K K']
    [FiniteDimensional K K'] [Algebra.IsSeparable K K'] (Ω : Type u) [Field Ω] [Algebra K Ω]
    [IsSepClosed Ω] :
    Nonempty (normOne K K' Ω ≃* (Fin (Module.finrank K K' - 1) → Ωˣ)) := sorry

-- Test NormTorus.norm_complex
example (z : ℂˣ) :
    ((norm ℝ ℂ ℝ (Units.map (Algebra.TensorProduct.rid ℝ ℂ ℂ).symm.toMonoidHom z) : ℝˣ) : ℝ) =
      (z : ℂ).re ^ 2 + (z : ℂ).im ^ 2 := sorry

-- Test NormTorus.normOne_complex
example (z : ℂˣ) :
    Units.map (Algebra.TensorProduct.rid ℝ ℂ ℂ).symm.toMonoidHom z ∈ normOne ℝ ℂ ℝ ↔
      ‖(z : ℂ)‖ = 1 := sorry

-- Test NormTorus.norm_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (z : (k ⊗[k] R)ˣ) :
    norm k k R z = Units.map (Algebra.TensorProduct.lid k R).toMonoidHom z := by sorry

-- Test NormTorus.normOne_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] : normOne k k R = ⊥ := by sorry

-- Test NormTorus.norm_not_surjective_points
example : ¬ Function.Surjective (norm ℝ ℂ ℝ) := by sorry

-- Test NormTorus.normOne_I
example : Units.map (Algebra.TensorProduct.rid ℝ ℂ ℂ).symm.toMonoidHom
    (Units.mk0 Complex.I (by simp)) ∈ normOne ℝ ℂ ℝ := by sorry

-- Test NormTorus.normOne_split_complex
example : Nonempty (normOne ℝ ℂ ℂ ≃* ℂˣ) := by sorry

-- Test NormTorus.resRootsOfUnity_complex
example : Nat.card (rootsOfUnity 4 ℂ) = 4 := by sorry

-- Test NormTorus.resRootsOfUnity_split
example : Nat.card (rootsOfUnity 2 (ℝ × ℝ)) = 4 := by sorry

end NormTorus

/-! ## Layer RG2.1: root data, valuations and apartments -/

namespace AlgebraicRelativeRoots

open TauCeti.GeneralLinear

variable (k : Type u) [Field k]

-- Test AlgebraicRelativeRoots.GL2_zero_weight
example :
    (∀ x : Module.Dual k (TauCeti.Bialgebra.CotangentSpace k (coordinateHopfAlgebra k 2)),
      x ∈ Derivation.adjointWeightSpace (diagonalTorusCoordinateMap (R := k) (N := 2)).hom 1 ↔
        cotangentDualMatrixEquiv x 0 1 = 0 ∧ cotangentDualMatrixEquiv x 1 0 = 0) ∧
    Module.finrank k
      (Derivation.adjointWeightSpace (diagonalTorusCoordinateMap (R := k) (N := 2)).hom 1) = 2 :=
  by sorry

-- Test AlgebraicRelativeRoots.GL2_nonzero_weights
example :
    (∀ α : Multiplicative (ULift.{u} (Fin 2) →₀ ℤ),
      α ∈ Derivation.nontrivialAdjointWeights
        (diagonalTorusCoordinateMap (R := k) (N := 2)).hom ↔
          α = matrixUnitWeight 0 1 ∨ α = matrixUnitWeight 1 0) ∧
    Derivation.adjointWeightSpace (diagonalTorusCoordinateMap (R := k) (N := 2)).hom
        (matrixUnitWeight 0 1) = k ∙ matrixUnitTangent (k := k) 0 1 ∧
    Derivation.adjointWeightSpace (diagonalTorusCoordinateMap (R := k) (N := 2)).hom
        (matrixUnitWeight 1 0) = k ∙ matrixUnitTangent (k := k) 1 0 ∧
    Module.finrank k (Derivation.adjointWeightSpace
      (diagonalTorusCoordinateMap (R := k) (N := 2)).hom (matrixUnitWeight 0 1)) = 1 ∧
    Module.finrank k (Derivation.adjointWeightSpace
      (diagonalTorusCoordinateMap (R := k) (N := 2)).hom (matrixUnitWeight 1 0)) = 1 := by sorry

-- Test AlgebraicRelativeRoots.root_free_torus
example : Derivation.nontrivialAdjointWeights
    (diagonalTorusCoordinateMap (R := k) (N := 1)).hom = ∅ := by sorry

end AlgebraicRelativeRoots

namespace BruhatTits

variable {ι M N : Type u} [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]

/-- Bruhat–Tits I, 6.1.1, p. 107: a root datum of type `Φ` in a group `G` (axioms DR1–DR6), for a
possibly nonreduced root system given as a Mathlib root pairing over `ℝ`. The cosets
`reflectionCoset` are the sets `M_a`; `positiveVector` chooses the positive system used in DR6. -/
structure RootDatum (G : Type v) [Group G] (Φ : RootPairing ι ℝ M N) where
  T : Subgroup G
  U : ι → Subgroup G
  /-- DR1. -/
  U_ne_bot : ∀ i, U i ≠ ⊥
  /-- DR2, for `b ∉ -ℝ₊ a`. -/
  commutator_le : ∀ i j, (∀ c : ℝ, 0 < c → Φ.root j ≠ -c • Φ.root i) →
    ⁅U i, U j⁆ ≤ ⨆ (k : ι) (_ : ∃ p q : ℕ, 0 < p ∧ 0 < q ∧
      Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j), U k
  /-- DR3. -/
  le_of_root_eq_two_smul : ∀ i j, Φ.root j = (2 : ℝ) • Φ.root i → U j ≤ U i
  ne_of_root_eq_two_smul : ∀ i j, Φ.root j = (2 : ℝ) • Φ.root i → U j ≠ U i
  reflectionCoset : ι → Set G
  /-- DR4: a right coset of `T`, and the rank-one Bruhat containment. -/
  reflectionCoset_eq : ∀ i, ∃ m : G, reflectionCoset i = {g | ∃ t ∈ T, g = t * m}
  bruhat : ∀ i j, Φ.root j = -Φ.root i → ∀ u ∈ U j, u ≠ 1 →
    ∃ a ∈ U i, ∃ m ∈ reflectionCoset i, ∃ b ∈ U i, u = a * m * b
  /-- DR5. -/
  reflection_conjugates : ∀ i j m, m ∈ reflectionCoset i →
    (U j).map (MulAut.conj m).toMonoidHom = U (Φ.reflectionPerm i j)
  positiveVector : N
  positiveVector_regular : ∀ i, Φ.toLinearMap (Φ.root i) positiveVector ≠ 0
  /-- DR6: `T U⁺ ∩ U⁻ = {1}`. -/
  bruhat_separation : ∀ t ∈ T,
    ∀ u ∈ (⨆ (i : ι) (_ : 0 < Φ.toLinearMap (Φ.root i) positiveVector), U i),
      t * u ∈ (⨆ (i : ι) (_ : Φ.toLinearMap (Φ.root i) positiveVector < 0), U i) →
        t * u = 1

namespace RootDatum

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}

/-- The group `N` generated by `T` and the cosets `M_a` (Bruhat–Tits I 6.1.2 (10), p. 109). -/
def weylNormalizer (D : RootDatum G Φ) : Subgroup G :=
  Subgroup.closure ((D.T : Set G) ∪ ⋃ i, D.reflectionCoset i)

instance T_normal_weylNormalizer (D : RootDatum G Φ) :
    (D.T.subgroupOf D.weylNormalizer).Normal := sorry

/-- `N/T ≃ W(Φ)` for a finite root system, through the action of `N` on the root subgroups,
`n U_a n⁻¹ = U_{ν(n) a}` (Bruhat–Tits I 6.1.2 (10), p. 109, and 6.1.11 (ii), p. 115). -/
theorem exists_weylGroupEquiv [Finite ι] (D : RootDatum G Φ) :
    ∃ e : D.weylNormalizer ⧸ D.T.subgroupOf D.weylNormalizer ≃* Φ.weylGroup,
      ∀ (n : D.weylNormalizer) (i : ι), (D.U i).map (MulAut.conj (n : G)).toMonoidHom =
        D.U (((e (QuotientGroup.mk n) : Φ.weylGroup) : RootPairing.Aut Φ).indexEquiv i) := sorry

/-- A root datum is generating if `T` and the root subgroups generate `G`. -/
def IsGenerating (D : RootDatum G Φ) : Prop :=
  Subgroup.closure ((D.T : Set G) ∪ ⋃ i, (D.U i : Set G)) = ⊤

-- Test BruhatTits.RootDatum.isGenerating_rankZero
example [IsEmpty ι] (D : RootDatum G Φ) : D.IsGenerating ↔ D.T = ⊤ := by
  rw [IsGenerating, Set.iUnion_of_empty, Set.union_empty, Subgroup.closure_eq]

-- Test BruhatTits.RootDatum.not_of_trivial_U
example (D : RootDatum G Φ) (i : ι) : D.U i ≠ ⊥ := D.U_ne_bot i

-- Test BruhatTits.RootDatum.opposite_ne
example (D : RootDatum G Φ) (i j : ι) (hij : Φ.root j = -Φ.root i) : D.U i ≠ D.U j := by sorry

-- Test BruhatTits.RootDatum.weylNormalizer_rankZero
example [IsEmpty ι] (D : RootDatum G Φ) : D.weylNormalizer = D.T := by sorry

-- Test BruhatTits.RootDatum.weylNormalizer_reflection
example (D : RootDatum G Φ) (i : ι) (m : G) (hm : m ∈ D.reflectionCoset i) :
    m ∈ D.weylNormalizer := by sorry

-- Test BruhatTits.RootDatum.weylNormalizer_contains_torus
example (D : RootDatum G Φ) : D.T ≤ D.weylNormalizer := by sorry

end RootDatum

-- Test BruhatTits.RootDatum.rankZero
example {G : Type v} [Group G] (Φ : RootPairing ι ℝ M N) [IsEmpty ι] (T : Subgroup G) :
    ∃ D : RootDatum G Φ, D.T = T := by sorry

-- Test BruhatTits.RootDatum.sl2
example (K : Type) [Field K] :
    ∃ (Φ : RootPairing (Fin 2) ℝ ℝ ℝ) (D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ),
      D.IsGenerating := sorry

/-- Bruhat–Tits I, 6.2.1, pp. 116–117: a valuation of a root datum (axioms V0–V5). Real shifts in
V2 and V5 avoid subtraction involving `∞`. -/
structure Valuation {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ) where
  φ : (i : ι) → D.U i → WithTop ℝ
  /-- V0. -/
  three_values : ∀ i, 3 ≤ (Set.range (φ i)).encard
  /-- V1: the identity has infinite valuation, and each raw valuation cutoff is a subgroup. -/
  φ_eq_top_iff : ∀ i u, φ i u = ⊤ ↔ u = 1
  /-- The raw root filtration `U_{a,c} = {u : φ_a(u) ≥ c}`. A positive-depth
  Moy–Prasad factor on a nonreduced ray also uses the separate doubled-root cutoff. -/
  filtration : ι → ℝ → Subgroup G
  mem_filtration_iff : ∀ i r g, g ∈ filtration i r ↔
    ∃ u : D.U i, (u : G) = g ∧ (r : WithTop ℝ) ≤ φ i u
  /-- V2: the opposite-root valuation changes by a constant under a reflection lift. -/
  reflection_shift : ∀ i j, Φ.root j = -Φ.root i → ∀ m ∈ D.reflectionCoset i,
    ∃ c : ℝ, ∀ (u : D.U j) (v : D.U i), u ≠ 1 →
      (v : G) = m * (u : G) * m⁻¹ → φ j u = φ i v + (c : WithTop ℝ)
  /-- V3: depth-additive commutators, excluding negatively proportional roots. -/
  commutator_filtration_le : ∀ i j, (∀ c : ℝ, 0 < c → Φ.root j ≠ -c • Φ.root i) →
    ∀ r s : ℝ, ⁅filtration i r, filtration j s⁆ ≤
      ⨆ (k : ι) (p : ℕ) (q : ℕ) (_ : 0 < p ∧ 0 < q ∧
        Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j),
        filtration k ((p : ℝ) * r + (q : ℝ) * s)
  /-- V4. -/
  doubling : ∀ i j (h : Φ.root j = (2 : ℝ) • Φ.root i) (u : D.U j),
    φ j u = 2 * φ i ⟨u, D.le_of_root_eq_two_smul i j h u.property⟩
  /-- V5: the opposite factors in a rank-one Bruhat factorization have opposite depth. -/
  bruhat_value : ∀ i j, Φ.root j = -Φ.root i →
    ∀ (u : D.U i) (a b : D.U j), u ≠ 1 →
      (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i →
        ∃ r : ℝ, φ i u = (r : WithTop ℝ) ∧ φ j a = ((-r : ℝ) : WithTop ℝ) ∧
          φ j b = ((-r : ℝ) : WithTop ℝ)

-- Test BruhatTits.Valuation.rankZero
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} [IsEmpty ι]
    (D : RootDatum G Φ) : Nonempty (Valuation D) := by sorry

namespace Valuation

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

/-- The value set `Γ_a = φ_a(U_a ∖ {1})`. -/
def valueSet (i : ι) : Set ℝ := {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ)}

/-- `Γ_{−a} = −Γ_a` (Bruhat–Tits I 6.2.2, p. 117). -/
theorem valueSet_neg (i j : ι) (hij : Φ.root j = -Φ.root i) :
    φ.valueSet j = -φ.valueSet i := sorry

/-- The set `Γ'_a ⊆ Γ_a` of values at elements `u ≠ 1` maximal on their coset `u U_{2a}`
(Bruhat–Tits I 6.2.2, p. 117); the constants of affine roots of gradient `a` lie in `Γ'_a`. -/
def primedValueSet (i : ι) : Set ℝ :=
  {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ) ∧
    ∀ (j : ι) (hj : Φ.root j = (2 : ℝ) • Φ.root i) (w : G) (hw : w ∈ D.U j),
      φ.φ i ⟨(u : G) * w, mul_mem u.2 (D.le_of_root_eq_two_smul i j hj hw)⟩ ≤ φ.φ i u}

/-- Discreteness: every bounded interval contains only finitely many root values (closed discrete,
which is stronger than the discrete subsets of Bruhat–Tits I, Def. 6.2.21, p. 127, for abstract
data and agrees with it for the value sets of reductive groups, which are cosets of discrete
groups). -/
def IsDiscrete : Prop := ∀ i (a b : ℝ), (φ.valueSet i ∩ Set.Icc a b).Finite

-- Test BruhatTits.Valuation.not_constant
/- A root-value map with at most two values violates (V0); in particular the trivial valuation of
`K` gives no valuation of the root datum of `SL₂(K)`. -/
example (i : ι) (c₁ c₂ : WithTop ℝ) : ¬ ∀ u : D.U i, φ.φ i u = c₁ ∨ φ.φ i u = c₂ := by
  intro h
  have hsub : Set.range (φ.φ i) ⊆ {c₁, c₂} := by
    rintro _ ⟨u, rfl⟩
    exact h u
  have h2 : ({c₁, c₂} : Set (WithTop ℝ)).encard ≤ 2 :=
    (Set.encard_insert_le _ _).trans (by rw [Set.encard_singleton]; rfl)
  have h3 := (φ.three_values i).trans ((Set.encard_le_encard hsub).trans h2)
  norm_num at h3

-- Test BruhatTits.Valuation.primedValueSet_eq_of_not_multipliable
/- For a non-multipliable root the two value sets agree. -/
example (i : ι) (h : ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i) : φ.primedValueSet i = φ.valueSet i := by
  refine Set.Subset.antisymm (fun _ ⟨u, hu, hφ, _⟩ => ⟨u, hu, hφ⟩) ?_
  rintro r ⟨u, hu, hφ⟩
  exact ⟨u, hu, hφ, fun j hj => absurd hj (h j)⟩

-- Test BruhatTits.Valuation.one_top
example (i : ι) : φ.φ i 1 = ⊤ := (φ.φ_eq_top_iff i 1).mpr rfl

-- Test BruhatTits.Valuation.isDiscrete_rankZero
example [IsEmpty ι] : φ.IsDiscrete := by sorry

-- Test BruhatTits.Valuation.opposite_depths
example (i j : ι) (hij : Φ.root j = -Φ.root i) (u : D.U i) (a b : D.U j)
    (hf : (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i)
    (hu : φ.φ i u = 1 ∨ φ.φ i u = 2) :
    (φ.φ i u = 1 ∧ φ.φ j a = -1 ∧ φ.φ j b = -1) ∨
      (φ.φ i u = 2 ∧ φ.φ j a = -2 ∧ φ.φ j b = -2) := by sorry

end Valuation

-- Test BruhatTits.Valuation.sl2_standard
/- For a nontrivial real valuation `ω` of `K`, the diagonal torus and the two unipotent subgroups of
`SL₂(K)` carry a valuation with `φ_+(x_+(c)) = φ_−(x_−(c)) = ω(c)` (Bruhat–Tits I 6.2.3 a),
p. 117). -/
example (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ)) (hω : ∃ x : K, x ≠ 0 ∧ ω x ≠ 0) :
    ∃ (Φ : RootPairing (Fin 2) ℝ ℝ ℝ) (D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ)
      (φ : Valuation D), ∀ c : K,
        (∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
          φ.φ 0 ⟨_, h⟩ = ω c) ∧
        (∃ h : (⟨!![1, 0; c, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 1,
          φ.φ 1 ⟨_, h⟩ = ω c) := sorry

-- Test BruhatTits.Valuation.isDiscrete_sl2_standard
/- If `ω(K^×) = ℤ`, the standard valuation of the root datum of `SL₂(K)` is discrete, with
`Γ_a = ℤ` for both roots. -/
example (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ))
    (hω : ∀ x : K, x ≠ 0 → ∃ n : ℤ, ω x = ((n : ℝ) : WithTop ℝ)) (hω₁ : ∃ x : K, ω x = 1) :
    ∃ (Φ : RootPairing (Fin 2) ℝ ℝ ℝ) (D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ)
      (φ : Valuation D), (∀ c : K,
        (∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
          φ.φ 0 ⟨_, h⟩ = ω c) ∧
        (∃ h : (⟨!![1, 0; c, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 1,
          φ.φ 1 ⟨_, h⟩ = ω c)) ∧
      φ.IsDiscrete ∧ ∀ i, φ.valueSet i = Set.range ((↑) : ℤ → ℝ) := sorry

-- Test BruhatTits.Valuation.not_isDiscrete_dense (non-example)
/- If every rational number is a value of `ω` (for instance `ω(K^×) = ℚ`), no valuation of a root
datum of `SL₂(K)` with `φ_+(x_+(c)) = ω(c)` is discrete: `Γ_a ∩ [0, 1]` contains every
`1/(n + 1)`. -/
example (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ))
    (hω : ∀ q : ℚ, ∃ x : K, ω x = ((q : ℝ) : WithTop ℝ))
    {Φ : RootPairing (Fin 2) ℝ ℝ ℝ} {D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ}
    (φ : Valuation D)
    (h₀ : ∀ c : K, ∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
      φ.φ 0 ⟨_, h⟩ = ω c) :
    ¬ φ.IsDiscrete := by
  intro hd
  refine Set.infinite_of_injective_forall_mem (f := fun n : ℕ => ((n : ℝ) + 1)⁻¹)
    (fun m n h => by simpa using h) (fun n => ?_) (hd 0 0 1)
  obtain ⟨x, hx⟩ := hω ((n : ℚ) + 1)⁻¹
  obtain ⟨h, hφ⟩ := h₀ x
  have hx0 : x ≠ 0 := by
    rintro rfl
    simp at hx
  refine ⟨⟨⟨_, h⟩, fun h1 => hx0 ?_, by rw [hφ, hx]; push_cast; rfl⟩, by positivity, ?_⟩
  · simpa using congrArg (fun g : D.U 0 =>
      ((g : Matrix.SpecialLinearGroup (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) 0 1) h1
  · exact inv_le_one_of_one_le₀ (by simp)

/-- Two valuations are equipollent if they differ by a vector `v` of the coroot space:
`ψ_a = φ_a + a(v)` (Bruhat–Tits I, 6.2.5, p. 120). -/
def Equipollent {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ ψ : Valuation D) : Prop :=
  ∃ v : N, ∀ i u, ψ.φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ)

-- Test BruhatTits.Equipollent.refl
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Equipollent φ φ :=
  ⟨0, fun i u => by simp⟩

/-- The enlarged apartment relative to a base valuation `φ`: valuations equipollent to `φ`, with
their displacement in the full coroot space (root valuations alone forget the directions killed by
every root). -/
structure Apartment {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Type (max u v) where
  val : Valuation D
  displacement : N
  val_eq : ∀ i u, val.φ i u = φ.φ i u +
    ((Φ.toLinearMap (Φ.root i) displacement : ℝ) : WithTop ℝ)

/-- The apartment is an affine space under `N`: the displacement is a bijection onto `N`
(Bruhat–Tits I, 6.2.5, p. 120). -/
theorem Apartment.displacement_bijective {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} (φ : Valuation D) :
    Function.Bijective (Apartment.displacement : Apartment φ → N) := sorry

-- Test BruhatTits.Equipollent.shift
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) (v : N) :
    ∃ ψ : Valuation D, Equipollent φ ψ ∧
      ∀ i u, ψ.φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ) := by sorry

-- Test BruhatTits.Apartment.central_displacement
/- With no roots, distinct central displacements still give distinct points. -/
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)
    [IsEmpty ι] (v w : N) (h : v ≠ w) :
    (⟨φ, v, fun i => isEmptyElim i⟩ : Apartment φ) ≠
      (⟨φ, w, fun i => isEmptyElim i⟩ : Apartment φ) := by
  intro he
  exact h (congrArg Apartment.displacement he)

-- Test BruhatTits.Apartment.rankZero_singleton
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) [Subsingleton N] : Subsingleton (Apartment φ) := by sorry

/-- An affine root `a + k` with `a ∈ Φ` and `k ∈ Γ'_a` (Bruhat–Tits I, 6.2.6, p. 120). -/
structure AffineRoot {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) where
  /-- The gradient `a`. -/
  gradient : ι
  /-- The constant `k`. -/
  constant : ℝ
  mem_valueSet : constant ∈ φ.primedValueSet gradient

namespace AffineRoot

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} {φ : Valuation D}

/-- The value `α(x) = a(x − φ) + k` of `α = a + k` at a point `x` of the apartment. -/
def eval (α : AffineRoot φ) (x : Apartment φ) : ℝ :=
  Φ.toLinearMap (Φ.root α.gradient) x.displacement + α.constant

/-- The wall `∂α = {x : α(x) = 0}`. -/
def wall (α : AffineRoot φ) : Set (Apartment φ) := {x | α.eval x = 0}

/-- For a discrete valuation and a finite root system only finitely many walls meet a segment
`[x, x + v]`, the segment being described by displacements. -/
theorem finite_walls_segment [Finite ι] (hφ : φ.IsDiscrete) (x : Apartment φ) (v : N) :
    {α : AffineRoot φ | ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧
      Φ.toLinearMap (Φ.root α.gradient) (x.displacement + t • v) + α.constant = 0}.Finite :=
  sorry

-- Test BruhatTits.AffineRoot.eval_base
example (α : AffineRoot φ) : α.eval ⟨φ, 0, fun i u => by simp⟩ = α.constant := by
  simp [eval]

-- Test BruhatTits.AffineRoot.wall_base
example (α : AffineRoot φ) : (⟨φ, 0, fun i u => by simp⟩ : Apartment φ) ∈ α.wall ↔
    α.constant = 0 := by simp [wall, eval]

-- Test BruhatTits.AffineRoot.wall_ne_univ
example (α : AffineRoot φ) : α.wall ≠ Set.univ := by sorry

-- Test BruhatTits.AffineRoot.eval_coroot_two_terms
example (α : AffineRoot φ) (x y : Apartment φ)
    (hx : x.displacement = Φ.coroot α.gradient)
    (hy : y.displacement = (2 : ℝ) • Φ.coroot α.gradient) :
    α.eval x = α.constant + 2 ∧ α.eval y = α.constant + 4 := by sorry

end AffineRoot

/-- A point is special when every root direction is the direction of a wall through it
(Bruhat–Tits I, 1.3.7, p. 22); for nonreduced `Φ` the wall may have gradient `a`, `2a` or `a/2`. -/
def Apartment.IsSpecial {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    {φ : Valuation D} (x : Apartment φ) : Prop :=
  ∀ i : ι, ∃ α : AffineRoot φ, (∃ c : ℝ, 0 < c ∧ Φ.root α.gradient = c • Φ.root i) ∧ x ∈ α.wall

-- Test BruhatTits.Apartment.isSpecial_base
/- For `SL₂` with `φ_±(x_±(c)) = ω(c)` the base point is special: `ω(1) = 0` puts `0` in `Γ'_a`
for both roots (neither root of a root pairing on `Fin 2` is twice a root), so the wall of the
affine root `a + 0` passes through the base point. -/
example (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ))
    {Φ : RootPairing (Fin 2) ℝ ℝ ℝ} {D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ}
    (φ : Valuation D)
    (h₀ : ∀ c : K, ∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
      φ.φ 0 ⟨_, h⟩ = ω c)
    (h₁ : ∀ c : K, ∃ h : (⟨!![1, 0; c, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 1,
      φ.φ 1 ⟨_, h⟩ = ω c) :
    (⟨φ, 0, fun i u => by simp⟩ : Apartment φ).IsSpecial := by
  have key : ∀ a b c : Fin 2, a = b ∨ a = c ∨ b = c := by decide
  have hnm : ∀ i j : Fin 2, Φ.root j ≠ (2 : ℝ) • Φ.root i := by
    intro i j hij
    have hi := Φ.ne_zero i
    have hk : Φ.root (Φ.reflectionPerm i i) = -Φ.root i := by
      rw [Φ.root_reflectionPerm, Φ.reflection_apply_self]
    rw [smul_eq_mul] at hij
    rcases key i j (Φ.reflectionPerm i i) with h | h | h
    · subst h
      exact hi (by linarith)
    · rw [← h] at hk
      exact hi (by linarith)
    · rw [← h] at hk
      exact hi (by linarith)
  have hmem : ∀ i, (0 : ℝ) ∈ φ.primedValueSet i := by
    refine Fin.forall_fin_two.2 ⟨?_, ?_⟩
    · obtain ⟨h, hφ⟩ := h₀ 1
      refine ⟨⟨_, h⟩, fun h1 => ?_, by simp [hφ], fun j hj => absurd hj (hnm 0 j)⟩
      simpa using congrArg (fun g : D.U 0 =>
        ((g : Matrix.SpecialLinearGroup (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) 0 1) h1
    · obtain ⟨h, hφ⟩ := h₁ 1
      refine ⟨⟨_, h⟩, fun h1 => ?_, by simp [hφ], fun j hj => absurd hj (hnm 1 j)⟩
      simpa using congrArg (fun g : D.U 1 =>
        ((g : Matrix.SpecialLinearGroup (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) 1 0) h1
  exact fun i => ⟨⟨i, 0, hmem i⟩, ⟨1, one_pos, (one_smul ℝ _).symm⟩,
    by simp [AffineRoot.wall, AffineRoot.eval]⟩

/-- The `R`-points of the closed subgroup cut out by a Hopf ideal: the pinned
`TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, indexed by the coefficient type `R`. -/
abbrev subgroupPoints {K : Type u} [Field K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (I : TauCeti.HopfIdeal K H)
    (R : Type u) [CommRing R] [Algebra K R] : Subgroup (WithConv (H →ₐ[K] R)) :=
  TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of K R)

-- Test BruhatTits.subgroupPoints_mem_iff
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (I : TauCeti.HopfIdeal K H) (R : Type u) [CommRing R] [Algebra K R]
    (g : WithConv (H →ₐ[K] R)) : g ∈ subgroupPoints I R ↔ ∀ a ∈ I, g.ofConv a = 0 :=
  TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff H.obj I (CommAlgCat.of K R) g

/-- A connected reductive `K`-group `Spec H` with a chosen maximal split torus, given by its Hopf
ideal. -/
structure LocalRootData (K : Type u) [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  reductive : TauCeti.reductiveCommHopfAlgProperty K H
  splitTorus : TauCeti.HopfIdeal K H
  maximalSplit : Minimal (fun I : TauCeti.HopfIdeal K H =>
    TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I))
      splitTorus

/-- Every connected reductive group over a field has a maximal split torus (Borel–Tits). -/
theorem exists_localRootData {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H) : Nonempty (LocalRootData K H) := sorry

end BruhatTits

namespace ZExtension

/-- The scheme-theoretic derived subgroup is semisimple and simply connected. -/
def DerivedSimplyConnected {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) : Prop :=
  ∃ h : TauCeti.semisimpleCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H)),
    TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty K
      ⟨TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H), h⟩

/-- `f` is the coordinate map of a z-extension `G̃ → G` (Nguyễn Quốc Thắng, §2.0, p. 4): both groups
reductive, `f` injective, `G̃_der` simply connected, and the kernel, cut out by the Hopf ideal `I`,
a central induced torus (its geometric characters have a finite Galois-permuted basis). -/
def IsZExtension {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐc[K] (Gt : Type u)) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty K G ∧
  TauCeti.reductiveCommHopfAlgProperty K Gt ∧
  Function.Injective f ∧ DerivedSimplyConnected Gt ∧
  ∃ I : TauCeti.HopfIdeal K Gt,
    TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient Gt I) ∧
    (∃ (B : Type u) (_ : Fintype B)
      (b : Module.Basis B ℤ (TauCeti.CommHopfAlgCat.additiveCharacterGroup
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient Gt I).obj)),
      ∀ (γ : Field.absoluteGaloisGroup K) (x : B), ∃ y : B, γ • b x = b y) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (Gt →ₐ[K] R)),
      g ∈ BruhatTits.subgroupPoints I R ↔
        WithConv.toConv (g.ofConv.comp (f : G →ₐ[K] Gt)) = (1 : WithConv (G →ₐ[K] R))) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R]
      (z : BruhatTits.subgroupPoints I R) (g : WithConv (Gt →ₐ[K] R)), Commute z.val g)

/-- Every connected reductive group over a field has a z-extension (Nguyễn Quốc Thắng, Lemma 2.1(a),
p. 4). -/
theorem exists_zExtension {K : Type u} [Field K] (G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (_hG : TauCeti.reductiveCommHopfAlgProperty K G) :
    ∃ (Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (f : (G : Type u) →ₐc[K] (Gt : Type u)),
      IsZExtension f := sorry

/-- `G̃(K') → G(K')` is onto for every field `K'/K` (Shapiro's lemma and Hilbert's Theorem 90). -/
theorem surjective_points {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐc[K] (Gt : Type u)) (hf : IsZExtension f)
    (K' : Type u) [Field K'] [Algebra K K'] :
    Function.Surjective fun x : (Gt : Type u) →ₐ[K] K' => x.comp (f : G →ₐ[K] Gt) := sorry

end ZExtension

/-! ## Layer RG2.2: buildings -/

namespace GLBuilding

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

open scoped Classical Pointwise

/-- The additive normalized valuation `ω : K → ℝ ∪ {∞}`, `ω(ϖ) = 1`, from
`TauCeti.normalizedValuation`, with `ω(0) = ∞`. -/
def ω (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (t : K) : WithTop ℝ :=
  if h : t = 0 then ⊤ else ((Multiplicative.toAdd (TauCeti.normalizedValuation K (Units.mk0 t h)) : ℤ) : ℝ)

-- Test GLBuilding.omega_two_terms
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) :
    ω K 0 = ⊤ ∧ ω K ϖ = 1 ∧ ω K ((ϖ : K) ^ 2) = 2 := by
  have h0 : (ϖ : K) ≠ 0 := fun h => hϖ.ne_zero (Subtype.ext h)
  have h1 := TauCeti.normalizedValuation_irreducible hϖ
  have h2 : ((ϖ : K) ^ 2) ≠ 0 := pow_ne_zero 2 h0
  refine ⟨by simp [ω], ?_, ?_⟩
  · simp only [ω, h0, h1, toAdd_ofAdd, dite_false]; norm_num
  · simp only [ω, h2, dite_false]
    have : Units.mk0 ((ϖ : K) ^ 2) h2 = (Units.mk0 (ϖ : K) h0) ^ 2 := by ext; simp
    rw [this, map_pow, h1]; norm_num

/-- A splittable additive norm `α : Kⁿ → ℝ ∪ {∞}` (Bruhat–Tits, Bull. SMF 112 (1984), 1.4–1.5,
pp. 263–264). -/
structure SplittableNorm (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) where
  /-- The norm. -/
  toFun : (Fin n → K) → WithTop ℝ
  map_smul : ∀ (t : K) (x : Fin n → K), toFun (t • x) = toFun x + ω K t
  min_le_map_add : ∀ x y, min (toFun x) (toFun y) ≤ toFun (x + y)
  map_eq_top_iff : ∀ x, toFun x = ⊤ ↔ x = 0
  splittable : ∃ e : Module.Basis (Fin n) K (Fin n → K), ∀ x,
    toFun x = ⨅ i, (toFun (e i) + ω K (e.repr x i))

/-- A graded periodic lattice chain in `Kⁿ` (Bruhat–Tits, Bull. SMF 112 (1984), 1.7, pp. 266–267). -/
structure GradedLatticeChain (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) where
  /-- The lattices of the chain. -/
  chain : Set (Submodule 𝒪[K] (Fin n → K))
  nonempty : chain.Nonempty
  isLattice : ∀ Λ ∈ chain, Λ.IsLattice K
  isChain : IsChain (· ≤ ·) chain
  smul_mem : ∀ (t : Kˣ), ∀ Λ ∈ chain, Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K))) ∈ chain
  /-- The grading. -/
  grading : Submodule 𝒪[K] (Fin n → K) → ℝ
  /-- Off-chain values carry no extra data. -/
  grading_off_chain : ∀ Λ, Λ ∉ chain → grading Λ = 0
  grading_strictAnti : ∀ Λ ∈ chain, ∀ Λ' ∈ chain, Λ < Λ' → grading Λ' < grading Λ
  grading_smul : ∀ (t : Kˣ), ∀ Λ ∈ chain,
    (grading (Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K)))) : WithTop ℝ) =
      grading Λ + ω K t

-- Test GLBuilding.norm_chain_zero_rank
example : IsEmpty (GradedLatticeChain K 0) := by sorry

-- Test GLBuilding.divisionBuilding_zero_rank
/- For the split division algebra `D = K`, rank zero has a unique splittable norm and no
graded periodic chain. -/
example : Nonempty (SplittableNorm K 0) ∧ Subsingleton (SplittableNorm K 0) ∧
    IsEmpty (GradedLatticeChain K 0) := by sorry

/-- Splittable norms correspond to graded periodic lattice chains: `α` goes to its closed balls
`{α ≥ r}`, each graded by the least value of `α` on it (Bruhat–Tits, Bull. SMF 112 (1984), 1.8,
p. 267). -/
theorem exists_normEquivChain {n : ℕ} [NeZero n] :
    ∃ e : SplittableNorm K n ≃ GradedLatticeChain K n, ∀ α Λ,
      (Λ ∈ (e α).chain ↔
        ∃ r : ℝ, (Λ : Set (Fin n → K)) = {x | (r : WithTop ℝ) ≤ α.toFun x}) ∧
      (Λ ∈ (e α).chain →
        ((e α).grading Λ : WithTop ℝ) = sInf (α.toFun '' (Λ : Set (Fin n → K)))) := sorry

-- Test GLBuilding.dualNorm_zero_dimension
example : Subsingleton (SplittableNorm K 0) ∧
    ∀ (α : SplittableNorm K 0) (x : Fin 0 → K), α.toFun x = ⊤ := by sorry

-- Test GLBuilding.normalizedOrder_units
example (x : 𝒪[K]ˣ) : ω K (x : K) = 0 := by sorry

end GLBuilding

namespace BruhatTits

section NumericalEquipollence

variable (p : ℕ) [Fact p.Prime]
  {Φ : RootPairing (Fin 2) ℝ ℝ ℝ}
  {D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) Φ}
  (φ : Valuation D)
  (hΦ₀ : Φ.root 0 = 2) (hΦ₁ : Φ.root 1 = -2)
  (hpair : ∀ x y : ℝ, Φ.toLinearMap x y = x * y)
  (h₀ : ∀ c : ℚ_[p],
    ∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 0,
      φ.φ 0 ⟨_, h⟩ = GLBuilding.ω ℚ_[p] c)
  (h₁ : ∀ c : ℚ_[p],
    ∃ h : (⟨!![1, 0; c, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 1,
      φ.φ 1 ⟨_, h⟩ = GLBuilding.ω ℚ_[p] c)

include hΦ₀ hΦ₁ hpair h₀ h₁

-- Test BruhatTits.Equipollent.sl2_shift_one
example : ∃ ψ : Valuation D, Equipollent φ ψ ∧
    (∀ u, ψ.φ 0 u = φ.φ 0 u + 1) ∧ (∀ u, ψ.φ 1 u = φ.φ 1 u + (-1)) ∧
    (∃ (h : (⟨!![1, 1; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 0)
       (hp : (⟨!![1, (p : ℚ_[p]); 0, 1], by simp⟩ :
         Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 0),
      ψ.φ 0 ⟨_, h⟩ = 1 ∧ ψ.φ 0 ⟨_, hp⟩ = 2) ∧
    (∃ (h : (⟨!![1, 0; 1, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 1)
       (hp : (⟨!![1, 0; (p : ℚ_[p]), 1], by simp⟩ :
         Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 1),
      ψ.φ 1 ⟨_, h⟩ = -1 ∧ ψ.φ 1 ⟨_, hp⟩ = 0) := by sorry

-- Test BruhatTits.Equipollent.sl2_rescale_two
example : ∃ ψ : Valuation D, (∀ i u, ψ.φ i u = 2 * φ.φ i u) ∧ ¬ Equipollent φ ψ ∧
    ∃ (h : (⟨!![1, 1; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 0)
       (hp : (⟨!![1, (p : ℚ_[p]); 0, 1], by simp⟩ :
         Matrix.SpecialLinearGroup (Fin 2) ℚ_[p]) ∈ D.U 0),
      φ.φ 0 ⟨_, h⟩ = 0 ∧ φ.φ 0 ⟨_, hp⟩ = 1 ∧
      ψ.φ 0 ⟨_, h⟩ = 0 ∧ ψ.φ 0 ⟨_, hp⟩ = 2 := by sorry

-- Test BruhatTits.Equipollent.sl2_coroot_shift
example : ∃ x : Apartment φ, x.displacement = 1 ∧
    (∀ u, x.val.φ 0 u = φ.φ 0 u + 2) ∧
    (∀ u, x.val.φ 1 u = φ.φ 1 u + (-2)) := by sorry

end NumericalEquipollence

end BruhatTits

namespace BTTree

open ValuativeRel
open scoped Pointwise

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- Scaling of lattices in `K²` by `K^×`. -/
instance instMulActionUnitsLattice :
    MulAction Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K} where
  smul t Λ := ⟨t • Λ.1, by have := Λ.2; exact Submodule.IsLattice.smul K Λ.1 t⟩
  one_smul Λ := Subtype.ext (one_smul Kˣ Λ.1)
  mul_smul s t Λ := Subtype.ext (mul_smul s t Λ.1)

/-- The vertices: homothety classes of `𝒪[K]`-lattices in `K²`. -/
def Vertex : Type u :=
  Quotient (α := {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})
    (MulAction.orbitRel Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})

/-- Adjacency: representatives with `ϖ Λ ⊊ Λ' ⊊ Λ`. -/
def Adj (v w : Vertex K) : Prop :=
  ∃ (Λ Λ' : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K}) (ϖ : 𝒪[K]),
    Irreducible ϖ ∧ Quotient.mk _ Λ = v ∧ Quotient.mk _ Λ' = w ∧
      Submodule.span 𝒪[K] ((fun x : Fin 2 → K => (ϖ : K) • x) ''
        (Λ.1 : Set (Fin 2 → K))) < Λ'.1 ∧ Λ'.1 < Λ.1

/-- The Bruhat–Tits tree of `SL₂(K)` (Garrett, *Buildings and Classical Groups*, §§19.1–19.3,
pp. 322–330, for `n = 2`). -/
def tree : SimpleGraph (Vertex K) where
  Adj := Adj K
  symm := sorry
  loopless := sorry

/-- The graph is a tree. -/
theorem isTree : (tree K).IsTree := sorry

/-- Every vertex has `q + 1` neighbours, the lines of `Λ / ϖΛ` over `𝓀[K]`. -/
theorem natCard_neighborSet (x : Vertex K) :
    Nat.card ((tree K).neighborSet x) = Nat.card 𝓀[K] + 1 := sorry

-- Test BTTree.degree_Q2
example (x : BTTree.Vertex ℚ_[2]) : Nat.card ((BTTree.tree ℚ_[2]).neighborSet x) = 3 := by sorry

-- Test BTTree.degree_residue_card
example (x : Vertex K) : Nat.card ((tree K).neighborSet x) = Nat.card 𝓀[K] + 1 := by sorry

-- Test BTTree.no_leaves
example (x : BTTree.Vertex K) : (BTTree.tree K).neighborSet x ≠ ∅ := by sorry

end BTTree

namespace TameDescent

/-- Fixed points of a finite group `Θ` of automorphisms of a reductive group, `|Θ|` invertible in the
field: `R ↦ G(R)^Θ` is represented by a smooth closed subgroup (Edixhoven, Prop. 3.1 and 3.4,
pp. 293–294). The fixed-point group need not be connected. -/
theorem smooth_fixedPoints {k : Type u} [Field k] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (hH : TauCeti.reductiveCommHopfAlgProperty k H) (Θ : Type u) [Group Θ] [Finite Θ]
    (ρ : Θ →* _root_.CategoryTheory.Aut H) (hΘ : (Nat.card Θ : k) ≠ 0) :
    ∃ (H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k) (f : H ⟶ H'),
      TauCeti.smoothCommHopfAlgProperty k H'.obj ∧ Function.Surjective f.hom.hom ∧
      ∀ (R : Type u) [CommRing R] [Algebra k R],
        Set.range (TauCeti.AlgHom.mapDomain (A := R) (f.hom.hom : (H : Type u) →ₐc[k] H')) =
          {g | ∀ θ : Θ,
            TauCeti.AlgHom.mapDomain (A := R) ((ρ θ).hom.hom.hom : (H : Type u) →ₐc[k] H) g = g} :=
  sorry

-- Test TameDescent.fixedPoints_not_connected (non-example)
/- The `k`-points of the fixed points of inversion on `G_m` are `{±1}`: the fixed-point group of a
tame action need not be connected. -/
example {k : Type u} [Field k] (h2 : (2 : k) ≠ 0) :
    ¬ Subsingleton {x : kˣ // x⁻¹ = x} := by
  intro hs
  have h := congrArg (fun x : {x : kˣ // x⁻¹ = x} => ((x.val : kˣ) : k))
    (hs.elim ⟨1, inv_one⟩ ⟨-1, by simp⟩)
  simp only [Units.val_one, Units.val_neg] at h
  exact h2 (by linear_combination h)

-- Test TameDescent.fixedPoints_trivial_action
example {k : Type u} [Field k] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (Θ : Type u) [Group Θ] (ρ : Θ →* _root_.CategoryTheory.Aut H) (hρ : ρ = 1)
    (R : Type u) [CommRing R] [Algebra k R] :
    {g : WithConv (H →ₐ[k] R) | ∀ θ : Θ,
      TauCeti.AlgHom.mapDomain (A := R) ((ρ θ).hom.hom.hom : (H : Type u) →ₐc[k] H) g = g} =
      Set.univ := by sorry

-- Test TameDescent.fixedPoints_swap
example {k : Type u} [Field k] (h2 : (2 : k) ≠ 0) :
    Function.Bijective (fun z : kˣ =>
      (⟨(z, z), rfl⟩ : {g : kˣ × kˣ // Prod.swap g = g})) := by sorry

end TameDescent

/-! ## Layer RG2.3: integral models, level subgroups and Lang's theorem -/

namespace IntegralModel

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K]

/-- A smooth affine `𝒪[K]`-model of `G = Spec H`: a smooth finite-type commutative Hopf
`𝒪[K]`-algebra with a Hopf isomorphism of its generic fibre with `H` (Bruhat–Tits II,
1.2.2–1.2.5 and 1.2.12, pp. 17–20). -/
structure SmoothModel (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  /-- The coordinate Hopf algebra of the model. -/
  A : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝒪[K]
  smooth : Algebra.Smooth 𝒪[K] A
  /-- The identification of the generic fibre with `H`. -/
  genericFibre : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) A ≅ H

namespace SmoothModel

variable {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The special fibre `𝓀 ⊗ A`. -/
def specialFibre (𝒢 : SmoothModel H) : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝓀[K] :=
  TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := 𝓀[K]) 𝒢.A

/-- The integral points `𝒢(𝒪) ⊆ G(K)`: the points integral on every coordinate of `A`. -/
def integralPoints (𝒢 : SmoothModel H) : Subgroup (WithConv (H →ₐ[K] K)) where
  carrier := {g | ∀ a : 𝒢.A, ∃ o : 𝒪[K],
    g.ofConv (𝒢.genericFibre.hom.hom ((1 : K) ⊗ₜ[𝒪[K]] a)) = o}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- A reductive model has connected reductive generic and special fibres. -/
def IsReductive (𝒢 : SmoothModel H) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre ∧
    TauCeti.reductiveCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) 𝒢.A)

/-- The standard model of `GL_n` is reductive. -/
theorem generalLinear_isReductive (n : ℕ)
    (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (h : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n) : 𝒢.IsReductive :=
  sorry

end SmoothModel

/-- A subgroup of `G(K)` is hyperspecial if it is the group of integral points of a reductive
model. -/
def IsHyperspecialSubgroup {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (P : Subgroup (WithConv (H →ₐ[K] K))) : Prop :=
  ∃ 𝒢 : SmoothModel H, 𝒢.IsReductive ∧ 𝒢.integralPoints = P

/-- The extension principle: over a strictly henselian discrete valuation ring a `K`-homomorphism
extends to the smooth models iff it carries integral points into integral points (Bruhat–Tits II,
1.7.3 c) and Prop. 1.7.6, pp. 38–39). -/
theorem extend_iff [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] [HenselianLocalRing 𝒪[K]] [IsSepClosed 𝓀[K]]
    {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (𝒢 : SmoothModel H) (𝒢' : SmoothModel H') (f : H' ⟶ H) :
    (∃ F : 𝒢'.A ⟶ 𝒢.A,
      TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) F ≫ 𝒢.genericFibre.hom =
        𝒢'.genericFibre.hom ≫ f) ↔
      ∀ g ∈ 𝒢.integralPoints,
        TauCeti.AlgHom.mapDomain (f.hom.hom : (H' : Type u) →ₐc[K] H) g ∈ 𝒢'.integralPoints :=
  sorry

/-- Prasad–Yu, Cor. 1.3 (arXiv math/0405381, p. 2), for `char 𝓀 ≠ 2`: a homomorphism from a
reductive model to an affine finite-type `𝒪`-group which is a closed immersion on generic fibres
is a closed immersion. -/
theorem surjective_of_reductive_of_generic [ValuativeRel.IsDiscrete K]
    [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K] (h2 : (2 : 𝓀[K]) ≠ 0)
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H) (h𝒢 : 𝒢.IsReductive)
    (ℋ : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝒪[K]) (φ : ℋ ⟶ 𝒢.A)
    (hgen : Function.Surjective
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) φ).hom.hom) :
    Function.Surjective φ.hom.hom := sorry

/-- Every smooth affine model over the discrete valuation ring `𝒪[K]` admits a closed immersion
into some `GL_n` over `𝒪[K]`. -/
theorem exists_closedImmersion_generalLinear [ValuativeRel.IsDiscrete K]
    [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H) :
    ∃ (n : ℕ) (ρ : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n ⟶ 𝒢.A),
      Function.Surjective ρ.hom.hom := sorry

end IntegralModel

namespace SchematicClosure

variable (O : Type u) [CommRing O] (K : Type u) [Field K] [Algebra O K]
  (A : Type u) [CommRing A] [Algebra O A]

/-- `I^♮`, the preimage of `I ⊆ K ⊗_O A` in `A`: the ideal of the schematic closure of the closed
subscheme `V(I)` of the generic fibre (Bruhat–Tits II, 1.2.5–1.2.7, pp. 17–18). -/
def closureIdeal (I : Ideal (K ⊗[O] A)) : Ideal A :=
  I.comap (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A)

/-- The coordinate ring `A / I^♮` of the schematic closure. -/
def closure (I : Ideal (K ⊗[O] A)) : Type u := A ⧸ closureIdeal O K A I

instance (I : Ideal (K ⊗[O] A)) : CommRing (closure O K A I) :=
  inferInstanceAs (CommRing (A ⧸ closureIdeal O K A I))

instance (I : Ideal (K ⊗[O] A)) : Algebra O (closure O K A I) :=
  inferInstanceAs (Algebra O (A ⧸ closureIdeal O K A I))

section DVR

variable [IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O K]

/-- The schematic closure in a flat model is flat. -/
theorem closure_flat [Module.Flat O A] (I : Ideal (K ⊗[O] A)) : Module.Flat O (closure O K A I) :=
  sorry

/-- It is the unique flat closed subscheme with generic fibre `V(I)`. -/
theorem closure_unique [Module.Flat O A] (I : Ideal (K ⊗[O] A)) (J : Ideal A)
    (hJ : Module.Flat O (A ⧸ J))
    (hI : J.map (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A) = I) :
    J = closureIdeal O K A I := sorry

/-- Over a discrete valuation ring the closure of a closed subgroup is a closed subgroup scheme
(Bruhat–Tits II, 1.2.7, p. 18). -/
theorem closureIdeal_isHopfIdeal (B : Type u) [CommRing B] [HopfAlgebra O B]
    (I : TauCeti.HopfIdeal K (K ⊗[O] B)) :
    ∃ J : TauCeti.HopfIdeal O B, J.toIdeal = closureIdeal O K B I.toIdeal := sorry

-- Test SchematicClosure.closureIdeal_bot
/- In a flat algebra over a DVR the closure of the whole generic fibre is everything. -/
example [Module.Flat O A] : closureIdeal O K A ⊥ = ⊥ := sorry

-- Test SchematicClosure.closureIdeal_bot_eq_torsion
example (a : A) : a ∈ closureIdeal O K A (⊥ : Ideal (K ⊗[O] A)) ↔
    ∃ r : O, r ≠ 0 ∧ r • a = 0 := by sorry

end DVR

end SchematicClosure

namespace LevelSubgroups

open ValuativeRel

variable (K : Type u) [Field K] [ValuativeRel K] (n : ℕ)

/-- `GL_n(𝒪)`: integral matrices with integral inverse. -/
def integralGL : Subgroup (GL (Fin n) K) where
  carrier := {g | (∀ i j, (g : Matrix (Fin n) (Fin n) K) i j ∈ 𝒪[K]) ∧
    ∀ i j, ((g⁻¹ : GL (Fin n) K) : Matrix (Fin n) (Fin n) K) i j ∈ 𝒪[K]}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The standard Iwahori subgroup: integral, upper triangular modulo `𝓂[K]`. -/
def iwahori : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ integralGL K n ∧
    ∀ i j, j < i → valuation K ((g : Matrix (Fin n) (Fin n) K) i j) < 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The Iwahori pro-unipotent radical: unipotent upper triangular modulo `𝓂[K]`.
Over a nonarchimedean local field with residue characteristic `p` it is pro-`p`. -/
def proPIwahori : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ iwahori K n ∧
    ∀ i, valuation K ((g : Matrix (Fin n) (Fin n) K) i i - 1) < 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The principal congruence subgroup `1 + 𝓂[K]^m M_n(𝒪)`. -/
def principalCongruence (m : ℕ) : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ integralGL K n ∧ ∀ i j, ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ m ∧
    (a : K) = (g : Matrix (Fin n) (Fin n) K) i j - (1 : Matrix (Fin n) (Fin n) K) i j}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

-- Test LevelSubgroups.integralGL_eq_range
/- Agreement with the image of Mathlib's `GL_n(𝒪) → GL_n(K)`. -/
example : integralGL K n = (Matrix.GeneralLinearGroup.map (algebraMap 𝒪[K] K)).range := sorry

-- Test LevelSubgroups.not_mem_integralGL
/- `diag(ϖ, 1)` has integral entries but its inverse has the entry `ϖ⁻¹`. -/
example (ϖ : K) (hϖ0 : ϖ ≠ 0) (hϖ : valuation K ϖ < 1) (g : GL (Fin 2) K)
    (hg : (g : Matrix (Fin 2) (Fin 2) K) = Matrix.diagonal ![ϖ, 1]) :
    g ∉ integralGL K 2 := sorry

-- Test LevelSubgroups.iwahori_relIndex_two
/- `[GL₂(𝒪) : I] = q + 1`, the number of points of `ℙ¹(𝓀)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    (iwahori K 2).relIndex (integralGL K 2) = Nat.card 𝓀[K] + 1 := sorry

-- Test LevelSubgroups.proPIwahori_eq_iwahori_of_card_two
/- Residue field `𝔽₂`: every unit is `≡ 1`, so the two subgroups coincide. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (h2 : Nat.card 𝓀[K] = 2) :
    proPIwahori K n = iwahori K n := sorry

-- Test LevelSubgroups.principalCongruence_zero
example : principalCongruence K n 0 = integralGL K n := by sorry

-- Test LevelSubgroups.iwahori_one
example : iwahori K 1 = integralGL K 1 := by sorry

-- Test LevelSubgroups.not_mem_iwahori
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (g : GL (Fin 2) K)
    (hg : (g : Matrix (Fin 2) (Fin 2) K) = !![1, 0; 1, 1]) :
    g ∈ integralGL K 2 ∧ g ∉ iwahori K 2 := by sorry

-- Test LevelSubgroups.proPIwahori_normal
example : ((proPIwahori K n).subgroupOf (iwahori K n)).Normal := by sorry

-- Test LevelSubgroups.principalCongruence_diag
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (g : GL (Fin 2) K)
    (hg : (g : Matrix (Fin 2) (Fin 2) K) = Matrix.diagonal ![1 + (ϖ : K), 1]) :
    g ∈ principalCongruence K 2 1 ∧ g ∉ principalCongruence K 2 2 := by sorry

-- Test LevelSubgroups.parahoricQuotient_card_iwahori_gl2
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    Nat.card ((iwahori K 2) ⧸ (proPIwahori K 2).subgroupOf (iwahori K 2)) =
      (Nat.card 𝓀[K] - 1) ^ 2 := by sorry

end LevelSubgroups

namespace Lang

/-- Lang's theorem: for a smooth geometrically connected finite-type group over a finite field `F`
and `σ` the `|F|`-power Frobenius, `g ↦ g⁻¹ σ(g)` is surjective on `H(F̄)` (Milne, *Algebraic
groups*, Prop. 27.54 and Cor. 27.55, v2.00 pp. 487–488). -/
theorem lang_surjective {F : Type u} [Field F] [Fintype F]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (_hsm : TauCeti.smoothCommHopfAlgProperty F H.obj)
    (_hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F H.obj)
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (_hσ : ∀ z, σ z = z ^ Fintype.card F) :
    Function.Surjective fun g : WithConv (H →ₐ[F] AlgebraicClosure F) =>
      g⁻¹ * WithConv.toConv (σ.comp g.ofConv) := sorry

-- Test Lang.lang_not_connected
/- Connectedness cannot be dropped: on `μ₂` over a finite field of odd order `q` the Lang map is
`z ↦ z⁻¹ z^q = 1`. -/
example {F : Type u} [Field F] [Fintype F] (hq : Odd (Fintype.card F))
    (z : (AlgebraicClosure F)ˣ) (hz : z ^ 2 = 1) :
    z⁻¹ * z ^ Fintype.card F = 1 := by
  obtain ⟨k, hk⟩ := hq
  rw [hk, pow_succ, pow_mul, hz, one_pow, one_mul, inv_mul_cancel]

/-- Lang's theorem for a directed inverse system of smooth geometrically connected finite-type
groups over a finite field, on compatible families of geometric points: the Lang fibres are finite
and nonempty (Milne, *Algebraic groups*, Cor. 27.55, v2.00 p. 488), so they have a compatible
section. -/
theorem lang_proAlgebraic_surjective {F : Type u} [Field F] [Fintype F]
    {ι : Type v} [Preorder ι] [Nonempty ι]
    (hdir : ∀ i j : ι, ∃ k, i ≤ k ∧ j ≤ k)
    (H : ι → TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (hsm : ∀ i, TauCeti.smoothCommHopfAlgProperty F (H i).obj)
    (hconn : ∀ i, TauCeti.geometricallyConnectedCommHopfAlgProperty F (H i).obj)
    (f : ∀ i j, i ≤ j → (H i ⟶ H j))
    (fid : ∀ i, f i i le_rfl = 𝟙 (H i))
    (fcomp : ∀ i j k (hij : i ≤ j) (hjk : j ≤ k),
      f i j hij ≫ f j k hjk = f i k (hij.trans hjk))
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (hσ : ∀ z, σ z = z ^ Fintype.card F)
    (a : ∀ i, WithConv (H i →ₐ[F] AlgebraicClosure F))
    (ha : ∀ i j (hij : i ≤ j),
      WithConv.toConv ((a j).ofConv.comp
        (TauCeti.FiniteTypeCommHopfAlgCat.toBialgHom (f i j hij)).toAlgHom) = a i) :
    ∃ g : ∀ i, WithConv (H i →ₐ[F] AlgebraicClosure F),
      (∀ i j (hij : i ≤ j),
        WithConv.toConv ((g j).ofConv.comp
          (TauCeti.FiniteTypeCommHopfAlgCat.toBialgHom (f i j hij)).toAlgHom) = g i) ∧
      ∀ i, (g i)⁻¹ * WithConv.toConv (σ.comp (g i).ofConv) = a i := sorry

end Lang

/-! ## Layer RG2.4: decompositions and double cosets -/

namespace Decomposition

open ValuativeRel LevelSubgroups

variable {K : Type u} [Field K] [ValuativeRel K] [ModelField K] {n : ℕ}

/-- Over every `ModelField K`, the Cartan decomposition places each `g` in
`GL_n(𝒪) diag(ϖ^μ) GL_n(𝒪)` for a unique antitone `μ ∈ ℤⁿ`, the elementary divisors of
`g𝒪ⁿ` (Zhu, Lem. 1.8, p. 11; Garrett,
§17.5, p. 297). -/
theorem cartan_generalLinear (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (g : GL (Fin n) K) :
    ∃! μ : Fin n → ℤ, Antitone μ ∧ ∃ k₁ ∈ integralGL K n, ∃ k₂ ∈ integralGL K n,
      (g : Matrix (Fin n) (Fin n) K) = (k₁ : Matrix (Fin n) (Fin n) K) *
        Matrix.diagonal (fun i => (ϖ : K) ^ μ i) * (k₂ : Matrix (Fin n) (Fin n) K) := sorry

/-- Over every `ModelField K`, the Iwasawa equality is `GL_n(K) = B(K) GL_n(𝒪)` with `B`
upper triangular
(Bruhat–Tits I, Prop. (7.3.1)(i), p. 164, `G = U⁺·N·B_{x,D}`; for `GL_n`, `N = T(K)·S_n` with
`S_n ⊂ GL_n(𝒪)`). -/
theorem iwasawa_generalLinear (g : GL (Fin n) K) :
    ∃ b : GL (Fin n) K, (b : Matrix (Fin n) (Fin n) K).BlockTriangular id ∧
      ∃ k ∈ integralGL K n, g = b * k := sorry

/-- Over every `ModelField K`, the Iwahori–Bruhat decomposition is
`GL_n(K) = ⊔ I (P_σ diag(ϖ^μ)) I` over the extended affine Weyl group `ℤⁿ ⋊ Sₙ`, each `g`
lying in exactly one double coset (Bruhat–Tits I,
§6.5, Théorème, p. 154, for `GL_n`). -/
theorem iwahoriBruhat_generalLinear (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (g : GL (Fin n) K) :
    ∃! p : Equiv.Perm (Fin n) × (Fin n → ℤ), ∃ i₁ ∈ iwahori K n, ∃ i₂ ∈ iwahori K n,
      (g : Matrix (Fin n) (Fin n) K) = (i₁ : Matrix (Fin n) (Fin n) K) *
        (p.1.permMatrix K * Matrix.diagonal (fun i => (ϖ : K) ^ p.2 i)) *
          (i₂ : Matrix (Fin n) (Fin n) K) := sorry

-- Test Decomposition.witt_rank_one_positions
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] [PerfectRing k p] :
    StrictAnti (fun m : ℕ => Ideal.span ({(p : WittVector p k) ^ m} : Set (WittVector p k))) := by sorry

-- Test Decomposition.witt_characteristic_zero_ghost
example :
    letI : Invertible (2 : ℚ) := invertibleOfNonzero (by norm_num)
    (WittVector.ghostEquiv 2 ℚ) (2 : WittVector 2 ℚ) = (fun _ => 2) ∧
      IsUnit (2 : WittVector 2 ℚ) ∧
      ∀ m : ℕ, Ideal.span ({(2 : WittVector 2 ℚ) ^ m} : Set (WittVector 2 ℚ)) = ⊤ := by sorry

-- Test Decomposition.cartan_rank_one
/- For `n = 1` the Cartan decomposition is `K^× = ⊔ 𝒪^× ϖ^m`, with `m` the normalized valuation. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (x : Kˣ) :
    ∃ u : 𝒪[K]ˣ, (x : K) = ((u : 𝒪[K]) : K) *
      (ϖ : K) ^ (Multiplicative.toAdd (TauCeti.normalizedValuation K x)) := sorry

-- Test Decomposition.cartan_ramified_normOne_fullCompact
/- The component comparison for a compact commutative group with connected parahoric of
index two: its parahoric quotient separates the nonidentity component, while its full-compact
quotient is a singleton. For the ramified quadratic norm-one torus over an odd-residue local
field, `T₀` is the connected parahoric and `u = -1` represents its other component. -/
example {T : Type v} [CommGroup T] (T₀ : Subgroup T) (hindex : T₀.index = 2)
    (u : T) (hu : u ∉ T₀) :
    Nat.card (T ⧸ T₀) = 2 ∧ Nat.card (T ⧸ (⊤ : Subgroup T)) = 1 ∧
      (QuotientGroup.mk u : T ⧸ T₀) ≠ QuotientGroup.mk 1 ∧
      (QuotientGroup.mk u : T ⧸ (⊤ : Subgroup T)) = QuotientGroup.mk 1 := by sorry

open scoped Pointwise in
/-- A double coset `C g C'` of open subgroups with `C` compact is a finite disjoint union of
`[C : C ∩ g C' g⁻¹]` left cosets of `C'`. -/
theorem doubleCoset_finite_of_isCompact {G : Type v} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (C C' : OpenSubgroup G) (hC : IsCompact (C : Set G)) (g : G) :
    ∃ S : Finset G,
      S.card = (C'.toSubgroup.map (MulAut.conj g).toMonoidHom).relIndex C.toSubgroup ∧
      (S : Set G).PairwiseDisjoint (fun h => h • (C' : Set G)) ∧
      DoubleCoset.doubleCoset g (C : Set G) C' = ⋃ h ∈ S, h • (C' : Set G) := sorry

omit [ModelField K] in
open scoped PointTopology in
/-- `G(K)` is unimodular for a connected reductive group over a nonarchimedean local field
(Cartier, Corvallis Part 1, §4.1, p. 144). -/
theorem modularCharacter_eq_one [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (hH : TauCeti.reductiveCommHopfAlgProperty K H) :
    MeasureTheory.Measure.modularCharacter (G := WithConv (H →ₐ[K] K)) = 1 := sorry

end Decomposition

-- Test MoyPrasad.mockExp_GL2_cross_term
example {k : Type u} [CommRing k] (X Y : Matrix (Fin 2) (Fin 2) k) :
    ((1 + X) * (1 + Y) - (1 + (X + Y))) 0 0 = X 0 0 * Y 0 0 + X 0 1 * Y 1 0 := by sorry

-- Test LanglandsDual.adjoint_real_point_not_from_sl2
example (c : ℝ) : Matrix.det (c • (!![-1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ)) ≠ 1 := by sorry

-- Test LanglandsDual.transpose_antiHom
example :
    ((!![0, 1, 0; 1, 0, 0; 0, 0, 1] : Matrix (Fin 3) (Fin 3) ℤ) *
      !![1, 0, 0; 0, 0, 1; 0, 1, 0]).transpose ≠
    (!![0, 1, 0; 1, 0, 0; 0, 0, 1] : Matrix (Fin 3) (Fin 3) ℤ).transpose *
      (!![1, 0, 0; 0, 0, 1; 0, 1, 0]).transpose := by decide

-- Test BruhatTits.descent_SU3_central_root
example {k : Type u} [Field k] (c : k) (hc : c ≠ 0) :
    ¬ ∃ u v : k,
      (!![1, u, 0; 0, 1, 0; 0, 0, 1] : Matrix (Fin 3) (Fin 3) k) *
        !![1, 0, 0; 0, 1, v; 0, 0, 1] = !![1, 0, c; 0, 1, 0; 0, 0, 1] := by sorry

-- Test BruhatTits.Decomposition.conjugation_two_terms
example :
    (Matrix.diagonal ![2, (1 / 2)] : Matrix (Fin 2) (Fin 2) ℚ_[2]) * !![1, 1; 0, 1] *
      Matrix.diagonal ![(1 / 2), 2] = !![1, 4; 0, 1] ∧
    (Matrix.diagonal ![(1 / 2), 2] : Matrix (Fin 2) (Fin 2) ℚ_[2]) * !![1, 1; 0, 1] *
      Matrix.diagonal ![2, (1 / 2)] = !![1, (1 / 4); 0, 1] ∧
    GLBuilding.ω ℚ_[2] 4 = 2 ∧ GLBuilding.ω ℚ_[2] (1 / 4) = -2 := by sorry

namespace GSp4

-- Test GSp4.duality_matrix_unimodular
example : Matrix.det (!![1, 1, 1; 1, 0, 1; 1, 1, 2] : Matrix (Fin 3) (Fin 3) ℤ) = -1 := by
  norm_num [Matrix.det_fin_three]

-- Test GSp4.simple_root_images
example :
    (!![1, 1, 1; 1, 0, 1; 1, 1, 2] : Matrix (Fin 3) (Fin 3) ℤ).mulVec ![-1, 1, 0] = ![0, -1, 0] ∧
    (!![1, 1, 1; 1, 0, 1; 1, 1, 2] : Matrix (Fin 3) (Fin 3) ℤ).mulVec ![0, -2, 1] = ![-1, 1, 0] := by
  constructor <;> ext i <;> fin_cases i <;> norm_num [Matrix.mulVec, dotProduct, Fin.sum_univ_three]

-- Test GSp4.printed_coroot_has_wrong_sign
example : dotProduct (![0, -2, 1] : Fin 3 → ℤ) ![0, 1, 0] = -2 := by
  norm_num [dotProduct, Fin.sum_univ_three]

end GSp4

namespace LocalIntegration

open scoped PointTopology NNReal

/-- The normalized absolute determinant of the adjoint action on the Lie algebra. -/
def adjointModulus (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (H : Type u) [CommRing H] [HopfAlgebra E H]
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E H)]
    (g : WithConv (H →ₐ[E] E)) : ℝ≥0 :=
  (TauCeti.normalizedAbsoluteValue E
    (LinearEquiv.det ((Derivation.adjointAction (R := E) (H := H)
      (CommAlgCat.of E E) g).toLinearEquiv) : E) : ℝ≥0)

/-- For a smooth affine group of finite type over a nonarchimedean local field, the analytic
tangent and Haar-Jacobian comparison identifies the modular character with the absolute
adjoint determinant, in either characteristic. -/
theorem modularCharacter_eq_adjointModulus (E : Type u) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (H : Type u) [CommRing H] [HopfAlgebra E H] [Algebra.FiniteType E H]
    [Algebra.Smooth E H] [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E H)]
    (g : WithConv (H →ₐ[E] E)) :
    MeasureTheory.Measure.modularCharacter g = adjointModulus E H g := sorry

-- Test LocalIntegration.adjointModulus_gm
/- A commutative group has trivial adjoint action, so modulus `1`. -/
example (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E]
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E (LaurentPolynomial E))]
    (g : WithConv (LaurentPolynomial E →ₐ[E] E)) :
    adjointModulus E (LaurentPolynomial E) g = 1 := sorry

-- Test LocalIntegration.adjointModulus_upperTriangular_two_terms
/- On the upper-triangular subgroup of `GL₂` over `E`, with `q = #𝓀[E]`, the adjoint modulus and the
modular character are both `q⁻¹` at `diag(ϖ, 1)` and `q⁻²` at `diag(ϖ², 1)`: the adjoint action
multiplies the root line by `ϖ` and `ϖ²`, so these values separate `|det Ad|` from its inverse. -/
open ValuativeRel in
example (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E]
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E
      (TauCeti.GeneralLinear.UpperTriangular.finiteTypeCoordinateHopfAlgebra E 2))]
    (ϖ : 𝒪[E]) (hϖ : Irreducible ϖ)
    (g₁ g₂ : WithConv
      (TauCeti.GeneralLinear.UpperTriangular.finiteTypeCoordinateHopfAlgebra E 2 →ₐ[E] E))
    (hg₁ : ((TauCeti.GeneralLinear.UpperTriangular.pointsMulEquiv (R := E) (n := 2) (A := E) g₁ :
      GL (Fin 2) E) : Matrix (Fin 2) (Fin 2) E) = Matrix.diagonal ![(ϖ : E), 1])
    (hg₂ : ((TauCeti.GeneralLinear.UpperTriangular.pointsMulEquiv (R := E) (n := 2) (A := E) g₂ :
      GL (Fin 2) E) : Matrix (Fin 2) (Fin 2) E) = Matrix.diagonal ![(ϖ : E) ^ 2, 1]) :
    adjointModulus E _ g₁ = (Nat.card 𝓀[E] : ℝ≥0)⁻¹ ∧
      MeasureTheory.Measure.modularCharacter g₁ = (Nat.card 𝓀[E] : ℝ≥0)⁻¹ ∧
      adjointModulus E _ g₂ = ((Nat.card 𝓀[E] : ℝ≥0) ^ 2)⁻¹ ∧
      MeasureTheory.Measure.modularCharacter g₂ = ((Nat.card 𝓀[E] : ℝ≥0) ^ 2)⁻¹ := sorry

end LocalIntegration

end

end TauCetiRoadmap.ReductiveGroupsPartII
