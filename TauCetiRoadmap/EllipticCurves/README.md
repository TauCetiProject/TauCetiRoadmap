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
*morphism*, *isogeny*, *Néron model*, and *twist* (a torsor that need not have a rational point)
only make sense scheme-theoretically. So this roadmap **builds the scheme associated to a
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
  a (finite, surjective) morphism of the abelian schemes taking `O` to `O` — the same notion as an
  isogeny of abelian varieties, so no bespoke equation-level definition to reconcile later. The
  induced map on `Point` is its shadow.
- **`E[N]` is `Submodule.torsionBy ℤ E N`**, and the Weil pairing `e_N` is an additive **bilinear**
  map into `Additive (rootsOfUnity N K)` — `ℤ`-bilinear, valued in the `N`-th roots of unity, over
  **any** field with no closure hypothesis — whose load-bearing API is **functoriality under change
  of field**. Use [`Submodule.torsionBy`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Module/Torsion/Basic.html),
  `ZMod N`, `rootsOfUnity`/`Nˣ`, `Additive`, not private versions.
- **Pin the base per layer; never over-generalise.** An **arbitrary** field and its **separable**
  closure for the Galois theory of torsion (III) — no perfectness assumed — a **finite** field for
  Hasse (V), a **rank-1 valuation** field for reduction and the Tate curve (VII, ATAEC), and a
  **number field** for Mordell–Weil and Selmer/Sha (VIII–X). ⚠ For FLT-facing statements the base
  is often a **valuation** field (e.g. `n`-torsion of a curve with good reduction over a `p`-adic
  field is unramified when `p ∤ n`); state those over valuation fields.
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
  `VariableChange` group and its action, the normal forms, `ModelsWithJ`/`ofJ`, and base change
  `WeierstrassCurve.baseChange`
  (`Mathlib/AlgebraicGeometry/EllipticCurve/{Weierstrass,VariableChange,NormalForms,ModelsWithJ}.lean`).
- **The group law.** `WeierstrassCurve.Affine.Point` and its `AddCommGroup`
  (`.../Affine/Point.lean`), with the projective and Jacobian models (`.../Projective/*`,
  `.../Jacobian/*`).
- **Division polynomials and elliptic divisibility sequences.** `WeierstrassCurve.Ψ`, `Φ`, `ψ`
  (`.../DivisionPolynomial/*`) and `EllipticDivisibilitySequence`
  (`Mathlib/NumberTheory/EllipticDivisibilitySequence.lean`).
- **Reduction over a DVR.** The good/multiplicative/additive trichotomy, minimal models, the
  reduction predicates `HasGood/Multiplicative/SplitMultiplicative/AdditiveReduction`, and
  `WeierstrassCurve.minimal` (`.../EllipticCurve/Reduction.lean`).
  ⚠ Mathlib states these only over a **DVR**, whereas multiplicative/split reduction really wants
  **rank-1 valuation** fields (so one can speak of `E/ℂ_p`, needed for `p`-adic analysis).
  Generalising Mathlib's `Reduction.lean` off the DVR is an **upstream prerequisite** for Layer 4 in
  full generality, flagged here.
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
`sorry`-targets: `[n]`-surjectivity (Layer 1), the `N`-torsion `E[N] ≅ (ℤ/N)²` and the bilinear
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
  natural, pointed bijection with `(W.baseChange K).toAffine.Point`, identifying the scheme-theoretic
  group with Mathlib's `AddCommGroup`. This is what lets every later layer speak scheme-theoretically
  while reusing Mathlib's `Point`.
- **The group scheme.** The elliptic curve as a commutative group object over the base
  (`EllipticCurve S` extending a smooth proper scheme with section and a locally-Weierstrass
  structure), with `mulBy`, the group axioms, and base change. Isogenies (Layer 1), the Néron model
  (Layer 4), and general twists (Layer 5) are defined against this object.
- **Isomorphisms of models.** An isomorphism of Weierstrass models corresponds to a Mathlib
  `VariableChange` (`pointedIso_exists_variableChange`) — the scheme-theoretic content of the change
  of variables.

The moduli / `Y(N)` superstructure of the modular curves project is **not** part of this roadmap.

### Layer 1: isogenies, the invariant differential, and formal groups (AEC III.4–5, IV)

