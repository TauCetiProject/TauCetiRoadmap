import Mathlib
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic
import TauCeti.FieldTheory.FunctionField.Place.RatFunc.Order

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

section GaloisAlgebra

variable (K : Type*) [Field K] (A : Type*) [CommRing A] [Algebra K A]
  (H : Type*) [Group H] [MulSemiringAction H A] [SMulCommClass H K A]

/-- The map `A ⊗_K A → ∏_{h ∈ H} A`, `a ⊗ b ↦ (a · h(b))_h`, whose bijectivity is the torsor
condition for an `H`-Galois algebra (Layer IG.0, *Finite Galois algebras and torsors*). -/
def galoisTensorMap : TensorProduct K A A →ₐ[K] (H → A) :=
  Algebra.TensorProduct.lift (Pi.constAlgHom K H A)
    (AlgHom.pi (fun h : H => MulSemiringAction.toAlgHom K A h))
    (fun _ _ => Commute.all _ _)

/-- `A` is an `H`-Galois algebra over `K`: a nonzero finite étale `K`-algebra on which `H` acts by
`K`-algebra automorphisms such that the Galois tensor map is bijective. Nonzero-ness is part of
the definition: the zero algebra satisfies the tensor condition but has an empty geometric
fibre. -/
def IsGaloisAlgebra : Prop :=
  Nontrivial A ∧ Module.Finite K A ∧ Algebra.Etale K A ∧
    Function.Bijective (galoisTensorMap K A H)

-- The tensor map multiplies the first factor by the translate of the second.
example (a b : A) (h : H) : galoisTensorMap K A H (a ⊗ₜ[K] b) h = a * h • b := sorry

-- A zero algebra has no nonempty geometric fibre, even though its tensor map is bijective.
example [Subsingleton A] : ¬ IsGaloisAlgebra K A H := sorry

end GaloisAlgebra

/-- A separable quadratic extension with its nontrivial automorphism is a `C₂`-Galois algebra:
here `ℚ(i)` inside `ℂ`, acted on by its Galois group. -/
example :
    IsGaloisAlgebra ℚ (IntermediateField.adjoin ℚ {Complex.I} : IntermediateField ℚ ℂ)
      ((IntermediateField.adjoin ℚ {Complex.I} : IntermediateField ℚ ℂ) ≃ₐ[ℚ]
        (IntermediateField.adjoin ℚ {Complex.I} : IntermediateField ℚ ℂ)) := sorry

/-- A finite Galois field extension `L/K` is a `Gal(L/K)`-Galois algebra. -/
theorem isGaloisAlgebra_of_isGalois (K L : Type*) [Field K] [Field L] [Algebra K L]
    [FiniteDimensional K L] [IsGalois K L] : IsGaloisAlgebra K L (L ≃ₐ[K] L) := sorry

/-! ## Layer IG.1: arithmetic fundamental groups, inertia and specialization

The objects of this layer (tame fundamental quotients, tangential fibres,
specialization maps) are built on the étale fundamental group of a scheme, which is not available
at the pinned libraries; they are README targets only. For characteristic exponent `p`,
local tame inertia uses `TauCeti.PrimeToPTateModule p K`, whose indices satisfy
`n ≠ 0 ∧ Nat.Coprime n p`, equivalently `0 < n ∧ Nat.Coprime n p`.
Thus `p = 1` includes all positive indices. The relative-boundary specialization target
carries `Nat.Coprime (Nat.card G) p` for its finite-group cover assertion. -/

-- The degree-two Kummer index is included in characteristic zero.
example : 0 < (2 : ℕ) ∧ Nat.Coprime 2 1 := by decide

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

-- The zero function is regular everywhere (`denom 0 = 1`).
example : (0 : RatFunc ℚ) ∈ regularSubring ℚ 0 := zero_mem _

theorem algebraMap_mem_regularSubring (t : K) (p : K[X]) :
    algebraMap K[X] (RatFunc K) p ∈ regularSubring K t := sorry

-- A removable singularity is regular: `(T² − 1)/(T − 1) = T + 1` at `t = 1`.
example : ((RatFunc.X ^ 2 - 1) / (RatFunc.X - 1) : RatFunc ℚ) ∈ regularSubring ℚ 1 := sorry

-- A genuine pole is not: `T⁻¹` at `t = 0`.
example : (RatFunc.X⁻¹ : RatFunc ℚ) ∉ regularSubring ℚ 0 := sorry

-- Reduced fractions distinguish cancellation from a genuine pole.
example : ((RatFunc.X ^ 2 - RatFunc.X) / RatFunc.X : RatFunc ℚ) ∈ regularSubring ℚ 0 :=
  sorry

example : (RatFunc.X / RatFunc.X ^ 2 : RatFunc ℚ) ∉ regularSubring ℚ 0 := sorry

