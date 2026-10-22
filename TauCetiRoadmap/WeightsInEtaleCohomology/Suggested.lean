import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Fields

/-!
# Weights in étale cohomology: headline target

**This file is not the roadmap and is not exhaustive.** README.md is definitive.

R34.6's good-prime Hecke-root purity and Ramanujan bound are stated together in
`newform_ramanujan`, for Tau Ceti's normalized cuspidal newforms of every level,
arbitrary nebentypus and weight at least two, at every complex embedding of their
coefficient field. The polynomial has coefficients in that actual field; neither
purity nor a bound on its roots is assumed.

R34.1's numerical weight predicates, operations and character counterexamples
are infrastructure. Its sheaf and complex comparisons and R34.2's good-reduction
theorems require rational adic cohomology with its continuous Galois action,
local Frobenius and specialization maps. Mathlib's integral pro-étale
`Scheme.EllAdicCohomology` supplies additive groups, without this rational
representation interface. Abelian varieties and elliptic Tate modules exist,
but the general abelian Tate/H¹ and curve–Jacobian comparisons needed here do not.

R34.3's proper specialization, Picard–Lefschetz, crystalline weight spectral
sequence, correspondence traces and semistable-period comparison require nearby
cycles, log-crystalline/Hyodo–Kato cohomology and structured period modules.
R34.4's descended-pencil and open-monodromy comparisons require the arithmetic
vanishing-cycle local system and its radical quotient. R34.5's parabolic purity,
Kuga–Sato/Hilbert projectors, modular Jacobian realization and arithmetic hard
Lefschetz require the corresponding adic cohomology, algebraic correspondences
and cup-product maps. Those interfaces are absent at the pins.

R34.6's common good-prime Frobenius polynomials and Hilbert local compatibility
and monodromy weights require actual eigenform Galois realizations, Hilbert–Shimura
models and Weil–Deligne/period realizations, also absent at the pins. These
geometric results have no substitute statements here.
-/

open Polynomial UpperHalfPlane

namespace TauCeti.Weights

variable {N : ℕ} [NeZero N] {k : ℤ}

/-- The good-index Hecke polynomial over the newform's coefficient field. -/
noncomputable def newformHeckePolynomial (f : HeckeRing.GL2.Newform N k)
    (p : ℕ+) (hpN : Nat.Coprime (p : ℕ) N) : (TauCeti.CoefficientField f)[X] :=
  X ^ 2 - C ⟨(qExpansion 1 f.toCuspForm).coeff p,
    TauCeti.coeff_mem_CoefficientField f p⟩ * X +
  C (⟨(f.χ (ZMod.unitOfCoprime p hpN) : ℂ),
    TauCeti.char_mem_CoefficientField f _⟩ * (p : TauCeti.CoefficientField f) ^ (k - 1))

/-- R34.6: at every good prime and every coefficient embedding, the Hecke roots
have weight `k − 1` and the Fourier coefficient satisfies the Ramanujan bound. -/
theorem newform_ramanujan (f : HeckeRing.GL2.Newform N k) (hk : 2 ≤ k)
    (p : ℕ+) (hp : (p : ℕ).Prime) (hpN : Nat.Coprime (p : ℕ) N)
    (σ : TauCeti.CoefficientField f →ₐ[ℚ] ℂ) :
    (∀ α : ℂ, ((newformHeckePolynomial f p hpN).map σ.toRingHom).IsRoot α →
      ‖α‖ = Real.rpow (p : ℝ) (((k : ℝ) - 1) / 2)) ∧
    ‖σ ⟨(qExpansion 1 f.toCuspForm).coeff p,
      TauCeti.coeff_mem_CoefficientField f p⟩‖ ≤
        2 * Real.rpow (p : ℝ) (((k : ℝ) - 1) / 2) := by
  sorry

end TauCeti.Weights
