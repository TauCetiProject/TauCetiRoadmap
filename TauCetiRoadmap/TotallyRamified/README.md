# Roadmap: counting totally ramified extensions of a local field, and Serre's mass formula

The [local fields and ramification roadmap](../LocalFieldsRamification/README.md) builds the
arithmetic of a finite extension of a non-archimedean local field: total ramification, Eisenstein
generators, monogenicity, the different and the discriminant, and the tame criterion. This
roadmap is that theory's first counting consumer. It asks how *many* such extensions there are,
and proves the answer — the **mass formula** of [Serre 1978]: inside a fixed separable closure,
the totally ramified extensions of degree `n` of a local field `K` satisfy

```text
∑_{L ∈ σ_K(n)} q^{-c(L)} = n,          c(L) = d(L) − n + 1
```

where `q` is the residue cardinality and `d(L)` the discriminant exponent, together with its
isomorphism-class form `∑_{M} 1 / (#Aut_K(M) · q^{c(M)}) = 1`. It is the local counting statement
behind mass heuristics for global field counting, and nothing like it is upstream.

The machinery the count needs is not ramification theory, and that is what makes this a separate
roadmap: a **quantitative Newton estimate** over a complete discrete valuation ring (Mathlib's
`HenselianLocalRing` lifts a simple root but gives no distance bound, hence no count), the
**lattice-index scaling law** for Haar measure over such a ring (Mathlib's
`Measure.addHaar_image_linearMap` is real-vector-space only), and the parametrization of `σ_K(n)`
by the **Eisenstein region** of coefficient space. The first two are stated over an arbitrary
complete discrete valuation ring and are reusable well outside this roadmap.

Suggested home: `TauCeti/NumberTheory/LocalField/MassFormula/`, with the two general layers
placed by subject instead: quantitative Newton lifting in
`TauCeti/RingTheory/DiscreteValuationRing/`, and the lattice scaling law in
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
- **The residue cardinality is `q K := Nat.card 𝓀[K]`**, and the residue characteristic is written
  inline as `ringChar 𝓀[K]`. Do not introduce a `p` abbreviation.
- **Extensions live inside a separable closure.** An extension is a term of
  `IntermediateField K (SeparableClosure K)`. This is Serre's setting and it is load-bearing: in
  equal characteristic `p` the inseparable Eisenstein polynomials (`X^p − π`) must not be counted,
  and working inside `SeparableClosure K` excludes them by construction rather than by a side
  hypothesis. ⚠ The consumed roadmap states its ramification theory for a finite extension `L/K`
  as such; the bridge to subextensions of `SeparableClosure K` is this roadmap's Layer 0.
- **The discriminant exponent is the consumed one.** `d L` is the invariant the local fields and
  ramification roadmap defines; for a totally ramified extension its different exponent `v_L(𝔡)`
  and the valuation of its discriminant ideal in `K` agree, since the residue degree is `1`. Do
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
  `L` is used anywhere: completeness of the ring of integers of `L` is the algebraic
  `IsAdicComplete`, and all estimates are `addVal` estimates. This keeps the count free of a
  second uniform structure.

## What this roadmap consumes

### From the local fields and ramification roadmap

Every item below is a target *there*, not here. This roadmap's milestones rest on them and add no
independent development of the same material; if one of them is restated in `TauCeti/` by this
roadmap's implementors, that is a duplicate to be deleted rather than a contribution.

- **Total ramification** as a predicate, with `e · f = [L:K]` and the equivalence with residue
  degree `1`.
- **Totally ramified is equivalent to Eisenstein**, in both directions, with the uniformizer the
  Eisenstein polynomial produces.
- **Local monogenicity**, and in particular that a root of an Eisenstein polynomial generates the
  ring of integers on its power basis.
- **The different and the discriminant**, the exponent `d(L/K)`, and the comparison with Mathlib's
  `differentIdeal`.
