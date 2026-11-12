import Mathlib
import TauCeti.Topology.FilledHull
import TauCeti.Topology.JordanCurve.Basic
import TauCeti.Probability.Ergodic.MeanErgodic
import TauCeti.Analysis.Fourier.Pontryagin.StronglyContinuous

/-!
# Classical ergodic theory: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap. The admitted proofs are targets, not claimed implementations; definitions below have
explicit bodies.

The marked **stand-in** `IsStrongMixing` is copied verbatim from the prototype of
ProbabilisticAndMetricNumberTheory (TauCetiRoadmap PR #1421, §4.6), checked against revision
d311ebe1 of that PR; the owner's declaration is authoritative.

Kolmogorov–Sinai entropy is a target of this roadmap (README §4.0). `countablePartitionEntropy`,
`conditionalPartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate` and
`measureEntropy` carry the names and signatures that GeometryOfNumbersAndQuadraticArithmetic
(TauCetiRoadmap PR #851, §4.2) uses for the same objects, so that one implementation serves both.
Names and namespaces of this roadmap's own targets are provisional.
-/

set_option autoImplicit false

noncomputable section

open MeasureTheory Filter Set Topology
open scoped ENNReal NNReal Uniformity

namespace TauCetiRoadmap.ClassicalErgodicTheory

/-! ## Stand-ins -/

section StandIns

/-- **Stand-in (PR #1421 §4.6, verbatim).** Strong mixing of a probability-preserving map. -/
def IsStrongMixing {Ω : Type*} [MeasurableSpace Ω] (T : Ω → Ω) (μ : ProbabilityMeasure Ω) : Prop :=
  MeasurePreserving T (μ : Measure Ω) (μ : Measure Ω) ∧
    ∀ A B : Set Ω, MeasurableSet A → MeasurableSet B →
      Tendsto (fun n : ℕ => (μ : Measure Ω).real (A ∩ (T^[n]) ⁻¹' B)) atTop
        (𝓝 ((μ : Measure Ω).real A * (μ : Measure Ω).real B))

end StandIns

/-! ## Layer 4.0: partition entropy and Kolmogorov–Sinai entropy -/

section PartitionEntropy

variable {X : Type*} [MeasurableSpace X]

/-- Layer 4.0: entropy of a countable label, `∑ -pᵢ log pᵢ` in `ℝ≥0∞`. -/
def countablePartitionEntropy (μ : Measure X) {ι : Type*} [Countable ι] (a : X → ι) : ℝ≥0∞ :=
  ∑' i, ENNReal.ofReal (Real.negMulLog (μ.real (a ⁻¹' {i})))

/-- Layer 4.0: the length-`n` itinerary `(a x, a (T x), …, a (T^[n-1] x))`. -/
def iteratedPartitionLabel {ι : Type*} (T : X → X) (a : X → ι) (n : ℕ) : X → (Fin n → ι) :=
  fun x k => a (T^[k] x)

/-- Layer 4.0: the entropy rate `inf_{n ≥ 1} H(aⁿ)/n`. -/
def partitionEntropyRate (μ : Measure X) (T : X → X) {ι : Type*} [Countable ι] (a : X → ι) :
    ℝ≥0∞ :=
  ⨅ (n : ℕ) (_ : 0 < n), countablePartitionEntropy μ (iteratedPartitionLabel T a n) / n

/-- Layer 4.0: Kolmogorov–Sinai entropy: supremum of the rates of measurable
`ℕ`-valued labels of finite entropy. -/
def measureEntropy (μ : Measure X) (T : X → X) : ℝ≥0∞ :=
  ⨆ (a : X → ℕ) (_ : Measurable a) (_ : countablePartitionEntropy μ a < ⊤),
    partitionEntropyRate μ T a

/-- Layer 4.0: conditional entropy of a countable label given another,
`∑ p_ij log (p_j / p_ij)`, zero-mass cells contributing zero. -/
def conditionalPartitionEntropy (μ : Measure X) {ι κ : Type*} [Countable ι] [Countable κ]
    (a : X → ι) (b : X → κ) : ℝ≥0∞ :=
  ∑' p : ι × κ, ENNReal.ofReal
    (μ.real ((fun x => (a x, b x)) ⁻¹' {p}) *
      Real.log (μ.real (b ⁻¹' {p.2}) / μ.real ((fun x => (a x, b x)) ⁻¹' {p})))

/-- Layer 4.0 item 5: the textbook definition through finite measurable partitions. -/
theorem measureEntropy_eq_iSup_finite (μ : Measure X) [IsProbabilityMeasure μ] {T : X → X}
    (hT : MeasurePreserving T μ μ) :
    measureEntropy μ T =
      ⨆ (n : ℕ) (a : X → Fin (n + 1)) (_ : Measurable a), partitionEntropyRate μ T a := by
  sorry

end PartitionEntropy

/-! ## Layer 0: factors -/

section Layer0

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]

/-- `π` is a factor map from `(X, μ, T)` to `(Y, ν, S)`. -/
def IsFactorMap (π : X → Y) (T : X → X) (S : Y → Y) (μ : Measure X) (ν : Measure Y) : Prop :=
  MeasurePreserving π μ ν ∧ π ∘ T =ᵐ[μ] S ∘ π

/-- Layer 0.4: the first-return map, equal to `x` where there is no return. -/
def inducedMap (T : X → X) (A : Set X) (x : X) : X :=
  open Classical in
  if h : ∃ n, 0 < n ∧ T^[n] x ∈ A then T^[Nat.find h] x else x

theorem measurePreserving_inducedMap (μ : Measure X) [IsProbabilityMeasure μ] {T : X → X}
    (hT : MeasurePreserving T μ μ) {A : Set X} (hA : MeasurableSet A) (hμA : 0 < μ A) :
    MeasurePreserving (inducedMap T A) ((μ A)⁻¹ • μ.restrict A) ((μ A)⁻¹ • μ.restrict A) := by
  sorry

end Layer0

/-! ## Layer 0.7: natural extensions -/

section NaturalExtensions

variable {X : Type*} [MeasurableSpace X]

/-- Compatible backward histories with the subtype σ-algebra. -/
abbrev NaturalExtensionSpace (T : X → X) :=
  {x : ℕ → X // ∀ n, T (x (n + 1)) = x n}

/-- The forward history map inserts the image of the present state. -/
def naturalExtensionForward (T : X → X) (x : NaturalExtensionSpace T) :
    NaturalExtensionSpace T :=
  ⟨fun n => if n = 0 then T (x.1 0) else x.1 (n - 1), by
    intro n
    cases n with
    | zero => simp
    | succ n => simpa using x.2 n⟩

/-- The inverse history map drops the present state. -/
def naturalExtensionBackward (T : X → X) (x : NaturalExtensionSpace T) :
    NaturalExtensionSpace T :=
  ⟨fun n => x.1 (n + 1), fun n => x.2 (n + 1)⟩

/-- Projection to the present state. -/
def naturalExtensionProjection (T : X → X) (x : NaturalExtensionSpace T) : X := x.1 0

/-- The history dynamics is an honest measurable equivalence. -/
def naturalExtensionEquiv (T : X → X) (hT : Measurable T) :
    NaturalExtensionSpace T ≃ᵐ NaturalExtensionSpace T where
  toFun := naturalExtensionForward T
  invFun := naturalExtensionBackward T
  left_inv x := by
    apply Subtype.ext
    funext n
    simp [naturalExtensionBackward, naturalExtensionForward]
  right_inv x := by
    apply Subtype.ext
    funext n
    cases n with
    | zero => simpa [naturalExtensionBackward, naturalExtensionForward] using x.2 0
    | succ n => simp [naturalExtensionBackward, naturalExtensionForward]
  measurable_toFun := by
    apply Measurable.subtype_mk
    apply Measurable.of_eval
    intro n
    by_cases hn : n = 0
    · simpa [naturalExtensionForward, hn, Function.comp_def] using
        hT.comp ((measurable_pi_apply 0).comp measurable_subtype_coe)
    · simpa [naturalExtensionForward, hn, Function.comp_def] using
        (measurable_pi_apply (n - 1)).comp measurable_subtype_coe
  measurable_invFun := by
    apply Measurable.subtype_mk
    exact Measurable.of_eval fun n =>
      (measurable_pi_apply (n + 1)).comp measurable_subtype_coe

/-- The compatible-history law is uniquely determined by invariance and its present marginal. -/
theorem existsUnique_naturalExtensionMeasure [StandardBorelSpace X]
    (T : X → X) (μ : Measure X) [IsProbabilityMeasure μ]
    (hT : MeasurePreserving T μ μ) :
    ∃! μhat : Measure (NaturalExtensionSpace T),
      IsProbabilityMeasure μhat ∧
      MeasurePreserving (naturalExtensionEquiv T hT.measurable) μhat μhat ∧
      MeasurePreserving (naturalExtensionProjection T) μhat μ := by
  sorry

/-- Layer 0.4: a small complete section, without an ergodicity hypothesis. -/
theorem exists_small_completeSection [StandardBorelSpace X]
    (T : X ≃ᵐ X) (μ : Measure X) [IsProbabilityMeasure μ]
    (hT : MeasurePreserving T μ μ)
    (haperiodic : ∀ n : ℕ, 0 < n → μ {x | T^[n] x = x} = 0)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ A : Set X, MeasurableSet A ∧ μ A < ENNReal.ofReal ε ∧
      μ ((⋃ n : ℕ, T^[n] '' A) ∪ (⋃ n : ℕ, T.symm^[n] '' A)) = 1 := by
  sorry

end NaturalExtensions

/-! ## Monoid actions and finite orbit observations -/

section MonoidActions

variable {M X Y A : Type*} [Monoid M] [MulAction M X] [MulAction M Y]
  [MeasurableSpace X] [MeasurableSpace Y]

/-- Layer 0.1: a factor intertwines each parameter almost everywhere. -/
def IsFactorMapSMul (π : X → Y) (μ : Measure X) (ν : Measure Y) : Prop :=
  MeasurePreserving π μ ν ∧
    ∀ m : M, (fun x => π (m • x)) =ᵐ[μ] fun x => m • π x

/-- Layer 0.5: orbit labels over an arbitrary finite observation window. -/
def orbitLabel (F : Finset M) (ξ : X → A) : X → (F → A) :=
  fun x g => ξ ((g : M) • x)

/-- Layer 0.5: the finite-window dynamical entourage. -/
def orbitEntourage (F : Finset M) (U : SetRel X X) : SetRel X X :=
  {p | ∀ g ∈ F, (g • p.1, g • p.2) ∈ U}

/-- Layer 1.0: correlation mixing along an explicit parameter filter. Preservation is an
ambient hypothesis in theorems using this predicate. -/
def MixingAlong (μ : Measure X) (l : Filter M) : Prop :=
  ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
    Tendsto (fun m : M => μ.real (A ∩ (m • ·) ⁻¹' B)) l
      (𝓝 (μ.real A * μ.real B))

/-- Layer 1.0: diagonal weak mixing for an arbitrary monoid action. -/
class WeakMixingSMul (μ : Measure X) : Prop where
  ergodicSMul_prod : ErgodicSMul M (X × X) (μ.prod μ)

/-- Layer 1.0: filtered mixing implies diagonal weak mixing for a nontrivial filter. -/
theorem MixingAlong.weakMixingSMul (μ : Measure X) [IsProbabilityMeasure μ]
    (hM : ∀ m : M, MeasurePreserving (m • ·) μ μ) {l : Filter M} [l.NeBot]
    (h : MixingAlong (M := M) μ l) : WeakMixingSMul (M := M) μ := by
  sorry

end MonoidActions

section Joinings
variable {X Y Z : Type*} [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]
/-- Layer 0.8: an invariant coupling of two systems. -/
def IsJoining (T : X → X) (S : Y → Y) (μ : Measure X) (ν : Measure Y)
    (joining : Measure (X × Y)) : Prop :=
  MeasurePreserving Prod.fst joining μ ∧ MeasurePreserving Prod.snd joining ν ∧
    MeasurePreserving (Prod.map T S) joining joining

/-- Layer 0.8: the fibrewise product integral. Invariance requires group-equivariant
disintegrations in its theorems. -/
def relativeIndependentJoining (ρ : Measure Z) (κ : ProbabilityTheory.Kernel Z X)
    (η : ProbabilityTheory.Kernel Z Y) : Measure (X × Y) :=
  ρ.bind fun z => (κ z).prod (η z)
end Joinings

section RelativeProducts

variable {G X Z : Type*} [Group G] [Countable G] [MulAction G X] [MulAction G Z]
  [MeasurableSpace X] [StandardBorelSpace X] [MeasurableSpace Z] [StandardBorelSpace Z]

/-- Disintegrate the graph law of a factor, using Mathlib's conditional kernel. -/
def factorDisintegration (π : X → Z) (μ : Measure X) [IsProbabilityMeasure μ] :
    ProbabilityTheory.Kernel Z X := by
  letI : Nonempty X := nonempty_of_isProbabilityMeasure μ
  exact (μ.map (fun x => (π x, x))).condKernel

/-- The relative self-product is initially a measure on the ambient square. -/
def relativeSelfJoining (π : X → Z) (μ : Measure X) [IsProbabilityMeasure μ] :
    Measure (X × X) :=
  relativeIndependentJoining (μ.map π) (factorDisintegration π μ) (factorDisintegration π μ)

/-- Group inverses make conditional kernels equivariant and the relative product invariant. -/
theorem relativeSelfJoining_measurePreserving (π : X → Z)
    (μ : Measure X) [IsProbabilityMeasure μ] (ν : Measure Z) [IsProbabilityMeasure ν]
    (hπ : IsFactorMapSMul (M := G) π μ ν)
    (hG : ∀ g : G, MeasurePreserving (g • ·) μ μ)
    (hZ : ∀ g : G, MeasurePreserving (g • ·) ν ν) (g : G) :
    MeasurePreserving (Prod.map (g • ·) (g • ·))
      (relativeSelfJoining π μ) (relativeSelfJoining π μ) := by
  sorry

/-- Layer 1.5: invariant sets of the relative square descend to the base. Theorems assume
`π` is a factor of probability-preserving group actions; the base may be nonergodic. -/
def RelativelyWeakMixing (π : X → Z) (μ : Measure X) [IsProbabilityMeasure μ] : Prop :=
  ∀ A : Set (X × X), MeasurableSet A →
    (∀ g : G, (Prod.map (g • ·) (g • ·)) ⁻¹' A =ᵐ[relativeSelfJoining π μ] A) →
      ∃ B : Set Z, MeasurableSet B ∧
        A =ᵐ[relativeSelfJoining π μ] (fun p : X × X => π p.1) ⁻¹' B

end RelativeProducts

section ActionEntropy
variable {G X : Type*} [Group G] [MulAction G X] [MeasurableSpace X]
/-- Layer 4.6: the infimum formula for a finite-entropy orbit label. -/
def actionPartitionEntropyRate (μ : Measure X) {A : Type*} [Countable A] (ξ : X → A) : ℝ≥0∞ :=
  ⨅ (F : Finset G) (_ : F.Nonempty), countablePartitionEntropy μ (orbitLabel F ξ) / F.card
/-- Action entropy as a supremum over finite measurable labels. -/
def actionMeasureEntropy (μ : Measure X) : ℝ≥0∞ :=
  ⨆ (n : ℕ) (ξ : X → Fin (n + 1)) (_ : Measurable ξ),
    actionPartitionEntropyRate (G := G) μ ξ

variable [MeasurableSpace G] [MeasurableSingletonClass G] [Countable G] [Infinite G]
/-- Følner families use Mathlib's predicate, with counting measure and explicit orientation. -/
theorem actionPartitionEntropyRate_tendsto {ι : Type*} (l : Filter ι) [l.NeBot]
    (F : ι → Finset G)
    (hF : IsFoelner G (Measure.count : Measure G) l (fun i => (F i : Set G)))
    (μ : Measure X) [IsProbabilityMeasure μ]
    (hG : ∀ g : G, MeasurePreserving (g • ·) μ μ)
    {A : Type*} [Countable A] [MeasurableSpace A] (ξ : X → A)
    (hξ : Measurable ξ) (hH : countablePartitionEntropy μ ξ < ⊤) :
    Tendsto (fun i => countablePartitionEntropy μ (orbitLabel (F i) ξ) / (F i).card) l
      (𝓝 (actionPartitionEntropyRate (G := G) μ ξ)) := by
  sorry
end ActionEntropy

section ActionPressure
variable {G X : Type*} [Group G] [MulAction G X] [UniformSpace X]
/-- Layer 5.6: weighted separated sets over a finite observation window. -/
def actionPressureNetSum (F : Finset G) (φ : X → ℝ) (U : SetRel X X) : ℝ≥0∞ :=
  ⨆ (s : Finset X) (_ : (s : Set X).Pairwise fun x y => (x, y) ∉ orbitEntourage F U),
    ∑ x ∈ s, ENNReal.ofReal (Real.exp (∑ g ∈ F, φ (g • x)))
/-- Pressure along a specified filtered family of windows. -/
def actionPressureAlong {ι : Type*} (F : ι → Finset G) (l : Filter ι) (φ : X → ℝ) : EReal :=
  ⨆ U ∈ 𝓤 X, limsup (fun i => ENNReal.log (actionPressureNetSum (F i) φ U) / (F i).card) l
variable [MeasurableSpace G]
/-- Canonical pressure uses the pullback of Mathlib's maximal Følner filter to finite sets.
Window independence identifies this with every nontrivial Følner family. -/
def actionTopologicalPressure (φ : X → ℝ) : EReal :=
  actionPressureAlong (G := G) id
    (Filter.comap (fun F : Finset G => (F : Set G)) (maxFoelner G (Measure.count : Measure G))) φ
end ActionPressure

/-! ## Layer 1: mixing -/

section Layer1

variable {X : Type*} [MeasurableSpace X]

/-- Weak mixing of a map: ergodicity of the product system. -/
structure WeakMixing (T : X → X) (μ : Measure X) : Prop extends MeasurePreserving T μ μ where
  ergodic_prodMap : Ergodic (Prod.map T T) (μ.prod μ)

/-- Mixing of a measure-preserving action along the cocompact filter. -/
class MixingVAdd (G X : Type*) [TopologicalSpace G] [VAdd G X] [MeasurableSpace X]
    (μ : Measure X) : Prop where
  tendsto_measure_inter_preimage : ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
    Tendsto (fun g : G => μ.real (A ∩ (g +ᵥ ·) ⁻¹' B)) (cocompact G)
      (𝓝 (μ.real A * μ.real B))

/-- Weak mixing of a measure-preserving action: ergodicity of the diagonal action on the
square. -/
class WeakMixingVAdd (G X : Type*) [VAdd G X] [MeasurableSpace X] (μ : Measure X) : Prop where
  ergodicVAdd_prod : ErgodicVAdd G (X × X) (μ.prod μ)

variable (μ : Measure X) [IsProbabilityMeasure μ]

theorem isStrongMixing_iff {T : X → X} :
    IsStrongMixing T ⟨μ, inferInstance⟩ ↔ MeasurePreserving T μ μ ∧
      ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
        Tendsto (fun n : ℕ => μ.real (A ∩ T^[n] ⁻¹' B)) atTop (𝓝 (μ.real A * μ.real B)) := by
  sorry

/-- Layer 1.1: weak mixing is Cesàro decay of correlations. -/
theorem weakMixing_iff_tendsto_cesaro {T : X → X} (hT : MeasurePreserving T μ μ) :
    WeakMixing T μ ↔ ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
      Tendsto (fun N : ℕ => (N : ℝ)⁻¹ *
          ∑ n ∈ Finset.range N, |μ.real (A ∩ T^[n] ⁻¹' B) - μ.real A * μ.real B|)
        atTop (𝓝 0) := by
  sorry

/-- Layer 1.1: weak mixing tested against every ergodic system. -/
theorem WeakMixing.ergodic_prodMap_of_ergodic {T : X → X} (hT : WeakMixing T μ)
    {Y : Type*} [MeasurableSpace Y] (ν : Measure Y) [IsProbabilityMeasure ν] {S : Y → Y}
    (hS : Ergodic S ν) : Ergodic (Prod.map T S) (μ.prod ν) := by
  sorry

end Layer1

section Representations
variable {G H : Type*} [Group G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [CompleteSpace H]
/-- Layer 2.4: weak mixing of a unitary representation excludes finite-dimensional subrepresentations.
Unitarity is an ambient hypothesis in its characterization theorems. -/
def IsWeakMixingRepresentation (U : ContRepresentation ℂ G H) : Prop :=
  ∀ W : Subrepresentation U.toRepresentation, FiniteDimensional ℂ W.toSubmodule → W = ⊥
end Representations

section AbelianSpectrum

variable {G H : Type*} [AddCommGroup G] [TopologicalSpace G] [IsTopologicalAddGroup G]
  [T2Space G] [LocallyCompactSpace G]
  [MeasurableSpace (PontryaginDual (Multiplicative G))]
  [BorelSpace (PontryaginDual (Multiplicative G))]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Layer 2.1: consume the existing cyclic spectral theorem directly. -/
def spectralMeasureAction (U : ContRepresentation ℂ (Multiplicative G) H)
    (hcontinuous : ∀ v, Continuous fun g : G => U (.ofAdd g) v)
    (hunitary : U.IsUnitary) (v : H) : FiniteMeasure (PontryaginDual (Multiplicative G)) :=
  Classical.choose (U.exists_pontryaginMeasureTransform_eq_inner hcontinuous hunitary v)

/-- The chosen finite inner regular measure represents the matrix coefficient with the fixed sign. -/
theorem spectralMeasureAction_spec (U : ContRepresentation ℂ (Multiplicative G) H)
    (hcontinuous : ∀ v, Continuous fun g : G => U (.ofAdd g) v)
    (hunitary : U.IsUnitary) (v : H) :
    (spectralMeasureAction U hcontinuous hunitary v).toMeasure.InnerRegular ∧
      ∀ g : G, inner ℂ v (U (.ofAdd g) v) =
        ∫ χ, ((χ (.ofAdd g) : Circle) : ℂ)
          ∂(spectralMeasureAction U hcontinuous hunitary v).toMeasure := by
  sorry

end AbelianSpectrum

/-! ## Layer 3: real flows -/

section Layer3

variable {X : Type*} [MeasurableSpace X] [AddAction ℝ X] [MeasurableVAdd₂ ℝ X]
  (μ : Measure X) [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ]

/-- An eigenfunction of a real flow with frequency `α`. -/
def IsVAddEigenfunction (α : ℝ) (f : X → ℂ) : Prop :=
  Measurable f ∧ ¬ (f =ᵐ[μ] 0) ∧
    ∀ t : ℝ, (fun x => f (t +ᵥ x)) =ᵐ[μ]
      fun x => Complex.exp (2 * Real.pi * Complex.I * α * t) * f x

/-- Layer 3.2: weak mixing of a real flow is the absence of nonconstant eigenfunctions. -/
theorem weakMixingVAdd_real_iff :
    WeakMixingVAdd ℝ X μ ↔
      ∀ (α : ℝ) (f : X → ℂ), IsVAddEigenfunction μ α f → ∃ c : ℂ, f =ᵐ[μ] fun _ => c := by
  sorry

/-- Layer 3.2: weak mixing of a real flow is weak mixing of any nonzero time-`t` map. -/
theorem weakMixingVAdd_real_iff_weakMixing {t : ℝ} (ht : t ≠ 0) :
    WeakMixingVAdd ℝ X μ ↔ WeakMixing (fun x : X => t +ᵥ x) μ := by
  sorry

end Layer3

section AEFlows

variable {X : Type*} [MeasurableSpace X] [StandardBorelSpace X] (μ : Measure X) [SigmaFinite μ]

/-- Layer 3.5 item 2: Mackey's point realization of a jointly measurable family of
measure-preserving maps satisfying the flow law almost everywhere. -/
theorem exists_conullFlow_realization (T : ℝ → X → X) (hT : Measurable (Function.uncurry T))
    (hpres : ∀ t, MeasurePreserving (T t) μ μ) (hzero : ∀ᵐ x ∂μ, T 0 x = x)
    (hadd : ∀ s t, ∀ᵐ x ∂μ, T (s + t) x = T s (T t x)) :
    ∃ (X₀ : Set X) (Φ : ℝ → X → X), MeasurableSet X₀ ∧ μ X₀ᶜ = 0 ∧
      Measurable (Function.uncurry Φ) ∧ (∀ t, ∀ x ∈ X₀, Φ t x ∈ X₀) ∧
      (∀ x ∈ X₀, Φ 0 x = x) ∧ (∀ s t, ∀ x ∈ X₀, Φ (s + t) x = Φ s (Φ t x)) ∧
      ∀ t, Φ t =ᵐ[μ] T t := by
  sorry

/-- Layer 3.5 item 4: transport of densities by a measure-preserving flow. -/
theorem map_withDensity_flow (Φ : ℝ → X → X) (hΦ : Measurable (Function.uncurry Φ))
    (hpres : ∀ t, MeasurePreserving (Φ t) μ μ) (hinv : ∀ t, Φ (-t) ∘ Φ t =ᵐ[μ] id)
    (hinv' : ∀ t, Φ t ∘ Φ (-t) =ᵐ[μ] id) {W : X → ℝ≥0∞} (hW : Measurable W) (t : ℝ) :
    (μ.withDensity W).map (Φ t) = μ.withDensity (W ∘ Φ (-t)) := by
  sorry

end AEFlows

section Correlations

variable {X : Type*} [MeasurableSpace X] [AddAction ℝ X] (μ : Measure X)

/-- Layer 3.6: the correlation of `f` and `g` at time `t` for a measurable real flow. -/
def flowCorrelation (f g : X → ℂ) (t : ℝ) : ℂ :=
  (∫ x, f (t +ᵥ x) * starRingEnd ℂ (g x) ∂μ) - (∫ x, f x ∂μ) * starRingEnd ℂ (∫ x, g x ∂μ)

variable [MetricSpace X]

/-- Layer 3.6: the Hölder norm `‖f‖_∞ + |f|_θ` used in correlation bounds. -/
def holderNorm (θ : ℝ≥0) (f : X → ℂ) : ℝ :=
  (⨆ x, ‖f x‖) + (nnHolderNorm θ f : ℝ)

/-- Layer 3.6: exponential mixing of a real flow for `θ`-Hölder observables. -/
def IsExponentiallyMixing (θ : ℝ≥0) : Prop :=
  ∃ C κ : ℝ, 0 < κ ∧ ∀ f g : X → ℂ, MemHolder θ f → MemHolder θ g → ∀ t : ℝ, 0 ≤ t →
    ‖flowCorrelation μ f g t‖ ≤ C * holderNorm θ f * holderNorm θ g * Real.exp (-κ * t)

end Correlations

section RelativeEntropy
variable {X : Type*} [mX : MeasurableSpace X] [StandardBorelSpace X]
variable (μ : Measure X) [IsProbabilityMeasure μ]
/-- Layer 4.0 item 3: conditional entropy given a sub-σ-algebra, in its conditional-kernel form
on a standard Borel space (the README defines it through conditional expectations and proves
agreement). -/
def condPartitionEntropy {A : Type*} [Countable A] (ξ : X → A)
    (𝒜 : {m : MeasurableSpace X // m ≤ mX}) : ℝ≥0∞ :=
  ∫⁻ x, countablePartitionEntropy (ProbabilityTheory.condExpKernel μ 𝒜.1 x) ξ ∂μ
/-- Layer 4.8: relative partition entropy; limit theorems assume forward invariance of conditioning. -/
def relativePartitionEntropyRate (T : X → X) {A : Type*} [Countable A]
    (ξ : X → A) (𝒜 : {m : MeasurableSpace X // m ≤ mX}) : ℝ≥0∞ :=
  ⨅ (n : ℕ) (_ : 0 < n),
    condPartitionEntropy μ (fun x => fun k : Fin n => ξ (T^[k] x)) 𝒜 / n
/-- Relative Kolmogorov–Sinai entropy, retaining infinite values. -/
def relativeMeasureEntropy (T : X → X) (𝒜 : {m : MeasurableSpace X // m ≤ mX}) : ℝ≥0∞ :=
  ⨆ (n : ℕ) (ξ : X → Fin (n + 1)) (_ : Measurable ξ),
    relativePartitionEntropyRate μ T ξ 𝒜
/-- Layer 4.8: entropy addition uses nonnegative extended addition, not subtraction. -/
theorem measureEntropy_factor_add_relative {Y : Type*} [mY : MeasurableSpace Y]
    [StandardBorelSpace Y] (T : X → X) (S : Y → Y)
    (ν : Measure Y) [IsProbabilityMeasure ν] (π : X → Y)
    (hT : MeasurePreserving T μ μ) (hS : MeasurePreserving S ν ν)
    (hπ : IsFactorMap π T S μ ν) :
    measureEntropy μ T = measureEntropy ν S +
      relativeMeasureEntropy μ T ⟨MeasurableSpace.comap π mY, hπ.1.measurable.comap_le⟩ := by
  sorry

end RelativeEntropy

/-- Extended information, with the logarithm and conversion applied before taking limits. -/
def information (p : ℝ≥0∞) : ℝ≥0∞ := (-ENNReal.log p).toENNReal

@[simp] theorem information_zero : information 0 = ⊤ := by simp [information]
@[simp] theorem information_one : information 1 = 0 := by simp [information]

/-! ## Layers 5 and 7: invariant measures, pressure and the variational principle -/

section Topological

variable {X : Type*} [MeasurableSpace X]

/-- The invariant Borel probabilities of `T`, with the weak topology. -/
def invariantProbabilities (T : X → X) : Set (ProbabilityMeasure X) :=
  {ν | MeasurePreserving T (ν : Measure X) (ν : Measure X)}

/-- Probabilities invariant under every parameter of an arbitrary monoid action. -/
def actionInvariantProbabilities (M : Type*) [Monoid M] [MulAction M X] :
    Set (ProbabilityMeasure X) :=
  ⋂ m : M, invariantProbabilities (m • ·)

/-- The probabilities invariant under every parameter of a continuous monoid flow. -/
def flowInvariantProbabilities {τ : Type*} [TopologicalSpace τ] [AddMonoid τ]
    [TopologicalSpace X] (ϕ : Flow τ X) :
    Set (ProbabilityMeasure X) :=
  ⋂ t : τ, invariantProbabilities (ϕ t)

variable [UniformSpace X]

/-- Largest weighted sum `∑_{x ∈ s} exp (S_n φ x)` over `(U, n)`-separated sets. -/
def pressureNetSum (T : X → X) (φ : X → ℝ) (U : SetRel X X) (n : ℕ) : ℝ≥0∞ :=
  ⨆ (s : Finset X) (_ : Dynamics.IsDynNetIn T univ U n s),
    ∑ x ∈ s, ENNReal.ofReal (Real.exp (birkhoffSum T φ n x))

/-- Topological pressure, by separated sets, mirroring Mathlib's `netEntropyEntourage`. -/
def topologicalPressure (T : X → X) (φ : X → ℝ) : EReal :=
  ⨆ U ∈ 𝓤 X, ExpGrowth.expGrowthSup fun n : ℕ => pressureNetSum T φ U n

/-- Layer 5.4: the pressure of the zero potential is the topological entropy. -/
theorem topologicalPressure_zero [CompactSpace X] {T : X → X} (hT : Continuous T) :
    topologicalPressure T 0 = Dynamics.coverEntropy T univ := by
  sorry

end Topological

section Variational

variable {X : Type*} [MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]

/-- Layer 7.1: the variational principle for pressure. -/
theorem topologicalPressure_eq_iSup {T : X → X} (hT : Continuous T) (φ : C(X, ℝ)) :
    topologicalPressure T φ =
      ⨆ ν ∈ invariantProbabilities T,
        ((measureEntropy (ν : Measure X) T : EReal) + ((∫ x, φ x ∂(ν : Measure X) : ℝ) : EReal)) := by
  sorry

/-- Layer 7.2: the variational principle for entropy (Dinaburg, Goodman, Goodwyn, Misiurewicz). -/
theorem coverEntropy_eq_iSup {T : X → X} (hT : Continuous T) :
    Dynamics.coverEntropy T univ =
      ⨆ ν ∈ invariantProbabilities T, (measureEntropy (ν : Measure X) T : EReal) := by
  sorry

/-- Layer 5.5: the time-1 presentation of flow pressure. Its agreement with the independent
Bowen-ball definition is a README target. -/
def flowTopologicalPressure (ϕ : Flow ℝ X) (F : C(X, ℝ)) : EReal :=
  topologicalPressure (ϕ 1) (fun x => ∫ s in (0 : ℝ)..1, F (ϕ s x))

/-- Layer 7.3: the extended-valued flow variational principle. -/
theorem flowTopologicalPressure_eq_iSup [Nonempty X] (ϕ : Flow ℝ X) (F : C(X, ℝ)) :
    flowTopologicalPressure ϕ F =
      ⨆ ν ∈ flowInvariantProbabilities ϕ,
        ((measureEntropy (ν : Measure X) (ϕ 1) : EReal) +
          ((∫ x, F x ∂(ν : Measure X) : ℝ) : EReal)) := by
  sorry

/-- Layer 8.1: equilibrium states of a potential. -/
def IsEquilibriumState (T : X → X) (φ : C(X, ℝ)) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ invariantProbabilities T ∧
    (measureEntropy (ν : Measure X) T : EReal) + ((∫ x, φ x ∂(ν : Measure X) : ℝ) : EReal) =
      topologicalPressure T φ

/-- Layer 8.1: measures of maximal entropy. -/
def IsMeasureOfMaximalEntropy (T : X → X) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ invariantProbabilities T ∧
    (measureEntropy (ν : Measure X) T : EReal) = Dynamics.coverEntropy T univ

/-- Layer 8.1: equilibrium states of a continuous flow, through the time-1 map and the averaged
potential (equal to the flow pressure by Layer 5.5). -/
def IsFlowEquilibriumState (ϕ : Flow ℝ X) (F : C(X, ℝ)) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ flowInvariantProbabilities ϕ ∧
    (measureEntropy (ν : Measure X) (ϕ 1) : EReal) + ((∫ x, F x ∂(ν : Measure X) : ℝ) : EReal) =
      flowTopologicalPressure ϕ F

theorem isMeasureOfMaximalEntropy_iff {T : X → X} (hT : Continuous T)
    (ν : ProbabilityMeasure X) :
    IsMeasureOfMaximalEntropy T ν ↔ IsEquilibriumState T 0 ν := by
  sorry

/-- Layer 8.2: existence of equilibrium states under upper semicontinuity of the entropy map. -/
theorem exists_isEquilibriumState [Nonempty X] {T : X → X} (hT : Continuous T)
    (husc : UpperSemicontinuousOn
      (fun ν : ProbabilityMeasure X => measureEntropy (ν : Measure X) T)
      (invariantProbabilities T))
    (φ : C(X, ℝ)) : ∃ ν, IsEquilibriumState T φ ν := by
  sorry

/-- Layer 8.1: under finite topological entropy, equilibrium states are the measures attaining the
real supremum of the textbook definition. -/
theorem isEquilibriumState_iff_toReal {T : X → X} (hT : Continuous T)
    (hfin : Dynamics.coverEntropy T univ < ⊤) (φ : C(X, ℝ)) (ν : ProbabilityMeasure X) :
    IsEquilibriumState T φ ν ↔ ν ∈ invariantProbabilities T ∧
      (measureEntropy (ν : Measure X) T).toReal + ∫ x, φ x ∂(ν : Measure X) =
        ⨆ μ : invariantProbabilities T,
          (measureEntropy ((μ : ProbabilityMeasure X) : Measure X) T).toReal +
            ∫ x, φ x ∂((μ : ProbabilityMeasure X) : Measure X) := by
  sorry

/-- Layer 8.1: measures of maximal entropy under finite topological entropy. -/
theorem isMeasureOfMaximalEntropy_iff_toReal {T : X → X} (hT : Continuous T)
    (hfin : Dynamics.coverEntropy T univ < ⊤) (ν : ProbabilityMeasure X) :
    IsMeasureOfMaximalEntropy T ν ↔ ν ∈ invariantProbabilities T ∧
      (measureEntropy (ν : Measure X) T).toReal = (Dynamics.coverEntropy T univ).toReal := by
  sorry

end Variational

section ThermodynamicFormalism

variable {X : Type*} [MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]

/-- Layer 8.4: Bowen's specification property with periodic shadowing, for a homeomorphism. -/
def HasSpecification (T : X ≃ₜ X) : Prop :=
  ∀ ε > 0, ∃ M : ℕ, ∀ (k : ℕ) (x : Fin k → X) (a b : Fin k → ℤ),
    (∀ i, a i ≤ b i) → (∀ i j : Fin k, i < j → b i + M ≤ a j) →
    ∀ (p : ℕ) (i₀ i₁ : Fin k), (∀ i, a i₀ ≤ a i ∧ b i ≤ b i₁) → b i₁ - a i₀ + M ≤ p →
      ∃ y : X, (T ^ p) y = y ∧ ∀ i, ∀ n ∈ Set.Icc (a i) (b i),
        dist ((T ^ n) y) ((T ^ n) (x i)) ≤ ε

/-- Layer 8.4: the Bowen property of a potential. -/
def HasBowenProperty (T : X → X) (φ : X → ℝ) : Prop :=
  ∃ ε > 0, ∃ K : ℝ, ∀ (n : ℕ) (x y : X), (∀ k < n, dist (T^[k] x) (T^[k] y) ≤ ε) →
    |birkhoffSum T φ n x - birkhoffSum T φ n y| ≤ K

/-- Layer 8.4: Bowen's theorem: expansive homeomorphisms with specification have a unique
equilibrium state for every potential with the Bowen property. Expansiveness is §5.3's
`IsExpansive`, stated here through its metric form. -/
theorem existsUnique_isEquilibriumState [Nonempty X] (T : X ≃ₜ X)
    (hexp : ∃ δ > 0, ∀ x y : X, x ≠ y → ∃ n : ℤ, δ < dist ((T ^ n) x) ((T ^ n) y))
    (hspec : HasSpecification T) (φ : C(X, ℝ)) (hφ : HasBowenProperty T φ) :
    ∃! ν, IsEquilibriumState T φ ν := by
  sorry

/-- Layer 8.5: a function differentiable along flow lines with continuous derivative `G`
satisfies the integrated coboundary identity of §8.2 item 6. -/
theorem flow_coboundary_of_hasDerivAt (ϕ : Flow ℝ X) {u G : X → ℝ} (hu : Continuous u)
    (hG : Continuous G) (hderiv : ∀ x, HasDerivAt (fun t => u (ϕ t x)) (G x) 0) (t : ℝ) (x : X) :
    u (ϕ t x) - u x = ∫ s in (0 : ℝ)..t, G (ϕ s x) := by
  sorry

end ThermodynamicFormalism

section SubshiftsOfFiniteType

variable {ι : Type*} [Fintype ι]

/-- Layer 8.4: the two-sided subshift of finite type with transition relation `A`. -/
def sftTwoSided (A : ι → ι → Bool) : Set (ℤ → ι) :=
  {x | ∀ n, A (x n) (x (n + 1)) = true}

/-- Layer 8.4: the one-sided subshift of finite type with transition relation `A`. -/
def sftOneSided (A : ι → ι → Bool) : Set (ℕ → ι) :=
  {x | ∀ n, A (x n) (x (n + 1)) = true}

/-- The sequence `(i, x 0, x 1, …)`. -/
def consSeq (i : ι) (x : ℕ → ι) : ℕ → ι
  | 0 => i
  | n + 1 => x n

/-- Layer 8.6: the Ruelle transfer operator of a potential on a one-sided subshift of finite type,
`(L f) x = ∑_{σ y = x} exp (φ y) f y`, the sum over admissible first symbols. -/
def ruelleOperator (A : ι → ι → Bool) (φ : (ℕ → ι) → ℝ) (f : (ℕ → ι) → ℝ) (x : ℕ → ι) : ℝ :=
  ∑ i : ι, if A i (x 0) = true then Real.exp (φ (consSeq i x)) * f (consSeq i x) else 0

/-- Layer 8.6 check: for the full shift and a potential depending on the first symbol, the
constant function `1` is an eigenfunction with eigenvalue `∑ i, exp (w i)`. -/
theorem ruelleOperator_fullShift_one (w : ι → ℝ) (x : ℕ → ι) :
    ruelleOperator (fun _ _ => true) (fun y => w (y 0)) (fun _ => 1) x = ∑ i, Real.exp (w i) := by
  sorry

end SubshiftsOfFiniteType

section MeasurableFlowEntropy

variable {X : Type*} [MeasurableSpace X] [StandardBorelSpace X]
  [AddAction ℝ X] [MeasurableVAdd₂ ℝ X]

/-- Layer 6.4: Abramov scaling for jointly measurable real flows. -/
theorem measureEntropy_flow (μ : Measure X) [IsProbabilityMeasure μ]
    [VAddInvariantMeasure ℝ X μ] (t : ℝ) :
    measureEntropy μ (t +ᵥ ·) =
      ENNReal.ofReal |t| * measureEntropy μ ((1 : ℝ) +ᵥ ·) := by
  sorry

end MeasurableFlowEntropy

/-! ## Layer 9: polygonal billiards -/

section Billiards

open ComplexConjugate

/-- A simple polygon in `ℂ`: at least three vertices, nondegenerate edges and a boundary that is a
Jordan curve. -/
structure SimplePolygon (n : ℕ) where
  toPolygon : Polygon ℂ n
  three_le : 3 ≤ n
  hasNondegenerateEdges : toPolygon.HasNondegenerateEdges
  isJordanCurve : TauCeti.IsJordanCurve (toPolygon.boundary ℝ)
  injective_vertices : Function.Injective toPolygon
  sides_meet_at_endpoints : ∀ i j : Fin n, i ≠ j →
    segment ℝ (toPolygon i) (toPolygon (finRotate n i)) ∩
        segment ℝ (toPolygon j) (toPolygon (finRotate n j)) ⊆
      ({toPolygon i, toPolygon (finRotate n i)} : Set ℂ) ∩
        {toPolygon j, toPolygon (finRotate n j)}

namespace SimplePolygon

variable {n : ℕ} (P : SimplePolygon n)

/-- The billiard table: the closed region bounded by the polygon. -/
def table : Set ℂ := TauCeti.filledHull (P.toPolygon.boundary ℝ)

/-- The vector along the `i`-th side. -/
def sideVector (i : Fin n) : ℂ := P.toPolygon (finRotate n i) - P.toPolygon i

end SimplePolygon

/-- Layer 9.1: an outer polygon and finitely many disjoint polygonal holes. -/
structure PolygonalDomain where
  outerSize : ℕ
  outer : SimplePolygon outerSize
  holeCount : ℕ
  holeSize : Fin holeCount → ℕ
  hole : (i : Fin holeCount) → SimplePolygon (holeSize i)
  holes_inside : ∀ i, (hole i).table ⊆ interior outer.table
  holes_disjoint : Pairwise fun i j => Disjoint (hole i).table (hole j).table
  connected_interior : IsConnected (interior (outer.table \ ⋃ i, interior (hole i).table))

namespace PolygonalDomain

variable (P : PolygonalDomain)

/-- The closed table retains the boundaries of its holes. -/
def table : Set ℂ := P.outer.table \ ⋃ i, interior (P.hole i).table

/-- All boundary components, with `none` denoting the outer component. -/
def component : Option (Fin P.holeCount) → Σ n, SimplePolygon n
  | none => ⟨P.outerSize, P.outer⟩
  | some i => ⟨P.holeSize i, P.hole i⟩

/-- A side is indexed by its boundary component and its position in that component. -/
abbrev Side := Σ i : Option (Fin P.holeCount), Fin (P.component i).1

/-- Side endpoints. -/
def sideStart (i : P.Side) : ℂ := (P.component i.1).2.toPolygon i.2

def sideEnd (i : P.Side) : ℂ :=
  (P.component i.1).2.toPolygon (finRotate (P.component i.1).1 i.2)

/-- The vector along a side of either an outer or an inner boundary. -/
def sideVector (i : P.Side) : ℂ := P.sideEnd i - P.sideStart i

/-- Elastic reflection at a point in the relative interior of any boundary side. -/
def reflectionRel (a b : ℂ × Circle) : Prop :=
  a.1 = b.1 ∧ ∃ i : P.Side, a.1 ∈ openSegment ℝ (P.sideStart i) (P.sideEnd i) ∧
    (b.2 : ℂ) = P.sideVector i ^ 2 * conj (a.2 : ℂ) / ((‖P.sideVector i‖ : ℂ) ^ 2)

/-- The phase space `(P × S¹)/∼`. -/
def phaseSetoid : Setoid {x : ℂ × Circle // x.1 ∈ P.table} :=
  Relation.EqvGen.setoid fun a b => P.reflectionRel a.1 b.1

/-- The phase space of the billiard, with the quotient σ-algebra. -/
abbrev PhaseSpace : Type := Quotient P.phaseSetoid

/-- Arclength measure on the circle of directions, of total mass `2π`. -/
def arclength : Measure Circle :=
  ((volume : Measure ℝ).restrict (Ico 0 (2 * Real.pi))).map Circle.exp

/-- The normalized area × arclength pushforward to the phase space. -/
def liouvilleMeasure : Measure P.PhaseSpace :=
  (ENNReal.ofReal (2 * Real.pi * (volume P.table).toReal))⁻¹ •
    (((volume : Measure ℂ).prod arclength).comap (Subtype.val)).map (Quotient.mk P.phaseSetoid)

/-- Layer 9.3: a total extension of the regular billiard flow fixes the singular set.
The README defines the singular set geometrically. This selected signature records group law,
invariance, free flight, the actual collision state and the reflected outgoing segment. -/
theorem exists_billiardFlow :
    ∃ (S : Set P.PhaseSpace) (F : ℝ → P.PhaseSpace → P.PhaseSpace),
      MeasurableSet S ∧ P.liouvilleMeasure S = 0 ∧
      (∀ x, F 0 x = x) ∧ (∀ s t x, F (s + t) x = F s (F t x)) ∧
      Measurable (Function.uncurry F) ∧
      (∀ t, MeasurePreserving (F t) P.liouvilleMeasure P.liouvilleMeasure) ∧
      (∀ t, F t '' S = S) ∧ (∀ t x, x ∈ S → F t x = x) ∧
      (∀ (p : ℂ) (hp : p ∈ interior P.table) (v : Circle) (t : ℝ) (ht : 0 ≤ t)
        (hseg : ∀ s ∈ Icc 0 t, p + s * (v : ℂ) ∈ interior P.table)
        (hx : Quotient.mk P.phaseSetoid ⟨(p, v), interior_subset hp⟩ ∉ S),
          F t (Quotient.mk P.phaseSetoid ⟨(p, v), interior_subset hp⟩) =
            Quotient.mk P.phaseSetoid
              ⟨(p + t * (v : ℂ), v), interior_subset (hseg t ⟨ht, le_rfl⟩)⟩) ∧
      (∀ (p : ℂ) (hp : p ∈ interior P.table) (v : Circle)
        (hx : Quotient.mk P.phaseSetoid ⟨(p, v), interior_subset hp⟩ ∉ S)
        (i : P.Side) (τ : ℝ) (hτ : 0 < τ)
        (hflight : ∀ s ∈ Ico 0 τ, p + s * (v : ℂ) ∈ interior P.table)
        (hside : p + τ * (v : ℂ) ∈ openSegment ℝ (P.sideStart i) (P.sideEnd i))
        (hq : p + τ * (v : ℂ) ∈ P.table),
          F τ (Quotient.mk P.phaseSetoid ⟨(p, v), interior_subset hp⟩) =
            Quotient.mk P.phaseSetoid ⟨(p + τ * (v : ℂ), v), hq⟩ ∧
          ∃ v' : Circle,
            (v' : ℂ) = P.sideVector i ^ 2 * conj (v : ℂ) / ((‖P.sideVector i‖ : ℂ) ^ 2) ∧
            ∃ ε : ℝ, 0 < ε ∧
              ∀ s : ℝ, 0 < s → s ≤ ε →
                ∃ hs : p + τ * (v : ℂ) + s * (v' : ℂ) ∈ interior P.table,
                  F (τ + s) (Quotient.mk P.phaseSetoid ⟨(p, v), interior_subset hp⟩) =
                    Quotient.mk P.phaseSetoid
                      ⟨(p + τ * (v : ℂ) + s * (v' : ℂ), v'), interior_subset hs⟩) := by
  sorry

end PolygonalDomain

end Billiards

end TauCetiRoadmap.ClassicalErgodicTheory
