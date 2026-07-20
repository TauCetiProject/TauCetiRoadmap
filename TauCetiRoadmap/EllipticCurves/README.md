# Roadmap: elliptic curves

Mathlib knows what an elliptic curve *is*. It has the Weierstrass model
(`WeierstrassCurve R`, its `a`-invariants, `b`/`c₄`/`c₆`/`Δ`/`j`, and the elliptic-curve
condition `WeierstrassCurve.IsElliptic`, i.e. `IsUnit Δ`), the group law on the points
(`WeierstrassCurve.Affine.Point` with its `AddCommGroup`, plus the projective and Jacobian
models), variable changes and normal forms, the division polynomials and elliptic divisibility
sequences, and reduction over a discrete valuation ring. What it does **not** have is much of the
further theory that every graduate student in the area learns: the elliptic curve **as a scheme**,
its **isogenies** and the **Weil pairing**, the number of points over a finite field and the
**Hasse bound**, the fine behaviour under reduction with **Néron models**, the **Tate curve** and
**Tate's algorithm**, the **twists**, the **Mordell–Weil theorem**, and **Selmer groups and Sha**.
None of that is upstream.

This roadmap builds that theory. The mathematics is standard, and the layers cite J. H. Silverman,
*The Arithmetic of Elliptic Curves* (AEC, GTM 106) and *Advanced Topics* (ATAEC, GTM 151), and
other sources for definiteness — but the specification is a **thorough, Mathlib-style API** for
each object, not a transcription of any one book. The theorem we can land almost immediately is the
**Hasse bound** over `𝔽_q` (AEC V.1), from existing sorry-free work; the intervening theory is what
it and the later layers rest on.

**The scheme is the foundation.** An elliptic curve is not just a Weierstrass equation and a group
law on its points — it is a smooth proper group scheme, and the honest notions of
*morphism*, *isogeny*, *Néron model*, and *genus-one torsor* (a principal homogeneous space with
no rational point, hence no Weierstrass model at all) only make sense scheme-theoretically. So
this roadmap **builds the scheme associated to a
Weierstrass curve**, following the development already carried out in the
[modular curves project](https://github.com/CBirkbeck/AINTLIB) (the elliptic-curve-as-group-scheme
part of it — *not* the moduli / `Y(N)` superstructure, which is a separate project). Everything
else is built on that foundation, so that isogenies are morphisms of abelian schemes (agreeing with
the general theory by construction, not a bespoke equation-level surrogate to be reconciled later).

**Out of scope.** Modular curves, moduli, and the representability questions around them are a
separate project. **Complex uniformisation** `ℂ/Λ ≅ E(ℂ)` is left out: its honest form is analytic,
not arithmetic — it needs a complex-manifold structure on `E(ℂ)`, a substantial and orthogonal
development — and belongs on a dedicated complex-analytic roadmap. The **Birch–Swinnerton-Dyer
conjecture** is out: its statement needs the analytic continuation of `L(E, s)`, which Mathlib does
not have. Everything else — through Mordell–Weil and Selmer/Sha — is in.

