module

public import Mathlib

/-!
# Finite Gibbs point processes: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines of
`README.md` that carry a Lean name, each with every conclusion the README attaches to it, together
with the definitions their statements need. The README's other headlines are targets of the same
standing, stated in prose.

Conventions (README, Conventions). A finite configuration is a `Finset S`. Its σ-algebra
`configMeasurableSpace` is the final σ-algebra of the maps `toConfig : (Fin n → S) → Finset S`,
`n : ℕ`. The reference law on a window `W` is `poissonConfigLaw μ W`, the image of the Poisson
process with intensity `μ|W`; for an atomless `μ` it is the image of the Poisson process of
SpatialPointProcessFoundations under `PointMeasure.toFinset`
(`map_toFinset_of_isPoissonPointProcess`). Unnormalised densities take values in `ℝ≥0`, laws and
partition functions in `ℝ≥0∞`. The Papangelou intensity `papangelou f x ξ` takes the configuration
first and the point second, and is `0` where `f x = 0`. The Gibbs weight is `e^{-βH}` with weight
`0` where `H = ⊤` and `β ≠ 0`, and weight `1` for `β = 0`, so that `gibbsLaw μ Λ z 0 H` is the
Poisson law of intensity `z`.

Local copies. `expNeg`, `IsIntegerValued`, `IsPoissonRandomMeasure`, `LocallyFiniteMeasure`,
`PointMeasure`, their coercions, the vague topology and its Borel σ-algebra, and
`IsPoissonPointProcess` are verbatim copies of the definitions of the
SpatialPointProcessFoundations roadmap of the spatial statistics family (§§1.1–1.2, 5.1–5.2), at
their short names in this roadmap's namespace, as that roadmap places them; the first three are
its copies of Tau Ceti's definitions. `mhKernel` is a verbatim copy of the Metropolis–Hastings
kernel of LangevinAndHamiltonianMonteCarlo §1.1. Finite point processes with a density, the
Papangelou intensity, the Georgii–Nguyen–Zessin formula and the hard-core density are owned
here (§§1.3, 4.1).

The prototypes live in the namespace `TauCetiRoadmap.FiniteGibbsPointProcesses`; the
implementation namespace of the README is `TauCeti`.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology Function InformationTheory
open scoped ENNReal NNReal CompactlySupported InnerProductSpace

attribute [local instance] Classical.propDecidable

namespace TauCetiRoadmap.FiniteGibbsPointProcesses

/-! ## Local copies from SpatialPointProcessFoundations -/

section Copies

variable {Ω X : Type*} [MeasurableSpace Ω] [MeasurableSpace X]

/-- Local copy of SpatialPointProcessFoundations §5.2 (its copy of Tau Ceti's `expNeg`): the
negative exponential, with value zero at infinity. -/
def expNeg (x : ℝ≥0∞) : ℝ≥0 := (EReal.exp (-x.toEReal)).toNNReal

/-- Local copy of SpatialPointProcessFoundations §1.1 (its copy of Tau Ceti's
`MeasureTheory.Measure.IsIntegerValued`): a measure is integer-valued if every measurable set of
finite mass has natural-number mass. -/
def IsIntegerValued (μ : Measure X) : Prop :=
  ∀ ⦃A : Set X⦄, MeasurableSet A → μ A < ∞ → ∃ n : ℕ, μ A = n

/-- Local copy of SpatialPointProcessFoundations §5.1 (its copy of Tau Ceti's
`TauCeti.Probability.IsPoissonRandomMeasure`): a measurable random measure with independent
Poisson counts on disjoint measurable sets of finite intensity and almost surely infinite counts
on measurable sets of infinite intensity. -/
def IsPoissonRandomMeasure (P : Measure Ω) (N : Ω → Measure X) (Λ : Measure X) : Prop :=
  Measurable N ∧
    (∀ (n : ℕ) (A : Fin n → Set X), (∀ i, MeasurableSet (A i) ∧ Λ (A i) < ∞) →
      Pairwise (Disjoint on A) →
        iIndepFun (fun i ω => N ω (A i)) P ∧
          ∀ i, HasLaw (fun ω => N ω (A i))
            ((poissonMeasure (Λ (A i)).toNNReal).map (Nat.cast : ℕ → ℝ≥0∞)) P)
    ∧ ∀ A, MeasurableSet A → Λ A = ∞ → ∀ᵐ ω ∂P, N ω A = ∞

end Copies

section LocalCopies

/-- Local copy of SpatialPointProcessFoundations §1.1: locally finite measures, finite on compact
sets. -/
def LocallyFiniteMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ}

