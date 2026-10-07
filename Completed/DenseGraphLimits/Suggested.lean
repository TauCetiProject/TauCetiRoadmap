import Mathlib
import TauCeti.Combinatorics.DenseGraphLimits.AEEqFun.Validation
import TauCeti.Combinatorics.DenseGraphLimits.Applications
import TauCeti.Combinatorics.DenseGraphLimits.Counting
import TauCeti.Combinatorics.DenseGraphLimits.CutMetric.Constant
import TauCeti.Combinatorics.DenseGraphLimits.CutMetric.FiniteGraph
import TauCeti.Combinatorics.DenseGraphLimits.CutMetric.Pullback.Basic
import TauCeti.Combinatorics.DenseGraphLimits.CutMetric.Stability
import TauCeti.Combinatorics.DenseGraphLimits.CutMetric.UnitIntervalModel
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.ArrayLaw
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Compatibility
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Correspondence
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.DissociatedRepresentation
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Empirical
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Existence
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Infinite.Correspondence
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Infinite.Mixture
import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Infinite.Sampling
import TauCeti.Combinatorics.DenseGraphLimits.Graphon.Complete
import TauCeti.Combinatorics.DenseGraphLimits.Graphon.CutNormLimit
import TauCeti.Combinatorics.DenseGraphLimits.Graphon.StandardBorelModel
import TauCeti.Combinatorics.DenseGraphLimits.GraphonSpace.Compact
import TauCeti.Combinatorics.DenseGraphLimits.GraphonSpace.Convergence
import TauCeti.Combinatorics.DenseGraphLimits.GraphonSpace.Density
import TauCeti.Combinatorics.DenseGraphLimits.GraphonSpace.TotallyBounded
import TauCeti.Combinatorics.DenseGraphLimits.HomDensity.Closeness
import TauCeti.Combinatorics.DenseGraphLimits.HomDensity.Structural
import TauCeti.Combinatorics.DenseGraphLimits.Representability.Associativity
import TauCeti.Combinatorics.DenseGraphLimits.Representability.Representation
import TauCeti.Combinatorics.DenseGraphLimits.Sampling.AlmostSure.CutDistance
import TauCeti.Combinatorics.DenseGraphLimits.Sampling.Concentration
import TauCeti.Combinatorics.DenseGraphLimits.Sampling.ConvergenceInMeasure
import TauCeti.Combinatorics.DenseGraphLimits.Sampling.Expectation
import TauCeti.Combinatorics.DenseGraphLimits.Sampling.Summability
import TauCeti.Combinatorics.DenseGraphLimits.Sampling.Unbiased
import TauCeti.Combinatorics.DenseGraphLimits.Separation.Inverse
import TauCeti.Combinatorics.DenseGraphLimits.StepGraphon.Approximation
import TauCeti.Combinatorics.DenseGraphLimits.StepGraphon.Density
import TauCeti.Combinatorics.DenseGraphLimits.StepGraphon.Energy
import TauCeti.Combinatorics.DenseGraphLimits.StepGraphon.FiniteGraph.Examples
import TauCeti.Combinatorics.DenseGraphLimits.StepGraphon.Regularity
import TauCeti.Combinatorics.SimpleGraph.Counting
import TauCeti.MeasureTheory.Constructions.Pi
import TauCeti.MeasureTheory.Measure.AtomlessStandardBorel
import TauCeti.MeasureTheory.Measure.UnitIntervalMap
import TauCeti.Probability.Exchangeability.Arrays.Ergodic
import TauCeti.Probability.Process.PartitionFiltration

/-!
# Dense graph limits and graphons: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti declaration that realizes it, so the correspondence is checked by the Lean kernel
rather than asserted in prose. No statement is left open. That is evidence for completion, not its
criterion: completion is judged by a milestone-by-milestone audit against `README.md`, which a
fully discharged file of suggested forms cannot replace.

The earlier version of this file proposed its own kernels, graphons, cut metric, graphon space,
sampling laws, exchangeable graph laws and gluing algebra, and left the milestones about them
open. Those objects now live in Tau Ceti under `TauCeti.DenseGraphLimits`, in the shapes the README
pins, so the statements below are made about the Tau Ceti objects directly. Statements keep the
README's names, closed by the Tau Ceti declaration even where its name differs. The differences:

* **Names.** `graphonSpace_ext_homDensity` is Tau Ceti's `graphonSpace_ext_iff_homDensity`,
  stated there for every `GraphonSpace Ω μ`. `cutDist_eq_zero_of_forall_homDensity_eq_cross` and
  `cutDist_eq_zero_iff_forall_homDensity_eq_cross` are Tau Ceti's unsuffixed
  `cutDist_eq_zero_of_forall_homDensity_eq` and `cutDist_eq_zero_iff_forall_homDensity_eq`, which
  are already cross-carrier and hypothesis-free. `isProbabilityMeasure_of_isCoupling` is
  `IsCoupling.isProbabilityMeasure`, `injHomDensity_integral_sampleGraph` is
  `integral_injHomDensity_sampleGraph`, and `paramGraphLaw_isProbabilityMeasure` is
  `isProbabilityMeasure_paramGraphLaw`.
* **Absorbed objects.** There is no `cutDistSame`, `cutDistSame_self` or
  `forall_homDensity_eq_of_cutDistSame_eq_zero`: `cutDistSame` was `cutDist` at one carrier, so the
  same-carrier corollaries are the cross-carrier theorems at `Ω₁ = Ω₂`. There is no
  `graphonSetoid`: `GraphonSpace Ω μ` is the `SeparationQuotient` of the cut-distance pseudometric,
  whose relation is `cutDist = 0` (`graphonSpace_mk_eq_mk_iff`) and whose `MetricSpace` instance
  is Mathlib's.
* **One extra hypothesis.** `graphParamMobius_nonneg` and `paramGraphLaw_isProbabilityMeasure`
  also take `IsIsoInvariant f`. The factorization `C = Z · diag(f†) · Zᵀ`
  (`connectionMatrix_fullyLabeled`) holds only up to the relabeling that `LabeledGraph.glue`
  performs, which invariance absorbs. Every consumer, the summit included, assumes all four
  axioms, so nothing downstream is weakened.
