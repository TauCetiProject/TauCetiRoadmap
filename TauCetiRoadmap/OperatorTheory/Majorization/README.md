# Roadmap: majorization and unitarily invariant norms

**Summary.** Majorization compares real tuples by their partial sums. For nonincreasing
nonnegative `n`-tuples `x` and `y`, `x` is *weakly majorized* by `y`, written `x ≺w y`, when
`x₀ + ⋯ + xₖ₋₁ ≤ y₀ + ⋯ + yₖ₋₁` for every `k`. This roadmap develops weak majorization as convex
geometry, connects it to operators through eigenvalues and singular values, and builds on it the
theory of unitarily invariant seminorms on linear maps `A : E → F` between finite-dimensional
inner product spaces over `ℝ` or `ℂ`, with source and target allowed to differ. Eigenvalues and
singular values are always listed in nonincreasing order with multiplicity.

The headline theorems are four.

- *Transfer descent.* A convex set of real `n`-tuples that is invariant under permuting the
  coordinates and under changing the sign of one coordinate, and that contains `y`, contains every
  nonincreasing nonnegative `z` whose partial sums are bounded by those of `y`. Hence, if `x ≺w y`,
  then `g(x) ≤ g(y)` for every symmetric gauge `g`, a seminorm on `ℝⁿ` with the same two
  invariances.
- *Forward Schur–Horn inequality.* If `T` is a symmetric operator on a finite-dimensional inner
  product space with eigenvalues `λ₀ ≥ ⋯ ≥ λₙ₋₁`, `(eₖ)` is an orthonormal basis and `φ` is convex
  on a convex set containing the eigenvalues, then `∑ₖ φ(Re⟪T eₖ, eₖ⟫) ≤ ∑ᵢ φ(λᵢ)`.
- *Ky Fan's maximum principle and triangle inequality.* The Ky Fan sum
  `Kₖ(A) = σ₀(A) + ⋯ + σₖ₋₁(A)` of the `k` largest singular values bounds `|∑ᵢ ⟪uᵢ, A vᵢ⟫|`
  for all orthonormal families of `k` vectors, with equality for some such families when `k`
  is at most both dimensions, and `Kₖ(A + B) ≤ Kₖ(A) + Kₖ(B)` for every `k`.
- *Fan dominance.* For `A, C : E → F`, `Kₖ(A) ≤ Kₖ(C)` for every `k` holds exactly when `A` lies
  in the convex hull of the maps `U C V`, `U` and `V` unitaries of `F` and of `E`; it then gives
  `N(A) ≤ N(C)` for every unitarily invariant seminorm `N`. Every such `N` is a symmetric gauge
  of the singular values.

Within Tau Ceti, Mathlib supplies the singular values and the sorted eigenvalues that every
statement is phrased against. PolarDecomposition supplies the operator modulus and the singular
system, which enter through Ky Fan attainment and modulus invariance; OrthogonalGeometry
supplies the Gram rigidity behind the rectangular singular-value factorization. Downstream,
PrincipalAngles and SpectralSubspacePerturbation state their perturbation estimates for the
seminorms built here, and OperatorIdeals carries the Ky Fan triangle inequality to approximation
numbers and identifies its Hilbert–Schmidt norm with the Frobenius seminorm.

The build has two layers, described below. Layer 1 is the convex engine (prefix sums, transfers,
symmetric convex sets and gauges, transfer descent) and its two bridges to operators: diagonal
entries against eigenvalues, and Ky Fan sums, with the diagonal operators that model them. Layer 2
defines unitarily invariant seminorms on rectangular maps, proves Fan dominance in orbit-hull form
and the gauge representation, and treats square operators, block sums, the concrete seminorms and
the planar models used for sharpness.

## Conventions

1. **Scalars and spaces.** `𝕜` is `ℝ` or `ℂ` (`[RCLike 𝕜]`). The letters `E, F, E', F', E₁, E₂,
   F₁, F₂` denote finite-dimensional inner product spaces over `𝕜`, and a map `A : E → F` is a
   `𝕜`-linear map `E →ₗ[𝕜] F`; a square operator is the case `E = F`. Each statement carries its
   hypotheses in its own signature. The inner product `⟪x, y⟫` is Mathlib's, conjugate-linear in
   `x`; the adjoint `A†` is `LinearMap.adjoint A`. A *unitary* of `F` is a linear isometric
   equivalence `F ≃ₗᵢ[𝕜] F`; Mathlib's `Unitary.linearIsometryEquiv` identifies these with the
   unitary elements of `F →L[𝕜] F`.
2. **Ordered spectral data.** The singular values of `A` are Mathlib's
   `LinearMap.singularValues A : ℕ →₀ ℝ`: zero-indexed, `σ₀(A) ≥ σ₁(A) ≥ ⋯ ≥ 0`, repeated with
   multiplicity, with `σᵢ(A)²` the eigenvalues of `A†A` for `i < dim E` and `σᵢ(A) = 0` from
   `dim E` on. The eigenvalues of a symmetric `T` are `hT.eigenvalues hn : Fin n → ℝ` for
   `hn : finrank 𝕜 E = n`, nonincreasing with multiplicity, with orthonormal eigenbasis
   `hT.eigenvectorBasis hn`. Every sorted statement is made against these two, never against a
   private ordering.
3. **Tuples and prefix sums.** An `n`-tuple is `x : Fin n → ℝ`, zero-indexed; *antitone* means
   nonincreasing. The prefix sum `Pₖ(x) = x₀ + ⋯ + xₖ₋₁` is `TauCeti.prefixSum k x`; it is the
   total sum for `k ≥ n` and `0` for `k = 0`.
4. **Majorization.** For antitone nonnegative `x, y : Fin n → ℝ`, `x ≺w y` means `Pₖ(x) ≤ Pₖ(y)`
   for every `k`, the predicate `TauCeti.IsWeaklyMajorizedBy x y`. *Ordinary* majorization adds
   equality of the total sums; it enters only through the transfer closure of §1.2.
5. **Symmetry.** A set of tuples or a function on tuples is *symmetric* when it is invariant under
   every permutation of the coordinates and under changing the sign of one coordinate. A seminorm
   is a subadditive, absolutely homogeneous function (Mathlib `Seminorm`; `Seminorm.of` builds one
   from these two properties); a *symmetric gauge* is a symmetric seminorm on `ι → ℝ`, the
   predicate `Seminorm.IsSymmetricGauge`.
6. **Diagonal data.** For a symmetric `T` with eigenbasis `(vᵢ)` and an orthonormal basis `(eₖ)`,
   the diagonal entries are `dₖ = Re⟪T eₖ, eₖ⟫` and the Schur weights are `wᵢₖ = ‖⟪vᵢ, eₖ⟫‖²`.
7. **Ky Fan sums and rank.** `Kₖ(A) = σ₀(A) + ⋯ + σₖ₋₁(A)` is `A.kyFanSum k` (the map first, the
   length second); `K₀(A) = 0`. The rank of `A` is `finrank 𝕜 (LinearMap.range A)`, and
   `Kₖ(A) = ∑ᵢ σᵢ(A)` for `k ≥ rank A`.
8. **Unitarily invariant seminorms.** A seminorm `N` on `E →ₗ[𝕜] F` is *unitarily invariant* when
   `N(U A V) = N(A)` for every unitary `U` of `F` and every unitary `V` of `E`, acting
   independently. The *two-sided unitary orbit* of `C : E → F` is `{U C V}`, and its *orbit hull*
   is the set of convex combinations `∑ᵢ tᵢ Yᵢ` of orbit points with real weights `tᵢ ≥ 0` summing
   to `1`.
9. **Block sums.** For `A : E₁ → F₁` and `B : E₂ → F₂`, `A ⊕ B` is
   `(A.prodMap B).withLpMap 2 : WithLp 2 (E₁ × E₂) →ₗ[𝕜] WithLp 2 (F₁ × F₂)`, the block-diagonal
   map between the Hilbert (`L²`) products.
10. **Concrete seminorms.** `‖A‖` is the operator norm; the Frobenius seminorm is
    `‖A‖_F = (∑ᵢ σᵢ(A)²)^(1/2)`, the Hilbert–Schmidt norm of finite dimension; the nuclear (trace)
    seminorm is `‖A‖₁ = ∑ᵢ σᵢ(A)`; the Ky Fan `k`-seminorm is `Kₖ`.
11. **Names.** Library declarations are named in code font with their full names, except that
    the lemmas of the namespace `TauCeti.UnitarilyInvariantSeminorm` are cited by their name in
    that namespace: `map_le_of_kyFanSum_le` is
    `TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`. A target of this roadmap without a
    library declaration is described in prose. The acceptance file `Suggested.lean` states no
    theorem of its own; it declares the two objects through which the acceptance files of the other
    OperatorTheory roadmaps state their estimates: the structure
    `TauCetiRoadmap.Majorization.UnitarilyInvariantSeminorm`, a seminorm on `E →ₗ[𝕜] F` with
    `N(U A V) = N(A)` for `U` in Mathlib's `unitary (F →ₗ[𝕜] F)` and `V` in `unitary (E →ₗ[𝕜] E)`
    (the notion of Convention 8, whose carrier in the layers is
    `TauCeti.UnitarilyInvariantSeminorm`),
    and the function `TauCetiRoadmap.Majorization.frobenius`, whose value at `A` is
    `(∑ᵢ ‖A bᵢ‖²)^(1/2)` for the standard orthonormal basis `stdOrthonormalBasis 𝕜 E` of the source,
    that is `‖A‖_F` by the Frobenius basis formula of §2.5.

## Layer 1: majorization, forward Schur–Horn and Ky Fan sums

### 1.1 Convex majorization objects

The objects of the convex engine (Bhatia, *Matrix Analysis*, Chapters II–IV), on tuples with no
operator in sight.

*Prefix sums* are `TauCeti.prefixSum k x` for `x : Fin n → ℝ`, given by the filtered sum
`TauCeti.prefixSum_def`. *Weak majorization* is the structure `TauCeti.IsWeaklyMajorizedBy x y`,
whose fields say that `x` and `y` are antitone and nonnegative and that `Pₖ(x) ≤ Pₖ(y)` for every
`k`.

