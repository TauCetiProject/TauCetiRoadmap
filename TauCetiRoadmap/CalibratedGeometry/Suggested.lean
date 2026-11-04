import Mathlib

/-!
# Calibrated geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib, each with `sorry`, together with the few
definitions they need, on native continuous alternating maps, orthonormal families and norm
determinants.

Headline theorems of the roadmap that are not statable at the pins:

* the fundamental theorem of calibrations (a calibrated compact oriented submanifold has least
  volume among competitors differing from it by the boundary of an integral smooth chain, Layer 3):
  the pins have no differential forms on manifolds, no exterior derivative of such forms and no
  integration of forms over smooth chains or submanifolds;
* calibration, minimality and the homological volume bound for complex submanifolds of Kähler
  manifolds and for special Lagrangian submanifolds of Kähler manifolds with a normalized parallel
  holomorphic volume form (Layers 4 and 5): the pins have no Kähler manifolds, no holomorphic volume
  forms and no calibrated submanifolds;
* McLean's theorem that the special Lagrangian deformations of a compact special Lagrangian form a
  smooth manifold of dimension `b₁(N)` (Layer 6): the pins have no space of nearby submanifolds
  modulo reparametrization, no harmonic forms and no de Rham cohomology of a manifold;
* the special Lagrangian second-variation formula `δ²Vol(V) = ∫_N (|dβ|² + |δβ|²)` and the
  identification of the Jacobi operator with the Hodge Laplacian on one-forms (Layer 6): the pins
  have no normal bundle of a submanifold, no Hodge star or codifferential on a manifold and no
  integration of forms over a submanifold.
-/

noncomputable section

namespace TauCetiRoadmap.CalibratedGeometry

/-! ## Layer 1: Comass and equality planes -/

/-- The `k`-dimensional volume of the parallelepiped spanned by a frame `v` in a real
inner-product space: the norm determinant of the linear map `ℝᵏ → E` sending the standard basis
to `v`. It is `sqrt (det (gram v))`, and it vanishes exactly when `v` is linearly dependent. -/
def frameVolume {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {k : ℕ}
    (v : Fin k → E) : ℝ :=
  LinearMap.normDet ((EuclideanSpace.basisFun (Fin k) ℝ).toBasis.constr ℝ v)

/-- An ordered frame `v` is calibrated by the `k`-form `φ` when it is orthonormal and `φ v = 1`;
for a form of comass at most one these are the positively oriented equality planes of `φ`. -/
def IsCalibratedFrame {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {k : ℕ}
    (φ : E [⋀^Fin k]→L[ℝ] ℝ) (v : Fin k → E) : Prop :=
  Orthonormal ℝ v ∧ φ v = 1

/-- Comass equals the native norm: on a finite-dimensional real inner-product space, the operator
norm of a continuous alternating `k`-form is the supremum of `|φ v|` over orthonormal frames `v`
(for `k > dim E` both sides are zero, and for `k = 0` both are `|φ ![]|`). -/
theorem norm_eq_sSup_abs_orthonormal {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] {k : ℕ} (φ : E [⋀^Fin k]→L[ℝ] ℝ) :
    ‖φ‖ = sSup {r | ∃ v : Fin k → E, Orthonormal ℝ v ∧ r = |φ v|} := by
  sorry

/-- The linear calibration inequality: `|φ v| ≤ ‖φ‖ · vol(v)` for every frame `v`, including
linearly dependent frames, where both sides of the volume factor vanish. -/
theorem abs_eval_le_norm_mul_frameVolume {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {k : ℕ}
    (φ : E [⋀^Fin k]→L[ℝ] ℝ) (v : Fin k → E) :
    |φ v| ≤ ‖φ‖ * frameVolume v := by
  sorry

/-! ## Layer 4: Hermitian linear algebra and Kähler calibrations -/

/-- The standard Kähler form `ω = Σ_j dx_j ∧ dy_j` on `ℂⁿ`, with `z_j = x_j + i y_j`, as a real
continuous alternating 2-form: `ω(v, w) = Im ⟪v, w⟫_ℂ` for the Hermitian product conjugate-linear
in its first slot. -/
def standardKahlerForm (n : ℕ) : EuclideanSpace ℂ (Fin n) [⋀^Fin 2]→L[ℝ] ℝ where
  toFun v := (inner ℂ (v 0) (v 1)).im
  map_update_add' m i x y := by
    fin_cases i <;> simp
  map_update_smul' m i c x := by
    fin_cases i <;> simp [← Complex.coe_smul, mul_comm]
  cont := Complex.continuous_im.comp ((continuous_apply 0).inner (continuous_apply 1))
  map_eq_zero_of_eq' v i j hv hij := by
    fin_cases i <;> fin_cases j <;> simp_all [← Complex.ofReal_pow]

/-- The Wirtinger inequality in degree two: for `n ≥ 1` the standard Kähler form on `ℂⁿ` has
comass one (Cauchy–Schwarz for the Hermitian product; Harvey–Lawson 1982, Theorem II.6.11, p. 70,
for `p = 1`). -/
theorem norm_standardKahlerForm (n : ℕ) (hn : 1 ≤ n) : ‖standardKahlerForm n‖ = 1 := by
  sorry

/-- The equality case of the Wirtinger inequality in degree two: an ordered pair `(v, w)` in `ℂⁿ`
is calibrated by `ω` exactly when `v` is a unit vector and `w = i v`, that is, when it is a
positively oriented orthonormal frame of a complex line with its complex orientation. -/
theorem isCalibratedFrame_standardKahlerForm_iff (n : ℕ) (v : Fin 2 → EuclideanSpace ℂ (Fin n)) :
    IsCalibratedFrame (standardKahlerForm n) v ↔ ‖v 0‖ = 1 ∧ v 1 = Complex.I • v 0 := by
  sorry

/-- The Kähler bivector `ω̂ = Σ_j e_j ∧ i e_j` in the real exterior square of `ℂⁿ`, the metric dual
of the standard Kähler form: `⟪ω̂, v ∧ w⟫ = Im ⟪v, w⟫_ℂ` for the Gram inner product on
`⋀[ℝ]^2`. -/
def kahlerBivector (n : ℕ) : ⋀[ℝ]^2 (EuclideanSpace ℂ (Fin n)) :=
  ∑ j, exteriorPower.ιMulti ℝ 2
    ![EuclideanSpace.single j 1, Complex.I • EuclideanSpace.single j 1]

/-- The normalized Kähler power `ωʳ/r!` on `ℂⁿ` as a real continuous alternating `2r`-form:
`v ↦ ⟪ω̂ʳ, v₀ ∧ ⋯ ∧ v_(2r−1)⟫ / r!`, where `ω̂ʳ` is the `r`-th power of `kahlerBivector n` in the
exterior algebra and the pairing is the Gram inner product on `⋀[ℝ]^(2r)`. -/
def kahlerPowerForm (n r : ℕ) : EuclideanSpace ℂ (Fin n) [⋀^Fin (2 * r)]→L[ℝ] ℝ :=
  let ωr : ⋀[ℝ]^(2 * r) (EuclideanSpace ℂ (Fin n)) :=
    ⟨(kahlerBivector n : ExteriorAlgebra ℝ (EuclideanSpace ℂ (Fin n))) ^ r, by
      simpa [pow_mul] using Submodule.pow_mem_pow _ (kahlerBivector n).2 r⟩
  let A : EuclideanSpace ℂ (Fin n) [⋀^Fin (2 * r)]→ₗ[ℝ] ℝ :=
    ((r.factorial : ℝ)⁻¹ • innerₛₗ ℝ ωr).compAlternatingMap (exteriorPower.ιMulti ℝ (2 * r))
  { toAlternatingMap := A
    cont := by
      -- expand each argument in a basis: `A` is a finite sum of products of coordinates
      let b := Module.finBasis ℝ (EuclideanSpace ℂ (Fin n))
      let f := A.toMultilinearMap
      have h : ∀ m, f m = ∑ s : Fin (2 * r) → Fin (Module.finrank ℝ (EuclideanSpace ℂ (Fin n))),
          (∏ i, b.repr (m i) (s i)) • f (fun i => b (s i)) := by
        intro m
        conv_lhs => rw [show m = fun i => ∑ j, b.repr (m i) j • b j from
          funext fun i => (b.sum_repr (m i)).symm]
        rw [MultilinearMap.map_sum]
        simp [MultilinearMap.map_smul_univ]
      change Continuous (f : (Fin (2 * r) → EuclideanSpace ℂ (Fin n)) → ℝ)
      rw [show (f : (Fin (2 * r) → EuclideanSpace ℂ (Fin n)) → ℝ) = fun m => ∑ s : Fin (2 * r) →
          Fin (Module.finrank ℝ (EuclideanSpace ℂ (Fin n))),
          (∏ i, b.repr (m i) (s i)) • f (fun i => b (s i)) from funext h]
      have hc : ∀ j, Continuous fun x : EuclideanSpace ℂ (Fin n) => b.repr x j :=
        fun j => (b.coord j).continuous_of_finiteDimensional
      fun_prop }

/-- The real frame `(u₀, i u₀, u₁, i u₁, …)` of the complex span of `u`, ordered so that it carries
the complex orientation. -/
def complexRealFrame {n r : ℕ} (u : Fin r → EuclideanSpace ℂ (Fin n)) :
    Fin (2 * r) → EuclideanSpace ℂ (Fin n) :=
  fun i => (if (i : ℕ) % 2 = 0 then (1 : ℂ) else Complex.I) • u ⟨(i : ℕ) / 2, by omega⟩

/-- The Wirtinger inequality in every degree: for `r ≤ n` the normalized Kähler power `ωʳ/r!` on
`ℂⁿ` has comass one (Harvey–Lawson 1982, Theorem II.6.11 and Lemma II.6.13, p. 70; McLean1998
lines 37–48). -/
theorem norm_kahlerPowerForm (n r : ℕ) (hr : r ≤ n) : ‖kahlerPowerForm n r‖ = 1 := by
  sorry

/-- The equality case of the Wirtinger inequality in every degree: an ordered real frame `v` of
`2r` vectors in `ℂⁿ` is calibrated by `ωʳ/r!` exactly when it is real-orthonormal and spans the same
oriented real `2r`-plane as the frame `(u₀, i u₀, …, u_(r−1), i u_(r−1))` of some complex-orthonormal
family `u`, that is, when it is a positively oriented orthonormal frame of a complex `r`-plane with
its complex orientation. -/
theorem isCalibratedFrame_kahlerPowerForm_iff (n r : ℕ)
    (v : Fin (2 * r) → EuclideanSpace ℂ (Fin n)) :
    IsCalibratedFrame (kahlerPowerForm n r) v ↔
      Orthonormal ℝ v ∧ ∃ u : Fin r → EuclideanSpace ℂ (Fin n), Orthonormal ℂ u ∧
        exteriorPower.ιMulti ℝ (2 * r) v = exteriorPower.ιMulti ℝ (2 * r) (complexRealFrame u) := by
  sorry

/-! ## Layer 5: Special Lagrangian geometry -/

/-- The complex volume form `Ω = dz₁ ∧ ⋯ ∧ dzₙ` on `ℂⁿ` as a real continuous alternating
`n`-form with values in `ℂ`: `Ω v` is the determinant of the complex matrix whose rows are the
coordinate vectors of `v`. -/
def standardComplexVolume (n : ℕ) : EuclideanSpace ℂ (Fin n) [⋀^Fin n]→L[ℝ] ℂ :=
  ContinuousAlternatingMap.restrictScalars ℝ
    { toAlternatingMap := (Matrix.detRowAlternating : (Fin n → ℂ) [⋀^Fin n]→ₗ[ℂ] ℂ).compLinearMap
        (WithLp.linearEquiv 2 ℂ (Fin n → ℂ)).toLinearMap
      cont := by
        refine Continuous.matrix_det (continuous_pi fun i => ?_)
        exact (PiLp.continuous_ofLp 2 _).comp (continuous_apply i) }

/-- The special Lagrangian form of phase `θ` on `ℂⁿ`: `φ_θ v = Re (e^(−iθ) Ω v)`. -/
def standardSpecialLagrangianForm (n : ℕ) (θ : ℝ) :
    EuclideanSpace ℂ (Fin n) [⋀^Fin n]→L[ℝ] ℝ :=
  (Complex.reCLM.comp (ContinuousLinearMap.mul ℝ ℂ (Complex.exp (-(θ : ℂ) * Complex.I))))
    |>.compContinuousAlternatingMap (standardComplexVolume n)

/-- For `n ≥ 1` the special Lagrangian form of every phase has comass one
(Harvey–Lawson 1982, Theorem III.1.10, p. 89; the real plane is calibrated by `Re Ω`,
Joyce2001SLLectures line 90). -/
theorem norm_standardSpecialLagrangianForm (n : ℕ) (hn : 1 ≤ n) (θ : ℝ) :
    ‖standardSpecialLagrangianForm n θ‖ = 1 := by
  sorry

/-- The equality planes of the special Lagrangian form: a real-orthonormal ordered frame `v` of
`n` vectors in `ℂⁿ` satisfies `φ_θ v = 1` exactly when it spans a Lagrangian plane
(`Im ⟪v i, v j⟫_ℂ = 0` for all `i, j`), `Im (e^(−iθ) Ω v) = 0`, and the orientation is positive,
`Re (e^(−iθ) Ω v) > 0` (Harvey–Lawson 1982, Cor. III.1.11; Joyce2001SLLectures line 96 and
line 107, Propositions 2.3 and 2.4, for `θ = 0`). -/
theorem specialLagrangianFrame_iff (n : ℕ) (hn : 1 ≤ n) (θ : ℝ)
    (v : Fin n → EuclideanSpace ℂ (Fin n)) (hv : Orthonormal ℝ v) :
    standardSpecialLagrangianForm n θ v = 1 ↔
      (∀ i j, (inner ℂ (v i) (v j)).im = 0) ∧
      (Complex.exp (-(θ : ℂ) * Complex.I) * standardComplexVolume n v).im = 0 ∧
      0 < (Complex.exp (-(θ : ℂ) * Complex.I) * standardComplexVolume n v).re := by
  sorry

end TauCetiRoadmap.CalibratedGeometry