- **The tame criterion** `d = e − 1 ⟺ tamely ramified`, and the wild lower bound `e ≤ d`. Together
  these are exactly what makes `c(L) = d(L) − n + 1` a nonnegative integer, and what makes
  `c(L) = 0` equivalent to `¬ (p ∣ n)`; both are consumed here rather than reproved.

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
- **Hensel's lemma, qualitatively:** `Mathlib/RingTheory/Henselian.lean` — `HenselianLocalRing`,
  `HenselianRing`. This lifts a simple root *modulo the maximal ideal*; it gives no distance
  estimate and no count, which is why Layer 1 exists.
- **Separable degree and embeddings:** `Mathlib/FieldTheory/SeparableDegree.lean` —
  `Field.embEquivOfAdjoinSplits`, `Field.finSepDegree_eq_finrank_of_isSeparable`.
- **Smith normal form:** `Mathlib/LinearAlgebra/FreeModule/IdealQuotient.lean` and
  `…/Finite/Quotient.lean` — `Submodule.quotientEquivPiSpan`, the input to the lattice index.
- **Haar measure:** `Mathlib/MeasureTheory/Group/Measure.lean` — `IsAddHaarMeasure` and the
  existence of Haar measure on a locally compact group. ⚠ The determinant scaling law
  `Measure.addHaar_image_linearMap` (`Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean`) is
  stated for **real** vector spaces only; the non-archimedean analogue is Layer 2.

## What is missing (build here)

The set `σ_K(n)` and the wild exponent as a counting weight, with its invariance under
`K`-isomorphism; the orthogonality of a power basis at an Eisenstein generator; quantitative
Newton lifting over a complete discrete valuation ring and the local constancy of root counts it
yields; the lattice-index formula and the Haar scaling law over such a ring with finite residue
field; the measure of the Eisenstein region and the parametrization it carries; and the two mass
formulas with their finiteness, convergence and orbit-counting companions. None of this is
upstream, and none of it is claimed by the roadmap this one consumes.

---

## The build, in layers

The ordering is the dependency order. As each layer makes the next layer's *types* expressible in
`TauCeti/`, its milestones go into `Suggested.lean` (with `sorry`).

### Layer 0: the counting invariants

- **`σ_K(n)`**, the set of subextensions of `SeparableClosure K` that are totally ramified of
  degree `n` over `K`, built on the consumed total-ramification predicate. With the bridge lemmas
  the count needs: `σ_K(1) = {K}`; membership is preserved by the image of any `K`-embedding into
  `SeparableClosure K`; and every member is `K⟮x⟯` for `x` a root of an Eisenstein polynomial of
  degree `n`, which is the consumed equivalence transported to this setting.
- **The wild exponent `c L := d L + 1 − n`** in truncated `ℕ`-subtraction, where `d` is the
  consumed discriminant exponent. The consumed bounds make the truncation faithful, so `c` is
  Serre's nonnegative integer and `c L = 0 ⟺ ¬ (ringChar 𝓀[K] ∣ n)`; state both here as the
  corollaries of the consumed facts that they are, not as fresh developments.
- **Invariance of `c` under `K`-isomorphism.** A `K`-isomorphism carries integral bases to
  integral bases with the same discriminant, so `d`, hence `c`, is an invariant of the class.
  ⚠ Not covered by the consumed contract, which states `d` for a fixed extension; Theorem 2 is
  exactly a regrouping along this invariance, so it is a target here.
- **Orthogonality of the power basis.** In the ring of integers generated by an Eisenstein
  generator `ξ` of degree `n`, the terms of `∑_{i<n} c_i ξ^i` have pairwise distinct valuations —
  the `i`-th is `n · addVal(c_i) + i`, distinct modulo `n` — so no cancellation is possible and
  the valuation of the sum is the minimum of the terms'. Consequences: a ball of the ring of
  integers is a box in power-basis coordinates, and at a radius divisible by `n` it is a cube.
  ⚠ Also not covered by the consumed contract, which gives the monogenic basis but not the
  valuations of a combination in it. This is the workhorse of Layers 2 and 3 and deserves its own
  name and API.

### Layer 1: quantitative Newton lifting over a complete discrete valuation ring

Stated for an arbitrary complete (`IsAdicComplete`) discrete valuation ring, since nothing here
uses the local field; the local-field case is an instance.

