import Mathlib

/-!
# Hermitian K-theory of Poincaré categories: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`.

Section 7.9's Arf classification is stated on Mathlib's finite-dimensional quadratic
spaces over `ZMod 2`. The invariant is defined by the cardinalities of its zero and
one fibres. The targets identify it with the symplectic-basis formula and assert
that equality of invariants is equivalent to a quadratic Lagrangian in the
orthogonal sum. Thus completeness is expressed directly on forms and submodules.

The spectrum-level headline results are deferred here because Mathlib `6b7abb3`
and Tau Ceti `a91d3aa` do not supply the stable perfect-derived enhancement,
invertible coefficients with involution, Poincaré categories, or GW and L spectra.
These missing carriers prevent statements of the Tate-collapse and shifted
classical comparisons (Layer 0), Bott–Genauer and Karoubi periodicity (Layer 1),
relative Lagrangian surgery (Layer 3), quadratic surgery and Ranicki's short-complex
comparison (Layer 4), connective ring-spectrum surgery and the comparison with
π₀ (Layer 5), symmetric surgery (Layer 6), the genuine-to-symmetric and field
L-group comparisons and multiplicative L-to-Tate refinement (Layer 7), and the
classical GW fibre sequences, splitting and comparison ranges (Layer 8).
Layer 2's symmetry and quadraticity bounds share the missing Poincaré and spectrum
carriers. The enhanced Postnikov statement needs the stable perfect-derived
enhancement. Ordinary chain-complex and resolution infrastructure is specified in
the README.

Tau Ceti's `WittRing` requires invertibility of two, so it cannot express the
characteristic-two Witt quotient. The Arf completeness target uses a half-dimensional
submodule on which the orthogonal-sum quadratic form vanishes instead.
-/

namespace TauCetiRoadmap.HermitianKTheoryOfPoincareCategories

variable {V W : Type*} [AddCommGroup V] [Module (ZMod 2) V]
  [AddCommGroup W] [Module (ZMod 2) W]

/-- The Arf invariant of a finite-dimensional quadratic space over `𝔽₂`, defined
intrinsically: it is one exactly when the zero fibre is smaller than the one fibre.
-/
noncomputable def arfInvariantF2 [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) : ZMod 2 :=
  if Nat.card {x : V // q x = 0} < Nat.card {x : V // q x = 1} then 1 else 0

/-- The intrinsic invariant equals the Arf sum in every symplectic basis of the
polar form. In particular, the sum is independent of that basis.
README §7.9; Paper III, proof of Corollary 2.3.10, p. 45.
-/
theorem arfInvariantF2_eq_sum [FiniteDimensional (ZMod 2) V]
    (q : QuadraticForm (ZMod 2) V) (n : ℕ)
    (b : Module.Basis (Fin n × Bool) (ZMod 2) V)
    (hee : ∀ i j, QuadraticMap.polar q (b (i, false)) (b (j, false)) = 0)
    (hff : ∀ i j, QuadraticMap.polar q (b (i, true)) (b (j, true)) = 0)
    (hef : ∀ i j, QuadraticMap.polar q (b (i, false)) (b (j, true)) = if i = j then 1 else 0) :
    arfInvariantF2 q = ∑ i : Fin n, q (b (i, false)) * q (b (i, true)) := by
  sorry

/-- The Arf invariant is a complete quadratic Witt invariant over `𝔽₂`: two
nonsingular forms have equal invariants exactly when their orthogonal sum has a
quadratic Lagrangian. The hypotheses say that the polar forms have zero radical;
the conclusion describes a Lagrangian by vanishing and half dimension.
README §7.9; Paper III, proof of Corollary 2.3.10, p. 45.
-/
theorem arfInvariantF2_classifies [FiniteDimensional (ZMod 2) V]
    [FiniteDimensional (ZMod 2) W]
    (q : QuadraticForm (ZMod 2) V) (q' : QuadraticForm (ZMod 2) W)
    (hq : ∀ x, (∀ y, QuadraticMap.polar q x y = 0) → x = 0)
    (hq' : ∀ x, (∀ y, QuadraticMap.polar q' x y = 0) → x = 0) :
    arfInvariantF2 q = arfInvariantF2 q' ↔
      ∃ L : Submodule (ZMod 2) (V × W),
        (∀ x ∈ L, (q.prod q') x = 0) ∧
        2 * Module.finrank (ZMod 2) L = Module.finrank (ZMod 2) (V × W) := by
  sorry

end TauCetiRoadmap.HermitianKTheoryOfPoincareCategories
