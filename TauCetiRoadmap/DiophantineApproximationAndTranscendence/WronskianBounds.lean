import Mathlib
import TauCeti.RingTheory.Polynomial.HasseWronskian

/-!
# Wronskian degree and multiplicity bounds: representative interfaces

The roadmap is README.md §1.4. This file gives selected suggested interfaces,
not an exhaustive checklist. Proofs use `sorry`; the Wronskian itself is the
implemented `Polynomial.hasseWronskian`, with Hasse derivative rows starting at zero.
-/

noncomputable section

set_option autoImplicit false

open Polynomial Module
open scoped BigOperators

namespace TauCetiRoadmap.DiophantineApproximationAndTranscendence.WronskianBounds

theorem natDegree_add_derivative_orders_le {K : Type*} [Field K] {ℓ : ℕ}
    (g : Fin ℓ → K[X]) (hg : Polynomial.hasseWronskian g ≠ 0) :
    (Polynomial.hasseWronskian g).natDegree + ∑ k : Fin ℓ, (k : ℕ) ≤
      ∑ j, (g j).natDegree := by
  sorry

theorem natDegree_le_common_cap {K : Type*} [Field K] {ℓ d : ℕ}
    (g : Fin ℓ → K[X]) (hd : ∀ j, (g j).natDegree ≤ d) :
    (Polynomial.hasseWronskian g).natDegree ≤ ℓ * d := by
  sorry

theorem root_pow_dvd_of_mem_space {K : Type*} [Field K] [CharZero K]
    {ℓ : ℕ} (V : Submodule K K[X]) (b : Basis (Fin ℓ) K V)
    (f : V) (hf : f ≠ 0) (a : K) :
    (X - C a) ^ (((f : K[X]).rootMultiplicity a + 1) - ℓ) ∣
      Polynomial.hasseWronskian (fun j => (b j : K[X])) := by
  sorry

theorem rootMultiplicity_lower_bound {K : Type*} [Field K] [CharZero K]
    {ℓ : ℕ} (V : Submodule K K[X]) (b : Basis (Fin ℓ) K V)
    (f : V) (hf : f ≠ 0) (a : K) :
    ((f : K[X]).rootMultiplicity a + 1) - ℓ ≤
      (Polynomial.hasseWronskian (fun j => (b j : K[X]))).rootMultiplicity a := by
  sorry

theorem rootMultiplicity_eq_of_basis_change {K : Type*} [Field K] [CharZero K]
    {ℓ : ℕ} (V : Submodule K K[X]) (b c : Basis (Fin ℓ) K V) (a : K) :
    (Polynomial.hasseWronskian (fun j => (b j : K[X]))).rootMultiplicity a =
      (Polynomial.hasseWronskian (fun j => (c j : K[X]))).rootMultiplicity a := by
  sorry

theorem rootMultiplicity_map {K L : Type*} [Field K] [Field L] [CharZero K]
    {ℓ : ℕ} (σ : K →+* L) (g : Fin ℓ → K[X]) (a : K) :
    (Polynomial.hasseWronskian (fun j => (g j).map σ)).rootMultiplicity (σ a) =
      (Polynomial.hasseWronskian g).rootMultiplicity a := by
  sorry

theorem sum_multiplicity_lower_bounds_le_natDegree {K : Type*} [Field K] [CharZero K]
    {ℓ : ℕ} (V : Submodule K K[X]) (b : Basis (Fin ℓ) K V)
    (S : Finset K) (f : K → V) (hf : ∀ a ∈ S, f a ≠ 0) :
    ∑ a ∈ S, (((f a : K[X]).rootMultiplicity a + 1) - ℓ) ≤
      (Polynomial.hasseWronskian (fun j => (b j : K[X]))).natDegree := by
  sorry

example (m : ℕ) (hm : 1 ≤ m) :
    (Polynomial.hasseWronskian ![(1 : ℚ[X]), X ^ m]).rootMultiplicity 0 = m - 1 := by
  sorry

end TauCetiRoadmap.DiophantineApproximationAndTranscendence.WronskianBounds
