import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Universal

/-!
# Elliptic cohomology and topological modular forms: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against
the pinned Mathlib and Tau Ceti, the headline theorem of Layer E1 that is
statable at the pins: Deligne's computation of the integral modular forms of the Weierstrass
Hopf algebroid, `H⁰(A, Γ) = ℤ[c₄, c₆, Δ]/(c₄³ − c₆² − 1728Δ)`, stated weight
by weight on the universal Weierstrass curve with the native coordinate-change
action (`isIntegralModularForm_iff`), together with the presentation of the
subring `ℤ[c₄, c₆, Δ]` (`ker_aeval_c₄_c₆_Δ`). The only definitions are the
weight-`k` modular-form predicate and the coefficient weights; the universal
curve and specialization homomorphism are supplied by Tau Ceti.

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

/-! ## Layer 1: E1. Integral modular forms -/

/-- E1 (Deligne): `f` is an integral modular form of weight `k` when, for every coordinate
change `C = (u, r, s, t)` over every commutative ring, `f(C • W) = u⁻ᵏ f(W)`. The
quantification over all coefficient rings is essential: over `ℤ` alone `u = ±1`. -/
def IsIntegralModularForm (k : ℕ) (f : MvPolynomial WeierstrassCurve.Coeff ℤ) : Prop :=
  ∀ (R : Type) [CommRing R] (W : WeierstrassCurve R) (C : WeierstrassCurve.VariableChange R),
    (C • W).specialize f = ((C.u⁻¹ : Rˣ) : R) ^ k * W.specialize f

/-- E1: the weights `1, 2, 3, 4, 6` of `a₁, a₂, a₃, a₄, a₆`, for which `c₄`, `c₆`, `Δ` are
weighted homogeneous of weights `4`, `6`, `12`. -/
def coefficientWeight : WeierstrassCurve.Coeff → ℕ :=
  WeierstrassCurve.Coeff.rec 1 2 3 4 6

/-- E1 headline (Deligne; Bauer, *Computation of the homotopy of the spectrum tmf*, §3):
the integral modular forms of weight `k` are exactly the weight-`k` weighted-homogeneous
elements of the subring `ℤ[c₄, c₆, Δ]`. The hard direction is the inclusion of the
invariants into `ℤ[c₄, c₆, Δ]`, the depth-two Hartogs argument of E1. -/
theorem isIntegralModularForm_iff (k : ℕ) (f : MvPolynomial WeierstrassCurve.Coeff ℤ) :
    IsIntegralModularForm k f ↔
      f ∈ Algebra.adjoin ℤ
          {WeierstrassCurve.Universal.curve.c₄, WeierstrassCurve.Universal.curve.c₆,
            WeierstrassCurve.Universal.curve.Δ} ∧
        f.IsWeightedHomogeneous coefficientWeight k := by
  sorry

/-- E1 headline: the presentation `ℤ[c₄, c₆, Δ] ≅ ℤ[C₄, C₆, D]/(C₄³ − C₆² − 1728 D)`.
The relation holds by `WeierstrassCurve.c_relation`; the converse uses the algebraic
independence of `c₄, c₆` over `ℤ` and the `ℤ`-torsion-freeness of the quotient. -/
theorem ker_aeval_c₄_c₆_Δ :
    RingHom.ker (MvPolynomial.aeval (R := ℤ)
        ![WeierstrassCurve.Universal.curve.c₄, WeierstrassCurve.Universal.curve.c₆,
          WeierstrassCurve.Universal.curve.Δ]) =
      Ideal.span {MvPolynomial.X 0 ^ 3 - MvPolynomial.X 1 ^ 2 - 1728 * MvPolynomial.X 2} := by
  sorry

end TauCetiRoadmap.EllipticCohomology
