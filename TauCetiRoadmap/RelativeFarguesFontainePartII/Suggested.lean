module

public import Mathlib

/-!
# Relative Fargues–Fontaine function theory, part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The strict endomorphism theorem uses
native Laurent series, normed algebraic closures and uniform completions; the exotic
untilt theorem uses `ℂ_[p]`, its valuation ring `𝓞_ℂ_[p]` and `PreTilt`, with the
instance `fact_not_isUnit_natCast_padicComplexInt` recording from `PadicComplex.valuation_p`
and `PadicComplexInt.integers` that `p` is not a unit of `𝓞_ℂ_[p]`, so that the tilt of
`𝓞_ℂ_[p]` is a ring; the valued automorphism-extension theorem uses the Hahn field
`HahnSeries ℚ (AlgebraicClosure (ZMod p))`.

The following headline theorems are not statable at the pins:
* Completed Newton product and weighted zero theorem: lacks ramified completed interval rings and classical primitive-point carrier.
* Boundary extension and unit theorem: lacks ramified interval rings with boundary norms.
* Primitive factorization and finite-degree marked untilts: lacks ramified Witt and marked-untilt carriers.
* Closed ideal/divisor classification and half-open Bézout theorem: lacks period annuli and locally finite classical-point divisors.
* Frobenius orbit products and homogeneous factorization: lacks period ring Frobenius eigenspaces and their graded algebra.
* Fundamental exact sequence with repeated de Rham jets: lacks period eigenvectors and marked ramified de Rham jets.
* General-field Dedekind charts and continuous-character class group: lacks the invariant Be chart and completed-base-change action.
* Degree-one generation and the weighted schematic curve: lacks the specific period graded algebra and its Proj.
* Interval bundle equivalence and coherent-module classification: lacks compatible period-annulus module systems.
* Finite étale annular extension and effective continuous descent: lacks ramified annular Banach algebras and continuous semilinear actions.
* Rational functions, finite covers and coefficient change: lacks the period curve and its field/base-change comparison.
* Degree and characters of Frobenius lines and positive-line Proj: lacks finite-projective modules on the actual global period ring with its Frobenius.
* Runge approximation and reconstruction of the adic curve: lacks schematic period charts with radial norm data.
* Nonprincipal positive period ideal: lacks the positive period subring B⁺ of the tilt `PreTilt 𝓞_ℂ_[p] p`; the headline is the B⁺ assertion.
* Exotic untilt as a residue field of a closed point of the curve: lacks the curve; the field-theoretic statement is stated.
* Weakly closed prime classification: lacks the general ramified integral period ring with its weak topology.
* Valued-homogeneity primitive-point orbit theorem: lacks the primitive-point and marked-untilt action carriers; the valued-field automorphism-extension theorem is stated.

The p-typical algebraic Fontaine and de Rham APIs do not supply these general
ramified annular carriers. No arbitrary-ring stand-ins are used for them.
-/

@[expose] public section

namespace TauCetiRoadmap.RelativeFarguesFontainePartII

/-! ## Layer 11: Arithmetic examples and maximal completeness -/

/-- The prime `p` is not a unit of the ring of integers `𝓞_ℂ_[p]` of `ℂ_[p]`: its valuation
is `1/p < 1` (`PadicComplex.valuation_p`), and units of the ring of integers have valuation
one (`PadicComplexInt.integers`). This is the class under which Mathlib's `PreTilt 𝓞_ℂ_[p] p`
is a ring. -/
instance fact_not_isUnit_natCast_padicComplexInt (p : ℕ) [hp : Fact p.Prime] :
    Fact (¬ IsUnit ((p : ℕ) : 𝓞_ℂ_[p])) := ⟨by
  intro h
  have h1 := (Valuation.Integers.isUnit_iff_valuation_eq_one (PadicComplexInt.integers p)).mp h
  rw [map_natCast (algebraMap (𝓞_ℂ_[p]) ℂ_[p]) p, PadicComplex.valuation_p] at h1
  have hp2 : (2 : NNReal) ≤ p := by exact_mod_cast hp.out.two_le
  have : (1 : NNReal) / p < 1 := by
    rw [div_lt_one (by positivity)]
    exact lt_of_lt_of_le one_lt_two hp2
  exact this.ne h1⟩

