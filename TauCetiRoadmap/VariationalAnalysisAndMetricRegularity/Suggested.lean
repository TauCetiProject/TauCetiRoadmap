module

public import Mathlib
public import TauCeti.Analysis.Convex.Conjugate
public import TauCeti.Analysis.Convex.Subdifferential
public import TauCeti.Topology.MetricSpace.Ekeland

/-!
# Variational analysis and metric regularity: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. A sequence of sets is `C : ℕ → Set X`, and
its Painlevé–Kuratowski limits are defined through neighbourhoods, so that they make sense in any
topological space. Extended-real functions are `E → EReal` and their epigraphs are the real
epigraphs `{p : E × ℝ | f p.1 ≤ p.2}`. Generalized gradients, normals and subgradients are
elements of `StrongDual ℝ E`; the convex subdifferential they are compared with is Tau Ceti's
`TauCeti.subdifferential` for the evaluation pairing `(topDualPairing ℝ E).flip`. Set-valued maps
are `F : X → Set Y`, distances to sets are the extended distances `Metric.infEDist` (so the
distance to the empty set is `⊤`), and moduli of regularity are in `ℝ≥0`.

The normal cone of convex analysis is owned by VariationalMethods §2.1 and the directional
derivative by ConvexAnalysisAndDuality 3.1; both appear here as local copies whose docstrings
name the owner. The implementation namespace of the README is `TauCeti`; the prototypes live in
this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open Set Filter Topology MeasureTheory TauCeti
open scoped NNReal ENNReal Pointwise

namespace TauCetiRoadmap.VariationalAnalysisAndMetricRegularity

attribute [local instance] Classical.propDecidable

/-! ## Local copies -/

section Copies

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The normal cone of convex analysis, `N_C(u) = {f | ∀ v ∈ C, f (v - u) ≤ 0}`, for the
evaluation pairing. Local copy of the normal cone of VariationalMethods §2.1, which owns it. It is
used only at points `u ∈ C`. -/
def normalCone (C : Set E) (u : E) : Set (StrongDual ℝ E) :=
  {f | ∀ v ∈ C, f (v - u) ≤ 0}

/-- The one-sided directional derivative `f'(x; d)`, the infimum over `t > 0` of the difference
quotients. Local copy of `dirDeriv` of ConvexAnalysisAndDuality 3.1, which owns it. -/
def dirDeriv (f : E → EReal) (x d : E) : EReal :=
  ⨅ t : Ioi (0 : ℝ), (((t : ℝ)⁻¹ : ℝ) : EReal) * (f (x + (t : ℝ) • d) - f x)

end Copies

/-! ## Layer 1: set convergence -/

section SetConvergence

variable {X : Type*} [TopologicalSpace X]

/-- The outer limit of a sequence of sets: the points every neighbourhood of which meets `C n` for
infinitely many `n`. -/
def outerLimit (C : ℕ → Set X) : Set X :=
  {x | ∀ U ∈ 𝓝 x, ∃ᶠ n in atTop, (C n ∩ U).Nonempty}

/-- The inner limit of a sequence of sets: the points every neighbourhood of which meets `C n` for
all large `n`. -/
def innerLimit (C : ℕ → Set X) : Set X :=
  {x | ∀ U ∈ 𝓝 x, ∀ᶠ n in atTop, (C n ∩ U).Nonempty}

/-- Painlevé–Kuratowski convergence of `C` to `D`: the outer limit is contained in `D` and `D` in
the inner limit, so that both limits equal `D`. -/
def TendstoPK (C : ℕ → Set X) (D : Set X) : Prop :=
  outerLimit C ⊆ D ∧ D ⊆ innerLimit C

/-- 1.1: both limits are closed, the inner limit lies in the outer limit, and neither changes
when every `C n` is replaced by its closure. -/
theorem isClosed_outerLimit_and_innerLimit (C : ℕ → Set X) :
    IsClosed (outerLimit C) ∧ IsClosed (innerLimit C) ∧ innerLimit C ⊆ outerLimit C ∧
      outerLimit (fun n => closure (C n)) = outerLimit C ∧
      innerLimit (fun n => closure (C n)) = innerLimit C := by
  sorry

/-- 1.1: in a first-countable space the outer limit consists of the limits of sequences taken
from a subsequence of the sets, and the inner limit of the limits of sequences taken from all but
finitely many of them. -/
theorem mem_outerLimit_iff_and_mem_innerLimit_iff [FirstCountableTopology X] (C : ℕ → Set X)
    (x : X) :
    (x ∈ outerLimit C ↔ ∃ φ : ℕ → ℕ, StrictMono φ ∧
        ∃ u : ℕ → X, (∀ k, u k ∈ C (φ k)) ∧ Tendsto u atTop (𝓝 x)) ∧
      (x ∈ innerLimit C ↔
        ∃ u : ℕ → X, (∀ᶠ n in atTop, u n ∈ C n) ∧ Tendsto u atTop (𝓝 x)) := by
  sorry

