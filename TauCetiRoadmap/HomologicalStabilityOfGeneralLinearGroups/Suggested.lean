module

public import Mathlib

/-!
# Homological stability of general linear groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on native
carriers. The API around each target, the special cases and the Checks stay in the README.

Rings are commutative and live in `Type`, the universe of the coefficient ring `ℤ`, so that
Mathlib's `groupHomology` applies to `GL_n(R)` with integral coefficients without transport.

Headlines stated, with their README targets:

* 1.1 `UnimodularFrame`, `UnimodularFrame.face`; 1.2 `frameBoundary`, `frameAugmentation`;
* 1.4 `frameComplex_acyclic_of_ringKrullDim_le` and `frameComplex_acyclic_of_isSemisimpleRing`;
* 2.4 `stabilization`, `homology_stabilization_of_ringKrullDim_le` and
  `homology_stabilization_of_isSemisimpleRing`;
* 2.5 `homology_stabilization_of_infinite_residueField`;
* 3.3 `standardRep`, `twistedHomology_stabilization_of_ringKrullDim_le` and
  `twistedHomology_stabilization_of_isSemisimpleRing`.

Not stated:

* 1.3 and 2.3, the acyclicity and stability theorems under Bass's stable range condition,
  lacking AlgebraicKTheory's `HasStableRangeLE` (AlgebraicKTheory 4.1); the stability of
  `H_m(E_n(R))` in 2.3 lacks also its `elementary` (AlgebraicKTheory 1.1). The theorems 1.4 and
  2.4 are their instances through Bass's bounds (AlgebraicKTheory 4.2), stated with Mathlib's
  hypotheses.
* 2.2, the spectral sequence, lacking K3BlochGroups' group-module hyperhomology (K3BlochGroups
  4.1).
* 2.6, the comparison with `GL(R)` and with K-theory, lacking AlgebraicKTheory's stable linear
  group (AlgebraicKTheory 1.2) and StableHomotopyKTheory's plus construction (StableHomotopyKTheory
  3.25–3.27).
* 3.2, stability with coefficients in a strongly central coefficient system, lacking
  `HasStableRangeLE`; 3.3 is its instance for the standard representation.
-/

@[expose] public section

open Matrix

namespace TauCetiRoadmap.HomologicalStabilityOfGeneralLinearGroups

variable (R : Type) [CommRing R]

/-! ## Layer 1: unimodular frames and their complex -/

