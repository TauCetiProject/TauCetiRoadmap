module

public import Mathlib
public import TauCeti.Analysis.ODE.InitialCondition
public import TauCeti.Geometry.Lie.IntegralCurve
public import TauCeti.Geometry.Manifold.Boundary.Charts
public import TauCeti.Geometry.Manifold.IntegralCurve.Flow
public import TauCeti.Geometry.Manifold.IntegralCurve.Maximal
public import TauCeti.Geometry.Manifold.LocallyFlat.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Sphere
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
public import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz
public import TauCeti.Analysis.Contour.Winding.Number.Basic
public import TauCeti.Analysis.Contour.PiecewiseC1On
public import TauCeti.Analysis.Contour.Winding.Proximity
public import TauCeti.Analysis.Normed.Module.FilledHull

/-!
# Differential geometry — forms, Stokes, flows, planar Green and Riemannian calculus: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every definition here has a real body (`wedgeWith`, `mextDerivWithin`, `smoothForms`,
`closedForms`, `orientationAt`, `mpullback`, `flowDomain`, `toFlow`, `planarRadialPrimitive`,
`fullSimplexEquivStdSimplex`, `mgradient`, `laplaceBeltrami`, …), so that the statements about
them mean exactly what they say. Constructions whose body is itself a theorem are README targets
with their intended signatures and are not declared here: integration of top forms and of
densities over manifolds, and with it Stokes' theorem and the boundary orientation (README 5);
the homotopy operator (5.4); the smooth face structure and abstract boundary (5.5b); the topology
and smooth structure of a covering space and of the orientation double cover, with its canonical
orientation (2.3–2.4), so that the equivalences of 2.4 (a connected
`M` is orientable exactly when its orientation cover is disconnected, exactly when the cover has a
section, exactly when it is trivial) lack the cover's topology and are not stated; inward
domination (3.6); leaves of an involutive distribution (4.3); the Riemannian volume form and
density (12.3–12.4); the Lie derivative of forms (1.4); and the migration equivalence from Tau
Ceti's `TauCeti.SmoothTwoForm` (0.4). De Rham cohomology and everything built on it belong to
DeRhamCohomologyAndDuality, which imports this file.


`mgradient` is compatibility notation for the Riesz expression; the native gradient
source and its additional comparison obligations are named in README12.2.

Existing Tau Ceti declarations are imported and consumed rather than restated: the
boundary manifold (`TauCeti.isManifold_boundary`), the maximal integral curve
(`maximalIntegralCurve`, whose compact-manifold completeness discharges 3.3's completeness on
compact manifolds in place) and the finite-dimensional maximal flow (`maximalIntegralCurveFlowDomain`,
`maximalIntegralCurve_add`, the escape lemma, which discharge 3.2's finite-dimensional targets in
place), finite-dimensional smooth dependence of flows
(`ODE.exists_contDiffAt_localFlow`), the planar filled hull and winding number of layer 5.6
(`TauCeti.filledHull`, `TauCeti.Contour.windingNumber`), the
Riemannian volume measure (`TauCeti.riemannianVolume`), the Riesz duality of a Riemannian
bundle (`Riemannian.Tensor.rieszDual`), the `C^∞` regularity of Mathlib's Levi-Civita
connection `CovariantDerivative.leviCivitaConnection`, slice charts (`TauCeti.IsSliceChart`), and
the invariant integral curves of a Lie group (`mulInvariantIntegralCurve`).

Only theorems carry `sorry`. Anything that should eventually be a global instance
(`ContMDiffVectorBundle` for the alternating bundle) is stated as a theorem; the only global
instances are real ones (the projections of `IntegralManifold`, scalar multiplication of
densities).

Conventions (see `README.md`): scalars `ℝ` where the geometry is real, `𝕜` where the
statement is honestly general; the wedge follows the determinant convention, pinned by
`wedgeWith_apply` and `wedgeWith_apply_one_one`; hypotheses are unbundled and stated at their
point of use; finite dimension, Hausdorffness and σ-compactness are written wherever they are used; measure
statements carry `[MeasurableSpace M] [BorelSpace M]`. Elaborates against the pinned
toolchain (sorry-warnings only).
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
sign-weighted sum over all permutations divided by `k! * l!`, pinned in every degree by
`wedgeWith_apply`. Equivalently it is the sum over `(k, l)`-shuffles with no factorial,
matching `AlternatingMap.domCoprod`; if `Alt` divides by `(k + l)!`, the coefficient of
`Alt (μ ∘ (φ ⊗ ψ))` is `(k + l)! / (k! * l!)`. At this generality the
theorems are bilinearity, the norm bound, compatibility with `compContinuousLinearMap`,
the characterization through alternatization, naturality in `μ`, and the *flip* identity
`wedgeWith_flip`; associativity and graded commutativity are **not** theorems here
(degree zero reduces them to associativity and commutativity of `μ`) and hold only
under explicit hypotheses on the pairings — `wedgeWith_assoc` below. -/
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

/-- **Layer 0.1, all-degree normalization.** The paired wedge is the signed permutation
sum divided by `k! * l!`. `Fin.castAdd l` selects the first `k` slots and `Fin.natAdd k`
the last `l` slots; `Equiv.Perm.sign` acts through the usual sign action on an additive
group. This is the determinant convention for every continuous bilinear pairing. -/
theorem wedgeWith_apply (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂)
    (v : Fin (k + l) → E) :
    wedgeWith μ φ ψ v =
      ((k.factorial : ℝ) * (l.factorial : ℝ))⁻¹ •
        ∑ σ : Equiv.Perm (Fin (k + l)), Equiv.Perm.sign σ •
          μ (φ (fun i => v (σ (Fin.castAdd l i))))
            (ψ (fun j => v (σ (Fin.natAdd k j)))) :=
  sorry

/-- **Layer 0.1, degree-one normalization.** The `(1, 1)` case of `wedgeWith_apply`:
there is no factor `1/2`, for an arbitrary continuous bilinear pairing. -/
theorem wedgeWith_apply_one_one (φ : E [⋀^Fin 1]→L[ℝ] F₁)
    (ψ : E [⋀^Fin 1]→L[ℝ] F₂) (v w : E) :
    wedgeWith μ φ ψ ![v, w] = μ (φ ![v]) (ψ ![w]) - μ (φ ![w]) (ψ ![v]) :=
  sorry

/-- **Layer 0.1.** Additivity in the first argument; with `wedgeWith_smul_left` and the
right-hand variants this makes the paired wedge bilinear. -/
theorem wedgeWith_add_left (φ φ' : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    wedgeWith μ (φ + φ') ψ = wedgeWith μ φ ψ + wedgeWith μ φ' ψ :=
  sorry

theorem wedgeWith_smul_left (c : ℝ) (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    wedgeWith μ (c • φ) ψ = c • wedgeWith μ φ ψ :=
  sorry

/-- **Layer 0.1.** The norm bound, with the explicit constant of the determinant convention:
the number of `(k, l)`-shuffles. -/
theorem norm_wedgeWith_le (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    ‖wedgeWith μ φ ψ‖ ≤ (k + l).choose k * ‖μ‖ * ‖φ‖ * ‖ψ‖ :=
  sorry

/-- **Layer 0.1.** Compatibility with the pointwise pullback `compContinuousLinearMap`; this is
what makes `mpullback` a wedge homomorphism with no differentiability hypothesis at all. -/
theorem wedgeWith_compContinuousLinearMap {E' : Type*} [NormedAddCommGroup E']
    [NormedSpace ℝ E'] (f : E' →L[ℝ] E) (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    wedgeWith μ (φ.compContinuousLinearMap f) (ψ.compContinuousLinearMap f) =
      (wedgeWith μ φ ψ).compContinuousLinearMap f :=
  sorry

/-- **Layer 0.1, the flip identity.** Swapping the factors flips the pairing and costs the
graded sign; this holds for *every* pairing, and graded commutativity for a commutative
`μ` (where `μ.flip = μ`) is its corollary. The degree cast is `Fin.cast`. -/
theorem wedgeWith_flip (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂)
    (v : Fin (k + l) → E) :
    wedgeWith μ φ ψ v =
      (-1 : ℝ) ^ (k * l) • wedgeWith μ.flip ψ φ (v ∘ Fin.cast (Nat.add_comm l k)) :=
  sorry

/-- **Layer 0.1, associativity under a compatibility hypothesis on the pairings**: it is a
theorem exactly when the two composite pairings agree, `μ₁₂₃ (μ₁₂ a b) c = μ₁₂₃' a (μ₂₃ b c)`,
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

/-- **Layer 0.1.** The ℝ-valued wedge, the multiplication specialization of `wedgeWith`:
`ω ∧ η = ((k+l)!/(k!·l!)) • Alt (ω ⊗ η)`, so that elementary covectors satisfy
`ε^I ∧ ε^J = ε^{I++J}` and top-degree wedges of covectors are determinants. This is the
graded-commutative associative case, with the normalization inherited from
`wedgeWith_apply`; `wedge_apply_one_one` below specializes the paired degree-one law. -/
noncomputable def wedge (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ) :
    E [⋀^Fin (k + l)]→L[ℝ] ℝ :=
  wedgeWith (ContinuousLinearMap.mul ℝ ℝ) φ ψ

/-- **Layer 0.1, scalar normalization gate.** On two 1-forms the wedge is the 2×2
determinant, by the general paired identity `wedgeWith_apply_one_one`. Under the Alt
convention the right-hand side would carry a factor `1/2`. -/
theorem wedge_apply_one_one (φ ψ : E [⋀^Fin 1]→L[ℝ] ℝ) (v w : E) :
    wedge φ ψ ![v, w] = φ ![v] * ψ ![w] - φ ![w] * ψ ![v] := by
  simpa only [wedge, ContinuousLinearMap.mul_apply'] using
    (wedgeWith_apply_one_one (μ := ContinuousLinearMap.mul ℝ ℝ) φ ψ v w)

/-- **Layer 0.1.** Left linearity in the scalar; with `wedge_add_left` and the right
variants (not stated here) this makes the wedge bilinear. -/
theorem wedge_smul_left (c : ℝ) (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ) :
    wedge (c • φ) ψ = c • wedge φ ψ :=
  sorry

/-- **Layer 0.1.** Graded commutativity of the ℝ-valued wedge: the flip identity with the
commutative pairing `mul`. -/
theorem wedge_comm (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ) (v : Fin (k + l) → E) :
    wedge φ ψ v = (-1 : ℝ) ^ (k * l) • wedge ψ φ (v ∘ Fin.cast (Nat.add_comm l k)) :=
  sorry

/-- **Layer 0.1.** Associativity of the ℝ-valued wedge, the compatibility hypothesis of
`wedgeWith_assoc` being associativity of multiplication. -/
theorem wedge_assoc (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ)
    (χ : E [⋀^Fin m]→L[ℝ] ℝ) (v : Fin (k + l + m) → E) :
    wedge (wedge φ ψ) χ v = wedge φ (wedge ψ χ) (v ∘ Fin.cast (Nat.add_assoc k l m).symm) :=
  sorry

/-- **Layer 0.1.** The wedge of forms with values in a normed algebra, through its
multiplication: associative (`wedgeWith_assoc` with `h := mul_assoc`), and graded commutative
only when the algebra is commutative. -/
noncomputable def wedgeMul {A : Type*} [NormedRing A] [NormedAlgebra ℝ A]
    (φ : E [⋀^Fin k]→L[ℝ] A) (ψ : E [⋀^Fin l]→L[ℝ] A) : E [⋀^Fin (k + l)]→L[ℝ] A :=
  wedgeWith (ContinuousLinearMap.mul ℝ A) φ ψ

/-- **Layer 0.1.** The bracket wedge `[φ ∧ ψ]` of forms with values in a space carrying a
continuous bilinear bracket `β` (a finite-dimensional Lie algebra's bracket, say): `wedgeWith`
along `β`. It is neither associative nor graded commutative; its laws are graded
skew-symmetry and the graded Jacobi identity below, each under the corresponding hypothesis
on `β`. -/
noncomputable def bracketWedge (β : F₁ →L[ℝ] F₁ →L[ℝ] F₁) (φ : E [⋀^Fin k]→L[ℝ] F₁)
    (ψ : E [⋀^Fin l]→L[ℝ] F₁) : E [⋀^Fin (k + l)]→L[ℝ] F₁ :=
  wedgeWith β φ ψ

/-- **Layer 0.1.** Graded skew-symmetry of the bracket wedge, `[φ ∧ ψ] = -(-1)^{kl} [ψ ∧ φ]`,
for a skew-symmetric bracket: the flip identity with `β.flip = -β`. -/
theorem bracketWedge_skew {β : F₁ →L[ℝ] F₁ →L[ℝ] F₁} (hβ : ∀ a b, β a b = -β b a)
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₁) (v : Fin (k + l) → E) :
    bracketWedge β φ ψ v =
      -((-1 : ℝ) ^ (k * l) • bracketWedge β ψ φ (v ∘ Fin.cast (Nat.add_comm l k))) :=
  sorry

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
local instance pullbackAddCommGroup {B B' : Type*} {V : B → Type*}
    [∀ y, AddCommGroup (V y)] (f : B' → B) (x : B') : AddCommGroup ((f *ᵖ V) x) :=
  inferInstanceAs (AddCommGroup (V (f x)))

local instance pullbackIsTopologicalAddGroup {B B' : Type*} {V : B → Type*}
    [∀ y, AddCommGroup (V y)] [∀ y, TopologicalSpace (V y)]
    [∀ y, IsTopologicalAddGroup (V y)] (f : B' → B) (x : B') :
    IsTopologicalAddGroup ((f *ᵖ V) x) :=
  inferInstanceAs (IsTopologicalAddGroup (V (f x)))

local instance pullbackContinuousSMul {B B' : Type*} {V : B → Type*}
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

theorem bundleMpullback_id {V : M → Type*}
    [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)] [∀ x, TopologicalSpace (V x)]
    (φ : RoughBundleForm I M V k) : bundleMpullback I I id φ = φ :=
  sorry

theorem bundleMpullback_comp {V : M'' → Type*}
    [∀ z, AddCommGroup (V z)] [∀ z, Module ℝ (V z)] [∀ z, TopologicalSpace (V z)]
    {f : M → M'} {g : M' → M''} (hf : MDifferentiable I I' f)
    (hg : MDifferentiable I' I'' g) (φ : RoughBundleForm I'' M'' V k) :
    bundleMpullback I I'' (g ∘ f) φ =
      bundleMpullback I I' f (bundleMpullback I' I'' g φ) :=
  sorry

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

section BundleWedge

variable {V₁ V₂ V₃ : M → Type*}
  [∀ x, AddCommGroup (V₁ x)] [∀ x, Module ℝ (V₁ x)] [∀ x, TopologicalSpace (V₁ x)]
  [∀ x, IsTopologicalAddGroup (V₁ x)] [∀ x, ContinuousSMul ℝ (V₁ x)]
  [∀ x, AddCommGroup (V₂ x)] [∀ x, Module ℝ (V₂ x)] [∀ x, TopologicalSpace (V₂ x)]
  [∀ x, IsTopologicalAddGroup (V₂ x)] [∀ x, ContinuousSMul ℝ (V₂ x)]
  [∀ x, AddCommGroup (V₃ x)] [∀ x, Module ℝ (V₃ x)] [∀ x, TopologicalSpace (V₃ x)]
  [∀ x, IsTopologicalAddGroup (V₃ x)] [∀ x, ContinuousSMul ℝ (V₃ x)]
  {l : ℕ}

/-- **Layer 0.3.** The paired wedge for arbitrary value bundles, through a fibrewise
continuous bilinear map. Joint continuity is explicit because the carrier allows arbitrary
topological fibres; no fibre norms or connection are required. The next equation pins the
determinant normalization and determines all evaluations. -/
noncomputable def bundleWedgeWith (μ : (x : M) → V₁ x →L[ℝ] V₂ x →L[ℝ] V₃ x)
    (hμ : ∀ x, Continuous (fun p : V₁ x × V₂ x ↦ μ x p.1 p.2))
    (φ : RoughBundleForm I M V₁ k) (ψ : RoughBundleForm I M V₂ l) :
    RoughBundleForm I M V₃ (k + l) := fun x ↦
  ((k.factorial : ℝ) * (l.factorial : ℝ))⁻¹ •
    ContinuousMultilinearMap.alternatization
      { toMultilinearMap :=
          (MultilinearMap.uncurrySum (N := fun _ : Fin k ⊕ Fin l ↦ TangentSpace I x)
            (({ toFun := fun a ↦ (μ x a).toLinearMap.compMultilinearMap
                    (ψ x).toContinuousMultilinearMap.toMultilinearMap
                map_add' := fun a b ↦ by ext; simp
                map_smul' := fun c a ↦ by ext; simp } :
                V₁ x →ₗ[ℝ] MultilinearMap ℝ (fun _ : Fin l ↦ TangentSpace I x) (V₃ x)).compMultilinearMap
              (φ x).toContinuousMultilinearMap.toMultilinearMap)).domDomCongr finSumFinEquiv
        cont := by
          change Continuous fun v : Fin (k + l) → TangentSpace I x ↦
            μ x ((φ x) (fun i ↦ v (finSumFinEquiv (Sum.inl i))))
              ((ψ x) (fun j ↦ v (finSumFinEquiv (Sum.inr j))))
          exact (hμ x).comp
            (((φ x).toContinuousMultilinearMap.cont.comp
                (continuous_pi fun i ↦ continuous_apply (finSumFinEquiv (Sum.inl i)))).prodMk
              ((ψ x).toContinuousMultilinearMap.cont.comp
                (continuous_pi fun j ↦ continuous_apply (finSumFinEquiv (Sum.inr j))))) }

theorem bundleWedgeWith_apply (μ : (x : M) → V₁ x →L[ℝ] V₂ x →L[ℝ] V₃ x)
    (hμ : ∀ x, Continuous (fun p : V₁ x × V₂ x ↦ μ x p.1 p.2))
    (φ : RoughBundleForm I M V₁ k) (ψ : RoughBundleForm I M V₂ l) (x : M)
    (v : Fin (k + l) → TangentSpace I x) :
    bundleWedgeWith μ hμ φ ψ x v =
      (((k.factorial : ℝ) * (l.factorial : ℝ))⁻¹) •
        ∑ σ : Equiv.Perm (Fin (k + l)), Equiv.Perm.sign σ •
          μ x (φ x (fun i ↦ v (σ (Fin.castAdd l i))))
            (ψ x (fun i ↦ v (σ (Fin.natAdd k i)))) :=
  sorry

/-- **Layer 0.3.** Pullback of a paired wedge pulls back the pairing as well as both
value bundles; this is pointwise algebra and has no differentiability hypothesis. -/
theorem bundleMpullback_wedgeWith (f : M' → M)
    (μ : (x : M) → V₁ x →L[ℝ] V₂ x →L[ℝ] V₃ x)
    (hμ : ∀ x, Continuous (fun p : V₁ x × V₂ x ↦ μ x p.1 p.2))
    (φ : RoughBundleForm I M V₁ k) (ψ : RoughBundleForm I M V₂ l) :
    bundleMpullback I' I f (bundleWedgeWith μ hμ φ ψ) =
      bundleWedgeWith (I := I') (fun y ↦ μ (f y)) (fun y ↦ hμ (f y))
        (bundleMpullback I' I f φ) (bundleMpullback I' I f ψ) :=
  sorry

end BundleWedge

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

theorem mpullback_id (φ : RoughForm I M F k) : mpullback I I id φ = φ :=
  sorry

/-- **Layer 0.3.** The chain rule for pullbacks needs differentiability, exactly as `mfderiv`'s
does: the composition law is *not* unconditional for a junk-valued derivative. -/
theorem mpullback_comp_at {f : M → M'} {g : M' → M''} {x : M}
    (hf : MDifferentiableAt I I' f x) (hg : MDifferentiableAt I' I'' g (f x))
    (φ : RoughForm I'' M'' F k) :
    mpullback I I'' (g ∘ f) φ x = mpullback I I' f (mpullback I' I'' g φ) x :=
  sorry

theorem mpullback_comp_on {f : M → M'} {g : M' → M''} {s : Set M} {t : Set M'}
    (hs : IsOpen s) (hf : ContMDiffOn I I' 1 f s) (ht : IsOpen t) (hg : ContMDiffOn I' I'' 1 g t)
    (hst : MapsTo f s t) (φ : RoughForm I'' M'' F k) :
    ∀ x ∈ s, mpullback I I'' (g ∘ f) φ x = mpullback I I' f (mpullback I' I'' g φ) x :=
  sorry

theorem mpullback_comp {f : M → M'} {g : M' → M''}
    (hf : MDifferentiable I I' f) (hg : MDifferentiable I' I'' g) (φ : RoughForm I'' M'' F k) :
    mpullback I I'' (g ∘ f) φ = mpullback I I' f (mpullback I' I'' g φ) :=
  sorry

/-- **Layer 0.3.** Pullback of a `C^n` form by a `C^(n+1)` map is `C^n`: one derivative is
spent on `mfderiv`. -/
theorem isSmoothForm_mpullback [IsManifold I 1 M] [IsManifold I' 1 M'] [IsManifold I (n + 1) M]
    [IsManifold I' (n + 1) M']
    {f : M → M'} (hf : ContMDiff I I' (n + 1) f) {φ : RoughForm I' M' F k}
    (hφ : IsSmoothForm I' n φ) : IsSmoothForm I n (mpullback I I' f φ) :=
  sorry

theorem isSmoothForm_mpullback_infty [IsManifold I 1 M] [IsManifold I' 1 M'] [IsManifold I ∞ M]
    [IsManifold I' ∞ M'] {f : M → M'} (hf : ContMDiff I I' ∞ f) {φ : RoughForm I' M' F k}
    (hφ : IsSmoothForm I' ∞ φ) : IsSmoothForm I ∞ (mpullback I I' f φ) :=
  sorry

/-- **Layer 0.3.** The pointwise paired wedge of fixed-coefficient rough forms. The pairing
is constant on the base; a varying bundle pairing belongs to the bundle-valued API. -/
noncomputable def RoughForm.wedgeWith
    {F₁ F₂ F₃ : Type*} [NormedAddCommGroup F₁] [NormedSpace ℝ F₁]
    [NormedAddCommGroup F₂] [NormedSpace ℝ F₂] [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃) (φ : RoughForm I M F₁ k) (η : RoughForm I M F₂ l) :
    RoughForm I M F₃ (k + l) :=
  fun x ↦ TauCetiRoadmap.DifferentialGeometry.wedgeWith (E := E) μ (φ x) (η x)

/-- **Layer 0.3.** The bundle-valued product specializes to the fixed-coefficient product.
The continuity witness is automatic for a continuous bilinear map between normed spaces. -/
theorem bundleWedgeWith_trivial
    {F₁ F₂ F₃ : Type*} [NormedAddCommGroup F₁] [NormedSpace ℝ F₁]
    [NormedAddCommGroup F₂] [NormedSpace ℝ F₂] [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃)
    (hμ : ∀ _ : M, Continuous (fun p : F₁ × F₂ ↦ μ p.1 p.2))
    (φ : RoughForm I M F₁ k) (η : RoughForm I M F₂ l) :
    bundleWedgeWith (fun _ ↦ μ) hμ φ η = RoughForm.wedgeWith μ φ η := by
  funext x
  apply ContinuousAlternatingMap.ext
  intro v
  change bundleWedgeWith (fun _ ↦ μ) hμ φ η x v =
    TauCetiRoadmap.DifferentialGeometry.wedgeWith (E := E) μ (φ x) (η x) v
  rw [bundleWedgeWith_apply]
  exact (wedgeWith_apply (E := E) (μ := μ) (φ x) (η x) v).symm

/-- **Layer 0.3.** The pointwise wedge of ℝ-valued rough forms, the multiplication
specialization of `RoughForm.wedgeWith`. -/
noncomputable def RoughForm.wedge (φ : RoughForm I M ℝ k) (η : RoughForm I M ℝ l) :
    RoughForm I M ℝ (k + l) :=
  RoughForm.wedgeWith (ContinuousLinearMap.mul ℝ ℝ) φ η

/-- **Layer 0.3.** Pullback commutes with every fixed continuous bilinear pairing,
including multiplication and a Lie bracket. No differentiability is needed: this is the
pointwise algebraic identity for `compContinuousLinearMap`, even at junk derivatives. -/
theorem mpullback_wedgeWith
    {F₁ F₂ F₃ : Type*} [NormedAddCommGroup F₁] [NormedSpace ℝ F₁]
    [NormedAddCommGroup F₂] [NormedSpace ℝ F₂] [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃) (f : M → M')
    (φ : RoughForm I' M' F₁ k) (η : RoughForm I' M' F₂ l) :
    mpullback I I' f (RoughForm.wedgeWith μ φ η) =
      RoughForm.wedgeWith μ (mpullback I I' f φ) (mpullback I I' f η) := by
  funext x
  exact (wedgeWith_compContinuousLinearMap (E := E') (E' := E)
    (mfderiv I I' f x) (φ (f x)) (η (f x))).symm

/-- **Layer 0.3.** Pullback is a wedge homomorphism, unconditionally (it is pointwise algebra,
`wedgeWith_compContinuousLinearMap`). -/
theorem mpullback_wedge (f : M → M') (φ : RoughForm I' M' ℝ k) (η : RoughForm I' M' ℝ l) :
    mpullback I I' f (φ.wedge η) = (mpullback I I' f φ).wedge (mpullback I I' f η) :=
  mpullback_wedgeWith (ContinuousLinearMap.mul ℝ ℝ) f φ η

/-- **Layer 0.3.** The support of a form, closed by convention. -/
def RoughForm.tsupport (φ : RoughForm I M F k) : Set M :=
  closure {x | φ x ≠ 0}

/-- **Layer 0.3.** The `0`-form of a function. -/
noncomputable def RoughForm.ofFunction (I : ModelWithCorners ℝ E H) (f : M → F) :
    RoughForm I M F 0 :=
  fun x ↦ ContinuousAlternatingMap.constOfIsEmpty ℝ (TangentSpace I x) (Fin 0) (f x)

/-- **Layer 0.3.** Restriction to an open subset is pullback along the inclusion. -/
noncomputable def RoughForm.restrict (U : TopologicalSpace.Opens M) (φ : RoughForm I M F k) :
    RoughForm I U F k :=
  mpullback I I (Subtype.val : U → M) φ

/-- **Layer 0.3.** The interior product `ι_V φ` of a vector field and a form, pointwise
`ContinuousAlternatingMap.curryLeft`. -/
noncomputable def RoughForm.interior (V : (x : M) → TangentSpace I x)
    (φ : RoughForm I M F (k + 1)) : RoughForm I M F k :=
  fun x ↦ ContinuousAlternatingMap.curryLeft (𝕜 := ℝ) (E := E) (F := F) (φ x) (V x)

/-- **Layer 0.4.** The bundled `C^∞` forms, as the submodule of rough forms cut out by
`IsSmoothForm I ∞`. The submodule is pinned by `mem_smoothForms`. -/
def smoothForms (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M] [ChartedSpace H M]
    [IsManifold I 1 M] (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] (k : ℕ) :
    Submodule ℝ (RoughForm I M F k) :=
  smoothBundleForms I F (Trivial M F) k

theorem mem_smoothForms [IsManifold I 1 M] {φ : RoughForm I M F k} :
    φ ∈ smoothForms I M F k ↔ IsSmoothForm I ∞ φ :=
  Iff.rfl

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

/-- **Layer 0.4.** Smoothness of the scalar wedge, specialized from the paired wedge. -/
theorem smoothForms_wedge_mem [IsManifold I 1 M] [IsManifold I ∞ M] (φ : SmoothForm I M ℝ k)
    (η : SmoothForm I M ℝ l) : (φ : RoughForm I M ℝ k).wedge η ∈ smoothForms I M ℝ (k + l) :=
  smoothForms_wedgeWith_mem (ContinuousLinearMap.mul ℝ ℝ) φ η

/-- **Layer 0.4, acceptance.** Over the model `𝓘(ℝ, E)` the manifold pullback is the flat
pullback along `fderiv`, as a lemma, not by defeq. -/
theorem mpullback_eq_flat {E₁ E₂ : Type*} [NormedAddCommGroup E₁] [NormedSpace ℝ E₁]
    [NormedAddCommGroup E₂] [NormedSpace ℝ E₂] {f : E₁ → E₂}
    (φ : RoughForm 𝓘(ℝ, E₂) E₂ F k) {x : E₁} (hf : DifferentiableAt ℝ f x) :
    mpullback 𝓘(ℝ, E₁) 𝓘(ℝ, E₂) f φ x = (φ (f x)).compContinuousLinearMap (fderiv ℝ f x) :=
  sorry

end Forms

/-! ## Layer 1: the exterior derivative and its naturality -/

section ExtDerivFlat

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **Layer 1.3, the new flat lemma, at finite regularity.** The exterior derivative of a
`C^(n+1)` form is `C^n` on the same set — in successor form, so that no zero-regularity branch
is needed and `n = ∞` is the smooth case. Stated `Within` so it applies on `Set.range I` of a
model with corners; this is what lets `d` map `Ω^k` to `Ω^(k+1)`. -/
theorem contDiffOn_extDerivWithin_succ {n : WithTop ℕ∞} {k : ℕ} {φ : E → E [⋀^Fin k]→L[ℝ] F}
    {s : Set E} (hs : UniqueDiffOn ℝ s) (hφ : ContDiffOn ℝ (n + 1) φ s) :
    ContDiffOn ℝ n (extDerivWithin φ s) s :=
  sorry

end ExtDerivFlat

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

/-- **Layer 1.1.** Over the model space the manifold derivative is the flat one. -/
theorem mextDeriv_eq_extDeriv (φ : RoughForm 𝓘(ℝ, E) E F k) (x : E) :
    mextDeriv φ x = extDeriv φ x :=
  sorry

/-- **Layer 1.1.** `d` of a `0`-form is `mfderiv` (that is, `mvfderiv`). -/
theorem mextDeriv_ofFunction (f : M → F) (x : M) (v : TangentSpace I x) :
    mextDeriv (RoughForm.ofFunction I f) x ![v] = (id (mfderiv I 𝓘(ℝ, F) f x v) : F) :=
  sorry

theorem mextDeriv_add [IsManifold I 1 M] {φ η : RoughForm I M F k} (hφ : IsSmoothForm I 1 φ)
    (hη : IsSmoothForm I 1 η) : mextDeriv (φ + η) = mextDeriv φ + mextDeriv η :=
  sorry

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

/-- **Layer 1.3.** Preservation of regularity, the manifold transfer of
`contDiffOn_extDerivWithin_succ`: on a `C^(n+2)` manifold, `d` takes `C^(n+1)` forms to `C^n`
forms. -/
theorem isSmoothForm_mextDeriv [IsManifold I 1 M] [IsManifold I (n + 2) M] {φ : RoughForm I M F k}
    (hφ : IsSmoothForm I (n + 1) φ) : IsSmoothForm I n (mextDeriv φ) :=
  sorry

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

/-- **Layer 1.4.** The scalar Leibniz rule, specialized from `mextDeriv_wedgeWith`. -/
theorem mextDeriv_wedge [IsManifold I 1 M] {φ : RoughForm I M ℝ k} {η : RoughForm I M ℝ l}
    (hφ : IsSmoothForm I 1 φ) (hη : IsSmoothForm I 1 η) (x : M)
    (v : Fin (k + l + 1) → TangentSpace I x) :
    mextDeriv (φ.wedge η) x v =
      (mextDeriv φ).wedge η x (v ∘ Fin.cast (show k + 1 + l = k + l + 1 by omega)) +
        (-1 : ℝ) ^ k • φ.wedge (mextDeriv η) x
          (v ∘ Fin.cast (show k + (l + 1) = k + l + 1 by omega)) :=
  mextDeriv_wedgeWith (ContinuousLinearMap.mul ℝ ℝ) hφ hη x v

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
  toFun φ := ⟨mextDeriv φ, mem_smoothForms.2 (isSmoothForm_mextDeriv_infty (mem_smoothForms.1 φ.2))⟩
  map_add' φ η := Subtype.ext (mextDeriv_add
    (ContMDiff.of_le (mem_smoothForms.1 φ.2) (WithTop.coe_le_coe.2 le_top))
    (ContMDiff.of_le (mem_smoothForms.1 η.2) (WithTop.coe_le_coe.2 le_top)))
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
  {ι : Type*} [Fintype ι] [DecidableEq ι] {n : WithTop ℕ∞}

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

open Classical in
/-- The chart sign as a total function, for statements that range over a whole chart target:
`l.sign x` on the source of the chart at `x`, the junk value `1` off it. Only `sign` is data; the
quotient below never sees these junk values. -/
noncomputable def OrientationLift.signAt [FiniteDimensional ℝ E] (l : OrientationLift I M ι)
    (x y : M) : ℤˣ :=
  if hy : y ∈ (chartAt H x).source then l.sign x ⟨y, hy⟩ else 1

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

theorem orientationAt_neg (o : Manifold.Orientation I M ι) (x : M) :
    orientationAt o.neg x = -orientationAt o x :=
  sorry

/-- **Layer 2.1, extensionality.** An orientation is determined by its tangent orientations. -/
theorem Manifold.Orientation.ext {o o' : Manifold.Orientation I M ι}
    (h : ∀ x, orientationAt o x = orientationAt o' x) : o = o' :=
  sorry

/-- **Layer 2.1.** On a preconnected manifold there are at most two orientations. -/
theorem Manifold.Orientation.eq_or_eq_neg [PreconnectedSpace M]
    (o o' : Manifold.Orientation I M ι) : o' = o ∨ o' = o.neg :=
  sorry

theorem Manifold.Orientation.neg_ne [Nonempty M] (o : Manifold.Orientation I M ι) : o.neg ≠ o :=
  sorry

variable (I M) in
/-- **Layer 2.1.** Orientability, with the canonical index type `Fin (finrank ℝ E)`. -/
def Orientable : Prop :=
  Nonempty (Manifold.Orientation I M (Fin (Module.finrank ℝ E)))

/-- **Layer 2.2.** A map is orientation-preserving at `x` when its differential is invertible
there and carries `orientationAt o x` to `orientationAt o' (f x)`; orientation-reversing when
it carries it to the negative. -/
def IsOrientationPreservingAt [FiniteDimensional ℝ E'] (o : Manifold.Orientation I M ι)
    (o' : Manifold.Orientation I' M' ι) (f : M → M') (x : M) : Prop :=
  ∃ e : TangentSpace I x ≃L[ℝ] TangentSpace I' (f x),
    (e : TangentSpace I x →L[ℝ] TangentSpace I' (f x)) = mfderiv I I' f x ∧
      Orientation.map ι e.toLinearEquiv (orientationAt o x) = orientationAt o' (f x)

def IsOrientationReversingAt [FiniteDimensional ℝ E'] (o : Manifold.Orientation I M ι)
    (o' : Manifold.Orientation I' M' ι) (f : M → M') (x : M) : Prop :=
  ∃ e : TangentSpace I x ≃L[ℝ] TangentSpace I' (f x),
    (e : TangentSpace I x →L[ℝ] TangentSpace I' (f x)) = mfderiv I I' f x ∧
      Orientation.map ι e.toLinearEquiv (orientationAt o x) = -orientationAt o' (f x)

/-- **Layer 2.2, the pullback orientation** [Lee, Prop. 15.15]: along a local diffeomorphism
there is an orientation of the source making `f` orientation-preserving everywhere. -/
theorem exists_isOrientationPreservingAt_pullback [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) :
    ∃ o : Manifold.Orientation I M ι, ∀ x, IsOrientationPreservingAt o o' f x :=
  sorry

/-- **Layer 2.2.** The pullback orientation along a local diffeomorphism, characterized by making
`f` orientation-preserving everywhere; the characterization determines it, since an orientation
is determined by `orientationAt`. -/
noncomputable def Manifold.Orientation.pullback [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) : Manifold.Orientation I M ι :=
  Classical.choose (exists_isOrientationPreservingAt_pullback hf hn o')

theorem isOrientationPreservingAt_pullback [FiniteDimensional ℝ E'] [IsManifold I n M]
    [IsManifold I' n M'] {f : M → M'} (hf : IsLocalDiffeomorph I I' n f) (hn : 1 ≤ n)
    (o' : Manifold.Orientation I' M' ι) (x : M) :
    IsOrientationPreservingAt (o'.pullback hf hn) o' f x :=
  Classical.choose_spec (exists_isOrientationPreservingAt_pullback hf hn o') x

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

/-- **Layer 2.2.** The consistently-oriented-atlas criterion is a *theorem* for boundaryless
manifolds [Lee, Prop. 15.6] — and, per *Statements that must not enter*, false as a
definition once boundaries are allowed. -/
theorem orientable_iff_exists_atlas [BoundarylessManifold I M] [IsManifold I 1 M] :
    Orientable I M ↔ ∃ 𝒜 ⊆ IsManifold.maximalAtlas I 1 M, (⋃ e ∈ 𝒜, e.source) = univ ∧
      ∀ e ∈ 𝒜, ∀ e' ∈ 𝒜, ∀ y ∈ (e.symm ≫ₕ e').source,
        0 < LinearMap.det (fderiv ℝ (I ∘ (e.symm ≫ₕ e') ∘ I.symm) (I y) : E →ₗ[ℝ] E) :=
  sorry

end Orientation

section SmoothCover

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {J : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N]
  {X : Type*} [TopologicalSpace X] {n : WithTop ℕ∞}

end SmoothCover

section Involution

variable {E H X : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace X] [ChartedSpace H X] [IsManifold I 1 X]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

/-- **Layer 2.4, the descent API, general form.** For an involution `τ` of a manifold, the
invariant and anti-invariant parts of a form under `τ^*`, the averaging projectors
`(1 + τ^*)/2` and `(1 − τ^*)/2`. -/
noncomputable def invariantPart (τ : X → X) (φ : RoughForm I X F k) : RoughForm I X F k :=
  (2⁻¹ : ℝ) • (φ + mpullback I I τ φ)

noncomputable def antiInvariantPart (τ : X → X) (φ : RoughForm I X F k) : RoughForm I X F k :=
  (2⁻¹ : ℝ) • (φ - mpullback I I τ φ)

theorem invariantPart_add_antiInvariantPart (τ : X → X) (φ : RoughForm I X F k) :
    invariantPart τ φ + antiInvariantPart τ φ = φ :=
  sorry

/-- The projectors commute with `d` (for `C¹` forms and a `C²` involution), and preserve
compact support. -/
theorem mextDeriv_invariantPart [IsManifold I 2 X] {τ : X → X} (hτ : ContMDiff I I 2 τ)
    {φ : RoughForm I X F k} (hφ : IsSmoothForm I 1 φ) :
    mextDeriv (invariantPart τ φ) = invariantPart τ (mextDeriv φ) :=
  sorry

theorem isCompact_tsupport_invariantPart {τ : X → X} (hτ : IsProperMap τ) {φ : RoughForm I X F k}
    (hφ : IsCompact φ.tsupport) : IsCompact (invariantPart τ φ).tsupport :=
  sorry

end Involution

section OrientationCover

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [FiniteDimensional ℝ E] {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {k : ℕ}

variable (I M) in
/-- **Layer 2.4.** The orientation double cover: pairs of a point and an orientation of its
tangent space. ⚠ Its topology is *not* the sigma topology (see *Statements that must not
enter*): it is the one induced by chart trivializations, a README 2.4 target together with the
covering property of `proj`. -/
@[expose]
def OrientationCover : Type _ :=
  (x : M) × Orientation ℝ (TangentSpace I x) (Fin (Module.finrank ℝ E))

namespace OrientationCover

variable (I M) in
/-- The two-sheeted projection. -/
def proj : OrientationCover I M → M := Sigma.fst

variable (I M) in
/-- The deck involution: flip the orientation, fix the point. -/
noncomputable def deck : OrientationCover I M ≃ OrientationCover I M where
  toFun p := ⟨p.1, -p.2⟩
  invFun p := ⟨p.1, -p.2⟩
  left_inv := fun ⟨x, o⟩ ↦ congrArg (Sigma.mk x) (neg_neg o)
  right_inv := fun ⟨x, o⟩ ↦ congrArg (Sigma.mk x) (neg_neg o)

theorem deck_ne_self (p : OrientationCover I M) : deck I M p ≠ p :=
  sorry

/-- **Layer 2.4** [Lee, Thm. 15.43]: if `π₁(M, x)` has no subgroup of index `2`, `M` is
orientable; in particular simply connected manifolds are orientable. Consumes Tau Ceti's
covering-space classification. -/
theorem orientable_of_forall_index_ne_two [IsManifold I 1 M] [T2Space M] [ConnectedSpace M]
    [LocallyPathConnectedSpace M] (x : M)
    (h : ∀ K : Subgroup (FundamentalGroup M x), K.index ≠ 2) : Orientable I M :=
  sorry

theorem orientable_of_simplyConnectedSpace [IsManifold I 1 M] [T2Space M]
    [SimplyConnectedSpace M] [LocallyPathConnectedSpace M] : Orientable I M :=
  sorry

end OrientationCover

end OrientationCover

/-! ## Layer 3: flows -/

section FlatFlow

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- **Layer 3.1, smooth dependence on initial conditions, flat and Banach-general.** A field
which is `C^(n+1)` near `a` has a local flow which is `C^(n+1)` jointly in time and initial
condition near `(a, 0)`, obeys the flow law, and solves the equation nearby. Tau Ceti has the
finite-dimensional case, `ODE.exists_contDiffAt_localFlow`, consumed as
`exists_contDiffAt_localFlow_of_finiteDimensional` below; the Banach case is the target. -/
theorem exists_contDiffAt_localFlow_of_completeSpace [CompleteSpace E] {n : ℕ∞} (v : E → E) {a : E}
    {s : Set E} (hv : ContDiffOn ℝ (n + 1) v s) (hs : s ∈ 𝓝 a) :
    ∃ Φ : E → ℝ → E, ContDiffAt ℝ (n + 1) (fun p : E × ℝ ↦ Φ p.1 p.2) (a, 0) ∧
      (∀ x, Φ x 0 = x) ∧ (∀ x t u, Φ x (t + u) = Φ (Φ x t) u) ∧
      ∀ᶠ p in 𝓝 ((a, 0) : E × ℝ), HasDerivAt (Φ p.1) (v (Φ p.1 p.2)) p.2 :=
  sorry

/-- The finite-dimensional case is already in Tau Ceti. -/
theorem exists_contDiffAt_localFlow_of_finiteDimensional [FiniteDimensional ℝ E] {n : ℕ∞}
    (v : E → E) {a : E} {s : Set E} (hv : ContDiffOn ℝ (n + 1) v s) (hs : s ∈ 𝓝 a) :
    ∃ Φ : E → ℝ → E, ContDiffAt ℝ (n + 1) (fun p : E × ℝ ↦ Φ p.1 p.2) (a, 0) ∧
      (∀ x, Φ x 0 = x) ∧ (∀ x t u, Φ x (t + u) = Φ (Φ x t) u) ∧
      ∀ᶠ p in 𝓝 ((a, 0) : E × ℝ), HasDerivAt (Φ p.1) (v (Φ p.1 p.2)) p.2 :=
  ODE.exists_contDiffAt_localFlow v hv hs

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

omit [CompleteSpace E] in
/-- The flow curve through `x` is an integral curve on its interval of existence (already Tau
Ceti's `isMIntegralCurveOn_maximalIntegralCurve`). -/
theorem isMIntegralCurveOn_flowOf [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) (x : M) :
    IsMIntegralCurveOn (fun t ↦ flowOf v t x) v {t | (t, x) ∈ flowDomain v} := by
  simpa [flowDomain, flowOf] using
    (isMIntegralCurveOn_maximalIntegralCurve (x := x) hv)

omit [T2Space M] in
theorem mem_flowDomain_zero [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) (x : M) :
    ((0 : ℝ), x) ∈ flowDomain v := by
  simpa [flowDomain] using
    (zero_mem_maximalIntegralCurveInterval (x := x) hv.contMDiffAt)

omit [T2Space M] in
theorem flowOf_zero [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) (x : M) :
    flowOf v 0 x = x := by
  have h0 : (0 : ℝ) ∈ maximalIntegralCurveInterval v x := by
    simpa [flowDomain] using mem_flowDomain_zero hv x
  exact maximalIntegralCurve_zero h0

omit [CompleteSpace E] in
/-- **Layer 3.2, the fundamental theorem of flows** [Lee, Thm. 9.12], finite-dimensional: the
domain is *jointly* open and the flow jointly `C^n` on it. Tau Ceti's
`isOpen_maximalIntegralCurveFlowDomain` and `contMDiffOn_maximalIntegralCurve`
(`Geometry/Manifold/IntegralCurve/Flow.lean`), discharged in place; the Banach extension below
is the target. -/
theorem isOpen_flowDomain [FiniteDimensional ℝ E] [IsManifold I 1 M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) :
    IsOpen (flowDomain v) :=
  (TauCeti.isOpen_maximalIntegralCurveFlowDomain hv).preimage continuous_swap

omit [CompleteSpace E] in
theorem contMDiffOn_flowOf [FiniteDimensional ℝ E] {n : ℕ∞} (hn : 1 ≤ n) [IsManifold I 1 M]
    [IsManifold I n M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent n (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) :
    ContMDiffOn (𝓘(ℝ, ℝ).prod I) I n (fun p : ℝ × M ↦ flowOf v p.1 p.2) (flowDomain v) :=
  (TauCeti.contMDiffOn_maximalIntegralCurve hn hv).comp
    (contMDiff_snd.prodMk contMDiff_fst).contMDiffOn fun _ hp ↦ hp

/-- **Layer 3.2, the Banach extension of Tau Ceti's maximal-flow API**: joint openness of the
domain and joint smoothness of the maximal flow with `[CompleteSpace E]` in place of
`[FiniteDimensional ℝ E]`. These generalize `TauCeti.isOpen_maximalIntegralCurveFlowDomain` and
`TauCeti.contMDiffOn_maximalIntegralCurve` verbatim; 3.1 is the input. -/
theorem isOpen_maximalIntegralCurveFlowDomain_of_completeSpace [IsManifold I 1 M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) :
    IsOpen (TauCeti.maximalIntegralCurveFlowDomain v) :=
  sorry

theorem contMDiffOn_maximalIntegralCurve_of_completeSpace {n : ℕ∞} (hn : 1 ≤ n)
    [IsManifold I 1 M] [IsManifold I n M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent n (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) :
    ContMDiffOn (I.prod 𝓘(ℝ, ℝ)) I n (fun p : M × ℝ ↦ maximalIntegralCurve v p.1 p.2)
      (TauCeti.maximalIntegralCurveFlowDomain v) :=
  sorry

omit [CompleteSpace E] in
/-- **Layer 3.2, the group law**, with the domain bookkeeping it forces: Tau Ceti's
`maximalIntegralCurve_add` and `mem_maximalIntegralCurveInterval_maximalIntegralCurve_iff`, which
already have this generality, discharged in place. -/
theorem flowOf_add [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {s t : ℝ} {x : M}
    (hs : (s, x) ∈ flowDomain v) (ht : (t, flowOf v s x) ∈ flowDomain v) :
    (s + t, x) ∈ flowDomain v ∧ flowOf v t (flowOf v s x) = flowOf v (s + t) x := by
  have hs' : s ∈ maximalIntegralCurveInterval v x := by
    simpa [flowDomain] using hs
  have ht' : t ∈ maximalIntegralCurveInterval v (maximalIntegralCurve v x s) := by
    simpa [flowDomain, flowOf] using ht
  have hst : s + t ∈ maximalIntegralCurveInterval v x :=
    (TauCeti.mem_maximalIntegralCurveInterval_maximalIntegralCurve_iff hv hs').1 ht'
  exact ⟨by simpa [flowDomain] using hst,
    (TauCeti.maximalIntegralCurve_add hv hs' hst).symm⟩

/-- **Layer 3.2, the escape lemma** [Lee, Lemma 9.19], one-sided: at a finite right endpoint of
the interval of existence the curve eventually leaves every compact set. Tau Ceti's
`eventually_notMem_nhdsLT_maximalIntegralCurve`, discharged in place. -/
theorem eventually_flowOf_notMem [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {x : M} {b : ℝ}
    (hb : IsLUB {t | (t, x) ∈ flowDomain v} b) {K : Set M} (hK : IsCompact K) :
    ∀ᶠ t in 𝓝[<] b, flowOf v t x ∉ K := by
  have h0 : (0 : ℝ) ∈ maximalIntegralCurveInterval v x := by
    simpa [flowDomain] using mem_flowDomain_zero hv x
  have hb' : IsLUB (maximalIntegralCurveInterval v x) b := by
    simpa [flowDomain] using hb
  exact eventually_notMem_nhdsLT_maximalIntegralCurve hv h0 hb' hK

/-- **Layer 3.3.** A vector field is complete when its flow is defined for all time. -/
def IsCompleteVectorField (v : (x : M) → TangentSpace I x) : Prop :=
  flowDomain v = univ

/-- **Layer 3.3.** Compactly supported fields are complete [Lee, Thm. 9.16]. -/
theorem isCompleteVectorField_of_isCompact [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {K : Set M}
    (hK : IsCompact K) (hvK : ∀ x ∉ K, v x = 0) : IsCompleteVectorField v :=
  sorry

/-- **Layer 3.3.** Every `C¹` field on a compact boundaryless manifold is complete: through every
point there is a global integral curve. Discharged by Tau Ceti's
`isMIntegralCurve_maximalIntegralCurve`. -/
theorem exists_isMIntegralCurve_of_compactSpace [IsManifold I 1 M] [CompactSpace M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M)))
    (x₀ : M) :
    ∃ γ : ℝ → M, γ 0 = x₀ ∧ IsMIntegralCurve γ v :=
  ⟨maximalIntegralCurve v x₀, maximalIntegralCurve_zero (zero_mem_maximalIntegralCurveInterval
    hv.contMDiffAt), isMIntegralCurve_maximalIntegralCurve hv⟩

theorem isCompleteVectorField_of_compactSpace [IsManifold I 1 M] [CompactSpace M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M))) :
    IsCompleteVectorField v :=
  sorry

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
    rw [add_comm]
    exact ((flowOf_add hv (hc ▸ mem_univ _) (hc ▸ mem_univ _)).2).symm
  map_zero' := flowOf_zero hv

theorem toFlow_apply [IsManifold I 1 M] {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hc : IsCompleteVectorField v) (t : ℝ) (x : M) : toFlow hv hc t x = flowOf v t x :=
  rfl

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

/-- **Layer 3.4, the flow characterization of the Lie derivative** [Lee, Thm. 9.38]: the
derivative at `t = 0` of the pulled-back field is the bracket. -/
theorem hasDerivAt_mpullback_flowOf [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    {v w : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M)))
    (hw : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, w y⟩ : TangentBundle I M))) (x : M) :
    HasDerivAt (fun t ↦ VectorField.mpullback I I (flowOf v t) w x)
      (VectorField.mlieBracket I v w x) 0 :=
  sorry

/-- **Layer 3.4, the straightening theorem** [Lee, Thm. 9.22], layer 4's base case: near a
point where `v ≠ 0` there is a chart carrying `v` to the constant field `e`. -/
theorem exists_chart_mfderiv_eq_const [FiniteDimensional ℝ E] [IsManifold I 1 M] [IsManifold I ∞ M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, v y⟩ : TangentBundle I M))) {x : M}
    (hx : v x ≠ 0) :
    ∃ (e : OpenPartialHomeomorph M H) (u : E), e ∈ IsManifold.maximalAtlas I ∞ M ∧
      x ∈ e.source ∧ ∀ y ∈ e.source, mfderiv I 𝓘(ℝ, E) (I ∘ e) y (v y) = u :=
  sorry

/-- **Layer 3.3, reconciliation with the Lie-group flows of Tau Ceti.** The flow of a
left-invariant field is Tau Ceti's `mulInvariantIntegralCurve`. -/
theorem flowOf_mulInvariantVectorField {G : Type*} [TopologicalSpace G] [ChartedSpace H G]
    [Group G] [LieGroup I (minSmoothness ℝ 3) G] [IsManifold I 1 G] [T2Space G]
    [BoundarylessManifold I G] (v : GroupLieAlgebra I G) (t : ℝ) (g : G) :
    flowOf (mulInvariantVectorField v) t g = mulInvariantIntegralCurve v g t :=
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

/-! ## Layer 3.6: inward fields and domination through the intrinsic interior -/

section InwardGeometry

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  (M : Type*) [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Layer3.6 uses the native intrinsic interior with its open-submanifold atlas. -/
def smoothInteriorOpen : TopologicalSpace.Opens M :=
  ⟨I.interior M, I.isOpen_interior (n := ∞) (by simp)⟩

/-- **Layer3.6.** The intrinsic interior inherits a boundaryless atlas. -/
instance smoothInterior_boundaryless : BoundarylessManifold I (smoothInteriorOpen I M) :=
  ⟨fun x => I.isInteriorPoint_iff_isInteriorPoint_val.mpr (show I.IsInteriorPoint (x : M) from x.property)⟩

/-- **Layer3.6.** Every open submanifold is sigma-compact under the charted
local compactness/countability hypotheses. The model carrier H is explicit. -/
theorem sigmaCompactSpace_open_of_charted (H : Type*) [TopologicalSpace H]
    [SecondCountableTopology H] [LocallyCompactSpace H]
    {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [SigmaCompactSpace M]
    (U : TopologicalSpace.Opens M) : SigmaCompactSpace U := by
  let : SecondCountableTopology M := ChartedSpace.secondCountable_of_sigmaCompact H M
  let : LocallyCompactSpace M := ChartedSpace.locallyCompactSpace H M
  let : LocallyCompactSpace U := U.isOpen.locallyCompactSpace
  infer_instance

/-- **Layer3.6.** The interior instance needs no Hausdorff hypothesis. -/
instance smoothInterior_sigmaCompact [SigmaCompactSpace M] [FiniteDimensional ℝ E] :
    SigmaCompactSpace (smoothInteriorOpen I M) := by
  let : SecondCountableTopology H := I.secondCountableTopology
  let : LocallyCompactSpace H := I.locallyCompactSpace
  exact sigmaCompactSpace_open_of_charted H (smoothInteriorOpen I M)

/-- **Layer3.6.** Actual smooth maps and homotopy equations for inward domination. -/
structure InwardDomination where
  retract : M → smoothInteriorOpen I M
  homotopy : ℝ × M → M
  smooth_retract : ContMDiff I I ∞ retract
  smooth_homotopy : ContMDiff ((𝓘(ℝ, ℝ)).prod I) I ∞ homotopy
  at_zero : ∀ x, homotopy (0,x) = (retract x : M)
  at_one : ∀ x, homotopy (1,x) = x
  preserves_interior : ∀ t x, I.IsInteriorPoint x → I.IsInteriorPoint (homotopy (t,x))

end InwardGeometry

section NonautonomousFlows
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [CompleteSpace E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [BoundarylessManifold I M] [T2Space M]

/-- The autonomous suspension on the actual open time slab. -/
def suspendedTimeField (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x) (p : ↥J × M) :
    TangentSpace ((𝓘(ℝ, ℝ)).prod I) p := (1, v p.1 p.2)

/-- Maximal two-time domain, ordered as (target time, initial time, initial point).
This is the existing autonomous domain adapter, including its connected-time component. -/
def timeDependentFlowDomain (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x) : Set (↥J × (↥J × M)) :=
  {p | ((p.1 : ℝ) - (p.2.1 : ℝ), (p.2.1, p.2.2)) ∈
    flowDomain (suspendedTimeField J v)}

/-- Suspension's spatial projection; values outside the maximal domain are junk. -/
noncomputable def timeDependentFlow (J : TopologicalSpace.Opens ℝ)
    (v : ↥J → (x : M) → TangentSpace I x) (t s : ↥J) (x : M) : M :=
  (flowOf (suspendedTimeField J v) ((t : ℝ) - (s : ℝ)) (s, x)).2

/-- DG3.5 finite-dimensional openness is an adapter of the native autonomous
maximal-flow theorem on the suspension, independent of the Banach extension. -/
theorem isOpen_timeDependentFlowDomain_of_finiteDimensional [FiniteDimensional ℝ E]
    (J : TopologicalSpace.Opens ℝ) (v : ↥J → (x : M) → TangentSpace I x)
    (hv : ContMDiff ((𝓘(ℝ, ℝ)).prod I) I.tangent ∞
      (fun p : ↥J × M => (⟨p.2, v p.1 p.2⟩ : TangentBundle I M))) :
    IsOpen (timeDependentFlowDomain J v) := by
  sorry

/-- DG3.5 finite-dimensional joint regularity uses the native autonomous flow on
`↥J × M`; no 3.1/3.2 Banach smooth-dependence theorem is a prerequisite. -/
theorem contMDiffOn_timeDependentFlow_of_finiteDimensional [FiniteDimensional ℝ E]
    (J : TopologicalSpace.Opens ℝ) (v : ↥J → (x : M) → TangentSpace I x)
    (hv : ContMDiff ((𝓘(ℝ, ℝ)).prod I) I.tangent ∞
      (fun p : ↥J × M => (⟨p.2, v p.1 p.2⟩ : TangentBundle I M))) :
    ContMDiffOn ((𝓘(ℝ, ℝ)).prod ((𝓘(ℝ, ℝ)).prod I)) I ∞
      (fun p : ↥J × (↥J × M) => timeDependentFlow J v p.1 p.2.1 p.2.2)
      (timeDependentFlowDomain J v) := by
  sorry

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

/-- On a compact manifold every pair of times in an open interval is admissible. -/
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

/-- Layer 4 signature adapter at the roadmap's dependency pin.
The production data are the existing tangent-subspace family with
`TauCeti.IsContMDiffDistribution`; this is not a second library target.
The rank and spanning fields below express its local-frame condition. -/
structure Distribution (I : ModelWithCorners ℝ E H) (M : Type u)
    [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]
    [FiniteDimensional ℝ E] (n : WithTop ℕ∞) (k : ℕ) where
  fiber : (x : M) → Submodule ℝ (TangentSpace I x)
  finrank_fiber : ∀ x, Module.finrank ℝ (fiber x) = k
  exists_localFrame : ∀ x : M,
    ∃ (U : Set M) (V : Fin k → (y : M) → TangentSpace I y),
      IsOpen U ∧ x ∈ U ∧
        (∀ i, ContMDiffOn I I.tangent n
          (fun y ↦ (⟨y, V i y⟩ : TangentBundle I M)) U) ∧
        ∀ y ∈ U, fiber y = Submodule.span ℝ (range fun i ↦ V i y)

namespace Distribution

variable (D : Distribution I M n k)

/-- Pinned signature expansion of
`TauCeti.IsInvolutiveDistribution I D.fiber`.
The production interface is that existing predicate. Differentiability
is required on the open set where the fields are tangent to `D`;
neither mere continuity nor a global-section-only test is used. -/
def IsInvolutive : Prop :=
  ∀ ⦃U : Set M⦄, IsOpen U →
    ∀ ⦃V W : (x : M) → TangentSpace I x⦄,
      MDifferentiableOn I I.tangent
        (fun y ↦ (⟨y, V y⟩ : TangentBundle I M)) U →
      MDifferentiableOn I I.tangent
        (fun y ↦ (⟨y, W y⟩ : TangentBundle I M)) U →
      (∀ x ∈ U, V x ∈ D.fiber x) →
      (∀ x ∈ U, W x ∈ D.fiber x) →
      ∀ x ∈ U, VectorField.mlieBracket I V W x ∈ D.fiber x

/-- A parametrized integral immersion, with its own manifold carrier.
Its differential image is equal to the distribution fiber.
Injectivity and second countability are separate hypotheses where needed. -/
structure IntegralManifold where
  carrier : Type u
  [topologicalSpace : TopologicalSpace carrier]
  [chartedSpace : ChartedSpace (EuclideanSpace ℝ (Fin k)) carrier]
  [isManifold : IsManifold (𝓡 k) n carrier]
  inclusion : carrier → M
  isImmersion : Manifold.IsImmersion (𝓡 k) I n inclusion
  range_mfderiv : ∀ y,
    LinearMap.range (mfderiv (𝓡 k) I inclusion y).toLinearMap =
      D.fiber (inclusion y)

attribute [instance] IntegralManifold.topologicalSpace
  IntegralManifold.chartedSpace IntegralManifold.isManifold

/-- The unbundled integral-immersion predicate. -/
def IsIntegralManifold {N : Type*} [TopologicalSpace N]
    [ChartedSpace (EuclideanSpace ℝ (Fin k)) N]
    [IsManifold (𝓡 k) n N] (ι : N → M) : Prop :=
  Manifold.IsImmersion (𝓡 k) I n ι ∧
    ∀ y, LinearMap.range (mfderiv (𝓡 k) I ι y).toLinearMap =
      D.fiber (ι y)

/-- Integrability implies local involutivity in the smooth setting.
There is intentionally no merely continuous specialization. -/
theorem isInvolutive_of_forall_exists_integralManifold
    [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    (D : Distribution I M ∞ k)
    (h : ∀ x : M, ∃ N : D.IntegralManifold,
      x ∈ range N.inclusion) : D.IsInvolutive :=
  sorry

/-- The global annihilating-one-form characterization of local involutivity.
Hausdorffness supplies the local bump extensions used in this formulation. -/
theorem isInvolutive_iff_forall_mextDeriv
    [IsManifold I ∞ M] [T2Space M] (D : Distribution I M ∞ k) :
    D.IsInvolutive ↔ ∀ η : RoughForm I M ℝ 1,
      IsSmoothForm I ∞ η →
      (∀ x, ∀ v ∈ D.fiber x, η x ![v] = 0) →
      ∀ x, ∀ v ∈ D.fiber x, ∀ w ∈ D.fiber x,
        mextDeriv η x ![v, w] = 0 :=
  sorry

/-- Local Frobenius: a flat chart for a smooth involutive distribution.
Extend the existing graph-coordinate Frobenius API. -/
theorem exists_flatChart [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M]
    (D : Distribution I M ∞ k) (hD : D.IsInvolutive) (x : M) :
    ∃ (e : OpenPartialHomeomorph M H) (W : Submodule ℝ E),
      e ∈ IsManifold.maximalAtlas I ∞ M ∧ x ∈ e.source ∧
      Module.finrank ℝ W = k ∧
      ∀ y ∈ e.source,
        Submodule.map (mfderiv I 𝓘(ℝ, E) (I ∘ e) y).toLinearMap
          (D.fiber y) = W :=
  sorry

/-- A local integral slice, using Tau Ceti's existing slice-chart interface. -/
theorem exists_isSliceChart_integralManifold
    [IsManifold I ∞ M] [BoundarylessManifold I M] [T2Space M]
    (D : Distribution I M ∞ k) (hD : D.IsInvolutive) (x : M) :
    ∃ (N : D.IntegralManifold) (e : OpenPartialHomeomorph M E)
      (S : Set E), x ∈ range N.inclusion ∧ x ∈ e.source ∧
      TauCeti.IsSliceChart e S (range N.inclusion) :=
  sorry

/-- Weak embeddedness for an injectively immersed integral submanifold
with second-countable carrier. The source is an ordinary finite-dimensional
smooth Hausdorff second-countable boundaryless manifold. -/
theorem exists_contMDiff_factor [IsManifold I ∞ M]
    [BoundarylessManifold I M] [T2Space M]
    (D : Distribution I M ∞ k) (hD : D.IsInvolutive)
    (N : D.IntegralManifold) (hinj : Function.Injective N.inclusion)
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

end Distribution

end Frobenius

/-! ## Layer 5: integration on manifolds and Stokes' theorem -/

section NullSet

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]

/-- **Layers 5.1 and 10.2.** Null sets of a manifold, read through charts: a set whose image in
every extended chart is null for Haar measure on the model. Well defined without any measurable
structure on `M`; the Borel structure of the model is a hypothesis. -/
def IsNullSet (I : ModelWithCorners ℝ E H) [MeasurableSpace E] [BorelSpace E] (s : Set M) : Prop :=
  ∀ x : M, ∀ (μ : MeasureTheory.Measure E) [μ.IsAddHaarMeasure],
    μ (extChartAt I x '' (s ∩ (extChartAt I x).source)) = 0

end NullSet

section Boundary

variable {n : ℕ} {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanHalfSpace (n + 1)) M]
  [IsManifold (𝓡∂ (n + 1)) 1 M] {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] {j : ℕ}

/-- **Layer 5.1, the boundary interface, over the half-space model.** The boundary manifold is Tau
Ceti's (`TauCeti.boundaryChartedSpace`, `TauCeti.isManifold_boundary`,
`TauCeti.isSmoothEmbedding_subtypeVal_boundary`); restriction of forms to it is pullback along
the inclusion. -/
noncomputable def boundaryRestriction (φ : RoughForm (𝓡∂ (n + 1)) M F j) :
    RoughForm 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ((𝓡∂ (n + 1)).boundary M) F j :=
  mpullback 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val φ

/-- Restriction commutes with `d`, and preserves smoothness, on the consumed boundary manifold. -/
theorem boundaryRestriction_mextDeriv [IsManifold (𝓡∂ (n + 1)) 2 M]
    {φ : RoughForm (𝓡∂ (n + 1)) M F j} (hφ : IsSmoothForm (𝓡∂ (n + 1)) 1 φ) :
    boundaryRestriction (mextDeriv φ) = mextDeriv (boundaryRestriction φ) :=
  sorry

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

/-- **Layer 5.1.** The boundary is a null set, in the form 5.2's well-definedness needs. -/
theorem isNullSet_boundary : IsNullSet (𝓡∂ (n + 1)) ((𝓡∂ (n + 1)).boundary M) :=
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

/-- Densities are scaled pointwise. -/
instance {V : Type*} [AddCommGroup V] [Module ℝ V] {m : ℕ} : SMul ℝ (Density V m) :=
  ⟨fun c μ ↦ ⟨fun v ↦ c * μ.toFun v, fun T v ↦ by rw [μ.map_comp]; ring⟩⟩

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M]
  [ChartedSpace H M] {m : ℕ}

/-- **Layer 5.5a.** Rough densities on a manifold. -/
abbrev RoughDensity (I : ModelWithCorners ℝ E H) (M : Type*) [TopologicalSpace M]
    [ChartedSpace H M] (m : ℕ) : Type _ :=
  (x : M) → Density (TangentSpace I x) m

end Densities

section Gates

/-- **Layer 5.5a, acceptance: the angular form.** The flat form `x dy − y dx` on `ℂ = ℝ²`, and its
pullback `dθ` to the circle along the inclusion. -/
noncomputable def planeAngularForm : RoughForm 𝓘(ℝ, ℂ) ℂ ℝ 1 :=
  fun z ↦ ContinuousAlternatingMap.ofSubsingleton ℝ ℂ ℝ (0 : Fin 1)
    (z.re • Complex.imCLM - z.im • Complex.reCLM)

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

These statements fix the AC specialization, its coordinates and its integration
conventions using existing APIs. `TauCeti.Contour.windingNumber` is imported directly;
there is no replacement index. The directional region and boundary-chain statements of
5.6.2 remain requirements of the markdown.
-/

namespace Green

noncomputable section

open MeasureTheory Set
open scoped Classical

/-- Curl of `P dx + Q dy`, using real derivatives and the positive basis `(1, I)`. -/
def curl (P Q : ℂ → ℝ) (z : ℂ) : ℝ :=
  fderiv ℝ Q z (1 : ℂ) - fderiv ℝ P z Complex.I

/-- The boundary integrand; its integral is the existing `intervalIntegral`. -/
def circulationFun (P Q : ℂ → ℝ) (γ : ℝ → ℂ) (t : ℝ) : ℝ :=
  P (γ t) * (deriv γ t).re + Q (γ t) * (deriv γ t).im

/-- The real linear 1-form accepted by Mathlib's `curveIntegral`. -/
def oneForm (P Q : ℂ → ℝ) (z : ℂ) : ℂ →L[ℝ] ℝ :=
  (P z) • Complex.reCLM + (Q z) • Complex.imCLM

/-- On the trace the area weight is zero, independently of the principal-value index there. -/
def windingWeight (γ : ℝ → ℂ) (a b : ℝ) (z : ℂ) : ℝ :=
  if z ∈ γ '' uIcc a b then 0 else (TauCeti.Contour.windingNumber γ a b z).re

/-- An ordinary interval in the existing one-dimensional gauge-integral API. -/
def intervalBox (a b : ℝ) (hab : a < b) : BoxIntegral.Box (Fin 1) :=
  ⟨fun _ ↦ a, fun _ ↦ b, fun _ ↦ hab⟩

/-- The one-dimensional coincidence needed to consume Mathlib's `GP` FTC. -/
theorem hasIntegral_GP_iff_Henstock_fin_one (B : BoxIntegral.Box (Fin 1))
    (f : (Fin 1 → ℝ) → ℝ) (r : ℝ) :
    BoxIntegral.HasIntegral B BoxIntegral.IntegrationParams.GP f
        (volume : Measure (Fin 1 → ℝ)).toBoxAdditive.toSMul r ↔
      BoxIntegral.HasIntegral B BoxIntegral.IntegrationParams.Henstock f
        (volume : Measure (Fin 1 → ℝ)).toBoxAdditive.toSMul r :=
  sorry

/-- The countable-exception FTC retains conditional integrability at exceptional points. -/
theorem hasIntegral_Henstock_deriv {f f' : ℝ → ℝ} {a b : ℝ} (hab : a < b)
    (hf : ContinuousOn f (uIcc a b)) (S : Set ℝ) (hS : S.Countable)
    (hderiv : ∀ t ∈ Ioo a b \ S, HasDerivAt f (f' t) t) :
    BoxIntegral.HasIntegral (intervalBox a b hab) BoxIntegral.IntegrationParams.Henstock
      (fun t : Fin 1 → ℝ ↦ f' (t 0))
      (volume : Measure (Fin 1 → ℝ)).toBoxAdditive.toSMul (f b - f a) :=
  sorry

/-- The gauge value agrees with `intervalIntegral` when the integrand is Bochner integrable. -/
theorem Henstock_eq_intervalIntegral {f : ℝ → ℝ} {a b r : ℝ} (hab : a < b)
    (hf : IntervalIntegrable f volume a b)
    (hHK : BoxIntegral.HasIntegral (intervalBox a b hab) BoxIntegral.IntegrationParams.Henstock
      (fun t : Fin 1 → ℝ ↦ f (t 0))
      (volume : Measure (Fin 1 → ℝ)).toBoxAdditive.toSMul r) :
    (∫ t in a..b, f t) = r :=
  sorry

/-- Existing contour cycles use this stronger regularity, which supplies absolute continuity. -/
theorem absolutelyContinuousOnInterval_of_piecewiseC1 {γ : ℝ → ℂ} {a b : ℝ}
    (hγ : TauCeti.Contour.IsPiecewiseC1On γ a b) :
    AbsolutelyContinuousOnInterval γ a b :=
  sorry

/-- The `Path` and raw-function forms use the same existing curve integral. -/
theorem curveIntegral_oneForm_eq {p q : ℂ} (γ : Path p q) (P Q : ℂ → ℝ) :
    curveIntegral (oneForm P Q) γ = ∫ t in (0 : ℝ)..1, circulationFun P Q γ.extend t := by
  rw [curveIntegral_eq_intervalIntegral_deriv]
  simp [oneForm, circulationFun]

/-- Absolute continuity gives a genuine complex-vector derivative integral. -/
theorem deriv_intervalIntegrable_ac {γ : ℝ → ℂ} {a b : ℝ}
    (hγ : AbsolutelyContinuousOnInterval γ a b) :
    IntervalIntegrable (deriv γ) volume a b :=
  sorry

/-- Absolute continuity supplies boundary integrability; it is not an extra premise. -/
theorem circulationFun_intervalIntegrable {γ : ℝ → ℂ} {a b : ℝ} {P Q : ℂ → ℝ}
    (hγ : AbsolutelyContinuousOnInterval γ a b)
    (hP : ContinuousOn P (γ '' uIcc a b)) (hQ : ContinuousOn Q (γ '' uIcc a b)) :
    IntervalIntegrable (circulationFun P Q γ) volume a b :=
  sorry

/-- Ordinary off-curve winding integral for AC curves, consuming Tau Ceti's index. -/
theorem windingNumber_eq_integral_ac {γ : ℝ → ℂ} {a b : ℝ} {z : ℂ}
    (hγ : AbsolutelyContinuousOnInterval γ a b) (hz : z ∉ γ '' uIcc a b) :
    TauCeti.Contour.windingNumber γ a b z =
      (2 * (Real.pi : ℂ) * Complex.I)⁻¹ *
        ∫ t in a..b, (γ t - z)⁻¹ * deriv γ t := by
  have havoid : ∀ t ∈ uIcc a b, γ t ≠ z :=
    fun t ht heq ↦ hz ⟨t, ht, heq⟩
  exact TauCeti.Contour.windingNumber_eq_integral_of_avoidance hγ.continuousOn havoid
    (TauCeti.Contour.intervalIntegrable_inv_sub_mul_deriv hγ.continuousOn havoid
      (deriv_intervalIntegrable_ac hγ))

/-- The existing proximity theorem extended to arbitrary AC closed curves. -/
theorem windingNumber_eq_of_dist_lt_dist_ac {γ₀ γ₁ : ℝ → ℂ} {a b : ℝ} {z : ℂ}
    (h₀ : AbsolutelyContinuousOnInterval γ₀ a b)
    (h₁ : AbsolutelyContinuousOnInterval γ₁ a b)
    (h₀closed : γ₀ a = γ₀ b) (h₁closed : γ₁ a = γ₁ b)
    (hlt : ∀ t ∈ uIcc a b, dist (γ₁ t) (γ₀ t) < dist (γ₀ t) z) :
    TauCeti.Contour.windingNumber γ₁ a b z = TauCeti.Contour.windingNumber γ₀ a b z :=
  sorry

/-- An AC trace is null for planar Lebesgue measure. -/
theorem volume_image_eq_zero_ac {γ : ℝ → ℂ} {a b : ℝ}
    (hγ : AbsolutelyContinuousOnInterval γ a b) : volume (γ '' uIcc a b) = 0 :=
  sorry

/-- Integrability of the area multiplicity is a theorem, not part of the curve definition. -/
theorem windingWeight_integrable_ac {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b) :
    Integrable (windingWeight γ a b) volume :=
  sorry

/-- The winding-weighted theorem permits repeated traversal and self-intersection. -/
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

/-- HOL Light's listed strength: index one on all bounded complementary components.
No simplicity, finite partition, nonzero speed, or field compact support is assumed. -/
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

/-- The AC flux expression fixes the outward-normal sign without requiring a unit tangent. -/
theorem green_ac_flux {γ : ℝ → ℂ} {a b : ℝ} {U : Set ℂ} {X Y : ℂ → ℝ}
    (hab : a < b) (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b)
    (hU : IsOpen U) (hregion : TauCeti.filledHull (γ '' uIcc a b) ⊆ U)
    (hX : ContDiffOn ℝ 1 X U) (hY : ContDiffOn ℝ 1 Y U)
    (hindex : ∀ z ∈ TauCeti.filledHull (γ '' uIcc a b) \ (γ '' uIcc a b),
      TauCeti.Contour.windingNumber γ a b z = 1) :
    IntervalIntegrable
        (fun t ↦ X (γ t) * (deriv γ t).im - Y (γ t) * (deriv γ t).re) volume a b ∧
      IntegrableOn (fun z ↦ fderiv ℝ X z (1 : ℂ) + fderiv ℝ Y z Complex.I)
        (TauCeti.filledHull (γ '' uIcc a b) \ (γ '' uIcc a b)) volume ∧
      (∫ t in a..b, X (γ t) * (deriv γ t).im - Y (γ t) * (deriv γ t).re) =
        ∫ z in TauCeti.filledHull (γ '' uIcc a b) \ (γ '' uIcc a b),
          fderiv ℝ X z (1 : ℂ) + fderiv ℝ Y z Complex.I :=
  sorry

end

end Green

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
  [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] {m : ℕ}

/-- **Layer 12.2, the Riemannian gradient**: the fibrewise Riesz dual of `mfderiv I 𝓘(ℝ) f x`,
through Tau Ceti's `Riemannian.Tensor.rieszDual`. -/
noncomputable def mgradient (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [IsManifold I 1 M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    (f : M → ℝ) (x : M) : TangentSpace I x :=
  Riemannian.Tensor.rieszDual (I := I) x (mfderiv I 𝓘(ℝ) f x)

/-- The defining identity of the gradient, discharged in place from Tau Ceti's `inner_rieszDual`. -/
theorem inner_mgradient (f : M → ℝ) (x : M) (v : TangentSpace I x) :
    ⟪mgradient I f x, v⟫_ℝ = (id (mfderiv I 𝓘(ℝ) f x v) : ℝ) :=
  Riemannian.Tensor.inner_rieszDual _ _

theorem contMDiff_mgradient [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)] {f : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) :
    ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, mgradient I f x⟩ : TangentBundle I M)) :=
  sorry

/-- **Layer 12.2, acceptance.** On an inner product space with its standard metric the manifold
gradient is Mathlib's `gradient`. -/
theorem mgradient_eq_gradient {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (f : F → ℝ) (x : F) :
    let _ : RiemannianBundle (fun x : F ↦ TangentSpace 𝓘(ℝ, F) x) :=
      ⟨(riemannianMetricVectorSpace F).toRiemannianMetric⟩
    mgradient 𝓘(ℝ, F) f x = gradient f x :=
  sorry

variable [IsManifold I 2 M] [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)]

/-- **Layer 12.3.** Divergence as the pointwise trace of the covariant derivative — for Mathlib's
Levi-Civita connection `CovariantDerivative.leviCivitaConnection`, consumed together with Tau
Ceti's regularity instance
(`CovariantDerivative.instContMDiffCovariantDerivativeLeviCivitaConnection`); the fundamental
theorem of Riemannian geometry is not rebuilt here. -/
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

/-- Symmetry of the Hessian, from torsion-freeness. -/
theorem hessian_symm [IsManifold I ∞ M] [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M) (v w : TangentSpace I x) :
    hessian I f x v w = hessian I f x w v :=
  sorry

/-- **Layer 12.3.** The Laplace–Beltrami operator, `Δ f = div (grad f)` — this repository's sign. -/
noncomputable def laplaceBeltrami (I : ModelWithCorners ℝ E H) {M : Type*} [TopologicalSpace M]
    [ChartedSpace H M] [RiemannianBundle (fun x : M ↦ TangentSpace I x)] [IsManifold I 2 M]
    [IsContMDiffRiemannianBundle I 1 E (fun x : M ↦ TangentSpace I x)] (f : M → ℝ) (x : M) : ℝ :=
  divergence I (mgradient I f) x

/-- `Δ f` is the trace of the Hessian. -/
theorem laplaceBeltrami_eq_sum_hessian (f : M → ℝ) (x : M)
    (b : OrthonormalBasis (Fin m) ℝ (TangentSpace I x)) :
    laplaceBeltrami I f x = ∑ i, hessian I f x (b i) (b i) :=
  sorry

/-- **Layer 12.5, acceptance: the sign gate.** On an inner product space, `laplaceBeltrami` is the
`Δ` of `InnerProductSpace.instLaplacian`, and `Δ ‖x‖² = 2 · dim`. -/
theorem laplaceBeltrami_eq_laplacian {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] {f : F → ℝ} (hf : ContDiff ℝ 2 f) (x : F) :
    laplaceBeltrami 𝓘(ℝ, F) f x = Laplacian.laplacian f x :=
  sorry

theorem laplaceBeltrami_norm_sq {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    [FiniteDimensional ℝ F] (x : F) :
    laplaceBeltrami 𝓘(ℝ, F) (fun y ↦ ‖y‖ ^ 2) x = 2 * Module.finrank ℝ F :=
  sorry

/-- **Layer 12.4.** Full support, a new property of the existing measure. -/
theorem isOpenPosMeasure_riemannianVolume [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] :
    (TauCeti.riemannianVolume I M).IsOpenPosMeasure :=
  sorry

/-- Strict positivity, stated measure-theoretically through `lintegral` — ⚠ never through the
junk-valued Bochner integral, which is `0` on any nonintegrable function. -/
theorem lintegral_riemannianVolume_pos [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    {f : M → ℝ} (hf : Continuous f) (hnn : ∀ x, 0 ≤ f x) (hpos : ∃ x, 0 < f x) :
    0 < ∫⁻ x, ENNReal.ofReal (f x) ∂TauCeti.riemannianVolume I M :=
  sorry

/-- **Layer 12.5, the divergence theorem and Green's identities** on boundaryless `M`, for
compactly supported fields and functions. The supported smooth-boundary theorem, induced
metric/measure and outward unit normal are represented in SupportedBoundaryDivergence below;
face-structured extensions and the finite-regularity scope remain in README12.5. -/
theorem integral_divergence_eq_zero [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    {X : (x : M) → TangentSpace I x}
    (hX : ContMDiff I I.tangent ∞ (fun y ↦ (⟨y, X y⟩ : TangentBundle I M)))
    {K : Set M} (hK : IsCompact K) (hXK : ∀ x ∉ K, X x = 0) :
    ∫ x, divergence I X x ∂TauCeti.riemannianVolume I M = 0 :=
  sorry

theorem integral_mul_laplaceBeltrami [MeasurableSpace M] [BorelSpace M] [T2Space M]
    [SigmaCompactSpace M] [BoundarylessManifold I M] [IsManifold I ∞ M]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)] {f g : M → ℝ}
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hg : ContMDiff I 𝓘(ℝ) ∞ g) (hfc : HasCompactSupport f) :
    ∫ x, f x * laplaceBeltrami I g x ∂TauCeti.riemannianVolume I M =
      -∫ x, ⟪mgradient I f x, mgradient I g x⟫_ℝ ∂TauCeti.riemannianVolume I M :=
  sorry

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
/-- DG12.1 data: pull back a pointwise Riemannian metric along an injective differential.
Only the source must be finite dimensional; regularity is a separate theorem. -/
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
variable [FiniteDimensional ℝ ES] [IsManifold IS 1 SM] [IsManifold IN 1 NM]
  [RiemannianBundle (fun x : NM => TangentSpace IN x)]
/-- Native contMDiffAt_pullback supplies the bilinear-form regularity. -/
theorem immersionMetric_contMDiff (n : ℕ∞ω)
    [IsContMDiffRiemannianBundle IN n FS (fun x : NM => TangentSpace IN x)]
    (f : SM → NM) (hf : ContMDiff IS IN (n + 1) f)
    (hinj : ∀ x, Function.Injective (mfderiv IS IN f x)) :
    let _ := immersionMetric f hinj
    IsContMDiffRiemannianBundle IS n ES (fun x : SM => TangentSpace IS x) := by
  sorry
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
local instance supportedBoundaryMetricC1 :
    IsContMDiffRiemannianBundle (𝓡∂ (n + 1)) 1
      (EuclideanSpace ℝ (Fin (n + 1))) (fun x : M => TangentSpace (𝓡∂ (n + 1)) x) :=
  IsContMDiffRiemannianBundle.of_le (n := ∞) (by simp)

local instance supportedBoundarySmooth :
    IsManifold 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞ ((𝓡∂ (n + 1)).boundary M) :=
  TauCeti.isManifold_boundary (n := n) (k := ∞) M (by simp)

/-- DG12.5 uses the actual metric pulled back by the native boundary immersion. -/
@[instance_reducible]
noncomputable def halfSpaceBoundaryMetric :
    RiemannianBundle (fun x : (𝓡∂ (n + 1)).boundary M =>
      TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x) :=
  immersionMetric (IS := 𝓘(ℝ, EuclideanSpace ℝ (Fin n))) (IN := 𝓡∂ (n + 1))
    (fun x : (𝓡∂ (n + 1)).boundary M => (x : M))
    ((TauCeti.isImmersion_subtypeVal_boundary (n := n) (k := ∞) M
      (by simp)).mfderiv_injective (by simp))

theorem halfSpaceBoundaryMetric_contMDiff :
    letI := halfSpaceBoundaryMetric (n := n) (M := M)
    IsContMDiffRiemannianBundle 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) ∞
      (EuclideanSpace ℝ (Fin n)) (fun x : (𝓡∂ (n + 1)).boundary M =>
        TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x) := by
  sorry

theorem halfSpaceBoundaryMetric_continuous :
    letI := halfSpaceBoundaryMetric (n := n) (M := M)
    IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin n))
      (fun x : (𝓡∂ (n + 1)).boundary M =>
        TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x) := by
  sorry

/-- This selects the native measure of the induced metric, not an arbitrary boundary measure. -/
noncomputable def halfSpaceBoundaryVolume : MeasureTheory.Measure ((𝓡∂ (n + 1)).boundary M) := by
  letI := halfSpaceBoundaryMetric (n := n) (M := M)
  letI := halfSpaceBoundaryMetric_continuous (n := n) (M := M)
  exact TauCeti.riemannianVolume 𝓘(ℝ, EuclideanSpace ℝ (Fin n))
    ((𝓡∂ (n + 1)).boundary M)

/-- Pointwise finite-dimensional metric geometry supplies the unique outward orthogonal unit
vector. The norm/inner-product predicates explicitly retain the ambient metric parameter. -/
theorem exists_halfSpaceOutwardUnitNormal (x : (𝓡∂ (n + 1)).boundary M) :
    ∃ v : TangentSpace (𝓡∂ (n + 1)) (x : M),
      ‖v‖ = 1 ∧ IsOutwardPointing (x : M) v ∧
        ∀ w : TangentSpace 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) x,
          inner ℝ v
            (mfderiv 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)) Subtype.val x w) = 0 := by
  sorry

/-- Chosen from the metric-dependent existence theorem; no divergence identity is an input. -/
noncomputable def halfSpaceOutwardUnitNormal (x : (𝓡∂ (n + 1)).boundary M) :
    TangentSpace (𝓡∂ (n + 1)) (x : M) :=
  Classical.choose (exists_halfSpaceOutwardUnitNormal x)

theorem halfSpaceOutwardUnitNormal_contMDiff :
    ContMDiff 𝓘(ℝ, EuclideanSpace ℝ (Fin n)) (𝓡∂ (n + 1)).tangent ∞
      (fun x : (𝓡∂ (n + 1)).boundary M =>
        (⟨(x : M), halfSpaceOutwardUnitNormal x⟩ : TangentBundle (𝓡∂ (n + 1)) M)) := by
  sorry

/-- The same ambient metric is used in the flux and the normal's defining laws. -/
noncomputable def halfSpaceBoundaryFlux (X : (x : M) → TangentSpace (𝓡∂ (n + 1)) x)
    (x : (𝓡∂ (n + 1)).boundary M) : ℝ :=
  inner ℝ (X (x : M)) (halfSpaceOutwardUnitNormal x)

/-- Both integrals genuinely exist under compactness of M or compact support of X. -/
theorem integrable_divergence_and_boundaryFlux
    {X : (x : M) → TangentSpace (𝓡∂ (n + 1)) x}
    (hX : ContMDiff (𝓡∂ (n + 1)) (𝓡∂ (n + 1)).tangent ∞
      (fun x => (⟨x, X x⟩ : TangentBundle (𝓡∂ (n + 1)) M)))
    (hSupport : IsCompact (Set.univ : Set M) ∨
      ∃ K : Set M, IsCompact K ∧ ∀ x ∉ K, X x = 0) :
    MeasureTheory.Integrable (divergence (𝓡∂ (n + 1)) X)
        (TauCeti.riemannianVolume (𝓡∂ (n + 1)) M) ∧
      MeasureTheory.Integrable (halfSpaceBoundaryFlux X)
        (halfSpaceBoundaryVolume (n := n) (M := M)) := by
  sorry

/-- DG12.5 smooth-boundary divergence: no orientability assumption, no unrestricted support. -/
theorem integral_divergence_eq_boundaryFlux
    {X : (x : M) → TangentSpace (𝓡∂ (n + 1)) x}
    (hX : ContMDiff (𝓡∂ (n + 1)) (𝓡∂ (n + 1)).tangent ∞
      (fun x => (⟨x, X x⟩ : TangentBundle (𝓡∂ (n + 1)) M)))
    (hSupport : IsCompact (Set.univ : Set M) ∨
      ∃ K : Set M, IsCompact K ∧ ∀ x ∉ K, X x = 0) :
    (∫ x, divergence (𝓡∂ (n + 1)) X x
      ∂TauCeti.riemannianVolume (𝓡∂ (n + 1)) M) =
      ∫ x, halfSpaceBoundaryFlux X x
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

/-- Continuity of the round metric is consumed from the native round-sphere instance. -/
theorem volume_circle :
    let _ := roundMetricCircle
    let _ : IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin 1))
      (fun x : Circle ↦ TangentSpace (𝓡 1) x) := TauCeti.instIsContinuousRiemannianBundleSphere
    TauCeti.riemannianVolume (𝓡 1) Circle Set.univ = ENNReal.ofReal (2 * Real.pi) :=
  sorry

end RoundMetric
end TauCetiRoadmap.DifferentialGeometry
