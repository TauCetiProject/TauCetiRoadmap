import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic

/-!
# Modularity of elliptic curves over ℚ: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These are suggested Lean forms of its headline results; discharging them
finishes neither a layer nor the roadmap.

The statements cover rational endomorphisms and finiteness of exceptional primes
(R29.1), rationality of attached newforms (R29.3), every local factor and Dirichlet
coefficient (R29.4), and unconditional modularity, absolute irreducibility of the
rational Tate representation, coefficient summability and the completed functional
equation (R29.6). The conditional analytic comparison takes an attached form directly.
All elliptic statements include curves with geometric complex multiplication.

At Mathlib `6b7abb3` and Tau Ceti `a91d3aa`, the arithmetic elliptic and Artin
conductors, Serre weight and finite-flat residual attachment API are absent. Thus the
exact-conductor refinements, R29.2's Serre witness family and R29.3's theorem with a
family of residual attachments cannot be stated here. Modularity and completion use
a positive newform level; R29.4 specifies its identification with the conductor.

The rational modular curves X₀(N), their Jacobians, modular quotient abelian varieties
and quotient Tate realizations are also absent. Consequently the newform Tate
comparison, the isogeny and parametrisation theorems of R29.5, and R29.6's exhaustive
Jacobian decomposition and geometric converse have no signatures here. Their full
statements, including arbitrary positive geometric levels, remain in the README.
-/

noncomputable section

open Polynomial
open scoped Classical

namespace TauCeti.EllipticCurve.Modularity

open HeckeRing.GL2 (Newform)

/-- The absolute Galois group, as automorphisms acting on native geometric points. -/
abbrev GQ : Type := AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ

/-- The integer Dirichlet coefficient of the elliptic L-function. -/
def lCoeff (E : WeierstrassCurve ℚ) (n : ℕ) : ℤ := E.LFunction n

/-- Good reduction of the minimal model over the p-adic integers. -/
def HasGoodReductionAt (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] : Prop :=
  ((E.baseChange ℚ_[p]).minimal ℤ_[p]).HasGoodReduction ℤ_[p]

/-- Multiplicative reduction of the minimal model over the p-adic integers. -/
def HasMultiplicativeReductionAt (E : WeierstrassCurve ℚ) (p : ℕ) [Fact p.Prime] : Prop :=
  ((E.baseChange ℚ_[p]).minimal ℤ_[p]).HasMultiplicativeReduction ℤ_[p]

