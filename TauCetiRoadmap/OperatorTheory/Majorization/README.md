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

The build has two parts, described below. Part A is the convex engine (prefix sums, transfers,
symmetric convex sets and gauges, transfer descent) and its two bridges to operators: diagonal
entries against eigenvalues, and Ky Fan sums, with the diagonal operators that model them. Part B
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
   nonincreasing. The prefix sum `Pₖ(x) = x₀ + ⋯ + xₖ₋₁` (MAJ-A01) is `TauCeti.prefixSum k x`; it is
   the total sum for `k ≥ n` and `0` for `k = 0`.
4. **Majorization.** For antitone nonnegative `x, y : Fin n → ℝ`, `x ≺w y` means `Pₖ(x) ≤ Pₖ(y)`
   for every `k`, the predicate `TauCeti.IsWeaklyMajorizedBy x y` (MAJ-A02). *Ordinary* majorization
   adds equality of the total sums; it enters only through the transfer closure of §1.2.
5. **Symmetry.** A set of tuples or a function on tuples is *symmetric* when it is invariant under
   every permutation of the coordinates and under changing the sign of one coordinate. A seminorm
   is a subadditive, absolutely homogeneous function (Mathlib `Seminorm`; `Seminorm.of` builds one
   from these two properties); a *symmetric gauge* is a symmetric seminorm on `ι → ℝ`, the
   predicate `Seminorm.IsSymmetricGauge` (MAJ-A06).
6. **Diagonal data.** For a symmetric `T` with eigenbasis `(vᵢ)` and an orthonormal basis `(eₖ)`,
   the diagonal entries are `dₖ = Re⟪T eₖ, eₖ⟫` and the Schur weights are `wᵢₖ = ‖⟪vᵢ, eₖ⟫‖²`.
7. **Ky Fan sums and rank.** `Kₖ(A) = σ₀(A) + ⋯ + σₖ₋₁(A)` (MAJ-A26) is `A.kyFanSum k` (the map
   first, the length second); `K₀(A) = 0`. The rank of `A` is `finrank 𝕜 (LinearMap.range A)`, and
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
    `‖A‖_F = (∑ᵢ ‖A bᵢ‖²)^(1/2)` for an orthonormal basis `(bᵢ)` of the source (D1, independent of
    the basis), equal to `(∑ᵢ σᵢ(A)²)^(1/2)` (§2.5), the Hilbert–Schmidt norm of finite dimension;
    the nuclear (trace) seminorm is `‖A‖₁ = ∑ᵢ σᵢ(A)`; the Ky Fan `k`-seminorm is `Kₖ`.
11. **Labels and names.** Each definition and theorem of Part A carries a label `MAJ-Ann` and each
    one of Part B a label `MAJ-Bnn`; other roadmaps cite them by these labels. Sections 1.1–1.5 of
    Part A and 2.1–2.6 of Part B group the labelled items, the milestones of each Part are listed
    at its head, and D1 labels the basis formula of the Frobenius seminorm (MAJ-B34–MAJ-B35). An
    item that the pinned Tau Ceti library proves ends with an *In Tau Ceti* line naming, by their
    full names, the declarations that realise it; a Mathlib declaration is named in the statement
    or the route of the item. A target without a library declaration is described in prose. The
    acceptance file `Suggested.lean` states no theorem of its own; it declares the two objects
    through which the acceptance files of the other OperatorTheory roadmaps state their estimates:
    the structure `TauCetiRoadmap.Majorization.UnitarilyInvariantSeminorm`, a seminorm on
    `E →ₗ[𝕜] F` with `N(U A V) = N(A)` for `U` in Mathlib's `unitary (F →ₗ[𝕜] F)` and `V` in
    `unitary (E →ₗ[𝕜] E)` (the notion of Convention 8, whose carrier in the library is
    `TauCeti.UnitarilyInvariantSeminorm`, MAJ-B01), and the function
    `TauCetiRoadmap.Majorization.frobenius`, whose value at `A` is `(∑ᵢ ‖A bᵢ‖²)^(1/2)` for the
    standard orthonormal basis `stdOrthonormalBasis 𝕜 E` of the source, that is `‖A‖_F` by the
    Frobenius basis formula MAJ-B34.

## Part A: majorization, forward Schur–Horn and Ky Fan sums

Part A builds the convex majorization engine on tuples and connects it to operator spectra through
the forward Schur–Horn inequality and Ky Fan's variational theory; its diagonal models are the
square-operator input to the gauge representation of Part B. Its four milestones are:

- Transfer descent: MAJ-A01–MAJ-A17 (§1.1–§1.2).
- Forward Schur–Horn: MAJ-A18–MAJ-A25 (§1.3).
- Ky Fan variational theory: MAJ-A26–MAJ-A35 (§1.4).
- Diagonal models: MAJ-A36–MAJ-A40 (§1.5).

### 1.1 Convex majorization objects

The objects of the convex engine (Bhatia, *Matrix Analysis*, Chapters II–IV), on tuples with no
operator in sight.

**MAJ-A01 — Prefix sums.** For `x : Fin n → ℝ` and `k : ℕ`, the prefix sum
`Pₖ(x) = x₀ + ⋯ + xₖ₋₁` is the sum of the coordinates `xᵢ` with `i < k`. It is `0` for `k = 0` and
the total sum `∑ᵢ xᵢ` for `k ≥ n`.

*In Tau Ceti:* `TauCeti.prefixSum`, `TauCeti.prefixSum_def`.

**MAJ-A02 — Weak majorization.** For antitone nonnegative `x, y : Fin n → ℝ`, `x` is weakly
majorized by `y`, written `x ≺w y`, when `Pₖ(x) ≤ Pₖ(y)` for every `k`. The relation records that
`x` and `y` are antitone and nonnegative together with the prefix inequalities, so `x ≺w y` carries
the order and sign conditions on both tuples.

*In Tau Ceti:* `TauCeti.IsWeaklyMajorizedBy`.

**MAJ-A03 — Robin Hood transfer.** For `x : ι → ℝ`, coordinates `i, j` and `δ ∈ ℝ`, the Robin
Hood transfer of `δ` from `i` to `j` subtracts `δ` from `xᵢ` and adds it to `xⱼ`. It is an
*elementary* transfer when `0 ≤ δ ≤ xᵢ − xⱼ`: a nonnegative amount moves from a coordinate to one
with no larger value, and both new values lie between the old ones.

- It preserves the total sum.
- For `ι = Fin n`, its prefix sum of length `k` is `Pₖ(x)`, minus `δ` when `i < k`, plus `δ` when
  `j < k`.
- For `i = j` it is the identity, and otherwise it changes the coordinates `i` and `j` only, to
  `xᵢ − δ` and `xⱼ + δ`.

*In Tau Ceti:* `TauCeti.robinHood`, `TauCeti.sum_robinHood`, `TauCeti.prefixSum_robinHood`, `TauCeti.robinHood_self`, `TauCeti.robinHood_apply_left`, `TauCeti.robinHood_apply_right`, `TauCeti.robinHood_apply_of_ne`.

**MAJ-A04 — T-transform relation.** A tuple `y` is a *T-transform* of `x` when `y = x' ∘ σ` for
an elementary Robin Hood transfer `x'` of `x` and a permutation `σ` of the coordinates. A
T-transform preserves the total sum.

*In Tau Ceti:* `TauCeti.IsTTransform`, `TauCeti.IsTTransform.sum_eq`.

**MAJ-A05 — Symmetric convex sets.** A set `K ⊆ (ι → ℝ)` is *symmetric convex* when it is convex,
`x ∘ σ ∈ K` for every `x ∈ K` and every permutation `σ`, and negating one coordinate of a member
gives a member.

