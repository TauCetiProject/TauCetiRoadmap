module

public import Mathlib
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Nondegenerate.Existence
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Acceleration
public import TauCeti.Geometry.Manifold.PiecewisePath
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Nondegenerate.Regularity

/-!
# Semi-Riemannian foundations and Lorentzian causality: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the definitions their statements need:

* Geroch's theorem (§12.3): a smooth spacetime is globally hyperbolic iff it has a Cauchy
  surface;
* the Bernal–Sánchez theorem (§12.3): a smooth globally hyperbolic spacetime has a smooth Cauchy
  temporal function;
* the Avez–Seifert theorem (§12.3): two distinct causally related points of a smooth globally
  hyperbolic spacetime are joined by a causal geodesic whose length is their time separation;
* the Galloway–Ling–Sbierski theorem (§12.4): a smooth globally hyperbolic spacetime that is
  timelike geodesically complete is `C⁰`-inextendible, and Sbierski's theorem that Minkowski
  space is `C⁰`-inextendible;
* the determination theorem for domains of dependence inside a subset (§12.6);
* Hawking's theorem (§13.3), for Cauchy surfaces that are level sets of a smooth temporal
  function, with the mean curvature of the level set as the trace of the covariant derivative
  of its unit normal.

Not statable at the pins:

* the timelike focusing lemma (§13.2): there is no Jacobi field, normal exponential map or
  focal point of a semi-Riemannian metric (Tau Ceti's Jacobi fields, conjugate points and
  exponential map are those of a Riemannian metric);
* Penrose's theorem and the null focusing lemma (§13.2, §13.3): there is no null expansion of a
  spacelike codimension-two submanifold;
