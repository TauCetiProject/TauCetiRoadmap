module

public import Mathlib
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Elementary
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Stable

/-!
# Homological stability of general linear groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on native
carriers. The API around each target, the special cases and the Checks stay in the README.

Rings are commutative and live in `Type`, the universe of the coefficient ring `ℤ`, so that
Mathlib's `groupHomology` applies to `GL_n(R)` and its subgroups with integral coefficients
without transport. The stabilization `g ↦ diag(g, 1)` is Tau Ceti's `TauCeti.stabilizeGL`, and
`E_n(R)` is Tau Ceti's `TauCeti.elementarySubgroup`.

Headlines stated, with their README targets:

* 1.3 `affineGroup`, `affineInclusion` and `homology_affineInclusion_bijective`;
* 2.2 `elementaryStabilization`, `elementaryHomology_stabilization_of_ringKrullDim_le` and
  `elementaryHomology_stabilization_of_isSemisimpleRing`;
* 2.3 `homology_stabilization_of_infinite_residueFields`;
* 3.4 `standardRep`, `twistedHomology_stabilization_of_ringKrullDim_le` and
  `twistedHomology_stabilization_of_isSemisimpleRing`.

Not stated:

* 1.1, 1.2, Suslin's spectral sequence of 1.3, and 3.2, the frame complexes and the spectral
  sequences, lacking SchemeKTheoryOperations §6.7's unimodular frames and group hyperhomology.
* 2.1 and 3.3, the stability theorems under Bass's stable range condition, lacking
  AlgebraicKTheory's `HasStableRangeLE` (AlgebraicKTheory 4.1); the theorems of 2.2 and 3.4 are
  their instances through Bass's bounds (AlgebraicKTheory 4.2), stated with Mathlib's hypotheses.
* 2.4, the comparison with `π_m(BGL_n(R)⁺)` and with `K_m(R)`, lacking StableHomotopyKTheory's
  plus construction (StableHomotopyKTheory 3.25–3.27) and GeneralAlgebraicKTheory's `K_m(R)`.

The stability of `H_m(GL_n(R); ℤ)` under the stabilization and its comparison with
`H_m(GL(R); ℤ)`, along `TauCeti.StableGeneralLinearGroup.of`, with their noetherian and semilocal
forms, are SchemeKTheoryOperations §6.7's and are not restated here.
-/

@[expose] public section

open Matrix

namespace TauCetiRoadmap.HomologicalStabilityOfGeneralLinearGroups

variable (R : Type) [CommRing R]

/-! ## Layer 1: van der Kallen's groups and their spectral sequences -/

/-- **1.3.** The affine group `A_{n,m}`: the automorphisms of `Rⁿ ⊕ Rᵐ` fixing the vectors
`(0; e_j)` of `Rᵐ`, that is, the block matrices `(g 0; u 1)` with `g ∈ GL_n(R)`; it is the
stabiliser of the matrix `(0; 1)` for the action by left multiplication. -/
def affineGroup (n m : ℕ) : Subgroup (Matrix.GeneralLinearGroup (Fin n ⊕ Fin m) R) :=
  MulAction.stabilizer _
    (Matrix.fromRows (0 : Matrix (Fin n) (Fin m) R) (1 : Matrix (Fin m) (Fin m) R))

/-- **1.3.** The inclusion `GL_n(R) → A_{n,m}`, `g ↦ diag(g, 1)`, through Tau Ceti's
block-diagonal homomorphism. -/
def affineInclusion (n m : ℕ) : Matrix.GeneralLinearGroup (Fin n) R →* affineGroup R n m :=
  (TauCeti.fromBlocksGL.comp (MonoidHom.inl _ _)).codRestrict _ fun g => by
    have h : ∀ (u : Matrix.GeneralLinearGroup (Fin n ⊕ Fin m) R)
        (E : Matrix (Fin n ⊕ Fin m) (Fin m) R),
        u • E = (u : Matrix (Fin n ⊕ Fin m) (Fin n ⊕ Fin m) R) * E := fun _ _ => rfl
    rw [affineGroup, MulAction.mem_stabilizer_iff, h, MonoidHom.comp_apply, MonoidHom.inl_apply,
      TauCeti.coe_fromBlocksGL]
    simp [Matrix.fromBlocks_mul_fromRows]

