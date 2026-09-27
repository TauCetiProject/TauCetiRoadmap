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
`integralClosure` are upstream, so the structure is **stated verbatim in `Suggested.lean`**,
together with its injectivity and unique fraction-field extension, its degree
(`Module.finrank` over the extension's field range), automatic finiteness, the
point map, and the Frobenius isogeny. Better: this entire opening theory — finiteness
(inseparable included), the intermediate ring's finiteness and normality, `pushClass`,
`toPointHom`, and the Layer-0 `toClass` surjectivity — is already **proven in the shared
upstream development** (provenance), so those declarations carry ⚠ *mathlib-track* status: built
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
general-number-field quotient, whose period honestly wants complex uniformisation.) Two further
statements are out, and §Layer 8 says so where it defines the objects they concern: **Siegel's
theorem**, that the integral points of a model are finite, which needs Diophantine approximation
at Thue–Siegel–Roth or Baker strength that nothing here builds; and **any bound of abc or Szpiro
type** — proving one is not attempted, and nothing below is conditional on one. Their
*statements*, and the implications between them, are in: §Layer 8 states the abc conjecture,
Szpiro's conjecture and the modified Szpiro conjecture, and proves the implications a formalised
Frey curve makes available. Everything else — through
Mordell–Weil, Selmer/Sha, the global minimal model, and the **selected `ℚ`-specific database
adapters** of §Layer 8: the minimal-pair model and its height, the abc quality, the Szpiro ratio,
the named Szpiro and abc statements with the implications between them, and bounded
integral-point search — is in.

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
  abstract group and survive that migration; only their spellings (`W.toAffine.Point`) would
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
positivity, and the Frobenius isogeny stated in `Suggested.lean` (Layer 1). The other declarations: the Layer-0
**class-group anchor** — Mathlib's `Point.toClass` is surjective,
so the point group *is* the ideal class group (`toClass_surjective`) — `[n]`-surjectivity for `n`
invertible in `K` (Layer 1), the `N`-torsion `E[N] ≅ (ℤ/N)²` — stated as an additive
equivalence (§Conventions) — and the bilinear **Weil pairing** (Layer 2), the finiteness of `E(𝔽_q)` and the
**Hasse bound** as the integer inequality `a_q² ≤ 4q` together with the **trace of Frobenius**
and the ordinary/supersingular predicates (Layer 3), the **global and semi-global minimality
predicates**, the **minimal discriminant ideal**, the **Weierstrass class** and
**semistability**, with the localisation instances they need (Layer 4.5a) and the global equation
constructions they feed (Layer 4.5b), the **quadratic twist** and the
split-multiplicative-reduction theorem (Layer 5), the **Mordell–Weil theorem**
`AddGroup.FG (E K)` (Layer 6), and the **canonical minimal-pair short equation** with its existence,
uniqueness and height, together with the remaining selected `ℚ`-specific adapters — abc quality,
the Szpiro ratio, the named conjecture statements, and bounded integral-point search (Layer 8).
The layers whose central objects are new *types* — the places of
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
  **surjectivity milestone** (stated in `Suggested.lean`, `toClass_surjective`) makes the point group *the whole*
  ideal class group — whence the principal-divisor characterisation (`Σ nᵢ Pᵢ` is principal iff
  `deg = 0` and `Σ [nᵢ] Pᵢ = O`, AEC III.3.4–5) rests on the group law Mathlib already proved,
  with no Riemann–Roch anywhere. ⚠ *Mathlib-track*: the shared upstream `CoordinateRing`
  split-out proves `Point.toClass_surjective` and packages `toClassEquiv` — with **no**
  ellipticity hypothesis — so the statement is consumed and deduplicated when that lands.

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

- **The isogeny type** (stated verbatim in `Suggested.lean`, with `Isogeny.degree` defined outright; ⚠
  *mathlib-track* — this whole bullet is proven in the shared upstream development, consumed
  and deduplicated when its PRs land). The structure of the foundations section: `pullback`
  and `mapsInfinity`. First theory: automatic injectivity and **finiteness**
  (`Isogeny.finiteDimensional`, stated in `Suggested.lean` — a nonconstant map of one-variable function fields is
  finite, the inseparable case included), `deg φ ≥ 1` (stated in `Suggested.lean`), the separable and inseparable
  degrees, identity and composition with `deg (ψ ∘ φ) = deg ψ · deg φ` — the tower formula;
  under the scheme definition this was half the hard core, here it is field theory.
