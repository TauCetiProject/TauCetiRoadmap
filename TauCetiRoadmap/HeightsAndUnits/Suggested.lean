import Mathlib
import TauCeti.NumberTheory.EffectiveBounds.Regulator
import TauCetiRoadmap.DiophantineApproximationAndTranscendence.Suggested

/-!
# Heights, units and S-units of number fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`, which numbers the milestones as Layer `n.m`. The declarations below suggest Lean forms
for particular milestones, so that contributors and reviewers converge on names and signatures;
discharging all of them finishes neither a layer nor the roadmap. `sorry` marks goals, not results.

The height foundation is DiophantineApproximationAndTranscendence's, imported here and used
directly: `absoluteProjectiveTupleHeight`, `absoluteLogHeightAff`, `matrixMulHeight`,
`arakelovMulHeight`, `plucker`, `relativeSubspaceHeight`, `relativeSubspaceArakelovHeight` and
`subspaceHeight`. Successive minima and Minkowski's second theorem belong to
GeometryOfNumbersAndQuadraticArithmetic, an open TauCetiRoadmap pull request; the milestones stated
against its `successiveMin` (Layer 2.1's minima form, 2.2's geometric half, 3.3's Minkowski step)
are in the README only, and this file states their lattice-algebra and arithmetic halves. The
rank-zero regulator is Tau Ceti's `NumberField.Units.regulator_eq_one_of_rank_eq_zero`, imported
and used as a check.
-/

noncomputable section

namespace TauCetiRoadmap.HeightsAndUnits

open Finset Module NumberField
open scoped NumberField IntermediateField
open TauCetiRoadmap.DiophantineApproximationAndTranscendence.DiophantineApproximation

/-! ## Layer 0: affine heights and the value bounds -/

section Affine

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {ι : Type*}

/-- **Layer 0.1.** The affine height of a tuple, the projective height of `(1, x)`. It is not
invariant under scaling, which is what makes non-homogeneous quantities boundable by it. -/
def mulHeightAff (x : ι → K) : ℝ :=
  Height.mulHeight fun o : Option ι ↦ o.elim 1 x

/-- The logarithmic affine height. -/
def logHeightAff (x : ι → K) : ℝ :=
  Real.log (mulHeightAff x)

variable [Finite ι]

theorem one_le_mulHeightAff (x : ι → K) : 1 ≤ mulHeightAff x := by sorry

/-- The projective height is at most the affine one. -/
theorem mulHeight_le_mulHeightAff (x : ι → K) : Height.mulHeight x ≤ mulHeightAff x := by sorry

/-- Each coordinate is bounded by the affine height; this fails for the projective height. -/
theorem mulHeight₁_le_mulHeightAff (x : ι → K) (i : ι) :
    Height.mulHeight₁ (x i) ≤ mulHeightAff x := by sorry

theorem mulHeightAff_comp_le {ι' : Type*} [Finite ι'] (f : ι → ι') (x : ι' → K) :
    mulHeightAff (x ∘ f) ≤ mulHeightAff x := by sorry

theorem mulHeightAff_zero : mulHeightAff (0 : ι → K) = 1 := by sorry

/-- On a one-element tuple the affine height is Mathlib's `mulHeight₁`. -/
theorem mulHeightAff_fin_one (x : K) : mulHeightAff ![x] = Height.mulHeight₁ x := by sorry

end Affine

/-- The affine height is not scaling-invariant: `![1]` and `![2]` over `ℚ`. -/
theorem exists_mulHeightAff_smul_ne :
    ∃ (c : ℚ) (x : Fin 1 → ℚ), c ≠ 0 ∧ mulHeightAff (c • x) ≠ mulHeightAff x := by sorry

/-- The bridge to DiophantineApproximationAndTranscendence's absolute affine height, which
prepends the coordinate `1` where this one appends it. -/
theorem absoluteLogHeightAff_comp_eq {K : Type*} [Field K] [NumberField K] {n : ℕ}
    (f : K →+* AlgebraicClosure ℚ) (x : Fin n → K) :
    absoluteLogHeightAff (f ∘ x) = logHeightAff x / Module.finrank ℚ K := by sorry

section ValueBounds

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K]

/-- **Layer 0.2.** The value of a linear form, bounded by the affine heights of its coefficients
and of its argument; no bound in the projective heights exists. -/
theorem mulHeight₁_sum_mul_le {ι : Type*} [Fintype ι] [Nonempty ι] (a x : ι → K) :
    Height.mulHeight₁ (∑ i, a i * x i) ≤
      (Fintype.card ι : ℝ) ^ Height.totalWeight K * (mulHeightAff a * mulHeightAff x) := by sorry

/-- The determinant, columnwise, from the Leibniz expansion and the signed tuple sum bound of
DiophantineApproximationAndTranscendence §1.3. -/
theorem mulHeight₁_det_le {n : Type*} [Fintype n] [DecidableEq n] (A : Matrix n n K) :
    Height.mulHeight₁ A.det ≤
      ((Fintype.card n).factorial : ℝ) ^ Height.totalWeight K *
        ∏ j, mulHeightAff fun i ↦ A i j := by sorry

end ValueBounds

/-- No bound on the determinant in the matrix height: a `1 × 1` matrix has height one. -/
theorem exists_not_mulHeight₁_det_le (c : ℝ) :
    ∃ A : Matrix (Fin 1) (Fin 1) ℚ, ¬ Height.mulHeight₁ A.det ≤ c * matrixMulHeight A := by sorry

/-- **Layer 0.3.** The Arakelov height of the entries is submultiplicative, with constant one and
no nonemptiness hypothesis. -/
theorem arakelovMulHeight_entries_mul_le {K : Type*} [Field K] [NumberField K]
    {m n p : Type*} [Fintype m] [Fintype n] [Fintype p] (A : Matrix m n K) (B : Matrix n p K) :
    arakelovMulHeight (fun q : m × p ↦ (A * B) q.1 q.2) ≤
      arakelovMulHeight (fun q : m × n ↦ A q.1 q.2) *
        arakelovMulHeight (fun q : n × p ↦ B q.1 q.2) := by sorry

/-- The sup-norm product constant `2 ^ totalWeight ℚ` is attained. -/
example :
    let A : Matrix (Fin 1) (Fin 2) ℚ := !![1, 1]
    let B : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 1, 1]
    matrixMulHeight (A * B) = 2 ∧ matrixMulHeight A = 1 ∧ matrixMulHeight B = 1 := by sorry

/-! ## Layer 1: Northcott instances and Kronecker's theorem -/

section Northcott

variable {K : Type*} [Field K] [Height.AdmissibleAbsValues K] {ι : Type*} [Finite ι]

/-- The ratio of two coordinates is bounded by the height of the tuple. -/
theorem mulHeight₁_div_le_mulHeight (x : ι → K) (i j : ι) :
    Height.mulHeight₁ (x i / x j) ≤ Height.mulHeight x := by sorry

/-- The affine chart of a projective point at a chosen nonvanishing coordinate. -/
theorem exists_rep_apply_eq_one_of_ne_zero (P : Projectivization K (ι → K)) {i : ι}
    (hi : P.rep i ≠ 0) :
    ∃ (v : ι → K) (hv : v ≠ 0), v i = 1 ∧ (∀ j, v j = P.rep j / P.rep i) ∧
      Projectivization.mk K v hv = P := by sorry

/-- **Layer 1.1.** Northcott on projective space, over any field whose `mulHeight₁` is Northcott. -/
instance instNorthcottProjectivizationMulHeight [Northcott (Height.mulHeight₁ (K := K))] :
    Northcott (Projectivization.mulHeight (K := K) (ι := ι)) := by sorry

instance instNorthcottProjectivizationLogHeight [Northcott (Height.mulHeight₁ (K := K))] :
    Northcott (Projectivization.logHeight (K := K) (ι := ι)) := by sorry

end Northcott

section NorthcottSubspace

variable {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- The reverse comparison on the Plücker vector, the upper half of
DiophantineApproximationAndTranscendence's `arakelovMulHeight_sup_comparison`; the binomial
coefficient counts the Plücker coordinates. It carries Northcott to `relativeSubspaceHeight`. -/
theorem relativeSubspaceArakelovHeight_le (T : Submodule K (ι → K)) :
    relativeSubspaceArakelovHeight T ≤
      ((Fintype.card ι).choose (finrank K T) : ℝ) ^ ((finrank ℚ K : ℝ) / 2) *
        relativeSubspaceHeight T := by sorry

/-- **Layer 1.2.** Northcott for subspaces, with no rank condition. -/
instance instNorthcottRelativeSubspaceHeight :
    Northcott (relativeSubspaceHeight (K := K) (ι := ι)) := by sorry

instance instNorthcottRelativeSubspaceArakelovHeight :
    Northcott (relativeSubspaceArakelovHeight (K := K) (ι := ι)) := by sorry

instance instNorthcottSubspaceHeight : Northcott (subspaceHeight (K := K) (ι := ι)) := by sorry

theorem northcott_log_subspaceHeight :
    Northcott fun T : Submodule K (ι → K) ↦ Real.log (subspaceHeight T) := by sorry

/-- What the instance is for: a subspace of least height with a given property. -/
example (P : Submodule K (ι → K) → Prop) (h : ∃ T, P T) :
    ∃ T, P T ∧ ∀ T', P T' → subspaceHeight T ≤ subspaceHeight T' := by sorry

end NorthcottSubspace

section Kronecker

variable {F : Type*} [Field F] [CharZero F]

/-- **Layer 1.3, Kronecker.** -/
theorem absMulHeight₁_eq_one_iff {x : F} (hx : IsIntegral ℚ x) :
    absMulHeight₁ x = 1 ↔ x = 0 ∨ ∃ n, 0 < n ∧ x ^ n = 1 := by sorry

/-- The tuple power law. -/
theorem absoluteProjectiveTupleHeight_pow {ι : Type*} [Fintype ι] (x : ι → F) (N : ℕ) :
    absoluteProjectiveTupleHeight (fun i ↦ x i ^ N) = absoluteProjectiveTupleHeight x ^ N := by
  sorry

/-- Projective Kronecker. -/
theorem absoluteProjectiveTupleHeight_eq_one_iff {ι : Type*} [Fintype ι] {x : ι → F}
    (hx0 : x ≠ 0) (hx : ∀ i, IsIntegral ℚ (x i)) :
    absoluteProjectiveTupleHeight x = 1 ↔
      ∀ i j, x j ≠ 0 → x i / x j = 0 ∨ ∃ n, 0 < n ∧ (x i / x j) ^ n = 1 := by sorry

/-- The height gap at bounded degree; the constant is ineffective. -/
theorem exists_pos_forall_le_absLogHeight₁ (D : ℕ) :
    ∃ c > 0, ∀ x : F, IsIntegral ℚ x → x ≠ 0 → Module.finrank ℚ ℚ⟮x⟯ ≤ D →
      (¬ ∃ n, 0 < n ∧ x ^ n = 1) → c ≤ absLogHeight₁ x := by sorry

end Kronecker

/-- The degree bound cannot be dropped: `2 ^ (1/N)`. -/
theorem forall_pos_exists_absLogHeight₁_lt (c : ℝ) (hc : 0 < c) :
    ∃ x : ℝ, IsIntegral ℚ x ∧ x ≠ 0 ∧ (¬ ∃ n, 0 < n ∧ x ^ n = 1) ∧ absLogHeight₁ x < c := by
  sorry

/-! ## Layer 2: a basis from the minima, and Bombieri–Vaaler in the sup norm -/

section MinimaBasis

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {B : Set E}

/-- Over `ℝ` a convex symmetric set is balanced; Mathlib has no lemma saying so. -/
theorem balanced_of_convex_of_neg_mem (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) :
    Balanced ℝ B := by sorry

/-- Absolute homogeneity of the gauge of a convex symmetric set: Mathlib's `gauge_smul` after
`balanced_of_convex_of_neg_mem`. -/
theorem gauge_smul_of_symmetric (hB₀ : Convex ℝ B) (hB : ∀ x ∈ B, -x ∈ B) (r : ℝ) (x : E) :
    gauge B (r • x) = |r| * gauge B x := by sorry

/-- **Layer 2.1, general form** (Cassels V Lemma 8). Any full independent family of lattice
vectors can be traded for a lattice basis at the stated cost. -/
theorem exists_basis_gauge_le [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L]
    (hB₀ : Convex ℝ B) (hB₁ : ∀ x ∈ B, -x ∈ B) (hB₂ : (interior B).Nonempty)
    {a : Fin (finrank ℝ E) → E} (haL : ∀ i, a i ∈ L) (ha : LinearIndependent ℝ a) :
    ∃ b : Module.Basis (Fin (finrank ℝ E)) ℤ L, ∀ j,
      gauge B ((b j : L) : E) ≤ max (gauge B (a j)) ((∑ i ∈ Finset.Iic j, gauge B (a i)) / 2) := by
  sorry

end MinimaBasis

/-- The cost of 2.1 against Minkowski's second theorem. -/
theorem prod_max_one_add_one_div_two (r : ℕ) :
    ∏ i : Fin r, max 1 ((((i : ℕ) : ℝ) + 1) / 2) = (r.factorial : ℝ) / 2 ^ (r - 1) := by sorry

section BombieriVaaler

variable {m : ℕ} {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- The gcd of the maximal minors of an integer matrix, through the Plücker coordinates. -/
def minorGcd (A : Matrix (Fin m) ι ℤ) : ℤ :=
  Finset.univ.gcd (plucker fun i j ↦ A i j)

theorem linearIndependent_rows_rat_iff (A : Matrix (Fin m) ι ℤ) :
    LinearIndependent ℚ (fun i j ↦ (A i j : ℚ)) ↔ (A * A.transpose).det ≠ 0 := by sorry

theorem one_le_minorGcd {A : Matrix (Fin m) ι ℤ}
    (hA : LinearIndependent ℚ fun i j ↦ (A i j : ℚ)) : 1 ≤ minorGcd A := by sorry

/-- **Layer 2.2, arithmetic identity.** The minor gcd times the height of the rational kernel is
the square root of the Gram determinant of the rows. -/
theorem minorGcd_mul_subspaceHeight_ker (A : Matrix (Fin m) ι ℤ)
    (hA : LinearIndependent ℚ fun i j ↦ (A i j : ℚ)) :
    (minorGcd A : ℝ) * subspaceHeight (LinearMap.ker (A.map ((↑) : ℤ → ℚ)).mulVecLin) =
      Real.sqrt ((A * A.transpose).det : ℝ) := by sorry

/-- `GL_m(ℤ)` invariance of the Bombieri–Vaaler bound. -/
theorem sqrt_det_div_minorGcd_unit_mul {U : Matrix (Fin m) (Fin m) ℤ} (hU : IsUnit U.det)
    (A : Matrix (Fin m) ι ℤ) :
    Real.sqrt (((U * A) * (U * A).transpose).det : ℝ) / (minorGcd (U * A) : ℝ) =
      Real.sqrt ((A * A.transpose).det : ℝ) / (minorGcd A : ℝ) := by sorry

/-- **Layer 2.2, an integral kernel basis.** A `ℤ`-basis of the whole integral kernel, at the
cost `k!/2^(k-1)` of Layer 2.1 over the bound for independent vectors. -/
theorem exists_basis_ker_prod_iSup_abs_le (A : Matrix (Fin m) ι ℤ)
    (hA : LinearIndependent ℚ fun i j ↦ (A i j : ℚ)) :
    ∃ b : Module.Basis (Fin (Fintype.card ι - m)) ℤ (LinearMap.ker A.mulVecLin),
      ∏ l, ((⨆ i, |(b l : ι → ℤ) i| : ℤ) : ℝ) ≤
        ((Fintype.card ι - m).factorial : ℝ) / 2 ^ (Fintype.card ι - m - 1) *
          (Real.sqrt ((A * A.transpose).det : ℝ) / (minorGcd A : ℝ)) := by sorry

/-- **Bombieri–Vaaler Theorem 2 over `ℤ`, sup-norm form.** An adapter of
DiophantineApproximationAndTranscendence's `siegelKernelBasis` at `K = ℚ`: divide each vector by
its content. The family need not span the integral kernel. -/
theorem exists_linearIndependent_mulVec_eq_zero_prod_iSup_abs_le (A : Matrix (Fin m) ι ℤ)
    (hA : LinearIndependent ℚ fun i j ↦ (A i j : ℚ)) :
    ∃ x : Fin (Fintype.card ι - m) → ι → ℤ, LinearIndependent ℤ x ∧ (∀ l, A.mulVec (x l) = 0) ∧
      (∀ l, Finset.univ.gcd (x l) = 1) ∧
      ∏ l, ((⨆ i, |x l i| : ℤ) : ℝ) ≤ Real.sqrt ((A * A.transpose).det : ℝ) / (minorGcd A : ℝ) := by
  sorry

/-- **Bombieri–Vaaler Theorem 1 over `ℤ`**, the smallest vector of the previous family. -/
theorem exists_ne_zero_mulVec_eq_zero_iSup_abs_le (A : Matrix (Fin m) ι ℤ)
    (hA : LinearIndependent ℚ fun i j ↦ (A i j : ℚ)) (hm : m < Fintype.card ι) :
    ∃ x : ι → ℤ, x ≠ 0 ∧ A.mulVec x = 0 ∧
      ((⨆ i, |x i| : ℤ) : ℝ) ≤
        (Real.sqrt ((A * A.transpose).det : ℝ) / (minorGcd A : ℝ)) ^
          ((Fintype.card ι : ℝ) - m)⁻¹ := by sorry

end BombieriVaaler

/-- Sharpness of Siegel's exponent: the system `B xᵢ = xᵢ₊₁`. -/
theorem exists_forall_pow_le_iSup_abs (m : ℕ) (B : ℤ) (hB : 1 ≤ B) :
    ∃ A : Matrix (Fin m) (Fin (m + 1)) ℤ, (∀ i j, |A i j| ≤ B) ∧
      ∀ x : Fin (m + 1) → ℤ, x ≠ 0 → A.mulVec x = 0 → B ^ m ≤ ⨆ i, |x i| := by sorry

/-- An independent family that is not a basis: for the row `(0, 0, 1)`, `(1, 1, 0)` and
`(1, -1, 0)` span a sublattice of index two of the integral kernel. -/
example : ¬ ∃ c : Fin 2 → ℤ,
    c 0 • ![(1 : ℤ), 1, 0] + c 1 • ![(1 : ℤ), -1, 0] = ![1, 0, 0] := by sorry

/-- A unimodular shear leaves the Gram determinant `3` and the minor gcd `1` unchanged. -/
example :
    let A : Matrix (Fin 2) (Fin 3) ℤ := !![1, 0, -1; 0, 1, -1]
    let U : Matrix (Fin 2) (Fin 2) ℤ := !![1, 1; 0, 1]
    (A * A.transpose).det = 3 ∧ ((U * A) * (U * A).transpose).det = 3 ∧
      minorGcd A = 1 ∧ minorGcd (U * A) = 1 := by sorry

/-- The row `(2, 2)`: Gram determinant `8`, minor gcd `2`; a row rescaling, not a unimodular
change. -/
example : minorGcd (!![2, 2] : Matrix (Fin 1) (Fin 2) ℤ) = 2 ∧
    ((!![2, 2] : Matrix (Fin 1) (Fin 2) ℤ) * (!![2, 2] : Matrix (Fin 1) (Fin 2) ℤ).transpose).det
      = 8 := by sorry

/-! ## Layer 3: heights of units and the regulator -/

section Units

open NumberField.Units NumberField.Units.dirichletUnitTheorem NumberField.InfinitePlace
open scoped Classical

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 3.1.** The height of a unit in the coordinates `logEmbedding` keeps, plus the size of
the coordinate it drops. -/
theorem two_mul_logHeight₁_eq_sum_abs_logEmbedding_add_abs_sum (u : (𝓞 K)ˣ) :
    2 * Height.logHeight₁ ((u : 𝓞 K) : K) =
      (∑ w : {w : InfinitePlace K // w ≠ w₀}, |logEmbedding K (Additive.ofMul u) w|) +
        |∑ w : {w : InfinitePlace K // w ≠ w₀}, logEmbedding K (Additive.ofMul u) w| := by sorry

/-- The tempting identity without the dropped coordinate holds exactly when `w₀ u = 1`. -/
theorem two_mul_logHeight₁_eq_sum_abs_logEmbedding_iff (u : (𝓞 K)ˣ) :
    2 * Height.logHeight₁ ((u : 𝓞 K) : K) =
        ∑ w : {w : InfinitePlace K // w ≠ w₀}, |logEmbedding K (Additive.ofMul u) w| ↔
      w₀ ((u : 𝓞 K) : K) = 1 := by sorry

theorem norm_logEmbedding_le_two_mul_logHeight₁ (u : (𝓞 K)ˣ) :
    ‖logEmbedding K (Additive.ofMul u)‖ ≤ 2 * Height.logHeight₁ ((u : 𝓞 K) : K) := by sorry

theorem logHeight₁_le_rank_mul_norm_logEmbedding (u : (𝓞 K)ˣ) :
    Height.logHeight₁ ((u : 𝓞 K) : K) ≤ rank K * ‖logEmbedding K (Additive.ofMul u)‖ := by sorry

theorem finite_setOf_logHeight₁_le (B : ℝ) :
    {u : (𝓞 K)ˣ | Height.logHeight₁ ((u : 𝓞 K) : K) ≤ B}.Finite := by sorry

/-- **Layer 3.2.** The torsion units are exactly the units of height one. -/
theorem absMulHeight₁_eq_one_iff_mem_torsion (u : (𝓞 K)ˣ) :
    absMulHeight₁ ((u : 𝓞 K) : K) = 1 ↔ u ∈ torsion K := by sorry

/-- A nonzero algebraic integer of height one is a unit. -/
theorem isUnit_of_absMulHeight₁_eq_one {x : 𝓞 K} (hx : x ≠ 0) (h : absMulHeight₁ (x : K) = 1) :
    IsUnit x := by sorry

theorem prod_absLogHeight₁_fundSystem_pos :
    0 < ∏ i, absLogHeight₁ ((fundSystem K i : 𝓞 K) : K) := by sorry

/-- Hadamard's inequality in the ℓ¹ norm of the rows, over any linearly ordered field. -/
theorem Matrix.abs_det_le_prod_sum_abs {R : Type*} [Field R] [LinearOrder R]
    [IsStrictOrderedRing R] {n : Type*} [Fintype n] [DecidableEq n] (M : Matrix n n R) :
    |M.det| ≤ ∏ i, ∑ j, |M i j| := by sorry

/-- **Layer 3.3, Hadamard's bound, for every fundamental system.** -/
theorem regulator_le_prod_absLogHeight₁ {ε : Fin (rank K) → (𝓞 K)ˣ}
    (hε : Subgroup.closure (Set.range ε) ⊔ torsion K = ⊤) :
    regulator K ≤ (2 * finrank ℚ K : ℝ) ^ rank K * ∏ i, absLogHeight₁ ((ε i : 𝓞 K) : K) := by
  sorry

/-- The closed ℓ¹ unit ball of `logSpace K`. -/
def logBall (K : Type*) [Field K] [NumberField K] : Set (logSpace K) :=
  {x | ∑ w, |x w| ≤ 1}

theorem volume_logBall :
    MeasureTheory.volume (logBall K) =
      ENNReal.ofReal (2 ^ rank K / (rank K).factorial) := by sorry

/-- **Layer 3.3, a reduced fundamental system** (Bugeaud–Győry 1996, Lemma 1, `S = S_∞`). -/
theorem exists_fundSystem_prod_absLogHeight₁_le (K : Type*) [Field K] [NumberField K] :
    ∃ ε : Fin (rank K) → (𝓞 K)ˣ,
      Subgroup.closure (Set.range ε) ⊔ torsion K = ⊤ ∧
        ∏ i, absLogHeight₁ ((ε i : 𝓞 K) : K) ≤
          ((rank K).factorial : ℝ) ^ 2 / (2 ^ (rank K - 1) * (finrank ℚ K : ℝ) ^ rank K) *
            regulator K := by sorry

/-- The rank-zero case is Tau Ceti's, consumed rather than reproved: both bounds above have
empty products and agree with it. -/
example (h : rank K = 0) : regulator K = 1 := regulator_eq_one_of_rank_eq_zero K h

end Units

/-! ## Layer 4: S-integers, the S-unit theorem and the S-regulator -/

section SUnits

open IsDedekindDomain NumberField.Units NumberField.Units.dirichletUnitTheorem
open scoped Classical

variable {K : Type*} [Field K] [NumberField K]

/-- **Layer 4.1.** The finite-place dictionary. -/
theorem finitePlace_mk_apply_le_one_iff (v : HeightOneSpectrum (𝓞 K)) (x : K) :
    FinitePlace.mk v x ≤ 1 ↔ v.valuation K x ≤ 1 := by sorry

/-- The height of an `S`-integer is supported on `S` and the infinite places. -/
theorem mulHeight₁_eq_of_mem_integer {S : Set (HeightOneSpectrum (𝓞 K))} {x : K}
    (hx : x ∈ S.integer K) :
    Height.mulHeight₁ x =
      (∏ w : InfinitePlace K, max (w x) 1 ^ w.mult) * ∏ᶠ v ∈ S, max (FinitePlace.mk v x) 1 := by
  sorry

/-- The identity characterizes the `S`-integers. -/
theorem mulHeight₁_eq_iff_mem_integer (S : Set (HeightOneSpectrum (𝓞 K))) {x : K} (hx : x ≠ 0) :
    Height.mulHeight₁ x =
        (∏ w : InfinitePlace K, max (w x) 1 ^ w.mult) * ∏ᶠ v ∈ S, max (FinitePlace.mk v x) 1 ↔
      x ∈ S.integer K := by sorry

/-- **Layer 4.2.** The valuation map on `S`-units, in the shape of mathlib4#40791. -/
def Set.unitValuation (S : Set (HeightOneSpectrum (𝓞 K))) : S.unit K →* (S → Multiplicative ℤ) :=
  MonoidHom.pi fun v ↦ (v.1.valuationOfNeZero (K := K)).comp (S.unit K).subtype

/-- The `S`-unit theorem, under mathlib4#40791's name. -/
theorem Set.unit_finrank_numberField {S : Set (HeightOneSpectrum (𝓞 K))} (hS : S.Finite) :
    finrank ℤ (Additive (S.unit K)) = rank K + Nat.card S := by sorry

/-- A fundamental system of `S`-units. -/
theorem Set.exists_unit_fundSystem {S : Set (HeightOneSpectrum (𝓞 K))} (hS : S.Finite) :
    ∃ ε : Fin (rank K + Nat.card S) → S.unit K, ∀ x : S.unit K,
      ∃! ζe : CommGroup.torsion (S.unit K) × (Fin (rank K + Nat.card S) → ℤ),
        x = (ζe.1 : S.unit K) * ∏ i, ε i ^ ζe.2 i := by sorry

namespace SUnit

/-- **Layer 4.3.** The `S`-logarithmic space: the infinite places other than `w₀`, and `S`. -/
abbrev logSpace (S : Finset (HeightOneSpectrum (𝓞 K))) : Type _ :=
  ({w : InfinitePlace K // w ≠ w₀} ⊕ S) → ℝ

/-- The `S`-logarithmic embedding. -/
def logEmbedding (S : Finset (HeightOneSpectrum (𝓞 K))) :
    Additive ((S : Set (HeightOneSpectrum (𝓞 K))).unit K) →+ logSpace S where
  toFun x :=
    let y : K := ((Additive.toMul x : (S : Set (HeightOneSpectrum (𝓞 K))).unit K) : Kˣ)
    Sum.elim (fun w ↦ (w.1.mult : ℝ) * Real.log (w.1 y))
      (fun v ↦ Real.log (FinitePlace.mk v.1 y))
  map_zero' := by sorry
  map_add' := by sorry

/-- The product formula for `S`-units. -/
theorem sum_mult_mul_log_add_sum_log (S : Finset (HeightOneSpectrum (𝓞 K)))
    (x : (S : Set (HeightOneSpectrum (𝓞 K))).unit K) :
    (∑ w : InfinitePlace K, (w.mult : ℝ) * Real.log (w ((x : Kˣ) : K))) +
      ∑ v ∈ S, Real.log (FinitePlace.mk v ((x : Kˣ) : K)) = 0 := by sorry

/-- The `S`-unit lattice. -/
def unitLattice (S : Finset (HeightOneSpectrum (𝓞 K))) : Submodule ℤ (logSpace S) :=
  (logEmbedding S).range.toIntSubmodule

/-- Discreteness, from Northcott's theorem through 4.1. -/
instance (S : Finset (HeightOneSpectrum (𝓞 K))) : DiscreteTopology (unitLattice S) := by sorry

/-- Fullness, from Dirichlet's theorem and one class-group generator per place of `S`. -/
instance (S : Finset (HeightOneSpectrum (𝓞 K))) : IsZLattice ℝ (unitLattice S) := by sorry

/-- The `S`-regulator. -/
def regulator (S : Finset (HeightOneSpectrum (𝓞 K))) : ℝ :=
  ZLattice.covolume (unitLattice S)

theorem regulator_pos (S : Finset (HeightOneSpectrum (𝓞 K))) : 0 < regulator S := by sorry

/-- The kernel of the `S`-logarithmic embedding is the torsion, the `S`-analogue of Mathlib's
`logEmbedding_ker`: by the product formula, the height identity and Kronecker's theorem. -/
theorem logEmbedding_ker (S : Finset (HeightOneSpectrum (𝓞 K))) :
    (logEmbedding S).ker =
      (CommGroup.torsion ((S : Set (HeightOneSpectrum (𝓞 K))).unit K)).toAddSubgroup := by
  sorry

/-- The torsion-free quotient of the `S`-units is the `S`-unit lattice, through the map induced
by `logEmbedding S`. This connects Layer 4.2's quotient to Layer 4.3's lattice. -/
theorem exists_quotTorsionEquiv_unitLattice (S : Finset (HeightOneSpectrum (𝓞 K))) :
    ∃ e : (Additive ((S : Set (HeightOneSpectrum (𝓞 K))).unit K) ⧸
        Submodule.torsion ℤ (Additive ((S : Set (HeightOneSpectrum (𝓞 K))).unit K))) ≃ₗ[ℤ]
          unitLattice S,
      ∀ x, (e (Submodule.Quotient.mk x) : logSpace S) = logEmbedding S x := by sorry

/-- The fundamental systems of `S`-units are exactly the families whose logarithms form a
`ℤ`-basis of the `S`-unit lattice. -/
theorem isFundSystem_iff_basis (S : Finset (HeightOneSpectrum (𝓞 K))) {ι : Type*} [Fintype ι]
    (ε : ι → (S : Set (HeightOneSpectrum (𝓞 K))).unit K) :
    (Subgroup.closure (Set.range ε) ⊔ CommGroup.torsion _ = ⊤ ∧
        Fintype.card ι = rank K + S.card) ↔
      ∃ b : Module.Basis ι ℤ (unitLattice S),
        ∀ i, (b i : logSpace S) = logEmbedding S (Additive.ofMul (ε i)) := by sorry

/-- The `S`-regulator is the absolute determinant of the weighted logarithms of any fundamental
system, at the places other than any one omitted infinite place `w'`, in any column order `e`. -/
theorem regulator_eq_abs_det (S : Finset (HeightOneSpectrum (𝓞 K))) {ι : Type*} [Fintype ι]
    {ε : ι → (S : Set (HeightOneSpectrum (𝓞 K))).unit K}
    (hε : Subgroup.closure (Set.range ε) ⊔ CommGroup.torsion _ = ⊤)
    (w' : InfinitePlace K) (e : ι ≃ ({w : InfinitePlace K // w ≠ w'} ⊕ S)) :
    regulator S = |(Matrix.of fun i j ↦
      Sum.elim (fun w : {w : InfinitePlace K // w ≠ w'} ↦
          (w.1.mult : ℝ) * Real.log (w.1 ((ε i : Kˣ) : K)))
        (fun v : S ↦ Real.log (FinitePlace.mk v.1 ((ε i : Kˣ) : K))) (e j)).det| := by sorry

/-- At `S = ∅` the `S`-regulator is the regulator; a theorem, not an unfolding. -/
theorem regulator_empty :
    regulator (∅ : Finset (HeightOneSpectrum (𝓞 K))) = NumberField.Units.regulator K := by
  sorry

end SUnit

end SUnits

end TauCetiRoadmap.HeightsAndUnits