/-- A completed algebraic closure of a Laurent-series field in positive characteristic
has a continuous endomorphism fixing the coefficient field which is not surjective
(KT16, Theorem 1.2). The norm on the algebraic closure induces the Laurent-series
valuation ordering. -/
theorem exists_strict_laurentClosure_endomorphism
    (p : ℕ) [Fact p.Prime] (k : Type*) [Field k] [CharP k p]
    (K : Type*) [NormedField K] [Algebra (LaurentSeries k) K]
    [IsAlgClosure (LaurentSeries k) K]
    (hvaluation : ∀ x y : LaurentSeries k,
      ‖algebraMap (LaurentSeries k) K x‖ ≤ ‖algebraMap (LaurentSeries k) K y‖ ↔
        (Valued.v x : WithZero (Multiplicative ℤ)) ≤ Valued.v y) :
    ∃ f : UniformSpace.Completion K →+* UniformSpace.Completion K,
      Continuous f ∧
      (∀ a : k,
        f ((algebraMap (LaurentSeries k) K (algebraMap k (LaurentSeries k) a) : K) :
          UniformSpace.Completion K) =
        ((algebraMap (LaurentSeries k) K (algebraMap k (LaurentSeries k) a) : K) :
          UniformSpace.Completion K)) ∧
      ¬ Function.Surjective f := by
  sorry

/-- Kedlaya–Temkin: there is a complete algebraically closed nonarchimedean field `K` of
characteristic zero and residue characteristic `p` whose tilt is isomorphic to that of `ℂ_[p]`,
but which admits no continuous field isomorphism to `ℂ_[p]` (KT16, Theorem 1.3). The condition
`0 < v p` excludes characteristic `p`, where the tilt of `ℂ_[p]` itself would be a trivial
example; a continuous field isomorphism of such fields is automatically a homeomorphism. -/
theorem exists_untilt_padicComplex_not_continuouslyIsomorphic
    (p : ℕ) [Fact p.Prime] :
    ∃ (K : Type) (_ : Field K) (_ : Valued K NNReal),
      CompleteSpace K ∧ IsAlgClosed K ∧
      0 < Valued.v (p : K) ∧ Valued.v (p : K) < 1 ∧
      (∃ _ : Fact (¬ IsUnit ((p : ℕ) : (Valued.v : Valuation K NNReal).valuationSubring)),
        Nonempty (PreTilt (Valued.v : Valuation K NNReal).valuationSubring p ≃+*
          PreTilt 𝓞_ℂ_[p] p)) ∧
      ¬ ∃ e : K ≃+* ℂ_[p], Continuous e := by
  sorry

/-- Valued homogeneity of the Mal'cev–Neumann field `𝔽̄_p((t^ℚ))`: for `x, y` of positive
order there is a field automorphism fixing the constants, sending `x` to `y` and multiplying
the order of every element by `order y / order x` (Poonen93, Theorem 2 and Corollaries 5–6).
For `z = 0` both sides are the junk order `0`. -/
theorem exists_hahnSeries_automorphism_rescaling_order
    (p : ℕ) [Fact p.Prime] (x y : HahnSeries ℚ (AlgebraicClosure (ZMod p)))
    (hx : 0 < x.order) (hy : 0 < y.order) :
    ∃ σ : HahnSeries ℚ (AlgebraicClosure (ZMod p)) ≃+* HahnSeries ℚ (AlgebraicClosure (ZMod p)),
      (∀ c : AlgebraicClosure (ZMod p), σ (HahnSeries.C c) = HahnSeries.C c) ∧
      σ x = y ∧
      ∀ z, (σ z).order = (y.order / x.order) * z.order := by
  sorry

end TauCetiRoadmap.RelativeFarguesFontainePartII
