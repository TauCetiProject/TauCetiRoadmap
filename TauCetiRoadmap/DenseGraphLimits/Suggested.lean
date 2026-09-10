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
convention with Mathlib's `SimpleGraph.binomialRandom`. The Layer-6a separation is **cross-carrier
and hypothesis-free in both directions** (forward via the coupling counting lemma; converse per
Janson, Thm 8.10) — the same-carrier forms are corollaries, and the assembled iff is pinned; all
over `SimpleGraph (Fin n)` representatives. The Layer-2 `stepGraphon` / `stepGraphonAvg`, the analytic `graphonPartitionEnergy`
(block-average based) with the L²-Pythagoras `graphonPartitionEnergy_increment`, `GraphonSpaceI` + its
`MetricSpace` instance, the descent `homDensityOnSpace`, and the Layer-9a injective density
`injHomDensity` (normalized by the falling factorial `(n)_k = Nat.descFactorial`, **not** `Nat.choose`)
are pinned here too — as are the endpoint milestones: Frieze–Kannan weak regularity,
compactness/completeness of `GraphonSpaceI`, the coupling↔map `cutDistPullback`, the Layer-6b
convergence equivalence, finite-graph compatibility (`finiteGraphGraphon`), and quotient-level
separation. The Layer-8 representability targets — injective-label `LabeledGraph`,
label-retaining `LabeledGraph.glue` (so gluing iterates) with `forgetLabels`,
the graph parameter `GraphParam` with `IsIsoInvariant`, the finite `connectionMatrix` (+ its entry law
`connectionMatrix_apply`) and `IsReflectionPositive` (finite principal blocks PSD), `IsMultiplicative` / `IsNormalized`, and
`lovasz_szegedy_representability` (the four-condition iff over the canonical `(I, volume)` carrier,
with the `[0,1]` range a derived corollary, per Lovász–Szegedy Thm 2.2) —
are pinned here too. So are the Layer-9a/9b/9c sampling and graph-law targets — the joint `infiniteSampleLaw`
with its finite-marginal identification and the two (deliberately distinct) convergence modes,
`ExchangeableGraphLaw` / `upperMass` / `IsDissociated` with the extremality
`exists_graphon_of_isDissociated`, and the Diaconis–Janson summit `graphonMixtureLawEquiv` — and
the Layer-8b Möbius spine (`graphParamMobius` with its positivity and total-mass laws,
`paramExchangeableLaw` with its upper-mass and dissociativity laws) that grounds
`lovasz_szegedy_representability` on Layer 9b.

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

/-- **Layer 1.** The overlaid difference evaluates pointwise as the difference of the two
graphons read through the coupling's coordinates — the eliminator that pins the otherwise-opaque
`overlayDiff`. -/
theorem overlayDiff_apply (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) (π : Measure (Ω₁ × Ω₂))
    (hπ : IsCoupling μ₁ μ₂ π) (p q : Ω₁ × Ω₂) :
    (overlayDiff μ₁ μ₂ U W π hπ).toFun p q = U.toFun p.1 q.1 - W.toFun p.2 q.2 := sorry

/-- **Layer 1 (coupling-primary, cross-carrier).** `cutDist` is the infimum over couplings of the
cut norm of the overlaid difference. -/
def cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : ℝ := sorry

/-- **Layer 1.** The triangle inequality, on **arbitrary probability carriers** (Janson,
*Graphons, cut norm and distance*, Lemma 6.5: step-graphon approximation reduces the coupling
gluing to the finite case — no disintegration, hence no standard-Borel hypothesis). So `cutDist`
is a pseudometric. -/
theorem cutDist_triangle {Ω₃ : Type*} [MeasurableSpace Ω₃] (μ₃ : Measure Ω₃)
    [IsProbabilityMeasure μ₃]
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
standard Borel carriers — **atoms allowed**: any coupling of standard Borel probability spaces is
itself standard Borel, so it is realized by a pair of measure-preserving maps from `(I, volume)`
(`exists_measurePreserving_from_unitInterval`; Janson, Thm 6.9 with Thm A.9). The central design
equivalence. -/
theorem cutDist_eq_cutDistPullback [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂]
    (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) :
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
def graphonSetoid : Setoid (Graphon Ω μ) where
  r U W := cutDistSame μ U W = 0
  iseqv := sorry

/-- **Layer 1.** The fixed-carrier graphon space — over an **arbitrary** probability carrier: the
carrier-free triangle inequality (`cutDist_triangle`, Janson Lemma 6.5) makes `cutDist = 0` a
genuine equivalence with no standard-Borel hypothesis. -/
def GraphonSpace (Ω : Type*) [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] :
    Type _ :=
  Quotient (graphonSetoid μ)

/-- **Layer 1.** The canonical public graphon space: the fixed-carrier quotient over `(I, volume)` —
the compact space cross-carrier graphons transport into (referenced throughout the roadmap). An
`abbrev` so the metric/topology instances on `GraphonSpace I volume` resolve through it. -/
abbrev GraphonSpaceI : Type _ := GraphonSpace I (volume : Measure I)

/-- **Layer 1.** `cutDist` descends to a genuine metric on `GraphonSpace` — needed even to *state*
Layer-4 compactness and the Layer-6b convergence equivalence. -/
instance : MetricSpace (GraphonSpace Ω μ) := sorry

/-- **Layer 1.** The metric on `GraphonSpace` computes as `cutDist` on representatives — pins how
users actually calculate with the quotient metric. -/
theorem dist_graphonSpace_mk_mk (U W : Graphon Ω μ) :
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
partition of complexity `≤ 4^{⌈1/ε²⌉+1}` — the proved migration baseline (`cameronfreer/graphon`,
`Regularity.lean`) — whose block-average step graphon approximates `W` to within `ε` in cut norm.
Sharpening the exponent to `4^{⌈1/ε²⌉}` is a prospective improvement, not a migration-source
result, and is priced separately. -/
theorem weak_regularity_frieze_kannan (W : Graphon Ω μ) {ε : ℝ} (hε : 0 < ε) :
    ∃ (P : Finpartition (⊤ : Set Ω)) (hP : ∀ p ∈ P.parts, MeasurableSet p),
      P.parts.card ≤ 4 ^ (Nat.ceil (1 / ε ^ 2) + 1) ∧
      cutNorm μ (W.toSymmKernel - (stepGraphonAvg μ P hP W).toSymmKernel) ≤ ε := sorry

/-- **Layer 2 (descent of `t(F, ·)`).** `homDensity` descends to `GraphonSpace` (well-defined by the
forward separation `cutDist = 0 ⇒ equal densities`). Fin-indexed, matching the Layer-6a
representatives (an arbitrary carrier would need a generic graph-transport API not pinned here). -/
def homDensityOnSpace (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj] :
    GraphonSpace Ω μ → ℝ :=
  Quotient.lift (fun W => homDensity μ F W) fun U W h => by
    have h0 : cutDist μ μ U W = 0 := h
    exact forall_homDensity_eq_of_cutDist_eq_zero μ μ U W h0 n F

/-- **Layer 2.** The descent computes `homDensity` on representatives (by `Quotient.lift`, `rfl`). -/
theorem homDensityOnSpace_mk (n : ℕ) (F : SimpleGraph (Fin n))
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

/-- **Layer 5 prerequisite (measure-preserving map from `I`).** Every standard Borel probability
space — **atoms allowed** — receives a measure-preserving map from `(I, volume)` (Janson, Thm A.9:
atoms absorb subintervals of their mass). This is the input that lets the coupling↔map equivalence
`cutDist_eq_cutDistPullback` dispense with atomlessness; the mod-null *equivalence* below is the
stronger, atomless-only refinement. -/
theorem exists_measurePreserving_from_unitInterval [StandardBorelSpace Ω] :
    ∃ g : I → Ω, MeasurePreserving g (volume : Measure I) μ := sorry

/-- **Layer 4/5 prerequisite (mod-null transport, atomless).** A *mod-null measure-preserving
equivalence* of an atomless standard Borel probability space with `(I, volume)`: measure-preserving
maps both ways that are mutually inverse a.e. (Mathlib has the measurable equivalence; this is the
m.p. refinement — Janson, Thm A.7. The precise bundled `MeasurePreservingModNullEquiv` is described
in `README.md`.) -/
theorem exists_mpModNull_equiv_unitInterval [StandardBorelSpace Ω] [NullSingletonClass μ] :
    ∃ (f : Ω → I) (g : I → Ω),
      MeasurePreserving f μ volume ∧ MeasurePreserving g volume μ ∧
      (∀ᵐ x ∂μ, g (f x) = x) ∧ (∀ᵐ y ∂(volume : Measure I), f (g y) = y) := sorry

