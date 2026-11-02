module

import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.MinimalModel.DiscriminantIdeal
import TauCeti.AlgebraicGeometry.EllipticCurve.MinimalModel.Reduced
import TauCeti.AlgebraicGeometry.EllipticCurve.GlobalMinimalModel
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Differential
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Degree

/-!
# Periods of elliptic curves and modular parametrizations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, with real definitions and `sorry` proofs.
The headlines are the invariant characterization and real shapes of the period lattice,
model independence of the global period, the isogeny lattice inclusion and degree index,
nonvanishing of the elliptic L-series and continuation-independent leading term, Stevens'
minimal curve, rank-zero period rationality, and the characterization of Faltings ratio one.

The following headlines are not statable at the pins. The integral newform-period comparison,
optimality, Manin constant and modular degree comparisons, the congruence theorem and the
semistable Manin theorem lack the modular curve/Jacobian quotient and integral geometric
homology carriers. The BSD quotient and analytic Sha order lack the arithmetic Tamagawa
product on the Néron component groups. The comparisons called faltingsHeightLattice_eq and
stableFaltingsHeightLattice_eq in README §5.2–§5.3, and the height interpretation of Stevens'
curve and the Faltings ratio, lack the metrized Arakelov Hodge line and its relative and stable
Faltings heights. No formula-defined height is substituted for these comparisons.

The native carrier is `WeierstrassCurve K` with ellipticity where required. Its differential
is dx/(2y+a₁x+a₃); its lattice has g₂=c₄/12 and g₃=c₆/216. Complex local periods are twice the
Lebesgue covolume. The global period includes (|N Δ|/N 𝔇)^(1/12). All central analytic values
come from a continuation, never an unevaluated Dirichlet-series sum. Isogeny multipliers in
the lattice theorem are signed scalars tied to the actual differential pullback.

The choices defining `periodLattice` and `stevensCurve` use `Classical.epsilon` on native data;
the existence and characterizing properties are the headline targets, not assumptions.
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

/-- **1.1** The period lattice of an elliptic Weierstrass equation over `ℂ`: the lattice of the
unique `PeriodPair`-lattice with `g₂ = c₄ / 12`, `g₃ = c₆ / 216` (`README.md`, Layer 1, 1.1). -/
def periodLattice (W : WeierstrassCurve ℂ) [W.IsElliptic] : Submodule ℤ ℂ :=
  haveI : Nonempty PeriodPair := ⟨⟨1, I, by simpa using Complex.basisOneI.linearIndependent⟩⟩
  (Classical.epsilon fun L : PeriodPair ↦ L.g₂ = W.c₄ / 12 ∧ L.g₃ = W.c₆ / 216).lattice

variable (W : WeierstrassCurve ℂ) [W.IsElliptic]

/-- **1.1** The period lattice is discrete (`README.md`, Layer 1, 1.1). -/
instance periodLatticeDiscrete : DiscreteTopology (periodLattice W) := by
  unfold periodLattice
  infer_instance

/-- **1.1** The period lattice is a full lattice in `ℂ = ℝ²` (`README.md`, Layer 1, 1.1). -/
instance periodLatticeFull : IsZLattice ℝ (periodLattice W) := by
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
instance neronLatticeDiscrete : DiscreteTopology (neronLattice E) :=
  inferInstanceAs (DiscreteTopology (periodLattice ((reducedMinimalModel E).map (algebraMap ℚ ℂ))))

/-- **2.6** The Néron lattice is a full lattice (`README.md`, Layer 2, 2.6). -/
instance neronLatticeFull : IsZLattice ℝ (neronLattice E) :=
  inferInstanceAs (IsZLattice ℝ (periodLattice ((reducedMinimalModel E).map (algebraMap ℚ ℂ))))