/-- **1.1.** A unimodular `k`-frame in `Rⁿ`: an `n × k` matrix with a left inverse, that is, a
sequence of `k` column vectors forming a basis of a free direct summand of `Rⁿ` (van der Kallen
1980, 2.4). -/
def UnimodularFrame (n k : ℕ) : Type :=
  {A : Matrix (Fin n) (Fin k) R // ∃ B : Matrix (Fin k) (Fin n) R, B * A = 1}

variable {R}

/-- **1.1.** The `i`-th face of a unimodular `(k + 1)`-frame: delete its column `i`. The rows
`i.succAbove` of a left inverse form a left inverse of the face. -/
def UnimodularFrame.face {n k : ℕ} (i : Fin (k + 1)) (A : UnimodularFrame R n (k + 1)) :
    UnimodularFrame R n k :=
  ⟨A.1.submatrix id i.succAbove, by
    obtain ⟨B, hB⟩ := A.2
    refine ⟨B.submatrix i.succAbove id, ?_⟩
    have h : B.submatrix i.succAbove id * A.1.submatrix id i.succAbove =
        (B * A.1).submatrix i.succAbove i.succAbove := by
      ext a b
      simp [Matrix.mul_apply]
    rw [h, hB]
    ext a b
    simp [Matrix.one_apply]⟩

variable (R)

/-- **1.2.** The boundary of the complex of unimodular frames, from frames of length `k + 2`
(degree `k + 1`) to frames of length `k + 1` (degree `k`): the alternating sum of the faces. -/
noncomputable def frameBoundary (n k : ℕ) :
    (UnimodularFrame R n (k + 2) →₀ ℤ) →ₗ[ℤ] (UnimodularFrame R n (k + 1) →₀ ℤ) :=
  Finsupp.linearCombination ℤ fun A =>
    ∑ i : Fin (k + 2), ((-1 : ℤ) ^ (i : ℕ)) • Finsupp.single (A.face i) (1 : ℤ)

/-- **1.2.** The augmentation of the complex of unimodular frames: every unimodular vector,
a frame of length one, goes to `1`. -/
noncomputable def frameAugmentation (n : ℕ) : (UnimodularFrame R n 1 →₀ ℤ) →ₗ[ℤ] ℤ :=
  Finsupp.linearCombination ℤ fun _ => (1 : ℤ)

/-- **1.4.** For a commutative noetherian ring of Krull dimension at most `d`, the augmented
complex of unimodular frames in `Rⁿ` is `(n - 2 - d)`-acyclic: the augmentation is onto when
`n ≥ d + 1`, the reduced homology vanishes in degree `0` when `n ≥ d + 2`, and in degree `k + 1`
when `n ≥ k + 1 + d + 2` (van der Kallen 1980, Theorem 2.6(i) with `δ = 0`, and Bass's stable
range theorem). -/
theorem frameComplex_acyclic_of_ringKrullDim_le [IsNoetherianRing R] (d n : ℕ)
    (hd : ringKrullDim R ≤ d) :
    (d + 1 ≤ n → Function.Surjective (frameAugmentation R n)) ∧
    (d + 2 ≤ n → LinearMap.ker (frameAugmentation R n) ≤ LinearMap.range (frameBoundary R n 0)) ∧
    ∀ k : ℕ, k + 1 + d + 2 ≤ n →
      LinearMap.ker (frameBoundary R n k) ≤ LinearMap.range (frameBoundary R n (k + 1)) := by
  sorry

/-- **1.4.** For a ring whose quotient by its Jacobson radical is semisimple (a semilocal ring),
the augmented complex of unimodular frames in `Rⁿ` is `(n - 2)`-acyclic (van der Kallen 1980,
Theorem 2.6(i), with stable range one). -/
theorem frameComplex_acyclic_of_isSemisimpleRing [IsSemisimpleRing (R ⧸ Ring.jacobson R)]
    (n : ℕ) :
    (1 ≤ n → Function.Surjective (frameAugmentation R n)) ∧
    (2 ≤ n → LinearMap.ker (frameAugmentation R n) ≤ LinearMap.range (frameBoundary R n 0)) ∧
    ∀ k : ℕ, k + 1 + 2 ≤ n →
      LinearMap.ker (frameBoundary R n k) ≤ LinearMap.range (frameBoundary R n (k + 1)) := by
  sorry

/-! ## Layer 2: stability with constant coefficients -/

/-- **2.4.** The stabilization `GL_n(R) → GL_{n+1}(R)`, `g ↦ diag(g, 1)`: the upper left block
is `g`, the new last coordinate is fixed. The inverse block is `diag(g⁻¹, 1)`; the index type
`Fin n ⊕ Fin 1` is reindexed by `finSumFinEquiv`. -/
def stabilization (n : ℕ) :
    Matrix.GeneralLinearGroup (Fin n) R →* Matrix.GeneralLinearGroup (Fin (n + 1)) R :=
  (Units.map (Matrix.reindexRingEquiv R (finSumFinEquiv :
    Fin n ⊕ Fin 1 ≃ Fin (n + 1))).toMonoidHom).comp
    { toFun := fun g =>
        { val := Matrix.fromBlocks g.val 0 0 (1 : Matrix (Fin 1) (Fin 1) R)
          inv := Matrix.fromBlocks g.inv 0 0 (1 : Matrix (Fin 1) (Fin 1) R)
          val_inv := by simp [Matrix.fromBlocks_multiply, ← Matrix.fromBlocks_one]
          inv_val := by simp [Matrix.fromBlocks_multiply, ← Matrix.fromBlocks_one] }
      map_one' := by apply Units.ext; exact Matrix.fromBlocks_one
      map_mul' := fun g h => by
        apply Units.ext
        simp [Matrix.fromBlocks_multiply] }

/-- **2.4.** For a commutative noetherian ring of Krull dimension at most `d`, put
`e = max 1 d`. The stabilization induces a surjection
`H_m(GL_n(R); ℤ) → H_m(GL_{n+1}(R); ℤ)` for `n ≥ 2m + e - 1` and a bijection for `n ≥ 2m + e`
(van der Kallen 1980, Theorem 4.11, with `sdim = d`). The coefficient map `φ` is the identity
of `ℤ`. -/
theorem homology_stabilization_of_ringKrullDim_le [IsNoetherianRing R] (d m n : ℕ)
    (hd : ringKrullDim R ≤ d)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (stabilization R n)
        (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin (n + 1)) R) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    (2 * m + max 1 d ≤ n + 1 →
      Function.Surjective (groupHomology.map (stabilization R n) φ m)) ∧
    (2 * m + max 1 d ≤ n →
      Function.Bijective (groupHomology.map (stabilization R n) φ m)) := by
  sorry

