import TauCeti.RingTheory.PowerSeries.TateAlgebra
import TauCeti.RingTheory.PowerSeries.Weierstrass.Ideal
import TauCeti.RingTheory.MvPowerSeries.TateAlgebra.Basic
import Mathlib.RingTheory.Jacobson.Ring
import Mathlib.RingTheory.Noetherian.Defs

/-!
# Restricted power series: representative interfaces

`README.md` is the mathematical specification. These signatures illustrate its generality and
normalisations; they are not an exhaustive implementation checklist. The theorem proofs are
deliberately admitted roadmap targets. Definitions have mathematical bodies, and no admitted
instances enter typeclass search.

The native restricted subrings and their Gauss-norm structures are imported from the pinned
Mathlib/Tau Ceti dependencies. Existing multiplicativity, radius restriction and one-variable
noetherianity are applied below with proofs, not restated as admitted targets. The genuinely new
Banach-ring predicates live in this roadmap namespace only for prototyping. Production code
extends the common library and does not import this file.
-/

namespace TauCetiRoadmap.RestrictedPowerSeries

noncomputable section

open PowerSeries

section Coefficients

variable {R S : Type*} [NormedCommRing R] [NormedCommRing S]

/-- Coefficient maps need a uniform norm bound (§0.2). -/
theorem isRestricted_map (φ : R →+* S) {C r : ℝ} (hC : 0 ≤ C)
    (hφ : ∀ a, ‖φ a‖ ≤ C * ‖a‖) (hr : 0 < r)
    {f : PowerSeries R} (hf : f.IsRestricted r) :
    (PowerSeries.map φ f).IsRestricted r := by
  sorry

/-- Radius restriction is coefficientwise the identity (§1.2). -/
theorem isRestricted_of_radius_le {r s : ℝ} (hr : 0 < r) (hrs : r ≤ s)
    {f : PowerSeries R} (hf : f.IsRestricted s) : f.IsRestricted r := by
  exact TauCeti.PowerSeries.isRestricted_of_abs_le hf
    (by simpa [abs_of_pos hr, abs_of_pos (hr.trans_le hrs)] using hrs)

/-- The associated map is contractive; restrictedness excludes the junk supremum (§1.2). -/
theorem gaussNorm_le_of_radius_le {r s : ℝ} (hr : 0 < r) (hrs : r ≤ s)
    {f : PowerSeries R} (hf : f.IsRestricted s) :
    gaussNorm norm r f ≤ gaussNorm norm s f := by
  sorry

end Coefficients

section Multivariate

variable {R σ : Type*} [NormedCommRing R] [IsUltrametricDist R]

/-- Consume the existing Tau Ceti multiplicativity theorem on the native carrier (§1.1).
The general Banach-ring division theorems below do not assume `NormMulClass R`. -/
theorem mv_gaussNorm_mul [NormMulClass R] (r : σ → ℝ) (hr : ∀ i, 0 < r i)
    (f g : MvPowerSeries.IsRestricted.subring (R := R) r) :
    MvPowerSeries.gaussNorm norm r ((f * g : MvPowerSeries.IsRestricted.subring r) :
      MvPowerSeries σ R) =
      MvPowerSeries.gaussNorm norm r (f : MvPowerSeries σ R) *
      MvPowerSeries.gaussNorm norm r (g : MvPowerSeries σ R) := by
  let : ∀ i, Fact (0 < r i) := fun i ↦ ⟨hr i⟩
  exact f.2.gaussNorm_mul g.2

end Multivariate

section Evaluation

variable {R B : Type*} [NormedCommRing R] [IsUltrametricDist R]
    [NormedCommRing B] [IsUltrametricDist B] [CompleteSpace B]

/-- Evaluation is a convergent sum, not formal substitution (§2.1). -/
def eval₂ (φ : R →+* B) (f : PowerSeries R) (b : B) : B :=
  ∑' n : ℕ, φ (coeff n f) * b ^ n

