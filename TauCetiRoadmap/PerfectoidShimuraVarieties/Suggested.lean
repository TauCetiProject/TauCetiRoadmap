import Mathlib
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Adjugate

/-! # PerfectoidShimuraVarieties: representative target signatures

The roadmap is README.md. This file records light definitions and theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs and is not exhaustive. The roadmap supplies
the geometric targets, exact hypotheses, source locators and checks.

The explicit choices are the genus-one multiplier identity, trace normalization
by the actual nonzero degree, the row-graph quotient frame, the determinant-scaled
inverse in the Hilbert level action, and the hypotheses of parabolic double-coset
cancellation. FiniteLevel, MatrixChart and Coefficients name the algebraic portions of
the corresponding geometric statements, with their coefficient hypotheses recorded
in README.md. The geometric Hasse charts, good triples, trace operators and Siegel
period towers use the shared objects of AutomorphicBundles B3.HT.2–5; the closed
toroidal Hodge-type tower uses B3.HT.6. Their identifications preserve finite-level
moduli, completed rings, boundary ideals, period maps and semilinear actions.
The rational Levi comparison uses B3.HT.7 with B0.3's opposite/dual identification
and the central-cocharacter Tate twist.
-/

/-! ## Layer 0: the genus-one similitude identity -/

namespace GSp
open Matrix

/-- Every invertible two-by-two matrix preserves the alternating form up to its determinant. -/
theorem gsp_genusOne (R : Type*) [CommRing R] (γ : GL (Fin 1 ⊕ Fin 1) R) :
    (γ : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R) * J (Fin 1) R *
      (γ : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R)ᵀ =
    (γ : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) R).det • J (Fin 1) R := sorry

/-- Check levelGamma0_similitude_not_det: the genus-two diagonal has multiplier -1
and determinant 1, so determinant congruence does not specify the multiplier. -/
example : let γ : Matrix (Fin 2 ⊕ Fin 2) (Fin 2 ⊕ Fin 2) ℤ :=
    fromBlocks 1 0 0 (-1)
    γ * J (Fin 2) ℤ * γᵀ = (-1 : ℤ) • J (Fin 2) ℤ ∧ γ.det = 1 := sorry

/-- At an odd prime the genus-two multiplier -1 does not reduce to 1. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    PadicInt.toZModPow (p := p) 1 (-1) ≠ 1 := sorry

/-- Check levelGamma1_not_cofinal: the upper unipotent remains in every Γ₁-level
but its unit upper-right entry survives reduction modulo p. -/
example (p : ℕ) [Fact p.Prime] (m : ℕ) :
    let γ : Matrix (Fin 1 ⊕ Fin 1) (Fin 1 ⊕ Fin 1) ℤ_[p] := fromBlocks 1 1 0 1
    γ * J (Fin 1) ℤ_[p] * γᵀ = J (Fin 1) ℤ_[p] ∧
      (γ (Sum.inl 0) (Sum.inl 0) = 1 ∧ γ (Sum.inr 0) (Sum.inl 0) = 0 ∧
       γ (Sum.inr 0) (Sum.inr 0) = 1) ∧
      PadicInt.toZModPow m (γ (Sum.inl 0) (Sum.inr 0)) = 1 ∧
      PadicInt.toZModPow 1 (γ (Sum.inl 0) (Sum.inr 0)) ≠ 0 := sorry

/-- Check levelGamma_m_zero: reduction at depth zero is the zero matrix ring,
whereas the identity at depth one still has diagonal entry 1. -/
example (p : ℕ) [Fact p.Prime] (γ : Matrix (Fin 2) (Fin 2) ℤ_[p]) :
    γ.map (PadicInt.toZModPow 0) = 0 ∧
      ((1 : Matrix (Fin 2) (Fin 2) ℤ_[p]).map (PadicInt.toZModPow 1)) 0 0 = 1 := by
  constructor
  · have : Subsingleton (ZMod (p ^ 0)) := by
      rw [pow_zero]
      infer_instance
    exact Subsingleton.elim _ _
  · simp

end GSp

/-! ## Layer 0.general: general-data and toroidal diamonds -/