The *Robin Hood transfer* `TauCeti.robinHood x i j δ` subtracts `δ` from `xᵢ` and adds it to
`xⱼ`. It is an *elementary* transfer when `0 ≤ δ ≤ xᵢ − xⱼ`: mass moves from a coordinate to one
with no larger value, and both new values lie between the old ones.

- It preserves the total sum (`TauCeti.sum_robinHood`).
- Its prefix sum of length `k` is `Pₖ(x)`, minus `δ` when `i < k`, plus `δ` when `j < k`
  (`TauCeti.prefixSum_robinHood`).
- For `i = j` it is the identity, and otherwise it changes the coordinates `i` and `j` only, to
  `xᵢ − δ` and `xⱼ + δ` (`TauCeti.robinHood_self`, `TauCeti.robinHood_apply_left`,
  `TauCeti.robinHood_apply_right`, `TauCeti.robinHood_apply_of_ne`).

A *T-transform* is the relation `TauCeti.IsTTransform x y`: `y` is an elementary Robin Hood
transfer of `x` followed by a permutation of the coordinates. It preserves the total sum
(`TauCeti.IsTTransform.sum_eq`).

A *symmetric convex set* is `K ⊆ (ι → ℝ)` with `TauCeti.IsSymmetricConvex K`: `K` is convex,
`x ∘ σ ∈ K` for every `x ∈ K` and permutation `σ`, and negating one coordinate of a member gives a
member.

- A coordinate of a member may be replaced by any value of no larger absolute value
  (`TauCeti.IsSymmetricConvex.update_mem`); so for finite `ι`, `K` contains every tuple whose
  coordinates are bounded in absolute value by those of a member
  (`TauCeti.IsSymmetricConvex.isSolid`).
- `K` is closed under elementary Robin Hood transfers (`TauCeti.IsSymmetricConvex.robinHood_mem`)
  and under T-transforms (`TauCeti.IsSymmetricConvex.mem_of_isTTransform`). The first rests on a
  fact about all convex sets: a convex set containing `x` and the tuple `x` with coordinates `i` and
  `j` swapped contains every elementary transfer from `i` to `j` (`Convex.robinHood_mem`).

A *symmetric gauge* is a seminorm `p : Seminorm ℝ (ι → ℝ)` with `Seminorm.IsSymmetricGauge p`:
`p(x ∘ σ) = p(x)` for every permutation `σ`, and `p` is unchanged by negating one coordinate.

- The sup norm and, for `1 ≤ p ≤ ∞`, the `ℓᵖ` norm are symmetric gauges
  (`Seminorm.isSymmetricGauge_normSeminorm`, `Seminorm.isSymmetricGauge_piLp`).
- For finite `ι`, a symmetric gauge is monotone in the absolute values: `|xᵢ| ≤ |yᵢ|` for every
  `i` gives `p(x) ≤ p(y)` (`Seminorm.IsSymmetricGauge.apply_le_of_abs_le`).

*Needs:* Tau Ceti `TauCeti.prefixSum`; Mathlib `Convex`, `Seminorm`, `Equiv.Perm`,
`Function.update`.

**Checks.**
- For `x = (1, 1)` and `y = (2, 0)`: `P₁(x) = 1 ≤ 2` and `P₂(x) = 2 ≤ 2`, so `x ≺w y`, while
  `y ≺w x` fails at `P₁`. Neither tuple lies below the other coordinatewise, so a definition by the
  coordinatewise order would reject both comparisons.
- `(1/2, 1/2) ≺w (1, 1)` although the totals are `1` and `2`: weak majorization does not ask for
  equal totals, and a definition by ordinary majorization would reject this pair.
- The transfer of `δ = 1` from coordinate `0` to coordinate `1` of `(3, 1)` gives `(2, 2)`: `P₁`
  falls from `3` to `2` and `P₂` stays `4`. The largest elementary transfer, `δ = 2`, gives the
  swap `(1, 3)`. With `δ = 3` the result `(0, 4)` leaves the segment from `(3, 1)` to `(1, 3)`, so a
  convex set containing both need not contain it: the bound `δ ≤ xᵢ − xⱼ` is part of an elementary
  step.

### 1.2 The weak-majorization calculus and transfer descent

The closure laws make weak majorization compositional, and transfer descent turns it into
membership in symmetric convex sets and into inequalities for symmetric gauges (Bhatia, *Matrix
Analysis*, Chapters II–IV).

- Prefix sums are additive, `Pₖ(x + y) = Pₖ(x) + Pₖ(y)` (`TauCeti.prefixSum_add`), satisfy
  `Pₖ(c x) = c Pₖ(x)` for every real `c`, in particular for `c ≥ 0` (`TauCeti.prefixSum_smul`), and
  do not see appended zeros (`TauCeti.prefixSum_append_zero`).
- Weak majorization is reflexive on antitone nonnegative tuples
  (`TauCeti.IsWeaklyMajorizedBy.refl`) and transitive (`TauCeti.IsWeaklyMajorizedBy.trans`). If
  `x₁ ≺w y₁` and `x₂ ≺w y₂`, then `x₁ + x₂ ≺w y₁ + y₂`, the sums being again antitone and
  nonnegative (`TauCeti.IsWeaklyMajorizedBy.add`). If `x ≺w y` and `c ≥ 0`, then `c x ≺w c y`
  (`TauCeti.IsWeaklyMajorizedBy.smul`). Appending the same number of zeros to both tuples
  preserves `x ≺w y` (`TauCeti.IsWeaklyMajorizedBy.append_zero`).

**Progress by one transfer.** State as a public declaration: let `y, d : Fin n → ℝ` with `d`
antitone, `∑ₘ dₘ = ∑ₘ yₘ`, `Pₗ(d) ≤ Pₗ(y)` for every `l`, and `y ≠ d`. Then there are coordinates
`i, j` and a real `δ` with `0 ≤ δ ≤ yᵢ − yⱼ` such that the transfer `y' = TauCeti.robinHood y i j δ`
still satisfies `Pₗ(d) ≤ Pₗ(y')` for every `l`, and `y'` agrees with `d` at strictly more
coordinates than `y` does. No order or sign condition on `y` is assumed. This is the inductive step
of the transfer closure `TauCeti.mem_of_prefixSum_le_of_sum_eq`: a set of tuples closed under
elementary transfers that contains `y` contains every antitone `d` with the total sum of `y` and
prefix sums bounded by those of `y`. The pinned Tau Ceti proves the step as the private theorem
`exists_robinHood_card_lt` of `TauCeti/Analysis/Convex/Majorization.lean` and derives the transfer
closure from it, choosing as `i` the first coordinate where `y` and `d` differ and as `j` the first
later one where `y` is below `d`. Route: take `j` the first coordinate with `dⱼ > yⱼ`, which
exists because the totals agree and `y ≠ d`; take `i < j` the last coordinate before `j` with
`yᵢ > dᵢ`, which exists because `Pⱼ₊₁(d) ≤ Pⱼ₊₁(y)`; and transfer `δ = min(yᵢ − dᵢ, dⱼ − yⱼ)`
from `i` to `j`. Then `δ ≤ yᵢ − yⱼ` because `d` is antitone, the prefix sums of lengths
`i < l ≤ j` drop by `δ` and stay above those of `d`, the others do not move, and `y'` agrees with
`d` at `i` or at `j`.
*Needs:* §1.1 (`TauCeti.robinHood`, `TauCeti.prefixSum_robinHood`, `TauCeti.sum_robinHood`).

**Transfer descent.** If `K` is symmetric convex and `y ∈ K`, every antitone nonnegative `z` with
`Pₖ(z) ≤ Pₖ(y)` for every `k` lies in `K`; no order or sign condition on `y` is needed
(`TauCeti.IsSymmetricConvex.mem_of_prefixSum_le`). In particular, if `x ≺w y` and `y ∈ K`, then
`x ∈ K` (`TauCeti.IsWeaklyMajorizedBy.mem`). The sign invariance supplies the solidity that weak
majorization, which may lower the total, requires; transfers alone keep the total.

**Gauge monotonicity.** Every sublevel set `{x | p(x) ≤ c}` of a symmetric gauge `p` is symmetric
convex (`Seminorm.IsSymmetricGauge.isSymmetricConvex_setOf_le`). Hence, if `x ≺w y`, then
`p(x) ≤ p(y)` for every symmetric gauge `p` on `Fin n → ℝ` (`TauCeti.IsWeaklyMajorizedBy.apply_le`),
and more generally `p(z) ≤ p(y)` for every antitone nonnegative `z` with `Pₖ(z) ≤ Pₖ(y)` for
every `k` (`Seminorm.IsSymmetricGauge.apply_le_of_prefixSum_le`).

*Needs:* §1.1.

**Checks.**
- For `y = (3, 0, 0)` and `d = (1, 1, 1)` the route transfers `1` from coordinate `0` to
  coordinate `1`, giving `(2, 1, 0)` (prefix sums `2, 3, 3` against `1, 2, 3`), then `1` from
  coordinate `0` to coordinate `2`, giving `d`. The number of coordinates agreeing with `d` goes
  `0, 1, 3`.
- For `y = (1, 1)` and `d = (1/2, 1/2)`, `d` is antitone with `Pₖ(d) ≤ Pₖ(y)` for every `k`, but
  every transfer keeps the total `2`, so no sequence of transfers reaches `d`: the hypothesis of
  equal totals in the progress statement cannot be dropped, and weak majorization needs the sign
  invariance of transfer descent instead.
- The set `{(1, 1)}` is convex and invariant under permutations but not under sign changes; it
  contains `y = (1, 1)` and not `(1/2, 1/2) ≺w y`, so transfer descent fails without the sign
  invariance.
- The seminorm `p(x) = |x₀| + 2|x₁|` is invariant under sign changes but not under permutations,
  and `(1, 1) ≺w (2, 0)` while `p(1, 1) = 3 > 2 = p(2, 0)`: gauge monotonicity needs permutation
  invariance. The symmetric gauges `ℓ¹`, `ℓ²` and `ℓ∞` give `2 ≤ 2`, `√2 ≤ 2` and `1 ≤ 2`.

### 1.3 Forward Schur–Horn

Squared overlaps between an eigenbasis and an orthonormal basis form a doubly stochastic matrix
that carries the spectrum onto the diagonal (Schur 1923; Marshall, Olkin and Arnold,
*Inequalities*, Theorem 9.B.1).

