module

public import Mathlib
public import TauCeti.Geometry.Manifold.Boundary.Charts
public import TauCeti.Geometry.Manifold.Distribution
public import TauCeti.Geometry.Manifold.IntegralCurve.Flow
public import TauCeti.Geometry.Manifold.IntegralCurve.Maximal
public import TauCeti.Geometry.Manifold.LocallyFlat.Basic
public import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas
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
[Lee, Prop. 15.5] and the oriented-atlas criterion [Lee, Prop. 15.6] (2); smooth dependence on
initial conditions for Banach models, the fundamental theorem of flows for Banach models,
homogeneity, the flow characterization of the bracket [Lee, Thm. 9.38], straightening
[Lee, Thm. 9.22] and time-dependent flows [Lee, Thm. 9.48] (3); integrability implies
involutivity, the annihilator criterion, local Frobenius with integral slices, weak embeddedness
and global leaves [Lee, Ch. 19] (4); the planar radial primitive and the moving-pullback identity
(5.4–5.4a); the hairy ball theorem
in its tangent-field and tangent-bundle-section forms [Lee, Problem 16-6] (11); the Riemannian
divergence theorem on half-space manifolds with the induced boundary measure and outward unit
normal [Lee, Thm. 16.32], and the volume of the round circle (12).

Headline theorems that Tau Ceti proves are not restated: the flip, associativity, graded Jacobi
and interior-product identities of the paired wedge (0.1), the smooth alternating bundle (0.2),
coefficient postcomposition with its laws (0.3–0.4), the wedge of smooth forms (0.4), naturality,
commutation with coefficient postcomposition, `d ∘ d = 0`, regularity, the Leibniz rule, the
invariant formula of the exterior derivative, the Lie derivative of forms and Cartan's formula
(1.2–1.4), the two-orientation theorem, the pullback and product orientations, the orientation of
a nowhere-vanishing top form and the π₁ criterion (2.1–2.4), compactly supported completeness,
conjugate flows and the Lie derivative of forms along a flow (3.3–3.4), the finite-dimensional
time-dependent flow on the time slab `ℝ` (3.5), the outward field, the outward-first boundary
orientation, the closed ball with its boundary sphere and radial field, the integral of top forms
with its chart formula, linearity, orientation sign, positivity and change of variables, and
Stokes' theorem for the half-space with its boundaryless and interval cases (5.1–5.3), the
homotopy operator with its cochain-homotopy identity (5.4), the insertion of a vector field in a
form with its pullback law and its antiderivation law `TauCeti.RoughForm.interior_wedgeWith_apply`
on the paired wedge (5.4a, the case of the identity map), the index calculus of absolutely
continuous curves, the one-cell identities on vertical and horizontal cells, Green's theorem for
finite type-I/type-II divisions with Henstock–Kurzweil boundary integrals, the winding-weighted
polygonal identity and Green's theorem for absolutely continuous cycles (5.6.1–5.6.3), the
existence of metrics, the gradient calculus, the symmetry of the Hessian, the induced boundary
metric and the boundaryless divergence theorem with Green's identities (12.1–12.3, 12.5), and
the comparison of the planar Green theorems with the integral of top forms (12.6); the README's
*From Tau Ceti* contract names each with its module. The paired and bracket wedges (0.1), the
pointwise wedge of rough forms (0.3), the planar cells, curl, circulation integrand and area
weight (5.6) and the gradient, Hessian and Laplace–Beltrami operator (12.2–12.3) are likewise Tau
Ceti's definitions and are not redeclared. Five statements that Tau Ceti also proves are kept
because declarations of this file or of its consumers use them: `mextDeriv_add`,
`mextDeriv_smul` and `isSmoothForm_mextDeriv_infty` build the linear map `mextDerivₗ` behind
`closedForms`, and `isCompleteVectorField_of_compactSpace` and `toFlow_apply` are the
completeness input and the rewriting rule of MorseNovikov's flow of the negative dual field. The
definitions `flowDomain`, `IsCompleteVectorField`, `IsOutwardPointing` and `divergence`, which Tau
Ceti also has with the same bodies, are kept because `toFlow` and the divergence theorem of 12.5
are stated on them, and `roundMetricCircle`, which selects the round-sphere metric that
`TauCeti.roundMetricCircle` bundles, because `volume_circle` is.

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
the regular value is 10.4. Four further headlines are not statable against the Tau Ceti
modules this file can import, each for want of the carriers its README statement names: the
triviality of the orientation double cover of an orientable manifold and the commutation of `d`
with the averaging operators (2.4) lack `TauCeti.Manifold.OrientationCover` and
`TauCeti.invariantPart`; the top-cohomology theorem and Poincaré duality (9.2–9.3) lack
`TauCeti.compactlySupportedDeRhamCohomology.integral` and `TauCeti.poincarePairing`; the degree
formula `∫_M f^*ω = deg f · ∫_N ω` (10.3–10.4) lacks `TauCeti.integralTopForm` and
`TauCeti.degreeAtRegularValue`. For the same reason the integral manifold of layer 4 is declared
here with the fields of `TauCeti.IntegralManifold` and is not that structure.