/-- **1.3.** The Nesterenko–Suslin property of a semilocal ring with infinite residue fields: the
inclusion `GL_n(R) → A_{n,m}` induces a bijection on integral homology in every degree
(Galatius–Kupers–Randal-Williams 2025, Proposition 5.15 and Example 5.16; Nesterenko–Suslin
1989, Proposition 1.10). The coefficient map `φ` is the identity of `ℤ`. -/
theorem homology_affineInclusion_bijective [Finite (MaximalSpectrum R)]
    [∀ 𝔪 : MaximalSpectrum R, Infinite (R ⧸ 𝔪.asIdeal)] (n m k : ℕ)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (affineInclusion R n m) (Rep.trivial ℤ (affineGroup R n m) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    Function.Bijective (groupHomology.map (affineInclusion R n m) φ k) := by
  sorry

/-! ## Layer 2: stability with constant coefficients -/

/-- **2.2.** The stabilization of the elementary subgroups, `E_n(R) → E_{n+1}(R)`: the restriction
of `TauCeti.stabilizeGL`, which sends `E_n(R)` into `E_{n+1}(R)`. -/
noncomputable def elementaryStabilization (n : ℕ) :
    TauCeti.elementarySubgroup (Fin n) R →* TauCeti.elementarySubgroup (Fin (n + 1)) R :=
  (Subgroup.inclusion
      (TauCeti.map_stabilizeGL_elementarySubgroup_le (A := R) (Nat.le_succ n))).comp
    ((TauCeti.stabilizeGL R (Nat.le_succ n)).subgroupMap _)

/-- **2.2.** For a commutative noetherian ring of Krull dimension at most `d`, put
`e = max 1 d`. The stabilization induces a surjection `H_m(E_n(R); ℤ) → H_m(E_{n+1}(R); ℤ)` for
`n ≥ 2m + e - 1` and a bijection for `n ≥ 2m + e` (van der Kallen 1980, Theorem 4.11, with
`sdim = d`). The coefficient map `φ` is the identity of `ℤ`. -/
theorem elementaryHomology_stabilization_of_ringKrullDim_le [IsNoetherianRing R] (d m n : ℕ)
    (hd : ringKrullDim R ≤ d)
    (φ : Rep.trivial ℤ (TauCeti.elementarySubgroup (Fin n) R) ℤ ⟶
      Rep.res (elementaryStabilization R n)
        (Rep.trivial ℤ (TauCeti.elementarySubgroup (Fin (n + 1)) R) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    (2 * m + max 1 d ≤ n + 1 →
      Function.Surjective (groupHomology.map (elementaryStabilization R n) φ m)) ∧
    (2 * m + max 1 d ≤ n →
      Function.Bijective (groupHomology.map (elementaryStabilization R n) φ m)) := by
  sorry

/-- **2.2.** For a ring whose quotient by its Jacobson radical is semisimple, the stabilization
induces a surjection on `H_m(E_n(R); ℤ)` for `n ≥ 2m` and a bijection for `n ≥ 2m + 1` (van der
Kallen 1980, Theorem 4.11, with `sdim = 0`). -/
theorem elementaryHomology_stabilization_of_isSemisimpleRing
    [IsSemisimpleRing (R ⧸ Ring.jacobson R)] (m n : ℕ)
    (φ : Rep.trivial ℤ (TauCeti.elementarySubgroup (Fin n) R) ℤ ⟶
      Rep.res (elementaryStabilization R n)
        (Rep.trivial ℤ (TauCeti.elementarySubgroup (Fin (n + 1)) R) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    (2 * m ≤ n → Function.Surjective (groupHomology.map (elementaryStabilization R n) φ m)) ∧
    (2 * m + 1 ≤ n →
      Function.Bijective (groupHomology.map (elementaryStabilization R n) φ m)) := by
  sorry

/-- **2.3.** For a semilocal ring whose residue fields are all infinite, the stabilization
induces a bijection on `H_m(-; ℤ)` for `m ≤ n`. For connected rings the relative groups
`H_d(GL_n(R), GL_{n-1}(R); ℤ)` vanish for `d < n` and `H_n(GL_n(R)) → H_n(GL_n(R), GL_{n-1}(R))`
is onto (Galatius–Kupers–Randal-Williams 2025, Theorem 9.4 and its proof; Nesterenko–Suslin
1989, Theorems 2.7 and 3.25; Guin 1989, Théorème 2); a semilocal ring is a finite product of
connected ones, and the Künneth theorem gives the general case. -/
theorem homology_stabilization_of_infinite_residueFields [Finite (MaximalSpectrum R)]
    [∀ 𝔪 : MaximalSpectrum R, Infinite (R ⧸ 𝔪.asIdeal)] (m n : ℕ)
    (φ : Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin n) R) ℤ ⟶
      Rep.res (TauCeti.stabilizeGL R (Nat.le_succ n))
        (Rep.trivial ℤ (Matrix.GeneralLinearGroup (Fin (n + 1)) R) ℤ))
    (hφ : φ.hom.toLinearMap = LinearMap.id) (hmn : m ≤ n) :
    Function.Bijective (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m) := by
  sorry

/-! ## Layer 3: twisted coefficients -/

/-- **3.4.** The standard representation of `GL_n(R)` on the column vectors `Rⁿ`, the
`n × 1` matrices, by left multiplication, as an integral representation. -/
noncomputable abbrev standardRep (n : ℕ) : Rep ℤ (Matrix.GeneralLinearGroup (Fin n) R) :=
  Rep.ofDistribMulAction ℤ (Matrix.GeneralLinearGroup (Fin n) R) (Matrix (Fin n) (Fin 1) R)

/-- **3.4.** For a commutative noetherian ring of Krull dimension at most `d`, the
stabilization together with the inclusion `Rⁿ → Rⁿ⁺¹` as the first `n` coordinates induces a
surjection `H_m(GL_n(R); Rⁿ) → H_m(GL_{n+1}(R); Rⁿ⁺¹)` for `n ≥ 2m + d + 1` and a bijection for
`n ≥ 2m + d + 3` (van der Kallen 1980, Theorem 5.6, for the coefficient system of degree one
`Rⁿ`, and the exact sequence of relative groups). -/
theorem twistedHomology_stabilization_of_ringKrullDim_le [IsNoetherianRing R] (d m n : ℕ)
    (hd : ringKrullDim R ≤ d)
    (φ : standardRep R n ⟶ Rep.res (TauCeti.stabilizeGL R (Nat.le_succ n))
      (standardRep R (n + 1)))
    (hφ : ∀ v : Matrix (Fin n) (Fin 1) R,
      φ.hom.toLinearMap v = Matrix.of fun i j => Fin.lastCases 0 (fun i' => v i' j) i) :
    (2 * m + d + 1 ≤ n →
      Function.Surjective (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) ∧
    (2 * m + d + 3 ≤ n →
      Function.Bijective (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) := by
  sorry

/-- **3.4.** For a ring whose quotient by its Jacobson radical is semisimple, the map
`H_m(GL_n(R); Rⁿ) → H_m(GL_{n+1}(R); Rⁿ⁺¹)` is surjective for `n ≥ 2m + 1` and bijective for
`n ≥ 2m + 3` (van der Kallen 1980, Theorem 5.6, with `sdim = 0`). -/
theorem twistedHomology_stabilization_of_isSemisimpleRing
    [IsSemisimpleRing (R ⧸ Ring.jacobson R)] (m n : ℕ)
    (φ : standardRep R n ⟶ Rep.res (TauCeti.stabilizeGL R (Nat.le_succ n))
      (standardRep R (n + 1)))
    (hφ : ∀ v : Matrix (Fin n) (Fin 1) R,
      φ.hom.toLinearMap v = Matrix.of fun i j => Fin.lastCases 0 (fun i' => v i' j) i) :
    (2 * m + 1 ≤ n →
      Function.Surjective (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) ∧
    (2 * m + 3 ≤ n →
      Function.Bijective (groupHomology.map (TauCeti.stabilizeGL R (Nat.le_succ n)) φ m)) := by
  sorry

end TauCetiRoadmap.HomologicalStabilityOfGeneralLinearGroups