- A coordinate of a member may be replaced by any value of no larger absolute value; so for finite
  `ι`, `K` contains every tuple whose coordinates are bounded in absolute value by those of a
  member (`K` is solid).
- `K` is closed under elementary Robin Hood transfers and under T-transforms. The first rests on a
  fact about all convex sets: a convex set containing `x` and the tuple `x` with coordinates `i`
  and `j` swapped contains every elementary transfer from `i` to `j`.

*In Tau Ceti:* `TauCeti.IsSymmetricConvex`, `TauCeti.IsSymmetricConvex.update_mem`, `TauCeti.IsSymmetricConvex.isSolid`, `TauCeti.IsSymmetricConvex.robinHood_mem`, `TauCeti.IsSymmetricConvex.mem_of_isTTransform`, `Convex.robinHood_mem`.

**MAJ-A06 — Finite symmetric gauges.** A *symmetric gauge* on `ι → ℝ` is a seminorm `g` (a
subadditive, absolutely homogeneous function) with `g(x ∘ σ) = g(x)` for every permutation `σ` and
`g` unchanged by negating one coordinate.

- The sup norm and, for `1 ≤ q ≤ ∞`, the `ℓ^q` norm are symmetric gauges.
- For finite `ι`, a symmetric gauge is monotone in the absolute values: `|xᵢ| ≤ |yᵢ|` for every
  `i` gives `g(x) ≤ g(y)`.

*In Tau Ceti:* `Seminorm.IsSymmetricGauge`, `Seminorm.isSymmetricGauge_normSeminorm`, `Seminorm.isSymmetricGauge_piLp`, `Seminorm.IsSymmetricGauge.apply_le_of_abs_le`.

*Needs:* Mathlib `Convex`, `Seminorm`, `Equiv.Perm`, `Function.update`.

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

**MAJ-A07 — Prefix sums of sums.** For `x, y : Fin n → ℝ` and every `k`,
`Pₖ(x + y) = Pₖ(x) + Pₖ(y)`.

*In Tau Ceti:* `TauCeti.prefixSum_add`.

**MAJ-A08 — Prefix sums under nonnegative scaling.** For `c ≥ 0`, and indeed for every real `c`,
`Pₖ(c x) = c Pₖ(x)`.

*In Tau Ceti:* `TauCeti.prefixSum_smul`.

**MAJ-A09 — Reflexivity.** Every antitone nonnegative `x` satisfies `x ≺w x`.

*In Tau Ceti:* `TauCeti.IsWeaklyMajorizedBy.refl`.

**MAJ-A10 — Transitivity.** If `x ≺w y` and `y ≺w z`, then `x ≺w z`.

*In Tau Ceti:* `TauCeti.IsWeaklyMajorizedBy.trans`.

**MAJ-A11 — Additivity.** If `x₁ ≺w y₁` and `x₂ ≺w y₂`, then `x₁ + x₂ ≺w y₁ + y₂`. Sums of
antitone nonnegative tuples are again antitone and nonnegative, so no further hypothesis is needed.

*In Tau Ceti:* `TauCeti.IsWeaklyMajorizedBy.add`.

**MAJ-A12 — Nonnegative scaling.** If `x ≺w y` and `c ≥ 0`, then `c x ≺w c y`.

*In Tau Ceti:* `TauCeti.IsWeaklyMajorizedBy.smul`.

**MAJ-A13 — Zero padding.** Prefix sums do not see appended zeros: `Pₖ` of `x` followed by `m`
zeros is `Pₖ(x)`. Hence, if `x ≺w y` for `n`-tuples, appending the same number `m` of zeros to both
gives `(n + m)`-tuples with the same relation.

*In Tau Ceti:* `TauCeti.prefixSum_append_zero`, `TauCeti.IsWeaklyMajorizedBy.append_zero`.

**MAJ-A14 — Progress by one transfer.** State as a public declaration: let `y, d : Fin n → ℝ` with
`d` antitone, `∑ₘ dₘ = ∑ₘ yₘ`, `Pₗ(d) ≤ Pₗ(y)` for every `l`, and `y ≠ d`. Then there are
coordinates `i, j` and a real `δ` with `0 ≤ δ ≤ yᵢ − yⱼ` such that the transfer `y'` of `δ` from
`i` to `j` still satisfies `Pₗ(d) ≤ Pₗ(y')` for every `l`, and `y'` agrees with `d` at strictly more
coordinates than `y` does. No order or sign condition on `y` is assumed. This is the inductive step
of the transfer closure of MAJ-A15. The pinned Tau Ceti proves the step as the private theorem
`exists_robinHood_card_lt` of `TauCeti/Analysis/Convex/Majorization.lean` and derives the transfer
closure from it, choosing as `i` the first coordinate where `y` and `d` differ and as `j` the first
later one where `y` is below `d`. Route: take `j` the first coordinate with `dⱼ > yⱼ`, which
exists because the totals agree and `y ≠ d`; take `i < j` the last coordinate before `j` with
`yᵢ > dᵢ`, which exists because `Pⱼ₊₁(d) ≤ Pⱼ₊₁(y)`; and transfer `δ = min(yᵢ − dᵢ, dⱼ − yⱼ)`
from `i` to `j`. Then `δ ≤ yᵢ − yⱼ` because `d` is antitone, the prefix sums of lengths
`i < l ≤ j` drop by `δ` and stay above those of `d`, the others do not move, and `y'` agrees with
`d` at `i` or at `j`.
*Needs:* MAJ-A01, MAJ-A03.

**MAJ-A15 — Transfer descent.** *Transfer closure:* a set of tuples in `Fin n → ℝ` that is closed
under elementary Robin Hood transfers and contains `y` contains every antitone `d` with
`∑ₘ dₘ = ∑ₘ yₘ` and `Pₖ(d) ≤ Pₖ(y)` for every `k`; no order on `y` is assumed. *Descent:* if `K` is
symmetric convex and `y ∈ K`, every antitone nonnegative `z` with `Pₖ(z) ≤ Pₖ(y)` for every `k`
lies in `K`; no order or sign condition on `y` is needed. In particular, if `x ≺w y` and `y ∈ K`,
then `x ∈ K`. The sign invariance supplies the solidity that weak majorization, which may lower the
total, requires; transfers alone keep the total.

*In Tau Ceti:* `TauCeti.mem_of_prefixSum_le_of_sum_eq`, `TauCeti.IsSymmetricConvex.mem_of_prefixSum_le`, `TauCeti.IsWeaklyMajorizedBy.mem`.

**MAJ-A16 — Gauge sublevel symmetry and convexity.** Every sublevel set `{x | g(x) ≤ c}` of a
symmetric gauge `g` is symmetric convex.

*In Tau Ceti:* `Seminorm.IsSymmetricGauge.isSymmetricConvex_setOf_le`.

**MAJ-A17 — Gauge monotonicity.** If `x ≺w y`, then `g(x) ≤ g(y)` for every symmetric gauge `g`
on `Fin n → ℝ`; more generally `g(z) ≤ g(y)` for every antitone nonnegative `z` with
`Pₖ(z) ≤ Pₖ(y)` for every `k`, with no condition on `y`. Route: MAJ-A16 and MAJ-A15.

*In Tau Ceti:* `TauCeti.IsWeaklyMajorizedBy.apply_le`, `Seminorm.IsSymmetricGauge.apply_le_of_prefixSum_le`.

*Needs:* §1.1.

**Checks.**
- For `y = (3, 0, 0)` and `d = (1, 1, 1)` the route of MAJ-A14 transfers `1` from coordinate `0`
  to coordinate `1`, giving `(2, 1, 0)` (prefix sums `2, 3, 3` against `1, 2, 3`), then `1` from
  coordinate `0` to coordinate `2`, giving `d`. The number of coordinates agreeing with `d` goes
  `0, 1, 3`.
