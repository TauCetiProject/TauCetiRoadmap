# Roadmap: elliptic curves

Mathlib knows what an elliptic curve *is*. It has the Weierstrass model
(`WeierstrassCurve R`, its `a`-invariants, `b`/`c₄`/`c₆`/`Δ`/`j`, and the elliptic-curve
condition `WeierstrassCurve.IsElliptic`, i.e. `IsUnit Δ`), the group law on the points
(`WeierstrassCurve.Affine.Point` with its `AddCommGroup`, plus the projective and Jacobian
models), variable changes and normal forms, the division polynomials and elliptic divisibility
sequences, and reduction over a discrete valuation ring. What it does **not** have is much of the
further theory that every graduate student in the area learns: the **isogenies** and the
**Weil pairing**, the number of points over a finite field and the **Hasse bound**, the fine
behaviour under reduction (the filtration `E₁(K) ⊆ E₀(K) ⊆ E(K)`, the conductor, **Tate's
algorithm**), the **Tate curve**, the **twists**, the **Mordell–Weil theorem**, and **Selmer
groups and Sha**. None of that is upstream.

This roadmap builds that theory. The mathematics is standard, and the layers cite J. H. Silverman,
*The Arithmetic of Elliptic Curves* (AEC, GTM 106) and *Advanced Topics* (ATAEC, GTM 151), and
other sources for definiteness — but the specification is a **thorough, Mathlib-style API** for
each object, not a transcription of any one book. The theorem we can land almost immediately is the
**Hasse bound** over `𝔽_q` (AEC V.1), from existing sorry-free work; the intervening theory is what
it and the later layers rest on.

