module

public import Mathlib
public import TauCeti.Algebra.BigOperators.Finset.PartialSum
public import TauCeti.Analysis.Convex.Majorization
public import TauCeti.Analysis.Convex.PermutationOrbit
public import TauCeti.Analysis.InnerProductSpace.CourantFischer
public import TauCeti.Analysis.InnerProductSpace.KyFan
public import TauCeti.Analysis.InnerProductSpace.SchurHorn
public import TauCeti.Analysis.InnerProductSpace.FanDominance
public import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.Gauge
public import TauCeti.Analysis.InnerProductSpace.HoffmanWielandt.Basic
public import TauCeti.Analysis.InnerProductSpace.Positive.SquareRoot
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.EckartYoung

/-!
# Eigenvalue and singular value inequalities: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. `E` and `F` are finite-dimensional inner
product spaces over `𝕜` (`ℝ` or `ℂ`), and `n = finrank 𝕜 E` is carried by a hypothesis
`hn : finrank 𝕜 E = n`. The eigenvalues `hT.eigenvalues hn : Fin n → ℝ` of a symmetric `T` are
Mathlib's, in decreasing order; the singular values `A.singularValues : ℕ →₀ ℝ` are Mathlib's,
decreasing and zero-padded. Complex eigenvalues of an arbitrary endomorphism are the roots of
`LinearMap.charpoly`, with multiplicity. The unitarily invariant seminorms, Ky Fan sums, weak
majorization and prefix sums are Tau Ceti's. The implementation namespace of the README is
`TauCeti`; the prototypes live in this roadmap's namespace.

Results consumed from other roadmaps are not restated: Lidskii's inequality, Lidskii's theorem
for singular values and Mirsky's theorem (SpectralSteepestDescent, Section 2.1), and Dirac's
theorem and perfect elimination orderings for chordal graphs (PerfectAndChordalGraphs,
Sections 1.3 and 1.4). The definition of chordality is a verbatim copy from
PerfectAndChordalGraphs, Section 1.1. The submultiplicativity of exterior powers in the README's
2.4 is one line from `exteriorPower.map_comp` and is not stated.
-/

@[expose] public section

noncomputable section

open Module Finset Filter Topology Matrix
open scoped InnerProductSpace ComplexOrder

namespace TauCetiRoadmap.EigenvalueAndSingularValueInequalities

attribute [local instance] Classical.propDecidable

/-! ## Layer 1: weak log-majorization -/

/-- **Weak log-majorization** of antitone nonnegative tuples: every product of the first `k`
entries of `x` is at most the corresponding product for `y`. The multiplicative counterpart of
`TauCeti.IsWeaklyMajorizedBy`, with the same sortedness and sign fields. -/
structure IsWeaklyLogMajorizedBy {n : ℕ} (x y : Fin n → ℝ) : Prop where
  antitone_left : Antitone x
  antitone_right : Antitone y
  nonneg_left : 0 ≤ x
  nonneg_right : 0 ≤ y
  prod_le : ∀ k : ℕ, ∏ i : Fin n with i.val < k, x i ≤ ∏ i : Fin n with i.val < k, y i

/-- Weak log-majorization implies weak majorization. -/
theorem IsWeaklyLogMajorizedBy.isWeaklyMajorizedBy {n : ℕ} {x y : Fin n → ℝ}
    (h : IsWeaklyLogMajorizedBy x y) : TauCeti.IsWeaklyMajorizedBy x y := sorry

/-- Weak log-majorization is preserved by every `φ` that is monotone on `[0, ∞)` and for which
`φ ∘ exp` is convex: the prefix sums of `φ ∘ x` are bounded by those of `φ ∘ y`. Zero entries
are allowed. -/
theorem IsWeaklyLogMajorizedBy.prefixSum_comp_le {n : ℕ} {x y : Fin n → ℝ}
    (h : IsWeaklyLogMajorizedBy x y) {φ : ℝ → ℝ} (hφ : MonotoneOn φ (Set.Ici 0))
    (hφe : ConvexOn ℝ Set.univ (φ ∘ Real.exp)) (k : ℕ) :
    TauCeti.prefixSum k (φ ∘ x) ≤ TauCeti.prefixSum k (φ ∘ y) := sorry

/-- Weak log-majorization is preserved by coordinatewise products. -/
theorem IsWeaklyLogMajorizedBy.mul {n : ℕ} {x y u v : Fin n → ℝ}
    (h₁ : IsWeaklyLogMajorizedBy x y) (h₂ : IsWeaklyLogMajorizedBy u v) :
    IsWeaklyLogMajorizedBy (x * u) (y * v) := sorry

/-! ## Layer 2: triangularization, compressions and determinants -/

section Complex

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]

/-- The moduli of the eigenvalues of `T`, with multiplicity, in decreasing order and
zero-padded: the analogue for complex eigenvalues of `LinearMap.singularValues`. -/
def eigenvalueModuli (T : E →ₗ[ℂ] E) (i : ℕ) : ℝ :=
  ((T.charpoly.roots.map (‖·‖)).sort (· ≥ ·)).getD i 0

/-- **Schur triangularization, invariant form.** Every sub-multiset `s` of the eigenvalues of
`T` is the eigenvalue multiset of the restriction of `T` to some invariant subspace of dimension
`card s`. -/
theorem exists_invariant_finrank_eq_roots_charpoly_restrict (T : E →ₗ[ℂ] E)
    {s : Multiset ℂ} (hs : s ≤ T.charpoly.roots) :
    ∃ (V : Submodule ℂ E) (hV : ∀ x ∈ V, T x ∈ V),
      finrank ℂ V = Multiset.card s ∧ (T.restrict hV).charpoly.roots = s := sorry

end Complex

section RCLike

variable {𝕜 E F G : Type*} [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
  [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
  [NormedAddCommGroup G] [InnerProductSpace 𝕜 G] [FiniteDimensional 𝕜 G]

/-- **Compressions.** For orthonormal families `v` in `F` and `w` in `E` with `k` members, the
determinant of the compressed matrix `⟪v i, A (w j)⟫` has norm at most the product of the `k`
largest singular values of `A`. -/
theorem norm_det_compression_le {k : ℕ} (A : E →ₗ[𝕜] F) {v : Fin k → F} {w : Fin k → E}
    (hv : Orthonormal 𝕜 v) (hw : Orthonormal 𝕜 w) :
    ‖(Matrix.of fun i j ↦ ⟪v i, A (w j)⟫_𝕜).det‖ ≤ ∏ i ∈ range k, A.singularValues i := sorry

/-- The determinant of an endomorphism has norm equal to the product of its singular values. -/
theorem norm_det_eq_prod_singularValues (T : E →ₗ[𝕜] E) :
    ‖LinearMap.det T‖ = ∏ i ∈ range (finrank 𝕜 E), T.singularValues i := sorry

end RCLike

/-! ### Exterior powers (real inner product spaces) -/

section ExteriorPower

variable {E F : Type*}
  [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]

/-- **Norm of an exterior power.** For a linear map `A` between finite-dimensional real inner
product spaces, the operator norm of `⋀ᵏA` on Mathlib's inner product space `⋀[ℝ]^k` is the
product of the `k` largest singular values of `A`. For `k = 0` both sides are `1`; for `k` beyond
the rank both sides are `0`. A real `d × d` matrix enters as `Matrix.toEuclideanLin B`. -/
theorem norm_exteriorPower_map_eq_prod_singularValues (A : E →ₗ[ℝ] F) (k : ℕ) :
    ‖LinearMap.toContinuousLinearMap (exteriorPower.map k A)‖ =
      ∏ i ∈ range k, A.singularValues i := sorry

end ExteriorPower

section RCLike

variable {𝕜 E F G : Type*} [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
  [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
  [NormedAddCommGroup G] [InnerProductSpace 𝕜 G] [FiniteDimensional 𝕜 G]

/-! ## Layer 3: Wielandt's minimax principle and Lidskii's theorem -/

/-- **Flags of complementary dimensions.** If `V` is an increasing flag with
`dim V j = i j + 1` and `W` a decreasing flag with `dim W j = n - i j`, there are orthonormal
families `v j ∈ V j` and `w j ∈ W j` spanning the same subspace. -/
theorem exists_orthonormal_span_eq {n k : ℕ} (hn : finrank 𝕜 E = n) {i : Fin k → Fin n}
    (hi : StrictMono i) {V W : Fin k → Submodule 𝕜 E} (hV : Monotone V) (hW : Antitone W)
    (hVd : ∀ j, finrank 𝕜 (V j) = i j + 1) (hWd : ∀ j, finrank 𝕜 (W j) = n - i j) :
    ∃ v w : Fin k → E, Orthonormal 𝕜 v ∧ Orthonormal 𝕜 w ∧ (∀ j, v j ∈ V j) ∧
      (∀ j, w j ∈ W j) ∧ Submodule.span 𝕜 (Set.range v) = Submodule.span 𝕜 (Set.range w) :=
  sorry

/-- **Wielandt's minimax principle.** For indices `i 0 < ⋯ < i (k-1)`, the sum
`∑ⱼ λ_{i j}(T)` is the maximum over increasing flags `M` with `dim M j = i j + 1` of the minimum
of `∑ⱼ re ⟪T xⱼ, xⱼ⟫` over orthonormal `xⱼ ∈ M j`: the eigenvector flag attains it, and every
flag carries an orthonormal family at which the sum is at most it. -/
theorem wielandt_minimax {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric) {n k : ℕ} (hn : finrank 𝕜 E = n)
    {i : Fin k → Fin n} (hi : StrictMono i) :
    (∃ M : Fin k → Submodule 𝕜 E, Monotone M ∧ (∀ j, finrank 𝕜 (M j) = i j + 1) ∧
      ∀ x : Fin k → E, Orthonormal 𝕜 x → (∀ j, x j ∈ M j) →
        ∑ j, hT.eigenvalues hn (i j) ≤ ∑ j, RCLike.re ⟪T (x j), x j⟫_𝕜) ∧
    ∀ M : Fin k → Submodule 𝕜 E, Monotone M → (∀ j, finrank 𝕜 (M j) = i j + 1) →
      ∃ x : Fin k → E, Orthonormal 𝕜 x ∧ (∀ j, x j ∈ M j) ∧
        ∑ j, RCLike.re ⟪T (x j), x j⟫_𝕜 ≤ ∑ j, hT.eigenvalues hn (i j) := sorry

/-- **Lidskii's theorem.** `λ(T + S) - λ(T)` lies in the convex hull of the permutations of
`λ(S)`, that is, it is majorized by `λ(S)`. -/
theorem eigenvalues_add_sub_mem_convexHull {T S : E →ₗ[𝕜] E} (hT : T.IsSymmetric)
    (hS : S.IsSymmetric) {n : ℕ} (hn : finrank 𝕜 E = n) :
    (fun j ↦ (hT.add hS).eigenvalues hn j - hT.eigenvalues hn j) ∈
      convexHull ℝ (Set.range fun σ : Equiv.Perm (Fin n) ↦ hS.eigenvalues hn ∘ σ) := sorry

/-- **Lidskii–Mirsky in unitarily invariant seminorms.** For every unitarily invariant seminorm
`N`, `N(diag(λ↓(T) - λ↓(S))) ≤ N(T - S) ≤ N(diag(λ↓(T) - λ↑(S)))`, the diagonal values being the
symmetric gauge of `N`. -/
theorem gauge_eigenvalues_sub_le {T S : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (hS : S.IsSymmetric)
    {n : ℕ} (hn : finrank 𝕜 E = n) (N : TauCeti.UnitarilyInvariantSeminorm 𝕜 E E) :
    let e : Fin (min (finrank 𝕜 E) (finrank 𝕜 E)) ≃ Fin n := finCongr (by simp [hn])
    N.gauge (fun i ↦ hT.eigenvalues hn (e i) - hS.eigenvalues hn (e i)) ≤ N (T - S) ∧
      N (T - S) ≤ N.gauge (fun i ↦ hT.eigenvalues hn (e i) - hS.eigenvalues hn (e i).rev) :=
  sorry

/-- **Converse of Cauchy interlacing.** If the eigenvalues `α` of a symmetric `T` on a space of
dimension `n + 1` interlace a decreasing `β : Fin n → ℝ`, then `β` is the eigenvalue list of the
compression of `T` to some hyperplane. -/
theorem exists_hyperplane_eigenvalues_compression_eq {T : E →ₗ[𝕜] E} (hT : T.IsSymmetric)
    {n : ℕ} (hn : finrank 𝕜 E = n + 1) {β : Fin n → ℝ}
    (hβ : ∀ i : Fin n, hT.eigenvalues hn i.succ ≤ β i ∧ β i ≤ hT.eigenvalues hn i.castSucc) :
    ∃ (V : Submodule 𝕜 E) (hV : finrank 𝕜 V = n)
      (hC : (LinearMap.adjoint V.subtype ∘ₗ T ∘ₗ V.subtype).IsSymmetric),
      hC.eigenvalues hV = β := sorry

end RCLike

section Normal

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]

/-- **Hoffman–Wielandt for normal operators.** For normal `T`, `S` with eigenvalues enumerated as
`α`, `β`, some matching of the eigenvalues is at most and some matching is at least the squared
Frobenius distance `∑ₖ ‖(T - S) bₖ‖²`. -/
theorem exists_perm_sum_sq_le_and_le {T S : E →ₗ[ℂ] E} [IsStarNormal T] [IsStarNormal S]
    {n : ℕ} {α β : Fin n → ℂ} (hα : Multiset.map α univ.val = T.charpoly.roots)
    (hβ : Multiset.map β univ.val = S.charpoly.roots) {ι : Type*} [Fintype ι]
    (b : OrthonormalBasis ι ℂ E) :
    (∃ σ : Equiv.Perm (Fin n), ∑ i, ‖α i - β (σ i)‖ ^ 2 ≤ ∑ k, ‖(T - S) (b k)‖ ^ 2) ∧
      ∃ σ : Equiv.Perm (Fin n), ∑ k, ‖(T - S) (b k)‖ ^ 2 ≤ ∑ i, ‖α i - β (σ i)‖ ^ 2 := sorry

end Normal

/-! ## Layer 4: singular values of sums and real parts -/

section Sums

variable {𝕜 E F : Type*} [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
  [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-- **Fan–Hoffman.** If `H = (T + T†)/2`, then `λⱼ(H) ≤ sⱼ(T)` for every `j`. -/
theorem eigenvalues_le_singularValues_of_two_smul_eq {T H : E →ₗ[𝕜] E} (hH : H.IsSymmetric)
    (hHT : (2 : 𝕜) • H = T + LinearMap.adjoint T) {n : ℕ} (hn : finrank 𝕜 E = n) (j : Fin n) :
    hH.eigenvalues hn j ≤ T.singularValues j := sorry

/-- **Comparison by a unitary.** If `λⱼ(X) ≤ λⱼ(Y)` for every `j`, then `X ≤ U Y U⁻¹` for some
unitary `U`. -/
theorem exists_unitary_le_conj_of_eigenvalues_le {X Y : E →ₗ[𝕜] E} (hX : X.IsSymmetric)
    (hY : Y.IsSymmetric) {n : ℕ} (hn : finrank 𝕜 E = n)
    (h : ∀ j, hX.eigenvalues hn j ≤ hY.eigenvalues hn j) :
    ∃ U : E ≃ₗᵢ[𝕜] E,
      ((U : E →ₗ[𝕜] E) ∘ₗ Y ∘ₗ (U.symm : E →ₗ[𝕜] E) - X).IsPositive := sorry

/-- **Thompson's triangle inequality.** `|A + B| ≤ U |A| U⁻¹ + V |B| V⁻¹` for some unitaries
`U`, `V`. -/
theorem exists_unitary_operatorAbs_add_le (A B : E →ₗ[𝕜] E) :
    ∃ U V : E ≃ₗᵢ[𝕜] E,
      ((U : E →ₗ[𝕜] E) ∘ₗ LinearMap.operatorAbs A ∘ₗ (U.symm : E →ₗ[𝕜] E) +
        (V : E →ₗ[𝕜] E) ∘ₗ LinearMap.operatorAbs B ∘ₗ (V.symm : E →ₗ[𝕜] E) -
          LinearMap.operatorAbs (A + B)).IsPositive := sorry

/-- **Rotfel'd's inequality.** For `f` nonnegative and concave on `[0, ∞)` with `f 0 = 0`,
`∑ⱼ f(sⱼ(A + B)) ≤ ∑ⱼ f(sⱼ(A)) + ∑ⱼ f(sⱼ(B))`. -/
theorem sum_concave_singularValues_add_le {f : ℝ → ℝ} (hf : ConcaveOn ℝ (Set.Ici 0) f)
    (hf0 : f 0 = 0) (hfn : ∀ t, 0 ≤ t → 0 ≤ f t) (A B : E →ₗ[𝕜] E) :
    ∑ j ∈ range (finrank 𝕜 E), f ((A + B).singularValues j) ≤
      ∑ j ∈ range (finrank 𝕜 E), f (A.singularValues j) +
        ∑ j ∈ range (finrank 𝕜 E), f (B.singularValues j) := sorry

end Sums

section ComplexRealPart

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]

/-- **Ky Fan's real-part majorization.** The real parts of the eigenvalues of `T`, in any
enumeration, are majorized by the eigenvalues of `H = (T + T†)/2`. -/
theorem re_eigenvalues_mem_convexHull {T H : E →ₗ[ℂ] E} (hH : H.IsSymmetric)
    (hHT : (2 : ℂ) • H = T + LinearMap.adjoint T) {n : ℕ} (hn : finrank ℂ E = n)
    {α : Fin n → ℂ} (hα : Multiset.map α univ.val = T.charpoly.roots) :
    (fun j ↦ (α j).re) ∈
      convexHull ℝ (Set.range fun σ : Equiv.Perm (Fin n) ↦ hH.eigenvalues hn ∘ σ) := sorry

end ComplexRealPart

/-- **Ostrowski–Taussky.** If the Hermitian part `H = (A + Aᴴ)/2` of a complex square matrix is
positive semidefinite, then `det H ≤ |det A|`. -/
theorem re_det_le_norm_det_of_posSemidef {ι : Type*} [Fintype ι] [DecidableEq ι]
    {A : Matrix ι ι ℂ} (hH : ((2 : ℂ)⁻¹ • (A + Aᴴ)).PosSemidef) :
    ((2 : ℂ)⁻¹ • (A + Aᴴ)).det.re ≤ ‖A.det‖ := sorry

/-! ## Layer 5: products and multiplicative majorization -/

section Products

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]

/-- **Weyl's majorant theorem.** The products of the `k` largest eigenvalue moduli of `T` are
bounded by the products of its `k` largest singular values, with equality at `k = dim E`. -/
theorem prod_eigenvalueModuli_le_prod_singularValues (T : E →ₗ[ℂ] E) :
    (∀ k, ∏ i ∈ range k, eigenvalueModuli T i ≤ ∏ i ∈ range k, T.singularValues i) ∧
      ∏ i ∈ range (finrank ℂ E), eigenvalueModuli T i =
        ∏ i ∈ range (finrank ℂ E), T.singularValues i := sorry

/-- **Weyl's inequalities for eigenvalue moduli.** For `φ` monotone on `[0, ∞)` with `φ ∘ exp`
convex, `∑_{i < k} φ(|λ|ᵢ) ≤ ∑_{i < k} φ(sᵢ)` for every `k`. -/
theorem sum_comp_eigenvalueModuli_le (T : E →ₗ[ℂ] E) {φ : ℝ → ℝ}
    (hφ : MonotoneOn φ (Set.Ici 0)) (hφe : ConvexOn ℝ Set.univ (φ ∘ Real.exp)) (k : ℕ) :
    ∑ i ∈ range k, φ (eigenvalueModuli T i) ≤ ∑ i ∈ range k, φ (T.singularValues i) := sorry

/-- **Yamamoto's theorem.** `sᵢ(Tᵐ)^(1/m)` tends to the `i`-th eigenvalue modulus of `T`. -/
theorem tendsto_singularValues_pow_rpow (T : E →ₗ[ℂ] E) (i : ℕ) :
    Tendsto (fun m : ℕ ↦ (T ^ m).singularValues i ^ (1 / (m : ℝ))) atTop
      (𝓝 (eigenvalueModuli T i)) := sorry

/-- **Lidskii's theorem for products of positive operators.** The eigenvalues of `A B` are
nonnegative reals, and their decreasing list is log-majorized by `λ(A) λ(B)`: weakly for every
`k`, with equality of the full products. -/
theorem eigenvalueModuli_comp_le_of_isPositive {A B : E →ₗ[ℂ] E} (hA : A.IsPositive)
    (hB : B.IsPositive) {n : ℕ} (hn : finrank ℂ E = n) :
    (∀ z ∈ (A ∘ₗ B).charpoly.roots, z.im = 0 ∧ 0 ≤ z.re) ∧
      (∀ k, ∏ i ∈ range k, eigenvalueModuli (A ∘ₗ B) i ≤
        ∏ i : Fin n with i.val < k,
          hA.isSymmetric.eigenvalues hn i * hB.isSymmetric.eigenvalues hn i) ∧
      ∏ i ∈ range n, eigenvalueModuli (A ∘ₗ B) i =
        ∏ i, hA.isSymmetric.eigenvalues hn i * hB.isSymmetric.eigenvalues hn i := sorry

end Products

section ProductsRCLike

variable {𝕜 E F G : Type*} [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
  [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]
  [NormedAddCommGroup G] [InnerProductSpace 𝕜 G] [FiniteDimensional 𝕜 G]

/-- **Horn's product inequality.** `∏_{i < k} sᵢ(A B) ≤ ∏_{i < k} sᵢ(A) sᵢ(B)` for every `k`. -/
theorem prod_singularValues_comp_le (A : F →ₗ[𝕜] G) (B : E →ₗ[𝕜] F) (k : ℕ) :
    ∏ i ∈ range k, (A ∘ₗ B).singularValues i ≤
      ∏ i ∈ range k, A.singularValues i * B.singularValues i := sorry

/-- **Gelfand–Naimark.** For indices `i 0 < ⋯ < i (k-1)`,
`∏ⱼ s_{i j}(A B) ≤ ∏ⱼ s_{i j}(B) · ∏_{j < k} sⱼ(A)`. -/
theorem prod_singularValues_comp_le_of_strictMono (A B : E →ₗ[𝕜] E) {k : ℕ} {i : Fin k → ℕ}
    (hi : StrictMono i) :
    ∏ j, (A ∘ₗ B).singularValues (i j) ≤
      (∏ j, B.singularValues (i j)) * ∏ j ∈ range k, A.singularValues j := sorry

end ProductsRCLike

/-- **Horn's converse of Weyl's theorem.** Decreasing nonnegative `σ` and complex `λ` with
decreasing moduli satisfying Weyl's product inequalities, with equality of the full products,
are the singular values and the diagonal of an upper triangular complex matrix. -/
theorem exists_upperTriangular_singularValues_eq {n : ℕ} {σ : Fin n → ℝ} {μ : Fin n → ℂ}
    (hσ : Antitone σ) (hσ0 : 0 ≤ σ) (hμ : Antitone fun i ↦ ‖μ i‖)
    (hle : ∀ k, ∏ i : Fin n with i.val < k, ‖μ i‖ ≤ ∏ i : Fin n with i.val < k, σ i)
    (heq : ∏ i, ‖μ i‖ = ∏ i, σ i) :
    ∃ M : Matrix (Fin n) (Fin n) ℂ, M.BlockTriangular id ∧ (∀ i, M i i = μ i) ∧
      ∀ i : Fin n, (Matrix.toEuclideanLin M).singularValues i = σ i := sorry

/-! ## Layer 6: Hadamard products -/

/-- **Oppenheim's inequality, with Schur's and Hadamard's bounds.** For positive semidefinite
`A`, `B`: `det A det B ≤ det A ∏ bᵢᵢ ≤ det (A ∘ B) ≤ ∏ aᵢᵢ bᵢᵢ`. -/
theorem det_mul_prod_diag_le_det_hadamard {𝕜 ι : Type*} [RCLike 𝕜] [Fintype ι] [DecidableEq ι]
    {A B : Matrix ι ι 𝕜} (hA : A.PosSemidef) (hB : B.PosSemidef) :
    A.det * B.det ≤ A.det * ∏ i, B i i ∧ A.det * ∏ i, B i i ≤ (A ⊙ B).det ∧
      (A ⊙ B).det ≤ ∏ i, A i i * B i i := sorry

/-- **Singular values of a Hadamard product.**
`∑_{i < k} sᵢ(A ∘ B) ≤ ∑_{i < k} sᵢ(A) sᵢ(B)` for rectangular complex matrices. -/
theorem sum_singularValues_hadamard_le {m n : Type*} [Fintype m] [Fintype n] [DecidableEq m]
    [DecidableEq n] (A B : Matrix m n ℂ) (k : ℕ) :
    ∑ i ∈ range k, (Matrix.toEuclideanLin (A ⊙ B)).singularValues i ≤
      ∑ i ∈ range k, (Matrix.toEuclideanLin A).singularValues i *
        (Matrix.toEuclideanLin B).singularValues i := sorry

/-! ## Layer 7: positive definite completions -/

section Completions

variable {V : Type*}

open SimpleGraph in
/-- Verbatim copy of the definition owned by PerfectAndChordalGraphs, Section 1.1, used here to
state the completion theorem of 7.2: a graph is chordal when no cycle on at least four vertices
is an induced subgraph, that is, every cycle of length at least four has a chord. -/
def IsChordal (G : SimpleGraph V) : Prop :=
  ∀ n, 4 ≤ n → ¬(cycleGraph n).IsIndContained G

variable [Fintype V] [DecidableEq V]

/-- A partial matrix with pattern `G` is **partially positive definite** when every principal
submatrix on a clique of `G` (singletons included) is positive definite. Entries off the pattern
are ignored. -/
def IsPartiallyPosDef {𝕜 : Type*} [RCLike 𝕜] (G : SimpleGraph V) (A : Matrix V V 𝕜) : Prop :=
  ∀ s : Finset V, G.IsClique (s : Set V) →
    (A.submatrix (Subtype.val : s → V) Subtype.val).PosDef

/-- `B` **completes** the partial matrix `A` with pattern `G`: they agree on the diagonal and on
the edges of `G`. -/
def IsPatternCompletion {𝕜 : Type*} (G : SimpleGraph V) (A B : Matrix V V 𝕜) : Prop :=
  ∀ i j, (i = j ∨ G.Adj i j) → B i j = A i j

/-- **Grone–Johnson–Sá–Wolkowicz.** Every partially positive definite matrix with pattern `G`
has a positive definite completion exactly when `G` is chordal. -/
theorem isChordal_iff_forall_exists_posDef_completion {𝕜 : Type*} [RCLike 𝕜]
    (G : SimpleGraph V) :
    IsChordal G ↔ ∀ A : Matrix V V 𝕜, IsPartiallyPosDef G A →
      ∃ B, B.PosDef ∧ IsPatternCompletion G A B := sorry

/-- **Maximum-determinant completion.** If a partial matrix with pattern `G` has a positive
definite completion, it has one, `F`, of strictly largest determinant, and `F` is the only
positive definite completion whose inverse vanishes at every position off the pattern. -/
theorem exists_posDef_completion_isGreatest_det {𝕜 : Type*} [RCLike 𝕜] {G : SimpleGraph V}
    {A : Matrix V V 𝕜} (h : ∃ B, B.PosDef ∧ IsPatternCompletion G A B) :
    ∃ F, F.PosDef ∧ IsPatternCompletion G A F ∧
      (∀ B, B.PosDef → IsPatternCompletion G A B → B ≠ F →
        RCLike.re B.det < RCLike.re F.det) ∧
      ∀ B, B.PosDef → IsPatternCompletion G A B →
        ((∀ i j, i ≠ j → ¬ G.Adj i j → B⁻¹ i j = 0) ↔ B = F) := sorry

end Completions

/-! ## Sanity checks of the definitions -/

/-- Sanity check of the definition: `(1, 1/2)` is not weakly log-majorized by `(5/4, 1/4)`, since
`1/2 > 5/16` at `k = 2`, although `(1, 1/2)` is weakly majorized by `(5/4, 1/4)`. -/
theorem not_isWeaklyLogMajorizedBy_example :
    ¬ IsWeaklyLogMajorizedBy ![1, 1/2] ![5/4, 1/4] := sorry

/-- Sanity check of the definition: the eigenvalue moduli of a nilpotent operator vanish, while
its singular values need not. -/
theorem eigenvalueModuli_eq_zero_of_isNilpotent {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℂ E] [FiniteDimensional ℂ E] {T : E →ₗ[ℂ] E} (hT : IsNilpotent T)
    (i : ℕ) : eigenvalueModuli T i = 0 := sorry

/-- Sanity check of the definition: the eigenvalue moduli are sorted by modulus, not by real
part: for `diag(1, -2)` on `ℂ²` they are `2, 1`. -/
theorem eigenvalueModuli_diag_one_neg_two :
    eigenvalueModuli (Matrix.toEuclideanLin (Matrix.diagonal ![(1 : ℂ), -2])) 0 = 2 ∧
      eigenvalueModuli (Matrix.toEuclideanLin (Matrix.diagonal ![(1 : ℂ), -2])) 1 = 1 := sorry

/-- Sanity check of the definition: a partially positive definite matrix on the four-cycle with
no positive definite completion: diagonal `1`, the value `9/10` on three edges and `-9/10` on the
fourth. Negative control for the necessity half of the completion theorem. -/
theorem not_exists_posDef_completion_cycle :
    let A : Matrix (Fin 4) (Fin 4) ℝ :=
      !![1, 9/10, 0, -9/10; 9/10, 1, 9/10, 0; 0, 9/10, 1, 9/10; -9/10, 0, 9/10, 1]
    IsPartiallyPosDef (SimpleGraph.cycleGraph 4) A ∧
      ¬ ∃ B, B.PosDef ∧ IsPatternCompletion (SimpleGraph.cycleGraph 4) A B := sorry

/-! ## Library declarations consumed -/

#check @LinearMap.IsSymmetric.eigenvalues
#check @LinearMap.IsSymmetric.eigenvalues_antitone
#check @LinearMap.singularValues
#check @LinearMap.charpoly
#check @Module.End.iSup_maxGenEigenspace_eq_top
#check @doublyStochastic_eq_convexHull_permMatrix
#check @Matrix.PosSemidef.hadamard
#check @exteriorPower.map
#check @OrthonormalBasis.exteriorPower
#check @Matrix.PosDef
#check @SimpleGraph.IsClique
#check @spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius
#check @exteriorPower.map_comp
#check @exteriorPower.inner_ιMulti_ιMulti
#check @Matrix.toEuclideanLin
#check @SimpleGraph.cycleGraph
#check @SimpleGraph.IsIndContained
#check @Matrix.BlockTriangular
#check @LinearMap.IsPositive
#check @IsStarNormal
#check @TauCeti.prefixSum
#check @TauCeti.IsWeaklyMajorizedBy
#check @TauCeti.mem_convexHull_range_comp_perm_iff
#check @LinearMap.IsSymmetric.eigenvalues_eq_iSup_iInf_re_inner
#check @LinearMap.IsSymmetric.eigenvalues_add_le
#check @LinearMap.IsSymmetric.eigenvalue_mono
#check @LinearMap.IsSymmetric.le_eigenvalues_add
#check @LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues
#check @LinearMap.kyFanSum
#check @LinearMap.kyFanSum_add_le
#check @LinearMap.kyFanSum_adjoint
#check @LinearMap.singularValues_comp_le
#check @LinearMap.operatorAbs
#check @LinearMap.IsSymmetric.range_re_inner_apply_self_eq_convexHull_eigenvalues_comp_perm
#check @LinearMap.IsSymmetric.sum_sq_eigenvalues_sub_le_sum_sq_norm_apply
#check @LinearMap.abs_singularValues_sub_singularValues_le
#check @TauCeti.UnitarilyInvariantSeminorm
#check @TauCeti.UnitarilyInvariantSeminorm.gauge
#check @TauCeti.UnitarilyInvariantSeminorm.map_eq_gauge_singularValues
#check @TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le

end TauCetiRoadmap.EigenvalueAndSingularValueInequalities