/-- The transformed genus-two cusp ray fails the perfect-cone inequality. -/
example : let Q : Matrix (Fin 2) (Fin 2) ℤ := !![4, -2; -2, 1]
    Q = Matrix.vecMulVec (![2, -1] : Fin 2 → ℤ) (![2, -1] : Fin 2 → ℤ) ∧
      Q 1 1 < |Q 0 1| := by decide

/-! ## Layer 1: the Siegel construction -/

namespace SiegelTorsion.FiniteLevel

variable (K A : Type*) [Field K] [CharZero K] [CommRing A] [Algebra K A]
    [Module.Free K A] [Module.Finite K A] [Nontrivial A]

/-- Finite-algebra specialization of the normalized traces supplied by AutomorphicBundles
B3.HT.3 on the shared anticanonical tower: degree inverse times the ordinary trace.
Characteristic zero and nontriviality make this finite degree nonzero. -/
noncomputable def normalizedTrace : A →ₗ[K] K :=
  (Module.finrank K A : K)⁻¹ • Algebra.trace K A


/-- The trace divided by the extension degree retracts the scalar embedding. -/
theorem normalizedTrace_algebraMap (a : K) : normalizedTrace K A (algebraMap K A a) = a := sorry


/-- Test normalizedTrace_identity_level. -/
example (x : K) : normalizedTrace K K x = x := sorry

/-- Test normalizedTrace_not_unnormalized: a split degree-two algebra detects the factor. -/
example (a : K) : Algebra.trace K (K × K) (a, a) = 2 * a ∧
    normalizedTrace K (K × K) (a, a) = a := sorry


/-- Finite Kummer-algebra part of normalizedTrace_g1_monomial. In the free algebra
K[X]/(X^d-a), normalized trace projects monomials onto exponents divisible by d. -/
example (a : K) (d k : ℕ) (hd : 0 < d) :
    let f : Polynomial K := Polynomial.X ^ d - Polynomial.C a
    normalizedTrace K (AdjoinRoot f) ((AdjoinRoot.root f) ^ k) =
      if d ∣ k then a ^ (k / d) else 0 := sorry

end SiegelTorsion.FiniteLevel

/-! ## Layer 3: Hodge-type period maps and coefficients -/

namespace HodgeTate.MatrixChart

open Matrix

variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- The factor of automorphy `A + ZC` of `γ = (A B; C D)` at the chart point `Z`. -/
def chartFactor (A C Z : Matrix g g R) : Matrix g g R := A + Z * C

/-- The chart action `Z·γ = (A + ZC)⁻¹(B + ZD)`. -/
noncomputable def chartAction (A B C D Z : Matrix g g R) : Matrix g g R :=
  (chartFactor A C Z)⁻¹ * (B + Z * D)

