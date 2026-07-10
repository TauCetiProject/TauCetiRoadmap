# Roadmap: elliptic curves following Silverman

Mathlib knows what an elliptic curve *is*. It has the Weierstrass model
(`WeierstrassCurve R`, its `a`-invariants, `b`/`c₄`/`c₆`/`Δ`/`j`, and the elliptic-curve
condition `WeierstrassCurve.IsElliptic`, i.e. `IsUnit Δ`), the group law on the points
(`WeierstrassCurve.Affine.Point` with its `AddCommGroup`, plus the projective and Jacobian
models), variable changes and normal forms, the division polynomials and elliptic divisibility
sequences, reduction over a discrete valuation ring, the height machinery, and — on the analytic
side — the Weierstrass `℘`-function of a period lattice. What it does **not** have is the
*arithmetic* that makes elliptic curves what they are: the number of points over a finite field
and the **Hasse bound**, the **isogenies** and the **Weil pairing**, the **complex
uniformisation** `ℂ/Λ ≅ E(ℂ)`, the fine behaviour under reduction and the **Tate curve**,
**Tate's algorithm** for the Kodaira type, and the **twists**. None of that is upstream.

This roadmap builds it, following J. H. Silverman, *The Arithmetic of Elliptic Curves* (AEC,
GTM 106) and *Advanced Topics in the Arithmetic of Elliptic Curves* (ATAEC, GTM 151). The two
headline theorems are the **Hasse bound** over `𝔽_q` (AEC V.1) — which we can land now, from
existing sorry-free work — and the **complex uniformisation** (AEC VI). The intervening theory
(isogenies, torsion and the Weil pairing) is what those and the later layers rest on, so it is
built first rather than skipped to the headline.

**Out of scope, deliberately.** Mordell–Weil and the Nagell–Lutz/torsion-over-`ℚ` and
descent apparatus around it, the Birch–Swinnerton-Dyer conjecture, and Selmer/Sha are **not**
in this roadmap; nor are modular curves, moduli, and the scheme-theoretic reformulation of an
elliptic curve. Those are separate developments and belong on their own roadmaps. This roadmap
stays with Silverman's curve-by-curve arithmetic over a fixed base field, and consumes Mathlib's
`WeierstrassCurve` model rather than reformulating it.

Suggested home: `TauCeti/AlgebraicGeometry/EllipticCurve/` (mirroring Mathlib's layout).

## Standing conventions

- **The object is `WeierstrassCurve K` together with `[W.IsElliptic]`.** Mathlib has *no*
  standalone `EllipticCurve` type; an elliptic curve is a Weierstrass curve whose discriminant is
  a unit ([`WeierstrassCurve.IsElliptic`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.html)).
  State every target this way. Do not introduce a bundled `EllipticCurve` structure where a
  `WeierstrassCurve` with the `IsElliptic` instance says the same thing.
- **Points are `W.toAffine.Point`.** The group of points is Mathlib's
  `WeierstrassCurve.Affine.Point` — the nonsingular affine points together with the point at
  infinity as the identity — with its `AddCommGroup` instance (the class-group route of
  Angdinata–Xu–Buzzard). Over a field this group is available with no `IsElliptic` hypothesis;
  the elliptic-curve hypotheses enter through the theorems, not the group. Reuse this group and
  the projective/Jacobian point models; do not define a parallel point type.
- **Pin the base per layer; never over-generalise.** Silverman fixes the base chapter by
  chapter, and so do we: a perfect field and its algebraic closure for the Galois theory of
  torsion (III), a **finite** field for Hasse (V), **`ℂ`** for uniformisation (VI), the fraction
  field of a **discrete valuation ring** for reduction and the Tate curve (VII, ATAEC), and a
  general field for twists (X). Each milestone is stated over the base its mathematics actually
  needs — decided up front and written down — not over a ring more general than the theorem holds
  over.
- **`E[N]` is `Submodule.torsionBy ℤ E N`.** The `N`-torsion is the `ℤ`-module torsion of the
  point group (`Point` is an `AddCommGroup`, hence a `ℤ`-module); use
  [`Submodule.torsionBy`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Module/Torsion/Basic.html)
  and Mathlib's `ZMod N`, not a bespoke torsion subgroup or a private `ℤ/N`.
- **Isogenies and the Weil pairing speak Mathlib's vocabulary.** An isogeny is at least an
  `AddMonoidHom` on `Point`; its extra content is that it is a *morphism of curves* of finite
  degree, and building that content is part of Layer 0, not something to paper over with a bare
  group hom. The Weil pairing `e_N` lands in the `N`-th roots of unity `μ_N ⊆ K` — pin the value
  as `e_N(P, Q) ^ N = 1`, reusing `rootsOfUnity`/`Nˣ`, rather than inventing a pairing-valued
  type.
- **Silverman is the specification.** Each milestone cites AEC/ATAEC by number and is the
  theorem stated *intrinsically*. Where existing Lean work proves it, that is provenance (final
  section), read as the source of a proof to migrate and clean, never as the standard the
  milestone is judged against.

## What Mathlib already has (consume)

This is the foundation the roadmap builds on; it is consumed, not rebuilt.

- **The Weierstrass model and its invariants.** `WeierstrassCurve R`, the `a`-invariants,
  `b₂`/`b₄`/`b₆`/`b₈`, `c₄`/`c₆`, the discriminant `Δ`, the `j`-invariant `WeierstrassCurve.j`,
  the elliptic-curve condition `WeierstrassCurve.IsElliptic`, the `VariableChange` group and its
  action, the normal forms, `ModelsWithJ`/`ofJ` (every `j ∈ K` is realised by a curve), and base
  change `WeierstrassCurve.baseChange`
  (`Mathlib/AlgebraicGeometry/EllipticCurve/{Weierstrass,VariableChange,NormalForms,ModelsWithJ}.lean`).
- **The group law.** `WeierstrassCurve.Affine.Point` and its `AddCommGroup`
  (`.../Affine/Point.lean`), and the projective and Jacobian point models
  (`.../Projective/*`, `.../Jacobian/*`) with the isomorphisms between them.
- **Division polynomials and elliptic divisibility sequences.** `WeierstrassCurve.Ψ`, `Φ`, `ψ`
  (`.../DivisionPolynomial/*`) and `EllipticDivisibilitySequence`
  (`Mathlib/NumberTheory/EllipticDivisibilitySequence.lean`) — the algebra of multiplication by
  `n`, an input to Layers 0–1.
- **Reduction over a DVR.** The good/multiplicative/additive trichotomy, minimal models, and the
  reduction map (`.../EllipticCurve/Reduction.lean`) — the starting point Layer 4 refines.
- **Heights.** The height machinery and the elliptic-curve quasi-quadraticity bound
  (`Mathlib/NumberTheory/Height/*`, `.../Height/EllipticCurve.lean`).
- **The `L`-function definition** (`.../EllipticCurve/LFunction.lean`; junk when the residue
  field is infinite).
- **The analytic `℘`-function.** `PeriodPair` (a pair of `ℝ`-linearly independent periods),
  `PeriodPair.weierstrassP` (`℘`), `derivWeierstrassP` (`℘'`), the differential equation
  `derivWeierstrassP_sq` (`℘'² = 4℘³ − g₂℘ − g₃`), the period lattice `PeriodPair.lattice` (a
  `Submodule ℤ ℂ`) and its `IsZLattice` instance
  (`Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`).
  ⚠ This is **not** linked to `WeierstrassCurve`, and the uniformisation isomorphism is **not**
  there — building that bridge is Layer 3.

What is *not* here is the roadmap: the finiteness of `E(𝔽_q)`, the Hasse bound, the isogenies and
the dual isogeny, the Weil pairing and the Tate module, the invariant differential and the formal
group, the complex uniformisation isomorphism, the Tate curve, the twists, and Tate's
algorithm / Kodaira types / the conductor exponent.

## What is missing (build here)

`Suggested.lean` pins the load-bearing milestones as `sorry`-targets so each is claimable and
machine-checked to be expressible against the pinned Mathlib: the `N`-torsion structure
`E[N] ≅ (ℤ/N)²` and the **Weil pairing** (Layer 1); the finiteness of `E(𝔽_q)` and the **Hasse
bound** (Layer 2); the **complex uniformisation** in both directions (Layer 3); and the
**quadratic twist**, its `j`-invariance and its point-isomorphism over the quadratic extension
(Layer 5). The Layer 0 objects (the isogeny type, the dual isogeny, the invariant differential,
the formal group) and the Layer 4 objects (the Kodaira type, the conductor exponent, the Tate
curve isomorphism) are new *types* whose faithful signatures require the very API those layers
introduce; they are specified in the narrative below and built there, and are deliberately not
pinned as `sorry`-typed placeholder types.

---

## The build, in layers

The ordering is the dependency order.

### Layer 0: isogenies, the invariant differential, and formal groups (AEC III.4–5, IV)

- **Isogenies.** The type of isogenies `φ : E → E'` — nonconstant morphisms of curves taking `O`
  to `O` — with the degree `deg φ`, the basic theorems that an isogeny is a group homomorphism
  (AEC III.4.8) and is surjective on `\bar K`-points (III.4.10), and the multiplication-by-`n`
  map `[n]` as an isogeny with `deg[n] = n²` (III.6). The morphism-of-curves content — an isogeny
  is more than an `AddMonoidHom` — is exactly what this layer builds, via the induced map on
  function fields; `deg` is the degree of that field extension. `[n]`'s surjectivity on `\bar K`
  is the first concrete milestone (seeded).
- **The dual isogeny.** For `φ : E → E'` of degree `m`, the dual `φ̂ : E' → E` with
  `φ̂ ∘ φ = [m]` and `φ ∘ φ̂ = [m]` (AEC III.6.1), bilinearity of `(φ, ψ) ↦ φ̂ψ`, and
  `deg φ̂ = deg φ`. This is the engine behind the Weil pairing and the Hasse estimate.
- **The invariant differential.** The translation-invariant differential
  `ω = dx / (2y + a₁x + a₃)` (AEC III.5), its invariance under translation, and the additivity
  `(φ + ψ)^* ω = φ^* ω + ψ^* ω` (III.5.2) that makes `[n]^* ω = n·ω` — the identity that forces
  `[n]` to be separable exactly when `p ∤ n`.
- **The formal group.** The formal group `Ê` obtained by expanding the group law at `O` (AEC
  IV.1): the formal group law, the formal logarithm and exponential in characteristic `0`, `[m]`
  on `Ê`, and the theory that governs the kernel of reduction (IV.6, used in Layers 2 and 4). If
  Mathlib grows a general formal-group API this layer refactors onto it; until then the formal
  group of a Weierstrass curve is built here.

### Layer 1: torsion, the Weil pairing, and the Tate module (AEC III.6–8)

- **The structure of `E[N]`.** Over a separably closed field `K` with `N` invertible in `K`
  (equivalently `char K ∤ N`), `E[N] ≅ (ℤ/N)²` (AEC III.6.4), with `E[N]` as
  `Submodule.torsionBy ℤ (E.Point) N`. The `#E[N] = N²` count and the group structure are the
  milestone (seeded); the multiplication-by-`N` surjectivity of Layer 0 supplies the counting
  input. This is the "N-torsion" target.
- **The Weil pairing.** The pairing `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), with its defining
  properties: it is bilinear, alternating (`e_N(P, P) = 1`), **nondegenerate**, Galois-equivariant
  (`e_N(P, Q)^σ = e_N(P^σ, Q^σ)`), and compatible with isogenies via the dual
  (`e_N(φP, Q) = e_N(P, φ̂Q)`). The pairing lands in the `N`-th roots of unity; pin `e_N(P,Q)^N = 1`
  and nondegeneracy (seeded). Built from the dual isogeny (Layer 0).
- **The Tate module.** For a prime `ℓ ≠ char K`, the Tate module `T_ℓ E = lim E[ℓ^n]`, a free
  `ℤ_ℓ`-module of rank `2`, the `ℓ`-adic Weil pairing on it, and the continuous Galois
  representation `Gal(\bar K / K) → GL(T_ℓ E) ≅ GL₂(ℤ_ℓ)` (AEC III.7). The rank-`2` freeness and
  the Galois action are the milestones; the pairing gives the image its determinant (the
  cyclotomic character).

### Layer 2: elliptic curves over finite fields — the Hasse bound (AEC V.1)

- **Finiteness.** `E(𝔽_q)` is finite (seeded as `Finite (W.toAffine.Point)` over a finite
  field) — a prerequisite Mathlib does not have, even for the count to make sense.
- **The Hasse bound.** `|#E(𝔽_q) − (q + 1)| ≤ 2√q` (AEC V.1.1), the headline. With
  `a_q := q + 1 − #E(𝔽_q)` the trace of Frobenius, this is `|a_q| ≤ 2√q`, proved from
  `deg(1 − φ_q) = #E(𝔽_q)`, the positivity `deg ≥ 0` of the degree form on `End E`, and the
  Cauchy–Schwarz estimate `|deg(φ − ψ) − deg φ − deg ψ| ≤ 2√(deg φ · deg ψ)` (AEC V.1.2) — i.e.
  the arithmetic reduces to `a_q² ≤ 4q`. Seeded as `hasse_bound`. Grounded on the degree form
  (Layer 0) and the Weil-pairing/Frobenius apparatus (Layer 1), it is nonetheless landable now:
  the existing proof (provenance) carries a self-contained finite-level pairing, so this layer's
  headline can be the first PR while Layers 0–1 are still being built out.
- **The zeta function of `E/𝔽_q`.** The local zeta function
  `Z(E/𝔽_q, T) = (1 − a_q T + q T²)/((1 − T)(1 − qT))`, its functional equation, and the Riemann
  hypothesis for `E/𝔽_q` (the roots have absolute value `q^{-1/2}`, equivalent to Hasse) (AEC
  V.2). The `a_q`-recursion `#E(𝔽_{q^n})` from the Frobenius eigenvalues is the concrete payoff.

### Layer 3: elliptic curves over `ℂ` — complex uniformisation (AEC VI)

- **From a lattice to a curve.** For a period lattice `Λ = PeriodPair.lattice L`, the
  Eisenstein series `g₂(Λ)`, `g₃(Λ)`, the curve `y² = 4x³ − g₂x − g₃` as a `WeierstrassCurve ℂ`
  with `[IsElliptic]` (discriminant `g₂³ − 27g₃² ≠ 0`), and the analytic parametrisation
  `z ↦ (℘(z), ℘'(z))` inducing a **group isomorphism** `ℂ/Λ ≅ E(ℂ)` (AEC VI.3.6). Seeded as the
  existence of the curve and of the `AddEquiv (ℂ ⧸ L.lattice) ≃+ W.toAffine.Point`, built on
  Mathlib's `℘` and `derivWeierstrassP_sq`.
- **Uniformisation (the converse).** Every elliptic curve over `ℂ` arises this way: for
  `W : WeierstrassCurve ℂ` with `[W.IsElliptic]` there is a `PeriodPair L` and a group
  isomorphism `ℂ/L.lattice ≅ W(ℂ)` (AEC VI.5.1, the uniformisation theorem). Seeded. Its input
  is the surjectivity of `j` on lattices (`j : ℍ/SL₂(ℤ) → ℂ` bijective), which the analytic side
  supplies.
- **The dictionary.** Isogenies `↔` sublattices, `E[N] ↔ (1/N)Λ / Λ`, the Weil pairing `↔` the
  lattice pairing, and endomorphisms `↔` complex multiplication — the Layer-0/1 objects read off
  analytically. This is where the earlier layers pay their debt over `ℂ`.

### Layer 4: elliptic curves over local fields — reduction, the Tate curve, and Tate's algorithm (AEC VII, ATAEC IV–V)

- **Refined reduction.** Over the fraction field `K` of a DVR with residue field `k`: the Néron
  minimal model, the component group, the exact sequence
  `0 → E₁(K) → E₀(K) → E_ns(k) → 0` and `0 → Ê(𝔪) → E₁(K) → 0` connecting the formal group
  (Layer 0) to the kernel of reduction (AEC VII.2), and the criterion of Néron–Ogg–Shafarevich
  (good reduction `↔` unramified `T_ℓ`-action) (AEC VII.7), which consumes the Tate module of
  Layer 1.
- **The Tate curve.** For `K` complete with `|q| < 1`, the Tate curve `E_q` and the rigid-analytic
  uniformisation `\bar K^× / q^ℤ ≅ E_q(\bar K)` (ATAEC V.3), the `p`-adic analogue of Layer 3 — the
  model for a curve with split multiplicative reduction.
- **Tate's algorithm.** The algorithm (ATAEC IV.9; Tate, *Modular Functions IV*, LNM 476, 1975)
  computing from a minimal Weierstrass equation the **Kodaira type** of the special fibre
  (`I₀, Iₙ, II, III, IV, I₀^*, Iₙ^*, IV^*, III^*, II^*`), the **conductor exponent** `f_p` (via
  Ogg's formula `f_p = v(Δ) − m + 1` with `m` the number of components), and the local index
  `c_p = [E(K) : E₀(K)]`. The Kodaira type is a new enumerated type and the algorithm is its
  decision procedure; both are built here.

### Layer 5: twists (AEC X.2, X.5)

- **The twisting principle.** Twists of `E/K` are classified by `H¹(Gal(\bar K/K), Aut E)`; for
  `j ≠ 0, 1728` this is `K^× / (K^×)²` and the twists are the **quadratic twists** (AEC X.5.4),
  built from `Aut E ≅ {±1}` (AEC III.10).
- **Quadratic twists.** For `d ∈ K^×`, the quadratic twist `E^d` as a `WeierstrassCurve K`, with:
  `j(E^d) = j(E)` (seeded), the effect on `Δ`, `c₄`, `c₆`, the involution `(E^d)^d ≅ E`, and the
  **point-isomorphism** `E^d(L) ≅ E(L)` over any extension `L` in which `d` becomes a square —
  Galois-anti-equivariant over the quadratic extension `K(√d)` (seeded).
- **Reduction of twists.** Over a local field, every curve with nonsplit multiplicative reduction
  becomes **split** after an unramified quadratic twist (the split/nonsplit dichotomy of Layer 4),
  and the quadratic twist that does it. This is the link Layer 4's Tate curve needs, and the
  concrete FLT-facing milestone.

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **`[n]` is surjective on `E(\bar K)`** and `#E[N] = N²` for `N` invertible in `K` — the Layer
  0/1 counting gate (`smul_surjective`, `torsion_addEquiv_prod`).
- **The Weil pairing is nondegenerate and `μ_N`-valued** — `e_N(P, ·) ≡ 1 ⇒ P = 0` and
  `e_N(P,Q)^N = 1` (`weilPairing_nondegenerate`, `weilPairing_pow_eq_one`).
- **Hasse over `𝔽_p`:** for a specific curve, e.g. `y² = x³ + 1` over `𝔽_5`, the count sits in
  `[p + 1 − 2√p, p + 1 + 2√p]`; the general bound is `hasse_bound`.
- **Complex uniformisation round-trip:** a lattice gives a curve and a group isomorphism
  `ℂ/Λ ≅ E(ℂ)`, and a curve over `ℂ` gives back a lattice
  (`exists_isElliptic_addEquiv_quotient_lattice`, `exists_periodPair_addEquiv`).
- **`j` is a twist invariant** but the curves differ: `j(E^d) = j(E)` while `E^d ≇ E` over `K`
  for non-square `d`, and `E^d(K(√d)) ≅ E(K(√d))` (`j_quadraticTwist`,
  `quadraticTwistPointEquiv`).
- **Tate's algorithm on a table entry:** a curve with `v(Δ) = n`, `v(c₄) = 0` returns Kodaira
  type `Iₙ` with conductor exponent `1` — the algorithm checked against the Kodaira table.

## Ordering

Layer 0 (isogenies, the dual, the invariant differential, the formal group) is the algebraic
foundation and comes first; Layer 1 (torsion, the Weil pairing, the Tate module) builds directly
on the dual isogeny. Layer 2 (Hasse) is the first arithmetic summit and is the earliest PR, since
its existing proof is self-contained. Layer 3 (complex uniformisation) is independent of Layer 2
and rests on Layer 1 read analytically. Layer 4 (local fields, the Tate curve, Tate's algorithm)
consumes the formal group (Layer 0), the Tate module (Layer 1), and Mathlib's reduction theory;
Layer 5 (twists) consumes `Aut E` (Layer 0) and feeds the split-reduction statement Layer 4
needs, and is where the quadratic-twist work already in flight lands.

## References

- J. H. Silverman, *The Arithmetic of Elliptic Curves*, GTM 106, 2nd ed. (Springer, 2009) — AEC:
  III (isogenies, torsion, the Weil pairing), V (finite fields, Hasse), VI (`ℂ`, uniformisation),
  VII (local fields), X (twists).
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, GTM 151 (Springer,
  1994) — ATAEC: IV (Néron models), V (the Tate curve).
- J. Tate, *Algorithm for determining the type of a singular fibre in an elliptic pencil*, in
  *Modular Functions of One Variable IV*, LNM 476 (Springer, 1975), 33–52 — Tate's algorithm.
- H. Hasse, *Zur Theorie der abstrakten elliptischen Funktionenkörper*, J. reine angew. Math. 175
  (1936) — the Hasse bound.
- J. Tate, *The arithmetic of elliptic curves*, Invent. Math. 23 (1974), 179–206 — the survey.

## Provenance (migrate and clean from existing sorry-free Lean work)

The milestones are specified above intrinsically; this section is the secondary map to Lean work
that already discharges parts of them and is the source to migrate and clean. It is read as
provenance, not as the specification.

- **Hasse bound (Layer 2).** Proved `sorry`-free and axiom-clean (`propext`, `Classical.choice`,
  `Quot.sound` only) in the AINTLIB `HasseWeil` project
  ([github.com/CBirkbeck/AINTLIB](https://github.com/CBirkbeck/AINTLIB)),
  `HasseWeil/HasseBound.lean` (`hasse_bound`, with `trace_sq_le_four_mul_deg` and
  `abs_le_two_sqrt_of_sq_le` the arithmetic core), over Mathlib's `WeierstrassCurve K`
  with `[IsElliptic]` and a `Fintype` of points. Port the `#print axioms` gate with it.
- **Complex uniformisation (Layer 3).** The `℘`-side is in progress in
  [WilliamCoram/LeanBridge](https://github.com/WilliamCoram/LeanBridge) (branch `work`): the
  lattice-to-curve map, the `℘`-addition theorem via the Euler differential equation, `j`
  surjectivity, and the existence half of uniformisation, `sorry`-free but unmerged, on top of
  Mathlib's `PeriodPair`/`℘`. The open piece there is exactly the **bijectivity** of `φ` — the
  isomorphism `ℂ/Λ ≅ E(ℂ)` this layer seeds.
- **Quadratic twists (Layer 5).** [ImperialCollegeLondon/FLT](https://github.com/ImperialCollegeLondon/FLT)
  PR #1088 (`sorry`-free): `WeierstrassCurve.quadraticTwist`, `quadraticTwistPointEquiv`,
  `j_quadraticTwist`, the `Δ`/`c₄`/`c₆` effect, the involution, and
  `exists_quadraticTwist_hasSplitMultiplicativeReduction` (the split-after-unramified-twist
  statement Layer 4 uses), with the reusable base-change/variable-change/`Aut` support in
  `FLT/Mathlib/AlgebraicGeometry/EllipticCurve/*` (including `Aut E ≅ ℤ/2` for `j ≠ 0, 1728`).
- **The Tate curve (Layer 4).** FLT PRs #1069, #1085 (merged) and #1099 (open):
  `FLT/KnownIn1980s/EllipticCurves/TateCurve*`, `FLT/TateCurve/*`.
- **`E[N] ≅ (ℤ/N)²` (Layer 1).** A `sorry`-free proof exists in the AINTLIB modular-curves
  development as `torsion_geometricFibre_rank_two` — there in the scheme-theoretic setting; the
  milestone here is the intrinsic `WeierstrassCurve` statement, so the migration restates it over
  `Submodule.torsionBy ℤ (E.Point) N` and drops the scheme scaffolding.

Isogenies, the invariant differential, the formal group, and Tate's algorithm are, to our
knowledge, not yet formalised for Mathlib's `WeierstrassCurve`; they are built here from
Silverman.
