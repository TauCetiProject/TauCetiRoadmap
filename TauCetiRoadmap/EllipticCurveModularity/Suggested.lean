import Mathlib
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.TateModule.Galois
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic

/-!
# Modularity of elliptic curves over ℚ: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs.

The statements cover rational endomorphisms
and the rational 3-, 5- and 15-isogeny classifications
(R29.1), rationality of attached newforms (R29.3), every local factor and Dirichlet
coefficient (R29.4), and unconditional modularity, absolute irreducibility of the
rational Tate representation, number-field coefficient summability and the completed functional
equation (R29.6). The conditional analytic comparison takes an attached form directly.
All elliptic statements include curves with geometric complex multiplication.
The small-isogeny conclusions use native j-invariants and geometric point subgroups;
they require no modular-curve carrier in their statements.

At Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, the Artin conductor of a two-dimensional
ℓ-adic or residual Galois representation and the residual
attachment API are absent; Tau Ceti has Artin conductor exponents only for characters of
finite Galois extensions of local fields. Its `WeierstrassCurve.algorithmicConductor`,
computed by Tate's algorithm, is not identified there with the conductor `N_E` of the
README. Thus the exact-conductor refinements and R29.2's residual attachment cannot be
stated here. Modularity and
completion use a positive newform level; R29.4 specifies its identification with the
conductor.

The rational modular curves X₀(N), their Jacobians, modular quotient abelian varieties
and quotient Tate realizations are also absent. Consequently the newform Tate
comparison, the isogeny and parametrisation theorems of R29.5, and R29.6's exhaustive
Jacobian decomposition and geometric converse have no signatures here. Their full
statements, including arbitrary positive geometric levels, remain in the README.
-/

noncomputable section

open Polynomial
open scoped Classical

namespace TauCetiRoadmap.EllipticCurveModularity

open HeckeRing.GL2 (Newform)

/-- The absolute Galois group, as automorphisms acting on native geometric points. -/
abbrev GQ : Type := AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ

/-- The integer Dirichlet coefficient of the elliptic L-function. -/
def lCoeff (E : WeierstrassCurve ℚ) (n : ℕ) : ℤ := E.LFunction n

/-- A finite cyclic subgroup of geometric points of order p, stable under Galois. -/
def HasRationalCyclicSubgroup (E : WeierstrassCurve ℚ) [E.IsElliptic] (p : ℕ) : Prop :=
  ∃ C : AddSubgroup (E.baseChange (AlgebraicClosure ℚ)).toAffine.Point,
    IsAddCyclic C ∧ Finite C ∧ Nat.card C = p ∧
      ∀ σ : GQ, C.map
        ((Multiplicative.toAdd (E.pointGaloisAction σ)).toAddMonoidHom) = C

/-- Fourier coefficients at infinity, with q = exp(2πiz). -/
def coeff {N : ℕ} [NeZero N] {k : ℤ} (F : Newform N k) (n : ℕ) : ℂ :=
  (UpperHalfPlane.qExpansion 1 F.toCuspForm).coeff n

/-- Attachment at any positive level: trivial character and agreement at almost all primes. -/
def IsNewformOf (E : WeierstrassCurve ℚ) {M : ℕ} [NeZero M] (F : Newform M 2) : Prop :=
  F.χ = 1 ∧ ∀ᶠ ℓ : ℕ in Filter.cofinite, ℓ.Prime → coeff F ℓ = (lCoeff E ℓ : ℂ)

/-! ## Layer R29.1: rational endomorphisms and rational isogenies -/

/-- Every endomorphism over ℚ of a dimension-one abelian variety is integer multiplication:
the canonical ring map `n ↦ [n]` from ℤ is bijective.
The ring statement includes elliptic curves with geometric complex multiplication. -/
theorem rationalEndomorphisms_eq_int
    (A : TauCeti.AlgebraicGeometry.AbelianVariety ℚ) (hA : A.dim = 1) :
    Function.Bijective (Int.castRingHom (TauCeti.AlgebraicGeometry.AbelianVariety.End A)) :=
  sorry

