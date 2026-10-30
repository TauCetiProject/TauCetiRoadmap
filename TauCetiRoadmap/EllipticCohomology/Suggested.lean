import Mathlib

/-!
# Elliptic cohomology and topological modular forms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against
the pinned Mathlib, the headline theorem of Layer E1 that is statable at the
pins: Deligne's computation of the integral modular forms of the Weierstrass
Hopf algebroid, `H⁰(A, Γ) = ℤ[c₄, c₆, Δ]/(c₄³ − c₆² − 1728Δ)`, stated weight
by weight on the universal Weierstrass curve with the native coordinate-change
action (`isIntegralModularForm_iff`), together with the presentation of the
subring `ℤ[c₄, c₆, Δ]` (`ker_aeval_c₄_c₆_Δ`). The only definitions are the
universal curve, the evaluation of a coefficient polynomial on a curve, the
weight-`k` modular-form predicate and the coefficient weights.

Headline theorems not statable at the pins:
* The stack form `H⁰(Mbar_ell, ω^*) ≅ ℤ[c₄, c₆, Δ]/(c₄³ − c₆² − 1728Δ)` (E1):
  Mathlib has no moduli stack of stable genus-one curves and no Hodge line
  bundle on it; only its Hopf-algebroid form above is stated.
* The sheaf `O^top`, the spectra `tmf`, `Tmf`, `TMF`, their descent spectral
  sequences, the Gap Theorem and `π_* tmf[1/6] ≅ ℤ[1/6][c₄, c₆]` (E2–E4):
  Mathlib has no structured ring spectra or sheaves of spectra.
* The E∞ Thom spectrum `MString`, the Ando–Hopkins–Rezk orientation
  `MString → tmf` and its surjectivity on homotopy (E5): no spectra, Thom
  spectra or E∞ ring maps.
* `tmf_(2) ∧ DA(1) ≃ tmf₁(3)_(2)` and `π_* tmf₁(3)_(2) ≅ ℤ_(2)[a₁, a₃]` (E6):
  no spectra or level-structure moduli.
-/

noncomputable section
namespace TauCetiRoadmap.EllipticCohomology

/-- E1: the universal Weierstrass curve `y² + a₁xy + a₃y = x³ + a₂x² + a₄x + a₆`
over `ℤ[a₁, a₂, a₃, a₄, a₆]`, with `X 0, …, X 4` standing for `a₁, a₂, a₃, a₄, a₆`. -/
def universalWeierstrass : WeierstrassCurve (MvPolynomial (Fin 5) ℤ) :=
  ⟨MvPolynomial.X 0, MvPolynomial.X 1, MvPolynomial.X 2, MvPolynomial.X 3, MvPolynomial.X 4⟩

/-- E1: evaluate a polynomial in the five Weierstrass coefficients on a curve over `R`. -/
def evalCoeff {R : Type*} [CommRing R] (W : WeierstrassCurve R)
    (f : MvPolynomial (Fin 5) ℤ) : R :=
  MvPolynomial.aeval ![W.a₁, W.a₂, W.a₃, W.a₄, W.a₆] f

/-- E1 (Deligne): `f` is an integral modular form of weight `k` when, for every coordinate
change `C = (u, r, s, t)` over every commutative ring, `f(C • W) = u⁻ᵏ f(W)`. The
quantification over all coefficient rings is essential: over `ℤ` alone `u = ±1`. -/
def IsIntegralModularForm (k : ℕ) (f : MvPolynomial (Fin 5) ℤ) : Prop :=
  ∀ (R : Type) [CommRing R] (W : WeierstrassCurve R) (C : WeierstrassCurve.VariableChange R),
    evalCoeff (C • W) f = ((C.u⁻¹ : Rˣ) : R) ^ k * evalCoeff W f

/-- E1: the weights `1, 2, 3, 4, 6` of `a₁, a₂, a₃, a₄, a₆`, for which `c₄`, `c₆`, `Δ` are
weighted homogeneous of weights `4`, `6`, `12`. -/
def coefficientWeight : Fin 5 → ℕ := ![1, 2, 3, 4, 6]

/-- E1 headline (Deligne; Bauer, *Computation of the homotopy of the spectrum tmf*, §3):
the integral modular forms of weight `k` are exactly the weight-`k` weighted-homogeneous
elements of the subring `ℤ[c₄, c₆, Δ]`. The hard direction is the inclusion of the
invariants into `ℤ[c₄, c₆, Δ]`, the depth-two Hartogs argument of E1. -/
theorem isIntegralModularForm_iff (k : ℕ) (f : MvPolynomial (Fin 5) ℤ) :
    IsIntegralModularForm k f ↔
      f ∈ Algebra.adjoin ℤ
          {universalWeierstrass.c₄, universalWeierstrass.c₆, universalWeierstrass.Δ} ∧
        f.IsWeightedHomogeneous coefficientWeight k := by
  sorry

/-- E1 headline: the presentation `ℤ[c₄, c₆, Δ] ≅ ℤ[C₄, C₆, D]/(C₄³ − C₆² − 1728 D)`.
The relation holds by `WeierstrassCurve.c_relation`; the converse uses the algebraic
independence of `c₄, c₆` over `ℤ` and the `ℤ`-torsion-freeness of the quotient. -/
theorem ker_aeval_c₄_c₆_Δ :
    RingHom.ker (MvPolynomial.aeval (R := ℤ)
        ![universalWeierstrass.c₄, universalWeierstrass.c₆, universalWeierstrass.Δ]) =
      Ideal.span {MvPolynomial.X 0 ^ 3 - MvPolynomial.X 1 ^ 2 - 1728 * MvPolynomial.X 2} := by
  sorry

end TauCetiRoadmap.EllipticCohomology
