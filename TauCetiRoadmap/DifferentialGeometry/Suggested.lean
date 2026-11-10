module

public import Mathlib
public import TauCeti.Geometry.Convex.FullSimplex
public import TauCeti.Geometry.Manifold.Boundary.Charts
public import TauCeti.Geometry.Manifold.Boundary.Orientation
public import TauCeti.Geometry.Manifold.DeRham.PoincarePairing
public import TauCeti.Geometry.Manifold.Degree.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.ExtDeriv
public import TauCeti.Geometry.Manifold.DifferentialForm.Integration.TopForm
public import TauCeti.Geometry.Manifold.DifferentialForm.Involution
public import TauCeti.Geometry.Manifold.DifferentialForm.Pullback.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.Smooth
public import TauCeti.Geometry.Manifold.Distribution
public import TauCeti.Geometry.Manifold.Distribution.IntegralManifold
public import TauCeti.Geometry.Manifold.Flow.Basic
public import TauCeti.Geometry.Manifold.IntegralCurve.Flow
public import TauCeti.Geometry.Manifold.IntegralCurve.Maximal
public import TauCeti.Geometry.Manifold.LocallyFlat.Basic
public import TauCeti.Geometry.Manifold.Orientation.Basic
public import TauCeti.Geometry.Manifold.Orientation.Cover.Basic
public import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas
public import TauCeti.Geometry.Manifold.Riemannian.Circle
public import TauCeti.Geometry.Manifold.Riemannian.Laplacian
public import TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
public import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz

/-!
# Differential geometry — forms, Stokes, flows, de Rham cohomology, degree, planar Green and Riemannian calculus: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; the README carries every target, API list and acceptance example.

Headline theorems stated here, by layer: smoothness of bundle-valued pullbacks (0.3); the chart
signs of the pullback orientation [Lee, Prop. 15.15], the smooth top form of an orientation
[Lee, Prop. 15.5] and the oriented-atlas criterion [Lee, Prop. 15.6] (2.2); the triviality of the
orientation double cover of an orientable manifold and the commutation of `d` with the averaging
operators (2.4); smooth dependence on initial conditions for Banach models, the fundamental
theorem of flows for Banach models, homogeneity, the flow characterization of the bracket
[Lee, Thm. 9.38], straightening [Lee, Thm. 9.22] and time-dependent flows [Lee, Thm. 9.48] (3);
integrability implies involutivity, the annihilator criterion, local Frobenius with integral
slices, weak embeddedness and global leaves [Lee, Ch. 19] (4); the planar radial primitive and
the moving-pullback identity (5.4–5.4a); the top-cohomology theorems [Lee, Thm. 17.30, 17.34] and
Poincaré duality (9.2–9.3); the integral formula for the degree [Lee, Thm. 17.35] (10.3–10.4);
the hairy ball theorem in its tangent-field and tangent-bundle-section forms
[Lee, Problem 16-6] (11); the Riemannian divergence theorem on half-space manifolds with the
induced boundary measure and outward unit normal [Lee, Thm. 16.32], and the volume of the round
circle (12).

Headline theorems that Tau Ceti proves are not restated: the flip, associativity, graded Jacobi
and interior-product identities of the paired wedge (0.1), the smooth alternating bundle (0.2),
coefficient postcomposition with its laws (0.3–0.4), the wedge of smooth forms (0.4), linearity,
naturality, commutation with coefficient postcomposition, `d ∘ d = 0`, regularity, the Leibniz
rule, the invariant formula of the exterior derivative, the Lie derivative of forms and Cartan's
formula (1.1–1.4), the two-orientation theorem, the pullback and product orientations, the
orientation of a nowhere-vanishing top form and the π₁ criterion (2.1–2.4), compactly supported
and compact-manifold completeness, the global flow, conjugate flows and the Lie derivative of
forms along a flow (3.3–3.4), the finite-dimensional time-dependent flow on the time slab `ℝ`
(3.5), the outward field, the outward-first boundary orientation, the closed ball with its
boundary sphere and radial field, the integral of top forms with its chart formula, linearity,
orientation sign, positivity and change of variables, and Stokes' theorem for the half-space with
its boundaryless and interval cases (5.1–5.3), the homotopy operator with its cochain-homotopy
identity (5.4), the insertion of a vector field in a form with its pullback law and its
antiderivation law `TauCeti.RoughForm.interior_wedgeWith_apply` on the paired wedge (5.4a, the
case of the identity map), the index calculus of absolutely continuous curves, the one-cell
identities on vertical and horizontal cells, Green's theorem for finite type-I/type-II divisions
with Henstock–Kurzweil boundary integrals, the winding-weighted polygonal identity and Green's
theorem for absolutely continuous cycles (5.6.1–5.6.3), the existence of metrics, the gradient
calculus, the symmetry of the Hessian, the induced boundary metric and the boundaryless
divergence theorem with Green's identities (12.1–12.3, 12.5), and the comparison of the planar
Green theorems with the integral of top forms (12.6); the README's *From Tau Ceti* contract names
each with its module.

The statements are written on Tau Ceti's declarations: its rough and smooth forms, pullback,
exterior derivative, orientations, orientation cover, averaging operators, maximal flow,
distributions and integral manifolds, compactly supported de Rham cohomology with its integration
and Poincaré pairing, signed count of preimages, integral of top forms, outward-pointing vectors,
divergence and Riemannian volume. `RoughForm`, `RoughForm.ofFunction`, `SmoothForm`, `mextDeriv`,
`fullSimplex` and `fullSimplexEquivStdSimplex` abbreviate the Tau Ceti declarations of the same
names, and `bundleMpullback` reads `TauCeti.bundleMpullback` in Mathlib's pulled-back bundle; they
are the names under which modules of other roadmaps read these objects from this file. The
chart-sign orientation lift `OrientationLift` with its quotient `Manifold.Orientation`,
`orientationAt` and `Manifold.Orientation.pullback` are definitions of this file:
AlgebraicTopology's orientation comparison computes with their chart signs and with the relation
of the quotient, which Tau Ceti's `TauCeti.Manifold.Orientation` does not expose in that form.
`roundMetricCircle` selects the round-sphere metric that `TauCeti.roundMetricCircle` bundles, so
that the continuity instance of the sphere applies to it in `volume_circle`. The time-dependent
flow of 3.5 is defined on an open time slab, where Tau Ceti's is on the slab `ℝ`. `Density`,
`RoughDensity`, `planarRadialPrimitive`, `contractionAlongMap`, `familyContraction`,
`immersionMetric` and the boundary metric and measure of 12.5 have no Tau Ceti counterpart at the
pin; each has a real body.

Headline theorems not stated here, and what each lacks: Stokes' theorem for smooth faces and
corners (5.5b) lacks the smooth face structure with its abstract boundary; the face-structured
divergence theorem (12.5) lacks the same face structure; the sign of the antipodal map of `Sⁿ`
(2.4) lacks the outward orientation of the sphere, a construction; agreement of densities with
the integral of top forms (5.5a) and of the Riemannian volume form with the Riemannian density
(12.4) lack the integral of densities; the de Rham theorem (8.5) and the multiplicativity of the
de Rham homomorphism lack the de Rham homomorphism on smooth singular chains, a cochain map whose
well-definedness is Stokes for chains (8.4) (singular cohomology with real coefficients is
`TauCeti.singularCohomologyFunctor` over `ModuleCat ℝ` with `R`, `k` and `M` all `ℝ`); the
homotopy invariance of the degree (10.5) lacks the degree as one integer, whose independence of
the regular value follows from the integral formula of 10.3–10.4.

Hypotheses are unbundled and stated at their point of use; finite dimension, Hausdorffness and
σ-compactness are written wherever they are used; measure statements carry
`[MeasurableSpace M] [BorelSpace M]`. The de Rham complex and cohomology, Mayer–Vietoris, smooth
chains and the de Rham theorem, Poincaré duality, Sard's theorem on manifolds, the degree and the
hairy ball theorem (layers 6–11) are this roadmap's; DeRhamCohomologyAndDuality consumes 8.3–8.5
for its relative theory.
-/

public section

open Bundle Set
open scoped Manifold Bundle Topology ContDiff InnerProductSpace

namespace TauCetiRoadmap.DifferentialGeometry

/-! ## Layer 0: rough and smooth forms on manifolds, pullback -/

section BundleForms

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' M' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace M'] [ChartedSpace H' M']
  {k : ℕ}

