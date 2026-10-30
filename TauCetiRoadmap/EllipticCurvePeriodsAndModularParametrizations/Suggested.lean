import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.MinimalModel.DiscriminantIdeal
import TauCeti.AlgebraicGeometry.EllipticCurve.MinimalModel.Reduced
import TauCeti.AlgebraicGeometry.EllipticCurve.MinimalModel.Semistable
import TauCeti.AlgebraicGeometry.EllipticCurve.GlobalMinimalModel
import TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.Regulator
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic

/-!
# Periods of elliptic curves and modular parametrizations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
definitions below have their real bodies, and the theorems are the headline statements about them,
with `sorry` proofs. The other targets — the multiplier of an isogeny (2.7), the period lattice of
a newform, optimality, the Manin constant, the modular degree, the congruence modulus and the
conjectures of Manin and Stevens (Layer 4), the BSD quotient and the analytic order of Ш (3.6) —
are specified, with their definitions and Checks, in `README.md` only.

The carrier is Mathlib's `WeierstrassCurve K` with `[W.IsElliptic]`, as in the elliptic-curves
roadmap; an invariant is a function of the equation, proved invariant under `VariableChange`.
The period lattice of a complex equation is a `Submodule ℤ ℂ` with `DiscreteTopology` and
`IsZLattice ℝ`, pinned by Mathlib's `PeriodPair.g₂ = c₄ / 12` and `PeriodPair.g₃ = c₆ / 216`
(`README.md`, *Pinned conventions*); its covolume is `ZLattice.covolume` for the Lebesgue measure
on `ℂ`. The `L`-series is Mathlib's `WeierstrassCurve.LSeries`, a `tsum` that is `0` outside its
half-plane; every analytic quantity is read from a continuation `(U, F)` with `U` **convex**
(`IsContinuation`), never from the `tsum`.

Conventions visible in the signatures: the local period at a real place is
`realComponentCount * leastPositiveRealPeriod` and at a complex place `2 * covolume` (the factor
`2` is part of the definition); the global period carries the prefactor
`(|N Δ| / N 𝔇)^(1/12)`; Tau Ceti's `regulator` is the Néron–Tate (non-normalised) regulator of
the BSD formula, and `normalisedRegulator` divides it by `[K : ℚ] ^ r`; Stevens' curve
`stevensCurve E` is presented as a reduced minimal model, so that it is a function of the isogeny
class; the Faltings height formulas use covolumes of the lattices of *any* equation with the
discriminant prefactor, in Faltings' normalisation.

