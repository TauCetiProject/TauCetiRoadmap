/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.LinearAlgebra.CliffordAlgebra.Even
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.UnitaryGroup
import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Basic.Sign.Basic

/-!
# Quadratic Majorana Hamiltonians and the Kitaev chain: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's headline theorems, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap. Each is statable against the pinned Mathlib, with `sorry`, and every definition has its
real body.

The headline theorems are:

* Layer 1: the Pfaffian, its congruence rule `pf (B A Bᵀ) = det B · pf A`, Cayley's identity
  `det A = (pf A)²`, and the Pfaffian of a matrix that couples two sublattices;
* Layer 2: the orthogonal normal form of a real skew-symmetric matrix, and the Pfaffian as
  `det W` times the product of the block moduli;
* Layer 3: the two commutator formulas for `H_A`, the parity element, its behaviour under an
  orthogonal change of generators, and the Majorana form of a pairing Hamiltonian;
* Layer 4: the Jordan–Wigner representation, the characteristic polynomial of `H_A` in it, and
  the parity of the ground state as the sign of the Pfaffian;
* Layer 5: the Kitaev chain at `μ = 0`, `Δ = w`, its end modes, the zeros of the dispersion of
  the closed chain, and the Pfaffian of the closed chain with its sign rule.

Conventions: generators are numbered from `0`, so the two generators of site `j : Fin N`, written
`c_{2j−1}` and `c_{2j}` in the README, are `majorana (2 * N) (siteA j)` and
`majorana (2 * N) (siteB j)`. Commutators are written out as `x * y - y * x`.

The following are verbatim copies of definitions that are not at the pins, so that the
statements below elaborate against the pinned Mathlib alone. An implementation uses the
originals.

* `cliffordForm`, `majorana`: `TauCeti.TemperleyLieb.cliffordForm` and
  `TauCeti.TemperleyLieb.majorana`, which are in Tau Ceti's main branch and not at the pin.
* `spin`, `diagHam`, `pauliX`: QuantumOptimization §1.1 and §3.1, roadmap targets.
* In `pfaffian`, the condition `Function.Involutive D ∧ ∀ a, D a ≠ a` is
  `TauCeti.IsPerfectMatching D` and the product is `TauCeti.PerfectMatching.weight`; an
  implementation sums over `TauCeti.PerfectMatching α`.

The README targets that mention `cliffordAdjoint`, `bivectorExterior` or `bivectorEquivSo` are
not stated here, because those declarations are not at the pin.
-/

open Matrix Polynomial

namespace TauCetiRoadmap.QuadraticMajoranaHamiltonians

/-! ## Layer 1: Pfaffians -/

section Pfaffian

variable {α R : Type*} [Fintype α] [LinearOrder α] [CommRing R]

/-- 1.1: the number of pairs `x < y < D x < D y`; for a perfect matching, the number of pairs
of arcs that cross. -/
def matchingCrossings (D : Equiv.Perm α) : ℕ :=
  (Finset.univ.filter fun p : α × α ↦ p.1 < p.2 ∧ p.2 < D p.1 ∧ D p.1 < D p.2).card

open Classical in
/-- 1.1: the Pfaffian, as the signed sum over perfect matchings. -/
noncomputable def pfaffian (A : Matrix α α R) : R :=
  ∑ D : Equiv.Perm α,
    if Function.Involutive D ∧ ∀ a, D a ≠ a then
      (-1) ^ matchingCrossings D * ∏ x : α, if x < D x then A x (D x) else 1
    else 0

/-- 1.1: the Pfaffian of a `4 × 4` matrix. -/
theorem pfaffian_fin_four (A : Matrix (Fin 4) (Fin 4) R) :
    pfaffian A = A 0 1 * A 2 3 - A 0 2 * A 1 3 + A 0 3 * A 1 2 := by
  sorry

/-- 1.2: congruence multiplies the Pfaffian by the determinant. -/
theorem pfaffian_mul_mul_transpose (A B : Matrix α α R) (hA : Aᵀ = -A) (hd : ∀ i, A i i = 0) :
    pfaffian (B * A * Bᵀ) = B.det * pfaffian A := by
  sorry

/-- 1.2: Cayley's identity. -/
theorem det_eq_pfaffian_sq (A : Matrix α α R) (hA : Aᵀ = -A) (hd : ∀ i, A i i = 0) :
    A.det = pfaffian A ^ 2 := by
  sorry

