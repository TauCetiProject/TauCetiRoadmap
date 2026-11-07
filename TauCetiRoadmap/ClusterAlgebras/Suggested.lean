/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Tau Ceti contributors
-/
module

public import Mathlib
public import TauCeti.Algebra.MonoidAlgebra.Twisted.Basic
public import TauCeti.LinearAlgebra.RootSystem.FiniteType.Basic

/-!
# Cluster algebras: selected interfaces

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones;
discharging all of them finishes neither a layer nor the roadmap. Proof placeholders
denote targets, not implemented mathematics.

These interfaces specify coefficient semifields, faithful charts, exchange data,
polynomial exchange and realization in other algebras. The twisted algebra is the
native Tau Ceti construction. The matrix symmetrizer and form weights are separate;
column independence, mutated-chart faithfulness and Laurentness are conclusions
under their respective README hypotheses, not fields of a seed.

The headline statements are given in their classical geometric-type and coefficient-free
specializations: the Laurent phenomenon (README L8 with L6a), integrality of the Somos-4
sequence (§2.4), the finite-type classification (§4.1, conditions 1–3), Laurent positivity
(§5.2) and sign-coherence of `c`-vectors (§5.3). They use the explicit exchange formula
`clusterMutation` in a field, with the initial cluster given by the coordinates of a faithful
Laurent chart.

The following README headlines are not stated here. The quantum Laurent phenomenon needs the
mutation of polynomial exchange frames, whose mutated faithful chart into the ambient division
ring is itself a Layer 1 target. Upper-bound invariance (§2.1) needs the upper cluster algebra
of §1.4. The coordinate-ring theorem of §6.3 needs the double Bruhat cell `G^{u,v}` and the
generalized minors `Δ_{uω_i,vω_i}`, which Layer 6 constructs. The cluster scattering diagram
of §5.1 is built on ScatteringDiagrams' completed wall groups.

The geometric constructions use the shared lattice data specified in the README.
They are not represented here by substitute structures.
-/

@[expose] public section

noncomputable section

open scoped BigOperators

namespace TauCetiRoadmap.ClusterAlgebras

/-! ## Coefficients and classical charts: §§0.1–0.3, 1.2 -/

/-- A coefficient semifield has auxiliary addition, written `+`, without an additive zero. -/
class CoefficientSemifield (P : Type*) extends CommGroup P, AddCommSemigroup P, Distrib P

/-- Laurent polynomials use the group algebra of finitely supported exponent vectors. -/
abbrev LaurentRing (R : Type*) [CommRing R] (K : Type*) :=
  AddMonoidAlgebra R (K →₀ ℤ)

/-- A faithful chart; generation of the ambient field is a separate condition. -/
structure LaurentChart (R : Type*) [CommRing R] (K : Type*)
    (F : Type*) [Field F] [Algebra R F] where
  toAlgHom : LaurentRing R K →ₐ[R] F
  injective : Function.Injective toAlgHom

/-- The coordinate of a chart at `i`: the image of the monomial `x_i`. -/
def LaurentChart.coordinate {R : Type*} [CommRing R] {K : Type*}
    {F : Type*} [Field F] [Algebra R F] (c : LaurentChart R K F) (i : K) : F :=
  c.toAlgHom (AddMonoidAlgebra.single (Finsupp.single i 1) 1)

/-! ## Matrices and normalized classical seeds: §§1.1–1.2 -/

/-- The mutable indices embed in the full row set; the symmetrizer is positive. -/
structure ExchangeMatrix {I K : Type*} (row : K ↪ I) where
  matrix : Matrix I K ℤ
  symmetrizer : K → ℤ
  symmetrizer_pos : ∀ k, 0 < symmetrizer k
  symmetrized : ∀ i j,
    symmetrizer i * matrix (row i) j = -(symmetrizer j * matrix (row j) i)

/-- FZ column mutation, including the frozen rows. -/
def matrixMutation {I K : Type*} [DecidableEq I] [DecidableEq K]
    (row : K ↪ I) (B : Matrix I K ℤ) (k : K) : Matrix I K ℤ :=
  fun i j ↦ if i = row k ∨ j = k then -B i j else
    B i j + max (B i k) 0 * max (B (row k) j) 0 -
      max (-B i k) 0 * max (-B (row k) j) 0