/-- 1.2: in a second-countable space every sequence of sets has a Painlevé–Kuratowski convergent
subsequence; the limit may be empty. -/
theorem exists_strictMono_tendstoPK [SecondCountableTopology X] (C : ℕ → Set X) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ D : Set X, TendstoPK (C ∘ φ) D := by
  sorry

/-- 1.3: in a proper metric space, a sequence of sets converges to a closed set exactly when the
extended distance functions converge pointwise; the distance to the empty set is `⊤`. -/
theorem tendstoPK_iff_tendsto_infEdist {M : Type*} [MetricSpace M] [ProperSpace M]
    {C : ℕ → Set M} {D : Set M} (hD : IsClosed D) :
    TendstoPK C D ↔ ∀ x : M,
      Tendsto (fun n => Metric.infEDist x (C n)) atTop (𝓝 (Metric.infEDist x D)) := by
  sorry

/-- 1.4: in a finite-dimensional inner product space, nonempty closed convex sets converge to a
nonempty closed convex set exactly when the nearest points to every `x` converge. -/
theorem tendstoPK_iff_tendsto_nearestPoint {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {C : ℕ → Set E} {D : Set E}
    (hC : ∀ n, IsClosed (C n) ∧ Convex ℝ (C n) ∧ (C n).Nonempty) (hD : IsClosed D)
    (hDc : Convex ℝ D) (hDn : D.Nonempty) :
    TendstoPK C D ↔ ∀ (x : E) (p : ℕ → E) (q : E),
      (∀ n, p n ∈ C n ∧ dist x (p n) = Metric.infDist x (C n)) → q ∈ D →
        dist x q = Metric.infDist x D → Tendsto p atTop (𝓝 q) := by
  sorry

end SetConvergence

/-! ## Layer 2: epi-convergence -/

section EpiConvergence

variable {X : Type*} [TopologicalSpace X]

/-- Epi-convergence: the real epigraphs `{p | f n p.1 ≤ p.2}` converge in the Painlevé–Kuratowski
sense to the real epigraph of `g`. -/
def EpiTendsto (f : ℕ → X → EReal) (g : X → EReal) : Prop :=
  TendstoPK (fun n => {p : X × ℝ | f n p.1 ≤ p.2}) {p : X × ℝ | g p.1 ≤ p.2}

/-- 2.1: in a first-countable space, epi-convergence is the conjunction of the liminf inequality
along every convergent sequence and the existence of recovery sequences. -/
theorem epiTendsto_iff [FirstCountableTopology X] {f : ℕ → X → EReal} {g : X → EReal} :
    EpiTendsto f g ↔
      (∀ (x : X) (u : ℕ → X), Tendsto u atTop (𝓝 x) →
          g x ≤ liminf (fun n => f n (u n)) atTop) ∧
        ∀ x : X, ∃ u : ℕ → X, Tendsto u atTop (𝓝 x) ∧
          limsup (fun n => f n (u n)) atTop ≤ g x := by
  sorry

/-- 2.1: in a second-countable space every sequence of functions has an epi-convergent
subsequence; the limit may take the values `⊥` and `⊤`. -/
theorem exists_strictMono_epiTendsto [SecondCountableTopology X] (f : ℕ → X → EReal) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ g : X → EReal, EpiTendsto (fun k => f (φ k)) g := by
  sorry

/-- 2.2: a nonincreasing sequence epi-converges to the lower semicontinuous hull of its infimum,
and a nondecreasing one to the supremum of the lower semicontinuous hulls. The hull of `h` at `x`
is `liminf h (𝓝 x)`. -/
theorem epiTendsto_of_antitone_and_of_monotone {f : ℕ → X → EReal} :
    (Antitone f → EpiTendsto f (fun x => liminf (fun y => ⨅ n, f n y) (𝓝 x))) ∧
      (Monotone f → EpiTendsto f (fun x => ⨆ n, liminf (f n) (𝓝 x))) := by
  sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- 2.3: convex functions epi-converge to a convex lower semicontinuous function whose domain has
nonempty interior exactly when they converge pointwise on a dense set. -/
theorem epiTendsto_iff_exists_dense_tendsto {f : ℕ → E → EReal} {g : E → EReal}
    (hf : ∀ n, Convex ℝ {p : E × ℝ | f n p.1 ≤ p.2}) (hg : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2})
    (hgl : LowerSemicontinuous g) (hint : (interior {x | g x ≠ ⊤}).Nonempty) :
    EpiTendsto f g ↔
      ∃ D : Set E, Dense D ∧ ∀ x ∈ D, Tendsto (fun n => f n x) atTop (𝓝 (g x)) := by
  sorry

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [FiniteDimensional ℝ H]

