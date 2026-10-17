import Mathlib
import TauCeti.RingTheory.FittingIdeal.Basic
import TauCetiRoadmap.SmoothRepresentationsOfLocalGroups.Suggested

/-!
# Integral Hecke actions, determinants and interpolation: representative target signatures

The mathematical roadmap is `README.md`. This file records the definitions and the headline
theorems that can already be stated against the pinned Mathlib and Tau Ceti APIs and the
`SmoothRepresentationsOfLocalGroups` roadmap. It is not an exhaustive list of the targets of any
layer. DerivedModuleAlgebra §§0.DP.1–0.DP.2 and 0.K.1 supply polynomial-law predicates,
Roby algebras and Koszul complexes. The determinant fields below spell out the supplied
homogeneity and multiplicativity conditions on Mathlib's law carrier.

Design choices.
* A `d`-dimensional determinant (Chenevier) is a Mathlib `PolynomialLaw` `R →ₚₗ[A] A` that is
  homogeneous of degree `d` and multiplicative after every scalar extension to a commutative
  `A`-algebra in the universe of `A`. Its characteristic polynomial is `D_{A[X]}(X − x)` (monic
  convention) and its trace is `Λ₁`. Degree zero is allowed.
* On a group algebra, coefficient change along `A →+* B` is read on the characteristic polynomials
  of group elements (`Determinant.IsCoefficientChange`); by Amitsur's formula
  (`Determinant.eq_of_charpoly_eq`) these determine the whole polynomial law.
* The general untwisted invariant-word colimit and its pseudocharacter representing-ring
  comparison are specified in README §0.7 for arbitrary commutative bases and abstract groups.
  Its comparison with SR.6.3 identifies the colimit cocones under the finite-wild hypotheses and
  trivial Weil action.
* A matrix representation acts on `Kᵈ` through `matrixModule`; simplicity and semisimplicity are
  Mathlib's `IsSimpleModule` and `IsSemisimpleModule`.
* Fitting ideals are Tau Ceti's `TauCeti.fittingIdeal`; the GSp₄ spin polynomial is
  `SmoothRepresentationsOfLocalGroups.SpinPolynomial`.
-/

namespace TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants


noncomputable section

open TensorProduct Polynomial

universe u

/-! ## Layer IHG.0: polynomial laws, determinants and pseudocharacters -/

namespace PolynomialLaw

variable {A : Type u} [CommRing A]

/-- The kernel of a polynomial law: the `x` with `f_S(b ⊗ x + m) = f_S(m)` for every commutative
`A`-algebra `S`, `b ∈ S` and `m ∈ S ⊗ M` ([Chenevier], §1.17, p. 16). -/
def ker {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N]
    (f : M →ₚₗ[A] N) : Submodule A M where
  carrier := {x | ∀ (S : Type u) [CommRing S] [Algebra A S] (b : S) (m : S ⊗[A] M),
    f.toFun' S (b ⊗ₜ x + m) = f.toFun' S m}
  add_mem' := sorry
  zero_mem' := sorry
  smul_mem' := sorry

-- The zero law has everything in its kernel; the identity law is faithful.
example {M N : Type*} [AddCommGroup M] [Module A M] [AddCommGroup N] [Module A N] :
    ker (0 : M →ₚₗ[A] N) = ⊤ := sorry

example {M : Type*} [AddCommGroup M] [Module A M] : ker (PolynomialLaw.id : M →ₚₗ[A] M) = ⊥ :=
  sorry

end PolynomialLaw

/-- A `d`-dimensional `A`-valued determinant on an `A`-algebra `R` ([Chenevier], §1.5,
Definition, p. 9): a multiplicative polynomial law `R → A`, homogeneous of degree `d`. -/
structure Determinant (A : Type u) [CommRing A] (R : Type*) [Ring R] [Algebra A R] (d : ℕ) where
  /-- The underlying polynomial law. -/
  toLaw : R →ₚₗ[A] A
  /-- Homogeneity after every scalar extension, as supplied by DerivedModuleAlgebra §0.DP.1. -/
  isHomogeneous : ∀ (S : Type u) [CommRing S] [Algebra A S] (s : S) (x : S ⊗[A] R),
    toLaw.toFun' S (s • x) = s ^ d • toLaw.toFun' S x
  /-- Multiplicativity after every scalar extension, as supplied by DerivedModuleAlgebra §0.DP.1. -/
  isMultiplicative : ∀ (S : Type u) [CommRing S] [Algebra A S],
    toLaw.toFun' S 1 = 1 ∧ ∀ x y : S ⊗[A] R,
      toLaw.toFun' S (x * y) = toLaw.toFun' S x * toLaw.toFun' S y

namespace Determinant

variable {A : Type u} [CommRing A] {R : Type*} [Ring R] [Algebra A R] {d : ℕ}

/-- The value `D(x) ∈ A`. -/
def eval (D : Determinant A R d) (x : R) : A := D.toLaw.ground x

/-- The characteristic polynomial `χ(x, X) = D_{A[X]}(X − x)` ([Chenevier], §1.10, p. 12). -/
def charpoly (D : Determinant A R d) (x : R) : A[X] :=
  Algebra.TensorProduct.rid A A A[X]
    (D.toLaw.toFun' A[X] ((X : A[X]) ⊗ₜ[A] (1 : R) - 1 ⊗ₜ[A] x))

/-- The trace `Λ₁`, minus the coefficient of `X^{d−1}` of `χ`; it is `0` in degree zero. -/
def trace (D : Determinant A R d) (x : R) : A :=
  if d = 0 then 0 else -(D.charpoly x).coeff (d - 1)

/-- The trace as an `A`-linear map ([Chenevier], §1.10, p. 12). -/
def traceLinear (D : Determinant A R d) : R →ₗ[A] A where
  toFun := D.trace
  map_add' := sorry
  map_smul' := sorry

/-- The determinant `det ∘ ρ` of a matrix representation, computed after every scalar extension as
`det_S ∘ (S ⊗ ρ)` through `S ⊗_A M_d(A) ≅ M_d(S)` ([Chenevier], §1.5, p. 9). -/
def ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) : Determinant A R d where
  toLaw :=
    { toFun' := fun S _ _ x =>
        (Algebra.TensorProduct.rid A S S).symm
          (@Matrix.det (Fin d) _ _ S (algebraMap A S).commSemiringToCommRing
            ((matrixEquivTensor (Fin d) A S).symm
              (Algebra.TensorProduct.map (AlgHom.id A S) ρ x)))
      isCompat' := sorry }
  isHomogeneous := sorry
  isMultiplicative := sorry

/-- The characteristic polynomial of `det ∘ ρ` at `x` is `Matrix.charpoly (ρ x)` ([Chenevier],
§1.5, p. 9). -/
theorem charpoly_ofMatrix (ρ : R →ₐ[A] Matrix (Fin d) (Fin d) A) (x : R) :
    (ofMatrix ρ).charpoly x = (ρ x).charpoly := sorry

-- The matrix determinant is multiplicative as a polynomial law.
example (S : Type u) [CommRing S] [Algebra A S] :
    let D := ofMatrix (AlgHom.id A (Matrix (Fin d) (Fin d) A))
    D.toLaw.toFun' S 1 = 1 ∧ ∀ x y : S ⊗[A] Matrix (Fin d) (Fin d) A,
      D.toLaw.toFun' S (x * y) = D.toLaw.toFun' S x * D.toLaw.toFun' S y :=
  (ofMatrix _).isMultiplicative S

-- On `M₂(ℤ)` at `[[2,3],[4,5]]`: value `−2` (`ad − bc`), polynomial `X² − 7X − 2`, trace `7`.
example :
    (ofMatrix (AlgHom.id ℤ (Matrix (Fin 2) (Fin 2) ℤ))).eval !![2, 3; 4, 5] = -2 ∧
      (ofMatrix (AlgHom.id ℤ (Matrix (Fin 2) (Fin 2) ℤ))).charpoly !![2, 3; 4, 5] =
        X ^ 2 - 7 * X - 2 ∧
      (ofMatrix (AlgHom.id ℤ (Matrix (Fin 2) (Fin 2) ℤ))).trace !![2, 3; 4, 5] = 7 := sorry

-- In degree zero the value at zero and the characteristic polynomial are `1`; the trace is `0`.
example :
    (ofMatrix (AlgHom.id ℤ (Matrix (Fin 0) (Fin 0) ℤ))).eval 0 = 1 ∧
      (ofMatrix (AlgHom.id ℤ (Matrix (Fin 0) (Fin 0) ℤ))).charpoly 0 = 1 ∧
      (ofMatrix (AlgHom.id ℤ (Matrix (Fin 0) (Fin 0) ℤ))).trace 0 = 0 := sorry

-- Traces lose information in small characteristic: on `𝔽_p[T]`, the `p`-th powers of evaluation
-- at `0` and at `1` are different `p`-dimensional determinants, both of trace `0`.
example (p : ℕ) [Fact p.Prime] :
    ∃ D E : Determinant (ZMod p) (ZMod p)[X] p, D.traceLinear = E.traceLinear ∧ D ≠ E := sorry

/-- Coefficient reconstruction using Amitsur's formula: the characteristic polynomials of group elements determine a
determinant on a monoid algebra as a polynomial law, with no factorial inverted ([Chenevier],
Lemma 1.12(ii) and Corollary 1.14, pp. 12–15). -/
theorem eq_of_charpoly_eq {G : Type*} [Monoid G] (D E : Determinant A (MonoidAlgebra A G) d)
    (h : ∀ g : G, D.charpoly (MonoidAlgebra.of A G g) = E.charpoly (MonoidAlgebra.of A G g)) :
    D = E := sorry

/-- Continuity of every coefficient of `g ↦ χ_D(g,X)` for the supplied topologies. Over a
topological ring this is equivalent to continuity of every `Λ_i`. For a topological group,
Amitsur's formula also identifies it with continuity of all mixed determinant maps
([Chenevier], §2.30, p. 37). -/
def IsContinuous {G : Type*} [Group G] [TopologicalSpace G] [TopologicalSpace A]
    (D : Determinant A (MonoidAlgebra A G) d) : Prop :=
  ∀ i, Continuous fun g : G ↦ (D.charpoly (MonoidAlgebra.of A G g)).coeff i

-- On a discrete group every determinant is continuous.
example {G : Type*} [Group G] [TopologicalSpace G] [DiscreteTopology G] [TopologicalSpace A]
    (D : Determinant A (MonoidAlgebra A G) d) : D.IsContinuous :=
  fun _ ↦ continuous_of_discreteTopology

-- Characteristic coefficients of a continuous matrix representation are continuous.
example {G : Type*} [Group G] [TopologicalSpace G] [TopologicalSpace A]
    [IsTopologicalRing A] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A)
    (hρ : Continuous fun g : G ↦ ρ (MonoidAlgebra.of A G g)) :
    (ofMatrix ρ).IsContinuous := sorry

-- With an indiscrete source and discrete coefficients, the sign character is discontinuous.
example :
    letI : TopologicalSpace ℤˣ := ⊤
    let ρ : MonoidAlgebra ℤ ℤˣ →ₐ[ℤ] Matrix (Fin 1) (Fin 1) ℤ :=
      MonoidAlgebra.lift ℤ _ _
        ((algebraMap ℤ (Matrix (Fin 1) (Fin 1) ℤ)).toMonoidHom.comp (Units.coeHom ℤ))
    ¬ Continuous (fun u : ℤˣ ↦ (u : ℤ)) ∧ ¬ (ofMatrix ρ).IsContinuous := sorry

-- Upper sets make the negative sign continuous although the sign is discontinuous.
example :
    letI : TopologicalSpace ℤ := TopologicalSpace.generateFrom {s : Set ℤ | IsUpperSet s}
    letI : TopologicalSpace ℤˣ := TopologicalSpace.generateFrom {{(-1 : ℤˣ)}}
    let ρ : MonoidAlgebra ℤ ℤˣ →ₐ[ℤ] Matrix (Fin 1) (Fin 1) ℤ :=
      MonoidAlgebra.lift ℤ _ _
        ((algebraMap ℤ (Matrix (Fin 1) (Fin 1) ℤ)).toMonoidHom.comp (Units.coeHom ℤ))
    ¬ Continuous (fun u : ℤˣ ↦ (u : ℤ)) ∧
      Continuous (fun u : ℤˣ ↦ -(u : ℤ)) ∧ (ofMatrix ρ).IsContinuous := sorry