- For `y = (1, 1)` and `d = (1/2, 1/2)`, `d` is antitone with `Pₖ(d) ≤ Pₖ(y)` for every `k`, but
  every transfer keeps the total `2`, so no sequence of transfers reaches `d`: the hypothesis of
  equal totals in the progress statement cannot be dropped, and weak majorization needs the sign
  invariance of transfer descent instead.
- The set `{(1, 1)}` is convex and invariant under permutations but not under sign changes; it
  contains `y = (1, 1)` and not `(1/2, 1/2) ≺w y`, so transfer descent fails without the sign
  invariance.
- The seminorm `g(x) = |x₀| + 2|x₁|` is invariant under sign changes but not under permutations,
  and `(1, 1) ≺w (2, 0)` while `g(1, 1) = 3 > 2 = g(2, 0)`: gauge monotonicity needs permutation
  invariance. The symmetric gauges `ℓ¹`, `ℓ²` and `ℓ∞` give `2 ≤ 2`, `√2 ≤ 2` and `1 ≤ 2`.

### 1.3 Forward Schur–Horn

Squared overlaps between an eigenbasis and an orthonormal basis form a doubly stochastic matrix
that carries the spectrum onto the diagonal (Schur 1923; Marshall, Olkin and Arnold,
*Inequalities*, Theorem 9.B.1).

**MAJ-A18 — Schur weight.** For orthonormal bases `v` (indexed by `ι`) and `e` (indexed by `κ`) of
`E`, the Schur weight matrix is the real `ι × κ` matrix with entries `wᵢₖ = ‖⟪vᵢ, eₖ⟫‖²`. With `v`
the eigenbasis of a symmetric `T` it is the matrix `w` of Convention 6. Exchanging the two bases
transposes it.

*In Tau Ceti:* `OrthonormalBasis.schurWeight`, `OrthonormalBasis.schurWeight_apply`, `OrthonormalBasis.transpose_schurWeight`.

**MAJ-A19 — Nonnegativity of Schur weights.** Every entry `wᵢₖ` is nonnegative.

*In Tau Ceti:* `OrthonormalBasis.schurWeight_nonneg`.

**MAJ-A20 — Row sums of Schur weights.** For every `i`, `∑ₖ wᵢₖ = 1`.

*In Tau Ceti:* `OrthonormalBasis.sum_schurWeight_row`.

**MAJ-A21 — Column sums of Schur weights.** For every `k`, `∑ᵢ wᵢₖ = 1`. With MAJ-A19 and
MAJ-A20: for a common index type the Schur weight matrix lies in Mathlib's `doublyStochastic`.

*In Tau Ceti:* `OrthonormalBasis.sum_schurWeight_col`, `OrthonormalBasis.schurWeight_mem_doublyStochastic`.

**MAJ-A22 — Diagonal as a doubly stochastic image.** For `T` symmetric, `hn : finrank 𝕜 E = n`,
eigenvalues `λᵢ = hT.eigenvalues hn i` and an orthonormal basis `e`, `dₖ = ∑ᵢ wᵢₖ λᵢ` with `w`
the Schur weight matrix of `hT.eigenvectorBasis hn` and `e`.

*In Tau Ceti:* `LinearMap.IsSymmetric.re_inner_apply_self_eq_sum_schurWeight_mul_eigenvalues`.

**MAJ-A23 — Forward Schur–Horn.** If `φ : ℝ → ℝ` is convex on a convex set `s` containing every
eigenvalue of `T`, then `∑ₖ φ(dₖ) ≤ ∑ᵢ φ(λᵢ)` for every orthonormal basis `e`. The diagonal entries
lie in `s` because they are averages of eigenvalues, so `s` need not be assumed to contain them.
Route: Jensen's inequality (`ConvexOn.map_sum_le`) for each column of `w`, then the row sums.

*In Tau Ceti:* `LinearMap.IsSymmetric.sum_map_re_inner_apply_self_le_sum_map_eigenvalues`.

**MAJ-A24 — Basis independence of the trace.** `∑ₖ dₖ = ∑ᵢ λᵢ` for every orthonormal basis `e`.

*In Tau Ceti:* `LinearMap.IsSymmetric.sum_re_inner_apply_self_eq_sum_eigenvalues`.

**MAJ-A25 — Euclidean contraction of the diagonal.** `∑ₖ dₖ² ≤ ∑ᵢ λᵢ²` for every orthonormal
basis `e`.

*In Tau Ceti:* `LinearMap.IsSymmetric.sum_sq_re_inner_apply_self_le_sum_sq_eigenvalues`.

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

**MAJ-A26 — Ky Fan sums.** For a map `A : E → F` between finite-dimensional inner product spaces
and `k : ℕ`, the Ky Fan `k`-sum `Kₖ(A) = σ₀(A) + ⋯ + σₖ₋₁(A)` is the sum of the first `k` entries
of the nonincreasing zero-padded singular-value sequence of `A`; the square theory uses the same
definition with `E = F`. It vanishes at `k = 0`, grows by `σₖ(A)` from `k` to `k + 1`, is
nonnegative, is monotone in `k`, and is constant from the rank on: `Kₖ(A) = Kₘ(A)` for
`m = min(k, rank A)`.

*In Tau Ceti:* `LinearMap.kyFanSum`, `LinearMap.kyFanSum_def`, `LinearMap.kyFanSum_zero_right`, `LinearMap.kyFanSum_succ`, `LinearMap.kyFanSum_nonneg`, `LinearMap.kyFanSum_mono`, `LinearMap.kyFanSum_min_finrank_range`.

**MAJ-A27 — Ky Fan trace inequality.** If `T` is symmetric with eigenvalues `λ₀ ≥ ⋯ ≥ λₙ₋₁` and
`(wᵢ)` is an orthonormal family of `k` vectors, then `∑ᵢ Re⟪T wᵢ, wᵢ⟫ ≤ λ₀ + ⋯ + λₖ₋₁`.

*In Tau Ceti:* `LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues`.

**MAJ-A28 — Ky Fan variational upper bound.** For orthonormal families `(uᵢ)` in `F` and `(vᵢ)` in
`E` with `k` members, `∑ᵢ Re⟪uᵢ, A vᵢ⟫ ≤ Kₖ(A)`, and even `‖∑ᵢ ⟪uᵢ, A vᵢ⟫‖ ≤ Kₖ(A)`.

*In Tau Ceti:* `LinearMap.sum_re_inner_apply_le_kyFanSum`, `LinearMap.norm_sum_inner_le_kyFanSum`.

**MAJ-A29 — Ky Fan variational achievability.** For `k ≤ dim E` and `k ≤ dim F` there are
orthonormal families of `k` vectors with `∑ᵢ ⟪uᵢ, A vᵢ⟫ = Kₖ(A)`; so `Kₖ(A) ≤ c` exactly when every
sum `∑ᵢ ⟪uᵢ, A vᵢ⟫` over at most `k` orthonormal pairs has modulus at most `c`.

*In Tau Ceti:* `LinearMap.exists_orthonormal_sum_inner_eq_kyFanSum`, `LinearMap.kyFanSum_le_iff`.