/-- 2.4, Wijsman's theorem: for proper closed convex functions on a Euclidean space,
epi-convergence is equivalent to epi-convergence of the conjugates. -/
theorem epiTendsto_fenchelConjugate_iff {f : ℕ → H → EReal} {g : H → EReal}
    (hf : ∀ n, Convex ℝ {p : H × ℝ | f n p.1 ≤ p.2} ∧ LowerSemicontinuous (f n) ∧
      (∀ x, f n x ≠ ⊥) ∧ ∃ x, f n x ≠ ⊤)
    (hg : Convex ℝ {p : H × ℝ | g p.1 ≤ p.2} ∧ LowerSemicontinuous g ∧ (∀ x, g x ≠ ⊥) ∧
      ∃ x, g x ≠ ⊤) :
    EpiTendsto f g ↔ EpiTendsto (fun n => fenchelConjugate (innerₗ H) (f n))
      (fenchelConjugate (innerₗ H) g) := by
  sorry

/-- 2.4, Attouch's theorem: for proper closed convex functions on a Euclidean space,
epi-convergence is equivalent to graphical convergence of the subdifferentials together with
convergence of the values along one convergent sequence of graph points. -/
theorem epiTendsto_iff_tendstoPK_graph_subdifferential {f : ℕ → H → EReal} {g : H → EReal}
    (hf : ∀ n, Convex ℝ {p : H × ℝ | f n p.1 ≤ p.2} ∧ LowerSemicontinuous (f n) ∧
      (∀ x, f n x ≠ ⊥) ∧ ∃ x, f n x ≠ ⊤)
    (hg : Convex ℝ {p : H × ℝ | g p.1 ≤ p.2} ∧ LowerSemicontinuous g ∧ (∀ x, g x ≠ ⊥) ∧
      ∃ x, g x ≠ ⊤) :
    EpiTendsto f g ↔
      TendstoPK (fun n => {p : H × H | p.2 ∈ subdifferential (innerₗ H) (f n) p.1})
          {p : H × H | p.2 ∈ subdifferential (innerₗ H) g p.1} ∧
        ∃ (x v : H) (u w : ℕ → H), v ∈ subdifferential (innerₗ H) g x ∧
          (∀ n, w n ∈ subdifferential (innerₗ H) (f n) (u n)) ∧ Tendsto u atTop (𝓝 x) ∧
          Tendsto w atTop (𝓝 v) ∧ Tendsto (fun n => f n (u n)) atTop (𝓝 (g x)) := by
  sorry

end EpiConvergence

/-! ## Layer 3: Clarke's generalized gradient -/

section Clarke

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Clarke's generalized directional derivative
`f°(x; v) = limsup_{y → x, t ↓ 0} (f (y + t v) - f y) / t`, valued in `EReal`. For `f` Lipschitz
near `x` it is finite (`clarkeDirDeriv_spec`). -/
def clarkeDirDeriv (f : E → ℝ) (x v : E) : EReal :=
  limsup (fun p : E × ℝ => (((f (p.1 + p.2 • v) - f p.1) / p.2 : ℝ) : EReal))
    (𝓝 x ×ˢ 𝓝[>] (0 : ℝ))

/-- Clarke's generalized gradient: the continuous linear functionals bounded above by the
generalized directional derivative. -/
def clarkeSubdiff (f : E → ℝ) (x : E) : Set (StrongDual ℝ E) :=
  {ζ | ∀ v, ((ζ v : ℝ) : EReal) ≤ clarkeDirDeriv f x v}

/-- 3.1: for `f` Lipschitz of rank `K` near `x`, `f°(x; ·)` is finite, bounded by `K ‖v‖`,
positively homogeneous, subadditive and `K`-Lipschitz; `(-f)°(x; v) = f°(x; -v)`; and `f°` is
upper semicontinuous jointly in the point and the direction. -/
theorem clarkeDirDeriv_spec {f : E → ℝ} {x : E} {K : ℝ≥0} {U : Set E} (hU : U ∈ 𝓝 x)
    (hf : LipschitzOnWith K f U) :
    ∃ φ : E → ℝ, (∀ v, clarkeDirDeriv f x v = φ v) ∧ (∀ v, |φ v| ≤ K * ‖v‖) ∧
      (∀ v (t : ℝ), 0 ≤ t → φ (t • v) = t * φ v) ∧ (∀ v w, φ (v + w) ≤ φ v + φ w) ∧
      LipschitzWith K φ ∧ (∀ v, clarkeDirDeriv (-f) x v = φ (-v)) ∧
      ∀ v, UpperSemicontinuousAt (fun p : E × E => clarkeDirDeriv f p.1 p.2) (x, v) := by
  sorry

/-- 3.1: for `f` Lipschitz of rank `K` near `x`, the generalized gradient is a nonempty convex
weak-star compact subset of the closed ball of radius `K`, and `f°(x; ·)` is its support
function, attained. -/
theorem clarkeSubdiff_spec {f : E → ℝ} {x : E} {K : ℝ≥0} {U : Set E} (hU : U ∈ 𝓝 x)
    (hf : LipschitzOnWith K f U) :
    (clarkeSubdiff f x).Nonempty ∧ Convex ℝ (clarkeSubdiff f x) ∧
      clarkeSubdiff f x ⊆ Metric.closedBall 0 K ∧
      IsCompact (StrongDual.toWeakDual '' clarkeSubdiff f x) ∧
      ∀ v, IsGreatest ((fun ζ : StrongDual ℝ E => ((ζ v : ℝ) : EReal)) '' clarkeSubdiff f x)
        (clarkeDirDeriv f x v) := by
  sorry