`periodLattice` and `stevensCurve` are defined by description, through `Classical.epsilon`: each
is the object with the README's characterising property, whose existence is a theorem (1.1,
Stevens' theorem). Exceptions to "every proof is `sorry`": the instances on these two
definitions, `mem_scaleLattice` (unfolding) and `IsContinuation.eqOn_inter` (the identity theorem
of Mathlib, applied as the README's 3.3 promises).
-/

open WeierstrassCurve Complex NumberField

noncomputable section

namespace TauCetiRoadmap.EllipticCurvePeriodsAndModularParametrizations

/-! ## Layer 1: the period lattice of a complex Weierstrass equation -/

section Layer1

/-- Scaling a `ℤ`-submodule of `ℂ` by a complex number, `c • L = {c * z | z ∈ L}`
(`README.md`, Layer 1, 1.3). -/
def scaleLattice (c : ℂ) (L : Submodule ℤ ℂ) : Submodule ℤ ℂ :=
  L.map ((LinearMap.lsmul ℂ ℂ c).restrictScalars ℤ)

/-- Bridge check (unfolding): membership in a scaled lattice (`README.md`, Layer 1, 1.3). -/
theorem mem_scaleLattice {c z : ℂ} {L : Submodule ℤ ℂ} :
    z ∈ scaleLattice c L ↔ ∃ w ∈ L, c * w = z := by
  simp [scaleLattice, Submodule.mem_map]

/-- **1.1** The period lattice of an elliptic Weierstrass equation over `ℂ`: the lattice of the
unique `PeriodPair`-lattice with `g₂ = c₄ / 12`, `g₃ = c₆ / 216` (`README.md`, Layer 1, 1.1). -/
def periodLattice (W : WeierstrassCurve ℂ) [W.IsElliptic] : Submodule ℤ ℂ :=
  haveI : Nonempty PeriodPair := ⟨⟨1, I, by simpa using Complex.basisOneI.linearIndependent⟩⟩
  (Classical.epsilon fun L : PeriodPair ↦ L.g₂ = W.c₄ / 12 ∧ L.g₃ = W.c₆ / 216).lattice

variable (W : WeierstrassCurve ℂ) [W.IsElliptic]

/-- **1.1** The period lattice is discrete (`README.md`, Layer 1, 1.1). -/
instance : DiscreteTopology (periodLattice W) := by
  unfold periodLattice
  infer_instance

/-- **1.1** The period lattice is a full lattice in `ℂ = ℝ²` (`README.md`, Layer 1, 1.1). -/
instance : IsZLattice ℝ (periodLattice W) := by
  unfold periodLattice
  infer_instance

/-- **1.1** Existence of a period pair with the pinned invariants (`README.md`, Layer 1, 1.1). -/
theorem exists_periodPair_periodLattice :
    ∃ L : PeriodPair, L.lattice = periodLattice W ∧ L.g₂ = W.c₄ / 12 ∧ L.g₃ = W.c₆ / 216 := sorry

/-- **1.1** Uniqueness: any period pair with the pinned invariants has the period lattice
(`README.md`, Layer 1, 1.1). -/
theorem periodLattice_unique (L : PeriodPair) (h₂ : L.g₂ = W.c₄ / 12) (h₃ : L.g₃ = W.c₆ / 216) :
    L.lattice = periodLattice W := sorry

/-- **1.2** The lattice discriminant is the discriminant of the equation
(`README.md`, Layer 1, 1.2). -/
theorem Δ_periodLattice (L : PeriodPair) (hL : L.lattice = periodLattice W) :
    L.g₂ ^ 3 - 27 * L.g₃ ^ 2 = W.Δ := sorry

/-- **1.3** The scaling law `Λ(C • W) = u • Λ(W)` (`README.md`, Layer 1, 1.3). -/
theorem periodLattice_smul (C : VariableChange ℂ) :
    periodLattice (C • W) = scaleLattice (C.u : ℂ) (periodLattice W) := sorry

/-- **1.3** The covolume scales by `|u|²` (`README.md`, Layer 1, 1.3). -/
theorem covolume_periodLattice_smul (C : VariableChange ℂ) :
    ZLattice.covolume (periodLattice (C • W)) =
      ‖(C.u : ℂ)‖ ^ 2 * ZLattice.covolume (periodLattice W) := sorry

/-- **1.5** The lattice of the conjugate equation is the conjugate lattice
(`README.md`, Layer 1, 1.5). -/
theorem mem_periodLattice_conj (z : ℂ) :
    z ∈ periodLattice (W.map (starRingEnd ℂ)) ↔ (starRingEnd ℂ) z ∈ periodLattice W := sorry

/-- **1.5** The covolume does not see conjugation (`README.md`, Layer 1, 1.5). -/
theorem covolume_periodLattice_conj :
    ZLattice.covolume (periodLattice (W.map (starRingEnd ℂ))) =
      ZLattice.covolume (periodLattice W) := sorry

end Layer1

section RealEquations

/-- **1.6** The least positive real element of a lattice in `ℂ`, as an infimum (the junk value
`0` occurs only when `Λ ∩ ℝ = 0`, which `leastPositiveRealPeriod_pos` rules out for the lattices
of real equations) (`README.md`, Layer 1, 1.6). -/
def leastPositiveRealPeriod (Λ : Submodule ℤ ℂ) : ℝ :=
  sInf {x : ℝ | 0 < x ∧ ((x : ℂ) ∈ Λ)}

variable (W : WeierstrassCurve ℝ) [W.IsElliptic]

/-- **1.6** The number of connected components of `E(ℝ)`: `2` if `Δ > 0`, `1` if `Δ < 0`
(`README.md`, Layer 1, 1.6). -/
def realComponentCount : ℕ := if 0 < W.Δ then 2 else 1

/-- **1.6** The real period of a real equation is positive (`README.md`, Layer 1, 1.6). -/
theorem leastPositiveRealPeriod_pos :
    0 < leastPositiveRealPeriod (periodLattice (W.map (algebraMap ℝ ℂ))) := sorry

/-- **1.6** The infimum is attained (`README.md`, Layer 1, 1.6). -/
theorem leastPositiveRealPeriod_mem :
    ((leastPositiveRealPeriod (periodLattice (W.map (algebraMap ℝ ℂ))) : ℝ) : ℂ) ∈
      periodLattice (W.map (algebraMap ℝ ℂ)) := sorry

/-- **1.6** Shape for `Δ > 0`: a rectangular basis `[x, y i]` with `x` the least positive real
period (`README.md`, Layer 1, 1.6). -/
theorem periodLattice_rectangular_of_pos (h : 0 < W.Δ) :
    ∃ y : ℝ, 0 < y ∧ periodLattice (W.map (algebraMap ℝ ℂ)) =
      Submodule.span ℤ
        {((leastPositiveRealPeriod (periodLattice (W.map (algebraMap ℝ ℂ))) : ℝ) : ℂ),
          (y : ℂ) * I} := sorry

/-- **1.6** Shape for `Δ < 0`: a basis `[2x, x + y i]` with `2x` the least positive real period
(`README.md`, Layer 1, 1.6). -/
theorem periodLattice_rhombic_of_neg (h : W.Δ < 0) :
    ∃ y : ℝ, 0 < y ∧ periodLattice (W.map (algebraMap ℝ ℂ)) =
      Submodule.span ℤ
        {((leastPositiveRealPeriod (periodLattice (W.map (algebraMap ℝ ℂ))) : ℝ) : ℂ),
          ((leastPositiveRealPeriod (periodLattice (W.map (algebraMap ℝ ℂ))) / 2 : ℝ) : ℂ) +
            (y : ℂ) * I} := sorry

end RealEquations

/-! ## Layer 2: local periods at the infinite places and the global period -/

section Layer2

variable {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K) [W.IsElliptic]

open Classical in
/-- **2.2–2.3** The local period at an infinite place: `realComponentCount * leastPositiveRealPeriod`
at a real place, `2 * covolume` at a complex place (`README.md`, Layer 2, 2.2 and 2.3). -/
def localPeriod (v : InfinitePlace K) : ℝ :=
  if hv : v.IsReal then
    realComponentCount (W.map (InfinitePlace.embedding_of_isReal hv)) *
      leastPositiveRealPeriod (periodLattice (W.map v.embedding))
  else 2 * ZLattice.covolume (periodLattice (W.map v.embedding))

/-- **2.2–2.3** Local periods are positive (`README.md`, Layer 2, 2.2 and 2.3). -/
theorem localPeriod_pos (v : InfinitePlace K) : 0 < localPeriod W v := sorry

/-- **2.2** At a real place the local period scales by `|σ_v u|` (`README.md`, Layer 2, 2.2). -/
theorem localPeriod_smul_of_isReal (C : VariableChange K) {v : InfinitePlace K} (hv : v.IsReal) :
    localPeriod (C • W) v = |InfinitePlace.embedding_of_isReal hv (C.u : K)| * localPeriod W v :=
  sorry

/-- **2.3** At a complex place the local period scales by `|σ_v u|²` (`README.md`, Layer 2, 2.3). -/
theorem localPeriod_smul_of_isComplex (C : VariableChange K) {v : InfinitePlace K}
    (hv : v.IsComplex) :
    localPeriod (C • W) v = ‖v.embedding (C.u : K)‖ ^ 2 * localPeriod W v := sorry

/-- **2.4** The product of the local periods scales by `|N_{K/ℚ} u|`; false place by place
(`README.md`, Layer 2, 2.4). -/
theorem prod_localPeriod_smul (C : VariableChange K) :
    ∏ v : InfinitePlace K, localPeriod (C • W) v =
      |Algebra.norm ℚ (C.u : K)| * ∏ v : InfinitePlace K, localPeriod W v := sorry

/-- **2.5** The global period `Ω(E/K) = (|N Δ| / N 𝔇)^(1/12) ∏_v Ω_v` (`README.md`, Layer 2, 2.5).
The minimal discriminant ideal is Tau Ceti's `minimalDiscriminantIdeal`. -/
def globalPeriod : ℝ :=
  (|Algebra.norm ℚ W.Δ| / (Ideal.absNorm (minimalDiscriminantIdeal (𝓞 K) W) : ℝ)) ^ ((1 : ℝ) / 12) *
    ∏ v : InfinitePlace K, localPeriod W v

/-- **2.5** The global period is positive (`README.md`, Layer 2, 2.5). -/
theorem globalPeriod_pos : 0 < globalPeriod W := sorry

/-- **2.5** The global period is an invariant of the curve (`README.md`, Layer 2, 2.5). -/
theorem globalPeriod_smul (C : VariableChange K) : globalPeriod (C • W) = globalPeriod W := sorry

/-- **2.5** On a globally minimal equation the prefactor is `1` (`README.md`, Layer 2, 2.5). -/
theorem globalPeriod_eq_prod_of_isGlobalMinimal (h : WeierstrassCurve.IsGlobalMinimal (𝓞 K) W) :
    globalPeriod W = ∏ v : InfinitePlace K, localPeriod W v := sorry

end Layer2

section NeronLattice

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- **2.6** The Néron lattice of `E/ℚ`: the period lattice of the reduced minimal model
(`README.md`, Layer 2, 2.6). -/
def neronLattice : Submodule ℤ ℂ :=
  periodLattice ((reducedMinimalModel E).map (algebraMap ℚ ℂ))

/-- **2.6** The Néron lattice is discrete (`README.md`, Layer 2, 2.6). -/
instance : DiscreteTopology (neronLattice E) :=
  inferInstanceAs (DiscreteTopology (periodLattice ((reducedMinimalModel E).map (algebraMap ℚ ℂ))))

/-- **2.6** The Néron lattice is a full lattice (`README.md`, Layer 2, 2.6). -/
instance : IsZLattice ℝ (neronLattice E) :=
  inferInstanceAs (IsZLattice ℝ (periodLattice ((reducedMinimalModel E).map (algebraMap ℚ ℂ))))

/-- **2.6** The Néron lattice depends only on the `ℚ`-isomorphism class
(`README.md`, Layer 2, 2.6). -/
theorem neronLattice_smul (C : VariableChange ℚ) : neronLattice (C • E) = neronLattice E := sorry

/-- **2.6** Every globally minimal equation of the class has the Néron lattice: two of them differ
by a change with `u = ±1`, and `u = -1` fixes the lattice (`README.md`, Layer 2, 2.6). -/
theorem neronLattice_eq_of_isGlobalMinimal (h : WeierstrassCurve.IsGlobalMinimal ℤ E) :
    periodLattice (E.map (algebraMap ℚ ℂ)) = neronLattice E := sorry

/-- **2.6** Over `ℚ` the global period is read off the Néron lattice (`README.md`, Layer 2, 2.6). -/
theorem globalPeriod_eq_neronLattice :
    globalPeriod E = realComponentCount ((reducedMinimalModel E).map (algebraMap ℚ ℝ)) *
      leastPositiveRealPeriod (neronLattice E) := sorry

end NeronLattice

/-! ## Layer 3: the analytic side of Birch–Swinnerton-Dyer, as definitions -/

section Layer3

variable {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K) [W.IsElliptic]

/-- **3.1** Absolute convergence of the Hasse–Weil `L`-series for `Re s > 3/2`
(`README.md`, Layer 3, 3.1). -/
theorem LSeriesSummable_LFunction {s : ℂ} (hs : 3 / 2 < s.re) :
    LSeriesSummable (fun n ↦ (W.LFunction n : ℂ)) s := sorry

/-- **3.2** Nonvanishing on the half-plane of absolute convergence (`README.md`, Layer 3, 3.2). -/
theorem LSeries_ne_zero {s : ℂ} (hs : 3 / 2 < s.re) : W.LSeries s ≠ 0 := sorry

/-- **3.3** A continuation of `L(E/K, s)`: an analytic function on an open **convex** set
containing the half-plane of absolute convergence and the point `1`, agreeing with the series on
the half-plane (`README.md`, Layer 3, 3.3 and *Pinned conventions*). -/
structure IsContinuation (U : Set ℂ) (F : ℂ → ℂ) : Prop where
  isOpen : IsOpen U
  convex : Convex ℝ U
  halfPlane_subset : {s : ℂ | 3 / 2 < s.re} ⊆ U
  one_mem : (1 : ℂ) ∈ U
  analyticOnNhd : AnalyticOnNhd ℂ F U
  eqOn : Set.EqOn F W.LSeries {s : ℂ | 3 / 2 < s.re}

omit [W.IsElliptic] in
/-- **3.3** Bridge check: two continuations agree on the intersection of their domains, by
Mathlib's identity theorem on the convex (hence preconnected) set `U ∩ U'` and the point `2`
of the half-plane (`README.md`, Layer 3, 3.3). -/
theorem IsContinuation.eqOn_inter {U U' : Set ℂ} {F F' : ℂ → ℂ} (h : IsContinuation W U F)
    (h' : IsContinuation W U' F') : Set.EqOn F F' (U ∩ U') := by
  have hH : IsOpen {s : ℂ | 3 / 2 < s.re} := isOpen_lt continuous_const continuous_re
  have h2 : (2 : ℂ) ∈ {s : ℂ | 3 / 2 < s.re} := by
    simp only [Set.mem_ofPred_eq, Complex.re_ofNat]; norm_num
  refine AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
    (h.analyticOnNhd.mono Set.inter_subset_left) (h'.analyticOnNhd.mono Set.inter_subset_right)
    (h.convex.inter h'.convex).isPreconnected ⟨h.halfPlane_subset h2, h'.halfPlane_subset h2⟩ ?_
  filter_upwards [hH.mem_nhds h2] with s hs
  exact (h.eqOn hs).trans (h'.eqOn hs).symm

/-- **3.3** Over `ℚ` a continuation on all of `ℂ` exists, from the modularity roadmap's entire
completed `L`-function (`README.md`, Layer 3, 3.3). The non-vacuity witness for
`IsContinuation`. -/
theorem isContinuation_of_modularity (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    ∃ F : ℂ → ℂ, IsContinuation E Set.univ F := sorry

variable {U : Set ℂ} {F : ℂ → ℂ}

/-- **3.4** The analytic rank: the order of vanishing of a continuation at `1`
(`README.md`, Layer 3, 3.4). -/
def analyticRank (_h : IsContinuation W U F) : ℕ := (analyticOrderAt F 1).toNat

/-- **3.4** The order at `1` is finite (`README.md`, Layer 3, 3.4). -/
theorem analyticOrderAt_ne_top (h : IsContinuation W U F) : analyticOrderAt F 1 ≠ ⊤ := sorry

/-- **3.4** The leading coefficient `F^{(r)}(1) / r!`, the LMFDB `special_value`
(`README.md`, Layer 3, 3.4). -/
def leadingCoefficient (h : IsContinuation W U F) : ℂ :=
  iteratedDeriv (analyticRank W h) F 1 / (analyticRank W h).factorial

/-- **3.4** The leading coefficient is nonzero (`README.md`, Layer 3, 3.4). -/
theorem leadingCoefficient_ne_zero (h : IsContinuation W U F) : leadingCoefficient W h ≠ 0 := sorry

/-- **3.4** The leading coefficient is real; no sign is claimed (`README.md`, Layer 3, 3.4). -/
theorem leadingCoefficient_im (h : IsContinuation W U F) : (leadingCoefficient W h).im = 0 := sorry

/-- **3.4** The analytic rank does not depend on the continuation (`README.md`, Layer 3, 3.4). -/
theorem analyticRank_congr {U' : Set ℂ} {F' : ℂ → ℂ} (h : IsContinuation W U F)
    (h' : IsContinuation W U' F') : analyticRank W h = analyticRank W h' := sorry

/-- **3.4** The leading coefficient does not depend on the continuation
(`README.md`, Layer 3, 3.4). -/
theorem leadingCoefficient_congr {U' : Set ℂ} {F' : ℂ → ℂ} (h : IsContinuation W U F)
    (h' : IsContinuation W U' F') : leadingCoefficient W h = leadingCoefficient W h' := sorry

variable [DecidableEq K]

/-- **3.5** The torsion order `#E(K)_tors` is positive and finite (`README.md`, Layer 3, 3.5). -/
theorem torsion_card_pos : 0 < Nat.card (Submodule.torsion ℤ W.toAffine.Point) := sorry

variable [Module.Finite ℤ (WeierstrassCurve.Affine.PointModTorsion W.toAffine)]

/-- **3.5** The normalised regulator `Reg_NT / [K : ℚ]^r`, the LMFDB `regulator` over `K`; Tau
Ceti's `regulator` is `Reg_NT` itself (`README.md`, Layer 3, 3.5). -/
def normalisedRegulator : ℝ :=
  WeierstrassCurve.Affine.regulator W.toAffine /
    (Module.finrank ℚ K : ℝ) ^ Module.finrank ℤ (WeierstrassCurve.Affine.PointModTorsion W.toAffine)

/-- **3.5** The normalised regulator is positive (`README.md`, Layer 3, 3.5). -/
theorem normalisedRegulator_pos : 0 < normalisedRegulator W := sorry

/-- **3.7** The weak Birch–Swinnerton-Dyer conjecture over `K`, as a statement: the analytic rank
of every continuation is the Mordell–Weil rank (`README.md`, Layer 3, 3.7). -/
def WeakBSD : Prop :=
  ∀ (U : Set ℂ) (F : ℂ → ℂ) (h : IsContinuation W U F),
    analyticRank W h = Module.finrank ℤ (WeierstrassCurve.Affine.PointModTorsion W.toAffine)

end Layer3

/-! ## Layer 4: the modular parametrization — Stevens' minimal curve and rationality in rank `0` -/

section Layer4

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- **4.10** Stevens' minimal curve of the isogeny class of `E`, presented as a reduced minimal
model: the curve of the class whose Néron lattice is contained in the Néron lattice of every curve
of the class (`README.md`, *Pinned conventions* and Layer 4, 4.10). Stevens' theorem is that such a
curve exists. -/
def stevensCurve (E : WeierstrassCurve ℚ) [E.IsElliptic] : WeierstrassCurve ℚ :=
  haveI : Nonempty {E' : WeierstrassCurve ℚ // E'.IsElliptic} := ⟨⟨E, inferInstance⟩⟩
  (Classical.epsilon fun E' : {E' : WeierstrassCurve ℚ // E'.IsElliptic} ↦
    haveI := E'.2
    IsReducedMinimal E'.1 ∧ Nonempty (TauCeti.Isogeny E'.1.toAffine E.toAffine) ∧
      ∀ (E'' : WeierstrassCurve ℚ) [E''.IsElliptic],
        Nonempty (TauCeti.Isogeny E.toAffine E''.toAffine) → neronLattice E'.1 ≤ neronLattice E'').1

/-- **4.10** The minimal curve is elliptic (`README.md`, Layer 4, 4.10). -/
instance : (stevensCurve E).IsElliptic := by
  unfold stevensCurve
  exact Subtype.property _

/-- **4.10** The minimal curve is presented as a reduced minimal model (`README.md`, Layer 4,
4.10). -/
theorem isReducedMinimal_stevensCurve : IsReducedMinimal (stevensCurve E) := sorry

/-- **4.10** The minimal curve depends only on the isogeny class (`README.md`, Layer 4, 4.10). -/
theorem stevensCurve_eq_of_isogeny {E' : WeierstrassCurve ℚ} [E'.IsElliptic]
    (ψ : TauCeti.Isogeny E.toAffine E'.toAffine) : stevensCurve E' = stevensCurve E := sorry

/-- **4.10** The minimal curve is isogenous to `E` (`README.md`, Layer 4, 4.10). -/
theorem stevensCurve_isogenous :
    Nonempty (TauCeti.Isogeny (stevensCurve E).toAffine E.toAffine) := sorry

/-- **4.10** Stevens' theorem, lattice form: the Néron lattice of the minimal curve is contained in
that of every curve of the class (`README.md`, Layer 4, 4.10). -/
theorem neronLattice_stevensCurve_le : neronLattice (stevensCurve E) ≤ neronLattice E := sorry

/-- **4.12** Rationality of `L(E, 1)/Ω_E` in analytic rank `0` over `ℚ`, from the Manin–Drinfeld
theorem and `Λ_E = c Λ_f` (`README.md`, Layer 4, 4.12). -/
theorem leadingCoefficient_div_globalPeriod_mem_rat {U : Set ℂ} {F : ℂ → ℂ}
    (h : IsContinuation E U F) (hr : analyticRank E h = 0) :
    ∃ q : ℚ, (leadingCoefficient E h).re = q * globalPeriod E := sorry

end Layer4

/-! ## Layer 5: lattice formulas for the Faltings height, and the Faltings ratio -/

section Layer5

variable {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K) [W.IsElliptic]

/-- **5.2** The Faltings height of `E/K` from any Weierstrass equation: the discriminant prefactor
and the covolumes of the period lattices at the infinite places, weighted by `mult`, in Faltings'
normalisation (`README.md`, Layer 5, 5.2). -/
def faltingsHeightLattice : ℝ :=
  (Module.finrank ℚ K : ℝ)⁻¹ *
    (-(1 / 12 : ℝ) * Real.log (|Algebra.norm ℚ W.Δ| /
        (Ideal.absNorm (minimalDiscriminantIdeal (𝓞 K) W) : ℝ)) -
      (1 / 2 : ℝ) * ∑ v : InfinitePlace K,
        (v.mult : ℝ) * Real.log (ZLattice.covolume (periodLattice (W.map v.embedding))))

/-- **5.2** The formula is independent of the equation (`README.md`, Layer 5, 5.2). -/
theorem faltingsHeightLattice_smul (C : VariableChange K) :
    faltingsHeightLattice (C • W) = faltingsHeightLattice W := sorry

/-- **5.2** On a globally minimal equation the prefactor vanishes (`README.md`, Layer 5, 5.2). -/
theorem faltingsHeightLattice_eq_of_isGlobalMinimal (h : WeierstrassCurve.IsGlobalMinimal (𝓞 K) W) :
    faltingsHeightLattice W = (Module.finrank ℚ K : ℝ)⁻¹ * (-(1 / 2 : ℝ) *
      ∑ v : InfinitePlace K,
        (v.mult : ℝ) * Real.log (ZLattice.covolume (periodLattice (W.map v.embedding)))) := sorry

/-- **5.1** Over `ℚ`: `h_Fal(E) = −½ log covol Λ_E` for the Néron lattice
(`README.md`, Layer 5, 5.1). -/
theorem faltingsHeightLattice_eq_neronLattice (E : WeierstrassCurve ℚ) [E.IsElliptic] :
    faltingsHeightLattice E = -(1 / 2 : ℝ) * Real.log (ZLattice.covolume (neronLattice E)) := sorry

/-- **5.3** The denominator ideal of `j`, `∏_𝔭 𝔭^{max(0, −v_𝔭(j))}` (`README.md`, *Pinned
conventions* and Layer 5, 5.3), written as `{a ∈ 𝓞 K | a j ∈ 𝓞 K}`: in the Dedekind domain `𝓞 K`,
`a j` is integral exactly when `v_𝔭(a) ≥ max(0, −v_𝔭(j))` at every `𝔭`. -/
def jDenominatorIdeal (W : WeierstrassCurve K) [W.IsElliptic] : Ideal (𝓞 K) :=
  (1 : Submodule (𝓞 K) K).colon {W.j}

/-- **5.3** The denominator ideal of `j` is a `K`-isomorphism invariant
(`README.md`, Layer 5, 5.3). -/
theorem jDenominatorIdeal_smul (C : VariableChange K) :
    jDenominatorIdeal (C • W) = jDenominatorIdeal W := sorry

/-- **5.3** The denominator ideal of `j` divides the minimal discriminant ideal
(`README.md`, Layer 5, 5.3). -/
theorem minimalDiscriminantIdeal_dvd_jDenominatorIdeal :
    minimalDiscriminantIdeal (𝓞 K) W ∣ jDenominatorIdeal W := sorry

/-- **5.3** The stable Faltings height through the denominator of `j`
(`README.md`, Layer 5, 5.3). -/
def stableFaltingsHeightLattice : ℝ :=
  (Module.finrank ℚ K : ℝ)⁻¹ *
    ((1 / 12 : ℝ) * (Real.log (Ideal.absNorm (jDenominatorIdeal W) : ℝ) -
        Real.log |Algebra.norm ℚ W.Δ|) -
      (1 / 2 : ℝ) * ∑ v : InfinitePlace K,
        (v.mult : ℝ) * Real.log (ZLattice.covolume (periodLattice (W.map v.embedding))))

/-- **5.3** The stable height is at most the height (`README.md`, Layer 5, 5.3). -/
theorem stableFaltingsHeightLattice_le : stableFaltingsHeightLattice W ≤ faltingsHeightLattice W :=
  sorry

/-- **5.3** Equality of the two heights is semistability (`README.md`, Layer 5, 5.3). -/
theorem stableFaltingsHeightLattice_eq_iff :
    stableFaltingsHeightLattice W = faltingsHeightLattice W ↔
      WeierstrassCurve.IsSemistable (𝓞 K) W := sorry

/-- **5.3** The stable height is independent of the equation (`README.md`, Layer 5, 5.3). -/
theorem stableFaltingsHeightLattice_smul (C : VariableChange K) :
    stableFaltingsHeightLattice (C • W) = stableFaltingsHeightLattice W := sorry

section OverQ

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- **5.5** The minimal curve has the least Faltings height in its class
(`README.md`, Layer 5, 5.5). -/
theorem faltingsHeightLattice_stevensCurve_le :
    faltingsHeightLattice (stevensCurve E) ≤ faltingsHeightLattice E := sorry

/-- **5.5** The Faltings ratio: the index of the Néron lattice of the minimal curve in that of `E`
(`README.md`, Layer 5, 5.5). -/
def faltingsRatio : ℕ :=
  (neronLattice (stevensCurve E)).toAddSubgroup.relIndex (neronLattice E).toAddSubgroup

/-- **5.5** The Faltings ratio is positive (`README.md`, Layer 5, 5.5). -/
theorem faltingsRatio_pos : 0 < faltingsRatio E := sorry

/-- **5.5** The Faltings ratio is the ratio of covolumes (`README.md`, Layer 5, 5.5). -/
theorem faltingsRatio_eq_covolume_div :
    (faltingsRatio E : ℝ) =
      ZLattice.covolume (neronLattice (stevensCurve E)) / ZLattice.covolume (neronLattice E) := sorry

/-- **5.5** The Faltings ratio is `exp (2 (h(E) − h(E_min)))` (`README.md`, Layer 5, 5.5). -/
theorem faltingsRatio_eq_exp :
    (faltingsRatio E : ℝ) =
      Real.exp (2 * (faltingsHeightLattice E - faltingsHeightLattice (stevensCurve E))) := sorry

/-- **5.5** The Faltings ratio is `1` exactly for the minimal curve (`README.md`, Layer 5, 5.5). -/
theorem faltingsRatio_eq_one_iff : faltingsRatio E = 1 ↔ reducedMinimalModel E = stevensCurve E :=
  sorry

end OverQ

end Layer5

end TauCetiRoadmap.EllipticCurvePeriodsAndModularParametrizations