The first `k` singular pairs attain the bound of MAJ-A28. Prove: let `v = A.rightSingularBasis`
and `u = A.leftSingularVector`, the singular system of `A` with `A vᵢ = σᵢ(A) uᵢ` and `uᵢ = 0` when
`σᵢ(A) = 0`. For every `k ≤ dim E`, the sum of `⟪uᵢ, A vᵢ⟫` over `i < k` is `Kₖ(A)`; and for
`k ≤ rank A` the two families `(uᵢ)` and `(vᵢ)`, `i < k`, are orthonormal, so the first `k`
singular pairs attain the variational bound. Route: `⟪uᵢ, A vᵢ⟫ = σᵢ(A) ‖uᵢ‖²` by
`LinearMap.apply_rightSingularBasis`, and `‖uᵢ‖ = 1` when `σᵢ(A) ≠ 0` by
`LinearMap.inner_leftSingularVector`; `σᵢ(A) ≠ 0` exactly for `i < rank A`
(`LinearMap.eigenvalues_adjoint_comp_self_eq_zero_iff`). For `rank A < k ≤ min(dim E, dim F)`,
completing the nonzero left singular vectors to an orthonormal basis of `F`
(`LinearMap.exists_orthonormalBasis_apply_eq_leftSingularVector`) gives attaining orthonormal
families, which is the existence statement above.
*Needs:* MAJ-A26, MAJ-A28; Tau Ceti `LinearMap.rightSingularBasis`, `LinearMap.leftSingularVector`,
`LinearMap.apply_rightSingularBasis`, `LinearMap.inner_leftSingularVector`,
`LinearMap.eigenvalues_adjoint_comp_self_eq_zero_iff`,
`LinearMap.exists_orthonormalBasis_apply_eq_leftSingularVector` (the singular system of
PolarDecomposition Part C).

**MAJ-A30 — Singular-value triangle majorization.** For every `n`, the first `n` singular values
of `A + B` are weakly majorized by the coordinatewise sums `σᵢ(A) + σᵢ(B)`, `i < n`.

*In Tau Ceti:* `LinearMap.isWeaklyMajorizedBy_singularValues_add`.

**MAJ-A31 — Ky Fan triangle inequality.** `Kₖ(A + B) ≤ Kₖ(A) + Kₖ(B)` for every `k`.

*In Tau Ceti:* `LinearMap.kyFanSum_add_le`.

**MAJ-A32 — Unitary invariance of Ky Fan sums.** Composing `A` on the left or on the right with a
linear isometric equivalence leaves every `Kₖ(A)` unchanged; in particular `Kₖ(U A V) = Kₖ(A)` for
unitaries `U` of `F` and `V` of `E`.

*In Tau Ceti:* `LinearMap.kyFanSum_linearIsometryEquiv_comp`, `LinearMap.kyFanSum_comp_linearIsometryEquiv`.

**MAJ-A33 — Adjoint invariance of Ky Fan sums.** `Kₖ(A†) = Kₖ(A)` for every `k`.

*In Tau Ceti:* `LinearMap.kyFanSum_adjoint`.

**MAJ-A34 — Nonnegative-real scaling of Ky Fan sums.** `Kₖ(c A) = c Kₖ(A)` for real `c ≥ 0`; more
generally `Kₖ(c A) = ‖c‖ Kₖ(A)` for `c ∈ 𝕜`, and `Kₖ(−A) = Kₖ(A)`.

*In Tau Ceti:* `LinearMap.kyFanSum_smul`, `LinearMap.kyFanSum_neg`.

**MAJ-A35 — Bounded-factor singular-value domination.** If `C : F → G` satisfies
`‖C y‖ ≤ c ‖y‖` for every `y` (for `c ≥ 0`: `C` has operator norm at most `c`), then
`σᵢ(C A) ≤ c σᵢ(A)` for every `i`.

*In Tau Ceti:* `LinearMap.singularValues_comp_le`.

*Needs:* §1.2 (weak majorization); Mathlib `LinearMap.singularValues`, `Orthonormal`,
`LinearIsometryEquiv`.

**Checks.**
- For `J = [[0, 1], [0, 0]]` on `𝕜²` (`J e₁ = e₀`, `J e₀ = 0`), `σ(J) = (1, 0)`, so
  `K₁(J) = K₂(J) = 1`, while both eigenvalues are `0`: a Ky Fan sum built from eigenvalues or
  their moduli would give `0`. The pair `u = e₀`, `v = e₁` attains `⟪e₀, J e₁⟫ = 1`.
- For the same `J`, `J†J = diag(0, 1)`, so `v₀` is a unit multiple of `e₁` and `u₀ = J v₀` is the
  same multiple of `e₀`, with `⟪u₀, J v₀⟫ = 1 = K₁(J)`. At `k = 2 > rank J = 1`, `u₁ = 0` and the
  sum is still `K₂(J) = 1`, but `(u₀, u₁)` is not orthonormal: the orthonormality clause of
  MAJ-A29 needs `k ≤ rank A`.
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

**MAJ-A36 — Diagonal operator.** For an orthonormal basis `(eᵢ)` of `E` and `d : ι → 𝕜`, the
diagonal operator `diag(d)` is Mathlib's `Matrix.toLin e.toBasis e.toBasis (Matrix.diagonal d)`:
the endomorphism with `diag(d) eᵢ = dᵢ eᵢ`. A real tuple `b` gives `diag(b)` with entries
`(bᵢ : 𝕜)`.

*In Tau Ceti:* `Matrix.toLin_diagonal_apply_self`.

**MAJ-A37 — Additivity of diagonal operators.** `diag(b + c) = diag(b) + diag(c)`; this is
Mathlib's `Matrix.diagonal_add` with the linearity of `Matrix.toLin`.

**MAJ-A38 — Symmetry of real diagonal operators.** For real `b`, `diag(b)` is symmetric: by
Mathlib's `Matrix.isSymmetric_toLin_iff` a map is symmetric exactly when its matrix in an
orthonormal basis is Hermitian, and `Matrix.isHermitian_diagonal_of_self_adjoint` applies because
real entries are self-adjoint in `𝕜`.

