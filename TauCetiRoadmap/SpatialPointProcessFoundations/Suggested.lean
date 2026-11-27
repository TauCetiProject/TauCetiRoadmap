module

public import Mathlib
public import TauCeti.Probability.Distributions.CompoundPoisson.Basic

/-!
# Spatial point process foundations: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Local copies of Tau Ceti's point-process library. The definitions of Tau Ceti's library of random
measures and Poisson processes (commit `d395922`) are copied with their bodies, at their short
names in this roadmap's namespace, each with a docstring naming the Tau Ceti declaration and
module it copies: `expNeg` (`ENNReal.expNeg`), `IsIntegerValued` and `laplaceFunctional` (in
`MeasureTheory.Measure`), `IsPoissonRandomMeasure` and `finitePoissonLaw` (in
`TauCeti.Probability`), and `finitePoissonLawOf`, `poissonPiece` and `poissonLaw` (in
`MeasureTheory.Measure`). The private abbreviation `poissonPieceLaw` of Tau Ceti's
`poissonLaw` is unfolded in the copy. The two instances that `poissonLaw` needs are proved here as
supporting steps.

Every other definition is owned by this roadmap and is free of `sorry`: the carriers
`LocallyFiniteMeasure`, `PointMeasure`, `MarkedLocallyFiniteMeasure`, `MarkedPointMeasure`, the
vague topology, counts, restriction and tuples (Layer 1); `intensity` (Layer 2); the Campbell
measure and Palm kernels (Layer 3); factorial measures, factorial moment measures, product
densities, Janossy measures and `factorialCountMoment` (Layer 4); `IsPoissonPointProcess`
(Layer 5); markings (Layer 6); the translation action, stationarity, `intensityDensity` and the
reduced second factorial moment measure (Layer 7); and the stationary Palm probability (Layer 8).
The proof fields of `PointMeasure.restrict`, `PointMeasure.ofTuple` and the two translation
actions are proved.

The implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Set Filter Topology Function
open scoped ENNReal NNReal CompactlySupported Pointwise

attribute [local instance] Classical.propDecidable

namespace TauCetiRoadmap.SpatialPointProcessFoundations

open TauCeti.Probability

/-! ## Local copies of Tau Ceti's point-process library

Each copy keeps the body of the Tau Ceti declaration named in its docstring, at the same short
name in this roadmap's namespace, so that the file still compiles once the pin contains the
library. -/

section Copies

variable {Ω X : Type*} [MeasurableSpace Ω] [MeasurableSpace X]

/-- Local copy of `expNeg` (Tau Ceti, `TauCeti.Analysis.SpecialFunctions.Exp.Negative`):
the negative exponential, with value zero at infinity. -/
def expNeg (x : ℝ≥0∞) : ℝ≥0 := (EReal.exp (-x.toEReal)).toNNReal

/-- Local copy of `MeasureTheory.Measure.IsIntegerValued` (Tau Ceti,
`TauCeti.MeasureTheory.Measure.IntegerValued.Basic`): a measure is integer-valued if every
measurable set of finite mass has natural-number mass. Sets of infinite mass are allowed, and
multiplicities need not be at most one. -/
def IsIntegerValued (μ : Measure X) : Prop :=
  ∀ ⦃A : Set X⦄, MeasurableSet A → μ A < ∞ → ∃ n : ℕ, μ A = n

/-- Local copy of `MeasureTheory.Measure.laplaceFunctional` (Tau Ceti,
`TauCeti.Probability.RandomMeasure.LaplaceFunctional`): the Laplace functional of a random
measure, with `exp (-∞) = 0`. -/
def laplaceFunctional (P : Measure Ω) (N : Ω → Measure X) (f : X → ℝ≥0∞) : ℝ≥0∞ :=
  ∫⁻ ω, (expNeg (∫⁻ x, f x ∂N ω) : ℝ≥0∞) ∂P

/-- Local copy of `TauCeti.Probability.IsPoissonRandomMeasure` (Tau Ceti,
`TauCeti.Probability.PointProcess.Poisson.Basic`): a measurable random measure with independent
Poisson counts on disjoint measurable sets of finite intensity and almost surely infinite counts
on measurable sets of infinite intensity. No topology or simplicity assumption is imposed. -/
def IsPoissonRandomMeasure (P : Measure Ω) (N : Ω → Measure X) (Λ : Measure X) : Prop :=
  Measurable N ∧
    (∀ (n : ℕ) (A : Fin n → Set X), (∀ i, MeasurableSet (A i) ∧ Λ (A i) < ∞) →
      Pairwise (Disjoint on A) →
        iIndepFun (fun i ω => N ω (A i)) P ∧
          ∀ i, HasLaw (fun ω => N ω (A i))
            ((poissonMeasure (Λ (A i)).toNNReal).map (Nat.cast : ℕ → ℝ≥0∞)) P)
    ∧ ∀ A, MeasurableSet A → Λ A = ∞ → ∀ᵐ ω ∂P, N ω A = ∞

/-- Local copy of `TauCeti.Probability.finitePoissonLaw` (Tau Ceti,
`TauCeti.Probability.PointProcess.Poisson.Finite`): the law of a Poisson number of independent
locations with probability law `Q`, retaining multiplicities; `r` is the mean of the Poisson
count. It specializes `compoundPoissonMeasure` to Dirac-measure jumps. For non-probability `Q`,
this still denotes the convolution-power mixture, not necessarily a probability measure. -/
noncomputable def finitePoissonLaw (r : ℝ≥0) (Q : Measure X) : Measure (Measure X) :=
  compoundPoissonMeasure r (Q.map Measure.dirac)

/-- Local copy of `MeasureTheory.Measure.finitePoissonLawOf` (Tau Ceti,
`TauCeti.Probability.PointProcess.Poisson.Finite`): use the total mass of `μ` as Poisson rate
and its normalization as location law. For finite `μ`, this samples with intensity `μ`. Zero or
infinite total mass gives the empty configuration; the intensity identities require finite
mass. -/
noncomputable def finitePoissonLawOf (μ : Measure X) : Measure (Measure X) :=
  finitePoissonLaw (μ univ).toNNReal ((μ univ)⁻¹ • μ)

/-- Local copy of `MeasureTheory.Measure.poissonPiece` (Tau Ceti,
`TauCeti.Probability.PointProcess.Poisson.Construction`): the finite intensity on the `n`th
piece of the disjointed spanning partition used by `poissonLaw`. -/
def poissonPiece (Λ : Measure X) [SigmaFinite Λ] (n : ℕ) : Measure X :=
  Λ.restrict (disjointed (spanningSets Λ) n)

/-- Supporting step (Tau Ceti proves it in the same module): each sampling piece has finite
intensity. -/
instance (Λ : Measure X) [SigmaFinite Λ] (n : ℕ) :
    IsFiniteMeasure (poissonPiece Λ n) := by
  apply isFiniteMeasure_restrict.mpr
  exact ne_top_of_le_ne_top (measure_spanningSets_lt_top Λ n).ne
    (measure_mono (disjointed_subset _ _))

