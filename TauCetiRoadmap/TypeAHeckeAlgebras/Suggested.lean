/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: The Tau Ceti contributors
-/
import Mathlib
import TauCeti.Algebra.TypeAHeckeAlgebra.Finite
import TauCeti.Algebra.TypeAHeckeAlgebra.OcneanuTrace
import TauCeti.Algebra.TypeAHeckeAlgebra.SignedCheckedR
import TauCeti.Algebra.TypeAHeckeAlgebra.Star
import TauCeti.Algebra.TypeAHeckeAlgebra.UnitaryStar
import TauCeti.KnotTheory.Jimbo.Basic
import TauCeti.KnotTheory.Jimbo.Trace
import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import TauCeti.Combinatorics.Young.StandardTableau.Basic

/-!
# Type-A Hecke algebras, braid traces and positive quotients: target signatures

This file is not the roadmap: the roadmap is `README.md`, which is definitive. This file states
the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`.

The finite and infinite type-A Hecke algebras, their basis theorem, the embedding of the finite
algebras in the infinite one, the Ocneanu trace with its existence and uniqueness, the two
involutions and the braid-closure invariant of a Markov trace are Tau Ceti's
(`TauCeti.TypeAHeckeAlgebra`, `TauCeti.InfiniteTypeAHeckeAlgebra`,
`TauCeti.InfiniteTypeAHeckeAlgebra.ocneanuTrace`); the README uses them as suppliers and this
file does not restate them.

The headlines stated here are:

* the semisimplicity criterion for `Hₙ(q)` over a field, and its split-semisimple Wedderburn form
  with one matrix block of size `f^λ` for each partition `λ` of `n` (README §1.2);
* the classification of the positive Markov traces at real parameters (Wenzl; Thoma at `Q = 1`)
  (README §3.6);
* Wenzl's classification of the positive Markov traces at unit-circle parameters (README §3.7);
* the atomic models: at a real parameter with `Q ≠ 1` every positive Markov trace is, on the image
  of every braid, a product-state trace of the signed checked R-matrix representation on words in
  a countable weighted alphabet of positive and negative letters (README §3.14).

The other headline theorems are not statable at the pins, and nothing is stated in their place:

* the identification of the Wedderburn blocks of `Hₙ(q)` with its Specht modules and their tableau
  bases, and one-box branching (README §§1.2–1.3), and the positive-real parabolic Pieri rule
  (README §1.10): the pins have no Specht module and no induced module of a Hecke algebra;
* the index `[B : A_m] = d ^ (2m)` and the relative commutant of Wenzl's subfactors (README
  §4.2), the finite-colour and regular inclusions at `Q = 1` (README §§4.3–4.4) and the index and
  relative-entropy formulas for the full phase fixed algebras (README §4.6): the pins have no
  trace-GNS von Neumann closure of a Hecke tower, no Jones index and no relative entropy of an
  inclusion;
* the Thoma shape limits of the signed Schur path law (README §4.9): the pins have no signed
  Schur specialization and no coherent path measure on the Young graph.
-/

namespace TauCetiRoadmap.TypeAHeckeAlgebras

open TauCeti

/-! ## Layer 1: The finite Hecke tower and its module theory -/

/-- **The semisimplicity criterion** (Andersen–Stroppel–Tubbenhauer, Theorem 5.1, except at
`q = -1` in characteristic `≠ 2`, which the sign twist carries to `q = 1`). Over a field `K`,
the Hecke algebra on `n` strands with quadratic relation `(Tᵢ - q)(Tᵢ + q⁻¹) = 0` is semisimple
exactly when the Poincaré polynomial `∏_{r=1}^{n} [r]_Q` of the symmetric group, at `Q = q²`, is
nonzero, where `[r]_Q = 1 + Q + ⋯ + Q^(r-1)`. At `Q = 1` this is Maschke's condition `n! ≠ 0` in `K`. -/
theorem isSemisimpleRing_typeAHeckeAlgebra_iff (K : Type*) [Field K] (q : Kˣ) (n : ℕ) :
    IsSemisimpleRing (TypeAHeckeAlgebra K q n) ↔
      ∏ r ∈ Finset.range n, ∑ j ∈ Finset.range (r + 1), ((q : K) ^ 2) ^ j ≠ 0 := by
  sorry

/-- **Split semisimplicity and the Wedderburn form.** Over a field `K`, when the Poincaré
polynomial `∏_{r=1}^{n} [r]_Q`, `Q = q²`, is nonzero, the Hecke algebra on `n` strands is
isomorphic as a `K`-algebra to the product, over the partitions `λ` of `n`, of the full matrix
algebras of size `f^λ`, the number of standard `λ`-tableaux: it is split semisimple, its simple
modules are indexed by the partitions of `n`, and the simple module of `λ` has dimension `f^λ`. -/
theorem nonempty_algEquiv_pi_matrix_of_prod_ne_zero (K : Type*) [Field K] (q : Kˣ) (n : ℕ)
    (h : ∏ r ∈ Finset.range n, ∑ j ∈ Finset.range (r + 1), ((q : K) ^ 2) ^ j ≠ 0) :
    Nonempty (TypeAHeckeAlgebra K q n ≃ₐ[K]
      Π μ : Nat.Partition n, Matrix (Fin (standardCount (YoungDiagram.ofPartition μ)))
        (Fin (standardCount (YoungDiagram.ofPartition μ))) K) := by
  sorry

/-! ## Layer 3: Positivity, quotient carriers and the two exceptional regimes -/

/-- Wenzl's parameter `a_d(Q)`, written with the `Q`-integers `[m]_Q = 1 + Q + ⋯ + Q^(m-1)`:
`a_d(Q) = [d + 1]_Q / ((1 + Q) [d]_Q)` for `d > 0` and `a_d(Q) = Q [r - 1]_Q / ((1 + Q) [r]_Q)`
for `d = -r < 0`. Where `Q ≠ 1` and the denominators do not vanish this is
`(1 - Q^(d+1)) / ((1 + Q)(1 - Q^d))`, and at `Q = 1` it is the removable value
`(d + 1) / (2d)`. The value at `d = 0`, and wherever a denominator vanishes, is the junk value
of field division; the README uses `a_d(Q)` only for `d ≠ 0`, `1 + Q ≠ 0` and `[|d|]_Q ≠ 0`. -/
noncomputable def wenzlParameter {K : Type*} [Field K] (d : ℤ) (Q : K) : K :=
  if 0 < d then
    (∑ j ∈ Finset.range (d.toNat + 1), Q ^ j) / ((1 + Q) * ∑ j ∈ Finset.range d.toNat, Q ^ j)
  else
    Q * (∑ j ∈ Finset.range ((-d).toNat - 1), Q ^ j) /
      ((1 + Q) * ∑ j ∈ Finset.range (-d).toNat, Q ^ j)

/-- The projection parameters of the positive Markov traces at a real parameter `Q > 0`: the
closed interval between `1 / (1 + Q)` and `Q / (1 + Q)`, together with the values `a_d(Q)`,
`d ≠ 0`. -/
noncomputable def positiveMarkovSet (Q : ℝ) : Set ℝ :=
  Set.Icc (min (1 / (1 + Q)) (Q / (1 + Q))) (max (1 / (1 + Q)) (Q / (1 + Q))) ∪
    {η | ∃ d : ℤ, d ≠ 0 ∧ η = wenzlParameter d Q}

open scoped ComplexOrder in
/-- **Positive Markov traces at real parameters** (Wenzl, Theorem 3.6(a), for `Q ≠ 1`; Thoma's
theorem at `Q = 1`). Let `q` be a real nonzero
parameter and `Q = q²`, and give the infinite type-A Hecke algebra over `ℂ` the involution
fixing every generator and conjugating scalars. The Ocneanu trace with parameter `z` is positive,
`τ (x* x) ≥ 0` for every `x`, exactly when its projection parameter
`η = (z + q⁻¹) / (q + q⁻¹)` is a real number in `positiveMarkovSet Q`. -/
theorem ocneanuTrace_nonneg_iff_of_isSelfAdjoint (q : ℂˣ) [Fact (IsSelfAdjoint (q : ℂ))]
    (z : ℂ) :
    (∀ x : InfiniteTypeAHeckeAlgebra ℂ q,
        0 ≤ InfiniteTypeAHeckeAlgebra.ocneanuTrace ℂ q z (star x * x)) ↔
      ∃ η ∈ positiveMarkovSet ((q : ℂ) ^ 2).re,
        (z + ((q⁻¹ : ℂˣ) : ℂ)) / ((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)) = η := by
  sorry

open scoped ComplexOrder in
/-- **Positive Markov traces at unit-circle parameters** (Wenzl, Theorem 3.6(b), with
Proposition 2.9 for the remaining unit-circle parameters). Let `q` be a complex parameter of
modulus one with `Q = q² ≠ ±1`, and give the infinite type-A Hecke algebra over `ℂ`
the involution sending every generator to its inverse and conjugating scalars. The Ocneanu trace
with parameter `z` is positive exactly when its projection parameter
`η = (z + q⁻¹) / (q + q⁻¹)` is `0` or `1`, or `Q = exp(± 2πi / l)` for some `l ≥ 3` and
`η = a_k(Q)` for some `1 ≤ k ≤ l - 1`. -/
theorem ocneanuTrace_nonneg_iff_of_mem_unitary (q : ℂˣ) [Fact ((q : ℂ) ∈ unitary ℂ)]
    (hQ : (q : ℂ) ^ 2 ≠ 1) (hQ' : (q : ℂ) ^ 2 ≠ -1) (z : ℂ) :
    (∀ x : InfiniteTypeAHeckeAlgebra ℂ q,
        0 ≤ InfiniteTypeAHeckeAlgebra.ocneanuTrace ℂ q z (star x * x)) ↔
      ((z + ((q⁻¹ : ℂˣ) : ℂ)) / ((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)) = 0 ∨
        (z + ((q⁻¹ : ℂˣ) : ℂ)) / ((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)) = 1 ∨
        ∃ l : ℕ, 3 ≤ l ∧ ((q : ℂ) ^ 2 = Complex.exp (2 * Real.pi * Complex.I / l) ∨
            (q : ℂ) ^ 2 = Complex.exp (-(2 * Real.pi * Complex.I / l))) ∧
          ∃ k : ℕ, 1 ≤ k ∧ k ≤ l - 1 ∧
            (z + ((q⁻¹ : ℂˣ) : ℂ)) / ((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)) =
              wenzlParameter (k : ℤ) ((q : ℂ) ^ 2)) := by
  sorry

open scoped ComplexOrder in
/-- **Atomic models of the positive Markov traces at real parameters.** Let `q` be a real
parameter with `Q = q² ≠ 1`, and give the infinite type-A Hecke algebra over `ℂ` the involution
fixing every generator and conjugating scalars. Every positive Ocneanu trace is the restriction of
a product state on words: there are a countable linearly ordered alphabet `ι`, a designation of
its letters as positive or negative, and weights `p > 0` of total mass `1`, such that for every
braid `b` on `n` strands with exponent sum `e(b)` the trace of its image `T_b` is
`q ^ (-e(b)) Tr (D^{⊗n} ρ(b))`. Here `ρ` is the signed checked representation at `s = q`, in which
the elementary braid `σᵢ` acts by the signed checked R-matrix `gᵢ = q Tᵢ` on the words of length
`n` in `ι`, the factor `q ^ (-e(b))` converts the `gᵢ` to the `Tᵢ`, and `D = diag(p)`. The
hypothesis `Q ≠ 1` is needed: at `Q = 1` the regular trace of `S_∞` has no atomic model. -/
theorem exists_signedCheckedRep_trace_eq_ocneanuTrace (q : ℂˣ) [Fact (IsSelfAdjoint (q : ℂ))]
    (hQ : (q : ℂ) ^ 2 ≠ 1) (z : ℂ)
    (hz : ∀ x : InfiniteTypeAHeckeAlgebra ℂ q,
      0 ≤ InfiniteTypeAHeckeAlgebra.ocneanuTrace ℂ q z (star x * x)) :
    ∃ (ι : Type) (_ : LinearOrder ι) (_ : Countable ι) (pos : ι → Prop) (_ : DecidablePred pos)
      (p : ι → ℝ), (∀ i, 0 < p i) ∧ HasSum p 1 ∧
      ∀ (n : ℕ) (b : BraidGroup n),
        InfiniteTypeAHeckeAlgebra.ocneanuTrace ℂ q z
            (InfiniteTypeAHeckeAlgebra.braidHom ℂ q n b : InfiniteTypeAHeckeAlgebra ℂ q) =
          (q : ℂ) ^ (-(Multiplicative.toAdd (ArtinGroup.exponentSum _ b))) *
            ∑' w : Fin n → ι, (∏ i, (p (w i) : ℂ)) *
              ((signedCheckedRep pos q b : Module.End ℂ ((Fin n → ι) →₀ ℂ))
                (Finsupp.single w 1)) w := by
  sorry

end TauCetiRoadmap.TypeAHeckeAlgebras

-- Pinned native interfaces that the README compares with the universal Hecke algebra.
#check TauCeti.KnotTheory.jimboGenerator
#check TauCeti.KnotTheory.jimboGenerator_mul_self
#check TauCeti.KnotTheory.jimboGenerator_braid
#check TauCeti.KnotTheory.jimbo
#check TauCeti.KnotTheory.jimboWeightedTrace
#check TauCeti.KnotTheory.jimboWeightedTrace_conj
#check TauCeti.KnotTheory.jimboWeightedTrace_skein
#check TauCeti.TemperleyLieb.markovTrace
#check TauCeti.TemperleyLieb.markovTrace_mul_comm
#check TauCeti.TemperleyLieb.markovTrace_strandIncl
#check TauCeti.TemperleyLieb.markovTrace_strandIncl_mul_e_last
