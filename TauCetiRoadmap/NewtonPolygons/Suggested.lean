import Mathlib.Analysis.Convex.Function
import Mathlib.Algebra.Order.WithTop.Untop0
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Data.EReal.Operations
import Mathlib.Algebra.Polynomial.Splits
import Mathlib.RingTheory.PowerSeries.GaussNorm
import Mathlib.RingTheory.PowerSeries.Restricted
import Mathlib.RingTheory.PowerSeries.WeierstrassPreparation
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.Topology.Algebra.Valued.NormedValued
import Mathlib.NumberTheory.Padics.PadicNumbers
import TauCeti.RingTheory.PowerSeries.Weierstrass.Preparation

/-!
# Newton polygons: representative interfaces

`README.md` is the definitive specification. The signatures here are representative suggested
interfaces, not an exhaustive checklist. Definitions have mathematical bodies; `sorry` marks
unproved roadmap targets. This file installs no admitted instances. It uses the native
restricted-series and distinguishedness interfaces and consumes Tau Ceti's preparation theorem.

The generic geometry uses `lowerConvexEnvelope`, with coefficient-free height and slope-data
interfaces. `seriesNewtonPolygon` and `polynomialNewtonPolygon` are the arithmetic wrappers;
production names belong in the native power-series and polynomial namespaces. The interpolation
and comparison targets retain the distinction between a convex sequence and coefficient bounds.

The main design checks are finite edges rather than sentinel slopes; absolute face endpoints;
first and last active coefficients at a restricted radius; an intrinsic radius in `ℝ≥0∞`; and
the distinction between formal DVR preparation and closed-disc preparation. The final section
gives the complete-DVR preparation interface consumed by PadicMeasuresIwasawaAlgebras and the
ramified quadratic check. Candidate sources and design comparisons are cited in the README.
-/

namespace TauCetiRoadmap.NewtonPolygons

noncomputable section

open scoped Classical NNReal ENNReal

/-! ## Convex geometry -/

/-- Only these indices represent actual unit edges (§0.1). -/
def finiteEdges (h : ℕ → WithTop ℝ) : Set ℕ :=
  {n | h n ≠ ⊤ ∧ h (n + 1) ≠ ⊤}

/-- Its value off `finiteEdges h` is not used as a slope. -/
def unitSlope (h : ℕ → WithTop ℝ) (n : ℕ) : ℝ :=
  (h (n + 1)).untop₀ - (h n).untop₀

structure IsConvexSeq (h : ℕ → WithTop ℝ) : Prop where
  ordConnected : {n | h n ≠ ⊤}.OrdConnected
  monotoneOn : MonotoneOn (unitSlope h) (finiteEdges h)