-- Trace/determinant topology preserves single-element coefficients but not the mixed map.
example :
    letI : TopologicalSpace ℚ := ⊥
    let G := (Matrix (Fin 2) (Fin 2) ℚ)ˣ
    letI : TopologicalSpace G := TopologicalSpace.induced
      (fun g : G ↦ ((g : Matrix (Fin 2) (Fin 2) ℚ).trace,
        (g : Matrix (Fin 2) (Fin 2) ℚ).det)) inferInstance
    let ρ : MonoidAlgebra ℚ G →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ :=
      MonoidAlgebra.lift ℚ _ _ (Units.coeHom _)
    (ofMatrix ρ).IsContinuous ∧
      ¬ Continuous (fun z : G × G ↦
        (z.1 : Matrix (Fin 2) (Fin 2) ℚ).trace *
          (z.2 : Matrix (Fin 2) (Fin 2) ℚ).trace -
            ((z.1 : Matrix (Fin 2) (Fin 2) ℚ) * z.2).trace) ∧
      (3 * 3 - (!![2, 0; 0, 1] * !![2, 0; 0, 1] :
        Matrix (Fin 2) (Fin 2) ℚ).trace = 4) ∧
      (3 * 3 - (!![1, 0; 0, 2] * !![2, 0; 0, 1] :
        Matrix (Fin 2) (Fin 2) ℚ).trace = 5) := sorry

/-- `E` is the coefficient change of `D` along `φ`: at every group element the characteristic
polynomial of `E` is the image of that of `D`. By `eq_of_charpoly_eq` this pins `E` as a
polynomial law, so it is the scalar extension of `D` along `φ` ([Chenevier], §1.1, pp. 6–7). -/
def IsCoefficientChange {G B : Type*} [Monoid G] [CommRing B]
    (D : Determinant A (MonoidAlgebra A G) d) (φ : A →+* B)
    (E : Determinant B (MonoidAlgebra B G) d) : Prop :=
  ∀ g : G, (D.charpoly (MonoidAlgebra.of A G g)).map φ = E.charpoly (MonoidAlgebra.of B G g)

-- Coefficient change along the identity.
example {G : Type*} [Monoid G] (D : Determinant A (MonoidAlgebra A G) d) :
    D.IsCoefficientChange (RingHom.id A) D := fun _ ↦ Polynomial.map_id

-- Rank zero keeps its constant value after reduction modulo two.
example :
    let D := ofMatrix (MonoidAlgebra.lift ℤ (Matrix (Fin 0) (Fin 0) ℤ) PUnit 1)
    let E := ofMatrix (MonoidAlgebra.lift (ZMod 2) (Matrix (Fin 0) (Fin 0) (ZMod 2)) PUnit 1)
    D.IsCoefficientChange (Int.castRingHom (ZMod 2)) E ∧ E.eval 0 = 1 := sorry

-- The eigenvalues `1, −1` coincide after reduction, with the same rank-two polynomial.
example :
    let ρ : ℤˣ →* Matrix (Fin 2) (Fin 2) ℤ :=
      { toFun := fun u ↦ !![1, 0; 0, (u : ℤ)], map_one' := sorry, map_mul' := sorry }
    let D := ofMatrix (MonoidAlgebra.lift ℤ _ _ ρ)
    let E := ofMatrix (MonoidAlgebra.lift (ZMod 2) _ _
      ((Int.castRingHom (ZMod 2)).mapMatrix.toMonoidHom.comp ρ))
    D.IsCoefficientChange (Int.castRingHom (ZMod 2)) E ∧
      D.charpoly (MonoidAlgebra.of ℤ ℤˣ (-1)) = X ^ 2 - 1 ∧
      E.charpoly (MonoidAlgebra.of (ZMod 2) ℤˣ (-1)) = X ^ 2 + 1 := sorry

-- Identity change retains `3` modulo four; reduction modulo two gives `1`.
example :
    let ρ : (ZMod 4)ˣ →* Matrix (Fin 1) (Fin 1) (ZMod 4) :=
      (algebraMap (ZMod 4) _).toMonoidHom.comp (Units.coeHom (ZMod 4))
    let D := ofMatrix (MonoidAlgebra.lift (ZMod 4) _ _ ρ)
    let φ : ZMod 4 →+* ZMod 2 := ZMod.castHom (by decide) (ZMod 2)
    let E := ofMatrix (MonoidAlgebra.lift (ZMod 2) _ _ (φ.mapMatrix.toMonoidHom.comp ρ))
    D.IsCoefficientChange (RingHom.id (ZMod 4)) D ∧ D.IsCoefficientChange φ E ∧
      D.eval (MonoidAlgebra.of (ZMod 4) (ZMod 4)ˣ (-1)) = 3 ∧
      E.eval (MonoidAlgebra.of (ZMod 2) (ZMod 4)ˣ (-1)) = 1 := sorry

end Determinant

section Pseudocharacter

variable {A : Type u} [CommRing A] {R : Type*} [Ring R] [Algebra A R]

/-- The product `x_i x_{σ i} x_{σ² i} ⋯` along the cycle of `σ` through `i`, starting at `i`. -/
def cycleProduct {n : ℕ} (σ : Equiv.Perm (Fin n)) (x : Fin n → R) (i : Fin n) : R :=
  ((List.range (Function.minimalPeriod σ i)).map fun k ↦ x ((σ ^ k) i)).prod

/-- `T^σ(x)`: one factor `T(·)` for each cycle of `σ` (taken at its least element), fixed points
included. -/
def cycleTerm {n : ℕ} (T : R → A) (σ : Equiv.Perm (Fin n)) (x : Fin n → R) : A :=
  ∏ i ∈ Finset.univ.filter (fun i ↦ ∀ j, σ.SameCycle i j → i ≤ j), T (cycleProduct σ x i)

/-- A `d`-dimensional pseudocharacter: an `A`-linear central `T` with `T(1) = d` and
`∑_{σ ∈ S_{d+1}} sgn(σ) T^σ(x₁, …, x_{d+1}) = 0` ([Chenevier], §1.10 and §1.26, pp. 12, 20; the
hypothesis `d! ∈ Aˣ` of that definition is carried by the comparison theorems instead). -/
def IsPseudocharacter (d : ℕ) (T : R →ₗ[A] A) : Prop :=
  T 1 = d ∧ (∀ x y : R, T (x * y) = T (y * x)) ∧
    ∀ x : Fin (d + 1) → R,
      ∑ σ : Equiv.Perm (Fin (d + 1)), (Equiv.Perm.sign σ : ℤ) • cycleTerm T σ x = 0

-- The identity cycle returns its chosen entry, even in a noncommutative algebra.
example {n : ℕ} (x : Fin n → R) (i : Fin n) : cycleProduct 1 x i = x i := by
  simp [cycleProduct]

-- Opposite starting points retain opposite word orders.
example (x : Fin 2 → R) : cycleProduct (Equiv.swap 0 1) x 0 = x 0 * x 1 := by
  have h : Function.minimalPeriod (Equiv.swap (0 : Fin 2) 1) 0 = 2 := by
    apply Function.minimalPeriod_eq_prime
    · decide
    · decide
  simp [cycleProduct, h, List.range_succ]

example (x : Fin 2 → R) : cycleProduct (Equiv.swap 0 1) x 1 = x 1 * x 0 := by
  have h : Function.minimalPeriod (Equiv.swap (0 : Fin 2) 1) 1 = 2 := by
    apply Function.minimalPeriod_eq_prime
    · decide
    · decide
  simp [cycleProduct, h, List.range_succ]

-- An empty cycle family gives the empty product; identity cycles give two factors.
example (T : R → A) (x : Fin 0 → R) : cycleTerm T 1 x = 1 := by
  simp [cycleTerm]

example (T : R → A) (x : Fin 2 → R) : cycleTerm T 1 x = T (x 0) * T (x 1) := by
  simp [cycleTerm, cycleProduct, Fin.prod_univ_succ]

-- A transposition has one cycle, so one factor: `T^{(0 1)}(x₀, x₁) = T(x₀x₁)`.
example (T : R → A) (x : Fin 2 → R) : cycleTerm T (Equiv.swap 0 1) x = T (x 0 * x 1) := sorry

-- The identity of `ℚ` is a `1`-dimensional pseudocharacter.
example : IsPseudocharacter 1 (LinearMap.id : ℚ →ₗ[ℚ] ℚ) := sorry

-- The trace on `M₂(ℚ)` is not `1`-dimensional: `T(1) = 2`.
example : ¬ IsPseudocharacter 1 (Matrix.traceLinearMap (Fin 2) ℚ ℚ) := sorry

/-- The trace of a determinant is a pseudocharacter, over any `A` ([Chenevier], Lemma 1.12(iii),
pp. 12–14). -/
theorem Determinant.isPseudocharacter_trace {d : ℕ} (D : Determinant A R d) :
    IsPseudocharacter d D.traceLinear := sorry

/-- If `d!` is a unit, a determinant is determined by its trace ([Chenevier], Proposition 1.27,
p. 20). -/
theorem Determinant.injective_trace {d : ℕ} (hd : IsUnit (d.factorial : A)) :
    Function.Injective fun D : Determinant A R d ↦ D.traceLinear := sorry

/-- Over a `ℚ`-algebra every pseudocharacter is the trace of a unique determinant ([Chenevier],
Proposition 1.27, p. 20). -/
theorem Determinant.exists_unique_trace_eq [Algebra ℚ A] {d : ℕ} (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.traceLinear = T := sorry

/-- The same when `(2d)!` is a unit, or `d = 2` and `2` is a unit ([Chenevier], Proposition 1.29,
pp. 20–22). -/
theorem Determinant.exists_unique_trace_eq_of_isUnit {d : ℕ}
    (hd : IsUnit ((2 * d).factorial : A) ∨ (d = 2 ∧ IsUnit (2 : A))) (T : R →ₗ[A] A)
    (hT : IsPseudocharacter d T) : ∃! D : Determinant A R d, D.traceLinear = T := sorry

end Pseudocharacter

/-! ## Layer IHG.3a: Hecke polynomial and multiplier conventions -/

namespace Spherical

variable {A : Type u} [CommRing A]

/-- The integral `GL_n` Hecke polynomial `∑_{i=0}^n (−1)^i q^{i(i−1)/2} T_i X^{n−i}` ([ACC],
§2.2.5, equation (2.2.6), p. 922). -/
def glnPolynomial (n : ℕ) (q : A) (T : Fin (n + 1) → A) : A[X] :=
  ∑ i : Fin (n + 1), C ((-1) ^ i.val * q ^ (i.val * (i.val - 1) / 2) * T i) * X ^ (n - i.val)

-- Rank zero is constant one, including at `q = 0`.
example : glnPolynomial 0 (0 : ℤ) ![1] = 1 := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]

-- In characteristic two at `q = 0`, the signed middle coefficient is `1`.
example : glnPolynomial 2 (0 : ZMod 2) ![1, 1, 1] = X ^ 2 + X := by
  simp [glnPolynomial, Fin.sum_univ_succ, CharTwo.neg_eq]

-- Rank one carries no power of `q`.
example : glnPolynomial 1 (7 : ℤ) ![1, 3] = X - 3 := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]; ring

-- Rank two: both signs and the first nonzero exponent of `q`.
example : glnPolynomial 2 (2 : ℤ) ![1, 3, 5] = X ^ 2 - 3 * X + 10 := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]; ring

-- The normalisation `T₀ = 1` is needed for monicity.
example : ¬ (glnPolynomial 0 (1 : ℤ) ![0]).Monic := by
  simp [glnPolynomial, Polynomial.Monic]

/-- Normalised Satake coefficients: with `q = s²` and `T_i = s^{i(n−i)} e_i(z)`, the Hecke
polynomial is `∏_j (X − s^{n−1} z_j)`, over any commutative ring ([ACC], §2.2.5,
equation (2.2.6), pp. 921–922). -/
theorem glnPolynomial_satake (n : ℕ) (s : A) (z : Fin n → A) :
    glnPolynomial n (s ^ 2) (fun i ↦ s ^ (i.val * (n - i.val)) *
      ∑ I ∈ (Finset.univ : Finset (Fin n)).powersetCard i.val, ∏ j ∈ I, z j) =
      ∏ j : Fin n, (X - C (s ^ (n - 1) * z j)) := sorry

-- `q = 4`, `s = 2` and parameters `3, 5` give roots `6, 10`.
example : glnPolynomial 2 (4 : ℤ) ![1, 16, 15] = (X - 6) * (X - 10) := by
  norm_num [glnPolynomial, Fin.sum_univ_succ]; ring

/-- The monic `GSp₄` spin polynomial `X⁴ − T₁X³ + (qT₂ + (q³+q)T₀)X² − q³T₀T₁X + q⁶T₀²`: the
reflection of `SmoothRepresentationsOfLocalGroups.SpinPolynomial`, whose `T1, T2` are `T₂, T₁`
here ([BCGP], the polynomial `Q_ℓ` of §1.8.8, p. 16). -/
def gsp4SpinPolynomial (q T₀ T₁ T₂ : A) : A[X] :=
  Polynomial.reflect 4 (SmoothRepresentationsOfLocalGroups.SpinPolynomial q T₀ T₂ T₁)

-- `T₁ = 3`, `T₂ = 5` detect the exchanged indices of the supplier.
example : gsp4SpinPolynomial (2 : ℤ) 1 3 5 = X ^ 4 - 3 * X ^ 3 + 20 * X ^ 2 - 24 * X + 64 := by
  rw [gsp4SpinPolynomial, SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal]
  norm_num

-- The identity parameters give four unit roots.
example : gsp4SpinPolynomial (1 : ℤ) 1 4 4 = (X - 1) ^ 4 := by
  rw [gsp4SpinPolynomial, SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal]
  norm_num; ring

