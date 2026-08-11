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
*The Arithmetic of Elliptic Curves* (AEC, GTM 106) and *Advanced Topics in the Arithmetic of
Elliptic Curves* (ATAEC, GTM 151), and
other sources for definiteness — but the specification is a **thorough, Mathlib-style API** for
each object, not a transcription of any one book. The theorem we can land almost immediately is the
**Hasse bound** over `𝔽_q` (AEC V.1), from existing sorry-free work; the intervening theory is what
it and the later layers rest on.

**The function field is the foundation.** An elliptic curve is more than a Weierstrass equation
and a group law on its points: Layers 1–3 need honest *morphisms* — isogenies, Frobenius, the
dual — with degrees, separability, and kernels. The classical dictionary supplies them without
leaving the commutative algebra Mathlib already has: a **regular** proper curve with its
nonconstant morphisms is equivalent, contravariantly, to its function field with the `K`-algebra
embeddings (AEC II.2.4). ⚠ Say *regular*, not *smooth*: over an imperfect `K` the normalization
of a curve is a regular proper model but need not be smooth over `K` (`y² = x³ + t` over
`𝔽₃(t)` acquires a cusp after adjoining `t^{1/3}`), and this roadmap works over arbitrary
fields — the separable-closure convention below exists for exactly this reason. Mathlib holds the function-field side of this dictionary for Weierstrass
curves — the coordinate ring `Affine.CoordinateRing` (`AdjoinRoot W.polynomial`, an integral
domain) and the function field `Affine.FunctionField` (its fraction field) — and the group law on
the points is *already proved* through that algebra, as the ideal class group of the coordinate
ring (Angdinata–Xu, Mathlib's `Point.toClass`). So an **isogeny is defined by a
coordinate-ring pullback, backwards** — an `F`-algebra map out of the target's affine ring
into the source's function field — its pointedness expressed
through **integrality over the coordinate rings**:

```lean
/-- A contravariant pullback out of the target's affine coordinate ring into the source's
function field. -/
abbrev CoordinatePullback (W₁ W₂ : Affine F) :=
  W₂.CoordinateRing →ₐ[F] W₁.FunctionField

/-- The source point at infinity maps to the target point at infinity. -/
def CoordinatePullback.MapsInfinity (pullback : CoordinatePullback W₁ W₂) : Prop :=
  letI := pullback.toRingHom.toAlgebra
  ∀ x : W₁.CoordinateRing,
    algebraMap W₁.CoordinateRing W₁.FunctionField x ∈
      integralClosure W₂.CoordinateRing W₁.FunctionField

/-- The pullback data of an isogeny. -/
structure Isogeny (W₁ W₂ : Affine F) where
  pullback : CoordinatePullback W₁ W₂
  mapsInfinity : pullback.MapsInfinity
```

— the coordinate-ring form of D. Angdinata's definition and development,
shared with this roadmap ahead of its mathlib PRs (this roadmap **coordinates with that
work**, it does not fork it): a conditioned pullback is injective — a maximal kernel would
make the image a finite extension of `F`, forcing `x`, which has a pole at `O₁`, to be
integral over the constants — and extends uniquely across the fraction field to that
development's function-field embedding, so the two forms are the same data after
localization, and its theorems transfer intact. (⚠ For *singular* Weierstrass curves the
pullback formalism is unchanged, but reading a pullback as an everywhere-defined morphism of
the singular projective curve is a separate descent statement — the elliptic theory
downstream assumes `IsElliptic` exactly as before.)
`pullback` is the contravariant map out of the affine ring; `MapsInfinity` demands that every affine
function of `W₁` be **integral** over the pulled-back coordinate ring of `W₂`. That is
exactly `φ(O₁) = O₂`: the integral closure is the ring of functions regular away from the
*whole fibre* `φ⁻¹(O₂)` — which contains every kernel point, not only `O₁` — and
`W₁.CoordinateRing` consists of functions regular away from `O₁` (the full ring of those is
its normalization, equal to it exactly when the coordinate ring is integrally closed), so
asking it to sit inside says precisely that `O₁` lies in that fibre. ⚠ Note the equivalence
`MapsInfinity ⟺ φ(O₁) = O₂` needs **no ellipticity and no normality hypothesis** on either
curve: the point at infinity `[0 : 1 : 0]` of *every* Weierstrass cubic — singular ones
included — is a smooth point in every characteristic (Mathlib's
`WeierstrassCurve.Projective.nonsingular_zero`), with `ord_O x = −2`, so `x ∈ W₁.CoordinateRing`
has a pole exactly there and forces `O₁ ∈ φ⁻¹(O₂)`; the converse is the inclusion
`W₁.CoordinateRing ⊆ 𝒪(C₁ ∖ {O₁})`, which holds normal or not. No places in the statement.
Why this is the right foundation, and a cheap one:

- **Nonzero comes with the condition.** A conditioned pullback is injective (the pole
  argument above), and its fraction-field extension is automatically **finite** (both sides
  have transcendence degree `1` over `K`), so an `Isogeny` is a *nonzero* isogeny by
  construction. The zero morphism appears only as the Layer-1 hom carrier's **zero map** — a
  formal representative, not a pullback (§Layer 1) — with no `WithZero` adjunction anywhere.
- **Degree and separability are field theory.** `deg φ` is `Module.finrank` of
  `W₁.FunctionField` over the fraction field of the pulled-back coordinate ring — the
  pulled-back copy of `W₂.FunctionField`; the separable and
  inseparable degrees, and separability of `φ`, are those of the field extension — Mathlib's
  existing `FieldTheory`, not a flatness theory of morphisms. Multiplicativity of `deg` under
  composition is the finrank tower formula.
- **Frobenius is a one-liner.** Over `𝔽_q`, `f ↦ f ^ q` out of the coordinate ring into the
  function field is an `𝔽_q`-algebra map satisfying `MapsInfinity` (the coordinates are
  integral over their `q`-th powers): the Frobenius isogeny `π_q`, purely inseparable of degree `q` — the key input to
  Layer 3.
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
together with its injectivity and unique fraction-field extension, its degree
(`Module.finrank` over the extension's field range), automatic finiteness, the
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
conjecture** is not proved here, and its unconditional *statement* needs the analytic
continuation of `L(E, s)`, which Mathlib does not have; rather than rule it out on those
grounds, §Layer 7 carries a **statement-only milestone**: full BSD over `ℚ` with the analytic
hypothesis pinned exactly as that layer states it — an analytic function on a connected open
set containing both `s = 1` and part of the half-plane of convergence, agreeing with the
Dirichlet series there, since merely assuming "a function analytic near `s = 1`" admits an
unrelated germ and states nothing — every
other ingredient is built by Layers 4–7, so modulo that hypothesis the statement is cheap.
(The *arithmetic* BSD quotient **over `ℚ`**, assuming `Ш` finite, is a marked stretch
milestone in §Layer 7; *proving* anything about either form is out — as is the
general-number-field quotient, whose period honestly wants complex uniformisation.) Everything else — through
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
  nonsingularity API as a first step. The milestones here are statements about the
  abstract group and survive that migration; only the seeds' spellings (`W.toAffine.Point`) would
  update.
- **Isogenies are coordinate-ring pullbacks, backwards.** An isogeny `φ : W₁ → W₂` is the
  structure above: a `pullback : CoordinatePullback W₁ W₂` together with
  `mapsInfinity` — integrality of `W₁.CoordinateRing` over the pulled-back
  `W₂.CoordinateRing`, i.e. `φ(O₁) = O₂` with no places in the statement (the fibre over
  `O₂` may, and for nontrivial kernels does, contain other points). Every conditioned map is
  injective, with automatically **finite** fraction-field extension, so an `Isogeny` is a
  *nonzero* isogeny by construction; `deg φ` is `Module.finrank`, and (in)separability is that of the field
  extension. The zero map is not an `Isogeny`: it is the Layer-1 hom carrier's zero (§Layer 1), and
  no statement quantifies over "isogenies including zero" implicitly. The induced map on
  `Point` is `toPointHom`, through the class group (§Layer 1); the place dictionary (§Layer 0)
  is its geometric reading.
- **`E[N]` is `Submodule.torsionBy ℤ E.Point N`**, and the Weil pairing `e_N` is an additive **bilinear**
  map into `Additive (rootsOfUnity N K)` — `ℤ`-bilinear, valued in the `N`-th roots of unity, over
  **any** field with no closure hypothesis — whose primary consumer-facing API is
  **compatibility with isogenies via the dual** (`e_N(φP, Q) = e_N(P, φ̂Q)`); functoriality
  under change of field is near-definitional from the any-field definition. Use
  [`Submodule.torsionBy`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Module/Torsion/Basic.html),
  `rootsOfUnity`/`Nˣ`, `Additive`, not private versions. (Torsion-structure statements are
  phrased as additive equivalences `≃+` — no `ZMod N`-module packaging in the statements; the
  `ZMod N` action is recoverable from `AddSubgroup.torsionBy.zmodModule` if a consumer ever
  wants it, and a `≃+` between `ZMod N`-modules is automatically `ZMod N`-linear.) Mathlib already has
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
  expected to land in Mathlib directly — some from in-flight upstream
  work: the division-polynomial `[n]`-formulas, the structure of `E[N]`, the Tate module,
  Tate's algorithm with the conductor exponent and local index, the isogeny opening theory
  itself — including `toClass` surjectivity — through the Angdinata development, and the
  arithmetic Selmer groups of number fields (the `K(S, n)` finiteness, Stoll's upstreaming
  target). Waiting would serialise the
  roadmap behind upstream timelines, so the policy is: **build them here when
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
  Angdinata–Xu, and its infrastructure is load-bearing API here, not an
  implementation detail: the coordinate ring `Affine.CoordinateRing` (`AdjoinRoot W.polynomial`,
  an integral domain), the function field `Affine.FunctionField` (its fraction field), and the
  injective class-group map `Point.toClass` — Layer 0 is built directly on these.
- **Division polynomials and elliptic divisibility sequences.** `WeierstrassCurve.Ψ`, `Φ`, `ψ`
  (`.../DivisionPolynomial/*`) and the elliptic-divisibility-sequence development
  (`Mathlib/NumberTheory/EllipticDivisibilitySequence.lean` — cited by file: the sequence
  predicates' names are in flux upstream, so the roadmap does not pin them).
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
  is not discrete; the target shape re-founds the
  reduction predicates over **an arbitrary ring with a valuation** — no fraction field in the
  definitions at all — with the DVR and valued-field statements derived; that refactor is an
  **upstream prerequisite** for Layer 4's Tate-curve strand, flagged here.
- **Heights and the `L`-function definition.** `Mathlib/NumberTheory/Height/*` (the general
  height API and Northcott) and `.../EllipticCurve/LFunction.lean`. ⚠ `.../Height/EllipticCurve.lean`
  (M. Stoll) is **newer than this roadmap's Mathlib pin** `9caeba10` and so is not consumable
  until the pin moves: on master it proves the height bound
  `∃ C, ∀ x, |logHeight (fun i ↦ (addSubMap W i).eval x) − 2 * logHeight x| ≤ C`
  (`abs_logHeight_addSubMap_sub_two_mul_logHeight_le`), which is the quasi-quadraticity input
  Layer 6 consumes, while that file's own TODO list still carries the naïve height on points
  and the statement of the approximate parallelogram law — so Layer 6 builds those.
- **Field theory and valuation theory.** Finite extensions and `Module.finrank`, separable and
  purely inseparable extensions with `Field.finSepDegree`, Kähler differentials
  (`Ω[F⁄K]`, `KaehlerDifferential.map`), and the valuation/`ValuationSubring` material on which
  Layer 0's places are built.
- **Continuous cohomology.** Continuous cohomology of topological groups
  (`Mathlib/Algebra/Category/ContinuousCohomology/`, R. Hill and A. Yang), consumed by
  Layer 7 through the forced-discrete constructor itemised there. (Mathlib's Weierstrass
  `℘`-function exists but is not consumed anywhere on this roadmap — complex uniformisation
  is out of scope; the complex-analytic successor roadmap is where it becomes relevant.)

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
invertible in `K` (Layer 1), the `N`-torsion `E[N] ≅ (ℤ/N)²` — stated as an additive
equivalence (§Conventions) — and the bilinear **Weil pairing** (Layer 2), the finiteness of `E(𝔽_q)` and the
**Hasse bound** as the integer inequality `a_q² ≤ 4q` (Layer 3), the **quadratic twist** and the
split-multiplicative-reduction theorem (Layer 5), and the **Mordell–Weil theorem**
`AddGroup.FG (E K)` (Layer 6). The layers whose central objects are new *types* — the places of
the function field (Layer 0), the hom-group, dual isogeny, and formal group (Layer 1), the
Kodaira type (Layer 4), and the Selmer/Sha groups (Layer 7) — are specified in the narrative
below and built there, not pinned here as `sorry`-typed placeholder types.

---

## The build, in layers

The ordering is the dependency order.

Every milestone is one of: **port** (exists in a pinned source, to migrate), **core** (new
development on the main line), **extension**, or **stretch**. Unmarked milestones are core;
the provenance section records the ports; the stretch goals are exactly Layer 5's full
nonabelian-`H¹` classification and Layer 7's Cassels/BSD block.

### Layer 0: the function field, places, and divisors

The foundation: the dictionary between the point group Mathlib has and the function field Mathlib
also has. ⚠ **Scope.** Under the integral-closure architecture the isogeny *type*, the
induced point map (`pushClass`/`toPointHom`), and even kernel
counting do not require places — the intermediate ring is locally free of rank `deg φ` over
the Dedekind coordinate ring, so fibre counts are `finrank` plus translation (the place-free
alternate, recorded in Layer 1). What consumes this layer: the
**divisor construction of the Weil pairing** (Layer 2's functions with divisor `N(P) − N(O)`),
the **equivalence with the literature definition** (the place at `O₁` restricting to the place
at `O₂` is what the comparison rests on), **ramification bookkeeping** (the
separable-⟹-unramified milestone in its `e_w = 1` form — equivalently étaleness of the
intermediate ring), and the **class-group anchor** below. Everything here is commutative
algebra over `Affine.CoordinateRing`; the design is coordinated with Angdinata's in-flight
upstream work, whose interface this layer follows.

- **Places.** The places of `W.FunctionField` over `K` — the valuation-theoretic points of the
  regular proper curve (Stichtenoth I.1; *regular*, not *smooth* — conventions). The affine places are the maximal ideals of the
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
  ideal `(X − x₀, Y − y₀)`. Every later layer passes through this dictionary. (Stated for elliptic
  `W`; singular Weierstrass curves are not this roadmap's business.)
- **Divisors and the class-group anchor.** The divisor group on places; `deg`; `div f` for
  `f ≠ 0` with `deg (div f) = 0`; and the identification of Mathlib's class-group group law with
  the degree-`0` divisor class group: `Point.toClass` is injective upstream, and the
  **surjectivity milestone** (seeded, `toClass_surjective`) makes the point group *the whole*
  ideal class group — whence the principal-divisor characterisation (`Σ nᵢ Pᵢ` is principal iff
  `deg = 0` and `Σ [nᵢ] Pᵢ = O`, AEC III.3.4–5) rests on the group law Mathlib already proved,
  with no Riemann–Roch anywhere. ⚠ *Mathlib-track*: the shared upstream `CoordinateRing`
  split-out proves `Point.toClass_surjective` and packages `toClassEquiv` — with **no**
  ellipticity hypothesis — so the seed is consumed and deduplicated when that lands.

### Layer 0.5: base change, Galois actions, translations, and descent (cross-cutting)

Nearly every later layer silently uses this lane — the dual isogeny base-changes to `Kˢᵉᵖ`
and descends, Vélu needs translations and Galois-stable kernels, twists need effective
descent, Tate modules need continuous actions — so it starts early and is named, rather than
being distributed as bookkeeping. Its milestones:

- base change of Weierstrass equations, coordinate rings, function fields, points, and
  isogenies, compatible with identity, composition, degree, separability, `MapsInfinity`,
  duals, and induced point maps;
- Galois actions on coefficients, functions, points, places, divisors, and isogenies;
- function-field pullbacks of the translations `τ_P`, with the action and composition laws;
- the fixed-field theorem for the translation action of a finite kernel (the input to the
  dual-isogeny construction);
- descent of function-field maps from `Kˢᵉᵖ` to `K` (Galois-equivariance criterion);
- descent of the symmetric Vélu coefficients for Galois-stable finite subgroups.

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
- **The standard isogenies: `[n]`, fully specified.** `[n] : Hom(E, E)` is defined for every
  `n : ℤ`, with `[0]` the carrier's zero map and `[n]` an `Isogeny` for `n ≠ 0`. The `x`-coordinate
  alone does not determine the map (`[n]` and `[−n]` share it), so the definition fixes
  **both pullbacks**: either the complete `x`- and `y`-pullback formulas, or the
  function-field map manufactured from the rational group-law addition formulas, with the
  division-polynomial identity `x ∘ [n] = φ_n / ψ_n²` proved afterwards as a theorem
  (Mathlib's `DivisionPolynomial` files carry the polynomials; the point-level
  `[n]`-compatibility is ⚠ *mathlib-track*:
  [mathlib #13782](https://github.com/leanprover-community/mathlib4/pull/13782) and the
  further upstreaming — consumed per the dedupe convention). Required API:
  `[m] ∘ [n] = [mn]`, additivity `[m + n] = [m] ∔ [n]`, compatibility with the point-group
  scalar multiplication, base-change compatibility, and **`deg [n] = n²`** (AEC III.6.2).
  The `q`-power **Frobenius** `π_q` over `𝔽_q` (`pullback = (· ^ q)`; seeded as
  `frobeniusIsogeny` with `degree_frobeniusIsogeny`), purely inseparable of degree `q`;
  `deg (1 − π_q) = #E(𝔽_q)` is the identity Layer 3 turns into the Hasse bound.
- **Relative Frobenius, a milestone and not a one-liner.** Over an imperfect field, `p`-th
  powering is semilinear rather than a `K`-algebra map, so the target is not a single arrow:
  the **Frobenius twist** `W^{(p)}` with its coefficient description and base-change API; the
  **relative Frobenius** `F_{W/K} : W → W^{(p)}` with its function-field pullback and its
  point-level formula; iterated twists `W^{(p^r)}` and iterated relative Frobenius;
  compatibility with base change; the factorisation of every isogeny as
  `φ = φ_sep ∘ F_{W/K}^r` with uniqueness and the degree/separability formulas
  (AEC II.2.12); and **Verschiebung** `V` as the dual of relative Frobenius, with
  `V ∘ F = [p]` and `F ∘ V = [p]`. The dual construction and the finite-field theory below
  consume every one of these.
- **The hom-group and the degree form.** `Hom(W₁, W₂)`: **the carrier adjoins no `WithZero`** —
  the `F`-linear multiplicative maps `R(W₂) → K(W₁)` that are either the
  zero map or a conditioned `F`-algebra map. Into a field a multiplicative map satisfies
  `p(1) = p(1)²`, so every element is the zero map or unital: the **zero map is the unique
  non-unital element**, and the nonzero elements are exactly the `Isogeny`s — the carrier is
  the disjoint union `{0} ⊔ Isogeny W₁ W₂` carved from one mapping type, nothing adjoined
  (`WithZero (Isogeny W₁ W₂)` is the same set through `0 ↦` the zero
  map and `φ ↦ φ.pullback`, which is how formalised material in that shape migrates). ⚠ **The zero
  element is a formal tag, not a pullback**: the zero morphism sends
  every point to `O₂`, which is not a point of `Spec R(W₂)`, so it has no pullback of
  functions — indeed the genuine constant-at-`O₂` morphism would pull the constant `1` back
  to `1`, while the zero map sends it to `0`. No pullback-versus-composition compatibility
  is claimed at zero; the correctly phrased compatibility ("if the induced point map sends
  `P` to an *affine* `Q`, then `(p f)(P) = f(Q)`") is vacuous there, every point landing at
  infinity. ⚠ **The additive structure is not pointwise**: a sum of multiplicative maps is
  not multiplicative, so `Hom` is *not* an additive subgroup of the linear maps — addition
  comes from the group law (below), with the zero map as its zero. The **degree form**: `deg` is the dimension of `K(W₁)` over the fraction field of the image, with
  `deg 0 = 0` **stipulated** (the image `{0}` generates no field). The *unconditioned* form — all unital `K`-algebra homs `R(W₂) → K(W₁)`
  with no condition — is **not** the carrier: those are the dominant maps *plus the evaluations at
  affine points*, adjoining every constant map except the wanted constant-at-`O₂`, where `x`
  has a pole. The layer's real content is the `AddCommGroup` instance — the
  theorem that the **pointwise sum of
  isogenies is an isogeny or zero**: its pullback is
  manufactured from the same rational addition formulas Mathlib's group law is proved by — this
  is what makes `Hom` an additive group and `End(E)` a ring containing the subring
  `ℤ[π_q] = ℤ + ℤπ_q` generated by the Frobenius. ⚠ That subring is additively generated by
  `1` and `π_q`, so its rank is **at most** `2`; it has rank `2` exactly when `π_q` is not an
  integer-scalar endomorphism, and the scalar case occurs — `y² = x³ − x` over `𝔽₃` has
  `a₃ = 0`, so over `𝔽₉` the Frobenius is `π₉ = π₃² = [−3]` and `ℤ[π₉] = ℤ`. State the rank
  dichotomy, not a blanket rank-`2` claim, and treat the ordinary and supersingular cases
  separately where the distinction matters.
  **Rational versus geometric endomorphisms are different types**: `EndOver K E` (defined
  over `K`) and `GeometricEnd E := EndOver Kˢᵉᵖ (E.baseChange Kˢᵉᵖ)` — Layer 5 quantifies
  over `Aut (E_{Kˢᵉᵖ}, O)`, the units of the *geometric* ring, not over `K`-automorphisms.
  **Complex multiplication enters as data and as properties, at the right strength**:
  `CMAction R E` — a ring **embedding** `R ↪+* EndOver K E` (a chosen action of an order,
  which is what "CM by `R`" supplies) — with `HasGeometricCM E` the property that
  `GeometricEnd E` is strictly larger than `ℤ`, and the exact identification
  `GeometricEnd E ≃+* R` kept as a separately named, stronger predicate; each with its
  transport API. The assertion that the endomorphism ring of an ordinary curve over `𝔽_q` is
  an **order in `ℚ(π_q)`** is a substantial theorem, not bookkeeping; it is a named milestone
  of its own below, and nothing in the CM vocabulary presumes it.
  **`Aut (E, O)` is built here too**, as the units of the endomorphism ring over the field at
  hand, together with its identification with the stabiliser of the (base-changed) curve in
  Mathlib's `VariableChange` group — the object Layer 5's descent classification quantifies
  over (in its geometric form), so Layer 5's dependency on this layer is real and discharged
  here rather than assumed.
  ⚠ `ℤ[π_q]` does **not** witness it: in the ordinary case it gives only the suborder
  `ℤ[π_q] ⊆ End(E)`, and the inclusion is genuinely strict in general — for `y² = x³ + x`
  over `𝔽₅` one has `#E(𝔽₅) = 4`, `a₅ = 2`, so `π = 1 ± 2i` and
  `ℤ[π] = ℤ[2i] ⊊ ℤ[i] ≅ End(E)`, of index `2`. The correct ordinary-case target is therefore
  **`End(E)` is an order in `ℚ(π_q)` containing `ℤ[π_q]`**, with `HasCM` witnessed
  separately and explicitly (worked examples). The CM **main theorem** is out
  of scope. ⚠ The hard core of the layer — for *any* definition of isogeny — is the
  **quadraticity of the degree**: `deg` extends to a positive-definite quadratic form on
  `Hom(W₁, W₂)` (`deg [n] = n²`, the parallelogram law, bilinearity of
  `(φ, ψ) ↦ deg (φ ∔ ψ) − deg φ − deg ψ`) — the Abel-grade content behind Hasse.
- **The factorisation theorem** — made a milestone in its own right, because it is what
  the dual is built from and it is easy to state wrongly. It is typed on **isogenies**, since
  the zero homomorphism has no function-field pullback. Over **any** field `K`: for isogenies
  `φ : W₁ → W₂` and `ψ : W₁ → W₃`, `ψ` factors as `ψ = λ ∘ φ` for a unique isogeny `λ`
  **iff `ψ^*K(W₃) ⊆ φ^*K(W₂)` as subfields of `K(W₁)`** — the function-field-native
  criterion, no kernels — with `deg ψ = deg φ · deg λ` by the finrank tower formula
  (AEC III.4.11 is the classical separable form; the subfield statement subsumes it). The
  zero case is stated separately and is trivial: `0` factors through any isogeny, via `0`,
  uniquely.
  ⚠ The two classical traps are exactly what the subfield test gets right and point-kernels
  get wrong: over `ℚ` with `E(ℚ)[2] = 0`, `ker [2](ℚ) = ker(id)(ℚ) = {O}` yet
  `K(W₁) ⊄ [2]^*K(W₁)`, so `id` does not factor through `[2]`; and relative Frobenius has
  trivial geometric point kernel, yet `K(W) ⊄ π^*K(W) = K(W)^p`, so `id` does not factor
  through it. (Scheme-theoretically the criterion reads `ker φ ⊆ ker ψ` as finite `K`-group
  schemes — recorded as a remark only; group schemes are not this roadmap's language.)
- **The quotient by a finite subgroup — Vélu's formulas, no Riemann–Roch.** For a finite
  Galois-stable subgroup `Φ` of points, the quotient curve `W/Φ` and the isogeny `W → W/Φ`
  are **defined by Vélu's explicit formulas**: the translate-averaged coordinates
  `X = x + Σ_{Q ∈ Φ, Q ≠ O} (x∘τ_Q − x(Q))` and likewise `Y` satisfy an explicitly computed
  long Weierstrass equation, valid in every characteristic, with coefficients symmetric in
  `Φ` and hence in `K`. The existence content Riemann–Roch usually certifies (functions with
  pole orders `2` and `3` at the base point) is replaced by exhibited functions and a
  verifiable rational-function identity — Vélu (1971); Galbraith Ch. 25 for the checkable
  modern statement; Kohel's thesis for the kernel-polynomial, fully `K`-rational packaging
  (references). Vélu's construction takes a finite set of points as input, so it produces
  exactly the quotients by separable kernels; an inseparable kernel is invisible to it —
  relative Frobenius has trivial geometric point kernel — and needs no formulas either:
  the quotient of `W` by `ker F_{W/K}` *is* the twist `W^{(p)}`, with pullback the
  inclusion of `p`-th powers `K(W)^p ⊆ K(W)` (AEC II.2.11). Exhaustiveness is part of the
  milestone rather than an aside: by the factorisation `φ = φ_sep ∘ F^r` of the
  relative-Frobenius bullet above (AEC II.2.12), every quotient is a Frobenius power
  followed by a Vélu quotient by a set of points, so the two constructions together reach
  every isogeny.
- **The dual isogeny.** `φ̂` with `φ̂ ∘ φ = [deg φ]` and `φ ∘ φ̂ = [deg φ]` (AEC III.6.1–2),
  constructed by factoring `[deg φ]` through `φ` via the milestone above: for the **separable**
  part, base change to `Kˢᵉᵖ`, where `Kˢᵉᵖ(W₁)/φ^*Kˢᵉᵖ(W₂)` **is** Galois with group
  `ker φ(Kˢᵉᵖ)` acting by translations (AEC III.4.10(b),(c)), take the fixed field, and
  **descend** the resulting `λ` back to `K` by Galois equivariance and the uniqueness clause
  (`φ^*(σλ^*f) = σψ^*f = ψ^*f = φ^*(λ^*f)` forces `λ^*f ∈ K(W₂)`); the **inseparable** part
  goes through Frobenius separately, `[p]` being factored through it (AEC III.6.1).
  ⚠ Do **not** say "the Galois correspondence over `K`": the extension attached to a separable
  isogeny is generally *not* Galois over the ground field — `[2]` over `ℚ` with no rational
  `2`-torsion gives a degree-`4` separable extension with trivial `ℚ`-automorphism group. The
  `Kˢᵉᵖ` base change and the descent step are part of the milestone, not bookkeeping. ⚠ And
  `MapsInfinity` for `λ` must not be proved circularly: before `λ` is packaged as an isogeny
  it is only a function-field embedding, with no point map to evaluate. The route is an
  **unpointed induced-place map** for finite function-field embeddings, with the named
  criterion `MapsInfinity λ ↔ λ_*(O₂) = O₃` (equivalently its valuation/integral-closure
  form), and functoriality of induced places along `λ ∘ φ = ψ` — which yields
  `λ_*(O₂) = λ_*(φ_*(O₁)) = ψ_*(O₁) = O₃` at the level of places, *then* `λ` is packaged.
  Bilinearity of `(φ, ψ) ↦ φ̂ ∘ ψ` and `deg φ̂ = deg φ`.
  (For **endomorphisms** — the only place `[tr φ] − φ` type-checks — the Abel-free trace
  trick of Katz–Mazur 2.6.2.2, the scheme provenance's route, replays verbatim once `End(E)`
  is a ring and may be taken there instead; a general `φ : W₁ → W₂` has its dual in
  `Hom(W₂, W₁)` and gets it from the factorisation above. The construction of record is
  Silverman's factorisation — fully scheme-free.)
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
  exactly this. ⚠ API design: the differential API is pinned to these consumers and
  nothing more — the separability criterion, `[n]^* ω = n • ω`, the `e_w = 1` milestone, and
  Layer 4's formal-group uses — and its design model is the HasseWeil provenance, whose
  capstone genuinely consumes it: `HasseBound/Separability.lean` imports
  `Foundation/InvariantDifferentialPullback`, and `Foundation/EC/MulByIntUnramified.lean` is
  the `e = 1` input, citing AEC III.4.10(c) (§Provenance).
- **The formal group — four milestones with four different hypothesis sets, not one.**
  (i) The elliptic formal group *law* `Ê` over the coefficient ring, from expanding the group
  law at `O` (AEC IV.1), as an instance of Mathlib's `RingTheory/FormalGroup`; `[m]` on `Ê`.
  (ii) The formal logarithm and exponential, over a coefficient ring containing `ℚ`
  (characteristic-zero hypotheses only here). (iii) Convergence: over a complete valued
  field, `Ê(𝔪)` as an honest group of points. (iv) The identification `Ê(𝔪) ≅ E₁(K)` with
  the kernel of reduction for an integral model (IV.6; consumed by Layers 3–4). These cannot
  share one typeclass bundle, and the existing sorry-free Stoll development (provenance) is
  the port source — refounded on Mathlib's formal-group-law layer, not rebuilt from nothing.

### Layer 2: torsion, the Weil pairing, and the Tate module (AEC III.6–8)

- **The structure of `E[N]`.** Over a **separably closed** field `K` with `(N : K) ≠ 0`
  (i.e. `char K ∤ N`), `E[N] ≃+ (ZMod N)²` (AEC III.6.4), with `E[N]` as
  `Submodule.torsionBy ℤ (E.Point) N`; isogeny-theoretically `E[N]` is the fibre of `[N]` over
  `O`, counted by Layer 0's `Σ e · f = deg` identity together with Layer 1's
  separable-⟹-unramified milestone. The milestone
  (seeded) exposes what the later layers consume: `E[N]` is a
  **additively equivalent to `(ZMod N)²`** (`torsion_addEquiv_prod`), wrapped
  in `Nonempty` because the basis is noncanonical — stated as a `≃+` with no `ZMod N`-module
  packaging, per §Conventions, since such an equivalence is automatically `ZMod N`-linear. The full `N`-torsion
  theory throughout requires `char K ∤ N`. Layer 1's `[N]`-surjectivity supplies the counting
  input. ⚠ *Mathlib-track*: the `E[N]`-structure code itself is expected to be done in
  Mathlib directly; it is built here when Layer 2 needs it and swapped
  for upstream when that lands, per the dedupe convention.
- **The Weil pairing — the divisor construction.** `e_N : E[N] × E[N] → μ_N`
  (AEC III.8.1), pinned as an additive **bilinear** map into `Additive (rootsOfUnity N K)`
  (seeded). The construction is the **divisor calculus of Layer 0** — under scheme-free
  foundations it is the route whose prerequisites are visible, and the dual isogeny alone
  does not produce a definition without Cartier-duality or theta-group machinery. Its named
  prerequisites, each a milestone: existence of a function with divisor `N(P) − N(O)`;
  moving a divisor within its class to obtain disjoint support; evaluation of a function on
  a divisor of disjoint support; **Weil reciprocity** `f(div g) = g(div f)`; and independence
  of every function and divisor choice. Then the theory: alternating, **nondegenerate** over
  a separably closed field with `N` invertible (seeded), Galois-equivariant, compatible with
  isogenies via the dual (`e_N(φP, Q) = e_N(P, φ̂Q)`) — the consumer-facing API — and
  functorial under change of field.
- **The Tate module.** For `ℓ` **prime**, `ℓ ≠ char K`: the inverse system `E[ℓⁿ]` with its
  transition maps, `T_ℓ E = lim E[ℓⁿ]` a free `ℤ_ℓ`-module of rank `2` with its profinite
  topology, the `ℓ`-adic Weil pairing, and the continuous Galois representation into
  `Module.Aut ℤ_ℓ (T_ℓ E)` — the identification with `GL₂(ℤ_ℓ)` only after a noncanonical
  basis choice (AEC III.7). The Tate twist `ℤ_ℓ(1) = T_ℓ μ` and the determinant theorem
  (`det = ` the cyclotomic character, via the pairing) are named milestones.
  ⚠ *Mathlib-track*: to be done directly in Mathlib in due course — built
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
  ⚠ **The proof's internal notions are private computations, not a second public theory.** The existing
  proof manufactures an equation-level Frobenius `(x, y) ↦ (x^q, y^q)`, kernel-cardinality
  degrees, and a finite-level pairing. The statement consumes none of them, and none of them may
  appear in a **public** statement — Layer 1 is the sole public notion of isogeny. Under the
  function-field definition these are not a parallel theory to be reconciled across worlds; they
  are the **point-level counterparts** of Layer 1's objects, identified by two named lemmas: the
  Frobenius isogeny induces `(x, y) ↦ (x^q, y^q)` on points (the Layer-0 dictionary applied to
  `pullback = (· ^ q)`), and kernel cardinality equals `deg` on the **separable** locus (the
  `Σ e · f` identity with `e ≡ 1` from Layer 1's separable-⟹-unramified milestone) — the
  only locus where the existing proof counts kernels (its
  coprime-route design; the one inseparable actor, `π_q` itself, never has its kernel counted —
  its degree `q` enters through the Galois `q`-power pairing scaling). Once Layers 0–1 land, the
  **restatement against the degree form is a named milestone discharged by rewriting along those
  two lemmas — the existing proof reused, not redone** — and the bespoke notions are thereby
  certified as computations of the real ones and kept internal.
- **The zeta function of `E/𝔽_q`** — defined the standard way, rational by *theorem*:
  `Z(E/𝔽_q, T) = exp(Σ_{n ≥ 1} #E(𝔽_{qⁿ})·Tⁿ/n) ∈ ℚ⟦T⟧`. Three milestones (AEC V.2 —
  elementary given the layers above; nothing Weil-conjectures-flavoured is needed at genus
  one): **(i)** the count identity — with the formal model of `E(𝔽_{qⁿ})` **decided, not left to
  notation**: Mathlib's `FiniteField.Extension` is a noncanonically chosen extension, so
  `E(𝔽_{qⁿ})` does not name a type by itself. The model of record is the **fixed points of
  `π_qⁿ` on `E(𝔽̄_q)`** (equivalently on `E(Kˢᵉᵖ)`), for which the Frobenius-iteration
  compatibility is a theorem to prove, not a definitional identity — the comparison with the
  base-change-to-a-chosen-extension model, and invariance of the count under the noncanonical
  field equivalences, are separate named lemmas. The identity is
  `#E(𝔽_{qⁿ}) = deg(1 − π_qⁿ)`, together with the **Frobenius identities as theorems**:
  `π_q ∘ π̂_q = [q]`, `π_q ∔ π̂_q = [a_q]`, and `π_q² − [a_q]π_q + [q] = 0`;
  **(ii)** the trace sequence `t : ℕ → ℤ` defined for all `n` with `t 0 = 2`, `t 1 = a_q`,
  and the recursion `t_{n+2} = a_q·t_{n+1} − q·t_n`, proved inside the commutative subring
  `ℤ[π_q]` from the quadratic relation and bilinearity of the degree pairing — never by
  introducing eigenvalues in a quadratic extension, which would case-split on `a_q² = 4q`;
  **(iii)** rationality `Z = (1 − a_q T + q T²)/((1 − T)(1 − qT))`, from (ii) and the formal
  identity `exp(Σ_{n ≥ 1} cⁿTⁿ/n) = (1 − cT)⁻¹` — Mathlib's `PowerSeries.exp`/`log` API
  (`RingTheory/PowerSeries/Log.lean`) is in place for this step. The **functional equation**
  is stated for the rational function (an identity in `ℚ(T)`, or of Laurent expansions):
  `T ↦ 1/(qT)` is not an operation on formal power series, so the power-series object never
  carries it. The **Riemann hypothesis for `E/𝔽_q`** (roots of absolute value `q^{-1/2}`,
  equivalent to Hasse) is then a corollary of the closed form.

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
  complete — Hensel's lemma gives the right-exactness), and the identification `Ê(𝔪) ≅ E₁(K)`
  connecting the formal group (Layer 1) to the kernel of reduction (VII.2.2, the formal group
  converging over complete `K`).
- **Néron–Ogg–Shafarevich (discrete strand), in three separate statements.** (i) Good
  reduction `↔` unramified `T_ℓ`-action, for **`ℓ ≠ char k`** — the *residue* characteristic:
  `ℓ ≠ char K` is vacuous in mixed characteristic, and `T_p E` need not be unramified even
  with good reduction (AEC VII.7.1, over complete `K` with perfect `k`). (ii) Potential good
  reduction `↔` the inertia image on `T_ℓ E` is finite. (iii) **Under potential good
  reduction**, good reduction `↔` the inertia action on `E[N]` is unramified, for `N ≥ 3`
  with `char k ∤ N`. ⚠ The hypothesis in (iii) is necessary: an unconditional finite-level
  criterion is false — the curve 11a1 has multiplicative reduction at `11` while `E[5]` is
  unramified there — so no bare "`E[N]`-criterion" is stated. Consumes the Tate module
  (Layer 2) and the filtration above; stated and proved on equations — precisely the part of
  the local theory that never needed the Néron model.
- **Tate's algorithm (discrete strand) — an output type plus correctness theorems, not a
  bare datatype.** From a minimal Weierstrass equation over a Henselian (classically
  complete) DVR with **perfect** residue field: the enumerated output type — named
  `ReductionSymbol` (`I₀, Iₙ, II, III, IV, I₀*, Iₙ*, IV*, III*, II*`) until a geometric
  comparison exists, since "Kodaira type" with its intended geometric meaning goes
  with the Néron model — with the correctness obligations stated as milestones: termination
  and exhaustiveness of the decision procedure; disjointness of its branches; invariance
  under admissible integral changes of variables and under the choice of minimal equation;
  and correctness of the residue-polynomial and split/nonsplit tests. The **algorithmic
  (Ogg) exponent** `v(Δ) − m + 1` (`m` the component count read off the symbol) — called
  that, not "the conductor", until identified with the ramification-theoretic conductor —
  and the local index `c_p`, with the theorem that the algorithm's computed `c_p` **equals
  the point-group index `[E(K) : E₀(K)]`**, and that the output's component count agrees
  with the components the algorithm constructs (ATAEC IV.9; Tate, LNM 476, 1975).
  ⚠ *Mathlib-track*: all of this is expected to land in Mathlib directly — built here
  per the dedupe convention and swapped for upstream when it arrives. The
  **ramification-theoretic** conductor and its identification with this algorithmic `f_p` —
  where residue characteristics `2` and `3` both bring wild-conductor complications, but only
  the **mixed characteristic `(0, 2)`** case was missing from Ogg's proof: Silverman does
  residue characteristic `3` and refers `2` to Saito (Duke 1988), whose arithmetic-surface
  proof is uniform in the residue characteristic — is a
  **separate, related project**, cited (Saito) for context only; likewise the deeper
  Tamagawa-number theory once the point-level reduction map exists.
- **The Tate curve (analytic strand).** For `K` a complete rank-1 valued field (nondiscrete
  allowed — `ℂ_p` qualifies) and `q : Kˣ` with `|q| < 1` — ⚠ type `q` as a **unit**, since
  `q = 0` satisfies `|q| < 1` and makes `qᶻ` meaningless at negative exponents — the Tate curve `E_q` and its uniformisation — pinned as the
  **point-level, Galois-equivariant statement**, since `Kˢᵉᵖ` is not complete and no
  rigid-space quotient is in scope: for each finite extension `L/K` (complete, or completed),
  a group isomorphism `L^× / q^ℤ ≅ E_q(L)`, compatible in `L` and Galois-equivariant, with
  the subgroup `q^ℤ`, the uniformisation map, its kernel and surjectivity all named
  milestones. The coefficients are explicit `q`-series **defined over `ℤ⟦q⟧` first**:
  `a₄ = −5s₃(q)` and, for `a₆`, the series `−(5s₃ + 7s₅)/12` — where the divisibility of the
  numerator's coefficients by `12` is a **theorem** (so the division happens in `ℤ⟦q⟧`, and
  only then is the series mapped to `K`; no division by `12` in the field, which residue
  characteristics `2` and `3` would forbid), `s_k(q) = Σ_{n≥1} n^k qⁿ/(1 − qⁿ)` — convergent
  from `|q| < 1` and completeness alone; Mathlib's complex `℘` is nowhere involved. Named
  outputs: `Δ(q)`, `j(q) = 1/q + 744 + ⋯`, `v(Δ) = v(q)`, and the split-multiplicative-
  reduction theorem for `E_q`. Sources: ATAEC V.3.1 and
  V.5.3 for the discretely valued case; Tate, *A review of non-Archimedean elliptic
  functions* (1995, circulated since 1959) and Roquette (1970) for a general complete
  rank-1 field (references). This strand consumes the rank-1 generalisation of Mathlib's
  reduction predicates flagged in the consume-section above.

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
cohomologically, with `Ш` inside it; the reading of its classes as curves belongs to the
scheme-facing roadmap. This layer deliberately does not conflate the two.

- **General (pointed) twists — both sides of the classification defined.** The theorem
  needs a classified object, not only a cohomology set: the **type of pointed twists** —
  pairs of a curve `E'/K` with a pointed `Kˢᵉᵖ`-isomorphism to `E` — quotiented by pointed
  `K`-isomorphism; the geometric automorphism group `Aut (E_{Kˢᵉᵖ}, O)` with its continuous
  Galois action; **cocycle extraction** from a chosen trivialisation, with independence of
  the choice; **effective descent** constructing a twist from a cocycle of variable changes;
  the two inverse proofs; and the theorem that every pointed isomorphism of Weierstrass
  models is a `VariableChange` (which is what makes the descent equation-level). The
  classification `H¹(Gal, Aut (E_{Kˢᵉᵖ}, O))` (AEC X.5) then states a bijection between the
  two constructed sides. Concrete quadratic twists (below) are **core**; the full nonabelian-
  `H¹` classification is a **stretch** milestone, and the continuous nonabelian `H¹`
  prerequisite (spelled out in §Layer 7's dependency note) is **this layer's**: Layer 7's own
  coefficient modules are abelian, so it needs the forced-discrete constructor, not this. For `j ≠ 0, 1728`, `Aut (E, O) ≅ {±1}` — in characteristics
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
  anti-equivariant by the quadratic character (seeded — ⚠ the finite-`M/K` case of
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
  leaves its finiteness as a TODO — discharged here). The height half of the descent is the
  **naïve `x`-height route, as in the existing Stoll formalisation**: the naïve height, its
  approximate parallelogram law (bounded difference from quadraticity), and Northcott
  finiteness — no canonical height is needed for the theorem, which keeps this layer's
  unformalised prerequisites small. The **canonical (Néron–Tate) height is a separate, later
  milestone** (consumed by regulators, isogeny compatibility, and BSD, not by Mordell–Weil):
  construction of `ĥ` with bounded difference from the naïve height, quadraticity,
  nonnegativity, `ĥ(P) = 0 ↔ P` torsion, the Néron–Tate bilinear pairing, the isogeny
  compatibility `ĥ_{E'}(φP) = deg φ · ĥ_E(P)`, the **regulator** as the Gram determinant on
  a basis of the free quotient with basis independence, and the rank-zero convention
  `Reg = 1`. The elliptic-curve Selmer group `Sel_m(E/K)` of Layer 7 is the cohomological
  *refinement* of this argument, not its prerequisite.
- **Explicit `2`-descent (core, this layer).** The Stoll development already contains
  arithmetic `2`-descent: the local conditions, the explicit `2`-Selmer group inside the
  square classes of the étale algebra `K[X]/(f)`, its finiteness, and the theorem converting
  its cardinality into a **Mordell–Weil rank bound** — none of which needs Layer 7's
  cohomological framework. Migrate it here as its own lane, with the existing
  `y² = x³ − x + 1` rank computation as the early acceptance test. The comparison of this
  explicit étale-algebra `2`-Selmer group with the abstract cohomological `Sel₂(E/K)` is a
  named Layer-7 milestone.
- **The torsion subgroup and Nagell–Lutz.** Finiteness of `E(K)_tors` is a *corollary* of
  Mordell–Weil (finitely generated abelian groups have finite torsion), not a separate
  milestone; the content is **computability**. Over `ℚ` the theorem is wanted for
  **both integral models**, exactly as the provenance proves it: for an integral **long**
  Weierstrass model (`a₁, …, a₆ ∈ ℤ`), a nonzero torsion point has `x, y ∈ ℤ` unless it has
  order exactly `2`, where the honest bound is `4x, 8y ∈ ℤ`
  (`lutz_nagell_integrality_general`, with its discriminant companion); and for an integral
  **short** model `y² = x³ + Ax + B` (where Mathlib's `Δ` evaluates to `−16(4A³ + 27B²)` —
  a computed fact about the existing definition, not a convention to be made here), the
  classical full form — `x, y ∈ ℤ` and `y = 0` or `y² ∣ Δ` (`lutz_nagell`; AEC VIII.7). Route:
  division polynomials (⚠ *mathlib-track*: the division-polynomial material being upstreamed
  is assumed done and consumed here). The **formal-group integrality
  refinement** — every prime in a coordinate denominator appears to order `≥ 2`, the
  provenance's PID-level `den_powerful_of_on_curve` — is a named later milestone consuming
  Layer 4's filtration, not an aside. The **reduction-injectivity bound**
  `E(ℚ)_tors ↪ Ẽ_ns(𝔽_p)` holds for good **odd** `p` (at `p = 2` only the prime-to-`2`
  torsion injects; the general statement is injectivity on prime-to-`p` torsion) — gated on
  Layer 4's point-level reduction map (the projective-coordinates API flagged there).

### Layer 7: Selmer groups and Sha (AEC X.4)

- **Selmer structures, the Selmer group, and Sha.** Selmer theory is set up **for a general
  Galois module first**: a **Selmer structure** `𝓕` on a discrete
  `Gal(Kˢᵉᵖ/K)`-module `M` — local-condition subgroups `H¹_𝓕(K_v, M) ⊆ H¹(K_v, M)` for each
  place `v`, unramified at almost all `v` — with its Selmer group `Sel_𝓕(M/K) ⊆ H¹(K, M)`, à la
  Rubin's *Euler Systems* I.§1–2, so the same API later serves abelian varieties and other
  Kummer sequences. Cohomology is taken with the
  coefficient module **forced discrete**, and the **first named milestone of this layer is
  the constructor** — `H^i` of a topological group acting with **open stabilisers** on a
  bare abelian group, defined by locally constant cochains (equivalently, continuous
  cohomology after *imposing* the discrete topology, stated so that it wins even when the
  module already carries a different topology: `K̄ˣ` over a `p`-adic `K` is the cautionary
  case) — with the finite-Galois-quotient colimit comparison as its API. Mathlib does not
  have this constructor. This is the standard setting for `E[m]` and `E(Kˢᵉᵖ)`, and all
  that `Sel_m` and `Ш` need. The elliptic instances plug in the classical conditions:
  the `m`-descent exact sequence (**`m ≥ 2`** throughout — `m = 1` is tautological with all
  three terms zero, and `[0]` is not a finite isogeny, so the Kummer sequence does not apply)
  `0 → E(K)/mE(K) → Sel_m(E/K) → Ш(E/K)[m] → 0` from the Kummer
  sequence for `[m] : E → E`, the finiteness of `Sel_m(E/K)` (AEC X.4.2) — the **effective
  refinement** of Layer 6's weak Mordell–Weil, giving the computable rank bound — and the
  Shafarevich–Tate group `Ш(E/K)` for the module `E(Kˢᵉᵖ)`, cut out by everywhere-local
  triviality. The **genus-one torsors** excluded from Layer 5 appear here *as cohomology*: the
  Weil–Châtelet group `WC(E/K) = H¹(Gal(Kˢᵉᵖ/K), E(Kˢᵉᵖ))` (AEC X.3) needs no geometry to
  define, and `Ш` is its everywhere-locally-trivial part; the geometric reading of its classes
  as curves belongs to the scheme-facing roadmap.
- **Stretch: the BSD quotient and Cassels' isogeny-invariance.** The conjecture stays out, but
  **assuming `Ш(E/K)` finite** the *arithmetic* side of BSD is definable: the BSD quotient
  `Ω(E) · Reg(E/K) · #Ш(E/K) · ∏_p c_p / #E(K)_tors²` — the regulator from the canonical height
  (Layer 6), the `c_p` from Tate's algorithm (Layer 4), `Ш` from this layer — and **Cassels'
  theorem** that it is unchanged by isogeny (Cassels 1965). ⚠ Cassels is **not** a
  consequence of the `[m]`-Selmer sequence alone; its stretch status carries its own
  prerequisite list: Selmer groups attached to an arbitrary isogeny `φ` and its dual
  (`E[φ]`, `Sel_φ`, `Sel_φ̂`) with their Kummer sequences; the local Kummer-cokernel
  indices; **local Tate duality** and the global duality/product formula the proof uses;
  transfer of Sha finiteness across an isogeny; and the transformation of the regulator,
  periods, Tamagawa numbers, and torsion under isogeny. For the *truth of BSD* to be
  isogeny-invariant one must also prove that isogenous curves have the **same local Euler
  factors**, hence the same `L`-function. Still a stretch goal, with the target fixed and
  pinned to **`K = ℚ`**: the milestone is the full quotient, period included — the period-free
  part is not isogeny-invariant, so it would gut Cassels' theorem — with
  the real period of the **global minimal** Weierstrass equation. Two prerequisites, each an
  explicit milestone:
  **(i) the global minimal model is its own theorem** — Layer 4 minimises over *one* DVR at a
  time, which does not by itself produce a single integral equation minimal at every prime.
  The obstruction is the **Weierstrass class** `[𝔞_Δ]` in the ideal class group, with
  `𝔇_{E/K} = (Δ)·𝔞_Δ^{12}`: a global minimal equation exists iff `[𝔞_Δ] = 1` (AEC VIII.8.2),
  which holds over `ℚ` because `h(ℚ) = 1` (VIII.8.3), the translations glued by CRT; two such
  equations differ by `u = ±1` and `r, s, t ∈ ℤ`, so `ω_min` is **well-defined up to sign**.
  **(ii) the period is defined by an explicit integral**, not by an unexplained
  `∫_{E(ℝ)}|ω_min|`: with `D_W(x) = 4x³ + b₂x² + 2b₄x + b₆ = (2y + a₁x + a₃)²`, the target is
  `Ω(E) = 2·∫_{{x ∈ ℝ : D_W(x) > 0}} dx / √(D_W(x))` (the factor `2` for the two `y`-branches;
  one or two real components handled uniformly), stated with `lintegral` plus a finiteness
  proof and `ENNReal.toReal` so that non-integrability cannot silently read as `0`. Mathlib has
  `b₂`, `b₄`, `b₆` and `Real.sqrt`. The manifold formulation `∫_{E(ℝ)}|ω|` — needing the real
  locus as a compact `1`-manifold with a density — is the *later* comparison theorem, not the
  definition (Haar measure alone will not do: its normalisation is arbitrary). Dependencies:
  `ω` (Layer 1), minimality and the `c_p` (Layer 4), the regulator (Layer 6), `Ш` (this
  layer). ⚠ Over a general number field there is no global minimal model in general, and the honest
  general-`K` period is defined through complex uniformisation on `ℂ/Λ` (J. Cremona) —
  exactly the material this roadmap excludes; the general-`K` BSD quotient
  therefore belongs to the complex-analytic successor roadmap (where Mathlib's `℘`-function
  is ready for it). The choice of `ℚ` is forced, not aesthetic: the elementary period needs
  every infinite place real (a complex place makes the local period a genuinely
  two-dimensional integral) and the unit group `{±1}` (with infinite units only the
  *product* of local periods is well-defined, via the product formula) — and by Dirichlet,
  unit rank `r₁ + r₂ − 1 = 0` with a real place forces `K = ℚ`; `h(ℚ) = 1` is the bonus,
  not the reason. What *is* in scope beyond the arithmetic quotient is a **statement-only
  milestone**: full BSD over `ℚ`, as a stretch goal with its hypotheses pinned exactly. The
  analytic hypothesis must identify a continuation of the **actual Dirichlet series**: an
  analytic function on a connected open set containing both `s = 1` and a part of the
  half-plane of convergence, agreeing with the series there — merely assuming "a function
  analytic near `s = 1`" admits an unrelated germ and states nothing. With that: the order
  of vanishing `r`, the leading coefficient `L^{(r)}(1)/r!`, the finite support of
  `∏_p c_p`, the real-period convention (the global minimal differential, as fixed above),
  and `Ш(E/ℚ)` finiteness as hypothesis — the rank equality and the leading-coefficient
  identity against the quotient above. **Proving** anything about it stays out of scope.
- ⚠ **Dependency — what is actually missing.** Pinned Mathlib has the *abelian* group-
  cohomology material: group cohomology with the explicit low-degree API, the long exact
  sequence, Shapiro's lemma, and Hilbert 90 for **finite** extensions
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/` — its own docstrings list
  infinite Galois cohomology as future work), and continuous cohomology of topological
  groups. It does **not** have the nonabelian `H¹` this roadmap needs: the file
  `Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean` is degree-one cohomology of a
  presheaf of groups in a Čech-like site setting, not continuous nonabelian cohomology of a
  profinite group on a discrete group. That material is a prerequisite lane of its own,
  needed by **Layer 5**, whose twist classification is the nonabelian statement: continuous
  nonabelian `1`-cocycles, the coboundary equivalence, the pointed set `H¹_cts(G, A)`,
  functoriality and restriction, and the reduction to finite quotients for profinite `G` and
  discrete `A`. *This* layer's coefficient modules (`E[m]`, `E(Kˢᵉᵖ)`, and the
  Cassels/local-duality material) are all abelian, so what it needs from below is instead the
  **forced-discrete constructor** itemised at the head of this layer. Beyond that, the **Galois-specific packaging**, none
  of it upstream yet: profinite Galois groups acting continuously on discrete modules such
  as `E(Kˢᵉᵖ)` with the finite-level comparison (`H¹` as the colimit over finite Galois
  quotients); the Kummer/descent connecting map and exact sequence for `[m] : E → E`;
  inflation–restriction in that continuous setting; and the **local–global interface, made
  explicit**: the finite and infinite places with their completions; embeddings
  `Kˢᵉᵖ → K_vˢᵉᵖ` (equivalently a decomposition-group construction) with independence of the
  choice up to conjugacy; restriction maps on continuous cohomology; local Kummer maps and
  the local-condition subgroups; unramified local cohomology; the finite set `S` of places
  outside which the conditions are unramified; the global kernel defining `Sel_m`; and an
  explicit finiteness route for `H¹(G_{K,S}, E[m])` — via finite extensions of bounded
  degree and Hermite–Minkowski. The discreteness of coefficient modules is carried by the
  forced-discrete constructor above (a wrapper, so no reliance on one topology instance
  "winning" against a pre-existing one). The layer is stated against that packaging once it
  exists. (***Proving*** BSD, which would relate `Ш` and the rank to
  `L(E, s)`, is out of scope — it needs the analytic continuation of `L(E, s)` that Mathlib does
  not have; the statement-only milestone above, with its analytic hypothesis, is what is in.)

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **The point–place dictionary and the class-group anchor.** `W.toAffine.Point` is exactly the
  degree-`1` places of the function field (`O ↦ infinityPlace`), and `toClass` is onto the ideal
  class group (`toClass_surjective`, with Mathlib's `toClass_injective`) — the Layer-0 identifications
  every later layer uses.
- **Frobenius is an isogeny:** over `𝔽_q`, `pullback = (· ^ q)` satisfies `MapsInfinity`, is
  purely inseparable of degree `q`, and induces `(x, y) ↦ (x^q, y^q)` on points
  (`frobeniusIsogeny` and `degree_frobeniusIsogeny`, seeded).
- **`[n]` is surjective on `E(Kˢᵉᵖ)`** for `n` invertible in `K`, and `#E[N] = N²` for `N`
  invertible in `K` — the Layer 1/2 counting gate (`smul_surjective`, `torsion_addEquiv_prod`).
- **The Weil pairing is bilinear and nondegenerate** — an additive bilinear map into
  `Additive (rootsOfUnity N K)`, with `e_N(P, ·) ≡ 0 ⇒ P = 0` over a separably closed field with
  `N` invertible (`weilPairing`, `weilPairing_nondegenerate`).
- **Hasse:** `a_q² ≤ 4q` for the Frobenius trace `a_q = q + 1 − #E(𝔽_q)` (`hasse_bound`) — landed
  first from the equation-level proof; then **restated against the Layer-1 degree form** through
  the two comparison lemmas of the function-field dictionary, the existing proof reused rather than
  redone. The restatement is the acceptance test of the dictionary itself.
- **`j` is a twist invariant** but the curves differ: `j(E^L) = j(E)` while `E^L ≇ E` over `K`, and
  `E^L(M) ≅ E(M)` once `L ⊆ M`, with the Galois action twisted by the quadratic character
  (`j_quadraticTwist`, `quadraticTwistPointEquiv`).
- **Tate's algorithm, one certified entry per Kodaira type** (LMFDB label @ prime): the
  parametric family `v(Δ) = n`, `v(c₄) = 0 ↦ Iₙ` with `f = 1` — instances `I₁` on 11.a1@11,
  `I₂` on 14.a4@7, `I₅` on 11.a2@11 — then `II` on 27.a4@3, `III` on 24.a5@2, `IV` on
  20.a3@2, `I₀*` on 32.a1@2, the `Iₙ*` family with `I₁*` on 24.a4@2 and `I₂*` on 45.a8@3,
  `IV*` on 20.a2@2, `III*` on 24.a3@2, and `II*` on 24.a1@2 — one certified example per
  Kodaira symbol. ⚠ That is **not** the same as every branch of the algorithm: the multiplicative
  entries above are all *split* (e.g. `I₅` on 11.a2@11 has `c_p = 5`), and the splitting test is
  what the Tamagawa number sees — `c_p = n` when `Iₙ` is split, `gcd(2, n)` when it is nonsplit.
  So the list also carries the missing branches: **good reduction** (`I₀`) at 11.a1@2, and
  **nonsplit** `Iₙ` at both parities — `I₈` on 45.a8@5 (`c_p = 2`, even) and `I₁` on 24.a5@3
  (`c_p = 1`, odd). Additive types have their own residue-polynomial splitting subbranches
  affecting `c_p`; genuine decision-path coverage is a stronger goal than this list, and is
  named as such.
- **Torsion and rank on named curves:** `E(ℚ)_tors ≅ ℤ/5ℤ` for 11.a3, certified by
  Nagell–Lutz (a finite integral search); rank `≥ 1` for 37.a1 via the point `(0, 0)`,
  certified of infinite order by **reduction at two primes** (its orders in two good-
  reduction point groups are incompatible with any single torsion order) — an available
  certificate, unlike positive canonical height, which waits on the canonical-height
  milestone; upgraded to rank `= 1` by the **explicit `2`-descent of Layer 6**. Torsion is
  decidable today, explicit `2`-descent rank bounds are Layer-6 material, and only the
  general cohomological `m`-Selmer machinery is Layer-7 material.
- **CM as a predicate, and the gap `ℤ[π_q]` leaves:** over `ℚ(i)` the curve
  `y² = x³ + x` witnesses `HasCM` for `ℤ[i]`; and the *same equation over `𝔽₅`* is the
  cautionary instance — it is ordinary with `π = 1 ± 2i`, so `ℤ[π] = ℤ[2i]` is index `2` in
  `End(E) ≅ ℤ[i]`, showing that "contains `ℤ[π_q]`" is strictly weaker than `HasCM`. The
  predicate and its witnesses only; the CM main theorem stays out of scope.
- **Mordell–Weil:** `E(K)` is finitely generated for a number field `K`
  (`fg_point_of_numberField`), and its free rank plus a finite torsion subgroup describe it.

## Ordering

Dependency order is not a schedule: independent lanes proceed in parallel, and the
cross-cutting Layer 0.5 starts early because Layers 1, 2, 4, and 5 all use it. The lanes:

1. **Function fields, isogenies, base change, and descent** — Layers 0, 0.5, 1. Layer 0 is
   the foundation; Layer 1 builds on it, on Layer 0.5, and on the division polynomials.
2. **Finite fields** — Layer 3 (Hasse, zeta): the Hasse bound is the earliest PR, its
   existing proof self-contained; the zeta strand needs Layer 1's Frobenius identities.
3. **Formal groups, reduction, and local arithmetic** — Layers 1 (formal group), 4. Layer 4
   consumes the formal group, the Tate module (Layer 2), and Mathlib's reduction theory;
   Layer 5's split-reduction statement feeds back into Layer 4's analytic strand, so those
   two land together, not in numeric order.
4. **Torsion and pairings** — Layer 2, on the dual isogeny and the divisor calculus.
5. **Heights, Mordell–Weil, and explicit `2`-descent** — Layer 6: naïve-height Mordell–Weil
   and the explicit étale-algebra `2`-descent, independent of Layer 7; the canonical height
   is its own later milestone.
6. **Continuous Galois cohomology, twists, and abstract Selmer groups** — the
   nonabelian-`H¹` prerequisite (used by Layer 5's classification and Layer 7), then
   Layer 7's Selmer/Sha, refining Layer 6's descent.
7. **Cassels and the conditional BSD statement** — stretch, after lanes 3, 5, 6.

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
- J. Vélu, *Isogénies entre courbes elliptiques*, C. R. Acad. Sci. Paris Sér. A **273** (1971),
  238–241 — the explicit quotient-by-a-finite-subgroup formulas (Layer 1). Modern checkable
  statements: S. Galbraith, *Mathematics of Public Key Cryptography*, Ch. 25
  ([author's page](https://www.math.auckland.ac.nz/~sgal018/crypto-book/ch25.pdf)); D. Kohel,
  *Endomorphism rings of elliptic curves over finite fields*, Berkeley thesis (1996)
  ([pdf](https://www.i2m.univ-amu.fr/perso/david.kohel/pub/thesis.pdf)) — the
  kernel-polynomial, fully `K`-rational packaging.
- J. Tate, *A review of non-Archimedean elliptic functions*, in J. Coates, S.-T. Yau (eds.),
  *Elliptic Curves, Modular Forms, & Fermat's Last Theorem* (Hong Kong, 1993), International
  Press (1995; circulated since 1959) — the Tate curve over a general complete
  non-archimedean field (Layer 4's analytic strand).
- P. Roquette, *Analytic Theory of Elliptic Functions over Local Fields*, Hamburger
  Mathematische Einzelschriften N.F. 1, Vandenhoeck & Ruprecht (1970) — the book treatment in
  the same rank-1 generality.
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

- **AINTLIB** (`github.com/CBirkbeck/AINTLIB`; public, **Apache-2.0**, and the repository belongs to this roadmap's
  author, so relicensing questions do not arise for the migration): the modular-curves project at
  `dev/modular-curves @ 50d5f9d37387` (strategy library and
  feasibility evidence, not a port source — see below), the HasseWeil project at
  `dev/hasse-weil @ 513e83879e2f`, and the NagellLutz project (`projects/NagellLutz`) at
  `dev/modular-curves @ 9fec8eba7652`.
- **The Angdinata isogeny development** (shared with the roadmap authors ahead of its mathlib PRs;
  there is no public revision to pin, so the shared files are the contract):
  `Isogeny.lean` on three mathlib-bound supports — the `CoordinateRing` split-out,
  `RingTheory/ClassGroup/RelNorm`, and `RingTheory/IntegralClosure/NormalizationFinite`.
  Details in the Layers 0–1 entry below; pin to the PR numbers once they exist.
- **FLT** (`github.com/ImperialCollegeLondon/FLT`, Apache-2.0): the quadratic-twist development of
  PR #1088, merged as `bc2fe8ff7396`.
- **Mordell–Weil / local fields** (`github.com/MichaelStollBayreuth/EllipticCurves`,
  **Apache-2.0**): `66889eada51a` — the elliptic-curve part of the former Heights development,
  extracted to its own repository, ported to the Lean 4 module system, pinned to Mathlib
  v4.32.0, and sorry-free (per its author). Its licence permits the migration, so this is a
  source to migrate, not merely a model.

- **Function-field foundations and isogenies (Layers 0–1).** The `Isogeny` definition and its
  opening theory are D. Angdinata's, shared as working files ahead of their mathlib PRs:
  `Isogeny.lean` carries the function-field form (`FunctionFieldPullback`/`MapsInfinity`/
`Isogeny`) that the coordinate-ring domain of record localizes to,
  `finiteDimensional` (nonconstant maps of one-variable function fields are finite —
  inseparable case and Frobenius included), the `IntermediateRing` with
  `intermediateRingFinite` and `intermediateRingIsIntegrallyClosed`, `pushClass` by ideal
  extension and relative norm (`ClassGroup.extendedRelNormHom`), and
  `toPointHom : W₁.Point →+ W₂.Point`; its supports are the `CoordinateRing` split-out
  (with `Point.toClass_surjective` and `toClassEquiv`, **no ellipticity hypothesis**),
  `RingTheory/ClassGroup/RelNorm`, and `RingTheory/IntegralClosure/NormalizationFinite`.
  Hypothesis inventory — the minimal conditions, and they are genuinely minimal:
  `IsElliptic` appears **nowhere** in that development. The definition needs only `[Field F]`;
  `finiteDimensional`, `intermediateRingFinite` and `intermediateRingIsIntegrallyClosed` need
  nothing more; only the class-group half — `pushClass`, `toPointHom` — needs
  `[IsIntegrallyClosed W₂.CoordinateRing]` (supplied for elliptic curves by the seeded
  smoothness milestone) and `[DecidableEq F]`. In particular the equivalence
  `MapsInfinity ⟺ φ(O₁) = O₂` is hypothesis-free (foundations above), so do not add an
  ellipticity or normality side condition to statements that do not use one.
  His upstreaming of division-polynomial material is also in flight; Layers 0–1 are specified
  to **coordinate with that work, not fork it** — where the upstream lands first, the roadmap
  consumes it and deletes the duplication (the ⚠ *mathlib-track* tags). The AINTLIB modular-curves
  project's scheme-level endomorphism theory (`EndomorphismDegree.lean`, following Katz–Mazur:
  rigidity over a locally noetherian base, the hom-monoid on `End(E/S)`, the degree as a
  finite-locally-free rank, the trace, and the **Abel-free dual** `endDual f := [tr f] − f` —
  Katz–Mazur 2.6.2.2 solved for the dual, no `Pic⁰`) is **not a port source**; it is pinned as
  the strategy library — the trace-trick dual and the anchoring of
  `deg [N] = N²` to division polynomials replay in the function-field world — and as feasibility
  evidence. Its two open `sorry`s are instructive here: degree multiplicativity *dissolves*
  under the function-field definition (the finrank tower formula), while `φ̂φ = [deg φ]` is
  Layer 1's hard core under any definition. On the equation side, HasseWeil's `DualIsogeny.lean`
  and `DegreeQuadraticForm.lean` (its conditional route) live *inside* the
  definition's own world — candidate implementations for the degree form and the dual, to be reused
  where they fit.
- **`E[N] ≅ (ℤ/N)²` (Layer 2).** A `sorry`-free proof over **algebraically closed** geometric
  fibres exists in AINTLIB as `torsion_geometricFibre_rank_two` — scheme-theoretic, so a
  feasibility model rather than a port source (its `deg [N] = N²` anchor is the
  division-polynomial `[N]`-formula of
  [mathlib #13782](https://github.com/leanprover-community/mathlib4/pull/13782) and its bumped
  versions — credited there, not to the `HasseWeil` copy of the same material). The milestone
  here is the intrinsic `WeierstrassCurve` statement over `Submodule.torsionBy ℤ (E.Point) N`,
  over a **separably** closed field, stated as an additive equivalence with `(ZMod N)²`
  (`torsion_addEquiv_prod`).
- **Hasse bound (Layer 3).** Proved in the AINTLIB `HasseWeil` project as `hasse_bound` /
  `hasse_bound_unconditional` (`HasseWeil/WeilPairing/HasseBound.lean`), in the real form
  `|#E(𝔽_q) − q − 1| ≤ 2√q` over `Fintype.card W.toAffine.Point` (the projective count, matching the
  seed; the integer form `a_q² ≤ 4q` is the trivial corollary). The flagship's `#print axioms` output —
  `[propext, Classical.choice, Quot.sound]` — is recorded in-repo at the pinned revision (a
  documented check, to be turned into a CI gate on porting) — but the
  surrounding project is not globally `sorry`-free (the capstone routes around its in-progress
  conditional lemmas), and its `maxHeartbeats 2000000` override must be removed for TauCeti CI. (The
  `trace_sq_le_four_mul_deg` quadratic-form step belongs to that separate conditional route, not the
  flagship.) Its equation-level Frobenius and kernel-cardinality degrees are the **computational
  counterparts** of
  Layer 1's isogeny notions (§Layer 3), which is what makes the planned restatement a transport,
  not a second proof. The monorepo copy (`projects/HasseWeil` at the `dev/modular-curves` pin
  of the NagellLutz entry) restructures the tree and carries the
  invariant-differential/ramification module the Layer-1 API is modelled on:
  `Foundation/InvariantDifferential{,Pullback}.lean`, `Foundation/Ramification.lean`, and
  `Foundation/EC/MulByIntUnramified.lean` — the `e = 1` unramifiedness input (AEC
  III.4.10(c)) — imported by the capstone's `Separability`/`Infrastructure` files, so the
  separable-⟹-unramified milestone is not speculative: the existing Hasse proof already runs on it.
- **The Tate curve (Layer 4).** Partial AI developments exist in the FLT project
  (`FLT/KnownIn1980s/EllipticCurves/TateCurve*`, `FLT/TateCurve/*`); the merge state there changes
  frequently and is not tracked here.
- **Quadratic twists (Layer 5).** The FLT project has a `sorry`-free quadratic-twist development —
  several thousand lines of AI-generated Lean — supplying `quadraticTwistOf` and its invariants,
  `quadraticTwist`, `exists_smul_quadraticTwistBy_eq` (the independence-of-generator lemma the
  `Suggested.lean` docstring cites) alongside the distinct classification theorem
  `exists_smul_eq_or_exists_smul_eq_quadraticTwist`, `quadraticTwistPointEquiv`
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
  the upstreaming in flight (mathlib-track convention).
- **Mordell–Weil (Layer 6).** Michael Stoll's formalisation (pinned above, Apache-2.0) proves
  it `sorry`-free — the height half by the **naïve `x`-height** with the approximate
  parallelogram law and Northcott finiteness (the route Layer 6 records as core; the
  canonical height is a separate later milestone there, not part of this proof):
  `WeierstrassCurve.Affine.fg_point_of_numberField` for an **arbitrary** elliptic curve over a
  number field — the variable-change reduction to short normal form is performed internally,
  so it matches the seed here in name and generality alike — resting on the general `fg_point`
  (over the fraction field of a Dedekind domain, the per-factor class-group and unit-group
  finiteness taken as hypotheses) and weak Mordell–Weil by the `x − θ` map into the étale
  algebra `K[X]/(f)`; and the étale-algebra Selmer-group finiteness
  (`IsDedekindDomain.finite_selmerGroup`, with the fundamental exact sequence and
  `finite_selmerGroupOfEquiv`) building directly on Mathlib's `DedekindDomain.SelmerGroup` and
  discharging that file's own finiteness TODO (the
  *arithmetic* `K(S,n)`, not Layer 7's `Sel_m(E/K)`). The same repository
  carries the **explicit `2`-descent** Layer 6 names as its own lane: the local
  conditions, the étale-algebra `2`-Selmer group, its finiteness, the rank-bound theorem,
  and the `y² = x³ − x + 1` rank computation — the lane's port source and its acceptance
  test. Porting note: nothing structural remains; the work is Mathlib-polish and the dedupe
  discipline.
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
the pinned revision). The roadmap's `ω` is instead an element of Mathlib's
`Ω[W.FunctionField⁄K]` (§Layer 1) — the chart-level formula `dx / (2y + a₁x + a₃)` is the same,
and the line-bundle refinement belongs with the schemes. The isogeny functoriality
(`(φ ∔ ψ)^*ω = φ^*ω + ψ^*ω`, hence `[n]^*ω = n·ω`) is formalised nowhere and is built here.
The places-and-divisors dictionary of Layer 0 and Tate's algorithm are, to our knowledge, not
yet formalised anywhere and are built here on the function-field foundation; the formal group
**is** formalised — the Stoll repository's development flagged in the Layer-4 entry above —
and is refounded on Mathlib's `RingTheory/FormalGroup` on migration rather than rebuilt.