- **Newton iteration with an estimate.** If `addVal (F y₀) > 2 · addVal (F' y₀)`, the iteration
  `y ↦ y − F y / F' y` converges to a root `z` of `F` with
  `addVal (z − y₀) ≥ addVal (F y₀) − addVal (F' y₀)`, and `z` is the unique root in that ball.
  ⚠ This strictly refines Mathlib's `HenselianLocalRing`, which lifts a simple root modulo the
  maximal ideal and yields no distance bound; the estimate, not the existence, is what Layer 3
  consumes.
- **Local constancy of the root count.** For a monic `f` over `𝒪[K]`, separable over `K`, there is
  a threshold `T` such that every monic `g` with `g.coeff i − f.coeff i ∈ 𝓂[K]^T` for all `i` has
  exactly as many roots in `L` as `f` does, for every `L ∈ σ_K n`. The route is a Bézout
  certificate `U · f + V · f' = β` over `𝒪[K]` bounding the order of `f'` at every near-root
  uniformly, then Newton lifting in both directions.
- ⚠ **Not Krasner's lemma.** Mathlib's Krasner (`Analysis/Normed/Field/Krasner.lean`) is a
  normed-field statement about a *single* root generating an extension; what Layer 3 needs is a
  *count* that is uniform on a coefficient ball, which Krasner does not give. Keep the two apart
  and do not route this layer through the normed setting.

### Layer 2: lattices, index, and the Haar scaling law

Stated for a complete discrete valuation ring with finite residue field of cardinality `q`, for
the same reason.

- **The index of an image lattice.** For a matrix `M` over `𝒪[K]` with `Associated M.det (π^k)`,
  the quotient of the integer box `Fin n → 𝒪[K]` by its image under `M` has exactly `q^k`
  elements. Via `Submodule.quotientEquivPiSpan` (Smith normal form over the principal ideal ring
  `𝒪[K]`), the quotient splits into residue rings of the diagonal coefficients, whose product is
  associated to `M.det`.
- **The scaling law.** For the Haar measure of `Fin n → K` normalized on the integer box,
  `μ (M · S) = q^{−k} · μ S` for `S` the box or any ball — the non-archimedean analogue of
  `Measure.addHaar_image_linearMap`. ⚠ Prove it through lattice indices, not through uniqueness
  of Haar measure: the index route needs no second-countability or regularity side conditions, and
  the general-set form is not needed.
- **Boxes and balls.** The image lattice of a diagonal matrix is the coordinate box with `i`-th
  factor `π^{e i} · 𝒪[K]`, of volume `q^{−∑ e i}`; a ball is a translate of the lattice of a
  constant-radius box. With Layer 0's orthogonality this computes the volume of a ball of the ring
  of integers of `L` in power-basis coordinates, which is the only other volume the summit needs.

### Layer 3: the Eisenstein region and the parametrization

- **The Eisenstein region** `E_n ⊆ (Fin n → K)`: every coefficient in `𝓂[K]`, with the constant
  term of valuation exactly that of a uniformizer. Its measure is `q^{−n} · (1 − q^{−1})`.
- **Almost every Eisenstein polynomial is separable** ([Serre 1978, eq. (3)]): the non-separable
  locus is null. In equal characteristic this is where the inseparable polynomials are discarded,
  and it is the reason the count is over subextensions of `SeparableClosure K`.
- **The root count.** For `L ∈ σ_K n`, `rootCount L a` is the number of roots of the monic
  polynomial with coefficient vector `a` lying in `L`, counted with multiplicity. On the
  full-measure separable locus all multiplicities are `1`. Almost everywhere on `E_n`,
  `∑_{L ∈ σ_K n} rootCount L a = n`: an Eisenstein polynomial is irreducible, and each of its `n`
  roots generates exactly one member of `σ_K n`.
- **The local fibre count** ([Serre 1978, Lemma 1]): the cube of radius `π^ρ` around an Eisenstein
  generator `ξ` contains exactly one root of each nearby Eisenstein polynomial — Layer 1 applied
  on the region.