/-- A rational cyclic 3-isogeny gives a noncuspidal rational Hauptmodul parameter.
Barrios, Theorem 2.3 and Table 1, arXiv:2208.05603v1. -/
theorem three_isogeny_j (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (h3 : HasRationalCyclicSubgroup E 3) :
    ∃ u : ℚ, u ≠ 0 ∧ E.j * u = (u + 27) * (u + 3) ^ 3 := sorry

/-- A rational cyclic 5-isogeny gives a noncuspidal rational Hauptmodul parameter.
Barrios, Theorem 2.3 and Table 1, arXiv:2208.05603v1. -/
theorem five_isogeny_j (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (h5 : HasRationalCyclicSubgroup E 5) :
    ∃ v : ℚ, v ≠ 0 ∧ E.j * v = (v ^ 2 + 10 * v + 5) ^ 3 := sorry

/-- The four j-invariants of elliptic curves over ℚ with rational cyclic 15-isogenies.
The coprime stable kernels of orders 3 and 5 generate the cyclic kernel of order 15. -/
theorem fifteen_isogeny_j (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (h3 : HasRationalCyclicSubgroup E 3) (h5 : HasRationalCyclicSubgroup E 5) :
    E.j ∈ ({-25 / 2, -349938025 / 8, -121945 / 32, 46969655 / 32768} : Finset ℚ) := sorry

/-! ## Layer R29.3: rationality of attached newforms -/

/-- `EllipticCurveModularity:R29.3/rational-coefficient-field`: every coefficient of a newform attached to `E` is
a rational integer. -/
theorem IsNewformOf.coeff_int (E : WeierstrassCurve ℚ) [E.IsElliptic] {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    ∃ m : ℤ, coeff F n = m := sorry

/-! ## Layer R29.4: every local factor and coefficient -/

/-- `EllipticCurveModularity:R29.4/bad-euler-factors`: every local factor of `E`, in Mathlib's convention, is the
Euler factor of a newform `F` attached to `E`. -/
theorem IsNewformOf.localPolynomial_eq (E : WeierstrassCurve ℚ) [E.IsElliptic] {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (ℓ : ℕ)
    [Fact ℓ.Prime] :
    ∃ a : ℤ, coeff F ℓ = a ∧ (E.baseChange ℚ_[ℓ]).localPolynomial ℤ_[ℓ] =
      1 - C a * X + (if ℓ ∣ M then 0 else C (ℓ : ℤ) * X ^ 2) := sorry

/-- All coefficients agree: `a_n(F) = a_n(E)` for every `n`, bad primes included. -/
theorem IsNewformOf.coeff_eq (E : WeierstrassCurve ℚ) [E.IsElliptic] {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) (n : ℕ) :
    coeff F n = (lCoeff E n : ℂ) := sorry

/-! ## Layer R29.6: modularity and analytic continuation -/

/-- The rational Galois image spans every endomorphism, including for geometric CM.
The action is scalar extension of the supplied integral representation. -/
theorem span_range_rationalTateRep (E : WeierstrassCurve ℚ) [E.IsElliptic]
    (r : ℕ) [Fact r.Prime] :
    Submodule.span ℚ_[r] (Set.range (fun σ : GQ => LinearMap.baseChange ℚ_[r]
      (E.tateModuleGaloisRepresentation (K := AlgebraicClosure ℚ) r σ))) = ⊤ := sorry

/-- Over every number field the native elliptic Dirichlet series is absolutely summable
for `Re s > 3/2`. Hasse's bound gives an ideal-divisor majorant, grouped by ideal norm. -/
theorem LFunction_LSeriesSummable {K : Type*} [Field K] [NumberField K]
    (W : WeierstrassCurve K) [W.IsElliptic] (s : ℂ) (hs : 3 / 2 < s.re) :
    LSeriesSummable (fun n => (W.LFunction n : ℂ)) s := sorry

/-- An attached form supplies an entire completed L-series with its own level M.
It agrees with the literal series for `Re s > 3/2` using elliptic summability
and holomorphic extension of the Mellin comparison. The README identifies M
with the conductor. -/
theorem IsNewformOf.exists_entire_completed_LSeries
    (E : WeierstrassCurve ℚ) [E.IsElliptic]
    {M : ℕ} [NeZero M] {F : Newform M 2} (h : IsNewformOf E F) :
    ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧
      (∀ s : ℂ, 3 / 2 < s.re →
        Λ s = (M : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * E.LSeries s) ∧
      ∃ w : ℤ, (w = 1 ∨ w = -1) ∧ ∀ s : ℂ, Λ s = w * Λ (2 - s) := sorry

/-- Every elliptic curve over ℚ has an attached weight-two newform of trivial character
at a positive level, with every Fourier coefficient equal to the corresponding `a_n(E)`.
The exact-conductor comparison identifies its level with the conductor. -/
theorem modularity (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    ∃ (N : ℕ) (_ : NeZero N) (F : Newform N 2),
      IsNewformOf E F ∧ ∀ n : ℕ, coeff F n = (lCoeff E n : ℂ) := sorry

/-- Every elliptic curve over ℚ has an entire completed L-series with sign ±1.
The positive level is shared with its attached form and equals the conductor through
R29.4's conductor comparison. Agreement uses the literal series only for Re s > 3/2. -/
theorem exists_entire_completed_LSeries (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    ∃ (N : ℕ) (_ : NeZero N) (F : Newform N 2), IsNewformOf E F ∧
      ∃ Λ : ℂ → ℂ, Differentiable ℂ Λ ∧
        (∀ s : ℂ, 3 / 2 < s.re →
          Λ s = (N : ℂ) ^ (s / 2) * (2 * Real.pi : ℂ) ^ (-s) * Complex.Gamma s * E.LSeries s) ∧
        ∃ w : ℤ, (w = 1 ∨ w = -1) ∧ ∀ s : ℂ, Λ s = w * Λ (2 - s) := sorry

end TauCetiRoadmap.EllipticCurveModularity
