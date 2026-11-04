module
public import Mathlib
public import TauCeti.Algebra.Quaternion.ComplexMatrix
public import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic

/-!
# Clifford bundles, spin structures, and Dirac geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each admitted with `sorry`,
together with the few definitions those statements need: the normalized scalar trace of a
finite real Clifford algebra (G1.3), the multiplicity space of a Clifford module and its
evaluation isomorphism (G1.3), the negative-metric Clifford relations and the chirality
decomposition of a Hermitian Clifford module (G1–G2), the frame independence of the Dirac
contraction (G6.1), the parity theorem for conjugate-linear square roots of `−1` (G6.7), and
the finite comparison certificates of the Pauli matrices in the `(Z, Y, X)` order against the
native quaternion embedding and the positive-plane model (G1.1).

Not statable at the pins, and therefore stated nowhere in this file:

* the Lichnerowicz formula `D² = ∇*∇ + Scal/4` (G6.0, G6.3) and the Bochner formula
  `D² = ∇*∇ + c(F)` (G6.2): the pins have no smooth Clifford-module bundle with a compatible
  connection and no Dirac operator on its sections;
* the closed-base self-adjoint realization with `H¹` domain and compact resolvent (G6.1):
  the pins have no bundle Sobolev spaces;
* existence of a spin structure iff `w₂ = 0`, and the `H¹(X; ℤ/2)` torsor of spin structures
  (G4.3, G4.4): the pins have no principal `Spin(n)`-bundle over the oriented frame bundle and
  no Čech `w₂`;
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

section SourcePauliComparisons

/-! ### G1.1: Pauli matrices in the `(Z, Y, X)` order: finite comparison certificates

The matrices are the Pauli matrices `Z = diag(1, -1)`, `Y = [[0, -i], [i, 0]]`,
`X = [[0, 1], [1, 0]]` in the order `(Z, Y, X)`, compared with the native quaternion
embedding and the positive-plane model of README G1.1 (`e₁ ↦ X`, `e₂ ↦ Z`).
The Clifford algebra and quaternion embedding below are the existing native objects. -/

namespace SourcePauli

open Matrix
open scoped Quaternion

/-- The Pauli matrices in the order (Z,Y,X); the standard order is (X,Y,Z). -/
def source : Fin 3 → Matrix (Fin 2) (Fin 2) ℂ :=
  ![!![1, 0; 0, -1], !![0, -Complex.I; Complex.I, 0], !![0, 1; 1, 0]]

/-- The quaternion units `i`, `j`, `k`, in the order matching `source`. -/
def quaternionUnit : Fin 3 → ℍ[ℝ] :=
  ![⟨0, 1, 0, 0⟩, ⟨0, 0, 1, 0⟩, ⟨0, 0, 0, 1⟩]

/-- This is the implemented real-quaternion embedding, not a new one. -/
theorem native_quaternion_dictionary (i : Fin 3) :
    Quaternion.toComplexMatrix (quaternionUnit i) = Complex.I • source i := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [quaternionUnit, source, Quaternion.toComplexMatrix_apply]

/-- Each Pauli matrix is Hermitian. -/
theorem source_hermitian (i : Fin 3) : (source i).IsHermitian := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.conjTranspose_apply]

/-- Each Pauli matrix squares to the identity. -/
theorem source_squares (i : Fin 3) : source i * source i = 1 := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- Cyclic products carry −i because (Z,Y,X) is an odd permutation of (X,Y,Z). -/
theorem source_cyclic_products (i : Fin 3) :
    source i * source (i + 1) = -Complex.I • source (i + 2) := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- Distinct Pauli matrices anticommute. -/
theorem source_anticommuting (i j : Fin 3) (hij : i ≠ j) :
    source i * source j = -(source j * source i) := by
  fin_cases i <;> fin_cases j <;> try contradiction
  all_goals
    ext k l
    fin_cases k <;> fin_cases l <;>
      simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- The triple (iZ, iY, iX), in the (Z,Y,X) order, satisfies the quaternion equations