-- At `q = 0`, only the two leading terms survive.
example : gsp4SpinPolynomial (0 : ℤ) 1 3 5 = X ^ 4 - 3 * X ^ 3 := by
  rw [gsp4SpinPolynomial, SmoothRepresentationsOfLocalGroups.SpinPolynomial.reciprocal]
  norm_num

/-- The scaled dual spin polynomial
`X⁴ − T₀⁻¹T₁X³ + T₀⁻²(qT₂ + (q³+q)T₀)X² − q³T₀⁻²T₁X + q⁶T₀⁻²`, whose roots are `q³` divided by the
spin roots ([BCGP], Lemma 1.8.28, p. 17). -/
def gsp4DualSpinPolynomial (q : A) (T₀ : Aˣ) (T₁ T₂ : A) : A[X] :=
  X ^ 4 - C ((↑T₀⁻¹) * T₁) * X ^ 3 + C ((↑T₀⁻¹) ^ 2 * (q * T₂ + (q ^ 3 + q) * ↑T₀)) * X ^ 2 -
    C (q ^ 3 * (↑T₀⁻¹) ^ 2 * T₁) * X + C (q ^ 6 * (↑T₀⁻¹) ^ 2)

-- Unit parameters in the dual polynomial also give four unit roots.
example : gsp4DualSpinPolynomial (1 : ℚ) 1 4 4 = (X - 1) ^ 4 := by
  norm_num [gsp4DualSpinPolynomial, Polynomial.C_ofNat]; ring

-- A nontrivial central unit still scales the cubic term at `q = 0`.
example : gsp4DualSpinPolynomial (0 : ℚ) (Units.mk0 2 (by norm_num)) 3 5 =
    X ^ 4 - C (3 / 2) * X ^ 3 := by
  norm_num [gsp4DualSpinPolynomial]

/-- `P(X) Q(0) = X⁴ Q(q³/X)`, coefficient by coefficient ([BCGP], Lemma 1.8.28, p. 17). -/
theorem gsp4DualSpinPolynomial_reciprocal (q T₀ : Aˣ) (T₁ T₂ : A) (i : ℕ) (hi : i ≤ 4) :
    (gsp4DualSpinPolynomial (q : A) T₀ T₁ T₂).coeff i * ((q : A) ^ 6 * (T₀ : A) ^ 2) =
      (gsp4SpinPolynomial (q : A) T₀ T₁ T₂).coeff (4 - i) * (q : A) ^ (3 * (4 - i)) := sorry

-- `q = T₀ = 2`: a genuinely different monic polynomial from the spin polynomial.
example : gsp4DualSpinPolynomial (2 : ℚ) (Units.mk0 2 (by norm_num)) 3 5 =
    X ^ 4 - C (3 / 2) * X ^ 3 + C (15 / 2) * X ^ 2 - C 6 * X + C 16 := by
  norm_num [gsp4DualSpinPolynomial]

end Spherical

namespace Determinant

variable {A : Type u} [CommRing A] {d : ℕ}

/-- The top coefficient of the Hecke polynomial is the determinant: if `χ_D(r) = P` then
`D(r) = q^{d(d−1)/2} T_d`, including degree zero ([ACC], §2.2.5, equation (2.2.6), p. 922). -/
theorem eval_eq_of_charpoly_eq_glnPolynomial {R : Type*} [Ring R] [Algebra A R]
    (D : Determinant A R d) (r : R) (q : A) (T : Fin (d + 1) → A)
    (h : D.charpoly r = Spherical.glnPolynomial d q T) :
    D.eval r = q ^ (d * (d - 1) / 2) * T (Fin.last d) := sorry

/-- Character twist: the coefficient of `X^{d−i}` at `a • r` is `aⁱ` times that at `r`
([ACC], §2.2.20–24, pp. 932–934). -/
theorem charpoly_smul_coeff {R : Type*} [Ring R] [Algebra A R] (D : Determinant A R d) (r : R)
    (a : A) (i : ℕ) (hi : i ≤ d) :
    (D.charpoly (a • r)).coeff (d - i) = a ^ i * (D.charpoly r).coeff (d - i) := sorry

/-- The polynomial at `g⁻¹` is the normalised reciprocal of the polynomial at `g`, which converts
between arithmetic and geometric Frobenius ([ACC], §2.2.20, p. 932). -/
theorem reciprocal_charpoly {G : Type*} [Group G] (D : Determinant A (MonoidAlgebra A G) d)
    (g : G) (i : ℕ) (hi : i ≤ d) :
    (D.charpoly (MonoidAlgebra.of A G g⁻¹)).coeff i *
        (D.charpoly (MonoidAlgebra.of A G g)).coeff 0 =
      (D.charpoly (MonoidAlgebra.of A G g)).coeff (d - i) := sorry

/-- Geometric-Frobenius dual-spin conversion: if the polynomial at `g` is the spin polynomial,
then the polynomial of `D∨ ⊗ ε⁻³` at `g`, that is of `D` at `q³ • g⁻¹`, is the dual spin
polynomial ([BCGP], Lemma 1.8.28, p. 17). -/
theorem charpoly_dualSpin {G : Type*} [Group G] (D : Determinant A (MonoidAlgebra A G) 4) (g : G)
    (q T₀ : Aˣ) (T₁ T₂ : A)
    (h : D.charpoly (MonoidAlgebra.of A G g) = Spherical.gsp4SpinPolynomial (q : A) T₀ T₁ T₂) :
    D.charpoly ((q : A) ^ 3 • MonoidAlgebra.of A G g⁻¹) =
      Spherical.gsp4DualSpinPolynomial (q : A) T₀ T₁ T₂ := sorry

end Determinant

/-- Full similitude under duality and twist: if `rᵀ J r = μ J`, then `θ r⁻ᵀ` preserves `J⁻¹` up to
`μ⁻¹ θ²`, in every size ([BCGP], §1.8.7–8 and Lemma 1.8.28, pp. 9–10, 16–17). -/
theorem similitude_dual_twist {A : Type u} [CommRing A] {n : ℕ}
    (r J : (Matrix (Fin n) (Fin n) A)ˣ) (μ θ : Aˣ)
    (h : (r : Matrix (Fin n) (Fin n) A).transpose * J * r =
      (μ : A) • (J : Matrix (Fin n) (Fin n) A)) :
    ((θ : A) • (↑r⁻¹ : Matrix (Fin n) (Fin n) A).transpose).transpose *
        (↑J⁻¹ : Matrix (Fin n) (Fin n) A) *
        ((θ : A) • (↑r⁻¹ : Matrix (Fin n) (Fin n) A).transpose) =
      ((↑μ⁻¹ : A) * (θ : A) ^ 2) • (↑J⁻¹ : Matrix (Fin n) (Fin n) A) := sorry

-- The determinant `μ²` does not determine the multiplier: `1 ≠ −1` in `ℤ/4`, with equal squares.
example : (1 : ZMod 4) ^ 2 = (-1 : ZMod 4) ^ 2 ∧ (1 : ZMod 4) ≠ -1 := by decide

/-! ## Layer IHG.1: reconstruction and coefficient descent -/

