# Roadmap: modular curves, following Katz–Mazur

Mathlib's algebraic geometry has grown into a real theory of schemes and their morphisms —
`Scheme`, `Proj` and `Spec`, fibre products, and a morphism-property library covering étale,
smooth (with relative dimension), proper, finite, flat (with rank), unramified, immersions, and
descent (`Mathlib/AlgebraicGeometry/Morphisms/`), together with ideal sheaves and kernels
(`Mathlib/AlgebraicGeometry/IdealSheaf/`) and group objects in cartesian monoidal categories
(`Grp_`, `CommGrp_`). On the arithmetic side it has the complete Weierstrass-equation theory of
elliptic curves (`WeierstrassCurve`, the group law on points, division polynomials). What it
does **not** have is the object those two threads exist to meet in: the **elliptic curve as a
scheme over a base** with its group-scheme structure, its **torsion subgroup schemes** and
**isogenies**, **Drinfeld level structures**, the **moduli problems** `[Γ(N)]`, `[Γ₁(N)]`,
`[Γ₀(N)]`, and the **modular curves** `Y(N)`, `Y₁(N)`, `Y₀(N)` that represent (or coarsely
represent) them. None of that is upstream.

This roadmap builds that theory, following N. Katz and B. Mazur, *Arithmetic Moduli of
Elliptic Curves* (Annals of Mathematics Studies 108, 1985) — **KM**, whose result numbering is
this roadmap's shared coordinate system — with D. Loeffler's *Modular Curves* lecture notes as
the modern companion spine the provenance transcribes verbatim, and Deligne–Rapoport and
Drinfeld as the classical sources KM builds on. The headline is the **Katz–Mazur construction
of the modular curves**: the moduli problems in their **Drinfeld form over all of `ℤ`**, their
relative representability, the representability of the rigid ones by **schemes** (`Y(N)` for
`N ≥ 3`, `Y₁(N)` for `N ≥ 4`, smooth affine over `ℤ[1/N]`), coarse spaces for the non-rigid
ones (the `j`-line, `Y₀(N)`), and — the summit — KM's First Main Theorem 5.1.1: the four basic
problems are relatively representable, finite flat over the moduli of elliptic curves, and
**regular of dimension two**.

**This roadmap absorbs the scheme-theoretic elliptic-curve layer.** The elliptic-curves
roadmap ([`TauCetiRoadmap/EllipticCurves/`](../EllipticCurves/README.md)) deliberately
develops its arithmetic on the Weierstrass equation and its function field, with **no schemes
anywhere**, and defers "the scheme-facing story" — the elliptic curve as a scheme, the
group-scheme structure, scheme-level isogenies, and the comparison of its function-field
isogenies with scheme morphisms — to a future scheme-facing roadmap. **This is that roadmap.**
Layers 1–2 build the elliptic curve over an arbitrary base scheme with its group law,
isogenies, degree, and dual — Katz–Mazur's Chapter 2 material, which is also exactly the
foundation the moduli problems of Chapters 3–7 stand on — and carry the cross-roadmap
comparison contract.

**The road from here to KM.** KM silently assume a working algebro-geometric toolkit that
Mathlib does not yet have: relative effective Cartier divisors, quotients of schemes by finite
(flat) group actions, torsors and descent, finite locally free group schemes with Cartier
duality, and the finite étale dictionary. Layer 0 makes each of these an explicit target —
this is the "algebraic geometry development" the roadmap must do before KM's own constructions
begin, and the provenance's ~130-file `ForMathlib/` directory is the worked evidence of what
is needed and that it is within reach.

**Out of scope.** The **compactifications** `X(N)`, `X₁(N)`, `X₀(N)` — cusps, the Tate curve
over `ℤ((q))`, and KM Chapter 8's normalization construction — are a natural successor roadmap,
not this one (the affine `Y`-side is where all of KM's moduli-theoretic content lives; only
statements of coarse `Y`-side properties cite Ch. 8 here). Igusa curves and the
characteristic-`p` fine structure of KM Chapters 12–14. Generalized elliptic curves à la
Deligne–Rapoport. A general theory of algebraic stacks or algebraic spaces — deliberately:
see the conventions. Modular forms, Hecke operators, and Eichler–Shimura (a separate
project). Néron models — deferred again, as in the elliptic-curves roadmap; they are not
KM's subject. Complex uniformisation `Γ\ℍ ≅ Y(Γ)(ℂ)` — analytic, and belongs with a
complex-analytic roadmap.