/-- The definition has its intended summation meaning at the closed boundary as well. -/
theorem hasSum_eval₂ (φ : R →+* B) {C r : ℝ} (hC : 0 ≤ C)
    (hφ : ∀ a, ‖φ a‖ ≤ C * ‖a‖) (hr : 0 < r)
    {f : PowerSeries R} (hf : f.IsRestricted r) {b : B} (hb : ‖b‖ ≤ r) :
    HasSum (fun n : ℕ ↦ φ (coeff n f) * b ^ n) (eval₂ φ f b) := by
  sorry

/-- A bounded coefficient map gives its actual bound, not an automatic isometry. -/
theorem norm_eval₂_le (φ : R →+* B) {C r : ℝ} (hC : 0 ≤ C)
    (hφ : ∀ a, ‖φ a‖ ≤ C * ‖a‖) (hr : 0 < r)
    {f : PowerSeries R} (hf : f.IsRestricted r) {b : B} (hb : ‖b‖ ≤ r) :
    ‖eval₂ φ f b‖ ≤ C * gaussNorm norm r f := by
  sorry

end Evaluation

/-- Hasse derivatives are defined over semirings, including noncommutative coefficients (§2.3). -/
def hasseDeriv {R : Type*} [Semiring R] (k : ℕ) (f : PowerSeries R) : PowerSeries R :=
  PowerSeries.mk fun n ↦ (n + k).choose k • coeff (n + k) f

section AnalyticSubstitution

variable {R : Type*} [NormedCommRing R] [IsUltrametricDist R] [CompleteSpace R]

/-- The coefficient formula for analytic substitution (§2.2).
Its convergence and restrictedness require the bounds in the next theorem. -/
def analyticSubst (f g : PowerSeries R) : PowerSeries R :=
  PowerSeries.mk fun j ↦ ∑' n : ℕ, coeff n f * coeff j (g ^ n)

/-- The inner constant coefficient need not vanish. -/
theorem analyticSubst_isRestricted {r s : ℝ} (hr : 0 < r) (hs : 0 < s)
    {f g : PowerSeries R} (hf : f.IsRestricted r) (hg : g.IsRestricted s)
    (hgr : gaussNorm norm s g ≤ r) :
    (analyticSubst f g).IsRestricted s ∧
      gaussNorm norm s (analyticSubst f g) ≤ gaussNorm norm r f := by
  sorry

theorem hasseDeriv_isRestricted {r : ℝ} (hr : 0 < r)
    {f : PowerSeries R} (hf : f.IsRestricted r) (k : ℕ) :
    (hasseDeriv k f).IsRestricted r ∧
      gaussNorm norm r (hasseDeriv k f) ≤ r⁻¹ ^ k * gaussNorm norm r f := by
  sorry

end AnalyticSubstitution

section Weierstrass

variable {R : Type*} [NormedCommRing R]

/-- Martin's multiplicative units (§3.1); invertibility alone is insufficient. -/
def IsNormMulUnit (u : R) : Prop :=
  IsUnit u ∧ ∀ a : R, ‖u * a‖ = ‖u‖ * ‖a‖

/-- Distinguishedness at a specified radius and degree (§4.1).
Restrictedness and positivity of the radius are separate hypotheses of the theorems. -/
def IsMulDistinguished (r : ℝ) (g : PowerSeries R) (s : ℕ) : Prop :=
  IsNormMulUnit (coeff s g) ∧ TauCeti.PowerSeries.IsDistinguished r s g

/-- The Banach-ring predicate retains the native distinguishedness API (§4.3). -/
theorem IsMulDistinguished.toIsDistinguished {r : ℝ} {g : PowerSeries R} {s : ℕ}
    (h : IsMulDistinguished r g s) : TauCeti.PowerSeries.IsDistinguished r s g :=
  h.2

/-- With a multiplicative coefficient norm, the extra condition is exactly that the
native distinguished coefficient is a unit (§4.3). -/
theorem isMulDistinguished_iff [NormMulClass R] {r : ℝ} {g : PowerSeries R} {s : ℕ} :
    IsMulDistinguished r g s ↔
      IsUnit (coeff s g) ∧ TauCeti.PowerSeries.IsDistinguished r s g := by
  constructor
  · intro h
    exact ⟨h.1.1, h.2⟩
  · rintro ⟨hu, hg⟩
    exact ⟨⟨hu, fun a ↦ norm_mul _ _⟩, hg⟩