i² = −1 and ij = k of the standard triple. -/
theorem quaternion_equations (i : Fin 3) :
    (Complex.I • source i) * (Complex.I • source i) = -1 ∧
      (Complex.I • source i) * (Complex.I • source (i + 1)) =
        Complex.I • source (i + 2) := by
  fin_cases i <;> constructor <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- The generator map of the positive-plane model on the native positive form,
with e₁ ↦ X and e₂ ↦ Z. -/
def positiveVector : (Fin 2 → ℝ) →ₗ[ℝ] Matrix (Fin 2) (Fin 2) ℝ where
  toFun v := !![v 1, v 0; v 0, -v 1]
  map_add' v w := by ext i j; fin_cases i <;> fin_cases j <;> simp [add_comm]
  map_smul' r v := by ext i j; fin_cases i <;> fin_cases j <;> simp

/-- Squares match the actual Tau Ceti signature-(2,0) form. -/
theorem positiveVector_square (v : Fin 2 → ℝ) :
    positiveVector v * positiveVector v =
      algebraMap ℝ (Matrix (Fin 2) (Fin 2) ℝ) (TauCeti.realCliffordForm 2 0 v) := by
  have hform : TauCeti.realCliffordForm 2 0 v = v 0 * v 0 + v 1 * v 1 := by
    rw [TauCeti.realCliffordForm_apply, Fin.sum_univ_two]
    simp
  rw [hform]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [positiveVector, Matrix.mul_apply, Fin.sum_univ_two,
      Algebra.algebraMap_eq_smul_one] <;> ring

/-- The existing Clifford universal property realizes the positive-plane generator map
e₁ ↦ X, e₂ ↦ Z. -/
def positiveModel : CliffordAlgebra (TauCeti.realCliffordForm 2 0) →ₐ[ℝ]
    Matrix (Fin 2) (Fin 2) ℝ :=
  CliffordAlgebra.lift _ ⟨positiveVector, positiveVector_square⟩

/-- The positive-plane model sends the generator `v` to the real matrix
`[[v 1, v 0], [v 0, -v 1]]`, so `e₁ ↦ X` and `e₂ ↦ Z`. -/
@[simp] theorem positiveModel_generator (v : Fin 2 → ℝ) :
    positiveModel (CliffordAlgebra.ι (TauCeti.realCliffordForm 2 0) v) =
      !![v 1, v 0; v 0, -v 1] := by
  exact CliffordAlgebra.lift_ι_apply _ _ v

/-- Literal real generator equations in the positive-plane model. -/
theorem positive_generators :
    positiveVector ![1, 0] = !![0, 1; 1, 0] ∧
    positiveVector ![0, 1] = !![1, 0; 0, -1] ∧
    positiveVector ![1, 0] * positiveVector ![0, 1] = !![0, -1; 1, 0] := by
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> simp [positiveVector]
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> simp [positiveVector]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [positiveVector, Matrix.mul_apply, Fin.sum_univ_two]

end SourcePauli

end SourcePauliComparisons

section ScalarTrace

variable {V : Type*} [AddCommGroup V] [Module ℝ V] (Q : QuadraticForm ℝ V)

/-- G1.3: the scalar part `τ(a)` of a Clifford element, the degree-zero coefficient of its
image under the Chevalley comparison `CliffordAlgebra.equivExterior` (the unit is the only
basis monomial of degree zero), read off by `ExteriorAlgebra.algebraMapInv`. -/
def cliffordScalarTrace : CliffordAlgebra Q →ₗ[ℝ] ℝ :=
  (ExteriorAlgebra.algebraMapInv (R := ℝ) (M := V)).toLinearMap ∘ₗ
    (CliffordAlgebra.equivExterior Q).toLinearMap

/-- G1.3: on a finite-dimensional `V` the scalar part is the normalized regular trace,
`2^(dim V) · τ(a) = tr(L_a)` with `L_a` left multiplication by `a`, for every quadratic form `Q`
(Nicolaescu, Lectures on the Geometry of Manifolds, §12.1.2, pp. 626–629, with the ordered
monomial basis of an orthogonal basis). -/
theorem cliffordScalarTrace_mul_two_pow [FiniteDimensional ℝ V] (a : CliffordAlgebra Q) :
    (2 : ℝ) ^ Module.finrank ℝ V * cliffordScalarTrace Q a =
      LinearMap.trace ℝ (CliffordAlgebra Q) (LinearMap.mulLeft ℝ a) := by
  sorry