/-- Supporting step: a compound Poisson law of rate zero is a probability measure, whatever the
jump measure. -/
theorem isProbabilityMeasure_compoundPoissonMeasure_zero {α : Type*} [MeasurableSpace α]
    [AddMonoid α] (ν : Measure α) : IsProbabilityMeasure (compoundPoissonMeasure 0 ν) := by
  rw [compoundPoissonMeasure_def]
  have : poissonMeasure 0 = Measure.dirac 0 := by
    ext1 s hs
    rw [poissonMeasure, Measure.sum_apply _ hs, tsum_eq_single 0]
    · simp [Measure.dirac_apply' _ hs]
    · intro n hn
      simp [hn]
  rw [this, Measure.dirac_bind Measurable.of_discrete]
  simp only [Measure.convolutionPower_zero]
  infer_instance

/-- Supporting step (Tau Ceti proves it in `TauCeti.Probability.PointProcess.Poisson.Finite`):
normalized finite sampling is a probability law, including for zero intensity. -/
instance (μ : Measure X) [IsFiniteMeasure μ] : IsProbabilityMeasure (finitePoissonLawOf μ) := by
  by_cases hμ : μ = 0
  · subst μ
    rw [finitePoissonLawOf, finitePoissonLaw, FunLike.coe_zero, Pi.zero_apply,
      ENNReal.toNNReal_zero]
    exact isProbabilityMeasure_compoundPoissonMeasure_zero _
  · have hne : μ univ ≠ 0 := by simpa using hμ
    have : IsProbabilityMeasure ((μ univ)⁻¹ • μ) :=
      ⟨by simp [ENNReal.inv_mul_cancel hne (measure_ne_top μ univ)]⟩
    exact isProbabilityMeasure_compoundPoissonMeasure _ _

/-- Local copy of `MeasureTheory.Measure.poissonLaw` (Tau Ceti,
`TauCeti.Probability.PointProcess.Poisson.Construction`, with its private abbreviation
`poissonPieceLaw` unfolded): sample independently on the finite pieces of a measurable partition
of `Λ`, then superpose the samples. The rate on each piece is its mass, including zero-mass
pieces. -/
def poissonLaw (Λ : Measure X) [SigmaFinite Λ] : Measure (Measure X) :=
  (Measure.infinitePi (fun n => finitePoissonLawOf (poissonPiece Λ n))).map Measure.sum

end Copies

/-! ## Layer 1: carriers -/

section Carriers

/-- 1.1: locally finite measures, finite on compact sets. -/
def LocallyFiniteMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ}

/-- 1.1: point measures, the locally finite integer-valued measures. -/
def PointMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ ∧ IsIntegerValued μ}

