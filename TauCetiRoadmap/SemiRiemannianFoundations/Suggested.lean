module

public import Mathlib
public import TauCeti.Geometry.Manifold.VectorBundle.NondegenerateMetric.Basic

/-!
# Semi-Riemannian foundations: target signatures

`README.md` is the roadmap; this file is not the roadmap. It gives the definitions that the
roadmap's statable theorems need, against the pinned Mathlib and Tau Ceti:

* the vector characters of a real bilinear form of any signature (§1.1);
* the metric carrier `ContMDiffNondegenerateMetric k` of §2.2 at regularity `k`, its
  strongness predicate, and the reading of a smooth metric as Tau Ceti's;
* extensions and `C^l`-inextendibility of a metric of any signature (§2.7);

and states three theorems about them:

* a strong metric of class `C^{l+1}`, `l ≤ ∞`, on a manifold modelled on a Banach space has a
  torsion-free compatible covariant derivative of class `C^l` (§2.4);
* two torsion-free covariant derivatives compatible with a metric of any class, strong or weak,
  agree on vector fields differentiable at the base point (§2.4);
* for a connected second-countable manifold without boundary, `C^l`-inextendibility needs to
  exclude only second-countable extensions (§2.7).

Not statable at the pins:

* the single geodesic flow and exponential map of a connection with locally Lipschitz
  coefficients on a Banach manifold (§3.2–§3.3): Tau Ceti's covariant acceleration
  `CovariantDerivative.accelerationWithin` and its Christoffel maps of a connection assume a
  finite-dimensional model, so a Banach manifold has no geodesic predicate and no coefficient
  field to be locally Lipschitz;
* the `C^{1,1}` Gauss lemma (§3.4): it is a statement about the exponential map of a `C^{1,1}`
  metric of any signature, and the exponential maps of a metric at the pins are Tau Ceti's
  Riemannian ones, such as `TauCeti.Manifold.riemannianExp`, of smooth positive-definite metrics;
* the Gauss–Codazzi–Ricci equations of a nondegenerate immersion (§4.1): Tau Ceti's second
  fundamental form is that of a map into an inner-product space, and there is none for an
  immersion into a manifold with a nondegenerate metric;
* Jacobi fields and index forms on Banach manifolds (§5.1): Tau Ceti's
  `CovariantDerivative.alongCurveWithin` and `CovariantDerivative.curvatureTensor` assume a
  finite-dimensional model, and its Jacobi fields are those of a Riemannian metric.

The carrier `ContMDiffNondegenerateMetric k` is the metric of §2.2 at regularity `k`: Tau Ceti's
`TauCeti.Manifold.ContMDiffNondegenerateMetric` is the smooth case and has no regularity
parameter at the pin, and `ContMDiffNondegenerateMetric.toSmoothMetric` reads a smooth metric
as Tau Ceti's, so that its Levi-Civita connection is available.
-/

@[expose] public section

noncomputable section

open Bundle Set
open scoped Manifold ContDiff

universe u

namespace TauCetiRoadmap.SemiRiemannianFoundations

/-! ## Layer 1: scalar products and finite signature -/