Suggested home: `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/` for Layers 1–2 and
`TauCeti/AlgebraicGeometry/ModularCurve/` for Layers 3–7 (mirroring Mathlib's layout), with
the Layer-0 material filed where Mathlib would put it (`Morphisms/`, `GroupScheme/`,
`Divisors/`).

## Standing conventions

- **The elliptic curve of record is smooth-proper-with-section, locally Weierstrass.** An
  elliptic curve over a base scheme `S` is a morphism `π : E ⟶ S`, smooth and proper of
  relative dimension `1`, with a section `0 : S ⟶ E`, which **Zariski-locally on `S` is the
  projective Weierstrass model** of an elliptic `WeierstrassCurve` (the provenance's
  `LocallyWeierstrass` condition). This is the executable definition: it supplies charts,
  coordinate changes, and atlases with no coherent cohomology. It *implies* the abstract
  Deligne–Rapoport/KM 2.1.1 condition (proper flat, fibres smooth genus-`1`); the **converse**
  (genus-`1` fibres ⟹ locally Weierstrass, via cohomology and the Riemann–Roch argument) is a
  named comparison milestone (Layer 1), stated but off the critical path to the modular
  curves. Do not introduce a genus-based definition of record: Mathlib has no genus.
- **Group schemes are group objects; the group law is data with a uniqueness theorem.** The
  group structure on `E/S` is a commutative-group-object structure (Mathlib's
  `Grp_`/`CommGrp_` vocabulary in the cartesian monoidal `Over S`) with identity the given
  section, constructed from the Weierstrass addition on charts; its **uniqueness** (any two
  group-scheme structures with the same identity agree — rigidity) is a theorem, so the data
  is canonical. Coordinate with the in-flight upstream work — mathlib
  [#25983](https://github.com/leanprover-community/mathlib4/pull/25983) (the affine scheme of
  an elliptic curve) and [#35151](https://github.com/leanprover-community/mathlib4/pull/35151)
  (group-scheme structure on a Weierstrass curve) — and refactor onto it as it lands rather
  than forking.
- **Stacks without stacks.** KM's formalism — the category `Ell/R` of elliptic curves over
  variable `R`-bases, moduli problems as contravariant functors on it, relative
  representability — is adopted exactly, and **no theory of algebraic stacks or algebraic
  spaces is built or assumed**. Where the moduli stack would be quoted, this roadmap uses
  KM's own substitutes: the **Weierstrass atlas** (the affine scheme
  `Spec ℤ[a₁, …, a₆][Δ⁻¹]` with the variable-change group action, presenting `Ell`) and
  rigidifier torsors (Legendre, level-`3`, level-`4`). The stack remark stays a remark.
- **Drinfeld structures are the definition of record; naive structures are the
  `ℤ[1/N]`-shadow.** Level structures are defined over an **arbitrary** base in Drinfeld's
  form (full sets of sections, KM 1.3–1.6; exact order, KM 1.4; fppf-locally generated cyclic
  subgroups, KM 1.4.1), and the naive forms (fibrewise generators of `E[N]`) are separate
  predicates with **equivalence theorems when `N` is invertible** (KM 1.4.4, 3.7). Never state
  a moduli problem over `ℤ` in naive form, and never let a milestone silently invert `N`
  unless its layer does.
- **Degrees are finite-locally-free ranks.** An isogeny is a finite locally free surjective
  homomorphism of group schemes; `deg φ` is the (locally constant) rank, `[N]` has degree
  `N²`, and `E[N] = ker [N]` is finite locally free of rank `N²` over `S` (KM 2.3). The dual
  isogeny is the Abel-free `φ̂ := [tr φ] − φ` of KM 2.6.2.2 — no `Pic⁰` and no
  representability input.
- **The function-field comparison is owed, both ways.** The elliptic-curves roadmap defines
  isogenies over a field as reversed function-field embeddings; this roadmap's Layer 2 carries
  the **comparison contract**: over a field `K`, scheme isogenies of elliptic curves
  correspond to that roadmap's `Isogeny` (under the curves ↔ function-fields
  anti-equivalence), matching degrees, separability, `[N]`, and Frobenius. State it as a
  named milestone here, where the schemes live; the elliptic roadmap deliberately does not.
- **KM's numbering is the coordinate system.** Milestones cite KM by result number (1.4.1,
  2.3.1, 4.7.0, 5.1.1, 7.1.3, …) — the provenance's files already speak this language — with
  Loeffler's §§ cited in parallel for the readable statements. ⚠ Statements sourced from the
  companion notes rather than KM's own text (some coarse-space material of KM Ch. 8) are
  flagged as such where they occur; do not formalize KM-attributed statements from memory.
- **Base discipline.** The moduli theory is developed over `ℤ` (Drinfeld register)
  throughout; `ℤ[1/N]` enters only where étaleness/naive structures genuinely need it, and
  each layer's base is pinned in its header. Individual constructions stay over an arbitrary
  base ring `R` where KM state them so (`Ell/R`).

## What Mathlib already has (consume)

This is the substrate the roadmap builds on; it is consumed, not rebuilt.