/-- **Layer 6a prerequisite (representation on `[0,1]` — Janson, Thm 7.1).** Every graphon on an
**arbitrary** probability carrier is at cut distance zero from a graphon on `(I, volume)`: the
kernel is measurable for a countably generated sub-σ-algebra, which transports it to a pullback of
a graphon on a Borel carrier (Janson, Lemma 7.3), and `Ω × [0,1]` then reaches `(I, volume)` by the
atomless transport. This is the reduction the hypothesis-free separation converse runs on;
`exists_measurePreserving_from_unitInterval` covers only standard Borel carriers, this owns the
rest. -/
theorem exists_graphon_unitInterval_cutDist_eq_zero (W : Graphon Ω μ) :
    ∃ U : Graphon I (volume : Measure I), cutDist μ (volume : Measure I) W U = 0 := sorry

/-- **Layer 6a forward (same-carrier corollary).** The `cutDistSame` specialization of the
cross-carrier `forall_homDensity_eq_of_cutDist_eq_zero` (`cutDistSame μ = cutDist μ μ`). -/
theorem forall_homDensity_eq_of_cutDistSame_eq_zero (U W : Graphon Ω μ)
    (h : cutDistSame μ U W = 0) :
    ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity μ F U = homDensity μ F W := by
  simpa [cutDistSame] using forall_homDensity_eq_of_cutDist_eq_zero μ μ U W h

section CrossCarrierSeparation
variable {Ω₁ Ω₂ : Type*} [MeasurableSpace Ω₁] [MeasurableSpace Ω₂]
  (μ₁ : Measure Ω₁) (μ₂ : Measure Ω₂) [IsProbabilityMeasure μ₁] [IsProbabilityMeasure μ₂]

/-- **Layer 6a converse (inverse counting — the analytic summit).** All homomorphism densities
agree ⇒ `cutDist = 0`, cross-carrier and with **no standard-Borel / atomless hypotheses** (LNGL
Thm 11.3 on `[0,1]`; Janson, Thm 8.10, for arbitrary carriers, after the Borgs–Chayes–Lovász
uniqueness theorem — the genuinely hard self-contained core). The proof route reduces to
`(I, volume)` representatives via `exists_graphon_unitInterval_cutDist_eq_zero` (Janson, Thm 7.1);
the *statement* carries no carrier hypotheses. -/
theorem cutDist_eq_zero_of_forall_homDensity_eq_cross
    (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)
    (h : ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity μ₁ F U = homDensity μ₂ F W) :
    cutDist μ₁ μ₂ U W = 0 := sorry

/-- **Layer 6a (cross-carrier separation iff — the public statement).** Assembled from the
cross-carrier forward `forall_homDensity_eq_of_cutDist_eq_zero` and the converse above —
hypothesis-free on both sides (Janson, Thm 8.10); the same-carrier iff is its `cutDistSame`
specialization. -/
theorem cutDist_eq_zero_iff_forall_homDensity_eq_cross
    (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) :
    cutDist μ₁ μ₂ U W = 0 ↔
      ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
        homDensity μ₁ F U = homDensity μ₂ F W :=
  ⟨forall_homDensity_eq_of_cutDist_eq_zero μ₁ μ₂ U W,
   cutDist_eq_zero_of_forall_homDensity_eq_cross μ₁ μ₂ U W⟩

end CrossCarrierSeparation

/-- **Layer 6a converse (same-carrier specialization).** The `cutDistSame` form of the carrier-free
cross-carrier converse — a specialization, mirroring how the same-carrier forward is a corollary of
the cross-carrier forward. -/
theorem cutDist_eq_zero_of_forall_homDensity_eq (U W : Graphon Ω μ)
    (h : ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
      homDensity μ F U = homDensity μ F W) :
    cutDistSame μ U W = 0 :=
  cutDist_eq_zero_of_forall_homDensity_eq_cross μ μ U W h

/-- **Layer 9a (sampling).** The `W`-random graph law `G(n, W)`. -/
def sampleGraph (W : Graphon Ω μ) (n : ℕ) : Measure (SimpleGraph (Fin n)) := sorry

/-- **Layer 9a.** The sampling law is a probability measure. -/
instance sampleGraph_isProbabilityMeasure (W : Graphon Ω μ) (n : ℕ) :
    IsProbabilityMeasure (sampleGraph μ W n) := sorry

/-- **Layer 7/9a compatibility.** Sampling the constant-`p` graphon recovers Mathlib's `G(V, p)`
binomial random graph (same `unitInterval` parameter). -/
theorem sampleGraph_const (p : I) (n : ℕ) :
    sampleGraph μ (Graphon.const μ p) n = SimpleGraph.binomialRandom (Fin n) p := sorry

/-- **Layer 9a (finite-graph hom density).** `t(F, G) = hom(F,G) / m^{|V(F)|}` for a finite target
graph `G` on `Fin m`. Defined via `Nat.card` (no `Fintype`/decidability on the hom type or on `G`). -/
def homDensityFin {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ} (G : SimpleGraph (Fin m)) : ℝ :=
  (Nat.card (F →g G) : ℝ) / (m ^ Fintype.card V : ℝ)

