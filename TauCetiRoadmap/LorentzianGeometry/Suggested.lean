module

public import Mathlib
public import TauCeti.Geometry.Manifold.VectorBundle.NondegenerateMetric.Signature
public import TauCeti.Geometry.Manifold.VectorBundle.NondegenerateMetric.Musical
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Nondegenerate.Existence
public import TauCeti.Geometry.Manifold.PiecewisePath

/-!
# Semi-Riemannian foundations and Lorentzian causality: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Stated here: arbitrary-signature and Lorentzian scalar-product predicates and causal
characters (§F0.1, §C0.1), the timelike-cone theorems (§C0.2), a null hyperplane (§F0.2),
the regularity-graded nondegenerate metric carrier, its signature predicates and its smooth
identification with Tau Ceti's
`TauCeti.Manifold.ContMDiffNondegenerateMetric` (§F1.2), `C^k`-extensions (§F1.7), time
orientations and time-oriented metrics (§C2.1), causal curves and the causal relations (§C2.2,
§C2.3), null hypersurfaces and optical functions (§C3.2), and the global-hyperbolicity and
Cauchy-surface definitions with Geroch's theorem (§C6), and conformal transport of time
orientations, causal relations and global causal predicates (§C2.4, §C6.5). The inverse metric, optical
functions, null hypersurfaces and extension definitions use the shared carrier at every
signature. The prose milestones concern finite and smooth orders `k ≤ ∞` on smooth manifolds.
The pairing carrier and strong musical inverse use arbitrary normed model spaces; local
ODE existence uses Banach completeness. Finite-dimensional hypotheses enter explicitly
for signature classification, extensions and the Lorentzian causal specialization.

The local `ContMDiffNondegenerateMetric k` prototypes the regularity generalization of
the imported smooth carrier, which has no regularity parameter at the pinned revision.
Its smooth comparison maps use that existing implementation. In Tau Ceti, generalize the
existing carrier and preserve its smooth interface; this prototype does not specify a
second permanent metric carrier. `LorentzianMetric` is only its index-one subtype.
`IsStrong` uses native continuous-linear invertibility on the same carrier. Weak metrics
can be paired with a supplied compatible connection, with the representation condition
and uniqueness specified in §F1.4. The coefficient ODE signatures below test §F2.2's local
Banach existence and uniqueness interface; they do not introduce another manifold geodesic.