/-- 1.1: marked locally finite measures, finite on `K × univ` for compact `K`. -/
def MarkedLocallyFiniteMeasure (S E : Type*) [TopologicalSpace S] [MeasurableSpace S]
    [MeasurableSpace E] :=
  {μ : Measure (S × E) // ∀ K : Set S, IsCompact K → μ (K ×ˢ Set.univ) < ∞}

/-- 1.1: marked point measures. -/
def MarkedPointMeasure (S E : Type*) [TopologicalSpace S] [MeasurableSpace S]
    [MeasurableSpace E] :=
  {μ : Measure (S × E) // (∀ K : Set S, IsCompact K → μ (K ×ˢ Set.univ) < ∞) ∧ IsIntegerValued μ}

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

instance : CoeOut (LocallyFiniteMeasure S) (Measure S) := ⟨Subtype.val⟩
instance : CoeOut (PointMeasure S) (Measure S) := ⟨Subtype.val⟩

/-- 1.1: a point measure as a locally finite measure. -/
def PointMeasure.toLocallyFinite (ξ : PointMeasure S) : LocallyFiniteMeasure S := ⟨ξ.1, ξ.2.1⟩

instance : Coe (PointMeasure S) (LocallyFiniteMeasure S) := ⟨PointMeasure.toLocallyFinite⟩

/-- 1.2: the vague topology, the coarsest one making `μ ↦ ∫ f dμ` continuous for every
compactly supported continuous `f`. -/
instance : TopologicalSpace (LocallyFiniteMeasure S) :=
  ⨅ f : C_c(S, ℝ), TopologicalSpace.induced
    (fun μ : LocallyFiniteMeasure S => ∫ x, f x ∂(μ : Measure S)) inferInstance

instance : MeasurableSpace (LocallyFiniteMeasure S) := borel _
instance : BorelSpace (LocallyFiniteMeasure S) := ⟨rfl⟩

/-- 1.2: point measures carry the subspace topology. -/
instance : TopologicalSpace (PointMeasure S) :=
  TopologicalSpace.induced PointMeasure.toLocallyFinite inferInstance

instance : MeasurableSpace (PointMeasure S) := borel _
instance : BorelSpace (PointMeasure S) := ⟨rfl⟩

/-- 1.1: the count of a point measure on a set, in `ℕ∞`. -/
def PointMeasure.count (ξ : PointMeasure S) (A : Set S) : ℕ∞ :=
  if (ξ : Measure S) A = ∞ then ⊤ else (⌊((ξ : Measure S) A).toNNReal⌋₊ : ℕ∞)

/-- 1.1: a point measure is simple when no point has multiplicity larger than one. -/
def PointMeasure.IsSimple (ξ : PointMeasure S) : Prop := ∀ x, (ξ : Measure S) {x} ≤ 1

/-- 1.3: the restriction of a point measure to a measurable set. -/
def PointMeasure.restrict (ξ : PointMeasure S) {A : Set S} (hA : MeasurableSet A) :
    PointMeasure S :=
  ⟨(ξ : Measure S).restrict A,
    by
      have : IsFiniteMeasureOnCompacts (ξ : Measure S) := ξ.2.1
      infer_instance,
    fun B hB hfin => by
      rw [Measure.restrict_apply hB] at hfin ⊢
      exact ξ.2.2 (hB.inter hA) hfin⟩

/-- Local copy of `configurationMeasure` (GeometryOfNumbersAndQuadraticArithmetic §4.2, where it
is defined in prose): the finite point measure `∑_{i < n} δ_{xᵢ}` of a configuration `(n, x)` on
an arbitrary measurable space, keeping a repeated point with its multiplicity. -/
def configurationMeasure {X : Type*} [MeasurableSpace X] (p : Σ n : ℕ, Fin n → X) : Measure X :=
  ∑ i, Measure.dirac (p.2 i)

/-- Supporting step, the evaluation target `configurationMeasure_apply` of
GeometryOfNumbersAndQuadraticArithmetic §4.2, proved here because `PointMeasure.ofTuple` needs
it: on a measurable set the mass is the number of entries in the set. -/
theorem configurationMeasure_apply {X : Type*} [MeasurableSpace X] {n : ℕ} (x : Fin n → X)
    {A : Set X} (hA : MeasurableSet A) :
    configurationMeasure ⟨n, x⟩ A = ((Finset.univ.filter fun i => x i ∈ A).card : ℝ≥0∞) := by
  simp [configurationMeasure, Measure.dirac_apply' _ hA, Set.indicator_apply, Finset.sum_boole]

/-- 1.3: the point measure of a finite tuple. -/
def PointMeasure.ofTuple {n : ℕ} (x : Fin n → S) : PointMeasure S :=
  ⟨configurationMeasure ⟨n, x⟩,
    ⟨fun K _ => by
      calc configurationMeasure ⟨n, x⟩ K ≤ configurationMeasure ⟨n, x⟩ univ :=
            measure_mono (subset_univ K)
        _ < ∞ := by
          rw [configurationMeasure_apply x MeasurableSet.univ]; exact ENNReal.natCast_lt_top _⟩,
    fun A hA _ => ⟨_, configurationMeasure_apply x hA⟩⟩

/-- 1.1: the count is the mass on measurable sets, infinite counts included. -/
theorem PointMeasure.coe_count (ξ : PointMeasure S) {A : Set S} (hA : MeasurableSet A) :
    ((ξ.count A : ℕ∞) : ℝ≥0∞) = (ξ : Measure S) A := by
  sorry

/-- 1.1: every point measure is a countable sum of unit point masses. -/
theorem PointMeasure.exists_eq_sum_dirac [Nonempty S] (ξ : PointMeasure S) :
    ∃ (κ : ℕ∞) (x : ℕ → S),
      (ξ : Measure S) =
        Measure.sum fun n : ℕ => if (n : ℕ∞) < κ then Measure.dirac (x n) else 0 := by
  sorry

/-- 1.3: the point measure of a tuple is simple exactly when the tuple is injective. -/
theorem PointMeasure.isSimple_ofTuple_iff {n : ℕ} (x : Fin n → S) :
    (PointMeasure.ofTuple x).IsSimple ↔ Injective x := by
  sorry

/-- 1.2: the vague topology on locally finite measures is Polish. -/
theorem polishSpace_locallyFiniteMeasure : PolishSpace (LocallyFiniteMeasure S) := by
  sorry

/-- 1.2: point measures form a closed subspace of the locally finite measures. -/
theorem isClosedEmbedding_toLocallyFinite :
    IsClosedEmbedding (PointMeasure.toLocallyFinite (S := S)) := by
  sorry

/-- 1.2: the Borel σ-algebras of the vague topology are generated by the masses, respectively the
counts, of relatively compact Borel sets. -/
theorem measurableSpace_eq_iSup_comap :
    (inferInstance : MeasurableSpace (LocallyFiniteMeasure S)) =
        ⨆ (A : Set S) (_ : MeasurableSet A ∧ IsCompact (closure A)),
          MeasurableSpace.comap (fun μ : LocallyFiniteMeasure S => (μ : Measure S) A)
            inferInstance ∧
      (inferInstance : MeasurableSpace (PointMeasure S)) =
        ⨆ (A : Set S) (_ : MeasurableSet A ∧ IsCompact (closure A)),
          MeasurableSpace.comap (fun ξ : PointMeasure S => ξ.count A) inferInstance := by
  sorry

end Carriers

/-! ## Layer 2: laws of random measures -/

section Laws

variable {Ω Ω' X : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω'] [MeasurableSpace X]

/-- 2.1: the intensity measure of a random measure, `B ↦ 𝔼 N(B)`, as a mixture. -/
def intensity (P : Measure Ω) (N : Ω → Measure X) : Measure X :=
  P.bind N

/-- 2.1, sanity check of `intensity`: Campbell's formula, Mathlib's
`MeasureTheory.Measure.lintegral_bind` after unfolding the definition. -/
theorem lintegral_intensity {P : Measure Ω} {N : Ω → Measure X} (hN : Measurable N)
    {f : X → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ x, f x ∂intensity P N = ∫⁻ ω, ∫⁻ x, f x ∂N ω ∂P := by
  unfold intensity
  exact Measure.lintegral_bind hN.aemeasurable hf.aemeasurable

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- 2.2: the law of a point process is determined by the joint count laws on finite families of
disjoint relatively compact windows. -/
theorem map_eq_of_forall_map_count_eq {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P'] {N : Ω → PointMeasure S} {N' : Ω' → PointMeasure S}
    (hN : Measurable N) (hN' : Measurable N')
    (h : ∀ (n : ℕ) (A : Fin n → Set S), (∀ i, MeasurableSet (A i) ∧ IsCompact (closure (A i))) →
      Pairwise (Disjoint on A) →
        P.map (fun ω i => (N ω).count (A i)) = P'.map (fun ω i => (N' ω).count (A i))) :
    P.map N = P'.map N' := by
  sorry

/-- 2.2: the law of a random measure is determined by its Laplace functional. -/
theorem map_eq_of_laplaceFunctional_eq {P : Measure Ω} {Q : Measure Ω'} [IsFiniteMeasure P]
    {N : Ω → Measure X} {M : Ω' → Measure X} (hN : AEMeasurable N P) (hM : AEMeasurable M Q)
    (h : ∀ f : X → ℝ≥0∞, Measurable f →
      laplaceFunctional P N f = laplaceFunctional Q M f) :
    P.map N = Q.map M := by
  sorry

/-- 2.3: Rényi–Mönch: the law of a simple point process is determined by its void probabilities
on relatively compact windows. -/
theorem map_eq_of_forall_measure_count_eq_zero {P : Measure Ω} {P' : Measure Ω'}
    [IsProbabilityMeasure P] [IsProbabilityMeasure P'] {N : Ω → PointMeasure S}
    {N' : Ω' → PointMeasure S} (hN : Measurable N) (hN' : Measurable N')
    (hs : ∀ᵐ ω ∂P, (N ω).IsSimple) (hs' : ∀ᵐ ω ∂P', (N' ω).IsSimple)
    (h : ∀ A : Set S, MeasurableSet A → IsCompact (closure A) →
      P {ω | (N ω).count A = 0} = P' {ω | (N' ω).count A = 0}) :
    P.map N = P'.map N' := by
  sorry

end Laws

/-! ## Layer 3: Campbell measure and Palm kernels -/

section Palm

variable {Ω X : Type*} [MeasurableSpace Ω] [MeasurableSpace X]

/-- 3.1: the Campbell measure on `X × Measure X`, `C(B × L) = 𝔼[N(B) 1{N ∈ L}]`. -/
def campbellMeasure (P : Measure Ω) (N : Ω → Measure X) : Measure (X × Measure X) :=
  P.bind fun ω => (N ω).map fun x => (x, N ω)

/-- 3.2: `κ` is a Palm kernel of `N`: a Markov kernel disintegrating the Campbell measure against
the intensity measure. -/
def IsPalmKernel (P : Measure Ω) (N : Ω → Measure X) (κ : Kernel X (Measure X)) : Prop :=
  IsMarkovKernel κ ∧ campbellMeasure P N = intensity P N ⊗ₘ κ

/-- 3.2: `κ` is a reduced Palm kernel of `N`: the Campbell–Little–Mecke formula holds with the
point `x` removed from `N`. -/
def IsReducedPalmKernel (P : Measure Ω) (N : Ω → Measure X) (κ : Kernel X (Measure X)) :
    Prop :=
  IsMarkovKernel κ ∧
    ∀ g : X → Measure X → ℝ≥0∞, Measurable (uncurry g) →
      ∫⁻ ω, ∫⁻ x, g x (N ω - Measure.dirac x) ∂N ω ∂P =
        ∫⁻ x, ∫⁻ μ, g x μ ∂κ x ∂intensity P N

/-- 3.1: the Campbell measure of rectangles, and its first marginal is the intensity. -/
theorem campbellMeasure_prod {P : Measure Ω} {N : Ω → Measure X} (hN : Measurable N)
    [SigmaFinite (intensity P N)] {B : Set X} (hB : MeasurableSet B) {L : Set (Measure X)}
    (hL : MeasurableSet L) :
    campbellMeasure P N (B ×ˢ L) = ∫⁻ ω in N ⁻¹' L, N ω B ∂P ∧
      (campbellMeasure P N).map Prod.fst = intensity P N := by
  sorry

/-- 3.2: a random measure on a Polish space with σ-finite intensity has a Palm kernel. -/
theorem exists_isPalmKernel [TopologicalSpace X] [PolishSpace X] [BorelSpace X]
    {P : Measure Ω} [IsProbabilityMeasure P] {N : Ω → Measure X} (hN : Measurable N)
    [SigmaFinite (intensity P N)] :
    ∃ κ : Kernel X (Measure X), IsPalmKernel P N κ := by
  sorry

/-- 3.2: a random measure on a Polish space with σ-finite intensity has a reduced Palm kernel. -/
theorem exists_isReducedPalmKernel [TopologicalSpace X] [PolishSpace X] [BorelSpace X]
    {P : Measure Ω} [IsProbabilityMeasure P] {N : Ω → Measure X} (hN : Measurable N)
    [SigmaFinite (intensity P N)] :
    ∃ κ : Kernel X (Measure X), IsReducedPalmKernel P N κ := by
  sorry

/-- 3.2: the Campbell–Little–Mecke formula. -/
theorem IsPalmKernel.lintegral {P : Measure Ω} {N : Ω → Measure X} {κ : Kernel X (Measure X)}
    [SigmaFinite (intensity P N)] (hκ : IsPalmKernel P N κ) (hN : Measurable N)
    {g : X → Measure X → ℝ≥0∞}
    (hg : Measurable (uncurry g)) :
    ∫⁻ ω, ∫⁻ x, g x (N ω) ∂N ω ∂P = ∫⁻ x, ∫⁻ μ, g x μ ∂κ x ∂intensity P N := by
  sorry

end Palm

/-! ## Layer 4: factorial measures, moment measures and Janossy measures -/

section Factorial

variable {Ω X : Type*} [MeasurableSpace Ω] [MeasurableSpace X]

/-- 4.1: the factorial powers of a measure, by the recursion
`μ⁽ⁿ⁺¹⁾ = (μ⁽ⁿ⁾ ⊗ μ) ∘ snoc⁻¹ - ∑ⱼ μ⁽ⁿ⁾ ∘ (x ↦ snoc x xⱼ)⁻¹`, starting from the point mass on
the empty tuple. For a point measure `∑ᵢ δ_{xᵢ}` it is the sum of `δ_{(x_{i₁}, …, x_{iₙ})}` over
tuples of distinct indices. -/
def factorialMeasure (μ : Measure X) : (n : ℕ) → Measure (Fin n → X)
  | 0 => Measure.dirac finZeroElim
  | n + 1 =>
      ((factorialMeasure μ n).prod μ).map (fun p => Fin.snoc (α := fun _ => X) p.1 p.2) -
        ∑ j : Fin n, (factorialMeasure μ n).map (fun x => Fin.snoc (α := fun _ => X) x (x j))

/-- 4.2: the `n`th factorial moment measure `B ↦ 𝔼 N⁽ⁿ⁾(B)`. -/
def factorialMomentMeasure (P : Measure Ω) (N : Ω → Measure X) (n : ℕ) : Measure (Fin n → X) :=
  P.bind fun ω => factorialMeasure (N ω) n

/-- 4.2: `ρ` is an `n`th product density (correlation function) of `N` with respect to `μ`. -/
def IsProductDensity (P : Measure Ω) (N : Ω → Measure X) (μ : Measure X) (n : ℕ)
    (ρ : (Fin n → X) → ℝ≥0∞) : Prop :=
  Measurable ρ ∧ factorialMomentMeasure P N n = (Measure.pi fun _ : Fin n => μ).withDensity ρ

/-- 4.3: the `n`th Janossy measure of `N` in the window `W`, normalized by `1/n!`, so that its
total mass is the probability of exactly `n` points in `W`. -/
def janossyMeasure (P : Measure Ω) (N : Ω → Measure X) (W : Set X) (n : ℕ) :
    Measure (Fin n → X) :=
  ((n.factorial : ℝ≥0∞))⁻¹ •
    P.bind fun ω => if N ω W = n then factorialMeasure ((N ω).restrict W) n else 0

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- 4.1: the factorial count moment `∏ⱼ N(Bⱼ)^{(nⱼ)}` of an assignment `c` of `n` indices to
windows, `nⱼ` being the number of indices assigned to `Bⱼ`. -/
def factorialCountMoment (ξ : PointMeasure S) {m n : ℕ} (B : Fin m → Set S) (c : Fin n → Fin m) :
    ℝ≥0∞ :=
  ∏ j, (((ξ.count (B j)).toNat.descFactorial (Finset.univ.filter fun i => c i = j).card : ℕ) :
    ℝ≥0∞)

/-- 4.1: the factorial powers of a tuple measure sum the point masses of the injective
subtuples. -/
theorem factorialMeasure_configurationMeasure {k : ℕ} (x : Fin k → X) (n : ℕ) :
    factorialMeasure (configurationMeasure ⟨k, x⟩) n =
      ∑ σ : Fin n ↪ Fin k, Measure.dirac (x ∘ σ) := by
  sorry

/-- 4.1: on products of disjoint windows of finite mass, the factorial power is the factorial
count moment. -/
theorem factorialMeasure_pi_eq_factorialCountMoment (ξ : PointMeasure S) {m n : ℕ}
    (B : Fin m → Set S) (c : Fin n → Fin m)
    (hB : ∀ j, MeasurableSet (B j) ∧ (ξ : Measure S) (B j) < ∞) (hd : Pairwise (Disjoint on B)) :
    factorialMeasure (ξ : Measure S) n (Set.univ.pi fun i => B (c i)) =
      factorialCountMoment ξ B c := by
  sorry

/-- 4.1: the factorial powers depend measurably on the point measure. -/
theorem measurable_factorialMeasure (n : ℕ) :
    Measurable fun ξ : PointMeasure S => factorialMeasure (ξ : Measure S) n := by
  sorry

/-- 4.1: for an almost surely integer-valued and σ-finite random measure on a countably generated
space, the factorial powers are almost everywhere measurable, so the `bind` in
`factorialMomentMeasure` is not the junk value `0`. -/
theorem aemeasurable_factorialMeasure [MeasurableSpace.CountablyGenerated X] {P : Measure Ω}
    {N : Ω → Measure X} (hN : Measurable N) (hint : ∀ᵐ ω ∂P, IsIntegerValued (N ω))
    (hσ : ∀ᵐ ω ∂P, SigmaFinite (N ω)) (n : ℕ) :
    AEMeasurable (fun ω => factorialMeasure (N ω) n) P := by
  sorry

/-- 4.2: product densities agree with the factorial-count-moment form on disjoint relatively
compact windows, for densities with finite integrals over compact boxes. -/
theorem isProductDensity_iff_factorialCountMoment {P : Measure Ω} {N : Ω → PointMeasure S}
    (hN : Measurable N) (μ : Measure S) [SigmaFinite μ] (n : ℕ) {ρ : (Fin n → S) → ℝ≥0∞}
    (hρ : Measurable ρ)
    (hloc : ∀ K : Set S, IsCompact K →
      ∫⁻ x in Set.univ.pi (fun _ => K), ρ x ∂(Measure.pi fun _ : Fin n => μ) < ∞) :
    IsProductDensity P (fun ω => (N ω : Measure S)) μ n ρ ↔
      ∀ (m : ℕ) (B : Fin m → Set S) (c : Fin n → Fin m),
        (∀ j, MeasurableSet (B j) ∧ IsCompact (closure (B j))) → Pairwise (Disjoint on B) →
          ∫⁻ ω, factorialCountMoment (N ω) B c ∂P =
            ∫⁻ x in Set.univ.pi (fun i => B (c i)), ρ x ∂(Measure.pi fun _ : Fin n => μ) := by
  sorry

/-- 4.2: moment determinacy: point processes with exponential count moments on compact sets and
the same factorial moment measures have the same law. -/
theorem map_eq_of_factorialMomentMeasure_eq {Ω' : Type*} [MeasurableSpace Ω'] {P : Measure Ω}
    {P' : Measure Ω'} [IsProbabilityMeasure P] [IsProbabilityMeasure P'] {N : Ω → PointMeasure S}
    {N' : Ω' → PointMeasure S} (hN : Measurable N) (hN' : Measurable N')
    (hexp : ∀ K : Set S, IsCompact K → ∃ t : ℝ, 0 < t ∧
      ∫⁻ ω, ENNReal.ofReal (Real.exp (t * ((N ω : Measure S) K).toReal)) ∂P < ∞ ∧
        ∫⁻ ω, ENNReal.ofReal (Real.exp (t * ((N' ω : Measure S) K).toReal)) ∂P' < ∞)
    (h : ∀ n, factorialMomentMeasure P (fun ω => (N ω : Measure S)) n =
      factorialMomentMeasure P' (fun ω => (N' ω : Measure S)) n) :
    P.map N = P'.map N' := by
  sorry

/-- 4.3: the total mass of the `n`th Janossy measure is the probability of `n` points in `W`. -/
theorem janossyMeasure_univ {P : Measure Ω} {N : Ω → PointMeasure S} (hN : Measurable N)
    {W : Set S} (hW : MeasurableSet W) (n : ℕ) :
    janossyMeasure P (fun ω => (N ω : Measure S)) W n univ =
      P {ω | (N ω : Measure S) W = n} := by
  sorry

/-- 4.3: the Janossy measures reconstruct the law of the restriction to a relatively compact
window. -/
theorem map_restrict_eq_sum_janossyMeasure {P : Measure Ω} {N : Ω → PointMeasure S}
    (hN : Measurable N) {W : Set S} (hW : MeasurableSet W) (hWc : IsCompact (closure W)) :
    P.map (fun ω => (N ω : Measure S).restrict W) =
      Measure.sum fun n =>
        (janossyMeasure P (fun ω => (N ω : Measure S)) W n).map
          fun x => configurationMeasure ⟨n, x⟩ := by
  sorry

/-- 4.3: the factorial moment measures of the restriction to a window as Janossy series, with
the normalization `J_n/n!`: `α_k(C) = ∑ₙ (k+n)!/n! · J_{k+n}(C × Wⁿ)`. -/
theorem factorialMomentMeasure_restrict_eq_tsum_janossyMeasure {P : Measure Ω}
    {N : Ω → PointMeasure S} (hN : Measurable N) {W : Set S} (hW : MeasurableSet W)
    (hWc : IsCompact (closure W)) (k : ℕ) {C : Set (Fin k → S)} (hC : MeasurableSet C) :
    factorialMomentMeasure P (fun ω => (N ω : Measure S).restrict W) k C =
      ∑' n, ((k + n).factorial / n.factorial : ℝ≥0∞) *
        janossyMeasure P (fun ω => (N ω : Measure S)) W (k + n)
          {x | (fun i : Fin k => x (Fin.castAdd n i)) ∈ C} := by
  sorry

/-- 3.2 (stated after §4.1, which it uses): a reduced Palm kernel into point measures satisfies
the factorial-count-moment form on disjoint relatively compact windows. -/
theorem IsReducedPalmKernel.lintegral_factorialCountMoment {P : Measure Ω}
    {N : Ω → PointMeasure S} (hN : Measurable N) {Q : Kernel S (PointMeasure S)}
    (hQ : IsReducedPalmKernel P (fun ω => (N ω : Measure S))
      (Q.map fun ξ : PointMeasure S => (ξ : Measure S)))
    {A : Set S} (hA : MeasurableSet A) {m n : ℕ} (B : Fin m → Set S) (c : Fin n → Fin m)
    (hB : ∀ j, MeasurableSet (B j) ∧ IsCompact (closure (B j))) (hd : Pairwise (Disjoint on B)) :
    ∫⁻ ω, ∫⁻ x in A, ∏ j, ((Nat.descFactorial
        (((N ω).count (B j)).toNat - (B j).indicator (fun _ => 1) x)
        (Finset.univ.filter fun i => c i = j).card : ℕ) : ℝ≥0∞) ∂(N ω : Measure S) ∂P =
      ∫⁻ x in A, ∫⁻ ξ, factorialCountMoment ξ B c ∂(Q x)
        ∂(intensity P fun ω => (N ω : Measure S)) := by
  sorry

end Factorial

/-! ## Layer 5: Poisson random measures -/

section Poisson

variable {Ω X : Type*} [MeasurableSpace Ω] [MeasurableSpace X]

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- 5.1: the Poisson property of a point process, on the point-measure carrier. -/
abbrev IsPoissonPointProcess (P : Measure Ω) (N : Ω → PointMeasure S) (Λ : Measure S) : Prop :=
  IsPoissonRandomMeasure P (fun ω => (N ω : Measure S)) Λ

/-- 5.1: existence: `poissonLaw Λ` is the law of a Poisson random measure with intensity `Λ`. -/
theorem isPoissonRandomMeasure_poissonLaw (Λ : Measure X) [SigmaFinite Λ] :
    IsPoissonRandomMeasure (poissonLaw Λ) id Λ := by
  sorry

/-- 5.1: uniqueness: every Poisson random measure with σ-finite intensity `Λ` has law
`poissonLaw Λ`. -/
theorem IsPoissonRandomMeasure.map_eq_poissonLaw {P : Measure Ω} {N : Ω → Measure X}
    {Λ : Measure X} [SigmaFinite Λ] (h : IsPoissonRandomMeasure P N Λ) :
    P.map N = poissonLaw Λ := by
  sorry

/-- 5.1: a locally finite intensity has a Poisson law on the point-measure carrier. -/
theorem exists_isPoissonPointProcess (Λ : Measure S) [IsFiniteMeasureOnCompacts Λ] :
    ∃ Q : Measure (PointMeasure S), IsProbabilityMeasure Q ∧ IsPoissonPointProcess Q id Λ := by
  sorry

/-- 5.1: the intensity measure of a Poisson random measure is its parameter. -/
theorem IsPoissonRandomMeasure.intensity_eq {P : Measure Ω} {N : Ω → Measure X} {Λ : Measure X}
    (h : IsPoissonRandomMeasure P N Λ) : intensity P N = Λ := by
  sorry

/-- 5.2: the Laplace functional `exp (-∫ (1 - e^{-f}) dΛ)`. -/
theorem IsPoissonRandomMeasure.laplaceFunctional_eq_expNeg {P : Measure Ω} {N : Ω → Measure X}
    {Λ : Measure X} (h : IsPoissonRandomMeasure P N Λ) {f : X → ℝ≥0∞} (hf : Measurable f) :
    laplaceFunctional P N f =
      (expNeg (∫⁻ x, 1 - (expNeg (f x) : ℝ≥0∞) ∂Λ) : ℝ≥0∞) := by
  sorry

/-- 5.2: void probabilities `P(N(B) = 0) = e^{-Λ(B)}` for every measurable `B`, with
`e^{-∞} = 0`. -/
theorem IsPoissonRandomMeasure.measure_setOf_eq_zero {P : Measure Ω} {N : Ω → Measure X}
    {Λ : Measure X} (h : IsPoissonRandomMeasure P N Λ) {B : Set X} (hB : MeasurableSet B) :
    P {ω | N ω B = 0} = expNeg (Λ B) := by
  sorry

/-- 5.3: the Mecke equation. -/
theorem IsPoissonRandomMeasure.lintegral_mecke {P : Measure Ω} {N : Ω → Measure X}
    {Λ : Measure X} [SFinite Λ] (h : IsPoissonRandomMeasure P N Λ) {f : X → Measure X → ℝ≥0∞}
    (hf : Measurable (uncurry f)) :
    ∫⁻ ω, ∫⁻ x, f x (N ω) ∂N ω ∂P = ∫⁻ x, ∫⁻ ω, f x (N ω + Measure.dirac x) ∂P ∂Λ := by
  sorry

/-- 5.3: the multivariate Mecke equation. -/
theorem IsPoissonRandomMeasure.lintegral_factorialMeasure_mecke
    [MeasurableSpace.CountablyGenerated X] {P : Measure Ω} {N : Ω → Measure X} {Λ : Measure X}
    [SigmaFinite Λ] (h : IsPoissonRandomMeasure P N Λ) (n : ℕ)
    {f : (Fin n → X) → Measure X → ℝ≥0∞} (hf : Measurable (uncurry f)) :
    ∫⁻ ω, ∫⁻ x, f x (N ω) ∂factorialMeasure (N ω) n ∂P =
      ∫⁻ x, ∫⁻ ω, f x (N ω + configurationMeasure ⟨n, x⟩) ∂P ∂Measure.pi fun _ : Fin n => Λ := by
  sorry

/-- 5.3: the Mecke equation characterizes the Poisson random measures with σ-finite intensity. -/
theorem isPoissonRandomMeasure_iff_mecke {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → Measure X} (hN : Measurable N) (Λ : Measure X) [SigmaFinite Λ] :
    IsPoissonRandomMeasure P N Λ ↔
      ∀ f : X → Measure X → ℝ≥0∞, Measurable (uncurry f) →
        ∫⁻ ω, ∫⁻ x, f x (N ω) ∂N ω ∂P = ∫⁻ x, ∫⁻ ω, f x (N ω + Measure.dirac x) ∂P ∂Λ := by
  sorry

/-- 5.3: the factorial moment measures of a Poisson random measure are the powers `Λⁿ`. -/
theorem IsPoissonRandomMeasure.factorialMomentMeasure_eq [MeasurableSpace.CountablyGenerated X]
    {P : Measure Ω} {N : Ω → Measure X} {Λ : Measure X} [SigmaFinite Λ]
    (h : IsPoissonRandomMeasure P N Λ) (n : ℕ) :
    AEMeasurable (fun ω => factorialMeasure (N ω) n) P ∧
      factorialMomentMeasure P N n = Measure.pi fun _ : Fin n => Λ := by
  sorry

/-- 5.3: the Janossy measures of a Poisson random measure in a window of finite intensity. -/
theorem IsPoissonRandomMeasure.janossyMeasure_eq [MeasurableSpace.CountablyGenerated X]
    {P : Measure Ω} {N : Ω → Measure X} {Λ : Measure X} [SigmaFinite Λ]
    (h : IsPoissonRandomMeasure P N Λ) {W : Set X} (hW : MeasurableSet W) (hΛW : Λ W ≠ ∞)
    (n : ℕ) :
    AEMeasurable (fun ω => factorialMeasure ((N ω).restrict W) n) P ∧
      janossyMeasure P N W n =
        ((expNeg (Λ W) : ℝ≥0∞) / n.factorial) •
          Measure.pi fun _ : Fin n => Λ.restrict W := by
  sorry

/-- 5.4: a Poisson process with locally finite intensity is almost surely simple exactly when
its intensity has no atoms. -/
theorem IsPoissonPointProcess.ae_isSimple_iff {P : Measure Ω} {N : Ω → PointMeasure S}
    {Λ : Measure S} [IsFiniteMeasureOnCompacts Λ] (h : IsPoissonPointProcess P N Λ) :
    (∀ᵐ ω ∂P, (N ω).IsSimple) ↔ ∀ x, Λ {x} = 0 := by
  sorry

/-- 5.4: given `m` points in a window of finite intensity, the restriction is a binomial process
of `m` independent points with law `Λ|W / Λ(W)`. -/
theorem IsPoissonRandomMeasure.map_restrict_cond_eq {P : Measure Ω} {N : Ω → Measure X}
    {Λ : Measure X} (h : IsPoissonRandomMeasure P N Λ) {W : Set X} (hW : MeasurableSet W)
    (hΛW : Λ W ≠ ∞) (m : ℕ) :
    (ProbabilityTheory.cond P {ω | N ω W = m}).map (fun ω => (N ω).restrict W) =
      (Measure.pi fun _ : Fin m => (Λ W)⁻¹ • Λ.restrict W).map
        fun x => configurationMeasure ⟨m, x⟩ := by
  sorry

/-- 5.5: Rényi's theorem: a simple point process whose void probabilities on relatively compact
windows are `e^{-Λ(B)}`, for a diffuse locally finite `Λ`, is Poisson with intensity `Λ`. -/
theorem isPoissonPointProcess_of_measure_count_eq_zero {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → PointMeasure S} (hN : Measurable N) {Λ : Measure S} [IsFiniteMeasureOnCompacts Λ]
    (hΛ : ∀ x, Λ {x} = 0) (hs : ∀ᵐ ω ∂P, (N ω).IsSimple)
    (hv : ∀ B : Set S, MeasurableSet B → IsCompact (closure B) →
      P {ω | (N ω).count B = 0} = expNeg (Λ B)) :
    IsPoissonPointProcess P N Λ := by
  sorry

/-- 5.5: Slivnyak–Mecke: on a countably generated space, an almost surely integer-valued random
measure with σ-finite intensity is Poisson exactly when the law of the process itself is a
reduced Palm kernel. -/
theorem isPoissonRandomMeasure_iff_isReducedPalmKernel [MeasurableSpace.CountablyGenerated X]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → Measure X} (hN : Measurable N) (hint : ∀ᵐ ω ∂P, IsIntegerValued (N ω))
    [SigmaFinite (intensity P N)] :
    IsPoissonRandomMeasure P N (intensity P N) ↔
      IsReducedPalmKernel P N (Kernel.const X (P.map N)) := by
  sorry

end Poisson

/-! ## Layer 6: operations -/

section Operations

variable {Ω X Y : Type*} [MeasurableSpace Ω] [MeasurableSpace X] [MeasurableSpace Y]

/-- 6.2: `-log ∫ e^{-g(x, y)} K(x, dy)`, the exponent contributed by a point at `x` to the
conditional Laplace functional of a `K`-marking. -/
def markExponent (K : Kernel X Y) (g : X × Y → ℝ≥0∞) (x : X) : ℝ≥0∞ :=
  (-ENNReal.log (∫⁻ y, (expNeg (g (x, y)) : ℝ≥0∞) ∂K x)).toENNReal

/-- 6.2: `M` is a `K`-marking of `N`: given `N`, the marks are independent with laws `K(x, ·)`,
expressed through the conditional Laplace functional
`𝔼[e^{-∫ g dM} ; N ∈ C] = 𝔼[∏_{x ∈ N} ∫ e^{-g(x, y)} K(x, dy) ; N ∈ C]`. -/
def IsMarking (P : Measure Ω) (N : Ω → Measure X) (M : Ω → Measure (X × Y)) (K : Kernel X Y) :
    Prop :=
  Measurable N ∧ Measurable M ∧
    ∀ C : Set (Measure X), MeasurableSet C → ∀ g : X × Y → ℝ≥0∞, Measurable g →
      ∫⁻ ω in N ⁻¹' C, (expNeg (∫⁻ z, g z ∂M ω) : ℝ≥0∞) ∂P =
        ∫⁻ ω in N ⁻¹' C, (expNeg (∫⁻ x, markExponent K g x ∂N ω) : ℝ≥0∞) ∂P

/-- 6.1: the mapping theorem. -/
theorem IsPoissonRandomMeasure.map {P : Measure Ω} {N : Ω → Measure X} {Λ : Measure X}
    (h : IsPoissonRandomMeasure P N Λ) {f : X → Y} (hf : Measurable f) :
    IsPoissonRandomMeasure P (fun ω => (N ω).map f) (Λ.map f) := by
  sorry

/-- 6.1: the restriction theorem: restrictions to disjoint measurable sets are independent. -/
theorem IsPoissonRandomMeasure.iIndepFun_restrict {ι : Type*} {P : Measure Ω} {N : Ω → Measure X}
    {Λ : Measure X} (h : IsPoissonRandomMeasure P N Λ) {A : ι → Set X}
    (hA : ∀ i, MeasurableSet (A i)) (hd : Pairwise (Disjoint on A)) :
    iIndepFun (fun i ω => (N ω).restrict (A i)) P := by
  sorry

/-- 6.1: the superposition theorem for countable independent families. -/
theorem isPoissonRandomMeasure_sum {ι : Type*} [Countable ι] {P : Measure Ω}
    {N : ι → Ω → Measure X} {Λ : ι → Measure X} (hind : iIndepFun N P)
    (h : ∀ i, IsPoissonRandomMeasure P (N i) (Λ i)) :
    IsPoissonRandomMeasure P (fun ω => Measure.sum fun i => N i ω) (Measure.sum Λ) := by
  sorry

/-- 6.2: independent marks of an enumerated point process form a marking. -/
theorem isMarking_of_condDistrib [StandardBorelSpace Y] [Nonempty Y] {P : Measure Ω}
    [IsProbabilityMeasure P] (K : Kernel X Y) [IsMarkovKernel K] (κ : Ω → ℕ∞) (Xs : Ω → ℕ → X)
    (Ys : Ω → ℕ → Y) (hm : Measurable fun ω => (κ ω, Xs ω)) (hY : Measurable Ys)
    (hmark : ∀ᵐ ω ∂P, condDistrib Ys (fun ω => (κ ω, Xs ω)) P (κ ω, Xs ω) =
      Measure.infinitePi fun n => K (Xs ω n)) :
    IsMarking P
      (fun ω => Measure.sum fun n : ℕ => if (n : ℕ∞) < κ ω then Measure.dirac (Xs ω n) else 0)
      (fun ω => Measure.sum fun n : ℕ =>
        if (n : ℕ∞) < κ ω then Measure.dirac (Xs ω n, Ys ω n) else 0) K := by
  sorry

/-- 6.2: the intensity of a marking of a point process is `intensity ⊗ K`. -/
theorem IsMarking.intensity_eq {P : Measure Ω} [IsProbabilityMeasure P] {N : Ω → Measure X}
    [SFinite (intensity P N)] {M : Ω → Measure (X × Y)} {K : Kernel X Y} [IsMarkovKernel K]
    (hM : IsMarking P N M K)
    (hint : ∀ᵐ ω ∂P, IsIntegerValued (N ω)) :
    intensity P M = intensity P N ⊗ₘ K := by
  sorry

/-- 6.2: the marking theorem. -/
theorem IsPoissonRandomMeasure.isPoissonRandomMeasure_of_isMarking
    {P : Measure Ω} {N : Ω → Measure X} {Λ : Measure X} [SFinite Λ]
    (h : IsPoissonRandomMeasure P N Λ) {M : Ω → Measure (X × Y)}
    {K : Kernel X Y} [IsMarkovKernel K] (hM : IsMarking P N M K) :
    IsPoissonRandomMeasure P M (Λ ⊗ₘ K) := by
  sorry

/-- 6.3: the thinning theorem: the retained and the deleted points of an independent thinning of
a Poisson random measure are independent Poisson random measures. -/
theorem IsPoissonRandomMeasure.thinning {P : Measure Ω}
    {N : Ω → Measure X} {Λ : Measure X} [SFinite Λ] (h : IsPoissonRandomMeasure P N Λ)
    {M : Ω → Measure (X × Bool)} {K : Kernel X Bool} [IsMarkovKernel K]
    (hM : IsMarking P N M K) :
    IsPoissonRandomMeasure P (fun ω => ((M ω).restrict (univ ×ˢ {true})).map Prod.fst)
        (Λ.withDensity fun x => K x {true}) ∧
      IsPoissonRandomMeasure P (fun ω => ((M ω).restrict (univ ×ˢ {false})).map Prod.fst)
        (Λ.withDensity fun x => K x {false}) ∧
      IndepFun (fun ω => ((M ω).restrict (univ ×ˢ {true})).map Prod.fst)
        (fun ω => ((M ω).restrict (univ ×ˢ {false})).map Prod.fst) P := by
  sorry

/-- 6.3: independent thinning multiplies the factorial moment measures by the retention
probabilities. -/
theorem IsMarking.factorialMomentMeasure_thinning [MeasurableSpace.CountablyGenerated X]
    {P : Measure Ω} [IsProbabilityMeasure P] {N : Ω → Measure X} {M : Ω → Measure (X × Bool)}
    {K : Kernel X Bool} [IsMarkovKernel K] (hM : IsMarking P N M K)
    (hint : ∀ᵐ ω ∂P, IsIntegerValued (N ω)) (hσ : ∀ᵐ ω ∂P, SigmaFinite (N ω)) (n : ℕ) :
    AEMeasurable (fun ω => factorialMeasure (N ω) n) P ∧
    AEMeasurable
      (fun ω => factorialMeasure (((M ω).restrict (univ ×ˢ {true})).map Prod.fst) n) P ∧
    factorialMomentMeasure P (fun ω => ((M ω).restrict (univ ×ˢ {true})).map Prod.fst) n =
      (factorialMomentMeasure P N n).withDensity fun x => ∏ i, K (x i) {true} := by
  sorry

end Operations

/-! ## Layer 7: stationarity on `ℝ^d` -/

/-- 7.1: Euclidean space, the carrier of the stationarity theory. -/
abbrev E (d : ℕ) := EuclideanSpace ℝ (Fin d)

/-- 7.1: the unit cube `[0,1)^d`. -/
def unitCube (d : ℕ) : Set (E d) := {x | ∀ i, x i ∈ Set.Ico (0 : ℝ) 1}

section Stationary

variable {Ω : Type*} [MeasurableSpace Ω]
variable {G : Type*} [MetricSpace G] [PolishSpace G] [LocallyCompactSpace G] [MeasurableSpace G]
  [BorelSpace G] [AddGroup G] [IsTopologicalAddGroup G]

omit [PolishSpace G] [LocallyCompactSpace G] in
/-- Supporting step: translating by `x + y` is translating by `y`, then by `x`. -/
theorem map_sub_add_eq_map_map_sub (μ : Measure G) (x y : G) :
    μ.map (· - (x + y)) = (μ.map (· - y)).map (· - x) := by
  rw [Measure.map_map (continuous_sub_right x).measurable (continuous_sub_right y).measurable]
  congr 1
  funext z
  simp [Function.comp, sub_eq_add_neg, neg_add_rev, add_assoc]

/-- 7.1: the translation action `(x +ᵥ ξ) B = ξ (B + x)`, moving a point at `x` to the origin. -/
instance : AddAction G (PointMeasure G) where
  vadd x ξ := ⟨(ξ : Measure G).map (· - x),
    by
      have : IsFiniteMeasureOnCompacts (ξ : Measure G) := ξ.2.1
      exact Measure.IsFiniteMeasureOnCompacts.map (ξ : Measure G) (Homeomorph.subRight x),
    fun A hA hfin => by
      rw [Measure.map_apply (continuous_sub_right x).measurable hA] at hfin ⊢
      exact ξ.2.2 ((continuous_sub_right x).measurable hA) hfin⟩
  zero_vadd ξ := Subtype.ext (show (ξ : Measure G).map (· - 0) = ξ by simp)
  add_vadd x y ξ := Subtype.ext (map_sub_add_eq_map_map_sub (ξ : Measure G) x y)

/-- 7.1: the translation action on locally finite measures, `(x +ᵥ μ) B = μ (B + x)`. -/
instance : AddAction G (LocallyFiniteMeasure G) where
  vadd x μ := ⟨(μ : Measure G).map (· - x),
    by
      have : IsFiniteMeasureOnCompacts (μ : Measure G) := μ.2
      exact Measure.IsFiniteMeasureOnCompacts.map (μ : Measure G) (Homeomorph.subRight x)⟩
  zero_vadd μ := Subtype.ext (show (μ : Measure G).map (· - 0) = μ by simp)
  add_vadd x y μ := Subtype.ext (map_sub_add_eq_map_map_sub (μ : Measure G) x y)

/-- 7.1: a point process is stationary when its law is invariant under all translations. -/
def IsStationary (P : Measure Ω) (N : Ω → PointMeasure G) : Prop :=
  VAddInvariantMeasure G (PointMeasure G) (P.map N)

/-- 7.2: the intensity density, the mean mass of a chosen unit set. -/
def intensityDensity (P : Measure Ω) (Λ : Ω → LocallyFiniteMeasure G) (U : Set G) : ℝ≥0∞ :=
  intensity P (fun ω => (Λ ω : Measure G)) U

/-- 7.1: the translation action is jointly measurable. -/
theorem measurable_vadd_pointMeasure :
    Measurable fun p : G × PointMeasure G => p.1 +ᵥ p.2 := by
  sorry

end Stationary

section StationaryEuclidean

variable {Ω : Type*} [MeasurableSpace Ω] {d : ℕ}

/-- 7.3: the reduced second factorial moment measure,
`α₂^!(B) = ∫ 1{x ∈ [0,1)^d, y - x ∈ B} α₂(d(x, y))`. -/
def reducedSecondFactorialMomentMeasure (P : Measure Ω) (N : Ω → PointMeasure (E d)) :
    Measure (E d) :=
  ((factorialMomentMeasure P (fun ω => (N ω : Measure (E d))) 2).restrict
    {x | x 0 ∈ unitCube d}).map fun x => x 1 - x 0

/-- 7.1: stationarity agrees with translation invariance of the joint count laws on finite
families of relatively compact windows. -/
theorem isStationary_iff_forall_map_count {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → PointMeasure (E d)} (hN : Measurable N) :
    IsStationary P N ↔
      ∀ (n : ℕ) (A : Fin n → Set (E d)) (x : E d),
        (∀ i, MeasurableSet (A i) ∧ IsCompact (closure (A i))) →
          P.map (fun ω i => (N ω).count ((· + x) '' A i)) =
            P.map (fun ω i => (N ω).count (A i)) := by
  sorry

/-- 7.2: a stationary point process with finite intensity `γ` has intensity measure `γ` times
Lebesgue measure. -/
theorem IsStationary.intensity_eq {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → PointMeasure (E d)} (hN : Measurable N) (hst : IsStationary P N)
    (hγ : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞) :
    intensity P (fun ω => (N ω : Measure (E d))) =
      intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) • volume := by
  sorry

/-- 7.2: a Poisson process with locally finite intensity is stationary exactly when its
intensity is a constant multiple of Lebesgue measure. -/
theorem IsPoissonPointProcess.isStationary_iff {P : Measure Ω} {N : Ω → PointMeasure (E d)}
    {Λ : Measure (E d)} [IsFiniteMeasureOnCompacts Λ] (h : IsPoissonPointProcess P N Λ) :
    IsStationary P N ↔ ∃ γ : ℝ≥0, Λ = (γ : ℝ≥0∞) • volume := by
  sorry

/-- 7.4: the stationary Poisson process is mixing. -/
theorem IsPoissonPointProcess.tendsto_measureReal_inter_vadd_preimage {P : Measure Ω}
    {N : Ω → PointMeasure (E d)} {γ : ℝ≥0}
    (h : IsPoissonPointProcess P N ((γ : ℝ≥0∞) • volume)) {A B : Set (PointMeasure (E d))}
    (hA : MeasurableSet A) (hB : MeasurableSet B) :
    Tendsto (fun x : E d => (P.map N).real (A ∩ (x +ᵥ ·) ⁻¹' B)) (cocompact (E d))
      (𝓝 ((P.map N).real A * (P.map N).real B)) := by
  sorry

/-- 7.4: the stationary Poisson process on `ℝ^d`, `d ≥ 1`, is ergodic. -/
theorem IsPoissonPointProcess.ergodicVAdd (hd : 1 ≤ d) {P : Measure Ω}
    {N : Ω → PointMeasure (E d)} {γ : ℝ≥0}
    (h : IsPoissonPointProcess P N ((γ : ℝ≥0∞) • volume)) :
    ErgodicVAdd (E d) (PointMeasure (E d)) (P.map N) := by
  sorry

/-- 7.3: for a stationary, locally square-integrable point process the reduced second factorial
moment measure is locally finite and disintegrates the second factorial moment measure. -/
theorem IsStationary.lintegral_factorialMomentMeasure_two {P : Measure Ω}
    [IsProbabilityMeasure P] {N : Ω → PointMeasure (E d)} (hN : Measurable N)
    (hst : IsStationary P N)
    (hsq : ∀ K : Set (E d), IsCompact K → ∫⁻ ω, (N ω : Measure (E d)) K ^ 2 ∂P < ∞) :
    IsLocallyFiniteMeasure (reducedSecondFactorialMomentMeasure P N) ∧
      ∀ f : E d → E d → ℝ≥0∞, Measurable (uncurry f) →
        ∫⁻ x, f (x 0) (x 1) ∂factorialMomentMeasure P (fun ω => (N ω : Measure (E d))) 2 =
          ∫⁻ x, ∫⁻ y, f x (x + y) ∂reducedSecondFactorialMomentMeasure P N ∂volume := by
  sorry

/-- 7.3: the reduced second factorial moment measure of the stationary Poisson process of
intensity `γ` is `γ²` times Lebesgue measure. -/
theorem IsPoissonPointProcess.reducedSecondFactorialMomentMeasure_eq {P : Measure Ω}
    {N : Ω → PointMeasure (E d)} {γ : ℝ≥0}
    (h : IsPoissonPointProcess P N ((γ : ℝ≥0∞) • volume)) :
    reducedSecondFactorialMomentMeasure P N = ((γ : ℝ≥0∞) ^ 2) • volume := by
  sorry

end StationaryEuclidean

/-! ## Layer 8: the stationary Palm probability -/

section StationaryPalm

variable {Ω : Type*} [MeasurableSpace Ω] {d : ℕ}

/-- 8.1: the stationary Palm probability, normalized on the unit cube:
`P⁰(A) = γ⁻¹ 𝔼 ∫_{[0,1)^d} 1{x +ᵥ N ∈ A} N(dx)`. -/
def palmProbability (P : Measure Ω) (N : Ω → PointMeasure (E d)) :
    Measure (PointMeasure (E d)) :=
  (intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))⁻¹ •
    P.bind fun ω => ((N ω : Measure (E d)).restrict (unitCube d)).map fun x => x +ᵥ N ω

/-- 8.1: for finite positive intensity the Palm probability is a probability measure;
stationarity is not needed. -/
theorem isProbabilityMeasure_palmProbability {P : Measure Ω}
    [IsProbabilityMeasure P] {N : Ω → PointMeasure (E d)} (hN : Measurable N)
    (hγ₀ : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))
    (hγ : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞) :
    IsProbabilityMeasure (palmProbability P N) := by
  sorry

/-- 8.2: the refined Campbell theorem. -/
theorem IsStationary.lintegral_vadd_eq_lintegral_palmProbability {P : Measure Ω}
    [IsProbabilityMeasure P] {N : Ω → PointMeasure (E d)} (hN : Measurable N)
    (hst : IsStationary P N)
    (hγ₀ : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))
    (hγ : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞)
    {f : E d → PointMeasure (E d) → ℝ≥0∞} (hf : Measurable (uncurry f)) :
    ∫⁻ ω, ∫⁻ x, f x (x +ᵥ N ω) ∂(N ω : Measure (E d)) ∂P =
      intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) *
        ∫⁻ x, ∫⁻ ξ, f x ξ ∂palmProbability P N ∂volume := by
  sorry

/-- 8.3: Slivnyak's theorem: a stationary point process of finite positive intensity `γ` is the
Poisson process of intensity `γ` exactly when its Palm probability is the law of the process
with a point added at the origin. -/
theorem isPoissonPointProcess_iff_palmProbability {P : Measure Ω} [IsProbabilityMeasure P]
    {N : Ω → PointMeasure (E d)} (hN : Measurable N) (hst : IsStationary P N)
    (hγ₀ : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))
    (hγ : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞) :
    IsPoissonPointProcess P N
        (intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) •
          volume) ↔
      (palmProbability P N).map (fun ξ : PointMeasure (E d) => (ξ : Measure (E d))) =
        P.map fun ω => (N ω : Measure (E d)) + Measure.dirac 0 := by
  sorry

end StationaryPalm

/-! ## Upstream declarations consumed (Exact supplier contracts) -/

#check @MeasureTheory.Measure.lintegral_bind
#check @MeasureTheory.Measure.bind
#check @MeasureTheory.Measure.compProd
#check @ProbabilityTheory.Kernel.const
#check @ProbabilityTheory.condDistrib
#check @MeasureTheory.Measure.infinitePi
#check @MeasureTheory.Measure.pi
#check @MeasureTheory.VAddInvariantMeasure
#check @ErgodicVAdd
#check @Filter.cocompact
#check @ProbabilityTheory.poissonMeasure
#check @ENNReal.log
#check @EReal.exp
#check @TauCeti.Probability.compoundPoissonMeasure
#check @TauCeti.Probability.compoundPoissonMeasure_def
#check @TauCeti.Probability.isProbabilityMeasure_compoundPoissonMeasure
#check @MeasureTheory.Measure.convolutionPower

end TauCetiRoadmap.SpatialPointProcessFoundations
