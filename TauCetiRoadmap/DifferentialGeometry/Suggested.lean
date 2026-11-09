module

public import Mathlib
public import TauCeti.Geometry.Manifold.Boundary.Charts
public import TauCeti.Geometry.Manifold.Distribution
public import TauCeti.Geometry.Manifold.IntegralCurve.Flow
public import TauCeti.Geometry.Manifold.IntegralCurve.Maximal
public import TauCeti.Geometry.Manifold.LocallyFlat.Basic
public import TauCeti.Geometry.Manifold.Orientation
public import TauCeti.Geometry.Manifold.Riemannian.Sphere
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
public import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz
public import TauCeti.Analysis.Contour.Winding.Number.Basic
public import TauCeti.Analysis.Normed.Module.FilledHull

/-!
# Differential geometry — forms, Stokes, flows, de Rham cohomology, degree, planar Green and Riemannian calculus: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; the README carries every target, API list and acceptance example.

Headline theorems stated here, by layer: associativity, the flip identity and the graded Jacobi
identity of the paired wedge and the interior-product rule [Lee, Lemma 14.13] (0.1); smoothness
of the alternating bundle (0.2), of pullbacks (0.3) and of paired wedges of smooth forms (0.4);
naturality, `d ∘ d = 0`, regularity, the Leibniz rule and the invariant formula
[Lee, Prop. 14.29] for the exterior derivative (1); orientation extensionality and the
two-orientation theorem, the pullback orientation [Lee, Prop. 15.15], top forms and orientations
[Lee, Prop. 15.5], the oriented-atlas criterion [Lee, Prop. 15.6] and orientability without
index-two subgroups of `π₁` [Lee, Thm. 15.43] (2); smooth dependence on initial conditions for
Banach models, the fundamental theorem of flows for Banach models, completeness [Lee, Thm. 9.16],
homogeneity, naturality [Lee, Prop. 9.6], the flow characterization of the bracket
[Lee, Thm. 9.38], straightening [Lee, Thm. 9.22] and time-dependent flows [Lee, Thm. 9.48] (3);
integrability implies involutivity, the annihilator criterion, local Frobenius with integral
slices, weak embeddedness and global leaves [Lee, Ch. 19] (4); outward fields
[Lee, Prop. 15.33], the planar radial primitive and the moving-pullback identity (5.1–5.4a);
Green's theorem for absolutely continuous cycles, in winding-weighted form and at HOL Light's
strength, and the one-cell identities on vertical and horizontal cells (5.6); the hairy ball
theorem in its tangent-field and tangent-bundle-section forms [Lee, Problem 16-6] (11);
existence of Riemannian metrics [Lee, Prop. 13.3], symmetry of the Hessian, the Riemannian
divergence theorem on boundaryless manifolds with Green's identities, and on half-space manifolds
with the induced boundary measure and outward unit normal [Lee, Thm. 16.32] (12).

Headline theorems not statable at the pins, and what each lacks: Stokes' theorem for the
half-space (5.3) and for smooth faces and corners (5.5b) lack the integral of a top form over a
manifold and the outward-first boundary orientation, constructions whose bodies are themselves
theorems (5.1–5.2), and the corner version also lacks the smooth face structure with its abstract
boundary (5.5b); the face-structured divergence theorem (12.5) lacks the same face structure; the
equivalences of 2.4 lack, at the Tau Ceti revision this file is built against, the orientation
double cover with its topology (2.4), from which Tau Ceti's `IsLocalHomeomorph.chartedSpaceComap`
(2.3) gives its smooth structure (the Tau Ceti revision the content repository pins has the cover
and proves two of the equivalences,
`TauCeti.Manifold.OrientationCover.orientable_iff_exists_section` and
`TauCeti.Manifold.OrientationCover.orientable_iff_not_connectedSpace`, which 2.4 cites); the
homotopy-operator identity (5.4) lacks the homotopy operator; agreement of
densities with the integral of top forms (5.5a) and of the Riemannian volume form with the
Riemannian density (12.4) lack those integrals and the volume form; Cartan's formula (1.4) lacks
the Lie derivative of forms; the finite type-I/type-II division theorems (5.6.2) lack the oriented
boundary chain of finite integer-weighted sums of parametrized arcs with its Henstock–Kurzweil
integrals; the migration equivalence of 0.4 lacks the generic carrier in Tau Ceti; the de Rham
theorem (8.5) and the multiplicativity of the de Rham homomorphism lack the de Rham complex (whose
differential needs `d ∘ d = 0`, a theorem) and the complex of smooth singular chains with its
integration map (singular cohomology with real coefficients is
`TauCeti.singularCohomologyFunctor` over `ModuleCat ℝ` with `R`, `k` and `M` all `ℝ`);
Poincaré duality (9.3) and the top-cohomology theorems (9.2) lack the de Rham complex and the
integral of top forms; the degree
formula `∫_M f^*ω = deg f · ∫_N ω` and the homotopy invariance of the degree (10.3–10.5) lack the
integral of top forms and the signed count of a fibre, a definition whose well-definedness is the
theorem.

The definitions `closedForms`, `toFlow`, `fullSimplex`, `fullSimplexEquivStdSimplex`, `Density`,
`RoughDensity`, `CurvatureForm`, `circleAngularForm` and `Manifold.Orientation.pullback` are the
carriers that other roadmaps import or cite by name; each has a real body. Hypotheses are
unbundled and stated at their point of use; finite dimension, Hausdorffness and σ-compactness are
written wherever they are used; measure statements carry `[MeasurableSpace M] [BorelSpace M]`.
The de Rham complex and cohomology, Mayer–Vietoris, smooth chains and the de Rham theorem,
Poincaré duality, Sard's theorem, the degree and the hairy ball theorem (layers 6–11) are this
roadmap's; DeRhamCohomologyAndDuality consumes them for its relative theory.
-/

public section

open Bundle Set
open scoped Manifold Bundle Topology ContDiff InnerProductSpace

namespace TauCetiRoadmap.DifferentialGeometry

/-! ## Layer 0: alternating bundles, differential forms, and the wedge -/

section Wedge

variable {E F₁ F₂ F₃ F₁₂ F₂₃ G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F₁] [NormedSpace ℝ F₁] [NormedAddCommGroup F₂] [NormedSpace ℝ F₂]
  [NormedAddCommGroup F₃] [NormedSpace ℝ F₃] [NormedAddCommGroup F₁₂] [NormedSpace ℝ F₁₂]
  [NormedAddCommGroup F₂₃] [NormedSpace ℝ F₂₃] [NormedAddCommGroup G] [NormedSpace ℝ G]

/-- **Layer 0.1.** The paired wedge product of continuous alternating maps, in the
determinant convention, combining values through an explicit continuous bilinear map —
the `wedge_product` shape of Kudryashov's `DeRhamCohomology`. The normalization is the
sign-weighted sum over all permutations divided by `k! * l!` (the alternatization below sums
over all permutations); equivalently it is the sum over `(k, l)`-shuffles with no factorial,
matching `AlternatingMap.domCoprod`, so that on two covectors it is the `2 × 2` determinant with
no factor `1/2`. At this generality the flip identity `wedgeWith_flip` holds for every pairing;
associativity and graded commutativity are **not** theorems here (degree zero reduces them to
associativity and commutativity of `μ`) and hold only under explicit hypotheses on the
pairings — `wedgeWith_assoc` below. -/
noncomputable def wedgeWith {k l : ℕ} (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃)
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    E [⋀^Fin (k + l)]→L[ℝ] F₃ :=
  ((k.factorial : ℝ) * (l.factorial : ℝ))⁻¹ •
    ContinuousMultilinearMap.alternatization
      { toMultilinearMap :=
          (MultilinearMap.uncurrySum (N := fun _ : Fin k ⊕ Fin l ↦ E)
            (({ toFun := fun a ↦ (μ a).toLinearMap.compMultilinearMap
                    ψ.toContinuousMultilinearMap.toMultilinearMap
                map_add' := fun a b ↦ by ext; simp
                map_smul' := fun c a ↦ by ext; simp } :
                F₁ →ₗ[ℝ] MultilinearMap ℝ (fun _ : Fin l ↦ E) F₃).compMultilinearMap
              φ.toContinuousMultilinearMap.toMultilinearMap)).domDomCongr finSumFinEquiv
        cont := by
          change Continuous fun v : Fin (k + l) → E ↦
            μ (φ (fun i ↦ v (finSumFinEquiv (Sum.inl i))))
              (ψ (fun j ↦ v (finSumFinEquiv (Sum.inr j))))
          exact μ.continuous₂.comp
            ((φ.toContinuousMultilinearMap.cont.comp
                (continuous_pi fun i ↦ continuous_apply _)).prodMk
              (ψ.toContinuousMultilinearMap.cont.comp
                (continuous_pi fun j ↦ continuous_apply _))) }

variable {k l m : ℕ} {μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃}

/-- **Layer 0.1, the flip identity.** Swapping the factors flips the pairing and costs the
graded sign; this holds for *every* pairing, and graded commutativity for a commutative
`μ` (where `μ.flip = μ`) is its corollary. The degree cast is `Fin.cast`. -/
theorem wedgeWith_flip (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂)
    (v : Fin (k + l) → E) :
    wedgeWith μ φ ψ v =
      (-1 : ℝ) ^ (k * l) • wedgeWith μ.flip ψ φ (v ∘ Fin.cast (Nat.add_comm l k)) :=
  sorry

/-- **Layer 0.1, associativity under a compatibility hypothesis on the pairings**: associativity
holds when the two composite pairings agree, `μ₁₂₃ (μ₁₂ a b) c = μ₁₂₃' a (μ₂₃ b c)`,
which is associativity of a multiplication in the algebra case and *fails* for a Lie
bracket. -/
theorem wedgeWith_assoc (μ₁₂ : F₁ →L[ℝ] F₂ →L[ℝ] F₁₂) (μ₁₂₃ : F₁₂ →L[ℝ] F₃ →L[ℝ] G)
    (μ₂₃ : F₂ →L[ℝ] F₃ →L[ℝ] F₂₃) (μ₁₂₃' : F₁ →L[ℝ] F₂₃ →L[ℝ] G)
    (h : ∀ a b c, μ₁₂₃ (μ₁₂ a b) c = μ₁₂₃' a (μ₂₃ b c))
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) (χ : E [⋀^Fin m]→L[ℝ] F₃)
    (v : Fin (k + l + m) → E) :
    wedgeWith μ₁₂₃ (wedgeWith μ₁₂ φ ψ) χ v =
      wedgeWith μ₁₂₃' φ (wedgeWith μ₂₃ ψ χ) (v ∘ Fin.cast (Nat.add_assoc k l m).symm) :=
  sorry

/-- **Layer 0.1.** The bracket wedge `[φ ∧ ψ]` of forms with values in a space carrying a
continuous bilinear bracket `β` (a finite-dimensional Lie algebra's bracket, say): `wedgeWith`
along `β`. It is neither associative nor graded commutative; graded skew-symmetry for a
skew-symmetric bracket is the flip identity `wedgeWith_flip` with `β.flip = -β`, and the graded
Jacobi identity below holds for a bracket satisfying the Jacobi identity. -/
noncomputable def bracketWedge (β : F₁ →L[ℝ] F₁ →L[ℝ] F₁) (φ : E [⋀^Fin k]→L[ℝ] F₁)
    (ψ : E [⋀^Fin l]→L[ℝ] F₁) : E [⋀^Fin (k + l)]→L[ℝ] F₁ :=
  wedgeWith β φ ψ

/-- **Layer 0.1.** The graded Jacobi identity of the bracket wedge,
`(-1)^{km} [[φ∧ψ]∧χ] + (-1)^{kl} [[ψ∧χ]∧φ] + (-1)^{lm} [[χ∧φ]∧ψ] = 0`, the three terms cast to
degree `k + l + m`, for a bracket satisfying the Jacobi identity. -/
theorem bracketWedge_jacobi {β : F₁ →L[ℝ] F₁ →L[ℝ] F₁} (hβ : ∀ a b, β a b = -β b a)
    (hβ' : ∀ a b c, β a (β b c) = β (β a b) c + β b (β a c))
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₁) (χ : E [⋀^Fin m]→L[ℝ] F₁)
    (v : Fin (k + l + m) → E) :
    (-1 : ℝ) ^ (k * m) • bracketWedge β (bracketWedge β φ ψ) χ v +
      (-1 : ℝ) ^ (k * l) • bracketWedge β (bracketWedge β ψ χ) φ
        (v ∘ Fin.cast (show l + m + k = k + l + m by omega)) +
      (-1 : ℝ) ^ (l * m) • bracketWedge β (bracketWedge β χ φ) ψ
        (v ∘ Fin.cast (show m + k + l = k + l + m by omega)) = 0 :=
  sorry

/-- **Layer 0.1, the interior product.** Mathlib's `ContinuousAlternatingMap.curryLeft` *is*
`ι_v` and `ι_v ∘ ι_v = 0` is its `curryLeft_same`; what is built here is the degree-`(−1)`
antiderivation rule [Lee, Lemma 14.13], stated for the paired wedge. -/
theorem curryLeft_wedgeWith (φ : E [⋀^Fin (k + 1)]→L[ℝ] F₁) (ψ : E [⋀^Fin (l + 1)]→L[ℝ] F₂)
    (v : E) (w : Fin (k + 1 + l) → E) :
    (wedgeWith μ φ ψ).curryLeft v w =
      wedgeWith μ (φ.curryLeft v) ψ (w ∘ Fin.cast (show k + (l + 1) = k + 1 + l by omega)) +
        (-1 : ℝ) ^ (k + 1) • wedgeWith μ φ (ψ.curryLeft v) w :=
  sorry

end Wedge

section AlternatingBundle

variable {𝕜 B ι : Type*} {n : WithTop ℕ∞}
  [NontriviallyNormedField 𝕜] [Fintype ι]
  {F₁ F₂ : Type*} [NormedAddCommGroup F₁] [NormedSpace 𝕜 F₁]
  [NormedAddCommGroup F₂] [NormedSpace 𝕜 F₂]
  {E₁ : B → Type*} [∀ x, AddCommGroup (E₁ x)] [∀ x, Module 𝕜 (E₁ x)]
  [TopologicalSpace (TotalSpace F₁ E₁)] [∀ x, TopologicalSpace (E₁ x)]
  {E₂ : B → Type*} [∀ x, AddCommGroup (E₂ x)] [∀ x, Module 𝕜 (E₂ x)]
  [TopologicalSpace (TotalSpace F₂ E₂)] [∀ x, TopologicalSpace (E₂ x)]
  {EB : Type*} [NormedAddCommGroup EB] [NormedSpace 𝕜 EB]
  {HB : Type*} [TopologicalSpace HB] {IB : ModelWithCorners 𝕜 EB HB}
  [TopologicalSpace B] [ChartedSpace HB B]
  [FiberBundle F₁ E₁] [VectorBundle 𝕜 F₁ E₁]
  [FiberBundle F₂ E₂] [VectorBundle 𝕜 F₂ E₂]
  [∀ x, IsTopologicalAddGroup (E₂ x)] [∀ x, ContinuousSMul 𝕜 (E₂ x)]

/-- **Layer 0.2.** The bundle of continuous alternating maps
between two `C^n` vector bundles over the same base is a `C^n` vector bundle — the
statement mirrors `ContMDiffVectorBundle.continuousLinearMap` in
`Mathlib/Geometry/Manifold/VectorBundle/Hom.lean`, over the topological bundle of
`Mathlib/Topology/VectorBundle/ContinuousAlternatingMap.lean`. Stated as a theorem;
promote to an instance once proved, never while it carries `sorry`. -/
theorem contMDiffVectorBundle_continuousAlternatingMap
    [ContMDiffVectorBundle n F₁ E₁ IB] [ContMDiffVectorBundle n F₂ E₂ IB] :
    ContMDiffVectorBundle n (F₁ [⋀^ι]→L[𝕜] F₂) (fun x ↦ E₁ x [⋀^ι]→L[𝕜] E₂ x) IB :=
  sorry

end AlternatingBundle

/-! ## Layer 0.3–0.4: rough and smooth forms on manifolds, pullback -/

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

/-- **Layer 0.3.** The pointwise paired wedge of fixed-coefficient rough forms. The pairing
is constant on the base; a varying bundle pairing belongs to the bundle-valued API. -/
noncomputable def RoughForm.wedgeWith
    {F₁ F₂ F₃ : Type*} [NormedAddCommGroup F₁] [NormedSpace ℝ F₁]
    [NormedAddCommGroup F₂] [NormedSpace ℝ F₂] [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃) (φ : RoughForm I M F₁ k) (η : RoughForm I M F₂ l) :
    RoughForm I M F₃ (k + l) :=
  fun x ↦ TauCetiRoadmap.DifferentialGeometry.wedgeWith (E := E) μ (φ x) (η x)

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

/-- **Layer 0.4.** The paired wedge of smooth fixed-coefficient forms is smooth for every
continuous bilinear pairing. This is where 0.2's smooth bundle structure is used. -/
theorem smoothForms_wedgeWith_mem [IsManifold I 1 M] [IsManifold I ∞ M]
    {F₁ F₂ F₃ : Type*} [NormedAddCommGroup F₁] [NormedSpace ℝ F₁]
    [NormedAddCommGroup F₂] [NormedSpace ℝ F₂] [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃) (φ : SmoothForm I M F₁ k) (η : SmoothForm I M F₂ l) :
    RoughForm.wedgeWith μ (φ : RoughForm I M F₁ k) (η : RoughForm I M F₂ l) ∈
      smoothForms I M F₃ (k + l) :=
  sorry

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

/-- **Layer 1.2, naturality.** For a `C²` map and a `C¹` form, `f^* (dφ) = d (f^* φ)`. -/
theorem mpullback_mextDeriv [IsManifold I 1 M] [IsManifold I' 1 M'] [IsManifold I 2 M]
    [IsManifold I' 2 M'] {f : M → M'}
    (hf : ContMDiff I I' 2 f) {φ : RoughForm I' M' F k} (hφ : IsSmoothForm I' 1 φ) :
    mpullback I I' f (mextDeriv φ) = mextDeriv (mpullback I I' f φ) :=
  sorry

/-- **Layer 1.3.** `d ∘ d = 0` on `C²` forms. -/
theorem mextDeriv_mextDeriv [IsManifold I 1 M] [IsManifold I 2 M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I 2 φ) : mextDeriv (mextDeriv φ) = 0 :=
  sorry

/-- **Layer 1.3.** Preservation of regularity, the manifold transfer of the flat fact that
`extDerivWithin` takes `C^(n+1)` forms to `C^n` forms on a set of unique differentiability: on a
`C^(n+2)` manifold, `d` takes `C^(n+1)` forms to `C^n` forms. -/
theorem isSmoothForm_mextDeriv [IsManifold I 1 M] [IsManifold I (n + 2) M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I (n + 1) φ) : IsSmoothForm I n (mextDeriv φ) :=
  sorry

/-- **Layer 1.3.** The smooth case: `d` maps `Ω^k` to `Ω^(k+1)`. -/
theorem isSmoothForm_mextDeriv_infty [IsManifold I 1 M] [IsManifold I ∞ M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I ∞ φ) : IsSmoothForm I ∞ (mextDeriv φ) :=
  sorry

/-- **Layer 1.4.** The vector-valued Leibniz rule for a fixed continuous bilinear pairing,
with the determinant convention's unit constants. This includes a Lie bracket, so it applies
to `dω + ½[ω ∧ ω]`. A base-dependent pairing would contribute its own derivative; arbitrary
bundle coefficients instead require connections and a compatible (parallel) pairing. -/
theorem mextDeriv_wedgeWith [IsManifold I 1 M]
    {F₁ F₂ F₃ : Type*} [NormedAddCommGroup F₁] [NormedSpace ℝ F₁]
    [NormedAddCommGroup F₂] [NormedSpace ℝ F₂] [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃) {φ : RoughForm I M F₁ k} {η : RoughForm I M F₂ l}
    (hφ : IsSmoothForm I 1 φ) (hη : IsSmoothForm I 1 η) (x : M)
    (v : Fin (k + l + 1) → TangentSpace I x) :
    mextDeriv (RoughForm.wedgeWith μ φ η) x v =
      RoughForm.wedgeWith μ (mextDeriv φ) η x
        (v ∘ Fin.cast (show k + 1 + l = k + l + 1 by omega)) +
        (-1 : ℝ) ^ k • RoughForm.wedgeWith μ φ (mextDeriv η) x
          (v ∘ Fin.cast (show k + (l + 1) = k + l + 1 by omega)) :=
  sorry

/-- **Layer 1.4, the invariant formula for 1-forms** [Lee, Prop. 14.29]:
`dφ(V, W) = V(φ(W)) − W(φ(V)) − φ([V, W])`. -/
theorem mextDeriv_apply_one [IsManifold I 1 M] [IsManifold I 2 M] {φ : RoughForm I M ℝ 1}
    (hφ : IsSmoothForm I 1 φ)
    {V W : (x : M) → TangentSpace I x}
    (hV : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, V x⟩ : TangentBundle I M)))
    (hW : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, W x⟩ : TangentBundle I M))) (x : M) :
    mextDeriv φ x ![V x, W x] =
      (id (mfderiv I 𝓘(ℝ) (fun y ↦ φ y ![W y]) x (V x)) : ℝ) -
        (id (mfderiv I 𝓘(ℝ) (fun y ↦ φ y ![V y]) x (W x)) : ℝ) -
        φ x ![VectorField.mlieBracket I V W x] :=
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
the same tangent orientations are related (`Manifold.Orientation.ext`). -/
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

/-- **Layer 2.1, extensionality.** An orientation is determined by its tangent orientations. -/
theorem Manifold.Orientation.ext {o o' : Manifold.Orientation I M ι}
    (h : ∀ x, orientationAt o x = orientationAt o' x) : o = o' :=
  sorry

/-- **Layer 2.1.** On a preconnected manifold there are at most two orientations. -/
theorem Manifold.Orientation.eq_or_eq_neg [PreconnectedSpace M]
    (o o' : Manifold.Orientation I M ι) : o' = o ∨ o' = o.neg :=
  sorry

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

/-- **Layer 2.2, the pullback orientation** [Lee, Prop. 15.15]: along a local diffeomorphism
there is an orientation of the source making `f` orientation-preserving everywhere, provided the
index type has the source's dimension. That hypothesis is exactly what is needed: when `M` is
nonempty it follows from `card_eq` of `o'` and the invertible differential of `f` at any point,
and when `M` is empty it is the whole content (for the empty map from an empty manifold modelled
on `ℝ²` to `ℝ` there is no orientation indexed by `Fin 1`, since `card_eq` would force `1 = 2`). -/
theorem exists_isOrientationPreservingAt_pullback [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) (hcard : Fintype.card ι = Module.finrank ℝ E) :
    ∃ o : Manifold.Orientation I M ι, ∀ x, IsOrientationPreservingAt o o' f x :=
  sorry

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
differential of `f` at `x`, so it is the witness of `exists_isOrientationPreservingAt_pullback`.
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

/-- **Layer 2.2.** A nowhere-vanishing continuous top form determines an orientation: the one
for which the form is positive on positively oriented bases. -/
theorem exists_orientation_of_topForm [IsManifold I 1 M]
    {φ : RoughForm I M ℝ (Module.finrank ℝ E)} (hφ : IsSmoothForm I 0 φ) (h0 : ∀ x, φ x ≠ 0) :
    ∃ o : Manifold.Orientation I M (Fin (Module.finrank ℝ E)),
      ∀ (x : M) (b : Module.Basis (Fin (Module.finrank ℝ E)) ℝ (TangentSpace I x)),
        b.orientation = orientationAt o x ↔ 0 < φ x b :=
  sorry

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

section IndexTwo

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [FiniteDimensional ℝ E]

/-- **Layer 2.4** [Lee, Thm. 15.43]: if `π₁(M, x)` has no subgroup of index `2`, `M` is
orientable; in particular simply connected manifolds are orientable. The route is the
orientation double cover of 2.4 with Tau Ceti's covering-space classification. -/
theorem orientable_of_forall_index_ne_two [IsManifold I 1 M] [T2Space M] [ConnectedSpace M]
    [LocallyPathConnectedSpace M] (x : M)
    (h : ∀ K : Subgroup (FundamentalGroup M x), K.index ≠ 2) : Orientable I M :=
  sorry

end IndexTwo

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

/-- **Layer 3.3.** Compactly supported fields are complete [Lee, Thm. 9.16]. -/
theorem isCompleteVectorField_of_isCompact [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {K : Set M}
    (hK : IsCompact K) (hvK : ∀ x ∉ K, v x = 0) : IsCompleteVectorField v :=
  sorry

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

/-- **Layer 3.4, naturality.** `F`-related fields have `F`-conjugate flows [Lee, Prop. 9.6]. -/
theorem flowOf_comp_of_related {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [CompleteSpace E'] [TopologicalSpace H'] {J : ModelWithCorners ℝ E' H'} [TopologicalSpace N]
    [ChartedSpace H' N] [T2Space N] [BoundarylessManifold J N] [IsManifold I 1 M]
    [IsManifold J 1 N] {v : (x : M) → TangentSpace I x} {w : (y : N) → TangentSpace J y}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hw : ContMDiff J J.tangent 1 (fun y ↦ (⟨y, w y⟩ : TangentBundle J N)))
    {f : M → N} (hf : ContMDiff I J 1 f) (hrel : ∀ x, mfderiv I J f x (v x) = w (f x))
    {t : ℝ} {x : M} (ht : (t, x) ∈ flowDomain v) :
    (t, f x) ∈ flowDomain w ∧ f (flowOf v t x) = flowOf w t (f x) :=
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
`D`: a `C^n` manifold carrier modelled on `ℝ^k`, with its own topology (not the subspace topology
of its image), and a `C^n` immersion into `M` whose differential has image exactly `D` at every
point. The immersion need not be injective; injectivity, connectedness and second countability
are hypotheses or conclusions where they are used. Regularity and involutivity of `D` are Tau
Ceti's `TauCeti.IsContMDiffDistribution` and `TauCeti.IsInvolutiveDistribution`. -/
structure IntegralManifold (D : (x : M) → Submodule ℝ (TangentSpace I x)) (k : ℕ) where
  carrier : Type u
  [topologicalSpace : TopologicalSpace carrier]
  [chartedSpace : ChartedSpace (EuclideanSpace ℝ (Fin k)) carrier]
  [isManifold : IsManifold (𝓡 k) n carrier]
  inclusion : carrier → M
  isImmersion : Manifold.IsImmersion (𝓡 k) I n inclusion
  range_mfderiv : ∀ y,
    LinearMap.range (mfderiv (𝓡 k) I inclusion y).toLinearMap = D (inclusion y)

attribute [instance] IntegralManifold.topologicalSpace
  IntegralManifold.chartedSpace IntegralManifold.isManifold

/-- **Layer 4.2.** A smooth rank-`k` distribution with a smooth integral
manifold through every point is involutive, in Tau Ceti's local sense (brackets of fields that are
differentiable and tangent to `D` on an open set stay tangent to `D` there). There is no merely
continuous specialization. -/
theorem isInvolutive_of_forall_exists_integralManifold
    [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D)
    (h : ∀ x : M, ∃ N : IntegralManifold I ∞ D k, x ∈ range N.inclusion) :
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
      x ∈ range N.inclusion ∧ x ∈ e.source ∧ Module.finrank ℝ P.direction = k ∧
      ContMDiffOn I 𝓘(ℝ, E) ∞ e e.source ∧ ContMDiffOn 𝓘(ℝ, E) I ∞ e.symm e.target ∧
      TauCeti.IsSliceChart e (P : Set E) (range N.inclusion) :=
  sorry

/-- **Layer 4.3, weak embeddedness.** A smooth map from a finite-dimensional
smooth Hausdorff second-countable boundaryless manifold into `M` whose image lies in an
injectively immersed integral manifold with second-countable carrier factors smoothly through
it. -/
theorem exists_contMDiff_factor [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M] {D : (x : M) → Submodule ℝ (TangentSpace I x)}
    (hD : TauCeti.IsContMDiffDistribution I ∞ k D) (hInv : TauCeti.IsInvolutiveDistribution I D)
    (N : IntegralManifold I ∞ D k) (hinj : Function.Injective N.inclusion)
    [SecondCountableTopology N.carrier]
    {E' H' P : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    [FiniteDimensional ℝ E'] [TopologicalSpace H']
    {J : ModelWithCorners ℝ E' H'} [TopologicalSpace P]
    [ChartedSpace H' P] [IsManifold J ∞ P]
    [BoundarylessManifold J P] [T2Space P] [SecondCountableTopology P]
    {f : P → M} (hf : ContMDiff J I ∞ f)
    (hrange : range f ⊆ range N.inclusion) :
    ∃ g : P → N.carrier, ContMDiff J (𝓡 k) ∞ g ∧
      N.inclusion ∘ g = f :=
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
    ∃ N : IntegralManifold I ∞ D k, x ∈ range N.inclusion ∧ ConnectedSpace N.carrier ∧
      Function.Injective N.inclusion ∧
      (∀ N' : IntegralManifold I ∞ D k, ConnectedSpace N'.carrier →
        (range N'.inclusion ∩ range N.inclusion).Nonempty →
          range N'.inclusion ⊆ range N.inclusion) ∧
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

/-- **Layer 5.1.** An outward-pointing smooth field along the boundary exists [Lee, Prop. 15.33]. -/
theorem exists_isOutwardPointing [T2Space M] [SigmaCompactSpace M] [IsManifold (𝓡∂ (n + 1)) ∞ M] :
    ∃ v : (x : M) → TangentSpace (𝓡∂ (n + 1)) x,
      ContMDiff (𝓡∂ (n + 1)) (𝓡∂ (n + 1)).tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle (𝓡∂ (n + 1)) M)) ∧
        ∀ x ∈ (𝓡∂ (n + 1)).boundary M, IsOutwardPointing x (v x) :=
  sorry

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

/-! ### Layer 5.6: Green's theorem for planar regions and curves

The plane is `ℂ` with positive basis `(1, I)` and `volume` as area; `TauCeti.Contour.windingNumber`
is the index. The one-cell identities of 5.6.2 and the absolutely continuous theorems of 5.6.3
are stated; the finite type-I/type-II division theorems of 5.6.2 lack the oriented boundary
chain carrier (module docstring).
-/

namespace Green

noncomputable section

open MeasureTheory Set
open scoped Classical

/-- **Layer 5.6.** Curl of `P dx + Q dy`, `∂ₓQ − ∂ᵧP`, using real derivatives and the positive
basis `(1, I)`. -/
def curl (P Q : ℂ → ℝ) (z : ℂ) : ℝ :=
  fderiv ℝ Q z (1 : ℂ) - fderiv ℝ P z Complex.I

/-- **Layer 5.6.** The circulation integrand `P(γ t) x'(t) + Q(γ t) y'(t)`. -/
def circulationFun (P Q : ℂ → ℝ) (γ : ℝ → ℂ) (t : ℝ) : ℝ :=
  P (γ t) * (deriv γ t).re + Q (γ t) * (deriv γ t).im

/-- **Layer 5.6.1.** The area weight of a closed curve: the real part of the winding number off
the trace, and zero on the trace, independently of the principal-value index there. -/
def windingWeight (γ : ℝ → ℂ) (a b : ℝ) (z : ℂ) : ℝ :=
  if z ∈ γ '' uIcc a b then 0 else (TauCeti.Contour.windingNumber γ a b z).re

/-- **Layer 5.6.2.** The vertical (type-I) cell `{x + iy : a ≤ x ≤ b, ℓ x ≤ y ≤ u x}`. -/
def verticalCell (a b : ℝ) (ℓ u : ℝ → ℝ) : Set ℂ :=
  {z | z.re ∈ Icc a b ∧ z.im ∈ Icc (ℓ z.re) (u z.re)}

/-- **Layer 5.6.2.** The horizontal (type-II) cell `{x + iy : c ≤ y ≤ d, ℓ y ≤ x ≤ u y}`. -/
def horizontalCell (c d : ℝ) (ℓ u : ℝ → ℝ) : Set ℂ :=
  {z | z.im ∈ Icc c d ∧ z.re ∈ Icc (ℓ z.im) (u z.im)}

/-- **Layer 5.6.2, the `P dx` identity on a vertical cell**, `∮_{∂V} P dx = −∫_V ∂ᵧP dA`. On the
positively oriented boundary the vertical edges contribute nothing to `∮ P dx`, and the bottom
and top graphs, parametrized by `x`, contribute `∫ P(x + iℓ x) dx` and `−∫ P(x + iu x) dx`; the
boundary side is an ordinary interval integral because its integrand is continuous. Only
continuity of `P` on the cell and of the graphs, the slice derivative `Py` of `y ↦ P (x + iy)` at
every point of the cell, and area integrability of `Py` are assumed: no Fréchet derivative of
`P`, no other partial derivative, and no continuity of `Py`. -/
theorem green_verticalCell {a b : ℝ} (hab : a < b) {ℓ u : ℝ → ℝ}
    (hℓ : ContinuousOn ℓ (Icc a b)) (hu : ContinuousOn u (Icc a b))
    (hℓu : ∀ x ∈ Icc a b, ℓ x ≤ u x) {P Py : ℂ → ℝ}
    (hP : ContinuousOn P (verticalCell a b ℓ u))
    (hPy : ∀ z ∈ verticalCell a b ℓ u,
      HasDerivAt (fun y : ℝ ↦ P (z.re + y * Complex.I)) (Py z) z.im)
    (hint : IntegrableOn Py (verticalCell a b ℓ u) volume) :
    (∫ x in a..b, (P (x + ℓ x * Complex.I) - P (x + u x * Complex.I))) =
      -∫ z in verticalCell a b ℓ u, Py z :=
  sorry

/-- **Layer 5.6.2, the `Q dy` identity on a horizontal cell**, `∮_{∂H} Q dy = ∫_H ∂ₓQ dA`: the
right graph is traversed upward and the left graph downward, and the horizontal edges contribute
nothing to `∮ Q dy`. The hypotheses are the coordinate-swapped ones of `green_verticalCell`. -/
theorem green_horizontalCell {c d : ℝ} (hcd : c < d) {ℓ u : ℝ → ℝ}
    (hℓ : ContinuousOn ℓ (Icc c d)) (hu : ContinuousOn u (Icc c d))
    (hℓu : ∀ y ∈ Icc c d, ℓ y ≤ u y) {Q Qx : ℂ → ℝ}
    (hQ : ContinuousOn Q (horizontalCell c d ℓ u))
    (hQx : ∀ z ∈ horizontalCell c d ℓ u,
      HasDerivAt (fun x : ℝ ↦ Q (x + z.im * Complex.I)) (Qx z) z.re)
    (hint : IntegrableOn Qx (horizontalCell c d ℓ u) volume) :
    (∫ y in c..d, (Q (u y + y * Complex.I) - Q (ℓ y + y * Complex.I))) =
      ∫ z in horizontalCell c d ℓ u, Qx z :=
  sorry

/-- **Layer 5.6.3, Green for absolutely continuous cycles**, winding-weighted: for a closed
absolutely continuous curve whose index vanishes off an open `U` containing its trace and fields
`C¹` on `U`, both sides are integrable and the circulation equals the weighted curl integral.
Repeated traversal and self-intersection are allowed. -/
theorem green_ac_winding {γ : ℝ → ℂ} {a b : ℝ} {U : Set ℂ} {P Q : ℂ → ℝ}
    (hab : a < b) (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b)
    (hU : IsOpen U) (htrace : γ '' uIcc a b ⊆ U)
    (hP : ContDiffOn ℝ 1 P U) (hQ : ContDiffOn ℝ 1 Q U)
    (hindex : ∀ z ∉ U, TauCeti.Contour.windingNumber γ a b z = 0) :
    IntervalIntegrable (circulationFun P Q γ) volume a b ∧
      IntegrableOn (fun z ↦ windingWeight γ a b z * curl P Q z) U volume ∧
      (∫ t in a..b, circulationFun P Q γ t) =
        ∫ z in U, windingWeight γ a b z * curl P Q z :=
  sorry

/-- **Layer 5.6.3, HOL Light's strength**: index one on the bounded complementary region
`filledHull K \ K` of the trace `K`, contained with the region in `U`. No simplicity, finite
partition, nonzero speed, or compact support of the field is assumed; the flux form follows by
replacing `(P, Q)` with `(−Y, X)`. -/
theorem green_ac_index_one {γ : ℝ → ℂ} {a b : ℝ} {U : Set ℂ} {P Q : ℂ → ℝ}
    (hab : a < b) (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b)
    (hU : IsOpen U) (hregion : TauCeti.filledHull (γ '' uIcc a b) ⊆ U)
    (hP : ContDiffOn ℝ 1 P U) (hQ : ContDiffOn ℝ 1 Q U)
    (hindex : ∀ z ∈ TauCeti.filledHull (γ '' uIcc a b) \ (γ '' uIcc a b),
      TauCeti.Contour.windingNumber γ a b z = 1) :
    IntervalIntegrable (circulationFun P Q γ) volume a b ∧
      IntegrableOn (curl P Q) (TauCeti.filledHull (γ '' uIcc a b) \ (γ '' uIcc a b)) volume ∧
      (∫ t in a..b, circulationFun P Q γ t) =
        ∫ z in TauCeti.filledHull (γ '' uIcc a b) \ (γ '' uIcc a b), curl P Q z :=
  sorry

end

end Green

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

section RiemannianExistence

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M]

/-- **Layer 12.1.** Every T2 σ-compact finite-dimensional `C^∞` manifold admits a `C^∞`
Riemannian metric [Lee, Prop. 13.3]. -/
theorem nonempty_contMDiffRiemannianMetric [T2Space M] [SigmaCompactSpace M] [IsManifold I ∞ M] :
    Nonempty (ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) :=
  sorry

end RiemannianExistence

section Riemannian

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

/-- **Layer 12.2, the Riemannian gradient**: the fibrewise Riesz dual of `mfderiv I 𝓘(ℝ) f x`,
through Tau Ceti's `Riemannian.Tensor.rieszDual`. -/
noncomputable def mgradient (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    (f : M → ℝ) (x : M) : TangentSpace I x :=
  Riemannian.Tensor.rieszDual (I := I) x (mfderiv I 𝓘(ℝ) f x)

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

/-- **Layer 12.3.** The Hessian `Hess f (v, w) = ⟪∇_v grad f, w⟫`. -/
noncomputable def hessian (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsManifold I 2 M]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]
    (f : M → ℝ) (x : M) (v w : TangentSpace I x) : ℝ :=
  ⟪CovariantDerivative.leviCivitaConnection I M (mgradient I f) x v, w⟫_ℝ

/-- **Layer 12.3.** Symmetry of the Hessian of a smooth function, from torsion-freeness of the
Levi-Civita connection. -/
theorem hessian_symm [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M) (v w : TangentSpace I x) :
    hessian I f x v w = hessian I f x w v :=
  sorry

/-- **Layer 12.3.** The Laplace–Beltrami operator, `Δ f = div (grad f)` — this repository's sign. -/
noncomputable def laplaceBeltrami (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsManifold I 2 M]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)] (f : M → ℝ) (x : M) : ℝ :=
  divergence I (mgradient I f) x

/-- **Layer 12.5, the divergence theorem on boundaryless `M`** [Lee, Thm. 16.32]: a compactly
supported smooth field has divergence of integral zero for the Riemannian volume. The
smooth-boundary theorem is `integral_divergence_eq_boundaryFlux` below. -/
theorem integral_divergence_eq_zero [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    {X : (x : M) → TangentSpace I x}
    (hX : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, X y⟩ : TangentBundle I M)))
    {K : Set M} (hK : IsCompact K) (hXK : ∀ x ∉ K, X x = 0) :
    ∫ x, divergence I X x ∂TauCeti.riemannianVolume I M = 0 :=
  sorry

/-- **Layer 12.5, Green's first identity** on boundaryless `M`, for `f` compactly supported:
`∫ f Δg = −∫ ⟪grad f, grad g⟫`. -/
theorem integral_mul_laplaceBeltrami [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] {f g : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hg : ContMDiff I 𝓘(ℝ) ∞ g) (hfc : HasCompactSupport f) :
    ∫ x, f x * laplaceBeltrami I g x ∂TauCeti.riemannianVolume I M =
      -∫ x, ⟪mgradient I f x, mgradient I g x⟫_ℝ ∂TauCeti.riemannianVolume I M :=
  sorry

/-- **Layer 12.5, Green's second identity** on boundaryless `M`, for `f` and `g` compactly
supported: `Δ` is symmetric for the Riemannian volume. -/
theorem integral_laplaceBeltrami_symm [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] {f g : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hg : ContMDiff I 𝓘(ℝ) ∞ g) (hfc : HasCompactSupport f)
    (hgc : HasCompactSupport g) :
    ∫ x, f x * laplaceBeltrami I g x ∂TauCeti.riemannianVolume I M =
      ∫ x, laplaceBeltrami I f x * g x ∂TauCeti.riemannianVolume I M :=
  sorry

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