The *Schur weight matrix* of orthonormal bases `v` (indexed by `ι`) and `e` (indexed by `κ`) of
`E` is `OrthonormalBasis.schurWeight v e : Matrix ι κ ℝ`, with entries `‖⟪vᵢ, eₖ⟫‖²`
(`OrthonormalBasis.schurWeight_apply`). With `v` the eigenbasis of a symmetric `T` it is the matrix
`w` of Convention 6.

- Its entries are nonnegative (`OrthonormalBasis.schurWeight_nonneg`), each row sums to `1`
  (`OrthonormalBasis.sum_schurWeight_row`) and each column sums to `1`
  (`OrthonormalBasis.sum_schurWeight_col`); for a common index type it lies in Mathlib's
  `doublyStochastic` (`OrthonormalBasis.schurWeight_mem_doublyStochastic`). Exchanging the two
  bases transposes it (`OrthonormalBasis.transpose_schurWeight`).
- *The diagonal is a doubly stochastic image of the spectrum.* For `T` symmetric,
  `hn : finrank 𝕜 E = n` and an orthonormal basis `e`, `dₖ = ∑ᵢ wᵢₖ λᵢ` with `w` the Schur weight
  matrix of `hT.eigenvectorBasis hn` and `e`
  (`LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_schurWeight_mul_eigenvalues`).
- *Forward Schur–Horn.* If `φ : ℝ → ℝ` is convex on a convex set `s` containing every eigenvalue
  of `T`, then `∑ₖ φ(dₖ) ≤ ∑ᵢ φ(λᵢ)` for every orthonormal basis `e`
  (`LinearMap.IsSymmetric.sum_map_re_inner_apply_self_le_sum_map_eigenvalues`). The diagonal
  entries lie in `s` because they are averages of eigenvalues, so `s` need not be assumed to
  contain them. Route: Jensen's inequality (`ConvexOn.map_sum_le`) for each column of `w`, then
  the row sums.
- *Trace in an orthonormal basis.* `∑ₖ dₖ = ∑ᵢ λᵢ` for every orthonormal basis
  (`LinearMap.IsSymmetric.sum_re_inner_apply_self_eq_sum_eigenvalues`).
- *Euclidean contraction of the diagonal.* `∑ₖ dₖ² ≤ ∑ᵢ λᵢ²` for every orthonormal basis
  (`LinearMap.IsSymmetric.sum_sq_re_inner_apply_self_le_sum_sq_eigenvalues`).

*Needs:* Mathlib `LinearMap.IsSymmetric.eigenvalues`, `LinearMap.IsSymmetric.eigenvectorBasis`,
`OrthonormalBasis`, `ConvexOn`, `ConvexOn.map_sum_le`, `doublyStochastic`.

**Checks.**
- On `𝕜²`, let `T` be the orthogonal projection onto the first standard basis vector (eigenvalues
  `1, 0`, eigenbasis the standard basis) and `e₀ = (cos θ, sin θ)`, `e₁ = (−sin θ, cos θ)`. The
  Schur weights are `[[cos²θ, sin²θ], [sin²θ, cos²θ]]`, with rows and columns summing to `1`, and
  the diagonal is `(cos²θ, sin²θ)`, with `cos⁴θ + sin⁴θ ≤ 1`. At `θ = π/4` every weight is `1/2`
  and the diagonal is `(1/2, 1/2)`. The unsquared overlaps `|⟪vᵢ, eₖ⟫|` have row sums
  `cos θ + sin θ = √2` there, so a definition without the square is not stochastic.
- For `T = [[2, 1], [1, 2]]` in the standard basis the diagonal is `(2, 2)` and the eigenvalues
  are `(3, 1)`: the traces agree (`4 = 4`), the squares give `8 ≤ 10`, and `φ(t) = |t − 2|` gives
  `0 ≤ 2`. With the two sides exchanged the last inequality would read `2 ≤ 0`, so the direction
  of the theorem is not symmetric.

### 1.4 Ky Fan sums

Ky Fan sums package the leading singular values into variational quantities; the variational
principle gives the singular-value triangle majorization and the bounded-factor estimate (Fan
1949; Bhatia, *Matrix Analysis*, Chapters II–IV).

The *Ky Fan `k`-sum* of `A : E → F` is `LinearMap.kyFanSum A k`, the sum of `σᵢ(A)` over `i < k`
(`LinearMap.kyFanSum_def`); the square theory uses the same definition with `E = F`. It vanishes
at `k = 0` (`LinearMap.kyFanSum_zero_right`), grows by `σₖ(A)` from `k` to `k + 1`
(`LinearMap.kyFanSum_succ`), is nonnegative (`LinearMap.kyFanSum_nonneg`), monotone in `k`
(`LinearMap.kyFanSum_mono`) and constant from the rank on (`LinearMap.kyFanSum_min_finrank_range`).

- *Ky Fan trace inequality.* If `T` is symmetric and `(wᵢ)` is an orthonormal family of `k`
  vectors, then `∑ᵢ Re⟪T wᵢ, wᵢ⟫ ≤ λ₀ + ⋯ + λₖ₋₁`
  (`LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`).
- *Variational upper bound.* For orthonormal families `(uᵢ)` in `F` and `(vᵢ)` in `E` with `k`
  members, `∑ᵢ Re⟪uᵢ, A vᵢ⟫ ≤ Kₖ(A)` (`LinearMap.sum_re_inner_apply_le_kyFanSum`), and even
  `‖∑ᵢ ⟪uᵢ, A vᵢ⟫‖ ≤ Kₖ(A)` (`LinearMap.norm_sum_inner_le_kyFanSum`).
- *Variational achievability.* For `k ≤ dim E` and `k ≤ dim F` there are orthonormal families of
  `k` vectors with `∑ᵢ ⟪uᵢ, A vᵢ⟫ = Kₖ(A)` (`LinearMap.exists_orthonormal_sum_inner_eq_kyFanSum`);
  so `Kₖ(A) ≤ c` exactly when every such sum over at most `k` pairs has modulus at most `c`
  (`LinearMap.kyFanSum_le_iff`).
- *Singular-value triangle majorization.* For every `n`, the first `n` singular values of `A + B`
  are weakly majorized by the coordinatewise sums `σᵢ(A) + σᵢ(B)`, `i < n`
  (`LinearMap.isWeaklyMajorizedBy_singularValues_add`).
- *Ky Fan triangle inequality.* `Kₖ(A + B) ≤ Kₖ(A) + Kₖ(B)` for every `k`
  (`LinearMap.kyFanSum_add_le`).
- *Unitary invariance.* Composing on the left or on the right with a linear isometric equivalence
  leaves every `Kₖ` unchanged (`LinearMap.kyFanSum_linearIsometryEquiv_comp`,
  `LinearMap.kyFanSum_comp_linearIsometryEquiv`).
- *Adjoint invariance.* `Kₖ(A†) = Kₖ(A)` (`LinearMap.kyFanSum_adjoint`).
- *Scaling.* `Kₖ(c A) = ‖c‖ Kₖ(A)` for `c ∈ 𝕜`, in particular `c Kₖ(A)` for real `c ≥ 0`
  (`LinearMap.kyFanSum_smul`), and `Kₖ(−A) = Kₖ(A)` (`LinearMap.kyFanSum_neg`).
- *Bounded-factor domination.* If `‖C y‖ ≤ c ‖y‖` for every `y` (for `c ≥ 0`: `C` has operator
  norm at most `c`), then `σᵢ(C A) ≤ c σᵢ(A)` for every `i` (`LinearMap.singularValues_comp_le`).

*Needs:* §1.2 (weak majorization); Mathlib `LinearMap.singularValues`, `Orthonormal`,
`LinearIsometryEquiv`.

**The singular pairs attain the bound.** Prove: let `v = A.rightSingularBasis` and
`u = A.leftSingularVector`, the singular system of `A` with `A vᵢ = σᵢ(A) uᵢ` and `uᵢ = 0` when
`σᵢ(A) = 0`. For every `k ≤ dim E`, the sum of `⟪uᵢ, A vᵢ⟫` over `i < k` is `Kₖ(A)`; and for
`k ≤ rank A` the two families `(uᵢ)` and `(vᵢ)`, `i < k`, are orthonormal, so the first `k`
singular pairs attain the variational bound. Route: `⟪uᵢ, A vᵢ⟫ = σᵢ(A) ‖uᵢ‖²` by
`LinearMap.apply_rightSingularBasis`, and `‖uᵢ‖ = 1` when `σᵢ(A) ≠ 0` by
`LinearMap.inner_leftSingularVector`; `σᵢ(A) ≠ 0` exactly for `i < rank A`
(`LinearMap.eigenvalues_adjoint_comp_self_eq_zero_iff`). For `rank A < k ≤ min(dim E, dim F)`,
completing the nonzero left singular vectors to an orthonormal basis of `F`
(`LinearMap.exists_orthonormalBasis_apply_eq_leftSingularVector`) gives attaining orthonormal
families, as in the achievability statement.
*Needs:* Tau Ceti `LinearMap.rightSingularBasis`, `LinearMap.leftSingularVector`,
`LinearMap.apply_rightSingularBasis`, `LinearMap.inner_leftSingularVector`,
`LinearMap.eigenvalues_adjoint_comp_self_eq_zero_iff`,
`LinearMap.exists_orthonormalBasis_apply_eq_leftSingularVector` (the singular system of
PolarDecomposition Part C).

**Checks.**
- For `J = [[0, 1], [0, 0]]` on `𝕜²` (`J e₁ = e₀`, `J e₀ = 0`), `σ(J) = (1, 0)`, so
  `K₁(J) = K₂(J) = 1`, while both eigenvalues are `0`: a Ky Fan sum built from eigenvalues or
  their moduli would give `0`. The pair `u = e₀`, `v = e₁` attains `⟪e₀, J e₁⟫ = 1`.
- For the same `J`, `J†J = diag(0, 1)`, so `v₀` is a unit multiple of `e₁` and `u₀ = J v₀` is the
  same multiple of `e₀`, with `⟪u₀, J v₀⟫ = 1 = K₁(J)`. At `k = 2 > rank J = 1`, `u₁ = 0` and the
  sum is still `K₂(J) = 1`, but `(u₀, u₁)` is not orthonormal: the orthonormality clause needs
  `k ≤ rank A`.