/-- 3.2: a Fréchet derivative of a function Lipschitz near `x` is a generalized gradient, and a
strict derivative is the only one. -/
theorem mem_clarkeSubdiff_of_hasFDerivAt_and_eq_of_hasStrictFDerivAt {f : E → ℝ} {x : E}
    {f' : StrongDual ℝ E} :
    ((∃ K : ℝ≥0, ∃ U ∈ 𝓝 x, LipschitzOnWith K f U) → HasFDerivAt f f' x →
        f' ∈ clarkeSubdiff f x) ∧
      (HasStrictFDerivAt f f' x → clarkeSubdiff f x = {f'}) := by
  sorry

/-- 3.2: for a real convex function continuous at `x`, the generalized gradient is the convex
subdifferential and the generalized directional derivative is the directional derivative. -/
theorem clarkeSubdiff_eq_subdifferential_of_convexOn {f : E → ℝ} (hf : ConvexOn ℝ univ f)
    {x : E} (hc : ContinuousAt f x) :
    clarkeSubdiff f x = subdifferential (topDualPairing ℝ E).flip (fun y => (f y : EReal)) x ∧
      ∀ v, clarkeDirDeriv f x v = dirDeriv (fun y => (f y : EReal)) x v := by
  sorry

/-- 3.3, Fermat's rule: at a local minimum or a local maximum, `0` is a generalized gradient. -/
theorem zero_mem_clarkeSubdiff {f : E → ℝ} {x : E} (h : IsLocalMin f x ∨ IsLocalMax f x) :
    0 ∈ clarkeSubdiff f x := by
  sorry

/-- 3.3, the sum rule: for functions Lipschitz near `x`, every generalized gradient of the sum is
a sum of generalized gradients. -/
theorem clarkeSubdiff_add_subset {f g : E → ℝ} {x : E}
    (hf : ∃ K : ℝ≥0, ∃ U ∈ 𝓝 x, LipschitzOnWith K f U)
    (hg : ∃ K : ℝ≥0, ∃ U ∈ 𝓝 x, LipschitzOnWith K g U) :
    clarkeSubdiff (f + g) x ⊆ clarkeSubdiff f x + clarkeSubdiff g x := by
  sorry

/-- 3.3, Lebourg's mean value theorem: for `f` Lipschitz on an open set containing the segment
`[x, y]`, some point `z` of the open segment carries a generalized gradient `ζ` with
`f y - f x = ζ (y - x)`. -/
theorem exists_mem_clarkeSubdiff_eq_sub {f : E → ℝ} {x y : E} {U : Set E} (hU : IsOpen U)
    (hxy : segment ℝ x y ⊆ U) {K : ℝ≥0} (hf : LipschitzOnWith K f U) :
    ∃ z ∈ openSegment ℝ x y, ∃ ζ ∈ clarkeSubdiff f z, f y - f x = ζ (y - x) := by
  sorry

/-- 3.4, the chain rule: for `F` strictly differentiable at `x` and `g` Lipschitz near `F x`, the
generalized gradient of `g ∘ F` lies in the image of that of `g` under the adjoint, with equality
when the derivative is surjective. -/
theorem clarkeSubdiff_comp_subset_and_eq [CompleteSpace E] {Y : Type*} [NormedAddCommGroup Y]
    [NormedSpace ℝ Y] [CompleteSpace Y] {F : E → Y} {A : E →L[ℝ] Y} {g : Y → ℝ} {x : E}
    (hF : HasStrictFDerivAt F A x) (hg : ∃ K : ℝ≥0, ∃ U ∈ 𝓝 (F x), LipschitzOnWith K g U) :
    clarkeSubdiff (g ∘ F) x ⊆ (fun ζ : StrongDual ℝ Y => ζ.comp A) '' clarkeSubdiff g (F x) ∧
      (Function.Surjective A →
        clarkeSubdiff (g ∘ F) x = (fun ζ : StrongDual ℝ Y => ζ.comp A) '' clarkeSubdiff g (F x)) := by
  sorry

/-- 3.4, the max rule: the generalized gradient of a finite maximum of functions strictly
differentiable at `x` is the convex hull of the derivatives of the active functions. -/
theorem clarkeSubdiff_iSup_eq_convexHull {ι : Type*} [Fintype ι] [Nonempty ι]
    {f : ι → E → ℝ} {f' : ι → StrongDual ℝ E} {x : E} (hf : ∀ i, HasStrictFDerivAt (f i) (f' i) x) :
    clarkeSubdiff (fun y => ⨆ i, f i y) x = convexHull ℝ (f' '' {i | f i x = ⨆ j, f j x}) := by
  sorry

/-- 3.5, Clarke's gradient formula: in finite dimension, for `f` Lipschitz near `x` and any
Haar-null set `S`, the generalized gradient is the convex hull of the limits of derivatives of `f`
along sequences tending to `x` through points of differentiability outside `S`. -/
theorem clarkeSubdiff_eq_convexHull_limits [FiniteDimensional ℝ E] [MeasurableSpace E]
    [BorelSpace E] (μ : Measure E) [μ.IsAddHaarMeasure] {f : E → ℝ} {x : E}
    (hf : ∃ K : ℝ≥0, ∃ U ∈ 𝓝 x, LipschitzOnWith K f U) {S : Set E} (hS : μ S = 0) :
    clarkeSubdiff f x = convexHull ℝ {ζ | ∃ u : ℕ → E, Tendsto u atTop (𝓝 x) ∧
      (∀ n, u n ∉ S ∧ DifferentiableAt ℝ f (u n)) ∧
      Tendsto (fun n => fderiv ℝ f (u n)) atTop (𝓝 ζ)} := by
  sorry

end Clarke

/-! ## Layer 4: metric regularity -/

section MetricRegularity

variable {X Y : Type*} [MetricSpace X] [MetricSpace Y]

/-- Metric regularity of `F` at `x₀` for `y₀ ∈ F x₀` with modulus `κ`: near `(x₀, y₀)`, the distance
from `x` to the solutions of `y ∈ F x'` is at most `κ` times the residual `d(y, F x)`. -/
def MetricallyRegularAt (F : X → Set Y) (x₀ : X) (y₀ : Y) (κ : ℝ≥0) : Prop :=
  y₀ ∈ F x₀ ∧ ∀ᶠ p in 𝓝 (x₀, y₀),
    Metric.infEDist p.1 {x | p.2 ∈ F x} ≤ κ * Metric.infEDist p.2 (F p.1)

/-- The Aubin property of `S` at `y₀` for `x₀ ∈ S y₀` with modulus `κ`: near `y₀`, every point of
`S y'` near `x₀` lies within `κ d(y', y)` of `S y`. -/
def HasAubinPropertyAt (S : Y → Set X) (y₀ : Y) (x₀ : X) (κ : ℝ≥0) : Prop :=
  x₀ ∈ S y₀ ∧ ∃ U ∈ 𝓝 x₀, ∃ V ∈ 𝓝 y₀, ∀ y ∈ V, ∀ y' ∈ V, ∀ x ∈ S y' ∩ U,
    Metric.infEDist x (S y) ≤ κ * edist y' y

/-- 4.1: for a positive modulus, metric regularity of `F` is the Aubin property of its inverse,
with the same modulus. -/
theorem metricallyRegularAt_iff_hasAubinPropertyAt {F : X → Set Y} {x₀ : X} {y₀ : Y}
    {κ : ℝ≥0} (hκ : 0 < κ) :
    MetricallyRegularAt F x₀ y₀ κ ↔ HasAubinPropertyAt (fun y => {x | y ∈ F x}) y₀ x₀ κ := by
  sorry

/-- 4.2, the Lyusternik–Graves perturbation theorem: on a complete metric space, adding to a
metrically regular map with locally closed graph a function with Lipschitz constant `μ < 1/κ`
keeps it metrically regular, with every modulus above `κ / (1 - κ μ)`. -/
theorem MetricallyRegularAt.add_lipschitzOnWith [CompleteSpace X] {G : Type*}
    [NormedAddCommGroup G] {F : X → Set G} {x₀ : X} {y₀ : G} {κ μ : ℝ≥0}
    (hF : MetricallyRegularAt F x₀ y₀ κ)
    (hcl : ∃ r > 0, IsClosed ({p : X × G | p.2 ∈ F p.1} ∩ Metric.closedBall (x₀, y₀) r))
    {g : X → G} {U : Set X} (hU : U ∈ 𝓝 x₀) (hg : LipschitzOnWith μ g U) (hκμ : κ * μ < 1)
    {κ' : ℝ≥0} (hκ' : κ / (1 - κ * μ) < κ') :
    MetricallyRegularAt (fun x => {y | y - g x ∈ F x}) x₀ (g x₀ + y₀) κ' := by
  sorry

/-- 4.2, the Lyusternik–Graves theorem: a function strictly differentiable at `x₀` on a Banach
space, whose derivative has a right inverse with bound `c`, is metrically regular at `x₀` with
every modulus `κ > c`. -/
theorem metricallyRegularAt_of_hasStrictFDerivAt {E F : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [CompleteSpace E] [NormedAddCommGroup F] [NormedSpace ℝ F] {f : E → F}
    {A : E →L[ℝ] F} {x₀ : E} (hf : HasStrictFDerivAt f A x₀) (A' : A.NonlinearRightInverse)
    {κ : ℝ≥0} (hκ : A'.nnnorm < κ) :
    MetricallyRegularAt (fun x => ({f x} : Set F)) x₀ (f x₀) κ := by
  sorry

/-- 4.3, the Robinson–Ursescu theorem: a map between Banach spaces with closed convex graph is
metrically regular at `x₀` for `y₀ ∈ F x₀` exactly when `y₀` is an interior point of its range. -/
theorem mem_interior_range_iff_exists_metricallyRegularAt {E F : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [CompleteSpace E] [NormedAddCommGroup F] [NormedSpace ℝ F]
    [CompleteSpace F] {T : E → Set F} (hcl : IsClosed {p : E × F | p.2 ∈ T p.1})
    (hcv : Convex ℝ {p : E × F | p.2 ∈ T p.1}) {x₀ : E} {y₀ : F} (h : y₀ ∈ T x₀) :
    y₀ ∈ interior (⋃ x, T x) ↔ ∃ κ : ℝ≥0, MetricallyRegularAt T x₀ y₀ κ := by
  sorry

/-- 4.4, Hoffman's error bound: for a real matrix `A` there is one constant `L` such that, for
every right-hand side `b` for which `A x ≤ b` is solvable, the distance from any `x` to the
solution set is at most `L` times the size of the violation `(A x - b)₊`. -/
theorem exists_infDist_le_mul_norm_posPart {m n : Type*} [Fintype m] [Fintype n]
    (A : Matrix m n ℝ) :
    ∃ L : ℝ, ∀ b : m → ℝ, {x : n → ℝ | A.mulVec x ≤ b}.Nonempty → ∀ x : n → ℝ,
      Metric.infDist x {x' : n → ℝ | A.mulVec x' ≤ b} ≤
        L * ‖fun i => max (A.mulVec x i - b i) 0‖ := by
  sorry

end MetricRegularity

/-! ## Layer 5: limiting normals, subgradients and coderivatives -/

section Limiting

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- The regular (Fréchet) normal cone of `C` at `x ∈ C`: the functionals `v` with
`v (y - x) ≤ o(‖y - x‖)` for `y ∈ C`. It is empty when `x ∉ C`. -/
def regularNormalCone (C : Set E) (x : E) : Set (StrongDual ℝ E) :=
  {v | x ∈ C ∧ ∀ ε > 0, ∀ᶠ y in 𝓝[C] x, v (y - x) ≤ ε * ‖y - x‖}

/-- The limiting (Mordukhovich) normal cone of `C` at `x ∈ C`: limits of regular normals at points
of `C` tending to `x`. -/
def limitingNormalCone (C : Set E) (x : E) : Set (StrongDual ℝ E) :=
  {v | x ∈ C ∧ ∃ u : ℕ → E, ∃ w : ℕ → StrongDual ℝ E,
    (∀ n, u n ∈ C ∧ w n ∈ regularNormalCone C (u n)) ∧ Tendsto u atTop (𝓝 x) ∧
      Tendsto w atTop (𝓝 v)}

/-- The regular (Fréchet) subdifferential of `f` at a point where `f` is finite:
`f y ≥ f x + v (y - x) - o(‖y - x‖)`. -/
def regularSubdiff (f : E → EReal) (x : E) : Set (StrongDual ℝ E) :=
  {v | f x ≠ ⊥ ∧ f x ≠ ⊤ ∧ ∀ ε > 0, ∀ᶠ y in 𝓝 x,
    f x + ((v (y - x) - ε * ‖y - x‖ : ℝ) : EReal) ≤ f y}

/-- The limiting (Mordukhovich) subdifferential: limits of regular subgradients at points
`u n → x` with `f (u n) → f x`. -/
def limitingSubdiff (f : E → EReal) (x : E) : Set (StrongDual ℝ E) :=
  {v | f x ≠ ⊥ ∧ f x ≠ ⊤ ∧ ∃ u : ℕ → E, ∃ w : ℕ → StrongDual ℝ E,
    (∀ n, w n ∈ regularSubdiff f (u n)) ∧ Tendsto u atTop (𝓝 x) ∧
      Tendsto (fun n => f (u n)) atTop (𝓝 (f x)) ∧ Tendsto w atTop (𝓝 v)}

/-- The horizon (singular) subdifferential: limits of `c n • w n` with `c n ↓ 0` and `w n`
regular subgradients at points `u n → x` with `f (u n) → f x`. -/
def horizonSubdiff (f : E → EReal) (x : E) : Set (StrongDual ℝ E) :=
  {v | f x ≠ ⊥ ∧ f x ≠ ⊤ ∧ ∃ u : ℕ → E, ∃ w : ℕ → StrongDual ℝ E, ∃ c : ℕ → ℝ,
    (∀ n, 0 < c n ∧ w n ∈ regularSubdiff f (u n)) ∧ Tendsto c atTop (𝓝 0) ∧
      Tendsto u atTop (𝓝 x) ∧ Tendsto (fun n => f (u n)) atTop (𝓝 (f x)) ∧
      Tendsto (fun n => c n • w n) atTop (𝓝 v)}

/-- The (limiting) coderivative of a set-valued map: `v ∈ D*F(x | y)(w)` when `(v, -w)` is a
limiting normal to the graph at `(x, y)`. -/
def coderivative {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    (F : E → Set E') (x : E) (y : E') (w : StrongDual ℝ E') : Set (StrongDual ℝ E) :=
  {v | v.coprod (-w) ∈ limitingNormalCone {p : E × E' | p.2 ∈ F p.1} (x, y)}

/-- 5.1: the regular normal cone is the polar of Mathlib's one-sided tangent cone, the limiting
normal cone is closed, and it contains the regular one. -/
theorem regularNormalCone_eq_polar_and_isClosed_limitingNormalCone {C : Set E} {x : E}
    (hx : x ∈ C) :
    regularNormalCone C x = {v | ∀ w ∈ posTangentConeAt C x, v w ≤ 0} ∧
      IsClosed (limitingNormalCone C x) ∧ regularNormalCone C x ⊆ limitingNormalCone C x := by
  sorry

/-- 5.1: for a convex set both cones are the normal cone of convex analysis. -/
theorem regularNormalCone_and_limitingNormalCone_eq_normalCone {C : Set E} (hC : Convex ℝ C)
    {x : E} (hx : x ∈ C) :
    regularNormalCone C x = normalCone C x ∧ limitingNormalCone C x = normalCone C x := by
  sorry

/-- 5.1, the intersection rule: for closed sets whose limiting normals at `x` admit no nonzero
opposite pair, the limiting normals to the intersection are sums of limiting normals. -/
theorem limitingNormalCone_inter_subset {C D : Set E} (hC : IsClosed C) (hD : IsClosed D) {x : E}
    (hx : x ∈ C ∩ D)
    (hq : ∀ v ∈ limitingNormalCone C x, -v ∈ limitingNormalCone D x → v = 0) :
    limitingNormalCone (C ∩ D) x ⊆ limitingNormalCone C x + limitingNormalCone D x := by
  sorry

/-- 5.2: the regular subdifferential of a function differentiable at `x` is its derivative, and
the limiting subdifferential of a function strictly differentiable at `x` is its derivative. -/
theorem regularSubdiff_eq_of_hasFDerivAt_and_limitingSubdiff_eq_of_hasStrictFDerivAt
    {f : E → ℝ} {f' : StrongDual ℝ E} {x : E} :
    (HasFDerivAt f f' x → regularSubdiff (fun y => (f y : EReal)) x = {f'}) ∧
      (HasStrictFDerivAt f f' x → limitingSubdiff (fun y => (f y : EReal)) x = {f'}) := by
  sorry

/-- 5.2: for a convex function that never takes `⊥`, at a point where it is finite, the regular
and the limiting subdifferential are the convex subdifferential. -/
theorem regularSubdiff_and_limitingSubdiff_eq_subdifferential {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) {x : E} (hx : f x ≠ ⊤) :
    regularSubdiff f x = subdifferential (topDualPairing ℝ E).flip f x ∧
      limitingSubdiff f x = subdifferential (topDualPairing ℝ E).flip f x := by
  sorry

/-- 5.2, Fermat's rule: at a local minimum where `f` is finite, `0` is a regular, hence a
limiting, subgradient. -/
theorem zero_mem_regularSubdiff_and_limitingSubdiff {f : E → EReal} {x : E} (hb : f x ≠ ⊥)
    (ht : f x ≠ ⊤) (h : IsLocalMin f x) :
    0 ∈ regularSubdiff f x ∧ 0 ∈ limitingSubdiff f x := by
  sorry

/-- 5.2: a function lower semicontinuous near `x` and finite at `x` is Lipschitz near `x` exactly
when its horizon subdifferential at `x` is `{0}`, and then its limiting subdifferential at `x` is
nonempty and compact. -/
theorem lipschitz_near_iff_horizonSubdiff_eq_zero {f : E → EReal} {x : E} (hb : f x ≠ ⊥)
    (ht : f x ≠ ⊤) (hl : ∀ᶠ y in 𝓝 x, LowerSemicontinuousAt f y) :
    ((∃ K : ℝ≥0, ∃ U ∈ 𝓝 x, ∃ g : E → ℝ, (∀ y ∈ U, f y = g y) ∧ LipschitzOnWith K g U) ↔
        horizonSubdiff f x = {0}) ∧
      (horizonSubdiff f x = {0} →
        (limitingSubdiff f x).Nonempty ∧ IsCompact (limitingSubdiff f x)) := by
  sorry

/-- 5.2: for `f` Lipschitz near `x`, Clarke's generalized gradient is the convex hull of the
limiting subdifferential. -/
theorem clarkeSubdiff_eq_convexHull_limitingSubdiff {f : E → ℝ} {x : E}
    (hf : ∃ K : ℝ≥0, ∃ U ∈ 𝓝 x, LipschitzOnWith K f U) :
    clarkeSubdiff f x = convexHull ℝ (limitingSubdiff (fun y => (f y : EReal)) x) := by
  sorry

/-- 5.3, the sum rule: for lower semicontinuous functions that never take `⊥`, finite at `x`,
whose horizon subgradients at `x` admit no nonzero opposite pair, the limiting and the horizon
subgradients of the sum are sums of those of the terms. -/
theorem limitingSubdiff_add_subset {f₁ f₂ : E → EReal} (h₁ : LowerSemicontinuous f₁)
    (h₂ : LowerSemicontinuous f₂) (hb₁ : ∀ y, f₁ y ≠ ⊥) (hb₂ : ∀ y, f₂ y ≠ ⊥) {x : E}
    (ht₁ : f₁ x ≠ ⊤) (ht₂ : f₂ x ≠ ⊤)
    (hq : ∀ v ∈ horizonSubdiff f₁ x, -v ∈ horizonSubdiff f₂ x → v = 0) :
    limitingSubdiff (f₁ + f₂) x ⊆ limitingSubdiff f₁ x + limitingSubdiff f₂ x ∧
      horizonSubdiff (f₁ + f₂) x ⊆ horizonSubdiff f₁ x + horizonSubdiff f₂ x := by
  sorry

/-- 5.3, the chain rule: for `g` lower semicontinuous, never `⊥` and finite at `F x`, and `F`
continuously differentiable near `x`, if no nonzero horizon subgradient of `g` at `F x` is
annihilated by the adjoint of the derivative, then the limiting and the horizon subgradients of
`g ∘ F` at `x` are images of those of `g` under the adjoint. -/
theorem limitingSubdiff_comp_subset {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [FiniteDimensional ℝ E'] {g : E' → EReal} (hg : LowerSemicontinuous g) (hb : ∀ y, g y ≠ ⊥)
    {F : E → E'} {x : E} (hF : ContDiffAt ℝ 1 F x) (ht : g (F x) ≠ ⊤)
    (hq : ∀ y ∈ horizonSubdiff g (F x), y.comp (fderiv ℝ F x) = 0 → y = 0) :
    limitingSubdiff (g ∘ F) x ⊆
        (fun y : StrongDual ℝ E' => y.comp (fderiv ℝ F x)) '' limitingSubdiff g (F x) ∧
      horizonSubdiff (g ∘ F) x ⊆
        (fun y : StrongDual ℝ E' => y.comp (fderiv ℝ F x)) '' horizonSubdiff g (F x) := by
  sorry

/-- 5.4, the extremal principle: if two closed sets meeting at `x` can be pulled apart near `x`
by arbitrarily small translations of one of them, they have a nonzero common limiting normal of
opposite signs at `x`. -/
theorem exists_ne_zero_mem_limitingNormalCone_of_extremal {C D : Set E} (hC : IsClosed C)
    (hD : IsClosed D) {x : E} (hx : x ∈ C ∩ D) {U : Set E} (hU : U ∈ 𝓝 x) {a : ℕ → E}
    (ha : Tendsto a atTop (𝓝 0)) (hsep : ∀ᶠ k in atTop, (fun c => c - a k) '' C ∩ D ∩ U = ∅) :
    ∃ v ≠ 0, v ∈ limitingNormalCone C x ∧ -v ∈ limitingNormalCone D x := by
  sorry

/-- 5.4, the Mordukhovich criterion: a set-valued map between finite-dimensional spaces whose
graph is locally closed at `(x₀, y₀)` is metrically regular there exactly when its coderivative
has trivial kernel. -/
theorem exists_metricallyRegularAt_iff_coderivative {E' : Type*} [NormedAddCommGroup E']
    [NormedSpace ℝ E'] [FiniteDimensional ℝ E'] {F : E → Set E'} {x₀ : E} {y₀ : E'}
    (hy₀ : y₀ ∈ F x₀)
    (hcl : ∃ r > 0, IsClosed ({p : E × E' | p.2 ∈ F p.1} ∩ Metric.closedBall (x₀, y₀) r)) :
    (∃ κ : ℝ≥0, MetricallyRegularAt F x₀ y₀ κ) ↔
      ∀ w : StrongDual ℝ E', (0 : StrongDual ℝ E) ∈ coderivative F x₀ y₀ w → w = 0 := by
  sorry

end Limiting

end TauCetiRoadmap.VariationalAnalysisAndMetricRegularity

/-! ## Suppliers named in the README -/

#check @TauCeti.subdifferential
#check @TauCeti.fenchelConjugate
#check @LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist
#check @topDualPairing
#check @posTangentConeAt
#check @Metric.infEDist
#check @Metric.hausdorffEDist
#check @Metric.infDist
#check @StrongDual.toWeakDual
#check @ContinuousLinearMap.NonlinearRightInverse
#check @ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse
#check @HasStrictFDerivAt.approximates_deriv_on_nhds
#check @LipschitzWith.ae_differentiableAt
#check @LipschitzOnWith.ae_differentiableWithinAt
#check @ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective
#check @UpperHemicontinuous
#check @LowerHemicontinuous
#check @ConvexOn.locallyLipschitzOn_interior
#check @HasStrictFDerivAt.exists_lipschitzOnWith
#check @UpperSemicontinuousAt
#check @IsLocalMin.hasFDerivAt_eq_zero
#check @norm_eq_iInf_iff_real_inner_le_zero
#check @BaireSpace
#check @Filter.Eventually
#check @Filter.Frequently
#check @Filter.liminf
#check @Filter.limsup
#check @Matrix.mulVec
#check @MeasureTheory.Measure.IsAddHaarMeasure
#check @TopologicalSpace.exists_countable_basis
#check @WeakDual.isCompact_polar
#check @convexHull_eq_union
#check @exists_extension_of_le_sublinear