/-- 1.3: the skew matrix coupling generator `2j` to generator `2k + 1` by `M j k`. -/
def bipartiteSkew {N : ℕ} (M : Matrix (Fin N) (Fin N) R) :
    Matrix (Fin (2 * N)) (Fin (2 * N)) R :=
  Matrix.of fun a b ↦
    if a.val % 2 = 0 ∧ b.val % 2 = 1 then
      M ⟨a.val / 2, Nat.div_lt_of_lt_mul a.isLt⟩ ⟨b.val / 2, Nat.div_lt_of_lt_mul b.isLt⟩
    else if a.val % 2 = 1 ∧ b.val % 2 = 0 then
      -M ⟨b.val / 2, Nat.div_lt_of_lt_mul b.isLt⟩ ⟨a.val / 2, Nat.div_lt_of_lt_mul a.isLt⟩
    else 0

/-- 1.3: the Pfaffian of a matrix coupling the two sublattices is a determinant. -/
theorem pfaffian_bipartiteSkew {N : ℕ} (M : Matrix (Fin N) (Fin N) R) :
    pfaffian (bipartiteSkew M) = M.det := by
  sorry

end Pfaffian

/-! ## Layer 2: the normal form of a real skew-symmetric matrix -/

/-- 2.1: `W` is orthogonal and brings `A` to blocks `[[0, ε k], [-ε k, 0]]` with `ε k ≥ 0`. -/
def IsNormalForm {N : ℕ} (A W : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ) (ε : Fin N → ℝ) : Prop :=
  W ∈ Matrix.orthogonalGroup (Fin (2 * N)) ℝ ∧ (∀ k, 0 ≤ ε k) ∧
    W * A * Wᵀ = bipartiteSkew (Matrix.diagonal ε)

/-- 2.1: every real skew-symmetric matrix of even size has a normal form. -/
theorem exists_isNormalForm {N : ℕ} (A : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ) (hA : Aᵀ = -A) :
    ∃ W ε, IsNormalForm A W ε := by
  sorry

/-- 2.2: the characteristic polynomial in terms of the block moduli. -/
theorem IsNormalForm.charpoly {N : ℕ} {A W : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ}
    {ε : Fin N → ℝ} (h : IsNormalForm A W ε) :
    A.charpoly = ∏ k, (X ^ 2 + C (ε k ^ 2)) := by
  sorry

/-- 2.2: the Pfaffian is `det W` times the product of the block moduli. -/
theorem IsNormalForm.pfaffian_eq {N : ℕ} {A W : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ}
    {ε : Fin N → ℝ} (h : IsNormalForm A W ε) :
    pfaffian A = W.det * ∏ k, ε k := by
  sorry

/-! ## Layer 3: quadratic elements of the Clifford algebra -/

/-- Copy of `TauCeti.TemperleyLieb.cliffordForm`: the sum of squares on `Fin m → ℂ`. -/
noncomputable def cliffordForm (m : ℕ) : QuadraticForm ℂ (Fin m → ℂ) :=
  QuadraticMap.weightedSumSquares ℂ (1 : Fin m → ℂ)

/-- Copy of `TauCeti.TemperleyLieb.majorana`: the `j`-th generator. -/
noncomputable def majorana (m : ℕ) (j : Fin m) : CliffordAlgebra (cliffordForm m) :=
  CliffordAlgebra.ι (cliffordForm m) (Pi.single j 1)

/-- Conventions: the index of the first generator of site `j`, `c_{2j−1}` in the README. -/
def siteA {N : ℕ} (j : Fin N) : Fin (2 * N) := ⟨2 * j.val, by have := j.isLt; omega⟩

/-- Conventions: the index of the second generator of site `j`, `c_{2j}` in the README. -/
def siteB {N : ℕ} (j : Fin N) : Fin (2 * N) := ⟨2 * j.val + 1, by have := j.isLt; omega⟩

/-- 3.1: the quadratic Hamiltonian `H_A = (i/4) Σ A_lk c_l c_k`. -/
noncomputable def quadraticHamiltonian {m : ℕ} (A : Matrix (Fin m) (Fin m) ℝ) :
    CliffordAlgebra (cliffordForm m) :=
  (Complex.I / 4) • ∑ l, ∑ k, (A l k : ℂ) • (majorana m l * majorana m k)

/-- 3.1: the real combination `c(v) = Σ v_l c_l` of generators. -/
noncomputable def majoranaVector {m : ℕ} (v : Fin m → ℝ) : CliffordAlgebra (cliffordForm m) :=
  ∑ l, (v l : ℂ) • majorana m l