/-- **2.6** Every globally minimal equation of the class has the Néron lattice: two of them differ
by a change with `u = ±1`, and `u = -1` fixes the lattice (`README.md`, Layer 2, 2.6). -/
theorem neronLattice_eq_of_isGlobalMinimal (h : WeierstrassCurve.IsGlobalMinimal ℤ E) :
    periodLattice (E.map (algebraMap ℚ ℂ)) = neronLattice E := sorry

/-- **2.6** Over `ℚ` the global period is read off the Néron lattice (`README.md`, Layer 2, 2.6). -/
theorem globalPeriod_eq_neronLattice :
    globalPeriod E = realComponentCount ((reducedMinimalModel E).map (algebraMap ℚ ℝ)) *
      leastPositiveRealPeriod (neronLattice E) := sorry

end NeronLattice

section IsogenyLattices

/-- **2.7** An isogeny over a characteristic-zero field with a specified complex embedding
carries the source period lattice, scaled by its differential multiplier, into the target
lattice, with index equal to its degree. -/
theorem periodLattice_isogeny {F : Type*} [Field F] [CharZero F] (ι : F →+* ℂ)
    (E E' : WeierstrassCurve F) [E.IsElliptic] [E'.IsElliptic]
    (ψ : TauCeti.Isogeny E.toAffine E'.toAffine) (α : F) (hα : α ≠ 0)
    (hω : ψ.pullbackDifferential (WeierstrassCurve.Affine.invariantDifferential E'.toAffine) =
      α • WeierstrassCurve.Affine.invariantDifferential E.toAffine) :
    scaleLattice (ι α) (periodLattice (E.map ι)) ≤ periodLattice (E'.map ι) ∧
      (scaleLattice (ι α) (periodLattice (E.map ι))).toAddSubgroup.relIndex
        (periodLattice (E'.map ι)).toAddSubgroup = ψ.degree := sorry

end IsogenyLattices

/-! ## Layer 3: the analytic side of Birch–Swinnerton-Dyer, as definitions -/

section Layer3

variable {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K) [W.IsElliptic]

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
instance stevensCurveElliptic : (stevensCurve E).IsElliptic := by
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

/-- **5.3** The denominator ideal of `j`, `∏_𝔭 𝔭^{max(0, −v_𝔭(j))}` (`README.md`, *Pinned
conventions* and Layer 5, 5.3), written as `{a ∈ 𝓞 K | a j ∈ 𝓞 K}`: in the Dedekind domain `𝓞 K`,
`a j` is integral exactly when `v_𝔭(a) ≥ max(0, −v_𝔭(j))` at every `𝔭`. -/
def jDenominatorIdeal (W : WeierstrassCurve K) [W.IsElliptic] : Ideal (𝓞 K) :=
  (1 : Submodule (𝓞 K) K).colon {W.j}

/-- **5.3** The denominator ideal of `j` divides the minimal discriminant ideal
(`README.md`, Layer 5, 5.3). -/
theorem jDenominatorIdeal_dvd_minimalDiscriminantIdeal :
    jDenominatorIdeal W ∣ minimalDiscriminantIdeal (𝓞 K) W := sorry

section OverQ

variable (E : WeierstrassCurve ℚ) [E.IsElliptic]

/-- **5.5** The Faltings ratio: the index of the Néron lattice of the minimal curve in that of `E`
(`README.md`, Layer 5, 5.5). -/
def faltingsRatio : ℕ :=
  (neronLattice (stevensCurve E)).toAddSubgroup.relIndex (neronLattice E).toAddSubgroup

/-- **5.5** The Faltings ratio is positive (`README.md`, Layer 5, 5.5). -/
theorem faltingsRatio_pos : 0 < faltingsRatio E := sorry

/-- **5.5** The Faltings ratio is `1` exactly for the minimal curve (`README.md`, Layer 5, 5.5). -/
theorem faltingsRatio_eq_one_iff : faltingsRatio E = 1 ↔ reducedMinimalModel E = stevensCurve E :=
  sorry

end OverQ

end Layer5

end TauCetiRoadmap.EllipticCurvePeriodsAndModularParametrizations