section Linear

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- **§1.1.** A timelike vector: `b v v < 0`. -/
def IsTimelike (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := b v v < 0

/-- **§1.1.** A null (lightlike) vector: `b v v = 0` and `v ≠ 0`. -/
def IsNull (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := b v v = 0 ∧ v ≠ 0

/-- **§1.1.** A causal vector: timelike or null. The zero vector is not causal. -/
def IsCausal (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := IsTimelike b v ∨ IsNull b v

end Linear

/-! ## Layer 2: local bundle calculus and metric pairings -/

section Manifold

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type u} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- **§2.2.** A symmetric nondegenerate metric of class `C^k` on `TM`: a `C^k` section of the
bundle of continuous bilinear forms on the tangent spaces whose value at every point is
symmetric and nondegenerate (injective as a map to the continuous dual). The manifold may have
boundary or corners; neither the dimension nor the signature is prescribed, and in infinite
dimensions nondegeneracy does not give a continuous inverse. -/
structure ContMDiffNondegenerateMetric (k : ℕ∞ω := ∞) where
  /-- The `C^k` section of continuous bilinear forms. -/
  toContMDiffSection :
    Cₛ^k⟮I; E →L[ℝ] E →L[ℝ] ℝ,
      fun x : M ↦ TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ⟯
  /-- The form in every fibre is symmetric. -/
  symm (x : M) : (toContMDiffSection x).toBilinForm.IsSymm
  /-- The form in every fibre is nondegenerate. -/
  nondegenerate (x : M) : (toContMDiffSection x).toBilinForm.Nondegenerate

namespace ContMDiffNondegenerateMetric

variable {k : ℕ∞ω}

/-- A metric is evaluated pointwise as its continuous bilinear form. -/
instance : CoeFun (ContMDiffNondegenerateMetric (I := I) (M := M) k) fun _ ↦
    (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ where
  coe g := g.toContMDiffSection

/-- **§2.2.** A metric of class `C^k` with `∞ ≤ k`, read as Tau Ceti's smooth nondegenerate
metric (same field, symmetry and nondegeneracy). -/
def toSmoothMetric (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) (hk : ∞ ≤ k) :
    TauCeti.Manifold.ContMDiffNondegenerateMetric (I := I) (M := M) where
  toContMDiffSection := ⟨fun x ↦ g x, g.toContMDiffSection.contMDiff.of_le hk⟩
  symm := g.symm
  nondegenerate := g.nondegenerate

/-- **§2.2.** A metric is strong when its flat map at every point, the metric itself read as a
continuous linear map into the continuous dual, is a continuous linear isomorphism. -/
def IsStrong (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) : Prop :=
  ∀ x, (g x).IsInvertible

/-- **§2.4.** The Levi-Civita theorem at finite regularity on a Banach manifold: a strong
symmetric nondegenerate metric `g` of class `C^{l+1}`, `l ≤ ∞`, on a smooth manifold (boundary and
corners allowed) modelled on a Banach space has a covariant derivative `∇` on `TM` of class `C^l`
that is torsion free, `∇_X Y − ∇_Y X = [X, Y]`, and compatible with `g`,
`v (g(Y, Z)) = g(∇_v Y, Z) + g(Y, ∇_v Z)`, on vector fields differentiable at the base point.
Torsion is written with the Lie bracket because Mathlib's torsion tensor assumes a
finite-dimensional model. -/
theorem exists_leviCivitaConnection [CompleteSpace E] {l : ℕ∞ω} (hl : l ≤ ∞)
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) (l + 1)) (hg : g.IsStrong) :
    ∃ cov : CovariantDerivative I E (fun x : M ↦ TangentSpace I x),
      CovariantDerivative.ContMDiffCovariantDerivative cov l ∧
      (∀ ⦃X Y : Π x : M, TangentSpace I x⦄ ⦃x : M⦄, MDiffAt (T% X) x → MDiffAt (T% Y) x →
        cov Y x (X x) - cov X x (Y x) = VectorField.mlieBracket I X Y x) ∧
      (∀ ⦃Y Z : Π x : M, TangentSpace I x⦄ ⦃x : M⦄, MDiffAt (T% Y) x → MDiffAt (T% Z) x →
        ∀ v : TangentSpace I x,
          mfderiv I 𝓘(ℝ) (fun y ↦ g y (Y y) (Z y)) x v =
            g x (cov Y x v) (Z x) + g x (Y x) (cov Z x v)) := by
  sorry

/-- **§2.4.** Uniqueness of the Levi-Civita connection from nondegeneracy alone: two covariant
derivatives on `TM` that are torsion free and compatible with a symmetric nondegenerate metric `g`
of any class, strong or weak, in the sense of `exists_leviCivitaConnection`, agree on every vector
field differentiable at the base point. By the Koszul formula, `2 g(∇_X Y, Z)` at that point is
determined by `g` and the fields; fields constant in the trivialization there take every value at
the point, and `g x` is injective. -/
theorem leviCivitaConnection_unique (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    {cov cov' : CovariantDerivative I E (fun x : M ↦ TangentSpace I x)}
    (htor : ∀ ⦃X Y : Π x : M, TangentSpace I x⦄ ⦃x : M⦄, MDiffAt (T% X) x → MDiffAt (T% Y) x →
      cov Y x (X x) - cov X x (Y x) = VectorField.mlieBracket I X Y x)
    (htor' : ∀ ⦃X Y : Π x : M, TangentSpace I x⦄ ⦃x : M⦄, MDiffAt (T% X) x → MDiffAt (T% Y) x →
      cov' Y x (X x) - cov' X x (Y x) = VectorField.mlieBracket I X Y x)
    (hcomp : ∀ ⦃Y Z : Π x : M, TangentSpace I x⦄ ⦃x : M⦄, MDiffAt (T% Y) x → MDiffAt (T% Z) x →
      ∀ v : TangentSpace I x, mfderiv I 𝓘(ℝ) (fun y ↦ g y (Y y) (Z y)) x v =
        g x (cov Y x v) (Z x) + g x (Y x) (cov Z x v))
    (hcomp' : ∀ ⦃Y Z : Π x : M, TangentSpace I x⦄ ⦃x : M⦄, MDiffAt (T% Y) x → MDiffAt (T% Z) x →
      ∀ v : TangentSpace I x, mfderiv I 𝓘(ℝ) (fun y ↦ g y (Y y) (Z y)) x v =
        g x (cov' Y x v) (Z x) + g x (Y x) (cov' Z x v))
    {Y : Π x : M, TangentSpace I x} {x : M} (hY : MDiffAt (T% Y) x) (v : TangentSpace I x) :
    cov Y x v = cov' Y x v := by
  sorry

/-- **§2.7.** An extension of `(M, g)` of class `C^l`, at any signature: a smooth embedding `ι`
into a manifold `M'` with the same model, carrying a nondegenerate metric `g'` of class `C^l`,
such that `g'` pulls back to `g` and `ι` is not surjective. -/
structure IsExtension [FiniteDimensional ℝ E] {k l : ℕ∞ω}
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    {M' : Type*} [TopologicalSpace M'] [ChartedSpace H M'] [IsManifold I ∞ M']
    (g' : ContMDiffNondegenerateMetric (I := I) (M := M') l) (ι : M → M') : Prop where
  isSmoothEmbedding : Manifold.IsSmoothEmbedding I I ∞ ι
  apply_mfderiv (x : M) (v w : TangentSpace I x) :
    g' (ι x) (mfderiv I I ι x v) (mfderiv I I ι x w) = g x v w
  range_ne_univ : range ι ≠ univ

/-- **§2.7.** `(M, g)` is `C^l`-inextendible: it has no extension of class `C^l` into a connected
Hausdorff manifold of the same universe and model. -/
def IsInextendible [FiniteDimensional ℝ E] {k : ℕ∞ω} (l : ℕ∞ω)
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) : Prop :=
  ∀ (M' : Type u) [TopologicalSpace M'] [ChartedSpace H M'] [IsManifold I ∞ M']
    [T2Space M'] [ConnectedSpace M']
    (g' : ContMDiffNondegenerateMetric (I := I) (M := M') l) (ι : M → M'),
    ¬ g.IsExtension g' ι

/-- **§2.7.** For a connected second-countable manifold without boundary, `C^l`-inextendibility
is inextendibility among second-countable extensions: an extension restricts to the union of
the image with a connected chart neighbourhood of a point of its frontier. -/
theorem isInextendible_iff_forall_secondCountable [FiniteDimensional ℝ E] [I.Boundaryless]
    [SecondCountableTopology M] [ConnectedSpace M] (l : ℕ∞ω)
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) :
    g.IsInextendible l ↔
      ∀ (M' : Type u) [TopologicalSpace M'] [ChartedSpace H M'] [IsManifold I ∞ M']
        [T2Space M'] [ConnectedSpace M'] [SecondCountableTopology M']
        (g' : ContMDiffNondegenerateMetric (I := I) (M := M') l) (ι : M → M'),
        ¬ g.IsExtension g' ι := by
  sorry

end ContMDiffNondegenerateMetric

end Manifold

end TauCetiRoadmap.SemiRiemannianFoundations
