/-
Copyright (c) 2026 Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Tau Ceti contributors
-/
module

public import Mathlib
public import TauCeti.LinearAlgebra.RootSystem.FiniteType.Basic
public import TauCeti.RingTheory.SerreCondition.Basic

/-!
# Cluster algebras: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The statements below give suggested Lean forms for the headline targets
using the pinned libraries. The classical mutation statements use geometric type or its
coefficient-free case. The Starfish statement uses the realized coordinates over the
chosen coefficient ring.

The quantum Laurent phenomenon needs mutation of polynomial exchange frames and the
resulting faithful toric charts in an Ore division ring (Layer 1). The cluster scattering
diagram (§5.1) needs the completed wall groups from ScatteringDiagrams. The coordinate-ring
theorem (§6.3) needs the double Bruhat cell and generalized minors from Layer 6.
-/

@[expose] public section

noncomputable section

open scoped BigOperators

namespace TauCetiRoadmap.ClusterAlgebras

/-! ## Layer 0: coefficient and ambient algebra -/

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

/-! ## Layer 1: classical and quantum seeds and mutation -/

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

/-- Matrix mutation along a word, applied from the left. -/
def matrixMutationWord {I K : Type*} [DecidableEq I] [DecidableEq K]
    (row : K ↪ I) (B : Matrix I K ℤ) (w : List K) : Matrix I K ℤ :=
  w.foldl (matrixMutation row) B

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

/-! ## Layer 2: upper bounds and the Laurent phenomenon -/

/-- The principal extension `(B; 1)`: the bottom block carries the `c`-vectors. -/
def principalExtension {K : Type*} [DecidableEq K] (B : Matrix K K ℤ) :
    Matrix (K ⊕ K) K ℤ :=
  Matrix.fromRows B 1

/-- The subalgebra generated over `C` by the coordinates and their inverses. -/
def laurentSubalgebra (C : Type*) {I F : Type*} [CommRing C] [Field F] [Algebra C F]
    (x : I → F) : Subalgebra C F :=
  Algebra.adjoin C (Set.range x ∪ Set.range fun i ↦ (x i)⁻¹)

/-- The intersection of the initial and adjacent Laurent subalgebras over `C`. -/
def upperBound (C : Type*) {I K F : Type*} [CommRing C] [Field F] [Algebra C F]
    (x : I → F) (adjacent : K → I → F) : Subalgebra C F :=
  laurentSubalgebra C x ⊓ ⨅ k, laurentSubalgebra C (adjacent k)

/-- **Upper-bound invariance** (README §2.1, geometric type): a full-column-rank
extended matrix gives the same upper bound after every mutation word. -/
theorem upperBound_seedMutationWord {I K F : Type*} [Fintype I] [DecidableEq I]
    [DecidableEq K] [Field F] {row : K ↪ I} (B : ExchangeMatrix row)
    (c : LaurentChart ℤ I F)
    (hrank : LinearIndependent ℚ fun k ↦ fun i ↦ (B.matrix i k : ℚ)) (w : List K) :
    let reached := seedMutationWord row (B.matrix, c.coordinate) w
    upperBound ℤ reached.2 (clusterMutation row reached.1 reached.2) =
      upperBound ℤ c.coordinate (clusterMutation row B.matrix c.coordinate) := by
  sorry

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

/-- **Starfish lemma** (§2.7, `S₂` case): the upper bound lies in the image of the
target ring if the two coprimality conditions hold at height one. -/
theorem upperBound_le_of_starfish {C R F K : Type*} [CommRing C] [CommRing R] [IsDomain R]
    [IsNoetherianRing R] [Field F] [Algebra C R] [Algebra C F] [Algebra R F]
    [IsScalarTower C R F] [IsFractionRing R F] [Finite K] [DecidableEq K]
    (hS₂ : Module.SatisfiesSerreS 2 R R) (x x' : K → R)
    (hx : ∀ i, x i ≠ 0) (hx' : ∀ i, x' i ≠ 0)
    (hcover : ∀ p : Ideal R, p.IsPrime → p.height = 1 →
      (∀ i j, i ≠ j → x i ∉ p ∨ x j ∉ p) ∧ (∀ i, x i ∉ p ∨ x' i ∉ p)) :
    upperBound C (algebraMap R F ∘ x)
        (fun k ↦ algebraMap R F ∘ Function.update x k (x' k)) ≤
      (IsScalarTower.toAlgHom C R F).range := by
  sorry

/-! ## Layer 4: finite type and almost-positive roots -/

/-- The Cartan companion: `2` on the diagonal and `-|b_ij|` off it. -/
def cartanCompanion {K : Type*} [DecidableEq K] (B : Matrix K K ℤ) : Matrix K K ℤ :=
  fun i j ↦ if i = j then 2 else -|B i j|

/-- **Finite type** (§4.1, conditions 1 ⟺ 2, geometric type): finitely many cluster variables
exactly when some mutated principal block has a Cartan companion of finite type. -/
theorem finite_clusterVariables_iff {I K F : Type*} [Fintype I] [DecidableEq I] [DecidableEq K]
    [Field F] {row : K ↪ I} (B : ExchangeMatrix row) (c : LaurentChart ℤ I F) :
    (clusterVariables row B.matrix c).Finite ↔
      ∃ w, TauCeti.IsFiniteType
        (cartanCompanion fun i j ↦ matrixMutationWord row B.matrix w (row i) j) := by
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

/-! ## Layer 5: scattering, positivity and sign-coherence -/

/-- **Laurent positivity** (§5.2, geometric type): the expansion of every reached coordinate has
nonnegative coefficients and nonnegative frozen exponents. -/
theorem exists_nonneg_laurentExpansion {I K F : Type*} [Fintype I] [DecidableEq I]
    [DecidableEq K] [Field F] {row : K ↪ I} (B : ExchangeMatrix row)
    (c : LaurentChart ℤ I F) (w : List K) (i : I) :
    ∃ f : LaurentRing ℤ I, (∀ m, 0 ≤ f.coeff m) ∧
      (∀ m ∈ f.coeff.support, ∀ j ∉ Set.range row, 0 ≤ m j) ∧
        c.toAlgHom f = (seedMutationWord row (B.matrix, c.coordinate) w).2 i := by
  sorry

/-- **Sign-coherence of `c`-vectors** (§5.3): every column of `C_t` is entrywise `≥ 0` or
entrywise `≤ 0`. -/
theorem cVector_signCoherent {K : Type*} [Fintype K] [DecidableEq K]
    (B : ExchangeMatrix (Function.Embedding.refl K)) (w : List K) (k : K) :
    (∀ j, 0 ≤ matrixMutationWord Function.Embedding.inl
        (principalExtension B.matrix) w (Sum.inr j) k) ∨
      (∀ j, matrixMutationWord Function.Embedding.inl
        (principalExtension B.matrix) w (Sum.inr j) k ≤ 0) := by
  sorry

end TauCetiRoadmap.ClusterAlgebras