Not stated here: the `C^{k,α}` predicate of §F1.3 (it is a chartwise Hölder condition whose
exact form follows the PDE roadmap's `C^{k,α}_loc`), the low-regularity Levi-Civita
connection and curvature of §F1.4 and §F1.5 (connection regularity uses the existing
`ContMDiffCovariantDerivative`; the finite-order Levi-Civita and curvature constructions
are targets), and the full geodesic, time-separation and Jacobi interfaces of §F2, §C5 and §F4, which
are generalizations of the existing Riemannian APIs. The local bundle and curvature
generalizations of §F1.1 use native `IsCovariantDerivativeOn` and continuous multilinear
maps; their full finite-regularity interfaces, as well as the bi-Lipschitz exponential and
normal-neighbourhood targets of §F2.4, are specified in the README. Smooth flow is a
regularity theorem about the single locally Lipschitz flow of §F2.2. Curve domains require
`a < b`, and §F2.1 distinguishes admissible reparametrizations and geodesic images.
The optical-function predicate at a corner does not assert a foliation there; that theorem
uses the separate boundary-stratum conditions of §C3.2.
-/

@[expose] public section

noncomputable section

open Bundle Set Filter MeasureTheory
open scoped Manifold ContDiff Topology

universe u

namespace TauCetiRoadmap.LorentzianGeometry

/-! ## §F0 and §C0: scalar products and Lorentzian cones -/

section Linear

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- **§F0.1.** A symmetric nondegenerate scalar product of signature `(p, q)`, with
`p` positive and `q` negative directions. -/
def HasSignature (b : LinearMap.BilinForm ℝ V) (p q : ℕ) : Prop :=
  b.IsSymm ∧ b.Nondegenerate ∧ sigPos b.toQuadraticMap = p ∧ sigNeg b.toQuadraticMap = q

/-- **§C0.1.** A Lorentzian scalar product: a symmetric nondegenerate real bilinear form of
index one, the index being Mathlib's negative inertia index `sigNeg`. -/
def IsLorentzian (b : LinearMap.BilinForm ℝ V) : Prop :=
  b.IsSymm ∧ b.Nondegenerate ∧ sigNeg b.toQuadraticMap = 1

/-- A timelike vector: `b v v < 0`. -/
def IsTimelike (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := b v v < 0

/-- A null (lightlike) vector: `b v v = 0` and `v ≠ 0`. -/
def IsNull (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := b v v = 0 ∧ v ≠ 0

/-- A causal vector: timelike or null. The zero vector is not causal. -/
def IsCausal (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := IsTimelike b v ∨ IsNull b v

/-- A spacelike vector: `0 < b v v` or `v = 0` (O'Neill's convention). -/
def IsSpacelike (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := 0 < b v v ∨ v = 0

/-- The timelike cone containing a timelike vector `v`. -/
def timeCone (b : LinearMap.BilinForm ℝ V) (v : V) : Set V :=
  {w | IsTimelike b w ∧ b v w < 0}

variable [FiniteDimensional ℝ V]

/-- **§F0.1, arbitrary-signature normal form.** Negative coordinates come first. -/
theorem hasSignature_iff_exists_basis (b : LinearMap.BilinForm ℝ V) (p q : ℕ) :
    HasSignature b p q ↔ ∃ e : Module.Basis (Fin (p + q)) ℝ V,
      ∀ i j, b (e i) (e j) = if i = j then (if i.val < q then -1 else 1) else 0 := by
  sorry

/-- **§C0.1, normal form.** A form is Lorentzian iff some basis is `η`-orthonormal with
`η = diag(-1, 1, …, 1)`. -/
theorem isLorentzian_iff_exists_basis (b : LinearMap.BilinForm ℝ V) :
    IsLorentzian b ↔ ∃ (n : ℕ) (e : Module.Basis (Fin (n + 1)) ℝ V),
      ∀ i j, b (e i) (e j) = if i = j then (if i = 0 then -1 else 1) else 0 := by
  sorry

/-- **§C0.2 (c).** On the orthogonal complement of a timelike vector a Lorentzian form is
positive definite. -/
theorem IsLorentzian.pos_of_mem_orthogonal {b : LinearMap.BilinForm ℝ V} (hb : IsLorentzian b)
    {v : V} (hv : IsTimelike b v) {w : V} (hw : b v w = 0) (hw0 : w ≠ 0) : 0 < b w w := by
  sorry

/-- **§C0.2, reverse Cauchy–Schwarz.** For timelike `v`, `b(v,v) b(w,w) ≤ b(v,w)²`, with
equality iff `v, w` are linearly dependent. -/
theorem IsLorentzian.mul_le_sq {b : LinearMap.BilinForm ℝ V} (hb : IsLorentzian b)
    {v : V} (hv : IsTimelike b v) (w : V) : b v v * b w w ≤ b v w ^ 2 := by
  sorry

/-- **§C0.2 (a), (b).** The timelike vectors are the disjoint union of the cone of `v` and
its negative, and the cone is convex. -/
theorem IsLorentzian.setOf_isTimelike_eq {b : LinearMap.BilinForm ℝ V} (hb : IsLorentzian b)
    {v : V} (hv : IsTimelike b v) :
    {w | IsTimelike b w} = timeCone b v ∪ timeCone b (-v) ∧
      Disjoint (timeCone b v) (timeCone b (-v)) ∧ Convex ℝ (timeCone b v) := by
  sorry

/-- **§F0.2, a null hyperplane in any signature.** For a nonzero covector `ξ`, the
hyperplane `ker ξ` is degenerate for `b` iff `ξ^♯` is null, and then `ξ^♯ ∈ ker ξ`. -/
theorem not_nondegenerate_restrict_ker_iff {b : LinearMap.BilinForm ℝ V}
    (hs : b.IsSymm) (hb : b.Nondegenerate) {ξ : Module.Dual ℝ V} (hξ : ξ ≠ 0) :
    ¬ (b.restrict (LinearMap.ker ξ)).Nondegenerate ↔
      IsNull b ((b.toDual hb).symm ξ) := by
  sorry

end Linear

/-- **§C0.1, the Minkowski model.** On `ℝ × E`, `-(t s) + ⟪x, y⟫`. Its quadratic form is the
negative of the opposite-signature square `t² − ‖x‖²` used by HyperbolicGeometry. -/
def minkowskiForm (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E] :
    LinearMap.BilinForm ℝ (ℝ × E) :=
  LinearMap.mk₂ ℝ (fun v w ↦ -(v.1 * w.1) + inner ℝ v.2 w.2)
    (by intros; simp [inner_add_left]; ring) (by intros; simp [inner_smul_left]; ring)
    (by intros; simp [inner_add_right]; ring) (by intros; simp [inner_smul_right]; ring)

theorem minkowskiForm_self (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (v : ℝ × E) : minkowskiForm E v v = -(v.1 ^ 2 - ‖v.2‖ ^ 2) := by
  sorry

theorem isLorentzian_minkowskiForm (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] : IsLorentzian (minkowskiForm E) := by
  sorry

/-! ## §F2.2: local coefficient ODE in Banach spaces -/

section CoefficientODE

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The connection geodesic ODE in a chart, with state `(position, velocity)`. -/
def geodesicRHS (Γ : E → E →L[ℝ] E →L[ℝ] E) (z : E × E) : E × E :=
  (z.2, -(Γ z.1 z.2 z.2))

/-- Locally Lipschitz connection coefficients give a locally Lipschitz ODE. -/
theorem locallyLipschitz_geodesicRHS (Γ : E → E →L[ℝ] E →L[ℝ] E)
    (hΓ : LocallyLipschitz Γ) : LocallyLipschitz (geodesicRHS Γ) := by
  sorry

/-- Local existence is a Banach Picard–Lindelöf statement, independent of any metric. -/
theorem exists_geodesicState [CompleteSpace E] (Γ : E → E →L[ℝ] E →L[ℝ] E)
    (hΓ : LocallyLipschitz Γ) (z₀ : E × E) :
    ∃ ε : ℝ, 0 < ε ∧ ∃ z : ℝ → E × E, z 0 = z₀ ∧
      ∀ t ∈ Ioo (-ε) ε, HasDerivAt z (geodesicRHS Γ (z t)) t := by
  sorry

/-- Uniqueness is separate from the geodesic predicate and requires coefficient control. -/
theorem geodesicState_eqOn (Γ : E → E →L[ℝ] E →L[ℝ] E)
    (hΓ : LocallyLipschitz Γ) {a b : ℝ} (ha : a < 0) (hb : 0 < b)
    {z w : ℝ → E × E} (hz : ∀ t ∈ Ioo a b, HasDerivAt z (geodesicRHS Γ (z t)) t)
    (hw : ∀ t ∈ Ioo a b, HasDerivAt w (geodesicRHS Γ (w t)) t)
    (h₀ : z 0 = w 0) : EqOn z w (Ioo a b) := by
  sorry

end CoefficientODE

/-! ## §F1: shared metrics; §C1–§C3: Lorentzian and null specializations -/

section Manifold

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type u} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- **§F1.2.** Prototype of the regularity extension of Tau Ceti's existing nondegenerate
metric carrier. Generalize that carrier in place; omitted regularity retains its smooth API.
The manifold may have boundary or corners. Neither dimension nor signature is prescribed;
nondegeneracy alone does not supply a continuous inverse in infinite dimensions. -/
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

instance : CoeFun (ContMDiffNondegenerateMetric (I := I) (M := M) k) fun _ ↦
    (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ where
  coe g := g.toContMDiffSection

/-- **§F1.2.** Strong nondegeneracy: the metric map to the continuous dual is invertible. -/
def IsStrong (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) : Prop :=
  ∀ x, (g x).IsInvertible

/-- **§F1.2.** A strong metric supplies a continuous sharp map. -/
def sharp (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    (_hg : g.IsStrong) (x : M) :
    (TangentSpace I x →L[ℝ] ℝ) →L[ℝ] TangentSpace I x := (g x).inverse

/-- The inverse recovers a covector after applying the metric map. -/
theorem flat_sharp (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    (hg : g.IsStrong) (x : M) (ξ : TangentSpace I x →L[ℝ] ℝ) :
    g x (g.sharp hg x ξ) = ξ := (hg x).self_apply_inverse ξ

/-- The inverse recovers a vector after applying the metric map. -/
theorem sharp_flat (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    (hg : g.IsStrong) (x : M) (v : TangentSpace I x) :
    g.sharp hg x (g x v) = v := (hg x).inverse_apply_self v

/-- **§F1.2.** Finite-dimensional nondegeneracy automatically implies strongness. -/
theorem isStrong_of_finiteDimensional [FiniteDimensional ℝ E]
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) : g.IsStrong := by
  intro x
  exact ContinuousLinearMap.isInvertible_of_separatingLeft (E := E) (g.nondegenerate x).1

/-- **§F1.2, §C3.2.** The inverse metric uses the continuous sharp map at any dimension. -/
def inverseApply (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    (hg : g.IsStrong) (x : M) (ξ : TangentSpace I x →L[ℝ] ℝ) : ℝ :=
  g x (g.sharp hg x ξ) (g.sharp hg x ξ)

/-- **§C2.4.** A positive continuous conformal relation on the common metric carrier. -/
structure IsConformal {k l : ℕ∞ω}
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    (h : ContMDiffNondegenerateMetric (I := I) (M := M) l) (Ω : M → ℝ) : Prop where
  continuous : Continuous Ω
  pos (x : M) : 0 < Ω x
  apply (x : M) (v w : TangentSpace I x) : h x v w = (Ω x) ^ 2 * g x v w

/-- **§F1.2.** Lowering regularity preserves the same underlying metric field. -/
def ofLE {l : ℕ∞ω} (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) (h : l ≤ k) :
    ContMDiffNondegenerateMetric (I := I) (M := M) l where
  toContMDiffSection := ⟨fun x ↦ g x, g.toContMDiffSection.contMDiff.of_le h⟩
  symm := g.symm
  nondegenerate := g.nondegenerate

/-- **§F1.2.** Fixed signature is a predicate on the common carrier. -/
def HasSignature (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) (p q : ℕ) : Prop :=
  ∀ x, TauCetiRoadmap.LorentzianGeometry.HasSignature (g x).toBilinForm p q

/-- **§C1.1.** Index one is a predicate on the common carrier. -/
def IsLorentzian (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) : Prop :=
  ∀ x, TauCetiRoadmap.LorentzianGeometry.IsLorentzian (g x).toBilinForm

/-- **§F1.2, smooth identification.** Use the imported smooth implementation. -/
def toSmoothMetric (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) (hk : ∞ ≤ k) :
    TauCeti.Manifold.ContMDiffNondegenerateMetric (I := I) (M := M) where
  toContMDiffSection := ⟨fun x ↦ g x, g.toContMDiffSection.contMDiff.of_le hk⟩
  symm := g.symm
  nondegenerate := g.nondegenerate

/-- **§F1.2.** Read the existing smooth metric in the generalized carrier. -/
def ofSmoothMetric (g : TauCeti.Manifold.ContMDiffNondegenerateMetric (I := I) (M := M)) :
    ContMDiffNondegenerateMetric (I := I) (M := M) ∞ where
  toContMDiffSection := g.toContMDiffSection
  symm := g.symm
  nondegenerate := g.nondegenerate

theorem toSmoothMetric_ofSmoothMetric
    (g : TauCeti.Manifold.ContMDiffNondegenerateMetric (I := I) (M := M)) :
    (ofSmoothMetric g).toSmoothMetric le_rfl = g := by
  sorry

theorem ofSmoothMetric_toSmoothMetric
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) ∞) :
    ofSmoothMetric (g.toSmoothMetric le_rfl) = g := by
  sorry

/-- **§C1.1.** The index-one predicate is equivalent to signature `(n, 1)` at every
regularity. The corresponding smooth theorem specializes the existing signature API. -/
theorem isLorentzian_iff_signature [FiniteDimensional ℝ E]
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    (n : ℕ) (hn : Module.finrank ℝ E = n + 1) :
    g.IsLorentzian ↔ g.HasSignature n 1 := by
  sorry

/-- **§F1.7.** An extension at any signature: a smooth
embedding into a nondegenerate metric manifold `(M', g')` of the same model
and with `g'` of class `C^l`, pulling `g'` back to `g`, and not surjective. -/
structure IsExtension [FiniteDimensional ℝ E] {k l : ℕ∞ω}
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    {M' : Type*} [TopologicalSpace M'] [ChartedSpace H M'] [IsManifold I ∞ M']
    (g' : ContMDiffNondegenerateMetric (I := I) (M := M') l) (ι : M → M') : Prop where
  isSmoothEmbedding : Manifold.IsSmoothEmbedding I I ∞ ι
  apply_mfderiv (x : M) (v w : TangentSpace I x) :
    g' (ι x) (mfderiv I I ι x v) (mfderiv I I ι x w) = g x v w
  range_ne_univ : range ι ≠ univ

/-- **§F1.7.** `(M, g)` is `C^l`-inextendible: it has no `C^l`-extension into a connected
Hausdorff manifold of the same universe and model. -/
def IsInextendible [FiniteDimensional ℝ E] {k : ℕ∞ω} (l : ℕ∞ω)
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) : Prop :=
  ∀ (M' : Type u) [TopologicalSpace M'] [ChartedSpace H M'] [IsManifold I ∞ M']
    [T2Space M'] [ConnectedSpace M']
    (g' : ContMDiffNondegenerateMetric (I := I) (M := M') l) (ι : M → M'),
    ¬ g.IsExtension g' ι

end ContMDiffNondegenerateMetric

/-! The causal and null-hypersurface prototypes below are finite-dimensional specializations. -/

variable [FiniteDimensional ℝ E]

variable (I M) in
/-- **§C1.1.** A Lorentzian metric is the index-one subtype of the shared metric carrier. -/
abbrev LorentzianMetric (k : ℕ∞ω) :=
  {g : ContMDiffNondegenerateMetric (I := I) (M := M) k // g.IsLorentzian}

namespace LorentzianMetric

variable {k : ℕ∞ω}

instance : CoeFun (LorentzianMetric I M k) fun _ ↦
    (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ where
  coe g := g.val

omit [FiniteDimensional ℝ E] in
/-- Unpacking the index-one proof adds no metric data. -/
theorem isLorentzian (g : LorentzianMetric I M k) (x : M) :
    IsLorentzian (g x).toBilinForm := g.property x

/-! ### §C2.1: time orientation -/

variable (g : LorentzianMetric I M k)

/-- **§C2.1.** A continuous timelike vector field. -/
structure TimelikeVectorField where
  /-- The field. -/
  toFun : (x : M) → TangentSpace I x
  /-- It is a continuous section of `TM`. -/
  continuous : Continuous fun x ↦ TotalSpace.mk' E (E := TangentSpace I) x (toFun x)
  /-- It is timelike at every point. -/
  isTimelike (x : M) : IsTimelike (g x).toBilinForm (toFun x)

/-- **§C2.1.** Two timelike fields are equivalent when `g(T, T') < 0` everywhere. That this is
an equivalence relation is §C0.2 (b) pointwise. -/
def TimelikeVectorField.setoid : Setoid (TimelikeVectorField g) where
  r T T' := ∀ x, g x (T.toFun x) (T'.toFun x) < 0
  iseqv := sorry

/-- **§C2.1.** A time orientation is an equivalence class of continuous timelike fields. -/
def TimeOrientation : Type _ := Quotient (TimelikeVectorField.setoid g)

/-- **§C2.1.** Time-orientable: a continuous timelike vector field exists. -/
def IsTimeOrientable : Prop := Nonempty (TimelikeVectorField g)

/-- **§C2.1.** A connected time-orientable Lorentzian manifold has exactly two time
orientations. -/
theorem card_timeOrientation [ConnectedSpace M] (h : IsTimeOrientable g) :
    Nat.card (TimeOrientation g) = 2 := by
  sorry

/-- **§C2.1.** Every time orientation has a smooth representative. -/
theorem TimeOrientation.exists_smooth_rep [T2Space M] [SigmaCompactSpace M]
    (τ : TimeOrientation g) :
    ∃ T : TimelikeVectorField g, ⟦T⟧ = τ ∧
      ContMDiff I I.tangent ∞ fun x ↦ (⟨x, T.toFun x⟩ : TangentBundle I M) := by
  sorry

variable {g}

/-- **§C2.1.** A future-directed causal vector for a time orientation: causal and
`g(v, T) < 0` for a (any) representative `T`. -/
def TimeOrientation.IsFutureCausal (τ : TimeOrientation g) {x : M} (v : TangentSpace I x) :
    Prop :=
  Quotient.liftOn τ (fun T ↦ IsCausal (g x).toBilinForm v ∧ g x v (T.toFun x) < 0) sorry

/-- **§C2.1.** Future-directed timelike. -/
def TimeOrientation.IsFutureTimelike (τ : TimeOrientation g) {x : M} (v : TangentSpace I x) :
    Prop :=
  IsTimelike (g x).toBilinForm v ∧ τ.IsFutureCausal v

/-- The negative of a continuous timelike vector field. -/
def TimelikeVectorField.neg (T : TimelikeVectorField g) : TimelikeVectorField g where
  toFun x := -T.toFun x
  continuous := sorry
  isTimelike x := by simpa [IsTimelike] using T.isTimelike x

/-- **§C2.1.** The opposite time orientation `[-T]`. -/
def TimeOrientation.neg (τ : TimeOrientation g) : TimeOrientation g :=
  Quotient.map TimelikeVectorField.neg (fun _ _ h x ↦ by simpa [TimelikeVectorField.neg] using h x) τ

/-- **§C2.4.** Conformal transport retains the same timelike vector field. -/
def transportTimeOrientation {l : ℕ∞ω} {h : LorentzianMetric I M l} {Ω : M → ℝ}
    (hc : ContMDiffNondegenerateMetric.IsConformal g.val h.val Ω)
    (τ : TimeOrientation g) : TimeOrientation h :=
  Quotient.map (fun T : TimelikeVectorField g ↦
    { toFun := T.toFun
      continuous := T.continuous
      isTimelike := by
        intro x
        change h x (T.toFun x) (T.toFun x) < 0
        rw [hc.apply]
        exact mul_neg_of_pos_of_neg (sq_pos_of_pos (hc.pos x)) (T.isTimelike x) })
    (by
      intro T T' hTT x
      change h x (T.toFun x) (T'.toFun x) < 0
      rw [hc.apply]
      exact mul_neg_of_pos_of_neg (sq_pos_of_pos (hc.pos x)) (hTT x)) τ

/-! ### §C2.2–§C2.3: causal curves and relations -/

/-- **§C2.2.** A future-directed timelike piecewise `C¹` curve on `[a, b]`, `a < b`: every
one-sided velocity is future-directed timelike. -/
def IsFutureTimelikeCurve (τ : TimeOrientation g) (γ : ℝ → M) (a b : ℝ) : Prop :=
  a < b ∧ TauCeti.Manifold.IsPiecewiseContMDiffOn I 1 γ a b ∧
    (∀ t ∈ Ico a b, τ.IsFutureTimelike (mfderivWithin 𝓘(ℝ, ℝ) I γ (Icc t b) t 1)) ∧
    ∀ t ∈ Ioc a b, τ.IsFutureTimelike (mfderivWithin 𝓘(ℝ, ℝ) I γ (Icc a t) t 1)

/-- **§C2.2.** A curve is locally Lipschitz on a parameter set when, near every parameter,
it stays in the chart at its value and is Lipschitz there in that chart. -/
def IsLocallyLipschitzCurveOn (γ : ℝ → M) (s : Set ℝ) : Prop :=
  ∀ t ∈ s, ∃ U ∈ 𝓝[s] t, ∃ K : NNReal,
    MapsTo γ U (extChartAt I (γ t)).source ∧ LipschitzOnWith K (extChartAt I (γ t) ∘ γ) U

/-- **§C2.2.** A future-directed causal curve on `[a, b]`, `a < b`: locally Lipschitz, with
future-directed causal velocity at almost every parameter. -/
def IsFutureCausalCurve (τ : TimeOrientation g) (γ : ℝ → M) (a b : ℝ) : Prop :=
  a < b ∧ IsLocallyLipschitzCurveOn (I := I) γ (Icc a b) ∧
    ∀ᵐ t ∂(volume.restrict (Icc a b)),
      MDifferentiableAt 𝓘(ℝ, ℝ) I γ t ∧ τ.IsFutureCausal (mfderiv 𝓘(ℝ, ℝ) I γ t 1)

/-- **§C2.3.** The chronological future `I⁺(p)`. -/
def chronologicalFuture (τ : TimeOrientation g) (p : M) : Set M :=
  {q | ∃ γ a b, γ a = p ∧ γ b = q ∧ IsFutureTimelikeCurve τ γ a b}

/-- **§C2.3.** The causal future `J⁺(p)`: `p` and the endpoints of future causal curves. -/
def causalFuture (τ : TimeOrientation g) (p : M) : Set M :=
  insert p {q | ∃ γ a b, γ a = p ∧ γ b = q ∧ IsFutureCausalCurve τ γ a b}

/-- **§C2.3.** `I⁺(p)` is open, for continuous metrics. -/
theorem isOpen_chronologicalFuture [I.Boundaryless] (τ : TimeOrientation g) (p : M) :
    IsOpen (chronologicalFuture τ p) := by
  sorry

/-- **§C2.4.** Chronological futures are conformally invariant after orientation transport. -/
theorem chronologicalFuture_conformal {l : ℕ∞ω} {h : LorentzianMetric I M l} {Ω : M → ℝ}
    (hc : ContMDiffNondegenerateMetric.IsConformal g.val h.val Ω)
    (τ : TimeOrientation g) (p : M) :
    chronologicalFuture (transportTimeOrientation hc τ) p = chronologicalFuture τ p := by
  sorry

/-- **§C2.4.** Causal futures are conformally invariant after orientation transport. -/
theorem causalFuture_conformal {l : ℕ∞ω} {h : LorentzianMetric I M l} {Ω : M → ℝ}
    (hc : ContMDiffNondegenerateMetric.IsConformal g.val h.val Ω)
    (τ : TimeOrientation g) (p : M) :
    causalFuture (transportTimeOrientation hc τ) p = causalFuture τ p := by
  sorry

end LorentzianMetric

/-! ### §C3.2: null hypersurfaces at arbitrary finite signature -/

namespace ContMDiffNondegenerateMetric

variable {k : ℕ∞ω}

/-- **§C3.2.** An optical function on an open set `U`: `C¹`, with nowhere-vanishing
differential solving the eikonal equation `g⁻¹(du, du) = 0`. -/
structure IsOpticalFunctionOn (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    (u : M → ℝ) (U : Set M) : Prop where
  isOpen : IsOpen U
  contMDiffOn : ContMDiffOn I 𝓘(ℝ, ℝ) 1 u U
  mfderiv_ne_zero : ∀ x ∈ U, mfderiv I 𝓘(ℝ, ℝ) u x ≠ 0
  eikonal : ∀ x ∈ U,
    g.inverseApply g.isStrong_of_finiteDimensional x (mfderiv I 𝓘(ℝ, ℝ) u x) = 0

/-- **§C3.2.** A `C¹` immersed hypersurface `F : Σ → M` is null when the induced form on every
tangent hyperplane `dF(T_yΣ)` is degenerate. -/
def IsNullHypersurface (g : ContMDiffNondegenerateMetric (I := I) (M := M) k)
    {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
    [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'}
    {N : Type*} [TopologicalSpace N] [ChartedSpace H' N] (F : N → M) : Prop :=
  Manifold.IsImmersion J I 1 F ∧ Module.finrank ℝ E' + 1 = Module.finrank ℝ E ∧
    ∀ y : N, ¬ ((g (F y)).toBilinForm.restrict
      (LinearMap.range (mfderiv J I F y).toLinearMap)).Nondegenerate

end ContMDiffNondegenerateMetric

namespace LorentzianMetric

variable {k : ℕ∞ω} {g : LorentzianMetric I M k}

/-! ### §C6: achronal sets, Cauchy surfaces and global hyperbolicity -/

/-- **§C6.1.** An achronal set: no two points are chronologically related. -/
def IsAchronal (τ : TimeOrientation g) (S : Set M) : Prop :=
  ∀ p ∈ S, ∀ q ∈ S, q ∉ chronologicalFuture τ p

/-- **§C5.2.** Causal: no closed causal curves, i.e. `J⁺` is antisymmetric. -/
def IsCausalSpacetime (τ : TimeOrientation g) : Prop :=
  ∀ p q, q ∈ causalFuture τ p → p ∈ causalFuture τ q → p = q

/-- **§C6.3.** Globally hyperbolic (Bernal–Sánchez form): causal, with compact causal
diamonds `J⁺(p) ∩ J⁻(q)`. -/
def IsGloballyHyperbolic (τ : TimeOrientation g) : Prop :=
  IsCausalSpacetime τ ∧ ∀ p q, IsCompact (causalFuture τ p ∩ causalFuture τ.neg q)

/-- **§C6.2.** A future-directed timelike curve on `(a, b)` that is inextendible: piecewise
`C¹` timelike on every compact subinterval, `a < b`, with no endpoint in `M` at either end.
General open domains are related to this finite-endpoint prototype by §F2.1. -/
def IsInextendibleTimelikeCurve (τ : TimeOrientation g) (γ : ℝ → M) (a b : ℝ) : Prop :=
  a < b ∧ (∀ c d, a < c → d < b → c < d → IsFutureTimelikeCurve τ γ c d) ∧
    (¬ ∃ p, Tendsto γ (𝓝[>] a) (𝓝 p)) ∧ (¬ ∃ p, Tendsto γ (𝓝[<] b) (𝓝 p))

/-- **§C6.2.** A Cauchy surface: met exactly once by every inextendible timelike curve. -/
def IsCauchySurface (τ : TimeOrientation g) (S : Set M) : Prop :=
  ∀ γ a b, IsInextendibleTimelikeCurve τ γ a b → ∃! t, t ∈ Ioo a b ∧ γ t ∈ S

/-- **§C6.5.** Global hyperbolicity depends on the transported cones. -/
theorem isGloballyHyperbolic_conformal {l : ℕ∞ω} {h : LorentzianMetric I M l} {Ω : M → ℝ}
    (hc : ContMDiffNondegenerateMetric.IsConformal g.val h.val Ω)
    (τ : TimeOrientation g) :
    IsGloballyHyperbolic (transportTimeOrientation hc τ) ↔ IsGloballyHyperbolic τ := by
  sorry

/-- **§C6.5.** Cauchy surfaces are unchanged by positive conformal rescaling. -/
theorem isCauchySurface_conformal {l : ℕ∞ω} {h : LorentzianMetric I M l} {Ω : M → ℝ}
    (hc : ContMDiffNondegenerateMetric.IsConformal g.val h.val Ω)
    (τ : TimeOrientation g) (S : Set M) :
    IsCauchySurface (transportTimeOrientation hc τ) S ↔ IsCauchySurface τ S := by
  sorry

/-- **§C6.3, Geroch's theorem.** A smooth spacetime without boundary is globally hyperbolic
iff it has a Cauchy surface. -/
theorem isGloballyHyperbolic_iff_exists_isCauchySurface [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g) :
    IsGloballyHyperbolic τ ↔ ∃ S, IsCauchySurface τ S := by
  sorry

end LorentzianMetric

end Manifold

end TauCetiRoadmap.LorentzianGeometry