/-- 3.1: `[H_A, c(v)] = i c(A v)`. -/
theorem quadraticHamiltonian_lie_majoranaVector {m : ℕ} (A : Matrix (Fin m) (Fin m) ℝ)
    (hA : Aᵀ = -A) (v : Fin m → ℝ) :
    quadraticHamiltonian A * majoranaVector v - majoranaVector v * quadraticHamiltonian A =
      Complex.I • majoranaVector (A *ᵥ v) := by
  sorry

/-- 3.1: `[H_A, H_B] = i H_{AB − BA}`. -/
theorem quadraticHamiltonian_lie {m : ℕ} (A B : Matrix (Fin m) (Fin m) ℝ)
    (hA : Aᵀ = -A) (hB : Bᵀ = -B) :
    quadraticHamiltonian A * quadraticHamiltonian B -
        quadraticHamiltonian B * quadraticHamiltonian A =
      Complex.I • quadraticHamiltonian (A * B - B * A) := by
  sorry

/-- 3.2: the parity element, the ordered product of `−i c_{2j−1} c_{2j}` over the sites. -/
noncomputable def parityElement (N : ℕ) : CliffordAlgebra (cliffordForm (2 * N)) :=
  (List.ofFn fun j : Fin N ↦
    (-Complex.I) • (majorana (2 * N) (siteA j) * majorana (2 * N) (siteB j))).prod

/-- 3.2: the parity element squares to `1`. -/
theorem parityElement_mul_self (N : ℕ) : parityElement N * parityElement N = 1 := by
  sorry

/-- 3.2: the parity element anticommutes with every generator. -/
theorem parityElement_mul_majorana (N : ℕ) (l : Fin (2 * N)) :
    parityElement N * majorana (2 * N) l = -(majorana (2 * N) l * parityElement N) := by
  sorry

/-- 3.2: the parity element commutes with every quadratic Hamiltonian. -/
theorem parityElement_commute_quadraticHamiltonian (N : ℕ)
    (A : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ) :
    Commute (parityElement N) (quadraticHamiltonian A) := by
  sorry

/-- 3.3: an orthogonal matrix defines exactly one change of generators. -/
theorem orthogonalMap_majorana {m : ℕ} (W : Matrix (Fin m) (Fin m) ℝ)
    (hW : W ∈ Matrix.orthogonalGroup (Fin m) ℝ) :
    ∃! α : CliffordAlgebra (cliffordForm m) →ₐ[ℂ] CliffordAlgebra (cliffordForm m),
      ∀ l, α (majorana m l) = ∑ k, (W l k : ℂ) • majorana m k := by
  sorry

/-- 3.3: an orthogonal change of generators sends `H_A` to `H_{Wᵀ A W}`. -/
theorem orthogonalMap_quadraticHamiltonian {m : ℕ} (W A : Matrix (Fin m) (Fin m) ℝ)
    (hW : W ∈ Matrix.orthogonalGroup (Fin m) ℝ) (hA : Aᵀ = -A)
    (α : CliffordAlgebra (cliffordForm m) →ₐ[ℂ] CliffordAlgebra (cliffordForm m))
    (hα : ∀ l, α (majorana m l) = ∑ k, (W l k : ℂ) • majorana m k) :
    α (quadraticHamiltonian A) = quadraticHamiltonian (Wᵀ * A * W) := by
  sorry

/-- 3.3: an orthogonal change of generators multiplies the parity element by `det W`. -/
theorem orthogonalMap_parityElement {N : ℕ} (W : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ)
    (hW : W ∈ Matrix.orthogonalGroup (Fin (2 * N)) ℝ)
    (α : CliffordAlgebra (cliffordForm (2 * N)) →ₐ[ℂ] CliffordAlgebra (cliffordForm (2 * N)))
    (hα : ∀ l, α (majorana (2 * N) l) = ∑ k, (W l k : ℂ) • majorana (2 * N) k) :
    α (parityElement N) = (W.det : ℂ) • parityElement N := by
  sorry

/-- 3.4: the annihilation operator `a_j = (c_{2j−1} + i c_{2j})/2`. -/
noncomputable def annihilation (N : ℕ) (j : Fin N) : CliffordAlgebra (cliffordForm (2 * N)) :=
  (1 / 2 : ℂ) • (majorana (2 * N) (siteA j) + Complex.I • majorana (2 * N) (siteB j))

