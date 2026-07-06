import Mathlib

/-!
# Dense graph limits and graphons: suggested signatures

**`README.md` is the definitive roadmap document** — its conventions, layer plan, consumed-Mathlib
inventory, acceptance gates, provenance, and references are the specification. This file is **not**
the roadmap and is **not exhaustive**: it records suggested Lean `sorry`-forms (allowed in this
human-owned roadmap library) for *particular* milestones, so contributors and reviewers converge on
names and signatures; discharging every statement here neither finishes a layer nor the roadmap. The
pinned choices: the cut norm acts on *kernels* (so a difference `U - W` is well-typed), `cutDist` is
**coupling-primary and
cross-carrier**, and that the constant-graphon / sampling targets share the `unitInterval`
convention with Mathlib's `SimpleGraph.binomialRandom`. The Layer-6a separation forward is
**cross-carrier** with minimal hypotheses (same-carrier a corollary), the converse pinned both
same-carrier and cross-carrier (with the assembled iff); all over `SimpleGraph (Fin n)`
representatives. The Layer-2 `stepGraphon` / `stepGraphonAvg`, the analytic `graphonPartitionEnergy`
(block-average based) with the L²-Pythagoras `graphonPartitionEnergy_increment`, `GraphonSpaceI` + its
`MetricSpace` instance, the descent `homDensityOnSpace`, and the Layer-9 injective density
`injHomDensity` (normalized by the falling factorial `(n)_k = Nat.descFactorial`, **not** `Nat.choose`)
are pinned here too — as are the endpoint milestones: Frieze–Kannan weak regularity,
compactness/completeness of `GraphonSpaceI`, the coupling↔map `cutDistPullback`, the Layer-6b
convergence equivalence, finite-graph compatibility (`finiteGraphGraphon`), and quotient-level
separation. The Layer-8 representability targets — injective-label `LabeledGraph` / `LabeledGraph.glue`,
the graph parameter `GraphParam` with `IsIsoInvariant`, the finite `connectionMatrix` and
`IsReflectionPositive` (finite principal blocks PSD), `IsMultiplicative` / `IsNormalized`, and
`lovasz_szegedy_representability` (the five-condition iff over the canonical `(I, volume)` carrier) —
are pinned here too.

Objects whose precise Lean shape would force a premature API choice — the weak-regularity
`Finpartition` adapter and the exact mod-null transport bundle — are described in `README.md` instead.
(An `IsCoupling` structure/class is deliberately
avoided: couplings aren't canonical, so a typeclass would pick an arbitrary one.)
-/

noncomputable section

open MeasureTheory
open scoped unitInterval

namespace TauCetiRoadmap.DenseGraphLimits

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]

/-- **Layer 1.** A symmetric, measurable, bounded `ℝ`-kernel: the additive group / `ℝ`-module that
carries differences, so the cut norm has something to act on. -/
structure SymmKernel (Ω : Type*) [MeasurableSpace Ω] (_μ : Measure Ω) where
  toFun : Ω → Ω → ℝ
  symm' : ∀ x y, toFun x y = toFun y x
  meas' : Measurable (Function.uncurry toFun)
  bdd' : ∃ C, ∀ x y, |toFun x y| ≤ C

/-- So that `U - W` and `c • W` are kernels (the objects the cut norm acts on). -/
instance : AddCommGroup (SymmKernel Ω μ) := sorry
instance : Module ℝ (SymmKernel Ω μ) := sorry