- **Schemes and morphisms.** `Scheme`, `Spec`/`Proj`, fibre products, `Over`, and the
  morphism-property library: `Etale`, `Smooth` and `SmoothOfRelativeDimension`, `IsProper`,
  `IsFinite`, flatness with rank (`Morphisms/Flat.lean`, `Morphisms/FlatRank.lean`),
  `IsClosedImmersion`/immersions, quasi-finite, separated, universally closed/open/injective,
  formally unramified, and flat descent (`Morphisms/Descent.lean`, `FlatDescent.lean`).
- **Ideal sheaves.** `Mathlib/AlgebraicGeometry/IdealSheaf/` with scheme-hom kernels
  (`Scheme.Hom.ker`) — the substrate for closed-subscheme loci (the exact-order locus,
  Layer 3).
- **Group objects.** `Grp_ C`/`CommGrp_ C` and the cartesian monoidal machinery
  (`CategoryTheory/Monoidal/Cartesian/Grp_.lean`) — the vocabulary for group schemes over a
  base, shared with mathlib #35151.
- **The Weierstrass theory.** All of `Mathlib/AlgebraicGeometry/EllipticCurve/`: the model,
  its invariants, `VariableChange`, base change, the group law on `Affine.Point`, division
  polynomials, `IsElliptic` — Layers 1–2 wrap this equation-level theory into the scheme and
  never re-derive it.
- **Commutative algebra.** Finite/flat/étale ring maps, `Module.finrank`, Hopf algebras
  (`Mathlib/RingTheory/HopfAlgebra/`, with `MonoidAlgebra` group rings for the constant group
  schemes and `ℤ/N`-graded pieces), invariant subrings, and the local criteria of flatness.
- **Category theory.** (Co)limits in `Scheme`, representable functors, `Over`-categories,
  descent-shaped gluing (`Scheme.GlueData`).

What is *not* here is the roadmap: the elliptic curve as a scheme with its group law,
isogenies and `E[N]`, relative Cartier divisors, scheme quotients, Drinfeld structures, the
moduli formalism, and the modular curves.

## What is missing (build here)

`Suggested.lean` seeds Layer 1's entry points, statable against pinned Mathlib today: the
projective model `projModel W` of a Weierstrass curve as a `Scheme` with its structure
morphism, properness, smoothness of relative dimension `1`, the zero section, and the
points dictionary (`K`-sections of the model ↔ `W.toAffine.Point`). The layers whose central
objects are new *types* — relative Cartier divisors and quotients (Layer 0), the bundled
elliptic curve over a base and its group structure (Layer 1), isogenies and `E[N]` (Layer 2),
Drinfeld structures (Layer 3), `Ell/R` and moduli problems (Layer 4), and the modular curves
themselves (Layers 5–7) — are specified in the narrative below and built there, not pinned
here as `sorry`-typed placeholder types.

---

## The build, in layers

The ordering is the dependency order.

### Layer 0: scheme-theoretic prerequisites (what KM silently assume)

The bridge from today's Mathlib to KM's starting line. Each item is mathlib-shaped and should
be built at Mathlib generality (the provenance's `ForMathlib/` directory — ~130 files,
including staged upstream PR drafts — is the evidence base and the model).

- **Relative effective Cartier divisors** (KM 1.1–1.2). Closed subschemes `D ⊆ X` over `S`,
  flat over `S`, whose ideal sheaf is invertible; sums; pullback; degree over `S` when finite
  locally free; the divisor of a section of a smooth relative curve; behaviour under base
  change. This is the language Drinfeld structures are written in — nothing in Layers 3–7
  parses without it.
- **Finite locally free group schemes** over a base: kernels of homomorphisms as group
  schemes, the constant group schemes `(ℤ/N)_S` (group rings), `μ_N` as `Spec` of the group
  algebra quotient, **Cartier duality** for finite locally free commutative group schemes
  (needed for `μ_N ≅ (ℤ/N)ᵛ` and the Weil-pairing target), and the order/rank calculus.
- **Quotients.** `Spec` of invariants for a finite group acting on an affine scheme, with the
  quotient properties (integral, surjective, open orbits question set aside); quotients of
  schemes by **free** finite group actions by gluing; torsors under finite (flat) group
  schemes; quotient of an elliptic curve by a finite locally free subgroup scheme via
  Hopf-algebra invariants on charts (the provenance's Hopf–Galois route, sorry-free at the
  pin). Consumed twice: `E ↦ E/C` for `[Γ₀(N)]` (Layer 2) and the `GL₂(ℤ/N)`/variable-change
  quotients behind coarse spaces (Layer 6).
- **The finite étale dictionary.** Finite étale covers, their sections and fibre counts,
  cancellation and descent, enough Galois-category material to move between "finite étale of
  degree `d`" and "fppf-locally constant" — the engine of the `ℤ[1/N]` half (naive = Drinfeld,
  étaleness of the level covers). Full `π₁`-theory is **not** required; pin exactly the
  lemmas Layers 3 and 5 consume.