/-- Symmetrizers of the principal block symmetrize its mutation. -/
theorem matrixMutation_symmetrized {I K : Type*} [DecidableEq I] [DecidableEq K]
    {row : K ↪ I} (B : ExchangeMatrix row) (k i j : K) :
    B.symmetrizer i * matrixMutation row B.matrix k (row i) j =
      -(B.symmetrizer j * matrixMutation row B.matrix k (row j) i) := by
  have h := B.symmetrized
  have pos : ∀ (a : K) (x : ℤ), B.symmetrizer a * max x 0 = max (B.symmetrizer a * x) 0 :=
    fun a x ↦ by rw [mul_max_of_nonneg _ _ (B.symmetrizer_pos a).le, mul_zero]
  by_cases hik : i = k ∨ j = k
  · have hjk : j = k ∨ i = k := hik.symm
    simp only [matrixMutation, row.injective.eq_iff, hik, hjk, ↓reduceIte]
    linear_combination -(h i j)
  · have hjk : ¬(j = k ∨ i = k) := fun h' ↦ hik h'.symm
    simp only [matrixMutation, row.injective.eq_iff, hik, hjk, ↓reduceIte]
    have k1 : B.symmetrizer i * max (B.matrix (row i) k) 0 =
        B.symmetrizer k * max (-B.matrix (row k) i) 0 := by
      rw [pos, pos, mul_neg, h i k]
    have k2 : B.symmetrizer i * max (-B.matrix (row i) k) 0 =
        B.symmetrizer k * max (B.matrix (row k) i) 0 := by
      rw [pos, pos, mul_neg, h i k, neg_neg]
    have k3 : B.symmetrizer k * max (B.matrix (row k) j) 0 =
        B.symmetrizer j * max (-B.matrix (row j) k) 0 := by
      rw [pos, pos, mul_neg, h k j]
    have k4 : B.symmetrizer k * max (-B.matrix (row k) j) 0 =
        B.symmetrizer j * max (B.matrix (row j) k) 0 := by
      rw [pos, pos, mul_neg, h k j, neg_neg]
    linear_combination h i j + max (B.matrix (row k) j) 0 * k1 +
      max (-B.matrix (row k) i) 0 * k3 - max (-B.matrix (row k) j) 0 * k2 -
      max (B.matrix (row k) i) 0 * k4

/-- Matrix mutation keeps the symmetrizer. -/
def ExchangeMatrix.mutate {I K : Type*} [DecidableEq I] [DecidableEq K]
    {row : K ↪ I} (B : ExchangeMatrix row) (k : K) : ExchangeMatrix row where
  matrix := matrixMutation row B.matrix k
  symmetrizer := B.symmetrizer
  symmetrizer_pos := B.symmetrizer_pos
  symmetrized := matrixMutation_symmetrized B k

theorem ExchangeMatrix.mutate_involutive {I K : Type*}
    [DecidableEq I] [DecidableEq K] {row : K ↪ I}
    (B : ExchangeMatrix row) (k : K) : (B.mutate k).mutate k = B := by
  sorry

/-- Matrix mutation along a word, applied from the left. -/
def matrixMutationWord {I K : Type*} [DecidableEq I] [DecidableEq K]
    (row : K ↪ I) (B : Matrix I K ℤ) (w : List K) : Matrix I K ℤ :=
  w.foldl (matrixMutation row) B

/-- Matrix and coefficient data, independent of an ambient chart. -/
structure YSeed (P : Type*) [CoefficientSemifield P] (K : Type*) where
  exchange : ExchangeMatrix (Function.Embedding.refl K)
  coefficient : K → P

/-- A normalized coefficient realization over an arbitrary domain. The coefficient
map is multiplicative; it need not preserve auxiliary addition or be injective. -/
structure ClassicalSeed (P : Type*) [CoefficientSemifield P]
    (K : Type*) [Fintype K] (C : Type*) [CommRing C] [IsDomain C]
    (F : Type*) [Field F] [Algebra C F] where
  ySeed : YSeed P K
  coefficientMap : P →* Cˣ
  chart : LaurentChart C K F
  generates : Subfield.closure (Set.range chart.toAlgHom) = ⊤
  zeroColumn_nonvanishing : ∀ k, (∀ i, ySeed.exchange.matrix i k = 0) →
    (coefficientMap (ySeed.coefficient k) : C) + 1 ≠ 0

/-! ## Geometric-type exchange in a field: §§1.1–1.4 -/