/-- The object is independent of any coefficient sequence or construction algorithm (§0.1).
The subtype inherits pointwise equality and order from height functions. -/
abbrev ConvexPolygon := {h : ℕ → WithTop ℝ // IsConvexSeq h}

/-- Outside-domain values participate in the order. Equal domains/endpoints are extra hypotheses. -/
def IsBelow (h g : ℕ → WithTop ℝ) : Prop := h ≤ g

theorem IsBelow.refl (h : ℕ → WithTop ℝ) : IsBelow h h := le_refl h

theorem IsBelow.trans {h g k : ℕ → WithTop ℝ}
    (hhg : IsBelow h g) (hgk : IsBelow g k) : IsBelow h k := le_trans hhg hgk

theorem IsBelow.antisymm {h g : ℕ → WithTop ℝ}
    (hhg : IsBelow h g) (hgh : IsBelow g h) : h = g := le_antisymm hhg hgh

/-- Canonical interpolation; its convexity is asserted only on the specified real domain. -/
def linearInterpolate (h : ℕ → ℝ) (x : ℝ) : ℝ :=
  let n := ⌊x⌋₊
  h n + (x - n) * (h (n + 1) - h n)

theorem linearInterpolate_nat (h : ℕ → ℝ) (n : ℕ) :
    linearInterpolate h n = h n := by
  simp [linearInterpolate]

/-- Interpolate real heights on the finite domain, not the set of integer points (§0.1). -/
theorem isConvexSeq_iff_convexOn_interpolate_Icc {h : ℕ → WithTop ℝ} {l u : ℕ}
    (hlu : l ≤ u) (hdom : ∀ n, h n ≠ ⊤ ↔ l ≤ n ∧ n ≤ u) :
    IsConvexSeq h ↔
      ConvexOn ℝ (Set.Icc (l : ℝ) (u : ℝ))
        (linearInterpolate fun n ↦ (h n).untop₀) := by
  sorry

theorem isConvexSeq_iff_convexOn_interpolate_Ici {h : ℕ → WithTop ℝ} {l : ℕ}
    (hdom : ∀ n, h n ≠ ⊤ ↔ l ≤ n) :
    IsConvexSeq h ↔
      ConvexOn ℝ (Set.Ici (l : ℝ)) (linearInterpolate fun n ↦ (h n).untop₀) := by
  sorry

/-- The existence condition includes the empty point set. -/
def IsAdmissible (a : ℕ → WithTop ℝ) : Prop :=
  ∃ c m : ℝ, ∀ n : ℕ, ((c + m * n : ℝ) : WithTop ℝ) ≤ a n

/-- On `ℕ`, even a shifted or finite convex domain has an affine lower bound (§0.1). -/
theorem IsConvexSeq.isAdmissible {h : ℕ → WithTop ℝ} (hh : IsConvexSeq h) :
    IsAdmissible h := by
  sorry

structure IsLowerConvexEnvelope (a h : ℕ → WithTop ℝ) : Prop where
  convex : IsConvexSeq h
  le_points : ∀ n, h n ≤ a n
  greatest : ∀ g, IsConvexSeq g → (∀ n, g n ≤ a n) → ∀ n, g n ≤ h n

theorem IsLowerConvexEnvelope.unique {a h g : ℕ → WithTop ℝ}
    (hh : IsLowerConvexEnvelope a h) (hg : IsLowerConvexEnvelope a g) : h = g :=
  funext fun n ↦ le_antisymm (hg.greatest h hh.convex hh.le_points n)
    (hh.greatest g hg.convex hg.le_points n)

/-- The conditional supremum of the convex minorants; explicit fallback in the vertical case. -/
def lowerConvexEnvelope (a : ℕ → WithTop ℝ) (n : ℕ) : WithTop ℝ :=
  if ∃ h, IsConvexSeq h ∧ ∀ k, h k ≤ a k then
    ⨆ h : {h : ℕ → WithTop ℝ // IsConvexSeq h ∧ ∀ k, h k ≤ a k}, h.1 n
  else ⊤

theorem isLowerConvexEnvelope_lowerConvexEnvelope {a : ℕ → WithTop ℝ}
    (ha : IsAdmissible a) : IsLowerConvexEnvelope a (lowerConvexEnvelope a) := by
  sorry

/-- The geometric implication used by Hodge lower bounds (§0.7). -/
theorem le_lowerConvexEnvelope {a h : ℕ → WithTop ℝ} (ha : IsAdmissible a)
    (hh : IsConvexSeq h) (hbound : h ≤ a) : IsBelow h (lowerConvexEnvelope a) :=
  (isLowerConvexEnvelope_lowerConvexEnvelope ha).greatest h hh hbound

theorem lowerConvexEnvelope_mono {a b : ℕ → WithTop ℝ}
    (ha : IsAdmissible a) (hb : IsAdmissible b) (hab : a ≤ b) :
    IsBelow (lowerConvexEnvelope a) (lowerConvexEnvelope b) :=
  le_lowerConvexEnvelope hb (isLowerConvexEnvelope_lowerConvexEnvelope ha).convex
    (le_trans (isLowerConvexEnvelope_lowerConvexEnvelope ha).le_points hab)

theorem lowerConvexEnvelope_eq_self {h : ℕ → WithTop ℝ}
    (ha : IsAdmissible h) (hh : IsConvexSeq h) : lowerConvexEnvelope h = h :=
  le_antisymm (isLowerConvexEnvelope_lowerConvexEnvelope ha).le_points
    (le_lowerConvexEnvelope ha hh le_rfl)

/-! ## Slope data independent of coefficients (§0.6) -/

namespace ConvexPolygon

/-- Unit slopes record multiplicity canonically. Length zero is a singleton, not the empty
polygon: `Fin 0` has no slope entries, and every actual edge has width one.
The slope group excludes extended-real sentinels. Repeated unit slopes can be compressed
into positive segment lengths. -/
structure FiniteSlopeData (Γ : Type*) [AddCommGroup Γ] [LinearOrder Γ]
    [IsOrderedAddMonoid Γ] where
  start : ℕ
  initialHeight : Γ
  length : ℕ
  slope : Fin length → Γ
  monotone : Monotone slope

/-- Cumulative sums need only ordered additive data; both rational and real inputs are allowed. -/
def FiniteSlopeData.heights {Γ : Type*} [AddCommGroup Γ] [LinearOrder Γ]
    [IsOrderedAddMonoid Γ]
    (d : FiniteSlopeData Γ) (n : ℕ) : WithTop Γ :=
  if d.start ≤ n ∧ n ≤ d.start + d.length then
    ↑(d.initialHeight + ∑ i : Fin d.length, if (i : ℕ) < n - d.start then d.slope i else 0)
  else ⊤

theorem FiniteSlopeData.isConvexSeq_heights (d : FiniteSlopeData ℝ) :
    IsConvexSeq d.heights := by
  sorry

def FiniteSlopeData.toPolygon (d : FiniteSlopeData ℝ) : ConvexPolygon :=
  ⟨d.heights, d.isConvexSeq_heights⟩

/-- Slope data reconstructs a convex height sequence whose envelope is itself. -/
theorem FiniteSlopeData.lowerConvexEnvelope_heights (d : FiniteSlopeData ℝ) :
    lowerConvexEnvelope d.heights = d.heights :=
  lowerConvexEnvelope_eq_self d.isConvexSeq_heights.isAdmissible d.isConvexSeq_heights

theorem FiniteSlopeData.unitSlope_heights (d : FiniteSlopeData ℝ) (i : Fin d.length) :
    unitSlope d.heights (d.start + i) = d.slope i := by
  sorry

/-- Extraction on a specified nonempty finite domain; the equality asserts reconstruction.
Uniqueness includes the anchor and length, not just the list of slopes. -/
theorem existsUnique_finiteSlopeData {h : ℕ → WithTop ℝ} (hh : IsConvexSeq h)
    (l d : ℕ) (hdom : ∀ n, h n ≠ ⊤ ↔ l ≤ n ∧ n ≤ l + d) :
    ∃! s : FiniteSlopeData ℝ, s.heights = h := by
  sorry

/-- Extract finite slope data from an admissible envelope with nonempty bounded domain.
This recovers the envelope, not the original coefficient heights. -/
theorem existsUnique_finiteSlopeData_lowerConvexEnvelope {a : ℕ → WithTop ℝ}
    (ha : IsAdmissible a) (l d : ℕ)
    (hdom : ∀ n, lowerConvexEnvelope a n ≠ ⊤ ↔ l ≤ n ∧ n ≤ l + d) :
    ∃! s : FiniteSlopeData ℝ, s.heights = lowerConvexEnvelope a :=
  existsUnique_finiteSlopeData (isLowerConvexEnvelope_lowerConvexEnvelope ha).convex l d hdom

theorem FiniteSlopeData.heights_injective :
    Function.Injective (FiniteSlopeData.heights (Γ := ℝ)) := by
  sorry

/-- Partial sums give the dominance criterion; individual slopes need not compare (§0.7). -/
theorem FiniteSlopeData.isBelow_iff_partialSums (d e : FiniteSlopeData ℝ)
    (hstart : d.start = e.start) (hlen : d.length = e.length)
    (hheight : d.initialHeight = e.initialHeight) :
    IsBelow d.heights e.heights ↔ ∀ k ≤ d.length,
      (∑ i : Fin d.length, if (i : ℕ) < k then d.slope i else 0) ≤
        ∑ i : Fin e.length, if (i : ℕ) < k then e.slope i else 0 := by
  sorry

/-- Includes terminal rays (eventually constant finite slopes) and infinitely many breaks.
All edges have width one; no infinite segment length or slope sentinel is stored. -/
structure InfiniteSlopeData (Γ : Type*) [AddCommGroup Γ] [LinearOrder Γ]
    [IsOrderedAddMonoid Γ] where
  start : ℕ
  initialHeight : Γ
  slope : ℕ → Γ
  monotone : Monotone slope

def InfiniteSlopeData.heights {Γ : Type*} [AddCommGroup Γ] [LinearOrder Γ]
    [IsOrderedAddMonoid Γ]
    (d : InfiniteSlopeData Γ) (n : ℕ) : WithTop Γ :=
  if d.start ≤ n then ↑(d.initialHeight + ∑ i ∈ Finset.range (n - d.start), d.slope i)
  else ⊤

theorem InfiniteSlopeData.isConvexSeq_heights (d : InfiniteSlopeData ℝ) :
    IsConvexSeq d.heights := by
  sorry

def InfiniteSlopeData.toPolygon (d : InfiniteSlopeData ℝ) : ConvexPolygon :=
  ⟨d.heights, d.isConvexSeq_heights⟩

theorem InfiniteSlopeData.lowerConvexEnvelope_heights (d : InfiniteSlopeData ℝ) :
    lowerConvexEnvelope d.heights = d.heights :=
  lowerConvexEnvelope_eq_self d.isConvexSeq_heights.isAdmissible d.isConvexSeq_heights

theorem InfiniteSlopeData.unitSlope_heights (d : InfiniteSlopeData ℝ) (i : ℕ) :
    unitSlope d.heights (d.start + i) = d.slope i := by
  sorry

theorem existsUnique_infiniteSlopeData {h : ℕ → WithTop ℝ} (hh : IsConvexSeq h)
    (l : ℕ) (hdom : ∀ n, h n ≠ ⊤ ↔ l ≤ n) :
    ∃! s : InfiniteSlopeData ℝ, s.heights = h := by
  sorry

/-- The unbounded-domain envelope conversion, including terminal rays. -/
theorem existsUnique_infiniteSlopeData_lowerConvexEnvelope {a : ℕ → WithTop ℝ}
    (ha : IsAdmissible a) (l : ℕ)
    (hdom : ∀ n, lowerConvexEnvelope a n ≠ ⊤ ↔ l ≤ n) :
    ∃! s : InfiniteSlopeData ℝ, s.heights = lowerConvexEnvelope a :=
  existsUnique_infiniteSlopeData (isLowerConvexEnvelope_lowerConvexEnvelope ha).convex l hdom

end ConvexPolygon

def toEReal (x : WithTop ℝ) : EReal := WithBot.some x

/-- Supporting values may be `-∞`, although a proper polygon's heights are never `-∞`. -/
def supportValue (h : ℕ → WithTop ℝ) (σ : ℝ) : EReal :=
  ⨅ n : ℕ, toEReal (h n) - ((σ * n : ℝ) : EReal)

/-- A finite geometric face, with absolute endpoints and its full contact interval (§0.3). -/
def IsFiniteFace (h : ℕ → WithTop ℝ) (σ : ℝ) (l u : ℕ) : Prop :=
  l ≤ u ∧ ∃ c : ℝ,
    (∀ n : ℕ, ((c + σ * n : ℝ) : WithTop ℝ) ≤ h n) ∧
    ∀ n : ℕ, h n = ((c + σ * n : ℝ) : WithTop ℝ) ↔ l ≤ n ∧ n ≤ u

def minkowski (h g : ℕ → WithTop ℝ) (n : ℕ) : WithTop ℝ :=
  (Finset.range (n + 1)).inf fun i ↦ h i + g (n - i)

/-! ## Coefficients and normalisation -/

section Valuations

variable {K : Type*} [NormedField K]
variable {Γ : Type*} [AddCommGroup Γ] [LinearOrder Γ] [IsOrderedAddMonoid Γ]

/-- Compatibility is data about the chosen valuation, embedding and base, not a hidden instance. -/
structure IsNormAddVal (v : AddValuation K (WithTop Γ)) (e : Γ →+ ℝ) (b : ℝ) : Prop where
  one_lt : 1 < b
  strictMono : StrictMono e
  norm_eq : ∀ x : K, x ≠ 0 → ∃ γ : Γ, v x = (γ : WithTop Γ) ∧ ‖x‖ = b ^ (-e γ)

def coeffVal (v : AddValuation K (WithTop Γ)) (e : Γ →+ ℝ)
    (f : PowerSeries K) (n : ℕ) : WithTop ℝ :=
  WithTop.map e (v (PowerSeries.coeff n f))

def seriesNewtonPolygon (v : AddValuation K (WithTop Γ)) (e : Γ →+ ℝ)
    (f : PowerSeries K) : ℕ → WithTop ℝ :=
  lowerConvexEnvelope (coeffVal v e f)

def polynomialNewtonPolygon (v : AddValuation K (WithTop Γ)) (e : Γ →+ ℝ)
    (f : Polynomial K) : ℕ → WithTop ℝ :=
  seriesNewtonPolygon v e f.toPowerSeries

/-- The arithmetic specialisation of the generic geometric specification. -/
abbrev IsNewtonPolygonOf (v : AddValuation K (WithTop Γ)) (e : Γ →+ ℝ)
    (f : PowerSeries K) (h : ℕ → WithTop ℝ) : Prop :=
  IsLowerConvexEnvelope (coeffVal v e f) h

/-- Coefficient bounds are essential; the polygon alone does not supply Hodge data (§2.5). -/
theorem isBelow_seriesNewtonPolygon_of_coeff_bound
    {v : AddValuation K (WithTop Γ)} {e : Γ →+ ℝ} {f : PowerSeries K}
    {H : ℕ → WithTop ℝ} (ha : IsAdmissible (coeffVal v e f))
    (hH : IsConvexSeq H) (hbound : ∀ n, H n ≤ coeffVal v e f n) :
    IsBelow H (seriesNewtonPolygon v e f) :=
  le_lowerConvexEnvelope ha hH hbound

/-- Ordered weights give a Hodge lower polygon when their partial sums bound coefficients.
The finite-domain analogue uses `FiniteSlopeData` and the same comparison theorem. -/
theorem slopeData_isBelow_seriesNewtonPolygon
    {v : AddValuation K (WithTop Γ)} {e : Γ →+ ℝ} {f : PowerSeries K}
    (s : ConvexPolygon.InfiniteSlopeData ℝ) (ha : IsAdmissible (coeffVal v e f))
    (hbound : ∀ n, s.heights n ≤ coeffVal v e f n) :
    IsBelow s.heights (seriesNewtonPolygon v e f) :=
  isBelow_seriesNewtonPolygon_of_coeff_bound ha s.isConvexSeq_heights hbound

/-- Zero has no finite slopes; a nonzero input contributes exactly `degree - order` slopes. -/
def polynomialSlopes (v : AddValuation K (WithTop Γ)) (e : Γ →+ ℝ)
    (f : Polynomial K) : Multiset ℝ :=
  let a := f.toPowerSeries.order.toNat
  (Multiset.range (f.natDegree - a)).map fun j ↦
    unitSlope (polynomialNewtonPolygon v e f) (a + j)

end Valuations

section ActiveIndices

variable {K : Type*} [NormedField K]

/-- A specification of the first and last norm-attaining coefficient indices (§2.3).
The existence theorem carries nonzeroness and restrictedness. -/
structure HasGaussExtrema (r : ℝ) (f : PowerSeries K) (l u : ℕ) : Prop where
  left_le_right : l ≤ u
  left_eq : ‖PowerSeries.coeff l f‖ * r ^ l = PowerSeries.gaussNorm norm r f
  right_eq : ‖PowerSeries.coeff u f‖ * r ^ u = PowerSeries.gaussNorm norm r f
  bounds : ∀ n, ‖PowerSeries.coeff n f‖ * r ^ n = PowerSeries.gaussNorm norm r f →
    l ≤ n ∧ n ≤ u

/-- The right active index is the existing distinguished degree (§2.3), not a new
notion of distinguishedness. Restrictedness supplies the bound on every coefficient. -/
theorem HasGaussExtrema.isDistinguished {r : ℝ} {f : PowerSeries K}
    (hf : f.IsRestricted r) {l u : ℕ} (hi : HasGaussExtrema r f l u) :
    TauCeti.PowerSeries.IsDistinguished r u f := by
  refine ⟨hi.right_eq, ?_⟩
  intro n hun
  have hle := PowerSeries.le_gaussNorm norm r f
    (TauCeti.PowerSeries.hasGaussNorm_of_isRestricted hf) n
  apply lt_of_not_ge
  intro hge
  exact (not_le_of_gt hun) (hi.bounds n (le_antisymm hle hge)).2

theorem exists_gaussExtrema {r : ℝ} (hr : 0 < r) {f : PowerSeries K}
    (hf : f.IsRestricted r) (hf0 : f ≠ 0) : ∃ l u, HasGaussExtrema r f l u := by
  sorry

variable [IsUltrametricDist K]

/-- Valid at every common restricted radius, including a boundary (§3.1). -/
theorem gaussExtrema_mul {r : ℝ} (hr : 0 < r) {f g : PowerSeries K}
    (hf : f.IsRestricted r) (hg : g.IsRestricted r) (hf0 : f ≠ 0) (hg0 : g ≠ 0)
    {lf uf lg ug : ℕ} (hfi : HasGaussExtrema r f lf uf) (hgi : HasGaussExtrema r g lg ug) :
    HasGaussExtrema r (f * g) (lf + lg) (uf + ug) := by
  sorry

/-- The strictly larger restricted radius is what permits a finite geometric face (§2.3). -/
theorem finiteFace_of_gaussExtrema
    {Γ : Type*} [AddCommGroup Γ] [LinearOrder Γ] [IsOrderedAddMonoid Γ]
    {v : AddValuation K (WithTop Γ)} {e : Γ →+ ℝ} {b r s : ℝ}
    (hv : IsNormAddVal v e b) (hr : 0 < r) (hrs : r < s)
    {f : PowerSeries K} (hf : f.IsRestricted s) (hf0 : f ≠ 0)
    {l u : ℕ} (hi : HasGaussExtrema r f l u) :
    IsFiniteFace (seriesNewtonPolygon v e f) (Real.logb b r) l u := by
  sorry

end ActiveIndices

/-! ## Polynomial roots -/

section Roots

variable {K L : Type*} [NormedField K] [IsUltrametricDist K]
    [NormedField L] [IsUltrametricDist L] [Algebra K L]
variable {Γ : Type*} [AddCommGroup Γ] [LinearOrder Γ] [IsOrderedAddMonoid Γ]

/-- Finite slopes encode nonzero roots. A splitting extension suffices; completeness is not needed
for this algebraic theorem. The spectral-norm algebraic closure is a canonical specialisation. -/
theorem polynomialSlopes_eq_nonzero_roots
    {v : AddValuation K (WithTop Γ)} {e : Γ →+ ℝ} {b : ℝ}
    (hv : IsNormAddVal v e b) (w : AddValuation L (WithTop ℝ))
    (hw : IsNormAddVal w (AddMonoidHom.id ℝ) b)
    (hcomp : ∀ x : K, w (algebraMap K L x) = WithTop.map e (v x))
    (f : Polynomial K) (hf : f ≠ 0) (hsplit : (f.map (algebraMap K L)).Splits) :
    polynomialSlopes v e f =
      (((f.map (algebraMap K L)).roots).filter fun x ↦ x ≠ 0).map
        (fun x ↦ -(w x).untop₀) := by
  sorry

end Roots

/-! ## Disc factors and intrinsic radius -/

section Analysis

variable {K : Type*} [NormedField K] [IsUltrametricDist K]

/-- The coefficient radius is independent of the norms realised by points of an extension (§5.1). -/
def radiusOfConvergence (f : PowerSeries K) : ℝ≥0∞ :=
  ⨆ (r : ℝ≥0) (_ : f.IsRestricted (r : ℝ)), (r : ℝ≥0∞)

theorem isRestricted_of_lt_radius {f : PowerSeries K} {r : ℝ} (hr : 0 < r)
    (hrf : ENNReal.ofReal r < radiusOfConvergence f) : f.IsRestricted r := by
  sorry

theorem radius_polynomial (P : Polynomial K) : radiusOfConvergence P.toPowerSeries = ⊤ := by
  sorry

variable [CompleteSpace K]

/-- The monic disc factor (§4.1) is supplied by native Weierstrass preparation once
§2.3 identifies the active degree. This bridge has a proof, not an admitted copy of the supplier. -/
theorem HasGaussExtrema.existsUnique_discFactor {r : ℝ} (hr : 0 < r)
    {f : PowerSeries K} (hf : f.IsRestricted r) {l d : ℕ}
    (hi : HasGaussExtrema r f l d) :
    ∃! p : PowerSeries.IsRestricted.subring (R := K) r × Polynomial K,
      IsUnit p.1 ∧ p.2.IsMonicOfDegree d ∧
        (p.1 : PowerSeries K) * p.2.toPowerSeries = f := by
  have hd := hi.isDistinguished hf
  exact hd.existsUnique_isUnit_isMonicOfDegree_mul_eq hd.coeff_ne_zero.isUnit hr hf

/-- A unique constant-one disc factor, with the complete conditions retained (§4.1).
`degree = d` handles the nonzero constant case without a spurious degree-zero remainder issue. -/
theorem discFactor_unique {r : ℝ} (hr : 0 < r) {f : PowerSeries K}
    (hf : f.IsRestricted r) (hf1 : PowerSeries.coeff 0 f = 1)
    {l d : ℕ} (hi : HasGaussExtrema r f l d) :
    ∃! PU : Polynomial K × PowerSeries K,
      PU.1.degree = d ∧ PU.1.coeff 0 = 1 ∧ PowerSeries.coeff 0 PU.2 = 1 ∧
      PU.2.IsRestricted r ∧ PowerSeries.gaussNorm norm r (PU.2 - 1) < 1 ∧
      f = PU.1.toPowerSeries * PU.2 := by
  sorry

/-- The polynomial surrogate for the exact open/closed/sphere counts (§4.3).
The analytic theorem additionally identifies its roots and multiplicities with those of `f`. -/
theorem discPolynomial_root_counts
    {L : Type*} [NormedField L] [IsUltrametricDist L] [Algebra K L]
    (hiso : ∀ a : K, ‖algebraMap K L a‖ = ‖a‖)
    {r : ℝ} (hr : 0 < r) (P : Polynomial K) (hP : P.Monic)
    (hPr : PowerSeries.gaussNorm norm r P.toPowerSeries = r ^ P.natDegree)
    {l : ℕ} (hi : HasGaussExtrema r P.toPowerSeries l P.natDegree)
    (hsplit : (P.map (algebraMap K L)).Splits) :
    (((P.map (algebraMap K L)).roots).filter fun x ↦ ‖x‖ < r).card = l ∧
    (((P.map (algebraMap K L)).roots).filter fun x ↦ ‖x‖ ≤ r).card = P.natDegree ∧
    (((P.map (algebraMap K L)).roots).filter fun x ↦ ‖x‖ = r).card = P.natDegree - l := by
  sorry

end Analysis

/-! ## Formal DVR preparation (§6.3) -/

section FormalDVR

variable {O : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]

/-- Coefficient content, using Mathlib's native DVR valuation. Zero has value infinity (§6.3). -/
def mu (f : PowerSeries O) : ℕ∞ :=
  ⨅ n : ℕ, IsDiscreteValuationRing.addVal O (PowerSeries.coeff n f)

/-- The least index attaining `mu`; subsequent theorems require `f ≠ 0`. -/
def lambda (f : PowerSeries O) : ℕ :=
  sInf {n : ℕ | IsDiscreteValuationRing.addVal O (PowerSeries.coeff n f) = mu f}

/-- The abstract complete-DVR form, with its μ and λ specifications. -/
theorem exists_pow_mul_distinguished_mul_unit_of_completeDVR
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (π : O) (hπ : Irreducible π) (f : PowerSeries O) (hf : f ≠ 0) :
    ∃ (m : ℕ) (P : Polynomial O) (u : (PowerSeries O)ˣ),
      mu f = (m : ℕ∞) ∧ P.natDegree = lambda f ∧
      P.IsDistinguishedAt (IsLocalRing.maximalIdeal O) ∧
      f = PowerSeries.C (π ^ m) * (u : PowerSeries O) * P.toPowerSeries := by
  sorry

/-- Formal additivity uses the residue-field series domain, with no unit-radius convergence. -/
theorem mu_lambda_mul (f g : PowerSeries O) (hf : f ≠ 0) (hg : g ≠ 0) :
    mu (f * g) = mu f + mu g ∧ lambda (f * g) = lambda f + lambda g := by
  sorry

end FormalDVR

local notation "𝒪[" K "]" => Valuation.integer (NormedField.valuation (K := K))

/-- The valuation-ring interface consumed by PadicMeasuresIwasawaAlgebras §4.3.
It is the specialisation of the stronger abstract-DVR theorem above. No finite residue field
or unit-radius restrictedness is assumed. -/
theorem exists_pow_mul_distinguished_mul_unit
    {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [IsDiscreteValuationRing 𝒪[K]]
    [IsAdicComplete (IsLocalRing.maximalIdeal 𝒪[K]) 𝒪[K]]
    (π : 𝒪[K]) (hπ : Irreducible π) (f : PowerSeries 𝒪[K]) (hf : f ≠ 0) :
    ∃ (m : ℕ) (P : Polynomial 𝒪[K]) (u : (PowerSeries 𝒪[K])ˣ),
      P.IsDistinguishedAt (IsLocalRing.maximalIdeal 𝒪[K]) ∧
      f = PowerSeries.C (π ^ m) * (u : PowerSeries 𝒪[K]) * (P : PowerSeries 𝒪[K]) := by
  obtain ⟨m, P, u, _, _, hP, hEq⟩ :=
    exists_pow_mul_distinguished_mul_unit_of_completeDVR π hπ f hf
  exact ⟨m, P, u, hP, hEq⟩

/-- The ramified quadratic reducibility check (§6.5), in a complete ultrametric `ℚ₂`-extension.
Over `ℚ₂` the same polynomial is Eisenstein; irreducibility is not preserved by base extension. -/
example {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [Algebra ℚ_[2] K] (i : 𝒪[K]) (hi : i ^ 2 = -1) :
    (Polynomial.X ^ 2 + Polynomial.C 2 * Polynomial.X + Polynomial.C 2 : Polynomial 𝒪[K]) =
      (Polynomial.X - Polynomial.C (i - 1)) *
        (Polynomial.X - Polynomial.C (-i - 1)) ∧
    ¬ Irreducible
      (Polynomial.X ^ 2 + Polynomial.C 2 * Polynomial.X + Polynomial.C 2 : Polynomial 𝒪[K]) := by
  sorry

end

end TauCetiRoadmap.NewtonPolygons