/-- The vector module `Kᵈ` of a matrix representation `ρ : R → M_d(K)`, through
`M_d(K) ≃ End(Kᵈ)` and restriction of scalars. -/
def matrixModule {K R : Type u} [CommRing K] [Ring R] [Algebra K R] {d : ℕ}
    (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) : ModuleCat R :=
  letI := Module.compHom (Fin d → K) (Matrix.toLinAlgEquiv'.toAlgHom.comp ρ).toRingHom
  ModuleCat.of R (Fin d → K)

-- `r` acts by multiplication by the matrix `ρ r`.
example {K R : Type u} [CommRing K] [Ring R] [Algebra K R] {d : ℕ}
    (ρ : R →ₐ[K] Matrix (Fin d) (Fin d) K) (r : R) (x : Fin d → K) :
    r • (show matrixModule ρ from x) = (show matrixModule ρ from (ρ r).mulVec x) := rfl

-- Simplicity includes nontriviality: the zero-dimensional representation is not simple.
example : ¬ IsSimpleModule (Matrix (Fin 0) (Fin 0) ℚ)
    (matrixModule (AlgHom.id ℚ (Matrix (Fin 0) (Fin 0) ℚ))) := sorry

-- The positive-dimensional natural matrix action is simple and semisimple.
example {k : Type u} [Field k] (d : ℕ) (hd : 0 < d) :
    IsSimpleModule (Matrix (Fin d) (Fin d) k)
      (matrixModule (AlgHom.id k (Matrix (Fin d) (Fin d) k))) ∧
    IsSemisimpleModule (Matrix (Fin d) (Fin d) k)
      (matrixModule (AlgHom.id k (Matrix (Fin d) (Fin d) k))) := sorry

-- A scalar action on two copies of a field is semisimple but reducible.
example :
    let ρ : ℚ →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ := Algebra.ofId ℚ _
    ¬ IsSimpleModule ℚ (matrixModule ρ) ∧ IsSemisimpleModule ℚ (matrixModule ρ) := sorry

/-- A family of matrices `ρ : G → M_d(k)` over a field (the image of a representation) is
absolutely irreducible: `d > 0`, and after every extension to an algebraically closed field no
proper nonzero subspace is stable. -/
def IsAbsolutelyIrreducible {k G : Type u} [Field k] {d : ℕ}
    (ρ : G → Matrix (Fin d) (Fin d) k) : Prop :=
  0 < d ∧ ∀ (L : Type u) [Field L] [IsAlgClosed L] [Algebra k L] (W : Submodule L (Fin d → L)),
    (∀ g, ∀ x ∈ W, ((ρ g).map (algebraMap k L)).mulVec x ∈ W) → W = ⊥ ∨ W = ⊤

-- Two copies of the trivial character are not absolutely irreducible.
example : ¬ IsAbsolutelyIrreducible fun _ : Unit ↦ (1 : Matrix (Fin 2) (Fin 2) ℚ) := sorry

-- A character is absolutely irreducible.
example (χ : ℤ → ℚ) :
    IsAbsolutelyIrreducible fun n ↦ (Matrix.of ![![χ n]] : Matrix (Fin 1) (Fin 1) ℚ) := sorry

/-- Semisimple reconstruction over an algebraically closed field: every `d`-dimensional
determinant, `d ≥ 1`, is `det ∘ ρ` for a semisimple `ρ : R → M_d(k)` with the same kernel, unique up
to conjugation; no factorial is inverted ([Chenevier], Theorem 2.12, pp. 28–31). -/
theorem Determinant.exists_semisimple_ofMatrix_eq {k R : Type u} [Field k] [IsAlgClosed k]
    [Ring R] [Algebra k R] (d : ℕ) (hd : 0 < d) (D : Determinant k R d) :
    ∃ ρ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
      Determinant.ofMatrix ρ = D ∧ IsSemisimpleModule R (matrixModule ρ) ∧
      (∀ r, ρ r = 0 ↔ r ∈ PolynomialLaw.ker D.toLaw) ∧
      ∀ σ : R →ₐ[k] Matrix (Fin d) (Fin d) k,
        Determinant.ofMatrix σ = D → IsSemisimpleModule R (matrixModule σ) →
        ∃ P : (Matrix (Fin d) (Fin d) k)ˣ, ∀ x,
          σ x = (P : Matrix (Fin d) (Fin d) k) * ρ x * (↑P⁻¹ : Matrix (Fin d) (Fin d) k) := sorry

/-- Henselian reconstruction: over a henselian local ring, a determinant on `A[G]` whose reduction
is the determinant of an absolutely irreducible representation over the residue field is the
determinant of a representation `A[G] → M_d(A)`, unique up to conjugation ([Chenevier], Theorem
2.22(i), p. 34, applied to `A[G]/CH(D)` for existence; uniqueness by inner conjugacy of
automorphisms of `M_d(A)` over a local ring, [Allen–Newton–Thorne], proof of Theorem 2.4, p. 5). -/
theorem Determinant.exists_ofMatrix_eq_of_henselian {A G : Type u} [CommRing A]
    [HenselianLocalRing A] [Group G] {d : ℕ} (D : Determinant A (MonoidAlgebra A G) d)
    (ρbar : MonoidAlgebra (IsLocalRing.ResidueField A) G →ₐ[IsLocalRing.ResidueField A]
      Matrix (Fin d) (Fin d) (IsLocalRing.ResidueField A))
    (hIrr : IsAbsolutelyIrreducible fun g : G ↦ ρbar (MonoidAlgebra.of _ G g))
    (hres : D.IsCoefficientChange (IsLocalRing.residue A) (Determinant.ofMatrix ρbar)) :
    ∃ ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A, Determinant.ofMatrix ρ = D ∧
      ∀ σ : MonoidAlgebra A G →ₐ[A] Matrix (Fin d) (Fin d) A, Determinant.ofMatrix σ = D →
        ∃ P : (Matrix (Fin d) (Fin d) A)ˣ, ∀ x,
          σ x = (P : Matrix (Fin d) (Fin d) A) * ρ x * (↑P⁻¹ : Matrix (Fin d) (Fin d) A) := sorry

/-- Absolutely irreducible coefficient descent: for complete noetherian local rings `A ⊆ B` with
the same residue field, a continuous `ρ : G → GL_d(B)` of a profinite group with absolutely
irreducible reduction and all traces in `A` is conjugate by `1 + M_d(m_B)` into `GL_d(A)` ([CHT],
Lemma 2.1.10, pp. 13–15). -/
theorem coefficient_descent {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B]
    [IsLocalRing A] [IsLocalRing B] [IsNoetherianRing A] [IsNoetherianRing B]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace B] (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    [IsTopologicalGroup G] {d : ℕ}
    (hinj : Function.Injective (algebraMap A B))
    (e : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (he : ∀ a : A, IsLocalRing.residue B (algebraMap A B a) = e (IsLocalRing.residue A a))
    (ρ : G →* (Matrix (Fin d) (Fin d) B)ˣ)
    (hρ : Continuous fun g ↦ (ρ g : Matrix (Fin d) (Fin d) B))
    (hIrr : IsAbsolutelyIrreducible fun g ↦
      (ρ g : Matrix (Fin d) (Fin d) B).map (IsLocalRing.residue B))
    (htrace : ∀ g, ∃ a : A, (ρ g : Matrix (Fin d) (Fin d) B).trace = algebraMap A B a) :
    ∃ (ρA : G →* (Matrix (Fin d) (Fin d) A)ˣ) (P : (Matrix (Fin d) (Fin d) B)ˣ),
      (∀ i j, (P : Matrix (Fin d) (Fin d) B) i j - (1 : Matrix (Fin d) (Fin d) B) i j ∈
        IsLocalRing.maximalIdeal B) ∧
      ∀ g, (ρA g : Matrix (Fin d) (Fin d) A).map (algebraMap A B) =
        (P : Matrix (Fin d) (Fin d) B) * ρ g * (↑P⁻¹ : Matrix (Fin d) (Fin d) B) := sorry

/-- Symplectic coefficient descent with prescribed multiplier: in the setting of
`coefficient_descent` with `d = 4`, residue characteristic `p > 2`, a nondegenerate alternating
form `J` over `A` and a continuous multiplier `ν : G → Aˣ` with `ρᵀ J ρ = ν J` over `B`, the
descended representation keeps the form and the multiplier, and the conjugator is a similitude
congruent to `1` modulo `m_B` ([Gee–Geraghty], Lemma 7.1.1 and proof, p. 25). -/
theorem symplectic_coefficient_descent {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B]
    [IsLocalRing A] [IsLocalRing B] [IsNoetherianRing A] [IsNoetherianRing B]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [IsAdicComplete (IsLocalRing.maximalIdeal B) B]
    [TopologicalSpace A] [TopologicalSpace B] (hAadic : IsAdic (IsLocalRing.maximalIdeal A))
    (hBadic : IsAdic (IsLocalRing.maximalIdeal B))
    [Group G] [TopologicalSpace G] [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    [IsTopologicalGroup G] (hinj : Function.Injective (algebraMap A B))
    (e : IsLocalRing.ResidueField A ≃+* IsLocalRing.ResidueField B)
    (he : ∀ a : A, IsLocalRing.residue B (algebraMap A B a) = e (IsLocalRing.residue A a))
    (p : ℕ) [CharP (IsLocalRing.ResidueField A) p] (hp : 2 < p)
    (ρ : G →* (Matrix (Fin 4) (Fin 4) B)ˣ)
    (hρ : Continuous fun g ↦ (ρ g : Matrix (Fin 4) (Fin 4) B))
    (hIrr : IsAbsolutelyIrreducible fun g ↦
      (ρ g : Matrix (Fin 4) (Fin 4) B).map (IsLocalRing.residue B))
    (htrace : ∀ g, ∃ a : A, (ρ g : Matrix (Fin 4) (Fin 4) B).trace = algebraMap A B a)
    (ν : G →* Aˣ) (hν : Continuous fun g ↦ (ν g : A))
    (form : Matrix (Fin 4) (Fin 4) A) (hnondegenerate : IsUnit form)
    (halternating : ∀ x : Fin 4 → A, dotProduct x (form.mulVec x) = 0)
    (hform : ∀ g, (ρ g : Matrix (Fin 4) (Fin 4) B).transpose * form.map (algebraMap A B) *
      (ρ g : Matrix (Fin 4) (Fin 4) B) = algebraMap A B (ν g) • form.map (algebraMap A B)) :
    ∃ (ρA : G →* (Matrix (Fin 4) (Fin 4) A)ˣ) (P : (Matrix (Fin 4) (Fin 4) B)ˣ),
      Continuous (fun g ↦ (ρA g : Matrix (Fin 4) (Fin 4) A)) ∧
      (∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).transpose * form * (ρA g : Matrix (Fin 4) (Fin 4) A) =
        (ν g : A) • form) ∧
      (∀ i j, (P : Matrix (Fin 4) (Fin 4) B) i j - (1 : Matrix (Fin 4) (Fin 4) B) i j ∈
        IsLocalRing.maximalIdeal B) ∧
      (∃ μ : Bˣ, (P : Matrix (Fin 4) (Fin 4) B).transpose * form.map (algebraMap A B) *
        (P : Matrix (Fin 4) (Fin 4) B) = (μ : B) • form.map (algebraMap A B)) ∧
      ∀ g, (ρA g : Matrix (Fin 4) (Fin 4) A).map (algebraMap A B) =
        (P : Matrix (Fin 4) (Fin 4) B) * ρ g * (↑P⁻¹ : Matrix (Fin 4) (Fin 4) B) := sorry

/-! ## Layer IHG.2: integral and derived Hecke actions -/

namespace HeckeImage

open CategoryTheory

variable {A : Type u} [CommRing A]

local instance : HasDerivedCategory.{u + 1} (ModuleCat.{u} A) :=
  HasDerivedCategory.standard (ModuleCat.{u} A)

/-- `C` has cohomology only in degrees `[a, b]`. -/
def Supported (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) : Prop :=
  ∀ i : ℤ, i < a ∨ b < i →
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)

/-- Every cohomology module of `C` is finitely generated. -/
def FiniteCohomology (C : DerivedCategory (ModuleCat.{u} A)) : Prop :=
  ∀ i : ℤ, Module.Finite A ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj C)

-- `(ℤ²)[0]` is supported on `[0,0]` and on `[−1,3]` but not on `[1,1]`.
example : let C := (DerivedCategory.singleFunctor (ModuleCat.{0} ℤ) 0).obj (.of ℤ (Fin 2 → ℤ))
    Supported C 0 0 ∧ Supported C (-1) 3 ∧ ¬ Supported C 1 1 := sorry

-- An object supported on `[1,0]` is zero.
example (C : DerivedCategory (ModuleCat.{u} A)) (hC : Supported C 1 0) : Limits.IsZero C := sorry

-- `ℤ[0]` has finite cohomology while `(⊕_{n∈ℕ} ℤ)[0]` does not.
example : let F := DerivedCategory.singleFunctor (ModuleCat.{0} ℤ) 0
    FiniteCohomology (F.obj (.of ℤ ℤ)) ∧ ¬ FiniteCohomology (F.obj (.of ℤ (ℕ →₀ ℤ))) := sorry

-- Every object supported on an empty interval has finite cohomology.
example (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) (hab : b < a) (hC : Supported C a b) :
    FiniteCohomology C := sorry

/-- An endomorphism is a ghost if it acts by zero on every cohomology module. -/
def IsGhost {C : DerivedCategory (ModuleCat.{u} A)} (f : End C) : Prop :=
  ∀ i : ℤ, (DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).map f = 0

-- The zero endomorphism is a ghost.
example (C : DerivedCategory (ModuleCat.{u} A)) : IsGhost (0 : End C) :=
  fun _ ↦ Functor.map_zero _ _ _

-- Scalar two on `ℤ[0]` induces nonzero multiplication on cohomology.
example :
    let C := (DerivedCategory.singleFunctor (ModuleCat.{0} ℤ) 0).obj (.of ℤ ℤ)
    ¬ IsGhost (2 • (𝟙 C)) := sorry

-- The nonzero `Ext¹_ℤ(𝔽₂,𝔽₂)` block is a square-zero ghost across two degrees.
example :
    let F := DerivedCategory.singleFunctor (ModuleCat.{0} ℤ)
    let C := Limits.biprod ((F 0).obj (.of ℤ (ZMod 2))) ((F 1).obj (.of ℤ (ZMod 2)))
    ∃ f : End C, f ≠ 0 ∧ f * f = 0 ∧ IsGhost f := sorry

/-- Over a noetherian ring, `Hom(M, N)` is finite for bounded `M, N` with finite cohomology; no
finite projective dimension is assumed ([Boxer–Pilloni], proof of Lemma 2.4.3, p. 18). -/
theorem derived_hom_finite [IsNoetherianRing A] (M N : DerivedCategory (ModuleCat.{u} A))
    (a b c e : ℤ) (hM : Supported M a b) (hN : Supported N c e)
    (hfinM : FiniteCohomology M) (hfinN : FiniteCohomology N) : Module.Finite A (M ⟶ N) := sorry

/-- Ghost nilpotence: if `C` is supported in `[a, b]`, every ordered product of `b − a + 1` ghosts
vanishes ([ACC], proof of Lemma 2.2.4, pp. 920–921). -/
theorem ghost_nilpotence (C : DerivedCategory (ModuleCat.{u} A)) (a b : ℤ) (hab : a ≤ b)
    (hC : Supported C a b) (fs : Fin ((b - a).toNat + 1) → End C) (hfs : ∀ i, IsGhost (fs i)) :
    (List.ofFn fs).prod = 0 := sorry

/-- For a commutative Hecke action `α` on `C` supported in `[a, b]`, an ideal acting by ghosts has
`(b − a + 1)`-st power in `ker α` ([ACC], Lemma 2.2.4, p. 920). -/
theorem action_annihilator_power {H : Type u} [CommRing H] [Algebra A H]
    (C : DerivedCategory (ModuleCat.{u} A)) (α : H →ₐ[A] End C) (a b : ℤ) (hab : a ≤ b)
    (hC : Supported C a b) (I : Ideal H) (hI : ∀ h ∈ I, IsGhost (α h)) :
    I ^ ((b - a).toNat + 1) ≤ RingHom.ker α.toRingHom := sorry

/-- Idempotents split in `D(A)`, so `C ≅ eC ⊕ (1 − e)C` for every idempotent endomorphism `e`
([Bökstedt–Neeman], Corollary 1.7, p. 213, and Proposition 3.2, pp. 221–222). -/
theorem exists_idempotent_splitting (C : DerivedCategory (ModuleCat.{u} A)) (e : End C)
    (he : e * e = e) :
    ∃ (Ce : DerivedCategory (ModuleCat.{u} A)) (i : Ce ⟶ C) (p : C ⟶ Ce),
      i ≫ p = 𝟙 Ce ∧ p ≫ i = e := sorry

/-- A finite commutative algebra over a complete noetherian local ring is a finite (possibly empty)
product of finite complete noetherian local algebras ([Stacks], Lemma 10.160.2, tag 0325). -/
theorem finite_local_factors [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (T : Type u) [CommRing T] [Algebra A T] [Module.Finite A T] :
    ∃ (s : ℕ) (factor : Fin s → CommAlgCat.{u} A),
      (∀ i, Module.Finite A (factor i) ∧ IsNoetherianRing (factor i) ∧
        ∃ h : IsLocalRing (factor i), letI := h
          IsAdicComplete (IsLocalRing.maximalIdeal (factor i)) (factor i)) ∧
      Nonempty (T ≃ₐ[A] ∀ i, factor i) := sorry

-- On a complex concentrated in one degree every ghost vanishes.
example (C : DerivedCategory (ModuleCat.{u} A)) (a : ℤ) (hC : Supported C a a) (f : End C)
    (hf : IsGhost f) : f = 0 := sorry

end HeckeImage

/-! ## Layer IHG.3b: residual maximal ideals of Galois type -/

namespace Spherical

attribute [local instance] Ideal.Quotient.field

/-- `m` is of Galois type for the Frobenius polynomials `P`: some continuous semisimple
`ρ : G → GL_n(T/m)` has characteristic polynomial `P v` at `Frob v` ([ACC], Definition 2.3.6,
p. 938). -/
def IsGaloisType {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)]
    [DiscreteTopology (T ⧸ m)] (n : ℕ) (Frob : V → G) (P : V → (T ⧸ m)[X]) : Prop :=
  ∃ ρ : MonoidAlgebra (T ⧸ m) G →ₐ[T ⧸ m] Matrix (Fin n) (Fin n) (T ⧸ m),
    Continuous (fun g : G ↦ ρ (MonoidAlgebra.of (T ⧸ m) G g)) ∧
      IsSemisimpleModule (MonoidAlgebra (T ⧸ m) G) (matrixModule ρ) ∧
      ∀ v, (ρ (MonoidAlgebra.of (T ⧸ m) G (Frob v))).charpoly = P v