/-- One FZ exchange of geometric type in the column convention: the coordinate at `row k`
becomes `(∏ x_i^{[b_ik]_+} + ∏ x_i^{[-b_ik]_+}) / x_{row k}`; the others are kept. -/
def clusterMutation {I K F : Type*} [Fintype I] [DecidableEq I] [Field F]
    (row : K ↪ I) (B : Matrix I K ℤ) (x : I → F) (k : K) : I → F :=
  Function.update x (row k)
    ((∏ i, x i ^ (B i k).toNat + ∏ i, x i ^ (-B i k).toNat) / x (row k))

/-- The matrix and coordinates after mutation along a word, applied from the left. -/
def seedMutationWord {I K F : Type*} [Fintype I] [DecidableEq I] [DecidableEq K] [Field F]
    (row : K ↪ I) (s : Matrix I K ℤ × (I → F)) (w : List K) : Matrix I K ℤ × (I → F) :=
  w.foldl (fun s k ↦ (matrixMutation row s.1 k, clusterMutation row s.1 s.2 k)) s

/-- The cluster variables: mutable coordinates reached from the chart coordinates. -/
def clusterVariables {I K F : Type*} [Fintype I] [DecidableEq I] [DecidableEq K] [Field F]
    (row : K ↪ I) (B : Matrix I K ℤ) (c : LaurentChart ℤ I F) : Set F :=
  {y | ∃ (w : List K) (k : K), y = (seedMutationWord row (B, c.coordinate) w).2 (row k)}

/-! ## Headline statements: Layers 2, 4 and 5 -/

/-- **The Laurent phenomenon** (README L8 with L6a, geometric type): every reached coordinate is
the image of an integral Laurent polynomial whose frozen exponents are nonnegative. -/
theorem exists_laurentExpansion {I K F : Type*} [Fintype I] [DecidableEq I] [DecidableEq K]
    [Field F] {row : K ↪ I} (B : ExchangeMatrix row) (c : LaurentChart ℤ I F)
    (w : List K) (i : I) :
    ∃ f : LaurentRing ℤ I,
      (∀ m ∈ f.coeff.support, ∀ j ∉ Set.range row, 0 ≤ m j) ∧
        c.toAlgHom f = (seedMutationWord row (B.matrix, c.coordinate) w).2 i := by
  sorry

/-- **Integrality of the Somos-4 sequence** (§2.4). -/
theorem somos4_exists_pos_nat (b : ℕ → ℚ) (h₀ : b 0 = 1) (h₁ : b 1 = 1) (h₂ : b 2 = 1)
    (h₃ : b 3 = 1) (hrec : ∀ n, b (n + 4) * b n = b (n + 1) * b (n + 3) + b (n + 2) ^ 2)
    (n : ℕ) : ∃ m : ℕ, 0 < m ∧ b n = m := by
  sorry

/-- The Cartan companion: `2` on the diagonal and `-|b_ij|` off it. -/
def cartanCompanion {K : Type*} [DecidableEq K] (B : Matrix K K ℤ) : Matrix K K ℤ :=
  fun i j ↦ if i = j then 2 else -|B i j|

/-- **Finite type** (§4.1, conditions 1 ⟺ 2, coefficient-free): finitely many cluster variables
exactly when some matrix in the mutation class has a Cartan companion of finite type. -/
theorem finite_clusterVariables_iff {K F : Type*} [Fintype K] [DecidableEq K] [Field F]
    (B : ExchangeMatrix (Function.Embedding.refl K)) (c : LaurentChart ℤ K F) :
    (clusterVariables (Function.Embedding.refl K) B.matrix c).Finite ↔
      ∃ w, TauCeti.IsFiniteType
        (cartanCompanion (matrixMutationWord (Function.Embedding.refl K) B.matrix w)) := by
  sorry

/-- **2-finiteness** (§4.1, conditions 2 ⟺ 3). -/
theorem exists_isFiniteType_iff_forall_le_three {K : Type*} [Fintype K] [DecidableEq K]
    (B : ExchangeMatrix (Function.Embedding.refl K)) :
    (∃ w, TauCeti.IsFiniteType
        (cartanCompanion (matrixMutationWord (Function.Embedding.refl K) B.matrix w))) ↔
      ∀ w i j, i ≠ j →
        |matrixMutationWord (Function.Embedding.refl K) B.matrix w i j *
          matrixMutationWord (Function.Embedding.refl K) B.matrix w j i| ≤ 3 := by
  sorry