-- Equal total values at zero do not imply equal regularity.
example : (RatFunc.X : RatFunc ℚ) ∈ regularSubring ℚ 0 ∧
    RatFunc.eval (RingHom.id ℚ) 0 (RatFunc.X : RatFunc ℚ) =
      RatFunc.eval (RingHom.id ℚ) 0 RatFunc.X⁻¹ := sorry

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

theorem evalRegular_polynomial (t : K) (p : K[X]) :
    evalRegular t ⟨algebraMap K[X] (RatFunc K) p, algebraMap_mem_regularSubring t p⟩ =
      p.eval t := sorry

theorem evalRegular_surjective (t : K) : Function.Surjective (evalRegular t) := sorry

-- Evaluation preserves the unit even at the zero parameter.
example : evalRegular (0 : ℚ) 1 = 1 := map_one _

-- Polynomial and nonpolynomial inputs use the same parameter evaluation.
example : evalRegular (3 : ℚ)
    ⟨RatFunc.X, algebraMap_mem_regularSubring 3 X⟩ = 3 := sorry

example : evalRegular (3 : ℚ)
    ⟨(RatFunc.X - 1)⁻¹, by sorry⟩ = 1 / 2 := sorry

example : evalRegular (2 : ℚ)
    ⟨RatFunc.X - 2, by sorry⟩ = 0 := sorry

example : evalRegular (5 : ℚ)
    ⟨RatFunc.C 7, by sorry⟩ = 7 := sorry

/-- Coefficientwise specialization `p(T, Y) ↦ p(t, Y)`, total as a function. -/
def specialize (t : K) (p : (RatFunc K)[X]) : K[X] :=
  p.sum fun n c => monomial n (RatFunc.eval (RingHom.id K) t c)

theorem coeff_specialize (t : K) (p : (RatFunc K)[X]) (n : ℕ) :
    (specialize t p).coeff n = RatFunc.eval (RingHom.id K) t (p.coeff n) := sorry

theorem specialize_map_regular (t : K) (p : (regularSubring K t)[X]) :
    specialize t (p.map (regularSubring K t).subtype) = p.map (evalRegular t) := sorry

theorem specialize_add (t : K) (p q : (RatFunc K)[X])
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0) (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p + q) = specialize t p + specialize t q := sorry

theorem specialize_mul (t : K) (p q : (RatFunc K)[X])
    (hp : ∀ n, (p.coeff n).denom.eval t ≠ 0) (hq : ∀ n, (q.coeff n).denom.eval t ≠ 0) :
    specialize t (p * q) = specialize t p * specialize t q := sorry

-- `Y² − T` specializes at `t = 2` to `Y² − 2`.
example : specialize (2 : ℚ) (X ^ 2 - C RatFunc.X) = X ^ 2 - C 2 := sorry

-- Without regularity, multiplicativity fails: `T · T⁻¹ = 1` but evaluation at the pole gives `0`.
example : specialize (0 : ℚ) (C (RatFunc.X : RatFunc ℚ) * C RatFunc.X⁻¹) ≠
    specialize 0 (C RatFunc.X) * specialize 0 (C RatFunc.X⁻¹) := sorry

-- Specialization is total, including the zero polynomial and coefficient poles.
example : specialize (0 : ℚ) (0 : (RatFunc ℚ)[X]) = 0 := sorry

example : specialize (0 : ℚ) (C RatFunc.X * X + 1) = 1 := sorry

example : (specialize (0 : ℚ) (C (RatFunc.X⁻¹ : RatFunc ℚ) * X)).coeff 1 = 0 :=
  sorry

-- The polynomial map along regular evaluation agrees with coefficientwise specialization.
example :
    let q : (regularSubring ℚ 0)[X] :=
      C ⟨(RatFunc.X - 1)⁻¹, by sorry⟩ * X + C ⟨RatFunc.X, by sorry⟩
    specialize 0 (q.map (regularSubring ℚ 0).subtype) = q.map (evalRegular 0) ∧
      q.map (evalRegular 0) = -X := sorry

-- Cancellation of two poles breaks additivity of total evaluation.
example : specialize (0 : ℚ)
      (C (RatFunc.X⁻¹ : RatFunc ℚ) + C (1 - RatFunc.X⁻¹)) ≠
    specialize 0 (C RatFunc.X⁻¹) + specialize 0 (C (1 - RatFunc.X⁻¹)) := sorry

-- Regular coefficients retain the addition and multiplication laws.
example : specialize (2 : ℚ)
    ((X ^ 2 - C RatFunc.X) + C (RatFunc.X - 1)⁻¹ * X) =
      (X ^ 2 - C 2) + X := sorry

example : specialize (2 : ℚ) ((X - C RatFunc.X) * (X + C RatFunc.X)) =
    (X - C 2) * (X + C 2) := sorry

/-- Product, with repetitions, of the reduced denominators of the nonzero coefficients. -/
def denominatorProduct (p : (RatFunc K)[X]) : K[X] :=
  ∏ n ∈ p.support, (p.coeff n).denom

