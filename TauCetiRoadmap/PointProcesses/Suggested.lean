import Mathlib
import TauCeti.Probability.GeneratingFunction

/-!
# Suggested declarations for random measures, point processes, Palm theory, and stochastic
intensities

This file gives possible Lean statements for milestones in [`README.md`](README.md). The roadmap
is authoritative: these declarations are examples, not an exhaustive API, and proving them does
not by itself complete a layer.

The file intentionally uses `sorry`. It makes the important choices concrete enough to review and
implement: the carriers `LocallyFiniteMeasure`, `PointMeasure`, and their marked versions; the
definition of the elementary functionals on an arbitrary measurable space; the Poisson property
and its law; the Palm kernel through a σ-finite disintegration adapter; the translation action
and stationarity through Mathlib's `VAddInvariantMeasure`; compensators as random marked measures
characterized by an integral identity; and the Hawkes intensity through half-line windows.

Every `sorry` is either a proof of a true side condition or the body of a construction the
roadmap describes in prose.  No proposition is asserted through a `sorry`-bodied `Prop`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology Function
open scoped ENNReal NNReal CompactlySupported

namespace TauCetiRoadmap.PointProcesses

/-! ## Layer 0: locally finite measures, point measures, and the vague topology -/

/-- A measure is integer-valued when every measurable set of finite mass has natural-number
mass.  Sets of infinite mass are unconstrained. -/
def _root_.MeasureTheory.Measure.IsIntegerValued {X : Type*} [MeasurableSpace X] (μ : Measure X) :
    Prop :=
  ∀ ⦃A : Set X⦄, MeasurableSet A → μ A < ∞ → ∃ n : ℕ, μ A = n

/-- Locally finite measures on a topological measurable space. -/
def LocallyFiniteMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ}

/-- Point measures: locally finite integer-valued measures.  Multiplicities are allowed. -/
def PointMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ ∧ μ.IsIntegerValued}

