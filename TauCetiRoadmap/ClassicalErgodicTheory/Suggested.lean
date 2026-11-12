import Mathlib
import TauCeti.Probability.Process.MarkovChain
import TauCeti.Probability.Process.PathLaw.Basic

/-!
# Classical ergodic theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the definitions
their statements need.

`countablePartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate` and
`measureEntropy` restate the measure entropy of GeometryOfNumbersAndQuadraticArithmetic §4.2, and
`condPartitionEntropy` the conditional entropy given a sub-σ-algebra of ArithmeticDynamics §2.7 in
the countable-label form of README §4.0, only so that the entropy headlines below are statable.

Headline theorems of the README that are not stated here, with the carrier each lacks:

* the spectral characterizations of weak mixing (every mean-zero spectral measure is atomless) and
  of mixing (every mean-zero spectral measure is a Rajchman measure), and the spectral
  Halmos–von Neumann theorem: the spectral measure of a vector for an isometry (README §2.1)
  exists at the pins only through Tau Ceti's Herglotz existence theorem, so a definition of it
  would have to choose the measure;
* uniqueness of equilibrium states for Hölder potentials on transitive subshifts of finite type and
  on their suspension flows (README §§8.4–8.5), and the identification of the logarithm of the
  Ruelle–Perron–Frobenius eigenvalue with the topological pressure (README §8.6): a subshift of
  finite type as a compact metric space carrying its shift map, and the topological suspension
  space with the Bowen–Walters metric; Mathlib's `Subshift` carries no metric, and its product
  metrics `PiNat.metricSpace` and `PiCountable.metricSpace` are definitions, not instances.
-/

noncomputable section

open MeasureTheory Filter Set Topology
open scoped ENNReal NNReal Uniformity

namespace TauCetiRoadmap.ClassicalErgodicTheory

/-! ## Layer 0: Systems, factors and examples -/

section Layer0

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]

/-- Layer 0.1: `π` is a factor map from `(X, μ, T)` to `(Y, ν, S)`: it carries `μ` to `ν` and
intertwines `T` with `S` almost everywhere. -/
def IsFactorMap (π : X → Y) (T : X → X) (S : Y → Y) (μ : Measure X) (ν : Measure Y) : Prop :=
  MeasurePreserving π μ ν ∧ π ∘ T =ᵐ[μ] S ∘ π

/-- Layer 0.4: the first-return map to `A`, equal to `x` where there is no return. -/
def inducedMap (T : X → X) (A : Set X) (x : X) : X :=
  open Classical in
  if h : ∃ n, 0 < n ∧ T^[n] x ∈ A then T^[Nat.find h] x else x

/-- Layer 0.4: the first-return map of a probability-preserving map preserves the normalized
restriction to any measurable set of positive measure; no invertibility is assumed. -/
theorem measurePreserving_inducedMap (μ : Measure X) [IsProbabilityMeasure μ] {T : X → X}
    (hT : MeasurePreserving T μ μ) {A : Set X} (hA : MeasurableSet A) (hμA : 0 < μ A) :
    MeasurePreserving (inducedMap T A) ((μ A)⁻¹ • μ.restrict A) ((μ A)⁻¹ • μ.restrict A) := by
  sorry

/-- Layer 0.3: the endomorphism of the torus `ℝ^d / ℤ^d` induced by an integer matrix,
`(A x)ᵢ = ∑ⱼ Aᵢⱼ xⱼ`. -/
def toralEndomorphism {d : ℕ} (A : Matrix (Fin d) (Fin d) ℤ) :
    UnitAddTorus (Fin d) → UnitAddTorus (Fin d) :=
  fun x i => ∑ j, A i j • x j

end Layer0

section NaturalExtensions

variable {X : Type*} [MeasurableSpace X]