The definitions `closedForms`, `toFlow`, `fullSimplex`, `fullSimplexEquivStdSimplex`, `Density`,
`RoughDensity`, `CurvatureForm`, `circleAngularForm` and `Manifold.Orientation.pullback` are the
carriers that other roadmaps import or cite by name; each has a real body. Hypotheses are
unbundled and stated at their point of use; finite dimension, Hausdorffness and σ-compactness are
written wherever they are used; measure statements carry `[MeasurableSpace M] [BorelSpace M]`.
The de Rham complex and cohomology, Mayer–Vietoris, smooth chains and the de Rham theorem,
Poincaré duality, Sard's theorem on manifolds, the degree and the hairy ball theorem (layers 6–11)
are this roadmap's; DeRhamCohomologyAndDuality consumes them for its relative theory.
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
  {E'' H'' M'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E''] [TopologicalSpace H'']
  {I'' : ModelWithCorners ℝ E'' H''} [TopologicalSpace M''] [ChartedSpace H'' M'']
  {k : ℕ}

/-- **Layer 0.3.** Rough forms with values in an arbitrary family of topological vector
spaces. No global trivialization, fibre norm, regularity, or connection is part of the
carrier. `RoughForm` below is precisely the trivial-bundle specialization. -/
abbrev RoughBundleForm (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (V : M → Type*) [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)]
    [∀ x, TopologicalSpace (V x)] (k : ℕ) : Type _ :=
  (x : M) → TangentSpace I x [⋀^Fin k]→L[ℝ] V x

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

/-- **Layer 0.3.** Pullback changes the value bundle from `V` to `f *ᵖ V`, whose fibre at
`x` is `V (f x)`. It needs no connection and is total, with the same differentiability
requirements on its composition law as the scalar pullback. -/
noncomputable def bundleMpullback (I : ModelWithCorners ℝ E H)
    (I' : ModelWithCorners ℝ E' H') {V : M' → Type*}
    [∀ y, AddCommGroup (V y)] [∀ y, Module ℝ (V y)] [∀ y, TopologicalSpace (V y)]
    (f : M → M') (φ : RoughBundleForm I' M' V k) :
    RoughBundleForm I M (f *ᵖ V) k :=
  fun x ↦ (φ (f x)).compContinuousLinearMap (mfderiv I I' f x)

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  {V : M → Type*} [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)]
  [∀ x, TopologicalSpace (V x)] [TopologicalSpace (TotalSpace F V)]
  [FiberBundle F V] [VectorBundle ℝ F V]
  [∀ x, IsTopologicalAddGroup (V x)] [∀ x, ContinuousSMul ℝ (V x)]

/-- **Layer 0.3.** A `C^n` form with values in `V` is a `C^n` section of the alternating
bundle with fibres `TangentSpace I x [⋀^Fin k]→L[ℝ] V x`. The normed space `F` models
`V` locally; it does not identify its fibres globally. -/
def IsSmoothBundleForm (I : ModelWithCorners ℝ E H) (F : Type*)
    [NormedAddCommGroup F] [NormedSpace ℝ F] (V : M → Type*)
    [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)] [∀ x, TopologicalSpace (V x)]
    [TopologicalSpace (TotalSpace F V)] [FiberBundle F V] [VectorBundle ℝ F V]
    [∀ x, IsTopologicalAddGroup (V x)] [∀ x, ContinuousSMul ℝ (V x)]
    [IsManifold I 1 M] (n : WithTop ℕ∞) (φ : RoughBundleForm I M V k) : Prop :=
  ContMDiff I (I.prod 𝓘(ℝ, E [⋀^Fin k]→L[ℝ] F)) n
    (fun x ↦ TotalSpace.mk' (E [⋀^Fin k]→L[ℝ] F)
      (E := fun x ↦ TangentSpace I x [⋀^Fin k]→L[ℝ] V x) x (φ x))

/-- **Layer 0.4.** Smooth bundle-valued forms, as the submodule of rough forms cut out by
`IsSmoothBundleForm I F V ∞`, closed under the module operations by the section calculus. -/
def smoothBundleForms (I : ModelWithCorners ℝ E H) (F : Type*)
    [NormedAddCommGroup F] [NormedSpace ℝ F] (V : M → Type*)
    [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)] [∀ x, TopologicalSpace (V x)]
    [TopologicalSpace (TotalSpace F V)] [FiberBundle F V] [VectorBundle ℝ F V]
    [∀ x, IsTopologicalAddGroup (V x)] [∀ x, ContinuousSMul ℝ (V x)]
    [IsManifold I 1 M] (k : ℕ) : Submodule ℝ (RoughBundleForm I M V k) where
  carrier := {φ | IsSmoothBundleForm I F V ∞ φ}
  zero_mem' := contMDiff_zeroSection ℝ (fun x ↦ TangentSpace I x [⋀^Fin k]→L[ℝ] V x)
  add_mem' := fun hφ hψ ↦ ContMDiff.add_section hφ hψ
  smul_mem' := fun _ _ hφ ↦ ContMDiff.const_smul_section hφ

/-- **Layer 0.4.** `Ω^k(M; V)`, the module of smooth forms with arbitrary bundle values. -/
abbrev SmoothBundleForm (I : ModelWithCorners ℝ E H) (F : Type*)
    [NormedAddCommGroup F] [NormedSpace ℝ F] (V : M → Type*)
    [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)] [∀ x, TopologicalSpace (V x)]
    [TopologicalSpace (TotalSpace F V)] [FiberBundle F V] [VectorBundle ℝ F V]
    [∀ x, IsTopologicalAddGroup (V x)] [∀ x, ContinuousSMul ℝ (V x)]
    [IsManifold I 1 M] (k : ℕ) : Type _ :=
  ↥(smoothBundleForms I F V k)

/-- **Layer 0.3.** A `C^(n+1)` map pulls a `C^n` bundle-valued form back to a `C^n`
form with values in the pulled-back bundle. Bundling `f` supplies the canonical pullback
bundle instances from its continuity. -/
theorem isSmoothBundleForm_mpullback {n : WithTop ℕ∞}
    [IsManifold I 1 M] [IsManifold I' 1 M']
    [IsManifold I (n + 1) M] [IsManifold I' (n + 1) M']
    {V' : M' → Type*} [∀ y, AddCommGroup (V' y)] [∀ y, Module ℝ (V' y)]
    [∀ y, TopologicalSpace (V' y)] [TopologicalSpace (TotalSpace F V')]
    [FiberBundle F V'] [VectorBundle ℝ F V']
    [∀ y, IsTopologicalAddGroup (V' y)] [∀ y, ContinuousSMul ℝ (V' y)]
    [ContMDiffVectorBundle n F V' I'] (f : ContMDiffMap I I' M M' (n + 1))
    {φ : RoughBundleForm I' M' V' k} (hφ : IsSmoothBundleForm I' F V' n φ) :
    IsSmoothBundleForm I F (f *ᵖ V') n (bundleMpullback I I' f φ) :=
  sorry

/-- **Layer 0.4, curvature typing gate.** Endomorphism-valued 2-forms are expressible
without a global trivialization of `V`. A smooth connection supplies curvature as a member of
this space; this abbreviation constructs only its carrier. General covariant exterior
differentiation requires that connection and satisfies `(d_∇)^2 ω = R_∇ ∧ ω`, rather
than the `d² = 0` law of Layer 1's fixed-coefficient exterior derivative. The Riemannian
curvature construction remains owned by GeometricTopology. -/
abbrev CurvatureForm (I : ModelWithCorners ℝ E H) (F : Type*)
    [NormedAddCommGroup F] [NormedSpace ℝ F] (V : M → Type*)
    [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)] [∀ x, TopologicalSpace (V x)]
    [TopologicalSpace (TotalSpace F V)] [FiberBundle F V] [VectorBundle ℝ F V]
    [∀ x, IsTopologicalAddGroup (V x)] [∀ x, ContinuousSMul ℝ (V x)]
    [IsManifold I 1 M] : Type _ :=
  SmoothBundleForm I (F →L[ℝ] F) (fun x ↦ V x →L[ℝ] V x) 2

end BundleForms

section Forms

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' M' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace M'] [ChartedSpace H' M']
  {E'' H'' M'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E''] [TopologicalSpace H'']
  {I'' : ModelWithCorners ℝ E'' H''} [TopologicalSpace M''] [ChartedSpace H'' M'']
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : WithTop ℕ∞} {k l : ℕ}

/-- **Layer 0.3.** Fixed-coefficient forms are the trivial-bundle specialization of
`RoughBundleForm`. Layer 1's ordinary exterior derivative acts on this specialization. -/
abbrev RoughForm (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) :
    Type _ :=
  RoughBundleForm I M (Trivial M F) k

variable (I) in
/-- **Layer 0.3.** The `C^n` predicate on a rough form: `C^n` as a section of the topological
alternating bundle `fun x ↦ TangentSpace I x [⋀^Fin k]→L[ℝ] Trivial M F x` of
`Mathlib/Topology/VectorBundle/ContinuousAlternatingMap.lean`. -/
def IsSmoothForm [IsManifold I 1 M] (n : WithTop ℕ∞) (φ : RoughForm I M F k) : Prop :=
  IsSmoothBundleForm I F (Trivial M F) n φ

/-- **Layer 0.3.** The pullback of a rough form, total and junk-valued in the style of
`VectorField.mpullback`: `mpullback f φ x = (φ (f x)) ∘ mfderiv I I' f x`. -/
noncomputable def mpullback (I : ModelWithCorners ℝ E H) (I' : ModelWithCorners ℝ E' H')
    (f : M → M') (φ : RoughForm I' M' F k) : RoughForm I M F k :=
  bundleMpullback I I' f φ

/-- **Layer 0.3.** The `0`-form of a function. -/
noncomputable def RoughForm.ofFunction (I : ModelWithCorners ℝ E H) (f : M → F) :
    RoughForm I M F 0 :=
  fun x ↦ ContinuousAlternatingMap.constOfIsEmpty ℝ (TangentSpace I x) (Fin 0) (f x)

/-- **Layer 0.4.** The bundled `C^∞` forms, as the submodule of rough forms cut out by
`IsSmoothForm I ∞`; membership is that predicate by definition. -/
def smoothForms (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I 1 M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) :
    Submodule ℝ (RoughForm I M F k) :=
  smoothBundleForms I F (Trivial M F) k

/-- **Layer 0.4.** `Ω^k⟮I, M; F⟯`, the module of smooth `F`-valued `k`-forms. -/
abbrev SmoothForm (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F]
    (k : ℕ) : Type _ :=
  ↥(smoothForms I M F k)

end Forms

/-! ## Layer 1: the exterior derivative and its naturality -/

section ExtDeriv

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' M' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace M'] [ChartedSpace H' M']
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {n : WithTop ℕ∞} {k l : ℕ}

/-- **Layer 1.1.** The exterior derivative within a set, at a point: conjugate through
`extChartAt I x`, apply `extDerivWithin` on `(extChartAt I x).symm ⁻¹' s ∩ Set.range I`, pull
back through `mfderivWithin`. Total and junk-valued; chart independence is the theorem. -/
noncomputable def mextDerivWithin (φ : RoughForm I M F k) (s : Set M) (x : M) :
    TangentSpace I x [⋀^Fin (k + 1)]→L[ℝ] F :=
  (extDerivWithin
      (fun y : E ↦ ((φ ((extChartAt I x).symm y)).compContinuousLinearMap
        (mfderivWithin 𝓘(ℝ, E) I (extChartAt I x).symm (range I) y) : E [⋀^Fin k]→L[ℝ] F))
      ((extChartAt I x).symm ⁻¹' s ∩ range I) (extChartAt I x x)).compContinuousLinearMap
    (mfderiv I 𝓘(ℝ, E) (extChartAt I x) x)

/-- **Layer 1.1.** The exterior derivative. -/
noncomputable def mextDeriv (φ : RoughForm I M F k) : RoughForm I M F (k + 1) :=
  fun x ↦ mextDerivWithin φ univ x

/-- **Layer 1.1.** Additivity of `d` on `C¹` forms; with `mextDeriv_smul` it makes `d` the linear
map `mextDerivₗ` on smooth forms. -/
theorem mextDeriv_add [IsManifold I 1 M] {φ η : RoughForm I M F k} (hφ : IsSmoothForm I 1 φ)
    (hη : IsSmoothForm I 1 η) : mextDeriv (φ + η) = mextDeriv φ + mextDeriv η :=
  sorry

/-- **Layer 1.1.** Homogeneity of `d`, with no regularity hypothesis. -/
theorem mextDeriv_smul (c : ℝ) (φ : RoughForm I M F k) : mextDeriv (c • φ) = c • mextDeriv φ :=
  sorry

/-- **Layer 1.3.** The smooth case: `d` maps `Ω^k` to `Ω^(k+1)`. -/
theorem isSmoothForm_mextDeriv_infty [IsManifold I 1 M] [IsManifold I ∞ M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I ∞ φ) : IsSmoothForm I ∞ (mextDeriv φ) :=
  sorry

end ExtDeriv

section ClosedForms

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I 1 M] [IsManifold I ∞ M]

variable (I M) in
/-- **Layer 1.3.** The exterior derivative as a linear map on smooth real forms. -/
noncomputable def mextDerivₗ (k : ℕ) :
    SmoothForm I M ℝ k →ₗ[ℝ] SmoothForm I M ℝ (k + 1) where
  toFun φ := ⟨mextDeriv φ,
    isSmoothForm_mextDeriv_infty (φ.2 : IsSmoothForm I ∞ (φ : RoughForm I M ℝ k))⟩
  map_add' φ η := Subtype.ext (mextDeriv_add
    (ContMDiff.of_le (φ.2 : IsSmoothForm I ∞ (φ : RoughForm I M ℝ k))
      (WithTop.coe_le_coe.2 le_top))
    (ContMDiff.of_le (η.2 : IsSmoothForm I ∞ (η : RoughForm I M ℝ k))
      (WithTop.coe_le_coe.2 le_top)))
  map_smul' c φ := Subtype.ext (mextDeriv_smul c (φ : RoughForm I M ℝ k))

variable (I M) in
/-- **Layer 1.3.** Closed smooth real forms, the kernel of `mextDerivₗ`; closedness of a form is
the equation `mextDeriv φ = 0`, never a chartwise definition. -/
noncomputable def closedForms (k : ℕ) :
    Submodule ℝ (SmoothForm I M ℝ k) :=
  LinearMap.ker (mextDerivₗ I M k)

end ClosedForms

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
so that boundary points are included. This is the data and these are the laws Tau Ceti
requires, whatever names an upstream implementation eventually uses. -/
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

variable (I M) in
/-- **Layer 2.1.** Orientability, with the canonical index type `Fin (finrank ℝ E)`. -/
def Orientable : Prop :=
  Nonempty (Manifold.Orientation I M (Fin (Module.finrank ℝ E)))

/-- **Layer 2.2.** A map is orientation-preserving at `x` when its differential is invertible
there and carries `orientationAt o x` to `orientationAt o' (f x)`. -/
def IsOrientationPreservingAt [FiniteDimensional ℝ E'] (o : Manifold.Orientation I M ι)
    (o' : Manifold.Orientation I' M' ι) (f : M → M') (x : M) : Prop :=
  ∃ e : TangentSpace I x ≃L[ℝ] TangentSpace I' (f x),
    (e : TangentSpace I x →L[ℝ] TangentSpace I' (f x)) = mfderiv I I' f x ∧
      Orientation.map ι e.toLinearEquiv (orientationAt o x) = orientationAt o' (f x)

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
partition-of-unity direction carries `[T2Space M] [SigmaCompactSpace M]` [Lee, Prop. 15.5]. -/
theorem exists_topForm_of_orientation [T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M]
    (o : Manifold.Orientation I M (Fin (Module.finrank ℝ E))) :
    ∃ φ : RoughForm I M ℝ (Module.finrank ℝ E), IsSmoothForm I ∞ φ ∧
      ∀ (x : M) (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x)),
        b.orientation = orientationAt o x → 0 < φ x b :=
  sorry

/-- **Layer 2.2, the oriented-atlas criterion** [Lee, Prop. 15.6]: a boundaryless `C¹` manifold
has a chart-sign orientation exactly when it has an oriented atlas in Tau Ceti's sense,
`TauCeti.IsOrientedAtlas I 1`: charts of the maximal `C¹` atlas that cover `M` and whose
coordinate changes lie in `TauCeti.orientationPreservingGroupoid I` (differentiable within
`range I` with derivative of positive determinant). Over the half-space model `𝓡∂ n` the
boundaryless hypothesis is needed only for `n = 1`: `Set.Icc 0 1` over `𝓡∂ 1` is orientable but
has no oriented atlas, since a chart at `0` increases and a chart at `1` decreases, while for
`n ≥ 2` the converse also holds with boundary [Lee, Prop. 15.6]. Over a general model with
corners it is needed in higher dimension too: a connected `3`-manifold with one corner modelled
on a cone that has no orientation-reversing linear automorphism and one mirror-image corner is
orientable but has no oriented atlas. -/
theorem orientable_iff_exists_atlas [BoundarylessManifold I M] [IsManifold I 1 M] :
    Orientable I M ↔ ∃ A : Set (OpenPartialHomeomorph M H), TauCeti.IsOrientedAtlas I 1 A :=
  sorry

end Orientation

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

/-- **Layer 3.2.** The domain of the maximal flow in the `(t, x)` order of `flowOf`: Tau Ceti's
`maximalIntegralCurveFlowDomain`, read through `Prod.swap` — an adapter, not a second domain. -/
def flowDomain (v : (x : M) → TangentSpace I x) : Set (ℝ × M) :=
  Prod.swap ⁻¹' TauCeti.maximalIntegralCurveFlowDomain v

/-- **Layer 3.2.** The maximal flow, total and junk-valued: `flowOf v t x` is Tau Ceti's maximal
integral curve through `x` at time `t`. -/
noncomputable def flowOf (v : (x : M) → TangentSpace I x) (t : ℝ) (x : M) : M :=
  maximalIntegralCurve v x t

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

/-- **Layer 3.3.** A vector field is complete when its flow is defined for all time. -/
def IsCompleteVectorField (v : (x : M) → TangentSpace I x) : Prop :=
  flowDomain v = univ

/-- **Layer 3.3.** Every `C¹` field on a compact boundaryless manifold is complete. This is not a
target: it is Tau Ceti's `maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo` (with the
whole manifold as the compact set) read in the `flowDomain` form, and is proved from it. -/
theorem isCompleteVectorField_of_compactSpace [IsManifold I 1 M] [CompactSpace M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M))) :
    IsCompleteVectorField v :=
  eq_univ_of_forall fun p ↦ by
    simp [flowDomain, TauCeti.mem_maximalIntegralCurveFlowDomain,
      maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo hv
        (zero_mem_maximalIntegralCurveInterval (x := p.2) hv.contMDiffAt) isCompact_univ
        (fun _ _ ↦ mem_univ _)]

/-- **Layer 3.3.** The flow of a complete `C¹` field as a Mathlib `Flow ℝ M`: its maps are
`flowOf v t`, and its continuity and group law are the fundamental theorem of flows on the
complete domain `flowDomain v = univ`. -/
@[expose]
noncomputable def toFlow [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hc : IsCompleteVectorField v) : Flow ℝ M where
  toFun := flowOf v
  cont' := by
    have hD : TauCeti.maximalIntegralCurveFlowDomain v = univ :=
      eq_univ_of_forall fun p ↦ (show (p.2, p.1) ∈ flowDomain v from hc ▸ mem_univ _)
    have h := (contMDiffOn_maximalIntegralCurve_of_completeSpace (n := 1) le_rfl hv).continuousOn
    rw [hD, continuousOn_univ] at h
    exact h.comp continuous_swap
  map_add' t₁ t₂ x := by
    have hI : ∀ (y : M) (t : ℝ), t ∈ maximalIntegralCurveInterval v y := fun y t ↦ by
      simpa [flowDomain] using (show (t, y) ∈ flowDomain v from hc ▸ mem_univ _)
    rw [add_comm]
    exact TauCeti.maximalIntegralCurve_add hv (hI x t₂) (hI x (t₂ + t₁))
  map_zero' x := by
    have h0 : (0 : ℝ) ∈ maximalIntegralCurveInterval v x := by
      simpa [flowDomain] using (show ((0 : ℝ), x) ∈ flowDomain v from hc ▸ mem_univ _)
    exact maximalIntegralCurve_zero h0

/-- **Layer 3.3.** The maps of `toFlow` are `flowOf`, by construction (`rfl`). Not a target: it is
the rewriting rule by which a consumer of `toFlow` reads its maps. -/
theorem toFlow_apply [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hc : IsCompleteVectorField v) (t : ℝ) (x : M) : toFlow hv hc t x = flowOf v t x :=
  rfl

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
        (∃ K : Set M, IsCompact K ∧ ∀ z ∉ K, v z = 0) ∧ flowOf v 1 x = y :=
  sorry

omit [CompleteSpace E] in
/-- **Layer 3.4, the flow characterization of the Lie derivative** [Lee, Thm. 9.38]: the
derivative at `t = 0` of the pulled-back field is the bracket. -/
theorem hasDerivAt_mpullback_flowOf [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    {v w : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hw : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, w y⟩ : TangentBundle I M))) (x : M) :
    HasDerivAt (fun t ↦ VectorField.mpullback I I (flowOf v t) w x)
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

/-- **Layer 3.5, time-dependent flows** [Lee, Thm. 9.48]: a time-dependent `C¹` field on an open
time slab has a local flow solving the nonautonomous equation, by the autonomous trick on
`ℝ × M`. -/
theorem exists_timeDependentFlow [IsManifold I 1 M] {v : ℝ → (x : M) → TangentSpace I x}
    (hv : ContMDiff (𝓘(ℝ, ℝ).prod I) I.tangent 1
      (fun p : ℝ × M ↦ (⟨p.2, v p.1 p.2⟩ : TangentBundle I M))) (t₀ : ℝ) (x₀ : M) :
    ∃ (U : Set (ℝ × M)) (Ψ : ℝ → ℝ × M → M), IsOpen U ∧ (t₀, x₀) ∈ U ∧
      (∀ p ∈ U, Ψ p.1 p = p.2) ∧
      ∀ p ∈ U, ∀ᶠ t in 𝓝 p.1, HasMFDerivAt 𝓘(ℝ, ℝ) I (fun s ↦ Ψ s p) t
        (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (v t (Ψ t p))) :=
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
    flowDomain (suspendedTimeField J v)}

/-- **Layer 3.5.** The time-dependent flow, the `M` component of the suspended flow; values
outside the maximal domain are junk. -/
noncomputable def timeDependentFlow (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x) (t s : ↥J) (x : M) : M :=
  (flowOf (suspendedTimeField J v) ((t : ℝ) - (s : ℝ)) (s, x)).2

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

variable (I n) in
/-- **Layer 4.2.** A packaged `k`-dimensional integral manifold of the tangent-subspace family
`D`: a nonempty `C^n` manifold carrier modelled on `ℝ^k`, with its own topology (not the subspace
topology of its image), and a `C^n` immersion into `M` whose differential has image exactly `D` at
every point. The immersion need not be injective; injectivity, connectedness and second
countability are hypotheses or conclusions where they are used. The fields, with their names, are
those of Tau Ceti's `TauCeti.IntegralManifold`, on which the theorems of this layer are proved.
Regularity and involutivity of `D` are Tau Ceti's `TauCeti.IsContMDiffDistribution` and
`TauCeti.IsInvolutiveDistribution`. -/
structure IntegralManifold (D : (x : M) → Submodule ℝ (TangentSpace I x)) (k : ℕ) where
  carrier : Type u
  [topologicalSpace : TopologicalSpace carrier]
  [chartedSpace : ChartedSpace (EuclideanSpace ℝ (Fin k)) carrier]
  [isManifold : IsManifold (𝓡 k) n carrier]
  [nonempty : Nonempty carrier]
  map : carrier → M
  isImmersion : Manifold.IsImmersion (𝓡 k) I n map
  range_mfderiv : ∀ y,
    LinearMap.range (mfderiv (𝓡 k) I map y).toLinearMap = D (map y)

attribute [instance] IntegralManifold.topologicalSpace
  IntegralManifold.chartedSpace IntegralManifold.isManifold IntegralManifold.nonempty

/-- **Layer 4.2.** A smooth rank-`k` distribution with a smooth integral
manifold through every point is involutive, in Tau Ceti's local sense (brackets of fields that are
differentiable and tangent to `D` on an open set stay tangent to `D` there). There is no merely
continuous specialization. -/
theorem isInvolutive_of_forall_exists_integralManifold
    [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D)
    (h : ∀ x : M, ∃ N : IntegralManifold I ∞ D k, x ∈ range N.map) :
    TauCeti.IsInvolutiveDistribution I D :=
  sorry

/-- **Layer 4.2, the annihilating-one-form criterion.** A smooth rank-`k`
distribution on a Hausdorff manifold is involutive exactly when every smooth `1`-form vanishing on
`D` has exterior derivative vanishing on pairs of vectors of `D`. Hausdorffness supplies the local
bump extensions this global formulation uses. -/
theorem isInvolutive_iff_forall_mextDeriv
    [IsManifold I ∞ M] [T2Space M] {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D) :
    TauCeti.IsInvolutiveDistribution I D ↔ ∀ η : RoughForm I M ℝ 1,
      IsSmoothForm I ∞ η →
      (∀ x, ∀ v ∈ D x, η x ![v] = 0) →
      ∀ x, ∀ v ∈ D x, ∀ w ∈ D x,
        mextDeriv η x ![v, w] = 0 :=
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
    ∃ (N : IntegralManifold I ∞ D k) (e : OpenPartialHomeomorph M E) (P : AffineSubspace ℝ E),
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
    (N : IntegralManifold I ∞ D k) (hinj : Function.Injective N.map)
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
    ∃ N : IntegralManifold I ∞ D k, x ∈ range N.map ∧ ConnectedSpace N.carrier ∧
      Function.Injective N.map ∧
      (∀ N' : IntegralManifold I ∞ D k, ConnectedSpace N'.carrier →
        (range N'.map ∩ range N.map).Nonempty →
          range N'.map ⊆ range N.map) ∧
      (SecondCountableTopology M → SecondCountableTopology N.carrier) :=
  sorry

end Distribution

end Frobenius

/-! ## Layer 5: integration on manifolds and Stokes' theorem -/

section Boundary

variable {n : ℕ} {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
  [IsManifold (𝓡∂ (n + 1)) 1 M]

/-- **Layer 5.1.** Outward-pointing tangent vectors at a boundary point: in the preferred chart,
the zeroth coordinate (the one Mathlib's half-space constrains) decreases. -/
def IsOutwardPointing (x : M) (v : TangentSpace (𝓡∂ (n + 1)) x) : Prop :=
  x ∈ (𝓡∂ (n + 1)).boundary M ∧
    (id (mfderiv (𝓡∂ (n + 1)) 𝓘(ℝ, EuclideanSpace ℝ (Fin (n + 1)))
      (extChartAt (𝓡∂ (n + 1)) x) x v) : EuclideanSpace ℝ (Fin (n + 1))) 0 < 0

end Boundary

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

section Gates

/-- **Layer 5.5a, acceptance: the angular form.** The flat form `x dy − y dx` on `ℂ = ℝ²`; its
pullback to the circle is `circleAngularForm`. -/
noncomputable def planeAngularForm : RoughForm 𝓘(ℝ, ℂ) ℂ ℝ 1 :=
  fun z ↦ ContinuousAlternatingMap.ofSubsingleton ℝ ℂ ℝ (0 : Fin 1)
    (z.re • Complex.imCLM - z.im • Complex.reCLM)

/-- **Layer 5.5a, acceptance: the angular form `dθ` on the circle**, the pullback of
`x dy − y dx` along the inclusion `Circle → ℂ`. It takes the value `1` on the counterclockwise
unit tangent vector `i z` at `z`, is closed (every `1`-form on a `1`-manifold is) but not exact,
and integrates to `2π` over the circle. -/
noncomputable def circleAngularForm : RoughForm (𝓡 1) Circle ℝ 1 :=
  mpullback (𝓡 1) 𝓘(ℝ, ℂ) (fun z : Circle ↦ (z : ℂ)) planeAngularForm

end Gates

section StandardSimplex

/-- **Layer 5.5b.** The full-dimensional standard simplex `Δᵖ = {x ∈ ℝᵖ | 0 ≤ xᵢ, Σ xᵢ ≤ 1}`, the
simplex carrying the barycentric face data; ⚠ Mathlib's barycentric `Convexity.StdSimplex` lies
in a hyperplane and is the wrong domain to integrate over directly. -/
def fullSimplex (p : ℕ) : Set (EuclideanSpace ℝ (Fin p)) :=
  {x | (∀ i, 0 ≤ x i) ∧ ∑ i, x i ≤ 1}

/-- **Layer 5.5b.** The affine homeomorphism to Mathlib's barycentric simplex: the weight at `0`
is `1 - Σ xᵢ`, and the weight at `i.succ` is the coordinate `xᵢ`. -/
noncomputable def fullSimplexEquivStdSimplex (p : ℕ) :
    fullSimplex p ≃ₜ Convexity.StdSimplex ℝ (Fin (p + 1)) where
  toFun x :=
    { weights := Finsupp.equivFunOnFinite.symm
        (Fin.cons (1 - ∑ i, (x : EuclideanSpace ℝ (Fin p)) i)
          fun i ↦ (x : EuclideanSpace ℝ (Fin p)) i)
      nonneg := fun j ↦ by
        refine Fin.cases ?_ (fun i ↦ ?_) j
        · simpa using x.2.2
        · simpa using x.2.1 i
      total := by
        rw [Finsupp.sum_fintype _ _ (by simp)]
        simp [Fin.sum_univ_succ] }
  invFun t := ⟨WithLp.toLp 2 fun i ↦ t.weights i.succ, by
    refine ⟨fun i ↦ by simp, ?_⟩
    have h := t.total_of_fintype
    rw [Fin.sum_univ_succ] at h
    linarith [t.weights_nonneg 0]⟩
  left_inv x := by
    ext i
    simp
  right_inv t := by
    ext j
    refine Fin.cases ?_ (fun i ↦ ?_) j
    · have h := t.total_of_fintype
      rw [Fin.sum_univ_succ] at h
      simp
      linarith
    · simp
  continuous_toFun := by
    rw [(Convexity.StdSimplex.isEmbedding_toFun_comp_weights ℝ (Fin (p + 1))).continuous_iff,
      continuous_pi_iff]
    intro j
    refine Fin.cases ?_ (fun i ↦ ?_) j
    · simp only [Function.comp_apply, Finsupp.coe_equivFunOnFinite_symm, Fin.cons_zero]
      fun_prop
    · simp only [Function.comp_apply, Finsupp.coe_equivFunOnFinite_symm, Fin.cons_succ]
      fun_prop
  continuous_invFun := by
    refine Continuous.subtype_mk ?_ _
    refine (PiLp.continuous_toLp 2 _).comp (continuous_pi fun i ↦ ?_)
    exact Convexity.StdSimplex.continuous_weights_apply ℝ i.succ

end StandardSimplex

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

section Riemannian

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

variable [IsManifold I 2 M] [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]

/-- **Layer 12.3.** Divergence as the pointwise trace of the covariant derivative — for Mathlib's
Levi-Civita connection `CovariantDerivative.leviCivitaConnection`, consumed together with Tau
Ceti's regularity instance
(`CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`); the Levi-Civita
connection itself is not rebuilt here. -/
noncomputable def divergence (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsManifold I 2 M]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]
    (X : (x : M) → TangentSpace I x) (x : M) : ℝ :=
  LinearMap.trace ℝ (TangentSpace I x)
    (CovariantDerivative.leviCivitaConnection I M X x).toLinearMap

end Riemannian

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
it has norm one, points outward (`IsOutwardPointing`), and is orthogonal to the image of the
boundary's tangent space. These three laws determine it at every boundary point, so the
divergence theorem below may take any field satisfying them. -/
theorem exists_halfSpaceOutwardUnitNormal :
    ∃ N : (x : (𝓡∂ (n + 1)).boundary M) → TangentSpace (𝓡∂ (n + 1)) (x : M),
      ContMDiff 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)).tangent ∞
        (fun x : (𝓡∂ (n + 1)).boundary M =>
          (⟨(x : M), N x⟩ : TangentBundle (𝓡∂ (n + 1)) M)) ∧
      ∀ x, ‖N x‖ = 1 ∧ IsOutwardPointing (x : M) (N x) ∧
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
    (hN : ∀ x, ‖N x‖ = 1 ∧ IsOutwardPointing (x : M) (N x) ∧
      ∀ w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x,
        inner ℝ (N x)
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val x w) = 0) :
    MeasureTheory.Integrable (divergence (𝓡∂ (n + 1)) X)
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
    (hN : ∀ x, ‖N x‖ = 1 ∧ IsOutwardPointing (x : M) (N x) ∧
      ∀ w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x,
        inner ℝ (N x)
          (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val x w) = 0) :
    (∫ x, divergence (𝓡∂ (n + 1)) X x
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