- **The intermediate ring and the induced map on points.** The integral closure of
  `W₂.CoordinateRing` in `W₁.FunctionField` — geometrically, the functions regular away from
  the fibre `φ⁻¹(O₂)` — receives both coordinate rings, is **module-finite** over
  `W₂.CoordinateRing` and **integrally closed** (both proven upstream, Frobenius included).
  Ideal extension into it followed by the **relative ideal norm** down to
  `W₂.CoordinateRing` gives `pushClass` on class groups, whence
  **`toPointHom : W₁.Point →+ W₂.Point`** (stated in `Suggested.lean`) through `toClassEquiv` — additive **by
  construction**, so AEC III.4.8 ("a pointed morphism is a homomorphism") is built in rather
  than a separate rigidity theorem; the homomorphism property is exactly as strong as the
  **extended-relative-norm API** (`ClassGroup.extendedRelNormHom` and its commutative-algebra
  supports), which is therefore part of this bullet's obligations. Its normality input is the
  smoothness milestone
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
  The `q`-power **Frobenius** `π_q` over `𝔽_q` (`pullback = (· ^ q)`; stated in `Suggested.lean` as
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
  milestone (stated in `Suggested.lean`, `smul_surjective`), the counting input to Layer 2.
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
  (stated in `Suggested.lean`) exposes what the later layers consume: `E[N]` is a
  **additively equivalent to `(ZMod N)²`** (`torsion_addEquiv_prod`), wrapped
  in `Nonempty` because the basis is noncanonical — stated as a `≃+` with no `ZMod N`-module
  packaging, per §Conventions, since such an equivalence is automatically `ZMod N`-linear. The full `N`-torsion
  theory throughout requires `char K ∤ N`. Layer 1's `[N]`-surjectivity supplies the counting
  input. ⚠ *Mathlib-track*: the `E[N]`-structure code itself is expected to be done in
  Mathlib directly; it is built here when Layer 2 needs it and swapped
  for upstream when that lands, per the dedupe convention.
- **The Weil pairing — the divisor construction.** `e_N : E[N] × E[N] → μ_N`
  (AEC III.8.1), pinned as an additive **bilinear** map into `Additive (rootsOfUnity N K)`
  (stated in `Suggested.lean`). The construction is the **divisor calculus of Layer 0** — under scheme-free
  foundations it is the route whose prerequisites are visible, and the dual isogeny alone
  does not produce a definition without Cartier-duality or theta-group machinery. Its named
  prerequisites, each a milestone: existence of a function with divisor `N(P) − N(O)`;
  moving a divisor within its class to obtain disjoint support; evaluation of a function on
  a divisor of disjoint support; **Weil reciprocity** `f(div g) = g(div f)`; and independence
  of every function and divisor choice. Then the theory: alternating, **nondegenerate** over
  a separably closed field with `N` invertible (stated in `Suggested.lean`), Galois-equivariant, compatible with
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

- **Finiteness.** `E(𝔽_q)` is finite (stated in `Suggested.lean` as `Finite (W.toAffine.Point)` over a finite field) —
  a prerequisite Mathlib lacks, and the Hasse bound's **required companion**: the bound
  counts with `Nat.card`, which reads `0` on an infinite type, so finiteness is what makes the
  count the honest one (any proof of the bound necessarily establishes it).
- **The Frobenius trace.** `frobeniusTrace E = #F + 1 − #E(F)` for elliptic `E` over a finite
  field `F`, named and stated in `Suggested.lean` rather than left inline, because three separate strands quantify
  over it: the Hasse bound below, the trace sequence of the zeta strand, and Layer 1's theorem
  that `End(E)` of an ordinary curve is an order in `ℚ(π_q)`. ⚠ **The point count is the whole
  content of the convention, and it is chosen to be the one that is right in every case.** The
  count is `pointCount W`: all `F`-points of the projective model, the singular point included
  when there is one. Against that count the formula returns the classical local invariant at
  *every* Weierstrass model — `a_q` at an elliptic one, and `1`, `−1`, `0` at split
  multiplicative, nonsplit multiplicative and additive reduction. Against the nonsingular locus
  instead it would omit the single singular rational point and shift each of those by one,
  returning `2`, `0`, `1`, which is no classical invariant at all. So `frobeniusTrace` carries
  **no `[IsElliptic]` hypothesis**: there is no junk value to avoid, and restricting it would
  buy nothing.
  ⚠ **This does not wait on Mathlib.** `WeierstrassCurve.Affine.Point` is presently the
  nonsingular locus, but the two counts are related by a theorem this layer owns, because a
  Weierstrass cubic has **at most one singular point** and it is automatically `F`-rational: the
  cubic is irreducible (neither `z` nor any `x − cz` divides it, since `[0 : 1 : 0]` is its only
  point on `z = 0`), so a second singular point would force a linear component, and a unique
  singular point is Galois-stable. Hence `pointCount W = #W.Point + 1` when `Δ W = 0` and
  `= #W.Point` otherwise — both milestones — and when the planned upstream split into all points
  and a separate `NonsingularPoint` lands, these become the deduplication lemmas rather than a
  reason to have waited.
  ⚠ What is genuinely elliptic-specific is not the definition but the theorem making the defect
  a *trace*: the Layer-1 identity `deg(1 − π_q) = #E(𝔽_q)`, which is where the name is earned.
  Every theorem treating `a_q` **as a trace** — Hasse, the zeta strand, the
  ordinary-endomorphism-ring theorem — carries `[E.IsElliptic]` accordingly, and the
  bad-reduction trichotomy above is a separate milestone about the same formula.
- **The ordinary/supersingular dichotomy, defined geometrically.** For elliptic `E` over **any**
  field `K` of characteristic `p > 0`, `E` is **supersingular** when `E[p](Kˢᵉᵖ) = O` and
  **ordinary** otherwise (`IsSupersingular`, `IsOrdinary`; AEC V.3.1(i)). ⚠ The
  definition is the geometric one and **not** a congruence on the trace: it is the notion that
  makes sense over an arbitrary field of characteristic `p`, where there is no `a_q` at all, and
  it makes base-change invariance a natural geometric theorem rather than a consequence of the
  Frobenius-trace recurrence. The cost is a dependency on the base change of Layer 0.5 and the
  torsion vocabulary of Layer 2, which is mild and worth paying.
  ⚠ **Base-change invariance is a theorem here, not a definitional reduction**, and is a named
  milestone: `IsSupersingular p (W.baseChange L) ↔ IsSupersingular p W` for an **arbitrary**
  field extension `L/K`; no algebraicity hypothesis is intended. The proof does not split field
  extensions into algebraic, separable and purely inseparable cases, since that would omit
  transcendental extensions. Instead, Layer 1 defines pure inseparability of an isogeny through
  its induced function-field extension, proves that it is preserved and reflected by arbitrary
  scalar extension, and proves that Frobenius twists, relative Frobenius, duals and hence
  Verschiebung commute with scalar extension under the canonical Frobenius-twist base-change
  identification. This layer proves
  `IsSupersingular p W ↔ (verschiebung p W).IsPurelyInseparable`: the defining equality
  `E[p](Kˢᵉᵖ) = {O}` is equivalent to `sepdeg([p]) = 1`; from `[p] = V ∘ F`,
  `sepdeg(F) = 1`, and multiplicativity of separable degrees, one gets
  `sepdeg([p]) = sepdeg(V)`; and because `V` has degree `p`, this is equivalent to `V` being
  purely inseparable. The result is then the uniform chain
  `E_L supersingular ↔ V_{E_L} purely inseparable ↔ (V_E)_L purely inseparable ↔
  V_E purely inseparable ↔ E supersingular`, including for transcendental `L/K` and without
  choosing or comparing separable closures. **Over a finite field** the operational
  criterion is the theorem `IsSupersingular E ↔ ringChar F ∣ frobeniusTrace E` (AEC V.4.1), and
  it is what the Hasse-era strands use. ⚠ Do not write `a_q = 0` for it: the two agree only for
  `q = p ≥ 5`, since over `𝔽₂` and `𝔽₃` the Hasse interval is wide enough to hold supersingular
  curves with `a_q ≠ 0`. The remaining equivalences — `#E(𝔽_q) ≡ 1 (mod p)`, inseparability of
  the dual `π̂_q`, and `E[p^r](Kˢᵉᵖ) = O` for every `r` — are theorems of this layer.
- **The Hasse bound.** `#E(𝔽_q)` is within `2√q` of `q + 1` (AEC V.1.1). With
  `a_q := q + 1 − #E(𝔽_q)` the trace of Frobenius, the natural formalisation goal is the **integer
  inequality** `a_q² ≤ 4q` (stated in `Suggested.lean` as `hasse_bound`; the real `|a_q| ≤ 2√q` follows), from
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

- **The reduction predicates, and what is not one (discrete strand).** Mathlib's
  good/multiplicative/split-multiplicative/additive classes over a DVR are used exactly as they
  stand. ⚠ **They are properties of an equation, not of a curve**, and each of them *extends*
  `IsMinimal R W`: a nonminimal integral equation fails `HasGoodReduction` however good the
  curve's reduction is, since scaling a good minimal equation raises `v(Δ)` by `12` and
  destroys minimality while changing nothing about the curve. Every statement below therefore
  either carries `[IsMinimal R W]` or applies the predicate to `W.minimal R`, and the roadmap
  never writes a reduction predicate against a bare equation. ⚠ With that said, two notions a
  database names are **not** given predicates of their own, because Mathlib already says them:
  **bad reduction is `¬ HasGoodReduction R (W.minimal R)`** — the curve-level form; the raw
  negation `¬ HasGoodReduction R W` is *not* it, being satisfied by every nonminimal equation —
  and **non-split multiplicative reduction is `HasMultiplicativeReduction R W` together with
  `¬ HasSplitMultiplicativeReduction R W`** under `[IsMinimal R W]`, as
  `exists_quadraticTwist_hasSplitMultiplicativeReduction` of §Layer 5 already writes it. Nor is
  there an enumerated `ReductionType`: the enumeration of record is Tate's algorithm's
  `ReductionSymbol` below, and a coarser one beside it would be a second vocabulary for the same
  trichotomy. What is genuinely missing is built here:
  - **`HasPotentialGoodReduction`** — named for Mathlib's `HasGoodReduction`, not `Is…`. The
    definition is that some finite extension `L/K` has
    `HasGoodReduction O_L ((W.baseChange L).minimal O_L)`, over a **complete** DVR so that the
    integral closure `O_L` is again a DVR and the phrase type-checks without a choice of prime.
    ⚠ Minimising after the base change is not optional: an equation minimal over `R` need not be
    minimal over `O_L`, so demanding `HasGoodReduction O_L (W.baseChange L)` would make the
    predicate depend on the model. The `j`-integrality criterion — `W.j` lies in the image of
    `R` — is the **theorem** (AEC VII.5.5), not the definition, so that the predicate means what
    its name says instead of hiding a base change inside a criterion.
  - **`localMinimalDiscriminant`** — the ideal of `R` generated by `Δ` of a local minimal model,
    with independence of the choice of minimal model, its valuation `v(Δ_min)`, and the
    comparison `v(Δ) = v(Δ_min) + 12·fᵥ` against any integral model, `fᵥ` the obstruction
    exponent of §Layer 4.5a. This is the `v(Δ)` Tate's algorithm reads and the local input to the
    global minimal discriminant ideal.
  - **Good ordinary and good supersingular reduction.** For `R` with **finite** residue field,
    `HasGoodOrdinaryReduction` and `HasGoodSupersingularReduction`: good reduction whose
    reduction is ordinary, respectively supersingular, in the sense of §Layer 3. Thin over their
    parts, and named because they are the hypothesis the `p`-adic and Iwasawa-theoretic
    literature states its results under. API: the dichotomy (good reduction is exactly one of
    the two), compatibility with `frobeniusTrace` of the reduction, and behaviour under
    unramified base change.
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

### Layer 4.5a: invariant theory over a Dedekind domain (AEC VIII.8)

Layer 4 minimises over one discrete valuation ring at a time, which does not by itself produce a
single equation minimal at every prime. This layer packages the model-independent invariants
read from those local minima, over the fraction field `K` of a Dedekind domain `O`. Its
definitions, ideal identities, model-independence theorems and the easy implication from a global
minimal equation to a trivial obstruction class rest only on Layer 4's local minimality and on
Mathlib's `IsDedekindDomain.HeightOneSpectrum` and `ClassGroup`; Layers 1–3 are not inputs.

⚠ **This layer does not construct one global equation from the local data.** In particular, it
does not claim over an arbitrary Dedekind domain that a trivial obstruction class implies a global
minimal equation. That direction requires the global coefficient patching of §Layer 4.5b over the
ring of integers of a number field. The `ℚ`-specific predicate `IsReducedMinimal` is defined here
because it packages global minimality together with an integral normal form; existence and
uniqueness of a reduced equation are §Layer 4.5b theorems, after the global construction.

⚠ **A field is a Dedekind domain, and its height-one spectrum is empty.** Every `∀ v` in this
layer is then vacuous and every `∃ v` is false, so a definition written with a bare existential
is wrong at the degenerate base rather than merely uninteresting there. The predicates below are
written to survive it, and `¬ IsField O` is *not* used to paper over it.

⚠ **The localisation instances are this layer's first obligation, not bookkeeping.** Every
definition below says "minimal at `v`" by applying Layer 4's DVR theory to
`Localization.AtPrime v.asIdeal` sitting inside `K`. Mathlib has
`IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain`, but provides the `Algebra`,
`IsScalarTower` and `IsFractionRing` instances relating that localisation to an **abstract**
fraction field only for `K = FractionRing O`. Supplying them for arbitrary `K` — from
`v.asIdeal.primeCompl_le_nonZeroDivisors` — is a milestone in its own right, discharged once here
rather than repeated at each use site.

⚠ **Everything in this layer carries `[W.IsElliptic]`.** The generality is not free: for a
singular cubic `Δ = 0`, so the product below has infinite support, the obstruction exponents are
not the stated nonnegative integers, and semistability is not a notion the singular curve has.
The layer is about elliptic curves and says so in its hypotheses.

- **Global and semi-global minimal models.** `IsGlobalMinimal O W`: minimal at every height-one
  prime of `O`. Integrality over `O` is **not** an added hypothesis but a theorem of this layer,
  and not one `inferInstance` reaches — Mathlib's `[IsMinimal R W] : IsIntegral R W` gives
  integrality over each localisation, and descending to `O = ⋂ᵥ Oᵥ` is a coefficient-by-coefficient
  valuation argument through `mem_integers_of_valuation_le_one`. **`IsSemiGlobalMinimal O W`** is
  the **disjunction** `IsGlobalMinimal O W ∨ ∃ v₀, IsIntegral (localisation at v₀) W ∧ (minimal
  at every v ≠ v₀)`. ⚠ The disjunct is not redundant tidiness: over a field the spectrum is
  empty, so the bare existential is *false* while global minimality is vacuously *true*, and the
  intended "every global minimal model is semi-global" would fail at the degenerate base. ⚠ The
  integrality clause on the second disjunct cannot be dropped either, since minimality away from
  `v₀` says nothing about the denominators at `v₀`.
- **The sharp predicate is a different one.** `IsSemiGlobalMinimal` deliberately permits any
  defect at `v₀`, so the exact-defect notion gets its own name:
  **`IsSharpSemiGlobalMinimalAt O v₀ W`**, meaning **integral at `v₀`**, minimal at every
  `v ≠ v₀`, and with `v₀(Δ W) − v₀(Δ_min,v₀) = 12` exactly, equivalently
  `obstructionExponentAt O v₀ W = 1`. Integrality is independent data: a nonintegral translation
  can preserve the discriminant. The weak predicate is what consumers test; the sharp one is what
  §Layer 4.5b's construction produces, and both declarations are stated in `Suggested.lean`.
- **The minimal discriminant ideal.** `minimalDiscriminantIdeal O W = ∏ᵥ 𝔭ᵥ ^ v(Δ_min,ᵥ)`, the
  finite product over the height-one primes of the local minimal discriminants of §Layer 4. It
  depends only on the `K`-isomorphism class and not on the model — that invariance is the
  milestone. ⚠ The comparison with a chosen model needs integrality: **for `W` integral over
  `O`**, `𝔇_{E/K} = (Δ W)` iff `W` is globally minimal. Without integrality the converse fails,
  and cheaply — translating a global minimal equation by `r = 1/2` leaves `Δ` alone and destroys
  integrality, so `(Δ W) = 𝔇_{E/K}` holds for a model that is not even integral, let alone
  minimal.
- **The Weierstrass class.** The obstruction exponents
  `fᵥ = (v(Δ W) − v(Δ_min,ᵥ))/12` of an integral model — nonnegative integers, the
  divisibility by `12` being a theorem about admissible changes of variable rather than a
  convention — the integral defect ideal `𝔍_W = ∏ᵥ 𝔭ᵥ ^ fᵥ`, and its class
  `[𝔍_W] ∈ ClassGroup O`, which is the declaration `weierstrassDefectClass O W` of
  `Suggested.lean`. ⚠ Three different objects share the word *defect* and are not
  interchangeable: the exponents `fᵥ` are natural numbers, `𝔍_W` is an ideal, and the invariant
  the global-minimality theorem tests is the *class* of that ideal. Milestones: the ideal identity
  **`(Δ W) = 𝔇_{E/K} · 𝔍_W^{12}`** — the defect is what an integral model carries *above* the
  minimal discriminant, so it multiplies the minimal ideal up to the principal one, and the
  identity is *not* to be written the other way round; independence of the class from the chosen
  integral model; and the easy direction that a global minimal equation has trivial class. The
  public interface is the choice-independent curve-level wrapper
  **`globalMinimalityClass O E : ClassGroup O`**, with comparison to
  `weierstrassDefectClass O W` for
  every integral model `W` of `E` and invariance under admissible change of variables. Consumers
  do not choose an equation merely to state the invariant. The converse and the class-number-one
  corollary are §Layer 4.5b number-field theorems, not assertions at this generality.
  ⚠ **Principality of `𝔇_{E/K}` is not the obstruction**: there are number-field curves whose
  minimal discriminant ideal is principal while `globalMinimalityClass O E ≠ 1`, so no global
  minimal model exists by §Layer 4.5b. The two conditions must not be conflated, and a worked
  instance of the gap is an acceptance criterion. ⚠ **Orientation, and the standard name.** The
  class of `𝔞_Δ = 𝔍_W⁻¹` is what AEC VIII.8 calls **the Weierstrass class** of `E/K`, printed
  there so that `𝔇_{E/K} = (Δ W) · 𝔞_Δ^{12}`; `weierstrassClass O W` is that class, in
  Silverman's orientation. This roadmap's own computations, and Sage's
  `global_minimality_class`, run in the inverse orientation `[𝔍_W]` on the integral defect
  ideal, which is `weierstrassDefectClass O W`. The two are inverse
  (`weierstrassClass_eq_inv_weierstrassDefectClass`, a milestone), so triviality — the thing
  the global-minimality theorem tests — is the same either way; what is *not* orientation-free
  is any theorem naming a representative prime, which is why both spellings exist rather than
  one being quietly preferred.
- **The reduced-minimal predicate over `ℚ`.** `IsReducedMinimal W` packages global minimality
  over `ℤ` together with the coefficient ranges `a₁, a₃ ∈ {0, 1}` and
  `a₂ ∈ {−1, 0, 1}`. This layer defines that normal-form predicate but does not construct a
  representative. Existence and uniqueness are the §Layer 4.5b theorem, after global minimality
  has supplied an integral equation.
- **Semistability.** `IsSemistable O W`: no height-one prime carries additive reduction, the
  reduction at `v` being that of a local minimal model at `v`. Milestones: invariance under
  `K`-isomorphism; the local criterion — on a minimal model, no additive reduction at `v` is
  `v(Δ) = 0 ∨ v(c₄) = 0`; stability under unramified base change; and the statement the term
  exists for, that a semistable curve is one whose reduction is good or multiplicative
  everywhere, so `Iₙ` is the only symbol of §Layer 4 that occurs. ⚠ Semistability is **not**
  potential good reduction, and neither implies the other: additive reduction at `v` may become
  good over a ramified extension of `K_v` (potential good reduction, not semistable), while
  multiplicative reduction survives every extension (semistable at `v`, never potentially good
  there).

### Layer 4.5b: global equation construction over a number field

Layer 4.5a supplies the local invariants. This layer performs the hard step: construct a single
integral equation whose coefficients satisfy all local conditions simultaneously. Base:
`O = 𝓞 K` for a number field `K`, not an abstract Dedekind domain. The local criterion, the global
criterion and the passage from compatible local auxiliary data to one global
`(a₁, b₂, a₃)`-triple (equivalently one admissible `(r, s, t)`-transformation) are separate
milestones; none is hidden under the word "bookkeeping".

⚠ **Two routes live here, and they answer different questions — neither is a duplicate of the
other.** The AEC VIII.8.2 patching route below starts from *a curve already in hand* and shows
that triviality of the Weierstrass class is equivalent to a global minimal integral model
existing. The Kraus route starts from *a bare pair* `(c₄, c₆)` and decides whether they are the
exact invariants of an integral Weierstrass equation; that is not a curve-construction question,
since a nonsingular pair already defines a curve over `K` through `a₄ = −c₄/48`, `a₆ = −c₆/864`,
but an integral equation realising those invariants on the nose need not exist. Kraus is
therefore **not load-bearing for the global-minimality theorem**: over `ℚ` that theorem needs
neither Kraus nor Tate's algorithm, since Mathlib's `exists_isMinimal` already supplies the
local minimalising change of variables at each prime, `Cl(ℤ) = 1` makes the global scale
automatic, and finite approximation patches the translations. What Kraus is load-bearing for is
the opposite direction — producing a certified curve from stored invariants — which is the
database-facing consumer that §Worked examples exercises when it certifies records by label.
⚠ And it is **not** a cheap increment on Tate's algorithm: the difficulty is disjoint, Tate's
being the singular-fibre case analysis and Kraus's the `a₁, a₃, b₂` congruences solved
`2`-adically and `3`-adically. They share only the finite-approximation step, which the VIII.8.2
route needs anyway.

- **Kraus local and global criteria — owned here with named contracts.** These live in
  `TauCeti/AlgebraicGeometry/EllipticCurve/GlobalModels/Kraus.lean` and are implemented in this
  order:

  1. for `c₄, c₆ ∈ K`, put `Δ = (c₄³ − c₆²)/1728`; the input at `v` is that
     `c₄, c₆, Δ ∈ 𝒪_{K,v}` and `Δ ≠ 0`;
  2. put `W₀ = [0, 0, 0, −c₄/48, −c₆/864]`. Define `HasKrausThreeWitness c₄ c₆ v`
     to mean that some `b₂ ∈ 𝒪_{K,v}` makes the `(b₂/12, 0, 0)`-transform of `W₀`
     integral, and define `HasKrausTwoWitness c₄ c₆ v` to mean that some
     `a₁, a₃ ∈ 𝒪_{K,v}` make the `(a₁²/12, a₁/2, a₃/2)`-transform integral.
     `KrausLocalCondition c₄ c₆ v` is the step-1 input together with the two-witness predicate
     when `v ∣ 2`, the three-witness predicate when `v ∣ 3`, and no extra predicate otherwise.
     Prove the nontrivial `krausLocalCondition_iff_exists_integralModel`, equating this explicit
     auxiliary criterion with existence of a Weierstrass equation over `𝒪_{K,v}` whose base
     change has **exactly** those two invariants;
  3. prove `krausLocalCondition_of_not_dvd_six` **from the input in step 1**. Thus the auxiliary
     analysis, not the integrality/nonsingularity hypotheses, is automatic away from `v ∣ 6`;
  4. for every `v ∣ 3`, choose a `HasKrausThreeWitness` value `b₂` modulo
     `v ^ v(3)`; for every `v ∣ 2`, choose a `HasKrausTwoWitness` pair and retain its `a₁`
     component modulo `v ^ v(2)`. Combine the `a₁` residues while also imposing
     `a₁ ≡ 0 (mod 3)`, then **recompute** each local `a₃` for
     that fixed global `a₁` so that `(a₁, a₃)` is a `HasKrausTwoWitness`, before combining the
     `a₃` residues modulo `v ^ v(2)`. The order is load-bearing: `a₃` is not independent of the
     chosen lift of `a₁`. ⚠ The patch must also deliver **`b₂ ≡ a₁² (mod 4)`** at the primes
     above `2`, alongside the chosen `b₂` residue at the primes above `3`: step 6 produces
     `a₂ = (b₂ − a₁²)/4`, so without that congruence the transformed equation has a
     nonintegral `a₂` and the construction fails at exactly the primes Kraus's criterion is
     about;
  5. own the exact finite-approximation lemma in
     `TauCeti/NumberTheory/DedekindDomain/FiniteApproximation.lean`: for a finite family of
     pairwise-comaximal prime powers, the map
     `𝓞 K → ∏ v ∈ T, (𝓞 K) / v ^ nᵥ` is surjective, together with the comparison of
     these quotients with the corresponding localization quotients. Apply it with the powers in
     step 4;
  6. with the resulting integral `a₁, b₂, a₃`, set
     **`s = a₁/2`, `r = b₂/12`, `t = a₃/2`**. Prove that this single `(r, s, t)` transforms
     `[0, 0, 0, −c₄/48, −c₆/864]` to an integral global equation. ⚠ These parameters are forced,
     and no other triple will do. The source model has `a₁ = a₂ = a₃ = 0`, hence `b₂ = 0`, and
     it already carries the target `c₄` and `c₆`, so the change of variables has `u = 1`.
     Against Mathlib's action — `(C • W).a₁ = u⁻¹(a₁ + 2s)`, `(C • W).a₃ = u⁻¹³(a₃ + r·a₁ + 2t)`,
     `(C • W).b₂ = u⁻¹²(b₂ + 12r)` — the transform therefore returns `2s`, `2t` and `12r` in
     those three coordinates, so reproducing the chosen `a₁`, `a₃` and `b₂` fixes `s`, `t` and
     `r` as above; the remaining coordinate then comes out right for free, since
     `a₂ = 3r − s² = (b₂ − a₁²)/4`. ⚠ The `(a₁²/12, a₁/2, a₃/2)`-transform named in step 2 is
     the `a₂ = 0` case of this prescription — at `b₂ = a₁²` the two agree — and not a competing
     one;
  7. define `KrausGlobalCondition c₄ c₆ := ∀ v, KrausLocalCondition c₄ c₆ v` and prove
     `krausGlobalCondition_iff_exists_integralModel` by the construction above; and
  8. in each application, separately verify local minimality and compute every
     `obstructionExponentAt`, rather than inferring either property from the discriminant alone.

- **Patching local minimal changes of variables — a separate AEC contract.** For each prime in
  the finite support of the defect, Layer 4 supplies a local minimal change
  `(uᵥ, rᵥ, sᵥ, tᵥ)`. If the defect ideal is principal, choose the corresponding
  global scale `u`; finite approximation then chooses one global `(r, s, t)` satisfying the
  finitely many required localization congruences, and the transformed equation is integral and
  minimal everywhere. This is the direct AEC VIII.8.2 route. It shares finite-approximation
  infrastructure with Kraus's exact-invariant construction, but the two patching theorems are not
  silently identified.

- **Global-minimality equivalence — number fields only.** For `O = 𝓞 K`, the global construction
  proves
  `globalMinimalityClass O E = 1` if and only if `E` admits an integral equation that is globally minimal
  (AEC VIII.8.2), and hence class number one implies existence (VIII.8.3). The forward implication
  uses the local-change patching contract above (or, as a second proof, the exact-invariant Kraus
  theorem); it is not retroactively attributed to Layer 4.5a or to an arbitrary Dedekind domain.
- **Existence and uniqueness of the reduced minimal equation over `ℚ`.** Specialize the preceding
  theorem to `K = ℚ`, using `Rat.classNumber_eq` and `Rat.ringOfIntegersEquiv` to obtain an
  equation globally minimal over `ℤ`. Normalize its residual integral change-of-variables freedom
  in the order dictated by the coefficient formulas: choose `s` to reduce `a₁` modulo `2`, then
  `r` to reduce `a₂` modulo `3`, then `t` to reduce `a₃` modulo `2`. Prove that two normalized
  equations related by an integral variable change with `u = ±1` have equal coefficients. The
  `existsUnique_reducedMinimal` therefore asserts uniqueness of the **equation** in the
  `ℚ`-variable-change orbit; its change-of-variables witness need not be unique.
- **External integration contract.** An unconditional finite-avoidance corollary would use the
  general number-field statement that every ideal class has a prime-ideal representative outside
  any prescribed finite set. Its ownership, proof and analytic prerequisites are outside this
  roadmap; the exact interface required by such an integration module is:

  ```lean
  open scoped NumberField

  namespace NumberField

  theorem exists_primeIdeal_mk_eq_avoiding
      (K : Type*) [Field K] [NumberField K]
      (c : ClassGroup (𝓞 K))
      (S : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 K))) :
      ∃ v, v ∉ S ∧
        ClassGroup.mk0
          ⟨v.asIdeal,
            mem_nonZeroDivisors_iff_ne_zero.mpr v.ne_bot⟩ = c

  end NumberField
  ```
- **Sharp construction at a supplied representative prime.** Let `v₀` represent
  `globalMinimalityClass (𝓞 K) E` and assume `v₀ ∤ 6`. For an integral model `W` of `E`, let
  `𝔍_W` be its defect ideal. The comparison with the curve-level class gives
  `[v₀] = [𝔍_W]`; choose `u ∈ K×` with `𝔍_W = (u) v₀` as fractional ideals, and put
  `c₄' = c₄(W)/u⁴`, `c₆' = c₆(W)/u⁶`, and `Δ' = Δ(W)/u¹²`. The exact conditional
  contract is:

  > if `𝔍_W = (u) v₀` as fractional ideals and `KrausGlobalCondition c₄' c₆'`, then there is a change of
  > variables `C` for which `IsSharpSemiGlobalMinimalAt (𝓞 K) v₀ (C • E)`.

  At primes above `2` and `3`, local minimal equations supply the witnesses for that global
  condition; at `v₀` it is automatic because `v₀ ∤ 6`; elsewhere the scaled invariants are
  already minimal. Thus the final theorem takes `v₀`, its class equality and `v₀ ∤ 6`,
  and returns `C`. Its conclusion includes integrality at `v₀`, minimality away from it and
  `obstructionExponentAt (𝓞 K) v₀ (C • E) = 1`, and therefore implies
  `IsSemiGlobalMinimal`. Applying the external contract above to a caller's finite set enlarged
  by the primes above `2` and `3` would give the unconditional finite-avoidance corollary; that
  corollary belongs to external integration, not to this roadmap.

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
  `j(E_{t,n}) = j(E)` (stated in `Suggested.lean`); the extension twist `quadraticTwist E L` by a separable quadratic
  `L/K` with `j(E^L) = j(E)` (stated in `Suggested.lean`); the point isomorphism `E^L(M) ≅ E(M)` over `M ⊇ L`, Galois
  anti-equivariant by the quadratic character (stated in `Suggested.lean` — ⚠ the finite-`M/K` case of
  the isomorphism is in an in-flight mathlib PR; the target here is general `M`, e.g.
  `M = Kˢᵉᵖ`, which the Galois statement needs); and the headline that a curve with **nonsplit**
  multiplicative reduction acquires **split** reduction after a separable quadratic twist (over
  Mathlib's reduction predicates). This is *not* Silverman's `char ≠ 2` Example X.3 2.4.

### Layer 6: the Mordell–Weil theorem (AEC VIII)

- **Mordell–Weil.** For `K` a number field, `E(K)` is a **finitely generated** abelian group (AEC
  VIII.6.7) — `AddGroup.FG (W.toAffine.Point)` (stated in `Suggested.lean` as `fg_point_of_numberField`:
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
  unformalised prerequisites small. The point height is
  `WeierstrassCurve.Affine.Point.naiveHeight`; Mathlib's
  `NumberTheory/Height/EllipticCurve.lean` carries it as a TODO (nothing is defined there yet),
  so this layer builds it and deduplicates on landing. The namespace is what keeps it apart from
  §Layer 8's curve-level `WeierstrassCurve.naiveHeight`; the two are different quantities on
  different types and neither name is reserved against the other.
  The **canonical (Néron–Tate) height is a separate, later
  milestone** (consumed by regulators, isogeny compatibility, and BSD, not by Mordell–Weil):
  construction of `ĥ` with bounded difference from the naïve height, quadraticity,
  nonnegativity, `ĥ(P) = 0 ↔ P` torsion, the Néron–Tate bilinear pairing, the isogeny
  compatibility `ĥ_{E'}(φP) = deg φ · ĥ_E(P)`, the **regulator** as the Gram determinant on
  a basis of the free quotient with basis independence, and the rank-zero convention
  `Reg = 1`. ⚠ **Pin the normalisation**: `ĥ(P) = lim_n h(x(n • P))/n²` with `h` the
  logarithmic height of the `x`-coordinate, which is twice the normalisation some authors use;
  the regulator and the BSD quotient of §Layer 7 are stated against this one, so it is fixed
  here and not per-consumer. Convergence of that limit is the content of the construction and
  is proved, never assumed: `ĥ` is not defined as a bare `limUnder` whose value would be
  unspecified exactly where the theorem is.
  The elliptic-curve Selmer group `Sel_m(E/K)` of Layer 7 is the cohomological
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
  **(i) the global minimal model over `ℚ`** — §Layer 4.5a supplies the defect-ideal identity
  `(Δ W) = 𝔇_{E/K}·𝔍_W^{12}` and the reduced-minimal predicate; §Layer 4.5b supplies
  the patched global equation and the unique reduced minimal equation over `ℚ`, globally
  minimal over `ℤ`. That reduced equation carries the distinguished equation-level differential
  `ω = dx / (2y + a₁x + a₃)`, hence a canonical differential on the canonical reduced model.
  Transporting it to an arbitrary presentation is still canonical only up to automorphisms:
  in particular `[−1]^* ω = −ω`. The absolute real period is nevertheless unambiguous, because
  it integrates `|ω|` and is therefore independent of that sign.
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
  `∏_p c_p`, the real-period convention (the distinguished differential on the reduced
  equation, with sign erased by absolute value, as fixed above),
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

### Layer 8: selected `ℚ`-specific database adapters

A thin layer, and deliberately so. It owns the **minimal-pair model and its height**, the **abc
quality**, the **Szpiro ratio** together with the named **Szpiro, modified-Szpiro and abc
statements** and the implications between them, and **bounded integral-point search** — not every
quantity a table of curves over `ℚ` might record. Everything genuinely
structural has a home above — the Frobenius trace and the ordinary/supersingular dichotomy in
§Layer 3, potential good reduction and good ordinary/supersingular reduction in §Layer 4, and
minimal-model invariants and equation construction in §Layers 4.5a–b. It exists so the selected
vocabulary has one spelling in Tau Ceti, and so quantities which are not unconditionally
meaningful carry their hypotheses rather than a junk value. Its base is `ℚ` throughout; nothing
here is claimed over a general number field.

⚠ **It supplies selected adapters, not every field of a database record.** A record also carries
a Faltings height, a modular degree, a Manin constant, analytic `Ш` data and
Galois-image data, none of which are targets here, and each of which belongs elsewhere: the
Faltings height to a complex/Arakelov roadmap; the modular degree and Manin constant to a
modular-curves roadmap; complete integral-point lists to a Diophantine-approximation roadmap
(§integral points below); and analytic `Ш` to an analytic-BSD or `L`-function roadmap. Naming the
boundary is the point: this layer is useful without pretending to be exhaustive.

- **The minimal-pair integral short equation.** The prerequisite for the height below, and a
  milestone in its own right — stated in `Suggested.lean`, since the height's whole content is
  which model it is computed from, and leaving the model's type open would leave the height
  undefined. The predicate `IsMinimalPairNF W` on `W : WeierstrassCurve ℤ` is `W.IsShortNF`
  together with: no prime `ℓ` has both `ℓ⁴ ∣ a₄` and `ℓ⁶ ∣ a₆`. ⚠ **The name follows the
  literature's "minimal pair" for `(A, B)`, and the `NF` suffix Mathlib's normal forms use.**
  It is *not* DVR-minimality: at `2` and `3` a minimal-pair short equation need not be a minimal
  Weierstrass equation, which is exactly why the global minimal model of §Layer 4.5b is a long
  one. Bundled as `MinimalPairModel E` for elliptic
  `E/ℚ` — the integral model, the minimal-pair condition, and a `VariableChange ℚ` carrying its
  base change to `E`. The milestones are `exists_minimalPairModel` and `minimalPairModel_unique`:
  existence of the bundle and uniqueness of its **equation** outright, since the only remaining
  coefficient freedom is
  `(a₄, a₆) ↦ (u⁴a₄, u⁶a₆)` with `u = ±1` and `u⁴ = u⁶ = 1`. ⚠ This is **not** §Layer 4.5b's
  reduced minimal model, which is a *long* equation: they are different canonical models serving
  different purposes, both stored separately in a database record, and neither substitutes for
  the other. The bundled change-of-variables witness need not be unique; only the equation and
  its derived height are canonical.
- **The height of a curve over `ℚ`.** Two declarations, and the split is the point:
  `shortEquationHeight W = max (4·|a₄|³) (27·a₆²) : ℕ` for an integral short equation over `ℤ`
  (stated in `Suggested.lean`), and `minimalPairModel E` and `naiveHeight E`, that function
  applied to the unique minimal-pair equation above — the quantity a table is ordered by.
  `naiveHeight_eq` compares with every bundled minimal-pair model, and
  `naiveHeight_variableChange` gives invariance under a `ℚ`-isomorphism. ⚠ **The carrier
  matters and is
  the whole content.** On a bare short model over `ℚ` this expression is not an invariant at all:
  `x = u²x'`, `y = u³y'` sends `(A, B)` to `(A/u⁴, B/u⁶)` and the height to `H/|u|¹²`, so
  ranging over `u = 2, 3, …` gives infinitely many short rational models of one curve with height
  tending to `0`, and bounded-height finiteness is false. The minimal-pair condition over `ℤ` is what makes it
  well defined. The bounded-height theorem uses the minimal-pair carrier explicitly:

  ```lean
  Set.Finite
    {W : WeierstrassCurve ℤ |
      IsMinimalPairNF W ∧
      (W.baseChange ℚ).IsElliptic ∧
      max (4 * W.a₄.natAbs ^ 3) (27 * W.a₆.natAbs ^ 2) ≤ H}
  ```

  It is immediate from bounds on the two integers `(A, B)` and yields finiteness of
  `ℚ`-isomorphism classes of bounded `naiveHeight`. It does **not** assert finiteness of the
  literal terms `E : WeierstrassCurve ℚ`, which is false because every isomorphism class has
  infinitely many rational equations. Further API: the relation to
  `Δ = −16(4A³ + 27B²)` and monotonicity in `|A|` and `|B|`. ⚠ **Model height versus curve
  height.** `shortEquationHeight` is a property of an *equation*, not of a curve; it becomes the
  curve invariant only once the model is pinned to the minimal-pair representative, which is
  what `naiveHeight E` does. The naïve `x`-height on *points* of §Layer 6 is a different
  quantity on a different type, `WeierstrassCurve.Affine.Point.naiveHeight`, and the namespaces
  keep the two apart.
- **The abc quality of a curve.** With `j/1728 = a/c` in lowest terms and `b = c − a`,
  `abcQuality E = log max(|a|, |b|, |c|) / log rad(a·b·c)`, defined **under the hypothesis
  `j ∉ {0, 1728}`** — exactly the condition making `a·b·c ≠ 0`. ⚠ Do not define it totally: at
  those two values `rad 0 = 1`, so the quotient evaluates to `0` by division by zero, and a
  total definition would report a meaningful-looking number where the invariant does not exist.
  API: dependence on `j` alone, hence `ℚ`-isomorphism invariance, and the relation to the
  abc-triple `(a, b, c)`. **No bound on the quality is claimed** — see the conjecture statements
  below, none of which is proved here.
- **The Szpiro ratio, and the conjecture statements.** `szpiroRatio E = log |Δ_min| / log N`,
  with `Δ_min` the minimal discriminant of §Layer 4.5a and `N` the conductor assembled from
  §Layer 4's exponents, defined **under `N > 1`** so the logarithm's denominator is nonzero.
  Then three statements, none proved: **Szpiro's conjecture**, `|Δ_min| ≪_ε N^{6+ε}`; the
  **modified Szpiro conjecture**, `max(|c₄|³, c₆²) ≪_ε N^{6+ε}`; and the **abc conjecture**,
  `max(|a|,|b|,|c|) ≪_ε rad(abc)^{1+ε}` for coprime `a + b = c`.
  ⚠ **Which conductor, and why it matters here.** These are stated against Layer 4's
  **algorithmic (Ogg) exponent**, because that is the conductor this roadmap has. Against the
  Artin conductor they would be the classical conjectures; until the identification §Layer 4
  names as a separate project lands, what is formalised is the algorithmic form, and the
  declarations say so in their names rather than quietly claiming the classical statement. For
  the Frey application specifically the gap is small and worth isolating: the Frey curve is
  semistable, so only the exponents `0` and `1` occur, and **the semistable case of the
  algorithmic–Artin comparison** is its own milestone here, far short of the wild-conductor
  theorem. ⚠ **Ordering.** None of this block reaches `Suggested.lean` until §Layer 4's
  conductor is a *declaration* rather than prose: `szpiroRatio` is a ratio against it, so
  stating the conjectures before it exists would mean inventing the denominator.
- **The implications between them.** Milestones, in increasing order of work:
  **modified Szpiro ⟹ Szpiro**, immediate from `1728Δ = c₄³ − c₆²`; **Szpiro ⟹ abc with
  exponent `3/2`**, by the Frey-curve estimate `|Δ| ≍ (abc)²`, `N ≍ rad(abc)` — the exponent is
  the elementary one, not the best known, and the roadmap does not claim `3/2` is optimal; and
  **abc ⟹ modified Szpiro**, which is a *milestone of its own and not a corollary*: on paper one
  applies abc to `c₆² + 1728Δ = c₄³`, and the textbook derivation runs to about a page, but
  formalising it needs the valuation bookkeeping
  controlling common factors against the conductor support, the normalisation of the abc-triple,
  and separate handling at `2` and `3`. The milestone is sized by that bookkeeping, not by the
  length of the argument on paper.
- **Asymptotic Fermat from Szpiro.** With the Frey curve of §Worked examples — semistable, with
  minimal discriminant `(abc)^{2p}/2⁸` and conductor `rad(abc)` — Szpiro's inequality gives
  `2⁻⁸|abc|^{2p} ≪_ε rad(abc)^{6+ε}`, contradiction for all sufficiently large `p`. ⚠ That is
  **asymptotic** FLT: it excludes solutions for `p` beyond an ineffective bound and says nothing
  about any particular exponent, so the statement is named `asymptoticFermat` and FLT itself is
  neither stated nor implied here. The abc conjecture is separately stated in
  `google-deepmind/formal-conjectures`; this roadmap restates it locally because the
  implications above quantify over it, and the two spellings are compared in one lemma rather
  than left to coincide.
- **Integral points of an integral model.** `integralPoints W`: the affine points of `W` with
  `x, y ∈ ℤ`, for `W` **integral over `ℤ`** — `W : WeierstrassCurve ℤ` read over `ℚ`,
  equivalently `W : WeierstrassCurve ℚ` with `[IsIntegral ℤ W]`. ⚠ Integrality is not decoration.
  Negation on a Weierstrass curve is `−(x, y) = (x, −y − a₁x − a₃)`, so on a general rational
  model the set is not stable under `P ↦ −P`: on `y² + ½y = x³` the point `(0, 0)` is integral
  while `−(0, 0) = (0, −½)` is not. With `a₁, a₃ ∈ ℤ` stability holds, and it is a milestone.
  ⚠ Likewise the change-of-variables statement is **not** for an arbitrary integral change: a
  bijection on integral points needs `u = ±1` with `r, s, t ∈ ℤ`, since `u` of larger absolute
  value shrinks the set. The set still depends on the model and not only on the curve, which is
  why a table computes it for a fixed canonical one. ⚠ **Siegel's theorem — that the set is
  finite — is not a target of this roadmap.** Its proofs need Diophantine approximation at
  Thue–Siegel–Roth or Baker strength, which neither Mathlib nor any layer here builds, so
  finiteness is not asserted and `integralPoints` is given no `Finite` instance. Stating it would
  be a gap of exactly the kind the roadmap-writing guide forbids; it belongs to a roadmap that
  builds the approximation theory. What *is* here is the decidable bounded search certifying that
  a claimed list is complete below a given bound on `|x|`.

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **The point–place dictionary and the class-group anchor.** `W.toAffine.Point` is exactly the
  degree-`1` places of the function field (`O ↦ infinityPlace`), and `toClass` is onto the ideal
  class group (`toClass_surjective`, with Mathlib's `toClass_injective`) — the Layer-0 identifications
  every later layer uses.
- **Frobenius is an isogeny:** over `𝔽_q`, `pullback = (· ^ q)` satisfies `MapsInfinity`, is
  purely inseparable of degree `q`, and induces `(x, y) ↦ (x^q, y^q)` on points
  (`frobeniusIsogeny` and `degree_frobeniusIsogeny`).
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
- **Ordinary and supersingular, on the curves the roadmap already turns on:** `y² = x³ − x`
  over `𝔽₃` has trace `a_3 = 0` and is **supersingular**; `y² = x³ + x` over `𝔽₅` has trace
  `a_5 = 2` and is **ordinary** (⚠ the trace is written `a_q`, never `a₃`, which is a
  Weierstrass coefficient). These are exactly the two curves §Layer 1 uses for the `ℤ[π_q]` rank
  dichotomy and for the gap between `ℤ[π_q]` and `End(E)`, so the predicates are certified on
  the instances the endomorphism theory already depends on rather than on fresh ones.
- **The reduced minimal model is unique, so a label names an equation:**
  `y² + y = x³ − x² − 10x − 20` for 11.a1 and `y² + y = x³ − x` for 37.a1 are `IsReducedMinimal`,
  and are the only such equations in their `ℚ`-isomorphism classes. That uniqueness lets a label
  name a particular equation; the minimal discriminant and the absolute real period are already
  presentation-independent by their own invariance and sign-independence theorems. ⚠ It is a
  *long* equation, and is not the canonical minimal-pair short equation that
  §Layer 8's height is computed from; the two canonical equations are certified separately.
- **Semistability agrees with the Kodaira symbol:** 11.a1 is semistable — its only bad prime is
  `11`, of type `I₁` in the list above — while 27.a4 is not, type `II` at `3` being additive.
  Checking `IsSemistable` against the symbols Tate's algorithm computes is the acceptance test
  for §Layer 4.5a against §Layer 4, in both directions.
- **The Weierstrass class is not the principality of `𝔇_{E/K}`**, on a named curve. Over
  `K = ℚ(α)` with `α² − α − 16 = 0` — that is `ℚ(√65)`, of class number `2` — the curve
  `[0, 0, 0, −15221331α − 53748576, −79617688290α − 281140318368]` has **everywhere good
  reduction**, so `𝔇_{E/K} = (1)`, as principal as an ideal gets; and yet its Weierstrass
  class is nontrivial, so it has no global minimal model — no equation over `𝓞 K` has unit
  discriminant — and only a semi-global one. It is the sharpest possible separation of the two
  conditions, and certifying it is what stops them being conflated. The coefficients are large
  because such curves are; any curve with those two properties serves equally, and this one is
  named so that the acceptance test is a computation rather than a search. (Cremona's
  number-field elliptic-curve implementation, references.)
- **The Frey–Hellegouarch curve — a worked application, not an invariant.** `freyCurve A B` is
  the curve `y² = x(x − A)(x + B)`, that is `a₂ = B − A`, `a₄ = −A·B`, `a₁ = a₃ = a₆ = 0`, over
  any `CommRing`. The general identities are `Δ = 16·A²B²(A + B)²` and `c₄ = 16·(A² + AB + B²)`,
  and over a field of characteristic `≠ 2` it is elliptic exactly when `A`, `B` and `A + B` are
  all nonzero. The application fixes every parameter rather than gesturing at "the classical
  normalisation": let `p ≥ 5` be prime and `a, b, c` nonzero pairwise-coprime integers with
  `aᵖ + bᵖ + cᵖ = 0`, normalised so that `b` is even and `aᵖ ≡ −1 (mod 4)`, and take `A = aᵖ`,
  `B = bᵖ`. ⚠ The normalisation is reachable, but not by negating `a`: the relation is not
  preserved by negating one entry, only by permuting the triple and by negating **all three** at
  once. Exactly one entry is even; put it in the `b` position. The other two are then odd with
  `a + c ≡ 0 (mod 4)`, so one of them is `≡ −1 (mod 4)` and **swapping the two odd entries**
  achieves the congruence. That argument is part of the milestone. The conclusion is that the
  curve is **semistable** in the sense of §Layer 4.5a, with minimal discriminant
  `(a·b·c)^{2p}/2⁸` and **algorithmic conductor ideal** `rad(a·b·c)` — Layer 4's Ogg exponent
  `v(Δ) − m + 1`, which is `1` at every prime dividing `abc` and `0` elsewhere. ⚠ That is a
  Tate's-algorithm computation and is what this roadmap states. The **arithmetic (Artin)
  conductor** of the Frey curve is the same ideal, but that is a *different theorem*: it needs
  the identification of the algorithmic exponent with the Artin conductor exponent in the good
  and multiplicative cases, which §Layer 4 names as a separate project. The roadmap does not
  quietly call the algorithmic exponent "the conductor"; the bridge is named, and the classical
  conductor formula that FLT and modularity arguments consume is stated only once it exists.
  ⚠ The modularity statement this curve is famous for is not this roadmap's, and nothing here
  presupposes it.

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
4. **Invariant theory over a Dedekind domain** — Layer 4.5a: the localisation instances, global
   and semi-global predicates, the minimal discriminant ideal, obstruction exponents, the
   curve-level global-minimality class, semistability, and the reduced-minimal predicate over `ℚ`.
   The Dedekind-general invariant package and easy implication need Layer 4's local minimality;
   they do not include the converse construction of a global equation.
5. **Global equation construction over a number field** — Layer 4.5b, after lane 4. It proves
   Kraus's local and global criteria, patches the local auxiliary coefficients, obtains the
   global-minimality equivalence over `𝓞 K`, proves existence and uniqueness of the reduced
   minimal equation over `ℚ`, and constructs a sharp model at a supplied representative prime.
   The unconditional finite-avoidance corollary belongs to external integration.
6. **Torsion and pairings** — Layer 2, on the dual isogeny and the divisor calculus.
7. **Heights, Mordell–Weil, and explicit `2`-descent** — Layer 6: naïve-height Mordell–Weil
   and the explicit étale-algebra `2`-descent, independent of Layer 7; the canonical height
   is its own later milestone.
8. **Continuous Galois cohomology, twists, and abstract Selmer groups** — the
   nonabelian-`H¹` prerequisite (used by Layer 5's classification and Layer 7), then
   Layer 7's Selmer/Sha, refining Layer 6's descent.
9. **Cassels and the conditional BSD statement** — stretch, after lanes 3, 4, 5, 7, 8.
10. **Selected `ℚ`-specific database adapters** — Layer 8, on lane 5 for the canonical long
    model and on its own minimal-pair-model construction for the height.
   Thin by construction: it owns the minimal-pair model and height, the abc quality, the Szpiro
   ratio with the named conjecture statements and their implications, and bounded integral-point
   search — not an exhaustive database schema.

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
- A. Kraus, *Quelques remarques à propos des invariants `c₄`, `c₆` et `Δ` d'une courbe
  elliptique*, Acta Arith. **54** (1989), 75–80
  ([doi](https://doi.org/10.4064/aa-54-1-75-80)) — the local criterion on `(c₄, c₆)` deciding
  when a pair comes from an integral model at a prime, and the input to the global coefficient
  patching of Layer 4.5b.
- J. E. Cremona, *Algorithms for Modular Elliptic Curves*, 2nd ed. (Cambridge, 1997) — minimal
  and **reduced minimal** Weierstrass equations over `ℚ`, the long-equation normalisation tables
  of curves are written in (Layer 4.5b).
- J. E. Cremona's number-field elliptic-curve implementation (the `kraus` and
  `ell_number_field` modules of SageMath, following Kraus above;
  [documentation](https://doc.sagemath.org/html/en/reference/arithmetic_curves/sage/schemes/elliptic_curves/kraus.html),
  [pinned source](https://github.com/sagemath/sage/blob/c9c8381962adf66efdcf11ee7966a81e8d7b1267/src/sage/schemes/elliptic_curves/kraus.py)) — separate local and global Kraus conditions,
  construction of one global equation from compatible local data, global and semi-global
  minimal models over `𝓞 K`, and the source of the `ℚ(√65)` curve with everywhere
  good reduction, principal minimal discriminant ideal and nontrivial Weierstrass class that
  §Worked examples names (Layers 4.5a–b).
- J. S. Balakrishnan, W. Ho, N. Kaplan, S. Spicer, W. Stein, J. Weigandt, *Databases of elliptic
  curves ordered by height and distributions of Selmer groups and ranks*, LMS J. Comput. Math.
  **19** (2016), 351–370 ([arXiv:1602.01894](https://arxiv.org/abs/1602.01894)) — the
  **minimal-pair integral short model** `y² = x³ + Ax + B` with no
  prime `ℓ` having `ℓ⁴ ∣ A` and `ℓ⁶ ∣ B`, and the height `max(4|A|³, 27B²)` computed from it:
  the exact convention Layer 8 pins, and the reason the height's canonical model is that one
  and not Cremona's reduced minimal long equation.
- H. Darmon, F. Diamond, R. Taylor, *Fermat's Last Theorem*, in *Current Developments in
  Mathematics 1995*, International Press (1995), 1–154 — the Frey–Hellegouarch curve, its
  normalising congruences, and its semistability and conductor (Layer 8).
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
  `[IsIntegrallyClosed W₂.CoordinateRing]` (supplied for elliptic curves by the
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
  stated form; the integer form `a_q² ≤ 4q` is the trivial corollary). The flagship's `#print axioms` output —
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
  so it matches the declaration here in name and generality alike — resting on the general `fg_point`
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