/-- 3.4: the creation operator `a_j† = (c_{2j−1} − i c_{2j})/2`. -/
noncomputable def creation (N : ℕ) (j : Fin N) : CliffordAlgebra (cliffordForm (2 * N)) :=
  (1 / 2 : ℂ) • (majorana (2 * N) (siteA j) - Complex.I • majorana (2 * N) (siteB j))

/-- 3.4: the canonical anticommutation relation between `a_j` and `a_k†`. -/
theorem annihilation_mul_creation_add (N : ℕ) (j k : Fin N) :
    annihilation N j * creation N k + creation N k * annihilation N j =
      if j = k then 1 else 0 := by
  sorry

/-- 3.4: the Hamiltonian with hopping matrix `h` and pairing matrix `D`. -/
noncomputable def pairingHamiltonian {N : ℕ} (h D : Matrix (Fin N) (Fin N) ℝ) :
    CliffordAlgebra (cliffordForm (2 * N)) :=
  ∑ j, ∑ k, (h j k : ℂ) • (creation N j * annihilation N k)
    - algebraMap ℂ _ ((h.trace : ℂ) / 2)
    + (1 / 2 : ℂ) • ∑ j, ∑ k, (D j k : ℂ) •
        (creation N j * creation N k + annihilation N k * annihilation N j)

/-- 3.4: a pairing Hamiltonian with real coefficients is `H_A` for `A = bipartiteSkew (h − D)`. -/
theorem pairingHamiltonian_eq_quadraticHamiltonian {N : ℕ} (h D : Matrix (Fin N) (Fin N) ℝ)
    (hh : hᵀ = h) (hD : Dᵀ = -D) :
    pairingHamiltonian h D = quadraticHamiltonian (bipartiteSkew (h - D)) := by
  sorry

/-! ## Layer 4: the Jordan–Wigner representation and the spectrum -/

section JordanWigner

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Copy of QuantumOptimization 1.1: `−1` if `x i` is true and `1` otherwise. -/
def spin (x : ι → Bool) (i : ι) : ℝ := if x i then -1 else 1

/-- Copy of QuantumOptimization 3.1: the diagonal matrix with entries `C x`. -/
def diagHam (C : (ι → Bool) → ℝ) : Matrix (ι → Bool) (ι → Bool) ℂ :=
  Matrix.diagonal fun x ↦ (C x : ℂ)

/-- Copy of QuantumOptimization 3.1: the Pauli operator `X` on qubit `i`. -/
def pauliX (i : ι) : Matrix (ι → Bool) (ι → Bool) ℂ :=
  Matrix.of fun x y ↦ if y = Function.update x i (!x i) then 1 else 0

end JordanWigner

/-- 4.1: the Jordan–Wigner matrix of the generator `l`. -/
noncomputable def jordanWignerGen (N : ℕ) (l : Fin (2 * N)) :
    Matrix (Fin N → Bool) (Fin N → Bool) ℂ :=
  let j : Fin N := ⟨l.val / 2, Nat.div_lt_of_lt_mul l.isLt⟩
  let S : Matrix (Fin N → Bool) (Fin N → Bool) ℂ :=
    diagHam fun x ↦ ∏ k : Fin N, if k < j then spin x k else 1
  if l.val % 2 = 0 then pauliX j * S
  else (Complex.I • (pauliX j * diagHam (spin · j))) * S

/-- 4.1: the Jordan–Wigner matrices define exactly one representation of the Clifford algebra. -/
theorem exists_unique_jordanWigner (N : ℕ) :
    ∃! ρ : CliffordAlgebra (cliffordForm (2 * N)) →ₐ[ℂ] Matrix (Fin N → Bool) (Fin N → Bool) ℂ,
      ∀ l, ρ (majorana (2 * N) l) = jordanWignerGen N l := by
  sorry

/-- 4.1: the Jordan–Wigner representation is an isomorphism onto the full matrix algebra. -/
theorem jordanWigner_bijective (N : ℕ)
    (ρ : CliffordAlgebra (cliffordForm (2 * N)) →ₐ[ℂ] Matrix (Fin N → Bool) (Fin N → Bool) ℂ)
    (hρ : ∀ l, ρ (majorana (2 * N) l) = jordanWignerGen N l) :
    Function.Bijective ρ := by
  sorry

