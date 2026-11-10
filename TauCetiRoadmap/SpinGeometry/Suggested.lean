module
public import Mathlib
public import TauCeti.Topology.FiberBundle.Principal
public import TauCeti.Topology.VectorBundle.OrthonormalFrame.Basic
public import TauCeti.Topology.VectorBundle.EulerClass
public import TauCeti.Topology.Algebra.CliffordAlgebra.Spin.Compact

/-!
# Clifford bundles, spin structures, and Dirac geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each admitted with `sorry`,
together with the few definitions those statements need: the negative-metric Clifford relation of
a geometric Clifford action (G1.2), the Spin structure of a real vector bundle with fibre inner
products (G4.2) with the rank-two Spin criterion of G4.4a, and the frame independence of the Dirac
contraction (G6.1).

The finite Clifford-module algebra of G1–G2 is proved by the pinned Tau Ceti and is therefore not
restated here:

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
Gram-determinant formula for the Fock metric, the two-factor odd evaluation, the chirality of a
real algebra map, the agreement of the wedge-basis form on complexified forms with the
complexified Gram metric, the forms-to-endomorphisms module equivalence and the laws of the
graded product) are pointwise lemmas on pinned carriers that the geometric layers consume. They
are README targets, not headline theorems, and are not stated here.

Not statable at the pins, and therefore stated nowhere in this file:

* the Lichnerowicz formula `D² = ∇*∇ + Scal/4` (G6.0, G6.3) and the Bochner formula
  `D² = ∇*∇ + c(F)` (G6.2): the pins have no smooth Clifford-module bundle with a compatible
  connection and no Dirac operator on its sections;
* the closed-base self-adjoint realization with `H¹` domain and compact resolvent (G6.1):
  the pins have no bundle Sobolev spaces;
* existence of a spin structure iff `w₂ = 0` in every rank, and the `H¹(X; ℤ/2)` torsor of spin
  structures (G4.3, G4.4): the pins have no second Stiefel–Whitney class of a real vector bundle
  (their Stiefel–Whitney classes are those of quadratic forms over fields) and no twist of a
  principal `Spin(n)`-bundle by a principal `ℤ/2`-bundle;
* the skeletal comparison of G4.4a: the pins have no quotient of frame sections over the
  one-skeleton by homotopy through such sections;
* plane-bundle square roots (G5.3): the pins have no tensor product of topological vector bundles,
  so no tensor square of a complex line bundle;
* the `KO`-valued analytic index class of the real spin Dirac operator (G6.0): the pins have no
  real Clifford Hilbert-module classifier and no `KO`;
* the quaternionic four-dimensional index formula `ind D⁺ = 2α` (G6.7): the pins have no spinor
  bundle and no chiral Dirac operator.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpinGeometry

open scoped Manifold ContDiff TensorProduct

/-! ## G1: Negative-metric Clifford modules and their positive metrics -/

section MetricAction

variable {V S : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [NormedAddCommGroup S] [InnerProductSpace ℂ S]
  (Q : QuadraticForm ℝ V) (ρ : CliffordAlgebra Q →ₐ[ℝ] Module.End ℂ S)

/-- G1.2: Clifford multiplication `c(v) = ρ(ι v)` by a real vector on the complex module `S`
of a real algebra map `ρ` from the Clifford algebra of `Q`. -/
def cliffordMultiplication (v : V) : Module.End ℂ S := ρ (CliffordAlgebra.ι Q v)

/-- G1.2: the geometric convention of the roadmap: `Q(v) = −⟨v, v⟩`, so that generators square
to `−|v|²`, and every `c(v)` is skew-Hermitian for the inner product of `S`. -/
def IsGeometricAction : Prop :=
  (∀ v, Q v = -inner ℝ v v) ∧
    ∀ v s t, inner ℂ (cliffordMultiplication Q ρ v s) t =
      -inner ℂ s (cliffordMultiplication Q ρ v t)

/-- G1.2: the negative-metric Clifford relation `c(v)c(w) + c(w)c(v) = −2⟨v, w⟩ Id` for a
geometric action (Nicolaescu, Definition 12.1.10, p. 626, with `q(v) = ⟨v, v⟩`). -/
theorem cliffordMultiplication_anticommutator (h : IsGeometricAction Q ρ) (v w : V) :
    cliffordMultiplication Q ρ v * cliffordMultiplication Q ρ w +
      cliffordMultiplication Q ρ w * cliffordMultiplication Q ρ v =
      (-2 * inner ℝ v w) • (1 : Module.End ℂ S) := by
  sorry

end MetricAction

/-! ## G6: Dirac operators and curvature formulas -/

section ConnectionContraction

open Bundle

variable {E H M F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup F] [NormedSpace ℝ F]
  {W : M → Type*} [∀ x, NormedAddCommGroup (W x)]
  [∀ x, InnerProductSpace ℂ (W x)]
  [TopologicalSpace (TotalSpace F W)] [FiberBundle F W]
  [RiemannianBundle (fun x : M => TangentSpace I x)]

/-- G6.1: the Dirac contraction `Σ_j c(e_j) ∇_(e_j) s` at a point `x`, in an orthonormal frame
`b` of `T_x M`, for a pointwise Clifford multiplication `c` and a covariant derivative `conn` on
the bundle `W`; the frame-independence theorem below is algebraic, so smoothness and Clifford
compatibility of `c` are README hypotheses that the definition does not need. -/
def diracInFrame {n : ℕ}
    (c : ∀ x, TangentSpace I x →ₗ[ℝ] Module.End ℂ (W x))
    (conn : CovariantDerivative I F W) (s : ∀ x, W x) (x : M)
    (b : OrthonormalBasis (Fin n) ℝ (TangentSpace I x)) : W x :=
  ∑ j, c x (b j) (conn s x (b j))

/-- G6.1: the Dirac contraction does not depend on the orthonormal frame: the change of frame
is orthogonal, and `c` and `conn s x` are both real-linear in the tangent vector. -/
theorem diracInFrame_eq {n : ℕ}
    (c : ∀ x, TangentSpace I x →ₗ[ℝ] Module.End ℂ (W x))
    (conn : CovariantDerivative I F W) (s : ∀ x, W x) (x : M)
    (b b' : OrthonormalBasis (Fin n) ℝ (TangentSpace I x)) :
    diracInFrame c conn s x b = diracInFrame c conn s x b' := by
  sorry

end ConnectionContraction

/-! ## G4: Spin lifts, obstruction and classification -/

section SpinLift

open Bundle TauCeti MulOpposite Module CliffordAlgebra

universe w

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

end SpinLift

end TauCetiRoadmap.SpinGeometry