**The function field is the foundation.** An elliptic curve is more than a Weierstrass equation
and a group law on its points: Layers 1–3 need honest *morphisms* — isogenies, Frobenius, the
dual — with degrees, separability, and kernels. The classical dictionary supplies them without
leaving the commutative algebra Mathlib already has: a smooth projective curve with its
nonconstant morphisms is equivalent, contravariantly, to its function field with the `K`-algebra
embeddings (AEC II.2.4). Mathlib holds the function-field side of this dictionary for Weierstrass
curves — the coordinate ring `Affine.CoordinateRing` (`AdjoinRoot W.polynomial`, an integral
domain) and the function field `Affine.FunctionField` (its fraction field) — and the group law on
the points is *already proved* through that algebra, as the ideal class group of the coordinate
ring (Angdinata–Xu, Mathlib's `Point.toClass`). So an **isogeny is defined as a function-field
embedding, backwards**, its pointedness expressed through **integrality over the coordinate
rings**:

```lean
/-- A contravariant pullback between the function fields of two affine Weierstrass curves. -/
abbrev FunctionFieldPullback (W₁ W₂ : Affine F) :=
  W₂.FunctionField →ₐ[F] W₁.FunctionField

/-- The source point at infinity maps to the target point at infinity. -/
def FunctionFieldPullback.MapsInfinity (pullback : FunctionFieldPullback W₁ W₂) : Prop :=
  letI := pullback.coordinateRingAlgebra
  ∀ x : W₁.CoordinateRing,
    algebraMap W₁.CoordinateRing W₁.FunctionField x ∈
      integralClosure W₂.CoordinateRing W₁.FunctionField

/-- The function-field data of an isogeny. -/
structure Isogeny (W₁ W₂ : Affine F) where
  pullback : FunctionFieldPullback W₁ W₂
  mapsInfinity : pullback.MapsInfinity
```

— D. Angdinata's definition and development, shared with this roadmap ahead of its mathlib
PRs (this roadmap **coordinates with that work**, it does not fork it; `coordinateRingAlgebra`
is the `W₂.CoordinateRing`-algebra structure on `W₁.FunctionField` through `pullback`).
`pullback` is the contravariant function-field map; `MapsInfinity` demands that every affine
function of `W₁` be **integral** over the pulled-back coordinate ring of `W₂`. That is
exactly `φ(O₁) = O₂`: the integral closure is the ring of functions regular away from the
*whole fibre* `φ⁻¹(O₂)` — which contains every kernel point, not only `O₁` — and asking
`W₁.CoordinateRing`, the functions regular away from `O₁`, to sit inside it says precisely
that `O₁` lies in that fibre. No places in the statement. Why this is the right foundation,
and a cheap one:

- **Nonconstancy is free.** A `K`-algebra map between the function fields is injective, and
  automatically **finite** (both sides have transcendence degree `1` over `K`), so an `Isogeny`
  is a *nonzero* isogeny by construction. The zero map is adjoined only where hom-groups need it
  (Layer 1).
- **Degree and separability are field theory.** `deg φ` is `Module.finrank` of
  `W₁.FunctionField` over the pulled-back copy of `W₂.FunctionField`; the separable and
  inseparable degrees, and separability of `φ`, are those of the field extension — Mathlib's
  existing `FieldTheory`, not a flatness theory of morphisms. Multiplicativity of `deg` under
  composition is the finrank tower formula.
- **Frobenius is a one-liner.** Over `𝔽_q`, `f ↦ f ^ q` is an `𝔽_q`-algebra endomorphism of the
  function field satisfying `MapsInfinity` (the coordinates are integral over their `q`-th
  powers): the Frobenius isogeny `π_q`, purely inseparable of degree `q` — Layer 3's engine.
- **`[n]` is division polynomials.** For `n ≠ 0`, multiplication-by-`n` is an isogeny of
  degree `n²` (in characteristic `p ∣ n` its inseparable part is a Frobenius power): the
  pullback is pinned by the division-polynomial multiplication formula, already proved at the
  point level in the Lutz–Nagell provenance through J. Xu's work
  ([mathlib #13782](https://github.com/leanprover-community/mathlib4/pull/13782) /
  `ZSMul.lean`) — the mathlib-track anchor Layer 1 consumes.
- **Points come along, with the group law for free.** The **intermediate ring** — the integral
  closure of `W₂.CoordinateRing` in `W₁.FunctionField`, the normalization `mapsInfinity`
  names — receives *both* coordinate rings, is **module-finite** over `W₂.CoordinateRing`
  (inseparable case and Frobenius included) and integrally closed. Extending an ideal of
  `W₁.CoordinateRing` into it and taking the **relative ideal norm** down to
  `W₂.CoordinateRing` gives a homomorphism of class groups (`pushClass`), and conjugating by
  the class-group description of the point group (`toClassEquiv` — injectivity is Mathlib's,
  surjectivity the Layer-0 anchor) yields the induced map `toPointHom : W₁.Point →+ W₂.Point`
  — additive **by construction**: the group law comes along through the *same* algebra that
  proves Mathlib's group law, with no separate rigidity theorem.
- **The differential calculus is upstream.** The invariant differential is an element of
  Mathlib's Kähler module `Ω[W.FunctionField⁄K]`, and `φ^*` is `KaehlerDifferential.map` along
  `pullback`; separability of `φ` is `φ^*ω ≠ 0`.

The definition itself needs nothing Mathlib lacks — `CoordinateRing`, `FunctionField`, and
`integralClosure` are upstream, so the structure is **seeded verbatim in `Suggested.lean`**,
together with its degree (`Module.finrank` through `pullback`), automatic finiteness, the
point map, and the Frobenius isogeny. Better: this entire opening theory — finiteness
(inseparable included), the intermediate ring's finiteness and normality, `pushClass`,
`toPointHom`, and the Layer-0 `toClass` surjectivity — is already **proven in the shared
upstream development** (provenance), so those seeds carry ⚠ *mathlib-track* status: built
here only until its PRs land. What the *theory* needs beyond that, and Mathlib lacks, is the
**places-and-divisors dictionary** of the function field — the place at infinity, the place
of an affine point, degrees, the fibre-counting identity, divisors. That is Layer 0, and it
is valuation theory over the existing coordinate ring, not geometry.

**No schemes.** Silverman's isogenies are morphisms of curves-as-varieties, and Mathlib has
scheme-track work in flight that will eventually provide exactly that: the affine scheme of an
elliptic curve ([mathlib #25983](https://github.com/leanprover-community/mathlib4/pull/25983)),
the group-scheme structure
([mathlib #35151](https://github.com/leanprover-community/mathlib4/pull/35151)), and a
modular-curves project further down that road. This roadmap deliberately neither builds on,
blocks on, nor duplicates any of it: every object here is a Weierstrass equation, its point
group, its function field. When the scheme-level curve arrives, the anti-equivalence of curves
and function fields identifies these isogenies with the scheme morphisms; that comparison — like
the **Néron models** that live natively in the scheme world — belongs to a future scheme-facing
roadmap, not this one.

**Out of scope.** The elliptic curve as a scheme, group schemes, and **Néron models** — the
scheme-facing story above, including the comparison of these isogenies with scheme morphisms.
Modular curves, moduli, and the representability questions around them are a separate project.
**Complex uniformisation** `ℂ/Λ ≅ E(ℂ)` is left out: its honest form is analytic, not
arithmetic — it needs a complex-manifold structure on `E(ℂ)`, a substantial and orthogonal
development — and belongs on a dedicated complex-analytic roadmap. The **Birch–Swinnerton-Dyer
conjecture** is out: its statement needs the analytic continuation of `L(E, s)`, which Mathlib
does not have. (The *arithmetic* BSD quotient **over `ℚ`**, assuming `Ш` finite, is a marked
stretch milestone in §Layer 7; the conjecture is not — nor is the general-number-field
quotient, whose period honestly wants complex uniformisation.) Everything else — through
Mordell–Weil and Selmer/Sha — is in.

Suggested home: `TauCeti/AlgebraicGeometry/EllipticCurve/` (mirroring Mathlib's layout).

## Standing conventions

- **The object is `WeierstrassCurve K` with `[W.IsElliptic]`, together with its function
  field.** Mathlib has *no* standalone `EllipticCurve` type; an elliptic curve is a Weierstrass
  curve whose discriminant is a unit
  ([`WeierstrassCurve.IsElliptic`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.html)).
  Its morphism theory lives on `W.toAffine.FunctionField` (Mathlib's
  `FractionRing W.CoordinateRing`), and the point group `W.toAffine.Point` is identified with the
  function field's degree-`1` places by the Layer-0 dictionary. Do not introduce a bundled
  `EllipticCurve` structure where a `WeierstrassCurve` with the `IsElliptic` instance says the
  same thing.
- **Points are `W.toAffine.Point`.** The group of points is Mathlib's
  `WeierstrassCurve.Affine.Point` — the nonsingular affine points with the point at infinity as the
  identity — with its `AddCommGroup` instance (the ideal-class-group route of Angdinata–Xu). Over a
  field this group is available with no `IsElliptic` hypothesis; the elliptic-curve hypotheses enter
  through the theorems, not the group. Reuse it and the projective/Jacobian models. ⚠ Upstream may
  make `Projective` the default point API — the formulae need no field, and
  [mathlib #25991](https://github.com/leanprover-community/mathlib4/pull/25991) generalises the
  nonsingularity API as a first step (review note). The milestones here are statements about the
  abstract group and survive that migration; only the seeds' spellings (`W.toAffine.Point`) would
  update.
- **Isogenies are function-field embeddings, backwards.** An isogeny `φ : W₁ → W₂` is the
  structure above: a `pullback : FunctionFieldPullback W₁ W₂` together with
  `mapsInfinity` — integrality of `W₁.CoordinateRing` over the pulled-back
  `W₂.CoordinateRing`, i.e. `φ(O₁) = O₂` with no places in the statement (the fibre over
  `O₂` may, and for nontrivial kernels does, contain other points). Every such map is
  injective and automatically **finite**, so an `Isogeny` is a *nonzero* isogeny by
  construction; `deg φ` is `Module.finrank`, and (in)separability is that of the field
  extension. The zero map is not an `Isogeny`: hom-groups adjoin it explicitly (§Layer 1), and
  no statement quantifies over "isogenies including zero" implicitly. The induced map on
  `Point` is `toPointHom`, through the class group (§Layer 1); the place dictionary (§Layer 0)
  is its geometric reading.
- **`E[N]` is `Submodule.torsionBy ℤ E N`**, and the Weil pairing `e_N` is an additive **bilinear**
  map into `Additive (rootsOfUnity N K)` — `ℤ`-bilinear, valued in the `N`-th roots of unity, over
  **any** field with no closure hypothesis — whose load-bearing API is **functoriality under change
  of field**. Use [`Submodule.torsionBy`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Module/Torsion/Basic.html),
  `ZMod N`, `rootsOfUnity`/`Nˣ`, `Additive`, not private versions. (Where the `ZMod N`-module
  structure on `E[N]` is needed, Mathlib's `AddSubgroup.torsionBy` — its `A[n]` notation, reducibly
  the same subgroup — carries it via `AddSubgroup.torsionBy.zmodModule`.) Mathlib already has
  `n`-torsion of a general abelian group with a scoped `A[n]` notation
  (`Mathlib/Algebra/Module/Torsion/Basic.lean`, verified at the pin): displayed torsion
  subgroups **use that notation**; never introduce a private one.
- **Pin the base per layer; never over-generalise.** An **arbitrary** field and its **separable**
  closure for the Galois theory of torsion (III) — no perfectness assumed — a **finite** field for
  Hasse (V), and a **number field** for Mordell–Weil and Selmer/Sha (VIII–X). Layer 4 splits in
  two: a **DVR** (complete or Henselian where a statement needs it, residue-field hypotheses per
  result) for the reduction filtration, Kodaira types, conductors, and Tate's algorithm
  (VII, ATAEC IV), and a **complete rank-1 valued** field — not necessarily discrete, e.g. `ℂ_p` —
  for the Tate curve (ATAEC V). One hypothesis does not serve both: `ℂ_p` is nondiscretely valued,
  with no minimal equations and no Tate's algorithm. ⚠ For FLT-facing statements the base is often
  a **valuation** field (e.g. `n`-torsion of a curve with good reduction over a `p`-adic field is
  unramified when `p ∤ n`); state those over valuation fields.
- **Sources, not a single specification.** Each milestone builds the full basic theory of its
  objects, cites AEC/ATAEC (and other references) for the mathematics, but no one book is the spec:
  Silverman does not develop Mathlib-style API, does the Tate curve in less generality than we want,
  and does quadratic twists only in `char ≠ 2` (X.3 Example 2.4), which we do not. Where existing
  Lean work proves a milestone, that is provenance (final section), never the standard it is judged
  against.
- **Mathlib-track material is built here, then deduplicated.** Several objects below are
  expected to land in Mathlib directly — some from this roadmap's reviewers' own in-flight
  work: the division-polynomial `[n]`-formulas, the structure of `E[N]`, the Tate module,
  Tate's algorithm with the conductor exponent and local index, the isogeny opening theory
  itself — including `toClass` surjectivity — through the Angdinata development, and the
  arithmetic Selmer groups of number fields (the `K(S, n)` finiteness, Stoll's upstreaming
  target). Waiting would serialise the
  roadmap behind upstream timelines, so the policy agreed on review is: **build them here when
  a layer needs them, and swap in the upstream version — deleting the duplication — the moment
  it lands.** The ⚠ *mathlib-track* tags below and the provenance section record what is in
  flight where.

## What Mathlib already has (consume)

This is the foundation the roadmap builds on; it is consumed, not rebuilt.

- **The Weierstrass model and its invariants.** `WeierstrassCurve R`, the `a`-invariants,
  `b₂`/`b₄`/`b₆`/`b₈`, `c₄`/`c₆`, `Δ`, `WeierstrassCurve.j`, `WeierstrassCurve.IsElliptic`, the
  `VariableChange` group and its action, the normal forms, `ofJ` (in `ModelsWithJ.lean`), and base change
  `WeierstrassCurve.baseChange`
  (`Mathlib/AlgebraicGeometry/EllipticCurve/{Weierstrass,VariableChange,NormalForms,ModelsWithJ}.lean`).
- **The group law, through the class group.** `WeierstrassCurve.Affine.Point` and its
  `AddCommGroup` (`.../Affine/Point.lean`), with the projective and Jacobian models
  (`.../Projective/*`, `.../Jacobian/*`). The proof is the ideal-class-group route of
  Angdinata–Xu, and after the function-field pivot its infrastructure is load-bearing API, not an
  implementation detail: the coordinate ring `Affine.CoordinateRing` (`AdjoinRoot W.polynomial`,
  an integral domain), the function field `Affine.FunctionField` (its fraction field), and the
  injective class-group map `Point.toClass` — Layer 0 is built directly on these.
- **Division polynomials and elliptic divisibility sequences.** `WeierstrassCurve.Ψ`, `Φ`, `ψ`
  (`.../DivisionPolynomial/*`) and the elliptic-divisibility-sequence development
  (`Mathlib/NumberTheory/EllipticDivisibilitySequence.lean` — cited by file: the sequence
  predicates' names are in flux upstream (review note), so the roadmap does not pin them).
- **Formal group laws.** One-dimensional formal group laws over a commutative ring —
  associativity and units, inverses, the additive and multiplicative laws, and the group
  instance on evaluation ideals (`Mathlib/RingTheory/FormalGroup/Basic.lean`, W. Zou). Layer 1's
  `Ê` is built as an *instance* of this API (the elliptic formal group law from the expansion at
  `O`), not as a parallel formal-group theory.
- **Reduction over a DVR.** The good/multiplicative/additive trichotomy, minimal models, the
  reduction predicates `HasGood/Multiplicative/SplitMultiplicative/AdditiveReduction`, and
  `WeierstrassCurve.minimal` (`.../EllipticCurve/Reduction.lean`).
  ⚠ Mathlib states these only over a **DVR** — the right base for Layer 4's Tate's-algorithm
  strand, which stays there. But multiplicative/split reduction is also wanted over **rank-1
  valued** fields (so one can speak of `E/ℂ_p`, needed for `p`-adic analysis), where the valuation
  is not discrete; the agreed target shape (review) re-founds the
  reduction predicates over **an arbitrary ring with a valuation** — no fraction field in the
  definitions at all — with the DVR and valued-field statements derived; that refactor is an
  **upstream prerequisite** for Layer 4's Tate-curve strand, flagged here.
- **Heights and the `L`-function definition.** `Mathlib/NumberTheory/Height/*`,
  `.../Height/EllipticCurve.lean` (the quasi-quadraticity bound), and `.../EllipticCurve/LFunction.lean`.
- **Field theory and valuation theory.** Finite extensions and `Module.finrank`, separable and
  purely inseparable extensions with `Field.finSepDegree`, Kähler differentials
  (`Ω[F⁄K]`, `KaehlerDifferential.map`), and the valuation/`ValuationSubring` substrate on which
  Layer 0's places are built.
- **Continuous cohomology and the Weierstrass `℘`-function.** Continuous cohomology of
  topological groups (`Mathlib/Algebra/Category/ContinuousCohomology/`, E. Xie) — Layer 7's
  substrate, itemised there — and the Weierstrass `℘`-function
  (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`, A. Yang), which nothing on
  this roadmap's critical path consumes (complex uniformisation is out of scope) but which the
  complex-analytic successor — including the general-number-field BSD period of §Layer 7 —
  will; recorded so neither is rebuilt.

What is *not* here is the roadmap: places and the divisor calculus, isogenies and the dual, the
Weil pairing and the Tate module, the finiteness
and count of `E(𝔽_q)`, the Hasse bound, the reduction filtration on points and Tate's algorithm,
the Tate curve, the twists, the Mordell–Weil theorem, and Selmer/Sha.

## What is missing (build here)

`Suggested.lean` pins the load-bearing milestones that are expressible against the pinned Mathlib
as `sorry`-targets — and, because the isogeny definition needs no new API, the **`Isogeny`
structure itself, verbatim**, with its degree defined outright and its automatic finiteness,
positivity, and the Frobenius isogeny seeded (Layer 1). The other seeds: the Layer-0
**class-group anchor** — Mathlib's `Point.toClass` is surjective,
so the point group *is* the ideal class group (`toClass_surjective`) — `[n]`-surjectivity for `n`
invertible in `K` (Layer 1), the `N`-torsion `E[N] ≅ (ℤ/N)²` — exposed as a free rank-`2`
`ZMod N`-module — and the bilinear **Weil pairing** (Layer 2), the finiteness of `E(𝔽_q)` and the
**Hasse bound** as the integer inequality `a_q² ≤ 4q` (Layer 3), the **quadratic twist** and the
split-multiplicative-reduction theorem (Layer 5), and the **Mordell–Weil theorem**
`AddGroup.FG (E K)` (Layer 6). The layers whose central objects are new *types* — the places of
the function field (Layer 0), the hom-group, dual isogeny, and formal group (Layer 1), the
Kodaira type (Layer 4), and the Selmer/Sha groups (Layer 7) — are specified in the narrative
below and built there, not pinned here as `sorry`-typed placeholder types.

---

## The build, in layers

The ordering is the dependency order.

### Layer 0: the function field, places, and divisors

The foundation: the dictionary between the point group Mathlib has and the function field Mathlib
also has. ⚠ **Scope, after the integral-closure architecture** (review: "do we actually need
this?"): the isogeny *type*, the induced point map (`pushClass`/`toPointHom`), and even kernel
counting no longer require places — the intermediate ring is locally free of rank `deg φ` over
the Dedekind coordinate ring, so fibre counts are `finrank` plus translation (the place-free
alternate, recorded in Layer 1). What still consumes this layer, and why it stays: the
**divisor construction of the Weil pairing** (Layer 2's functions with divisor `N(P) − N(O)`),
the **equivalence with the literature definition** (the place at `O₁` restricting to the place
at `O₂` is the comparison contract's engine), **ramification bookkeeping** (the
separable-⟹-unramified milestone in its `e_w = 1` form — equivalently étaleness of the
intermediate ring), and the **class-group anchor** below. Everything here is commutative
algebra over `Affine.CoordinateRing`; the design is coordinated with Angdinata's in-flight
upstream work, whose interface this layer follows.

- **Places.** The places of `W.FunctionField` over `K` — the valuation-theoretic points of the
  smooth projective curve (Stichtenoth I.1). The affine places are the maximal ideals of the
  coordinate ring (for elliptic `W` a Dedekind domain — itself a worthwhile lemma); one further
  place, **`W.infinityPlace`**, sits where `x` and `y` have their poles (`ord_∞ x = −2`,
  `ord_∞ y = −3`, residue field `K`). API: `ord_v`, uniformisers, residue fields, the **degree**
  `deg v` (the residue finrank), evaluation of functions away from their poles. The
  implementation (maximal ideals, valuation subrings, …) is left to the upstream coordination;
  the interface here is what the later layers consume.
- **`inducedPlace`.** The place of `F₂` under a place of `F₁`, along a `K`-algebra map
  `F₂ →ₐ[K] F₁`: restriction of the valuation, with ramification index `e` and residue degree
  `f`; functoriality (`id`, `comp`); and the **fundamental identity** `Σ_{w ∣ v} e_w · f_w = [F₁ : F₂]`
  (Stichtenoth III.1.11) — which counts geometric fibres of isogenies **once Layer 1's
  separable-⟹-unramified milestone supplies `e_w = 1`**: over a separably closed field the
  identity alone gives only `Σ e_w = deg`, and a separable extension of function fields can
  still ramify at individual places (Layers 1–3).
- **The point–place dictionary.** For elliptic `W`, `W.toAffine.Point` is in bijection with the
  **degree-`1` places**: `O ↦ infinityPlace`, and an affine nonsingular `(x₀, y₀) ↦` the maximal
  ideal `(X − x₀, Y − y₀)`. This is the bridge every later layer rides. (Stated for elliptic
  `W`; singular Weierstrass curves are not this roadmap's business.)
- **Divisors and the class-group anchor.** The divisor group on places; `deg`; `div f` for
  `f ≠ 0` with `deg (div f) = 0`; and the identification of Mathlib's class-group group law with
  the degree-`0` divisor class group: `Point.toClass` is injective upstream, and the
  **surjectivity milestone** (seeded, `toClass_surjective`) makes the point group *the whole*
  ideal class group — whence the principal-divisor characterisation (`Σ nᵢ Pᵢ` is principal iff
  `deg = 0` and `Σ [nᵢ] Pᵢ = O`, AEC III.3.4–5) rides on the group law Mathlib already proved,
  with no Riemann–Roch anywhere. ⚠ *Mathlib-track*: the shared upstream `CoordinateRing`
  split-out proves `Point.toClass_surjective` and packages `toClassEquiv` — with **no**
  ellipticity hypothesis — so the seed is consumed and deduplicated when that lands.

### Layer 1: isogenies, the dual, the invariant differential, and formal groups (AEC II.2, III.4–6, IV)

- **The isogeny type** (seeded verbatim, with `Isogeny.degree` defined outright; ⚠
  *mathlib-track* — this whole bullet is proven in the shared upstream development, consumed
  and deduplicated when its PRs land). The structure of the foundations section: `pullback`
  and `mapsInfinity`. First theory: automatic injectivity and **finiteness**
  (`Isogeny.finiteDimensional`, seeded — a nonconstant map of one-variable function fields is
  finite, the inseparable case included), `deg φ ≥ 1` (seeded), the separable and inseparable
  degrees, identity and composition with `deg (ψ ∘ φ) = deg ψ · deg φ` — the tower formula;
  under the scheme definition this was half the hard core, here it is field theory.
- **The intermediate ring and the induced map on points.** The integral closure of
  `W₂.CoordinateRing` in `W₁.FunctionField` — geometrically, the functions regular away from
  the fibre `φ⁻¹(O₂)` — receives both coordinate rings, is **module-finite** over
  `W₂.CoordinateRing` and **integrally closed** (both proven upstream, Frobenius included).
  Ideal extension into it followed by the **relative ideal norm** down to
  `W₂.CoordinateRing` gives `pushClass` on class groups, whence
  **`toPointHom : W₁.Point →+ W₂.Point`** (seeded) through `toClassEquiv` — additive **by
  construction**, so AEC III.4.8 ("a pointed morphism is a homomorphism") is built in rather
  than a separate rigidity theorem; the homomorphism property is exactly as strong as the
  **extended-relative-norm API** (`ClassGroup.extendedRelNormHom` and its commutative-algebra
  supports), which is therefore part of this bullet's obligations. Its normality input is the
  seeded smoothness milestone
  `isIntegrallyClosed_coordinateRing` (the coordinate ring of an elliptic curve is integrally
  closed). The place dictionary (Layer 0) supplies the complementary geometric reading:
  degree-`1` places push forward, and the kernel fibre lands on `O`; and the place-free
  count — the intermediate ring is locally free of rank `deg φ` over the coordinate ring, so
  every fibre over an affine point has `deg φ` points with multiplicity, and translation
  moves the kernel fibre onto one — is the alternate route Layers 2–3 may take.
- **The standard isogenies.** `[n]` for `n ≠ 0`: the pullback is pinned on `x` by the division
  polynomials (`x ∘ [n] = φ_n / ψ_n²` — Mathlib's `DivisionPolynomial` files carry the
  polynomials; the `[n]`-compatibility on points is ⚠ *mathlib-track*:
  [mathlib #13782](https://github.com/leanprover-community/mathlib4/pull/13782) and its bumped
  versions, plus further division-polynomial upstreaming by the reviewers — assumed done,
  consumed here per the dedupe convention), with the headline **`deg [n] = n²`** (AEC III.6.2).
  The `q`-power **Frobenius**
  `π_q` over `𝔽_q` (`pullback = (· ^ q)`; seeded as `frobeniusIsogeny`, with `degree_frobeniusIsogeny`), purely inseparable with `deg π_q = q`; the relative
  Frobenius `W → W^{(p)}` in general, and the factorisation of every isogeny as
  (separable) ∘ (Frobenius power) (AEC II.2.12). `deg (1 − π_q) = #E(𝔽_q)` is Layer 3's hinge.
- **The hom-group and the degree form.** `Hom(W₁, W₂)`: the isogenies with a zero adjoined —
  the carrier is **pinned as `WithZero (Isogeny W₁ W₂)`** (review: settled by convention, not
  left to the implementer — definitionally `Option`, so the `WithZero`/`Option` API is reused
  and no bespoke inductive or recursor is introduced; the layer's real content is the
  `AddCommGroup` instance on it). That content is the theorem that the **pointwise sum of
  isogenies is an isogeny or zero**: its pullback is
  manufactured from the same rational addition formulas Mathlib's group law is proved by — this
  is what makes `Hom` an additive group and `End(E)` a ring containing the Frobenius pencil
  `ℤ + ℤπ_q`. **Complex multiplication enters as a predicate**: `HasCMBy E R` — a ring
  isomorphism `End(E) ≃+* R` — is a named definition milestone here, with its transport API;
  over `𝔽_q` the Frobenius pencil witnesses it for an order of `ℚ(π_q)` (ordinary case), and
  `j = 0, 1728` give the classical examples (worked examples). The CM **main theorem** is out
  of scope. ⚠ The hard core of the layer — for *any* definition of isogeny — is the
  **quadraticity of the degree**: `deg` extends to a positive-definite quadratic form on
  `Hom(W₁, W₂)` (`deg [n] = n²`, the parallelogram law, bilinearity of
  `(φ, ψ) ↦ deg (φ ∔ ψ) − deg φ − deg ψ`) — the Abel-grade content behind Hasse.
- **The dual isogeny.** `φ̂` with `φ̂ ∘ φ = [deg φ]` and `φ ∘ φ̂ = [deg φ]` (AEC III.6.1–2),
  constructed by factoring `[deg φ]` through `φ`: the separable part by the **Galois
  correspondence for function fields** (AEC III.4.10–11 — this framework's home turf: subgroups
  of the kernel correspond to intermediate fields of the extension `pullback` embeds), the
  inseparable part through Frobenius. Bilinearity of `(φ, ψ) ↦ φ̂ ∘ ψ` and `deg φ̂ = deg φ`.
  (For **endomorphisms** — the only place `[tr φ] − φ` type-checks — the Abel-free trace
  trick of Katz–Mazur 2.6.2.2, the scheme provenance's route, replays verbatim once `End(E)`
  is a ring and may be taken there instead; a general `φ : W₁ → W₂` has its dual in
  `Hom(W₂, W₁)` and gets it from the factorisation above. The construction of record is
  Silverman's factorisation — fully scheme-free, per review.)
- **`[n]`-surjectivity.** `[n]`'s surjectivity on `Kˢᵉᵖ`-points, for `n` **invertible in `K`** —
  the invertibility makes `[n]` separable, and over a merely separably closed (possibly
  imperfect) field only separable isogenies are surjective on points — is the first concrete
  milestone (seeded, `smul_surjective`), the counting input to Layer 2.
- **The invariant differential.** `ω = dx / (2y + a₁x + a₃)` as an element of Mathlib's
  `Ω[W.FunctionField⁄K]` (for elliptic `W` the denominator is nonzero in every characteristic);
  `Ω[F⁄K]` is `1`-dimensional over `F` with basis `ω`; the pullback `φ^*` is
  `KaehlerDifferential.map` along `pullback`; translation-invariance (AEC III.5.1); the
  **separability criterion** — `φ` separable `↔ φ^*ω ≠ 0` (II.4.2); and **additivity**
  `(φ ∔ ψ)^* ω = φ^* ω + ψ^* ω` (III.5.2), giving `[n]^* ω = n • ω` — the identity forcing `[n]`
  to be separable exactly when `char K ∤ n`. And — the milestone Layer 0's fibre count needs —
  **separable implies unramified**: a separable isogeny has `e_w = 1` at *every* place
  (étale, by translation-invariance of the ramification locus), so `#fibre = deg` over a
  separably closed field; `E[N]` (Layer 2) and the Hasse kernel count (Layer 3) consume
  exactly this. ⚠ API design (review): the differential API is pinned to these consumers and
  nothing more — the separability criterion, `[n]^* ω = n • ω`, the `e_w = 1` milestone, and
  Layer 4's formal-group uses — and its design model is the HasseWeil provenance, whose
  capstone genuinely consumes it: `HasseBound/Separability.lean` imports
  `Foundation/InvariantDifferentialPullback`, and `Foundation/EC/MulByIntUnramified.lean` is
  the `e = 1` input, citing AEC III.4.10(c) (§Provenance).
- **The formal group.** `Ê`, from expanding the group law at `O` (AEC IV.1): the formal group law,
  the formal logarithm/exponential in characteristic `0`, `[m]` on `Ê`, and the theory of the kernel
  of reduction (IV.6, used in Layers 3–4). The formal group *law* substrate is Mathlib's
  (`RingTheory/FormalGroup`, consume section); `Ê` instantiates it.

### Layer 2: torsion, the Weil pairing, and the Tate module (AEC III.6–8)

- **The structure of `E[N]`.** Over a **separably closed** field `K` with `N` invertible in `K`
  (`char K ∤ N`), `E[N] ≅ (ℤ/N)²` (AEC III.6.4), with `E[N]` as
  `Submodule.torsionBy ℤ (E.Point) N`; isogeny-theoretically `E[N]` is the fibre of `[N]` over
  `O`, counted by Layer 0's `Σ e · f = deg` identity together with Layer 1's
  separable-⟹-unramified milestone. The milestone
  (seeded) exposes what the later layers consume: `E[N]` is a
  **free `ZMod N`-module of rank `2`** — a `ZMod N`-linear equivalence with `(ZMod N)²`, wrapped
  in `Nonempty` because the basis is noncanonical (the equivalent `≃+` form carries the same
  content, additive maps of `ZMod N`-modules being automatically linear). The full `N`-torsion
  theory throughout requires `char K ∤ N`. Layer 1's `[N]`-surjectivity supplies the counting
  input. ⚠ *Mathlib-track* (review): the `E[N]`-structure code itself is expected to be done in
  Mathlib directly (reviewer work in flight); it is built here when Layer 2 needs it and swapped
  for upstream when that lands, per the dedupe convention.
- **The Weil pairing.** `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), pinned as an additive **bilinear**
  map into `Additive (rootsOfUnity N K)` over any field (seeded). Its theory: alternating,
  **nondegenerate** over a separably closed field with `N` invertible in `K` (seeded),
  Galois-equivariant, compatible with
  isogenies via the dual (`e_N(φP, Q) = e_N(P, φ̂Q)`), and — the load-bearing API — **functorial
  under change of field**. Built from the dual isogeny (Layer 1), or equivalently by the divisor
  calculus of Layer 0 (functions with divisor `N(P) − N(O)`; AEC III.8) — function-field
  arithmetic either way.
- **The Tate module.** For `ℓ ≠ char K`, `T_ℓ E = lim E[ℓⁿ]`, a free `ℤ_ℓ`-module of rank `2`, the
  `ℓ`-adic Weil pairing, and the continuous Galois representation
  `Gal(Kˢᵉᵖ/K) → GL(T_ℓ E) ≅ GL₂(ℤ_ℓ)` (AEC III.7). The rank-`2` freeness and the Galois action are
  the milestones; the pairing gives the determinant (the cyclotomic character).
  ⚠ *Mathlib-track* (review agreement): to be done directly in Mathlib in due course — built
  here per the dedupe convention and deduplicated when upstream catches up.

### Layer 3: elliptic curves over finite fields — the Hasse bound (AEC V.1)

- **Finiteness.** `E(𝔽_q)` is finite (seeded as `Finite (W.toAffine.Point)` over a finite field) —
  a prerequisite Mathlib lacks, and the seeded Hasse bound's **required companion**: the bound
  counts with `Nat.card`, which reads `0` on an infinite type, so finiteness is what makes the
  count the honest one (any proof of the bound necessarily establishes it).
- **The Hasse bound.** `#E(𝔽_q)` is within `2√q` of `q + 1` (AEC V.1.1). With
  `a_q := q + 1 − #E(𝔽_q)` the trace of Frobenius, the natural formalisation goal is the **integer
  inequality** `a_q² ≤ 4q` (seeded as `hasse_bound`; the real `|a_q| ≤ 2√q` follows), from
  `deg(1 − π_q) = #E(𝔽_q)`, positivity `deg ≥ 0` of the degree form on `End E`, and Cauchy–Schwarz
  on it (AEC V.1.2). Grounded on the degree form and the Frobenius isogeny (Layer 1), it
  is nonetheless landable now: the existing proof (provenance) carries a self-contained finite-level
  pairing, so this headline can be the first PR while Layers 0–2 are still built out.
  ⚠ **The proof's internal isogeny surrogate is the API's shadow, not a rival.** The existing
  proof manufactures an equation-level Frobenius `(x, y) ↦ (x^q, y^q)`, kernel-cardinality
  degrees, and a finite-level pairing. The statement consumes none of them, and none of them may
  appear in a **public** statement — Layer 1 is the sole public notion of isogeny. Under the
  function-field definition these are not a parallel theory to be reconciled across worlds; they
  are the **point-level shadows** of Layer 1's objects, identified by two named lemmas: the
  Frobenius isogeny induces `(x, y) ↦ (x^q, y^q)` on points (the Layer-0 dictionary applied to
  `pullback = (· ^ q)`), and kernel cardinality equals `deg` on the **separable** locus (the
  `Σ e · f` identity with `e ≡ 1` from Layer 1's separable-⟹-unramified milestone) — the
  only locus where the existing proof counts kernels (its
  coprime-route design; the one inseparable actor, `π_q` itself, never has its kernel counted —
  its degree `q` enters through the Galois `q`-power pairing scaling). Once Layers 0–1 land, the
  **restatement against the degree form is a named milestone discharged by rewriting along those
  two lemmas — the existing proof reused, not redone** — and the bespoke notions are thereby
  certified as computations of the real ones and kept as the engine.
- **The zeta function of `E/𝔽_q`.** `Z(E/𝔽_q, T) = (1 − a_q T + q T²)/((1 − T)(1 − qT))`, its
  functional equation, and the Riemann hypothesis for `E/𝔽_q` (roots of absolute value `q^{-1/2}`,
  equivalent to Hasse) (AEC V.2); the `a_q`-recursion for `#E(𝔽_{qⁿ})`.

### Layer 4: elliptic curves over local fields — reduction, Tate's algorithm, the Tate curve (AEC VII, ATAEC IV–V)

Two strands with genuinely different bases. The **discrete** strand (the reduction filtration,
Kodaira types, conductors, Tate's algorithm) lives over a **DVR** — complete or Henselian where
a statement needs it, with residue-field hypotheses (perfect, or finite) stated explicitly per
result. The **analytic** strand (the Tate curve) lives over a **complete rank-1 valued** field,
not necessarily discrete: `ℂ_p` belongs here. **Néron models are out of scope**: they are
schemes over the valuation ring by nature, and everything below is stated and proved on a
minimal Weierstrass equation, which is all AEC VII needs — the scheme packaging belongs to the
future scheme-facing roadmap.

- **The reduction filtration (discrete strand).** Over a DVR `R` with fraction field `K` and
  residue field `k`, from a minimal Weierstrass equation (Mathlib's `WeierstrassCurve.minimal`):
  the **reduction map on points** — via the projective-coordinate representation, so that every
  `K`-point reduces honestly (an API Mathlib's `Reduction.lean` does not yet have: it reduces
  the curve, not the points; the Stoll repository now carries exactly this map — provenance) — the subgroups `E₀(K)` (nonsingular reduction) and `E₁(K)` (kernel
  of reduction), the exact sequence `0 → E₁(K) → E₀(K) → Ẽ_ns(k) → 0` (AEC VII.2.1; `K`
  complete — Hensel's lemma drives the right-exactness), and the identification `Ê(𝔪) ≅ E₁(K)`
  connecting the formal group (Layer 1) to the kernel of reduction (VII.2.2, the formal group
  converging over complete `K`).
- **Néron–Ogg–Shafarevich (discrete strand).** Good reduction `↔` unramified `T_ℓ`-action for
  **`ℓ ≠ char k`** — the *residue* characteristic: `ℓ ≠ char K` is vacuous in mixed
  characteristic, and `T_p E` need not be unramified even with good reduction
  (AEC VII.7.1, over complete `K` with perfect `k`) — consuming the Tate module (Layer 2) and
  the filtration above; with it, potential good reduction and the `E[N]`-criterion for
  `N ≥ 3` with **`char k ∤ N`**.
  Stated and proved on equations — precisely the part of the local theory that never needed the
  Néron model.
- **Tate's algorithm (discrete strand).** From a minimal Weierstrass equation over a Henselian
  (classically complete) DVR with **perfect** residue field: the **Kodaira type**
  (`I₀, Iₙ, II, III, IV, I₀*, Iₙ*, IV*, III*, II*`) — a new enumerated type, *defined* here as
  the algorithm's output, its geometric reading deferred with the Néron model — the **conductor
  exponent** `f_p`, here *defined* algorithmically by Ogg's formula `f_p = v(Δ) − m + 1` (`m`
  the component count read off the type), and the local index `c_p = [E(K) : E₀(K)]`
  (ATAEC IV.9; Tate, LNM 476, 1975). The algorithm is the Kodaira type's decision procedure.
  ⚠ *Mathlib-track* (review): all of this is expected to land in Mathlib directly — built here
  per the dedupe convention and swapped for upstream when it arrives. The
  **ramification-theoretic** conductor and its identification with this algorithmic `f_p` —
  genuinely Saito's theorem in residue characteristics `2` and `3`, not Ogg's — is a
  **separate, related project**, cited (Saito) for context only; likewise the deeper
  Tamagawa-number theory once the point-level reduction map exists.
- **The Tate curve (analytic strand).** For `K` a complete rank-1 valued field (nondiscrete
  allowed — `ℂ_p` qualifies) and `|q| < 1`, the Tate curve `E_q` and the rigid-analytic
  uniformisation `Kˢᵉᵖ^× / qᶻ ≅ E_q(Kˢᵉᵖ)` (ATAEC V.3) — the `p`-adic model for split multiplicative
  reduction, and (unlike complex uniformisation) an *algebraic/rigid* statement that stays in
  scope. This strand consumes the rank-1 generalisation of Mathlib's reduction predicates flagged
  in the consume-section above.

### Layer 5: twists (AEC X.2, X.5)

Twists here are twists of the **pointed** curve `(E, O)`: elliptic curves `E'/K` that become
isomorphic to `E` over `Kˢᵉᵖ` *as pointed curves*, classified by `H¹(Gal(Kˢᵉᵖ/K), Aut (E, O))` —
and, because over a field every isomorphism of pointed Weierstrass curves is a change of
variables, `Aut (E, O)` is the stabiliser of the base-changed curve in Mathlib's
`VariableChange` group, and the classification is **Galois descent for Weierstrass equations**:
cocycles of variable changes, no schemes anywhere. A pointed twist keeps its rational point — it
is again an elliptic curve with a Weierstrass model. This is a **different theory from the
genus-one torsors** (principal homogeneous spaces): curves that become isomorphic to `E` over
`Kˢᵉᵖ` as bare curves, with **no** rational point in general — hence no Weierstrass equation,
and no home in this roadmap's equation-and-function-field world. Their *group* survives without
the geometry: Layer 7 has the Weil–Châtelet group `H¹(Gal(Kˢᵉᵖ/K), E(Kˢᵉᵖ))` purely
cohomologically, with `Ш` inside it; the reading of its classes as curves is deferred to the
scheme-facing roadmap. This layer deliberately does not conflate the two.

- **General (pointed) twists.** The classification `H¹(Gal, Aut (E, O))` by descent for
  Weierstrass equations (AEC X.5). For `j ≠ 0, 1728`, `Aut (E, O) ≅ {±1}` — in characteristics
  `2` and `3` the two exceptional values coincide at `j = 0 = 1728` — and the twists are the
  **quadratic twists**: for `char K ≠ 2` classified by the square classes `K^×/(K^×)²` (Kummer;
  AEC X.5.4); in characteristic `2`, where separable quadratic extensions are Artin–Schreier, by
  `K/℘(K)` with `℘(x) = x² − x`. The concrete construction below is characteristic-free either
  way.
- **Quadratic twists (Weierstrass form).** The concrete `char`-free development of Stoll (FLT
  #1088): the twist `quadraticTwistOf E t n` by the quadratic `x² − t x + n` (discriminant
  `D = t² − 4n`, `Δ ↦ D⁶Δ`, `c₄ ↦ D²c₄`, `c₆ ↦ D³c₆`, identities over any `CommRing`), elliptic —
  over a field, as FLT states it — exactly when `D ≠ 0`, with
  `j(E_{t,n}) = j(E)` (seeded); the extension twist `quadraticTwist E L` by a separable quadratic
  `L/K` with `j(E^L) = j(E)` (seeded); the point isomorphism `E^L(M) ≅ E(M)` over `M ⊇ L`, Galois
  anti-equivariant by the quadratic character (seeded — ⚠ per review, the finite-`M/K` case of
  the isomorphism is in an in-flight mathlib PR; the target here is general `M`, e.g.
  `M = Kˢᵉᵖ`, which the Galois statement needs); and the headline that a curve with **nonsplit**
  multiplicative reduction acquires **split** reduction after a separable quadratic twist (seeded,
  over Mathlib's reduction predicates). This is *not* Silverman's `char ≠ 2` Example X.3 2.4.

### Layer 6: the Mordell–Weil theorem (AEC VIII)

- **Mordell–Weil.** For `K` a number field, `E(K)` is a **finitely generated** abelian group (AEC
  VIII.6.7) — `AddGroup.FG (W.toAffine.Point)` (seeded as `fg_point_of_numberField`:
  statement-named per Mathlib convention, "Mordell–Weil" in the docstring only).
  **Self-contained at this layer — no
  Layer 7 input.** The weak Mordell–Weil theorem (`E(K)/2E(K)` finite) is proved directly by the
  Kummer argument: the `x − θ` map into the étale algebra `A = K[X]/(f)` lands in the subgroup
  `A(S, 2)` of square classes unramified outside the bad set `S`, and `A(S, 2)` is finite because
  the `S`-class group is finite and the `S`-units are finitely generated (AEC VIII.1; Mathlib
  already defines the group `K(S, n)` in `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean` and
  leaves its finiteness as a TODO — discharged here). That, together with the theory of heights
  (Mathlib's height machinery, and the canonical/Néron–Tate height with its quadraticity), gives
  the full theorem by descent. The elliptic-curve Selmer group `Sel_m(E/K)` of Layer 7 is the
  cohomological *refinement* of this argument, not its prerequisite.
- **The torsion subgroup and Nagell–Lutz.** Finiteness of `E(K)_tors` is a *corollary* of
  Mordell–Weil (finitely generated abelian groups have finite torsion), not a separate
  milestone (review); the content is **computability**. Over `ℚ` the theorem is wanted for
  **both integral models**, exactly as the provenance proves it: for an integral **long**
  Weierstrass model (`a₁, …, a₆ ∈ ℤ`), a nonzero torsion point has `x, y ∈ ℤ` unless it has
  order exactly `2`, where the honest bound is `4x, 8y ∈ ℤ`
  (`lutz_nagell_integrality_general`, with its discriminant companion); and for an integral
  **short** model `y² = x³ + Ax + B` (discriminant convention `Δ = −16(4A³ + 27B²)`), the
  classical full form — `x, y ∈ ℤ` and `y = 0` or `y² ∣ Δ` (`lutz_nagell`; AEC VIII.7). Route:
  division polynomials (⚠ *mathlib-track*: the division-polynomial material being upstreamed
  by the reviewers is assumed done and consumed here). The **formal-group integrality
  refinement** — every prime in a coordinate denominator appears to order `≥ 2`, the
  provenance's PID-level `den_powerful_of_on_curve` — is a named later milestone consuming
  Layer 4's filtration, not an aside. The **reduction-injectivity bound**
  `E(ℚ)_tors ↪ Ẽ_ns(𝔽_p)` holds for good **odd** `p` (at `p = 2` only the prime-to-`2`
  torsion injects; the general statement is injectivity on prime-to-`p` torsion) — gated on
  Layer 4's point-level reduction map (the projective-coordinates API flagged there).

### Layer 7: Selmer groups and Sha (AEC X.4)

- **Selmer structures, the Selmer group, and Sha.** Selmer theory is set up **for a general
  Galois module first** (review): a **Selmer structure** `𝓕` on a discrete
  `Gal(Kˢᵉᵖ/K)`-module `M` — local-condition subgroups `H¹_𝓕(K_v, M) ⊆ H¹(K_v, M)` for each
  place `v`, unramified at almost all `v` — with its Selmer group `Sel_𝓕(M/K) ⊆ H¹(K, M)`, à la
  Rubin's *Euler Systems* I.§1–2, so the same API later serves abelian varieties and other
  Kummer sequences. Decided here, not at build time (review): the modules are **discrete**,
  with continuous `Gal(Kˢᵉᵖ/K)`-action and no further topology carried in the definition —
  the standard setting for `E[m]` and `E(Kˢᵉᵖ)`, and all that `Sel_m` and `Ш` need. The elliptic instances plug in the classical conditions:
  the `m`-descent exact sequence `0 → E(K)/mE(K) → Sel_m(E/K) → Ш(E/K)[m] → 0` from the Kummer
  sequence for `[m] : E → E`, the finiteness of `Sel_m(E/K)` (AEC X.4.2) — the **effective
  refinement** of Layer 6's weak Mordell–Weil, giving the computable rank bound — and the
  Shafarevich–Tate group `Ш(E/K)` for the module `E(Kˢᵉᵖ)`, cut out by everywhere-local
  triviality. The **genus-one torsors** excluded from Layer 5 appear here *as cohomology*: the
  Weil–Châtelet group `WC(E/K) = H¹(Gal(Kˢᵉᵖ/K), E(Kˢᵉᵖ))` (AEC X.3) needs no geometry to
  define, and `Ш` is its everywhere-locally-trivial part; the geometric reading of its classes
  as curves is deferred to the scheme-facing roadmap.
- **Stretch: the BSD quotient and Cassels' isogeny-invariance.** The conjecture stays out, but
  **assuming `Ш(E/K)` finite** the *arithmetic* side of BSD is definable: the BSD quotient
  `Ω(E) · Reg(E/K) · #Ш(E/K) · ∏_p c_p / #E(K)_tors²` — the regulator from the canonical height
  (Layer 6), the `c_p` from Tate's algorithm (Layer 4), `Ш` from this layer — and **Cassels'
  theorem** that it is unchanged by isogeny (Cassels 1965), making the truth of BSD
  isogeny-invariant. Still a stretch goal, with the target fixed and now **pinned to
  `K = ℚ`** (review): the milestone is the full quotient, period included — the period-free
  part is not isogeny-invariant, so it would gut Cassels' theorem — with
  `Ω(E) = ∫_{E(ℝ)} |ω_min|` for the global minimal Weierstrass equation, which exists over
  `ℚ` (Layer 4's minimality), through Mathlib's integration; the dependencies are `ω`
  (Layer 1), minimality and the `c_p` (Layer 4), the regulator (Layer 6), and `Ш` (this
  layer). ⚠ Over a general number field there is no global minimal model, and the honest
  general-`K` period is defined through complex uniformisation on `ℂ/Λ` (J. Cremona, via
  review) — exactly the material this roadmap excludes; the general-`K` BSD quotient
  therefore belongs to the complex-analytic successor roadmap, where Mathlib's `℘`-function
  (consume section) is waiting for it. BSD itself stays out of scope either way.
- ⚠ **Dependency — what is actually missing.** Pinned Mathlib already has the general cohomological
  substrate: continuous cohomology of topological groups
  (`Mathlib/Algebra/Category/ContinuousCohomology/`), group cohomology with the explicit low-degree
  API, the long exact sequence, Shapiro's lemma, and Hilbert 90
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/`), and a nonabelian `H¹`
  (`Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean`). What gates this layer is the
  **Galois-specific packaging**, none of it upstream yet: profinite Galois groups acting
  continuously on discrete modules such as `E(Kˢᵉᵖ)` with the finite-level comparison
  (`H¹` as the colimit over finite Galois quotients); the Kummer/descent connecting map and exact
  sequence for `[m] : E → E`; inflation–restriction in that continuous setting; and localisation
  at the places of `K` — the local conditions cutting `Sel_m` out of `H¹(Gal, E[m])`. The layer is
  stated against that packaging once it exists. (BSD, which would relate `Ш` and the rank to
  `L(E, s)`, is out of scope — it needs the analytic continuation of `L(E, s)` that Mathlib does
  not have.)

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **The point–place dictionary and the class-group anchor.** `W.toAffine.Point` is exactly the
  degree-`1` places of the function field (`O ↦ infinityPlace`), and `toClass` is onto the ideal
  class group (`toClass_surjective`, with Mathlib's `toClass_injective`) — the Layer-0 bridges
  every later layer uses.
- **Frobenius is an isogeny:** over `𝔽_q`, `pullback = (· ^ q)` satisfies `MapsInfinity`, is
  purely inseparable of degree `q`, and induces `(x, y) ↦ (x^q, y^q)` on points
  (`frobeniusIsogeny` and `degree_frobeniusIsogeny`, seeded).
- **`[n]` is surjective on `E(Kˢᵉᵖ)`** for `n` invertible in `K`, and `#E[N] = N²` for `N`
  invertible in `K` — the Layer 1/2 counting gate (`smul_surjective`, `torsion_linearEquiv_prod`).
- **The Weil pairing is bilinear and nondegenerate** — an additive bilinear map into
  `Additive (rootsOfUnity N K)`, with `e_N(P, ·) ≡ 0 ⇒ P = 0` over a separably closed field with
  `N` invertible (`weilPairing`, `weilPairing_nondegenerate`).
- **Hasse:** `a_q² ≤ 4q` for the Frobenius trace `a_q = q + 1 − #E(𝔽_q)` (`hasse_bound`) — landed
  first from the equation-level proof; then **restated against the Layer-1 degree form** through
  the two shadow lemmas of the function-field dictionary, the existing proof reused rather than
  redone. The restatement is the acceptance test of the dictionary itself.
- **`j` is a twist invariant** but the curves differ: `j(E^L) = j(E)` while `E^L ≇ E` over `K`, and
  `E^L(M) ≅ E(M)` once `L ⊆ M`, with the Galois action twisted by the quadratic character
  (`j_quadraticTwist`, `quadraticTwistPointEquiv`).
- **Tate's algorithm, one certified entry per Kodaira type** (LMFDB label @ prime): the
  parametric family `v(Δ) = n`, `v(c₄) = 0 ↦ Iₙ` with `f = 1` — instances `I₁` on 11.a1@11,
  `I₂` on 14.a4@7, `I₅` on 11.a2@11 — then `II` on 27.a4@3, `III` on 24.a5@2, `IV` on
  20.a3@2, `I₀*` on 32.a1@2, the `Iₙ*` family with `I₁*` on 24.a4@2 and `I₂*` on 45.a8@3,
  `IV*` on 20.a2@2, `III*` on 24.a3@2, and `II*` on 24.a1@2 — every branch of the algorithm
  exercised.
- **Torsion and rank on named curves:** `E(ℚ)_tors ≅ ℤ/5ℤ` for 11.a3, certified by
  Nagell–Lutz (a finite integral search); rank `≥ 1` for 37.a1 via the point `(0, 0)` of
  positive canonical height, upgraded to rank `= 1` once Layer 7's `2`-descent Selmer bound
  lands — torsion is decidable today, rank upper bounds are Layer-7 material.
- **CM as a predicate:** over `ℚ(i)` the curve `y² = x³ + x` witnesses `HasCMBy` for `ℤ[i]`,
  and an ordinary curve over `𝔽_q` witnesses it for an order of `ℚ(π_q)` containing
  `ℤ[π_q]` — the predicate and its witnesses only; the CM main theorem stays out of scope.
- **Mordell–Weil:** `E(K)` is finitely generated for a number field `K`
  (`fg_point_of_numberField`), and its free rank plus a finite torsion subgroup describe it.

## Ordering

Layer 0 (places and divisors) is the foundation and comes first: the isogeny *type* is
already seeded (its integral-closure form needs no places), but its kernels, fibres, and
point dictionary are Layer-0 material, and the class-group anchor is the group law's own
algebra. Layer 1 (isogenies, the dual,
the invariant differential, the formal group) builds on it and on the division polynomials;
Layer 2 (torsion, the Weil pairing, the Tate module) on the dual isogeny. Layer 3 (Hasse) is
the earliest PR, its existing proof being self-contained. Layer 4 (reduction, Tate's algorithm,
the Tate curve) consumes the formal group (Layer 1), the Tate module (Layer 2), and Mathlib's
reduction theory. Layer 5 (twists) consumes `Aut (E, O)` (Layer 1, via `VariableChange`) and
feeds the split-reduction statement of Layer 4. Layer 6 (Mordell–Weil) consumes heights and
number-field finiteness (`S`-class groups, `S`-units) — nothing from Layer 7, so the ordering
really is the dependency order. Layer 7 (Selmer/Sha) refines Layer 6's descent into its
cohomological form and is gated on the continuous-Galois-cohomology packaging (§Layer 7).

## References

- J. H. Silverman, *The Arithmetic of Elliptic Curves*, GTM 106, 2nd ed. (Springer, 2009) — AEC:
  II (curves and function fields), III (isogenies, torsion, Weil pairing), V (finite fields,
  Hasse), VII (local fields), VIII (Mordell–Weil), X (twists, Selmer/Sha).
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, GTM 151 (Springer,
  1994) — ATAEC: IV (Tate's algorithm), V (the Tate curve).
- H. Stichtenoth, *Algebraic Function Fields and Codes*, GTM 254, 2nd ed. (Springer, 2009) —
  places, divisors, and extensions of function fields (Layer 0).
- J. Tate, *Algorithm for determining the type of a singular fibre in an elliptic pencil*, in
  *Modular Functions of One Variable IV*, LNM 476 (Springer, 1975), 33–52 — Tate's algorithm.
- T. Saito, *Conductor, discriminant, and the Noether formula of arithmetic surfaces*, Duke Math.
  J. 57 (1988), 151–173 — the ramification-theoretic conductor and its identification with the
  algorithmic `f_p` (context for the separate project noted in Layer 4).
- J. W. S. Cassels, *Arithmetic on curves of genus 1. VIII. On conjectures of Birch and
  Swinnerton-Dyer*, J. reine angew. Math. 217 (1965), 180–199 — isogeny-invariance of the BSD
  quotient (Layer 7 stretch).
- K. Rubin, *Euler Systems*, Annals of Mathematics Studies 147 (Princeton, 2000) — Selmer
  structures (Layer 7).
- H. Hasse, *Zur Theorie der abstrakten elliptischen Funktionenkörper*, J. reine angew. Math. 175
  (1936) — the Hasse bound.

## Provenance (existing Lean work to migrate into Tau Ceti)

The milestones are specified above intrinsically; this section maps them to Lean work that already
discharges parts of them, as sources of proofs to migrate — never as the specification.

**Pinned sources.** The claims below about `sorry`s, axioms, and heartbeats were audited at, and
only hold for, these revisions:

- **AINTLIB** (`github.com/CBirkbeck/AINTLIB`; public, currently **no license file** — the
  repository belongs to this roadmap's author, and Apache-2.0 licensing of the migrated material
  is part of the migration contract): the modular-curves project at
  `dev/modular-curves @ 50d5f9d37387` (after the function-field pivot: strategy library and
  feasibility evidence, not a port source — see below), the HasseWeil project at
  `dev/hasse-weil @ 513e83879e2f`, and the NagellLutz project (`projects/NagellLutz`) at
  `dev/modular-curves @ 9fec8eba7652`.
- **The Angdinata isogeny development** (shared with the roadmap authors on 2026-07-23, ahead
  of its mathlib PRs — no public revision to pin yet; the shared files are the contract):
  `Isogeny.lean` on three mathlib-bound supports — the `CoordinateRing` split-out,
  `RingTheory/ClassGroup/RelNorm`, and `RingTheory/IntegralClosure/NormalizationFinite`.
  Details in the Layers 0–1 entry below; re-pin to the PR numbers when they open.
- **FLT** (`github.com/ImperialCollegeLondon/FLT`, Apache-2.0): the quadratic-twist development of
  PR #1088, merged as `bc2fe8ff7396` (2026-07-10).
- **Mordell–Weil / local fields** (`github.com/MichaelStollBayreuth/EllipticCurves`,
  **Apache-2.0**): `66889eada51a` — the elliptic-curve part of the former Heights development,
  extracted to its own repository, ported to the Lean 4 module system, pinned to Mathlib
  v4.32.0, and sorry-free (per its author on this roadmap's review thread). The earlier
  GPL-2.0 licence obstruction is **resolved**: this is a source to migrate, not merely a
  model.

- **Function-field foundations and isogenies (Layers 0–1).** The `Isogeny` definition and its
  opening theory are D. Angdinata's, shared as working files ahead of their mathlib PRs:
  `Isogeny.lean` carries the `FunctionFieldPullback`/`MapsInfinity`/`Isogeny` design above,
  `finiteDimensional` (nonconstant maps of one-variable function fields are finite —
  inseparable case and Frobenius included), the `IntermediateRing` with
  `intermediateRingFinite` and `intermediateRingIsIntegrallyClosed`, `pushClass` by ideal
  extension and relative norm (`ClassGroup.extendedRelNormHom`), and
  `toPointHom : W₁.Point →+ W₂.Point`; its supports are the `CoordinateRing` split-out
  (with `Point.toClass_surjective` and `toClassEquiv`, **no ellipticity hypothesis**),
  `RingTheory/ClassGroup/RelNorm`, and `RingTheory/IntegralClosure/NormalizationFinite`.
  Hypothesis inventory — the minimal conditions: the definition needs only `[Field F]`;
  finiteness nothing more; the point map needs `[IsIntegrallyClosed W₂.CoordinateRing]`
  (supplied for elliptic curves by the seeded smoothness milestone) and `[DecidableEq F]`.
  His upstreaming of division-polynomial material is also in flight; Layers 0–1 are specified
  to **coordinate with that work, not fork it** — where the upstream lands first, the roadmap
  consumes it and deletes the duplication (the ⚠ *mathlib-track* tags). The AINTLIB modular-curves
  project's scheme-level endomorphism theory (`EndomorphismDegree.lean`, following Katz–Mazur:
  rigidity over a locally noetherian base, the hom-monoid on `End(E/S)`, the degree as a
  finite-locally-free rank, the trace, and the **Abel-free dual** `endDual f := [tr f] − f` —
  Katz–Mazur 2.6.2.2 solved for the dual, no `Pic⁰`) is **no longer a port source** after the
  pivot; it stays pinned as the strategy library — the trace-trick dual and the anchoring of
  `deg [N] = N²` to division polynomials replay in the function-field world — and as feasibility
  evidence. Its two open `sorry`s are instructive here: degree multiplicativity *dissolves*
  under the new definition (the finrank tower formula), while `φ̂φ = [deg φ]` remains Layer 1's
  hard core under any definition. On the equation side, HasseWeil's `DualIsogeny.lean` and
  `DegreeQuadraticForm.lean` (its conditional route) are material that now lives *inside* the
  definition's own world — candidate engines for the degree form and the dual, to be reused
  where they fit.
- **`E[N] ≅ (ℤ/N)²` (Layer 2).** A `sorry`-free proof over **algebraically closed** geometric
  fibres exists in AINTLIB as `torsion_geometricFibre_rank_two` — scheme-theoretic, so after the
  pivot a feasibility model rather than a port source (its `deg [N] = N²` anchor is the
  division-polynomial `[N]`-formula of
  [mathlib #13782](https://github.com/leanprover-community/mathlib4/pull/13782) and its bumped
  versions — credited there, not to the `HasseWeil` copy of the same material). The milestone
  here is the intrinsic `WeierstrassCurve` statement over `Submodule.torsionBy ℤ (E.Point) N`,
  over a **separably** closed field, exposed as a free rank-`2` `ZMod N`-module
  (`torsion_linearEquiv_prod`).
- **Hasse bound (Layer 3).** Proved in the AINTLIB `HasseWeil` project as `hasse_bound` /
  `hasse_bound_unconditional` (`HasseWeil/WeilPairing/HasseBound.lean`), in the real form
  `|#E(𝔽_q) − q − 1| ≤ 2√q` over `Fintype.card W.toAffine.Point` (the projective count, matching the
  seed; the integer form `a_q² ≤ 4q` is the trivial corollary). The flagship's `#print axioms` output —
  `[propext, Classical.choice, Quot.sound]` — is recorded in-repo at the pinned revision (a
  documented check, to be turned into a CI gate on porting) — but the
  surrounding project is not globally `sorry`-free (the capstone routes around its in-progress
  conditional lemmas), and its `maxHeartbeats 2000000` override must be removed for TauCeti CI. (The
  `trace_sq_le_four_mul_deg` quadratic-form step belongs to that separate conditional route, not the
  flagship.) Its equation-level Frobenius and kernel-cardinality degrees are the **shadows** of
  Layer 1's isogeny notions (§Layer 3), which is what makes the planned restatement a transport,
  not a second proof. The monorepo copy (`projects/HasseWeil` at the `dev/modular-curves` pin
  of the NagellLutz entry) restructures the tree and carries the
  invariant-differential/ramification module the Layer-1 API is modelled on:
  `Foundation/InvariantDifferential{,Pullback}.lean`, `Foundation/Ramification.lean`, and
  `Foundation/EC/MulByIntUnramified.lean` — the `e = 1` unramifiedness input (AEC
  III.4.10(c)) — imported by the capstone's `Separability`/`Infrastructure` files, so the
  separable-⟹-unramified milestone is not speculative: the Hasse engine already runs on it.
- **The Tate curve (Layer 4).** Partial AI developments exist in the FLT project
  (`FLT/KnownIn1980s/EllipticCurves/TateCurve*`, `FLT/TateCurve/*`); the merge state there changes
  frequently and is not tracked here.
- **Quadratic twists (Layer 5).** The FLT project has a `sorry`-free quadratic-twist development —
  several thousand lines of AI-generated Lean — supplying `quadraticTwistOf` and its invariants,
  `quadraticTwist`, `exists_smul_eq_or_exists_smul_eq_quadraticTwist`, `quadraticTwistPointEquiv`
  with `quadraticTwistPointEquiv_galois`, and `exists_quadraticTwist_hasSplitMultiplicativeReduction`,
  plus base-change/`VariableChange`/`Aut`/reduction support. It is a body of code to bring **into Tau
  Ceti first**, not a Mathlib dependency. At the pinned revision it consumes
  `Algebra.IsQuadraticExtension K L` directly — the class is already in pinned Mathlib
  (`Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean`), not "being upstreamed" — and
  carries its own `quadraticCharacter` for the Galois statement; no signature adjustments are
  needed on porting.
- **Nagell–Lutz (Layer 6).** The AINTLIB `NagellLutz` project (pinned above) is sorry-free at
  file level on the division-polynomial route, in exactly the two registers Layer 6 asks for:
  the classical short-model theorem over `ℚ` (`lutz_nagell`: integrality and
  `y = 0 ∨ y² ∣ Δ`), the **long-model** integrality over `ℤ` with the honest order-`2`
  branch (`lutz_nagell_integrality_general`, `lutz_nagell_general`), and beyond them a
  characteristic-zero **PID generalization** (`PIDMain.lean`: `den_powerful_of_on_curve` —
  denominator-powerfulness for *all* points — integrality under a squarefree-order
  hypothesis, and the `κ² ∣ 4Δ` discriminant form) — the model for the formal-group
  refinement milestone. Migration must dedupe its vendored division-polynomial files against
  the reviewers' upstreaming (mathlib-track convention).
- **Mordell–Weil (Layer 6).** Michael Stoll's formalisation (pinned above, Apache-2.0) proves
  it `sorry`-free, by exactly the route Layer 6 specifies:
  `WeierstrassCurve.Affine.fg_point_of_numberField` for an **arbitrary** elliptic curve over a
  number field — the variable-change reduction to short normal form is performed internally,
  so it matches the seed here in name and generality alike — resting on the general `fg_point`
  (over the fraction field of a Dedekind domain, the per-factor class-group and unit-group
  finiteness taken as hypotheses) and weak Mordell–Weil by the `x − θ` map into the étale
  algebra `K[X]/(f)`; and the étale-algebra Selmer-group finiteness
  (`IsDedekindDomain.finite_selmerGroup`, with the fundamental exact sequence and
  `finite_selmerGroupOfEquiv`) building directly on Mathlib's `DedekindDomain.SelmerGroup` and
  discharging that file's own finiteness TODO — an upstreaming target in its own right, after
  careful review (the *arithmetic* `K(S,n)`, not Layer 7's `Sel_m(E/K)`). Porting note:
  nothing structural remains; the work is Mathlib-polish and the dedupe discipline.
- **The reduction filtration (Layer 4).** The same repository (pinned above) already carries
  the local-field material Layer 4 flags as missing from Mathlib: the **point-level reduction
  map** `redHom : E(K_v) → Ẽ(k_v)` via the projective representation — injective on torsion
  and order-preserving there — the valuation **filtration `E₁(K_v)`** with the structure
  theorem that `E(K_v)` has a finite-index subgroup `≅ (𝒪_v, +)`, torsion-freeness of `E₁`
  under the standard ramification condition, and integral-model existence; all sorry-free,
  not yet Mathlib-polished. Its formal group is built on a small vendored multivariate
  formal-group kit (from as-yet-unpublished Chabauty–Coleman work); on migration the
  one-dimensional elliptic case is refounded on Mathlib's `RingTheory/FormalGroup`, per the
  Layer-1 convention.
- **Selmer/Sha (Layer 7)** waits on the continuous-Galois-cohomology packaging (§Layer 7 lists the
  concrete missing pieces).

The modular-curves project also carries a `sorry`-free construction of the invariant
differential as a line bundle glued over the Weierstrass atlas (`InvariantDifferential.lean` at
the pinned revision). After the pivot the roadmap's `ω` is instead an element of Mathlib's
`Ω[W.FunctionField⁄K]` (§Layer 1) — the chart-level formula `dx / (2y + a₁x + a₃)` is the same,
and the line-bundle refinement is deferred with the schemes. The isogeny functoriality
(`(φ ∔ ψ)^*ω = φ^*ω + ψ^*ω`, hence `[n]^*ω = n·ω`) is formalised nowhere and is built here. The
places-and-divisors dictionary of Layer 0, the formal group, and Tate's algorithm are, to our
knowledge, not yet formalised anywhere; they are built here on the function-field foundation,
alongside the completion of the isogeny theory above.