/-- Layer 0.7: compatible backward histories `(x₀, x₁, …)` with `T xₖ₊₁ = xₖ`, with the subtype
σ-algebra. -/
abbrev NaturalExtensionSpace (T : X → X) :=
  {x : ℕ → X // ∀ n, T (x (n + 1)) = x n}

/-- Layer 0.7: the forward history map `(x₀, x₁, …) ↦ (T x₀, x₀, x₁, …)`. -/
def naturalExtensionForward (T : X → X) (x : NaturalExtensionSpace T) :
    NaturalExtensionSpace T :=
  ⟨fun n => if n = 0 then T (x.1 0) else x.1 (n - 1), by
    intro n
    cases n with
    | zero => simp
    | succ n => simpa using x.2 n⟩

/-- Layer 0.7: the inverse history map drops the present state. -/
def naturalExtensionBackward (T : X → X) (x : NaturalExtensionSpace T) :
    NaturalExtensionSpace T :=
  ⟨fun n => x.1 (n + 1), fun n => x.2 (n + 1)⟩

/-- Layer 0.7: projection of a history to its present state `x₀`. -/
def naturalExtensionProjection (T : X → X) (x : NaturalExtensionSpace T) : X := x.1 0

/-- Layer 0.7: the history dynamics is a measurable equivalence of the history space. -/
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

/-- Layer 0.7: the history law is the unique probability on the history space that is invariant
under the history dynamics and projects to `μ` (Sarig, Lemma 1.2). -/
theorem existsUnique_naturalExtensionMeasure [StandardBorelSpace X]
    (T : X → X) (μ : Measure X) [IsProbabilityMeasure μ]
    (hT : MeasurePreserving T μ μ) :
    ∃! μhat : Measure (NaturalExtensionSpace T),
      IsProbabilityMeasure μhat ∧
      MeasurePreserving (naturalExtensionEquiv T hT.measurable) μhat μhat ∧
      MeasurePreserving (naturalExtensionProjection T) μhat μ := by
  sorry

/-- Layer 0.4: an aperiodic invertible probability system on a standard Borel space has complete
sections of arbitrarily small measure, without any ergodicity hypothesis. -/
theorem exists_small_completeSection [StandardBorelSpace X]
    (T : X ≃ᵐ X) (μ : Measure X) [IsProbabilityMeasure μ]
    (hT : MeasurePreserving T μ μ)
    (haperiodic : ∀ n : ℕ, 0 < n → μ {x | T^[n] x = x} = 0)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ A : Set X, MeasurableSet A ∧ μ A < ENNReal.ofReal ε ∧
      μ ((⋃ n : ℕ, T^[n] '' A) ∪ (⋃ n : ℕ, T.symm^[n] '' A)) = 1 := by
  sorry

end NaturalExtensions

section MonoidActions

variable {M X Y A : Type*} [Monoid M] [MulAction M X] [MulAction M Y]
  [MeasurableSpace X] [MeasurableSpace Y]

/-- Layer 0.1: `π` is a factor map of monoid actions: it carries `μ` to `ν` and intertwines each
parameter almost everywhere. -/
def IsFactorMapSMul (π : X → Y) (μ : Measure X) (ν : Measure Y) : Prop :=
  MeasurePreserving π μ ν ∧
    ∀ m : M, (fun x => π (m • x)) =ᵐ[μ] fun x => m • π x

/-- Layer 0.5: the orbit label `x ↦ (ξ (g • x))_(g ∈ F)` over a finite observation window. -/
def orbitLabel (F : Finset M) (ξ : X → A) : X → (F → A) :=
  fun x g => ξ ((g : M) • x)

/-- Layer 0.5: the finite-window dynamical entourage `{(x, y) | ∀ g ∈ F, (g • x, g • y) ∈ U}`. -/
def orbitEntourage (F : Finset M) (U : SetRel X X) : SetRel X X :=
  {p | ∀ g ∈ F, (g • p.1, g • p.2) ∈ U}

end MonoidActions

section Joinings

variable {X Y Z : Type*} [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]

/-- Layer 0.8: the fibrewise product `∫ (κ z).prod (η z) dρ(z)` of two kernels over a base. -/
def relativeIndependentJoining (ρ : Measure Z) (κ : ProbabilityTheory.Kernel Z X)
    (η : ProbabilityTheory.Kernel Z Y) : Measure (X × Y) :=
  ρ.bind fun z => (κ z).prod (η z)

end Joinings

section RelativeProducts

variable {G X Z : Type*} [Group G] [Countable G] [MulAction G X] [MulAction G Z]
  [MeasurableSpace X] [StandardBorelSpace X] [MeasurableSpace Z] [StandardBorelSpace Z]

/-- Layer 0.8: the disintegration of `μ` over a factor `π`, the conditional kernel of the graph
law of `π`. -/
def factorDisintegration (π : X → Z) (μ : Measure X) [IsProbabilityMeasure μ] :
    ProbabilityTheory.Kernel Z X := by
  letI : Nonempty X := nonempty_of_isProbabilityMeasure μ
  exact (μ.map (fun x => (π x, x))).condKernel

/-- Layer 0.8: the relative self-product of `μ` over the factor `π`, a measure on `X × X`. -/
def relativeSelfJoining (π : X → Z) (μ : Measure X) [IsProbabilityMeasure μ] :
    Measure (X × X) :=
  relativeIndependentJoining (μ.map π) (factorDisintegration π μ) (factorDisintegration π μ)

/-- Layer 0.8: for a factor of probability-preserving actions of a countable group, the relative
self-product is invariant under the diagonal action. -/
theorem relativeSelfJoining_measurePreserving (π : X → Z)
    (μ : Measure X) [IsProbabilityMeasure μ] (ν : Measure Z) [IsProbabilityMeasure ν]
    (hπ : IsFactorMapSMul (M := G) π μ ν)
    (hG : ∀ g : G, MeasurePreserving (g • ·) μ μ)
    (hZ : ∀ g : G, MeasurePreserving (g • ·) ν ν) (g : G) :
    MeasurePreserving (Prod.map (g • ·) (g • ·))
      (relativeSelfJoining π μ) (relativeSelfJoining π μ) := by
  sorry

end RelativeProducts

/-! ## Layer 1: The mixing hierarchy -/

section MixingAlong

variable {M X : Type*} [Monoid M] [MulAction M X] [MeasurableSpace X]

/-- Layer 1.0: correlation mixing along an explicit parameter filter `l`:
`μ (A ∩ (m • ·)⁻¹' B) → μ A * μ B` along `l`. -/
def MixingAlong (μ : Measure X) (l : Filter M) : Prop :=
  ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
    Tendsto (fun m : M => μ.real (A ∩ (m • ·) ⁻¹' B)) l
      (𝓝 (μ.real A * μ.real B))

/-- Layer 1.0: diagonal weak mixing of a monoid action, ergodicity of the diagonal action on
`X × X`. -/
class WeakMixingSMul (μ : Measure X) : Prop where
  ergodicSMul_prod : ErgodicSMul M (X × X) (μ.prod μ)

/-- Layer 1.0: mixing along a nontrivial filter implies diagonal weak mixing. -/
theorem MixingAlong.weakMixingSMul (μ : Measure X) [IsProbabilityMeasure μ]
    (hM : ∀ m : M, MeasurePreserving (m • ·) μ μ) {l : Filter M} [l.NeBot]
    (h : MixingAlong (M := M) μ l) : WeakMixingSMul (M := M) μ := by
  sorry

end MixingAlong

section Layer1

variable {X : Type*} [MeasurableSpace X]

/-- Layer 1.1: weak mixing of a map, ergodicity of the product system `T × T`. -/
structure WeakMixing (T : X → X) (μ : Measure X) : Prop extends MeasurePreserving T μ μ where
  ergodic_prodMap : Ergodic (Prod.map T T) (μ.prod μ)

/-- Layer 1.3: diagonal weak mixing of an additive action, ergodicity of the diagonal action on
`X × X`. -/
class WeakMixingVAdd (G X : Type*) [VAdd G X] [MeasurableSpace X] (μ : Measure X) : Prop where
  ergodicVAdd_prod : ErgodicVAdd G (X × X) (μ.prod μ)

variable (μ : Measure X) [IsProbabilityMeasure μ]

/-- Layer 1.1: weak mixing is Cesàro decay of the absolute set correlations. -/
theorem weakMixing_iff_tendsto_cesaro {T : X → X} (hT : MeasurePreserving T μ μ) :
    WeakMixing T μ ↔ ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
      Tendsto (fun N : ℕ => (N : ℝ)⁻¹ *
          ∑ n ∈ Finset.range N, |μ.real (A ∩ T^[n] ⁻¹' B) - μ.real A * μ.real B|)
        atTop (𝓝 0) := by
  sorry

/-- Layer 1.1: the product of a weakly mixing system with any ergodic probability system is
ergodic. -/
theorem WeakMixing.ergodic_prodMap_of_ergodic {T : X → X} (hT : WeakMixing T μ)
    {Y : Type*} [MeasurableSpace Y] (ν : Measure Y) [IsProbabilityMeasure ν] {S : Y → Y}
    (hS : Ergodic S ν) : Ergodic (Prod.map T S) (μ.prod ν) := by
  sorry

end Layer1

/-! ## Layer 2: Spectral theory -/

section Spectral

/-- Layer 2.2: Wiener's lemma: for a finite measure `σ` on the circle, the Cesàro means of
`|σ̂(n)|²` converge to the sum of the squares of the atoms of `σ`. -/
theorem tendsto_cesaro_norm_moment_sq (σ : Measure Circle) [IsFiniteMeasure σ] :
    Tendsto (fun N : ℕ => (N : ℝ)⁻¹ * ∑ n ∈ Finset.range N, ‖∫ z, (z : ℂ) ^ n ∂σ‖ ^ 2) atTop
      (𝓝 (∑' z : Circle, σ.real {z} ^ 2)) := by
  sorry

/-- Layer 2.3: a probability-preserving map is weakly mixing iff every `L²` eigenfunction of its
Koopman operator is almost everywhere constant. -/
theorem weakMixing_iff_hasEigenvector_ae_const {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsProbabilityMeasure μ] {T : X → X} (hT : MeasurePreserving T μ μ) :
    WeakMixing T μ ↔ ∀ (c : ℂ) (f : Lp ℂ 2 μ),
      Module.End.HasEigenvector (Lp.compMeasurePreservingₗᵢ ℂ T hT).toLinearMap c f →
        ∃ a : ℂ, (f : X → ℂ) =ᵐ[μ] fun _ => a := by
  sorry

/-- Layer 2.5: the Følner mean ergodic theorem: for an isometric representation of a countable
group on a Hilbert space and a left Følner family, the averages `#(F i)⁻¹ ∑_(g ∈ F i) U (g⁻¹) v`
converge to the orthogonal projection of `v` onto the invariant vectors. -/
theorem exists_tendsto_foelner_average {G H ι : Type*} [Group G] [Countable G]
    [MeasurableSpace G] [MeasurableSingletonClass G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (U : G →* (H →L[ℂ] H)) (hU : ∀ g v, ‖U g v‖ = ‖v‖)
    (l : Filter ι) [l.NeBot] (F : ι → Finset G)
    (hF : IsFoelner G (Measure.count : Measure G) l fun i => (F i : Set G)) (v : H) :
    ∃ w : H, (∀ g, U g w = w) ∧ (∀ u : H, (∀ g, U g u = u) → inner ℂ u (v - w) = 0) ∧
      Tendsto (fun i => ((F i).card : ℂ)⁻¹ • ∑ g ∈ F i, U g⁻¹ v) l (𝓝 w) := by
  sorry

end Spectral

/-! ## Layer 3: Flows -/

section Layer3

variable {X : Type*} [MeasurableSpace X] [AddAction ℝ X] [MeasurableVAdd₂ ℝ X]
  (μ : Measure X) [IsProbabilityMeasure μ] [VAddInvariantMeasure ℝ X μ]

/-- Layer 3.2: diagonal weak mixing of a measurable real flow is Cesàro decay of the absolute set
correlations, the weak mixing of MathematicalBilliards §12.1. -/
theorem weakMixingVAdd_real_iff_tendsto_cesaro :
    WeakMixingVAdd ℝ X μ ↔ ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
      Tendsto (fun T : ℝ => T⁻¹ * ∫ t in (0 : ℝ)..T,
          |μ.real (A ∩ (t +ᵥ ·) ⁻¹' B) - μ.real A * μ.real B|) atTop (𝓝 0) := by
  sorry

/-- Layer 3.2: a measurable real flow is weakly mixing iff its time-`t` map is weakly mixing, for
any `t ≠ 0`. -/
theorem weakMixingVAdd_real_iff_weakMixing {t : ℝ} (ht : t ≠ 0) :
    WeakMixingVAdd ℝ X μ ↔ WeakMixing (fun x : X => t +ᵥ x) μ := by
  sorry

end Layer3

section AEFlows

variable {X : Type*} [MeasurableSpace X] [StandardBorelSpace X] (μ : Measure X) [SigmaFinite μ]

/-- Layer 3.5: Mackey's point realization: a jointly measurable family of measure-preserving maps
satisfying the flow law almost everywhere agrees, at every time and almost everywhere, with an
honest flow on a conull invariant set. -/
theorem exists_conullFlow_realization (T : ℝ → X → X) (hT : Measurable (Function.uncurry T))
    (hpres : ∀ t, MeasurePreserving (T t) μ μ) (hzero : ∀ᵐ x ∂μ, T 0 x = x)
    (hadd : ∀ s t, ∀ᵐ x ∂μ, T (s + t) x = T s (T t x)) :
    ∃ (X₀ : Set X) (Φ : ℝ → X → X), MeasurableSet X₀ ∧ μ X₀ᶜ = 0 ∧
      Measurable (Function.uncurry Φ) ∧ (∀ t, ∀ x ∈ X₀, Φ t x ∈ X₀) ∧
      (∀ x ∈ X₀, Φ 0 x = x) ∧ (∀ s t, ∀ x ∈ X₀, Φ (s + t) x = Φ s (Φ t x)) ∧
      ∀ t, Φ t =ᵐ[μ] T t := by
  sorry

end AEFlows

/-! ## Layer 4: Kolmogorov–Sinai entropy -/

section PartitionEntropy

variable {X : Type*} [MeasurableSpace X]

/-- Layer 4.0: the entropy `∑ -pᵢ log pᵢ ∈ ℝ≥0∞` of a countable label, `pᵢ = μ (a ⁻¹' {i})`. -/
def countablePartitionEntropy (μ : Measure X) {ι : Type*} [Countable ι] (a : X → ι) : ℝ≥0∞ :=
  ∑' i, ENNReal.ofReal (Real.negMulLog (μ.real (a ⁻¹' {i})))

/-- Layer 4.0: the length-`n` itinerary `(a x, a (T x), …, a (T^[n-1] x))`. -/
def iteratedPartitionLabel {ι : Type*} (T : X → X) (a : X → ι) (n : ℕ) : X → (Fin n → ι) :=
  fun x k => a (T^[k] x)

/-- Layer 4.0: the entropy rate `inf_(n ≥ 1) H(aⁿ) / n` of a countable label. -/
def partitionEntropyRate (μ : Measure X) (T : X → X) {ι : Type*} [Countable ι] (a : X → ι) :
    ℝ≥0∞ :=
  ⨅ (n : ℕ) (_ : 0 < n), countablePartitionEntropy μ (iteratedPartitionLabel T a n) / n

/-- Layer 4.0: the Kolmogorov–Sinai entropy, the supremum of the entropy rates of measurable
`ℕ`-valued labels of finite entropy. -/
def measureEntropy (μ : Measure X) (T : X → X) : ℝ≥0∞ :=
  ⨆ (a : X → ℕ) (_ : Measurable a) (_ : countablePartitionEntropy μ a < ⊤),
    partitionEntropyRate μ T a

/-- Layer 4.2: the Kolmogorov–Sinai theorem: the entropy rate of a finite-entropy one-sided
generator is the entropy. -/
theorem measureEntropy_eq_partitionEntropyRate_of_generator (μ : Measure X)
    [IsProbabilityMeasure μ] {T : X → X} (hT : MeasurePreserving T μ μ)
    {ι : Type*} [Countable ι] [MeasurableSpace ι] [MeasurableSingletonClass ι]
    {ξ : X → ι} (hξ : Measurable ξ) (hH : countablePartitionEntropy μ ξ < ⊤)
    (hgen : ∀ s : Set X, MeasurableSet s → ∃ t : Set X,
      MeasurableSet[⨆ k : ℕ, MeasurableSpace.comap (fun x => ξ (T^[k] x)) ‹_›] t ∧
        s =ᵐ[μ] t) :
    measureEntropy μ T = partitionEntropyRate μ T ξ := by
  sorry

/-- Layer 4.2: the Kolmogorov–Sinai theorem for a finite-entropy two-sided generator of an
invertible system. -/
theorem measureEntropy_eq_partitionEntropyRate_of_twoSidedGenerator (μ : Measure X)
    [IsProbabilityMeasure μ] {T : X ≃ᵐ X} (hT : MeasurePreserving T μ μ)
    {ι : Type*} [Countable ι] [MeasurableSpace ι] [MeasurableSingletonClass ι]
    {ξ : X → ι} (hξ : Measurable ξ) (hH : countablePartitionEntropy μ ξ < ⊤)
    (hgen : ∀ s : Set X, MeasurableSet s → ∃ t : Set X,
      MeasurableSet[⨆ k : ℤ, MeasurableSpace.comap (fun x => ξ ((T.toEquiv ^ k) x)) ‹_›] t ∧
        s =ᵐ[μ] t) :
    measureEntropy μ T = partitionEntropyRate μ T ξ := by
  sorry

/-- Layer 4.2: the natural extension of a probability-preserving map of a standard Borel space has
the same entropy as the map. -/
theorem measureEntropy_naturalExtension [StandardBorelSpace X] (T : X → X) (μ : Measure X)
    [IsProbabilityMeasure μ] (hT : MeasurePreserving T μ μ)
    (μhat : Measure (NaturalExtensionSpace T)) [IsProbabilityMeasure μhat]
    (hinv : MeasurePreserving (naturalExtensionEquiv T hT.measurable) μhat μhat)
    (hproj : MeasurePreserving (naturalExtensionProjection T) μhat μ) :
    measureEntropy μhat (naturalExtensionEquiv T hT.measurable) = measureEntropy μ T := by
  sorry

/-- Layer 4.3: the entropy of a one- or two-sided Bernoulli shift on a countable alphabet is the
Shannon entropy `∑ -pₐ log pₐ` of its base, infinite when the series diverges. -/
theorem measureEntropy_bernoulliShift {α : Type*} [Countable α] [MeasurableSpace α]
    [MeasurableSingletonClass α] (p : Measure α) [IsProbabilityMeasure p] :
    measureEntropy (Measure.infinitePi fun _ : ℕ => p) (TauCeti.Probability.shift α) =
        ∑' a, ENNReal.ofReal (Real.negMulLog (p.real {a})) ∧
      measureEntropy (Measure.infinitePi fun _ : ℤ => p) (fun x n => x (n + 1)) =
        ∑' a, ENNReal.ofReal (Real.negMulLog (p.real {a})) := by
  sorry

/-- Layer 4.3: the entropy of the stationary Markov shift of a Markov kernel `κ` on a finite set
with invariant probability `π` is `-∑ᵢⱼ πᵢ κᵢⱼ log κᵢⱼ`. -/
theorem measureEntropy_markovShift {S : Type*} [Fintype S] [MeasurableSpace S]
    [MeasurableSingletonClass S] (κ : ProbabilityTheory.Kernel S S)
    [ProbabilityTheory.IsMarkovKernel κ] (π : Measure S) [IsProbabilityMeasure π]
    (hπ : κ.Invariant π) :
    measureEntropy (TauCeti.Probability.markovChainLaw π κ) (TauCeti.Probability.shift S) =
      ∑ i, ∑ j, ENNReal.ofReal (π.real {i} * Real.negMulLog ((κ i).real {j})) := by
  sorry

end PartitionEntropy

section RelativeEntropy

variable {X : Type*} [mX : MeasurableSpace X] [StandardBorelSpace X]
variable (μ : Measure X) [IsProbabilityMeasure μ]

/-- Layer 4.0: the conditional entropy of a countable label given a sub-σ-algebra, in its
conditional-kernel form on a standard Borel space. -/
def condPartitionEntropy {A : Type*} [Countable A] (ξ : X → A)
    (𝒜 : {m : MeasurableSpace X // m ≤ mX}) : ℝ≥0∞ :=
  ∫⁻ x, countablePartitionEntropy (ProbabilityTheory.condExpKernel μ 𝒜.1 x) ξ ∂μ

/-- Layer 4.8: the relative entropy rate `inf_(n ≥ 1) H(ξⁿ | 𝒜) / n`. -/
def relativePartitionEntropyRate (T : X → X) {A : Type*} [Countable A]
    (ξ : X → A) (𝒜 : {m : MeasurableSpace X // m ≤ mX}) : ℝ≥0∞ :=
  ⨅ (n : ℕ) (_ : 0 < n),
    condPartitionEntropy μ (fun x => fun k : Fin n => ξ (T^[k] x)) 𝒜 / n

/-- Layer 4.8: the relative Kolmogorov–Sinai entropy given `𝒜`, the supremum of the relative
rates of finite measurable labels, retaining infinite values. -/
def relativeMeasureEntropy (T : X → X) (𝒜 : {m : MeasurableSpace X // m ≤ mX}) : ℝ≥0∞ :=
  ⨆ (n : ℕ) (ξ : X → Fin (n + 1)) (_ : Measurable ξ),
    relativePartitionEntropyRate μ T ξ 𝒜

/-- Layer 4.8: the Abramov–Rokhlin addition formula `h_μ(T) = h_ν(S) + h_μ(T | π)` in `ℝ≥0∞` for
a factor map of probability-preserving maps of standard Borel spaces. -/
theorem measureEntropy_factor_add_relative {Y : Type*} [mY : MeasurableSpace Y]
    [StandardBorelSpace Y] (T : X → X) (S : Y → Y)
    (ν : Measure Y) [IsProbabilityMeasure ν] (π : X → Y)
    (hT : MeasurePreserving T μ μ) (hS : MeasurePreserving S ν ν)
    (hπ : IsFactorMap π T S μ ν) :
    measureEntropy μ T = measureEntropy ν S +
      relativeMeasureEntropy μ T ⟨MeasurableSpace.comap π mY, hπ.1.measurable.comap_le⟩ := by
  sorry

end RelativeEntropy

section ActionEntropy

variable {G X : Type*} [Group G] [MulAction G X] [MeasurableSpace X]

/-- Layer 4.6: the entropy rate of a countable label for a group action, the infimum of
`H(ξ^F) / #F` over nonempty finite windows `F`. -/
def actionPartitionEntropyRate (μ : Measure X) {A : Type*} [Countable A] (ξ : X → A) : ℝ≥0∞ :=
  ⨅ (F : Finset G) (_ : F.Nonempty), countablePartitionEntropy μ (orbitLabel F ξ) / F.card

/-- Layer 4.6: the entropy of a group action, the supremum of the rates of finite measurable
labels. -/
def actionMeasureEntropy (μ : Measure X) : ℝ≥0∞ :=
  ⨆ (n : ℕ) (ξ : X → Fin (n + 1)) (_ : Measurable ξ),
    actionPartitionEntropyRate (G := G) μ ξ

variable [MeasurableSpace G] [MeasurableSingletonClass G] [Countable G] [Infinite G]

/-- Layer 4.6: along every left Følner family, the normalized window entropies of a finite-entropy
label converge to its entropy rate (the infimum rule). -/
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

/-! ## Layer 5: Topological entropy and pressure -/

section Topological

variable {X : Type*} [MeasurableSpace X]

/-- Layer 5.1: the Borel probabilities invariant under `T`. -/
def invariantProbabilities (T : X → X) : Set (ProbabilityMeasure X) :=
  {ν | MeasurePreserving T (ν : Measure X) (ν : Measure X)}

/-- Layer 5.1: the probabilities invariant under every parameter of a monoid action. -/
def actionInvariantProbabilities (M : Type*) [Monoid M] [MulAction M X] :
    Set (ProbabilityMeasure X) :=
  ⋂ m : M, invariantProbabilities (m • ·)

/-- Layer 5.1: the probabilities invariant under every time map of a continuous flow. -/
def flowInvariantProbabilities {τ : Type*} [TopologicalSpace τ] [AddMonoid τ]
    [TopologicalSpace X] (ϕ : Flow τ X) :
    Set (ProbabilityMeasure X) :=
  ⋂ t : τ, invariantProbabilities (ϕ t)

variable [UniformSpace X]

/-- Layer 5.4: the largest weighted sum `∑_(x ∈ s) exp (S_n φ x)` over `(U, n)`-separated sets. -/
def pressureNetSum (T : X → X) (φ : X → ℝ) (U : SetRel X X) (n : ℕ) : ℝ≥0∞ :=
  ⨆ (s : Finset X) (_ : Dynamics.IsDynNetIn T univ U n s),
    ∑ x ∈ s, ENNReal.ofReal (Real.exp (birkhoffSum T φ n x))

/-- Layer 5.4: topological pressure by separated sets, the supremum over entourages of the
exponential growth rate of `pressureNetSum`. -/
def topologicalPressure (T : X → X) (φ : X → ℝ) : EReal :=
  ⨆ U ∈ 𝓤 X, ExpGrowth.expGrowthSup fun n : ℕ => pressureNetSum T φ U n

end Topological

section ActionPressure

variable {G X : Type*} [Group G] [MulAction G X] [UniformSpace X]

/-- Layer 5.6: the largest weighted sum `∑_(x ∈ s) exp (∑_(g ∈ F) φ (g • x))` over sets separated
by the window entourage. -/
def actionPressureNetSum (F : Finset G) (φ : X → ℝ) (U : SetRel X X) : ℝ≥0∞ :=
  ⨆ (s : Finset X) (_ : (s : Set X).Pairwise fun x y => (x, y) ∉ orbitEntourage F U),
    ∑ x ∈ s, ENNReal.ofReal (Real.exp (∑ g ∈ F, φ (g • x)))

/-- Layer 5.6: pressure along a filtered family of windows. -/
def actionPressureAlong {ι : Type*} (F : ι → Finset G) (l : Filter ι) (φ : X → ℝ) : EReal :=
  ⨆ U ∈ 𝓤 X, limsup (fun i => ENNReal.log (actionPressureNetSum (F i) φ U) / (F i).card) l

variable [MeasurableSpace G]

/-- Layer 5.6: the topological pressure of an action, along the finite windows of Mathlib's
maximal Følner filter for counting measure. -/
def actionTopologicalPressure (φ : X → ℝ) : EReal :=
  actionPressureAlong (G := G) id
    (Filter.comap (fun F : Finset G => (F : Set G)) (maxFoelner G (Measure.count : Measure G))) φ

end ActionPressure

section FlowPressure

variable {X : Type*} [MetricSpace X]

/-- Layer 5.5: the topological pressure of a continuous flow, the pressure of its time-1 map for
the averaged potential `F₁ x = ∫_0^1 F (ϕ s x) ds`. -/
def flowTopologicalPressure (ϕ : Flow ℝ X) (F : C(X, ℝ)) : EReal :=
  topologicalPressure (ϕ 1) (fun x => ∫ s in (0 : ℝ)..1, F (ϕ s x))

end FlowPressure

/-! ## Layer 6: Measure entropy of continuous maps -/

section LocalEntropy

variable {X : Type*} [MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]

/-- Layer 6.3: the lower local entropy `sup_(ε > 0) liminf_n I(ν (B_n(x, ε))) / n` at `x`, with
the Bowen ball `B_n(x, ε)` and the information `I(p) = (-log p)⁺` in `ℝ≥0∞`. -/
def lowerLocalEntropy (ν : Measure X) (T : X → X) (x : X) : ℝ≥0∞ :=
  ⨆ (ε : ℝ) (_ : 0 < ε), liminf (fun n : ℕ =>
    (-ENNReal.log (ν {y | ∀ k < n, dist (T^[k] x) (T^[k] y) < ε})).toENNReal / n) atTop

/-- Layer 6.3: the upper local entropy, with `limsup` in place of `liminf`. -/
def upperLocalEntropy (ν : Measure X) (T : X → X) (x : X) : ℝ≥0∞ :=
  ⨆ (ε : ℝ) (_ : 0 < ε), limsup (fun n : ℕ =>
    (-ENNReal.log (ν {y | ∀ k < n, dist (T^[k] x) (T^[k] y) < ε})).toENNReal / n) atTop

/-- Layer 6.3: the Brin–Katok local entropy formula: the lower and upper local entropies agree
almost everywhere, their integral is the entropy, and they equal the entropy almost everywhere for
an ergodic measure. -/
theorem brinKatok {T : X → X} (hT : Continuous T) (ν : ProbabilityMeasure X)
    (hν : ν ∈ invariantProbabilities T) :
    (∀ᵐ x ∂(ν : Measure X), lowerLocalEntropy ν T x = upperLocalEntropy ν T x) ∧
      ∫⁻ x, lowerLocalEntropy ν T x ∂(ν : Measure X) = measureEntropy (ν : Measure X) T ∧
      (Ergodic T (ν : Measure X) →
        ∀ᵐ x ∂(ν : Measure X), lowerLocalEntropy ν T x = measureEntropy (ν : Measure X) T) := by
  sorry

end LocalEntropy

section MeasurableFlowEntropy

variable {X : Type*} [MeasurableSpace X] [StandardBorelSpace X]
  [AddAction ℝ X] [MeasurableVAdd₂ ℝ X]

/-- Layer 6.4: Abramov's formula `h_μ(ϕ t) = |t| * h_μ(ϕ 1)` for a jointly measurable
probability-preserving real flow, in `ℝ≥0∞`. -/
theorem measureEntropy_flow (μ : Measure X) [IsProbabilityMeasure μ]
    [VAddInvariantMeasure ℝ X μ] (t : ℝ) :
    measureEntropy μ (t +ᵥ ·) =
      ENNReal.ofReal |t| * measureEntropy μ ((1 : ℝ) +ᵥ ·) := by
  sorry

end MeasurableFlowEntropy

/-- Layer 6.4: the Haar measure of a toral endomorphism with nonzero determinant has entropy
`∑_(|λ| > 1) log |λ|`, the sum over the complex eigenvalues of `A` with multiplicity. -/
theorem measureEntropy_toralEndomorphism {d : ℕ} (A : Matrix (Fin d) (Fin d) ℤ)
    (hA : A.det ≠ 0) :
    measureEntropy (volume : Measure (UnitAddTorus (Fin d))) (toralEndomorphism A) =
      ENNReal.ofReal
        ((A.charpoly.map (Int.castRingHom ℂ)).roots.map fun z => Real.log (max 1 ‖z‖)).sum := by
  sorry

/-! ## Layer 7: Variational principles -/

section Variational

variable {X : Type*} [MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]

/-- Layer 7.1: the variational principle for pressure, with `EReal` values. -/
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

/-- Layer 7.3: the variational principle for a continuous real flow, with `EReal` values. -/
theorem flowTopologicalPressure_eq_iSup [Nonempty X] (ϕ : Flow ℝ X) (F : C(X, ℝ)) :
    flowTopologicalPressure ϕ F =
      ⨆ ν ∈ flowInvariantProbabilities ϕ,
        ((measureEntropy (ν : Measure X) (ϕ 1) : EReal) +
          ((∫ x, F x ∂(ν : Measure X) : ℝ) : EReal)) := by
  sorry

/-- Layer 7.4: the variational principle for a continuous action of a countably infinite amenable
group on a nonempty compact metric space. -/
theorem actionTopologicalPressure_eq_iSup {G : Type*} [Group G] [Countable G] [Infinite G]
    [MeasurableSpace G] [MeasurableSingletonClass G] [Nonempty X]
    [MulAction G X] (hcont : ∀ g : G, Continuous fun x : X => g • x)
    (hamen : (maxFoelner G (Measure.count : Measure G)).NeBot) (φ : C(X, ℝ)) :
    actionTopologicalPressure (G := G) φ =
      ⨆ ν ∈ actionInvariantProbabilities G (X := X),
        ((actionMeasureEntropy (G := G) (ν : Measure X) : EReal) +
          ((∫ x, φ x ∂(ν : Measure X) : ℝ) : EReal)) := by
  sorry

end Variational

/-! ## Layer 8: Equilibrium states and measures of maximal entropy -/

section Equilibrium

variable {X : Type*} [MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]

/-- Layer 8.1: `ν` is an equilibrium state of `φ`: an invariant probability with
`h_ν(T) + ∫ φ dν = P(T, φ)` in `EReal`. -/
def IsEquilibriumState (T : X → X) (φ : C(X, ℝ)) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ invariantProbabilities T ∧
    (measureEntropy (ν : Measure X) T : EReal) + ((∫ x, φ x ∂(ν : Measure X) : ℝ) : EReal) =
      topologicalPressure T φ

/-- Layer 8.1: `ν` is a measure of maximal entropy: an invariant probability with
`h_ν(T) = h_top(T)` in `EReal`. -/
def IsMeasureOfMaximalEntropy (T : X → X) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ invariantProbabilities T ∧
    (measureEntropy (ν : Measure X) T : EReal) = Dynamics.coverEntropy T univ

/-- Layer 8.1: `ν` is an equilibrium state of a continuous flow: a flow-invariant probability with
`h_ν(ϕ 1) + ∫ F dν` equal to the flow pressure. -/
def IsFlowEquilibriumState (ϕ : Flow ℝ X) (F : C(X, ℝ)) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ flowInvariantProbabilities ϕ ∧
    (measureEntropy (ν : Measure X) (ϕ 1) : EReal) + ((∫ x, F x ∂(ν : Measure X) : ℝ) : EReal) =
      flowTopologicalPressure ϕ F

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

/-- Layer 8.1: under finite topological entropy, measures of maximal entropy are the invariant
probabilities whose real entropy is the real topological entropy. -/
theorem isMeasureOfMaximalEntropy_iff_toReal {T : X → X} (hT : Continuous T)
    (hfin : Dynamics.coverEntropy T univ < ⊤) (ν : ProbabilityMeasure X) :
    IsMeasureOfMaximalEntropy T ν ↔ ν ∈ invariantProbabilities T ∧
      (measureEntropy (ν : Measure X) T).toReal = (Dynamics.coverEntropy T univ).toReal := by
  sorry

/-- Layer 8.2: if the entropy map is upper semicontinuous on the invariant probabilities, every
continuous potential has an equilibrium state. -/
theorem exists_isEquilibriumState [Nonempty X] {T : X → X} (hT : Continuous T)
    (husc : UpperSemicontinuousOn
      (fun ν : ProbabilityMeasure X => measureEntropy (ν : Measure X) T)
      (invariantProbabilities T))
    (φ : C(X, ℝ)) : ∃ ν, IsEquilibriumState T φ ν := by
  sorry

/-- Layer 8.4: Bowen's specification property with periodic shadowing, for a homeomorphism. -/
def HasSpecification (T : X ≃ₜ X) : Prop :=
  ∀ ε > 0, ∃ M : ℕ, ∀ (k : ℕ) (x : Fin k → X) (a b : Fin k → ℤ),
    (∀ i, a i ≤ b i) → (∀ i j : Fin k, i < j → b i + M ≤ a j) →
    ∀ (p : ℕ) (i₀ i₁ : Fin k), (∀ i, a i₀ ≤ a i ∧ b i ≤ b i₁) → b i₁ - a i₀ + M ≤ p →
      ∃ y : X, (T ^ p) y = y ∧ ∀ i, ∀ n ∈ Set.Icc (a i) (b i),
        dist ((T ^ n) y) ((T ^ n) (x i)) ≤ ε

/-- Layer 8.4: the Bowen property of a potential: bounded variation of Birkhoff sums on Bowen
balls of some fixed radius. -/
def HasBowenProperty (T : X → X) (φ : X → ℝ) : Prop :=
  ∃ ε > 0, ∃ K : ℝ, ∀ (n : ℕ) (x y : X), (∀ k < n, dist (T^[k] x) (T^[k] y) ≤ ε) →
    |birkhoffSum T φ n x - birkhoffSum T φ n y| ≤ K

/-- Layer 8.4: Bowen's theorem: for an expansive homeomorphism with specification, every potential
with the Bowen property has exactly one equilibrium state. -/
theorem existsUnique_isEquilibriumState [Nonempty X] (T : X ≃ₜ X)
    (hexp : ∃ δ > 0, ∀ x y : X, x ≠ y → ∃ n : ℤ, δ < dist ((T ^ n) x) ((T ^ n) y))
    (hspec : HasSpecification T) (φ : C(X, ℝ)) (hφ : HasBowenProperty T φ) :
    ∃! ν, IsEquilibriumState T φ ν := by
  sorry

/-- Layer 8.5: expansiveness of a continuous flow in the sense of Bowen–Walters. -/
def IsExpansiveFlow (ϕ : Flow ℝ X) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ (x y : X) (s : ℝ → ℝ), Continuous s → s 0 = 0 →
    (∀ t, dist (ϕ t x) (ϕ (s t) y) < δ) → ∃ u : ℝ, |u| < ε ∧ y = ϕ u x

/-- Layer 8.5: Bowen's specification property for flows, with periodic shadowing up to a time
error at most `ε`. -/
def HasFlowSpecification (ϕ : Flow ℝ X) : Prop :=
  ∀ ε > 0, ∃ M > 0, ∀ (k : ℕ) (x : Fin k → X) (a b : Fin k → ℝ),
    (∀ i, a i ≤ b i) → (∀ i j : Fin k, i < j → b i + M ≤ a j) →
    ∀ (p : ℝ) (i₀ i₁ : Fin k), (∀ i, a i₀ ≤ a i ∧ b i ≤ b i₁) → b i₁ - a i₀ + M ≤ p →
      ∃ (y : X) (τ : ℝ), |τ| ≤ ε ∧ ϕ (p + τ) y = y ∧
        ∀ i, ∀ t ∈ Set.Icc (a i) (b i), dist (ϕ t y) (ϕ t (x i)) ≤ ε

/-- Layer 8.5: the Bowen property of a potential for a flow: bounded variation of the integrals
`∫_0^t F (ϕ s x) ds` on flow Bowen balls of some fixed radius. -/
def HasFlowBowenProperty (ϕ : Flow ℝ X) (F : X → ℝ) : Prop :=
  ∃ ε > 0, ∃ K : ℝ, ∀ (t : ℝ) (x y : X), (∀ s ∈ Set.Icc 0 t, dist (ϕ s x) (ϕ s y) ≤ ε) →
    |(∫ s in (0 : ℝ)..t, F (ϕ s x)) - ∫ s in (0 : ℝ)..t, F (ϕ s y)| ≤ K

/-- Layer 8.5: the flow version of Bowen's theorem: for an expansive flow with specification,
every potential with the flow Bowen property has exactly one flow equilibrium state. -/
theorem existsUnique_isFlowEquilibriumState [Nonempty X] (ϕ : Flow ℝ X)
    (hexp : IsExpansiveFlow ϕ) (hspec : HasFlowSpecification ϕ) (F : C(X, ℝ))
    (hF : HasFlowBowenProperty ϕ F) :
    ∃! ν, IsFlowEquilibriumState ϕ F ν := by
  sorry

end Equilibrium

section SubshiftsOfFiniteType

variable {ι : Type*} [Fintype ι]

/-- Layer 8.4: the one-sided subshift of finite type of sequences with `A (x n) (x (n + 1))`. -/
def sftOneSided (A : ι → ι → Bool) : Set (ℕ → ι) :=
  {x | ∀ n, A (x n) (x (n + 1)) = true}

/-- Layer 8.6: the sequence `(i, x 0, x 1, …)`. -/
def consSeq (i : ι) (x : ℕ → ι) : ℕ → ι
  | 0 => i
  | n + 1 => x n

/-- Layer 8.6: the Ruelle transfer operator `(L f) x = ∑_(σ y = x) exp (φ y) f y` on a one-sided
subshift of finite type, the sum over the admissible first symbols. -/
def ruelleOperator (A : ι → ι → Bool) (φ : (ℕ → ι) → ℝ) (f : (ℕ → ι) → ℝ) (x : ℕ → ι) : ℝ :=
  ∑ i : ι, if A i (x 0) = true then Real.exp (φ (consSeq i x)) * f (consSeq i x) else 0

/-- Layer 8.6: the Ruelle–Perron–Frobenius theorem: for a `d_θ`-Lipschitz potential on a one-sided
aperiodic subshift of finite type, the transfer operator has a positive eigenvalue `c` with a
positive `d_θ`-Lipschitz eigenfunction `h` and an eigenmeasure `ν` normalized by `∫ h dν = 1`, and
`c⁻ⁿ Lⁿ f → h ∫ f dν` uniformly on the subshift for every continuous `f`. -/
theorem exists_ruelleOperator_eigen [Nonempty ι] [DecidableEq ι] [TopologicalSpace ι]
    [DiscreteTopology ι] [MeasurableSpace ι] [MeasurableSingletonClass ι] (A : ι → ι → Bool)
    (haper : ∃ N : ℕ, 0 < N ∧
      ∀ i j, 0 < ((Matrix.of fun i j => if A i j = true then (1 : ℝ) else 0) ^ N) i j)
    {θ : ℝ} (hθ : θ ∈ Ioo 0 1) (φ : (ℕ → ι) → ℝ)
    (hφ : ∃ C : ℝ, ∀ x ∈ sftOneSided A, ∀ y ∈ sftOneSided A, ∀ n : ℕ,
      (∀ k < n, x k = y k) → |φ x - φ y| ≤ C * θ ^ n) :
    ∃ (c : ℝ) (h : (ℕ → ι) → ℝ) (ν : ProbabilityMeasure (ℕ → ι)),
      0 < c ∧ ν (sftOneSided A) = 1 ∧
      (∃ C : ℝ, ∀ x ∈ sftOneSided A, ∀ y ∈ sftOneSided A, ∀ n : ℕ,
        (∀ k < n, x k = y k) → |h x - h y| ≤ C * θ ^ n) ∧
      (∀ x ∈ sftOneSided A, 0 < h x ∧ ruelleOperator A φ h x = c * h x) ∧
      (∀ f : C(ℕ → ι, ℝ), ∫ x, ruelleOperator A φ f x ∂(ν : Measure (ℕ → ι)) =
        c * ∫ x, f x ∂(ν : Measure (ℕ → ι))) ∧
      ∫ x, h x ∂(ν : Measure (ℕ → ι)) = 1 ∧
      ∀ f : C(ℕ → ι, ℝ), TendstoUniformlyOn
        (fun (n : ℕ) (x : ℕ → ι) => (c ^ n)⁻¹ * (ruelleOperator A φ)^[n] f x)
        (fun x => h x * ∫ y, f y ∂(ν : Measure (ℕ → ι))) atTop (sftOneSided A) := by
  sorry

end SubshiftsOfFiniteType

end TauCetiRoadmap.ClassicalErgodicTheory