variable [IsUltrametricDist R] [NormOneClass R] [CompleteSpace R]

/-- Division at every positive real radius over a general ultrametric Banach ring (§4.2).
`degree`, rather than `natDegree`, handles zero remainders and distinguished degree zero. -/
theorem weierstrassDivision_unique {r : ℝ} (hr : 0 < r)
    {g : PowerSeries R} (hg : g.IsRestricted r) {s : ℕ}
    (hgs : IsMulDistinguished r g s) (f : PowerSeries R) (hf : f.IsRestricted r) :
    ∃! qb : PowerSeries R × Polynomial R,
      qb.1.IsRestricted r ∧ qb.2.degree < s ∧
      f = g * qb.1 + qb.2.toPowerSeries ∧
      gaussNorm norm r f =
        max (gaussNorm norm r g * gaussNorm norm r qb.1)
          (gaussNorm norm r qb.2.toPowerSeries) := by
  sorry

/-- The normalised preparation polynomial and multiplicative unit are unique (§4.3). -/
theorem weierstrassPreparation_unique {r : ℝ} [Fact (0 < r)]
    {g : PowerSeries R} (hg : g.IsRestricted r) {s : ℕ}
    (hgs : IsMulDistinguished r g s) :
    ∃! we : Polynomial R × PowerSeries.IsRestricted.subring (R := R) r,
      we.1.Monic ∧ we.1.degree = s ∧ gaussNorm norm r we.1.toPowerSeries = r ^ s ∧
      IsNormMulUnit we.2 ∧ g = (we.2 : PowerSeries R) * we.1.toPowerSeries := by
  sorry

end Weierstrass

section RadiusConditions

variable {R : Type*} [NormedCommRing R]

/-- Analytic on an open disc (§7.1), using native restrictedness at each smaller radius. -/
def OnOpenDisc (R₀ : ℝ) (f : PowerSeries R) : Prop :=
  ∀ r : ℝ, 0 < r → r < R₀ → f.IsRestricted r

/-- Entire means restricted at every positive radius (§7.2). -/
def IsEntire (f : PowerSeries R) : Prop :=
  ∀ r : ℝ, 0 < r → f.IsRestricted r

/-- Overconvergent on the unit polydisc (§7.3), on the native multivariate carrier. -/
def IsOverconvergent {σ : Type*} (f : MvPowerSeries σ R) : Prop :=
  ∃ ρ : ℝ, 1 < ρ ∧ MvPowerSeries.IsRestricted (fun _ ↦ ρ) f

variable [IsUltrametricDist R] [NormOneClass R] [CompleteSpace R]

/-- Entireness is part of the conclusion and uniqueness domain; formal division is different.
The leading coefficient need only be a unit. Normalise to a monic polynomial before applying
the Banach-ring theorem at large radii (§7.2). -/
theorem entire_division_unique (P : Polynomial R) (hP : IsUnit P.leadingCoeff)
    (F : PowerSeries R) (hF : IsEntire F) :
    ∃! QB : PowerSeries R × Polynomial R,
      IsEntire QB.1 ∧ QB.2.degree < P.degree ∧
      F = P.toPowerSeries * QB.1 + QB.2.toPowerSeries := by
  sorry

end RadiusConditions

section TateAlgebra

variable (K : Type*) [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- Consume the existing one-variable theorem; general Tate noetherianity is an AdicSpaces
supplier contract, not a second admitted implementation here (§5.2). -/
example {r : ℝ} (hr : 0 < r) :
    IsNoetherianRing (PowerSeries.IsRestricted.subring (R := K) r) :=
  TauCeti.PowerSeries.isNoetherianRing_isRestricted_subring hr

/-- The field-algebra API has no discreteness or characteristic-zero restriction (§5.2). -/
theorem tate_isJacobsonRing (n : ℕ) :
    IsJacobsonRing (MvPowerSeries.IsRestricted.subring (R := K) (fun _ : Fin n ↦ (1 : ℝ))) := by
  sorry

end TateAlgebra

end

end TauCetiRoadmap.RestrictedPowerSeries