/-- A finite cyclic subgroup of geometric points of order p, stable under Galois. -/
def HasRationalCyclicSubgroup (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : Prop :=
  ∃ C : AddSubgroup (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point,
    IsAddCyclic C ∧ Finite C ∧ Nat.card C = p ∧
      ∀ σ : GQ, C.map
        ((Multiplicative.toAdd (E.pointGaloisAction σ)).toAddMonoidHom) = C

/-- Fourier coefficients at infinity, with q = exp(2πiz). -/
def coeff {N : ℕ} [NeZero N] {k : ℤ} (F : Newform N k) (n : ℕ) : ℂ :=
  (UpperHalfPlane.qExpansion 1 F.toCuspForm).coeff n

/-- The four exceptional-prime clauses of R29.1, using minimal local models. -/
def exceptionalPrimes (E : WeierstrassCurve ℚ) [E.IsElliptic] : Set ℕ :=
  {p | ∃ hp : p.Prime, haveI : Fact p.Prime := ⟨hp⟩
    p ≤ 5 ∨ ¬ HasGoodReductionAt E p ∨
      (∃ (ℓ : ℕ) (hℓ : ℓ.Prime), haveI : Fact ℓ.Prime := ⟨hℓ⟩
        HasMultiplicativeReductionAt E ℓ ∧ (p : ℤ) ∣ padicValRat ℓ E.j) ∨
      HasRationalCyclicSubgroup E p}

/-- Attachment at any positive level: trivial character and agreement at almost all primes. -/
def IsNewformOf (E : WeierstrassCurve ℚ) {M : ℕ} [NeZero M] (F : Newform M 2) : Prop :=
  F.χ = 1 ∧ ∀ᶠ ℓ : ℕ in Filter.cofinite, ℓ.Prime → coeff F ℓ = (lCoeff E ℓ : ℂ)

/-! ## Layer R29.1: rational endomorphisms and exceptional primes -/

/-- Every endomorphism over ℚ of a dimension-one abelian variety is integer multiplication.
The ring statement includes elliptic curves with geometric complex multiplication. -/
theorem rationalEndomorphisms_eq_int
    (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (hA : A.dim = 1) :
    Nonempty (TauCeti.AlgebraicGeometry.AbelianVariety.End A ≃+* ℤ) := sorry

/-- The four exceptional-prime clauses exclude only finitely many primes, including for geometric CM. -/
theorem exceptionalPrimes_finite (E : WeierstrassCurve ℚ) [E.IsElliptic] : (exceptionalPrimes E).Finite := sorry

/-! ## Layer R29.3: rationality of attached newforms -/

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- `EllipticCurveModularity:R29.3/rational-coefficient-field`: every coefficient of a newform attached to `E` is
a rational integer. -/
theorem IsNewformOf.coeff_int {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    ∃ m : ℤ, coeff F n = m := sorry

/-! ## Layer R29.4: every local factor and coefficient -/

/-- `EllipticCurveModularity:R29.4/bad-euler-factors`: every local factor of `E`, in Mathlib's convention, is the
Euler factor of a newform `F` attached to `E`. -/
theorem IsNewformOf.localPolynomial_eq {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (ℓ : ℕ)
    [Fact ℓ.Prime] :
    ∃ a : ℤ, coeff F ℓ = a ∧ (E.baseChange ℚ_[ℓ]).localPolynomial ℤ_[ℓ] =
      1 - C a * X + (if ℓ ∣ M then 0 else C (ℓ : ℤ) * X ^ 2) := sorry

/-- All coefficients agree: `a_n(F) = a_n(E)` for every `n`, bad primes included. -/
theorem IsNewformOf.coeff_eq {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    coeff F n = (lCoeff E n : ℂ) := sorry

/-! ## Layer R29.6: modularity and analytic continuation -/

/-- The rational Galois image spans every endomorphism, including for geometric CM.
The action is scalar extension of the supplied integral representation. -/
theorem span_range_rationalTateRep (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (r : ℕ) [Fact r.Prime] :
    Submodule.span ℚ_[r] (Set.range (fun σ : GQ => LinearMap.baseChange ℚ_[r]
      (E.tateModuleGaloisRepresentation (K := AlgebraicClosure ℚ) r σ))) = ⊤ := sorry

/-- The elliptic Dirichlet coefficients are absolutely summable for `Re s > 3/2`.
Hasse's bound and the local recurrences give the divisor majorant `d(n)√n`. -/
theorem lCoeff_LSeriesSummable (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (s : ℂ) (hs : 3 / 2 < s.re) :
    LSeriesSummable (fun n => (lCoeff E n : ℂ)) s := sorry

/-- An attached form supplies an entire completed L-series with its own level M.
It agrees with the literal series for `Re s > 3/2` using elliptic summability
and holomorphic extension of the Mellin comparison. The README identifies M
with the conductor. -/
theorem IsNewformOf.exists_entire_completed_LSeries
    {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) :
    ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧
      (∀ s : ℂ, 3 / 2 < s.re →
        Λ s = (M : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * E.LSeries s) ∧
      ∃ w : ℤ, (w = 1 ∨ w = -1) ∧ ∀ s : ℂ, Λ s = w * Λ (2 - s) := sorry

/-- Every elliptic curve over ℚ has an attached weight-two newform of trivial character
at a positive level, with every Fourier coefficient equal to the corresponding `a_n(E)`.
The exact-conductor comparison identifies its level with the conductor. -/
theorem modularity :
    ∃ (N : ℕ) (_ : NeZero N) (F : Newform N 2),
      IsNewformOf E F ∧ ∀ n : ℕ, coeff F n = (lCoeff E n : ℂ) := sorry

/-- Every elliptic curve over ℚ has an entire completed L-series with sign ±1.
The positive level is shared with its attached form and equals the conductor through
R29.4's conductor comparison. Agreement uses the literal series only for Re s > 3/2. -/
theorem exists_entire_completed_LSeries :
    ∃ (N : ℕ) (_ : NeZero N) (F : Newform N 2), IsNewformOf E F ∧
      ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧
        (∀ s : ℂ, 3 / 2 < s.re →
          Λ s = (N : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * E.LSeries s) ∧
        ∃ w : ℤ, (w = 1 ∨ w = -1) ∧ ∀ s : ℂ, Λ s = w * Λ (2 - s) := sorry

end TauCeti.EllipticCurve.Modularity