-- The pin supplies the pulled-back additive monoid/module and topology, but does not
-- register the following stronger fibre instances. These are real local transports.
local instance {B B' : Type*} {V : B → Type*}
    [∀ y, AddCommGroup (V y)] (f : B' → B) (x : B') : AddCommGroup ((f *ᵖ V) x) :=
  inferInstanceAs (AddCommGroup (V (f x)))

local instance {B B' : Type*} {V : B → Type*}
    [∀ y, AddCommGroup (V y)] [∀ y, TopologicalSpace (V y)]
    [∀ y, IsTopologicalAddGroup (V y)] (f : B' → B) (x : B') :
    IsTopologicalAddGroup ((f *ᵖ V) x) :=
  inferInstanceAs (IsTopologicalAddGroup (V (f x)))

local instance {B B' : Type*} {V : B → Type*}
    [∀ y, AddCommGroup (V y)] [∀ y, Module ℝ (V y)] [∀ y, TopologicalSpace (V y)]
    [∀ y, ContinuousSMul ℝ (V y)] (f : B' → B) (x : B') :
    ContinuousSMul ℝ ((f *ᵖ V) x) :=
  inferInstanceAs (ContinuousSMul ℝ (V (f x)))

/-- **Layer 0.3.** Pullback of a bundle-valued form, typed in the pulled-back bundle: Tau Ceti's
`TauCeti.bundleMpullback`, whose value family is `fun x ↦ V (f x)`, read with values in Mathlib's
`f *ᵖ V`, the family that carries the pulled-back bundle structure. It needs no connection and is
total. -/
noncomputable abbrev bundleMpullback (I : ModelWithCorners ℝ E H)
    (I' : ModelWithCorners ℝ E' H') {V : M' → Type*}
    [∀ y, AddCommGroup (V y)] [∀ y, Module ℝ (V y)] [∀ y, TopologicalSpace (V y)]
    (f : M → M') (φ : TauCeti.RoughBundleForm I' M' V k) :
    TauCeti.RoughBundleForm I M (f *ᵖ V) k :=
  TauCeti.bundleMpullback I I' f φ

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **Layer 0.3.** A `C^(n+1)` map pulls a `C^n` bundle-valued form back to a `C^n`
form with values in the pulled-back bundle `f *ᵖ V'`, whose fibre at `x` is `V' (f x)`:
`bundleMpullback` preserves Tau Ceti's `TauCeti.IsSmoothBundleForm`. Tau Ceti proves the case of a
trivial value bundle (`TauCeti.IsSmoothBundleForm.mpullback`); the general value bundle is the
target. Bundling `f` supplies the canonical pullback bundle instances from its continuity. -/
theorem isSmoothBundleForm_mpullback {n : WithTop ℕ∞}
    [IsManifold I 1 M] [IsManifold I' 1 M']
    [IsManifold I (n + 1) M] [IsManifold I' (n + 1) M']
    {V' : M' → Type*} [∀ y, AddCommGroup (V' y)] [∀ y, Module ℝ (V' y)]
    [∀ y, TopologicalSpace (V' y)] [TopologicalSpace (TotalSpace F V')]
    [FiberBundle F V'] [VectorBundle ℝ F V']
    [∀ y, IsTopologicalAddGroup (V' y)] [∀ y, ContinuousSMul ℝ (V' y)]
    [ContMDiffVectorBundle n F V' I'] (f : ContMDiffMap I I' M M' (n + 1))
    {φ : TauCeti.RoughBundleForm I' M' V' k} (hφ : TauCeti.IsSmoothBundleForm I' F V' n φ) :
    TauCeti.IsSmoothBundleForm I F (f *ᵖ V') n (bundleMpullback I I' f φ) :=
  sorry

end BundleForms

section Forms

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

/-- **Layer 0.3.** Fixed-coefficient rough forms: Tau Ceti's `TauCeti.RoughForm`, under the name
by which modules of other roadmaps read it from this file. -/
abbrev RoughForm (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) :
    Type _ :=
  TauCeti.RoughForm I M F k

/-- **Layer 0.3.** The `0`-form of a function: Tau Ceti's `TauCeti.RoughForm.ofFunction`. -/
noncomputable abbrev RoughForm.ofFunction (I : ModelWithCorners ℝ E H) (f : M → F) :
    RoughForm I M F 0 :=
  TauCeti.RoughForm.ofFunction I f

/-- **Layer 0.4.** `Ω^k⟮I, M; F⟯`, the module of smooth `F`-valued `k`-forms: Tau Ceti's
`TauCeti.SmoothForm`. -/
abbrev SmoothForm (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F]
    (k : ℕ) : Type _ :=
  TauCeti.SmoothForm I M F k

end Forms

/-! ## Layer 1: the exterior derivative and its naturality -/

section ExtDeriv

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

/-- **Layer 1.1.** The exterior derivative: Tau Ceti's `TauCeti.mextDeriv`, under the name by
which modules of other roadmaps read it from this file. -/
noncomputable abbrev mextDeriv (φ : RoughForm I M F k) : RoughForm I M F (k + 1) :=
  TauCeti.mextDeriv φ

end ExtDeriv

/-! ## Layer 2: orientations and the orientation double cover -/

section Orientation

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} {M' : Type*} [TopologicalSpace M'] [ChartedSpace H' M']
  {ι : Type*} [Fintype ι] {n : WithTop ℕ∞}

/-- **Layer 2.1, the data of an orientation.** An orientation lift is a model orientation
together with *chart signs* `sign x y : ℤˣ` — the sign of the preferred chart at `x` at a point
`y` of *its source*; the signs are indexed by the source, so a lift carries no values off it —
locally constant on the source, and compatible with coordinate changes: on a common source the
product of the two signs is the sign of the transition Jacobian, computed within `Set.range I`
so that boundary points are included. Tau Ceti's `TauCeti.Manifold.OrientationLift` carries the
same data, with the coordinate-change law stated as a positivity; this structure, its quotient
`Manifold.Orientation` and the pullback below are the carriers on which AlgebraicTopology's
orientation comparison computes, chart sign by chart sign, and are kept for it. The theorems of
this layer are stated on Tau Ceti's orientations. -/
structure OrientationLift (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (ι : Type*) [Fintype ι] [FiniteDimensional ℝ E] where
  /-- The orientation of the model space. -/
  modelOrientation : Orientation ℝ E ι
  /-- `card_eq` makes the model orientation a genuine orientation of `E`. -/
  card_eq : Fintype.card ι = Module.finrank ℝ E
  /-- `sign x y` is the sign of the preferred chart at `x`, at a point `y` of its source. -/
  sign : (x : M) → (chartAt H x).source → ℤˣ
  /-- Signs are locally constant on the chart source. -/
  continuous_sign : ∀ x, Continuous (sign x)
  /-- Compatibility: two charts at a common point differ by the sign of their transition
  Jacobian. -/
  sign_mul_sign : ∀ x x' y (hy : y ∈ (chartAt H x).source) (hy' : y ∈ (chartAt H x').source),
    ((sign x ⟨y, hy⟩ * sign x' ⟨y, hy'⟩ : ℤˣ) : ℤ) =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt I x' ∘ (extChartAt I x).symm) (range I)
          (extChartAt I x y) : E →ₗ[ℝ] E)) : ℤ)

variable [FiniteDimensional ℝ E]

/-- **Layer 2.1.** Two lifts define the same orientation exactly when they are equal or both
flipped: the diagonal `ℤˣ`-action. Since the signs are indexed by chart sources, two lifts with
the same tangent orientations are related (Tau Ceti's `TauCeti.Manifold.Orientation.ext`). -/
def OrientationLift.setoid : Setoid (OrientationLift I M ι) where
  r l l' := l' = l ∨
    (l'.modelOrientation = -l.modelOrientation ∧ l'.sign = fun x y ↦ -l.sign x y)
  iseqv :=
    { refl := fun _ ↦ Or.inl rfl
      symm := by
        rintro l l' (rfl | ⟨h₁, h₂⟩)
        · exact Or.inl rfl
        · exact Or.inr ⟨by rw [h₁]; exact (neg_neg l.modelOrientation).symm,
            by rw [h₂]; funext x y; simp⟩
      trans := by
        rintro l l' l'' (rfl | ⟨h₁, h₂⟩) (rfl | ⟨h₃, h₄⟩)
        · exact Or.inl rfl
        · exact Or.inr ⟨h₃, h₄⟩
        · exact Or.inr ⟨h₁, h₂⟩
        · left
          have hmo : l''.modelOrientation = l.modelOrientation := by
            rw [h₃, h₁]; exact neg_neg l.modelOrientation
          have hs : l''.sign = l.sign := by rw [h₄, h₂]; funext x y; simp
          cases l; cases l''
          simp only at hmo hs
          subst hmo hs
          rfl }

variable (I M ι) in
/-- **Layer 2.1.** A manifold orientation: an orientation lift modulo the diagonal flip. -/
def Manifold.Orientation : Type _ :=
  Quotient (OrientationLift.setoid (I := I) (M := M) (ι := ι))

/-- **Layer 2.1.** The opposite orientation: flip the model orientation, keep the signs. -/
noncomputable def Manifold.Orientation.neg (o : Manifold.Orientation I M ι) :
    Manifold.Orientation I M ι :=
  Quotient.map (fun l ↦ { l with modelOrientation := -l.modelOrientation })
    (by
      rintro a b (rfl | ⟨h₁, h₂⟩)
      · exact Or.inl rfl
      · exact Or.inr ⟨by show -b.modelOrientation = - -a.modelOrientation; rw [h₁], h₂⟩) o

/-- **Layer 2.1.** The orientation of a tangent space induced by a manifold orientation. -/
noncomputable def orientationAt (o : Manifold.Orientation I M ι) (x : M) :
    Orientation ℝ (TangentSpace I x) ι :=
  Quotient.lift (fun l : OrientationLift I M ι ↦
      (if l.sign x ⟨x, mem_chart_source H x⟩ = 1 then l.modelOrientation
        else -l.modelOrientation : Orientation ℝ E ι))
    (by
      rintro a b (rfl | ⟨h₁, h₂⟩)
      · rfl
      · simp only [h₁, h₂]
        rcases Int.units_eq_one_or (a.sign x ⟨x, mem_chart_source H x⟩) with h | h
        · simp [h]
          exact (neg_neg a.modelOrientation).symm
        · simp [h]
          rfl)
    o


open Classical in
/-- **Layer 2.2.** The chart signs of the pullback orientation relative to a model orientation
`μ` of `E`. At a point `y` of the source of the preferred chart at `x` the sign is a product of
two signs. The first is `+1` exactly when `μ` is the orientation of `T_y M` (read in the chart at
`y`) carried back from `orientationAt o' (f y)` by the inverse of the differential of `f` at `y`.
The second is the sign of the Jacobian determinant, within `range I`, of the change from the
chart at `y` to the chart at `x`. -/
noncomputable def Manifold.Orientation.pullbackSign [FiniteDimensional ℝ E'] {f : M → M'}
    (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n) (o' : Manifold.Orientation I' M' ι)
    (μ : _root_.Orientation ℝ E ι) (x : M) (y : (chartAt H x).source) : ℤˣ :=
  (if _root_.Orientation.map ι
        (hf.mfderivToContinuousLinearEquiv (zero_lt_one.trans_le hn).ne' (y : M)).symm.toLinearEquiv
        (orientationAt o' (f y)) = μ then 1 else -1) *
    (if 0 < LinearMap.det (fderivWithin ℝ (extChartAt I x ∘ (extChartAt I (y : M)).symm)
        (range I) (extChartAt I (y : M) y) : E →ₗ[ℝ] E) then 1 else -1)

/-- **Layer 2.2.** The pulled-back chart signs are locally constant on the chart source: in a
fixed chart of `M'` near `f y₀` the tangent orientation of `o'` is constant, and the inverse of
the derivative of `f` written in that chart and the chart at `x` is continuous and invertible, so
its determinant keeps its sign [Lee, Prop. 15.15]. -/
theorem Manifold.Orientation.continuous_pullbackSign [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) (μ : _root_.Orientation ℝ E ι) (x : M) :
    Continuous (Manifold.Orientation.pullbackSign hf hn o' μ x) :=
  sorry

/-- **Layer 2.2.** The pulled-back chart signs satisfy the coordinate-change law of an
orientation lift: the tangent factors cancel in the product, and the two transition factors
multiply to the sign of the transition from the chart at `x` to the chart at `x'` by the chain
rule within `range I`. -/
theorem Manifold.Orientation.pullbackSign_mul_pullbackSign [FiniteDimensional ℝ E']
    [IsManifold I n M] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) (μ : _root_.Orientation ℝ E ι) (x x' y : M)
    (hy : y ∈ (chartAt H x).source) (hy' : y ∈ (chartAt H x').source) :
    ((Manifold.Orientation.pullbackSign hf hn o' μ x ⟨y, hy⟩ *
        Manifold.Orientation.pullbackSign hf hn o' μ x' ⟨y, hy'⟩ : ℤˣ) : ℤ) =
      (SignType.sign (LinearMap.det
        (fderivWithin ℝ (extChartAt I x' ∘ (extChartAt I x).symm) (range I)
          (extChartAt I x y) : E →ₗ[ℝ] E)) : ℤ) :=
  sorry

/-- **Layer 2.2.** The pullback orientation along a local diffeomorphism [Lee, Prop. 15.15]: the
class of the lift whose model orientation `μ` is the orientation of a basis of `E` indexed by `ι`
and whose chart signs are `Manifold.Orientation.pullbackSign hf hn o' μ`. The class does not
depend on the basis: replacing `μ` by `−μ` negates every chart sign, which is the diagonal flip.
Its tangent orientation at `x` is `orientationAt o' (f x)` carried back by the inverse of the
differential of `f` at `x`, so `f` preserves orientation from it at every point, as from Tau
Ceti's `TauCeti.Manifold.Orientation.pullback`.
The dimension hypothesis is discharged by `simp` for Euclidean sources indexed by `Fin m`. -/
noncomputable def Manifold.Orientation.pullback [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι)
    (hcard : Fintype.card ι = Module.finrank ℝ E := by simp) : Manifold.Orientation I M ι :=
  letI : DecidableEq ι := Classical.decEq ι
  let μ : _root_.Orientation ℝ E ι :=
    ((Module.finBasisOfFinrankEq ℝ E hcard.symm).reindex (Fintype.equivFin ι).symm).orientation
  Quotient.mk OrientationLift.setoid
    { modelOrientation := μ
      card_eq := hcard
      sign := Manifold.Orientation.pullbackSign hf hn o' μ
      continuous_sign := Manifold.Orientation.continuous_pullbackSign hf hn o' μ
      sign_mul_sign := Manifold.Orientation.pullbackSign_mul_pullbackSign hf hn o' μ }

/-- **Layer 2.2.** Conversely an orientation admits a positively oriented smooth top form; the
partition-of-unity direction carries `[T2Space M] [SigmaCompactSpace M]` [Lee, Prop. 15.5]. The
orientation is Tau Ceti's `TauCeti.Manifold.Orientation`, and the form is positive on every basis
of `T_x M` whose orientation is `o.orientationAt x`. -/
theorem exists_topForm_of_orientation [T2Space M] [SigmaCompactSpace M] [IsManifold I 1 M]
    [IsManifold I ∞ M] (o : TauCeti.Manifold.Orientation I M (Fin (Module.finrank ℝ E))) :
    ∃ φ : TauCeti.RoughForm I M ℝ (Module.finrank ℝ E), TauCeti.IsSmoothForm I ∞ φ ∧
      ∀ (x : M) (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x)),
        b.orientation = o.orientationAt x → 0 < φ x b :=
  sorry

/-- **Layer 2.2, the oriented-atlas criterion** [Lee, Prop. 15.6]: a boundaryless `C¹` manifold
is orientable, `TauCeti.Orientable I M`, exactly when it has an oriented atlas in Tau Ceti's sense,
`TauCeti.IsOrientedAtlas I 1`: charts of the maximal `C¹` atlas that cover `M` and whose
coordinate changes lie in `TauCeti.orientationPreservingGroupoid I` (differentiable within
`range I` with derivative of positive determinant). Tau Ceti proves that an oriented atlas gives
an orientation (`TauCeti.IsOrientedAtlas.orientable`); the converse is the target. Over the
half-space model `𝓡∂ n` the boundaryless hypothesis is needed only for `n = 1`: `Set.Icc 0 1`
over `𝓡∂ 1` is orientable but has no oriented atlas, since a chart at `0` increases and a chart
at `1` decreases, while for `n ≥ 2` the converse also holds with boundary [Lee, Prop. 15.6]. Over
a general model with corners it is needed in higher dimension too: a connected `3`-manifold with
one corner modelled on a cone that has no orientation-reversing linear automorphism and one
mirror-image corner is orientable but has no oriented atlas. -/
theorem orientable_iff_exists_atlas [BoundarylessManifold I M] [IsManifold I 1 M] :
    TauCeti.Orientable I M ↔
      ∃ A : Set (OpenPartialHomeomorph M H), TauCeti.IsOrientedAtlas I 1 A :=
  sorry

/-- **Layer 2.4, triviality of the orientation double cover** [Lee, Thm. 15.41, for connected
`M`]: a `C¹` manifold modelled on a finite-dimensional space is orientable exactly when its
orientation double cover `TauCeti.Manifold.OrientationCover I M` is trivial, that is when some
homeomorphism from `M × Fin 2` commutes with the projections. No connectedness is assumed. -/
theorem orientable_iff_exists_homeomorph_orientationCover [IsManifold I 1 M] :
    TauCeti.Orientable I M ↔
      ∃ e : M × Fin 2 ≃ₜ TauCeti.Manifold.OrientationCover I M, ∀ p, (e p).proj = p.1 :=
  sorry

end Orientation

section Averaging

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]

/-- **Layer 2.4.** The exterior derivative commutes with the averaging operator
`TauCeti.invariantPart τ φ = (φ + τ^*φ)/2` on `C¹` forms, for a `C²` self-map `τ` of a `C²`
manifold; `τ` need not be an involution. -/
theorem mextDeriv_invariantPart {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}
    [IsManifold I 1 M] [IsManifold I 2 M] {τ : M → M} (hτ : ContMDiff I I 2 τ)
    {φ : TauCeti.RoughForm I M F k} (hφ : TauCeti.IsSmoothForm I 1 φ) :
    TauCeti.mextDeriv (TauCeti.invariantPart τ φ) =
      TauCeti.invariantPart τ (TauCeti.mextDeriv φ) :=
  sorry

/-- **Layer 2.4.** The exterior derivative commutes with the averaging operator
`TauCeti.antiInvariantPart τ φ = (φ − τ^*φ)/2` on `C¹` forms, for a `C²` self-map `τ` of a `C²`
manifold. -/
theorem mextDeriv_antiInvariantPart {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}
    [IsManifold I 1 M] [IsManifold I 2 M] {τ : M → M} (hτ : ContMDiff I I 2 τ)
    {φ : TauCeti.RoughForm I M F k} (hφ : TauCeti.IsSmoothForm I 1 φ) :
    TauCeti.mextDeriv (TauCeti.antiInvariantPart τ φ) =
      TauCeti.antiInvariantPart τ (TauCeti.mextDeriv φ) :=
  sorry

end Averaging

/-! ## Layer 3: flows -/

section FlatFlow

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- **Layer 3.1, smooth dependence on initial conditions, flat and Banach-general.** A field
which is `C^(n+1)` near `a` has a local flow which is `C^(n+1)` jointly in time and initial
condition near `(a, 0)`, obeys the flow law, and solves the equation nearby. Tau Ceti has the
finite-dimensional case, `ODE.exists_contDiffAt_localFlow`; the Banach case is the target. -/
theorem exists_contDiffAt_localFlow_of_completeSpace [CompleteSpace E] {n : ℕ∞} (v : E → E) {a : E}
    {s : Set E} (hv : ContDiffOn ℝ (n + 1) v s) (hs : s ∈ 𝓝 a) :
    ∃ Φ : E → ℝ → E, ContDiffAt ℝ (n + 1) (fun p : E × ℝ ↦ Φ p.1 p.2) (a, 0) ∧
      (∀ x, Φ x 0 = x) ∧ (∀ x t u, Φ x (t + u) = Φ (Φ x t) u) ∧
      ∀ᶠ p in 𝓝 ((a, 0) : E × ℝ), HasDerivAt (Φ p.1) (v (Φ p.1 p.2)) p.2 :=
  sorry

end FlatFlow

section Flows

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] {n : WithTop ℕ∞}

variable [T2Space M] [BoundarylessManifold I M] [CompleteSpace E]

/-- **Layer 3.2, the Banach extension of Tau Ceti's maximal-flow API**: joint openness of the
domain of the maximal flow of a `C¹` field, with `[CompleteSpace E]` in place of
`[FiniteDimensional ℝ E]`. This generalizes `TauCeti.isOpen_maximalIntegralCurveFlowDomain`
verbatim; 3.1 is the input. -/
theorem isOpen_maximalIntegralCurveFlowDomain_of_completeSpace [IsManifold I 1 M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) :
    IsOpen (TauCeti.maximalIntegralCurveFlowDomain v) :=
  sorry

/-- **Layer 3.2, the Banach extension of Tau Ceti's maximal-flow API**: the maximal flow of a
`C^n` field, `1 ≤ n`, is jointly `C^n` in the point and the time on its (open) domain, with
`[CompleteSpace E]` in place of `[FiniteDimensional ℝ E]`. This generalizes
`TauCeti.contMDiffOn_maximalIntegralCurve` verbatim; 3.1 is the input. -/
theorem contMDiffOn_maximalIntegralCurve_of_completeSpace {n : ℕ∞} (hn : 1 ≤ n)
    [IsManifold I 1 M] [IsManifold I n M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent n (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) :
    ContMDiffOn (I.prod 𝓘(ℝ, ℝ)) I n (fun p : M × ℝ ↦ maximalIntegralCurve v p.1 p.2)
      (TauCeti.maximalIntegralCurveFlowDomain v) :=
  sorry

omit [CompleteSpace E] in
/-- **Layer 3.3, homogeneity.** ⚠ Finite dimension is genuinely needed: on an
infinite-dimensional model every continuous compactly supported field is zero. For connected
boundaryless finite-dimensional `M`, any two points are related by the time-`1` flow of a
compactly supported smooth field. -/
theorem exists_flowOf_one_eq [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    [ConnectedSpace M]
    (x y : M) :
    ∃ v : (x : M) → TangentSpace I x,
      ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)) ∧
        (∃ K : Set M, IsCompact K ∧ ∀ z ∉ K, v z = 0) ∧ TauCeti.flowOf v 1 x = y :=
  sorry

omit [CompleteSpace E] in
/-- **Layer 3.4, the flow characterization of the Lie derivative** [Lee, Thm. 9.38]: the
derivative at `t = 0` of the pulled-back field is the bracket. -/
theorem hasDerivAt_mpullback_flowOf [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    {v w : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hw : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, w y⟩ : TangentBundle I M))) (x : M) :
    HasDerivAt (fun t ↦ VectorField.mpullback I I (TauCeti.flowOf v t) w x)
      (VectorField.mlieBracket I v w x) 0 :=
  sorry

omit [CompleteSpace E] in
/-- **Layer 3.4, the straightening theorem** [Lee, Thm. 9.22], layer 4's base case: near a
point where `v ≠ 0` there is a chart carrying `v` to the constant field `u`. -/
theorem exists_chart_mfderiv_eq_const [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {x : M}
    (hx : v x ≠ 0) :
    ∃ (e : OpenPartialHomeomorph M H) (u : E), e ∈ IsManifold.maximalAtlas I ∞ M ∧
      x ∈ e.source ∧ ∀ y ∈ e.source, mfderiv I 𝓘(ℝ, E) (I ∘ e) y (v y) = u :=
  sorry

/-- **Layer 3.5, the local `C¹` time-dependent flow** [Lee, Thm. 9.48]: a jointly `C¹`
time-dependent field on the time slab `ℝ` over a Banach model has, near every initial time `t₀`
and point `x₀`, a family `Ψ t (s, x)` of solutions, the one through `x` at time `s` read at time
`t`, which start at their initial point, solve the nonautonomous equation at times near their
initial time, and depend `C¹` jointly on the final time, the initial time and the initial point
at `(t₀, (t₀, x₀))`. The joint dependence is what 3.1 supplies, through the autonomous suspension
`(1, v)` on `ℝ × M`; existence of each solution separately is Mathlib's
`exists_isMIntegralCurveAt_of_contMDiffAt` for the suspension. -/
theorem exists_timeDependentFlow [IsManifold I 1 M] {v : ℝ → (x : M) → TangentSpace I x}
    (hv : ContMDiff (𝓘(ℝ, ℝ).prod I) I.tangent 1
      (fun p : ℝ × M ↦ (⟨p.2, v p.1 p.2⟩ : TangentBundle I M))) (t₀ : ℝ) (x₀ : M) :
    ∃ (U : Set (ℝ × M)) (Ψ : ℝ → ℝ × M → M), IsOpen U ∧ (t₀, x₀) ∈ U ∧
      (∀ p ∈ U, Ψ p.1 p = p.2) ∧
      (∀ p ∈ U, ∀ᶠ t in 𝓝 p.1, HasMFDerivAt 𝓘(ℝ, ℝ) I (fun s ↦ Ψ s p) t
        (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (v t (Ψ t p)))) ∧
      ContMDiffAt ((𝓘(ℝ, ℝ)).prod ((𝓘(ℝ, ℝ)).prod I)) I 1
        (fun q : ℝ × (ℝ × M) ↦ Ψ q.1 q.2) (t₀, (t₀, x₀)) :=
  sorry

end Flows

section NonautonomousFlows
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [CompleteSpace E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [BoundarylessManifold I M] [T2Space M]

/-- **Layer 3.5.** The autonomous suspension `(1, X)` of a time-dependent field on the open time
slab `↥J × M`. -/
def suspendedTimeField (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x) (p : ↥J × M) :
    TangentSpace ((𝓘(ℝ, ℝ)).prod I) p := (1, v p.1 p.2)

/-- **Layer 3.5.** The maximal two-time domain, ordered as (target time, initial time, initial
point): the suspended solution through `(s, x)` exists at elapsed time `t − s`. -/
def timeDependentFlowDomain (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x) : Set (↥J × (↥J × M)) :=
  {p | ((p.1 : ℝ) - (p.2.1 : ℝ), (p.2.1, p.2.2)) ∈
    TauCeti.flowDomain (suspendedTimeField J v)}

/-- **Layer 3.5.** The time-dependent flow, the `M` component of the suspended flow; values
outside the maximal domain are junk. -/
noncomputable def timeDependentFlow (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x) (t s : ↥J) (x : M) : M :=
  (TauCeti.flowOf (suspendedTimeField J v) ((t : ℝ) - (s : ℝ)) (s, x)).2

/-- **Layer 3.5, the fundamental theorem on time-dependent flows** [Lee, Thm. 9.48], on an open
time slab over a Banach model: the two-time domain is open, the flow is jointly smooth on it,
equals the identity at equal times, solves the equation in the target time, and satisfies the
two-time composition and inverse laws. -/
theorem timeDependentFlow_spec (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x)
    (hv : ContMDiff ((𝓘(ℝ, ℝ)).prod I) I.tangent ∞
      (fun p : ↥J × M => (⟨p.2, v p.1 p.2⟩ : TangentBundle I M))) :
    IsOpen (timeDependentFlowDomain J v) ∧
    ContMDiffOn ((𝓘(ℝ, ℝ)).prod ((𝓘(ℝ, ℝ)).prod I)) I ∞
      (fun p : ↥J × (↥J × M) => timeDependentFlow J v p.1 p.2.1 p.2.2)
      (timeDependentFlowDomain J v) ∧
    (∀ s x, (s, s, x) ∈ timeDependentFlowDomain J v ∧
      timeDependentFlow J v s s x = x) ∧
    (∀ t s x, (t, s, x) ∈ timeDependentFlowDomain J v →
      HasMFDerivAt 𝓘(ℝ, ℝ) I (fun r : ↥J => timeDependentFlow J v r s x) t
        (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ)
          (v t (timeDependentFlow J v t s x)))) ∧
    (∀ r t s x, (t, s, x) ∈ timeDependentFlowDomain J v →
      (r, t, timeDependentFlow J v t s x) ∈ timeDependentFlowDomain J v →
      (r, s, x) ∈ timeDependentFlowDomain J v ∧
      timeDependentFlow J v r t (timeDependentFlow J v t s x) =
        timeDependentFlow J v r s x) ∧
    (∀ t s x, (t, s, x) ∈ timeDependentFlowDomain J v →
      (s, t, timeDependentFlow J v t s x) ∈ timeDependentFlowDomain J v ∧
      timeDependentFlow J v s t (timeDependentFlow J v t s x) = x) := by
  sorry

omit [CompleteSpace E] in
/-- **Layer 3.5.** On a compact finite-dimensional manifold every pair of times in an open
interval `J` is admissible, so the time-dependent flow is global on `J`. -/
theorem timeDependentFlowDomain_eq_univ [FiniteDimensional ℝ E] [CompactSpace M]
    (J : TopologicalSpace.Opens ℝ) (hJ : OrdConnected (J : Set ℝ))
    (v : ↥J → (x : M) → TangentSpace I x)
    (hv : ContMDiff ((𝓘(ℝ, ℝ)).prod I) I.tangent ∞
      (fun p : ↥J × M => (⟨p.2, v p.1 p.2⟩ : TangentBundle I M))) :
    timeDependentFlowDomain J v = Set.univ := by
  sorry
end NonautonomousFlows

/-! ## Layer 4: the Frobenius theorem -/

section Frobenius

universe u

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type u} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [FiniteDimensional ℝ E]
  {n : WithTop ℕ∞} {k : ℕ}

namespace Distribution

/-- **Layer 4.2.** A smooth rank-`k` distribution with a smooth integral
manifold through every point is involutive, in Tau Ceti's local sense (brackets of fields that are
differentiable and tangent to `D` on an open set stay tangent to `D` there). There is no merely
continuous specialization. -/
theorem isInvolutive_of_forall_exists_integralManifold
    [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D)
    (h : ∀ x : M, ∃ N : TauCeti.IntegralManifold.{u, u} (I := I) ∞ D k, x ∈ range N.map) :
    TauCeti.IsInvolutiveDistribution I D :=
  sorry

/-- **Layer 4.2, the annihilating-one-form criterion.** A smooth rank-`k`
distribution on a Hausdorff manifold is involutive exactly when every smooth `1`-form vanishing on
`D` has exterior derivative vanishing on pairs of vectors of `D`. Hausdorffness supplies the local
bump extensions this global formulation uses. -/
theorem isInvolutive_iff_forall_mextDeriv
    [IsManifold I ∞ M] [T2Space M] {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D) :
    TauCeti.IsInvolutiveDistribution I D ↔ ∀ η : TauCeti.RoughForm I M ℝ 1,
      TauCeti.IsSmoothForm I ∞ η →
      (∀ x, ∀ v ∈ D x, η x ![v] = 0) →
      ∀ x, ∀ v ∈ D x, ∀ w ∈ D x,
        TauCeti.mextDeriv η x ![v, w] = 0 :=
  sorry

/-- **Layer 4.3, local Frobenius.** A smooth involutive rank-`k` distribution
on a Hausdorff boundaryless manifold has a flat chart at every point, one carrying `D` to a fixed
`k`-dimensional subspace of the model. Extend Tau Ceti's graph-coordinate Frobenius API. -/
theorem exists_flatChart [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M] {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D) (hInv : TauCeti.IsInvolutiveDistribution I D)
    (x : M) :
    ∃ (e : OpenPartialHomeomorph M H) (W : Submodule ℝ E),
      e ∈ IsManifold.maximalAtlas I ∞ M ∧ x ∈ e.source ∧
      Module.finrank ℝ W = k ∧
      ∀ y ∈ e.source,
        Submodule.map (mfderiv I 𝓘(ℝ, E) (I ∘ e) y).toLinearMap (D y) = W :=
  sorry

/-- **Layer 4.3, local integral slices.** Through every point passes an integral manifold which,
in a smooth chart of `M` with values in the model space (smooth with smooth inverse), is exactly
a `k`-dimensional affine slice: the chart carries the part of the integral manifold in its source
onto the part of the affine subspace `P` in its target, in the sense of Tau Ceti's
`TauCeti.IsSliceChart`. The model slice is an affine subspace of dimension `k`; with an arbitrary
model set the slice clause would hold for every chart and every set (take the image itself). -/
theorem exists_isSliceChart_integralManifold
    [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D) (hInv : TauCeti.IsInvolutiveDistribution I D)
    (x : M) :
    ∃ (N : TauCeti.IntegralManifold.{u, u} (I := I) ∞ D k) (e : OpenPartialHomeomorph M E)
      (P : AffineSubspace ℝ E),
      x ∈ range N.map ∧ x ∈ e.source ∧ Module.finrank ℝ P.direction = k ∧
      ContMDiffOn I 𝓘(ℝ, E) ∞ e e.source ∧ ContMDiffOn 𝓘(ℝ, E) I ∞ e.symm e.target ∧
      TauCeti.IsSliceChart e (P : Set E) (range N.map) :=
  sorry

/-- **Layer 4.3, weak embeddedness.** A smooth map from a finite-dimensional
smooth Hausdorff second-countable boundaryless manifold into `M` whose image lies in an
injectively immersed integral manifold with second-countable carrier factors smoothly through
it. -/
theorem exists_contMDiff_factor [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M] {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D) (hInv : TauCeti.IsInvolutiveDistribution I D)
    (N : TauCeti.IntegralManifold.{u, u} (I := I) ∞ D k) (hinj : Function.Injective N.map)
    [SecondCountableTopology N.carrier]
    {E' H' P : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [FiniteDimensional ℝ E'] [TopologicalSpace H']
    {J : ModelWithCorners ℝ E' H'} [TopologicalSpace P]
    [ChartedSpace H' P] [IsManifold J ∞ P]
    [BoundarylessManifold J P] [T2Space P] [SecondCountableTopology P]
    {f : P → M} (hf : ContMDiff J I ∞ f)
    (hrange : range f ⊆ range N.map) :
    ∃ g : P → N.carrier, ContMDiff J (𝓡 k) ∞ g ∧
      N.map ∘ g = f :=
  sorry

/-- **Layer 4.4, global leaves** [Lee, Thm. 19.21]: through every point of a smooth Hausdorff
boundaryless manifold, an involutive smooth distribution has a leaf — a connected, injectively
immersed integral manifold with its own charted carrier (not the subspace topology on its image)
which contains the image of every connected integral manifold meeting it. This maximality makes
the leaf images a partition of `M`, since two leaves that meet contain each other. A leaf is
second countable when `M` is. -/
theorem exists_leaf [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D) (hInv : TauCeti.IsInvolutiveDistribution I D)
    (x : M) :
    ∃ N : TauCeti.IntegralManifold.{u, u} (I := I) ∞ D k, x ∈ range N.map ∧
      ConnectedSpace N.carrier ∧ Function.Injective N.map ∧
      (∀ N' : TauCeti.IntegralManifold.{u, u} (I := I) ∞ D k, ConnectedSpace N'.carrier →
        (range N'.map ∩ range N.map).Nonempty →
          range N'.map ⊆ range N.map) ∧
      (SecondCountableTopology M → SecondCountableTopology N.carrier) :=
  sorry

end Distribution

end Frobenius

/-! ## Layer 5: integration on manifolds and Stokes' theorem -/

section PlanarPrimitive

open Complex Metric

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]

/-- **Layer 5.4, the planar degree-one formula.** The value at `z` of the homotopy operator of
the radial contraction to `a` applied to `P dx + Q dy`: integrate along the radial segment
from `a` to `z`. -/
noncomputable def planarRadialPrimitive (P Q : ℂ → F) (a z : ℂ) : F :=
  (z - a).re • (∫ t : ℝ in (0)..1, P (a + t • (z - a))) +
    (z - a).im • (∫ t : ℝ in (0)..1, Q (a + t • (z - a)))

/-- **Layer 5.4.** On a disk, a smooth closed `P dx + Q dy` (equality of the cross-partials) has
the radial primitive: `∂ₓg = P` and `∂ᵧg = Q`. -/
theorem planarRadialPrimitive_hasFDerivAt {P Q : ℂ → F} {a : ℂ} {r : ℝ}
    (hr : 0 < r) (hP : ContDiffOn ℝ ∞ P (ball a r))
    (hQ : ContDiffOn ℝ ∞ Q (ball a r))
    (hclosed : ∀ z ∈ ball a r, fderiv ℝ P z I = fderiv ℝ Q z 1)
    {z : ℂ} (hz : z ∈ ball a r) :
    HasFDerivAt (planarRadialPrimitive P Q a)
      (reCLM.smulRight (P z) + imCLM.smulRight (Q z)) z := by
  sorry

end PlanarPrimitive

section MovingMaps

variable {E F G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [NormedAddCommGroup G] [NormedSpace ℝ G] {k : ℕ}

/-- **Layer 5.4a, flat model.** Contraction along a map: insert the field `V` along `p` in the
first slot, then pull the remaining slots back along `p`. -/
noncomputable def contractionAlongMap (p : E → F) (V : E → F)
    (form : F → F [⋀^Fin (k + 1)]→L[ℝ] G) (x : E) : E [⋀^Fin k]→L[ℝ] G :=
  ((form (p x)).curryLeft (V x)).compContinuousLinearMap (fderiv ℝ p x)

/-- **Layer 5.4a.** The contraction of a family `P : E × ℝ → F` at time `t`, with the manifold
variable first and the time second. -/
noncomputable def familyContraction (P : E × ℝ → F) (t : ℝ)
    (form : F → F [⋀^Fin (k + 1)]→L[ℝ] G) : E → E [⋀^Fin k]→L[ℝ] G :=
  contractionAlongMap (fun x ↦ P (x, t)) (fun x ↦ fderiv ℝ P (x, t) (0, 1)) form

/-- **Layer 5.4a, differentiation of pullback**, flat model:
`∂ₜ(pₜ^*ω) = d(C_(pₜ,Vₜ)ω) + C_(pₜ,Vₜ)(dω)`. No invertibility of the slices and no
completeness of the coefficient space is required. -/
theorem moving_pullback_hasDerivAt
    (P : E × ℝ → F) (form : F → F [⋀^Fin (k + 1)]→L[ℝ] G)
    (hP : ContDiff ℝ ∞ P) (hform : ContDiff ℝ ∞ form) (x : E) (t : ℝ) :
    HasDerivAt
      (fun s ↦ (form (P (x, s))).compContinuousLinearMap
        (fderiv ℝ (fun y ↦ P (y, s)) x))
      (extDeriv (familyContraction P t form) x +
        familyContraction P t (extDeriv form) x) t := by
  sorry

end MovingMaps

section Densities

/-- **Layer 5.5a.** A density on a real vector space: a function of `m`-tuples that transforms
by `|det|`. -/
structure Density (V : Type*) [AddCommGroup V] [Module ℝ V] (m : ℕ) where
  toFun : (Fin m → V) → ℝ
  map_comp : ∀ (T : V →ₗ[ℝ] V) (v : Fin m → V), toFun (T ∘ v) = |LinearMap.det T| * toFun v

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] {m : ℕ}

/-- **Layer 5.5a.** Rough densities on a manifold. -/
abbrev RoughDensity (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (m : ℕ) : Type _ :=
  (x : M) → Density (TangentSpace I x) m

end Densities

section StandardSimplex

/-- **Layer 5.5b.** The full-dimensional standard simplex `Δᵖ = {x ∈ ℝᵖ | 0 ≤ xᵢ, Σ xᵢ ≤ 1}`:
Tau Ceti's `TauCeti.fullSimplex`, under the name by which modules of other roadmaps read it from
this file. ⚠ Mathlib's barycentric `Convexity.StdSimplex` lies in a hyperplane and is the wrong
domain to integrate over directly. -/
noncomputable abbrev fullSimplex (p : ℕ) : Set (EuclideanSpace ℝ (Fin p)) :=
  TauCeti.fullSimplex p

/-- **Layer 5.5b.** The homeomorphism to Mathlib's barycentric simplex, Tau Ceti's
`TauCeti.fullSimplexEquivStdSimplex`: the weight at `0` is `1 - Σ xᵢ`, and the weight at `i.succ`
is the coordinate `xᵢ`. -/
noncomputable abbrev fullSimplexEquivStdSimplex (p : ℕ) :
    fullSimplex p ≃ₜ Convexity.StdSimplex ℝ (Fin (p + 1)) :=
  TauCeti.fullSimplexEquivStdSimplex p

end StandardSimplex

/-! ## Layer 9: Poincaré duality -/

section PoincareDuality

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M]

/-- **Layer 9.2, top cohomology** [Lee, Thm. 17.30]: on a connected oriented boundaryless
Hausdorff σ-compact smooth manifold of dimension `n`, integration
`TauCeti.compactlySupportedDeRhamCohomology.integral o : H^n_c(M) → ℝ` is a bijection. The
orientation is indexed by `Fin n`, which makes `n` the dimension of the model. -/
theorem bijective_integral_compactlySupportedDeRhamCohomology [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M] [SigmaCompactSpace M] [ConnectedSpace M] {n : ℕ}
    (o : TauCeti.Manifold.Orientation I M (Fin n)) :
    Function.Bijective (TauCeti.compactlySupportedDeRhamCohomology.integral o) :=
  sorry

/-- **Layer 9.2** [Lee, Thm. 17.34]: the top compactly supported cohomology of a connected
nonorientable boundaryless Hausdorff σ-compact smooth manifold vanishes, by descent along the
orientation double cover. -/
theorem subsingleton_compactlySupportedDeRhamCohomology_of_not_orientable [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M] [SigmaCompactSpace M] [ConnectedSpace M]
    (h : ¬ TauCeti.Orientable I M) :
    Subsingleton (TauCeti.compactlySupportedDeRhamCohomology I M (Module.finrank ℝ E)) :=
  sorry

/-- **Layer 9.3, Poincaré duality** [Lee, Problems 18-6 to 18-8; Bott–Tu, I §5]: on an oriented
boundaryless Hausdorff σ-compact smooth manifold of dimension `k + l`, with no compactness
hypothesis, the Poincaré pairing `TauCeti.poincarePairing I M o` identifies `H^k_dR(M)` with the
dual of `H^l_c(M)`. -/
theorem bijective_poincarePairing [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    [SigmaCompactSpace M] {k l : ℕ} (o : TauCeti.Manifold.Orientation I M (Fin (k + l))) :
    Function.Bijective (TauCeti.poincarePairing I M o :
      TauCeti.deRhamCohomology I M k →
        Module.Dual ℝ (TauCeti.compactlySupportedDeRhamCohomology I M l)) :=
  sorry

end PoincareDuality

/-! ## Layer 10: the Brouwer mapping degree -/

section Degree

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N]

/-- **Layer 10.3–10.4, the integral formula for the degree** [Lee, Thm. 17.35]: for a smooth map
`f : M → N` between compact connected oriented boundaryless Hausdorff manifolds of the same
dimension `n ≥ 1`, a regular value `y` of `f` and a smooth top form `η` on `N`,
`∫_M f^*η = (degreeAtRegularValue o o' f y) · ∫_N η`, with Tau Ceti's signed count
`TauCeti.degreeAtRegularValue` and integral of top forms `TauCeti.integralTopForm`. Hence the
signed count does not depend on the regular value. -/
theorem integralTopForm_mpullback_eq_degreeAtRegularValue_mul [IsManifold I 1 M]
    [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M] [CompactSpace M] [ConnectedSpace M]
    [IsManifold J 1 N] [IsManifold J ∞ N] [BoundarylessManifold J N] [T2Space N] [CompactSpace N]
    [ConnectedSpace N] {n : ℕ} (hn : 1 ≤ n) (o : TauCeti.Manifold.Orientation I M (Fin n))
    (o' : TauCeti.Manifold.Orientation J N (Fin n)) {f : M → N} (hf : ContMDiff I J ∞ f) {y : N}
    (hy : TauCeti.IsRegularValue I J f y) {η : TauCeti.RoughForm J N ℝ n}
    (hη : TauCeti.IsSmoothForm J ∞ η) :
    TauCeti.integralTopForm o (TauCeti.mpullback I J f η) =
      (TauCeti.degreeAtRegularValue o o' f y : ℝ) * TauCeti.integralTopForm o' η :=
  sorry

end Degree
/-! ## Layer 11: the hairy ball theorem -/

section HairyBall

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
  [Fact (Module.finrank ℝ E = n + 1)]

/-- **Layer 11.1, the hairy ball theorem** [Lee, Problem 16-6]: a continuous tangent vector field
on an even-dimensional sphere vanishes somewhere. The field is a map `v : E → E` which is
continuous on the unit sphere `Sⁿ ⊆ E` and tangent to it, `⟪v x, x⟫ = 0`; the dimension `n` of
the sphere is even. For `n = 0` the sphere is two points and every tangent vector is `0`. The
route is the mapping degree of Layer 10: a nowhere-vanishing field gives a homotopy from the
identity of `Sⁿ` to the antipodal map, whose degree `(−1)^(n+1)` is `−1` for even `n`. -/
theorem exists_eq_zero_of_inner_eq_zero (hn : Even n) {v : E → E}
    (hv : ContinuousOn v (Metric.sphere (0 : E) 1))
    (ht : ∀ x ∈ Metric.sphere (0 : E) 1, ⟪v x, x⟫_ℝ = 0) :
    ∃ x ∈ Metric.sphere (0 : E) 1, v x = 0 :=
  sorry

/-- **Layer 11.2, the section form of the hairy ball theorem**: a continuous section of the
tangent bundle of the even-dimensional unit sphere, Mathlib's manifold `sphere (0 : E) 1` over
`𝓡 n`, vanishes at some point. It is bridged to 11.1 by composing with the differential of the
inclusion, whose range is the orthogonal complement of `x` (`range_mfderiv_coe_sphere`). -/
theorem exists_eq_zero_of_continuous_section (hn : Even n)
    {V : (x : Metric.sphere (0 : E) 1) → TangentSpace (𝓡 n) x}
    (hV : Continuous
      (fun x ↦ (⟨x, V x⟩ : TangentBundle (𝓡 n) (Metric.sphere (0 : E) 1)))) :
    ∃ x, V x = 0 :=
  sorry

end HairyBall

/-! ## Layer 12: Riemannian metrics and the Laplace–Beltrami operator -/

section ImmersionMetrics
variable {ES FS HS HN SM NM : Type*}
  [NormedAddCommGroup ES] [NormedSpace ℝ ES]
  [NormedAddCommGroup FS] [NormedSpace ℝ FS]
  [TopologicalSpace HS] [TopologicalSpace HN]
  {IS : ModelWithCorners ℝ ES HS} {IN : ModelWithCorners ℝ FS HN}
  [TopologicalSpace SM] [ChartedSpace HS SM]
  [TopologicalSpace NM] [ChartedSpace HN NM]
/-- **Layer 12.1.** The metric pulled back along a map with injective differential: its inner
product is the target's inner product of the `mfderiv` images. Only the source must be finite
dimensional; its regularity is a target of README 12.1. -/
@[instance_reducible]
noncomputable def immersionMetric [FiniteDimensional ℝ ES]
    [IsManifold IS 1 SM] [IsManifold IN 1 NM]
    [RiemannianBundle (fun x : NM => TangentSpace IN x)]
    (f : SM → NM) (hinj : ∀ x, Function.Injective (mfderiv IS IN f x)) :
    RiemannianBundle (fun x : SM => TangentSpace IS x) :=
  letI g : RiemannianMetric (fun y : NM => TangentSpace IN y) := RiemannianBundle.g
  letI A : (x : SM) → ES →L[ℝ] FS := fun x ↦ mfderiv IS IN f x
  ⟨{ inner := fun x ↦ ((g.inner (f x) : FS →L[ℝ] FS →L[ℝ] ℝ).bilinearComp (A x) (A x) :
        ES →L[ℝ] ES →L[ℝ] ℝ)
     symm := fun x v w ↦ g.symm (f x) (A x v) (A x w)
     pos := fun x v hv ↦ g.pos (f x) (A x v) ((map_ne_zero_iff _ (hinj x)).2 hv)
     continuousAt := fun x ↦ (g.continuousAt (f x)).comp_of_eq (A x).continuous.continuousAt
        (map_zero _)
     isVonNBounded := fun x ↦ by
       obtain ⟨K, -, hK⟩ := ((A x : ES →L[ℝ] FS) : ES →ₗ[ℝ] FS).exists_antilipschitzWith
         (LinearMap.ker_eq_bot.2 (hinj x))
       obtain ⟨R, hR⟩ := ((NormedSpace.isVonNBounded_iff (E := FS) ℝ).1
         (g.isVonNBounded (f x))).exists_norm_le
       refine (NormedSpace.isVonNBounded_closedBall ℝ ES (K * R)).subset fun (v : ES) hv ↦ ?_
       have hv' : ‖v‖ ≤ K * R :=
         calc ‖v‖ ≤ K * ‖A x v‖ :=
               ZeroHomClass.bound_of_antilipschitz ((A x : ES →L[ℝ] FS) : ES →ₗ[ℝ] FS) hK v
           _ ≤ K * R := by gcongr; exact hR _ hv
       exact mem_closedBall_zero_iff.2 hv' }⟩
end ImmersionMetrics

section SupportedBoundaryDivergence

variable {n : ℕ} {M : Type*} [TopologicalSpace M]
  [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
  [IsManifold (𝓡∂ (n + 1)) ∞ M] [T2Space M] [SecondCountableTopology M]
  [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]
  [RiemannianBundle (fun x : M => TangentSpace (𝓡∂ (n + 1)) x)]
  [IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) ∞
    (EuclideanSpace ℝ (Fin (n + 1))) (fun x : M => TangentSpace (𝓡∂ (n + 1)) x)]
  [IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin (n + 1)))
    (fun x : M => TangentSpace (𝓡∂ (n + 1)) x)]

/-- Restrict smooth ambient metric regularity explicitly for the native divergence API. -/
local instance :
    IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) 1
      (EuclideanSpace ℝ (Fin (n + 1))) (fun x : M => TangentSpace (𝓡∂ (n + 1)) x) :=
  IsContMDiffRiemannianBundle.of_le (n := ∞) (by simp)

local instance :
    IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ ((𝓡∂ (n + 1)).boundary M) :=
  TauCeti.isManifold_boundary (n := n) (k := ∞) M (by simp)

/-- **Layer 12.5.** The induced boundary metric, pulled back by Tau Ceti's boundary immersion. -/
@[instance_reducible]
noncomputable def halfSpaceBoundaryMetric :
    RiemannianBundle (fun x : (𝓡∂ (n + 1)).boundary M =>
      TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x) :=
  immersionMetric (IS := 𝓘(ℝ, EuclideanSpace ℝ (Fin n))) (IN := 𝓡∂ (n + 1))
    (fun x : (𝓡∂ (n + 1)).boundary M => (x : M))
    ((TauCeti.isImmersion_subtypeVal_boundary (n := n) (k := ∞) M
      (by simp)).mfderiv_injective (by simp))

attribute [local instance] halfSpaceBoundaryMetric

/-- **Layer 12.5.** The induced boundary metric is continuous, so that it has a Riemannian
volume. -/
theorem halfSpaceBoundaryMetric_continuous :
    IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin n))
      (fun x : (𝓡∂ (n + 1)).boundary M =>
        TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x) := by
  sorry

/-- **Layer 12.5.** The boundary measure: Tau Ceti's `TauCeti.riemannianVolume` of the induced
boundary metric. The continuity instance it needs is supplied by the admitted theorem
`halfSpaceBoundaryMetric_continuous`; since that instance is a proposition, the measure does not
depend on how it is proved. -/
noncomputable def halfSpaceBoundaryVolume : MeasureTheory.Measure ((𝓡∂ (n + 1)).boundary M) := by
  have := halfSpaceBoundaryMetric_continuous (n := n) (M := M)
  exact TauCeti.riemannianVolume 𝓘(ℝ, EuclideanSpace ℝ (Fin n))
    ((𝓡∂ (n + 1)).boundary M)

/-- **Layer 12.5.** A smooth outward unit normal along the boundary exists: for the ambient metric
it has norm one, points outward (`TauCeti.IsOutwardPointing`), and is orthogonal to the image of the
boundary's tangent space. These three laws determine it at every boundary point, so the
divergence theorem below may take any field satisfying them. -/
theorem exists_halfSpaceOutwardUnitNormal :
    ∃ N : (x : (𝓡∂ (n + 1)).boundary M) → TangentSpace (𝓡∂ (n + 1)) (x : M),
      ContMDiff 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)).tangent ∞
        (fun x : (𝓡∂ (n + 1)).boundary M =>
          (⟨(x : M), N x⟩ : TangentBundle (𝓡∂ (n + 1)) M)) ∧
      ∀ x, ‖N x‖ = 1 ∧ TauCeti.IsOutwardPointing (x : M) (N x) ∧
        ∀ w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x,
          inner ℝ (N x)
            (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val x w) = 0 := by
  sorry

/-- **Layer 12.5.** Under compactness of `M` or compact support of `X`, the divergence and the
outward flux `⟪X, N⟫` are integrable for the Riemannian volume and the induced boundary measure,
so neither side of the divergence theorem is a junk value of the Bochner integral. -/
theorem integrable_divergence_and_boundaryFlux
    {X : (x : M) → TangentSpace (𝓡∂ (n + 1)) x}
    (hX : ContMDiff (𝓡∂ (n + 1)) (𝓡∂ (n + 1)).tangent ∞
      (fun x => (⟨x, X x⟩ : TangentBundle (𝓡∂ (n + 1)) M)))
    (hSupport : IsCompact (Set.univ : Set M) ∨
      ∃ K : Set M, IsCompact K ∧ ∀ x ∉ K, X x = 0)
    {N : (x : (𝓡∂ (n + 1)).boundary M) → TangentSpace (𝓡∂ (n + 1)) (x : M)}
    (hN : ∀ x, ‖N x‖ = 1 ∧ TauCeti.IsOutwardPointing (x : M) (N x) ∧
      ∀ w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x,
        inner ℝ (N x)
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val x w) = 0) :
    MeasureTheory.Integrable (TauCeti.Manifold.divergence (𝓡∂ (n + 1)) X)
        (TauCeti.riemannianVolume (𝓡∂ (n + 1)) M) ∧
      MeasureTheory.Integrable (fun x : (𝓡∂ (n + 1)).boundary M => inner ℝ (X (x : M)) (N x))
        (halfSpaceBoundaryVolume (n := n) (M := M)) := by
  sorry

/-- **Layer 12.5, the Riemannian divergence theorem with boundary** [Lee, Thm. 16.32], for a
Hausdorff second-countable smooth manifold over the half-space model, with no orientability
assumption: `∫_M div X dV = ∫_{∂M} ⟪X, N⟫ dṼ` for the outward unit normal `N` and the induced
boundary measure, when `M` is compact or `X` is compactly supported. The constant field `1` on
the half-line is excluded by the support hypothesis. -/
theorem integral_divergence_eq_boundaryFlux
    {X : (x : M) → TangentSpace (𝓡∂ (n + 1)) x}
    (hX : ContMDiff (𝓡∂ (n + 1)) (𝓡∂ (n + 1)).tangent ∞
      (fun x => (⟨x, X x⟩ : TangentBundle (𝓡∂ (n + 1)) M)))
    (hSupport : IsCompact (Set.univ : Set M) ∨
      ∃ K : Set M, IsCompact K ∧ ∀ x ∉ K, X x = 0)
    {N : (x : (𝓡∂ (n + 1)).boundary M) → TangentSpace (𝓡∂ (n + 1)) (x : M)}
    (hN : ∀ x, ‖N x‖ = 1 ∧ TauCeti.IsOutwardPointing (x : M) (N x) ∧
      ∀ w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x,
        inner ℝ (N x)
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val x w) = 0) :
    (∫ x, TauCeti.Manifold.divergence (𝓡∂ (n + 1)) X x
      ∂TauCeti.riemannianVolume (𝓡∂ (n + 1)) M) =
      ∫ x : (𝓡∂ (n + 1)).boundary M, inner ℝ (X (x : M)) (N x)
        ∂halfSpaceBoundaryVolume (n := n) (M := M) := by
  sorry

end SupportedBoundaryDivergence

section RoundMetric

local instance : Fact (Module.finrank ℝ ℂ = 1 + 1) := ⟨by simp⟩

/-- **Layer 12.1.** The round metric on the circle, the pullback of the ambient inner product along
the inclusion; `volume_circle` is the gate `vol(S¹) = 2π`, reusing the angular integral gate from 5.5a. -/
@[expose, instance_reducible]
noncomputable def roundMetricCircle : RiemannianBundle (fun x : Circle ↦ TangentSpace (𝓡 1) x) :=
  inferInstanceAs (RiemannianBundle
    (fun x : Metric.sphere (0 : ℂ) 1 ↦ TangentSpace (𝓡 1) x))

/-- **Layer 12.1, the circle volume gate**: `vol(S¹) = 2π` for the Riemannian volume of the native
round metric `roundMetricCircle`, through the angular integral `∫_{S¹} dθ = 2π` of 5.5a. The
continuity instance the volume needs is the native round-sphere instance. -/
theorem volume_circle :
    let _ := roundMetricCircle
    let _ : IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin 1))
      (fun x : Circle ↦ TangentSpace (𝓡 1) x) := TauCeti.instIsContinuousRiemannianBundleSphere
    TauCeti.riemannianVolume (𝓡 1) Circle Set.univ = ENNReal.ofReal (2 * Real.pi) :=
  sorry

end RoundMetric
end TauCetiRoadmap.DifferentialGeometry
