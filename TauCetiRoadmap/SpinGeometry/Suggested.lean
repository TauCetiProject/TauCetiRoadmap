module
public import Mathlib

/-!
# Clifford bundles, spin structures, and Dirac geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each admitted with `sorry`,
together with the few definitions those statements need: the normalized scalar trace of a
finite real Clifford algebra (G1.3), the multiplicity space of a Clifford module and its
evaluation isomorphism (G1.3), the negative-metric Clifford relations and the chirality
decomposition of a Hermitian Clifford module (G1–G2), the frame independence of the Dirac
contraction (G6.1), and the parity theorem for conjugate-linear square roots of `−1` (G6.7).

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
