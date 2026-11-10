module
/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.RingTheory.CyclicCohomology.Matrix

/-!
# Cyclic cohomology, spectral triples and noncommutative tori: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the headline theorem of the roadmap that is statable on the pinned
carriers: matrix Morita invariance of cyclic cohomology (N1.Cyclic, consumed by N2), on
Tau Ceti's `cyclicCohomology` and its matrix extension `cyclicCohomology.matrixExtension`.

Two headlines of the README are theorems of the pinned Tau Ceti and are not restated here:
the realization of every cyclic cocycle as the character of a universal-form cycle
(N1.Cyclic) is `UniversalForms.cycleCocycle_trace`, and the torus cyclic two-cocycle of N6,
in its algebraic form for a trace killed by two commuting derivations, is
`traceDerivationPairCocycle`.

Headline theorems of the README that are not statable at the pins:

* the character index theorem of N3 lacks a trace functional on trace-class operators (the
  pins have the trace-class and Schatten ideals for `1 ≤ p < ∞` with their gauges, and the
  trace only in finite dimension, `LinearMap.trace` and `TauCeti.traceCLM`), hence the
  conditional trace `Tr′` and the character; it also lacks the Schatten quasi-ideals for
  `0 < p < 1`;
* the Hochschild-class theorem of N5 lacks the Borel functional calculus `|D|⁻ⁿ` of a
  self-adjoint operator with compact resolvent, the spectral-triple carrier, N3's
  character and the complex-linear Dixmier trace on `L^(1,∞)` of a dilation-invariant
  generalized limit, which the Hochschild cocycle evaluates on non-positive operators; the pin
  has the logarithmic ideal and the real-valued `dixmierTrace`, which is Dixmier's trace on
  positive operators and `Tr_ω(|T|)` on a general operator `T`;
* the periodic cyclic cohomology `HP^even(𝒜_θ) ≃ ℂ²` of N6 lacks the Fréchet topology and the
  derivations of the smooth torus `SmoothNoncommutativeTorus` and a continuous periodic cyclic
  cohomology; the pin has the algebraic periodic theory and continuous cyclic cohomology in
  each fixed degree;
* the Hochschild computation for Diophantine θ in N6 lacks continuous Hochschild cohomology
  with coefficients in the continuous dual of the smooth torus;
* the Heisenberg-module index and the trace/Chern values `(θ, 1)` of N7 lack the completion and
  the interior tensor product of Hilbert C⋆-modules (the pins have Mathlib's `CStarModule` class
  with neither), hence the completed Heisenberg module over the rotation algebra and its
  localization at the trace, and the derivations of `SmoothNoncommutativeTorus` that define the
  torus cocycle φ.
-/

namespace TauCetiRoadmap.NoncommutativeGeometry

universe u v w

/-! ## N1.Cyclic: matrix Morita invariance -/

/-- **Matrix Morita invariance of cyclic cohomology.** For a unital algebra `A` over a
commutative `ℚ`-algebra `R`, coefficients in an `R`-module `M` and a nonempty finite index type
`ι`, the matrix extension `φ ↦ φ#Tr`,
`(φ#Tr)(a₀, …, aₙ) = ∑ φ((a₀)_{i₀i₁}, …, (aₙ)_{iₙi₀})`, induces a bijection
`HCⁿ(A; M) → HCⁿ(M_ι(A); M)` in every degree `n`. Connes, Non-commutative differential
geometry, Publ. Math. IHÉS 62 (1985), Part II, Corollary 24, p. 113, for the bimodule `A^ι`,
is the case `R = M = ℂ`; in general the matrix extension and restriction to a diagonal corner
are mutually inverse on Hochschild cohomology, and the five lemma along the SBI sequence
carries this to cyclic cohomology over a `ℚ`-algebra. -/
theorem bijective_matrixExtension {R : Type u} [CommRing R] [Algebra ℚ R]
    {A : Type v} [Ring A] [Algebra R A] {M : Type w} [AddCommGroup M] [Module R M]
    (ι : Type*) [Fintype ι] [DecidableEq ι] [Nonempty ι] (n : ℕ) :
    Function.Bijective (TauCeti.cyclicCohomology.matrixExtension (R := R) (A := A) M ι n) := by
  sorry

end TauCetiRoadmap.NoncommutativeGeometry