-- Repeated poles are counted: `T⁻¹ Y + T⁻¹` has denominator product `T²`.
example : denominatorProduct (C (RatFunc.X⁻¹ : RatFunc ℚ) * X + C RatFunc.X⁻¹) = X ^ 2 := sorry

-- The empty coefficient support contributes the empty product, not zero.
example : denominatorProduct (0 : (RatFunc ℚ)[X]) = 1 := sorry

-- A cancelled denominator contributes no factor.
example : denominatorProduct
    (C ((RatFunc.X ^ 2 - 1) / (RatFunc.X - 1) : RatFunc ℚ)) = 1 := sorry

theorem denominatorProduct_ne_zero (p : (RatFunc K)[X]) : denominatorProduct p ≠ 0 := sorry

theorem denominatorProduct_eval_ne_zero_iff (t : K) (p : (RatFunc K)[X]) :
    (denominatorProduct p).eval t ≠ 0 ↔ ∀ n, (p.coeff n).denom.eval t ≠ 0 := sorry

theorem natDegree_specialize (t : K) (p : (RatFunc K)[X])
    (h : RatFunc.eval (RingHom.id K) t p.leadingCoeff ≠ 0) :
    (specialize t p).natDegree = p.natDegree := sorry

-- Vanishing of the leading value loses degree even with regular coefficients.
example : (C (RatFunc.X : RatFunc ℚ) * X + 1).natDegree = 1 ∧
    (specialize (0 : ℚ) (C RatFunc.X * X + 1)).natDegree = 0 := sorry

-- An irreducible value can have smaller degree than its source.
example : (C (RatFunc.X : RatFunc ℚ) * X ^ 2 + X + 1).natDegree = 2 ∧
    specialize (0 : ℚ) (C RatFunc.X * X ^ 2 + X + 1) = X + 1 ∧
    Irreducible (specialize (0 : ℚ) (C RatFunc.X * X ^ 2 + X + 1)) := sorry

-- A lower-coefficient pole does not change a nonvanishing leading value.
example : specialize (0 : ℚ) (X + C (RatFunc.X⁻¹ : RatFunc ℚ)) = X ∧
    (specialize (0 : ℚ) (X + C (RatFunc.X⁻¹ : RatFunc ℚ))).natDegree = 1 := sorry

/-- The guard: if `(denominatorProduct p · num(lc p))(t) ≠ 0`, every coefficient is regular at `t`
and the degree is preserved. -/
theorem specialization_guard (t : K) (p : (RatFunc K)[X])
    (h : (denominatorProduct p * p.leadingCoeff.num).eval t ≠ 0) :
    (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧ (specialize t p).natDegree = p.natDegree := sorry

-- The coefficient-and-degree guard excludes neither a reducible value nor a repeated root.
example :
    let p : (RatFunc ℚ)[X] := X ^ 2 - C RatFunc.X
    denominatorProduct p * p.leadingCoeff.num = 1 ∧
      (denominatorProduct p * p.leadingCoeff.num).eval 4 ≠ 0 ∧
      specialize (4 : ℚ) p = (X - C 2) * (X + C 2) ∧
      ¬ Irreducible (specialize (4 : ℚ) p) := sorry

example :
    let p : (RatFunc ℚ)[X] := X ^ 2 - C RatFunc.X
    (denominatorProduct p * p.leadingCoeff.num).eval 0 ≠ 0 ∧
      specialize (0 : ℚ) p = X ^ 2 ∧ ¬ (specialize (0 : ℚ) p).Separable := sorry

theorem finite_bad_specializations (p : (RatFunc K)[X]) (hp : p ≠ 0) :
    {t : K | ¬ ((∀ n, (p.coeff n).denom.eval t ≠ 0) ∧
      (specialize t p).natDegree = p.natDegree)}.Finite := sorry

/-- Over an infinite field one can avoid any finite set while keeping all coefficients regular
and all degrees, simultaneously for a finite family. -/
theorem exists_simultaneous_specialization [Infinite K] (s : Finset (RatFunc K)[X])
    (hs : ∀ p ∈ s, p ≠ 0) (a : Finset K) :
    ∃ t : K, t ∉ a ∧ ∀ p ∈ s,
      (∀ n, (p.coeff n).denom.eval t ≠ 0) ∧ (specialize t p).natDegree = p.natDegree := sorry

-- Over `𝔽₂` the infinite-field hypothesis is essential: `(T² − T) Y + 1` loses its degree at
-- both points of `𝔽₂`.
example : ∀ t : ZMod 2,
    (specialize t (C (RatFunc.X ^ 2 - RatFunc.X) * X + 1)).natDegree = 0 := sorry

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

-- The number-field hypothesis gives a positive example alongside the algebraically closed control.
example : IsHilbertian ℚ := isHilbertian_of_numberField ℚ

-- `ℂ` is not Hilbertian: `Y² − T` is irreducible over `ℂ(T)` but every specialization splits.
example : ¬ IsHilbertian ℂ := sorry

-- Over the reals this quadratic is irreducible before every specialization splits.
example : Irreducible (X ^ 2 - C (RatFunc.X ^ 2 + 1) : (RatFunc ℝ)[X]) ∧
    ∀ t : ℝ, ¬ Irreducible
      (RationalSpecialization.specialize t (X ^ 2 - C (RatFunc.X ^ 2 + 1))) := sorry

example : ¬ IsHilbertian ℝ := sorry

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

/-! ## Layer IG.3: branch cycles, rigidity, braid orbits and lifting invariants -/

/-- A branch tuple of length `r` in `G`. -/
abbrev BranchTuple (r : ℕ) (G : Type*) := Fin r → G

namespace BranchTuple

variable {G : Type*} [Group G] {r : ℕ}

/-- The ordered product `t 0 * t 1 * ⋯ * t (r - 1)`. -/
def product (t : BranchTuple r G) : G := (List.ofFn t).prod

/-- The subgroup generated by the entries. -/
def generated (t : BranchTuple r G) : Subgroup G := Subgroup.closure (Set.range t)

-- The empty tuple has identity product and generates the trivial subgroup.
example (G : Type*) [Group G] :
    product (fun i : Fin 0 => Fin.elim0 i : BranchTuple 0 G) = 1 ∧
    generated (fun i : Fin 0 => Fin.elim0 i : BranchTuple 0 G) = ⊥ := sorry

-- In `S₃`, `((0 1), (1 2), ((0 1)(1 2))⁻¹)` has product one and generates.
example : product ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2,
      (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)⁻¹] = 1 ∧
    generated ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2,
      (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)⁻¹] = ⊤ := sorry