/-- **Laurent positivity** (§5.2, geometric type): the expansion of every reached coordinate has
nonnegative coefficients and nonnegative frozen exponents. -/
theorem exists_nonneg_laurentExpansion {I K F : Type*} [Fintype I] [DecidableEq I]
    [DecidableEq K] [Field F] {row : K ↪ I} (B : ExchangeMatrix row)
    (c : LaurentChart ℤ I F) (w : List K) (i : I) :
    ∃ f : LaurentRing ℤ I, (∀ m, 0 ≤ f.coeff m) ∧
      (∀ m ∈ f.coeff.support, ∀ j ∉ Set.range row, 0 ≤ m j) ∧
        c.toAlgHom f = (seedMutationWord row (B.matrix, c.coordinate) w).2 i := by
  sorry

/-- The principal extension `(B; 1)`: the bottom block carries the `c`-vectors. -/
def principalExtension {K : Type*} [DecidableEq K] (B : Matrix K K ℤ) :
    Matrix (K ⊕ K) K ℤ :=
  Matrix.fromRows B 1

/-- **Sign-coherence of `c`-vectors** (§5.3): every column of `C_t` is entrywise `≥ 0` or
entrywise `≤ 0`. -/
theorem cVector_signCoherent {K : Type*} [Fintype K] [DecidableEq K]
    (B : ExchangeMatrix (Function.Embedding.refl K)) (w : List K) (k : K) :
    (∀ j, 0 ≤ matrixMutationWord Function.Embedding.inl
        (principalExtension B.matrix) w (Sum.inr j) k) ∨
      (∀ j, matrixMutationWord Function.Embedding.inl
        (principalExtension B.matrix) w (Sum.inr j) k ≤ 0) := by
  sorry

/-! ## Based quantum tori: §0.4 -/

/-- The cocycle of a bilinear form on the exponent group. -/
def latticeCocycle {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) :
    Multiplicative L → Multiplicative L → Rˣ :=
  fun a b ↦ u ^ Λ a.toAdd b.toAdd

instance latticeCocycle_isFactorSet {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) :
    TauCeti.IsFactorSet (latticeCocycle u Λ) where
  cocycle g h j := by
    simp only [latticeCocycle, toAdd_mul, map_add, LinearMap.add_apply, zpow_add]
    simp only [mul_assoc, mul_comm]
  one_left g := by simp [latticeCocycle]
  one_right g := by simp [latticeCocycle]

/-- This abbreviation instantiates the native twisted algebra. -/
abbrev BasedTorus (R : Type*) [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) :=
  TauCeti.twistedMonoidAlgebra R (Multiplicative L) (latticeCocycle u Λ)

/-- Normalized monomials are the native basis elements. -/
def torusMonomial {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) (a : L) :
    BasedTorus R u Λ :=
  TauCeti.TwistedMonoidAlgebra.of (Multiplicative.ofAdd a)

/-- The multiplication convention: `M(a) M(b) = u^{Λ(a,b)} M(a+b)`. -/
theorem torusMonomial_mul {R : Type*} [CommRing R] (u : Rˣ)
    {L : Type*} [AddCommGroup L] (Λ : LinearMap.BilinForm ℤ L) (a b : L) :
    torusMonomial u Λ a * torusMonomial u Λ b =
      ((u ^ Λ a b : Rˣ) : R) • torusMonomial u Λ (a + b) := by
  simp [torusMonomial, BasedTorus, latticeCocycle, ofAdd_add,
    TauCeti.TwistedMonoidAlgebra.of_mul_of]

/-! ## Compatible data and polynomial exchange frames: §1.5 -/