**MAJ-A39 — Singular values of a diagonal operator.** If `π : Fin n ≃ ι` lists the indices so that
`‖d(π k)‖` is nonincreasing, then `σₖ(diag(d)) = ‖d(π k)‖` for `k < n`, and `σₖ(diag(d)) = 0` from
`k = dim E` on (Mathlib's `LinearMap.singularValues_of_finrank_le`): for real `b` the
singular-value sequence of `diag(b)` is the nonincreasing zero-padded rearrangement of `(|bᵢ|)`.

*In Tau Ceti:* `Matrix.singularValues_toLin_diagonal`.

**MAJ-A40 — Singular-value diagonal factorization.** Every endomorphism `A` of `E` is
`U diag(σ(A)) V` for linear isometric equivalences `U, V` of `E`, the diagonal operator taken in
any prescribed orthonormal basis of `E` indexed by `Fin n`.

*In Tau Ceti:* `LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_diagonal_comp`.

The rectangular form of the model is the map sending `y` to `∑ᵢ xᵢ ⟪vᵢ, y⟫ wᵢ`, for families
`(vᵢ)` in `E`, `(wᵢ)` in `F` and a real tuple `x`. It is additive in `x`, and for `v = w = e` an
orthonormal basis it is `diag(x)`.

*In Tau Ceti:* `LinearMap.diagonalSum`, `LinearMap.diagonalSum_add`.

*Needs:* Mathlib `Matrix.toLin`, `Matrix.diagonal`, `Matrix.diagonal_add`,
`Matrix.isSymmetric_toLin_iff`, `Matrix.isHermitian_diagonal_of_self_adjoint`,
`LinearMap.singularValues_of_finrank_le`.

**Checks.**
- For `b = (1, −3, 2)`, `σ(diag(b)) = (3, 2, 1, 0, …)`, while the eigenvalues in decreasing order
  are `(2, 1, −3)`: a singular-value formula that sorts `b` instead of `|b|` produces a negative
  value.
- Over `ℂ`, `diag(i, 0)` has `⟪diag(i, 0) e₀, e₀⟫ = −i` and `⟪e₀, diag(i, 0) e₀⟫ = i`, so it is
  not symmetric: the symmetry statement needs real entries.

### Examples

- The acceptance examples of Part A are the trace identity MAJ-A24 and the Euclidean contraction
  MAJ-A25: the instances `φ(t) = ±t` and `φ(t) = t²` of the forward Schur–Horn inequality
  MAJ-A23. For `T = [[2, 1], [1, 2]]` the diagonal `(2, 2)` is weakly majorized by the spectrum
  `(3, 1)` (`2 ≤ 3`, `4 ≤ 4`), and the `ℓ²` gauge of MAJ-A17 gives `√8 ≤ √10`, the quadratic
  instance again.
- The shear `S = [[1, 1], [0, 1]]` on `𝕜²` has `S†S = [[1, 1], [1, 2]]`, singular values
  `((1 + √5)/2, (√5 − 1)/2)`, `K₁(S) = (1 + √5)/2` and `K₂(S) = √5`. The orthonormal pair
  `u = v = e₀` gives `⟪e₀, S e₀⟫ = 1 ≤ K₁(S)`, as the variational bound MAJ-A28 requires.
- With `C = 2 · id`, bounded-factor domination MAJ-A35 is an equality: `σ(2J) = (2, 0) = 2 σ(J)`
  for the nilpotent `J` of §1.4.

### Dependencies

Part A rests on Mathlib and on Tau Ceti. From Mathlib it uses singular values, the sorted
eigenvalues and eigenbases of symmetric operators, orthonormal bases and families, convexity with
Jensen's inequality, doubly stochastic matrices, and matrices of linear maps. From Tau Ceti it uses
the singular system of a map (PolarDecomposition Part C), for the attainment by the singular pairs
in MAJ-A29. Within the Part, §1.2 uses §1.1, §1.4 uses the weak majorization of §1.2, and §1.3 and
§1.5 use only the libraries.

## Part B: rectangular unitarily invariant seminorms

Part B turns Ky Fan domination into domination for every unitarily invariant seminorm on
rectangular maps, through the convex hull of the two-sided unitary orbit: a perturbation estimate
proved once for Ky Fan sums gives the operator, Frobenius, Ky Fan and nuclear estimates together.
Square operators are the case of equal source and target. Its six milestones are:

- Milestone B1, seminorms and transport: MAJ-B01, MAJ-B03–MAJ-B04, MAJ-B08–MAJ-B11 (§2.1).
- Milestone B2, rectangular orbit-hull majorization: MAJ-B14–MAJ-B20 (§2.2).
- Milestone B3, Fan dominance and square consequences: MAJ-B21 (§2.2) and MAJ-B44–MAJ-B46 (§2.3).
- Milestone B4, orthogonal block sums: MAJ-B22–MAJ-B29 (§2.4).
- Milestone B5, concrete rectangular seminorms: MAJ-B30–MAJ-B38 (§2.5).
- Milestone B6, planar sharpness models: MAJ-B40–MAJ-B43 (§2.6).

### 2.1 Rectangular seminorms and transport

The rectangular interface lets unitaries act on source and target independently; isometric
transport, zero extension and adjoints connect rectangular maps to the singular-value theory
(Bhatia, *Matrix Analysis*, Chapters II–IV).

**MAJ-B01 — Unitarily invariant seminorm.** A unitarily invariant seminorm on `E →ₗ[𝕜] F` is a
structure extending `Seminorm 𝕜 (E →ₗ[𝕜] F)` by the field `N(U ∘ A ∘ V) = N(A)` for every
`U : F ≃ₗᵢ[𝕜] F` and `V : E ≃ₗᵢ[𝕜] E`; a square unitarily invariant seminorm is the case `E = F`.

- It carries `FunLike` and `SeminormClass` instances, so the seminorm API applies: `N ≥ 0`,
  `N(0) = 0`, the triangle inequality for finite sums and `N(c A) = ‖c‖ N(A)`; two such seminorms
  with the same values are equal.
- It is invariant under unitaries on both sides at once and on each side separately.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm`, `TauCeti.UnitarilyInvariantSeminorm.ext`, `TauCeti.UnitarilyInvariantSeminorm.map_linearIsometryEquiv_comp_comp`, `TauCeti.UnitarilyInvariantSeminorm.map_linearIsometryEquiv_comp`, `TauCeti.UnitarilyInvariantSeminorm.map_comp_linearIsometryEquiv`.

**MAJ-B03 — Two-sided unitary orbit.** The two-sided unitary orbit of `C : E → F` is the set of
maps `U ∘ C ∘ V`, `U` a unitary of `F` and `V` a unitary of `E`. Orbits are equivalence classes: a
map in the orbit of `C` has the orbit of `C`.

- The orbit hull of `C` (Convention 8) is convex, it is contained in every set that contains the
  orbit and is closed under convex combinations of two points, and it is `convexHull ℝ` of the
  orbit when `F` is a real vector space compatibly with `𝕜`.

*In Tau Ceti:* `LinearMap.twoSidedUnitaryOrbit`, `LinearMap.mem_twoSidedUnitaryOrbit`, `LinearMap.twoSidedUnitaryOrbit_eq_of_mem`, `LinearMap.twoSidedUnitaryOrbitHull`, `LinearMap.mem_twoSidedUnitaryOrbitHull`, `LinearMap.smul_add_smul_mem_twoSidedUnitaryOrbitHull`, `LinearMap.twoSidedUnitaryOrbitHull_subset`, `LinearMap.twoSidedUnitaryOrbitHull_eq_convexHull`.

**MAJ-B04 — Finite orbit certificate.** A finite orbit certificate of `X` over `C`, indexed by a
finite type `ι`, consists of coefficients `aᵢ ∈ 𝕜` and unitaries `Uᵢ` of `F` and `Vᵢ` of `E` with
`X = ∑ᵢ aᵢ Uᵢ C Vᵢ`. Its mass is the coefficient mass `∑ᵢ ‖aᵢ‖ ≥ 0`.

*In Tau Ceti:* `TauCeti.UnitaryOrbitCertificate`, `TauCeti.UnitaryOrbitCertificate.mass`, `TauCeti.UnitaryOrbitCertificate.mass_def`, `TauCeti.UnitaryOrbitCertificate.mass_nonneg`.

**MAJ-B08 — Domain-isometry transport.** For a linear isometric equivalence `eE : E ≃ₗᵢ[𝕜] E'`,
sending `N` to `A ↦ N(A ∘ eE)` is an equivalence between the unitarily invariant seminorms on
`E → F` and those on `E' → F`; along a unitary of `E` it fixes every `N`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.arrowCongr`, `TauCeti.UnitarilyInvariantSeminorm.arrowCongr_apply`, `TauCeti.UnitarilyInvariantSeminorm.arrowCongr_eq_self`.

**MAJ-B09 — Codomain-isometry transport.** For a linear isometric equivalence `eF : F ≃ₗᵢ[𝕜] F'`,
sending `N` to `A ↦ N(eF⁻¹ ∘ A)` is an equivalence between the unitarily invariant seminorms on
`E → F` and those on `E → F'`; along a unitary of `F` it fixes every `N`. Together with MAJ-B08 it
gives the transport `A ↦ N(eF⁻¹ ∘ A ∘ eE)` along both equivalences at once.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.arrowCongr`, `TauCeti.UnitarilyInvariantSeminorm.arrowCongr_apply`, `TauCeti.UnitarilyInvariantSeminorm.arrowCongr_eq_self`.

**MAJ-B10 — Zero-extension singular values.** The zero extension of `A : E → F` is the
endomorphism of the Hilbert product `WithLp 2 (E × F)` sending `(x, y)` to `(0, A x)`. It has the
complete singular-value sequence of `A`.

*In Tau Ceti:* `LinearMap.zeroExtension`, `LinearMap.zeroExtension_apply`, `LinearMap.singularValues_zeroExtension`.

**MAJ-B11 — Adjoint transport.** Passing to the adjoint preserves the singular-value sequence,
`σ(A†) = σ(A)` (PolarDecomposition `PD-C08`). For a unitarily invariant seminorm `N` on `E → F`,
`B ↦ N(B†)` is a unitarily invariant seminorm on `F → E`, and doing this twice returns `N`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.compAdjoint`, `TauCeti.UnitarilyInvariantSeminorm.compAdjoint_apply`, `TauCeti.UnitarilyInvariantSeminorm.compAdjoint_compAdjoint`.

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

**MAJ-B14 — Certificates from convex combinations.** Every point of the orbit hull of `C` has an
orbit certificate over `C` of mass `1`.

*In Tau Ceti:* `TauCeti.UnitaryOrbitCertificate.exists_mass_eq_one_of_mem_twoSidedUnitaryOrbitHull`.

**MAJ-B15 — Reindexing certificates.** A certificate reindexes along an equivalence `ι ≃ κ` of
finite index types, with the same mass.

*In Tau Ceti:* `TauCeti.UnitaryOrbitCertificate.reindex`, `TauCeti.UnitaryOrbitCertificate.mass_reindex`.

**MAJ-B16 — Certificate norm bound.** If `X` has a certificate over `C` of mass `m`, then
`N(X) ≤ m N(C)` for every unitarily invariant seminorm `N`; in particular `N(X) ≤ N(C)` on the
orbit hull of `C`.

*In Tau Ceti:* `TauCeti.UnitaryOrbitCertificate.apply_le_mass_mul`, `TauCeti.UnitarilyInvariantSeminorm.map_le_of_mem_twoSidedUnitaryOrbitHull`.

**MAJ-B17 — Rectangular singular-value factorization.** For orthonormal bases `e` of `E` (indexed
by `Fin m`) and `f` of `F` (indexed by `Fin n`), `A = U ∘ D ∘ V` for linear isometric equivalences
`U` of `F` and `V` of `E`, where `D` is the map whose matrix in `e, f` has `σᵢ(A)` at `(i, i)` and
`0` elsewhere.

*In Tau Ceti:* `LinearMap.exists_linearIsometryEquiv_eq_comp_toLin_comp`.

**MAJ-B18 — Two-sided factorization from equal singular values.** A map `X : E → F` lies in the
two-sided orbit of `C` exactly when `σ(X) = σ(C)`. So maps `A, B : E → F` with the same singular
values satisfy `A = U B V` for unitaries `U` of `F` and `V` of `E`.

*In Tau Ceti:* `LinearMap.mem_twoSidedUnitaryOrbit_iff_singularValues_eq`.

**MAJ-B19 — Determination by singular values.** `σ(A) = σ(B)` gives `N(A) = N(B)` for every
unitarily invariant seminorm `N` on `E → F`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.map_eq_of_singularValues_eq`.

**MAJ-B20 — Orbit-hull characterization of Ky Fan domination.** `A` lies in the orbit hull of `C`
exactly when `Kₖ(A) ≤ Kₖ(C)` for every `k`.

*In Tau Ceti:* `LinearMap.mem_twoSidedUnitaryOrbitHull_iff_kyFanSum_le`.

**MAJ-B21 — Rectangular Fan dominance.** If `Kₖ(A) ≤ Kₖ(C)` for every `k`, then `N(A) ≤ N(C)` for
every unitarily invariant seminorm `N` on `E → F`. Route: MAJ-B20 and MAJ-B16.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.map_le_of_kyFanSum_le`.

*Needs:* §2.1; §1.4 (MAJ-A26); §1.2 (transfer descent, for the hull characterization); §1.5 (the
rectangular diagonal model); Mathlib `mem_convexHull_iff_exists_fintype`, `Matrix.toLin`.

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

**MAJ-B44 — Gauge representation.** Every unitarily invariant seminorm `N` on the endomorphisms of
`E` is a symmetric gauge of the singular-value tuple of length `n = dim E`: there is a symmetric
gauge `g` on `Fin n → ℝ` with `N(A) = g(σ₀(A), …, σₙ₋₁(A))` for every `A`.

- In the rectangular form, `N` on `E → F` has a gauge on tuples of length `p = min(dim E, dim F)`,
  whose value at `x` is `N` of `y ↦ ∑ᵢ xᵢ ⟪vᵢ, y⟫ wᵢ` for any orthonormal families `(vᵢ)` in `E`
  and `(wᵢ)` in `F`, `i < p`; it is a symmetric gauge, and `N(A)` is its value at
  `(σ₀(A), …, σₚ₋₁(A))`.
- Conversely every symmetric gauge `g` on `n`-tuples gives the unitarily invariant seminorm
  `A ↦ g(σ₀(A), …, σₙ₋₁(A))`, and for `n = p` the two constructions are inverse to each other.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.exists_isSymmetricGauge_forall_map_eq`, `TauCeti.UnitarilyInvariantSeminorm.gauge`, `TauCeti.UnitarilyInvariantSeminorm.gauge_apply`, `TauCeti.UnitarilyInvariantSeminorm.isSymmetricGauge_gauge`, `TauCeti.UnitarilyInvariantSeminorm.map_eq_gauge_singularValues`, `TauCeti.UnitarilyInvariantSeminorm.ofIsSymmetricGauge`, `TauCeti.UnitarilyInvariantSeminorm.ofIsSymmetricGauge_apply`, `TauCeti.UnitarilyInvariantSeminorm.ofIsSymmetricGauge_gauge`, `TauCeti.UnitarilyInvariantSeminorm.gauge_ofIsSymmetricGauge`.

**MAJ-B45 — Ideal inequality.** If `‖C y‖ ≤ c ‖y‖` for every `y` (for `c ≥ 0`: `‖C‖ ≤ c`), then
`N(C A) ≤ c N(A)` and `N(A C) ≤ c N(A)` for every unitarily invariant seminorm `N`, for square
endomorphisms `A, C` of one space and, for rectangular `A`, with `C` an endomorphism of the
matching side. Composing with an orthogonal projection `Submodule.starProjection` on either side
does not increase `N`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.map_comp_le_left`, `TauCeti.UnitarilyInvariantSeminorm.map_comp_le_right`, `TauCeti.UnitarilyInvariantSeminorm.map_starProjection_comp_le`, `TauCeti.UnitarilyInvariantSeminorm.map_comp_starProjection_le`.

**MAJ-B46 — Modulus invariance.** `N(|A|) = N(A)` for every unitarily invariant seminorm `N` on the
endomorphisms of `E`, where `|A| = √(A†A)` is the operator modulus `LinearMap.operatorAbs A`.
Route: `σ(|A|) = σ(A)` (`LinearMap.singularValues_operatorAbs`, PolarDecomposition `PD-C28`) and
MAJ-B19.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.map_operatorAbs`.

*Needs:* §2.2; §1.5; §1.2 (gauge monotonicity, for the converse construction of MAJ-B44); Tau Ceti
`LinearMap.operatorAbs`, `LinearMap.singularValues_operatorAbs`; Mathlib
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

**MAJ-B22 — Orthogonal block sum.** For `A : E₁ → F₁` and `B : E₂ → F₂`, the orthogonal block sum
`A ⊕ B = (A.prodMap B).withLpMap 2` (Convention 9) is the block-diagonal map between the Hilbert
`L²` products `WithLp 2 (E₁ × E₂)` and `WithLp 2 (F₁ × F₂)`, built from Mathlib's
`LinearMap.prodMap` and `LinearMap.withLpMap`.

**MAJ-B23 — Componentwise action.** `(A ⊕ B)(x, y) = (A x, B y)`; this is Mathlib's
`LinearMap.coe_withLpMap` with `LinearMap.prodMap_apply`.

**MAJ-B24 — Adjoint of a block sum.** `(A ⊕ B)† = A† ⊕ B†`.

*In Tau Ceti:* `LinearMap.adjoint_prodMap_withLpMap`.

**MAJ-B25 — Composition of block sums.** `(A₁ ⊕ B₁)(A₂ ⊕ B₂) = A₁A₂ ⊕ B₁B₂` whenever the
compositions are typed; this is Mathlib's `LinearMap.withLpMap_comp` with `LinearMap.prodMap_comp`.

**MAJ-B26 — Singular values of a doubled block.** `σᵢ(A ⊕ A) = σ⌊i/2⌋(A)` for every `i`: the
singular values of `A`, each repeated twice, in nonincreasing order.

*In Tau Ceti:* `LinearMap.singularValues_prodMap_withLpMap_self`.

**MAJ-B27 — Ky Fan sums of a doubled block.** `K₂ₖ(A ⊕ A) = 2 Kₖ(A)` for every `k`.

*In Tau Ceti:* `LinearMap.kyFanSum_prodMap_withLpMap_self`.

**MAJ-B28 — Block-sum orbit-hull stability.** If `A` is in the orbit hull of `C` and `B` in that of
`D`, then `A ⊕ B` is in the orbit hull of `C ⊕ D`. Equivalently, by MAJ-B20, blockwise Ky Fan
domination gives Ky Fan domination of the block sums.

*In Tau Ceti:* `LinearMap.prodMap_withLpMap_mem_twoSidedUnitaryOrbitHull`, `LinearMap.kyFanSum_prodMap_withLpMap_le`.

**MAJ-B29 — Sharp block-sum norm comparison.** If `Kₖ(A) ≤ Kₖ(C)` and `Kₖ(B) ≤ Kₖ(D)` for every
`k`, then `N(A ⊕ B) ≤ N(C ⊕ D)` for every unitarily invariant seminorm `N` on
`WithLp 2 (E₁ × E₂) → WithLp 2 (F₁ × F₂)`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.map_prodMap_withLpMap_le`.

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

**MAJ-B30 — Operator-norm instance.** The operator norm `A ↦ ‖A‖`, the norm of
`LinearMap.toContinuousLinearMap A`, is a unitarily invariant seminorm on `E → F`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.opNorm`, `TauCeti.UnitarilyInvariantSeminorm.opNorm_apply`.

**MAJ-B31 — Frobenius instance.** The Frobenius functional `A ↦ ‖A‖_F` of Convention 10, the value
`(∑ᵢ ‖A bᵢ‖²)^(1/2)` in an orthonormal basis `(bᵢ)` of `E`, is a unitarily invariant seminorm on
`E → F`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.frobenius`.

**MAJ-B32 — Ky Fan instances.** For every `k`, the Ky Fan `k`-sum `A ↦ Kₖ(A)` is a unitarily
invariant seminorm on `E → F`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.kyFan`, `TauCeti.UnitarilyInvariantSeminorm.kyFan_apply`.

**MAJ-B33 — Nuclear-norm instance.** The sum of all singular values, `A ↦ ‖A‖₁ = ∑ᵢ σᵢ(A)`, is a
unitarily invariant seminorm on `E → F`; it equals `Kₖ(A)` for `k ≥ rank A`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.nuclear`, `LinearMap.kyFanSum_eq_nuclear`.

**MAJ-B34 — Frobenius basis formula (D1).** For every orthonormal basis `(bᵢ)` of `E`,
`‖A‖_F = (∑ᵢ ‖A bᵢ‖²)^(1/2)`. In orthonormal bases `(bᵢ)` of `E` and `(cⱼ)` of `F`,
`‖A‖_F² = ∑ᵢⱼ ‖⟪cⱼ, A bᵢ⟫‖²`, and `‖A‖_F` is the Frobenius norm of the matrix of `A`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.frobenius_apply`, `TauCeti.UnitarilyInvariantSeminorm.sq_frobenius_apply`, `TauCeti.UnitarilyInvariantSeminorm.sq_frobenius_apply_eq_sum_norm_inner_sq`, `LinearMap.frobenius_norm_toMatrix`.

**MAJ-B35 — Basis independence of Frobenius.** `∑ᵢ ‖A bᵢ‖²` is the same for any two orthonormal
bases `(bᵢ)` of `E`.

*In Tau Ceti:* `LinearMap.sum_norm_apply_sq_eq_sum_norm_apply_sq`.

**MAJ-B36 — Frobenius singular-value formula.** `‖A‖_F = (∑ᵢ σᵢ(A)²)^(1/2)`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.frobenius_apply_eq_sqrt_sum_sq_singularValues`.

**MAJ-B37 — Nuclear singular-value formula.** The nuclear seminorm of MAJ-B33 takes the value
`‖A‖₁ = ∑ᵢ σᵢ(A)`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.nuclear_apply`.

**MAJ-B38 — Rank-sharp nuclear-to-Frobenius bound.** `‖A‖₁ ≤ √(rank A) ‖A‖_F`, where `rank A` is
the dimension of the range of `A`.

*In Tau Ceti:* `TauCeti.UnitarilyInvariantSeminorm.nuclear_apply_le_sqrt_finrank_range_mul_frobenius_apply`.

*Needs:* §2.1; §1.4 (MAJ-A26, MAJ-A31); Mathlib `LinearMap.toContinuousLinearMap`,
`OrthonormalBasis`, `LinearMap.toMatrix`.

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

**MAJ-B40 — Diagonal planar model.** If `‖d₁‖ ≤ ‖d₀‖`, the map with matrix `diag(d₀, d₁)` in `e`
has singular values `(‖d₀‖, ‖d₁‖, 0, 0, …)`; for real `s₀ ≥ s₁ ≥ 0` this is `(s₀, s₁, 0, 0, …)`.

*In Tau Ceti:* `Matrix.singularValues_toLin_diagonal_fin_two`.

**MAJ-B41 — Symmetric off-diagonal planar model.** The map with matrix `[[0, r], [r, 0]]` in `e`
has singular values `(|r|, |r|, 0, …)`; more generally `[[0, b], [c, 0]]` with `‖b‖ ≤ ‖c‖` has
`(‖c‖, ‖b‖, 0, …)`.

*In Tau Ceti:* `Matrix.singularValues_toLin_offDiag_self_fin_two`, `Matrix.singularValues_toLin_offDiag_fin_two`.

**MAJ-B42 — One-sided triangular planar model.** The map with matrix `[[0, 0], [r, 0]]` in `e` has
singular values `(|r|, 0, …)`.

*In Tau Ceti:* `Matrix.singularValues_toLin_offDiag_zero_fin_two`.

**MAJ-B43 — Trace–determinant recovery in dimension two.** For `A : E → F` with `dim E = 2`,
`σ(A) = (σ₀, σ₁, 0, …)`, `tr(A†A) = σ₀² + σ₁²` and `det(A†A) = σ₀²σ₁²`; with `t = tr(A†A)` and
`δ = det(A†A)`, `σ₀² = (t + √(t² − 4δ))/2` and `σ₁² = (t − √(t² − 4δ))/2`, so the nonnegative
ordered pair `(σ₀, σ₁)` is determined by `t` and `δ`. Hence two maps out of planes have the same
singular values exactly when their Gram operators have the same trace and determinant.

*In Tau Ceti:* `LinearMap.singularValues_eq_single_add_single_of_finrank_eq_two`, `LinearMap.trace_adjoint_comp_self_eq_of_finrank_eq_two`, `LinearMap.det_adjoint_comp_self_eq_of_finrank_eq_two`, `LinearMap.sq_singularValues_zero_of_finrank_eq_two`, `LinearMap.sq_singularValues_one_of_finrank_eq_two`, `LinearMap.singularValues_eq_iff_trace_eq_and_det_eq`.

*Needs:* §1.5; Mathlib `Matrix.toLin`, `LinearMap.trace`, `LinearMap.det`.

**Checks.**
- `[[0, r], [r, 0]]` has eigenvalues `±r` and singular values `(|r|, |r|)`; `[[0, 0], [r, 0]]` has
  both eigenvalues `0` and singular values `(|r|, 0)`. For `r = 2` these are `(2, 2)` and `(2, 0)`;
  for `r = i`, `(1, 1)` and `(1, 0)`. A model read off the eigenvalues would get both wrong.
- For the shear `S` of §2.5, `tr(S†S) = 3` and `det(S†S) = 1`, so `σ₀² = (3 + √5)/2` and
  `σ₁² = (3 − √5)/2`. The diagonal map `diag((1 + √5)/2, (√5 − 1)/2)` has the same Gram trace and
  determinant, hence the same singular values, although `S` is not normal.

### Examples

- The acceptance examples of Part B are the four concrete seminorms MAJ-B30–MAJ-B33 and the
  zero-extension transport MAJ-B10. At the shear `S` the four seminorms take the values
  `‖S‖ = (1 + √5)/2`, `‖S‖_F = √3`, `‖S‖₁ = √5` and `K₁(S) = (1 + √5)/2`.
- On the endomorphisms of `𝕜²`, the Frobenius seminorm MAJ-B31 at `E = F` is the square instance,
  with singular-value formula MAJ-B36. MAJ-B19 and MAJ-B21 specialized to `E = F` give
  determination by singular values and Fan dominance for square operators: `I` and `diag(2, 0)`
  satisfy `Kₖ(I) ≤ Kₖ(diag(2, 0))` for every `k`, so `N(I) ≤ N(diag(2, 0))` for every unitarily
  invariant `N`, and modulus invariance MAJ-B46 gives `N(|J|) = N(J)` for the nilpotent `J`.
- The zero extension MAJ-B10 carries a rectangular `A : E → F` to an endomorphism of
  `WithLp 2 (E × F)` with the same singular values, so square statements apply to it.

### Dependencies

Part B rests on Part A: the Ky Fan sums and their triangle inequality (§1.4), weak majorization
and gauge monotonicity (§1.2), and the diagonal models (§1.5). From Mathlib it uses seminorms,
linear isometric equivalences, adjoints, convex hulls, the `L²` products `WithLp 2`, product maps,
matrices of linear maps, trace and determinant. From Tau Ceti it uses the singular values of the
adjoint and of the modulus and the modulus itself (PolarDecomposition, Parts A and C). Part A has
no dependency on Part B.

## Downstream consumers

- [PrincipalAngles](../PrincipalAngles/README.md) states the eigenvalue-perturbation estimates
  of its Part B for the seminorms of Part B here (MAJ-B01–MAJ-B43), uses modulus invariance
  MAJ-B46 for the projector difference, and relies on the majorization of diagonals (§1.3) for
  Davis's lower bound. Its own Birkhoff bilinear bound, von Neumann trace inequality and
  permutation-orbit hull for diagonals (PrincipalAngles `PA-B31`, `PA-B32`, `PA-B34`) rest on
  Birkhoff's theorem (Mathlib `doublyStochastic_eq_convexHull_permMatrix`) and the rearrangement
  inequality (Mathlib `MonovaryOn.sum_comp_perm_smul_le_sum_smul`).
- [SpectralSubspacePerturbation](../SpectralSubspacePerturbation/README.md) consumes the
  rectangular seminorms with Fan dominance (§2.1–§2.2), the block-sum comparison MAJ-B29 and the
  Frobenius seminorm (§2.5); the estimates lifted by Part B are stated there.
- [OperatorIdeals](../OperatorIdeals/README.md) consumes the Ky Fan triangle inequality MAJ-A31
  and the majorization engine (§1.2) for its symmetric-gauge layer, and identifies its `S₂` norm
  with the Frobenius seminorm (§2.5).
- [NoncommutativeIntegration](../../NoncommutativeIntegration/README.md) uses the Ky Fan maximum
  principle MAJ-A28 and the triangle inequality MAJ-A31 for a matrix Check.
- [ComplexHessianEquations](../../ComplexHessianEquations/README.md) uses the Robin Hood transfers
  and the transfer closure (MAJ-A03, MAJ-A15) for the concavity of spectral functions, and Ky Fan's
  maximum principle MAJ-A27.

## Provenance

An Apache-2.0 implementation of both Parts exists in the
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
domination (§1.4); the diagonal models (§1.5); and the whole of Part B: rectangular unitarily
invariant seminorms, their orbits, orbit hulls and certificates, Fan dominance, the gauge
representation, the ideal inequality, modulus invariance, orthogonal block sums, the operator,
Frobenius, Ky Fan and nuclear seminorms, and the planar models. Unitarily invariant norms are
defined here once, for square and rectangular maps.

**Mathlib's part.** The diagonal operator and the orthogonal block sum (MAJ-A36, MAJ-B22) are
built from Mathlib's matrices of linear maps, product maps and `WithLp` maps, and the additivity
and symmetry of diagonal operators (MAJ-A37, MAJ-A38) and the componentwise action and composition
of block sums (MAJ-B23, MAJ-B25) are Mathlib lemmas, named in those items.

**Owned elsewhere and consumed here.**

- *The operator modulus, the singular system and the singular-value identities* `σ(A†) = σ(A)`,
  `σ(|A|) = σ(A)` and `σᵢ(A)² = λᵢ(A†A)`, and the Courant–Fischer min–max formula behind the Ky Fan
  trace inequality: PolarDecomposition (Part A, `PD-A51`; Part C, `PD-C08`–`PD-C18`, `PD-C28`),
  present in Tau Ceti as the declarations listed under the supplier contracts below; nothing here
  re-proves them.
- *Gram rigidity and coordinate isometries*: OrthogonalGeometry (`OG-01`–`OG-08`), on which the
  rectangular singular-value factorization and the orbit statements of §2.2 rest.
- *Approximation numbers and every gauge of them*: OperatorIdeals; this roadmap stays in finite
  dimension.
- *Angles, the permutation-orbit hull for diagonals, Davis's bound and von Neumann's trace
  inequality*: PrincipalAngles.

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

The declarations that realise this roadmap's own items are named on the *In Tau Ceti* lines of the
items above. The declarations consumed from PolarDecomposition are the following, with paths under
`TauCeti/`; each is assumed to state what its use above says.

- `Analysis/InnerProductSpace/SingularValues.lean`: `LinearMap.singularValues_adjoint`
  (`σ(A†) = σ(A)`), `LinearMap.singularValues_operatorAbs` (`σ(|A|) = σ(A)`), and the singular
  system `LinearMap.rightSingularBasis`, `LinearMap.leftSingularVector`,
  `LinearMap.apply_rightSingularBasis`, `LinearMap.inner_leftSingularVector`,
  `LinearMap.eigenvalues_adjoint_comp_self_eq_zero_iff`,
  `LinearMap.exists_orthonormalBasis_apply_eq_leftSingularVector`.
- `Analysis/InnerProductSpace/Positive/SquareRoot.lean`: `LinearMap.operatorAbs`, the positive
  square root of `A†A` for `A : E →ₗ[𝕜] F`.

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
