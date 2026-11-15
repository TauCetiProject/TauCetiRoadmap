module

public import Mathlib
public import TauCeti.Topology.FiberBundle.Principal
public import TauCeti.Topology.VectorBundle.OrthonormalFrame.Basic
public import TauCeti.Topology.VectorBundle.EulerClass
public import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Compact

/-!
# Clifford bundles, spin structures, and Dirac geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`. At the pins one
geometric headline is statable: the rank-two Spin criterion of G4.4a, stated with the one
definition it needs, the Spin structure of a real vector bundle with fibre inner products (G4.2).

The finite Clifford-module algebra of G1–G2 is proved by the pinned Tau Ceti and is cited in the
README's supplier contracts instead of being restated here:

* the scalar trace and its regular-trace formula, positivity and faithfulness (G1.3):
  `CliffordAlgebra.scalarTrace`, `CliffordAlgebra.trace_mulLeft_eq_two_pow_mul_scalarTrace`,
  `CliffordAlgebra.scalarTrace_reverse_mul_self_nonneg` and
  `CliffordAlgebra.scalarTrace_reverse_mul_self_eq_zero_iff`;
* the multiplicity evaluation `S ⊗ Hom_Cl(S, E) ≃ E` (G1.3):
  `TauCeti.isotypicTensorEquivOfBijective`;
* the chirality operator, its square, its anticommutation with vectors and the half-spin
  splitting (G2.1): `CliffordAlgebra.complexVolume`, `CliffordAlgebra.complexVolume_mul_self`,
  `CliffordAlgebra.complexVolume_mul_ι_of_even` and
  `CliffordAlgebra.isCompl_eigenspace_complexVolume`.

The comparisons that G1–G2 keep beyond the library (the Pauli models of the real planes, the
polarized relation `c(v)c(w) + c(w)c(v) = −2⟨v, w⟩` of a real algebra map in the geometric
convention, the Gram-determinant formula for the Fock metric, the two-factor odd evaluation, the
chirality of a real algebra map, the agreement of the wedge-basis form on complexified forms with
the complexified Gram metric, the forms-to-endomorphisms module equivalence and the laws of the
graded product) are pointwise lemmas on pinned carriers that the geometric layers consume. So is
the frame independence of the pointwise contraction `Σ_j c(e_j) ∇_(e_j) s` of G6.1, the metric
trace of a bilinear map. They are README targets, not headline theorems, and are not stated here.

Not statable at the pins, and therefore stated nowhere in this file:

* smooth Clifford-module and spinor-bundle comparisons (G3, G5.1): the pins have no smooth
  Clifford algebra bundle acting on a bundle and no associated spinor bundle;
* the Dirac operator's intrinsic frame and symbol comparisons (G6.1), the Bochner formula
  `D² = ∇*∇ + Σ_(i<j) c(e_i) c(e_j) R(e_i, e_j)` (G6.2), the untwisted and twisted Lichnerowicz
  formulas `D² = ∇*∇ + Scal/4 + …` with their curvature vanishing (G6.0, G6.3) and the de Rham
  identification `D = d + d*` (G6.4): the pins have no smooth Clifford-module bundle with a
  compatible connection and no Dirac operator on its sections, and a pointwise contraction is not
  that operator;
* the closed-base self-adjoint realization with `H¹` domain and compact resolvent and the chiral
  adjoint theorems (G6.1): the pins have no bundle Sobolev spaces;
* existence of a spin structure iff `w₂ = 0` in every rank, and the `H¹(X; ℤ/2)` torsor of the
  spin structures of a fixed orientation (G4.3, G4.4): the pins have no second Stiefel–Whitney
  class of a real vector bundle (their Stiefel–Whitney classes are those of quadratic forms over
  fields) and no twist of a principal `Spin(n)`-bundle by a principal `ℤ/2`-bundle;
* the skeletal comparison of G4.4a: the pins have no quotient of frame sections over the
  one-skeleton by homotopy through such sections;
* plane-bundle square roots (G5.3): the pins have no tensor product of topological vector bundles,
  so no tensor square of a complex line bundle;
* the compact-support symbol class of `D⁺` (G6.6): the pins have no spinor bundle and no
  topological K-theory;
* the `KO`-valued analytic index class of the real spin Dirac operator (G6.0): the pins have no
  real Clifford Hilbert-module classifier and no `KO`;
* the quaternionic four-dimensional index formula `ind D⁺ = 2α` (G6.7): the pins have no spinor
  bundle and no chiral Dirac operator, and parity of an abstract quaternionic vector space does not
  state this geometric result.
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
orientation of `E` is the one for which these frames are positive. A structure thus chooses an
orientation of `E`, which equivalences preserving the frame map preserve, and G4.4's
`H¹(X; ℤ/2)` torsor acts on the classes of one orientation. Positive rank is required:
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