/-- `(1 Z)γ = (A + ZC)(1  Z·γ)` whenever `A + ZC` is invertible. -/
theorem siegelGraphChart_act (A B C D Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    Matrix.fromCols (1 : Matrix g g R) Z * Matrix.fromBlocks A B C D =
      chartFactor A C Z * Matrix.fromCols 1 (chartAction A B C D Z) := sorry

/-- Check: `graph_factor_identity` (degenerate): for `γ = 1`, `A + ZC = 1` and `Z·γ = Z`. -/
example (Z : Matrix g g R) : chartFactor 1 0 Z = 1 ∧ chartAction 1 0 0 1 Z = Z := sorry

/-- Check: `graph_factor_g1` (computation): for `g = 1`,
`(1 z)γ = (a + zc)(1, (b + zd)/(a + zc))`. -/
example {K : Type*} [Field K] (a b c d z : K) (h : a + z * c ≠ 0) :
    chartFactor !![a] !![c] !![z] = !![a + z * c] ∧
      chartAction !![a] !![b] !![c] !![d] !![z] = !![(b + z * d) / (a + z * c)] := sorry

/-- Check: `graph_factor_cocycle` (characterisation): the factor of `γγ'` at `Z` is the factor
of `γ` at `Z` times the factor of `γ'` at `Z·γ`. -/
example (A B C D A' B' C' D' Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    chartFactor (A * A' + B * C') (C * A' + D * C') Z =
      chartFactor A C Z * chartFactor A' C' (chartAction A B C D Z) := sorry

/-- Check: `graph_unit_needs_iwahori` (non-example): for `g = 1`, `γ = (0 1; 1 0)` and `z = 0`
the factor `a + zc` is `0`, not a unit. -/
example {K : Type*} [Field K] : ¬ IsUnit (chartFactor (0 : Matrix (Fin 1) (Fin 1) K) 1 0).det := by
  simp [chartFactor]

/-- integral form: if `C ≡ 0 mod p` and `A` is invertible, then for every
integral `Z` the determinant of `A + ZC` is congruent to `det A` modulo `p`, hence a unit of
`ℤ_p`. -/
theorem det_factor_isUnit (p : ℕ) [Fact p.Prime] (A C Z : Matrix g g ℤ_[p])
    (hC : ∀ i j, PadicInt.toZMod (C i j) = 0) (hA : IsUnit A.det) :
    IsUnit (chartFactor A C Z).det ∧
      PadicInt.toZMod (chartFactor A C Z).det = PadicInt.toZMod A.det := sorry

end HodgeTate.MatrixChart

namespace HodgeTate.MatrixChart
open Matrix
variable {g : Type*} [Fintype g] [DecidableEq g] {R : Type*} [CommRing R]

/-- Symmetric-matrix portion of the Siegel chart; graphDistanceDomain supplies its pointwise distance subset, before its analytic affinoid realization. -/
def siegelGraphChart := {Z : Matrix g g R // Zᵀ = Z}

/-- The quotient frame represented by the row matrix `(1,Z)`, before analytic pullback. -/
def hodgeFrame (Z : Matrix g g R) : ((g ⊕ g) → R) →ₗ[R] (g → R) :=
  (fromCols 1 Z).mulVecLin


/-- Matrix part of hodgeFrame_transform. The W-dual frame and the Tate line's transported
linearization are distinct and are not silently identified with this quotient frame. -/
theorem hodgeFrame_transform (A B C D Z : Matrix g g R) (h : IsUnit (chartFactor A C Z).det) :
    (hodgeFrame Z).comp (fromBlocks A B C D).mulVecLin =
      (chartFactor A C Z).mulVecLin.comp (hodgeFrame (chartAction A B C D Z)) := sorry

/-- Test graph_chart_lagrangian: omitting symmetry would give nonisotropic row graphs. -/
example (Z : Matrix g g R) :
    fromCols (1 : Matrix g g R) Z * J g R * (fromCols (1 : Matrix g g R) Z)ᵀ = 0 ↔ Zᵀ = Z := sorry

/-- Test FL_parabolic_pinned, row-space obstruction: the same upper-parabolic coset
has distinct first rows. This witnesses why the pinned lower parabolic is essential. -/
example : let u : Matrix (Fin 2) (Fin 2) ℚ := !![1, 1; 0, 1]
    u 0 1 = 1 ∧ (1 : Matrix (Fin 2) (Fin 2) ℚ) 0 1 = 0 ∧ u 1 0 = 0 := by decide

/-- Conjugating a lower unipotent by the self-inverse Weyl matrix gives an upper
unipotent outside the lower parabolic, as in FL_left_right_inverse. -/
example : let u : Matrix (Fin 2) (Fin 2) ℚ := !![1, 0; 1, 1]
    let w : Matrix (Fin 2) (Fin 2) ℚ := !![0, 1; 1, 0]
    w * u * w⁻¹ = !![1, 1; 0, 1] ∧ (w * u * w⁻¹) 0 1 ≠ 0 := by
  dsimp
  have hw : (!![0, 1; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) * !![0, 1; 1, 0] = 1 := by
    ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_succ]
  rw [Matrix.inv_eq_left_inv hw]
  constructor
  · ext i j
    fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_succ]
  · norm_num [Matrix.mul_apply, Fin.sum_univ_succ]

/-- The zero-chart quotient frame sends the first basis vector to 1. -/
example : hodgeFrame (0 : Matrix (Fin 1) (Fin 1) ℚ)
    (Sum.elim ![1] ![0]) = ![1] := by
  ext i
  fin_cases i
  simp [hodgeFrame, Matrix.mulVec, dotProduct]

/-- The quotient frame at Z=2 has exactly the negative-graph kernel. -/
example (v : (Fin 1 ⊕ Fin 1) → ℚ) :
    v ∈ LinearMap.ker (hodgeFrame !![(2 : ℚ)]) ↔
      ∃ t : ℚ, v = Sum.elim ![-2 * t] ![t] := by
  rw [LinearMap.mem_ker]
  constructor
  · intro h
    have h0 := congrFun h 0
    simp [hodgeFrame, Matrix.mulVec, dotProduct] at h0
    refine ⟨v (Sum.inr 0), ?_⟩
    funext i
    rcases i with i | i
    · fin_cases i
      change v (Sum.inl 0) = -2 * v (Sum.inr 0)
      linarith
    · fin_cases i
      rfl
  · rintro ⟨t, rfl⟩
    ext i
    fin_cases i
    simp [hodgeFrame, Matrix.mulVec, dotProduct]

/-- The quotient frame at Z=2 sends (3,5) to 13 in the sum-indexed carrier. -/
example : hodgeFrame !![(2 : ℚ)] (Sum.elim ![3] ![5]) = ![13] := by
  ext i
  fin_cases i
  norm_num [hodgeFrame, Matrix.mulVec, dotProduct]

/-- Test hodge_frame_similitude, genus-one coefficient: the dual `W` factor is `a/c=1/d`.
This tests the additional multiplier, not a natural untwisted Tate linearization. -/
example {K : Type*} [Field K] (a d : K) (ha : a ≠ 0) (hd : d ≠ 0) :
    (a * d)⁻¹ * a = d⁻¹ := sorry

end HodgeTate.MatrixChart

namespace HodgeTate.MatrixChart
open Matrix
section PadicDistance
variable {g : Type*} [Fintype g] [DecidableEq g] (p : ℕ) [Fact p.Prime]
variable (K : Type*) [NormedField K] [NormedAlgebra ℚ_[p] K]

/-- Pointwise distance-to-integral domain over a normed p-adic extension. This is an actual
subset of matrices, not an analytic affinoid carrier. Distance is from all of `ℤ_p`. -/
def graphDistanceDomain (r : ℝ) : Set (Matrix g g K) :=
  {Z | Zᵀ = Z ∧ ∀ i j, Metric.infDist (Z i j)
    (Set.range (fun x : ℤ_[p] => algebraMap ℚ_[p] K (x : ℚ_[p]))) ≤ r}

/-- At radius zero, the compact embedded integral subset is recovered. Over an extension,
a norm-at-most-one element need not lie in the image of `ℤ_p`. -/
theorem graphDistanceDomain_zero (Z : Matrix g g K) :
    Z ∈ graphDistanceDomain p K 0 ↔ Zᵀ = Z ∧
      ∀ i j, ∃ x : ℤ_[p], algebraMap ℚ_[p] K (x : ℚ_[p]) = Z i j := sorry

/-- Pointwise stability of the distance domain. Strict Iwahori blocks are supplied
as their actual integral matrices; symmetry requires the GSp condition. -/
theorem siegelGraphChart_stable [Nonempty g] [IsUltrametricDist K]
    (r : ℝ) (hr : 0 < r) (hr1 : r ≤ 1)
    (γ : GL (g ⊕ g) ℤ_[p])
    (hγ : ∃ c : ℤ_[p]ˣ, (γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]) * J g ℤ_[p] *
      (γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p])ᵀ = (c : ℤ_[p]) • J g ℤ_[p] ∧
      PadicInt.toZMod (c : ℤ_[p]) = 1)
    (hdiag : ∀ i j, i ≠ j → PadicInt.toZMod
      ((γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]) i j) = 0)
    (A B C D : Matrix g g K)
    (hblocks : ((γ : Matrix (g ⊕ g) (g ⊕ g) ℤ_[p]).map
      (fun x => algebraMap ℚ_[p] K (x : ℚ_[p]))) = fromBlocks A B C D)
    (Z : Matrix g g K) (hZ : Z ∈ graphDistanceDomain p K r) :
    chartAction A B C D Z ∈ graphDistanceDomain p K r := sorry

/-- The zero graph belongs to every nonnegative radius domain. -/
example (r : ℝ) (hr : 0 ≤ r) : (0 : Matrix g g K) ∈ graphDistanceDomain p K r := sorry

/-- A negative radius excludes the zero graph when the matrix index is nonempty. -/
example (r : ℝ) (hr : r < 0) :
    (0 : Matrix (Fin 1) (Fin 1) ℚ_[p]) ∉ graphDistanceDomain p ℚ_[p] r := by
  intro h
  exact (not_le_of_gt hr) (Metric.infDist_nonneg.trans (h.2 0 0))

/-- Integral unit translations in genus one stay in the zero-radius domain. A disc
centered only at zero fails this test for a unit translation at radius less than one. -/
example (a : ℤ_[p]) :
    (!![algebraMap ℚ_[p] K (a : ℚ_[p])] : Matrix (Fin 1) (Fin 1) K) ∈
      graphDistanceDomain p K 0 := sorry

/-- All symmetric integral matrices belong to the zero-radius domain. -/
example (Z : Matrix g g ℤ_[p]) (hZ : Zᵀ = Z) :
    Z.map (fun x => algebraMap ℚ_[p] K (x : ℚ_[p])) ∈ graphDistanceDomain p K 0 := sorry

/-- Check graph_domain_not_disc: translation by p fixes the distance-to-integral
condition but leaves the disc centered at zero when its radius is less than |p|. -/
example (r : ℝ) (hr : 0 ≤ r) (hp : r < ‖(p : ℚ_[p])‖) :
    chartAction (1 : Matrix (Fin 1) (Fin 1) ℚ_[p]) !![(p : ℚ_[p])] 0 1 0 =
      !![(p : ℚ_[p])] ∧
    (!![(p : ℚ_[p])] : Matrix (Fin 1) (Fin 1) ℚ_[p]) ∈
      graphDistanceDomain p ℚ_[p] r ∧ ¬ ‖(p : ℚ_[p])‖ ≤ r := sorry

end PadicDistance
end HodgeTate.MatrixChart

/-! ## Layer 5: modular and Hilbert towers -/

/-- At odd primes at least 5, the modular test radius lies strictly below the bound. -/
example (p : ℕ) (hp : 5 ≤ p) : (1 : ℚ) / (4 * p) < 1 / (2 * p) := by
  have hp' : (0 : ℚ) < p := by exact_mod_cast (by omega : 0 < p)
  apply (div_lt_div_iff₀ (by positivity) (by positivity)).2
  nlinarith

/-- At p=3 the interior value is allowed and the odd-prime endpoint is excluded. -/
example : (0 : ℚ) ≤ 1 / 18 ∧ (1 : ℚ) / 18 < 1 / (3 * 3 ^ 1) ∧
    ¬ (1 : ℚ) / 9 < 1 / (3 * 3 ^ 1) := by norm_num

/-- At p=2 the inclusive endpoint equals 1/8. -/
example : (0 : ℚ) ≤ 1 / 8 ∧ (1 : ℚ) / 8 = 1 / (4 * 2 ^ 1) ∧
    (1 : ℚ) / 8 ≤ 1 / (4 * 2 ^ 1) := by norm_num

namespace HilbertTower.Coefficients
open Matrix
variable {R : Type*} [CommRing R]


/-- Matrix portion of the Hilbert level action: precompose the level map with `γ^∨`.
This is a left action; it lies over the right tower translation by `γ^∨`. -/
def levelAction (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) : Matrix (Fin 2) (Fin 2) R :=
  α * (TauCeti.adjugateGL γ : Matrix (Fin 2) (Fin 2) R)

/-- Left level changes compose in the order of matrix multiplication. -/
theorem levelAction_mul (γ δ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    levelAction (γ * δ) α = levelAction γ (levelAction δ α) := sorry

/-- The determinant pairing scales by the determinant under a level change. -/
theorem pairingCoefficient_level (γ : GL (Fin 2) R) (α : Matrix (Fin 2) (Fin 2) R) :
    (levelAction γ α).det = (γ : Matrix (Fin 2) (Fin 2) R).det * α.det := sorry

/-- Change of the target generator `β` to `uβ` divides its pairing coefficient by `u`. -/
def pairingChangeGenerator (u : Rˣ) (coefficient : R) : R := (u⁻¹ : Rˣ) * coefficient

/-- Changing the chosen torsion generator by a unit divides its pairing coordinate by that unit. -/
theorem pairingCoefficient_changeGenerator (u : Rˣ) (coefficient : R) :
    (u : R) * pairingChangeGenerator u coefficient = coefficient := sorry


/-- Test levelAction_adjugate: diagonal `(a,d)` dualizes to diagonal `(d,a)`. -/
example (γ : GL (Fin 2) R) (a d : R) (hγ : (γ : Matrix (Fin 2) (Fin 2) R) = !![a, 0; 0, d]) :
    (TauCeti.adjugateGL γ : Matrix (Fin 2) (Fin 2) R) = !![d, 0; 0, a] := sorry

/-- Test levelAction_vs_rightTranslation, matrix portion: the multiplier is the dual,
which is not `γ` for a nonscalar diagonal. -/
example : (6 : ℚ) • (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ)⁻¹ ≠
    (!![2, 0; 0, 3] : Matrix (Fin 2) (Fin 2) ℚ) := sorry


/-- The identity level change fixes every coefficient matrix. -/
example (α : Matrix (Fin 2) (Fin 2) R) : levelAction 1 α = α := sorry

/-- Rescaling the target generator by 2 changes the coordinate 6 to 3. -/
example : pairingChangeGenerator (Units.mk0 (2 : ℚ) (by norm_num)) 6 = 3 := by
  norm_num [pairingChangeGenerator]

/-- The identity generator change fixes every pairing coefficient. -/
example (a : R) : pairingChangeGenerator (1 : Rˣ) a = a := by
  simp [pairingChangeGenerator]

/-- Every generator change fixes the zero pairing coefficient. -/
example (u : Rˣ) : pairingChangeGenerator u (0 : R) = 0 := by
  simp [pairingChangeGenerator]

end HilbertTower.Coefficients

/-! ## Layer 6: general period maps and abelian descent -/

/-- The finite contracted-product model in §5.5 has invariant coordinate 2y+u. -/
example (y t : ZMod 2) (u : ZMod 4) :
    2 * ((y + t).val : ZMod 4) + (u - 2 * (t.val : ZMod 4)) =
      2 * (y.val : ZMod 4) + u := sorry

/-- The antidiagonal sign in §5.5 is detected by a group of odd order. -/
example : (1 + 1 : ZMod 3) + (0 - 1) = 1 + 0 ∧
    (1 + 1 : ZMod 3) + (0 + 1) ≠ 1 + 0 := by decide

/-- Changing the section by the nonzero element of Z/2 changes the fibre coordinate. -/
example (y : ZMod 2) : y + 1 ≠ y := by simp

/-- The identity torsor diagram of §6.5 has a diagonal fibre product. -/
example {G : Type*} [Group G] (x y : G) :
    x = y ↔ ∃! g : G, (g, g) = (x, y) := sorry

/-- A nontrivial smooth-surjective constant-group diagram has eight points. -/
example : let f : ZMod 4 →+* ZMod 2 := ZMod.castHom (by decide) (ZMod 2)
    Fintype.card {z : ZMod 4 × ZMod 4 // f z.1 = f z.2} = 8 := by decide

/-- The fibre-product group of §6.5 acts simply transitively by translations. -/
example : let f : ZMod 4 →+* ZMod 2 := ZMod.castHom (by decide) (ZMod 2)
    ∀ x y : ZMod 4 × ZMod 4, f x.1 = f x.2 → f y.1 = f y.2 →
      ∃! h : ZMod 4 × ZMod 4,
        f h.1 = f h.2 ∧ (x.1 + h.1, x.2 + h.2) = y := sorry

/-- The sections 1 and 2 of G_m in §6.5 have empty equaliser over Q. -/
example : ¬ ∃ u : ℚˣ, (u : ℚ) = 1 ∧ (u : ℚ) = 2 := by
  rintro ⟨u, h, h'⟩
  norm_num [h] at h'

/-- The component idempotent in §6.7 cuts out the first factor of a two-point space. -/
example {K : Type*} [Field K] (a b : K) :
    ((0, 1) : K × K) * (a, b) = 0 ↔ b = 0 := by simp

/-- Swapping two points in §6.7 has the diagonal invariant ring. -/
example {K : Type*} [Field K] (a b : K) : (a, b) = (b, a) ↔ a = b := by
  simp [eq_comm]

/-- The nontrivial two-orbit quotient in §6.7 is distinguished by parity. -/
example : ∀ a b : ZMod 4,
    (ZMod.castHom (by decide) (ZMod 2)) a = (ZMod.castHom (by decide) (ZMod 2)) b ↔
      b = a ∨ b = a + 2 := by decide

/-- The S3 induction Check in §6.7 uses S h, with S the nonnormal stabilizer of 0.
Mathlib's rightRel records equality of these left S-orbits. -/
example : let S := MulAction.stabilizer (Equiv.Perm (Fin 3)) (0 : Fin 3)
    let s := Equiv.swap (1 : Fin 3) 2
    let h := Equiv.swap (0 : Fin 3) 1
    s ∈ S ∧ QuotientGroup.rightRel S h (s * h) ∧
      ¬ QuotientGroup.rightRel S h (h * s) := by
  dsimp
  simp only [QuotientGroup.rightRel_apply, MulAction.mem_stabilizer_iff]
  decide

/-- A stabilizer element fixes the base coset while moving the two-point fibre. -/
example : let S := MulAction.stabilizer (Equiv.Perm (Fin 3)) (0 : Fin 3)
    let s := Equiv.swap (1 : Fin 3) 2
    QuotientGroup.rightRel S (1 : Equiv.Perm (Fin 3)) s ∧ s 1 = 2 := by
  dsimp
  simp only [QuotientGroup.rightRel_apply, MulAction.mem_stabilizer_iff]
  decide

/-- With S=1 the coset relation used by induction is equality. -/
example {G : Type*} [Group G] (h h' : G) :
    QuotientGroup.rightRel (⊥ : Subgroup G) h h' ↔ h = h' := by
  simp only [QuotientGroup.rightRel_apply, Subgroup.mem_bot, mul_inv_eq_one, eq_comm]

/-- The contracted relation preserves the coordinate y h when S=H. -/
example {G : Type*} [Group G] (y h s : G) :
    (y * s) * (s⁻¹ * h) = y * h := by group

/-- A noninvariant two-point map cannot descend through the quotient in §6.8. -/
example : (¬ ∃ f : Unit → Fin 2, ∀ y : Fin 2, f () = y) ∧
    (∃ f : Unit → Fin 2, ∀ _y : Fin 2, f () = 0) := by decide


/-! ### Conditional double-coset identity

The two factorizations of `H` are additional hypotheses. A rational Iwahori decomposition
does not supply them for a parabolic defined only over a splitting field.
-/

namespace AnalyticLevelGroup

/-- If `H` factors in both parabolic/opposite-unipotent orders and `t` lies in `P` and normalises the opposite subgroup, the parabolic part of `HtH` equals `(H∩P)t(H∩P)`. -/
theorem doubleCoset_inf_parabolic {G : Type*} [Group G] (P Ubar H : Subgroup G)
    (hPU : P ⊓ Ubar = ⊥) (t : G) (htP : t ∈ P) (ht : ∀ u ∈ Ubar, t⁻¹ * u * t ∈ Ubar)
    (hfac : ∀ h ∈ H, ∃ a ∈ H ⊓ P, ∃ b ∈ H ⊓ Ubar, h = a * b)
    (hfac' : ∀ h ∈ H, ∃ b ∈ H ⊓ Ubar, ∃ a ∈ H ⊓ P, h = b * a)
    {k k' : G} (hk : k ∈ H) (hk' : k' ∈ H) (hP : k * t * k' ∈ P) :
    ∃ a ∈ H ⊓ P, ∃ a' ∈ H ⊓ P, k * t * k' = a * t * a' := sorry

/-- The cancelled factors: with `t = 1`, `k = u` and `k' = u⁻¹` the product lies in every `P`,
whatever `u` is, so membership in `P` cannot force the factors to be `1`. -/
example {G : Type*} [Group G] (P : Subgroup G) (u : G) : u * 1 * u⁻¹ ∈ P := by simp

end AnalyticLevelGroup

/-- With `P` trivial and `H` and the opposite subgroup equal to `G`, the two factorizations
hold. For `t` different from `1` the parabolic-membership premise holds with `k = t⁻¹, k′ = 1`,
but the conclusion fails. Thus the condition `t ∈ P` is necessary. -/
example {G : Type*} [Group G] (t : G) (ht : t ≠ 1) :
    t⁻¹ * t * 1 ∈ (⊥ : Subgroup G) ∧
      ¬ (∃ a ∈ (⊥ : Subgroup G), ∃ a' ∈ (⊥ : Subgroup G),
        t⁻¹ * t * 1 = a * t * a') := by
  simp [Ne.symm ht]

/-- Opposite unipotent cancellation: nonidentity upper-unipotent elements can cancel.
Thus membership of a product in a parabolic cannot force both factors to be the identity. -/
example : (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) * !![1, -1; 0, 1] = 1 ∧
    (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) ℤ) ≠ 1 := by decide



/-! The following geometric definitions and their APIs remain in README.md:

Layer 0: GSp.gsp, similitude, reduce, levelGamma, levelGamma1, levelGamma0,
unitReductionKernel, similitude_spec, levelGamma_le_levelGamma1, levelGamma_normal,
levelGamma_cofinal, levelGamma_genusOne, similitude_levelGamma0,
and their group and cofinality APIs (§0.1); ShimuraTower.pLevel, pLevelMin, toMin, translate, primeToPHecke,
quotientAction, infiniteLevel, infiniteLevelMin, infiniteLevel.proj,
PerfectoidRepresentative (diamondIso, ofDiamondIso with perfectoid completed affinoid
uniformizations), neutralComponent,
neutralComponent.toFull, neutralSymmetry, connectedDatumTower, Rigidified
(quotientIso, infiniteLevel, trivial).
Layer 0.general: ShimuraTower.generalInfiniteLevel, toroidal,
toroidalInfiniteLevel (openEmbedding, toMin, refine).
Layer 1: SiegelTorsion.strictIwahori (§1.30), SiegelTorsion.integralMin, hasseDomain, finiteLevel, finiteLevel_hasse,
GoodTriple (of_hasse_chart, the shared predicate of AutomorphicBundles B3.HT.3),
SiegelTorsion.anticanonical,
anticanonical_integralModel, normalizedTrace and normalizedTrace_linear on completed tower rings,
htMapTop, htMap (the shared maps of AutomorphicBundles B3.HT.4), openTower. The completed trace Checks
normalizedTrace_g1_monomial and normalizedTrace_traceCompatibility are in §1.16.
Layer 2: HodgeTower.embedding, toSiegel, imageCompactification, minToImage.
Layer 3: HodgeTate.FL, leviTorsor, associatedBundle, associatedBundle_tensor,
the analytic siegelGraphChart, graphDistanceDomain and pulled-back hodgeFrame.
Layer 4: ShimuraTower.PropertyP, ConnectedPropertyP, propertyP_hodge.
Layer 5: HilbertTower.geometric, intermediate, arithmetic, beta1, beta2,
the geometric levelAction, polAction, weilPairing, weilPairing_arith, qpAction.
Layer 6: AbelianType.hodgeCover, lovering, deltaGroup; LevelGroup.mk;
BruhatTube.mk; the logarithmic, de Rham and Hodge–Tate torsors, the chosen universally open
toric cover (§6.0), arbitrary-data canonical association (§6.1a), finite-level truncated
period maps (§6.13a) and nonsplit Levi image (§6.13b).
-/