- For `A = diag(1, 0)` and `B = diag(0, 1)`, `σ(A) = σ(B) = (1, 0)` and `σ(A + B) = (1, 1)`:
  `K₁(A + B) = 1 ≤ 2` and `K₂(A + B) = 2 ≤ 2`, but `σ₁(A + B) = 1 > σ₁(A) + σ₁(B) = 0`. The
  triangle inequality holds for prefix sums, as weak majorization, and fails coordinate by
  coordinate.
- For `T = diag(3, 1, −2)`, the orthonormal family `(e₀, e₂)` gives `3 − 2 = 1 ≤ 4 = λ₀ + λ₁`, and
  `(e₀, e₁)` attains `4`.

### 1.5 Diagonal models

Diagonal operators model every singular-value configuration and, through the singular-value
factorization, every operator up to unitaries; they are the square-operator input to the gauge
representation of §2.3, Mirsky's representation of unitarily invariant norms (Mirsky 1960).

The *diagonal operator* with entries `d : ι → 𝕜` in an orthonormal basis `(eᵢ)` of `E` is
Mathlib's `Matrix.toLin e.toBasis e.toBasis (Matrix.diagonal d)`, written `diag(d)`; a real tuple
`b` gives `diag(b)` with entries `(bᵢ : 𝕜)`.

- `diag(d) eᵢ = dᵢ eᵢ` (`Matrix.toLin_diagonal_apply_self`).
- `diag(b + c) = diag(b) + diag(c)` (`Matrix.diagonal_add`, with the linearity of `Matrix.toLin`).
- For real `b`, `diag(b)` is symmetric (`Matrix.isSymmetric_toLin_iff` with
  `Matrix.isHermitian_diagonal_of_self_adjoint`: real entries are self-adjoint in `𝕜`).
- *Singular values.* If `π : Fin n ≃ ι` lists the indices so that `‖d(π k)‖` is nonincreasing,
  then `σₖ(diag(d)) = ‖d(π k)‖` for `k < n` (`Matrix.singularValues_toLin_diagonal`), and
  `σₖ = 0` from `k = dim E` on (`LinearMap.singularValues_of_finrank_le`): the singular-value
  sequence is the nonincreasing zero-padded rearrangement of `(|bᵢ|)` for real `b`.
- *Singular-value diagonal factorization.* Every endomorphism `A` of `E` is `U diag(σ(A)) V` for
  linear isometric equivalences `U, V` of `E`, in any prescribed orthonormal basis indexed by
  `Fin n` (`LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_diagonal_comp`).
- The rectangular form of the model is the map `LinearMap.diagonalSum v w x`, sending `y` to
  `∑ᵢ xᵢ ⟪vᵢ, y⟫ wᵢ` for families `(vᵢ)` in `E`, `(wᵢ)` in `F` and a real tuple `x`; it is additive
  in `x` (`LinearMap.diagonalSum_add`), and for `v = w = e` it is `diag(x)`.

*Needs:* Mathlib `Matrix.toLin`, `Matrix.diagonal`, `Matrix.diagonal_add`,
`Matrix.isSymmetric_toLin_iff`, `Matrix.isHermitian_diagonal_of_self_adjoint`,
`LinearMap.singularValues_of_finrank_le`; Tau Ceti `Matrix.singularValues_toLin_diagonal`,
`LinearMap.diagonalSum`.

**Checks.**
- For `b = (1, −3, 2)`, `σ(diag(b)) = (3, 2, 1, 0, …)`, while the eigenvalues in decreasing order
  are `(2, 1, −3)`: a singular-value formula that sorts `b` instead of `|b|` produces a negative
  value.
- Over `ℂ`, `diag(i, 0)` has `⟪diag(i, 0) e₀, e₀⟫ = −i` and `⟪e₀, diag(i, 0) e₀⟫ = i`, so it is
  not symmetric: the symmetry statement needs real entries.

### Examples

- The trace identity and the Euclidean contraction of §1.3 are the instances `φ(t) = ±t` and
  `φ(t) = t²` of the forward Schur–Horn inequality. For `T = [[2, 1], [1, 2]]` the diagonal
  `(2, 2)` is weakly majorized by the spectrum `(3, 1)` (`2 ≤ 3`, `4 ≤ 4`), and the `ℓ²` gauge of
  §1.2 gives `√8 ≤ √10`, the quadratic instance again.
- The shear `S = [[1, 1], [0, 1]]` on `𝕜²` has `S†S = [[1, 1], [1, 2]]`, singular values
  `((1 + √5)/2, (√5 − 1)/2)`, `K₁(S) = (1 + √5)/2` and `K₂(S) = √5`. The orthonormal pair
  `u = v = e₀` gives `⟪e₀, S e₀⟫ = 1 ≤ K₁(S)`, as the variational bound of §1.4 requires.
- With `C = 2 · id`, bounded-factor domination is an equality: `σ(2J) = (2, 0) = 2 σ(J)` for the
  nilpotent `J` of §1.4.

### Dependencies

Layer 1 rests on Mathlib and on Tau Ceti. From Mathlib it uses singular values, the sorted
eigenvalues and eigenbases of symmetric operators, orthonormal bases and families, convexity with
Jensen's inequality, doubly stochastic matrices, and matrices of linear maps. From Tau Ceti it uses
prefix sums and the singular system of a map (PolarDecomposition Part C). Within the layer, §1.2
uses §1.1, §1.4 uses the weak majorization of §1.2, and §1.3 and §1.5 use only the libraries.

## Layer 2: rectangular unitarily invariant seminorms

### 2.1 Rectangular seminorms and transport

The rectangular interface lets unitaries act on source and target independently; isometric
transport, zero extension and adjoints connect rectangular maps to the singular-value theory
(Bhatia, *Matrix Analysis*, Chapters II–IV).

A *unitarily invariant seminorm* on `E →ₗ[𝕜] F` is `N : TauCeti.UnitarilyInvariantSeminorm 𝕜 E F`:
a structure extending `Seminorm 𝕜 (E →ₗ[𝕜] F)` with the field `N(U ∘ A ∘ V) = N(A)` for every
`U : F ≃ₗᵢ[𝕜] F` and `V : E ≃ₗᵢ[𝕜] E`. A square unitarily invariant seminorm has type
`TauCeti.UnitarilyInvariantSeminorm 𝕜 E E`.

- It carries `FunLike` and `SeminormClass` instances, so the seminorm API applies: `N ≥ 0`,
  `N(0) = 0`, the triangle inequality for finite sums and `N(c A) = ‖c‖ N(A)`; two such seminorms
  with the same values are equal (`TauCeti.UnitarilyInvariantSeminorm.ext`).
- Unitary invariance on both sides and on each side (`map_linearIsometryEquiv_comp_comp`,
  `map_linearIsometryEquiv_comp`, `map_comp_linearIsometryEquiv`).

The *two-sided unitary orbit* of `C : E → F` is `LinearMap.twoSidedUnitaryOrbit C`, the maps
`U ∘ C ∘ V` (`LinearMap.mem_twoSidedUnitaryOrbit`); orbits are equivalence classes
(`LinearMap.twoSidedUnitaryOrbit_eq_of_mem`). Its *orbit hull* is
`LinearMap.twoSidedUnitaryOrbitHull C`, the convex combinations of orbit points with real weights
(`LinearMap.mem_twoSidedUnitaryOrbitHull`); it is convex
(`LinearMap.smul_add_smul_mem_twoSidedUnitaryOrbitHull`), contained in every set that contains the
orbit and is closed under convex combinations of two points
(`LinearMap.twoSidedUnitaryOrbitHull_subset`), and equal to `convexHull ℝ` of the orbit when `F`
is a real vector space compatibly with `𝕜` (`LinearMap.twoSidedUnitaryOrbitHull_eq_convexHull`).

A *finite orbit certificate* of `X` over `C`, indexed by a finite type `ι`, is
`TauCeti.UnitaryOrbitCertificate ι C X`: coefficients `aᵢ ∈ 𝕜` and unitaries `Uᵢ, Vᵢ` with
`X = ∑ᵢ aᵢ Uᵢ C Vᵢ`. Its *mass* is `TauCeti.UnitaryOrbitCertificate.mass`, equal to `∑ᵢ ‖aᵢ‖`
(`TauCeti.UnitaryOrbitCertificate.mass_def`) and nonnegative
(`TauCeti.UnitaryOrbitCertificate.mass_nonneg`).

- *Isometric transport.* For linear isometric equivalences `eE : E ≃ₗᵢ[𝕜] E'` and
  `eF : F ≃ₗᵢ[𝕜] F'`, `TauCeti.UnitarilyInvariantSeminorm.arrowCongr eE eF` is an equivalence
  between the unitarily invariant seminorms on `E → F` and on `E' → F'`, sending `N` to
  `A ↦ N(eF⁻¹ ∘ A ∘ eE)` (`arrowCongr_apply`). With `eF` the identity it transports the domain,
  with `eE` the identity the codomain, and along unitaries of `E` and `F` it fixes every `N`
  (`arrowCongr_eq_self`).
- *Zero extension.* `LinearMap.zeroExtension A : WithLp 2 (E × F) →ₗ[𝕜] WithLp 2 (E × F)` sends
  `(x, y)` to `(0, A x)` (`LinearMap.zeroExtension_apply`) and has the singular-value sequence of
  `A` (`LinearMap.singularValues_zeroExtension`).
- *Adjoint transport.* `σ(A†) = σ(A)` (`LinearMap.singularValues_adjoint`), and
  `TauCeti.UnitarilyInvariantSeminorm.compAdjoint N` is the unitarily invariant seminorm
  `B ↦ N(B†)` on `F → E` (`compAdjoint_apply`); doing it twice returns `N`
  (`compAdjoint_compAdjoint`).

*Needs:* Mathlib `Seminorm`, `LinearIsometryEquiv`, `LinearMap.adjoint`, `WithLp`, `convexHull`;
Tau Ceti `LinearMap.singularValues_adjoint` (PolarDecomposition `PD-C08`).

