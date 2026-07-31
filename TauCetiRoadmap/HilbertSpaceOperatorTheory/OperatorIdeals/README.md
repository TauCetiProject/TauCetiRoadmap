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

The goal is to build the reusable theory of these objects, not to race to a handful of named
identities. The bar for done: a researcher in operator or perturbation theory finds the
approximation numbers with their complete elementary calculus (Part A), a symmetric-ideal
interface whose laws hold unconditionally and whose standard instances — operator norm, Ky
Fan, Hilbert–Schmidt, trace class, Schatten `p` — are constructed rather than postulated
(Part B), a Hilbert–Schmidt space that arrives with inner product and completeness already
proved because it *is* Mathlib's `lp` (Part C), and the approximation numbers of a spectral
band (Part D).

Suggested homes: `TauCeti/Analysis/OperatorIdeal/ApproximationNumber/`,
`TauCeti/Analysis/OperatorIdeal/Family/`,
`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/`.

## Scope boundary

This roadmap owns **approximation numbers and every gauge of them**. That includes the
approximation numbers of a spectral band (Part D), whose proofs run through the unbounded
spectral measure: the proof is spectral theory, the statement is not, and ownership follows
the statement.

It does not own: singular values in finite dimension, the operator modulus, or
Courant–Fischer, which come from
[`HilbertSpaceOperatorFoundations`](../HilbertSpaceOperatorFoundations/README.md); weak
majorization and unitarily invariant norms on finite-dimensional spaces, which come from
[`MajorizationAndAngles`](../MajorizationAndAngles/README.md); or the spectral measure
itself, which comes from
[`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md).

## Generality bar

Decide these up front; do not silently specialize.

- **Zero-based indexing.** `aₙ(T) = dist(T, {R : rank R ≤ n})`, so `a₀(T) = ‖T‖` and the
  finite-dimensional identification is index-for-index against Mathlib's zero-based singular
  values. The one-based literature convention is the documented translation
  `sₙ(T) = aₙ₋₁(T)`; no duplicate one-based API is maintained.
- **Real-valued approximation numbers, extended-real ideal gauges.**
  `approximationNumber T n : ℝ` with nonnegativity a theorem, matching Mathlib's `norm`,
  `dist` and singular values. Ideal gauges are `ℝ≥0∞`-valued and genuinely `∞` off their
  ideal. Two different objects, not a conflict: a real number attached to one operator versus
  a gauge whose finiteness *defines* a class.
- **Rectangular, with independent universes.** Source and target are distinct spaces in
  independent universes throughout the base layer; rank comparisons use `LinearMap.rank` with
  explicit `Cardinal.lift` lemmas where universes differ. Square operators are
  specializations, never the primitive interface.
- **Scalar generality is a ladder, stated explicitly.** The norm-and-rank layer is over a
  `NontriviallyNormedField 𝕜` on seminormed spaces; adjoint invariance and Eckart–Young over
  `[RCLike 𝕜]`; the min–max converse, the Ky Fan triangle inequality, and anything routed
  through the operator modulus over `ℂ`, where the Hilbert-space continuous functional
  calculus is registered. A real theorem is never claimed merely by writing `[RCLike 𝕜]`; it
  needs a grounded real argument or the complexification transport of Milestone B4.
- **The approximable/compact boundary.** `aₙ(T) → 0` characterizes finite-rank
  approximability on any normed pair, and approximable implies compact over a `ProperSpace`
  scalar; the converse is asserted **only when the target is a Hilbert space**. It is false
  for general Banach spaces without an approximation-property hypothesis, and none is
  smuggled in. The hypothesis sits on the target rather than on the pair because that is
  where the approximation property lives; the domain stays an arbitrary normed space.
- **One `ℝ≥0∞` gauge as the sole datum of an ideal family.** A family is presented by a
  single total gauge, the ideal recovered as its finiteness domain — never by a membership
  predicate plus an independent real gauge. Only this presentation has an extensionality
  theorem, since free data leaves the gauge unconstrained off the ideal; it is the classical
  symmetric-norming-function presentation of Gohberg–Kreĭn and Calkin; every law holds
  unconditionally at non-members; and four laws suffice — subadditivity, absolute
  homogeneity, domination of the operator norm, the two-sided composition bound — with
  closure of the ideal under module operations a consequence rather than an axiom.
- **Hilbert spaces for the family layer, forced by the examples.** The four laws are
  norm-only and meaningful over Banach spaces, but of the motivating gauges only the operator
  norm survives outside Hilbert space: Ky Fan subadditivity runs through singular values and
  majorization, and `a_{m+n}(S+T) ≤ aₘ(S) + aₙ(T)` does not recover it — at `k = 2` it yields
  only `a₀(S) + 2a₀(T) + a₁(S)`. No proof in the interface uses the inner product, so
  re-widening is mechanical should a Banach instance appear.
- **Two structures for the universe split.** The rectangular family keeps source and target
  universes independent; the adjoint exchanges source and target, so the symmetric family is
  a second structure extending the diagonal instantiation rather than an extra field.
- **Dominance is a property, not data.** Ky Fan dominance is a class over families, so a
  family carries it as a fact about the family it already is. It is *false* for an arbitrary
  family satisfying the four laws, which is why it is a class and not a theorem.
- **Hilbert–Schmidt is `ℓ²` of columns, not a tensor product.** The two models are
  isomorphic; they are not equally cheap. The tensor route must construct the Hilbert tensor
  product and its basis-independence theory; the `ℓ²` route gets inner product and
  completeness from Mathlib's `lp` and leaves only the column bijection to prove. The Hilbert
  basis is an explicit **parameter** of every statement — nothing asserts basis-independence
  of the representation, because nothing needs it; basis-independence of the underlying
  *energy* is a theorem of Part B.
- **Normal forms.** The approximation number is the normal form of the field-generic theory;
  the identification with singular values is a named theorem, not a global `@[simp]` rewrite.
  Do not introduce private wrappers around existing Mathlib notions to restate a single
  hypothesis.

## What Mathlib already has

- **Operators:** `ContinuousLinearMap`, the operator norm, composition, and
  [`ContinuousLinearMap.adjoint`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/Adjoint.html)
  as a `LinearIsometryEquiv`; `LinearMap.rank`, `Module.finrank`, and `Cardinal` arithmetic
  for cross-universe rank bounds.
- **Finite-dimensional spectral theory:**
  [`LinearMap.singularValues`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/InnerProductSpace/SingularValues.html)
  (zero-based), self-adjoint eigenbases, orthogonal projections, and
  [`CFC.sqrt`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Basic.html)
  behind the operator modulus consumed from the foundations roadmap.
- **Compact operators:**
  [`IsCompactOperator`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Operator/Compact/Basic.html)
  with norm-limit closure and `isCompactOperator_of_locallyCompactSpace_dom`. Mathlib has
  **no finite-rank-implies-compact lemma**; providing it is a Part A target.
- **Hilbert bases and `ℓ²`:** `HilbertBasis`, `exists_hilbertBasis`, Parseval via
  `HilbertBasis.hasSum_inner_mul_inner`; `lp` with its inner-product-space instance at
  `p = 2`, completeness for `1 ≤ p`, and `Memℓp`.
- **`ℝ≥0∞` machinery:** `ENNReal.tsum_comm` — the unconditional Fubini exchange that is the
  whole content of adjoint invariance for the Hilbert–Schmidt energy — and
  `ENNReal.Lp_add_le` (finite Minkowski). Minkowski for `tsum` at general `p` is **not** in
  Mathlib: `NNReal.Lp_add_le_tsum` exists but carries summability hypotheses on both
  summands, and there is no `ENNReal` `tsum` version. A hypothesis-free `ℝ≥0∞` form at
  `1 ≤ p` is needed by the energy layer, and upstreaming it would be a reasonable Mathlib
  contribution.
- **Work in motion:** Mathlib PR
  [#32126](https://github.com/leanprover-community/mathlib4/pull/32126) drafts a zero-based
  `ContinuousLinearMap.singularValue : ℕ → ℝ≥0` for normed spaces; see also the
  [Zulip thread](https://leanprover-community.github.io/archive/stream/217875-Is-there-code-for-X%3F/topic/Singular.20Value.20Decomposition.html)
  on singular values. This roadmap deliberately pins `approximationNumber : ℕ → ℝ`, aligned
  with real-valued norms and infima and exposing nonnegativity separately. If that PR lands,
  an interoperability layer becomes a milestone of the migration; two public APIs should not
  be maintained in the meantime. **Re-check both before implementing.**

## Part A — approximation numbers and Hilbert-space singular values

**Objects.** `ContinuousLinearMap.approximationNumber T n : ℝ`, the infimum of `‖T − R‖`
over bounded `R` with `R.rank ≤ n`, on seminormed spaces over a `NontriviallyNormedField`;
the relation `HasSameApproximationNumbers` between operators on possibly different space
pairs, reflexive, symmetric and transitive — the vehicle for transporting ideal membership;
the Ky Fan gauge `kyFanGauge T k = ∑_{n<k} aₙ(T)`.

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
  adjoint and the adjoint isometry; over `ℂ` the sequence identity `aₙ(|T|) = aₙ(T)`, from
  the pointwise identity `‖|T|x‖ = ‖Tx‖`, with the modulus itself belonging to the
  foundations roadmap; and the unconditional lower bound `c ≤ aₙ(T)` from a `c`-coercive
  subspace of rank `> n`, with unit-vector and linearly-independent-family forms.
- **Min–max, both halves.** The orthogonal-tail equality on a complete source, its collapse
  to `0` once `n` reaches the source dimension, and the supremum formulation on the closed
  unit **ball** of `Vᗮ` — the sphere is empty at `V = ⊤`. Over `ℂ`, the converse
  localization: every strict lower bound of `aₙ(T)` is beaten on a subspace spanned by
  `n + 1` independent vectors, making `aₙ(T)` the least upper bound of its finite
  restrictions.
- **Ky Fan gauges:** `kyFanGauge T 1 = ‖T‖`, the ideal laws, adjoint invariance, and the
  two-sided comparison `‖T‖ ≤ kyFanGauge T k ≤ k‖T‖`.

**Milestone A1 — Eckart–Young.** On finite-dimensional inner-product spaces over
`[RCLike 𝕜]`, `aₙ(T) = σₙ(T)` index for index, covering rectangular maps and the range
`n ≥ finrank 𝕜 E` where both sides vanish; Weyl's sharp inequality
`|σₙ(T) − σₙ(S)| ≤ ‖T − S‖` falls out by transport.

**Milestone A2 — the Ky Fan triangle inequality over `ℂ`.**
`kyFanGauge (S + T) k ≤ kyFanGauge S k + kyFanGauge T k`, false termwise, proved by
bootstrapping: the finite-dimensional case is the Ky Fan norm inequality of the majorization
roadmap transported along Milestone A1; a finite-dimensional source with arbitrary codomain
follows by range compression; the general case localizes along the min–max converse. This is
the single inequality every symmetric ideal in Part B stands on.

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

## Part B — symmetric operator ideals and Schatten norms

**Objects.** `OperatorIdealFamily 𝕜`: a single field `gauge : (E →L[𝕜] F) → ℝ≥0∞` quantified
over all Hilbert pairs in two independent universes, with the four laws;
`SymmetricOperatorIdealFamily 𝕜`, its diagonal extension by adjoint invariance. Derived: the
ideal as a submodule of finite gauge; the carrier as a type synonym carrying the **ideal**
norm — the bare subtype inherits the operator norm, which is the wrong instance; and
completeness of that space as a typeclass rather than a hand-rolled Cauchy criterion.

**API to develop.**

- The unconditional consequences of the four laws: `gauge 0 = 0`, definiteness from
  domination of the operator norm, negation invariance, finite-sum subadditivity, one-sided
  and contraction composition bounds, extensionality, closure of the carrier under module
  operations and outer composition; the ideal space's normed-space structure with
  `‖A‖ = (gauge A).toReal`, lossless on members, and the contractive embedding.
- The instances, each with its gauge identified definitionally: the **operator norm** family,
  whose carrier is `⊤`; the **Ky Fan families** over `ℂ`, complete via the two-sided
  comparison with the operator norm; the **Hilbert–Schmidt family** below; and **trace
  class**, with gauge the nuclear norm `∑' n, aₙ(T)` in `ℝ≥0∞`, whose triangle inequality is
  the Ky Fan inequality in the limit.
- The **Hilbert–Schmidt energy** `∑' i, ‖T (b i)‖ₑ ^ 2` in `ℝ≥0∞`, with no summability side
  conditions anywhere: Parseval in `ℝ≥0∞`, the rectangular adjoint swap by unconditional
  Fubini, hence **basis independence**; the norm as its square root, with Minkowski extended
  to `tsum`, domination of the operator norm, adjoint invariance, the two-sided ideal bound,
  and the family itself — built from orthonormal expansions and sharing no machinery with
  the approximation-number instances, which is the evidence that the interface is not shaped
  around one example.
- Ky Fan dominance as a class over families, with its membership-transport corollary and
  direct instances for the operator-norm, Ky Fan and trace-class families.
- Finite-dimensional **Schatten norms** `schattenNorm p` for real `p ≥ 1` on the
  singular-value vector, as rectangular unitarily invariant norms: triangle inequality from
  Ky Fan subadditivity plus `ℓᵖ`-gauge monotonicity under weak majorization, both consumed
  from the majorization roadmap; definiteness; adjoint invariance; the ideal inequalities;
  and the endpoint identifications `S₁ =` nuclear, `S₂ =` Frobenius, `S∞ =` operator norm.
  **This finite-dimensional layer is not a special case of Milestone B3 and does not wait on
  it**: it is a norm on a vector, consumed by the majorization arm, whereas B3 is a family on
  operators between infinite-dimensional spaces. The two are related by Milestone A1, and
  that agreement is itself a target — without it a reader cannot tell whether `S₂` means the
  same thing in the two halves of this Part.

### Milestone B1 — symmetric norming functions and the Calkin correspondence

The construction the whole interface exists to receive: what turns "here are four gauges we
happened to build" into "here is every symmetric ideal, from its symbol". Four instances are
examples; a map from symbols to families is a theory.

**Objects.** `SymmetricGauge`, a symmetric norming function in the sense of Gohberg–Kreĭn: a
map `Φ : (ℕ →₀ ℝ≥0) → ℝ≥0` on finitely supported sequences with subadditivity and positive
homogeneity, invariance under every permutation of `ℕ` (which is what "symmetric" names),
monotonicity in the termwise order, and the normalization `Φ (single 0 1) = 1`. The
normalization is a scale fixing rather than a restriction: it gives `‖a‖_∞ ≤ Φ a ≤ ∑ aₙ`, and
those two bounds are the first theorems, since they are what make the extension well behaved
at both ends of the scale.

**The extension to infinite sequences** is a monotone limit, not a new definition:
`Φ∞ a = ⨆ N, Φ (truncate a N)` over the finitely supported truncations of the **decreasing
rearrangement**. Three decisions are pinned here because each has a wrong answer that looks
right:

- **`ℝ≥0∞`-valued, and a supremum over truncations rather than a `tsum`.** The gauge must be
  total and genuinely `∞` off its ideal; a supremum of an increasing net is total by
  construction, whereas any route through summability reintroduces the side conditions the
  interface was designed to avoid.
- **The truncations are of the decreasing rearrangement**, so that `Φ∞` sees a sequence the
  way `Φ` sees a finite one. For the sequences this roadmap feeds it this costs nothing —
  `n ↦ aₙ(T)` is already antitone by Part A, so the rearrangement is the identity and every
  consumer-facing statement avoids it. The rearrangement is in the definition so that `Φ∞` is
  defined on arbitrary sequences, not so that anyone rearranges anything.
- **Monotone convergence is the only limit theorem needed**, so nothing here waits on a
  theory of symmetric sequence spaces.

**The induced family** `symmetricGaugeFamily Φ` has gauge `Φ∞ (fun n => aₙ T)`, and the
content of the milestone is that its five structure fields are theorems, each tracing to one
input: subadditivity is Milestone B2 applied to `a(S + T)` against `a S + a T`; homogeneity
is `aₙ(c • T) = ‖c‖ aₙ(T)` with homogeneity of `Φ`; domination of the operator norm is
`a₀(T) = ‖T‖` with `‖a‖_∞ ≤ Φ a`; the composition bound is the two-sided ideal law with
monotonicity of `Φ`; and adjoint invariance is `aₙ(T⋆) = aₙ(T)`. Subadditivity is the only
hard one, which is why it is stated as Milestone B2 rather than buried inside.

**The Calkin correspondence.** Symmetric ideals of `B(H)` on a separable infinite-dimensional
Hilbert space are in bijection with the symmetric sequence ideals, via `T ↦ a(T)`. This
roadmap specifies the direction it needs and is explicit about the other:

- **Targeted:** the map `Φ ↦ symmetricGaugeFamily Φ` is injective up to equality of gauges on
  antitone sequences, and membership transports along `HasSameApproximationNumbers` — so the
  ideal really is a function of the singular-value sequence alone.
- **Not claimed:** surjectivity, that *every* symmetric ideal arises from a symmetric norming
  function. That is the substantial half of Calkin's theorem, it needs a separability
  hypothesis nothing else here needs, and no downstream result consumes it. If a reviewer
  wants it, it is a milestone of its own.

### Milestone B2 — the Ky Fan dominance principle

For every symmetric gauge `Φ`, the family `symmetricGaugeFamily Φ` is Ky Fan dominant.
Equivalently, and more usefully as a lemma about sequences: if antitone `a` and `b` satisfy
`∑_{n<k} aₙ ≤ ∑_{n<k} bₙ` for every `k`, then `Φ∞ a ≤ Φ∞ b`.

The sequence form is the Hardy–Littlewood–Pólya transfer of the majorization roadmap: a
weakly majorized vector is dominated termwise by a convex combination of permutations of the
majorizing one, and `Φ` is monotone, symmetric and convex. Lifting to sequences is monotone
convergence along the truncations, and that is the whole infinite-dimensional content — which
is why the extension in B1 is a supremum of truncations rather than anything cleverer.

**This is the load-bearing milestone**: it delivers the triangle inequality for every
symmetric ideal norm at once. Milestone A2 says exactly that `a(S + T)` is weakly majorized
by `a(S) + a(T)`; feeding that in gives `gauge (S + T) ≤ gauge S + gauge T` for every `Φ`
from a single inequality. Every symmetric ideal in this roadmap stands on A2 through this
milestone, and nothing else in Part B needs A2 directly.

### Milestone B3 — Schatten `p` in infinite dimensions, and the reconciliation

`schattenGauge p` for each finite real exponent `1 ≤ p`, with
`Φ_p a = (∑ aₙ^p)^{1/p}`, and a separately named infinity endpoint
`schattenFamilyInf` whose gauge is `Φ_∞ = ‖·‖_∞`; for finite `p`,
`schattenFamily p = symmetricGaugeFamily (schattenGauge p)`, so **the Schatten classes are
obtained rather than constructed**, and their laws are B1's.

- `Φ_p` is a symmetric gauge: subadditivity is Minkowski in `ℓᵖ`, monotonicity and symmetry
  are termwise, normalization is by inspection.
- The endpoint identifications, each an equality of *families* and not merely of gauges on
  the ideal: `schattenFamily 1` is the trace-class family, `schattenFamily 2` has the
  Hilbert–Schmidt gauge, and `schattenFamilyInf` is the operator-norm family.
- The scale is monotone — `p ≤ q → gauge_q T ≤ gauge_p T`, hence `S_p ⊆ S_q` — with the
  inclusions strict, witnessed by a diagonal operator with coefficients `n ↦ n^{-1/r}` for
  `p < r < q`, the same diagonal machinery as Part A's acceptance example (6).
- **Hölder duality** — `‖T‖_p` as a supremum of trace pairings against `S_q` with
  `1/p + 1/q = 1` — is deliberately deferred: it needs a trace functional, which this roadmap
  does not define, and no milestone here consumes it. It is the natural first milestone of a
  successor roadmap, and saying so is more useful than half-specifying it.

**The reconciliation obligation.** `p = 2` is defined twice: through `schattenGauge 2` on the
singular-value sequence, and through the Hilbert–Schmidt energy on an orthonormal expansion.
The two routes are deliberately different — the energy route needs no spectral theory, which
is what lets Part C stand on it — so they must be proved equal:

```text
∑' n, ENNReal.ofReal (aₙ T) ^ 2  =  hilbertSchmidtEnergy T b        (any Hilbert basis b)
```

Both sides are basis-independent, so the statement is well-posed; the proof is the
singular-value expansion of a Hilbert–Schmidt operator, and it is the one place in Part B
where Milestone A3 is genuinely needed rather than convenient. **This debt is incurred
knowingly and is the price of Part C being independent of the ideal machinery.**

### Milestone B4 — block sums and scalar transport

**Block sums.** For an orthogonal decomposition of source and target and a block-diagonal
operator, the approximation-number sequence of the sum is the decreasing rearrangement of the
union of the summands' sequences — hence a formula for every symmetric gauge, and, for the
two-block case consumers actually use, the sharp comparison
`max (gauge T₁) (gauge T₂) ≤ gauge (T₁ ⊕ T₂) ≤ gauge T₁ + gauge T₂`. The lower bound is
restriction–corestriction through the two-sided ideal law; the upper is subadditivity applied
to the two extensions by zero.

**Scalar transport.** A real Hilbert space complexifies, `aₙ(T_ℂ) = aₙ(T)`, and every gauge in
this roadmap is a function of that sequence — so **the real-scalar ideal theory is a
transported instance rather than a re-proof.** Concretely this is what discharges the
`ℂ`-only hypotheses standing in Part A and in the Ky Fan instance: A2's triangle inequality
over `ℝ`, the Ky Fan family over `ℝ`, and the min–max converse over `ℝ` all follow by
transport once the sequence identity is proved.

**Why this is a milestone and not a remark.** The `ℂ`-only hypotheses are the largest gap
between what this roadmap states and what a reader assumes it states. A generality bar
saying "over `ℂ`, where the continuous functional calculus is registered" is honest, but a
reviewer will ask what it costs to remove, and the answer should be a named milestone with a
route. The route is one sequence identity and no new analysis.

**Acceptance examples.** The four instances instantiate the interface with their gauges
identified definitionally; the operator-norm and Ky Fan carriers are provably `⊤` while the
trace-class carrier is not — exhibiting a bounded non-trace-class operator, for which an
infinite orthonormal family suffices, is part of this milestone's acceptance.

## Part C — Hilbert–Schmidt operators as an `ℓ²` space of columns

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
model is precisely the part that costs. This is what makes the Sylvester flow
`Z ↦ U_A t ∘ Z ∘ (U_B t)⋆` a unitary group on the Hilbert–Schmidt space, the hypothesis
under which the perturbation roadmap applies Stone's theorem.

**Milestone C2 — Pythagoras along an orthogonal family.** A family splitting every vector's
norm (`∑' i, ‖P i v‖ₑ ² = ‖v‖ₑ ²`) splits the energy on either side and jointly. No
countability, projection, or operator-topology summability hypothesis: the pointwise norm
split is all, and `ℝ≥0∞` keeps it side-condition-free.

**Acceptance criteria.** That the right-hand side of the membership characterization is
Part B's basis-independent energy, so nothing here is circular; that the basis is a parameter
of every statement, and no statement asserts basis-independence of the representation; that
`ofLp` is continuous, so the space is never presented without its bounded representation map.

## Part D — approximation numbers of spectral bands

**This Part depends on
[`SelfAdjointSpectralTheory`](../SelfAdjointSpectralTheory/README.md), and is the only part
of this roadmap that does.** It is here rather than there because its statements are about
approximation numbers and finite ranks; that their proofs run through the spectral measure of
an unbounded operator makes the *proof* spectral theory, not the *statement*.

**Objects and API to develop.**

- The rank of a spectral band: for a self-adjoint operator whose spectral measure gives a
  bounded Borel set `B` a projection of finite rank, the finite-dimensionality of the
  spectral subspace and the rank count.
- The **Gram spectral rank**: for a bounded `X` into the domain, the rank of the spectral
  band of `X⋆X` and the resulting approximation numbers of `X`, giving finite-rank
  approximants selected by spectral cutoff rather than by an abstract net.
- The **finite spectral selection**: an orthonormal family spanning the range of a
  finite-rank spectral projection, and its use as the approximant in the min–max bound of
  Part A.
- The **polar form**: the polar decomposition of a band-compressed operator, so that a
  spectral band bound becomes an approximation-number bound.

**Milestone D1 — spectral cutoff bounds the approximation numbers.** If the spectral measure
of `A` gives `(−δ, δ)` no mass on a subspace and the band above `δ` has rank `r`, then
`a_r` of the corresponding compression is bounded by the band data. This is the statement
that lets a perturbation argument use an ideal gauge with a *spectral* hypothesis rather than
a rank hypothesis.

**Acceptance examples.** A bounded self-adjoint operator with finite spectrum: the bands are
its eigenspaces and the bound is the next eigenvalue; a diagonal operator on `ℓ²` with
coefficients tending to zero: the band above `δ` is finite-rank and the bound recovers
Part A's acceptance example (6).

## Dependency ordering

Part A comes first and consumes two external roadmaps: `HilbertSpaceOperatorFoundations`, for
the operator modulus, the finite-dimensional singular-value library and Courant–Fischer behind
Milestone A1; and `MajorizationAndAngles`, for the finite-dimensional Ky Fan norm inequality
that seeds Milestone A2. Part B consumes Part A — every ideal gauge here is a functional of the
`a`-sequence — plus the majorization engine for Milestones B2–B3 and the Schatten layer.
Part C consumes Part B for the energy and the ideal framing, and otherwise only Mathlib's `lp`
and `HilbertBasis`. Part D consumes Part A and `SelfAdjointSpectralTheory`, and nothing in
Parts B or C waits on it.

Within Part A, acceptance examples (5)–(6) can land after the min–max layer; within Part B,
the interface and its four instances are dependency-closed on Part A and can ship first, with
B1–B4 following in order.

## References

- A. Pietsch, *Operator Ideals*, North-Holland, 1980; *Eigenvalues and s-Numbers*, Cambridge
  Studies in Advanced Mathematics 13, 1987.
- I. C. Gohberg and M. G. Kreĭn, *Introduction to the Theory of Linear Nonselfadjoint
  Operators in Hilbert Space*, AMS Translations of Mathematical Monographs 18, 1969.
- J. W. Calkin, "Two-sided ideals and congruences in the ring of bounded operators in Hilbert
  space", *Ann. of Math.* **42** (1941), 839–873.
- B. Simon, *Trace Ideals and Their Applications*, 2nd ed., AMS, 2005; M. Reed and B. Simon,
  *Methods of Modern Mathematical Physics I* — the Hilbert–Schmidt class as `ℓ²` of columns.
- R. Bhatia, *Matrix Analysis*, GTM 169, Springer, 1997 — Ky Fan inequalities and
  majorization.
- C. Eckart and G. Young, "The approximation of one matrix by another of lower rank",
  *Psychometrika* **1** (1936), 211–218; L. Mirsky, "Symmetric gauge functions and unitarily
  invariant norms", *Quart. J. Math.* **11** (1960), 50–59.
- R. A. Horn and C. R. Johnson, *Matrix Analysis*, 2nd ed., Cambridge, 2013, Thm. 4.2.6.
- M. Ullrich, "Inequalities between s-numbers", *Adv. Oper. Theory* **9** (2024), art. 75.

## Provenance

A substantial implementation of nearly all of the above exists in the AIQ DKPS
[formalization repository](https://github.com/AIQ-Kitware/aiq-dkps-formalization) under
`ForTauCeti/` (namespaces `TauCeti.*` and `ContinuousLinearMap.*`), Apache-2.0, Copyright
Kitware, Inc., with per-module provenance headers. It establishes feasibility and provides
source provenance for integration, but this roadmap specifies the desired mathematics
intrinsically and does not prescribe the donor API or proof architecture.

Part A's elementary layer was adapted in part from Mathlib PR
[#32126](https://github.com/leanprover-community/mathlib4/pull/32126) and developed further
for spectral perturbation theory; migration must preserve provenance, authorship and
licensing while allowing review to improve the public API.

Two design decisions are worth flagging because a reader may expect otherwise. The
single-gauge presentation replaces an earlier record carrying membership and a total real
gauge as independent fields; that form is derivable from this one and not conversely, and it
has been retired. And `p = 2` was built by the direct orthonormal route rather than through
symmetric gauges — deliberately, since it needs no spectral theory, at the price of the
reconciliation obligation in Milestone B3.