-- Product one does not imply generation: `((0 1), (0 1))`.
example : product ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (0 : Fin 3) 1] = 1 ∧
    generated ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (0 : Fin 3) 1] ≠ ⊤ := sorry

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

theorem inner_preserves {r : ℕ} (t t' : BranchTuple r G) (h : (innerRelation r G) t t') :
    (BranchTuple.product t = 1 ↔ BranchTuple.product t' = 1) ∧
      (BranchTuple.generated t = ⊤ ↔ BranchTuple.generated t' = ⊤) := sorry

/-- Absolute equivalence preserves product one and generation: through the faithful
representation, conjugation by an element of the normaliser is an automorphism of `G`. -/
theorem absolute_preserves {r d : ℕ} (P : Subgroup (Equiv.Perm (Fin d))) (e : G ≃* P)
    (t t' : BranchTuple r G) (h : (absoluteRelation P e) t t') :
    (BranchTuple.product t = 1 ↔ BranchTuple.product t' = 1) ∧
      (BranchTuple.generated t = ⊤ ↔ BranchTuple.generated t' = ⊤) := sorry

-- The trivial representation of `C₂` on one point is not faithful, so it is not an input.
example (P : Subgroup (Equiv.Perm (Fin 1))) : IsEmpty (Multiplicative (ZMod 2) ≃* P) := sorry

-- In an abelian target inner equivalence is equality; arbitrary target automorphisms are excluded.
example {G : Type*} [CommGroup G] {r : ℕ} (t t' : BranchTuple r G) :
    (innerRelation r G) t t' ↔ t = t' := sorry

example {G : Type*} [CommGroup G] {r : ℕ} (t t' : BranchTuple r G) :
    (Quotient.mk (innerRelation r G) t : inner r G) = Quotient.mk (innerRelation r G) t' ↔
      t = t' := sorry

-- The identity representation of S₃ permits conjugation by (0 2) in the absolute quotient.
example :
    absoluteRelation (⊤ : Subgroup (Equiv.Perm (Fin 3))) Subgroup.topEquiv.symm
      ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2]
      ![Equiv.swap (1 : Fin 3) 2, Equiv.swap (0 : Fin 3) 1] ∧
    (Quotient.mk _ ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2] :
      absolute (⊤ : Subgroup (Equiv.Perm (Fin 3))) Subgroup.topEquiv.symm) =
      Quotient.mk _ ![Equiv.swap (1 : Fin 3) 2, Equiv.swap (0 : Fin 3) 1] := sorry

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

-- `((0 1), (1 2)) ↦ ((0 2), (0 1))`: the move is not the plain swap.
example : apply (r := 2) 0 ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2] =
    ![Equiv.swap (0 : Fin 3) 2, Equiv.swap (0 : Fin 3) 1] := sorry

-- The inverse move undoes the computed noncommuting S₃ move.
example : inverse (r := 2) 0 ![Equiv.swap (0 : Fin 3) 2, Equiv.swap (0 : Fin 3) 1] =
    ![Equiv.swap (0 : Fin 3) 1, Equiv.swap (1 : Fin 3) 2] := sorry

end HurwitzMove

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

-- The quotient map sends the class of a surjection to the class of that same surjection.
example {G : Type*} [Group G] {r : ℕ} (φ : SurjectiveFreeHom r G) :
    TSystem.quotient r G (Quotient.mk _ φ) = Quotient.mk _ φ := rfl

-- For `C₂` and `r = 2` the generating pairs `(g, 1)`, `(1, g)`, `(g, g)` are three exterior
-- classes, since `C₂` is abelian, but Nielsen moves of `F₂` join them into one `T₂`-system.
example : Nat.card (ExteriorEpi 2 (Multiplicative (ZMod 2))) = 3 ∧
    Nat.card (TSystem 2 (Multiplicative (ZMod 2))) = 1 := sorry

-- Inversion in C₅ changes an exterior class but preserves its T-system.
example (φ ψ : SurjectiveFreeHom 1 (Multiplicative (ZMod 5)))
    (h : ∀ x, ψ.val x = (φ.val x)⁻¹) :
    ¬ ExteriorEpi.relation 1 (Multiplicative (ZMod 5)) φ ψ ∧
      TSystem.relation 1 (Multiplicative (ZMod 5)) φ ψ := sorry

/-- `d(G)` is Mathlib's `Group.rank`: a surjection `F_r ↠ G` exists exactly when `r ≥ d(G)`. -/
theorem nonempty_surjectiveFreeHom_iff (G : Type*) [Group G] [Group.FG G] (r : ℕ) :
    Nonempty (SurjectiveFreeHom r G) ↔ Group.rank G ≤ r := sorry

-- `d(C₂ × C₂) = 2`, and there is no exterior epimorphism from `F₁`.
example : Group.rank (Multiplicative (ZMod 2) × Multiplicative (ZMod 2)) = 2 ∧
    IsEmpty (SurjectiveFreeHom 1 (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) ∧
    IsEmpty (ExteriorEpi 1 (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) ∧
    IsEmpty (TSystem 1 (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) := sorry

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

/-- A conjugacy class is rational if it is stable under every power prime to `|G|`. -/
def IsRationalClass (C : ConjClasses G) : Prop :=
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

-- Rationality tests prime-to-order powers, so a nontrivial C₃ class fails inversion.
example : ¬ IsRationalClass (ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 3))) := sorry

example : IsRationalClass (ConjClasses.mk (Equiv.swap (0 : Fin 3) 1)) := sorry

-- Rationality does not supply a generating product-one tuple.
example : IsRationalClass (ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 2))) ∧
    ¬ IsRigid ![ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 2))] := sorry