- **Isogenies.** An isogeny `φ : E → E'` is a finite surjective morphism of the group schemes
  (Layer 0) taking `O` to `O` — hence a group homomorphism, and the *same* notion as an isogeny of
  abelian varieties. Its degree `deg φ`, the dual isogeny `φ̂` with `φ̂φ = [deg φ]` and `φφ̂ = [deg φ]`
  (AEC III.6.1), bilinearity of `(φ, ψ) ↦ φ̂ψ`, and multiplication-by-`n` `[n]` as an isogeny of
  degree `n²` (III.6). `[n]`'s surjectivity on `Kˢᵉᵖ`-points is the first concrete milestone
  (seeded).
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
  scheme of `[N]`. The `#E[N] = N²` count and group structure are the milestone (seeded); Layer 1's
  `[N]`-surjectivity supplies the counting input.
- **The Weil pairing.** `e_N : E[N] × E[N] → μ_N` (AEC III.8.1), pinned as an additive **bilinear**
  map into `Additive (rootsOfUnity N K)` over any field (seeded). Its theory: alternating,
  **nondegenerate** over a separably closed field (seeded), Galois-equivariant, compatible with
  isogenies via the dual (`e_N(φP, Q) = e_N(P, φ̂Q)`), and — the load-bearing API — **functorial
  under change of field**. Built from the dual isogeny (Layer 1).
- **The Tate module.** For `ℓ ≠ char K`, `T_ℓ E = lim E[ℓⁿ]`, a free `ℤ_ℓ`-module of rank `2`, the
  `ℓ`-adic Weil pairing, and the continuous Galois representation
  `Gal(Kˢᵉᵖ/K) → GL(T_ℓ E) ≅ GL₂(ℤ_ℓ)` (AEC III.7). The rank-`2` freeness and the Galois action are
  the milestones; the pairing gives the determinant (the cyclotomic character).

### Layer 3: elliptic curves over finite fields — the Hasse bound (AEC V.1)

- **Finiteness.** `E(𝔽_q)` is finite (seeded as `Finite (W.toAffine.Point)` over a finite field) —
  a prerequisite Mathlib lacks.
- **The Hasse bound.** `#E(𝔽_q)` is within `2√q` of `q + 1` (AEC V.1.1). With
  `a_q := q + 1 − #E(𝔽_q)` the trace of Frobenius, the natural formalisation goal is the **integer
  inequality** `a_q² ≤ 4q` (seeded as `hasse_bound`; the real `|a_q| ≤ 2√q` follows), from
  `deg(1 − φ_q) = #E(𝔽_q)`, positivity `deg ≥ 0` of the degree form on `End E`, and Cauchy–Schwarz
  on it (AEC V.1.2). Grounded on the degree form (Layer 1) and the Frobenius apparatus (Layer 2), it
  is nonetheless landable now: the existing proof (provenance) carries a self-contained finite-level
  pairing, so this headline can be the first PR while Layers 0–2 are still built out.
- **The zeta function of `E/𝔽_q`.** `Z(E/𝔽_q, T) = (1 − a_q T + q T²)/((1 − T)(1 − qT))`, its
  functional equation, and the Riemann hypothesis for `E/𝔽_q` (roots of absolute value `q^{-1/2}`,
  equivalent to Hasse) (AEC V.2); the `a_q`-recursion for `#E(𝔽_{qⁿ})`.

### Layer 4: elliptic curves over local fields — reduction, Néron models, the Tate curve, Tate's algorithm (AEC VII, ATAEC IV–V)

- **Refined reduction and the Néron model.** Over a rank-1 valuation field `K` with residue field
  `k`: the **Néron minimal model** — a genuine scheme, well-defined because of Layer 0 — its special
  fibre and component group, the exact sequences `0 → E₁(K) → E₀(K) → E_ns(k) → 0` and
  `0 → Ê(𝔪) → E₁(K) → 0` connecting the formal group (Layer 1) to the kernel of reduction (AEC
  VII.2), and the Néron–Ogg–Shafarevich criterion (good reduction `↔` unramified `T_ℓ`-action) (AEC
  VII.7), consuming the Tate module (Layer 2).
- **The Tate curve.** For `K` complete with `|q| < 1`, the Tate curve `E_q` and the rigid-analytic
  uniformisation `Kˢᵉᵖ^× / qᶻ ≅ E_q(Kˢᵉᵖ)` (ATAEC V.3) — the `p`-adic model for split multiplicative
  reduction, and (unlike complex uniformisation) an *algebraic/rigid* statement that stays in scope.
- **Tate's algorithm.** From a minimal Weierstrass equation, the **Kodaira type** of the special
  fibre (`I₀, Iₙ, II, III, IV, I₀*, Iₙ*, IV*, III*, II*`), the **conductor exponent** `f_p` (Ogg's
  formula `f_p = v(Δ) − m + 1`), and the local index `c_p = [E(K) : E₀(K)]` (ATAEC IV.9; Tate, LNM
  476, 1975). The Kodaira type is a new enumerated type; the algorithm is its decision procedure.

### Layer 5: twists (AEC X.2–5)

Twists of `E/K` are classified by `H¹(Gal(Kˢᵉᵖ/K), Aut E)`. **In general a twist is a torsor** — a
smooth projective curve `K`-isomorphic to `E` over `Kˢᵉᵖ` that need not have a rational point — which
is why the honest theory needs the scheme (Layer 0), not just the Weierstrass model. For
`j ≠ 0, 1728`, `Aut E ≅ {±1}` and the twists are the **quadratic twists** `K^×/(K^×)²`.

- **General twists.** The classification `H¹(Gal, Aut E)` and, for `j ≠ 0, 1728`, its reduction to
  `K^×/(K^×)²` (AEC X.2, X.5.4), built on the scheme.
- **Quadratic twists (Weierstrass form).** The concrete `char`-free development of Stoll (FLT
  #1088): the twist `quadraticTwistOf E t n` by the quadratic `x² − t x + n` (discriminant
  `D = t² − 4n`, `Δ ↦ D⁶Δ`, `c₄ ↦ D²c₄`, `c₆ ↦ D³c₆`), elliptic when `D` is a unit, with
  `j(E_{t,n}) = j(E)` (seeded); the extension twist `quadraticTwist E L` by a separable quadratic
  `L/K` with `j(E^L) = j(E)` (seeded); the point isomorphism `E^L(M) ≅ E(M)` over `M ⊇ L`, Galois
  anti-equivariant by the quadratic character (seeded); and the headline that a curve with **nonsplit**
  multiplicative reduction acquires **split** reduction after a separable quadratic twist (seeded,
  over Mathlib's reduction predicates). This is *not* Silverman's `char ≠ 2` Example X.3 2.4.

### Layer 6: the Mordell–Weil theorem (AEC VIII)

- **Mordell–Weil.** For `K` a number field, `E(K)` is a **finitely generated** abelian group (AEC
  VIII.6.7) — `AddGroup.FG (W.toAffine.Point)` (seeded). The weak Mordell–Weil theorem
  (`E(K)/mE(K)` finite, via the Kummer sequence and the finiteness of the `m`-Selmer group, Layer 7)
  together with the theory of heights (Mathlib's height machinery, and the canonical/Néron–Tate
  height with its quadraticity) gives the full theorem by descent.
- **The torsion subgroup and Nagell–Lutz.** The torsion subgroup `E(K)_tors` is finite and
  computable; over `ℚ`, the Nagell–Lutz theorem (integral coordinates, `y = 0` or `y² ∣ Δ`) (AEC
  VIII.7) and the reduction-injectivity bound on torsion (`E(ℚ)_tors ↪ E_ns(𝔽_p)` for good `p`)
  (VII.3).

### Layer 7: Selmer groups and Sha (AEC X.4)

- **Descent and the Selmer group.** The `m`-descent exact sequence
  `0 → E(K)/mE(K) → Sel_m(E/K) → Ш(E/K)[m] → 0` from the Kummer sequence in Galois cohomology, the
  finiteness of the `m`-Selmer group `Sel_m(E/K)` (AEC X.4.2) — which is what makes weak Mordell–Weil
  effective — and the Shafarevich–Tate group `Ш(E/K)`, with its local conditions.
- ⚠ **Dependency.** The clean formulation rests on **continuous Galois cohomology**, which is still
  settling in Mathlib; this layer is gated on that API and is stated to refactor onto it once it
  lands. (BSD, which would relate `Ш` and the rank to `L(E, s)`, is out of scope — it needs the
  analytic continuation of `L(E, s)` that Mathlib does not have.)

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **The scheme and its points.** `projModel W` is a smooth proper scheme whose `K`-points
  match `W.toAffine.Point` (`projModel_points`) — the Layer-0 bridge every later layer uses.
- **`[n]` is surjective on `E(Kˢᵉᵖ)`** and `#E[N] = N²` for `N` invertible in `K` — the Layer 1/2
  counting gate (`smul_surjective`, `torsion_addEquiv_prod`).
- **The Weil pairing is bilinear and nondegenerate** — an additive bilinear map into
  `Additive (rootsOfUnity N K)`, with `e_N(P, ·) ≡ 0 ⇒ P = 0` over a separably closed field
  (`weilPairing`, `weilPairing_nondegenerate`).
- **Hasse:** `a_q² ≤ 4q` for the Frobenius trace `a_q = q + 1 − #E(𝔽_q)` (`hasse_bound`).
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
and feeds the split-reduction statement of Layer 4. Layer 6 (Mordell–Weil) consumes heights and the
finiteness of the Selmer group; Layer 7 (Selmer/Sha) supplies that finiteness and is gated on
continuous Galois cohomology.

## References

- J. H. Silverman, *The Arithmetic of Elliptic Curves*, GTM 106, 2nd ed. (Springer, 2009) — AEC:
  III (isogenies, torsion, Weil pairing), V (finite fields, Hasse), VII (local fields, Néron),
  VIII (Mordell–Weil), X (twists, Selmer/Sha).
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, GTM 151 (Springer,
  1994) — ATAEC: IV (Néron models), V (the Tate curve).
- J. Tate, *Algorithm for determining the type of a singular fibre in an elliptic pencil*, in
  *Modular Functions of One Variable IV*, LNM 476 (Springer, 1975), 33–52 — Tate's algorithm.
- H. Hasse, *Zur Theorie der abstrakten elliptischen Funktionenkörper*, J. reine angew. Math. 175
  (1936) — the Hasse bound.

## Provenance (existing Lean work to migrate into Tau Ceti)

The milestones are specified above intrinsically; this section maps them to Lean work that already
discharges parts of them, as sources of proofs to migrate — never as the specification.

- **The scheme of a Weierstrass curve (Layer 0).** The elliptic-curve-as-group-scheme development
  in the AINTLIB modular curves project — `projModel`, `IsWeierstrassModel`, `projModel_points`,
  `projModel_smooth`, `isPullback_projModelBaseChange`, the `EllipticCurve S` group scheme, and
  `pointedIso_exists_variableChange` — is the model to port (its moduli / `Y(N)` part is out of
  scope).
- **`E[N] ≅ (ℤ/N)²` (Layer 2).** A `sorry`-free proof exists in the same project as
  `torsion_geometricFibre_rank_two` (scheme-theoretic); the milestone here is the intrinsic
  `WeierstrassCurve` statement over `Submodule.torsionBy ℤ (E.Point) N`.
- **Hasse bound (Layer 3).** Proved `sorry`-free and axiom-clean (`propext`, `Classical.choice`,
  `Quot.sound`) in the AINTLIB `HasseWeil` project (`HasseWeil/HasseBound.lean`, with
  `trace_sq_le_four_mul_deg` and `abs_le_two_sqrt_of_sq_le`); port the `#print axioms` gate with it.
- **The Tate curve (Layer 4).** Partial AI developments exist in the FLT project
  (`FLT/KnownIn1980s/EllipticCurves/TateCurve*`, `FLT/TateCurve/*`); the merge state there changes
  frequently and is not tracked here.
- **Quadratic twists (Layer 5).** The FLT project has a `sorry`-free quadratic-twist development —
  several thousand lines of AI-generated Lean — supplying `quadraticTwistOf` and its invariants,
  `quadraticTwist`, `exists_smul_eq_or_exists_smul_eq_quadraticTwist`, `quadraticTwistPointEquiv`
  with `quadraticTwistPointEquiv_galois`, and `exists_quadraticTwist_hasSplitMultiplicativeReduction`,
  plus base-change/`VariableChange`/`Aut`/reduction support. It is a body of code to bring **into Tau
  Ceti first**, not a Mathlib dependency; the adjustments on porting are `Module.finrank K L = 2` →
  `Algebra.IsQuadraticExtension K L` (being upstreamed) and its own `quadraticCharacter` for the
  Galois statement.
- **Mordell–Weil and Selmer (Layers 6–7).** Michael Stoll's recent AI-assisted formalisation of
  Mordell–Weil is the model to migrate; the Selmer/Sha layer waits on continuous Galois cohomology.

Isogenies, the invariant differential, the formal group, Néron models, and Tate's algorithm are, to
our knowledge, not yet formalised for Mathlib's `WeierstrassCurve`; they are built here on the
Layer-0 scheme.