/-- `m` is non-Eisenstein: the realising representation can be taken absolutely irreducible
([ACC], Definition 2.3.6, p. 938). -/
def IsNonEisenstein {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G]
    (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)]
    [DiscreteTopology (T ⧸ m)] (n : ℕ) (Frob : V → G) (P : V → (T ⧸ m)[X]) : Prop :=
  ∃ ρ : MonoidAlgebra (T ⧸ m) G →ₐ[T ⧸ m] Matrix (Fin n) (Fin n) (T ⧸ m),
    Continuous (fun g : G ↦ ρ (MonoidAlgebra.of (T ⧸ m) G g)) ∧
      IsSemisimpleModule (MonoidAlgebra (T ⧸ m) G) (matrixModule ρ) ∧
      IsAbsolutelyIrreducible (fun g : G ↦ ρ (MonoidAlgebra.of (T ⧸ m) G g)) ∧
      ∀ v, (ρ (MonoidAlgebra.of (T ⧸ m) G (Frob v))).charpoly = P v

-- The trivial group realizes the rank-zero, rank-one and doubled-line systems over `𝔽₂`.
example : IsGaloisType (⊥ : Ideal (ZMod 2)) 0 (fun _ : Unit ↦ (1 : PUnit))
    (fun _ ↦ 1) := sorry

example : IsGaloisType (⊥ : Ideal (ZMod 2)) 1 (fun _ : Unit ↦ (1 : PUnit))
    (fun _ ↦ X - 1) := sorry

example : IsGaloisType (⊥ : Ideal (ZMod 2)) 2 (fun _ : Unit ↦ (1 : PUnit))
    (fun _ ↦ (X - 1) ^ 2) := sorry

-- The trivial line is absolutely irreducible; the doubled line is not.
example : IsNonEisenstein (⊥ : Ideal (ZMod 2)) 1 (fun _ : Unit ↦ (1 : PUnit))
    (fun _ ↦ X - 1) := sorry

example : ¬ IsNonEisenstein (⊥ : Ideal (ZMod 2)) 2 (fun _ : Unit ↦ (1 : PUnit))
    (fun _ ↦ (X - 1) ^ 2) := sorry

-- At a Frobenius element equal to `1` the observed polynomial is `(X − 1)ⁿ`.
example {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G] (m : Ideal T) [m.IsMaximal]
    [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ) (Frob : V → G)
    (P : V → (T ⧸ m)[X]) (h : IsGaloisType m n Frob P) (v : V) (hv : Frob v = 1) :
    P v = (X - 1) ^ n := sorry

-- Rank zero is allowed for Galois type but not for non-Eisenstein ideals.
example {T G V : Type u} [CommRing T] [Group G] [TopologicalSpace G] (m : Ideal T) [m.IsMaximal]
    [Finite (T ⧸ m)] [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (Frob : V → G)
    (P : V → (T ⧸ m)[X]) : ¬ IsNonEisenstein m 0 Frob P := sorry

/-- A non-Eisenstein ideal is of Galois type, with the same realising representation. -/
theorem IsNonEisenstein.isGaloisType {T G V : Type u} [CommRing T] [Group G]
    [TopologicalSpace G] (m : Ideal T) [m.IsMaximal] [Finite (T ⧸ m)]
    [TopologicalSpace (T ⧸ m)] [DiscreteTopology (T ⧸ m)] (n : ℕ)
    (Frob : V → G) (P : V → (T ⧸ m)[X]) (h : IsNonEisenstein m n Frob P) :
    IsGaloisType m n Frob P := by
  obtain ⟨ρ, hc, hs, _, hp⟩ := h
  exact ⟨ρ, hc, hs, hp⟩

end Spherical

/-! ## Layer IHG.4: interpolation over integral coefficient rings -/

namespace Determinant

variable {A : Type u} [CommRing A] {d : ℕ}

/-- Two continuous determinants over a Hausdorff ring with the same characteristic polynomials at
a family of elements whose conjugates are dense are equal ([Chenevier], Lemma 1.12(ii) and §2.30,
pp. 12, 37; [Scholze], Corollary 5.1.10, p. 1037). -/
theorem eq_of_charpoly_frobenius {G V : Type*} [Group G] [TopologicalSpace G] [TopologicalSpace A]
    [T2Space A] (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g = h * Frob v * h⁻¹})
    (D E : Determinant A (MonoidAlgebra A G) d) (hD : D.IsContinuous) (hE : E.IsContinuous)
    (h : ∀ v, D.charpoly (MonoidAlgebra.of A G (Frob v)) =
      E.charpoly (MonoidAlgebra.of A G (Frob v))) :
    D = E := sorry

/-- Compact gluing: for compact Hausdorff `A` and a jointly injective family of continuous maps
`φ_i : A → B_i` to Hausdorff rings, continuous determinants `D_i` whose coefficients on a dense set
lift to one element of `A` come from a unique continuous determinant over `A` ([Chenevier],
Example 2.32 and Corollary 1.14, pp. 38, 14). -/
theorem existsUnique_isCoefficientChange_of_compact {G : Type*} [Group G] [TopologicalSpace G]
    [TopologicalSpace A] [CompactSpace A] [T2Space A]
    (ι : Type*) (B : ι → Type u) [∀ i, CommRing (B i)] [∀ i, TopologicalSpace (B i)]
    [∀ i, T2Space (B i)] (φ : ∀ i, A →+* B i)
    (hinj : Function.Injective fun a : A ↦ fun i ↦ φ i a) (hφ : ∀ i, Continuous (φ i))
    (D : ∀ i, Determinant (B i) (MonoidAlgebra (B i) G) d) (hD : ∀ i, (D i).IsContinuous)
    (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : A, ∀ i,
      ((D i).charpoly (MonoidAlgebra.of (B i) G g)).coeff k = φ i a) :
    ∃! E : Determinant A (MonoidAlgebra A G) d,
      E.IsContinuous ∧ ∀ i, E.IsCoefficientChange (φ i) (D i) := sorry

/-- Integral interpolation: let `A` be separated and complete for a descending chain of ideals
`J_r` that form a basis of neighbourhoods of `0`, and let `D_r` be determinants over `A/J_r` with
locally constant coefficients and prescribed Frobenius polynomials `P_v mod J_r`, the conjugates
of the Frobenius elements being dense. Then a unique continuous determinant over `A` has
polynomial `P_v` at every `Frob v` ([Chenevier], Example 2.32 and Lemma 3.2, pp. 38, 41;
[Scholze], Corollary 5.1.11, p. 1038). -/
theorem existsUnique_interpolation {G V : Type*} [Group G] [TopologicalSpace G]
    [TopologicalSpace A] [IsTopologicalRing A] (J : ℕ → Ideal A) (hJ : Antitone J)
    (hbasis : (nhds (0 : A)).HasBasis (fun _ ↦ True) fun r ↦ (J r : Set A))
    (hsep : ⨅ r, J r = ⊥)
    (hcomplete : ∀ a : (r : ℕ) → A ⧸ J r,
      (∀ r s (h : r ≤ s), Ideal.Quotient.factor (hJ h) (a s) = a r) →
        ∃ x : A, ∀ r, Ideal.Quotient.mk (J r) x = a r)
    (Frob : V → G) (hdense : Dense {g : G | ∃ v h, g = h * Frob v * h⁻¹}) (P : V → A[X])
    (D : ∀ r, Determinant (A ⧸ J r) (MonoidAlgebra (A ⧸ J r) G) d)
    (hD : ∀ r i, IsLocallyConstant fun g : G ↦
      ((D r).charpoly (MonoidAlgebra.of (A ⧸ J r) G g)).coeff i)
    (hP : ∀ r v, (D r).charpoly (MonoidAlgebra.of (A ⧸ J r) G (Frob v)) =
      (P v).map (Ideal.Quotient.mk (J r))) :
    ∃! E : Determinant A (MonoidAlgebra A G) d,
      E.IsContinuous ∧ ∀ v, E.charpoly (MonoidAlgebra.of A G (Frob v)) = P v := sorry

-- The monic convention `X − g` differs from `1 − Xg` by reversal; at eigenvalues `1, −1` the two
-- polynomials `X² − 1` and `1 − X²` agree in characteristic two only.
example : ((X - 1) * (X + 1) : ℤ[X]) = X ^ 2 - 1 ∧ ((1 - X) * (1 + X) : ℤ[X]) = 1 - X ^ 2 ∧
    ((X ^ 2 - 1 : (ZMod 2)[X]) = 1 - X ^ 2) := by
  refine ⟨by ring, by ring, ?_⟩
  rw [sub_eq_add_neg, sub_eq_add_neg, CharTwo.neg_eq, CharTwo.neg_eq, add_comm]

end Determinant

/-! ## Layer IHG.5: quantified nilpotent comparison -/

/-- Descent through a Hecke comparison `φ : T → B`: for compact `G`, compact Hausdorff `T / ker φ`
with continuous injective lift to Hausdorff `B`, a continuous determinant over `B` whose
coefficients on a dense set lie in the image descends uniquely to `T / ker φ`; the nilpotence
exponent of the error ideal enters only through `Nilpotence` ([Scholze], proof of
Theorem 5.4.1, pp. 1058–1059). -/
theorem Determinant.existsUnique_descent_kerLift {T B G : Type u} [CommRing T] [CommRing B]
    [Group G] [TopologicalSpace G] [CompactSpace G] {d : ℕ} (φ : T →+* B)
    [TopologicalSpace (T ⧸ RingHom.ker φ)] [CompactSpace (T ⧸ RingHom.ker φ)]
    [T2Space (T ⧸ RingHom.ker φ)] [TopologicalSpace B] [T2Space B]
    (hφ : Continuous (RingHom.kerLift φ))
    (D : Determinant B (MonoidAlgebra B G) d) (hD : D.IsContinuous) (S : Set G) (hS : Dense S)
    (hcoeff : ∀ g ∈ S, ∀ k, ∃ a : T ⧸ RingHom.ker φ,
      (D.charpoly (MonoidAlgebra.of B G g)).coeff k = RingHom.kerLift φ a) :
    ∃! E : Determinant (T ⧸ RingHom.ker φ) (MonoidAlgebra (T ⧸ RingHom.ker φ) G) d,
      E.IsContinuous ∧ E.IsCoefficientChange (RingHom.kerLift φ) D := sorry

/-- Residual semisimple specialisation: for `d > 0`, `J ≤ m` with `m` maximal and an algebraically
closed field `k` over `T/m`, the coefficient change of a determinant over `T/J` along
`T/J → T/m → k` is the determinant of a semisimple representation, unique up to conjugation among
semisimple ones ([Chenevier], Theorem 2.12, p. 28; [Scholze], Corollary 5.4.3, p. 1060). -/
theorem Determinant.exists_semisimple_specialization {T G k : Type u} [CommRing T] [Group G]
    [Field k] [IsAlgClosed k] (J m : Ideal T) [m.IsMaximal] (hJm : J ≤ m) [Algebra (T ⧸ m) k]
    {d : ℕ} (hd : 0 < d) (D : Determinant (T ⧸ J) (MonoidAlgebra (T ⧸ J) G) d) :
    ∃ ρ : MonoidAlgebra k G →ₐ[k] Matrix (Fin d) (Fin d) k,
      D.IsCoefficientChange ((algebraMap (T ⧸ m) k).comp (Ideal.Quotient.factor hJm))
        (Determinant.ofMatrix ρ) ∧
      IsSemisimpleModule (MonoidAlgebra k G) (matrixModule ρ) ∧
      ∀ σ : MonoidAlgebra k G →ₐ[k] Matrix (Fin d) (Fin d) k,
        D.IsCoefficientChange ((algebraMap (T ⧸ m) k).comp (Ideal.Quotient.factor hJm))
          (Determinant.ofMatrix σ) →
        IsSemisimpleModule (MonoidAlgebra k G) (matrixModule σ) →
        ∃ P : (Matrix (Fin d) (Fin d) k)ˣ, ∀ x,
          σ x = (P : Matrix (Fin d) (Fin d) k) * ρ x * (↑P⁻¹ : Matrix (Fin d) (Fin d) k) := sorry

namespace Nilpotence

variable {A : Type u} [CommRing A]

/-- The sharp bound for sums: `I^a = J^b = 0` with `a, b > 0` gives `(I + J)^{a+b−1} = 0`, improving
Mathlib's `Ideal.sup_pow_add_le_pow_sup_pow`. -/
theorem sup (I J : Ideal A) (a b : ℕ) (ha : 0 < a) (hb : 0 < b) (hI : I ^ a = ⊥) (hJ : J ^ b = ⊥) :
    (I ⊔ J) ^ (a + b - 1) = ⊥ := sorry