- **Descent.** Faithfully flat (finite, and Zariski) descent for morphisms, group structures,
  and the level-structure predicates; spreading out over noetherian bases where KM's
  arguments need it (the provenance's `RigiditySpreadingOut`, `FinitePresentationDescent`).

### Layer 1: elliptic curves over a base scheme (KM 2.1; DR II.1)

- **The projective model.** For `W : WeierstrassCurve R`: `projModel W`, the `Proj` of the
  homogenised Weierstrass cubic, with structure morphism to `Spec R` (seeded), the zero
  section at infinity (seeded), **properness** (seeded) and **smoothness of relative
  dimension `1`** when `W.IsElliptic` (seeded), and compatibility with base change and
  `VariableChange` (isomorphisms of models ↔ variable changes).
- **The points dictionary.** `K`-sections of `projModel W ⟶ Spec K` biject with
  `W.toAffine.Point` (seeded), and more generally `T`-sections with the equation-level
  solutions on `T` — the bridge that lets every fibrewise statement in Layers 2–7 be checked
  against Mathlib's existing point group, and (once Layer 1's group structure exists) a group
  isomorphism, not merely a bijection.
- **The bundled object.** `EllipticCurve S`: `π : E ⟶ S` smooth proper of relative dimension
  `1`, a section `0`, and the **locally-Weierstrass** structure (conventions) — together with
  the **commutative group-scheme structure** with identity `0`, built by descent from the
  chart-level Weierstrass addition (the provenance's seventeen-file addition-chart chain is
  the constructive evidence), commutativity and associativity included, and its **uniqueness**
  given the identity section. Base change of elliptic curves; the fibrewise-elliptic
  comparison (`LocallyWeierstrass → fibres are elliptic`), and the **converse comparison
  milestone** (genus-`1`-with-section ⟹ locally Weierstrass; the coherent-cohomology
  argument, KM 2.1.1/DR II.1.1) — stated here, consumed nowhere on the critical path.

### Layer 2: isogenies, torsion, quotients, and the Weil pairing (KM Ch. 1–2)

- **Multiplication by `N`.** `[N] : E ⟶ E` is a **finite locally free homomorphism of rank
  `N²`** (KM 2.3.1) — flatness by the fibrewise criterion, the rank by the division-polynomial
  fibre count — and `E[N] := ker [N]` is a finite locally free commutative group scheme of
  rank `N²`, compatible with base change; étale over `S[1/N]`, with fibrewise structure
  `(ℤ/N)²` on geometric fibres away from the residue characteristics.
- **Isogenies, degree, dual.** Rigidity (a pointed morphism of elliptic curves over a base is
  a homomorphism — over locally noetherian `S`, then in general by spreading out); the
  hom-group structure on `Hom_S(E, E′)` and the ring `End_S(E)`; isogenies as finite locally
  free surjective homomorphisms with `deg` the rank; the **trace** and the **Abel-free dual**
  `φ̂ := [tr φ] − φ` with `φ̂ ∘ φ = [deg φ] = φ ∘ φ̂` and multiplicativity of `deg`
  (KM 2.6–2.7; the provenance's `EndomorphismDegree.lean` carries the statements with its two
  hard `sorry`s exactly here).
- **Quotients by finite subgroups.** For `C ⊆ E` a finite locally free subgroup scheme:
  `E/C` as an elliptic curve over `S` with `E ⟶ E/C` an isogeny of degree `= rank C`
  (Hopf-invariants on charts + descent; sorry-free construction at the pin), and the standard
  factorization of isogenies through their kernels (KM 2.8-adjacent theory). This is the
  geometric substrate of `[Γ₀(N)]`.
- **The Weil pairing.** `e_N : E[N] ×_S E[N] ⟶ μ_N` (KM 2.8), bilinear, alternating,
  functorial in `S`, with the normalisation **pinned by comparison with the field-level
  pairing** of the elliptic-curves roadmap on fibres (the two-normalisations ambiguity is
  resolved by fiat, once, here); Galois equivariance and étale descent. Its determinant role
  in `[Γ(N)]` (Layer 3) is the consumer.
- **The function-field comparison contract** (conventions): over a field, the equivalence
  between scheme isogenies and the elliptic-curves roadmap's function-field `Isogeny`,
  matching `deg`, separability, `[N]`, Frobenius, and the induced maps on points through the
  Layer-1 dictionary. Discharging it certifies the two roadmaps as two views of one theory.

### Layer 3: Drinfeld level structures (KM Ch. 1, 3)

Over an **arbitrary** base — this layer is the reason KM works at all primes.

- **Full sets of sections** (KM 1.3.5–1.3.7, 1.6.2): for `Z ⟶ S` finite locally free of rank
  `N` and sections `s₁, …, s_N`, the predicate "the `sᵢ` form a full set of sections"
  (equality of the associated Cartier divisor with `Z`, tested through norms of functions),
  its fppf-local nature, and its representability by a **closed subscheme** of the ambient
  Hom-scheme (KM 1.6.1–1.6.2 — the affine-model form; the provenance's
  `fullLevel_divisor_iff_naive_gen` bridge is the two-register dictionary).
