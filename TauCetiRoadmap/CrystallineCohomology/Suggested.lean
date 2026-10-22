import Mathlib

/-!
# Crystalline cohomology: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for selected headline theorems;
proving them does not complete a layer or the roadmap.

Two results can be stated on Mathlib's `WittVector.Isocrystal`: the Dieudonné–Manin
standard-block decomposition over an algebraically closed field (CR.4.7), in every finite
dimension, and nilpotence of monodromy over any perfect field (CR.6.1). The latter uses only
the linear operator and Frobenius relation bundled in `LogCrystalline.PhiNModule`.

The other headline signatures require objects absent from the pinned Mathlib and Tau Ceti:
- CR.1's crystal–connection equivalence and CR.2's PD Poincaré and crystalline–de Rham
  comparisons need PD envelopes, crystalline sites, crystals and their de Rham complexes.
- CR.3's base change, perfectness, Künneth and Frobenius isogeny, and CR.3:duality's
  Poincaré duality need crystalline cohomology and its trace.
- CR.4's strict-completion and décalage fixed-point equivalences, de Rham–Witt comparisons,
  slope spectral sequence and Nygaard comparisons need Dieudonné-complex constructions
  and de Rham–Witt complexes. Canonical slope summands over a general perfect field also
  need scalar extension and descent of subisocrystals; the basis theorem below states the
  algebraically closed classification without introducing those constructions.
- CR.5:log-algebra's chart criterion and Abhyankar theorem, and CR.5's log Cartier,
  crystal–connection and Poincaré comparisons need log schemes and log crystalline sites.
- The CR.DDR comparisons and descent theorems need ordinary and derived de Rham complexes,
  log cotangent complexes and PD envelopes.
- CR.6's Hyodo–Kato comparison and change-of-uniformizer theorem need log crystalline
  Hyodo–Kato complexes and their de Rham realization; its convergent and log rigid
  comparisons also need analytic tubes and dagger spaces.
- CR.7's relative base change and Gauss–Manin theorems need relative crystalline direct
  images and coefficient crystals.
These signatures are deferred until their mathematical objects are available.
-/

namespace TauCetiRoadmap.CrystallineCohomology.Crystalline

open WittVector
open scoped Isocrystal

/-- Dieudonné–Manin decomposition (CR.4.7): every finite-dimensional isocrystal over an
algebraically closed field has a basis partitioned into standard simple blocks. A block of
reduced slope `a / b` has length `b`; Frobenius shifts its basis vectors and sends the last
one to `p ^ a` times the first. Repeated slopes record multiplicities. -/
theorem exists_frobenius_block_basis (p : ℕ) [Fact p.Prime] (k : Type*) [Field k]
    [CharP k p] [PerfectRing k p] [IsAlgClosed k] (V : Type*) [AddCommGroup V]
    [Isocrystal p k V] [FiniteDimensional K(p, k) V] :
    ∃ (n : ℕ) (slope : Fin n → ℚ)
      (b : Module.Basis (Σ i : Fin n, Fin (slope i).den) K(p, k) V),
      ∀ (i : Fin n) (j : Fin (slope i).den),
        Isocrystal.frobenius p k (b ⟨i, j⟩) =
          if h : j.val + 1 < (slope i).den then b ⟨i, ⟨j.val + 1, h⟩⟩
          else (p : K(p, k)) ^ (slope i).num • b ⟨i, ⟨0, (slope i).den_pos⟩⟩ := by
  sorry

end TauCetiRoadmap.CrystallineCohomology.Crystalline

namespace TauCetiRoadmap.CrystallineCohomology.LogCrystalline

open WittVector
open scoped Isocrystal

variable (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p] [PerfectRing k p]

/-- A `(φ, N)`-module over `K₀ = Frac W(k)`: Mathlib's isocrystal with a linear
monodromy operator satisfying the Hyodo–Kato relation `N φ = p φ N`. -/
structure PhiNModule (V : Type*) [AddCommGroup V] [Isocrystal p k V] where
  /-- The monodromy operator. -/
  N : V →ₗ[K(p, k)] V
  /-- Compatibility of monodromy with the invertible semilinear Frobenius. -/
  N_frobenius : ∀ x : V, N (Isocrystal.frobenius p k (V := V) x) =
    (p : K(p, k)) • Isocrystal.frobenius p k (V := V) (N x)

/-- Monodromy nilpotence (CR.6.1): the Frobenius–monodromy relation forces
`N ^ dim = 0` on every finite-dimensional `(φ, N)`-module over a perfect field. -/
theorem PhiNModule.N_pow_finrank_eq_zero {V : Type*} [AddCommGroup V] [Isocrystal p k V]
    [FiniteDimensional K(p, k) V] (D : PhiNModule p k V) :
    D.N ^ Module.finrank K(p, k) V = 0 := by
  sorry

end TauCetiRoadmap.CrystallineCohomology.LogCrystalline