Suggested home: `TauCeti/AlgebraicGeometry/EllipticCurve/` (mirroring Mathlib's layout).

## Standing conventions

- **The object is `WeierstrassCurve K` with `[W.IsElliptic]`, together with its associated
  scheme.** Mathlib has *no* standalone `EllipticCurve` type; an elliptic curve is a Weierstrass
  curve whose discriminant is a unit
  ([`WeierstrassCurve.IsElliptic`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.html)).
  Its scheme (Layer 0) is `Proj` of the Weierstrass cubic; the point group `W.toAffine.Point` is
  identified with the scheme's `K`-points by the Layer-0 bridge. Do not introduce a bundled
  `EllipticCurve` structure where a `WeierstrassCurve` with the `IsElliptic` instance says the same
  thing.
- **Points are `W.toAffine.Point`.** The group of points is Mathlib's
  `WeierstrassCurve.Affine.Point` — the nonsingular affine points with the point at infinity as the
  identity — with its `AddCommGroup` instance (the ideal-class-group route of Angdinata–Xu). Over a
  field this group is available with no `IsElliptic` hypothesis; the elliptic-curve hypotheses enter
  through the theorems, not the group. Reuse it and the projective/Jacobian models.
- **Isogenies are morphisms of the group scheme.** Because Layer 0 builds the scheme, an isogeny is
  a **finite locally free, surjective** homomorphism of the group schemes (equivalently: finite
  faithfully flat) taking `O` to `O` — the same notion as an isogeny of abelian varieties, so no
  bespoke equation-level definition to reconcile later. Over the general Layer-0 base, plain
  "finite surjective" is **not** enough — it gives no flatness, hence neither the degree (a
  finite-locally-free rank) nor the kernel/dual theory; over a field the two notions agree, a
  finite surjective morphism of smooth curves being automatically flat. The induced map on `Point`
  is its shadow.
- **`E[N]` is `Submodule.torsionBy ℤ E N`**, and the Weil pairing `e_N` is an additive **bilinear**
  map into `Additive (rootsOfUnity N K)` — `ℤ`-bilinear, valued in the `N`-th roots of unity, over
  **any** field with no closure hypothesis — whose load-bearing API is **functoriality under change
  of field**. Use [`Submodule.torsionBy`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Module/Torsion/Basic.html),
  `ZMod N`, `rootsOfUnity`/`Nˣ`, `Additive`, not private versions. (Where the `ZMod N`-module
  structure on `E[N]` is needed, Mathlib's `AddSubgroup.torsionBy` — its `A[n]` notation, reducibly
  the same subgroup — carries it via `AddSubgroup.torsionBy.zmodModule`.)
- **Pin the base per layer; never over-generalise.** An **arbitrary** field and its **separable**
  closure for the Galois theory of torsion (III) — no perfectness assumed — a **finite** field for
  Hasse (V), and a **number field** for Mordell–Weil and Selmer/Sha (VIII–X). Layer 4 splits in
  two: a **DVR** (complete or Henselian where a statement needs it, residue-field hypotheses per
  result) for Néron models, Kodaira types, component groups, conductors, and Tate's algorithm
  (VII, ATAEC IV), and a **complete rank-1 valued** field — not necessarily discrete, e.g. `ℂ_p` —
  for the Tate curve (ATAEC V). One hypothesis does not serve both: `ℂ_p` is nondiscretely valued
  and has no Néron model. ⚠ For FLT-facing statements the base is often a **valuation** field
  (e.g. `n`-torsion of a curve with good reduction over a `p`-adic field is unramified when
  `p ∤ n`); state those over valuation fields.
- **Sources, not a single specification.** Each milestone builds the full basic theory of its
  objects, cites AEC/ATAEC (and other references) for the mathematics, but no one book is the spec:
  Silverman does not develop Mathlib-style API, does the Tate curve in less generality than we want,
  and does quadratic twists only in `char ≠ 2` (X.3 Example 2.4), which we do not. Where existing
  Lean work proves a milestone, that is provenance (final section), never the standard it is judged
  against.

## What Mathlib already has (consume)

This is the foundation the roadmap builds on; it is consumed, not rebuilt.

- **The Weierstrass model and its invariants.** `WeierstrassCurve R`, the `a`-invariants,
  `b₂`/`b₄`/`b₆`/`b₈`, `c₄`/`c₆`, `Δ`, `WeierstrassCurve.j`, `WeierstrassCurve.IsElliptic`, the
  `VariableChange` group and its action, the normal forms, `ofJ` (in `ModelsWithJ.lean`), and base change
  `WeierstrassCurve.baseChange`
  (`Mathlib/AlgebraicGeometry/EllipticCurve/{Weierstrass,VariableChange,NormalForms,ModelsWithJ}.lean`).
- **The group law.** `WeierstrassCurve.Affine.Point` and its `AddCommGroup`
  (`.../Affine/Point.lean`), with the projective and Jacobian models (`.../Projective/*`,
  `.../Jacobian/*`).
- **Division polynomials and elliptic divisibility sequences.** `WeierstrassCurve.Ψ`, `Φ`, `ψ`
  (`.../DivisionPolynomial/*`) and `IsEllDivSequence`/`normEDS`
  (`Mathlib/NumberTheory/EllipticDivisibilitySequence.lean`).
- **Reduction over a DVR.** The good/multiplicative/additive trichotomy, minimal models, the
  reduction predicates `HasGood/Multiplicative/SplitMultiplicative/AdditiveReduction`, and
  `WeierstrassCurve.minimal` (`.../EllipticCurve/Reduction.lean`).
  ⚠ Mathlib states these only over a **DVR** — the right base for Layer 4's Néron/Tate's-algorithm
  strand, which stays there. But multiplicative/split reduction is also wanted over **rank-1
  valued** fields (so one can speak of `E/ℂ_p`, needed for `p`-adic analysis), where the valuation
  is not discrete and there is no Néron model; generalising Mathlib's reduction *predicates* off
  the DVR is an **upstream prerequisite** for Layer 4's Tate-curve strand, flagged here.
- **Heights and the `L`-function definition.** `Mathlib/NumberTheory/Height/*`,
  `.../Height/EllipticCurve.lean` (the quasi-quadraticity bound), and `.../EllipticCurve/LFunction.lean`.
- **The scheme substrate.** Mathlib's algebraic geometry — `AlgebraicGeometry.Scheme`, `Proj`,
  `Spec`, morphisms, smoothness, group schemes — is the substrate on which Layer 0 builds the scheme
  of a Weierstrass curve.

What is *not* here is the roadmap: the elliptic curve as a scheme, isogenies and the dual, the Weil
pairing and the Tate module, the invariant differential and the formal group, the finiteness and
count of `E(𝔽_q)`, the Hasse bound, Néron models and Tate's algorithm, the Tate curve, the twists,
the Mordell–Weil theorem, and Selmer/Sha.

## What is missing (build here)

`Suggested.lean` pins the load-bearing milestones that are expressible against the pinned Mathlib as
`sorry`-targets: `[n]`-surjectivity for `n` invertible in `K` (Layer 1), the `N`-torsion
`E[N] ≅ (ℤ/N)²` — exposed as a free rank-`2` `ZMod N`-module — and the bilinear
**Weil pairing** (Layer 2), the finiteness of `E(𝔽_q)` and the **Hasse bound** as the integer
inequality `a_q² ≤ 4q` (Layer 3), the **quadratic twist** and the split-multiplicative-reduction
theorem (Layer 5), and the **Mordell–Weil theorem** `AddGroup.FG (E K)` (Layer 6). The layers whose
central objects are new *types* — the scheme of a Weierstrass curve (Layer 0), the isogeny type and
formal group (Layer 1), the Néron model and Kodaira type (Layer 4), and the Selmer/Sha groups
(Layer 7) — are specified in the narrative below and built there, not pinned here as `sorry`-typed
placeholder types.

---

## The build, in layers

The ordering is the dependency order.

### Layer 0: the elliptic curve as a scheme

The foundation. Following the modular curves project's elliptic-curve-as-group-scheme development:

- **The scheme of a Weierstrass curve.** `projModel W`, the `Proj` of the homogenised Weierstrass
  cubic over the base, together with the proofs that it is **smooth** and **proper**, with the
  marked section `O` at infinity (`IsWeierstrassModel`, `projModel_smooth`). Base change is
  compatible with `WeierstrassCurve.baseChange` (`isPullback_projModelBaseChange`). (The classical
  *genus-`1`* characterisation is deliberately not a target: Mathlib has no genus — it would need
  coherent cohomology — and being **locally Weierstrass** is the definition that carries that
  content here.)
- **The bridge to Mathlib's group law.** `projModel_points`: the `K`-points of `projModel W` are in
  natural, pointed bijection with `(W.baseChange K).toAffine.Point` — and, the load-bearing
  upgrade, that bijection is a **group isomorphism**, transporting the scheme group law (`mulBy`)
  to Mathlib's `AddCommGroup`. State it as a named pointed `AddEquiv`, not an `∃` of an `Equiv`
  (the provenance artifact is the weaker existential pointed bijection; the group clause is
  chart-level computation on the three affine charts). This is what lets every later layer speak
  scheme-theoretically while reusing Mathlib's `Point`, and every fibre-anchor in Layers 1–3
  rides on it.
- **The group scheme.** The elliptic curve as a commutative group object over the base
  (`EllipticCurve S` extending a smooth proper scheme with section and a locally-Weierstrass
  structure), with `mulBy`, the group axioms, and base change. Isogenies (Layer 1), the Néron model
  (Layer 4), and general twists (Layer 5) are defined against this object.
- **Isomorphisms of models.** An isomorphism of Weierstrass models corresponds to a Mathlib
  `VariableChange` (`pointedIso_exists_variableChange`) — the scheme-theoretic content of the change
  of variables.

The moduli / `Y(N)` superstructure of the modular curves project is **not** part of this roadmap.

### Layer 1: isogenies, the invariant differential, and formal groups (AEC III.4–5, IV)

- **Isogenies.** An isogeny `φ : E → E'` is a **finite locally free, surjective** homomorphism of
  the group schemes (Layer 0) taking `O` to `O` — equivalently a finite faithfully flat one; over
  a field this is just "finite surjective" (miracle flatness on smooth curves), but over the
  general base the local freeness must be part of the definition, since it is what the degree and
  the kernel theory are made of. Pointedness gives a group homomorphism for free (rigidity; proved
  in the provenance over a locally noetherian base, the hypothesis to be dropped by spreading
  out), and this is the *same* notion as an isogeny of abelian varieties. Its degree `deg φ` (the
  finite-locally-free rank at the zero fibre), the dual isogeny `φ̂` with `φ̂φ = [deg φ]` and
  `φφ̂ = [deg φ]`
  (AEC III.6.1), bilinearity of `(φ, ψ) ↦ φ̂ψ`, and multiplication-by-`n` `[n]` as an isogeny of
  degree `n²` (III.6). `[n]`'s surjectivity on `Kˢᵉᵖ`-points, for `n` **invertible in `K`** — the
  invertibility makes `[n]` separable, and over a merely separably closed (possibly imperfect)
  field only separable isogenies are surjective on points — is the first concrete milestone
  (seeded). ⚠ The hard core of this layer is the **quadraticity of the degree** — `φ̂φ = [deg φ]`
  and `deg (φψ) = (deg φ)(deg ψ)`, the Abel-grade content, open `sorry`s in the provenance — and
  it is hard for *any* definition of isogeny; the compatibility contract below is what lets it be
  discharged on geometric fibres against equation-level division-polynomial/pencil facts, with no
  `Pic⁰` and no representability anywhere.
- **The compatibility contract — the scheme notions are computable on fibres.** Three named
  milestones tie Layer 1 to the equation level, so that no parallel "equation isogeny" theory
  survives in the API: **(i)** the Layer-0 bridge as a group isomorphism (above); **(ii)** for a
  **separable** isogeny, `deg φ` equals the cardinality of the geometric kernel — finite-locally-free
  `finrank` equals the fibre count — identifying every kernel-cardinality "degree" on points with
  the scheme degree; **(iii)** the `q`-power **Frobenius** `π_q` as a scheme morphism (`Proj` of
  the `q`-power graded ring map), inducing `(x, y) ↦ (x^q, y^q)` on points under the bridge, with
  `deg π_q = q` and `deg (1 − π_q) = #E(𝔽_q)` — Layer 3's hinge. These are the same lemmas the
  provenance's own
  degree pins are designed to be anchored by (`deg [N] = N²` to the division polynomials), so the
  contract sits on the existing critical path. ⚠ Agreement is needed only on the maps the proofs
  actually use — the Frobenius pencil `ℤ + ℤπ_q ⊆ End(E)`, where it follows from (i), (iii), and
  the hom-group structure; **no general fullness theorem** (scheme `End(E)` ↔ point-level maps) is
  required. Kernel-cardinality equals degree only on the **separable** locus, and that is the only
  locus where the existing Hasse proof uses it (its coprime-route design); the one inseparable
  actor, `π_q` itself, never has its kernel counted — its degree `q` enters through the Galois
  `q`-power pairing scaling, matching the separate pin above.
- **The invariant differential.** The translation-invariant differential
  `ω = dx / (2y + a₁x + a₃)` (AEC III.5), its translation-invariance, and additivity
  `(φ + ψ)^* ω = φ^* ω + ψ^* ω` (III.5.2), giving `[n]^* ω = n·ω` — the identity forcing `[n]` to be
  separable exactly when `p ∤ n`.
- **The formal group.** `Ê`, from expanding the group law at `O` (AEC IV.1): the formal group law,
  the formal logarithm/exponential in characteristic `0`, `[m]` on `Ê`, and the theory of the kernel
  of reduction (IV.6, used in Layers 3–4).

### Layer 2: torsion, the Weil pairing, and the Tate module (AEC III.6–8)

- **The structure of `E[N]`.** Over a **separably closed** field `K` with `N` invertible in `K`
  (`char K ∤ N`), `E[N] ≅ (ℤ/N)²` (AEC III.6.4), with `E[N]` as
  `Submodule.torsionBy ℤ (E.Point) N`; scheme-theoretically `E[N]` is the finite flat kernel group
  scheme of `[N]`. The milestone (seeded) exposes what the later layers consume: `E[N]` is a
  **free `ZMod N`-module of rank `2`** — a `ZMod N`-linear equivalence with `(ZMod N)²`, wrapped
  in `Nonempty` because the basis is noncanonical (the equivalent `≃+` form carries the same
  content, additive maps of `ZMod N`-modules being automatically linear). The full `N`-torsion
  theory throughout requires `char K ∤ N`. Layer 1's `[N]`-surjectivity supplies the counting
  input.
- **The Weil pairing.** `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), pinned as an additive **bilinear**
  map into `Additive (rootsOfUnity N K)` over any field (seeded). Its theory: alternating,
  **nondegenerate** over a separably closed field with `N` invertible in `K` (seeded),
  Galois-equivariant, compatible with
  isogenies via the dual (`e_N(φP, Q) = e_N(P, φ̂Q)`), and — the load-bearing API — **functorial
  under change of field**. Built from the dual isogeny (Layer 1).
- **The Tate module.** For `ℓ ≠ char K`, `T_ℓ E = lim E[ℓⁿ]`, a free `ℤ_ℓ`-module of rank `2`, the
  `ℓ`-adic Weil pairing, and the continuous Galois representation
  `Gal(Kˢᵉᵖ/K) → GL(T_ℓ E) ≅ GL₂(ℤ_ℓ)` (AEC III.7). The rank-`2` freeness and the Galois action are
  the milestones; the pairing gives the determinant (the cyclotomic character).

### Layer 3: elliptic curves over finite fields — the Hasse bound (AEC V.1)

- **Finiteness.** `E(𝔽_q)` is finite (seeded as `Finite (W.toAffine.Point)` over a finite field) —
  a prerequisite Mathlib lacks, and the seeded Hasse bound's **required companion**: the bound
  counts with `Nat.card`, which reads `0` on an infinite type, so finiteness is what makes the
  count the honest one (any proof of the bound necessarily establishes it).
- **The Hasse bound.** `#E(𝔽_q)` is within `2√q` of `q + 1` (AEC V.1.1). With
  `a_q := q + 1 − #E(𝔽_q)` the trace of Frobenius, the natural formalisation goal is the **integer
  inequality** `a_q² ≤ 4q` (seeded as `hasse_bound`; the real `|a_q| ≤ 2√q` follows), from
  `deg(1 − φ_q) = #E(𝔽_q)`, positivity `deg ≥ 0` of the degree form on `End E`, and Cauchy–Schwarz
  on it (AEC V.1.2). Grounded on the degree form (Layer 1) and the Frobenius apparatus (Layer 2), it
  is nonetheless landable now: the existing proof (provenance) carries a self-contained finite-level
  pairing, so this headline can be the first PR while Layers 0–2 are still built out.
  ⚠ **The proof's internal isogeny surrogate is not API.** That existing proof manufactures its
  own equation-level Frobenius, kernel-cardinality degrees, and finite-level pairing. The
  statement consumes none of them, and none of them may appear in a **public** statement — Layer 1
  is the sole public notion of isogeny; the surrogate stays proof-internal. Once Layers 1–2 and
  the compatibility contract land, the **scheme-level restatement is a named milestone discharged
  by transport, not by a second proof**: the contract identifies the proof's maps with the real
  Frobenius pencil `ℤ + ℤπ_q ⊆ End(E)` and its kernel-cardinality degrees with `deg` on the
  separable locus — the only locus where the existing proof uses them — so the **existing lemmas
  become the degree-form facts** (positive-definite quadraticity on the pencil,
  `deg (1 − π_q) = #E(𝔽_q)`) and the bound re-derives by rewriting, the statement unchanged. The
  bespoke notions are thereby *certified as computations of the real ones* and kept as the
  engine, not replaced by a fresh proof.
- **The zeta function of `E/𝔽_q`.** `Z(E/𝔽_q, T) = (1 − a_q T + q T²)/((1 − T)(1 − qT))`, its
  functional equation, and the Riemann hypothesis for `E/𝔽_q` (roots of absolute value `q^{-1/2}`,
  equivalent to Hasse) (AEC V.2); the `a_q`-recursion for `#E(𝔽_{qⁿ})`.

### Layer 4: elliptic curves over local fields — reduction, Néron models, the Tate curve, Tate's algorithm (AEC VII, ATAEC IV–V)

Two strands with genuinely different bases. The **discrete** strand (Néron models, Kodaira types,
component groups, conductors, Tate's algorithm) lives over a **DVR** — complete or Henselian where
a statement needs it, with residue-field hypotheses (perfect, or finite) stated explicitly per
result. The **analytic** strand (the Tate curve) lives over a **complete rank-1 valued** field,
not necessarily discrete: `ℂ_p` belongs here and has **no** Néron model, so no single base
hypothesis serves both strands.

- **Refined reduction and the Néron model (discrete strand).** Over a DVR `R` with fraction field
  `K` and residue field `k`: the **Néron minimal model** — a genuine scheme over `R`, well-defined
  because of Layer 0 — its special fibre and component group, the exact sequence
  `0 → E₁(K) → E₀(K) → E_ns(k) → 0` and the identification `Ê(𝔪) ≅ E₁(K)` connecting the formal
  group (Layer 1) to the kernel of reduction (AEC VII.2; `K` complete here — the formal group must
  converge), and the Néron–Ogg–Shafarevich criterion (good reduction `↔` unramified `T_ℓ`-action)
  (AEC VII.7, over complete `K` with perfect `k`), consuming the Tate module (Layer 2).
- **Tate's algorithm (discrete strand).** From a minimal Weierstrass equation over a Henselian
  (classically complete) DVR with **perfect** residue field: the **Kodaira type** of the special
  fibre (`I₀, Iₙ, II, III, IV, I₀*, Iₙ*, IV*, III*, II*`), the **conductor exponent** `f_p`
  (Ogg's formula `f_p = v(Δ) − m + 1`; in residue characteristic `2` and `3` this is genuinely
  Saito's theorem, not Ogg's), and the local index `c_p = [E(K) : E₀(K)]` (ATAEC IV.9; Tate, LNM
  476, 1975). The Kodaira type is a new enumerated type; the algorithm is its decision procedure.
- **The Tate curve (analytic strand).** For `K` a complete rank-1 valued field (nondiscrete
  allowed — `ℂ_p` qualifies) and `|q| < 1`, the Tate curve `E_q` and the rigid-analytic
  uniformisation `Kˢᵉᵖ^× / qᶻ ≅ E_q(Kˢᵉᵖ)` (ATAEC V.3) — the `p`-adic model for split multiplicative
  reduction, and (unlike complex uniformisation) an *algebraic/rigid* statement that stays in
  scope. This strand consumes the rank-1 generalisation of Mathlib's reduction predicates flagged
  in the consume-section above.

### Layer 5: twists (AEC X.2, X.5)

Twists here are twists of the **pointed** curve `(E, O)`: elliptic curves `E'/K` that become
isomorphic to `E` over `Kˢᵉᵖ` *as pointed curves*, classified by `H¹(Gal(Kˢᵉᵖ/K), Aut (E, O))` via
Galois descent on the scheme (Layer 0). A pointed twist keeps its rational point — it is again an
elliptic curve with a Weierstrass model. This is a **different theory from the genus-one
torsors** (principal homogeneous spaces): smooth projective curves `K`-isomorphic to `E` over
`Kˢᵉᵖ` as bare curves, with **no** rational point in general — hence no Weierstrass model, which
is where the scheme is truly indispensable — classified by `H¹(Gal(Kˢᵉᵖ/K), E(Kˢᵉᵖ))`. Those form
the Weil–Châtelet group and belong to **Layer 7**, next to Ш; this layer deliberately does not
conflate the two.

- **General (pointed) twists.** The classification `H¹(Gal, Aut (E, O))` by descent on the scheme
  (AEC X.5). For `j ≠ 0, 1728`, `Aut (E, O) ≅ {±1}` — in characteristics `2` and `3` the two
  exceptional values coincide at `j = 0 = 1728` — and the twists are the **quadratic twists**:
  for `char K ≠ 2` classified by the square classes `K^×/(K^×)²` (Kummer; AEC X.5.4); in
  characteristic `2`, where separable quadratic extensions are Artin–Schreier, by `K/℘(K)` with
  `℘(x) = x² − x`. The concrete construction below is characteristic-free either way.
- **Quadratic twists (Weierstrass form).** The concrete `char`-free development of Stoll (FLT
  #1088): the twist `quadraticTwistOf E t n` by the quadratic `x² − t x + n` (discriminant
  `D = t² − 4n`, `Δ ↦ D⁶Δ`, `c₄ ↦ D²c₄`, `c₆ ↦ D³c₆`, identities over any `CommRing`), elliptic —
  over a field, as FLT states it — exactly when `D ≠ 0`, with
  `j(E_{t,n}) = j(E)` (seeded); the extension twist `quadraticTwist E L` by a separable quadratic
  `L/K` with `j(E^L) = j(E)` (seeded); the point isomorphism `E^L(M) ≅ E(M)` over `M ⊇ L`, Galois
  anti-equivariant by the quadratic character (seeded); and the headline that a curve with **nonsplit**
  multiplicative reduction acquires **split** reduction after a separable quadratic twist (seeded,
  over Mathlib's reduction predicates). This is *not* Silverman's `char ≠ 2` Example X.3 2.4.

### Layer 6: the Mordell–Weil theorem (AEC VIII)

- **Mordell–Weil.** For `K` a number field, `E(K)` is a **finitely generated** abelian group (AEC
  VIII.6.7) — `AddGroup.FG (W.toAffine.Point)` (seeded). **Self-contained at this layer — no
  Layer 7 input.** The weak Mordell–Weil theorem (`E(K)/2E(K)` finite) is proved directly by the
  Kummer argument: the `x − θ` map into the étale algebra `A = K[X]/(f)` lands in the subgroup
  `A(S, 2)` of square classes unramified outside the bad set `S`, and `A(S, 2)` is finite because
  the `S`-class group is finite and the `S`-units are finitely generated (AEC VIII.1; Mathlib
  already defines the group `K(S, n)` in `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean` and
  leaves its finiteness as a TODO — discharged here). That, together with the theory of heights
  (Mathlib's height machinery, and the canonical/Néron–Tate height with its quadraticity), gives
  the full theorem by descent. The elliptic-curve Selmer group `Sel_m(E/K)` of Layer 7 is the
  cohomological *refinement* of this argument, not its prerequisite.
- **The torsion subgroup and Nagell–Lutz.** The torsion subgroup `E(K)_tors` is finite and
  computable; over `ℚ`, the Nagell–Lutz theorem (integral coordinates, `y = 0` or `y² ∣ Δ`) (AEC
  VIII.7) and the reduction-injectivity bound on torsion (`E(ℚ)_tors ↪ E_ns(𝔽_p)` for good `p`)
  (VII.3).

### Layer 7: Selmer groups and Sha (AEC X.4)

- **Descent and the Selmer group.** The `m`-descent exact sequence
  `0 → E(K)/mE(K) → Sel_m(E/K) → Ш(E/K)[m] → 0` from the Kummer sequence in Galois cohomology, the
  finiteness of the `m`-Selmer group `Sel_m(E/K)` (AEC X.4.2) — the **effective refinement** of
  Layer 6's weak Mordell–Weil, giving the computable rank bound — and the Shafarevich–Tate group
  `Ш(E/K)`, with its local conditions. The **genus-one torsors** excluded from Layer 5 live here:
  the Weil–Châtelet group `WC(E/K) = H¹(Gal(Kˢᵉᵖ/K), E(Kˢᵉᵖ))` classifies them (AEC X.3), and `Ш`
  is its everywhere-locally-trivial part.
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

- **The scheme and its points.** `projModel W` is a smooth proper scheme whose `K`-points
  match `(W.baseChange K).toAffine.Point` (`projModel_points`) — the Layer-0 bridge every later layer
  uses.
- **`[n]` is surjective on `E(Kˢᵉᵖ)`** for `n` invertible in `K`, and `#E[N] = N²` for `N`
  invertible in `K` — the Layer 1/2 counting gate (`smul_surjective`, `torsion_linearEquiv_prod`).
- **The Weil pairing is bilinear and nondegenerate** — an additive bilinear map into
  `Additive (rootsOfUnity N K)`, with `e_N(P, ·) ≡ 0 ⇒ P = 0` over a separably closed field with
  `N` invertible (`weilPairing`, `weilPairing_nondegenerate`).
- **Hasse:** `a_q² ≤ 4q` for the Frobenius trace `a_q = q + 1 − #E(𝔽_q)` (`hasse_bound`) — landed
  first from the equation-level proof; then **restated against the Layer-1 degree form by
  transport** across the compatibility contract, the existing proof reused rather than redone.
  The transported restatement is the acceptance test of the contract itself.
- **`j` is a twist invariant** but the curves differ: `j(E^L) = j(E)` while `E^L ≇ E` over `K`, and
  `E^L(M) ≅ E(M)` once `L ⊆ M`, with the Galois action twisted by the quadratic character
  (`j_quadraticTwist`, `quadraticTwistPointEquiv`).
- **Tate's algorithm on a table entry:** a curve with `v(Δ) = n`, `v(c₄) = 0` returns Kodaira type
  `Iₙ` with conductor exponent `1`.
- **Mordell–Weil:** `E(K)` is finitely generated for a number field `K` (`mordellWeil`), and its
  free rank plus a finite torsion subgroup describe it.

## Ordering

Layer 0 (the scheme) is the foundation and comes first; every notion of morphism below depends on
it. Layer 1 (isogenies, the dual, the invariant differential, the formal group) builds on the group
scheme; Layer 2 (torsion, the Weil pairing, the Tate module) on the dual isogeny. Layer 3 (Hasse) is
the earliest PR, its existing proof being self-contained. Layer 4 (local fields, Néron models, the
Tate curve, Tate's algorithm) consumes the formal group (Layer 1), the Tate module (Layer 2), and
Mathlib's reduction theory. Layer 5 (twists) consumes `Aut E` (Layer 1) and the scheme (Layer 0),
and feeds the split-reduction statement of Layer 4. Layer 6 (Mordell–Weil) consumes heights and
number-field finiteness (`S`-class groups, `S`-units) — nothing from Layer 7, so the ordering
really is the dependency order. Layer 7 (Selmer/Sha) refines Layer 6's descent into its
cohomological form and is gated on the continuous-Galois-cohomology packaging (§Layer 7).

## References

- J. H. Silverman, *The Arithmetic of Elliptic Curves*, GTM 106, 2nd ed. (Springer, 2009) — AEC:
  III (isogenies, torsion, Weil pairing), V (finite fields, Hasse), VII (local fields, Néron),
  VIII (Mordell–Weil), X (twists, Selmer/Sha).
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, GTM 151 (Springer,
  1994) — ATAEC: IV (Néron models), V (the Tate curve).
- J. Tate, *Algorithm for determining the type of a singular fibre in an elliptic pencil*, in
  *Modular Functions of One Variable IV*, LNM 476 (Springer, 1975), 33–52 — Tate's algorithm.
- S. Bosch, W. Lütkebohmert, M. Raynaud, *Néron Models*, Ergebnisse (3) 21 (Springer, 1990) —
  Néron models over a DVR/Dedekind base (Layer 4, discrete strand).
- T. Saito, *Conductor, discriminant, and the Noether formula of arithmetic surfaces*, Duke Math.
  J. 57 (1988), 151–173 — Ogg's formula in residue characteristic `2` (Layer 4).
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
  `dev/modular-curves @ 50d5f9d37387`, the HasseWeil project at `dev/hasse-weil @ 513e83879e2f`.
- **FLT** (`github.com/ImperialCollegeLondon/FLT`, Apache-2.0): the quadratic-twist development of
  PR #1088, merged as `bc2fe8ff7396` (2026-07-10).
- **Heights / Mordell–Weil** (`github.com/MichaelStollBayreuth/Heights`, **GPL-2.0**):
  `master @ 678f461488ce` (2026-07-12). ⚠ GPL-2.0 is incompatible with Tau Ceti's Apache-2.0, so
  this code cannot be copied in as-is: migration needs the author's relicensing or direct
  contribution (coordination with M. Stoll was opened on this roadmap's review thread). Until
  that lands, Layer 6 treats the pinned repository as the *model* for a to-build proof, not as a
  source to transcribe.

- **The scheme of a Weierstrass curve (Layer 0).** The elliptic-curve-as-group-scheme development
  in the AINTLIB modular curves project — `projModel`, `IsWeierstrassModel`, `projModel_points`,
  `projModel_smooth`, `isPullback_projModelBaseChange`, the `EllipticCurve S` group scheme, and
  `pointedIso_exists_variableChange` — is the model to port (its moduli / `Y(N)` part is out of
  scope). Its working group law (`mulBy`, the group axioms, base change) is `sorry`-free, but the
  `EllipticCurve S` object's canonical group-enrichment existence/uniqueness (`abelEnrichment_*`) is
  still `sorry` there — to be built, not inherited. ⚠ Its `projModel_points` is an **existential
  pointed bijection** only; the Layer-0 group-isomorphism clause is the port's upgrade, not
  inherited.
- **Isogenies and the degree (Layer 1).** The same project's `EndomorphismDegree.lean` (following
  Katz–Mazur) already carries, `sorry`-free: **rigidity** (`endMonHom` — a pointed endomorphism is
  a homomorphism, over a locally noetherian base), the hom-group on `End(E/S)`, the `mulBy`
  algebra, the **degree as finite-locally-free rank at the zero fibre** (`endDeg` via
  `Scheme.Hom.finrank`), the trace `endTrace f = deg(1 + f) − 1 − deg f`, and the **Abel-free
  dual** `endDual f := [tr f] − f` (Katz–Mazur 2.6.2.2 solved for the dual — no `Pic⁰`). Its open
  `sorry`s are exactly Layer 1's hard core — `endDual_comp_self` (`φ̂φ = [deg φ]`) and `endDeg`
  multiplicativity — with `deg [N] = N²` designed to fibre-anchor to the HasseWeil
  `mulByInt_degree`. On the equation side, HasseWeil's `DualIsogeny.lean` and
  `DegreeQuadraticForm.lean` (its conditional route) are the anchor material for the
  compatibility contract.
- **`E[N] ≅ (ℤ/N)²` (Layer 2).** A `sorry`-free proof over **algebraically closed** geometric fibres
  exists as `torsion_geometricFibre_rank_two` (scheme-theoretic; its `deg[N] = N²` anchor is in the
  sibling `HasseWeil` project's division-polynomial route). The milestone here is the intrinsic
  `WeierstrassCurve` statement over `Submodule.torsionBy ℤ (E.Point) N`, over a **separably** closed
  field, exposed as a free rank-`2` `ZMod N`-module (`torsion_linearEquiv_prod`).
- **Hasse bound (Layer 3).** Proved in the AINTLIB `HasseWeil` project as `hasse_bound` /
  `hasse_bound_unconditional` (`HasseWeil/WeilPairing/HasseBound.lean`), in the real form
  `|#E(𝔽_q) − q − 1| ≤ 2√q` over `Fintype.card W.toAffine.Point` (the projective count, matching the
  seed; the integer form `a_q² ≤ 4q` is the trivial corollary). The flagship's `#print axioms` output —
  `[propext, Classical.choice, Quot.sound]` — is recorded in-repo at the pinned revision (a
  documented check, to be turned into a CI gate on porting) — but the
  surrounding project is not globally `sorry`-free (the capstone routes around its in-progress
  conditional lemmas), and its `maxHeartbeats 2000000` override must be removed for TauCeti CI. (The
  `trace_sq_le_four_mul_deg` quadratic-form step belongs to that separate conditional route, not the
  flagship.)
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
- **Mordell–Weil (Layer 6).** Michael Stoll's AI-assisted formalisation (pinned above) proves it
  `sorry`-free, by exactly the route Layer 6 specifies: `fg_point` over the fraction field of a
  Dedekind domain — the finiteness inputs (finite class group, finitely generated unit group, for
  the integer rings of the field factors of `K[X]/(f)`) taken as hypotheses, the curve in short
  normal form (`[W.IsShortNF]`) — and `fg_point_of_numberField` discharging those hypotheses over
  a number field (`Heights/EllipticCurve.lean`); weak Mordell–Weil by the `x − θ` map into the
  étale algebra (`Heights/WeakMordellWeil.lean`); and the étale-algebra Selmer-group finiteness
  extending Mathlib's `DedekindDomain.SelmerGroup` and discharging its finiteness TODO
  (`Heights/SelmerGroup.lean` — the *arithmetic* `K(S,n)`, not Layer 7's `Sel_m(E/K)`). Porting
  notes: the seeded `mordellWeil` is stated for any `WeierstrassCurve` over a number field, so the
  port adds the variable-change reduction to short normal form; and the GPL-2.0 licence must be
  resolved first (pinned-sources note above).
- **Selmer/Sha (Layer 7)** waits on the continuous-Galois-cohomology packaging (§Layer 7 lists the
  concrete missing pieces).

The modular-curves project also carries a `sorry`-free construction of the **invariant
differential** as a line bundle: `ω_{E/S}`, glued over the Weierstrass atlas from the chart-level
`dx / (2y + a₁x + a₃)` (`InvariantDifferential.lean` at the pinned revision) — the natural
starting point for the Layer-1 port. Its isogeny functoriality (`(φ + ψ)^*ω = φ^*ω + ψ^*ω`, hence
`[n]^*ω = n·ω`) is not there and is built here. The formal group, Néron models, and Tate's
algorithm are, to our knowledge, not yet formalised anywhere; they are built here on the Layer-0
scheme, alongside the completion of the isogeny foundations above.