/-- **2.4.** For a ring whose quotient by its Jacobson radical is semisimple, the stabilization
induces a surjection on `H_m(-; ℤ)` for `n ≥ 2m` and a bijection for `n ≥ 2m + 1` (van der
Kallen 1980, Theorem 4.11, with `sdim = 0`). -/
theorem homology_stabilization_of_isSemisimpleRing [IsSemisimpleRing (R ⧸ Ring.jacobson R)]
    (m n : ℕ)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (stabilization R n)
        (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin (n + 1)) R) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    (2 * m ≤ n → Function.Surjective (groupHomology.map (stabilization R n) φ m)) ∧
    (2 * m + 1 ≤ n → Function.Bijective (groupHomology.map (stabilization R n) φ m)) := by
  sorry

/-- **2.5.** For a local ring with infinite residue field, the stabilization induces a surjection
on `H_m(-; ℤ)` for `m ≤ n` and an injection for `m < n`: the relative groups
`H_m(GL_{n+1}(R), GL_n(R); ℤ)` vanish for `m ≤ n` (Nesterenko–Suslin 1989, Theorems 2.7 and
3.25). -/
theorem homology_stabilization_of_infinite_residueField [IsLocalRing R]
    [Infinite (IsLocalRing.ResidueField R)] (m n : ℕ)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (stabilization R n)
        (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin (n + 1)) R) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    (m ≤ n → Function.Surjective (groupHomology.map (stabilization R n) φ m)) ∧
    (m < n → Function.Injective (groupHomology.map (stabilization R n) φ m)) := by
  sorry

/-! ## Layer 3: twisted coefficients -/

/-- **3.3.** The standard representation of `GL_n(R)` on the column vectors `Rⁿ`, the
`n × 1` matrices, by left multiplication, as an integral representation. -/
noncomputable abbrev standardRep (n : ℕ) : Rep ℤ (Matrix.GeneralLinearGroup (Fin n) R) :=
  Rep.ofDistribMulAction ℤ (Matrix.GeneralLinearGroup (Fin n) R) (Matrix (Fin n) (Fin 1) R)

/-- **3.3.** For a commutative noetherian ring of Krull dimension at most `d`, the
stabilization together with the inclusion `Rⁿ → Rⁿ⁺¹` as the first `n` coordinates induces a
surjection `H_m(GL_n(R); Rⁿ) → H_m(GL_{n+1}(R); Rⁿ⁺¹)` for `n ≥ 2m + d + 1` and a bijection for
`n ≥ 2m + d + 3` (van der Kallen 1980, Theorem 5.6, for the coefficient system of degree one
`Rⁿ`, and the exact sequence of relative groups). -/
theorem twistedHomology_stabilization_of_ringKrullDim_le [IsNoetherianRing R] (d m n : ℕ)
    (hd : ringKrullDim R ≤ d)
    (φ : standardRep R n ⟶ Rep.res (stabilization R n) (standardRep R (n + 1)))
    (hφ : ∀ v : Matrix (Fin n) (Fin 1) R,
      φ.hom.toLinearMap v = Matrix.of fun i j => Fin.lastCases 0 (fun i' => v i' j) i) :
    (2 * m + d + 1 ≤ n →
      Function.Surjective (groupHomology.map (stabilization R n) φ m)) ∧
    (2 * m + d + 3 ≤ n →
      Function.Bijective (groupHomology.map (stabilization R n) φ m)) := by
  sorry

/-- **3.3.** For a ring whose quotient by its Jacobson radical is semisimple, the map
`H_m(GL_n(R); Rⁿ) → H_m(GL_{n+1}(R); Rⁿ⁺¹)` is surjective for `n ≥ 2m + 1` and bijective for
`n ≥ 2m + 3` (van der Kallen 1980, Theorem 5.6, with `sdim = 0`). -/
theorem twistedHomology_stabilization_of_isSemisimpleRing
    [IsSemisimpleRing (R ⧸ Ring.jacobson R)] (m n : ℕ)
    (φ : standardRep R n ⟶ Rep.res (stabilization R n) (standardRep R (n + 1)))
    (hφ : ∀ v : Matrix (Fin n) (Fin 1) R,
      φ.hom.toLinearMap v = Matrix.of fun i j => Fin.lastCases 0 (fun i' => v i' j) i) :
    (2 * m + 1 ≤ n → Function.Surjective (groupHomology.map (stabilization R n) φ m)) ∧
    (2 * m + 3 ≤ n → Function.Bijective (groupHomology.map (stabilization R n) φ m)) := by
  sorry

end TauCetiRoadmap.HomologicalStabilityOfGeneralLinearGroups
