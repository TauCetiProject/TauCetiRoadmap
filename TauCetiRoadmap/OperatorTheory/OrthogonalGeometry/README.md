# Roadmap: orthogonal geometry — Gram rigidity, coordinate isometries and orthogonal series

**Summary.** Orthogonal geometry turns inner-product data into canonical identifications of
subspaces and coordinates. This roadmap is that geometry for the operator-theory roadmaps, over a
real or complex inner-product space E, with scalars 𝕜 = ℝ or ℂ and the inner product
conjugate-linear in its first argument. Its objects are families of vectors and their Gram data,
the pairwise inner products ⟪vᵢ, vⱼ⟫; the coordinate isometry of a finite orthonormal family;
subspaces reducing an operator; and series of pairwise-orthogonal vectors, among which zero
vectors are allowed.

Its central theorem is Gram rigidity, a theorem of Tau Ceti's inner-product library which the
layers below complement. If two linear maps S and T out of a common vector space satisfy
⟪Sx, Sy⟫ = ⟪Tx, Ty⟫ for all x and y, then Sx ↦ Tx is a well-defined linear isometry from the range
of S onto the range of T. For two families (vᵢ) and (wᵢ) indexed by the same set with
⟪vᵢ, vⱼ⟫ = ⟪wᵢ, wⱼ⟫ for all i and j, this gives an isometry of their spans sending each vᵢ to wᵢ;
and in a finite-dimensional space, two families have equal Gram matrices exactly when a linear
isometry of the space onto itself carries one to the other. Neither linear independence nor a
finite index set is needed.

The roadmap's own theorems complete this picture. The inner product of two linear combinations
is computed from the pairwise inner products: ⟪∑ᵢ aᵢφᵢ, ∑ⱼ bⱼψⱼ⟫ = ∑ᵢ ∑ⱼ āᵢ bⱼ ⟪φᵢ, ψⱼ⟫. If
(vᵢ) is a pairwise-orthogonal family with sum x, then ∑ᵢ ‖vᵢ‖² = ‖x‖², with no completeness
hypothesis; and in a complete space the series ∑ᵢ vᵢ converges exactly when ∑ᵢ ‖vᵢ‖² does. These
cover families such as (σᵢuᵢ) with (uᵢ) orthonormal and some σᵢ = 0, which cannot be normalized.

Mathlib provides inner-product spaces, orthogonal projections, invariant subspaces, Gram matrices
and orthogonal families of subspaces with Pythagoras and their summability criterion. Tau Ceti
provides Gram rigidity, the coordinate isometry of a finite orthonormal family, reducing subspaces,
completeness of subspaces admitting an orthogonal projection, and the orthogonal family of the
lines spanned by pairwise-orthogonal vectors. Majorization uses Gram rigidity in its rectangular
constructions, PrincipalAngles builds its overlap operator from the coordinate isometry, and
SelfAdjointSpectralTheory uses reducing subspaces and the completeness of projected subspaces.

Layer 1 expands inner products of linear combinations. Layer 2 identifies the coordinate isometry
on d-dimensional Euclidean coordinate space with Tau Ceti's. Layer 3 proves the summability
criterion and Parseval's identity for pairwise-orthogonal families. The three layers are
independent of one another.

## Conventions

1. **Scalars and spaces.** `𝕜` carries `[RCLike 𝕜]` (it is `ℝ` or `ℂ`), and `E`, `F`, `G` are
   inner-product spaces over `𝕜`: `[NormedAddCommGroup E] [InnerProductSpace 𝕜 E]`, in
   universe-polymorphic `Type*`. The inner product is Mathlib's `⟪x, y⟫_𝕜`, conjugate-linear in the first
   argument and linear in the second (`inner_smul_left`, `inner_smul_right`); `conj` is
   `starRingEnd 𝕜`. Finite dimension (`[FiniteDimensional 𝕜 E]`) and completeness
   (`[CompleteSpace E]`) are hypotheses of the statements that use them: finite dimension where an
   ambient isometry is obtained from Gram data, completeness where a series is to converge.
2. **Gram data.** The Gram data of a family `v : ι → E` are the inner products `⟪v i, v j⟫_𝕜`,
   and its Gram matrix is Mathlib's `Matrix.gram 𝕜 v`. *Gram rigidity* is the reconstruction of a
   family, of its span or of the ambient space, up to a linear isometry, from these data. Index
   types are arbitrary unless a statement says otherwise.
3. **Range and span.** The range of a linear map `S` is `LinearMap.range S`; the span of a family
   `v` is `Submodule.span 𝕜 (Set.range v)`.
4. **Orthonormal coordinates.** Euclidean coordinate space is `EuclideanSpace 𝕜 (Fin d)`, with
   standard basis `EuclideanSpace.basisFun (Fin d) 𝕜` and `eⱼ = EuclideanSpace.single j 1`. The
   *coordinate isometry* of an orthonormal family `(vⱼ)` is `x ↦ ∑ⱼ xⱼ • vⱼ`, which sends `eⱼ` to
   `vⱼ`.
5. **Orthogonal complements and projections.** `Uᗮ` is the orthogonal complement of a subspace
   `U`. The orthogonal projection onto `U` is `U.starProjection`, available when
   `[U.HasOrthogonalProjection]`; a complete subspace, in particular a finite-dimensional one, has
   one by Mathlib's instance `Submodule.HasOrthogonalProjection.ofCompleteSpace`.
6. **Invariant and reducing subspaces.** A subspace `U` is *invariant* under `A : Module.End 𝕜 E`
   when `A(U) ⊆ U`, that is `U ∈ A.invtSubmodule`; it is *reducing* when both `U` and `Uᗮ` are
   invariant (Tau Ceti's `Submodule.IsReducing`).
7. **Orthogonal families and series.** A family `v : ι → E` is *pairwise orthogonal* when
   `Pairwise fun i j ↦ ⟪v i, v j⟫_𝕜 = 0`; zero vectors are allowed. An orthogonal series is the
   sum of a pairwise-orthogonal family in Mathlib's unconditional sense (`HasSum`, `Summable`,
   `tsum`, limits of finite partial sums over `Finset ι`), and its summability is measured by the
   squared norms `‖v i‖ ^ 2`.
8. **Names and labels.** Declarations of this roadmap go under
   `TauCeti/Analysis/InnerProductSpace/`; the acceptance file `Suggested.lean` states them in
   `TauCetiRoadmap.OrthogonalGeometry`. Other roadmaps cite items of this roadmap by the labels
   `OG-nn`: a section below carries its labels in its heading, and the table under Scope and
   ownership resolves every other label to its Tau Ceti declaration.

## Layer 1: Gram rigidity

Equal pullback inner products determine a canonical isometry between ranges. For linear maps
`S : M →ₗ[𝕜] E` and `T : M →ₗ[𝕜] F` out of a common `𝕜`-module `M`, equal self inner products
`⟪S x, S x⟫ = ⟪T x, T x⟫` suffice for `LinearMap.ker S = LinearMap.ker T`
(`TauCeti.ker_eq_of_inner_self_eq`), and `⟪S x, S y⟫ = ⟪T x, T y⟫` for all `x`, `y` gives the
range isometry `TauCeti.rangeEquivOfInnerEq`, which sends `S x` to `T x`
(`TauCeti.rangeEquivOfInnerEq_apply`) and is the only linear isometric equivalence of the ranges
doing so (`TauCeti.eq_rangeEquivOfInnerEq`). Applied to the linear-combination maps
`Finsupp.linearCombination 𝕜 v` and `Finsupp.linearCombination 𝕜 w` of two families with equal Gram
data, it gives the span isometry `TauCeti.spanEquivOfInnerEq`, sending `v i` to `w i`
(`TauCeti.spanEquivOfInnerEq_apply`) and unique with this property
(`TauCeti.eq_spanEquivOfInnerEq`). In a finite-dimensional `E`, two families `v w : ι → E` with
equal Gram data are carried onto one another by some `W : E ≃ₗᵢ[𝕜] E`
(`TauCeti.exists_linearIsometryEquiv_of_inner_eq`), whose restriction to the span of `v` is the
span isometry by the uniqueness statement; and `Matrix.gram 𝕜 v = Matrix.gram 𝕜 w` holds exactly
when such a `W` exists (`TauCeti.gram_eq_iff_exists_linearIsometryEquiv`). Chien and Waldron
recall Gram rigidity in its frame-theoretic form, for finite sequences of vectors in Hilbert
spaces, as a well-known fact without proof (Chien–Waldron, Thm 2.2(1), pp. 4–5; also (1.1),
p. 2). The layer adds the expansion that computes the inner products of linear combinations from
Gram data.

### 1.1 Inner products of linear combinations (OG-04)

Prove that for finite sets `s : Finset ι` and `t : Finset κ`, coefficients `a : ι → 𝕜` and
`b : κ → 𝕜`, and families `φ : ι → E` and `ψ : κ → E`,

    ⟪∑ i ∈ s, a i • φ i, ∑ j ∈ t, b j • ψ j⟫_𝕜 = ∑ i ∈ s, ∑ j ∈ t, conj (a i) * b j * ⟪φ i, ψ j⟫_𝕜,

and that for finitely supported coefficients `a : ι →₀ 𝕜` and `b : κ →₀ 𝕜`,

    ⟪Finsupp.linearCombination 𝕜 φ a, Finsupp.linearCombination 𝕜 ψ b⟫_𝕜
      = a.sum fun i α ↦ b.sum fun j β ↦ conj α * β * ⟪φ i, ψ j⟫_𝕜.

The index types `ι` and `κ` are independent, and nothing is assumed of the families: they may be
dependent, repeat vectors or contain zero. The identity is sesquilinearity of the inner product,
so it needs no source. *Route.* Expand the left argument with `sum_inner` and the right with
`inner_sum`, then pull the scalars out with `inner_smul_left` and `inner_smul_right`; for the
finitely supported form use `Finsupp.linearCombination_apply` with `Finsupp.sum_inner` and
`Finsupp.inner_sum`.
*Needs:* Mathlib `sum_inner`, `inner_sum`, `inner_smul_left`, `inner_smul_right`,
`Finsupp.linearCombination_apply`, `Finsupp.sum_inner`, `Finsupp.inner_sum`.

**Checks.**
- Take `E = ℂ` over `𝕜 = ℂ`, so `⟪z, w⟫ = conj z * w`, one term on each side with
  `φ = ψ = 1`, `a = i` and `b = 1`. The left side is `⟪i, 1⟫ = −i`, and the double sum is
  `conj i * 1 * ⟪1, 1⟫ = −i`. A formula that conjugates the right-hand coefficients instead,
  `a i * conj (b j) * ⟪φ i, ψ j⟫`, gives `i`.
- Take `E = ℝ²`, `φ = ψ = (e₁, e₁ + e₂)` and `a = b = (1, −1)`. Then `∑ aᵢφᵢ = −e₂` and the left
  side is `1`. The Gram matrix is `[[1, 1], [1, 2]]`, and the double sum is `1 − 1 − 1 + 2 = 1`.
  Keeping only the diagonal terms `i = j`, as one may for an orthogonal family, gives `1 + 2 = 3`.
- Take `E = ℂ²` over `ℂ`, `φ = ψ = (e₁, i e₁)`, `a = (1, 0)` and `b = (0, 1)`. The left side is
  `⟪e₁, i e₁⟫ = i`, and the double sum reduces to `⟪φ₁, ψ₂⟫ = i`. A formula with the inner products
  in the other order, `⟪ψ j, φ i⟫`, gives `⟪i e₁, e₁⟫ = −i`.

### Examples

- In `ℝ²` the dependent families `(e₁, 2e₁)` and `(e₂, 2e₂)` both have Gram matrix `[[1, 2], [2, 4]]`.
  The reflection exchanging the two coordinates carries the first to the second, as ambient Gram
  rigidity predicts for families that are not independent. By §1.1, for both families the inner
  product of the combinations with coefficients `(a₁, a₂)` and `(b₁, b₂)` is
  `a₁b₁ + 2a₁b₂ + 2a₂b₁ + 4a₂b₂ = (a₁ + 2a₂)(b₁ + 2b₂)`.
- The families `(e₁, e₂)` and `(e₁, 2e₂)` in `ℝ²` have Gram matrices differing in the entry
  `(2, 2)`, `1` against `4`, and no linear isometry carries the first to the second: it would send
  the unit vector `e₂` to a vector of norm `2`.

### Dependencies

§1.1 uses only Mathlib's sesquilinearity lemmas for the inner product and
`Finsupp.linearCombination`. The Gram rigidity theorems that frame the layer are Tau Ceti's
(supplier contracts below). No other roadmap is used.

## Layer 2: coordinate isometries

An orthonormal family identifies Euclidean coordinate space isometrically with its span. For a
finite index type `ι` and an orthonormal `v : ι → E` this is Tau Ceti's
`Orthonormal.synthesisMapIsometry`, with its coordinate formula
`Orthonormal.synthesisMapIsometry_apply`, its action `Orthonormal.synthesisMapIsometry_single` on
single-coordinate vectors, its range `Orthonormal.range_synthesisMapIsometry` (the span of `v`)
and, for complete `E`, its adjoint `Orthonormal.adjoint_synthesisMapIsometry_apply`, which sends
`y` to `(⟪v i, y⟫_𝕜)ᵢ`. This layer records its case on the coordinates `Fin d`, in which the
principal-angle constructions of the operator-theory roadmaps are written.

### 2.1 The coordinate isometry on `Fin d`

For `v : Fin d → E` and `hv : Orthonormal 𝕜 v`, the coordinate isometry is Tau Ceti's
`Orthonormal.synthesisMapIsometry hv : EuclideanSpace 𝕜 (Fin d) →ₗᵢ[𝕜] E`, the case `ι = Fin d`
of the map above. It sends `x` to `∑ j, x j • v j` (`Orthonormal.synthesisMapIsometry_apply`)
and `EuclideanSpace.single j c` to `c • v j` for every `c : 𝕜`
(`Orthonormal.synthesisMapIsometry_single`), in particular the standard basis vector `eⱼ` to `vⱼ`.

The acceptance file `Suggested.lean` declares a local copy of this map, `familyIsometry hv`, under
the name from which the acceptance file of PrincipalAngles builds its overlap operator; the copy is
not to be added to Tau Ceti. It is defined from Mathlib alone, as the linear map sending `eⱼ` to
`vⱼ` (`Module.Basis.constr` on the basis `EuclideanSpace.basisFun (Fin d) 𝕜`), a linear isometry
because it carries an orthonormal basis to an orthonormal family
(`LinearMap.isometryOfOrthonormal`): the Tau Ceti module of `Orthonormal.synthesisMapIsometry`
imports Tau Ceti's operator square root `LinearMap.IsPositive.sqrt`, a name that the acceptance
file of PolarDecomposition declares as well, and the acceptance files of Majorization and
PrincipalAngles import that file beside this one. The single statement about the copy, a sanity
check and not a library target, is that `familyIsometry hv` equals
`hv.synthesisMapIsometry` as a linear isometry.

*Route.* By extensionality: `LinearMap.coe_isometryOfOrthonormal` and
`Module.Basis.constr_apply_fintype` write the copy as `x ↦ ∑ j, cⱼ(x) • v j` with `cⱼ(x)` the
coordinates of `x` in the basis, `EuclideanSpace.basisFun_repr` identifies `cⱼ(x)` with `x j`,
and the resulting formula is `Orthonormal.synthesisMapIsometry_apply`.
*Needs:* Tau Ceti `Orthonormal.synthesisMapIsometry`, `Orthonormal.synthesisMapIsometry_apply`,
`Orthonormal.synthesisMapIsometry_single`; for the copy, Mathlib `EuclideanSpace.basisFun`,
`EuclideanSpace.basisFun_repr`, `EuclideanSpace.single`, `Module.Basis.constr`,
`LinearMap.isometryOfOrthonormal`.

**Checks.**
- The family `v₁ = v₂ = e₁` in `ℝ²` consists of unit vectors but is not orthonormal. The linear
  map sending the standard basis to it sends `(1, −1)` to `0`, so it is not an isometry: the
  definition needs orthonormality, not only unit vectors.
- Over `ℂ` with `d = 1`, `E = ℂ` and `v₀ = 1`, the coordinate isometry sends `i • e₀` to `i`. The
  conjugate formula `x ↦ ∑ⱼ conj xⱼ • vⱼ`, a common slip from the adjoint's formula, gives `−i`
  and is not `ℂ`-linear.
- For orthonormal families `u` and `v` of `d` vectors in a complete space, the composite of the
  adjoint of the coordinate isometry of `u` with the coordinate isometry of `v` has matrix entries
  `⟪uᵢ, vⱼ⟫` in row `i` and column `j`. For `u = (e₁, e₂)` and
  `v = ((cos θ, sin θ), (−sin θ, cos θ))` in `ℝ²` it is the rotation matrix
  `[[cos θ, −sin θ], [sin θ, cos θ]]`; composing in the other order gives its transpose.

### Examples

- In `ℂ²`, `v₁ = (1, i)/√2` and `v₂ = (1, −i)/√2` are orthonormal: `⟪v₁, v₂⟫ = (1 + (−i)(−i))/2 = 0`.
  The coordinate isometry sends `(x₁, x₂)` to `((x₁ + x₂)/√2, i(x₁ − x₂)/√2)`, whose squared norm
  `(|x₁ + x₂|² + |x₁ − x₂|²)/2 = |x₁|² + |x₂|²` is that of `(x₁, x₂)` by the parallelogram law.
- For `d = 0` the coordinate space is zero and the coordinate isometry is the zero map, an
  isometry with range `{0}`, the span of the empty family.

### Dependencies

§2.1 uses Tau Ceti's `Orthonormal.synthesisMapIsometry` with its coordinate formula and its
action on single-coordinate vectors; the acceptance-file copy uses Mathlib's Euclidean space,
bases and `LinearMap.isometryOfOrthonormal`. No other roadmap is used.

## Layer 3: orthogonal series

Pairwise-orthogonal vectors support Pythagoras, summability and Parseval's identity at their
natural norms, zero vectors included, as in singular expansions with vanishing coefficients. The
lines `𝕜 ∙ v i` spanned by a pairwise-orthogonal family form an `OrthogonalFamily` in Mathlib's
sense (Tau Ceti's `TauCeti.orthogonalFamily_span_singleton`, label OG-19), which makes Mathlib's
orthogonal-family results apply to the vectors themselves; Pythagoras for finite sums,
`‖∑ i ∈ s, v i‖ ^ 2 = ∑ i ∈ s, ‖v i‖ ^ 2`, is Tau Ceti's
`TauCeti.norm_sum_sq_eq_sum_norm_sq_of_pairwise_inner_eq_zero`.

### 3.1 Summability and Parseval's identity for pairwise-orthogonal families

Let `v : ι → E` be pairwise orthogonal, `hv : Pairwise fun i j ↦ ⟪v i, v j⟫_𝕜 = 0`, with `ι`
arbitrary. Prove:

- **Summability criterion.** If `E` is complete, `Summable v ↔ Summable fun i ↦ ‖v i‖ ^ 2`.
- **Parseval's identity.** For every `x : E` with `HasSum v x`,
  `HasSum (fun i ↦ ‖v i‖ ^ 2) (‖x‖ ^ 2)`; no completeness is assumed. Consequently, if
  `Summable v`, then `‖∑' i, v i‖ ^ 2 = ∑' i, ‖v i‖ ^ 2`.

The routes below are complete proofs from the declarations they name (for Parseval's identity,
finite Pythagoras and continuity of the norm), so the section needs no source.
*Route.* For the criterion, apply Mathlib's `OrthogonalFamily.summable_iff_norm_sq_summable` to
the orthogonal family `TauCeti.orthogonalFamily_span_singleton hv` and the elements
`⟨v i, Submodule.mem_span_singleton_self (v i)⟩` of the lines. For Parseval's identity, the finite
partial sums `∑ i ∈ s, v i` tend to `x` along `Finset ι`, so their squared norms tend to `‖x‖ ^ 2`
by continuity of the norm; by finite Pythagoras these squared norms are the partial sums of
`‖v i‖ ^ 2`. The `tsum` form is the case `x = ∑' i, v i`.
*Needs:* Tau Ceti `TauCeti.orthogonalFamily_span_singleton`,
`TauCeti.norm_sum_sq_eq_sum_norm_sq_of_pairwise_inner_eq_zero`; Mathlib
`OrthogonalFamily.summable_iff_norm_sq_summable`, `Submodule.mem_span_singleton_self`, `HasSum`,
`Summable`, `tsum`.

**Checks.**
- For an orthonormal triple `(u₁, u₂, u₃)` and `σ = (1, 0, 2)`, the family `(σᵢuᵢ)` is pairwise
  orthogonal with a zero term, and `‖u₁ + 2u₃‖² = 5 = 1 + 0 + 4`. A statement for orthonormal or
  for nonzero vectors does not cover this family, and the middle term cannot be normalized.
- Pairwise orthogonality cannot be weakened to linear independence: `(1, 0)` and `(1, 1)` in `ℝ²`
  are independent, `‖(2, 1)‖² = 5`, and `‖(1, 0)‖² + ‖(1, 1)‖² = 3`.
- Completeness is needed for the "if" direction of the criterion. In the space of finitely
  supported real sequences with the `ℓ²` inner product, `vₙ = eₙ/(n + 1)` is pairwise orthogonal
  with `∑ ‖vₙ‖² = ∑ 1/(n + 1)²` finite, but `∑ vₙ` has no sum there: its limit in `ℓ²` is the
  sequence `(1/(n + 1))ₙ`, which is not finitely supported. Parseval's identity, which assumes the
  sum exists, needs no completeness.
- The identity is between squared norms. In `ℓ²`, `vₙ = 2⁻ⁿ eₙ` sums to `x = (2⁻ⁿ)ₙ` with
  `‖x‖² = ∑ 4⁻ⁿ = 4/3 = ∑ ‖vₙ‖²`, while `∑ ‖vₙ‖ = 2` differs from `‖x‖ = 2/√3`.

### Examples

- In `ℓ²` the family `vₙ = eₙ/(n + 1)` is pairwise orthogonal with `∑ ‖vₙ‖² = ∑ 1/(n + 1)²`
  finite, so it is summable by the criterion, with sum `x = (1/(n + 1))ₙ`; Parseval's identity
  gives `‖x‖² = ∑ 1/(n + 1)²`, which is `π²/6` by Euler's evaluation.
- For `T = diag(3, 0)` on `ℝ²` and `x = (x₁, x₂)`, `T x = 3x₁ e₁ + 0 · x₂ e₂` is the sum of a
  pairwise-orthogonal family with a zero term, and `‖T x‖² = 9x₁² + 0`. This is the shape of a
  singular expansion `T x = ∑ᵢ σᵢ ⟪vᵢ, x⟫ uᵢ` with a vanishing singular value, whose terms cannot
  all be normalized.

### Dependencies

§3.1 uses Tau Ceti's orthogonal family of lines and finite Pythagoras for pairwise-orthogonal
vectors, and Mathlib's summability criterion for orthogonal families and unconditional sums. No
other roadmap is used.

## Downstream consumers

- [Majorization](../Majorization/README.md) Part A consumes Gram rigidity (OG-01–OG-08) in the
  rectangular orbit arguments of its operator half.
- [PrincipalAngles](../PrincipalAngles/README.md) Part A consumes the coordinate isometry on
  `Fin d` (OG-09–OG-11, §2.1), from which its overlap operator is built (its acceptance file uses
  the copy `familyIsometry`), and the orthogonal family of lines (OG-19); its Part C consumes the
  invariant-subspace material.
- [SelfAdjointSpectralTheory](../SelfAdjointSpectralTheory/README.md) Part C consumes the
  reducing-subspace definition (OG-15) and the completeness of projected subspaces (OG-18).

## Scope and ownership

**This roadmap owns** the orthogonal geometry of the operator-theory roadmaps: Gram rigidity, the
coordinate isometry of an orthonormal family, reducing subspaces, completeness of subspaces
admitting an orthogonal projection, and orthogonal series of pairwise-orthogonal vectors. Its
targets are the expansion of inner products of linear combinations (§1.1) and the summability
criterion and Parseval's identity for pairwise-orthogonal families (§3.1). The coordinate isometry
on the coordinates `Fin d` (§2.1) is Tau Ceti's `Orthonormal.synthesisMapIsometry`;
`familyIsometry` is a copy of it in the acceptance file, not a library target.

**Already in the pinned Tau Ceti.** The other labelled items are theorems and definitions of the
pinned Tau Ceti, used above by these names; paths are under `TauCeti/Analysis/InnerProductSpace/`.

| Label | Content | Tau Ceti declaration |
|---|---|---|
| OG-01 | equal pullback inner products give equal kernels | `TauCeti.ker_eq_of_inner_self_eq` (`Gram/Rigidity.lean`); it assumes only `⟪S x, S x⟫ = ⟪T x, T x⟫` for all `x` |
| OG-02 | the range isometry `S x ↦ T x` | `TauCeti.rangeEquivOfInnerEq`, unique by `TauCeti.eq_rangeEquivOfInnerEq` (`Gram/Rigidity.lean`) |
| OG-03 | its action | `TauCeti.rangeEquivOfInnerEq_apply` (`Gram/Rigidity.lean`) |
| OG-05 | the span isometry of two families with equal Gram data | `TauCeti.spanEquivOfInnerEq`, unique by `TauCeti.eq_spanEquivOfInnerEq` (`Gram/Rigidity.lean`); the families may lie in different spaces |
| OG-06 | its action | `TauCeti.spanEquivOfInnerEq_apply` (`Gram/Rigidity.lean`) |
| OG-07 | ambient Gram rigidity in finite dimension | `TauCeti.exists_linearIsometryEquiv_of_inner_eq` (`Gram/Rigidity.lean`), for any index type; the restriction to the span of the first family is the span isometry by `TauCeti.eq_spanEquivOfInnerEq` |
| OG-08 | the Gram-matrix characterization | `TauCeti.gram_eq_iff_exists_linearIsometryEquiv` (`Gram/Rigidity.lean`), for any index type |
| OG-09 | the coordinate isometry of an orthonormal family | `Orthonormal.synthesisMapIsometry` (`Orthonormal/Family.lean`), for any finite index type, `Fin d` included (§2.1) |
| OG-10 | the coordinate formula | `Orthonormal.synthesisMapIsometry_apply` (`Orthonormal/Family.lean`) |
| OG-11 | the standard-basis action | `Orthonormal.synthesisMapIsometry_single` (`Orthonormal/Family.lean`) |
| OG-15 | reducing subspaces | `Submodule.IsReducing` (`InvariantSubspace.lean`) |
| OG-18 | completeness of projected subspaces | `Submodule.isComplete_coe_of_hasOrthogonalProjection` (`Projection/Completeness.lean`) |
| OG-19 | the orthogonal family of cyclic spans | `TauCeti.orthogonalFamily_span_singleton` (`OrthogonalFamily.lean`) |

**Mathlib.** Invariant subspaces (`Module.End.invtSubmodule`), the invariance of the orthogonal
complement of an invariant subspace of a symmetric operator
(`LinearMap.IsSymmetric.orthogonalComplement_mem_invtSubmodule`) and the symmetry of the
restriction (`LinearMap.IsSymmetric.restrict_invariant`) are Mathlib's, as are orthogonal
projections, transport between equal subspaces (`LinearIsometryEquiv.ofEq`), Gram matrices, and
orthogonal families of subspaces with finite Pythagoras and the summability criterion.

**Not here.** The overlap operator of two orthonormal families and principal angles are
PrincipalAngles Part A; reducing restrictions of partial operators are SelfAdjointSpectralTheory
Part C.

## Exact supplier contracts

### From Mathlib

- *Inner products*: `inner_smul_left` (`⟪r • x, y⟫ = conj r * ⟪x, y⟫`), `inner_smul_right`
  (`⟪x, r • y⟫ = r * ⟪x, y⟫`), `sum_inner`, `inner_sum`, `Finsupp.sum_inner`, `Finsupp.inner_sum`;
  `Finsupp.linearCombination` with `Finsupp.linearCombination_apply`; `Matrix.gram` with
  `Matrix.gram_apply`, and `Matrix.star_dotProduct_gram_mulVec` (for a finite family `v`,
  `star x ⬝ᵥ gram 𝕜 v *ᵥ y = ⟪∑ i, x i • v i, ∑ i, y i • v i⟫`).
- *Coordinates*: `EuclideanSpace`, `EuclideanSpace.single`, `EuclideanSpace.basisFun` with
  `EuclideanSpace.basisFun_apply` (`basisFun ι 𝕜 i = EuclideanSpace.single i 1`),
  `EuclideanSpace.basisFun_repr` (the coordinates of `x` in it are the `x i`) and
  `OrthonormalBasis.coe_toBasis`; `Module.Basis.constr` with `Module.Basis.constr_basis` and
  `Module.Basis.constr_apply_fintype`; `LinearMap.isometryOfOrthonormal` (a linear map sending an
  orthonormal basis to an orthonormal family, as a linear isometry) with
  `LinearMap.coe_isometryOfOrthonormal`; `Orthonormal`, `LinearIsometry`, `LinearIsometryEquiv`,
  `LinearIsometryEquiv.ofEq`.
- *Projections and invariant subspaces*: `Submodule.HasOrthogonalProjection` with the instance
  `Submodule.HasOrthogonalProjection.ofCompleteSpace` (a complete subspace has an orthogonal
  projection), `Submodule.starProjection`; `Module.End.invtSubmodule`;
  `LinearMap.IsSymmetric.orthogonalComplement_mem_invtSubmodule` (for symmetric `T`, the
  orthogonal complement of an invariant subspace is invariant) and
  `LinearMap.IsSymmetric.restrict_invariant` (the restriction of a symmetric operator to an
  invariant subspace is symmetric).
- *Orthogonal families*: `OrthogonalFamily`; `Orthonormal.orthogonalFamily` (for unit vectors
  only); `OrthogonalFamily.norm_sum` (finite Pythagoras); `OrthogonalFamily.summable_iff_norm_sq_summable`
  (for complete `E`, a family of elements of mutually orthogonal subspaces is summable iff its
  squared norms are); `Submodule.mem_span_singleton_self`; `HasSum`, `Summable`, `tsum`.

### From Tau Ceti

All the declarations below are proved at the pin; paths are under
`TauCeti/Analysis/InnerProductSpace/`.

- *Gram rigidity* (`Gram/Rigidity.lean`), in the namespace `TauCeti`, for `S : M →ₗ[𝕜] E` and
  `T : M →ₗ[𝕜] F` out of a `𝕜`-module `M` and families `v : ι → E`, `w : ι → F`:
  `ker_eq_of_inner_self_eq` (equal self inner products give equal kernels);
  `rangeEquivOfInnerEq` (from `∀ x y, ⟪S x, S y⟫ = ⟪T x, T y⟫`, a linear isometric equivalence
  `LinearMap.range S ≃ₗᵢ[𝕜] LinearMap.range T`), `rangeEquivOfInnerEq_apply` (it sends `S x` to
  `T x`) and `eq_rangeEquivOfInnerEq` (any linear isometric equivalence doing so is it);
  `spanEquivOfInnerEq` (from `∀ i j, ⟪v i, v j⟫ = ⟪w i, w j⟫`, a linear isometric equivalence of
  the spans), `spanEquivOfInnerEq_apply` (it sends `v i` to `w i`) and `eq_spanEquivOfInnerEq`
  (uniqueness); `exists_linearIsometryEquiv_of_inner_eq` (`[FiniteDimensional 𝕜 E]`, `v w : ι → E`
  with equal Gram data: some `e : E ≃ₗᵢ[𝕜] E` has `e (v i) = w i` for all `i`; `ι` arbitrary);
  `gram_eq_iff_exists_linearIsometryEquiv` (`[FiniteDimensional 𝕜 E]`:
  `Matrix.gram 𝕜 v = Matrix.gram 𝕜 w` iff such an `e` exists).
- *Coordinate isometry* (`Orthonormal/Family.lean`), for `[Fintype ι]` and `hv : Orthonormal 𝕜 v`:
  `Orthonormal.synthesisMapIsometry` (`EuclideanSpace 𝕜 ι →ₗᵢ[𝕜] E`),
  `Orthonormal.synthesisMapIsometry_apply` (`a ↦ ∑ i, a i • v i`),
  `Orthonormal.synthesisMapIsometry_single` (`EuclideanSpace.single i c ↦ c • v i`),
  `Orthonormal.range_synthesisMapIsometry` (its range is the span of `v`) and
  `Orthonormal.adjoint_synthesisMapIsometry_apply` (`[CompleteSpace E]`: the adjoint sends `y` to
  the vector with coordinates `⟪v i, y⟫`).
- *Reducing subspaces* (`InvariantSubspace.lean`): `Submodule.IsReducing`
  (`U.IsReducing A` is `U ∈ A.invtSubmodule ∧ Uᗮ ∈ A.invtSubmodule`, for `A : Module.End 𝕜 E`),
  `Submodule.isReducing_iff`, `Submodule.IsReducing.mem_invtSubmodule`,
  `Submodule.IsReducing.orthogonal_mem_invtSubmodule`, `Submodule.isReducing_orthogonal_iff`
  (`[U.HasOrthogonalProjection]`: `Uᗮ` reduces `A` iff `U` does),
  `LinearMap.IsSymmetric.isReducing_iff_mem_invtSubmodule` (for symmetric `A`, reducing iff
  invariant) and `Submodule.isReducing_iff_commute_starProjection` (`[U.HasOrthogonalProjection]`:
  reducing iff `A` commutes with the orthogonal projection onto `U`).
- *Projected subspaces* (`Projection/Completeness.lean`): `Submodule.isClosed_of_hasOrthogonalProjection`
  (a subspace with an orthogonal projection is closed, with no completeness hypothesis),
  `Submodule.isComplete_coe_of_hasOrthogonalProjection` (`[CompleteSpace E]`: it is complete),
  `Submodule.completeSpace_coe_of_hasOrthogonalProjection`, and, for complete `E`,
  `Submodule.hasOrthogonalProjection_iff_isClosed` and
  `Submodule.hasOrthogonalProjection_iff_completeSpace`.
- *Orthogonal families of vectors* (`OrthogonalFamily.lean`): `TauCeti.orthogonalFamily_span_singleton`
  (from `Pairwise fun i j ↦ ⟪v i, v j⟫_𝕜 = 0`, the lines `𝕜 ∙ v i` with their inclusions form an
  `OrthogonalFamily`; zero vectors give the zero subspace) and
  `TauCeti.norm_sum_sq_eq_sum_norm_sq_of_pairwise_inner_eq_zero` (finite Pythagoras for such a
  family).

## References

- T.-Y. Chien and S. Waldron, *A characterization of projective unitary equivalence of finite
  frames and applications*, SIAM J. Discrete Math. **30** (2016), arXiv:1312.5393: Gram rigidity
  for finite sequences of vectors, Theorem 2.2(1), pp. 4–5, and (1.1), p. 2 (Layer 1). The
  locators refer to arXiv v1 (2013), titled *A characterisation of projective unitary
  equivalence of finite frames*.
- The [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization) (Kitware,
  Inc.; Apache-2.0) contains an implementation of this material.
- The Gram-matrix material also appeared in
  [mathlib4 pull request 40567](https://github.com/leanprover-community/mathlib4/pull/40567); Tau
  Ceti exposes its range isometry as `TauCeti.rangeEquivOfInnerEq`.