/-- Local copy of SpatialPointProcessFoundations §1.1: point measures, the locally finite
integer-valued measures. -/
def PointMeasure (S : Type*) [TopologicalSpace S] [MeasurableSpace S] :=
  {μ : Measure S // IsFiniteMeasureOnCompacts μ ∧ IsIntegerValued μ}

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

instance : CoeOut (LocallyFiniteMeasure S) (Measure S) := ⟨Subtype.val⟩
instance : CoeOut (PointMeasure S) (Measure S) := ⟨Subtype.val⟩

/-- Local copy of SpatialPointProcessFoundations §1.1: a point measure as a locally finite
measure. -/
def PointMeasure.toLocallyFinite (ξ : PointMeasure S) : LocallyFiniteMeasure S := ⟨ξ.1, ξ.2.1⟩

/-- Local copy of SpatialPointProcessFoundations §1.2: the vague topology, the coarsest one
making `μ ↦ ∫ f dμ` continuous for every compactly supported continuous `f`. -/
instance : TopologicalSpace (LocallyFiniteMeasure S) :=
  ⨅ f : C_c(S, ℝ), TopologicalSpace.induced
    (fun μ : LocallyFiniteMeasure S => ∫ x, f x ∂(μ : Measure S)) inferInstance

instance : MeasurableSpace (LocallyFiniteMeasure S) := borel _
instance : BorelSpace (LocallyFiniteMeasure S) := ⟨rfl⟩

/-- Local copy of SpatialPointProcessFoundations §1.2: point measures carry the subspace
topology. -/
instance : TopologicalSpace (PointMeasure S) :=
  TopologicalSpace.induced PointMeasure.toLocallyFinite inferInstance

instance : MeasurableSpace (PointMeasure S) := borel _
instance : BorelSpace (PointMeasure S) := ⟨rfl⟩

variable {Ω : Type*} [MeasurableSpace Ω]

/-- Local copy of SpatialPointProcessFoundations §5.1: the Poisson property of a point process,
on the point-measure carrier. -/
abbrev IsPoissonPointProcess (P : Measure Ω) (N : Ω → PointMeasure S) (Λ : Measure S) : Prop :=
  IsPoissonRandomMeasure P (fun ω => (N ω : Measure S)) Λ

end LocalCopies

/-! ## Layer 1: configurations and the Poisson reference law -/

section Configurations

variable {S : Type*} [MeasurableSpace S]

/-- 1.1: the configuration `{x₀, …, x_{n-1}}` of a tuple. -/
def toConfig {n : ℕ} (x : Fin n → S) : Finset S := Finset.univ.image x

/-- 1.1: the σ-algebra of finite configurations, final for every `toConfig`. -/
scoped instance configMeasurableSpace : MeasurableSpace (Finset S) :=
  ⨅ n : ℕ, MeasurableSpace.map (toConfig (S := S) (n := n)) inferInstance

/-- 1.2: the Poisson process with intensity `μ|W`, as a law on configurations. -/
def poissonConfigLaw (μ : Measure S) (W : Set S) : Measure (Finset S) :=
  Measure.sum fun n : ℕ => ((expNeg (μ W) : ℝ≥0∞) / n.factorial) •
    (Measure.pi fun _ : Fin n => μ.restrict W).map toConfig

/-- 1.2: the law with unnormalised density `h` against `poissonConfigLaw μ W`, normalised. -/
def configLaw (μ : Measure S) (W : Set S) (h : Finset S → ℝ≥0) : Measure (Finset S) :=
  (poissonConfigLaw μ W).withDensity fun x => (h x : ℝ≥0∞) / ∫⁻ y, h y ∂poissonConfigLaw μ W

/-- 1.3: a random configuration `X` has density `f` against `poissonConfigLaw μ W`. -/
def HasConfigDensity {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω) (X : Ω → Finset S)
    (μ : Measure S) (W : Set S) (f : Finset S → ℝ≥0) : Prop :=
  Measurable X ∧ P.map X = (poissonConfigLaw μ W).withDensity fun x => (f x : ℝ≥0∞)

/-- 1.3: the density `e^{μ W - ∫_W ρ dμ} ∏_{u ∈ x} ρ u` of the Poisson process with intensity
`ρ · μ` against `poissonConfigLaw μ W`. -/
def poissonConfigDensity (μ : Measure S) (W : Set S) (ρ : S → ℝ≥0) (x : Finset S) : ℝ≥0∞ :=
  ENNReal.ofReal (Real.exp (μ W).toReal) * expNeg (∫⁻ u in W, ρ u ∂μ) *
    ∏ u ∈ x, (ρ u : ℝ≥0∞)

/-- 1.3: a random configuration has intensity `ρ · μ|W` (Campbell's formula). -/
def HasIntensity {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω) (X : Ω → Finset S)
    (μ : Measure S) (W : Set S) (ρ : S → ℝ≥0∞) : Prop :=
  Measurable X ∧ ∀ g : S → ℝ≥0∞, Measurable g →
    ∫⁻ ω, ∑ u ∈ X ω, g u ∂P = ∫⁻ u in W, g u * ρ u ∂μ

end Configurations

section Papangelou

variable {α : Type*}

/-- 1.3: `f` is hereditary: `f x ≠ 0` and `y ⊆ x` give `f y ≠ 0`. -/
def IsHereditary (f : Finset α → ℝ≥0) : Prop :=
  ∀ x y, y ⊆ x → f x ≠ 0 → f y ≠ 0

/-- 1.3: the Papangelou conditional intensity `f (x ∪ {ξ}) / f x`, read as `0` where
`f x = 0`. -/
def papangelou (f : Finset α → ℝ≥0) (x : Finset α) (ξ : α) : ℝ≥0 :=
  if f x = 0 then 0 else f (insert ξ x) / f x

/-- 1.3: a hereditary function is `f ∅` times the
product of its Papangelou intensities along any enumeration of the configuration. -/
theorem eq_mul_prod_papangelou {f : Finset α → ℝ≥0} (hf : IsHereditary f) (l : List α)
    (hl : l.Nodup) :
    f l.toFinset = f ∅ * ∏ i : Fin l.length, papangelou f (l.take i).toFinset (l.get i) := by
  sorry

end Papangelou

section ReferenceLaw

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

omit [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [BorelSpace S] in
/-- Supporting step, proved here: every `toConfig` is measurable. -/
theorem measurable_toConfig (n : ℕ) : Measurable (toConfig (S := S) (n := n)) :=
  fun _ hs => MeasurableSpace.measurableSet_iInf.1 hs n

/-- 1.1: a function of configurations is measurable iff it is measurable on every tuple space
(the universal property of the final σ-algebra). -/
theorem measurable_iff_measurable_comp_toConfig {β : Type*} [MeasurableSpace β]
    (f : Finset S → β) :
    Measurable f ↔ ∀ n : ℕ, Measurable fun x : Fin n → S => f (toConfig x) := by
  sorry

/-- 1.1: the configurations of a Polish space form a standard Borel space. -/
theorem standardBorelSpace_finset : StandardBorelSpace (Finset S) := by
  sorry

/-- 1.1: adding and removing a point, restriction to a measurable set, union and the number of
points are measurable. -/
theorem measurable_configOps :
    Measurable (fun z : S × Finset S => insert z.1 z.2) ∧
      Measurable (fun z : S × Finset S => z.2.erase z.1) ∧
      (∀ A : Set S, MeasurableSet A → Measurable fun x : Finset S => x.filter (· ∈ A)) ∧
      Measurable (fun z : Finset S × Finset S => z.1 ∪ z.2) ∧
      Measurable (Finset.card : Finset S → ℕ) := by
  sorry

/-- 1.1: the sum over the points of a configuration of a jointly measurable function of the
point and the remaining configuration is measurable. -/
theorem measurable_sum_erase {g : S → Finset S → ℝ≥0∞} (hg : Measurable (uncurry g)) :
    Measurable fun x : Finset S => ∑ ξ ∈ x, g ξ (x.erase ξ) := by
  sorry

/-- 1.1: the finite set of atoms of a point measure, empty when it is infinite. -/
def PointMeasure.toFinset (ξ : PointMeasure S) : Finset S :=
  if h : {x : S | 0 < (ξ : Measure S) {x}}.Finite then h.toFinset else ∅

/-- 1.1: a finite configuration as a point measure, the sum of the Dirac masses at its points. -/
def PointMeasure.ofFinset (x : Finset S) : PointMeasure S :=
  ⟨∑ ξ ∈ x, Measure.dirac ξ,
    ⟨fun K _ => by
      rw [_root_.sum_apply]
      exact ENNReal.sum_lt_top.2 fun _ _ => measure_lt_top _ _⟩,
    fun A hA _ => ⟨(x.filter (· ∈ A)).card, by
      rw [_root_.sum_apply]
      simp [Measure.dirac_apply' _ hA, Set.indicator_apply]⟩⟩

/-- 1.1: the two conversions: the atoms of `ofFinset x` are `x`; `ofFinset` is measurable; and a
simple point measure of finite total mass is the point measure of its atoms. -/
theorem PointMeasure.toFinset_ofFinset :
    (∀ x : Finset S, (PointMeasure.ofFinset x).toFinset = x) ∧
      Measurable (PointMeasure.ofFinset (S := S)) ∧
      ∀ ξ : PointMeasure S, (ξ : Measure S) Set.univ < ∞ → (∀ u, (ξ : Measure S) {u} ≤ 1) →
        PointMeasure.ofFinset ξ.toFinset = ξ := by
  sorry

/-- 1.2: on a window of finite measure the Poisson law is a probability measure. -/
theorem isProbabilityMeasure_poissonConfigLaw (μ : Measure S) [SigmaFinite μ] {W : Set S}
    (hW : μ W ≠ ∞) : IsProbabilityMeasure (poissonConfigLaw μ W) := by
  sorry

/-- 1.2: integrals against the Poisson law are Poisson sums of integrals over tuples. -/
theorem lintegral_poissonConfigLaw (μ : Measure S) [SigmaFinite μ] (W : Set S)
    {f : Finset S → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ x, f x ∂poissonConfigLaw μ W =
      ∑' n : ℕ, ((expNeg (μ W) : ℝ≥0∞) / n.factorial) *
        ∫⁻ x, f (toConfig x) ∂Measure.pi fun _ : Fin n => μ.restrict W := by
  sorry

/-- 1.2: the generating function of the number of points: `∫ β^{n(x)} = e^{(β - 1) μ W}` for an
atomless `μ`. -/
theorem lintegral_pow_card_poissonConfigLaw (μ : Measure S) [SigmaFinite μ]
    {W : Set S} [NullSingletonClass (μ.restrict W)] (hWm : MeasurableSet W) (hW : μ W ≠ ∞)
    (β : ℝ≥0) :
    ∫⁻ x, (β : ℝ≥0∞) ^ x.card ∂poissonConfigLaw μ W =
      ENNReal.ofReal (Real.exp (((β : ℝ) - 1) * (μ W).toReal)) := by
  sorry

/-- 1.2: the bridge to SpatialPointProcessFoundations: for an atomless locally finite `μ` and a
bounded window, the atoms of the Poisson process with intensity `μ|W` have law
`poissonConfigLaw μ W`. -/
theorem map_toFinset_of_isPoissonPointProcess {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {N : Ω → PointMeasure S} {μ : Measure S}
    [IsFiniteMeasureOnCompacts μ] {W : Set S} [NullSingletonClass (μ.restrict W)]
    (hWm : MeasurableSet W)
    (hWc : IsCompact (closure W)) (hN : IsPoissonPointProcess P N (μ.restrict W)) :
    Measurable (fun ω => (N ω).toFinset) ∧
      P.map (fun ω => (N ω).toFinset) = poissonConfigLaw μ W := by
  sorry

/-- 1.3: the Poisson law with intensity `ρ · μ` has
density `poissonConfigDensity μ W ρ` against the Poisson law with intensity `μ`. -/
theorem poissonConfigLaw_withDensity_eq (μ : Measure S) [SigmaFinite μ]
    {W : Set S} [NullSingletonClass (μ.restrict W)] (hWm : MeasurableSet W) (hW : μ W ≠ ∞)
    {ρ : S → ℝ≥0} (hρ : Measurable ρ)
    (hρW : ∫⁻ u in W, ρ u ∂μ ≠ ∞) [SigmaFinite (μ.withDensity fun u => (ρ u : ℝ≥0∞))] :
    poissonConfigLaw (μ.withDensity fun u => (ρ u : ℝ≥0∞)) W =
      (poissonConfigLaw μ W).withDensity (poissonConfigDensity μ W ρ) := by
  sorry

/-- 1.3: the Georgii–Nguyen–Zessin formula for a random configuration with a hereditary
density. -/
theorem gnz_of_hasConfigDensity {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {X : Ω → Finset S} {μ : Measure S} [SigmaFinite μ]
    {W : Set S} [NullSingletonClass (μ.restrict W)] (hWm : MeasurableSet W) (hW : μ W ≠ ∞)
    {f : Finset S → ℝ≥0} (hf : Measurable f) (hX : HasConfigDensity P X μ W f)
    (hher : IsHereditary f) {g : S → Finset S → ℝ≥0∞} (hg : Measurable (uncurry g)) :
    ∫⁻ ω, ∑ ξ ∈ X ω, g ξ ((X ω).erase ξ) ∂P =
      ∫⁻ ξ in W, ∫⁻ ω, g ξ (X ω) * papangelou f (X ω) ξ ∂P ∂μ := by
  sorry

/-- 1.3: the Papangelou intensity determines the law: two random configurations with hereditary
densities whose Papangelou intensities agree at `μ|W`-almost every point have the same law. -/
theorem map_eq_of_papangelou_ae_eq {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {X X' : Ω → Finset S} {μ : Measure S} [SigmaFinite μ] {W : Set S}
    {f f' : Finset S → ℝ≥0} (hX : HasConfigDensity P X μ W f) (hf : IsHereditary f)
    (hX' : HasConfigDensity P X' μ W f') (hf' : IsHereditary f')
    (h : ∀ᵐ ξ ∂μ.restrict W, ∀ x : Finset S, ξ ∉ x → papangelou f x ξ = papangelou f' x ξ) :
    P.map X = P.map X' := by
  sorry

end ReferenceLaw

/-! ## Layer 2: stability and normalisability -/

section Stability

variable {S : Type*}

/-- 2.1: `h` is locally stable on `W` with bound `φ`. -/
def IsLocallyStable (W : Set S) (φ : S → ℝ≥0) (h : Finset S → ℝ≥0) : Prop :=
  ∀ x : Finset S, (x : Set S) ⊆ W → ∀ ξ ∈ W, ξ ∉ x → h (insert ξ x) ≤ φ ξ * h x

/-- 2.1: `h` is Ruelle stable on `W` with bound `φ`. -/
def IsRuelleStable (W : Set S) (φ : S → ℝ≥0) (h : Finset S → ℝ≥0) : Prop :=
  ∃ a : ℝ≥0, ∀ x : Finset S, (x : Set S) ⊆ W → h x ≤ a * ∏ ξ ∈ x, φ ξ

/-- 2.1: local stability gives Ruelle stability, heredity on `W` and the bound `λ* ≤ φ`. -/
theorem isLocallyStable_consequences {W : Set S} {φ : S → ℝ≥0} {h : Finset S → ℝ≥0}
    (hls : IsLocallyStable W φ h) :
    IsRuelleStable W φ h ∧
      (∀ x y : Finset S, (x : Set S) ⊆ W → y ⊆ x → h x ≠ 0 → h y ≠ 0) ∧
      ∀ x : Finset S, (x : Set S) ⊆ W → ∀ ξ ∈ W, ξ ∉ x → papangelou h x ξ ≤ φ ξ := by
  sorry

variable [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- 2.2: a Ruelle stable `h` with integrable bound has finite integral. -/
theorem lintegral_lt_top_of_isRuelleStable (μ : Measure S) [SigmaFinite μ] {W : Set S}
    (hWm : MeasurableSet W) (hW : μ W ≠ ∞) {φ : S → ℝ≥0} (hφm : Measurable φ)
    (hφ : ∫⁻ u in W, φ u ∂μ ≠ ∞) {h : Finset S → ℝ≥0} (hR : IsRuelleStable W φ h) :
    ∫⁻ x, h x ∂poissonConfigLaw μ W < ∞ := by
  sorry

/-- 2.2: for a constant bound `β` and an atomless `μ`, `∫ h ≤ h ∅ e^{(β - 1) μ W}`. -/
theorem lintegral_le_of_isLocallyStable_const (μ : Measure S) [SigmaFinite μ]
    {W : Set S} [NullSingletonClass (μ.restrict W)] (hWm : MeasurableSet W) (hW : μ W ≠ ∞) {β : ℝ≥0}
    {h : Finset S → ℝ≥0} (hls : IsLocallyStable W (fun _ => β) h) :
    ∫⁻ x, h x ∂poissonConfigLaw μ W ≤
      h ∅ * ENNReal.ofReal (Real.exp (((β : ℝ) - 1) * (μ W).toReal)) := by
  sorry

/-- 2.2: a locally stable `h` with `h ∅ ≠ 0` and integrable bound is normalisable. -/
theorem normalisable_of_isLocallyStable (μ : Measure S) [SigmaFinite μ] {W : Set S}
    (hWm : MeasurableSet W) (hW : μ W ≠ ∞) {φ : S → ℝ≥0} (hφm : Measurable φ)
    (hφ : ∫⁻ u in W, φ u ∂μ ≠ ∞) {h : Finset S → ℝ≥0} (hm : Measurable h)
    (hls : IsLocallyStable W φ h) (h0 : h ∅ ≠ 0) :
    0 < ∫⁻ x, h x ∂poissonConfigLaw μ W ∧ ∫⁻ x, h x ∂poissonConfigLaw μ W < ∞ := by
  sorry

end Stability

/-! ## Layer 3: Markov functions and the Hammersley–Clifford–Ripley–Kelly theorem -/

section Markov

variable {α : Type*}

/-- 3.1: a clique of `r`: its points are pairwise related. -/
def IsClique (r : α → α → Prop) (y : Finset α) : Prop :=
  ∀ ξ ∈ y, ∀ η ∈ y, r ξ η

/-- 3.1: a hereditary `h` is a Markov function for `r` when, at `h x ≠ 0` and `ξ ∉ x`, the ratio
`h (x ∪ {ξ}) / h x` depends on `x` only through the points of `x` related to `ξ`. -/
def IsMarkovFunction (r : α → α → Prop) (h : Finset α → ℝ≥0) : Prop :=
  IsHereditary h ∧ ∀ x ξ, h x ≠ 0 → ξ ∉ x →
    h (insert ξ x) / h x = h (insert ξ (x.filter (r ξ))) / h (x.filter (r ξ))

/-- 3.1, Hammersley–Clifford–Ripley–Kelly: for a reflexive symmetric relation, a hereditary
`h` is a Markov function iff it is a product of clique interactions. -/
theorem isMarkovFunction_iff (r : α → α → Prop) (hrefl : ∀ ξ, r ξ ξ)
    (hsymm : ∀ ξ η, r ξ η → r η ξ) {h : Finset α → ℝ≥0} (hher : IsHereditary h) :
    IsMarkovFunction r h ↔
      ∃ φ : Finset α → ℝ≥0, (∀ y, ¬ IsClique r y → φ y = 1) ∧
        ∀ x, h x = ∏ y ∈ x.powerset, φ y := by
  sorry

/-- 3.1: the Papangelou intensity of a product of interactions. -/
theorem papangelou_eq_prod {h φ : Finset α → ℝ≥0} (hφ : ∀ x, h x = ∏ y ∈ x.powerset, φ y)
    {x : Finset α} {ξ : α} (hx : h x ≠ 0) (hξ : ξ ∉ x) :
    papangelou h x ξ = ∏ y ∈ x.powerset, φ (insert ξ y) := by
  sorry

/-- 3.1: the interaction function is unique where `h` is positive. -/
theorem eq_of_prod_powerset_eq {h φ ψ : Finset α → ℝ≥0}
    (hφ : ∀ x, h x = ∏ y ∈ x.powerset, φ y) (hψ : ∀ x, h x = ∏ y ∈ x.powerset, ψ y)
    {y : Finset α} (hy : h y ≠ 0) : φ y = ψ y := by
  sorry

/-- 3.2: a Markov function factorises across two unrelated sets. -/
theorem markov_density_factorization (r : α → α → Prop) (hrefl : ∀ ξ, r ξ ξ)
    (hsymm : ∀ ξ η, r ξ η → r η ξ) {h : Finset α → ℝ≥0} (hM : IsMarkovFunction r h)
    {A B : Set α} (hAB : Disjoint A B) (hrel : ∀ a ∈ A, ∀ b ∈ B, ¬ r a b) :
    ∃ g k : Finset α → ℝ≥0, ∀ x, h x = g (x.filter (· ∉ B)) * k (x.filter (· ∉ A)) := by
  sorry

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- 3.2: the global Markov property: `X_A` and `X_B` are conditionally independent given the
rest of the window when no point of `A` is related to a point of `B`. -/
theorem condIndepFun_of_isMarkovFunction {Ω : Type*} {mΩ : MeasurableSpace Ω}
    [StandardBorelSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P] {X : Ω → Finset S}
    {μ : Measure S} [SigmaFinite μ] {W : Set S} [NullSingletonClass (μ.restrict W)]
    (hWm : MeasurableSet W)
    (hW : μ W ≠ ∞) {f : Finset S → ℝ≥0} (hf : Measurable f) (hX : HasConfigDensity P X μ W f)
    {r : S → S → Prop} (hrefl : ∀ ξ, r ξ ξ) (hsymm : ∀ ξ η, r ξ η → r η ξ)
    (hM : IsMarkovFunction r f) {A B : Set S} (hA : MeasurableSet A) (hB : MeasurableSet B)
    (hAB : Disjoint A B) (hrel : ∀ a ∈ A, ∀ b ∈ B, ¬ r a b)
    (hm : MeasurableSpace.comap (fun ω => (X ω).filter (· ∈ W \ (A ∪ B))) inferInstance ≤ mΩ) :
    CondIndepFun (MeasurableSpace.comap (fun ω => (X ω).filter (· ∈ W \ (A ∪ B))) inferInstance)
      hm (fun ω => (X ω).filter (· ∈ A)) (fun ω => (X ω).filter (· ∈ B)) P := by
  sorry

end Markov

/-! ## Layer 4: models -/

section Models

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- 4.1: the number of pairs of points of `x` at distance at most `R`. -/
def closePairs (R : ℝ) (x : Finset S) : ℕ :=
  ((x.powersetCard 2).filter fun y => ∀ a ∈ y, ∀ b ∈ y, dist a b ≤ R).card

/-- 4.1: the Strauss function `β^{n(x)} γ^{s_R(x)}`, with `0⁰ = 1`. -/
def straussDensity (β γ : ℝ≥0) (R : ℝ) (x : Finset S) : ℝ≥0 :=
  β ^ x.card * γ ^ closePairs R x

/-- 4.1: for `γ ≤ 1` the Strauss function is locally stable with bound `β`, normalisable,
Markov for `dist ≤ R`, with Papangelou intensity `β γ^{#{η ∈ x | dist ξ η ≤ R}}`. -/
theorem strauss_properties (μ : Measure S) [SigmaFinite μ] {W : Set S} (hWm : MeasurableSet W)
    (hW : μ W ≠ ∞) {β γ : ℝ≥0} (R : ℝ) (hγ : γ ≤ 1) :
    IsLocallyStable W (fun _ => β) (straussDensity β γ R) ∧
      ∫⁻ x, straussDensity β γ R x ∂poissonConfigLaw μ W < ∞ ∧
      IsMarkovFunction (fun ξ η : S => dist ξ η ≤ R) (straussDensity β γ R) ∧
      ∀ (x : Finset S) (ξ : S), ξ ∉ x → straussDensity β γ R x ≠ 0 →
        papangelou (straussDensity β γ R) x ξ = β * γ ^ (x.filter fun η => dist ξ η ≤ R).card := by
  sorry

/-- 4.1: the hard-core process: at `γ = 0` the Strauss function is `β^{n(x)}` on configurations
whose distinct points are more than `R` apart and `0` elsewhere; it is hereditary, and where it
is nonzero its Papangelou intensity at `ξ ∉ x` is `β` if `ξ` is more than `R` from every point
of `x` and `0` otherwise. -/
theorem straussDensity_zero_eq {β : ℝ≥0} (R : ℝ) :
    (∀ x : Finset S, straussDensity β 0 R x =
        if (x : Set S).Pairwise (fun ξ η => R < dist ξ η) then β ^ x.card else 0) ∧
      IsHereditary (straussDensity (S := S) β 0 R) ∧
      ∀ (x : Finset S) (ξ : S), ξ ∉ x → straussDensity β 0 R x ≠ 0 →
        papangelou (straussDensity β 0 R) x ξ = if ∀ η ∈ x, R < dist ξ η then β else 0 := by
  sorry

/-- 4.1: for `γ > 1` the Strauss function is not integrable on a window of positive measure. -/
theorem strauss_lintegral_eq_top (μ : Measure S) [SigmaFinite μ]
    {W : Set S} [NullSingletonClass (μ.restrict W)] (hWm : MeasurableSet W) (hW : μ W ≠ ∞)
    (hW0 : 0 < μ W) {β γ : ℝ≥0} {R : ℝ}
    (hβ : 0 < β) (hR : 0 < R) (hγ : 1 < γ) :
    ∫⁻ x, straussDensity β γ R x ∂poissonConfigLaw μ W = ∞ := by
  sorry

/-- 4.1: with a fixed number `n` of points the Strauss weight is integrable for every `γ`; it
has positive integral for `γ > 0`, and for `γ = 0` exactly when the `R`-separated tuples have
positive measure. -/
theorem strauss_fixed_number (μ : Measure S) [SigmaFinite μ] {W : Set S}
    [NullSingletonClass (μ.restrict W)]
    (hWm : MeasurableSet W) (hW : μ W ≠ ∞) {β γ : ℝ≥0} (R : ℝ) (hβ : 0 < β) (n : ℕ) :
    ∫⁻ x, straussDensity β γ R (toConfig x) ∂Measure.pi (fun _ : Fin n => μ.restrict W) < ∞ ∧
      (0 < γ → 0 < μ W →
        0 < ∫⁻ x, straussDensity β γ R (toConfig x) ∂Measure.pi (fun _ : Fin n => μ.restrict W)) ∧
      (γ = 0 →
        (0 < ∫⁻ x, straussDensity β γ R (toConfig x)
            ∂Measure.pi (fun _ : Fin n => μ.restrict W) ↔
          0 < Measure.pi (fun _ : Fin n => μ.restrict W)
            {x | ∀ i j, i ≠ j → R < dist (x i) (x j)})) := by
  sorry

/-- 4.2: the number of pairs of points of `x` at a distance in `(a, b]`. -/
def pairsIn (a b : ℝ) (x : Finset S) : ℕ :=
  ((x.powersetCard 2).filter fun y => ∀ u ∈ y, ∀ v ∈ y, u ≠ v → a < dist u v ∧ dist u v ≤ b).card

/-- 4.2: the multiscale function `β^{n(x)} ∏ᵢ γᵢ^{sᵢ(x)}`, with `sᵢ` counting pairs at a distance
in `(Rᵢ, Rᵢ₊₁]`. -/
def multiscaleDensity {k : ℕ} (β : ℝ≥0) (γ : Fin (k + 1) → ℝ≥0) (R : Fin (k + 2) → ℝ)
    (x : Finset S) : ℝ≥0 :=
  β ^ x.card * ∏ i, γ i ^ pairsIn (R i.castSucc) (R i.succ) x

/-- 4.2: the multiscale function is locally stable when every `γᵢ ≤ 1`, and when `γ₀ = 0` on a
bounded window, with a bound from the number of hard-core separated points. -/
theorem multiscale_isLocallyStable {k : ℕ} {W : Set S} (β : ℝ≥0) (γ : Fin (k + 1) → ℝ≥0)
    {R : Fin (k + 2) → ℝ} (hR0 : R 0 = 0) (hR : StrictMono R) :
    ((∀ i, γ i ≤ 1) → IsLocallyStable W (fun _ => β) (multiscaleDensity β γ R)) ∧
      (γ 0 = 0 → IsCompact (closure W) →
        ∃ n₀ : ℕ, (∀ x : Finset S, (x : Set S) ⊆ W → multiscaleDensity β γ R x ≠ 0 →
            x.card ≤ n₀) ∧
          IsLocallyStable W (fun _ => β * ∏ i ∈ Finset.univ.erase 0, max 1 (γ i) ^ (n₀ - 1))
            (multiscaleDensity β γ R)) := by
  sorry

/-- 4.3: the area-interaction function `β^{n(x)} γ^{-μ(⋃_{ξ ∈ x} B(ξ, R))}`. -/
def areaInteractionDensity (μ : Measure S) (β γ : ℝ≥0) (R : ℝ) (x : Finset S) : ℝ≥0 :=
  β ^ x.card * γ ^ (-(μ (⋃ ξ ∈ x, Metric.closedBall ξ R)).toReal)

/-- 4.3: the Papangelou intensity of the area-interaction function, and its Markov property at
range `2R`. -/
theorem areaInteraction_papangelou [ProperSpace S] (μ : Measure S) [IsFiniteMeasureOnCompacts μ]
    {β γ : ℝ≥0} (R : ℝ) (hβ : 0 < β) (hγ : 0 < γ) :
    (∀ x ξ, ξ ∉ x → papangelou (areaInteractionDensity μ β γ R) x ξ =
        β * γ ^ (-(μ (Metric.closedBall ξ R \ ⋃ η ∈ x, Metric.closedBall η R)).toReal)) ∧
      IsMarkovFunction (fun ξ η : S => dist ξ η ≤ 2 * R) (areaInteractionDensity μ β γ R) := by
  sorry

/-- 4.3: the area-interaction function is locally stable: with bound `β` for `γ ≥ 1`, and with
bound `β γ^{-b}` for `γ ≤ 1` when every ball of radius `R` has measure at most `b`. -/
theorem areaInteraction_isLocallyStable [ProperSpace S] (μ : Measure S)
    [IsFiniteMeasureOnCompacts μ] {W : Set S} {β γ : ℝ≥0} (R : ℝ) (hγ : 0 < γ) :
    (1 ≤ γ → IsLocallyStable W (fun _ => β) (areaInteractionDensity μ β γ R)) ∧
      (γ ≤ 1 → ∀ b : ℝ≥0, (∀ ξ, μ (Metric.closedBall ξ R) ≤ b) →
        IsLocallyStable W (fun _ => β * γ ^ (-(b : ℝ))) (areaInteractionDensity μ β γ R)) := by
  sorry

end Models

/-! ## Layer 5: finite-volume Gibbs measures -/

section Gibbs

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S]

/-- 5.1: the energy is non-degenerate: `H ∅ < ∞`. -/
def IsNonDegenerate (H : Finset S → WithTop ℝ) : Prop := H ∅ ≠ ⊤

/-- 5.1: the energy is hereditary: `H x < ∞` gives `H (x ∖ {ξ}) < ∞`. -/
def IsHereditaryEnergy (H : Finset S → WithTop ℝ) : Prop :=
  ∀ x ξ, H x ≠ ⊤ → H (x.erase ξ) ≠ ⊤

/-- 5.1: the energy is stable: `H x ≥ A n(x)` for a constant `A`. -/
def IsStableEnergy (H : Finset S → WithTop ℝ) : Prop :=
  ∃ A : ℝ, ∀ x, ((A * x.card : ℝ) : WithTop ℝ) ≤ H x

/-- 5.1: the energy is measurable: its finite part and the set where it is infinite. -/
def IsEnergyMeasurable (H : Finset S → WithTop ℝ) : Prop :=
  Measurable (fun x => (H x).untopD 0) ∧ MeasurableSet {x | H x = ⊤}

/-- 5.1: the Boltzmann weight `e^{-β H x}`; where `H x = ⊤` it is `0` for `β ≠ 0` and `1` for
`β = 0`. -/
def gibbsWeight (β : ℝ) (H : Finset S → WithTop ℝ) (x : Finset S) : ℝ≥0 :=
  if h : H x = ⊤ then (if β = 0 then 1 else 0) else Real.toNNReal (Real.exp (-β * (H x).untop h))

/-- 5.1: the partition function `Z = ∫ z^{n(x)} e^{-β H x} dΠ_Λ`. -/
def partitionFunction (μ : Measure S) (Λ : Set S) (z : ℝ≥0) (β : ℝ)
    (H : Finset S → WithTop ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ((z ^ x.card * gibbsWeight β H x : ℝ≥0) : ℝ≥0∞) ∂poissonConfigLaw μ Λ

/-- 5.1: the finite-volume Gibbs measure `P^{z,β}_Λ`. -/
def gibbsLaw (μ : Measure S) (Λ : Set S) (z : ℝ≥0) (β : ℝ) (H : Finset S → WithTop ℝ) :
    Measure (Finset S) :=
  configLaw μ Λ fun x => z ^ x.card * gibbsWeight β H x

/-- 5.2: the Gibbs conditional intensity `z e^{-β (H (x ∪ {ξ}) - H x)}`, with `∞ - ∞ = 0`. -/
def gibbsIntensity (z : ℝ≥0) (β : ℝ) (H : Finset S → WithTop ℝ) (x : Finset S) (ξ : S) : ℝ≥0 :=
  if H x = ⊤ then z else z * (gibbsWeight β H (insert ξ x) / gibbsWeight β H x)

/-- 5.3: the DLR weight `z^{n(y)} e^{-β H_Δ(y ∪ x_{Δᶜ})}` of an inner configuration `y` given the
outer configuration of `x`. -/
def dlrWeight (z : ℝ≥0) (β : ℝ) (H : Finset S → WithTop ℝ) (Δ : Set S) (y x : Finset S) : ℝ≥0 :=
  z ^ y.card * (gibbsWeight β H (y ∪ x.filter (· ∉ Δ)) / gibbsWeight β H (x.filter (· ∉ Δ)))

/-- 5.1: `0 < Z < ∞`, with the bounds `e^{-μ Λ} e^{-β H ∅} ≤ Z ≤ e^{μ Λ (z e^{-β A} - 1)}`. -/
theorem partitionFunction_pos_lt_top (μ : Measure S) [SigmaFinite μ]
    {Λ : Set S} [NullSingletonClass (μ.restrict Λ)] (hΛm : MeasurableSet Λ) (hΛ : μ Λ ≠ ∞)
    {H : Finset S → WithTop ℝ}
    (hnd : IsNonDegenerate H) {A : ℝ} (hA : ∀ x, ((A * x.card : ℝ) : WithTop ℝ) ≤ H x)
    (hHm : IsEnergyMeasurable H) (z : ℝ≥0) {β : ℝ} (hβ : 0 ≤ β) :
    ENNReal.ofReal (Real.exp (-(μ Λ).toReal - β * (H ∅).untopD 0)) ≤ partitionFunction μ Λ z β H ∧
      partitionFunction μ Λ z β H ≤
        ENNReal.ofReal (Real.exp ((μ Λ).toReal * (z * Real.exp (-β * A) - 1))) ∧
      0 < partitionFunction μ Λ z β H ∧ partitionFunction μ Λ z β H < ∞ := by
  sorry

/-- 5.1: at `β = 0` the Gibbs measure is the Poisson law of intensity `z`. -/
theorem gibbsLaw_zero (μ : Measure S) [SigmaFinite μ] {Λ : Set S}
    [NullSingletonClass (μ.restrict Λ)]
    (hΛm : MeasurableSet Λ) (hΛ : μ Λ ≠ ∞) (z : ℝ≥0) (H : Finset S → WithTop ℝ) :
    gibbsLaw μ Λ z 0 H = poissonConfigLaw (z • μ) Λ := by
  sorry

/-- 5.2: the Papangelou intensity of the Gibbs weight is the Gibbs conditional intensity. -/
theorem papangelou_gibbsWeight {z : ℝ≥0} {β : ℝ} {H : Finset S → WithTop ℝ} {x : Finset S}
    {ξ : S} (hξ : ξ ∉ x) (hx : z ^ x.card * gibbsWeight β H x ≠ 0) :
    papangelou (fun y => z ^ y.card * gibbsWeight β H y) x ξ = gibbsIntensity z β H x ξ := by
  sorry

/-- 5.2: the Georgii–Nguyen–Zessin formula with the Gibbs conditional intensity characterises the
finite-volume Gibbs measure. -/
theorem map_eq_gibbsLaw_iff_gnz {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {X : Ω → Finset S} (hX : Measurable X) {μ : Measure S}
    [SigmaFinite μ] {Λ : Set S} [NullSingletonClass (μ.restrict Λ)] (hΛm : MeasurableSet Λ)
    (hΛ : μ Λ ≠ ∞)
    {H : Finset S → WithTop ℝ} (hnd : IsNonDegenerate H)
    (hher : IsHereditaryEnergy H) (hst : IsStableEnergy H) (hHm : IsEnergyMeasurable H)
    {z : ℝ≥0} (hz : 0 < z) {β : ℝ} (hβ : 0 ≤ β) :
    P.map X = gibbsLaw μ Λ z β H ↔
      ∀ g : S → Finset S → ℝ≥0∞, Measurable (uncurry g) →
        ∫⁻ ω, ∑ ξ ∈ X ω, g ξ ((X ω).erase ξ) ∂P =
          ∫⁻ ξ in Λ, ∫⁻ ω, g ξ (X ω) * gibbsIntensity z β H (X ω) ξ ∂P ∂μ := by
  sorry

/-- 5.3: the DLR equation, in integrated form: the conditional law of the configuration in
`Δ ⊆ Λ` given the outer configuration has density proportional to `dlrWeight`. -/
theorem gibbs_dlr (μ : Measure S) [SigmaFinite μ] {Λ Δ : Set S} [NullSingletonClass (μ.restrict Λ)]
    (hΛm : MeasurableSet Λ) (hΛ : μ Λ ≠ ∞) (hΔm : MeasurableSet Δ) (hΔΛ : Δ ⊆ Λ)
    {H : Finset S → WithTop ℝ} (hnd : IsNonDegenerate H)
    (hher : IsHereditaryEnergy H) (hst : IsStableEnergy H) (hHm : IsEnergyMeasurable H)
    {z : ℝ≥0} (hz : 0 < z) {β : ℝ} (hβ : 0 ≤ β) {f : Finset S → ℝ≥0∞} (hf : Measurable f) :
    ∫⁻ x, f x ∂gibbsLaw μ Λ z β H =
      ∫⁻ x, (∫⁻ y, f (y ∪ x.filter (· ∉ Δ)) * dlrWeight z β H Δ y x ∂poissonConfigLaw μ Δ) /
        (∫⁻ y, dlrWeight z β H Δ y x ∂poissonConfigLaw μ Δ) ∂gibbsLaw μ Λ z β H := by
  sorry

/-- 5.4: the variational principle: the Gibbs measure is the unique minimiser of
`β E_Q H - log z E_Q n + I(Q | Π_Λ)`, with minimum `-log Z`. -/
theorem gibbs_variational (μ : Measure S) [SigmaFinite μ] {Λ : Set S}
    [NullSingletonClass (μ.restrict Λ)]
    (hΛm : MeasurableSet Λ) (hΛ : μ Λ ≠ ∞) {H : Finset S → WithTop ℝ} (hnd : IsNonDegenerate H)
    (hher : IsHereditaryEnergy H) (hst : IsStableEnergy H) (hHm : IsEnergyMeasurable H)
    {z : ℝ≥0} (hz : 0 < z) {β : ℝ} (hβ : 0 ≤ β) (Q : Measure (Finset S)) [IsProbabilityMeasure Q]
    (hQH : Q {x | H x = ⊤} = 0) (hQi : Integrable (fun x => (H x).untopD 0) Q)
    (hQn : Integrable (fun x => (x.card : ℝ)) Q) :
    ((-Real.log (partitionFunction μ Λ z β H).toReal : ℝ) : EReal) ≤
        ((β * ∫ x, (H x).untopD 0 ∂Q - Real.log z * ∫ x, (x.card : ℝ) ∂Q : ℝ) : EReal) +
          (klDiv Q (poissonConfigLaw μ Λ) : EReal) ∧
      (((-Real.log (partitionFunction μ Λ z β H).toReal : ℝ) : EReal) =
          ((β * ∫ x, (H x).untopD 0 ∂Q - Real.log z * ∫ x, (x.card : ℝ) ∂Q : ℝ) : EReal) +
            (klDiv Q (poissonConfigLaw μ Λ) : EReal) ↔
        Q = gibbsLaw μ Λ z β H) := by
  sorry

/-- 5.5: `d/dz E n = Var(n) / z` for a finite-valued stable energy. -/
theorem hasDerivAt_gibbs_meanCount (μ : Measure S) [SigmaFinite μ] {Λ : Set S}
    (hΛm : MeasurableSet Λ) (hΛ : μ Λ ≠ ∞) {H : Finset S → ℝ} (hHm : Measurable H)
    {A : ℝ} (hA : ∀ x, A * x.card ≤ H x) {z : ℝ≥0} (hz : 0 < z) {β : ℝ} (hβ : 0 ≤ β) :
    HasDerivAt
      (fun t : ℝ => ∫ x, (x.card : ℝ) ∂gibbsLaw μ Λ t.toNNReal β fun x => (H x : WithTop ℝ))
      (variance (fun x => (x.card : ℝ)) (gibbsLaw μ Λ z β fun x => (H x : WithTop ℝ)) / z) z := by
  sorry

/-- 5.5: `d/dβ E H = -Var(H)` at `β > 0` for a finite-valued stable energy. -/
theorem hasDerivAt_gibbs_meanEnergy (μ : Measure S) [SigmaFinite μ] {Λ : Set S}
    (hΛm : MeasurableSet Λ) (hΛ : μ Λ ≠ ∞) {H : Finset S → ℝ} (hHm : Measurable H)
    {A : ℝ} (hA : ∀ x, A * x.card ≤ H x) {z : ℝ≥0} (hz : 0 < z) {β : ℝ} (hβ : 0 < β) :
    HasDerivAt (fun b : ℝ => ∫ x, H x ∂gibbsLaw μ Λ z b fun x => (H x : WithTop ℝ))
      (-variance H (gibbsLaw μ Λ z β fun x => (H x : WithTop ℝ))) β := by
  sorry

end Gibbs

/-! ## Layer 6: likelihood, composite likelihood and pseudolikelihood -/

section Likelihood

variable {S : Type*} [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [MeasurableSpace S]
  [BorelSpace S] {p : ℕ}

local notation "E" p => EuclideanSpace ℝ (Fin p)

/-- 6.1: the Poisson log-likelihood of the log-linear intensity `u ↦ exp ⟪θ, C u⟫` against
`poissonConfigLaw μ W`. -/
def logLinearLogLik (μ : Measure S) (W : Set S) (C : S → E p) (x : Finset S) (θ : E p) : ℝ :=
  ∑ u ∈ x, ⟪θ, C u⟫_ℝ - ∫ u in W, Real.exp ⟪θ, C u⟫_ℝ ∂μ + (μ W).toReal

/-- 6.1: the score `∑_{u ∈ x} C u - ∫_W C u exp ⟪θ, C u⟫ dμ`. -/
def logLinearScore (μ : Measure S) (W : Set S) (C : S → E p) (x : Finset S) (θ : E p) : E p :=
  ∑ u ∈ x, C u - ∫ u in W, Real.exp ⟪θ, C u⟫_ℝ • C u ∂μ

/-- 6.1: the Fisher information `∫_W C Cᵀ exp ⟪θ, C⟫ dμ`, as an operator. -/
def logLinearFisher (μ : Measure S) (W : Set S) (C : S → E p) (θ : E p) : (E p) →L[ℝ] (E p) :=
  ∫ u in W, Real.exp ⟪θ, C u⟫_ℝ • (innerSL ℝ (C u)).smulRight (C u) ∂μ

/-- 6.1: the log-linear Poisson law has density `exp (logLinearLogLik …)` against
`poissonConfigLaw μ W`. -/
theorem poissonConfigDensity_logLinear (μ : Measure S) [SigmaFinite μ] {W : Set S}
    (hWm : MeasurableSet W) (hW : μ W ≠ ∞) {C : S → E p} (hC : Measurable C)
    {K : ℝ} (hK : ∀ u ∈ W, ‖C u‖ ≤ K) (θ : E p) (x : Finset S) :
    poissonConfigDensity μ W (fun u => (Real.exp ⟪θ, C u⟫_ℝ).toNNReal) x =
      ENNReal.ofReal (Real.exp (logLinearLogLik μ W C x θ)) := by
  sorry

/-- 6.1: the log-linear Poisson log-likelihood is concave. -/
theorem concaveOn_logLinearLogLik (μ : Measure S) [SigmaFinite μ] {W : Set S}
    (hWm : MeasurableSet W) (hW : μ W ≠ ∞) {C : S → E p} (hC : Measurable C)
    {K : ℝ} (hK : ∀ u ∈ W, ‖C u‖ ≤ K) (x : Finset S) :
    ConcaveOn ℝ Set.univ (logLinearLogLik μ W C x) := by
  sorry

/-- 6.1: the gradient of the log-likelihood is the score, and the derivative of the score is
minus the Fisher information. -/
theorem hasGradientAt_logLinearLogLik (μ : Measure S) [SigmaFinite μ] {W : Set S}
    (hWm : MeasurableSet W) (hW : μ W ≠ ∞) {C : S → E p} (hC : Measurable C)
    {K : ℝ} (hK : ∀ u ∈ W, ‖C u‖ ≤ K) (x : Finset S) (θ : E p) :
    HasGradientAt (logLinearLogLik μ W C x) (logLinearScore μ W C x θ) θ ∧
      HasFDerivAt (logLinearScore μ W C x) (-logLinearFisher μ W C θ) θ := by
  sorry

/-- 6.2: the first-order composite score `∑_{u ∈ X} ψ u - ∫_W ψ ρ dμ` has mean zero for a process
with intensity `ρ · μ|W`. -/
theorem integral_compositeScore {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {X : Ω → Finset S} {μ : Measure S} {W : Set S} {ρ : S → ℝ≥0∞}
    (hX : HasIntensity P X μ W ρ) {ψ : S → E p} (hψ : Measurable ψ)
    (hint : ∫⁻ u in W, ‖ψ u‖ₑ * ρ u ∂μ ≠ ∞) :
    Integrable (fun ω => ∑ u ∈ X ω, ψ u) P ∧
      ∫ ω, (∑ u ∈ X ω, ψ u - ∫ u in W, (ρ u).toReal • ψ u ∂μ) ∂P = 0 := by
  sorry

/-- 6.3: the pseudolikelihood `exp(-∫_A λ(x, ξ) dξ) ∏_{ξ ∈ x ∩ A} λ(x ∖ {ξ}, ξ)`. -/
def pseudolikelihood (lam : Finset S → S → ℝ≥0) (μ : Measure S) (A : Set S) (x : Finset S) :
    ℝ≥0∞ :=
  expNeg (∫⁻ ξ in A, lam x ξ ∂μ) * ∏ ξ ∈ x.filter (· ∈ A), (lam (x.erase ξ) ξ : ℝ≥0∞)

/-- 6.3: the conditional density of the configuration in a cell `B` given the configuration
outside `B`, against `poissonConfigLaw μ B`. -/
def cellConditionalDensity (μ : Measure S) (f : Finset S → ℝ≥0) (B : Set S) (x : Finset S) :
    ℝ≥0∞ :=
  (f x : ℝ≥0∞) / ∫⁻ y, f (y ∪ x.filter (· ∉ B)) ∂poissonConfigLaw μ B

/-- 6.3: the pseudolikelihood is the limit of `e^{-μ A}` times the product of the cell
conditional densities along refining partitions of `A`. -/
theorem tendsto_prod_cellConditionalDensity (μ : Measure S) [SigmaFinite μ]
    {W A : Set S} [NullSingletonClass (μ.restrict W)] (hWm : MeasurableSet W) (hW : μ W ≠ ∞)
    (hAW : A ⊆ W)
    {f : Finset S → ℝ≥0} (hf : Measurable f) (hher : IsHereditary f) {φ : S → ℝ≥0}
    (hφm : Measurable φ) (hφ : ∫⁻ u in W, φ u ∂μ ≠ ∞) (hR : IsRuelleStable W φ f)
    {x : Finset S} (hx : (x : Set S) ⊆ W) (hfx : f x ≠ 0) (m : ℕ → ℕ)
    (cell : (n : ℕ) → Fin (m n) → Set S) (hcell : ∀ n j, MeasurableSet (cell n j))
    (hdisj : ∀ n, Pairwise fun i j => Disjoint (cell n i) (cell n j))
    (hcover : ∀ n, ⋃ j, cell n j = A) (hrefine : ∀ n j, ∃ i, cell (n + 1) j ⊆ cell n i)
    (hsep : ∀ᶠ n in atTop, ∀ j, (x.filter (· ∈ cell n j)).card ≤ 1)
    (hmesh : Tendsto (fun n => (m n : ℝ≥0∞) * (⨆ j, μ (cell n j)) ^ 2) atTop (𝓝 0)) :
    Tendsto (fun n => (expNeg (μ A) : ℝ≥0∞) *
        ∏ j, cellConditionalDensity μ f (cell n j) x) atTop
      (𝓝 (pseudolikelihood (papangelou f) μ A x)) := by
  sorry

/-- 6.3: the pseudolikelihood score has mean zero at the true density (Georgii–Nguyen–Zessin). -/
theorem pseudolikelihood_score_mean_zero {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {X : Ω → Finset S} {μ : Measure S} [SigmaFinite μ]
    {W A : Set S} [NullSingletonClass (μ.restrict W)] (hWm : MeasurableSet W) (hW : μ W ≠ ∞)
    (hAm : MeasurableSet A) (hAW : A ⊆ W) {f : Finset S → ℝ≥0} (hf : Measurable f)
    (hX : HasConfigDensity P X μ W f) (hher : IsHereditary f) {ψ : Finset S → S → ℝ}
    (hψ : Measurable fun z : S × Finset S => ψ z.2 z.1)
    (hint : ∫⁻ ω, ∑ ξ ∈ (X ω).filter (· ∈ A), ‖ψ ((X ω).erase ξ) ξ‖ₑ ∂P ≠ ∞) :
    ∫ ω, (∑ ξ ∈ (X ω).filter (· ∈ A), ψ ((X ω).erase ξ) ξ -
        ∫ ξ in A, ψ (X ω) ξ * papangelou f (X ω) ξ ∂μ) ∂P = 0 := by
  sorry

/-- 6.3: the exponential-family conditional intensity `b(x, ξ) exp ⟪θ, t(x, ξ)⟫`. -/
def expFamilyIntensity (b : Finset S → S → ℝ≥0) (t : Finset S → S → E p) (θ : E p)
    (x : Finset S) (ξ : S) : ℝ≥0 :=
  b x ξ * (Real.exp ⟪θ, t x ξ⟫_ℝ).toNNReal

/-- 6.3: for an exponential family the log-pseudolikelihood is concave in `θ`. -/
theorem concaveOn_log_pseudolikelihood (μ : Measure S) (A : Set S) {b : Finset S → S → ℝ≥0}
    (hb : ∀ x ξ, 0 < b x ξ) {t : Finset S → S → E p} (x : Finset S) (hbm : Measurable (b x))
    (htm : Measurable (t x)) (hint : ∀ θ, ∫⁻ ξ in A, expFamilyIntensity b t θ x ξ ∂μ ≠ ∞) :
    ConcaveOn ℝ Set.univ
      fun θ => Real.log (pseudolikelihood (expFamilyIntensity b t θ) μ A x).toReal := by
  sorry

/-- 6.3: for a Poisson process the pseudolikelihood on `W` is `e^{-μ W}` times the density. -/
theorem pseudolikelihood_poisson (μ : Measure S) {W : Set S} (hW : μ W ≠ ∞) (ρ : S → ℝ≥0)
    {x : Finset S} (hx : (x : Set S) ⊆ W) :
    pseudolikelihood (fun _ ξ => ρ ξ) μ W x =
      (expNeg (μ W) : ℝ≥0∞) * poissonConfigDensity μ W ρ x := by
  sorry

end Likelihood

/-! ## Layer 7: ergodicity of Markov kernels -/

section Ergodicity

variable {α : Type*} [MeasurableSpace α]

/-- 7.1: `C` is `(n, M)`-small: `(κ ^ n) x ≥ M` for every `x ∈ C`. -/
def IsSmallSet (κ : Kernel α α) (n : ℕ) (M : Measure α) (C : Set α) : Prop :=
  ∀ x ∈ C, M ≤ (κ ^ n) x

/-- 7.1: uniform ergodicity from every start in `E`, in Mathlib's total variation distance. -/
def IsUniformlyErgodicOn (κ : Kernel α α) (π : Measure α) (E : Set α) : Prop :=
  ∃ C r : ℝ, 0 ≤ r ∧ r < 1 ∧ ∀ x ∈ E, ∀ m : ℕ, tvDist ((κ ^ m) x) π ≤ C * r ^ m

/-- 7.1: `V`-uniform ergodicity from every start in `E`: the `V`-norm distance to `π` after `m`
steps is at most `C V(x) r^m`. -/
def IsVUniformlyErgodicOn (κ : Kernel α α) (π : Measure α) (E : Set α) (V : α → ℝ≥0∞) : Prop :=
  ∃ C r : ℝ, 0 ≤ r ∧ r < 1 ∧ ∀ x ∈ E, ∀ m : ℕ, ∀ g : α → ℝ, Measurable g →
    (∀ y, ‖g y‖ₑ ≤ V y) →
      Integrable g ((κ ^ m) x) ∧ Integrable g π ∧
        |∫ y, g y ∂(κ ^ m) x - ∫ y, g y ∂π| ≤ C * (V x).toReal * r ^ m

/-- 7.2, Doeblin: if an absorbing set of full measure is `(n₀, M)`-small, the total variation
distance after `m` steps is at most `2 (1 - M(α))^{⌊m / n₀⌋}`. -/
theorem tvDist_pow_le_of_isSmallSet {κ : Kernel α α} [IsMarkovKernel κ] {π : Measure α}
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) {E : Set α} (hE : MeasurableSet E)
    (hπE : π Eᶜ = 0) (hκE : ∀ x ∈ E, κ x Eᶜ = 0) {n₀ : ℕ} {M : Measure α}
    (hM : IsSmallSet κ n₀ M E) :
    (∀ x ∈ E, ∀ m : ℕ, tvDist ((κ ^ m) x) π ≤ 2 * (1 - (M Set.univ).toReal) ^ (m / n₀)) ∧
      (0 < n₀ → M ≠ 0 → IsUniformlyErgodicOn κ π E) := by
  sorry

/-- 7.3, geometric drift: a drift condition `κ V ≤ a V + b` with `a < 1`, and smallness of every
level set of `V`, give `V`-uniform ergodicity. -/
theorem isVUniformlyErgodicOn_of_drift {κ : Kernel α α} [IsMarkovKernel κ] {π : Measure α}
    [IsProbabilityMeasure π] (hπ : κ.Invariant π) {E : Set α} (hE : MeasurableSet E)
    (hπE : π Eᶜ = 0) (hκE : ∀ x ∈ E, κ x Eᶜ = 0) {V : α → ℝ≥0∞} (hV : Measurable V)
    (hV1 : ∀ x, 1 ≤ V x) (hVE : ∀ x ∈ E, V x ≠ ∞) {a b : ℝ≥0} (ha : a < 1)
    (hdrift : ∀ x ∈ E, ∫⁻ y, V y ∂κ x ≤ a * V x + b)
    (hsmall : ∀ R : ℝ≥0, ∃ n : ℕ, 0 < n ∧ ∃ M : Measure α, M ≠ 0 ∧
      IsSmallSet κ n M {x | x ∈ E ∧ V x ≤ R}) :
    IsVUniformlyErgodicOn κ π E V := by
  sorry

end Ergodicity

/-! ## Layer 8: the birth–death Metropolis–Hastings algorithm -/

section MetropolisHastings

variable {X : Type*} [MeasurableSpace X]

open Set in
/-- Local copy of LangevinAndHamiltonianMonteCarlo §1.1: the Metropolis–Hastings kernel with
proposal `Q` and acceptance function `a`: from `x` it moves along `a x y • Q x (dy)` and stays at
`x` with the remaining mass `1 - ∫⁻ y, a x y ∂Q x`. -/
def mhKernel (Q : Kernel X X) [IsSFiniteKernel Q] (a : X → X → ℝ≥0∞) : Kernel X X :=
  Q.withDensity a +
    (Kernel.id : Kernel X X).withDensity fun x _ ↦ 1 - Q.withDensity a x univ

end MetropolisHastings

section BirthDeath

variable {S : Type*} [MeasurableSpace S]

/-- 8.1: the proposal: with probability `p` a birth at a point of density `φ / c` on `W`, with
`c = ∫_W φ dμ`; otherwise the death of a uniformly chosen point (no move from `∅`). -/
def birthDeathProposal (μ : Measure S) (W : Set S) (φ : S → ℝ≥0) (p : ℝ≥0) (x : Finset S) :
    Measure (Finset S) :=
  (p : ℝ≥0∞) • (((∫⁻ u in W, φ u ∂μ)⁻¹ • (μ.restrict W).withDensity fun u => (φ u : ℝ≥0∞)).map
      fun ξ => insert ξ x) +
    ((1 - p : ℝ≥0) : ℝ≥0∞) • (if x = ∅ then Measure.dirac ∅
      else (x.card : ℝ≥0∞)⁻¹ • ∑ η ∈ x, Measure.dirac (x.erase η))

/-- 8.1: the Metropolis–Hastings acceptance probability of the move `x → y`: the birth ratio
`h(y)(1 - p)c / (h(x)φ(ξ)p(n(x) + 1))` and its reciprocal for a death, with `a/0 = 1` at
`h x = 0`. -/
def birthDeathAcceptance (μ : Measure S) (W : Set S) (φ : S → ℝ≥0) (p : ℝ≥0)
    (h : Finset S → ℝ≥0) (x y : Finset S) : ℝ≥0∞ :=
  if h x = 0 then 1
  else if x ⊆ y ∧ (y \ x).card = 1 then
    min 1 (∑ ξ ∈ y \ x, (h y : ℝ≥0∞) * ((1 - p : ℝ≥0) : ℝ≥0∞) * (∫⁻ u in W, φ u ∂μ) /
      ((h x : ℝ≥0∞) * φ ξ * p * (x.card + 1)))
  else if y ⊆ x ∧ (x \ y).card = 1 then
    min 1 (∑ η ∈ x \ y, (h y : ℝ≥0∞) * φ η * p * x.card /
      ((h x : ℝ≥0∞) * ((1 - p : ℝ≥0) : ℝ≥0∞) * ∫⁻ u in W, φ u ∂μ))
  else 1

/-- 8.1: the birth–death Metropolis–Hastings kernel: `mhKernel` for a proposal kernel `Q` and the
acceptance `birthDeathAcceptance`. The statements take any `Q` with
`Q x = birthDeathProposal μ W φ p x`; one exists by `birthDeath_measurable`. -/
def birthDeathKernel (μ : Measure S) (W : Set S) (φ : S → ℝ≥0) (p : ℝ≥0) (h : Finset S → ℝ≥0)
    (Q : Kernel (Finset S) (Finset S)) [IsSFiniteKernel Q] : Kernel (Finset S) (Finset S) :=
  mhKernel Q (birthDeathAcceptance μ W φ p h)

/-- 8.1: the constant `min (1 - p) (p / c)` of the minorisation. -/
def birthDeathConst (μ : Measure S) (W : Set S) (φ : S → ℝ≥0) (p : ℝ≥0) : ℝ≥0∞ :=
  min ((1 - p : ℝ≥0) : ℝ≥0∞) (p / ∫⁻ u in W, φ u ∂μ)

/-- 8.1: the standing hypotheses on the window, the bound `φ`, the target `h` and `p`. -/
structure IsBirthDeathSetting (μ : Measure S) (W : Set S) (φ : S → ℝ≥0) (p : ℝ≥0)
    (h : Finset S → ℝ≥0) : Prop where
  measurableSet : MeasurableSet W
  measure_ne_top : μ W ≠ ∞
  measurable_φ : Measurable φ
  lintegral_ne_zero : ∫⁻ u in W, (φ u : ℝ≥0∞) ∂μ ≠ 0
  lintegral_ne_top : ∫⁻ u in W, (φ u : ℝ≥0∞) ∂μ ≠ ∞
  measurable_h : Measurable h
  isLocallyStable : IsLocallyStable W φ h
  empty_ne_zero : h ∅ ≠ 0
  subset_of_ne_zero : ∀ x, h x ≠ 0 → (x : Set S) ⊆ W
  pos : 0 < p
  lt_one : p < 1

variable [MetricSpace S] [PolishSpace S] [LocallyCompactSpace S] [BorelSpace S]
  {μ : Measure S} [SigmaFinite μ] {W : Set S} [NullSingletonClass (μ.restrict W)]
  {φ : S → ℝ≥0} {p : ℝ≥0} {h : Finset S → ℝ≥0}

/-- 8.1: the proposal is a measurable family of probability measures, so it is a Markov kernel,
and the acceptance function is jointly measurable. -/
theorem birthDeath_measurable (hs : IsBirthDeathSetting μ W φ p h) :
    Measurable (birthDeathProposal μ W φ p) ∧
      (∀ x, IsProbabilityMeasure (birthDeathProposal μ W φ p x)) ∧
      Measurable (uncurry (birthDeathAcceptance μ W φ p h)) := by
  sorry

variable {Q : Kernel (Finset S) (Finset S)} [IsSFiniteKernel Q]

/-- 8.2: the kernel is Markov, reversible with respect to `h · Π_W` and invariant for the
normalised target. -/
theorem birthDeathKernel_isReversible (hs : IsBirthDeathSetting μ W φ p h)
    (hQ : ∀ x, Q x = birthDeathProposal μ W φ p x) :
    IsMarkovKernel (birthDeathKernel μ W φ p h Q) ∧
      (birthDeathKernel μ W φ p h Q).IsReversible
        ((poissonConfigLaw μ W).withDensity fun x => (h x : ℝ≥0∞)) ∧
      (birthDeathKernel μ W φ p h Q).Invariant (configLaw μ W h) := by
  sorry

/-- 8.2: the chain is irreducible with respect to `δ_∅`, and `∅` is reached in `m ≥ n(x)` steps
with probability at least `birthDeathConst ^ m`. -/
theorem birthDeathKernel_isIrreducible (hs : IsBirthDeathSetting μ W φ p h)
    (hQ : ∀ x, Q x = birthDeathProposal μ W φ p x) :
    Kernel.IsIrreducible (Measure.dirac ∅) (birthDeathKernel μ W φ p h Q) ∧
      ∀ x, h x ≠ 0 → ∀ m : ℕ, x.card ≤ m →
        birthDeathConst μ W φ p ^ m ≤ (birthDeathKernel μ W φ p h Q ^ m) x {∅} := by
  sorry

/-- 8.3: every set `{x | h x ≠ 0, n(x) ≤ k}` is `(k, birthDeathConst ^ k δ_∅)`-small. -/
theorem birthDeath_isSmallSet (hs : IsBirthDeathSetting μ W φ p h)
    (hQ : ∀ x, Q x = birthDeathProposal μ W φ p x) (k : ℕ) :
    IsSmallSet (birthDeathKernel μ W φ p h Q) k (birthDeathConst μ W φ p ^ k • Measure.dirac ∅)
      {x | h x ≠ 0 ∧ x.card ≤ k} := by
  sorry

/-- 8.3: for every `β > 1` the chain is `V`-uniformly ergodic with `V x = β^{n(x)}`. -/
theorem birthDeath_isVUniformlyErgodicOn (hs : IsBirthDeathSetting μ W φ p h)
    (hQ : ∀ x, Q x = birthDeathProposal μ W φ p x) {β : ℝ≥0} (hβ : 1 < β) :
    IsVUniformlyErgodicOn (birthDeathKernel μ W φ p h Q) (configLaw μ W h) {x | h x ≠ 0}
      fun x => (β : ℝ≥0∞) ^ x.card := by
  sorry

/-- 8.4: the chain is uniformly ergodic iff the number of points is bounded on `{h ≠ 0}`. -/
theorem birthDeath_isUniformlyErgodicOn_iff (hs : IsBirthDeathSetting μ W φ p h)
    (hQ : ∀ x, Q x = birthDeathProposal μ W φ p x) :
    IsUniformlyErgodicOn (birthDeathKernel μ W φ p h Q) (configLaw μ W h) {x | h x ≠ 0} ↔
      ∃ n₀ : ℕ, 1 ≤ n₀ ∧ ∀ x, h x ≠ 0 → x.card ≤ n₀ := by
  sorry

/-- 8.4: with at most `n₀ ≥ 1` points on `{h ≠ 0}`, the total variation distance after `m` steps
is at most `2 (1 - birthDeathConst ^ n₀)^{⌊m / n₀⌋}`. -/
theorem birthDeath_tvDist_le (hs : IsBirthDeathSetting μ W φ p h)
    (hQ : ∀ x, Q x = birthDeathProposal μ W φ p x) {n₀ : ℕ} (hn₀ : 1 ≤ n₀)
    (hbd : ∀ x, h x ≠ 0 → x.card ≤ n₀) (x : Finset S) (hx : h x ≠ 0) (m : ℕ) :
    tvDist ((birthDeathKernel μ W φ p h Q ^ m) x) (configLaw μ W h) ≤
      2 * (1 - (birthDeathConst μ W φ p ^ n₀).toReal) ^ (m / n₀) := by
  sorry

end BirthDeath

/-! ## Upstream names used in the README -/

#check @Kernel.IsReversible
#check @Kernel.Invariant
#check @Kernel.IsIrreducible
#check @tvDist
#check @klDiv
#check @CondIndepFun
#check @poissonMeasure
#check @variance
#check @HasGradientAt
#check @NullSingletonClass
#check @Kernel.IsReversible.invariant
#check @Measure.map
#check @Measure.withDensity
#check @ProbabilityTheory.Kernel
#check @ContinuousLinearMap.smulRight
#check @NNReal.rpow
#check @Fin.cons
#check @StandardBorelSpace
#check @Kernel.withDensity
#check @measurePreserving_piFinSuccAbove

end TauCetiRoadmap.FiniteGibbsPointProcesses