/-- G1.3: for positive definite `Q` on a finite-dimensional `V`, the pairing
`τ(reverse(a) · a)` is nonnegative; in an orthogonal basis it is `Σ_I a_I² Π_(i∈I) Q(e_i)`. -/
theorem cliffordScalarTrace_reverse_mul_self_nonneg [FiniteDimensional ℝ V] (hQ : Q.PosDef)
    (a : CliffordAlgebra Q) :
    0 ≤ cliffordScalarTrace Q (CliffordAlgebra.reverse a * a) := by
  sorry

/-- G1.3: for positive definite `Q` on a finite-dimensional `V` the trace pairing is faithful:
`τ(reverse(a) · a) = 0` only for `a = 0`. -/
theorem cliffordScalarTrace_reverse_mul_self_eq_zero_iff [FiniteDimensional ℝ V]
    (hQ : Q.PosDef) (a : CliffordAlgebra Q) :
    cliffordScalarTrace Q (CliffordAlgebra.reverse a * a) = 0 ↔ a = 0 := by
  sorry

end ScalarTrace

section Multiplicity

variable {V S E : Type*} [AddCommGroup V] [Module ℂ V]
  [AddCommGroup S] [Module ℂ S] [AddCommGroup E] [Module ℂ E]
  (Q : QuadraticForm ℂ V) (ρ : CliffordAlgebra Q ≃ₐ[ℂ] Module.End ℂ S)
  (σ : CliffordAlgebra Q →ₐ[ℂ] Module.End ℂ E)

/-- G1.3: the multiplicity space `Hom_Cl(S, E)` of a Clifford module `E` relative to the
module `S` on which the Clifford algebra acts as all of `End_ℂ(S)`: the complex-linear maps
`S → E` intertwining the two actions. -/
def multiplicitySpace : Submodule ℂ (S →ₗ[ℂ] E) where
  carrier := {T | ∀ a s, T (ρ a s) = σ a (T s)}
  zero_mem' := by simp
  add_mem' := by
    intro T U hT hU a s
    simp only [LinearMap.add_apply, map_add, hT a s, hU a s]
  smul_mem' := by
    intro z T hT a s
    simp only [LinearMap.smul_apply, map_smul, hT a s]

/-- G1.3: the evaluation isomorphism `S ⊗ Hom_Cl(S, E) ≃ E`, `s ⊗ T ↦ T(s)`, for a
finite-dimensional nonzero `S` and an arbitrary Clifford module `E`, with no finiteness or
topology on `E` (Nicolaescu, Corollary 12.1.22, p. 632). -/
theorem exists_multiplicityEvaluation [FiniteDimensional ℂ S] [Nontrivial S] :
    ∃ e : S ⊗[ℂ] multiplicitySpace Q ρ σ ≃ₗ[ℂ] E,
      ∀ (s : S) (T : multiplicitySpace Q ρ σ), e (s ⊗ₜ[ℂ] T) = T.val s := by
  sorry

end Multiplicity

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

/-! ## G2: Volume, chirality and exterior-form comparisons -/

/-- G2.1: the chirality operator `Γ = i^ℓ c(e₁) ⋯ c(e_(2ℓ))` of an ordered orthonormal frame
of an even-dimensional `V`; the frame's order fixes the orientation. -/
def chirality {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V) : Module.End ℂ S :=
  Complex.I ^ ℓ • ((List.ofFn fun i => cliffordMultiplication Q ρ (b i)).prod)

/-- G2.1: `Γ² = 1` for a geometric action: squaring the product of `2ℓ` anticommuting
generators of square `−1` gives `(c₁ ⋯ c_(2ℓ))² = (−1)^(ℓ(2ℓ−1)) · (−1)^(2ℓ) = (−1)^ℓ`, which
`i^(2ℓ) = (−1)^ℓ` cancels. -/
theorem chirality_sq {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V)
    (h : IsGeometricAction Q ρ) : chirality Q ρ b * chirality Q ρ b = 1 := by
  sorry

/-- G2.1: `Γ` anticommutes with every `c(v)`, since `v` anticommutes with each of the `2ℓ`
frame generators but the one it is parallel to, and `2ℓ − 1` is odd. -/
theorem chirality_anticommutes {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V)
    (h : IsGeometricAction Q ρ) (v : V) :
    chirality Q ρ b * cliffordMultiplication Q ρ v =
      -(cliffordMultiplication Q ρ v * chirality Q ρ b) := by
  sorry

/-- G2.1: the positive spinors `S⁺`, the `+1` eigenspace of `Γ`. -/
def positiveSpinors {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V) : Submodule ℂ S :=
  LinearMap.ker (chirality Q ρ b - LinearMap.id)

/-- G2.1: the negative spinors `S⁻`, the `−1` eigenspace of `Γ`. -/
def negativeSpinors {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V) : Submodule ℂ S :=
  LinearMap.ker (chirality Q ρ b + LinearMap.id)

/-- G2.1: `S = S⁺ ⊕ S⁻` for a geometric action, by the projections `(Id ± Γ)/2`. -/
theorem isCompl_spinors {ℓ : ℕ} (b : OrthonormalBasis (Fin (2 * ℓ)) ℝ V)
    (h : IsGeometricAction Q ρ) :
    IsCompl (positiveSpinors Q ρ b) (negativeSpinors Q ρ b) := by
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

section QuaternionicKernelParity

variable {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]

/-- G6.7: a finite-dimensional complex space carrying a conjugate-linear `J` with `J² = −1` has
even complex dimension: in a basis `J` is `v ↦ A v̄` with `A Ā = −1`, so
`|det A|² = (−1)^(dim V)`. -/
theorem even_finrank_of_conjLinear_square_neg
    (J : V →ₛₗ[starRingEnd ℂ] V) (hsq : ∀ v, J (J v) = -v) :
    Even (Module.finrank ℂ V) := by
  classical
  let b := Module.finBasis ℂ V
  let A : Matrix (Fin (Module.finrank ℂ V)) (Fin (Module.finrank ℂ V)) ℂ :=
    fun i j => b.repr (J (b j)) i
  have hmatrix : A * A.map (starRingEnd ℂ) = -1 := by
    ext i j
    have h := congrArg (fun v => b.repr v i) (hsq (b j))
    have hsum : J (J (b j)) = ∑ k, star (b.repr (J (b j)) k) • J (b k) := by
      calc
        J (J (b j)) = J (∑ k, b.repr (J (b j)) k • b k) :=
          congrArg J (b.sum_repr (J (b j))).symm
        _ = _ := by simp only [map_sum, map_smulₛₗ, starRingEnd_apply]
    rw [hsum] at h
    change (∑ k, A i k * (starRingEnd ℂ) (A k j)) =
      -(1 : Matrix _ _ ℂ) i j
    simpa [A, map_sum, mul_comm, Matrix.one_apply,
      Finsupp.single_apply, eq_comm] using h
  have hd := congrArg Matrix.det hmatrix
  have heq : A.det * star A.det = (-1 : ℂ) ^ Module.finrank ℂ V := by
    have hmap : (A.map (starRingEnd ℂ)).det = star A.det := by
      simpa only [RingHom.mapMatrix_apply, starRingEnd_apply] using
        ((starRingEnd ℂ).map_det A).symm
    rw [Matrix.det_mul, hmap, Matrix.det_neg,
      Matrix.det_one, mul_one] at hd
    simpa only [Fintype.card_fin, starRingEnd_apply] using hd
  by_contra hnot
  have hodd : Odd (Module.finrank ℂ V) := Nat.not_even_iff_odd.mp hnot
  rw [hodd.neg_one_pow] at heq
  have hr := congrArg Complex.re heq
  simp only [Complex.star_def, Complex.mul_conj, Complex.ofReal_re,
    Complex.neg_re, Complex.one_re] at hr
  have hp := Complex.normSq_nonneg A.det
  linarith

end QuaternionicKernelParity

end TauCetiRoadmap.SpinGeometry
