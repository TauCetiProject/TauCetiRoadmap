module

public import Mathlib
public import TauCeti.NumberTheory.ModularForms.LFunction.Sign
public import TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Character

/-!
# Rank-one converses: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned APIs: the two branches of the locally prescribed
quadratic-twist nonvanishing theorem of Layer 4 (Bump--Friedberg--Hoffstein), on the native
newforms, Fricke signs, analytic ranks and fundamental-discriminant characters.

The other headline theorems are not statable on their arithmetic carriers at these pins:

* Residual restriction (Layer 0) lacks the attached residual newform Galois
  representation, with its squarefree local realization.
* Arithmetic rank-one localization at every coefficient place, the semilocal
  image dimension and strict-kernel vanishing (Layer 1) lack the canonical
  coefficient-compatible rational Bloch--Kato Selmer group and local realization.
* Anticyclotomic reverse divisibility, finite-error augmentation control and
  augmentation obstruction (Layer 2) lack the canonical one-sided Selmer
  deformation and the attached anticyclotomic analytic function.
* Theorem B (Layer 3) additionally lacks the attached modular abelian variety
  and its arithmetic and analytic base-change comparisons.
* Theorem A (Layer 4) lacks the modular abelian variety `A_f` with its Hecke-field action.
* Theorem A' (Layer 4) lacks the analytic continuation to `s = 1` of the pinned
  `WeierstrassCurve.LSeries` and the Tate--Shafarevich group of `E/ℚ` as a continuous
  Galois module for `ContinuousCohomology.tateShafarevich`.
* Theorem C (Layer 5) lacks that continuation, the Tate--Shafarevich group of `E/ℚ`, and an
  odd-prime elliptic Selmer group with its local Kummer map.
* Theorem E (Layer 6) lacks the modular abelian variety, its Tate--Shafarevich group and
  the comparison of its L-function with the conjugate newform product.

The pinned Weierstrass L-series and reduction predicates, abelian varieties, continuous
cohomology and the cohomological Tate--Shafarevich kernel exist, but do not by themselves
supply these comparisons. The point-height and point-logarithm criteria have their supplier
in GrossZagierAndArithmeticHeights and are not restated here.
-/

@[expose] public section

namespace TauCetiRoadmap.RankOneConverse

open HeckeRing.GL2 TauCeti.Multiquadratic

/-- `g` is the **primitive quadratic twist** of the newform `f` by the fundamental discriminant
`D`: the `q`-th Fourier coefficient of `g` is `χ_D(q) a_q(f)` at every prime `q` not dividing
`N M D`. At most one newform satisfies this: cross-level strong multiplicity one for newforms
(ModularForms Layer 5) recovers the level and the nebentypus of `g` from these coefficients, so
the nebentypus is not assumed in advance. The primitive newform attached to `f ⊗ χ_D` satisfies
it; when `f` has trivial nebentypus, so does `g`. -/
def IsPrimitiveQuadraticTwist {N M : ℕ} [NeZero N] [NeZero M] {k : ℤ}
    (f : Newform N k) (g : Newform M k) (D : ℤ) (hD : IsFundamentalDiscriminant D) : Prop :=
  ∀ q : ℕ, q.Prime → ¬ q ∣ N * M * D.natAbs →
    (UpperHalfPlane.qExpansion 1 g.toCuspForm).coeff q =
      ((fundamentalDiscriminantChar D hD (q : ZMod D.natAbs) : ℤ) : ℂ) *
        (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff q

/-! ## Layer 4: prescribed quadratic twists -/

/-- **Bump–Friedberg–Hoffstein, value branch.** Let `f` be a newform of positive weight `k`,
level `N` and trivial nebentypus, with root number `ε = i^k ε_N(f) ∈ {±1}`, and let `S₀` be a
finite set of primes containing every prime divisor of `N`. There are infinitely many
fundamental discriminants `D` with `ε D > 0`, every prime of `S₀` split in `ℚ(√D)`, and
primitive quadratic twist of analytic rank `0`, i.e. `L(f ⊗ χ_D, k/2) ≠ 0`
(Bump–Friedberg–Hoffstein 1990, Introduction, Theorem (ii), pp. 543–544). -/
theorem infinite_twist_analyticRank_eq_zero {N : ℕ} [NeZero N] {k : ℤ}
    (f : Newform N k) (hχ : f.χ = 1) (hk : 0 < k) (ε : ℤ)
    (hε : Complex.I ^ k * f.frickeSign hχ = ε) (S₀ : Finset ℕ)
    (hS₀ : ∀ q ∈ S₀, q.Prime) (hN : ∀ q : ℕ, q.Prime → q ∣ N → q ∈ S₀) :
    {D : ℤ | ∃ hD : IsFundamentalDiscriminant D, 0 < ε * D ∧
      (∀ q ∈ S₀, fundamentalDiscriminantChar D hD (q : ZMod D.natAbs) = 1) ∧
      ∃ (M : ℕ) (_ : NeZero M) (g : Newform M k),
        IsPrimitiveQuadraticTwist f g D hD ∧ g.analyticRank hk = 0}.Infinite := by
  sorry

/-- **Bump–Friedberg–Hoffstein, derivative branch.** Under the hypotheses of
`infinite_twist_analyticRank_eq_zero`, there are infinitely many fundamental discriminants `D`
with `ε D < 0`, every prime of `S₀` split in `ℚ(√D)`, and primitive quadratic twist of analytic
rank exactly `1`, i.e. a simple zero of `L(f ⊗ χ_D, s)` at `s = k/2`
(Bump–Friedberg–Hoffstein 1990, Introduction, Theorem (i), pp. 543–544). -/
theorem infinite_twist_analyticRank_eq_one {N : ℕ} [NeZero N] {k : ℤ}
    (f : Newform N k) (hχ : f.χ = 1) (hk : 0 < k) (ε : ℤ)
    (hε : Complex.I ^ k * f.frickeSign hχ = ε) (S₀ : Finset ℕ)
    (hS₀ : ∀ q ∈ S₀, q.Prime) (hN : ∀ q : ℕ, q.Prime → q ∣ N → q ∈ S₀) :
    {D : ℤ | ∃ hD : IsFundamentalDiscriminant D, ε * D < 0 ∧
      (∀ q ∈ S₀, fundamentalDiscriminantChar D hD (q : ZMod D.natAbs) = 1) ∧
      ∃ (M : ℕ) (_ : NeZero M) (g : Newform M k),
        IsPrimitiveQuadraticTwist f g D hD ∧ g.analyticRank hk = 1}.Infinite := by
  sorry

end TauCetiRoadmap.RankOneConverse
