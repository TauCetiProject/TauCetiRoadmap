import Mathlib
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Smooth.CommHopfAlgCat
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Basic
import TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Basic
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Basic
import TauCeti.Algebra.AlgebraicGroup.Tangent.Representation
import TauCeti.Algebra.AlgebraicGroup.Dynamic.Parabolic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.BaseChange
import TauCeti.Algebra.AlgebraicGroup.Derived.Basic
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.NumberTheory.LocalField.Unramified.Maximal
import TauCeti.NumberTheory.LocalField.NormalizedValuation
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic

/-!
# Reductive algebraic groups, Part II: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the pinned Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer.

The file makes its design choices explicit.
* An affine group scheme over a commutative ring `R` is a commutative Hopf `R`-algebra `H`, and its
  `A`-points are the Tau Ceti convolution group `WithConv (H →ₐ[R] A)`.
* `K` is a field with a nontrivial discrete valuative relation of rank one (`ModelField`) whose
  ring of integers `𝒪[K]` is henselian and whose residue field `𝓀[K]` is perfect; the two instances used throughout are a nonarchimedean
  local field `E` (Mathlib's `IsNonarchimedeanLocalField`) and the completion `Ĕ` of its maximal
  unramified extension.
* The additive valuation is normalized by `ω(ϖ) = 1`, and a central element `z` of the minimal Levi
  acts on the apartment by the translation `v(z)` with `χ(v(z)) = -ω(χ(z))`.
* The building is the enlarged building unless the reduced one is named; a parahoric subgroup is
  the group of integral points of the *connected* Bruhat–Tits group scheme.
* Unvalued algebraic structure of a reductive group (maximal split tori, relative and absolute
  root data, root subgroups, parabolic subgroups, the pinned Chevalley–Demazure groups) belongs to
  the Tau Ceti roadmap *Reductive algebraic groups* (layers 7 and 9); the library has its dynamic
  parabolics (`TauCeti.Cocharacter.parabolic`, `TauCeti.Cocharacter.levi`) and pinnings, but not
  the relative root datum of a reductive group over a field. `BruhatTits.LocalRootData` chooses a maximal split subgroup scheme;
  its realization constructs the relative roots and their groups. Morphisms of group schemes
  determine the comparison maps on apartments.

The file opens with a spine of shared carriers and then follows the README layer by layer.
-/

namespace TauCetiRoadmap.ReductiveGroupsPartII

set_option autoImplicit false

noncomputable section

open _root_.CategoryTheory
open scoped TensorProduct

/-! ## Spine: the carriers shared by all layers

The declarations in this part are the central objects of the roadmap. Each layer below adds the
API lemmas and unit tests of the targets that own them. -/

universe u v w

/-! ### RG2.0 — the topology on points -/

namespace PointTopology

variable (k : Type u) [CommRing k] (A : Type v) [CommRing A] [Algebra k A]
  (R : Type w) [CommRing R] [Algebra k R] [TopologicalSpace R]

/-- The point topology on `X(R) = Hom_k(A, R)`: the coarsest topology for which every evaluation
map `f ↦ f a` (`a : A`) is continuous. -/
@[reducible] def topology : TopologicalSpace (A →ₐ[k] R) :=
  ⨅ a : A, TopologicalSpace.induced (fun f : A →ₐ[k] R => f a) ‹TopologicalSpace R›

/-- The point topology, as a scoped instance. -/
scoped instance instTopologicalSpace : TopologicalSpace (A →ₐ[k] R) := topology k A R

/-- The point topology on the convolution-group carrier `WithConv (A →ₐ[k] R)` of points. -/
scoped instance instTopologicalSpaceWithConv : TopologicalSpace (WithConv (A →ₐ[k] R)) :=
  TopologicalSpace.induced WithConv.ofConv (topology k A R)

end PointTopology

/-! ### RG2.0 — the completed maximal unramified extension -/

namespace MaxUnramifiedCompletion

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- The canonical algebraic maximal unramified extension at the pinned library. -/
abbrev Unramified := TauCeti.maximalUnramifiedExtension E (AlgebraicClosure E)

/-- The unique extension of the henselian valuation to the algebraic unramified extension. -/
instance unramifiedValuativeRel : ValuativeRel (Unramified E) := sorry
instance unramifiedValuativeExtension : ValuativeExtension E (Unramified E) := sorry

instance unramifiedUniformSpace : UniformSpace (Unramified E) :=
  ValuativeRel.uniformSpace (Unramified E)
instance unramifiedIsValuativeTopology : IsValuativeTopology (Unramified E) :=
  ValuativeRel.isValuativeTopology (Unramified E)
instance unramifiedIsUniformAddGroup : IsUniformAddGroup (Unramified E) :=
  ValuativeRel.isUniformAddGroup (Unramified E)

instance unramifiedUniformContinuousConstSMul : UniformContinuousConstSMul E (Unramified E) :=
  sorry

/-- The uniform completion of the maximal unramified extension, with its induced field,
valuation, topology and algebra structures. -/
abbrev Breve (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] := UniformSpace.Completion (Unramified E)

/-- Completion preserves the nontrivial discrete value group of the unramified extension. -/
instance breveIsDiscrete : ValuativeRel.IsDiscrete (Breve E) := sorry
instance breveIsNontrivial : ValuativeRel.IsNontrivial (Breve E) := sorry

/-- Arithmetic Frobenius on the canonical algebraic extension. -/
abbrev unramifiedFrobenius : Unramified E ≃ₐ[E] Unramified E :=
  TauCeti.maximalUnramifiedFrobenius E (AlgebraicClosure E)

/-- Frobenius on the algebraic extension preserves its valuation topology. -/
theorem continuous_unramifiedFrobenius :
    Continuous (unramifiedFrobenius E) := sorry

theorem continuous_unramifiedFrobenius_symm :
    Continuous (unramifiedFrobenius E).symm := sorry

/-- Arithmetic Frobenius extended by the uniform-completion functor. -/
def frobenius : Breve E ≃ₐ[E] Breve E where
  toRingEquiv := UniformSpace.Completion.mapRingEquiv
    (unramifiedFrobenius E).toRingEquiv
    (continuous_unramifiedFrobenius E) (continuous_unramifiedFrobenius_symm E)
  commutes' := by sorry

/-- The extension agrees with arithmetic Frobenius on the dense algebraic subfield. -/
theorem frobenius_coe (x : Unramified E) :
    frobenius E (x : Breve E) =
      (unramifiedFrobenius E x : Breve E) := sorry

theorem continuous_frobenius : Continuous (frobenius E) := sorry

-- Test MaxUnramifiedCompletion.unramified_no_sqrt_uniformizer
/- A uniformizer of `E` has no square root in `E^{ur}`, so `E^{ur}` is not the algebraic
closure. -/
example (ϖ : 𝒪[E]) (hϖ : Irreducible ϖ) (x : Unramified E) :
    x ^ 2 ≠ algebraMap E (Unramified E) ϖ := sorry

-- Test MaxUnramifiedCompletion.completion_dense
example : DenseRange (fun x : Unramified E => (x : Breve E)) :=
  UniformSpace.Completion.denseRange_coe

-- Test MaxUnramifiedCompletion.completion_valuation
example (x y : Unramified E) :
    (x : Breve E) ≤ᵥ (y : Breve E) ↔ x ≤ᵥ y :=
  UniformSpace.Completion.coe_vle_coe_iff

-- Test MaxUnramifiedCompletion.frobenius_two_terms
/- Arithmetic, not geometric, Frobenius: on a root `ζ` of `X^(q^n) − X` the extended Frobenius
gives `ζ^q`, and its inverse sends `ζ^q` back to `ζ`. -/
example (n : ℕ) (hn : n ≠ 0) (x : Unramified E) (hx : x ^ (Nat.card 𝓀[E] ^ n) = x) :
    frobenius E (x : Breve E) = ((x ^ Nat.card 𝓀[E] : Unramified E) : Breve E) ∧
      (frobenius E).symm ((x ^ Nat.card 𝓀[E] : Unramified E) : Breve E) = (x : Breve E) := by
  have h : frobenius E (x : Breve E) = ((x ^ Nat.card 𝓀[E] : Unramified E) : Breve E) := by
    rw [frobenius_coe, TauCeti.maximalUnramifiedFrobenius_apply_of_pow_natCard_pow_eq_self hn hx]
  exact ⟨h, by rw [← h, AlgEquiv.symm_apply_apply]⟩

-- Test MaxUnramifiedCompletion.unramifiedFrobenius_seventh_roots
/- Residue characteristic `2`: over `ℚ₂`, where `q = 2`, a primitive seventh root of unity `ζ` is
a root of `X^8 − X` of degree `3`; arithmetic Frobenius sends it to `ζ^2`, while geometric
Frobenius would send it to `ζ^4 ≠ ζ^2`. -/
example : (∃ ζ : Unramified ℚ_[2], IsPrimitiveRoot ζ 7) ∧
    ∀ ζ : Unramified ℚ_[2], IsPrimitiveRoot ζ 7 →
      unramifiedFrobenius ℚ_[2] ζ = ζ ^ 2 ∧ unramifiedFrobenius ℚ_[2] ζ ≠ ζ ^ 4 := sorry

-- Test MaxUnramifiedCompletion.unramifiedFrobenius_fixed
/- The elements of `E^{ur}` fixed by Frobenius are exactly those of `E`. -/
example : {x : Unramified E | unramifiedFrobenius E x = x} =
    Set.range (algebraMap E (Unramified E)) := sorry

-- Test MaxUnramifiedCompletion.unramifiedFrobenius_congr
/- On the integers of `E^{ur}`, Frobenius reduces to the `q`-th power map of the residue field. -/
example (x : Unramified E) (hx : valuation (Unramified E) x ≤ 1) :
    valuation (Unramified E) (unramifiedFrobenius E x - x ^ Nat.card 𝓀[E]) < 1 := sorry

end MaxUnramifiedCompletion

/-! ### RG2.0a — Weil restriction -/

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

/-- The representing `k`-algebra `Res_{k'/k} A'` of the Weil restriction, for `k → k'` finite
locally free; its universal property is `homEquiv` with `homEquiv_apply`. When `k'` is not finite
projective over `k` no statement of this file constrains the type. -/
def Res (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    (A' : Type u) [CommRing A'] [Algebra k' A'] : Type u := sorry

instance : CommRing (Res k k' A') := sorry
instance : Algebra k (Res k k' A') := sorry

/-- The universal property of the representing algebra: `Hom_k(Res A', R) ≃ Hom_{k'}(A', k' ⊗_k R)`,
for `k → k'` finite locally free. -/
def homEquiv [Module.Finite k k'] [Module.Projective k k'] (R : Type u) [CommRing R]
    [Algebra k R] : (Res k k' A' →ₐ[k] R) ≃ (A' →ₐ[k'] k' ⊗[k] R) := sorry

end WeilRestriction

namespace AlgebraicRelativeRoots
variable {F : Type u} [Field F] {H : Type u} [CommRing H] [HopfAlgebra F H]

abbrev subgroupPoints (S : TauCeti.HopfIdeal F H) (R : Type u) [CommRing R] [Algebra F R] :=
  TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) S (CommAlgCat.of F R)
abbrev Character (S : TauCeti.HopfIdeal F H) := Additive (GroupLike F (H ⧸ S.toIdeal))
abbrev Cocharacter (S : TauCeti.HopfIdeal F H) := Character S →+ ℤ

/-- Evaluation on a quotient point, fixed on every coordinate representative. -/
def characterValue (S : TauCeti.HopfIdeal F H) (χ : Character S)
    (R : Type u) [CommRing R] [Algebra F R] (t : subgroupPoints S R) : Rˣ := sorry

theorem characterValue_coe (S : TauCeti.HopfIdeal F H) (χ : Character S)
    (R : Type u) [CommRing R] [Algebra F R] (t : subgroupPoints S R)
    (a : H) (ha : Ideal.Quotient.mk S.toIdeal a = χ.toMul.val) :
    (characterValue S χ R t : R) = t.val.ofConv a := by sorry

/-- The pinned adjoint representation on counit derivations. -/
abbrev adjoint (g : WithConv (H →ₐ[F] AlgebraicClosure F))
    (d : Derivation F H (TauCeti.Bialgebra.CounitAlgebra F H (AlgebraicClosure F))) :=
  Derivation.adDerivation (AlgebraicClosure F)
    (TauCeti.AlgHom.mapValue
      (TauCeti.Bialgebra.CounitAlgebra.algEquivSelf F H (AlgebraicClosure F)).symm.toAlgHom g) d

/-- Rational points centralizing the subgroup scheme on every coefficient algebra. -/
def centralizer (S : TauCeti.HopfIdeal F H) : Subgroup (WithConv (H →ₐ[F] F)) where
  carrier := {g | ∀ (R : Type u) [CommRing R] [Algebra F R],
    ∀ t : subgroupPoints S R, Commute (TauCeti.AlgHom.mapValue (Algebra.ofId F R) g) t.val}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- Rational points normalizing the subgroup scheme on every coefficient algebra. -/
def normalizer (S : TauCeti.HopfIdeal F H) : Subgroup (WithConv (H →ₐ[F] F)) where
  carrier := {g | ∀ (R : Type u) [CommRing R] [Algebra F R],
    (subgroupPoints S R).map
      (MulAut.conj (TauCeti.AlgHom.mapValue (Algebra.ofId F R) g)).toMonoidHom = subgroupPoints S R}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

def centralizerIdeal (S : TauCeti.HopfIdeal F H) : TauCeti.HopfIdeal F H := sorry

theorem centralizerIdeal_points (S : TauCeti.HopfIdeal F H)
    (R : Type u) [CommRing R] [Algebra F R] (g : WithConv (H →ₐ[F] R)) :
    g ∈ subgroupPoints (centralizerIdeal S) R ↔
      ∀ (R' : Type u) [CommRing R'] [Algebra F R'] (f : R →ₐ[F] R')
        (t : subgroupPoints S R'), Commute (TauCeti.AlgHom.mapValue f g) t.val := by sorry

/-- The root ray group is the intersection of all cocharacter contractions
whose pairing with this nonzero character is positive. Only indivisible roots are used below. -/
def rootRayPoints (S : TauCeti.HopfIdeal F H) (α : Character S)
    (R : Type u) [CommRing R] [Algebra F R] : Subgroup (WithConv (H →ₐ[F] R)) :=
  ⨅ (ell : H →ₐc[F] LaurentPolynomial F)
    (_ : ∀ a ∈ S.toIdeal, ell a = 0)
    (_ : ∃ (a : H) (n : ℤ), 0 < n ∧
      Ideal.Quotient.mk S.toIdeal a = α.toMul.val ∧ ell a = LaurentPolynomial.T n),
    TauCeti.Cocharacter.unipotent R ell


/-- The geometric weight space in the actual counit-derivation adjoint module.
Testing geometric torus points retains distinct characters over finite fields. -/
def weightSpace (S : TauCeti.HopfIdeal F H) (χ : Character
    (H := H) S) :
    Submodule (AlgebraicClosure F)
      (Derivation F H (TauCeti.Bialgebra.CounitAlgebra F H (AlgebraicClosure F))) where
  carrier := {d | ∀ t : subgroupPoints (H := H) S
      (AlgebraicClosure F),
    adjoint t.val d = (characterValue S χ (AlgebraicClosure F) t : AlgebraicClosure F) • d}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Relative roots are the nonzero characters with nonzero adjoint weight space. -/
abbrev Root (S : TauCeti.HopfIdeal F H) :=
  {χ : Character S // χ ≠ 0 ∧ weightSpace S χ ≠ ⊥}

/-- The local modulus on the split torus, using each adjoint weight once with its dimension. -/
def localModulus (S : TauCeti.HopfIdeal F H) (positive : Finset (Root S))
    (absValue : F → ℝ) (t : subgroupPoints S F) : ℝ :=
  ∏ a ∈ positive, absValue (characterValue S a.val F t) ^
    Module.finrank (AlgebraicClosure F) (weightSpace S a.val)

end AlgebraicRelativeRoots

/-! ### RG2.1 — abstract valued root data (Bruhat–Tits I §6) -/

namespace BruhatTits

variable {ι M N : Type u} [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]

/-- Bruhat–Tits I, 6.1.1, p. 107: DR1–DR6 for a possibly nonreduced root system `Φ`, given as a
Mathlib root pairing over `ℝ` (roots in `M = V*`, coroots in `N = V`). Results that use the
finiteness of a root system, such as `N/T ≃ W(Φ)`, assume `Finite ι`.
The cosets `reflectionCoset` supply reflection representatives; `positiveVector` chooses the
positive system used in the Bruhat separation axiom. -/
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
  /-- DR3: the doubled root subgroup is proper (BT I 6.1.1, p. 107). -/
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

/-- The torus normalizes every root subgroup; Bruhat–Tits I, 6.1.2(3). -/
theorem RootDatum.le_normalizer {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    (D : RootDatum G Φ) (i : ι) : D.T ≤ Subgroup.normalizer (D.U i : Set G) := sorry

/-- Bruhat–Tits I, 6.2.1, pp. 116–117: all six valued-root-datum axioms.
Real shifts in V2 and V5 avoid subtraction involving infinity. -/
structure Valuation {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ) where
  φ : (i : ι) → D.U i → WithTop ℝ
  /-- V0. -/
  three_values : ∀ i, 3 ≤ (Set.range (φ i)).encard
  /-- V1, at infinity and at finite levels. -/
  φ_eq_top_iff : ∀ i u, φ i u = ⊤ ↔ u = 1
  filtration : ι → ℝ → Subgroup G
  mem_filtration_iff : ∀ i r g, g ∈ filtration i r ↔
    ∃ u : D.U i, (u : G) = g ∧ (r : WithTop ℝ) ≤ φ i u
  /-- V2: the opposite-root valuation changes by a constant under a reflection lift. -/
  reflection_shift : ∀ i j, Φ.root j = -Φ.root i → ∀ m ∈ D.reflectionCoset i,
    ∃ c : ℝ, ∀ (u : D.U j) (v : D.U i), u ≠ 1 →
      (v : G) = m * (u : G) * m⁻¹ → φ j u = φ i v + (c : WithTop ℝ)
  /-- V3: depth-additive commutators, excluding negatively proportional roots only. -/
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

/-- Two valuations are equipollent if they differ by a vector `v` of the coroot space:
`ψ_a = φ_a + a(v)` (Bruhat–Tits I, 6.2.5). -/
def Equipollent {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ ψ : Valuation D) : Prop :=
  ∃ v : N, ∀ i u, ψ.φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ)

/-- The apartment relative to a base valuation, retaining the displacement in the full vector
space. Root valuations alone forget the directions annihilated by every root. -/
structure Apartment {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Type (max u v) where
  val : Valuation D
  displacement : N
  val_eq : ∀ i u, val.φ i u = φ.φ i u +
    ((Φ.toLinearMap (Φ.root i) displacement : ℝ) : WithTop ℝ)

instance Apartment.instAddTorsor {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} (φ : Valuation D) : AddTorsor N (Apartment φ) := sorry

end BruhatTits

/-! ### RG2.1 — unvalued data of a reductive group over a field

The structure theory of a maximal split torus (relative root system, root subgroups, coroots,
centralizer and normalizer) and of the absolute based root datum with its Galois action is the
subject of the Tau Ceti roadmap *Reductive algebraic groups*, layer 7. The declarations below
state, from the coordinate Hopf algebra and a chosen maximal split (or maximal) torus, exactly the
objects of that theory which the valued theory consumes; their structure theory is not developed
here. -/

namespace BruhatTits

open ValuativeRel

/-- The `R`-points of the closed subgroup cut out by a Hopf ideal: the pinned
`TauCeti.CommHopfAlgCat.quotientPointsSubgroup`, indexed by the coefficient type `R` rather than
by an object of `CommAlgCat`. -/
abbrev subgroupPoints {K : Type u} [Field K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (I : TauCeti.HopfIdeal K H)
    (R : Type u) [CommRing R] [Algebra K R] : Subgroup (WithConv (H →ₐ[K] R)) :=
  TauCeti.CommHopfAlgCat.quotientPointsSubgroup H.obj I (CommAlgCat.of K R)

-- Test BruhatTits.subgroupPoints_mem_iff
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (I : TauCeti.HopfIdeal K H) (R : Type u) [CommRing R] [Algebra K R]
    (g : WithConv (H →ₐ[K] R)) : g ∈ subgroupPoints I R ↔ ∀ a ∈ I, g.ofConv a = 0 :=
  TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff H.obj I (CommAlgCat.of K R) g

-- Test BruhatTits.subgroupPoints_bot
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (R : Type u) [CommRing R] [Algebra K R] :
    subgroupPoints (⊥ : TauCeti.HopfIdeal K H) R = ⊤ := by
  ext g
  simp only [Subgroup.mem_top, iff_true]
  refine (TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff H.obj ⊥ (CommAlgCat.of K R) g).2 ?_
  intro a ha
  rw [TauCeti.HopfIdeal.mem_bot.1 ha, map_zero]

-- Test BruhatTits.subgroupPoints_augmentation
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (H →ₐ[K] R))
    (hg : g ∈ subgroupPoints (TauCeti.HopfIdeal.augmentation K H) R) : g = 1 :=
  TauCeti.CommHopfAlgCat.eq_one_of_mem_quotientPointsSubgroup_augmentation H.obj
    (CommAlgCat.of K R) hg

namespace GeometricRoots

open TauCeti

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- Characters of the actual closed subgroup, in the pinned group-like vocabulary. -/
abbrev Character (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.Character S
abbrev Cocharacter (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.Cocharacter S
abbrev characterValue (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.characterValue S

theorem characterValue_coe (S : TauCeti.HopfIdeal K H) (χ : Character S)
    (R : Type u) [CommRing R] [Algebra K R] (t : subgroupPoints S R)
    (a : H) (ha : Ideal.Quotient.mk S.toIdeal a = (χ.toMul : H ⧸ S.toIdeal)) :
    (characterValue S χ R t : R) = t.val.ofConv a := sorry

/-- The shared algebraic adjoint action and its relative root carrier. -/
abbrev adjoint := AlgebraicRelativeRoots.adjoint (F := K) (H := (H : Type u))
abbrev weightSpace (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.weightSpace S
abbrev Root (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.Root S

/-- The root subgroup `U_(a)` of a relative root, including `U_(2a)` when `2a` is a root: the
subgroup generated by the absolute root subgroups whose restriction to `S` is a positive integral
multiple of `a` (Bruhat–Tits I 6.1.3 c), p. 110). It is pinned by `rootSubgroup_points` for
indivisible roots and by `rootSubgroup_unique` for doubled roots. -/
def rootSubgroup (S : TauCeti.HopfIdeal K H) (a : Root S) : TauCeti.HopfIdeal K H := sorry

/-- For an indivisible root `a`, `U_(a)` is the intersection of the dynamic unipotent subgroups
`U_G(λ)` over the cocharacters `λ` of `S` with `⟨a, λ⟩ > 0`, tested on every `K`-algebra. Derived
from Bruhat–Tits I 6.1.3 c), p. 110: over `K̄` both sides are generated by the absolute root
groups whose restriction to `S` is a positive multiple of `a`. -/
theorem rootSubgroup_points (S : TauCeti.HopfIdeal K H) (a : Root S)
    (hindiv : ∀ b : Root S, b.val + b.val ≠ a.val)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S)
    (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (H →ₐ[K] R)) :
    g ∈ subgroupPoints (rootSubgroup S a) R ↔
      ∀ (l : H →ₐc[K] LaurentPolynomial K),
        (∀ b ∈ S.toIdeal, l b = 0) →
        (∃ (b : H) (n : ℤ), 0 < n ∧
          Ideal.Quotient.mk S.toIdeal b = a.val.toMul.val ∧ l b = LaurentPolynomial.T n) →
        g ∈ TauCeti.Cocharacter.unipotent R l := sorry

/-- The relative coroot `a^∨ ∈ X_*(S)`: for `2a ∉ Φ` the coroot of `a` in a split subgroup of
maximal rank, and for `2a ∈ Φ` twice the coroot of `2a` (Tits, Corvallis Part 1, 3.5,
pp. 52–53). It is pinned by `coroot_reflection`. -/
def coroot (S : TauCeti.HopfIdeal K H) (a : Root S) : Cocharacter S := sorry

/-- `⟨a, a^∨⟩ = 2`, and some `n ∈ N_G(S)(K)` acts on `S` by the reflection
`χ ↦ χ − ⟨χ, a^∨⟩ a`. Since the only reflections in the relative Weyl group sending `a` to `−a`
are `s_a = s_{2a}`, this determines `a^∨`. -/
theorem coroot_reflection (S : TauCeti.HopfIdeal K H) (a : Root S)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    coroot S a a.val = 2 ∧ ∃ n : WithConv (H →ₐ[K] K),
      ∀ t : subgroupPoints S (AlgebraicClosure K),
        ∃ t' : subgroupPoints S (AlgebraicClosure K),
          t'.val = TauCeti.AlgHom.mapValue (Algebra.ofId K (AlgebraicClosure K)) n * t.val *
            (TauCeti.AlgHom.mapValue (Algebra.ofId K (AlgebraicClosure K)) n)⁻¹ ∧
          ∀ χ : Character S, characterValue S χ (AlgebraicClosure K) t' = characterValue S χ (AlgebraicClosure K) t *
            characterValue S a.val (AlgebraicClosure K) t ^ (-(coroot S a χ)) := sorry

/-- Extension of the integral character/cocharacter pairing to the real cocharacter space. -/
def characterLinear (S : TauCeti.HopfIdeal K H) (χ : Character S) :
    (ℝ ⊗[ℤ] Cocharacter S) →ₗ[ℝ] ℝ := sorry

theorem characterLinear_tmul (S : TauCeti.HopfIdeal K H) (χ : Character S)
    (r : ℝ) (mu : Cocharacter S) : characterLinear S χ (r ⊗ₜ[ℤ] mu) = r * (mu χ : ℝ) := sorry

abbrev centralizer (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.centralizer S
abbrev normalizer (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.normalizer S

/-- Geometric characters of the actual torus quotient, using the pinned character functor. -/
abbrev GeometricCharacter (S : TauCeti.HopfIdeal K H) :=
  TauCeti.CommHopfAlgCat.additiveCharacterGroup
    (TauCeti.FiniteTypeCommHopfAlgCat.quotient H S).obj

/-- Evaluate a geometric character on a geometric torus point. -/
def geometricCharacterValue (S : TauCeti.HopfIdeal K H) (χ : GeometricCharacter S)
    (t : subgroupPoints S (AlgebraicClosure K)) : (AlgebraicClosure K)ˣ := sorry

/-- Absolute roots are precisely the nonzero weights of the actual adjoint representation. -/
def GeometricRoot (S : TauCeti.HopfIdeal K H) :=
  {χ : GeometricCharacter S // χ ≠ 0 ∧
    ∃ d : Derivation K H (Bialgebra.CounitAlgebra K H (AlgebraicClosure K)), d ≠ 0 ∧
      ∀ t : subgroupPoints S (AlgebraicClosure K),
        adjoint t.val d = (geometricCharacterValue S χ t : AlgebraicClosure K) • d}

/-- The coroot supplied by the rank-one subgroup and its simply connected cover. -/
def geometricCoroot (S : TauCeti.HopfIdeal K H) (a : GeometricRoot S) :
    GeometricCharacter S →+ ℤ := sorry

/-- The same geometric reflection characterization fixes the absolute coroot. -/
theorem geometricCoroot_reflection (S : TauCeti.HopfIdeal K H) (a : GeometricRoot S)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    geometricCoroot S a a.val = 2 ∧ ∃ n : WithConv (H →ₐ[K] AlgebraicClosure K),
      ∀ t : subgroupPoints S (AlgebraicClosure K),
        ∃ t' : subgroupPoints S (AlgebraicClosure K), t'.val = n * t.val * n⁻¹ ∧
          ∀ χ : GeometricCharacter S,
            geometricCharacterValue S χ t' = geometricCharacterValue S χ t *
              geometricCharacterValue S a.val t ^ (-(geometricCoroot S a χ)) := sorry

/-- Coordinate evaluation after base change; its tensor formula fixes the character map. -/
def geometricEvaluation (S : TauCeti.HopfIdeal K H)
    (t : subgroupPoints S (AlgebraicClosure K)) :
    (AlgebraicClosure K ⊗[K] (H ⧸ S.toIdeal)) →ₐ[AlgebraicClosure K] AlgebraicClosure K := sorry

theorem geometricEvaluation_tmul (S : TauCeti.HopfIdeal K H)
    (t : subgroupPoints S (AlgebraicClosure K)) (r : AlgebraicClosure K) (a : H) :
    geometricEvaluation S t (r ⊗ₜ[K] Ideal.Quotient.mk S.toIdeal a) = r * t.val.ofConv a := sorry

theorem geometricCharacterValue_coe (S : TauCeti.HopfIdeal K H) (χ : GeometricCharacter S)
    (t : subgroupPoints S (AlgebraicClosure K)) :
    (geometricCharacterValue S χ t : AlgebraicClosure K) = geometricEvaluation S t χ.toMul.val := sorry

/-- The scheme-theoretic centralizer of S in H, constructed by the centralizer functor. -/
abbrev centralizerIdeal (S : TauCeti.HopfIdeal K H) := AlgebraicRelativeRoots.centralizerIdeal S

theorem centralizerIdeal_points (S : TauCeti.HopfIdeal K H) :
    subgroupPoints (centralizerIdeal S) K = centralizer S := sorry

/-- The centralizer is characterized on every coefficient algebra and its extensions. -/
theorem centralizerIdeal_points_iff (S : TauCeti.HopfIdeal K H)
    (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (H →ₐ[K] R)) :
    g ∈ subgroupPoints (centralizerIdeal S) R ↔
      ∀ (R' : Type u) [CommRing R'] [Algebra K R'] (f : R →ₐ[K] R')
        (t : subgroupPoints S R'), Commute (TauCeti.AlgHom.mapValue f g) t.val := sorry

/-- For a doubled root `b = 2a` of a quasi-split group, `U_(2a)` is the closed subgroup
generated by the commutators of `U_(a)`: in the coordinates `U_(a) ≅ H₀(L, L₂)` it is
`{(0, v) : v + v̄ = 0}` (Bruhat–Tits II 4.1.10, p. 83), and the group law of 4.1.9 (5), p. 82,
gives `[(u, v), (u', v')] = (0, ūu' − ū'u)`, whose values `w − w̄` fill the trace-zero line.
Quasi-splitness is used: in characteristic two the commutators of `U_(a)` generate a
proper subgroup of `U_(2a)` for an inner form of `Sp₆` of `K`-rank one, whose long roots
restricting to `2a` arise only from commutators with Chevalley constant `±2`. -/
theorem rootSubgroup_double (S : TauCeti.HopfIdeal K H) (a b : Root S)
    (hab : b.val = a.val + a.val)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S)
    (hqs : TauCeti.torusCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (centralizerIdeal S))) :
    rootSubgroup S b = sSup {I : TauCeti.HopfIdeal K H |
      ∀ (R : Type u) [CommRing R] [Algebra K R]
        (g h : subgroupPoints (rootSubgroup S a) R),
        g.val * h.val * g.val⁻¹ * h.val⁻¹ ∈ subgroupPoints I R} := sorry

/-- A doubled root group `U_(2a)` is the unique smooth, geometrically connected, unipotent closed
subgroup normalized by `Z_G(S)` whose Lie algebra is the weight space `g_{2a}` (a specialization
of Springer, *Reductive groups*, Corvallis Part 1, §3.5, p. 13, which requires normalization by `S`); the Lie algebra of the subgroup cut out by `I` is the
space of tangent vectors vanishing on `I`. -/
theorem rootSubgroup_unique (S : TauCeti.HopfIdeal K H) (a b : Root S)
    (hab : b.val = a.val + a.val)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S)
    (I : TauCeti.HopfIdeal K H)
    (hU : TauCeti.smoothUnipotentCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I))
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I).obj)
    (hnorm : ∀ (R : Type u) [CommRing R] [Algebra K R] (t : subgroupPoints (centralizerIdeal S) R),
      (subgroupPoints I R).map (MulAut.conj t.val).toMonoidHom = subgroupPoints I R)
    (hLie : ∀ d : Derivation K H (Bialgebra.CounitAlgebra K H (AlgebraicClosure K)),
      (∀ x ∈ I, d x = 0) ↔ ∀ t : subgroupPoints S (AlgebraicClosure K),
        adjoint t.val d =
          (characterValue S b.val (AlgebraicClosure K) t : AlgebraicClosure K) • d) :
    I = rootSubgroup S b := sorry

/-- Restriction of an algebraic character of `Z_G(S)` to `S`, for a commutative `S`, so that
`S ⊆ Z_G(S)`; it is pinned by `restrictCharacter_value`, and for non-commutative `S` no statement of
this file constrains it. -/
def restrictCharacter (S : TauCeti.HopfIdeal K H) :
    Character (centralizerIdeal S) →+ Character S := sorry

/-- For a commutative `S` (so that `S ⊆ Z_G(S)`), restriction is the pullback along the inclusion
`S → Z_G(S)`. Commutativity is needed: over a field of characteristic `≠ 2`, for
`S = SL₂ ⊂ GL₂` the centralizer is the scalar `G_m`,
`SL₂` has no nontrivial character, and the identity character of `G_m` takes the value `−1` at
`−I ∈ SL₂ ∩ G_m`. -/
theorem restrictCharacter_value (S : TauCeti.HopfIdeal K H)
    (hcomm : ∀ (R : Type u) [CommRing R] [Algebra K R] (t t' : subgroupPoints S R),
      Commute t.val t'.val)
    (χ : Character (centralizerIdeal S)) (R : Type u) [CommRing R] [Algebra K R]
    (t : subgroupPoints S R) (z : subgroupPoints (centralizerIdeal S) R) (h : t.val = z.val) :
    characterValue S (restrictCharacter S χ) R t = characterValue (centralizerIdeal S) χ R z := sorry

/-- Restriction of a character of G to its closed split torus. -/
def restrictAmbientCharacter (S : TauCeti.HopfIdeal K H) (χ : Additive (GroupLike K H)) :
    Character S := sorry

theorem restrictAmbientCharacter_coe (S : TauCeti.HopfIdeal K H) (χ : Additive (GroupLike K H)) :
    (restrictAmbientCharacter S χ).toMul.val = Ideal.Quotient.mk S.toIdeal χ.toMul.val := sorry

/-- Evaluation of a G-character at a rational point, with its algebraic unit witness. -/
def ambientCharacterValue (χ : Additive (GroupLike K H)) (g : WithConv (H →ₐ[K] K)) : Kˣ :=
  Units.mk0 (g.ofConv χ.toMul.val) (by sorry)

-- Test BruhatTits.GeometricRoots.adjoint_one
example (d : Derivation K H (Bialgebra.CounitAlgebra K H (AlgebraicClosure K))) :
    adjoint 1 d = d := by
  rw [adjoint, AlgebraicRelativeRoots.adjoint, map_one, ← Derivation.adRepresentation_apply, map_one, Module.End.one_apply]

-- Test BruhatTits.GeometricRoots.contracts_one
example (l : H →ₐc[K] LaurentPolynomial K) (R : Type u) [CommRing R] [Algebra K R] :
    (1 : WithConv (H →ₐ[K] R)) ∈ TauCeti.Cocharacter.unipotent R l :=
  (TauCeti.Cocharacter.unipotent R l).one_mem

-- Test BruhatTits.GeometricRoots.characterValue_zero
example (S : TauCeti.HopfIdeal K H) (R : Type u) [CommRing R] [Algebra K R]
    (t : subgroupPoints S R) : characterValue S 0 R t = 1 := sorry

-- Test BruhatTits.GeometricRoots.characterValue_add
example (S : TauCeti.HopfIdeal K H) (χ ψ : Character S) (R : Type u) [CommRing R] [Algebra K R]
    (t : subgroupPoints S R) :
    characterValue S (χ + ψ) R t = characterValue S χ R t * characterValue S ψ R t := sorry

-- Test BruhatTits.GeometricRoots.characterValue_identity
example (S : TauCeti.HopfIdeal K H) (χ : Character S) (R : Type u) [CommRing R] [Algebra K R] :
    characterValue S χ R 1 = 1 := sorry

-- Test BruhatTits.GeometricRoots.root_augmentation
example : IsEmpty (Root (TauCeti.HopfIdeal.augmentation K H)) := sorry

-- Test BruhatTits.GeometricRoots.root_commutative
example [_root_.Coalgebra.IsCocomm K H] (S : TauCeti.HopfIdeal K H)
    (hS : TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H S)) :
    IsEmpty (Root S) := sorry

-- Test BruhatTits.GeometricRoots.root_nonreduced
example (p : ℕ) [Fact p.Prime] :
    ∃ (H' : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} (ZMod p)) (S : TauCeti.HopfIdeal (ZMod p) H'),
      _root_.Coalgebra.IsCocomm (ZMod p) H' ∧ Nonempty (Root S) := sorry

-- Test BruhatTits.GeometricRoots.coroot_double_pairing
example (S : TauCeti.HopfIdeal K H) (a : Root S)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    coroot S a (a.val + a.val) = 4 := by
  rw [map_add, (coroot_reflection S a hH hS).1]
  norm_num

-- Test BruhatTits.GeometricRoots.coroot_half_pairing
example (S : TauCeti.HopfIdeal K H) (a b : Root S) (hab : b.val = a.val + a.val)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    coroot S b a.val = 1 := by
  have h := (coroot_reflection S b hH hS).1
  rw [hab, map_add] at h
  omega

-- Test BruhatTits.GeometricRoots.characterLinear_coroot
example (S : TauCeti.HopfIdeal K H) (a : Root S)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    characterLinear S a.val ((1 : ℝ) ⊗ₜ[ℤ] coroot S a) = 2 := by
  rw [characterLinear_tmul, (coroot_reflection S a hH hS).1]
  norm_num

-- Test BruhatTits.GeometricRoots.characterLinear_zero
example (S : TauCeti.HopfIdeal K H) : characterLinear S 0 = 0 := by
  refine TensorProduct.AlgebraTensorModule.curry_injective ?_
  ext μ
  simp [characterLinear_tmul]

-- Test BruhatTits.GeometricRoots.centralizer_augmentation
example : centralizer (TauCeti.HopfIdeal.augmentation K H) = ⊤ := by
  refine eq_top_iff.2 fun g _ R _ _ t => ?_
  have ht : t.val = 1 := TauCeti.CommHopfAlgCat.eq_one_of_mem_quotientPointsSubgroup_augmentation
    H.obj (CommAlgCat.of K R) t.property
  rw [ht]
  exact Commute.one_right _

-- Test BruhatTits.GeometricRoots.normalizer_bot
example : normalizer (⊥ : TauCeti.HopfIdeal K H) = ⊤ := sorry

-- Test BruhatTits.GeometricRoots.centralizer_le_normalizer
example (S : TauCeti.HopfIdeal K H) : centralizer S ≤ normalizer S := sorry

-- Test BruhatTits.GeometricRoots.centralizerIdeal_augmentation
example : centralizerIdeal (TauCeti.HopfIdeal.augmentation K H) = ⊥ := sorry

-- Test BruhatTits.GeometricRoots.geometricCharacterValue_zero
example (S : TauCeti.HopfIdeal K H) (t : subgroupPoints S (AlgebraicClosure K)) :
    geometricCharacterValue S 0 t = 1 := sorry

-- Test BruhatTits.GeometricRoots.geometricRoot_augmentation
example : IsEmpty (GeometricRoot (TauCeti.HopfIdeal.augmentation K H)) := sorry

-- Test BruhatTits.GeometricRoots.geometricCoroot_double_pairing
example (S : TauCeti.HopfIdeal K H) (a : GeometricRoot S)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    geometricCoroot S a (a.val + a.val) = 4 := by
  rw [map_add, (geometricCoroot_reflection S a hH hS).1]
  norm_num

-- Test BruhatTits.GeometricRoots.ambientCharacterValue_one
example (χ : Additive (GroupLike K H)) : ambientCharacterValue χ 1 = 1 := sorry

-- Test BruhatTits.GeometricRoots.restrictAmbientCharacter_zero
example (S : TauCeti.HopfIdeal K H) : restrictAmbientCharacter S 0 = 0 := sorry

-- Test BruhatTits.GeometricRoots.adjoint_mul
/- `adjoint` is a left action of `G(K̄)`: `Ad(gh) = Ad(g) ∘ Ad(h)`. -/
example (g h : WithConv (H →ₐ[K] AlgebraicClosure K))
    (d : Derivation K H (Bialgebra.CounitAlgebra K H (AlgebraicClosure K))) :
    adjoint (g * h) d = adjoint g (adjoint h d) := by
  simp only [adjoint, AlgebraicRelativeRoots.adjoint, map_mul]
  rw [← Derivation.adRepresentation_apply, ← Derivation.adRepresentation_apply,
    ← Derivation.adRepresentation_apply, map_mul, Module.End.mul_apply]

-- Test BruhatTits.GeometricRoots.adjoint_commutative
/- For a commutative group (cocommutative `H`) conjugation, hence the adjoint action, is
trivial. -/
example [_root_.Coalgebra.IsCocomm K H] (g : WithConv (H →ₐ[K] AlgebraicClosure K))
    (d : Derivation K H (Bialgebra.CounitAlgebra K H (AlgebraicClosure K))) :
    adjoint g d = d := by
  ext a
  rw [adjoint, Derivation.adDerivation_apply, mul_comm (WithConv.toConv _) (WithConv.toConv _),
    ← mul_assoc, ← AlgHom.toLinearMap_convMul]
  simp

-- Test BruhatTits.GeometricRoots.contracts_mul
example (l : H →ₐc[K] LaurentPolynomial K) (R : Type u) [CommRing R] [Algebra K R]
    (g h : WithConv (H →ₐ[K] R)) (hg : g ∈ TauCeti.Cocharacter.unipotent R l)
    (hh : h ∈ TauCeti.Cocharacter.unipotent R l) :
    g * h ∈ TauCeti.Cocharacter.unipotent R l :=
  (TauCeti.Cocharacter.unipotent R l).mul_mem hg hh

-- Test BruhatTits.GeometricRoots.contracts_commutative
example [_root_.Coalgebra.IsCocomm K H] (l : H →ₐc[K] LaurentPolynomial K) (R : Type u)
    [CommRing R] [Algebra K R] (g : WithConv (H →ₐ[K] R))
    (hg : g ∈ TauCeti.Cocharacter.unipotent R l) : g = 1 := by
  simpa [TauCeti.Cocharacter.unipotent_eq_bot] using hg

-- Test BruhatTits.GeometricRoots.geometricCharacterValue_add
example (S : TauCeti.HopfIdeal K H) (χ ψ : GeometricCharacter S)
    (t : subgroupPoints S (AlgebraicClosure K)) :
    geometricCharacterValue S (χ + ψ) t =
      geometricCharacterValue S χ t * geometricCharacterValue S ψ t := by
  ext
  rw [Units.val_mul, geometricCharacterValue_coe, geometricCharacterValue_coe,
    geometricCharacterValue_coe, toMul_add, GroupLike.val_mul, map_mul]

-- Test BruhatTits.GeometricRoots.geometricCharacterValue_identity
example (S : TauCeti.HopfIdeal K H) (χ : GeometricCharacter S) :
    geometricCharacterValue S χ 1 = 1 := sorry

-- Test BruhatTits.GeometricRoots.geometricRoot_commutative
/- A torus of a commutative group has no absolute roots: the adjoint action is trivial, and a
character equal to `1` on all `K̄`-points of a torus is trivial. -/
example [_root_.Coalgebra.IsCocomm K H] (S : TauCeti.HopfIdeal K H)
    (hS : TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H S)) :
    IsEmpty (GeometricRoot S) := sorry

-- Test BruhatTits.GeometricRoots.geometricCoroot_ne_zero
/- (non-example) The zero cocharacter is not a coroot: it pairs to `0`, not `2`, with the root. -/
example (S : TauCeti.HopfIdeal K H) (a : GeometricRoot S)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    geometricCoroot S a ≠ 0 := by
  intro h
  have h2 := (geometricCoroot_reflection S a hH hS).1
  rw [h, AddMonoidHom.zero_apply] at h2
  norm_num at h2

-- Test BruhatTits.GeometricRoots.geometricEvaluation_one
/- At the identity point, evaluation is the counit: `r ⊗ a ↦ r ε(a)`. -/
example (S : TauCeti.HopfIdeal K H) (r : AlgebraicClosure K) (a : H) :
    geometricEvaluation S 1 (r ⊗ₜ[K] Ideal.Quotient.mk S.toIdeal a) =
      r * algebraMap K (AlgebraicClosure K) (_root_.CoalgebraStruct.counit (R := K) a) := by
  rw [geometricEvaluation_tmul]
  rfl

-- Test BruhatTits.GeometricRoots.geometricEvaluation_unit
example (S : TauCeti.HopfIdeal K H) (t : subgroupPoints S (AlgebraicClosure K))
    (r : AlgebraicClosure K) : geometricEvaluation S t (r ⊗ₜ[K] 1) = r := by
  have h := geometricEvaluation_tmul S t r 1
  rw [map_one, map_one, mul_one] at h
  exact h

-- Test BruhatTits.GeometricRoots.geometricEvaluation_character
/- On a rational character, geometric evaluation agrees with `characterValue`. -/
example (S : TauCeti.HopfIdeal K H) (t : subgroupPoints S (AlgebraicClosure K))
    (χ : Character S) :
    geometricEvaluation S t (1 ⊗ₜ[K] (χ.toMul : H ⧸ S.toIdeal)) =
      (characterValue S χ (AlgebraicClosure K) t : AlgebraicClosure K) := by
  obtain ⟨a, ha⟩ := Ideal.Quotient.mk_surjective (χ.toMul : H ⧸ S.toIdeal)
  rw [← ha, geometricEvaluation_tmul, one_mul, characterValue_coe S χ _ t a ha]

-- Test BruhatTits.GeometricRoots.restrictAmbientCharacter_value
/- On rational points of `S`, the restriction of a character of `G` takes the value of that
character. -/
example (S : TauCeti.HopfIdeal K H) (χ : Additive (GroupLike K H)) (t : subgroupPoints S K) :
    characterValue S (restrictAmbientCharacter S χ) K t = ambientCharacterValue χ t.val := by
  ext
  rw [characterValue_coe S _ K t χ.toMul.val (restrictAmbientCharacter_coe S χ).symm]
  rfl

-- Test BruhatTits.GeometricRoots.restrictCharacter_ambient
/- Restriction is transitive through the centralizer: for a commutative `S`, restricting a
character of `G` to `Z_G(S)` and then to `S` is restricting it to `S`. -/
example (S : TauCeti.HopfIdeal K H)
    (hcomm : ∀ (R : Type u) [CommRing R] [Algebra K R] (t t' : subgroupPoints S R),
      Commute t.val t'.val) (χ : Additive (GroupLike K H)) :
    restrictCharacter S (restrictAmbientCharacter (centralizerIdeal S) χ) =
      restrictAmbientCharacter S χ := sorry

-- Test BruhatTits.GeometricRoots.ambientCharacterValue_mul
/- A character of `G` is multiplicative on rational points (its comultiplication is `χ ⊗ χ`). -/
example (χ : Additive (GroupLike K H)) (g h : WithConv (H →ₐ[K] K)) :
    ambientCharacterValue χ (g * h) = ambientCharacterValue χ g * ambientCharacterValue χ h := by
  ext
  simp only [ambientCharacterValue, Units.val_mk0, Units.val_mul]
  rw [AlgHom.convMul_apply, χ.toMul.isGroupLikeElem_val.comul_eq_tmul_self,
    Algebra.TensorProduct.lift_tmul]

-- Test BruhatTits.GeometricRoots.rootSubgroup_double_le
/- `U_(2a) ⊆ U_(a)`: as Hopf ideals, the ideal of `U_(a)` is contained in that of `U_(2a)`. -/
example (S : TauCeti.HopfIdeal K H) (a b : Root S) (hab : b.val = a.val + a.val)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    rootSubgroup S a ≤ rootSubgroup S b := sorry

-- Test BruhatTits.GeometricRoots.rootSubgroup_unipotent
/- `U_(a)` is a smooth unipotent group. -/
example (S : TauCeti.HopfIdeal K H) (a : Root S)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (hS : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) S) :
    TauCeti.smoothUnipotentCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (rootSubgroup S a)) := sorry

end GeometricRoots

/-- The algebraic input is a reductive group with a chosen maximal split subgroup scheme.
The relative root system and its point subgroups are constructed from this input. -/
structure LocalRootData (K : Type u) [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  reductive : TauCeti.reductiveCommHopfAlgProperty K H
  splitTorus : TauCeti.HopfIdeal K H
  maximalSplit : Minimal (fun I : TauCeti.HopfIdeal K H =>
    TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) splitTorus

/-- A realization of the relative roots on the real cocharacter space, with the evaluation
pairing and the algebraic root subgroups. BT I 6.1.3; BT II 4.1.19, 5.1.2. -/
structure RelativeRootRealization (K : Type u) [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (S : TauCeti.HopfIdeal K H) where
  ι : Type u
  [fintype_ι : Fintype ι]
  rootIndex : ι ≃ GeometricRoots.Root S
  V : Type u
  [addCommGroup_V : AddCommGroup V]
  [module_V : Module ℝ V]
  [finiteDimensional_V : FiniteDimensional ℝ V]
  cocharacterSpace : V ≃ₗ[ℝ] (ℝ ⊗[ℤ] GeometricRoots.Cocharacter S)
  Φ : RootPairing ι ℝ (Module.Dual ℝ V) V
  pairing_eq : ∀ (f : Module.Dual ℝ V) (v : V), Φ.toLinearMap f v = f v
  root_eq : ∀ i v, Φ.toLinearMap (Φ.root i) v =
    GeometricRoots.characterLinear S (rootIndex i).val (cocharacterSpace v)
  coroot_eq : ∀ i, cocharacterSpace (Φ.coroot i) =
    (1 : ℝ) ⊗ₜ[ℤ] GeometricRoots.coroot S (rootIndex i)
  rootDatum : RootDatum (WithConv (H →ₐ[K] K)) Φ
  /-- The rational points `N(K)` of the normalizer of the maximal split torus. -/
  normalizer : Subgroup (WithConv (H →ₐ[K] K))
  T_le_normalizer : rootDatum.T ≤ normalizer
  centralizer_eq : rootDatum.T = GeometricRoots.centralizer S
  normalizer_eq : normalizer = GeometricRoots.normalizer S
  rootSubgroup_eq : ∀ i, rootDatum.U i =
    subgroupPoints (GeometricRoots.rootSubgroup S (rootIndex i)) K


attribute [instance] RelativeRootRealization.fintype_ι
  RelativeRootRealization.addCommGroup_V RelativeRootRealization.module_V
  RelativeRootRealization.finiteDimensional_V

/-- Relative root data induced by the chosen maximal split torus. -/
def LocalRootData.realization {K : Type u} [Field K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H) :
    RelativeRootRealization K H D.splitTorus := sorry

namespace LocalRootData
variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H)
abbrev ι := D.realization.ι
abbrev V := D.realization.V
instance fintype_ι : Fintype D.ι := D.realization.fintype_ι
instance addCommGroup_V : AddCommGroup D.V := D.realization.addCommGroup_V
instance module_V : Module ℝ D.V := D.realization.module_V
instance finiteDimensional_V : FiniteDimensional ℝ D.V := D.realization.finiteDimensional_V
abbrev rootIndex := D.realization.rootIndex
abbrev cocharacterSpace := D.realization.cocharacterSpace
abbrev Φ := D.realization.Φ
abbrev rootDatum := D.realization.rootDatum
abbrev normalizer := D.realization.normalizer
abbrev T_le_normalizer := D.realization.T_le_normalizer
abbrev centralizer_eq := D.realization.centralizer_eq
abbrev normalizer_eq := D.realization.normalizer_eq
abbrev rootSubgroup_eq := D.realization.rootSubgroup_eq
abbrev root_eq := D.realization.root_eq
abbrev coroot_eq := D.realization.coroot_eq
abbrev pairing_eq := D.realization.pairing_eq
abbrev Points : Type u := WithConv (H →ₐ[K] K)
end LocalRootData

/-- Existence of a maximal split torus in a connected reductive group. -/
theorem exists_localRootData {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hH : TauCeti.reductiveCommHopfAlgProperty K H) : Nonempty (LocalRootData K H) := sorry

-- Test LocalRootData.cocharacter_dimension
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) [Subsingleton (GeometricRoots.Cocharacter D.splitTorus)] :
    Subsingleton D.V := by
  have : Subsingleton (ℝ ⊗[ℤ] GeometricRoots.Cocharacter D.splitTorus) := inferInstance
  exact D.cocharacterSpace.injective.subsingleton

-- Test LocalRootData.rank_zero_no_roots
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) [Subsingleton D.V] : IsEmpty D.ι := by
  refine ⟨fun i => ?_⟩
  have h := D.Φ.root_coroot_two i
  rw [Subsingleton.elim (D.Φ.coroot i) 0, map_zero] at h
  norm_num at h

-- Test LocalRootData.roots_are_geometric_weights
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (i : D.ι) : (D.rootIndex i).val ≠ 0 := (D.rootIndex i).property.1

-- Test LocalRootData.evaluation_pairing
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (i : D.ι) (v : D.V) :
    D.Φ.root i v = GeometricRoots.characterLinear D.splitTorus
      (D.rootIndex i).val (D.cocharacterSpace v) := by
  rw [← D.pairing_eq, D.root_eq]

-- Test RelativeRootRealization.coroot_pairing
/- The fields agree with Mathlib's normalization `⟨a, a^∨⟩ = 2` of a root pairing: for every
realization, `a(1 ⊗ a^∨) = 2` with `a^∨ = GeometricRoots.coroot`. -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    {S : TauCeti.HopfIdeal K H} (R : RelativeRootRealization K H S) (i : R.ι) :
    GeometricRoots.characterLinear S (R.rootIndex i).val
      ((1 : ℝ) ⊗ₜ[ℤ] GeometricRoots.coroot S (R.rootIndex i)) = 2 := by
  rw [← R.coroot_eq, ← R.root_eq]
  exact R.Φ.root_coroot_two i

-- Test RelativeRootRealization.rootSubgroup_ne_augmentation
/- (non-example) A root subgroup is never the trivial subgroup: its rational points form the
nontrivial group `U_a` of the root datum (DR1). -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    {S : TauCeti.HopfIdeal K H} (R : RelativeRootRealization K H S) (i : R.ι) :
    GeometricRoots.rootSubgroup S (R.rootIndex i) ≠ TauCeti.HopfIdeal.augmentation K H := by
  intro h
  apply R.rootDatum.U_ne_bot i
  rw [R.rootSubgroup_eq i, h, eq_bot_iff]
  intro g hg
  exact Subgroup.mem_bot.2
    (TauCeti.CommHopfAlgCat.eq_one_of_mem_quotientPointsSubgroup_augmentation H.obj
      (CommAlgCat.of K K) hg)

-- Test RelativeRootRealization.torus_trivial_subgroup
/- (degenerate case) For `S` the trivial subgroup, the torus `T = Z_G(S)(K)` of the datum is all of
`G(K)`. -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (R : RelativeRootRealization K H (TauCeti.HopfIdeal.augmentation K H)) :
    R.rootDatum.T = ⊤ := by
  rw [R.centralizer_eq]
  refine eq_top_iff.2 fun g _ R' _ _ t => ?_
  have ht : t.val = 1 := TauCeti.CommHopfAlgCat.eq_one_of_mem_quotientPointsSubgroup_augmentation
    H.obj (CommAlgCat.of K R') t.property
  rw [ht]
  exact Commute.one_right _

-- Test LocalRootData.realization_anisotropic_no_roots
/- For an anisotropic group the realization has no relative roots. -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (hS : D.splitTorus = TauCeti.HopfIdeal.augmentation K H) :
    IsEmpty D.realization.ι := sorry

-- Test LocalRootData.realization_normalizer_anisotropic
/- For an anisotropic group `N(K) = G(K)`: every point normalizes the trivial subgroup. -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (hS : D.splitTorus = TauCeti.HopfIdeal.augmentation K H) :
    D.realization.normalizer = ⊤ := by
  rw [D.realization.normalizer_eq, hS, eq_top_iff]
  intro g _ R _ _
  have hbot : subgroupPoints (TauCeti.HopfIdeal.augmentation K H) R = ⊥ := by
    rw [eq_bot_iff]
    intro x hx
    exact Subgroup.mem_bot.2
      (TauCeti.CommHopfAlgCat.eq_one_of_mem_quotientPointsSubgroup_augmentation H.obj
        (CommAlgCat.of K R) hx)
  change (subgroupPoints (TauCeti.HopfIdeal.augmentation K H) R).map _ =
    subgroupPoints (TauCeti.HopfIdeal.augmentation K H) R
  rw [hbot, Subgroup.map_bot]

/-- The absolute root datum of a connected reductive `K`-group with its Galois action (the object
of the Reductive groups roadmap, layer 7): characters and cocharacters of a maximal torus over an
algebraic closure, the root datum, and the action of the absolute Galois group by automorphisms. -/
structure AbsoluteRootData (K : Type u) [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) where
  reductive : TauCeti.reductiveCommHopfAlgProperty K H
  torusIdeal : TauCeti.HopfIdeal K H
  /-- The criterion of the pinned `TauCeti.HopfIdeal.IsMaximalTorus`
  (`TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean`), stated for a finite-type object. -/
  maximalTorus : Minimal (fun I : TauCeti.HopfIdeal K H =>
    TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) torusIdeal
  ι : Type u
  [fintype_ι : Fintype ι]
  X : Type u
  Y : Type u
  [addCommGroup_X : AddCommGroup X]
  [addCommGroup_Y : AddCommGroup Y]
  [finite_X : Module.Finite ℤ X]
  [finite_Y : Module.Finite ℤ Y]
  characterEquiv : X ≃+ GeometricRoots.GeometricCharacter torusIdeal
  cocharacterEquiv : Y ≃+ (GeometricRoots.GeometricCharacter torusIdeal →+ ℤ)
  rootIndex : ι ≃ GeometricRoots.GeometricRoot torusIdeal
  Ψ : RootPairing ι ℤ X Y
  root_eq : ∀ i, characterEquiv (Ψ.root i) = (rootIndex i).val
  coroot_eq : ∀ i, cocharacterEquiv (Ψ.coroot i) =
    GeometricRoots.geometricCoroot torusIdeal (rootIndex i)
  pairing_eq : ∀ x y, Ψ.toLinearMap x y = cocharacterEquiv y (characterEquiv x)
  [isReduced : Ψ.IsReduced]
  /-- The Galois action `μ_G` on the based root datum, through root-datum automorphisms. -/
  galoisAction : Field.absoluteGaloisGroup K →* RootPairing.Aut Ψ
  /-- The based action is the geometric action corrected by a Weyl element. -/
  galoisAction_geometric : ∀ γ, ∃ w : Ψ.weylGroup, ∀ x,
    characterEquiv ((galoisAction γ).weightEquiv x) =
      γ • characterEquiv ((w : RootPairing.Aut Ψ).weightEquiv x)
  base : Ψ.Base
  galoisAction_base : ∀ γ i, i ∈ base.support ↔ (galoisAction γ).indexEquiv i ∈ base.support
  splittingField : IntermediateField K (AlgebraicClosure K)
  [splittingField_finite : FiniteDimensional K splittingField]
  [splittingField_galois : IsGalois K splittingField]
  splittingAction : (splittingField ≃ₐ[K] splittingField) →* RootPairing.Aut Ψ
  galoisAction_factor : ∀ γ, galoisAction γ = splittingAction
    (AlgEquiv.restrictNormalHom splittingField (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from γ))

attribute [instance] AbsoluteRootData.fintype_ι AbsoluteRootData.addCommGroup_X
  AbsoluteRootData.addCommGroup_Y AbsoluteRootData.finite_X AbsoluteRootData.finite_Y
  AbsoluteRootData.isReduced

-- Test AbsoluteRootData.character_rank_zero
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) [Subsingleton (GeometricRoots.GeometricCharacter D.torusIdeal)] :
    Subsingleton D.X := D.characterEquiv.injective.subsingleton

-- Test AbsoluteRootData.cocharacter_rank_zero
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) [Subsingleton (GeometricRoots.GeometricCharacter D.torusIdeal)] :
    Subsingleton D.Y := by
  have : Subsingleton (GeometricRoots.GeometricCharacter D.torusIdeal →+ ℤ) :=
    ⟨fun f g => AddMonoidHom.ext fun x => by rw [Subsingleton.elim x 0, map_zero, map_zero]⟩
  exact D.cocharacterEquiv.injective.subsingleton

-- Test AbsoluteRootData.geometricCoroot_pairing
/- The root datum `Ψ` agrees with `geometricCoroot`: transported along the identifications,
Mathlib's `⟨a, a^∨⟩ = 2` is `geometricCoroot a a = 2`. -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) (i : D.ι) :
    GeometricRoots.geometricCoroot D.torusIdeal (D.rootIndex i) (D.rootIndex i).val = 2 := by
  rw [← D.coroot_eq, ← D.root_eq, ← D.pairing_eq]
  exact D.Ψ.root_coroot_two i

/-- The algebraic fundamental group `π₁(G) = X_*(T)/Q^∨` (Borovoi). -/
def AlgebraicFundamentalGroup {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) : Type u :=
  D.Y ⧸ Submodule.span ℤ (Set.range D.Ψ.coroot)

instance {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : AbsoluteRootData K H) : AddCommGroup (AlgebraicFundamentalGroup D) :=
  inferInstanceAs (AddCommGroup (D.Y ⧸ Submodule.span ℤ (Set.range D.Ψ.coroot)))

end BruhatTits

namespace BruhatTits
open ValuativeRel

/-- Compatibility of a valuation of the rational root datum with the valuation of the field:
`φ_a(z u z⁻¹) = φ_a(u) + ω(a(z))`, so conjugation by `z ∈ Z(K)` carries `U_{a,r}` onto
`U_{a, r + ω(a(z))} = U_{a, r − ⟨a, v(z)⟩}`, where `v` is the valuation homomorphism of the minimal
Levi, normalized by `⟨a, v(z)⟩ = −ω(a(z))` (Bruhat–Tits II, 4.2.7–4.2.8, p. 91, and 5.1.22,
pp. 154–155). (For `SL₂` and `z = diag(ϖ, ϖ⁻¹)`: `⟨a, v(z)⟩ = −2` and `z U_{a,r} z⁻¹ = U_{a,r+2}`.) -/
def Valuation.IsCompatible {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (v : D.rootDatum.T →* Multiplicative D.V) (φ : Valuation D.rootDatum) : Prop :=
  ∀ (i : D.ι) (z : D.rootDatum.T) (r : ℝ),
    (φ.filtration i r).map (MulAut.conj (z : WithConv (H →ₐ[K] K))).toMonoidHom =
      φ.filtration i (r - D.Φ.toLinearMap (D.Φ.root i) (Multiplicative.toAdd (v z)))

section TorusValuation

variable {K : Type u} [Field K] [ValuativeRel K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H)

/-- A minimal-Levi point as a point of the scheme-theoretic centralizer: `Z(K)` is the group of
`K`-points of `Z_G(S)` (`GeometricRoots.centralizerIdeal_points`). -/
def minimalLeviPoint (z : D.rootDatum.T) :
    subgroupPoints (GeometricRoots.centralizerIdeal D.splitTorus) K :=
  ⟨z.val, by rw [GeometricRoots.centralizerIdeal_points, ← D.centralizer_eq]; exact z.property⟩

omit [ValuativeRel K] in
theorem minimalLeviPoint_val (z : D.rootDatum.T) : (minimalLeviPoint D z).val = z.val := rfl

-- Test BruhatTits.minimalLeviPoint_one
/- The identity of `Z(K)` is the identity point of the centralizer. -/
omit [ValuativeRel K] in
example : minimalLeviPoint D 1 = 1 := Subtype.ext rfl

/-- The valuation homomorphism `v : Z(K) → V` of the minimal Levi, characterized by
`⟨χ, v(z)⟩ = -ω(χ(z))` for the rational characters `χ` of `Z`
(`torusValuationMap_apply_character`). The field valuation is nontrivial, discrete and of rank
one, so that `ω = normalizedOrder` is `ℤ`-valued. -/
def torusValuationMap [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] : D.rootDatum.T →* Multiplicative D.V := sorry

/-- The normalized additive valuation `ω : Kˣ → ℤ`: surjective, and nonnegative exactly on the
nonzero elements of `𝒪[K]` (`normalizedOrder_spec`), so that `ω(ϖ) = 1` at a uniformizer. For a
nonarchimedean local field it is `TauCeti.normalizedValuation` (`normalizedOrder_local`); this
declaration uses only the valuation. Rank one is needed: Mathlib's `ValuativeRel.IsDiscrete` also
holds for a valuation with value group `ℤ × ℤ` ordered lexicographically, which admits no
homomorphism to `ℤ` with these two properties. -/
def normalizedOrder [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] : Kˣ →* Multiplicative ℤ := sorry

/-- Positive normalization, including the kernel and the generator of the value group. -/
theorem normalizedOrder_spec [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] :
    Function.Surjective (normalizedOrder (K := K)) ∧
      ∀ x : Kˣ, 0 ≤ Multiplicative.toAdd (normalizedOrder (K := K) x) ↔ valuation K (x : K) ≤ 1 :=
  sorry

variable [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]

/-- Compatibility with the pinned local-field normalization. -/
theorem normalizedOrder_local [TopologicalSpace K] (_hlocal : IsNonarchimedeanLocalField K) :
    normalizedOrder (K := K) = TauCeti.normalizedValuation K := sorry

-- Test BruhatTits.normalizedOrder_uniformizer_two_terms
/- An element of largest valuation `< 1` has order `1` and its square has order `2`; the opposite
sign or another normalization of `ω` fails one of the two values. -/
example (π : Kˣ) (hπ : valuation K (π : K) < 1)
    (hmax : ∀ x : Kˣ, valuation K (x : K) < 1 → valuation K (x : K) ≤ valuation K (π : K)) :
    normalizedOrder (K := K) π = Multiplicative.ofAdd 1 ∧
      normalizedOrder (K := K) (π ^ 2) = Multiplicative.ofAdd 2 := sorry

-- Test BruhatTits.normalizedOrder_units
/- The units of `𝒪[K]` have order zero. -/
example (x : Kˣ) (hx : valuation K (x : K) = 1) : normalizedOrder (K := K) x = 1 := by
  obtain ⟨-, h⟩ := normalizedOrder_spec (K := K)
  have h1 := (h x).2 hx.le
  have h2 := (h x⁻¹).2 (by rw [Units.val_inv_eq_inv_val, map_inv₀, hx, inv_one])
  rw [map_inv, toAdd_inv] at h2
  apply Multiplicative.toAdd.injective
  rw [toAdd_one]
  omega

/-- BT II 4.2.5–7, pp. 90–91, 4.2.16(3), p. 94, and 5.1.22, pp. 154–155.
The equality is for rational characters of the actual minimal Levi. Relative roots only
extend rationally and need not have integral values. -/
theorem torusValuationMap_apply_character
    (χ : GeometricRoots.Character (GeometricRoots.centralizerIdeal D.splitTorus))
    (z : D.rootDatum.T) :
    GeometricRoots.characterLinear D.splitTorus (GeometricRoots.restrictCharacter D.splitTorus χ)
      (D.cocharacterSpace (Multiplicative.toAdd (torusValuationMap D z))) =
    -(Multiplicative.toAdd (normalizedOrder (K := K)
      (GeometricRoots.characterValue _ χ K (minimalLeviPoint D z))) : ℤ) := sorry

/-- The kernel `Z(K)^1 = ker v` of the valuation homomorphism. For `K` henselian and `Z` a torus it
is the maximal bounded subgroup of `Z(K)` (BT II 4.4.2(ii), p. 107); over a non-henselian field it
can be unbounded, e.g. for the norm-one torus of `ℚ(i)/ℚ` with the `5`-adic valuation. -/
def boundedPart : Subgroup D.rootDatum.T := (torusValuationMap D).ker

open scoped PointTopology in
theorem boundedPart_isCompact [TopologicalSpace K] (_hlocal : IsNonarchimedeanLocalField K) :
    IsCompact (((boundedPart D).map D.rootDatum.T.subtype : Subgroup _) :
      Set (WithConv ((H : Type u) →ₐ[K] K))) := sorry

/-- The translation lattice `Λ = v(Z(K))`. -/
def translationLattice : Set D.V :=
  Set.range fun z => Multiplicative.toAdd (torusValuationMap D z)

theorem translationLattice_span : Submodule.span ℝ (translationLattice D) = ⊤ := sorry

-- Test BruhatTits.translationLattice_integral
/- `Λ` is integral: every rational character of the minimal Levi takes an integer value on it. -/
example (χ : GeometricRoots.Character (GeometricRoots.centralizerIdeal D.splitTorus)) (t : D.V)
    (ht : t ∈ translationLattice D) :
    ∃ n : ℤ, GeometricRoots.characterLinear D.splitTorus
      (GeometricRoots.restrictCharacter D.splitTorus χ) (D.cocharacterSpace t) = n := by
  obtain ⟨z, rfl⟩ := ht
  exact ⟨-Multiplicative.toAdd (normalizedOrder (K := K)
      (GeometricRoots.characterValue _ χ K (minimalLeviPoint D z))),
    by rw [torusValuationMap_apply_character, Int.cast_neg]⟩

-- Test BruhatTits.translationLattice_anisotropic
/- For `S = 1` (so `V = 0`) the lattice is `{0}`. -/
example [Subsingleton D.V] : translationLattice D = {0} :=
  Set.eq_singleton_iff_unique_mem.2
    ⟨⟨1, by simp only [map_one, toAdd_one]⟩, fun t _ => Subsingleton.elim t 0⟩

-- Test BruhatTits.translationLattice_ne_univ
/- (non-example) For `V ≠ 0`, `Λ` is a proper subset of `V`: a rational character of the minimal
Levi that is nonzero on `V` takes non-integral values on `V` but only integral values on `Λ`. -/
example [Nontrivial D.V] : translationLattice D ≠ Set.univ := sorry

/-- Conjugation by `n ∈ N(K)` transports `v` through the Weyl image of `n`: one Weyl element `w`,
depending on `n` only, gives `v(n z n⁻¹) = w · v(z)` for every `z` (BT II 4.2.7, p. 91, and
5.1.22, pp. 154–155, with BT I 6.2.10(i), p. 122). -/
theorem torusValuationMap_conj (n : D.normalizer) :
    ∃ w : D.Φ.weylGroup, ∀ (z : D.rootDatum.T)
      (hz : (n : WithConv ((H : Type u) →ₐ[K] K)) * (z : WithConv ((H : Type u) →ₐ[K] K)) *
        (n : WithConv ((H : Type u) →ₐ[K] K))⁻¹ ∈ D.rootDatum.T),
      Multiplicative.toAdd (torusValuationMap D ⟨_, hz⟩) =
        ((w : RootPairing.Aut D.Φ).coweightEquiv).symm
          (Multiplicative.toAdd (torusValuationMap D z)) :=
  sorry

-- Test BruhatTits.torusValuationMap_split
/- Two rational characters with values `ϖ` and `1` at `z` (the coordinates of `t = (ϖ, 1)` in
`S = G_m²`) give the coordinates `-1` and `0` of `v(z)`. -/
example (χ₁ χ₂ : GeometricRoots.Character (GeometricRoots.centralizerIdeal D.splitTorus))
    (z : D.rootDatum.T) (π : Kˣ) (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (h₁ : GeometricRoots.characterValue _ χ₁ K (minimalLeviPoint D z) = π)
    (h₂ : GeometricRoots.characterValue _ χ₂ K (minimalLeviPoint D z) = 1) :
    GeometricRoots.characterLinear D.splitTorus (GeometricRoots.restrictCharacter D.splitTorus χ₁)
        (D.cocharacterSpace (Multiplicative.toAdd (torusValuationMap D z))) = -1 ∧
      GeometricRoots.characterLinear D.splitTorus
        (GeometricRoots.restrictCharacter D.splitTorus χ₂)
        (D.cocharacterSpace (Multiplicative.toAdd (torusValuationMap D z))) = 0 := by
  refine ⟨?_, ?_⟩
  · rw [torusValuationMap_apply_character, h₁, hπ]
    simp
  · rw [torusValuationMap_apply_character, h₂]
    simp

-- Test BruhatTits.torusValuationMap_sign_two_terms
/- The sign convention `⟨χ, v(z)⟩ = -ω(χ(z))` on two terms: if `χ(z) = ϖ`, then `⟨χ, v(z)⟩ = -1`
and `⟨χ, v(z²)⟩ = -2`; the opposite convention gives `1` and `2`. -/
example (χ : GeometricRoots.Character (GeometricRoots.centralizerIdeal D.splitTorus))
    (z : D.rootDatum.T) (π : Kˣ) (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (h : GeometricRoots.characterValue _ χ K (minimalLeviPoint D z) = π) :
    GeometricRoots.characterLinear D.splitTorus (GeometricRoots.restrictCharacter D.splitTorus χ)
        (D.cocharacterSpace (Multiplicative.toAdd (torusValuationMap D z))) = -1 ∧
      GeometricRoots.characterLinear D.splitTorus
        (GeometricRoots.restrictCharacter D.splitTorus χ)
        (D.cocharacterSpace (Multiplicative.toAdd (torusValuationMap D (z ^ 2)))) = -2 := by
  have h1 : GeometricRoots.characterLinear D.splitTorus
      (GeometricRoots.restrictCharacter D.splitTorus χ)
      (D.cocharacterSpace (Multiplicative.toAdd (torusValuationMap D z))) = -1 := by
    rw [torusValuationMap_apply_character, h, hπ]
    simp
  refine ⟨h1, ?_⟩
  rw [map_pow, toAdd_pow, map_nsmul, map_nsmul, h1]
  norm_num

-- Test BruhatTits.torusValuationMap_anisotropic
example (_h : Subsingleton D.V) : boundedPart D = ⊤ := by
  refine eq_top_iff.2 fun z _ => ?_
  rw [boundedPart, MonoidHom.mem_ker]
  exact Subsingleton.elim _ _

-- Test BruhatTits.torusValuationMap_not_injective_on_units
example (_h : Nontrivial (boundedPart D)) : ¬ Function.Injective (torusValuationMap D) := by
  intro hinj
  obtain ⟨x, hx⟩ := exists_ne (1 : boundedPart D)
  refine hx (Subtype.ext (hinj ?_))
  show torusValuationMap D x.val = torusValuationMap D 1
  rw [map_one]
  exact x.property

end TorusValuation

/-- A valuation used with the valued field must induce its actual minimal-Levi translations; the
field valuation is nontrivial, discrete and of rank one. -/
class GeometricValuation {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) : Prop where
  [discrete : ValuativeRel.IsDiscrete K]
  [nontrivial : ValuativeRel.IsNontrivial K]
  [rankLeOne : ValuativeRel.IsRankLeOne K]
  compatible : φ.IsCompatible D (torusValuationMap D)

attribute [instance] GeometricValuation.discrete GeometricValuation.nontrivial

/- Low priority: a field with its own rank-one instance (a local field) is resolved directly,
without a search through `GeometricValuation` instances. -/
attribute [instance 100] GeometricValuation.rankLeOne

end BruhatTits

/-! ### RG2.2 — the building -/

namespace BruhatTits

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The enlarged Bruhat–Tits building `G(K) × A / ~` of the valued root datum `(D, φ)` of `G(K)`,
glued from the enlarged apartment `A` (Bruhat–Tits I, 7.4.1–7.4.2, pp. 170–171; Bruhat–Tits II,
4.2.16, pp. 94–95, for the central directions). The gluing relation is `Building.mk_eq_mk_iff`. -/
def Building (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] : Type u := sorry

/-- The action `g • [h, x] = [g h, x]` of `G(K)` (`Building.smul_mk`). -/
instance (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    MulAction (WithConv (H →ₐ[K] K)) (Building D φ) := sorry

/-- The building metric, Euclidean on the apartments for a Weyl-invariant scalar product on `V`
fixed with the construction (`Building.dist_apartmentEmbedding`; Bruhat–Tits I, 6.2.6, p. 120,
and 7.4.20, p. 175). Such a scalar product is unique only up to a positive factor on each
irreducible component of the root system and on the central directions (Bruhat–Tits II, 4.2.12
and 4.2.16, pp. 92 and 94). The scalar product on the central directions and the positive scalar
on each semisimple component are chosen once for `H` and transported to every `(D, φ)`. Thus
`Building.isometry_equivOfChoices` uses the same metric choices. -/
instance (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] : MetricSpace (Building D φ) :=
  sorry

/-- The standard apartment `j : A → B`, `x ↦ [1, x]`. -/
def apartmentEmbedding (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    Apartment φ → Building D φ := sorry

end BruhatTits

/-- The context of Bruhat–Tits II, 5.1.1, pp. 145–146: `K` is henselian for a nontrivial discrete
valuation of rank one, so that `𝒪[K]` is a discrete valuation ring, and the residue field `𝓀[K]`
is perfect. By 5.1.1 the descent of Bruhat–Tits II, §5, applies to every connected reductive
`K`-group in this context. Rank one is a separate field because `ValuativeRel.IsDiscrete` alone
also holds for valuations of higher rank with a largest value below one. Strict henselianity
(`IsSepClosed 𝓀[K]`) is imposed separately where a statement concerns a strictly henselian base. -/
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
/- The valuation ring of a `ModelField` is a discrete valuation ring; a rank-two valuation with
value group `ℤ × ℤ` (lexicographic) satisfies `ValuativeRel.IsDiscrete` but is excluded. -/
open ValuativeRel in
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K] :
    IsDiscreteValuationRing 𝒪[K] := sorry

-- Test ModelField.trivial_excluded (non-example)
example {K : Type u} [Field K] [ValuativeRel K] (h : ¬ ValuativeRel.IsNontrivial K) :
    ¬ ModelField K := fun hK => h hK.nontrivial

instance nonemptySingletonFact {X : Type*} (x : X) : Fact (({x} : Finset X).Nonempty) :=
  ⟨Finset.singleton_nonempty x⟩

open scoped Classical in
instance nonemptyImageFact {X Y : Type*} (s : Finset X) [Fact s.Nonempty] (f : X → Y) :
    Fact (s.image f).Nonempty := ⟨Finset.Nonempty.image Fact.out f⟩

/-! ### RG2.3 — integral models -/

namespace BruhatTits

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- Boundedness in the finite-dimensional enlarged apartment, expressed without choosing a norm:
every linear functional of the displacement is bounded on `Ω` (the bounded sets of
Bruhat–Tits II, 4.6.26, p. 135). -/
def Apartment.IsBounded {D : LocalRootData K H} {φ : Valuation D.rootDatum} [GeometricValuation D φ]
    (Ω : Set (Apartment φ)) : Prop :=
  ∀ f : Module.Dual ℝ D.V, ∃ c : ℝ, ∀ x ∈ Ω, |f x.displacement| ≤ c

/-- Bruhat–Tits II, 4.6.26–4.6.28, pp. 135–136, and 5.1.9, p. 148: the smooth affine model `𝒢_Ω`
of a nonempty bounded subset of the apartment, whose `𝒪`-points are the pointwise fixer of `Ω`
(`GroupScheme.boundedModel_points`). -/
def groupSchemeOfBounded [ModelField K] (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (Ω : Set (Apartment φ)) (_nonempty : Ω.Nonempty) (_bounded : Apartment.IsBounded Ω) :
    CommHopfAlgCat.{u} 𝒪[K] := sorry

/-- The identity-component model `𝒢°_Ω` of the same bounded set
(`GroupScheme.boundedModel_connected`). -/
def parahoricGroupSchemeOfBounded [ModelField K] (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (Ω : Set (Apartment φ))
    (_nonempty : Ω.Nonempty) (_bounded : Apartment.IsBounded Ω) : CommHopfAlgCat.{u} 𝒪[K] := sorry

/-- The Bruhat–Tits group scheme `𝒢_Ω` of a nonempty finite subset `Ω` of the apartment (by
Bruhat–Tits II, 4.6.27, p. 135, it depends only on the enclosure): a smooth affine `𝒪[K]`-group
whose `𝒪`-points are the pointwise fixer of `Ω` (Bruhat–Tits II, 4.6.28 (i), p. 135, and 5.1.9,
p. 148; `GroupScheme.integralPoints_eq_fixer`). -/
def groupScheme [ModelField K] (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    CommHopfAlgCat.{u} 𝒪[K] :=
  groupSchemeOfBounded D φ Ω (by simpa using (Fact.out : Ω.Nonempty))
    (fun f => ⟨∑ y ∈ Ω, |f y.displacement|, fun _ hx =>
      Finset.single_le_sum (f := fun y => |f y.displacement|) (fun _ _ => abs_nonneg _) hx⟩)

/-- The connected parahoric group scheme `𝒢°_Ω`, the identity component of `groupScheme`
(Bruhat–Tits II, 4.6.28 (i), p. 135, and 5.2.6, p. 164). -/
def parahoricGroupScheme [ModelField K] (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] : CommHopfAlgCat.{u} 𝒪[K] :=
  parahoricGroupSchemeOfBounded D φ Ω (by simpa using (Fact.out : Ω.Nonempty))
    (fun f => ⟨∑ y ∈ Ω, |f y.displacement|, fun _ hx =>
      Finset.single_le_sum (f := fun y => |f y.displacement|) (fun _ _ => abs_nonneg _) hx⟩)

/-- The parahoric subgroup `P°_Ω = 𝒢°_Ω(𝒪)` of `G(K)`, the integral points of the connected group
scheme (`GroupScheme.parahoric_integralPoints`); over a nonarchimedean local field it is the fixer
of `Ω` intersected with the kernel of the Kottwitz map
(`Parahoric.parahoricSubgroup_eq_fixer_inf_kottwitz`). -/
def parahoricSubgroup [ModelField K] (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] : Subgroup (WithConv (H →ₐ[K] K)) := sorry

end BruhatTits

/-! ### RG2.4 — the Iwahori–Weyl group -/

namespace BruhatTits

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The unique parahoric subgroup `Z(K)_0` of the minimal Levi `Z(K)` for the valuation of `K`
(Richarz, Def. 1.1, p. 118; Haines–Rapoport, Lem. 5, p. 3, where over `L` it is the kernel of the
Kottwitz map of the torus `Z = T`). It is pinned by `parahoricSubgroup_inf_centralizer` of Layer
RG2.4: every parahoric subgroup of a nonempty finite subset of the apartment meets `Z(K)` exactly in
`Z(K)_0`. -/
def minimalLeviParahoric [ValuativeRel K] [ModelField K] (D : LocalRootData K H) :
    Subgroup (WithConv (H →ₐ[K] K)) := sorry

instance [ValuativeRel K] [ModelField K] (D : LocalRootData K H) :
    ((minimalLeviParahoric D).subgroupOf D.normalizer).Normal := sorry

/-- The Iwahori–Weyl group `W̃ = N(K)/Z(K)_0` (Haines–Rapoport, Def. 7, p. 4; Richarz, Def. 1.1,
p. 118). -/
def IwahoriWeylGroup [ValuativeRel K] [ModelField K] (D : LocalRootData K H) : Type u :=
  D.normalizer ⧸ (minimalLeviParahoric D).subgroupOf D.normalizer

instance [ValuativeRel K] [ModelField K] (D : LocalRootData K H) : Group (IwahoriWeylGroup D) :=
  inferInstanceAs (Group (D.normalizer ⧸ (minimalLeviParahoric D).subgroupOf D.normalizer))

end BruhatTits

/-! ### RG2.5 — dual groups -/

namespace LanglandsDual

open BruhatTits

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The Langlands dual group: the pinned split reductive group over `ℤ` attached to the dual root
datum by the Chevalley–Demazure construction of the Reductive groups roadmap (layer 9). -/
def dualGroup (D : AbsoluteRootData K H) : CommHopfAlgCat.{0} ℤ := sorry

/-- The action of the Galois group on the points of the dual group through pinned automorphisms
(finite image). -/
def galoisActionOnPoints (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    Field.absoluteGaloisGroup K →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R)) := sorry

/-- The L-group `ᴸG(R) = Ĝ(R) ⋊ Γ_K` (Galois form). -/
abbrev LGroup (D : AbsoluteRootData K H) (R : Type) [CommRing R] : Type _ :=
  WithConv (dualGroup D →ₐ[ℤ] R) ⋊[galoisActionOnPoints D R] Field.absoluteGaloisGroup K

end LanglandsDual

/-! ## Layer RG2.0: Topologies on rational points -/

namespace PointTopology

open scoped PointTopology

section Affine

variable {k : Type u} [CommRing k] {A : Type v} [CommRing A] [Algebra k A]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R] [IsTopologicalRing R]

/-- Every evaluation map `f ↦ f a` is continuous for the point topology. -/
theorem continuous_eval (a : A) : Continuous fun f : A →ₐ[k] R => f a := sorry

/-- The universal property of the point topology. -/
theorem continuous_iff {Y : Type*} [TopologicalSpace Y] (g : Y → (A →ₐ[k] R)) :
    Continuous g ↔ ∀ a : A, Continuous fun y => g y a := sorry

/-- The point topology is the subspace topology of the product topology on `A → R`. -/
theorem isEmbedding_toPi : Topology.IsEmbedding fun f : A →ₐ[k] R => (⇑f : A → R) := sorry

/-- `ofConv` is a homeomorphism from the convolution carrier of points onto `Hom_k(A, R)`. -/
theorem isHomeomorph_ofConv :
    IsHomeomorph (WithConv.ofConv : WithConv (A →ₐ[k] R) → (A →ₐ[k] R)) :=
  sorry

/-- Evaluation at a generating family is an embedding. -/
theorem isEmbedding_eval_generators {ι : Type*} (a : ι → A)
    (ha : Algebra.adjoin k (Set.range a) = ⊤) :
    Topology.IsEmbedding fun f : A →ₐ[k] R => fun i => f (a i) := sorry

/-- For a finite generating family and `T1` coefficients the embedding is closed: its image is
the common zero locus of the relations among the generators. -/
theorem isClosedEmbedding_eval_generators [T1Space R] {ι : Type*} [Finite ι] (a : ι → A)
    (ha : Algebra.adjoin k (Set.range a) = ⊤) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => fun i => f (a i) := sorry

/-- For `R` locally compact Hausdorff and `A` of finite type, `Hom_k(A, R)` is locally compact. -/
theorem locallyCompactSpace_of_finiteType [T2Space R] [LocallyCompactSpace R]
    [Algebra.FiniteType k A] : LocallyCompactSpace (A →ₐ[k] R) := sorry

/-- Precomposition with an algebra map is continuous. -/
theorem continuous_comap {B : Type*} [CommRing B] [Algebra k B] (φ : B →ₐ[k] A) :
    Continuous fun f : A →ₐ[k] R => f.comp φ := sorry

/-- A surjection of algebras (a closed immersion) gives a closed embedding when `R` is T1. -/
theorem isClosedEmbedding_comap_of_surjective [T1Space R] {B : Type*} [CommRing B] [Algebra k B]
    (φ : B →ₐ[k] A) (hφ : Function.Surjective φ) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => f.comp φ := sorry

/-- Postcomposition with a continuous algebra map is continuous. -/
theorem continuous_map_codomain {R' : Type*} [CommRing R'] [Algebra k R'] [TopologicalSpace R']
    [IsTopologicalRing R'] (ψ : R →ₐ[k] R') (hψ : Continuous ψ) :
    Continuous fun f : A →ₐ[k] R => ψ.comp f := sorry

/-- Postcomposition with an embedding of coefficient algebras is an embedding. -/
theorem isEmbedding_map_codomain {R' : Type*} [CommRing R'] [Algebra k R'] [TopologicalSpace R']
    [IsTopologicalRing R'] (ψ : R →ₐ[k] R') (hψ : Topology.IsEmbedding ψ) :
    Topology.IsEmbedding fun f : A →ₐ[k] R => ψ.comp f := sorry

/-- Postcomposition with a closed embedding of coefficient algebras is a closed embedding: its
image is the set of points all of whose values lie in the closed subset `ψ(R)`. -/
theorem isClosedEmbedding_map_codomain {R' : Type*} [CommRing R'] [Algebra k R']
    [TopologicalSpace R'] [IsTopologicalRing R'] (ψ : R →ₐ[k] R')
    (hψ : Topology.IsClosedEmbedding ψ) :
    Topology.IsClosedEmbedding fun f : A →ₐ[k] R => ψ.comp f := sorry

/-- Postcomposition with an open embedding of coefficient algebras is an open embedding when `A`
is of finite type. -/
theorem isOpenEmbedding_map_codomain [Algebra.FiniteType k A] {R' : Type*} [CommRing R']
    [Algebra k R'] [TopologicalSpace R'] [IsTopologicalRing R'] (ψ : R →ₐ[k] R')
    (hψ : Topology.IsOpenEmbedding ψ) :
    Topology.IsOpenEmbedding fun f : A →ₐ[k] R => ψ.comp f := sorry

/-- Points of a tensor product: restriction to the two factors is a homeomorphism
`Hom_k(A ⊗_k B, R) ≅ Hom_k(A, R) × Hom_k(B, R)`. -/
theorem isHomeomorph_tensorProduct {B : Type*} [CommRing B] [Algebra k B] :
    IsHomeomorph fun f : A ⊗[k] B →ₐ[k] R =>
      (f.comp (Algebra.TensorProduct.includeLeft (S := k)),
        f.comp (Algebra.TensorProduct.includeRight)) := sorry

/-- Base change: for a `k'`-algebra `R`, restriction along `A → k' ⊗_k A` is a homeomorphism
`Hom_{k'}(k' ⊗_k A, R) ≅ Hom_k(A, R)`. -/
theorem isHomeomorph_baseChange {k' : Type*} [CommRing k'] [Algebra k k'] [Algebra k' R]
    [IsScalarTower k k' R] :
    IsHomeomorph fun f : k' ⊗[k] A →ₐ[k'] R =>
      (f.restrictScalars k).comp Algebra.TensorProduct.includeRight := sorry

/-- Localizations give open embeddings when units are open with continuous inversion. -/
theorem isOpenEmbedding_localization (f : A) (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    Topology.IsOpenEmbedding fun x : Localization.Away f →ₐ[k] R =>
      x.comp (IsScalarTower.toAlgHom k A (Localization.Away f)) := sorry

/-- The image of `Hom_k(A_f, R)` in `Hom_k(A, R)` is the locus where `f` takes unit values. -/
theorem range_comp_localization (f : A) :
    Set.range (fun x : Localization.Away f →ₐ[k] R =>
      x.comp (IsScalarTower.toAlgHom k A (Localization.Away f))) =
        {y : A →ₐ[k] R | IsUnit (y f)} := sorry

-- Test PointTopology.polynomial_homeomorph
example : ∃ e : (Polynomial k →ₐ[k] R) ≃ₜ R, ∀ f, e f = f Polynomial.X := sorry

-- Test PointTopology.discrete_of_discrete
example [DiscreteTopology R] [Algebra.FiniteType k A] : DiscreteTopology (A →ₐ[k] R) := sorry

-- Test PointTopology.not_discrete_infinite
/- Without finite type the previous check fails: the points of `𝔽₂[x₀, x₁, …]` with values in the
discrete field `𝔽₂` form the product space `𝔽₂^ℕ`, which is not discrete. -/
example : ¬ DiscreteTopology (MvPolynomial ℕ (ZMod 2) →ₐ[ZMod 2] ZMod 2) := sorry

-- Test PointTopology.units_hyperbola
example (p : ℕ) [Fact p.Prime] :
    Topology.IsEmbedding fun f : LaurentPolynomial ℤ →ₐ[ℤ] ℚ_[p] => f (LaurentPolynomial.T 1) :=
  sorry

-- Test PointTopology.pi_compat
example : (PointTopology.topology k A R) =
    TopologicalSpace.induced (fun f : A →ₐ[k] R => (⇑f : A → R)) Pi.topologicalSpace := by
  rw [induced_to_pi]

end Affine

section Group

/- `IsTopologicalRing R` is a binder of each declaration rather than a section variable, so that it
is part of the type of `generalLinearPointsHomeomorph`. -/
variable {k : Type u} [CommRing k] {H : Type v} [CommRing H] [HopfAlgebra k H]
  {R : Type w} [CommRing R] [Algebra k R] [TopologicalSpace R]

/-- The convolution group of points is a topological group. -/
theorem isTopologicalGroup [IsTopologicalRing R] : IsTopologicalGroup (WithConv (H →ₐ[k] R)) :=
  sorry

/-- For `GL_n` and a topological ring `R`, Tau Ceti's `TauCeti.GeneralLinear.pointsMulEquiv` is a
homeomorphism from the points with the point topology onto `GL_n(R)` with the units topology of
`M_n(R)`. -/
def generalLinearPointsHomeomorph [IsTopologicalRing R] (n : ℕ) :
    WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra k n →ₐ[k] R) ≃ₜ
      Matrix.GeneralLinearGroup (Fin n) R where
  toEquiv := (TauCeti.GeneralLinear.pointsMulEquiv (R := k) n (A := R)).toEquiv
  continuous_toFun := sorry
  continuous_invFun := sorry

@[simp] theorem generalLinearPointsHomeomorph_apply [IsTopologicalRing R] (n : ℕ)
    (x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra k n →ₐ[k] R)) :
    generalLinearPointsHomeomorph n x = TauCeti.GeneralLinear.pointsMulEquiv (R := k) n (A := R) x :=
  rfl

-- Test PointTopology.generalLinearPointsHomeomorph_adeles_not_embedding
/- The target carries the units topology, not the subspace topology of `M_n(R)`: for `n = 1` and
`R = 𝔸_ℚ`, inversion on `𝔸_ℚ^×` is not continuous for the subspace topology of `𝔸_ℚ`, so the
injective map `GL_1(𝔸_ℚ) → M_1(𝔸_ℚ)` is not an embedding. -/
example : ¬ Topology.IsEmbedding fun x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1
    →ₐ[ℚ] NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ) =>
      ((generalLinearPointsHomeomorph 1 x : Matrix.GeneralLinearGroup (Fin 1) _) :
        Matrix (Fin 1) (Fin 1) (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)) := sorry

end Group

section LocalInstances

open ValuativeRel

/- The local-field hypotheses are binders of each instance rather than section variables, so that
they appear in the instance types. -/
variable {E : Type u} [Field E] [TopologicalSpace E] {H : Type v} [CommRing H] [HopfAlgebra E H]

/-- Points of an affine group over a nonarchimedean local field form a Hausdorff space. -/
instance instT2SpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    T2Space (WithConv (H →ₐ[E] E)) := sorry

instance instLocallyCompactSpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E]
    [Algebra.FiniteType E H] : LocallyCompactSpace (WithConv (H →ₐ[E] E)) := sorry

instance instSecondCountableTopologyLocal [ValuativeRel E] [IsNonarchimedeanLocalField E]
    [Algebra.FiniteType E H] : SecondCountableTopology (WithConv (H →ₐ[E] E)) := sorry

/-- Points over a nonarchimedean local field form a totally disconnected space: they sit in a
product of copies of the totally disconnected field `E`. -/
instance instTotallyDisconnectedSpaceLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    TotallyDisconnectedSpace (WithConv (H →ₐ[E] E)) := sorry

instance instIsTopologicalGroupLocal [ValuativeRel E] [IsNonarchimedeanLocalField E] :
    IsTopologicalGroup (WithConv (H →ₐ[E] E)) :=
  isTopologicalGroup

-- Test PointTopology.real_units_not_totallyDisconnected
/- The local-field hypothesis of `instTotallyDisconnectedSpaceLocal` is needed: the points of
`G_m` over `ℝ` form `ℝ^×`, whose half-line of positive reals is connected. -/
example : ¬ TotallyDisconnectedSpace (WithConv (LaurentPolynomial ℝ →ₐ[ℝ] ℝ)) := sorry

end LocalInstances

section Integral

open ValuativeRel

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Integral points are open inside rational points. -/
theorem isOpenEmbedding_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] :
    Topology.IsOpenEmbedding fun f : A →ₐ[𝒪[E]] 𝒪[E] =>
      (Algebra.ofId 𝒪[E] E).comp f := sorry

/-- Integral points of a finite-type algebra form a compact space. -/
theorem compactSpace_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A]
    [Algebra.FiniteType 𝒪[E] A] : CompactSpace (A →ₐ[𝒪[E]] 𝒪[E]) := sorry

/-- The image of the integral points consists of the rational points all of whose values are
integral. -/
theorem range_integralPoints {A : Type u} [CommRing A] [Algebra 𝒪[E] A] :
    Set.range (fun f : A →ₐ[𝒪[E]] 𝒪[E] => (Algebra.ofId 𝒪[E] E).comp f) =
      {x : A →ₐ[𝒪[E]] E | ∀ a, x a ∈ 𝒪[E]} := sorry

-- Test PointTopology.generalLinear_integral_iff_det
/- A matrix in `M_n(E)` comes from a point of `GL_n` over `𝒪[E]` exactly when its entries are
integral and its determinant is a unit of `𝒪[E]`. -/
example (n : ℕ) (g : Matrix (Fin n) (Fin n) E) :
    (∃ x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] n →ₐ[𝒪[E]] 𝒪[E]),
        (TauCeti.GeneralLinear.pointsMulEquiv (R := 𝒪[E]) n (A := 𝒪[E]) x :
          Matrix (Fin n) (Fin n) 𝒪[E]).map ((↑) : 𝒪[E] → E) = g) ↔
      ∃ M : Matrix (Fin n) (Fin n) 𝒪[E], M.map ((↑) : 𝒪[E] → E) = g ∧ IsUnit M.det := sorry

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

-- Test PointTopology.generalLinearPointsHomeomorph_isOpenEmbedding
/- Over a nonarchimedean local field, where inversion is continuous on `E^×`, the units topology of
`GL_n(E)` is the subspace topology of the open subset `GL_n(E) ⊂ M_n(E)`. -/
example (n : ℕ) :
    Topology.IsOpenEmbedding
      fun x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra E n →ₐ[E] E) =>
        ((generalLinearPointsHomeomorph n x : Matrix.GeneralLinearGroup (Fin n) E) :
          Matrix (Fin n) (Fin n) E) := sorry

end Integral

end PointTopology

namespace SchemePointTopology

open AlgebraicGeometry

/-- `R`-points of `X` over `Spec k`, with their base compatibility. -/
abbrev Points {k : Type u} [CommRing k] {X : Scheme.{u}}
    (f : X ⟶ Spec (CommRingCat.of k)) (R : Type u) [CommRing R] [Algebra k R] :=
  {x : Spec (CommRingCat.of R) ⟶ X //
    x ≫ f = Spec.map (CommRingCat.ofHom (algebraMap k R))}

/-- The topology on `X(R)` glued from the affine point topologies: the finest topology for which,
for every affine open `U ⊆ X`, the map `U(R) → X(R)` is continuous, where `U(R) ≅ Hom_k(Γ(U), R)`
carries its affine point topology. When `R^×` is open in `R` and inversion is continuous on it,
these maps are open embeddings that cover `X(R)` (Conrad, Proposition 3.1); the theorems below
assume these two properties of `R`. -/
@[reducible] def topology {k : Type u} [CommRing k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) (R : Type u) [CommRing R] [Algebra k R]
    [TopologicalSpace R] [IsTopologicalRing R] [IsLocalRing R] :
    TopologicalSpace (Points f R) := sorry

/-- The `R`-point of `Spec A` over `Spec k` given by a `k`-algebra map `A → R`. -/
def affinePoint {k : Type u} [CommRing k] {A : Type u} [CommRing A] [Algebra k A]
    {R : Type u} [CommRing R] [Algebra k R] (φ : A →ₐ[k] R) :
    Points (Spec.map (CommRingCat.ofHom (algebraMap k A))) R :=
  ⟨Spec.map (CommRingCat.ofHom φ.toRingHom), by
    rw [← Spec.map_comp]
    congr 1
    ext x
    simp⟩

variable {k : Type u} [CommRing k] (R : Type u) [CommRing R] [Algebra k R] [TopologicalSpace R]
  [IsTopologicalRing R] [IsLocalRing R]

/-- Affine opens give open subspaces. -/
theorem isOpenEmbedding_affineOpen
    (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R))
    (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of k)) (U : X.affineOpens) :
    @Topology.IsOpenEmbedding _ _ (topology U.1.toScheme (U.1.ι ≫ f) R)
      (topology X f R) (fun x => ⟨x.val ≫ U.1.ι, by simpa using x.property⟩) := sorry

/-- Every point over a local ring factors through an affine open. -/
theorem iUnion_affineOpens (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of k)) :
    ∀ x : Points f R, ∃ U : X.affineOpens,
      Set.range x.val.base ⊆ ((U : X.Opens) : Set X) := sorry

/-- For `X = Spec A`, the canonical bijection `Hom_k(A, R) → X(R)` is a homeomorphism from the
affine point topology. -/
theorem affine_eq (A : Type u) [CommRing A] [Algebra k A]
    (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    @IsHomeomorph _ _ (PointTopology.topology k A R) (topology _ _ R)
      (affinePoint (k := k) (A := A) (R := R)) := sorry

/-- Morphisms over the base induce continuous maps. -/
theorem continuous_map {X Y : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of k))
    (fY : Y ⟶ Spec (CommRingCat.of k)) (g : X ⟶ Y) (hg : g ≫ fY = fX)
    (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    @Continuous _ _ (topology X fX R) (topology Y fY R)
      (fun x => ⟨x.val ≫ g, by rw [Category.assoc, hg, x.property]⟩) := sorry

/-- Open immersions over the base give open embeddings. -/
theorem isOpenEmbedding_of_isOpenImmersion {X Y : Scheme.{u}}
    (fX : X ⟶ Spec (CommRingCat.of k)) (fY : Y ⟶ Spec (CommRingCat.of k)) (g : X ⟶ Y)
    [IsOpenImmersion g] (hg : g ≫ fY = fX)
    (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    @Topology.IsOpenEmbedding _ _ (topology X fX R) (topology Y fY R)
      (fun x => ⟨x.val ≫ g, by rw [Category.assoc, hg, x.property]⟩) := sorry

/-- Closed immersions over the base give closed embeddings for Hausdorff coefficients. -/
theorem isClosedEmbedding_of_isClosedImmersion [T2Space R] {X Y : Scheme.{u}}
    (fX : X ⟶ Spec (CommRingCat.of k)) (fY : Y ⟶ Spec (CommRingCat.of k)) (g : X ⟶ Y)
    [IsClosedImmersion g] (hg : g ≫ fY = fX)
    (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    @Topology.IsClosedEmbedding _ _ (topology X fX R) (topology Y fY R)
      (fun x => ⟨x.val ≫ g, by rw [Category.assoc, hg, x.property]⟩) := sorry

/-- Points of a separated scheme with Hausdorff coefficients form a Hausdorff space. -/
theorem t2Space_of_isSeparated [T2Space R] (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of k))
    [IsSeparated f]
    (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    @T2Space _ (topology X f R) := sorry

/-- Points of a scheme locally of finite type with locally compact Hausdorff coefficients form a
locally compact space. -/
theorem locallyCompactSpace_of_locallyOfFiniteType [T2Space R] [LocallyCompactSpace R]
    (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of k)) [LocallyOfFiniteType f]
    (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    @LocallyCompactSpace _ (topology X f R) := sorry

-- Test SchemePointTopology.basePoint_unique
example : Unique (Points (𝟙 (Spec (CommRingCat.of k))) R) := sorry

-- Test SchemePointTopology.emptyScheme
example (f : (∅ : Scheme.{u}) ⟶ Spec (CommRingCat.of k)) :
    IsEmpty (Points f R) := sorry

-- Test SchemePointTopology.affineLine
/- Normalization: on the affine line, `r ↦ (t ↦ r)` is a homeomorphism `R ≅ 𝔸¹(R)`. -/
example (hU : IsOpen {r : R | IsUnit r})
    (hinv : Continuous fun u : {r : R // IsUnit r} => ((u.property.unit⁻¹ : Rˣ) : R)) :
    @IsHomeomorph _ _ _ (topology _ (Spec.map (CommRingCat.ofHom (algebraMap k (Polynomial k)))) R)
      (fun r : R => affinePoint (Polynomial.aeval (R := k) r)) := sorry

-- Test SchemePointTopology.conjugation_not_over_complex
/- Complex conjugation induces an endomorphism of `Spec ℂ` that is not a point of `Spec ℂ` over
itself: it fails the base condition defining `Points`. -/
example : Spec.map (CommRingCat.ofHom (starRingEnd ℂ : ℂ →+* ℂ)) ≫ 𝟙 (Spec (CommRingCat.of ℂ)) ≠
    Spec.map (CommRingCat.ofHom (algebraMap ℂ ℂ)) := by
  intro h
  rw [Category.comp_id] at h
  have h' := congrArg (fun φ => φ.hom Complex.I) (Spec.map_injective h)
  simp at h'
  have hIm := congrArg Complex.im h'
  norm_num at hIm

-- Test SchemePointTopology.affinePoint_bijective
/- `affinePoint` identifies `Hom_k(A, R)` with the `R`-points of `Spec A` over `Spec k`, for every
`k`-algebra `R`. -/
example {A R' : Type u} [CommRing A] [Algebra k A] [CommRing R'] [Algebra k R'] :
    Function.Bijective (affinePoint (k := k) (A := A) (R := R')) := by
  constructor
  · intro φ ψ h
    have h' := Spec.map_injective (congrArg Subtype.val h)
    ext a
    exact congrArg (fun g => g.hom a) h'
  · rintro ⟨x, hx⟩
    have hc : CommRingCat.ofHom (algebraMap k A) ≫ Spec.preimage x =
        CommRingCat.ofHom (algebraMap k R') := by
      apply Spec.map_injective
      rw [Spec.map_comp, Spec.map_preimage, hx]
    refine ⟨{ (Spec.preimage x).hom with commutes' := fun c => ?_ }, ?_⟩
    · exact congrArg (fun g => g.hom c) hc
    · apply Subtype.ext
      change Spec.map (CommRingCat.ofHom (Spec.preimage x).hom) = x
      rw [CommRingCat.ofHom_hom, Spec.map_preimage]

-- Test SchemePointTopology.affinePoint_comp
/- Contravariance: for `ψ : A → B` and `φ : B → R`, the point `φ ∘ ψ` of `Spec A` is the point `φ`
of `Spec B` followed by `Spec ψ : Spec B → Spec A`. -/
example {A B R' : Type u} [CommRing A] [Algebra k A] [CommRing B] [Algebra k B] [CommRing R']
    [Algebra k R'] (ψ : A →ₐ[k] B) (φ : B →ₐ[k] R') :
    (affinePoint (φ.comp ψ)).val =
      (affinePoint φ).val ≫ Spec.map (CommRingCat.ofHom ψ.toRingHom) := by
  simp only [affinePoint, ← Spec.map_comp]
  rfl

-- Test SchemePointTopology.discrete_of_locallyOfFiniteType
/- For a discrete local ring `R`, where both hypotheses on units hold, and `X` locally of finite
type over `k`, the space `X(R)` is discrete; without finite type this fails already for affine `X`
(`PointTopology.not_discrete_infinite`). -/
example [DiscreteTopology R] (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of k))
    [LocallyOfFiniteType f] : @DiscreteTopology _ (topology X f R) := sorry

/-- Local compactness and Hausdorffness over a local field (Conrad, Proposition 3.1). -/
theorem locallyCompactSpace_of_localField {E : Type u} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of E)) [LocallyOfFiniteType f] [IsSeparated f] :
    @LocallyCompactSpace _ (topology X f E) ∧ @T2Space _ (topology X f E) := sorry

/-- Smooth morphisms over a local field are open on rational points. -/
theorem isOpenMap_of_smooth {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] {X Y : Scheme.{u}} (fX : X ⟶ Spec (CommRingCat.of E))
    (fY : Y ⟶ Spec (CommRingCat.of E)) [LocallyOfFiniteType fY] (g : X ⟶ Y) [Smooth g]
    (hg : g ≫ fY = fX) :
    @IsOpenMap _ _ (topology X fX E) (topology Y fY E)
      (fun x => ⟨x.val ≫ g, by rw [Category.assoc, hg, x.property]⟩) := sorry

-- Test SchemePointTopology.compactSpace_of_isProper
/- The gluing is not a disjoint union of charts: for `X` proper over a nonarchimedean local field
`E`, `X(E)` is compact, while the projective line is covered by two affine lines whose spaces of
points `E` are not compact. -/
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (X : Scheme.{u}) (f : X ⟶ Spec (CommRingCat.of E)) [IsProper f] :
    @CompactSpace _ (topology X f E) := sorry

end SchemePointTopology

namespace CongruenceSubgroup

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
  (H : Type u) [CommRing H] [HopfAlgebra 𝒪[E] H]

/-- The `n`-th congruence subgroup: the kernel of reduction modulo `𝓂^n` on integral points, that
is, of the homomorphism `𝒢(𝒪) → 𝒢(𝒪/𝓂^n)` given by composing with the quotient map. -/
def subgroup (n : ℕ) : Subgroup (WithConv (H →ₐ[𝒪[E]] 𝒪[E])) :=
  (TauCeti.AlgHom.mapValue (H := H) (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n))).ker

theorem mem_iff (n : ℕ) (x : WithConv (H →ₐ[𝒪[E]] 𝒪[E])) :
    x ∈ subgroup E H n ↔
      (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n)).comp x.ofConv =
        (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n)).comp (1 : WithConv (H →ₐ[𝒪[E]] 𝒪[E])).ofConv := by
  rw [subgroup, MonoidHom.mem_ker, ← map_one (TauCeti.AlgHom.mapValue (H := H)
    (Ideal.Quotient.mkₐ 𝒪[E] (𝓂[E] ^ n))), TauCeti.AlgHom.mapValue_apply,
    TauCeti.AlgHom.mapValue_apply]
  exact WithConv.toConv_injective.eq_iff

instance normal (n : ℕ) : (subgroup E H n).Normal := MonoidHom.normal_ker _

theorem antitone : Antitone (subgroup E H) := by
  intro n m hnm x hx
  rw [mem_iff] at hx ⊢
  ext h
  have hh := congrArg (fun φ => φ h) hx
  simp only [AlgHom.comp_apply, Ideal.Quotient.mkₐ_eq_mk, Ideal.Quotient.eq] at hh ⊢
  exact Ideal.pow_le_pow_right hnm hh

@[simp] theorem zero_eq_top : subgroup E H 0 = ⊤ := by
  refine eq_top_iff.2 fun x _ => (mem_iff E H 0 x).2 ?_
  ext h
  simp only [AlgHom.comp_apply, Ideal.Quotient.mkₐ_eq_mk, Ideal.Quotient.eq, pow_zero,
    Ideal.one_eq_top, Submodule.mem_top]

open scoped PointTopology in
theorem isOpen [Algebra.FiniteType 𝒪[E] H] (n : ℕ) :
    IsOpen (subgroup E H n : Set (WithConv (H →ₐ[𝒪[E]] 𝒪[E]))) := sorry

/-- An algebra map compatible with the counits (for instance a map of Hopf algebras) carries
congruence subgroups into congruence subgroups. -/
theorem map {H' : Type u} [CommRing H'] [HopfAlgebra 𝒪[E] H'] (φ : H' →ₐ[𝒪[E]] H)
    (hφ : (Coalgebra.counit : H →ₗ[𝒪[E]] 𝒪[E]).comp φ.toLinearMap = Coalgebra.counit) (n : ℕ)
    (x : WithConv (H →ₐ[𝒪[E]] 𝒪[E])) (hx : x ∈ subgroup E H n) :
    WithConv.toConv (x.ofConv.comp φ) ∈ subgroup E H' n := sorry

-- Test CongruenceSubgroup.generalLinear_eq
example (d n : ℕ) (x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] d →ₐ[𝒪[E]] 𝒪[E])) :
    x ∈ subgroup E _ n ↔
      ∀ i j, (TauCeti.GeneralLinear.pointsMulEquiv (R := 𝒪[E]) (n := d) (A := 𝒪[E]) x : Matrix (Fin d) (Fin d) 𝒪[E]) i j -
        (1 : Matrix (Fin d) (Fin d) 𝒪[E]) i j ∈ 𝓂[E] ^ n := sorry

-- Test CongruenceSubgroup.multiplicative_eq_unitFiltration
/- For `G_m`, the congruence subgroups are Tau Ceti's unit filtration of `E`. -/
example (n : ℕ) (x : WithConv (LaurentPolynomial 𝒪[E] →ₐ[𝒪[E]] 𝒪[E])) :
    x ∈ subgroup E (LaurentPolynomial 𝒪[E]) n ↔
      Units.map (Subring.subtype 𝒪[E]).toMonoidHom
          (TauCeti.MultiplicativeGroup.pointsMulEquiv (R := 𝒪[E]) (A := 𝒪[E]) x) ∈
        TauCeti.unitFiltration E n := sorry

-- Test CongruenceSubgroup.iInf_eq_bot
example : (⨅ n, subgroup E H n) = ⊥ := sorry

-- Test CongruenceSubgroup.diagonal_mem_first_not_second
/- For `GL_2`, `diag(1 + ϖ, 1)` lies in the first but not the second congruence subgroup, so the
filtration is not constant from `n = 1` on. -/
example (ϖ : 𝒪[E]) (hϖ : Irreducible ϖ)
    (x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] 2 →ₐ[𝒪[E]] 𝒪[E]))
    (hx : (TauCeti.GeneralLinear.pointsMulEquiv (R := 𝒪[E]) (n := 2) (A := 𝒪[E]) x :
      Matrix (Fin 2) (Fin 2) 𝒪[E]) = Matrix.diagonal ![1 + ϖ, 1]) :
    x ∈ subgroup E _ 1 ∧ x ∉ subgroup E _ 2 := sorry

open scoped PointTopology in
/-- The congruence subgroups form a neighbourhood basis of the identity. -/
theorem hasBasis_nhds_one [Algebra.FiniteType 𝒪[E] H] :
    (nhds (1 : WithConv (H →ₐ[𝒪[E]] 𝒪[E]))).HasBasis (fun _ : ℕ => True)
      fun n => (subgroup E H n : Set (WithConv (H →ₐ[𝒪[E]] 𝒪[E]))) := sorry

open scoped PointTopology in
/-- The first congruence subgroup of a finite-type group is pro-`p` for the residue
characteristic `p`. -/
theorem isProP_one [Algebra.FiniteType 𝒪[E] H] :
    TauCeti.IsProP (ringChar 𝓀[E]) (subgroup E H 1) := sorry

-- Test CongruenceSubgroup.not_isProP_zero_generalLinear
/- The level `1` in `isProP_one` is needed: for `GL_2`, the open normal subgroup `𝒢(𝒪)_1` of
`𝒢(𝒪)_0 = GL_2(𝒪)` has quotient `GL_2(𝓀)`, of order `q(q − 1)(q² − 1)`, which is not a power
of `p`. -/
open scoped PointTopology in
example : ¬ TauCeti.IsProP (ringChar 𝓀[E])
    (subgroup E (TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[E] 2) 0) := sorry

/-- For a smooth model and `n ≥ 1`, the consecutive congruence quotient has `q^d` elements, where
`d` is the rank of the cotangent space `ker ε / (ker ε)²` at the identity. -/
theorem natCard_quotient_succ [Algebra.Smooth 𝒪[E] H] (n : ℕ) (hn : 1 ≤ n) :
    Nat.card ((subgroup E H n) ⧸ (subgroup E H (n + 1)).subgroupOf (subgroup E H n)) =
      Nat.card 𝓀[E] ^
        Module.finrank 𝒪[E] (RingHom.ker (Bialgebra.counitAlgHom 𝒪[E] H : H →+* 𝒪[E])).Cotangent :=
  sorry

-- Test CongruenceSubgroup.natCard_quotient_zero_multiplicative
/- The hypothesis `1 ≤ n` of `natCard_quotient_succ` is needed: for `G_m`, where `d = 1`, the
quotient `𝒢(𝒪)_0/𝒢(𝒪)_1 ≅ 𝓀^×` has `q − 1` elements, not `q`. -/
example : Nat.card ((subgroup E (LaurentPolynomial 𝒪[E]) 0) ⧸
    (subgroup E (LaurentPolynomial 𝒪[E]) 1).subgroupOf (subgroup E (LaurentPolynomial 𝒪[E]) 0)) =
      Nat.card 𝓀[E] - 1 := sorry

end CongruenceSubgroup

namespace MaxUnramifiedCompletion

open ValuativeRel

variable (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E]

/-- Frobenius is congruent to the `q`-th power map modulo the maximal ideal on integers. -/
theorem frobenius_congr :
    ∀ x : Breve E, valuation (Breve E) x ≤ 1 →
      valuation (Breve E) (frobenius E x - x ^ Nat.card 𝓀[E]) < 1 := sorry

/-- The Frobenius-fixed elements of `Ĕ` are those of `E`. -/
theorem fixedPoints_frobenius :
    {x : Breve E | frobenius E x = x} = Set.range (algebraMap E (Breve E)) := sorry

/-- The residue field of `Ĕ` is algebraically closed. -/
theorem residueField_isAlgClosed : IsAlgClosed 𝓀[Breve E] := sorry

/-- A uniformizer of `E` remains a uniformizer of `Ĕ`. -/
theorem isUniformizer_algebraMap (ϖ : E) (hϖ1 : valuation E ϖ < 1)
    (hϖ : ∀ x : E, valuation E x < 1 → ∃ y : E, valuation E y ≤ 1 ∧ x = ϖ * y) :
    ∀ x : Breve E, valuation (Breve E) x < 1 →
      ∃ y : Breve E, valuation (Breve E) y ≤ 1 ∧ x = algebraMap E (Breve E) ϖ * y := sorry

/-- `E` is a closed subfield of `Ĕ`. -/
theorem isClosedEmbedding_algebraMap : Topology.IsClosedEmbedding (algebraMap E (Breve E)) :=
  sorry

-- Test MaxUnramifiedCompletion.complete
example : CompleteSpace (Breve E) := inferInstance

/-- In characteristic zero, `Ĕ` has infinite transcendence degree over `E`.
Chen, Proposition 2.0.3, pp. 734–735, followed by finite extension of the base field. -/
theorem transcendenceDegree_infinite [CharZero E] (n : ℕ) :
    ∃ x : Fin n → Breve E, AlgebraicIndependent E x := sorry

-- Test MaxUnramifiedCompletion.padic_witt
/- For `E = ℚ_p`, `Ĕ` is the fraction field of the Witt vectors of `𝔽̄_p`, compatibly with
Frobenius and with the integers. -/
example (p : ℕ) [Fact p.Prime] :
    ∃ e : Breve ℚ_[p] ≃+* FractionRing (WittVector p (AlgebraicClosure (ZMod p))),
      (∀ x, e (frobenius ℚ_[p] x) =
        WittVector.FractionRing.frobenius p (AlgebraicClosure (ZMod p)) (e x)) ∧
      ∀ x, x ∈ 𝒪[Breve ℚ_[p]] ↔
        e x ∈ Set.range (algebraMap (WittVector p (AlgebraicClosure (ZMod p)))
          (FractionRing (WittVector p (AlgebraicClosure (ZMod p))))) := sorry

-- Test MaxUnramifiedCompletion.ramificationIndex_one
/- A uniformizer of `E` has no square root in `Ĕ`; it would have valuation `ω = 1/2`. -/
example (ϖ : 𝒪[E]) (hϖ : Irreducible ϖ) (x : Breve E) :
    x ^ 2 ≠ algebraMap E (Breve E) ϖ := sorry

-- Test MaxUnramifiedCompletion.not_algebraic
example [CharZero E] : ¬ Algebra.IsAlgebraic E (Breve E) := sorry

-- Test MaxUnramifiedCompletion.frobenius_ne_one
example : frobenius E ≠ AlgEquiv.refl := sorry

/-- Rational points are the Frobenius-fixed points of `Ĕ`-points. -/
theorem points_eq_fixedPoints (A : Type u) [CommRing A] [Algebra E A] :
    ∀ x : A →ₐ[E] Breve E, ((frobenius E).toAlgHom.comp x = x) ↔
      ∃ y : A →ₐ[E] E, (Algebra.ofId E (Breve E)).comp y = x := sorry

end MaxUnramifiedCompletion

/-! ## Layer RG2.0a: Weil restriction and the Deligne torus -/

namespace WeilRestriction

section Functor

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  (A' : Type u) [CommRing A'] [Algebra k' A']

@[simp] theorem functor_obj (R : CommAlgCat.{u} k) :
    (functor k k' A').obj R = (A' →ₐ[k'] k' ⊗[k] R) := rfl

theorem functor_map_apply {R S : CommAlgCat.{u} k} (f : R ⟶ S) (x : A' →ₐ[k'] k' ⊗[k] R) :
    (functor k k' A').map f x = (Algebra.TensorProduct.map (AlgHom.id k' k') f.hom).comp x := rfl

/-- Functoriality of the Weil restriction functor in the algebra: a `k'`-algebra map
`φ : B' → A'` acts on points by precomposition. -/
def functorMap {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A') :
    functor k k' A' ⟶ functor k k' B' where
  app _ := TypeCat.ofHom fun x => x.comp φ
  naturality _ _ _ := rfl

theorem functorMap_app {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A')
    (R : CommAlgCat.{u} k) (x : A' →ₐ[k'] k' ⊗[k] R) :
    (functorMap k k' A' φ).app R x = x.comp φ := rfl

-- Test WeilRestriction.functor_affineLine
example (R : Type u) [CommRing R] [Algebra k R] :
    Function.Bijective (fun x : (functor k k' (Polynomial k')).obj (CommAlgCat.of k R) =>
      (show Polynomial k' →ₐ[k'] k' ⊗[k] R from x) Polynomial.X) :=
  ⟨fun _ _ h => Polynomial.algHom_ext h, fun t => ⟨Polynomial.aeval t, Polynomial.aeval_X t⟩⟩

-- Test WeilRestriction.functor_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (B : Type u) [CommRing B] [Algebra k B] :
    (functor k k B).obj (CommAlgCat.of k R) ≃ (B →ₐ[k] R) :=
  AlgEquiv.arrowCongr AlgEquiv.refl (Algebra.TensorProduct.lid k R)

-- Test WeilRestriction.functor_empty
/- The restriction of the empty scheme `Spec 0` has no points over `R` as soon as `k' ⊗_k R` is
nonzero. -/
example (R : Type u) [CommRing R] [Algebra k R] [Nontrivial (k' ⊗[k] R)] :
    IsEmpty ((functor k k' PUnit.{u + 1}).obj (CommAlgCat.of k R)) := by
  refine ⟨fun (f : PUnit.{u + 1} →ₐ[k'] k' ⊗[k] R) => ?_⟩
  have h1 : f 1 = 1 := map_one f
  have h0 : f 0 = 0 := map_zero f
  rw [show (1 : PUnit.{u + 1}) = 0 from Subsingleton.elim _ _, h0] at h1
  exact zero_ne_one h1

-- Test WeilRestriction.functorMap_id
example : functorMap k k' A' (AlgHom.id k' A') = 𝟙 (functor k k' A') := rfl

-- Test WeilRestriction.functorMap_origin
/- The `k'`-point `t ↦ 0` of the line, `k'[t] → k'`, induces on points of the restriction the map
from the one-point scheme to the line with value the origin. -/
example (R : CommAlgCat.{u} k) (x : k' →ₐ[k'] k' ⊗[k] R) :
    (functorMap k k' k' (Polynomial.aeval (0 : k'))).app R x =
      (Polynomial.aeval 0 : Polynomial k' →ₐ[k'] k' ⊗[k] R) := by
  rw [functorMap_app]
  exact Polynomial.algHom_ext (by simp)

-- Test WeilRestriction.functorMap_units_injective
/- The open immersion `G_m ⊂ 𝔸¹`, `k'[t] → k'[t, t⁻¹]`, induces an injection on points. -/
example (R : Type u) [CommRing R] [Algebra k R] :
    Function.Injective ((functorMap k k' (LaurentPolynomial k')
      (Polynomial.toLaurentAlg (R := k'))).app (CommAlgCat.of k R)) := sorry

end Functor

-- Test WeilRestriction.functor_not_base_change
example : ¬ Nonempty (Res ℝ ℂ (Polynomial ℂ) ≃ₐ[ℝ] Polynomial ℝ) := sorry

/-- The universal element `u : A' → k' ⊗_k Res A'`, for `k → k'` finite locally free; it is fixed
by `homEquiv_apply`. -/
def universal (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k'] (A' : Type u) [CommRing A'] [Algebra k' A'] :
    A' →ₐ[k'] k' ⊗[k] Res k k' A' := sorry

section Representing

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Projective k k'] (A' : Type u) [CommRing A'] [Algebra k' A']

theorem homEquiv_apply (R : Type u) [CommRing R] [Algebra k R] (φ : Res k k' A' →ₐ[k] R) :
    homEquiv k k' A' R φ =
      (Algebra.TensorProduct.map (AlgHom.id k' k') φ).comp (universal k k' A') := sorry

theorem homEquiv_naturality {R S : Type u} [CommRing R] [Algebra k R] [CommRing S] [Algebra k S]
    (ψ : R →ₐ[k] S) (φ : Res k k' A' →ₐ[k] R) :
    homEquiv k k' A' S (ψ.comp φ) =
      (Algebra.TensorProduct.map (AlgHom.id k' k') ψ).comp (homEquiv k k' A' R φ) := sorry

/-- Functoriality of the representing algebra: `φ : B' → A'` induces the map `Res B' → Res A'`
classifying the point `u ∘ φ` of `B'` with values in `Res A'`. -/
def map {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A') :
    Res k k' B' →ₐ[k] Res k k' A' :=
  (homEquiv k k' B' (Res k k' A')).symm ((universal k k' A').comp φ)

@[simp] theorem map_id : map k k' A' (AlgHom.id k' A') = AlgHom.id k (Res k k' A') := sorry

/-- Naturality of `homEquiv` in the algebra: precomposition with `map φ` corresponds to
precomposition with `φ`. -/
theorem homEquiv_comp_map {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A')
    (R : Type u) [CommRing R] [Algebra k R] (ψ : Res k k' A' →ₐ[k] R) :
    homEquiv k k' B' R (ψ.comp (map k k' A' φ)) = (homEquiv k k' A' R ψ).comp φ := sorry

theorem hom_ext {R : Type u} [CommRing R] [Algebra k R] {φ ψ : Res k k' A' →ₐ[k] R}
    (h : homEquiv k k' A' R φ = homEquiv k k' A' R ψ) : φ = ψ := sorry

-- Test WeilRestriction.homEquiv_zero_extension
/- For `k' = 0` the target `Hom(A', 0 ⊗_k R)` of `homEquiv` is a singleton, so `Res A'` has at
most one map to every `R`. -/
example (B : Type u) [CommRing B] [Algebra PUnit.{u + 1} B] (R : Type u) [CommRing R]
    [Algebra k R] : Subsingleton (Res k PUnit.{u + 1} B →ₐ[k] R) :=
  have : Subsingleton (B →ₐ[PUnit.{u + 1}] PUnit.{u + 1} ⊗[k] R) :=
    ⟨fun _ _ => AlgHom.ext fun _ => Subsingleton.elim _ _⟩
  (homEquiv k PUnit.{u + 1} B R).subsingleton

-- Test WeilRestriction.homEquiv_point
/- The restriction of the point `Spec k'` is the point `Spec k`: through `homEquiv`, there is
exactly one map from `Res k'` to every `R`. -/
example (R : Type u) [CommRing R] [Algebra k R] : Nonempty (Unique (Res k k' k' →ₐ[k] R)) :=
  have : Unique (k' →ₐ[k'] k' ⊗[k] R) := uniqueOfSubsingleton (Algebra.ofId k' _)
  ⟨(homEquiv k k' k' R).unique⟩

-- Test WeilRestriction.homEquiv_two_points_complex
/- `X' = Spec ℂ[t]/(t² + 1)` is two points over `ℂ`; through `homEquiv` and `ℂ ⊗_ℝ ℝ ≅ ℂ` its
restriction to `ℝ` has exactly two `ℝ`-points. -/
example : Nat.card (Res ℝ ℂ (AdjoinRoot (Polynomial.X ^ 2 + 1 : Polynomial ℂ)) →ₐ[ℝ] ℝ) = 2 :=
  sorry

-- Test WeilRestriction.universal_trivial_extension
/- For `k' = k` the universal map, read in `k ⊗_k Res A' ≅ Res A'`, is an isomorphism. -/
example (B : Type u) [CommRing B] [Algebra k B] :
    Function.Bijective
      ((Algebra.TensorProduct.lid k (Res k k B)).toAlgHom.comp (universal k k B)) := sorry

-- Test WeilRestriction.universal_affineLine_complex
/- In the `ℝ`-basis `1, i` of `ℂ` the universal point of the line is `t ↦ 1 ⊗ x + i ⊗ y`, with
`x, y` free coordinates of `Res_{ℂ/ℝ} ℂ[t] ≅ ℝ[x, y]`. -/
example : ∃ e : Res ℝ ℂ (Polynomial ℂ) ≃ₐ[ℝ] MvPolynomial (Fin 2) ℝ,
    universal ℝ ℂ (Polynomial ℂ) Polynomial.X =
      (1 : ℂ) ⊗ₜ[ℝ] e.symm (MvPolynomial.X 0) + Complex.I ⊗ₜ[ℝ] e.symm (MvPolynomial.X 1) :=
  sorry

-- Test WeilRestriction.universal_not_surjective_complex
/- For `ℂ/ℝ` the universal map of the line is `t ↦ x + iy` from `ℂ[t]` to `ℂ ⊗_ℝ ℝ[x, y] = ℂ[x, y]`;
unlike the case `k' = k`, it is not surjective. -/
example : ¬ Function.Surjective (universal ℝ ℂ (Polynomial ℂ)) := sorry

/-- For a basis `b` of `k'` over `k`, `Res` of affine `n`-space over `k'` is affine `dn`-space over
`k` in the coordinates of the universal point: `u(X_j) = ∑_i b_i ⊗ Y_{ij}`
(Bruhat–Tits II, 1.5.10, p. 29). -/
theorem basisPresentation {d n : ℕ} (b : Module.Basis (Fin d) k k') :
    ∃ e : Res k k' (MvPolynomial (Fin n) k') ≃ₐ[k] MvPolynomial (Fin d × Fin n) k,
      ∀ j, universal k k' (MvPolynomial (Fin n) k') (MvPolynomial.X j) =
        ∑ i, b i ⊗ₜ[k] e.symm (MvPolynomial.X (i, j)) := sorry

/-- Finite presentation is inherited (Bruhat–Tits II, 1.5.8, p. 28). -/
theorem finitePresentation_res [Algebra.FinitePresentation k' A'] :
    Algebra.FinitePresentation k (Res k k' A') := sorry

-- Test WeilRestriction.res_affineLine_free
example {d : ℕ} (b : Module.Basis (Fin d) k k') :
    Nonempty (Res k k' (Polynomial k') ≃ₐ[k] MvPolynomial (Fin d) k) := sorry

-- Test WeilRestriction.res_self
example (B : Type u) [CommRing B] [Algebra k B] : Nonempty (Res k k B ≃ₐ[k] B) := sorry

-- Test WeilRestriction.res_split_extension
example (B : Type u) [CommRing B] [Algebra k B] :
    Nonempty (Res k (k × k) ((k × k) ⊗[k] B) ≃ₐ[k] B ⊗[k] B) := sorry

-- Test WeilRestriction.res_zero_extension
example (B : Type u) [CommRing B] [Algebra PUnit.{u + 1} B] :
    Nonempty (Res k PUnit.{u + 1} B ≃ₐ[k] k) := sorry

-- Test WeilRestriction.res_zero_algebra
example [Module.FaithfullyFlat k k'] : Subsingleton (Res k k' PUnit.{u + 1}) := sorry

-- Test WeilRestriction.res_units_complex
example : Nonempty (Res ℝ ℂ (LaurentPolynomial ℂ) ≃ₐ[ℝ]
    Localization.Away (MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 : MvPolynomial (Fin 2) ℝ)) :=
  sorry

-- Test WeilRestriction.res_not_flat
/- Over `O = ℤ_p`, `O' = O[ε]/(ε²)` is finite free and `A' = O'[x]/(x² - pε)` is free over `O'`, but
`Res A' = O[a, b]/(a², 2ab - p)` has the nonzero `p`-torsion element `a`, so it is not flat. -/
example (p : ℕ) [Fact p.Prime] :
    Module.Flat (DualNumber ℤ_[p])
        (AdjoinRoot (Polynomial.X ^ 2 -
          Polynomial.C ((p : DualNumber ℤ_[p]) * DualNumber.eps))) ∧
      ¬ Module.Flat ℤ_[p] (Res ℤ_[p] (DualNumber ℤ_[p])
        (AdjoinRoot (Polynomial.X ^ 2 -
          Polynomial.C ((p : DualNumber ℤ_[p]) * DualNumber.eps)))) := sorry

/-- Finite type is inherited (Bruhat–Tits II, 1.5.8, p. 28). -/
theorem finiteType_res [Algebra.FiniteType k' A'] : Algebra.FiniteType k (Res k k' A') := sorry

/-- Formal smoothness and smoothness are inherited. -/
theorem formallySmooth_res [Algebra.FormallySmooth k' A'] :
    Algebra.FormallySmooth k (Res k k' A') := sorry

theorem smooth_res [Algebra.Smooth k' A'] : Algebra.Smooth k (Res k k' A') := sorry

/-- Surjections (closed immersions) are preserved (Bruhat–Tits II, 1.5.9, p. 28). -/
theorem map_surjective {B' : Type u} [CommRing B'] [Algebra k' B'] (φ : B' →ₐ[k'] A')
    (hφ : Function.Surjective φ) : Function.Surjective (map k k' A' φ) := sorry

-- Test WeilRestriction.res_point
example :
    Nonempty (Res k k' (Polynomial k' ⧸ Ideal.span {(Polynomial.X : Polynomial k')}) ≃ₐ[k] k) :=
  sorry

/-- The map `Res_{k'/k}(k' ⊗_k B) → B` classifying the identity point of `k' ⊗_k B`; for schemes it
is the diagonal `X → Res_{k'/k}(X_{k'})`. -/
def adjunctionUnit (B : Type u) [CommRing B] [Algebra k B] :
    Res k k' (k' ⊗[k] B) →ₐ[k] B :=
  (homEquiv k k' (k' ⊗[k] B) B).symm (AlgHom.id k' (k' ⊗[k] B))

/-- For `k'` faithfully flat the diagonal is a closed immersion (Bruhat–Tits II, 1.5.11, p. 29). -/
theorem adjunctionUnit_surjective [Module.FaithfullyFlat k k'] (B : Type u) [CommRing B]
    [Algebra k B] : Function.Surjective (adjunctionUnit k k' B) := sorry

-- Test WeilRestriction.adjunctionUnit_trivial_extension
example (B : Type u) [CommRing B] [Algebra k B] : Function.Bijective (adjunctionUnit k k B) :=
  sorry

-- Test WeilRestriction.adjunctionUnit_zero_extension
example [Nontrivial k] :
    ¬ Function.Surjective (adjunctionUnit k PUnit.{u + 1} (Polynomial k)) := sorry

-- Test WeilRestriction.adjunctionUnit_not_injective_complex
/- For `ℂ/ℝ` and `B = ℝ[t]` the unit is `ℝ[x, y] → ℝ[t]`, `x ↦ t`, `y ↦ 0`: the diagonal
`𝔸¹ → Res_{ℂ/ℝ} 𝔸¹_ℂ = 𝔸²`, `t ↦ (t, 0)`, is a closed immersion but not an isomorphism. -/
example : ¬ Function.Injective (adjunctionUnit ℝ ℂ (Polynomial ℝ)) := sorry

end Representing

/-- The dimension formula for a finite separable field extension and `A'` of finite type. It
follows from the splitting of `Res A'` over a separable closure into a tensor product of `[k' : k]`
conjugates of `A'` (Bruhat–Tits II, 1.5.15, p. 31), since dimension does not change under field
extension. -/
theorem ringKrullDim_res (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k'] (A' : Type u) [CommRing A']
    [Algebra k' A'] [Algebra.FiniteType k' A'] :
    ringKrullDim (Res k k' A') = (Module.finrank k k' : WithBot ℕ∞) * ringKrullDim A' := sorry

-- Test WeilRestriction.res_dim_affineSpace
example (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k'] [FiniteDimensional k k']
    (n : ℕ) : ringKrullDim (Res k k' (MvPolynomial (Fin n) k')) = (Module.finrank k k' * n : ℕ) :=
  sorry

-- Test WeilRestriction.res_dim_inseparable
/- Non-example for the dimension formula without separability: for `k'/k` purely inseparable of
degree `p` and `a ∈ k` not a `p`-th power in `k'`, `X' = Spec k'[x]/(x^p - a)` is a point, while
`Res X' = Spec k[c₀, …, c_{p-1}]/(∑ βⁱ cᵢ^p - a)` (with `k' = k(β^{1/p})`) has dimension `p - 1`. -/
example (p : ℕ) [Fact p.Prime] (k : Type u) [Field k] [CharP k p] (k' : Type u) [Field k']
    [Algebra k k'] [FiniteDimensional k k'] [IsPurelyInseparable k k']
    (hp : Module.finrank k k' = p) (a : k) (ha : ∀ y : k', y ^ p ≠ algebraMap k k' a) :
    ringKrullDim (Res k k' (AdjoinRoot (Polynomial.X ^ p - Polynomial.C (algebraMap k k' a)))) =
      (p - 1 : ℕ) := sorry

/-- Base change: `Res_{k'/k}(A') ⊗_k l ≃ Res_{l'/l}(A' ⊗_{k'} l')` with `l' = l ⊗_k k'`. It is
fixed by `homEquiv_baseChangeEquiv`. -/
def baseChangeEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k'] (A' : Type u) [CommRing A'] [Algebra k' A']
    (l : Type u) [CommRing l] [Algebra k l] :
    letI : Algebra k' (l ⊗[k] k') := Algebra.TensorProduct.rightAlgebra
    l ⊗[k] Res k k' A' ≃ₐ[l] Res l (l ⊗[k] k') ((l ⊗[k] k') ⊗[k'] A') := sorry

/-- `baseChangeEquiv` respects the universal properties: for an `l`-algebra `T` and
`g : Res_{l'/l}(A'_{l'}) → T`, the point of `A'` classified by `g ∘ baseChangeEquiv` on
`1 ⊗ Res A'` is the restriction to `A'` of the point classified by `g`, read in `k' ⊗_k T` through
`l' ⊗_l T ≃ T ⊗_l l' ≃ T ⊗_k k' ≃ k' ⊗_k T` (Mathlib `Algebra.TensorProduct.cancelBaseChange`). -/
theorem homEquiv_baseChangeEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k']
    [Algebra k k'] [Module.Finite k k'] [Module.Projective k k'] (A' : Type u) [CommRing A']
    [Algebra k' A'] (l : Type u) [CommRing l] [Algebra k l] (T : Type u) [CommRing T]
    [Algebra l T] [Algebra k T] [IsScalarTower k l T]
    (g : (letI : Algebra k' (l ⊗[k] k') := Algebra.TensorProduct.rightAlgebra
      Res l (l ⊗[k] k') ((l ⊗[k] k') ⊗[k'] A')) →ₐ[l] T) (a : A') :
    letI : Algebra k' (l ⊗[k] k') := Algebra.TensorProduct.rightAlgebra
    homEquiv k k' A' T (((g.comp (baseChangeEquiv k k' A' l).toAlgHom).restrictScalars k).comp
        Algebra.TensorProduct.includeRight) a =
      (Algebra.TensorProduct.comm k T k')
        ((Algebra.TensorProduct.cancelBaseChange k l l T k')
          ((Algebra.TensorProduct.comm l (l ⊗[k] k') T)
            (homEquiv l (l ⊗[k] k') ((l ⊗[k] k') ⊗[k'] A') T g (1 ⊗ₜ a)))) := sorry

-- Test WeilRestriction.baseChangeEquiv_natural
/- `baseChangeEquiv` is natural in `A'`: for `φ : B' → A'` it intertwines `id_l ⊗ map φ` with
`map (id_{l'} ⊗ φ)`. A twist of `baseChangeEquiv` by an automorphism that is not natural in `A'`
fails this. -/
example (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k'] [Module.Finite k k']
    [Module.Projective k k'] (A' B' : Type u) [CommRing A'] [Algebra k' A'] [CommRing B']
    [Algebra k' B'] (φ : B' →ₐ[k'] A') (l : Type u) [CommRing l] [Algebra k l] :
    letI : Algebra k' (l ⊗[k] k') := Algebra.TensorProduct.rightAlgebra
    (baseChangeEquiv k k' A' l).toAlgHom.comp
        (Algebra.TensorProduct.map (AlgHom.id l l) (map k k' A' φ)) =
      (map l (l ⊗[k] k') ((l ⊗[k] k') ⊗[k'] A')
          (Algebra.TensorProduct.map (AlgHom.id (l ⊗[k] k') (l ⊗[k] k')) φ)).comp
        (baseChangeEquiv k k' B' l).toAlgHom := sorry

-- Test WeilRestriction.baseChangeEquiv_complex_points
/- For `ℂ/ℝ`, `l = ℂ` and `A' = ℂ[t]/(t² + 1)`: `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`, so by `baseChangeEquiv` the base
change `ℂ ⊗_ℝ Res A'` is the restriction along `ℂ → ℂ × ℂ` of two conjugate copies of `A'`, with
`2 · 2 = 4` points over `ℂ`. -/
example : Nat.card (ℂ ⊗[ℝ] Res ℝ ℂ (AdjoinRoot (Polynomial.X ^ 2 + 1 : Polynomial ℂ)) →ₐ[ℂ] ℂ) =
    4 := sorry

-- Test WeilRestriction.baseChangeEquiv_units_complex
/- For `ℂ/ℝ`, `l = ℂ` and `A' = ℂ[t, t⁻¹]`, `baseChangeEquiv` and `ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ` give
`ℂ ⊗_ℝ Res_{ℂ/ℝ} G_m ≅ G_m × G_m` over `ℂ`. -/
example : Nonempty (ℂ ⊗[ℝ] Res ℝ ℂ (LaurentPolynomial ℂ) ≃ₐ[ℂ]
    LaurentPolynomial ℂ ⊗[ℂ] LaurentPolynomial ℂ) := sorry

/-- Transitivity for towers `k → k' → k''`. It is fixed by `homEquiv_compEquiv`. -/
def compEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k']
    (k'' : Type u) [CommRing k''] [Algebra k' k''] [Algebra k k''] [IsScalarTower k k' k'']
    [Module.Finite k' k''] [Module.Projective k' k'']
    (A'' : Type u) [CommRing A''] [Algebra k'' A''] :
    Res k k' (Res k' k'' A'') ≃ₐ[k] Res k k'' A'' := sorry

/-- `compEquiv` is the tensor associator on points: an `R`-point of `Res_{k''/k} A''` and the
corresponding point of `Res_{k'/k} Res_{k''/k'} A''` give the same `k''`-algebra map out of `A''`,
through `k'' ⊗_{k'} (k' ⊗_k R) ≃ k'' ⊗_k R`. The finiteness and projectivity of `k''` over `k`
follow from the tower and are listed as instance arguments. -/
theorem homEquiv_compEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k']
    (k'' : Type u) [CommRing k''] [Algebra k' k''] [Algebra k k''] [IsScalarTower k k' k'']
    [Module.Finite k' k''] [Module.Projective k' k'']
    [Module.Finite k k''] [Module.Projective k k'']
    (A'' : Type u) [CommRing A''] [Algebra k'' A''] (R : Type u) [CommRing R] [Algebra k R]
    (x : Res k k'' A'' →ₐ[k] R) :
    homEquiv k k'' A'' R x =
      (Algebra.TensorProduct.cancelBaseChange k k' k'' k'' R).toAlgHom.comp
        (homEquiv k' k'' A'' (k' ⊗[k] R)
          (homEquiv k k' (Res k' k'' A'') R (x.comp (compEquiv k k' k'' A'').toAlgHom))) := sorry

-- Test WeilRestriction.compEquiv_trivial_bottom
/- For the tower `k → k → k''`, `compEquiv` composed with the isomorphism `B ≅ Res_{k/k} B` given
by the universal map (`B = Res_{k''/k} A''`) is the identity. -/
example (k : Type u) [CommRing k] (k'' : Type u) [CommRing k''] [Algebra k k'']
    [Module.Finite k k''] [Module.Projective k k''] (A'' : Type u) [CommRing A'']
    [Algebra k'' A''] :
    (compEquiv k k k'' A'').toAlgHom.comp
        ((Algebra.TensorProduct.lid k (Res k k (Res k k'' A''))).toAlgHom.comp
          (universal k k (Res k k'' A''))) = AlgHom.id k (Res k k'' A'') := sorry

-- Test WeilRestriction.compEquiv_trivial_top
/- For the tower `k → k' → k'`, `compEquiv` composed with `map` of the isomorphism
`A'' ≅ Res_{k'/k'} A''` given by the universal map is the identity. -/
example (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k'] [Module.Finite k k']
    [Module.Projective k k'] (A'' : Type u) [CommRing A''] [Algebra k' A''] :
    (compEquiv k k' k' A'').toAlgHom.comp
        (map k k' (Res k' k' A'')
          ((Algebra.TensorProduct.lid k' (Res k' k' A'')).toAlgHom.comp (universal k' k' A''))) =
      AlgHom.id k (Res k k' A'') := sorry

-- Test WeilRestriction.compEquiv_natural
/- `compEquiv` is natural in `A''`. -/
example (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k'] [Module.Finite k k']
    [Module.Projective k k'] (k'' : Type u) [CommRing k''] [Algebra k' k''] [Algebra k k'']
    [IsScalarTower k k' k''] [Module.Finite k' k''] [Module.Projective k' k'']
    [Module.Finite k k''] [Module.Projective k k''] (A'' B'' : Type u) [CommRing A'']
    [Algebra k'' A''] [CommRing B''] [Algebra k'' B''] (φ : B'' →ₐ[k''] A'') :
    (compEquiv k k' k'' A'').toAlgHom.comp (map k k' (Res k' k'' A'') (map k' k'' A'' φ)) =
      (map k k'' A'' φ).comp (compEquiv k k' k'' B'').toAlgHom := sorry

/-- Products: `Res(A' ⊗ B') ≃ Res A' ⊗ Res B'`. It is fixed by `homEquiv_tensorEquiv`. -/
def tensorEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k']
    (A' B' : Type u) [CommRing A'] [Algebra k' A'] [CommRing B'] [Algebra k' B'] :
    Res k k' (A' ⊗[k'] B') ≃ₐ[k] Res k k' A' ⊗[k] Res k k' B' := sorry

/-- On points, `tensorEquiv` pairs the two factors: the point of `A' ⊗ B'` classified by
`x ∘ tensorEquiv` is the product of the points of `A'` and `B'` classified by the restrictions
of `x` to the two tensor factors. -/
theorem homEquiv_tensorEquiv (k : Type u) [CommRing k] (k' : Type u) [CommRing k']
    [Algebra k k'] [Module.Finite k k'] [Module.Projective k k']
    (A' B' : Type u) [CommRing A'] [Algebra k' A'] [CommRing B'] [Algebra k' B']
    (R : Type u) [CommRing R] [Algebra k R] (x : Res k k' A' ⊗[k] Res k k' B' →ₐ[k] R) :
    homEquiv k k' (A' ⊗[k'] B') R (x.comp (tensorEquiv k k' A' B').toAlgHom) =
      Algebra.TensorProduct.productMap
        (homEquiv k k' A' R (x.comp Algebra.TensorProduct.includeLeft))
        (homEquiv k k' B' R (x.comp Algebra.TensorProduct.includeRight)) := sorry

-- Test WeilRestriction.tensorEquiv_includeLeft
/- The first factor `Res A' → Res A' ⊗ Res B'` corresponds under `tensorEquiv` to `map` of
`A' → A' ⊗ B'`; the twist of `tensorEquiv` by the swap of factors (for `A' = B'`) fails this. -/
example (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k'] [Module.Finite k k']
    [Module.Projective k k'] (A' B' : Type u) [CommRing A'] [Algebra k' A'] [CommRing B']
    [Algebra k' B'] :
    (tensorEquiv k k' A' B').symm.toAlgHom.comp
        (Algebra.TensorProduct.includeLeft : Res k k' A' →ₐ[k] Res k k' A' ⊗[k] Res k k' B') =
      map k k' (A' ⊗[k'] B')
        (Algebra.TensorProduct.includeLeft : A' →ₐ[k'] A' ⊗[k'] B') := sorry

-- Test WeilRestriction.tensorEquiv_includeRight
example (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k'] [Module.Finite k k']
    [Module.Projective k k'] (A' B' : Type u) [CommRing A'] [Algebra k' A'] [CommRing B']
    [Algebra k' B'] :
    (tensorEquiv k k' A' B').symm.toAlgHom.comp
        (Algebra.TensorProduct.includeRight : Res k k' B' →ₐ[k] Res k k' A' ⊗[k] Res k k' B') =
      map k k' (A' ⊗[k'] B') (Algebra.TensorProduct.includeRight : B' →ₐ[k'] A' ⊗[k'] B') :=
  sorry

-- Test WeilRestriction.tensorEquiv_comm
/- `tensorEquiv` is compatible with the commutativity of the tensor products on both sides. -/
example (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k'] [Module.Finite k k']
    [Module.Projective k k'] (A' B' : Type u) [CommRing A'] [Algebra k' A'] [CommRing B']
    [Algebra k' B'] :
    (tensorEquiv k k' B' A').toAlgHom.comp
        (map k k' (B' ⊗[k'] A') (Algebra.TensorProduct.comm k' A' B').toAlgHom) =
      (Algebra.TensorProduct.comm k (Res k k' A') (Res k k' B')).toAlgHom.comp
        (tensorEquiv k k' A' B').toAlgHom := sorry

/-- The splitting over a separably closed field `Ω`: `Ω`-points of `Res A'` are tuples of
`Ω`-points of the conjugates `A' ⊗_{k',τ} Ω`, one for each `k`-embedding `τ : k' → Ω`. It is
fixed by `splittingEquiv_apply`. -/
def splittingEquiv (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k'] (Ω : Type u) [Field Ω] [Algebra k Ω]
    [IsSepClosed Ω] (A' : Type u) [CommRing A'] [Algebra k' A'] :
    (Res k k' A' →ₐ[k] Ω) ≃
      ((τ : k' →ₐ[k] Ω) → (letI : Algebra k' Ω := τ.toRingHom.toAlgebra; A' →ₐ[k'] Ω)) := sorry

/-- The `τ`-component of `splittingEquiv x` is the point `homEquiv x : A' → k' ⊗_k Ω` followed by
`c ⊗ ω ↦ τ(c) ω`. -/
theorem splittingEquiv_apply (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k'] (Ω : Type u) [Field Ω] [Algebra k Ω]
    [IsSepClosed Ω] (A' : Type u) [CommRing A'] [Algebra k' A'] (x : Res k k' A' →ₐ[k] Ω)
    (τ : k' →ₐ[k] Ω) (a : A') :
    (letI : Algebra k' Ω := τ.toRingHom.toAlgebra; (splittingEquiv k k' Ω A' x τ : A' →ₐ[k'] Ω) a) =
      Algebra.TensorProduct.productMap τ (AlgHom.id k Ω) (homEquiv k k' A' Ω x a) := sorry

-- Test WeilRestriction.splittingEquiv_complex
/- For `ℂ/ℝ` and `Ω = ℂ`: if a `ℂ`-point `x` of `Res A'` has `homEquiv x (a) = 1 ⊗ α + i ⊗ β`,
then its component at the identity embedding takes the value `α + iβ` at `a`, and its component
at complex conjugation the value `α − iβ`. -/
example (A' : Type) [CommRing A'] [Algebra ℂ A'] (x : Res ℝ ℂ A' →ₐ[ℝ] ℂ) (a : A') (α β : ℂ)
    (hx : homEquiv ℝ ℂ A' ℂ x a = (1 : ℂ) ⊗ₜ α + Complex.I ⊗ₜ β) :
    (letI : Algebra ℂ ℂ := (AlgHom.id ℝ ℂ).toRingHom.toAlgebra;
      (splittingEquiv ℝ ℂ ℂ A' x (AlgHom.id ℝ ℂ) : A' →ₐ[ℂ] ℂ) a) = α + Complex.I * β ∧
    (letI : Algebra ℂ ℂ := Complex.conjAe.toAlgHom.toRingHom.toAlgebra;
      (splittingEquiv ℝ ℂ ℂ A' x Complex.conjAe.toAlgHom : A' →ₐ[ℂ] ℂ) a) =
      α - Complex.I * β := sorry

-- Test WeilRestriction.splittingEquiv_galois
/- An automorphism `σ` of `Ω` over `k` carries the `σ⁻¹ τ`-component of a point to the
`τ`-component of its image. -/
example (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k'] [FiniteDimensional k k']
    [Algebra.IsSeparable k k'] (Ω : Type u) [Field Ω] [Algebra k Ω] [IsSepClosed Ω]
    (A' : Type u) [CommRing A'] [Algebra k' A'] (σ : Ω ≃ₐ[k] Ω) (x : Res k k' A' →ₐ[k] Ω)
    (τ : k' →ₐ[k] Ω) (a : A') :
    (letI : Algebra k' Ω := τ.toRingHom.toAlgebra;
      (splittingEquiv k k' Ω A' ((σ : Ω →ₐ[k] Ω).comp x) τ : A' →ₐ[k'] Ω) a) =
      σ (letI : Algebra k' Ω := ((σ.symm : Ω →ₐ[k] Ω).comp τ).toRingHom.toAlgebra;
        (splittingEquiv k k' Ω A' x ((σ.symm : Ω →ₐ[k] Ω).comp τ) : A' →ₐ[k'] Ω) a) := sorry

-- Test WeilRestriction.splittingEquiv_needs_sepClosed
/- Non-example: `Ω = ℝ` is not separably closed and there is no `ℝ`-embedding `ℂ → ℝ`, so the
target of `splittingEquiv` would be a single point, while `Res_{ℂ/ℝ} 𝔸¹` has the `ℝ`-points `ℂ`. -/
example : ¬ Nonempty ((Res ℝ ℂ (Polynomial ℂ) →ₐ[ℝ] ℝ) ≃
    ((τ : ℂ →ₐ[ℝ] ℝ) → (letI : Algebra ℂ ℝ := τ.toRingHom.toAlgebra;
      Polynomial ℂ →ₐ[ℂ] ℝ))) := sorry

open scoped PointTopology in
/-- Topology on points: for a finite extension of nonarchimedean local fields and `A'` of finite
type, `homEquiv` at `R = E` followed by `E' ⊗_E E ≃ E'` is a homeomorphism for the point
topologies (Conrad, Example 2.4, p. 3). -/
def pointsHomeomorph {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (E' : Type u) [Field E'] [ValuativeRel E'] [TopologicalSpace E']
    [IsNonarchimedeanLocalField E'] [Algebra E E'] [FiniteDimensional E E']
    (_hcont : Continuous (algebraMap E E')) (A' : Type u)
    [CommRing A'] [Algebra E' A'] [Algebra.FiniteType E' A'] :
    (Res E E' A' →ₐ[E] E) ≃ₜ (A' →ₐ[E'] E') where
  toEquiv := (homEquiv E E' A' E).trans
    (AlgEquiv.arrowCongr AlgEquiv.refl (Algebra.TensorProduct.rid E E' E'))
  continuous_toFun := sorry
  continuous_invFun := sorry

open scoped PointTopology in
-- Test WeilRestriction.pointsHomeomorph_affineLine
/- `Res_{E'/E} 𝔸¹` has the `E`-points `E'` with their own topology: evaluation at `t` after
`pointsHomeomorph` is a homeomorphism onto `E'`. -/
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (E' : Type u) [Field E'] [ValuativeRel E'] [TopologicalSpace E']
    [IsNonarchimedeanLocalField E'] [Algebra E E'] [FiniteDimensional E E']
    (hcont : Continuous (algebraMap E E')) :
    IsHomeomorph (fun x : Res E E' (Polynomial E') →ₐ[E] E =>
      pointsHomeomorph E' hcont (Polynomial E') x Polynomial.X) := sorry

open scoped PointTopology in
-- Test WeilRestriction.pointsHomeomorph_units
/- For `G_m`, evaluation at `t` after `pointsHomeomorph` is an embedding into `E'` with image
`E'ˣ`: the point topology of `G_m(E')` is the subspace topology of `E'ˣ ⊂ E'`, inversion being
continuous. -/
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (E' : Type u) [Field E'] [ValuativeRel E'] [TopologicalSpace E']
    [IsNonarchimedeanLocalField E'] [Algebra E E'] [FiniteDimensional E E']
    (hcont : Continuous (algebraMap E E')) :
    Topology.IsEmbedding (fun x : Res E E' (LaurentPolynomial E') →ₐ[E] E =>
        pointsHomeomorph E' hcont (LaurentPolynomial E') x (LaurentPolynomial.T 1)) ∧
      Set.range (fun x : Res E E' (LaurentPolynomial E') →ₐ[E] E =>
        pointsHomeomorph E' hcont (LaurentPolynomial E') x (LaurentPolynomial.T 1)) =
        {z : E' | IsUnit z} := sorry

/-- Integral points of a Weil restriction: `homEquiv` at `R = O` followed by `O' ⊗_O O ≃ O'`. -/
def integralPointsEquiv (O : Type u) [CommRing O] (O' : Type u) [CommRing O'] [Algebra O O']
    [Module.Finite O O'] [Module.Free O O'] (A' : Type u) [CommRing A'] [Algebra O' A'] :
    (Res O O' A' →ₐ[O] O) ≃ (A' →ₐ[O'] O') :=
  (homEquiv O O' A' O).trans (AlgEquiv.arrowCongr AlgEquiv.refl (Algebra.TensorProduct.rid O O' O'))

-- Test WeilRestriction.integralPointsEquiv_gaussian_units
/- Through `integralPointsEquiv`, the `ℤ`-points of `Res_{ℤ[i]/ℤ} G_m` are the four units
`±1, ±i` of `ℤ[i]`. -/
example : Nat.card (Res ℤ GaussianInt (LaurentPolynomial GaussianInt) →ₐ[ℤ] ℤ) = 4 := sorry

/-- The `O`-algebra automorphisms of `Res_{O'/O} A'` induced by an `O'`-semilinear action of a
group `Γ` on `A'` (compatible with an action of `Γ` on `O'` by `O`-algebra automorphisms). It is
fixed by `homEquiv_inducedAction`. -/
def inducedAction (O : Type u) [CommRing O] (O' : Type u) [CommRing O'] [Algebra O O']
    [Module.Finite O O'] [Module.Projective O O'] (Γ : Type u) [Group Γ]
    (σO : Γ →* (O' ≃ₐ[O] O')) (A' : Type u) [CommRing A'] [Algebra O' A']
    (σA : Γ →* (A' ≃+* A')) (hσ : ∀ γ (c : O') (a : A'), σA γ (c • a) = σO γ c • σA γ a) :
    Γ →* (Res O O' A' ≃ₐ[O] Res O O' A') := sorry

/-- On points, precomposition with `inducedAction γ` sends a point `y : A' → O' ⊗_O R` to
`(σO γ⁻¹ ⊗ id) ∘ y ∘ σA γ`. -/
theorem homEquiv_inducedAction (O : Type u) [CommRing O] (O' : Type u) [CommRing O']
    [Algebra O O'] [Module.Finite O O'] [Module.Projective O O'] (Γ : Type u) [Group Γ]
    (σO : Γ →* (O' ≃ₐ[O] O')) (A' : Type u) [CommRing A'] [Algebra O' A']
    (σA : Γ →* (A' ≃+* A')) (hσ : ∀ γ (c : O') (a : A'), σA γ (c • a) = σO γ c • σA γ a)
    (γ : Γ) (R : Type u) [CommRing R] [Algebra O R] (x : Res O O' A' →ₐ[O] R) (a : A') :
    homEquiv O O' A' R (x.comp (inducedAction O O' Γ σO A' σA hσ γ).toAlgHom) a =
      Algebra.TensorProduct.map (σO γ⁻¹).toAlgHom (AlgHom.id O R)
        (homEquiv O O' A' R x (σA γ a)) := sorry

-- Test WeilRestriction.inducedAction_trivial
example (O : Type u) [CommRing O] (O' : Type u) [CommRing O'] [Algebra O O']
    [Module.Finite O O'] [Module.Projective O O'] (Γ : Type u) [Group Γ]
    (A' : Type u) [CommRing A'] [Algebra O' A'] :
    inducedAction O O' Γ 1 A' 1 (fun _ _ _ => rfl) = 1 := sorry

-- Test WeilRestriction.inducedAction_conj_nontrivial
/- For `ℂ/ℝ`, with `Gal(ℂ/ℝ)` acting on `ℂ` and on the coefficients of `ℂ[t]`, the induced action
on `Res_{ℂ/ℝ} ℂ[t] ≅ ℝ[x, y]` (`t ↦ x + iy`) is `x ↦ x`, `y ↦ −y`; in particular it is not
trivial. -/
example (σA : (ℂ ≃ₐ[ℝ] ℂ) →* (Polynomial ℂ ≃+* Polynomial ℂ))
    (hσA : ∀ γ, σA γ = Polynomial.mapEquiv γ.toRingEquiv)
    (hσ : ∀ γ (c : ℂ) (a : Polynomial ℂ),
      σA γ (c • a) = MonoidHom.id (ℂ ≃ₐ[ℝ] ℂ) γ c • σA γ a) :
    inducedAction ℝ ℂ (ℂ ≃ₐ[ℝ] ℂ) (MonoidHom.id _) (Polynomial ℂ) σA hσ ≠ 1 := sorry

-- Test WeilRestriction.inducedAction_conj_fixedPoints
/- Galois descent of the line: the quotient of `Res_{ℂ/ℝ} ℂ[t] ≅ ℝ[x, y]` by the ideal of all
`γ f − f` is `ℝ[x, y]/(2y) ≅ ℝ[t]`. -/
example (σA : (ℂ ≃ₐ[ℝ] ℂ) →* (Polynomial ℂ ≃+* Polynomial ℂ))
    (hσA : ∀ γ, σA γ = Polynomial.mapEquiv γ.toRingEquiv)
    (hσ : ∀ γ (c : ℂ) (a : Polynomial ℂ),
      σA γ (c • a) = MonoidHom.id (ℂ ≃ₐ[ℝ] ℂ) γ c • σA γ a) :
    Nonempty ((Res ℝ ℂ (Polynomial ℂ) ⧸ Ideal.span {f | ∃ (γ : ℂ ≃ₐ[ℝ] ℂ)
      (g : Res ℝ ℂ (Polynomial ℂ)),
        f = inducedAction ℝ ℂ (ℂ ≃ₐ[ℝ] ℂ) (MonoidHom.id _) (Polynomial ℂ) σA hσ γ g - g}) ≃ₐ[ℝ]
      Polynomial ℝ) := sorry

/-- Edixhoven: for `|Γ|` invertible, the fixed-point algebra of the induced action (the quotient
by the ideal generated by `γ f - f`) is smooth when `A'` is smooth (Edixhoven, Prop. 3.4,
pp. 294–295, applied to `smooth_res`). -/
theorem smooth_fixedPoints (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    (O' : Type u) [CommRing O'] [Algebra O O'] [Module.Finite O O'] [Module.Free O O']
    (Γ : Type u) [Group Γ] [Fintype Γ] (hΓ : IsUnit (Fintype.card Γ : O))
    (σO : Γ →* (O' ≃ₐ[O] O')) (A' : Type u) [CommRing A'] [Algebra O' A'] [Algebra.Smooth O' A']
    (σA : Γ →* (A' ≃+* A')) (hσ : ∀ γ (c : O') (a : A'), σA γ (c • a) = σO γ c • σA γ a) :
    Algebra.Smooth O (Res O O' A' ⧸ Ideal.span
      {f | ∃ (γ : Γ) (g : Res O O' A'), f = inducedAction O O' Γ σO A' σA hσ γ g - g}) := sorry

/-! ### Weil restriction of group schemes -/

/-- The Weil restriction of a commutative Hopf algebra: the algebra `Res k k' H'`, carrying the
Hopf structure `instHopfAlgebraRes` when `k'` is finite projective over `k`, for which
`homEquiv` is a group isomorphism on points. -/
def ResHopf (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    (H' : Type u) [CommRing H'] [HopfAlgebra k' H'] : Type u := Res k k' H'

instance (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    (H' : Type u) [CommRing H'] [HopfAlgebra k' H'] : CommRing (ResHopf k k' H') :=
  inferInstanceAs (CommRing (Res k k' H'))

section Hopf

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  (H' : Type u) [CommRing H'] [HopfAlgebra k' H']

/-- The Hopf structure on the representing algebra for a finite locally free base map.
Its underlying algebra is `Res` and its point adjunction is `pointsMulEquiv`. -/
instance instHopfAlgebraRes [Module.Finite k k'] [Module.Projective k k'] :
    HopfAlgebra k (ResHopf k k' H') :=
  letI : Algebra k (ResHopf k k' H') := inferInstanceAs (Algebra k (Res k k' H'))
  letI : Coalgebra k (ResHopf k k' H') := sorry
  letI : Bialgebra k (ResHopf k k' H') := Bialgebra.mk sorry sorry sorry sorry
  letI : HopfAlgebraStruct k (ResHopf k k' H') := { antipode := sorry }
  HopfAlgebra.mk sorry sorry

/-- The underlying algebra of `ResHopf` is `Res`. -/
def resHopfAlgEquiv [Module.Finite k k'] [Module.Projective k k'] : ResHopf k k' H' ≃ₐ[k] Res k k' H' := AlgEquiv.refl

/-- Over a finite locally free base map, the point adjunction is a group equivalence. -/
def pointsMulEquiv [Module.Finite k k'] [Module.Projective k k']
    (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (ResHopf k k' H' →ₐ[k] R) ≃* WithConv (H' →ₐ[k'] k' ⊗[k] R) := sorry

/-- The underlying bijection of `pointsMulEquiv` is `homEquiv`. -/
theorem pointsMulEquiv_apply [Module.Finite k k'] [Module.Projective k k'] (R : Type u) [CommRing R] [Algebra k R]
    (x : WithConv (ResHopf k k' H' →ₐ[k] R)) :
    (pointsMulEquiv k k' H' R x).ofConv = homEquiv k k' H' R x.ofConv := sorry

theorem pointsMulEquiv_naturality [Module.Finite k k'] [Module.Projective k k'] {R S : Type u} [CommRing R] [Algebra k R] [CommRing S]
    [Algebra k S] (ψ : R →ₐ[k] S) (x : WithConv (ResHopf k k' H' →ₐ[k] R)) :
    pointsMulEquiv k k' H' S (WithConv.toConv (ψ.comp x.ofConv)) =
      WithConv.toConv ((Algebra.TensorProduct.map (AlgHom.id k' k') ψ).comp
        (pointsMulEquiv k k' H' R x).ofConv) := sorry

/-- Functoriality in Hopf maps. Its underlying algebra map is `map` (`mapHopf_apply`). -/
def mapHopf [Module.Finite k k'] [Module.Projective k k'] {H'' : Type u} [CommRing H''] [HopfAlgebra k' H''] (φ : H'' →ₐc[k'] H') :
    ResHopf k k' H'' →ₐc[k] ResHopf k k' H' := sorry

theorem mapHopf_apply [Module.Finite k k'] [Module.Projective k k'] {H'' : Type u} [CommRing H''] [HopfAlgebra k' H''] (φ : H'' →ₐc[k'] H')
    (x : ResHopf k k' H'') : mapHopf k k' H' φ x = map k k' H' (φ : H'' →ₐ[k'] H') x := sorry

variable [Module.Finite k k'] [Module.Projective k k']

-- Test WeilRestriction.mapHopf_id
example : mapHopf k k' H' (BialgHom.id k' H') = BialgHom.id k (ResHopf k k' H') := sorry

-- Test WeilRestriction.mapHopf_points
/- On points, composing with `mapHopf φ` is composing with `φ`. -/
example {H'' : Type u} [CommRing H''] [HopfAlgebra k' H''] (φ : H'' →ₐc[k'] H')
    (R : Type u) [CommRing R] [Algebra k R] (x : WithConv (ResHopf k k' H' →ₐ[k] R)) :
    (pointsMulEquiv k k' H'' R (WithConv.toConv (x.ofConv.comp
        (mapHopf k k' H' φ : ResHopf k k' H'' →ₐ[k] ResHopf k k' H')))).ofConv =
      (pointsMulEquiv k k' H' R x).ofConv.comp (φ : H'' →ₐ[k'] H') := sorry

/-- The diagonal `G → Res_{k'/k}(G_{k'})` on points: `x ↦ id_{k'} ⊗ x`, from `G(R)` to
`G_{k'}(k' ⊗_k R)`, the `R`-points of `Res_{k'/k}(G_{k'})`. -/
def diagonal (H : Type u) [CommRing H] [HopfAlgebra k H] (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (H →ₐ[k] R) →* WithConv (k' ⊗[k] H →ₐ[k'] k' ⊗[k] R) where
  toFun x := WithConv.toConv (Algebra.TensorProduct.map (AlgHom.id k' k') x.ofConv)
  map_one' := sorry
  map_mul' := sorry

-- Test WeilRestriction.res_trivial_group
example : Nonempty (ResHopf k k' k' ≃ₐ[k] k) := sorry

end Hopf

-- Test WeilRestriction.pointsMulEquiv_complex
example : Nonempty (WithConv (ResHopf ℝ ℂ (LaurentPolynomial ℂ) →ₐ[ℝ] ℝ) ≃*
    WithConv (LaurentPolynomial ℂ →ₐ[ℂ] ℂ ⊗[ℝ] ℝ)) :=
  ⟨pointsMulEquiv ℝ ℂ _ ℝ⟩

-- Test WeilRestriction.pointsMulEquiv_finiteFreeRing
example : Nonempty (WithConv (ResHopf ℤ (ℤ × ℤ) (LaurentPolynomial (ℤ × ℤ)) →ₐ[ℤ] ℤ) ≃*
    WithConv (LaurentPolynomial (ℤ × ℤ) →ₐ[ℤ × ℤ] (ℤ × ℤ) ⊗[ℤ] ℤ)) :=
  ⟨pointsMulEquiv ℤ (ℤ × ℤ) _ ℤ⟩

-- Test WeilRestriction.pointsMulEquiv_nonflat_rejected
example (p : ℕ) [Fact p.Prime] : ¬ Module.Projective ℤ (ZMod p) := by
  fail_if_success have := pointsMulEquiv ℤ (ZMod p) (LaurentPolynomial (ZMod p)) ℚ
  fail_if_success have : HopfAlgebra ℤ (ResHopf ℤ (ZMod p) (LaurentPolynomial (ZMod p))) :=
    inferInstance
  sorry

/-- Points of `Res G_m` are units of `k' ⊗ R`. -/
def multiplicativeGroupPoints (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k'] (R : Type u) [CommRing R] [Algebra k R] :
    WithConv (ResHopf k k' (LaurentPolynomial k') →ₐ[k] R) ≃* (k' ⊗[k] R)ˣ :=
  (pointsMulEquiv k k' _ R).trans TauCeti.MultiplicativeGroup.pointsMulEquiv

/-- Points of `Res GL_n` are `GL_n(k' ⊗ R)`. -/
def generalLinearPoints (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
    [Module.Finite k k'] [Module.Projective k k'] (n : ℕ) (R : Type u) [CommRing R]
    [Algebra k R] :
    WithConv (ResHopf k k' (TauCeti.GeneralLinear.coordinateHopfAlgebra k' n) →ₐ[k] R) ≃*
      Matrix.GeneralLinearGroup (Fin n) (k' ⊗[k] R) :=
  (pointsMulEquiv k k' _ R).trans (TauCeti.GeneralLinear.pointsMulEquiv n)

section HopfChecks

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Projective k k']

-- Test WeilRestriction.multiplicativeGroupPoints_apply
/- The unit attached to a point is its value on the coordinate `t` of `G_m = Spec k'[t, t⁻¹]`. -/
example (R : Type u) [CommRing R] [Algebra k R]
    (x : WithConv (ResHopf k k' (LaurentPolynomial k') →ₐ[k] R)) :
    ((multiplicativeGroupPoints k k' R x : (k' ⊗[k] R)ˣ) : k' ⊗[k] R) =
      homEquiv k k' (LaurentPolynomial k') R x.ofConv (LaurentPolynomial.T 1) := by
  simp [multiplicativeGroupPoints, pointsMulEquiv_apply]

-- Test WeilRestriction.multiplicativeGroupPoints_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] :
    Nonempty (WithConv (ResHopf k k (LaurentPolynomial k) →ₐ[k] R) ≃* Rˣ) :=
  ⟨(multiplicativeGroupPoints k k R).trans
    (Units.mapEquiv (Algebra.TensorProduct.lid k R).toMulEquiv)⟩

-- Test WeilRestriction.mapHopf_square
/- The squaring map `t ↦ t²` of `G_m` induces the squaring map on `(k' ⊗_k R)ˣ`. -/
example (φ : LaurentPolynomial k' →ₐc[k'] LaurentPolynomial k')
    (hφ : φ (LaurentPolynomial.T 1) = LaurentPolynomial.T 2) (R : Type u) [CommRing R]
    [Algebra k R] (x : WithConv (ResHopf k k' (LaurentPolynomial k') →ₐ[k] R)) :
    multiplicativeGroupPoints k k' R (WithConv.toConv (x.ofConv.comp
        (mapHopf k k' _ φ : ResHopf k k' (LaurentPolynomial k') →ₐ[k]
          ResHopf k k' (LaurentPolynomial k')))) =
      multiplicativeGroupPoints k k' R x ^ 2 := sorry

-- Test WeilRestriction.generalLinearPoints_zero
/- `GL_0` is the trivial group, so its restriction has one point over every `R`. -/
example (R : Type u) [CommRing R] [Algebra k R] :
    Subsingleton
      (WithConv (ResHopf k k' (TauCeti.GeneralLinear.coordinateHopfAlgebra k' 0) →ₐ[k] R)) :=
  (generalLinearPoints k k' 0 R).toEquiv.subsingleton

-- Test WeilRestriction.generalLinearPoints_one
/- `GL_1 = G_m` through the determinant: on points of the restriction, `det` of the `1 × 1` matrix
attached by `generalLinearPoints` is a bijection onto `(k' ⊗_k R)ˣ`. -/
example (R : Type u) [CommRing R] [Algebra k R] :
    Function.Bijective (fun x => Matrix.GeneralLinearGroup.det (generalLinearPoints k k' 1 R x)) :=
  sorry

end HopfChecks

-- Test WeilRestriction.generalLinearPoints_complex
/- The `ℝ`-points of `Res_{ℂ/ℝ} GL_2` are `GL_2(ℂ)`, through `ℂ ⊗_ℝ ℝ ≅ ℂ`. -/
example :
    Nonempty (WithConv (ResHopf ℝ ℂ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℂ 2) →ₐ[ℝ] ℝ) ≃*
      Matrix.GeneralLinearGroup (Fin 2) ℂ) :=
  ⟨(generalLinearPoints ℝ ℂ 2 ℝ).trans
    (Units.mapEquiv (Algebra.TensorProduct.rid ℝ ℂ ℂ).toRingEquiv.mapMatrix.toMulEquiv)⟩

-- Test WeilRestriction.pointsHomeomorph_group
/- For a Hopf algebra the bijection of `pointsHomeomorph` is the group isomorphism
`pointsMulEquiv` followed by `E' ⊗_E E ≅ E'`. -/
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (E' : Type u) [Field E'] [ValuativeRel E'] [TopologicalSpace E']
    [IsNonarchimedeanLocalField E'] [Algebra E E'] [FiniteDimensional E E']
    (hcont : Continuous (algebraMap E E')) (H' : Type u) [CommRing H'] [HopfAlgebra E' H']
    [Algebra.FiniteType E' H'] (x : WithConv (ResHopf E E' H' →ₐ[E] E)) :
    pointsHomeomorph E' hcont H' x.ofConv =
      (Algebra.TensorProduct.rid E E' E').toAlgHom.comp
        (pointsMulEquiv E E' H' E x).ofConv := sorry


/-- Weil restriction along a finite separable extension preserves and reflects reductivity.
The comparison is an isomorphism of Hopf algebras. Springer, §3.3, p. 12, gives the forward
direction; the converse follows from the splitting over a separable closure. -/
theorem reductive_res_iff (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k']
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k')
    (Hres : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} k)
    (e : Hres.obj ≅ CommHopfAlgCat.of k (ResHopf k k' H)) :
    TauCeti.reductiveCommHopfAlgProperty k Hres ↔ TauCeti.reductiveCommHopfAlgProperty k' H :=
  sorry

/-- Over a separably closed `Ω`, the group of `Ω`-points of the Weil restriction of the rank-`n`
split torus is a product of copies of `(Ωˣ)ⁿ` indexed by the `k`-embeddings `k' → Ω`. This is the
point-group form of the induced character module; it does not state the Galois action. -/
theorem characterGroupEquivInduced (k : Type u) [Field k] (k' : Type u) [Field k'] [Algebra k k']
    [FiniteDimensional k k'] [Algebra.IsSeparable k k'] (Ω : Type u) [Field Ω] [Algebra k Ω]
    [IsSepClosed Ω] (n : ℕ) :
    Nonempty (WithConv (ResHopf k k' (MonoidAlgebra k' (Multiplicative (Fin n →₀ ℤ))) →ₐ[k] Ω) ≃*
      ((k' →ₐ[k] Ω) → Fin n → Ωˣ)) := sorry

-- Test WeilRestriction.res_multiplicative_complex_points
example : Nonempty (WithConv (ResHopf ℝ ℂ (LaurentPolynomial ℂ) →ₐ[ℝ] ℝ) ≃* ℂˣ) :=
  ⟨(multiplicativeGroupPoints ℝ ℂ ℝ).trans
    (Units.mapEquiv (Algebra.TensorProduct.rid ℝ ℂ ℂ).toMulEquiv)⟩

-- Test WeilRestriction.res_not_commutative_of_commutative_base
example : ¬ ∀ x y :
    WithConv (ResHopf ℝ ℂ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℂ 2) →ₐ[ℝ] ℝ),
    x * y = y * x := sorry

end WeilRestriction

namespace NormTorus

variable (k : Type u) [CommRing k] (k' : Type u) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Free k k']

/-- The norm `Res_{k'/k} G_m → G_m` on points: the algebra norm of `R ⊗_k k'` over `R`, on units. -/
def norm (R : Type u) [CommRing R] [Algebra k R] : (k' ⊗[k] R)ˣ →* Rˣ :=
  (Units.map (Algebra.norm R : (R ⊗[k] k') →* R)).comp
    (Units.map (Algebra.TensorProduct.comm k k' R).toMonoidHom)

omit [Module.Finite k k'] [Module.Free k k'] in
theorem norm_points (R : Type u) [CommRing R] [Algebra k R] (x : (k' ⊗[k] R)ˣ) :
    ((norm k k' R x : Rˣ) : R) =
      Algebra.norm R ((Algebra.TensorProduct.comm k k' R) (x : k' ⊗[k] R)) := rfl

/-- The norm-one subgroup of points. -/
def normOne (R : Type u) [CommRing R] [Algebra k R] : Subgroup (k' ⊗[k] R)ˣ := (norm k k' R).ker

theorem norm_comp_diagonal (R : Type u) [CommRing R] [Algebra k R] (r : Rˣ) :
    norm k k' R (Units.map (Algebra.TensorProduct.includeRight).toMonoidHom r) =
      r ^ Module.finrank k k' := sorry

/-- The affine kernel of the norm of the restriction-of-scalars multiplicative group. -/
def coordinateHopf (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] :
    TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K := sorry

/-- Representability on every coefficient algebra, including nonreduced ones. -/
def pointsEquiv (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (R : Type u) [CommRing R] [Algebra K R] :
    WithConv (coordinateHopf K L →ₐ[K] R) ≃* normOne K L R := sorry

theorem pointsEquiv_natural (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (R S : Type u) [CommRing R] [Algebra K R] [CommRing S] [Algebra K S]
    (f : R →ₐ[K] S) (g : WithConv (coordinateHopf K L →ₐ[K] R)) :
    (pointsEquiv K L S (WithConv.toConv (f.comp g.ofConv))).val =
      Units.map (Algebra.TensorProduct.map (AlgHom.id K L) f).toMonoidHom
        (pointsEquiv K L R g).val := sorry

theorem coordinateHopf_isTorus (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] :
    TauCeti.torusCommHopfAlgProperty K (coordinateHopf K L) := sorry

/-- The maximal split torus of a quadratic norm-one torus is the trivial subgroup. -/
def quadraticData (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (_hdegree : Module.finrank K L = 2) :
    BruhatTits.LocalRootData K (coordinateHopf K L) := sorry

theorem quadraticData_torus (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (hdegree : Module.finrank K L = 2)
    (R : Type u) [CommRing R] [Algebra K R] :
    BruhatTits.subgroupPoints (quadraticData K L hdegree).splitTorus R = ⊥ := sorry

-- Test NormTorus.coordinate_trivial_extension
example (K : Type u) [Field K] (R : Type u) [CommRing R] [Algebra K R] :
    Subsingleton (WithConv (coordinateHopf K K →ₐ[K] R)) := sorry

-- Test NormTorus.coordinate_points_agree
example (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (coordinateHopf K L →ₐ[K] R)) :
    norm K L R (pointsEquiv K L R g).val = 1 := (pointsEquiv K L R g).property

-- Test NormTorus.quadratic_anisotropic
example (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (hd : Module.finrank K L = 2) :
    IsEmpty (quadraticData K L hd).ι ∧ Module.finrank ℝ (quadraticData K L hd).V = 0 := sorry

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

/-- Over a separably closed field the norm-one torus splits with rank `[K' : K] - 1`. -/
theorem characterGroup_normOne (K : Type u) [Field K] (K' : Type u) [Field K'] [Algebra K K']
    [FiniteDimensional K K'] [Algebra.IsSeparable K K'] (Ω : Type u) [Field Ω] [Algebra K Ω]
    [IsSepClosed Ω] :
    Nonempty (normOne K K' Ω ≃* (Fin (Module.finrank K K' - 1) → Ωˣ)) := sorry

/-- The points of `Res_{k'/k} μ_n`: the `n`-torsion `μ_n(k' ⊗_k R)` of `(k' ⊗_k R)ˣ`. -/
def resRootsOfUnity (n : ℕ) (R : Type u) [CommRing R] [Algebra k R] :
    Subgroup (k' ⊗[k] R)ˣ := rootsOfUnity n (k' ⊗[k] R)

/-- The diagonal `μ_n(R) ⊆ μ_n(k' ⊗_k R)`, the image of `R` under `r ↦ 1 ⊗ r`. -/
def diagonalRootsOfUnity (n : ℕ) (R : Type u) [CommRing R] [Algebra k R] :
    Subgroup (resRootsOfUnity k k' n R) :=
  ((rootsOfUnity n R).map (Units.map (Algebra.TensorProduct.includeRight :
    R →ₐ[k] k' ⊗[k] R).toMonoidHom)).subgroupOf (resRootsOfUnity k k' n R)

/-- `Res_{k'/k} μ_n` modulo the diagonal `μ_n`, on points: the quotient of the group of points
`μ_n(k' ⊗_k R)` by the diagonal `μ_n(R)`. It is a quotient, not a subgroup, of `(k' ⊗_k R)ˣ`. -/
abbrev resRootsOfUnityQuotient (n : ℕ) (R : Type u) [CommRing R] [Algebra k R] : Type u :=
  resRootsOfUnity k k' n R ⧸ diagonalRootsOfUnity k k' n R

-- Test NormTorus.resRootsOfUnityQuotient_trivial_extension
/- For `k' = k` the diagonal is everything and the quotient is trivial. -/
example (n : ℕ) (R : Type u) [CommRing R] [Algebra k R] :
    Subsingleton (resRootsOfUnityQuotient k k n R) := sorry

-- Test NormTorus.resRootsOfUnityQuotient_one
example (R : Type u) [CommRing R] [Algebra k R] :
    Subsingleton (resRootsOfUnityQuotient k k' 1 R) := sorry

-- Test NormTorus.resRootsOfUnity_zero
example (R : Type u) [CommRing R] [Algebra k R] :
    resRootsOfUnity k k' 0 R = ⊤ := by
  ext x
  simp [resRootsOfUnity]

-- Test NormTorus.resRootsOfUnityQuotient_complex_real
example : Nat.card (resRootsOfUnityQuotient ℝ ℂ 4 ℝ) = 2 := sorry

-- Test NormTorus.norm_complex
example (z : ℂˣ) :
    ((norm ℝ ℂ ℝ (Units.map (Algebra.TensorProduct.rid ℝ ℂ ℂ).symm.toMonoidHom z) : ℝˣ) : ℝ) =
      (z : ℂ).re ^ 2 + (z : ℂ).im ^ 2 := sorry

-- Test NormTorus.normOne_complex
example (z : ℂˣ) :
    Units.map (Algebra.TensorProduct.rid ℝ ℂ ℂ).symm.toMonoidHom z ∈ normOne ℝ ℂ ℝ ↔
      ‖(z : ℂ)‖ = 1 := sorry

-- Test NormTorus.norm_trivial_extension
example (R : Type u) [CommRing R] [Algebra k R] (x : (k ⊗[k] R)ˣ) :
    ((norm k k R x : Rˣ) : R) = (Algebra.TensorProduct.lid k R) (x : k ⊗[k] R) := sorry

-- Test NormTorus.norm_not_surjective_points
example : ¬ Function.Surjective (norm ℝ ℂ ℝ) := sorry

-- Test NormTorus.normOne_trivial_extension
/- For `k' = k` the norm is the identity of `G_m`, so its kernel is trivial. -/
example (R : Type u) [CommRing R] [Algebra k R] : normOne k k R = ⊥ := sorry

-- Test NormTorus.normOne_I
/- `Nm(i) = i · (−i) = 1`: the real point `i` of `Res_{ℂ/ℝ} G_m` lies in the norm-one subgroup. -/
example : Units.map (Algebra.TensorProduct.rid ℝ ℂ ℂ).symm.toMonoidHom
    (Units.mk0 Complex.I Complex.I_ne_zero) ∈ normOne ℝ ℂ ℝ := sorry

-- Test NormTorus.normOne_split_complex
/- Over `R = ℂ` the norm-one torus of `ℂ/ℝ` splits: its `ℂ`-points form a group isomorphic to
`ℂˣ`. -/
example : Nonempty (normOne ℝ ℂ ℂ ≃* ℂˣ) := sorry

-- Test NormTorus.resRootsOfUnity_complex
/- `μ_4(ℂ ⊗_ℝ ℝ) = μ_4(ℂ) = {±1, ±i}`. -/
example : Nat.card (resRootsOfUnity ℝ ℂ 4 ℝ) = 4 := sorry

-- Test NormTorus.resRootsOfUnity_split
/- For the split algebra `ℝ × ℝ`, `μ_2((ℝ × ℝ) ⊗_ℝ ℝ) = μ_2(ℝ)² = {±1}²`. -/
example : Nat.card (resRootsOfUnity ℝ (ℝ × ℝ) 2 ℝ) = 4 := sorry

-- Test NormTorus.diagonalRootsOfUnity_complex
/- The diagonal `μ_4(ℝ) = {±1}` inside `μ_4(ℂ ⊗_ℝ ℝ)`. -/
example : Nat.card (diagonalRootsOfUnity ℝ ℂ 4 ℝ) = 2 := sorry

-- Test NormTorus.diagonalRootsOfUnity_split
/- The diagonal `μ_2(ℝ) = {(1, 1), (−1, −1)}` inside `μ_2(ℝ × ℝ)`. -/
example : Nat.card (diagonalRootsOfUnity ℝ (ℝ × ℝ) 2 ℝ) = 2 := sorry

-- Test NormTorus.diagonalRootsOfUnity_trivial_extension
example (n : ℕ) (R : Type u) [CommRing R] [Algebra k R] : diagonalRootsOfUnity k k n R = ⊤ := sorry

end NormTorus

namespace DeligneTorus

/-- The Deligne torus `S = Res_{ℂ/ℝ} G_m`. -/
abbrev S : Type := WeilRestriction.ResHopf ℝ ℂ (LaurentPolynomial ℂ)

/-- Points of `S` over an `ℝ`-algebra `R` are `(ℂ ⊗_ℝ R)ˣ`. -/
def pointsMulEquiv (R : Type) [CommRing R] [Algebra ℝ R] :
    WithConv (S →ₐ[ℝ] R) ≃* (ℂ ⊗[ℝ] R)ˣ :=
  WeilRestriction.multiplicativeGroupPoints ℝ ℂ R

/-- `S(ℝ) ≃* ℂˣ`: `pointsMulEquiv` at `R = ℝ` followed by `ℂ ⊗_ℝ ℝ ≃ ℂ`. -/
def realPointsMulEquiv : WithConv (S →ₐ[ℝ] ℝ) ≃* ℂˣ :=
  (pointsMulEquiv ℝ).trans (Units.mapEquiv (Algebra.TensorProduct.rid ℝ ℂ ℂ).toMulEquiv)

open scoped PointTopology in
/-- `S(ℝ) ≃ ℂˣ` is a homeomorphism for the point topology of RG2.0. -/
theorem isHomeomorph_realPointsMulEquiv : IsHomeomorph realPointsMulEquiv := sorry

/-- The splitting `S(ℂ) ≃* ℂˣ × ℂˣ`, normalized so that `S(ℝ) → S(ℂ)` is `z ↦ (z, conj z)`.
It is fixed by `complexSplitting_apply`. -/
def complexSplitting : WithConv (S →ₐ[ℝ] ℂ) ≃* ℂˣ × ℂˣ := sorry

/-- The two components of the splitting are the ring maps `ℂ ⊗_ℝ ℂ → ℂ`, `a ⊗ b ↦ a b` and
`a ⊗ b ↦ conj(a) b`, applied to `pointsMulEquiv ℂ`. -/
theorem complexSplitting_apply (z : WithConv (S →ₐ[ℝ] ℂ)) :
    ((complexSplitting z).1 : ℂ) = Algebra.TensorProduct.productMap (AlgHom.id ℝ ℂ)
        (AlgHom.id ℝ ℂ) (pointsMulEquiv ℂ z : ℂ ⊗[ℝ] ℂ) ∧
      ((complexSplitting z).2 : ℂ) = Algebra.TensorProduct.productMap Complex.conjAe.toAlgHom
        (AlgHom.id ℝ ℂ) (pointsMulEquiv ℂ z : ℂ ⊗[ℝ] ℂ) := sorry

theorem complexSplitting_real (z : WithConv (S →ₐ[ℝ] ℝ)) :
    complexSplitting (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp z.ofConv)) =
      (Units.map (RingHom.id ℂ).toMonoidHom (realPointsMulEquiv z),
        Units.map (starRingEnd ℂ).toMonoidHom (realPointsMulEquiv z)) := sorry

/-- Complex conjugation on `S(ℂ)` swaps the factors (with conjugation). -/
theorem conj_swap (z : WithConv (S →ₐ[ℝ] ℂ)) :
    complexSplitting (WithConv.toConv ((Complex.conjAe.toAlgHom).comp z.ofConv)) =
      (Units.map (starRingEnd ℂ).toMonoidHom (complexSplitting z).2,
        Units.map (starRingEnd ℂ).toMonoidHom (complexSplitting z).1) := sorry

/-- The diagonal cocharacter `d : G_m → S`, `r ↦ r` on real points. -/
def diagonal : ℝˣ →* WithConv (S →ₐ[ℝ] ℝ) :=
  realPointsMulEquiv.symm.toMonoidHom.comp (Units.map (algebraMap ℝ ℂ).toMonoidHom)

/-- The weight cocharacter `w = d ∘ inv`, `w(r) = r⁻¹` on real points (the normalization of
Milne, *Introduction to Shimura varieties*, §2, p. 26). -/
def weight : ℝˣ →* WithConv (S →ₐ[ℝ] ℝ) := diagonal.comp (MulEquiv.inv ℝˣ).toMonoidHom

/-- The norm character `Nm : S → G_m`, `z ↦ z z̄`: `NormTorus.norm` for `ℂ/ℝ` on real points. -/
def norm : WithConv (S →ₐ[ℝ] ℝ) →* ℝˣ :=
  (NormTorus.norm ℝ ℂ ℝ).comp (pointsMulEquiv ℝ).toMonoidHom

/-- The cocharacter `μ : G_{m,ℂ} → S_ℂ`, `z ↦ (z, 1)`. -/
def mu : ℂˣ →* WithConv (S →ₐ[ℝ] ℂ) := complexSplitting.symm.toMonoidHom.comp (MonoidHom.inl ℂˣ ℂˣ)

/-- The characters of `S`: `(p, q) ↦ ((z₁, z₂) ↦ z₁^p z₂^q)` on `S(ℂ) ≃ ℂˣ × ℂˣ`. -/
def characterGroup (pq : ℤ × ℤ) : WithConv (S →ₐ[ℝ] ℂ) →* ℂˣ :=
  ((zpowGroupHom pq.1).comp (MonoidHom.fst ℂˣ ℂˣ) *
      (zpowGroupHom pq.2).comp (MonoidHom.snd ℂˣ ℂˣ)).comp complexSplitting.toMonoidHom

/-- Complex conjugation exchanges the characters `(p, q)` and `(q, p)`. -/
theorem characterGroup_conj (p q : ℤ) (z : WithConv (S →ₐ[ℝ] ℂ)) :
    characterGroup (p, q) (WithConv.toConv ((Complex.conjAe.toAlgHom).comp z.ofConv)) =
      Units.map (starRingEnd ℂ).toMonoidHom (characterGroup (q, p) z) := sorry

-- Test DeligneTorus.norm_diagonal
example (r : ℝˣ) : norm (diagonal r) = r ^ 2 := sorry

-- Test DeligneTorus.weight_eq_inv_diagonal
example (r : ℝˣ) : weight r = (diagonal r)⁻¹ := map_inv diagonal r

-- Test DeligneTorus.complexSplitting_I
example : complexSplitting (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp
      (realPointsMulEquiv.symm (Units.mk0 Complex.I Complex.I_ne_zero)).ofConv)) =
    (Units.mk0 Complex.I Complex.I_ne_zero,
      Units.mk0 (-Complex.I) (neg_ne_zero.2 Complex.I_ne_zero)) := sorry

-- Test DeligneTorus.not_split
example : ¬ Nonempty (WithConv (S →ₐ[ℝ] ℝ) ≃* ℝˣ × ℝˣ) := sorry

-- Test DeligneTorus.kernel_norm_compact
example : ∀ z ∈ norm.ker, ‖((realPointsMulEquiv z : ℂˣ) : ℂ)‖ = 1 := sorry

-- Test DeligneTorus.realPointsMulEquiv_apply
/- The complex number attached to a real point is its value on the coordinate `t` of
`G_m = Spec ℂ[t, t⁻¹]`, read in `ℂ ⊗_ℝ ℝ ≅ ℂ`. -/
example (x : WithConv (S →ₐ[ℝ] ℝ)) :
    ((realPointsMulEquiv x : ℂˣ) : ℂ) = Algebra.TensorProduct.rid ℝ ℂ ℂ
      (WeilRestriction.homEquiv ℝ ℂ (LaurentPolynomial ℂ) ℝ x.ofConv (LaurentPolynomial.T 1)) := by
  simp [realPointsMulEquiv, pointsMulEquiv, WeilRestriction.multiplicativeGroupPoints,
    WeilRestriction.pointsMulEquiv_apply]

-- Test DeligneTorus.weight_two
/- `w(2) = 1/2` in `S(ℝ) = ℂˣ`: the weight is `r ↦ r⁻¹`, not `r ↦ r`. -/
example : ((realPointsMulEquiv (weight (Units.mk0 2 two_ne_zero)) : ℂˣ) : ℂ) = 1 / 2 := by
  simp [weight, diagonal]

-- Test DeligneTorus.norm_weight
/- `Nm ∘ w` is `r ↦ r⁻²`. -/
example (r : ℝˣ) : norm (weight r) = r⁻¹ ^ 2 := sorry

-- Test DeligneTorus.complexSplitting_weight
/- Over `ℂ` the weight is the scalar cocharacter `r ↦ (r⁻¹, r⁻¹)`. -/
example (r : ℝˣ) : complexSplitting (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp (weight r).ofConv)) =
    (Units.map (algebraMap ℝ ℂ).toMonoidHom r⁻¹, Units.map (algebraMap ℝ ℂ).toMonoidHom r⁻¹) :=
  sorry

-- Test DeligneTorus.complexSplitting_scalar
/- The `ℂ`-point with value `1 ⊗ i` in `(ℂ ⊗_ℝ ℂ)ˣ` (the scalar `i` of the coefficient ring) goes
to `(i, i)`, while the real point `i`, with value `i ⊗ 1`, goes to `(i, −i)`. -/
example (z : WithConv (S →ₐ[ℝ] ℂ))
    (hz : ((pointsMulEquiv ℂ z : (ℂ ⊗[ℝ] ℂ)ˣ) : ℂ ⊗[ℝ] ℂ) = (1 : ℂ) ⊗ₜ Complex.I) :
    complexSplitting z =
      (Units.mk0 Complex.I Complex.I_ne_zero, Units.mk0 Complex.I Complex.I_ne_zero) := sorry

-- Test DeligneTorus.complexSplitting_mul_real
/- On a real point the product of the two components is the norm `z z̄ = |z|²`. -/
example (z : WithConv (S →ₐ[ℝ] ℝ)) :
    (((complexSplitting (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp z.ofConv))).1 *
      (complexSplitting (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp z.ofConv))).2 : ℂˣ) : ℂ) =
      ((norm z : ℝˣ) : ℝ) := sorry

-- Test DeligneTorus.characterGroup_mu
/- `μ(z) = (z, 1)`: the character `(1, 0)` takes the value `z` on `μ(z)` and `(0, 1)` the value
`1`. -/
example (z : ℂˣ) : characterGroup (1, 0) (mu z) = z ∧ characterGroup (0, 1) (mu z) = 1 := by
  simp [characterGroup, mu]

-- Test DeligneTorus.weight_eq_mu_mul_conj
/- Over `ℂ`, `w(r) = μ(r⁻¹) · μ̄(r⁻¹)`, where `μ̄(z) = conj ∘ μ(z̄)` is the conjugate cocharacter
`z ↦ (1, z)`. -/
example (r : ℝˣ) :
    WithConv.toConv ((Algebra.ofId ℝ ℂ).comp (weight r).ofConv) =
      mu (Units.map (algebraMap ℝ ℂ).toMonoidHom r⁻¹) *
        WithConv.toConv (Complex.conjAe.toAlgHom.comp
          (mu (Units.map (algebraMap ℝ ℂ).toMonoidHom r⁻¹)).ofConv) := sorry

-- Test DeligneTorus.mu_not_real
/- Non-example: `μ` is not defined over `ℝ`: `μ(−1) = (−1, 1)` is not of the form `(z, z̄)`. -/
example : ¬ ∃ y : WithConv (S →ₐ[ℝ] ℝ),
    WithConv.toConv ((Algebra.ofId ℝ ℂ).comp y.ofConv) = mu (-1) := sorry

-- Test DeligneTorus.characterGroup_norm
/- On real points the character `(1, 1)`, `z ↦ z z̄`, is the norm. -/
example (z : WithConv (S →ₐ[ℝ] ℝ)) :
    ((characterGroup (1, 1) (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp z.ofConv)) : ℂˣ) : ℂ) =
      ((norm z : ℝˣ) : ℝ) := sorry

-- Test DeligneTorus.characterGroup_weight
/- The character `(p, q)` takes the value `r^{−(p+q)}` on `w(r)`. -/
example (p q : ℤ) (r : ℝˣ) :
    ((characterGroup (p, q) (WithConv.toConv ((Algebra.ofId ℝ ℂ).comp (weight r).ofConv)) :
      ℂˣ) : ℂ) = ((r : ℝ) : ℂ) ^ (-(p + q)) := sorry

end DeligneTorus

/-! ## Layer RG2.1: Relative roots and valued root data -/

namespace BruhatTits

open ValuativeRel

/-! ### Rational maximal unramified split tori -/

-- Test BruhatTits.baseChangeIdeal_bot
example {E : Type u} [Field E] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}
    (L : Type u) [Field L] [Algebra E L] :
    (TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := L) (⊥ : TauCeti.HopfIdeal E H)).toIdeal = ⊥ := by
  rw [TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_toIdeal]
  have h : (⊥ : TauCeti.HopfIdeal E H).toIdeal = ⊥ := by
    ext x
    exact TauCeti.HopfIdeal.mem_bot
  rw [h, Ideal.map_bot]

-- Test BruhatTits.baseChangeIdeal_augmentation
example {E : Type u} [Field E] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}
    (L : Type u) [Field L] [Algebra E L] :
    TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := L) (TauCeti.HopfIdeal.augmentation E H) =
      TauCeti.HopfIdeal.augmentation L
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := L) H) := sorry

-- Test BruhatTits.baseChangeIdeal_mem
example {E : Type u} [Field E] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}
    (L : Type u) [Field L] [Algebra E L] (I : TauCeti.HopfIdeal E H) (a : H) (ha : a ∈ I) :
    (Algebra.TensorProduct.includeRight : H →ₐ[E] L ⊗[E] H) a ∈ (TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := L) I).toIdeal := by
  rw [TauCeti.CommHopfAlgCat.baseChangeHopfIdeal_toIdeal]
  exact Ideal.mem_map_of_mem _ (TauCeti.HopfIdeal.mem_toIdeal.2 ha)

/-- An `E`-rational torus containing the maximal `E`-split torus whose base change to `Ĕ` is a
maximal `Ĕ`-split torus. Bruhat–Tits II, Corollary 5.1.12, p. 150, states this over the strict
henselization of `E`; its completion `Ĕ` has the same absolute Galois group, so the same maximal
split tori. Ideal inclusion reverses subgroup inclusion. -/
theorem exists_rational_maximalUnramifiedSplitTorus {E : Type u} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E} (D : LocalRootData E H) :
    ∃ I : TauCeti.HopfIdeal E H, I ≤ D.splitTorus ∧
      TauCeti.torusCommHopfAlgProperty E (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I) ∧
      Minimal (fun J : TauCeti.HopfIdeal (MaxUnramifiedCompletion.Breve E)
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := MaxUnramifiedCompletion.Breve E) H) =>
          TauCeti.splitTorusCommHopfAlgProperty (MaxUnramifiedCompletion.Breve E)
            (TauCeti.FiniteTypeCommHopfAlgCat.quotient _ J))
        (TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := MaxUnramifiedCompletion.Breve E) I) := sorry

/-! ### Abstract root data and valuations -/

variable {ι M N : Type u} [AddCommGroup M] [Module ℝ M] [AddCommGroup N] [Module ℝ N]

namespace RootDatum

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}

/-- The group `N` generated by `T` and the reflection cosets `M_a` (Bruhat–Tits I 6.1.2 (10),
p. 109). -/
def weylNormalizer (D : RootDatum G Φ) : Subgroup G :=
  Subgroup.closure ((D.T : Set G) ∪ ⋃ i, D.reflectionCoset i)

theorem T_le_weylNormalizer (D : RootDatum G Φ) : D.T ≤ D.weylNormalizer := by
  intro t ht
  exact Subgroup.subset_closure (Or.inl ht)

theorem reflectionCoset_subset_weylNormalizer (D : RootDatum G Φ) (i : ι) :
    D.reflectionCoset i ⊆ D.weylNormalizer := fun _ hm =>
  Subgroup.subset_closure (Or.inr (Set.mem_iUnion.mpr ⟨i, hm⟩))

instance T_normal_weylNormalizer (D : RootDatum G Φ) :
    (D.T.subgroupOf D.weylNormalizer).Normal := sorry

/-- `N/T ≃ W(Φ)` for a finite root system (Bruhat–Tits I 6.1.2 (10), p. 109, and
6.1.11 (ii), p. 115). -/
def weylGroupEquiv [Finite ι] (D : RootDatum G Φ) :
    D.weylNormalizer ⧸ D.T.subgroupOf D.weylNormalizer ≃* Φ.weylGroup := sorry

/-- The equivalence is the action of `N` on the root subgroups, `n U_a n⁻¹ = U_{ν(n) a}`
(Bruhat–Tits I 6.1.2 (10), p. 109). -/
theorem weylGroupEquiv_conj [Finite ι] (D : RootDatum G Φ) (n : D.weylNormalizer) (i : ι) :
    (D.U i).map (MulAut.conj (n : G)).toMonoidHom =
      D.U (((D.weylGroupEquiv (QuotientGroup.mk n) : Φ.weylGroup) :
        RootPairing.Aut Φ).indexEquiv i) := sorry

-- Test BruhatTits.RootDatum.weylGroupEquiv_reflection
example [Finite ι] (D : RootDatum G Φ) (i : ι) (m : G) (hm : m ∈ D.reflectionCoset i) :
    D.weylGroupEquiv (QuotientGroup.mk ⟨m, D.reflectionCoset_subset_weylNormalizer i hm⟩) =
      RootPairing.weylGroup.ofIdx Φ i := sorry

-- Test BruhatTits.RootDatum.weylGroupEquiv_torus
example [Finite ι] (D : RootDatum G Φ) (t : G) (ht : t ∈ D.T) :
    D.weylGroupEquiv (QuotientGroup.mk ⟨t, D.T_le_weylNormalizer ht⟩) = 1 := by
  have h : (QuotientGroup.mk ⟨t, D.T_le_weylNormalizer ht⟩ :
      D.weylNormalizer ⧸ D.T.subgroupOf D.weylNormalizer) = 1 :=
    (QuotientGroup.eq_one_iff _).2 (Subgroup.mem_subgroupOf.2 ht)
  rw [h, map_one]

-- Test BruhatTits.RootDatum.weylNormalizer_rankZero
example [IsEmpty ι] (D : RootDatum G Φ) : D.weylNormalizer = D.T := by
  rw [weylNormalizer, Set.iUnion_of_empty, Set.union_empty, Subgroup.closure_eq]

-- Test BruhatTits.RootDatum.weylNormalizer_reflection
example (D : RootDatum G Φ) (i : ι) (m : G) (hm : m ∈ D.reflectionCoset i) :
    m ∈ D.weylNormalizer :=
  D.reflectionCoset_subset_weylNormalizer i hm

-- Test BruhatTits.RootDatum.weylNormalizer_contains_torus
example (D : RootDatum G Φ) : D.T ≤ D.weylNormalizer := D.T_le_weylNormalizer

/-- A root datum is generating if `T` and the root subgroups generate `G`. -/
def IsGenerating (D : RootDatum G Φ) : Prop :=
  Subgroup.closure ((D.T : Set G) ∪ ⋃ i, (D.U i : Set G)) = ⊤

/-- Opposite root subgroups are distinct: by DR6 one of them lies in `U⁺` and the other in `U⁻`,
which meet trivially, and DR1 makes them nontrivial. -/
theorem U_ne_of_root_eq_neg (D : RootDatum G Φ) (i j : ι) (hij : Φ.root j = -Φ.root i) :
    D.U i ≠ D.U j := by
  intro hU
  obtain ⟨u, hu1⟩ := (Subgroup.ne_bot_iff_exists_ne_one.1 (D.U_ne_bot i))
  have hj : Φ.toLinearMap (Φ.root j) D.positiveVector =
      -Φ.toLinearMap (Φ.root i) D.positiveVector := by
    rw [hij, map_neg, LinearMap.neg_apply]
  rcases lt_or_gt_of_ne (D.positiveVector_regular i) with hneg | hpos
  · have hpos' : 0 < Φ.toLinearMap (Φ.root j) D.positiveVector := by linarith
    have h1 : (u : G) ∈ ⨆ (k : ι) (_ : 0 < Φ.toLinearMap (Φ.root k) D.positiveVector), D.U k :=
      Subgroup.mem_iSup_of_mem j (Subgroup.mem_iSup_of_mem hpos' (hU ▸ u.2))
    have h2 : (1 : G) * u ∈
        ⨆ (k : ι) (_ : Φ.toLinearMap (Φ.root k) D.positiveVector < 0), D.U k := by
      rw [one_mul]
      exact Subgroup.mem_iSup_of_mem i (Subgroup.mem_iSup_of_mem hneg u.2)
    apply hu1
    ext
    simpa using D.bruhat_separation 1 D.T.one_mem _ h1 h2
  · have hneg' : Φ.toLinearMap (Φ.root j) D.positiveVector < 0 := by linarith
    have h1 : (u : G) ∈ ⨆ (k : ι) (_ : 0 < Φ.toLinearMap (Φ.root k) D.positiveVector), D.U k :=
      Subgroup.mem_iSup_of_mem i (Subgroup.mem_iSup_of_mem hpos u.2)
    have h2 : (1 : G) * u ∈
        ⨆ (k : ι) (_ : Φ.toLinearMap (Φ.root k) D.positiveVector < 0), D.U k := by
      rw [one_mul]
      exact Subgroup.mem_iSup_of_mem j (Subgroup.mem_iSup_of_mem hneg' (hU ▸ u.2))
    apply hu1
    ext
    simpa using D.bruhat_separation 1 D.T.one_mem _ h1 h2

-- Test BruhatTits.RootDatum.isGenerating_rankZero
example [IsEmpty ι] (D : RootDatum G Φ) : D.IsGenerating ↔ D.T = ⊤ := by
  rw [IsGenerating, Set.iUnion_of_empty, Set.union_empty, Subgroup.closure_eq]

-- Test BruhatTits.RootDatum.weylGroupEquiv_reflection_ne_one
/- (non-example) `N/T → W(Φ)` is not the trivial map: by (DR5) an element of `M_a` carries `U_a`
to `U_{−a} ≠ U_a`, so its image does not fix `a`. -/
example [Finite ι] (D : RootDatum G Φ) (i : ι) (m : G) (hm : m ∈ D.reflectionCoset i) :
    D.weylGroupEquiv (QuotientGroup.mk ⟨m, D.reflectionCoset_subset_weylNormalizer i hm⟩) ≠ 1 := by
  intro h1
  have hc := D.weylGroupEquiv_conj ⟨m, D.reflectionCoset_subset_weylNormalizer i hm⟩ i
  rw [h1] at hc
  have hr := D.reflection_conjugates i i m hm
  apply D.U_ne_of_root_eq_neg i (Φ.reflectionPerm i i) (by simp)
  rw [← hr]
  exact (hc.trans (congrArg D.U
    (by simp : (((1 : Φ.weylGroup) : RootPairing.Aut Φ).indexEquiv i) = i))).symm

end RootDatum

-- Test BruhatTits.RootDatum.sl2
example (K : Type) [Field K] :
    ∃ (Φ : RootPairing (Fin 2) ℝ ℝ ℝ) (D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ),
      D.IsGenerating := sorry

-- Test BruhatTits.RootDatum.rankZero
example {G : Type v} [Group G] (Φ : RootPairing PEmpty ℝ M N) (T : Subgroup G) :
    ∃ D : RootDatum G Φ, D.T = T := sorry

-- Test BruhatTits.RootDatum.not_of_trivial_U
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ) (i : ι) :
    D.U i ≠ ⊥ := D.U_ne_bot i

-- Test BruhatTits.RootDatum.opposite_ne
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ) (i j : ι)
    (hij : Φ.root j = -Φ.root i) : D.U i ≠ D.U j :=
  D.U_ne_of_root_eq_neg i j hij

namespace Valuation

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

theorem filtration_antitone (i : ι) : Antitone (φ.filtration i) := by
  intro r s hrs g hg
  obtain ⟨u, rfl, hu⟩ := (φ.mem_filtration_iff i s g).1 hg
  exact (φ.mem_filtration_iff i r _).2 ⟨u, rfl, le_trans (WithTop.coe_le_coe.2 hrs) hu⟩

/-- (V5) in value form: if `u'uu'' ∈ M_a` with `u ∈ U_a`, `u', u'' ∈ U_{−a}` and `φ_a(u) = s`,
then `φ_{−a}(u') = −s`. -/
theorem bruhat_value_left (i j : ι) (hij : Φ.root j = -Φ.root i) (u : D.U i) (a b : D.U j)
    (s : ℝ) (hs : φ.φ i u = s) (hm : (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i) :
    φ.φ j a = ((-s : ℝ) : WithTop ℝ) := by
  have hu : u ≠ 1 := by
    rintro rfl
    rw [(φ.φ_eq_top_iff i 1).2 rfl] at hs
    exact WithTop.top_ne_coe hs
  obtain ⟨r, hr, ha, -⟩ := φ.bruhat_value i j hij u a b hu hm
  rw [hs] at hr
  rw [ha, WithTop.coe_injective hr]

/-- The value set `Γ_a = φ_a(U_a ∖ {1})`. -/
def valueSet (i : ι) : Set ℝ := {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ)}

/-- `Γ_{−a} = −Γ_a` (Bruhat–Tits I 6.2.2, p. 117, from (V5) and 6.1.2 (2)). -/
theorem valueSet_neg (i j : ι) (hij : Φ.root j = -Φ.root i) :
    φ.valueSet j = -φ.valueSet i := sorry

/-- The set `Γ'_a ⊆ Γ_a` of values `φ_a(u)` attained at elements `u ≠ 1` which are maximal on their
coset `u·U_{2a}` (Bruhat–Tits I 6.2.2, p. 117). The affine roots of direction `a` have constants
in `Γ'_a`; for a multipliable root `Γ'_a ⊊ Γ_a` is possible (the ramified `SU₃`), and using `Γ_a`
instead would add spurious walls. -/
def primedValueSet (i : ι) : Set ℝ :=
  {r | ∃ u : D.U i, u ≠ 1 ∧ φ.φ i u = (r : WithTop ℝ) ∧
    ∀ (j : ι) (hj : Φ.root j = (2 : ℝ) • Φ.root i) (w : G) (hw : w ∈ D.U j),
      φ.φ i ⟨(u : G) * w, mul_mem u.2 (D.le_of_root_eq_two_smul i j hj hw)⟩ ≤ φ.φ i u}

theorem primedValueSet_subset_valueSet (i : ι) : φ.primedValueSet i ⊆ φ.valueSet i :=
  fun _ ⟨u, hu, hφ, _⟩ => ⟨u, hu, hφ⟩

-- Test BruhatTits.Valuation.primedValueSet_eq_of_not_multipliable
/- For a non-multipliable root the two value sets agree. -/
example (i : ι) (h : ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i) : φ.primedValueSet i = φ.valueSet i := by
  refine Set.Subset.antisymm (φ.primedValueSet_subset_valueSet i) ?_
  rintro r ⟨u, hu, hφ⟩
  exact ⟨u, hu, hφ, fun j hj => absurd hj (h j)⟩

/-- The equipollent valuation `φ + v` (Bruhat–Tits I 6.2.5, p. 120). -/
def shift (φ : Valuation D) (v : N) : Valuation D := sorry

theorem shift_apply (v : N) (i : ι) (u : D.U i) :
    (φ.shift v).φ i u = φ.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ) := sorry

/-- Transport of a valuation by an element of `N` for a finite root system:
`(n·φ)_a(u) = φ_{w⁻¹a}(n⁻¹un)` with `w` the image of `n` in `W(Φ)` (Bruhat–Tits I 6.2.5,
p. 120). -/
def smul [Finite ι] (φ : Valuation D) (n : D.weylNormalizer) : Valuation D := sorry

theorem smul_apply [Finite ι] (n : D.weylNormalizer) (i j : ι)
    (hij : ((D.weylGroupEquiv (QuotientGroup.mk n) : Φ.weylGroup) :
      RootPairing.Aut Φ).indexEquiv j = i)
    (u : D.U i) (v : D.U j) (huv : (u : G) = (n : G) * (v : G) * (n : G)⁻¹) :
    (φ.smul n).φ i u = φ.φ j v := sorry

/-- Discreteness means that every bounded interval contains only finitely many root values. -/
def IsDiscrete : Prop := ∀ i (a b : ℝ), (φ.valueSet i ∩ Set.Icc a b).Finite

-- Test BruhatTits.Valuation.one_top
example (i : ι) : φ.φ i 1 = ⊤ := (φ.φ_eq_top_iff i 1).2 rfl

-- Test BruhatTits.Valuation.rankZero
example [IsEmpty ι] : Nonempty (Valuation D) :=
  ⟨{ φ := fun i => isEmptyElim i
     three_values := fun i => isEmptyElim i
     φ_eq_top_iff := fun i => isEmptyElim i
     filtration := fun i => isEmptyElim i
     mem_filtration_iff := fun i => isEmptyElim i
     reflection_shift := fun i => isEmptyElim i
     commutator_filtration_le := fun i => isEmptyElim i
     doubling := fun i => isEmptyElim i
     bruhat_value := fun i => isEmptyElim i }⟩

-- Test BruhatTits.Valuation.not_constant
/- A root-value map with at most two values violates (V0); in particular the trivial valuation
`ω(K^×) = 0` does not give a valuation `φ_±(x_±(u)) = ω(u)` of the root datum of `SL₂(K)`. -/
example (i : ι) (c₁ c₂ : WithTop ℝ) : ¬ ∀ u : D.U i, φ.φ i u = c₁ ∨ φ.φ i u = c₂ := by
  intro h
  have hsub : Set.range (φ.φ i) ⊆ {c₁, c₂} := by
    rintro _ ⟨u, rfl⟩
    exact h u
  have h2 : ({c₁, c₂} : Set (WithTop ℝ)).encard ≤ 2 :=
    (Set.encard_insert_le _ _).trans (by rw [Set.encard_singleton]; rfl)
  have h3 := (φ.three_values i).trans ((Set.encard_le_encard hsub).trans h2)
  norm_num at h3

-- Test BruhatTits.Valuation.opposite_depths
example (i j : ι) (hij : Φ.root j = -Φ.root i)
    (u₁ u₂ : D.U i) (a₁ b₁ a₂ b₂ : D.U j)
    (h₁ : φ.φ i u₁ = 1) (h₂ : φ.φ i u₂ = 2)
    (hm₁ : (a₁ : G) * (u₁ : G) * (b₁ : G) ∈ D.reflectionCoset i)
    (hm₂ : (a₂ : G) * (u₂ : G) * (b₂ : G) ∈ D.reflectionCoset i) :
    φ.φ j a₁ = (-1 : ℝ) ∧ φ.φ j a₂ = (-2 : ℝ) :=
  ⟨φ.bruhat_value_left i j hij u₁ a₁ b₁ 1 (by rw [h₁]; rfl) hm₁,
    φ.bruhat_value_left i j hij u₂ a₂ b₂ 2 (by rw [h₂]; rfl) hm₂⟩

-- Test BruhatTits.Valuation.not_valuation_wrong_sign
/- (V5) forbids equal signs on opposite factors: for `SL₂` the family `φ_+ = ω`, `φ_− = −ω`
would give `φ_−(x_−(−ϖ⁻¹)) = ω(ϖ) = 1` against `φ_+(x_+(ϖ)) = 1`. -/
example (i j : ι) (hij : Φ.root j = -Φ.root i) (u : D.U i) (a b : D.U j)
    (hu : φ.φ i u = 1) (hm : (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i) :
    φ.φ j a ≠ 1 := by
  rw [φ.bruhat_value_left i j hij u a b 1 (by rw [hu]; rfl) hm]
  intro h
  exact absurd (WithTop.coe_injective (h.trans WithTop.coe_one.symm)) (by norm_num)

-- Test BruhatTits.Valuation.shift_zero
example : φ.shift 0 = φ := sorry

-- Test BruhatTits.Valuation.smul_one
example [Finite ι] : φ.smul 1 = φ := sorry

-- Test BruhatTits.Valuation.isDiscrete_rankZero
example [IsEmpty ι] : φ.IsDiscrete := fun i => isEmptyElim i

-- Test BruhatTits.Valuation.isDiscrete_shift
example (v : N) : (φ.shift v).IsDiscrete ↔ φ.IsDiscrete := sorry

end Valuation

-- Test BruhatTits.Equipollent.refl
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Equipollent φ φ :=
  ⟨0, fun i u => by simp⟩

-- Test BruhatTits.Equipollent.shift
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) (v : N) : Equipollent φ (φ.shift v) :=
  ⟨v, fun i u => φ.shift_apply v i u⟩

-- Test BruhatTits.Equipollent.not_same_shift_opposite
/- Shifts of opposite root valuations are opposite: raising both `φ_a` and `φ_{−a}` by `1` is
not equipollent to `φ`. -/
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ ψ : Valuation D) (i j : ι) (hij : Φ.root j = -Φ.root i) (u : D.U i) (w : D.U j)
    (hu : u ≠ 1) (hw : w ≠ 1)
    (hψu : ψ.φ i u = φ.φ i u + ((1 : ℝ) : WithTop ℝ))
    (hψw : ψ.φ j w = φ.φ j w + ((1 : ℝ) : WithTop ℝ)) : ¬ Equipollent φ ψ := sorry

-- Test BruhatTits.Valuation.sl2_standard
/- For a nontrivial real valuation `ω` of `K`, the diagonal torus and the two unipotent subgroups
of `SL₂(K)` carry a valuation with `φ_+(x_+(c)) = φ_−(x_−(c)) = ω(c)` (Bruhat–Tits I 6.2.3 a),
p. 117). -/
example (K : Type) [Field K] (ω : AddValuation K (WithTop ℝ)) (hω : ∃ x : K, x ≠ 0 ∧ ω x ≠ 0) :
    ∃ (Φ : RootPairing (Fin 2) ℝ ℝ ℝ) (D : RootDatum (Matrix.SpecialLinearGroup (Fin 2) K) Φ)
      (φ : Valuation D), ∀ c : K,
        (∃ h : (⟨!![1, c; 0, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 0,
          φ.φ 0 ⟨_, h⟩ = ω c) ∧
        (∃ h : (⟨!![1, 0; c, 1], by simp⟩ : Matrix.SpecialLinearGroup (Fin 2) K) ∈ D.U 1,
          φ.φ 1 ⟨_, h⟩ = ω c) := sorry

/-- The rational root datum of a reductive group over any field is generating, and its group
`N = ⟨T, M_a⟩` is the group of rational points of the normalizer of `S`, so `N(K)/Z(K) ≅ W(Φ)` via
`RootDatum.weylGroupEquiv` (Bruhat–Tits I 6.1.3 c), p. 110, for semisimple `G`; for reductive `G`,
Bruhat–Tits II 4.1.19 (ii), pp. 87–88, in the quasi-split case and 5.1.2, p. 146, and Springer,
Corvallis Part 1, §§3.5 and 3.7, pp. 13–14, where `N(S)(K)/Z(S)(K)` is the relative Weyl group
and the Bruhat decomposition gives generation). -/
theorem rationalPointsRootDatum {K : Type u} [Field K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H) :
    D.rootDatum.IsGenerating ∧ D.rootDatum.weylNormalizer = D.normalizer := sorry

-- Test LocalRootData.opposite_rootSubgroups
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (i j : D.ι) (hij : D.Φ.root j = -D.Φ.root i) :
    GeometricRoots.rootSubgroup D.splitTorus (D.rootIndex i) ≠
      GeometricRoots.rootSubgroup D.splitTorus (D.rootIndex j) := by
  intro h
  apply D.rootDatum.U_ne_of_root_eq_neg i j hij
  rw [D.rootSubgroup_eq i, D.rootSubgroup_eq j, h]

-- Test LocalRootData.realization_isGenerating_anisotropic
/- For an anisotropic group (`S = 1`) the realized root datum is generating, since its torus
`Z_G(1)(K)` is already `G(K)`. -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (hS : D.splitTorus = TauCeti.HopfIdeal.augmentation K H) :
    D.realization.rootDatum.IsGenerating := by
  have hT : D.realization.rootDatum.T = ⊤ := by
    rw [D.realization.centralizer_eq, hS]
    refine eq_top_iff.2 fun g _ R _ _ t => ?_
    have ht : t.val = 1 := TauCeti.CommHopfAlgCat.eq_one_of_mem_quotientPointsSubgroup_augmentation
      H.obj (CommAlgCat.of K R) t.property
    rw [ht]
    exact Commute.one_right _
  rw [RootDatum.IsGenerating, hT, Subgroup.coe_top, Set.univ_union, Subgroup.closure_univ]

-- Test LocalRootData.centralizer_le_normalizer
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) : GeometricRoots.centralizer D.splitTorus ≤ D.normalizer := by
  rw [← D.centralizer_eq]
  exact D.T_le_normalizer

/-! ### The apartment -/

namespace Apartment

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

theorem vadd_def (v : N) (ψ : Apartment φ) (i : ι) (u : D.U i) :
    (v +ᵥ ψ).1.φ i u = ψ.1.φ i u + ((Φ.toLinearMap (Φ.root i) v : ℝ) : WithTop ℝ) := sorry

theorem vadd_displacement (v : N) (x : Apartment φ) :
    (v +ᵥ x).displacement = v + x.displacement := sorry

theorem vsub_displacement (x y : Apartment φ) :
    x -ᵥ y = x.displacement - y.displacement := sorry

/-- The action `ν` of `N` on the apartment (Bruhat–Tits I 6.2.10, p. 122): on valuations it is
`ψ ↦ n·ψ`, and the displacement is lifted so that the translation part of `ν(n)` lies in the
span of the coroots, fixing the central coordinate. The geometric enlarged action is
`rationalAction`, whose central part is given by rational characters. -/
def action : D.weylNormalizer →* (Apartment φ ≃ᵃ[ℝ] Apartment φ) := sorry

/-- `ν(n)` acts on valuations by `ψ ↦ n·ψ` (Bruhat–Tits I 6.2.10 (i), p. 122). -/
theorem action_val [Finite ι] (n : D.weylNormalizer) (x : Apartment φ) :
    (action φ n x).val = x.val.smul n := sorry

/-- The central coordinate is fixed: `ν(n)x − x` lies in the span of the coroots. -/
theorem action_vsub_mem [Finite ι] (n : D.weylNormalizer) (x : Apartment φ) :
    action φ n x -ᵥ x ∈ Submodule.span ℝ (Set.range Φ.coroot) := sorry

/-- The linear part of `ν(n)` is the image of `n` in the Weyl group (Bruhat–Tits I 6.2.10 (i),
p. 122). -/
theorem action_linear [Finite ι] (n : D.weylNormalizer) (x : N) :
    (action φ n).linear x =
      (((D.weylGroupEquiv (QuotientGroup.mk n) : Φ.weylGroup) :
        RootPairing.Aut Φ).coweightEquiv).symm x := sorry

/-- An element `m = u'uu'' ∈ M_a` with `φ_a(u) = k` acts by the reflection in the wall
`a(x − φ) + k = 0`: `x ↦ x − (a(x − φ) + k) a^∨` (Bruhat–Tits I 6.2.7, p. 121, and
6.2.10 (ii), p. 122). -/
theorem action_reflection [Finite ι] (i j : ι) (hij : Φ.root j = -Φ.root i) (u : D.U i)
    (a b : D.U j) (k : ℝ) (hk : φ.φ i u = k)
    (hm : (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i) (x : Apartment φ) :
    (action φ ⟨_, D.reflectionCoset_subset_weylNormalizer i hm⟩ x).displacement =
      x.displacement - (Φ.toLinearMap (Φ.root i) x.displacement + k) • Φ.coroot i := sorry

/-- The filtration at a point: `U_{a,x,r}`. -/
def filtrationAt (x : Apartment φ) (i : ι) (r : ℝ) : Subgroup G := x.val.filtration i r

/-- Moving the point by `v` raises the root values by `a(v)`: `U_{a,v+x,r} = U_{a,x,r−a(v)}`. -/
theorem filtrationAt_vadd (v : N) (x : Apartment φ) (i : ι) (r : ℝ) :
    filtrationAt φ (v +ᵥ x) i r = filtrationAt φ x i (r - Φ.toLinearMap (Φ.root i) v) := sorry

/-- For a finite root system the kernel of the action lies in `T`: an element acting trivially has
trivial image in the Weyl group (Bruhat–Tits I 6.1.11 (ii), p. 115, and 6.2.10 (i), p. 122). -/
theorem ker_action [Finite ι] : (action φ).ker ≤ D.T.subgroupOf D.weylNormalizer := sorry

/-- Transport with a specified displacement; valuations alone do not determine central transport. -/
def transport (base : Apartment φ) : Apartment φ ≃ᵃ[ℝ] Apartment base.val := sorry

theorem transport_displacement (base x : Apartment φ) :
    (transport φ base x).displacement = x.displacement - base.displacement := sorry

-- Test BruhatTits.Apartment.rankZero_singleton
example [Subsingleton N] : Subsingleton (Apartment φ) := sorry

-- Test BruhatTits.Apartment.central_displacement
/- Empty root sets still retain distinct central displacements. -/
example [IsEmpty ι] (v w : N) (h : v ≠ w) :
    (⟨φ, v, fun i => isEmptyElim i⟩ : Apartment φ) ≠
      (⟨φ, w, fun i => isEmptyElim i⟩ : Apartment φ) := by
  intro he
  exact h (congrArg Apartment.displacement he)

-- Test BruhatTits.Apartment.addTorsor_compat
example (ψ₁ ψ₂ : Apartment φ) : (ψ₁ -ᵥ ψ₂) +ᵥ ψ₂ = ψ₁ := vsub_vadd ψ₁ ψ₂

-- Test BruhatTits.Apartment.filtrationAt_two_terms
/- The sign of the translation action on filtrations: if `a(v₁) = 1` and `a(v₂) = 2`, then
`U_{a,v₁+x,1} = U_{a,x,0}` and `U_{a,v₂+x,2} = U_{a,x,0}`. -/
example (x : Apartment φ) (i : ι) (v₁ v₂ : N) (h₁ : Φ.toLinearMap (Φ.root i) v₁ = 1)
    (h₂ : Φ.toLinearMap (Φ.root i) v₂ = 2) :
    filtrationAt φ (v₁ +ᵥ x) i 1 = filtrationAt φ x i 0 ∧
      filtrationAt φ (v₂ +ᵥ x) i 2 = filtrationAt φ x i 0 := by
  rw [filtrationAt_vadd, filtrationAt_vadd, h₁, h₂, sub_self, sub_self]
  exact ⟨rfl, rfl⟩

-- Test BruhatTits.Apartment.sl2_reflection
/- For a rank-one datum (as for `SL₂`), `m = u'uu''` with `φ_a(u) = 0` fixes the base point:
the Weyl element acts on `A ≅ ℝ` by the reflection fixing the base valuation. -/
example [Finite ι] (i j : ι) (hij : Φ.root j = -Φ.root i) (u : D.U i) (a b : D.U j)
    (hu : φ.φ i u = (0 : ℝ)) (hm : (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i) :
    (action φ ⟨_, D.reflectionCoset_subset_weylNormalizer i hm⟩
      ⟨φ, 0, fun i u => by simp⟩).displacement = 0 := by
  rw [action_reflection φ i j hij u a b 0 hu hm]
  simp

-- Test BruhatTits.Apartment.not_linear_space
/- (non-example) Translations act freely, so no point is fixed by all of `V`: the apartment has no
canonical origin. -/
example [Nontrivial N] (x : Apartment φ) : ∃ v : N, v +ᵥ x ≠ x := by
  obtain ⟨v, hv⟩ := exists_ne (0 : N)
  exact ⟨v, fun h => hv (vadd_right_cancel x (h.trans (zero_vadd N x).symm))⟩

-- Test BruhatTits.Valuation.smul_reflection
/- The sign of the action on valuations: for `m = u'uu'' ∈ M_a` with `φ_a(u) = k`,
`m·φ = φ − k a^∨` (Bruhat–Tits I 6.2.7), so `(m·φ)_a = φ_a − 2k`; for `k = 1` the values of
`U_a` drop by `2`, not rise. -/
example [Finite ι] (i j : ι) (hij : Φ.root j = -Φ.root i) (u : D.U i) (a b : D.U j) (k : ℝ)
    (hk : φ.φ i u = k) (hm : (a : G) * (u : G) * (b : G) ∈ D.reflectionCoset i) (y : D.U i) :
    (φ.smul ⟨_, D.reflectionCoset_subset_weylNormalizer i hm⟩).φ i y =
      φ.φ i y + ((-2 * k : ℝ) : WithTop ℝ) := by
  have hv := (action φ ⟨_, D.reflectionCoset_subset_weylNormalizer i hm⟩
    ⟨φ, 0, fun i u => by simp⟩).val_eq i y
  rw [action_val, action_reflection φ i j hij u a b k hk hm] at hv
  rw [show φ.smul ⟨_, D.reflectionCoset_subset_weylNormalizer i hm⟩ =
    (⟨φ, 0, fun i u => by simp⟩ : Apartment φ).val.smul
      ⟨_, D.reflectionCoset_subset_weylNormalizer i hm⟩ from rfl, hv]
  congr 2
  simp only [map_zero, zero_add, zero_sub, map_neg, map_smul, Φ.root_coroot_two, smul_eq_mul]
  ring

-- Test BruhatTits.Apartment.filtrationAt_base
/- (degenerate case) At the base point the filtration is that of the base valuation. -/
example (i : ι) (r : ℝ) :
    filtrationAt φ ⟨φ, 0, fun i u => by simp⟩ i r = φ.filtration i r := rfl

-- Test BruhatTits.Apartment.filtrationAt_mem
/- The sign of the displacement in the filtration: `U_{a,x,r} = {u : φ_a(u) + a(x − φ) ≥ r}`. -/
example (x : Apartment φ) (i : ι) (r : ℝ) (g : G) :
    g ∈ filtrationAt φ x i r ↔ ∃ u : D.U i, (u : G) = g ∧
      (r : WithTop ℝ) ≤ φ.φ i u + ((Φ.toLinearMap (Φ.root i) x.displacement : ℝ) : WithTop ℝ) := by
  rw [filtrationAt, x.val.mem_filtration_iff]
  simp only [x.val_eq]

-- Test BruhatTits.Apartment.transport_base
/- The new base point has displacement `0` in the transported coordinates. -/
example (base : Apartment φ) : (transport φ base base).displacement = 0 := by
  rw [transport_displacement, sub_self]

-- Test BruhatTits.Apartment.transport_val
/- Transport changes coordinates, not points: the root valuations of every point are kept. -/
example (base x : Apartment φ) (i : ι) (u : D.U i) :
    (transport φ base x).val.φ i u = x.val.φ i u := by
  rw [(transport φ base x).val_eq, transport_displacement, base.val_eq, x.val_eq, add_assoc,
    ← WithTop.coe_add, map_sub]
  congr 2
  ring

end Apartment

/-- The enlarged normalizer action. Its reduced component is BT I 6.2.10; its central
component is the negative valuation of rational G-characters, BT II 4.2.16, p. 94. -/
def Apartment.rationalAction {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] : D.normalizer →* (Apartment φ ≃ᵃ[ℝ] Apartment φ) := sorry

/-- On the enlarged rational apartment, a minimal-Levi element translates by its valuation. -/
theorem Apartment.action_torus {K : Type u} [Field K] [ValuativeRel K]
    [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (_hφ : φ.IsCompatible D (torusValuationMap D))
    (z : D.rootDatum.T) (x : Apartment φ) :
    Apartment.rationalAction D φ ⟨z.val, D.T_le_normalizer z.property⟩ x =
      Multiplicative.toAdd (torusValuationMap D z) +ᵥ x := sorry

/-- The root-valuation action is conjugation, including its affine offset. -/
theorem Apartment.rationalAction_valuation {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (n : D.normalizer) (i : D.ι) :
    ∃ j : D.ι,
      (D.rootDatum.U i).map (MulAut.conj n.val).toMonoidHom = D.rootDatum.U j ∧
      ∀ (x : Apartment φ) (u : D.rootDatum.U i) (v : D.rootDatum.U j),
        v.val = n.val * u.val * n.val⁻¹ →
        (Apartment.rationalAction D φ n x).val.φ j v = x.val.φ i u := sorry

/-- Rational G-characters determine every central displacement, including empty root systems. -/
theorem Apartment.rationalAction_central {K : Type u} [Field K] [ValuativeRel K]
    [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (n : D.normalizer) (x : Apartment φ)
    (χ : Additive (GroupLike K H)) :
    GeometricRoots.characterLinear D.splitTorus
      (GeometricRoots.restrictAmbientCharacter D.splitTorus χ)
      (D.cocharacterSpace (Apartment.rationalAction D φ n x -ᵥ x)) =
        -(Multiplicative.toAdd (normalizedOrder (K := K)
          (GeometricRoots.ambientCharacterValue χ n.val)) : ℤ) := sorry

/-- Conjugation by `n ∈ N(K)` with `n U_a n⁻¹ = U_b` transports the filtrations at a point:
`n U_{a,x,r} n⁻¹ = U_{b,ν(n)x,r}` (Bruhat–Tits I 6.2.10 (iii), p. 122). For `z ∈ Z(K)` this is
`z U_{a,x,r} z⁻¹ = U_{a,z·x,r}`. -/
theorem Apartment.filtrationAt_conj {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (n : D.normalizer) (x : Apartment φ)
    (i j : D.ι) (hij : (D.rootDatum.U i).map (MulAut.conj n.val).toMonoidHom = D.rootDatum.U j)
    (r : ℝ) :
    (Apartment.filtrationAt φ x i r).map (MulAut.conj n.val).toMonoidHom =
      Apartment.filtrationAt φ (Apartment.rationalAction D φ n x) j r := sorry

/-- The rank-one estimate: for `r + s > 0`,
`U_{a,x,r} U_{−a,x,s} ⊆ U_{−a,x,s} Z(K)¹ U_{a,x,r}` (Bruhat–Tits I 6.3.9, p. 131, with
`k′ = 2r`, `l′ = 2s`, also 6.4.7 (QC1) and 6.4.9, pp. 135–136;
the torus factor acts trivially on the apartment; for `G(K)` it lies in `Z(K)¹ = boundedPart D`). -/
theorem Apartment.opposite_filtrationAt_mul {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (x : Apartment φ) (i j : D.ι)
    (hij : D.Φ.root j = -D.Φ.root i) (r s : ℝ) (hrs : 0 < r + s)
    (u v : WithConv (H →ₐ[K] K)) (hu : u ∈ Apartment.filtrationAt φ x i r)
    (hv : v ∈ Apartment.filtrationAt φ x j s) :
    ∃ v' ∈ Apartment.filtrationAt φ x j s, ∃ t : D.rootDatum.T, t ∈ boundedPart D ∧
      ∃ u' ∈ Apartment.filtrationAt φ x i r, u * v = v' * (t : WithConv (H →ₐ[K] K)) * u' := sorry

-- Test BruhatTits.Apartment.rationalAction_boundedPart
/- (degenerate case) A bounded element `z ∈ Z(K)¹ = ker v` fixes every point of the enlarged
apartment. -/
example {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (z : D.rootDatum.T) (hz : z ∈ boundedPart D) (x : Apartment φ) :
    Apartment.rationalAction D φ ⟨z.val, D.T_le_normalizer z.property⟩ x = x := by
  rw [Apartment.action_torus D φ GeometricValuation.compatible z x, MonoidHom.mem_ker.1 hz,
    toAdd_one, zero_vadd]

-- Test BruhatTits.Apartment.rationalAction_conj_torus
/- Conjugation and the action agree: for `z ∈ Z(K)` with `⟨a, v(z)⟩ = −1`,
`z U_{a,x,r} z⁻¹ = U_{a,z·x,r} = U_{a,x,r+1}`. -/
example {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (x : Apartment φ) (i : D.ι) (z : D.rootDatum.T)
    (hz : D.Φ.toLinearMap (D.Φ.root i) (Multiplicative.toAdd (torusValuationMap D z)) = -1)
    (r : ℝ) :
    (Apartment.filtrationAt φ x i r).map (MulAut.conj (z : WithConv (H →ₐ[K] K))).toMonoidHom =
        Apartment.filtrationAt φ
          (Apartment.rationalAction D φ ⟨z.val, D.T_le_normalizer z.property⟩ x) i r ∧
      (Apartment.filtrationAt φ x i r).map (MulAut.conj (z : WithConv (H →ₐ[K] K))).toMonoidHom =
        Apartment.filtrationAt φ x i (r + 1) := by
  have hU : (D.rootDatum.U i).map (MulAut.conj (z : WithConv (H →ₐ[K] K))).toMonoidHom =
      D.rootDatum.U i :=
    Subgroup.mem_normalizer_iff_map_conj_eq.1 (D.rootDatum.le_normalizer i z.property)
  have h := Apartment.filtrationAt_conj D φ ⟨z.val, D.T_le_normalizer z.property⟩ x i i hU r
  refine ⟨h, ?_⟩
  rw [h, Apartment.action_torus D φ GeometricValuation.compatible z x, Apartment.filtrationAt_vadd,
    hz, sub_neg_eq_add]

-- Test torusValuationMap.trivial_valuation_not_full
/- The hypotheses of `translationLattice_span` are needed: a homomorphism `Z(K) → V` that is
identically zero, as the formula `⟨χ, v(z)⟩ = −ω(χ(z))` would give for the trivial valuation,
has image spanning `0 ≠ V` as soon as `V ≠ 0`. -/
example {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) [Nontrivial D.V] :
    Submodule.span ℝ (Set.range fun z : D.rootDatum.T =>
      Multiplicative.toAdd ((1 : D.rootDatum.T →* Multiplicative D.V) z)) ≠ ⊤ := by
  have h : (Set.range fun z : D.rootDatum.T =>
      Multiplicative.toAdd ((1 : D.rootDatum.T →* Multiplicative D.V) z)) = {0} := by
    ext v
    simp
  rw [h, Submodule.span_singleton_eq_bot.2 rfl]
  exact bot_ne_top

-- Test Apartment.central_transport_ambiguity
/- Two base points with the same valuation and displacements `v ≠ w` (possible when no root sees
`v − w`, for instance for an empty root system) give different coordinate transports. -/
example {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) [IsEmpty ι] (x : Apartment φ) (v w : N) (h : v ≠ w) :
    (Apartment.transport φ ⟨φ, v, fun i => isEmptyElim i⟩ x).displacement ≠
      (Apartment.transport φ ⟨φ, w, fun i => isEmptyElim i⟩ x).displacement := by
  rw [Apartment.transport_displacement, Apartment.transport_displacement]
  exact fun he => h (sub_right_injective he)

/-! ### Affine roots -/

/-- An affine root `a + k` with `a ∈ Φ` and `k ∈ Γ'_a`, the value set of elements maximal on their
`U_{2a}`-coset (not the full value set `Γ_a`). -/
structure AffineRoot {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) where
  /-- The gradient `a`. -/
  gradient : ι
  /-- The constant `k`. -/
  constant : ℝ
  mem_valueSet : constant ∈ φ.primedValueSet gradient

namespace AffineRoot

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} {φ : Valuation D}

/-- The wall `∂α = {x : a(x − φ) + k = 0}` of the affine root `α = a + k`, where `x − φ` is the
displacement of `x` (Bruhat–Tits I 6.2.6, p. 120). -/
def wall (α : AffineRoot φ) : Set (Apartment φ) :=
  {x | Φ.toLinearMap (Φ.root α.gradient) x.displacement + α.constant = 0}

/-- The root subgroup `U_α = U_{a,k}`. -/
def rootSubgroup (α : AffineRoot φ) : Subgroup G := φ.filtration α.gradient α.constant

theorem rootSubgroup_mono (α β : AffineRoot φ) (h : α.gradient = β.gradient)
    (hk : α.constant ≤ β.constant) : β.rootSubgroup ≤ α.rootSubgroup := by
  unfold rootSubgroup
  rw [h]
  exact φ.filtration_antitone β.gradient hk

/-- The set of constants of affine roots with gradient `a`; it is `Γ'_a` (`valueSet_eq`). -/
def valueSet (φ : Valuation D) (i : ι) : Set ℝ :=
  {k | ∃ α : AffineRoot φ, α.gradient = i ∧ α.constant = k}

theorem valueSet_eq (φ : Valuation D) (i : ι) : valueSet φ i = φ.primedValueSet i := by
  ext k
  constructor
  · rintro ⟨α, rfl, rfl⟩
    exact α.mem_valueSet
  · intro hk
    exact ⟨⟨i, k, hk⟩, rfl, rfl⟩

/-- The filtration at a point is decreasing in the depth. -/
theorem filtrationAt_antitone (x : Apartment φ) (i : ι) {r s : ℝ} (h : r ≤ s) :
    Apartment.filtrationAt φ x i s ≤ Apartment.filtrationAt φ x i r :=
  x.val.filtration_antitone i h

/-- Commutator estimates at a point, for non-proportional roots: (V3) for the valuation of `x`. -/
theorem commutator_le (x : Apartment φ) (i j : ι) (r s : ℝ)
    (hij : ∀ c : ℝ, Φ.root j ≠ c • Φ.root i) :
    ⁅Apartment.filtrationAt φ x i r, Apartment.filtrationAt φ x j s⁆ ≤
      ⨆ (k : ι) (p : ℕ) (q : ℕ) (_ : 0 < p ∧ 0 < q ∧
        Φ.root k = (p : ℝ) • Φ.root i + (q : ℝ) • Φ.root j),
        Apartment.filtrationAt φ x k (p * r + q * s) :=
  x.val.commutator_filtration_le i j (fun c _ h => hij (-c) (by rw [h, neg_smul])) r s

-- Test BruhatTits.AffineRoot.rootSubgroup_top
/- `U_{a,∞} = ⋂_k U_{a,k} = {1}`. -/
example (i : ι) : ⨅ k : ℝ, φ.filtration i k = ⊥ := by
  rw [eq_bot_iff]
  intro g hg
  rw [Subgroup.mem_iInf] at hg
  obtain ⟨u, rfl, -⟩ := (φ.mem_filtration_iff i 0 g).1 (hg 0)
  have htop : φ.φ i u = ⊤ := by
    refine WithTop.eq_top_iff_forall_ge.2 fun k => ?_
    obtain ⟨u', hu', hk⟩ := (φ.mem_filtration_iff i k u).1 (hg k)
    rwa [Subtype.ext hu'] at hk
  rw [(φ.φ_eq_top_iff i u).1 htop]
  exact Subgroup.mem_bot.2 rfl

-- Test BruhatTits.AffineRoot.wall_base
example (α : AffineRoot φ) : (⟨φ, 0, fun i u => by simp⟩ : Apartment φ) ∈ α.wall ↔
    α.constant = 0 := by
  simp [wall]

-- Test BruhatTits.AffineRoot.wall_vadd
example (α : AffineRoot φ) (v : N) (x : Apartment φ) :
    v +ᵥ x ∈ α.wall ↔ Φ.toLinearMap (Φ.root α.gradient) v +
      Φ.toLinearMap (Φ.root α.gradient) x.displacement + α.constant = 0 := by
  simp only [wall, Set.mem_ofPred_eq, Apartment.vadd_displacement, map_add]

-- Test BruhatTits.AffineRoot.wall_ne_univ
/- (non-example) A wall is a proper subset: the base point and its translate by `a^∨` cannot both
satisfy `a(x − φ) + k = 0`, since `a(a^∨) = 2`. -/
example (α : AffineRoot φ) : α.wall ≠ Set.univ := by
  intro h
  have h0 : (⟨φ, 0, fun i u => by simp⟩ : Apartment φ) ∈ α.wall := h ▸ Set.mem_univ _
  have h1 : Φ.coroot α.gradient +ᵥ (⟨φ, 0, fun i u => by simp⟩ : Apartment φ) ∈ α.wall :=
    h ▸ Set.mem_univ _
  simp only [wall, Set.mem_ofPred_eq, Apartment.vadd_displacement, add_zero, map_zero,
    zero_add, Φ.root_coroot_two] at h0 h1
  rw [h0] at h1
  norm_num at h1

-- Test BruhatTits.AffineRoot.sl2_affine_roots
/- For a non-multipliable root with value set `Γ_a = ℤ` (as for `SL₂` with `ω(K^×) = ℤ`), the
affine roots of gradient `a` are `a + n`, `n ∈ ℤ`. -/
example (i : ι) (hnm : ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i)
    (hΓ : φ.valueSet i = Set.range (Int.cast : ℤ → ℝ)) :
    valueSet φ i = Set.range (Int.cast : ℤ → ℝ) := by
  rw [valueSet_eq, ← hΓ]
  refine Set.Subset.antisymm (φ.primedValueSet_subset_valueSet i) ?_
  rintro r ⟨u, hu, hφ⟩
  exact ⟨u, hu, hφ, fun j hj => absurd hj (hnm j)⟩

-- Test BruhatTits.AffineRoot.not_all_values
/- For the ramified `SU₃` in odd residue characteristic with `ω(K^×) = ℤ`, a multipliable root has
`Γ'_a = ½ℤ ⊊ ¼ℤ = Γ_a`, so using `Γ_a` as the set of affine-root constants adds spurious walls
(Bruhat–Tits II 4.2.21, p. 98). -/
example : ∃ (G : Type) (_ : Group G) (Φ : RootPairing (Fin 4) ℝ ℝ ℝ) (D : RootDatum G Φ)
    (φ : Valuation D) (i : Fin 4),
    φ.primedValueSet i = Set.range (fun n : ℤ => (n : ℝ) / 2) ∧
      φ.valueSet i = Set.range (fun n : ℤ => (n : ℝ) / 4) := sorry

-- Test BruhatTits.AffineRoot.rootSubgroup_ne_bot
/- (non-example) `U_α ≠ {1}`: the constant `k ∈ Γ'_a` of `α = a + k` is the value of some
`u ≠ 1`, which lies in `U_{a,k}`. -/
example (α : AffineRoot φ) : α.rootSubgroup ≠ ⊥ := by
  obtain ⟨u, hu, hφ, -⟩ := α.mem_valueSet
  intro h
  have hmem : (u : G) ∈ α.rootSubgroup :=
    (φ.mem_filtration_iff α.gradient α.constant u).2 ⟨u, rfl, hφ.ge⟩
  rw [h, Subgroup.mem_bot] at hmem
  exact hu (Subtype.ext hmem)

-- Test BruhatTits.AffineRoot.rootSubgroup_le
/- `U_α ⊆ U_a`: the group of an affine root lies in the root group of its gradient. -/
example (α : AffineRoot φ) : α.rootSubgroup ≤ D.U α.gradient := by
  intro g hg
  obtain ⟨u, rfl, -⟩ := (φ.mem_filtration_iff α.gradient α.constant g).1 hg
  exact u.2

end AffineRoot

/-! ### Quasi-split coordinates -/

namespace QuasiSplit

/-- The group `H₀(K', K) = {(u, v) : v + v̄ = u ū}` with `(u,v)(u',v') = (u+u', v+v'+ū u')` and
`(u,v)⁻¹ = (-u, v̄)` (Bruhat–Tits II, 4.1.9 (4)–(5), p. 82). Here `v ↦ v̄` is the star operation of
`K'`; in the source it is the nontrivial automorphism of a separable quadratic extension. -/
def H0 (K' : Type u) [Field K'] [StarRing K'] : Type u :=
  {p : K' × K' // p.2 + star p.2 = p.1 * star p.1}

instance (K' : Type u) [Field K'] [StarRing K'] : Group (H0 K') where
  mul x y := ⟨(x.1.1 + y.1.1, x.1.2 + y.1.2 + star x.1.1 * y.1.1), by
    obtain ⟨⟨u, v⟩, hx⟩ := x
    obtain ⟨⟨u', v'⟩, hy⟩ := y
    simp only [star_add, star_mul', star_star] at hx hy ⊢
    linear_combination hx + hy⟩
  one := ⟨(0, 0), by simp⟩
  inv x := ⟨(-x.1.1, star x.1.2), by
    obtain ⟨⟨u, v⟩, hx⟩ := x
    simp only [star_star, star_neg, neg_mul_neg] at hx ⊢
    linear_combination hx⟩
  mul_assoc x y z := by
    apply Subtype.ext
    ext
    · show x.1.1 + y.1.1 + z.1.1 = x.1.1 + (y.1.1 + z.1.1)
      ring
    · show x.1.2 + y.1.2 + star x.1.1 * y.1.1 + z.1.2 + star (x.1.1 + y.1.1) * z.1.1 =
        x.1.2 + (y.1.2 + z.1.2 + star y.1.1 * z.1.1) + star x.1.1 * (y.1.1 + z.1.1)
      rw [star_add]
      ring
  one_mul x := by
    apply Subtype.ext
    ext
    · show 0 + x.1.1 = x.1.1
      ring
    · show 0 + x.1.2 + star 0 * x.1.1 = x.1.2
      simp
  mul_one x := by
    apply Subtype.ext
    ext
    · show x.1.1 + 0 = x.1.1
      ring
    · show x.1.2 + 0 + star x.1.1 * 0 = x.1.2
      simp
  inv_mul_cancel x := by
    obtain ⟨⟨u, v⟩, hx⟩ := x
    apply Subtype.ext
    ext
    · show -u + u = 0
      ring
    · show star v + v + star (-u) * u = 0
      simp only [star_neg, neg_mul]
      linear_combination hx

-- Test BruhatTits.QuasiSplit.H0_mul_assoc
/- The product and inverse are the displayed formulas; the group axioms are proved in the
instance above. -/
example (K' : Type u) [Field K'] [StarRing K'] (x y : H0 K') :
    (x * y).1 = (x.1.1 + y.1.1, x.1.2 + y.1.2 + star x.1.1 * y.1.1) ∧
      (x⁻¹).1 = (-x.1.1, star x.1.2) := ⟨rfl, rfl⟩

-- Test BruhatTits.QuasiSplit.not_additive_multipliable
/- For `δ ≠ 0` with `δ̄ = -δ` and `2 ≠ 0`, the elements `(1, 1/2)` and `(δ, δδ̄/2)` of `H₀` do not
commute (their commutator is `(0, 2δ)`). -/
example (K' : Type u) [Field K'] [StarRing K'] (δ : K') (hδ : star δ = -δ) (hδ0 : δ ≠ 0)
    (h2 : (2 : K') ≠ 0) : ∃ x y : H0 K', x * y ≠ y * x := by
  refine ⟨⟨(1, 1 / 2), ?_⟩, ⟨(δ, δ * star δ / 2), ?_⟩, ?_⟩
  · simp only [star_one, mul_one, star_div₀, star_ofNat]
    field_simp
    norm_num
  · simp only [star_div₀, star_mul', star_star, star_ofNat]
    field_simp
    ring
  · intro h
    have h' := congrArg (fun z : H0 K' => z.1.2) h
    change (1 / 2 + δ * star δ / 2 + star 1 * δ) = δ * star δ / 2 + 1 / 2 + star δ * 1 at h'
    rw [hδ, star_one] at h'
    apply hδ0
    have h2δ : (2 : K') * δ = 0 := by linear_combination h'
    rcases mul_eq_zero.1 h2δ with h | h
    · exact absurd h h2
    · exact h

-- Test BruhatTits.QuasiSplit.H0_commutator
/- `(u, v)` and `(u', v')` commute up to the element `(0, ū u' − ū' u)` of `U_{2a}`:
`(u, v)(u', v')` has first coordinate `u + u'` and second coordinate that of `(u', v')(u, v)`
plus `ū u' − ū' u`. -/
example (K' : Type u) [Field K'] [StarRing K'] (x y : H0 K') :
    (x * y).1 = ((y * x).1.1, (y * x).1.2 + (star x.1.1 * y.1.1 - star y.1.1 * x.1.1)) := by
  show (x.1.1 + y.1.1, x.1.2 + y.1.2 + star x.1.1 * y.1.1) =
    (y.1.1 + x.1.1, y.1.2 + x.1.2 + star y.1.1 * x.1.1 + (star x.1.1 * y.1.1 - star y.1.1 * x.1.1))
  rw [Prod.mk.injEq]
  constructor <;> ring

-- Test BruhatTits.QuasiSplit.H0_trivial_star
/- With the trivial involution (here on `ℝ`) the law is commutative: the noncommutativity of `H₀`
comes from the conjugation of the quadratic extension. -/
example (x y : H0 ℝ) : x * y = y * x := by
  apply Subtype.ext
  show (x.1.1 + y.1.1, x.1.2 + y.1.2 + star x.1.1 * y.1.1) =
    (y.1.1 + x.1.1, y.1.2 + x.1.2 + star y.1.1 * x.1.1)
  simp only [star_trivial]
  rw [Prod.mk.injEq]
  constructor <;> ring

section RootField

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- The field of definition `K_a ⊂ K̄` of the absolute root `i`: the subfield of the finite Galois
splitting field `D.splittingField` fixed by the stabilizer of `i` for the Galois action on the based
root datum, characterized by `rootField_le_splittingField` and `rootField_fixed_iff`. (For an
imperfect `K` the subfield of all of `K̄` fixed by that stabilizer contains the perfect closure of
`K` and is not finite over `K`.) For a quasi-split group, and `a` the
restriction of `i` to the maximal split torus, it is the field `L_a` of Bruhat–Tits II, 4.1.8,
p. 81 (and `L_a ⊃ L_{2a}` for a multipliable `a`, 4.1.14, p. 85). -/
def rootField (D : AbsoluteRootData K H) (i : D.ι) : IntermediateField K (AlgebraicClosure K) :=
  sorry

/-- `K_a` lies in the finite Galois splitting field of the Galois action. -/
theorem rootField_le_splittingField (D : AbsoluteRootData K H) (i : D.ι) :
    rootField D i ≤ D.splittingField := sorry

/-- An automorphism of `K̄` fixes `K_a` pointwise exactly when it fixes the root `i`. -/
theorem rootField_fixed_iff (D : AbsoluteRootData K H) (i : D.ι)
    (γ : Field.absoluteGaloisGroup K) :
    (∀ x ∈ rootField D i, (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from γ) x = x) ↔
      (D.galoisAction γ).indexEquiv i = i := sorry

-- Test BruhatTits.QuasiSplit.split_case
/- If the Galois action on the root datum is trivial, as for a split group, every `K_a` is `K`. -/
example (D : AbsoluteRootData K H) (h : ∀ γ, D.galoisAction γ = 1) (i : D.ι) :
    rootField D i = ⊥ := sorry

-- Test BruhatTits.QuasiSplit.rootField_finite
/- `K_a / K` is finite: the fixed field of the stabilizer of a root, not of a non-open subgroup. -/
example (D : AbsoluteRootData K H) (i : D.ι) : FiniteDimensional K (rootField D i) := sorry

-- Test BruhatTits.QuasiSplit.rootField_ne_bot
/- (non-example) If some Galois element moves the root, then `K_a ≠ K`. -/
example (D : AbsoluteRootData K H) (i : D.ι) (γ : Field.absoluteGaloisGroup K)
    (hγ : (D.galoisAction γ).indexEquiv i ≠ i) : rootField D i ≠ ⊥ := by
  intro h
  apply hγ
  refine (rootField_fixed_iff D i γ).1 fun x hx => ?_
  rw [h, IntermediateField.mem_bot] at hx
  obtain ⟨k, rfl⟩ := hx
  exact AlgEquiv.commutes _ k

end RootField

/-- The unitary root coordinates `u_i(c, d) = I + g` (rows and columns indexed `-1, 0, 1`):
`g_{-1,0} = -τ c`, `g_{0,1} = c`, `g_{-1,1} = d` (Bruhat–Tits II, 4.1.9 (3), p. 82; [van Hoften],
Appendix A by R. Zhou, A.3.6, pp. 60–61). -/
def unitaryCoord (K' : Type u) [Field K'] (τ : K' ≃+* K') (c d : K') :
    Matrix (Fin 3) (Fin 3) K' :=
  Matrix.of ![![1, -τ c, d], ![0, 1, c], ![0, 0, 1]]

/-- The antidiagonal hermitian form `x̄_{-1} x_1 + x̄_0 x_0 + x̄_1 x_{-1}` defining `SU₃`
(Bruhat–Tits II, 4.1.9, p. 82). -/
def antidiagonalForm (K' : Type u) [Field K'] : Matrix (Fin 3) (Fin 3) K' :=
  Matrix.of ![![0, 0, 1], ![0, 1, 0], ![1, 0, 0]]

/-- For an involution `τ`, `u_i(c, d)` preserves the antidiagonal form exactly when
`τ(c) c + d + τ(d) = 0`; it is unipotent, so it then lies in `SU₃`. -/
theorem unitaryCoord_mem_iff (K' : Type u) [Field K'] (τ : K' ≃+* K')
    (hτ : Function.Involutive τ) (c d : K') :
    (Matrix.of fun i j => τ (unitaryCoord K' τ c d j i)) * antidiagonalForm K' *
        unitaryCoord K' τ c d = antidiagonalForm K' ↔
      τ c * c + d + τ d = 0 := sorry

-- Test BruhatTits.QuasiSplit.unitaryCoord_zero
example (K' : Type u) [Field K'] (τ : K' ≃+* K') : unitaryCoord K' τ 0 0 = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [unitaryCoord]

-- Test BruhatTits.QuasiSplit.unitaryCoord_identity
/- Over `𝔽₂` with `τ = id` (residue characteristic two) the condition reads `c² = 0`: by direct
matrix computation `u(0, 1)` preserves the form and `u(1, 0)` does not. -/
example :
    (Matrix.of fun i j => (RingEquiv.refl (ZMod 2))
        (unitaryCoord (ZMod 2) (RingEquiv.refl _) 0 1 j i)) *
      antidiagonalForm (ZMod 2) * unitaryCoord (ZMod 2) (RingEquiv.refl _) 0 1 =
        antidiagonalForm (ZMod 2) ∧
    (Matrix.of fun i j => (RingEquiv.refl (ZMod 2))
        (unitaryCoord (ZMod 2) (RingEquiv.refl _) 1 0 j i)) *
      antidiagonalForm (ZMod 2) * unitaryCoord (ZMod 2) (RingEquiv.refl _) 1 0 ≠
        antidiagonalForm (ZMod 2) := by
  decide

-- Test BruhatTits.QuasiSplit.unitaryCoord_quadratic
/- Over `𝔽₄` with the involution `x ↦ x²` there is a unitary `u(1, d)`: the condition reads
`1 + d + d² = 0`, solved by a primitive cube root of unity. -/
example : ∃ d : GaloisField 2 2,
    (Matrix.of fun i j => frobeniusEquiv (GaloisField 2 2) 2
        (unitaryCoord _ (frobeniusEquiv (GaloisField 2 2) 2) 1 d j i)) *
      antidiagonalForm _ * unitaryCoord _ (frobeniusEquiv (GaloisField 2 2) 2) 1 d =
        antidiagonalForm _ := sorry

-- Test BruhatTits.QuasiSplit.unitaryCoord_not_cubic
/- The involution hypothesis is needed: for the order-three automorphism `x ↦ x²` of `𝔽₈` the
equivalence fails at some `(c, d)` with `τ² c ≠ c` and `τ(c) c + d + τ(d) = 0`. -/
example : ¬ ∀ c d : GaloisField 2 3,
    ((Matrix.of fun i j => frobeniusEquiv (GaloisField 2 3) 2
        (unitaryCoord _ (frobeniusEquiv (GaloisField 2 3) 2) c d j i)) *
      antidiagonalForm _ * unitaryCoord _ (frobeniusEquiv (GaloisField 2 3) 2) c d =
        antidiagonalForm _ ↔
      frobeniusEquiv (GaloisField 2 3) 2 c * c + d + frobeniusEquiv (GaloisField 2 3) 2 d = 0) :=
  sorry

/-- A quasi-split group has a compatible valuation of its rational root datum, defined by a
Chevalley–Steinberg system (Bruhat–Tits II, hypotheses of §4.2, p. 88, and Theorem 4.2.3,
pp. 89–90; compatibility 4.2.7–4.2.8, p. 91). Quasi-splitness is the torus-centralizer criterion
of 4.1.1, p. 77. -/
theorem valuation {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    [HenselianLocalRing 𝒪[K]]
    (D : LocalRootData K H)
    (_quasiSplit : TauCeti.torusCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (GeometricRoots.centralizerIdeal D.splitTorus))) :
    ∃ φ : Valuation D.rootDatum, φ.IsCompatible D (torusValuationMap D) := sorry

/-- BT II Theorem 4.2.3, pp. 89–90, in its real-valued scope (hypotheses of §4.2, p. 88).
The valuation is nontrivial and has a unique extension to a finite Galois splitting field.
Discreteness, completeness and perfect residue field are not required here. -/
theorem valuation_real {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (hqs : TauCeti.torusCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (GeometricRoots.centralizerIdeal D.splitTorus)))
    (ω : AddValuation K (WithTop ℝ)) (hnt : ∃ x : Kˣ, ω (x : K) ≠ 0)
    (K' : Type u) [Field K'] [Algebra K K'] [FiniteDimensional K K'] [IsGalois K K']
    (hsplit : TauCeti.splitTorusCommHopfAlgProperty K'
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K')
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (GeometricRoots.centralizerIdeal D.splitTorus))))
    (ω' : AddValuation K' (WithTop ℝ))
    (hext : ∀ x : K, ω' (algebraMap K K' x) = ω x)
    (hunique : ∀ w : AddValuation K' (WithTop ℝ),
      (∀ x : K, w (algebraMap K K' x) = ω x) → w = ω') :
    ∃ (v : D.rootDatum.T →* Multiplicative D.V) (φ : Valuation D.rootDatum),
      φ.IsCompatible D v ∧
      ∀ (χ : GeometricRoots.Character (GeometricRoots.centralizerIdeal D.splitTorus))
        (z : D.rootDatum.T),
        ((-GeometricRoots.characterLinear D.splitTorus
          (GeometricRoots.restrictCharacter D.splitTorus χ)
          (D.cocharacterSpace (Multiplicative.toAdd (v z))) : ℝ) : WithTop ℝ) =
          ω (GeometricRoots.characterValue _ χ K (minimalLeviPoint D z) : K) := sorry

end QuasiSplit

/-! ### Existence, descent, facets, échelonnage, affine Weyl group -/

/-- Existence of a compatible valuation of the rational root datum, unique up to equipollence, over
a henselian field with a nontrivial discrete valuation of rank one and perfect residue field
(Bruhat–Tits II, 5.1.1, pp. 145–146, for the scope; Theorem 5.1.20, pp. 153–154; Proposition
5.1.23, p. 155). -/
theorem exists_valuation_compatible {K : Type u} [Field K] [ValuativeRel K]
    [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    [HenselianLocalRing 𝒪[K]] [PerfectField 𝓀[K]] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) :
    ∃ φ : Valuation D.rootDatum, φ.IsCompatible D (torusValuationMap D) ∧
      ∀ ψ : Valuation D.rootDatum, ψ.IsCompatible D (torusValuationMap D) → Equipollent φ ψ :=
  sorry

-- Test BruhatTits.Valuation.isCompatible_rankZero
/- With no relative roots every valuation is compatible with every homomorphism `Z(K) → V`. -/
example {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) [IsEmpty D.ι] (v : D.rootDatum.T →* Multiplicative D.V)
    (φ : Valuation D.rootDatum) : φ.IsCompatible D v :=
  fun i => isEmptyElim i

-- Test BruhatTits.Valuation.isCompatible_iff_filtrationAt
/- Compatibility with `v` says that `z ∈ Z(K)` moves the base point `φ` of the apartment by
`v(z)`: `z U_{a,φ,r} z⁻¹ = U_{a, v(z) + φ, r}`. -/
example {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (v : D.rootDatum.T →* Multiplicative D.V)
    (φ : Valuation D.rootDatum) :
    φ.IsCompatible D v ↔ ∀ (i : D.ι) (z : D.rootDatum.T) (r : ℝ),
      (φ.filtration i r).map (MulAut.conj (z : WithConv (H →ₐ[K] K))).toMonoidHom =
        Apartment.filtrationAt φ
          (Multiplicative.toAdd (v z) +ᵥ (⟨φ, 0, fun i u => by simp⟩ : Apartment φ)) i r := by
  simp only [Apartment.filtrationAt_vadd]
  rfl

-- Test BruhatTits.Valuation.isCompatible_not_inv
/- (non-example) The sign of `v` is forced: a valuation compatible with both `v` and `v⁻¹` sees no
translation at all, since `U_{a,r−c} = U_{a,r+c}` for all `r` and `c ≠ 0` would make the
filtration of the nontrivial group `U_a` constant. -/
example {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (D : LocalRootData K H) (v : D.rootDatum.T →* Multiplicative D.V)
    (φ : Valuation D.rootDatum) (hv : φ.IsCompatible D v) (hv' : φ.IsCompatible D v⁻¹)
    (i : D.ι) (z : D.rootDatum.T) :
    D.Φ.toLinearMap (D.Φ.root i) (Multiplicative.toAdd (v z)) = 0 := sorry

namespace AffineRoot

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} {φ : Valuation D}

/-- The value `α(x) = a(x - φ) + k` of the affine root `α = a + k` at a point `x` of the apartment,
computed from the displacement of `x` from the base valuation `φ` (Bruhat–Tits I, 6.2.6, p. 120). -/
def eval (α : AffineRoot φ) (x : Apartment φ) : ℝ :=
  Φ.toLinearMap (Φ.root α.gradient) x.displacement + α.constant

/-- The wall of `α` is its zero set. -/
theorem mem_wall_iff (α : AffineRoot φ) (x : Apartment φ) : x ∈ α.wall ↔ α.eval x = 0 := sorry

/-- The reflection in the wall of `α = a + k`: `x ↦ x - α(x) a^∨`, with linear part the
reflection of `Φ` (Bruhat–Tits I, 6.2.10 (ii), p. 122). -/
def reflection (α : AffineRoot φ) : Apartment φ ≃ᵃ[ℝ] Apartment φ := sorry

theorem reflection_apply (α : AffineRoot φ) (x : Apartment φ) :
    α.reflection x = (-α.eval x) • Φ.coroot α.gradient +ᵥ x := sorry

-- Test BruhatTits.AffineRoot.eval_base
/- At the base point `φ` (displacement `0`) the affine root `a + k` takes the value `k`. -/
example (α : AffineRoot φ) : α.eval ⟨φ, 0, fun i u => by simp⟩ = α.constant := by
  simp [eval]

-- Test BruhatTits.AffineRoot.eval_coroot_two_terms
/- Moving by `a^∨` and by `2a^∨` raises `α(x) = a(x − φ) + k` by `2` and by `4`: the gradient
enters with the sign of `a`, not of `−a`. -/
example (α : AffineRoot φ) (x : Apartment φ) :
    α.eval (Φ.coroot α.gradient +ᵥ x) = α.eval x + 2 ∧
      α.eval ((2 : ℝ) • Φ.coroot α.gradient +ᵥ x) = α.eval x + 4 := by
  simp only [eval, Apartment.vadd_displacement, map_add, map_smul, RootPairing.root_coroot_two,
    smul_eq_mul]
  constructor <;> ring

-- Test BruhatTits.AffineRoot.reflection_involutive
/- The reflection reverses the sign of `α` and is an involution different from the identity. -/
example (α : AffineRoot φ) (x : Apartment φ) :
    α.eval (α.reflection x) = -α.eval x ∧ α.reflection (α.reflection x) = x ∧
      α.reflection ≠ AffineEquiv.refl ℝ (Apartment φ) := by
  have hneg : ∀ y, α.eval (α.reflection y) = -α.eval y := fun y => by
    rw [reflection_apply]
    simp only [eval, Apartment.vadd_displacement, map_add, map_smul, RootPairing.root_coroot_two,
      smul_eq_mul]
    ring
  refine ⟨hneg x, ?_, fun h => ?_⟩
  · rw [reflection_apply α (α.reflection x), hneg x, neg_neg, reflection_apply α x, vadd_vadd,
      ← add_smul, add_neg_cancel, zero_smul, zero_vadd]
  · have h0 : ∀ y, α.eval y = 0 := fun y => by
      have := hneg y
      rw [h, AffineEquiv.refl_apply] at this
      linarith
    have h2 := h0 (Φ.coroot α.gradient +ᵥ x)
    simp only [eval, Apartment.vadd_displacement, map_add, RootPairing.root_coroot_two] at h2
    have h1 := h0 x
    simp only [eval] at h1
    linarith

end AffineRoot

/-- Facets of the apartment: the classes of points on which every affine root has the same sign
(`Facet.mem_carrier_iff`); for a discrete valuation with finitely many root directions these are
the facets of Bruhat–Tits I, 1.3.3, pp. 20–21 (see 7.2.5, p. 162). -/
def Facet {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Type (max u v) := sorry

namespace Facet

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} {φ : Valuation D}

/-- The union of all walls. -/
def wall (φ : Valuation D) : Set (Apartment φ) := ⋃ α : AffineRoot φ, α.wall

/-- The underlying set of a facet. -/
def carrier (F : Facet φ) : Set (Apartment φ) := sorry

/-- Every facet is nonempty. -/
theorem carrier_nonempty (F : Facet φ) : F.carrier.Nonempty := sorry

/-- Every point of the apartment lies in exactly one facet. -/
theorem existsUnique_mem_carrier (x : Apartment φ) : ∃! F : Facet φ, x ∈ F.carrier := sorry

/-- A facet is a full sign class: `y` lies in the facet of `x` exactly when every affine root has
the same sign at `y` as at `x`, the value `0` included. -/
theorem mem_carrier_iff {F : Facet φ} {x : Apartment φ} (hx : x ∈ F.carrier) (y : Apartment φ) :
    y ∈ F.carrier ↔ ∀ α : AffineRoot φ, SignType.sign (α.eval y) = SignType.sign (α.eval x) :=
  sorry

/-- An alcove is a facet meeting no wall (an open facet). -/
def IsAlcove (F : Facet φ) : Prop := F.carrier ∩ wall φ = ∅

/-- The closure order: every affine root nonnegative on `F'` is nonnegative on `F` (equivalently,
`F` lies in the closure of `F'`). -/
def le (F F' : Facet φ) : Prop :=
  ∀ α : AffineRoot φ, (∀ x ∈ F'.carrier, 0 ≤ α.eval x) → ∀ x ∈ F.carrier, 0 ≤ α.eval x

/-- Facets are determined by their sign patterns: the closure order is antisymmetric. -/
theorem le_iff (F F' : Facet φ) : F.le F' ∧ F'.le F ↔ F = F' := sorry

/-- A point is special when every root *direction* is the direction of a wall through it: for each
root `a` some affine root whose gradient is a positive multiple of `a` (so `a` itself, or `2a`, or
`a/2`) vanishes at `x` (Bruhat–Tits I, 1.3.7, p. 22). Asking for a wall of gradient exactly `a`
would be wrong for non-reduced `Φ`: in the apartment of the ramified quasi-split `SU₃` in odd
residue characteristic the walls of the multipliable root `a` and of `2a` alternate. -/
def IsSpecial (x : Apartment φ) : Prop :=
  ∀ i : ι, ∃ α : AffineRoot φ, (∃ c : ℝ, 0 < c ∧ Φ.root α.gradient = c • Φ.root i) ∧ x ∈ α.wall

/-- For a discrete valuation the walls are locally finite: only finitely many walls meet any
segment of the apartment (stated through the torsor structure, the apartment carrying no
topology at the pins). -/
theorem locallyFinite [Finite ι] (hφ : φ.IsDiscrete) (x : Apartment φ) (v : N) :
    {α : AffineRoot φ | ∃ t : ℝ, 0 ≤ t ∧ t ≤ 1 ∧ (t • v) +ᵥ x ∈ α.wall}.Finite := sorry

-- Test BruhatTits.Facet.rankZero
/- With no roots there is a single facet, the whole apartment, and it is an alcove. -/
example [IsEmpty ι] (F : Facet φ) : F.IsAlcove ∧ F.carrier = Set.univ := by
  refine ⟨?_, ?_⟩
  · refine Set.eq_empty_of_forall_notMem fun x hx => ?_
    obtain ⟨α, -⟩ := Set.mem_iUnion.1 hx.2
    exact isEmptyElim α.gradient
  · obtain ⟨x, hx⟩ := carrier_nonempty F
    exact Set.eq_univ_of_forall fun y =>
      (mem_carrier_iff hx y).2 fun α => isEmptyElim α.gradient

-- Test BruhatTits.Facet.sl2_alcoves
/- If the roots are `±a` and the affine roots of gradient `a` have constants exactly `ℤ` (as for
`SL₂` with `ω(K^×) = ℤ`), the alcoves are the strips `n < a(x - φ) < n + 1`. -/
example (i : ι) (hΦ : ∀ j, Φ.root j = Φ.root i ∨ Φ.root j = -Φ.root i)
    (hΓ : φ.primedValueSet i = Set.range (Int.cast : ℤ → ℝ)) (F : Facet φ) (hF : F.IsAlcove) :
    ∃ n : ℤ, F.carrier = {x | (n : ℝ) < Φ.toLinearMap (Φ.root i) x.displacement ∧
      Φ.toLinearMap (Φ.root i) x.displacement < n + 1} := sorry

-- Test BruhatTits.Facet.not_special_barycentre
/- A point on no wall, such as the barycentre of an alcove of `SL₂`, is not special once there is a
root. -/
example [Nonempty ι] (x : Apartment φ) (hx : x ∉ wall φ) : ¬ IsSpecial x := by
  intro hs
  obtain ⟨α, -, hα⟩ := hs (Classical.arbitrary ι)
  exact hx (Set.mem_iUnion.2 ⟨α, hα⟩)

-- Test BruhatTits.Facet.not_isAlcove_of_special
/- (non-example) Once there is a root, the facet of a special point is not an alcove: a special
point lies on a wall. -/
example [Nonempty ι] (F : Facet φ) (x : Apartment φ) (hx : x ∈ F.carrier) (hs : IsSpecial x) :
    ¬ F.IsAlcove := by
  intro hF
  obtain ⟨α, -, hα⟩ := hs (Classical.arbitrary ι)
  have hmem : x ∈ F.carrier ∩ wall φ := ⟨hx, Set.mem_iUnion.2 ⟨α, hα⟩⟩
  rw [hF] at hmem
  exact hmem

-- Test BruhatTits.Facet.le_rankZero
/- With no affine roots the closure order relates every pair of facets. -/
example [IsEmpty ι] (F F' : Facet φ) : F.le F' := fun α => isEmptyElim α.gradient

-- Test BruhatTits.Facet.le_refl
example (F : Facet φ) : F.le F := fun _ h => h

-- Test BruhatTits.Facet.alcove_not_le
/- (non-example) An alcove lies in the closure of no other alcove: the closure order is not the
total relation once there are walls. -/
example (C C' : Facet φ) (hC : C.IsAlcove) (hC' : C'.IsAlcove) (h : C.le C') : C = C' := sorry

end Facet

/-- The reduced échelonnage root system, indexed by the nonmultipliable roots of `Φ`.
Bruhat–Tits I, 1.4.1, pp. 25–26, and 6.2.21–6.2.22, p. 127: for a discrete valuation the walls
form the affine root system of a reduced root system with one root proportional to each
nonmultipliable root. -/
def echelonnage {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} [Finite ι]
    {D : RootDatum G Φ} (φ : Valuation D) (_hφ : φ.IsDiscrete) :
    RootPairing {i : ι // ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i} ℝ M N := sorry

section Echelonnage

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} [Finite ι]
  {D : RootDatum G Φ} (φ : Valuation D) (hφ : φ.IsDiscrete)

theorem echelonnage_isReduced : (echelonnage φ hφ).IsReduced := sorry

theorem echelonnage_proportional (i : {i : ι // ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i}) :
    ∃ c : ℝ, 0 < c ∧ (echelonnage φ hφ).root i = c • Φ.root i.val := sorry

/-- `Σ` and `Φ` have the same reflections, so the coroot of `α = c·a ∈ Σ` is `c⁻¹ a^∨`
(Bruhat–Tits I, 1.4.1 (i), pp. 25–26: `Σ` and `Φ` have the same Weyl group). Without it the
coroots of `Σ` would be fixed only up to vectors annihilated by every root. -/
theorem echelonnage_coroot (i : {i : ι // ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i}) :
    ∃ c : ℝ, 0 < c ∧ (echelonnage φ hφ).root i = c • Φ.root i.val ∧
      (echelonnage φ hφ).coroot i = c⁻¹ • Φ.coroot i.val := sorry

/-- At a special point `x₀` the walls are exactly the hyperplanes `{α(x - x₀) = k}` with `α ∈ Σ`
and `k ∈ ℤ` (Bruhat–Tits I, 1.3.8, pp. 22–23, and 6.2.22, p. 127). Both inclusions are needed:
the walls alone lie in such hyperplanes for `2Σ` as well. -/
theorem echelonnage_walls (x₀ : Apartment φ) (hx₀ : Facet.IsSpecial x₀) :
    {S : Set (Apartment φ) | ∃ α : AffineRoot φ, α.wall = S} =
      {S | ∃ (i : {i : ι // ∀ j, Φ.root j ≠ (2 : ℝ) • Φ.root i}) (k : ℤ),
        S = {x | (echelonnage φ hφ).toLinearMap ((echelonnage φ hφ).root i) (x -ᵥ x₀) = k}} :=
  sorry

theorem echelonnage_split [Φ.IsReduced]
    (h : ∀ i, φ.valueSet i = Set.range (Int.cast : ℤ → ℝ)) :
    Set.range (echelonnage φ hφ).root = Set.range Φ.root := sorry

-- Test BruhatTits.echelonnage_rank_zero
example [IsEmpty ι] : Set.range (echelonnage φ hφ).root = ∅ := Set.range_eq_empty _

-- Test BruhatTits.echelonnage_BC1_scale
/- For a datum of type `BC₁` with `Γ'_a = ½ℤ` and `Γ'_{2a} = ½ + ℤ` (the ramified `SU₃` in odd
residue characteristic with `ω(K^×) = ℤ`), the walls of `±a` and `±2a` together are the
`{a(x − φ) ∈ ¼ℤ}`, so the échelonnage root attached to `2a` is `2·(2a) = 4a`, not `2a`. -/
example (i j : ι) (hij : Φ.root j = (2 : ℝ) • Φ.root i)
    (hΦ : ∀ k, Φ.root k = Φ.root i ∨ Φ.root k = -Φ.root i ∨ Φ.root k = Φ.root j ∨
      Φ.root k = -Φ.root j)
    (hi : φ.primedValueSet i = Set.range (fun n : ℤ => (n : ℝ) / 2))
    (hj : φ.primedValueSet j = Set.range (fun n : ℤ => (n : ℝ) + 1 / 2))
    (hj' : ∀ k, Φ.root k ≠ (2 : ℝ) • Φ.root j) :
    (echelonnage φ hφ).root ⟨j, hj'⟩ = (2 : ℝ) • Φ.root j := sorry

-- Test BruhatTits.echelonnage_split_agreement
/- In the split case the coroots agree as well, so `Σ` and `Φ` have the same coroot lattice. -/
example [Φ.IsReduced] (h : ∀ i, φ.valueSet i = Set.range (Int.cast : ℤ → ℝ)) :
    Set.range (echelonnage φ hφ).coroot = Set.range Φ.coroot := sorry

-- Test BruhatTits.echelonnage_BC1_index
/- For a pairing of type `BC₁` with roots `a, -a, 2a, -2a`, exactly the two roots `±2a` are
nonmultipliable, so the échelonnage of a `BC₁` datum has two roots. -/
example (Ψ : RootPairing (Fin 4) ℝ M N) (a : M) (ha : a ≠ 0)
    (hroot : ∀ k, Ψ.root k = ![a, -a, (2 : ℝ) • a, -((2 : ℝ) • a)] k) :
    Nat.card {k : Fin 4 // ∀ j, Ψ.root j ≠ (2 : ℝ) • Ψ.root k} = 2 := sorry

/- Check `echelonnage_ne_relative`: the rank-two ramified `C₂` valuation has
half-integral short-root jumps and integral long-root jumps. Its échelonnage contains
`2(e₁+e₂)`, which is not a relative root. -/
example (Ψ : RootPairing (Fin 8) ℝ (Fin 2 → ℝ) (Fin 2 → ℝ))
    (D' : RootDatum G Ψ) (ψ : Valuation D') (hψ : ψ.IsDiscrete)
    (hroot : ∀ i, Ψ.root i =
      ![![1, 1], ![-1, -1], ![1, -1], ![-1, 1], ![2, 0], ![-2, 0], ![0, 2], ![0, -2]] i)
    (hΓ : ∀ i, ψ.primedValueSet i =
      if i.val < 4 then Set.range (fun k : ℤ => (k : ℝ) / 2)
      else Set.range (Int.cast : ℤ → ℝ)) :
    (![2, 2] : Fin 2 → ℝ) ∈ Set.range (echelonnage ψ hψ).root ∧
      (![2, 2] : Fin 2 → ℝ) ∉ Set.range Ψ.root := sorry

end Echelonnage

/-- The affine Weyl group `W_a`: the affine automorphisms of the apartment generated by the
reflections in the walls (Bruhat–Tits I, 6.2.11, p. 123). -/
def AffineWeylGroup {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ}
    (φ : Valuation D) : Subgroup (Apartment φ ≃ᵃ[ℝ] Apartment φ) :=
  Subgroup.closure (Set.range (AffineRoot.reflection (φ := φ)))

namespace AffineWeylGroup

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} {D : RootDatum G Φ} (φ : Valuation D)

/-- The simple reflections of an alcove `C`: the reflections in the walls that contain a facet in
the closure of `C` lying on exactly one wall (a panel of `C`). -/
def simpleReflections (C : Facet φ) : Set (AffineWeylGroup φ) :=
  {w | ∃ α : AffineRoot φ, (w : Apartment φ ≃ᵃ[ℝ] Apartment φ) = α.reflection ∧
    ∃ F : Facet φ, F.le C ∧ F.carrier ⊆ α.wall ∧
      ∀ β : AffineRoot φ, F.carrier ⊆ β.wall → β.wall = α.wall}

/-- The Coxeter system on `W_a` attached to an alcove, for a discrete valuation with finitely many
root directions (Bruhat–Tits I, 1.3.4, p. 21, and 6.2.22, p. 127). -/
def coxeterSystem [Finite ι] (_hφ : φ.IsDiscrete) (C : Facet φ) (_hC : C.IsAlcove) :
    Σ (B : Type (max u v)) (Mx : CoxeterMatrix B), CoxeterSystem Mx (AffineWeylGroup φ) := sorry

/-- The generators of `coxeterSystem` are the simple reflections of the alcove. -/
theorem coxeterSystem_simple [Finite ι] (hφ : φ.IsDiscrete) (C : Facet φ) (hC : C.IsAlcove) :
    Set.range (coxeterSystem φ hφ C hC).2.2.simple = simpleReflections φ C := sorry

/-- `W_a` acts simply transitively on the alcoves (Bruhat–Tits I, 1.3.3, p. 21, and 6.2.22,
p. 127). -/
theorem simplyTransitive_alcoves [Finite ι] (hφ : φ.IsDiscrete) (C C' : Facet φ)
    (hC : C.IsAlcove) (hC' : C'.IsAlcove) :
    ∃! w : AffineWeylGroup φ,
      ⇑(w : Apartment φ ≃ᵃ[ℝ] Apartment φ) '' C.carrier = C'.carrier := sorry

/-- At a special point `x`, `W_a = W(Φ) ⋉ Q^∨(Σ)`: the elements of `W_a` are exactly the maps
`y ↦ w₀(y - x) + v + x` with `w₀` in the Weyl group of `Φ` and `v` in the coroot lattice of the
échelonnage (Bruhat–Tits I, 1.3.7–1.3.8, pp. 22–23, and 6.2.19, p. 126). -/
theorem semidirect [Finite ι] (hφ : φ.IsDiscrete) (x : Apartment φ) (hx : Facet.IsSpecial x)
    (g : Apartment φ ≃ᵃ[ℝ] Apartment φ) :
    g ∈ AffineWeylGroup φ ↔ ∃ (w0 : Φ.weylGroup) (v : N),
      v ∈ Submodule.span ℤ (Set.range (echelonnage φ hφ).coroot) ∧
      ∀ y, g y = ((w0 : RootPairing.Aut Φ).coweightEquiv).symm (y -ᵥ x) +ᵥ (v +ᵥ x) := sorry

/-- Every wall reflection is the image of an element of `N` (Bruhat–Tits I, 6.2.10 (ii), p. 122). -/
theorem le_range_action : AffineWeylGroup φ ≤ (Apartment.action φ).range := sorry

/-- `W_a` is normal in the image of `N` (Bruhat–Tits I, 6.2.11, p. 123). -/
theorem normal_in_image :
    ((AffineWeylGroup φ).subgroupOf (Apartment.action φ).range).Normal := sorry

-- Test BruhatTits.AffineWeylGroup.rankZero_trivial
example [IsEmpty ι] : AffineWeylGroup φ = ⊥ :=
  Subgroup.closure_eq_bot_iff.2 (by
    rintro _ ⟨α, rfl⟩
    exact isEmptyElim α.gradient)

-- Test BruhatTits.AffineWeylGroup.sl2_infinite_dihedral
/- The reflections in the parallel walls of `a + k` and `a + k + 1` compose to the translation by
`-a^∨`; with constants `ℤ` (as for `SL₂`) this makes `W_a` infinite dihedral. -/
example (α β : AffineRoot φ) (hg : β.gradient = α.gradient) (hk : β.constant = α.constant + 1)
    (y : Apartment φ) :
    β.reflection (α.reflection y) = -Φ.coroot α.gradient +ᵥ y := by
  rw [AffineRoot.reflection_apply, AffineRoot.reflection_apply, vadd_vadd]
  congr 1
  simp only [AffineRoot.eval, Apartment.vadd_displacement, map_add, map_smul, hg, hk,
    RootPairing.root_coroot_two, smul_eq_mul]
  module

-- Test BruhatTits.AffineWeylGroup.finite_quotient_compat
/- The linear parts of the elements of `W_a` lie in Mathlib's `RootPairing.weylGroup` of `Φ`. -/
example (w : AffineWeylGroup φ) :
    ∃ w0 : Φ.weylGroup, ∀ v : N,
      (w : Apartment φ ≃ᵃ[ℝ] Apartment φ).linear v = ((w0 : RootPairing.Aut Φ).coweightEquiv).symm v :=
  sorry

-- Test BruhatTits.AffineWeylGroup.not_normal_in_affine
/- `W_a` is not normal in the group of all affine automorphisms: a translation not preserving the
walls conjugates a wall reflection to a reflection in a hyperplane that is not a wall. -/
example [Finite ι] [Nonempty ι] (hφ : φ.IsDiscrete) : ¬ (AffineWeylGroup φ).Normal := sorry

-- Test BruhatTits.AffineWeylGroup.not_all_of_N
-- (for `PGL₂`, `ν(N(K)) ⊋ W_a`: `diag(ϖ, 1)` translates by half the shortest translation of
-- `W_a`; the pinned library has no compiled `PGL₂` carrier.)

-- Test BruhatTits.AffineWeylGroup.simpleReflections_rankZero
/- With no roots there are no walls, so an alcove has no simple reflections. -/
example [IsEmpty ι] (C : Facet φ) : simpleReflections φ C = ∅ :=
  Set.eq_empty_of_forall_notMem fun _ ⟨α, _⟩ => isEmptyElim α.gradient

-- Test BruhatTits.AffineWeylGroup.simpleReflections_involutive
/- Every simple reflection is an involution different from the identity, as a Coxeter generator
must be. -/
example (C : Facet φ) (s : AffineWeylGroup φ) (hs : s ∈ simpleReflections φ C) :
    s * s = 1 ∧ s ≠ 1 := by
  obtain ⟨α, hα, -⟩ := hs
  have hneg : ∀ y, α.eval (α.reflection y) = -α.eval y := fun y => by
    rw [AffineRoot.reflection_apply]
    simp only [AffineRoot.eval, Apartment.vadd_displacement, map_add, map_smul,
      RootPairing.root_coroot_two, smul_eq_mul]
    ring
  refine ⟨Subtype.ext (AffineEquiv.ext fun y => ?_), fun h => ?_⟩
  · rw [Subgroup.coe_mul, Subgroup.coe_one, AffineEquiv.coe_mul, Function.comp_apply, hα,
      AffineEquiv.coe_one, id, AffineRoot.reflection_apply α (α.reflection y), hneg y, neg_neg,
      AffineRoot.reflection_apply α y, vadd_vadd, ← add_smul, add_neg_cancel, zero_smul, zero_vadd]
  · have hfix : ∀ y, α.reflection y = y := fun y => by
      have := congrArg (fun t : AffineWeylGroup φ => (t : Apartment φ ≃ᵃ[ℝ] Apartment φ) y) h
      simpa [hα] using this
    have h0 : ∀ y, α.eval y = 0 := fun y => by
      have := hneg y
      rw [hfix] at this
      linarith
    have h2 := h0 (Φ.coroot α.gradient +ᵥ ⟨φ, 0, fun i u => by simp⟩)
    simp only [AffineRoot.eval, Apartment.vadd_displacement, map_add,
      RootPairing.root_coroot_two] at h2
    have h1 := h0 ⟨φ, 0, fun i u => by simp⟩
    simp only [AffineRoot.eval] at h1
    linarith

-- Test BruhatTits.AffineWeylGroup.simpleReflections_sl2
/- For roots `±a` with affine-root constants exactly `ℤ` (as for `SL₂` with `ω(K^×) = ℤ`), an
alcove has exactly two simple reflections, those in its two end walls. -/
example (i : ι) (hΦ : ∀ j, Φ.root j = Φ.root i ∨ Φ.root j = -Φ.root i)
    (hΓ : φ.primedValueSet i = Set.range (Int.cast : ℤ → ℝ)) (C : Facet φ) (hC : C.IsAlcove) :
    (simpleReflections φ C).ncard = 2 := sorry

-- Test BruhatTits.AffineWeylGroup.coxeterSystem_rankZero
/- With no roots the Coxeter system has no generators. -/
example [Finite ι] [IsEmpty ι] (hφ : φ.IsDiscrete) (C : Facet φ) (hC : C.IsAlcove) :
    IsEmpty (coxeterSystem φ hφ C hC).1 := by
  refine ⟨fun b => ?_⟩
  have hb : (coxeterSystem φ hφ C hC).2.2.simple b ∈ simpleReflections φ C := by
    rw [← coxeterSystem_simple φ hφ C hC]
    exact ⟨b, rfl⟩
  obtain ⟨α, -⟩ := hb
  exact isEmptyElim α.gradient

-- Test BruhatTits.AffineWeylGroup.coxeterSystem_sl2
/- For roots `±a` with affine-root constants `ℤ` the Coxeter system has type `Ã₁`: two generators
whose product has infinite order (Mathlib encodes `m = ∞` as `0`). -/
example [Finite ι] (hφ : φ.IsDiscrete) (i : ι)
    (hΦ : ∀ j, Φ.root j = Φ.root i ∨ Φ.root j = -Φ.root i)
    (hΓ : φ.primedValueSet i = Set.range (Int.cast : ℤ → ℝ)) (C : Facet φ) (hC : C.IsAlcove) :
    Nat.card (coxeterSystem φ hφ C hC).1 = 2 ∧
      ∀ b b', b ≠ b' → (coxeterSystem φ hφ C hC).2.1 b b' = 0 := sorry

-- Test BruhatTits.AffineWeylGroup.coxeterSystem_finite
/- An alcove has finitely many walls, so the Coxeter system has finitely many generators, although
`W_a` has infinitely many reflections once `Φ ≠ ∅` (Bruhat–Tits I, 1.3.4, p. 21: their number is
the sum of `1 + dim` over the irreducible factors). -/
example [Finite ι] (hφ : φ.IsDiscrete) (C : Facet φ) (hC : C.IsAlcove) :
    Finite (coxeterSystem φ hφ C hC).1 := sorry

end AffineWeylGroup

/-- The enlarged action of `N(K)` has kernel `Z(K)^1 = ker v` (Bruhat–Tits I, 6.2.10 (i), p. 122,
and Bruhat–Tits II, 4.2.16, p. 94; [Richarz], §1.1, p. 118). -/
theorem Apartment.rationalAction_ker {K : Type u} [Field K] [ValuativeRel K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    (Apartment.rationalAction D φ).ker =
      (boundedPart D).map (Subgroup.inclusion D.T_le_normalizer) := sorry

/-! ### Levi subgroups of apartment vectors and Frobenius -/

section Levi

variable {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N} (D : RootDatum G Φ)

/-- `M_v`: generated by `T` and the root subgroups of roots vanishing on `v` ([Kisin–Zhou], 2.1.6,
arXiv v2 p. 8; [He 2018], §6.1, arXiv v3 p. 16). -/
def leviOfVector (v : N) : Subgroup G :=
  Subgroup.closure
    ((D.T : Set G) ∪ ⋃ (i : ι) (_ : Φ.toLinearMap (Φ.root i) v = 0), (D.U i : Set G))

theorem leviOfVector_eq_top_iff (hgen : D.IsGenerating) (v : N) :
    leviOfVector D v = ⊤ ↔ ∀ i, Φ.toLinearMap (Φ.root i) v = 0 := sorry

theorem leviOfVector_smul (v : N) (c : ℝ) (hc : c ≠ 0) :
    leviOfVector D (c • v) = leviOfVector D v := by
  simp only [leviOfVector, map_smul, smul_eq_mul, mul_eq_zero, hc, false_or]

/-- Conjugation by `n` in the group `N` of the datum: one Weyl element `w`, depending on `n` only,
gives `n M_v n⁻¹ = M_{w v}` for every `v`. -/
theorem leviOfVector_conj (n : D.weylNormalizer) :
    ∃ w : Φ.weylGroup, ∀ v : N, (leviOfVector D v).map (MulAut.conj (n : G)).toMonoidHom =
      leviOfVector D (((w : RootPairing.Aut Φ).coweightEquiv).symm v) := sorry

/-- An automorphism `σ` of `G` permuting the datum compatibly with a linear map `σN` of `N`
transports `M_v` to `M_{σN v}`; in particular `M_v` is `σ`-stable when `σN v = v`. -/
theorem leviOfVector_descends (v : N) (σG : G ≃* G) (σι : ι ≃ ι) (σN : N ≃ₗ[ℝ] N)
    (hT : D.T.map σG.toMonoidHom = D.T) (hU : ∀ i, (D.U i).map σG.toMonoidHom = D.U (σι i))
    (hroot : ∀ i w, Φ.toLinearMap (Φ.root (σι i)) (σN w) = Φ.toLinearMap (Φ.root i) w) :
    (leviOfVector D v).map σG.toMonoidHom = leviOfVector D (σN v) := sorry

-- Test BruhatTits.leviOfVector_zero
example : leviOfVector D 0 = Subgroup.closure ((D.T : Set G) ∪ ⋃ i, (D.U i : Set G)) := by
  simp [leviOfVector]

-- Test BruhatTits.leviOfVector_regular
example (v : N) (hv : ∀ i, Φ.toLinearMap (Φ.root i) v ≠ 0) : leviOfVector D v = D.T := by
  simp [leviOfVector, hv]

-- Test BruhatTits.leviOfVector_stable_of_regular (non-example for an "iff")
/- `M_v` can be `σ`-stable although `σN v ≠ v`: for `v` and `σN v` both regular, `M_v = M_{σN v}`
is the minimal Levi. (In the unramified `U₃`, `ς(2,1,0) = (0,-1,-2) ≠ (2,1,0)`, both regular.) So
"`M_v` is `E`-rational iff `ς(v) = v`" is false; only "if" holds. -/
example (v : N) (σG : G ≃* G) (σι : ι ≃ ι) (σN : N ≃ₗ[ℝ] N)
    (hT : D.T.map σG.toMonoidHom = D.T) (hU : ∀ i, (D.U i).map σG.toMonoidHom = D.U (σι i))
    (hroot : ∀ i w, Φ.toLinearMap (Φ.root (σι i)) (σN w) = Φ.toLinearMap (Φ.root i) w)
    (hv : ∀ i, Φ.toLinearMap (Φ.root i) v ≠ 0) (hv' : ∀ i, Φ.toLinearMap (Φ.root i) (σN v) ≠ 0) :
    (leviOfVector D v).map σG.toMonoidHom = leviOfVector D v := by
  rw [leviOfVector_descends D v σG σι σN hT hU hroot]
  simp [leviOfVector, hv, hv']

-- Test BruhatTits.leviOfVector_not_parabolic
/- `M_v` is not the parabolic of `v`: it contains no root group with `⟨a, v⟩ > 0`. -/
example (v : N) (i : ι) (hi : 0 < Φ.toLinearMap (Φ.root i) v) : ¬ D.U i ≤ leviOfVector D v :=
  sorry

-- Test BruhatTits.leviOfVector_gl3
-- (for `GL₃` and `v = (1,1,0)`, `M_v = GL₂ × GL₁`; the standard `GL_n` datum is
-- `GLBuilding.standardData`, declared after this layer.)

end Levi

section Frobenius

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
  [IsNonarchimedeanLocalField E] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}

/-- The valuation of `Ĕ` has the value group of `E`, so it has rank one. -/
instance breveIsRankLeOne : ValuativeRel.IsRankLeOne (MaxUnramifiedCompletion.Breve E) := sorry

/-- A torus defined over E whose scalar extension is the chosen maximal split torus.
The valuation belongs to that geometric root datum and is compatible with the field valuation. -/
structure UnramifiedApartmentData (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E) where
  torusIdeal : TauCeti.HopfIdeal E H
  isTorus : TauCeti.torusCommHopfAlgProperty E
    (TauCeti.FiniteTypeCommHopfAlgCat.quotient H torusIdeal)
  data : LocalRootData (MaxUnramifiedCompletion.Breve E)
    (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := MaxUnramifiedCompletion.Breve E) H)
  torus_eq : data.splitTorus = TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := MaxUnramifiedCompletion.Breve E) torusIdeal
  valuation : Valuation data.rootDatum
  compatible : valuation.IsCompatible data (torusValuationMap data)

instance UnramifiedApartmentData.geometric (A : UnramifiedApartmentData H) :
    GeometricValuation A.data A.valuation := { compatible := A.compatible }

/-- A descended maximal unramified-split torus containing the chosen base split torus (BT II,
Corollary 5.1.12, p. 150), with a compatible valuation over `Ĕ`, where the group is quasi-split
(5.1.1, pp. 145–146) so that Theorem 4.2.3, p. 90, applies. -/
theorem exists_unramifiedApartmentData (D : LocalRootData E H) :
    ∃ A : UnramifiedApartmentData H, A.torusIdeal ≤ D.splitTorus := sorry

/-- Arithmetic Frobenius on geometric rational points, by composition on values. -/
def frobeniusOnPoints : WithConv (H →ₐ[E] MaxUnramifiedCompletion.Breve E) →*
    WithConv (H →ₐ[E] MaxUnramifiedCompletion.Breve E) :=
  TauCeti.AlgHom.mapValue (MaxUnramifiedCompletion.frobenius E).toAlgHom

/-- Scalar extension of points, restricting a `Ĕ`-point of `H_Ĕ` along `h ↦ 1 ⊗ h`: the inverse of
Tau Ceti's `AlgHom.baseChangePointsMulEquiv`. -/
def unramifiedPointsEquiv :
    WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange
      (K := MaxUnramifiedCompletion.Breve E) H) →ₐ[MaxUnramifiedCompletion.Breve E]
        MaxUnramifiedCompletion.Breve E) ≃*
      WithConv (H →ₐ[E] MaxUnramifiedCompletion.Breve E) :=
  (TauCeti.AlgHom.baseChangePointsMulEquiv (k := E) (K := MaxUnramifiedCompletion.Breve E)
    (A := (H : Type u)) (R := MaxUnramifiedCompletion.Breve E)).symm

theorem unramifiedPointsEquiv_apply (g : WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange
      (K := MaxUnramifiedCompletion.Breve E) H) →ₐ[MaxUnramifiedCompletion.Breve E]
        MaxUnramifiedCompletion.Breve E)) (a : H) :
    (unramifiedPointsEquiv g).ofConv a = g.ofConv (1 ⊗ₜ[E] a) := rfl

/-- The action induced by arithmetic Frobenius on the apartment of a descended torus
(BT II 4.2.12, pp. 92–93, 5.1.4, p. 147, and Lemma 5.1.13, p. 150). BT II states these over the
strict henselization `E^{un} ⊂ Ĕ`, over which the descended torus already splits (5.1.4). In the
central directions the origin is that of the base valuation (BT II 4.2.16, p. 94;
`frobeniusOnApartment_central`). -/
def frobeniusOnApartment (A : UnramifiedApartmentData H) :
    Apartment A.valuation ≃ᵃ[ℝ] Apartment A.valuation := sorry

def frobeniusOnApartment_linear (A : UnramifiedApartmentData H) : A.data.V ≃ₗ[ℝ] A.data.V :=
  (frobeniusOnApartment A).linear

/-- Pullback of torus characters by semilinear Frobenius, including its scalar action. -/
def frobeniusCharacter (A : UnramifiedApartmentData H) :
    GeometricRoots.Character A.data.splitTorus ≃+ GeometricRoots.Character A.data.splitTorus := sorry

theorem frobeniusCharacter_value (A : UnramifiedApartmentData H)
    (χ : GeometricRoots.Character A.data.splitTorus)
    (t t' : subgroupPoints A.data.splitTorus (MaxUnramifiedCompletion.Breve E))
    (ht : unramifiedPointsEquiv (H := H) t'.val =
      frobeniusOnPoints (H := H) (unramifiedPointsEquiv (H := H) t.val)) :
    (GeometricRoots.characterValue _ χ (MaxUnramifiedCompletion.Breve E) t' : MaxUnramifiedCompletion.Breve E) =
      MaxUnramifiedCompletion.frobenius E
        (GeometricRoots.characterValue _ (frobeniusCharacter A χ) (MaxUnramifiedCompletion.Breve E) t) := sorry

/-- The full linear part is dual to the actual semilinear character action. -/
theorem frobeniusOnApartment_linear_character (A : UnramifiedApartmentData H)
    (χ : GeometricRoots.Character A.data.splitTorus) (v : A.data.V) :
    GeometricRoots.characterLinear _ χ
      (A.data.cocharacterSpace (frobeniusOnApartment_linear A v)) =
    GeometricRoots.characterLinear _ (frobeniusCharacter A χ) (A.data.cocharacterSpace v) := sorry

/-- Frobenius transports the actual point filtrations, at every real depth. -/
theorem frobeniusOnApartment_filtration (A : UnramifiedApartmentData H)
    (i j : A.data.ι)
    (hij : (A.data.rootDatum.U i).map
      ((unramifiedPointsEquiv (H := H)).symm.toMonoidHom.comp
        ((frobeniusOnPoints (H := H)).comp (unramifiedPointsEquiv (H := H)).toMonoidHom)) = A.data.rootDatum.U j)
    (x : Apartment A.valuation) (r : ℝ) :
    (Apartment.filtrationAt A.valuation x i r).map
      ((unramifiedPointsEquiv (H := H)).symm.toMonoidHom.comp
        ((frobeniusOnPoints (H := H)).comp (unramifiedPointsEquiv (H := H)).toMonoidHom)) =
      Apartment.filtrationAt A.valuation (frobeniusOnApartment A x) j r := sorry

/-- The action on this descended apartment factors through a finite Galois quotient (BT II 5.1.4,
p. 147). -/
theorem frobeniusOnApartment_finiteOrder (A : UnramifiedApartmentData H) :
    ∃ n : ℕ, 0 < n ∧ (frobeniusOnApartment A) ^ n = 1 := sorry

/-- Frobenius has a fixed point on the apartment (BT II 5.1.4, p. 147, and Lemma 5.1.13 (i),
p. 150). -/
theorem frobeniusOnApartment_fixed (A : UnramifiedApartmentData H) :
    ∃ x : Apartment A.valuation, frobeniusOnApartment A x = x := sorry

/-- In the central directions Frobenius fixes the origin of the base valuation: the base point (the
point of displacement `0`) is moved only within the span of the coroots. On the enlarged building `𝓑 × V¹` of BT II 4.2.16,
p. 94, Frobenius acts on the central factor `V¹ = Hom(X^*(G), ℝ)` linearly, through its action on
characters (BT II 4.2.12, pp. 92–93). Together with `frobeniusOnApartment_linear_character` and
`frobeniusOnApartment_filtration` this determines `frobeniusOnApartment`. -/
theorem frobeniusOnApartment_central (A : UnramifiedApartmentData H) (x : Apartment A.valuation)
    (hx : x.displacement = 0) :
    frobeniusOnApartment A x -ᵥ x ∈ Submodule.span ℝ (Set.range A.data.Φ.coroot) := sorry

/-- Unramified descent of the apartment of an actual maximal split torus `S` contained in an
`E`-torus that splits maximally over `Ĕ` (BT II 5.1.12–5.1.13, p. 150, and Theorem 5.1.20,
pp. 153–154). It is determined by its linear part (`apartmentDescent_linear_character`), by the
descended filtrations (`apartmentDescent_filtrationAt`) and, in the central directions, by
matching the origins of the two base valuations (`apartmentDescent_central`). -/
def apartmentDescent (D : LocalRootData E H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (_hφ : φ.IsCompatible D (torusValuationMap D)) (A : UnramifiedApartmentData H)
    (_hS : A.torusIdeal ≤ D.splitTorus) : Apartment φ →ᵃ[ℝ] Apartment A.valuation := sorry

theorem apartmentDescent_injective (D : LocalRootData E H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (hφ : φ.IsCompatible D (torusValuationMap D)) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) :
    Function.Injective (apartmentDescent D φ hφ A hS) := sorry

theorem apartment_eq_fixedPoints (D : LocalRootData E H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (hφ : φ.IsCompatible D (torusValuationMap D)) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) :
    Set.range (apartmentDescent D φ hφ A hS) = {x | frobeniusOnApartment A x = x} := sorry

/-- The descended filtrations: for an `E`-root `b`, an element of `U_b(E)` lies in `U_{b,x,r}` iff
its image in `G(Ĕ)` lies in the group generated by the `U_{a,y,r}` for the `Ĕ`-roots `a` restricting
to `b` and the `U_{a,y,2r}` for those restricting to `2b`, where `y` is the image of `x`
(BT II 5.1.16, pp. 151–152, and Theorem 5.1.20, pp. 153–154). Restriction of roots is read through
the linear part of the descent (`apartmentDescent_linear_character`). This fixes the image of
every point modulo the directions annihilated by all roots. -/
theorem apartmentDescent_filtrationAt (D : LocalRootData E H) (φ : Valuation D.rootDatum)
    [GeometricValuation D φ] (hφ : φ.IsCompatible D (torusValuationMap D))
    (A : UnramifiedApartmentData H) (hS : A.torusIdeal ≤ D.splitTorus) (x : Apartment φ)
    (i : D.ι) (r : ℝ) :
    (Apartment.filtrationAt φ x i r).map
        ((unramifiedPointsEquiv (H := H)).symm.toMonoidHom.comp
          (TauCeti.AlgHom.mapValue (Algebra.ofId E (MaxUnramifiedCompletion.Breve E)) :
            WithConv (H →ₐ[E] E) →* WithConv (H →ₐ[E] MaxUnramifiedCompletion.Breve E))) =
      (D.rootDatum.U i).map
          ((unramifiedPointsEquiv (H := H)).symm.toMonoidHom.comp
            (TauCeti.AlgHom.mapValue (Algebra.ofId E (MaxUnramifiedCompletion.Breve E)) :
              WithConv (H →ₐ[E] E) →* WithConv (H →ₐ[E] MaxUnramifiedCompletion.Breve E))) ⊓
        ⨆ (j : A.data.ι) (c : ℝ) (_ : (c = 1 ∨ c = 2) ∧ ∀ v : D.V,
            A.data.Φ.toLinearMap (A.data.Φ.root j) ((apartmentDescent D φ hφ A hS).linear v) =
              c * D.Φ.toLinearMap (D.Φ.root i) v),
          Apartment.filtrationAt A.valuation (apartmentDescent D φ hφ A hS x) j (c * r) := sorry

/-- In the central directions the descent sends the origin of the base valuation of `G(E)` to the
origin of the base valuation of `G(Ĕ)` (the points of displacement `0`): on the central factors `V¹` of BT II 4.2.16, p. 94, the
descent is linear, identifying `Hom(X^*_E(G), ℝ)` with the Frobenius-invariant part of
`Hom(X^*_Ĕ(G), ℝ)`. Together with
`apartmentDescent_linear_character` and `apartmentDescent_filtrationAt` this determines
`apartmentDescent`. -/
theorem apartmentDescent_central (D : LocalRootData E H) (φ : Valuation D.rootDatum)
    [GeometricValuation D φ] (hφ : φ.IsCompatible D (torusValuationMap D))
    (A : UnramifiedApartmentData H) (hS : A.torusIdeal ≤ D.splitTorus) (x : Apartment φ)
    (hx : x.displacement = 0) (y : Apartment A.valuation) (hy : y.displacement = 0) :
    apartmentDescent D φ hφ A hS x -ᵥ y ∈ Submodule.span ℝ (Set.range A.data.Φ.coroot) := sorry

/-- Restriction to the E-split torus of a character of the actual unramified split torus. -/
def descentCharacter (D : LocalRootData E H) (A : UnramifiedApartmentData H)
    (_hS : A.torusIdeal ≤ D.splitTorus) :
    GeometricRoots.Character A.data.splitTorus →+ GeometricRoots.Character D.splitTorus := sorry

theorem descentCharacter_value (D : LocalRootData E H) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) (χ : GeometricRoots.Character A.data.splitTorus)
    (t : subgroupPoints D.splitTorus E)
    (tL : subgroupPoints A.data.splitTorus (MaxUnramifiedCompletion.Breve E))
    (ht : ∀ a : H, (unramifiedPointsEquiv (H := H) tL.val).ofConv a =
      algebraMap E (MaxUnramifiedCompletion.Breve E) (t.val.ofConv a)) :
    (GeometricRoots.characterValue _ χ (MaxUnramifiedCompletion.Breve E) tL : MaxUnramifiedCompletion.Breve E) =
      algebraMap E (MaxUnramifiedCompletion.Breve E)
        (GeometricRoots.characterValue _ (descentCharacter D A hS χ) E t) := sorry

/-- The derivative of descent is the actual cocharacter inclusion, characterized by restriction. -/
theorem apartmentDescent_linear_character (D : LocalRootData E H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (hφ : φ.IsCompatible D (torusValuationMap D))
    (A : UnramifiedApartmentData H) (hS : A.torusIdeal ≤ D.splitTorus)
    (χ : GeometricRoots.Character A.data.splitTorus) (v : D.V) :
    GeometricRoots.characterLinear _ χ
      (A.data.cocharacterSpace ((apartmentDescent D φ hφ A hS).linear v)) =
    GeometricRoots.characterLinear _ (descentCharacter D A hS χ) (D.cocharacterSpace v) := sorry

/-- Finite residue field gives a stable alcove when the descended torus contains a maximal
base-field split torus ([Tits], 1.10.3, p. 37). -/
theorem frobenius_stable_alcove (D : LocalRootData E H) (A : UnramifiedApartmentData H)
    (_hS : A.torusIdeal ≤ D.splitTorus) :
    ∃ C : Facet A.valuation, C.IsAlcove ∧
      (frobeniusOnApartment A) '' C.carrier = C.carrier := sorry

-- Test Frobenius.point_evaluation
example (g : WithConv (H →ₐ[E] MaxUnramifiedCompletion.Breve E)) (a : H) :
    (frobeniusOnPoints g).ofConv a = MaxUnramifiedCompletion.frobenius E (g.ofConv a) := rfl

-- Test Frobenius.identity_point
example : frobeniusOnPoints (H := H) 1 = 1 := map_one _

-- Test Frobenius.rational_points_fixed
/- Frobenius fixes every point coming from an `E`-point: it is an `E`-algebra automorphism. -/
example (g : WithConv (H →ₐ[E] E)) :
    frobeniusOnPoints (TauCeti.AlgHom.mapValue (Algebra.ofId E (MaxUnramifiedCompletion.Breve E)) g) =
      TauCeti.AlgHom.mapValue (Algebra.ofId E (MaxUnramifiedCompletion.Breve E)) g := by
  rw [frobeniusOnPoints, ← MonoidHom.comp_apply, ← TauCeti.AlgHom.mapValue_comp]
  congr 2
  exact Subsingleton.elim _ _

-- Test Frobenius.not_translation
/- Frobenius on the apartment is never a translation by a nonzero vector, since it has a fixed
point. -/
example (A : UnramifiedApartmentData H) (v : A.data.V) (hv : v ≠ 0) :
    frobeniusOnApartment A ≠ AffineEquiv.constVAdd ℝ (Apartment A.valuation) v := by
  intro h
  obtain ⟨x, hx⟩ := frobeniusOnApartment_fixed A
  rw [h, AffineEquiv.constVAdd_apply] at hx
  exact hv ((vadd_right_cancel_iff x).mp (hx.trans (zero_vadd A.data.V x).symm))

-- Test Frobenius.base_change_tmul
/- Base change of points is `s ⊗ a ↦ s · g(a)`: the scalars of `Ĕ` act by multiplication, with no
Frobenius twist. -/
example (g : WithConv (H →ₐ[E] MaxUnramifiedCompletion.Breve E)) (s : MaxUnramifiedCompletion.Breve E)
    (a : H) : ((unramifiedPointsEquiv (H := H)).symm g).ofConv (s ⊗ₜ[E] a) = s * g.ofConv a :=
  TauCeti.AlgHom.baseChangePointsMulEquiv_apply_tmul g s a

-- Test Frobenius.linear_split
/- If the descended torus is already split over `E`, Frobenius acts trivially on its cocharacters,
so the linear part is the identity. -/
example (A : UnramifiedApartmentData H)
    (hT : TauCeti.splitTorusCommHopfAlgProperty E
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H A.torusIdeal)) :
    frobeniusOnApartment_linear A = LinearEquiv.refl ℝ A.data.V := sorry

-- Test Frobenius.character_split
/- For a descended torus split over `E` every character is `E`-rational, so Frobenius fixes it. -/
example (A : UnramifiedApartmentData H)
    (hT : TauCeti.splitTorusCommHopfAlgProperty E
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H A.torusIdeal)) :
    frobeniusCharacter A = AddEquiv.refl _ := sorry

-- Test Frobenius.character_finiteOrder
/- The descended torus splits over a finite unramified extension, so Frobenius acts on its
characters with finite order (BT II 5.1.4, p. 147). -/
example (A : UnramifiedApartmentData H) :
    ∃ n : ℕ, 0 < n ∧ ∀ χ, (⇑(frobeniusCharacter A))^[n] χ = χ := sorry

-- Test Frobenius.character_root
/- Frobenius permutes the roots: it is induced by a semilinear automorphism of `G_Ĕ` preserving
the descended torus. -/
example (A : UnramifiedApartmentData H) (j : A.data.ι) :
    ∃ j' : A.data.ι,
      frobeniusCharacter A (A.data.rootIndex j).val = (A.data.rootIndex j').val := sorry

-- Test Frobenius.torus_origin
/- For a torus (no roots over `Ĕ`), such as the norm-one torus of an unramified quadratic
extension on which Frobenius acts on `V = ℝ` by `−1`, Frobenius fixes the origin of the base
valuation (the point of displacement `0`); the affine map is the linear one about that origin, not
`x ↦ −x + c` with `c ≠ 0`. -/
example (A : UnramifiedApartmentData H) [IsEmpty A.data.ι] (x : Apartment A.valuation)
    (hx : x.displacement = 0) : frobeniusOnApartment A x = x := by
  have h := frobeniusOnApartment_central A x hx
  have h0 : Set.range A.data.Φ.coroot = ∅ := Set.range_eq_empty _
  rw [h0, Submodule.span_empty, Submodule.mem_bot] at h
  exact vsub_eq_zero_iff_eq.1 h

-- Test Frobenius.descent_torus_origin
/- For a torus over `Ĕ` the descent sends the base point of the rational apartment (displacement
`0`) to the base point over `Ĕ`. -/
example (D : LocalRootData E H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (hφ : φ.IsCompatible D (torusValuationMap D)) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) [IsEmpty A.data.ι] (x : Apartment φ)
    (hx : x.displacement = 0) (y : Apartment A.valuation) (hy : y.displacement = 0) :
    apartmentDescent D φ hφ A hS x = y := by
  have h := apartmentDescent_central D φ hφ A hS x hx y hy
  have h0 : Set.range A.data.Φ.coroot = ∅ := Set.range_eq_empty _
  rw [h0, Submodule.span_empty, Submodule.mem_bot] at h
  exact vsub_eq_zero_iff_eq.1 h

-- Test Frobenius.descent_split
/- If the chosen `E`-split torus is itself the descended torus, Frobenius is trivial on the
apartment and the descent is onto. -/
example (D : LocalRootData E H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (hφ : φ.IsCompatible D (torusValuationMap D)) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) (hT : A.torusIdeal = D.splitTorus) :
    Function.Surjective (apartmentDescent D φ hφ A hS) := sorry

-- Test Frobenius.descent_dimension
/- The image of the descent is an affine subspace of dimension `dim S`: the Frobenius-fixed
vectors of `V(Ĕ)` form a space of the dimension of `V(E)` (BT II 5.1.13 (ii), p. 150). -/
example (D : LocalRootData E H) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) :
    Module.finrank ℝ (LinearMap.ker
      ((frobeniusOnApartment_linear A).toLinearMap - LinearMap.id)) = Module.finrank ℝ D.V := sorry

-- Test Frobenius.descentCharacter_frobenius
/- Restriction to the `E`-split torus does not see Frobenius: `χ` and its Frobenius transform
restrict to the same character of `S`. -/
example (D : LocalRootData E H) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) (χ : GeometricRoots.Character A.data.splitTorus) :
    descentCharacter D A hS (frobeniusCharacter A χ) = descentCharacter D A hS χ := sorry

-- Test Frobenius.descentCharacter_surjective
/- Every character of the subtorus `S` extends to the descended torus. -/
example (D : LocalRootData E H) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) : Function.Surjective (descentCharacter D A hS) := sorry

-- Test Frobenius.descentCharacter_split
/- If the descended torus is the chosen `E`-split torus, restriction is an isomorphism. -/
example (D : LocalRootData E H) (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) (hT : A.torusIdeal = D.splitTorus) :
    Function.Bijective (descentCharacter D A hS) := sorry

end Frobenius

/-! ### Minuscule coweights -/

section Minuscule

variable {ιZ X Y : Type u} [AddCommGroup X] [AddCommGroup Y] (Ψ : RootPairing ιZ ℤ X Y)

/-- `μ` is minuscule: `⟨a, μ⟩ ∈ {-1, 0, 1}` for every root of the `ℤ`-root pairing `Ψ`
([Kisin–Pappas], §2.1.1, footnote 3, arXiv v3 p. 25). It differs from Tau Ceti's
`TauCeti.IsMinuscule`, a condition on dominant weights of a Killing Lie algebra phrased through
the weights of the irreducible module. -/
def IsMinuscule (μ : Y) : Prop := ∀ i, Ψ.toLinearMap (Ψ.root i) μ ∈ ({-1, 0, 1} : Set ℤ)

-- Test BruhatTits.IsMinuscule.zero
example : IsMinuscule Ψ 0 := by intro i; simp

-- Test BruhatTits.IsMinuscule.rankZero
example [IsEmpty ιZ] (μ : Y) : IsMinuscule Ψ μ := by
  intro i
  exact isEmptyElim i

-- Test BruhatTits.IsMinuscule.not_double
example (μ : Y) (i : ιZ) (hi : Ψ.toLinearMap (Ψ.root i) μ = 1) :
    ¬ IsMinuscule Ψ (2 • μ) := by
  intro h
  have h' := h i
  simp [hi] at h'

-- Test BruhatTits.IsMinuscule.negation
example (μ : Y) (hμ : IsMinuscule Ψ μ) : IsMinuscule Ψ (-μ) := by
  intro i
  have h := hμ i
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at h ⊢
  simp only [map_neg]
  rcases h with h | h | h <;> simp [h]

end Minuscule

/-! ### The algebraic fundamental group -/

namespace AlgebraicFundamentalGroup

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : AbsoluteRootData K H)

/-- The action of the absolute Galois group on `X_*(T)` through the based action `μ_G`, as a left
representation. Mathlib's `RootPairing.Equiv.coweightEquiv` is contravariant, hence the inverse. -/
def cocharacterRepresentation : Representation ℤ (Field.absoluteGaloisGroup K) D.Y :=
  LinearEquiv.automorphismGroup.toLinearMapMonoidHom.comp
    ((MulEquiv.inv' (D.Y ≃ₗ[ℤ] D.Y)).symm.toMonoidHom.comp
      ((RootPairing.Equiv.coweightHom D.Ψ).comp D.galoisAction))

theorem cocharacterRepresentation_apply (γ : Field.absoluteGaloisGroup K) (y : D.Y) :
    cocharacterRepresentation D γ y = (D.galoisAction γ).coweightEquiv.symm y := rfl

/-- Every automorphism of the root datum preserves the coroot lattice `Q^∨`. -/
theorem corootSpan_le_comap (g : RootPairing.Aut D.Ψ) :
    Submodule.span ℤ (Set.range D.Ψ.coroot) ≤
      (Submodule.span ℤ (Set.range D.Ψ.coroot)).comap (g.coweightEquiv.symm : D.Y →ₗ[ℤ] D.Y) := by
  rw [Submodule.span_le]
  rintro _ ⟨i, rfl⟩
  have h : g.coweightEquiv (D.Ψ.coroot (g.indexEquiv i)) = D.Ψ.coroot i := by
    simp [RootPairing.Hom.coroot_coweightMap_apply]
  exact Submodule.subset_span ⟨g.indexEquiv i, (LinearEquiv.eq_symm_apply _).mpr h⟩

/-- The Galois action on `π₁(G)`, induced from `cocharacterRepresentation` on the quotient by
`Q^∨`. -/
def galoisAction : Representation ℤ (Field.absoluteGaloisGroup K) (AlgebraicFundamentalGroup D) :=
  (cocharacterRepresentation D).quotient (Submodule.span ℤ (Set.range D.Ψ.coroot))
    (fun γ => corootSpan_le_comap D (D.galoisAction γ))

theorem galoisAction_mk (γ : Field.absoluteGaloisGroup K) (y : D.Y) :
    galoisAction D γ (Submodule.Quotient.mk y) =
      Submodule.Quotient.mk ((D.galoisAction γ).coweightEquiv.symm y) := rfl

/-- The map `π₁(G) → π₁(G')` induced by a homomorphism of cocharacter lattices carrying coroots
into the coroot lattice. A homomorphism of groups compatible with the maximal tori supplies such
a lattice map through `cocharacterMap` and `cocharacterMap_coroot`. -/
def map {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (f : D.Y →+ D'.Y)
    (hf : ∀ i, f (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D'.Ψ.coroot)) :
    AlgebraicFundamentalGroup D →+ AlgebraicFundamentalGroup D' :=
  ((Submodule.span ℤ (Set.range D.Ψ.coroot)).mapQ (Submodule.span ℤ (Set.range D'.Ψ.coroot))
    f.toIntLinearMap (Submodule.span_le.mpr (by rintro _ ⟨i, rfl⟩; exact hf i))).toAddMonoidHom

theorem map_mk {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (f : D.Y →+ D'.Y)
    (hf : ∀ i, f (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D'.Ψ.coroot)) (y : D.Y) :
    map D D' f hf (Submodule.Quotient.mk y) = Submodule.Quotient.mk (f y) := rfl

/-- `π₁(G)_I`: Mathlib's coinvariants `Representation.Coinvariants` of the Galois representation
restricted to the subgroup `I`. For a normal `I`, `Representation.quotientToCoinvariants` supplies
the action of `Γ_K/I` on it. -/
abbrev inertiaCoinvariants (I : Subgroup (Field.absoluteGaloisGroup K)) : Type u :=
  Representation.Coinvariants ((galoisAction D).comp I.subtype)

/-- With no roots the coroot lattice is zero and `π₁ = X_*`. -/
def torus [IsEmpty D.ι] : AlgebraicFundamentalGroup D ≃+ D.Y :=
  (Submodule.quotEquivOfEqBot _ (by simp [Set.range_eq_empty])).toAddEquiv

theorem torus_mk [IsEmpty D.ι] (y : D.Y) : torus D (Submodule.Quotient.mk y) = y := rfl

/-- Levi kernel: for the standard Levi `M` whose simple roots are `levi ⊆ D.base.support`,
`π₁(M) = X_*(T)/⟨α^∨ : α ∈ levi⟩`, and the kernel of `π₁(M) → π₁(G)` is spanned by the images
of the simple coroots outside `levi`. -/
theorem leviKernel (levi : Set D.ι) (hlevi : levi ⊆ D.base.support) :
    LinearMap.ker ((Submodule.span ℤ (D.Ψ.coroot '' levi)).mapQ
        (Submodule.span ℤ (Set.range D.Ψ.coroot)) LinearMap.id
        ((Submodule.span_mono (Set.image_subset_range _ _)).trans
          (le_of_eq (Submodule.comap_id _).symm))) =
      Submodule.map (Submodule.span ℤ (D.Ψ.coroot '' levi)).mkQ
        (Submodule.span ℤ (D.Ψ.coroot '' ((D.base.support : Set D.ι) \ levi))) := sorry

/-- Weyl group elements act trivially on `X_*/Q^∨`. -/
theorem weyl_invariant (w : D.Ψ.weylGroup) (y : D.Y) :
    (Submodule.Quotient.mk (((w : RootPairing.Aut D.Ψ).coweightEquiv) y) :
        AlgebraicFundamentalGroup D) = Submodule.Quotient.mk y := sorry

section Functoriality

variable {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')

/-- The homomorphism `G → G'` with coordinate map `f : H' → H` carries the maximal torus of `D`
into that of `D'`: `f` maps the defining ideal of `T'` into that of `T`. -/
def TorusCompatible (f : (H' : Type u) →ₐc[K] (H : Type u)) : Prop :=
  ∀ a ∈ D'.torusIdeal.toIdeal, f a ∈ D.torusIdeal.toIdeal

/-- When `G'` is a torus its maximal torus is `G'` itself, so every homomorphism is compatible. -/
theorem torusCompatible_of_torus (hT' : TauCeti.torusCommHopfAlgProperty K H')
    (f : (H' : Type u) →ₐc[K] (H : Type u)) : TorusCompatible D D' f := sorry

/-- Pullback of characters `X^*(T') → X^*(T)` along a homomorphism carrying `T` into `T'`. -/
def characterPullback (f : (H' : Type u) →ₐc[K] (H : Type u)) (_hf : TorusCompatible D D' f) :
    D'.X →+ D.X := sorry

/-- The pullback is characterized by evaluation on geometric points of the maximal torus. -/
theorem characterPullback_value (f : (H' : Type u) →ₐc[K] (H : Type u))
    (hf : TorusCompatible D D' f) (χ : D'.X)
    (x : subgroupPoints D.torusIdeal (AlgebraicClosure K))
    (y : subgroupPoints D'.torusIdeal (AlgebraicClosure K))
    (hy : y.val = WithConv.toConv (x.val.ofConv.comp f.toAlgHom)) :
    GeometricRoots.geometricCharacterValue D.torusIdeal
      (D.characterEquiv (characterPullback D D' f hf χ)) x =
    GeometricRoots.geometricCharacterValue D'.torusIdeal (D'.characterEquiv χ) y := sorry

/-- The covariant map `X_*(T) → X_*(T')`, dual to `characterPullback`. -/
def cocharacterMap (f : (H' : Type u) →ₐc[K] (H : Type u)) (_hf : TorusCompatible D D' f) :
    D.Y →+ D'.Y := sorry

theorem cocharacterMap_pairing (f : (H' : Type u) →ₐc[K] (H : Type u))
    (hf : TorusCompatible D D' f) (χ : D'.X) (y : D.Y) :
    D'.Ψ.toLinearMap χ (cocharacterMap D D' f hf y) =
      D.Ψ.toLinearMap (characterPullback D D' f hf χ) y := sorry

/-- Coroots of `G` map into the coroot lattice of `G'`: the homomorphism lifts to the simply
connected covers of the derived groups. -/
theorem cocharacterMap_coroot (f : (H' : Type u) →ₐc[K] (H : Type u))
    (hf : TorusCompatible D D' f) (i : D.ι) :
    cocharacterMap D D' f hf (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D'.Ψ.coroot) := sorry

/-- The induced map on `π₁` commutes with the Galois actions: the based actions differ from the
geometric ones by Weyl elements, which act trivially on `π₁`. -/
theorem map_galoisAction (f : (H' : Type u) →ₐc[K] (H : Type u)) (hf : TorusCompatible D D' f)
    (γ : Field.absoluteGaloisGroup K) (x : AlgebraicFundamentalGroup D) :
    map D D' (cocharacterMap D D' f hf) (cocharacterMap_coroot D D' f hf) (galoisAction D γ x) =
      galoisAction D' γ (map D D' (cocharacterMap D D' f hf) (cocharacterMap_coroot D D' f hf) x) :=
  sorry

/-- Exactness of `0 → X_*(Z) → π₁(G̃) → π₁(G) → 0` for a quotient map `G̃ → G` (coordinate map
`f`, injective) whose kernel `Z` is a central torus, with compatible maximal tori; `X_*(Z)` is the
kernel of `cocharacterMap`. -/
theorem exact_central (f : (H' : Type u) →ₐc[K] (H : Type u)) (hf : TorusCompatible D D' f)
    (hquot : Function.Injective f)
    (hker : ∃ I : TauCeti.HopfIdeal K H,
      TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I) ∧
      (∀ (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (H →ₐ[K] R)),
        g ∈ subgroupPoints I R ↔
          WithConv.toConv (g.ofConv.comp f.toAlgHom) = (1 : WithConv (H' →ₐ[K] R))) ∧
      (∀ (R : Type u) [CommRing R] [Algebra K R]
        (z : subgroupPoints I R) (g : WithConv (H →ₐ[K] R)), Commute z.val g)) :
    Function.Surjective (map D D' (cocharacterMap D D' f hf) (cocharacterMap_coroot D D' f hf)) ∧
      (∀ x : AlgebraicFundamentalGroup D,
        map D D' (cocharacterMap D D' f hf) (cocharacterMap_coroot D D' f hf) x = 0 ↔
          ∃ y : D.Y, cocharacterMap D D' f hf y = 0 ∧ Submodule.Quotient.mk y = x) ∧
      ∀ y : D.Y, cocharacterMap D D' f hf y = 0 →
        y ∈ Submodule.span ℤ (Set.range D.Ψ.coroot) → y = 0 := sorry

end Functoriality

-- Test BruhatTits.AlgebraicFundamentalGroup.gl_n
example (n : ℕ) (hn : n ≠ 0)
    (D : AbsoluteRootData K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)) :
    Nonempty (AlgebraicFundamentalGroup D ≃+ ℤ) := sorry

/- Check `AlgebraicFundamentalGroup.pgl_n`: a schematically dominant quotient of `GL_n`
with scalar kernel represents `PGL_n`; its fundamental group is `ℤ/n` for `n ≥ 1`.
The kernel is tested on every algebra, including nonreduced algebras. -/
example (n : ℕ) (hn : 0 < n) (D : AbsoluteRootData K H)
    (q : (H : Type u) →ₐc[K] TauCeti.GeneralLinear.coordinateHopfAlgebra K n)
    (hq : Function.Injective q)
    (hker : ∀ (R : Type u) [CommRing R] [Algebra K R]
      (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K n →ₐ[K] R)),
      WithConv.toConv (g.ofConv.comp q.toAlgHom) = (1 : WithConv (H →ₐ[K] R)) ↔
        ∃ a : Rˣ, TauCeti.GeneralLinear.pointsMulEquiv n g =
          Matrix.GeneralLinearGroup.scalar (Fin n) a) :
    Nonempty (AlgebraicFundamentalGroup D ≃+ ZMod n) := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.sl_n
example (n : ℕ)
    (D : AbsoluteRootData K (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra K n)) :
    Subsingleton (AlgebraicFundamentalGroup D) := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.not_cocharacters
example (D : AbsoluteRootData K (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra K 2)) :
    Subsingleton (AlgebraicFundamentalGroup D) ∧ Nonempty (D.Y ≃+ ℤ) := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.galoisAction_gl_n_trivial
example (n : ℕ)
    (D : AbsoluteRootData K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (γ : Field.absoluteGaloisGroup K) (x : AlgebraicFundamentalGroup D) :
    galoisAction D γ x = x := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.galoisAction_normOne
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (D : AbsoluteRootData K (NormTorus.coordinateHopf K L))
    (γ : Field.absoluteGaloisGroup K) (σ : L →ₐ[K] AlgebraicClosure K)
    (hγ : (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from γ).toAlgHom.comp σ ≠ σ)
    (x : AlgebraicFundamentalGroup D) :
    galoisAction D γ x = -x := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants_bot
example : Function.Bijective
    (Representation.Coinvariants.mk ((galoisAction D).comp (⊥ : Subgroup _).subtype)) := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.map_id
example : map D D (AddMonoidHom.id D.Y) (fun i => Submodule.subset_span ⟨i, rfl⟩) =
    AddMonoidHom.id (AlgebraicFundamentalGroup D) := by
  ext x
  induction x using Submodule.Quotient.induction_on with
  | H y => rfl

-- Test BruhatTits.AlgebraicFundamentalGroup.cocharacterMap_id
example : cocharacterMap D D (BialgHom.id K (H : Type u)) (fun _ ha => ha) =
    AddMonoidHom.id D.Y := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.cocharacterRepresentation_pairing
/- `γ` acts on `X_*(T)` by the inverse transpose of `μ_G(γ)`, so the pairing is invariant. With
the transpose itself (Mathlib's contravariant `coweightEquiv`) the identity fails as soon as
`μ_G(γ)` has order three, as for the norm-one torus of a cyclic cubic extension. -/
example (γ : Field.absoluteGaloisGroup K) (x : D.X) (y : D.Y) :
    D.Ψ.toLinearMap ((D.galoisAction γ).weightEquiv x) (cocharacterRepresentation D γ y) =
      D.Ψ.toLinearMap x y := by
  rw [cocharacterRepresentation_apply, RootPairing.Equiv.toLinearMap_weightEquiv,
    LinearEquiv.apply_symm_apply]

-- Test BruhatTits.AlgebraicFundamentalGroup.cocharacterRepresentation_torus
/- For a torus the based action is the geometric one: the action on cocharacters is contragredient
to the Galois action on geometric characters. -/
example [IsEmpty D.ι] (γ : Field.absoluteGaloisGroup K)
    (χ : GeometricRoots.GeometricCharacter D.torusIdeal) (y : D.Y) :
    D.cocharacterEquiv (cocharacterRepresentation D γ y) (γ • χ) = D.cocharacterEquiv y χ := by
  obtain ⟨w, hw⟩ := D.galoisAction_geometric γ
  have hw1 : w = 1 := by
    have h : (w : RootPairing.Aut D.Ψ) ∈
        Subgroup.closure (Set.range (RootPairing.Equiv.reflection D.Ψ)) := w.2
    rw [Set.range_eq_empty, Subgroup.closure_empty] at h
    exact Subtype.ext (Subgroup.mem_bot.1 h)
  subst hw1
  obtain ⟨x, rfl⟩ := D.characterEquiv.surjective χ
  have hx : D.characterEquiv ((D.galoisAction γ).weightEquiv x) = γ • D.characterEquiv x := hw x
  rw [← hx, ← D.pairing_eq, ← D.pairing_eq, cocharacterRepresentation_apply,
    RootPairing.Equiv.toLinearMap_weightEquiv, LinearEquiv.apply_symm_apply]

-- Test BruhatTits.AlgebraicFundamentalGroup.cocharacterRepresentation_split
/- A split group (trivial `μ_G`) has trivial action on `X_*(T)`. -/
example (h : ∀ γ, D.galoisAction γ = 1) (γ : Field.absoluteGaloisGroup K) :
    cocharacterRepresentation D γ = 1 := by
  ext y
  rw [cocharacterRepresentation_apply, h γ]
  exact (LinearEquiv.symm_apply_eq _).2 rfl

-- Test BruhatTits.AlgebraicFundamentalGroup.galoisAction_split
/- A split group has trivial Galois action on `π₁(G)`. -/
example (h : ∀ γ, D.galoisAction γ = 1) (γ : Field.absoluteGaloisGroup K)
    (x : AlgebraicFundamentalGroup D) : galoisAction D γ x = x := by
  induction x using Submodule.Quotient.induction_on with
  | H y =>
    rw [galoisAction_mk, h γ]
    exact congrArg _ ((LinearEquiv.symm_apply_eq _).2 rfl)

-- Test BruhatTits.AlgebraicFundamentalGroup.map_comp
/- `map` is functorial in the lattice map. -/
example {H' H'' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (D'' : AbsoluteRootData K H'') (f : D.Y →+ D'.Y) (g : D'.Y →+ D''.Y)
    (hf : ∀ i, f (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D'.Ψ.coroot))
    (hg : ∀ i, g (D'.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D''.Ψ.coroot))
    (hgf : ∀ i, (g.comp f) (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D''.Ψ.coroot)) :
    map D D'' (g.comp f) hgf = (map D' D'' g hg).comp (map D D' f hf) := by
  ext x
  induction x using Submodule.Quotient.induction_on with
  | H y => rfl

-- Test BruhatTits.AlgebraicFundamentalGroup.map_torus
/- With no roots on either side, `map` is the lattice map itself under `torus`. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    [IsEmpty D.ι] [IsEmpty D'.ι] (f : D.Y →+ D'.Y)
    (hf : ∀ i, f (D.Ψ.coroot i) ∈ Submodule.span ℤ (Set.range D'.Ψ.coroot))
    (x : AlgebraicFundamentalGroup D) :
    torus D' (map D D' f hf x) = f (torus D x) := by
  induction x using Submodule.Quotient.induction_on with
  | H y => rfl

-- Test BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants_normOne
/- For the norm-one torus of a separable quadratic `L/K` and a subgroup `I` containing an element
that moves `L`, that element acts on `π₁(T) = X_*(T) ≅ ℤ` by `−1`, so `π₁(T)_I ≅ ℤ/2`. -/
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (D : AbsoluteRootData K (NormTorus.coordinateHopf K L))
    (I : Subgroup (Field.absoluteGaloisGroup K)) (σ : L →ₐ[K] AlgebraicClosure K)
    (hI : ∃ γ ∈ I,
      (show AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K from γ).toAlgHom.comp σ ≠ σ) :
    Nonempty (inertiaCoinvariants D I ≃+ ZMod 2) := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants_split
/- For a split group every `I` acts trivially and `π₁(G)_I = π₁(G)`. -/
example (h : ∀ γ, D.galoisAction γ = 1) (I : Subgroup (Field.absoluteGaloisGroup K)) :
    Function.Bijective (Representation.Coinvariants.mk ((galoisAction D).comp I.subtype)) := by
  have hρ : ∀ (g : I) (x : AlgebraicFundamentalGroup D),
      (galoisAction D).comp I.subtype g x = x := by
    intro g x
    induction x using Submodule.Quotient.induction_on with
    | H y =>
      change galoisAction D (g : Field.absoluteGaloisGroup K) (Submodule.Quotient.mk y) = _
      rw [galoisAction_mk, h]
      exact congrArg _ ((LinearEquiv.symm_apply_eq _).2 rfl)
  have hker : Representation.Coinvariants.ker ((galoisAction D).comp I.subtype) = ⊥ := by
    rw [eq_bot_iff, Representation.Coinvariants.ker, Submodule.span_le]
    rintro _ ⟨⟨g, x⟩, rfl⟩
    exact (Submodule.mem_bot ℤ).2 (sub_eq_zero.2 (hρ g x))
  refine ⟨fun a b hab => ?_, Representation.Coinvariants.mk_surjective _⟩
  rw [Representation.Coinvariants.mk_eq_iff, hker, Submodule.mem_bot, sub_eq_zero] at hab
  exact hab

-- Test BruhatTits.AlgebraicFundamentalGroup.TorusCompatible_id_iff
/- The identity of `G` is compatible with two maximal tori exactly when they coincide: maximal
tori are not nested. -/
example (D₂ : AbsoluteRootData K H) :
    TorusCompatible D D₂ (BialgHom.id K (H : Type u)) ↔ D.torusIdeal = D₂.torusIdeal := by
  constructor
  · intro h
    have h21 : D₂.torusIdeal ≤ D.torusIdeal := fun a ha => h a ha
    exact le_antisymm (D.maximalTorus.le_of_le D₂.maximalTorus.prop h21) h21
  · intro h a ha
    rw [h]
    exact ha

-- Test BruhatTits.AlgebraicFundamentalGroup.TorusCompatible_points
/- Compatibility says that every point of `T` maps to a point of `T'`, on every coefficient
algebra. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (f : (H' : Type u) →ₐc[K] (H : Type u)) :
    TorusCompatible D D' f ↔ ∀ (R : Type u) [CommRing R] [Algebra K R]
      (t : WithConv (H →ₐ[K] R)), t ∈ subgroupPoints D.torusIdeal R →
        WithConv.toConv (t.ofConv.comp f.toAlgHom) ∈ subgroupPoints D'.torusIdeal R := by
  constructor
  · intro hf R _ _ t ht
    refine (TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff H'.obj _
      (CommAlgCat.of K R) _).2 fun a ha => ?_
    exact (TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff H.obj _
      (CommAlgCat.of K R) t).1 ht _ (hf a ha)
  · intro h a ha
    have h1 := h ((H : Type u) ⧸ D.torusIdeal.toIdeal)
      (WithConv.toConv (Ideal.Quotient.mkₐ K D.torusIdeal.toIdeal))
      ((TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff H.obj _
        (CommAlgCat.of K _) _).2 fun b hb => Ideal.Quotient.eq_zero_iff_mem.2 hb)
    exact Ideal.Quotient.eq_zero_iff_mem.1
      ((TauCeti.CommHopfAlgCat.mem_quotientPointsSubgroup_iff H'.obj _
        (CommAlgCat.of K _) _).1 h1 a ha)

-- Test BruhatTits.AlgebraicFundamentalGroup.TorusCompatible_trivial
/- The trivial homomorphism `G → G'` (coordinate map `a ↦ ε(a)`) is compatible. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H') :
    TorusCompatible D D' ((Bialgebra.unitBialgHom K (H : Type u)).comp
      (Bialgebra.counitBialgHom K (H' : Type u))) := by
  intro a ha
  have h0 : Coalgebra.counit (R := K) a = 0 := D'.torusIdeal.counit_eq_zero ha
  rw [BialgHom.comp_apply, Bialgebra.counitBialgHom_apply, h0, map_zero]
  exact zero_mem _

-- Test BruhatTits.AlgebraicFundamentalGroup.characterPullback_id
example : characterPullback D D (BialgHom.id K (H : Type u)) (fun _ ha => ha) =
    AddMonoidHom.id D.X := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.characterPullback_trivial
/- Along the trivial homomorphism every character pulls back to the trivial character. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (ht : TorusCompatible D D' ((Bialgebra.unitBialgHom K (H : Type u)).comp
      (Bialgebra.counitBialgHom K (H' : Type u)))) :
    characterPullback D D' _ ht = 0 := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.characterPullback_comp
example {H' H'' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (D'' : AbsoluteRootData K H'') (f : (H' : Type u) →ₐc[K] (H : Type u))
    (g : (H'' : Type u) →ₐc[K] (H' : Type u)) (hf : TorusCompatible D D' f)
    (hg : TorusCompatible D' D'' g) :
    characterPullback D D'' (f.comp g) (fun a ha => hf _ (hg a ha)) =
      (characterPullback D D' f hf).comp (characterPullback D' D'' g hg) := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.cocharacterMap_trivial
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (ht : TorusCompatible D D' ((Bialgebra.unitBialgHom K (H : Type u)).comp
      (Bialgebra.counitBialgHom K (H' : Type u)))) :
    cocharacterMap D D' _ ht = 0 := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.cocharacterMap_comp
example {H' H'' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    (D'' : AbsoluteRootData K H'') (f : (H' : Type u) →ₐc[K] (H : Type u))
    (g : (H'' : Type u) →ₐc[K] (H' : Type u)) (hf : TorusCompatible D D' f)
    (hg : TorusCompatible D' D'' g) :
    cocharacterMap D D'' (f.comp g) (fun a ha => hf _ (hg a ha)) =
      (cocharacterMap D' D'' g hg).comp (cocharacterMap D D' f hf) := sorry

-- Test BruhatTits.AlgebraicFundamentalGroup.cocharacterMap_torus_equivariant
/- A homomorphism of tori is defined over `K`, so its map on cocharacters commutes with `Γ_K`. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D' : AbsoluteRootData K H')
    [IsEmpty D.ι] [IsEmpty D'.ι] (f : (H' : Type u) →ₐc[K] (H : Type u))
    (hf : TorusCompatible D D' f) (γ : Field.absoluteGaloisGroup K) (y : D.Y) :
    cocharacterMap D D' f hf (cocharacterRepresentation D γ y) =
      cocharacterRepresentation D' γ (cocharacterMap D D' f hf y) := sorry

end AlgebraicFundamentalGroup

/-! ### Examples -/

namespace Examples

/-- Every element of `ν(N)` is an element of `W_a` followed by an element of the stabilizer of a
fixed alcove `C`: `ν(N)` permutes the affine roots, hence the alcoves, and normalizes `W_a`
(Bruhat–Tits I, 6.2.10–6.2.11, pp. 122–123), `W_a` acts simply transitively on the chambers (1.3.3,
pp. 20–21), and for a discrete valuation `W_a` is an affine Weyl group (6.2.22, p. 127). This holds
for every discrete valuation; the `SL₂` and `PGL₂` values of the stabilizer (trivial, respectively
of order two) are README computations. -/
theorem normalizer_mem_affineWeyl_mul_stabilizer {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} [Finite ι] (φ : Valuation D) (_hφ : φ.IsDiscrete) (C : Facet φ)
    (hC : C.IsAlcove)
    (n : D.weylNormalizer) :
    ∃ w ∈ AffineWeylGroup φ, ⇑(w⁻¹ * Apartment.action φ n) '' C.carrier = C.carrier := sorry

/-- For a multipliable root `a` with `2a = Φ.root j`, axioms DR3 and V4 give `Γ_{2a} ⊆ 2·Γ_a`
(Bruhat–Tits I, 6.1.1, p. 107, and 6.2.1–6.2.2, p. 117). The inclusion can be strict: for the
ramified quasi-split `SU₃`, Bruhat–Tits II 4.2.21, p. 98, gives `Γ_a = ½ω(K'^×)` while `Γ_{2a}` is
the value set of the trace-zero elements. -/
theorem valueSet_double_subset {G : Type v} [Group G] {Φ : RootPairing ι ℝ M N}
    {D : RootDatum G Φ} (φ : Valuation D) (i j : ι) (hij : Φ.root j = (2 : ℝ) • Φ.root i) :
    φ.valueSet j ⊆ (fun r => 2 * r) '' φ.valueSet i := by
  rintro r ⟨u, hu, hr⟩
  have hd := φ.doubling i j hij u
  let v : D.U i := ⟨u, D.le_of_root_eq_two_smul i j hij u.property⟩
  have hv : v ≠ 1 := fun h => hu (Subtype.ext (by simpa [v] using congrArg Subtype.val h))
  rcases hφ : φ.φ i v with _ | s
  · have : φ.φ j u = ⊤ := by
      rw [hd]
      change 2 * φ.φ i v = ⊤
      rw [hφ]
      exact WithTop.mul_top (by norm_num)
    rw [this] at hr
    exact absurd hr WithTop.top_ne_coe
  · refine ⟨s, ⟨v, hv, hφ⟩, ?_⟩
    have h2 : (2 : WithTop ℝ) * (s : WithTop ℝ) = (r : WithTop ℝ) := by
      rw [← hr, hd]
      change (2 : WithTop ℝ) * (s : WithTop ℝ) = 2 * φ.φ i v
      rw [hφ]
      rfl
    have h3 : ((2 * s : ℝ) : WithTop ℝ) = (r : WithTop ℝ) := by
      rw [WithTop.coe_mul]
      exact h2
    exact WithTop.coe_injective h3

end Examples

end BruhatTits

/-! ### z-extensions and the Kottwitz homomorphism -/

namespace ZExtension

/-- The scheme-theoretic derived subgroup is semisimple and simply connected. -/
def DerivedSimplyConnected {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) : Prop :=
  ∃ h : TauCeti.semisimpleCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H)),
    TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty K
      ⟨TauCeti.FiniteTypeCommHopfAlgCat.quotient H (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H), h⟩

/-- `f` is the coordinate map of a z-extension `G̃ → G` (Nguyễn Quốc Thắng, §2.0, p. 4): both
groups are reductive, `f` is injective (so `G̃ → G` is a quotient map), `G̃_der` is simply
connected, and the kernel, cut out by the Hopf ideal `I` on every coefficient algebra, is a
central torus whose geometric character group has a finite Galois-permuted basis, i.e. an induced
torus `∏ Res_{K_i/K} G_m`. -/
def IsZExtension {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐc[K] (Gt : Type u)) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty K G ∧
  TauCeti.reductiveCommHopfAlgProperty K Gt ∧
  Function.Injective f ∧ DerivedSimplyConnected Gt ∧
  ∃ I : TauCeti.HopfIdeal K Gt,
    TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient Gt I) ∧
    (∃ (B : Type u) (_ : Fintype B)
      (b : Module.Basis B ℤ (BruhatTits.GeometricRoots.GeometricCharacter I)),
      ∀ (γ : Field.absoluteGaloisGroup K) (x : B), ∃ y : B, γ • b x = b y) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (Gt →ₐ[K] R)),
      g ∈ BruhatTits.subgroupPoints I R ↔
        WithConv.toConv (g.ofConv.comp (f : G →ₐ[K] Gt)) = (1 : WithConv (G →ₐ[K] R))) ∧
    (∀ (R : Type u) [CommRing R] [Algebra K R]
      (z : BruhatTits.subgroupPoints I R) (g : WithConv (Gt →ₐ[K] R)), Commute z.val g)

/-- `G̃(K') → G(K')` is onto for every field `K'/K`: `H¹(K', Z) = 1` for the induced torus `Z`
(Shapiro's lemma and Hilbert's Theorem 90). -/
theorem surjective_points {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : (G : Type u) →ₐc[K] (Gt : Type u)) (hf : IsZExtension f)
    (K' : Type u) [Field K'] [Algebra K K'] :
    Function.Surjective fun x : (Gt : Type u) →ₐ[K] K' => x.comp (f : G →ₐ[K] Gt) := sorry

/-- `π₁(G̃)` is torsion-free: its torsion subgroup is `π₁(G̃_der)`, which vanishes because
`G̃_der` is simply connected. -/
theorem fundamentalGroup_torsionFree {K : Type u} [Field K]
    {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : (G : Type u) →ₐc[K] (Gt : Type u))
    (Dt : BruhatTits.AbsoluteRootData K Gt) (hf : IsZExtension f) :
    ∀ x : BruhatTits.AlgebraicFundamentalGroup Dt, ∀ n : ℕ, 0 < n → n • x = 0 → x = 0 := sorry

/-- Composing a z-extension with an automorphism of `G̃` gives a z-extension. -/
theorem comp_isZExtension_of_iso {K : Type u} [Field K]
    {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : (G : Type u) →ₐc[K] (Gt : Type u))
    (hf : IsZExtension f) (e : Gt ≅ Gt) :
    IsZExtension ((TauCeti.FiniteTypeCommHopfAlgCat.toBialgHom e.hom).comp f) := sorry

/-- Every connected reductive group over any field has a z-extension (Nguyễn Quốc Thắng,
Lemma 2.1(a), p. 4, proof p. 5). -/
theorem exists_zExtension {K : Type u} [Field K] (G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (_hG : TauCeti.reductiveCommHopfAlgProperty K G) :
    ∃ (Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (f : (G : Type u) →ₐc[K] (Gt : Type u)),
      IsZExtension f := sorry

/-- Vanishing of H¹ of the induced kernel, expressed on finite Galois cocycles.
The action is composition with the actual field automorphism on coefficient values. -/
theorem kernel_H1_vanishes {K : Type u} [Field K]
    {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : G →ₐc[K] Gt) (hf : IsZExtension f)
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    (c : (L ≃ₐ[K] L) → WithConv (Gt →ₐ[K] L))
    (hker : ∀ σ, WithConv.toConv ((c σ).ofConv.comp f.toAlgHom) =
      (1 : WithConv (G →ₐ[K] L)))
    (hc : ∀ σ τ, c (σ * τ) = c σ * TauCeti.AlgHom.mapValue σ.toAlgHom (c τ)) :
    ∃ z : WithConv (Gt →ₐ[K] L),
      WithConv.toConv (z.ofConv.comp f.toAlgHom) = (1 : WithConv (G →ₐ[K] L)) ∧
      ∀ σ, c σ = z⁻¹ * TauCeti.AlgHom.mapValue σ.toAlgHom z := sorry

/-- The connecting map is onto the kernel of H¹(Z) → H¹(Gt).
A cocycle trivial in Gt is the boundary of the descended image of its trivialization. -/
theorem connecting_surjective {K : Type u} [Field K]
    {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : G →ₐc[K] Gt) (hf : IsZExtension f)
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [IsGalois K L]
    (c : (L ≃ₐ[K] L) → WithConv (Gt →ₐ[K] L))
    (hker : ∀ σ, WithConv.toConv ((c σ).ofConv.comp f.toAlgHom) =
      (1 : WithConv (G →ₐ[K] L)))
    (hc : ∀ σ τ, c (σ * τ) = c σ * TauCeti.AlgHom.mapValue σ.toAlgHom (c τ))
    (htrivial : ∃ b : WithConv (Gt →ₐ[K] L),
      ∀ σ, c σ = b⁻¹ * TauCeti.AlgHom.mapValue σ.toAlgHom b) :
    ∃ (g : WithConv (G →ₐ[K] K)) (b : WithConv (Gt →ₐ[K] L)),
      WithConv.toConv (b.ofConv.comp f.toAlgHom) = TauCeti.AlgHom.mapValue (Algebra.ofId K L) g ∧
      ∀ σ, c σ = b⁻¹ * TauCeti.AlgHom.mapValue σ.toAlgHom b := sorry

-- Test ZExtension.identity_simplyConnected
example {K : Type u} [Field K] (G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hG : TauCeti.reductiveCommHopfAlgProperty K G) (hsc : DerivedSimplyConnected G) :
    IsZExtension (BialgHom.id K (G : Type u)) := sorry

-- Test ZExtension.no_finite_nontrivial_kernel
example {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : G →ₐc[K] Gt) (hf : IsZExtension f)
    (hfinite : Finite {z : WithConv (Gt →ₐ[K] AlgebraicClosure K) //
      WithConv.toConv (z.ofConv.comp f.toAlgHom) = (1 : WithConv (G →ₐ[K] AlgebraicClosure K))}) :
    Subsingleton {z : WithConv (Gt →ₐ[K] AlgebraicClosure K) //
      WithConv.toConv (z.ofConv.comp f.toAlgHom) = (1 : WithConv (G →ₐ[K] AlgebraicClosure K))} := sorry

-- Test ZExtension.rational_lift
example {K : Type u} [Field K] {G Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : G →ₐc[K] Gt) (hf : IsZExtension f) (g : G →ₐ[K] K) :
    ∃ gt : Gt →ₐ[K] K, gt.comp f.toAlgHom = g := surjective_points f hf K g

-- Test ZExtension.derivedIdeal_gl_n
/- `D(GL_n) = SL_n` for every `n`. -/
example {K : Type u} [Field K] (n : ℕ) (R : Type u) [CommRing R] [Algebra K R]
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K n →ₐ[K] R)) :
    g ∈ BruhatTits.subgroupPoints
        (TauCeti.CommHopfAlgCat.derivedDefiningIdeal (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)) R ↔
      Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv n g) = 1 := sorry

-- Test ZExtension.derivedIdeal_sl_n
/- `SL_n` is its own derived subgroup for every `n`, in every characteristic. -/
example {K : Type u} [Field K] (n : ℕ) :
    TauCeti.CommHopfAlgCat.derivedDefiningIdeal (R := K)
      (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra K n) = ⊥ := sorry

-- Test ZExtension.DerivedSimplyConnected_gl_n
/- `GL_n` has derived subgroup `SL_n`, which is simply connected. -/
example {K : Type u} [Field K] (n : ℕ) :
    DerivedSimplyConnected (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n) := sorry

-- Test ZExtension.DerivedSimplyConnected_sl_n
example {K : Type u} [Field K] (n : ℕ) :
    DerivedSimplyConnected (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra K n) := sorry

-- Test ZExtension.DerivedSimplyConnected_torus
/- The derived subgroup of a torus is trivial, hence semisimple and simply connected. -/
example {K : Type u} [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hT : TauCeti.torusCommHopfAlgProperty K H) : DerivedSimplyConnected H := sorry

end ZExtension

namespace KottwitzMap

open ValuativeRel BruhatTits.AlgebraicFundamentalGroup

-- Kottwitz 1997, §7, treats the completion of the maximal unramified extension of a p-adic
-- field; Haines–Rapoport, p. 1, (1), state the construction over a strictly henselian discretely
-- valued field. `IsRankLeOne` with `IsDiscrete` and `IsNontrivial` makes the value group `ℤ`.
variable {L : Type u} [Field L] [ValuativeRel L]
  [ValuativeRel.IsDiscrete L] [ValuativeRel.IsNontrivial L] [ValuativeRel.IsRankLeOne L]
  [HenselianLocalRing 𝒪[L]] [IsSepClosed 𝓀[L]]

-- The valued-field binders of `torus` and `kottwitz` are explicit: a definition does not pick up
-- section instances that its type does not use.
/-- `κ_T : T(L) → X_*(T)_I` for a torus with absolute root data `D` (no roots), over a strictly
henselian discretely valued field; here `I = Γ_L`, the whole absolute Galois group of `L`. -/
def torus {L : Type u} [Field L] [ValuativeRel L] [ValuativeRel.IsDiscrete L]
    [ValuativeRel.IsNontrivial L] [ValuativeRel.IsRankLeOne L] [HenselianLocalRing 𝒪[L]]
    [IsSepClosed 𝓀[L]]
    {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L} (D : BruhatTits.AbsoluteRootData L T)
    (_hT : TauCeti.torusCommHopfAlgProperty L T) :
    WithConv ((T : Type u) →ₐ[L] L) →*
      Multiplicative (BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D ⊤) :=
  sorry

/-- `κ_T` is onto (Kottwitz 1997, 7.2, pp. 294–296; Haines–Rapoport, p. 1, (1)). -/
theorem torus_surjective {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T)
    (hT : TauCeti.torusCommHopfAlgProperty L T) :
    Function.Surjective (torus (L := L) D hT) := sorry

/-- The canonical quotient from cocharacters to inertia coinvariants. -/
def cocharacterClass {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (y : D.Y) :
    BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D ⊤ :=
  Representation.Coinvariants.mk _ (Submodule.Quotient.mk y : BruhatTits.AlgebraicFundamentalGroup D)

/-- Normalization on `G_m` (Kottwitz 1997, (7.2.1)–(7.2.4), p. 294; Pappas–Rapoport, §2.a.2,
Step 1, p. 10): for `T ≅ G_m` via `e` and `χ` the restriction of the identity character, every class
`y` representing `κ_T(x)` pairs with `χ` to `ω(x)`. So `κ(ϖ) = 1`, the opposite sign to the torus
valuation map `v` of the apartment. -/
theorem torus_multiplicative {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (hT : TauCeti.torusCommHopfAlgProperty L T)
    (e : T ≃ₐc[L] LaurentPolynomial L)
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L]
      Ideal.Quotient.mk D.torusIdeal.toIdeal (e.symm (LaurentPolynomial.T 1)))
    (x : WithConv (T →ₐ[L] L)) (y : D.Y)
    (hy : cocharacterClass D y = Multiplicative.toAdd (torus D hT x)) :
    D.cocharacterEquiv y χ = Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L)
      (TauCeti.MultiplicativeGroup.pointsMulEquiv
        (WithConv.toConv (x.ofConv.comp e.symm.toAlgEquiv.toAlgHom)))) := sorry

/-- Naturality for every homomorphism of tori `T → T'` (coordinate map `f`), with the map on
coinvariants induced by `cocharacterMap` (Kottwitz 1997, (7.2.7), pp. 295–296). -/
theorem torus_natural {T T' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (hT : TauCeti.torusCommHopfAlgProperty L T)
    (D' : BruhatTits.AbsoluteRootData L T') (hT' : TauCeti.torusCommHopfAlgProperty L T')
    (f : T' →ₐc[L] T) (x : WithConv (T →ₐ[L] L)) (y : D.Y)
    (hy : cocharacterClass D y = Multiplicative.toAdd (torus D hT x)) :
    Multiplicative.toAdd (torus D' hT' (WithConv.toConv (x.ofConv.comp f.toAlgHom))) =
      cocharacterClass D' (cocharacterMap D D' f (torusCompatible_of_torus D D' hT' f) y) := sorry

/-- Induced-torus normalisation. The norm character identifies the coinvariants of
`Res_{L'/L} G_m` with `ℤ`; under this identification `κ` is the normalized valuation of `L'`.
The residue field is perfect, so a finite extension of this strictly henselian field is totally
ramified. Kottwitz 1997, (7.2.4)–(7.2.6), pp. 294–295, and §7.3, pp. 296–297.
The character is specified on every coefficient algebra, and the equivalence is specified on
all cocharacter classes; neither can be changed by a sign or an index. -/
theorem torus_restrictionOfScalars [PerfectField 𝓀[L]]
    (L' : Type u) [Field L'] [Algebra L L'] [FiniteDimensional L L']
    [Algebra.IsSeparable L L'] [ValuativeRel L'] [ValuativeExtension L L']
    [ValuativeRel.IsDiscrete L'] [ValuativeRel.IsNontrivial L'] [ValuativeRel.IsRankLeOne L']
    {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (hT : TauCeti.torusCommHopfAlgProperty L T)
    (e : T ≃ₐc[L] WeilRestriction.ResHopf L L' (LaurentPolynomial L'))
    (c : GroupLike L T)
    (hc : ∀ (R : Type u) [CommRing R] [Algebra L R] (g : WithConv (T →ₐ[L] R)),
      g.ofConv c.val = (NormTorus.norm L L' R
        (WeilRestriction.multiplicativeGroupPoints L L' R
          (WithConv.toConv (g.ofConv.comp e.symm.toAlgEquiv.toAlgHom))) : R))
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L]
      Ideal.Quotient.mk D.torusIdeal.toIdeal c.val) :
    ∃ eI : BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D ⊤ ≃+ ℤ,
      (∀ y : D.Y, eI (cocharacterClass D y) = D.cocharacterEquiv y χ) ∧
      ∀ x : WithConv (T →ₐ[L] L),
        eI (Multiplicative.toAdd (torus D hT x)) =
          Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L')
            (Units.map (Algebra.TensorProduct.rid L L L').toRingEquiv.toMonoidHom
              (WeilRestriction.multiplicativeGroupPoints L L' L
                (WithConv.toConv (x.ofConv.comp e.symm.toAlgEquiv.toAlgHom))))) := sorry

-- Test KottwitzMap.torus_induced_diagonal
/- On the diagonal, a base uniformizer has value `[L' : L]`, not one. The norm character
fixes the coinvariant coordinate, so this detects a missing ramification factor. -/
example [PerfectField 𝓀[L]]
    (L' : Type u) [Field L'] [Algebra L L'] [FiniteDimensional L L']
    [Algebra.IsSeparable L L'] [ValuativeRel L'] [ValuativeExtension L L']
    [ValuativeRel.IsDiscrete L'] [ValuativeRel.IsNontrivial L'] [ValuativeRel.IsRankLeOne L']
    {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (hT : TauCeti.torusCommHopfAlgProperty L T)
    (e : T ≃ₐc[L] WeilRestriction.ResHopf L L' (LaurentPolynomial L'))
    (c : GroupLike L T)
    (hc : ∀ (R : Type u) [CommRing R] [Algebra L R] (g : WithConv (T →ₐ[L] R)),
      g.ofConv c.val = (NormTorus.norm L L' R
        (WeilRestriction.multiplicativeGroupPoints L L' R
          (WithConv.toConv (g.ofConv.comp e.symm.toAlgEquiv.toAlgHom))) : R))
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L]
      Ideal.Quotient.mk D.torusIdeal.toIdeal c.val)
    (eI : BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D ⊤ ≃+ ℤ)
    (heI : ∀ y : D.Y, eI (cocharacterClass D y) = D.cocharacterEquiv y χ)
    (π : Lˣ) (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (x : WithConv (T →ₐ[L] L))
    (hx : WeilRestriction.multiplicativeGroupPoints L L' L
      (WithConv.toConv (x.ofConv.comp e.symm.toAlgEquiv.toAlgHom)) =
        Units.map (Algebra.TensorProduct.includeRight : L →ₐ[L] L' ⊗[L] L).toMonoidHom π) :
    eI (Multiplicative.toAdd (torus D hT x)) = (Module.finrank L L' : ℤ) := sorry

/-- A set of `L`-points of an affine `L`-scheme is bounded if every coordinate function has
bounded valuation on it. -/
def IsBoundedPoints {A : Type u} [CommRing A] [Algebra L A] (S : Set (WithConv (A →ₐ[L] L))) :
    Prop :=
  ∀ f : A, ∃ γ : ValueGroupWithZero L, ∀ x ∈ S, valuation L (x.ofConv f) ≤ γ

-- Test KottwitzMap.IsBoundedPoints.empty
example {A : Type u} [CommRing A] [Algebra L A] :
    IsBoundedPoints (∅ : Set (WithConv (A →ₐ[L] L))) :=
  fun _ => ⟨0, fun _ hx => absurd hx (Set.notMem_empty _)⟩

-- Test KottwitzMap.IsBoundedPoints.units
example : IsBoundedPoints {x : WithConv (LaurentPolynomial L →ₐ[L] L) |
    valuation L ((TauCeti.MultiplicativeGroup.pointsMulEquiv x : Lˣ) : L) = 1} := sorry

-- Test KottwitzMap.IsBoundedPoints.not_all
example : ¬ IsBoundedPoints (Set.univ : Set (WithConv (LaurentPolynomial L →ₐ[L] L))) := sorry

/-- The kernel `T(L)_0` of `κ_T` is bounded, and every bounded subgroup is mapped into the torsion
of `X_*(T)_I`; since the torsion is finite, the maximal bounded subgroup is `κ_T⁻¹(torsion)` and
contains `ker κ_T` with finite index (Kottwitz 1997, (7.2.1)–(7.2.4), p. 294; Bruhat–Tits II,
4.4.2, p. 107; Haines–Rapoport, Remark 10, p. 6). -/
theorem torus_ker {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T)
    (hT : TauCeti.torusCommHopfAlgProperty L T) :
    IsBoundedPoints ((torus (L := L) D hT).ker : Set (WithConv ((T : Type u) →ₐ[L] L))) ∧
      ∀ B : Subgroup (WithConv ((T : Type u) →ₐ[L] L)),
        IsBoundedPoints (B : Set (WithConv ((T : Type u) →ₐ[L] L))) →
        ∀ x ∈ B, IsOfFinOrder (torus (L := L) D hT x) := sorry

-- Test KottwitzMap.torus_gm_two_terms
example {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (hT : TauCeti.torusCommHopfAlgProperty L T)
    (e : T ≃ₐc[L] LaurentPolynomial L)
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L]
      Ideal.Quotient.mk D.torusIdeal.toIdeal (e.symm (LaurentPolynomial.T 1)))
    (π : Lˣ) (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (x y : WithConv (T →ₐ[L] L))
    (hx : TauCeti.MultiplicativeGroup.pointsMulEquiv
      (WithConv.toConv (x.ofConv.comp e.symm.toAlgEquiv.toAlgHom)) = π)
    (hy : TauCeti.MultiplicativeGroup.pointsMulEquiv
      (WithConv.toConv (y.ofConv.comp e.symm.toAlgEquiv.toAlgHom)) = π ^ 2)
    (cx cy : D.Y) (hcx : cocharacterClass D cx = Multiplicative.toAdd (torus D hT x))
    (hcy : cocharacterClass D cy = Multiplicative.toAdd (torus D hT y)) :
    D.cocharacterEquiv cx χ = 1 ∧ D.cocharacterEquiv cy χ = 2 := by
  rw [torus_multiplicative D hT e χ hχ x cx hcx, torus_multiplicative D hT e χ hχ y cy hcy, hx, hy,
    map_pow, hπ]
  decide

-- Test KottwitzMap.torus_gm
example {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L T) (hT : TauCeti.torusCommHopfAlgProperty L T)
    (e : T ≃ₐc[L] LaurentPolynomial L)
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L]
      Ideal.Quotient.mk D.torusIdeal.toIdeal (e.symm (LaurentPolynomial.T 1)))
    (π u : Lˣ) (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (hu : BruhatTits.normalizedOrder (K := L) u = 1) (n : ℤ) (x : WithConv (T →ₐ[L] L))
    (hx : TauCeti.MultiplicativeGroup.pointsMulEquiv
      (WithConv.toConv (x.ofConv.comp e.symm.toAlgEquiv.toAlgHom)) = π ^ n * u)
    (c : D.Y) (hc : cocharacterClass D c = Multiplicative.toAdd (torus D hT x)) :
    D.cocharacterEquiv c χ = n := by
  rw [torus_multiplicative D hT e χ hχ x c hc, hx, map_mul, map_zpow, hπ, hu]
  simp

-- Test KottwitzMap.torus_trivial
example (D : BruhatTits.AbsoluteRootData L (TauCeti.FiniteTypeCommHopfAlgCat.of L L))
    (hT : TauCeti.torusCommHopfAlgProperty L (TauCeti.FiniteTypeCommHopfAlgCat.of L L)) :
    torus D hT = 1 := sorry

/-- The Kottwitz homomorphism `κ_G : G(L) → π₁(G)_I` over a strictly henselian discretely valued
field. -/
def kottwitz {L : Type u} [Field L] [ValuativeRel L] [ValuativeRel.IsDiscrete L]
    [ValuativeRel.IsNontrivial L] [ValuativeRel.IsRankLeOne L] [HenselianLocalRing 𝒪[L]]
    [IsSepClosed 𝓀[L]]
    {G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L} (D : BruhatTits.AbsoluteRootData L G) :
    WithConv ((G : Type u) →ₐ[L] L) →*
      Multiplicative (BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D ⊤) :=
  sorry

variable {G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L} (D : BruhatTits.AbsoluteRootData L G)

/-- `κ_G` is onto (Kottwitz 1997, 7.4, pp. 297–298). -/
theorem kottwitz_surjective (hG : TauCeti.reductiveCommHopfAlgProperty L G) :
    Function.Surjective (kottwitz (L := L) D) := sorry

/-- Naturality (Kottwitz 1997, 7.4, pp. 297–298) for a homomorphism `G → G'` with coordinate map
`f` carrying the maximal torus of `D` into that of `D'`: the class of `κ_{G'}(f(x))` is the image
under `cocharacterMap` of any class representing `κ_G(x)`. -/
theorem kottwitz_natural {G' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D' : BruhatTits.AbsoluteRootData L G') (f : (G' : Type u) →ₐc[L] (G : Type u))
    (hf : TorusCompatible D D' f) (x : WithConv ((G : Type u) →ₐ[L] L)) (y : D.Y)
    (hy : cocharacterClass D y = Multiplicative.toAdd (kottwitz D x)) :
    Multiplicative.toAdd
        (kottwitz (L := L) D' (WithConv.toConv (x.ofConv.comp (f : (G' : Type u) →ₐ[L] (G : Type u))))) =
      cocharacterClass D' (cocharacterMap D D' f hf y) := sorry

theorem kottwitz_torus (hT : TauCeti.torusCommHopfAlgProperty L G) :
    kottwitz (L := L) D = torus (L := L) D hT := sorry

/-- Rational characters (Kottwitz 1997, (7.4.3)–(7.4.5), p. 298): for a character `h` of `G`
defined over `L` with restriction `χ` to the maximal torus, `⟨χ, y⟩ = ω(h(g))` for every class
`y` representing `κ_G(g)`. This fixes `κ_G` modulo the torsion of `π₁(G)_I`, including its sign. -/
theorem kottwitz_character (h : Additive (GroupLike L (G : Type u)))
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L]
      Ideal.Quotient.mk D.torusIdeal.toIdeal h.toMul.val)
    (g : WithConv ((G : Type u) →ₐ[L] L)) (y : D.Y)
    (hy : cocharacterClass D y = Multiplicative.toAdd (kottwitz D g)) :
    D.cocharacterEquiv y χ = Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L)
      (BruhatTits.GeometricRoots.ambientCharacterValue h g)) := sorry

/-- If `G_der` is simply connected, `κ_G` is read off from `κ_D` for the torus `D = G/G_der`
(Kottwitz 1997, 7.4; Pappas–Rapoport, §2.a.2, Step 3, p. 11). Here `q` is the coordinate map of
the quotient `G → D`, whose kernel is the derived subgroup, and a class `y` represents `κ_G(x)`
exactly when its image under `cocharacterMap` represents `κ_D(q(x))`. -/
theorem kottwitz_simplyConnected {Dtor : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (DD : BruhatTits.AbsoluteRootData L Dtor) (hDtor : TauCeti.torusCommHopfAlgProperty L Dtor)
    (q : (Dtor : Type u) →ₐc[L] (G : Type u))
    (hsc : ZExtension.DerivedSimplyConnected G) (hq : Function.Injective q)
    (hker : ∀ (R : Type u) [CommRing R] [Algebra L R] (g : WithConv (G →ₐ[L] R)),
      WithConv.toConv (g.ofConv.comp (q : Dtor →ₐ[L] G)) = (1 : WithConv (Dtor →ₐ[L] R)) ↔
        g ∈ BruhatTits.subgroupPoints (TauCeti.CommHopfAlgCat.derivedDefiningIdeal G) R)
    (x : WithConv ((G : Type u) →ₐ[L] L)) (y : D.Y) :
    cocharacterClass D y = Multiplicative.toAdd (kottwitz D x) ↔
      cocharacterClass DD (cocharacterMap D DD q (torusCompatible_of_torus D DD hDtor q) y) =
        Multiplicative.toAdd (torus (L := L) DD hDtor
          (WithConv.toConv (x.ofConv.comp (q : (Dtor : Type u) →ₐ[L] (G : Type u))))) :=
  sorry

/-- `κ_G` vanishes on the image of every homomorphism from a simply connected semisimple group
(coordinate map `f : G → Gsc`), since `π₁(G_sc) = 0`; in particular on the image of `G_sc(L)`. -/
theorem kottwitz_sc_image {Gsc : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (f : (G : Type u) →ₐc[L] (Gsc : Type u))
    (hss : TauCeti.semisimpleCommHopfAlgProperty L Gsc)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty L ⟨Gsc, hss⟩)
    (y : WithConv ((Gsc : Type u) →ₐ[L] L)) :
    kottwitz (L := L) D (WithConv.toConv (y.ofConv.comp (f : (G : Type u) →ₐ[L] (Gsc : Type u)))) = 1 :=
  sorry

/-- `G(L)_1 = ker κ_G`. -/
def kernel {G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} L}
    (D : BruhatTits.AbsoluteRootData L G) :
    Subgroup (WithConv ((G : Type u) →ₐ[L] L)) := (kottwitz (L := L) D).ker

-- Test KottwitzMap.kottwitz_gl_n
example (n : ℕ)
    (D : BruhatTits.AbsoluteRootData L (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra L n))
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L] Ideal.Quotient.mk D.torusIdeal.toIdeal
      (TauCeti.GeneralLinear.determinantGroupLike L n :
        TauCeti.GeneralLinear.coordinateHopfAlgebra L n))
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra L n →ₐ[L] L)) (y : D.Y)
    (hy : cocharacterClass D y = Multiplicative.toAdd (kottwitz D g)) :
    D.cocharacterEquiv y χ = Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L)
      (Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv n g))) := sorry

-- Test KottwitzMap.kernel_gl_n
example (n : ℕ)
    (D : BruhatTits.AbsoluteRootData L (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra L n))
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra L n →ₐ[L] L)) :
    g ∈ kernel D ↔ BruhatTits.normalizedOrder (K := L)
      (Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv n g)) = 1 := sorry

-- Test KottwitzMap.kottwitz_sl_n
example (n : ℕ)
    (D : BruhatTits.AbsoluteRootData L (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra L n)) :
    kottwitz (L := L) D = 1 := sorry

/- Check `kottwitz_pgl2`: the edge-swapping matrix has the nonzero Kottwitz class
in the order-two target of the scalar quotient of `GL₂`. -/
example (D : BruhatTits.AbsoluteRootData L G)
    (q : (G : Type u) →ₐc[L] TauCeti.GeneralLinear.coordinateHopfAlgebra L 2)
    (hq : Function.Injective q)
    (hker : ∀ (R : Type u) [CommRing R] [Algebra L R]
      (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra L 2 →ₐ[L] R)),
      WithConv.toConv (g.ofConv.comp q.toAlgHom) = (1 : WithConv (G →ₐ[L] R)) ↔
        ∃ a : Rˣ, TauCeti.GeneralLinear.pointsMulEquiv 2 g =
          Matrix.GeneralLinearGroup.scalar (Fin 2) a)
    (π : Lˣ) (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra L 2 →ₐ[L] L))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) L) =
      !![0, 1; (π : L), 0]) :
    ∃ e : inertiaCoinvariants D ⊤ ≃+ ZMod 2,
      e (Multiplicative.toAdd (kottwitz D (WithConv.toConv (g.ofConv.comp q.toAlgHom)))) = 1 :=
  sorry

/- Check `kottwitz_not_det_valuation`: scalar multiplication leaves the projective class
unchanged but adds twice the scalar's order to the determinant order. A uniformizer adds 2. -/
example (π : Lˣ) (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (g : Matrix.GeneralLinearGroup (Fin 2) L) :
    Matrix.ProjGenLinGroup.mk (Matrix.GeneralLinearGroup.scalar (Fin 2) π * g) =
      Matrix.ProjGenLinGroup.mk g ∧
    Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L)
      (Matrix.GeneralLinearGroup.det (Matrix.GeneralLinearGroup.scalar (Fin 2) π * g))) =
      Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L)
        (Matrix.GeneralLinearGroup.det g)) + 2 := sorry

-- Test KottwitzMap.kottwitz_trivial
/- For the trivial group `π₁ = 0` and `κ` is trivial. -/
example (D : BruhatTits.AbsoluteRootData L (TauCeti.FiniteTypeCommHopfAlgCat.of L L)) :
    kottwitz (L := L) D = 1 := sorry

-- Test KottwitzMap.kottwitz_gl_n_two_terms
/- The sign of `κ_G` on `GL_n`: classes representing `κ(g)` pair with `det` to `1` and `2` when
`ω(det g) = 1, 2`; the apartment translations of `diag(ϖ, 1, …)` have the opposite sign. -/
example (n : ℕ)
    (D : BruhatTits.AbsoluteRootData L (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra L n))
    (χ : BruhatTits.GeometricRoots.GeometricCharacter D.torusIdeal)
    (hχ : χ.toMul.val = (1 : AlgebraicClosure L) ⊗ₜ[L] Ideal.Quotient.mk D.torusIdeal.toIdeal
      (TauCeti.GeneralLinear.determinantGroupLike L n :
        TauCeti.GeneralLinear.coordinateHopfAlgebra L n))
    (g g' : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra L n →ₐ[L] L))
    (hg : BruhatTits.normalizedOrder (K := L)
      (Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv n g)) =
        Multiplicative.ofAdd 1)
    (hg' : BruhatTits.normalizedOrder (K := L)
      (Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv n g')) =
        Multiplicative.ofAdd 2)
    (y y' : D.Y) (hy : cocharacterClass D y = Multiplicative.toAdd (kottwitz D g))
    (hy' : cocharacterClass D y' = Multiplicative.toAdd (kottwitz D g')) :
    D.cocharacterEquiv y χ = 1 ∧ D.cocharacterEquiv y' χ = 2 := by
  have key : ∀ (x : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra L n →ₐ[L] L)) (c : D.Y),
      cocharacterClass D c = Multiplicative.toAdd (kottwitz D x) →
      D.cocharacterEquiv c χ = Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L)
        (Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv n x))) := by
    intro x c hc
    rw [kottwitz_character D (Additive.ofMul (TauCeti.GeneralLinear.determinantGroupLike L n))
      χ hχ x c hc]
    congr 2
    apply Units.ext
    change x.ofConv (TauCeti.GeneralLinear.determinantGroupLike L n :
      TauCeti.GeneralLinear.coordinateHopfAlgebra L n) = _
    rw [TauCeti.GeneralLinear.point_apply_determinantGroupLike,
      Matrix.GeneralLinearGroup.val_det_apply, TauCeti.GeneralLinear.pointsMulEquiv_apply]
  rw [key g y hy, key g' y' hy', hg, hg']
  exact ⟨rfl, rfl⟩

-- Test KottwitzMap.kernel_torus
/- For a torus, `G(L)_1` is the kernel of `κ_T`. -/
example (hT : TauCeti.torusCommHopfAlgProperty L G) : kernel D = (torus D hT).ker := by
  rw [kernel, kottwitz_torus D hT]

-- Test KottwitzMap.kernel_sl_n
/- For `SL_n`, `π₁ = 0` and `G(L)_1 = G(L)`. -/
example (n : ℕ) (D : BruhatTits.AbsoluteRootData L
      (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra L n)) :
    kernel D = ⊤ := sorry

namespace Examples

/-- The norm-one torus of `L' = L(a)`, `a² = ϖ`, has `X_*(T)_I = ℤ/2` and `κ_T` has image of order
two: the nontrivial element of `Gal(L'/L)` acts on `X_*(T) = ℤ` by `−1`, and `κ_T` is onto
(`torus_surjective`). Pappas–Rapoport, §3.b.1, (3.11)–(3.13), p. 14, compute `κ_T` as a parity in
equal characteristic different from two. The equation `a² = ϖ` forces `L'/L` to be ramified; the separable square-root family has `char L ≠ 2` (it is vacuous in characteristic two).
Every residue characteristic, including mixed characteristic two, occurs; the image order is a conclusion. -/
theorem normOne_ramified (L' : Type u) [Field L'] [Algebra L L']
    [FiniteDimensional L L'] [Algebra.IsSeparable L L'] (hd : Module.finrank L L' = 2)
    (π : Lˣ) (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (a : L') (ha : a ^ 2 = algebraMap L L' (π : L))
    (DT : BruhatTits.AbsoluteRootData L (NormTorus.coordinateHopf L L')) :
    Nonempty (BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants DT ⊤ ≃+ ZMod 2) ∧
      Nat.card (torus DT (NormTorus.coordinateHopf_isTorus L L')).range = 2 := sorry

-- Test KottwitzMap.Examples.normOne_ramified
example (L' : Type u) [Field L'] [Algebra L L'] [FiniteDimensional L L']
    [Algebra.IsSeparable L L'] (hd : Module.finrank L L' = 2) (π : Lˣ)
    (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (a : L') (ha : a ^ 2 = algebraMap L L' (π : L))
    (DT : BruhatTits.AbsoluteRootData L (NormTorus.coordinateHopf L L')) :
    Nonempty (BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants DT ⊤ ≃+ ZMod 2) :=
  (normOne_ramified L' hd π hπ a ha DT).1

-- Test KottwitzMap.torus_ramified_normOne
example (L' : Type u) [Field L'] [Algebra L L'] [FiniteDimensional L L']
    [Algebra.IsSeparable L L'] (hd : Module.finrank L L' = 2) (π : Lˣ)
    (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (a : L') (ha : a ^ 2 = algebraMap L L' (π : L))
    (DT : BruhatTits.AbsoluteRootData L (NormTorus.coordinateHopf L L')) :
    Nat.card (torus DT (NormTorus.coordinateHopf_isTorus L L')).range = 2 :=
  (normOne_ramified L' hd π hπ a ha DT).2

-- Test KottwitzMap.torus_ramified_normOne_residue_two
/- In mixed characteristic two, the ramified quadratic norm-one torus still has the parity
map: `κ(x/τ(x)) = ord_{L'}(x) mod 2`. In particular a uniformizer gives the nonzero class,
whereas every unit gives zero. This distinguishes the connected kernel from other subgroups
of index two in the bounded torus. The separable square-root family has `char L ≠ 2`. -/
example [PerfectField 𝓀[L]] (h2 : (2 : 𝓀[L]) = 0)
    (L' : Type u) [Field L'] [Algebra L L'] [FiniteDimensional L L']
    [Algebra.IsSeparable L L'] [ValuativeRel L'] [ValuativeExtension L L']
    [ValuativeRel.IsDiscrete L'] [ValuativeRel.IsNontrivial L'] [ValuativeRel.IsRankLeOne L']
    (hd : Module.finrank L L' = 2) (π : Lˣ)
    (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (a : L') (ha : a ^ 2 = algebraMap L L' (π : L))
    (τ : L' ≃ₐ[L] L') (hτ : τ ≠ AlgEquiv.refl)
    (DT : BruhatTits.AbsoluteRootData L (NormTorus.coordinateHopf L L')) :
    ∃ eI : BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants DT ⊤ ≃+ ZMod 2,
      ∀ (x : L'ˣ) (t : WithConv (NormTorus.coordinateHopf L L' →ₐ[L] L)),
        Algebra.TensorProduct.rid L L L'
          ((NormTorus.pointsEquiv L L' L t : (L' ⊗[L] L)ˣ) : L' ⊗[L] L) =
            (x : L') / τ (x : L') →
        eI (Multiplicative.toAdd (torus DT (NormTorus.coordinateHopf_isTorus L L') t)) =
          (Multiplicative.toAdd (BruhatTits.normalizedOrder (K := L') x) : ℤ) := sorry

-- Test KottwitzMap.Examples.normOne_minus_one_uniformizer
example (L' : Type u) [Field L'] [Algebra L L'] [FiniteDimensional L L']
    [Algebra.IsSeparable L L'] (hd : Module.finrank L L' = 2) (π : Lˣ)
    (hπ : BruhatTits.normalizedOrder (K := L) π = Multiplicative.ofAdd 1)
    (a : L') (ha : a ^ 2 = algebraMap L L' (π : L))
    (DT : BruhatTits.AbsoluteRootData L (NormTorus.coordinateHopf L L'))
    (t : WithConv (NormTorus.coordinateHopf L L' →ₐ[L] L))
    (ht : ((NormTorus.pointsEquiv L L' L t : (L' ⊗[L] L)ˣ) : L' ⊗[L] L) = -1) :
    torus DT (NormTorus.coordinateHopf_isTorus L L') t ≠ 1 := sorry

-- Test KottwitzMap.Examples.normOne_minus_one_unit
example (L' : Type u) [Field L'] [Algebra L L'] [FiniteDimensional L L']
    [Algebra.IsSeparable L L'] (hd : Module.finrank L L' = 2) (u : Lˣ)
    (hu : BruhatTits.normalizedOrder (K := L) u = 1)
    (a : L') (ha : a ^ 2 = algebraMap L L' (u : L)) (ha' : a ∉ Set.range (algebraMap L L'))
    (DT : BruhatTits.AbsoluteRootData L (NormTorus.coordinateHopf L L'))
    (t : WithConv (NormTorus.coordinateHopf L L' →ₐ[L] L))
    (ht : ((NormTorus.pointsEquiv L L' L t : (L' ⊗[L] L)ˣ) : L' ⊗[L] L) = -1) :
    torus DT (NormTorus.coordinateHopf_isTorus L L') t = 1 := sorry

end Examples

end KottwitzMap

/-! ## Layer RG2.2: Buildings and group action

Declarations of layer RG2.2 on the spine carriers `Building D φ`, `apartmentEmbedding` and the
`MulAction` of the rational points. The affine root hyperplanes of the apartment, the facets of the
apartment (RG2.1), the adjoint quotient, Levi and twisted-Levi subgroups and the Galois actions on
buildings over extensions are not in the pinned library; where a statement needs them they are
passed in as explicit data (a Hopf map `f : H' ⟶ H`, a transfer map of buildings, a permutation
action of a Galois group), and the conditions that the pinned libraries cannot express are named
in the docstrings. -/

/-! ### The building of `GL_n` through norms and lattice chains -/

namespace GLBuilding

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

open scoped Classical Pointwise Matrix

/-- The additive normalized valuation `ω : K → ℝ ∪ {∞}`, `ω(ϖ) = 1`: the additive, real-valued form
of `TauCeti.normalizedValuation`, extended by `ω(0) = ∞`. -/
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

/-- A splittable additive norm `α : Kⁿ → ℝ ∪ {∞}`: `α(t x) = α(x) + ω(t)`,
`α(x + y) ≥ min(α x, α y)`, `α(x) = ∞` iff `x = 0`, and some basis `e` splits `α`:
`α(Σ xᵢ eᵢ) = minᵢ (ω(xᵢ) + α(eᵢ))`. Over a local field every norm is splittable
(Bruhat–Tits, Bull. SMF 112 (1984), 1.4–1.5, pp. 263–264). -/
structure SplittableNorm (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) where
  /-- The norm. -/
  toFun : (Fin n → K) → WithTop ℝ
  map_smul : ∀ (t : K) (x : Fin n → K), toFun (t • x) = toFun x + ω K t
  min_le_map_add : ∀ x y, min (toFun x) (toFun y) ≤ toFun (x + y)
  map_eq_top_iff : ∀ x, toFun x = ⊤ ↔ x = 0
  splittable : ∃ e : Module.Basis (Fin n) K (Fin n → K), ∀ x,
    toFun x = ⨅ i, (toFun (e i) + ω K (e.repr x i))

/-- A graded periodic lattice chain: a nonempty set of `𝒪[K]`-lattices of `Kⁿ` totally ordered by
inclusion and stable under scaling by `K^×`, with a strictly decreasing grading `c` satisfying
`c(t Λ) = c(Λ) + ω(t)` (Bruhat–Tits, Bull. SMF 112 (1984), 1.7, pp. 266–267). -/
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

variable {n : ℕ}

/-- Splittable norms correspond to graded periodic lattice chains: `α` goes to its closed balls
`{α ≥ r}`, each graded by the least value of `α` on it (Bruhat–Tits, Bull. SMF 112 (1984), 1.8,
p. 267). -/
def normEquivChain [NeZero n] : SplittableNorm K n ≃ GradedLatticeChain K n := sorry

/-- The chain is exactly the family of closed balls of the norm. -/
theorem normEquivChain_chain [NeZero n] (α : SplittableNorm K n)
    (Λ : Submodule 𝒪[K] (Fin n → K)) :
    Λ ∈ (normEquivChain α).chain ↔
      ∃ r : ℝ, (Λ : Set (Fin n → K)) = {x | (r : WithTop ℝ) ≤ α.toFun x} := sorry

/-- The grading is the least norm value on a lattice. -/
theorem normEquivChain_grading [NeZero n] (α : SplittableNorm K n)
    (Λ : Submodule 𝒪[K] (Fin n → K)) (hΛ : Λ ∈ (normEquivChain α).chain) :
    ((normEquivChain α).grading Λ : WithTop ℝ) = sInf (α.toFun '' (Λ : Set (Fin n → K))) := sorry

/-- Dual norm for a perfect bilinear form, using finite values on nonzero vectors. -/
def dualNorm (ψ : LinearMap.BilinForm K (Fin n → K)) (hψ : ψ.Nondegenerate)
    (α : SplittableNorm K n) : SplittableNorm K n := sorry

/-- The infimum formula determines the dual norm, including its value at zero. -/
theorem dualNorm_apply (ψ : LinearMap.BilinForm K (Fin n → K)) (hψ : ψ.Nondegenerate)
    (α : SplittableNorm K n) (x : Fin n → K) :
    (dualNorm ψ hψ α).toFun x =
      ⨅ y : {y : Fin n → K // y ≠ 0},
        ω K (ψ x y.val) - ((α.toFun y.val).untopD 0 : WithTop ℝ) := sorry

/-- The symplectic norm model of the building of the group preserving ψ. -/
abbrev SymplecticNormBuilding (ψ : LinearMap.BilinForm K (Fin n → K))
    (hψ : ψ.Nondegenerate) := {α : SplittableNorm K n // dualNorm ψ hψ α = α}

/-- Integral lattice duality uses the valuation ring, not its maximal ideal. -/
def integralDual (ψ : LinearMap.BilinForm K (Fin n → K))
    (Λ : Submodule 𝒪[K] (Fin n → K)) : Submodule 𝒪[K] (Fin n → K) where
  carrier := {x | ∀ y ∈ Λ, (0 : WithTop ℝ) ≤ ω K (ψ x y)}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- Closed balls dualize to open balls with threshold −r−1. The shift is fixed by ω(ϖ)=1. -/
theorem dualNorm_closedBall (ψ : LinearMap.BilinForm K (Fin n → K)) (hψ : ψ.Nondegenerate)
    (α : SplittableNorm K n) (r : ℝ) (Λ : Submodule 𝒪[K] (Fin n → K))
    (hΛ : (Λ : Set (Fin n → K)) = {x | (r : WithTop ℝ) ≤ α.toFun x}) :
    (integralDual ψ Λ : Set (Fin n → K)) =
      {x | ((-r - 1 : ℝ) : WithTop ℝ) < (dualNorm ψ hψ α).toFun x} := sorry

/-- In the self-dual locus, the grade is the next attained value above −r−1. -/
theorem dualNorm_grade [NeZero n] (ψ : LinearMap.BilinForm K (Fin n → K))
    (hψ : ψ.Nondegenerate) (α : SymplecticNormBuilding ψ hψ) (r : ℝ)
    (Λ : Submodule 𝒪[K] (Fin n → K))
    (hΛ : (Λ : Set (Fin n → K)) = {x | (r : WithTop ℝ) ≤ α.val.toFun x}) :
    integralDual ψ Λ ∈ (normEquivChain α.val).chain ∧
    ((normEquivChain α.val).grading (integralDual ψ Λ) : WithTop ℝ) =
      sInf {t | t ∈ Set.range α.val.toFun ∧ ((-r - 1 : ℝ) : WithTop ℝ) < t} := sorry

/-- The standard alternating plane, ψ(e,f)=1. -/
def planeForm : LinearMap.BilinForm K (Fin 2 → K) :=
  Matrix.toBilin' !![0, 1; -1, 0]

theorem planeForm_nondegenerate : (planeForm (K := K)).Nondegenerate := sorry

/-- Apartment norm of the symplectic plane with weights (a,−a). -/
def planeNorm (a : ℝ) : SplittableNorm K 2 where
  toFun := fun x => min (ω K (x 0) + (a : WithTop ℝ)) (ω K (x 1) + ((-a : ℝ) : WithTop ℝ))
  map_smul := sorry
  min_le_map_add := sorry
  map_eq_top_iff := sorry
  splittable := sorry

theorem planeNorm_selfDual (a : ℝ) :
    dualNorm planeForm planeForm_nondegenerate (planeNorm (K := K) a) = planeNorm a := sorry

-- Test dualNorm_weighted_tenth
example : ∃ x : SymplecticNormBuilding (planeForm (K := K)) planeForm_nondegenerate,
    x.val = planeNorm (1 / 10) := ⟨⟨_, planeNorm_selfDual _⟩, rfl⟩

-- Test dualNorm_generic_interior
example (a : ℝ) (ha : 0 < a) (ha' : a < 1 / 2) :
    ∃ x : SymplecticNormBuilding (planeForm (K := K)) planeForm_nondegenerate,
      x.val = planeNorm a ∧ (x.val.toFun (Pi.single 0 1) = (a : WithTop ℝ)) ∧
        (x.val.toFun (Pi.single 1 1) = ((-a : ℝ) : WithTop ℝ)) := sorry

-- Test dualNorm_dual_lattices
example (π : K) (hπ : ω K π = 1) :
    let Λ₀ := Submodule.span 𝒪[K] ({Pi.single 0 1, Pi.single 1 1} : Set (Fin 2 → K))
    let Λ₁ := Submodule.span 𝒪[K] ({Pi.single 0 1, Pi.single 1 π} : Set (Fin 2 → K))
    let c := (normEquivChain (planeNorm (K := K) (1 / 10))).grading
    integralDual planeForm Λ₀ = Λ₀ ∧
    integralDual planeForm Λ₁ = Submodule.span 𝒪[K]
      ({Pi.single 0 π⁻¹, Pi.single 1 1} : Set (Fin 2 → K)) ∧
    c Λ₀ = -1 / 10 ∧ c Λ₁ = 1 / 10 ∧ c (integralDual planeForm Λ₁) = -9 / 10 ∧
    c Λ₀ + c (integralDual planeForm Λ₀) = -1 / 5 ∧
    c Λ₁ + c (integralDual planeForm Λ₁) = -4 / 5 := sorry

-- Test GLBuilding.norm_chain_standard_ball
example [NeZero n] (α : SplittableNorm K n)
    (hα : ∀ x, α.toFun x = ⨅ i, ω K (x i)) :
    Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin n))) ∈ (normEquivChain α).chain := sorry

-- Test GLBuilding.norm_chain_zero_rank
example : IsEmpty (GradedLatticeChain K 0) := by
  refine ⟨fun L => ?_⟩
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible 𝒪[K]
  have h0 : (ϖ : K) ≠ 0 := fun h => hϖ.ne_zero (Subtype.ext h)
  obtain ⟨Λ, hΛ⟩ := L.nonempty
  have h := L.grading_smul (Units.mk0 (ϖ : K) h0) Λ hΛ
  have hω : ω K (ϖ : K) = 1 := by
    simp only [ω, h0, TauCeti.normalizedValuation_irreducible hϖ, toAdd_ofAdd, dite_false]
    norm_num
  have hs : Submodule.span 𝒪[K] (((Units.mk0 (ϖ : K) h0 : Kˣ) : K) • (Λ : Set (Fin 0 → K))) = Λ :=
    Subsingleton.elim _ _
  rw [hs, Units.val_mk0, hω] at h
  have h' : L.grading Λ = L.grading Λ + 1 := by exact_mod_cast h
  linarith

-- Test GLBuilding.zero_module_grading (non-example)
/- The zero module carries exactly one norm, the constant `∞`, but no graded periodic lattice chain
(its only lattice is fixed by a uniformizer, so a grading would satisfy `c = c + 1`): the
equivalence `normEquivChain` fails for `n = 0`. -/
example : Nonempty (Unique (SplittableNorm K 0)) ∧
    IsEmpty (SplittableNorm K 0 ≃ GradedLatticeChain K 0) := by
  let α₀ : SplittableNorm K 0 :=
    { toFun := fun _ => ⊤
      map_smul := fun _ _ => by simp
      min_le_map_add := fun _ _ => le_top
      map_eq_top_iff := fun x => by simp [Subsingleton.elim x 0]
      splittable := ⟨Pi.basisFun K (Fin 0), fun _ => by simp⟩ }
  refine ⟨⟨{ default := α₀, uniq := fun α => ?_ }⟩, ⟨fun e => ?_⟩⟩
  · obtain ⟨f, h1, h2, h3, h4⟩ := α
    have : f = fun _ => ⊤ := funext fun x => (h3 x).2 (Subsingleton.elim x 0)
    subst this; rfl
  · have L := e α₀
    obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible 𝒪[K]
    have h0 : (ϖ : K) ≠ 0 := fun h => hϖ.ne_zero (Subtype.ext h)
    obtain ⟨Λ, hΛ⟩ := L.nonempty
    have h := L.grading_smul (Units.mk0 (ϖ : K) h0) Λ hΛ
    have hω : ω K (ϖ : K) = 1 := by
      simp only [ω, h0, TauCeti.normalizedValuation_irreducible hϖ, toAdd_ofAdd, dite_false]
      norm_num
    have hs : Submodule.span 𝒪[K] (((Units.mk0 (ϖ : K) h0 : Kˣ) : K) • (Λ : Set (Fin 0 → K))) = Λ :=
      Subsingleton.elim _ _
    rw [hs, Units.val_mk0, hω] at h
    have h' : L.grading Λ = L.grading Λ + 1 := by exact_mod_cast h
    linarith

-- Test GLBuilding.norm_chain_grading_two_terms
example (α : SplittableNorm K 1) (hα : ∀ x, α.toFun x = ω K (x 0))
    (π : K) (hπ : ω K π = 1) :
    (normEquivChain α).grading (Submodule.span 𝒪[K] {Pi.single 0 π}) = 1 ∧
      (normEquivChain α).grading (Submodule.span 𝒪[K] {Pi.single 0 (π ^ 2)}) = 2 := sorry

/-- `GL_n(K)` acts on splittable norms by `(g • α)(x) = α(g⁻¹ x)` (Bruhat–Tits, Bull. SMF 112
(1984), 1.9, p. 268). -/
instance : MulAction (Matrix.GeneralLinearGroup (Fin n) K) (SplittableNorm K n) := sorry

@[simp]
theorem smul_apply (g : Matrix.GeneralLinearGroup (Fin n) K) (α : SplittableNorm K n)
    (x : Fin n → K) : (g • α).toFun x = α.toFun (Matrix.mulVec (g⁻¹ : Matrix.GeneralLinearGroup (Fin n) K).1 x) :=
  sorry

-- Test GLBuilding.scalar_shift_two_terms
/- The scalar `ϖ·1` lowers every norm by `1` and `ϖ²·1` by `2`: `(ϖ·α)(x) = α(ϖ⁻¹x) = α(x) − 1`. -/
example (α : SplittableNorm K n) (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (g : Matrix.GeneralLinearGroup (Fin n) K) (hg : g.1 = Matrix.scalar (Fin n) (ϖ : K))
    (x : Fin n → K) :
    (g • α).toFun x + 1 = α.toFun x ∧ ((g ^ 2) • α).toFun x + 2 = α.toFun x := sorry

/-- The relative datum of the diagonal maximal split torus in the actual GL_n Hopf algebra.
BT I 10.2.1–10.2.3, pp. 234–236. Its split torus is the diagonal torus that Tau Ceti defines as
`TauCeti.GeneralLinear.diagonalTorusDefiningIdeal` (`standardData_torus` states this on points). -/
def standardData (n : ℕ) : BruhatTits.LocalRootData K
    (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n) := sorry

/-- The chosen torus is diagonal on every coefficient algebra, including nonreduced algebras. -/
theorem standardData_torus (n : ℕ) (R : Type u) [CommRing R] [Algebra K R]
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K n →ₐ[K] R)) :
    g ∈ BruhatTits.subgroupPoints (standardData (K := K) n).splitTorus R ↔
      ∀ i j, i ≠ j → (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) R) i j = 0 :=
  sorry

/-- The ordered off-diagonal matrix positions index the roots. -/
def standardRoots (n : ℕ) : (standardData (K := K) n).ι ≃
    {ij : Fin n × Fin n // ij.1 ≠ ij.2} := sorry

/-- Diagonal cocharacters identify the enlarged apartment's vector space with R^n. -/
def standardCoordinates (n : ℕ) : (standardData (K := K) n).V ≃ₗ[ℝ] (Fin n → ℝ) := sorry

theorem standard_root (n : ℕ) (a : (standardData (K := K) n).ι)
    (v : (standardData (K := K) n).V) :
    (standardData (K := K) n).Φ.root a v =
      standardCoordinates n v (standardRoots n a).val.1 -
        standardCoordinates n v (standardRoots n a).val.2 := sorry

theorem standard_coroot (n : ℕ) (a : (standardData (K := K) n).ι) :
    standardCoordinates n ((standardData (K := K) n).Φ.coroot a) =
      Pi.single (standardRoots n a).val.1 1 - Pi.single (standardRoots n a).val.2 1 := sorry

/-- The rational root subgroup consists of the elementary transvections. -/
theorem standard_rootSubgroup (n : ℕ) (a : (standardData (K := K) n).ι)
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K n →ₐ[K] K)) :
    g ∈ (standardData (K := K) n).rootDatum.U a ↔ ∃ c : K,
      (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) K) =
        1 + Matrix.single (standardRoots n a).val.1 (standardRoots n a).val.2 c := sorry

/-- Negative character valuation on the standard diagonal torus. -/
theorem standard_torusValuation (n : ℕ) (z : (standardData (K := K) n).rootDatum.T)
    (t : Fin n → Kˣ)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv n z.val : Matrix (Fin n) (Fin n) K) =
      Matrix.diagonal (fun i => (t i : K))) :
    standardCoordinates n (Multiplicative.toAdd (BruhatTits.torusValuationMap (standardData n) z)) =
      fun i => -((Multiplicative.toAdd (BruhatTits.normalizedOrder (K := K) (t i)) : ℤ) : ℝ) := sorry

-- Test GLBuilding.torus_two_terms
example (π : Kˣ) (hπ : BruhatTits.normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (z z' : (standardData (K := K) 2).rootDatum.T)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K), 1])
    (hz' : (TauCeti.GeneralLinear.pointsMulEquiv 2 z'.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![((π : K) ^ 2), 1]) :
    standardCoordinates 2 (Multiplicative.toAdd (BruhatTits.torusValuationMap (standardData 2) z)) = ![-1, 0] ∧
    standardCoordinates 2 (Multiplicative.toAdd (BruhatTits.torusValuationMap (standardData 2) z')) = ![-2, 0] := sorry

-- Test GLBuilding.torus_units
example (z : (standardData (K := K) 2).rootDatum.T) (t : Fin 2 → Kˣ)
    (ht : ∀ i, BruhatTits.normalizedOrder (K := K) (t i) = 1)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal (fun i => (t i : K))) : BruhatTits.torusValuationMap (standardData 2) z = 1 := sorry

-- Test GLBuilding.torus_scalar_not_zero
example (π : Kˣ) (hπ : BruhatTits.normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (z : (standardData (K := K) 2).rootDatum.T)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal (fun _ => (π : K))) : BruhatTits.torusValuationMap (standardData 2) z ≠ 1 := sorry

end GLBuilding

-- Own binders: a definition keeps only the section instances its statement or body uses.
/-- The standard valuation of a nonarchimedean local field: the normalized order of the
transvection parameter (`standardValuation_apply`). -/
def GLBuilding.standardValuation {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (n : ℕ) :
    BruhatTits.Valuation (GLBuilding.standardData (K := K) n).rootDatum := sorry

namespace GLBuilding

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

open scoped Classical Pointwise Matrix

variable {n : ℕ}

theorem standardValuation_apply (n : ℕ) (a : (standardData (K := K) n).ι)
    (g : (standardData (K := K) n).rootDatum.U a) :
    (standardValuation n).φ a g = ω K
      ((TauCeti.GeneralLinear.pointsMulEquiv n g.val : Matrix (Fin n) (Fin n) K)
        (standardRoots n a).val.1 (standardRoots n a).val.2) := sorry

theorem standardValuation_compatible (n : ℕ) :
    (standardValuation (K := K) n).IsCompatible (standardData n)
      (BruhatTits.torusValuationMap (standardData n)) := sorry

instance standardValuation_geometric (n : ℕ) :
    BruhatTits.GeometricValuation (standardData (K := K) n) (standardValuation n) :=
  { compatible := standardValuation_compatible n }

/-- The enlarged building of `GL_n` with its standard roots and valuation is the space of
splittable norms on `Kⁿ` (Bruhat–Tits, Bull. SMF 112 (1984), 2.11, p. 283; BT I §10.2, note added
in proof, pp. 238–239; BT II 4.2.16, p. 94). The map is pinned by `buildingEquiv_smul` and
`buildingEquiv_apartment`. -/
def buildingEquiv (n : ℕ) :
    BruhatTits.Building (standardData (K := K) n) (standardValuation n) ≃ SplittableNorm K n := sorry

theorem buildingEquiv_smul (n : ℕ)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n →ₐ[K] K))
    (x : BruhatTits.Building (standardData (K := K) n) (standardValuation n)) :
    buildingEquiv n (g • x) = TauCeti.GeneralLinear.pointsMulEquiv n g • buildingEquiv n x := sorry

/-- At displacement v the diagonal-basis norm has weights v_i. This fixes its central sign. -/
theorem buildingEquiv_apartment (n : ℕ) (x : BruhatTits.Apartment (standardValuation (K := K) n))
    (z : Fin n → K) :
    (buildingEquiv n (BruhatTits.apartmentEmbedding (standardData n) (standardValuation n) x)).toFun z =
      ⨅ i, ω K (z i) + (standardCoordinates n x.displacement i : WithTop ℝ) := sorry

-- Test GLBuilding.standard_GL2_roots
example : Nat.card (standardData (K := K) 2).ι = 2 ∧
    Module.finrank ℝ (standardData (K := K) 2).V = 2 := sorry

-- Test GLBuilding.standard_GL1_central_direction
example : IsEmpty (standardData (K := K) 1).ι ∧
    Module.finrank ℝ (standardData (K := K) 1).V = 1 := sorry

-- Test GLBuilding.standard_GL0
example : IsEmpty (standardData (K := K) 0).ι ∧
    Nonempty (BruhatTits.Building (standardData (K := K) 0) (standardValuation 0)) ∧
    Subsingleton (BruhatTits.Building (standardData (K := K) 0) (standardValuation 0)) := sorry

-- Test GLBuilding.standard_GL2_depths
example (a : (standardData (K := K) 2).ι)
    (g₁ g₂ : (standardData (K := K) 2).rootDatum.U a) (π : K)
    (hπ : ω K π = 1)
    (h₁ : (TauCeti.GeneralLinear.pointsMulEquiv 2 g₁.val : Matrix (Fin 2) (Fin 2) K)
      (standardRoots 2 a).val.1 (standardRoots 2 a).val.2 = π)
    (h₂ : (TauCeti.GeneralLinear.pointsMulEquiv 2 g₂.val : Matrix (Fin 2) (Fin 2) K)
      (standardRoots 2 a).val.1 (standardRoots 2 a).val.2 = π ^ 2) :
    (standardValuation 2).φ a g₁ = 1 ∧ (standardValuation 2).φ a g₂ = 2 := sorry

-- Test GLBuilding.standard_norm_weights
example (x : BruhatTits.Apartment (standardValuation (K := K) 2))
    (hx : standardCoordinates 2 x.displacement = ![0, 1]) :
    (buildingEquiv 2 (BruhatTits.apartmentEmbedding (standardData 2) (standardValuation 2) x)).toFun
      (Pi.single 0 1) = 0 ∧
    (buildingEquiv 2 (BruhatTits.apartmentEmbedding (standardData 2) (standardValuation 2) x)).toFun
      (Pi.single 1 1) = 1 := sorry

-- Test GLBuilding.buildingEquiv_torus_two_terms
/- `z = diag(ϖ, 1)` sends the standard point to the norm with values `−1` at `e₀` and `0` at `e₁`:
on norms `(z • α)(e₀) = α(ϖ⁻¹ e₀)`, and on the apartment `z` translates by `v(z) = (−1, 0)`. The
action `α ↦ α ∘ z` would give `+1` at `e₀`. -/
example (π : Kˣ) (hπ : BruhatTits.normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K), 1])
    (x : BruhatTits.Apartment (standardValuation (K := K) 2))
    (hx : standardCoordinates 2 x.displacement = 0) :
    (buildingEquiv 2
        (g • BruhatTits.apartmentEmbedding (standardData 2) (standardValuation 2) x)).toFun
        (Pi.single 0 1) = ((-1 : ℝ) : WithTop ℝ) ∧
      (buildingEquiv 2
        (g • BruhatTits.apartmentEmbedding (standardData 2) (standardValuation 2) x)).toFun
        (Pi.single 1 1) = 0 := sorry

-- Test GLBuilding.buildingEquiv_central_shift
/- Translating an apartment point by the central vector `t·(1, …, 1)` adds `t` to its norm. -/
example (x : BruhatTits.Apartment (standardValuation (K := K) n))
    (v : (standardData (K := K) n).V) (t : ℝ) (hv : standardCoordinates n v = fun _ => t)
    (z : Fin n → K) :
    (buildingEquiv n
        (BruhatTits.apartmentEmbedding (standardData n) (standardValuation n) (v +ᵥ x))).toFun z =
      (buildingEquiv n
        (BruhatTits.apartmentEmbedding (standardData n) (standardValuation n) x)).toFun z +
        (t : WithTop ℝ) := by
  have shift : ∀ f : Fin n → WithTop ℝ,
      ⨅ i, (f i + (t : WithTop ℝ)) = (⨅ i, f i) + (t : WithTop ℝ) := by
    intro f
    have key : ∀ y : WithTop ℝ,
        (OrderIso.withTopCongr (OrderIso.addRight t)) y = y + (t : WithTop ℝ) := by
      intro y
      cases y with
      | top => simp
      | coe a => simp [OrderIso.withTopCongr]
    rcases Nat.eq_zero_or_pos n with rfl | hn
    · simp
    · have : Nonempty (Fin n) := ⟨⟨0, hn⟩⟩
      simp_rw [← key]
      exact ((OrderIso.withTopCongr (OrderIso.addRight t)).map_ciInf
        (Set.finite_range f).bddBelow).symm
  rw [buildingEquiv_apartment, buildingEquiv_apartment, BruhatTits.Apartment.vadd_displacement,
    map_add, hv, ← shift]
  congr 1
  funext i
  simp only [Pi.add_apply, WithTop.coe_add]
  rw [add_comm (t : WithTop ℝ), ← add_assoc]

-- Test GLBuilding.buildingEquiv_GL1_line
/- `GL₁` has no roots, so its building is its apartment, a line: every norm on `K` is the image of
an apartment point. -/
example (α : SplittableNorm K 1) :
    ∃ x : BruhatTits.Apartment (standardValuation (K := K) 1),
      buildingEquiv 1 (BruhatTits.apartmentEmbedding (standardData 1) (standardValuation 1) x) =
        α := sorry

-- Test GLBuilding.standardValuation_F2 (non-example)
/- Over `𝔽₂` each root group of `GL₂` has two elements, while a valuation of a root datum takes at
least three values on every root group (axiom V0): the root datum of `GL₂(𝔽₂)` has no valuation,
and `standardValuation` is defined over a nonarchimedean local field only. -/
example : IsEmpty (BruhatTits.Valuation (standardData (K := ZMod 2) 2).rootDatum) := sorry

/-- The period of a chain: the number of homothety classes of lattices in it
(Bruhat–Tits, Bull. SMF 112 (1984), 1.7, p. 266). -/
def period (L : GradedLatticeChain K n) : ℕ := sorry

/-- The period counts the lattices of a determining segment `ϖΛ ⊊ Λ' ⊆ Λ` below any member `Λ`. -/
theorem period_eq_ncard (L : GradedLatticeChain K n) {Λ : Submodule 𝒪[K] (Fin n → K)}
    (hΛ : Λ ∈ L.chain) {ϖ : 𝒪[K]} (hϖ : Irreducible ϖ) :
    period L = Set.ncard {Λ' | Λ' ∈ L.chain ∧
      Submodule.span 𝒪[K] ((ϖ : K) • (Λ : Set (Fin n → K))) < Λ' ∧ Λ' ≤ Λ} := sorry

theorem one_le_period (L : GradedLatticeChain K n) : 1 ≤ period L := sorry

theorem period_le (L : GradedLatticeChain K n) : period L ≤ n := sorry

-- Test GLBuilding.period_standard
example [NeZero n] (α : SplittableNorm K n) (hα : ∀ x, α.toFun x = ⨅ i, ω K (x i)) :
    period (normEquivChain α) = 1 := sorry

-- Test GLBuilding.period_iwahori
/- The norm `min(ω(x₀), ω(x₁) + 1/2)` has the balls `O² ⊋ ϖO ⊕ O ⊋ ϖO²`: period `2 = n`. -/
example (α : SplittableNorm K 2)
    (hα : ∀ x, α.toFun x = min (ω K (x 0)) (ω K (x 1) + ((1 / 2 : ℝ) : WithTop ℝ))) :
    period (normEquivChain α) = 2 := sorry

-- Test GLBuilding.period_dim_one
example (L : GradedLatticeChain K 1) : period L = 1 :=
  le_antisymm (period_le L) (one_le_period L)

/-- The stabilizer of the point of a graded chain is the intersection of the stabilizers of its
lattices (Bruhat–Tits, Bull. SMF 112 (1984), 1.17(i) and 2.10, pp. 273–274 and 282–283;
KP18 §1.1.9, p. 130). -/
theorem stabilizer_eq [NeZero n] (L : GradedLatticeChain K n) :
    (MulAction.stabilizer (Matrix.GeneralLinearGroup (Fin n) K) (normEquivChain.symm L) :
      Set (Matrix.GeneralLinearGroup (Fin n) K)) =
      ⋂ Λ ∈ L.chain, {g | ∀ x, x ∈ Λ ↔ Matrix.mulVec g.1 x ∈ Λ} := sorry

-- Test GLBuilding.scalar_not_stabilizer (non-example)
/- The scalar `ϖ` maps every lattice *into* itself but stabilizes no norm: `α(ϖ x) = α(x) + 1`.
The stabilizer is therefore the set of `g` with `g Λ = Λ` for every `Λ` of the chain, not the set
with `g Λ ⊆ Λ`. -/
example (α : SplittableNorm K n) (t : K) (ht : ω K t ≠ 0) (x : Fin n → K) (hx : x ≠ 0) :
    α.toFun (t • x) ≠ α.toFun x := by
  rw [α.map_smul]
  intro h
  have hxt : α.toFun x ≠ ⊤ := fun h' => hx ((α.map_eq_top_iff x).1 h')
  obtain ⟨a, ha⟩ := WithTop.ne_top_iff_exists.1 hxt
  rw [← ha] at h
  cases hω : ω K t with
  | top => rw [hω] at h; simp at h
  | coe r =>
    rw [hω] at h ht
    have : a + r = a := by exact_mod_cast h
    exact ht (by norm_cast; linarith)

-- Test GLBuilding.dim_one
/- For `n = 1` every splittable norm is `x ↦ ω(x / x₀) + c`: the norm is determined by its value
at a nonzero vector. -/
example (α β : SplittableNorm K 1) (x₀ : Fin 1 → K) (hx₀ : x₀ ≠ 0)
    (h : α.toFun x₀ = β.toFun x₀) : α = β := by
  have h0 : x₀ 0 ≠ 0 := fun h0 => hx₀ (funext fun i => by rw [Subsingleton.elim i 0, h0]; rfl)
  have key : ∀ x : Fin 1 → K, x = (x 0 / x₀ 0) • x₀ := fun x => funext fun i => by
    rw [Subsingleton.elim i 0, Pi.smul_apply, smul_eq_mul, div_mul_cancel₀ _ h0]
  have hf : α.toFun = β.toFun := funext fun x => by
    rw [key x, α.map_smul, β.map_smul, h]
  cases α; cases β; cases hf; rfl

-- Test GLBuilding.standard_norm
/- The standard norm `min_i ω(x_i)` on `Kⁿ` has unit ball `𝒪[K]ⁿ`. -/
example (α : SplittableNorm K n) (hα : ∀ x : Fin n → K, α.toFun x = ⨅ i, ω K (x i)) :
    {x | (0 : WithTop ℝ) ≤ α.toFun x} =
      ((Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin n))) : Submodule 𝒪[K] (Fin n → K)) :
        Set (Fin n → K)) := sorry

-- Test GLBuilding.ball_isLattice
/- Every ball of a splittable norm is an `𝒪[K]`-lattice in Mathlib's sense. -/
example (α : SplittableNorm K n) (r : ℝ) :
    ∃ Λ : Submodule 𝒪[K] (Fin n → K),
      (Λ : Set (Fin n → K)) = {x | (r : WithTop ℝ) ≤ α.toFun x} ∧ Λ.IsLattice K := sorry

-- Test GLBuilding.not_grading
/- A function jumping by `2 ω(t)` under `t` is not a grading. -/
example [NeZero n] (L : GradedLatticeChain K n) (c : Submodule 𝒪[K] (Fin n → K) → ℝ)
    (hc : ∀ (t : Kˣ), ∀ Λ ∈ L.chain,
      (c (Submodule.span 𝒪[K] ((t : K) • (Λ : Set (Fin n → K)))) : WithTop ℝ) = c Λ + 2 * ω K t) :
    ¬ ∃ L' : GradedLatticeChain K n, L'.chain = L.chain ∧ L'.grading = c := by
  rintro ⟨L', hch, hgr⟩
  obtain ⟨ϖ, hϖ⟩ := IsDiscreteValuationRing.exists_irreducible 𝒪[K]
  have h0 : (ϖ : K) ≠ 0 := fun h => hϖ.ne_zero (Subtype.ext h)
  have ht : ω K ((Units.mk0 (ϖ : K) h0 : Kˣ) : K) = 1 := by
    simp only [ω, Units.val_mk0, h0, TauCeti.normalizedValuation_irreducible hϖ, toAdd_ofAdd,
      dite_false]
    norm_num
  obtain ⟨Λ, hΛ⟩ := L.nonempty
  have h1 := L'.grading_smul (Units.mk0 (ϖ : K) h0) Λ (hch ▸ hΛ)
  have h2 := hc (Units.mk0 (ϖ : K) h0) Λ hΛ
  rw [hgr] at h1
  rw [h1, ht, mul_one] at h2
  have h3 : ((c Λ + 1 : ℝ) : WithTop ℝ) = ((c Λ + 2 : ℝ) : WithTop ℝ) := by
    push_cast; exact h2
  have : c Λ + 1 = c Λ + 2 := WithTop.coe_injective h3
  linarith

end GLBuilding

/-! ### The Bruhat–Tits tree of `SL₂` -/

namespace BTTree

open ValuativeRel
open scoped Pointwise

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- Scaling of lattices in `K²` by `K^×`: `t • Λ = tΛ`, the pointwise action on submodules, which
preserves lattices (`Submodule.IsLattice.smul`). -/
instance instMulActionUnitsLattice : MulAction Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K} where
  smul t Λ := ⟨t • Λ.1, by have := Λ.2; exact Submodule.IsLattice.smul K Λ.1 t⟩
  one_smul Λ := Subtype.ext (one_smul Kˣ Λ.1)
  mul_smul s t Λ := Subtype.ext (mul_smul s t Λ.1)

/-- The vertices: homothety classes of `𝒪[K]`-lattices in `K²`. -/
def Vertex : Type u :=
  Quotient (α := {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})
    (MulAction.orbitRel Kˣ {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})

/-- Adjacency: representatives `Λ' ⊂ Λ` with `ϖ Λ ⊊ Λ' ⊊ Λ`. -/
def Adj (v w : Vertex K) : Prop :=
  ∃ (Λ Λ' : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K}) (ϖ : 𝒪[K]),
    Irreducible ϖ ∧ Quotient.mk _ Λ = v ∧ Quotient.mk _ Λ' = w ∧
      Submodule.span 𝒪[K] ((fun x : Fin 2 → K => (ϖ : K) • x) ''
        (Λ.1 : Set (Fin 2 → K))) < Λ'.1 ∧ Λ'.1 < Λ.1

/-- The Bruhat–Tits tree (Garrett, *Buildings and Classical Groups*, §§19.1–19.3, pp. 322–330,
for `n = 2`). -/
def tree : SimpleGraph (Vertex K) where
  Adj := Adj K
  symm := sorry
  loopless := sorry

theorem isTree : (tree K).IsTree := sorry

/-- For a representative `Λ` of a vertex and a uniformizer `ϖ`, the neighbours of `[Λ]` are the
classes of the lattices strictly between `ϖΛ` and `Λ`, that is, the lines of the plane `Λ / ϖΛ`
over `𝓀[K]` (`neighborEquiv_symm_apply`). -/
def neighborEquiv (Λ : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K}) (ϖ : 𝒪[K])
    (hϖ : Irreducible ϖ) :
    (tree K).neighborSet (Quotient.mk _ Λ) ≃
      {Λ' : Submodule 𝒪[K] (Fin 2 → K) //
        Submodule.span 𝒪[K] ((fun x : Fin 2 → K => (ϖ : K) • x) '' (Λ.1 : Set (Fin 2 → K))) < Λ' ∧
          Λ' < Λ.1} := sorry

/-- The neighbour attached to an intermediate lattice `Λ'` is its class `[Λ']`. -/
theorem neighborEquiv_symm_apply (Λ : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K})
    (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ)
    (Λ' : {Λ' : Submodule 𝒪[K] (Fin 2 → K) //
      Submodule.span 𝒪[K] ((fun x : Fin 2 → K => (ϖ : K) • x) '' (Λ.1 : Set (Fin 2 → K))) < Λ' ∧
        Λ' < Λ.1}) :
    ∃ h : Λ'.1.IsLattice K,
      ((neighborEquiv K Λ ϖ hϖ).symm Λ' : Vertex K) = Quotient.mk _ ⟨Λ'.1, h⟩ := sorry

/-- `GL₂(K)` acts on the vertices of the tree, by graph automorphisms (`adj_smul`). -/
def smul : Matrix.GeneralLinearGroup (Fin 2) K →* Equiv.Perm (Vertex K) := sorry

/-- The action is `g [Λ] = [gΛ]`. -/
theorem smul_mk (g : Matrix.GeneralLinearGroup (Fin 2) K)
    (Λ : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K}) :
    ∃ h : (Λ.1.map ((Matrix.toLin' g.1).restrictScalars 𝒪[K])).IsLattice K,
      smul K g (Quotient.mk _ Λ) =
        Quotient.mk _ ⟨Λ.1.map ((Matrix.toLin' g.1).restrictScalars 𝒪[K]), h⟩ := sorry

theorem adj_smul (g : Matrix.GeneralLinearGroup (Fin 2) K) (v w : Vertex K) :
    (tree K).Adj (smul K g v) (smul K g w) ↔ (tree K).Adj v w := sorry

end BTTree

-- Own binders: a definition keeps only the section instances its statement or body uses.
/-- The type of a vertex, `ω(det Λ) mod 2`, for the normalized valuation `ω` of a nonarchimedean
local field (`type_mk`). -/
def BTTree.type (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] : BTTree.Vertex K → ZMod 2 := sorry

namespace BTTree

open ValuativeRel
open scoped Pointwise

variable (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]

/-- The class of the lattice spanned by the columns of `g` has type `ω(det g) mod 2`. -/
theorem type_mk (g : Matrix.GeneralLinearGroup (Fin 2) K)
    (h : (Submodule.span 𝒪[K] (Set.range fun j => fun i => g.1 i j)).IsLattice K) :
    type K (Quotient.mk _ ⟨Submodule.span 𝒪[K] (Set.range fun j => fun i => g.1 i j), h⟩) =
      ((Multiplicative.toAdd (TauCeti.normalizedValuation K
        (Matrix.GeneralLinearGroup.det g)) : ℤ) : ZMod 2) := sorry

theorem type_smul (g : Matrix.GeneralLinearGroup (Fin 2) K) (v : Vertex K) :
    type K (smul K g v) =
      type K v + ((Multiplicative.toAdd (TauCeti.normalizedValuation K
        (Matrix.GeneralLinearGroup.det g)) : ℤ) : ZMod 2) := sorry

/-- `SL₂(K)` preserves types, hence acts without inversion (adjacent vertices have different
types). -/
theorem sl2_preserves_type (g : Matrix.SpecialLinearGroup (Fin 2) K) (v : Vertex K) :
    type K (smul K (Matrix.SpecialLinearGroup.toGL g) v) = type K v := sorry

-- Test BTTree.degree_residue_card
/- Over a local field with residue field of order `q`, every vertex has degree `q + 1`. -/
example (v : Vertex K) : Nat.card ((tree K).neighborSet v) = Nat.card 𝓀[K] + 1 := sorry

-- Test BTTree.adj_standard
/- The standard lattice `𝒪²` and `𝒪 ⊕ ϖ𝒪` are adjacent. -/
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (Λ₀ Λ₁ : Submodule 𝒪[K] (Fin 2 → K))
    (h₀ : Λ₀ = Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin 2))))
    (h₁ : Λ₁ = Submodule.span 𝒪[K] {Pi.single 0 1, Pi.single 1 (ϖ : K)})
    (hL₀ : Λ₀.IsLattice K) (hL₁ : Λ₁.IsLattice K) :
    (tree K).Adj (Quotient.mk _ ⟨Λ₀, hL₀⟩) (Quotient.mk _ ⟨Λ₁, hL₁⟩) := sorry

-- Test BTTree.adj_type_ne
/- Adjacent vertices have different types: the index of `Λ'` in `Λ` is `q`, so the determinant
valuation changes by `1`. -/
example (v w : Vertex K) (h : (tree K).Adj v w) : type K v ≠ type K w := sorry

-- Test BTTree.pgl2_inversion (non-example)
/- `g = (0 1; ϖ 0)` swaps `[𝒪²]` and `[𝒪 ⊕ ϖ𝒪]`: it inverts an edge and does not preserve
types. -/
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (Λ₀ Λ₁ : Submodule 𝒪[K] (Fin 2 → K))
    (h₀ : Λ₀ = Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin 2))))
    (h₁ : Λ₁ = Submodule.span 𝒪[K] {Pi.single 0 1, Pi.single 1 (ϖ : K)})
    (hL₀ : Λ₀.IsLattice K) (hL₁ : Λ₁.IsLattice K)
    (g : Matrix.GeneralLinearGroup (Fin 2) K) (hg : g.1 = !![0, 1; (ϖ : K), 0]) :
    smul K g (Quotient.mk _ ⟨Λ₀, hL₀⟩) = Quotient.mk _ ⟨Λ₁, hL₁⟩ ∧
      smul K g (Quotient.mk _ ⟨Λ₁, hL₁⟩) = Quotient.mk _ ⟨Λ₀, hL₀⟩ ∧
      type K (smul K g (Quotient.mk _ ⟨Λ₀, hL₀⟩)) ≠ type K (Quotient.mk _ ⟨Λ₀, hL₀⟩) := sorry

-- Test BTTree.no_leaves
/- The tree has no leaves: every star is `ℙ¹(𝓀[K])`, which is nonempty. -/
example (v : Vertex K) : ((tree K).neighborSet v).Nonempty := sorry

-- Test BTTree.adj_distance_two (non-example)
/- `[𝒪²]` and `[𝒪 ⊕ ϖ²𝒪]` are not adjacent (they are at distance two, through `[𝒪 ⊕ ϖ𝒪]`): no
rescaling of `𝒪 ⊕ ϖ²𝒪` lies strictly between `ϖ𝒪²` and `𝒪²`. -/
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (Λ₀ Λ₂ : Submodule 𝒪[K] (Fin 2 → K))
    (h₀ : Λ₀ = Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin 2))))
    (h₂ : Λ₂ = Submodule.span 𝒪[K] {Pi.single 0 1, Pi.single 1 ((ϖ : K) ^ 2)})
    (hL₀ : Λ₀.IsLattice K) (hL₂ : Λ₂.IsLattice K) :
    ¬ Adj K (Quotient.mk _ ⟨Λ₀, hL₀⟩) (Quotient.mk _ ⟨Λ₂, hL₂⟩) := sorry

-- Test BTTree.neighborEquiv_standard
/- For the representative `𝒪²`, the neighbour `[𝒪 ⊕ ϖ𝒪]` corresponds to the lattice `𝒪 ⊕ ϖ𝒪`
itself, not to another member of its class. -/
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (Λ₀ Λ₁ : Submodule 𝒪[K] (Fin 2 → K))
    (h₀ : Λ₀ = Submodule.span 𝒪[K] (Set.range (Pi.basisFun K (Fin 2))))
    (h₁ : Λ₁ = Submodule.span 𝒪[K] {Pi.single 0 1, Pi.single 1 (ϖ : K)})
    (hL₀ : Λ₀.IsLattice K) (hL₁ : Λ₁.IsLattice K)
    (hadj : (tree K).Adj (Quotient.mk _ ⟨Λ₀, hL₀⟩) (Quotient.mk _ ⟨Λ₁, hL₁⟩)) :
    (neighborEquiv K ⟨Λ₀, hL₀⟩ ϖ hϖ ⟨_, hadj⟩).1 = Λ₁ := sorry

-- Test BTTree.neighborEquiv_rescaled
/- The bijection depends on the representative: if the neighbour `[Λ']` of `[Λ]` corresponds to
`Λ'` for the representative `Λ`, it corresponds to `ϖΛ'` for the representative `ϖΛ`. -/
example (Λ Λ' : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K}) (ϖ : 𝒪[K])
    (hϖ : Irreducible ϖ) (h0 : (ϖ : K) ≠ 0)
    (hadj : (tree K).Adj (Quotient.mk _ Λ) (Quotient.mk _ Λ'))
    (hadj' : (tree K).Adj (Quotient.mk _ (Units.mk0 (ϖ : K) h0 • Λ)) (Quotient.mk _ Λ'))
    (hΛ' : (neighborEquiv K Λ ϖ hϖ ⟨_, hadj⟩).1 = Λ'.1) :
    (neighborEquiv K (Units.mk0 (ϖ : K) h0 • Λ) ϖ hϖ ⟨_, hadj'⟩).1 =
      Units.mk0 (ϖ : K) h0 • Λ'.1 := sorry

-- Test BTTree.neighborEquiv_lines
/- The lattices strictly between `ϖΛ` and `Λ` are the preimages of the `q + 1` lines of the plane
`Λ / ϖΛ` over `𝓀[K]`; through `neighborEquiv` they count the neighbours of `[Λ]`. -/
example (Λ : {Λ : Submodule 𝒪[K] (Fin 2 → K) // Λ.IsLattice K}) (ϖ : 𝒪[K])
    (hϖ : Irreducible ϖ) :
    Nat.card {Λ' : Submodule 𝒪[K] (Fin 2 → K) //
        Submodule.span 𝒪[K] ((fun x : Fin 2 → K => (ϖ : K) • x) '' (Λ.1 : Set (Fin 2 → K))) < Λ' ∧
          Λ' < Λ.1} = Nat.card 𝓀[K] + 1 ∧
      Nat.card ((tree K).neighborSet (Quotient.mk _ Λ)) = Nat.card 𝓀[K] + 1 := by
  have h : Nat.card {Λ' : Submodule 𝒪[K] (Fin 2 → K) //
      Submodule.span 𝒪[K] ((fun x : Fin 2 → K => (ϖ : K) • x) '' (Λ.1 : Set (Fin 2 → K))) < Λ' ∧
        Λ' < Λ.1} = Nat.card 𝓀[K] + 1 := sorry
  exact ⟨h, (Nat.card_congr (neighborEquiv K Λ ϖ hϖ)).trans h⟩

-- Test BTTree.smul_scalar
/- Scalar matrices fix every vertex: `GL₂(K)` acts through `PGL₂(K)`. -/
example (g : Matrix.GeneralLinearGroup (Fin 2) K) (t : K) (hg : g.1 = Matrix.scalar (Fin 2) t)
    (v : Vertex K) : smul K g v = v := sorry

end BTTree

-- Test BTTree.degree_Q2
/- For `ℚ_2` the residue field is `𝔽_2`, so every vertex has degree `3`. -/
example (v : BTTree.Vertex ℚ_[2]) : Nat.card ((BTTree.tree ℚ_[2]).neighborSet v) = 3 := sorry

/-- `SL₂(K)` acts on the vertices of the tree through `BTTree.smul` and `SL₂(K) ⊆ GL₂(K)`. -/
instance BTTree.instMulActionSpecialLinearGroup (K : Type u) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    MulAction (Matrix.SpecialLinearGroup (Fin 2) K) (BTTree.Vertex K) :=
  MulAction.compHom (BTTree.Vertex K) ((BTTree.smul K).comp Matrix.SpecialLinearGroup.toGL)

/-- Ihara's theorem: `SL₂(K)` is the amalgam `K₀ *_I K₁` of the stabilizers of two adjacent
vertices along their intersection, the Iwahori subgroup. Stated with Mathlib's `Monoid.PushoutI`
over the index type `Bool`. Serre, *Arbres, amalgames, SL₂* (Astérisque 46), Ch. II §1.4, Thm. 3
and Cor. 1, p. 110. -/
theorem BTTree.ihara (K : Type u) [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] (v₀ v₁ : BTTree.Vertex K) (hadj : (BTTree.tree K).Adj v₀ v₁) :
    let K₀ := MulAction.stabilizer (Matrix.SpecialLinearGroup (Fin 2) K) v₀
    let K₁ := MulAction.stabilizer (Matrix.SpecialLinearGroup (Fin 2) K) v₁
    let φ : ∀ b : Bool, ↥(K₀ ⊓ K₁) →* ↥(bif b then K₁ else K₀) := fun b =>
      Subgroup.inclusion (Bool.rec (motive := fun b => K₀ ⊓ K₁ ≤ bif b then K₁ else K₀)
        inf_le_left inf_le_right b)
    ∃ e : Monoid.PushoutI φ ≃* Matrix.SpecialLinearGroup (Fin 2) K,
      ∀ (b : Bool) (x : ↥(bif b then K₁ else K₀)), e (Monoid.PushoutI.of (φ := φ) b x) = x := sorry

/-! ### The building and its apartments -/

namespace BruhatTits

open ValuativeRel
open scoped Pointwise

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

namespace Building

/-- The map on rational points induced by a Hopf map `f : H' ⟶ H`: the library's
`TauCeti.AlgHom.mapDomain` (pre-composition, `TauCeti/Algebra/AlgebraicGroup/Hopf/Map.lean`) of
the bialgebra map underlying a morphism of `FiniteTypeCommHopfAlgCat`. -/
abbrev pointsMap {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) :
    WithConv (H →ₐ[K] K) →* WithConv (H' →ₐ[K] K) :=
  TauCeti.AlgHom.mapDomain (f.hom.hom : (H' : Type u) →ₐc[K] H)

-- Test BruhatTits.Building.pointsMap_id
/- The identity Hopf map induces the identity on points. -/
example (g : WithConv (H →ₐ[K] K)) : pointsMap (𝟙 H) g = g := rfl

/-- A central epimorphism onto a reductive group, tested scheme-theoretically on all algebras: for
`f : H' ⟶ H`, the group morphism `α : G → G'` it defines. Injectivity of the coordinate Hopf map is
equivalent to faithful flatness of `α` over the field (Bruhat–Tits II, 4.2.15, pp. 93–94). -/
structure CentralSurjection {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) : Prop where
  target_reductive : TauCeti.reductiveCommHopfAlgProperty K H'
  injective : Function.Injective f.hom.hom
  central : ∀ (R : Type u) [CommRing R] [Algebra K R]
    (z g : WithConv (H →ₐ[K] R)),
    WithConv.toConv (z.ofConv.comp (f.hom.hom : H' →ₐc[K] H).toAlgHom) =
      (1 : WithConv (H' →ₐ[K] R)) → Commute z g

/-- The image torus `α(S)`, a maximal split torus of `G'`, and its relative datum
(Bruhat–Tits II, 4.2.15, p. 93). -/
def centralData (D : LocalRootData K H)
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f) :
    LocalRootData K H' := sorry

theorem centralData_torus (D : LocalRootData K H)
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f) (a : H') :
    a ∈ (centralData D f hf).splitTorus.toIdeal ↔ f.hom.hom a ∈ D.splitTorus.toIdeal := sorry

/-- The roots correspond by pullback, Bruhat–Tits II, 4.2.15, p. 93. -/
def centralRoots (D : LocalRootData K H)
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f) :
    (centralData D f hf).ι ≃ D.ι := sorry

/-- The root-group isomorphism is the restriction of the group morphism. -/
def centralRootPoints (D : LocalRootData K H)
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f)
    (a : (centralData D f hf).ι) :
    D.rootDatum.U (centralRoots D f hf a) ≃* (centralData D f hf).rootDatum.U a := sorry

theorem centralRootPoints_val (D : LocalRootData K H)
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f)
    (a : (centralData D f hf).ι) (g : D.rootDatum.U (centralRoots D f hf a)) :
    (centralRootPoints D f hf a g).val = pointsMap f g.val := sorry

/-- The valuation `φ' = φ ∘ α⁻¹` transported through the root-group isomorphisms
(Bruhat–Tits II, 4.2.15, pp. 93–94). -/
def centralValuation (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f) :
    Valuation (centralData D f hf).rootDatum := sorry

theorem centralValuation_apply (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f)
    (a : (centralData D f hf).ι) (g : (centralData D f hf).rootDatum.U a) :
    (centralValuation D φ f hf).φ a g = φ.φ (centralRoots D f hf a)
      ((centralRootPoints D f hf a).symm g) := sorry

instance centralValuation_geometric
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f) :
    GeometricValuation (centralData D f hf) (centralValuation D φ f hf) := by sorry

/-- A `K`-Levi subgroup containing the chosen maximal split torus `S`: the centralizer of a split
subtorus of `S` (the Hopf-ideal inclusion `D.splitTorus ≤ subtorus` says that the subtorus lies
in `S`). -/
structure LeviDatum (D : LocalRootData K H) where
  subtorus : TauCeti.HopfIdeal K H
  split : TauCeti.splitTorusCommHopfAlgProperty K
    (TauCeti.FiniteTypeCommHopfAlgCat.quotient H subtorus)
  contained : D.splitTorus ≤ subtorus

abbrev LeviDatum.group {D : LocalRootData K H} (M : LeviDatum D) :=
  TauCeti.FiniteTypeCommHopfAlgCat.quotient H (GeometricRoots.centralizerIdeal M.subtorus)

/-- The inclusion is the quotient of coordinate Hopf algebras. -/
def LeviDatum.inclusion {D : LocalRootData K H} (M : LeviDatum D) : H ⟶ M.group := sorry

theorem LeviDatum.inclusion_apply {D : LocalRootData K H} (M : LeviDatum D) (a : H) :
    M.inclusion.hom.hom a = Ideal.Quotient.mk (GeometricRoots.centralizerIdeal M.subtorus).toIdeal a := sorry

/-- `S` remains a maximal split torus of its Levi. -/
def LeviDatum.data {D : LocalRootData K H} (M : LeviDatum D) : LocalRootData K M.group := sorry

theorem LeviDatum.data_torus {D : LocalRootData K H} (M : LeviDatum D)
    (R : Type u) [CommRing R] [Algebra K R] (g : WithConv (M.group →ₐ[K] R)) :
    g ∈ subgroupPoints M.data.splitTorus R ↔
      WithConv.toConv (g.ofConv.comp M.inclusion.hom.hom.toAlgHom) ∈ subgroupPoints D.splitTorus R := sorry

/-- The Levi roots are precisely the roots trivial on the centralizing subtorus. -/
def LeviDatum.roots {D : LocalRootData K H} (M : LeviDatum D) : M.data.ι ↪ D.ι := sorry

theorem LeviDatum.rootPoints {D : LocalRootData K H} (M : LeviDatum D) (a : M.data.ι) :
    (M.data.rootDatum.U a).map (pointsMap M.inclusion) = D.rootDatum.U (M.roots a) := sorry

/-- The restriction of `φ` to the roots of the Levi (Bruhat–Tits I, 7.6.3, p. 184). -/
def LeviDatum.valuation {D : LocalRootData K H} (M : LeviDatum D) (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    Valuation M.data.rootDatum := sorry

theorem LeviDatum.valuation_apply {D : LocalRootData K H} (M : LeviDatum D)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (a : M.data.ι) (g : M.data.rootDatum.U a)
    (h : pointsMap M.inclusion g.val ∈ D.rootDatum.U (M.roots a)) :
    (M.valuation φ).φ a g = φ.φ (M.roots a) ⟨pointsMap M.inclusion g.val, h⟩ := sorry

instance LeviDatum.valuation_geometric {D : LocalRootData K H} (M : LeviDatum D)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    GeometricValuation M.data (M.valuation φ) := by sorry

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]

/-- The class `[g, x]` of `(g, x) ∈ G(K) × A`. -/
def mk (g : WithConv (H →ₐ[K] K)) (x : Apartment φ) : Building D φ := g • apartmentEmbedding D φ x

/-- The action `x ↦ g • x`, with the datum `(D, φ)` explicit. -/
abbrev translate (g : WithConv (H →ₐ[K] K)) (x : Building D φ) : Building D φ := g • x

/-- The gluing relation (Bruhat–Tits I, 7.4.1, p. 170): `[g, x] = [h, y]` iff some `n ∈ N(K)`
carries `x` to `y` and `g⁻¹ h n ∈ P_x`, where `P_x` is generated by
`N(K)_x = {m ∈ N(K) | ν(m) x = x}` and the root subgroups `U_{a,x} = U_{a,-a(x)}`. -/
theorem mk_eq_mk_iff (g h : WithConv (H →ₐ[K] K)) (x y : Apartment φ) :
    mk D φ g x = mk D φ h y ↔ ∃ (n : WithConv (H →ₐ[K] K)) (hn : n ∈ D.normalizer),
      Apartment.rationalAction D φ ⟨n, hn⟩ x = y ∧
        g⁻¹ * h * n ∈ Subgroup.closure
          ({m | ∃ hm : m ∈ D.normalizer, Apartment.rationalAction D φ ⟨m, hm⟩ x = x} ∪
            ⋃ i, (Apartment.filtrationAt φ x i 0 : Set (WithConv (H →ₐ[K] K)))) :=
  sorry

@[simp]
theorem smul_mk (g h : WithConv (H →ₐ[K] K)) (x : Apartment φ) :
    g • mk D φ h x = mk D φ (g * h) x := by
  simp [mk, mul_smul]

/-- The fixer of a point of the standard apartment is `P_x`, generated by `N(K)_x` and the
`U_{a,x}` (Bruhat–Tits I, 7.4.4, p. 172). -/
theorem stabilizer_apartmentEmbedding (x : Apartment φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) (apartmentEmbedding D φ x) =
      Subgroup.closure
        ({m | ∃ hm : m ∈ D.normalizer, Apartment.rationalAction D φ ⟨m, hm⟩ x = x} ∪
          ⋃ i, (Apartment.filtrationAt φ x i 0 : Set (WithConv (H →ₐ[K] K)))) :=
  sorry

theorem apartmentEmbedding_injective : Function.Injective (apartmentEmbedding D φ) := sorry

/-- The enlarged action of `N(K)` on the apartment is the restriction of the group action
(Bruhat–Tits I, 7.4.2, p. 171). -/
theorem normalizer_smul_apartmentEmbedding
    (n : WithConv (H →ₐ[K] K)) (hn : n ∈ D.normalizer) (x : Apartment φ) :
    n • apartmentEmbedding D φ x =
      apartmentEmbedding D φ (Apartment.rationalAction D φ ⟨n, hn⟩ x) := sorry

theorem exists_smul_apartmentEmbedding (p : Building D φ) :
    ∃ (g : WithConv (H →ₐ[K] K)) (x : Apartment φ), p = g • apartmentEmbedding D φ x := sorry

-- Test BruhatTits.Building.rankZero
/- With no roots every point lies in the apartment. -/
example [IsEmpty D.ι] : Function.Surjective (apartmentEmbedding D φ) := sorry

-- Test BruhatTits.Building.gl1_translation
/- For `GL₁` (no roots, one central direction) a uniformizer translates the apartment by `-1` and its
square by `-2`, so the building is the line, not the one-point reduced building. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 1 g : Matrix (Fin 1) (Fin 1) K) =
      Matrix.diagonal (fun _ => (π : K)))
    (v w : (GLBuilding.standardData (K := K) 1).V)
    (hv : GLBuilding.standardCoordinates 1 v = ![-1])
    (hw : GLBuilding.standardCoordinates 1 w = ![-2])
    (x : Apartment (GLBuilding.standardValuation (K := K) 1)) :
    g • apartmentEmbedding (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) x =
        apartmentEmbedding (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) (v +ᵥ x) ∧
      (g * g) • apartmentEmbedding (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) x =
        apartmentEmbedding (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) (w +ᵥ x) :=
  sorry

-- Test BruhatTits.Building.not_product
/- The quotient map `G(K) × A → B` is not injective as soon as there is a root. -/
example [Nonempty D.ι] :
    ¬ Function.Injective fun p : WithConv (H →ₐ[K] K) × Apartment φ => mk D φ p.1 p.2 := sorry

/-- Any two points lie in a common apartment `g • j(A)` (Bruhat–Tits I, 7.4.18, pp. 174–175). -/
theorem exists_apartment_mem_mem (p q : Building D φ) :
    ∃ (g : WithConv (H →ₐ[K] K)) (x y : Apartment φ),
      p = g • apartmentEmbedding D φ x ∧ q = g • apartmentEmbedding D φ y := sorry

/-- The stabilizer of the standard apartment is `N(K)` (Bruhat–Tits I, 7.4.10, p. 173). -/
theorem stabilizer_apartment :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) (Set.range (apartmentEmbedding D φ)) =
      D.normalizer := sorry

/-- The action is by isometries (Bruhat–Tits I, 7.4.20 (i), p. 175). -/
theorem isometry_smul (g : WithConv (H →ₐ[K] K)) : Isometry fun p : Building D φ => g • p := sorry

/-- The metric is Euclidean on the standard apartment: for a positive definite symmetric bilinear
form `B` on `V` (Weyl-invariant, by `isometry_smul` and `normalizer_smul_apartmentEmbedding`),
`d(j x, j y)² = B(x - y, x - y)` (Bruhat–Tits I, 7.4.20 (i), p. 175; Bruhat–Tits II, 4.2.12 and
4.2.16, pp. 92 and 94). The form `B` is the scalar product chosen with the metric; it is not
determined by the group (for `GL₁` it is any positive multiple of `t²`). -/
theorem dist_apartmentEmbedding :
    ∃ B : LinearMap.BilinForm ℝ D.V, (∀ v w, B v w = B w v) ∧ (∀ v, v ≠ 0 → 0 < B v v) ∧
      ∀ x y : Apartment φ, dist (apartmentEmbedding D φ x) (apartmentEmbedding D φ y) ^ 2 =
        B (x -ᵥ y) (x -ᵥ y) := sorry

-- Test BruhatTits.Building.gl1_dist
/- For `GL₁` the building is the line `j(A)`, with a positive multiple of the absolute value of the
coordinate as its metric; the multiple is the choice of scalar product, which no statement here
pins. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    ∃ c : ℝ, 0 < c ∧ ∀ x y : Apartment (GLBuilding.standardValuation (K := K) 1),
      dist (apartmentEmbedding (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) x)
          (apartmentEmbedding (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y) =
        c * |GLBuilding.standardCoordinates 1 (x -ᵥ y) 0| := sorry

-- Test BruhatTits.Building.gl1_dist_two_terms
/- Two terms: a uniformizer moves every point of the `GL₁` building by the same distance `d > 0`,
and its square by `2 d`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 1 g : Matrix (Fin 1) (Fin 1) K) =
      Matrix.diagonal (fun _ => (π : K)))
    (p q : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1)) :
    0 < dist (g • p) p ∧ dist (g • q) q = dist (g • p) p ∧
      dist ((g * g) • p) p = 2 * dist (g • p) p := sorry

/-- For a discrete valuation the building is complete (Bruhat–Tits I, 7.5.1, p. 180, and 2.5.12,
p. 45). -/
theorem completeSpace (hφ : φ.IsDiscrete) : CompleteSpace (Building D φ) := sorry

/-- The Bruhat–Tits negative-curvature inequality for the midpoint `m` of `[x, y]`
(Bruhat–Tits I, 3.2.1, p. 63, with 7.4.20, p. 175). -/
theorem cat0_inequality (x y z m : Building D φ) (hmx : dist x m = dist x y / 2)
    (hmy : dist y m = dist x y / 2) :
    dist z m ^ 2 + dist x y ^ 2 / 4 ≤ (dist z x ^ 2 + dist z y ^ 2) / 2 := sorry

/-- The Bruhat–Tits fixed point theorem: for a discrete valuation, a subgroup with a bounded orbit
fixes a point (Bruhat–Tits I, 3.2.3–3.2.4, pp. 63–64). -/
theorem exists_fixedPoint_of_bounded (hφ : φ.IsDiscrete) (Γ : Subgroup (WithConv (H →ₐ[K] K)))
    (p : Building D φ)
    (hp : Bornology.IsBounded (Set.range fun γ : Γ => (γ : WithConv (H →ₐ[K] K)) • p)) :
    ∃ q : Building D φ, ∀ γ ∈ Γ, γ • q = q := sorry

/-- Independence of the choices: two local root data with compatible valuations for the same
group have equivariantly bijective, isometric buildings (Bruhat–Tits II, 4.2.12–4.2.13,
pp. 92–93; Bruhat–Tits I, 7.4.3, pp. 171–172). -/
def equivOfChoices (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] :
    Building D φ ≃ Building D' φ' := sorry

theorem equivOfChoices_smul (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ']
    (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    equivOfChoices D φ D' φ' (g • p) = g • equivOfChoices D φ D' φ' p := sorry

theorem isometry_equivOfChoices (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] :
    Isometry (equivOfChoices D φ D' φ') := sorry

-- Test BruhatTits.Building.equivOfChoices_stabilizer
/- Equivariance: the identification preserves point stabilizers, which a bijection of the
underlying sets need not do. -/
example (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ']
    (p : Building D φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) (equivOfChoices D φ D' φ' p) =
      MulAction.stabilizer (WithConv (H →ₐ[K] K)) p := by
  ext g
  simp only [MulAction.mem_stabilizer_iff]
  rw [← equivOfChoices_smul]
  exact (equivOfChoices D φ D' φ').injective.eq_iff

-- Test BruhatTits.Building.equivOfChoices_apartment
/- The identification carries the standard apartment of `(D, φ)` onto an apartment `g • j'(A')`
of `(D', φ')` (Bruhat–Tits II, 4.2.12, p. 92). -/
example (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] :
    ∃ g : WithConv (H →ₐ[K] K), equivOfChoices D φ D' φ' '' Set.range (apartmentEmbedding D φ) =
      g • Set.range (apartmentEmbedding D' φ') := sorry

/-- The map on rational points `G(K) → G(K')` induced by a field extension `K ⊆ K'`, for a
presentation `e : H' ≅ K' ⊗_K H` of the base change: the library maps `TauCeti.AlgHom.mapValue`
(along `K → K'`), `TauCeti.AlgHom.baseChangePointsMulEquiv` and `TauCeti.AlgHom.mapDomain` (along
`e`), composed. -/
def pointsExtension (K' : Type u) [Field K'] [Algebra K K']
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) :
    WithConv (H →ₐ[K] K) →* WithConv (H' →ₐ[K'] K') :=
  (TauCeti.AlgHom.mapDomain (A := K')
      (e.hom.hom.hom : (H' : Type u) →ₐc[K'] TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H)).comp
    ((TauCeti.AlgHom.baseChangePointsMulEquiv (k := K) (K := K') (A := H) (R := K')).toMonoidHom.comp
      (TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId K K')))

/-- Buildings under finite extensions of a henselian discretely valued field with perfect residue
field, the valuation of `K'` extending that of `K`: the canonical injection `B(G, K) → B(G, K')`
(Bruhat–Tits II, 5.1.41, pp. 161–162, with 4.2.24, pp. 99–100), for the base-changed group with
its own local root data `D'`. -/
def extensionEmbedding [ModelField K] (K' : Type u) [Field K'] [ValuativeRel K'] [Algebra K K']
    [ValuativeExtension K K'] [Module.Finite K K']
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) (D' : LocalRootData K' H')
    (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] : Building D φ → Building D' φ' := sorry

theorem extensionEmbedding_injective [ModelField K] (K' : Type u) [Field K'] [ValuativeRel K']
    [Algebra K K'] [ValuativeExtension K K'] [Module.Finite K K']
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) (D' : LocalRootData K' H')
    (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] :
    Function.Injective (extensionEmbedding D φ K' e D' φ') := sorry

/-- If the maximal `K'`-split torus `S'` of `D'` contains the base change of `S` (the ideal of `S'`
is carried by `e` into the extended ideal of `S`), the apartment of `S` is carried affinely into
the apartment of `S'` (Bruhat–Tits II, 4.2.24, p. 100). -/
theorem extensionEmbedding_apartment [ModelField K] (K' : Type u) [Field K'] [ValuativeRel K']
    [Algebra K K'] [ValuativeExtension K K'] [Module.Finite K K']
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) (D' : LocalRootData K' H')
    (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ']
    (hS : ∀ a ∈ D'.splitTorus.toIdeal,
      e.hom.hom a ∈ (TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := K') D.splitTorus).toIdeal) :
    ∃ f : Apartment φ →ᵃ[ℝ] Apartment φ', ∀ x : Apartment φ,
      extensionEmbedding D φ K' e D' φ' (apartmentEmbedding D φ x) = apartmentEmbedding D' φ' (f x) :=
  sorry

/-- The extension embedding is equivariant for `G(K) → G(K')`. -/
theorem extensionEmbedding_smul [ModelField K] (K' : Type u) [Field K'] [ValuativeRel K']
    [Algebra K K'] [ValuativeExtension K K'] [Module.Finite K K']
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) (D' : LocalRootData K' H')
    (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] (g : WithConv (H →ₐ[K] K))
    (p : Building D φ) :
    extensionEmbedding D φ K' e D' φ' (g • p) =
      pointsExtension (H := H) K' e g • extensionEmbedding D φ K' e D' φ' p := sorry

-- Test BruhatTits.Building.extension_needs_valuation_extension (non-example)
/- No map from the 2-adic tree to the 3-adic tree is equivariant for `SL₂(ℚ)`.
The subgroup `SL₂(ℤ_(2))` fixes the standard 2-adic vertex but is unbounded in `SL₂(ℚ₃)`:
it contains upper and lower unipotents with entries `3⁻ⁿ`, and has no fixed 3-adic vertex. -/
example : ¬ ∃ f : BTTree.Vertex ℚ_[2] → BTTree.Vertex ℚ_[3],
    ∀ (g : Matrix.SpecialLinearGroup (Fin 2) ℚ) (x : BTTree.Vertex ℚ_[2]),
      f ((Matrix.SpecialLinearGroup.map (algebraMap ℚ ℚ_[2]) g) • x) =
        (Matrix.SpecialLinearGroup.map (algebraMap ℚ ℚ_[3]) g) • f x := sorry

-- Test BruhatTits.Building.extensionEmbedding_stabilizer
/- Injectivity with equivariance: `g ∈ G(K)` fixes `p` iff its image in `G(K')` fixes the image of
`p`. -/
example [ModelField K] (K' : Type u) [Field K'] [ValuativeRel K'] [Algebra K K']
    [ValuativeExtension K K'] [Module.Finite K K']
    {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) (D' : LocalRootData K' H')
    (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] (p : Building D φ)
    (g : WithConv (H →ₐ[K] K)) :
    g ∈ MulAction.stabilizer _ p ↔
      pointsExtension (H := H) K' e g ∈
        MulAction.stabilizer _ (extensionEmbedding D φ K' e D' φ' p) := by
  simp only [MulAction.mem_stabilizer_iff]
  rw [← extensionEmbedding_smul]
  exact (extensionEmbedding_injective D φ K' e D' φ').eq_iff.symm

-- Test BruhatTits.Building.extensionEmbedding_trivial
/- Degenerate case `K' = K`: the embedding is a bijection. -/
example [ModelField K] [ValuativeExtension K K] {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) H) (D' : LocalRootData K H')
    (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ'] :
    Function.Bijective (extensionEmbedding D φ K e D' φ') := sorry

-- Test BruhatTits.Building.pointsExtension_injective
/- `G(K) → G(K')` is injective: a point is determined by its values, and `K → K'` is injective. -/
example (K' : Type u) [Field K'] [Algebra K K'] {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) :
    Function.Injective (pointsExtension (H := H) K' e) := by
  intro g₁ g₂ h
  apply WithConv.ofConv_injective
  ext a
  apply (algebraMap K K').injective
  have key : ∀ g : WithConv (H →ₐ[K] K),
      (pointsExtension (H := H) K' e g).ofConv (e.inv.hom.hom (1 ⊗ₜ[K] a)) =
        algebraMap K K' (g.ofConv a) := by
    intro g
    have h' : e.hom.hom.hom (e.inv.hom.hom (1 ⊗ₜ[K] a)) =
        (1 ⊗ₜ[K] a : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) :=
      congrArg
        (fun f => f.hom.hom (1 ⊗ₜ[K] a : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
        e.inv_hom_id
    simp only [pointsExtension, MonoidHom.comp_apply, TauCeti.AlgHom.mapDomain_apply,
      WithConv.ofConv_toConv, AlgHom.comp_apply]
    erw [h']
    simp
  rw [← key g₁, ← key g₂, h]

-- Test BruhatTits.Building.pointsExtension_apply
/- Values: on the element of `H'` presenting `1 ⊗ a`, the image of `g` takes the value
`g(a) ∈ K ⊆ K'`. -/
example (K' : Type u) [Field K'] [Algebra K K'] {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K'}
    (e : H' ≅ TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H)
    (g : WithConv (H →ₐ[K] K)) (a : H) :
    (pointsExtension (H := H) K' e g).ofConv (e.inv.hom.hom (1 ⊗ₜ[K] a)) =
      algebraMap K K' (g.ofConv a) := by
  have h : e.hom.hom.hom (e.inv.hom.hom (1 ⊗ₜ[K] a)) =
      (1 ⊗ₜ[K] a : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) :=
    congrArg
      (fun f => f.hom.hom (1 ⊗ₜ[K] a : TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
      e.inv_hom_id
  simp only [pointsExtension, MonoidHom.comp_apply, TauCeti.AlgHom.mapDomain_apply,
    WithConv.ofConv_toConv, AlgHom.comp_apply]
  erw [h]
  simp

/-- The central building map, with base points aligned (Bruhat–Tits II, 4.2.15–4.2.16,
pp. 93–95); the other lifts differ by central translations. -/
def mapCentral {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f) :
    Building D φ → Building (centralData D f hf) (centralValuation D φ f hf) := sorry

def centralApartment {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f) :
    Apartment φ →ᵃ[ℝ] Apartment (centralValuation D φ f hf) := sorry

/-- Pullback along the map of maximal split tori. -/
def centralCharacter {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f) :
    GeometricRoots.Character (centralData D f hf).splitTorus →+
      GeometricRoots.Character D.splitTorus := sorry

theorem centralCharacter_value {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f)
    (χ : GeometricRoots.Character (centralData D f hf).splitTorus)
    (R : Type u) [CommRing R] [Algebra K R]
    (t : subgroupPoints D.splitTorus R) (t' : subgroupPoints (centralData D f hf).splitTorus R)
    (ht : t'.val.ofConv = t.val.ofConv.comp f.hom.hom) :
    GeometricRoots.characterValue _ (centralCharacter D f hf χ) R t =
      GeometricRoots.characterValue _ χ R t' := sorry

theorem centralApartment_linear_character {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f)
    (χ : GeometricRoots.Character (centralData D f hf).splitTorus) (v : D.V) :
    GeometricRoots.characterLinear _ χ
      ((centralData D f hf).cocharacterSpace ((centralApartment D φ f hf).linear v)) =
    GeometricRoots.characterLinear _ (centralCharacter D f hf χ) (D.cocharacterSpace v) := sorry

theorem mapCentral_smul {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f) (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    mapCentral D φ f hf (g • p) = pointsMap f g • mapCentral D φ f hf p := sorry

theorem mapCentral_apartment {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f) (x : Apartment φ) :
    mapCentral D φ f hf (apartmentEmbedding D φ x) =
      apartmentEmbedding (centralData D f hf) (centralValuation D φ f hf)
        (centralApartment D φ f hf x) := sorry

/-- The Levi embedding `B(M, K) → B(G, K)` with the restricted valuation and the common apartment
(Bruhat–Tits II, 4.2.17–4.2.18, pp. 95–96; Bruhat–Tits I, 7.6.4, p. 185). -/
def leviEmbedding (M : LeviDatum D) : Building M.data (M.valuation φ) → Building D φ := sorry

/-- The common apartment is induced by the same split torus inside the Levi and `G`. -/
def leviApartment (M : LeviDatum D) : Apartment (M.valuation φ) ≃ᵃ[ℝ] Apartment φ := sorry

theorem leviEmbedding_apartment (M : LeviDatum D) (x : Apartment (M.valuation φ)) :
    leviEmbedding D φ M (apartmentEmbedding M.data (M.valuation φ) x) =
      apartmentEmbedding D φ (leviApartment D φ M x) := sorry

/-- The common Levi apartment has the character restriction as its dual map. The character
equality is tested on all coefficient algebras, so includes the central directions. -/
theorem leviApartment_linear_character (M : LeviDatum D)
    (χ : GeometricRoots.Character D.splitTorus)
    (χM : GeometricRoots.Character M.data.splitTorus)
    (hχ : ∀ (R : Type u) [CommRing R] [Algebra K R]
      (t : subgroupPoints M.data.splitTorus R) (t' : subgroupPoints D.splitTorus R),
      t'.val.ofConv = t.val.ofConv.comp M.inclusion.hom.hom.toAlgHom →
      GeometricRoots.characterValue M.data.splitTorus χM R t =
        GeometricRoots.characterValue D.splitTorus χ R t') (v : M.data.V) :
    GeometricRoots.characterLinear D.splitTorus χ
        (D.cocharacterSpace ((leviApartment D φ M).linear v)) =
      GeometricRoots.characterLinear M.data.splitTorus χM (M.data.cocharacterSpace v) := sorry

theorem leviEmbedding_smul (M : LeviDatum D) (m : WithConv (M.group →ₐ[K] K))
    (x : Building M.data (M.valuation φ)) :
    leviEmbedding D φ M (translate M.data (M.valuation φ) m x) = pointsMap M.inclusion m • leviEmbedding D φ M x := sorry

theorem leviEmbedding_injective (M : LeviDatum D) :
    Function.Injective (leviEmbedding D φ M) := sorry

theorem range_leviEmbedding (M : LeviDatum D) :
    Set.range (leviEmbedding D φ M) =
      ⋃ m : WithConv (M.group →ₐ[K] K), pointsMap M.inclusion m •
        Set.range (apartmentEmbedding D φ) := sorry

-- Test Building.central_identity
example (h : CentralSurjection (𝟙 H)) : Function.Bijective (mapCentral D φ (𝟙 H) h) := sorry

-- Test Building.central_torus_reduced_roots
/- Degenerate case: without relative roots the target has none, through `centralRoots`. -/
example [IsEmpty D.ι] {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : CentralSurjection f) : IsEmpty (centralData D f hf).ι :=
  (centralRoots D f hf).isEmpty

-- Test Building.central_rootSubgroup_image
/- The root correspondence matches the root groups: `α(U_b) = U'_a` for `b = centralRoots a`
(Bruhat–Tits II, 4.2.15, p. 93); another bijection of the root indices fails this. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f)
    (a : (centralData D f hf).ι) :
    (D.rootDatum.U (centralRoots D f hf a)).map (pointsMap f) =
      (centralData D f hf).rootDatum.U a := by
  ext h
  constructor
  · rintro ⟨g, hg, rfl⟩
    have := (centralRootPoints D f hf a ⟨g, hg⟩).property
    rw [centralRootPoints_val] at this
    exact this
  · intro hh
    refine ⟨((centralRootPoints D f hf a).symm ⟨h, hh⟩).val,
      ((centralRootPoints D f hf a).symm ⟨h, hh⟩).property, ?_⟩
    have := centralRootPoints_val D f hf a ((centralRootPoints D f hf a).symm ⟨h, hh⟩)
    rw [MulEquiv.apply_symm_apply] at this
    exact this.symm

-- Test Building.central_roots_pullback
/- The roots of `G'` pull back to the roots of `G` along `α|_S` (Bruhat–Tits II, 4.2.15, p. 93):
`centralCharacter` carries the character of the root `a` to that of `centralRoots a`. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f)
    (a : (centralData D f hf).ι) :
    centralCharacter D f hf ((centralData D f hf).rootIndex a).val =
      (D.rootIndex (centralRoots D f hf a)).val := sorry

-- Test Building.central_character_injective
/- `α|_S : S → α(S)` is surjective, so pulling back characters is injective. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f) :
    Function.Injective (centralCharacter D f hf) := sorry

-- Test Building.central_identity_roots
/- Degenerate case: for the identity Hopf morphism the root-group isomorphisms are the identity on
points, and the pullback of characters is bijective. -/
example (h : CentralSurjection (𝟙 H)) (a : (centralData D (𝟙 H) h).ι)
    (g : D.rootDatum.U (centralRoots D (𝟙 H) h a)) :
    (centralRootPoints D (𝟙 H) h a g).val = g.val ∧
      Function.Bijective (centralCharacter D (𝟙 H) h) :=
  ⟨by rw [centralRootPoints_val]; rfl, sorry⟩

-- Test Building.central_valuation_rootPoints
/- The transported valuation takes on `α(u)` the value `φ` takes on `u`. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f)
    (a : (centralData D f hf).ι) (g : D.rootDatum.U (centralRoots D f hf a)) :
    (centralValuation D φ f hf).φ a (centralRootPoints D f hf a g) =
      φ.φ (centralRoots D f hf a) g := by
  rw [centralValuation_apply, MulEquiv.symm_apply_apply]

-- Test Building.mapCentral_stabilizer
/- Equivariance: `α` carries the stabilizer of `p` into the stabilizer of its image. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (f : H' ⟶ H) (hf : CentralSurjection f)
    (p : Building D φ) (g : WithConv (H →ₐ[K] K)) (hg : g ∈ MulAction.stabilizer _ p) :
    pointsMap f g ∈ MulAction.stabilizer _ (mapCentral D φ f hf p) := by
  rw [MulAction.mem_stabilizer_iff] at hg ⊢
  rw [← mapCentral_smul, hg]

-- Test Building.centralApartment_identity
/- Degenerate case: for the identity Hopf morphism the apartment map is an affine bijection. -/
example (h : CentralSurjection (𝟙 H)) : Function.Bijective (centralApartment D φ (𝟙 H) h) := sorry

-- Test Building.LeviDatum.root_inclusion
/- A count only: it follows from `LeviDatum.roots` being an embedding. -/
example (M : LeviDatum D) : Nat.card M.data.ι ≤ Nat.card D.ι :=
  Nat.card_le_card_of_injective M.roots M.roots.injective

-- Test Building.LeviDatum.inclusion_surjective
/- `M ⊂ G` is a closed subgroup: its coordinate map is the surjective quotient map. -/
example (M : LeviDatum D) : Function.Surjective M.inclusion.hom.hom := by
  intro b
  obtain ⟨a, rfl⟩ := Ideal.Quotient.mk_surjective b
  exact ⟨a, LeviDatum.inclusion_apply M a⟩

-- Test Building.LeviDatum.inclusion_kernel
/- The coordinate map kills exactly the ideal of the centralizer. -/
example (M : LeviDatum D) (a : H) :
    M.inclusion.hom.hom a = 0 ↔ a ∈ (GeometricRoots.centralizerIdeal M.subtorus).toIdeal := by
  rw [LeviDatum.inclusion_apply, Ideal.Quotient.eq_zero_iff_mem]

-- Test Building.LeviDatum.inclusion_points_injective
/- `M(K) → G(K)` is injective. -/
example (M : LeviDatum D) : Function.Injective (pointsMap M.inclusion) := by
  intro m₁ m₂ h
  apply WithConv.ofConv_injective
  ext b
  obtain ⟨a, rfl⟩ := Ideal.Quotient.mk_surjective b
  rw [← LeviDatum.inclusion_apply M a]
  exact DFunLike.congr_fun (congrArg WithConv.ofConv h) a

-- Test Building.leviEmbedding_stabilizer
/- Equivariance: the inclusion carries the stabilizer of `x` in `M(K)` into the stabilizer of its
image in `G(K)`. -/
example (M : LeviDatum D) (x : Building M.data (M.valuation φ)) (m : WithConv (M.group →ₐ[K] K))
    (hm : translate M.data (M.valuation φ) m x = x) :
    pointsMap M.inclusion m ∈ MulAction.stabilizer _ (leviEmbedding D φ M x) := by
  rw [MulAction.mem_stabilizer_iff, ← leviEmbedding_smul, hm]

-- Test Building.leviEmbedding_apartment_range
/- The image of the Levi building contains the standard apartment of `G`, through
`leviApartment`. -/
example (M : LeviDatum D) :
    Set.range (apartmentEmbedding D φ) ⊆ Set.range (leviEmbedding D φ M) := by
  rintro _ ⟨y, rfl⟩
  refine ⟨apartmentEmbedding M.data (M.valuation φ) ((leviApartment D φ M).symm y), ?_⟩
  rw [leviEmbedding_apartment, AffineEquiv.apply_symm_apply]

-- Test Building.leviApartment_finrank
/- The Levi and `G` share the maximal split torus `S`, so their apartments have the same
dimension (for the diagonal torus of `GL₂`, two). -/
example (M : LeviDatum D) : Module.finrank ℝ M.data.V = Module.finrank ℝ D.V :=
  (leviApartment D φ M).linear.finrank_eq

-- Test Building.leviApartment_roots
/- On the common apartment the roots of `M` are roots of `G`: the root `M.roots a` of `G`, read
through `leviApartment`, is the root `a` of `M`. -/
example (M : LeviDatum D) (a : M.data.ι) (v : M.data.V) :
    D.Φ.root (M.roots a) ((leviApartment D φ M).linear v) = M.data.Φ.root a v := sorry

/-- With no relative roots (a torus, or a group anisotropic modulo its centre) the building is the
apartment, on which `G(K) = N(K)` acts by translations, so all point stabilizers coincide
(Bruhat–Tits II, 4.2.16, p. 94, and 5.1.26–5.1.27, p. 156). -/
theorem anisotropic_bounded [IsEmpty D.ι] (p q : Building D φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) p = MulAction.stabilizer (WithConv (H →ₐ[K] K)) q :=
  sorry

end Building

/-! ### Reduced and enlarged buildings -/

/-- The central directions `V_Z = X_*(A_G) ⊗ ℝ`: the common kernel of the roots in `V`
(all of `V` when there are no roots). -/
def centralSubspace (D : LocalRootData K H) : Submodule ℝ D.V :=
  ⨅ i, LinearMap.ker (D.Φ.toLinearMap (D.Φ.root i))

-- Test BruhatTits.centralSubspace_rankZero
/- Degenerate case: with no roots every direction is central. -/
example (D : LocalRootData K H) [IsEmpty D.ι] : centralSubspace D = ⊤ := by
  simp [centralSubspace]

-- Test BruhatTits.centralSubspace_gl2
/- For `GL₂` the central directions form the diagonal line: `v ∈ V_Z` iff its two diagonal
coordinates agree. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v : (GLBuilding.standardData (K := K) 2).V) :
    v ∈ centralSubspace (GLBuilding.standardData (K := K) 2) ↔
      GLBuilding.standardCoordinates 2 v 0 = GLBuilding.standardCoordinates 2 v 1 := sorry

/-- The reduced building `B_red(G, K)`, the quotient of `B(G, K)` by the translations along `V_Z`
(`ReducedBuilding.prodEquiv`; Bruhat–Tits II, 4.2.14–4.2.16, pp. 93–95). -/
def ReducedBuilding (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] : Type u := sorry

namespace ReducedBuilding

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]

instance : MulAction (WithConv (H →ₐ[K] K)) (ReducedBuilding D φ) := sorry

/-- The reduced metric (`ReducedBuilding.dist_prodEquiv_symm`). -/
instance : MetricSpace (ReducedBuilding D φ) := sorry

/-- `θ : G(K) → V_Z`, `⟨θ(g), χ⟩ = -ω(χ(g))` for the normalized valuation `ω` of `K`
(`ReducedBuilding.centralVector_character`). It depends on the valuation of `K`, not only on the
group: for `GL₁` over `ℚ`, `θ(2)` is `-1` for the `2`-adic and `0` for the `3`-adic valuation. -/
def centralVector [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] :
    WithConv (H →ₐ[K] K) →* Multiplicative (centralSubspace D) := sorry

/-- `⟨θ(g), χ⟩ = -ω(χ(g))` for every rational character `χ` of `G`, paired through its restriction
to `S` (Bruhat–Tits II, 4.2.16 (2), p. 94). -/
theorem centralVector_character
    (χ : Additive (GroupLike K H)) (g : WithConv (H →ₐ[K] K)) :
    GeometricRoots.characterLinear D.splitTorus
        (GeometricRoots.restrictAmbientCharacter D.splitTorus χ)
        (D.cocharacterSpace ((Multiplicative.toAdd (centralVector D g) : centralSubspace D) : D.V)) =
      -(Multiplicative.toAdd (normalizedOrder (K := K)
        (GeometricRoots.ambientCharacterValue χ g)) : ℤ) := sorry

/-- `B(G, K) ≃ B_red(G, K) × V_Z` (Bruhat–Tits II, 4.2.16 (1), p. 94). -/
def prodEquiv : Building D φ ≃ ReducedBuilding D φ × centralSubspace D := sorry

theorem prodEquiv_smul (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    prodEquiv D φ (g • p) =
      (g • (prodEquiv D φ p).1, (prodEquiv D φ p).2 + Multiplicative.toAdd (centralVector D g)) :=
  sorry

/-- On the apartment the central coordinate moves as the rational characters of `G` see the
displacement, so it is affine with linear part the projection of `V` onto `V_Z` along the coroots
(Bruhat–Tits II, 4.2.16, p. 94). -/
theorem prodEquiv_apartment (χ : Additive (GroupLike K H)) (x y : Apartment φ) :
    GeometricRoots.characterLinear D.splitTorus
        (GeometricRoots.restrictAmbientCharacter D.splitTorus χ)
        (D.cocharacterSpace (((prodEquiv D φ (apartmentEmbedding D φ y)).2 : D.V) -
          (prodEquiv D φ (apartmentEmbedding D φ x)).2)) =
      GeometricRoots.characterLinear D.splitTorus
        (GeometricRoots.restrictAmbientCharacter D.splitTorus χ) (D.cocharacterSpace (y -ᵥ x)) :=
  sorry

/-- The metric of `B(G, K)` is the Euclidean product of those of `B_red` and `V_Z`, so on a slice
`B_red × {c}` it is the reduced metric (Bruhat–Tits II, 4.2.16, p. 94). -/
theorem dist_prodEquiv_symm (r s : ReducedBuilding D φ) (c : centralSubspace D) :
    dist ((prodEquiv D φ).symm (r, c)) ((prodEquiv D φ).symm (s, c)) = dist r s := sorry

/-- The centre of `G(K)` acts trivially on the reduced building (Bruhat–Tits II, 4.2.14, p. 93). -/
theorem centre_smul (z : WithConv (H →ₐ[K] K)) (hz : z ∈ Subgroup.center (WithConv (H →ₐ[K] K)))
    (x : ReducedBuilding D φ) : z • x = x := sorry

/-- Every central epimorphism identifies the reduced buildings (Bruhat–Tits II, 4.2.15,
pp. 93–94); for the adjoint quotient this is `B_red(G, K) ≃ B(G^ad, K)`. -/
def centralEquiv {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : Building.CentralSurjection f) :
    ReducedBuilding D φ ≃ ReducedBuilding (Building.centralData D f hf)
      (Building.centralValuation D φ f hf) := sorry

theorem centralEquiv_smul {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : Building.CentralSurjection f) (g : WithConv (H →ₐ[K] K))
    (x : ReducedBuilding D φ) :
    centralEquiv D φ f hf (g • x) = Building.pointsMap f g • centralEquiv D φ f hf x := sorry

-- Test BruhatTits.ReducedBuilding.torus_point
example [IsEmpty D.ι] : Subsingleton (ReducedBuilding D φ) := sorry

-- Test BruhatTits.ReducedBuilding.prodEquiv_not_unique
/- Composing with a translation of `V_Z` gives another equivariant decomposition. -/
example (v : centralSubspace D) (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    let e := (prodEquiv D φ).trans (Equiv.prodCongr (Equiv.refl _) (Equiv.addRight v))
    e (g • p) = (g • (e p).1, (e p).2 + Multiplicative.toAdd (centralVector D g)) := by
  show ((prodEquiv D φ (g • p)).1, (prodEquiv D φ (g • p)).2 + v) =
    (g • (prodEquiv D φ p).1, (prodEquiv D φ p).2 + v + Multiplicative.toAdd (centralVector D g))
  rw [prodEquiv_smul, add_right_comm]

-- Test BruhatTits.ReducedBuilding.central_compat
/- The enlarged central map `mapCentral` induces `centralEquiv` on the reduced buildings: passing to
`B_red` removes the central fibre, along which `mapCentral` need not be injective. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : Building.CentralSurjection f) (p : Building D φ) :
    (prodEquiv (Building.centralData D f hf) (Building.centralValuation D φ f hf)
      (Building.mapCentral D φ f hf p)).1 = centralEquiv D φ f hf (prodEquiv D φ p).1 := sorry

-- Test BruhatTits.ReducedBuilding.gl_n_centralVector
/- For `GL₂`, `θ(ϖ · 1) = (-1, -1)` and `θ(diag(ϖ, 1)) = (-1/2, -1/2)` in the diagonal coordinates:
pairing with `det` gives `-ω(det g) = -2` and `-1`, and `θ(diag(ϖ, 1))` is the central projection
of the torus translation `v(diag(ϖ, 1)) = (-1, 0)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g g' : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal (fun _ => (π : K)))
    (hg' : (TauCeti.GeneralLinear.pointsMulEquiv 2 g' : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K), 1]) :
    GLBuilding.standardCoordinates 2
        ((Multiplicative.toAdd (centralVector (GLBuilding.standardData (K := K) 2) g) :
          centralSubspace (GLBuilding.standardData (K := K) 2)) :
            (GLBuilding.standardData (K := K) 2).V) = ![-1, -1] ∧
      GLBuilding.standardCoordinates 2
        ((Multiplicative.toAdd (centralVector (GLBuilding.standardData (K := K) 2) g') :
          centralSubspace (GLBuilding.standardData (K := K) 2)) :
            (GLBuilding.standardData (K := K) 2).V) = ![-1 / 2, -1 / 2] := sorry

-- Test BruhatTits.ReducedBuilding.gl1_centralVector
/- Two terms for `GL₁`: `θ(u) = 0` for a unit `u` of `𝒪` and `θ(ϖ) = -1`, so `θ` is the negative
normalized valuation; it is not determined by the group alone. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π u : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1) (hu : normalizedOrder (K := K) u = 1)
    (g g' : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 1 g : Matrix (Fin 1) (Fin 1) K) =
      Matrix.diagonal (fun _ => (π : K)))
    (hg' : (TauCeti.GeneralLinear.pointsMulEquiv 1 g' : Matrix (Fin 1) (Fin 1) K) =
      Matrix.diagonal (fun _ => (u : K))) :
    GLBuilding.standardCoordinates 1
        ((Multiplicative.toAdd (centralVector (GLBuilding.standardData (K := K) 1) g) :
          centralSubspace (GLBuilding.standardData (K := K) 1)) :
            (GLBuilding.standardData (K := K) 1).V) = ![-1] ∧
      GLBuilding.standardCoordinates 1
        ((Multiplicative.toAdd (centralVector (GLBuilding.standardData (K := K) 1) g') :
          centralSubspace (GLBuilding.standardData (K := K) 1)) :
            (GLBuilding.standardData (K := K) 1).V) = ![0] := sorry

-- Test BruhatTits.ReducedBuilding.centralVector_rootSubgroup
/- Rational characters of `G` are trivial on unipotent elements, so `θ` vanishes on the root
subgroups. -/
example [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] (i : D.ι)
    (u : WithConv (H →ₐ[K] K)) (hu : u ∈ D.rootDatum.U i) : centralVector D u = 1 := sorry

-- Test BruhatTits.ReducedBuilding.prodEquiv_coroot
/- The central coordinate is constant along the coroot directions of the apartment. -/
example (x : Apartment φ) (i : D.ι) (t : ℝ) :
    (prodEquiv D φ (apartmentEmbedding D φ ((t • D.Φ.coroot i) +ᵥ x))).2 =
      (prodEquiv D φ (apartmentEmbedding D φ x)).2 := sorry

-- Test BruhatTits.ReducedBuilding.prodEquiv_rankZero
/- Degenerate case: with no roots `B_red` is a point, so the central coordinate alone identifies
`B` with `V_Z`. -/
example [IsEmpty D.ι] : Function.Injective fun p : Building D φ => (prodEquiv D φ p).2 := sorry

-- Test BruhatTits.ReducedBuilding.gl2_not_point (non-example)
/- For `GL₂` over a local field the reduced building is the tree, not a point. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    Nontrivial (ReducedBuilding (GLBuilding.standardData (K := K) 2)
      (GLBuilding.standardValuation 2)) := sorry

-- Test BruhatTits.ReducedBuilding.gl2_scalar
/- `ϖ · 1 ∈ GL₂(K)` is central: it fixes every point of the reduced building and moves every point
of the enlarged building, by `θ(ϖ · 1) = (-1, -1)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal (fun _ => (π : K))) :
    (∀ x : ReducedBuilding (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2),
        g • x = x) ∧
      ∀ p : Building (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2),
        g • p ≠ p := sorry

-- Test BruhatTits.ReducedBuilding.centralEquiv_stabilizer
/- Equivariance: `α` carries the stabilizer of `x` into the stabilizer of its image. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : Building.CentralSurjection f) (x : ReducedBuilding D φ)
    (g : WithConv (H →ₐ[K] K)) (hg : g ∈ MulAction.stabilizer _ x) :
    Building.pointsMap f g ∈ MulAction.stabilizer _ (centralEquiv D φ f hf x) := by
  rw [MulAction.mem_stabilizer_iff] at hg ⊢
  rw [← centralEquiv_smul, hg]

-- Test BruhatTits.ReducedBuilding.centralEquiv_apartment
/- On the reduced images of the standard apartments, `centralEquiv` is `centralApartment`. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (f : H' ⟶ H) (hf : Building.CentralSurjection f) (x : Apartment φ) :
    centralEquiv D φ f hf (prodEquiv D φ (apartmentEmbedding D φ x)).1 =
      (prodEquiv (Building.centralData D f hf) (Building.centralValuation D φ f hf)
        (apartmentEmbedding (Building.centralData D f hf) (Building.centralValuation D φ f hf)
          (Building.centralApartment D φ f hf x))).1 := sorry

-- Test BruhatTits.Building.equivOfChoices_not_unique (non-example)
/- The enlarged identification is not unique: following it by a translation of `V_Z` gives
another equivariant identification (Bruhat–Tits II, 4.2.16, p. 94). -/
example (D' : LocalRootData K H) (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ']
    (v : centralSubspace D') (g : WithConv (H →ₐ[K] K)) (p : Building D φ) :
    let e : Building D φ ≃ Building D' φ' := (Building.equivOfChoices D φ D' φ').trans
      ((prodEquiv D' φ').trans
        ((Equiv.prodCongr (Equiv.refl _) (Equiv.addRight v)).trans (prodEquiv D' φ').symm))
    e (g • p) = g • e p := by
  intro e
  apply (prodEquiv D' φ').injective
  have h₁ := prodEquiv_smul D' φ' g ((prodEquiv D' φ').symm
    ((prodEquiv D' φ' (Building.equivOfChoices D φ D' φ' p)).1,
      (prodEquiv D' φ' (Building.equivOfChoices D φ D' φ' p)).2 + v))
  simp only [Equiv.apply_symm_apply] at h₁
  simp only [e, Equiv.trans_apply, Equiv.prodCongr_apply, Equiv.coe_refl, Equiv.coe_addRight,
    Prod.map, id, Equiv.apply_symm_apply, Building.equivOfChoices_smul, prodEquiv_smul, h₁,
    add_right_comm]

end ReducedBuilding

/-! ### Facets and special points -/

/-- The facets of the building: the `G(K)`-translates of the facets of the standard apartment,
with the closure order (Bruhat–Tits I, 7.4.12–7.4.13, pp. 173–174). -/
def BuildingFacet (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] : Type u := sorry

namespace BuildingFacet

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]

instance : SetLike (BuildingFacet D φ) (Building D φ) := sorry

instance : PartialOrder (BuildingFacet D φ) := sorry

theorem mem_unique (p : Building D φ) : ∃! F : BuildingFacet D φ, p ∈ F := sorry

theorem le_iff (F F' : BuildingFacet D φ) : F ≤ F' ↔ (F : Set (Building D φ)) ⊆ closure (F' : Set (Building D φ)) := sorry

/-- A facet meeting the standard apartment is the image of a facet of the apartment
(Bruhat–Tits I, 7.4.13 (i), pp. 173–174). -/
theorem exists_facet_eq_image (F : BuildingFacet D φ) (x : Apartment φ)
    (hx : apartmentEmbedding D φ x ∈ F) :
    ∃ F₀ : Facet φ, x ∈ F₀.carrier ∧ (F : Set (Building D φ)) = apartmentEmbedding D φ '' F₀.carrier :=
  sorry

/-- The action of `G(K)` on facets. -/
def smul (g : WithConv (H →ₐ[K] K)) (F : BuildingFacet D φ) : BuildingFacet D φ := sorry

instance : MulAction (WithConv (H →ₐ[K] K)) (BuildingFacet D φ) where
  smul := smul D φ
  one_smul := sorry
  mul_smul := sorry

theorem coe_smul (g : WithConv (H →ₐ[K] K)) (F : BuildingFacet D φ) :
    ((g • F : BuildingFacet D φ) : Set (Building D φ)) = g • (F : Set (Building D φ)) := sorry

theorem smul_le_smul_iff (g : WithConv (H →ₐ[K] K)) (F F' : BuildingFacet D φ) :
    g • F ≤ g • F' ↔ F ≤ F' := sorry

/-- Chambers (alcoves): the maximal facets. -/
def IsChamber (F : BuildingFacet D φ) : Prop := IsMax F

/-- Vertices: the minimal facets (in the enlarged building, a vertex of `B_red` times `V_Z`). -/
def IsVertex (F : BuildingFacet D φ) : Prop := IsMin F

/-- A point of the building is special if it is the image of a special point `ψ` of an apartment
(`Facet.IsSpecial` of RG2.1: every root direction is the direction of a wall through `ψ`). -/
def IsSpecial (p : Building D φ) : Prop :=
  ∃ (g : WithConv (H →ₐ[K] K)) (ψ : Apartment φ),
    p = g • apartmentEmbedding D φ ψ ∧ Facet.IsSpecial ψ

theorem isSpecial_iff_forall (p : Building D φ) :
    IsSpecial D φ p ↔ ∀ (g : WithConv (H →ₐ[K] K)) (ψ : Apartment φ),
      p = g • apartmentEmbedding D φ ψ → Facet.IsSpecial ψ := sorry

/-- The direction space of the affine span of the reduced facet, in a chosen apartment. -/
def direction (F : BuildingFacet D φ) : Submodule ℝ D.V := sorry

/-- The linear action induced on the reduced facet's affine span. -/
def directionAction (F : BuildingFacet D φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) F →* (direction D φ F ≃ₗ[ℝ] direction D φ F) := sorry

/-- Coordinates of the reduced vertices in a chosen apartment, with central directions removed. -/
def vertexCoordinate (F : BuildingFacet D φ)
    (v : {v : BuildingFacet D φ // IsVertex D φ v ∧ v ≤ F}) : D.V := sorry

/-- These coordinates realize the reduced facet as the convex hull of its vertices;
its direction is the span of their differences. -/
theorem direction_eq_span (F : BuildingFacet D φ) :
    direction D φ F = Submodule.span ℝ
      {x | ∃ v w, x = vertexCoordinate D φ F v - vertexCoordinate D φ F w} := sorry

/-- The linear action is induced by the actual permutation of reduced vertices. -/
theorem directionAction_sub (F : BuildingFacet D φ)
    (g : MulAction.stabilizer (WithConv (H →ₐ[K] K)) F)
    (v w v' w' : {v : BuildingFacet D φ // IsVertex D φ v ∧ v ≤ F})
    (hv : v'.val = g.val • v.val) (hw : w'.val = g.val • w.val)
    (x : direction D φ F)
    (hx : x.val = vertexCoordinate D φ F v - vertexCoordinate D φ F w) :
    (directionAction D φ F g x).val =
      vertexCoordinate D φ F v' - vertexCoordinate D φ F w' := sorry

/-- Geometric orientation: the determinant on the real affine span. -/
def orientationCharacter (F : BuildingFacet D φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) F →* ℤˣ := sorry

theorem orientationCharacter_apply (F : BuildingFacet D φ)
    (g : MulAction.stabilizer (WithConv (H →ₐ[K] K)) F) :
    ((orientationCharacter D φ F g : ℤ) : ℝ) =
      LinearMap.det (directionAction D φ F g).toLinearMap := sorry

/-- The sign of the permutation of all vertices, a separate combinatorial character. -/
def vertexPermutationCharacter (F : BuildingFacet D φ) :
    MulAction.stabilizer (WithConv (H →ₐ[K] K)) F →* ℤˣ := sorry

theorem vertexPermutationCharacter_apply (F : BuildingFacet D φ)
    (g : MulAction.stabilizer (WithConv (H →ₐ[K] K)) F)
    [Fintype {v : BuildingFacet D φ // IsVertex D φ v ∧ v ≤ F}]
    [DecidableEq {v : BuildingFacet D φ // IsVertex D φ v ∧ v ≤ F}]
    (σ : Equiv.Perm {v : BuildingFacet D φ // IsVertex D φ v ∧ v ≤ F})
    (hσ : ∀ v, (σ v : BuildingFacet D φ) = (g : WithConv (H →ₐ[K] K)) • (v : BuildingFacet D φ)) :
    vertexPermutationCharacter D φ F g = Equiv.Perm.sign σ := sorry

/-- A bounded polysimplex is a simplex exactly when it has dimension plus one vertices. -/
theorem orientationCharacter_eq_vertexPermutation_of_simplex (F : BuildingFacet D φ)
    (hsimplex : Nat.card {v : BuildingFacet D φ // IsVertex D φ v ∧ v ≤ F} =
      Module.finrank ℝ (direction D φ F) + 1) :
    orientationCharacter D φ F = vertexPermutationCharacter D φ F := sorry

-- Test orientationCharacter_square_reflection
example (F : BuildingFacet D φ)
    (g : MulAction.stabilizer (WithConv (H →ₐ[K] K)) F)
    (e : direction D φ F ≃ₗ[ℝ] (Fin 2 → ℝ))
    (he : ∀ x, e (directionAction D φ F g x) = ![-(e x 0), e x 1])
    (v : {v : BuildingFacet D φ // IsVertex D φ v ∧ v ≤ F} ≃ (Fin 2 × Fin 2))
    (hv : ∀ x, ((v.symm (1 - (v x).1, (v x).2)).val : BuildingFacet D φ) =
      (g : WithConv (H →ₐ[K] K)) • x.val) :
    orientationCharacter D φ F g = -1 ∧ vertexPermutationCharacter D φ F g = 1 := sorry

-- Test BruhatTits.BuildingFacet.rankZero_single
example [IsEmpty D.ι] : Subsingleton (BuildingFacet D φ) := sorry

-- Test BruhatTits.BuildingFacet.tree_facets
/- For `GL₂` over a local field every facet is a vertex or a chamber (a vertex of the tree, or an
open edge, times the central line), and none is both. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (F : BuildingFacet (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2)) :
    (IsVertex _ _ F ∨ IsChamber _ _ F) ∧ ¬ (IsVertex _ _ F ∧ IsChamber _ _ F) := sorry

-- Test BruhatTits.Building.gl2_tree
/- For `GL₂` over a local field with residue field of order `q`, every vertex lies in exactly
`q + 1` chambers: the reduced building is the `(q + 1)`-regular tree. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (F : BuildingFacet (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (hF : IsVertex _ _ F) :
    Nat.card {F' : BuildingFacet (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2) //
      IsChamber _ _ F' ∧ F ≤ F'} = Nat.card 𝓀[K] + 1 := sorry

-- Test BruhatTits.BuildingFacet.not_special_barycentre
/- For `GL₂`, the apartment point with diagonal coordinates `(1/2, 0)` (the midpoint of a tree edge)
lies on no wall, so it is not special. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0]) :
    ¬ IsSpecial (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
      (apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x) := sorry

-- Test BruhatTits.BuildingFacet.gl2_edge_orientation
/- For `GL₂`, `g = (0 1; ϖ 0)` stabilizes the chamber through the apartment point with
coordinates `(1/2, 0)` and swaps its two vertices, so `ε_F(g) = -1`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) = !![0, 1; (π : K), 0])
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0])
    (F : BuildingFacet (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (hF : apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x ∈ F) :
    ∃ hg : g ∈ MulAction.stabilizer _ F,
      orientationCharacter (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) F ⟨g, hg⟩ = -1 :=
  sorry

-- Test BruhatTits.BuildingFacet.nonempty (non-example)
/- Facets are nonempty: adjoining the empty set, a bottom element below every vertex, would keep
`mem_unique`, `le_iff` and `coe_smul` but make no facet minimal. -/
example (F : BuildingFacet D φ) : (F : Set (Building D φ)).Nonempty := sorry

-- Test BruhatTits.BuildingFacet.rankZero_chamber_vertex
/- Degenerate case: with no roots the single facet is both a chamber and a vertex. -/
example [IsEmpty D.ι] (F : BuildingFacet D φ) : IsChamber D φ F ∧ IsVertex D φ F := sorry

-- Test BruhatTits.BuildingFacet.smul_isChamber_isVertex
/- `G(K)` permutes the chambers and the vertices, since `smul g` is an order automorphism. -/
example (g : WithConv (H →ₐ[K] K)) (F : BuildingFacet D φ) :
    (IsChamber D φ (smul D φ g F) ↔ IsChamber D φ F) ∧
      (IsVertex D φ (smul D φ g F) ↔ IsVertex D φ F) := by
  let e : BuildingFacet D φ ≃o BuildingFacet D φ :=
    { toEquiv := MulAction.toPerm g
      map_rel_iff' := smul_le_smul_iff D φ g _ _ }
  exact ⟨e.isMax_apply, e.isMin_apply⟩

-- Test BruhatTits.BuildingFacet.smul_rankZero
/- Degenerate case: with no roots every element stabilizes the single facet. -/
example [IsEmpty D.ι] (g : WithConv (H →ₐ[K] K)) (F : BuildingFacet D φ) : smul D φ g F = F :=
  sorry

-- Test BruhatTits.BuildingFacet.orientation_fixer
/- An element fixing `F` pointwise fixes its vertices, so `ε_F` is trivial on it. -/
example (F : BuildingFacet D φ) (g : WithConv (H →ₐ[K] K))
    (hfix : ∀ p ∈ (F : Set (Building D φ)), g • p = p) (hg : g ∈ MulAction.stabilizer _ F) :
    orientationCharacter D φ F ⟨g, hg⟩ = 1 := sorry

-- Test BruhatTits.BuildingFacet.orientation_vertex
/- A vertex has one vertex, so `ε_F` is trivial. -/
example (F : BuildingFacet D φ) (hF : IsVertex D φ F) : orientationCharacter D φ F = 1 := sorry

-- Test BruhatTits.BuildingFacet.gl2_scalar_orientation
/- For `GL₂`, the central element `ϖ · 1` stabilizes every facet and fixes its vertices (it acts
trivially on the tree), so `ε_F(ϖ · 1) = +1`, against `-1` for `(0 1; ϖ 0)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal (fun _ => (π : K)))
    (F : BuildingFacet (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2)) :
    ∃ hg : g ∈ MulAction.stabilizer _ F,
      orientationCharacter (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) F
        ⟨g, hg⟩ = 1 :=
  sorry

end BuildingFacet

/-! ### Stabilizers and pointwise fixers -/

namespace Fixer

variable (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]

/-- The pointwise fixer `G(K)_Ω` of a subset of the building. -/
def pointwise (Ω : Set (Building D φ)) : Subgroup (WithConv (H →ₐ[K] K)) :=
  ⨅ p ∈ Ω, MulAction.stabilizer (WithConv (H →ₐ[K] K)) p

/-- The setwise stabilizer `Stab(Ω)`. -/
def stabilizer (Ω : Set (Building D φ)) : Subgroup (WithConv (H →ₐ[K] K)) :=
  MulAction.stabilizer (WithConv (H →ₐ[K] K)) Ω

theorem pointwise_le_stabilizer (Ω : Set (Building D φ)) : pointwise D φ Ω ≤ stabilizer D φ Ω :=
  sorry

theorem pointwise_smul (g : WithConv (H →ₐ[K] K)) (Ω : Set (Building D φ)) :
    pointwise D φ (g • Ω) = (pointwise D φ Ω).map (MulAut.conj g).toMonoidHom := sorry

theorem pointwise_antitone : Antitone (pointwise D φ) := sorry

-- Test BruhatTits.Fixer.singleton_eq
example (p : Building D φ) : pointwise D φ {p} = stabilizer D φ {p} := sorry

-- Test BruhatTits.Fixer.gl2_vertex
/- For `GL₂` the fixer of the point `[O²]` (displacement `0`) of the enlarged building is
`GL₂(O)`, not the reduced-building stabilizer `K^× GL₂(O)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Apartment (GLBuilding.standardValuation (K := K) 2)) (hx : x.displacement = 0)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K)) :
    g ∈ pointwise (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        {apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x} ↔
      ∀ i j, valuation K ((TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) i j) ≤ 1 ∧
        valuation K ((TauCeti.GeneralLinear.pointsMulEquiv 2 g⁻¹ : Matrix (Fin 2) (Fin 2) K) i j) ≤ 1 :=
  sorry

-- Test BruhatTits.Fixer.gl2_edge_stabilizer_ne_fixer
/- For `GL₂`, `(0 1; ϖ 0)` stabilizes the chamber through the apartment point with coordinates
`(1/2, 0)` but does not fix it pointwise. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K))
    (hg : (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) = !![0, 1; (π : K), 0])
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0])
    (F : BuildingFacet (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (hF : apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x ∈ F) :
    g ∈ stabilizer (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) (F : Set _) ∧
      g ∉ pointwise (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) (F : Set _) := sorry

section LocalField

variable [TopologicalSpace K] [IsNonarchimedeanLocalField K]

open scoped PointTopology

/-- For a local field the fixer of a nonempty bounded set is compact (Bruhat–Tits II, 4.2.16 and
4.2.19, pp. 94–97). -/
theorem isCompact_pointwise (Ω : Set (Building D φ)) (hΩ : Bornology.IsBounded Ω)
    (hne : Ω.Nonempty) : IsCompact (pointwise D φ Ω : Set (WithConv (H →ₐ[K] K))) := sorry

theorem isOpen_pointwise (Ω : Set (Building D φ)) (hΩ : Bornology.IsBounded Ω) :
    IsOpen (pointwise D φ Ω : Set (WithConv (H →ₐ[K] K))) := sorry

/-- In the reduced building, stabilizers of points are compact modulo the centre (Bruhat–Tits II,
4.2.14 and 4.2.16, pp. 93–95). -/
theorem stabilizer_compactModCentre (x : ReducedBuilding D φ) :
    IsCompact ((QuotientGroup.mk : WithConv (H →ₐ[K] K) → _ ⧸ Subgroup.center (WithConv (H →ₐ[K] K))) ''
      (MulAction.stabilizer (WithConv (H →ₐ[K] K)) x : Set (WithConv (H →ₐ[K] K)))) := sorry

/-- Cocompactness: a bounded subset meets every orbit (Bruhat–Tits I, 7.4.18 and 7.4.22,
pp. 174–176, with Bruhat–Tits II, 4.2.16, p. 94, for the central directions). -/
theorem _root_.TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits.Building.exists_bounded_fundamentalDomain :
    ∃ Ω : Set (Building D φ), Bornology.IsBounded Ω ∧
      ∀ p : Building D φ, ∃ g : WithConv (H →ₐ[K] K), g • p ∈ Ω := sorry

end LocalField

end Fixer

end BruhatTits

/-! ### Tame descent -/

namespace TameDescent

open ValuativeRel

/-- Fixed points of a finite group `Θ` of automorphisms of a reductive group whose order is
invertible in the field: the fixed-point functor `R ↦ G(R)^Θ` is represented by a closed subgroup
(`f` surjective) with *smooth* coordinate Hopf algebra `H'` (Edixhoven, Prop. 3.1, p. 293, for
the closed subscheme, and Prop. 3.4, p. 294, for smoothness). The fixed-point group need not be
connected (`Θ = {±1}` acting on `G_m` by inversion has fixed points `μ₂`). The action of `Θ` is
given through automorphisms of the Hopf algebra `H`. -/
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
/- The `k`-points of the fixed points of inversion on `G_m` are `{x : x⁻¹ = x} = {±1}`, which over a
field of characteristic `≠ 2` has two elements: the fixed-point group of a tame action is not
connected in general. -/
example {k : Type u} [Field k] (h2 : (2 : k) ≠ 0) :
    ¬ Subsingleton {x : kˣ // x⁻¹ = x} := by
  intro hs
  have h := congrArg (fun x : {x : kˣ // x⁻¹ = x} => ((x.val : kˣ) : k))
    (hs.elim ⟨1, inv_one⟩ ⟨-1, by simp⟩)
  simp only [Units.val_one, Units.val_neg] at h
  exact h2 (by linear_combination h)

/-- Semilinear Galois action on points of the scalar extension: a `K'`-point of `K' ⊗_K H` is a
`K`-point of `H` with values in `K'` (`TauCeti.AlgHom.baseChangePointsMulEquiv`), on which `σ` acts
through the values (`TauCeti.AlgHom.mapValue`). -/
def galoisPoints {K : Type u} [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (K' : Type u) [Field K'] [Algebra K K'] (σ : K' ≃ₐ[K] K') :
    WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) →ₐ[K'] K') →*
      WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) →ₐ[K'] K') :=
  (TauCeti.AlgHom.baseChangePointsMulEquiv (k := K) (K := K') (A := H) (R := K')).toMonoidHom.comp
    ((TauCeti.AlgHom.mapValue (H := H) σ.toAlgHom).comp
      (TauCeti.AlgHom.baseChangePointsMulEquiv (k := K) (K := K') (A := H) (R := K')).symm.toMonoidHom)

theorem galoisPoints_apply {K : Type u} [Field K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (K' : Type u) [Field K'] [Algebra K K']
    (σ : K' ≃ₐ[K] K')
    (g : WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) →ₐ[K'] K'))
    (a : H) : (galoisPoints H K' σ g).ofConv (1 ⊗ₜ[K] a) = σ (g.ofConv (1 ⊗ₜ[K] a)) := by
  simp [galoisPoints, TauCeti.AlgHom.mapValue_apply]

-- Test TameDescent.galoisPoints_one
/- Degenerate case: the identity automorphism acts trivially. -/
example {K : Type u} [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (K' : Type u)
    [Field K'] [Algebra K K']
    (g : WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) →ₐ[K'] K')) :
    galoisPoints H K' 1 g = g := by
  apply (TauCeti.AlgHom.baseChangePointsMulEquiv
    (k := K) (K := K') (A := H) (R := K')).symm.injective
  apply WithConv.ofConv_injective
  ext a
  rw [TauCeti.AlgHom.baseChangePointsMulEquiv_symm_apply,
    TauCeti.AlgHom.baseChangePointsMulEquiv_symm_apply, galoisPoints_apply]
  rfl

-- Test TameDescent.galoisPoints_rational
/- `σ` fixes the image of `G(K)` in `G(K')`: rational points are Galois-invariant. -/
example {K : Type u} [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (K' : Type u)
    [Field K'] [Algebra K K'] (σ : K' ≃ₐ[K] K') (g : WithConv (H →ₐ[K] K)) :
    galoisPoints H K' σ
        (BruhatTits.Building.pointsExtension (H := H) K' (CategoryTheory.Iso.refl _) g) =
      BruhatTits.Building.pointsExtension (H := H) K' (CategoryTheory.Iso.refl _) g := by
  apply (TauCeti.AlgHom.baseChangePointsMulEquiv
    (k := K) (K := K') (A := H) (R := K')).symm.injective
  apply WithConv.ofConv_injective
  ext a
  rw [TauCeti.AlgHom.baseChangePointsMulEquiv_symm_apply,
    TauCeti.AlgHom.baseChangePointsMulEquiv_symm_apply, galoisPoints_apply]
  simp [BruhatTits.Building.pointsExtension]

-- Test TameDescent.galoisPoints_descent
/- Galois descent of points: for `K'/K` finite Galois, the points of `G(K')` fixed by every `σ` are
exactly the rational points. -/
example {K : Type u} [Field K] (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (K' : Type u)
    [Field K'] [Algebra K K'] [FiniteDimensional K K'] [IsGalois K K']
    (g : WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) →ₐ[K'] K')) :
    (∀ σ : K' ≃ₐ[K] K', galoisPoints H K' σ g = g) ↔
      g ∈ Set.range
        (BruhatTits.Building.pointsExtension (H := H) K' (CategoryTheory.Iso.refl _)) := sorry

/-- The action of the decomposition group — the `K`-automorphisms of `K'` preserving its
valuation ring, Mathlib's `ValuationSubring.decompositionSubgroup` — on the building over `K'`,
by transport of structure (Bruhat–Tits II, 4.2.12, pp. 92–93, and 4.2.24, p. 100). An
automorphism not preserving the valuation of `K'` carries the building of `K'` to the building
for another valuation, so does not act. -/
def galoisBuilding {K : Type u} [Field K] [ValuativeRel K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (K' : Type u) [Field K'] [Algebra K K'] [ValuativeRel K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ'] :
    ValuationSubring.decompositionSubgroup K (valuation K').valuationSubring →*
      Equiv.Perm (BruhatTits.Building D' φ') := sorry

theorem galoisBuilding_smul {K : Type u} [Field K] [ValuativeRel K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (K' : Type u) [Field K'] [Algebra K K'] [ValuativeRel K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ']
    (σ : ValuationSubring.decompositionSubgroup K (valuation K').valuationSubring)
    (g : WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) →ₐ[K'] K'))
    (x : BruhatTits.Building D' φ') :
    galoisBuilding H K' D' φ' σ (BruhatTits.Building.translate D' φ' g x) =
      BruhatTits.Building.translate D' φ' (galoisPoints H K' σ g)
        (galoisBuilding H K' D' φ' σ x) := sorry

-- Test TameDescent.galoisBuilding_stabilizer
/- Transport of structure: `σ` carries the stabilizer of `x` into the stabilizer of `σ x`. -/
example {K : Type u} [Field K] [ValuativeRel K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (K' : Type u) [Field K'] [Algebra K K'] [ValuativeRel K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ']
    (σ : ValuationSubring.decompositionSubgroup K (valuation K').valuationSubring)
    (x : BruhatTits.Building D' φ')
    (g : WithConv ((TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) →ₐ[K'] K'))
    (hg : BruhatTits.Building.translate D' φ' g x = x) :
    BruhatTits.Building.translate D' φ' (galoisPoints H K' σ g) (galoisBuilding H K' D' φ' σ x) =
      galoisBuilding H K' D' φ' σ x :=
  (galoisBuilding_smul H K' D' φ' σ g x).symm.trans (congrArg _ hg)

-- Test TameDescent.galoisBuilding_rational
/- `σ` commutes with the action of the rational points `G(K) ⊆ G(K')`. -/
example {K : Type u} [Field K] [ValuativeRel K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (K' : Type u) [Field K'] [Algebra K K'] [ValuativeRel K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ']
    (σ : ValuationSubring.decompositionSubgroup K (valuation K').valuationSubring)
    (g : WithConv (H →ₐ[K] K)) (x : BruhatTits.Building D' φ') :
    galoisBuilding H K' D' φ' σ (BruhatTits.Building.translate D' φ'
        (BruhatTits.Building.pointsExtension (H := H) K' (CategoryTheory.Iso.refl _) g) x) =
      BruhatTits.Building.translate D' φ'
        (BruhatTits.Building.pointsExtension (H := H) K' (CategoryTheory.Iso.refl _) g)
        (galoisBuilding H K' D' φ' σ x) := by
  rw [galoisBuilding_smul]
  congr 1
  apply (TauCeti.AlgHom.baseChangePointsMulEquiv
    (k := K) (K := K') (A := H) (R := K')).symm.injective
  apply WithConv.ofConv_injective
  ext a
  rw [TauCeti.AlgHom.baseChangePointsMulEquiv_symm_apply,
    TauCeti.AlgHom.baseChangePointsMulEquiv_symm_apply, galoisPoints_apply]
  simp [BruhatTits.Building.pointsExtension]

-- Test TameDescent.extensionEmbedding_galois_fixed
/- For every finite Galois `K'/K`, tame or not, the image of `B(G, K)` is fixed by the Galois
group (Bruhat–Tits II, 4.2.24, p. 100); `building_eq_fixedPoints` adds the reverse inclusion
under tameness, which can fail for wild ramification (Tits, Corvallis Part 1, 2.6.1, p. 47). -/
theorem extensionEmbedding_galois_fixed {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : BruhatTits.LocalRootData K H)
    (φ : BruhatTits.Valuation D.rootDatum) [BruhatTits.GeometricValuation D φ]
    (K' : Type u) [Field K'] [Algebra K K'] [ValuativeRel K'] [ValuativeExtension K K']
    [Module.Finite K K'] [IsGalois K K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ']
    (σ : ValuationSubring.decompositionSubgroup K (valuation K').valuationSubring)
    (p : BruhatTits.Building D φ) :
    galoisBuilding H K' D' φ' σ
        (BruhatTits.Building.extensionEmbedding D φ K' (CategoryTheory.Iso.refl _) D' φ' p) =
      BruhatTits.Building.extensionEmbedding D φ K' (CategoryTheory.Iso.refl _) D' φ' p := sorry

-- Test extensionEmbedding_fixed_containment
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : BruhatTits.LocalRootData K H)
    (φ : BruhatTits.Valuation D.rootDatum) [BruhatTits.GeometricValuation D φ]
    (K' : Type u) [Field K'] [Algebra K K'] [ValuativeRel K'] [ValuativeExtension K K']
    [Module.Finite K K'] [IsGalois K K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ']
    (σ : ValuationSubring.decompositionSubgroup K (valuation K').valuationSubring)
    (p : BruhatTits.Building D φ) :
    galoisBuilding H K' D' φ' σ
        (BruhatTits.Building.extensionEmbedding D φ K' (CategoryTheory.Iso.refl _) D' φ' p) =
      BruhatTits.Building.extensionEmbedding D φ K' (CategoryTheory.Iso.refl _) D' φ' p := sorry

/-- Unramified descent for a nonarchimedean local field `E` and a maximal `Ĕ`-split torus `S'`
containing the base change of `S`: an injective `G(E)`-equivariant map `B(G, E) → B(G, Ĕ)`,
affine from the apartment of `S` into that of `S'`, whose image is the set of points fixed by the
valuation-preserving `E`-automorphisms of `Ĕ` (Bruhat–Tits II, 5.1.24–5.1.25, pp. 155–156, for the
strict henselization, 4.2.24, p. 100, for the passage to its completion `Ĕ`, and 4.2.16, p. 94,
for the central factor). -/
theorem _root_.TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits.Building.unramifiedDescent
    {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    {HE : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}
    (DE : BruhatTits.LocalRootData E HE) (φE : BruhatTits.Valuation DE.rootDatum)
    [BruhatTits.GeometricValuation DE φE]
    (D' : BruhatTits.LocalRootData (MaxUnramifiedCompletion.Breve E)
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := MaxUnramifiedCompletion.Breve E) HE))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ']
    (hS : D'.splitTorus ≤
      TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := MaxUnramifiedCompletion.Breve E) DE.splitTorus) :
    ∃ ι : BruhatTits.Building DE φE → BruhatTits.Building D' φ', Function.Injective ι ∧
      (∀ g p, ι (g • p) = BruhatTits.Building.translate D' φ' (BruhatTits.Building.pointsExtension
        (H := HE) (MaxUnramifiedCompletion.Breve E) (CategoryTheory.Iso.refl _) g) (ι p)) ∧
      (∃ f : BruhatTits.Apartment φE →ᵃ[ℝ] BruhatTits.Apartment φ', ∀ x,
        ι (BruhatTits.apartmentEmbedding DE φE x) = BruhatTits.apartmentEmbedding D' φ' (f x)) ∧
      Set.range ι = {y | ∀ σ : ValuationSubring.decompositionSubgroup E
        (valuation (MaxUnramifiedCompletion.Breve E)).valuationSubring,
          galoisBuilding HE (MaxUnramifiedCompletion.Breve E) D' φ' σ y = y} := sorry

/-- Tame descent over a henselian discretely valued field with perfect residue field: for a
finite Galois extension `K'/K` whose ramification index `e` is prime to the residue
characteristic, `B(G, K)` is the set of points of `B(G, K')` fixed by the decomposition group
(all of `Gal(K'/K)`, since `K` is henselian). The normalization equation identifies `e`.
Prasad, §4.5, p. 27, proves the descent over the maximal unramified extension of `K`, from
Theorem 3.17, p. 23, by Weil restriction; the statement over `K` follows by unramified descent
(Bruhat–Tits II, 5.1.25, p. 155). Tits, Corvallis Part 1, 2.6.1, p. 47, states it, citing
Rousseau. -/
theorem building_eq_fixedPoints {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : BruhatTits.LocalRootData K H)
    (φ : BruhatTits.Valuation D.rootDatum) [BruhatTits.GeometricValuation D φ]
    (K' : Type u) [Field K'] [Algebra K K'] [ValuativeRel K'] [ValuativeExtension K K']
    [Module.Finite K K'] [IsGalois K K']
    (D' : BruhatTits.LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : BruhatTits.Valuation D'.rootDatum) [BruhatTits.GeometricValuation D' φ']
    (e : ℕ)
    (_hnorm : ∀ u : Kˣ, Multiplicative.toAdd (BruhatTits.normalizedOrder (K := K')
      (Units.map (algebraMap K K').toMonoidHom u)) =
        (e : ℤ) * Multiplicative.toAdd (BruhatTits.normalizedOrder (K := K) u))
    (_htame : ¬ ringChar 𝓀[K] ∣ e) :
    Set.range (BruhatTits.Building.extensionEmbedding D φ K' (CategoryTheory.Iso.refl _) D' φ') =
      {y | ∀ σ : ValuationSubring.decompositionSubgroup K (valuation K').valuationSubring,
        galoisBuilding H K' D' φ' σ y = y} := sorry

-- Test TameDescent.unramified_degree_p_is_tame
/- An unramified extension has `e = 1`, so it satisfies the tameness hypothesis `p ∤ e` whatever
its degree, even degree `p = char 𝓀[K]`; tameness is not `p ∤ [K' : K]`. -/
example {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    ¬ ringChar 𝓀[K] ∣ 1 ∧ ringChar 𝓀[K] ∣ ringChar 𝓀[K] :=
  ⟨fun h => CharP.ringChar_ne_one (Nat.dvd_one.mp h), dvd_refl _⟩

end TameDescent

/-! ### Twisted Levi subgroups -/

namespace TwistedLevi

open ValuativeRel BruhatTits

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- A closed subgroup of `G`, given by its Hopf ideal `I`, is a twisted Levi subgroup if after a
finite extension `K'/K` it is the centralizer of a split subtorus of a maximal `K'`-split torus,
i.e. a Levi subgroup of a `K'`-parabolic (Fintzen, Def. 3.3, p. 9). -/
def IsTwistedLevi (I : TauCeti.HopfIdeal K H) : Prop :=
  ∃ (K' : Type u) (_ : Field K') (_ : Algebra K K') (_ : FiniteDimensional K K')
    (D' : LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (M : Building.LeviDatum D'),
    TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := K') I = GeometricRoots.centralizerIdeal M.subtorus

/-- A twisted Levi subgroup is tame if the extension can be chosen Galois with ramification index
`e` prime to the residue characteristic (read off from the normalized orders); the residue field
being perfect, this is tame ramification. Fintzen, Def. 3.3, p. 9, defines twisted Levi subgroups
with no tameness condition; by Rem. 3.9, p. 11, every twisted Levi subgroup is tame when the tori
of `G` split over tamely ramified extensions. -/
def IsTame [ValuativeRel K] [ModelField K] (I : TauCeti.HopfIdeal K H) : Prop :=
  ∃ (K' : Type u) (_ : Field K') (_ : Algebra K K') (_ : FiniteDimensional K K')
    (_ : IsGalois K K') (_ : ValuativeRel K') (_ : ValuativeExtension K K')
    (_ : ValuativeRel.IsDiscrete K') (_ : ValuativeRel.IsNontrivial K')
    (_ : ValuativeRel.IsRankLeOne K') (e : ℕ),
    (∀ u : Kˣ, Multiplicative.toAdd (normalizedOrder (K := K')
        (Units.map (algebraMap K K').toMonoidHom u)) =
      (e : ℤ) * Multiplicative.toAdd (normalizedOrder (K := K) u)) ∧
    ¬ ringChar 𝓀[K] ∣ e ∧
    ∃ (D' : LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
      (M : Building.LeviDatum D'),
      TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := K') I = GeometricRoots.centralizerIdeal M.subtorus

/-- A `K`-Levi subgroup is a twisted Levi subgroup. -/
theorem of_isLevi (D : LocalRootData K H) (M : Building.LeviDatum D) :
    IsTwistedLevi (GeometricRoots.centralizerIdeal M.subtorus) := sorry

/-- The centralizer of a `K`-torus of a reductive group is a twisted Levi subgroup. -/
theorem centralizer_torus (hH : TauCeti.reductiveCommHopfAlgProperty K H)
    (J : TauCeti.HopfIdeal K H)
    (hJ : TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H J)) :
    IsTwistedLevi (GeometricRoots.centralizerIdeal J) := sorry

/-- Twisted Levi subgroups are stable under finite base change. -/
theorem baseChange (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L]
    (I : TauCeti.HopfIdeal K H) (hI : IsTwistedLevi I) :
    IsTwistedLevi (H := TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := L) H)
      (TauCeti.CommHopfAlgCat.baseChangeHopfIdeal (K := L) I) := sorry

-- Test TwistedLevi.tame_isTwistedLevi
/- A tame twisted Levi subgroup is a twisted Levi subgroup. -/
example [ValuativeRel K] [ModelField K] (I : TauCeti.HopfIdeal K H) (hI : IsTame I) :
    IsTwistedLevi I := by
  obtain ⟨K', i₁, i₂, i₃, -, -, -, -, -, -, -, -, -, D', M, h⟩ := hI
  exact ⟨K', i₁, i₂, i₃, D', M, h⟩

-- Test TwistedLevi.levi_isTame
/- A `K`-Levi subgroup is tame: take `K' = K`, with `e = 1`. -/
example [ValuativeRel K] [ModelField K] (D : LocalRootData K H) (M : Building.LeviDatum D) :
    IsTame (GeometricRoots.centralizerIdeal M.subtorus) := sorry

-- Test TwistedLevi.wild_not_tame (non-example)
/- In `GL₂` over a local field of residue characteristic `2`, the torus `E'^×` of a ramified
quadratic extension `E'/E` is a twisted Levi subgroup, split only by extensions containing `E'`,
whose ramification index is even: it is not tame. -/
example [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (h2 : ringChar 𝓀[K] = 2) :
    ∃ J : TauCeti.HopfIdeal K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2),
      IsTwistedLevi J ∧ ¬ IsTame J := sorry

-- Test TwistedLevi.whole_group
/- `G` itself (the zero Hopf ideal) is a twisted Levi subgroup of a reductive `G`. -/
example (hH : TauCeti.reductiveCommHopfAlgProperty K H) :
    IsTwistedLevi (⊥ : TauCeti.HopfIdeal K H) := sorry

-- Test TwistedLevi.maximalTorus
/- Every maximal `K`-torus of a reductive group is a twisted Levi subgroup. -/
example (hH : TauCeti.reductiveCommHopfAlgProperty K H) (J : TauCeti.HopfIdeal K H)
    (hJ : Minimal (fun I : TauCeti.HopfIdeal K H =>
      TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H I)) J) :
    IsTwistedLevi J := sorry

-- Test TwistedLevi.elliptic_not_levi (non-example)
/- In `GL₂` over a local field, an elliptic maximal torus `E'^×` (`E'/E` quadratic) is a twisted
Levi subgroup but is not the centralizer of a split subtorus of any maximal split torus. -/
example [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    ∃ J : TauCeti.HopfIdeal K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2),
      IsTwistedLevi J ∧ ∀ (D : LocalRootData K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2))
        (M : Building.LeviDatum D), J ≠ GeometricRoots.centralizerIdeal M.subtorus := sorry

end TwistedLevi

/-! ### Toral embeddings into the `GL` building -/

namespace GLBuilding

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
  {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} {n : ℕ}

/-- Equivariant toral embeddings into the `GL_n` building (Landvogt, as recalled in KP18 §1.2.1,
p. 131): for a faithful representation `G → GL_n`, given by a surjective map `f` of coordinate Hopf
algebras and acting on rational points through `ρ = pointsMulEquiv ∘ pointsMap f`, there is an
injective `G(K)`-equivariant map `ι` from the building of `G` to the splittable norms on `Kⁿ`; it is
toral: for some `h ∈ GL_n(K)` such that `h⁻¹ ρ(S(K)) h` is diagonal, `ι` maps the apartment of `S`
affinely (through `A`) into the apartment `h · {α_w}` of the torus `h T h⁻¹`, where
`α_w(z) = minᵢ (ω(zᵢ) + wᵢ)`. -/
theorem exists_toralEmbedding (D : BruhatTits.LocalRootData K H)
    (φ : BruhatTits.Valuation D.rootDatum) [BruhatTits.GeometricValuation D φ]
    (f : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n ⟶ H)
    (hf : Function.Surjective f.hom.hom) :
    ∃ ι : BruhatTits.Building D φ → SplittableNorm K n, Function.Injective ι ∧
      (∀ g p, ι (g • p) =
        TauCeti.GeneralLinear.pointsMulEquiv n (BruhatTits.Building.pointsMap f g) • ι p) ∧
      ∃ (h : Matrix.GeneralLinearGroup (Fin n) K) (A : D.V →ᵃ[ℝ] (Fin n → ℝ)),
        (∀ s ∈ BruhatTits.subgroupPoints D.splitTorus K, ∀ i j, i ≠ j →
          (h⁻¹ * TauCeti.GeneralLinear.pointsMulEquiv n (BruhatTits.Building.pointsMap f s) *
            h).1 i j = 0) ∧
        ∀ (x : BruhatTits.Apartment φ) (z : Fin n → K),
          (ι (BruhatTits.apartmentEmbedding D φ x)).toFun (Matrix.mulVec h.1 z) =
            ⨅ i, ω K (z i) + (A x.displacement i : WithTop ℝ) := sorry

-- Test GLBuilding.abstract_rep_not_toral (non-example)
/- In rank one a matrix `(u)` with `ω(u) = 0` fixes every norm. For `K = 𝔽_q((u))` the group
`K^× ≅ ℤ × 𝔽_q^× × ℤ_p^ℕ` embeds as an abstract group into `𝒪[K]^× ≅ 𝔽_q^× × ℤ_p^ℕ`; through such
an embedding `K^×` would act trivially on `SplittableNorm K 1`, while it acts on the building `ℝ`
of `G_m` by the translations `−ω`, so no injective equivariant map exists. Hence
`exists_toralEmbedding` takes an algebraic representation, not a homomorphism of rational points. -/
example (α : SplittableNorm K 1) (g : Matrix.GeneralLinearGroup (Fin 1) K)
    (hg : ω K (g.1 0 0) = 0) : g • α = α := sorry

-- Test GLBuilding.toral_identity
/- For the identity representation of `GL_n` the conclusion of `exists_toralEmbedding` holds with
`ι = buildingEquiv n`, `h = 1` and `A = standardCoordinates n`. -/
example :
    Function.Injective (buildingEquiv (K := K) n) ∧
      (∀ (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n →ₐ[K] K))
          (p : BruhatTits.Building (standardData (K := K) n) (standardValuation n)),
        buildingEquiv n (g • p) =
          TauCeti.GeneralLinear.pointsMulEquiv n (BruhatTits.Building.pointsMap
            (𝟙 (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)) g) •
            buildingEquiv n p) ∧
      (∀ s ∈ BruhatTits.subgroupPoints (standardData (K := K) n).splitTorus K, ∀ i j, i ≠ j →
        ((1 : Matrix.GeneralLinearGroup (Fin n) K)⁻¹ *
          TauCeti.GeneralLinear.pointsMulEquiv n (BruhatTits.Building.pointsMap
            (𝟙 (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)) s) * 1).1 i j = 0) ∧
      ∀ (x : BruhatTits.Apartment (standardValuation (K := K) n)) (z : Fin n → K),
        (buildingEquiv n (BruhatTits.apartmentEmbedding (standardData n) (standardValuation n)
            x)).toFun (Matrix.mulVec (1 : Matrix.GeneralLinearGroup (Fin n) K).1 z) =
          ⨅ i, ω K (z i) +
            ((standardCoordinates n).toLinearMap.toAffineMap x.displacement i : WithTop ℝ) := by
  refine ⟨(buildingEquiv n).injective, fun g p => buildingEquiv_smul n g p,
    fun s hs i j hij => ?_, fun x z => ?_⟩
  · simp only [inv_one, one_mul, mul_one]
    exact (standardData_torus n K s).1 hs i j hij
  · simp only [Units.val_one, Matrix.one_mulVec]
    exact buildingEquiv_apartment n x z

end GLBuilding

/-! ## Layer RG2.3: Parahoric and congruence group schemes

Declarations of the first half of layer RG2.3. An affine group scheme over `𝒪[K]` is a finite-type
commutative Hopf `𝒪[K]`-algebra; its special fibre is the base change to `𝓀[K]`. The definitions of
smooth models make sense over the valuation ring of any valued field; theorems that use a discrete
valuation ring carry `ValuativeRel.IsDiscrete`, `ValuativeRel.IsNontrivial` and
`ValuativeRel.IsRankLeOne`. Statements about points over a strictly henselian base are stated over
`𝒪[K]` with `HenselianLocalRing 𝒪[K]` and `IsSepClosed 𝓀[K]`. The Néron models that are not affine
are stated as Mathlib schemes. -/

/-! ### Smooth affine integral models -/

namespace IntegralModel

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K]

/-- A smooth affine `𝒪[K]`-model of `G = Spec H`: a smooth finite-type commutative Hopf
`𝒪[K]`-algebra with a Hopf isomorphism of its generic fibre with `H`. -/
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

/-- The integral points `𝒢(𝒪) ⊆ G(K)`. -/
def integralPoints (𝒢 : SmoothModel H) : Subgroup (WithConv (H →ₐ[K] K)) := sorry

/-- `g ∈ 𝒢(𝒪)` iff `g` is integral on every coordinate of `A`, transported to `H` through the
generic-fibre identification. -/
theorem mem_integralPoints_iff (𝒢 : SmoothModel H) (g : WithConv (H →ₐ[K] K)) :
    g ∈ 𝒢.integralPoints ↔ ∀ a : 𝒢.A, ∃ o : 𝒪[K],
      g.ofConv (𝒢.genericFibre.hom.hom ((1 : K) ⊗ₜ[𝒪[K]] a)) = o := sorry

/-- Morphisms of models `𝒢' → 𝒢` over the identity of `G`, written contravariantly as Hopf maps
`𝒢.A ⟶ 𝒢'.A` compatible with the generic-fibre identifications. -/
def Hom (𝒢 𝒢' : SmoothModel H) : Type u :=
  {f : 𝒢.A ⟶ 𝒢'.A //
    TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) f ≫ 𝒢'.genericFibre.hom =
      𝒢.genericFibre.hom}

instance (𝒢 𝒢' : SmoothModel H) : Subsingleton (Hom 𝒢 𝒢') := sorry

/-- Both the generic and special fibres are geometrically connected. -/
def HasConnectedFibres (𝒢 : SmoothModel H) : Prop :=
  TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj ∧
    TauCeti.geometricallyConnectedCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre.obj

/-- The identity component `𝒢°` over the discrete valuation ring `𝒪[K]`, for `G` connected: the
open subgroup scheme of `𝒢` with generic fibre `G` and special fibre `(𝒢_κ)°` (Bruhat–Tits II,
1.2.12, pp. 19–20). It is affine: it is obtained from the affine scheme `𝒢` by removing finitely
many open and closed parts of the special fibre (Bruhat–Tits II, Lemma 2.2.6, p. 46, as in the
proof of 2.2.5 (iii), p. 45). For
disconnected `G` the identity component of a model of `G` has generic fibre `G° ≠ G`, so it is not a
model of `H`: the connectedness of `G` is a hypothesis. -/
def identityComponent [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] (𝒢 : SmoothModel H)
    (_hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) : SmoothModel H := sorry

section DVR

variable [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]

theorem hasConnectedFibres_identityComponent (𝒢 : SmoothModel H)
    (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    (𝒢.identityComponent hG).HasConnectedFibres := sorry

/-- `𝒢°` is the largest model with connected fibres mapping to `𝒢`: a model `𝒢'` with connected
fibres maps to `𝒢°` exactly when it maps to `𝒢`. With `hasConnectedFibres_identityComponent` this
determines `𝒢°` up to unique isomorphism of models. -/
theorem nonempty_hom_identityComponent_iff (𝒢 : SmoothModel H)
    (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) (𝒢' : SmoothModel H)
    (h𝒢' : 𝒢'.HasConnectedFibres) :
    Nonempty (Hom (𝒢.identityComponent hG) 𝒢') ↔ Nonempty (Hom 𝒢 𝒢') := sorry

theorem integralPoints_identityComponent_le (𝒢 : SmoothModel H)
    (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    (𝒢.identityComponent hG).integralPoints ≤ 𝒢.integralPoints := sorry

/-- `𝒢°(𝒪)` has finite index in `𝒢(𝒪)` for every residue field: the quotient embeds in the
finite group `π₀(𝒢_κ)(κ)` of rational points of the component group of the special fibre. -/
theorem integralPoints_identityComponent_finiteIndex (𝒢 : SmoothModel H)
    (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    ((𝒢.identityComponent hG).integralPoints.subgroupOf 𝒢.integralPoints).FiniteIndex := sorry

end DVR

-- Test IntegralModel.SmoothModel.identityComponent_disconnected (non-example)
/- A disconnected generic fibre excludes geometrically connected fibres. -/
example (𝒢 : SmoothModel H) (hH : ¬ TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    ¬ 𝒢.HasConnectedFibres := fun h => hH h.1

-- Test IntegralModel.SmoothModel.generalLinear
/- The `GL_n` coordinate Hopf algebra over `𝒪[K]` is a smooth model of `GL_n` whose integral
points are the integral matrices with integral inverse. -/
example (n : ℕ) :
    ∃ 𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n),
      𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n ∧
      ∀ g, g ∈ 𝒢.integralPoints ↔
        (∀ i j, ∃ o : 𝒪[K],
          (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) K) i j = o) ∧
        (∀ i j, ∃ o : 𝒪[K],
          (TauCeti.GeneralLinear.pointsMulEquiv n g⁻¹ : Matrix (Fin n) (Fin n) K) i j = o) :=
  sorry

-- Test IntegralModel.SmoothModel.generalLinear_specialFibre
/- The special fibre of the standard `GL_n` model is `GL_n` over the residue field. -/
example (n : ℕ) (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (h : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n) :
    Nonempty (𝒢.specialFibre ≅ TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝓀[K] n) :=
  sorry

-- Test IntegralModel.SmoothModel.integral_inverse (non-example)
/- Integral entries alone do not make an integral point: in `GL_1`, a matrix whose entry has
valuation `< 1` has integral entries but is not in `𝒢(𝒪)`, because its inverse is not integral.
Every model with the `GL_1` coordinate algebra has the same integral points, since the only Hopf
automorphisms of `G_m` are `t ↦ t^{±1}`. -/
example (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1))
    (h𝒢 : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] 1)
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K 1 →ₐ[K] K))
    (hg : valuation K ((TauCeti.GeneralLinear.pointsMulEquiv 1 g : Matrix (Fin 1) (Fin 1) K) 0 0) < 1) :
    (∃ o : 𝒪[K], (TauCeti.GeneralLinear.pointsMulEquiv 1 g : Matrix (Fin 1) (Fin 1) K) 0 0 = o) ∧
      g ∉ 𝒢.integralPoints :=
  ⟨⟨⟨_, (Valuation.mem_integer_iff _ _).2 hg.le⟩, rfl⟩, sorry⟩

-- Test IntegralModel.SmoothModel.trivial
/- The trivial group has the unique smooth model `𝒪`, with a single integral point. -/
example (𝒢 : SmoothModel (TauCeti.FiniteTypeCommHopfAlgCat.of K K)) :
    Nonempty (𝒢.A ≅ TauCeti.FiniteTypeCommHopfAlgCat.of 𝒪[K] 𝒪[K]) ∧ 𝒢.integralPoints = ⊥ := sorry

-- Test IntegralModel.SmoothModel.hom_integralPoints
/- A morphism of models `𝒢' → 𝒢` over the identity carries `𝒢'(𝒪)` into `𝒢(𝒪)`. -/
example (𝒢 𝒢' : SmoothModel H) (f : Hom 𝒢 𝒢') : 𝒢'.integralPoints ≤ 𝒢.integralPoints := sorry

-- Test IntegralModel.SmoothModel.integralPoints_compat
/- Over a local field the integral points are compact open (RG2.0). -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (𝒢 : SmoothModel H) :
    letI := PointTopology.instTopologicalSpaceWithConv K H K
    IsCompact (𝒢.integralPoints : Set (WithConv (H →ₐ[K] K))) ∧
      IsOpen (𝒢.integralPoints : Set (WithConv (H →ₐ[K] K))) := sorry

-- Test IntegralModel.SmoothModel.not_smooth_rootsOfUnity
/- `𝒪[X]/(X^p - 1)` is flat with generic fibre `μ_p` but not smooth over `𝒪` in residue
characteristic `p`. -/
example (p : ℕ) (hp : p.Prime) (hchar : ringChar 𝓀[K] = p) :
    ¬ Algebra.Smooth 𝒪[K] (Polynomial 𝒪[K] ⧸ Ideal.span {(Polynomial.X : Polynomial 𝒪[K]) ^ p - 1}) := sorry

-- Test IntegralModel.SmoothModel.hasConnectedFibres_generalLinear
/- Both fibres of the standard `GL_n` model, `GL_{n,K}` and `GL_{n,𝓀}`, are connected. -/
example (n : ℕ) (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (h : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n) :
    𝒢.HasConnectedFibres := sorry

-- Test IntegralModel.SmoothModel.identityComponent_generalLinear
/- The standard `GL_n` model has connected fibres, so it is its own identity component: there are
morphisms of models in both directions. -/
example [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    (n : ℕ) (𝒢 : SmoothModel (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n))
    (h : 𝒢.A = TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n)
    (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K
      (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n).obj) :
    Nonempty (Hom (𝒢.identityComponent hG) 𝒢) ∧ Nonempty (Hom 𝒢 (𝒢.identityComponent hG)) := sorry

/-- A reductive model has connected reductive generic and special fibres. -/
def IsReductive (𝒢 : SmoothModel H) : Prop :=
  TauCeti.reductiveCommHopfAlgProperty 𝓀[K] 𝒢.specialFibre ∧
    TauCeti.reductiveCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K) 𝒢.A)

/-- Over the discrete valuation ring `𝒪[K]`, testing the two fibres is testing every geometric
fibre: `𝒢` is reductive iff it is a reductive group scheme over `𝒪[K]` (smooth with connected
reductive geometric fibres; B. Conrad, *Reductive group schemes*, Definition 3.1.1), the
condition of Tau Ceti's `TauCeti.reductiveCommHopfAlgPropertyOver`. -/
theorem isReductive_iff_fibres [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] (𝒢 : SmoothModel H) :
    𝒢.IsReductive ↔ ∀ (k : Type u) [Field k] [Algebra 𝒪[K] k] [IsAlgClosed k],
      TauCeti.reductiveCommHopfAlgProperty k
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := k) 𝒢.A) := sorry

theorem IsReductive.hasConnectedFibres {𝒢 : SmoothModel H} (h : 𝒢.IsReductive) :
    𝒢.HasConnectedFibres := sorry

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

-- Test IntegralModel.SmoothModel.splitTorus_isReductive
/- The split torus `G_m^r` over `𝒪` is reductive, and `(𝒪^×)^r` is the unique hyperspecial
subgroup of `(K^×)^r`. -/
example [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    (r : ℕ)
    (𝒯 : SmoothModel (TauCeti.DiagonalizableGroup.coordinateRing K
      (TauCeti.SplitTorus.characterGroup (ULift.{u} (Fin r)))))
    (h : 𝒯.A = TauCeti.DiagonalizableGroup.coordinateRing 𝒪[K]
      (TauCeti.SplitTorus.characterGroup (ULift.{u} (Fin r))))
    (P : Subgroup (WithConv (TauCeti.DiagonalizableGroup.coordinateRing K
      (TauCeti.SplitTorus.characterGroup (ULift.{u} (Fin r))) →ₐ[K] K))) :
    𝒯.IsReductive ∧ (IsHyperspecialSubgroup P ↔ P = 𝒯.integralPoints) ∧
      ∀ t, t ∈ 𝒯.integralPoints ↔
        ∀ i, ∃ v : 𝒪[K]ˣ, ((TauCeti.SplitTorus.pointsMulEquiv t i : Kˣ) : K) = ((v : 𝒪[K]) : K) :=
  sorry

/-- The extension principle: a `K`-homomorphism `f : G → G'` extends to the smooth models iff it
carries integral points into integral points, over a strictly henselian discrete valuation ring.
Bruhat–Tits II, 1.7.3 c) and Proposition 1.7.6, pp. 38–39. -/
theorem extend_iff [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] [HenselianLocalRing 𝒪[K]] [IsSepClosed 𝓀[K]]
    {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (𝒢 : SmoothModel H) (𝒢' : SmoothModel H') (f : H' ⟶ H) :
    (∃ F : 𝒢'.A ⟶ 𝒢.A,
      TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) F ≫ 𝒢.genericFibre.hom =
        𝒢'.genericFibre.hom ≫ f) ↔
      ∀ g ∈ 𝒢.integralPoints, BruhatTits.Building.pointsMap f g ∈ 𝒢'.integralPoints := sorry

/-- Over a strictly henselian discrete valuation ring a smooth model is determined, up to unique
isomorphism of models, by its integral points (Bruhat–Tits II, 1.7.6, p. 39). -/
theorem eq_of_integralPoints_eq [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K]
    [ValuativeRel.IsRankLeOne K] [HenselianLocalRing 𝒪[K]] [IsSepClosed 𝓀[K]]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
    (𝒢 𝒢' : SmoothModel H) (h : 𝒢.integralPoints = 𝒢'.integralPoints) :
    Nonempty (SmoothModel.Hom 𝒢 𝒢') ∧ Nonempty (SmoothModel.Hom 𝒢' 𝒢) :=
  sorry

/-- Prasad–Yu, Corollary 1.3 (arXiv math/0405381, p. 2), in the case `char 𝓀 ≠ 2`: a homomorphism
from a reductive model to an affine finite-type `𝒪`-group whose generic fibre is a closed immersion
is a closed immersion. -/
theorem surjective_of_reductive_of_generic [ValuativeRel.IsDiscrete K]
    [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K] (h2 : (2 : 𝓀[K]) ≠ 0)
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H) (h𝒢 : 𝒢.IsReductive)
    (ℋ : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝒪[K]) (φ : ℋ ⟶ 𝒢.A)
    (hgen : Function.Surjective (TauCeti.FiniteTypeCommHopfAlgCat.baseChangeMap (K := K) φ).hom.hom) :
    Function.Surjective φ.hom.hom := sorry

/-- Every smooth affine model over the discrete valuation ring `𝒪[K]` admits a closed immersion
into some `GL_n` over `𝒪[K]`. -/
theorem exists_closedImmersion_generalLinear [ValuativeRel.IsDiscrete K]
    [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (𝒢 : SmoothModel H) :
    ∃ (n : ℕ) (ρ : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] n ⟶ 𝒢.A),
      Function.Surjective ρ.hom.hom := sorry

end IntegralModel

/-! ### Schematic closure -/

namespace SchematicClosure

variable (O : Type u) [CommRing O] (K : Type u) [Field K] [Algebra O K]
  (A : Type u) [CommRing A] [Algebra O A]

/-- `I^♮`, the preimage of `I ⊆ K ⊗_O A` in `A`. When `O` is a domain with fraction field `K` and
`I = 0`, it is the `O`-torsion ideal of `A` (Mathlib's `Submodule.torsion O A`, Tau Ceti's
`TauCeti.scalarTorsionIdeal O A`); here `I` is the ideal of an arbitrary closed subscheme of the
generic fibre. -/
def closureIdeal (I : Ideal (K ⊗[O] A)) : Ideal A :=
  I.comap (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A)

/-- The coordinate ring `A / I^♮` of the schematic closure. -/
def closure (I : Ideal (K ⊗[O] A)) : Type u := A ⧸ closureIdeal O K A I

instance (I : Ideal (K ⊗[O] A)) : CommRing (closure O K A I) :=
  inferInstanceAs (CommRing (A ⧸ closureIdeal O K A I))

instance (I : Ideal (K ⊗[O] A)) : Algebra O (closure O K A I) :=
  inferInstanceAs (Algebra O (A ⧸ closureIdeal O K A I))

/-- The generic fibre of the closure is `(K ⊗ A) / I`: the canonical map
`k ⊗ (a mod I^♮) ↦ (k ⊗ a) mod I` is bijective. -/
def closure_genericFibre [IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O K]
    [Module.Flat O A] (I : Ideal (K ⊗[O] A)) :
    K ⊗[O] closure O K A I ≃ₐ[K] (K ⊗[O] A) ⧸ I :=
  AlgEquiv.ofBijective
    (Algebra.TensorProduct.lift (Algebra.ofId K _)
      (Ideal.Quotient.liftₐ (closureIdeal O K A I)
        ((Ideal.Quotient.mkₐ O I).comp Algebra.TensorProduct.includeRight)
        (fun _ ha => (Ideal.Quotient.eq_zero_iff_mem).2 ha))
      (fun _ _ => Commute.all _ _)) sorry

section DVR

variable [IsDomain O] [IsDiscreteValuationRing O] [IsFractionRing O K]

theorem closure_flat [Module.Flat O A] (I : Ideal (K ⊗[O] A)) : Module.Flat O (closure O K A I) :=
  sorry

theorem closure_unique [Module.Flat O A] (I : Ideal (K ⊗[O] A)) (J : Ideal A)
    (hJ : Module.Flat O (A ⧸ J))
    (hI : J.map (Algebra.TensorProduct.includeRight : A →ₐ[O] K ⊗[O] A) = I) :
    J = closureIdeal O K A I := sorry

/-- The closure of a closed subgroup is a closed subgroup scheme: if `I` is a Hopf ideal of
`K ⊗_O B` for a commutative Hopf `O`-algebra `B`, then `I^♮` is a Hopf ideal of `B`
(Bruhat–Tits II, 1.2.7, p. 18). -/
theorem closureIdeal_isHopfIdeal (B : Type u) [CommRing B] [HopfAlgebra O B]
    (I : TauCeti.HopfIdeal K (K ⊗[O] B)) :
    ∃ J : TauCeti.HopfIdeal O B, J.toIdeal = closureIdeal O K B I.toIdeal := sorry

/-- For an `O`-algebra map into a flat domain, `x` kills `I^♮` iff its generic fibre kills `I`. -/
theorem mem_closure_points (I : Ideal (K ⊗[O] A)) (O' : Type u) [CommRing O'] [IsDomain O']
    [Algebra O O'] [Module.Flat O O'] (x : A →ₐ[O] O') :
    (∀ a ∈ closureIdeal O K A I, x a = 0) ↔
      ∀ b ∈ I, Algebra.TensorProduct.map (AlgHom.id O K) x b = 0 := sorry

-- Test SchematicClosure.closureIdeal_bot
example [Module.Flat O A] : closureIdeal O K A ⊥ = ⊥ := sorry

-- Test SchematicClosure.closure_diagonalTorus
/- In `GL_n` over `O`, the closure of the diagonal torus of the generic fibre is cut out by the
off-diagonal entries. -/
example (n : ℕ) :
    closureIdeal O K (TauCeti.GeneralLinear.CoordinateRing O n)
        (Ideal.span {b | ∃ i j : Fin n, i ≠ j ∧
          b = (1 : K) ⊗ₜ[O] TauCeti.GeneralLinear.localizedGenericMatrix O n i j}) =
      Ideal.span {a | ∃ i j : Fin n, i ≠ j ∧ a = TauCeti.GeneralLinear.localizedGenericMatrix O n i j} :=
  sorry

-- Test SchematicClosure.closure_nonIntegralPoint
/- For `A = O[X]` and `I = (X - ϖ⁻¹)`, the closure `O[X]/(ϖX - 1)` has empty special fibre. -/
example (ϖ : O) (hϖ : Irreducible ϖ) (k : Type u) [Field k] [Algebra O k]
    (hk : algebraMap O k ϖ = 0) :
    IsEmpty (closure O K (Polynomial O)
      (Ideal.span {(1 : K) ⊗ₜ[O] Polynomial.X - (algebraMap O K ϖ)⁻¹ ⊗ₜ[O] (1 : Polynomial O)})
        →ₐ[O] k) := sorry

-- Test SchematicClosure.closure_genericFibre_tmul
/- The identification of the generic fibre is the canonical map on pure tensors. -/
example [Module.Flat O A] (I : Ideal (K ⊗[O] A)) (k : K) (a : A) :
    closure_genericFibre O K A I
        (k ⊗ₜ[O] (Ideal.Quotient.mk (closureIdeal O K A I) a : closure O K A I)) =
      Ideal.Quotient.mk I (k ⊗ₜ[O] a) := by
  erw [AlgEquiv.ofBijective_apply, Algebra.TensorProduct.lift_tmul]
  change algebraMap K _ k * Ideal.Quotient.mk I ((1 : K) ⊗ₜ[O] a) = _
  rw [← Ideal.Quotient.mk_algebraMap, ← map_mul, Algebra.TensorProduct.algebraMap_apply,
    Algebra.TensorProduct.tmul_mul_tmul, mul_one, one_mul]
  rfl

-- Test SchematicClosure.closureIdeal_bot_eq_torsion
/- Without flatness, the closure of the zero ideal is the `O`-torsion of `A`: for
`A = O × O/(ϖ)` it is the factor `O/(ϖ)`, not `0`. -/
example : ((closureIdeal O K A ⊥ : Ideal A) : Set A) = (Submodule.torsion O A : Set A) := sorry

end DVR

end SchematicClosure

/-! ### Néron models of tori -/

namespace NeronModel

open ValuativeRel AlgebraicGeometry

variable {K : Type u} [Field K] [ValuativeRel K]

/-- The Néron lft group scheme of a torus over the discrete valuation ring `𝒪[K]`.
BLR, Néron Models, §10.2, Theorem 2, p. 297; Jordan–Ribet–Scholl §1.1, p. 4;
BT II 4.4.12–4.4.14. -/
def lftGroup [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (_hT : TauCeti.torusCommHopfAlgProperty K H) :
    Grp (Over (Spec (CommRingCat.of 𝒪[K]))) := sorry

/-- The finite-type open Néron model, retaining the torsion components. -/
def ft [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K) (_hT : TauCeti.torusCommHopfAlgProperty K H) :
    IntegralModel.SmoothModel H := sorry


variable [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]

abbrev lft (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hT : TauCeti.torusCommHopfAlgProperty K H) : Scheme.{u} := (lftGroup H hT).X.left

variable (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
  (hTorus : TauCeti.torusCommHopfAlgProperty K H)

abbrev lftStructure : lft H hTorus ⟶ Spec (CommRingCat.of 𝒪[K]) := (lftGroup H hTorus).X.hom

instance lft_smooth : AlgebraicGeometry.Smooth (lftStructure H hTorus) := sorry
instance lft_separated : IsSeparated (lftStructure H hTorus) := sorry
instance lft_locallyOfFiniteType : LocallyOfFiniteType (lftStructure H hTorus) := inferInstance

/-- The generic fibre is the original torus as a group object over Spec K. -/
def genericFibreGroupIso :
    (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap 𝒪[K] K)))).mapGrp.obj
      (lftGroup H hTorus) ≅
      (AlgebraicGeometry.hopfSpec (CommRingCat.of K)).obj (Opposite.op H.obj) := sorry

/-- The open generic fibre of the Néron model, with its identification with the torus. -/
def genericFibre : Spec (CommRingCat.of (H : Type u)) ⟶ lft H hTorus := sorry

theorem genericFibre_group_compat :
    (genericFibreGroupIso H hTorus).inv.hom.hom.left ≫
      Limits.pullback.fst (lftStructure H hTorus)
        (Spec.map (CommRingCat.ofHom (algebraMap 𝒪[K] K))) = genericFibre H hTorus := sorry

theorem genericFibre_isPullback :
    IsPullback (genericFibre H hTorus)
      (Spec.map (CommRingCat.ofHom (algebraMap K (H : Type u))))
      (lftStructure H hTorus) (Spec.map (CommRingCat.ofHom (algebraMap 𝒪[K] K))) := sorry

/-- Full Néron mapping property, on every smooth scheme over the base.
The displayed restriction is the geometric pullback map, not an arbitrary bijection. -/
theorem mappingProperty (Y : Scheme.{u}) (p : Y ⟶ Spec (CommRingCat.of 𝒪[K])) [Smooth p]
    (f : Limits.pullback p (Spec.map (CommRingCat.ofHom (algebraMap 𝒪[K] K))) ⟶ lft H hTorus)
    (hf : f ≫ lftStructure H hTorus =
      Limits.pullback.fst p (Spec.map (CommRingCat.ofHom (algebraMap 𝒪[K] K))) ≫ p) :
    ∃! g : Y ⟶ lft H hTorus, g ≫ lftStructure H hTorus = p ∧
      Limits.pullback.fst p (Spec.map (CommRingCat.ofHom (algebraMap 𝒪[K] K))) ≫ g = f := sorry

/-- Restriction to the generic fibre on smooth affine test schemes is bijective. -/
def lftMappingProperty (B : Type u) [CommRing B] [Algebra 𝒪[K] B] [Algebra.Smooth 𝒪[K] B] :
    SchemePointTopology.Points (lftStructure H hTorus) B ≃ (H →ₐ[K] K ⊗[𝒪[K]] B) := sorry

theorem lftMappingProperty_restrict (B : Type u) [CommRing B] [Algebra 𝒪[K] B]
    [Algebra.Smooth 𝒪[K] B] (x : SchemePointTopology.Points (lftStructure H hTorus) B) :
    Spec.map (CommRingCat.ofHom (lftMappingProperty H hTorus B x).toRingHom) ≫
      genericFibre H hTorus =
      Spec.map (CommRingCat.ofHom (Algebra.TensorProduct.includeRight :
        B →ₐ[𝒪[K]] K ⊗[𝒪[K]] B).toRingHom) ≫ x.val := sorry

/-- Integral points of the lft model are all rational points of the torus. -/
def lft_integralPoints : SchemePointTopology.Points (lftStructure H hTorus) 𝒪[K] ≃
    (H →ₐ[K] K) := sorry

/-- This equivalence is restriction along the generic point of the base. -/
theorem lft_integralPoints_restrict
    (x : SchemePointTopology.Points (lftStructure H hTorus) 𝒪[K]) :
    Spec.map (CommRingCat.ofHom (lft_integralPoints H hTorus x).toRingHom) ≫
      genericFibre H hTorus =
      Spec.map (CommRingCat.ofHom (algebraMap 𝒪[K] K)) ≫ x.val := sorry

-- Test NeronModel.lft_multiplicative_points
example (hT : TauCeti.torusCommHopfAlgProperty K
    (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)) :
    Nonempty (SchemePointTopology.Points
      (lftStructure (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) hT) 𝒪[K] ≃ Kˣ) := sorry

-- Test NeronModel.lft_trivialTorus
example (hT : TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.of K K)) :
    Nonempty (lft (TauCeti.FiniteTypeCommHopfAlgCat.of K K) hT ≅ Spec (CommRingCat.of 𝒪[K])) := sorry

-- Test NeronModel.lft_not_affine
example (hT : TauCeti.torusCommHopfAlgProperty K
    (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)) :
    ¬ IsAffine (lft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) hT) := sorry

/-- The finite-type model is an open subgroup of the lft model. -/
def ftToLft :
    (AlgebraicGeometry.hopfSpec (CommRingCat.of 𝒪[K])).obj (Opposite.op (ft H hTorus).A.obj) ⟶
      lftGroup H hTorus := sorry

instance ftToLft_isOpenImmersion :
    IsOpenImmersion (ftToLft H hTorus).hom.hom.left := sorry

/-- The finite-type Néron model is the largest finite-type open subgroup of the lft model. -/
theorem ft_maximal_open (𝒯 : IntegralModel.SmoothModel H)
    (i : (AlgebraicGeometry.hopfSpec (CommRingCat.of 𝒪[K])).obj (Opposite.op 𝒯.A.obj) ⟶
      lftGroup H hTorus) [IsOpenImmersion i.hom.hom.left] :
    ∃ j : (AlgebraicGeometry.hopfSpec (CommRingCat.of 𝒪[K])).obj (Opposite.op 𝒯.A.obj) ⟶
      (AlgebraicGeometry.hopfSpec (CommRingCat.of 𝒪[K])).obj (Opposite.op (ft H hTorus).A.obj),
      j ≫ ftToLft H hTorus = i := sorry

/-- The open inclusion agrees with the original torus on rational points. -/
theorem ftToLft_rational (g : WithConv ((ft H hTorus).A →ₐ[𝒪[K]] 𝒪[K])) :
    ∃ x : SchemePointTopology.Points (lftStructure H hTorus) 𝒪[K],
      x.val = Spec.map (CommRingCat.ofHom g.ofConv.toRingHom) ≫ (ftToLft H hTorus).hom.hom.left ∧
      ∀ a : (ft H hTorus).A,
        (lft_integralPoints H hTorus x) ((ft H hTorus).genericFibre.hom.hom.hom (1 ⊗ₜ[𝒪[K]] a)) =
          algebraMap 𝒪[K] K (g.ofConv a) := sorry

/-- The identity component of the finite-type torus model. -/
def connected (hT : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    IntegralModel.SmoothModel H := (ft H hTorus).identityComponent hT

variable (hT : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj)

theorem connected_integralPoints_le_ft :
    (connected H hTorus hT).integralPoints ≤ (ft H hTorus).integralPoints :=
  IntegralModel.SmoothModel.integralPoints_identityComponent_le (ft H hTorus) hT

theorem connected_integralPoints_finiteIndex :
    ((connected H hTorus hT).integralPoints.subgroupOf (ft H hTorus).integralPoints).FiniteIndex :=
  IntegralModel.SmoothModel.integralPoints_identityComponent_finiteIndex (ft H hTorus) hT

/-- The finite-type torus model contains every subgroup with compact closure.
Bruhat–Tits II, 4.4.2 and 4.4.12–4.4.13. -/
theorem ft_integralPoints_maximal [TopologicalSpace K] (hlocal : IsNonarchimedeanLocalField K) (P : Subgroup (WithConv (H →ₐ[K] K)))
    (hP : letI := PointTopology.instTopologicalSpaceWithConv K H K
      IsCompact (closure (P : Set (WithConv (H →ₐ[K] K))))) :
    P ≤ (ft H hTorus).integralPoints := sorry

theorem connected_le_parahoric [ModelField K] (D : BruhatTits.LocalRootData K H) [IsEmpty D.ι]
    (φ : BruhatTits.Valuation D.rootDatum) [BruhatTits.GeometricValuation D φ] (x : BruhatTits.Apartment φ) :
    (connected H hTorus hT).integralPoints ≤ BruhatTits.parahoricSubgroup D φ {x} := sorry

-- Test NeronModel.ft_multiplicative
/- The finite-type model of `G_m = GL_1` has the `GL_1` coordinate algebra over `𝒪` and integral
points `𝒪^×`. -/
example (hT : TauCeti.torusCommHopfAlgProperty K
    (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1))
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K 1 →ₐ[K] K)) :
    Nonempty ((ft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) hT).A ≅
      TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] 1) ∧
    (g ∈ (ft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) hT).integralPoints ↔
      ∃ v : 𝒪[K]ˣ, (TauCeti.GeneralLinear.pointsMulEquiv 1 g : Matrix (Fin 1) (Fin 1) K) 0 0 =
        ((v : 𝒪[K]) : K)) := sorry

-- Test NeronModel.ft_trivial
/- The trivial torus has the finite-type model `𝒪`, with a single integral point. -/
example (hT : TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.of K K)) :
    Nonempty ((ft (TauCeti.FiniteTypeCommHopfAlgCat.of K K) hT).A ≅
      TauCeti.FiniteTypeCommHopfAlgCat.of 𝒪[K] 𝒪[K]) ∧
    (ft (TauCeti.FiniteTypeCommHopfAlgCat.of K K) hT).integralPoints = ⊥ := sorry

-- Test NeronModel.ft_excludes_uniformizer
example (hT : TauCeti.torusCommHopfAlgProperty K
    (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1))
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K 1 →ₐ[K] K))
    (hg : valuation K ((TauCeti.GeneralLinear.pointsMulEquiv 1 g :
      Matrix (Fin 1) (Fin 1) K) 0 0) < 1) :
    g ∉ (ft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) hT).integralPoints := sorry

-- Test NeronModel.lftGroup_trivialTorus
/- The lft model of the trivial torus is `Spec 𝒪`, the terminal group object over `Spec 𝒪`. -/
example (hT : TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.of K K)) :
    Nonempty (Limits.IsTerminal (lftGroup (TauCeti.FiniteTypeCommHopfAlgCat.of K K) hT)) := sorry

-- Test NeronModel.genericFibre_openImmersion
/- The generic fibre is the base change of the open immersion `Spec K → Spec 𝒪`. -/
example : IsOpenImmersion (genericFibre H hTorus) := sorry

-- Test NeronModel.genericFibre_not_surjective (non-example)
/- The generic fibre misses the special fibre, which contains the reduction of the unit section. -/
example : ¬ AlgebraicGeometry.Surjective (genericFibre H hTorus) := sorry

-- Test NeronModel.lftMappingProperty_integral
/- For the test algebra `B = 𝒪`, the mapping-property bijection followed by `K ⊗_𝒪 𝒪 ≅ K` is
`lft_integralPoints`. -/
example (x : SchemePointTopology.Points (lftStructure H hTorus) 𝒪[K]) :
    (Algebra.TensorProduct.rid 𝒪[K] K K).toAlgHom.comp (lftMappingProperty H hTorus 𝒪[K] x) =
      lft_integralPoints H hTorus x := sorry

-- Test NeronModel.ftToLft_trivialTorus
example (hT : TauCeti.torusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.of K K)) :
    IsIso (ftToLft (TauCeti.FiniteTypeCommHopfAlgCat.of K K) hT) := sorry

-- Test NeronModel.ftToLft_multiplicative_not_iso (non-example)
/- For `G_m` the finite-type model `G_{m,𝒪}` is a proper open subgroup of the lft model, whose
special fibre has the components `ϖⁿ G_m`, `n ∈ ℤ`. -/
example (hT : TauCeti.torusCommHopfAlgProperty K
    (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)) :
    ¬ IsIso (ftToLft (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) hT) := sorry

-- Test NeronModel.ramified_torus_lft_eq_ft
/- For `char K ≠ 2` (including residue characteristic two), for the norm-one torus `T`
of `L = K(a)`, `a² = ϖ`, inertia acts on `X_*(T) = ℤ` by `-1`, so
the component group `X_*(T)_I = ℤ/2` of the lft model is finite: the lft model is the finite-type
model, hence affine (contrast `lft_not_affine`). -/
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : BruhatTits.normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K)) :
    IsIso (ftToLft (NormTorus.coordinateHopf K L) (NormTorus.coordinateHopf_isTorus K L)) ∧
      IsAffine (lft (NormTorus.coordinateHopf K L) (NormTorus.coordinateHopf_isTorus K L)) := sorry

-- Test NeronModel.ramified_torus_ft_disconnected (non-example)
/- For the separable square-root norm-one torus (`char K ≠ 2`), the special fibre of the
finite-type model has the two geometric components
indexed by `X_*(T)_I = ℤ/2`, and `-1 = a/ā`, a norm-one unit with `κ_T(-1) = v_L(a) mod 2 = 1`,
lies in `𝒯^{ft}(𝒪)` but not in `𝒯°(𝒪)`, in every residue characteristic. -/
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : BruhatTits.normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K))
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K (NormTorus.coordinateHopf K L).obj)
    (g : WithConv (NormTorus.coordinateHopf K L →ₐ[K] K))
    (hg : (((NormTorus.pointsEquiv K L K g : (L ⊗[K] K)ˣ)) : L ⊗[K] K) = -1) :
    ¬ (ft (NormTorus.coordinateHopf K L) (NormTorus.coordinateHopf_isTorus K L)).HasConnectedFibres ∧
      g ∈ (ft (NormTorus.coordinateHopf K L) (NormTorus.coordinateHopf_isTorus K L)).integralPoints ∧
      g ∉ ((ft (NormTorus.coordinateHopf K L)
        (NormTorus.coordinateHopf_isTorus K L)).identityComponent hconn).integralPoints := sorry

-- Test NeronModel.ramified_torus_connected_index
/- For the separable square-root norm-one torus (`char K ≠ 2`), `𝒯°(𝒪)` has index exactly `2`
in `𝒯^{ft}(𝒪) = T(K)`, including in residue characteristic two. -/
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : BruhatTits.normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K))
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K (NormTorus.coordinateHopf K L).obj) :
    (((ft (NormTorus.coordinateHopf K L) (NormTorus.coordinateHopf_isTorus K L)).identityComponent
        hconn).integralPoints.subgroupOf
      (ft (NormTorus.coordinateHopf K L) (NormTorus.coordinateHopf_isTorus K L)).integralPoints).index
      = 2 := sorry

end NeronModel

namespace KottwitzMap
open ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K]
  [ValuativeRel.IsDiscrete K] [ValuativeRel.IsNontrivial K] [ValuativeRel.IsRankLeOne K]
  [HenselianLocalRing 𝒪[K]] [IsSepClosed 𝓀[K]]
  {T : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- `ker κ_T` is the group of integral points of the connected Néron model `𝒯°` (Haines–Rapoport,
proof of Lemma 5, p. 3; Pappas–Rapoport, §5.a, p. 20). -/
theorem torus_ker_connected (D : BruhatTits.AbsoluteRootData K T)
    (hT : TauCeti.torusCommHopfAlgProperty K T)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K T.obj) :
    (torus D hT).ker = (NeronModel.connected T hT hconn).integralPoints := sorry

/-- The integral points of the finite-type Néron model are `κ_T⁻¹((X_*(T)_I)_tors)`: they form the
maximal bounded subgroup (Bruhat–Tits II, 4.4.12, pp. 110–111), which is the preimage of the
torsion (Haines–Rapoport, Remark 10, p. 6; Kisin–Zhou, §2.4.1, pp. 12–13, over `Ŏ`). -/
theorem torus_ft_iff (D : BruhatTits.AbsoluteRootData K T)
    (hT : TauCeti.torusCommHopfAlgProperty K T) (t : WithConv (T →ₐ[K] K)) :
    t ∈ (NeronModel.ft T hT).integralPoints ↔ IsOfFinOrder (torus D hT t) := sorry

-- Test KottwitzMap.connected_zero
example (D : BruhatTits.AbsoluteRootData K T) (hT : TauCeti.torusCommHopfAlgProperty K T)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K T.obj)
    (t : WithConv (T →ₐ[K] K)) :
    t ∈ (NeronModel.connected T hT hconn).integralPoints ↔ torus D hT t = 1 := sorry

-- Test KottwitzMap.torsion_not_connected
example (D : BruhatTits.AbsoluteRootData K T) (hT : TauCeti.torusCommHopfAlgProperty K T)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K T.obj)
    (t : WithConv (T →ₐ[K] K)) (ht : IsOfFinOrder (torus D hT t)) (hne : torus D hT t ≠ 1) :
    t ∈ (NeronModel.ft T hT).integralPoints ∧
      t ∉ (NeronModel.connected T hT hconn).integralPoints := sorry

-- Test KottwitzMap.torsionFree_models_agree
example (D : BruhatTits.AbsoluteRootData K T) (hT : TauCeti.torusCommHopfAlgProperty K T)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty K T.obj)
    (htf : ∀ y : BruhatTits.AlgebraicFundamentalGroup.inertiaCoinvariants D ⊤,
      ∀ n : ℕ, 0 < n → n • y = 0 → y = 0) :
    (NeronModel.ft T hT).integralPoints = (NeronModel.connected T hT hconn).integralPoints := sorry

end KottwitzMap


/-! ### Bruhat–Tits group schemes and parahorics -/

namespace BruhatTits.GroupScheme

open TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [ModelField K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty]

/-- `𝒢_Ω` as a smooth affine model of `G`. -/
def toSmoothModel : IntegralModel.SmoothModel H where
  A := ⟨groupScheme D φ Ω, sorry⟩
  smooth := sorry
  genericFibre := sorry

/-- `𝒢_Ω(𝒪)` is the pointwise fixer of `Ω` in the enlarged building, which lies in `G(K)^1`
(Bruhat–Tits II, 4.6.28 (i), p. 135, and 5.1.9, p. 148). -/
theorem integralPoints_eq_fixer :
    (toSmoothModel D φ Ω).integralPoints = Fixer.pointwise D φ (apartmentEmbedding D φ '' Ω) := sorry

/-- `𝒢°_Ω` as a smooth affine model with connected fibres. -/
def parahoricModel : IntegralModel.SmoothModel H where
  A := ⟨parahoricGroupScheme D φ Ω, sorry⟩
  smooth := sorry
  genericFibre := sorry

theorem parahoric_hasConnectedFibres : (parahoricModel D φ Ω).HasConnectedFibres := sorry

/-- The Hopf map `𝒢_Ω → 𝒢°_Ω` dual to the open immersion of the identity component. -/
def toParahoric : groupScheme D φ Ω ⟶ parahoricGroupScheme D φ Ω := sorry

/-- `toParahoric` is the morphism of models `𝒢°_Ω → 𝒢_Ω` over the identity of `G`; since such a
morphism is unique, this determines it. -/
theorem toParahoric_isModelHom :
    ∃ f : IntegralModel.SmoothModel.Hom (toSmoothModel D φ Ω) (parahoricModel D φ Ω),
      f.1.hom = toParahoric D φ Ω := sorry

theorem parahoric_integralPoints : (parahoricModel D φ Ω).integralPoints = parahoricSubgroup D φ Ω :=
  sorry

theorem parahoricModel_eq_identityComponent
    (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    Nonempty (IntegralModel.SmoothModel.Hom (parahoricModel D φ Ω)
      ((toSmoothModel D φ Ω).identityComponent hG)) ∧
    Nonempty (IntegralModel.SmoothModel.Hom ((toSmoothModel D φ Ω).identityComponent hG)
      (parahoricModel D φ Ω)) := sorry

/-- Points of the same facet have the same parahoric group scheme, up to the unique isomorphism
of models (Bruhat–Tits II, 4.6.28 and 5.2.6; the full fixers `𝒢_x`, `𝒢_y` can differ). -/
theorem parahoric_eq_of_sameFacet (x y : Apartment φ) (F : BuildingFacet D φ)
    (hx : apartmentEmbedding D φ x ∈ F) (hy : apartmentEmbedding D φ y ∈ F) :
    Nonempty (IntegralModel.SmoothModel.Hom (parahoricModel D φ {x}) (parahoricModel D φ {y})) ∧
      Nonempty (IntegralModel.SmoothModel.Hom (parahoricModel D φ {y}) (parahoricModel D φ {x})) :=
  sorry

/-- For simply connected `G` (trivial algebraic fundamental group) the inclusion `𝒢°_Ω → 𝒢_Ω` is an
isomorphism (Bruhat–Tits II, 4.6.32, p. 137, for `Ω` in a facet; Haines–Rapoport, Remark 4, p. 3,
for every nonempty bounded `Ω` in an apartment). -/
theorem parahoric_eq_groupScheme_of_simplyConnected (A : AbsoluteRootData K H)
    [Subsingleton (AlgebraicFundamentalGroup A)] :
    IsIso (toParahoric D φ Ω) := sorry

-- Test BruhatTits.GroupScheme.torus
/- For a torus every `𝒢_Ω` is the finite-type Néron model, as models of `T`. -/
example [IsEmpty D.ι] (hTorus : TauCeti.torusCommHopfAlgProperty K H) :
    Nonempty (IntegralModel.SmoothModel.Hom (toSmoothModel D φ Ω) (NeronModel.ft H hTorus)) ∧
      Nonempty (IntegralModel.SmoothModel.Hom (NeronModel.ft H hTorus) (toSmoothModel D φ Ω)) :=
  sorry

-- Test BruhatTits.GroupScheme.parahoric_torus
/- For a torus every `𝒢°_Ω` is the connected Néron model, and `P°_Ω = 𝒯°(𝒪)`. -/
example [IsEmpty D.ι] (hTorus : TauCeti.torusCommHopfAlgProperty K H)
    (hT : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    Nonempty (IntegralModel.SmoothModel.Hom (parahoricModel D φ Ω) (NeronModel.connected H hTorus hT)) ∧
      Nonempty (IntegralModel.SmoothModel.Hom (NeronModel.connected H hTorus hT) (parahoricModel D φ Ω)) ∧
      parahoricSubgroup D φ Ω = (NeronModel.connected H hTorus hT).integralPoints :=
  sorry

-- Test BruhatTits.GroupScheme.integralPoints_compat_fixer
example : (toSmoothModel D φ Ω).integralPoints =
    ⨅ x ∈ Ω, MulAction.stabilizer (WithConv (H →ₐ[K] K)) (apartmentEmbedding D φ x) := sorry

/-- BT II 4.6.26: every nonempty bounded apartment subset has a smooth affine model. -/
def boundedModel (Ω : Set (Apartment φ)) (hne : Ω.Nonempty) (hb : Apartment.IsBounded Ω) :
    IntegralModel.SmoothModel H where
  A := ⟨groupSchemeOfBounded D φ Ω hne hb, sorry⟩
  smooth := sorry
  genericFibre := sorry

/-- The defining fixer equality (Bruhat–Tits II, 4.6.28 (i), p. 135, and 5.1.9, p. 148); over a
strictly henselian base it determines the model (`IntegralModel.eq_of_integralPoints_eq`). -/
theorem boundedModel_points
    (Ω : Set (Apartment φ)) (hne : Ω.Nonempty) (hb : Apartment.IsBounded Ω) :
    (boundedModel D φ Ω hne hb).integralPoints =
      Fixer.pointwise D φ (apartmentEmbedding D φ '' Ω) := sorry

/-- The connected bounded-set group scheme as a smooth model of `H`, including its
identification of the generic fibre. Bruhat–Tits II, 4.6.28 (i), p. 135. -/
def boundedParahoricModel (Ω : Set (Apartment φ)) (hne : Ω.Nonempty)
    (hb : Apartment.IsBounded Ω) : IntegralModel.SmoothModel H where
  A := ⟨parahoricGroupSchemeOfBounded D φ Ω hne hb, sorry⟩
  smooth := sorry
  genericFibre := sorry

/-- The connected bounded-set model and the identity component are isomorphic over the
identity of `G` (Bruhat–Tits II, 4.6.28 (i), p. 135). -/
theorem boundedModel_connected (Ω : Set (Apartment φ)) (hne : Ω.Nonempty)
    (hb : Apartment.IsBounded Ω) (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    Nonempty (IntegralModel.SmoothModel.Hom (boundedParahoricModel D φ Ω hne hb)
      ((boundedModel D φ Ω hne hb).identityComponent hG)) ∧
    Nonempty (IntegralModel.SmoothModel.Hom ((boundedModel D φ Ω hne hb).identityComponent hG)
      (boundedParahoricModel D φ Ω hne hb)) := sorry

/-- Both bounded-set models have generic fibre `H` (Bruhat–Tits II, 4.6.26–4.6.28,
pp. 135–136). The finite-set models are their specializations. -/
theorem boundedModels_genericFibre (Ω : Set (Apartment φ)) (hne : Ω.Nonempty)
    (hb : Apartment.IsBounded Ω) :
    Nonempty (TauCeti.CommHopfAlgCat.baseChange (K := K)
      (groupSchemeOfBounded D φ Ω hne hb) ≅ H.obj) ∧
    Nonempty (TauCeti.CommHopfAlgCat.baseChange (K := K)
      (parahoricGroupSchemeOfBounded D φ Ω hne hb) ≅ H.obj) := sorry

/-- Over a strictly henselian base, the integral points of the identity component of `𝒢_Ω` are
the fixer of `Ω` in the enlarged building intersected with `ker κ_G` (Haines–Rapoport,
Proposition 3 and Remarks 4 and 11, pp. 1–3, 7). -/
theorem boundedModel_connected_points [IsSepClosed 𝓀[K]]
    (A : AbsoluteRootData K H) (Ω : Set (Apartment φ)) (hne : Ω.Nonempty)
    (hb : Apartment.IsBounded Ω) (hG : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) :
    ((boundedModel D φ Ω hne hb).identityComponent hG).integralPoints =
      Fixer.pointwise D φ (apartmentEmbedding D φ '' Ω) ⊓ (KottwitzMap.kottwitz A).ker := sorry

-- Test GroupScheme.bounded_singleton
example (x : Apartment φ) : Apartment.IsBounded ({x} : Set (Apartment φ)) := by
  intro f
  exact ⟨|f x.displacement|, fun y hy => by simpa using le_of_eq (congrArg (fun z => |f z.displacement|) (Set.mem_singleton_iff.mp hy))⟩

-- Test GroupScheme.bounded_finite
example (Ω : Finset (Apartment φ)) : Apartment.IsBounded (Ω : Set (Apartment φ)) :=
  fun f => ⟨∑ y ∈ Ω, |f y.displacement|, fun _ hx =>
    Finset.single_le_sum (f := fun y => |f y.displacement|) (fun _ _ => abs_nonneg _) hx⟩

-- Test GroupScheme.unbounded_univ (non-example)
/- When the apartment has positive dimension the whole apartment is not bounded. -/
example [Nontrivial D.V] : ¬ Apartment.IsBounded (Set.univ : Set (Apartment φ)) := sorry

-- Test GroupScheme.bounded_finite_agreement
example (hne : (Ω : Set (Apartment φ)).Nonempty) (hb : Apartment.IsBounded (Ω : Set (Apartment φ))) :
    (boundedModel D φ Ω hne hb).A = (toSmoothModel D φ Ω).A := rfl

-- Test BruhatTits.GroupScheme.groupSchemeOfBounded_torus
/- For a torus (`Φ = ∅`) every `𝒢_Ω` is the finite-type Néron model: both have the maximal bounded
subgroup as points (Bruhat–Tits II, 4.4.2 (ii), p. 107, and 4.4.12, pp. 110–111). -/
example [IsEmpty D.ι] (hTorus : TauCeti.torusCommHopfAlgProperty K H) (s : Set (Apartment φ))
    (hne : s.Nonempty) (hb : Apartment.IsBounded s) :
    Nonempty (groupSchemeOfBounded D φ s hne hb ≅ (NeronModel.ft H hTorus).A.obj) := sorry

-- Test BruhatTits.GroupScheme.parahoricGroupSchemeOfBounded_torus
/- For a torus every `𝒢°_Ω` is the connected Néron model. -/
example [IsEmpty D.ι] (hTorus : TauCeti.torusCommHopfAlgProperty K H)
    (hT : TauCeti.geometricallyConnectedCommHopfAlgProperty K H.obj) (s : Set (Apartment φ))
    (hne : s.Nonempty) (hb : Apartment.IsBounded s) :
    Nonempty (parahoricGroupSchemeOfBounded D φ s hne hb ≅ (NeronModel.connected H hTorus hT).A.obj) :=
  sorry

-- Test BruhatTits.GroupScheme.boundedModel_mono
/- `s ⊆ t` gives a morphism of models `𝒢_t → 𝒢_s` (the fixer shrinks as the set grows;
Bruhat–Tits II, 4.6.27, p. 135). -/
example (s t : Set (Apartment φ)) (hst : s ⊆ t) (hs : s.Nonempty) (ht : t.Nonempty)
    (hbs : Apartment.IsBounded s) (hbt : Apartment.IsBounded t) :
    Nonempty (IntegralModel.SmoothModel.Hom (boundedModel D φ s hs hbs) (boundedModel D φ t ht hbt)) :=
  sorry

end BruhatTits.GroupScheme

namespace BruhatTits.Parahoric

open TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum)

/-- The reductive quotient `𝒢̄_Ω` of the special fibre of the parahoric group scheme. -/
def reductiveQuotient [ModelField K] [GeometricValuation D φ] (Ω : Finset (Apartment φ))
    [Fact Ω.Nonempty] : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} 𝓀[K] :=
  sorry

/-- The pro-unipotent radical `P⁺_Ω`, the kernel of `P°_Ω → 𝒢̄_Ω(𝓀)` (`proUnipotentRadical_eq_ker`). -/
def proUnipotentRadical [ModelField K] [GeometricValuation D φ] (Ω : Finset (Apartment φ))
    [Fact Ω.Nonempty] : Subgroup (WithConv (H →ₐ[K] K)) := sorry

section

variable [ModelField K] [GeometricValuation D φ]

/-- `P` is parahoric if it is conjugate to the connected fixer of a point of the apartment. -/
def IsParahoric (P : Subgroup (WithConv (H →ₐ[K] K))) : Prop :=
  ∃ (x : Apartment φ) (g : WithConv (H →ₐ[K] K)),
    P = (parahoricSubgroup D φ {x}).map (MulAut.conj g).toMonoidHom

/-- Iwahori subgroups: the minimal parahoric subgroups. -/
def IsIwahori (P : Subgroup (WithConv (H →ₐ[K] K))) : Prop :=
  IsParahoric D φ P ∧ ∀ Q, IsParahoric D φ Q → Q ≤ P → Q = P

/- Check `stabilizer_not_parahoric_pgl2`: for the scalar quotient of `GL₂`, the setwise
stabilizer of an apartment alcove (an open edge) is not a parahoric. -/
example (q : (H : Type u) →ₐc[K] TauCeti.GeneralLinear.coordinateHopfAlgebra K 2)
    (hq : Function.Injective q)
    (hker : ∀ (R : Type u) [CommRing R] [Algebra K R]
      (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra K 2 →ₐ[K] R)),
      WithConv.toConv (g.ofConv.comp q.toAlgHom) = (1 : WithConv (H →ₐ[K] R)) ↔
        ∃ a : Rˣ, TauCeti.GeneralLinear.pointsMulEquiv 2 g =
          Matrix.GeneralLinearGroup.scalar (Fin 2) a)
    (C : Facet φ) (hC : C.IsAlcove) :
    ¬ IsParahoric D φ (Fixer.stabilizer D φ (apartmentEmbedding D φ '' C.carrier)) := sorry

theorem isParahoric_conj {P : Subgroup (WithConv (H →ₐ[K] K))} (hP : IsParahoric D φ P)
    (g : WithConv (H →ₐ[K] K)) : IsParahoric D φ (P.map (MulAut.conj g).toMonoidHom) := sorry

theorem isCompact_parahoric [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    {P : Subgroup (WithConv (H →ₐ[K] K))} (hP : IsParahoric D φ P) :
    letI := PointTopology.instTopologicalSpaceWithConv K H K
    IsCompact (P : Set (WithConv (H →ₐ[K] K))) ∧ IsOpen (P : Set (WithConv (H →ₐ[K] K))) := sorry

theorem iwahori_conj {P Q : Subgroup (WithConv (H →ₐ[K] K))} (hP : IsIwahori D φ P)
    (hQ : IsIwahori D φ Q) : ∃ g : WithConv (H →ₐ[K] K), Q = P.map (MulAut.conj g).toMonoidHom :=
  sorry

theorem parahoric_le_stabilizer (x : Apartment φ) :
    parahoricSubgroup D φ {x} ≤ MulAction.stabilizer (WithConv (H →ₐ[K] K)) (apartmentEmbedding D φ x) :=
  sorry

theorem finite_conjClasses [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    ∃ S : Finset (Subgroup (WithConv (H →ₐ[K] K))), ∀ P, IsParahoric D φ P →
      ∃ Q ∈ S, ∃ g : WithConv (H →ₐ[K] K), P = Q.map (MulAut.conj g).toMonoidHom := sorry

-- Test BruhatTits.Parahoric.torus_unique
example [IsEmpty D.ι] (P Q : Subgroup (WithConv (H →ₐ[K] K))) (hP : IsParahoric D φ P)
    (hQ : IsParahoric D φ Q) : P = Q := sorry

/-- Parahorics as fixers in the Kottwitz kernel over a strictly henselian base: `P°_Ω` is the
intersection of the fixer of `Ω` with the subgroup generated by the parahorics of the points of the
apartment, which is `ker κ_G` (Haines–Rapoport, Proposition 3, p. 1, Remark 4, p. 3, and
Lemma 17, p. 9). -/
theorem parahoric_eq_fixer_inf_generated [IsSepClosed 𝓀[K]] (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    parahoricSubgroup D φ Ω =
      Fixer.pointwise D φ (apartmentEmbedding D φ '' Ω) ⊓ ⨆ x : Apartment φ, parahoricSubgroup D φ {x} :=
  sorry

/-- Over a nonarchimedean local field `E`, the parahoric subgroup is the fixer of `Ω` in `G(E)`
intersected with the kernel of the Kottwitz map of `G` over `Ĕ`, restricted along `G(E) ⊆ G(Ĕ)`
(Haines–Rapoport, Proposition 3, p. 1, Remark 4, p. 3, and Remark 9, pp. 5–6, with the descent of
Bruhat–Tits II, 5.1.9, p. 148). This determines `parahoricSubgroup` over `E`. -/
theorem parahoricSubgroup_eq_fixer_inf_kottwitz {E : Type u} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] {G : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} E}
    [HenselianLocalRing 𝒪[MaxUnramifiedCompletion.Breve E]]
    [IsSepClosed 𝓀[MaxUnramifiedCompletion.Breve E]]
    (DE : LocalRootData E G) (φE : Valuation DE.rootDatum) [GeometricValuation DE φE]
    (A : AbsoluteRootData (MaxUnramifiedCompletion.Breve E)
      (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := MaxUnramifiedCompletion.Breve E) G))
    (Ω : Finset (Apartment φE)) [Fact Ω.Nonempty] :
    parahoricSubgroup DE φE Ω = Fixer.pointwise DE φE (apartmentEmbedding DE φE '' Ω) ⊓
      (KottwitzMap.kottwitz A).ker.comap
        ((unramifiedPointsEquiv (H := G)).symm.toMonoidHom.comp
          (TauCeti.AlgHom.mapValue (Algebra.ofId E (MaxUnramifiedCompletion.Breve E)))) := sorry

/-- For simply connected `G` the full fixer is the parahoric. -/
theorem fixer_eq_parahoric_of_simplyConnected (A : AbsoluteRootData K H)
    [Subsingleton (AlgebraicFundamentalGroup A)] (x : Apartment φ) :
    Fixer.pointwise D φ {apartmentEmbedding D φ x} = parahoricSubgroup D φ {x} := sorry

theorem reductiveQuotient_isReductive (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    TauCeti.reductiveCommHopfAlgProperty 𝓀[K] (reductiveQuotient D φ Ω) := sorry

/-- The quotient morphism, as an injective Hopf map of coordinate rings. -/
def reductiveQuotientMap (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    reductiveQuotient D φ Ω ⟶ (GroupScheme.parahoricModel D φ Ω).specialFibre := sorry

theorem reductiveQuotientMap_injective (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    Function.Injective (reductiveQuotientMap D φ Ω).hom.hom := sorry

/-- The kernel of `𝒢°_{Ω,𝓀} → 𝒢̄_Ω` is smooth, connected and unipotent. With
`reductiveQuotient_isReductive` and `reductiveQuotientMap_injective` this identifies `𝒢̄_Ω` with
the quotient of `𝒢°_{Ω,𝓀}` by its unipotent radical (Bruhat–Tits II, 4.6.12, p. 129). -/
theorem reductiveQuotient_kernel (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    TauCeti.smoothUnipotentCommHopfAlgProperty 𝓀[K]
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient (GroupScheme.parahoricModel D φ Ω).specialFibre
          (TauCeti.CommHopfAlgCat.kernelHopfIdeal (reductiveQuotientMap D φ Ω).hom)) ∧
      TauCeti.geometricallyConnectedCommHopfAlgProperty 𝓀[K]
        (TauCeti.FiniteTypeCommHopfAlgCat.quotient (GroupScheme.parahoricModel D φ Ω).specialFibre
          (TauCeti.CommHopfAlgCat.kernelHopfIdeal (reductiveQuotientMap D φ Ω).hom)).obj := sorry

/-- The reduction `P°_Ω → 𝒢̄_Ω(𝓀)`: an integral point of `𝒢°_Ω` is reduced modulo the maximal
ideal and composed with `𝒢°_{Ω,𝓀} → 𝒢̄_Ω`. -/
def reduction (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    parahoricSubgroup D φ Ω →* WithConv (reductiveQuotient D φ Ω →ₐ[𝓀[K]] 𝓀[K]) := sorry

/-- The formula for `reduction`. Every element of `𝓀 ⊗ A°` is a tensor `1 ⊗ a`, so this formula
determines `reduction`. -/
theorem reduction_apply (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty]
    (g : parahoricSubgroup D φ Ω) (b : reductiveQuotient D φ Ω)
    (a : (GroupScheme.parahoricModel D φ Ω).A) (o : 𝒪[K])
    (hb : (reductiveQuotientMap D φ Ω).hom.hom b = (1 : 𝓀[K]) ⊗ₜ[𝒪[K]] a)
    (ho : (g : WithConv (H →ₐ[K] K)).ofConv
      ((GroupScheme.parahoricModel D φ Ω).genericFibre.hom.hom ((1 : K) ⊗ₜ[𝒪[K]] a)) = o) :
    (reduction D φ Ω g).ofConv b = IsLocalRing.residue 𝒪[K] o := sorry

theorem proUnipotentRadical_le (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    proUnipotentRadical D φ Ω ≤ parahoricSubgroup D φ Ω := sorry

theorem proUnipotentRadical_eq_ker (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    (proUnipotentRadical D φ Ω).subgroupOf (parahoricSubgroup D φ Ω) = (reduction D φ Ω).ker :=
  sorry

instance (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    ((proUnipotentRadical D φ Ω).subgroupOf (parahoricSubgroup D φ Ω)).Normal := sorry

/-- `P°_Ω / P⁺_Ω ≃ 𝒢̄_Ω(𝓀)` for the perfect residue field of a `ModelField`. -/
def parahoricQuotientEquiv (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    (parahoricSubgroup D φ Ω ⧸ (proUnipotentRadical D φ Ω).subgroupOf (parahoricSubgroup D φ Ω)) ≃*
      WithConv (reductiveQuotient D φ Ω →ₐ[𝓀[K]] 𝓀[K]) := sorry

/-- The isomorphism is induced by `reduction`. -/
theorem parahoricQuotientEquiv_mk (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty]
    (g : parahoricSubgroup D φ Ω) :
    parahoricQuotientEquiv D φ Ω (QuotientGroup.mk g) = reduction D φ Ω g := sorry

/-- Nested facets: `F ⊆ closure F'` gives `P°_{F'} ≤ P°_F` and `P⁺_F ≤ P⁺_{F'}`. -/
theorem parahoricSubgroup_antitone (x y : Apartment φ) (F F' : BuildingFacet D φ)
    (hx : apartmentEmbedding D φ x ∈ F) (hy : apartmentEmbedding D φ y ∈ F') (hF : F ≤ F') :
    parahoricSubgroup D φ {y} ≤ parahoricSubgroup D φ {x} ∧
      proUnipotentRadical D φ {x} ≤ proUnipotentRadical D φ {y} := sorry

/-- The reduction `P°_Ω → 𝒢̄_Ω(𝓀)` is surjective for the perfect residue field `𝓀` of a `ModelField`. -/
theorem reduction_surjective (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    Function.Surjective (reduction D φ Ω) := sorry

/-- A point `y` of a facet `F` is generic in `F` if its fixer is locally constant near `y` in `F`. -/
def IsGeneric (y : Building D φ) (F : BuildingFacet D φ) : Prop :=
  y ∈ F ∧ ∃ U ∈ nhdsWithin y F, ∀ z ∈ U, Fixer.pointwise D φ {z} = Fixer.pointwise D φ {y}

/-- Connected stabilizers are stabilizers of generic points. -/
theorem fixer_eq_of_connected_of_generic (x : Apartment φ) (F : BuildingFacet D φ)
    (hxF : apartmentEmbedding D φ x ∈ F)
    (hconn : Fixer.pointwise D φ {apartmentEmbedding D φ x} = parahoricSubgroup D φ {x})
    (y : Building D φ) (hy : IsGeneric D φ y F) :
    Fixer.pointwise D φ {y} = Fixer.pointwise D φ {apartmentEmbedding D φ x} := sorry

-- Test BruhatTits.Parahoric.reductiveQuotient_torus
/- For a torus the reductive quotient is a `𝓀`-torus. -/
example [IsEmpty D.ι] (hTorus : TauCeti.torusCommHopfAlgProperty K H) (Ω : Finset (Apartment φ))
    [Fact Ω.Nonempty] : TauCeti.torusCommHopfAlgProperty 𝓀[K] (reductiveQuotient D φ Ω) := sorry

-- Test BruhatTits.Parahoric.generic_torus
/- When there are no relative roots (for instance for a torus), the reduced building is a point and
every point of a facet is generic. -/
example [IsEmpty D.ι] (y : Building D φ) (F : BuildingFacet D φ) (hy : y ∈ F) :
    IsGeneric D φ y F := sorry

end

end BruhatTits.Parahoric

namespace BruhatTits.Hyperspecial

open TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [ModelField K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]

/-- Hyperspecial vertices: the parahoric group scheme at `x` is reductive iff the full stabilizer
scheme is, and then the two agree (Bruhat–Tits II, 4.6.31, pp. 136–137, and 5.1.40, p. 161). -/
theorem isReductive_iff (x : Apartment φ) :
    (GroupScheme.parahoricModel D φ {x}).IsReductive ↔ (GroupScheme.toSmoothModel D φ {x}).IsReductive :=
  sorry

theorem parahoric_eq_of_isReductive (x : Apartment φ)
    (h : (GroupScheme.toSmoothModel D φ {x}).IsReductive) :
    IsIso (GroupScheme.toParahoric D φ {x}) := sorry

/-- The hyperspecial subgroups are exactly the parahoric subgroups of hyperspecial vertices. -/
theorem isHyperspecialSubgroup_iff (P : Subgroup (WithConv (H →ₐ[K] K))) :
    IntegralModel.IsHyperspecialSubgroup P ↔ ∃ (x : Apartment φ) (g : WithConv (H →ₐ[K] K)),
      (GroupScheme.parahoricModel D φ {x}).IsReductive ∧
        P = (parahoricSubgroup D φ {x}).map (MulAut.conj g).toMonoidHom := sorry

section Examples

/-! Unit tests with the standard `GL_n` datum over a nonarchimedean local field `E` and the
quadratic norm-one torus. -/

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

-- Test BruhatTits.GroupScheme.gl_n_vertex
/- At the standard vertex of the `GL_n` building (the norm of the lattice `𝒪ⁿ`), `𝒢_x(𝒪)` is
`GL_n(𝒪)`: the integral matrices with integral inverse. -/
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0)
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra E n →ₐ[E] E)) :
    g ∈ (GroupScheme.toSmoothModel (GLBuilding.standardData n) (GLBuilding.standardValuation n)
      {x}).integralPoints ↔
      (∀ i j, ∃ o : 𝒪[E],
        (TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) E) i j = o) ∧
      (∀ i j, ∃ o : 𝒪[E],
        (TauCeti.GeneralLinear.pointsMulEquiv n g⁻¹ : Matrix (Fin n) (Fin n) E) i j = o) := sorry

-- Test BruhatTits.GroupScheme.parahoric_gl_n_vertex
/- At the standard vertex `𝒢°_x = 𝒢_x`, and the model is reductive: `GL_n(𝒪)` is hyperspecial. -/
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0) :
    IsIso (GroupScheme.toParahoric (GLBuilding.standardData n) (GLBuilding.standardValuation n) {x}) ∧
      (GroupScheme.parahoricModel (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        {x}).IsReductive := sorry

-- Test BruhatTits.Parahoric.gl_n_maximal
/- `GL_n(𝒪)` is a maximal parahoric subgroup of `GL_n(E)`. -/
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0)
    (Q : Subgroup (WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra E n →ₐ[E] E)))
    (hQ : Parahoric.IsParahoric (GLBuilding.standardData n) (GLBuilding.standardValuation n) Q)
    (hle : parahoricSubgroup (GLBuilding.standardData n) (GLBuilding.standardValuation n) {x} ≤ Q) :
    Q = parahoricSubgroup (GLBuilding.standardData n) (GLBuilding.standardValuation n) {x} := sorry

-- Test BruhatTits.Parahoric.iwahori_gl2
/- At displacement `(1/2, 0)`, inside the standard alcove of `GL_2`, the parahoric is the Iwahori
subgroup of matrices in `GL_2(𝒪)` whose lower-left entry lies in the maximal ideal. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0])
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra E 2 →ₐ[E] E)) :
    Parahoric.IsIwahori (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        (parahoricSubgroup (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {x}) ∧
      (g ∈ parahoricSubgroup (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {x} ↔
        (∀ i j, ∃ o : 𝒪[E],
          (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) E) i j = o) ∧
        (∀ i j, ∃ o : 𝒪[E],
          (TauCeti.GeneralLinear.pointsMulEquiv 2 g⁻¹ : Matrix (Fin 2) (Fin 2) E) i j = o) ∧
        valuation E ((TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) E) 1 0) < 1) :=
  sorry

-- Test BruhatTits.Parahoric.vertex_not_iwahori (non-example)
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = 0) :
    ¬ Parahoric.IsIwahori (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        (parahoricSubgroup (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {x}) := sorry

-- Test IntegralModel.SmoothModel.iwahori_not_reductive (non-example)
/- The Iwahori group scheme of `GL_2` is smooth, but its special fibre has a nontrivial unipotent
radical, so it is not a reductive model. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0]) :
    ¬ (GroupScheme.parahoricModel (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
      {x}).IsReductive := sorry

-- Test BruhatTits.Parahoric.reductiveQuotient_gl_n_vertex
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0) :
    Nonempty (Parahoric.reductiveQuotient (GLBuilding.standardData n) (GLBuilding.standardValuation n)
      {x} ≅ TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝓀[E] n) := sorry

-- Test BruhatTits.Parahoric.reductiveQuotient_not_specialFibre (non-example)
/- For the Iwahori of `GL_2` the special fibre is not reductive, so `𝒢̄` is a proper quotient. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0]) :
    ¬ Function.Surjective (Parahoric.reductiveQuotientMap (GLBuilding.standardData 2)
      (GLBuilding.standardValuation 2) {x}).hom.hom := sorry

-- Test BruhatTits.Parahoric.generic_gl2_alcove
/- Every point of an alcove of `GL_2` is generic. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0])
    (F : BuildingFacet (GLBuilding.standardData 2) (GLBuilding.standardValuation 2))
    (hF : apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x ∈ F) :
    Parahoric.IsGeneric (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
      (apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x) F := sorry

-- Test BruhatTits.GroupScheme.ramified_torus_disconnected (non-example)
/- For `char K ≠ 2` (including residue characteristic two), for the norm-one torus
of `L = K(a)`, `a² = ϖ`, the building is a point, `𝒢_x(𝒪)` is all of
`T(K)`, and `𝒢_x ≠ 𝒢°_x`: the special fibre of `𝒢_x` has two components. -/
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K))
    (φ : Valuation (NormTorus.quadraticData K L hd).rootDatum)
    [GeometricValuation (NormTorus.quadraticData K L hd) φ] (x : Apartment φ) :
    (GroupScheme.toSmoothModel (NormTorus.quadraticData K L hd) φ {x}).integralPoints = ⊤ ∧
      ¬ IsIso (GroupScheme.toParahoric (NormTorus.quadraticData K L hd) φ {x}) := sorry

-- Test BruhatTits.Hyperspecial.ramified_torus_none (non-example)
/- A ramified torus has no reductive model, hence no hyperspecial subgroup. -/
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (π : Kˣ) (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K))
    (P : Subgroup (WithConv (NormTorus.coordinateHopf K L →ₐ[K] K))) :
    ¬ IntegralModel.IsHyperspecialSubgroup P := sorry

-- Test BruhatTits.GroupScheme.groupSchemeOfBounded_gl_n_vertex
/- At the standard vertex of `GL_n` both bounded-set constructors give the coordinate Hopf algebra
`𝒪[GL_n]` of `GL_{n,𝒪}`. -/
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0)
    (hb : Apartment.IsBounded ({x} : Set (Apartment (GLBuilding.standardValuation (K := E) n)))) :
    Nonempty (groupSchemeOfBounded (GLBuilding.standardData n) (GLBuilding.standardValuation n) {x}
        (Set.singleton_nonempty x) hb ≅
      (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[E] n).obj) ∧
    Nonempty (parahoricGroupSchemeOfBounded (GLBuilding.standardData n)
        (GLBuilding.standardValuation n) {x} (Set.singleton_nonempty x) hb ≅
      (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[E] n).obj) := sorry

-- Test BruhatTits.GroupScheme.boundedModel_enclosure_gl2
/- `𝒢_Ω` depends only on the enclosure of `Ω` (Bruhat–Tits II, 4.6.27, p. 135): the point at
displacement `(1/2, 0)` and the pair of vertices at displacements `0` and `(1, 0)` of the same
`GL_2` alcove give the same model, the Iwahori group scheme. -/
example (x y z : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0])
    (hy : GLBuilding.standardCoordinates 2 y.displacement = 0)
    (hz : GLBuilding.standardCoordinates 2 z.displacement = ![1, 0])
    (hbx : Apartment.IsBounded ({x} : Set (Apartment (GLBuilding.standardValuation (K := E) 2))))
    (hbyz : Apartment.IsBounded ({y, z} : Set (Apartment (GLBuilding.standardValuation (K := E) 2)))) :
    Nonempty (IntegralModel.SmoothModel.Hom
      (GroupScheme.boundedModel (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {x}
        (Set.singleton_nonempty x) hbx)
      (GroupScheme.boundedModel (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {y, z}
        (Set.insert_nonempty y {z}) hbyz)) ∧
    Nonempty (IntegralModel.SmoothModel.Hom
      (GroupScheme.boundedModel (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {y, z}
        (Set.insert_nonempty y {z}) hbyz)
      (GroupScheme.boundedModel (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {x}
        (Set.singleton_nonempty x) hbx)) := sorry

-- Test BruhatTits.Parahoric.reductiveQuotientMap_gl_n_vertex
/- At the standard vertex the special fibre `GL_{n,𝓀}` is already reductive, so the quotient map is
an isomorphism. -/
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0) :
    Function.Bijective (Parahoric.reductiveQuotientMap (GLBuilding.standardData n)
      (GLBuilding.standardValuation n) {x}).hom.hom := sorry

-- Test BruhatTits.Parahoric.reductiveQuotient_iwahori_gl2
/- For the Iwahori of `GL_2` the reductive quotient is the diagonal torus `G_m²` over `𝓀`. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0]) :
    Nonempty (Parahoric.reductiveQuotient (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
      {x} ≅ TauCeti.DiagonalizableGroup.coordinateRing 𝓀[E]
        (TauCeti.SplitTorus.characterGroup (ULift.{u} (Fin 2)))) := sorry

-- Test BruhatTits.Parahoric.proUnipotentRadical_gl_n_vertex
/- At the standard vertex `P⁺_x` is the principal congruence subgroup `1 + ϖ M_n(𝒪)`: the entries
of `g - 1` lie in the maximal ideal (then `det g ≡ 1` is a unit, so `g⁻¹` is integral). -/
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0)
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra E n →ₐ[E] E)) :
    g ∈ Parahoric.proUnipotentRadical (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        {x} ↔
      ∀ i j, valuation E ((TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) E) i j -
        (1 : Matrix (Fin n) (Fin n) E) i j) < 1 := sorry

-- Test BruhatTits.Parahoric.proUnipotentRadical_iwahori_gl2
/- For the Iwahori of `GL_2`, `I⁺` consists of the integral matrices whose diagonal entries are
`≡ 1` and whose lower-left entry is `≡ 0` modulo the maximal ideal; the upper-right entry is any
integer. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0])
    (g : WithConv (TauCeti.GeneralLinear.coordinateHopfAlgebra E 2 →ₐ[E] E)) :
    g ∈ Parahoric.proUnipotentRadical (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        {x} ↔
      (∀ i j, ∃ o : 𝒪[E],
        (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) E) i j = o) ∧
      valuation E ((TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) E) 0 0 - 1) < 1 ∧
      valuation E ((TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) E) 1 1 - 1) < 1 ∧
      valuation E ((TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) E) 1 0) < 1 :=
  sorry

-- Test BruhatTits.Parahoric.parahoricQuotient_card_gl_n_vertex
/- With `𝓀 = 𝔽_q`, the quotient `P°_x/P⁺_x` identified by `parahoricQuotientEquiv` with `𝒢̄_x(𝓀)` is
`GL_n(𝔽_q)` at the standard vertex. -/
example (n : ℕ) (x : Apartment (GLBuilding.standardValuation (K := E) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0) :
    Nat.card (parahoricSubgroup (GLBuilding.standardData n) (GLBuilding.standardValuation n) {x} ⧸
        (Parahoric.proUnipotentRadical (GLBuilding.standardData n) (GLBuilding.standardValuation n)
          {x}).subgroupOf
          (parahoricSubgroup (GLBuilding.standardData n) (GLBuilding.standardValuation n) {x})) =
      Nat.card (Matrix.GeneralLinearGroup (Fin n) 𝓀[E]) := sorry

-- Test BruhatTits.Parahoric.parahoricQuotient_card_iwahori_gl2
/- For the Iwahori of `GL_2` the quotient `I/I⁺ ≅ T(𝔽_q)` has `(q - 1)²` elements. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0]) :
    Nat.card (parahoricSubgroup (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {x} ⧸
        (Parahoric.proUnipotentRadical (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
          {x}).subgroupOf
          (parahoricSubgroup (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) {x})) =
      (Nat.card 𝓀[E] - 1) ^ 2 := sorry

-- Test BruhatTits.Parahoric.isIwahori_gl1
/- Rank `0` relative roots: for `GL_1` every point is both a vertex and an alcove, and its parahoric
`𝒪^×` is an Iwahori subgroup. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 1)) :
    Parahoric.IsIwahori (GLBuilding.standardData 1) (GLBuilding.standardValuation 1)
      (parahoricSubgroup (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) {x}) := sorry

-- Test BruhatTits.Parahoric.alcove_stabilizer_not_parahoric_gl2 (non-example)
/- The stabilizer of a `GL_2` alcove contains `(0 1; ϖ 0)`, of determinant `-ϖ`, while every
parahoric subgroup lies in `{g : det g ∈ 𝒪^×}`; so the stabilizer is not parahoric. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![1 / 2, 0])
    (F : BuildingFacet (GLBuilding.standardData (K := E) 2) (GLBuilding.standardValuation 2))
    (hF : apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x ∈ F) :
    ¬ Parahoric.IsParahoric (GLBuilding.standardData (K := E) 2) (GLBuilding.standardValuation 2)
      (Fixer.stabilizer (GLBuilding.standardData (K := E) 2) (GLBuilding.standardValuation 2)
        (SetLike.coe F)) := sorry

-- Test BruhatTits.Parahoric.generic_gl2_vertex
/- A point of the facet of the standard `GL_2` vertex (a line in the central direction of the
enlarged building) is generic: all its points have the fixer `GL_2(𝒪)`. -/
example (x : Apartment (GLBuilding.standardValuation (K := E) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = 0)
    (F : BuildingFacet (GLBuilding.standardData 2) (GLBuilding.standardValuation 2))
    (hF : apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x ∈ F) :
    Parahoric.IsGeneric (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
      (apartmentEmbedding (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) x) F := sorry

-- Test BruhatTits.GroupScheme.groupSchemeOfBounded_ramified_torus (non-example)
/- For the norm-one torus of `L = K(a)`, `a² = ϖ`, the special fibres of `𝒢_x` and `𝒢°_x` have two
and one geometric components, so the two Hopf algebras are not isomorphic even abstractly. -/
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K))
    (φ : Valuation (NormTorus.quadraticData K L hd).rootDatum)
    [GeometricValuation (NormTorus.quadraticData K L hd) φ] (x : Apartment φ)
    (hb : Apartment.IsBounded ({x} : Set (Apartment φ))) :
    ¬ Nonempty (groupSchemeOfBounded (NormTorus.quadraticData K L hd) φ {x}
        (Set.singleton_nonempty x) hb ≅
      parahoricGroupSchemeOfBounded (NormTorus.quadraticData K L hd) φ {x}
        (Set.singleton_nonempty x) hb) := sorry

-- Test BruhatTits.Parahoric.ramified_torus_reductiveQuotient
/- For the same torus the maximal split torus over `K^sh` is trivial (`X_*(T)^I = 0`), so the
reductive quotient of the special fibre of `𝒢°_x` has trivial maximal torus (Bruhat–Tits II,
4.6.12 (i), p. 129, over `K^sh`) and is the trivial group; the special fibre itself is `G_a` when
`char 𝓀 ≠ 2` (from `x² - ϖy² = 1`). Hence `reductiveQuotientMap` is not surjective, `reduction` is
trivial, `P⁺_x = P°_x`, and `parahoricQuotientEquiv` has trivial values. -/
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K))
    (φ : Valuation (NormTorus.quadraticData K L hd).rootDatum)
    [GeometricValuation (NormTorus.quadraticData K L hd) φ] (x : Apartment φ) :
    Nonempty (Parahoric.reductiveQuotient (NormTorus.quadraticData K L hd) φ {x} ≅
        TauCeti.FiniteTypeCommHopfAlgCat.of 𝓀[K] 𝓀[K]) ∧
      ¬ Function.Surjective
        (Parahoric.reductiveQuotientMap (NormTorus.quadraticData K L hd) φ {x}).hom.hom ∧
      (∀ g, Parahoric.reduction (NormTorus.quadraticData K L hd) φ {x} g = 1) ∧
      Parahoric.proUnipotentRadical (NormTorus.quadraticData K L hd) φ {x} =
        parahoricSubgroup (NormTorus.quadraticData K L hd) φ {x} ∧
      ∀ q,
        Parahoric.parahoricQuotientEquiv (NormTorus.quadraticData K L hd) φ {x} q = 1 := sorry

end Examples

end BruhatTits.Hyperspecial

/-! ### Associated and very special parahorics, integral models of stabilizers, Moy–Prasad
filtrations, Lang's theorem -/

/-! ### Associated, quasi- and very special parahorics -/

namespace BruhatTits.ParahoricExt

open TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
  {H H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

open scoped Classical in
/-- Associated parahoric for a central epimorphism `G → G′` (given contravariantly as
`f : H′ ⟶ H`): the connected parahoric model of `G′` at the image of `Ω` under the induced
apartment map. BT II 4.2.15, pp. 93–94; Kisin–Pappas §1.1.3, p. 7. -/
def associatedParahoric (f : H' ⟶ H) (hf : Building.CentralSurjection f)
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] : CommHopfAlgCat.{u} 𝒪[K] :=
  parahoricGroupScheme (Building.centralData D f hf) (Building.centralValuation D φ f hf)
    (Ω.image (Building.centralApartment D φ f hf))

/-- The contravariant map of parahoric Hopf algebras extends the specified generic map. -/
def associatedParahoric_hom (f : H' ⟶ H) (hf : Building.CentralSurjection f)
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    associatedParahoric f hf D φ Ω ⟶ parahoricGroupScheme D φ Ω := sorry

open scoped Classical in
/-- The generic fibre is the target group, as a Hopf algebra: the generic-fibre identification of
the parahoric model `GroupScheme.parahoricModel` of the target datum. -/
def associatedParahoric_generic_fibre (f : H' ⟶ H) (hf : Building.CentralSurjection f)
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    CommHopfAlgCat.of K (K ⊗[𝒪[K]] (associatedParahoric f hf D φ Ω : Type u)) ≅ H'.obj :=
  (ObjectProperty.ι _).mapIso (GroupScheme.parahoricModel (Building.centralData D f hf)
    (Building.centralValuation D φ f hf) (Ω.image (Building.centralApartment D φ f hf))).genericFibre

/-- Extension agrees on coordinate functions after the two generic-fibre identifications. -/
theorem associatedParahoric_hom_generic (f : H' ⟶ H) (hf : Building.CentralSurjection f)
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] (a : associatedParahoric f hf D φ Ω) :
    (GroupScheme.parahoricModel D φ Ω).genericFibre.hom.hom.hom
        (1 ⊗ₜ[𝒪[K]] (associatedParahoric_hom f hf D φ Ω).hom a) =
      f.hom.hom ((associatedParahoric_generic_fibre f hf D φ Ω).hom.hom (1 ⊗ₜ[𝒪[K]] a)) := sorry

-- Test ParahoricExt.associated_identity
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (hf : Building.CentralSurjection (𝟙 H)) (x : Apartment φ) :
    IsIso (associatedParahoric_hom (𝟙 H) hf D φ {x}) := sorry

open scoped Classical in
-- Test ParahoricExt.associated_points_le
example (f : H' ⟶ H) (hf : Building.CentralSurjection f)
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (x : Apartment φ) :
    (parahoricSubgroup D φ {x}).map (Building.pointsMap f) ≤
      parahoricSubgroup (Building.centralData D f hf) (Building.centralValuation D φ f hf)
        (({x} : Finset (Apartment φ)).image (Building.centralApartment D φ f hf)) := sorry

open scoped Classical in
-- Test ParahoricExt.associated_points_not_surjective
/- For the squaring isogeny `G_m → G_m` (`GL₁`) over a local field of odd residue characteristic
the integral map is not onto on `𝒪`-points: the image `(𝒪ˣ)²` of the source parahoric `𝒪ˣ` has
index two. Faithful flatness of the integral map does not give surjectivity on `𝒪`-points. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (h2 : (2 : 𝓀[K]) ≠ 0)
    (f : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1 ⟶
      TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
    (hf : Building.CentralSurjection f)
    (hsq : ∀ g, TauCeti.GeneralLinear.pointsMulEquiv 1 (Building.pointsMap f g) =
      TauCeti.GeneralLinear.pointsMulEquiv 1 g ^ 2)
    (x : Apartment (GLBuilding.standardValuation (K := K) 1)) :
    (parahoricSubgroup (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) {x}).map
        (Building.pointsMap f) ≠
      parahoricSubgroup (Building.centralData (GLBuilding.standardData 1) f hf)
        (Building.centralValuation (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) f hf)
        (({x} : Finset (Apartment (GLBuilding.standardValuation (K := K) 1))).image
          (Building.centralApartment (GLBuilding.standardData 1) (GLBuilding.standardValuation 1)
            f hf)) := sorry

-- Test ParahoricExt.associated_identity_scheme
/- Degenerate case: for the identity of `H` the associated parahoric is the parahoric group scheme
of `D` at `x` itself. -/
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (hf : Building.CentralSurjection (𝟙 H)) (x : Apartment φ) :
    Nonempty (associatedParahoric (𝟙 H) hf D φ {x} ≅ parahoricGroupScheme D φ {x}) := sorry

-- Test ParahoricExt.associated_GL1
/- For a central surjection of `G_m = GL₁` onto itself (the identity, the inversion or the squaring
isogeny) the associated parahoric is the split torus `G_m` over `𝒪`, the coordinate Hopf algebra
`𝒪[t, t⁻¹]` of `GL₁` over `𝒪`, at every point. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (f : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1 ⟶
      TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
    (hf : Building.CentralSurjection f) (x : Apartment (GLBuilding.standardValuation (K := K) 1)) :
    Nonempty (associatedParahoric f hf (GLBuilding.standardData 1) (GLBuilding.standardValuation 1)
      {x} ≅ TauCeti.GeneralLinear.coordinateHopfAlgebra 𝒪[K] 1) := sorry

-- Test ParahoricExt.associated_hom_not_iso_square (non-example)
/- For the squaring isogeny of `G_m = GL₁` the integral map is `t ↦ t²` on `G_m` over `𝒪`, which
is not an isomorphism (its generic fibre `f` is not surjective), in every residue characteristic. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (f : TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1 ⟶
      TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
    (hf : Building.CentralSurjection f)
    (hsq : ∀ g, TauCeti.GeneralLinear.pointsMulEquiv 1 (Building.pointsMap f g) =
      TauCeti.GeneralLinear.pointsMulEquiv 1 g ^ 2)
    (x : Apartment (GLBuilding.standardValuation (K := K) 1)) :
    ¬ IsIso (associatedParahoric_hom f hf (GLBuilding.standardData 1)
      (GLBuilding.standardValuation 1) {x}) := sorry

-- Test ParahoricExt.associated_hom_injective
/- The integral map is injective on coordinate rings: the coordinate ring of `𝒢′°` is flat over `𝒪`,
so it embeds in its generic fibre `H′`, on which the map is the injective `f`
(`associatedParahoric_hom_generic`). -/
example (f : H' ⟶ H) (hf : Building.CentralSurjection f)
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (x : Apartment φ) :
    Function.Injective ⇑(associatedParahoric_hom f hf D φ {x}).hom := sorry

/-- The connected parahoric `𝒢°_x(𝒪)` is normal in the full fixer `𝒢_x(𝒪)`, the integral points of
the Bruhat–Tits stabilizer scheme `GroupScheme.toSmoothModel D φ {x}`. -/
instance parahoric_normal_fixer (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    [GeometricValuation D φ] (x : Apartment φ) :
    ((parahoricSubgroup D φ {x}).subgroupOf
      (GroupScheme.toSmoothModel D φ {x}).integralPoints).Normal := sorry

/-- A level subgroup `𝒦 ⊆ G(K)` is quasi-parahoric at the level of rational points when it lies
between the parahoric subgroup `𝒢°_x(𝒪)` and the full fixer `𝒢_x(𝒪)` of some point `x` of the
apartment. -/
structure IsQuasiParahoric (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (𝒦 : Subgroup (WithConv (H →ₐ[K] K))) : Prop where
  exists_point : ∃ x : Apartment φ, parahoricSubgroup D φ {x} ≤ 𝒦 ∧
    𝒦 ≤ (GroupScheme.toSmoothModel D φ {x}).integralPoints

theorem isQuasiParahoric_parahoric (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (x : Apartment φ) : IsQuasiParahoric D φ (parahoricSubgroup D φ {x}) :=
  ⟨⟨x, le_rfl, sorry⟩⟩

theorem isQuasiParahoric_fixer (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (x : Apartment φ) : IsQuasiParahoric D φ (GroupScheme.toSmoothModel D φ {x}).integralPoints :=
  ⟨⟨x, sorry, le_rfl⟩⟩

/-- The parahoric subgroup has finite index in the full fixer: `𝒢_x(𝒪)/𝒢°_x(𝒪)` embeds in the
component group of the special fibre. -/
theorem parahoric_index_fixer_finite (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (x : Apartment φ) :
    ((parahoricSubgroup D φ {x}).subgroupOf
      (GroupScheme.toSmoothModel D φ {x}).integralPoints).FiniteIndex := sorry

-- Test BruhatTits.ParahoricExt.isQuasiParahoric_simplyConnected
/- For simply connected `G` (trivial algebraic fundamental group) the full fixer is the parahoric
(`Parahoric.fixer_eq_parahoric_of_simplyConnected`), so the quasi-parahoric levels are exactly the
parahoric subgroups of points of the apartment. -/
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (A : AbsoluteRootData K H) [Subsingleton (AlgebraicFundamentalGroup A)]
    (𝒦 : Subgroup (WithConv (H →ₐ[K] K))) :
    IsQuasiParahoric D φ 𝒦 ↔ ∃ x : Apartment φ, 𝒦 = parahoricSubgroup D φ {x} := by
  constructor
  · rintro ⟨x, h₁, h₂⟩
    have hfix : (GroupScheme.toSmoothModel D φ {x}).integralPoints = parahoricSubgroup D φ {x} := by
      rw [GroupScheme.integralPoints_eq_fixer, Finset.coe_singleton, Set.image_singleton]
      exact Parahoric.fixer_eq_parahoric_of_simplyConnected D φ A x
    exact ⟨x, le_antisymm (hfix ▸ h₂) h₁⟩
  · rintro ⟨x, rfl⟩
    exact isQuasiParahoric_parahoric D φ x

-- Test BruhatTits.ParahoricExt.isQuasiParahoric_normTorus_count
/- For the ramified quadratic norm-one torus over a model field of characteristic different from two, in every residue
characteristic the parahoric has index two in the full fixer, so exactly two levels lie between
them: `𝒯°(𝒪)` and `𝒯^ft(𝒪) = T(K)`. The datum has no roots, so `φ` is its unique valuation. -/
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1) (a : L)
    (ha : a ^ 2 = algebraMap K L (π : K))
    (φ : Valuation (NormTorus.quadraticData K L hd).rootDatum)
    [GeometricValuation (NormTorus.quadraticData K L hd) φ] (x : Apartment φ) :
    Nat.card {𝒦 : Subgroup (WithConv (NormTorus.coordinateHopf K L →ₐ[K] K)) //
      parahoricSubgroup (NormTorus.quadraticData K L hd) φ {x} ≤ 𝒦 ∧
        𝒦 ≤ (GroupScheme.toSmoothModel (NormTorus.quadraticData K L hd) φ {x}).integralPoints} =
      2 := sorry

-- Test BruhatTits.ParahoricExt.not_isQuasiParahoric_stabilizer
/- For `GL₂` over a local field the scalar `ϖ` lies in the stabilizer of every point of the reduced
building but in no full fixer `𝒢_x(𝒪)` (its determinant `ϖ²` is not a unit), so no level containing
it is quasi-parahoric. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (z : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K))
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z : Matrix (Fin 2) (Fin 2) K) =
      Matrix.scalar (Fin 2) (π : K))
    (𝒦 : Subgroup (WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K)))
    (hz𝒦 : z ∈ 𝒦) :
    ¬ IsQuasiParahoric (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2) 𝒦 :=
  sorry

-- Test BruhatTits.ParahoricExt.isQuasiParahoric_GL
/- For `GL_n` every full fixer is connected (`π₁(GL_n) = ℤ` is torsion-free), so every
quasi-parahoric level is a parahoric subgroup. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (n : ℕ)
    (𝒦 : Subgroup (WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n →ₐ[K] K)))
    (h : IsQuasiParahoric (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n) 𝒦) :
    ∃ x : Apartment (GLBuilding.standardValuation (K := K) n),
      𝒦 = parahoricSubgroup (GLBuilding.standardData n) (GLBuilding.standardValuation n) {x} :=
  sorry

/-- A point `x` of the apartment of `S` over a nonarchimedean local field is very special when it is
special in this apartment and its image under the unramified descent `apartmentDescent` (into the
apartment of a descended maximal `Ĕ`-split torus `A` containing `S`) is special in the apartment over
`Ĕ`. [Haines], §6.2, p. 14; [van Hoften], §2.2.5, p. 15. -/
def IsVerySpecial [TopologicalSpace K] [IsNonarchimedeanLocalField K] (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) (x : Apartment φ) : Prop :=
  Facet.IsSpecial x ∧
    Facet.IsSpecial (apartmentDescent D φ GeometricValuation.compatible A hS x)

omit [ModelField K] in
theorem IsVerySpecial.isSpecial [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    {D : LocalRootData K H} {φ : Valuation D.rootDatum} [GeometricValuation D φ]
    {A : UnramifiedApartmentData H} {hS : A.torusIdeal ≤ D.splitTorus} {x : Apartment φ}
    (h : IsVerySpecial D φ A hS x) : Facet.IsSpecial x := by
  unfold IsVerySpecial at h
  exact h.1

/-- For quasi-split `G` (the centralizer of the maximal split torus is a torus) a very special point
exists. [van Hoften], §2.2.5, p. 15; [Haines], §6.2, p. 14. -/
theorem exists_isVerySpecial [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (A : UnramifiedApartmentData H) (hS : A.torusIdeal ≤ D.splitTorus)
    (_quasiSplit : TauCeti.torusCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H (GeometricRoots.centralizerIdeal D.splitTorus))) :
    ∃ x : Apartment φ, IsVerySpecial D φ A hS x := sorry

/-- For `v ∈ Ω` the parahoric of `Ω` lies in the parahoric of `v`; for `Ω` the vertex set of the base
alcove this puts the Iwahori subgroup inside every vertex parahoric, very special or not. -/
theorem parahoric_le_of_mem (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (C : Finset (Apartment φ)) [Fact C.Nonempty] (v : Apartment φ) (hv : v ∈ C) :
    parahoricSubgroup D φ C ≤ parahoricSubgroup D φ {v} := sorry

-- Test BruhatTits.ParahoricExt.isVerySpecial_GL2_iff
/- For split `GL₂` over a local field a point of the standard apartment with coordinates `(v₀, v₁)`
is very special exactly when `v₀ - v₁ ∈ ℤ`: these are the vertices, all hyperspecial. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (A : UnramifiedApartmentData (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2))
    (hA : A.torusIdeal = (GLBuilding.standardData (K := K) 2).splitTorus)
    (x : Apartment (GLBuilding.standardValuation (K := K) 2)) :
    IsVerySpecial (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) A hA.le x ↔
      ∃ k : ℤ, GLBuilding.standardCoordinates 2 x.displacement 0 -
        GLBuilding.standardCoordinates 2 x.displacement 1 = k := sorry

-- Test BruhatTits.ParahoricExt.not_isVerySpecial_GL2_barycentre
/- The barycentre `(0, -1/2)` of the standard `GL₂` alcove is not very special (not even special):
its Iwahori subgroup is contained in, but differs from, the two vertex parahorics. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (A : UnramifiedApartmentData (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2))
    (hA : A.torusIdeal = (GLBuilding.standardData (K := K) 2).splitTorus)
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![0, -1 / 2]) :
    ¬ IsVerySpecial (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) A hA.le x := sorry

-- Test BruhatTits.ParahoricExt.isVerySpecial_of_isEmpty_roots
/- Degenerate case: when the group has no roots over `Ĕ` (an anisotropic torus over `Ĕ`, such as
the ramified quadratic norm-one torus), every point that is special over `E` is very special. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (D : LocalRootData K H)
    (φ : Valuation D.rootDatum) [GeometricValuation D φ] (A : UnramifiedApartmentData H)
    (hS : A.torusIdeal ≤ D.splitTorus) [IsEmpty A.data.ι] (x : Apartment φ)
    (hx : Facet.IsSpecial x) : IsVerySpecial D φ A hS x := by
  unfold IsVerySpecial Facet.IsSpecial
  exact ⟨hx, fun i => isEmptyElim i⟩

/-- Exactness for a central extension with split torus kernel, a case of Kisin–Zhou Prop. 2.4.13
(split tori are R-smooth, Kisin–Zhou §2.4.5). The kernel is the actual scheme-theoretic kernel on
every coefficient algebra. -/
theorem centralExtension_exact_split [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (f : H' ⟶ H) (hf : Building.CentralSurjection f)
    (Z : TauCeti.HopfIdeal K H)
    (hZ : TauCeti.splitTorusCommHopfAlgProperty K (TauCeti.FiniteTypeCommHopfAlgCat.quotient H Z))
    (hker : ∀ (R : Type u) [CommRing R] [Algebra K R] (z : WithConv (H →ₐ[K] R)),
      z ∈ subgroupPoints Z R ↔ WithConv.toConv (z.ofConv.comp f.hom.hom.toAlgHom) =
        (1 : WithConv (H' →ₐ[K] R)))
    (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (x : Apartment φ) :
    let β := associatedParahoric_hom f hf D φ {x}
    letI := β.hom.toAlgHom.toRingHom.toAlgebra
    Module.FaithfullyFlat (associatedParahoric f hf D φ {x}) (parahoricGroupScheme D φ {x}) ∧
      Algebra.FinitePresentation (associatedParahoric f hf D φ {x}) (parahoricGroupScheme D φ {x}) := sorry

end BruhatTits.ParahoricExt

/-! ### Kisin–Pappas–Zhou integral models of stabilizers -/

namespace KisinPappas

open ValuativeRel

variable {K : Type u} [Field K] [ValuativeRel K]

/-- KPZ, proof of Thm 6.2.3, p. 71, rescaling step: if a lattice `Λ` is self-dual up to the
homothety `c` for a bilinear form `h` (`Λ^∨ = c Λ`) and `c` has a square root `s`, then `sΛ` is
self-dual. -/
theorem hyperspecial_orthogonal_selfDual {n : ℕ} (h : LinearMap.BilinForm K (Fin n → K))
    (Λ : Submodule 𝒪[K] (Fin n → K)) (c s : K) (hs : s * s = c) (hs0 : s ≠ 0)
    (hdual : ∀ v, (∀ w ∈ Λ, h v w ∈ 𝒪[K]) ↔ c⁻¹ • v ∈ Λ) :
    ∀ v, (∀ w, s⁻¹ • w ∈ Λ → h v w ∈ 𝒪[K]) ↔ s⁻¹ • v ∈ Λ := by
  intro v
  have hcs : c⁻¹ • (s • v) = s⁻¹ • v := by
    rw [smul_smul, ← hs, mul_inv_rev, mul_assoc, inv_mul_cancel₀ hs0, mul_one]
  rw [← hcs, ← hdual]
  constructor
  · intro H w hw
    have := H (s • w) (by rwa [smul_smul, inv_mul_cancel₀ hs0, one_smul])
    simpa [LinearMap.map_smul, LinearMap.smul_apply, smul_eq_mul, mul_comm] using this
  · intro H w hw
    have := H (s⁻¹ • w) hw
    simpa [LinearMap.map_smul, LinearMap.smul_apply, smul_eq_mul, hs0] using this

end KisinPappas

/-! ### Explicit level subgroups of `GL_n` -/

namespace LevelSubgroups

open ValuativeRel

variable (K : Type u) [Field K] [ValuativeRel K] [ModelField K] (n : ℕ)

/-- `GL_n(𝒪)`: integral matrices with integral inverse (equivalently unit determinant). -/
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

/-- The pro-`p` Iwahori subgroup: unipotent upper triangular modulo `𝓂[K]`. -/
def proPIwahori : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ iwahori K n ∧
    ∀ i, valuation K ((g : Matrix (Fin n) (Fin n) K) i i - 1) < 1}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The principal congruence subgroup `1 + 𝓂[K]^m M_n(𝒪)` (for `m = 0`, all of `GL_n(𝒪)`). -/
def principalCongruence (m : ℕ) : Subgroup (GL (Fin n) K) where
  carrier := {g | g ∈ integralGL K n ∧ ∀ i j, ∃ a : 𝒪[K], a ∈ 𝓂[K] ^ m ∧
    (a : K) = (g : Matrix (Fin n) (Fin n) K) i j - (1 : Matrix (Fin n) (Fin n) K) i j}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The standard level subgroups are Bruhat–Tits groups of the `GL_n` building over a local
field: through `TauCeti.GeneralLinear.pointsMulEquiv`, the parahoric subgroup at the standard
vertex (coordinates `0`) is `GL_n(𝒪)`, and at the barycentre of the standard alcove (coordinates
`vᵢ = -i/n`) it is the Iwahori subgroup, whose pro-unipotent radical is the pro-`p` Iwahori.
BT 1984 3.6, p. 288, and 3.9, p. 289; Kisin–Pappas §1.1.9, pp. 8–9. -/
theorem iwahori_isParahoric [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x₀ x : BruhatTits.Apartment (GLBuilding.standardValuation (K := K) n))
    (hx₀ : GLBuilding.standardCoordinates n x₀.displacement = 0)
    (hx : GLBuilding.standardCoordinates n x.displacement = fun i : Fin n => -((i : ℕ) : ℝ) / n) :
    (BruhatTits.parahoricSubgroup (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        {x₀}).map (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) n).toMonoidHom =
      integralGL K n ∧
    (BruhatTits.parahoricSubgroup (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        {x}).map (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) n).toMonoidHom =
      iwahori K n ∧
    (BruhatTits.Parahoric.proUnipotentRadical (GLBuilding.standardData n)
        (GLBuilding.standardValuation n) {x}).map
        (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) n).toMonoidHom =
      proPIwahori K n := sorry

-- Test LevelSubgroups.integralGL_eq_range
/- Agreement with the image of Mathlib's `GL_n(𝒪) → GL_n(K)`. -/
example : integralGL K n = (Matrix.GeneralLinearGroup.map (algebraMap 𝒪[K] K)).range := sorry

-- Test LevelSubgroups.not_mem_integralGL
/- `diag(ϖ, 1)` has integral entries but is not in `GL₂(𝒪)`: its inverse has the entry `ϖ⁻¹`. -/
example (ϖ : K) (hϖ0 : ϖ ≠ 0) (hϖ : valuation K ϖ < 1) (g : GL (Fin 2) K)
    (hg : (g : Matrix (Fin 2) (Fin 2) K) = Matrix.diagonal ![ϖ, 1]) :
    g ∉ integralGL K 2 := sorry

-- Test LevelSubgroups.principalCongruence_zero
/- Degenerate level `m = 0`: the congruence condition is empty. -/
example : principalCongruence K n 0 = integralGL K n := sorry

-- Test LevelSubgroups.principalCongruence_diag
/- `diag(1 + ϖ, 1)` is in the first but not the second principal congruence subgroup. -/
example (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (g : GL (Fin 2) K)
    (hg : (g : Matrix (Fin 2) (Fin 2) K) = Matrix.diagonal ![1 + (ϖ : K), 1]) :
    g ∈ principalCongruence K 2 1 ∧ g ∉ principalCongruence K 2 2 := sorry

-- Test LevelSubgroups.iwahori_relIndex_two
/- `[GL₂(𝒪) : I] = q + 1`: reduction identifies `GL₂(𝒪)/I` with `GL₂(𝓀)/B(𝓀) = ℙ¹(𝓀)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    (iwahori K 2).relIndex (integralGL K 2) = Nat.card 𝓀[K] + 1 := sorry

-- Test LevelSubgroups.iwahori_one
/- Degenerate rank `n = 1`: there is nothing below the diagonal. -/
example : iwahori K 1 = integralGL K 1 := sorry

-- Test LevelSubgroups.not_mem_iwahori
/- The lower unipotent matrix with entry `1` is in `GL₂(𝒪)` but not in the Iwahori subgroup. -/
example (g : GL (Fin 2) K) (hg : (g : Matrix (Fin 2) (Fin 2) K) = !![1, 0; 1, 1]) :
    g ∈ integralGL K 2 ∧ g ∉ iwahori K 2 := sorry

-- Test LevelSubgroups.proPIwahori_normal
example : ((proPIwahori K n).subgroupOf (iwahori K n)).Normal := sorry

-- Test LevelSubgroups.proPIwahori_eq_iwahori_of_card_two
/- Degenerate residue field `𝓀 = 𝔽₂`: every unit is `≡ 1`, so the two subgroups coincide. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (h2 : Nat.card 𝓀[K] = 2) :
    proPIwahori K n = iwahori K n := sorry

-- Test LevelSubgroups.proPIwahori_charpoly
/- Elements of the pro-`p` Iwahori of `GL₄` (hence of `GSp₄`) have characteristic polynomial
`≡ (X − 1)⁴` modulo `𝓂[K]`. -/
example (g : GL (Fin 4) K) (hg : g ∈ proPIwahori K 4) (k : ℕ) :
    valuation K (((g : Matrix (Fin 4) (Fin 4) K).charpoly - (Polynomial.X - 1) ^ 4).coeff k) < 1 :=
  sorry

end LevelSubgroups

/-! ### Moy–Prasad filtrations -/

namespace MoyPrasad

open TauCetiRoadmap.ReductiveGroupsPartII.BruhatTits ValuativeRel

/-- The filtration `Z(K)_r` of the minimal Levi `Z = Z_G(S)` (`r ≥ 0`), whose depth-zero term is
its parahoric `Z(K)_0`. -/
def torusFiltration {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : LocalRootData K H) (r : ℝ) :
    Subgroup (WithConv (H →ₐ[K] K)) := sorry

variable {K : Type u} [Field K] [ValuativeRel K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}
  (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]

/-- The Moy–Prasad subgroup `G_{y,r}` at a point of the building, defined by Moy–Prasad for
`r ≥ 0`; for `r < 0` it is `G_{y,0}` by convention (`filtration_of_neg`). -/
def filtration [ModelField K] (y : Building D φ) (r : ℝ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  sorry

/-- `G_{y,r+} = ⋃_{s > r} G_{y,s}`. -/
def filtrationPlus [ModelField K] (y : Building D φ) (r : ℝ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  ⨆ (s : ℝ) (_ : r < s), filtration D φ y s

section

variable [ModelField K]

theorem filtration_of_neg (y : Building D φ) {r : ℝ} (hr : r < 0) :
    filtration D φ y r = filtration D φ y 0 := sorry

theorem torusFiltration_zero : torusFiltration D 0 = minimalLeviParahoric D := sorry

theorem torusFiltration_le (r : ℝ) : torusFiltration D r ≤ D.rootDatum.T := sorry

theorem filtration_zero (x : Apartment φ) :
    filtration D φ (apartmentEmbedding D φ x) 0 = parahoricSubgroup D φ {x} := sorry

theorem filtration_antitone (y : Building D φ) : Antitone (filtration D φ y) := sorry

theorem filtration_normal (y : Building D φ) {r : ℝ} (hr : 0 ≤ r) :
    ((filtration D φ y r).subgroupOf (filtration D φ y 0)).Normal := sorry

instance filtrationPlus_normal (y : Building D φ) (r : ℝ) :
    ((filtrationPlus D φ y r).subgroupOf (filtration D φ y r)).Normal := sorry

theorem commutator_filtration_le (y : Building D φ) {r s : ℝ} (hr : 0 ≤ r) (hs : 0 ≤ s) :
    ⁅filtration D φ y r, filtration D φ y s⁆ ≤ filtration D φ y (r + s) := sorry

theorem filtration_conj (g : WithConv (H →ₐ[K] K)) (y : Building D φ) (r : ℝ) :
    filtration D φ (g • y) r = (filtration D φ y r).map (MulAut.conj g).toMonoidHom := sorry

/-- Generators: the minimal-Levi part and the root-group filtrations `U_{a,x,r}` of the valuation
`x` (a point of the apartment is a valuation equipollent to `φ`). -/
theorem filtration_eq_closure_generators (x : Apartment φ) {r : ℝ} (hr : 0 < r) :
    filtration D φ (apartmentEmbedding D φ x) r =
      Subgroup.closure ((torusFiltration D r : Set (WithConv (H →ₐ[K] K))) ∪
        ⋃ i, (x.1.filtration i r : Set (WithConv (H →ₐ[K] K)))) := sorry

-- Test MoyPrasad.filtration_GL_vertex
/- For `GL_n` at the standard vertex and `r > 0`, `G_{x,r} = 1 + ϖ^{⌈r⌉} M_n(𝒪)`; the ceiling fixes
the normalization (`G_{x,1/2} = G_{x,1} = 1 + ϖ M_n(𝒪)`). -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (n : ℕ)
    (x : Apartment (GLBuilding.standardValuation (K := K) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0) {r : ℝ} (hr : 0 < r) :
    (filtration (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        (apartmentEmbedding _ _ x) r).map
        (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) n).toMonoidHom =
      LevelSubgroups.principalCongruence K n ⌈r⌉₊ := sorry

-- Test MoyPrasad.filtration_split_torus
/- For the split torus `G_m = GL₁` the filtration is the unit filtration `1 + 𝓂^{⌈r⌉}` at every
point of the building (two-term witness: `G_{y,1} = 1 + 𝓂`, `G_{y,3/2} = 1 + 𝓂²`). -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    {r : ℝ} (hr : 0 < r) :
    (filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y r).map
        (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) 1).toMonoidHom =
      LevelSubgroups.principalCongruence K 1 ⌈r⌉₊ := sorry

-- Test MoyPrasad.torusFiltration_GL
/- For `GL_n` the minimal Levi is the diagonal torus and `T(K)_r` is its diagonal part with entries
in `1 + 𝓂^{⌈r⌉}` (`r > 0`). -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (n : ℕ) {r : ℝ} (hr : 0 < r) :
    (torusFiltration (GLBuilding.standardData (K := K) n) r).map
        (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) n).toMonoidHom =
      LevelSubgroups.principalCongruence K n ⌈r⌉₊ ⊓
        { carrier := {g | ∀ i j, i ≠ j → (g : Matrix (Fin n) (Fin n) K) i j = 0},
          mul_mem' := sorry, one_mem' := sorry, inv_mem' := sorry } := sorry

-- Test MoyPrasad.filtrationPlus_split_torus
/- For `G_m = GL₁`, `G_{y,r+} = 1 + 𝓂^{⌊r⌋+1}` (`r ≥ 0`): the next integer above `r`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    {r : ℝ} (hr : 0 ≤ r) :
    (filtrationPlus (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y r).map
        (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) 1).toMonoidHom =
      LevelSubgroups.principalCongruence K 1 (⌊r⌋₊ + 1) := sorry

-- Test MoyPrasad.filtrationPlus_jump
/- For `G_m = GL₁` the filtration jumps at `r = 1`: `G_{y,1+} = 1 + 𝓂² ≠ 1 + 𝓂 = G_{y,1}`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1)) :
    filtrationPlus (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 1 ≠
      filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 1 := sorry

-- Test MoyPrasad.torusFiltration_eq_filtration_of_isEmpty
/- Degenerate case: without roots (`G` anisotropic modulo its centre, so `G = Z`) the Moy–Prasad
filtration at every point is the minimal-Levi filtration. -/
example [IsEmpty D.ι] (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    filtration D φ y r = torusFiltration D r := sorry

-- Test MoyPrasad.torusFiltration_ne_filtration_GL2
/- For `GL₂` at the standard vertex, `1 + ϖ E₁₂ ∈ G_{x,1}` is not diagonal, so the torus part is a
proper subgroup. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = 0) :
    torusFiltration (GLBuilding.standardData (K := K) 2) 1 ≠
      filtration (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        (apartmentEmbedding _ _ x) 1 := sorry

-- Test MoyPrasad.filtrationPlus_zero_eq_proUnipotent
/- `G_{x,0+}` is the pro-unipotent radical `P⁺_x`, the kernel of the reduction of the parahoric to
the reductive quotient (`Parahoric.proUnipotentRadical`). -/
example (x : Apartment φ) :
    filtrationPlus D φ (apartmentEmbedding D φ x) 0 = Parahoric.proUnipotentRadical D φ {x} :=
  sorry

-- Test MoyPrasad.filtration_jump_nonexample
/- For `G_m = GL₁`, `G_{y,1/2} = G_{y,1}`: the filtration is not strictly decreasing in `r`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1)) :
    filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y (1 / 2) =
        filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 1 ∧
      ¬ StrictAnti (filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y) := by
  have heq : filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y (1 / 2) =
      filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 1 := sorry
  exact ⟨heq, fun h => absurd heq (h.injective.ne (by norm_num))⟩

end

/-! The Lie algebra `Lie(G)(K)` is Tau Ceti's tangent space at the identity, the `K`-module of
counit derivations `Derivation K H (Bialgebra.CounitAlgebra K H K)` (ReductiveGroups layer 2). Its
bracket is the convolution commutator (`Derivation.coe_bracket`, `Tangent.Lie.Basic`), and `G(K)`
acts through `Derivation.adRepresentation`. -/

local notation "𝔤" => Derivation K H (TauCeti.Bialgebra.CounitAlgebra K H K)

/-- The adjoint action `Ad : G(K) → GL(Lie(G)(K))`, `Ad g d = g ⋆ d ⋆ g⁻¹`. -/
def Ad (g : WithConv (H →ₐ[K] K)) : 𝔤 →ₗ[K] 𝔤 :=
  Derivation.adRepresentation K
    (TauCeti.AlgHom.mapValue (TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K H K).symm.toAlgHom g)

-- Test MoyPrasad.Ad_one
example : Ad (1 : WithConv (H →ₐ[K] K)) = LinearMap.id := by
  simp only [Ad, map_one]
  rfl

-- Test MoyPrasad.Ad_mul
example (g h : WithConv (H →ₐ[K] K)) : Ad (g * h) = Ad g ∘ₗ Ad h := by
  simp only [Ad, map_mul]
  rfl

-- Test MoyPrasad.Ad_GL
/- For `GL_n`, reading a tangent vector as the matrix `(d(x_{ij}))`, `Ad g` is conjugation
`M ↦ g M g⁻¹`. -/
example (n : ℕ)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n →ₐ[K] K))
    (d : Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n) K))
    (i j : Fin n) :
    TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
        (Ad g d (TauCeti.GeneralLinear.genericMatrix K n i j)) =
      ((TauCeti.GeneralLinear.pointsMulEquiv n g : Matrix (Fin n) (Fin n) K) *
        Matrix.of (fun k l => TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
          (d (TauCeti.GeneralLinear.genericMatrix K n k l))) *
        ((TauCeti.GeneralLinear.pointsMulEquiv n g)⁻¹ : Matrix.GeneralLinearGroup (Fin n) K)) i j :=
  sorry

/-- The Moy–Prasad lattice `𝔤_{y,r}` of `Lie(G)(K)` (`r ∈ ℝ`). -/
def lieLattice [ModelField K] (y : Building D φ) (r : ℝ) : Submodule 𝒪[K] 𝔤 := sorry

/-- `𝔤_{y,r+}`. -/
def lieLatticePlus [ModelField K] (y : Building D φ) (r : ℝ) : Submodule 𝒪[K] 𝔤 :=
  ⨆ (s : ℝ) (_ : r < s), lieLattice D φ y s

/-- The dual lattice `𝔤*_{y,r} = {X : X(𝔤_{y,(−r)+}) ⊆ 𝓂}`. -/
def dualLattice [ModelField K] (y : Building D φ) (r : ℝ) : AddSubgroup (Module.Dual K 𝔤) where
  carrier := {X | ∀ Y ∈ lieLatticePlus D φ y (-r), valuation K (X Y) < 1}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

/-- The depth `d(y, X) = sup {r : X ∈ 𝔤*_{y,r}}` of a dual element at `y`, in `EReal`
(`d(y, 0) = ⊤`). -/
def depth [ModelField K] (y : Building D φ) (X : Module.Dual K 𝔤) : EReal :=
  ⨆ (r : ℝ) (_ : X ∈ dualLattice D φ y r), (r : EReal)

section

variable [ModelField K]

theorem lieLattice_antitone (y : Building D φ) : Antitone (lieLattice D φ y) := sorry

theorem lieLattice_add_one (y : Building D φ) (ϖ : 𝒪[K]) (hϖ : Irreducible ϖ) (r : ℝ) (X : 𝔤) :
    X ∈ lieLattice D φ y (r + 1) ↔ ∃ Y ∈ lieLattice D φ y r, X = ϖ • Y := sorry

/-- `[𝔤_{y,r}, 𝔤_{y,s}] ⊆ 𝔤_{y,r+s}`, for the bracket `Z` of `X` and `Y` given by its defining
convolution commutator. -/
theorem lie_bracket_lieLattice_le (y : Building D φ) {r s : ℝ} {X Y Z : 𝔤}
    (hX : X ∈ lieLattice D φ y r) (hY : Y ∈ lieLattice D φ y s)
    (hZ : (Z : (H : Type u) →ₗ[K] TauCeti.Bialgebra.CounitAlgebra K H K) =
      (WithConv.toConv (X : (H : Type u) →ₗ[K] TauCeti.Bialgebra.CounitAlgebra K H K) *
          WithConv.toConv (Y : (H : Type u) →ₗ[K] TauCeti.Bialgebra.CounitAlgebra K H K)).ofConv -
        (WithConv.toConv (Y : (H : Type u) →ₗ[K] TauCeti.Bialgebra.CounitAlgebra K H K) *
          WithConv.toConv (X : (H : Type u) →ₗ[K] TauCeti.Bialgebra.CounitAlgebra K H K)).ofConv) :
    Z ∈ lieLattice D φ y (r + s) := sorry

/-- Each lattice is stable under the adjoint action of the parahoric subgroup at the same point. -/
theorem lieLattice_ad (y : Building D φ) (r : ℝ) {g : WithConv (H →ₐ[K] K)}
    (hg : g ∈ filtration D φ y 0) {X : 𝔤} (hX : X ∈ lieLattice D φ y r) :
    Ad g X ∈ lieLattice D φ y r := sorry

/-- Comparison under a finite extension `K′/K` of ramification index `e`, with `incl` the scalar
extension of tangent vectors and the building embedding `Building.extensionEmbedding`:
`𝔤_{y,r} = incl⁻¹ (𝔤_{K′})_{y,e·r}`, depths over `K′` being normalized by `K′` (Adler, Prop. 1.4.1,
p. 9, which needs no tameness). -/
theorem lieLattice_extension_inter [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (K' : Type u) [Field K'] [ValuativeRel K'] [TopologicalSpace K'] [IsNonarchimedeanLocalField K']
    [Algebra K K'] [Module.Finite K K'] [ValuativeExtension K K']
    (D' : LocalRootData K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H))
    (φ' : Valuation D'.rootDatum) [GeometricValuation D' φ']
    (e : ℕ) (_he : 0 < e)
    (_hnorm : ∀ u : Kˣ, Multiplicative.toAdd (normalizedOrder (K := K')
      (Units.map (algebraMap K K').toMonoidHom u)) =
        (e : ℤ) * Multiplicative.toAdd (normalizedOrder (K := K) u))
    (incl : 𝔤 → Derivation K' (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H)
      (TauCeti.Bialgebra.CounitAlgebra K'
        (TauCeti.FiniteTypeCommHopfAlgCat.baseChange (K := K') H) K'))
    (_hincl : ∀ (X : 𝔤) (a : H), incl X ((1 : K') ⊗ₜ[K] a) = algebraMap K K' (X a))
    (y : Building D φ) (r : ℝ) :
    (lieLattice D φ y r : Set 𝔤) =
      incl ⁻¹' (lieLattice D' φ' (Building.extensionEmbedding D φ K' (Iso.refl _) D' φ' y)
        ((e : ℝ) * r) : Set _) := sorry

/-- The jumps are discrete: `𝔤_{y,r−ε} = 𝔤_{y,r}` for small `ε > 0`. -/
theorem lieLattice_semicontinuous (y : Building D φ) (r : ℝ) :
    ∃ ε > 0, lieLattice D φ y (r - ε) = lieLattice D φ y r := sorry

-- Test MoyPrasad.lieLattice_GL_apartment
/- For `gl_n` at the point with coordinates `v`, a tangent vector `d` lies in `𝔤_{x,r}` exactly when
`r ≤ ω(d(x_{ij})) + vᵢ − vⱼ` for all matrix coordinates `x_{ij}`; at the standard vertex this is
`ϖ^{⌈r⌉} M_n(𝒪)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (n : ℕ)
    (x : Apartment (GLBuilding.standardValuation (K := K) n)) (r : ℝ)
    (d : Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n) K)) :
    d ∈ lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        (apartmentEmbedding _ _ x) r ↔
      ∀ i j, (r : WithTop ℝ) ≤ GLBuilding.ω K (TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
        (d (TauCeti.GeneralLinear.genericMatrix K n i j))) +
        ((GLBuilding.standardCoordinates n x.displacement i -
          GLBuilding.standardCoordinates n x.displacement j : ℝ) : WithTop ℝ) := sorry

-- Test MoyPrasad.lieLatticePlus_GL_vertex
/- At the standard vertex of `GL_n`, `𝔤_{x,r+} = ϖ^{⌊r⌋+1} M_n(𝒪)`: strict inequality. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (n : ℕ)
    (x : Apartment (GLBuilding.standardValuation (K := K) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0) (r : ℝ)
    (d : Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n) K)) :
    d ∈ lieLatticePlus (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        (apartmentEmbedding _ _ x) r ↔
      ∀ i j, (r : WithTop ℝ) < GLBuilding.ω K (TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
        (d (TauCeti.GeneralLinear.genericMatrix K n i j))) := sorry

-- Test MoyPrasad.depth_zero_eq_top
example (y : Building D φ) : depth D φ y 0 = ⊤ := sorry

-- Test MoyPrasad.depth_Gm
/- For `G_m = GL₁` and `X = c · d(x₀₀)` with `c ≠ 0`, the depth is `ω(c)` (two-term witness:
`c = 1` gives depth `0`, `c = ϖ` gives depth `1`); this fixes the sign `(−r)+` in `𝔤*_{y,r}`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    (c : K) (hc : c ≠ 0)
    (X : Module.Dual K (Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) K)))
    (hX : ∀ d, X d = c * TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
      (d (TauCeti.GeneralLinear.genericMatrix K 1 0 0))) :
    depth (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y X =
      (((Multiplicative.toAdd (TauCeti.normalizedValuation K (Units.mk0 c hc)) : ℤ) : ℝ) : EReal) :=
  sorry

-- Test MoyPrasad.depth_Gm_uniformizer
/- The second term of the two-term witness: for `X = ϖ · d(x₀₀)` the depth is `1`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    (π : Kˣ) (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (X : Module.Dual K (Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) K)))
    (hX : ∀ d, X d = (π : K) * TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
      (d (TauCeti.GeneralLinear.genericMatrix K 1 0 0))) :
    depth (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y X = 1 := sorry

-- Test MoyPrasad.dualLattice_trace_GL
/- At the standard vertex of `GL_n`, the trace pairing `X_A(d) = tr(A · (d(x_{ij})))` carries
`ϖ^{⌈r⌉} M_n(𝒪)` onto `𝔤*_{x,r}`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (n : ℕ)
    (x : Apartment (GLBuilding.standardValuation (K := K) n))
    (hx : GLBuilding.standardCoordinates n x.displacement = 0) (r : ℝ)
    (A : Matrix (Fin n) (Fin n) K)
    (X : Module.Dual K (Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n) K)))
    (hX : ∀ d, X d = Matrix.trace (A * Matrix.of fun i j =>
      TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
        (d (TauCeti.GeneralLinear.genericMatrix K n i j)))) :
    X ∈ dualLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n)
        (apartmentEmbedding _ _ x) r ↔
      ∀ i j, (r : WithTop ℝ) ≤ GLBuilding.ω K (A i j) := sorry

-- Test MoyPrasad.lieLattice_not_power_of_m
/- At the barycentre `(0, -1/2)` of the standard `GL₂` alcove, `𝔤_{x,1/2}` (diagonal and lower entry
in `𝓂`, upper entry in `𝒪`) is none of the vertex lattices `ϖ^k M₂(𝒪)`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![0, -1 / 2])
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0) (k : ℤ) :
    lieLattice (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        (apartmentEmbedding _ _ x) (1 / 2) ≠
      lieLattice (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        (apartmentEmbedding _ _ x₀) k := sorry

-- Test MoyPrasad.lieLattice_Gm
/- For `G_m = GL₁` the lattice does not depend on the point of the building:
`𝔤_{y,r} = {d : r ≤ ω(d(x₀₀))}`, that is `ϖ^{⌈r⌉} 𝒪`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1)) (r : ℝ)
    (d : Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) K)) :
    d ∈ lieLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y r ↔
      (r : WithTop ℝ) ≤ GLBuilding.ω K (TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
        (d (TauCeti.GeneralLinear.genericMatrix K 1 0 0))) := sorry

-- Test MoyPrasad.lieLatticePlus_Gm_jump (non-example)
/- For `G_m = GL₁`, `𝔤_{y,0+} = 𝓂 ≠ 𝒪 = 𝔤_{y,0}`: the lattices jump at `r = 0`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1)) :
    lieLatticePlus (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 0 ≠
      lieLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 0 := sorry

-- Test MoyPrasad.lieLatticePlus_GL2_barycentre
/- At the barycentre `(0, -1/2)` of the standard `GL₂` alcove the lattices jump only at multiples
of `1/2`, so `𝔤_{x,0+} = 𝔤_{x,1/2}` (diagonal and lower entry in `𝓂`, upper entry in `𝒪`). -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = ![0, -1 / 2]) :
    lieLatticePlus (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        (apartmentEmbedding _ _ x) 0 =
      lieLattice (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        (apartmentEmbedding _ _ x) (1 / 2) := sorry

-- Test MoyPrasad.dualLattice_Gm
/- For `G_m = GL₁` and `X = c · d(x₀₀)`, `X ∈ 𝔤*_{y,r}` exactly when `r ≤ ω(c)` (for `c = 0`, every
`r`). -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    (c : K) (r : ℝ)
    (X : Module.Dual K (Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) K)))
    (hX : ∀ d, X d = c * TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
      (d (TauCeti.GeneralLinear.genericMatrix K 1 0 0))) :
    X ∈ dualLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y r ↔
      (r : WithTop ℝ) ≤ GLBuilding.ω K c := sorry

-- Test MoyPrasad.dualLattice_sign
/- The sign `(−r)+` in `𝔤*_{y,r}`: for `G_m = GL₁` the coordinate functional `X = d(x₀₀)` lies in
`𝔤*_{y,0}` (`X(𝓂) ⊆ 𝓂`) but not in `𝔤*_{y,1}` (`X(𝒪) ⊄ 𝓂`); with `𝔤_{y,r+}` in place of
`𝔤_{y,(−r)+}` it would lie in `𝔤*_{y,1}`, since `X(𝓂²) ⊆ 𝓂`. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    (X : Module.Dual K (Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1)
      (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 1) K)))
    (hX : ∀ d, X d = TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
      (d (TauCeti.GeneralLinear.genericMatrix K 1 0 0))) :
    X ∈ dualLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 0 ∧
      X ∉ dualLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y 1 := sorry

/-- The Moy–Prasad isomorphism of abelian groups `G_{y,r}/G_{y,r+} ≃ 𝔤_{y,r}/𝔤_{y,r+}` for `r > 0`. -/
theorem groupLieGradedEquiv (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    Nonempty ((filtration D φ y r) ⧸ (filtrationPlus D φ y r).subgroupOf (filtration D φ y r) ≃*
      Multiplicative ((lieLattice D φ y r).toAddSubgroup ⧸
        (lieLatticePlus D φ y r).toAddSubgroup.addSubgroupOf (lieLattice D φ y r).toAddSubgroup)) :=
  sorry

/-- Positive-depth Moy–Prasad subgroups are pro-`p` (for `K` local of residue characteristic `p`):
every normal subgroup of finite index has `p`-power index. -/
theorem isProP_filtration [TopologicalSpace K] [IsNonarchimedeanLocalField K] (p : ℕ)
    (hp : ringChar 𝓀[K] = p) (y : Building D φ) {r : ℝ} (hr : 0 < r) :
    ∀ N : Subgroup (filtration D φ y r), N.Normal → N.FiniteIndex →
      ∃ k : ℕ, N.index = p ^ k := sorry

open scoped PointTopology in
/-- For `r ≥ 0` the Moy–Prasad subgroups are compact open in the point topology of `G(K)`. -/
theorem isCompact_isOpen_filtration [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building D φ) {r : ℝ} (hr : 0 ≤ r) :
    IsCompact (filtration D φ y r : Set (WithConv (H →ₐ[K] K))) ∧
      IsOpen (filtration D φ y r : Set (WithConv (H →ₐ[K] K))) := sorry

open scoped PointTopology in
/-- The positive-depth subgroups at a point form a neighbourhood basis of `1`. -/
theorem hasBasis_nhds_one_filtration [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building D φ) :
    (nhds (1 : WithConv (H →ₐ[K] K))).HasBasis (fun r : ℝ => 0 < r)
      fun r => (filtration D φ y r : Set (WithConv (H →ₐ[K] K))) := sorry

/-- Split case of Fintzen, Corollary 7.2, p. 26 (arXiv v2): when the centralizer of the maximal
split torus is a split torus and `y` lies in its apartment, `G_{y,r}` (`r > 0`) is generated by
`T(K)_r` and its intersection with the points of the schematic derived group. -/
theorem filtration_eq_sup_torus_derived [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (_hsplit : TauCeti.splitTorusCommHopfAlgProperty K
      (TauCeti.FiniteTypeCommHopfAlgCat.quotient H
        (BruhatTits.GeometricRoots.centralizerIdeal D.splitTorus)))
    (y : Apartment φ) {r : ℝ} (hr : 0 < r) :
    filtration D φ (apartmentEmbedding D φ y) r = torusFiltration D r ⊔
      (filtration D φ (apartmentEmbedding D φ y) r ⊓
        BruhatTits.subgroupPoints (TauCeti.CommHopfAlgCat.derivedDefiningIdeal H) K) := sorry

end

section

variable [ModelField K]

/-! ### Yu's mixed-depth operations

The carrier is the supremum of ambient filtrations intersected with the stages. For a tame
twisted Levi sequence at strictly positive depths these identify with the intrinsic filtrations
after compatible building embeddings are constructed (README, yu-mixed-depth-groups).
At depth zero the intrinsic parahoric can be smaller than the ambient intersection; the full
nonnegative-depth construction is a README target. No arbitrary filtration is an input. -/

/-- The ambient-intersection representative of the mixed-depth subgroup for the closed stages.
Its identification with Yu's group uses strictly positive stage depths. -/
def yuGroup {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (y : Building D φ) (r : Fin (d + 1) → ℝ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  ⨆ i, filtration D φ y (r i) ⊓ BruhatTits.subgroupPoints (I i) K

theorem yuGroup_self (y : Building D φ) (r : ℝ) :
    yuGroup D φ (fun _ : Fin 1 => ⊥) y (fun _ => r) = filtration D φ y r := sorry

/-- For nondecreasing depths, the ambient last-depth group is contained in the mixed group,
which is contained in the ambient first-depth group. -/
theorem yuGroup_le {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (y : Building D φ) (r : Fin (d + 1) → ℝ)
    (hr : Monotone r) (hlast : I (Fin.last d) = ⊥) :
    filtration D φ y (r (Fin.last d)) ≤ yuGroup D φ I y r ∧
      yuGroup D φ I y r ≤ filtration D φ y (r 0) := sorry

/-- Two stages with 0 ≤ s ≤ t: intersection with the first stage recovers its ambient
depth-s intersection. Normality gives this identity for any closed subgroup. At positive
depth it is the intrinsic twisted-Levi filtration intersection theorem. -/
theorem yuGroup_inf_twistedLevi (I : TauCeti.HopfIdeal K H)
    (y : Building D φ) {s t : ℝ} (hs : 0 ≤ s) (hst : s ≤ t) :
    yuGroup D φ ![I, ⊥] y ![s, t] ⊓ BruhatTits.subgroupPoints I K =
      filtration D φ y s ⊓ BruhatTits.subgroupPoints I K := sorry

/-- The algebraic comparison step in independence: agreement of the intrinsic stage
filtrations implies agreement of the generated groups. The geometric comparison of tame
splitting fields and compatible building embeddings is a separate README target. -/
theorem yuGroup_independent {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (y z : Building D φ) (r : Fin (d + 1) → ℝ)
    (hstage : ∀ i, filtration D φ y (r i) ⊓ BruhatTits.subgroupPoints (I i) K =
      filtration D φ z (r i) ⊓ BruhatTits.subgroupPoints (I i) K) :
    yuGroup D φ I y r = yuGroup D φ I z r := by
  unfold yuGroup
  exact iSup_congr hstage

-- Test MoyPrasad.yuGroup_split_torus
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    (r : ℝ) :
    yuGroup (GLBuilding.standardData 1) (GLBuilding.standardValuation 1)
        (fun _ : Fin 1 => ⊥) y (fun _ => r) =
      filtration (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y r := sorry

-- Test MoyPrasad.yuGroup_constant
example {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (hlast : I (Fin.last d) = ⊥) (y : Building D φ) (r : ℝ) :
    yuGroup D φ I y (fun _ => r) = filtration D φ y r := sorry

-- Test MoyPrasad.yuGroup_zero
example {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (hlast : I (Fin.last d) = ⊥) (x : Apartment φ) :
    yuGroup D φ I (apartmentEmbedding D φ x) (fun _ => 0) =
      parahoricSubgroup D φ {x} := sorry


-- Test MoyPrasad.yuGroup_GL2_mixed
/- At the standard vertex, depths (1,2) on diagonal torus ⊂ GL₂ impose depth 1 on diagonal
entries minus 1 and depth 2 on off-diagonal entries. This detects a constant-filtration impostor. -/
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = 0)
    (g : WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 →ₐ[K] K)) :
    g ∈ yuGroup (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        ![(GLBuilding.standardData (K := K) 2).splitTorus, ⊥]
        (apartmentEmbedding _ _ x) ![1, 2] ↔
      ∀ i j : Fin 2, (if i = j then 1 else 2 : WithTop ℝ) ≤
        GLBuilding.ω K
          ((TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K) i j -
            (1 : Matrix (Fin 2) (Fin 2) K) i j) := sorry

/-- The mixed-lattice representative is the sum of ambient depth lattices intersected with tangent
spaces to the stages. An infinitesimal point belongs to the stage exactly when it kills its
defining Hopf ideal; the span below is of that already linear set. -/
def yuLieLattice {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (y : Building D φ) (r : Fin (d + 1) → ℝ) : Submodule 𝒪[K] 𝔤 :=
  ⨆ i, lieLattice D φ y (r i) ⊓
    Submodule.span 𝒪[K] {X : 𝔤 | ∀ a ∈ (I i).toIdeal, X a = 0}

-- Test MoyPrasad.yuLieLattice_split_torus
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    (r : ℝ) :
    yuLieLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1)
        (fun _ : Fin 1 => ⊥) y (fun _ => r) =
      lieLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y r := sorry

-- Test MoyPrasad.yuLieLattice_constant
example {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (hlast : I (Fin.last d) = ⊥) (y : Building D φ) (r : ℝ) :
    yuLieLattice D φ I y (fun _ => r) = lieLattice D φ y r := sorry

-- Test MoyPrasad.yuLieLattice_zero
example {d : ℕ} (I : Fin (d + 1) → TauCeti.HopfIdeal K H)
    (hlast : I (Fin.last d) = ⊥) (x : Apartment φ) :
    yuLieLattice D φ I (apartmentEmbedding D φ x) (fun _ => 0) =
      lieLattice D φ (apartmentEmbedding D φ x) 0 := sorry


-- Test MoyPrasad.yuLieLattice_GL2_mixed
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx : GLBuilding.standardCoordinates 2 x.displacement = 0)
    (X : Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2)
      (TauCeti.Bialgebra.CounitAlgebra K
        (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2) K)) :
    X ∈ yuLieLattice (GLBuilding.standardData 2) (GLBuilding.standardValuation 2)
        ![(GLBuilding.standardData (K := K) 2).splitTorus, ⊥]
        (apartmentEmbedding _ _ x) ![1, 2] ↔
      ∀ i j : Fin 2, (if i = j then 1 else 2 : WithTop ℝ) ≤
        GLBuilding.ω K (TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
          (X (TauCeti.GeneralLinear.genericMatrix K 2 i j))) := sorry

/-! ### A pinned matrix mock exponential

For GL_n, 1 + X is an exponential-free choice with Adler's positive-depth estimates.
The general torus/root-coordinate construction and tame descent remain stated targets in the
README. These declarations use the actual tangent space and actual Moy–Prasad lattices. -/

section GeneralLinearMock

variable [TopologicalSpace K] [IsNonarchimedeanLocalField K]

local notation "𝔤GL" n => Derivation K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n)
  (TauCeti.Bialgebra.CounitAlgebra K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K n) K)

/-- At positive depth, 1 + X is invertible and belongs to the corresponding filtration. -/
theorem mockExp_exists (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r) :
    ∃ g : filtration (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r,
      ∀ i j : Fin n,
        (TauCeti.GeneralLinear.pointsMulEquiv n g.val : Matrix (Fin n) (Fin n) K) i j =
          (1 : Matrix (Fin n) (Fin n) K) i j +
            TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
              (X.val (TauCeti.GeneralLinear.genericMatrix K n i j)) := sorry

/-- Matrix mock exponential, pinned entry by entry by mockExp_matrix: X ↦ 1 + X. -/
def mockExp (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r) :
    filtration (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r :=
  Classical.choose (mockExp_exists n y r hr X)

theorem mockExp_matrix (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r)
    (i j : Fin n) :
    (TauCeti.GeneralLinear.pointsMulEquiv n (mockExp n y r hr X).val :
        Matrix (Fin n) (Fin n) K) i j =
      (1 : Matrix (Fin n) (Fin n) K) i j +
        TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
          (X.val (TauCeti.GeneralLinear.genericMatrix K n i j)) :=
  Classical.choose_spec (mockExp_exists n y r hr X) i j

/-- Exact depth compatibility for the matrix choice. -/
theorem mockExp_mem (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r)
    {s : ℝ} (hrs : r ≤ s) :
    (mockExp n y r hr X).val ∈
        filtration (GLBuilding.standardData n) (GLBuilding.standardValuation n) y s ↔
      X.val ∈ lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y s := sorry


/-- The pinned matrix map is a bijection of the depth-r lattice with the depth-r group. -/
theorem mockExp_bijective (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r) : Function.Bijective (mockExp n y r hr) := sorry

/-- Equality on the depth-s quotients is exactly congruence of tangent vectors. -/
theorem mockExp_congr_iff (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X Y : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r)
    {s : ℝ} (hrs : r ≤ s) :
    (mockExp n y r hr X).val⁻¹ * (mockExp n y r hr Y).val ∈
        filtration (GLBuilding.standardData n) (GLBuilding.standardValuation n) y s ↔
      Y.val - X.val ∈
        lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y s := sorry

/-- The additive/multiplicative comparison in Adler's range 0 < r ≤ s ≤ 2r. -/
theorem mockExp_graded (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X Y : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r)
    {s : ℝ} (hrs : r ≤ s) (hs : s ≤ 2 * r) :
    (mockExp n y r hr (X + Y)).val⁻¹ *
        ((mockExp n y r hr X).val * (mockExp n y r hr Y).val) ∈
      filtration (GLBuilding.standardData n) (GLBuilding.standardValuation n) y s := sorry

/-- First-order adjoint estimate, with the bracket fixed by its matrix entries.
This is Adler, Prop. 1.6.3, for the matrix choice; t may be negative. -/
theorem mockExp_ad (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r)
    (t : ℝ) (Z B : 𝔤GL n)
    (hZ : Z ∈ lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y t)
    (hB : ∀ i j : Fin n,
      TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
          (B (TauCeti.GeneralLinear.genericMatrix K n i j)) =
        ∑ k : Fin n,
          (TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
              (X.val (TauCeti.GeneralLinear.genericMatrix K n i k)) *
            TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
              (Z (TauCeti.GeneralLinear.genericMatrix K n k j)) -
          TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
              (Z (TauCeti.GeneralLinear.genericMatrix K n i k)) *
            TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
              (X.val (TauCeti.GeneralLinear.genericMatrix K n k j)))) :
    Ad (mockExp n y r hr X).val Z - Z - B ∈
      lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y (2 * r + t) :=
  sorry

/-- Adjacent factors can be interchanged modulo depth 2r, the elementary ordering estimate. -/
theorem mockExp_ordering (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r)
    (X Y : lieLattice (GLBuilding.standardData n) (GLBuilding.standardValuation n) y r) :
    ((mockExp n y r hr X).val * (mockExp n y r hr Y).val)⁻¹ *
        ((mockExp n y r hr Y).val * (mockExp n y r hr X).val) ∈
      filtration (GLBuilding.standardData n) (GLBuilding.standardValuation n) y (2 * r) := sorry

-- Test MoyPrasad.mockExp_zero
example (n : ℕ)
    (y : Building (GLBuilding.standardData (K := K) n) (GLBuilding.standardValuation n))
    (r : ℝ) (hr : 0 < r) : (mockExp n y r hr 0).val = 1 := sorry

-- Test MoyPrasad.mockExp_abelian
/- On G_m this is the ordinary exponential-free identification x ↦ 1 + x, also in positive
characteristic; no analytic exponential or division by factorials occurs. -/
example
    (y : Building (GLBuilding.standardData (K := K) 1) (GLBuilding.standardValuation 1))
    (r : ℝ) (hr : 0 < r)
    (X : lieLattice (GLBuilding.standardData 1) (GLBuilding.standardValuation 1) y r) :
    (TauCeti.GeneralLinear.pointsMulEquiv 1 (mockExp 1 y r hr X).val :
        Matrix (Fin 1) (Fin 1) K) 0 0 =
      1 + TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
        (X.val (TauCeti.GeneralLinear.genericMatrix K 1 0 0)) := sorry

-- Test MoyPrasad.mockExp_GL2_cross_term
/- On GL₂ the (0,0) entry of e(X)e(Y) - e(X+Y) is X₀₀Y₀₀ + X₀₁Y₁₀.
Thus e is not an additive group homomorphism. -/
example
    (y : Building (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (r : ℝ) (hr : 0 < r)
    (X Y : lieLattice (GLBuilding.standardData 2) (GLBuilding.standardValuation 2) y r) :
    (TauCeti.GeneralLinear.pointsMulEquiv 2
        ((mockExp 2 y r hr X).val * (mockExp 2 y r hr Y).val) :
        Matrix (Fin 2) (Fin 2) K) 0 0 -
      (TauCeti.GeneralLinear.pointsMulEquiv 2 (mockExp 2 y r hr (X + Y)).val :
        Matrix (Fin 2) (Fin 2) K) 0 0 =
      ∑ k : Fin 2,
        TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
            (X.val (TauCeti.GeneralLinear.genericMatrix K 2 0 k)) *
          TauCeti.Bialgebra.CounitAlgebra.algEquivSelf K _ K
            (Y.val (TauCeti.GeneralLinear.genericMatrix K 2 k 0)) := sorry

end GeneralLinearMock

end

end MoyPrasad

/-! ### Lang's theorem -/

namespace Lang

open ValuativeRel

/-- Lang's theorem: for a smooth geometrically connected finite-type group over a finite field
`F`, with `σ` the `|F|`-power Frobenius of an algebraic closure, the Lang map `g ↦ g⁻¹ σ(g)` on
`H(F̄)` is surjective. Milne AG, Cor. 27.55, p. 488. -/
theorem lang_surjective {F : Type u} [Field F] [Fintype F]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} F)
    (_hsm : TauCeti.smoothCommHopfAlgProperty F H.obj)
    (_hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F H.obj)
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (_hσ : ∀ z, σ z = z ^ Fintype.card F) :
    Function.Surjective fun g : WithConv (H →ₐ[F] AlgebraicClosure F) =>
      g⁻¹ * WithConv.toConv (σ.comp g.ofConv) := sorry

-- Test Lang.lang_not_connected
/- Connectedness cannot be dropped. On the points `{z : z² = 1}` of the non-connected group `μ₂`
over a finite field of odd order `q` the Lang map is `z ↦ z⁻¹ z^q = 1`, so it misses `-1`
(a computation on the points of `μ₂`). -/
example {F : Type u} [Field F] [Fintype F] (hq : Odd (Fintype.card F))
    (z : (AlgebraicClosure F)ˣ) (hz : z ^ 2 = 1) :
    z⁻¹ * z ^ Fintype.card F = 1 := by
  obtain ⟨k, hk⟩ := hq
  rw [hk, pow_succ, pow_mul, hz, one_pow, one_mul, inv_mul_cancel]


/-- Lang's theorem on an inverse system of smooth geometrically connected finite-type groups
over a finite field. Compatible tuples are the points of the limit. The transition maps are
actual coordinate Hopf-algebra maps. Finite nonempty Lang fibers have nonempty inverse limit;
the finite-type input is Milne AG, Cor. 27.55 (v2.00, p. 488). -/
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

-- Test Lang.proAlgebraic_classical_GL
/- A constant system recovers classical Lang for GL_n. The finite group GL_n(F_q) is the
Frobenius-fixed group, not the domain of a surjective Lang map. -/
example {F : Type u} [Field F] [Fintype F] (n : ℕ)
    (σ : AlgebraicClosure F →ₐ[F] AlgebraicClosure F)
    (hσ : ∀ z, σ z = z ^ Fintype.card F) :
    Function.Surjective fun g :
        WithConv (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra F n →ₐ[F]
          AlgebraicClosure F) =>
      g⁻¹ * WithConv.toConv (σ.comp g.ofConv) := sorry

-- Test Lang.proAlgebraic_additive_product
/- The pro-unipotent limit of affine spaces with coordinate truncation gives coefficientwise
Artin–Schreier equations on the infinite product of additive groups. -/
example {F : Type u} [Field F] [Fintype F] (a : ℕ → AlgebraicClosure F) :
    ∃ b : ℕ → AlgebraicClosure F, ∀ n, b n ^ Fintype.card F - b n = a n := sorry

-- Test Lang.proAlgebraic_disconnected
/- The constant system μ₂ over 𝔽₃ has compatible nonidentity points, while Frobenius fixes
all its geometric points. Its Lang map therefore misses every nonidentity compatible tuple. -/
example (σ : AlgebraicClosure (ZMod 3) →ₐ[ZMod 3] AlgebraicClosure (ZMod 3))
    (hσ : ∀ z, σ z = z ^ 3) :
    ¬ ∀ a : ℕ → WithConv (TauCeti.DiagonalizableGroup.coordinateRing (ZMod 3)
          (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))
        →ₐ[ZMod 3] AlgebraicClosure (ZMod 3)),
      (∀ i j : ℕ, i ≤ j → a j = a i) →
      ∃ b : ℕ → WithConv (TauCeti.DiagonalizableGroup.coordinateRing (ZMod 3)
          (TauCeti.FGCommGrpCat.of (Multiplicative (ZMod 2)))
        →ₐ[ZMod 3] AlgebraicClosure (ZMod 3)),
        (∀ i j : ℕ, i ≤ j → b j = b i) ∧
        ∀ i, (b i)⁻¹ * WithConv.toConv (σ.comp (b i).ofConv) = a i := sorry

/-- The formal step of fixed-coset lifting: for `σ ∈ MulAut G` and a subgroup `J` such that every
element of `J` is `z⁻¹ σ(z)` for some `z ∈ J`, every coset `hJ` with `h⁻¹ σ(h) ∈ J` contains a
`σ`-fixed element. When `J` is `σ`-stable, so that `σ` acts on `G/J`, this is the surjectivity of
`G^σ/J^σ → (G/J)^σ`; injectivity is formal. He 2018, proof of Lem. 4.5, p. 13. -/
theorem fixedCoset_lift {G : Type*} [Group G] (σ : MulAut G) (J : Subgroup G)
    (hLang : ∀ j ∈ J, ∃ z ∈ J, j = z⁻¹ * σ z) (h : G) (hh : h⁻¹ * σ h ∈ J) :
    ∃ h' : G, σ h' = h' ∧ h'⁻¹ * h ∈ J := by
  obtain ⟨z, hz, hzj⟩ := hLang _ hh
  have hσh : σ h = h * z⁻¹ * σ z := by
    have := congrArg (h * ·) hzj
    simpa [mul_assoc] using this
  refine ⟨h * z⁻¹, ?_, ?_⟩
  · rw [map_mul, map_inv, hσh]
    group
  · simpa using hz

/-- Smooth points lift over any complete DVR, including the integers of the completed
maximal unramified extension. Mathlib's formally smooth adic lifting theorem. -/
theorem completeDVR_reduction_surjective (O : Type u) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (A : Type u) [CommRing A] [Algebra O A] [Algebra.Smooth O A] :
    Function.Surjective fun g : A →ₐ[O] O =>
      (IsScalarTower.toAlgHom O O (O ⧸ IsLocalRing.maximalIdeal O)).comp g := sorry

/-- Smooth points lift over the ring of integers of a nonarchimedean local field: reduction
`𝒢(𝒪) → 𝒢(𝓀)` is surjective (Mathlib `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`,
`𝒪[K]` being `𝓂[K]`-adically complete). -/
theorem smoothModel_reduction_surjective {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] (𝒢 : CommHopfAlgCat.{u} 𝒪[K])
    (_h𝒢 : Algebra.Smooth 𝒪[K] 𝒢) :
    Function.Surjective fun g : (𝒢 →ₐ[𝒪[K]] 𝒪[K]) =>
      (Algebra.ofId 𝒪[K] 𝓀[K]).comp g := by
  intro f
  have := _h𝒢
  let _ : UniformSpace K := IsTopologicalAddGroup.rightUniformSpace K
  have : IsUniformAddGroup K := isUniformAddGroup_of_addCommGroup
  obtain ⟨g, hg⟩ := Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete
    (I := 𝓂[K]) (S := 𝒪[K]) f
  refine ⟨g, ?_⟩
  rw [← hg]
  rfl

end Lang

open ValuativeRel in
/-- The ramified norm-one torus: let `E′/E` be a separable quadratic extension of a nonarchimedean
local field with odd residue characteristic, ramified because `E′` contains a square root `a` of a
uniformizer `π`, and let `T = R¹_{E′/E} G_m` be the norm-one torus (`NormTorus.quadraticData`,
points `NormTorus.pointsEquiv`, read in `E′ˣ`). Its parahoric subgroup at the point of its building
consists of the norm-one units `u` with `u ≡ 1` modulo the maximal ideal of `E′` (tested on the
norm: `ω(N(u − 1)) ≥ 1`), and it has index two in `T(E)`. The parahoric of a torus is the kernel of
the Kottwitz map ([Haines–Rapoport], proof of Prop. 3 a), p. 2); writing `u = x/σ(x)`, its Kottwitz
class is `v_{E′}(x) mod 2`, a unit `x` gives `u ≡ 1`, and `a/σ(a) = -1` gives the other coset. -/
theorem LevelSubgroups.normOneTorus_parahoric_index {E E' : Type u} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] [Field E'] [Algebra E E']
    [FiniteDimensional E E'] [Algebra.IsSeparable E E'] (hd : Module.finrank E E' = 2)
    (π : Eˣ) (hπ : BruhatTits.normalizedOrder (K := E) π = Multiplicative.ofAdd 1)
    (a : E') (ha : a ^ 2 = algebraMap E E' (π : E)) (h2 : (2 : 𝓀[E]) ≠ 0)
    (φ : BruhatTits.Valuation (NormTorus.quadraticData E E' hd).rootDatum)
    [BruhatTits.GeometricValuation (NormTorus.quadraticData E E' hd) φ]
    (x : BruhatTits.Apartment φ) :
    (∀ g : WithConv (NormTorus.coordinateHopf E E' →ₐ[E] E),
      g ∈ BruhatTits.parahoricSubgroup (NormTorus.quadraticData E E' hd) φ {x} ↔
        ValuativeRel.valuation E (Algebra.norm E
          (Algebra.TensorProduct.rid E E E' ((NormTorus.pointsEquiv E E' E g : (E' ⊗[E] E)ˣ) :
            E' ⊗[E] E) - 1)) < 1) ∧
      (BruhatTits.parahoricSubgroup (NormTorus.quadraticData E E' hd) φ {x}).index = 2 := sorry

open ValuativeRel in
-- Test LevelSubgroups.normOneTorus_minus_one
/- The class of `-1`, a norm-one unit, is the nontrivial coset: `N(-1 - 1) = 4` is a unit when
the residue characteristic is odd. -/
example {E E' : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] [Field E'] [Algebra E E'] [FiniteDimensional E E']
    (hd : Module.finrank E E' = 2) (h2 : (2 : 𝓀[E]) ≠ 0) :
    Algebra.norm E (-1 : E') = 1 ∧
      ¬ ValuativeRel.valuation E (Algebra.norm E ((-1 : E') - 1)) < 1 := sorry

open ValuativeRel in
-- Test LevelSubgroups.normOneTorus_residue_char_two
/- In residue characteristic `2` the congruence test no longer separates `-1` from `1`
(`N(-1 - 1) = 4 ∈ 𝓂`), so the odd-residue hypothesis of the index computation cannot be dropped. -/
example {E E' : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] [Field E'] [Algebra E E'] [FiniteDimensional E E']
    (hd : Module.finrank E E' = 2) (h2 : (2 : 𝓀[E]) = 0) :
    ValuativeRel.valuation E (Algebra.norm E ((-1 : E') - 1)) < 1 := sorry

/-! ## Layer RG2.4: Decompositions and double cosets -/

namespace BruhatTits

open scoped Pointwise

variable {K : Type u} [Field K] [ValuativeRel K] [ModelField K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-! ### Alcoves and special points of the apartment (data shared by the layer) -/

/-- A base alcove of the apartment of `φ`: an alcove `C` of RG2.1 (a facet meeting no wall,
Bruhat–Tits I §1.3) together with a point of `C`. In the enlarged apartment an alcove is the
product of an alcove of the reduced apartment with the central direction `V_Z`, so for `V_Z ≠ 0`
(for instance `GL_n`, `GSp_{2n}` or a split torus) it has no vertices; it is therefore not
recorded by a vertex set. -/
structure BaseAlcove (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] where
  /-- The alcove. -/
  facet : Facet φ
  isAlcove : facet.IsAlcove
  /-- A point of the alcove; it lies on no wall. -/
  basePoint : Apartment φ
  basePoint_mem : basePoint ∈ facet.carrier

/-- The closed alcove `C̄`: the points at which every affine root that is nonnegative on `C` is
nonnegative. -/
def BaseAlcove.closure {D : LocalRootData K H} {φ : Valuation D.rootDatum} [GeometricValuation D φ]
    (a : BaseAlcove D φ) : Set (Apartment φ) :=
  {x | ∀ α : AffineRoot φ, (∀ y ∈ a.facet.carrier, 0 ≤ α.eval y) → 0 ≤ α.eval x}

omit [ModelField K] in
theorem BaseAlcove.basePoint_mem_closure {D : LocalRootData K H} {φ : Valuation D.rootDatum}
    [GeometricValuation D φ] (a : BaseAlcove D φ) : a.basePoint ∈ a.closure :=
  fun _ hα => hα _ a.basePoint_mem

/-- Every apartment has an alcove (Bruhat–Tits I §1.3). -/
theorem exists_baseAlcove (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    [GeometricValuation D φ] : Nonempty (BaseAlcove D φ) := sorry

/-- The closure of every alcove contains a special point (`Facet.IsSpecial`; Bruhat–Tits I (1.3.7),
p. 22). -/
theorem BaseAlcove.exists_special_mem_closure {D : LocalRootData K H} {φ : Valuation D.rootDatum}
    [GeometricValuation D φ] (a : BaseAlcove D φ) : ∃ x, Facet.IsSpecial x ∧ x ∈ a.closure := sorry

/-- The Iwahori subgroup `I = 𝒢°_C(𝒪)` of a base alcove: the parahoric subgroup of a point of
the open alcove (Bruhat–Tits II 5.2.6, p. 164; Haines–Rapoport, Def. 1, p. 1). -/
def BaseAlcove.iwahori {D : LocalRootData K H} {φ : Valuation D.rootDatum} [GeometricValuation D φ]
    (a : BaseAlcove D φ) : Subgroup (WithConv (H →ₐ[K] K)) :=
  parahoricSubgroup D φ {a.basePoint}

/-- The Iwahori subgroup does not depend on the chosen point of the alcove. -/
theorem BaseAlcove.iwahori_eq {D : LocalRootData K H} {φ : Valuation D.rootDatum}
    [GeometricValuation D φ] (a : BaseAlcove D φ) (x : Apartment φ) (hx : x ∈ a.facet.carrier) :
    a.iwahori = parahoricSubgroup D φ {x} := sorry

/-- The Iwahori double coset `I ṅ I` of `n ∈ N(K)`. -/
def BaseAlcove.cell {D : LocalRootData K H} {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (n : D.normalizer) : Set (WithConv (H →ₐ[K] K)) :=
  (a.iwahori : Set (WithConv (H →ₐ[K] K))) * {(n : WithConv (H →ₐ[K] K))} * a.iwahori

/-- Every parahoric subgroup of a nonempty finite subset of the apartment meets the minimal Levi
`Z(K)` exactly in `Z(K)_0` (Bruhat–Tits II 5.2.4, p. 164; Haines–Rapoport, Lem. 5, p. 3). This
characterizes `minimalLeviParahoric`. -/
theorem parahoricSubgroup_inf_centralizer (D : LocalRootData K H) (φ : Valuation D.rootDatum)
    [GeometricValuation D φ] (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    parahoricSubgroup D φ Ω ⊓ D.rootDatum.T = minimalLeviParahoric D := sorry

/-- `Z(K)_0 ⊆ Z(K)`. -/
theorem minimalLeviParahoric_le (D : LocalRootData K H) :
    minimalLeviParahoric D ≤ D.rootDatum.T := sorry

/-- The subgroup `G(K)_1` generated by all parahoric subgroups. -/
def parahoricGenerated (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    Subgroup (WithConv (H →ₐ[K] K)) :=
  Subgroup.closure (⋃ x : Apartment φ,
    (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))))

/-- The unipotent subgroup `U_v(K)` attached to a vector `v` of the coroot space: generated by the
root groups `U_a(K)` with `a(v) > 0`. It is `R_u(P_v)(K)` for the parabolic `P_v`
(`parabolicOfVector`); for `v` regular it is the group `U(K)` of a minimal parabolic, and
`U_0(K) = 1`. -/
def unipotentRadical (D : LocalRootData K H) (v : D.V) : Subgroup (WithConv (H →ₐ[K] K)) :=
  Subgroup.closure (⋃ i ∈ {i : D.ι | 0 < D.Φ.root i v},
    (D.rootDatum.U i : Set (WithConv (H →ₐ[K] K))))

/-- A vector of the coroot space is regular if no root vanishes on it. -/
def IsRegularVector (D : LocalRootData K H) (v : D.V) : Prop := ∀ i : D.ι, D.Φ.root i v ≠ 0

-- Test BruhatTits.unipotentRadical_zero
omit [ValuativeRel K] [ModelField K] in
example (D : LocalRootData K H) : unipotentRadical D 0 = ⊥ := by
  simp [unipotentRadical]

-- Test BruhatTits.parahoricGenerated_anisotropic
-- With no relative roots every parahoric subgroup is `Z(K)_0 = G(K)_0`.
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    [IsEmpty D.ι] : parahoricGenerated D φ = minimalLeviParahoric D := sorry

-- Test BruhatTits.isRegularVector_zero (non-example)
omit [ValuativeRel K] [ModelField K] in
example (D : LocalRootData K H) [Nonempty D.ι] : ¬ IsRegularVector D 0 := by
  intro h
  exact h (Classical.arbitrary D.ι) (map_zero _)

-- Test BruhatTits.unipotentRadical_gl2
-- For `GL₂` and `v = (1, 0)`, `U_v(K)` is the upper unipotent root group.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v : (GLBuilding.standardData (K := K) 2).V) (hv : GLBuilding.standardCoordinates 2 v = ![1, 0])
    (i : (GLBuilding.standardData (K := K) 2).ι) (hi : (GLBuilding.standardRoots 2 i).val = (0, 1)) :
    unipotentRadical (GLBuilding.standardData (K := K) 2) v =
      (GLBuilding.standardData (K := K) 2).rootDatum.U i := by
  sorry

-- Test BruhatTits.isRegularVector_gl2
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v w : (GLBuilding.standardData (K := K) 2).V) (hv : GLBuilding.standardCoordinates 2 v = ![1, 0])
    (hw : GLBuilding.standardCoordinates 2 w = ![1, 1]) :
    IsRegularVector (GLBuilding.standardData (K := K) 2) v ∧
      ¬ IsRegularVector (GLBuilding.standardData (K := K) 2) w := by
  sorry

-- Test BruhatTits.parahoricGenerated_gl2 (non-example)
-- For `GL₂`, `G(K)_1` is the kernel of `g ↦ ω(det g)`, not all of `GL₂(K)`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    parahoricGenerated (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2) ≠ ⊤ := by
  sorry

-- Test BruhatTits.minimalLeviParahoric_gl2
-- For `GL₂`, `Z(K)_0 = T(𝒪)`: `diag(t₁, t₂) ∈ Z(K)_0` iff both entries are units of `𝒪[K]`; in
-- particular `diag(ϖ, 1) ∉ Z(K)_0`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (z : (GLBuilding.standardData (K := K) 2).rootDatum.T) (t : Fin 2 → Kˣ)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal (fun i => (t i : K))) :
    z.val ∈ minimalLeviParahoric (GLBuilding.standardData (K := K) 2) ↔
      ∀ i, ValuativeRel.valuation K (t i : K) = 1 := by
  sorry

-- Test BruhatTits.minimalLeviParahoric_le_boundedPart
-- `Z(K)_0` lies in the kernel `Z(K)^1` of the valuation map; the inclusion can be strict
-- (`IwahoriWeylGroup.not_quotient_by_boundedPart`).
example (D : LocalRootData K H) (z : D.rootDatum.T) (hz : z.val ∈ minimalLeviParahoric D) :
    z ∈ boundedPart D := by
  sorry

-- Test BruhatTits.cell_one
-- The cell of `1` is the Iwahori subgroup itself.
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (a : BaseAlcove D φ) :
    a.cell 1 = (a.iwahori : Set (WithConv (H →ₐ[K] K))) := by
  ext g
  simp only [BaseAlcove.cell, OneMemClass.coe_one, Set.mem_mul, Set.mem_singleton_iff,
    SetLike.mem_coe]
  constructor
  · rintro ⟨_, ⟨x, hx, _, rfl, rfl⟩, y, hy, rfl⟩
    simpa using mul_mem hx hy
  · intro hg
    exact ⟨1, ⟨1, one_mem _, 1, rfl, mul_one 1⟩, g, hg, one_mul g⟩

-- Test BruhatTits.mem_cell_self
-- `n` lies in its own cell `I ṅ I`.
example (D : LocalRootData K H) (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (a : BaseAlcove D φ) (n : D.normalizer) : (n : WithConv (H →ₐ[K] K)) ∈ a.cell n :=
  Set.mem_mul.2 ⟨n, Set.mem_mul.2 ⟨1, one_mem _, n, rfl, one_mul _⟩, 1, one_mem _, mul_one _⟩

-- Test BruhatTits.cell_gl2_hyperspecial
-- For `GL₂` with base alcove `0 < x₁ - x₂ < 1`, the parahoric subgroup `GL₂(𝒪)` of the special
-- vertex `0` is `I ∪ I s I` for the permutation matrix `s`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a.basePoint.displacement = ![1 / 2, 0])
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0)
    (s : (GLBuilding.standardData (K := K) 2).normalizer)
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) =
      !![0, 1; 1, 0]) :
    (parahoricSubgroup _ (GLBuilding.standardValuation 2) {x₀} : Set (WithConv (_ →ₐ[K] K))) =
      a.cell 1 ∪ a.cell s := by
  sorry

-- Test BruhatTits.parahoricGenerated_sl2
-- For the simply connected `SL₂` the parahoric subgroups generate `G(K)` (Bruhat–Tits II, 5.2.11,
-- p. 166), unlike `GL₂` (`parahoricGenerated_gl2`).
example (D₂ : LocalRootData K (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra K 2))
    (φ : Valuation D₂.rootDatum) [GeometricValuation D₂ φ] :
    parahoricGenerated D₂ φ = ⊤ := by
  sorry

/-! ### RG2.4/iwahori-weyl-group -/

namespace IwahoriWeylGroup

variable (D : LocalRootData K H)

/-- The quotient homomorphism `N(K) →* W̃`. -/
def mk : D.normalizer →* IwahoriWeylGroup D :=
  QuotientGroup.mk' ((minimalLeviParahoric D).subgroupOf D.normalizer)

theorem mk_surjective : Function.Surjective (mk D) :=
  QuotientGroup.mk'_surjective _

theorem mk_eq_one_iff (n : D.normalizer) :
    mk D n = 1 ↔ (n : WithConv (H →ₐ[K] K)) ∈ minimalLeviParahoric D :=
  (QuotientGroup.eq_one_iff (N := (minimalLeviParahoric D).subgroupOf D.normalizer) n).trans
    Subgroup.mem_subgroupOf

/-- The action of `W̃` on the apartment by affine transformations, induced by the action `ν` of
`N(K)` (`Apartment.rationalAction`); `Z(K)_0` acts trivially (Richarz (1.1), p. 118). -/
def apartmentAction (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    IwahoriWeylGroup D →* (Apartment φ ≃ᵃ[ℝ] Apartment φ) :=
  QuotientGroup.lift ((minimalLeviParahoric D).subgroupOf D.normalizer)
    (Apartment.rationalAction D φ) (by sorry)

/-- `mk n` acts on the apartment as `ν(n)`. -/
theorem apartmentAction_mk (φ : Valuation D.rootDatum) [GeometricValuation D φ] (n : D.normalizer) :
    apartmentAction D φ (mk D n) = Apartment.rationalAction D φ n :=
  rfl

/-- The affine Weyl group `W_a ⊆ W̃`, the image of `N(K) ∩ G(K)_1`. -/
def affineWeyl (φ : Valuation D.rootDatum) [GeometricValuation D φ] : Subgroup (IwahoriWeylGroup D) :=
  ((parahoricGenerated D φ).subgroupOf D.normalizer).map (mk D)

/-- The subgroup of `W̃` fixing a point of the apartment. -/
def pointStabilizer (φ : Valuation D.rootDatum) [GeometricValuation D φ] (x : Apartment φ) :
    Subgroup (IwahoriWeylGroup D) where
  carrier := {w | apartmentAction D φ w x = x}
  one_mem' := by simp
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- The stabilizer `Ω ⊆ W̃` of the base alcove `C` (the elements mapping `C` onto itself). -/
def lengthZero {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    Subgroup (IwahoriWeylGroup D) where
  carrier := {w | ⇑(apartmentAction D φ w) '' a.facet.carrier = a.facet.carrier}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem affineWeyl_isComplement'_lengthZero {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    (affineWeyl D φ).IsComplement' (lengthZero D a) := by
  sorry

instance affineWeyl_normal (φ : Valuation D.rootDatum) [GeometricValuation D φ] : (affineWeyl D φ).Normal := by
  sorry

/-- `W_a` acts faithfully on the apartment as the affine Weyl group of RG2.1, the group generated
by the wall reflections (Haines–Rapoport, p. 10; Bruhat–Tits II, Prop. 5.2.12, p. 166). -/
theorem map_affineWeyl (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    (affineWeyl D φ).map (apartmentAction D φ) = AffineWeylGroup φ ∧
      (apartmentAction D φ).ker ⊓ affineWeyl D φ = ⊥ := by
  sorry

/-- The translation subgroup `Z(K)/Z(K)_0 ⊆ W̃`. -/
def translations : Subgroup (IwahoriWeylGroup D) :=
  (D.rootDatum.T.subgroupOf D.normalizer).map (mk D)

instance translations_normal : (translations D).Normal := by
  sorry

/-- The relative Weyl group `W_0 = N(K)/Z(K)`. -/
def RelativeWeylGroup : Type u :=
  D.normalizer ⧸ (D.rootDatum.T.subgroupOf D.normalizer)

instance : (D.rootDatum.T.subgroupOf D.normalizer).Normal := by
  sorry

instance : Group (RelativeWeylGroup D) :=
  inferInstanceAs (Group (D.normalizer ⧸ (D.rootDatum.T.subgroupOf D.normalizer)))

/-- The projection `W̃ →* W_0` induced by the identity of `N(K)` (`Z(K)_0 ⊆ Z(K)`). -/
def toRelativeWeyl : IwahoriWeylGroup D →* RelativeWeylGroup D :=
  QuotientGroup.map _ _ (MonoidHom.id D.normalizer) (by sorry)

theorem toRelativeWeyl_mk (n : D.normalizer) :
    toRelativeWeyl D (mk D n) = QuotientGroup.mk' (D.rootDatum.T.subgroupOf D.normalizer) n :=
  rfl

-- Test BruhatTits.IwahoriWeylGroup.apartmentAction_torus_compat
example (φ : Valuation D.rootDatum) [GeometricValuation D φ] (z : D.normalizer)
    (hz : (z : WithConv (H →ₐ[K] K)) ∈ D.rootDatum.T) (x : Apartment φ) :
    ∃ v : D.V, apartmentAction D φ (mk D z) x = v +ᵥ x := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.splitTorus
-- For a split torus `W̃ = Z(K)/Z(K)_0` is the cocharacter lattice and acts by translations.
example (φ : Valuation D.rootDatum) [GeometricValuation D φ]
    (hT : TauCeti.splitTorusCommHopfAlgProperty K H) :
    translations D = ⊤ ∧
      Nonempty (IwahoriWeylGroup D ≃* Multiplicative (GeometricRoots.Cocharacter D.splitTorus)) ∧
      ∀ (w : IwahoriWeylGroup D) (x : Apartment φ), ∃ v : D.V, apartmentAction D φ w x = v +ᵥ x := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.sl2_eq_affineWeyl
-- For the simply connected `SL₂`, `Ω` is trivial and `W̃ = W_a` is infinite.
example (D₂ : LocalRootData K (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra K 2))
    (φ : Valuation D₂.rootDatum) [GeometricValuation D₂ φ] (a : BaseAlcove D₂ φ) :
    lengthZero D₂ a = ⊥ ∧ affineWeyl D₂ φ = ⊤ ∧ Infinite (IwahoriWeylGroup D₂) := by
  sorry

open ValuativeRel in
-- Test BruhatTits.IwahoriWeylGroup.not_quotient_by_boundedPart
-- For the separable square-root norm-one torus (`char K ≠ 2`), `Z(K)_0` has index two in
-- `Z(K) = ker ν` in every residue characteristic, so `W̃` has two elements while `N(K)/ker ν`
-- is trivial. In characteristic two the separable square-root hypotheses have no instances.
example (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (b : L) (hb : b ^ 2 = algebraMap K L (π : K)) :
    Nat.card (IwahoriWeylGroup (NormTorus.quadraticData K L hd)) = 2 ∧
      boundedPart (NormTorus.quadraticData K L hd) = ⊤ := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.apartmentAction_gl2_swap
-- For `GL₂` the permutation matrix `s` acts on the apartment by swapping the two coordinates of
-- the displacement (its root valuations are those of the base point and `det s` is a unit).
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (s : (GLBuilding.standardData (K := K) 2).normalizer)
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) =
      !![0, 1; 1, 0])
    (x : Apartment (GLBuilding.standardValuation (K := K) 2)) :
    GLBuilding.standardCoordinates 2
        (apartmentAction _ (GLBuilding.standardValuation 2) (mk _ s) x).displacement =
      ![GLBuilding.standardCoordinates 2 x.displacement 1,
        GLBuilding.standardCoordinates 2 x.displacement 0] := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.pointStabilizer_anisotropic
-- When the coroot space is zero the apartment is a point, so every element fixes it; together
-- with `not_quotient_by_boundedPart` this shows that the stabilizer of a point can be larger than
-- the finite Weyl group `W_x`.
example (φ : Valuation D.rootDatum) [GeometricValuation D φ] [Subsingleton D.V]
    (x : Apartment φ) : pointStabilizer D φ x = ⊤ := by
  refine eq_top_iff.2 fun w _ => ?_
  show apartmentAction D φ w x = x
  rw [← vsub_vadd (apartmentAction D φ w x) x,
    Subsingleton.elim (apartmentAction D φ w x -ᵥ x) 0, zero_vadd]

-- Test BruhatTits.IwahoriWeylGroup.pointStabilizer_gl2
-- For `GL₂` the class of the permutation matrix fixes the vertex `0`, the translation
-- `diag(ϖ⁻¹, 1)` does not.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0)
    (s z : (GLBuilding.standardData (K := K) 2).normalizer)
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) =
      !![0, 1; 1, 0])
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1]) :
    mk _ s ∈ pointStabilizer _ (GLBuilding.standardValuation 2) x₀ ∧
      mk _ z ∉ pointStabilizer _ (GLBuilding.standardValuation 2) x₀ := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.relativeWeylGroup_anisotropic
-- With no relative roots `N(K) = Z(K)`, so `W_0` is trivial.
example [IsEmpty D.ι] : Nat.card (RelativeWeylGroup D) = 1 := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.relativeWeylGroup_weylGroup
-- `W_0 = N(K)/Z(K)` is the Weyl group of the relative root system (Borel–Tits).
example : Nonempty (RelativeWeylGroup D ≃* D.Φ.weylGroup) := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.relativeWeylGroup_gl3
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    Nat.card (RelativeWeylGroup (GLBuilding.standardData (K := K) 3)) = 6 := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.toRelativeWeyl_mk_eq_one_iff
-- The kernel of `N(K) → W̃ → W_0` is `Z(K)`.
example (n : D.normalizer) :
    toRelativeWeyl D (mk D n) = 1 ↔ (n : WithConv (H →ₐ[K] K)) ∈ D.rootDatum.T := by
  rw [toRelativeWeyl_mk]
  exact (QuotientGroup.eq_one_iff (N := D.rootDatum.T.subgroupOf D.normalizer) n).trans
    Subgroup.mem_subgroupOf

-- Test BruhatTits.IwahoriWeylGroup.toRelativeWeyl_gl2
-- For `GL₂` the translation `diag(ϖ⁻¹, 1)` maps to `1` in `W_0 = S₂`, the permutation matrix does
-- not.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (s z : (GLBuilding.standardData (K := K) 2).normalizer)
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) =
      !![0, 1; 1, 0])
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1]) :
    toRelativeWeyl _ (mk _ z) = 1 ∧ toRelativeWeyl _ (mk _ s) ≠ 1 := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.toRelativeWeyl_not_injective_gl2 (non-example)
-- `W̃ → W_0` forgets the translations: for `GL₂` it is not injective.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    ¬ Function.Injective (toRelativeWeyl (GLBuilding.standardData (K := K) 2)) := by
  sorry

/-! ### RG2.4/iwahori-weyl-exact-sequences -/

theorem toRelativeWeyl_surjective : Function.Surjective (toRelativeWeyl D) := by
  sorry

theorem ker_toRelativeWeyl : (toRelativeWeyl D).ker = translations D := by
  sorry

theorem translations_commute (s t : translations D) : s * t = t * s := by
  sorry

/-- The kernel of the affine action is finite: it is `Z(K)_b/Z(K)_0`, which over `L` is the torsion
of `X_*(T)_I` (Haines–Rapoport, Rem. 10, p. 6). -/
theorem finite_ker_apartmentAction (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    Finite (apartmentAction D φ).ker := by
  sorry

theorem ker_apartmentAction_le_translations (φ : Valuation D.rootDatum) [GeometricValuation D φ] :
    (apartmentAction D φ).ker ≤ translations D := by
  sorry

/-- The composite `Ω → W̃ → W̃/W_a` is an isomorphism. -/
theorem lengthZero_quotient_bijective {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    Function.Bijective
      ((QuotientGroup.mk' (affineWeyl D φ)).comp (lengthZero D a).subtype) := by
  sorry

/-- The affine Weyl subgroup fixing a special point maps isomorphically onto `W₀`
(Haines–Rapoport, Prop. 13, p. 8). The full fixer in `W̃` may additionally contain torsion
translations. -/
theorem specialVertex_fixer_bijective (φ : Valuation D.rootDatum) [GeometricValuation D φ] (x : Apartment φ)
    (hx : Facet.IsSpecial x) :
    Function.Bijective ((toRelativeWeyl D).comp
      (pointStabilizer D φ x ⊓ affineWeyl D φ).subtype) := by
  sorry

/-! ### RG2.4/length-and-bruhat-order -/

variable {D}

/-- The length function `ℓ : W̃ → ℕ` of a base alcove: the number of walls separating the alcove
from its image (`length_eq_ncard`). -/
def length {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) : IwahoriWeylGroup D → ℕ :=
  sorry

/-- `ℓ(w)` is the number of walls separating `C` from `w(C)` (Bruhat–Tits I, (2.3.10), p. 39, for
`W_a`, extended to `W̃ = W_a ⋊ Ω` since `Ω` stabilizes `C`; Richarz §1.3, p. 121). -/
theorem length_eq_ncard {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (w : IwahoriWeylGroup D) :
    length a w = Set.ncard {W : Set (Apartment φ) | ∃ α : AffineRoot φ, W = α.wall ∧
      0 < α.eval a.basePoint ∧ α.eval (apartmentAction D φ w a.basePoint) < 0} := by
  sorry

/-- The simple reflections `S̃ ⊆ W_a`: the reflections in the walls of the base alcove. -/
def simpleReflections {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    Set (IwahoriWeylGroup D) :=
  sorry

/-- The simple reflections are exactly the elements of `W_a` of length one (Richarz §1.3, p. 121). -/
theorem mem_simpleReflections_iff {φ : Valuation D.rootDatum} [GeometricValuation D φ]
    (a : BaseAlcove D φ) (s : IwahoriWeylGroup D) :
    s ∈ simpleReflections a ↔ s ∈ affineWeyl D φ ∧ length a s = 1 := by
  sorry

/-- The Bruhat relation on `W̃`: the reflexive–transitive closure of the length-increasing
multiplications by reflections `x s x⁻¹` of `W_a`. On `W_a` it is the Bruhat order of the Coxeter
system `(W_a, S̃)`; the extension to `W̃ = W_a ⋊ Ω` is not a Coxeter order. -/
def bruhatLE {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    IwahoriWeylGroup D → IwahoriWeylGroup D → Prop :=
  Relation.ReflTransGen fun w w' =>
    ∃ s ∈ simpleReflections a, ∃ x : IwahoriWeylGroup D,
      w' = (x * s * x⁻¹) * w ∧ length a w < length a w'

/-- The Bruhat partial order. -/
@[instance_reducible]
def bruhatPartialOrder {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    PartialOrder (IwahoriWeylGroup D) where
  le := bruhatLE a
  le_refl _ := Relation.ReflTransGen.refl
  le_trans _ _ _ := Relation.ReflTransGen.trans
  le_antisymm := by sorry

theorem length_mul_lengthZero {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (w : IwahoriWeylGroup D) (τ : lengthZero D a) :
    length a (w * τ) = length a w ∧ length a (τ * w) = length a w := by
  sorry

theorem length_eq_zero_iff {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (w : IwahoriWeylGroup D) : length a w = 0 ↔ w ∈ lengthZero D a := by
  sorry

@[simp] theorem length_inv {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (w : IwahoriWeylGroup D) : length a w⁻¹ = length a w := by
  sorry

theorem simpleReflections_subset_affineWeyl {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    simpleReflections a ⊆ affineWeyl D φ := by
  sorry

/-- `W_a` with `S̃` is a Coxeter system, and `ℓ` restricts to its Coxeter length. -/
theorem length_eq_coxeterLength {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) :
    ∃ (B : Type u) (M : CoxeterMatrix B) (cs : CoxeterSystem M (affineWeyl D φ)),
      Set.range cs.simple = Subtype.val ⁻¹' simpleReflections a ∧
      ∀ w : affineWeyl D φ, length a w = cs.length w := by
  sorry

theorem bruhatLE_iff {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (w w' : affineWeyl D φ) (τ τ' : lengthZero D a) :
    bruhatLE a (w * τ) (w' * τ') ↔
      τ = τ' ∧ bruhatLE a w w' := by
  sorry

theorem length_mono_of_bruhatLE {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    {w w' : IwahoriWeylGroup D} (h : bruhatLE a w w') :
    length a w ≤ length a w' ∧ (length a w = length a w' → w = w') := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.length_simple
example {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) (s : IwahoriWeylGroup D)
    (hs : s ∈ simpleReflections a) (w : IwahoriWeylGroup D) :
    length a s = 1 ∧ (length a (s * w) = length a w + 1 ∨ length a (s * w) + 1 = length a w) := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.bruhatLE_lengthZero_compat
example {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) (τ : lengthZero D a)
    (w w' : affineWeyl D φ) :
    bruhatLE a (w * τ) (w' * τ) ↔ bruhatLE a w w' := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.not_bruhatLE_of_lengthZero_ne
example {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ) (τ : lengthZero D a) (hτ : τ ≠ 1) :
    ¬ bruhatLE a 1 τ := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.length_translation_gl2
-- For `GL₂` with base alcove `0 < x₁ - x₂ < 1`, the translations by `(1,0)` and `(1,-1)` have
-- lengths `1` and `2` (the classes of `diag(ϖ⁻¹, 1)` and `diag(ϖ⁻¹, ϖ)`).
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a.basePoint.displacement = ![1 / 2, 0])
    (z z' : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (hz' : (TauCeti.GeneralLinear.pointsMulEquiv 2 z'.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, (π : K)]) :
    length a (mk _ z) = 1 ∧ length a (mk _ z') = 2 := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.length_orientation_gl2
-- With the base alcove `0 < x₁ - x₂ < 1` in the chamber `x₁ ≥ x₂` of the translation
-- `t = t^{(1,-1)}`, and `s` the reflection in the wall `x₁ = x₂` through the special vertex `0`:
-- `ℓ(t) = 2`, `ℓ(s t) = 3 = ℓ(s) + ℓ(t)`, while `ℓ(t s) = 1`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a.basePoint.displacement = ![1 / 2, 0])
    (z s : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, (π : K)])
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) = !![0, 1; 1, 0]) :
    length a (mk _ z) = 2 ∧ length a (mk _ s * mk _ z) = 3 ∧ length a (mk _ z * mk _ s) = 1 := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.simpleReflections_gl2
-- For `GL₂` the affine Weyl group is of type `Ã₁`: two simple reflections.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2)) :
    (simpleReflections a).ncard = 2 := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.relativeWeylGroup_gl2
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    Nat.card (RelativeWeylGroup (GLBuilding.standardData (K := K) 2)) = 2 := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.simpleReflections_anisotropic
-- With no relative roots there are no walls, `W_a = 1` and `S̃ = ∅`.
example {φ : Valuation D.rootDatum} [GeometricValuation D φ] [IsEmpty D.ι]
    (a : BaseAlcove D φ) : simpleReflections a = ∅ := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.simpleReflections_gl2_mem
-- For `GL₂` and the base alcove `0 < x₁ - x₂ < 1`, the reflection `s` in the wall `x₁ = x₂` is a
-- simple reflection; the translation `diag(ϖ⁻¹, ϖ)` (length `2`) is not.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a.basePoint.displacement = ![1 / 2, 0])
    (s z : (GLBuilding.standardData (K := K) 2).normalizer)
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) =
      !![0, 1; 1, 0])
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, (π : K)]) :
    mk _ s ∈ simpleReflections a ∧ mk _ z ∉ simpleReflections a := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.bruhatPartialOrder_lt_simple
-- `1 < s` for every simple reflection.
example {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (s : IwahoriWeylGroup D) (hs : s ∈ simpleReflections a) :
    (bruhatPartialOrder a).lt 1 s := by
  sorry

-- Test BruhatTits.IwahoriWeylGroup.bruhatPartialOrder_lengthZero_minimal
-- Nothing lies strictly below an element of `Ω`.
example {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)
    (τ : lengthZero D a) (w : IwahoriWeylGroup D) (h : (bruhatPartialOrder a).le w τ) :
    w = τ := by
  obtain ⟨h₁, h₂⟩ := length_mono_of_bruhatLE a h
  have h₀ := (length_eq_zero_iff a (τ : IwahoriWeylGroup D)).2 τ.2
  exact h₂ (by omega)

-- Test BruhatTits.IwahoriWeylGroup.bruhatPartialOrder_gl2_incomparable (non-example)
-- The order is not total: for `GL₂` the translations `t^{(1,0)}` and `t^{(0,1)}` (the classes of
-- `diag(ϖ⁻¹, 1)` and `diag(1, ϖ⁻¹)`, both of length `1`) are incomparable.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a.basePoint.displacement = ![1 / 2, 0])
    (z z' : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (hz' : (TauCeti.GeneralLinear.pointsMulEquiv 2 z'.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![1, (π : K)⁻¹]) :
    ¬ (bruhatPartialOrder a).le (mk _ z) (mk _ z') ∧
      ¬ (bruhatPartialOrder a).le (mk _ z') (mk _ z) := by
  sorry

end IwahoriWeylGroup

/-! ### RG2.4/affine-tits-system, iwahori-bruhat-decomposition, kottwitz-quotient,
parahoric-double-cosets, simple-cell-multiplication -/

namespace Decomposition

open IwahoriWeylGroup

variable (D : LocalRootData K H) {φ : Valuation D.rootDatum} [GeometricValuation D φ] (a : BaseAlcove D φ)

/-- `N(K) ∩ G(K)_1` and `I` generate `G(K)_1` (part of the affine Tits system). -/
theorem affineTitsSystem_closure :
    Subgroup.closure ((a.iwahori : Set (WithConv (H →ₐ[K] K))) ∪
      (D.normalizer ⊓ parahoricGenerated D φ : Subgroup _)) = parahoricGenerated D φ := by
  sorry

/-- Lifts of `Ω` normalize the Iwahori subgroup. -/
theorem lengthZero_normalizes_iwahori (n : D.normalizer) (hn : mk D n ∈ lengthZero D a) :
    (n : WithConv (H →ₐ[K] K)) ∈ Subgroup.normalizer (a.iwahori : Set (WithConv (H →ₐ[K] K))) := by
  sorry

/-- `G(K)` is generated by `G(K)_1` and the lifts of `Ω`. -/
theorem parahoricGenerated_sup_lengthZero :
    parahoricGenerated D φ ⊔ ((lengthZero D a).comap (mk D)).map D.normalizer.subtype = ⊤ := by
  sorry

/-- The Iwahori–Bruhat bijection `W̃ ≃ I\G(K)/I`. -/
def iwahoriBruhat :
    IwahoriWeylGroup D ≃ DoubleCoset.Quotient (a.iwahori : Set (WithConv (H →ₐ[K] K))) a.iwahori :=
  sorry

theorem iwahoriBruhat_mk (n : D.normalizer) :
    iwahoriBruhat D a (mk D n) = DoubleCoset.mk a.iwahori a.iwahori (n : WithConv (H →ₐ[K] K)) := by
  sorry

/-- The Kottwitz quotient `κ : G(K) →* Ω` with kernel `G(K)_1`. -/
def kottwitzToLengthZero : WithConv (H →ₐ[K] K) →* lengthZero D a :=
  sorry

theorem kottwitzToLengthZero_surjective : Function.Surjective (kottwitzToLengthZero D a) := by
  sorry

theorem ker_kottwitzToLengthZero : (kottwitzToLengthZero D a).ker = parahoricGenerated D φ := by
  sorry

theorem kottwitzToLengthZero_mk (n : D.normalizer) (w : affineWeyl D φ) (τ : lengthZero D a)
    (hn : mk D n = w * τ) : kottwitzToLengthZero D a n = τ := by
  sorry

/-- The finite Weyl group `W_Ω = (P_Ω ∩ N(K))/Z(K)_0` of a nonempty finite subset of the apartment. -/
def parahoricWeyl (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] : Subgroup (IwahoriWeylGroup D) :=
  ((parahoricSubgroup D φ Ω).subgroupOf D.normalizer).map (mk D)

theorem finite_parahoricWeyl (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    Finite (parahoricWeyl D Ω) := by
  sorry

/-- The Iwahori subgroup has trivial finite Weyl group: `I ∩ N(K) = Z(K)_0` (Haines–Rapoport,
Lem. 6, p. 3). -/
theorem parahoricWeyl_basePoint : parahoricWeyl D {a.basePoint} = ⊥ := by
  sorry

/-- Parahoric double cosets: `P_Ω\G(K)/P_{Ω'} ≃ W_Ω\W̃/W_{Ω'}` for nonempty finite subsets of the
closed base alcove (Haines–Rapoport, Prop. 8, p. 4; Richarz, Thm 1.4, p. 119). -/
def parahoricDoubleCosetEquiv (Ω Ω' : Finset (Apartment φ)) [Fact Ω.Nonempty] [Fact Ω'.Nonempty]
    (hΩ : (Ω : Set (Apartment φ)) ⊆ a.closure) (hΩ' : (Ω' : Set (Apartment φ)) ⊆ a.closure) :
    DoubleCoset.Quotient (parahoricWeyl D Ω : Set (IwahoriWeylGroup D)) (parahoricWeyl D Ω') ≃
      DoubleCoset.Quotient (parahoricSubgroup D φ Ω : Set (WithConv (H →ₐ[K] K)))
        (parahoricSubgroup D φ Ω') :=
  sorry

/-- The bijection sends the class of `mk n` to the class of `n`. -/
theorem parahoricDoubleCosetEquiv_mk (Ω Ω' : Finset (Apartment φ)) [Fact Ω.Nonempty]
    [Fact Ω'.Nonempty] (hΩ : (Ω : Set (Apartment φ)) ⊆ a.closure)
    (hΩ' : (Ω' : Set (Apartment φ)) ⊆ a.closure) (n : D.normalizer) :
    parahoricDoubleCosetEquiv D a Ω Ω' hΩ hΩ'
        (DoubleCoset.mk (parahoricWeyl D Ω) (parahoricWeyl D Ω') (mk D n)) =
      DoubleCoset.mk (parahoricSubgroup D φ Ω) (parahoricSubgroup D φ Ω')
        (n : WithConv (H →ₐ[K] K)) := by
  sorry

-- Test BruhatTits.Decomposition.parahoricWeyl_gl2
-- At the special vertex `0` of the standard `GL₂` apartment, `W_0 = S₂` has two elements.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0) :
    Nat.card (parahoricWeyl (GLBuilding.standardData (K := K) 2) {x₀}) = 2 := by
  sorry

-- Test BruhatTits.Decomposition.kottwitz_gl2
-- `κ` is nontrivial on the class of `diag(ϖ⁻¹, 1)` and trivial on the Iwahori subgroup.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a₂ : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (z : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (g : WithConv (_ →ₐ[K] K)) (hg : g ∈ a₂.iwahori) :
    kottwitzToLengthZero _ a₂ (z : WithConv (_ →ₐ[K] K)) ≠ 1 ∧ kottwitzToLengthZero _ a₂ g = 1 := by
  sorry

-- Test BruhatTits.Decomposition.iwahoriBruhat_one_iff
-- The double coset attached to `1 ∈ W̃` is `I` itself.
example (g : WithConv (H →ₐ[K] K)) :
    DoubleCoset.mk a.iwahori a.iwahori g = iwahoriBruhat D a 1 ↔ g ∈ a.iwahori := by
  have h := iwahoriBruhat_mk D a 1
  rw [map_one] at h
  rw [h, OneMemClass.coe_one, DoubleCoset.eq]
  constructor
  · rintro ⟨x, hx, y, hy, hxy⟩
    have : g = x⁻¹ * y⁻¹ :=
      calc g = x⁻¹ * (x * g * y) * y⁻¹ := by group
        _ = x⁻¹ * y⁻¹ := by rw [← hxy, mul_one]
    rw [this]
    exact mul_mem (inv_mem hx) (inv_mem hy)
  · intro hg
    exact ⟨g⁻¹, inv_mem hg, 1, one_mem _, by simp⟩

-- Test BruhatTits.Decomposition.iwahoriBruhat_infinite_gl2
-- For `GL₂` there are infinitely many Iwahori double cosets, `W̃ = ℤ² ⋊ S₂` being infinite.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (a₂ : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2)) :
    Infinite (DoubleCoset.Quotient (SetLike.coe a₂.iwahori) (SetLike.coe a₂.iwahori)) := by
  sorry

-- Test BruhatTits.Decomposition.iwahoriBruhat_gl2_hyperspecial
-- For `GL₂` with base alcove `0 < x₁ - x₂ < 1`, the elements of `GL₂(𝒪)`, the parahoric subgroup
-- of the special vertex `0`, lie in the double cosets of `1` and of the permutation matrix.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (a₂ : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a₂.basePoint.displacement = ![1 / 2, 0])
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0)
    (s : (GLBuilding.standardData (K := K) 2).normalizer)
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) =
      !![0, 1; 1, 0])
    (g : WithConv (_ →ₐ[K] K)) (hg : g ∈ parahoricSubgroup _ (GLBuilding.standardValuation 2) {x₀}) :
    DoubleCoset.mk a₂.iwahori a₂.iwahori g = iwahoriBruhat _ a₂ 1 ∨
      DoubleCoset.mk a₂.iwahori a₂.iwahori g = iwahoriBruhat _ a₂ (mk _ s) := by
  sorry

-- Test BruhatTits.Decomposition.kottwitzToLengthZero_sl2
-- For the simply connected `SL₂`, `Ω` is trivial and so is `κ`.
example (D₂ : LocalRootData K (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra K 2))
    {φ₂ : Valuation D₂.rootDatum} [GeometricValuation D₂ φ₂] (a₂ : BaseAlcove D₂ φ₂)
    (g : WithConv (_ →ₐ[K] K)) : kottwitzToLengthZero D₂ a₂ g = 1 := by
  sorry

-- Test BruhatTits.Decomposition.kottwitzToLengthZero_gl2_det
-- For `GL₂`, `κ(g)` is determined by the valuation of `det g`: `κ g = κ g'` iff
-- `|det g| = |det g'|` (here `Ω ≅ ℤ` through `ω ∘ det`).
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (a₂ : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (g g' : WithConv (_ →ₐ[K] K)) :
    kottwitzToLengthZero _ a₂ g = kottwitzToLengthZero _ a₂ g' ↔
      ValuativeRel.valuation K
          (TauCeti.GeneralLinear.pointsMulEquiv 2 g : Matrix (Fin 2) (Fin 2) K).det =
        ValuativeRel.valuation K
          (TauCeti.GeneralLinear.pointsMulEquiv 2 g' : Matrix (Fin 2) (Fin 2) K).det := by
  sorry

-- Test BruhatTits.Decomposition.parahoricWeyl_anisotropic
-- With no relative roots every parahoric subgroup is `Z(K)_0`, so `W_Ω` is trivial.
example [IsEmpty D.ι] (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    parahoricWeyl D Ω = ⊥ := by
  sorry

-- Test BruhatTits.Decomposition.parahoricWeyl_le_affineWeyl
-- `W_Ω ⊆ W_a`: unlike the full stabilizer of `Ω`, it contains no torsion translations outside
-- `W_a`.
example (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    parahoricWeyl D Ω ≤ affineWeyl D φ := by
  sorry

-- Test BruhatTits.Decomposition.parahoricWeyl_le_pointStabilizer
-- The finite Weyl group of a point fixes that point.
example (x : Apartment φ) : parahoricWeyl D {x} ≤ pointStabilizer D φ x := by
  sorry

-- Test BruhatTits.Decomposition.parahoricDoubleCosetEquiv_hyperspecial_gl2
-- For `GL₂` and the special vertex `0` of the closed base alcove, the class of `t^{(1,0)}` goes to
-- the double coset `K diag(1, ϖ⁻¹) K` of the `W_0`-conjugate translation.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a₂ : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a₂.basePoint.displacement = ![1 / 2, 0])
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0)
    (h₀ : (({x₀} : Finset _) : Set (Apartment (GLBuilding.standardValuation (K := K) 2))) ⊆
      a₂.closure)
    (z z' : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (hz' : (TauCeti.GeneralLinear.pointsMulEquiv 2 z'.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![1, (π : K)⁻¹]) :
    parahoricDoubleCosetEquiv _ a₂ {x₀} {x₀} h₀ h₀
        (DoubleCoset.mk (parahoricWeyl _ {x₀}) (parahoricWeyl _ {x₀}) (mk _ z)) =
      DoubleCoset.mk (parahoricSubgroup _ (GLBuilding.standardValuation 2) {x₀})
        (parahoricSubgroup _ (GLBuilding.standardValuation 2) {x₀}) (z' : WithConv (_ →ₐ[K] K)) := by
  sorry

-- Test BruhatTits.Decomposition.parahoricDoubleCosetEquiv_alcove
-- For `Ω = Ω' = {basePoint}` the bijection is the Iwahori–Bruhat bijection `iwahoriBruhat`
-- (`W_C = 1` by `parahoricWeyl_basePoint`).
example (w : IwahoriWeylGroup D)
    (h : (({a.basePoint} : Finset (Apartment φ)) : Set (Apartment φ)) ⊆ a.closure) :
    parahoricDoubleCosetEquiv D a {a.basePoint} {a.basePoint} h h
        (DoubleCoset.mk (parahoricWeyl D {a.basePoint}) (parahoricWeyl D {a.basePoint}) w) =
      iwahoriBruhat D a w := by
  obtain ⟨n, rfl⟩ := mk_surjective D w
  rw [parahoricDoubleCosetEquiv_mk, iwahoriBruhat_mk]
  rfl

-- Test BruhatTits.Decomposition.parahoricDoubleCosetEquiv_cartan_infinite_gl2
-- For `GL₂` the Cartan set `K\G(K)/K` of the special vertex `0` is infinite.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0) :
    Infinite (DoubleCoset.Quotient
      (SetLike.coe (parahoricSubgroup _ (GLBuilding.standardValuation 2) {x₀}))
      (SetLike.coe (parahoricSubgroup _ (GLBuilding.standardValuation 2) {x₀}))) := by
  sorry

-- Test BruhatTits.Decomposition.parahoricDoubleCosetEquiv_mixed_gl2
-- For `GL₂`, `Ω = {0}` and `Ω' = {basePoint}`: the class of the permutation matrix `s ∈ W_0` goes
-- to the double coset `K · 1 · I`, whereas in `I\G(K)/I` the classes of `s` and `1` differ.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (a₂ : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a₂.basePoint.displacement = ![1 / 2, 0])
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0)
    (h₀ : (({x₀} : Finset _) : Set (Apartment (GLBuilding.standardValuation (K := K) 2))) ⊆
      a₂.closure)
    (s : (GLBuilding.standardData (K := K) 2).normalizer)
    (hs : (TauCeti.GeneralLinear.pointsMulEquiv 2 s.val : Matrix (Fin 2) (Fin 2) K) =
      !![0, 1; 1, 0]) :
    parahoricDoubleCosetEquiv _ a₂ {x₀} {a₂.basePoint} h₀
        (by simpa using a₂.basePoint_mem_closure)
        (DoubleCoset.mk (parahoricWeyl _ {x₀}) (parahoricWeyl _ {a₂.basePoint}) (mk _ s)) =
      DoubleCoset.mk (parahoricSubgroup _ (GLBuilding.standardValuation 2) {x₀})
        (parahoricSubgroup _ (GLBuilding.standardValuation 2) {a₂.basePoint}) 1 ∧
      iwahoriBruhat _ a₂ (mk _ s) ≠ iwahoriBruhat _ a₂ 1 := by
  sorry

/-- Multiplication of a simple cell with a cell: the two length cases. -/
theorem simpleCell_mul_cell (s w : D.normalizer) (hs : mk D s ∈ simpleReflections a) :
    (length a (mk D s * mk D w) = length a (mk D w) + 1 →
      a.cell s * a.cell w = a.cell (s * w)) ∧
    (length a (mk D s * mk D w) + 1 = length a (mk D w) →
      a.cell s * a.cell w = a.cell (s * w) ∪ a.cell w) := by
  sorry

/-- Products of cells with additive lengths. -/
theorem cell_mul_cell_of_length_add (w w' : D.normalizer)
    (h : length a (mk D w * mk D w') = length a (mk D w) + length a (mk D w')) :
    a.cell w * a.cell w' = a.cell (w * w') := by
  sorry

/-- The cell of `n` depends only on the image of `n` in `W̃`. -/
theorem cell_eq_of_mk_eq (n n' : D.normalizer) (h : mk D n = mk D n') : a.cell n = a.cell n' := by
  sorry

/-! ### RG2.4/cartan-decomposition, iwasawa-decomposition, iwahori-factorization,
hyperspecial-generation -/

/-- The Cartan decomposition `G(K) = K Z(K) K` for the parahoric subgroup `K` of a special point
(Bruhat–Tits I (4.4.3), p. 80; Haines–Rapoport, Prop. 8, p. 4, and Prop. 13, p. 8). -/
theorem cartan (x : Apartment φ) (hx : Facet.IsSpecial x) :
    (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) *
      (D.rootDatum.T : Set (WithConv (H →ₐ[K] K))) *
      (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) = Set.univ := by
  sorry

-- Test BruhatTits.Decomposition.cartan_not_special (non-example)
-- At a non-special point `x` the finite Weyl group `W_x` projects onto a proper subgroup of `W₀`,
-- so the double cosets `P_x ṅ P_x` with `n` outside `W_x · Z(K) · W_x` are missed.
example (x : Apartment φ) (hx : ¬ Facet.IsSpecial x) :
    (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) *
      (D.rootDatum.T : Set (WithConv (H →ₐ[K] K))) *
      (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) ≠ Set.univ := by
  sorry

/-- Cartan double cosets are indexed by `W_0\W̃/W_0`, with `W_0 = W_x` for `x` special. -/
theorem cartan_parahoricWeyl_eq (x : Apartment φ) (hx : Facet.IsSpecial x) :
    Function.Bijective ((toRelativeWeyl D).comp (parahoricWeyl D {x}).subtype) := by
  sorry

/-- The Iwasawa decomposition `G(K) = K Z(K) U(K)` at a special point. -/
theorem iwasawa (x : Apartment φ) (hx : Facet.IsSpecial x) (v : D.V)
    (hv : IsRegularVector D v) :
    (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) *
      (D.rootDatum.T : Set (WithConv (H →ₐ[K] K))) *
      (unipotentRadical D v : Set (WithConv (H →ₐ[K] K))) = Set.univ := by
  sorry

/-- The Iwasawa cells `K ẇ U(K)` of the parahoric `K` of a special point are indexed by `W_0\W̃`:
the map from `N(K)` to `K\G(K)/U(K)` is surjective and identifies `n, n'` iff they differ by
`K ∩ N(K)` on the left. -/
theorem iwasawa_cells (x : Apartment φ) (hx : Facet.IsSpecial x) (v : D.V)
    (hv : IsRegularVector D v) :
    Function.Surjective (fun n : D.normalizer =>
      DoubleCoset.mk (parahoricSubgroup D φ {x}) (unipotentRadical D v)
        (n : WithConv (H →ₐ[K] K))) ∧
    ∀ n n' : D.normalizer,
      DoubleCoset.mk (parahoricSubgroup D φ {x}) (unipotentRadical D v) (n : WithConv (H →ₐ[K] K)) =
        DoubleCoset.mk (parahoricSubgroup D φ {x}) (unipotentRadical D v) n' ↔
      ∃ k ∈ parahoricWeyl D {x}, mk D n' = k * mk D n := by
  sorry

/-- The Iwahori factorization `I = (I ∩ U⁻)(I ∩ Z)(I ∩ U⁺)` (Bruhat–Tits I (6.4.9), p. 136). -/
theorem iwahoriFactorization (v : D.V) (hv : IsRegularVector D v) :
    (a.iwahori : Set (WithConv (H →ₐ[K] K))) =
      ((a.iwahori ⊓ unipotentRadical D (-v) : Subgroup _) : Set (WithConv (H →ₐ[K] K))) *
        (a.iwahori ⊓ D.rootDatum.T : Subgroup _) *
        (a.iwahori ⊓ unipotentRadical D v : Subgroup _) := by
  sorry

/-- Uniqueness in the Iwahori factorization. -/
theorem iwahoriFactorization_injective (v : D.V) (hv : IsRegularVector D v) :
    Function.Injective (fun p : (a.iwahori ⊓ unipotentRadical D (-v) : Subgroup _) ×
        (a.iwahori ⊓ D.rootDatum.T : Subgroup _) ×
        (a.iwahori ⊓ unipotentRadical D v : Subgroup _) =>
      ((p.1 : WithConv (H →ₐ[K] K)) * p.2.1 * p.2.2)) := by
  sorry

/-- Contraction by elements of the dominant monoid of `Z(K)`: if `z ∈ Z(K)` translates the
apartment by a vector on which every root positive on `v` is nonnegative, then
`z⁻¹ (I ∩ U) z ⊆ I ∩ U`. -/
theorem iwahori_unipotent_contract [Nonempty (Apartment φ)] (v : D.V) (hv : IsRegularVector D v)
    (z : D.normalizer) (hz : (z : WithConv (H →ₐ[K] K)) ∈ D.rootDatum.T)
    (hdom : ∀ i : D.ι, 0 < D.Φ.root i v →
      0 ≤ D.Φ.root i ((apartmentAction D φ (mk D z)) (Classical.arbitrary (Apartment φ)) -ᵥ
        Classical.arbitrary (Apartment φ))) :
    (a.iwahori ⊓ unipotentRadical D v : Subgroup _).map
        (MulAut.conj (z : WithConv (H →ₐ[K] K))⁻¹).toMonoidHom ≤
      a.iwahori ⊓ unipotentRadical D v := by
  sorry

-- Test BruhatTits.Decomposition.iwahori_unipotent_contract_sign (non-example)
-- For `GL₂` and `z = diag(ϖ, ϖ⁻¹)`, the translation of `z` is `(-1, 1)`, negative on the upper
-- root `x₁ - x₂`; conjugation by `z⁻¹` expands the upper root group, so the conclusion of
-- `iwahori_unipotent_contract` fails for `z`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a₂ : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (v : (GLBuilding.standardData (K := K) 2).V) (hv : GLBuilding.standardCoordinates 2 v = ![1, 0])
    (z : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K), (π : K)⁻¹]) :
    ¬ (a₂.iwahori ⊓ unipotentRadical _ v : Subgroup _).map
        (MulAut.conj (z : WithConv (_ →ₐ[K] K))⁻¹).toMonoidHom ≤
      a₂.iwahori ⊓ unipotentRadical _ v := by
  sorry

-- Test BruhatTits.Decomposition.iwahori_unipotent_contract_valuation (computation)
-- The valuation computation behind the non-example: `ϖ⁻² u` is not integral for a unit `u`.
example (ϖ : K) (hϖ0 : ϖ ≠ 0) (u : K) (hu : ValuativeRel.valuation K u = 1)
    (hϖ : ValuativeRel.valuation K ϖ < 1) :
    ¬ ValuativeRel.valuation K (ϖ⁻¹ * ϖ⁻¹ * u) ≤ 1 := sorry

/-- Every parahoric subgroup is generated by its torus part `Z(K)_0` and its root-group parts
`U_{a,x}` (Bruhat–Tits II 5.2.4, p. 164); for a hyperspecial point of a split group these are
`𝒯(𝒪)` and the `𝒰_a(𝒪)`. -/
theorem parahoric_closure_torus_rootGroups (x : Apartment φ) :
    Subgroup.closure (((parahoricSubgroup D φ {x} ⊓ D.rootDatum.T : Subgroup _) :
        Set (WithConv (H →ₐ[K] K))) ∪
      ⋃ i : D.ι, ((parahoricSubgroup D φ {x} ⊓ D.rootDatum.U i : Subgroup _) :
        Set (WithConv (H →ₐ[K] K)))) = parahoricSubgroup D φ {x} := by
  sorry

/-! ### RG2.4/iwasawa-parabolic-integral, kneser-tits-local,
iwasawa-integration-and-unimodularity -/

/-- The parabolic subgroup `P_v(K) = M_v(K) U_v(K)` attached to a vector `v` of the coroot space
(not necessarily regular): generated by the Levi `M_v` of `leviOfVector` and the root groups
positive on `v`. For `v` regular it is the minimal parabolic `Z(K) U(K)`; every `K`-parabolic
containing the minimal one has this form (ReductiveGroups, layer 7). It differs from the dynamic
parabolic `TauCeti.Cocharacter.parabolic` in taking a real vector and only rational points. -/
def parabolicOfVector (v : D.V) : Subgroup (WithConv (H →ₐ[K] K)) :=
  leviOfVector D.rootDatum v ⊔ unipotentRadical D v

theorem parabolicOfVector_mono (v : D.V) (hv : IsRegularVector D v) (w : D.V)
    (hw : ∀ i : D.ι, 0 < D.Φ.root i v → 0 ≤ D.Φ.root i w) :
    parabolicOfVector D v ≤ parabolicOfVector D w := by
  sorry

/-- The Iwasawa decomposition for an arbitrary parabolic: `G(K) = K P_v(K)` for the parahoric
`K` of a special point (RG2.4/iwasawa-parabolic-integral (1)). -/
theorem iwasawa_parabolic (x : Apartment φ) (hx : Facet.IsSpecial x) (v : D.V) :
    (parahoricSubgroup D φ {x} : Set (WithConv (H →ₐ[K] K))) *
      (parabolicOfVector D v : Set (WithConv (H →ₐ[K] K))) = Set.univ := by
  sorry

/-- Good position of a special parahoric with respect to a parabolic:
`K ∩ P_v(K) = (K ∩ M_v(K)) (K ∩ U_v(K))` (RG2.4/iwasawa-parabolic-integral (2)). This is the
integral Iwasawa decomposition `𝒢(𝒪) ∩ P(E) = 𝒫(𝒪) = ℳ(𝒪) 𝒩(𝒪)` when `K = 𝒢(𝒪)` is hyperspecial
(RG2.3/hyperspecial-vertices identifies `𝒢(𝒪)` with `𝒢°_x(𝒪)`). -/
theorem special_inf_parabolic_eq (x : Apartment φ) (hx : Facet.IsSpecial x) (v : D.V) :
    ((parahoricSubgroup D φ {x} ⊓ parabolicOfVector D v : Subgroup _) :
        Set (WithConv (H →ₐ[K] K))) =
      ((parahoricSubgroup D φ {x} ⊓ leviOfVector D.rootDatum v : Subgroup _) :
        Set (WithConv (H →ₐ[K] K))) *
        (parahoricSubgroup D φ {x} ⊓ unipotentRadical D v : Subgroup _) := by
  sorry

open scoped PointTopology in
/-- `G(K)/P_v(K)` is compact for a nonarchimedean local field `K`, in the point topology: it is the
image of the compact parahoric subgroup of a special point (RG2.4/iwasawa-parabolic-integral (3)). -/
theorem compactSpace_quotient_parabolic [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v : D.V) : CompactSpace (WithConv (H →ₐ[K] K) ⧸ parabolicOfVector D v) := by
  sorry

-- Test Decomposition.iwasawa_parabolic_regular: for `v` regular, `P_v = Z(K) U_v(K)`, so the first
-- statement is `iwasawa`.
example (v : D.V) (hv : IsRegularVector D v) :
    parabolicOfVector D v =
      D.rootDatum.T ⊔ unipotentRadical D v := by
  sorry

-- Test Decomposition.parabolicOfVector_zero: `v = 0` gives `P_0 = M_0 = G(K)` when the datum
-- generates `G(K)`.
example (hgen : D.rootDatum.IsGenerating) : parabolicOfVector D 0 = ⊤ := by
  sorry

-- Test Decomposition.parabolicOfVector_ne_iwahori: a parabolic is never a parahoric subgroup
-- unless the group is anisotropic (`D.ι` empty).
example [Nonempty D.ι] (v : D.V) (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    parabolicOfVector D v ≠ parahoricSubgroup D φ Ω := by
  sorry

/-- The subgroup `G(K)^+` generated by the rational points of the root groups `U_a(K)`
(equivalently, by the `K`-points of the unipotent radicals of the `K`-parabolics;
RG2.4/kneser-tits-local). -/
def plusSubgroup : Subgroup (WithConv (H →ₐ[K] K)) :=
  Subgroup.closure (⋃ i : D.ι, (D.rootDatum.U i : Set (WithConv (H →ₐ[K] K))))

theorem plusSubgroup_normal (hgen : D.rootDatum.IsGenerating) : (plusSubgroup D).Normal := by
  sorry

theorem unipotentRadical_le_plusSubgroup (v : D.V) :
    unipotentRadical D v ≤ plusSubgroup D := by
  sorry

/-- Tits' simplicity theorem (Gille 2009, §1, p. 39, after Tits 1964): for `G` almost `K`-simple
and `K`-isotropic with at least four elements in `K`, every proper normal subgroup of `G(K)^+` is
central in `G(K)`. Almost simplicity is taken in the form "the absolute root system `Ψ` is
irreducible and the coroots span `X_*(T)`" (semisimple, simply connected, absolutely almost
simple), for the absolute root datum `A` of the same group. -/
theorem tits_simplicity (A : AbsoluteRootData K H) [A.Ψ.IsIrreducible]
    (hsc : Submodule.span ℤ (Set.range A.Ψ.coroot) = ⊤) [Nonempty D.ι]
    (hcard : 4 ≤ Cardinal.mk K) (N : Subgroup (WithConv (H →ₐ[K] K)))
    (hN : N ≤ plusSubgroup D) (hnormal : ∀ g : WithConv (H →ₐ[K] K), ∀ n ∈ N, g * n * g⁻¹ ∈ N) :
    N ≤ Subgroup.center (WithConv (H →ₐ[K] K)) ∨ N = plusSubgroup D := by
  sorry

/-- `G(K)^+` is perfect under the hypotheses of `tits_simplicity` (Gille 2009, Fait 4.1, p. 52). -/
theorem plusSubgroup_commutator (A : AbsoluteRootData K H) [A.Ψ.IsIrreducible]
    (hsc : Submodule.span ℤ (Set.range A.Ψ.coroot) = ⊤) [Nonempty D.ι]
    (hcard : 4 ≤ Cardinal.mk K) :
    ⁅plusSubgroup D, plusSubgroup D⁆ = plusSubgroup D := by
  sorry

/-- The Kneser–Tits theorem for nonarchimedean local fields (Platonov 1969 in characteristic zero,
Prasad–Raghunathan 1985 in general): for `G` simply connected, absolutely almost simple and
`K`-isotropic, `G(K)^+ = G(K)`, i.e. the Whitehead group `W(K, G)` is trivial. -/
theorem kneserTits_local [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (A : AbsoluteRootData K H) [A.Ψ.IsIrreducible]
    (hsc : Submodule.span ℤ (Set.range A.Ψ.coroot) = ⊤) [Nonempty D.ι] :
    plusSubgroup D = ⊤ := by
  sorry

/-- No proper subgroup of finite index: under the hypotheses of `kneserTits_local`, a subgroup of
`G(K)` of finite index is `G(K)` (derived from `tits_simplicity` and `kneserTits_local`; this is
the local input of the arithmetic finite-index elimination of AdelicAlgebraicGroups, AA.4). -/
theorem eq_top_of_finiteIndex [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (A : AbsoluteRootData K H) [A.Ψ.IsIrreducible]
    (hsc : Submodule.span ℤ (Set.range A.Ψ.coroot) = ⊤) [Nonempty D.ι]
    (hgen : D.rootDatum.IsGenerating) (N : Subgroup (WithConv (H →ₐ[K] K))) [N.FiniteIndex] :
    N = ⊤ := by
  sorry

-- Test Decomposition.plusSubgroup_anisotropic: for an anisotropic group (`D.ι` empty) `G(K)^+`
-- is trivial, so the Kneser–Tits conclusion fails whenever `G(K) ≠ 1`.
omit [ValuativeRel K] [ModelField K] in
example [IsEmpty D.ι] : plusSubgroup D = ⊥ := by
  simp [plusSubgroup]

-- Test Decomposition.plusSubgroup_le_commutator: `G(K)^+ ⊆ [G(K), G(K)]`; a consequence of
-- `plusSubgroup_commutator` (Gille 2009, Fait 4.1, p. 52) under its hypotheses.
example (A : AbsoluteRootData K H) [A.Ψ.IsIrreducible]
    (hsc : Submodule.span ℤ (Set.range A.Ψ.coroot) = ⊤) [Nonempty D.ι]
    (hcard : 4 ≤ Cardinal.mk K) :
    plusSubgroup D ≤ ⁅(⊤ : Subgroup (WithConv (H →ₐ[K] K))), ⊤⁆ := by
  sorry

-- Test Decomposition.plusSubgroup_gl2 (non-example)
-- For `GL₂`, whose coroots do not span the cocharacters, `G(K)^+ = SL₂(K) ≠ GL₂(K)`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] :
    plusSubgroup (GLBuilding.standardData (K := K) 2) ≠ ⊤ := by
  sorry

open scoped PointTopology in
/-- `G(K)` is unimodular for a connected reductive group over a nonarchimedean local field: its
modular character in the point topology is trivial (Cartier, Corvallis Part 1, §4.1, p. 144; in
characteristic zero Platonov–Rapinchuk–Rapinchuk, Thm 3.71, p. 196, applied to `det Ad`). -/
theorem modularCharacter_eq_one [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (hH : TauCeti.reductiveCommHopfAlgProperty K H) :
    MeasureTheory.Measure.modularCharacter (G := WithConv (H →ₐ[K] K)) = 1 := by
  sorry

end Decomposition

/-! ### RG2.4/dominant-coinvariant-cocharacters, translation-length-formula,
dominant-normal-form, admissible-set -/

-- Test minimalLevi_quaternion_quotient
/- The normalized division valuation has scalar image 2ℤ and kernel O_D×.
Its quotient is the rational translation group of the anisotropic PGL₁(D). -/
example {E D : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] [DivisionRing D] [Algebra E D]
    [FiniteDimensional E D] (hd : Module.finrank E D = 4)
    (v : Dˣ →* Multiplicative ℤ) (hv : Function.Surjective v)
    (hscalar : ∀ a : Eˣ, v (Units.map (algebraMap E D).toMonoidHom a) =
      (TauCeti.normalizedValuation E a) ^ 2) :
    Nonempty ((Dˣ ⧸ ((Units.map (algebraMap E D).toMonoidHom).range ⊔ v.ker)) ≃ ZMod 2) :=
  sorry

-- Test minimalLevi_quaternion_displacement
example : (1 : ZMod 2) ≠ 0 ∧
    ∀ (ρ : Multiplicative (ZMod 2) →* Equiv.Perm PUnit) (g : Multiplicative (ZMod 2)),
      ρ g = 1 := by
  exact ⟨by decide, fun _ _ => Subsingleton.elim _ _⟩

-- Test minimalLevi_quaternion_torus_fixed
example : {n : ℤ | -n = n} = {0} ∧ Nat.card (ZMod 2) = 2 := by
  constructor
  · ext n
    simp only [Set.mem_ofPred_eq, Set.mem_singleton_iff]
    omega
  · simp

-- Test unramifiedComparison_split_A1
example : ∀ i : Fin 2, Equiv.refl (Fin 2) ((1 : Equiv.Perm (Fin 2)) i) =
    (1 : Equiv.Perm (Fin 2)) (Equiv.refl (Fin 2) i) := by
  intro i
  rfl

-- Test unramifiedComparison_inner_A1_rejected
example : ¬ ∃ e : Equiv.Perm (Fin 2), ∀ i,
    e (Equiv.swap (0 : Fin 2) 1 i) = (1 : Equiv.Perm (Fin 2)) (e i) := by
  rintro ⟨e, h⟩
  have h01 := e.injective (h 0)
  norm_num at h01

namespace Coinvariants

-- Test newton_translation_resGL2
example :
    let lam : Fin 2 → Fin 2 → ℚ := ![![1, 0], ![0, 1]]
    let σ := fun x : Fin 2 → Fin 2 → ℚ => ![x 1, x 0]
    let dom := fun x : Fin 2 → Fin 2 → ℚ =>
      fun i => ![max (x i 0) (x i 1), min (x i 0) (x i 1)]
    let avg := fun x => (1 / 2 : ℚ) • (x + σ x)
    lam + σ lam = ![![1, 1], ![1, 1]] ∧
      dom (avg lam) = ![![1/2, 1/2], ![1/2, 1/2]] ∧
      avg (dom lam) = ![![1, 0], ![1, 0]] ∧ dom (avg lam) ≠ avg (dom lam) := by
  sorry

-- Test newton_translation_dominant
example :
    let lam : Fin 2 → Fin 2 → ℚ := ![![2, 0], ![1, 0]]
    let σ := fun x : Fin 2 → Fin 2 → ℚ => ![x 1, x 0]
    let dom := fun x : Fin 2 → Fin 2 → ℚ =>
      fun i => ![max (x i 0) (x i 1), min (x i 0) (x i 1)]
    let avg := fun x => (1 / 2 : ℚ) • (x + σ x)
    dom (avg lam) = ![![3/2, 0], ![3/2, 0]] ∧ dom (avg lam) = avg (dom lam) := by
  sorry

-- Test newton_translation_split_sign
example :
    let dom := fun x : Fin 2 → ℚ => ![max (x 0) (x 1), min (x 0) (x 1)]
    dom (-(![1, 0] : Fin 2 → ℚ)) = ![0, -1] ∧
      dom (-(![2, 0] : Fin 2 → ℚ)) = ![0, -2] ∧
      (∑ i, (-(![1, 0] : Fin 2 → ℚ)) i) = -1 ∧
      (∑ i, (-(![2, 0] : Fin 2 → ℚ)) i) = -2 := by
  sorry


open IwahoriWeylGroup

variable {D : LocalRootData K H} (φ : Valuation D.rootDatum)

section

variable [GeometricValuation D φ]

/-- The translation vector `ν(t)` of a translation element, read off from the apartment action.
For `t` the class of `z ∈ Z(K)`, `⟨χ, ν(t)⟩ = -ω(χ(z))`.
The Kottwitz quotient retains torsion invisible in this vector. For an actual split
cocharacter `λ`, `t^λ` is represented by `λ(ϖ)⁻¹`. -/
def translationVector [Nonempty (Apartment φ)] (t : translations D) : D.V :=
  apartmentAction D φ (t : IwahoriWeylGroup D) (Classical.arbitrary (Apartment φ)) -ᵥ
    Classical.arbitrary (Apartment φ)

theorem apartmentAction_translation [Nonempty (Apartment φ)] (t : translations D)
    (x : Apartment φ) :
    apartmentAction D φ (t : IwahoriWeylGroup D) x = translationVector φ t +ᵥ x := by
  sorry

/-- Dominance of a translation element with respect to the chamber of a regular vector `v`:
every root positive on `v` is non-negative on the translation vector. -/
def IsDominant [Nonempty (Apartment φ)] (v : D.V) (t : translations D) : Prop :=
  ∀ i : D.ι, 0 < D.Φ.root i v → 0 ≤ D.Φ.root i (translationVector φ t)

end

/-- The dominant representative of the `W_0`-orbit of a translation element, dominance being read
off from the translation vectors of the apartment action of the valued field. -/
def dominantRep [GeometricValuation D φ] [Nonempty (Apartment φ)] (v : D.V)
    (t : translations D) : translations D :=
  sorry

variable [GeometricValuation D φ]

theorem dominantRep_mem_orbit [Nonempty (Apartment φ)] (v : D.V) (hv : IsRegularVector D v)
    (t : translations D) :
    IsDominant φ v (dominantRep φ v t) ∧
      ∃ n : IwahoriWeylGroup D, (dominantRep φ v t : IwahoriWeylGroup D) = n * t * n⁻¹ := by
  sorry

/-- The dominant element of the orbit is unique. -/
theorem eq_dominantRep [Nonempty (Apartment φ)] (v : D.V) (hv : IsRegularVector D v)
    (t s : translations D) (n : IwahoriWeylGroup D)
    (hs : (s : IwahoriWeylGroup D) = n * t * n⁻¹) (hdom : IsDominant φ v s) :
    s = dominantRep φ v t := by
  sorry

@[simp] theorem dominantRep_of_isDominant [Nonempty (Apartment φ)] (v : D.V)
    (t : translations D) (ht : IsDominant φ v t) : dominantRep φ v t = t := by
  sorry

/-- The dominance order on translation elements: `t ≤ t'` iff `t' t⁻¹ ∈ W_a` (equal image in
`π₁(G)_I` over `L`) and the translation vector of `t' t⁻¹` is a sum of positive coroots of the
échelonnage root system (He 2021, §2.2, p. 6; Kisin–Zhou §2.1.5, p. 7). -/
def dominanceLE [Nonempty (Apartment φ)] (hφ : φ.IsDiscrete) (v : D.V) (t t' : translations D) :
    Prop :=
  (t' : IwahoriWeylGroup D) * (t : IwahoriWeylGroup D)⁻¹ ∈ affineWeyl D φ ∧
    translationVector φ t' - translationVector φ t ∈
      AddSubmonoid.closure {c : D.V | ∃ i, 0 < (echelonnage φ hφ).root i v ∧
        c = (echelonnage φ hφ).coroot i}

/-- The dominance relation is a partial order for `v` regular. -/
theorem dominanceLE_antisymm [Nonempty (Apartment φ)] (hφ : φ.IsDiscrete) (v : D.V)
    (hv : IsRegularVector D v) {t t' : translations D} (h : dominanceLE φ hφ v t t')
    (h' : dominanceLE φ hφ v t' t) : t = t' := by
  sorry

theorem dominanceLE_trans [Nonempty (Apartment φ)] (hφ : φ.IsDiscrete) (v : D.V)
    {t t' t'' : translations D} (h : dominanceLE φ hφ v t t') (h' : dominanceLE φ hφ v t' t'') :
    dominanceLE φ hφ v t t'' := by
  sorry

-- Test BruhatTits.Coinvariants.dominanceLE_refl
example [Nonempty (Apartment φ)] (hφ : φ.IsDiscrete) (v : D.V) (t : translations D) :
    dominanceLE φ hφ v t t := by
  sorry

-- Test BruhatTits.Coinvariants.isDominant_gl_n
-- For `GL₂` and `v = (1, 0)`, `t^{(1,0)}` (the class of `diag(ϖ⁻¹, 1)`, translation `(1,0)`) is
-- dominant and `t^{(0,1)}` (the class of `diag(1, ϖ⁻¹)`) is not.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (v : (GLBuilding.standardData (K := K) 2).V) (hv : GLBuilding.standardCoordinates 2 v = ![1, 0])
    (z z' : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (hz' : (TauCeti.GeneralLinear.pointsMulEquiv 2 z'.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![1, (π : K)⁻¹])
    (t t' : translations (GLBuilding.standardData (K := K) 2))
    (ht : (t : IwahoriWeylGroup _) = mk _ z) (ht' : (t' : IwahoriWeylGroup _) = mk _ z') :
    IsDominant (GLBuilding.standardValuation 2) v t ∧
      ¬ IsDominant (GLBuilding.standardValuation 2) v t' := by
  sorry

-- Test BruhatTits.Coinvariants.translationVector_gl2
-- The classes of `diag(ϖ⁻¹, 1)` and `diag(ϖ⁻², 1)` translate the apartment by `(1, 0)` and `(2, 0)`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (z z' : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (hz' : (TauCeti.GeneralLinear.pointsMulEquiv 2 z'.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹ * (π : K)⁻¹, 1])
    (t t' : translations (GLBuilding.standardData (K := K) 2))
    (ht : (t : IwahoriWeylGroup _) = mk _ z) (ht' : (t' : IwahoriWeylGroup _) = mk _ z') :
    GLBuilding.standardCoordinates 2 (translationVector (GLBuilding.standardValuation 2) t) = ![1, 0] ∧
      GLBuilding.standardCoordinates 2 (translationVector (GLBuilding.standardValuation 2) t') =
        ![2, 0] := by
  sorry

-- Test BruhatTits.Coinvariants.dominantRep_gl2
-- For `v = (1, 0)` the dominant representative of `t^{(0,1)}` is `t^{(1,0)}`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (v : (GLBuilding.standardData (K := K) 2).V) (hv : GLBuilding.standardCoordinates 2 v = ![1, 0])
    (z z' : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (hz' : (TauCeti.GeneralLinear.pointsMulEquiv 2 z'.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![1, (π : K)⁻¹])
    (t t' : translations (GLBuilding.standardData (K := K) 2))
    (ht : (t : IwahoriWeylGroup _) = mk _ z) (ht' : (t' : IwahoriWeylGroup _) = mk _ z') :
    dominantRep (GLBuilding.standardValuation 2) v t' = t := by
  sorry

-- Test BruhatTits.Coinvariants.dominanceLE_gl2
-- For `GL₂` and `v = (1, 0)`: `t^{(1,0)} ≤ t^{(2,-1)}` (difference the coroot `(1,-1)`), while
-- `t^{(1,0)}` and `t^{(1,1)}` are incomparable (different image in `π₁ = ℤ`).
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (hφ : (GLBuilding.standardValuation (K := K) 2).IsDiscrete)
    (v : (GLBuilding.standardData (K := K) 2).V) (hv : GLBuilding.standardCoordinates 2 v = ![1, 0])
    (z₁ z₂ z₃ : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz₁ : (TauCeti.GeneralLinear.pointsMulEquiv 2 z₁.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (hz₂ : (TauCeti.GeneralLinear.pointsMulEquiv 2 z₂.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹ * (π : K)⁻¹, (π : K)])
    (hz₃ : (TauCeti.GeneralLinear.pointsMulEquiv 2 z₃.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, (π : K)⁻¹])
    (t₁ t₂ t₃ : translations (GLBuilding.standardData (K := K) 2))
    (h₁ : (t₁ : IwahoriWeylGroup _) = mk _ z₁) (h₂ : (t₂ : IwahoriWeylGroup _) = mk _ z₂)
    (h₃ : (t₃ : IwahoriWeylGroup _) = mk _ z₃) :
    dominanceLE (GLBuilding.standardValuation 2) hφ v t₁ t₂ ∧
      ¬ dominanceLE (GLBuilding.standardValuation 2) hφ v t₁ t₃ ∧
      ¬ dominanceLE (GLBuilding.standardValuation 2) hφ v t₃ t₁ := by
  sorry

-- Test BruhatTits.Coinvariants.dominance_simpleRoot_negative (non-example)
-- For `GL₃` and `v = (2, 1, 0)`, `1 ≤ t^{(1,-1,0)}` (a positive coroot) although the simple root
-- `x₂ - x₃` takes the value `-1` on `(1, -1, 0)`: dominance is not the coordinatewise order on
-- simple-root values.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (hφ : (GLBuilding.standardValuation (K := K) 3).IsDiscrete)
    (v : (GLBuilding.standardData (K := K) 3).V)
    (hv : GLBuilding.standardCoordinates 3 v = ![2, 1, 0])
    (t : translations (GLBuilding.standardData (K := K) 3))
    (ht : GLBuilding.standardCoordinates 3
      (translationVector (GLBuilding.standardValuation 3) t) = ![1, -1, 0])
    (i : (GLBuilding.standardData (K := K) 3).ι)
    (hi : (GLBuilding.standardRoots 3 i).val = (1, 2)) :
    dominanceLE (GLBuilding.standardValuation 3) hφ v 1 t ∧
      (GLBuilding.standardData (K := K) 3).Φ.root i
        (translationVector (GLBuilding.standardValuation 3) t) = -1 := by
  sorry

-- Test BruhatTits.Coinvariants.dominance_not_real_order (non-example)
-- A translation outside `W_a` is never above `1`, even when its vector is a nonnegative real
-- multiple of a positive coroot (for `PGL₂`, the generator `1` of `X_*(T) = ℤ` with coroot `2`).
example [Nonempty (Apartment φ)] (hφ : φ.IsDiscrete) (v : D.V) (t : translations D)
    (ht : (t : IwahoriWeylGroup D) ∉ affineWeyl D φ) :
    ¬ dominanceLE φ hφ v 1 t := by
  intro h
  apply ht
  simpa using h.1

-- Test BruhatTits.Coinvariants.translationVector_one
example [Nonempty (Apartment φ)] : translationVector φ (1 : translations D) = 0 := by
  simp [translationVector]

-- Test BruhatTits.Coinvariants.translationVector_anisotropic
-- When the coroot space is zero every translation vector vanishes, although `translations D` can
-- be nontrivial (the ramified norm-one torus of `IwahoriWeylGroup.not_quotient_by_boundedPart`):
-- `translationVector` is not injective in general.
example [Nonempty (Apartment φ)] [Subsingleton D.V] (t : translations D) :
    translationVector φ t = 0 :=
  Subsingleton.elim _ _

-- Test BruhatTits.Coinvariants.translationVector_mul
-- `t ↦ ν(t)` is additive.
example [Nonempty (Apartment φ)] (t t' : translations D) :
    translationVector φ (t * t') = translationVector φ t + translationVector φ t' := by
  have x := Classical.arbitrary (Apartment φ)
  have h := apartmentAction_translation φ (t * t') x
  rw [Subgroup.coe_mul, map_mul, AffineEquiv.coe_mul, Function.comp_apply,
    apartmentAction_translation, apartmentAction_translation, vadd_vadd] at h
  exact (vadd_right_cancel x h).symm

-- Test BruhatTits.Coinvariants.isDominant_one
example [Nonempty (Apartment φ)] (v : D.V) : IsDominant φ v 1 := by
  intro i _
  simp [translationVector]

-- Test BruhatTits.Coinvariants.isDominant_zero_vector
-- For `v = 0` no root is positive, so every translation is dominant: `v` must be regular for
-- dominance to mean anything (`dominantRep_mem_orbit`).
example [Nonempty (Apartment φ)] (t : translations D) : IsDominant φ 0 t := by
  intro i hi
  simp at hi

-- Test BruhatTits.Coinvariants.dominantRep_one
example [Nonempty (Apartment φ)] (v : D.V) : dominantRep φ v 1 = 1 :=
  dominantRep_of_isDominant φ v 1 fun i _ => by simp [translationVector]

-- Test BruhatTits.Coinvariants.dominantRep_gl3
-- For `GL₃` and `v = (2, 1, 0)`, the dominant representative of the translation by `(0, 1, 2)` is
-- the translation by `(2, 1, 0)`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (v : (GLBuilding.standardData (K := K) 3).V)
    (hv : GLBuilding.standardCoordinates 3 v = ![2, 1, 0])
    (t : translations (GLBuilding.standardData (K := K) 3))
    (ht : GLBuilding.standardCoordinates 3
      (translationVector (GLBuilding.standardValuation 3) t) = ![0, 1, 2]) :
    GLBuilding.standardCoordinates 3 (translationVector (GLBuilding.standardValuation 3)
      (dominantRep (GLBuilding.standardValuation 3) v t)) = ![2, 1, 0] := by
  sorry

/-- Translations of the same dominant type have the same length. -/
theorem length_translation_eq_dominantRep [Nonempty (Apartment φ)] (a : BaseAlcove D φ) (v : D.V)
    (hv : IsRegularVector D v) (t : translations D) :
    length a (t : IwahoriWeylGroup D) = length a (dominantRep φ v t : IwahoriWeylGroup D) := by
  sorry

/-- Length is additive on dominant translations. -/
theorem length_translation_mul [Nonempty (Apartment φ)] (a : BaseAlcove D φ) (v : D.V)
    (hv : IsRegularVector D v) (t t' : translations D) (ht : IsDominant φ v t)
    (ht' : IsDominant φ v t') :
    length a ((t * t' : translations D) : IwahoriWeylGroup D) =
      length a (t : IwahoriWeylGroup D) + length a (t' : IwahoriWeylGroup D) := by
  sorry

/-- `ℓ(w t) = ℓ(w) + ℓ(t)` for `t` dominant and `w ∈ W_x`, when the special point `x` lies in the
closed base alcove and the base alcove lies in the chamber of `v` at `x` (the orientation of
`length_orientation_gl2`). -/
theorem length_mul_translation_of_isDominant [Nonempty (Apartment φ)] (a : BaseAlcove D φ)
    (x : Apartment φ) (hx : Facet.IsSpecial x) (v : D.V) (hv : IsRegularVector D v)
    (hav : x ∈ a.closure ∧ ∀ y ∈ a.facet.carrier, ∀ i, 0 < D.Φ.root i v → 0 ≤ D.Φ.root i (y -ᵥ x))
    (t : translations D) (ht : IsDominant φ v t) (w : IwahoriWeylGroup D)
    (hw : w ∈ Decomposition.parahoricWeyl D {x}) :
    length a (w * (t : IwahoriWeylGroup D)) = length a w + length a (t : IwahoriWeylGroup D) := by
  sorry

/-- The dominant normal form `w = x t y`, with `t` dominant and `t y` minimal in its left
`W_0`-coset, exists and is unique, with `ℓ(w) = ℓ(x) + ℓ(t) − ℓ(y)` (He–Nie–Yu §2E, p. 1687, in the
orientation of `length_mul_translation_of_isDominant`). -/
theorem dominantNormalForm [Nonempty (Apartment φ)] (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (hx : Facet.IsSpecial x₀) (v : D.V) (hv : IsRegularVector D v)
    (hav : x₀ ∈ a.closure ∧ ∀ y ∈ a.facet.carrier, ∀ i, 0 < D.Φ.root i v → 0 ≤ D.Φ.root i (y -ᵥ x₀))
    (w : IwahoriWeylGroup D) :
    ∃! p : Decomposition.parahoricWeyl D {x₀} × translations D × Decomposition.parahoricWeyl D {x₀},
      IsDominant φ v p.2.1 ∧
      (∀ u : Decomposition.parahoricWeyl D {x₀},
        length a ((p.2.1 : IwahoriWeylGroup D) * p.2.2) ≤
          length a (u * ((p.2.1 : IwahoriWeylGroup D) * p.2.2))) ∧
      w = (p.1 : IwahoriWeylGroup D) * (p.2.1 : IwahoriWeylGroup D) * (p.2.2 : IwahoriWeylGroup D) ∧
      length a w + length a (p.2.2 : IwahoriWeylGroup D) =
        length a (p.1 : IwahoriWeylGroup D) + length a (p.2.1 : IwahoriWeylGroup D) := by
  sorry

end Coinvariants

namespace Admissible

open IwahoriWeylGroup

variable {D : LocalRootData K H} {φ : Valuation D.rootDatum} [GeometricValuation D φ]

/-- The `μ`-admissible set `Adm(μ) = {w : w ≤ y μ y⁻¹ for some y ∈ W_{x₀}}` (Rapoport (3.4), p. 10),
for a special point `x₀` of the closed base alcove, so that `W_{x₀} ≅ W_0`. -/
def admissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D) :
    Set (IwahoriWeylGroup D) :=
  {w | ∃ y ∈ Decomposition.parahoricWeyl D {x₀}, bruhatLE a w (y * (μ : IwahoriWeylGroup D) * y⁻¹)}

theorem admissibleSet_finite (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (hx : Facet.IsSpecial x₀) (μ : translations D) : (admissibleSet a x₀ μ).Finite := by
  sorry

theorem admissibleSet_lowerSet (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    {w w' : IwahoriWeylGroup D} (h : bruhatLE a w' w) (hw : w ∈ admissibleSet a x₀ μ) :
    w' ∈ admissibleSet a x₀ μ := by
  sorry

theorem translation_mem_admissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) (y : IwahoriWeylGroup D) (hy : y ∈ Decomposition.parahoricWeyl D {x₀}) :
    y * (μ : IwahoriWeylGroup D) * y⁻¹ ∈ admissibleSet a x₀ μ := by
  sorry

/-- The elements of maximal length `ℓ(μ)` in `Adm(μ)` are exactly the conjugates `y μ y⁻¹`. -/
theorem length_le_of_mem_admissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) {w : IwahoriWeylGroup D} (hw : w ∈ admissibleSet a x₀ μ) :
    length a w ≤ length a (μ : IwahoriWeylGroup D) ∧
      (length a w = length a (μ : IwahoriWeylGroup D) →
        ∃ y ∈ Decomposition.parahoricWeyl D {x₀}, w = y * (μ : IwahoriWeylGroup D) * y⁻¹) := by
  sorry

theorem admissibleSet_subset_coset (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D) :
    admissibleSet a x₀ μ ⊆
      (affineWeyl D φ : Set (IwahoriWeylGroup D)) * {(μ : IwahoriWeylGroup D)} := by
  sorry

/-- An automorphism of `W̃` preserving the Bruhat relation and `W_{x₀}`, and mapping `μ` into its
`W_{x₀}`-orbit, preserves `Adm(μ)`; Frobenius is one when `W_0 μ` is `σ`-stable. -/
theorem admissibleSet_map_eq (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (θ : IwahoriWeylGroup D ≃* IwahoriWeylGroup D)
    (hθ : ∀ w w', bruhatLE a (θ w) (θ w') ↔ bruhatLE a w w')
    (hW : (Decomposition.parahoricWeyl D {x₀}).map θ.toMonoidHom = Decomposition.parahoricWeyl D {x₀})
    (hμ : ∃ y ∈ Decomposition.parahoricWeyl D {x₀}, θ μ = y * (μ : IwahoriWeylGroup D) * y⁻¹) :
    θ '' admissibleSet a x₀ μ = admissibleSet a x₀ μ := by
  sorry

/-- The parahoric admissible set `Adm^Ω(μ) = W_Ω Adm(μ) W_Ω`. -/
def parahoricAdmissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] : Set (IwahoriWeylGroup D) :=
  (Decomposition.parahoricWeyl D Ω : Set (IwahoriWeylGroup D)) * admissibleSet a x₀ μ *
    Decomposition.parahoricWeyl D Ω

theorem admissibleSet_subset_parahoricAdmissibleSet (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    admissibleSet a x₀ μ ⊆ parahoricAdmissibleSet a x₀ μ Ω := by
  sorry

theorem parahoricAdmissibleSet_alcove (a : BaseAlcove D φ) (x₀ : Apartment φ)
    (μ : translations D) : parahoricAdmissibleSet a x₀ μ {a.basePoint} = admissibleSet a x₀ μ := by
  sorry

-- Test BruhatTits.Admissible.admissibleSet_zero
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (hx : Facet.IsSpecial x₀) :
    admissibleSet a x₀ 1 = {1} := by
  sorry

-- Test BruhatTits.Admissible.admissibleSet_central
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (hμ : (μ : IwahoriWeylGroup D) ∈ lengthZero D a) :
    admissibleSet a x₀ μ = {(μ : IwahoriWeylGroup D)} := by
  sorry

-- Test BruhatTits.Admissible.admissibleSet_ne_lowerSet_of_dominant
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D)
    (y : IwahoriWeylGroup D) (hy : y ∈ Decomposition.parahoricWeyl D {x₀})
    (hne : y * (μ : IwahoriWeylGroup D) * y⁻¹ ≠ μ) :
    ¬ bruhatLE a (y * (μ : IwahoriWeylGroup D) * y⁻¹) μ := by
  sorry

-- Test BruhatTits.Admissible.admissibleSet_gl2_minuscule
-- For `GL₂`, the base alcove `0 < x₁ - x₂ < 1`, the special vertex `0` and `μ = t^{(1,0)}`:
-- `Adm(μ) = {t^{(1,0)}, t^{(0,1)}, τ}` has three elements.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a.basePoint.displacement = ![1 / 2, 0])
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0)
    (z : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (μ : translations (GLBuilding.standardData (K := K) 2)) (hμ : (μ : IwahoriWeylGroup _) = mk _ z) :
    (admissibleSet a x₀ μ).ncard = 3 := by
  sorry

-- Test BruhatTits.Admissible.parahoricAdmissibleSet_one
-- `Adm^Ω(0) = W_Ω`.
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (Ω : Finset (Apartment φ)) [Fact Ω.Nonempty] :
    parahoricAdmissibleSet a x₀ 1 Ω =
      (Decomposition.parahoricWeyl D Ω : Set (IwahoriWeylGroup D)) := by
  sorry

-- Test BruhatTits.Admissible.parahoricAdmissibleSet_gl2_hyperspecial
-- For `GL₂`, the special vertex `0` and `μ = t^{(1,0)}`, `Adm^{0}(μ) = W_0 t^μ W_0` has four
-- elements (one double coset `K ϖ^μ K`), against three in `Adm(μ)`.
example [TopologicalSpace K] [IsNonarchimedeanLocalField K] (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : BaseAlcove (GLBuilding.standardData (K := K) 2) (GLBuilding.standardValuation 2))
    (ha : GLBuilding.standardCoordinates 2 a.basePoint.displacement = ![1 / 2, 0])
    (x₀ : Apartment (GLBuilding.standardValuation (K := K) 2))
    (hx₀ : GLBuilding.standardCoordinates 2 x₀.displacement = 0)
    (z : (GLBuilding.standardData (K := K) 2).normalizer)
    (hz : (TauCeti.GeneralLinear.pointsMulEquiv 2 z.val : Matrix (Fin 2) (Fin 2) K) =
      Matrix.diagonal ![(π : K)⁻¹, 1])
    (μ : translations (GLBuilding.standardData (K := K) 2)) (hμ : (μ : IwahoriWeylGroup _) = mk _ z) :
    (parahoricAdmissibleSet a x₀ μ {x₀}).ncard = 4 := by
  sorry

-- Test BruhatTits.Admissible.parahoricAdmissibleSet_subset_coset
-- `Adm^Ω(μ)` stays in the coset `W_a t^μ`, since `W_Ω ⊆ W_a` and `W_a` is normal.
example (a : BaseAlcove D φ) (x₀ : Apartment φ) (μ : translations D) (Ω : Finset (Apartment φ))
    [Fact Ω.Nonempty] :
    parahoricAdmissibleSet a x₀ μ Ω ⊆
      (affineWeyl D φ : Set (IwahoriWeylGroup D)) * {(μ : IwahoriWeylGroup D)} := by
  sorry

end Admissible

/-! ### RG2.4/compact-double-coset-finiteness -/

namespace Decomposition

/-- A double coset `K g K'` of open subgroups with `K` compact is a finite disjoint union of
`[K : K ∩ g K' g⁻¹]` left cosets of `K'`. The left-coset decomposition itself is
`DoubleCoset.doubleCoset_eq_iUnion_leftCosets`; this adds the finite count. -/
theorem doubleCoset_finite_of_isCompact {G : Type v} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (K K' : OpenSubgroup G) (hK : IsCompact (K : Set G)) (g : G) :
    ∃ S : Finset G,
      S.card = (K'.toSubgroup.map (MulAut.conj g).toMonoidHom).relIndex K.toSubgroup ∧
      (S : Set G).PairwiseDisjoint (fun h => h • (K' : Set G)) ∧
      DoubleCoset.doubleCoset g (K : Set G) K' = ⋃ h ∈ S, h • (K' : Set G) := by
  sorry

/-- The left Haar volume of a compact double coset. -/
theorem haar_doubleCoset {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [MeasurableSpace G] [BorelSpace G] (K K' : OpenSubgroup G) (hK : IsCompact (K : Set G))
    (g : G) (μ : MeasureTheory.Measure G) [μ.IsHaarMeasure] :
    μ (DoubleCoset.doubleCoset g (K : Set G) K') =
      ((K'.toSubgroup.map (MulAut.conj g).toMonoidHom).relIndex K.toSubgroup : ENNReal) *
        μ (K' : Set G) := by
  sorry

end Decomposition

end BruhatTits

/-! ## Layer RG2.5: Integral dual data

Declarations of layer RG2.5 on the spine carriers `LanglandsDual.dualGroup`,
`galoisActionOnPoints` and `LGroup`. The dual based root datum is Mathlib's `D.Ψ.flip` with the
base `D.base.flip`. The pinned Chevalley–Demazure group scheme over `ℤ` attached to it belongs to
the Reductive groups roadmap (layer 9) and is not in the pinned library, so `dualGroup` is
specified here through its torus, its root groups, the conjugation relation between them and the
Galois action on them; the torus `T̂` is the group algebra of `X_*(T)`, which is in the library. -/

namespace LanglandsDual

open BruhatTits
open scoped Pointwise

variable {K : Type u} [Field K] {H : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K}

/-- `Aut(Ψ) ≃* Aut(Ψ^∨)`: the automorphism of the flipped pairing with the same index permutation
whose weight map on `X_*` is the transpose-inverse of the weight map of `f` (`autFlip_weightEquiv`). -/
def autFlip (D : AbsoluteRootData K H) : RootPairing.Aut D.Ψ ≃* RootPairing.Aut D.Ψ.flip :=
  sorry

theorem autFlip_indexEquiv (D : AbsoluteRootData K H) (f : RootPairing.Aut D.Ψ) :
    (autFlip D f).indexEquiv = f.indexEquiv := sorry

/-- The weight map of `autFlip f` on `X_*` is the inverse of Mathlib's contravariant coweight map
of `f` (which is the transpose of the weight map of `f`). Since an automorphism of a root pairing
is determined by its weight map, this determines `autFlip`. -/
theorem autFlip_weightEquiv (D : AbsoluteRootData K H) (f : RootPairing.Aut D.Ψ) :
    (autFlip D f).weightEquiv = f.coweightEquiv.symm := sorry

-- Test LanglandsDual.autFlip_reflection
/- The dual of the reflection in `α_i` is the reflection in `α_i^∨`. -/
example (D : AbsoluteRootData K H) (i : D.ι) :
    autFlip D (RootPairing.Equiv.reflection D.Ψ i) = RootPairing.Equiv.reflection D.Ψ.flip i := by
  apply RootPairing.Equiv.weightHom_injective
  ext y
  simp [autFlip_weightEquiv, RootPairing.Equiv.reflection_coweightEquiv,
    RootPairing.Equiv.reflection_weightEquiv]
  rfl

-- Test LanglandsDual.autFlip_pairing
/- `f` on `X^*` and `autFlip f` on `X_*` preserve the evaluation pairing:
`⟨f x, (autFlip f) y⟩ = ⟨x, y⟩`, the contragredient. -/
example (D : AbsoluteRootData K H) (f : RootPairing.Aut D.Ψ) (x : D.X) (y : D.Y) :
    D.Ψ.toLinearMap (f.weightEquiv x) ((autFlip D f).weightEquiv y) = D.Ψ.toLinearMap x y := by
  rw [autFlip_weightEquiv, RootPairing.Equiv.toLinearMap_weightEquiv]
  simp

/-- The dual Galois action `μ̂_G = autFlip ∘ μ_G`. -/
def dualGaloisAction (D : AbsoluteRootData K H) :
    Field.absoluteGaloisGroup K →* RootPairing.Aut D.Ψ.flip :=
  (autFlip D).toMonoidHom.comp D.galoisAction

theorem dualGaloisAction_preserves_dualBase (D : AbsoluteRootData K H) (b : D.Ψ.Base)
    (hb : ∀ γ i, i ∈ b.support → (D.galoisAction γ).indexEquiv i ∈ b.support)
    (γ : Field.absoluteGaloisGroup K) (i : D.ι) (hi : i ∈ (b.flip).support) :
    (dualGaloisAction D γ).indexEquiv i ∈ (b.flip).support := by
  rw [RootPairing.Base.flip_support] at hi ⊢
  change (autFlip D (D.galoisAction γ)).indexEquiv i ∈ b.support
  rw [autFlip_indexEquiv]
  exact hb γ i hi

theorem dualGaloisAction_finite (D : AbsoluteRootData K H) :
    (Set.range (dualGaloisAction D)).Finite := sorry

-- Test LanglandsDual.dualGaloisAction_split
example (D : AbsoluteRootData K H) (h : ∀ γ, D.galoisAction γ = 1) (γ : Field.absoluteGaloisGroup K) :
    dualGaloisAction D γ = 1 := by
  simp [dualGaloisAction, h]

-- Test LanglandsDual.transpose_antiHom (non-example)
/- Transposition without inversion: `f ↦ (autFlip f)⁻¹` has weight map the transpose
`f.coweightEquiv`, and it is not multiplicative on two automorphisms that do not commute. -/
example (D : AbsoluteRootData K H) (f g : RootPairing.Aut D.Ψ) (hfg : f * g ≠ g * f) :
    ((autFlip D f)⁻¹).weightEquiv = f.coweightEquiv ∧
      (autFlip D (f * g))⁻¹ ≠ (autFlip D f)⁻¹ * (autFlip D g)⁻¹ := by
  refine ⟨?_, fun h => hfg ?_⟩
  · rw [RootPairing.Equiv.weightEquiv_inv, autFlip_weightEquiv]
    rfl
  · apply (autFlip D).injective
    rw [← mul_inv_rev, inv_inj, map_mul] at h
    rw [map_mul, map_mul, h]

-- Test LanglandsDual.dualRootDatum_gl_n
/- For `GL_n` with its diagonal torus (`X = Y = ℤⁿ`, roots and coroots `e_i - e_j`, evaluation
pairing the dot product) the flipped datum is isomorphic to the datum itself by an isomorphism that
is the identity on indices. -/
example (D : AbsoluteRootData K H) (n : ℕ) (eX : D.X ≃+ (Fin n → ℤ)) (eY : D.Y ≃+ (Fin n → ℤ))
    (eι : D.ι ≃ {p : Fin n × Fin n // p.1 ≠ p.2})
    (hroot : ∀ i, eX (D.Ψ.root i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hcoroot : ∀ i, eY (D.Ψ.coroot i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hpair : ∀ x y, D.Ψ.toLinearMap x y = dotProduct (eX x) (eY y)) :
    ∃ e : RootPairing.Equiv D.Ψ.flip D.Ψ, e.indexEquiv = Equiv.refl D.ι := sorry

/-- The dual torus `T̂`: the group algebra of `X_*(T)` over `ℤ`. -/
def dualTorus (D : AbsoluteRootData K H) : CommHopfAlgCat.{u} ℤ :=
  CommHopfAlgCat.of ℤ (MonoidAlgebra ℤ (Multiplicative D.Y))

-- Test LanglandsDual.dualTorus_points
/- `T̂(A) = Hom(X_*(T), Aˣ)`: the points of the diagonalizable group of `X_*(T)`
(`TauCeti.DiagonalizableGroup.pointsMulEquiv`). -/
example (D : AbsoluteRootData K H) (A : Type u) [CommRing A] :
    Nonempty (WithConv (dualTorus D →ₐ[ℤ] A) ≃* (Multiplicative D.Y →* Aˣ)) :=
  ⟨TauCeti.DiagonalizableGroup.pointsMulEquiv⟩

-- Test LanglandsDual.dualTorus_rank_zero
/- For `X_*(T) = 0` (the trivial group) the dual torus has a single point. -/
example (D : AbsoluteRootData K H) [Subsingleton D.Y] (A : Type u) [CommRing A] :
    Subsingleton (WithConv (dualTorus D →ₐ[ℤ] A)) := by
  have : Subsingleton (Multiplicative D.Y →* Aˣ) := ⟨fun a b => MonoidHom.ext fun y => by
    rw [Subsingleton.elim y 1, map_one, map_one]⟩
  exact (TauCeti.DiagonalizableGroup.pointsMulEquiv (R := ℤ) (A := A)
    (G := Multiplicative D.Y)).injective.subsingleton

-- Test LanglandsDual.dualTorus_rank_one
/- For `X_*(T) ≅ ℤ` (for instance `G_m` or a norm-one torus) `T̂(A) ≅ Aˣ`. -/
example (D : AbsoluteRootData K H) (eY : D.Y ≃+ ℤ) (A : Type u) [CommRing A] :
    Nonempty (WithConv (dualTorus D →ₐ[ℤ] A) ≃* Aˣ) :=
  ⟨TauCeti.DiagonalizableGroup.pointsMulEquiv.trans
    ((MulEquiv.monoidHomCongrLeft (AddEquiv.toMultiplicative eY)).trans (zpowersMulHom Aˣ).symm)⟩

/-- The inclusion `T̂(R) → Ĝ(R)`. -/
def dualTorusInclusion (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R) →* WithConv (dualGroup D →ₐ[ℤ] R) := sorry

theorem dualTorusInclusion_injective (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    Function.Injective (dualTorusInclusion D R) := sorry

/-- The inclusion of the dual torus is natural in the coefficient ring. -/
theorem dualTorusInclusion_natural (D : AbsoluteRootData K H) {R R' : Type} [CommRing R]
    [CommRing R'] (f : R →+* R') (t : WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R)) :
    dualTorusInclusion D R' (TauCeti.AlgHom.mapValue
        (ULift.ringEquiv.symm.toRingHom.comp (f.comp ULift.ringEquiv.toRingHom)).toIntAlgHom t) =
      TauCeti.AlgHom.mapValue f.toIntAlgHom (dualTorusInclusion D R t) := sorry

/-- The root subgroup `x_{α^∨_i} : (R, +) → Ĝ(R)`. For a simple root it is the parametrization
of the pinning; for a non-simple root the pinning fixes it only up to `r ↦ -r`, and the statements
below that use it for every root (injectivity, the conjugation relation, the Levi subgroups) do not
depend on that sign. -/
def dualRootSubgroup (D : AbsoluteRootData K H) (R : Type) [CommRing R] (i : D.ι) :
    Multiplicative R →* WithConv (dualGroup D →ₐ[ℤ] R) := sorry

theorem dualRootSubgroup_injective (D : AbsoluteRootData K H) (R : Type) [CommRing R] (i : D.ι) :
    Function.Injective (dualRootSubgroup D R i) := sorry

/-- The root groups are natural in the coefficient ring: they come from morphisms `G_a → Ĝ` over
`ℤ`, so a parametrization is fixed for all `R` at once. -/
theorem dualRootSubgroup_natural (D : AbsoluteRootData K H) {R R' : Type} [CommRing R]
    [CommRing R'] (f : R →+* R') (i : D.ι) (r : R) :
    TauCeti.AlgHom.mapValue f.toIntAlgHom (dualRootSubgroup D R i (Multiplicative.ofAdd r)) =
      dualRootSubgroup D R' i (Multiplicative.ofAdd (f r)) := sorry

/-- The torus acts on the root group of `α_i^∨` through the character `α_i^∨` of `T̂`:
`t x_{α_i^∨}(r) t⁻¹ = x_{α_i^∨}(α_i^∨(t) r)`. -/
theorem dualRootSubgroup_conj (D : AbsoluteRootData K H) (R : Type) [CommRing R] (i : D.ι)
    (t : WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R)) (r : R) :
    dualTorusInclusion D R t * dualRootSubgroup D R i (Multiplicative.ofAdd r) *
        (dualTorusInclusion D R t)⁻¹ =
      dualRootSubgroup D R i (Multiplicative.ofAdd
        ((t.ofConv (MonoidAlgebra.of ℤ (Multiplicative D.Y)
          (Multiplicative.ofAdd (D.Ψ.coroot i)))).down * r)) := sorry

-- Test LanglandsDual.dualRootSubgroup_not_in_torus (non-example)
/- A nontrivial element of a root group does not lie in the dual torus: `x_{α^∨}(1) ∉ T̂(ℚ)`
(conjugating by a `t` with `α^∨(t) = 4` moves it, while `T̂(ℚ)` is commutative). -/
example (D : AbsoluteRootData K H) (i : D.ι) :
    dualRootSubgroup D ℚ i (Multiplicative.ofAdd 1) ∉ (dualTorusInclusion D ℚ).range := sorry

-- Test LanglandsDual.dualRootSubgroup_opposite (non-example)
/- The root groups of `α^∨` and of `-α^∨` (index `s_α(α)`) meet trivially, so the
parametrizations of opposite roots are not interchangeable. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (i : D.ι) :
    (dualRootSubgroup D R i).range ⊓ (dualRootSubgroup D R (D.Ψ.reflectionPerm i i)).range = ⊥ :=
  sorry

theorem dualGroup_smooth (D : AbsoluteRootData K H) : Algebra.Smooth ℤ (dualGroup D) := sorry

theorem dualGroup_reductive_fibres (D : AbsoluteRootData K H) (k : Type) [Field k]
    (P : TauCeti.FiniteTypeCommHopfAlgCat.{0, 0} k)
    (hP : P.obj = TauCeti.CommHopfAlgCat.baseChange (K := k) (dualGroup D)) :
    TauCeti.reductiveCommHopfAlgProperty k P := sorry

-- Test LanglandsDual.dualGroup_torus
/- With no roots, `Ĝ(R) = T̂(R) = Hom(X_*(T), R^×)`. -/
example (D : AbsoluteRootData K H) [IsEmpty D.ι] (R : Type) [CommRing R] :
    Function.Bijective (dualTorusInclusion D R) := sorry

/-- The dual group of a torus is the dual torus: `Ĝ(R) ≃* Hom(X_*(T), R^×)`. -/
theorem dualGroup_torus_points (D : AbsoluteRootData K H) [IsEmpty D.ι] (R : Type) [CommRing R] :
    Nonempty (WithConv (dualGroup D →ₐ[ℤ] R) ≃* (Multiplicative D.Y →* Rˣ)) := sorry

-- Test LanglandsDual.dualGroup_rootCount (non-example)
/- Two tori with empty root index sets, of cocharacter ranks `0` (the trivial group) and `1`
(`G_m`), have non-isomorphic dual groups: `Ĝ(ℚ)` is trivial for the first and `ℚˣ` for the second.
A bijection of root indices does not identify dual groups. -/
example {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : AbsoluteRootData K H)
    (D' : AbsoluteRootData K H') [IsEmpty D.ι] [IsEmpty D'.ι] [Subsingleton D.Y]
    (eY : D'.Y ≃+ ℤ) :
    Nonempty (D.ι ≃ D'.ι) ∧
      ¬ Nonempty (WithConv (dualGroup D →ₐ[ℤ] ℚ) ≃* WithConv (dualGroup D' →ₐ[ℤ] ℚ)) := by
  refine ⟨⟨Equiv.equivOfIsEmpty _ _⟩, fun ⟨f⟩ => ?_⟩
  obtain ⟨e₁⟩ := dualGroup_torus_points D ℚ
  obtain ⟨e₂⟩ := dualGroup_torus_points D' ℚ
  have : Subsingleton (Multiplicative D.Y →* ℚˣ) := ⟨fun a b => MonoidHom.ext fun y => by
    rw [Subsingleton.elim y 1, map_one, map_one]⟩
  have : Subsingleton (WithConv (dualGroup D →ₐ[ℤ] ℚ)) := e₁.injective.subsingleton
  have : Subsingleton (WithConv (dualGroup D' →ₐ[ℤ] ℚ)) := f.symm.injective.subsingleton
  have : Subsingleton (Multiplicative D'.Y →* ℚˣ) := e₂.symm.injective.subsingleton
  let u : ℚˣ := Units.mk0 2 two_ne_zero
  let χ : Multiplicative D'.Y →* ℚˣ :=
    (zpowersHom ℚˣ u).comp (AddMonoidHom.toMultiplicative eY.toAddMonoidHom)
  have h1 : χ (Multiplicative.ofAdd (eY.symm 1)) = u := by simp [χ]
  rw [Subsingleton.elim χ 1] at h1
  have h2 : (u : ℚ) = 1 := by rw [← h1]; rfl
  norm_num [u] at h2

-- Test LanglandsDual.dualGroup_gl_n
/- For `GL_n` with its diagonal torus, `Ĝ(R) ≃* GL_n(R)`. -/
example (D : AbsoluteRootData K H) (n : ℕ) (eX : D.X ≃+ (Fin n → ℤ)) (eY : D.Y ≃+ (Fin n → ℤ))
    (eι : D.ι ≃ {p : Fin n × Fin n // p.1 ≠ p.2})
    (hroot : ∀ i, eX (D.Ψ.root i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hcoroot : ∀ i, eY (D.Ψ.coroot i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hpair : ∀ x y, D.Ψ.toLinearMap x y = dotProduct (eX x) (eY y)) (R : Type) [CommRing R] :
    Nonempty (WithConv (dualGroup D →ₐ[ℤ] R) ≃* Matrix.GeneralLinearGroup (Fin n) R) := sorry

-- Test LanglandsDual.dualRootSubgroup_gl_n
/- For `GL_n` with its diagonal torus, the pinned isomorphism `Ĝ(R) ≅ GL_n(R)` sends `t ∈ T̂(R)` to
`diag(t(e_1), …, t(e_n))` and the simple root group of the coroot `e_k - e_l` to the elementary
matrices `1 + r E_{kl}`. -/
example (D : AbsoluteRootData K H) (n : ℕ) (eX : D.X ≃+ (Fin n → ℤ)) (eY : D.Y ≃+ (Fin n → ℤ))
    (eι : D.ι ≃ {p : Fin n × Fin n // p.1 ≠ p.2})
    (hroot : ∀ i, eX (D.Ψ.root i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hcoroot : ∀ i, eY (D.Ψ.coroot i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hpair : ∀ x y, D.Ψ.toLinearMap x y = dotProduct (eX x) (eY y)) (R : Type) [CommRing R] :
    ∃ e : WithConv (dualGroup D →ₐ[ℤ] R) ≃* Matrix.GeneralLinearGroup (Fin n) R,
      (∀ t, ((e (dualTorusInclusion D R t) : Matrix.GeneralLinearGroup (Fin n) R) :
          Matrix (Fin n) (Fin n) R) = Matrix.diagonal fun k =>
            (t.ofConv (MonoidAlgebra.of ℤ (Multiplicative D.Y)
              (Multiplicative.ofAdd (eY.symm (Pi.single k 1))))).down) ∧
      ∀ i ∈ D.base.support, ∀ r : R,
        ((e (dualRootSubgroup D R i (Multiplicative.ofAdd r)) :
            Matrix.GeneralLinearGroup (Fin n) R) : Matrix (Fin n) (Fin n) R) =
          1 + Matrix.single (eι i).1.1 (eι i).1.2 r := sorry

/-- The automorphisms of the dual root datum preserving the chosen dual base: the stabilizer of
its support for the action of `Aut(Ψ^∨)` on the root indices. -/
def basedAutomorphisms (D : AbsoluteRootData K H) : Subgroup (RootPairing.Aut D.Ψ.flip) :=
  MulAction.stabilizer (RootPairing.Aut D.Ψ.flip) (D.base.flip.support : Set D.ι)

/-- The Galois action valued in the stabilizer of the dual base. -/
def galoisActionOnPinned (D : AbsoluteRootData K H) :
    Field.absoluteGaloisGroup K →* basedAutomorphisms D :=
  (dualGaloisAction D).codRestrict (basedAutomorphisms D) fun γ => by
    rw [basedAutomorphisms, MulAction.mem_stabilizer_iff]
    ext j
    simp only [Set.mem_smul_set_iff_inv_smul_mem, Finset.mem_coe, RootPairing.Base.flip_support]
    rw [D.galoisAction_base γ, ← map_inv]
    change (D.galoisAction γ).indexEquiv ((autFlip D (D.galoisAction γ⁻¹)).indexEquiv j) ∈
      D.base.support ↔ j ∈ D.base.support
    rw [autFlip_indexEquiv, map_inv, RootPairing.Equiv.indexEquiv_inv]
    simp

-- Test LanglandsDual.basedAutomorphisms_identity
example (D : AbsoluteRootData K H) : (1 : RootPairing.Aut D.Ψ.flip) ∈ basedAutomorphisms D :=
  (basedAutomorphisms D).one_mem

-- Test LanglandsDual.basedAutomorphisms_galois
/- The dual Galois action is based: it preserves the dual base because `μ_G` preserves the base. -/
example (D : AbsoluteRootData K H) (γ : Field.absoluteGaloisGroup K) :
    dualGaloisAction D γ ∈ basedAutomorphisms D :=
  (galoisActionOnPinned D γ).property

-- Test LanglandsDual.basedAutomorphisms_empty_base
example (D : AbsoluteRootData K H) (hb : D.base.support = ∅) :
    basedAutomorphisms D = ⊤ := by
  ext f
  simp [basedAutomorphisms, hb]

-- Test LanglandsDual.basedAutomorphisms_reflection_excluded (non-example)
/- The reflection in a simple coroot sends it to its negative, which is not simple: Weyl
automorphisms are not based. -/
example (D : AbsoluteRootData K H) (i : D.ι) (hi : i ∈ D.base.support) :
    RootPairing.Equiv.reflection D.Ψ.flip i ∉ basedAutomorphisms D := by
  intro h
  rw [basedAutomorphisms, MulAction.mem_stabilizer_iff] at h
  have hj : (RootPairing.Equiv.reflection D.Ψ.flip i) • i ∈ (D.base.flip.support : Set D.ι) := by
    rw [← h]; exact Set.smul_mem_smul_set (by simpa using hi)
  have hj' : D.Ψ.flip.reflectionPerm i i ∈ D.base.flip.support := hj
  have hroot : D.Ψ.flip.root (D.Ψ.flip.reflectionPerm i i) = -D.Ψ.flip.root i := by
    rw [RootPairing.root_reflectionPerm, RootPairing.reflection_apply_self]
  by_cases hij : i = D.Ψ.flip.reflectionPerm i i
  · rw [← hij] at hroot
    have h2 := congrArg (fun x => D.Ψ.flip.toLinearMap x (D.Ψ.flip.coroot i)) hroot
    simp only [map_neg, LinearMap.neg_apply, D.Ψ.flip.root_coroot_two] at h2
    omega
  · exact D.base.flip.root_ne_neg_of_ne (by simpa using hi) hj' hij (by rw [hroot, neg_neg])

/-- Pinned automorphisms: automorphisms of the dual based root datum lift to pinned
automorphisms of `Ĝ`, acting on the points over every ring `R`, compatibly with the Galois action.
The lift is injective on the points over an infinite field (`pinnedLift_injective`), but not over
every ring: over `𝔽₂` the points of a torus are trivial (`pinnedLift_not_injective`). -/
theorem pinnedLift_exists (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    ∃ lift : basedAutomorphisms D →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R)),
      ∀ γ, galoisActionOnPoints D R γ = lift (galoisActionOnPinned D γ) := sorry

theorem pinnedLift_injective (D : AbsoluteRootData K H) (R : Type) [Field R] [Infinite R] :
    ∃ lift : basedAutomorphisms D →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R)),
      Function.Injective lift ∧
        ∀ γ, galoisActionOnPoints D R γ = lift (galoisActionOnPinned D γ) := sorry

-- Test LanglandsDual.pinnedLift_not_injective (non-example)
/- For a torus `Ĝ(𝔽₂) = Hom(X_*(T), 𝔽₂ˣ)` is trivial, so every homomorphism from the based
automorphisms (which contain `-1` once the rank is positive) to `Aut(Ĝ(𝔽₂))` is constant. -/
example (D : AbsoluteRootData K H) [IsEmpty D.ι]
    (lift : basedAutomorphisms D →* MulAut (WithConv (dualGroup D →ₐ[ℤ] ZMod 2)))
    (f g : basedAutomorphisms D) : lift f = lift g := by
  obtain ⟨e⟩ := dualGroup_torus_points D (ZMod 2)
  have : Subsingleton (Multiplicative D.Y →* (ZMod 2)ˣ) :=
    ⟨fun _ _ => MonoidHom.ext fun _ => Subsingleton.elim _ _⟩
  have : Subsingleton (WithConv (dualGroup D →ₐ[ℤ] ZMod 2)) := e.injective.subsingleton
  exact MulEquiv.ext fun _ => Subsingleton.elim _ _

/-- An open subgroup of `Γ_K` acts trivially on `Ĝ(R)`. -/
theorem galoisActionOnPoints_finite (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    ∃ U : OpenSubgroup (Field.absoluteGaloisGroup K),
      (U : Subgroup (Field.absoluteGaloisGroup K)) ≤ (galoisActionOnPoints D R).ker := sorry

/-- On `T̂(R) = Hom(X_*(T), R^×)` the action is precomposition with the dual action of `γ⁻¹`:
`(γ · t)(y) = t(γ⁻¹ y)` for `y ∈ X_*(T)`. In particular it preserves `T̂(R)`. -/
theorem galoisActionOnPoints_torus (D : AbsoluteRootData K H) (R : Type) [CommRing R]
    (γ : Field.absoluteGaloisGroup K) (t : WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R)) :
    ∃ t' : WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R),
      galoisActionOnPoints D R γ (dualTorusInclusion D R t) = dualTorusInclusion D R t' ∧
        ∀ y : D.Y, t'.ofConv (MonoidAlgebra.of ℤ (Multiplicative D.Y) (Multiplicative.ofAdd y)) =
          t.ofConv (MonoidAlgebra.of ℤ (Multiplicative D.Y)
            (Multiplicative.ofAdd ((dualGaloisAction D γ⁻¹).weightEquiv y))) := sorry

-- Test LanglandsDual.galoisActionOnPoints_torus_direction
/- If `γ` carries `y₁` to `y₂` in `X_*(T)`, then `γ · t` takes at `y₂` the value that `t` takes
at `y₁`. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (γ : Field.absoluteGaloisGroup K)
    (t : WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R)) (y₁ y₂ : D.Y)
    (hy : (dualGaloisAction D γ).weightEquiv y₁ = y₂) :
    ∃ t' : WithConv (dualTorus D →ₐ[ℤ] ULift.{u} R),
      galoisActionOnPoints D R γ (dualTorusInclusion D R t) = dualTorusInclusion D R t' ∧
        t'.ofConv (MonoidAlgebra.of ℤ (Multiplicative D.Y) (Multiplicative.ofAdd y₂)) =
          t.ofConv (MonoidAlgebra.of ℤ (Multiplicative D.Y) (Multiplicative.ofAdd y₁)) := by
  obtain ⟨t', ht, ht'⟩ := galoisActionOnPoints_torus D R γ t
  refine ⟨t', ht, ?_⟩
  rw [ht', ← hy, map_inv, RootPairing.Equiv.weightEquiv_inv]
  simp

/-- The action preserves the pinning: it permutes the simple root groups as `μ̂_G` permutes the
simple coroots. -/
theorem galoisActionOnPoints_rootSubgroup (D : AbsoluteRootData K H) (R : Type) [CommRing R]
    (γ : Field.absoluteGaloisGroup K) (i : D.ι) (hi : i ∈ D.base.support) (r : Multiplicative R) :
    galoisActionOnPoints D R γ (dualRootSubgroup D R i r) =
      dualRootSubgroup D R ((dualGaloisAction D γ).indexEquiv i) r := sorry

/-- The action is natural in the coefficient ring. -/
theorem galoisActionOnPoints_natural (D : AbsoluteRootData K H) {R R' : Type} [CommRing R]
    [CommRing R'] (f : R →+* R') (γ : Field.absoluteGaloisGroup K)
    (g : WithConv (dualGroup D →ₐ[ℤ] R)) :
    galoisActionOnPoints D R' γ (TauCeti.AlgHom.mapValue f.toIntAlgHom g) =
      TauCeti.AlgHom.mapValue f.toIntAlgHom (galoisActionOnPoints D R γ g) := sorry

/-- The Weil form of the action: pull back along `W → Γ_K`. -/
def weilActionOnPoints (D : AbsoluteRootData K H) (R : Type) [CommRing R] {W : Type*} [Group W]
    (w : W →* Field.absoluteGaloisGroup K) : W →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R)) :=
  (galoisActionOnPoints D R).comp w

-- Test LanglandsDual.weilActionOnPoints_trivial_map
/- Along the trivial homomorphism `W → Γ_K` the action is trivial, whatever `μ_G` is. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] {W : Type*} [Group W] :
    weilActionOnPoints D R (1 : W →* Field.absoluteGaloisGroup K) = 1 := by
  simp [weilActionOnPoints]

-- Test LanglandsDual.weilActionOnPoints_open_kernel
/- The preimage in `W` of an open subgroup of `Γ_K` acts trivially. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] {W : Type*} [Group W]
    (w : W →* Field.absoluteGaloisGroup K) :
    ∃ U : OpenSubgroup (Field.absoluteGaloisGroup K),
      (U : Subgroup (Field.absoluteGaloisGroup K)).comap w ≤ (weilActionOnPoints D R w).ker := by
  obtain ⟨U, hU⟩ := galoisActionOnPoints_finite D R
  exact ⟨U, fun x hx => hU hx⟩

-- Test LanglandsDual.galoisAction_split
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (h : ∀ γ, D.galoisAction γ = 1)
    (γ : Field.absoluteGaloisGroup K) : galoisActionOnPoints D R γ = 1 := by
  obtain ⟨lift, hlift⟩ := pinnedLift_exists D R
  have h1 : galoisActionOnPinned D γ = 1 :=
    Subtype.ext (by simp [galoisActionOnPinned, dualGaloisAction, h])
  rw [hlift, h1, map_one]

-- Test LanglandsDual.weilActionOnPoints_split
/- If `μ_G` is trivial, the Weil action along every `W → Γ_K` is trivial. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (h : ∀ γ, D.galoisAction γ = 1)
    {W : Type*} [Group W] (w : W →* Field.absoluteGaloisGroup K) :
    weilActionOnPoints D R w = 1 := by
  obtain ⟨lift, hlift⟩ := pinnedLift_exists D R
  refine MonoidHom.ext fun x => ?_
  have h1 : galoisActionOnPinned D (w x) = 1 :=
    Subtype.ext (by simp [galoisActionOnPinned, dualGaloisAction, h])
  rw [weilActionOnPoints, MonoidHom.comp_apply, hlift, h1, map_one, MonoidHom.one_apply]

-- Test LanglandsDual.galoisAction_unitary
/- Quasi-split unitary group: the absolute datum of `GL_n` with an element `γ` acting on
`X^* = ℤⁿ` by `(a_k) ↦ (-a_{n+1-k})`. It acts on `Ĝ(R) ≅ GL_n(R)` by `g ↦ J (gᵀ)⁻¹ J⁻¹` with
`J` antidiagonal with alternating signs `1, -1, 1, …` from the top row. -/
example (D : AbsoluteRootData K H) (n : ℕ) (eX : D.X ≃+ (Fin n → ℤ)) (eY : D.Y ≃+ (Fin n → ℤ))
    (eι : D.ι ≃ {p : Fin n × Fin n // p.1 ≠ p.2})
    (hroot : ∀ i, eX (D.Ψ.root i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hcoroot : ∀ i, eY (D.Ψ.coroot i) = Pi.single (eι i).1.1 1 - Pi.single (eι i).1.2 1)
    (hpair : ∀ x y, D.Ψ.toLinearMap x y = dotProduct (eX x) (eY y))
    (γ : Field.absoluteGaloisGroup K)
    (hγ : ∀ x k, eX ((D.galoisAction γ).weightEquiv x) k = -eX x (Fin.rev k))
    (R : Type) [CommRing R] :
    ∃ e : WithConv (dualGroup D →ₐ[ℤ] R) ≃* Matrix.GeneralLinearGroup (Fin n) R,
      ∀ g, ((e (galoisActionOnPoints D R γ g) : Matrix.GeneralLinearGroup (Fin n) R) :
          Matrix (Fin n) (Fin n) R) =
        Matrix.of (fun k l : Fin n => if (k : ℕ) + l + 1 = n then (-1 : R) ^ (k : ℕ) else 0) *
          Matrix.transpose (((e g)⁻¹ : Matrix.GeneralLinearGroup (Fin n) R) :
            Matrix (Fin n) (Fin n) R) *
          (Matrix.of (fun k l : Fin n => if (k : ℕ) + l + 1 = n then (-1 : R) ^ (k : ℕ) else 0))⁻¹ :=
  sorry

/-- Functoriality in the coefficient ring: composition with `R → R'` on `Ĝ`, the identity on
`Γ_K`. -/
def mapCoeff (D : AbsoluteRootData K H) {R R' : Type} [CommRing R] [CommRing R'] (f : R →+* R') :
    LGroup D R →* LGroup D R' :=
  SemidirectProduct.map (TauCeti.AlgHom.mapValue f.toIntAlgHom) (MonoidHom.id _)
    fun γ => MonoidHom.ext fun g => (galoisActionOnPoints_natural D f γ g).symm

-- Test LanglandsDual.mapCoeff_rightHom
/- `mapCoeff` lies over `Γ_K`. -/
example (D : AbsoluteRootData K H) {R R' : Type} [CommRing R] [CommRing R'] (f : R →+* R') :
    (SemidirectProduct.rightHom).comp (mapCoeff D f) = SemidirectProduct.rightHom :=
  SemidirectProduct.rightHom_comp_map _ _ _

-- Test LanglandsDual.mapCoeff_id
/- The identity of `R` induces the identity of `ᴸG(R)`. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    mapCoeff D (RingHom.id R) = MonoidHom.id (LGroup D R) := by
  ext x <;> rfl

-- Test LanglandsDual.mapCoeff_comp
/- `mapCoeff` is functorial in the coefficient ring. -/
example (D : AbsoluteRootData K H) {R R' R'' : Type} [CommRing R] [CommRing R'] [CommRing R'']
    (f : R →+* R') (g : R' →+* R'') :
    mapCoeff D (g.comp f) = (mapCoeff D g).comp (mapCoeff D f) := by
  ext x <;> rfl

/-- The Weil form `Ĝ(R) ⋊ W` for `W → Γ_K`. -/
abbrev WeilLGroup (D : AbsoluteRootData K H) (R : Type) [CommRing R] {W : Type*} [Group W]
    (w : W →* Field.absoluteGaloisGroup K) : Type _ :=
  WithConv (dualGroup D →ₐ[ℤ] R) ⋊[weilActionOnPoints D R w] W

-- Test LanglandsDual.WeilLGroup_toLGroup
/- The Weil form maps to the Galois form over `w`, injectively when `w` is injective. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] {W : Type*} [Group W]
    (w : W →* Field.absoluteGaloisGroup K) (hw : Function.Injective w) :
    ∃ f : WeilLGroup D R w →* LGroup D R, Function.Injective f ∧
      ∀ x, SemidirectProduct.rightHom (f x) = w (SemidirectProduct.rightHom x) :=
  ⟨SemidirectProduct.map (MonoidHom.id _) w (fun _ => rfl), fun x y hxy => by
    have h1 := congrArg SemidirectProduct.left hxy
    have h2 := congrArg SemidirectProduct.right hxy
    exact SemidirectProduct.ext h1 (hw h2), fun _ => rfl⟩

-- Test LanglandsDual.WeilLGroup_split_prod
/- For `μ_G` trivial the Weil form is a direct product over `W`. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (h : ∀ γ, D.galoisAction γ = 1)
    {W : Type*} [Group W] (w : W →* Field.absoluteGaloisGroup K) :
    ∃ e : WeilLGroup D R w ≃* WithConv (dualGroup D →ₐ[ℤ] R) × W,
      ∀ x, (e x).2 = SemidirectProduct.rightHom x := by
  obtain ⟨lift, hlift⟩ := pinnedLift_exists D R
  have h1 : ∀ x, weilActionOnPoints D R w x = 1 := fun x => by
    have : galoisActionOnPinned D (w x) = 1 :=
      Subtype.ext (by simp [galoisActionOnPinned, dualGaloisAction, h])
    rw [weilActionOnPoints, MonoidHom.comp_apply, hlift, this, map_one]
  refine ⟨(SemidirectProduct.congr (MulEquiv.refl _) (MulEquiv.refl _)
    (φ₂ := (1 : W →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R))))
    fun x => by ext g; simp [h1 x]).trans SemidirectProduct.mulEquivProd, fun x => rfl⟩

-- Test LanglandsDual.WeilLGroup_trivial
/- For a torus `Ĝ(𝔽₂)` is trivial, so the projection of the Weil form onto `W` is an
isomorphism. -/
example (D : AbsoluteRootData K H) [IsEmpty D.ι] {W : Type*} [Group W]
    (w : W →* Field.absoluteGaloisGroup K) :
    Function.Bijective (SemidirectProduct.rightHom : WeilLGroup D (ZMod 2) w →* W) := by
  obtain ⟨e⟩ := dualGroup_torus_points D (ZMod 2)
  have : Subsingleton (Multiplicative D.Y →* (ZMod 2)ˣ) :=
    ⟨fun _ _ => MonoidHom.ext fun _ => Subsingleton.elim _ _⟩
  have : Subsingleton (WithConv (dualGroup D →ₐ[ℤ] ZMod 2)) := e.injective.subsingleton
  exact ⟨fun x y hxy => SemidirectProduct.ext (Subsingleton.elim _ _) hxy,
    SemidirectProduct.rightHom_surjective⟩

-- Test LanglandsDual.LGroup_split_prod
/- For `μ_G` trivial (an inner form of a split group) the L-group is a direct product over
`Γ_K`. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] (h : ∀ γ, D.galoisAction γ = 1) :
    ∃ e : LGroup D R ≃* WithConv (dualGroup D →ₐ[ℤ] R) × Field.absoluteGaloisGroup K,
      ∀ x, (e x).2 = SemidirectProduct.rightHom x := by
  obtain ⟨lift, hlift⟩ := pinnedLift_exists D R
  have h1 : ∀ γ, galoisActionOnPoints D R γ = 1 := fun γ => by
    have : galoisActionOnPinned D γ = 1 :=
      Subtype.ext (by simp [galoisActionOnPinned, dualGaloisAction, h])
    rw [hlift, this, map_one]
  refine ⟨(SemidirectProduct.congr (MulEquiv.refl _) (MulEquiv.refl _)
    (φ₂ := (1 : Field.absoluteGaloisGroup K →* MulAut (WithConv (dualGroup D →ₐ[ℤ] R))))
    fun γ => by ext x; simp [h1 γ]).trans SemidirectProduct.mulEquivProd, fun x => rfl⟩

-- Test LanglandsDual.LGroup_trivial
/- For a torus `Ĝ(𝔽₂)` is trivial, so the projection `ᴸG(𝔽₂) → Γ_K` is an isomorphism. -/
example (D : AbsoluteRootData K H) [IsEmpty D.ι] :
    Function.Bijective
      (SemidirectProduct.rightHom : LGroup D (ZMod 2) →* Field.absoluteGaloisGroup K) := by
  obtain ⟨e⟩ := dualGroup_torus_points D (ZMod 2)
  have : Subsingleton (Multiplicative D.Y →* (ZMod 2)ˣ) :=
    ⟨fun _ _ => MonoidHom.ext fun _ => Subsingleton.elim _ _⟩
  have : Subsingleton (WithConv (dualGroup D →ₐ[ℤ] ZMod 2)) := e.injective.subsingleton
  exact ⟨fun x y hxy => SemidirectProduct.ext (Subsingleton.elim _ _) hxy,
    SemidirectProduct.rightHom_surjective⟩

-- Test LanglandsDual.LGroup_not_direct_product (non-example)
/- If `μ_G(γ) ≠ 1` (for instance a quasi-split unitary group), then over an infinite field the
section `γ ↦ (1, γ)` does not commute with `Ĝ(R)`, so `ᴸG(R)` is not the direct product. -/
example (D : AbsoluteRootData K H) (R : Type) [Field R] [Infinite R]
    (γ : Field.absoluteGaloisGroup K) (hγ : D.galoisAction γ ≠ 1) :
    ∃ g : WithConv (dualGroup D →ₐ[ℤ] R),
      (SemidirectProduct.inr γ : LGroup D R) * SemidirectProduct.inl g ≠
        SemidirectProduct.inl g * SemidirectProduct.inr γ := by
  obtain ⟨lift, hinj, hlift⟩ := pinnedLift_injective D R
  have hne : galoisActionOnPoints D R γ ≠ 1 := by
    rw [hlift]
    intro h1
    apply hγ
    have h3 : galoisActionOnPinned D γ = 1 := hinj (by rw [h1, map_one])
    have h4 : autFlip D (D.galoisAction γ) = autFlip D 1 := by
      rw [map_one]
      exact congrArg Subtype.val h3
    exact (autFlip D).injective h4
  obtain ⟨g, hg⟩ : ∃ g, galoisActionOnPoints D R γ g ≠ g := by
    by_contra hcon
    push Not at hcon
    exact hne (MulEquiv.ext hcon)
  refine ⟨g, fun hc => hg ?_⟩
  simpa using congrArg SemidirectProduct.left hc

/-- Independence of choices: the L-groups of two absolute root data for the same group are
isomorphic over `Γ_K`. -/
theorem changeOfPinning (D D' : AbsoluteRootData K H)
    (e : RootPairing.Equiv D.Ψ D'.Ψ)
    (hb : ∀ i, i ∈ D.base.support ↔ e.indexEquiv i ∈ D'.base.support)
    (hγ : ∀ γ, e.comp (D.galoisAction γ) = (D'.galoisAction γ).comp e)
    (R : Type) [CommRing R] :
    ∃ e : LGroup D R ≃* LGroup D' R, ∀ x, SemidirectProduct.rightHom (e x) = SemidirectProduct.rightHom x := sorry

/-- The centre of `Ĝ(R)` for an algebraically closed field `R` is `Hom(π₁(G), R^×)`. -/
theorem dualCentreMulEquiv (D : AbsoluteRootData K H) (R : Type) [Field R] [IsAlgClosed R] :
    Nonempty (Subgroup.center (WithConv (dualGroup D →ₐ[ℤ] R)) ≃*
      (Multiplicative (AlgebraicFundamentalGroup D) →* Rˣ)) := sorry

-- Test LanglandsDual.dualGroup_not_self (non-example)
/- For `π₁(G) ≅ ℤ/2` (for instance `PGL₂`, whose dual is `SL₂`) the centre of `Ĝ(ℂ)` has two
elements, whereas `PGL₂(ℂ)` has trivial centre: the Chevalley group of `Ψ` itself is not `Ĝ`. -/
example (D : AbsoluteRootData K H) (e : AlgebraicFundamentalGroup D ≃+ ZMod 2) :
    Nat.card (Subgroup.center (WithConv (dualGroup D →ₐ[ℤ] ℂ))) = 2 := sorry

/-- The dual Levi subgroup attached to a Galois-stable subset `Δ_M` of simple roots: the subgroup
generated by `T̂(R)` and the root subgroups of the coroots in the span of `Δ_M^∨`. -/
def leviDual (D : AbsoluteRootData K H) (R : Type) [CommRing R] (ΔM : Set D.ι) :
    Subgroup (WithConv (dualGroup D →ₐ[ℤ] R)) :=
  (dualTorusInclusion D R).range ⊔
    ⨆ (i : D.ι) (_ : D.Ψ.coroot i ∈ Submodule.span ℤ (D.Ψ.coroot '' ΔM)), (dualRootSubgroup D R i).range

/-- `ᴸM(R) = M̂(R) ⋊ Γ_K` inside `ᴸG(R)`. -/
def LLevi (D : AbsoluteRootData K H) (R : Type) [Field R] (ΔM : Set D.ι)
    (_hbase : ΔM ⊆ (D.base.support : Set D.ι))
    (_hstable : ∀ γ i, i ∈ ΔM ↔ (D.galoisAction γ).indexEquiv i ∈ ΔM) :
    Subgroup (LGroup D R) :=
  (leviDual D R ΔM).map (SemidirectProduct.inl) ⊔ (SemidirectProduct.inr).range

-- Test LanglandsDual.leviDual_full_base
/- Over a field, `Ĝ(R)` is generated by `T̂(R)` and the root groups, and every coroot lies in the
integral span of the simple coroots. -/
example (D : AbsoluteRootData K H) (R : Type) [Field R] :
    leviDual D R (D.base.support : Set D.ι) = ⊤ := sorry

-- Test LanglandsDual.leviDual_empty
/- No coroot is `0`, so the empty set contributes no root group. -/
example (D : AbsoluteRootData K H) (R : Type) [CommRing R] :
    leviDual D R ∅ = (dualTorusInclusion D R).range := by
  have h : ∀ i : D.ι, D.Ψ.coroot i ≠ 0 := by
    intro i hi
    have h2 := D.Ψ.root_coroot_two i
    rw [hi, map_zero] at h2
    exact absurd h2 (by norm_num)
  simp [leviDual, h]

-- Test LanglandsDual.leviDual_ne_top (non-example)
/- With at least one root, the dual torus alone is a proper subgroup of `Ĝ(ℚ)`. -/
example (D : AbsoluteRootData K H) [Nonempty D.ι] : leviDual D ℚ ∅ ≠ ⊤ := sorry

-- Test LanglandsDual.LLevi_unstable_rejected
example (D : AbsoluteRootData K H) (ΔM : Set D.ι) (γ : Field.absoluteGaloisGroup K)
    (i : D.ι) (hi : i ∈ ΔM) (hout : (D.galoisAction γ).indexEquiv i ∉ ΔM) :
    ¬ (∀ γ i, i ∈ ΔM ↔ (D.galoisAction γ).indexEquiv i ∈ ΔM) :=
  fun h => hout ((h γ i).mp hi)

-- Test LanglandsDual.LLevi_empty
example (D : AbsoluteRootData K H) (R : Type) [Field R] :
    LLevi D R ∅ (by simp) (by simp) =
      ((dualTorusInclusion D R).range.map SemidirectProduct.inl ⊔
        SemidirectProduct.inr.range) := by
  have h : ∀ i : D.ι, D.Ψ.coroot i ≠ 0 := by
    intro i hi
    have h2 := D.Ψ.root_coroot_two i
    rw [hi, map_zero] at h2
    exact absurd h2 (by norm_num)
  simp [LLevi, leviDual, h]

-- Test LanglandsDual.LLevi_full_base
example (D : AbsoluteRootData K H) (R : Type) [Field R] :
    LLevi D R (D.base.support : Set D.ι) (fun _ h => h) D.galoisAction_base = ⊤ := sorry

-- Test LanglandsDual.LLevi_comap_inl
/- With the stability hypothesis, the elements of `ᴸM(R)` lying in `Ĝ(R)` are exactly `M̂(R)`,
so `ᴸM(R) = M̂(R) ⋊ Γ_K`: the Galois action preserves `M̂(R)`. -/
example (D : AbsoluteRootData K H) (R : Type) [Field R] (ΔM : Set D.ι)
    (hbase : ΔM ⊆ (D.base.support : Set D.ι))
    (hstable : ∀ γ i, i ∈ ΔM ↔ (D.galoisAction γ).indexEquiv i ∈ ΔM) :
    (LLevi D R ΔM hbase hstable).comap SemidirectProduct.inl = leviDual D R ΔM := sorry

/-- Products: the dual of a product is the product of the duals, compatibly with the Galois
actions. The root datum `DP` of the product is given as data with the identifications of its
lattices and (co)roots with those of the factors (an index bijection alone would not determine
it). -/
theorem dualGroup_prod {H' : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K} (D : AbsoluteRootData K H)
    (D' : AbsoluteRootData K H') (HP : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
    (hprod : HP.obj ≅ CommHopfAlgCat.of K ((H : Type u) ⊗[K] (H' : Type u)))
    (DP : AbsoluteRootData K HP) (e : DP.ι ≃ D.ι ⊕ D'.ι)
    (eX : DP.X ≃+ D.X × D'.X) (eY : DP.Y ≃+ D.Y × D'.Y)
    (hroot : ∀ i, eX (DP.Ψ.root i) = Sum.elim (fun j => (D.Ψ.root j, 0))
      (fun j => (0, D'.Ψ.root j)) (e i))
    (hcoroot : ∀ i, eY (DP.Ψ.coroot i) = Sum.elim (fun j => (D.Ψ.coroot j, 0))
      (fun j => (0, D'.Ψ.coroot j)) (e i))
    (hpair : ∀ x y, DP.Ψ.toLinearMap x y =
      D.Ψ.toLinearMap (eX x).1 (eY y).1 + D'.Ψ.toLinearMap (eX x).2 (eY y).2)
    (hbase : ∀ i, i ∈ DP.base.support ↔
      Sum.elim (fun j => j ∈ D.base.support) (fun j => j ∈ D'.base.support) (e i))
    (hgalois : ∀ γ x, eX ((DP.galoisAction γ).weightEquiv x) =
      ((D.galoisAction γ).weightEquiv (eX x).1, (D'.galoisAction γ).weightEquiv (eX x).2))
    (R : Type) [CommRing R] :
    ∃ eG : WithConv (dualGroup DP →ₐ[ℤ] R) ≃*
        WithConv (dualGroup D →ₐ[ℤ] R) × WithConv (dualGroup D' →ₐ[ℤ] R),
      ∀ γ g, eG (galoisActionOnPoints DP R γ g) =
        (galoisActionOnPoints D R γ (eG g).1, galoisActionOnPoints D' R γ (eG g).2) := sorry

end LanglandsDual

/-! ### Concrete rank-one and ramified controls -/

namespace GLBuilding
open BruhatTits ValuativeRel

-- Test GroupScheme.GL2_standard_parahoric
example {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    Nonempty (parahoricGroupScheme (standardData (K := K) 2) (standardValuation 2)
      {⟨standardValuation 2, 0, by intro i u; simp⟩} ≅
      (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra 𝒪[K] 2).obj) := sorry

-- Test GroupScheme.GL2_standard_parahoric_points
/- The parahoric subgroup of the standard vertex is `GL₂(𝒪)`: the entries of `g` and of `g⁻¹`
are integral. -/
example {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K]
    [IsNonarchimedeanLocalField K] :
    ∀ g, g ∈ parahoricSubgroup (standardData (K := K) 2) (standardValuation 2)
      {⟨standardValuation 2, 0, by intro i u; simp⟩} ↔
      ∀ i j, (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) 2 g).1 i j ∈ 𝒪[K] ∧
        (TauCeti.GeneralLinear.pointsMulEquiv (R := K) (A := K) 2 g)⁻¹.1 i j ∈ 𝒪[K] := sorry

end GLBuilding

namespace SLTwo
open BruhatTits ValuativeRel
variable (p : ℕ) [Fact p.Prime]

/-- The diagonal maximal split torus in the pinned SL₂ over Q_p. -/
def standardData : LocalRootData ℚ_[p] (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra ℚ_[p] 2) := sorry

theorem standardData_torus (R : Type) [CommRing R] [Algebra ℚ_[p] R]
    (g : WithConv (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra ℚ_[p] 2 →ₐ[ℚ_[p]] R)) :
    g ∈ subgroupPoints (standardData p).splitTorus R ↔
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ_[p] 2 (A := R) g).val 0 1 = 0 ∧
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ_[p] 2 (A := R) g).val 1 0 = 0 := sorry

/-- False indexes the upper root, true the lower root. -/
def roots : (standardData p).ι ≃ Bool := sorry

def coordinates : (standardData p).V ≃ₗ[ℝ] ℝ := sorry

theorem root_formula (a : (standardData p).ι) (v : (standardData p).V) :
    (standardData p).Φ.root a v = (if roots p a then -2 else 2) * coordinates p v := sorry

theorem root_group (a : (standardData p).ι)
    (g : WithConv (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra ℚ_[p] 2 →ₐ[ℚ_[p]] ℚ_[p])) :
    g ∈ (standardData p).rootDatum.U a ↔ ∃ c : ℚ_[p],
      (TauCeti.SpecialLinear.pointsMulEquiv ℚ_[p] 2 (A := ℚ_[p]) g).val =
        if roots p a then !![1, 0; c, 1] else !![1, c; 0, 1] := sorry

def valuation : Valuation (standardData p).rootDatum := sorry

theorem valuation_apply (a : (standardData p).ι) (g : (standardData p).rootDatum.U a) :
    (valuation p).φ a g = GLBuilding.ω ℚ_[p]
      (if roots p a then (TauCeti.SpecialLinear.pointsMulEquiv ℚ_[p] 2 (A := ℚ_[p]) g.val).val 1 0
        else (TauCeti.SpecialLinear.pointsMulEquiv ℚ_[p] 2 (A := ℚ_[p]) g.val).val 0 1) := sorry

instance geometric : GeometricValuation (standardData p) (valuation p) := by sorry

/-- In dimension two Sp is SL₂; the self-dual norm model identifies with its building. -/
def symplecticNormEquiv : Building (standardData p) (valuation p) ≃
    GLBuilding.SymplecticNormBuilding (GLBuilding.planeForm (K := ℚ_[p]))
      GLBuilding.planeForm_nondegenerate := sorry

/-- The apartment coordinate a corresponds to the weights (a,−a). -/
theorem symplecticNormEquiv_apartment (x : Apartment (valuation p)) :
    (symplecticNormEquiv p (apartmentEmbedding _ _ x)).val =
      GLBuilding.planeNorm (coordinates p x.displacement) := sorry

-- Test symplecticNormEquiv_weighted_tenth
example : ∃ x : Building (standardData p) (valuation p),
    (symplecticNormEquiv p x).val = GLBuilding.planeNorm (1 / 10) := by
  exact ⟨(symplecticNormEquiv p).symm ⟨_, GLBuilding.planeNorm_selfDual _⟩,
    congrArg Subtype.val ((symplecticNormEquiv p).apply_symm_apply _)⟩

-- Test symplecticNormEquiv_generic_interior
example (a : ℝ) (_ha : 0 < a) (_ha' : a < 1 / 2) :
    ∃ x : Building (standardData p) (valuation p),
      (symplecticNormEquiv p x).val = GLBuilding.planeNorm a := by
  exact ⟨(symplecticNormEquiv p).symm ⟨_, GLBuilding.planeNorm_selfDual _⟩,
    congrArg Subtype.val ((symplecticNormEquiv p).apply_symm_apply _)⟩

-- Test SLTwo.roots_and_rank
example : Nat.card (standardData p).ι = 2 ∧ Module.finrank ℝ (standardData p).V = 1 := sorry

-- Test SLTwo.valuation_two_terms
example : GLBuilding.ω ℚ_[p] (p : ℚ_[p]) = 1 ∧
    GLBuilding.ω ℚ_[p] ((p : ℚ_[p]) ^ 2) = 2 := sorry

-- Test SLTwo.root_coroot_pairing
/- `⟨a, a^∨⟩ = 2` holds in every root pairing (`RootPairing.root_coroot_two`); combined with
`root_formula` it computes the coroot coordinates below. -/
example (a : (standardData p).ι) :
    (standardData p).Φ.root a ((standardData p).Φ.coroot a) = 2 :=
  ((standardData p).pairing_eq _ _).symm.trans ((standardData p).Φ.root_coroot_two a)

-- Test SLTwo.coroot_coordinates
/- The coroot of the upper root is the cocharacter `t ↦ diag(t, t⁻¹)`, of coordinate `1`; the
coroot of the lower root has coordinate `-1`. -/
example (a : (standardData p).ι) :
    coordinates p ((standardData p).Φ.coroot a) = if roots p a then -1 else 1 := by
  have h := root_formula p a ((standardData p).Φ.coroot a)
  rw [← (standardData p).pairing_eq, (standardData p).Φ.root_coroot_two] at h
  split_ifs at h ⊢ <;> linarith

-- Test SLTwo.roots_opposite
/- The lower root is the negative of the upper root, as functionals on the coordinate line. -/
example : (standardData p).Φ.root ((roots p).symm true) =
    -(standardData p).Φ.root ((roots p).symm false) := by
  ext v
  simp [root_formula]

-- Test SLTwo.root_values
/- At the point of coordinate `1` (the cocharacter `t ↦ diag(t, t⁻¹)`) the upper root takes the
value `2` and the lower root the value `-2`. -/
example : (standardData p).Φ.root ((roots p).symm false) ((coordinates p).symm 1) = 2 ∧
    (standardData p).Φ.root ((roots p).symm true) ((coordinates p).symm 1) = -2 := by
  simp [root_formula]

-- Test SLTwo.coordinates_reflection
/- The reflection of either root acts on the apartment coordinate by `c ↦ -c`. -/
example (a : (standardData p).ι) (v : (standardData p).V) :
    coordinates p ((standardData p).Φ.coreflection a v) = -coordinates p v := by
  have hc := root_formula p a ((standardData p).Φ.coroot a)
  rw [← (standardData p).pairing_eq, (standardData p).Φ.root_coroot_two] at hc
  have hv := root_formula p a v
  rw [← (standardData p).pairing_eq] at hv
  rw [RootPairing.coreflection_apply, map_sub, map_smul, RootPairing.root', hv, smul_eq_mul]
  split_ifs at hc ⊢
  · rw [show coordinates p ((standardData p).Φ.coroot a) = -1 by linarith]
    ring
  · rw [show coordinates p ((standardData p).Φ.coroot a) = 1 by linarith]
    ring

-- Test SLTwo.valuation_root_entries
/- The upper root-group element with entry `p` has value `1`, the lower one with entry `p²` has
value `2`. -/
example (a b : (standardData p).ι) (ha : roots p a = false) (hb : roots p b = true)
    (g : (standardData p).rootDatum.U a) (h : (standardData p).rootDatum.U b)
    (hg : (TauCeti.SpecialLinear.pointsMulEquiv ℚ_[p] 2 (A := ℚ_[p]) g.val).val 0 1 = p)
    (hh : (TauCeti.SpecialLinear.pointsMulEquiv ℚ_[p] 2 (A := ℚ_[p]) h.val).val 1 0 = p ^ 2) :
    (valuation p).φ a g = 1 ∧ (valuation p).φ b h = 2 := sorry

-- Test SLTwo.standard_parahoric
example : Nonempty (BruhatTits.parahoricGroupScheme (standardData p) (valuation p)
    {⟨valuation p, 0, by intro i u; simp⟩} ≅ (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra 𝒪[ℚ_[p]] 2).obj) := sorry

-- Test SLTwo.fixer_connected
/- At the standard vertex the fixer scheme is already connected: the Hopf map dual to the
inclusion of its identity component is an isomorphism. -/
example : CategoryTheory.IsIso (BruhatTits.GroupScheme.toParahoric (standardData p) (valuation p)
    {⟨valuation p, 0, by intro i u; simp⟩}) := sorry

-- Test ZExtension.SL2_identity
example : ZExtension.IsZExtension (BialgHom.id ℚ_[p]
    (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra ℚ_[p] 2 : Type)) := sorry

-- Test Frobenius.SL2_base_torus_exists
example : ∃ A : UnramifiedApartmentData
    (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra ℚ_[p] 2),
    A.torusIdeal = (standardData p).splitTorus := sorry

end SLTwo

namespace NormTorus
open BruhatTits ValuativeRel
variable {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2)

/-- The valuation of the relative root datum of the quadratic norm-one torus. The torus is
anisotropic, so there are no relative roots and the valuation is the empty family; it does not
depend on the valuation of `K`. -/
def quadraticValuation : Valuation (quadraticData K L hd).rootDatum := sorry

/-- Compatibility with the field valuation; the discreteness, nontriviality and rank-one fields come
from `ModelField K`. -/
instance quadraticGeometric :
    GeometricValuation (quadraticData K L hd) (quadraticValuation L hd) :=
  { compatible := sorry }

-- Test NormTorus.quadratic_building_point
example : Subsingleton (Building (quadraticData K L hd) (quadraticValuation L hd)) := sorry

-- Test NormTorus.quadratic_torus_translation
example (z : (quadraticData K L hd).rootDatum.T) :
    torusValuationMap (quadraticData K L hd) z = 1 := sorry

-- Test NormTorus.ramified_connected_index
/- For `L = K(a)` with `a² = ϖ`, the Kottwitz map sends `T(K)` onto `X_*(T)_I = ℤ/2`: the
norm-one element `-1 = a/σ(a)` has image the class of `ω_L(a) = 1`. So the connected parahoric has
index two in `T(K)` in every residue characteristic (in residue characteristic two `-1` lies in
`1 + 𝔪_L`, and it lies outside the parahoric all the same); no strict henselianity is needed. -/
example (π : Kˣ)
    (hπ : normalizedOrder (K := K) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap K L (π : K))
    (x : Apartment (quadraticValuation L hd)) :
    (parahoricSubgroup (quadraticData K L hd) (quadraticValuation L hd) {x}).index = 2 := sorry

end NormTorus

namespace BruhatTits
open ValuativeRel

-- Test Frobenius.split_GL2
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (A : UnramifiedApartmentData (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra E 2))
    (hA : A.torusIdeal = (GLBuilding.standardData (K := E) 2).splitTorus) :
    frobeniusOnApartment A = AffineEquiv.refl ℝ (Apartment A.valuation) := sorry

-- Test Frobenius.split_SL2
example (p : ℕ) [Fact p.Prime]
    (A : UnramifiedApartmentData (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra ℚ_[p] 2))
    (hA : A.torusIdeal = (SLTwo.standardData p).splitTorus) :
    frobeniusOnApartment A = AffineEquiv.refl ℝ (Apartment A.valuation) := sorry

-- Test Frobenius.ramified_norm_one
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (L : Type u) [Field L] [Algebra E L] [FiniteDimensional E L] [Algebra.IsSeparable E L]
    (hd : Module.finrank E L = 2) (π : Eˣ)
    (hπ : normalizedOrder (K := E) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap E L (π : E))
    (A : UnramifiedApartmentData (NormTorus.coordinateHopf E L)) :
    Subsingleton (Apartment A.valuation) ∧
      frobeniusOnApartment A = AffineEquiv.refl ℝ (Apartment A.valuation) := sorry

end BruhatTits

namespace ZExtension

-- Test ZExtension.GL2_identity
example (K : Type u) [Field K] : IsZExtension
    (BialgHom.id K (TauCeti.GeneralLinear.finiteTypeCoordinateHopfAlgebra K 2 : Type u)) := sorry

-- Test ZExtension.quadratic_norm_resolution
example (K : Type u) [Field K] (L : Type u) [Field L] [Algebra K L]
    [FiniteDimensional K L] [Algebra.IsSeparable K L] (hd : Module.finrank K L = 2) :
    ∃ (Gt : TauCeti.FiniteTypeCommHopfAlgCat.{u, u} K)
      (f : NormTorus.coordinateHopf K L →ₐc[K] Gt), IsZExtension f ∧
      Nonempty (Gt.obj ≅ CommHopfAlgCat.of K (WeilRestriction.ResHopf K L (LaurentPolynomial L))) := sorry

end ZExtension

namespace BruhatTits.Building

-- Test Building.GL2_diagonal_Levi
example {K : Type u} [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K]
    (M : LeviDatum (GLBuilding.standardData (K := K) 2))
    (hM : M.subtorus = (GLBuilding.standardData (K := K) 2).splitTorus) :
    IsEmpty M.data.ι ∧ Module.finrank ℝ M.data.V = 2 := sorry

-- Test Building.SL2_identity_central
example (p : ℕ) [Fact p.Prime] : CentralSurjection
    (𝟙 (TauCeti.SpecialLinear.finiteTypeCoordinateHopfAlgebra ℚ_[p] 2)) := sorry

-- Test Building.norm_one_Levi
example {K : Type u} [Field K] [ValuativeRel K] [ModelField K]
    (L : Type u) [Field L] [Algebra K L] [FiniteDimensional K L] [Algebra.IsSeparable K L]
    (hd : Module.finrank K L = 2) (M : LeviDatum (NormTorus.quadraticData K L hd)) :
    Function.Bijective (leviEmbedding (NormTorus.quadraticData K L hd)
      (NormTorus.quadraticValuation L hd) M) := sorry

end BruhatTits.Building

/-! ## Computed controls

Controls cited by Checks of earlier layers. The first is a negative control for the hypotheses of
the valuation computation `Decomposition.iwahori_unipotent_contract_valuation`; the others are
computations with explicit numbers and matrices. -/

-- Test BruhatTits.Decomposition.iwahori_unipotent_contract_valuation (non-example)
/- Without `ϖ ≠ 0` the conclusion of that computation fails for every valued field: `ϖ = 0` has
value `< 1`, while `0⁻¹ · 0⁻¹ · 1 = 0` has value `≤ 1`. -/
example {K : Type u} [Field K] [ValuativeRel K] :
    ∃ ϖ u : K, ValuativeRel.valuation K u = 1 ∧ ValuativeRel.valuation K ϖ < 1 ∧
      ValuativeRel.valuation K (ϖ⁻¹ * ϖ⁻¹ * u) ≤ 1 :=
  ⟨0, 1, by simp, by simp, by simp⟩

-- Test BruhatTits.Decomposition.conjugation_two_terms
/- Matrix computation over `ℚ` cited by the Checks of RG2.4 (`Decomposition`): conjugation by
`z = diag(2, 1/2)` multiplies the upper unipotent entry by `a(z) = 4`. -/
example : (!![2, 0; 0, 1 / 2] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 1; 0, 1] *
    !![1 / 2, 0; 0, 2] = !![1, 4; 0, 1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]

-- Test BruhatTits.Decomposition.conjugation_two_terms
/- The same computation for `z⁻¹`: the upper unipotent entry is divided by `4`. -/
example : (!![1 / 2, 0; 0, 2] : Matrix (Fin 2) (Fin 2) ℚ) * !![1, 1; 0, 1] *
    !![2, 0; 0, 1 / 2] = !![1, 1 / 4; 0, 1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]

-- Test BruhatTits.Decomposition.nonreduced_modulus_uses_weight_spaces
/- Computation for the `SU₃` modulus Check: multiplicities `2, 1` of the weights `a, 2a` give the
exponent `2·1 + 1·2 = 4` on a cocharacter with `a(λ) = 1`; using `dim U_a = 3` gives `5`. -/
example : (2 * 1 + 1 * 2 : ℤ) = 4 ∧ (3 * 1 + 1 * 2 : ℤ) ≠ 4 := by norm_num

-- Test GSp4.duality_matrix_unimodular
/- The matrix of `i : X^*(T) → X_*(T)` for `GSp₄` in the bases `(e_i)`, `(f_i)` has determinant
`-1`. -/
example : Matrix.det (!![1, 1, 1; 1, 0, 1; 1, 1, 2] : Matrix (Fin 3) (Fin 3) ℤ) = -1 := by
  norm_num [Matrix.det_fin_three]

-- Test GSp4.simple_root_images
/- In coordinates: `i(e₂ - e₁) = -f₂` and `i(e₃ - 2e₂) = f₂ - f₁`. -/
example :
    (Matrix.mulVec (!![1, 1, 1; 1, 0, 1; 1, 1, 2] : Matrix (Fin 3) (Fin 3) ℤ) ![-1, 1, 0] =
      ![0, -1, 0]) ∧
    (Matrix.mulVec (!![1, 1, 1; 1, 0, 1; 1, 1, 2] : Matrix (Fin 3) (Fin 3) ℤ) ![0, -2, 1] =
      ![-1, 1, 0]) := by decide

-- Test GSp4.printed_coroot_has_wrong_sign
/- `⟨e₃ - 2e₂, f₂⟩ = -2`, so `f₂` is not the coroot of `e₃ - 2e₂`. -/
example : dotProduct (![0, -2, 1] : Fin 3 → ℤ) ![0, 1, 0] = -2 := by decide

-- Test LanglandsDual.adjoint_real_point_not_from_sl2
/- The projective class of `diag(-1, 1)` has no determinant-one real representative. -/
example (c : ℝ) : Matrix.det (c • (!![-1, 0; 0, 1] : Matrix (Fin 2) (Fin 2) ℝ)) ≠ 1 := by
  simp only [Matrix.det_fin_two, Matrix.smul_apply, smul_eq_mul]
  change c * (-1) * (c * 1) - c * 0 * (c * 0) ≠ 1
  nlinarith [sq_nonneg c]

-- Test Admissible.displacement_loses_torsion
/- Every additive map `ℤ/2 → ℝ` kills the nonzero class, which the Kottwitz coset retains. -/
example (f : ZMod 2 →+ ℝ) : f 1 = 0 ∧ (1 : ZMod 2) ≠ 0 := by
  have hz : (2 : ℕ) • (1 : ZMod 2) = 0 := by decide
  have h : (2 : ℕ) • f 1 = 0 := by
    rw [← map_nsmul, hz, map_zero]
  constructor
  · simp only [two_nsmul] at h
    linarith
  · decide

end

universe u

noncomputable section
open scoped Pointwise Topology

namespace NormTorus
open scoped PointTopology
open ValuativeRel BruhatTits

/-- Rational points of a quadratic norm-one torus over a local field are compact.
The norm-one equation forces valuation zero; the kernel is closed in the compact unit group. -/
theorem quadratic_isCompact {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (L : Type u) [Field L] [Algebra E L]
    [FiniteDimensional E L] [Algebra.IsSeparable E L] (hd : Module.finrank E L = 2) :
    IsCompact (Set.univ : Set (WithConv (coordinateHopf E L →ₐ[E] E))) := sorry

/-- Both facts needed by the connected-Iwahori character comparison, on the same torus. -/
theorem ramified_compact_parahoric_index {E : Type u} [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E] (L : Type u) [Field L] [Algebra E L]
    [FiniteDimensional E L] [Algebra.IsSeparable E L] (hd : Module.finrank E L = 2)
    (π : Eˣ) (hπ : normalizedOrder (K := E) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap E L (π : E)) (h2 : (2 : 𝓀[E]) ≠ 0)
    (x : Apartment (quadraticValuation L hd)) :
    IsCompact (Set.univ : Set (WithConv (coordinateHopf E L →ₐ[E] E))) ∧
      (parahoricSubgroup (quadraticData E L hd) (quadraticValuation L hd) {x}).index = 2 := by
  exact ⟨quadratic_isCompact L hd,
    (LevelSubgroups.normOneTorus_parahoric_index hd π hπ a ha h2 _ x).2⟩

-- Test ramified_compact_parahoric_index_odd
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (L : Type u) [Field L] [Algebra E L]
    [FiniteDimensional E L] [Algebra.IsSeparable E L] (hd : Module.finrank E L = 2)
    (π : Eˣ) (hπ : normalizedOrder (K := E) π = Multiplicative.ofAdd 1)
    (a : L) (ha : a ^ 2 = algebraMap E L (π : E)) (h2 : (2 : 𝓀[E]) ≠ 0)
    (x : Apartment (quadraticValuation L hd)) :
    IsCompact (Set.univ : Set (WithConv (coordinateHopf E L →ₐ[E] E))) ∧
      (parahoricSubgroup (quadraticData E L hd) (quadraticValuation L hd) {x}).index = 2 :=
  ramified_compact_parahoric_index L hd π hπ a ha h2 x

-- Test cartan_unramified_normOne
example {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (L : Type u) [Field L] [ValuativeRel L]
    [TopologicalSpace L] [IsNonarchimedeanLocalField L] [Algebra E L]
    [ValuativeExtension E L] [TauCeti.IsUnramified E L]
    [FiniteDimensional E L] [Algebra.IsSeparable E L] (hd : Module.finrank E L = 2)
    (x : Apartment (quadraticValuation L hd)) :
    IsCompact (Set.univ : Set (WithConv (coordinateHopf E L →ₐ[E] E))) ∧
      parahoricSubgroup (quadraticData E L hd) (quadraticValuation L hd) {x} = ⊤ ∧
      {n : ℤ | -n = n} = {0} := sorry

end NormTorus

namespace KottwitzCoset
/-- Descent to right cosets requires the subgroup to be killed. -/
def descend {G A : Type*} [Group G] [CommGroup A] (κ : G →* A)
    (K : Subgroup G) (hK : K ≤ κ.ker) : G ⧸ K → A := sorry

theorem descend_mk {G A : Type*} [Group G] [CommGroup A] (κ : G →* A)
    (K : Subgroup G) (hK : K ≤ κ.ker) (g : G) : descend κ K hK (QuotientGroup.mk g) = κ g := sorry

/-- PGL₂ as GL₂ modulo its scalar center. -/
abbrev PGLTwo (E : Type u) [Field E] :=
  Matrix.GeneralLinearGroup (Fin 2) E ⧸ Subgroup.center (Matrix.GeneralLinearGroup (Fin 2) E)

variable {E : Type u} [Field E] [ValuativeRel E] [TopologicalSpace E] [IsNonarchimedeanLocalField E]

/-- Determinant valuation modulo two, independent of a scalar representative. -/
def pglKappa : PGLTwo E →* Multiplicative (ZMod 2) := sorry

theorem pglKappa_mk (g : Matrix.GeneralLinearGroup (Fin 2) E) :
    pglKappa (QuotientGroup.mk g) = Multiplicative.ofAdd
      ((Multiplicative.toAdd (TauCeti.normalizedValuation E (Matrix.GeneralLinearGroup.det g)) : ℤ) : ZMod 2) := sorry

/-- The connected Iwahori is the image of integral matrices with unit determinant and
lower-left entry in the maximal ideal. -/
def connectedIwahori : Subgroup (PGLTwo E) := sorry

theorem connectedIwahori_mem (g : PGLTwo E) :
    g ∈ connectedIwahori ↔ ∃ A : Matrix.GeneralLinearGroup (Fin 2) E,
      QuotientGroup.mk A = g ∧
      (∀ i j, ValuativeRel.valuation E (A.val i j) ≤ 1) ∧
      ValuativeRel.valuation E (A.val 1 0) < 1 ∧
      TauCeti.normalizedValuation E (Matrix.GeneralLinearGroup.det A) = 1 := sorry

/-- The edge reversal normalizes the connected Iwahori. The subgroup it generates
with I has exactly the two I-cosets. -/
theorem fullEdgeFixer_cosets (π : E) (hπ : GLBuilding.ω E π = 1)
    (A : Matrix.GeneralLinearGroup (Fin 2) E) (hA : A.val = !![0, 1; π, 0]) :
    let τ : PGLTwo E := QuotientGroup.mk A
    let K := connectedIwahori ⊔ Subgroup.zpowers τ
    connectedIwahori.map (MulAut.conj τ).toMonoidHom = connectedIwahori ∧
      (K : Set (PGLTwo E)) = ((connectedIwahori (E := E)) : Set (PGLTwo E)) ∪
        {g | ∃ i ∈ connectedIwahori, g = τ * i} := sorry

-- Test kottwitzCoset_connected_iwahori
example : connectedIwahori (E := E) ≤ (pglKappa (E := E)).ker := sorry

-- Test kottwitzCoset_full_edge_fixer
example (π : E) (hπ : GLBuilding.ω E π = 1)
    (A : Matrix.GeneralLinearGroup (Fin 2) E) (hA : A.val = !![0, 1; π, 0]) :
    let τ : PGLTwo E := QuotientGroup.mk A
    let K := connectedIwahori ⊔ Subgroup.zpowers τ
    IsCompact (K : Set (PGLTwo E)) ∧ IsOpen (K : Set (PGLTwo E)) ∧
    τ ^ 2 = 1 ∧ pglKappa τ = Multiplicative.ofAdd (1 : ZMod 2) ∧
      ¬ K ≤ pglKappa.ker ∧
      ¬ ∃ f : PGLTwo E ⧸ K → Multiplicative (ZMod 2),
        ∀ g, f (QuotientGroup.mk g) = pglKappa g := sorry

end KottwitzCoset

end

namespace LocalIntegration
noncomputable section
open scoped PointTopology Valued NNReal

/-- The normalized absolute determinant of the actual adjoint action on the Lie algebra.
The normalized absolute value has residue-cardinality normalization in every characteristic. -/
def adjointModulus (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E] (H : Type u) [CommRing H] [HopfAlgebra E H]
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E H)]
    (g : WithConv (H →ₐ[E] E)) : ℝ≥0 :=
  (TauCeti.normalizedAbsoluteValue E
    (LinearEquiv.det ((Derivation.adjointAction (R := E) (H := H)
      (CommAlgCat.of E E) g).toLinearEquiv) : E) : ℝ≥0)

/-- For a smooth affine group over a nonarchimedean local field, Mathlib's modular
character is the absolute adjoint determinant. Cartier, §4.1, pp. 144–145, with the
right-pushforward convention; the analytic-chart proof works in any characteristic. -/
theorem modularCharacter_eq_adjointModulus (E : Type u) [Field E] [ValuativeRel E]
    [TopologicalSpace E] [IsNonarchimedeanLocalField E]
    (H : Type u) [CommRing H] [HopfAlgebra E H] [Algebra.FiniteType E H]
    [Algebra.Smooth E H] [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E H)]
    (g : WithConv (H →ₐ[E] E)) :
    MeasureTheory.Measure.modularCharacter g = adjointModulus E H g := sorry

-- Test adjointModulus_trivial
example (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E]
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E E)]
    (g : WithConv (E →ₐ[E] E)) : adjointModulus E E g = 1 := sorry

-- Test adjointModulus_gm
example (E : Type u) [Field E] [ValuativeRel E] [TopologicalSpace E]
    [IsNonarchimedeanLocalField E]
    [FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E (LaurentPolynomial E))]
    (g : WithConv (LaurentPolynomial E →ₐ[E] E)) :
    adjointModulus E (LaurentPolynomial E) g = 1 := sorry

-- Test adjointModulus_q3_upper
example (π : (ℚ_[3])ˣ)
    (hπ : TauCeti.normalizedValuation (ℚ_[3]) π = Multiplicative.ofAdd 1) :
    let E := ℚ_[3]
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra E 2
    let X : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv E 2
      (TauCeti.GeneralLinear.coordinateRingMap E 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X}
    letI : I.IsHopfIdeal E := by sorry
    letI : Algebra.FiniteType E (A ⧸ I) := by sorry
    letI : FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E (A ⧸ I)) := by sorry
    let m := Matrix.GeneralLinearGroup.mk'' (!![π.val, 0; 0, 1] : Matrix (Fin 2) (Fin 2) E)
      (by sorry)
    let f : A →ₐ[E] E := WithConv.ofConv
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := E) 2).symm m)
    let g := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    adjointModulus E (A ⧸ I) g = (1 / 3) ∧
      MeasureTheory.Measure.modularCharacter g = (1 / 3) := by sorry

-- Test adjointModulus_q3_opposite
example (π : (ℚ_[3])ˣ)
    (hπ : TauCeti.normalizedValuation (ℚ_[3]) π = Multiplicative.ofAdd 1) :
    let E := ℚ_[3]
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra E 2
    let X : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv E 2
      (TauCeti.GeneralLinear.coordinateRingMap E 2 (MvPolynomial.X (0, 1)))
    let I : Ideal A := Ideal.span {X}
    letI : I.IsHopfIdeal E := by sorry
    letI : Algebra.FiniteType E (A ⧸ I) := by sorry
    letI : FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E (A ⧸ I)) := by sorry
    let m := Matrix.GeneralLinearGroup.mk'' (!![π.val, 0; 0, 1] : Matrix (Fin 2) (Fin 2) E)
      (by sorry)
    let f : A →ₐ[E] E := WithConv.ofConv
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := E) 2).symm m)
    let g := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    adjointModulus E (A ⧸ I) g = 3 ∧
      MeasureTheory.Measure.modularCharacter g = 3 := by sorry

local instance : ValuativeRel (LaurentSeries (ZMod 3)) :=
  .ofValuation (LaurentSeries.valued (ZMod 3)).v

local instance : IsNonarchimedeanLocalField (LaurentSeries (ZMod 3)) := by sorry

-- Test adjointModulus_f3Laurent_upper
example (π : (LaurentSeries (ZMod 3))ˣ)
    (hπ : TauCeti.normalizedValuation (LaurentSeries (ZMod 3)) π = Multiplicative.ofAdd 1) :
    let E := LaurentSeries (ZMod 3)
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra E 2
    let X : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv E 2
      (TauCeti.GeneralLinear.coordinateRingMap E 2 (MvPolynomial.X (1, 0)))
    let I : Ideal A := Ideal.span {X}
    letI : I.IsHopfIdeal E := by sorry
    letI : Algebra.FiniteType E (A ⧸ I) := by sorry
    letI : FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E (A ⧸ I)) := by sorry
    let m := Matrix.GeneralLinearGroup.mk'' (!![π.val, 0; 0, 1] : Matrix (Fin 2) (Fin 2) E)
      (by sorry)
    let f : A →ₐ[E] E := WithConv.ofConv
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := E) 2).symm m)
    let g := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    adjointModulus E (A ⧸ I) g = (1 / 3) ∧
      MeasureTheory.Measure.modularCharacter g = (1 / 3) := by sorry

-- Test adjointModulus_f3Laurent_opposite
example (π : (LaurentSeries (ZMod 3))ˣ)
    (hπ : TauCeti.normalizedValuation (LaurentSeries (ZMod 3)) π = Multiplicative.ofAdd 1) :
    let E := LaurentSeries (ZMod 3)
    let A := TauCeti.GeneralLinear.coordinateHopfAlgebra E 2
    let X : A := TauCeti.GeneralLinear.coordinateHopfAlgebraAlgEquiv E 2
      (TauCeti.GeneralLinear.coordinateRingMap E 2 (MvPolynomial.X (0, 1)))
    let I : Ideal A := Ideal.span {X}
    letI : I.IsHopfIdeal E := by sorry
    letI : Algebra.FiniteType E (A ⧸ I) := by sorry
    letI : FiniteDimensional E (TauCeti.Bialgebra.CotangentSpace E (A ⧸ I)) := by sorry
    let m := Matrix.GeneralLinearGroup.mk'' (!![π.val, 0; 0, 1] : Matrix (Fin 2) (Fin 2) E)
      (by sorry)
    let f : A →ₐ[E] E := WithConv.ofConv
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := E) 2).symm m)
    let g := WithConv.toConv (Ideal.Quotient.liftₐ I f (by sorry))
    adjointModulus E (A ⧸ I) g = 3 ∧
      MeasureTheory.Measure.modularCharacter g = 3 := by sorry

end
end LocalIntegration


#check @WeilRestriction.pointsMulEquiv
#check @WeilRestriction.instHopfAlgebraRes
#check @WeilRestriction.mapHopf

end TauCetiRoadmap.ReductiveGroupsPartII
