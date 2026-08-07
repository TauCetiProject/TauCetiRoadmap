# Operator ideals: approximation numbers, symmetric ideals, and Hilbert–Schmidt structure

Singular values do not stop at finite dimension. For a bounded operator between normed
spaces their natural continuation is the sequence of **approximation numbers**

```text
aₙ(T) = inf { ‖T − R‖ : rank R ≤ n },
```

the operator-norm distances to the ranks. On finite-dimensional Hilbert spaces these *are*
the singular values (Eckart–Young); in infinite dimensions they are the prototype
**s-numbers** (Pietsch), and the gauges of the sequence `n ↦ aₙ(T)` — Ky Fan partial sums,
`ℓᵖ` sums, the supremum — carve the bounded operators into the classical **symmetric
operator ideals**: the finite-rank-approximable operators, the Schatten classes, trace
class, Hilbert–Schmidt.

Mathlib has the static functional-analysis stack — `ContinuousLinearMap`, operator norms and
adjoints, `LinearMap.rank`, finite-dimensional `LinearMap.singularValues`, the continuous
functional calculus, `IsCompactOperator`, the `lp` spaces — but none of the s-number layer:
no approximation numbers, no object over which a theorem can be stated once for "an
arbitrary symmetric ideal norm", and no Schatten, trace-class or Hilbert–Schmidt theory.

The symmetric-ideal interface laws should hold unconditionally, and the standard instances —
operator norm, Ky Fan, Hilbert–Schmidt, trace class, Schatten `p` — should be constructed
rather than postulated.

Suggested homes: `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/`,
`TauCeti/Analysis/OperatorIdeal/Family/`,
`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/`.

## Standing conventions

- **Zero-based indexing.** `aₙ(T) = dist(T, {R : rank R ≤ n})`, so `a₀(T) = ‖T‖`, matching
  Mathlib's zero-based singular values index for index. The one-based literature convention
  is the translation `sₙ(T) = aₙ₋₁(T)`.
- **Mathlib-shaped approximation numbers, `ℝ≥0∞` ideal gauges.** The approximation-number
  sequence uses the upstream-facing name and codomain
  `ContinuousLinearMap.singularValue T n : ℝ≥0`. Gauges coerce these values to `ℝ≥0∞` and are
  `∞` off their ideal: a number attached to one operator, versus a gauge whose finiteness
  *defines* a class.
- **Rectangular, independent universes.** Source and target are distinct spaces in
  independent universes throughout the base layer; rank comparisons use `LinearMap.rank` with
  explicit `Cardinal.lift`. Square operators are specializations.
- **Scalar ladder.** Norm-and-rank over `NontriviallyNormedField 𝕜` on seminormed spaces;
  adjoint invariance and Eckart–Young over `RCLike 𝕜`. The finite-restriction min–max
  converse is a pair-level proof lemma: direct over `ℂ`, and obtained once by complexification
  over `ℝ`. Ky Fan subadditivity and the induced symmetric-ideal theory expose only the
  natural `[RCLike 𝕜]` hypothesis to callers.
- **The approximable/compact boundary.** `aₙ(T) → 0` characterizes finite-rank approximability
  on any normed pair, and approximable implies compact over a `ProperSpace` scalar. The
  converse is claimed **only for a Hilbert target** — it fails for general Banach spaces
  without an approximation property, and the hypothesis sits on the target because that is
  where the property lives.
* **One** **`ℝ≥0∞`** **gauge is the sole datum of an ideal family**, the ideal being its finiteness domain. This follows the symmetric-norming-function construction of Gohberg–Kreĭn and is
  the presentation used throughout this roadmap, with an extensionality theorem for the
  induced families. Four laws suffice — subadditivity, absolute homogeneity, domination of
  the operator norm, and the two-sided composition bound — and closure under module
  operations follows.
- **Hilbert spaces at the family layer, forced by the examples.** The four laws are norm-only,
  but of the motivating gauges only the operator norm survives outside Hilbert space: Ky Fan
  subadditivity runs through singular values and majorization. No proof in the interface uses
  the inner product, so re-widening is mechanical if a Banach instance appears.
- **Two structures for the universe split.** The rectangular family keeps source and target
  universes independent; the adjoint exchanges them, so the symmetric family is a second
  structure over the diagonal instantiation.
- **Ky Fan dominance is a class, not a field.** It is false for an arbitrary family satisfying
  the four laws, so a family carries it as a property rather than as data.
- **Hilbert–Schmidt is `ℓ²` of columns, not a tensor product.** Isomorphic models, unequal
  cost: the `ℓ²` route inherits inner product and completeness from Mathlib's `lp`, leaving
  only the column bijection. The Hilbert basis is an explicit parameter of every statement;
  basis-independence of the *energy* is a theorem of Part B.
- **Normal forms.** The approximation number is the normal form of the field-generic theory;
  its identification with singular values is a named theorem, not a global `@[simp]`.

## What Mathlib already has (consume)

Reused: `ContinuousLinearMap` with its operator norm and
[`adjoint`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/Adjoint.html);
`LinearMap.rank`, `Module.finrank` and `Cardinal` arithmetic for cross-universe rank bounds;
[`LinearMap.singularValues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/SingularValues.html)
(zero-based), self-adjoint eigenbases and
[`CFC.sqrt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.html);
[`IsCompactOperator`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Operator/Compact/Basic.html);
`HilbertBasis` with Parseval; and `lp` with its inner-product instance at `p = 2`.
`ENNReal.tsum_comm` is the whole content of adjoint invariance for the Hilbert–Schmidt energy.

The gaps to fill are:

- **No finite-rank-implies-compact lemma.** A Part A target.
- **No hypothesis-free `ℝ≥0∞` Minkowski for `tsum`.** `NNReal.Lp_add_le_tsum` carries
  summability hypotheses on both summands and there is no `ENNReal` `tsum` form; the energy
  layer needs one at `1 ≤ p`. 
- **Approximation-number shape.** Mathlib PR
  [#32126](https://github.com/leanprover-community/mathlib4/pull/32126) proposes the finite-rank
  infimum as zero-based `ContinuousLinearMap.singularValue : ℕ → ℝ≥0`; see also the
  [Zulip thread](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Singular.20Value.20Decomposition.html).
  Tau Ceti uses that spelling, indexing and codomain for the missing API, so adoption of an
  upstream implementation is deletion plus import rather than migration between parallel
  approximation-number interfaces.

## What is missing (build here)

* The approximation numbers `aₙ(T)` on seminormed spaces over a `NontriviallyNormedField`,
  with the additive and multiplicative index laws, the two-sided ideal bound, and the
  rank/compactness boundary.
* Their Hilbert identifications: adjoint invariance, Eckart–Young against the
  finite-dimensional singular values, and both directions of the min–max principle.
* `OperatorIdealFamily` — one `ℝ≥0∞` gauge on every Hilbert pair, with its four laws — and
  the symmetric family for the diagonal case, where the adjoint keeps source and target in
  one universe.
* The Ky Fan dominance class, and the symmetric-gauge construction realizing a family from a
  gauge on sequences, together with its injectivity.
* The Schatten scale `S_p` for `1 ≤ p ≤ ∞`, obtained from that construction rather than built
  separately, with the nesting `S_p ⊆ S_q`.
* Hilbert–Schmidt operators as `ℓ²` of columns: the energy, its basis-independence, the
  reconciliation with `S₂`, and the named corollary **Hilbert–Schmidt ⇒ compact**.

## The build, in layers

### Part A — approximation numbers and Hilbert-space singular values

**Objects.** `ContinuousLinearMap.singularValue T n : ℝ≥0`, the infimum of `‖T − R‖₊`
over bounded `R` with `R.rank ≤ n`, on seminormed spaces over a `NontriviallyNormedField`;
the relation `HasSameApproximationNumbers` between operators on possibly different space
pairs, reflexive, symmetric and transitive — the vehicle for transporting ideal membership;
the Ky Fan gauge `kyFanGauge T k = ∑_{n<k} aₙ(T)`, whose bounds and induced families
carry `0 < k`.

**API to develop.**

- The defining infimum exposed once, then the workhorses: the upper bound against every
  admissible approximant, the universal lower-bound iff, attainment given a best
  approximant, existence of an `ε`-near approximant; `a₀(T) = ‖T‖`, antitonicity,
  `0 ≤ aₙ(T) ≤ ‖T‖`, `aₙ(0) = 0`.
- The exact zero-based additive law `a_{m+n}(S + T) ≤ aₘ(S) + aₙ(T)`, with no truncated
  subtraction anywhere, together with the Lipschitz bound `|aₙ(S) − aₙ(T)| ≤ ‖S − T‖` and
  norm-continuity of `T ↦ aₙ(T)`.
- The two-sided ideal laws `aₙ(A ∘ T ∘ B) ≤ ‖A‖ aₙ(T) ‖B‖` and `aₙ(c • T) = ‖c‖ aₙ(T)`. The
  index-splitting product inequality `a_{m+n}(S ∘ T) ≤ aₘ(S) · aₙ(T)` is a **separate**
  target and must not share the fixed-index name: the two are different theorems, and the
  word "multiplicativity" does not distinguish them.
- **Rank and compactness:** `aₙ(T) = 0` when `rank T ≤ n`, with the finite-dimensional
  converse as an iff; `aₙ(T) → 0` iff `T` is a norm limit of finite-rank operators with
  `n`-th term of rank at most `n`, as an explicit sequence rather than a named predicate;
  finite rank implies compact over a proper field — the lemma Mathlib lacks — hence
  approximable implies compact; and, once the *target* is an inner product space, the
  converse, closing the boundary as an equivalence.
- **Hilbert layer:** adjoint invariance `aₙ(T⋆) = aₙ(T)`, via rank invariance under the
  adjoint and the adjoint isometry; over `RCLike` the sequence identity `aₙ(|T|) = aₙ(T)`, from
  the pointwise identity `‖|T|x‖ = ‖Tx‖`, with the modulus belonging to
  [`PolarDecomposition`](../PolarDecomposition/README.md), now scalar-generic; and the unconditional lower bound `c ≤ aₙ(T)` from a `c`-coercive
  subspace of rank `> n`, with unit-vector and linearly-independent-family forms.
- **Min–max, both halves.** The orthogonal-tail equality on a complete source, its collapse
  to `0` once `n` reaches the source dimension, and the supremum formulation on the closed
  unit **ball** of `Vᗮ` — the sphere is empty at `V = ⊤`. The converse localization is the
  pair-level predicate `HasMinMaxLowerBound`: every strict lower bound of `aₙ(T)` is beaten
  on a subspace spanned by `n + 1` independent vectors, making `aₙ(T)` the least upper bound
  of its finite restrictions. The complex proof is direct; the real proof uses complexification.
- **Ky Fan gauges:** `kyFanGauge T 1 = ‖T‖`, the ideal laws, adjoint invariance, and the
  two-sided comparison `‖T‖ ≤ kyFanGauge T k ≤ k‖T‖` for `0 < k`. The lower bound fails at
  `k = 0`, where the gauge is the empty sum.

**Milestone A1 — Eckart–Young.** On finite-dimensional inner-product spaces over
`[RCLike 𝕜]`, `aₙ(T) = σₙ(T)` index for index, covering rectangular maps and the range
`n ≥ finrank 𝕜 E` where both sides vanish; Weyl's sharp inequality
`|σₙ(T) − σₙ(S)| ≤ ‖T − S‖` falls out by transport.

**Milestone A2 — the Ky Fan triangle inequality from finite-restriction min–max.**
For every `[RCLike 𝕜]`,
`kyFanGauge (S + T) k ≤ kyFanGauge S k + kyFanGauge T k`. It is false termwise. The
finite-dimensional case is the Ky Fan norm inequality of the majorization roadmap transported
along Milestone A1; a finite-dimensional source with arbitrary codomain follows by range
compression; the general case localizes through the pair-level min–max lemma. Part B
consumes one `RCLike` theorem rather than separate scalar-field versions.

**Milestone A3 — compact implies approximable on a Hilbert target.** A compact operator into
a Hilbert space has `aₙ(T) → 0`, completing the boundary whose other three edges are in the
API above. Two hypotheses one might expect are not needed and the statements should record
it: the domain need not be a Hilbert space, since what the proof uses is an orthogonal
projection onto a finite-dimensional subspace of the *codomain*; and completeness of the
target is not needed for the forward implication, a finite-dimensional subspace being
complete on its own. A finite-`ε`-net argument — cover the image of the unit ball, project
onto the span of the net, use that the orthogonal projection is the nearest point — proves
the stronger statement through a far smaller prerequisite than the spectral theorem for
`T⋆T`.

### Part B — symmetric operator ideals and Schatten norms

**Objects.** `OperatorIdealFamily 𝕜`: five fields — the gauge
`gauge : (E →L[𝕜] F) → ℝ≥0∞` quantified over all Hilbert pairs in two independent universes,
and its four laws. `SymmetricOperatorIdealFamily 𝕜` is the diagonal view that additionally
records adjoint invariance. `symmetricGaugeFamily` keeps the rectangular base family across
independent source and target universes, with `symmetricGaugeFamilySymmetric` as its diagonal
adjoint-invariant view. Derived: the ideal as a submodule of finite gauge, and the carrier as a
type synonym carrying the **ideal** norm — the bare subtype inherits the operator norm, which
is the wrong instance.

**API to develop.**

- The unconditional consequences of the four laws: `gauge 0 = 0`, definiteness from
  domination of the operator norm, negation invariance, finite-sum subadditivity, one-sided
  and contraction composition bounds, extensionality, closure of the carrier under module
  operations and outer composition; the ideal space's normed-space structure with
  `‖A‖ = (gauge A).toReal`, lossless on members, and the contractive embedding.
  Completeness of the carrier is **not** among them — the four laws do not force it. It is
  a separate property of a family. The operator-norm, finite Ky Fan, Hilbert–Schmidt,
  trace-class and finite-`p` Schatten families are complete; the Ky Fan, trace-class and
  Schatten proofs use the pair-level min–max localization, while Hilbert–Schmidt completeness
  is scalar-generic over `RCLike`.
- The instances, each with its gauge identified definitionally: the **operator norm** family,
  whose carrier is `⊤`; the **Ky Fan families** over `RCLike 𝕜`, indexed by `0 < k`; the
  **Hilbert–Schmidt family** over
  `RCLike 𝕜`; and **trace class** over `RCLike 𝕜`, with the proof using the pair-level min–max
  localization and gauge the
  nuclear norm `∑' n, aₙ(T)` in `ℝ≥0∞`.
- The **Hilbert–Schmidt energy** `∑' i, ‖T (b i)‖ₑ ^ 2` in `ℝ≥0∞`, with no summability side
  conditions anywhere: Parseval in `ℝ≥0∞`, the rectangular adjoint swap by unconditional
  Fubini, hence **basis independence**; the norm as its square root, with Minkowski extended
  to `tsum`, domination of the operator norm, adjoint invariance, the two-sided ideal bound,
  and the family itself, built from orthonormal expansions and sharing no machinery with the
  approximation-number instances.
- Ky Fan dominance as a class over families, with its membership-transport corollary and
  direct instances for the operator-norm, Ky Fan and trace-class families.
- Finite-dimensional **Schatten norms** `schattenNorm p`, over `RCLike 𝕜` for real
  `p ≥ 1` on the singular-value vector, as rectangular unitarily invariant norms.
  - Triangle inequality from Ky Fan subadditivity plus `ℓᵖ`-gauge monotonicity under weak
    majorization, both consumed from the majorization roadmap.
  - Definiteness, adjoint invariance, and the ideal inequalities.
  - The endpoint identifications `S₁ =` nuclear, `S∞ =` operator norm, and `S₂ =` the
    rectangular Frobenius seminorm owned by [`Majorization`](../Majorization/README.md),
    together with the finite-dimensional identification of the Hilbert–Schmidt energy with
    its square.
  - **Independent of Milestone B3**: this is a norm on a vector,
    consumed by the majorization arm, whereas B3 is a family on operators between
    infinite-dimensional spaces. Milestone A1 proves the two agree, which is what makes `S₂`
    one object across both halves of this Part.

### Milestone B1 — symmetric norming functions and induced ideal families

A symmetric norming function determines an operator-ideal family by applying its extension to the approximation-number sequence. This gives a uniform construction of the ideal families used below rather than constructing each family separately.

**Objects.** `SymmetricGauge`, a symmetric norming function in the sense of Gohberg–Kreĭn: a
map `Φ : (ℕ →₀ ℝ≥0) → ℝ≥0` on finitely supported sequences with subadditivity and positive
homogeneity, invariance under every permutation of `ℕ` (which is what "symmetric" names),
monotonicity in the termwise order, and the normalization `Φ (single 0 1) = 1`. The
normalization is a scale fixing rather than a restriction: it gives `‖a‖_∞ ≤ Φ a ≤ ∑ aₙ`, and
those two bounds are the first theorems, since they are what make the extension well behaved
at both ends of the scale.

**The extension to infinite sequences** is the supremum of `Φ` over the finitely supported
sequences dominated by `a`: `Φ∞ a = ⨆ {Φ b : b finitely supported, b ≤ a}`. For an
**antitone** `a` this is the monotone limit `⨆ N, Φ (truncate a N)` of its initial
truncations; for a general `a` the initial truncations do not exhaust the dominated
sequences, and only the supremum form is correct.

- **`ℝ≥0∞`-valued, and a supremum over finitely supported dominated sequences rather than a `tsum`.** The gauge must be
  total and `∞` off its ideal; a supremum of an increasing net is total by
  construction, whereas any route through summability reintroduces the side conditions the
  interface was designed to avoid.
- **Initial truncations suffice for antitone sequences.** If `a` is antitone,
  `Φ∞ a = ⨆ N, Φ (truncate a N)`. Approximation-number sequences are antitone by Part A,
  so this is the form used by consumers.
- **Monotone convergence is the only limit theorem needed**, so nothing here waits on a
  theory of symmetric sequence spaces.

**The induced family** `symmetricGaugeFamily 𝕜 Φ`, for `[RCLike 𝕜]`, is rectangular across
independent source and target universes and has gauge `Φ∞ (fun n => aₙ T)`. Its four base-family
fields are theorems, each tracing to one input: subadditivity is Milestone B2 applied to
`a(S + T)` against `a S + a T`; homogeneity is `aₙ(c • T) = ‖c‖ aₙ(T)` with homogeneity of
`Φ`; domination of the operator norm is `a₀(T) = ‖T‖` with `‖a‖_∞ ≤ Φ a`; and the composition
bound is the two-sided ideal law with monotonicity of `Φ`. Adjoint invariance is the separate
cross-universe theorem `gauge_adjoint_symmetricGaugeFamily`; on the diagonal it is packaged as
`symmetricGaugeFamilySymmetric`. Subadditivity is the only hard base-family law, which is why
it is stated as Milestone B2.

Equality of induced families determines the extended gauge on antitone sequences, and membership is invariant under `HasSameApproximationNumbers`; thus the resulting ideal depends only on the approximation-number sequence.

### Milestone B2 — the Ky Fan dominance principle

For every symmetric gauge `Φ` and every `RCLike` scalar field, the
family `symmetricGaugeFamily 𝕜 Φ` is Ky Fan dominant. Equivalently, and more usefully as a
lemma about sequences: if antitone `a` and `b` satisfy
`∑_{n<k} aₙ ≤ ∑_{n<k} bₙ` for every `k`, then `Φ∞ a ≤ Φ∞ b`.

The sequence form is the Hardy–Littlewood–Pólya transfer of the majorization roadmap: a
weakly majorized vector is dominated termwise by a convex combination of permutations of the
majorizing one, and `Φ` is monotone, symmetric and convex. Lifting to sequences uses the
supremum over finitely supported dominated sequences; on the antitone approximation-number
sequences this reduces to monotone convergence along the initial truncations.

This milestone delivers the triangle inequality for every symmetric ideal norm at once.
Milestone A2 says exactly that `a(S + T)` is weakly majorized by `a(S) + a(T)`; feeding that
in gives `gauge (S + T) ≤ gauge S + gauge T` for every `Φ` from a single inequality. Every
symmetric ideal in this roadmap stands on A2 through this milestone, and nothing else in
Part B needs A2 directly.

### Milestone B3 — Schatten `p` in infinite dimensions, and the reconciliation

`schattenGauge p` for each finite real exponent `1 ≤ p`, with
`Φ_p a = (∑ aₙ^p)^{1/p}`, and a separately named infinity endpoint
`schattenFamilyInf 𝕜` whose gauge is `Φ_∞ = ‖·‖_∞`, together with its adjoint-invariant
diagonal view `schattenFamilyInfSymmetric`; for finite `p` and any `[RCLike 𝕜]`,
`schattenFamily 𝕜 p = symmetricGaugeFamily 𝕜 (schattenGauge p)` is likewise rectangular across
independent universes, with diagonal view `schattenFamilySymmetric 𝕜 p`. Thus **the Schatten
classes are obtained rather than constructed**, and their laws are B1's.

- `Φ_p` is a symmetric gauge: subadditivity is Minkowski in `ℓᵖ`, monotonicity and symmetry
  are termwise, normalization is by inspection.
- The endpoint identifications, each an equality of rectangular *families* and not merely of
  gauges on the ideal: `schattenFamily 1` is the trace-class family, `schattenFamily 2` has the
  Hilbert–Schmidt gauge, and `schattenFamilyInf` is the operator-norm family. Their diagonal
  symmetric views agree as a consequence.
- The scale is monotone — `p ≤ q → gauge_q T ≤ gauge_p T`, hence `S_p ⊆ S_q` — with the
  inclusions strict, witnessed by a diagonal operator with coefficients `n ↦ (n + 1)^{-1/r}` for
  `p < r < q`, the same diagonal machinery as Part A's acceptance example (6).
**The reconciliation obligation.** `p = 2` is defined twice: through `schattenGauge 2` on the
singular-value sequence, and through the Hilbert–Schmidt energy on an orthonormal expansion.
The energy definition requires no spectral theory, so Part C depends on it. The two
definitions must therefore be proved equal:

```text
∑' n, ENNReal.ofReal (aₙ T) ^ 2  =  hilbertSchmidtEnergy T b        (any Hilbert basis b)
```

Both sides are basis-independent, so the statement is well-posed; the proof is the
singular-value expansion of a Hilbert–Schmidt operator, and it is the one place in Part B
where Milestone A3 is needed.

### Milestone B4 — block sums and the min–max proof interface

**Block sums.** For an orthogonal decomposition of source and target and a block-diagonal
operator, the approximation-number sequence of the sum is the decreasing rearrangement of the
union of the summands' sequences — hence a formula for every symmetric gauge, and, for the
two-block case consumers use, the sharp comparison
`max (gauge T₁) (gauge T₂) ≤ gauge (T₁ ⊕ T₂) ≤ gauge T₁ + gauge T₂`. The lower bound is
restriction–corestriction through the two-sided ideal law; the upper is subadditivity applied
to the two extensions by zero.

**Min–max proof interface.** Prove the pair-level converse localization directly over `ℂ` and
by real complexification over `ℝ`; complexification preserves exactly the approximation-number
and finite-restriction data that lemma needs.  The public Ky Fan, symmetric-gauge and Schatten
statements remain bare-`RCLike` theorems.  The pair-level predicate is reusable proof
infrastructure, not an assumption exposed to consumers.

### Part C — Hilbert–Schmidt operators as an `ℓ²` space of columns

**Objects.** For a Hilbert basis `b` of `F`: the columns `columns b T = fun i => T (b i)` of
`T : F →L[𝕜] E`, and the representation `ofLp b f : F →L[𝕜] E` for `f : lp (fun _ : ι => E) 2`,
defined by the absolutely convergent series `x ↦ ∑' i, (b.repr x i) • f i` through
Cauchy–Schwarz against the basis coefficients.

**API to develop.**

- Membership: `Memℓp (columns b T) 2 ↔ hilbertSchmidtEnergy T b ≠ ⊤`, stated against Part B's
  energy so that the model connects to the ideal theory instead of redefining
  "Hilbert–Schmidt"; and the summability form.
- The bijection: both round trips, injectivity, and the unique-representative
  characterization.
- The representation map is linear, proved from the round trips, and bounded with
  `‖ofLp b f‖ ≤ ‖f‖`.
- The `ℓ²` norm **is** the Hilbert–Schmidt norm: `‖f‖² = ∑' i, ‖ofLp b f (b i)‖²`, with the
  `ℝ≥0∞` comparison against the energy.

So `lp (fun _ : ι => E) 2` *is* the Hilbert–Schmidt space, and it arrives with Mathlib's
inner product and completeness already proved.

**Milestone C1 — isometric conjugation.** `Z ↦ U ∘ Z ∘ V` preserves the Hilbert–Schmidt norm
when `U` is norm-preserving and `V` has norm-preserving adjoint. The left case is termwise
trivial — composing with an isometry changes no column norm — and the right case is the same
statement about the adjoint; no basis-independence argument appears, which in the tensor
model is the expensive step.

**Milestone C2 — Pythagoras along an orthogonal family.** A family splitting every vector's
norm (`∑' i, ‖P i v‖ₑ ² = ‖v‖ₑ ²`) splits the energy on either side and jointly. No
countability, projection, or operator-topology summability hypothesis: the pointwise norm
split is all, and `ℝ≥0∞` keeps it side-condition-free.

## Worked examples (acceptance criteria)

### Part A — approximation numbers and Hilbert-space singular values

**Acceptance examples**, theorem-level tests proved from the public API with the defining
infimum never unfolded: (1) zero and identity — `aₙ(id)` is `1` below the dimension and `0`
at or past it; (2) a rank-`r` orthogonal projection has exactly `r` approximation numbers
equal to `1`; (3) a rectangular diagonal map has approximation numbers its entries sorted
decreasingly, unequal dimensions included; (4) an explicit rank-`r` map has `aₙ = 0` for
`n ≥ r`; (5) on a small diagonal matrix the orthogonal-tail infimum selects the span of the
largest singular directions and returns the next singular value; (6) a diagonal operator on
`lp (fun _ : ℕ => 𝕜) 2` with coefficients tending to zero has `aₙ → 0`. Example (6) should be
proved by truncation rather than through Milestone A3 — the `N`-th truncation has rank at
most `N` and the tail of the coefficients bounds `‖T − T_N‖` — because the approximation
numbers of a diagonal operator *are* its tail suprema, and compactness then falls out as a
corollary rather than being assumed.

### Part B — symmetric operator ideals and Schatten norms

**Acceptance examples.** The four instances instantiate the interface with their gauges
identified definitionally; the operator-norm and Ky Fan carriers are provably `⊤` while the
trace-class carrier is not — exhibiting a bounded non-trace-class operator, for which an
infinite orthonormal family suffices, is part of this milestone's acceptance.

### Part C — Hilbert–Schmidt operators as an `ℓ²` space of columns

**Acceptance criteria.** That the right-hand side of the membership characterization is
Part B's basis-independent energy, so nothing here is circular; that the basis is a parameter
of every statement, and no statement asserts basis-independence of the representation; that
`ofLp` is continuous, so the space is never presented without its bounded representation map.

## Ordering

Part A comes first, consuming [`PolarDecomposition`](../PolarDecomposition/README.md) for the
modulus, finite-dimensional singular values and Courant–Fischer, and
[`Majorization`](../Majorization/README.md) for the finite-dimensional Ky Fan inequality used
in Milestone A2. Part B consumes Part A plus the majorization engine; its finite-dimensional
`S₂` identification also consumes Majorization's Frobenius seminorm. Part C consumes Part B,
and otherwise only `lp` and `HilbertBasis`.

**Downstream, outside this group.** The Peter–Weyl roadmap
[`RepresentationTheory/CompactGroups`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md)
depends on three supporting results for `convolutionOperator_isCompact`: an HS-operator
API, "continuous kernel on a compact space ⇒ HS integral operator", and
"Hilbert–Schmidt ⇒ compact". Part C supplies the first and third; the second is kernel
theory and stays there.

Within Part B, the interface and its four instances are dependency-closed on Part A and can
ship first.

## Definitions

**D1** `Φ∞ a = ⨆ {Φ b : b finitely supported, b ≤ a}` — a symmetric gauge extended to
infinite sequences. For antitone `a` this equals `⨆ N, Φ (truncate a N)`.

**D2** `gauge T = Φ∞ (n ↦ aₙ T)` — the ideal family induced by a symmetric gauge.

**D3** `Φ_p a = (∑ aₙ^p)^(1/p)`, `1 ≤ p` — the `ℓᵖ` symmetric gauge.

**D4** `gauge T = ‖T‖`, equivalently `⨆ n, aₙ(T)` — the `p = ∞` endpoint.

**D5** `(∑_{i < finrank E} σᵢ(T)^p)^(1/p)` — the finite-dimensional Schatten `p`-norm.

**D6** `x ↦ ∑' i, ⟪bᵢ, x⟫ • fᵢ` — the operator represented by an `ℓ²` family of columns.

## References

- A. Pietsch, *Operator Ideals*, North-Holland, 1980; *Eigenvalues and s-Numbers*, Cambridge
  Studies in Advanced Mathematics 13, 1987.
- I. C. Gohberg and M. G. Kreĭn, *Introduction to the Theory of Linear Nonselfadjoint
  Operators in Hilbert Space*, AMS Translations of Mathematical Monographs 18, 1969.
- B. Simon, *Trace Ideals and Their Applications*, 2nd ed., AMS, 2005; M. Reed and B. Simon,
  *Methods of Modern Mathematical Physics I* — the Hilbert–Schmidt class as `ℓ²` of columns.
- R. Bhatia, *Matrix Analysis*, GTM 169, Springer, 1997 — Ky Fan inequalities and
  majorization.
- C. Eckart and G. Young, "The approximation of one matrix by another of lower rank",
  *Psychometrika* **1** (1936), 211–218; L. Mirsky, "Symmetric gauge functions and unitarily
  invariant norms", *Quart. J. Math.* **11** (1960), 50–59.
- R. A. Horn and C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge, 2013, Thm. 4.2.6.
- M. Ullrich, "Inequalities between s-numbers", *Adv. Oper. Theory* **9** (2024), art. 75.

## Acknowledgements

An Apache-2.0 implementation of nearly all of the above exists in the AIQ DKPS
[formalization repository](https://github.com/AIQ-Kitware/aiq-dkps-formalization) under
`ForTauCeti/` (namespaces `TauCeti.*` and `ContinuousLinearMap.*`), Copyright Kitware, Inc.,
with per-module provenance headers. The public API and proof structure may change during
integration.

Part A's elementary layer was adapted in part from Mathlib PR
[#32126](https://github.com/leanprover-community/mathlib4/pull/32126) and developed further
for spectral perturbation theory; migration must preserve provenance, authorship and
licensing while allowing review to improve the public API.
