# Roadmap: Frobenius morphisms and finite-field points

This roadmap builds a scheme-level Frobenius library and the finite-field geometry used by étale cohomology and trace formulas. Its mathematical progression is

\[
\text{characteristic-}p\text{ schemes}
\longrightarrow
\text{absolute and relative Frobenius}
\longrightarrow
\text{finite-field descent and Galois Frobenius}
\longrightarrow
\text{rational points as fixed points}
\longrightarrow
\text{topological invariance of the étale site}.
\]

Direct roadmap dependency (Layer 7 only; Layers 0--6 have none):

```text
CohomologicalPointCounting/ConstructibleEtale
```

Suggested code home:

```text
TauCeti/AlgebraicGeometry/Frobenius/
```

Suggested Lean namespace for the Tau Ceti code (this roadmap's `Suggested.lean` uses `TauCetiRoadmap.CohomologicalPointCounting.FrobeniusGeometry`, per the family convention):

```text
TauCeti.AlgebraicGeometry
```

The Markdown roadmap is the definitive specification. `Suggested.lean` is a nonexhaustive prototype and should acquire compiled target declarations only when their prerequisite types can be stated without empty placeholders.

## Primary references and source-to-layer map

* The Stacks Project, Section 33.36, [Frobenii](https://stacks.math.columbia.edu/tag/0CC6): absolute Frobenius, Frobenius twists, and relative Frobenius.
* The Stacks Project, [étale morphisms and relative Frobenius](https://stacks.math.columbia.edu/tag/0EBS): the relative Frobenius of an étale morphism is an isomorphism.
* The Stacks Project, Section 59.45, [topological invariance of the small étale site](https://stacks.math.columbia.edu/tag/04DY).
* The Stacks Project, Chapter 64, Sections 64.2--64.3, [The Trace Formula](https://stacks.math.columbia.edu/tag/0F5P): arithmetic/geometric Frobenius conventions and the cohomological Frobenius action.
* SGA 5, Exposé XV, for the Frobenius conventions used in Lefschetz trace formulas.

Use the references as follows.

| Roadmap material | Main source |
|---|---|
| Absolute and relative Frobenius | Stacks, §33.36 |
| Frobenius and étale morphisms | Stacks, §41.14 |
| Universal-homeomorphism invariance | Stacks, §59.45 |
| Arithmetic and geometric Frobenius | Stacks, §§64.2--64.3; SGA 5 |
| Rational points as Frobenius fixed points | standard finite-field descent; Stacks, §64.3 |

## Standing conventions

### Characteristic

Let `p : ℕ` with `[Fact p.Prime]`. A scheme in characteristic \(p\) means a scheme whose local rings have characteristic \(p\). Build a reusable predicate or typeclass reflecting this intrinsic condition, together with the equivalent canonical structure morphism

\[
X\longrightarrow \operatorname{Spec}(\mathbf F_p).
\]

Do not define Frobenius only for an arbitrary scheme bundled over a chosen presentation of \(\mathbf F_p\); the absolute construction is intrinsic. The relative theory is stated for a chosen morphism \(X\to S\) between schemes in characteristic \(p\).

For a finite field \(k\) of cardinality \(q=p^a\), keep the field type and the equality \(|k|=q\) visible. Do not identify all finite fields of order \(q\) definitionally.

### Frobenius names

Use distinct names for:

* `absoluteFrobenius X p`, the scheme morphism \(F_X:X\to X\);
* `frobeniusTwist f p`, the \(S\)-scheme \(X^{(p/S)}\);
* `relativeFrobenius f p`, the map \(F_{X/S}:X\to X^{(p/S)}\);
* their \(a\)-fold or \(q\)-power iterates;
* arithmetic Frobenius in a finite-field absolute Galois group;
* geometric Frobenius, defined as its inverse.

The bare name `frobenius` is too ambiguous for exported declarations in this development.

### Actions on points and cohomology

Arithmetic Frobenius acts on \(\overline{\mathbf F}_q\) by \(x\mapsto x^q\). Geometric Frobenius is its inverse. The action on geometric points, the pullback induced by a scheme morphism, and the descent/Galois action on cohomology are different constructions. Prove conversion lemmas rather than treating them as definitional equalities.

### Iteration

All constructions must support every \(r\ge 0\), with simp lemmas for the zeroth iterate, successor iterate, addition of exponents, and \(q^r\)-power maps. The trace-formula roadmap requires every \(r\ge1\), not merely the base-field Frobenius.

## What Mathlib already has: consume

Before implementation, re-check Mathlib and open pull requests. The following foundations should be consumed rather than redefined.

* `Algebra.CharP` and ring-level Frobenius, including `frobenius` and its functoriality.
* finite fields, `ZMod p`, finite cardinalities, field embeddings, and finite-field automorphisms.
* schemes, affine schemes, spectra, scheme morphisms, fibre products, and base change.
* `AlgebraicGeometry.Etale`, `Finite`, `Integral`, `UniversallyInjective`, and the other morphism properties used to characterize universal homeomorphisms.
* big and small étale sites in `Mathlib/AlgebraicGeometry/Sites/Etale`.
* the small affine étale site and the sheaf equivalence supplied by `Mathlib/AlgebraicGeometry/Sites/AffineEtale`.
* geometric fibres and points of schemes.

Mathlib documents ring-level Frobenius but has no corresponding public scheme-level Frobenius package. This roadmap supplies that layer in Tau Ceti.

## What is missing: build here

The reusable missing library consists of:

1. an intrinsic characteristic-\(p\) scheme interface;
2. absolute Frobenius of schemes and its naturality;
3. Frobenius twists and relative Frobenius;
4. iterated and \(q\)-power Frobenius;
5. compatibility with affine schemes, products, fibre products, and base change;
6. integrality, radiciality, universal-homeomorphism, finite-type-over-a-perfect-field finiteness, and the étale/smooth relative-Frobenius theorems;
7. arithmetic and geometric Frobenius actions on algebraic closures and geometric points;
8. finite-field descent and the fixed-point description of rational points;
9. topological invariance of the small étale site under universal homeomorphisms;
10. specialization of that invariance to absolute and relative Frobenius.

## The build, in layers

### Layer 0: schemes in characteristic \(p\)

Define the intrinsic condition that every stalk of \(\mathcal O_X\) has characteristic \(p\). Prove equivalent formulations using affine opens and coordinate rings.

Build the canonical morphism

\[
X\longrightarrow \operatorname{Spec}(\mathbf F_p)
\]

and prove uniqueness. Conversely, prove that an \(\mathbf F_p\)-scheme is intrinsically in characteristic \(p\). Package restriction to open subschemes, products, fibre products, and base change.

The API must make it possible to obtain `CharP` instances on every affine coordinate ring without repeating local arguments.

**Acceptance criterion:** the affine equivalence between intrinsic scheme characteristic and ring characteristic is available as simp-friendly lemmas.

### Layer 1: absolute Frobenius

For a scheme \(X\) in characteristic \(p\), construct

\[
F_X:X\longrightarrow X
\]

whose underlying map of topological spaces is the identity and whose map on the structure sheaf is the \(p\)-power map.

Pin the construction so that on an affine scheme it agrees with

\[
\operatorname{Spec}(A)\xrightarrow{\operatorname{Spec}(a\mapsto a^p)}
\operatorname{Spec}(A).
\]

Prove:

* identity on points and on the underlying topological space;
* compatibility with restriction to opens;
* naturality for morphisms of schemes in characteristic \(p\):
  \[
  f\circ F_X=F_Y\circ f;
  \]
* compatibility with composition and isomorphisms;
* compatibility with products and fibre products over \(\mathbf F_p\);
* the corresponding natural transformation on the category of schemes in characteristic \(p\).

Prove, using Mathlib's morphism-property vocabulary:

* absolute Frobenius is integral and radicial for every scheme in characteristic \(p\);
* absolute Frobenius is a universal homeomorphism;
* if \(X\) is locally of finite type over a perfect field of characteristic \(p\), then absolute Frobenius is finite.

The finiteness theorem is not stated for an arbitrary characteristic-\(p\) scheme.

### Layer 2: relative Frobenius and Frobenius twists

For \(f:X\to S\) in characteristic \(p\), define

\[
X^{(p/S)}=X\times_{S,F_S}S
\]

as an \(S\)-scheme and construct the relative Frobenius

\[
F_{X/S}:X\longrightarrow X^{(p/S)}.
\]

Build:

* the two projections and the structure morphism of the twist;
* the universal-property characterization of `relativeFrobenius`;
* the factorization of absolute Frobenius through the relative Frobenius and the projection;
* compatibility with base change in \(S\);
* naturality in morphisms over \(S\);
* compatibility with products over \(S\);
* compatibility with affine relative Frobenius;
* transport across isomorphisms of bases and schemes.

Prove that the relative Frobenius \(F_{X/S}\) of any morphism of characteristic-\(p\) schemes is integral, radicial, and a universal homeomorphism. Prove that the relative Frobenius of an étale morphism is an isomorphism. If \(X\to S\) is smooth of pure relative dimension \(d\) in characteristic \(p\), prove that \(F_{X/S}\) is finite locally free of rank \(p^d\). Also state and prove the componentwise rank form when the relative dimension is only locally constant.

The twist is a real object in the API. Do not replace it by an equality available only over a perfect base.

### Layer 3: iterated and \(q\)-power Frobenius

Define the \(r\)-fold absolute Frobenius and the iterated relative twist. Prove coherence equivalences between iterating \(p\)-Frobenius and using \(p^r\)-power Frobenius.

For a finite field \(k\) of cardinality \(q=p^a\), define the \(q\)-power Frobenius of a \(k\)-scheme. Prove that it is a morphism over \(k\), whereas the single \(p\)-power absolute Frobenius need not be a \(k\)-morphism when \(k\ne\mathbf F_p\).

Build simp lemmas for:

\[
F^{0}=\operatorname{id},\qquad
F^{r+s}=F^r\circ F^s,
\]

and for induced maps on points and global sections.

### Layer 4: Galois Frobenius and finite-field descent

Let \(k=\mathbf F_q\) and choose an algebraic closure \(\bar k\). Construct the continuous automorphism

\[
\operatorname{Frob}^{\mathrm{arith}}_q:\bar k\to\bar k,
\qquad x\mapsto x^q,
\]

and geometric Frobenius as its inverse.

Develop:

* powers and fixed fields;
* the fixed-field theorem
  \[
  \bar k^{\langle(\operatorname{Frob}^{\mathrm{arith}}_q)^r\rangle}
  =\mathbf F_{q^r};
  \]
* independence, up to the canonical conjugacy/equivalence supplied by algebraic closures, of the chosen model of \(\bar k\);
* the induced action on \(X(\bar k)\) for a \(k\)-scheme \(X\);
* compatibility with maps of \(k\)-schemes, products, and base change.

State the action on points in a conventionally transparent form. The user of the API should be able to see whether Frobenius acts on coordinates, on the source field of a point, or by precomposition.

### Layer 5: rational points as fixed points

For every \(r\ge1\), prove a natural equivalence

\[
X(\mathbf F_{q^r})
\simeq
\operatorname{Fix}
\left((\operatorname{Frob}^{\mathrm{arith}}_q)^r
      \text{ on }X(\bar k)\right).
\]

Give the corresponding statement with geometric Frobenius, using inverse powers explicitly. Prove naturality in \(X\) and compatibility with products and finite coproducts.

Prove that the rational-point type of a finite-type scheme over a finite field is finite, by reduction to a finite affine cover and finiteness of solutions in finite coordinate rings, and package it as a `Finite`/`Fintype` instance in the Mathlib-aligned form.

Build the counting API used downstream:

```text
Scheme.rationalPoints
Scheme.numberOfRationalPoints
```

with names aligned to Mathlib's scheme-point API. Define the cardinality in Mathlib's idiom, as `Nat.card` of the point type — total, with value `0` in the infinite case — and put the finiteness hypotheses on the lemmas rather than on the definition.

### Layer 6: topological invariance of the small étale site

For a universal homeomorphism \(f:X\to Y\), prove that base change induces an equivalence

\[
Y_{\acute et}\simeq X_{\acute et}
\]

of small étale sites, compatible with coverings. Lift this to an equivalence of sheaf categories for every target category satisfying the hypotheses required by Mathlib's sheaf API.

Prove compatibility with:

* constant sheaves;
* module-valued sheaves;
* geometric stalks;
* global sections and sheaf cohomology;
* composition of universal homeomorphisms;
* base change.

Specialize to absolute Frobenius and relative Frobenius, both universal homeomorphisms by Layers 1 and 2. This supplies the precise site-theoretic form of Frobenius invariance used by downstream roadmaps.

The theorem should be generic for universal homeomorphisms. A Frobenius-only proof would duplicate a broadly useful result.

### Layer 7: convention bridge for cohomology

This layer consumes the finite-coefficient cohomology functoriality of `ConstructibleEtale` — the family dependency graph records this edge; Layers 0--6 are independent of it. Add the conversion interface relating:

1. pullback by the scheme-theoretic \(q\)-Frobenius;
2. the descent action of arithmetic Frobenius on the geometric fibre;
3. the action called geometric Frobenius in trace-formula statements.

Prove the inverse relation explicitly. Do not make this layer a dependency of the earlier geometric construction; it is the bridge consumed by `EllAdicRealization` and `TraceFormula`.

**Summit:** for a scheme over \(\mathbf F_q\), the fixed-point and étale-invariance APIs use one pinned convention and convert without informal inversions.

## Worked examples and acceptance criteria

1. For \(A\) an \(\mathbf F_p\)-algebra, the scheme Frobenius of \(\operatorname{Spec}A\) agrees with `Spec.map` of the ring Frobenius.
2. For \(\mathbf A^n_{\mathbf F_q}\), the \(q\)-power Frobenius raises every coordinate to the \(q\)-th power.
3. The relative Frobenius of an étale \(S\)-scheme is an isomorphism.
4. The \(\mathbf F_{q^r}\)-points of \(\operatorname{Spec}\mathbf F_{q^m}\) are empty unless \(m\mid r\); when \(m\mid r\), they are the \(m\) embeddings of \(\mathbf F_{q^m}\) into \(\mathbf F_{q^r}\) over \(\mathbf F_q\).
5. \(\mathbf A^n(\mathbf F_{q^r})\) is identified with the fixed points of the \(r\)-th Frobenius action on \(\mathbf A^n(\bar{\mathbf F}_q)\).
6. Pullback by absolute Frobenius induces an equivalence of small étale sheaf categories.

A layer is not complete if the headline construction exists without ordinary simp, naturality, base-change, isomorphism-invariance, and iteration lemmas.

## Design notes for Lean

### Use natural transformations

Absolute Frobenius is natural. Package the naturality once rather than proving unrelated commuting-square lemmas for every consumer.

### Keep twists explicit

Avoid choosing an identification \(X^{(q)}\cong X\) merely because the finite base field is perfect. Define the canonical twist and separately construct the canonical equivalence available in the finite-field setting. This prevents ambiguity in relative statements.

### Separate scheme maps from Galois automorphisms

A scheme endomorphism and an element of an absolute Galois group live in different categories and induce actions contravariantly in different ways. The names and lemmas should preserve that distinction.

### Reuse morphism properties

Statements such as “Frobenius is finite” or “Frobenius is a universal homeomorphism” should use Mathlib's morphism-property typeclasses, so all existing stability lemmas apply.

## Scope boundaries

The following are not targets of this roadmap:

* étale cohomology with constructible coefficients, owned by `ConstructibleEtale`;
* proper and smooth base change, owned by `EtaleBaseChange`;
* compact support, owned by `CompactSupport`;
* traces and Grothendieck--Lefschetz, owned by `TraceFormula`;
* crystalline Frobenius;
* weights, purity, or eigenvalue bounds;
* perfection of schemes as a general theory beyond what the Frobenius API uses.

## Completion criterion

This roadmap is complete when:

* the intrinsic characteristic-\(p\) scheme interface is usable on affine opens and stalks;
* absolute, relative, iterated, and \(q\)-power Frobenius are constructed with complete functorial and base-change APIs;
* arithmetic and geometric Frobenius actions are distinct and connected by explicit inverse lemmas;
* \(\mathbf F_{q^r}\)-points are naturally equivalent to the appropriate Frobenius fixed points for every \(r\ge1\);
* universal homeomorphisms induce equivalences of small étale sites and sheaf categories;
* the Frobenius specializations of that equivalence are proved;
* the worked examples pass without application-specific definitions;
* the implementation in Tau Ceti contains no `sorry`.