/-- 4.1: the parity element is the diagonal matrix of `(−1)^(number of occupied modes)`. -/
theorem jordanWigner_parityElement (N : ℕ)
    (ρ : CliffordAlgebra (cliffordForm (2 * N)) →ₐ[ℂ] Matrix (Fin N → Bool) (Fin N → Bool) ℂ)
    (hρ : ∀ l, ρ (majorana (2 * N) l) = jordanWignerGen N l) :
    ρ (parityElement N) = diagHam fun x ↦ ∏ j, spin x j := by
  sorry

/-- 4.2: `H_A` is represented by a Hermitian matrix. -/
theorem jordanWigner_quadraticHamiltonian_isHermitian (N : ℕ)
    (ρ : CliffordAlgebra (cliffordForm (2 * N)) →ₐ[ℂ] Matrix (Fin N → Bool) (Fin N → Bool) ℂ)
    (hρ : ∀ l, ρ (majorana (2 * N) l) = jordanWignerGen N l)
    (A : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ) (hA : Aᵀ = -A) :
    (ρ (quadraticHamiltonian A)).IsHermitian := by
  sorry

/-- 4.2: the eigenvalues of `H_A` are the `2^N` numbers `½ Σ ±ε_k`. -/
theorem charpoly_jordanWigner_quadraticHamiltonian (N : ℕ)
    (ρ : CliffordAlgebra (cliffordForm (2 * N)) →ₐ[ℂ] Matrix (Fin N → Bool) (Fin N → Bool) ℂ)
    (hρ : ∀ l, ρ (majorana (2 * N) l) = jordanWignerGen N l)
    {A W : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ} {ε : Fin N → ℝ} (hA : Aᵀ = -A)
    (h : IsNormalForm A W ε) :
    (ρ (quadraticHamiltonian A)).charpoly =
      ∏ σ : Fin N → Bool,
        (X - C ((1 / 2 : ℂ) * ∑ k, if σ k then (ε k : ℂ) else -(ε k : ℂ))) := by
  sorry

/-- 4.3: for invertible `A`, the ground state has parity `sign (pfaffian A)`. -/
theorem groundState_parity (N : ℕ)
    (ρ : CliffordAlgebra (cliffordForm (2 * N)) →ₐ[ℂ] Matrix (Fin N → Bool) (Fin N → Bool) ℂ)
    (hρ : ∀ l, ρ (majorana (2 * N) l) = jordanWignerGen N l)
    {A W : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ} {ε : Fin N → ℝ} (hA : Aᵀ = -A)
    (h : IsNormalForm A W ε) (hpf : pfaffian A ≠ 0) (ψ : (Fin N → Bool) → ℂ)
    (hψ : ρ (quadraticHamiltonian A) *ᵥ ψ = (-(1 / 2 : ℂ) * ∑ k, (ε k : ℂ)) • ψ) :
    ρ (parityElement N) *ᵥ ψ = (SignType.sign (pfaffian A) : ℂ) • ψ := by
  sorry

/-! ## Layer 5: the Kitaev chain -/

/-- 5.1: the coupling matrix of the open chain. -/
def kitaevCoupling (N : ℕ) (w μ Δ : ℝ) : Matrix (Fin N) (Fin N) ℝ :=
  Matrix.of fun j k ↦
    (if j = k then -μ else 0) + (if j.val = k.val + 1 then -(w + Δ) else 0)
      + (if k.val = j.val + 1 then Δ - w else 0)

/-- 5.1: the skew matrix of the open chain. -/
def kitaevMatrix (N : ℕ) (w μ Δ : ℝ) : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ :=
  bipartiteSkew (kitaevCoupling N w μ Δ)

/-- 5.2: at `μ = 0`, `Δ = w` the Hamiltonian is `i w Σ c_{2j} c_{2j+1}`, and the two end
generators do not occur in it. -/
theorem kitaev_sweetSpot (N : ℕ) (w : ℝ) :
    quadraticHamiltonian (kitaevMatrix N w 0 w) =
      (Complex.I * (w : ℂ)) • ∑ j : Fin N,
        if h : j.val + 1 < N then
          majorana (2 * N) (siteB j) * majorana (2 * N) (siteA ⟨j.val + 1, h⟩)
        else 0 := by
  sorry