/-- **Layer 9a (injective hom density `t₀`).** The *ordered injective* hom count over the **falling
factorial `(m)_k = m.descFactorial k`** (`k = |V(F)|`) — **not** `Nat.choose m k`, which would bias
the sampling estimator by `k!`. Via `Nat.card`; no decidability on the target graph `G`.
**Bridge to Mathlib**: the numerator equals `G.labelledCopyCount F` —
`card_injective_hom_eq_labelledCopyCount` below, proved — so no parallel counting convention
remains. -/
def injHomDensity {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ} (G : SimpleGraph (Fin m)) : ℝ :=
  (Nat.card {φ : F →g G // Function.Injective φ} : ℝ) / (m.descFactorial (Fintype.card V) : ℝ)

/-- **Layer 9a (the counting bridge — proved, not a pin).** The numerator of `injHomDensity` is
Mathlib's labelled copy count: `SimpleGraph.Copy F G` is definitionally an injective
homomorphism, and the host graph comes first — `G.labelledCopyCount F` counts copies of `F`
inside `G`. This settles the normalization against the existing Mathlib primitive; no parallel
counting convention remains. -/
theorem card_injective_hom_eq_labelledCopyCount {V : Type*} [Fintype V] (F : SimpleGraph V)
    {m : ℕ} (G : SimpleGraph (Fin m)) :
    Nat.card {φ : F →g G // Function.Injective φ} = G.labelledCopyCount F := by
  classical
  rw [Nat.card_congr
    ({ toFun := fun φ => ⟨φ.1, φ.2⟩
       invFun := fun c => ⟨c.toHom, c.injective'⟩
       left_inv := fun _ => rfl
       right_inv := fun _ => rfl } :
      {φ : F →g G // Function.Injective φ} ≃ SimpleGraph.Copy F G),
    SimpleGraph.labelledCopyCount]
  convert Nat.card_eq_fintype_card using 2

/-- **Layer 9a (hom vs injective closeness).** `|t(F,·) − t₀(F,·)| ≤ C(k,2)/m`, the bound the
convergence-via-sampling route needs. Requires `0 < m`. -/
theorem homDensityFin_sub_injHomDensity_le {V : Type*} [Fintype V] (F : SimpleGraph V) {m : ℕ}
    (G : SimpleGraph (Fin m)) (hm : 0 < m) :
    |homDensityFin F G - injHomDensity F G| ≤ ((Fintype.card V).choose 2 : ℝ) / (m : ℝ) := sorry

/-- **Layer 9a (unbiasedness anchor).** `E_{G(m,W)}[t₀(F, ·)] = t(F, W)` — the identity that pins the
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

/-- **Layer 9a (restriction).** The initial `n`-vertex window of a graph on `ℕ` — the finite view of
the joint sampling object. (Mathlib's `MeasurableSpace (SimpleGraph V)` — comapped from `Adj` —
covers `V = ℕ`, so laws on `SimpleGraph ℕ` need no new σ-algebra.) -/
def restrictFin (G : SimpleGraph ℕ) (n : ℕ) : SimpleGraph (Fin n) :=
  SimpleGraph.comap (fun i => (i : ℕ)) G

/-- **Layer 9a (the joint sampling object).** The law of the **infinite** `W`-random graph, all
samples on one probability space: i.i.d. `μ`-positions `x : ℕ → Ω`, one uniform per unordered pair,
and `i ~ j` iff the pair's uniform falls below `W (x i) (x j)`. Every finite sampling law is then a
**restriction of this single object** (`infiniteSampleLaw_map_restrictFin`) — the coupling that
almost-sure statements quantify over; the marginal family `sampleGraph W n` alone cannot state
them. -/
def infiniteSampleLaw (W : Graphon Ω μ) : Measure (SimpleGraph ℕ) := sorry

/-- **Layer 9a.** The joint sampling law is a probability measure. -/
instance infiniteSampleLaw_isProbabilityMeasure (W : Graphon Ω μ) :
    IsProbabilityMeasure (infiniteSampleLaw μ W) := sorry

/-- **Layer 9a (finite marginal identification).** The level-`n` window of the joint law is exactly
the finite sampling law — `G(n, W)` for every `n`, realized as restrictions of one infinite random
graph. -/
theorem infiniteSampleLaw_map_restrictFin (W : Graphon Ω μ) (n : ℕ) :
    (infiniteSampleLaw μ W).map (restrictFin · n) = sampleGraph μ W n := sorry

/-- **Layer 9c (the exposure source).** The product source the bounded-differences inequality
runs on: `n` i.i.d. exposed vertices, each carrying its `μ`-position **and a full padded row of
`n` independent uniform edge coins**. A bare "change one sampled vertex" claim on `G(n, W)`
suppresses the independent edge randomness and is not yet a McDiarmid setup; the padded exposure
makes the product structure explicit — the padded coin-row measure is `n`
independent `[0,1]`-uniforms, given concretely. (Prior formalization: `exposureMeasure`, `SampleExposure.lean`.) -/
def exposureMeasure (n : ℕ) : Measure (Fin n → Ω × (Fin n → ℝ)) :=
  Measure.pi fun _ : Fin n => μ.prod (Measure.pi fun _ : Fin n => volume.restrict (Set.Icc (0 : ℝ) 1))

/-- **Layer 9c.** The exposure source is a probability measure (an i.i.d. finite product). -/
instance exposureMeasure_isProbabilityMeasure (n : ℕ) :
    IsProbabilityMeasure (exposureMeasure μ n) := sorry

/-- **Layer 9c (the exposed sampled graph).** Include the edge `{i, j}` exactly when the coin in
row `max i j`, column `min i j` falls below the graphon value at the endpoint positions — every
edge reads its coin from one designated row, so **updating one exposed coordinate changes only
edges incident with that vertex**. Symmetric because `max`/`min`/`{i,j}` are; irreflexive by the
`i ≠ j` conjunct. -/
def exposedSample (W : Graphon Ω μ) (n : ℕ) (x : Fin n → Ω × (Fin n → ℝ)) :
    SimpleGraph (Fin n) := sorry

/-- **The exposure eliminator**: the edge `{i, j}` is present exactly when the coin in row
`max i j`, column `min i j` falls below the graphon value at the endpoint positions. Pins the
designated-row convention the oscillation bound depends on. -/
@[simp] theorem exposedSample_adj (W : Graphon Ω μ) (n : ℕ) (x : Fin n → Ω × (Fin n → ℝ))
    (i j : Fin n) :
    (exposedSample μ W n x).Adj i j ↔
      i ≠ j ∧ (x (max i j)).2 (min i j) ≤ W.toFun (x i).1 (x j).1 := sorry

/-- **Layer 9c (the law identification).** Pushing the exposure source through the exposed
sampler gives exactly the finite sampling law — the identity that makes the exposure a genuine
representation of `G(n, W)`, not a heuristic. -/
theorem map_exposedSample (W : Graphon Ω μ) (n : ℕ) :
    (exposureMeasure μ n).map (exposedSample μ W n) = sampleGraph μ W n := sorry

/-- **Layer 9c (the oscillation bound).** Updating one exposed vertex moves the **ordinary** hom
density by at most `q/n`: only the at most `q·n^{q−1}` of the `n^q` vertex maps whose range meets
the updated vertex can change status. This is the bounded-differences hypothesis, stated for the
exact function McDiarmid is fed. -/
theorem abs_homDensityFin_exposedSample_update_le {V : Type*} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (W : Graphon Ω μ) {n : ℕ} (hn : 0 < n)
    (x : Fin n → Ω × (Fin n → ℝ)) (i : Fin n) (b : Ω × (Fin n → ℝ)) :
    |homDensityFin F (exposedSample μ W n (Function.update x i b))
        - homDensityFin F (exposedSample μ W n x)|
      ≤ (Fintype.card V : ℝ) / n := sorry

/-- **Layer 9c (concentration — the almost-sure engine).** McDiarmid on the exposure source, for
the **ordinary** hom density: `P(|t(F, G(n,W)) − t(F,W)| ≥ ε) ≤ 2·exp(−ε²n/(2q²))` under the side
condition `2q² ≤ εn`, which absorbs the collision bias between the finite-sample mean and
`t(F, W)`. (The injective density `t₀` keeps its unbiasedness anchor in Layer 9a but is **not**
the concentration engine.) The constants are **verified in the migration source**
(`cameronfreer/graphon`, `SampleExposure.lean`): the `q/k` oscillation and this exact tail under
this exact side condition are proved there verbatim. -/
theorem sampleGraph_homDensityFin_concentration {V : Type*} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (W : Graphon Ω μ) {n : ℕ} {ε : ℝ} (hε : 0 < ε)
    (hn : 2 * (Fintype.card V : ℝ) ^ 2 ≤ ε * n) :
    ((sampleGraph μ W n) {G | ε ≤ |homDensityFin F G - homDensity μ F W|}).toReal
      ≤ 2 * Real.exp (-(ε ^ 2 * n) / (2 * (Fintype.card V : ℝ) ^ 2)) := sorry

/-- **Layer 9c (the summability bridge).** For each fixed `F` and `ε > 0` the deviation masses at
sizes `n + 1` have finite total — finitely many initial terms bounded by `1`, the rest decaying
geometrically by the concentration bound. Exactly what Borel–Cantelli consumes on the joint space
(the events are finite-marginal, so their joint-space masses are these marginal masses by
`infiniteSampleLaw_map_restrictFin`). -/
theorem tsum_sampleGraph_homDensityFin_tail_ne_top {V : Type*} [Fintype V] [DecidableEq V]
    (F : SimpleGraph V) [DecidableRel F.Adj] (W : Graphon Ω μ) {ε : ℝ} (hε : 0 < ε) :
    (∑' n : ℕ, (sampleGraph μ W (n + 1)) {G | ε ≤ |homDensityFin F G - homDensity μ F W|})
      ≠ ⊤ := sorry

/-- **Layer 9c (second sampling lemma — convergence in probability).** `δ□(G(n,W), W) → 0` in
probability (LNGL Lemma 10.16), via the **two-stage first-sampling-lemma decomposition**: point
sampling (the genuinely analytic Azuma step, on the weighted sampled graphon) + Bernoulli edge
rounding (a finite union bound over cuts). This mode is a statement about the marginal laws alone
(which is why it is phrased as a per-`ε` bad-event limit — the marginal family carries no single
measure for `TendstoInMeasure`; the joint-space packaging below does). Deliberately distinct from
the almost-sure route below — neither consumes the other's proof. -/
theorem sampleGraph_cutDist_tendsto_inProbability (W : Graphon Ω μ) {ε : ℝ} (hε : 0 < ε) :
    Filter.Tendsto
      (fun n => ((sampleGraph μ W n)
        {G | ε ≤ cutDist (volume : Measure I) μ (finiteGraphGraphon G) W}).toReal)
      Filter.atTop (nhds 0) := sorry

/-- **Layer 9c (in probability — Mathlib packaging on the joint space).** The same convergence
mode phrased through Mathlib's `TendstoInMeasure`, on the single joint law: the
graphon-quotient-valued restriction maps converge in measure to the class of `W`. Stated on the
canonical carrier so the target lives in `GraphonSpaceI`; unfolding `TendstoInMeasure` at each `ε`
recovers the marginal bad-event form above through `infiniteSampleLaw_map_restrictFin`. (Prior
formalization: `sampledEmpiricalGraphon_tendstoInMeasure`, `InfiniteSamplingConvergence.lean`.) -/
theorem infiniteSampleLaw_tendstoInMeasure_cutDist (W : Graphon I (volume : Measure I)) :
    MeasureTheory.TendstoInMeasure (E := GraphonSpaceI)
      (infiniteSampleLaw (volume : Measure I) W)
      (fun n G => Quotient.mk (graphonSetoid (volume : Measure I))
        (finiteGraphGraphon (restrictFin G (n + 1))))
      Filter.atTop
      (fun _ => Quotient.mk (graphonSetoid (volume : Measure I)) W) := sorry

/-- **Layer 9c (almost-sure convergence — on the joint space).** On the joint law, almost every
infinite `W`-random graph has its finite windows converging to `W` in cut distance. The route:
the padded-exposure concentration engine (`sampleGraph_homDensityFin_concentration`, through the
summability bridge) feeds Borel–Cantelli for each fixed `F` at tolerances `1/(m+1)`; intersecting
over the countable family of finite graphs and tolerances gives a full-measure set of pointwise
hom-density convergence; the Layer-6b convergence equivalence upgrades that to cut-distance
convergence. The almost-sure proof does **not** run through the two-stage cut-distance sampling
lemma, and the statement is unstateable for the marginal family — it needs `infiniteSampleLaw`. -/
theorem infiniteSampleLaw_ae_tendsto_cutDist (W : Graphon Ω μ) :
    ∀ᵐ G ∂(infiniteSampleLaw μ W),
      Filter.Tendsto
        (fun n => cutDist (volume : Measure I) μ (finiteGraphGraphon (restrictFin G n)) W)
        Filter.atTop (nhds 0) := sorry

/-- **Layer 9b (exchangeable graph laws).** An exchangeable random graph presented by its consistent
finite marginals: a probability law on `SimpleGraph (Fin k)` for every `k`, consistent under
restriction along **every** injection of labels (which subsumes relabeling invariance). -/
structure ExchangeableGraphLaw where
  /-- The level-`k` marginal law. -/
  law : (k : ℕ) → Measure (SimpleGraph (Fin k))
  /-- Every marginal is a probability measure. -/
  prob : ∀ k, IsProbabilityMeasure (law k)
  /-- Consistency under restriction along every injection of labels. -/
  consistent : ∀ {k l : ℕ} (f : Fin k ↪ Fin l),
    (law l).map (SimpleGraph.comap ⇑f) = law k

/-- **Layer 9b.** Consistency of the sampling laws under label injections — the theorem making
`sampleExchangeableLaw` well-formed. -/
theorem sampleGraph_map_comap (W : Graphon Ω μ) {k l : ℕ} (f : Fin k ↪ Fin l) :
    (sampleGraph μ W l).map (SimpleGraph.comap ⇑f) = sampleGraph μ W k := sorry

/-- **Layer 9b.** The sampling laws of a fixed graphon, packaged as an exchangeable graph law. -/
def sampleExchangeableLaw (W : Graphon Ω μ) : ExchangeableGraphLaw where
  law k := sampleGraph μ W k
  prob k := sampleGraph_isProbabilityMeasure μ W k
  consistent f := sampleGraph_map_comap μ W f

/-- **Layer 9b (upper mass).** The probability that the level-`k` sample contains a fixed graph:
`P(F ≤ ·)` — the observable through which a graph parameter reads off a law (the Layer-8b spine's
`paramExchangeableLaw_upperMass`). -/
def ExchangeableGraphLaw.upperMass (L : ExchangeableGraphLaw) {k : ℕ}
    (F : SimpleGraph (Fin k)) : ℝ :=
  ((L.law k) {G | F ≤ G}).toReal

/-- **Layer 9b (sampling anchor).** The upper mass of the sampling law is the homomorphism density:
`P(F ≤ G(k,W)) = t(F, W)` — the identity through which the Layer-8b spine's final arrow
`f F = t(F, W)` closes. -/
theorem upperMass_sampleExchangeableLaw {k : ℕ} (F : SimpleGraph (Fin k)) [DecidableRel F.Adj]
    (W : Graphon Ω μ) :
    (sampleExchangeableLaw μ W).upperMass F = homDensity μ F W := sorry

/-- **Layer 9b (dissociated laws).** Restrictions to disjoint label windows are independent: the
level-`(k + l)` marginal pushed to the pair of windows is the product of the level-`k` and
level-`l` marginals. Sampling laws are dissociated (`isDissociated_sampleExchangeableLaw`); the
extremality theorem below says they are the **only** dissociated laws. -/
def ExchangeableGraphLaw.IsDissociated (L : ExchangeableGraphLaw) : Prop :=
  ∀ k l : ℕ,
    (L.law (k + l)).map
        (fun G => (SimpleGraph.comap (Fin.castAdd l) G, SimpleGraph.comap (Fin.natAdd k) G))
      = (L.law k).prod (L.law l)

/-- **Layer 9b.** The sampling laws are dissociated (disjoint windows use disjoint sources). -/
theorem isDissociated_sampleExchangeableLaw (W : Graphon Ω μ) :
    (sampleExchangeableLaw μ W).IsDissociated := sorry

/-- **Layer 9b (dissociation via upper masses).** A law is dissociated **iff** its upper masses
are multiplicative over disjoint unions. A genuine theorem, not a rewrite: `IsDissociated` is an
equality of product *laws* on disjoint windows, while upper-mass multiplicativity only constrains
upper events — the two-window Möbius inversion (upper masses determine the pair law) closes the
gap. This is the bridge that makes `isDissociated_paramExchangeableLaw` a visible computation. -/
theorem isDissociated_iff_upperMass_mul (L : ExchangeableGraphLaw) :
    L.IsDissociated
      ↔ ∀ (k l : ℕ) (F₁ : SimpleGraph (Fin k)) (F₂ : SimpleGraph (Fin l)),
          L.upperMass ((F₁ ⊕g F₂).map finSumFinEquiv.toEmbedding)
            = L.upperMass F₁ * L.upperMass F₂ := sorry

/-- **Layer 9b (infinite form).** An exchangeable law on infinite graphs: a probability law on
`SimpleGraph ℕ` invariant under relabeling along every permutation of `ℕ`. -/
structure InfiniteExchangeableGraphLaw where
  /-- The law on infinite graphs. -/
  law : Measure (SimpleGraph ℕ)
  /-- It is a probability measure. -/
  prob : IsProbabilityMeasure law
  /-- Invariance under every relabeling. -/
  exchangeable : ∀ e : Equiv.Perm ℕ, law.map (SimpleGraph.comap ⇑e) = law

/-- **Layer 9b (finite ↔ infinite).** Consistent finite marginals extend uniquely to an exchangeable
law on infinite graphs (a compactness extension), and restriction along `restrictFin` recovers the
marginals — the packaging that lets the representation below be stated in the infinite form. Prior
formalization: `InfiniteLaw.lean` + `InfiniteExchangeability.lean`. -/
def exchangeableGraphLawEquivInfinite :
    ExchangeableGraphLaw ≃ InfiniteExchangeableGraphLaw := sorry

/-- **Layer 9b (the finite-marginal eliminator).** The equivalence's semantic pin: the level-`k`
window of the extension is the level-`k` marginal. Without this named law the `Equiv` is
observationally unconstrained — an arbitrary bijection could permute laws — and with it,
consumers never unfold the equivalence. Proved in the migration source (`cameronfreer/graphon`:
`infiniteLaw_map_restrictFin` composed with the equivalence's application law). -/
@[simp] theorem exchangeableGraphLawEquivInfinite_law_map_restrictFin
    (L : ExchangeableGraphLaw) (k : ℕ) :
    ((exchangeableGraphLawEquivInfinite L).law).map (restrictFin · k) = L.law k := sorry

/-- **Layer 9b (the sampler realizes the abstract law).** The explicit joint sampling law **is** the
compactness extension of the sampling marginals. This certifies in particular that the explicit
sampler is exchangeable, and it is the identification connecting the sampling, graph-law, and
mixture subsections — without it `infiniteSampleLaw` and the abstract infinite law would be two
unconnected objects. Prior formalization: `map_sampleInfinite` /
`map_sampleInfinite_eq_infiniteSampleLaw_mk` (`InfiniteSampler.lean`). -/
theorem infiniteSampleLaw_eq_extension (W : Graphon Ω μ) :
    infiniteSampleLaw μ W
      = (exchangeableGraphLawEquivInfinite (sampleExchangeableLaw μ W)).law := sorry

/-- **Layer 9b (edge coordinates).** The index type of an unordered, non-diagonal pair of
naturals — the coordinate set of the graph ↔ array carrier bridge. (Prior formalization:
`InfiniteGraph.EdgeIndex`, `InfiniteGraph.lean` — edge-set coordinates over `Sym2`, deliberately
not an `ℕ → ℕ → Bool` subtype with a `Symmetric` side condition.) -/
abbrev EdgeIndex : Type := {s : Sym2 ℕ // ¬ s.IsDiag}

/-- **Layer 9b (the carrier bridge — graphs are symmetric irreflexive Boolean arrays).** An
infinite simple graph *is* a Boolean function on the unordered non-diagonal pairs. This is the
carrier level of the future law-level interface `graphLawArrayLawEquiv` (see the cross-roadmap
note in `README.md`), pinned **now** so the meeting point with the Exchangeability roadmap's
array theory is a concrete contract rather than prose; only the law-level adapter — whose target
type is selected when that roadmap's array API exists — waits. -/
def graphCoordEquiv : SimpleGraph ℕ ≃ (EdgeIndex → Bool) := sorry

/-- **The semantic pin of the bridge**: the coordinate at an edge index is the edge indicator —
not, say, its complement. Without this the equivalence is observationally unconstrained. -/
@[simp] theorem graphCoordEquiv_apply (G : SimpleGraph ℕ) (e : EdgeIndex) :
    graphCoordEquiv G e = true ↔ e.1 ∈ G.edgeSet := sorry

/-- **Layer 9b.** The coordinate map is measurable (Mathlib's σ-algebra on `SimpleGraph ℕ`
against the product σ-algebra on the coordinates) — one half of what a pushforward of laws along
the bridge needs. -/
theorem measurable_graphCoordEquiv : Measurable ⇑graphCoordEquiv := sorry

/-- **Layer 9b.** …and so is its inverse, making the bridge a measurable equivalence in
substance. -/
theorem measurable_graphCoordEquiv_symm : Measurable ⇑graphCoordEquiv.symm := sorry

/-- **Layer 9b (relabeling on coordinates).** The action of a permutation of `ℕ` on edge
indices — `Sym2.map` restricted to non-diagonal pairs (injectivity keeps them non-diagonal). -/
def edgeIndexMap (e : Equiv.Perm ℕ) : EdgeIndex ≃ EdgeIndex := sorry

/-- The coordinate action is literally `Sym2.map`; identity and composition laws follow from
this pointwise characterization. -/
@[simp] theorem edgeIndexMap_val (e : Equiv.Perm ℕ) (p : EdgeIndex) :
    (edgeIndexMap e p).1 = Sym2.map e p.1 := sorry

/-- **Layer 9b (the relabeling commuting square).** Relabeling the graph is jointly relabeling
the coordinates: the coordinate of `G.comap e` at a pair is the coordinate of `G` at the mapped
pair. This is the equivariance that will let pushforward along the bridge identify graph
exchangeability with joint array exchangeability once the law-level target type exists. -/
theorem graphCoordEquiv_comap (e : Equiv.Perm ℕ) (G : SimpleGraph ℕ) (p : EdgeIndex) :
    graphCoordEquiv (SimpleGraph.comap ⇑e G) p = graphCoordEquiv G (edgeIndexMap e p) := sorry

/-- **Layer 9b.** The Borel σ-algebra of the cut metric — so `GraphonSpaceI` carries probability
measures (the mixture side of the representation). -/
instance : MeasurableSpace GraphonSpaceI := borel GraphonSpaceI

/-- **Layer 9b.** The σ-algebra is definitionally Borel. -/
instance : BorelSpace GraphonSpaceI := ⟨rfl⟩

/-- **Layer 9b (the mixture map).** The exchangeable graph law of a mixing measure `P` on the
graphon quotient: sample `⟦W⟧ ∼ P`, then sample `G(k, W)` — the level-`k` marginal is the
`P`-mixture of the sampling marginals. This is the *object direction* of the representation; the
spine below proves it bijective. -/
def mixtureExchangeableLaw (P : MeasureTheory.ProbabilityMeasure GraphonSpaceI) :
    ExchangeableGraphLaw := sorry

/-- **Layer 9b (mixture coordinates, finite level).** The upper mass of a mixture law is the
`P`-average of the descended hom-density: `upperMass F = ∫ t(F, ·) dP` on the quotient. Upper
masses determine each finite marginal by Möbius inversion, so this pins `mixtureExchangeableLaw`
itself (and, by transport, the summit's coordinate law `graphonMixtureLawEquiv_upperMass`). -/
theorem upperMass_mixtureExchangeableLaw (P : MeasureTheory.ProbabilityMeasure GraphonSpaceI)
    {k : ℕ} (F : SimpleGraph (Fin k)) [DecidableRel F.Adj] :
    (mixtureExchangeableLaw P).upperMass F
      = ∫ x, homDensityOnSpace (volume : Measure I) k F x ∂(P : Measure GraphonSpaceI) := sorry

/-- **Layer 9b (Dirac fibers of the mixture map).** The mixture of the Dirac mass at `⟦W⟧` is the
`W`-sampling law — the anchor tying the mixture map to the sampling stack at the finite level
(the summit's Dirac anchor `graphonMixtureLawEquiv_dirac` is its transport). -/
theorem mixtureExchangeableLaw_diracProba (W : Graphon I (volume : Measure I)) :
    mixtureExchangeableLaw
        (MeasureTheory.diracProba
          (X := GraphonSpaceI) (Quotient.mk (graphonSetoid (volume : Measure I)) W))
      = sampleExchangeableLaw (volume : Measure I) W := sorry

/-- **Layer 9b (empirical mixing measures — existence spine 1).** Sample an `n`-vertex graph from
the law's level-`n` marginal and take the graphon class of its step graphon: the pushforward of
`L.law n` along `G ↦ ⟦finiteGraphGraphon G⟧`, a probability measure on the graphon quotient (the
map is measurable since `SimpleGraph (Fin n)` is countable and discrete). The candidate mixing
measures whose subsequential weak limit represents `L`. -/
def empiricalMixing (L : ExchangeableGraphLaw) (n : ℕ) :
    MeasureTheory.ProbabilityMeasure GraphonSpaceI :=
  ⟨(L.law n).map
      (fun G => Quotient.mk (graphonSetoid (volume : Measure I)) (finiteGraphGraphon G)),
    sorry⟩

/-- **Layer 9b (the collision estimate — existence spine 2).** The empirical hom-density integrals
converge to the upper masses, quantitatively: injective vertex maps contribute the exact upper
mass by consistency of `L`, and the non-injective maps are bounded by their proportion — at most
`k²/(n+1)` of the total. Stated in successor form so positivity of the sample size is structural.
(Prior formalization: `abs_integral_homDensityCoord_empiricalMixing_sub_le`,
`MixtureExistence.lean`.) -/
theorem abs_integral_homDensityOnSpace_empiricalMixing_sub_le (L : ExchangeableGraphLaw)
    {k : ℕ} (F : SimpleGraph (Fin k)) [DecidableRel F.Adj] (n : ℕ) :
    |(∫ x, homDensityOnSpace (volume : Measure I) k F x
        ∂(empiricalMixing L (n + 1) : Measure GraphonSpaceI)) - L.upperMass F|
      ≤ (k * k : ℝ) / (n + 1) := sorry

/-- **Layer 9b (compactness extraction — existence spine 3, and the point where Layer 4 is
consumed).** Every sequence of mixing measures has a weakly convergent subsequence: Layer 4's
`CompactSpace GraphonSpaceI` makes `ProbabilityMeasure GraphonSpaceI` compact in the topology of
weak convergence (the compact-space direction of Prokhorov — no tightness argument is needed), and
compactness of a metrizable space extracts the subsequence. Stated for an arbitrary sequence: the
extraction is not specific to empirical mixing measures. -/
theorem exists_subseq_tendsto_probabilityMeasure
    (Ps : ℕ → MeasureTheory.ProbabilityMeasure GraphonSpaceI) :
    ∃ (P : MeasureTheory.ProbabilityMeasure GraphonSpaceI) (φ : ℕ → ℕ),
      StrictMono φ ∧ Filter.Tendsto (Ps ∘ φ) Filter.atTop (nhds P) := sorry

/-- **Layer 9b (limit identification — existence spine 4).** Every weak limit of the empirical
mixing measures along a diverging index sequence represents the law: weak convergence moves the
hom-density integrals to the limit (each descended `t(F, ·)` is continuous and bounded), the
collision estimate identifies them with the upper masses of `L`, and upper masses determine the
finite marginals by Möbius inversion. -/
theorem mixtureExchangeableLaw_eq_of_tendsto_empiricalMixing (L : ExchangeableGraphLaw)
    {P : MeasureTheory.ProbabilityMeasure GraphonSpaceI} {φ : ℕ → ℕ}
    (hφ : Filter.Tendsto φ Filter.atTop Filter.atTop)
    (hconv : Filter.Tendsto (fun m => empiricalMixing L (φ m + 1))
      Filter.atTop (nhds P)) :
    mixtureExchangeableLaw P = L := sorry

/-- **Layer 9b (existence — spine 5).** Every exchangeable graph law is a graphon mixture: apply
the compactness extraction to `fun n => empiricalMixing L (n + 1)` and identify the limit. This is
the existence half of the Diaconis–Janson correspondence, proved by graphon-space compactness —
with **no array-level input**. -/
theorem exists_mixtureExchangeableLaw_eq (L : ExchangeableGraphLaw) :
    ∃ P : MeasureTheory.ProbabilityMeasure GraphonSpaceI, mixtureExchangeableLaw P = L := sorry

/-- **Layer 9b (uniqueness — spine 6).** The mixture map is injective: the descended hom-densities
`t(F, ·)` form a point-separating, multiplication-closed family of bounded continuous functions on
the compact metrizable `GraphonSpaceI` (Layer 6a separation + Layer 1 products), so their
integrals — which the mixture law's upper masses record — determine the mixing measure
(Stone–Weierstrass / determination by a separating algebra). -/
theorem mixtureExchangeableLaw_injective :
    Function.Injective
      (mixtureExchangeableLaw : MeasureTheory.ProbabilityMeasure GraphonSpaceI →
        ExchangeableGraphLaw) := sorry

/-- **Layer 9b (the packaged finite-level correspondence).** Existence (spine 5) and uniqueness
(spine 6) package as an equivalence — a **real body** by `Equiv.ofBijective`, so the forward map
is the mixture map by construction and this cannot be an arbitrary `Equiv`. -/
def mixtureExchangeableLawEquiv :
    MeasureTheory.ProbabilityMeasure GraphonSpaceI ≃ ExchangeableGraphLaw :=
  Equiv.ofBijective mixtureExchangeableLaw
    ⟨mixtureExchangeableLaw_injective, exists_mixtureExchangeableLaw_eq⟩

/-- **Layer 9b.** The forward map of the packaged correspondence is the mixture map —
definitional, by the `Equiv.ofBijective` assembly. -/
theorem mixtureExchangeableLawEquiv_apply (P : MeasureTheory.ProbabilityMeasure GraphonSpaceI) :
    mixtureExchangeableLawEquiv P = mixtureExchangeableLaw P := rfl

/-- **Layer 9b (dissociated ⟺ Dirac).** A graphon mixture is dissociated **iff** its mixing
measure is a Dirac mass: sampling laws are dissociated (Dirac direction), and a dissociated
mixture forces the hom-density coordinates to be multiplicative, collapsing the mixing measure to
a point of the quotient. With the spine this makes `exists_graphon_of_isDissociated` a short
consequence rather than an independent representation theorem. -/
theorem isDissociated_mixtureExchangeableLaw_iff
    (P : MeasureTheory.ProbabilityMeasure GraphonSpaceI) :
    (mixtureExchangeableLaw P).IsDissociated
      ↔ ∃ W : Graphon I (volume : Measure I),
          P = MeasureTheory.diracProba
            (X := GraphonSpaceI) (Quotient.mk (graphonSetoid (volume : Measure I)) W) :=
  sorry

/-- **Layer 9b (extremality — dissociated laws are exactly the sample laws).** A dissociated
exchangeable graph law is the sampling law of a graphon on the canonical carrier — the
graph-law-level extreme-point theorem the Layer-8b spine consumes (its converse is
`isDissociated_sampleExchangeableLaw`). With the empirical-mixing spine above, this is a **short
consequence**, not an independent representation theorem — existence writes `L` as a mixture,
`isDissociated_mixtureExchangeableLaw_iff` collapses the mixing measure to a Dirac, and the Dirac
fiber is a sampling law (`mixtureExchangeableLaw_diracProba`). Prior formalization:
`isDissociated_iff_exists_sampleExchangeableLaw` (`MixtureExtremality.lean`). -/
theorem exists_graphon_of_isDissociated (L : ExchangeableGraphLaw) (h : L.IsDissociated) :
    ∃ W : Graphon I (volume : Measure I),
      L = sampleExchangeableLaw (volume : Measure I) W := sorry

/-- **Layer 9b (the graph-law representation — Diaconis–Janson).** Every exchangeable law on
infinite graphs is a **graphon mixture**, uniquely: a bijection with the probability measures on
the **graphon quotient** `GraphonSpaceI`. Uniqueness lives on the quotient, never among raw kernel
representatives — two kernels at cut distance zero give the same mixture. This is the
Diaconis–Janson graphon-mixture representation, a graph-level Aldous–Hoover *consequence* —
deliberately not labeled "Aldous–Hoover": the array-level representation theorem is owned by the
Exchangeability roadmap and this target does not consume it, while the shared generic
exchangeable-law API is what these graph-law structures refactor onto (see the Layer-9b
cross-roadmap note in `README.md`). The summit is **assembled, not
opaque**: the existence/uniqueness content lives in the finite-level empirical-mixing spine above
(`mixtureExchangeableLawEquiv`), and the infinite form is its transport along the finite↔infinite
extension — so this definition carries a real body. Prior formalization:
`infiniteMixtureLawEquiv` (`InfiniteRepresentation.lean`), proved without array-level input. -/
def graphonMixtureLawEquiv :
    MeasureTheory.ProbabilityMeasure GraphonSpaceI ≃ InfiniteExchangeableGraphLaw :=
  mixtureExchangeableLawEquiv.trans exchangeableGraphLawEquivInfinite

/-- **Layer 9b (anchor).** The representation sends the Dirac mass at the class of `W` to the
infinite `W`-sampling law — tying the correspondence back to the sampling stack. With the spine,
this is the transport of `mixtureExchangeableLaw_diracProba` through
`mixtureExchangeableLawEquiv_apply` and the extension identification. -/
theorem graphonMixtureLawEquiv_dirac (W : Graphon I (volume : Measure I)) :
    graphonMixtureLawEquiv
        ⟨Measure.dirac (Quotient.mk (graphonSetoid (volume : Measure I)) W),
          Measure.dirac.isProbabilityMeasure⟩
      = exchangeableGraphLawEquivInfinite (sampleExchangeableLaw (volume : Measure I) W) := sorry

/-- **Layer 9b (mixture coordinates — every finite marginal pinned).** What a **general** mixing
measure maps to — the Dirac anchor alone would leave non-Dirac mixtures unconstrained (an
arbitrary `Equiv` could permute them): under `graphonMixtureLawEquiv P`, the upper mass of every
finite graph is the `P`-average of its hom-density, `upperMass F = ∫ t(F, ·) dP`, integrated on
the quotient through the descended `homDensityOnSpace`. Upper masses determine each finite
marginal by Möbius inversion, so this pins the entire correspondence, not just its Dirac fibers.
With the spine, this is the transport of the finite-level coordinate law
`upperMass_mixtureExchangeableLaw`. Prior formalization:
`infiniteMixtureLawEquiv_law_map_restrictFin` (`InfiniteRepresentation.lean`). -/
theorem graphonMixtureLawEquiv_upperMass (P : MeasureTheory.ProbabilityMeasure GraphonSpaceI)
    {k : ℕ} (F : SimpleGraph (Fin k)) [DecidableRel F.Adj] :
    (exchangeableGraphLawEquivInfinite.symm (graphonMixtureLawEquiv P)).upperMass F
      = ∫ x, homDensityOnSpace (volume : Measure I) k F x ∂(P : Measure GraphonSpaceI) := sorry

/-- **Layer 8a (k-labeled graph).** A finite simple graph with an ordered `k`-tuple of *distinct*
labeled vertices (labels injective) — the objects of the gluing algebra behind connection matrices. -/
structure LabeledGraph (k : ℕ) where
  n : ℕ
  graph : SimpleGraph (Fin n)
  label : Fin k → Fin n
  label_injective : Function.Injective label

/-- **Layer 8a (gluing).** Glue two `k`-labeled graphs by identifying corresponding labeled
vertices. The result is again a `k`-labeled graph — the identified labeled vertices keep their
labels (still distinct) — so gluing **iterates**, and the associativity/commutativity (up to `≃g`)
of the gluing algebra is expressible; this is Lovász–Szegedy's product `F₁F₂` of `k`-labeled
graphs. The underlying unlabeled graph is `forgetLabels`. -/
def LabeledGraph.glue {k : ℕ} (G₁ G₂ : LabeledGraph k) : LabeledGraph k := sorry

/-- **Layer 8a (gluing eliminators).** The two vertex maps into the gluing. -/
def LabeledGraph.glueInl {k : ℕ} (G₁ G₂ : LabeledGraph k) : Fin G₁.n ↪ Fin (G₁.glue G₂).n := sorry

/-- The right vertex map into the gluing. -/
def LabeledGraph.glueInr {k : ℕ} (G₁ G₂ : LabeledGraph k) : Fin G₂.n ↪ Fin (G₁.glue G₂).n := sorry

/-- **No other identifications**: the two sides meet exactly at corresponding labels — the
vertex pushout, pinned. With joint surjectivity this determines the vertex set; a cardinality
law `(G₁.glue G₂).n = G₁.n + G₂.n - k` is a derived regression, not a substitute. -/
theorem LabeledGraph.glueInl_eq_glueInr_iff {k : ℕ} (G₁ G₂ : LabeledGraph k)
    (a : Fin G₁.n) (b : Fin G₂.n) :
    G₁.glueInl G₂ a = G₁.glueInr G₂ b ↔ ∃ i : Fin k, a = G₁.label i ∧ b = G₂.label i := sorry

/-- **The glued graph is exactly the supremum of the two mapped sources** — smaller and
compositional than a raw adjacency eliminator, and it yields the full adjacency `iff` by
`SimpleGraph.sup_adj` and `SimpleGraph.map_adj`: no cross-edges between unlabeled vertices can
be smuggled in. -/
theorem LabeledGraph.glue_graph {k : ℕ} (G₁ G₂ : LabeledGraph k) :
    (G₁.glue G₂).graph = G₁.graph.map (G₁.glueInl G₂) ⊔ G₂.graph.map (G₁.glueInr G₂) := sorry

/-- The gluing identifies exactly the corresponding labeled vertices: the two maps agree on
labels, and the labels of the gluing are the common image. -/
theorem LabeledGraph.glueInl_label {k : ℕ} (G₁ G₂ : LabeledGraph k) :
    (G₁.glue G₂).label = G₁.glueInl G₂ ∘ G₁.label := sorry

/-- The right labels agree with the glued labels. -/
theorem LabeledGraph.glueInr_label {k : ℕ} (G₁ G₂ : LabeledGraph k) :
    (G₁.glue G₂).label = G₁.glueInr G₂ ∘ G₂.label := sorry

/-- Every vertex of the gluing comes from one of the two sides (joint surjectivity). -/
theorem LabeledGraph.glue_surjective {k : ℕ} (G₁ G₂ : LabeledGraph k)
    (v : Fin (G₁.glue G₂).n) :
    (∃ a, v = G₁.glueInl G₂ a) ∨ ∃ b, v = G₁.glueInr G₂ b := sorry

/-- Adjacency on the left side is reflected faithfully. -/
theorem LabeledGraph.glue_adj_inl {k : ℕ} (G₁ G₂ : LabeledGraph k) (a b : Fin G₁.n) :
    (G₁.glue G₂).graph.Adj (G₁.glueInl G₂ a) (G₁.glueInl G₂ b) ↔ G₁.graph.Adj a b := sorry

/-- Adjacency on the right side is reflected faithfully. -/
theorem LabeledGraph.glue_adj_inr {k : ℕ} (G₁ G₂ : LabeledGraph k) (a b : Fin G₂.n) :
    (G₁.glue G₂).graph.Adj (G₁.glueInr G₂ a) (G₁.glueInr G₂ b) ↔ G₂.graph.Adj a b := sorry

/-- **Layer 8a (unlabeling).** The underlying finite simple graph of a `k`-labeled graph, labels
forgotten — the object a `GraphParam` evaluates, e.g. in the connection-matrix entries. -/
def LabeledGraph.forgetLabels {k : ℕ} (G : LabeledGraph k) : Σ m, SimpleGraph (Fin m) :=
  ⟨G.n, G.graph⟩

/-- **Layer 8 (graph parameter).** A real-valued parameter of finite simple graphs (indexed over
`Fin`-representatives); isomorphism invariance is imposed separately as `IsIsoInvariant`. -/
abbrev GraphParam := (n : ℕ) → SimpleGraph (Fin n) → ℝ

/-- **Layer 8 (isomorphism invariance).** `f` agrees on isomorphic graphs — the standing hypothesis
that makes `f` a genuine graph parameter rather than a labelling-sensitive function on `Fin n`. -/
def IsIsoInvariant (f : GraphParam) : Prop :=
  ∀ (n₁ n₂ : ℕ) (F₁ : SimpleGraph (Fin n₁)) (F₂ : SimpleGraph (Fin n₂)),
    Nonempty (F₁ ≃g F₂) → f n₁ F₁ = f n₂ F₂

/-- **Layer 8a (connection matrix).** For a finite family `A : ι → LabeledGraph k` of `k`-labeled
graphs, the `ι × ι` matrix whose `(i, j)` entry is `f` on the glued graph of `A i` and `A j` (pinned
by `connectionMatrix_apply`) — a finite principal block of the full connection matrix `M(f, k)`. Built
here; connection matrices are not in Mathlib. -/
def connectionMatrix (f : GraphParam) {k : ℕ} {ι : Type*} [Fintype ι]
    (A : ι → LabeledGraph k) : Matrix ι ι ℝ := sorry

/-- **Layer 8a.** The connection-matrix entry law: `f` evaluated on the underlying unlabeled graph
(`forgetLabels`) of the gluing of `A i` and `A j`. -/
theorem connectionMatrix_apply (f : GraphParam) {k : ℕ} {ι : Type*} [Fintype ι]
    (A : ι → LabeledGraph k) (i j : ι) :
    connectionMatrix f A i j
      = f ((A i).glue (A j)).forgetLabels.1 ((A i).glue (A j)).forgetLabels.2 := sorry

/-- **Layer 8a (reflection positivity).** `f` is reflection-positive when every finite connection
matrix is positive semidefinite — i.e. every finite principal block of each `M(f, k)` is PSD. Stated
over `Fin n`-indexed families, matching the roadmap's `Fin`-representative convention (any finite `ι`
reindexes to `Fin (Fintype.card ι)` with positive semidefiniteness preserved). -/
def IsReflectionPositive (f : GraphParam) : Prop :=
  ∀ (k n : ℕ) (A : Fin n → LabeledGraph k), (connectionMatrix f A).PosSemidef

/-- **Layer 8 (multiplicativity).** `f` is multiplicative over disjoint unions:
`f (F₁ ⊕g F₂) = f F₁ * f F₂`, with the disjoint union reindexed to `Fin (n₁ + n₂)` along
`finSumFinEquiv` to stay on `Fin`-representatives. -/
def IsMultiplicative (f : GraphParam) : Prop :=
  ∀ (n₁ n₂ : ℕ) (F₁ : SimpleGraph (Fin n₁)) (F₂ : SimpleGraph (Fin n₂)),
    f (n₁ + n₂) ((F₁ ⊕g F₂).map finSumFinEquiv.toEmbedding) = f n₁ F₁ * f n₂ F₂

/-- **Layer 8 (normalization).** `f K₁ = 1` — the value on the one-vertex graph
`(⊥ : SimpleGraph (Fin 1))`. -/
def IsNormalized (f : GraphParam) : Prop := f 1 ⊥ = 1

open Classical in
/-- **Layer 8b (Möbius transform `f†`).** The supergraph-inclusion Möbius transform on the same
vertex set: `f†(F) = ∑_{G ⊇ F} (−1)^{e(G) − e(F)} · f(G)` — the coefficients of `f` in the
"contains exactly" basis (edge counts via `Nat.card`, so no decidability on the summed `G`). The
first rung of the representability spine. -/
def graphParamMobius (f : GraphParam) : GraphParam := fun n F =>
  ∑ G ∈ Finset.univ.filter (fun G : SimpleGraph (Fin n) => F ≤ G),
    (-1 : ℝ) ^ (Nat.card G.edgeSet - Nat.card F.edgeSet) * f n G

/-- **Layer 8b (spine 1 — `f† ≥ 0`).** Reflection positivity forces the Möbius transform
nonnegative: the fully-labelled connection matrices (every vertex labeled) are PSD — a special
family of Layer 8a's finite blocks — and the Möbius transform is a congruence by an invertible
`0/1` matrix, so the transformed diagonal, whose entries are the values `f†`, is nonnegative. -/
theorem graphParamMobius_nonneg (f : GraphParam) (hrp : IsReflectionPositive f)
    (n : ℕ) (F : SimpleGraph (Fin n)) : 0 ≤ graphParamMobius f n F := sorry

open Classical in
/-- **Layer 8b (spine 2 — `∑ f† = 1`).** The Möbius masses at each level sum to one: the double
sum telescopes to `f` of the edgeless graph on `n` vertices, which is `f(K₁)^n = 1` by
multiplicativity and normalization. With spine 1 this makes `f†` a probability mass function at
every level. -/
theorem graphParamMobius_sum_eq_one (f : GraphParam) (hmul : IsMultiplicative f)
    (hnorm : IsNormalized f) (n : ℕ) :
    ∑ G : SimpleGraph (Fin n), graphParamMobius f n G = 1 := sorry

open Classical in
/-- **Layer 8b (spine 3a — the Möbius consistency calculus).** The raw mass identity making the
`f†` levels a consistent family: for every label injection, each level-`k` mass is the total
level-`n` mass of its extension event. **Not mere assembly** — from `f† ≥ 0` and `∑ f† = 1` one
only gets a probability mass at each fixed level; this identity is the theorem that binds the
levels. Hypotheses deliberately minimal: iso-invariance handles relabeling, and multiplicativity
with normalization gives the added-vertex telescope `f(F ⊔ K₁) = f(F) · f(K₁) = f(F)`; reflection
positivity is **not** needed here. -/
theorem graphParamMobius_sum_comap (f : GraphParam) (h₁ : IsIsoInvariant f)
    (h₂ : IsMultiplicative f) (h₃ : IsNormalized f) {k n : ℕ} (e : Fin k ↪ Fin n)
    (G : SimpleGraph (Fin k)) :
    graphParamMobius f k G
      = ∑ H ∈ Finset.univ.filter (fun H : SimpleGraph (Fin n) => H.comap ⇑e = G),
          graphParamMobius f n H := sorry

open Classical in
/-- **Layer 8b (spine 3b — the level-`n` measure).** The measure on `n`-vertex graphs with mass
`f†(H)` at each `H`, as an explicit weighted sum of Dirac masses — a real body, so the passage
from parameter to measure hides nothing. -/
def paramGraphLaw (f : GraphParam) (n : ℕ) : Measure (SimpleGraph (Fin n)) :=
  ∑ H : SimpleGraph (Fin n), ENNReal.ofReal (graphParamMobius f n H) • Measure.dirac H

/-- **Layer 8b.** The level measures are probability measures — total mass by spine 2, and spine
1's nonnegativity makes the `ENNReal.ofReal` weights faithful. -/
theorem paramGraphLaw_isProbabilityMeasure (f : GraphParam) (h₂ : IsMultiplicative f)
    (h₃ : IsNormalized f) (h₄ : IsReflectionPositive f) (n : ℕ) :
    IsProbabilityMeasure (paramGraphLaw f n) := sorry

/-- **Layer 8b (spine 3a, packaged).** The consistency calculus as pushforward consistency of the
level measures — the exact field `ExchangeableGraphLaw.consistent` demands. Reflection positivity
enters only here (nonnegativity keeps the `ENNReal.ofReal` weights faithful to the raw
identity). -/
theorem paramGraphLaw_map_comap (f : GraphParam) (h₁ : IsIsoInvariant f)
    (h₂ : IsMultiplicative f) (h₃ : IsNormalized f) (h₄ : IsReflectionPositive f)
    {k n : ℕ} (e : Fin k ↪ Fin n) :
    (paramGraphLaw f n).map (SimpleGraph.comap ⇑e) = paramGraphLaw f k := sorry

/-- **Layer 8b (spine 3c — the random graph law `L_f`).** The exchangeable graph law whose
level-`n` masses are `f†` — now a **visible assembly** rather than an opaque constructor: the
level measures are `paramGraphLaw`, probability by spines 1–2, consistency by the packaged
calculus. This is where a parameter becomes a random object, with **no representing graphon in
sight yet**. -/
def paramExchangeableLaw (f : GraphParam) (h₁ : IsIsoInvariant f) (h₂ : IsMultiplicative f)
    (h₃ : IsNormalized f) (h₄ : IsReflectionPositive f) : ExchangeableGraphLaw where
  law n := paramGraphLaw f n
  prob n := paramGraphLaw_isProbabilityMeasure f h₂ h₃ h₄ n
  consistent e := paramGraphLaw_map_comap f h₁ h₂ h₃ h₄ e

/-- **Layer 8b (spine 4 — `f` is the upper mass of `L_f`).** Möbius inversion:
`P(F ≤ ·) = ∑_{G ⊇ F} f†(G) = f(F)` under `L_f`. -/
theorem paramExchangeableLaw_upperMass (f : GraphParam) (h₁ : IsIsoInvariant f)
    (h₂ : IsMultiplicative f) (h₃ : IsNormalized f) (h₄ : IsReflectionPositive f)
    {k : ℕ} (F : SimpleGraph (Fin k)) :
    (paramExchangeableLaw f h₁ h₂ h₃ h₄).upperMass F = f k F := sorry

/-- **Layer 8b (spine 5 — multiplicativity dissociates `L_f`).** Disjoint label windows are
independent under `L_f` — a visible computation through the Layer-9b bridge: by spine 4 the
upper masses of `L_f` are `f`, multiplicativity factors them over disjoint unions, and
`isDissociated_iff_upperMass_mul` upgrades upper-mass multiplicativity to dissociation. This is
the hypothesis Layer 9b's extremality theorem consumes. -/
theorem isDissociated_paramExchangeableLaw (f : GraphParam) (h₁ : IsIsoInvariant f)
    (h₂ : IsMultiplicative f) (h₃ : IsNormalized f) (h₄ : IsReflectionPositive f) :
    (paramExchangeableLaw f h₁ h₂ h₃ h₄).IsDissociated := sorry

/-- **Layer 8b (Lovász–Szegedy representability — the moment problem for graphs).** A graph
parameter equals `t(·, W)` for some graphon on the canonical carrier `(I, volume)` iff it is
isomorphism-invariant, multiplicative, normalized, and reflection-positive (Lovász–Szegedy,
*Limits of dense graph sequences*, Thm 2.2 — where iso-invariance is baked into their notion of
graph parameter; it is explicit here because `GraphParam` is representation-sensitive). Explicit
`[0,1]`-boundedness is **not** a hypothesis: it is a consequence
(`graphParam_mem_Icc_of_representability_axioms` below). Every graphon is representable on
`(I, volume)`, so the existential carrier collapses to the canonical one. **The hard direction
runs on the pinned spine**: reflection positivity → `f† ≥ 0` and `∑ f† = 1` (spines 1–2) → the
random graph law `L_f` (spine 3) → `upperMass L_f = f` (spine 4) → `L_f` dissociated (spine 5) →
Layer 9b's extremality `exists_graphon_of_isDissociated` gives `L_f = sampleExchangeableLaw W` →
the sampling anchor `upperMass_sampleExchangeableLaw` closes `f F = t(F, W)`. What this consumes
from Layer 9b is the **graph-law representation/extremality infrastructure only — not the
Layer-9c graphon-sampling concentration theorems** (at the point the spine runs, no representing graphon
exists, so a classical random-graphs-plus-convergent-subsequence route would additionally need an
`f†`-specific variance or simultaneous-selection lemma; the extremality route needs none). The
easy direction checks the four axioms for `t(·, W)`. -/
theorem lovasz_szegedy_representability (f : GraphParam) :
    (∃ W : Graphon I (volume : Measure I),
        ∀ (n : ℕ) (F : SimpleGraph (Fin n)) [DecidableRel F.Adj],
          f n F = homDensity (volume : Measure I) F W)
      ↔ IsIsoInvariant f ∧ IsMultiplicative f ∧ IsNormalized f ∧ IsReflectionPositive f := sorry

/-- **Layer 8b (derived range bound).** An isomorphism-invariant, multiplicative, normalized,
reflection-positive graph parameter is automatically `[0,1]`-valued — via the representation
`f = t(·, W)` and `t(F, W) ∈ [0,1]` (Layer 1). This is why boundedness is a corollary of the
characterization, never one of its hypotheses. (Named for the full set of representability axioms:
all four hypotheses are consumed, not reflection positivity alone.) -/
theorem graphParam_mem_Icc_of_representability_axioms (f : GraphParam) (h₁ : IsIsoInvariant f)
    (h₂ : IsMultiplicative f) (h₃ : IsNormalized f) (h₄ : IsReflectionPositive f)
    (n : ℕ) (F : SimpleGraph (Fin n)) : f n F ∈ Set.Icc (0 : ℝ) 1 := sorry

end TauCetiRoadmap.DenseGraphLimits