* **Stronger results.** The collision estimate is proved with `C(k, 2)/(n + 1)` in place of
  `k²/(n + 1)`, and Frieze–Kannan with `4 ^ ⌈1/ε²⌉` parts in place of `4 ^ (⌈1/ε²⌉ + 1)` (the
  README's optional sharpening); both are stated in the README's form and closed by the sharper
  bound. Representability, dissociated extremality and compactness hold on every atomless
  standard Borel carrier, and the convergence equivalence, total boundedness and both
  sampling-convergence modes on every probability carrier. Statements the README pins on
  `(I, volume)` are given there, the others at Tau Ceti's generality.
* **A false stand-in.** The earlier `LabeledGraph.glue_adj_inl` and `glue_adj_inr` said the gluing
  reflects each side's adjacency exactly. That fails between two labeled vertices, which the other
  side may join. Tau Ceti's lemmas carry that disjunct; the gluing is stated below through
  `glue_graph`.
* **The array interface.** `graphLawArrayLawEquiv` pushes laws forward along
  `SimpleGraph.adjArray` into the array API's carrier `ℕ × ℕ → Bool`, not along `graphCoordEquiv`;
  the `EdgeIndex` carrier contract is stated separately. Tau Ceti has no graph-side ergodicity
  theorem; `isDissociated_iff_ergodicSMul` below is the two-step composition through the array
  API.

Left out: the companion graph-regularity roadmap, outside this roadmap by the README's text. Of the
finite `Measure.pi` transports the README wants in a general home, the two-coordinate one is
stated below; the three- and four-coordinate ones are still private in
`TauCeti/Combinatorics/DenseGraphLimits/HomDensity/SmallGraphs.lean`. That is a home move, not a
missing result.
-/

namespace TauCetiRoadmap.DenseGraphLimits

open MeasureTheory Filter Topology TauCeti TauCeti.DenseGraphLimits
open scoped unitInterval ENNReal

variable {Ω Ω₁ Ω₂ Ω₃ : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω₁] [MeasurableSpace Ω₂]
  [MeasurableSpace Ω₃] {μ : Measure Ω} {μ₁ : Measure Ω₁} {μ₂ : Measure Ω₂} {μ₃ : Measure Ω₃}
  [IsProbabilityMeasure μ] [IsProbabilityMeasure μ₁] [IsProbabilityMeasure μ₂]
  [IsProbabilityMeasure μ₃]

/-! ## Layer 0: finite-graph and measure scaffolding -/

/-- **Edge factors are `Sym2`-indexed.** The value of a graphon on one edge of a vertex
assignment, read without choosing an orientation. -/
theorem edgeFactor_mk {V : Type*} (W : Graphon Ω μ) (x : V → Ω) (a b : V) :
    edgeFactor W x s(a, b) = W (x a) (x b) :=
  TauCeti.DenseGraphLimits.edgeFactor_mk W x a b

/-- **Two coordinates of a finite product measure.** Evaluation at two distinct indices pushes
`Measure.pi` forward to the product of the two factors (general home:
`TauCeti/MeasureTheory/Constructions/Pi.lean`). -/
theorem measurePreserving_eval_pair {ι : Type*} [Fintype ι] [DecidableEq ι] {α : ι → Type*}
    [∀ i, MeasurableSpace (α i)] (ν : ∀ i, Measure (α i)) [∀ i, IsProbabilityMeasure (ν i)]
    {a b : ι} (hab : a ≠ b) :
    MeasurePreserving (fun x : ∀ i, α i => (x a, x b)) (Measure.pi ν) ((ν a).prod (ν b)) :=
  TauCeti.measurePreserving_eval_pair ν hab

/-- **Standard-Borel plumbing.** A measurable function on a square with standard Borel values
factors through one countable family of Boolean coordinates, applied to both arguments. -/
theorem exists_eq_measurable_comp_prodMap_self {α γ : Type*} [MeasurableSpace α]
    [MeasurableSpace γ] [StandardBorelSpace γ] [Nonempty γ] {f : α × α → γ} (hf : Measurable f) :
    ∃ (q : α → ℕ → Bool) (g : (ℕ → Bool) × (ℕ → Bool) → γ),
      Measurable q ∧ Measurable g ∧ f = g ∘ Prod.map q q :=
  hf.exists_eq_measurable_comp_prodMap_self

/-! ## Layer 1: core objects and their basic API -/

omit [IsProbabilityMeasure μ] in
/-- **Symmetric kernels are strict and form a pointwise `ℝ`-module.** Each kernel is symmetric,
jointly measurable and bounded at every point, and the module operations act pointwise, so a
difference `U - W` of graphons is a literal kernel. -/
theorem SymmKernel.symm_measurable_bounded (K : SymmKernel Ω μ) :
    (∀ x y, K x y = K y x) ∧ Measurable (Function.uncurry (K : Ω → Ω → ℝ)) ∧
      ∃ C, ∀ x y, |K x y| ≤ C :=
  ⟨K.symm, K.measurable, K.exists_bound⟩

example : Module ℝ (SymmKernel Ω μ) := inferInstance

example (K L : SymmKernel Ω μ) : ⇑(K - L) = ⇑K - ⇑L := K.coe_sub L

example (c : ℝ) (K : SymmKernel Ω μ) : ⇑(c • K) = c • ⇑K := K.coe_smul c

/-- **A graphon is a `[0, 1]`-valued symmetric kernel**, on the nose at every point. -/
theorem Graphon.mem_Icc (W : Graphon Ω μ) (x y : Ω) : W x y ∈ Set.Icc (0 : ℝ) 1 :=
  W.mem_Icc x y

example (W : Graphon Ω μ) : ⇑W.toSymmKernel = ⇑W := W.coe_toSymmKernel

/-- **The homomorphism density** `t(F, W)`: the integral over vertex assignments of the product,
over the `Sym2` edges of `F`, of the graphon's value on each edge. -/
theorem homDensity_def {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (W : Graphon Ω μ) :
    homDensity F W =
      ∫ x, ∏ e ∈ F.edgeFinset, edgeFactor W x e ∂(Measure.pi fun _ : V => μ) :=
  TauCeti.DenseGraphLimits.homDensity_def F W

/-- `t(F, W) ∈ [0, 1]`, with no hypotheses. -/
theorem homDensity_mem_Icc {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (W : Graphon Ω μ) : homDensity F W ∈ Set.Icc (0 : ℝ) 1 :=
  ⟨TauCeti.DenseGraphLimits.homDensity_nonneg F W, TauCeti.DenseGraphLimits.homDensity_le_one F W⟩

/-- **The constant graphon** with value `p : I`, the parameter convention shared with `G(V, p)`. -/
theorem Graphon.const_apply (p : I) (x y : Ω) : Graphon.const μ p x y = (p : ℝ) :=
  TauCeti.DenseGraphLimits.Graphon.const_apply μ p x y

/-- **Layer-1 acceptance: the Erdős–Rényi value** `t(F, W_p) = p ^ e(F)`. -/
theorem homDensity_const {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (p : I) : homDensity F (Graphon.const μ p) = (p : ℝ) ^ F.edgeFinset.card :=
  TauCeti.DenseGraphLimits.homDensity_const F p

/-- **Layer-1 acceptance: the one-edge integral** `t(K₂, W) = ∫∫ W`. -/
theorem homDensity_top_fin_two (W : Graphon Ω μ) :
    homDensity (⊤ : SimpleGraph (Fin 2)) W = ∫ x, ∫ y, W x y ∂μ ∂μ :=
  TauCeti.DenseGraphLimits.homDensity_top_fin_two_eq_integral_integral W

/-- **Layer-1 acceptance: the triangle integral** `t(K₃, W) = ∫∫∫ W(x,y) W(x,z) W(y,z)`. -/
theorem homDensity_top_fin_three (W : Graphon Ω μ) :
    homDensity (⊤ : SimpleGraph (Fin 3)) W = ∫ x, ∫ y, ∫ z, W x y * W x z * W y z ∂μ ∂μ ∂μ :=
  TauCeti.DenseGraphLimits.homDensity_top_fin_three_eq_integral_integral_integral W

/-- The four-cycle integral, the explicit small-graph form behind Sidorenko for `C₄`. -/
theorem homDensity_cycleGraph_four (W : Graphon Ω μ) :
    homDensity (SimpleGraph.cycleGraph 4) W =
      ∫ p : (Ω × Ω) × (Ω × Ω),
        W p.1.1 p.2.1 * W p.2.1 p.1.2 * W p.1.2 p.2.2 * W p.2.2 p.1.1
          ∂((μ.prod μ).prod (μ.prod μ)) :=
  TauCeti.DenseGraphLimits.homDensity_cycleGraph_four W

/-- **Multiplicativity over disjoint unions.** -/
theorem homDensity_sum {V₁ V₂ : Type*} [Fintype V₁] [Fintype V₂] (F₁ : SimpleGraph V₁)
    [DecidableRel F₁.Adj] (F₂ : SimpleGraph V₂) [DecidableRel F₂.Adj] (W : Graphon Ω μ) :
    homDensity (F₁ ⊕g F₂) W = homDensity F₁ W * homDensity F₂ W :=
  TauCeti.DenseGraphLimits.homDensity_sum W

/-- **The finite-graph hom density** `t(F, G) = hom(F, G) / m ^ |V(F)|` for a host on `Fin m`. -/
theorem homDensityFin_def {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ}
    (G : SimpleGraph (Fin m)) :
    homDensityFin F G = (Nat.card (F →g G) : ℝ) / (m ^ Fintype.card V : ℝ) := by
  rw [TauCeti.DenseGraphLimits.homDensityFin_def, Fintype.card_fin]

/-- **Finite-graph compatibility** `t(F, W_G) = hom(F, G) / m ^ |V(F)|`, for a nonempty host. The
graphon `W_G` is the step graphon of `G` on the `m` equal subintervals of `(I, volume)`. -/
theorem homDensity_finiteGraphGraphon {V : Type*} [Fintype V] (F : SimpleGraph V)
    [DecidableRel F.Adj] {m : ℕ} (hm : 0 < m) (G : SimpleGraph (Fin m)) :
    homDensity F (finiteGraphGraphon G) = homDensityFin F G :=
  TauCeti.DenseGraphLimits.homDensity_finiteGraphGraphon F hm G

/-- **Layer-1 acceptance: a finite graph as a step graphon.** The graphon of `G` on `(I, volume)`
is the pullback, along the cell index, of its adjacency graphon on the uniform carrier `Fin m`. -/
theorem finiteGraphGraphon_eq_comap {m : ℕ} [NeZero m] (G : SimpleGraph (Fin m)) :
    finiteGraphGraphon G =
      (finiteGraphGraphonOnFin G).comap (TauCeti.unitInterval.cellFin m)
        TauCeti.unitInterval.measurable_cellFin volume :=
  TauCeti.DenseGraphLimits.finiteGraphGraphon_eq_comap G

open scoped Classical in
example {m : ℕ} [NeZero m] (G : SimpleGraph (Fin m)) (i j : Fin m) :
    finiteGraphGraphonOnFin G i j = if G.Adj i j then 1 else 0 :=
  finiteGraphGraphonOnFin_apply G i j

/-- **The cut norm acts on kernels and is the rectangle supremum** `sup_{S,T} |∫_{S×T} K|`. -/
theorem cutNorm_eq_cutNormSet (K : SymmKernel Ω μ) :
    cutNorm μ K = cutNormSet μ K :=
  TauCeti.DenseGraphLimits.cutNorm_eq_cutNormSet μ K

theorem cutNormSet_def (K : SymmKernel Ω μ) :
    cutNormSet μ K =
      ⨆ (S : Set Ω) (_ : MeasurableSet S) (T : Set Ω) (_ : MeasurableSet T),
        |∫ p in S ×ˢ T, K p.1 p.2 ∂(μ.prod μ)| := by
  simp only [TauCeti.DenseGraphLimits.cutNormSet_def, SymmKernel.rectIntegral_def]

/-- **Seminorm laws of the cut norm.** -/
theorem cutNorm_nonneg (K : SymmKernel Ω μ) : 0 ≤ cutNorm μ K :=
  TauCeti.DenseGraphLimits.cutNorm_nonneg μ K

theorem cutNorm_zero : cutNorm μ (0 : SymmKernel Ω μ) = 0 :=
  TauCeti.DenseGraphLimits.cutNorm_zero μ

theorem cutNorm_neg (K : SymmKernel Ω μ) : cutNorm μ (-K) = cutNorm μ K :=
  TauCeti.DenseGraphLimits.cutNorm_neg μ K

theorem cutNorm_add_le (K L : SymmKernel Ω μ) :
    cutNorm μ (K + L) ≤ cutNorm μ K + cutNorm μ L :=
  TauCeti.DenseGraphLimits.cutNorm_add_le μ K L

theorem cutNorm_smul (c : ℝ) (K : SymmKernel Ω μ) : cutNorm μ (c • K) = |c| * cutNorm μ K :=
  TauCeti.DenseGraphLimits.cutNorm_smul μ c K

/-- **The `L¹` bound.** -/
theorem cutNorm_le_integral_abs (K : SymmKernel Ω μ) :
    cutNorm μ K ≤ ∫ p, |K p.1 p.2| ∂(μ.prod μ) :=
  TauCeti.DenseGraphLimits.cutNorm_le_integral_abs μ K

/-- **The signed (test-function) form** over measurable `u, v : Ω → [-1, 1]`, and the factor-4
sandwich relating it to the cut norm. -/
theorem cutNormSigned_def (K : SymmKernel Ω μ) :
    cutNormSigned μ K =
      ⨆ (u : Ω → ℝ) (_ : Measurable u) (_ : ∀ x, u x ∈ Set.Icc (-1 : ℝ) 1)
        (v : Ω → ℝ) (_ : Measurable v) (_ : ∀ y, v y ∈ Set.Icc (-1 : ℝ) 1),
        |K.testIntegral μ u v| :=
  TauCeti.DenseGraphLimits.cutNormSigned_def μ K

theorem cutNorm_le_cutNormSigned (K : SymmKernel Ω μ) : cutNorm μ K ≤ cutNormSigned μ K :=
  TauCeti.DenseGraphLimits.cutNorm_le_cutNormSigned μ K

theorem cutNormSigned_le_four_mul_cutNorm (K : SymmKernel Ω μ) :
    cutNormSigned μ K ≤ 4 * cutNorm μ K :=
  TauCeti.DenseGraphLimits.cutNormSigned_le_four_mul_cutNorm μ K

omit [IsProbabilityMeasure μ₁] [IsProbabilityMeasure μ₂] in
/-- **`IsCoupling` is a named `Prop`**: a measure on the product with the two given marginals. -/
theorem isCoupling_iff {π : Measure (Ω₁ × Ω₂)} :
    TauCeti.MeasureTheory.IsCoupling μ₁ μ₂ π ↔ π.fst = μ₁ ∧ π.snd = μ₂ :=
  TauCeti.MeasureTheory.isCoupling_iff

/-- The product coupling, so the couplings over which `cutDist` minimizes are never empty. -/
theorem isCoupling_prod : TauCeti.MeasureTheory.IsCoupling μ₁ μ₂ (μ₁.prod μ₂) :=
  TauCeti.MeasureTheory.isCoupling_prod μ₁ μ₂

omit [IsProbabilityMeasure μ₂] in
/-- A coupling of probability measures is a probability measure. Tau Ceti:
`IsCoupling.isProbabilityMeasure`. -/
theorem isProbabilityMeasure_of_isCoupling {π : Measure (Ω₁ × Ω₂)}
    (hπ : TauCeti.MeasureTheory.IsCoupling μ₁ μ₂ π) : IsProbabilityMeasure π :=
  hπ.isProbabilityMeasure

/-- **The overlaid difference**: `U` read through the first coordinate of the coupled space minus
`W` read through the second. -/
theorem overlayDiff_apply (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) (π : Measure (Ω₁ × Ω₂))
    (p q : Ω₁ × Ω₂) : overlayDiff U W π p q = U p.1 q.1 - W p.2 q.2 :=
  TauCeti.DenseGraphLimits.overlayDiff_apply U W π p q

/-- **The cut distance is coupling-primary and cross-carrier**: it is the infimum, over couplings of
the two carriers, of the cut norm of the overlaid difference. -/
theorem le_cutDist_iff (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) {c : ℝ} :
    c ≤ cutDist U W ↔
      ∀ (π : Measure (Ω₁ × Ω₂)) (hπ : TauCeti.MeasureTheory.IsCoupling μ₁ μ₂ π),
        c ≤ @cutNorm _ _ π hπ.isFiniteMeasure (overlayDiff U W π) :=
  ⟨fun h _ hπ => h.trans (TauCeti.DenseGraphLimits.cutDist_le U W hπ),
    TauCeti.DenseGraphLimits.le_cutDist U W⟩

theorem cutDist_nonneg (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : 0 ≤ cutDist U W :=
  TauCeti.DenseGraphLimits.cutDist_nonneg U W

theorem cutDist_comm (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : cutDist U W = cutDist W U :=
  TauCeti.DenseGraphLimits.cutDist_comm U W

theorem cutDist_self (U : Graphon Ω μ) : cutDist U U = 0 :=
  TauCeti.DenseGraphLimits.cutDist_self U

/-- **The triangle inequality on arbitrary probability carriers** (Janson, Lemma 6.5), so
`cutDist` is a pseudometric with no carrier hypotheses. -/
theorem cutDist_triangle (U : Graphon Ω₁ μ₁) (V : Graphon Ω₂ μ₂) (W : Graphon Ω₃ μ₃) :
    cutDist U W ≤ cutDist U V + cutDist V W :=
  TauCeti.DenseGraphLimits.cutDist_triangle U V W

/-- **The stability gate of the triangle route**: replacing either graphon moves the cut distance
by at most the cut norm of the replacement. Tau Ceti's finite gluing with zero-mass middle atoms
(`cutDist_triangle_of_countable_middle`) is private to `CutMetric/Triangle.lean`. -/
theorem abs_cutDist_sub_le_cutNorm_add_cutNorm (U U' : Graphon Ω₁ μ₁) (W W' : Graphon Ω₂ μ₂) :
    |cutDist U W - cutDist U' W'| ≤
      cutNorm μ₁ (U.toSymmKernel - U'.toSymmKernel) +
        cutNorm μ₂ (W.toSymmKernel - W'.toSymmKernel) :=
  TauCeti.DenseGraphLimits.abs_cutDist_sub_le_cutNorm_add_cutNorm U U' W W'

/-- **The fixed-carrier graphon space**, over any probability carrier: graphons modulo vanishing
cut distance, a genuine metric space whose distance is `cutDist` on representatives. -/
example : GraphonSpace Ω μ = SeparationQuotient (Graphon Ω μ) := rfl

noncomputable example : MetricSpace (GraphonSpace Ω μ) := inferInstance

theorem graphonSpace_mk_eq_mk_iff (U W : Graphon Ω μ) :
    (SeparationQuotient.mk U : GraphonSpace Ω μ) = SeparationQuotient.mk W ↔ cutDist U W = 0 :=
  TauCeti.DenseGraphLimits.graphonSpace_mk_eq_mk_iff U W

theorem dist_graphonSpace_mk_mk (U W : Graphon Ω μ) :
    dist (SeparationQuotient.mk U : GraphonSpace Ω μ) (SeparationQuotient.mk W) = cutDist U W :=
  TauCeti.DenseGraphLimits.dist_graphonSpace_mk_mk U W

/-- **The canonical public graphon space** is the one over `(I, volume)`. -/
example : GraphonSpaceI = GraphonSpace I (volume : Measure I) := rfl

/-! ## Layer 2: counting, regularity, total boundedness -/

/-- **The counting lemma** `|t(F, U) - t(F, W)| ≤ e(F) · ‖U - W‖□`. -/
theorem counting_lemma {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (U W : Graphon Ω μ) :
    |homDensity F U - homDensity F W|
      ≤ (F.edgeFinset.card : ℝ) * cutNorm μ (U.toSymmKernel - W.toSymmKernel) :=
  TauCeti.DenseGraphLimits.counting_lemma F U W

/-- **The coupling counting lemma**, the cross-carrier engine of forward separation. -/
theorem counting_lemma_coupling {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) {π : Measure (Ω₁ × Ω₂)}
    (hπ : TauCeti.MeasureTheory.IsCoupling μ₁ μ₂ π) :
    |homDensity F U - homDensity F W|
      ≤ (F.edgeFinset.card : ℝ) * @cutNorm _ _ π hπ.isFiniteMeasure (overlayDiff U W π) :=
  TauCeti.DenseGraphLimits.counting_lemma_coupling F U W hπ

/-- **Layer-2 acceptance: counting for `K₂` and `K₃`.** -/
theorem counting_lemma_top_fin_two (U W : Graphon Ω μ) :
    |homDensity (⊤ : SimpleGraph (Fin 2)) U - homDensity (⊤ : SimpleGraph (Fin 2)) W|
      ≤ cutNorm μ (U.toSymmKernel - W.toSymmKernel) :=
  TauCeti.DenseGraphLimits.counting_lemma_top_fin_two U W

theorem counting_lemma_top_fin_three (U W : Graphon Ω μ) :
    |homDensity (⊤ : SimpleGraph (Fin 3)) U - homDensity (⊤ : SimpleGraph (Fin 3)) W|
      ≤ 3 * cutNorm μ (U.toSymmKernel - W.toSymmKernel) :=
  TauCeti.DenseGraphLimits.counting_lemma_top_fin_three U W

/-- **`t(F, ·)` descends to graphon space** and computes `homDensity` on representatives. -/
theorem homDensityOnSpace_mk {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (W : Graphon Ω μ) :
    homDensityOnSpace (μ := μ) F (SeparationQuotient.mk W) = homDensity F W :=
  TauCeti.DenseGraphLimits.homDensityOnSpace_mk F W

/-- **The step graphon** of a measurable finite partition, constant `val p q` on each rectangle. -/
theorem stepGraphon_apply (P : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (val : P.parts → P.parts → I)
    (hsymm : ∀ p q, val p q = val q p) {p q : P.parts} {x y : Ω} (hx : x ∈ (p : Set Ω))
    (hy : y ∈ (q : Set Ω)) :
    stepGraphon (μ := μ) P hP val hsymm x y = (val p q : ℝ) :=
  TauCeti.DenseGraphLimits.stepGraphon_apply P hP val hsymm hx hy

/-- **The block-average step graphon** takes, on each rectangle, Mathlib's set average of `W` there;
on a null rectangle that convention makes it `0`, so it stays a strict `[0, 1]`-valued graphon. -/
theorem stepGraphonAvg_apply (P : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (W : Graphon Ω μ) {p q : P.parts} {x y : Ω}
    (hx : x ∈ (p : Set Ω)) (hy : y ∈ (q : Set Ω)) :
    stepGraphonAvg (μ := μ) P hP W x y =
      ⨍ z in (p : Set Ω) ×ˢ (q : Set Ω), W z.1 z.2 ∂(μ.prod μ) :=
  TauCeti.DenseGraphLimits.stepGraphonAvg_apply P hP W hx hy

theorem stepGraphonAvg_apply_of_measure_eq_zero_left (P : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (W : Graphon Ω μ) {p q : P.parts} {x y : Ω}
    (hp : μ (p : Set Ω) = 0) (hx : x ∈ (p : Set Ω)) (hy : y ∈ (q : Set Ω)) :
    stepGraphonAvg (μ := μ) P hP W x y = 0 :=
  TauCeti.DenseGraphLimits.stepGraphonAvg_apply_of_measure_eq_zero_left P hP W hp hx hy

omit [IsProbabilityMeasure μ] in
/-- **`l2sq`**, the `L²(μ ⊗ μ)` norm squared of a kernel, and its nonnegativity. -/
theorem l2sq_def (K : SymmKernel Ω μ) : l2sq μ K = ∫ p, K p.1 p.2 ^ 2 ∂(μ.prod μ) :=
  TauCeti.DenseGraphLimits.l2sq_def μ K

omit [IsProbabilityMeasure μ] in
theorem l2sq_nonneg (K : SymmKernel Ω μ) : 0 ≤ l2sq μ K :=
  TauCeti.DenseGraphLimits.l2sq_nonneg μ K

/-- **The graphon partition energy** is the `l2sq` of the block-average step graphon. -/
theorem graphonPartitionEnergy_eq (P : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (W : Graphon Ω μ) :
    graphonPartitionEnergy μ P hP W = l2sq μ (stepGraphonAvg (μ := μ) P hP W).toSymmKernel :=
  TauCeti.DenseGraphLimits.graphonPartitionEnergy_eq μ P hP W

/-- **The `L²`-Pythagoras increment** under refinement `Q ≤ P`. -/
theorem graphonPartitionEnergy_increment (P Q : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (hQ : ∀ q ∈ Q.parts, MeasurableSet q) (href : Q ≤ P)
    (W : Graphon Ω μ) :
    graphonPartitionEnergy μ Q hQ W
      = graphonPartitionEnergy μ P hP W
        + l2sq μ ((stepGraphonAvg (μ := μ) Q hQ W).toSymmKernel
          - (stepGraphonAvg (μ := μ) P hP W).toSymmKernel) :=
  TauCeti.DenseGraphLimits.graphonPartitionEnergy_increment μ P Q hP hQ href W

theorem graphonPartitionEnergy_mono (P Q : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (hQ : ∀ q ∈ Q.parts, MeasurableSet q) (href : Q ≤ P)
    (W : Graphon Ω μ) :
    graphonPartitionEnergy μ P hP W ≤ graphonPartitionEnergy μ Q hQ W :=
  TauCeti.DenseGraphLimits.graphonPartitionEnergy_mono μ P Q hP hQ href W

theorem graphonPartitionEnergy_nonneg (P : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (W : Graphon Ω μ) :
    0 ≤ graphonPartitionEnergy μ P hP W :=
  TauCeti.DenseGraphLimits.graphonPartitionEnergy_nonneg μ P hP W

theorem graphonPartitionEnergy_le_one (P : Finpartition (Set.univ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (W : Graphon Ω μ) :
    graphonPartitionEnergy μ P hP W ≤ 1 :=
  TauCeti.DenseGraphLimits.graphonPartitionEnergy_le_one μ P hP W

/-- **Frieze–Kannan weak regularity** over a measurable `Finpartition`, with at most
`4 ^ (⌈1/ε²⌉ + 1)` parts; Tau Ceti proves the sharper `4 ^ ⌈1/ε²⌉`. -/
theorem weak_regularity_frieze_kannan (W : Graphon Ω μ) {ε : ℝ} (hε : 0 < ε) :
    ∃ (P : Finpartition (Set.univ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p),
      P.parts.card ≤ 4 ^ (Nat.ceil (1 / ε ^ 2) + 1) ∧
      cutNorm μ (W.toSymmKernel - (stepGraphonAvg (μ := μ) P hP W).toSymmKernel) ≤ ε := by
  obtain ⟨P, hP, hcard, hcut⟩ := TauCeti.DenseGraphLimits.weak_regularity_frieze_kannan μ W hε
  exact ⟨P, hP, hcard.trans (Nat.pow_le_pow_right (by norm_num) (Nat.le_succ _)), hcut⟩

/-- **Step graphons are dense** in the cut metric. -/
theorem dense_stepGraphon :
    Dense {x : GraphonSpace Ω μ | ∃ (P : Finpartition (Set.univ : Set Ω))
      (hP : ∀ p ∈ P.parts, MeasurableSet p) (val : P.parts → P.parts → I)
      (hsymm : ∀ p q, val p q = val q p),
      x = SeparationQuotient.mk (stepGraphon (μ := μ) P hP val hsymm)} :=
  TauCeti.DenseGraphLimits.dense_stepGraphon

/-- **Total boundedness** of graphon space, over any probability carrier and in particular for
`GraphonSpaceI`. -/
theorem totallyBounded_graphonSpace : TotallyBounded (Set.univ : Set (GraphonSpace Ω μ)) :=
  TauCeti.DenseGraphLimits.totallyBounded_graphonSpace

theorem totallyBounded_graphonSpaceI : TotallyBounded (Set.univ : Set GraphonSpaceI) :=
  TauCeti.DenseGraphLimits.totallyBounded_graphonSpaceI

/-! ## Layer 3: the AE / `AEEqFun` view -/

/-- **The a.e. class of a graphon**, a class on `μ ⊗ μ` represented by the graphon itself. -/
theorem Graphon.coeFn_toAEEqFun (W : Graphon Ω μ) :
    ⇑(Graphon.toAEEqFun W) =ᵐ[μ.prod μ] fun p => W p.1 p.2 :=
  TauCeti.DenseGraphLimits.Graphon.coeFn_toAEEqFun W

/-- **`toAEEqFun` consumes `AEEqFun.compMeasurePreserving`**: the class of a pullback along a
measure-preserving map is the pulled-back class. -/
theorem Graphon.toAEEqFun_comap {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'}
    [IsProbabilityMeasure μ'] (W : Graphon Ω μ) {φ : Ω' → Ω} (hφ : MeasurePreserving φ μ' μ) :
    Graphon.toAEEqFun (W.comap φ hφ.measurable μ') =
      AEEqFun.compMeasurePreserving (Graphon.toAEEqFun W) (Prod.map φ φ) (hφ.prod hφ) :=
  TauCeti.DenseGraphLimits.Graphon.toAEEqFun_comap W hφ

/-- **The representative section back**: exactly the a.e. `[0, 1]`-valued, a.e. symmetric classes
come from strict graphons. -/
theorem exists_graphon_repr_iff (f : (Ω × Ω) →ₘ[μ.prod μ] ℝ) :
    (∃ W : Graphon Ω μ, Graphon.toAEEqFun W = f) ↔
      (∀ᵐ p ∂(μ.prod μ), f p ∈ Set.Icc (0 : ℝ) 1) ∧ ∀ᵐ p ∂(μ.prod μ), f p = f p.swap :=
  TauCeti.DenseGraphLimits.exists_graphon_repr_iff f

/-- **The invariance trio**: the observables factor through the a.e. class. -/
theorem homDensity_congr_ae {V : Type*} [Fintype V] (F : SimpleGraph V) [DecidableRel F.Adj]
    {U W : Graphon Ω μ} (h : Graphon.toAEEqFun U = Graphon.toAEEqFun W) :
    homDensity F U = homDensity F W :=
  TauCeti.DenseGraphLimits.homDensity_congr_ae F (Graphon.toAEEqFun_eq_iff.1 h)

theorem cutNorm_congr_ae {K L : SymmKernel Ω μ} (h : ∀ᵐ p ∂(μ.prod μ), K p.1 p.2 = L p.1 p.2) :
    cutNorm μ K = cutNorm μ L :=
  TauCeti.DenseGraphLimits.cutNorm_congr_ae h

theorem cutDist_eq_zero_of_aeEq {U W : Graphon Ω μ}
    (h : ∀ᵐ p ∂(μ.prod μ), U p.1 p.2 = W p.1 p.2) : cutDist U W = 0 :=
  TauCeti.DenseGraphLimits.cutDist_eq_zero_of_aeEq h

/-- The cut distance is invariant under a.e. changes on either side, on arbitrary carriers. -/
theorem cutDist_congr_ae_left {U U' : Graphon Ω₁ μ₁} {W : Graphon Ω₂ μ₂}
    (h : ∀ᵐ p ∂(μ₁.prod μ₁), U p.1 p.2 = U' p.1 p.2) : cutDist U W = cutDist U' W :=
  TauCeti.DenseGraphLimits.cutDist_congr_ae_left h

/-- **The round-trip gate**: passing to the a.e. class forgets strict equality, already on the
unit interval, which is why the public quotient sits on top of the strict carrier. -/
theorem toAEEqFun_not_injective_unitInterval :
    ¬ Function.Injective (Graphon.toAEEqFun (Ω := I) (μ := (volume : Measure I))) :=
  TauCeti.DenseGraphLimits.Graphon.toAEEqFun_not_injective_unitInterval

/-! ## Layer 4: completeness and compactness -/

/-- **Realignment**: a sequence of graphons on a standard Borel carrier with controlled consecutive
cut distances is carried, by one probability measure on the path space whose coordinates are
measure preserving, to a common carrier with the same cut-norm control. -/
theorem exists_isProbabilityMeasure_cutNorm_comap_sub_lt [StandardBorelSpace Ω]
    (W : ℕ → Graphon Ω μ) {ε : ℕ → ℝ} (hW : ∀ n, cutDist (W n) (W (n + 1)) < ε n) :
    ∃ (P : Measure (ℕ → Ω)) (_ : IsProbabilityMeasure P),
      (∀ n, MeasurePreserving (fun x : ℕ → Ω => x n) P μ) ∧
      ∀ n, cutNorm P ((W n).toSymmKernel.comap (fun x => x n) (measurable_pi_apply n) P -
        (W (n + 1)).toSymmKernel.comap (fun x => x (n + 1)) (measurable_pi_apply (n + 1)) P) <
          ε n :=
  TauCeti.DenseGraphLimits.exists_isProbabilityMeasure_cutNorm_comap_sub_lt W hW

/-- **The dyadic martingale `L¹` approximation**: the block averages over the canonical finite
partitions of a countably generated carrier converge to the graphon in `L¹(μ ⊗ μ)`. -/
theorem tendsto_eLpNorm_countableStepGraphonAvg [MeasurableSpace.CountablyGenerated Ω]
    (W : Graphon Ω μ) :
    Tendsto
      (fun n => eLpNorm
        ((fun z : Ω × Ω => countableStepGraphonAvg W n z.1 z.2) - fun z : Ω × Ω => W z.1 z.2)
        1 (μ.prod μ))
      atTop (𝓝 0) :=
  TauCeti.DenseGraphLimits.tendsto_eLpNorm_countableStepGraphonAvg W

/-- The square filtration the martingale runs on generates the product σ-algebra (general home:
`TauCeti/Probability/Process/PartitionFiltration.lean`). -/
theorem iSup_countableSquareFiltration {α : Type*} [m : MeasurableSpace α]
    [MeasurableSpace.CountablyGenerated α] :
    ⨆ n, TauCeti.MeasureTheory.countableSquareFiltration α n = m.prod m :=
  TauCeti.MeasureTheory.iSup_countableSquareFiltration

/-- **A cut-norm Cauchy sequence on one countably generated carrier has a cut-norm limit.** -/
theorem exists_graphon_tendsto_cutNorm_of_cauchy_cutNorm [MeasurableSpace.CountablyGenerated Ω]
    (V : ℕ → Graphon Ω μ)
    (hV : ∀ ε > 0, ∃ N, ∀ m ≥ N, ∀ n ≥ N,
      cutNorm μ ((V m).toSymmKernel - (V n).toSymmKernel) < ε) :
    ∃ U : Graphon Ω μ,
      Tendsto (fun n => cutNorm μ ((V n).toSymmKernel - U.toSymmKernel)) atTop (𝓝 0) :=
  TauCeti.DenseGraphLimits.exists_graphon_tendsto_cutNorm_of_cauchy_cutNorm V hV

/-- **Lovász–Szegedy compactness** of the canonical graphon space, and completeness from it. -/
example : CompactSpace GraphonSpaceI := inferInstance

example : CompleteSpace GraphonSpaceI := inferInstance

/-- Compactness holds over every atomless standard Borel carrier. -/
example [StandardBorelSpace Ω] [NullSingletonClass μ] : CompactSpace (GraphonSpace Ω μ) :=
  inferInstance

/-! ## Layer 5: coupling and map cut distance agree -/

variable (μ) in
/-- **Janson A.9**: every standard Borel probability space receives a measure-preserving map from
`(I, volume)`, atoms allowed (general home:
`TauCeti/MeasureTheory/Measure/UnitIntervalMap.lean`). -/
theorem exists_measurePreserving_from_unitInterval [StandardBorelSpace Ω] :
    ∃ g : I → Ω, MeasurePreserving g (volume : Measure I) μ :=
  MeasureTheory.Measure.exists_measurePreserving_from_unitInterval μ

variable (μ) in
/-- **The atomless mod-null equivalence** with `(I, volume)`, the transport the realignment runs on
(general home: `TauCeti/MeasureTheory/Measure/AtomlessStandardBorel.lean`). -/
theorem exists_mpModNull_equiv_unitInterval [StandardBorelSpace Ω] [NullSingletonClass μ] :
    ∃ (f : Ω → I) (g : I → Ω),
      MeasurePreserving f μ volume ∧ MeasurePreserving g volume μ ∧
      (∀ᵐ x ∂μ, g (f x) = x) ∧ (∀ᵐ y ∂(volume : Measure I), f (g y) = y) :=
  MeasureTheory.Measure.exists_mpModNull_equiv_unitInterval μ

/-- **The map form of the cut distance**: the infimum, over measure-preserving maps from
`(I, volume)` to both carriers, of the cut norm of the pulled-back difference. -/
theorem cutDistPullback_def (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) :
    cutDistPullback U W =
      sInf {r | ∃ (f : I → Ω₁) (g : I → Ω₂) (hf : MeasurePreserving f volume μ₁)
        (hg : MeasurePreserving g volume μ₂),
        cutNorm volume (U.toSymmKernel.comap f hf.measurable volume
          - W.toSymmKernel.comap g hg.measurable volume) = r} :=
  TauCeti.DenseGraphLimits.cutDistPullback_def U W

/-- **Coupling and map cut distance agree** over standard Borel carriers, atoms allowed. -/
theorem cutDist_eq_cutDistPullback [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂]
    (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : cutDist U W = cutDistPullback U W :=
  TauCeti.DenseGraphLimits.cutDist_eq_cutDistPullback U W

/-- **The Layer-5 gate, Dirac case**: both carriers are point masses, and the map form still
returns the distance of the two values. -/
example (U : Graphon ℝ (Measure.dirac 0)) (W : Graphon ℝ (Measure.dirac 1)) :
    cutDistPullback U W = |U 0 0 - W 1 1| := by
  rw [← TauCeti.DenseGraphLimits.cutDist_eq_cutDistPullback, cutDist_dirac_dirac]

/-- **The Layer-5 gate, finite-atomic case**: the uniform two-point carrier against a Bernoulli
law. -/
example {p : I} :
    cutDistPullback (finiteGraphGraphonOnFin (⊤ : SimpleGraph (Fin 2)))
      (Graphon.const (ProbabilityTheory.bernoulliMeasure (0 : ℝ) 1 p)
        ⟨2⁻¹, by norm_num, by norm_num⟩) = 1 / 8 := by
  rw [← TauCeti.DenseGraphLimits.cutDist_eq_cutDistPullback,
    cutDist_finiteGraphGraphonOnFin_top_two_const_half]

/-- **The Layer-5 gate, mixed case**: the uniform two-point carrier against `(I, volume)`. -/
example :
    cutDistPullback (finiteGraphGraphonOnFin (⊤ : SimpleGraph (Fin 2)))
      (Graphon.const (volume : Measure I) ⟨2⁻¹, by norm_num, by norm_num⟩) = 1 / 8 := by
  rw [← TauCeti.DenseGraphLimits.cutDist_eq_cutDistPullback,
    cutDist_finiteGraphGraphonOnFin_top_two_const_half]

/-! ## Layer 6a: separation and inverse counting -/

/-- **Forward separation, cross-carrier and hypothesis-free.** -/
theorem forall_homDensity_eq_of_cutDist_eq_zero (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)
    (h : cutDist U W = 0) :
    ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity F U = homDensity F W :=
  TauCeti.DenseGraphLimits.forall_homDensity_eq_of_cutDist_eq_zero U W h

/-- **Same-carrier forward separation** is the cross-carrier theorem at `Ω₁ = Ω₂`. -/
example (U W : Graphon Ω μ) (h : cutDist U W = 0) (n : ℕ) (F : SimpleGraph (Fin n))
    [DecidableRel F.Adj] : homDensity F U = homDensity F W :=
  TauCeti.DenseGraphLimits.forall_homDensity_eq_of_cutDist_eq_zero U W h n F

/-- **Representation on `[0, 1]`** (Janson, Thm 7.1): every graphon on an arbitrary probability
carrier is at cut distance zero from one on `(I, volume)`. -/
theorem exists_graphon_unitInterval_cutDist_eq_zero (W : Graphon Ω μ) :
    ∃ U : Graphon I (volume : Measure I), cutDist W U = 0 :=
  TauCeti.DenseGraphLimits.exists_graphon_unitInterval_cutDist_eq_zero W

/-- **The 7.3 gate**: every graphon is a pullback, along one measurable map, of a graphon on the
standard Borel Cantor space, symmetry and range retained. -/
theorem Graphon.exists_comap_natBool (W : Graphon Ω μ) :
    ∃ (q : Ω → ℕ → Bool) (hq : Measurable q) (V : Graphon (ℕ → Bool) (μ.map q)),
      V.comap q hq μ = W :=
  TauCeti.DenseGraphLimits.Graphon.exists_comap_natBool W

/-- **Inverse counting, cross-carrier and hypothesis-free** (Janson, Thm 8.10). Tau Ceti:
`cutDist_eq_zero_of_forall_homDensity_eq`. -/
theorem cutDist_eq_zero_of_forall_homDensity_eq_cross (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)
    (h : ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity F U = homDensity F W) :
    cutDist U W = 0 :=
  TauCeti.DenseGraphLimits.cutDist_eq_zero_of_forall_homDensity_eq U W h

/-- **Same-carrier inverse counting**, the specialization of the cross-carrier converse. -/
theorem cutDist_eq_zero_of_forall_homDensity_eq (U W : Graphon Ω μ)
    (h : ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity F U = homDensity F W) :
    cutDist U W = 0 :=
  TauCeti.DenseGraphLimits.cutDist_eq_zero_of_forall_homDensity_eq U W h

/-- **The separation iff**, cross-carrier and hypothesis-free. Tau Ceti:
`cutDist_eq_zero_iff_forall_homDensity_eq`. -/
theorem cutDist_eq_zero_iff_forall_homDensity_eq_cross (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) :
    cutDist U W = 0 ↔
      ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
        homDensity F U = homDensity F W :=
  TauCeti.DenseGraphLimits.cutDist_eq_zero_iff_forall_homDensity_eq U W

/-- **The quotient-level separation** on `GraphonSpaceI`. Tau Ceti:
`graphonSpace_ext_iff_homDensity`, for every `GraphonSpace Ω μ`. -/
theorem graphonSpace_ext_homDensity (U W : GraphonSpaceI) :
    U = W ↔ ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensityOnSpace F U = homDensityOnSpace F W :=
  TauCeti.DenseGraphLimits.graphonSpace_ext_iff_homDensity U W

/-! ## Layer 6b: the convergence equivalence -/

/-- **Continuity of the descended densities**, the forward half of the convergence equivalence. -/
theorem continuous_homDensityOnSpace {V : Type*} [Fintype V] (F : SimpleGraph V)
    [DecidableRel F.Adj] : Continuous (homDensityOnSpace (μ := μ) F) :=
  TauCeti.DenseGraphLimits.continuous_homDensityOnSpace F

/-- **The convergence equivalence** on graphon space, over any probability carrier;
`GraphonSpaceI` is the case `(I, volume)`. -/
theorem tendsto_graphonSpace_iff_forall_homDensity (Ws : ℕ → GraphonSpace Ω μ)
    (W : GraphonSpace Ω μ) :
    Tendsto Ws atTop (𝓝 W) ↔
      ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
        Tendsto (fun k => homDensityOnSpace F (Ws k)) atTop (𝓝 (homDensityOnSpace F W)) :=
  TauCeti.DenseGraphLimits.tendsto_graphonSpace_iff_forall_homDensity Ws W

/-- The cross-carrier form: `δ□(Wₙ, W) → 0` iff every `t(F, Wₙ) → t(F, W)`, for graphons on
arbitrary, possibly different, probability carriers. -/
theorem tendsto_cutDist_iff_forall_homDensity_tendsto {Ωs : ℕ → Type*}
    [∀ n, MeasurableSpace (Ωs n)] {μs : ∀ n, Measure (Ωs n)} [∀ n, IsProbabilityMeasure (μs n)]
    (Ws : ∀ n, Graphon (Ωs n) (μs n)) (W : Graphon Ω μ) :
    Tendsto (fun n => cutDist (Ws n) W) atTop (𝓝 0) ↔
      ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
        Tendsto (fun k => homDensity F (Ws k)) atTop (𝓝 (homDensity F W)) :=
  TauCeti.DenseGraphLimits.tendsto_cutDist_iff_forall_homDensity_tendsto Ws W

/-! ## Layer 7: applications and validation -/

/-- **Goodman**: `t(K₃, W) ≥ 2 t(K₂, W)² - t(K₂, W)`. -/
theorem goodman_triangle_density (W : Graphon Ω μ) :
    2 * homDensity (⊤ : SimpleGraph (Fin 2)) W ^ 2 - homDensity (⊤ : SimpleGraph (Fin 2)) W ≤
      homDensity (⊤ : SimpleGraph (Fin 3)) W :=
  TauCeti.DenseGraphLimits.goodman_triangle_density W

/-- **Mantel**: a triangle-free graphon has edge density at most `1/2`. -/
theorem mantel_triangle_free (W : Graphon Ω μ)
    (htriangle : homDensity (⊤ : SimpleGraph (Fin 3)) W = 0) :
    homDensity (⊤ : SimpleGraph (Fin 2)) W ≤ 1 / 2 :=
  TauCeti.DenseGraphLimits.mantel_triangle_free W htriangle

/-- **Sidorenko for `C₄`**: `t(C₄, W) ≥ t(K₂, W)⁴`. -/
theorem sidorenko_cycleGraph_four (W : Graphon Ω μ) :
    homDensity (SimpleGraph.cycleGraph 4) W ≥ homDensity (⊤ : SimpleGraph (Fin 2)) W ^ 4 :=
  TauCeti.DenseGraphLimits.sidorenko_cycleGraph_four W

/-- **The sampling expectation** `E[t(F, G(n, W))] → t(F, W)`. -/
theorem tendsto_integral_homDensityFin_sampleGraph {V : Type*} [Fintype V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (W : Graphon Ω μ) :
    Tendsto (fun n : ℕ => ∫ G, homDensityFin F G ∂sampleGraph W n) atTop
      (𝓝 (homDensity F W)) :=
  SimpleGraph.tendsto_integral_homDensityFin_sampleGraph F W

/-- **Backstop**: `t(K₂, W_{K₄}) = 3/4`. -/
theorem homDensity_top_two_finiteGraphGraphon_top_four :
    homDensity (⊤ : SimpleGraph (Fin 2)) (finiteGraphGraphon (⊤ : SimpleGraph (Fin 4))) = 3 / 4 :=
  TauCeti.DenseGraphLimits.homDensity_top_two_finiteGraphGraphon_top_four

/-- **Backstop**: `t(K₃, W_{C₅}) = 0`, since `C₅` is triangle-free. -/
theorem homDensity_top_three_finiteGraphGraphon_cycleGraph_five :
    homDensity (⊤ : SimpleGraph (Fin 3)) (finiteGraphGraphon (SimpleGraph.cycleGraph 5)) = 0 :=
  TauCeti.DenseGraphLimits.homDensity_top_three_finiteGraphGraphon_cycleGraph_five

/-- **Backstop**: `t(K₃, W_{1/2}) = 1/8`. -/
theorem homDensity_top_three_const_half :
    homDensity (⊤ : SimpleGraph (Fin 3))
      (Graphon.const (volume : Measure I) ⟨1 / 2, by norm_num, by norm_num⟩) = 1 / 8 := by
  rw [TauCeti.DenseGraphLimits.homDensity_const, SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
  norm_num

/-! ## Layer 8a: labeled graphs and reflection positivity -/

/-- **`k`-labeled graphs carry injective labels.** -/
example {k : ℕ} (G : LabeledGraph k) : Function.Injective G.label := G.label_injective

/-- **Gluing retains the labels**: the glued graph is the supremum of the two mapped sides, the two
vertex maps meet exactly at corresponding labels, the labels of the gluing are the common image,
and every vertex comes from one side. So gluing iterates. -/
theorem LabeledGraph.glue_graph {k : ℕ} (G₁ G₂ : LabeledGraph k) :
    (G₁.glue G₂).graph = G₁.graph.map (G₁.glueInl G₂) ⊔ G₂.graph.map (G₁.glueInr G₂) :=
  TauCeti.DenseGraphLimits.LabeledGraph.glue_graph G₁ G₂

theorem LabeledGraph.glueInl_eq_glueInr_iff {k : ℕ} (G₁ G₂ : LabeledGraph k) (a : Fin G₁.n)
    (b : Fin G₂.n) :
    G₁.glueInl G₂ a = G₁.glueInr G₂ b ↔ ∃ i, a = G₁.label i ∧ b = G₂.label i :=
  TauCeti.DenseGraphLimits.LabeledGraph.glueInl_eq_glueInr_iff G₁ G₂ a b

theorem LabeledGraph.glue_label {k : ℕ} (G₁ G₂ : LabeledGraph k) :
    (G₁.glue G₂).label = G₁.glueInl G₂ ∘ G₁.label ∧
      (G₁.glue G₂).label = G₁.glueInr G₂ ∘ G₂.label :=
  ⟨G₁.glueInl_label G₂, G₁.glueInr_label G₂⟩

theorem LabeledGraph.glue_surjective {k : ℕ} (G₁ G₂ : LabeledGraph k) (v : Fin (G₁.glue G₂).n) :
    (∃ a, v = G₁.glueInl G₂ a) ∨ ∃ b, v = G₁.glueInr G₂ b :=
  TauCeti.DenseGraphLimits.LabeledGraph.glue_surjective G₁ G₂ v

/-- **The gluing algebra up to `≃g`**: gluing is commutative and associative up to graph
isomorphisms (`glueCommIso`, `glueAssocIso`) that fix the labels. -/
theorem LabeledGraph.glueCommIso_label {k : ℕ} (G₁ G₂ : LabeledGraph k) (i : Fin k) :
    G₁.glueCommIso G₂ ((G₁.glue G₂).label i) = (G₂.glue G₁).label i :=
  TauCeti.DenseGraphLimits.LabeledGraph.glueCommIso_label G₁ G₂ i

theorem LabeledGraph.glueAssocIso_label {k : ℕ} (A B C : LabeledGraph k) (i : Fin k) :
    A.glueAssocIso B C (((A.glue B).glue C).label i) = (A.glue (B.glue C)).label i :=
  TauCeti.DenseGraphLimits.LabeledGraph.glueAssocIso_label A B C i

/-- `forgetLabels` returns the underlying unlabeled graph. -/
theorem LabeledGraph.forgetLabels_def {k : ℕ} (G : LabeledGraph k) :
    G.forgetLabels = ⟨G.n, G.graph⟩ :=
  TauCeti.DenseGraphLimits.LabeledGraph.forgetLabels_def G

/-- **Graph parameters** are real functions on `Fin`-representatives; the structural predicates
have real bodies. -/
example : GraphParam = ((n : ℕ) → SimpleGraph (Fin n) → ℝ) := rfl

theorem isIsoInvariant_iff {f : GraphParam} :
    IsIsoInvariant f ↔ ∀ (n₁ n₂ : ℕ) (F₁ : SimpleGraph (Fin n₁)) (F₂ : SimpleGraph (Fin n₂)),
      Nonempty (F₁ ≃g F₂) → f n₁ F₁ = f n₂ F₂ :=
  TauCeti.DenseGraphLimits.isIsoInvariant_iff

/-- **The connection matrix** has entry `f` on the unlabeled gluing of `A i` and `A j`. -/
theorem connectionMatrix_apply (f : GraphParam) {k : ℕ} {ι : Type*} (A : ι → LabeledGraph k)
    (i j : ι) :
    connectionMatrix f A i j
      = f ((A i).glue (A j)).forgetLabels.1 ((A i).glue (A j)).forgetLabels.2 :=
  TauCeti.DenseGraphLimits.connectionMatrix_apply f A i j

/-- **Reflection positivity**: every `Fin n`-indexed finite connection matrix is positive
semidefinite. -/
theorem isReflectionPositive_iff {f : GraphParam} :
    IsReflectionPositive f ↔
      ∀ (k n : ℕ) (A : Fin n → LabeledGraph k), (connectionMatrix f A).PosSemidef :=
  TauCeti.DenseGraphLimits.isReflectionPositive_iff

theorem isMultiplicative_iff {f : GraphParam} :
    IsMultiplicative f ↔ ∀ (n₁ n₂ : ℕ) (F₁ : SimpleGraph (Fin n₁)) (F₂ : SimpleGraph (Fin n₂)),
      f (n₁ + n₂) ((F₁ ⊕g F₂).map finSumFinEquiv.toEmbedding) = f n₁ F₁ * f n₂ F₂ :=
  TauCeti.DenseGraphLimits.isMultiplicative_iff

theorem isNormalized_iff {f : GraphParam} : IsNormalized f ↔ f 1 ⊥ = 1 :=
  TauCeti.DenseGraphLimits.isNormalized_iff

/-! ## Layer 8b: the Möbius spine and Lovász–Szegedy representability -/

open Classical in
/-- **The Möbius transform** `f†(F) = ∑_{G ≥ F} (-1)^{e(G) - e(F)} f(G)`. -/
theorem graphParamMobius_apply (f : GraphParam) (n : ℕ) (F : SimpleGraph (Fin n)) :
    graphParamMobius f n F =
      ∑ G ∈ Finset.univ.filter (fun G : SimpleGraph (Fin n) => F ≤ G),
        (-1 : ℝ) ^ (Nat.card G.edgeSet - Nat.card F.edgeSet) * f n G :=
  TauCeti.DenseGraphLimits.graphParamMobius_apply f n F

open Classical in
/-- **The connection-matrix factorization gate** `C = Z · diag(f†) · Zᵀ` on the fully labeled graphs
of `Fin n`. -/
theorem connectionMatrix_fullyLabeled (f : GraphParam) (hf : IsIsoInvariant f) (n : ℕ) :
    connectionMatrix f (LabeledGraph.fullyLabeled (n := n)) =
      SimpleGraph.zetaMatrix (Fin n) ℝ * Matrix.diagonal (graphParamMobius f n) *
        (SimpleGraph.zetaMatrix (Fin n) ℝ).transpose :=
  TauCeti.DenseGraphLimits.connectionMatrix_fullyLabeled f hf n

/-- **Spine 1: `f† ≥ 0`.** Also takes `IsIsoInvariant f`; see the module docstring. -/
theorem graphParamMobius_nonneg (f : GraphParam) (hiso : IsIsoInvariant f)
    (hrp : IsReflectionPositive f) (n : ℕ) (F : SimpleGraph (Fin n)) :
    0 ≤ graphParamMobius f n F :=
  TauCeti.DenseGraphLimits.graphParamMobius_nonneg f hiso hrp n F

/-- **Spine 2: `∑ f† = 1`.** -/
theorem graphParamMobius_sum_eq_one (f : GraphParam) (hmul : IsMultiplicative f)
    (hnorm : IsNormalized f) (n : ℕ) :
    ∑ G : SimpleGraph (Fin n), graphParamMobius f n G = 1 :=
  TauCeti.DenseGraphLimits.graphParamMobius_sum_eq_one f hmul hnorm n

open Classical in
/-- **Spine 3a: the Möbius consistency calculus**, for every label injection, without reflection
positivity. -/
theorem graphParamMobius_sum_comap (f : GraphParam) (hiso : IsIsoInvariant f)
    (hmul : IsMultiplicative f) (hnorm : IsNormalized f) {k n : ℕ} (e : Fin k ↪ Fin n)
    (G : SimpleGraph (Fin k)) :
    graphParamMobius f k G =
      ∑ H ∈ Finset.univ.filter (fun H : SimpleGraph (Fin n) => H.comap ⇑e = G),
        graphParamMobius f n H :=
  TauCeti.DenseGraphLimits.graphParamMobius_sum_comap f hiso hmul hnorm e G

/-- **Spine 3b: the level-`n` law**, an explicit weighted sum of Dirac masses with weight `f†(H)` at
each `H`. -/
theorem paramGraphLaw_singleton (f : GraphParam) (n : ℕ) (H : SimpleGraph (Fin n)) :
    paramGraphLaw f n {H} = ENNReal.ofReal (graphParamMobius f n H) :=
  TauCeti.DenseGraphLimits.paramGraphLaw_singleton f n H

/-- The level laws are probability measures. Tau Ceti: `isProbabilityMeasure_paramGraphLaw`, which
also takes `IsIsoInvariant f`. -/
theorem paramGraphLaw_isProbabilityMeasure (f : GraphParam) (hiso : IsIsoInvariant f)
    (hmul : IsMultiplicative f) (hnorm : IsNormalized f) (hrp : IsReflectionPositive f)
    (n : ℕ) : IsProbabilityMeasure (paramGraphLaw f n) :=
  TauCeti.DenseGraphLimits.isProbabilityMeasure_paramGraphLaw f hiso hmul hnorm hrp n

theorem paramGraphLaw_map_comap (f : GraphParam) (hiso : IsIsoInvariant f)
    (hmul : IsMultiplicative f) (hnorm : IsNormalized f) (hrp : IsReflectionPositive f)
    {k n : ℕ} (e : Fin k ↪ Fin n) :
    (paramGraphLaw f n).map (SimpleGraph.comap ⇑e) = paramGraphLaw f k :=
  TauCeti.DenseGraphLimits.paramGraphLaw_map_comap f hiso hmul hnorm hrp e

/-- **Spine 3c: the random graph law `L_f`**, assembled from the level laws. -/
theorem paramExchangeableLaw_law (f : GraphParam) (hiso : IsIsoInvariant f)
    (hmul : IsMultiplicative f) (hnorm : IsNormalized f) (hrp : IsReflectionPositive f) (n : ℕ) :
    (paramExchangeableLaw f hiso hmul hnorm hrp).law n = paramGraphLaw f n :=
  TauCeti.DenseGraphLimits.paramExchangeableLaw_law f hiso hmul hnorm hrp n

/-- **Spine 4: `upperMass L_f = f`**, by Möbius inversion. -/
theorem paramExchangeableLaw_upperMass (f : GraphParam) (hiso : IsIsoInvariant f)
    (hmul : IsMultiplicative f) (hnorm : IsNormalized f) (hrp : IsReflectionPositive f)
    {k : ℕ} (F : SimpleGraph (Fin k)) :
    (paramExchangeableLaw f hiso hmul hnorm hrp).upperMass F = f k F :=
  TauCeti.DenseGraphLimits.paramExchangeableLaw_upperMass f hiso hmul hnorm hrp F

/-- **Spine 5: `L_f` is dissociated.** -/
theorem isDissociated_paramExchangeableLaw (f : GraphParam) (hiso : IsIsoInvariant f)
    (hmul : IsMultiplicative f) (hnorm : IsNormalized f) (hrp : IsReflectionPositive f) :
    (paramExchangeableLaw f hiso hmul hnorm hrp).IsDissociated :=
  TauCeti.DenseGraphLimits.isDissociated_paramExchangeableLaw f hiso hmul hnorm hrp

/-- **Lovász–Szegedy representability** over the canonical carrier `(I, volume)`: a graph parameter
is `t(·, W)` for some graphon iff it is isomorphism-invariant, multiplicative, normalized and
reflection-positive. -/
theorem lovasz_szegedy_representability (f : GraphParam) :
    (∃ W : Graphon I (volume : Measure I),
        ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj], f n F = homDensity F W) ↔
      IsIsoInvariant f ∧ IsMultiplicative f ∧ IsNormalized f ∧ IsReflectionPositive f :=
  TauCeti.DenseGraphLimits.lovasz_szegedy_representability (volume : Measure I) f

/-- **The derived range corollary**: `[0, 1]`-boundedness follows from the four axioms. -/
theorem graphParam_mem_Icc_of_representability_axioms (f : GraphParam) (hiso : IsIsoInvariant f)
    (hmul : IsMultiplicative f) (hnorm : IsNormalized f) (hrp : IsReflectionPositive f)
    (n : ℕ) (F : SimpleGraph (Fin n)) : f n F ∈ Set.Icc (0 : ℝ) 1 :=
  TauCeti.DenseGraphLimits.graphParam_mem_Icc_of_representability_axioms f hiso hmul hnorm hrp n F

/-! ## Layer 9a: finite and joint graphon sampling -/

/-- **The `W`-random graph law** `G(n, W)` is a probability measure on `SimpleGraph (Fin n)`; the
mass of `G` is the probability that the sampled positions realize exactly the edges of `G`. -/
example (W : Graphon Ω μ) (n : ℕ) : IsProbabilityMeasure (sampleGraph W n) := inferInstance

open Classical in
theorem sampleGraph_singleton (W : Graphon Ω μ) (n : ℕ) (G : SimpleGraph (Fin n)) :
    sampleGraph W n {G} = ENNReal.ofReal (∫ x : Fin n → Ω,
      (∏ e ∈ G.edgeFinset, edgeFactor W x e) *
        ∏ e ∈ (⊤ : SimpleGraph (Fin n)).edgeFinset \ G.edgeFinset, (1 - edgeFactor W x e)
      ∂Measure.pi fun _ => μ) := by
  rw [TauCeti.DenseGraphLimits.sampleGraph_singleton, sampleMass_def]
  simp only [sampleIntegrand_def]

/-- **`G(V, p)` compatibility**: sampling the constant graphon recovers Mathlib's
`binomialRandom`. -/
theorem sampleGraph_const (p : I) (n : ℕ) :
    sampleGraph (Graphon.const μ p) n = SimpleGraph.binomialRandom (Fin n) p :=
  TauCeti.DenseGraphLimits.sampleGraph_const p n

/-- **The injective density** `t₀(F, G)` divides the ordered injective hom count by the falling
factorial `(m)_k = m.descFactorial k`. -/
theorem injHomDensity_def {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ}
    (G : SimpleGraph (Fin m)) :
    injHomDensity F G = (Nat.card {φ : F →g G // Function.Injective φ} : ℝ) /
      (m.descFactorial (Fintype.card V) : ℝ) := by
  rw [TauCeti.DenseGraphLimits.injHomDensity_def, Fintype.card_fin]

/-- **The copy-count bridge**: the numerator is Mathlib's `labelledCopyCount`. -/
theorem card_injective_hom_eq_labelledCopyCount {V : Type*} [Fintype V] (F : SimpleGraph V)
    {m : ℕ} (G : SimpleGraph (Fin m)) :
    Nat.card {φ : F →g G // Function.Injective φ} = G.labelledCopyCount F :=
  SimpleGraph.card_injective_hom_eq_labelledCopyCount F G

/-- **The closeness bound** `|t(F, G) - t₀(F, G)| ≤ C(k, 2)/m`, with no hypothesis on `m`. -/
theorem homDensityFin_sub_injHomDensity_le {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ}
    (G : SimpleGraph (Fin m)) :
    |homDensityFin F G - injHomDensity F G| ≤ ((Fintype.card V).choose 2 : ℝ) / (m : ℝ) := by
  simpa using TauCeti.DenseGraphLimits.homDensityFin_sub_injHomDensity_le F G

/-- **The unbiasedness anchor** `E_{G(m, W)}[t₀(F, ·)] = t(F, W)`, which pins the `(m)_k`
normalization. Tau Ceti: `integral_injHomDensity_sampleGraph`. -/
theorem injHomDensity_integral_sampleGraph {V : Type*} [Fintype V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (W : Graphon Ω μ) {m : ℕ} (hkm : Fintype.card V ≤ m) :
    ∫ G, injHomDensity F G ∂(sampleGraph W m) = homDensity F W :=
  TauCeti.DenseGraphLimits.integral_injHomDensity_sampleGraph W F hkm

/-- **The level-`n` window** of a graph on `ℕ`. -/
theorem restrictFin_def (G : SimpleGraph ℕ) (n : ℕ) :
    G.restrictFin n = SimpleGraph.comap (fun i : Fin n => (i : ℕ)) G := by
  ext a b
  simp

/-- **The joint sampling object** is a probability law on `SimpleGraph ℕ` whose level-`n` window
is `G(n, W)` for every `n`; a finite law on `SimpleGraph ℕ` is determined by its windows. -/
example (W : Graphon Ω μ) : IsProbabilityMeasure (infiniteSampleLaw W) := inferInstance

theorem infiniteSampleLaw_map_restrictFin (W : Graphon Ω μ) (n : ℕ) :
    (infiniteSampleLaw W).map (fun G => G.restrictFin n) = sampleGraph W n :=
  TauCeti.DenseGraphLimits.infiniteSampleLaw_map_restrictFin W n

theorem measure_ext_of_map_restrictFin {ν ν' : Measure (SimpleGraph ℕ)} [IsFiniteMeasure ν]
    (h : ∀ n, ν.map (·.restrictFin n) = ν'.map (·.restrictFin n)) : ν = ν' :=
  TauCeti.DenseGraphLimits.measure_ext_of_map_restrictFin h

/-! ## Layer 9b: exchangeable graph laws and graphon mixtures -/

/-- **Exchangeable graph laws** are consistent under restriction along every label injection. -/
example (L : ExchangeableGraphLaw) {k l : ℕ} (f : Fin k ↪ Fin l) :
    (L.law l).map (SimpleGraph.comap ⇑f) = L.law k :=
  L.consistent f

example (L : ExchangeableGraphLaw) (k : ℕ) : IsProbabilityMeasure (L.law k) := inferInstance

/-- **The upper mass** `P(F ≤ ·)`. -/
theorem ExchangeableGraphLaw.upperMass_def (L : ExchangeableGraphLaw) {k : ℕ}
    (F : SimpleGraph (Fin k)) : L.upperMass F = (L.law k {G | F ≤ G}).toReal :=
  TauCeti.DenseGraphLimits.ExchangeableGraphLaw.upperMass_def L F

/-- Upper masses determine an exchangeable graph law. -/
theorem ExchangeableGraphLaw.ext_upperMass {L L' : ExchangeableGraphLaw}
    (h : ∀ (k : ℕ) (F : SimpleGraph (Fin k)), L.upperMass F = L'.upperMass F) : L = L' :=
  TauCeti.DenseGraphLimits.ExchangeableGraphLaw.ext_upperMass h

/-- **Consistency of the sampling laws**, making `sampleExchangeableLaw` well formed. -/
theorem sampleGraph_map_comap (W : Graphon Ω μ) {k l : ℕ} (f : Fin k ↪ Fin l) :
    (sampleGraph W l).map (SimpleGraph.comap ⇑f) = sampleGraph W k :=
  TauCeti.DenseGraphLimits.sampleGraph_map_comap W f

theorem sampleExchangeableLaw_law (W : Graphon Ω μ) (k : ℕ) :
    (sampleExchangeableLaw W).law k = sampleGraph W k :=
  TauCeti.DenseGraphLimits.sampleExchangeableLaw_law W k

/-- **The sampling anchor** `P(F ≤ G(k, W)) = t(F, W)`. -/
theorem upperMass_sampleExchangeableLaw {k : ℕ} (F : SimpleGraph (Fin k)) [DecidableRel F.Adj]
    (W : Graphon Ω μ) : (sampleExchangeableLaw W).upperMass F = homDensity F W :=
  TauCeti.DenseGraphLimits.upperMass_sampleExchangeableLaw F W

/-- **Dissociation**: the marginal on two disjoint label windows is the product of the marginals. -/
theorem ExchangeableGraphLaw.isDissociated_iff (L : ExchangeableGraphLaw) :
    L.IsDissociated ↔
      ∀ k l : ℕ,
        (L.law (k + l)).map
            (fun G => (SimpleGraph.comap (Fin.castAdd l) G, SimpleGraph.comap (Fin.natAdd k) G))
          = (L.law k).prod (L.law l) :=
  TauCeti.DenseGraphLimits.ExchangeableGraphLaw.isDissociated_iff L

theorem isDissociated_sampleExchangeableLaw (W : Graphon Ω μ) :
    (sampleExchangeableLaw W).IsDissociated :=
  TauCeti.DenseGraphLimits.isDissociated_sampleExchangeableLaw W

/-- **The dissociation bridge**: dissociation iff the upper masses multiply over disjoint unions. -/
theorem isDissociated_iff_upperMass_mul (L : ExchangeableGraphLaw) :
    L.IsDissociated ↔
      ∀ (k l : ℕ) (F₁ : SimpleGraph (Fin k)) (F₂ : SimpleGraph (Fin l)),
        L.upperMass ((F₁ ⊕g F₂).map finSumFinEquiv.toEmbedding) =
          L.upperMass F₁ * L.upperMass F₂ :=
  TauCeti.DenseGraphLimits.isDissociated_iff_upperMass_mul L

/-- **Extremality**: a dissociated exchangeable graph law is the sampling law of a graphon on
`(I, volume)`. -/
theorem exists_graphon_of_isDissociated (L : ExchangeableGraphLaw) (h : L.IsDissociated) :
    ∃ W : Graphon I (volume : Measure I), L = sampleExchangeableLaw W :=
  TauCeti.DenseGraphLimits.exists_graphon_of_isDissociated (volume : Measure I) L h

/-- **Infinite exchangeable graph laws** are invariant under every permutation of `ℕ`. -/
example (L : InfiniteExchangeableGraphLaw) (e : Equiv.Perm ℕ) :
    L.law.map (SimpleGraph.comap ⇑e) = L.law :=
  L.exchangeable e

/-- **The finite ↔ infinite extension** and its finite-marginal eliminators in both directions. -/
theorem exchangeableGraphLawEquivInfinite_law_map_restrictFin (L : ExchangeableGraphLaw) (k : ℕ) :
    (exchangeableGraphLawEquivInfinite L).law.map (·.restrictFin k) = L.law k :=
  TauCeti.DenseGraphLimits.exchangeableGraphLawEquivInfinite_law_map_restrictFin L k

theorem exchangeableGraphLawEquivInfinite_symm_law (L : InfiniteExchangeableGraphLaw) (k : ℕ) :
    (exchangeableGraphLawEquivInfinite.symm L).law k = L.law.map (·.restrictFin k) :=
  TauCeti.DenseGraphLimits.exchangeableGraphLawEquivInfinite_symm_law L k

/-- **The explicit joint sampler is the extension of the sampling laws.** -/
theorem infiniteSampleLaw_eq_extension (W : Graphon Ω μ) :
    infiniteSampleLaw W = (exchangeableGraphLawEquivInfinite (sampleExchangeableLaw W)).law :=
  TauCeti.DenseGraphLimits.infiniteSampleLaw_eq_extension W

/-- **The edge coordinates**: unordered non-diagonal pairs of naturals. -/
example : EdgeIndex = {s : Sym2 ℕ // ¬ s.IsDiag} := rfl

/-- **The carrier bridge**: the coordinate of an infinite graph at an edge index is its edge
indicator, measurably in both directions. -/
theorem graphCoordEquiv_apply (G : SimpleGraph ℕ) (e : EdgeIndex) :
    graphCoordEquiv G e = true ↔ e.1 ∈ G.edgeSet :=
  SimpleGraph.graphCoordEquiv_apply G e

theorem measurable_graphCoordEquiv : Measurable ⇑graphCoordEquiv :=
  TauCeti.DenseGraphLimits.measurable_graphCoordEquiv

theorem measurable_graphCoordEquiv_symm : Measurable ⇑graphCoordEquiv.symm :=
  TauCeti.DenseGraphLimits.measurable_graphCoordEquiv_symm

theorem edgeIndexMap_val (e : Equiv.Perm ℕ) (p : EdgeIndex) :
    (e.edgeIndexMap p).1 = Sym2.map e p.1 :=
  Equiv.Perm.edgeIndexMap_val e p

/-- **The relabeling square**: relabeling the graph jointly relabels its coordinates. -/
theorem graphCoordEquiv_comap (e : Equiv.Perm ℕ) (G : SimpleGraph ℕ) (p : EdgeIndex) :
    graphCoordEquiv (SimpleGraph.comap ⇑e G) p = graphCoordEquiv G (e.edgeIndexMap p) :=
  Equiv.Perm.graphCoordEquiv_comap e G p

/-- **Borel structure on the canonical graphon space**, so it carries mixing measures. -/
example : BorelSpace GraphonSpaceI := inferInstance

/-- **The mixture map** `P ↦ ∫ sampling laws dP`, level by level. -/
theorem mixtureExchangeableLaw_law (P : ProbabilityMeasure GraphonSpaceI) (k : ℕ) :
    (mixtureExchangeableLaw P).law k = (P : Measure GraphonSpaceI).bind (sampleGraphOnSpace k) :=
  TauCeti.DenseGraphLimits.mixtureExchangeableLaw_law P k

/-- **The mixture coordinate law** `upperMass F = ∫ t(F, ·) dP`. -/
theorem upperMass_mixtureExchangeableLaw (P : ProbabilityMeasure GraphonSpaceI) {k : ℕ}
    (F : SimpleGraph (Fin k)) [DecidableRel F.Adj] :
    (mixtureExchangeableLaw P).upperMass F =
      ∫ x, homDensityOnSpace F x ∂(P : Measure GraphonSpaceI) :=
  TauCeti.DenseGraphLimits.upperMass_mixtureExchangeableLaw P F

/-- **The Dirac fiber**: the mixture of `δ_{⟦W⟧}` is the `W`-sampling law. -/
theorem mixtureExchangeableLaw_diracProba (W : Graphon I (volume : Measure I)) :
    mixtureExchangeableLaw (diracProba (SeparationQuotient.mk W : GraphonSpaceI)) =
      sampleExchangeableLaw W :=
  TauCeti.DenseGraphLimits.mixtureExchangeableLaw_diracProba W

/-- **Empirical mixing measures**: the pushforward of the level-`n` marginal along
`G ↦ ⟦W_G⟧`. -/
theorem toMeasure_empiricalMixing (L : ExchangeableGraphLaw) (n : ℕ) :
    (empiricalMixing L n : Measure GraphonSpaceI) =
      (L.law n).map fun G => SeparationQuotient.mk (finiteGraphGraphon G) :=
  TauCeti.DenseGraphLimits.toMeasure_empiricalMixing L n

/-- **The collision estimate**
`|∫ t(F, ·) d(empiricalMixing L (n + 1)) - upperMass F| ≤ k²/(n + 1)`; Tau Ceti proves it with
`C(k, 2)` in place of `k²`. -/
theorem abs_integral_homDensityOnSpace_empiricalMixing_sub_le (L : ExchangeableGraphLaw) {k : ℕ}
    (F : SimpleGraph (Fin k)) [DecidableRel F.Adj] (n : ℕ) :
    |(∫ x, homDensityOnSpace F x ∂(empiricalMixing L (n + 1) : Measure GraphonSpaceI)) -
        L.upperMass F| ≤ (k * k : ℝ) / (n + 1) := by
  refine (TauCeti.DenseGraphLimits.abs_integral_homDensityOnSpace_empiricalMixing_sub_le
    L n F).trans (div_le_div_of_nonneg_right ?_ (by positivity))
  have h : k.choose 2 ≤ k * k := (Nat.choose_le_pow k 2).trans (by rw [sq])
  exact_mod_cast h

/-- **Compactness extraction**, where Layer 4's `CompactSpace GraphonSpaceI` is consumed. -/
theorem exists_subseq_tendsto_probabilityMeasure (Ps : ℕ → ProbabilityMeasure GraphonSpaceI) :
    ∃ (P : ProbabilityMeasure GraphonSpaceI) (φ : ℕ → ℕ),
      StrictMono φ ∧ Tendsto (Ps ∘ φ) atTop (𝓝 P) :=
  TauCeti.DenseGraphLimits.exists_subseq_tendsto_probabilityMeasure Ps

/-- **Limit identification** along any diverging index sequence. -/
theorem mixtureExchangeableLaw_eq_of_tendsto_empiricalMixing (L : ExchangeableGraphLaw)
    {P : ProbabilityMeasure GraphonSpaceI} {φ : ℕ → ℕ} (hφ : Tendsto φ atTop atTop)
    (hconv : Tendsto (fun m => empiricalMixing L (φ m)) atTop (𝓝 P)) :
    mixtureExchangeableLaw P = L :=
  TauCeti.DenseGraphLimits.mixtureExchangeableLaw_eq_of_tendsto_empiricalMixing L hφ hconv

/-- **Existence**: every exchangeable graph law is a graphon mixture. -/
theorem exists_mixtureExchangeableLaw_eq (L : ExchangeableGraphLaw) :
    ∃ P : ProbabilityMeasure GraphonSpaceI, mixtureExchangeableLaw P = L :=
  TauCeti.DenseGraphLimits.exists_mixtureExchangeableLaw_eq L

/-- **Uniqueness**: the mixture map is injective. -/
theorem mixtureExchangeableLaw_injective :
    Function.Injective
      (mixtureExchangeableLaw : ProbabilityMeasure GraphonSpaceI → ExchangeableGraphLaw) :=
  TauCeti.DenseGraphLimits.mixtureExchangeableLaw_injective

/-- **The packaged correspondence**, whose forward map is the mixture map. -/
theorem mixtureExchangeableLawEquiv_apply (P : ProbabilityMeasure GraphonSpaceI) :
    mixtureExchangeableLawEquiv P = mixtureExchangeableLaw P :=
  TauCeti.DenseGraphLimits.mixtureExchangeableLawEquiv_apply P

/-- **Dissociated iff Dirac.** -/
theorem isDissociated_mixtureExchangeableLaw_iff (P : ProbabilityMeasure GraphonSpaceI) :
    (mixtureExchangeableLaw P).IsDissociated ↔
      ∃ W : Graphon I (volume : Measure I),
        P = diracProba (SeparationQuotient.mk W : GraphonSpaceI) :=
  TauCeti.DenseGraphLimits.isDissociated_mixtureExchangeableLaw_iff P

/-- **The Diaconis–Janson summit**: `graphonMixtureLawEquiv` is the transport of the mixture map
along the finite ↔ infinite extension. -/
theorem graphonMixtureLawEquiv_apply (P : ProbabilityMeasure GraphonSpaceI) :
    graphonMixtureLawEquiv P = exchangeableGraphLawEquivInfinite (mixtureExchangeableLaw P) :=
  TauCeti.DenseGraphLimits.graphonMixtureLawEquiv_apply P

theorem graphonMixtureLawEquiv_dirac (W : Graphon I (volume : Measure I)) :
    graphonMixtureLawEquiv (diracProba (SeparationQuotient.mk W : GraphonSpaceI)) =
      exchangeableGraphLawEquivInfinite (sampleExchangeableLaw W) :=
  TauCeti.DenseGraphLimits.graphonMixtureLawEquiv_dirac W

/-- **The general mixture-coordinate law**, for every mixing measure. -/
theorem graphonMixtureLawEquiv_upperMass (P : ProbabilityMeasure GraphonSpaceI) {k : ℕ}
    (F : SimpleGraph (Fin k)) [DecidableRel F.Adj] :
    (exchangeableGraphLawEquivInfinite.symm (graphonMixtureLawEquiv P)).upperMass F =
      ∫ x, homDensityOnSpace F x ∂(P : Measure GraphonSpaceI) :=
  TauCeti.DenseGraphLimits.graphonMixtureLawEquiv_upperMass P F

/-- The integral form of the summit: every infinite exchangeable graph law is, for exactly one
mixing measure, the mixture of the joint sampling laws. -/
theorem InfiniteExchangeableGraphLaw.existsUnique_bind_infiniteSampleLawOnSpace
    (L : InfiniteExchangeableGraphLaw) :
    ∃! P : ProbabilityMeasure GraphonSpaceI,
      (P : Measure GraphonSpaceI).bind infiniteSampleLawOnSpace = L.law :=
  TauCeti.DenseGraphLimits.InfiniteExchangeableGraphLaw.existsUnique_bind_infiniteSampleLawOnSpace L

/-! ### The cross-roadmap boundary -/

/-- **The law-level interface** with the Exchangeability roadmap's array API: exchangeable graph
laws are the laws of symmetric, irreflexive, jointly exchangeable Boolean arrays, through the
adjacency array. -/
theorem graphLawArrayLawEquiv_apply_coe (L : InfiniteExchangeableGraphLaw) :
    (graphLawArrayLawEquiv L : Measure (ℕ × ℕ → Bool)) = arrayLaw L.law :=
  TauCeti.DenseGraphLimits.graphLawArrayLawEquiv_apply_coe L

/-- **Dissociation is joint dissociation** of the adjacency array. -/
theorem isDissociated_iff_jointlyDissociated (L : InfiniteExchangeableGraphLaw) :
    (exchangeableGraphLawEquivInfinite.symm L).IsDissociated ↔
      TauCeti.Probability.JointlyDissociated (arrayLaw L.law) fun p x => x p :=
  TauCeti.DenseGraphLimits.isDissociated_iff_jointlyDissociated L

/-- **Dissociation is ergodicity** of the diagonal finitary-permutation action on the adjacency
array: the two-step composition through the array API. -/
theorem isDissociated_iff_ergodicSMul (L : InfiniteExchangeableGraphLaw) :
    (exchangeableGraphLawEquivInfinite.symm L).IsDissociated ↔
      ErgodicSMul FinitaryPerm (ℕ × ℕ → Bool) (arrayLaw L.law) :=
  (TauCeti.DenseGraphLimits.isDissociated_iff_jointlyDissociated L).trans
    (TauCeti.Probability.jointlyDissociated_iff_ergodicSMul
      (jointlyExchangeable_arrayLaw L.exchangeable))

/-- **Dissociation is extremality** among the jointly exchangeable array laws. -/
theorem isDissociated_iff_arrayLaw_mem_extremePoints (L : InfiniteExchangeableGraphLaw) :
    (exchangeableGraphLawEquivInfinite.symm L).IsDissociated ↔
      arrayLaw L.law ∈ Set.extremePoints ℝ≥0∞
        (TauCeti.Probability.jointlyExchangeableProbabilityMeasuresOnSymmetricArraysWithDiag
          Bool false) :=
  TauCeti.DenseGraphLimits.isDissociated_iff_arrayLaw_mem_extremePoints L

/-- **The compatibility the generic Aldous–Hoover theorem owes**: every infinite exchangeable graph
law has a joint coding of its adjacency array, and the mixing measure of the graphon-mixture
representation is the law of the graphon classes obtained by freezing the coding's global
variable. -/
theorem InfiniteExchangeableGraphLaw.exists_jointCoding_mixingMeasure
    (L : InfiniteExchangeableGraphLaw) :
    ∃ (f : I × I × I × I → Bool) (hf : Measurable f),
      (TauCeti.Probability.AldousHoover.noiseMeasure Unit (Sym2 ℕ)).map
          (fun u p => TauCeti.Probability.AldousHoover.jointArray f p u) = arrayLaw L.law ∧
      graphonMixtureLawEquiv.symm L =
        ProbabilityMeasure.map (⟨volume, inferInstance⟩ : ProbabilityMeasure I) fun t =>
          (SeparationQuotient.mk
            (codingGraphon (fun q => f (t, q)) (hf.comp measurable_prodMk_left)) :
              GraphonSpaceI) :=
  TauCeti.DenseGraphLimits.InfiniteExchangeableGraphLaw.exists_jointCoding_mixingMeasure L

/-! ## Layer 9c: sampling convergence -/

omit [IsProbabilityMeasure μ] in
/-- **The exposure source**: `n` independent vertex coordinates, each a `μ`-position with a padded
row of `n` independent uniform coins. -/
theorem exposureMeasure_def (n : ℕ) :
    exposureMeasure μ n =
      Measure.pi fun _ : Fin n =>
        μ.prod (Measure.pi fun _ : Fin n => TauCeti.Probability.uniformMeasure 0 1) :=
  TauCeti.DenseGraphLimits.exposureMeasure_def μ n

/-- **The exposed sample** reads each pair's coin from row `max i j`, column `min i j`. -/
theorem exposedSample_adj (W : Graphon Ω μ) {n : ℕ} (x : Fin n → Ω × (Fin n → ℝ)) (i j : Fin n) :
    (exposedSample W x).Adj i j ↔ i ≠ j ∧ (x (max i j)).2 (min i j) < W (x i).1 (x j).1 :=
  TauCeti.DenseGraphLimits.exposedSample_adj W x i j

/-- **The law identification**: the exposure represents `G(n, W)`. -/
theorem map_exposedSample (W : Graphon Ω μ) (n : ℕ) :
    (exposureMeasure μ n).map (exposedSample W) = sampleGraph W n :=
  TauCeti.DenseGraphLimits.map_exposedSample W n

/-- **The oscillation bound** `≤ q/n` on the ordinary hom density. -/
theorem abs_homDensityFin_exposedSample_update_le {V : Type*} [Fintype V] (F : SimpleGraph V)
    (W : Graphon Ω μ) {n : ℕ} (x : Fin n → Ω × (Fin n → ℝ)) (i : Fin n) (b : Ω × (Fin n → ℝ)) :
    |homDensityFin F (exposedSample W (Function.update x i b)) -
        homDensityFin F (exposedSample W x)| ≤ (Fintype.card V : ℝ) / n :=
  TauCeti.DenseGraphLimits.abs_homDensityFin_exposedSample_update_le F W x i b

/-- **McDiarmid concentration** `≤ 2 exp(-ε²n/(2q²))` under `2q² ≤ εn`. -/
theorem sampleGraph_homDensityFin_concentration {V : Type*} [Fintype V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (W : Graphon Ω μ) {n : ℕ} {ε : ℝ} (hε : 0 < ε)
    (hn : 2 * (Fintype.card V : ℝ) ^ 2 ≤ ε * n) :
    ((sampleGraph W n) {G | ε ≤ |homDensityFin F G - homDensity F W|}).toReal
      ≤ 2 * Real.exp (-(ε ^ 2 * n) / (2 * (Fintype.card V : ℝ) ^ 2)) :=
  TauCeti.DenseGraphLimits.sampleGraph_homDensityFin_concentration F W hε hn

/-- **Tail summability**, what Borel–Cantelli consumes. -/
theorem tsum_sampleGraph_homDensityFin_tail_ne_top {V : Type*} [Fintype V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (W : Graphon Ω μ) {ε : ℝ} (hε : 0 < ε) :
    (∑' n : ℕ, (sampleGraph W (n + 1)) {G | ε ≤ |homDensityFin F G - homDensity F W|}) ≠ ⊤ :=
  SimpleGraph.tsum_sampleGraph_homDensityFin_tail_ne_top F W hε

/-- **Convergence in probability** (the second sampling lemma), on the marginals. -/
theorem sampleGraph_cutDist_tendsto_inProbability (W : Graphon Ω μ) {ε : ℝ} (hε : 0 < ε) :
    Tendsto (fun n => ((sampleGraph W n) {G | ε ≤ cutDist (finiteGraphGraphon G) W}).toReal)
      atTop (𝓝 0) :=
  TauCeti.DenseGraphLimits.sampleGraph_cutDist_tendsto_inProbability W hε

/-- **The `TendstoInMeasure` packaging** on the joint space, for the canonical carrier. -/
theorem infiniteSampleLaw_tendstoInMeasure_cutDist (W : Graphon I (volume : Measure I)) :
    TendstoInMeasure (infiniteSampleLaw W)
      (fun n G => (SeparationQuotient.mk
        (finiteGraphGraphon (G.restrictFin (n + 1))) : GraphonSpaceI))
      atTop (fun _ => (SeparationQuotient.mk W : GraphonSpaceI)) :=
  TauCeti.DenseGraphLimits.infiniteSampleLaw_tendstoInMeasure_cutDist W

/-- **Almost-sure convergence** on the joint space. -/
theorem infiniteSampleLaw_ae_tendsto_cutDist (W : Graphon Ω μ) :
    ∀ᵐ G ∂infiniteSampleLaw W,
      Tendsto (fun n => cutDist (finiteGraphGraphon (G.restrictFin n)) W) atTop (𝓝 0) :=
  TauCeti.DenseGraphLimits.infiniteSampleLaw_ae_tendsto_cutDist W

end TauCetiRoadmap.DenseGraphLimits