/-- **Layer 1.** A graphon: a `[0,1]`-valued symmetric kernel. -/
structure Graphon (Ω : Type*) [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    extends SymmKernel Ω μ where
  mem01' : ∀ x y, toFun x y ∈ Set.Icc (0 : ℝ) 1

/-- **Layer 1.** Cut norm — on kernels (hence applies to `U - W`). -/
def cutNorm (K : SymmKernel Ω μ) : ℝ := sorry

/-- **Layer 1 (set form).** The textbook set/rectangle form: the `sup` over measurable `S, T` of
`|∫_{S×T} K|`. This is the concrete definition that the abstract `cutNorm` is pinned against
(`cutNorm_eq_cutNormSet`) and the bridge to Mathlib's rectangle/energy-based regularity. -/
def cutNormSet (K : SymmKernel Ω μ) : ℝ :=
  ⨆ (S : Set Ω) (_ : MeasurableSet S) (T : Set Ω) (_ : MeasurableSet T),
    |∫ p in S ×ˢ T, K.toFun p.1 p.2 ∂(μ.prod μ)|

/-- **Layer 1.** The abstract cut norm agrees with the set form. -/
theorem cutNorm_eq_cutNormSet (K : SymmKernel Ω μ) : cutNorm μ K = cutNormSet μ K := sorry

/-- **Layer 1 (signed form).** The `[-1,1]` test-function form: the `sup` over measurable
`u, v : Ω → [-1,1]` of `|∫∫ u(x) v(y) K(x,y)|`. Related to `cutNorm` by the standard factor
sandwich (`cutNorm_le_cutNormSigned`, `cutNormSigned_le_four_mul_cutNorm`). -/
def cutNormSigned (K : SymmKernel Ω μ) : ℝ :=
  ⨆ (u : Ω → ℝ) (_ : Measurable u) (_ : ∀ x, u x ∈ Set.Icc (-1 : ℝ) 1)
    (v : Ω → ℝ) (_ : Measurable v) (_ : ∀ y, v y ∈ Set.Icc (-1 : ℝ) 1),
    |∫ p, u p.1 * v p.2 * K.toFun p.1 p.2 ∂(μ.prod μ)|

/-- **Layer 1.** Lower side of the factor sandwich. -/
theorem cutNorm_le_cutNormSigned (K : SymmKernel Ω μ) : cutNorm μ K ≤ cutNormSigned μ K := sorry

/-- **Layer 1.** Upper side of the factor sandwich (the standard factor `4`). -/
theorem cutNormSigned_le_four_mul_cutNorm (K : SymmKernel Ω μ) :
    cutNormSigned μ K ≤ 4 * cutNorm μ K := sorry

/-- **Layer 1 (seminorm laws).** `cutNorm` is nonnegative. -/
theorem cutNorm_nonneg (K : SymmKernel Ω μ) : 0 ≤ cutNorm μ K := sorry

/-- **Layer 1.** `cutNorm` of the zero kernel is zero. -/
theorem cutNorm_zero : cutNorm μ (0 : SymmKernel Ω μ) = 0 := sorry

/-- **Layer 1.** `cutNorm` is even: `‖-K‖□ = ‖K‖□`. -/
theorem cutNorm_neg (K : SymmKernel Ω μ) : cutNorm μ (-K) = cutNorm μ K := sorry

/-- **Layer 1.** `cutNorm` subadditivity (the seminorm triangle inequality). -/
theorem cutNorm_add_le (K L : SymmKernel Ω μ) :
    cutNorm μ (K + L) ≤ cutNorm μ K + cutNorm μ L := sorry

/-- **Layer 1.** `cutNorm` is absolutely homogeneous. -/
theorem cutNorm_smul (c : ℝ) (K : SymmKernel Ω μ) :
    cutNorm μ (c • K) = |c| * cutNorm μ K := sorry

/-- **Layer 1.** Homomorphism density `t(F, W)`, edges via `Sym2`. -/
def homDensity {V : Type*} [Fintype V] [DecidableEq V] (F : SimpleGraph V) [DecidableRel F.Adj]
    (W : Graphon Ω μ) : ℝ := sorry

/-- **Layer 1 (constant graphon).** The constant graphon with value `p : I` (one convention, shared
with `G(V,p)`). -/
def Graphon.const (p : I) : Graphon Ω μ := sorry

/-- **Layer 1 acceptance (Erdős–Rényi value).** `t(F, W_p) = p^{e(F)}`. -/
theorem homDensity_const {V : Type*} [Fintype V] [DecidableEq V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (p : I) :
    homDensity μ F (Graphon.const μ p) = (p : ℝ) ^ F.edgeFinset.card := sorry

section CrossCarrier
variable {Ω₁ Ω₂ : Type*} [MeasurableSpace Ω₁] [MeasurableSpace Ω₂]
  (μ₁ : Measure Ω₁) (μ₂ : Measure Ω₂) [IsProbabilityMeasure μ₁] [IsProbabilityMeasure μ₂]

/-- **Layer 1.** A coupling of `μ₁` and `μ₂`: a measure on the product with the right marginals. -/
def IsCoupling (π : Measure (Ω₁ × Ω₂)) : Prop :=
  π.map Prod.fst = μ₁ ∧ π.map Prod.snd = μ₂

/-- **Layer 1.** The product (independent) coupling — witnesses that the coupling class over which
`cutDist` takes its infimum is nonempty. -/
theorem isCoupling_prod : IsCoupling μ₁ μ₂ (μ₁.prod μ₂) := sorry

/-- **Layer 1.** The **overlaid difference kernel**: the difference `U − W` transported to the
coupled space along the coupling `π`. This is the kernel whose cut norm controls the density gap
(`counting_lemma_coupling`), hence the object `cutDist` minimizes over couplings — not a neutral
overlay of the two graphons. -/
def overlayDiff (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) (π : Measure (Ω₁ × Ω₂))
    (hπ : IsCoupling μ₁ μ₂ π) : SymmKernel (Ω₁ × Ω₂) π := sorry

/-- **Layer 1 (coupling-primary, cross-carrier).** `cutDist` is the infimum over couplings of the
cut norm of the overlaid difference. -/
def cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : ℝ := sorry

/-- **Layer 1.** The gluing-lemma triangle inequality (so `cutDist` is a pseudometric). -/
theorem cutDist_triangle {Ω₃ : Type*} [MeasurableSpace Ω₃] (μ₃ : Measure Ω₃)
    [IsProbabilityMeasure μ₃] [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂] [StandardBorelSpace Ω₃]
    (U : Graphon Ω₁ μ₁) (V : Graphon Ω₂ μ₂) (W : Graphon Ω₃ μ₃) :
    cutDist μ₁ μ₃ U W ≤ cutDist μ₁ μ₂ U V + cutDist μ₂ μ₃ V W := sorry

/-- **Layer 1.** `cutDist` is nonnegative. -/
theorem cutDist_nonneg (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : 0 ≤ cutDist μ₁ μ₂ U W := sorry

/-- **Layer 1.** `cutDist` is symmetric (a coupling of `μ₁, μ₂` swaps to one of `μ₂, μ₁`). -/
theorem cutDist_comm (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) :
    cutDist μ₁ μ₂ U W = cutDist μ₂ μ₁ W U := sorry

/-- **Layer 5 (map form of cut distance).** The classical measure-preserving-map cut distance: the
infimum, over measure-preserving maps from the canonical atomless standard carrier `(I, volume)` to
each of `(Ω₁, μ₁)` and `(Ω₂, μ₂)`, of the cut norm of the pulled-back difference. -/
def cutDistPullback (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : ℝ := sorry

/-- **Layer 5 (coupling ↔ map).** The coupling-primary `cutDist` agrees with the map form, over
atomless standard Borel — the central design equivalence. -/
theorem cutDist_eq_cutDistPullback [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂]
    [NoAtoms μ₁] [NoAtoms μ₂] (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) :
    cutDist μ₁ μ₂ U W = cutDistPullback μ₁ μ₂ U W := sorry

/-- **Layer 1.** A coupling of probability measures is itself a probability measure — documents why
the `[IsProbabilityMeasure π]` hypothesis below is harmless (the marginals are probability measures). -/
theorem isProbabilityMeasure_of_isCoupling (π : Measure (Ω₁ × Ω₂)) (hπ : IsCoupling μ₁ μ₂ π) :
    IsProbabilityMeasure π := sorry

/-- **Layer 2 (coupling-form counting lemma).** For any coupling `π`, the density gap is controlled by
the cut norm of the overlaid difference on the coupled space — the engine for the cross-carrier
forward separation. -/
theorem counting_lemma_coupling {V : Type*} [Fintype V] [DecidableEq V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)
    (π : Measure (Ω₁ × Ω₂)) [IsProbabilityMeasure π] (hπ : IsCoupling μ₁ μ₂ π) :
    |homDensity μ₁ F U - homDensity μ₂ F W|
      ≤ (F.edgeFinset.card : ℝ) * cutNorm π (overlayDiff μ₁ μ₂ U W π hπ) := sorry

/-- **Layer 6a forward (cross-carrier, counting).** `cutDist = 0` ⇒ all homomorphism densities agree,
**cross-carrier** and with **minimal hypotheses** (no standard-Borel / atomless — the easy counting
direction: take the infimum of `counting_lemma_coupling` over couplings). Finite graphs are quantified
over the representatives `SimpleGraph (Fin n)`. -/
theorem forall_homDensity_eq_of_cutDist_eq_zero (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)
    (h : cutDist μ₁ μ₂ U W = 0) :
    ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity μ₁ F U = homDensity μ₂ F W := sorry

end CrossCarrier

/-- **Layer 1.** Same-carrier specialization of the cross-carrier `cutDist`. -/
def cutDistSame (U W : Graphon Ω μ) : ℝ := cutDist μ μ U W

/-- **Layer 1.** `cutDist` of a graphon with itself is zero (reflexivity of the pseudometric). -/
theorem cutDist_self (U : Graphon Ω μ) : cutDist μ μ U U = 0 := sorry

/-- **Layer 1.** The same-carrier specialization. -/
theorem cutDistSame_self (U : Graphon Ω μ) : cutDistSame μ U U = 0 := cutDist_self μ U

/-- **Layer 1.** The first quotient object is fixed-carrier: graphons identified when `cutDist = 0`.
(`GraphonSpaceI`, the unit-interval version, is the canonical public compact space; cross-carrier
equality is expressed by `cutDist U W = 0`, not by a universe-bundled quotient over all carriers.) -/
def graphonSetoid [StandardBorelSpace Ω] : Setoid (Graphon Ω μ) where
  r U W := cutDistSame μ U W = 0
  iseqv := sorry

/-- **Layer 1.** The fixed-carrier graphon space — over a standard Borel carrier, where the
gluing-lemma triangle makes `cutDist = 0` a genuine equivalence. -/
def GraphonSpace (Ω : Type*) [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    [StandardBorelSpace Ω] : Type _ :=
  Quotient (graphonSetoid μ)

/-- **Layer 1.** The canonical public graphon space: the fixed-carrier quotient over `(I, volume)` —
the compact space cross-carrier graphons transport into (referenced throughout the roadmap). An
`abbrev` so the metric/topology instances on `GraphonSpace I volume` resolve through it. -/
abbrev GraphonSpaceI : Type _ := GraphonSpace I (volume : Measure I)

/-- **Layer 1.** `cutDist` descends to a genuine metric on `GraphonSpace` — needed even to *state*
Layer-4 compactness and the Layer-6b convergence equivalence. -/
instance [StandardBorelSpace Ω] : MetricSpace (GraphonSpace Ω μ) := sorry

/-- **Layer 1.** The metric on `GraphonSpace` computes as `cutDist` on representatives — pins how
users actually calculate with the quotient metric. -/
theorem dist_graphonSpace_mk_mk [StandardBorelSpace Ω] (U W : Graphon Ω μ) :
    @dist (GraphonSpace Ω μ) _ (Quotient.mk (graphonSetoid μ) U) (Quotient.mk (graphonSetoid μ) W)
      = cutDistSame μ U W := sorry

/-- **Layer 4 (Lovász–Szegedy compactness).** The canonical graphon space is compact. -/
instance : CompactSpace GraphonSpaceI := sorry

/-- **Layer 4.** …and complete (a compact metric space is complete, via the `CompactSpace` instance). -/
instance : CompleteSpace GraphonSpaceI := inferInstance

/-- **Layer 2 (forward counting lemma).** The argument to `cutNorm` is the *kernel* `U - W`; the
prefactor is `(F.edgeFinset.card : ℝ)` (prose `e(F)`). -/
theorem counting_lemma {V : Type*} [Fintype V] [DecidableEq V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (U W : Graphon Ω μ) :
    |homDensity μ F U - homDensity μ F W|
      ≤ (F.edgeFinset.card : ℝ) * cutNorm μ (U.toSymmKernel - W.toSymmKernel) := sorry

/-- **Layer 2 (step graphon).** A graphon constant on the rectangles `Pᵢ × Pⱼ` of a measurable
finite partition of the carrier — the anchor for the Frieze–Kannan weak-regularity output and the
`Finpartition` bridge. A minimal placeholder; the full `Finpartition` adapter is described in
`README.md`. -/
def stepGraphon (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p)
    (val : {p // p ∈ P.parts} → {q // q ∈ P.parts} → I)
    (hsymm : ∀ p q, val p q = val q p) : Graphon Ω μ := sorry

/-- **Layer 2.** `stepGraphon` is constant on each rectangle `p × q`: for `x ∈ p`, `y ∈ q` its value
is `val p q`. Exposes the constant-on-rectangles API the bare constructor does not. -/
theorem stepGraphon_apply (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p)
    (val : {p // p ∈ P.parts} → {q // q ∈ P.parts} → I) (hsymm : ∀ p q, val p q = val q p)
    {p q : {p // p ∈ P.parts}} {x y : Ω} (hx : x ∈ (p : Set Ω)) (hy : y ∈ (q : Set Ω)) :
    (stepGraphon μ P hP val hsymm).toFun x y = (val p q : ℝ) := sorry

/-- **Layer 2 (averaged step graphon).** The block-averaged step graphon: constant on each rectangle
`Pᵢ × Pⱼ` with value the block average (mean) of `W` there — the actual Frieze–Kannan weak-regularity
output. Later identified with the conditional expectation `E[W | P⊗P]` (Layer 3). -/
def stepGraphonAvg (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p)
    (W : Graphon Ω μ) : Graphon Ω μ := sorry

/-- **Layer 2.** `stepGraphonAvg` is the block average of `W`: on `x ∈ p`, `y ∈ q` its value is the
mean of `W` over the rectangle `p × q` (w.r.t. `μ ⊗ μ`). -/
theorem stepGraphonAvg_apply (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p)
    (W : Graphon Ω μ) {p q : {p // p ∈ P.parts}} {x y : Ω}
    (hx : x ∈ (p : Set Ω)) (hy : y ∈ (q : Set Ω)) :
    (stepGraphonAvg μ P hP W).toFun x y
      = ⨍ z in ((p : Set Ω) ×ˢ (q : Set Ω)), W.toFun z.1 z.2 ∂(μ.prod μ) := sorry

/-- **Layer 2 (graphon partition energy).** The `L²(μ⊗μ)` norm² of the **block-average step graphon**
`stepGraphonAvg` (finite block averages over measurable rectangles; see `graphonPartitionEnergy_eq`) —
**distinct from** Mathlib's finite `Finpartition.energy` (the finite edge-density energy, a proof
template only). The energy increment is stated in this block-average language; Layer 3 later relates
it to the general AE / conditional-expectation interface. Body opaque (discharged in `TauCeti`). -/
def graphonPartitionEnergy (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p)
    (W : Graphon Ω μ) : ℝ := sorry

/-- **Layer 1/2.** The `L²(μ⊗μ)` norm squared of a kernel. -/
def l2sq (K : SymmKernel Ω μ) : ℝ := ∫ p, (K.toFun p.1 p.2) ^ 2 ∂(μ.prod μ)

omit [IsProbabilityMeasure μ] in
/-- **Layer 1/2.** `l2sq` is nonnegative (integral of a square). -/
theorem l2sq_nonneg (K : SymmKernel Ω μ) : 0 ≤ l2sq μ K :=
  integral_nonneg fun _ => sq_nonneg _

/-- **Layer 2.** The partition energy is the `L²` norm² of the block-average step graphon
`stepGraphonAvg` — pins the otherwise-opaque `graphonPartitionEnergy` to a concrete object (later
`= ‖E[W|P⊗P]‖²` once the conditional-expectation identification is available, Layer 3). -/
theorem graphonPartitionEnergy_eq (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p)
    (W : Graphon Ω μ) :
    graphonPartitionEnergy μ P hP W = l2sq μ (stepGraphonAvg μ P hP W).toSymmKernel := sorry

/-- **Layer 2 (energy increment — L²-Pythagoras).** Under refinement (`Q ≤ P`, so `Q` finer than `P`)
the energy increases by exactly the `L²` norm² of the difference of the two block-average step
graphons (`stepGraphonAvg μ Q … − stepGraphonAvg μ P …`). This is the quantitative Frieze–Kannan
driver; `graphonPartitionEnergy_mono` is its `≥ 0` corollary. -/
theorem graphonPartitionEnergy_increment (P Q : Finpartition (⊤ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (hQ : ∀ q ∈ Q.parts, MeasurableSet q)
    (href : Q ≤ P) (W : Graphon Ω μ) :
    graphonPartitionEnergy μ Q hQ W
      = graphonPartitionEnergy μ P hP W
        + l2sq μ ((stepGraphonAvg μ Q hQ W).toSymmKernel - (stepGraphonAvg μ P hP W).toSymmKernel) :=
  sorry

/-- **Layer 2.** Energy is monotone under refinement — a corollary of the Pythagoras increment (the
added `L²` term is `≥ 0`). (Mathlib order: `P ≤ Q` ⇔ `P` refines `Q`, so `Q ≤ P` is "`Q` finer".) -/
theorem graphonPartitionEnergy_mono (P Q : Finpartition (⊤ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (hQ : ∀ q ∈ Q.parts, MeasurableSet q)
    (href : Q ≤ P) (W : Graphon Ω μ) :
    graphonPartitionEnergy μ P hP W ≤ graphonPartitionEnergy μ Q hQ W := by
  rw [graphonPartitionEnergy_increment μ P Q hP hQ href W]
  linarith [l2sq_nonneg μ ((stepGraphonAvg μ Q hQ W).toSymmKernel - (stepGraphonAvg μ P hP W).toSymmKernel)]

/-- **Layer 2.** The energy is nonnegative — a corollary of `graphonPartitionEnergy_eq` + `l2sq_nonneg`. -/
theorem graphonPartitionEnergy_nonneg (P : Finpartition (⊤ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (W : Graphon Ω μ) :
    0 ≤ graphonPartitionEnergy μ P hP W := by
  rw [graphonPartitionEnergy_eq μ P hP W]; exact l2sq_nonneg μ _

/-- **Layer 2.** The energy is bounded above by `1` (`W` is `[0,1]`-valued). With `_mono` / `_nonneg`
this is the bounded monotone potential the Frieze–Kannan iteration runs on. -/
theorem graphonPartitionEnergy_le_one (P : Finpartition (⊤ : Set Ω))
    (hP : ∀ p ∈ P.parts, MeasurableSet p) (W : Graphon Ω μ) :
    graphonPartitionEnergy μ P hP W ≤ 1 := sorry

/-- **Layer 2 (Frieze–Kannan weak regularity).** For every `ε > 0` there is a measurable finite
partition of complexity `≤ 4^{⌈1/ε²⌉}` whose block-average step graphon approximates `W` to within
`ε` in cut norm. (The exact cardinality shape may be adjusted to the `Finpartition` adapter.) -/
theorem weak_regularity_frieze_kannan (W : Graphon Ω μ) {ε : ℝ} (hε : 0 < ε) :
    ∃ (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p),
      P.parts.card ≤ 4 ^ Nat.ceil (1 / ε ^ 2) ∧
      cutNorm μ (W.toSymmKernel - (stepGraphonAvg μ P hP W).toSymmKernel) ≤ ε := sorry

/-- **Layer 2 (descent of `t(F, ·)`).** `homDensity` descends to `GraphonSpace` (well-defined by the
forward separation `cutDist = 0 ⇒ equal densities`). Fin-indexed, matching the Layer-6a
representatives (an arbitrary carrier would need a generic graph-transport API not pinned here). -/
def homDensityOnSpace [StandardBorelSpace Ω] (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj] :
    GraphonSpace Ω μ → ℝ :=
  Quotient.lift (fun W => homDensity μ F W) fun U W h => by
    have h0 : cutDist μ μ U W = 0 := h
    exact forall_homDensity_eq_of_cutDist_eq_zero μ μ U W h0 n F

/-- **Layer 2.** The descent computes `homDensity` on representatives (by `Quotient.lift`, `rfl`). -/
theorem homDensityOnSpace_mk [StandardBorelSpace Ω] (n : ℕ) (F : SimpleGraph (Fin n))
    [DecidableRel F.Adj] (W : Graphon Ω μ) :
    homDensityOnSpace μ n F (Quotient.mk (graphonSetoid μ) W) = homDensity μ F W := rfl

/-- **Layer 2/6a.** Each descended density `t(F, ·)` is continuous on `GraphonSpaceI` — the forward
direction of the convergence equivalence and useful public API. -/
theorem continuous_homDensityOnSpace (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj] :
    Continuous (homDensityOnSpace (volume : Measure I) n F) := sorry

/-- **Layer 6a (quotient-level separation).** Two points of `GraphonSpaceI` are equal iff all
homomorphism densities agree — the public-facing form of the separation theorem. -/
theorem graphonSpace_ext_homDensity (U W : GraphonSpaceI) :
    U = W ↔ ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensityOnSpace (volume : Measure I) n F U = homDensityOnSpace (volume : Measure I) n F W := sorry

/-- **Layer 6b (convergence equivalence — the culmination).** On `GraphonSpaceI`, `δ□`-convergence is
equivalent to convergence of every homomorphism density. -/
theorem tendsto_graphonSpace_iff_forall_homDensity (Ws : ℕ → GraphonSpaceI) (W : GraphonSpaceI) :
    Filter.Tendsto Ws Filter.atTop (nhds W) ↔
      ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
        Filter.Tendsto (fun k => homDensityOnSpace (volume : Measure I) n F (Ws k))
          Filter.atTop (nhds (homDensityOnSpace (volume : Measure I) n F W)) := sorry

/-- **Layer 3 (AE bridge).** The AE / `AEEqFun` view: a graphon as an a.e.-class kernel on `μ ⊗ μ`. -/
def toAEEqFun (W : Graphon Ω μ) : (Ω × Ω) →ₘ[μ.prod μ] ℝ := sorry

/-- **Layer 3.** `homDensity` factors through the a.e. class. -/
theorem homDensity_congr_ae {V : Type*} [Fintype V] [DecidableEq V] (F : SimpleGraph V)
    [DecidableRel F.Adj] {U W : Graphon Ω μ} (h : toAEEqFun μ U = toAEEqFun μ W) :
    homDensity μ F U = homDensity μ F W := sorry

/-- **Layer 3.** `cutNorm` factors through the a.e. class of a kernel. -/
theorem cutNorm_congr_ae {K L : SymmKernel Ω μ}
    (h : ∀ᵐ p ∂(μ.prod μ), K.toFun p.1 p.2 = L.toFun p.1 p.2) : cutNorm μ K = cutNorm μ L := sorry

/-- **Layer 3.** a.e.-equal graphons are at `cutDist` zero. -/
theorem cutDist_eq_zero_of_aeEq {U W : Graphon Ω μ}
    (h : ∀ᵐ p ∂(μ.prod μ), U.toFun p.1 p.2 = W.toFun p.1 p.2) : cutDistSame μ U W = 0 := sorry

/-- **Layer 3 (reverse bridge — L⁰ → strict representative).** Every a.e. class on `μ ⊗ μ` that is
a.e. `[0,1]`-valued and a.e. symmetric is realized by a strict `Graphon` representative — the lossy
reverse of `toAEEqFun`, the measurable-selection fact needed to consume `AEEqFun`-native results. -/
theorem exists_graphon_repr [StandardBorelSpace Ω] (f : (Ω × Ω) →ₘ[μ.prod μ] ℝ)
    (hbdd : ∀ᵐ p ∂(μ.prod μ), f p ∈ Set.Icc (0 : ℝ) 1)
    (hsymm : ∀ᵐ p ∂(μ.prod μ), f p = f p.swap) :
    ∃ W : Graphon Ω μ, toAEEqFun μ W = f := sorry

/-- **Layer 5 prerequisite (mod-null transport).** A *mod-null measure-preserving equivalence* of an
atomless standard Borel probability space with `(I, volume)`: measure-preserving maps both ways that
are mutually inverse a.e. (Mathlib has the measurable equivalence; this is the m.p. refinement. The
precise bundled `MeasurePreservingModNullEquiv` is described in `README.md`.) -/
theorem exists_mpModNull_equiv_unitInterval [StandardBorelSpace Ω] [NoAtoms μ] :
    ∃ (f : Ω → I) (g : I → Ω),
      MeasurePreserving f μ volume ∧ MeasurePreserving g volume μ ∧
      (∀ᵐ x ∂μ, g (f x) = x) ∧ (∀ᵐ y ∂(volume : Measure I), f (g y) = y) := sorry

/-- **Layer 6a forward (same-carrier corollary).** The `cutDistSame` specialization of the
cross-carrier `forall_homDensity_eq_of_cutDist_eq_zero` (`cutDistSame μ = cutDist μ μ`). -/
theorem forall_homDensity_eq_of_cutDistSame_eq_zero (U W : Graphon Ω μ)
    (h : cutDistSame μ U W = 0) :
    ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity μ F U = homDensity μ F W := by
  simpa [cutDistSame] using forall_homDensity_eq_of_cutDist_eq_zero μ μ U W h

/-- **Layer 6a converse (inverse counting — the analytic summit).** All homomorphism densities agree
⇒ `cutDist = 0`, over atomless standard Borel (LNGL Thm 11.3, the genuinely hard self-contained core).
The full separation iff is this conjoined with the same-carrier forward
`forall_homDensity_eq_of_cutDistSame_eq_zero`. -/
theorem cutDist_eq_zero_of_forall_homDensity_eq [StandardBorelSpace Ω] [NoAtoms μ]
    (U W : Graphon Ω μ)
    (h : ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity μ F U = homDensity μ F W) :
    cutDistSame μ U W = 0 := sorry

section CrossCarrierSeparation
variable {Ω₁ Ω₂ : Type*} [MeasurableSpace Ω₁] [MeasurableSpace Ω₂]
  (μ₁ : Measure Ω₁) (μ₂ : Measure Ω₂) [IsProbabilityMeasure μ₁] [IsProbabilityMeasure μ₂]

/-- **Layer 6a converse (cross-carrier).** The inverse counting lemma in the coupling-primary form:
all homomorphism densities agree ⇒ `cutDist = 0`, over atomless standard Borel on both carriers
(route: transport both to `(I, volume)` via `exists_mpModNull_equiv_unitInterval`, then the
same-carrier converse). -/
theorem cutDist_eq_zero_of_forall_homDensity_eq_cross
    [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂] [NoAtoms μ₁] [NoAtoms μ₂]
    (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)
    (h : ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity μ₁ F U = homDensity μ₂ F W) :
    cutDist μ₁ μ₂ U W = 0 := sorry

/-- **Layer 6a (cross-carrier separation iff — the public statement).** Assembled from the
cross-carrier forward `forall_homDensity_eq_of_cutDist_eq_zero` and the converse above; the
same-carrier iff is its `cutDistSame` specialization. -/
theorem cutDist_eq_zero_iff_forall_homDensity_eq_cross
    [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂] [NoAtoms μ₁] [NoAtoms μ₂]
    (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) :
    cutDist μ₁ μ₂ U W = 0 ↔
      ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
        homDensity μ₁ F U = homDensity μ₂ F W :=
  ⟨forall_homDensity_eq_of_cutDist_eq_zero μ₁ μ₂ U W,
   cutDist_eq_zero_of_forall_homDensity_eq_cross μ₁ μ₂ U W⟩

end CrossCarrierSeparation

/-- **Layer 9 (sampling).** The `W`-random graph law `G(n, W)`. -/
def sampleGraph (W : Graphon Ω μ) (n : ℕ) : Measure (SimpleGraph (Fin n)) := sorry

/-- **Layer 9.** The sampling law is a probability measure. -/
instance sampleGraph_isProbabilityMeasure (W : Graphon Ω μ) (n : ℕ) :
    IsProbabilityMeasure (sampleGraph μ W n) := sorry

/-- **Layer 7/9 compatibility.** Sampling the constant-`p` graphon recovers Mathlib's `G(V, p)`
binomial random graph (same `unitInterval` parameter). -/
theorem sampleGraph_const (p : I) (n : ℕ) :
    sampleGraph μ (Graphon.const μ p) n = SimpleGraph.binomialRandom (Fin n) p := sorry

/-- **Layer 9 (finite-graph hom density).** `t(F, G) = hom(F,G) / m^{|V(F)|}` for a finite target
graph `G` on `Fin m`. Defined via `Nat.card` (no `Fintype`/decidability on the hom type or on `G`). -/
def homDensityFin {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ} (G : SimpleGraph (Fin m)) : ℝ :=
  (Nat.card (F →g G) : ℝ) / (m ^ Fintype.card V : ℝ)

/-- **Layer 9 (injective hom density `t₀`).** The *ordered injective* hom count over the **falling
factorial `(m)_k = m.descFactorial k`** (`k = |V(F)|`) — **not** `Nat.choose m k`, which would bias
the sampling estimator by `k!`. Via `Nat.card`; no decidability on the target graph `G`. -/
def injHomDensity {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ} (G : SimpleGraph (Fin m)) : ℝ :=
  (Nat.card {φ : F →g G // Function.Injective φ} : ℝ) / (m.descFactorial (Fintype.card V) : ℝ)

/-- **Layer 9 (hom vs injective closeness).** `|t(F,·) − t₀(F,·)| ≤ C(k,2)/m`, the bound the
convergence-via-sampling route needs. Requires `0 < m`. -/
theorem homDensityFin_sub_injHomDensity_le {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ}
    (G : SimpleGraph (Fin m)) (hm : 0 < m) :
    |homDensityFin F G - injHomDensity F G| ≤ ((Fintype.card V).choose 2 : ℝ) / (m : ℝ) := sorry

/-- **Layer 9 (unbiasedness anchor).** `E_{G(m,W)}[t₀(F, ·)] = t(F, W)` — the identity that pins the
`(m)_k` normalization (with `Nat.choose` it would read `k!·t(F,W)`). Needs `|V(F)| ≤ m` (else
`(m)_k = 0`); the `homDensity` RHS forces `[DecidableEq V] [DecidableRel F.Adj]` on `F`, **not** on
the integrated `G`. -/
theorem injHomDensity_integral_sampleGraph {V : Type*} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (W : Graphon Ω μ) {m : ℕ} (hkm : Fintype.card V ≤ m) :
    ∫ G, injHomDensity F G ∂(sampleGraph μ W m) = homDensity μ F W := sorry

/-- **Layer 1/7 (finite graph as a graphon).** The graphon of a finite graph `G` on `Fin m` — the
step graphon on the `m` equal subintervals of `(I, volume)` with `G`'s adjacency values. -/
def finiteGraphGraphon {m : ℕ} (G : SimpleGraph (Fin m)) : Graphon I (volume : Measure I) := sorry

/-- **Layer 7 (finite-graph compatibility — an acceptance gate).** `t(F, W_G) = hom(F,G)/m^{|V(F)|}`:
the graphon density recovers the finite hom density. Requires `0 < m` (the identity overclaims for
the empty target `m = 0`). -/
theorem homDensity_finiteGraphGraphon {V : Type*} [Fintype V] [DecidableEq V] (F : SimpleGraph V)
    [DecidableRel F.Adj] {m : ℕ} (hm : 0 < m) (G : SimpleGraph (Fin m)) :
    homDensity (volume : Measure I) F (finiteGraphGraphon G) = homDensityFin F G := sorry

/-- **Layer 8a (k-labeled graph).** A finite simple graph with an ordered `k`-tuple of *distinct*
labeled vertices (labels injective) — the objects of the gluing algebra behind connection matrices. -/
structure LabeledGraph (k : ℕ) where
  n : ℕ
  graph : SimpleGraph (Fin n)
  label : Fin k → Fin n
  label_injective : Function.Injective label

/-- **Layer 8a (gluing).** Glue two `k`-labeled graphs by identifying corresponding labeled vertices,
yielding a finite simple graph (the unlabeled result). -/
def LabeledGraph.glue {k : ℕ} (G₁ G₂ : LabeledGraph k) : Σ m, SimpleGraph (Fin m) := sorry

/-- **Layer 8 (graph parameter).** A real-valued parameter of finite simple graphs (indexed over
`Fin`-representatives); isomorphism invariance is imposed separately as `IsIsoInvariant`. -/
abbrev GraphParam := (n : ℕ) → SimpleGraph (Fin n) → ℝ

/-- **Layer 8 (isomorphism invariance).** `f` agrees on isomorphic graphs — the standing hypothesis
that makes `f` a genuine graph parameter rather than a labelling-sensitive function on `Fin n`. -/
def IsIsoInvariant (f : GraphParam) : Prop := sorry

/-- **Layer 8a (connection matrix).** For a finite family `A : ι → LabeledGraph k` of `k`-labeled
graphs, the `ι × ι` matrix with `(i, j)` entry `f (A i `glue` A j)` — a finite principal block of the
full connection matrix `M(f, k)`. Built here; connection matrices are not in Mathlib. -/
def connectionMatrix (f : GraphParam) {k : ℕ} {ι : Type*} [Fintype ι]
    (A : ι → LabeledGraph k) : Matrix ι ι ℝ := sorry

/-- **Layer 8a (reflection positivity).** `f` is reflection-positive when every finite connection
matrix is positive semidefinite — i.e. every finite principal block of each `M(f, k)` is PSD. Stated
over finite index families rather than as one infinite matrix. -/
def IsReflectionPositive (f : GraphParam) : Prop :=
  ∀ (k : ℕ) {ι : Type} [Fintype ι] (A : ι → LabeledGraph k), (connectionMatrix f A).PosSemidef

/-- **Layer 8 (multiplicativity).** `f(F₁ ⊔ F₂) = f(F₁) · f(F₂)` over disjoint unions. -/
def IsMultiplicative (f : GraphParam) : Prop := sorry

/-- **Layer 8 (normalization).** `f(K₁) = 1` on the one-vertex graph. -/
def IsNormalized (f : GraphParam) : Prop := sorry

/-- **Layer 8b (Lovász–Szegedy representability — LNGL Thm 5.54).** A graph parameter equals
`t(·, W)` for some graphon on the canonical carrier `(I, volume)` iff it is isomorphism-invariant,
multiplicative, normalized, reflection-positive, and `[0,1]`-bounded. Every graphon is representable
on `(I, volume)`, so the existential carrier collapses to the canonical one. Grounded on the
reflection-positivity development (8a) above — not a leap. -/
theorem lovasz_szegedy_representability (f : GraphParam) :
    (∃ W : Graphon I (volume : Measure I),
        ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
          f n F = homDensity (volume : Measure I) F W)
      ↔ IsIsoInvariant f ∧ IsMultiplicative f ∧ IsNormalized f ∧ IsReflectionPositive f
        ∧ (∀ (n : ℕ) (F : SimpleGraph (Fin n)), f n F ∈ Set.Icc (0 : ℝ) 1) := sorry

end TauCetiRoadmap.DenseGraphLimits