/-- Marked locally finite measures: measures on `S × E` finite on `K × univ` for compact `K`. -/
def MarkedLocallyFiniteMeasure (S E : Type*) [TopologicalSpace S] [MeasurableSpace S]
    [MeasurableSpace E] :=
  {μ : Measure (S × E) // ∀ K : Set S, IsCompact K → μ (K ×ˢ Set.univ) < ∞}

/-- Marked point measures: integer-valued marked locally finite measures. -/
def MarkedPointMeasure (S E : Type*) [TopologicalSpace S] [MeasurableSpace S]
    [MeasurableSpace E] :=
  {μ : Measure (S × E) // (∀ K : Set S, IsCompact K → μ (K ×ˢ Set.univ) < ∞) ∧ μ.IsIntegerValued}

section Configuration

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

instance : CoeOut (LocallyFiniteMeasure S) (Measure S) := ⟨Subtype.val⟩
instance : CoeOut (PointMeasure S) (Measure S) := ⟨Subtype.val⟩

instance (μ : LocallyFiniteMeasure S) : IsFiniteMeasureOnCompacts (μ : Measure S) := μ.2
instance (ξ : PointMeasure S) : IsFiniteMeasureOnCompacts (ξ : Measure S) := ξ.2.1

/-- A point measure is in particular locally finite. -/
def PointMeasure.toLocallyFinite (ξ : PointMeasure S) : LocallyFiniteMeasure S := ⟨ξ.1, ξ.2.1⟩

instance : Coe (PointMeasure S) (LocallyFiniteMeasure S) := ⟨PointMeasure.toLocallyFinite⟩

/-- The vague topology: the coarsest making `μ ↦ ∫ x, f x ∂μ` continuous for every
`f : C_c(S, ℝ)`. -/
instance : TopologicalSpace (LocallyFiniteMeasure S) :=
  ⨅ f : C_c(S, ℝ), TopologicalSpace.induced (fun μ : LocallyFiniteMeasure S => ∫ x, f x ∂(μ : Measure S))
    inferInstance

instance : MeasurableSpace (LocallyFiniteMeasure S) := borel _
instance : BorelSpace (LocallyFiniteMeasure S) := ⟨rfl⟩
instance : PolishSpace (LocallyFiniteMeasure S) := sorry

/-- Point measures carry the subspace topology of the vague topology. -/
instance : TopologicalSpace (PointMeasure S) :=
  TopologicalSpace.induced PointMeasure.toLocallyFinite inferInstance

instance : MeasurableSpace (PointMeasure S) := borel _
instance : BorelSpace (PointMeasure S) := ⟨rfl⟩
instance : PolishSpace (PointMeasure S) := sorry
instance : Nonempty (LocallyFiniteMeasure S) := ⟨⟨0, inferInstance⟩⟩
instance : Nonempty (PointMeasure S) := ⟨⟨0, inferInstance, fun _ _ _ => ⟨0, by simp⟩⟩⟩

theorem LocallyFiniteMeasure.measurableSpace_eq_generateFrom_eval :
    (inferInstance : MeasurableSpace (LocallyFiniteMeasure S)) =
      MeasurableSpace.generateFrom
        {s | ∃ A, MeasurableSet A ∧ ∃ B, MeasurableSet B ∧
          s = {μ : LocallyFiniteMeasure S | (μ : Measure S) A ∈ B}} := by
  sorry

theorem isClosed_range_pointMeasure_coe :
    IsClosed (Set.range (PointMeasure.toLocallyFinite : PointMeasure S → LocallyFiniteMeasure S)) := by
  sorry

/-- The count of a point measure on a set, as an extended natural number. -/
def PointMeasure.count (ξ : PointMeasure S) (A : Set S) : ℕ∞ :=
  if (ξ : Measure S) A = ∞ then ⊤ else (⌊((ξ : Measure S) A).toNNReal⌋₊ : ℕ∞)

def PointMeasure.IsSimple (ξ : PointMeasure S) : Prop := ∀ x, (ξ : Measure S) {x} ≤ 1

def PointMeasure.zero : PointMeasure S := ⟨0, inferInstance, fun _ _ _ => ⟨0, by simp⟩⟩

def PointMeasure.dirac (x : S) : PointMeasure S := ⟨Measure.dirac x, inferInstance, sorry⟩

/-- Insertion of one occurrence at `x`. -/
def PointMeasure.insert (ξ : PointMeasure S) (x : S) : PointMeasure S :=
  ⟨(ξ : Measure S) + Measure.dirac x, sorry, sorry⟩

/-- Erasure of one occurrence at `x`, through Mathlib's measure subtraction; `ξ` is unchanged when
`ξ {x} = 0`. -/
def PointMeasure.erase (ξ : PointMeasure S) (x : S) : PointMeasure S :=
  ⟨(ξ : Measure S) - Measure.dirac x, sorry, sorry⟩

def PointMeasure.restrict (ξ : PointMeasure S) (W : Set S) : PointMeasure S :=
  ⟨(ξ : Measure S).restrict W, sorry, sorry⟩

/-- A finite sum of Dirac occurrences. -/
def PointMeasure.ofTuple {n : ℕ} (x : Fin n → S) : PointMeasure S :=
  ⟨∑ i, Measure.dirac (x i), sorry, sorry⟩

/-- A finite superposition of point measures. -/
def PointMeasure.finsum {ι : Type*} [Fintype ι] (ξ : ι → PointMeasure S) : PointMeasure S :=
  ⟨∑ i, (ξ i : Measure S), sorry, sorry⟩

/-- A measurable enumeration of occurrences, with `none` after the last occurrence of a finite
configuration, and repeated locations recording multiplicity. -/
def PointMeasure.enum (ξ : PointMeasure S) : ℕ → Option S := sorry

theorem PointMeasure.coe_eq_sum_dirac_enum (ξ : PointMeasure S) :
    (ξ : Measure S) = Measure.sum fun n => (ξ.enum n).elim 0 Measure.dirac := by
  sorry

theorem measurable_pointMeasure_count {A : Set S} (hA : MeasurableSet A) :
    Measurable fun ξ : PointMeasure S => ξ.count A := by
  sorry

end Configuration

/-! ## Layer 1: laws of random measures and determining functionals -/

/-- `expNeg t = exp (-t)`, with `expNeg ∞ = 0`. -/
def _root_.ENNReal.expNeg (t : ℝ≥0∞) : ℝ≥0 :=
  if t = ∞ then 0 else ⟨Real.exp (-t.toReal), (Real.exp_pos _).le⟩

section Laws

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {X : Type*} [MeasurableSpace X]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- The intensity measure of a random measure, as a mixture. -/
def intensity (N : Ω → Measure X) : Measure X :=
  P.bind N

theorem intensity_apply {N : Ω → Measure X} (hN : Measurable N) {A : Set X}
    (hA : MeasurableSet A) :
    intensity P N A = ∫⁻ ω, N ω A ∂P := by
  sorry

theorem lintegral_intensity {N : Ω → Measure X} (hN : Measurable N) {f : X → ℝ≥0∞}
    (hf : Measurable f) :
    ∫⁻ x, f x ∂intensity P N = ∫⁻ ω, ∫⁻ x, f x ∂N ω ∂P := by
  sorry

theorem isFiniteMeasureOnCompacts_intensity_iff {Λ : Ω → LocallyFiniteMeasure S}
    (hΛ : Measurable Λ) :
    IsFiniteMeasureOnCompacts (intensity P fun ω => (Λ ω : Measure S)) ↔
      ∀ K : Set S, IsCompact K → ∫⁻ ω, (Λ ω : Measure S) K ∂P < ∞ := by
  sorry

/-- The Laplace functional `𝔼 exp (-∫ f dN)` of a random measure. -/
def laplaceFunctional (N : Ω → Measure X) (f : X → ℝ≥0∞) : ℝ≥0∞ :=
  ∫⁻ ω, ENNReal.expNeg (∫⁻ x, f x ∂N ω) ∂P

/-- The probability-generating functional `𝔼 ∏_{x ∈ N} v x`, with the factor `0` whenever
`v x = 0` at an occurrence. -/
def pgfl (N : Ω → PointMeasure S) (v : S → ℝ≥0) : ℝ≥0∞ :=
  laplaceFunctional P (fun ω => (N ω : Measure S))
    fun x => if v x = 0 then ∞ else ENNReal.ofReal (-Real.log (v x))

/-- The law of a random element as a probability measure, for the weak topology of Layer 6. -/
def law {α : Type*} [MeasurableSpace α] (Y : Ω → α) (hY : Measurable Y) : ProbabilityMeasure α :=
  ⟨P.map Y, (Measure.isProbabilityMeasure_map_iff hY.aemeasurable).2 inferInstance⟩

theorem map_eq_of_laplaceFunctional_eq {Λ Λ' : Ω → LocallyFiniteMeasure S}
    (hΛ : Measurable Λ) (hΛ' : Measurable Λ')
    (h : ∀ f : C_c(S, ℝ≥0),
      laplaceFunctional P (fun ω => (Λ ω : Measure S)) (fun x => (f x : ℝ≥0∞)) =
        laplaceFunctional P (fun ω => (Λ' ω : Measure S)) (fun x => (f x : ℝ≥0∞))) :
    P.map Λ = P.map Λ' := by
  sorry

theorem map_eq_of_forall_count_eq {N N' : Ω → PointMeasure S}
    (hN : Measurable N) (hN' : Measurable N')
    (h : ∀ (n : ℕ) (A : Fin n → Set S), (∀ i, MeasurableSet (A i) ∧ IsCompact (closure (A i))) →
      P.map (fun ω i => (N ω).count (A i)) = P.map (fun ω i => (N' ω).count (A i))) :
    P.map N = P.map N' := by
  sorry

open scoped Classical in
theorem pgfl_indicator_eq_pgf {N : Ω → PointMeasure S} (hN : Measurable N) {A : Set S}
    (hA : MeasurableSet A) (hAc : IsCompact (closure A)) {t : ℝ≥0} (ht : t ≤ 1) :
    pgfl P N (fun x => if x ∈ A then t else 1) =
      ENNReal.ofReal (TauCeti.Probability.pgf (fun ω => ((N ω).count A).toNat) P t) := by
  sorry

end Laws

/-! ## Layer 2: Campbell measures and Palm kernels -/

section Palm

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {X : Type*} [MeasurableSpace X] {T : Type*} [MeasurableSpace T]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- The Campbell measure of a random measure and a jointly observed random element. -/
def campbellMeasure (N : Ω → Measure X) (Y : Ω → T) : Measure (X × T) :=
  P.bind fun ω => (N ω).map fun x => (x, Y ω)

theorem campbellMeasure_fst {N : Ω → Measure X} {Y : Ω → T} (hN : Measurable N)
    (hY : Measurable Y) :
    (campbellMeasure P N Y).fst = intensity P N := by
  sorry

theorem lintegral_campbellMeasure {N : Ω → Measure X} {Y : Ω → T} (hN : Measurable N)
    (hY : Measurable Y) {g : X × T → ℝ≥0∞} (hg : Measurable g) :
    ∫⁻ p, g p ∂campbellMeasure P N Y = ∫⁻ ω, ∫⁻ x, g (x, Y ω) ∂N ω ∂P := by
  sorry

/-- Disintegration of a measure on a product with σ-finite first marginal and standard Borel second
factor, obtained from `Measure.condKernel` after reweighting by a positive integrable function of
the first coordinate. -/
def _root_.MeasureTheory.Measure.sigmaFiniteCondKernel {α Ω' : Type*} [MeasurableSpace α]
    [MeasurableSpace Ω'] [StandardBorelSpace Ω'] [Nonempty Ω'] (ρ : Measure (α × Ω'))
    [SigmaFinite ρ.fst] : Kernel α Ω' :=
  sorry

instance {α Ω' : Type*} [MeasurableSpace α] [MeasurableSpace Ω'] [StandardBorelSpace Ω']
    [Nonempty Ω'] (ρ : Measure (α × Ω')) [SigmaFinite ρ.fst] :
    IsMarkovKernel ρ.sigmaFiniteCondKernel :=
  sorry

theorem _root_.MeasureTheory.Measure.compProd_fst_sigmaFiniteCondKernel {α Ω' : Type*}
    [MeasurableSpace α] [MeasurableSpace Ω'] [StandardBorelSpace Ω'] [Nonempty Ω']
    (ρ : Measure (α × Ω')) [SigmaFinite ρ.fst] :
    ρ.fst ⊗ₘ ρ.sigmaFiniteCondKernel = ρ := by
  sorry

theorem _root_.MeasureTheory.Measure.eq_sigmaFiniteCondKernel_of_measure_eq_compProd {α Ω' : Type*}
    [MeasurableSpace α] [MeasurableSpace Ω'] [StandardBorelSpace Ω'] [Nonempty Ω']
    (ρ : Measure (α × Ω')) [SigmaFinite ρ.fst] (κ : Kernel α Ω') [IsMarkovKernel κ]
    (h : ρ.fst ⊗ₘ κ = ρ) :
    ∀ᵐ x ∂ρ.fst, κ x = ρ.sigmaFiniteCondKernel x := by
  sorry

/-- The Palm kernel of a random measure `N` with respect to a jointly observed `Y`. -/
def palmKernel (N : Ω → Measure X) (Y : Ω → T) [StandardBorelSpace T] [Nonempty T]
    [SigmaFinite (intensity P N)] : Kernel X T :=
  haveI : SigmaFinite (campbellMeasure P N Y).fst := sorry
  (campbellMeasure P N Y).sigmaFiniteCondKernel

theorem compProd_intensity_palmKernel {N : Ω → Measure X} {Y : Ω → T} [StandardBorelSpace T]
    [Nonempty T] [SigmaFinite (intensity P N)] (hN : Measurable N) (hY : Measurable Y) :
    intensity P N ⊗ₘ palmKernel P N Y = campbellMeasure P N Y := by
  sorry

/-- The reduced Palm kernel of a point process on `S`: the ordinary Palm kernel pushed forward by
erasing one occurrence at the conditioning location. -/
def reducedPalmKernel (N : Ω → PointMeasure S)
    [SigmaFinite (intensity P fun ω => (N ω : Measure S))] : Kernel S (PointMeasure S) :=
  sorry

theorem reducedPalmKernel_apply {N : Ω → PointMeasure S}
    [SigmaFinite (intensity P fun ω => (N ω : Measure S))] (x : S) :
    reducedPalmKernel P N x =
      (palmKernel P (fun ω => (N ω : Measure S)) N x).map fun ξ => ξ.erase x := by
  sorry

theorem palmKernel_ae_pos_singleton {N : Ω → PointMeasure S} (hN : Measurable N)
    [SigmaFinite (intensity P fun ω => (N ω : Measure S))] :
    ∀ᵐ x ∂intensity P (fun ω => (N ω : Measure S)),
      palmKernel P (fun ω => (N ω : Measure S)) N x {ξ | 0 < (ξ : Measure S) {x}} = 1 := by
  sorry

end Palm

/-! ## Layer 3: factorial measures, moment measures, and Janossy reconstruction -/

section Factorial

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- The `n`th factorial power: ordered `n`-tuples of distinct occurrences. -/
def PointMeasure.factorial (ξ : PointMeasure S) (n : ℕ) : Measure (Fin n → S) := sorry

theorem PointMeasure.factorial_zero (ξ : PointMeasure S) :
    ξ.factorial 0 = Measure.dirac finZeroElim := by
  sorry

theorem PointMeasure.factorial_univ_pi (ξ : PointMeasure S) {A : Set S} (hA : MeasurableSet A)
    (hA' : (ξ : Measure S) A < ∞) (n : ℕ) :
    ξ.factorial n (Set.univ.pi fun _ => A) = ((ξ.count A).toNat.descFactorial n : ℝ≥0∞) := by
  sorry

def factorialMomentMeasure (N : Ω → PointMeasure S) (n : ℕ) : Measure (Fin n → S) :=
  P.bind fun ω => (N ω).factorial n

/-- The `n`th Janossy measure on the window `W`, with the `1/n!` normalization. -/
def janossyMeasure (N : Ω → PointMeasure S) (W : Set S) (n : ℕ) : Measure (Fin n → S) :=
  (n.factorial : ℝ≥0∞)⁻¹ •
    (P.restrict {ω | (N ω).count W = n}).bind fun ω => ((N ω).restrict W).factorial n

theorem janossyMeasure_univ {N : Ω → PointMeasure S} (hN : Measurable N) {W : Set S}
    (hW : MeasurableSet W) (n : ℕ) :
    janossyMeasure P N W n Set.univ = P {ω | (N ω).count W = n} := by
  sorry

theorem map_restrict_eq_sum_map_janossyMeasure {N : Ω → PointMeasure S} (hN : Measurable N)
    {W : Set S} (hW : MeasurableSet W) (hWc : IsCompact (closure W)) :
    P.map (fun ω => (N ω).restrict W) =
      Measure.sum fun n => (janossyMeasure P N W n).map PointMeasure.ofTuple := by
  sorry

theorem janossyMeasure_restrict_eq_tsum {N : Ω → PointMeasure S} (hN : Measurable N)
    {V W : Set S} (hV : MeasurableSet V) (hVW : V ⊆ W) (hW : MeasurableSet W)
    (hWc : IsCompact (closure W)) {n : ℕ} {A : Set (Fin n → S)} (hA : MeasurableSet A)
    (hAV : A ⊆ Set.univ.pi fun _ => V) :
    janossyMeasure P N V n A =
      ∑' k, ((n + k).choose n : ℝ≥0∞) *
        janossyMeasure P N W (n + k)
          {x | (fun i => x (Fin.castAdd k i)) ∈ A ∧ ∀ j, x (Fin.natAdd n j) ∈ W \ V} := by
  sorry

end Factorial

/-! ## Layer 4: Poisson random measures and Mecke calculus -/

/-- Lebesgue measure on `ℝ≥0`, as the comap of Lebesgue measure on `ℝ`. -/
def nnvolume : Measure ℝ≥0 := Measure.comap ((↑) : ℝ≥0 → ℝ) volume

section Poisson

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {X : Type*} [MeasurableSpace X]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- The Poisson property of a random measure on an arbitrary measurable space: independent counts
with law `poissonMeasure` on disjoint sets of finite `Λ`-measure. -/
def IsPoissonRandomMeasure (N : Ω → Measure X) (Λ : Measure X) : Prop :=
  Measurable N ∧
    ∀ (n : ℕ) (A : Fin n → Set X), (∀ i, MeasurableSet (A i) ∧ Λ (A i) < ∞) →
      Pairwise (Disjoint on A) →
        iIndepFun (fun i ω => N ω (A i)) P ∧
          ∀ i, HasLaw (fun ω => N ω (A i))
            ((poissonMeasure (Λ (A i)).toNNReal).map (Nat.cast : ℕ → ℝ≥0∞)) P

/-- The Poisson property of a point process on `S`. -/
abbrev IsPoissonPointProcess (N : Ω → PointMeasure S) (Λ : Measure S) : Prop :=
  IsPoissonRandomMeasure P (fun ω => (N ω : Measure S)) Λ

/-- The law of the Poisson random measure with σ-finite intensity `Λ`, as a pushforward of
`Measure.infinitePi`. -/
def poissonLaw (Λ : Measure X) [SigmaFinite Λ] : Measure (Measure X) := sorry

instance (Λ : Measure X) [SigmaFinite Λ] : IsProbabilityMeasure (poissonLaw Λ) := sorry

theorem isPoissonRandomMeasure_id_poissonLaw (Λ : Measure X) [SigmaFinite Λ] :
    IsPoissonRandomMeasure (poissonLaw Λ) id Λ := by
  sorry

theorem map_eq_poissonLaw {N : Ω → Measure X} {Λ : Measure X} [SigmaFinite Λ]
    (h : IsPoissonRandomMeasure P N Λ) :
    P.map N = poissonLaw Λ := by
  sorry

/-- The Poisson kernel on a locally compact Polish space, measurable in the intensity. -/
def poissonPointKernel : Kernel (LocallyFiniteMeasure S) (PointMeasure S) := sorry

instance : IsMarkovKernel (poissonPointKernel (S := S)) := sorry

theorem map_coe_poissonPointKernel (Λ : LocallyFiniteMeasure S) :
    (poissonPointKernel Λ).map (fun ξ : PointMeasure S => (ξ : Measure S)) = poissonLaw (Λ : Measure S) := by
  sorry

theorem laplaceFunctional_of_isPoissonRandomMeasure {N : Ω → Measure X} {Λ : Measure X}
    [SigmaFinite Λ] (h : IsPoissonRandomMeasure P N Λ) {f : X → ℝ≥0∞} (hf : Measurable f) :
    laplaceFunctional P N f =
      (ENNReal.expNeg (∫⁻ x, (1 - (ENNReal.expNeg (f x) : ℝ≥0∞)) ∂Λ) : ℝ≥0∞) := by
  sorry

theorem mecke_of_isPoissonRandomMeasure {N : Ω → Measure X} {Λ : Measure X} [SigmaFinite Λ]
    (h : IsPoissonRandomMeasure P N Λ) {g : X × Measure X → ℝ≥0∞} (hg : Measurable g) :
    ∫⁻ ω, ∫⁻ x, g (x, N ω) ∂N ω ∂P = ∫⁻ x, ∫⁻ ω, g (x, N ω + Measure.dirac x) ∂P ∂Λ := by
  sorry

theorem isPoissonRandomMeasure_iff_mecke {N : Ω → Measure X} {Λ : Measure X} [SigmaFinite Λ]
    (hN : Measurable N) (hN' : ∀ ω, SigmaFinite (N ω) ∧ (N ω).IsIntegerValued) :
    IsPoissonRandomMeasure P N Λ ↔
      ∀ g : X × Measure X → ℝ≥0∞, Measurable g →
        ∫⁻ ω, ∫⁻ x, g (x, N ω) ∂N ω ∂P = ∫⁻ x, ∫⁻ ω, g (x, N ω + Measure.dirac x) ∂P ∂Λ := by
  sorry

theorem reducedPalmKernel_of_isPoissonPointProcess {N : Ω → PointMeasure S} {Λ : Measure S}
    [IsFiniteMeasureOnCompacts Λ] [SigmaFinite (intensity P fun ω => (N ω : Measure S))]
    (h : IsPoissonPointProcess P N Λ) :
    ∀ᵐ x ∂Λ, reducedPalmKernel P N x = P.map N := by
  sorry

theorem ae_isSimple_of_isPoissonPointProcess {N : Ω → PointMeasure S} {Λ : Measure S}
    [IsFiniteMeasureOnCompacts Λ] [NullSingletonClass Λ] (h : IsPoissonPointProcess P N Λ) :
    ∀ᵐ ω ∂P, (N ω).IsSimple := by
  sorry

theorem janossyMeasure_of_isPoissonPointProcess {N : Ω → PointMeasure S} {Λ : Measure S}
    [IsFiniteMeasureOnCompacts Λ] (h : IsPoissonPointProcess P N Λ) {W : Set S}
    (hW : MeasurableSet W) (hWc : IsCompact (closure W)) (n : ℕ) :
    janossyMeasure P N W n =
      ((ENNReal.expNeg (Λ W) : ℝ≥0∞) / n.factorial) • Measure.pi fun _ : Fin n => Λ.restrict W := by
  sorry

/-- The `k`th smallest occurrence of a point measure on the half line, or `∞`. -/
def nthPoint (ξ : PointMeasure ℝ≥0) (k : ℕ) : ℝ≥0∞ := sorry

theorem iIndepFun_interarrival_of_isPoissonPointProcess {N : Ω → PointMeasure ℝ≥0} {γ : ℝ}
    (hγ : 0 < γ) (h : IsPoissonPointProcess P N (ENNReal.ofReal γ • nnvolume)) :
    iIndepFun (fun k ω => (nthPoint (N ω) (k + 1)).toReal - (nthPoint (N ω) k).toReal) P ∧
      ∀ k, HasLaw (fun ω => (nthPoint (N ω) (k + 1)).toReal - (nthPoint (N ω) k).toReal)
        (expMeasure γ) P := by
  sorry

end Poisson

/-! ## Layer 5: finite point processes with a Poisson density and the Papangelou intensity -/

section Papangelou

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- The Poisson law on `PointMeasure S` with a locally finite intensity. -/
def poissonPointLaw (μ : Measure S) [IsFiniteMeasureOnCompacts μ] : Measure (PointMeasure S) :=
  poissonPointKernel ⟨μ, inferInstance⟩

/-- The law of `N` is the Poisson law with intensity `μ|W`, with density `f`. -/
def HasPoissonDensity (N : Ω → PointMeasure S) (μ : Measure S) [IsFiniteMeasureOnCompacts μ]
    (W : Set S) (f : PointMeasure S → ℝ≥0∞) : Prop :=
  Measurable N ∧ Measurable f ∧ P.map N = (poissonPointLaw (μ.restrict W)).withDensity f

def IsHereditary (f : PointMeasure S → ℝ≥0∞) : Prop :=
  ∀ (ξ : PointMeasure S) (x : S), 0 < (ξ : Measure S) {x} → 0 < f ξ → 0 < f (ξ.erase x)

/-- The Papangelou intensity `f (ξ + δₓ) / f ξ`, read as zero where `f ξ = 0`. -/
def papangelouIntensity (f : PointMeasure S → ℝ≥0∞) (x : S) (ξ : PointMeasure S) : ℝ≥0∞ :=
  if f ξ = 0 then 0 else f (ξ.insert x) / f ξ

theorem janossyMeasure_of_hasPoissonDensity {N : Ω → PointMeasure S} {μ : Measure S}
    [IsFiniteMeasureOnCompacts μ] [NullSingletonClass μ] {W : Set S} {f : PointMeasure S → ℝ≥0∞}
    (hN : HasPoissonDensity P N μ W f) (hW : MeasurableSet W) (hWc : IsCompact (closure W))
    (n : ℕ) :
    janossyMeasure P N W n =
      ((ENNReal.expNeg (μ W) : ℝ≥0∞) / n.factorial) •
        (Measure.pi fun _ : Fin n => μ.restrict W).withDensity
          fun x => f (PointMeasure.ofTuple x) := by
  sorry

theorem gnz_of_hasPoissonDensity {N : Ω → PointMeasure S} {μ : Measure S}
    [IsFiniteMeasureOnCompacts μ] [NullSingletonClass μ] {W : Set S} {f : PointMeasure S → ℝ≥0∞}
    (hN : HasPoissonDensity P N μ W f) (hf : IsHereditary f)
    {h : S × PointMeasure S → ℝ≥0∞} (hh : Measurable h) :
    ∫⁻ ω, ∫⁻ x, h (x, (N ω).erase x) ∂(N ω : Measure S) ∂P =
      ∫⁻ x, ∫⁻ ω, h (x, N ω) * papangelouIntensity f x (N ω) ∂P ∂(μ.restrict W) := by
  sorry

theorem map_eq_of_papangelouIntensity_ae_eq {N N' : Ω → PointMeasure S} {μ : Measure S}
    [IsFiniteMeasureOnCompacts μ] [NullSingletonClass μ] {W : Set S} {f f' : PointMeasure S → ℝ≥0∞}
    (hN : HasPoissonDensity P N μ W f) (hf : IsHereditary f)
    (hN' : HasPoissonDensity P N' μ W f') (hf' : IsHereditary f')
    (h : ∀ᵐ x ∂μ.restrict W, ∀ ξ, papangelouIntensity f x ξ = papangelouIntensity f' x ξ) :
    P.map N = P.map N' := by
  sorry

theorem papangelouIntensity_of_isPoissonPointProcess {N : Ω → PointMeasure S} {μ : Measure S}
    [IsFiniteMeasureOnCompacts μ] [NullSingletonClass μ] {W : Set S} (hW : MeasurableSet W)
    (hWc : IsCompact (closure W)) {c : ℝ≥0} (hc : 0 < c)
    (h : IsPoissonPointProcess P N ((c : ℝ≥0∞) • μ.restrict W)) :
    HasPoissonDensity P N μ W (fun ξ =>
      (c : ℝ≥0∞) ^ (ξ.count W).toNat * ENNReal.ofReal (Real.exp ((1 - (c : ℝ)) * (μ W).toReal))) ∧
    ∀ x ξ, papangelouIntensity
      (fun ξ => (c : ℝ≥0∞) ^ (ξ.count W).toNat *
        ENNReal.ofReal (Real.exp ((1 - (c : ℝ)) * (μ W).toReal))) x ξ = c := by
  sorry

end Papangelou

/-! ## Layer 6: operations, coupling, and convergence -/

section Operations

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {X : Type*} [MeasurableSpace X] {E : Type*} [MeasurableSpace E] {Y : Type*} [MeasurableSpace Y]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- The kernel attaching independent marks with law `K x` to the occurrences of a σ-finite
integer-valued measure on a standard Borel space. -/
def markKernel [StandardBorelSpace X] (K : Kernel X E) [IsMarkovKernel K] :
    Kernel (Measure X) (Measure (X × E)) := sorry

def IsIndependentMarking [StandardBorelSpace X] (N : Ω → Measure X) (K : Kernel X E)
    [IsMarkovKernel K] (M : Ω → Measure (X × E)) : Prop :=
  Measurable M ∧ (∀ᵐ ω ∂P, (M ω).map Prod.fst = N ω) ∧
    P.map (fun ω => (N ω, M ω)) = P.map N ⊗ₘ markKernel K

theorem isPoissonRandomMeasure_of_isIndependentMarking [StandardBorelSpace X]
    {N : Ω → Measure X} {Λ : Measure X} [SigmaFinite Λ] {K : Kernel X E} [IsMarkovKernel K]
    {M : Ω → Measure (X × E)} (hN : IsPoissonRandomMeasure P N Λ)
    (hM : IsIndependentMarking P N K M) :
    IsPoissonRandomMeasure P M (Λ ⊗ₘ K) := by
  sorry

theorem isPoissonRandomMeasure_map {N : Ω → Measure X} {Λ : Measure X}
    (hN : IsPoissonRandomMeasure P N Λ) {f : X → Y} (hf : Measurable f)
    [SigmaFinite (Λ.map f)] :
    IsPoissonRandomMeasure P (fun ω => (N ω).map f) (Λ.map f) := by
  sorry

theorem isPoissonRandomMeasure_sum {N : ℕ → Ω → Measure X} {Λ : ℕ → Measure X}
    (hind : iIndepFun N P) (h : ∀ i, IsPoissonRandomMeasure P (N i) (Λ i))
    [SigmaFinite (Measure.sum Λ)] :
    IsPoissonRandomMeasure P (fun ω => Measure.sum fun i => N i ω) (Measure.sum Λ) := by
  sorry

/-- The compound Poisson process: the sum of the real marks over `(0, t]`. -/
def compoundPoisson (M : Ω → Measure (ℝ≥0 × ℝ)) (t : ℝ≥0) (ω : Ω) : ℝ :=
  ∫ p, p.2 ∂((M ω).restrict (Set.Ioc 0 t ×ˢ Set.univ))

theorem charFun_compoundPoisson {M : Ω → Measure (ℝ≥0 × ℝ)} {γ : ℝ} (hγ : 0 < γ)
    {Q : Measure ℝ} [IsProbabilityMeasure Q]
    (hM : IsPoissonRandomMeasure P M ((ENNReal.ofReal γ • nnvolume).prod Q)) (t : ℝ≥0) (u : ℝ) :
    charFun (P.map (compoundPoisson M t)) u =
      Complex.exp (((γ * (t : ℝ) : ℝ) : ℂ) *
        ∫ z : ℝ, (Complex.exp ((u : ℂ) * (z : ℂ) * Complex.I) - 1) ∂Q) := by
  sorry

/-- A Poisson cluster process: independent clusters attached to the points of a Poisson parent
process and superposed. -/
def IsPoissonCluster [StandardBorelSpace X] (Λ : Measure X) [SigmaFinite Λ]
    (K : Kernel X (Measure X)) [IsMarkovKernel K] (N : Ω → Measure X) : Prop :=
  Measurable N ∧
    P.map N = (poissonLaw Λ).bind fun ξ =>
      (markKernel K ξ).map fun M => Measure.join (M.map Prod.snd)

theorem laplaceFunctional_of_isPoissonCluster [StandardBorelSpace X] {Λ : Measure X}
    [SigmaFinite Λ] {K : Kernel X (Measure X)} [IsMarkovKernel K] {N : Ω → Measure X}
    (h : IsPoissonCluster P Λ K N) {f : X → ℝ≥0∞} (hf : Measurable f) :
    laplaceFunctional P N f =
      (ENNReal.expNeg (∫⁻ x, (1 - ∫⁻ ζ, (ENNReal.expNeg (∫⁻ y, f y ∂ζ) : ℝ≥0∞) ∂K x) ∂Λ) :
        ℝ≥0∞) := by
  sorry

theorem tendsto_law_iff_laplaceFunctional {Λₙ : ℕ → Ω → LocallyFiniteMeasure S}
    {Λ : Ω → LocallyFiniteMeasure S} (hₙ : ∀ n, Measurable (Λₙ n)) (h : Measurable Λ) :
    Tendsto (fun n => law P (Λₙ n) (hₙ n)) atTop (𝓝 (law P Λ h)) ↔
      ∀ f : C_c(S, ℝ≥0), (∀ x, f x ≤ 1) →
        Tendsto (fun n => laplaceFunctional P (fun ω => (Λₙ n ω : Measure S)) fun x => (f x : ℝ≥0∞))
          atTop (𝓝 (laplaceFunctional P (fun ω => (Λ ω : Measure S)) fun x => (f x : ℝ≥0∞))) := by
  sorry

/-- Grigelionis' theorem for a null array of independent point processes. -/
theorem tendsto_sum_poissonLaw_of_nullArray {m : ℕ → ℕ}
    {ξ : (n : ℕ) → Fin (m n) → Ω → PointMeasure S}
    (hmeas : ∀ n j, Measurable (ξ n j)) (hind : ∀ n, iIndepFun (ξ n) P)
    (hnull : ∀ B, MeasurableSet B → IsCompact (closure B) →
      Tendsto (fun n => ⨆ j, P {ω | 0 < (ξ n j ω).count B}) atTop (𝓝 0))
    {Λ : LocallyFiniteMeasure S}
    (h1 : ∀ I, MeasurableSet I → IsCompact (closure I) → (Λ : Measure S) (frontier I) = 0 →
      Tendsto (fun n => ∑ j, P {ω | (ξ n j ω).count I = 1}) atTop (𝓝 ((Λ : Measure S) I)))
    (h2 : ∀ B, MeasurableSet B → IsCompact (closure B) →
      Tendsto (fun n => ∑ j, P {ω | 1 < (ξ n j ω).count B}) atTop (𝓝 0)) :
    Tendsto (fun n => law P (fun ω => PointMeasure.finsum fun j => ξ n j ω) sorry) atTop
      (𝓝 (⟨poissonPointKernel Λ, inferInstance⟩ : ProbabilityMeasure (PointMeasure S))) := by
  sorry

end Operations

/-! ## Layer 7: stationarity, mixing, and second-order structure -/

/-- Euclidean space, the carrier of the stationarity theory. -/
abbrev E (d : ℕ) := EuclideanSpace ℝ (Fin d)

/-- The unit cube `[0,1)^d`. -/
def unitCube (d : ℕ) : Set (E d) := {x | ∀ i, x i ∈ Set.Ico (0 : ℝ) 1}

section Stationary

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {G : Type*} [MetricSpace G] [PolishSpace G] [LocallyCompactSpace G] [MeasurableSpace G]
  [BorelSpace G] [AddGroup G] [IsTopologicalAddGroup G]

/-- Translation: `(x +ᵥ μ) B = μ (B + x)`, moving a point at `x` to the origin. -/
instance : VAdd G (LocallyFiniteMeasure G) where
  vadd x μ := ⟨(μ : Measure G).map (· - x), sorry⟩

instance : VAdd G (PointMeasure G) where
  vadd x ξ := ⟨(ξ : Measure G).map (· - x), sorry, sorry⟩

theorem coe_vadd_apply (x : G) (μ : LocallyFiniteMeasure G) {B : Set G} (hB : MeasurableSet B) :
    ((x +ᵥ μ : LocallyFiniteMeasure G) : Measure G) B = (μ : Measure G) ((· + x) '' B) := by
  sorry

/-- The intensity density: the mean mass of a chosen unit set, `unitCube d` on `E d` and
`Set.Ico 0 1` on the line. -/
def intensityDensity (Λ : Ω → LocallyFiniteMeasure G) (U : Set G) : ℝ≥0∞ :=
  intensity P (fun ω => (Λ ω : Measure G)) U

theorem intensity_eq_smul_volume {d : ℕ} {Λ : Ω → LocallyFiniteMeasure (E d)} (hΛ : Measurable Λ)
    [VAddInvariantMeasure (E d) (LocallyFiniteMeasure (E d)) (P.map Λ)]
    (hfin : intensityDensity P Λ (unitCube d) < ∞) :
    intensity P (fun ω => (Λ ω : Measure (E d))) = intensityDensity P Λ (unitCube d) • volume := by
  sorry

/-- The reduced second factorial moment measure of a stationary point process. -/
def reducedSecondFactorialMomentMeasure (P : Measure Ω) {d : ℕ} (N : Ω → PointMeasure (E d)) :
    Measure (E d) :=
  sorry

theorem variance_count_eq_covariogram {d : ℕ} {N : Ω → PointMeasure (E d)} (hN : Measurable N)
    [VAddInvariantMeasure (E d) (PointMeasure (E d)) (P.map N)]
    [IsFiniteMeasureOnCompacts (reducedSecondFactorialMomentMeasure P N)]
    {W : Set (E d)} (hW : MeasurableSet W) (hWc : IsCompact (closure W)) :
    variance (fun ω => (((N ω).count W).toNat : ℝ)) P =
      (intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d)).toReal *
          (volume W).toReal +
        (∫⁻ x, volume (W ∩ ((· - x) '' W)) ∂reducedSecondFactorialMomentMeasure P N).toReal -
        ((intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d)).toReal *
          (volume W).toReal) ^ 2 := by
  sorry

end Stationary

/-! ## Layer 8: stationary Palm distributions, inversion, and stationary renewal processes -/

section StationaryPalm

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P] {d : ℕ}

/-- The stationary Palm probability, normalized on the unit cube. -/
def palmProbability (N : Ω → PointMeasure (E d)) : Measure (PointMeasure (E d)) :=
  (intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))⁻¹ •
    P.bind fun ω => ((N ω : Measure (E d)).restrict (unitCube d)).map fun x => x +ᵥ N ω

theorem refinedCampbell {N : Ω → PointMeasure (E d)} (hN : Measurable N)
    [VAddInvariantMeasure (E d) (PointMeasure (E d)) (P.map N)]
    (h0 : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))
    (hfin : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞)
    {f : E d × PointMeasure (E d) → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ ω, ∫⁻ x, f (x, x +ᵥ N ω) ∂(N ω : Measure (E d)) ∂P =
      intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) *
        ∫⁻ x, ∫⁻ ξ, f (x, ξ) ∂palmProbability P N ∂volume := by
  sorry

theorem palmKernel_ae_eq_palmProbability {N : Ω → PointMeasure (E d)} (hN : Measurable N)
    [VAddInvariantMeasure (E d) (PointMeasure (E d)) (P.map N)]
    [SigmaFinite (intensity P fun ω => (N ω : Measure (E d)))]
    (h0 : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))
    (hfin : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞) :
    ∀ᵐ x ∂volume, palmKernel P (fun ω => (N ω : Measure (E d))) N x =
      (palmProbability P N).map fun ξ => (-x) +ᵥ ξ := by
  sorry

theorem isPoissonPointProcess_iff_palmProbability_eq {N : Ω → PointMeasure (E d)}
    (hN : Measurable N) [VAddInvariantMeasure (E d) (PointMeasure (E d)) (P.map N)]
    (h0 : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))
    (hfin : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞) :
    IsPoissonPointProcess P N
        (intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) • volume) ↔
      palmProbability P N = P.map fun ω => (N ω).insert 0 := by
  sorry

/-- The Voronoi cell of the location `x` in the configuration `ξ`, ties included. -/
def voronoiCell (ξ : PointMeasure (E d)) (x : E d) : Set (E d) :=
  {y | ∀ z, 0 < (ξ : Measure (E d)) {z} → dist y x ≤ dist y z}

theorem lintegral_volume_voronoiCell_palmProbability {N : Ω → PointMeasure (E d)}
    (hN : Measurable N) [VAddInvariantMeasure (E d) (PointMeasure (E d)) (P.map N)]
    (h0 : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))
    (hfin : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d) < ∞)
    (hs : ∀ᵐ ω ∂P, (N ω).IsSimple) :
    ∫⁻ ξ, volume (voronoiCell ξ 0) ∂palmProbability P N =
      (intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure (E d))) (unitCube d))⁻¹ := by
  sorry

/-- The first occurrence of a point measure on the line strictly after the origin. -/
def nextOccurrence (ξ : PointMeasure ℝ) : ℝ :=
  sInf {t | 0 < t ∧ 0 < (ξ : Measure ℝ) {t}}

/-- The stationary Palm probability on the line, normalized on `[0, 1)`. -/
def linePalmProbability (N : Ω → PointMeasure ℝ) : Measure (PointMeasure ℝ) :=
  (intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure ℝ)) (Set.Ico 0 1))⁻¹ •
    P.bind fun ω => ((N ω : Measure ℝ).restrict (Set.Ico 0 1)).map fun x => x +ᵥ N ω

theorem palmKhinchin_inversion {N : Ω → PointMeasure ℝ} (hN : Measurable N)
    [VAddInvariantMeasure ℝ (PointMeasure ℝ) (P.map N)]
    (h0 : 0 < intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure ℝ)) (Set.Ico 0 1))
    (hfin : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure ℝ)) (Set.Ico 0 1) < ∞)
    (hs : ∀ᵐ ω ∂P, (N ω).IsSimple) {f : PointMeasure ℝ → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ ω, f (N ω) ∂P =
      intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure ℝ)) (Set.Ico 0 1) *
        ∫⁻ ξ, (∫⁻ t in Set.Ico (0 : ℝ) (nextOccurrence ξ), f (t +ᵥ ξ)) ∂linePalmProbability P N := by
  sorry

/-- The Palm renewal law: `S₀ = 0` and two-sided i.i.d. increments of law `F`. -/
def renewalPalmLaw (F : Measure ℝ) : Measure (PointMeasure ℝ) := sorry

/-- The stationary renewal law, the Palm inversion of `renewalPalmLaw F`. -/
def stationaryRenewalLaw (F : Measure ℝ) : Measure (PointMeasure ℝ) := sorry

instance (F : Measure ℝ) : IsProbabilityMeasure (stationaryRenewalLaw F) := sorry

theorem vaddInvariantMeasure_stationaryRenewalLaw {F : Measure ℝ} [IsProbabilityMeasure F]
    (hF : F (Set.Iic 0) = 0) (hm : 0 < ∫ t, t ∂F) (hm' : Integrable id F) :
    VAddInvariantMeasure ℝ (PointMeasure ℝ) (stationaryRenewalLaw F) := by
  sorry

theorem linePalmProbability_stationaryRenewalLaw {F : Measure ℝ} [IsProbabilityMeasure F]
    (hF : F (Set.Iic 0) = 0) (hm : 0 < ∫ t, t ∂F) (hm' : Integrable id F) :
    linePalmProbability (stationaryRenewalLaw F) id = renewalPalmLaw F := by
  sorry

theorem stationaryRenewalLaw_expMeasure {γ : ℝ} (hγ : 0 < γ) :
    stationaryRenewalLaw (expMeasure γ) = poissonPointLaw ((Real.toNNReal γ : ℝ≥0) • volume) := by
  sorry

end StationaryPalm

/-! ## Layer 9: Cox processes -/

section Cox

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- `N` is Cox directed by `Λ`: the joint law is the director law composed with the Poisson
kernel. -/
def IsCox (Λ : Ω → LocallyFiniteMeasure S) (N : Ω → PointMeasure S) : Prop :=
  Measurable Λ ∧ Measurable N ∧
    P.map (fun ω => (Λ ω, N ω)) = P.map Λ ⊗ₘ poissonPointKernel

def coxLaw (ν : Measure (LocallyFiniteMeasure S)) : Measure (PointMeasure S) :=
  ν.bind poissonPointKernel

theorem laplaceFunctional_of_isCox {Λ : Ω → LocallyFiniteMeasure S} {N : Ω → PointMeasure S}
    (h : IsCox P Λ N) {f : S → ℝ≥0∞} (hf : Measurable f) :
    laplaceFunctional P (fun ω => (N ω : Measure S)) f =
      laplaceFunctional P (fun ω => (Λ ω : Measure S)) fun x =>
        1 - (ENNReal.expNeg (f x) : ℝ≥0∞) := by
  sorry

theorem variance_count_of_isCox {Λ : Ω → LocallyFiniteMeasure S} {N : Ω → PointMeasure S}
    (h : IsCox P Λ N) {B : Set S} (hB : MeasurableSet B) (hBc : IsCompact (closure B))
    (h2 : ∫⁻ ω, ((Λ ω : Measure S) B) ^ 2 ∂P < ∞) :
    variance (fun ω => (((N ω).count B).toNat : ℝ)) P =
      (∫⁻ ω, (Λ ω : Measure S) B ∂P).toReal +
        variance (fun ω => ((Λ ω : Measure S) B).toReal) P := by
  sorry

theorem map_eq_of_isCox_of_map_eq {Ω' : Type*} [MeasurableSpace Ω'] {P' : Measure Ω'}
    [IsProbabilityMeasure P'] {Λ : Ω → LocallyFiniteMeasure S} {N : Ω → PointMeasure S}
    {Λ' : Ω' → LocallyFiniteMeasure S} {N' : Ω' → PointMeasure S}
    (h : IsCox P Λ N) (h' : IsCox P' Λ' N') (hN : P.map N = P'.map N') :
    P.map Λ = P'.map Λ' := by
  sorry

theorem isCox_iff_campbell {Λ : Ω → LocallyFiniteMeasure S} {N : Ω → PointMeasure S}
    (hΛ : Measurable Λ) (hN : Measurable N) :
    IsCox P Λ N ↔
      ∀ f : S × PointMeasure S × LocallyFiniteMeasure S → ℝ≥0∞, Measurable f →
        ∫⁻ ω, ∫⁻ x, f (x, N ω, Λ ω) ∂(N ω : Measure S) ∂P =
          ∫⁻ ω, ∫⁻ x, f (x, (N ω).insert x, Λ ω) ∂(Λ ω : Measure S) ∂P := by
  sorry

theorem ae_isSimple_iff_of_isCox {Λ : Ω → LocallyFiniteMeasure S} {N : Ω → PointMeasure S}
    (h : IsCox P Λ N) :
    (∀ᵐ ω ∂P, (N ω).IsSimple) ↔ ∀ᵐ ω ∂P, ∀ x, (Λ ω : Measure S) {x} = 0 := by
  sorry

theorem vaddInvariantMeasure_map_iff_of_isCox {d : ℕ} {Λ : Ω → LocallyFiniteMeasure (E d)}
    {N : Ω → PointMeasure (E d)} (h : IsCox P Λ N) :
    VAddInvariantMeasure (E d) (PointMeasure (E d)) (P.map N) ↔
      VAddInvariantMeasure (E d) (LocallyFiniteMeasure (E d)) (P.map Λ) := by
  sorry

theorem reducedPalmKernel_of_isCox {Λ : Ω → LocallyFiniteMeasure S} {N : Ω → PointMeasure S}
    (h : IsCox P Λ N) [SigmaFinite (intensity P fun ω => (Λ ω : Measure S))]
    [SigmaFinite (intensity P fun ω => (N ω : Measure S))] :
    ∀ᵐ x ∂intensity P (fun ω => (Λ ω : Measure S)),
      reducedPalmKernel P N x =
        (palmKernel P (fun ω => (Λ ω : Measure S)) Λ x).bind poissonPointKernel := by
  sorry

end Cox

/-! ## Layer 10: temporal histories, compensators, and stochastic intensities -/

/-- Temporal marked point measures: no mass at time zero. -/
def TemporalPointMeasure (E : Type*) [MeasurableSpace E] :=
  {μ : MarkedPointMeasure ℝ≥0 E // (μ.1 : Measure (ℝ≥0 × E)) ({0} ×ˢ Set.univ) = 0}

section Temporal

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {E : Type*} [MeasurableSpace E] [StandardBorelSpace E] [Nonempty E]

instance : MeasurableSpace (MarkedLocallyFiniteMeasure ℝ≥0 E) := Subtype.instMeasurableSpace
instance : MeasurableSpace (MarkedPointMeasure ℝ≥0 E) := Subtype.instMeasurableSpace
instance : MeasurableSpace (TemporalPointMeasure E) := Subtype.instMeasurableSpace

instance : CoeOut (TemporalPointMeasure E) (Measure (ℝ≥0 × E)) := ⟨fun N => N.1.1⟩
instance : CoeOut (MarkedLocallyFiniteMeasure ℝ≥0 E) (Measure (ℝ≥0 × E)) := ⟨Subtype.val⟩

/-- The `n`th event time, or `∞`. -/
def eventTime (N : TemporalPointMeasure E) (n : ℕ) : ℝ≥0∞ := sorry

/-- The counting process `N((0, t] × E)`. -/
def countProcess (N : TemporalPointMeasure E) (t : ℝ≥0) : ℕ∞ :=
  if (N : Measure (ℝ≥0 × E)) (Set.Ioc 0 t ×ˢ Set.univ) = ∞ then ⊤
  else (⌊((N : Measure (ℝ≥0 × E)) (Set.Ioc 0 t ×ˢ Set.univ)).toNNReal⌋₊ : ℕ∞)

/-- The ground process has no two occurrences at the same time. -/
def TemporalPointMeasure.IsTimeSimple (N : TemporalPointMeasure E) : Prop :=
  ∀ t, (N : Measure (ℝ≥0 × E)) ({t} ×ˢ Set.univ) ≤ 1

/-- The internal history: generated by `N((0, s] × B)` for `s ≤ t`. -/
def internalHistory (N : Ω → TemporalPointMeasure E) (hN : Measurable N) : Filtration ℝ≥0 mΩ :=
  sorry

/-- The constant filtration generated by an initial random element `Z`. -/
def initialEnlargement {Z' : Type*} [MeasurableSpace Z'] (Z : Ω → Z') (hZ : Measurable Z) :
    Filtration ℝ≥0 mΩ where
  seq _ := MeasurableSpace.comap Z inferInstance
  mono' _ _ _ := le_rfl
  le' _ := hZ.comap_le

/-- A marked predictable integrand. -/
def IsPredictableIntegrand (𝓕 : Filtration ℝ≥0 mΩ) (H : ℝ≥0 × Ω × E → ℝ≥0∞) : Prop :=
  Measurable[(𝓕.predictable).prod inferInstance] fun q : (ℝ≥0 × Ω) × E => H (q.1.1, q.1.2, q.2)

/-- `A` is a compensator of `N` in `𝓕`: a predictable random marked measure satisfying the
integral identity against every nonnegative predictable integrand. -/
def IsCompensator (𝓕 : Filtration ℝ≥0 mΩ) (N : Ω → TemporalPointMeasure E)
    (A : Ω → MarkedLocallyFiniteMeasure ℝ≥0 E) : Prop :=
  Measurable A ∧
    (∀ B : Set E, MeasurableSet B →
      Measurable[𝓕.predictable] fun p : ℝ≥0 × Ω =>
        (A p.2 : Measure (ℝ≥0 × E)) (Set.Ioc 0 p.1 ×ˢ B)) ∧
    ∀ H, IsPredictableIntegrand 𝓕 H →
      ∫⁻ ω, ∫⁻ p, H (p.1, ω, p.2) ∂(N ω : Measure (ℝ≥0 × E)) ∂P =
        ∫⁻ ω, ∫⁻ p, H (p.1, ω, p.2) ∂(A ω : Measure (ℝ≥0 × E)) ∂P

theorem IsCompensator.ae_eq {𝓕 : Filtration ℝ≥0 mΩ} {N : Ω → TemporalPointMeasure E}
    {A A' : Ω → MarkedLocallyFiniteMeasure ℝ≥0 E} (h : IsCompensator P 𝓕 N A)
    (h' : IsCompensator P 𝓕 N A') :
    ∀ᵐ ω ∂P, A ω = A' ω := by
  sorry

/-- The hazard compensator of the internal history enlarged by the initial random element `Z`,
built from the regular conditional laws of the next interval and mark. -/
def hazardCompensator (P : Measure Ω) {Z' : Type*} [MeasurableSpace Z'] (Z : Ω → Z')
    (N : Ω → TemporalPointMeasure E) : Ω → MarkedLocallyFiniteMeasure ℝ≥0 E :=
  sorry

theorem isCompensator_hazardCompensator {Z' : Type*} [MeasurableSpace Z'] [StandardBorelSpace Z']
    {Z : Ω → Z'} (hZ : Measurable Z) {N : Ω → TemporalPointMeasure E} (hN : Measurable N) :
    IsCompensator P (initialEnlargement Z hZ ⊔ internalHistory N hN) N (hazardCompensator P Z N) := by
  sorry

/-- `N` has stochastic intensity `lam` relative to the reference measure `Q` in `𝓕`. -/
def HasStochasticIntensity (𝓕 : Filtration ℝ≥0 mΩ) (N : Ω → TemporalPointMeasure E)
    (Q : Measure E) [SigmaFinite Q] (lam : ℝ≥0 × Ω × E → ℝ≥0∞) : Prop :=
  IsPredictableIntegrand 𝓕 lam ∧
    ∃ A : Ω → MarkedLocallyFiniteMeasure ℝ≥0 E, IsCompensator P 𝓕 N A ∧
      ∀ᵐ ω ∂P, (A ω : Measure (ℝ≥0 × E)) =
        (nnvolume.prod Q).withDensity fun p => lam (p.1, ω, p.2)

theorem HasStochasticIntensity.ae_eq {𝓕 : Filtration ℝ≥0 mΩ} {N : Ω → TemporalPointMeasure E}
    {Q : Measure E} [SigmaFinite Q] {lam lam' : ℝ≥0 × Ω × E → ℝ≥0∞}
    (h : HasStochasticIntensity P 𝓕 N Q lam) (h' : HasStochasticIntensity P 𝓕 N Q lam') :
    ∀ᵐ q ∂(nnvolume.prod (P.prod Q)), lam (q.1, q.2.1, q.2.2) = lam' (q.1, q.2.1, q.2.2) := by
  sorry

theorem martingale_compensated_integral {𝓕 : Filtration ℝ≥0 mΩ} {N : Ω → TemporalPointMeasure E}
    {A : Ω → MarkedLocallyFiniteMeasure ℝ≥0 E} (h : IsCompensator P 𝓕 N A)
    {H : ℝ≥0 × Ω × E → ℝ} (hH : IsPredictableIntegrand 𝓕 fun q => ‖H q‖ₑ)
    (hint : ∀ t, ∫⁻ ω, ∫⁻ p in Set.Ioc 0 t ×ˢ Set.univ, ‖H (p.1, ω, p.2)‖ₑ
      ∂(A ω : Measure (ℝ≥0 × E)) ∂P < ∞) :
    Martingale (fun t ω =>
      (∫ p in Set.Ioc 0 t ×ˢ Set.univ, H (p.1, ω, p.2) ∂(N ω : Measure (ℝ≥0 × E))) -
        ∫ p in Set.Ioc 0 t ×ˢ Set.univ, H (p.1, ω, p.2) ∂(A ω : Measure (ℝ≥0 × E))) 𝓕 P := by
  sorry

end Temporal

/-! ## Layer 11: Watanabe, random time change, and Poisson embedding -/

section TimeChange

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
variable {E : Type*} [MeasurableSpace E] [StandardBorelSpace E] [Nonempty E]
variable {E' : Type*} [MeasurableSpace E']

/-- An `𝓕`-adapted Poisson random measure on `ℝ≥0 × E'`: its past is adapted and its future is
independent of the present. -/
def IsAdaptedPoisson (𝓕 : Filtration ℝ≥0 mΩ) (M : Ω → Measure (ℝ≥0 × E'))
    (μ : Measure (ℝ≥0 × E')) : Prop :=
  IsPoissonRandomMeasure P M μ ∧
    (∀ t, Measurable[𝓕 t] fun ω => (M ω).restrict (Set.Iic t ×ˢ Set.univ)) ∧
    ∀ t, Indep (MeasurableSpace.comap (fun ω => (M ω).restrict (Set.Ioi t ×ˢ Set.univ))
      inferInstance) (𝓕 t) P

/-- Watanabe's characterization. -/
theorem isAdaptedPoisson_of_isCompensator_const {𝓕 : Filtration ℝ≥0 mΩ}
    {N : Ω → TemporalPointMeasure Unit} (hN : Measurable N)
    (hs : ∀ᵐ ω ∂P, (N ω).IsTimeSimple) {ν : Measure ℝ≥0} [IsFiniteMeasureOnCompacts ν] [NullSingletonClass ν]
    (h : IsCompensator P 𝓕 N fun _ => ⟨ν.prod (Measure.dirac ()), sorry⟩) :
    IsAdaptedPoisson P 𝓕 (fun ω => (N ω : Measure (ℝ≥0 × Unit)))
      (ν.prod (Measure.dirac ())) := by
  sorry

/-- The cumulative clock `t ↦ A((0, t] × E)`. -/
def clock (A : Ω → MarkedLocallyFiniteMeasure ℝ≥0 E) (ω : Ω) (t : ℝ≥0) : ℝ≥0 :=
  ((A ω : Measure (ℝ≥0 × E)) (Set.Ioc 0 t ×ˢ Set.univ)).toNNReal

/-- Random time change: event times transformed by a continuous nonterminating compensator form a
unit-rate Poisson process. -/
theorem isPoissonRandomMeasure_map_clock {𝓕 : Filtration ℝ≥0 mΩ}
    {N : Ω → TemporalPointMeasure Unit} (hN : Measurable N)
    (hs : ∀ᵐ ω ∂P, (N ω).IsTimeSimple) {A : Ω → MarkedLocallyFiniteMeasure ℝ≥0 Unit}
    (h : IsCompensator P 𝓕 N A)
    (hcont : ∀ᵐ ω ∂P, ∀ t, (A ω : Measure (ℝ≥0 × Unit)) ({t} ×ˢ Set.univ) = 0)
    (hinf : ∀ᵐ ω ∂P, Tendsto (fun t => (A ω : Measure (ℝ≥0 × Unit)) (Set.Ioc 0 t ×ˢ Set.univ))
      atTop (𝓝 ∞)) :
    IsPoissonRandomMeasure P
      (fun ω => (N ω : Measure (ℝ≥0 × Unit)).map fun p => (clock A ω p.1, p.2))
      (nnvolume.prod (Measure.dirac ())) := by
  sorry

/-- The thinning of a master Poisson random measure by the acceptance region `u ≤ f (t, ω, z)`. -/
def embedMeasure (M : Ω → Measure (ℝ≥0 × E × ℝ≥0)) (f : ℝ≥0 × Ω × E → ℝ≥0∞) (ω : Ω) :
    Measure (ℝ≥0 × E) :=
  ((M ω).restrict {q | (q.2.2 : ℝ≥0∞) ≤ f (q.1, ω, q.2.1)}).map fun q => (q.1, q.2.1)

/-- Poisson embedding: the thinning has stochastic intensity `f`. -/
theorem exists_hasStochasticIntensity_embedMeasure {𝓕 : Filtration ℝ≥0 mΩ}
    {M : Ω → Measure (ℝ≥0 × E × ℝ≥0)} {Q : Measure E} [SigmaFinite Q]
    (hM : IsAdaptedPoisson P 𝓕 M (nnvolume.prod (Q.prod nnvolume)))
    {f : ℝ≥0 × Ω × E → ℝ≥0∞} (hf : IsPredictableIntegrand 𝓕 f)
    (hloc : ∀ T, ∀ᵐ ω ∂P, ∫⁻ t in Set.Iic T, (∫⁻ z, f (t, ω, z) ∂Q) ∂nnvolume < ∞) :
    ∃ N : Ω → TemporalPointMeasure E, (∀ᵐ ω ∂P, (N ω : Measure (ℝ≥0 × E)) = embedMeasure M f ω) ∧
      HasStochasticIntensity P 𝓕 N Q f := by
  sorry

/-- A causal intensity functional: measurable, and depending on the configuration only through its
strict past. -/
def CausalMeasurable (ψ : ℝ≥0 → E → Measure (ℝ≥0 × E) → ℝ≥0∞) : Prop :=
  Measurable (fun p : ℝ≥0 × E × Measure (ℝ≥0 × E) => ψ p.1 p.2.1 p.2.2) ∧
    ∀ t z ξ, ψ t z ξ = ψ t z (ξ.restrict (Set.Iio t ×ˢ Set.univ))

/-- The Lipschitz bound `|ψ(ξ) - ψ(ξ')| ≤ ∫ h(t - s, z, η) |ξ - ξ'|(ds × dη)`, with the total
variation `|ξ - ξ'|` written through Mathlib's measure subtraction. -/
def LipschitzIntensity (ψ : ℝ≥0 → E → Measure (ℝ≥0 × E) → ℝ≥0∞)
    (h : ℝ≥0 → E → E → ℝ≥0∞) : Prop :=
  ∀ t z ξ ξ', ψ t z ξ ≤ ψ t z ξ' +
    ∫⁻ q in Set.Iio t ×ˢ Set.univ, h (t - q.1) z q.2 ∂((ξ - ξ') + (ξ' - ξ))

/-- Integrable kernel with a `ρ`-subinvariant positive function `r`. -/
def SubinvariantKernel (h : ℝ≥0 → E → E → ℝ≥0∞) (Q : Measure E) (r : E → ℝ≥0∞) (ρ : ℝ≥0∞) :
    Prop :=
  (∀ z η, ∫⁻ t, h t z η ∂nnvolume < ∞) ∧ (∀ z, 0 < r z) ∧ ∫⁻ z, r z ∂Q < ∞ ∧
    ∀ z, ∫⁻ η, (∫⁻ t, h t z η ∂nnvolume) * r η ∂Q ≤ ρ * r z

/-- Existence and pathwise uniqueness for a Lipschitz intensity functional, by Poisson embedding
and Picard iteration on a deterministic partition. -/
theorem exists_solution_of_lipschitz {𝓕 : Filtration ℝ≥0 mΩ}
    {M : Ω → Measure (ℝ≥0 × E × ℝ≥0)} {Q : Measure E} [SigmaFinite Q]
    (hM : IsAdaptedPoisson P 𝓕 M (nnvolume.prod (Q.prod nnvolume)))
    (ψ : ℝ≥0 → E → Measure (ℝ≥0 × E) → ℝ≥0∞) (hψ : CausalMeasurable ψ)
    (h : ℝ≥0 → E → E → ℝ≥0∞) (hlip : LipschitzIntensity ψ h) {r : E → ℝ≥0∞} {ρ : ℝ≥0∞}
    (hH : SubinvariantKernel h Q r ρ) (hρ : ρ < 1) {C : ℝ≥0∞} (hC : C < ∞)
    (hψ0 : ∀ t z, ψ t z 0 ≤ C * r z) :
    ∃ N : Ω → TemporalPointMeasure E, Measurable N ∧
      (∀ᵐ ω ∂P, (N ω : Measure (ℝ≥0 × E)) =
        embedMeasure M (fun q => ψ q.1 q.2.2 (N q.2.1 : Measure (ℝ≥0 × E))) ω) ∧
      ∀ N' : Ω → TemporalPointMeasure E, Measurable N' →
        (∀ᵐ ω ∂P, (N' ω : Measure (ℝ≥0 × E)) =
          embedMeasure M (fun q => ψ q.1 q.2.2 (N' q.2.1 : Measure (ℝ≥0 × E))) ω) →
        ∀ᵐ ω ∂P, N ω = N' ω := by
  sorry

end TimeChange

/-! ## Layer 12: the subcritical linear Hawkes capstone -/

section Hawkes

variable {Ω : Type*} [mΩ : MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]

/-- The linear Hawkes intensity `ν + ∫_{(-∞, t)} h (t - s) ξ(ds)`. -/
def hawkesIntensity (ν : ℝ) (h : ℝ → ℝ≥0) (ξ : PointMeasure ℝ) (t : ℝ) : ℝ≥0∞ :=
  ENNReal.ofReal ν + ∫⁻ s in Set.Iio t, (h (t - s) : ℝ≥0∞) ∂(ξ : Measure ℝ)

/-- The restriction of a configuration on the line to `(a, ∞)`, viewed as a temporal point measure
started at `a`. -/
def windowRestrict (ξ : PointMeasure ℝ) (a : ℝ) : TemporalPointMeasure Unit :=
  ⟨⟨((ξ : Measure ℝ).restrict (Set.Ioi a)).map fun s => (Real.toNNReal (s - a), ()),
    sorry, sorry⟩, sorry⟩

/-- The history generated by `N` restricted to `(-∞, a + t]`. -/
def windowHistory (N : Ω → PointMeasure ℝ) (a : ℝ) : Filtration ℝ≥0 mΩ := sorry

/-- `N` has the Hawkes intensity in every half-line window. -/
def HasHawkesIntensity (ν : ℝ) (h : ℝ → ℝ≥0) (N : Ω → PointMeasure ℝ) : Prop :=
  Measurable N ∧ ∀ a : ℝ,
    HasStochasticIntensity P (windowHistory N a) (fun ω => windowRestrict (N ω) a)
      (Measure.dirac ()) fun q => hawkesIntensity ν h (N q.2.1) (a + q.1)

/-- The empty-past Hawkes process on the half line. -/
def IsEmptyPastHawkes (ν : ℝ) (h : ℝ → ℝ≥0) (N : Ω → PointMeasure ℝ) : Prop :=
  (∀ ω, (N ω : Measure ℝ) (Set.Iic 0) = 0) ∧ Measurable N ∧
    HasStochasticIntensity P (windowHistory N 0) (fun ω => windowRestrict (N ω) 0)
      (Measure.dirac ()) fun q => hawkesIntensity ν h (N q.2.1) q.1

/-- The law of the family tree of an ancestor at `x`, with Poisson offspring at age intensity
`h(s) ds`. -/
def hawkesClusterKernel (h : ℝ → ℝ≥0) : Kernel ℝ (Measure ℝ) := sorry

theorem lintegral_count_hawkesClusterKernel {h : ℝ → ℝ≥0} (hint : Integrable (fun s => (h s : ℝ)))
    (hm : ∫ s, (h s : ℝ) < 1) (x : ℝ) :
    ∫⁻ ζ, ζ Set.univ ∂hawkesClusterKernel h x = ENNReal.ofReal (1 / (1 - ∫ s, (h s : ℝ))) := by
  sorry

/-- The stationary Hawkes law: the Poisson cluster process with immigrant intensity `ν • volume`
and the Hawkes cluster kernel. -/
def stationaryHawkesLaw (ν : ℝ) (h : ℝ → ℝ≥0) : Measure (PointMeasure ℝ) := sorry

instance (ν : ℝ) (h : ℝ → ℝ≥0) : IsProbabilityMeasure (stationaryHawkesLaw ν h) := sorry

theorem vaddInvariantMeasure_stationaryHawkesLaw {ν : ℝ} {h : ℝ → ℝ≥0} (hν : 0 < ν)
    (hint : Integrable (fun s => (h s : ℝ))) (hm : ∫ s, (h s : ℝ) < 1) :
    VAddInvariantMeasure ℝ (PointMeasure ℝ) (stationaryHawkesLaw ν h) := by
  sorry

theorem intensityDensity_stationaryHawkesLaw {ν : ℝ} {h : ℝ → ℝ≥0} (hν : 0 < ν)
    (hint : Integrable (fun s => (h s : ℝ))) (hm : ∫ s, (h s : ℝ) < 1) :
    intensityDensity (stationaryHawkesLaw ν h) (fun ξ : PointMeasure ℝ => (ξ : LocallyFiniteMeasure ℝ)) (Set.Ico 0 1) =
      ENNReal.ofReal (ν / (1 - ∫ s, (h s : ℝ))) := by
  sorry

theorem hasHawkesIntensity_stationaryHawkesLaw {ν : ℝ} {h : ℝ → ℝ≥0} (hν : 0 < ν)
    (hint : Integrable (fun s => (h s : ℝ))) (hm : ∫ s, (h s : ℝ) < 1) :
    HasHawkesIntensity (stationaryHawkesLaw ν h) ν h id := by
  sorry

theorem map_eq_stationaryHawkesLaw {ν : ℝ} {h : ℝ → ℝ≥0} (hν : 0 < ν)
    (hint : Integrable (fun s => (h s : ℝ))) (hm : ∫ s, (h s : ℝ) < 1) {N : Ω → PointMeasure ℝ}
    (hN : HasHawkesIntensity P ν h N) [VAddInvariantMeasure ℝ (PointMeasure ℝ) (P.map N)]
    (hfin : intensityDensity P (fun ω => (N ω : LocallyFiniteMeasure ℝ)) (Set.Ico 0 1) < ∞) :
    P.map N = stationaryHawkesLaw ν h := by
  sorry

/-- Convergence from the empty past, in total variation on every window `(0, L]` after
translation by `T`. -/
theorem tendsto_emptyPast_restrict {ν : ℝ} {h : ℝ → ℝ≥0} (hν : 0 < ν)
    (hint : Integrable (fun s => (h s : ℝ))) (hm : ∫ s, (h s : ℝ) < 1) {N : Ω → PointMeasure ℝ}
    (hN : IsEmptyPastHawkes P ν h N) (L : ℝ) :
    Tendsto (fun T : ℝ => ⨆ s : {s : Set (PointMeasure ℝ) // MeasurableSet s},
        dist ((P.map fun ω => ((-T) +ᵥ N ω).restrict (Set.Ioc 0 L)) s).toReal
          (((stationaryHawkesLaw ν h).map fun ξ => ξ.restrict (Set.Ioc 0 L)) s).toReal)
      atTop (𝓝 0) := by
  sorry

end Hawkes

end TauCetiRoadmap.PointProcesses

end