/-- Quantified composition of error ideals: `(ker f ∩ ker g)^a = 0`, `I^b = 0`, `J^c = 0` give
`(f⁻¹ I ∩ g⁻¹ J)^{a·max(b,c)} = 0` ([Scholze], proof of Theorem 5.4.1, p. 1059). -/
theorem comparison {B C : Type u} [CommRing B] [CommRing C] (f : A →+* B) (g : A →+* C)
    (I : Ideal B) (J : Ideal C) (a b c : ℕ) (hb : 0 < b) (hc : 0 < c)
    (hker : (RingHom.ker f ⊓ RingHom.ker g) ^ a = ⊥) (hI : I ^ b = ⊥) (hJ : J ^ c = ⊥) :
    (I.comap f ⊓ J.comap g) ^ (a * max b c) = ⊥ := sorry

/-- A uniform exponent in all quotients of a separated system bounds the exponent in `A`
([Scholze], Corollary 5.4.2 and footnote 29, p. 1060). -/
theorem inverse_limit (K : ℕ → Ideal A) (hsep : ⨅ r, K r = ⊥) (J : Ideal A) (n : ℕ)
    (hn : ∀ r, (J.map (Ideal.Quotient.mk (K r))) ^ n = ⊥) : J ^ n = ⊥ := sorry

-- A nilpotent error need not have square zero.
example : (Ideal.span {(2 : ZMod 8)}) ^ 3 = ⊥ ∧ (Ideal.span {(2 : ZMod 8)}) ^ 2 ≠ ⊥ := by
  norm_num [Ideal.span_singleton_pow, Ideal.span_singleton_eq_bot]
  decide

-- The sum bound is sharp: in `ℚ[x, y]/(x², y³)`, `(x + y)³ = 3xy² ≠ 0` and `(x + y)⁴ = 0`.
example :
    let I : Ideal (MvPolynomial (Fin 2) ℚ) :=
      Ideal.span {MvPolynomial.X 0 ^ 2, MvPolynomial.X 1 ^ 3}
    (Ideal.Quotient.mk I (MvPolynomial.X 0) + Ideal.Quotient.mk I (MvPolynomial.X 1)) ^ 3 ≠ 0 ∧
      (Ideal.Quotient.mk I (MvPolynomial.X 0) + Ideal.Quotient.mk I (MvPolynomial.X 1)) ^ 4 = 0 :=
  sorry

end Nilpotence

/-! ## Layer IHG.6: integral Ribet modules and Fitting ideals -/

namespace IntegralRibet

variable {A B G : Type u} [CommRing A] [CommRing B] [Algebra A B] [Group G]

/-- The ordered independent generic combinations of the coordinates `b` (README §6.5,
Generic combinations of an ideal containing a regular sequence). -/
def genericLinearSequence {S : Type u} [CommRing S] {h : ℕ} (b : Fin h → S) (ℓ : ℕ) :
    List (MvPolynomial (Fin ℓ × Fin h) S) :=
  List.ofFn fun i ↦ ∑ j, MvPolynomial.X (i, j) * MvPolynomial.C (b j)

/-- An ideal containing a weakly regular sequence of length at least `ℓ` supplies `ℓ`
weakly regular independent generic combinations of its given generators over any commutative
ring (Stacks tags 068P and 0663; the iterated Koszul-cohomology argument of README §6.5). -/
theorem generic_combinations_regular {S : Type u} [CommRing S] {h ℓ : ℕ}
    (b : Fin h → S) (w : List S) (hw : RingTheory.Sequence.IsWeaklyRegular S w)
    (hmem : ∀ x ∈ w, x ∈ Ideal.span (Set.range b)) (hcount : ℓ ≤ w.length) :
    RingTheory.Sequence.IsWeaklyRegular (MvPolynomial (Fin ℓ × Fin h) S)
      (genericLinearSequence b ℓ) := sorry

-- The ideal `(2)` supports one generic regular equation over `ℤ`.
example : RingTheory.Sequence.IsWeaklyRegular (MvPolynomial (Fin 1 × Fin 1) ℤ)
    (genericLinearSequence (fun _ : Fin 1 ↦ (2 : ℤ)) 1) := sorry

-- Over `ℤ/4`, the same equation annihilates the nonzero constant `2`.
example :
    let P := MvPolynomial (Fin 1 × Fin 1) (ZMod 4)
    ¬ RingTheory.Sequence.IsWeaklyRegular P
      (genericLinearSequence (fun _ : Fin 1 ↦ (2 : ZMod 4)) 1) ∧
      (MvPolynomial.C (2 : ZMod 4) : P) ≠ 0 ∧
      (MvPolynomial.X (0, 0) * MvPolynomial.C (2 : ZMod 4) : P) *
        MvPolynomial.C (2 : ZMod 4) = 0 := sorry

-- Two independent combinations of `(X)` exceed its regular-sequence length.
example :
    let P := MvPolynomial (Fin 2 × Fin 1) ℤ[X]
    let I : Ideal P := Ideal.span {MvPolynomial.X (0, 0) * MvPolynomial.C X}
    let v := Ideal.Quotient.mk I (MvPolynomial.X (0, 0))
    ¬ RingTheory.Sequence.IsWeaklyRegular P
      (genericLinearSequence (fun _ : Fin 1 ↦ (X : ℤ[X])) 2) ∧
      v ≠ 0 ∧ v * Ideal.Quotient.mk I
        (MvPolynomial.X (1, 0) * MvPolynomial.C X) = 0 := sorry

/-- The sum of the disjoint local two-row minor ideals. Left variables are `b′`, right
variables are `b`; the final `u` right variables are unused coordinates (DKSW Corollary 5.12,
printed p.43; README §6.5, Coordinate regularity in disjoint minor quotients). -/
def localMinorIdeal (S : Type u) [CommRing S] {n k : ℕ} (u : ℕ) (block : Fin n → Fin k) :
    Ideal (MvPolynomial (Fin n ⊕ Fin (n + u)) S) :=
  Ideal.span {p | ∃ i j : Fin n, block i = block j ∧
    p = MvPolynomial.X (Sum.inr (Fin.castAdd u i)) * MvPolynomial.X (Sum.inl j) -
      MvPolynomial.X (Sum.inr (Fin.castAdd u j)) * MvPolynomial.X (Sum.inl i)}

-- A singleton block has no nonzero minor.
example (S : Type u) [CommRing S] :
    localMinorIdeal S 0 (fun _ : Fin 1 ↦ (0 : Fin 1)) = ⊥ := sorry

-- In the integral two-column quotient `b₁` is regular; modulo `b₁`, `b₂` kills `b′₁`.
example :
    let Q := MvPolynomial (Fin 2 ⊕ Fin 2) ℤ
    let I := localMinorIdeal ℤ 0 (fun _ : Fin 2 ↦ (0 : Fin 1))
    let b : Q ⧸ I := Ideal.Quotient.mk I (MvPolynomial.X (Sum.inr 0))
    let J : Ideal (Q ⧸ I) := Ideal.span {b}
    let v := Ideal.Quotient.mk J (Ideal.Quotient.mk I (MvPolynomial.X (Sum.inl 0)))
    Function.Injective (fun x : Q ⧸ I ↦ b * x) ∧ v ≠ 0 ∧
      v * Ideal.Quotient.mk J (Ideal.Quotient.mk I (MvPolynomial.X (Sum.inr 1))) = 0 := sorry

-- The same coordinate remains regular over the torsion base `ℤ/4`.
example :
    let Q := MvPolynomial (Fin 2 ⊕ Fin 2) (ZMod 4)
    let I := localMinorIdeal (ZMod 4) 0 (fun _ : Fin 2 ↦ (0 : Fin 1))
    Function.Injective (fun x : Q ⧸ I ↦
      Ideal.Quotient.mk I (MvPolynomial.X (Sum.inr 0)) * x) := sorry

/-- Modulo disjoint local minors, at most `u + k` independent generic scalar equations are
weakly regular, with `u` unused coordinates and `k` nonempty blocks, over any commutative
coefficient ring. Singleton blocks contribute zero minors; moving their coordinates to the
unused list preserves the bound (README §6.5, Mixed minor and linear resolutions, extending
DKSW Proposition 5.14, printed p.46). -/
theorem mixed_scalar_regular (S : Type u) [CommRing S] {n k u ℓ : ℕ}
    (block : Fin n → Fin k) (hblocks : Function.Surjective block) (hcount : ℓ ≤ u + k) :
    let Q := MvPolynomial (Fin n ⊕ Fin (n + u)) S
    let I := (localMinorIdeal S u block).map
      (MvPolynomial.C : Q →+* MvPolynomial (Fin ℓ × Fin (n + u)) Q)
    RingTheory.Sequence.IsWeaklyRegular
      (MvPolynomial (Fin ℓ × Fin (n + u)) Q ⧸ I)
      ((genericLinearSequence (fun j : Fin (n + u) ↦
        (MvPolynomial.X (Sum.inr j) : Q)) ℓ).map (Ideal.Quotient.mk I)) := sorry

-- With one two-column block, two equations exceed `u + k = 1`.
example :
    let Q := MvPolynomial (Fin 2 ⊕ Fin 2) ℤ
    let P := MvPolynomial (Fin 2 × Fin 2) Q
    let L : Fin 2 → P := fun i ↦ ∑ j : Fin 2,
      MvPolynomial.X (i, j) * MvPolynomial.C (MvPolynomial.X (Sum.inr j))
    let I := (localMinorIdeal ℤ 0 (fun _ : Fin 2 ↦ (0 : Fin 1))).map
      (MvPolynomial.C : Q →+* P)
    let J := I ⊔ Ideal.span {L 0}
    let v := Ideal.Quotient.mk J (∑ j : Fin 2,
      MvPolynomial.X (0, j) * MvPolynomial.C (MvPolynomial.X (Sum.inl j)))
    ¬ RingTheory.Sequence.IsWeaklyRegular (P ⧸ I)
      ((genericLinearSequence (fun j : Fin 2 ↦
        (MvPolynomial.X (Sum.inr j) : Q)) 2).map (Ideal.Quotient.mk I)) ∧
      v ≠ 0 ∧ v * Ideal.Quotient.mk J (L 1) = 0 := sorry

-- Three scalar equations and two unused coordinates. The first two coordinates form the
-- local block; relabeling puts it at `{3,4}` as in the README check.
example (S : Type u) [CommRing S] :
    let block : Fin 2 → Fin 1 := fun _ ↦ 0
    let Q := MvPolynomial (Fin 2 ⊕ Fin 4) S
    let I := (localMinorIdeal S 2 block).map
      (MvPolynomial.C : Q →+* MvPolynomial (Fin 3 × Fin 4) Q)
    RingTheory.Sequence.IsWeaklyRegular (MvPolynomial (Fin 3 × Fin 4) Q ⧸ I)
      ((genericLinearSequence (fun j : Fin 4 ↦
        (MvPolynomial.X (Sum.inr j) : Q)) 3).map (Ideal.Quotient.mk I)) := sorry

/-- The integral upper-unipotent representation `n ↦ [[1,n],[0,1]]`, with additive integers
written as `Multiplicative ℤ`. -/
def unipotentRepresentation :
    MonoidAlgebra ℤ (Multiplicative ℤ) →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ :=
  MonoidAlgebra.lift ℤ _ _
    { toFun := fun n ↦ Matrix.of ![![1, n.toAdd], ![0, 1]]
      map_one' := by ext i j; fin_cases i <;> fin_cases j <;> simp
      map_mul' := by
        intro n m
        ext i j
        fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_succ, add_comm] }

/-- The scalar matrix representation associated to a unit character. -/
def scalarRepresentation (ψ : G →* Aˣ) :
    MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A :=
  MonoidAlgebra.lift A _ G
    ((algebraMap A (Matrix (Fin 2) (Fin 2) A)).toMonoidHom.comp ((Units.coeHom A).comp ψ))

-- The integral unipotent action is reducible and not semisimple.
example :
    ¬ IsSimpleModule (MonoidAlgebra ℤ (Multiplicative ℤ)) (matrixModule unipotentRepresentation) ∧
      ¬ IsSemisimpleModule (MonoidAlgebra ℤ (Multiplicative ℤ))
        (matrixModule unipotentRepresentation) := sorry