/-- 5.3: for `Δ = w ≠ 0` the combination `Σ x^(j−1) c_{2j−1}`, `x = −μ/(2w)`, commutes with the
Hamiltonian up to one term at the far end. -/
theorem kitaev_edgeMode (N : ℕ) (hN : 1 ≤ N) (w μ : ℝ) (hw : w ≠ 0) :
    quadraticHamiltonian (kitaevMatrix N w μ w) *
          (∑ j : Fin N, (((-μ / (2 * w)) ^ j.val : ℝ) : ℂ) • majorana (2 * N) (siteA j)) -
        (∑ j : Fin N, (((-μ / (2 * w)) ^ j.val : ℝ) : ℂ) • majorana (2 * N) (siteA j)) *
          quadraticHamiltonian (kitaevMatrix N w μ w) =
      (Complex.I * ((μ * (-μ / (2 * w)) ^ (N - 1) : ℝ) : ℂ)) •
        majorana (2 * N) (siteB ⟨N - 1, by omega⟩) := by
  sorry

/-- 5.4: the coupling matrix of the closed chain, indices modulo `N`. -/
def kitaevCouplingPeriodic (N : ℕ) (w μ Δ : ℝ) : Matrix (Fin N) (Fin N) ℝ :=
  Matrix.of fun j k ↦
    (if j = k then -μ else 0) + (if j.val = (k.val + 1) % N then -(w + Δ) else 0)
      + (if k.val = (j.val + 1) % N then Δ - w else 0)

/-- 5.4: the skew matrix of the closed chain. -/
def kitaevMatrixPeriodic (N : ℕ) (w μ Δ : ℝ) : Matrix (Fin (2 * N)) (Fin (2 * N)) ℝ :=
  bipartiteSkew (kitaevCouplingPeriodic N w μ Δ)

/-- 5.4: the single-particle energy of the closed chain at momentum `q`. -/
noncomputable def dispersion (w μ Δ q : ℝ) : ℝ :=
  Real.sqrt ((2 * w * Real.cos q + μ) ^ 2 + 4 * Δ ^ 2 * Real.sin q ^ 2)

/-- 5.4: the characteristic polynomial of the closed chain. -/
theorem charpoly_kitaevMatrixPeriodic (N : ℕ) (hN : 1 ≤ N) (w μ Δ : ℝ) :
    (kitaevMatrixPeriodic N w μ Δ).charpoly =
      ∏ k ∈ Finset.range N, (X ^ 2 + C (dispersion w μ Δ (2 * Real.pi * k / N) ^ 2)) := by
  sorry

/-- 5.4: with pairing, the dispersion has a zero exactly on the lines `|μ| = 2|w|`. -/
theorem exists_dispersion_eq_zero_iff (w μ Δ : ℝ) (hΔ : Δ ≠ 0) :
    (∃ q : ℝ, dispersion w μ Δ q = 0) ↔ |μ| = 2 * |w| := by
  sorry

/-- 5.5: the Pfaffian of the closed chain. -/
theorem pfaffian_kitaevMatrixPeriodic (N : ℕ) (hN : 1 ≤ N) (w μ Δ : ℝ) :
    pfaffian (kitaevMatrixPeriodic N w μ Δ) =
      -(μ + 2 * w) * (if N % 2 = 0 then 2 * w - μ else 1) *
        ∏ k ∈ (Finset.range N).filter (fun k ↦ 0 < k ∧ 2 * k < N),
          dispersion w μ Δ (2 * Real.pi * k / N) ^ 2 := by
  sorry

/-- 5.5: the sign of the Pfaffian is multiplicative in the length up to `sign (μ² − 4w²)`. -/
theorem sign_pfaffian_kitaevMatrixPeriodic_add (N₁ N₂ : ℕ) (h₁ : 1 ≤ N₁) (h₂ : 1 ≤ N₂)
    (w μ Δ : ℝ) (hp₁ : pfaffian (kitaevMatrixPeriodic N₁ w μ Δ) ≠ 0)
    (hp₂ : pfaffian (kitaevMatrixPeriodic N₂ w μ Δ) ≠ 0)
    (hp : pfaffian (kitaevMatrixPeriodic (N₁ + N₂) w μ Δ) ≠ 0) :
    SignType.sign (pfaffian (kitaevMatrixPeriodic (N₁ + N₂) w μ Δ)) =
      SignType.sign (μ ^ 2 - 4 * w ^ 2) *
        SignType.sign (pfaffian (kitaevMatrixPeriodic N₁ w μ Δ)) *
        SignType.sign (pfaffian (kitaevMatrixPeriodic N₂ w μ Δ)) := by
  sorry

end TauCetiRoadmap.QuadraticMajoranaHamiltonians
