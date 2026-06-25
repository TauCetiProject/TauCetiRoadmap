import Mathlib

/-!
# Dense graph limits and graphons: target signatures

The narrative roadmap (conventions, the layer plan, the consumed-Mathlib inventory, acceptance
gates, provenance, references) is in `README.md`. This file pins the **types** as compiled
`sorry`-signatures (allowed in this human-owned roadmap library): in particular that the cut norm
acts on *kernels* (so a difference `U - W` is well-typed), that `cutDist` is **coupling-primary and
cross-carrier**, and that the constant-graphon / sampling targets share the `unitInterval`
convention with Mathlib's `SimpleGraph.binomialRandom`.

Objects whose precise Lean shape would force a premature API choice — the weak-regularity
`Finpartition` adapter, the `GraphonSpaceI` metric and the Layer-6b convergence equivalence on it,
and the exact mod-null transport bundle — are described in `README.md` instead.
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

/-- **Layer 1.** Overlay of two graphons along a coupling, as a kernel on the coupled space. -/
def overlay (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) (π : Measure (Ω₁ × Ω₂))
    (hπ : IsCoupling μ₁ μ₂ π) : SymmKernel (Ω₁ × Ω₂) π := sorry

/-- **Layer 1 (coupling-primary, cross-carrier).** `cutDist` is the infimum over couplings of the
cut norm of the overlaid difference. -/
def cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂) : ℝ := sorry

/-- **Layer 1.** The gluing-lemma triangle inequality (so `cutDist` is a pseudometric). -/
theorem cutDist_triangle {Ω₃ : Type*} [MeasurableSpace Ω₃] (μ₃ : Measure Ω₃)
    [IsProbabilityMeasure μ₃] [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂] [StandardBorelSpace Ω₃]
    (U : Graphon Ω₁ μ₁) (V : Graphon Ω₂ μ₂) (W : Graphon Ω₃ μ₃) :
    cutDist μ₁ μ₃ U W ≤ cutDist μ₁ μ₂ U V + cutDist μ₂ μ₃ V W := sorry

end CrossCarrier

/-- **Layer 1.** Same-carrier specialization of the cross-carrier `cutDist`. -/
def cutDistSame (U W : Graphon Ω μ) : ℝ := cutDist μ μ U W

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

/-- **Layer 2 (forward counting lemma).** The argument to `cutNorm` is the *kernel* `U - W`; the
prefactor is `(F.edgeFinset.card : ℝ)` (prose `e(F)`). -/
theorem counting_lemma {V : Type*} [Fintype V] [DecidableEq V] (F : SimpleGraph V)
    [DecidableRel F.Adj] (U W : Graphon Ω μ) :
    |homDensity μ F U - homDensity μ F W|
      ≤ (F.edgeFinset.card : ℝ) * cutNorm μ (U.toSymmKernel - W.toSymmKernel) := sorry

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

/-- **Layer 5 prerequisite (mod-null transport).** A *mod-null measure-preserving equivalence* of an
atomless standard Borel probability space with `(I, volume)`: measure-preserving maps both ways that
are mutually inverse a.e. (Mathlib has the measurable equivalence; this is the m.p. refinement. The
precise bundled `MeasurePreservingModNullEquiv` is described in `README.md`.) -/
theorem exists_mpModNull_equiv_unitInterval [StandardBorelSpace Ω] [NoAtoms μ] :
    ∃ (f : Ω → I) (g : I → Ω),
      MeasurePreserving f μ volume ∧ MeasurePreserving g volume μ ∧
      (∀ᵐ x ∂μ, g (f x) = x) ∧ (∀ᵐ y ∂(volume : Measure I), f (g y) = y) := sorry

/-- **Layer 6a (separation / inverse counting — the analytic summit).** -/
theorem cutDist_eq_zero_iff_forall_homDensity_eq [StandardBorelSpace Ω] [NoAtoms μ]
    (U W : Graphon Ω μ) :
    cutDistSame μ U W = 0 ↔
      ∀ {V : Type} [Fintype V] [DecidableEq V] (F : SimpleGraph V) [DecidableRel F.Adj],
        homDensity μ F U = homDensity μ F W := sorry

/-- **Layer 9 (sampling).** The `W`-random graph law `G(n, W)`. -/
def sampleGraph (W : Graphon Ω μ) (n : ℕ) : Measure (SimpleGraph (Fin n)) := sorry

/-- **Layer 9.** The sampling law is a probability measure. -/
instance sampleGraph_isProbabilityMeasure (W : Graphon Ω μ) (n : ℕ) :
    IsProbabilityMeasure (sampleGraph μ W n) := sorry

/-- **Layer 7/9 compatibility.** Sampling the constant-`p` graphon recovers Mathlib's `G(V, p)`
binomial random graph (same `unitInterval` parameter). -/
theorem sampleGraph_const (p : I) (n : ℕ) :
    sampleGraph μ (Graphon.const μ p) n = SimpleGraph.binomialRandom (Fin n) p := sorry

end TauCetiRoadmap.DenseGraphLimits