- **Exact order `N`** (KM 1.4): a section `P : S ⟶ E` has exact order `N` when the Cartier
  divisor `Σ_{a ∈ ℤ/N} [aP]` is a subgroup scheme of rank `N` — with the **exact-order locus**
  as a closed subscheme of `E[N]` (the provenance's `exists_exactOrderLocus`), and the
  Deligne–Oort order theory needed for its group-scheme clause.
- **Cyclic subgroups** (KM 1.4.1, 6.1): finite locally free rank-`N` subgroup schemes
  `C ⊆ E[N]` that are fppf-locally generated by a point of exact order `N`; standard cyclic
  facts (KM Ch. 6's generator/quotient calculus, `⟨P⟩`-notation, behaviour under isogeny) at
  the depth Layer 7's `[Γ₀(N)]` clause needs.
- **The three structures.** `[Γ(N)]`-structures: pairs `P, Q` whose `N²` combinations
  `aP + bQ` are a full set of sections of `E[N]` (KM 3.1); `[Γ₁(N)]`-structures: points of
  exact order `N` (KM 3.2); `[Γ₀(N)]`-structures: cyclic subgroups of rank `N` (KM 3.4);
  base-change functoriality of all three.
- **Naive ⟺ Drinfeld over `ℤ[1/N]`** (KM 1.4.4, 3.7; Loeffler Fact 3.8.1): when `N` is
  invertible on `S`, exact order `N` ⟺ fibrewise order `N`, full sets ⟺ fibrewise generation,
  and the Drinfeld problems restrict to the naive ones — the theorems that let Layer 5 work
  étale-locally with naive data.

### Layer 4: the moduli formalism (KM Ch. 4)

- **The category `Ell/R`** (KM 4.1–4.3; Loeffler Def 3.7.1): objects elliptic curves `E/S`
  over variable `R`-schemes, morphisms cartesian squares; **moduli problems** as contravariant
  functors `𝒫 : (Ell/R)ᵒᵖ → Set`; representable and **relatively representable** problems
  (for each `E/S`, the functor `T ↦ 𝒫(E_T/T)` on `Sch/S` is representable); properties of the
  relative representing objects (finite, étale, affine over `Ell`) and their inheritance.
- **Rigidity and the representability theorem** (KM 4.6–4.7; Loeffler Thm 3.7.4): `𝒫` is
  rigid when automorphisms of `E/S` act without fixed points on `𝒫(E/S)`; the KM scholium
  4.7.0: a relatively representable, **rigid**, affine moduli problem is representable, with
  the representing scheme constructed by descent along a rigidifier — no algebraic spaces.
  The engine consumes:
- **The Weierstrass atlas and rigidifier torsors.** `Ell/R` presented by the affine
  Weierstrass parameter scheme `Spec R[a₁, …, a₆][Δ⁻¹]` with the variable-change group action
  (sorry-free at the pin), and the three explicit **rigidifiers** with their universal
  families and torsor properties: the Legendre curve (`char ≠ 2`), the level-`3` (Hesse) and
  level-`4` families — the concrete descent covers along which 4.7.0 builds `M(𝒫)`.

### Layer 5: representability over `ℤ[1/N]` — Tate normal form, `Y₁(N)`, `Y(N)` (KM Ch. 3–4; Loeffler §§3.3–3.4, 3.8)

The elementary spine, provable against Mathlib's Weierstrass API, then the naive modular
curves. Base `ℤ[1/N]`, naive register (Layer 3's equivalences bridge back).

- **Tate normal form** (Loeffler Prop 3.3.4): an elliptic `W/R` with a point nowhere of order
  `≤ 3` has a unique variable change to `Y² + αXY + βY = X³ + βX²` with the point at
  `(0, 0)`; the nowhere-small-order condition expressed through division polynomials.
- **The universal Tate curve** (Loeffler Cor 3.3.5): `Spec ℤ[A, B][Δ⁻¹]` represents pairs
  `(E, P)` with `P` nowhere of order `≤ 3` — the first honest fine moduli space of the
  roadmap, and the engine of everything `Γ₁`.
- **`Y₁(N)`, `N ≥ 4`** (Loeffler Def 3.3.6, Thm 3.4.4): the naive `[Γ₁(N)]`-problem over
  `ℤ[1/N]` is rigid and representable by a scheme `Y₁(N)`, **smooth and affine over
  `ℤ[1/N]`**, cut out of the universal Tate curve's base by the division-polynomial
  conditions — the provenance's completed, axiom-clean headline (`gammaOneNaive_representable`),
  to be migrated, decomposed, and consumed. Étaleness of the forgetful cover
  `Y₁(N) ⟶ Ell` clause included.
- **`Y(N)`, `N ≥ 3`** (KM 3.1, 4.7; Loeffler §3.8): rigidity of naive `[Γ(N)]` for `N ≥ 3`
  (KM 4.6.2-shape, through the Weil pairing's determinant constraint), representability via
  the Layer-4 engine over the rigidifier torsors, `Y(N)` smooth affine over `ℤ[1/N]`; the
  `GL₂(ℤ/N)`-action on `Y(N)`. Geometric connectedness of `Y(N) ⊗ ℚ(ζ_N)` is **stated** as a
  flagged milestone (KM's Ch. 4 argument via the `ζ_N`-component decomposition), not assumed
  elsewhere.

### Layer 6: Drinfeld representability over `ℤ`, `Γ_H`, and coarse spaces (KM 3.6, Ch. 7; Loeffler §3.6, 3.8)

- **Relative representability of the Drinfeld problems** (KM 3.6.0): `[Γ₁(N)]` is affine over
  `Ell` — the exact-order locus of Layer 3 as the relative representing object (the
  provenance's `DrinfeldRepresentability` assembly) — and likewise `[Γ(N)]` (full-level
  locus) and `[Γ₀(N)]` (the cyclic-subgroup functor, via the `N`-isogeny space). Over `ℤ`,
  with no invertibility.
- **`[Γ_H]`-problems** (KM 7.1): for `H ≤ GL₂(ℤ/N)` (and the `Γ_H ⊆ (ℤ/N)ˣ`-quotient
  variants), the intermediate problems between `[Γ(N)]` and the classical ones, their
  relative representability (KM 7.1.3), and `Y₁(N)`, `Y₀(N)` as instances — the uniform
  framework the provenance's `GammaH` stream follows.
- **Quotient problems and coarse spaces** (KM 4.7 + Ch. 8 statements; Loeffler §3.6, §3.8
  Remark 1): for non-rigid problems — level `1`, `N ≤ 2`, `[Γ₀(N)]` — the **coarse moduli
  scheme** as the finite-group quotient `M(𝒫, [Γ(ℓ)])/GL₂(ℤ/ℓ)` (simultaneous-rigidification
  trick, `ℓ` an auxiliary prime), with its universal property (initial among maps to schemes)
  and its field-point description (bijective on algebraically-closed points). Deliverables:
  the **`j`-line** `Y(1) = 𝔸¹_j = Spec ℤ[j]` and **`Y₀(N)`**, coarse over `ℤ[1/N]`. ⚠ The
  coarse statements whose KM-route proofs live in Ch. 8 are sourced from the companion notes
  (conventions' sourcing flag); their proofs here go through the quotient construction, not
  through memory of KM Ch. 8.

### Layer 7: the First Main Theorem — regularity (KM Ch. 5–6)

The summit, and KM's *raison d'être*: good moduli at **all** primes.

- **The statement** (KM 5.1.1, verbatim shape): each of `[Γ(N)]`, `[Γ₁(N)]`,
  `[bal. Γ₁(N)]`, `[Γ₀(N)]` is relatively representable and finite flat of constant positive
  rank over `Ell/ℤ`; each is **regular of dimension two**; each becomes finite étale over
  `Ell/ℤ[1/N]`. (The balanced problem `[bal. Γ₁(N)]` enters here, as KM's theorem lists it;
  its definition rides Layer 3's machinery.)
- **The route, staged by what it needs.** The étale-over-`ℤ[1/N]` and finite-flat clauses
  ride Layers 3–6. The **regularity** clause is gated on vocabulary this roadmap must build
  in order: the crossings/congruence structure of the bad fibres (KM 5.1's reduction to the
  `p`-divisible level), **universal formal deformations** of elliptic curves (the
  two-variable deformation ring, KM 5.3-shape substrate), and the **Serre–Tate/Drinfeld
  homogeneity argument** at supersingular points (KM 5.4–6.5-shape) — the provenance's
  KM-INTEGRAL stream stages exactly these waves, with the deformation-theoretic and
  `p`-divisible-group vocabulary marked as its open API gaps. The layer is stated against
  that vocabulary as it lands; its early waves (transport of regularity along the Drinfeld
  loci away from the supersingular points, KM 5.2-shape, and the `ℤ[1/N]` clauses) are
  actionable now.

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **The projective model and its points.** `projModel W` is proper and (for elliptic `W`)
  smooth of relative dimension `1` over the base, and its `K`-sections are exactly
  `W.toAffine.Point` (`projModel`, `isProper_projModelOver`, `projModelPointsEquiv`) — the
  seeded Layer-1 gateway.
- **`E[N]` has rank `N²`** — `[N]` is finite locally free of rank `N²`, étale exactly away
  from `N` (KM 2.3.1), checked on the points dictionary over a field against the
  elliptic-curves roadmap's `#E[N] = N²`.
- **Tate normal form:** the unique change of variables carrying an order-`> 3` point to
  `(0, 0)` on `Y² + αXY + βY = X³ + βX²`, and `Spec ℤ[A, B][Δ⁻¹]` as the universal curve
  with such a point.
- **`Y₁(5)` exists:** the naive `[Γ₁(5)]`-problem over `ℤ[1/5]` is representable by a smooth
  affine curve (the `N = 5` instance of the `Y₁(N)` theorem, computable in Tate-normal
  coordinates).
- **The `j`-line is coarse, not fine:** `Y(1) = Spec ℤ[j]` with its coarse universal
  property, and the two `j = 0`, `j = 1728` automorphism obstructions witnessing that level
  `1` is not rigid, hence not representable.
- **A Drinfeld structure where naive fails:** over `𝔽_p`, the point `0` of a supersingular
  `E` is a Drinfeld `[Γ₁(p)]`-structure (`p · [0] = E[p]` as Cartier divisors) though `E(𝔽̄_p)`
  has no point of naive order `p` — the example that forces Drinfeld's definition.
- **The comparison contract discharged over `ℚ`:** scheme isogenies `E ⟶ E′` over a field
  biject with the elliptic-curves roadmap's function-field isogenies, matching degree and
  `[N]` — one theory, two roadmaps.

## Ordering

Layer 0 (Cartier divisors, group-scheme substrate, quotients, finite étale, descent) unblocks
everything and can proceed in parallel strands. Layer 1 (the curve and its group law) needs
Layer 0's descent only for the group-law gluing; its seeded entry points need nothing. Layer 2
(isogenies, `E[N]`, quotients, Weil pairing) builds on Layers 0–1. Layer 3 (Drinfeld
structures) consumes Layers 0 and 2. Layer 4 (the formalism) consumes Layer 1 and the
Weierstrass atlas; its rigidifiers consume Layer 3's naive registers. Layer 5 (`Y₁(N)`,
`Y(N)` over `ℤ[1/N]`) consumes Layers 3–4 in naive register and is the first modular-curve
payoff. Layer 6 (Drinfeld representability, `Γ_H`, coarse spaces) consumes Layers 3–5. Layer
7 (regularity) consumes everything and is gated on its own deformation-theoretic vocabulary;
its `ℤ[1/N]` clauses land with Layer 6. The elliptic-curves roadmap is a sibling, not a
dependency: only the Layer-2 comparison contract touches it, and in the direction stated
here.

## References

- N. M. Katz, B. Mazur, *Arithmetic Moduli of Elliptic Curves*, Annals of Mathematics
  Studies 108 (Princeton, 1985) — **KM**, the primary source and coordinate system: Ch. 1
  (full sets of sections, Drinfeld structures), Ch. 2 (elliptic curves, isogenies, Weil
  pairing), Ch. 3 (the four problems), Ch. 4 (`Ell/R`, rigidity, representability), Ch. 5–6
  (the First Main Theorem, cyclicity), Ch. 7 (`Γ_H`).
- D. Loeffler, *Modular Curves* (graduate lecture notes) — the companion spine for the
  readable statements (§3.3 Tate normal form and the universal Tate curve, §3.4 `Y₁(N)`,
  §3.6 coarse spaces, §3.7 the moduli formalism, §3.8 `Y(N)` and `Y_{P_H}`); quoted verbatim
  throughout the provenance.
- P. Deligne, M. Rapoport, *Les schémas de modules de courbes elliptiques*, in *Modular
  Functions of One Variable II*, LNM 349 (Springer, 1973) — the geometric definition (II.1.1)
  and the classical moduli theory this roadmap's out-of-scope compactifications belong to.
- V. G. Drinfeld, *Elliptic modules*, Mat. Sbornik 94 (1974) — the origin of Drinfeld level
  structures.
- B. Conrad, *Arithmetic moduli of generalized elliptic curves*, J. Inst. Math. Jussieu 6
  (2007) — background for the excluded compactified theory (successor roadmap).
- Mathlib in flight: [#25983](https://github.com/leanprover-community/mathlib4/pull/25983)
  (affine scheme of an elliptic curve), [#35151](https://github.com/leanprover-community/mathlib4/pull/35151)
  (group-scheme structure on a Weierstrass curve) — Layers 1–2 coordinate with both
  (conventions).

## Provenance (existing Lean work to migrate into Tau Ceti)

The milestones are specified above intrinsically; this section maps them to Lean work that
already discharges parts of them, as material to migrate and complete — never as the
specification.

**Pinned sources.** All claims below were audited at, and only hold for, these revisions of
**AINTLIB** (`github.com/CBirkbeck/AINTLIB`; public, currently **no license file** — the
repository belongs to this roadmap's author, and Apache-2.0 licensing of the migrated
material is part of the migration contract):

- **`main @ 911a2eca9a04`** — the consolidated **`Y₁(N)` chain**: 20 files, ≈21,000 lines,
  ≈935 declarations, with the headline `gammaOneNaive_representable`
  (`ModularCurve/YOneTatePoint.lean`) **axiom-clean** (`{propext, Classical.choice,
  Quot.sound}` per the in-repo audit of 2026-07-12) and 16 recorded `sorry` carriers in its
  supporting files (inventoried file-by-file in the repository's own consolidation
  documents). This is Layer 5's `Y₁(N)` milestone, essentially done: the migration work is
  decomposition to TauCeti CI standards (several 200–300-line proofs, one 5,900-line atlas
  file), not mathematics.
- **`dev/modular-curves @ 55feda6a301d`** (2026-07-22) — the active KM program: 309 Lean
  files, 247 file-level `sorry` occurrences by grep. Per directory (files/`sorry`s):
  `EllipticCurve` 66/26, `ForMathlib` 129/41, `GroupScheme` 33/36, `LevelStructure` 10/20,
  `Moduli` 50/70, `ModularCurve` 5/39, `Picard` 9/4, `WeilPairing` 4/11.

Layer map at the `dev` pin (headline files; `sorry` counts in parentheses):

- **Layer 0.** `ForMathlib/` — relative-Cartier, quotient, torsor, Hopf–Galois
  (`HopfGaloisTheorem.lean` (0), `SchemeQuotient.lean` (0)), finite-étale, descent,
  Fitting-ideal, and `Proj` material, including staged mathlib PR drafts
  (`.mathlib-quality/pr-drafts/`). Migrate item-by-item against Layer 0's targets, checking
  each against current Mathlib first (the pin predates several upstream landings).
- **Layer 1.** The `EllipticCurve/` chart chain: `Basic.lean` (the two-record
  `EllipticCurveGeom`/`EllipticCurve` design with `LocallyWeierstrass` — the conventions
  follow it), the seventeen `AdditionChart*` files and `GroupLawConstruction`/
  `GroupLawDescent`/`GroupLaw.lean` (2)/`GroupLawAxioms.lean` (0), `PointsDictionary.lean`
  (0), `Comparison*.lean`, `ModelVariableChange.lean`, `InvariantDifferential.lean` (0).
- **Layer 2.** `MulByHom*.lean` (`[N]` finite locally free, fibres, flatness),
  `EndomorphismDegree.lean` (9 — including the two hard dual/multiplicativity `sorry`s the
  elliptic-curves roadmap's provenance already flags), `Rigidity.lean` (1)/
  `RigiditySpreadingOut.lean`, `GroupScheme/SubgroupQuotient*.lean` (0 at the core),
  `GroupScheme/MuN.lean` (0), `GroupScheme/NIsogeny.lean` (25 — the `[Γ₀]` substrate is
  genuinely open), `WeilPairing/` (11 across 4 files; normalisation pinned against the
  field-level pairing, as Layer 2 specifies).
- **Layer 3.** `LevelStructure/`: `CartierDivisor.lean` (4), `Basic.lean` (3 — the
  naive⟺Drinfeld and fppf bridges are the open pieces), `ExactOrder*.lean`,
  `FullLevelBridge`/`FullLevelDictionary`, `Incidence.lean`, `IsoTransport.lean`;
  `GroupScheme/CyclicSubgroup.lean`, `DeligneOrder.lean`.
- **Layer 4.** `Moduli/EllCategory.lean` (2), `Moduli/Stack.lean`/`MellWStack.lean` (the
  stacks-without-stacks remark, kept a remark), `Moduli/WeierstrassAtlas.lean` (0), the
  rigidifier torsors `Legendre*`/`LevelThreeTorsor`/`LevelFourTorsor`/`Universal*`,
  `Moduli/Representability.lean` (the 4.7.0 engine).
- **Layers 5–6.** The `main`-branch `Y₁(N)` chain (above); `Moduli/DrinfeldRepresentability.lean`,
  `GammaH*.lean`, `QuotientProblem`/`QuotientRepresentability`, `Moduli/Coarse.lean` (3),
  `ModularCurve/YRho.lean`/`YFullRoute.lean`/`YOneAssembly.lean` (the `Y(N)`-side assembly,
  open at the pin).
- **Layer 7.** `Moduli/DrinfeldRegularity.lean` — the KM-INTEGRAL skeleton: its early waves
  (W0–W3) are stated, and its deformation-theoretic waves are explicitly recorded as API
  gaps; Layer 7's gating paragraph mirrors that assessment. The regularity theorem itself
  exists nowhere and is the roadmap's summit.

Migration cautions. The audit method is file-level `grep`-counting of `sorry` at the pinned
revisions (over-counts comments; sees no cross-file dependence): every "sorry-free" and
"axiom-clean" claim above must be re-established by `#print axioms` on the actual capstones
in TauCeti CI at migration time. The `dev` branch moves daily; re-pin before migrating. The
`Y₁(N)` chain's own consolidation documents (in-repo, `.mathlib-quality/overview/y1/`) list
its 16 `sorry` carriers, dead code, and decomposition seams file-by-file — follow them. The
KM text itself is the standard for every KM-numbered claim; statements the provenance sourced
from the companion notes are so marked there and here (conventions).
