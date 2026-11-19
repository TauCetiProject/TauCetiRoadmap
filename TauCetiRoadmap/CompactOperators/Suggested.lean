import Mathlib

/-!
# Compact operators and nonarchimedean Fredholm theory: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the few definitions they
need, all with real bodies on native carriers.

The headline theorems stated here are:

* Serre's criterion over a complete ultrametric field: on model spaces row compactness is complete
  continuity (`isRowCompact_iff_isCompletelyContinuous`, README §0.5); on ultrametric Banach
  spaces compactoid image is complete continuity (`hasCompactoidImage_iff_isCompletelyContinuous`),
  and over a locally compact field complete continuity is Mathlib's compactness
  (`isCompletelyContinuous_iff_isCompactOperator`);
* row compactness implies complete continuity over a Banach–Tate ring
  (`IsRowCompact.isCompletelyContinuous`, README §0.2);
* the completed scalar extension of `c₀` (`c0_completedBaseChange`, README §1.7);
* the Fredholm determinant of a row-compact operator is entire (`charPowerSeries_isEntire`, README
  §1.3), with the uniform coefficient bound of README §1.2
  (`norm_charCoeff_mul_pow_le_of_rowNorm_le`) and the splitting along a commuting idempotent of
  README §1.6 (`charPowerSeries_eq_mul_of_comm`);
* `1 - a • u` is invertible exactly when the Fredholm determinant is a unit at `a`
  (`isUnit_one_sub_smul_iff`, README §2.5);
* the Riesz projector at a good zero (`exists_rieszProjection`, README §3.1) and the Fredholm
  property of `1 - a • u` over a field (`isFredholm_one_sub_smul`, README §3.2);
* Coleman's spectral mapping theorem (`charPowerSeries_eq_colemanDEntire`, README §3.3), with the
  convergence of the finite transforms (`tendsto_gaussNorm_colemanDBounded`);
* the exact coefficient norms from a dominant diagonal (`norm_charCoeff_of_unit_minors`, README
  §4.4).

The Riesz–Coleman decomposition of README §3.4 and the slope theorems of README §§4.2–4.3 are not
stated here. Their conclusions concern the Fredholm determinants of the finite projective summand
and of its complement, which are (Pr) modules rather than model spaces (README §1.5), and, for the
slope theorems, Newton polygons and eigenvalue multiplicities after extension of scalars; the
determinant defined in this file lives only on the model spaces `C₀(I, R)`.

`IsMultiplicative`, `PseudoUniformizer`, `IsTate`, `opNorm`, `single` and `matrixCoeff` write the
Banach–Tate data, the ring-scalar operator norm, the coordinate vectors and the output-first matrix
of PadicFunctionalAnalysis on native carriers; `opNorm` is definitionally Mathlib's operator norm
over a field (`opNorm_eq`). `IsEntire`, `evalAt` and `hasseEval` write the entire series,
evaluation and evaluated Hasse derivatives of RestrictedPowerSeries in the same way. A ring-scalar
bounded action on `C₀` is an explicit hypothesis where it is needed.
-/

namespace TauCetiRoadmap.CompactOperators

open Filter Topology
open scoped ZeroAtInfty Classical Polynomial

noncomputable section

/-! ## Conventions: supplier notions on native carriers -/

/-- An element `a` of a normed ring is multiplicative when left multiplication by it scales every
norm exactly: `‖a * x‖ = ‖a‖ * ‖x‖`. -/
def IsMultiplicative {R : Type*} [Norm R] [Mul R] (a : R) : Prop :=
  ∀ x, ‖a * x‖ = ‖a‖ * ‖x‖

/-- A multiplicative pseudo-uniformiser of a normed ring: a unit `ϖ` with `0 < ‖ϖ‖ < 1` by which
left multiplication scales the norm exactly. -/
structure PseudoUniformizer (R : Type*) [NormedRing R] where
  /-- The chosen unit. -/
  unit : Rˣ
  /-- Left multiplication by the unit scales the norm exactly. -/
  isMultiplicative : IsMultiplicative (unit : R)
  /-- The unit has positive norm. -/
  norm_pos : 0 < ‖(unit : R)‖
  /-- The unit has norm less than one. -/
  norm_lt_one : ‖(unit : R)‖ < 1

/-- A normed ring is a Banach–Tate ring for its norm when it has a multiplicative
pseudo-uniformiser (Convention 1 of the README; completeness is a separate hypothesis). -/
class IsTate (R : Type*) [NormedRing R] : Prop where
  /-- The norm admits a multiplicative pseudo-uniformiser. -/
  exists_pseudoUniformizer : Nonempty (PseudoUniformizer R)

/-- The operator norm of a continuous linear map between seminormed modules over a semiring: the
infimum of its uniform bounds. -/
def opNorm {R M N : Type*} [Semiring R] [SeminormedAddCommGroup M] [Module R M]
    [SeminormedAddCommGroup N] [Module R N] (u : M →L[R] N) : ℝ :=
  sInf {c | 0 ≤ c ∧ ∀ x, ‖u x‖ ≤ c * ‖x‖}

/-- Over a nontrivially normed field the ring-scalar operator norm is Mathlib's operator norm,
definitionally. -/
theorem opNorm_eq {K M N : Type*} [NontriviallyNormedField K]
    [NormedAddCommGroup M] [NormedSpace K M]
    [NormedAddCommGroup N] [NormedSpace K N] (u : M →L[K] N) :
    opNorm u = ‖u‖ := rfl

/-- The coordinate vector of `C₀(I, E)` on a discrete index type with value `x` at `i` and zero
elsewhere. -/
def single {I E : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [NormedAddCommGroup E] (i : I) (x : E) : C₀(I, E) :=
  ⟨⟨Pi.single i x, continuous_of_discreteTopology⟩, by
    rw [cocompact_eq_cofinite]
    apply tendsto_const_nhds.congr'
    filter_upwards [Filter.eventually_cofinite_ne i] with j hj
    simp [hj]⟩

/-- The output-first matrix of an operator between model spaces: the entry in row `i` and column
`j` is the `i`-th coordinate of the image of the `j`-th coordinate vector. -/
def matrixCoeff {R I J : Type*} [NormedRing R]
    [TopologicalSpace I] [DiscreteTopology I] [TopologicalSpace J] [DiscreteTopology J]
    (u : C₀(J, R) →L[R] C₀(I, R)) (i : I) (j : J) : R :=
  u (single j 1) i

/-- A power series is entire when it is restricted at every positive real radius. -/
def IsEntire {R : Type*} [NormedCommRing R] (F : PowerSeries R) : Prop :=
  ∀ r : ℝ, 0 < r → F.IsRestricted r

/-! ## Layer 0: approximation and compactness -/

section Approximation

variable {R M N : Type*} [NormedCommRing R]
    [NormedAddCommGroup M] [Module R M] [NormedAddCommGroup N] [Module R N]

/-- A continuous linear map has finite image when its range lies in a finitely generated
submodule of the target. -/
def IsFiniteRank (u : M →L[R] N) : Prop :=
  ∃ Q : Submodule R N, Q.FG ∧ LinearMap.range (u : M →ₗ[R] N) ≤ Q

/-- A continuous linear map is completely continuous when it is a limit in operator norm of maps
with finite image. -/
def IsCompletelyContinuous (u : M →L[R] N) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ v : M →L[R] N, IsFiniteRank v ∧ opNorm (u - v) < ε

/-- Over a Noetherian ring, finite image is finite generation of the range. -/
theorem isFiniteRank_iff_range_fg [IsNoetherianRing R] (u : M →L[R] N) :
    IsFiniteRank u ↔ (LinearMap.range (u : M →ₗ[R] N)).FG := by
  sorry

/-- A map with finite image is completely continuous. -/
theorem IsFiniteRank.isCompletelyContinuous {u : M →L[R] N} (hu : IsFiniteRank u) :
    IsCompletelyContinuous u := by
  sorry

end Approximation

section ModelSpaces

variable {R : Type*} [NormedCommRing R]
    {I J : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [TopologicalSpace J] [DiscreteTopology J]

/-- The norm of the `i`-th output row of an operator between model spaces, the supremum of the
norms of its entries. -/
def rowNorm (u : C₀(J, R) →L[R] C₀(I, R)) (i : I) : ℝ :=
  ⨆ j, ‖matrixCoeff u i j‖

/-- Uniform output decay, with bounded entries so that the real row suprema are meaningful.
The bound is automatic over Tate scalars; it is explicit in this unrestricted definition. -/
def IsRowCompact (u : C₀(J, R) →L[R] C₀(I, R)) : Prop :=
  (∃ C : ℝ, 0 ≤ C ∧ ∀ i j, ‖matrixCoeff u i j‖ ≤ C) ∧
    Tendsto (rowNorm u) cofinite (𝓝 0)

/-- Over a complete ultrametric Banach–Tate ring, a row-compact operator between model spaces is
completely continuous: its finite output truncations converge to it in operator norm. -/
theorem IsRowCompact.isCompletelyContinuous [IsTate R] [CompleteSpace R]
    [IsUltrametricDist R] [NormOneClass R]
    [IsBoundedSMul R C₀(I, R)] [IsBoundedSMul R C₀(J, R)]
    {u : C₀(J, R) →L[R] C₀(I, R)} (hu : IsRowCompact u) :
    IsCompletelyContinuous u := by
  sorry

/-- If `u` is row compact and `v` is an operator in the opposite direction whose matrix is the
transpose of that of `u`, then `v` is row compact. The existence of `v` as an operator is a
hypothesis; a transposed matrix need not define one (README §1.4). -/
theorem IsRowCompact.transpose [IsTate R] [NormOneClass R]
    {u : C₀(J, R) →L[R] C₀(I, R)} {v : C₀(I, R) →L[R] C₀(J, R)}
    (hu : IsRowCompact u) (hv : ∀ i j, matrixCoeff v j i = matrixCoeff u i j) :
    IsRowCompact v := by
  sorry

end ModelSpaces

/-- **Serre's criterion.** Over a complete nontrivially normed ultrametric field, an operator
between model spaces is row compact exactly when it is completely continuous; no discreteness of
the valuation is needed (Serre, §3, Proposition 4 and its corollary). -/
theorem isRowCompact_iff_isCompletelyContinuous
    {K I J : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]
    [TopologicalSpace I] [DiscreteTopology I] [TopologicalSpace J] [DiscreteTopology J]
    (u : C₀(J, K) →L[K] C₀(I, K)) :
    IsRowCompact u ↔ IsCompletelyContinuous u := by
  sorry

/-- A set is compactoid over the valued field `K` when for every `ε > 0` it lies within `ε` of
the sums `Σ aᵢ vᵢ` with all `‖aᵢ‖ ≤ 1`, for finitely many vectors `vᵢ`. The coefficients range
over the unit ball of the scalar field, not of a coefficient algebra. -/
def IsCompactoidSet (K : Type*) {F : Type*} [NormedField K]
    [NormedAddCommGroup F] [NormedSpace K F] (S : Set F) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ (n : ℕ) (v : Fin n → F), ∀ x ∈ S,
    ∃ a : Fin n → K, (∀ i, ‖a i‖ ≤ 1) ∧ ‖x - ∑ i, a i • v i‖ < ε

/-- A continuous linear map has compactoid image when it maps the closed unit ball to a compactoid
set. -/
def HasCompactoidImage {K E F : Type*} [NontriviallyNormedField K]
    [NormedAddCommGroup E] [NormedSpace K E]
    [NormedAddCommGroup F] [NormedSpace K F] (u : E →L[K] F) : Prop :=
  IsCompactoidSet K (u '' Metric.closedBall 0 1)

section FieldBridge

variable {K E F : Type*} [NontriviallyNormedField K] [IsUltrametricDist K]
    [CompleteSpace K] [NormedAddCommGroup E] [NormedSpace K E]
    [IsUltrametricDist E] [CompleteSpace E] [NormedAddCommGroup F]
    [NormedSpace K F] [IsUltrametricDist F] [CompleteSpace F]

/-- On ultrametric Banach spaces over a complete ultrametric field, compactoid image is complete
continuity, without spherical completeness (Schikhof, §2.15). -/
theorem hasCompactoidImage_iff_isCompletelyContinuous (u : E →L[K] F) :
    HasCompactoidImage u ↔ IsCompletelyContinuous u := by
  sorry

/-- A compact operator in Mathlib's topological sense is completely continuous; this direction
does not need local compactness of the field. -/
theorem isCompletelyContinuous_of_isCompactOperator (u : E →L[K] F)
    (hu : IsCompactOperator (u : E → F)) : IsCompletelyContinuous u := by
  sorry

/-- Over a locally compact field, complete continuity is Mathlib's compactness of operators. -/
theorem isCompletelyContinuous_iff_isCompactOperator [LocallyCompactSpace K]
    (u : E →L[K] F) : IsCompletelyContinuous u ↔ IsCompactOperator (u : E → F) := by
  sorry

end FieldBridge

/-! ## Layer 1: Fredholm determinants -/

section Fredholm

variable {R : Type*} [NormedCommRing R]
    {I : Type*} [TopologicalSpace I] [DiscreteTopology I]

/-- The principal minor of an operator on a model space on the finite index set `S`. -/
def minor (u : C₀(I, R) →L[R] C₀(I, R)) (S : Finset I) : R :=
  Matrix.det (Matrix.of fun i j : S ↦ matrixCoeff u i j)

/-- The `n`-th Fredholm coefficient, `(-1)ⁿ` times the sum of the principal minors of size `n`.
The raw sum is only interpreted after proving summability. -/
def charCoeff (u : C₀(I, R) →L[R] C₀(I, R)) (n : ℕ) : R :=
  (-1 : R) ^ n * ∑' S : {S : Finset I // S.card = n}, minor u S.val

/-- The Fredholm determinant `det(1 - T u)`, the power series of the Fredholm coefficients. -/
def charPowerSeries (u : C₀(I, R) →L[R] C₀(I, R)) : PowerSeries R :=
  PowerSeries.mk (charCoeff u)

variable [IsUltrametricDist R] [NormOneClass R] [CompleteSpace R] [IsTate R]

/-- The Fredholm determinant of a row-compact operator over a complete ultrametric Banach–Tate
ring is entire. -/
theorem charPowerSeries_isEntire {u : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) : IsEntire (charPowerSeries u) := by
  sorry

/-- **Uniform tails under a common majorant.** If every member of a family has row norms bounded
by a common null majorant `r`, and `ρ r i ≤ q` off a finite set `T` and `ρ r i ≤ B` everywhere,
then `‖cₙ‖ ρⁿ ≤ B ^ |T| * q ^ (n - |T|)` for every member and every `n`. -/
theorem norm_charCoeff_mul_pow_le_of_rowNorm_le {ι : Type*}
    (u : ι → C₀(I, R) →L[R] C₀(I, R)) {r : I → ℝ}
    (hr0 : ∀ i, 0 ≤ r i) (hr : Tendsto r cofinite (𝓝 0))
    (hur : ∀ α i, rowNorm (u α) i ≤ r i) {ρ q B : ℝ}
    (hρ : 0 < ρ) (hq0 : 0 ≤ q) (hq1 : q < 1) (hB : 1 ≤ B)
    (T : Finset I) (hT : ∀ i ∉ T, ρ * r i ≤ q)
    (hrB : ∀ i, ρ * r i ≤ B) (α : ι) (n : ℕ) :
    ‖charCoeff (u α) n‖ * ρ ^ n ≤ B ^ T.card * q ^ (n - T.card) := by
  sorry

/-- If a row-compact `u` commutes with an idempotent `p`, its Fredholm determinant is the product
of those of `u (1 - p)` and `u p`. -/
theorem charPowerSeries_eq_mul_of_comm {u p : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) (hp : p * p = p) (hup : u * p = p * u) :
    charPowerSeries u = charPowerSeries (u * (1 - p)) * charPowerSeries (u * p) := by
  sorry

end Fredholm

section ScalarExtension

open scoped TensorProduct

variable {R S I : Type*} [NormedCommRing R] [NormedCommRing S]
    [NormOneClass R] [NormOneClass S] [IsUltrametricDist R] [IsUltrametricDist S]
    [CompleteSpace R] [CompleteSpace S] [Algebra R S]
    [TopologicalSpace I] [DiscreteTopology I]

/-- **Pure tensor comparison.** Let `φ = algebraMap R S` satisfy `‖φ r‖ ≤ L ‖r‖` with `L ≥ 1`.
Let `T` be a seminormed `S`-module identified `S`-linearly with `S ⊗[R] C₀(I, R)` by `j`, so that
the norm of `j z` is the product seminorm of `z`, the infimum over presentations
`z = Σ sᵢ ⊗ xᵢ` of `max ‖sᵢ‖ ‖xᵢ‖`. Then the completion of `T` is `C₀(I, S)`, by the map sending
`s ⊗ x` to `(s φ(xᵢ))ᵢ`, of norm at most `L`, with inverse of norm at most one. No common ground
field, Noetherian hypothesis or compact operator is involved. -/
theorem c0_completedBaseChange {T : Type*} [SeminormedAddCommGroup T] [Module S T]
    [IsBoundedSMul S T] {L : ℝ} (hL : 1 ≤ L)
    (hφ : ∀ r : R, ‖algebraMap R S r‖ ≤ L * ‖r‖)
    (j : S ⊗[R] C₀(I, R) ≃ₗ[S] T)
    (hj : ∀ z : S ⊗[R] C₀(I, R), ‖j z‖ = sInf {c : ℝ | 0 ≤ c ∧
      ∃ (n : ℕ) (s : Fin n → S) (x : Fin n → C₀(I, R)),
        z = ∑ i, s i ⊗ₜ[R] x i ∧ ∀ i, ‖s i‖ * ‖x i‖ ≤ c}) :
    ∃ e : UniformSpace.Completion T ≃L[S] C₀(I, S),
      (∀ (s : S) (x : C₀(I, R)) (i : I),
        e (j (s ⊗ₜ[R] x) : UniformSpace.Completion T) i = s * algebraMap R S (x i)) ∧
      (∀ z, ‖e z‖ ≤ L * ‖z‖) ∧ (∀ y, ‖e.symm y‖ ≤ ‖y‖) := by
  sorry

end ScalarExtension

/-! ## Layer 2: series interfaces and the resolvent -/

section Resolvent

variable {R : Type*} [NormedCommRing R]
    {I : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [IsUltrametricDist R] [NormOneClass R] [CompleteSpace R] [IsTate R]
    [IsBoundedSMul R C₀(I, R)]

/-- The `m`-th coefficient `Σ_{k ≤ m} cₖ u^(m - k)` of the Fredholm resolvent. -/
def resolventCoeff (u : C₀(I, R) →L[R] C₀(I, R)) (m : ℕ) :
    C₀(I, R) →L[R] C₀(I, R) :=
  ∑ k ∈ Finset.range (m + 1), charCoeff u k • u ^ (m - k)

/-- `v` lies in the operator-norm closure of the polynomials in `u`, with the ring-scalar operator
norm, avoiding any implicit choice of topology on operators. -/
def IsOpLimitAeval (u v : C₀(I, R) →L[R] C₀(I, R)) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ P : R[X], opNorm (v - Polynomial.aeval u P) < ε

/-- The value `Σ aₙ aⁿ` of a power series at a scalar, as an infinite sum. -/
def evalAt (a : R) (F : PowerSeries R) : R :=
  ∑' n, PowerSeries.coeff n F * a ^ n

/-- For a row-compact `u`, the operator `1 - a • u` is invertible exactly when the Fredholm
determinant takes a unit value at `a`. -/
theorem isUnit_one_sub_smul_iff {u : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) (a : R) :
    IsUnit (1 - a • u) ↔ IsUnit (evalAt a (charPowerSeries u)) := by
  sorry

/-- The value at `a` of the `h`-th Hasse derivative, with no division by factorials. -/
def hasseEval (a : R) (F : PowerSeries R) (h : ℕ) : R :=
  ∑' n, ((n + h).choose h : R) * PowerSeries.coeff (n + h) F * a ^ n

/-- A good zero of order `h` at `a`: the Hasse derivatives of order less than `h` vanish at `a`
and that of order `h` is a unit there. Order zero means that the value is a unit. Entireness is a
separate hypothesis. -/
def IsGoodZero (F : PowerSeries R) (a : R) (h : ℕ) : Prop :=
  (∀ j < h, hasseEval a F j = 0) ∧ IsUnit (hasseEval a F h)

/-! ## Layer 3: projectors and spectral transforms -/

/-- `E` is a finite spectral projector of `u` at `a` of order `h`: an idempotent commuting with `u`
in the operator-norm closure of the polynomials in `u`, killed by `(1 - a • u) ^ h`, such that
`1 - a • u` has an inverse `w` on the complementary summand, again in that closure. -/
def IsRieszProjection (u : C₀(I, R) →L[R] C₀(I, R)) (a : R) (h : ℕ)
    (E : C₀(I, R) →L[R] C₀(I, R)) : Prop :=
  E * E = E ∧ Commute u E ∧ IsOpLimitAeval u E ∧ (1 - a • u) ^ h * E = 0 ∧
    ∃ w : C₀(I, R) →L[R] C₀(I, R),
      (1 - a • u) * w = 1 - E ∧ w * (1 - a • u) = 1 - E ∧
      E * w = 0 ∧ w * E = 0 ∧ IsOpLimitAeval u w

/-- **Riesz projector at a good zero.** If the Fredholm determinant of a row-compact `u` has a good
zero of order `h` at `a`, there is a row-compact Riesz projector whose range is the kernel of
`(1 - a • u) ^ h` and is a finite projective module. -/
theorem exists_rieszProjection {u : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) {a : R} {h : ℕ}
    (ha : IsGoodZero (charPowerSeries u) a h) :
    ∃ E : C₀(I, R) →L[R] C₀(I, R), IsRieszProjection u a h E ∧ IsRowCompact E ∧
      LinearMap.range (E : C₀(I, R) →ₗ[R] C₀(I, R)) =
        LinearMap.ker (((1 - a • u) ^ h : C₀(I, R) →L[R] C₀(I, R)).toLinearMap) ∧
      Module.Finite R (LinearMap.range E.toLinearMap) ∧
      Module.Projective R (LinearMap.range E.toLinearMap) := by
  sorry

omit [DiscreteTopology I] [NormOneClass R] [CompleteSpace R] [IsTate R] in
/-- At order zero the Riesz projector is zero, so the convention covers the zero-rank summand
without extra choices. -/
theorem IsRieszProjection.eq_zero_of_order_zero
    {u E : C₀(I, R) →L[R] C₀(I, R)} {a : R}
    (hE : IsRieszProjection u a 0 E) : E = 0 := by
  simpa using hE.2.2.2.1

end Resolvent

/-- Over a complete ultrametric field, `1 - a • u` is Fredholm in Mathlib's sense for every
row-compact `u` and every scalar `a`. Mathlib's predicate includes strictness, closed range and a
complemented kernel, not only the two dimension conditions (README §3.2). -/
theorem isFredholm_one_sub_smul {K I : Type*}
    [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]
    [TopologicalSpace I] [DiscreteTopology I]
    (u : C₀(I, K) →L[K] C₀(I, K)) (hu : IsRowCompact u) (a : K) :
    (1 - a • u).IsFredholm := by
  sorry

/-- Coleman's transform in prescribed rank: the resultant in `X`, with degree bounds `n` and `m`,
of `reflect n P (X)` and `1 - T B(X)`, a polynomial in `T`. -/
def colemanDBounded {R : Type*} [CommRing R] (n m : ℕ) (B P : R[X]) : R[X] :=
  Polynomial.resultant ((Polynomial.reflect n P).map Polynomial.C)
    (1 - Polynomial.C Polynomial.X * B.map Polynomial.C) n m

/-- Rank padding: raising the prescribed rank by one multiplies the transform by `1 - B(0) T`. -/
theorem colemanDBounded_succ {R : Type*} [CommRing R] (n m : ℕ) (B P : R[X])
    (hP : P.natDegree ≤ n) (hB : B.natDegree ≤ m) (hP0 : P.coeff 0 = 1) :
    colemanDBounded (n + 1) m B P =
      (1 - Polynomial.C (B.coeff 0) * Polynomial.X) * colemanDBounded n m B P := by
  sorry

section EntireTransform

variable {R : Type*} [NormedCommRing R] [IsUltrametricDist R]
    [NormOneClass R] [CompleteSpace R]

/-- Coleman's majorant `β_B(r) = sup_{m ≥ 1} ‖b_m‖ r^m` of a power series `B`. -/
def colemanMajorant (B : PowerSeries R) (r : ℝ) : ℝ :=
  ⨆ m : ℕ, ‖PowerSeries.coeff (m + 1) B‖ * r ^ (m + 1)

/-- An entire series with constant coefficient one has a Newton majorant: a positive antitone
null sequence `ρ` with `‖aⱼ‖ ≤ ∏_{i < j} ρᵢ`. -/
theorem exists_newtonMajorant {F : PowerSeries R} (hF : IsEntire F)
    (hF0 : PowerSeries.coeff 0 F = 1) :
    ∃ ρ : ℕ → ℝ, (∀ i, 0 < ρ i) ∧ Antitone ρ ∧ Tendsto ρ atTop (𝓝 0) ∧
      ∀ j, ‖PowerSeries.coeff j F‖ ≤ ∏ i ∈ Finset.range j, ρ i := by
  sorry

/-- The entire Coleman transform, coefficientwise the limit of the finite transforms of the
truncations. Convergence is a separate theorem, not a consequence of this raw limit
definition. -/
def colemanDEntire (B F : PowerSeries R) : PowerSeries R :=
  PowerSeries.mk fun k ↦ limUnder (atTop ×ˢ atTop) fun NM : ℕ × ℕ ↦
    (colemanDBounded NM.1 NM.2 (PowerSeries.trunc (NM.2 + 1) B)
      (PowerSeries.trunc (NM.1 + 1) F)).coeff k

/-- For entire `B` with `B(0) = 0` and entire `F` with `F(0) = 1`, the finite transforms of the
truncations converge to the entire transform in every Gauss norm. -/
theorem tendsto_gaussNorm_colemanDBounded {B F : PowerSeries R}
    (hB : IsEntire B) (hB0 : PowerSeries.coeff 0 B = 0)
    (hF : IsEntire F) (hF0 : PowerSeries.coeff 0 F = 1) {r : ℝ} (hr : 0 < r) :
    Tendsto (fun NM : ℕ × ℕ ↦ PowerSeries.gaussNorm norm r
      ((colemanDBounded NM.1 NM.2 (PowerSeries.trunc (NM.2 + 1) B)
        (PowerSeries.trunc (NM.1 + 1) F) : PowerSeries R) - colemanDEntire B F))
      (atTop ×ˢ atTop) (𝓝 0) := by
  sorry

/-- Under the same hypotheses the entire transform is entire with constant coefficient one. -/
theorem colemanDEntire_isEntire {B F : PowerSeries R}
    (hB : IsEntire B) (hB0 : PowerSeries.coeff 0 B = 0)
    (hF : IsEntire F) (hF0 : PowerSeries.coeff 0 F = 1) :
    IsEntire (colemanDEntire B F) ∧ PowerSeries.coeff 0 (colemanDEntire B F) = 1 := by
  sorry

variable [IsTate R] {I : Type*} [TopologicalSpace I] [DiscreteTopology I]
    [IsBoundedSMul R C₀(I, R)]

/-- The partial sums `Σ_{m < N} bₘ uᵐ` of an entire series at an operator converge in operator
norm. -/
theorem exists_tendsto_opNorm_sum_pow (u : C₀(I, R) →L[R] C₀(I, R))
    {B : PowerSeries R} (hB : IsEntire B) :
    ∃ v : C₀(I, R) →L[R] C₀(I, R), Tendsto (fun N ↦ opNorm
      (v - ∑ m ∈ Finset.range N, PowerSeries.coeff m B • u ^ m)) atTop (𝓝 0) := by
  sorry

/-- **Coleman's spectral mapping theorem.** For row-compact `u` and entire `B` with `B(0) = 0`,
the operator `B(u)` is row compact and its Fredholm determinant is the entire Coleman transform of
that of `u` (Coleman, Appendix A3). -/
theorem charPowerSeries_eq_colemanDEntire {u v : C₀(I, R) →L[R] C₀(I, R)}
    (hu : IsRowCompact u) {B : PowerSeries R} (hB : IsEntire B)
    (hB0 : PowerSeries.coeff 0 B = 0)
    (hv : Tendsto (fun N ↦ opNorm
      (v - ∑ m ∈ Finset.range N, PowerSeries.coeff m B • u ^ m)) atTop (𝓝 0)) :
    IsRowCompact v ∧ charPowerSeries v = colemanDEntire B (charPowerSeries u) := by
  sorry

end EntireTransform

/-! ## Layer 4: slopes and matrix estimates -/

section ExactCase

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- **Exact case.** Let `u` be row compact on `C₀(ℕ, K)`, with nonzero `dᵢ` of strictly
decreasing norm bounding the `i`-th row, and every leading principal minor of `(dᵢ⁻¹ aᵢⱼ)` of
norm one. Then `‖cₙ‖ = ∏_{i < n} ‖dᵢ‖`. -/
theorem norm_charCoeff_of_unit_minors
    (u : C₀(ℕ, K) →L[K] C₀(ℕ, K)) (hu : IsRowCompact u) (d : ℕ → K)
    (hd : ∀ i, d i ≠ 0) (hdec : StrictAnti fun i ↦ ‖d i‖)
    (hb : ∀ i j, ‖matrixCoeff u i j‖ ≤ ‖d i‖)
    (hminor : ∀ n : ℕ, ‖Matrix.det (Matrix.of fun i j : Fin n ↦
      (d i.val)⁻¹ * matrixCoeff u i.val j.val)‖ = 1) (n : ℕ) :
    ‖charCoeff u n‖ = ∏ i ∈ Finset.range n, ‖d i‖ := by
  sorry

end ExactCase

end

end TauCetiRoadmap.CompactOperators