- **The integral of the root count** ([Serre 1978, Lemmas 2 and 3, eqs. (5)–(13)]): for each
  `L ∈ σ_K n`, `∫_{E_n} rootCount L = q^{−(d L + 1)} · (1 − q^{−1})`. The change of variables runs
  in power-basis coordinates: a ball of the ring of integers is the ideal generated by a suitable
  element, in coordinates the image lattice of the matrix of multiplication by it, whose
  determinant is that element's norm — so Layer 2 supplies the factor `q^{−d L}` with no Jacobian,
  no conjugates and no Vandermonde.

### Layer 4: the mass formulas

- **Theorem 1** ([Serre 1978, Thm. 1]): for `0 < n`, `∑' L : σ_K n, 1 / (q K) ^ c L = n` in
  `ℝ≥0∞`. Integrate the root-count identity of Layer 3 over `E_n` and divide by the measure of the
  region.
- **The finiteness dichotomy** ([Serre 1978, Rmk. 1°]): `σ_K n` is infinite if and only if `K` has
  equal characteristic `p` and `p ∣ n`. Both directions are targets. The forward direction follows
  from Theorem 1 together with the uniform bound `c L ≤ n · addVal(n)` outside the asserted case;
  the converse is an explicit family — the Eisenstein polynomials `X^n + π^m X + π` for `m ≥ 1`
  have `d = n · m`, pairwise distinct, hence generate infinitely many distinct members.
- **Convergence** ([Serre 1978, Rmk. 1°]): `Summable fun L : σ_K n => 1 / (q K : ℝ) ^ c L`, the
  real-valued restatement, meaningful precisely in the infinite case.
- **The orbit count** ([Serre 1978, Rmk. 3°]): for `L ∈ σ_K n`, the number of `M ∈ σ_K n` that are
  `K`-isomorphic to `L`, times `#Aut_K(L)`, is `n`. `L / K` is separable of degree `n`, so it has
  exactly `n` embeddings into `SeparableClosure K`; each image lies in `σ_K n` by Layer 0; and the
  embeddings with a given image form a torsor under `Aut_K(L)`.
- **Theorem 2** ([Serre 1978, Thm. 2]): for every `R` with `IsRepresentativeSet n R`,
  `∑' M : R, 1 / (#Aut_K(M) · (q K) ^ c M) = 1` in `ℝ≥0∞`. Theorem 1 regrouped along isomorphism
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

Layer 0 comes first and rests on the consumed contract. Layers 1 and 2 are independent of Layer 0
and of each other — quantitative Newton lifting and the lattice scaling law are general statements
about complete discrete valuation rings — so all three are parallel lanes, and the two general
ones can be built before any of the consumed material lands. Layer 3 needs 0–2; Layer 4 needs
Layer 3, except for the orbit count, which needs only Layer 0 and can be built early.

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
| 0 | `Defs.lean`, `UniformizerParam.lean` (orthogonality), `Second.lean` (invariance of `c`) |
| 1 | `RootLifting.lean` |
| 2 | `HaarScaling.lean` |
| 3 | `First.lean`, `UniformizerParam.lean` (the fibre count) |
| 4 | `First.lean`, `Second.lean`, `Finiteness.lean`, `Convergence.lean`, `Orbit.lean` |

The source's `EisensteinMonogenic.lean`, `Discriminant.lean` and `Tame.lean` prove material this
roadmap consumes rather than owns; they are evidence that the consumed contract is provable in
this setting, and belong with the roadmap that specifies it, not here.

Where this roadmap departs from the source:

- The source proves `IsAdicComplete 𝓂[K] 𝒪[K]` itself; that instance is now in Mathlib and is to
  be consumed, not carried.
- The source wraps `integralClosure ↥𝒪[K] ↥L` and its maximal ideal in project abbreviations; use
  Mathlib's spelling, and the consumed roadmap's, so the lemmas land where the rest of the
  integral-closure API lives.
- Layers 1 and 2 are stated in the source only for the local-field case they were needed in; this
  roadmap asks for them over an arbitrary complete discrete valuation ring (with finite residue
  field, for Layer 2), which is the generality their proofs already have.
- The source is organized as a frozen specification file paired with a development file that
  discharges it. That device does not transfer: in Tau Ceti the roadmap is what commits to a
  statement before its proof exists, and no `sorry` may land in `TauCeti/`.