* the generator theorems of §12.7: there is no Levi-Civita connection or geodesic of a `C¹`
  metric (Tau Ceti's Levi-Civita connection is that of a smooth metric);
* the theorems of Part I on Banach manifolds and at finite regularity (Layers 2–5: the
  Levi-Civita connection of a strong `C^k` metric, the geodesic flow of a locally Lipschitz
  connection, the `C^{1,1}` Gauss lemma, the Gauss–Codazzi–Ricci equations of a nondegenerate
  immersion, Jacobi fields and index forms of an indefinite metric): Tau Ceti's covariant
  acceleration and Levi-Civita connection are finite-dimensional and smooth, its exponential map
  is the Riemannian one, and it has no second fundamental form of an immersion into a
  semi-Riemannian manifold.

The carrier `ContMDiffNondegenerateMetric k` is the metric of §2.2 at regularity `k`: Tau Ceti's
`TauCeti.Manifold.ContMDiffNondegenerateMetric` is the smooth case and has no regularity
parameter at the pin, and `ContMDiffNondegenerateMetric.toSmoothMetric` reads a smooth metric
as Tau Ceti's, so that its Levi-Civita connection is available.
-/

@[expose] public section

noncomputable section

open Bundle Set Filter MeasureTheory
open scoped Manifold ContDiff Topology

universe u

namespace TauCetiRoadmap.LorentzianGeometry

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

end ContMDiffNondegenerateMetric

end Manifold

/-! ## Layer 6: Lorentzian scalar products and cones -/

section Linear

variable {V : Type*} [AddCommGroup V] [Module ℝ V]

/-- **§6.1.** A Lorentzian scalar product: a symmetric nondegenerate real bilinear form of
index one, the index being Mathlib's negative inertia index `sigNeg`. -/
def IsLorentzian (b : LinearMap.BilinForm ℝ V) : Prop :=
  b.IsSymm ∧ b.Nondegenerate ∧ sigNeg b.toQuadraticMap = 1

/-- **§6.1.** A timelike vector: `b v v < 0`. -/
def IsTimelike (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := b v v < 0

/-- **§6.1.** A null (lightlike) vector: `b v v = 0` and `v ≠ 0`. -/
def IsNull (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := b v v = 0 ∧ v ≠ 0

/-- **§6.1.** A causal vector: timelike or null. The zero vector is not causal. -/
def IsCausal (b : LinearMap.BilinForm ℝ V) (v : V) : Prop := IsTimelike b v ∨ IsNull b v

/-- **§6.2 (b).** For a Lorentzian form on a finite-dimensional space, lying in the same time
cone is transitive: timelike `u, v, w` with `b u v < 0` and `b v w < 0` have `b u w < 0`. -/
theorem IsLorentzian.neg_of_neg_of_neg [FiniteDimensional ℝ V] {b : LinearMap.BilinForm ℝ V}
    (hb : IsLorentzian b) {u v w : V} (hu : IsTimelike b u) (hv : IsTimelike b v)
    (hw : IsTimelike b w) (huv : b u v < 0) (hvw : b v w < 0) : b u w < 0 := by
  sorry

end Linear

/-- **§6.1.** The Minkowski form on `ℝ × E`: `((t, x), (s, y)) ↦ -(t s) + ⟪x, y⟫`. Its quadratic
form is `-t² + ‖x‖²`. -/
def minkowskiForm (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E] :
    LinearMap.BilinForm ℝ (ℝ × E) :=
  LinearMap.mk₂ ℝ (fun v w ↦ -(v.1 * w.1) + inner ℝ v.2 w.2)
    (by intros; simp [inner_add_left]; ring) (by intros; simp [inner_smul_left]; ring)
    (by intros; simp [inner_add_right]; ring) (by intros; simp [inner_smul_right]; ring)

/-! ## Layer 7: Lorentzian metrics and model spacetimes -/

section Manifold

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type u} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- **§7.1.** The index-one predicate on the metric carrier: Lorentzian at every point. -/
def ContMDiffNondegenerateMetric.IsLorentzian {k : ℕ∞ω}
    (g : ContMDiffNondegenerateMetric (I := I) (M := M) k) : Prop :=
  ∀ x, TauCetiRoadmap.LorentzianGeometry.IsLorentzian (g x).toBilinForm

variable [FiniteDimensional ℝ E]

variable (I M) in
/-- **§7.1.** A Lorentzian metric of class `C^k` is the index-one subtype of the metric
carrier of §2.2. -/
abbrev LorentzianMetric (k : ℕ∞ω) :=
  {g : ContMDiffNondegenerateMetric (I := I) (M := M) k // g.IsLorentzian}

namespace LorentzianMetric

variable {k : ℕ∞ω}

/-- A Lorentzian metric is evaluated pointwise as its continuous bilinear form. -/
instance : CoeFun (LorentzianMetric I M k) fun _ ↦
    (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ where
  coe g := g.val

/-! ## Layer 8: time orientations and causal curves -/

variable (g : LorentzianMetric I M k)

/-- **§8.1.** A continuous timelike vector field. -/
structure TimelikeVectorField where
  /-- The field. -/
  toFun : (x : M) → TangentSpace I x
  /-- It is a continuous section of `TM`. -/
  continuous : Continuous fun x ↦ TotalSpace.mk' E (E := TangentSpace I) x (toFun x)
  /-- It is timelike at every point. -/
  isTimelike (x : M) : IsTimelike (g x).toBilinForm (toFun x)

/-- **§8.1.** Two timelike fields are equivalent when `g(T, T') < 0` everywhere; this is an
equivalence relation by §6.2 (b) at every point. -/
def TimelikeVectorField.setoid : Setoid (TimelikeVectorField g) where
  r T T' := ∀ x, g x (T.toFun x) (T'.toFun x) < 0
  iseqv :=
    { refl := fun T x ↦ T.isTimelike x
      symm := fun h x ↦ ((g.property x).1.eq _ _).trans_lt (h x)
      trans := fun {T T' T''} h h' x ↦
        IsLorentzian.neg_of_neg_of_neg (g.property x) (T.isTimelike x) (T'.isTimelike x)
          (T''.isTimelike x) (h x) (h' x) }

/-- **§8.1.** A time orientation is an equivalence class of continuous timelike fields. -/
def TimeOrientation : Type _ := Quotient (TimelikeVectorField.setoid g)

variable {g}

/-- **§8.1.** A future-directed causal vector for a time orientation `τ`: causal and
`g(v, T) < 0` for some representative `T` of `τ` (by §6.2, then for every representative). -/
def TimeOrientation.IsFutureCausal (τ : TimeOrientation g) {x : M} (v : TangentSpace I x) :
    Prop :=
  ∃ T : TimelikeVectorField g, ⟦T⟧ = τ ∧ IsCausal (g x).toBilinForm v ∧ g x v (T.toFun x) < 0

/-- **§8.1.** A future-directed timelike vector. -/
def TimeOrientation.IsFutureTimelike (τ : TimeOrientation g) {x : M} (v : TangentSpace I x) :
    Prop :=
  IsTimelike (g x).toBilinForm v ∧ τ.IsFutureCausal v

/-- **§8.2.** A future-directed timelike piecewise `C¹` curve on `[a, b]`, `a < b`: every
one-sided velocity is future-directed timelike. -/
def IsFutureTimelikeCurve (τ : TimeOrientation g) (γ : ℝ → M) (a b : ℝ) : Prop :=
  a < b ∧ TauCeti.Manifold.IsPiecewiseContMDiffOn I 1 γ a b ∧
    (∀ t ∈ Ico a b, τ.IsFutureTimelike (mfderivWithin 𝓘(ℝ, ℝ) I γ (Icc t b) t 1)) ∧
    ∀ t ∈ Ioc a b, τ.IsFutureTimelike (mfderivWithin 𝓘(ℝ, ℝ) I γ (Icc a t) t 1)

/-- **§8.2.** A curve is locally Lipschitz on a parameter set when, near every parameter,
it stays in the chart at its value and is Lipschitz there in that chart. -/
def IsLocallyLipschitzCurveOn (γ : ℝ → M) (s : Set ℝ) : Prop :=
  ∀ t ∈ s, ∃ U ∈ 𝓝[s] t, ∃ K : NNReal,
    MapsTo γ U (extChartAt I (γ t)).source ∧ LipschitzOnWith K (extChartAt I (γ t) ∘ γ) U

/-- **§8.2.** A future-directed causal curve on `[a, b]`, `a < b`: locally Lipschitz, with
future-directed causal velocity at almost every parameter. -/
def IsFutureCausalCurve (τ : TimeOrientation g) (γ : ℝ → M) (a b : ℝ) : Prop :=
  a < b ∧ IsLocallyLipschitzCurveOn (I := I) γ (Icc a b) ∧
    ∀ᵐ t ∂(volume.restrict (Icc a b)),
      MDifferentiableAt 𝓘(ℝ, ℝ) I γ t ∧ τ.IsFutureCausal (mfderiv 𝓘(ℝ, ℝ) I γ t 1)

/-- **§8.2.** The Lorentzian length `∫_a^b √(-g(γ', γ')) dt` of a curve on `[a, b]`. -/
def lorentzianLength (g : LorentzianMetric I M k) (γ : ℝ → M) (a b : ℝ) : ℝ :=
  ∫ t in a..b, Real.sqrt (-(g (γ t) (mfderiv 𝓘(ℝ, ℝ) I γ t 1) (mfderiv 𝓘(ℝ, ℝ) I γ t 1)))

/-- **§8.3.** The chronological future `I⁺(p)`: endpoints of future timelike curves from `p`. -/
def chronologicalFuture (τ : TimeOrientation g) (p : M) : Set M :=
  {q | ∃ γ a b, γ a = p ∧ γ b = q ∧ IsFutureTimelikeCurve τ γ a b}

/-- **§8.3.** The causal future `J⁺(p)`: `p` and the endpoints of future causal curves from
`p`. -/
def causalFuture (τ : TimeOrientation g) (p : M) : Set M :=
  insert p {q | ∃ γ a b, γ a = p ∧ γ b = q ∧ IsFutureCausalCurve τ γ a b}

/-- **§8.3.** The causal past `J⁻(q)`: the points `p` with `q ∈ J⁺(p)`. -/
def causalPast (τ : TimeOrientation g) (q : M) : Set M :=
  {p | q ∈ causalFuture τ p}

/-! ## Layer 11: time separation, causal ladder and limit curves -/

/-- **§11.1.** The time separation `τ(p, q) ∈ [0, ∞]`: the supremum of the Lorentzian lengths of
the future causal curves from `p` to `q`, and `0` when there is none. -/
def timeSeparation (τ : TimeOrientation g) (p q : M) : ENNReal :=
  ⨆ (γ : ℝ → M) (a : ℝ) (b : ℝ) (_ : γ a = p ∧ γ b = q ∧ IsFutureCausalCurve τ γ a b),
    ENNReal.ofReal (lorentzianLength g γ a b)

/-- **§11.2.** A causal spacetime: `J⁺` is antisymmetric (no closed causal curves). -/
def IsCausalSpacetime (τ : TimeOrientation g) : Prop :=
  ∀ p q, q ∈ causalFuture τ p → p ∈ causalFuture τ q → p = q

/-! ## Layer 12: Cauchy theory and global hyperbolicity -/

/-- **§12.3.** Globally hyperbolic: causal, with compact causal diamonds `J⁺(p) ∩ J⁻(q)`. -/
def IsGloballyHyperbolic (τ : TimeOrientation g) : Prop :=
  IsCausalSpacetime τ ∧ ∀ p q, IsCompact (causalFuture τ p ∩ causalPast τ q)

/-- **§12.2.** A future-directed inextendible timelike curve on `(a, b)`, `a < b`: future
timelike and piecewise `C¹` on every compact subinterval, with no limit in `M` at either end. -/
def IsInextendibleTimelikeCurve (τ : TimeOrientation g) (γ : ℝ → M) (a b : ℝ) : Prop :=
  a < b ∧ (∀ c d, a < c → d < b → c < d → IsFutureTimelikeCurve τ γ c d) ∧
    (¬ ∃ p, Tendsto γ (𝓝[>] a) (𝓝 p)) ∧ (¬ ∃ p, Tendsto γ (𝓝[<] b) (𝓝 p))

/-- **§12.2.** A Cauchy surface: met exactly once by every inextendible timelike curve. -/
def IsCauchySurface (τ : TimeOrientation g) (S : Set M) : Prop :=
  ∀ γ a b, IsInextendibleTimelikeCurve τ γ a b → ∃! t, t ∈ Ioo a b ∧ γ t ∈ S

/-- **§12.3, Geroch's theorem.** A smooth spacetime without boundary is globally hyperbolic iff
it has a Cauchy surface (Geroch 1970; Minguzzi 2019, Theorem 4.119, for closed acausal Cauchy
hypersurfaces, with Corollary 3.34 and Theorem 3.45 for the converse from a Cauchy surface). -/
theorem isGloballyHyperbolic_iff_exists_isCauchySurface [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g) :
    IsGloballyHyperbolic τ ↔ ∃ S, IsCauchySurface τ S := by
  sorry

/-- **§12.3, Bernal–Sánchez.** A smooth globally hyperbolic spacetime has a smooth Cauchy
temporal function: `dt(v) > 0` for every future causal `v`, and every level set is a Cauchy
surface (Minguzzi 2019, Theorem 4.120). -/
theorem exists_cauchyTemporalFunction [I.Boundaryless] [T2Space M] [SecondCountableTopology M]
    [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g) (h : IsGloballyHyperbolic τ) :
    ∃ t : M → ℝ, ContMDiff I 𝓘(ℝ, ℝ) ∞ t ∧
      (∀ (x : M) (v : TangentSpace I x), τ.IsFutureCausal v →
        (0 : ℝ) < (mfderiv I 𝓘(ℝ, ℝ) t x v : ℝ)) ∧
      ∀ a : ℝ, IsCauchySurface τ (t ⁻¹' {a}) := by
  sorry

/-- **§12.3, Avez–Seifert.** In a smooth globally hyperbolic spacetime, distinct points `p` and
`q ∈ J⁺(p)` are joined by a future causal geodesic of the Levi-Civita connection whose length is
the time separation `τ(p, q)` (Minguzzi 2019, Theorem 4.123). -/
theorem exists_geodesic_lorentzianLength_eq_timeSeparation [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g)
    (h : IsGloballyHyperbolic τ) {p q : M} (hpq : q ∈ causalFuture τ p) (hne : p ≠ q) :
    ∃ (γ : ℝ → M) (a b : ℝ), γ a = p ∧ γ b = q ∧ IsFutureCausalCurve τ γ a b ∧
      ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ (Icc a b) ∧
      (∀ t ∈ Icc a b, CovariantDerivative.accelerationWithin
        (g.val.toSmoothMetric hk).leviCivitaConnection γ (Icc a b) t = 0) ∧
      ENNReal.ofReal (lorentzianLength g γ a b) = timeSeparation τ p q := by
  sorry

variable (g) in
/-- **§12.4.** Timelike geodesic completeness of a smooth Lorentzian metric: every geodesic of
its Levi-Civita connection on an open interval around `0`, with timelike velocity at `0`, is the
restriction of a geodesic defined on all of `ℝ`. -/
def IsTimelikeGeodesicallyComplete (hk : ∞ ≤ k) : Prop :=
  ∀ (γ : ℝ → M) (a b : ℝ), a < 0 → 0 < b → ContMDiffOn 𝓘(ℝ, ℝ) I 2 γ (Ioo a b) →
    IsTimelike (g (γ 0)).toBilinForm (mfderiv 𝓘(ℝ, ℝ) I γ 0 1) →
    (∀ t ∈ Ioo a b, CovariantDerivative.accelerationWithin
      (g.val.toSmoothMetric hk).leviCivitaConnection γ (Ioo a b) t = 0) →
    ∃ γ' : ℝ → M, EqOn γ' γ (Ioo a b) ∧ ContMDiff 𝓘(ℝ, ℝ) I 2 γ' ∧
      ∀ t, CovariantDerivative.accelerationWithin
        (g.val.toSmoothMetric hk).leviCivitaConnection γ' univ t = 0

/-- **§12.4, Galloway–Ling–Sbierski.** A smooth globally hyperbolic spacetime that is timelike
geodesically complete is `C⁰`-inextendible (Galloway–Ling–Sbierski, Theorem 1). -/
theorem isInextendible_zero_of_isGloballyHyperbolic [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g)
    (h : IsGloballyHyperbolic τ) (hc : IsTimelikeGeodesicallyComplete g hk) :
    g.val.IsInextendible 0 := by
  sorry

end LorentzianMetric

/-- **§12.4, Sbierski's theorem.** Minkowski space `(ℝ × F, minkowskiForm F)` is
`C⁰`-inextendible (Sbierski, Theorem 3.1); it is the first case of the previous theorem. -/
theorem minkowski_isInextendible_zero (F : Type*) [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
    (g : ContMDiffNondegenerateMetric (I := 𝓘(ℝ, ℝ × F)) (M := ℝ × F) ∞)
    (hg : ∀ x, (g x).toBilinForm = minkowskiForm F) : g.IsInextendible 0 := by
  sorry

/-- **§12.6.** A Lorentzian form field and a timelike vector field, both continuous on the
subset `D` and Lorentzian, resp. timelike, at its points. Values off `D` are never used. The
manifold may have boundary or corners and `D` need not be open. -/
structure TimeOrientedLorentzianFieldOn (D : Set M) where
  /-- The pointwise bilinear forms. -/
  form : (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ
  /-- The form field is continuous on `D`. -/
  continuousOn_form : ContinuousOn (fun x ↦ TotalSpace.mk' (E →L[ℝ] E →L[ℝ] ℝ)
    (E := fun x : M ↦ TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ) x (form x)) D
  /-- It is Lorentzian at the points of `D`. -/
  isLorentzian : ∀ x ∈ D, IsLorentzian (form x).toBilinForm
  /-- The time-orienting vector field. -/
  timeField : (x : M) → TangentSpace I x
  /-- The time field is continuous on `D`. -/
  continuousOn_timeField :
    ContinuousOn (fun x ↦ TotalSpace.mk' E (E := TangentSpace I) x (timeField x)) D
  /-- It is timelike at the points of `D`. -/
  isTimelike : ∀ x ∈ D, IsTimelike (form x).toBilinForm (timeField x)

namespace TimeOrientedLorentzianFieldOn

variable {D : Set M} (𝔤 : TimeOrientedLorentzianFieldOn (I := I) D)

/-- **§12.6.** Restriction to a smaller subset. -/
def mono {D' : Set M} (h : D' ⊆ D) : TimeOrientedLorentzianFieldOn (I := I) D' where
  form := 𝔤.form
  continuousOn_form := 𝔤.continuousOn_form.mono h
  isLorentzian x hx := 𝔤.isLorentzian x (h hx)
  timeField := 𝔤.timeField
  continuousOn_timeField := 𝔤.continuousOn_timeField.mono h
  isTimelike x hx := 𝔤.isTimelike x (h hx)

/-- **§12.6.** A future-directed causal vector: causal and pairing negatively with the time
field. -/
def IsFutureCausal {x : M} (v : TangentSpace I x) : Prop :=
  IsCausal (𝔤.form x).toBilinForm v ∧ 𝔤.form x v (𝔤.timeField x) < 0

/-- **§12.6.** A future-directed causal curve in `D` on an interval `J` (possibly a point,
open, closed or half-open, bounded or not): locally Lipschitz, with values in `D` and future
causal velocity at almost every parameter. -/
def IsFutureCausalCurveIn (γ : ℝ → M) (J : Set ℝ) : Prop :=
  J.OrdConnected ∧ MapsTo γ J D ∧ LorentzianMetric.IsLocallyLipschitzCurveOn (I := I) γ J ∧
    ∀ᵐ t ∂(volume.restrict J),
      MDifferentiableAt 𝓘(ℝ, ℝ) I γ t ∧ 𝔤.IsFutureCausal (mfderiv 𝓘(ℝ, ℝ) I γ t 1)

/-- **§12.6.** Past-inextendible in `D`: at a least parameter no nontrivial future causal curve
in `D` ends at its value; with no least parameter, no past limit in `D`. -/
def IsPastInextendibleIn (γ : ℝ → M) (J : Set ℝ) : Prop :=
  (∀ a, IsLeast J a → ¬ ∃ (γ' : ℝ → M) (a' : ℝ),
      a' < a ∧ 𝔤.IsFutureCausalCurveIn γ' (Icc a' a) ∧ γ' a = γ a) ∧
    ((BddBelow J ∧ ¬ ∃ a, IsLeast J a) →
      ¬ ∃ p ∈ D, Tendsto γ (𝓝[J] (sInf J)) (𝓝 p)) ∧
    (¬ BddBelow J → ¬ ∃ p ∈ D, Tendsto γ atBot (𝓝 p))

/-- **§12.6.** The future domain of dependence `D⁺_D(S)` of `S` in `D`: the points `p ∈ D`
such that every future causal curve in `D` ending at `p` and past-inextendible in `D`
meets `S`. -/
def futureDomainOfDependenceIn (S : Set M) : Set M :=
  {p | p ∈ D ∧ ∀ (γ : ℝ → M) (J : Set ℝ) (b : ℝ), IsGreatest J b → γ b = p →
    𝔤.IsFutureCausalCurveIn γ J → 𝔤.IsPastInextendibleIn γ J → ∃ t ∈ J, γ t ∈ S}

/-- **§12.6, determination.** For `S` closed in an open `U` of a manifold without boundary, the
domain of dependence `D = D⁺_U(S)` satisfies `D⁺_D(S) = D` for the field restricted to `D`. -/
theorem futureDomainOfDependenceIn_self [I.Boundaryless] {U : Set M}
    (𝔲 : TimeOrientedLorentzianFieldOn (I := I) U) (hU : IsOpen U) {S C : Set M}
    (hC : IsClosed C) (hS : S = C ∩ U) :
    (𝔲.mono (fun _ hp ↦ hp.1 : 𝔲.futureDomainOfDependenceIn S ⊆ U)).futureDomainOfDependenceIn
      S = 𝔲.futureDomainOfDependenceIn S := by
  sorry

end TimeOrientedLorentzianFieldOn

/-! ## Layer 13: focusing and singularity theorems -/

namespace LorentzianMetric

variable {k : ℕ∞ω} {g : LorentzianMetric I M k}

variable (g) in
/-- **§13.3.** The Ricci tensor `Ric(u, v) = tr(w ↦ R(w, u)v)` of the Levi-Civita connection of a
smooth Lorentzian metric (§2.5). -/
def ricci [T2Space M] (hk : ∞ ≤ k) (x : M) :
    TangentSpace I x →ₗ[ℝ] TangentSpace I x →ₗ[ℝ] ℝ :=
  letI := (g.val.toSmoothMetric hk).isLeviCivitaConnection_leviCivitaConnection
    |>.contMDiffCovariantDerivative le_rfl
  (g.val.toSmoothMetric hk).leviCivitaConnection.ricciTensor x

variable (g) in
/-- **§13.3.** The unit normal `ν = −grad t / |grad t|` of the level sets of `t`, where
`grad t = sharp(dt)`; it is the future unit normal when `dt` is positive on future causal
vectors. -/
def levelSetUnitNormal (hk : ∞ ≤ k) (t : M → ℝ) (x : M) : TangentSpace I x :=
  let ν := (g.val.toSmoothMetric hk).sharp x
    (mfderiv I 𝓘(ℝ, ℝ) t x : TangentSpace I x →L[ℝ] ℝ).toLinearMap
  ((-1 : ℝ) / Real.sqrt (-(g x ν ν))) • ν

variable (g) in
/-- **§13.3.** The mean curvature `H = tr_h k` (§9.1) of the level sets of `t`, as the trace on
`T_xM` of `X ↦ ∇_X ν` for the unit normal `ν`; the normal direction adds nothing to the trace,
as `g(ν, ν) = −1` makes `g(∇_X ν, ν)` vanish. -/
def levelSetMeanCurvature (hk : ∞ ≤ k) (t : M → ℝ) (x : M) : ℝ :=
  LinearMap.trace ℝ (TangentSpace I x)
    ((g.val.toSmoothMetric hk).leviCivitaConnection (levelSetUnitNormal g hk t) x).toLinearMap

/-- **§13.3, Hawking's theorem.** In a smooth globally hyperbolic spacetime of dimension `n + 1`
satisfying the timelike convergence condition, if the level set `S = t⁻¹(0)` of a smooth temporal
function `t` is a Cauchy surface with future mean curvature `H ≤ b < 0`, then every future causal
curve from `S` has Lorentzian length at most `n / |b|` (O'Neill, Theorem 14.55A). Every smooth
spacelike Cauchy surface is such a level set (Bernal–Sánchez 2006). -/
theorem lorentzianLength_le_of_meanCurvature_le [I.Boundaryless] [T2Space M]
    [SecondCountableTopology M] [ConnectedSpace M] (hk : ∞ ≤ k) (τ : TimeOrientation g)
    (h : IsGloballyHyperbolic τ)
    (hRic : ∀ (x : M) (v : TangentSpace I x), IsTimelike (g x).toBilinForm v →
      0 ≤ g.ricci hk x v v)
    (t : M → ℝ) (ht : ContMDiff I 𝓘(ℝ, ℝ) ∞ t)
    (hdt : ∀ (x : M) (v : TangentSpace I x), τ.IsFutureCausal v →
      (0 : ℝ) < (mfderiv I 𝓘(ℝ, ℝ) t x v : ℝ))
    (hS : IsCauchySurface τ (t ⁻¹' {0})) {b : ℝ} (hb : b < 0)
    (hH : ∀ x ∈ t ⁻¹' {0}, g.levelSetMeanCurvature hk t x ≤ b)
    (γ : ℝ → M) (a c : ℝ) (hγ : IsFutureCausalCurve τ γ a c) (ha : t (γ a) = 0) :
    lorentzianLength g γ a c ≤ ((Module.finrank ℝ E : ℝ) - 1) / |b| := by
  sorry

end LorentzianMetric

end Manifold

end TauCetiRoadmap.LorentzianGeometry