/-- `t ↦ ρ(t) − ψ(t) I₂` on `A[G]`. -/
def differenceMap (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (ψ : G →* Aˣ) :
    MonoidAlgebra A G →ₗ[A] Matrix (Fin 2) (Fin 2) B :=
  ρ.toLinearMap - (Algebra.linearMap A (Matrix (Fin 2) (Fin 2) B)).comp
    (MonoidAlgebra.lift A A _ ((Units.coeHom A).comp ψ)).toLinearMap

/-- The character difference module `Δψ`, the range of `differenceMap` ([DKSW], §2.1,
equation (14), pp. 8–9). -/
def differenceModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (ψ : G →* Aˣ) :
    Submodule A (Matrix (Fin 2) (Fin 2) B) :=
  LinearMap.range (differenceMap ρ ψ)

/-- The product `ΔχΔψ` read inside `Δψ`. -/
def productInside (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    Submodule A (differenceModule ρ ψ) :=
  (Submodule.span A {z | ∃ x ∈ differenceModule ρ χ, ∃ y ∈ differenceModule ρ ψ, z = x * y}).comap
    (differenceModule ρ ψ).subtype

/-- The initial Ribet module `M₀ = Δψ / ΔχΔψ` ([DKSW], §2.1, p. 9). -/
def initialModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    ModuleCat.{u} A :=
  ModuleCat.of A (differenceModule ρ ψ ⧸ productInside ρ χ ψ)

/-- The canonical cocycle `κ₀(g) = ψ(g)⁻¹ [ρ(g) − ψ(g)]`, for the action `χψ⁻¹` ([DKSW],
Lemma 2.3, p. 9). -/
def canonicalCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (g : G) : initialModule ρ χ ψ :=
  (↑(ψ g)⁻¹ : A) • (productInside ρ χ ψ).mkQ
    ⟨differenceMap ρ ψ (MonoidAlgebra.of A G g), LinearMap.mem_range_self _ _⟩

-- The unipotent differences are exactly the multiples of the upper matrix unit.
example (n : ℤ) :
    differenceMap unipotentRepresentation 1
      (MonoidAlgebra.of ℤ (Multiplicative ℤ) (Multiplicative.ofAdd n)) =
      Matrix.of ![![0, n], ![0, 0]] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [differenceMap, unipotentRepresentation]

example : differenceModule unipotentRepresentation 1 =
    Submodule.span ℤ {Matrix.of ![![0, 1], ![0, 0]]} := sorry

example (ψ : G →* Aˣ) : differenceMap (scalarRepresentation ψ) ψ = 0 := sorry

example (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (ψ : G →* Aˣ) :
    differenceMap ρ ψ (MonoidAlgebra.of A G 1) = 0 := by
  rw [map_one (MonoidAlgebra.of A G)]
  simp [differenceMap]

-- The product is inside the right difference module; square-zero differences give zero products.
example (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    Submodule.span A {z | ∃ x ∈ differenceModule ρ χ, ∃ y ∈ differenceModule ρ ψ, z = x * y} ≤
      differenceModule ρ ψ := sorry

example :
    (Submodule.span ℤ {z | ∃ x ∈ differenceModule unipotentRepresentation 1,
      ∃ y ∈ differenceModule unipotentRepresentation 1, z = x * y}) = ⊥ ∧
    productInside unipotentRepresentation 1 1 = ⊥ ∧
    Function.Injective (productInside unipotentRepresentation 1 1).mkQ := sorry

example (ψ : G →* Aˣ) :
    differenceModule (scalarRepresentation ψ) ψ = ⊥ ∧
    (Submodule.span A {z | ∃ x ∈ differenceModule (scalarRepresentation ψ) ψ,
      ∃ y ∈ differenceModule (scalarRepresentation ψ) ψ, z = x * y}) = ⊥ ∧
    productInside (scalarRepresentation ψ) ψ ψ = ⊥ ∧
    (∀ z : differenceModule (scalarRepresentation ψ) ψ,
      (productInside (scalarRepresentation ψ) ψ ψ).mkQ z = 0) ∧
    (∀ g, canonicalCocycle (scalarRepresentation ψ) ψ ψ g = 0) := sorry

-- Normalize the unipotent quotient by sending the difference class at additive `1` to `1`.
example : ∃ e : initialModule unipotentRepresentation 1 1 ≃ₗ[ℤ] ℤ,
    ∀ n : ℤ, e (canonicalCocycle unipotentRepresentation 1 1 (Multiplicative.ofAdd n)) = n := sorry

-- The sign scalar representation with both comparison characters trivial has `M₀ ≅ ℤ/2`.
example :
    let ρ := scalarRepresentation (MonoidHom.id ℤˣ)
    ∃ z : differenceModule ρ (1 : ℤˣ →* ℤˣ),
      (z : Matrix (Fin 2) (Fin 2) ℤ) = 2 • (1 : Matrix (Fin 2) (Fin 2) ℤ) ∧
      z ∉ productInside ρ 1 1 ∧ (2 : ℤ) • z ∈ productInside ρ 1 1 ∧
      (productInside ρ 1 1).mkQ z ≠ 0 ∧
      (2 : ℤ) • (productInside ρ 1 1).mkQ z = 0 := sorry

-- `κ₀(1) = 0`.
example (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    canonicalCocycle ρ χ ψ 1 = 0 := sorry

/-- Local data: subgroups `G_v` for `v ∈ S = Σ ⊔ P`, inertia subgroups `I_v ⊆ G_v`, and a chosen
place `v₀ ∈ Σ` when `Σ` is nonempty ([DKSW], Theorem 2.1, pp. 7–8). -/
structure LocalData (G : Type u) [Group G] where
  count : ℕ
  sigma : Finset (Fin count)
  subgroup : Fin count → Subgroup G
  inertia : Fin count → Subgroup G
  inertia_le : ∀ v, inertia v ≤ subgroup v
  distinguished : Option (Fin count)
  distinguished_mem : ∀ v, distinguished = some v → v ∈ sigma
  distinguished_exists : sigma.Nonempty → ∃ v, distinguished = some v

/-- The empty set of local places. -/
abbrev emptyLocalData (G : Type u) [Group G] : LocalData G :=
  ⟨0, ∅, Fin.elim0, Fin.elim0, fun v ↦ v.elim0, none, fun v ↦ v.elim0, by simp⟩

/-- One distinguished place with full subgroup and trivial inertia. -/
abbrev fullLocalData (G : Type u) [Group G] : LocalData G where
  count := 1
  sigma := Finset.univ
  subgroup := fun _ ↦ ⊤
  inertia := fun _ ↦ ⊥
  inertia_le := fun _ ↦ bot_le
  distinguished := some 0
  distinguished_mem := fun v _ ↦ Finset.mem_univ v
  distinguished_exists := by intro _; exact ⟨0, rfl⟩

/-- Two sigma places: distinguished place zero has full subgroup, place one has trivial subgroup. -/
abbrev twoPlaceLocalData (G : Type u) [Group G] : LocalData G where
  count := 2
  sigma := Finset.univ
  subgroup := fun v ↦ if v = 0 then ⊤ else ⊥
  inertia := fun _ ↦ ⊥
  inertia_le := fun _ ↦ bot_le
  distinguished := some 0
  distinguished_mem := fun v _ ↦ Finset.mem_univ v
  distinguished_exists := by intro _; exact ⟨0, rfl⟩

/-- Three sigma places with trivial subgroups and distinguished place one. -/
abbrev threePlaceLocalData (G : Type u) [Group G] : LocalData G where
  count := 3
  sigma := Finset.univ
  subgroup := fun _ ↦ ⊥
  inertia := fun _ ↦ ⊥
  inertia_le := fun _ ↦ bot_le
  distinguished := some 1
  distinguished_mem := fun v _ ↦ Finset.mem_univ v
  distinguished_exists := by intro _; exact ⟨1, rfl⟩

variable (L : LocalData G)

/-- The places of `Σ` other than `v₀`. -/
def extraPlaces : Finset (Fin L.count) := L.sigma.filter fun v ↦ L.distinguished ≠ some v

/-- `N₀ = M₀ ⊕ ⊕_{v ∈ Σ ∖ {v₀}} A y_v`. -/
def enlargedModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    ModuleCat.{u} A :=
  ModuleCat.of A (initialModule ρ χ ψ × ({v // v ∈ extraPlaces L} → A))

/-- The local relations: `κ₀(G_{v₀})`, `κ₀(g) − (α(g) − 1) y_v` on `G_v` for `v ∈ Σ ∖ {v₀}`, and
`κ₀(I_v)` for `v ∈ P`, where `α = χψ⁻¹` ([DKSW], §2.1, pp. 9–10). -/
def localRelations (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    Submodule A (enlargedModule L ρ χ ψ) :=
  Submodule.span A {z | (∃ v g, L.distinguished = some v ∧ g ∈ L.subgroup v ∧
      z = (canonicalCocycle ρ χ ψ g, 0)) ∨
    (∃ (v : {v // v ∈ extraPlaces L}) (g : G), g ∈ L.subgroup v ∧
      z = (canonicalCocycle ρ χ ψ g, -((↑(χ g) : A) * (↑(ψ g)⁻¹ : A) - 1) • Pi.single v 1)) ∨
    (∃ v g, v ∉ L.sigma ∧ g ∈ L.inertia v ∧ z = (canonicalCocycle ρ χ ψ g, 0))}

/-- The Ribet module with local conditions `N = N₀ / Q` ([DKSW], §2.1, pp. 9–10). -/
def localModule (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    ModuleCat.{u} A :=
  ModuleCat.of A (enlargedModule L ρ χ ψ ⧸ localRelations L ρ χ ψ)

/-- The image `κ` of `κ₀` in `N`. -/
def localCocycle (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) (g : G) :
    localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (canonicalCocycle ρ χ ψ g, 0)

/-- The adjoined vector `y_v`. -/
def localVector (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (v : {v // v ∈ extraPlaces L}) : localModule L ρ χ ψ :=
  (localRelations L ρ χ ψ).mkQ (0, Pi.single v 1)

-- The surviving place indices distinguish the one-, two- and three-place fixtures.
example : extraPlaces (twoPlaceLocalData G) = {1} := by
  ext v; fin_cases v <;> simp [extraPlaces, twoPlaceLocalData]

example : extraPlaces (fullLocalData G) = ∅ := by
  ext v; fin_cases v; simp [extraPlaces, fullLocalData]

example : extraPlaces (threePlaceLocalData G) = {0, 2} := by
  ext v; fin_cases v <;> simp [extraPlaces, threePlaceLocalData]

-- Full local conditions kill the span of the integral unipotent cocycle.
example : localRelations (fullLocalData (Multiplicative ℤ)) unipotentRepresentation 1 1 = ⊤ ∧
    ∀ g, localCocycle (fullLocalData (Multiplicative ℤ)) unipotentRepresentation 1 1 g = 0 := sorry

-- Scalar differences vanish, including in the presence of the surviving free local generator.
example (ψ : G →* Aˣ) :
    localRelations (emptyLocalData G) (scalarRepresentation ψ) ψ ψ = ⊥ ∧
    localRelations (twoPlaceLocalData G) (scalarRepresentation ψ) ψ ψ = ⊥ ∧
    ∀ g, localCocycle (emptyLocalData G) (scalarRepresentation ψ) ψ ψ g = 0 := sorry

-- The sign class survives when there are no local relations.
example : localCocycle (emptyLocalData ℤˣ) (scalarRepresentation (MonoidHom.id ℤˣ)) 1 1 (-1) ≠ 0 :=
  sorry

-- A trivial subgroup at the extra place leaves its integral local vector of infinite order.
example {G : Type} [Group G]
    (ρ : MonoidAlgebra ℤ G →ₐ[ℤ] Matrix (Fin 2) (Fin 2) ℤ) (χ ψ : G →* ℤˣ) :
    let v : {v // v ∈ extraPlaces (twoPlaceLocalData G)} := ⟨1, by simp [extraPlaces, twoPlaceLocalData]⟩
    ∀ n : ℤ, n • localVector (twoPlaceLocalData G) ρ χ ψ v = 0 ↔ n = 0 := sorry

example : IsEmpty {v // v ∈ extraPlaces (fullLocalData G)} := by
  refine ⟨fun v ↦ ?_⟩
  have h : extraPlaces (fullLocalData G) = ∅ := by
    ext v; fin_cases v; simp [extraPlaces, fullLocalData]
  simpa [h] using v.property

-- Distinct free place vectors remain distinct over every nonzero coefficient ring.
example [Nontrivial A] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    let v : {v // v ∈ extraPlaces (threePlaceLocalData G)} := ⟨0, by simp [extraPlaces, threePlaceLocalData]⟩
    let w : {v // v ∈ extraPlaces (threePlaceLocalData G)} := ⟨2, by simp [extraPlaces, threePlaceLocalData]⟩
    localVector (threePlaceLocalData G) ρ χ ψ v ≠ localVector (threePlaceLocalData G) ρ χ ψ w := sorry

-- With no places the local module is the initial module.
example (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ) :
    Nonempty (localModule ⟨0, ∅, Fin.elim0, Fin.elim0, fun v ↦ v.elim0, none,
      fun v ↦ v.elim0, by simp⟩ ρ χ ψ ≃ₗ[A] initialModule ρ χ ψ) := sorry

/-- Characteristic polynomials are integral and reduce modulo `I` to `(X − χ(g))(X − ψ(g))`. -/
def Congruence (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (χ ψ : G →* Aˣ)
    (I : Ideal A) : Prop :=
  ∀ g : G, ∃ P : A[X], P.map (algebraMap A B) = (ρ (MonoidAlgebra.of A G g)).charpoly ∧
    P.map (Ideal.Quotient.mk I) =
      (X - C (Ideal.Quotient.mk I (χ g))) * (X - C (Ideal.Quotient.mk I (ψ g)))

-- Scalar and unipotent actions have exactly the split characteristic polynomials.
example (χ : G →* Aˣ) : Congruence (scalarRepresentation χ) χ χ ⊥ := sorry

example : Congruence unipotentRepresentation 1 1 ⊥ := sorry

-- Integral characteristic polynomials impose no restriction modulo the unit ideal.
example (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) A) (χ ψ : G →* Aˣ) :
    Congruence ρ χ ψ ⊤ := sorry

/-- The representation `k[G] → M₂(k)` obtained from `ρ` along `φ : B →+* k`. -/
def fieldRepresentation {k : Type u} [Field k]
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) (φ : B →+* k) :
    MonoidAlgebra k G →ₐ[k] Matrix (Fin 2) (Fin 2) k :=
  MonoidAlgebra.lift k _ G
    (φ.mapMatrix.toMonoidHom.comp (ρ.toMonoidHom.comp (MonoidAlgebra.of A G)))

/-- `ρ` is irreducible on every field quotient of `B` ([DKSW], Theorem 2.1, pp. 7–8). -/
def IrreducibleOnFields (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B) : Prop :=
  ∀ (k : Type u) [Field k] (φ : B →+* k), Function.Surjective φ →
    IsSimpleModule (MonoidAlgebra k G) (matrixModule (fieldRepresentation ρ φ))

-- The full natural `GL₂(ℚ)` action is irreducible on every field quotient of `ℚ`.
example :
    let G := (Matrix (Fin 2) (Fin 2) ℚ)ˣ
    let ρ : MonoidAlgebra ℚ G →ₐ[ℚ] Matrix (Fin 2) (Fin 2) ℚ :=
      MonoidAlgebra.lift ℚ _ _ (Units.coeHom _)
    IsSimpleModule (MonoidAlgebra ℚ G) (matrixModule (fieldRepresentation ρ (RingHom.id ℚ))) ∧
      IrreducibleOnFields ρ := sorry

-- Scalar `ℚ²` has a proper nonzero invariant coordinate line on the identity quotient.
example {H : Type} [Group H] (χ : H →* ℚˣ) :
    ¬ IsSimpleModule (MonoidAlgebra ℚ H)
      (matrixModule (fieldRepresentation (scalarRepresentation χ) (RingHom.id ℚ))) ∧
      ¬ IrreducibleOnFields (scalarRepresentation χ) := sorry

-- A zero coefficient ring has no unital maps to fields.
example : IrreducibleOnFields (scalarRepresentation (1 : PUnit →* (ZMod 1)ˣ)) := sorry

-- Reduction `ℤ → 𝔽₂` is a field quotient and preserves the first-coordinate line.
example :
    Function.Surjective (Int.castRingHom (ZMod 2)) ∧
    ¬ IsSimpleModule (MonoidAlgebra (ZMod 2) (Multiplicative ℤ))
      (matrixModule (fieldRepresentation unipotentRepresentation (Int.castRingHom (ZMod 2)))) ∧
    ¬ IrreducibleOnFields unipotentRepresentation := by
  refine ⟨ZMod.intCast_surjective, ?_, ?_⟩
  · sorry
  · sorry

/-- The local triangular input: on each `G_v` a basis in which `ρ` is lower triangular with
diagonal characters `η_v, ξ_v` valued in `T̃ˣ`, `ξ_v ≡ ψ` on `G_v` for `v ∈ Σ` and `ξ_v ≡ χ` on
`I_v` for `v ∈ P`, modulo `Ĩ` ([DKSW], Theorem 2.1, conditions (9)–(11), pp. 7–8). -/
structure LocalInput {Tilde : Type u} [CommRing Tilde] [Algebra A Tilde] [Algebra Tilde B]
    [IsScalarTower A Tilde B] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (Itilde : Ideal Tilde) where
  eta : ∀ v, L.subgroup v →* Tildeˣ
  xi : ∀ v, L.subgroup v →* Tildeˣ
  basis : Fin L.count → (Matrix (Fin 2) (Fin 2) B)ˣ
  triangular : ∀ v (g : L.subgroup v),
    (basis v)⁻¹ * ρ (MonoidAlgebra.of A G g) * basis v =
      Matrix.of ![![algebraMap Tilde B (eta v g), 0],
        ![((basis v)⁻¹ * ρ (MonoidAlgebra.of A G g) * basis v : Matrix (Fin 2) (Fin 2) B) 1 0,
          algebraMap Tilde B (xi v g)]]
  sigma_congruence : ∀ v, v ∈ L.sigma → ∀ g : L.subgroup v,
    (↑(xi v g) : Tilde) - algebraMap A Tilde (ψ g) ∈ Itilde
  inertia_congruence : ∀ v, v ∉ L.sigma → ∀ g : G, (hg : g ∈ L.inertia v) →
    (↑(xi v ⟨g, L.inertia_le v hg⟩) : Tilde) - algebraMap A Tilde (χ g) ∈ Itilde

-- With no places the local input imposes no condition.
example {Tilde : Type u} [CommRing Tilde] [Algebra A Tilde] [Algebra Tilde B]
    [IsScalarTower A Tilde B] (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (χ ψ : G →* Aˣ) (Itilde : Ideal Tilde) :
    Nonempty (LocalInput ⟨0, ∅, Fin.elim0, Fin.elim0, fun v ↦ v.elim0, none, fun v ↦ v.elim0,
      by simp⟩ ρ χ ψ Itilde) := sorry

-- Matching scalar characters supply triangular input with the identity basis.
example :
    ∃ loc : LocalInput (fullLocalData ℤˣ) (scalarRepresentation (MonoidHom.id ℤˣ))
      (MonoidHom.id ℤˣ) (MonoidHom.id ℤˣ) (⊥ : Ideal ℤ),
      (∀ v, loc.basis v = 1) ∧ (∀ v g, loc.eta v g = g.val) ∧
        (∀ v g, loc.xi v g = g.val) := sorry

-- The same scalar action cannot have second diagonal character `1` modulo zero.
example : ¬ Nonempty (LocalInput (fullLocalData ℤˣ)
    (scalarRepresentation (MonoidHom.id ℤˣ)) 1 1 (⊥ : Ideal ℤ)) := sorry

/-- Ribet's method in the residually indistinguishable case with all local conditions: under the
hypotheses of [DKSW], Theorem 2.1, together with a finite `T`-lattice `Λ ⊆ M₂(K)` containing both
difference modules whose induced topology is `m`-adic, the local module `N` is finite, `κ` is
continuous, `κ(G)` and the `y_v` generate `N`, and
`(∏_{v ∈ P} (ξ_v(σ_v) − χ(σ_v))) · Fitt₀(N) · T̃ ⊆ Ĩ` ([DKSW], Theorem 2.1, pp. 7–8, and §2.1,
pp. 8–9). For each stabilized relation minor, §6.3 of the roadmap constructs formal matrices
`𝔈, 𝔈′` with `π(𝔈) ≡ E_arith` entrywise modulo `Ĩ` and `π(𝔈′) = E′_arith`.
For minors with nonempty nondistinguished-place blocks, the count `L = u + k` and the mixed
resolution at that bound supply upper exactness for the formal error comparison. A minor with
an empty such block has a zero place column and zero weighted determinant. The formal error
comparison and `det E′_arith = 0` give `det E_arith ∈ Ĩ`; its exact weighted determinant identity
supplies the Fitting containment. -/
theorem local_ribet {Tilde : Type u} [CommRing Tilde] [Algebra A Tilde] [Algebra Tilde B]
    [IsScalarTower A Tilde B] [IsArtinianRing B] [IsPrincipalIdealRing B]
    [IsLocalization (nonZeroDivisors Tilde) B] [IsLocalRing A] [IsNoetherianRing A]
    [IsNoetherianRing Tilde] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) Tilde]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A)) (hAB : Topology.IsEmbedding (algebraMap A B))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous fun g : G ↦ ρ (MonoidAlgebra.of A G g))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ) (Itilde : Ideal Tilde)
    (hproper : Itilde ≠ ⊤) (hnonzero : Itilde ≠ ⊥)
    (hinj : Function.Injective (algebraMap A Tilde)) (hIrr : IrreducibleOnFields ρ)
    (hres : ∀ g, (↑(χ g) : A) - (↑(ψ g) : A) ∈ IsLocalRing.maximalIdeal A)
    (hchar : Congruence ρ χ ψ (Itilde.comap (algebraMap A Tilde)))
    (loc : LocalInput L ρ χ ψ Itilde) (σ : ∀ v, L.subgroup v)
    (Λ : Submodule A (Matrix (Fin 2) (Fin 2) B)) [Module.Finite A Λ]
    (hχΛ : differenceModule ρ χ ≤ Λ) (hψΛ : differenceModule ρ ψ ≤ Λ)
    (hΛtop : (IsLocalRing.maximalIdeal A).adicModuleTopology Λ =
      TopologicalSpace.induced (fun x : Λ ↦ (x : Matrix (Fin 2) (Fin 2) B)) inferInstance) :
    ∃ hfin : Module.Finite A (localModule L ρ χ ψ),
      letI := hfin
      letI : TopologicalSpace (localModule L ρ χ ψ) :=
        (IsLocalRing.maximalIdeal A).adicModuleTopology (localModule L ρ χ ψ)
      Continuous (localCocycle L ρ χ ψ) ∧
        Submodule.span A (Set.range (localCocycle L ρ χ ψ) ∪ Set.range (localVector L ρ χ ψ)) = ⊤ ∧
        (Ideal.span {∏ v ∈ Finset.univ.filter (fun v ↦ v ∉ L.sigma),
          ((↑(loc.xi v (σ v)) : Tilde) - algebraMap A Tilde (χ (σ v)))} : Ideal Tilde) *
          (TauCeti.fittingIdeal A (localModule L ρ χ ψ) 0).map (algebraMap A Tilde) ≤ Itilde :=
  sorry

/-- The integral Ribet theorem: for `T` complete reduced noetherian local, `K = Frac(T)`, compact
`G`, continuous `ρ : G → GL₂(K)` irreducible on every field factor, and characteristic polynomials
integral and congruent to `(X − χ)(X − ψ)` modulo an ideal `I`, there are a finite `T`-module `M`
and a continuous cocycle `κ` for `χψ⁻¹` all of whose cohomologous translates generate `M`, with
`Fitt₀(M) ⊆ I`; `χ ≡ ψ` and residue characteristic two are allowed ([DKSW], Theorem 1.1,
pp. 2–3). -/
theorem global_ribet [IsLocalization (nonZeroDivisors A) B] [IsLocalRing A] [IsNoetherianRing A]
    [IsReduced A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalRing B] [T2Space B]
    (hAdic : IsAdic (IsLocalRing.maximalIdeal A))
    (ρ : MonoidAlgebra A G →ₐ[A] Matrix (Fin 2) (Fin 2) B)
    (hρ : Continuous fun g : G ↦ ρ (MonoidAlgebra.of A G g))
    (χ ψ : G →* Aˣ) (hχ : Continuous χ) (hψ : Continuous ψ)
    (hAB : Topology.IsEmbedding (algebraMap A B)) (hIrr : IrreducibleOnFields ρ)
    (I : Ideal A) (hchar : Congruence ρ χ ψ I) :
    ∃ (M : ModuleCat.{u} A) (hfin : Module.Finite A M),
      letI := hfin
      letI : TopologicalSpace M := (IsLocalRing.maximalIdeal A).adicModuleTopology M
      ∃ κ : G → M, Continuous κ ∧
        (∀ g h, κ (g * h) = κ g + ((↑(χ g) : A) * (↑(ψ g)⁻¹ : A)) • κ h) ∧
        (∀ x : M, Submodule.span A
          (Set.range fun g ↦ κ g + ((↑(χ g) : A) * (↑(ψ g)⁻¹ : A) - 1) • x) = ⊤) ∧
        TauCeti.fittingIdeal A M 0 ≤ I := sorry

-- Irreducibility is not implied by the congruences: the scalar representation `ψ · I₂` is
-- reducible on every field quotient, although it satisfies the congruence for `χ = ψ`.
example [Nontrivial A] (ψ : G →* Aˣ) (I : Ideal A) :
    ¬ IrreducibleOnFields (MonoidAlgebra.lift A (Matrix (Fin 2) (Fin 2) A) G
        ((algebraMap A (Matrix (Fin 2) (Fin 2) A)).toMonoidHom.comp ((Units.coeHom A).comp ψ))) ∧
      Congruence (MonoidAlgebra.lift A (Matrix (Fin 2) (Fin 2) A) G
        ((algebraMap A (Matrix (Fin 2) (Fin 2) A)).toMonoidHom.comp ((Units.coeHom A).comp ψ)))
        ψ ψ I := sorry

-- Without irreducibility the conclusion fails: for the trivial group and a proper ideal, the only
-- cocycle is `0` and `Fitt₀(0) = A`.
example [Nontrivial A] (I : Ideal A) (hI : I ≠ ⊤) :
    ¬ ∃ (M : ModuleCat.{u} A) (_ : Module.Finite A M), ∃ κ : PUnit.{u + 1} → M,
      (∀ g h, κ (g * h) = κ g + (1 : A) • κ h) ∧
      (∀ x : M, Submodule.span A (Set.range fun g ↦ κ g + ((1 : A) - 1) • x) = ⊤) ∧
      TauCeti.fittingIdeal A M 0 ≤ I := sorry

end IntegralRibet

end

end TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants
