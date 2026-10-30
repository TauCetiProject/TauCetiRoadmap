# Roadmap: heights, units and S-units of number fields

**Final native audit (2026-10-30).** The [shared final audit](../CloseoutAudit-20261030.md) verifies the full owned specification on actual Tau Ceti main
[`daa66339a578`](https://github.com/TauCetiProject/TauCeti/commit/daa66339a578b8c1c41c20b94839ca25444cc1e8). All 934 entry modules built, and all sixteen acceptance probes passed with warnings treated as errors;
all 128 axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`.
The final positive compile inventory covers 117 height/unit/lattice suppliers.
The dated evidence below retains its original revision scope.

**Completion evidence, 2026-10-28.** The implementation PRs
[TauCeti#20658](https://github.com/TauCetiProject/TauCeti/pull/20658),
[TauCeti#19468](https://github.com/TauCetiProject/TauCeti/pull/19468), and
[TauCeti#20707](https://github.com/TauCetiProject/TauCeti/pull/20707) are present on upstream
`f5604a97062487140a029c405f32d8f199f2316b` and pass the fresh native-source replay.
[COMPLETION.md](COMPLETION.md) records the whole-roadmap inventory and acceptance examples.
The retained `Suggested.lean` is an admitted historical prototype, not the completion certificate.

Dirichlet's unit theorem says that the units of a number field form a lattice of rank `r₁ + r₂ − 1`
modulo torsion, and Mathlib proves it. The height of an algebraic number says how large it is
arithmetically. This roadmap writes the dictionary between the two. A unit's height is the ℓ¹ norm
of its logarithmic embedding, up to the coordinate that embedding drops. The torsion units are
exactly the units of height one. The regulator is bounded above and below by products of heights
of a fundamental system, and the lower bound is sharp enough to choose a fundamental system of
controlled height. The roadmap then carries all of this to `S`-units. It proves the `S`-unit
theorem, builds the `S`-logarithmic lattice and defines the `S`-regulator.

Two pieces of geometry of numbers are needed on the way, and both are built here. The first is a
lattice **basis** controlled by the successive minima, not merely an independent family. The
second applies it to the kernel of an integer matrix. The result is a `ℤ`-**basis** of the integral
kernel of bounded sup norm, at the cost `k!/2^{k−1}` over the Bombieri–Vaaler bound for
independent vectors, with the gcd of the maximal minors. The roadmap also owns a small set of height
estimates that every consumer of heights needs and that no other roadmap supplies:
- the affine height of a tuple,
- bounds for values of linear forms and determinants,
- the `Northcott` instances for projective points and subspaces,
- the projective form of Kronecker's theorem,
- the lower bound for the height away from one at bounded degree.

"Done" means a contributor who needs a fundamental system of units of bounded height, an
`S`-unit group of known rank with an explicit fundamental system, a lattice basis inside dilates of
a convex body, or an integer kernel basis of bounded sup norm finds each one stated in its
natural generality, with its basic API, in Mathlib's vocabulary.

Suggested home: `TauCeti/NumberTheory/Height/` for Layers 0–1, beside the height foundation of
[DiophantineApproximationAndTranscendence](../../TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md);
`TauCeti/NumberTheory/GeometryOfNumbers/` for Layer 2; `TauCeti/NumberTheory/NumberField/Units/`
for Layer 3; and `TauCeti/RingTheory/DedekindDomain/SUnit.lean` with
`TauCeti/NumberTheory/NumberField/SUnits/` for Layer 4.

## Scope and boundaries

### Owned here

- The **affine height** `Height.mulHeightAff` of a tuple over any field with admissible absolute
  values, and the bounds it makes statable: the value of a linear form and the determinant of a
  matrix. Also the Arakelov linear-map and matrix-product bounds with constant `1` (Layer 0).
- The **`Northcott` instances** for `Projectivization.mulHeight` and `Projectivization.logHeight`,
  and for the three subspace heights of DiophantineApproximationAndTranscendence with their
  logarithms. Also **Kronecker's theorem** in its absolute-height and projective forms, and the
  **height gap** at bounded degree (Layer 1).
- A **lattice basis from the successive minima**, in a general gauge form and in the form
  `b i ∈ (max 1 ((i + 1)/2) · λ_i) • K`. Also, for an integer matrix, the **gcd of the maximal
  minors** with its arithmetic identity and `GL_m(ℤ)` invariance, a **`ℤ`-basis of the integral
  kernel** of bounded sup norm, and the sharpness of Siegel's exponent (Layer 2). The sup-norm
  forms of Bombieri–Vaaler's Theorems 1 and 2 over `ℤ` are adapters of DAT's
  `siegelKernelBasis`, not owned results.
- The **heights of units**: the dictionary with Mathlib's `logEmbedding`, finiteness of units of
  bounded height, and height one ⇔ torsion. Also the **regulator against the heights of a
  fundamental system**, in both directions (Layer 3).
- The **height of an `S`-integer**, supported on `S` and the infinite places. Also the **`S`-unit
  theorem** for Mathlib's `S.unit K` with a fundamental system, the **`S`-logarithmic lattice**,
  its identification with the torsion-free quotient of the `S`-units, and the **`S`-regulator**
  with its determinant formula on any fundamental system (Layer 4).

### Consumed

- **Mathlib.** `Height.AdmissibleAbsValues`, `Height.mulHeight`, `Height.mulHeight₁`,
  `Height.logHeight`, `Height.totalWeight`, `Projectivization.mulHeight`, `Northcott`,
  `NumberField.absMulHeight₁`, `NumberField.absLogHeight₁`, `Height.mulHeight_comp_le`,
  `Height.mulHeight_fun_mul_eq`, `Height.mulHeight_linearMap_apply_le`, `mulHeight₁_sum_le`;
  `ZLattice`, `ZLattice.covolume`, `gauge`, `ConvexBody`; Dirichlet's unit theorem as
  `NumberField.Units.logEmbedding`, `unitLattice`, `fundSystem`, `torsion`, `rank`,
  `regOfFamily`, `regulator`, `closure_fundSystem_sup_torsion_eq_top`,
  `unitLattice_inter_ball_finite`, `logEmbedding_ker`; the regulator interfaces
  `regOfFamily_div_regulator` (the index of the subgroup a family generates) and
  `regulator_eq_det` (any omitted infinite place); the `S`-integers and `S`-units `S.integer K` and `S.unit K` of
  `Mathlib/RingTheory/DedekindDomain/SInteger.lean`; `NumberField.FinitePlace`; finiteness of the
  class group; `Int.Matrix.exists_ne_zero_int_vec_norm_le`.
- **Tau Ceti.** `NumberField.Units.regulator_eq_one_of_rank_eq_zero`, with
  `regulator_rat_eq_one` and `regulator_eq_one_of_isTotallyComplex_of_finrank_eq_two`
  (`TauCeti/NumberTheory/EffectiveBounds/Regulator.lean`).
- **[DiophantineApproximationAndTranscendence](../../TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md)**
  (DAT below) owns the height foundation, and every height here that it defines is its, never
  a second one:
  - §0.2: `absoluteProjectiveTupleHeight` with `absoluteProjectiveTupleHeight_eq` and
    `absMulHeight₁_eq_absoluteProjectiveTupleHeight`; `mahlerMeasure_eq_one_iff` and
    `mahlerMeasure_eq_absMulHeight₁_pow`.
  - §0.3: bounded-degree Northcott, `finite_setOf_absMulHeight₁_le`.
  - §1.3: `Matrix.mulHeight` and `Matrix.mulHeight_mul_le`; the tuple sum bound
    `Height.mulHeight_sum_comp_le` and its signed form `Height.mulHeight_sum_sign_comp_le`.
  - §2.4: `absoluteLogHeightAff`.
  - §2.5: `height2`, `arakelovMulHeight`, `arakelovMulHeight_sup_comparison`, `plucker`,
    `relativePluckerPoint`, `relativeSubspaceHeight`, `relativeSubspaceArakelovHeight`,
    `subspaceHeight`, `subspaceHeight_orthogonal`, `finite_subspaceHeight_le`.
  - §2.8: `kernelLattice_covolume`, `siegelProductBallSlice` (the cube slice has volume at least
    `2^k`), `siegelKernelBasis`, including its one-vector bounds and its `K = ℚ` sup-height
    product bound for independent kernel vectors.
  - §4.5: the identity `logHeight₁ y = Σ max(0, ℓ) = ½ Σ |ℓ|` for the full vector `ℓ` of
    weighted logarithms of a unit outside a finite `S`, over `S ∪ S_∞` (BG96 (12)).
- **[GeometryOfNumbersAndQuadraticArithmetic](https://github.com/TauCetiProject/TauCetiRoadmap/pull/851)**
  (GoN below; open roadmap proposal #851) specifies the following supplier interfaces for
  successive minima and Minkowski's second theorem:
  - §1.2.1: `successiveMin L K i`, zero-based, `i : Fin (finrank ℝ E)`, for `K : ConvexBody E`.
  - §1.2.3–1.2.11 and §1.2.12: its calculus.
  - §1.2.7: `exists_successiveMin_witnesses`.
  - §1.2.13: `exists_integral_minimum_flag`, an integral basis with the minima flags but **no
    bound on its vectors**.
  - §1.5.21: `minkowski_second_upper`, for any additive Haar measure on a finite-dimensional real
    inner-product space.

The existing implementations of these supplier interfaces are recorded in [COMPLETION.md](COMPLETION.md).
The approved [SuccessiveMinima](../../TauCetiRoadmap/SuccessiveMinima/README.md) roadmap uses the
same canonical lattice and convex-body carriers; the GoN section numbers above retain their
original proposal references.

### Not owned here

- Every definition and theorem in DAT's height foundation. That includes absolute and Arakelov
  heights, extension invariance, the Mahler-measure bridge, bounded-degree Northcott, polynomial
  and matrix heights, Plücker coordinates, the subspace heights with Cauchy–Binet, duality and
  submodularity, the number-field Siegel lemma, Bombieri–Vaaler in height form
  (`siegelKernelBasis`, `siegelRelativeKernelBasis`), cube slicing and the auxiliary polynomial.
  This roadmap consumes them.
- Successive minima, Minkowski's theorems and the integral minimum flag (GoN).
- Effective lower bounds for heights (Dobrowolski, Lehmer-type bounds) and effective lower bounds
  for the regulator. The gap of Layer 1.3 is ineffective by construction and states nothing more.
- The `S`-unit equation and its finiteness theorems (DAT, Layers 2 and 4).
- Class numbers and exact regulator values of particular fields (NumberFieldArithmetic).

## Standing hypotheses and pinned conventions

Work over a field with `[Height.AdmissibleAbsValues K]` wherever the mathematics allows. Layers 0
and 1 are stated at that generality, except where an absolute height forces characteristic zero
or a number field. Layers 3 and 4 are about a number field `K` of degree `d = [K : ℚ]`, with
`r = NumberField.Units.rank K`. Tuples are indexed by an arbitrary finite type, never by `Fin n`
alone.

| Question | Convention |
| --- | --- |
| multiplicative or logarithmic | **Both** for every owned object. The multiplicative one is primary and `logX := Real.log (mulX)`, as in Mathlib. |
| relative or absolute | **Both, distinguished by name.** Over a fixed `K`, `Height.mulHeight` is relative. The absolute height carries the `abs` prefix (`NumberField.absMulHeight₁`) or is DAT's `absoluteProjectiveTupleHeight`. Layer 3 states its regulator bounds in the **absolute logarithmic** height `h = absLogHeight₁`, as Bugeaud–Győry do, and its comparisons with `logEmbedding` in the **relative** `logHeight₁`, which is `d · h`. |
| local factor at a place | `⨆ i, v (x i)`, written out, never wrapped in a definition. |
| the affine height | `Height.mulHeightAff x := Height.mulHeight (fun o : Option ι ↦ o.elim 1 x)`, the projective height of `(1, x)`. It is **not** scaling-invariant, and that is its whole purpose. |
| `S` | `S : Set (IsDedekindDomain.HeightOneSpectrum (𝓞 K))`, **finite places only**, with the infinite places always present. These are the carriers of `S.integer K` and `S.unit K`. The rank of `S.unit K` is `r + #S`. Bombieri–Gubler 1.5.10 instead includes the archimedean places in `S` and so writes the rank as `\|S\| − 1`. A contributor reading the book translates, and every statement here is in Mathlib's convention. |
| fundamental system | A family `ε : Fin r → (𝓞 K)ˣ` with `Subgroup.closure (Set.range ε) ⊔ torsion K = ⊤`, which is what Mathlib's `closure_fundSystem_sup_torsion_eq_top` says of `fundSystem K`. |
| ℓ¹ norm on `logSpace K` | Mathlib's `‖·‖` on the `Pi` type `logSpace K` is the **supremum** norm. Every ℓ¹ norm is written as `∑ w, |x w|`, and the sup-norm forms are separate statements. |
| declaration names | Statement-named, as in Mathlib. Siegel, Bombieri–Vaaler, Kronecker, Northcott and Dirichlet appear in docstrings, never in identifiers. The exception is a name that is the standard name of an object, such as `Northcott` the typeclass. |

## The build, in layers

### Layer 0: affine heights and the value bounds

**0.1 The affine height of a tuple.** Define
`Height.mulHeightAff (x : ι → K) := Height.mulHeight fun o : Option ι ↦ o.elim 1 x`, with
`logHeightAff` alongside, over any `[Height.AdmissibleAbsValues K]` and `[Finite ι]`. Prove:
- `1 ≤ mulHeightAff x`.
- `mulHeight x ≤ mulHeightAff x` and `mulHeight₁ (x i) ≤ mulHeightAff x`. The second fails for
  `mulHeight`.
- `mulHeightAff (x ∘ f) ≤ mulHeightAff x` for any `f`, with equality for a bijection.
- `mulHeightAff 0 = 1`.
- `mulHeightAff ![x] = mulHeight₁ x`, which is the test that the appended coordinate is the right
  one.
- The non-invariance as a theorem, `exists_mulHeightAff_smul_ne`: over `ℚ`, `![1]` and `![2]` have
  affine heights `1` and `2` and the same projective height.
- The bridge to DAT: for a number field `K` and `f : K →+* AlgebraicClosure ℚ`,
  `absoluteLogHeightAff (f ∘ x) = logHeightAff x / [K : ℚ]` for `x : Fin n → K`. DAT prepends the
  `1` with `Fin.cons`, and this layer appends it with `Option.elim`; the bridge is a reindexing.
(Bombieri–Gubler 1.5.)

**0.2 Values of linear forms and determinants.** Prove:
- `mulHeight₁ (∑ i, a i * x i) ≤ #ι ^ totalWeight K · mulHeightAff a · mulHeightAff x` for
  nonempty `ι`, with its logarithmic form. No bound in the projective heights of `a` and `x`
  exists, because `a ↦ c • a` scales the value and fixes `mulHeight a`.
- `mulHeight₁ A.det ≤ (#n)! ^ totalWeight K · ∏ j, mulHeightAff (fun i ↦ A i j)`, columnwise,
  from the Leibniz expansion and DAT §1.3's signed tuple sum bound
  `Height.mulHeight_sum_sign_comp_le`. Also the corollary `mulHeight₁ A.det ≤ (#n)! ^ totalWeight K · mulHeightAff (entries A) ^ #n`.
- The rejection test `exists_not_mulHeight₁_det_le`: a `1 × 1` matrix has `Matrix.mulHeight A = 1`
  and determinant its entry.
- Sharpness: `a = x = ![1, 1]` attains the linear-form constant.

**0.3 Arakelov bounds with constant one.** Over a number field, with DAT's `arakelovMulHeight`
applied to the tuple of entries `fun p : m × n ↦ A p.1 p.2`, prove:
- `arakelovMulHeight (fun j ↦ ∑ i, A (j, i) * x i) ≤ arakelovMulHeight A · arakelovMulHeight x`.
- `arakelovMulHeight (entries (A * B)) ≤ arakelovMulHeight (entries A) · arakelovMulHeight (entries B)`.
- Their logarithmic forms.

These need no `Nonempty` hypothesis and carry no cardinality. That is the contrast with DAT's
`Matrix.mulHeight_mul_le`, whose constant is `(card n) ^ totalWeight K` and which needs a nonempty
inner index. At an infinite place the local factor is the Frobenius norm, and Cauchy–Schwarz makes
it submultiplicative; at a finite place the ultrametric inequality does the same. The
linear-map bound is the one-column case of the matrix bound. Test: over `ℚ`, `A = [1 1]`,
`B = [[1, 0], [1, 1]]` give `Matrix.mulHeight (A B) = 2` against `Matrix.mulHeight A = Matrix.mulHeight B = 1`,
so the sup-norm constant `2 ^ totalWeight K` is attained, while the Arakelov bound holds with
constant `1`.

### Layer 1: Northcott instances and Kronecker's theorem

**1.1 Northcott on projective space.** Over a field with
`[Northcott (Height.mulHeight₁ (K := K))]`, prove `Northcott (Projectivization.mulHeight (K := K) (ι := ι))`
and the `logHeight` instance. Mathlib's `Mathlib/NumberTheory/Height/Northcott.lean` records both
as TODOs. The number-field instances then follow by instance resolution. Route:
- **Normalization.** `Projectivization.exists_rep_apply_eq_one_of_ne_zero` gives a representative
  with a chosen nonvanishing coordinate equal to `1`, and `exists_rep_apply_eq_one` is its
  corollary.
- **Coordinate bound.** `Height.mulHeight₁_div_le_mulHeight`, that
  `mulHeight₁ (x i / x j) ≤ mulHeight x`, is `Height.mulHeight_comp_le` along `![i, j]`.
- **Finiteness.** A bounded-height point is in the image of a finite set of normalized tuples.
  No ring of integers and no ideal norm enter.

There is **no** `Northcott` instance for `Height.mulHeight` on `ι → K`: the whole line `Kˣ • x` has
one height. (Hindry–Silverman B.2.3; Bombieri–Gubler 2.4.9 for `ℙⁿ`.)

**1.2 Northcott for subspaces.** Over a number field, `Northcott` instances for DAT's
`relativeSubspaceHeight`, `relativeSubspaceArakelovHeight` and `subspaceHeight`, and for their
logarithms, on `Submodule K (ι → K)` with **no rank condition**. Route:
- **Absolute height.** For `subspaceHeight` this is DAT's `finite_subspaceHeight_le`.
- **Relative Arakelov height.** `relativeSubspaceArakelovHeight = subspaceHeight ^ [K : ℚ]`, so
  its sublevel sets are those of `subspaceHeight`.
- **Relative sup height.** This needs the **reverse** comparison, because a bound on the smaller
  height must bound the larger one. Prove `relativeSubspaceArakelovHeight_le`: for
  `n = #ι` and `k = finrank K T`,
  `relativeSubspaceArakelovHeight T ≤ (n.choose k) ^ ([K : ℚ]/2) · relativeSubspaceHeight T`.
  It is the upper half of DAT's `arakelovMulHeight_sup_comparison` on the Plücker vector, whose
  index `Set.powersetCard ι k` has `n.choose k` elements and is nonempty because `k ≤ n`. Both
  heights are invariant under scaling, so the representative `relativePluckerPoint` picks does
  not matter. Bound `n.choose k ≤ 2 ^ n` uniformly. Then
  `{T | relativeSubspaceHeight T ≤ B}` lies inside
  `{T | relativeSubspaceArakelovHeight T ≤ 2 ^ (n [K : ℚ]/2) · B}`, which is finite by the
  previous item.
- **Logarithms.** These follow by `Northcott.comp_of_bddAbove` along `Real.log`, as Mathlib
  derives `Northcott (logHeight₁)`.

The rank-free statement is what the typeclass needs, because `Northcott h` quantifies over the
whole domain of `h`. The deliverable is the instance, through which `Northcott.exists_min_image`
produces a subspace of least height with a prescribed property.

**1.3 Kronecker's theorem and the height gap.** Over a field `F` of characteristic zero:
- **Kronecker.** For `x` integral over `ℚ`, `absMulHeight₁ x = 1 ↔ x = 0 ∨ ∃ n, 0 < n ∧ x ^ n = 1`,
  and `absLogHeight₁ x = 0 ↔ …`. The hard direction is DAT's `mahlerMeasure_eq_one_iff` through
  `mahlerMeasure_eq_absMulHeight₁_pow`. The easy direction is the power law
  `absMulHeight₁ (x ^ n) = absMulHeight₁ x ^ n` with `1 ≤ absMulHeight₁`.
- **Tuple power law.** `absoluteProjectiveTupleHeight (fun i ↦ x i ^ N) = absoluteProjectiveTupleHeight x ^ N`.
  It is local: `(⨆ i, v (x i))^N = ⨆ i, v (x i ^ N)`.
- **Projective Kronecker.** For a nonzero tuple `x` of algebraic coordinates,
  `absoluteProjectiveTupleHeight x = 1` if and only if every ratio `x i / x j` with `x j ≠ 0` is
  zero or a root of unity. The converse direction is a statement about tuples,
  `absoluteProjectiveTupleHeight_eq_one_of_forall_eq_zero_or_pow_eq_one`. Its proof: with `N` a
  common order of the nonzero coordinates, `x ^ N` has coordinates in `{0, 1}`, so it is its own
  square, and its height is an idempotent `≥ 1`. (Hindry–Silverman B.2.3.1.)
- **The gap.** `1 < absMulHeight₁ x` for `x` integral over `ℚ`, nonzero and not a root of unity.
  Also, for each `D`, `∃ c > 0` with `c ≤ absLogHeight₁ x` for every such `x` with
  `[ℚ⟮x⟯ : ℚ] ≤ D`. The proof is DAT's bounded-degree Northcott plus Kronecker, and the constant
  is **ineffective**: it is the minimum of a finite set. (Bombieri–Gubler 1.6.15.)
- **Refutation.** The dependence of `c` on `D` is essential: `2 ^ (1/N)` has
  `absLogHeight₁ = (log 2)/N`. State it as "for every `c > 0` there is such an `x` with height
  below `c`". The same family keeps `[ℚ(x):ℚ] · h(x) ≤ log 2`, so it does not bear on Lehmer's
  question.

### Layer 2: a basis from the minima, and Bombieri–Vaaler in the sup norm

**2.1 A basis from the minima** (Cassels, *An Introduction to the Geometry of Numbers*, Ch. V,
Lemma 8; Ch. I, Thm. I). Let `E` be a finite-dimensional real normed space, `L` a discrete
`Submodule ℤ E` and `B` a convex, symmetric set with nonempty interior.

*General form.* For any `ℝ`-independent `a : Fin n → E` with `a i ∈ L` and `n = finrank ℝ E`,
there is a `ℤ`-basis `b` of `L` with
`gauge B (b j) ≤ max (gauge B (a j)) ((∑ i ≤ j, gauge B (a i)) / 2)`. `IsZLattice ℝ L` is a
consequence, not a hypothesis. Route, by induction on `j`, with `V_j = span_ℝ {a i : i < j}`:
1. A basis of `L ∩ V_j` extends by one vector `y` to a basis of `L ∩ V_{j+1}`. This is GoN's
   §0.2.7 `saturated_adapted_basis_of_basis`, applied inside `V_{j+1}`.
2. Write `a j = c • y + w` with `c` a nonzero integer and `w ∈ L ∩ V_j`.
3. If `|c| = 1`, take `b j = c · a j`.
4. Otherwise replace `y` by `y − ∑ round(t_i) • a i`, where `y = c⁻¹ • a j + ∑ t_i • a i`. The
   result still extends the basis, and has gauge at most `½ gauge B (a j) + ½ ∑_{i<j} gauge B (a i)`.

The proof uses `gauge B (r • x) = |r| · gauge B x` for symmetric convex `B`, stated as
`gauge_smul_of_symmetric`. Over `ℝ` a convex symmetric set is balanced: for `x ∈ B` and
`|t| ≤ 1`, `t • x` lies on the segment from `-x` to `x`. Mathlib has no lemma saying so, so state
it as `balanced_of_convex_of_neg_mem`; then `gauge_smul_of_symmetric` is Mathlib's `gauge_smul`.

*Minima form.* In GoN's vocabulary: for `K : ConvexBody E` symmetric with `0 ∈ interior K` and `L`
a full lattice, there is a `ℤ`-basis `b` of `L` with
`b i ∈ (max 1 ((i + 1)/2) · successiveMin L K i) • K` for every `i : Fin (finrank ℝ E)`. Apply the
general form to GoN's `exists_successiveMin_witnesses`. This is strictly more than GoN's
`exists_integral_minimum_flag`, which bounds no vector of the basis.

Further requirements:
- The loss against Minkowski's second theorem is
  `∏_{i<n} max 1 ((i+1)/2) = n! / 2^{n−1}`. State it as `prod_max_one_add_one_div_two`.
- The `max` is forced at `i = 0`, where `λ_0` is attained.
- The general form needs no measure, no closedness and no boundedness. Those enter only in the
  minima form.

**2.2 Integral kernel bases and the minor gcd** (Bombieri–Vaaler 1983, Theorems 1 and 2;
Aliev–Henk 2023, §6; Cassels V Lemma 8). For an integer matrix `A : Matrix (Fin m) ι ℤ` whose rows
are linearly independent over `ℚ`, let `minorGcd A` be the gcd of its `m × m` minors, and let
`k = #ι − m` be the rank of the integral kernel `ker A = {x : ι → ℤ | A *ᵥ x = 0}`.

*Owned here.*
- **The arithmetic identity.**
  `minorGcd A · subspaceHeight (ker A) = √det(A Aᵀ)`, together with
  `linearIndependent_rows_rat_iff : rows independent over ℚ ↔ det(A Aᵀ) ≠ 0`, `0 < det(A Aᵀ)`
  and `1 ≤ minorGcd A`. This turns DAT §2.8's remark on the `K = ℚ` constant into a theorem.
- **Invariance.** `√det(A Aᵀ) / minorGcd A` is unchanged by `A ↦ U A` for `U ∈ GL_m(ℤ)`
  (`sqrt_det_div_minorGcd_unit_mul`, from `minorGcd_unit_mul` and the Gram determinant's
  `det U ^ 2 = 1`). Classical Siegel's bound `(#ι · max |A i j|)^{m/(#ι−m)}` moves under this
  substitution.
- **The geometric half.** For any lattice `L` in a subspace `V` of `EuclideanSpace ℝ ι`, with
  `cubeSlice V` the slice of `[−1, 1]^ι`, `∏ i, successiveMin L (cubeSlice V) i ≤ covolume L`.
  The `2^k` of GoN's `minkowski_second_upper` cancels the `2^k` of DAT's `siegelProductBallSlice`.
- **An integral kernel basis.** A `Module.Basis (Fin k) ℤ (ker A)`, so a basis of the whole
  integral kernel and not only of a sublattice of finite index, with
  `∏ l, (⨆ i, |b l i|) ≤ k!/2^{k−1} · √det(A Aᵀ) / minorGcd A`. At `k = 0` both sides are `1`.
- **Sharpness of Siegel's exponent.** The `m × (m+1)` system `B x_i = x_{i+1}` has every nonzero
  integer solution of sup norm at least `B^m`, against Siegel's bound `((m+1)B)^m`.

Assembly of the basis:
1. The covolume of `ℤ^ι ∩ ker A` in its real span equals `subspaceHeight (ker A)`. This is the
   `K = ℚ` case of DAT's `kernelLattice_covolume`.
2. The arithmetic identity rewrites it as `√det(A Aᵀ) / minorGcd A`. Its proof is DAT's
   `subspaceHeight_orthogonal`, which passes to the row space, and `plucker_cauchyBinet`, which
   computes the rows' Plücker norm as `√det(A Aᵀ)`.
3. The geometric half bounds the product of the minima of the cube slice by that covolume.
4. The minima form of 2.1 converts the minima into a basis. The cube slice's gauge is the sup
   norm, and the loss is `prod_max_one_add_one_div_two k = k!/2^{k−1}`.

*Adapters of DAT's `siegelKernelBasis`, not owned.* At `K = ℚ` DAT's theorem gives a `ℚ`-basis of
the kernel in `ℤ^ι` with `∏ Habs(x_l) ≤ H₂(rowSpace A)`. Dividing each vector by its content keeps
it in the kernel, keeps the family independent, and makes its sup norm equal to its height
(Mathlib's `Rat.mulHeight_eq_max_abs_of_gcd_eq_one`). With the arithmetic identity this is the
sup-norm form of Bombieri–Vaaler's Theorem 2: `ℤ`-independent `x : Fin k → (ι → ℤ)`, each primitive, with
`A *ᵥ x l = 0` and `∏ l, (⨆ i, |x l i|) ≤ √det(A Aᵀ) / minorGcd A`. Theorem 1 is the smallest
vector of that family: for `m < #ι` a nonzero `x` with
`⨆ i, |x i| ≤ (√det(A Aᵀ) / minorGcd A)^{1/k}`. State both as corollaries.

The independent family need **not** span `ker A`. For `A = [0, 0, 1]`, the vectors
`(1, 1, 0)` and `(1, −1, 0)` meet the bound `1`, but they span a sublattice of index `2` that misses
`(1, 0, 0)`. The basis milestone is therefore a separate statement, and its factor `k!/2^{k−1}` is
not to be dropped.

### Layer 3: heights of units and the regulator

Throughout, `K` is a number field, `w₀` and `logEmbedding` are Mathlib's
(`NumberField.Units.dirichletUnitTheorem`), and `u : (𝓞 K)ˣ`. Sums over `{w // w ≠ w₀}` use
`open scoped Classical`, since `InfinitePlace K` has no `DecidableEq`.

**3.1 The logarithmic embedding as a height** (Bombieri–Gubler 1.5.12; Bugeaud–Győry 1996, (12)).
The finite local factors of a unit are `1`, so:
- `logHeight₁ u = ∑ w, (mult w · log (w u))⁺`, the sum over all infinite places, which by the
  product formula is
- `2 · logHeight₁ u = ∑ w, |mult w · log (w u)|`.

These are the `S = ∅` case of DAT §4.5's identity and are cited from there. What this milestone
owns is the translation to `logEmbedding`, which drops the coordinate at `w₀`:
- `2 · logHeight₁ u = ∑_{w ≠ w₀} |logEmbedding u w| + |∑_{w ≠ w₀} logEmbedding u w|`.
- The two-sided bound `∑_{w ≠ w₀} |logEmbedding u w| ≤ 2 · logHeight₁ u ≤ 2 ∑_{w ≠ w₀} |logEmbedding u w|`.
- The sup-norm forms `‖logEmbedding u‖ ≤ 2 · logHeight₁ u` and
  `logHeight₁ u ≤ rank K · ‖logEmbedding u‖`.
- The absolute form `absLogHeight₁ u ≤ (∑_{w ≠ w₀} |logEmbedding u w|) / d`.
- Both tempting identities, as criteria. `logHeight₁ u = ∑_{w ≠ w₀} (logEmbedding u w)⁺` holds
  **iff `w₀ u ≤ 1`**, and `2 · logHeight₁ u = ∑_{w ≠ w₀} |logEmbedding u w|` holds **iff
  `w₀ u = 1`**.
- `finite_setOf_logHeight₁_le`: the units of bounded height are finite. This is Northcott along
  `(𝓞 K)ˣ → K`.

**3.2 Units of height one.**
- `absMulHeight₁ u = 1 ↔ u ∈ torsion K`, with the `mulHeight₁`, `logHeight₁` and `absLogHeight₁`
  forms. From 3.1, `2 · logHeight₁ u` is a sum of nonnegative terms and vanishes exactly when
  every `w u = 1`, which is Mathlib's `mem_torsion`.
- `logHeight₁ u = 0 ↔ logEmbedding u = 0`.
- Kronecker (1.3) removes the unit hypothesis: a nonzero `x : 𝓞 K` has `absMulHeight₁ x = 1` iff
  it has finite order. Such an `x` is a unit.
- Off the torsion the height is strictly above one, and no member of `fundSystem K` is torsion.
  Hence `0 < ∏ i, absLogHeight₁ (fundSystem K i)`.

**3.3 The regulator and the heights of a fundamental system** (Bugeaud–Győry 1996, Lemma 1, case
`S = S_∞`). Write `h = absLogHeight₁`.
- *Hadamard's bound, for every fundamental system* `ε`:
  `regulator K ≤ (2d)^r · ∏ i, h(ε i)`. Also `regOfFamily u ≤ (2d)^r · ∏ h(u i)` for any family,
  and the relative form `regulator K ≤ 2^r · ∏ logHeight₁ (ε i)`. Route: the rows of the
  `logEmbedding` matrix have ℓ¹ norm at most `2 · logHeight₁ = 2d · h` by 3.1, and
  `Matrix.abs_det_le_prod_sum_abs` bounds `|det M|` by the product of the ℓ¹ norms of the rows,
  over any linearly ordered field. For a fundamental system `regOfFamily ε = regulator K` is
  Mathlib's `regOfFamily_div_regulator` at index one. Also prove the positivity of `∏ h(ε i)` for
  every fundamental system.
- *A reduced fundamental system exists*: some fundamental system has
  `∏ i, h(ε i) ≤ (r!)² / (2^{r−1} d^r) · regulator K`, and it can be chosen to satisfy Hadamard's
  bound simultaneously. Route, which is Bugeaud–Győry's and produces exactly this constant:
  1. Let `logBall K = {x : logSpace K | ∑ w, |x w| ≤ 1}`. It is convex, symmetric, closed and
     bounded, and `volume (logBall K) = 2^r / r!` (`MeasureTheory.volume_sum_rpow_le` at `p = 1`;
     by hand at `r = 0`).
  2. Minkowski's upper bound gives `∏ λ_i ≤ r! · regulator K`. `logSpace K` carries the sup norm
     and is not an inner-product space, so state the adapter: transport `unitLattice K` and
     `logBall K` to `EuclideanSpace ℝ {w // w ≠ w₀}` along `WithLp.linearEquiv`. That map preserves
     volume, so it preserves the covolume (`ZLattice.covolume_comap`), and the minima are preserved
     by GoN's `successiveMin_linearEquiv`. Then apply GoN's `minkowski_second_upper`.
  3. Take the basis `b` of 2.1, which costs `r!/2^{r−1}`.
  4. Take units `ε i` with `logEmbedding ε i = b i`. They form a fundamental system because `b`
     spans `unitLattice K`, the whole image of `logEmbedding`
     (`closure_sup_torsion_eq_top_of_span`).
  5. Bound `h(ε i) ≤ (∑ w, |b i w|)/d` by 3.1.
- *Rank zero, as a check.* Both products are empty, and the two bounds agree with Tau Ceti's
  `NumberField.Units.regulator_eq_one_of_rank_eq_zero`, which is consumed and not reproved.

The reduced statement is existential and cannot be made for `fundSystem K` or for every fundamental
system once `r ≥ 2`: a unimodular change of basis then makes the heights arbitrarily large at fixed
regulator. In rank one `GL₁(ℤ) = {±1}`: the fundamental systems are `ζ ε^{±1}` with `ζ` torsion, and they
all have the same height. The
statement `∃ c₁ c₂ > 0, c₁ R ≤ ∏ h(ε_i) ≤ c₂ R` for a fixed field says nothing, so the constants
are part of the target.

### Layer 4: S-integers, the S-unit theorem and the S-regulator

**4.1 The height of an S-integer** (Bombieri–Gubler 1.5.10).
- *Dictionary.* For `v : HeightOneSpectrum (𝓞 K)` and `x : K`, `FinitePlace.mk v x ≤ 1 ↔
  v.valuation K x ≤ 1` and `FinitePlace.mk v x = 1 ↔ v.valuation K x = 1`. These are
  equivalences because the norm of a prime exceeds `1`. Consequently
  `Set.mem_integer_iff_finitePlace` and `Set.mem_unit_iff_finitePlace`.
- *Height identity.* For `x ∈ S.integer K`,
  `mulHeight₁ x = (∏ w : InfinitePlace K, max (w x) 1 ^ mult w) · ∏ᶠ v ∈ S, max (FinitePlace.mk v x) 1`.
  Also its logarithmic form, a `Finset` form, and the `S`-unit form derived in one line.
- *Characterization.* For `x ≠ 0`, the identity holds **iff** `x ∈ S.integer K`. A single finite
  place outside `S` where `|x|_v > 1` makes the full product strictly larger.
- *The case `S = ∅`.* `Set.mem_integer_empty_iff` (the algebraic integers) and
  `Set.mem_unit_empty_iff` (the units of `𝓞 K`), proved directly, so that the unit identity of
  3.1 is the `S = ∅` case of the display.
- *Tests.* The rational test is DAT §4.1's `mulHeight₁_sUnits_rat`. The rejection test is `1/2` at
  `S = ∅`: its infinite factor is `1` while its height is `2^d`.

**4.2 The S-unit theorem** (Bombieri–Gubler Theorem 1.5.13). Build it under the names and shapes
of mathlib4#40791, so that adopting that PR is a deletion plus an import:
- `Set.unitValuation : S.unit K →* (S → Multiplicative ℤ)`, `unitValuation_ker`, and
  `Set.unit_fg`.
- `Set.unit_finrank_numberField : finrank ℤ (Additive (S.unit K)) = Units.rank K + Nat.card S`
  for finite `S`.
- Beside it, the usable form in the shape of Mathlib's `exist_unique_eq_mul_prod`: a family
  `ε : Fin (rank K + #S) → S.unit K` such that every `S`-unit is uniquely `ζ · ∏ ε i ^ e i` with
  `ζ` torsion and `e` an integer vector.

Route:
1. The kernel of `unitValuation` is the image of `(𝓞 K)ˣ`, by 4.1's `S = ∅` statement. Its rank
   is Mathlib's `NumberField.Units.finrank_eq`.
2. The image has full rank `#S`. For each `v ∈ S`, the class of `v` has finite order in
   `ClassGroup (𝓞 K)`, and a generator of `v ^ orderOf [v]` is an `S`-unit with valuation nonzero
   at `v` and zero at the other places of `S` (`Set.exists_unitValuation_apply_ne_zero`). Only
   this torsion statement about the cokernel is needed. The class number is never computed and no
   map to the class group is built.
3. Rank–nullity over `ℤ`.

Build the fundamental system from the quotient of the `ℤ`-module `Additive (S.unit K)` by
`Submodule.torsion ℤ`, which is free, rather than from a quotient group.

**4.3 The S-logarithmic lattice and the S-regulator.** For a finite `S : Finset (HeightOneSpectrum (𝓞 K))`:
- Define `SUnit.logSpace S := ({w : InfinitePlace K // w ≠ w₀} ⊕ S) → ℝ`, and
  `SUnit.logEmbedding S` sending `x` to `mult w · log (w x)` on the left and
  `log (FinitePlace.mk v x)` on the right.
- Prove the product formula for `S`-units,
  `∑ w, mult w · log (w x) + ∑ v ∈ S, log (FinitePlace.mk v x) = 0`.
- Prove the `S`-analogue of 3.1 in `logEmbedding` coordinates:
  `2 · logHeight₁ x = ∑ |logEmbedding S x| + |∑ logEmbedding S x|`, with the two-sided and
  sup-norm comparisons. The rejection test `x = 2` at `S = ∅` is an `∅`-integer but not an
  `∅`-unit, and its sum is `d · log 2`.
- `logEmbedding S (unitOfUnits u) = Sum.elim (logEmbedding u) 0`.
- Define `SUnit.unitLattice S`, the image. Prove it is a **full lattice**:
  - **Discreteness** is Northcott: a bounded embedding is a bounded height by 4.1, and Mathlib's
    `NumberField.finite_setOfPred_logHeight₁_le` finishes (`SUnit.unitLattice_inter_ball_finite`).
  - **Spanning** is Mathlib's `unitLattice_span_eq_top` for the infinite coordinates together with
    the generators of 4.2 at the places of `S` (`SUnit.unitLattice_span_eq_top`).
- **The kernel.** `SUnit.logEmbedding_ker`: the kernel of `SUnit.logEmbedding S` is the torsion
  of `S.unit K`, as `(CommGroup.torsion (S.unit K)).toAddSubgroup`, the `S`-analogue of Mathlib's
  `logEmbedding_ker`. Route: if the kept coordinates vanish, the product formula makes the
  coordinate at `w₀` vanish too, so `logHeight₁ x = 0` by the height identity above, and
  Kronecker (1.3) makes `x` a root of unity. Equivalently, the kernel is the set of `S`-units of
  height one.
- **The quotient.** By the first isomorphism theorem, `SUnit.logEmbedding S` induces a `ℤ`-linear
  equivalence from the torsion-free quotient
  `Additive (S.unit K) ⧸ Submodule.torsion ℤ (Additive (S.unit K))` onto
  `SUnit.unitLattice S` (`SUnit.exists_quotTorsionEquiv_unitLattice`, sending the class of `x`
  to `logEmbedding S x`). It is the bridge from 4.2's quotient to 4.3's lattice.
- **Fundamental systems are bases.** A family `ε : ι → S.unit K` is a fundamental system, meaning
  `Subgroup.closure (Set.range ε) ⊔ CommGroup.torsion (S.unit K) = ⊤` with
  `#ι = rank K + #S`, **iff** `fun i ↦ logEmbedding S (Additive.ofMul (ε i))` is a `ℤ`-basis of
  `SUnit.unitLattice S` (`SUnit.isFundSystem_iff_basis`). The forward direction transports
  generation along the quotient equivalence. The converse lifts a basis to `S`-units and uses
  the kernel statement. In particular 4.2's fundamental system gives a basis.
- Define `SUnit.regulator S := ZLattice.covolume (SUnit.unitLattice S)` and prove
  `SUnit.regulator_pos`.
- **The determinant formula.** For a fundamental system `ε : ι → S.unit K`, an omitted infinite
  place `w'` and any `e : ι ≃ ({w // w ≠ w'} ⊕ S)`, `SUnit.regulator S` is the absolute
  determinant of the matrix whose row `i` is the weighted logarithms of `ε i` at the places
  `e`-indexed by its columns: `mult w · log (w (ε i))` at an infinite place and
  `log (FinitePlace.mk v (ε i))` at `v ∈ S` (`SUnit.regulator_eq_abs_det`). The generic `ι` and
  `e` carry the compatibility with reindexing. Independence of the basis is the
  `GL(ℤ)` invariance of `|det|`. Independence of `w'` is the product formula, which makes the
  columns sum to zero, so deleting any one column gives the same `|det|`. This is the
  `S`-analogue of Mathlib's `regulator_eq_det`, and it is how `regulator_empty` and the worked
  example are computed.
- Prove `SUnit.regulator_empty : SUnit.regulator ∅ = NumberField.Units.regulator K`. This is a
  theorem, not a definitional unfolding: `α ⊕ Empty` is not `α`. Transport the covolume along the
  measure-preserving linear equivalence of the two log spaces.
- **Rank.** `finrank ℤ (SUnit.unitLattice S) = rank K + #S`, from `ZLattice.rank`. Through the
  quotient equivalence, and because quotienting by torsion keeps the `ℤ`-rank, this is 4.2's
  `Set.unit_finrank_numberField`. The two routes must agree. `ZLattice.rank` alone computes only
  the rank of the image. The quotient equivalence is what makes it a statement about `S.unit K`.

## Worked examples (acceptance criteria)

- **Affine height.** `mulHeightAff ![1] = 1` and `mulHeightAff ![2] = 2` over `ℚ`, while
  `mulHeight ![1] = mulHeight ![2] = 1`.
- **Value bound.** Over `ℚ`, `a = x = ![1, 1]` gives `mulHeight₁ 2 = 2 = 2 ^ totalWeight ℚ · 1 · 1`.
- **Kronecker.** `absMulHeight₁ (-1 : ℚ) = 1`, `absMulHeight₁ (2 : ℚ) = 2`; the tuple
  `![1, -1]` has `absoluteProjectiveTupleHeight = 1` and `![1, 2]` has `2`.
- **Gap.** For every `c > 0` some `2 ^ (1/N)` has `absLogHeight₁` below `c`.
- **Basis from the minima.** For `L = ℤ⁵ + ℤ·(½,…,½)` and `K` the Euclidean unit ball, every
  minimum is `1`, attained by `e_0, …, e_4`, which span `ℤ⁵`, a sublattice of index `2`. So the
  minima witnesses are not a basis. 2.1 still produces a basis inside the bounds
  `max 1 ((i+1)/2)`, using `(½,…,½)`, of norm `√5/2 ≤ 5/2`, as its last vector.
- **Minor gcd.** The row `[1, 1]` has `det(AAᵀ) = 2`, `minorGcd = 1`, kernel generator
  `(1, −1)` of sup norm `1 ≤ √2`. The row `[2, 2]` has `det = 8`, `minorGcd = 2` and the same bound
  `√2`. This tests rational rescaling of a row, not a unimodular change.
- **Unimodular shear.** `A = [[1, 0, −1], [0, 1, −1]]` has Gram determinant `3`, minors `1, −1, 1`
  and `minorGcd = 1`, so the bound is `√3`. The kernel is generated by `(1, 1, 1)`, of sup norm `1`.
  The shear `U = [[1, 1], [0, 1]]` gives `U A = [[1, 1, −2], [0, 1, −1]]`, again with Gram
  determinant `3` and minors `1, −1, 1`. Classical Siegel's bound moves from `3^2 = 9` to
  `6^2 = 36`.
- **Independent family against basis.** For `A = [0, 0, 1]`, `(1, 1, 0)` and `(1, −1, 0)` meet
  the bound `1` and span a sublattice of index `2` in `ker A = ℤ² × 0`. The basis milestone
  returns `(1, 0, 0), (0, 1, 0)`, inside its bound `2!/2 · 1 = 1`.
- **Regulator, sharp at `ℚ(√2)`.** `r = 1`, `d = 2`, `ε = 1 + √2`, and
  `regulator = log(1+√2)` by Mathlib's `regulator_eq_det` at rank one,
  `h(ε) = log(1+√2)/2`. Hadamard: `log(1+√2) ≤ 4 · log(1+√2)/2`. Reduced:
  `log(1+√2)/2 ≤ (1/2) · log(1+√2)`, an **equality**, so the constant `(r!)²/(2^{r−1} d^r)` cannot
  be lowered at `r = 1, d = 2`.
- **Rank zero.** For `ℚ` and every imaginary quadratic field, both bounds of 3.3 have empty
  products and agree with Tau Ceti's `regulator_rat_eq_one` and
  `regulator_eq_one_of_isTotallyComplex_of_finrank_eq_two`.
- **S-units over `ℚ`.** `S = {2}`: rank `0 + 1 = 1`, fundamental system `{2}`, torsion `{±1}`,
  `SUnit.regulator S = log 2` by the determinant formula: the `1 × 1` matrix at the place `2`
  is `log |2|_2 = −log 2`. The element `1/2` is in `S.unit ℚ`, and its height `2` is carried at
  `2`.

## Ordering

Layer 0 first: 0.1 is used by 0.2, which also uses DAT §1.3's tuple sum bound. Layer 1 needs
only Layer 0's normalization lemmas and DAT §§0.2–0.3, 2.5. Layer 2 needs GoN §§0.2, 1.2, 1.5 and
DAT §§2.5, 2.8; its 2.1 is the input to 2.2's basis and to 3.3. Layer 3: 3.1, then 3.2 (which
also uses 1.3), then 3.3 (which uses 2.1). Layer 4: 4.1 needs nothing from Layer 3 except 3.1's
`S = ∅` identity as a check; 4.2 needs 4.1; 4.3 needs 4.1, 4.2, 3.1 and Kronecker (1.3). The
headline milestones are 3.3, 4.2 and 4.3.

## Relationship to Mathlib

- `Mathlib/NumberTheory/Height/` is the substrate, and every height here is defined from
  `Height.mulHeight` through DAT.
- mathlib4#40791 (Dirichlet's `S`-unit theorem) covers 4.2's rank statement. 4.2 is built here
  under that PR's names and shapes, so that if it lands the Tau Ceti version is deleted and
  Mathlib's adopted.
- `Mathlib/NumberTheory/Height/Northcott.lean` lists the projective instances of 1.1 as TODOs.

## Provenance

Secondary to everything above: the milestones are the specification. The milestones have
sorry-free implementations in
[`rwst/Subspace-Theorems` at `e443c24`](https://github.com/rwst/Subspace-Theorems/tree/e443c2479e19f7665b31d8e94e2317c8ced1ca06/ArithmeticHeights),
directory `ArithmeticHeights/`, Apache 2.0, by the author of this roadmap. Two groups are
exceptions and have none: the integral kernel basis of 2.2, and the kernel, quotient,
fundamental-system and determinant statements of 4.3. That code was written against a private
height layer that predates DAT's, so a port restates each statement in DAT's vocabulary rather
than copying it.

| Milestone | Source file |
| --- | --- |
| 0.1 | `Affine.lean` |
| 0.2, 0.3 | `LinearForm.lean`, `Matrix.lean` |
| 1.1 | `Northcott.lean` |
| 1.2 | `NorthcottSubspace.lean` |
| 1.3 | `Kronecker.lean`, `LowerBound.lean` |
| 2.1 | `AdaptedBasis.lean`, `MinimaBasis.lean` |
| 2.2 | `BombieriVaaler.lean`, `Siegel.lean` (sharpness witness) |
| 3.1 | `UnitHeight.lean` |
| 3.2 | `UnitTorsion.lean` |
| 3.3 | `Regulator.lean`, `Hadamard.lean` (`Matrix.abs_det_le_prod_sum_abs`) |
| 4.1 | `SUnit.lean` |
| 4.2 | `SUnitTheorem.lean` |
| 4.3 | `SRegulator.lean` |

## References

- E. Bombieri and W. Gubler, *Heights in Diophantine Geometry*, Cambridge University Press, 2006.
  §1.5 (Kronecker 1.5.9, `S`-units 1.5.10–1.5.13, Segre 1.5.14, sum bound 1.5.15), §1.6
  (1.6.15, the gap), §2.4 (Northcott on `ℙⁿ`).
- M. Hindry and J. H. Silverman, *Diophantine Geometry: An Introduction*, GTM 201, Springer, 2000.
  Theorem B.2.3 and Corollary B.2.3.1.
- E. Bombieri and J. Vaaler, "On Siegel's lemma", *Invent. Math.* **73** (1983), 11–32.
  Theorems 1 and 2.
- I. Aliev and M. Henk, "Minkowski's successive minima in convex and discrete geometry",
  *Commun. Math.* **31** (2023), no. 2, 35–59. §6, the adele-free assembly of 2.2.
- J. W. S. Cassels, *An Introduction to the Geometry of Numbers*, Springer, 1959. Ch. I Thm. I
  (adapted bases) and Ch. V Lemma 8 (p. 135, the basis from the minima).
- Y. Bugeaud and K. Győry, "Bounds for the solutions of unit equations", *Acta Arith.* **74**
  (1996), 67–80. §3, Lemma 1 and formula (12).
