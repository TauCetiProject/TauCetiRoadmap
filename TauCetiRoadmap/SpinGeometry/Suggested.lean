module
public import Mathlib

/-!
# Clifford bundles, spin structures, and Dirac geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each admitted with `sorry`,
together with the few definitions those statements need: the negative-metric Clifford relation of
a geometric Clifford action (G1.2) and the frame independence of the Dirac contraction (G6.1).

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

Not statable at the pins, and therefore stated nowhere in this file:

* the Lichnerowicz formula `D² = ∇*∇ + Scal/4` (G6.0, G6.3) and the Bochner formula
  `D² = ∇*∇ + c(F)` (G6.2): the pins have no smooth Clifford-module bundle with a compatible
  connection and no Dirac operator on its sections;
* the closed-base self-adjoint realization with `H¹` domain and compact resolvent (G6.1):
  the pins have no bundle Sobolev spaces;
* existence of a spin structure iff `w₂ = 0`, and the `H¹(X; ℤ/2)` torsor of spin structures
  (G4.3, G4.4): the pins have no second Stiefel–Whitney class of a real vector bundle (their
  Stiefel–Whitney classes are those of quadratic forms over fields) and no twist of a principal
  `Spin(n)`-bundle by a principal `ℤ/2`-bundle;
* the `KO`-valued analytic index class of the real spin Dirac operator (G6.0): the pins have no
  real Clifford Hilbert-module classifier and no `KO`;
* the quaternionic four-dimensional index formula `ind D⁺ = 2α` (G6.7): the pins have no spinor
  bundle and no chiral Dirac operator.
-/

public section

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

end TauCetiRoadmap.SpinGeometry