-- For the trivial group the empty tuple is the unique generating product-one tuple.
example : IsRigid (fun _ : Fin 0 => ConjClasses.mk (1 : PUnit)) := sorry

end Rigidity

/-- `G` is the Galois group of a regular extension of `K(T)`: a finite Galois extension `L` of
`K(T)` with group `G` in which `K` is algebraically closed. -/
def HasRegularRealization (K : Type u) [Field K] (G : Type*) [Group G] : Prop :=
  ∃ (L : Type u) (_ : Field L) (_ : Algebra (RatFunc K) L) (_ : Algebra K L)
    (_ : IsScalarTower K (RatFunc K) L),
    FiniteDimensional (RatFunc K) L ∧ IsGalois (RatFunc K) L ∧
      Nonempty ((L ≃ₐ[RatFunc K] L) ≃* G) ∧
      ∀ x : L, IsAlgebraic K x → x ∈ Set.range (algebraMap K L)

-- The identity extension of ℚ(T) realizes the trivial group regularly.
example : HasRegularRealization ℚ PUnit := sorry

/-- Rational rigidity (Serre, *Topics in Galois Theory*, Theorem 8.1.1): a centreless finite group
with a rigid tuple of nontrivial rational classes is the Galois group of a regular extension of
`K(T)` for every field `K` of characteristic zero. -/
theorem hasRegularRealization_of_rigid (K : Type u) [Field K] [CharZero K] (G : Type*) [Group G]
    [Finite G] (hZ : Subgroup.center G = ⊥) {r : ℕ} (C : Fin r → ConjClasses G)
    (hrat : ∀ i, IsRationalClass (C i)) (hne : ∀ i, C i ≠ ConjClasses.mk 1) (hrig : IsRigid C) :
    HasRegularRealization K G := sorry

-- The classes (transposition, transposition, 3-cycle) of `S₃` are rigid.
example : IsRigid ![ConjClasses.mk (Equiv.swap (0 : Fin 3) 1),
    ConjClasses.mk (Equiv.swap (0 : Fin 3) 1),
    ConjClasses.mk (Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2)] := sorry

namespace ReducedSchur

-- The multiplier carrier is Mathlib's H₂ with trivial integral coefficients.
#check groupHomology.H2

