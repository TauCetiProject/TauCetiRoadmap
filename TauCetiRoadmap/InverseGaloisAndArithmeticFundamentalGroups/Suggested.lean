import Mathlib
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Order
import TauCeti.Topology.Algebra.Group.Generation
import TauCeti.Topology.Algebra.Group.Profinite.EmbeddingProblem.Basic

/-!
# Inverse Galois theory and arithmetic fundamental groups: representative target signatures

The mathematical roadmap is `README.md`. This file records the light definitions and the theorem
signatures that can be stated against the pinned Mathlib and Tau Ceti; it is not an exhaustive
list of the targets of any layer, and every statement here is a suggested form. Heavy objects of
the roadmap (Galois algebras of schemes beyond fields, local systems, the pro-étale fundamental
group, tame fundamental groups, Hurwitz stacks and admissible covers) are README targets only.

Design choices.
* Specialization of a polynomial `p(T, Y) ∈ K(T)[Y]` at `t ∈ K` evaluates each coefficient with
  Mathlib's `RatFunc.eval`; that evaluation is total, returns `0` at a pole, and is a ring map only
  on rational functions whose reduced denominator does not vanish at `t` (`regularSubring`). The
  ring laws of `specialize` therefore carry regularity hypotheses.
* Branch tuples are functions `Fin r → G`; their product is the ordered product `g₀ g₁ ⋯ g_{r-1}`
  with Mathlib's multiplication, which on permutations is composition from right to left. The
  positive Hurwitz move replaces `(a, b)` by `(a b a⁻¹, a)` and generates a left action of
  `TauCeti.BraidGroup r`.
* The universal marked extension `U(G, c)` is a Mathlib `PresentedGroup`; the Schur multiplier is
  Mathlib's `groupHomology.H2` of the trivial representation `ℤ`.
* A realization of a finite group `G` over `K` is a finite Galois extension with a group
  isomorphism `Gal(L/K) ≃* G`; regular realizations over `K(T)` ask `K` to be algebraically closed
  in the extension field. The inverse Galois problem is a named proposition and is never a
  hypothesis of a theorem.
-/

namespace TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

noncomputable section

open Polynomial

universe u

/-! ## Layer IG.0: Galois algebras, local systems and pro-étale fundamental groups -/

/-
README-only field-specialization signatures using the shared algebra API of
AdicEtaleGeometry A4.2. The supplier declarations are outside the pinned libraries;
these signatures describe their use without a roadmap import.

section GaloisAlgebra

variable (K : Type*) [Field K] (A : Type*) [CommRing A] [Algebra K A]
  (H : Type*) [Group H] [MulSemiringAction H A] [SMulCommClass H K A]

/-- The restriction to `K`-algebras of the Galois map supplied by AdicEtaleGeometry A4.2.
`Algebra.galoisTensorMap_restrictScalars` gives `a ⊗ b ↦ (h ↦ a * h • b)`. -/
abbrev galoisTensorMap : TensorProduct K A A →ₐ[K] (H → A) :=
  (Algebra.galoisTensorMap H K A).restrictScalars K

/-- An `H`-Galois algebra over a field is the finite étale torsor supplied by
AdicEtaleGeometry A4.2; disconnected algebras and arbitrary characteristic are included. -/
abbrev IsGaloisAlgebra [Finite H] := Algebra.IsFiniteEtaleTorsor H K A

/-- The shared field criterion exposes the nonzero finite-étale formulation of a Galois algebra. -/
theorem IsGaloisAlgebra.iff_field [Finite H] :
    IsGaloisAlgebra K A H ↔
      Nontrivial A ∧ Module.Finite K A ∧ Algebra.Etale K A ∧
        Function.Bijective (galoisTensorMap K A H) :=
  Algebra.IsFiniteEtaleTorsor.iff_field H K A

end GaloisAlgebra

/-- A finite Galois field extension `L/K` is a `Gal(L/K)`-Galois algebra. -/
theorem isGaloisAlgebra_of_isGalois (K L : Type*) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] : IsGaloisAlgebra K L (L ≃ₐ[K] L) := sorry

-/

/-! ## Layer IG.1: arithmetic fundamental groups, inertia and specialization

The objects of this layer (tame fundamental quotients, tangential fibres,
specialization maps) are built on the étale fundamental group of a scheme, which is not available
at the pinned libraries; they are README targets only. For characteristic exponent `p`,
local tame inertia uses `TauCeti.PrimeToPTateModule p K`, whose indices satisfy
`n ≠ 0 ∧ Nat.Coprime n p`, equivalently `0 < n ∧ Nat.Coprime n p`.
Thus `p = 1` includes all positive indices. The relative-boundary specialization target
carries `Nat.Coprime (Nat.card G) p` for its finite-group cover assertion. -/

/-! ## Layer IG.2: Hilbert irreducibility and specialization -/

namespace RationalSpecialization

variable {K : Type*} [Field K]

/-- Rational functions regular at `t`: the valuation ring of Tau Ceti's finite place of `K(T)` at
the irreducible polynomial `T − t`. -/
def regularSubring (K : Type*) [Field K] (t : K) : Subring (RatFunc K) :=
  (TauCeti.Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C t)).integers.toSubring

/-- Membership is decided by the reduced denominator (`TauCeti.Place.valuation_ofIrreducible_le_one_iff`
for `q = T − t`). -/
theorem mem_regularSubring (t : K) (f : RatFunc K) :
    f ∈ regularSubring K t ↔ f.denom.eval t ≠ 0 := sorry

/-- Polynomial rational functions are regular at every finite parameter. -/
theorem algebraMap_mem_regularSubring (t : K) (p : K[X]) :
    algebraMap K[X] (RatFunc K) p ∈ regularSubring K t := sorry

/-- Evaluation at `t` as a ring homomorphism on the regular subring. -/
def evalRegular (t : K) : regularSubring K t →+* K where
  toFun f := RatFunc.eval (RingHom.id K) t f.val
  map_zero' := RatFunc.eval_zero _ _
  map_one' := RatFunc.eval_one _ _
  map_add' f g := RatFunc.eval_add (RingHom.id K) t
    (by simpa using (mem_regularSubring t f.val).mp f.property)
    (by simpa using (mem_regularSubring t g.val).mp g.property)
  map_mul' f g := RatFunc.eval_mul (RingHom.id K) t
    (by simpa using (mem_regularSubring t f.val).mp f.property)
    (by simpa using (mem_regularSubring t g.val).mp g.property)

/-- Regular evaluation agrees with polynomial evaluation on polynomial coefficients. -/
theorem evalRegular_polynomial (t : K) (p : K[X]) :
    evalRegular t ⟨algebraMap K[X] (RatFunc K) p, algebraMap_mem_regularSubring t p⟩ =
      p.eval t := sorry

/-- Every scalar is the regular value of a constant rational function. -/
theorem evalRegular_surjective (t : K) : Function.Surjective (evalRegular t) := sorry

/-- Coefficientwise specialization `p(T, Y) ↦ p(t, Y)`, total as a function. -/
def specialize (t : K) (p : (RatFunc K)[X]) : K[X] :=
  p.sum fun n c => monomial n (RatFunc.eval (RingHom.id K) t c)

/-- Specialization evaluates each coefficient, including coefficients with a pole. -/
theorem coeff_specialize (t : K) (p : (RatFunc K)[X]) (n : ℕ) :
    (specialize t p).coeff n = RatFunc.eval (RingHom.id K) t (p.coeff n) := sorry

/-- On regular coefficients, specialization is the polynomial map of the residue homomorphism. -/
theorem specialize_map_regular (t : K) (p : (regularSubring K t)[X]) :
    specialize t (p.map (regularSubring K t).subtype) = p.map (evalRegular t) := sorry

/-- Specialization preserves addition when both polynomials have regular coefficients. -/
theorem specialize_add (t : K) (p q : (RatFunc K)[X])
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0) (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p + q) = specialize t p + specialize t q := sorry

/-- Specialization preserves multiplication when both polynomials have regular coefficients. -/
theorem specialize_mul (t : K) (p q : (RatFunc K)[X])
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0) (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p * q) = specialize t p * specialize t q := sorry

/-- Total specialization fails to preserve products when a coefficient has a pole. -/
theorem specialize_not_multiplicative :
    specialize (0 : ℚ) (C (RatFunc.X : RatFunc ℚ) * C RatFunc.X⁻¹) ≠
      specialize 0 (C RatFunc.X) * specialize 0 (C RatFunc.X⁻¹) := sorry

/-- Product, with repetitions, of the reduced denominators of the nonzero coefficients. -/
def denominatorProduct (p : (RatFunc K)[X]) : K[X] :=
  ∏ n ∈ p.support, (p.coeff n).denom

/-- The finite product of reduced coefficient denominators is nonzero. -/
theorem denominatorProduct_ne_zero (p : (RatFunc K)[X]) : denominatorProduct p ≠ 0 := sorry

/-- Nonvanishing of the denominator product is exactly regularity of every coefficient. -/
theorem denominatorProduct_eval_ne_zero_iff (t : K) (p : (RatFunc K)[X]) :
    (denominatorProduct p).eval t ≠ 0 ↔ ∀ n, (p.coeff n).denom.eval t ≠ 0 := sorry

/-- A nonzero specialized leading coefficient preserves the degree. -/
theorem natDegree_specialize (t : K) (p : (RatFunc K)[X])
    (h : RatFunc.eval (RingHom.id K) t p.leadingCoeff ≠ 0) :
    (specialize t p).natDegree = p.natDegree := sorry

/-- The guard: if `(denominatorProduct p · num(lc p))(t) ≠ 0`, every coefficient is regular at `t`
and the degree is preserved. -/
theorem specialization_guard (t : K) (p : (RatFunc K)[X])
    (h : (denominatorProduct p * p.leadingCoeff.num).eval t ≠ 0) :
    (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧ (specialize t p).natDegree = p.natDegree := sorry

/-- A nonzero polynomial has only finitely many coefficient poles or degree-dropping parameters. -/
theorem finite_bad_specializations (p : (RatFunc K)[X]) (hp : p ≠ 0) :
    {t : K | ¬ ((∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree)}.Finite := sorry

/-- Over an infinite field one can avoid any finite set while keeping all coefficients regular
and all degrees, simultaneously for a finite family. -/
theorem exists_simultaneous_specialization [Infinite K] (s : Finset (RatFunc K)[X])
    (hs : ∀ p ∈ s, p ≠ 0) (a : Finset K) :
    ∃ t : K, t ∉ a ∧ ∀ p ∈ s,
      (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧ (specialize t p).natDegree = p.natDegree := sorry

end RationalSpecialization

open RationalSpecialization in
/-- `K` is Hilbertian: every finite family of irreducible separable polynomials of positive degree
in `K(T)[Y]` has a common specialization at some `t ∈ K` with regular coefficients, the same
degrees, and irreducible values (Layer IG.2, *Hilbert subsets and Hilbertian fields*, polynomial
form on the affine line). -/
def IsHilbertian (K : Type*) [Field K] : Prop :=
  ∀ s : Finset (RatFunc K)[X], (∀ p ∈ s, Irreducible p ∧ p.Separable ∧ 0 < p.natDegree) →
    ∃ t : K, ∀ p ∈ s, (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree ∧ Irreducible (specialize t p)

/-- A rational function field in one indeterminate over any field is Hilbertian
(Fried–Jarden, Theorem 13.4.2); no Hilbertianity assumption on the constant field is needed. -/
theorem isHilbertian_ratFunc (K : Type*) [Field K] : IsHilbertian (RatFunc K) := sorry

/-- A finite extension of a characteristic-zero Hilbertian field is Hilbertian, including
extensions of degree one (Serre, Corollary 3.2.2). -/
theorem IsHilbertian.finite_extension {K L : Type*} [Field K] [Field L] [CharZero K]
    [Algebra K L] [FiniteDimensional K L] (hK : IsHilbertian K) : IsHilbertian L := sorry

/-- Hilbert's irreducibility theorem over number fields (Serre, *Topics in Galois Theory*,
§3.4). -/
theorem isHilbertian_of_numberField (K : Type*) [Field K] [NumberField K] : IsHilbertian K :=
  sorry

open RationalSpecialization in
/-- Hilbert subsets of a Hilbertian field are infinite: for each finite family there are
infinitely many good parameters. -/
theorem IsHilbertian.infinite_good {K : Type*} [Field K] (hK : IsHilbertian K)
    (s : Finset (RatFunc K)[X]) (hs : ∀ p ∈ s, Irreducible p ∧ p.Separable ∧ 0 < p.natDegree) :
    {t : K | ∀ p ∈ s, (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree ∧ Irreducible (specialize t p)}.Infinite :=
  sorry

/-- The algebraically closed field `ℂ` is not Hilbertian. -/
theorem not_isHilbertian_complex : ¬ IsHilbertian ℂ := sorry

open RationalSpecialization in
/-- Hilbert specialization preserves the full polynomial Galois group at infinitely many
parameters, together with coefficient regularity, degree and separability. -/
theorem IsHilbertian.infinite_full_group {K : Type*} [Field K] [CharZero K]
    (hK : IsHilbertian K) (f : (RatFunc K)[X]) (hf : f.Separable) :
    {t : K | (∀ n, (f.coeff n).denom.eval t ≠ 0) ∧
      (specialize t f).natDegree = f.natDegree ∧ (specialize t f).Separable ∧
      Nonempty ((specialize t f).Gal ≃* f.Gal)}.Infinite := sorry

/-- A proper finite extension of an algebraic Galois extension of a characteristic-zero
Hilbertian field is Hilbertian (Weissauer; Fried–Jarden, Theorem 13.9.1(b)). The Galois
extension may be infinite. -/
theorem isHilbertian_of_proper_finite_extension_of_galois
    (K M L : Type*) [Field K] [Field M] [Field L] [CharZero K]
    [Algebra K M] [Algebra M L] [Algebra K L] [IsScalarTower K M L]
    [Algebra.IsAlgebraic K M] [IsGalois K M] [FiniteDimensional M L]
    (hK : IsHilbertian K) (hproper : 1 < Module.finrank M L) : IsHilbertian L := sorry

/-- A characteristic-zero Hilbertian field has arbitrarily large independent families of
square classes; every nonempty subproduct of the chosen representatives is nonsquare. -/
theorem IsHilbertian.exists_independent_square_classes {F : Type*} [Field F] [CharZero F]
    (hF : IsHilbertian F) (r : ℕ) :
    ∃ a : Fin r → F, (∀ i, a i ≠ 0) ∧
      ∀ s : Finset (Fin r), s.Nonempty → ¬ IsSquare (∏ i ∈ s, a i) := sorry

/-- A closed normal subgroup of the absolute Galois group of a field finitely generated over
`ℚ` is trivial if it is topologically finitely generated. -/
theorem normal_subgroup_absoluteGaloisGroup_eq_bot (K : Type*) [Field K] [CharZero K]
    [Algebra.EssFiniteType ℚ K] (N : Subgroup (Field.absoluteGaloisGroup K)) [N.Normal]
    (hclosed : IsClosed (N : Set (Field.absoluteGaloisGroup K)))
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated N) : N = ⊥ := sorry

/-! ## Layer IG.3: branch cycles, rigidity, braid orbits and lifting invariants -/

/-- A branch tuple of length `r` in `G`. -/
abbrev BranchTuple (r : ℕ) (G : Type*) := Fin r → G

namespace BranchTuple

variable {G : Type*} [Group G] {r : ℕ}

/-- The ordered product `t 0 * t 1 * ⋯ * t (r - 1)`. -/
def product (t : BranchTuple r G) : G := (List.ofFn t).prod

/-- The subgroup generated by the entries. -/
def generated (t : BranchTuple r G) : Subgroup G := Subgroup.closure (Set.range t)

end BranchTuple

namespace NielsenClass

variable {G : Type*} [Group G]

/-- Simultaneous conjugation of branch tuples. -/
def innerRelation (r : ℕ) (G : Type*) [Group G] : Setoid (BranchTuple r G) where
  r t t' := ∃ g : G, ∀ i, t' i = g * t i * g⁻¹
  iseqv := {
    refl := fun t => ⟨1, by simp⟩
    symm := by
      rintro t t' ⟨g, h⟩
      exact ⟨g⁻¹, fun i => by rw [h i]; simp [mul_assoc]⟩
    trans := by
      rintro t t' t'' ⟨g, h⟩ ⟨g', h'⟩
      exact ⟨g' * g, fun i => by rw [h' i, h i]; simp [mul_assoc]⟩ }

/-- Inner Nielsen classes: tuples up to simultaneous conjugation in `G`. -/
def inner (r : ℕ) (G : Type*) [Group G] : Type _ := Quotient (innerRelation r G)

/-- Conjugation by the normaliser of a faithful permutation representation, given as an isomorphism
`e : G ≃* P` onto a subgroup `P ≤ S_d`; a representation that is not faithful cannot be supplied. -/
def absoluteRelation {r d : ℕ} (P : Subgroup (Equiv.Perm (Fin d))) (e : G ≃* P) :
    Setoid (BranchTuple r G) where
  r t t' := ∃ s ∈ Subgroup.normalizer (P : Set (Equiv.Perm (Fin d))),
    ∀ i, (e (t' i) : Equiv.Perm (Fin d)) = s * e (t i) * s⁻¹
  iseqv := {
    refl := fun t => ⟨1, Subgroup.one_mem _, by simp⟩
    symm := by
      rintro t t' ⟨g, hg, h⟩
      exact ⟨g⁻¹, Subgroup.inv_mem _ hg, fun i => by rw [h i]; simp [mul_assoc]⟩
    trans := by
      rintro t t' t'' ⟨g, hg, h⟩ ⟨g', hg', h'⟩
      exact ⟨g' * g, Subgroup.mul_mem _ hg' hg,
        fun i => by rw [h' i, h i]; simp [mul_assoc]⟩ }

/-- Absolute Nielsen classes for a faithful permutation representation `e : G ≃* P ≤ S_d`. -/
def absolute {r d : ℕ} (P : Subgroup (Equiv.Perm (Fin d))) (e : G ≃* P) : Type _ :=
  Quotient (absoluteRelation (r := r) P e)

/-- Simultaneous conjugation preserves product one and generation. -/
theorem inner_preserves {r : ℕ} (t t' : BranchTuple r G) (h : (innerRelation r G) t t') :
    (BranchTuple.product t = 1 ↔ BranchTuple.product t' = 1) ∧
      (BranchTuple.generated t = ⊤ ↔ BranchTuple.generated t' = ⊤) := sorry

/-- Absolute equivalence preserves product one and generation: through the faithful
representation, conjugation by an element of the normaliser is an automorphism of `G`. -/
theorem absolute_preserves {r d : ℕ} (P : Subgroup (Equiv.Perm (Fin d))) (e : G ≃* P)
    (t t' : BranchTuple r G) (h : (absoluteRelation P e) t t') :
    (BranchTuple.product t = 1 ↔ BranchTuple.product t' = 1) ∧
      (BranchTuple.generated t = ⊤ ↔ BranchTuple.generated t' = ⊤) := sorry

-- Inner equivalence in an abelian target keeps distinct tuples distinct.
example {G : Type*} [CommGroup G] {r : ℕ} (t t' : BranchTuple r G) :
    (innerRelation r G) t t' ↔ t = t' := by
  constructor
  · rintro ⟨g, h⟩
    funext i
    simpa [mul_comm, mul_left_comm, mul_assoc] using (h i).symm
  · rintro rfl
    exact ⟨1, by simp⟩

end NielsenClass

namespace HurwitzMove

variable {G : Type*} [Group G] {r : ℕ}

/-- The positive Hurwitz move at position `i`: `(a, b) ↦ (a b a⁻¹, a)`. -/
def apply (i : Fin (r - 1)) (t : BranchTuple r G) : BranchTuple r G :=
  Function.update (Function.update t (TauCeti.BraidGroup.strand i)
      (t (TauCeti.BraidGroup.strand i) * t (TauCeti.BraidGroup.strandSucc i) *
        (t (TauCeti.BraidGroup.strand i))⁻¹))
    (TauCeti.BraidGroup.strandSucc i) (t (TauCeti.BraidGroup.strand i))

/-- The inverse move `(a, b) ↦ (b, b⁻¹ a b)`. -/
def inverse (i : Fin (r - 1)) (t : BranchTuple r G) : BranchTuple r G :=
  Function.update (Function.update t (TauCeti.BraidGroup.strand i)
      (t (TauCeti.BraidGroup.strandSucc i)))
    (TauCeti.BraidGroup.strandSucc i)
    ((t (TauCeti.BraidGroup.strandSucc i))⁻¹ * t (TauCeti.BraidGroup.strand i) *
      t (TauCeti.BraidGroup.strandSucc i))

/-- The inverse Hurwitz move undoes the positive move. -/
theorem inverse_apply (i : Fin (r - 1)) (t : BranchTuple r G) :
    inverse i (apply i t) = t := sorry

/-- The positive Hurwitz move undoes the inverse move. -/
theorem apply_inverse (i : Fin (r - 1)) (t : BranchTuple r G) :
    apply i (inverse i t) = t := sorry

/-- The positive and inverse Hurwitz moves form a permutation of branch tuples. -/
def equiv (i : Fin (r - 1)) : Equiv.Perm (BranchTuple r G) where
  toFun := apply i
  invFun := inverse i
  left_inv := inverse_apply i
  right_inv := apply_inverse i

/-- Hurwitz moves on disjoint adjacent pairs commute. -/
theorem far_commute {i j : Fin (r - 1)}
    (h : (i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i) :
    equiv (G := G) i * equiv j = equiv j * equiv i := sorry

/-- Hurwitz moves on neighbouring adjacent pairs satisfy the braid relation. -/
theorem braid {i j : Fin (r - 1)} (h : (i : ℕ) + 1 = j ∨ (j : ℕ) + 1 = i) :
    equiv (G := G) i * equiv j * equiv i = equiv j * equiv i * equiv j := sorry

end HurwitzMove

namespace HurwitzAction

/-- The Hurwitz action obtained from the pinned Artin braid-group presentation. -/
def action (r : ℕ) (G : Type*) [Group G] :
    TauCeti.BraidGroup r →* Equiv.Perm (BranchTuple r G) :=
  TauCeti.BraidGroup.lift HurwitzMove.equiv
    (fun h => HurwitzMove.far_commute h) (fun h => HurwitzMove.braid h)

/-- Each positive braid generator acts by the corresponding positive Hurwitz move. -/
theorem action_sigma {G : Type*} [Group G] {r : ℕ} (i : Fin (r - 1))
    (t : BranchTuple r G) :
    action r G (TauCeti.BraidGroup.sigma i) t = HurwitzMove.apply i t := sorry

/-- Every braid preserves the ordered product exactly. -/
theorem product_action {G : Type*} [Group G] {r : ℕ} (b : TauCeti.BraidGroup r)
    (t : BranchTuple r G) : BranchTuple.product (action r G b t) = BranchTuple.product t := sorry

/-- Every braid preserves the subgroup generated by the tuple exactly. -/
theorem generated_action {G : Type*} [Group G] {r : ℕ} (b : TauCeti.BraidGroup r)
    (t : BranchTuple r G) :
    BranchTuple.generated (action r G b t) = BranchTuple.generated t := sorry

/-- Every braid preserves the multiset of conjugacy classes of the entries. -/
theorem classes_action {G : Type*} [Group G] {r : ℕ} (b : TauCeti.BraidGroup r)
    (t : BranchTuple r G) :
    (↑(List.ofFn fun i => ConjClasses.mk (action r G b t i)) : Multiset (ConjClasses G)) =
      ↑(List.ofFn fun i => ConjClasses.mk (t i)) := sorry

end HurwitzAction

/-- Surjective homomorphisms from the free group of rank `r`. -/
abbrev SurjectiveFreeHom (r : ℕ) (G : Type*) [Group G] :=
  {φ : FreeGroup (Fin r) →* G // Function.Surjective φ}

namespace ExteriorEpi

variable {G : Type*} [Group G]

/-- Equality up to conjugation in the target. -/
def relation (r : ℕ) (G : Type*) [Group G] : Setoid (SurjectiveFreeHom r G) where
  r φ ψ := ∃ g : G, ∀ x, ψ.val x = g * φ.val x * g⁻¹
  iseqv := {
    refl := fun t => ⟨1, by simp⟩
    symm := by
      rintro t t' ⟨g, h⟩
      exact ⟨g⁻¹, fun x => by rw [h x]; simp [mul_assoc]⟩
    trans := by
      rintro t t' t'' ⟨g, h⟩ ⟨g', h'⟩
      exact ⟨g' * g, fun x => by rw [h' x, h x]; simp [mul_assoc]⟩ }

end ExteriorEpi

/-- Exterior epimorphisms `F_r ↠ G` modulo `Inn(G)`. -/
abbrev ExteriorEpi (r : ℕ) (G : Type*) [Group G] := Quotient (ExteriorEpi.relation r G)

/-- Equality up to an automorphism of the free group and an automorphism of the target: the orbit
relation of `Aut(F_r) × Aut(G)` acting by `(α, β) · φ = β ∘ φ ∘ α⁻¹`. -/
def TSystem.relation (r : ℕ) (G : Type*) [Group G] : Setoid (SurjectiveFreeHom r G) where
  r φ ψ := ∃ (α : MulAut (FreeGroup (Fin r))) (β : MulAut G), ∀ x, ψ.val x = β (φ.val (α x))
  iseqv := {
    refl := fun _ => ⟨MulEquiv.refl _, MulEquiv.refl G, fun _ => rfl⟩
    symm := by
      rintro φ ψ ⟨α, β, h⟩
      exact ⟨α.symm, β.symm, fun x => by rw [h (α.symm x)]; simp⟩
    trans := by
      rintro φ ψ θ ⟨α, β, h⟩ ⟨α', β', h'⟩
      exact ⟨α'.trans α, β.trans β', fun x => by rw [h' x, h (α' x)]; rfl⟩ }

/-- `T_r`-systems: surjections `F_r ↠ G` modulo `Aut(F_r) × Aut(G)`, equivalently the
`Out(F_r)`-orbits on `Epi(F_r, G)/Aut(G)`. -/
abbrev TSystem (r : ℕ) (G : Type*) [Group G] := Quotient (TSystem.relation r G)

/-- The quotient of exterior epimorphisms onto `T`-systems, dividing further by `Out(F_r)` and by
the outer automorphisms of `G`. -/
def TSystem.quotient (r : ℕ) (G : Type*) [Group G] : ExteriorEpi r G → TSystem r G :=
  Quotient.map' id fun φ ψ h => by
    obtain ⟨g, hg⟩ := h
    exact ⟨MulEquiv.refl _, MulAut.conj g, fun x => by simpa [MulAut.conj_apply] using hg x⟩

/-- `d(G)` is Mathlib's `Group.rank`: a surjection `F_r ↠ G` exists exactly when `r ≥ d(G)`. -/
theorem nonempty_surjectiveFreeHom_iff (G : Type*) [Group G] [Group.FG G] (r : ℕ) :
    Nonempty (SurjectiveFreeHom r G) ↔ Group.rank G ≤ r := sorry

/-- Generating tuples correspond to surjections from the free group, with the prescribed images
of free generators. -/
theorem ExteriorEpi.exists_tuple_equiv (r : ℕ) (G : Type*) [Group G] :
    ∃ e : {t : BranchTuple r G // BranchTuple.generated t = ⊤} ≃ SurjectiveFreeHom r G,
      ∀ t i, (e t).val (FreeGroup.of i) = t.val i := sorry

/-- The Nielsen transitivity conjecture (Garion; recorded by Chen, *Nonabelian level structures*,
Conjecture 1.1.3), a named open statement: for every finite `G` and `r ≥ d(G) + 1`, any two
surjections `F_r ↠ G` differ by an automorphism of `F_r` and conjugation in `G`. Wiegold's
conjecture is its case of nonabelian finite simple groups. No theorem of the roadmap assumes it. -/
def NielsenTransitivity : Prop :=
  ∀ (G : Type) [Group G] [Finite G] (r : ℕ), Group.rank G + 1 ≤ r →
    ∀ φ ψ : SurjectiveFreeHom r G, ∃ (α : MulAut (FreeGroup (Fin r))) (g : G),
      ∀ x, ψ.val x = g * φ.val (α x) * g⁻¹

section Rigidity

variable {G : Type*} [Group G]

/-- A conjugacy class in a finite group is rational if every power prime to `|G|` preserves it. -/
def IsRationalClass [Finite G] (C : ConjClasses G) : Prop :=
  ∀ m : ℕ, Nat.Coprime m (Nat.card G) → ∀ x ∈ C.carrier, x ^ m ∈ C.carrier

/-- A tuple of classes is rigid if the generating product-one tuples with entries in the classes
form exactly one orbit under simultaneous conjugation. -/
def IsRigid {r : ℕ} (C : Fin r → ConjClasses G) : Prop :=
  (∃ t : BranchTuple r G, (∀ i, t i ∈ (C i).carrier) ∧ BranchTuple.product t = 1 ∧
      BranchTuple.generated t = ⊤) ∧
    ∀ t t' : BranchTuple r G,
      (∀ i, t i ∈ (C i).carrier) → BranchTuple.product t = 1 → BranchTuple.generated t = ⊤ →
      (∀ i, t' i ∈ (C i).carrier) → BranchTuple.product t' = 1 →
      BranchTuple.generated t' = ⊤ → ∃ g : G, ∀ i, t' i = g * t i * g⁻¹

end Rigidity

/-- `G` is the Galois group of a regular extension of `K(T)`: a finite Galois extension `L` of
`K(T)` with group `G` in which `K` is algebraically closed. -/
def HasRegularRealization (K : Type u) [Field K] (G : Type*) [Group G] : Prop :=
  ∃ (L : Type u) (_ : Field L) (_ : Algebra (RatFunc K) L) (_ : Algebra K L)
    (_ : IsScalarTower K (RatFunc K) L),
    FiniteDimensional (RatFunc K) L ∧ IsGalois (RatFunc K) L ∧
      Nonempty ((L ≃ₐ[RatFunc K] L) ≃* G) ∧
      ∀ x : L, IsAlgebraic K x → x ∈ Set.range (algebraMap K L)

/-- Rational rigidity (Serre, *Topics in Galois Theory*, Theorem 8.1.1): a centreless finite group
with a rigid tuple of nontrivial rational classes is the Galois group of a regular extension of
`K(T)` for every field `K` of characteristic zero. -/
theorem hasRegularRealization_of_rigid (K : Type u) [Field K] [CharZero K] (G : Type*) [Group G]
    [Finite G] (hZ : Subgroup.center G = ⊥) {r : ℕ} (C : Fin r → ConjClasses G)
    (hrat : ∀ i, IsRationalClass (C i)) (hne : ∀ i, C i ≠ ConjClasses.mk 1) (hrig : IsRigid C) :
    HasRegularRealization K G := sorry

namespace ReducedSchur

variable {G : Type} [Group G]

/-- Commuting elements give the integral bar cycle `[x|y] − [y|x]` defining their
homological commutator. -/
theorem exists_commutingCycle (x y : G) (h : Commute x y) :
    ∃ z : groupHomology.cycles₂ (Rep.trivial ℤ G ℤ),
      z.val = Finsupp.single (x, y) 1 - Finsupp.single (y, x) 1 := sorry

/-- The commutator of lifts in a central extension is independent of both chosen lifts. -/
theorem lift_commutator_independent {E : Type*} [Group E] (π : E →* G)
    (hcentral : π.ker ≤ Subgroup.center E) (x x' y y' : E)
    (hx : π x = π x') (hy : π y = π y') :
    x * y * x⁻¹ * y⁻¹ = x' * y' * x'⁻¹ * y'⁻¹ := sorry

/-- The relations `[x][y][x]⁻¹ = [x y x⁻¹]` of the universal marked extension. -/
def universalRelations (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    Set (FreeGroup c) :=
  {w | ∃ x y : c, w = FreeGroup.of x * FreeGroup.of y * (FreeGroup.of x)⁻¹ *
    (FreeGroup.of ⟨x.1 * y.1 * x.1⁻¹, hc x.1 y.1 y.2⟩)⁻¹}

/-- The group on the marked generators with the conjugation relations; its projection is a
central extension of `G` when `c` generates `G`. -/
abbrev universalMarked (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :=
  PresentedGroup (universalRelations c hc)

/-- The projection `U(G, c) → G`, `[x] ↦ x`. -/
def universalProjection (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    universalMarked c hc →* G :=
  PresentedGroup.toGroup (f := fun x : c => x.1) (by
    rintro w ⟨x, y, rfl⟩
    simp)

/-- The conjugacy classes meeting `c`, the index set `D = c/G` of the class degree. -/
def classSet (c : Set G) : Set (ConjClasses G) := ConjClasses.mk '' c

/-- The image in `G^{ab}` of a conjugacy class. -/
def classAbelianization (d : ConjClasses G) : Abelianization G :=
  Quotient.liftOn' d (fun x => Abelianization.of x) (fun _ _ h => by
    obtain ⟨u, rfl⟩ := isConj_iff.mp h
    simp)

/-- The class degree map `δ : ℤ^D → G^{ab}`, `e_d ↦` the image of a representative of `d`. -/
def classDegree (c : Set G) : (classSet c →₀ ℤ) →+ Additive (Abelianization G) :=
  Finsupp.liftAddHom fun d => zmultiplesHom _ (Additive.ofMul (classAbelianization d.1))

/-- The kernel of the presentation projection, defined for any conjugacy-invariant `c`.
For finite `G` generated by `c`, its torsion is the reduced Schur multiplier. -/
def universalKernel (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    Subgroup (universalMarked c hc) :=
  (universalProjection c hc).ker

/-- A generating marking set makes the presentation projection surjective. -/
theorem universalProjection_surjective (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c)
    (hgen : Subgroup.closure c = ⊤) : Function.Surjective (universalProjection c hc) := sorry

/-- The kernel of the presentation projection commutes with every marked generator. -/
theorem universalKernel_le_center (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    universalKernel c hc ≤ Subgroup.center (universalMarked c hc) := sorry

/-- The presentation is initial among central extensions with a conjugation-equivariant marking. -/
theorem universal_marked_property (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) (hgen : Subgroup.closure c = ⊤)
    {E : Type*} [Group E] (π : E →* G) (hπ : Function.Surjective π)
    (hcentral : π.ker ≤ Subgroup.center E) (s : c → E) (hs : ∀ x, π (s x) = x.val)
    (hconj : ∀ (e : E) (x : c),
      s ⟨π e * x.val * (π e)⁻¹, hc (π e) x.val x.property⟩ = e * s x * e⁻¹) :
    ∃! φ : universalMarked c hc →* E,
      π.comp φ = universalProjection c hc ∧ ∀ x : c, φ (PresentedGroup.of x) = s x := sorry

/-- The universal marked group has a class degree homomorphism determined by its generators. -/
theorem exists_degree (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    ∃! degree : universalMarked c hc →* Multiplicative (classSet c →₀ ℤ),
      ∀ x : c, degree (PresentedGroup.of x) =
        Multiplicative.ofAdd (Finsupp.single ⟨ConjClasses.mk x.val, ⟨x.val, x.property, rfl⟩⟩ 1) :=
  sorry

/-- The twist `X⟨−1⟩ = Map_B(T, X)` of a `B`-set by a `B`-torsor `T`. In arithmetic applications
`T` consists of generators of the prime-to-characteristic Tate module over a separable closure. -/
abbrev cyclotomicTwist (B T X : Type*) [Group B] [MulAction B T] [MulAction B X] :=
  T →[B] X

/-- For a simply transitive `T`, evaluation at a point identifies the twist with `X`. -/
theorem cyclotomicTwist_eval_bijective (B T X : Type*) [Group B] [MulAction B T] [MulAction B X]
    (hT : ∀ t₁ t₂ : T, ∃! b : B, b • t₁ = t₂) (t₀ : T) :
    Function.Bijective (fun f : cyclotomicTwist B T X => f t₀) := sorry

end ReducedSchur

/-- The lifting invariant of a branch tuple: the ordered product of the marked generators in
`U(G, c)`. -/
def LiftingInvariant.tuple {G : Type} [Group G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) {r : ℕ} (t : Fin r → c) :
    ReducedSchur.universalMarked c hc :=
  (List.ofFn fun i => PresentedGroup.of (t i)).prod

/-- A Hurwitz move preserves the marked product; conjugacy invariance keeps the moved tuple
inside the marking set. -/
theorem LiftingInvariant.braid {G : Type} [Group G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) {r : ℕ} (i : Fin (r - 1))
    (t t' : Fin r → c)
    (ht' : (fun j => (t' j).val) = HurwitzMove.apply i (fun j => (t j).val)) :
    LiftingInvariant.tuple c hc t' = LiftingInvariant.tuple c hc t := sorry

/-- The projection of the lifting invariant is the ordered product of the branch tuple. -/
theorem LiftingInvariant.projection {G : Type} [Group G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) {r : ℕ} (t : Fin r → c) :
    ReducedSchur.universalProjection c hc (LiftingInvariant.tuple c hc t) =
      BranchTuple.product (fun i => (t i).val) := sorry

/-- Marking the identity does not force its lift to be the identity. -/
theorem LiftingInvariant.identity_mark_nontrivial :
    LiftingInvariant.tuple (Set.univ : Set PUnit) (fun _ _ _ => Set.mem_univ _)
      ![⟨PUnit.unit, Set.mem_univ _⟩] ≠ 1 := sorry

/-- With every class multiplicity sufficiently large, the lifting invariant detects generating
braid orbits and every universal marked element of that degree occurs. -/
theorem LiftingInvariant.stable_classification {G : Type} [Group G] [Finite G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) (hgen : Subgroup.closure c = ⊤)
    (degree : ReducedSchur.universalMarked c hc →* Multiplicative (ReducedSchur.classSet c →₀ ℤ))
    (hdegree : ∀ x : c, degree (PresentedGroup.of x) =
      Multiplicative.ofAdd
        (Finsupp.single ⟨ConjClasses.mk x.val, ⟨x.val, x.property, rfl⟩⟩ 1)) :
    ∃ M : ℕ,
      (∀ (r : ℕ) (t t' : Fin r → c),
        BranchTuple.generated (fun i => (t i).val) = ⊤ →
        BranchTuple.generated (fun i => (t' i).val) = ⊤ →
        (∀ d, (M : ℤ) ≤ Multiplicative.toAdd (degree (LiftingInvariant.tuple c hc t)) d) →
        (LiftingInvariant.tuple c hc t = LiftingInvariant.tuple c hc t' ↔
          ∃ b : TauCeti.BraidGroup r,
            HurwitzAction.action r G b (fun i => (t i).val) = fun i => (t' i).val)) ∧
      (∀ u : ReducedSchur.universalMarked c hc,
        (∀ d, (M : ℤ) ≤ Multiplicative.toAdd (degree u) d) →
        ∃ (r : ℕ) (t : Fin r → c),
          BranchTuple.generated (fun i => (t i).val) = ⊤ ∧ LiftingInvariant.tuple c hc t = u) :=
  sorry

/-! ## Layer IG.4: embedding problems, Shafarevich's theorem and unramified Γ-groups -/

/-- Every finite split embedding problem over a number field with nilpotent kernel has a
continuous surjective solution. -/
theorem exists_proper_solution_of_split_nilpotent (K : Type*) [Field K] [NumberField K]
    (P : TauCeti.FiniteEmbeddingProblem (Field.absoluteGaloisGroup K))
    (s : P.Q →* P.E) (hs : P.α.comp s = MonoidHom.id P.Q) [Group.IsNilpotent P.α.ker] :
    ∃ β : Field.absoluteGaloisGroup K →* P.E, P.IsSolution β ∧ Function.Surjective β := sorry

/-- The Fitting subgroup: the subgroup generated by all nilpotent normal subgroups. -/
def fittingSubgroup (G : Type*) [Group G] : Subgroup G :=
  sSup {N : Subgroup G | N.Normal ∧ Group.IsNilpotent N}

namespace fittingSubgroup

/-- The subgroup generated by all nilpotent normal subgroups is normal. -/
theorem normal (G : Type*) [Group G] : (fittingSubgroup G).Normal := sorry

/-- The Fitting subgroup of a finite group is nilpotent. -/
theorem isNilpotent (G : Type*) [Group G] [Finite G] : Group.IsNilpotent (fittingSubgroup G) :=
  sorry

/-- Every nilpotent normal subgroup lies in the Fitting subgroup. -/
theorem le_of_normal_of_isNilpotent {G : Type*} [Group G] (N : Subgroup G) [N.Normal]
    [Group.IsNilpotent N] : N ≤ fittingSubgroup G := sorry

/-- For a nontrivial finite solvable group, `Φ(G) < F(G)` (Huppert, as used by Schmidt and
Wingberg). -/
theorem frattini_lt (G : Type*) [Group G] [Finite G] [Nontrivial G] [Group.IsSolvable G] :
    frattini G < fittingSubgroup G := sorry

/-- The Fitting subgroup of a nontrivial finite solvable group has a proper supplement. -/
theorem exists_proper_supplement (G : Type*) [Group G] [Finite G] [Nontrivial G]
    [Group.IsSolvable G] : ∃ U : Subgroup G, U < ⊤ ∧ fittingSubgroup G ⊔ U = ⊤ := sorry

end fittingSubgroup

/-- Shafarevich's theorem: every finite solvable group is a Galois group over every number
field. -/
theorem shafarevich (K : Type u) [Field K] [NumberField K] (G : Type*) [Group G] [Finite G]
    [Group.IsSolvable G] :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ IsGalois K L ∧ Nonempty ((L ≃ₐ[K] L) ≃* G) := sorry

/-! ## Layer IG.5: configuration spaces and Hurwitz moduli -/

/-- Ordered configurations of `n` distinct points of `X`. -/
abbrev OrderedConfiguration (X : Type*) (n : ℕ) := {f : Fin n → X // Function.Injective f}

/-- Unordered configurations: `n`-element subsets. -/
abbrev UnorderedConfiguration (X : Type*) (n : ℕ) := {s : Finset X // s.card = n}

/-- Forgetting the order of an ordered configuration. -/
def OrderedConfiguration.forget {X : Type*} [DecidableEq X] {n : ℕ}
    (f : OrderedConfiguration X n) : UnorderedConfiguration X n :=
  ⟨Finset.univ.image f.val, by
    rw [Finset.card_image_of_injective _ f.property]
    simp⟩

/-- Every finite unordered configuration admits an ordering. -/
theorem OrderedConfiguration.forget_surjective (X : Type*) [DecidableEq X] (n : ℕ) :
    Function.Surjective (OrderedConfiguration.forget (X := X) (n := n)) := sorry

/-- Two ordered configurations have the same underlying set precisely when a unique permutation
relabels their entries. -/
theorem OrderedConfiguration.forget_eq_iff {X : Type*} [DecidableEq X] {n : ℕ}
    (f g : OrderedConfiguration X n) :
    OrderedConfiguration.forget f = OrderedConfiguration.forget g ↔
      ∃! σ : Equiv.Perm (Fin n), ∀ i, g.val i = f.val (σ i) := sorry

/-- The lifted affine coordinate group: triples `(a, b, d)` with `d² = aⁿ`, acting by
`x ↦ a x + b` on the line and by `y ↦ d y` on the hyperelliptic coordinate. -/
structure LiftedAffineGroup (n : ℕ) (R : Type*) [CommRing R] where
  /-- The multiplier of the affine coordinate. -/
  a : Rˣ
  /-- The translation of the affine coordinate. -/
  b : R
  /-- The scalar on the square-root coordinate. -/
  d : Rˣ
  square_eq : d ^ 2 = a ^ n

namespace LiftedAffineGroup

/-- Composition of lifted affine maps. -/
def mul {n : ℕ} {R : Type*} [CommRing R] (g h : LiftedAffineGroup n R) :
    LiftedAffineGroup n R where
  a := g.a * h.a
  b := (g.a : R) * h.b + g.b
  d := g.d * h.d
  square_eq := by rw [mul_pow, mul_pow, g.square_eq, h.square_eq]

/-- For odd `n`, `(a, b, d) ↦ (d / a^{(n-1)/2}, b)` identifies the group with `Rˣ × R`. -/
theorem nonempty_equiv_of_odd {n : ℕ} (hn : Odd n) (R : Type*) [CommRing R] :
    Nonempty (LiftedAffineGroup n R ≃ Rˣ × R) := sorry

/-- In odd degree the affine multiplier and the square-root multiplier are the square and
the `n`-th power of a unique unit, respectively. -/
theorem odd_coordinates {n : ℕ} (hn : Odd n) {R : Type*} [CommRing R]
    (g : LiftedAffineGroup n R) : ∃! u : Rˣ, g.a = u ^ 2 ∧ g.d = u ^ n := sorry

-- The hyperelliptic involution is a distinct lift fixing the entire branch coordinate.
example (n : ℕ) :
    (⟨1, 0, 1, by simp⟩ : LiftedAffineGroup n ℚ) ≠ ⟨1, 0, -1, by simp⟩ ∧
      ∀ x : ℚ, ((⟨1, 0, -1, by simp⟩ : LiftedAffineGroup n ℚ).a : ℚ) * x +
        (⟨1, 0, -1, by simp⟩ : LiftedAffineGroup n ℚ).b = x := by
  constructor
  · intro h
    have hd := congrArg (fun g : LiftedAffineGroup n ℚ => (g.d : ℚ)) h
    norm_num at hd
  · intro x
    simp

end LiftedAffineGroup

/-! ## Layer IG.6: realizations and the inverse Galois problem -/

/-- A realization of `G` by a finite Galois extension `L/K`. -/
structure FieldRealization (K L G : Type*) [Field K] [Field L] [Algebra K L] [Group G] where
  finiteDimensional : FiniteDimensional K L
  isGalois : IsGalois K L
  groupEquiv : (L ≃ₐ[K] L) ≃* G

/-- A realization of `G` by the splitting field of a separable polynomial. -/
structure PolynomialRealization {K : Type*} [Field K] (f : K[X]) (G : Type*) [Group G] where
  separable : f.Separable
  groupEquiv : f.Gal ≃* G

namespace FieldRealization

/-- The degree of a finite Galois realization equals the order of the realized group. -/
theorem degree {K L G : Type*} [Field K] [Field L] [Algebra K L] [Group G]
    (c : FieldRealization K L G) : Module.finrank K L = Nat.card G := sorry

/-- A base-field algebra isomorphism transports the Galois realization and its group. -/
theorem nonempty_transport {K L L' G : Type*} [Field K] [Field L] [Field L']
    [Algebra K L] [Algebra K L'] [Group G] (c : FieldRealization K L G) (e : L ≃ₐ[K] L') :
    Nonempty (FieldRealization K L' G) := sorry

end FieldRealization

/-- The splitting field of a polynomial realization is a field realization. -/
def PolynomialRealization.toField {K G : Type*} [Field K] [Group G] {f : K[X]}
    (c : PolynomialRealization f G) : FieldRealization K f.SplittingField G where
  finiteDimensional := inferInstance
  isGalois := IsGalois.of_separable_splitting_field c.separable
  groupEquiv := c.groupEquiv

/-- The zero polynomial is inseparable and therefore cannot realize a group in this structure. -/
theorem PolynomialRealization.zero_isEmpty (K : Type*) [Field K] (G : Type*) [Group G] :
    IsEmpty (PolynomialRealization (0 : K[X]) G) := sorry

/-- The splitting field `ℚ(2^{1/4}, i)` of `X⁴ − 2` inside `ℂ`. -/
def dihedralEightField : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ {((Real.sqrt (Real.sqrt 2) : ℝ) : ℂ), Complex.I}

/-- `X⁴ − 2` realizes the dihedral group of order eight over `ℚ`. -/
theorem dihedral_realization :
    Nonempty (PolynomialRealization (X ^ 4 - C 2 : ℚ[X]) (DihedralGroup 4)) := sorry

/-- The dihedral splitting field inside `ℂ` has degree eight over `ℚ`. -/
theorem dihedralEightField_degree : Module.finrank ℚ dihedralEightField = 8 := sorry

/-- The inverse Galois problem over `ℚ`, a named open statement. -/
def InverseGaloisProblem : Prop :=
  ∀ (G : Type) [Group G] [Finite G],
    ∃ (L : Type) (_ : Field L) (_ : Algebra ℚ L),
      FiniteDimensional ℚ L ∧ IsGalois ℚ L ∧ Nonempty ((L ≃ₐ[ℚ] L) ≃* G)

/-- The regular inverse Galois problem over `ℚ(T)`, a named open statement. -/
def RegularInverseGaloisProblem : Prop :=
  ∀ (G : Type) [Group G] [Finite G], HasRegularRealization ℚ G

/-- A regular realization over `ℚ(T)` gives a realization over `ℚ`, by Hilbert irreducibility. -/
theorem realization_of_hasRegularRealization (G : Type) [Group G] [Finite G]
    (h : HasRegularRealization ℚ G) :
    ∃ (L : Type) (_ : Field L) (_ : Algebra ℚ L),
      FiniteDimensional ℚ L ∧ IsGalois ℚ L ∧ Nonempty ((L ≃ₐ[ℚ] L) ≃* G) := sorry

/-- A regular realization over the rational function field of a characteristic-zero Hilbertian
field specializes to a finite Galois realization over that field. -/
theorem HasRegularRealization.exists_realization (K : Type u) [Field K] [CharZero K]
    (hK : IsHilbertian K) (G : Type*) [Group G] [Finite G] (h : HasRegularRealization K G) :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ IsGalois K L ∧ Nonempty ((L ≃ₐ[K] L) ≃* G) := sorry

/-- Over a number field, a regular realization specializes to a realization linearly disjoint
from any prescribed finite extension; the tensor product of the two fields is a domain. -/
theorem HasRegularRealization.exists_disjoint_realization (K : Type u) [Field K] [NumberField K]
    (G : Type*) [Group G] [Finite G] (h : HasRegularRealization K G)
    (M : Type*) [Field M] [Algebra K M] [FiniteDimensional K M] :
    ∃ (L : Type u) (_ : Field L) (_ : Algebra K L),
      FiniteDimensional K L ∧ IsGalois K L ∧ Nonempty ((L ≃ₐ[K] L) ≃* G) ∧
        IsDomain (TensorProduct K L M) := sorry

/-- The regular inverse Galois problem implies the inverse Galois problem over `ℚ`. -/
theorem inverseGaloisProblem_of_regular :
    RegularInverseGaloisProblem → InverseGaloisProblem := sorry

/-
Not stated in this file, because the objects they concern are not available at the pinned
libraries; the README states each of them in full:
Layer IG.0: `LatticeScheme`, `AdicLocalSystem`, `IsogenyLocalSystem`, `RationalLocalSystem`,
`IsNoohiGroup`, `InfiniteGaloisCategory`, `ProetaleFundamentalGroup`, and the
comparison with the lisse `ℓ`-adic realization.
EtaleCohomologyFoundations F.0.A0–F.0.A2 supplies field and multiplicative-group identifications,
the arithmetic sequence and SchemeInertia.
The integral/isogeny/stackified rational local-system theory is owned here, including noninvertible
p and rational objects without a global lattice. Supplied by EtaleCohomologyFoundations
§F.0 / VanishingCycles.finiteEtaleGaloisCategory: finite lisse monodromy needs no coefficient
invertibility, and based π₁ requires connected nonempty locally Noetherian schemes. Supplied by
EtaleCohomologyFoundations §F.4 / VanishingCycles.normalizedAdicSystems,
VanishingCycles.rationalAdicRealization: the comparison uses only the common normalized lisse
integral subcategory on connected Noetherian schemes with p invertible and uniform
cohomological/Tor bounds. Its rationalization is fully faithful on the isogeny category, with
essential image the rational lisse degree-zero objects admitting a global lisse integral lattice.
The supplied full rational category contains the nodal rational line with monodromy p, which has
a constructible integral model and lies outside this essential image. The comparison for the
whole stackified rational-local-system category is outside this target's scope.
Layer IG.1: finite étale covers over a henselian local base, proper
descent of finite étale covers, invariance under
algebraically closed base extension, `TameFundamentalGroup`,
`PrimeToFundamentalGroup`, `TameTangentialFiber`, the specialization theorems,
`IsArithmeticRepresentation`, connected pointed finite étale Galois covers of semisimple groups
over algebraically closed characteristic-zero fields as central isogenies, and the homogeneous-space
fundamental group. The cover-to-isogeny target constructs multiplication
and inversion by pointed topological lifting and algebraizes the sections by Riemann existence;
it proves semisimplicity of the source and transports the construction to algebraically closed
characteristic-zero fields. Algebraic simple connectedness then gives trivial étale π₁, used for
the finite-stabiliser quotient with the shared fibre/deck convention.
Layer IG.2: Hilbert subsets of varieties, `ThinSet`, full-group specialization of regular covers,
local conditions, norm pullbacks, Hilbert specialization detected by the Frattini quotient,
the integral thin-set count and normal subgroups of absolute Galois groups. The specialization
target uses a continuous surjection from the fundamental group of a nonempty open in the affine
line over a Hilbertian characteristic-zero field to a profinite group P with open Frattini subgroup.
Connected fibres of the resulting finite quotient torsor detect the full closed specialized image.
ArithmeticGaloisRepresentations §6.4a supplies general closed-image detection and, for compact
subgroups of GL_n(E) with E/ℚ_ℓ finite, openness of the Frattini subgroup. It also supplies the
Frattini criterion used for the two C₈-lifts in Layer IG.4.
Layer IG.3: `ArtinNeighborhood`, `BranchCover`, `CoverDescent`, `ExteriorEpi.ofTuple`,
the braid-orbit monoid,
`ReducedSchur.commutingCycle`, `ReducedSchur.homologicalCommutator`,
`ReducedSchur.schurRelations`, `ReducedSchur.reducedMultiplier`, `ReducedSchur.schurRelations_empty`, the
reduced Schur cover and the marked fibre product, and the unit action.
Layer IG.4: proper embedding problems with local prescriptions, twisting of abelian-kernel solutions,
the restricted-ramification localization adapter with its mixed row
for full old local classes and new ramification classes, the auxiliary cokernel comparison with
its splitting-field hypotheses and finite-group homology maps, free operator
shrinking, `BrauerManinSet`, torus types and
Brauer–Manin descent for cyclic stabiliser quotients, the quotient fibration and smaller stabiliser,
Brauer–Manin fibration density over a quasi-trivial torus, Brauer–Manin density for supersolvable
stabilisers, collectively coprime degrees of ordinary field realizations, unramified Brauer classes
of finite quotients of `SL_n`, unramified
`Γ`-groups, Property E and the marked extension count over `𝔽_q(t)`.
ArithmeticGaloisDuality R02.3.0d/R02.4.5a/R02.4.5b supplies finite Galois localization,
absolute finite Poitou–Tate and Grunwald–Wang.
Layer IG.0.T1–IG.0.T4 constructs the public declarations VanishingCycles.curveEndomorphismTrace,
VanishingCycles.etaleTraceFormulaFinite, VanishingCycles.etaleTraceFormula,
VanishingCycles.pointCountTrace. EtaleCohomologyFoundations F.10.3–F.10.5 supplies their
perfect-complex trace algebra, free-torsor equivariant perfectness and derived coefficient descent.
Layer IG.5: topological and arithmetic Hurwitz spaces, tame `G`-covers of smooth proper target
curves of arbitrary genus, the general-genus Hurwitz comparison for the smooth admissible locus
and versal families, admissible `G`-covers, the cohomological comparisons, component invariants, patching of Galois algebras and of covers with a
fixed branch divisor (connectedness uses chosen local primes with a common branch prime and
generating stabilisers), the Euler characteristic of `ℓ`-torsion local systems on affine curves, and
the steps of Serre, Raynaud and Harbater towards Abhyankar's conjecture.
LocalFieldsRamification Layers 3–4 supply upper numbering on open subgroups, and
ArithmeticGaloisRepresentations §3.4 supplies Swan-conductor scaling under tame base change
for Serre's solvable step.
Layer IG.6: the data map `FieldRealization.transport`, specialization with its integral cover model,
and generic-polynomial universality.
Further API targets specified in the README (IG.2.1–IG.2.3, IG.3.4–IG.3.5):
`RationalSpecialization.denominatorProduct_C`,
`RationalSpecialization.denominatorProduct_polynomialCoefficients`,
`RationalSpecialization.denominatorProduct_zero`,
`RationalSpecialization.evalRegular_apply`,
`RationalSpecialization.regularSubring_le_iff`,
`RationalSpecialization.specialize_C`,
`RationalSpecialization.specialize_X`,
`RationalSpecialization.specialize_polynomialCoefficients`,
`RationalSpecialization.specialize_zero`,
`ReducedSchur.admissible_abelianization`,
`ReducedSchur.correction_cocycle`,
`ReducedSchur.multiplier_kernel_primary`,
`ReducedSchur.reduced_kernel_primary`,
`ReducedSchur.universal_central`,
`degree_permutation_abelianization`,
`degree_permutation_basis`,
`degree_permutation_lower_bound`,
`degree_permutation_sum`.
-/

end

end TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups
