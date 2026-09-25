# Roadmap: counting totally ramified extensions of a local field, and Serre's mass formula

The [local fields and ramification roadmap](../LocalFieldsRamification/README.md) builds the
arithmetic of a finite extension of a non-archimedean local field: total ramification, Eisenstein
generators, monogenicity, the different and the discriminant, and the tame criterion. This
roadmap is that theory's counting consumer. It asks how *many* such extensions there are, and
proves the answer — the **mass formula** of [Serre 1978]: inside a fixed separable closure, the
totally ramified extensions of degree `n` of a local field `K` satisfy

```text
∑_{L ∈ σ_K(n)} q^{-c(L)} = n,          c(L) = d(L) − n + 1
```

where `q` is the residue cardinality and `d(L)` the discriminant exponent, together with its
isomorphism-class form `∑_{M} 1 / (#Aut_K(M) · q^{c(M)}) = 1`. It is the local counting statement
behind mass heuristics for global field counting, and nothing like it is upstream.

The machinery the count needs is not ramification theory, and that is what makes this a separate
roadmap: a **quantitative Newton estimate** over a complete discrete valuation ring (Mathlib's
`hensels_lemma` is that estimate over `ℤ_[p]` only, and `HenselianLocalRing` lifts a simple root
with no distance bound, hence no count), the **lattice-index scaling law** for Haar measure over
such a ring (Mathlib's `Measure.addHaar_image_linearMap` is real-vector-space only), and the
parametrization of `σ_K(n)` by the **Eisenstein region** of coefficient space. The first two are
stated over an arbitrary discrete valuation ring (complete, for the Newton estimate; with finite
residue field, for the index) and are reusable well outside this roadmap.

Suggested home: `TauCeti/NumberTheory/LocalField/MassFormula/`, with the two general layers
placed by subject instead: quantitative Newton lifting in
`TauCeti/RingTheory/DiscreteValuationRing/`, the lattice index in
`TauCeti/LinearAlgebra/FreeModule/` beside Mathlib's `ℤ` analogue, and the Haar scaling law in
`TauCeti/MeasureTheory/Group/`.

## Scope

This roadmap owns the **counting** of totally ramified extensions of a local field: the set
`σ_K(n)` as an object, the wild exponent `c` as its weight, the analytic and measure-theoretic
machinery that evaluates the count, and the mass formulas with the finiteness, convergence and
orbit statements that accompany them.

It does not own the arithmetic of the individual extension. **Total ramification, Eisenstein
generators, monogenicity, the different, the discriminant, and the tame criterion belong to the
[local fields and ramification roadmap](../LocalFieldsRamification/README.md)**, which is where
they are specified and where their API accrues; the contract this roadmap consumes from it is
listed below. It also does not own higher ramification groups, Herbrand functions or Hasse–Arf
(same roadmap); local class field theory; adic or Huber-theoretic geometry over `K`, which is the
[adic spaces roadmap](../AdicSpaces/README.md); or archimedean local fields, which
`IsNonarchimedeanLocalField` excludes and which never enter.

## Standing conventions

Pinning these matters more than usual: the objects are junk-tolerant by design, and an
implementor who picks a different model will not be able to state the summit.

- **The base field.** `K` carries
  `[Field K] [ValuativeRel K] [UniformSpace K] [IsUniformAddGroup K] [IsNonarchimedeanLocalField K]`.
  Spell the hypotheses out; do not bundle them. Mathlib's instances then supply
  `IsDiscreteValuationRing 𝒪[K]`, `Finite 𝓀[K]`, `CompactSpace 𝒪[K]`, `CompleteSpace K` and
  `IsAdicComplete 𝓂[K] 𝒪[K]` by `inferInstance`; consume them, never re-prove them.
- **The residue cardinality is written inline as `Nat.card 𝓀[K]`**, and the residue
  characteristic as `ringChar 𝓀[K]`; `q` below abbreviates the former in prose only, as `σ_K n`
  and `c L` abbreviate `totallyRamifiedOfDegree K n` and `wildExponent L`. Do not introduce a `q`
  or `p` abbreviation. A weight `q^{−k}` is spelled `1 / (Nat.card 𝓀[K] : ℝ≥0∞) ^ k`.
- **Extensions live inside a separable closure.** An extension is a term of
  `IntermediateField K (SeparableClosure K)`. This is Serre's setting and it is load-bearing: in
  equal characteristic `p` the inseparable Eisenstein polynomials (`X^p − π`) must not be counted,
  and working inside `SeparableClosure K` excludes them by construction rather than by a side
  hypothesis. ⚠ The consumed roadmap states its ramification theory for a finite extension `L/K`
  as such; the bridge to subextensions of `SeparableClosure K` is this roadmap's Layer 0, which
  installs the consumed `finiteIntermediateField*` adapters.
- **The discriminant exponent is the consumed one.** `d L` is the consumed
  `discriminantExponent`, totalized over arbitrary subextensions by the wrapper
  `intermediateFieldDiscriminantExponent`; for a totally ramified extension its different
  exponent `v_L(𝔡)` and the valuation of its discriminant ideal in `K` agree, since the residue
  degree is `1` (the consumed `discriminantExponent_eq_inertiaDegree_mul_differentExponent`). Do
  not introduce a second discriminant.
- **Junk is tolerated, `0 < n` is not optional.** For `L` infinite over `K`, or for `n = 0`, these
  definitions take junk values. Every statement about `σ_K n` therefore carries `0 < n`, and
  membership in `σ_K n` is what makes a statement honest. Do not add finiteness hypotheses to
  definitions to avoid junk; add them to theorems.
- **Sums are in `ℝ≥0∞`.** Theorems 1 and 2 are stated with `∑'` valued in `ℝ≥0∞`, where the
  possibly infinite sum needs no convergence side condition and equality with `n` (resp. `1`)
  already encodes convergence. The convergence remark is a *separate* statement over `ℝ` as
  `Summable`; state both and relate them, and do not merge them.
- **Representative sets are a predicate, not a quotient.** `IsRepresentativeSet n R` says that
  `R ⊆ σ_K n` and every `L ∈ σ_K n` is `K`-isomorphic to exactly one member of `R`; Theorem 2
  quantifies over every such `R`. This is Serre's phrase verbatim and avoids `Quotient.lift`
  well-definedness obligations for `c` and `#Aut`.
- **The coefficient space and its measure.** A monic degree-`n` polynomial is its coefficient
  vector `a : Fin n → K`, with `a i` the coefficient of `X ^ i`. The measure is the additive Haar
  measure of `Fin n → K` normalized so that the integer box `Fin n → 𝒪[K]` has volume `1`; by
  uniqueness of Haar measure this is the product of the normalized coordinate measures, but the
  product structure is needed only inside proofs, so neither `Measure.pi` nor σ-finiteness appears
  in any statement.
- **Valuations in an extension are `IsDiscreteValuationRing.addVal`**, `ℕ∞`-valued. No topology on
  `L` enters any counting statement or estimate: completeness of the ring of integers of `L` is
  the algebraic `IsAdicComplete`, and all estimates are `addVal` estimates — the spelling the
  consumed `addVal_sum_eisenstein_powerBasis` exports. The consumed structure adapters put the
  canonical topology and valuation on a subextension carrier only inside the Layer 0 wrappers;
  no statement here hypothesizes a second uniform structure.

## What this roadmap consumes

### From the local fields and ramification roadmap

Every item below is specified there and is imported here from that roadmap's `Suggested.lean` by
exact name; the table at the end of this section is the map. This roadmap's milestones rest on
them and add no independent development of the same material; if one of them is restated in
`TauCeti/` by this roadmap's implementors, that is a duplicate to be deleted rather than a
contribution.

- **Total ramification** as a predicate, with `e · f = [L:K]` and the equivalence with residue
  degree `1`.
- **Totally ramified is equivalent to Eisenstein**, in both directions, with the uniformizer the
  Eisenstein polynomial produces. ⚠ The direction every later layer applies — a root of a
  degree-`n` Eisenstein polynomial generates a totally ramified extension of degree `n` in which
  it is a uniformizer and its power basis generates the ring of integers ([Serre 1979, Chap. I,
  §6, Prop. 17]) — is that roadmap's README item *Layer 3: totally ramified is equivalent to
  Eisenstein* and has no declaration in its `Suggested.lean`: the `←` direction of
  `isTotallyRamified_iff_exists_eisenstein_generator` takes `Algebra.adjoin 𝒪[K] {ξ} = ⊤` as an
  input, and `exists_integerRing_adjoin_eq_top` produces some generator, not the Eisenstein root.
- **Local monogenicity**: the ring of integers of a finite separable extension is generated by one
  integral element.
- **The different and the discriminant**, the exponent `d(L/K)`, and the comparison with Mathlib's
  `differentIdeal`.
- **The tame criterion** `d = e − 1 ⟺ tamely ramified`, and the wild bounds
  `e ≤ d ≤ e − 1 + v_L(e)`, stated for `(e : L) ≠ 0`. The tame criterion is what makes `c(L) = 0`
  equivalent to `¬ (p ∣ n)`, and the upper bound is what the finiteness dichotomy applies outside
  equal characteristic; both are consumed here rather than reproved. ⚠ The lower bound
  `n − 1 ≤ d` that makes `c(L) = d(L) − n + 1` a nonnegative integer, and that the `→` direction
  of the `c(L) = 0` criterion needs, is **not** a corollary of `differentExponent_bounds_of_wild`,
  whose hypothesis `(e : L) ≠ 0` fails in equal characteristic `p` with `p ∣ n` — the case in
  which `σ_K(n)` is infinite. It is Mathlib's `pow_sub_one_dvd_differentIdeal`
  (`Mathlib/RingTheory/DedekindDomain/Different.lean`), `𝓂[L]^(e − 1) ∣ differentIdeal` for every
  finite separable extension, read through the consumed `differentExponent` and
  `discriminantExponent_eq_inertiaDegree_mul_differentExponent`.
- **Invariance under `K`-isomorphism** of the different and discriminant exponents, the
  arithmetic fact beneath this roadmap's family-level invariance of `c`.
- **Orthogonality of the Eisenstein power basis**, in the `IsDiscreteValuationRing.addVal`
  spelling; this roadmap owns only its box and cube corollaries (Layer 0).
- **The structure adapters for a finite intermediate-field carrier**, which put the canonical
  normed, valuative and topological structure on a subextension without a postulated topology or
  valuation.

Each consumed item and the declaration (in namespace `TauCetiRoadmap.LocalFieldsRamification`)
that supplies it:

| Consumed item | Supplier declaration |
| --- | --- |
| total ramification, and the residue-degree criterion | `IsTotallyRamified`, `isTotallyRamified_iff_inertiaDegree_eq_one` |
| `e · f = [L:K]` | `ramificationIndex_mul_inertiaDegree` |
| totally ramified ⟺ Eisenstein | `isTotallyRamified_iff_exists_eisenstein_generator` |
| local monogenicity | `exists_integerRing_adjoin_eq_top` |
| an Eisenstein root generates a totally ramified extension, is a uniformizer of it, and its power basis generates the ring of integers | the README item *Layer 3: totally ramified is equivalent to Eisenstein* (no declaration in that roadmap's `Suggested.lean`) |
| the different and discriminant exponents | `differentExponent`, `discriminantExponent`, with `localDiscriminantIdeal` and `discriminantExponent_eq_inertiaDegree_mul_differentExponent` |
| the tame criterion and the wild bounds for `(e : L) ≠ 0` | `differentExponent_eq_ramificationIndex_sub_one_iff`, `differentExponent_bounds_of_wild` |
| invariance under `K`-isomorphism | `differentExponent_eq_of_algEquiv`, `discriminantExponent_eq_of_algEquiv` |
| Eisenstein power-basis orthogonality | `addVal_sum_eisenstein_powerBasis` |
| structure on a finite intermediate-field carrier | `finiteIntermediateFieldNormedField`, `finiteIntermediateFieldValuativeRel`, `finiteIntermediateFieldTopology`, `finiteIntermediateField_valuativeExtension`, `finiteIntermediateField_isValuativeTopology`, `finiteIntermediateField_isNonarchimedeanLocalField` |

`Suggested.lean` imports these and consumes them by name. Its wrappers
`intermediateFieldIsTotallyRamified` and `intermediateFieldDiscriminantExponent` — the
junk-tolerant totalizations that roadmap's consumer contract permits — install the adapters and
reduce to the canonical invariants through comparison theorems; they define no ramification
theory of their own.

### From Mathlib

- **Local fields:** `Mathlib/NumberTheory/LocalField/Basic.lean` — `IsNonarchimedeanLocalField`
  and the instance package above, plus `valueGroupWithZeroIsoInt`.
  ⚠ `IsAdicComplete 𝓂[K] 𝒪[K]` **is an instance there**; it is not a gap and must not be reproved.
- **Notation and valuations:** `Mathlib/Topology/Algebra/Valued/ValuativeRel.lean`,
  `Mathlib/RingTheory/Valuation/ValuativeRel/*`, and
  `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` (`IsDiscreteValuationRing.addVal`,
  `exists_irreducible`, `Irreducible.maximalIdeal_eq`).
- **Eisenstein polynomials:** `Mathlib/RingTheory/Polynomial/Eisenstein/*`
  (`Polynomial.IsEisensteinAt`, `IsEisensteinAt.irreducible`).
- **Hensel's lemma:** `Mathlib/NumberTheory/Padics/Hensel.lean` — `hensels_lemma`, over `ℤ_[p]`
  only: for `a` with `‖F(a)‖ < ‖F'(a)‖²` it gives a root `z` with `‖z − a‖ < ‖F'(a)‖` and
  `‖F'(z)‖ = ‖F'(a)‖`, unique among the roots in that ball. Layer 1 is this theorem over an
  arbitrary complete discrete valuation ring, in `addVal` spelling.
  `Mathlib/RingTheory/Henselian.lean` — `HenselianLocalRing`, `HenselianRing` — lifts a simple
  root *modulo the maximal ideal*, with no distance estimate.
- **Separable degree and embeddings:** `Mathlib/FieldTheory/SeparableDegree.lean` —
  `Field.embEquivOfAdjoinSplits`, `Field.finSepDegree_eq_finrank_of_isSeparable`.
- **Smith normal form:** `Mathlib/LinearAlgebra/FreeModule/IdealQuotient.lean` and
  `…/Finite/Quotient.lean` — `Submodule.quotientEquivPiSpan`, the input to the lattice index,
  whose `ℤ` analogue is `AddSubgroup.index_eq_natAbs_det` (`…/Finite/CardQuotient.lean`).
- **Haar measure:** `Mathlib/MeasureTheory/Group/Measure.lean` — `IsAddHaarMeasure` and the
  existence of Haar measure on a locally compact group;
  `Mathlib/MeasureTheory/Measure/Haar/Unique.lean` — `isAddLeftInvariant_eq_smul_of_regular`, the
  uniqueness the general-set scaling law uses.
  ⚠ The determinant scaling law `Measure.addHaar_image_linearMap`
  (`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`) is stated for **real** vector spaces
  only; the non-archimedean analogue is Layer 2.

## What is missing (build here)

The set `σ_K(n)` and the wild exponent as a counting weight, with its invariance under
`K`-isomorphism derived from the consumed exponent invariance; the box and cube descriptions that
follow from the consumed power-basis orthogonality; quantitative Newton lifting over a complete
discrete valuation ring and the local constancy of root counts it yields; the lattice-index
formula over a discrete valuation ring with finite residue field and the Haar scaling law over
`K`; the measure of the Eisenstein region and the parametrization it carries; and the two mass
formulas with their finiteness, convergence and orbit-counting companions. None of this is
upstream, and none of it is claimed by the roadmap this one consumes.

---

## The build, in layers

The ordering is the dependency order. As each layer makes the next layer's *types* expressible in
`TauCeti/`, its milestones go into `Suggested.lean` (with `sorry`).

### Layer 0: the counting invariants

- **`σ_K(n)`**, the set of subextensions of `SeparableClosure K` that are totally ramified of
  degree `n` over `K`, built on the consumed `IsTotallyRamified` through the wrapper
  `intermediateFieldIsTotallyRamified`, which installs the consumed `finiteIntermediateField*`
  adapters and carries the comparison theorem the consumer contract requires. With the bridge
  lemmas the count needs: `σ_K(1) = {K}`; every member is `K⟮x⟯` for `x` a root of an
  Eisenstein polynomial of degree `n`, which is the consumed
  `isTotallyRamified_iff_exists_eisenstein_generator` transported to this setting; conversely,
  `K⟮x⟯ ∈ σ_K(n)` for every root `x ∈ SeparableClosure K` of a degree-`n` Eisenstein polynomial
  over `𝒪[K]`, which transports the consumed statement that an Eisenstein root generates a
  totally ramified extension in which it is a uniformizer (that roadmap's README item, cited
  above) and is the direction Layer 3's root-count identity and Layer 4's orbit count apply; and
  membership is preserved by the image of any `K`-embedding into `SeparableClosure K`, a
  corollary of the converse.
- **The wild exponent `c L := d L + 1 − n`** in truncated `ℕ`-subtraction, where `d` is the
  consumed `discriminantExponent` through its wrapper `intermediateFieldDiscriminantExponent`.
  Mathlib's `pow_sub_one_dvd_differentIdeal`, read through the consumed `differentExponent` and
  `discriminantExponent_eq_inertiaDegree_mul_differentExponent` (`e = n`, `f = 1`), gives
  `n − 1 ≤ d L`, which makes the truncation faithful, so `c` is Serre's nonnegative integer; with
  the consumed tame criterion it gives `c L = 0 ⟺ ¬ (ringChar 𝓀[K] ∣ n)`. State both here as the
  corollaries of Mathlib and the consumed facts that they are, not as fresh developments.
- **Invariance of `c` under `K`-isomorphism.** A `K`-isomorphism carries integral bases to
  integral bases with the same discriminant, so `d`, hence `c`, is an invariant of the class.
  The arithmetic invariance is the consumed `discriminantExponent_eq_of_algEquiv` (with
  `differentExponent_eq_of_algEquiv` beside it); the target here is only its transport through
  the wrapper to `wildExponent`, junk case included, which is the regrouping Theorem 2 runs
  along.
- **The box and cube corollaries of the power-basis orthogonality.** The consumed
  `addVal_sum_eisenstein_powerBasis` gives, at an Eisenstein generator `ξ` of degree `n`, that
  the terms of `∑_{i<n} c_i ξ^i` have pairwise distinct valuations — the `i`-th is
  `n · addVal(c_i) + i`, distinct modulo `n` — so no cancellation is possible and the valuation
  of the sum is the minimum of the terms'. The targets here are its family-level consequences: a
  ball of the ring of integers is a box in power-basis coordinates — the ball `v_L ≥ r` is
  `∏_{i<n} π^{⌈(r − i)/n⌉} · 𝒪[K]`, that is `c_i ∈ 𝓂[K] ^ ((r − i) ⌈/⌉ n)` for every `i`, with
  the `ℕ`-truncated ceiling division `(r − i) ⌈/⌉ n = (r − i + n − 1) / n`, so the `i`-th factor
  is `𝒪[K]` itself when `r ≤ i` — and at a radius `r = n · ρ` it is the cube with every factor
  `π^ρ · 𝒪[K]`. These are the workhorse of Layers 2 and 3.

### Layer 1: quantitative Newton lifting over a complete discrete valuation ring

The Newton estimate is stated for an arbitrary complete (`IsAdicComplete`) discrete valuation
ring, since nothing in it uses the local field; the local-field case is an instance. The local
constancy of the root count is stated over `K` and quantifies over Layer 0's `σ_K n`.

- **Newton iteration with an estimate.** If `addVal (F y₀) > 2 · addVal (F' y₀)`, the iteration
  `y ↦ y − F y / F' y` converges to a root `z` of `F` with
  `addVal (z − y₀) ≥ addVal (F y₀) − addVal (F' y₀)`, and `z` is the unique root in that ball.
  Uniqueness is the algebraic statement that two roots `z ≠ z'` of `F` satisfy
  `addVal (z − z') ≤ addVal (F' z)`, from the Taylor expansion of `F` at `z`; it uses no
  completeness, and it is the form the local fibre count of Layer 3 applies. ⚠ This is Mathlib's
  `hensels_lemma` (`Mathlib/NumberTheory/Padics/Hensel.lean`), stated there over `ℤ_[p]` only and
  in norm spelling, over an arbitrary complete discrete valuation ring in `addVal` spelling;
  `HenselianLocalRing` lifts a simple root modulo the maximal ideal and yields no distance bound.
  The estimate, not the existence, is what Layer 3 consumes.
- **Local constancy of the root count.** For a monic `f` over `𝒪[K]`, separable over `K`, there is
  a threshold `T`, depending on `f` and `n` only, such that every monic `g` with
  `g.coeff i − f.coeff i ∈ 𝓂[K]^T` for all `i` has exactly as many roots in `L` as `f` does, for
  every `L ∈ σ_K n`. The route is a Bézout
  certificate `U · f + V · f' = β` over `𝒪[K]` bounding the order of `f'` at every near-root
  uniformly, then Newton lifting in both directions.
- ⚠ **Not Krasner's lemma.** Mathlib's Krasner (`Analysis/Normed/Field/Krasner.lean`) is a
  normed-field statement about a *single* root generating an extension; what Layer 3 needs is a
  *count* that is uniform on a coefficient ball, which Krasner does not give. Keep the two apart
  and do not route this layer through the normed setting.

### Layer 2: lattices, index, and the Haar scaling law

The index is stated for an arbitrary discrete valuation ring with finite residue field of
cardinality `q`, for the same reason; it uses no completeness. The scaling law is over `K`, whose
`𝒪[K]` is such a ring.

- **The index of an image lattice.** For a matrix `M` over `𝒪[K]` with `Associated M.det (π^k)`,
  the quotient of the integer box `Fin n → 𝒪[K]` by its image under `M` has exactly `q^k`
  elements. Via `Submodule.quotientEquivPiSpan` (Smith normal form over the principal ideal ring
  `𝒪[K]`), the quotient splits into residue rings of the diagonal coefficients, whose product is
  associated to `M.det`. Mathlib's `AddSubgroup.index_eq_natAbs_det` is the `ℤ` analogue.
- **The scaling law.** For the Haar measure `μ` of `Fin n → K` normalized on the integer box,
  `μ (M '' S) = q^{−k} · μ S` for every measurable `S` — the non-archimedean analogue of
  `Measure.addHaar_image_linearMap`. State it in two forms. For `S` the box or any ball it is the
  index, with no side condition, and that is the form Layer 3 consumes. For general `S`,
  `μ (M '' ·)` is again a Haar measure, so the constant is read off the box by uniqueness of Haar
  measure (`isAddLeftInvariant_eq_smul_of_regular`), at the price of the hypothesis `μ.Regular`,
  which Mathlib's `addHaarMeasure` carries by instance and which no Layer 3 statement needs.
- **Boxes and balls.** The image lattice of a diagonal matrix is the coordinate box with `i`-th
  factor `π^{e i} · 𝒪[K]`, of volume `q^{−∑ e i}`; a ball is a translate of the lattice of a
  constant-radius box. With Layer 0's orthogonality this computes the volume of a ball of the ring
  of integers of `L` in power-basis coordinates, which is the only other volume the summit needs.

### Layer 3: the Eisenstein region and the parametrization

- **The Eisenstein region** `E_n ⊆ (Fin n → K)`: every coefficient in `𝓂[K]`, with the constant
  term of valuation exactly that of a uniformizer. State the bridge the parametrization runs on:
  `a ∈ E_n` exactly when the coefficients are integral and the polynomial over `𝒪[K]` they
  define is `Polynomial.IsEisensteinAt 𝓂[K]`. Its measure is `q^{−n} · (1 − q^{−1})`.
- **Almost every Eisenstein polynomial is separable** ([Serre 1978, eq. (3)]): the non-separable
  locus is null. In equal characteristic this is where the inseparable polynomials are discarded,
  and it is the reason the count is over subextensions of `SeparableClosure K`.
- **The root count.** For `L ∈ σ_K n`, `rootCount L a` is the number of roots of the monic
  polynomial with coefficient vector `a` lying in `L`, counted with multiplicity. On the
  full-measure separable locus all multiplicities are `1`. Almost everywhere on `E_n`,
  `∑_{L ∈ σ_K n} rootCount L a = n`: an Eisenstein polynomial is irreducible, and each of its `n`
  roots generates exactly one member of `σ_K n`.
- **Almost-everywhere measurability of the root count.** For each `L ∈ σ_K n`, state
  `AEMeasurable (fun a => (rootCount L a : ℝ≥0∞)) (μ.restrict (eisensteinSet K n))`.
  Layer 1 makes the root count locally constant on the separable Eisenstein locus; the
  non-separable locus is null, giving measurability for the restricted measure.
- **Countability of the family.** For `0 < n`, state
  `(totallyRamifiedOfDegree K n).Countable`. At the coefficient vector of an Eisenstein generator
  of each `L`, local constancy gives an open piece of `E_n` of positive Haar measure on which
  `rootCount L` is positive. For any finite subfamily, the sum of the root-count integrals is at
  most `n · μ(E_n)`, by the almost-everywhere root-count identity. This finite bound forces the
  family of positive integrals, hence `σ_K n`, to be countable, without using Theorem 1.
- **The local fibre count** ([Serre 1978, Lemma 1]): for `L ∈ σ_K n` with Eisenstein generator `ξ`
  of minimal polynomial `f`, and `d = d L` the consumed discriminant exponent through its wrapper —
  which is `addVal (f' ξ)`, since `𝒪_L = 𝒪[K][ξ]` makes Mathlib's `conductor_mul_differentIdeal`
  (with `conductor_eq_top_of_adjoin_eq_top`) read `differentIdeal = (f' ξ)`, and the residue degree
  is `1` — and for every `ρ` with `d + n ≤ n · ρ`: a monic `g` over `𝒪[K]` has a root in the cube
  `ξ + π^ρ · 𝒪_L` of radius `π^ρ`, that is `addVal (y − ξ) ≥ n · ρ`, if and only if
  `addVal (g ξ) ≥ n · ρ + d`, and then exactly one. Existence is Layer 1 at `ξ`, where
  `addVal (g' ξ) = d`, so the root lands at distance `≥ n · ρ`; uniqueness is that the threshold
  transports the derivative order to any root `z` of `g` in the cube, `addVal (g' z) = d`, and two
  distinct roots `z ≠ z'` would then give `d = addVal (g' z) ≥ addVal (z − z') ≥ n · ρ`; the
  converse is the Taylor expansion of `g` at a root in the cube. By the power-basis orthogonality
  the condition `addVal (g ξ) ≥ n · ρ + d` is a box in coefficient space, of measure
  `q^{−(n · ρ + d)}`, which is `q^{−d}` times the volume `q^{−n · ρ}` of the cube in power-basis
  coordinates: the lattice whose volume the integral below computes. ⚠ `ρ` must be taken large
  enough: for `K = ℚ_2` and `ξ = √2`, where `d = 3`, the cube at `ρ = 1` is `ξ + 2 · 𝒪_L` and
  contains both roots of `X² − 2`.
- **The integral of the root count** ([Serre 1978, Lemmas 2 and 3, eqs. (5)–(13)]): for each
  `L ∈ σ_K n`, `∫_{E_n} rootCount L = q^{−(d L + 1)} · (1 − q^{−1})`. The change of variables runs
  in power-basis coordinates: a ball of the ring of integers is the ideal generated by a suitable
  element, in coordinates the image lattice of the matrix of multiplication by it, whose
  determinant is that element's norm — so Layer 2 supplies the factor `q^{−d L}` with no Jacobian,
  no conjugates and no Vandermonde.

### Layer 4: the mass formulas

- **Theorem 1** ([Serre 1978, Thm. 1]): for `0 < n`, `∑' L : σ_K n, 1 / q ^ c L = n` in
  `ℝ≥0∞`. Integrate the root-count identity of Layer 3 over `E_n`, interchange the sum and
  integral using `MeasureTheory.lintegral_tsum` with Layer 3's countability and
  almost-everywhere measurability targets, and divide by the measure of the region.
- **The finiteness dichotomy** ([Serre 1978, Rmk. 1°]): `σ_K n` is infinite if and only if `K` has
  equal characteristic `p` and `p ∣ n`. Both directions are targets. The forward direction follows
  from Theorem 1 together with the uniform bound `c L ≤ n · natCastValuation K n h`, for
  `h : (n : K) ≠ 0`, which is available exactly outside the asserted case — the consumed upper
  bound of `differentExponent_bounds_of_wild` at `e = n`, its `natCastValuation L n` being
  `n · natCastValuation K n h` since `L / K` is totally ramified;
  the converse is an explicit family — the Eisenstein polynomials `X^n + π^m X + π` for `m ≥ 1`
  have `d = n · m`, pairwise distinct, hence generate infinitely many distinct members.
- **Convergence** ([Serre 1978, Rmk. 1°]): `Summable fun L : σ_K n => 1 / (q : ℝ) ^ c L`, the
  real-valued restatement, a corollary of Theorem 1 through `ENNReal.summable_toReal`; it carries
  information only in the infinite case.
- **The orbit count** ([Serre 1978, Rmk. 3°]): for `L ∈ σ_K n`, the number of `M ∈ σ_K n` that are
  `K`-isomorphic to `L`, times `#Aut_K(L)`, is `n`. `L / K` is separable of degree `n`, so it has
  exactly `n` embeddings into `SeparableClosure K`; each image lies in `σ_K n` by Layer 0; and the
  embeddings with a given image form a torsor under `Aut_K(L)`.
- **Theorem 2** ([Serre 1978, Thm. 2]): for every `R` with `IsRepresentativeSet n R`,
  `∑' M : R, 1 / (#Aut_K(M) · q ^ c M) = 1` in `ℝ≥0∞`. Theorem 1 regrouped along isomorphism
  classes, using the invariance of `c` from Layer 0 and the orbit count.
- **The tame count**, as a corollary worth stating: when `¬ (ringChar 𝓀[K] ∣ n)`, every `c L = 0`,
  so `σ_K n` is finite with exactly `n` elements.

## Worked examples (acceptance criteria, keeping the definitions honest)

Discharge these alongside the layers; they catch a vacuous `σ`, a wrong normalization of the
measure, and an off-by-one in `c`.

- **`n = 1`:** `σ_K 1 = {K}` with `d = c = 0`, and Theorem 1 reads `1 = 1`.
- **Tame:** for `K = ℚ_p` with `p` odd and `n = 2`, `σ_K 2` has exactly two elements (`ℚ_p(√p)`
  and `ℚ_p(√(u p))` for `u` a non-residue unit), both with `c = 0`, so the sum is `2`. This is the
  tame count above in its smallest instance.
- **Wild, and the sharpest test of `c`:** for `K = ℚ_2` and `n = 2`, `σ_K 2` has six elements —
  `ℚ_2(√−1)` and `ℚ_2(√−5)` with `d = 2`, hence `c = 1`; and `ℚ_2(√±2)`, `ℚ_2(√±10)` with `d = 3`,
  hence `c = 2`. Theorem 1 reads `2 · 2^{−1} + 4 · 2^{−2} = 2`. An implementation that gets `c`
  off by one fails here and nowhere earlier. ⚠ Those two discriminant values are the `ℚ_2(i)` and
  `ℚ_2(√2)` cases of the consumed roadmap's own worked examples; agreeing with them is the check
  that the consumed `d` and the `c` here are the same invariant.
- **Equal characteristic:** for `K = 𝔽_p((t))` and `n = p`, `σ_K n` is infinite, yet the real
  series converges — the two halves of Remark 1° on the same example.
- **The measure of the Eisenstein region** is `q^{−n}(1 − q^{−1})`, and the integral of
  `rootCount L` over it is `q^{−(d L + 1)}(1 − q^{−1})`; summing over `L` recovers `n` times the
  measure of the region. Checking the two constants against each other catches a misnormalized
  Haar measure, which is otherwise invisible until the summit.
- **Galois case of the orbit count:** for `L / K` Galois in `σ_K n`, `#Aut_K(L) = n` and the
  isomorphism class of `L` inside `σ_K n` is `{L}`.

## Ordering

Layer 0 comes first and rests on the consumed contract. The Newton estimate of Layer 1 and all of
Layer 2 are independent of Layer 0 and of each other — general statements about discrete
valuation rings; the local constancy of the root count quantifies over `σ_K n` and needs Layer 0.
Layer 3 needs 0–2; Layer 4 needs Layer 3, except for the orbit count, which needs only Layer 0.

## Long horizon (a roadmap for a future roadmap; do not attempt it here)

Serre's formula was refined by Krasner into a count of the totally ramified extensions of given
degree *and* given discriminant, and generalized by Bhargava into a mass formula over all étale
extensions of a local field, which is the local input to the conjectured densities of number-field
discriminants. Both are natural continuations and neither is specified here; they are named to
mark the direction, not to be worked on under this roadmap.

## References

- J-P. Serre, *Une «formule de masse» pour les extensions totalement ramifiées de degré donné
  d'un corps local*, C. R. Acad. Sci. Paris **286** (1978), Série A, 1031–1036 — the summit:
  Thm. 1, Thm. 2, Remarks 1° and 3°, Lemmas 1–3 and the change of variables of §3.
- J-P. Serre, *Local Fields*, Graduate Texts in Mathematics **67**, Springer (1979) — Chap. I §6
  (Eisenstein polynomials and monogenicity, Prop. 17), Chap. III §3 (the different and the
  discriminant), Chap. III §6 (the valuation of the different, tameness, Prop. 13). Consumed
  through the local fields and ramification roadmap rather than developed here.
- M. Krasner, *Nombre des extensions d'un degré donné d'un corps p-adique*, in *Les tendances
  géométriques en algèbre et théorie des nombres*, CNRS (1966), 143–169 — the
  discriminant-refined count that Serre's formula summarizes.
- M. Bhargava, *Mass formulae for extensions of local fields, and conjectures on the density of
  number field discriminants*, IMRN (2007) — the étale generalization.

## Acknowledgements

The mathematics of every layer has been formalized, `sorry`-free, in
[0stellensatz/MassFormula](https://github.com/0stellensatz/MassFormula) (Apache-2.0), by the
proposer of this roadmap; the provenance map below records where each layer's proof can be read.
That project is a **cited source, not the specification**: this roadmap states the mathematics
intrinsically, hands the ramification-theoretic half to the roadmap that owns it, and asks for the
two general layers at a generality the source did not need.

### Provenance (secondary; the layers above are definitive)

File map, relative to that project's `MassFormula/`:

| Layer | Files |
| --- | --- |
| 0 | `Defs.lean`, `UniformizerParam.lean` (the box and cube corollaries), `Second.lean` (invariance of `c`) |
| 1 | `RootLifting.lean` |
| 2 | `HaarScaling.lean` |
| 3 | `First.lean`, `UniformizerParam.lean` (the fibre count) |
| 4 | `First.lean`, `Second.lean`, `Finiteness.lean`, `Convergence.lean`, `Orbit.lean` |

The source's `EisensteinMonogenic.lean`, `Discriminant.lean` and `Tame.lean`, and the
orthogonality half of `UniformizerParam.lean`, prove material this roadmap consumes rather than
owns; they are evidence that the consumed contract is provable in this setting, and belong with
the roadmap that specifies it, not here.

Where this roadmap departs from the source:

- The source proves `IsAdicComplete 𝓂[K] 𝒪[K]` itself; that instance is now in Mathlib and is to
  be consumed, not carried.
- The source wraps `integralClosure ↥𝒪[K] ↥L` and its maximal ideal in project abbreviations; use
  Mathlib's spelling, and the consumed roadmap's, so the lemmas land where the rest of the
  integral-closure API lives.
- Layer 1's Newton estimate and Layer 2 are stated in the source only for the local-field case
  they were needed in; this roadmap asks for them over an arbitrary discrete valuation ring
  (complete, for the Newton estimate; with finite residue field, for the index), which is the
  generality their proofs already have.
- The source is organized as a frozen specification file paired with a development file that
  discharges it. That device does not transfer: in Tau Ceti the roadmap is what commits to a
  statement before its proof exists, and no `sorry` may land in `TauCeti/`.