variable {G : Type} [Group G]

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

-- With no marked generators the universal group is trivial.
example : Nat.card (universalMarked (∅ : Set PUnit) (by simp)) = 1 := sorry

-- The one C₂ marking gives an infinite cyclic group with projection modulo two.
example : Nonempty {e :
    universalMarked ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2)))
      (by intro g x hx; rw [mul_comm g x, mul_assoc, mul_inv_cancel, mul_one]; exact hx) ≃* Multiplicative ℤ //
    ∀ u, universalProjection ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2)))
      (by intro g x hx; rw [mul_comm g x, mul_assoc, mul_inv_cancel, mul_one]; exact hx) u =
        Multiplicative.ofAdd ((Multiplicative.toAdd (e u) : ℤ) : ZMod 2)} := sorry

/-- The conjugacy classes meeting `c`, the index set `D = c/G` of the class degree. -/
def classSet (c : Set G) : Set (ConjClasses G) := ConjClasses.mk '' c

/-- The image in `G^{ab}` of a conjugacy class. -/
def classAbelianization (d : ConjClasses G) : Abelianization G :=
  Quotient.liftOn' d (fun x => Abelianization.of x) (fun _ _ h => by
    obtain ⟨u, rfl⟩ := isConj_iff.mp h
    simp)

-- The empty set contributes no classes; the identity class maps to the abelianized identity.
example : classSet (∅ : Set G) = ∅ := by simp [classSet]

example : classAbelianization (ConjClasses.mk (1 : G)) = 1 := rfl

/-- The class degree map `δ : ℤ^D → G^{ab}`, `e_d ↦` the image of a representative of `d`. -/
def classDegree (c : Set G) : (classSet c →₀ ℤ) →+ Additive (Abelianization G) :=
  Finsupp.liftAddHom fun d => zmultiplesHom _ (Additive.ofMul (classAbelianization d.1))

-- For `G = C₂` and `c` its nontrivial element, `δ(e_c)` is the nontrivial element of `G^{ab}`.
example : classDegree ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2)))
    (Finsupp.single ⟨ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 2)), ⟨_, rfl, rfl⟩⟩ 1) ≠ 0 :=
  sorry

-- The empty class set has zero degree map.
example : classDegree (∅ : Set G) = 0 := sorry

-- Every integer coefficient, including negative ones, is reduced modulo two.
example (k : ℤ) :
    classDegree ({Multiplicative.ofAdd (1 : ZMod 2)} : Set (Multiplicative (ZMod 2)))
      (Finsupp.single ⟨ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 2)), ⟨_, rfl, rfl⟩⟩ k) =
        Additive.ofMul (Abelianization.of (Multiplicative.ofAdd (k : ZMod 2))) := sorry