**Checks.**
- The entrywise sum `∑ᵢⱼ |aᵢⱼ|` of the matrix in the standard basis of `𝕜²` is a seminorm but is
  not unitarily invariant: it is `2` at the identity, and `2√2` at the rotation by `π/4`, which
  lies in the two-sided orbit of the identity.
- The zero extension of the nilpotent `J` of §1.4 is an endomorphism of `𝕜⁴` with singular values
  `(1, 0, 0, 0)`, those of `J`. The self-adjoint dilation `(x, y) ↦ (J† y, J x)` has singular
  values `(1, 1, 0, 0)`, so a zero extension that also placed the adjoint block would double every
  singular value.

### 2.2 Orbit hulls, certificates and Fan dominance

Finite certificates turn orbit-hull membership into seminorm bounds, and Ky Fan domination is
exactly orbit-hull membership (Bhatia, *Matrix Analysis*, Theorem IV.2.2).

- *Certificates from convex combinations.* Every point of the orbit hull of `C` has an orbit
  certificate over `C` of mass `1`
  (`TauCeti.UnitaryOrbitCertificate.exists_mass_eq_one_of_mem_twoSidedUnitaryOrbitHull`).
- *Reindexing.* A certificate reindexes along an equivalence `ι ≃ κ` of finite index types
  (`TauCeti.UnitaryOrbitCertificate.reindex`) with the same mass
  (`TauCeti.UnitaryOrbitCertificate.mass_reindex`).
- *Certificate bound.* If `X` has a certificate over `C` of mass `m`, then `N(X) ≤ m N(C)` for
  every unitarily invariant seminorm `N` (`TauCeti.UnitaryOrbitCertificate.apply_le_mass_mul`); in
  particular `N(X) ≤ N(C)` on the orbit hull (`map_le_of_mem_twoSidedUnitaryOrbitHull`).
- *Rectangular singular-value factorization.* For orthonormal bases `e` of `E` (indexed by
  `Fin m`) and `f` of `F` (indexed by `Fin n`), `A = U ∘ D ∘ V` for linear isometric equivalences
  `U` of `F` and `V` of `E`, where `D` is the map whose matrix in `e, f` has `σᵢ(A)` at `(i, i)` and
  `0` elsewhere (`LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_comp`).
- *Equal singular values.* `X` lies in the two-sided orbit of `C` exactly when
  `σ(X) = σ(C)` (`LinearMap.mem_twoSidedUnitaryOrbit_iff_singularValues_eq`): maps `A, B : E → F`
  with the same singular values satisfy `A = U B V` for unitaries `U` of `F` and `V` of `E`.
- *Determination by singular values.* `σ(A) = σ(B)` gives `N(A) = N(B)` for every unitarily
  invariant seminorm `N` (`map_eq_of_singularValues_eq`).
- *Orbit-hull characterization of Ky Fan domination.* `A` lies in the orbit hull of `C` exactly
  when `Kₖ(A) ≤ Kₖ(C)` for every `k` (`LinearMap.mem_twoSidedUnitaryOrbitHull_iff_kyFanSum_le`).
- *Rectangular Fan dominance.* If `Kₖ(A) ≤ Kₖ(C)` for every `k`, then `N(A) ≤ N(C)` for every
  unitarily invariant seminorm `N` on `E → F` (`map_le_of_kyFanSum_le`).

*Needs:* §2.1; §1.4 (`LinearMap.kyFanSum`); §1.2 (transfer descent, for the hull
characterization); §1.5 (`LinearMap.diagonalSum`); Mathlib `mem_convexHull_iff_exists_fintype`,
`Matrix.toLin`.

**Checks.**
- For `C = diag(2, 0)` and the swap `P` of the two basis vectors, `(C + P C P)/2` is the identity
  `I` of `𝕜²`, so `I` lies in the orbit hull of `C`; accordingly `K₁(I) = 1 ≤ 2` and
  `K₂(I) = 2 ≤ 2`, and the operator, Frobenius and nuclear seminorms give `1 ≤ 2`, `√2 ≤ 2` and
  `2 ≤ 2`. Conversely `K₁(C) = 2 > K₁(I)`, so `C` is not in the orbit hull of `I`, and its
  operator norm `2` exceeds that of `I`.
- `X = C − P C P = diag(2, −2)` has a certificate over `C` of mass `2`, and the certificate bound
  `N(X) ≤ 2 N(C)` is an equality for the nuclear seminorm (`4 ≤ 4`) and strict for the operator
  norm (`2 ≤ 4`).
- `J = [[0, 1], [0, 0]]` and `B = diag(1, 0)` both have singular values `(1, 0)`, and `J = B P`;
  their eigenvalues `(0, 0)` and `(1, 0)` differ, so `J` is not of the form `U B U⁻¹`. An orbit
  under conjugation would separate them; the two-sided orbit does not.

### 2.3 Square-operator consequences

Specializing to `E = F`, the diagonal models of §1.5 identify every unitarily invariant seminorm
with a symmetric gauge of the singular values (Mirsky 1960; Bhatia, *Matrix Analysis*,
Chapters II–IV).

- *Gauge representation.* Every unitarily invariant seminorm `N` on the endomorphisms of `E` is a
  symmetric gauge of the singular-value tuple of length `dim E`: there is `g` with
  `Seminorm.IsSymmetricGauge g` and `N(A) = g(σ₀(A), …, σₙ₋₁(A))` for every `A`, `n = dim E`
  (`exists_isSymmetricGauge_forall_map_eq`). In the rectangular form the gauge is
  `TauCeti.UnitarilyInvariantSeminorm.gauge N` on tuples of length `p = min(dim E, dim F)`, whose
  value at `x` is `N` of `y ↦ ∑ᵢ xᵢ ⟪vᵢ, y⟫ wᵢ` for any orthonormal families `(vᵢ)` in `E` and
  `(wᵢ)` in `F`, `i < p` (`gauge_apply`); it is symmetric (`isSymmetricGauge_gauge`) and
  `N(A) = gauge(σ₀(A), …, σₚ₋₁(A))` (`map_eq_gauge_singularValues`). Conversely every symmetric
  gauge `g` on `n`-tuples gives the unitarily invariant seminorm `A ↦ g(σ₀(A), …, σₙ₋₁(A))`
  (`TauCeti.UnitarilyInvariantSeminorm.ofIsSymmetricGauge`, `ofIsSymmetricGauge_apply`), and for
  `n = p` the two constructions are inverse (`ofIsSymmetricGauge_gauge`,
  `gauge_ofIsSymmetricGauge`).
- *Ideal inequality.* If `‖C y‖ ≤ c ‖y‖` for every `y` (for `c ≥ 0`: `‖C‖ ≤ c`), then
  `N(C A) ≤ c N(A)` and `N(A C) ≤ c N(A)`, for square and for rectangular `A` with `C` acting on
  the matching side (`map_comp_le_left`, `map_comp_le_right`); composing with an orthogonal
  projection `Submodule.starProjection` on either side does not increase `N`
  (`map_starProjection_comp_le`, `map_comp_starProjection_le`).
- *Modulus invariance.* `N(|A|) = N(A)` for every unitarily invariant seminorm `N` on the
  endomorphisms of `E`, where `|A| = LinearMap.operatorAbs A = √(A†A)` (`map_operatorAbs`), from
  `σ(|A|) = σ(A)` (`LinearMap.singularValues_operatorAbs`, PolarDecomposition `PD-C28`) and §2.2.

*Needs:* §2.2; §1.5; §1.2 (gauge monotonicity, for `ofIsSymmetricGauge`); Tau Ceti
`LinearMap.operatorAbs`, `LinearMap.singularValues_operatorAbs`, `LinearMap.diagonalSum`; Mathlib
`Submodule.starProjection`.

**Checks.**
- The gauges of the concrete seminorms of §2.5 are `max |xᵢ|` (operator norm), `(∑ xᵢ²)^(1/2)`
  (Frobenius), `∑ |xᵢ|` (nuclear) and the sum of the `k` largest `|xᵢ|` (Ky Fan); at `σ = (3, 1)`
  they give `3`, `√10`, `4` and, for `k = 1`, `3`.
- For the nilpotent `J` of §1.4, `J†J = diag(0, 1)`, so `|J| = diag(0, 1) ≠ J`; both have
  singular values `(1, 0)` and, for instance, Frobenius seminorm `1`.
- For `C = diag(1, 0)` (`‖C‖ = 1`) and `A = I`, the nuclear seminorm gives
  `N(C A) = 1 ≤ 2 = N(A)`.

### 2.4 Orthogonal block sums

Block sums assemble estimates block by block at the level of singular values and orbit hulls,
with constant one, as spectral-subspace perturbation estimates require; the comparison is a
consequence of Fan dominance (Bhatia, *Matrix Analysis*, Theorem IV.2.2).

The *orthogonal block sum* of `A : E₁ → F₁` and `B : E₂ → F₂` is
`A ⊕ B = (A.prodMap B).withLpMap 2` (Convention 9), built from Mathlib's `LinearMap.prodMap` and
`LinearMap.withLpMap`.

- *Componentwise action.* `(A ⊕ B)(x, y) = (A x, B y)` (`LinearMap.coe_withLpMap` with
  `LinearMap.prodMap_apply`).
- *Adjoint.* `(A ⊕ B)† = A† ⊕ B†` (`LinearMap.adjoint_prodMap_withLpMap`).
- *Composition.* `(A₁ ⊕ B₁)(A₂ ⊕ B₂) = A₁A₂ ⊕ B₁B₂` whenever the compositions are typed
  (`LinearMap.withLpMap_comp` with `LinearMap.prodMap_comp`).
- *Doubled block.* `σᵢ(A ⊕ A) = σ⌊i/2⌋(A)`: every singular value of `A` repeated twice
  (`LinearMap.singularValues_prodMap_withLpMap_self`), and `K₂ₖ(A ⊕ A) = 2 Kₖ(A)` for every `k`
  (`LinearMap.kyFanSum_prodMap_withLpMap_self`).
- *Orbit-hull stability.* If `A` is in the orbit hull of `C` and `B` in that of `D`, then `A ⊕ B`
  is in the orbit hull of `C ⊕ D` (`LinearMap.prodMap_withLpMap_mem_twoSidedUnitaryOrbitHull`);
  blockwise Ky Fan domination gives Ky Fan domination of the block sums
  (`LinearMap.kyFanSum_prodMap_withLpMap_le`).
- *Sharp block-sum comparison.* If `Kₖ(A) ≤ Kₖ(C)` and `Kₖ(B) ≤ Kₖ(D)` for every `k`, then
  `N(A ⊕ B) ≤ N(C ⊕ D)` for every unitarily invariant seminorm `N` on
  `WithLp 2 (E₁ × E₂) → WithLp 2 (F₁ × F₂)` (`map_prodMap_withLpMap_le`).

*Needs:* §2.2; Mathlib `LinearMap.prodMap`, `LinearMap.prodMap_apply`, `LinearMap.prodMap_comp`,
`LinearMap.withLpMap`, `LinearMap.coe_withLpMap`, `LinearMap.withLpMap_comp`, `WithLp`.

**Checks.**
- For `A = diag(3, 1)`, `σ(A ⊕ A) = (3, 3, 1, 1, 0, …)`, so `K₂(A ⊕ A) = 6 = 2 K₁(A)` and
  `K₄(A ⊕ A) = 8 = 2 K₂(A)`. Interleaving the two copies as `σ_(i mod 2)(A)` would give
  `(3, 1, 3, 1)`, which is not nonincreasing.
- Take `A = B = I` on `𝕜²` and `C = D = diag(2, 0)`. For `k = 1, 2, 3, …`, `Kₖ(I) = 1, 2, 2, …` is
  at most `Kₖ(diag(2, 0)) = 2, 2, 2, …`, and `A ⊕ B` is the identity of `𝕜⁴` while `C ⊕ D` has
  singular values `(2, 2, 0, 0)`. The comparison gives `1 ≤ 2` for the operator norm, `2 ≤ 2√2`
  for the Frobenius seminorm and `4 ≤ 4` for the nuclear seminorm, so the constant one cannot be
  lowered. Bounding `A ⊕ 0` by `C ⊕ 0` and `0 ⊕ B` by `0 ⊕ D` and adding gives only
  `‖A ⊕ B‖ ≤ 4`.

### 2.5 Concrete rectangular seminorms

The operator, Frobenius, Ky Fan and nuclear seminorms instantiate the rectangular interface, and
their basis and singular-value formulas identify them with the classical norms (Bhatia, *Matrix
Analysis*, Chapters II–IV).

- *Operator norm.* `TauCeti.UnitarilyInvariantSeminorm.opNorm 𝕜 E F`, with value the operator norm
  of `LinearMap.toContinuousLinearMap A` (`opNorm_apply`).
- *Frobenius.* `TauCeti.UnitarilyInvariantSeminorm.frobenius 𝕜 E F`.
- *Ky Fan.* `TauCeti.UnitarilyInvariantSeminorm.kyFan 𝕜 E F k` for every `k`, with value `Kₖ(A)`
  (`kyFan_apply`).
- *Nuclear.* `TauCeti.UnitarilyInvariantSeminorm.nuclear 𝕜 E F`, with value `∑ᵢ σᵢ(A)`
  (`nuclear_apply`); it equals `Kₖ(A)` for `k ≥ rank A` (`LinearMap.kyFanSum_eq_nuclear`).
- *Frobenius basis formula.* For every orthonormal basis `(bᵢ)` of `E`,
  `‖A‖_F = (∑ᵢ ‖A bᵢ‖²)^(1/2)` (`frobenius_apply`, `sq_frobenius_apply`); in orthonormal bases
  `(bᵢ)` of `E` and `(cⱼ)` of `F`, `‖A‖_F² = ∑ᵢⱼ ‖⟪cⱼ, A bᵢ⟫‖²`
  (`sq_frobenius_apply_eq_sum_norm_inner_sq`), the Frobenius norm of the matrix of `A`
  (`LinearMap.frobenius_norm_toMatrix`).
- *Basis independence.* `∑ᵢ ‖A bᵢ‖²` is the same for any two orthonormal bases of `E`
  (`LinearMap.sum_norm_apply_sq_eq_sum_norm_apply_sq`).
- *Frobenius singular-value formula.* `‖A‖_F = (∑ᵢ σᵢ(A)²)^(1/2)`
  (`frobenius_apply_eq_sqrt_sum_sq_singularValues`).
- *Nuclear singular-value formula.* `‖A‖₁ = ∑ᵢ σᵢ(A)` (`nuclear_apply`).
- *Rank-sharp nuclear-to-Frobenius bound.* `‖A‖₁ ≤ √(rank A) ‖A‖_F`
  (`nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply`).

*Needs:* §2.1; §1.4 (`LinearMap.kyFanSum`, `LinearMap.kyFanSum_add_le`); Mathlib
`LinearMap.toContinuousLinearMap`, `OrthonormalBasis`, `LinearMap.toMatrix`.

**Checks.**
- For the shear `S = [[1, 1], [0, 1]]`, `∑ᵢ ‖S bᵢ‖²` is `1 + 2 = 3` in the standard basis and
  `5/2 + 1/2 = 3` in the basis rotated by `π/4`; `σ(S) = ((1 + √5)/2, (√5 − 1)/2)` has
  `σ₀² + σ₁² = 3`, so `‖S‖_F = √3`. Since `σ₀σ₁ = |det S| = 1`, `‖S‖₁ = √(3 + 2) = √5`, and
  `‖S‖ = (1 + √5)/2`. The rank-sharp bound reads `√5 ≤ √2 · √3`.
- The rank-sharp bound is an equality at the identity of `𝕜²` (`2 = √2 · √2`) and at the
  nilpotent `J` of §1.4 (`1 = √1 · 1`). With `√(dim E)` in place of `√(rank A)` it would read
  `1 ≤ √2` at `J`, true but not attained.

### 2.6 Two-dimensional sharpness models

Diagonal, off-diagonal and triangular operators of a plane are explicit singular-value models for
sharpness arguments, and trace and determinant recover the whole squared singular spectrum of a
map out of a plane. Here `e` is an orthonormal basis of `E` indexed by `Fin 2`, so `dim E = 2`.

- *Diagonal model.* If `‖d₁‖ ≤ ‖d₀‖`, the map with matrix `diag(d₀, d₁)` in `e` has singular
  values `(‖d₀‖, ‖d₁‖, 0, 0, …)`; for real `s₀ ≥ s₁ ≥ 0` this is `(s₀, s₁, 0, 0, …)`
  (`Matrix.singularValues_toLin_diagonal_fin_two`).
- *Symmetric off-diagonal model.* `[[0, r], [r, 0]]` has singular values `(|r|, |r|, 0, …)`
  (`Matrix.singularValues_toLin_offDiag_self_fin_two`); more generally `[[0, b], [c, 0]]` with
  `‖b‖ ≤ ‖c‖` has `(‖c‖, ‖b‖, 0, …)` (`Matrix.singularValues_toLin_offDiag_fin_two`).
- *One-sided triangular model.* `[[0, 0], [r, 0]]` has singular values `(|r|, 0, …)`
  (`Matrix.singularValues_toLin_offDiag_zero_fin_two`).
- *Trace–determinant recovery.* For `A : E → F` with `dim E = 2`, `σ(A) = (σ₀, σ₁, 0, …)`
  (`LinearMap.singularValues_eq_single_add_single_of_finrank_eq_two`),
  `tr(A†A) = σ₀² + σ₁²` (`LinearMap.trace_adjoint_comp_self_eq_of_finrank_eq_two`) and
  `det(A†A) = σ₀²σ₁²` (`LinearMap.det_adjoint_comp_self_eq_of_finrank_eq_two`); with
  `t = tr(A†A)` and `δ = det(A†A)`, `σ₀² = (t + √(t² − 4δ))/2` and `σ₁² = (t − √(t² − 4δ))/2`
  (`LinearMap.sq_singularValues_zero_of_finrank_eq_two`,
  `LinearMap.sq_singularValues_one_of_finrank_eq_two`). So two maps out of planes have the same
  singular values exactly when their Gram operators have the same trace and determinant
  (`LinearMap.singularValues_eq_iff_trace_eq_and_det_eq`).

*Needs:* §1.5; Mathlib `Matrix.toLin`, `LinearMap.trace`, `LinearMap.det`.

**Checks.**
- `[[0, r], [r, 0]]` has eigenvalues `±r` and singular values `(|r|, |r|)`; `[[0, 0], [r, 0]]` has
  both eigenvalues `0` and singular values `(|r|, 0)`. For `r = 2` these are `(2, 2)` and `(2, 0)`;
  for `r = i`, `(1, 1)` and `(1, 0)`. A model read off the eigenvalues would get both wrong.
- For the shear `S` of §2.5, `tr(S†S) = 3` and `det(S†S) = 1`, so `σ₀² = (3 + √5)/2` and
  `σ₁² = (3 − √5)/2`. The diagonal map `diag((1 + √5)/2, (√5 − 1)/2)` has the same Gram trace and
  determinant, hence the same singular values, although `S` is not normal.

### Examples

- At the shear `S`, the four concrete seminorms of §2.5 take the values `‖S‖ = (1 + √5)/2`,
  `‖S‖_F = √3`, `‖S‖₁ = √5` and `K₁(S) = (1 + √5)/2`.
- On the endomorphisms of `𝕜²`, the Frobenius seminorm of §2.5 at `E = F` is the square instance,
  and §2.2 specialized to `E = F` gives determination by singular values and Fan dominance for
  square operators: `I` and `diag(2, 0)` satisfy `Kₖ(I) ≤ Kₖ(diag(2, 0))` for every `k`, so
  `N(I) ≤ N(diag(2, 0))` for every unitarily invariant `N`, and modulus invariance (§2.3) gives
  `N(|J|) = N(J)` for the nilpotent `J`.
- The zero extension of §2.1 carries a rectangular `A : E → F` to an endomorphism of
  `WithLp 2 (E × F)` with the same singular values, so square statements apply to it.

### Dependencies

Layer 2 rests on Layer 1: the Ky Fan sums and their triangle inequality (§1.4), weak majorization
and gauge monotonicity (§1.2), and the diagonal models (§1.5). From Mathlib it uses seminorms,
linear isometric equivalences, adjoints, convex hulls, the `L²` products `WithLp 2`, product maps,
matrices of linear maps, trace and determinant. From Tau Ceti it uses the singular values of the
adjoint and of the modulus and the modulus itself (PolarDecomposition, Parts A and C).

## Downstream consumers

- [PrincipalAngles](../PrincipalAngles/README.md) states the eigenvalue-perturbation estimates
  of its Part B for the seminorms of Layer 2, uses modulus invariance (§2.3) for the projector
  difference, and relies on the majorization of diagonals (§1.3) for Davis's lower bound. Its own
  Birkhoff bilinear bound, von Neumann trace inequality and permutation-orbit hull for diagonals
  (PrincipalAngles `PA-B31`, `PA-B32`, `PA-B34`) rest on Birkhoff's theorem (Mathlib
  `doublyStochastic_eq_convexHull_permMatrix`) and the rearrangement inequality (Mathlib
  `MonovaryOn.sum_comp_perm_smul_le_sum_smul`).
- [SpectralSubspacePerturbation](../SpectralSubspacePerturbation/README.md) consumes the
  rectangular seminorms with Fan dominance (§2.1–§2.2), the block-sum comparison (§2.4) and the
  Frobenius seminorm (§2.5); the estimates lifted by Layer 2 are stated there.
- [OperatorIdeals](../OperatorIdeals/README.md) consumes the Ky Fan triangle inequality (§1.4) and
  the majorization engine (§1.2) for its symmetric-gauge layer, and identifies its `S₂` norm with
  the Frobenius seminorm (§2.5).
- [NoncommutativeIntegration](../../NoncommutativeIntegration/README.md) uses the Ky Fan maximum
  principle and triangle inequality (§1.4) for a matrix Check.
- [ComplexHessianEquations](../../ComplexHessianEquations/README.md) uses the Robin Hood transfers
  and the transfer closure (§1.1–§1.2) for the concavity of spectral functions, and Ky Fan's
  maximum principle (§1.4).

## Provenance

An Apache-2.0 implementation of both layers exists in the
[AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware, Inc.).
The proof strategy for the forward Schur–Horn inequality of §1.3 is credited to
[`rjwalters/lean-genius`](https://github.com/rjwalters/lean-genius),
`proofs/Proofs/SchurHornMajorization.lean` (commit `3e09c97`; that repository declares no
licence); the formal development re-derives it on its own foundations.

## Scope and ownership

**This roadmap owns** weak majorization of real tuples, Robin Hood transfers and T-transforms,
symmetric convex sets and symmetric gauges, transfer descent and gauge monotonicity (§1.1–§1.2);
Schur weights, the forward Schur–Horn inequality and its trace and quadratic instances (§1.3); Ky
Fan sums with their variational principle, triangle majorization, invariances and bounded-factor
domination (§1.4); the diagonal models (§1.5); and the whole of Layer 2: rectangular unitarily
invariant seminorms, their orbits, orbit hulls and certificates, Fan dominance, the gauge
representation, the ideal inequality, modulus invariance, orthogonal block sums, the operator,
Frobenius, Ky Fan and nuclear seminorms, and the planar models. Unitarily invariant norms are
defined here once, for square and rectangular maps.

**Already in the library.** Every statement of Layers 1 and 2 is in the pinned Tau Ceti library or
in Mathlib, under the declarations named above and listed under the supplier contracts, except two
targets of this roadmap: the progress step of §1.2, which Tau Ceti proves only as a private theorem,
and the attainment of the Ky Fan bound by the singular pairs in §1.4. The diagonal operator, its
additivity and symmetry (§1.5) and the componentwise action and composition of block sums (§2.4)
are Mathlib's; the rest is Tau Ceti's.

**Owned elsewhere and consumed here.**

- *The operator modulus, the singular system and the singular-value identities* `σ(A†) = σ(A)`,
  `σ(|A|) = σ(A)` and `σᵢ(A)² = λᵢ(A†A)`, and the Courant–Fischer min–max formula behind the Ky Fan
  trace inequality: PolarDecomposition (Part A, `PD-A51`; Part C, `PD-C08`–`PD-C18`, `PD-C28`),
  present in Tau Ceti as the declarations named in §1.4, §2.1 and §2.3; nothing here re-proves
  them.
- *Gram rigidity and coordinate isometries*: OrthogonalGeometry (`OG-01`–`OG-08`), on which the
  rectangular singular-value factorization and the orbit statements of §2.2 rest.
- *Approximation numbers and every gauge of them*: OperatorIdeals; this roadmap stays in finite
  dimension.
- *Angles, the permutation-orbit hull for diagonals, Davis's bound and von Neumann's trace
  inequality*: PrincipalAngles.

**Former labels.** Other roadmaps cite targets of this one by the former labels `MAJ-Ann` and
`MAJ-Bnn`. The former Part A is Layer 1 and the former Part B is Layer 2, and each label resolves to
the section above that treats it:

| Former labels | Section |
| --- | --- |
| `MAJ-A01`–`MAJ-A06` | §1.1 |
| `MAJ-A07`–`MAJ-A17` | §1.2 |
| `MAJ-A18`–`MAJ-A25` | §1.3 |
| `MAJ-A26`–`MAJ-A35` | §1.4 |
| `MAJ-A36`–`MAJ-A40` | §1.5 |
| `MAJ-B01`–`MAJ-B11` | §2.1 |
| `MAJ-B14`–`MAJ-B21` | §2.2 |
| `MAJ-B44`–`MAJ-B46` | §2.3 |
| `MAJ-B22`–`MAJ-B29` | §2.4 |
| `MAJ-B30`–`MAJ-B38` | §2.5 |
| `MAJ-B40`–`MAJ-B43` | §2.6 |

## Exact supplier contracts

### From Mathlib

- `LinearMap.singularValues` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`): for a
  map between finite-dimensional inner product spaces, the finitely supported sequence
  `ℕ →₀ ℝ` whose first `dim E` entries are the square roots of the eigenvalues of `A†A` in
  nonincreasing order with multiplicity and whose later entries vanish
  (`LinearMap.singularValues_fin`, `LinearMap.singularValues_of_finrank_le`,
  `LinearMap.sq_singularValues_fin`).
- `LinearMap.IsSymmetric.eigenvalues` and `LinearMap.IsSymmetric.eigenvectorBasis`: for a
  symmetric `T` and `hn : finrank 𝕜 E = n`, the nonincreasing eigenvalues `Fin n → ℝ` with an
  orthonormal eigenbasis indexed by `Fin n`.
- `LinearMap.adjoint`, `OrthonormalBasis`, `Orthonormal`, `LinearIsometryEquiv`,
  `Unitary.linearIsometryEquiv` (the unitary elements of `H →L[𝕜] H` are the linear isometric
  equivalences of `H`), `unitary`, `stdOrthonormalBasis`, `Submodule.starProjection`,
  `LinearMap.toContinuousLinearMap`.
- `Seminorm`, `SeminormClass`, `Seminorm.of`; `Convex`, `convexHull`,
  `mem_convexHull_iff_exists_fintype`, `ConvexOn`, `ConvexOn.map_sum_le` (Jensen's inequality);
  `doublyStochastic`.
- `Matrix.toLin`, `Matrix.diagonal`, `Matrix.diagonal_add`, `Matrix.isSymmetric_toLin_iff` (the
  matrix of a map in an orthonormal basis is Hermitian exactly when the map is symmetric),
  `Matrix.isHermitian_diagonal_of_self_adjoint`, `LinearMap.toMatrix`, `LinearMap.trace`,
  `LinearMap.det`.
- `WithLp`, `LinearMap.withLpMap` with `LinearMap.coe_withLpMap` and `LinearMap.withLpMap_comp`
  (`Mathlib/Analysis/Normed/Lp/WithLp.lean`); `LinearMap.prodMap` with `LinearMap.prodMap_apply`
  and `LinearMap.prodMap_comp` (`Mathlib/LinearAlgebra/Prod.lean`).

### From Tau Ceti

Paths are under `TauCeti/`. Each declaration is assumed to state what its entry in the layers
above says, with the hypotheses given there.

- `Algebra/BigOperators/Finset/PartialSum.lean`: `TauCeti.prefixSum`, `TauCeti.prefixSum_def`,
  `TauCeti.prefixSum_add`, `TauCeti.prefixSum_smul`, `TauCeti.prefixSum_append_zero`.
- `Analysis/Convex/Majorization.lean`: `TauCeti.IsWeaklyMajorizedBy`,
  `TauCeti.IsWeaklyMajorizedBy.refl`, `TauCeti.IsWeaklyMajorizedBy.trans`,
  `TauCeti.IsWeaklyMajorizedBy.add`, `TauCeti.IsWeaklyMajorizedBy.smul`,
  `TauCeti.IsWeaklyMajorizedBy.append_zero`, `TauCeti.IsWeaklyMajorizedBy.mem`,
  `TauCeti.IsWeaklyMajorizedBy.apply_le`; `TauCeti.robinHood`, `TauCeti.robinHood_self`,
  `TauCeti.robinHood_apply_left`, `TauCeti.robinHood_apply_right`,
  `TauCeti.robinHood_apply_of_ne`, `TauCeti.sum_robinHood`, `TauCeti.prefixSum_robinHood`;
  `TauCeti.IsTTransform`, `TauCeti.IsTTransform.sum_eq`; `Convex.robinHood_mem`;
  `TauCeti.mem_of_prefixSum_le_of_sum_eq`; `TauCeti.IsSymmetricConvex`,
  `TauCeti.IsSymmetricConvex.update_mem`, `TauCeti.IsSymmetricConvex.isSolid`,
  `TauCeti.IsSymmetricConvex.robinHood_mem`, `TauCeti.IsSymmetricConvex.mem_of_isTTransform`,
  `TauCeti.IsSymmetricConvex.mem_of_prefixSum_le` (no condition on the member `y`);
  `Seminorm.IsSymmetricGauge`, `Seminorm.IsSymmetricGauge.isSymmetricConvex_setOf_le`,
  `Seminorm.IsSymmetricGauge.apply_le_of_prefixSum_le`,
  `Seminorm.IsSymmetricGauge.apply_le_of_abs_le`, `Seminorm.isSymmetricGauge_normSeminorm`,
  `Seminorm.isSymmetricGauge_piLp`.
- `Analysis/InnerProductSpace/SchurHorn.lean`: `OrthonormalBasis.schurWeight`,
  `OrthonormalBasis.schurWeight_apply`, `OrthonormalBasis.schurWeight_nonneg`,
  `OrthonormalBasis.sum_schurWeight_row`, `OrthonormalBasis.sum_schurWeight_col`,
  `OrthonormalBasis.schurWeight_mem_doublyStochastic`, `OrthonormalBasis.transpose_schurWeight`;
  `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_schurWeight_mul_eigenvalues`,
  `LinearMap.IsSymmetric.sum_map_re_inner_apply_self_le_sum_map_eigenvalues` (for `φ` convex on a
  set containing the eigenvalues; nothing is assumed of the diagonal),
  `LinearMap.IsSymmetric.sum_re_inner_apply_self_eq_sum_eigenvalues`,
  `LinearMap.IsSymmetric.sum_sq_re_inner_apply_self_le_sum_sq_eigenvalues`.
- `Analysis/InnerProductSpace/KyFan.lean`: `LinearMap.kyFanSum`, `LinearMap.kyFanSum_def`,
  `LinearMap.kyFanSum_zero_right`, `LinearMap.kyFanSum_succ`, `LinearMap.kyFanSum_nonneg`,
  `LinearMap.kyFanSum_mono`, `LinearMap.kyFanSum_min_finrank_range`,
  `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`,
  `LinearMap.sum_re_inner_apply_le_kyFanSum`, `LinearMap.norm_sum_inner_le_kyFanSum`,
  `LinearMap.exists_orthonormal_sum_inner_eq_kyFanSum` (for `k ≤ dim E` and `k ≤ dim F`),
  `LinearMap.kyFanSum_le_iff`, `LinearMap.isWeaklyMajorizedBy_singularValues_add`,
  `LinearMap.kyFanSum_add_le`, `LinearMap.kyFanSum_linearIsometryEquiv_comp`,
  `LinearMap.kyFanSum_comp_linearIsometryEquiv`, `LinearMap.kyFanSum_adjoint`,
  `LinearMap.kyFanSum_smul`, `LinearMap.kyFanSum_neg`.
- `Analysis/InnerProductSpace/SingularValues.lean`: `LinearMap.singularValues_adjoint`,
  `LinearMap.rightSingularBasis`, `LinearMap.leftSingularVector`,
  `LinearMap.apply_rightSingularBasis`, `LinearMap.inner_leftSingularVector`,
  `LinearMap.eigenvalues_adjoint_comp_self_eq_zero_iff`,
  `LinearMap.exists_orthonormalBasis_apply_eq_leftSingularVector`,
  `LinearMap.singularValues_comp_le` (for a pointwise bound `‖C y‖ ≤ c ‖y‖`),
  `LinearMap.singularValues_operatorAbs`, `Matrix.toLin_diagonal_apply_self`,
  `Matrix.singularValues_toLin_diagonal`, `LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_comp`,
  `LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_diagonal_comp`.
- `Analysis/InnerProductSpace/Positive/SquareRoot.lean`: `LinearMap.operatorAbs`, the positive
  square root of `A†A` for `A : E →ₗ[𝕜] F`.
- `Analysis/InnerProductSpace/DiagonalSum.lean`: `LinearMap.diagonalSum`,
  `LinearMap.diagonalSum_add`.
- The unitarily invariant seminorms, `TauCeti.UnitarilyInvariantSeminorm` (no finite dimension
  assumed in the structure) with its `FunLike` and `SeminormClass` instances, the seminorms
  `TauCeti.UnitarilyInvariantSeminorm.arrowCongr`, `TauCeti.UnitarilyInvariantSeminorm.compAdjoint`,
  `TauCeti.UnitarilyInvariantSeminorm.gauge`,
  `TauCeti.UnitarilyInvariantSeminorm.ofIsSymmetricGauge`,
  `TauCeti.UnitarilyInvariantSeminorm.opNorm`, `TauCeti.UnitarilyInvariantSeminorm.frobenius`,
  `TauCeti.UnitarilyInvariantSeminorm.kyFan` and `TauCeti.UnitarilyInvariantSeminorm.nuclear`, and
  the following lemmas of the namespace `TauCeti.UnitarilyInvariantSeminorm`, cited by their name in
  that namespace (Convention 11). In `Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/`:
  from `Basic.lean`, `TauCeti.UnitarilyInvariantSeminorm.ext`, `map_linearIsometryEquiv_comp_comp`,
  `map_linearIsometryEquiv_comp`, `map_comp_linearIsometryEquiv`, `map_eq_of_singularValues_eq`,
  `arrowCongr_apply`, `arrowCongr_eq_self`, `compAdjoint_apply`, `compAdjoint_compAdjoint`,
  `map_operatorAbs` and `map_le_of_mem_twoSidedUnitaryOrbitHull`; from `Gauge.lean`,
  `gauge_apply`, `isSymmetricGauge_gauge`, `map_eq_gauge_singularValues`,
  `exists_isSymmetricGauge_forall_map_eq`, `ofIsSymmetricGauge_apply`, `ofIsSymmetricGauge_gauge`
  and `gauge_ofIsSymmetricGauge`; from `KyFan.lean`, `kyFan_apply` and `nuclear_apply`; from
  `OpNorm.lean`, `opNorm_apply`; from `Frobenius.lean`, `frobenius_apply`, `sq_frobenius_apply`,
  `sq_frobenius_apply_eq_sum_norm_inner_sq`, `frobenius_apply_eq_sqrt_sum_sq_singularValues` and
  `nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply`. In
  `Analysis/InnerProductSpace/FanDominance.lean`: `map_le_of_kyFanSum_le`, `map_comp_le_left` and
  `map_comp_le_right` (for pointwise bounds on `C`), `map_starProjection_comp_le` and
  `map_comp_starProjection_le`. In `Analysis/InnerProductSpace/BlockSum.lean`:
  `map_prodMap_withLpMap_le`.
- `Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Basic.lean`: the orbits and certificates,
  `LinearMap.twoSidedUnitaryOrbit`, `LinearMap.mem_twoSidedUnitaryOrbit`,
  `LinearMap.twoSidedUnitaryOrbit_eq_of_mem`,
  `LinearMap.mem_twoSidedUnitaryOrbit_iff_singularValues_eq`; `LinearMap.twoSidedUnitaryOrbitHull`,
  `LinearMap.mem_twoSidedUnitaryOrbitHull`, `LinearMap.smul_add_smul_mem_twoSidedUnitaryOrbitHull`,
  `LinearMap.twoSidedUnitaryOrbitHull_subset`, `LinearMap.twoSidedUnitaryOrbitHull_eq_convexHull`;
  `TauCeti.UnitaryOrbitCertificate`, `TauCeti.UnitaryOrbitCertificate.mass`,
  `TauCeti.UnitaryOrbitCertificate.mass_def`, `TauCeti.UnitaryOrbitCertificate.mass_nonneg`,
  `TauCeti.UnitaryOrbitCertificate.reindex`, `TauCeti.UnitaryOrbitCertificate.mass_reindex`,
  `TauCeti.UnitaryOrbitCertificate.apply_le_mass_mul`,
  `TauCeti.UnitaryOrbitCertificate.exists_mass_eq_one_of_mem_twoSidedUnitaryOrbitHull`.
- `Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/KyFan.lean`:
  `LinearMap.kyFanSum_eq_nuclear`.
- `Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/Frobenius.lean`:
  `LinearMap.sum_norm_apply_sq_eq_sum_norm_apply_sq`, `LinearMap.frobenius_norm_toMatrix`.
- `Analysis/InnerProductSpace/FanDominance.lean`:
  `LinearMap.mem_twoSidedUnitaryOrbitHull_iff_kyFanSum_le`.
- `Analysis/InnerProductSpace/BlockSum.lean`: `LinearMap.adjoint_prodMap_withLpMap`,
  `LinearMap.singularValues_prodMap_withLpMap_self`, `LinearMap.kyFanSum_prodMap_withLpMap_self`,
  `LinearMap.prodMap_withLpMap_mem_twoSidedUnitaryOrbitHull`,
  `LinearMap.kyFanSum_prodMap_withLpMap_le`.
- `Analysis/InnerProductSpace/ZeroExtension.lean`: `LinearMap.zeroExtension`,
  `LinearMap.zeroExtension_apply`, `LinearMap.singularValues_zeroExtension`.
- `Analysis/InnerProductSpace/SingularValues/Planar.lean`:
  `Matrix.singularValues_toLin_diagonal_fin_two`, `Matrix.singularValues_toLin_offDiag_fin_two`,
  `Matrix.singularValues_toLin_offDiag_self_fin_two`,
  `Matrix.singularValues_toLin_offDiag_zero_fin_two`,
  `LinearMap.singularValues_eq_single_add_single_of_finrank_eq_two`,
  `LinearMap.trace_adjoint_comp_self_eq_of_finrank_eq_two`,
  `LinearMap.det_adjoint_comp_self_eq_of_finrank_eq_two`,
  `LinearMap.sq_singularValues_zero_of_finrank_eq_two`,
  `LinearMap.sq_singularValues_one_of_finrank_eq_two`,
  `LinearMap.singularValues_eq_iff_trace_eq_and_det_eq`.

## References

- R. Bhatia, *Matrix Analysis*, Graduate Texts in Mathematics 169, Springer (1997), Chapters
  II–IV: majorization, symmetric gauge functions, Ky Fan dominance (Theorem IV.2.2), unitarily
  invariant norms.
- A. W. Marshall, I. Olkin, B. C. Arnold, *Inequalities: Theory of Majorization and Its
  Applications*, 2nd ed., Springer (2011), Theorem 9.B.1 (Schur–Horn).
- I. Schur, *Über eine Klasse von Mittelbildungen mit Anwendungen auf die Determinantentheorie*,
  Sitzungsber. Berl. Math. Ges. **22** (1923).
- K. Fan, *On a theorem of Weyl concerning eigenvalues of linear transformations I*, Proc. Nat.
  Acad. Sci. USA **35** (1949).
- L. Mirsky, *Symmetric gauge functions and unitarily invariant norms*, Quart. J. Math. Oxford
  **11** (1960).