/-- Compatibility has separate integral weights, which may be zero or negative. -/
structure CompatibleData {I K : Type*} [Fintype I] [DecidableEq I]
    (row : K ↪ I) where
  exchange : ExchangeMatrix row
  form : Matrix I I ℤ
  alternating : LinearMap.IsAlt (Matrix.toBilin' form)
  weight : K → ℤ
  compatible : ∀ k j, ∑ i, exchange.matrix i k * form i j =
    if j = row k then weight k else 0

/-- Positive compatibility forces full column rank; it is not a seed input. -/
theorem CompatibleData.independentColumns {I K : Type*} [Fintype I] [DecidableEq I]
    {row : K ↪ I} (c : CompatibleData row) (hpos : ∀ k, 0 < c.weight k) :
    LinearIndependent ℚ (fun k ↦ fun i ↦ (c.exchange.matrix i k : ℚ)) := by
  sorry

/-- An exchange frame contains only compatible data and one faithful chart.
The chart need not generate the entire ambient division ring. -/
structure ExchangeFrame (R : Type*) [CommRing R] (u : Rˣ)
    (D : Type*) [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] (row : K ↪ I)
    extends CompatibleData row where
  chart : BasedTorus R u (Matrix.toBilin' form) →ₐ[R] D
  faithful : Function.Injective chart

/-- Scalar polynomial data; normalization and zero-column nonvanishing are explicit. -/
structure PolynomialData (R : Type*) [CommRing R] {I K : Type*}
    {row : K ↪ I} (B : ExchangeMatrix row) where
  polynomial : K → Polynomial R
  monic : ∀ k, (polynomial k).Monic
  constant_one : ∀ k, (polynomial k).coeff 0 = 1
  degree_pos : ∀ k, 0 < (polynomial k).natDegree
  degree_dvd : ∀ i k, ((polynomial k).natDegree : ℤ) ∣ B.matrix i k
  zeroColumn_nonvanishing : ∀ k, (∀ i, B.matrix i k = 0) →
    (polynomial k).eval 1 ≠ 0

/-- A polynomial frame adds scalar polynomials to the faithful initial chart. -/
structure PolynomialFrame (R : Type*) [CommRing R] (u : Rˣ)
    (D : Type*) [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] (row : K ↪ I)
    extends ExchangeFrame R u D row where
  exchangePolynomials : PolynomialData R exchange

/-- The divided column in a polynomial frame. -/
def PolynomialFrame.dividedColumn {R : Type*} [CommRing R] {u : Rˣ}
    {D : Type*} [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] {row : K ↪ I}
    (s : PolynomialFrame R u D row) (k : K) : I → ℤ :=
  fun i ↦ s.exchange.matrix i k / (s.exchangePolynomials.polynomial k).natDegree

/-- The actual polynomial exchange expression in the ambient division ring. -/
def PolynomialFrame.exchangeCoordinate {R : Type*} [CommRing R] {u : Rˣ}
    {D : Type*} [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] {row : K ↪ I}
    (s : PolynomialFrame R u D row) (k : K) : D :=
  let H := s.exchangePolynomials.polynomial k
  let b := s.dividedColumn k
  ∑ l ∈ Finset.range (H.natDegree + 1),
    algebraMap R D (H.coeff l) * s.chart (torusMonomial u (Matrix.toBilin' s.form)
      (fun i ↦ -(if i = row k then 1 else 0) +
        (l : ℤ) * max (b i) 0 + ((H.natDegree - l : ℕ) : ℤ) * max (-b i) 0))

/-- Nonvanishing is proved from the frame data, including the zero-column case. -/
theorem PolynomialFrame.exchangeCoordinate_ne_zero {R : Type*} [CommRing R] {u : Rˣ}
    {D : Type*} [DivisionRing D] [Algebra R D]
    {I K : Type*} [Fintype I] [DecidableEq I] {row : K ↪ I}
    (s : PolynomialFrame R u D row) (k : K) : s.exchangeCoordinate k ≠ 0 := by
  sorry

/-! ## Polynomial realization in another algebra: §§0.4, 1.6 and Q4 -/

/-- The subalgebra generated by the coordinate monomials; frozen generators are
not inverted. Its support characterization is part of §0.4. -/
def polynomialSubalgebra {R : Type*} [CommRing R] (u : Rˣ)
    {I : Type*} [Fintype I] [DecidableEq I] (Λ : LinearMap.BilinForm ℤ (I → ℤ)) :
    Subalgebra R (BasedTorus R u Λ) :=
  Algebra.adjoin R (Set.range fun i ↦ torusMonomial u Λ (Pi.single i 1))

/-- A realization embeds the polynomial algebra, rather than requiring its
generators to be units in the target algebra. -/
structure PolynomialRealization {R : Type*} [CommRing R] (u : Rˣ)
    {I : Type*} [Fintype I] [DecidableEq I] (Λ : LinearMap.BilinForm ℤ (I → ℤ))
    (A : Type*) [Ring A] [Algebra R A] where
  alternating : LinearMap.IsAlt Λ
  toAlgHom : polynomialSubalgebra u Λ →ₐ[R] A
  injective : Function.Injective toAlgHom

end TauCetiRoadmap.ClusterAlgebras