/-- The kernel of the presentation projection, defined for any conjugacy-invariant `c`.
For finite `G` generated by `c`, its torsion is the reduced Schur multiplier. -/
def universalKernel (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    Subgroup (universalMarked c hc) :=
  (universalProjection c hc).ker

theorem universalProjection_surjective (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c)
    (hgen : Subgroup.closure c = ⊤) : Function.Surjective (universalProjection c hc) := sorry

theorem universalKernel_le_center (c : Set G) (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    universalKernel c hc ≤ Subgroup.center (universalMarked c hc) := sorry

-- A marking of the trivial element is still a free generator, not an imposed identity relation.
example : universalRelations (Set.univ : Set PUnit) (fun _ _ _ => Set.mem_univ _) = {1} ∧
    Nontrivial (universalMarked (Set.univ : Set PUnit) (fun _ _ _ => Set.mem_univ _)) := sorry

example : universalKernel (Set.univ : Set PUnit) (fun _ _ _ => Set.mem_univ _) = ⊤ := sorry

-- The empty marking on C₂² has trivial presentation kernel and does not generate the base group.
example : Nat.card (universalKernel
    (∅ : Set (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) (by simp)) = 1 := sorry

/-- The twist `X⟨−1⟩ = Map_B(T, X)` of a `B`-set by a `B`-torsor `T`. In arithmetic applications
`T` consists of generators of the prime-to-characteristic Tate module over a separable closure. -/
abbrev cyclotomicTwist (B T X : Type*) [Group B] [MulAction B T] [MulAction B X] :=
  T →[B] X

/-- For a simply transitive `T`, evaluation at a point identifies the twist with `X`. -/
theorem cyclotomicTwist_eval_bijective (B T X : Type*) [Group B] [MulAction B T] [MulAction B X]
    (hT : ∀ t₁ t₂ : T, ∃! b : B, b • t₁ = t₂) (t₀ : T) :
    Function.Bijective (fun f : cyclotomicTwist B T X => f t₀) := sorry

-- Twisting a two-element set by the trivial torsor preserves its two distinct points.
example : Nonempty (cyclotomicTwist PUnit PUnit (Fin 2) ≃ Fin 2) := sorry

-- Equivariance cuts the four maps between regular two-element sets down to two.
example : Nat.card (cyclotomicTwist (Multiplicative (ZMod 2))
    (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))) = 2 ∧
    Nat.card (Multiplicative (ZMod 2) → Multiplicative (ZMod 2)) = 4 := sorry

end ReducedSchur

/-- The lifting invariant of a branch tuple: the ordered product of the marked generators in
`U(G, c)`. -/
def LiftingInvariant.tuple {G : Type} [Group G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) {r : ℕ} (t : Fin r → c) :
    ReducedSchur.universalMarked c hc :=
  (List.ofFn fun i => PresentedGroup.of (t i)).prod

-- The empty product is the identity for every conjugacy-invariant marking set.
example {G : Type} [Group G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) :
    LiftingInvariant.tuple c hc (fun i : Fin 0 => Fin.elim0 i) = 1 := by
  simp [LiftingInvariant.tuple]

-- Conjugation invariance supplies the moved tuple, whose ordered marked product is preserved.
example {G : Type} [Group G] (c : Set G)
    (hc : ∀ g : G, ∀ x ∈ c, g * x * g⁻¹ ∈ c) (a b : c) :
    let moved : Fin 2 → c := ![⟨a.1 * b.1 * a.1⁻¹, hc a.1 b.1 b.2⟩, a]
    (fun i => (moved i).1) = HurwitzMove.apply 0 ![a.1, b.1] ∧
      LiftingInvariant.tuple c hc moved = LiftingInvariant.tuple c hc ![a, b] := sorry

-- A one-entry identity tuple projects to one but its marked lift is nontrivial.
example :
    LiftingInvariant.tuple (Set.univ : Set PUnit) (fun _ _ _ => Set.mem_univ _)
      ![⟨PUnit.unit, Set.mem_univ _⟩] ≠ 1 := sorry

/-! ## Layer IG.4: embedding problems, Shafarevich's theorem and unramified Γ-groups -/

/-- The Fitting subgroup: the subgroup generated by all nilpotent normal subgroups. -/
def fittingSubgroup (G : Type*) [Group G] : Subgroup G :=
  sSup {N : Subgroup G | N.Normal ∧ Group.IsNilpotent N}

namespace fittingSubgroup

theorem normal (G : Type*) [Group G] : (fittingSubgroup G).Normal := sorry

theorem isNilpotent (G : Type*) [Group G] [Finite G] : Group.IsNilpotent (fittingSubgroup G) :=
  sorry

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

-- An abelian group is its own Fitting subgroup.
example (G : Type*) [CommGroup G] [Finite G] : fittingSubgroup G = ⊤ := sorry

-- `F(S₃) = A₃` has order three and is supplemented by a transposition.
example : Nat.card (fittingSubgroup (Equiv.Perm (Fin 3))) = 3 := sorry

-- The normal Klein four subgroup is the Fitting subgroup of S₄.
example : Nat.card (fittingSubgroup (Equiv.Perm (Fin 4))) = 4 := sorry

-- A finite p-group is nilpotent and is its own Fitting subgroup.
example (P : Type*) [Group P] [Finite P] (p : ℕ) [Fact p.Prime] (hP : IsPGroup p P) :
    fittingSubgroup P = ⊤ := sorry

-- `S₅` has trivial Fitting and Frattini subgroups.
example : fittingSubgroup (Equiv.Perm (Fin 5)) = ⊥ ∧ frattini (Equiv.Perm (Fin 5)) = ⊥ := sorry

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

-- `n` points of a set with fewer than `n` elements have no configuration.
example : IsEmpty (OrderedConfiguration (Fin 2) 3) := sorry

example : IsEmpty (UnorderedConfiguration (Fin 2) 3) := sorry

-- Forgetting the order of the full configuration keeps all points.
example : (OrderedConfiguration.forget (⟨id, Function.injective_id⟩ :
    OrderedConfiguration (Fin 2) 2)).val = Finset.univ := sorry

-- Empty configurations are singletons, and one-point configurations recover the type.
example (X : Type*) : Nonempty (OrderedConfiguration X 0 ≃ PUnit) ∧
    Nonempty (UnorderedConfiguration X 0 ≃ PUnit) := sorry

example (X : Type*) : Nonempty (OrderedConfiguration X 1 ≃ X) ∧
    Nonempty (UnorderedConfiguration X 1 ≃ X) := sorry

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

-- The identity coordinate change is a two-sided identity for composition.
example {n : ℕ} {R : Type*} [CommRing R] (g : LiftedAffineGroup n R) :
    mul (⟨1, 0, 1, by simp⟩ : LiftedAffineGroup n R) g = g ∧
    mul g (⟨1, 0, 1, by simp⟩ : LiftedAffineGroup n R) = g := sorry

-- For odd degree three the two signs are distinct and both fix every branch label.
example :
    let g : LiftedAffineGroup 3 ℚ := ⟨1, 0, 1, by simp⟩
    let h : LiftedAffineGroup 3 ℚ := ⟨1, 0, -1, by simp⟩
    g ≠ h ∧ ∀ x : ℚ, (g.a : ℚ) * x + g.b = x ∧ (h.a : ℚ) * x + h.b = x := sorry

-- For even `n` the fibre over `(a, b)` contains both square roots: `(1, 0, ±1)` for `n = 2`.
example : (⟨1, 0, 1, by simp⟩ : LiftedAffineGroup 2 ℚ) ≠ ⟨1, 0, -1, by simp⟩ := by
  intro h
  have := congrArg (fun g : LiftedAffineGroup 2 ℚ => (g.d : ℚ)) h
  norm_num at this

-- The affine multiplication scales the second translation before adding the first.
example : (mul (⟨-1, 2, 1, by simp⟩ : LiftedAffineGroup 2 ℚ)
    ⟨1, 3, -1, by simp⟩).b = -1 := by norm_num [mul]

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

theorem degree {K L G : Type*} [Field K] [Field L] [Algebra K L] [Group G]
    (c : FieldRealization K L G) : Module.finrank K L = Nat.card G := sorry

end FieldRealization

/-- The splitting field of a polynomial realization is a field realization. -/
def PolynomialRealization.toField {K G : Type*} [Field K] [Group G] {f : K[X]}
    (c : PolynomialRealization f G) : FieldRealization K f.SplittingField G where
  finiteDimensional := inferInstance
  isGalois := IsGalois.of_separable_splitting_field c.separable
  groupEquiv := c.groupEquiv

-- The trivial group is realized by `K` itself.
example (K : Type*) [Field K] : Nonempty (FieldRealization K K PUnit) := sorry

-- Every nonzero constant has trivial splitting field and group.
example (K : Type*) [Field K] (a : K) (ha : a ≠ 0) :
    Nonempty (PolynomialRealization (C a) PUnit) := sorry

-- The zero polynomial cannot supply the separability field of a realization.
example (K : Type*) [Field K] (G : Type*) [Group G] :
    ¬ Nonempty (PolynomialRealization (0 : K[X]) G) := sorry

-- Constant realizations convert to extensions of degree one.
example (K : Type*) [Field K] (a : K) (ha : a ≠ 0)
    (c : PolynomialRealization (C a) PUnit) :
    Module.finrank K (C a).SplittingField = 1 ∧
      Nonempty (FieldRealization K (C a).SplittingField PUnit) := sorry

-- `(X² − 2)(X² − 3)` realizes `C₂ × C₂` over `ℚ`; reducible polynomials are allowed.
example : Nonempty (PolynomialRealization ((X ^ 2 - C 2) * (X ^ 2 - C 3) : ℚ[X])
    (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) := sorry

-- The polynomial-to-field conversion retains the full biquadratic degree.
example (c : PolynomialRealization ((X ^ 2 - C 2) * (X ^ 2 - C 3) : ℚ[X])
    (Multiplicative (ZMod 2) × Multiplicative (ZMod 2))) :
    Module.finrank ℚ (((X ^ 2 - C 2) * (X ^ 2 - C 3) : ℚ[X]).SplittingField) = 4 := sorry

/-- The splitting field `ℚ(2^{1/4}, i)` of `X⁴ − 2` inside `ℂ`. -/
def dihedralEightField : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ {((Real.sqrt (Real.sqrt 2) : ℝ) : ℂ), Complex.I}

/-- `X⁴ − 2` realizes the dihedral group of order eight over `ℚ`. -/
theorem dihedral_realization :
    Nonempty (PolynomialRealization (X ^ 4 - C 2 : ℚ[X]) (DihedralGroup 4)) := sorry

-- The splitting field has degree eight.
example : Module.finrank ℚ dihedralEightField = 8 := sorry

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
Layer IG.3: `ArtinNeighborhood`, `BranchCover`, `CoverDescent`, `HurwitzMove.equiv`,
`HurwitzAction.action`, `HurwitzAction.action_sigma`, `HurwitzAction.product_action`,
`HurwitzAction.generated_action`, `ExteriorEpi.ofTuple`, the braid-orbit monoid,
`ReducedSchur.commutingCycle`, `ReducedSchur.homologicalCommutator`,
`ReducedSchur.schurRelations`, `ReducedSchur.reducedMultiplier`, `ReducedSchur.schurRelations_empty`, the
reduced Schur cover and the marked fibre product, the unit action, and stable classification.
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
Layer IG.6: `FieldRealization.transport`, specialization of realizations, generic-polynomial universality.
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
`ReducedSchur.universal_marked_property`,
`degree_permutation_abelianization`,
`degree_permutation_basis`,
`degree_permutation_lower_bound`,
`degree_permutation_sum`.
-/

end

end TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups
