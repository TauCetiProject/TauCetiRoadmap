module

public import Mathlib
public import TauCeti.Topology.FiberBundle.Principal
public import TauCeti.Topology.VectorBundle.OrthonormalFrame.Basic
public import TauCeti.Topology.VectorBundle.EulerClass
public import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Compact

/-!
# Spin geometry: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. At the pins one geometric headline is
statable: the rank-two Spin criterion of G4.4a, stated with the one definition it
needs, the Spin structure of G4.2.

The algebraic results of Layers 1 and 2 are theorems of the pinned Tau Ceti and are
cited in the README's supplier contracts instead of being stated here: the normalized
scalar trace of a Clifford algebra with its regular-trace formula, cyclicity and
negative-metric positivity and faithfulness; Morita evaluation of an arbitrary module
over an algebra acting as a full endomorphism algebra; and the normalized complex
volume element with its square, its anticommutation with vectors and the complementary
chirality eigenspaces of every module.

The other geometric headlines are not statable at the pins with a few simple definitions:
* Smooth Clifford-module and spinor-bundle comparison needs the smooth algebra-bundle
  action and associated spinor-bundle carriers of G3/G5.
* The Spin obstruction of G4.3 (a Spin structure exists exactly when w₂(V) = 0, in
  every rank) needs the second Stiefel–Whitney class of a real vector bundle; the
  Stiefel–Whitney classes at the pins are those of quadratic forms over fields.
* The H¹(X; ℤ/2)-torsor of G4.4 needs the twist of a principal Spin bundle by a
  principal ℤ/2-bundle, an associated-bundle construction that the pins lack.
* The skeletal comparison of G4.4a needs the quotient of frame sections over the
  one-skeleton by homotopy through such sections.
* Plane-bundle square roots (G5.3) need the tensor square of a complex line bundle;
  the pins have no tensor product of topological vector bundles.
* Intrinsic Dirac frame/symbol comparison, untwisted and twisted Lichnerowicz formulas,
  and curvature vanishing need smooth Clifford modules with compatible connections
  and their induced differential operator. A pointwise contraction is not that operator.
* The closed-domain and chiral-adjoint theorems need that operator's bundle Sobolev
  domains and its distributional realization.
* The de Rham/signature realization needs the smooth exterior Clifford-module and
  Hodge operator comparison; its symbol class needs the compact-support bundle triple.
* The real KO analytic index and its products need the real regular spinor bundle,
  closed Clifford-linear operator and negative-Clifford family-index comparison.
* The four-dimensional quaternionic kernel/index theorem needs the actual half-spin
  bundles, their Sobolev kernel/cokernel restrictions and KO comparison; abstract
  vector-space parity does not state this geometric result.

The comparisons that Layers 1 and 2 keep beyond the library (the Gram-determinant
formula for the Fock metric, the agreement of the wedge-basis form on complexified
forms with the complexified Gram metric, the two-factor odd evaluation, the
forms-to-endomorphisms module equivalence and the laws of the graded product) are
pointwise lemmas on pinned carriers that the geometric layers consume. They are
README targets, not headline theorems, and are not stated here.
-/

@[expose] public section

open Bundle TauCeti MulOpposite Module CliffordAlgebra

universe w

namespace TauCetiRoadmap.SpinGeometry

/-! ## Layer 4: Spin lifts, obstruction and classification -/

/-- A **Spin structure** of rank `n ≥ 1` on a real vector bundle `E` with fibre inner products
(G4.2): a principal `Spin(n)`-bundle `P` over the base, where `Spin(n)` is the compact group
`realCliffordSpinGroupZero n` with its subspace topology, together with a continuous map to the
orthonormal frame bundle of `E` over the identity, equivariant along the vector action
`Spin(n) → SO(n)`: the frame of `p • g` sends `v` to the frame of `p` applied to `g v g⁻¹`.
Each fibre of `P` is a `Spin(n)`-torsor, so its image is one `SO(n)`-orbit of frames, and the
orientation of `E` is the one for which these frames are positive. Positive rank is required:
the native `Spin(0)` is trivial, while the rank-zero branch of G4.2 uses the geometric group
`μ₂`. (Kirby, *The topology of 4-manifolds*, Chapter IV, p. 33; Lawson–Michelsohn,
*Spin Geometry*, Chapter II, §1.) -/
structure SpinStructure {X : Type w} [TopologicalSpace X] (F : Type*) (E : X → Type w)
    [TopologicalSpace (TotalSpace F E)]
    [∀ x, NormedAddCommGroup (E x)] [∀ x, InnerProductSpace ℝ (E x)] (n : ℕ) [NeZero n] where
  /-- The fibres of the principal `Spin(n)`-bundle. -/
  P : X → Type w
  /-- The topology of the total space of `P`. -/
  [topTotal : TopologicalSpace (TotalSpace (realCliffordSpinGroupZero n) P)]
  /-- The topologies of the fibres of `P`. -/
  [topFiber : ∀ x, TopologicalSpace (P x)]
  /-- The right action of `Spin(n)` on the fibres of `P`. -/
  [act : ∀ x, MulAction (realCliffordSpinGroupZero n)ᵐᵒᵖ (P x)]
  /-- `P` is a fibre bundle with model fibre `Spin(n)`. -/
  [fiberBundle : FiberBundle (realCliffordSpinGroupZero n) P]
  /-- The trivializations of the atlas of `P` are equivariant. -/
  [principal : TauCeti.PrincipalBundle (realCliffordSpinGroupZero n) P]
  /-- The map to the orthonormal frames of `E`. -/
  toFrame : TotalSpace (realCliffordSpinGroupZero n) P →
    OrthonormalFrameBundle ℝ F E (EuclideanSpace ℝ (Fin n))
  /-- The map to frames is continuous. -/
  continuous_toFrame : Continuous toFrame
  /-- The map to frames covers the identity of the base. -/
  proj_toFrame : ∀ p, (toFrame p).proj = p.proj
  /-- The map to frames is equivariant along the vector action of `Spin(n)`. -/
  toFrame_smul : ∀ (x : X) (p : P x) (g : realCliffordSpinGroupZero n) (v : Fin n → ℝ),
    TotalSpace.mk' F (toFrame ⟨x, op g • p⟩).proj
        ((toFrame ⟨x, op g • p⟩).frame (WithLp.toLp 2 v)) =
      TotalSpace.mk' F (toFrame ⟨x, p⟩).proj
        ((toFrame ⟨x, p⟩).frame (WithLp.toLp 2 (spinVectorAction _ g v)))

/-- **Rank-two Spin criterion** (G4.4a). Let `E` be a real vector bundle of rank two with a
continuous fibre metric over a Hausdorff CW complex `X`, and let `u` be an integral Thom class of
`E`. Then `E` admits a Spin structure exactly when the Euler class `e(u) ∈ H²(X; ℤ)` is twice an
integral class, torsion classes included. Divisibility by two does not depend on the sign of `u`,
so the condition is the same for both orientations. The route: a Spin structure exists exactly
when `w₂(E) = 0` (Kirby, *The topology of 4-manifolds*, Chapter IV, p. 34), `w₂(E)` is the
reduction of `e(u)` modulo two, and the reduction `H²(X; ℤ) → H²(X; ℤ/2)` has kernel
`2 H²(X; ℤ)`. The base and the fibres live in `Type`: at the pins the integral coefficients
`ModuleCat.of ℤ ℤ` give the singular cohomology of spaces in that universe. -/
theorem nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul
    {X : Type} [TopologicalSpace X] [T2Space X] [Topology.CWComplex (Set.univ : Set X)]
    (F : Type) [NormedAddCommGroup F] [InnerProductSpace ℝ F] (hF : finrank ℝ F = 2)
    (E : X → Type) [TopologicalSpace (TotalSpace F E)]
    [∀ x, NormedAddCommGroup (E x)] [∀ x, InnerProductSpace ℝ (E x)]
    [FiberBundle F E] [VectorBundle ℝ F E] [IsContinuousRiemannianBundle F E]
    (u : (thomPair F E).singularCohomology (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ) (finrank ℝ F))
    (hu : IsThomClass F E u) :
    Nonempty (SpinStructure F E 2) ↔
      ∃ c, (eulerClass (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ) F E (finrank ℝ F)).hom u =
        2 • c := by
  sorry

end TauCetiRoadmap.SpinGeometry
