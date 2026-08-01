# Roadmap: modular curves, following Katz–Mazur

This roadmap formalises the moduli of elliptic curves with level structure, following N. Katz
and B. Mazur, *Arithmetic Moduli of Elliptic Curves* (Annals of Mathematics Studies 108,
1985 — **KM**, whose result numbering is the shared coordinate system), with D. Loeffler's
*Modular Curves* lecture notes as the companion for readable statements. We first construct
elliptic curves as group schemes over an arbitrary base, together with finite subgroup
schemes, isogenies, quotients, and the Weil pairing. We then define Drinfeld `[Γ(N)]`-,
`[Γ₁(N)]`-, balanced `[Γ₁(N)]`-, and `[Γ₀(N)]`-structures and prove their relative
representability. Over `ℤ[1/N]` the rigid problems give fine modular curves such as `Y₁(N)`
and the fixed-pairing full-level curve `Y(N, ζ_N)`; non-rigid problems, including `Y(1)` and
`Y₀(N)`, are treated through coarse moduli schemes; the twisted curve `Y(ρ)` consumed by the
FLT project's `3`–`5` switch is built on the same machinery. The final part develops the
deformation theory needed for KM's First Main Theorem 5.1.1: integral finite flatness and
regularity of the four basic level problems.

This roadmap owns the scheme-theoretic elliptic-curve layer. The elliptic-curves roadmap
([`TauCetiRoadmap/EllipticCurves/`](../EllipticCurves/README.md)) develops its arithmetic on
the Weierstrass equation and its function field, with no schemes; Layers 1–2 here build the
elliptic curve over an arbitrary base with its group law, isogenies, degree, and dual — KM's
Chapter 2 — and carry the comparison contract between the two theories. (PR 68 is open, so
the relative link resolves only once that roadmap merges; the comparison interface is
therefore also stated self-containedly in Layer 2.)

**Not included**: compactified modular curves `X(N)`, `X₁(N)`, `X₀(N)` (cusps, the Tate curve
over `ℤ((q))`, KM Ch. 8's normalization — a successor roadmap); Igusa curves and KM
Chs. 12–14; generalized elliptic curves à la Deligne–Rapoport; any theory of algebraic stacks
or algebraic spaces; modular forms, Hecke operators, and Eichler–Shimura; Néron models;
complex uniformisation; Riemann–Roch and coherent cohomology of curves. Two milestones of
earlier drafts rested on unnamed future interfaces and are moved out accordingly: the
genus-`1`-with-section ⟹ locally-Weierstrass converse (needs Riemann–Roch; successor
roadmap, together with the invertible-ideal-sheaf comparison it pairs with), and geometric
irreducibility of the modular curves (its classical input is connectedness of the complex
fibre; it returns when a complex-analytic or KM-Ch.-10 supplier exists, and then for the
fixed-pairing component — see Layer 5).

Parts of this development already exist in AINTLIB, and two related elliptic-curve APIs are
under review in Mathlib. The provenance section records their exact status in a table. The
definitions and theorems of this roadmap are independent of those implementations.

Suggested home: `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/` for Layers 1–2,
`TauCeti/AlgebraicGeometry/ModularCurve/` for Layers 3–7, Layer-0 material where Mathlib
would put it.

## Standing conventions

- **The elliptic curve of record.** Two records, as in the existing development:
  `EllipticCurveGeom S` is a morphism `π : E ⟶ S`, smooth and proper of relative dimension
  `1`, with a section `0 : S ⟶ E`, satisfying the **property** of being Zariski-locally on
  `S` the projective model of an elliptic `WeierstrassCurve` — local existence, a
  proposition, not a chosen atlas that enters equality of curves. `EllipticCurve S` is an
  `EllipticCurveGeom S` equipped with its commutative group structure, which is
  **constructed once** from the chart-level Weierstrass addition and exposed canonically; any
  two group structures with the same identity agree (rigidity), so a uniqueness/
  `Subsingleton` theorem makes the data canonical. Genus does not appear in the definition
  (Mathlib has no genus).
- **Group schemes are group objects** in the cartesian monoidal `Over S` (Mathlib's
  `Grp_`/`CommGrp_`). Coordinate with mathlib
  [#25983](https://github.com/leanprover-community/mathlib4/pull/25983) (affine scheme of an
  elliptic curve) and [#35151](https://github.com/leanprover-community/mathlib4/pull/35151)
  (group-scheme structure on a Weierstrass curve); upstream wins at migration.
- **Stacks without stacks.** KM's formalism — the category `Ell/R`, moduli problems as
  contravariant functors, relative representability — is adopted exactly; no algebraic
  stacks or spaces are built or assumed. Where the moduli stack would be quoted, the roadmap
  uses KM's substitutes: the Weierstrass parameter scheme with its variable-change action
  (with the presentation theorem of Layer 4 making "presents `Ell/R`" precise), and
  rigidifier torsors.
- **Drinfeld structures are the definition of record**; naive structures (fibrewise
  generators) are separate predicates with equivalence theorems when `N` is invertible
  (KM 1.4.4, 3.7). No moduli problem over `ℤ` is stated in naive form, and no milestone
  inverts `N` unless its layer's base does.
- **Degrees are locally constant ranks.** An isogeny is a finite locally free surjective
  homomorphism; over a disconnected base its rank is a locally constant function, not one
  integer. `IsogenyOfDegree n` names the constant-rank case; single-integer degree
  statements assume constant degree or a (pre)connected base, and identities involving
  `[deg φ]` carry that hypothesis or are stated componentwise. `[N]` requires `[NeZero N]`
  wherever finiteness is asserted: `[0]` is not a finite isogeny.
- **KM's numbering is the coordinate system**; Loeffler's §§ are cited in parallel.
  Statements sourced from the companion notes rather than KM's own text are flagged where
  they occur.
- **Base discipline.** The moduli theory is developed over `ℤ`; `ℤ[1/N]` enters only where
  étaleness or naive structures need it, and each layer's base is stated in its header.

## What Mathlib already has (consume)

- **Schemes and morphisms**: `Scheme`, `Spec`/`Proj`, fibre products, `Over`, and the
  morphism-property library (étale, smooth with relative dimension, proper, finite, flat
  with rank, immersions, quasi-finite, separated, descent).
- **Ideal sheaves** (`Mathlib/AlgebraicGeometry/IdealSheaf/`, `Scheme.Hom.ker`) — the
  substrate for closed loci.
- **Group objects**: `Grp_ C`/`CommGrp_ C` with the cartesian monoidal machinery.
- **The Weierstrass theory**: all of `Mathlib/AlgebraicGeometry/EllipticCurve/` — the model,
  invariants, `VariableChange`, base change, the group law on points, division polynomials,
  `IsElliptic`. Layers 1–2 wrap this into the scheme and never re-derive it.
- **Commutative algebra**: finite/flat/étale ring maps, `Module.finrank`, Hopf algebras and
  `MonoidAlgebra`, invariant subrings, local criteria of flatness.
- **Regular local rings** (`Mathlib/RingTheory/RegularLocalRing/`-side API) — the algebraic
  half of Layer 4's regularity definition; the scheme-level property is built here.
- **Category theory**: (co)limits in `Scheme`, representable functors, `Over`-categories,
  `Scheme.GlueData`.

## The build, in layers

### Layer 0: scheme-theoretic prerequisites (what KM silently assume)

The algebraic geometry Mathlib does not yet have, each item built at Mathlib generality.

**Definitions and constructions.**

- **Effective Cartier divisors, the standard definition first.** An effective Cartier divisor
  on `X` is a closed subscheme whose ideal is locally generated by a nonzerodivisor; a
  **relative** effective Cartier divisor on `C/S` adds flatness over `S` (KM 1.1.1). The
  **theorem**, not the definition: on a smooth relative curve, with the appropriate
  properness/finiteness hypotheses, such a divisor is finite locally free over `S`
  (KM 1.2.3), and the finite-flat package used by Drinfeld structures (divisor of a section,
  sums `Σᵢ [Pᵢ]`, fibrewise degree, base change, flat pullback) is derived from it. This
  order avoids introducing a bespoke working notion and replacing it later; sums, pullbacks,
  and divisor equality are then transparent. Scope: general-ambient Cartier theory beyond
  relative curves, `A`-structures for general finite abelian `A`, and KM §§1.11, 1.13 are
  not treated; §1.10 contributes the three cyclic facts Layer 3 names.
- **Finite locally free group schemes, with the constant/diagonalizable distinction
  correct.** Two separate constructions:
  the **constant group scheme** `(ℤ/N)_S` — the disjoint union of one copy of `S` per
  element, coordinate algebra `Map(ℤ/N, R) ≅ ∏ R`, first as a scheme, then as a group
  object; and the **diagonalizable group scheme** `D(M) = Spec R[M]` for a finite abelian
  `M` — the group algebra, so `D(ℤ/N) ≅ μ_N`. (The group algebra belongs to `μ_N`, not to
  the constant group scheme.) Then kernels of homomorphisms, the order/rank calculus, and
  **Cartier duality** for finite locally free commutative group schemes, proved on these
  examples: `(ℤ/N)ᵛ ≅ μ_N` and `μ_Nᵛ ≅ (ℤ/N)`. Duality feeds the Weil pairing, the balanced
  problem, the finite étale dictionary, and `V_ρ`.
- **Quotients, three separate results with their own hypotheses.** (i) The affine quotient:
  a finite group acting on `Spec A` has quotient `Spec A^G`, with its universal property.
  (ii) The free-action quotient: scheme representability of the quotient by a free finite
  group action **under a stated hypothesis** — an invariant affine cover, or
  quasi-projectivity — since the general fppf quotient is only an algebraic space.
  (iii) The elliptic-curve quotient: for a finite locally free subgroup `C ⊆ E`, the special
  projective situation constructs `E/C`, its group structure, the quotient isogeny, base
  change, and the categorical property (the existing Hopf–Galois route; it is this special
  construction, not a general free-action theorem). Torsors under finite flat group schemes.
- **The finite étale dictionary, decomposed.** Finite étale covers, sections and fibre
  counts, cancellation, descent, and — in full, since `V_ρ` needs it — the
  Grothendieck–Galois equivalence over a field, as eight named pieces: the category of
  finite continuous `G_K`-sets; the geometric-points functor from finite étale
  `K`-schemes; the construction of a finite étale scheme from a finite continuous
  `G_K`-set; the equivalence and its naturality; compatibility with products; transport of
  group objects and homomorphisms; the commutative-group version; and descent of alternating
  pairings.
- **Descent, as a named theorem block.** Effective faithfully flat descent for: affine and
  projective schemes; finite locally free schemes; closed subschemes and ideal sheaves;
  sections; group objects; homomorphisms; elliptic curves with their zero sections; level
  structures; finite group actions and torsors. (In KM 4.7.0 the universal elliptic curve
  itself descends, not merely a morphism between descended schemes.) Spreading out over
  noetherian bases where KM's arguments need it.

**Dependencies.** Mathlib only.

**Status.** The existing `ForMathlib/` directory (~130 files, with staged upstream PR
drafts) covers much of this; each item is checked against current Mathlib before migration.

### Layer 1: elliptic curves over a base scheme (KM 2.1; DR II.1)

**Definitions.** `projModel W` — the `Proj` of the homogenised Weierstrass cubic of
`W : WeierstrassCurve R` — with its structure morphism, zero section, properness, smoothness
of relative dimension `1` when `W.IsElliptic`, and compatibility with base change and
`VariableChange`. The two-record `EllipticCurveGeom S` / `EllipticCurve S` of the
conventions, with the group structure constructed by descent from chart-level Weierstrass
addition and the rigidity/uniqueness theorem.

**The points dictionary, at the correct generality.** `K`-sections of
`projModel W ⟶ Spec K` biject (then group-isomorph) with `W.toAffine.Point`. Over a general
base `T`, a morphism `T → ℙ²` is a line bundle with three generating sections, so the
dictionary is stated in stages: field points; points over local rings (line bundle trivial);
points over rings with trivial Picard group; and arbitrary `T`-points via line-bundle-valued
homogeneous coordinates and Zariski descent. No claim that a general `T`-point is one
global unimodular triple.

**Dependencies.** Layer 0's descent (for the group-law gluing); Mathlib's Weierstrass API.

**Status.** The seeded entry points (`Suggested.lean`) are statable today; the group-law
chart chain exists in provenance; both in-flight Mathlib PRs overlap here.

### Layer 2: isogenies, torsion, quotients, and the Weil pairing (KM Ch. 1–2)

**Definitions and main theorems.**

- **Multiplication by `N`** (`[NeZero N]`): `[N] : E ⟶ E` is finite locally free of rank
  `N²` (KM 2.3.1) — flatness by the fibrewise criterion; the rank by **scheme-theoretic
  fibre length** (finite-flat rank, multiplicities of division-polynomial roots included),
  not by counting geometric points. `E[N] := ker [N]` is finite locally free of rank `N²`,
  base-change compatible, étale over `S[1/N]`. The **point count is a separate corollary**:
  when `N` is invertible in the residue fields, geometric fibres are `(ℤ/N)²`; in residue
  characteristic `p ∣ N` the group scheme is nonreduced and has fewer points — a
  supersingular curve has `E[p](k̄) = 0` while `E[p]` has rank `p²`.
- **Rigidity and the endomorphism ring.** A pointed morphism of elliptic curves over a base
  is a homomorphism (locally noetherian `S`, then spreading out); `Hom_S(E, E′)` and
  `End_S(E)`. Degree on `End_S(E)` is a locally constant function on `S`; single-integer
  statements assume a connected base (the conventions' discipline).
- **The dual isogeny, constructed in the correct order.** Let `φ : E → E′` be an isogeny of
  constant degree `n`. Construct `E/ker φ`; identify the induced map `E/ker φ → E′` as an
  isomorphism; prove `ker φ` is killed by `n`; factor `[n] : E → E` through the quotient to
  obtain `φ̂ : E′ → E`; prove `φ̂ ∘ φ = [n]_E` and `φ ∘ φ̂ = [n]_{E′}`, and
  `deg φ̂ = deg φ`, `deg` multiplicative. **Afterwards**, for an endomorphism
  `α ∈ End_S(E)`, define the trace and prove the reflection formula
  `α̂ = [tr α] − α` (KM 2.6.2.2) — an endomorphism theorem, not the definition of the
  general dual, which for `φ : E → E′` has the opposite direction and no trace.
- **Quotients by finite subgroups.** For `C ⊆ E` finite locally free: `E/C` as an elliptic
  curve with `E ⟶ E/C` an isogeny of degree the rank of `C` (Layer 0's elliptic-curve
  quotient), and the factorisation of isogenies through their kernels — the substrate of
  `[Γ₀(N)]` and of the dual above.
- **The Weil pairing, actually constructed.** The route, over an arbitrary base:
  (i) Cartier duality for finite locally free commutative group schemes (Layer 0);
  (ii) the self-duality `E[N] ≅ E[N]ᵛ` — from the canonical principal polarization or an
  equivalent explicit construction, named as its own milestone since the roadmap avoids
  `Pic⁰`; (iii) the evaluation pairing `E[N] × E[N]ᵛ ⟶ 𝔾_m`; (iv) the proof that the image
  lies in `μ_N`; (v) bilinearity, alternation, perfection, and base-change compatibility;
  (vi) compatibility with isogenies and duals; (vii) **last**, the comparison with the
  field-level pairing of the elliptic-curves roadmap when `N` is invertible, which pins the
  normalisation. A comparison can fix a convention; it cannot replace the construction,
  especially in residue characteristic dividing `N`.
- **The function-field comparison contract.** Over a field `F`: scheme isogenies of elliptic
  curves correspond to the elliptic-curves roadmap's function-field isogenies — in that
  roadmap's current interface, a contravariant `pullback` of function fields with a
  `MapsInfinity` condition — matching `deg`, separability, `[N]`, Frobenius, and the induced
  point maps. The proof uses the genuine normal-curve dictionary, and the preimage of the
  origin is the whole kernel (`φ⁻¹(O′) = ker φ`, not `{O}`), so the affine charts do **not**
  simply map to each other: pullback of rational functions gives the function-field
  embedding; the integral closure of the target's affine coordinate ring describes functions
  regular away from the fibre over `O′`; the place at infinity identifies `MapsInfinity`; a
  function-field embedding extends to a morphism of proper normal curves by the valuative
  criterion; finiteness (Krull–Akizuki-grade, inseparable case included) and miracle
  flatness (finite surjective between smooth curves ⟹ finite locally free) complete the
  passage into this roadmap's isogeny notion.

**Dependencies.** Layers 0–1; the elliptic-curves roadmap only for the comparison contract.

**Status.** `[N]` finite-locally-free material and the quotient construction exist in
provenance; the general dual isogeny is **new** (the provenance's `endDual` is
endomorphism-only, with its degree identities incomplete); the Weil-pairing construction
beyond the field-comparison normalisation is new.

### Layer 3: Drinfeld level structures (KM Ch. 1, 3)

Over an arbitrary base.

**Definitions.**

- **Full sets of sections** (KM 1.3.5–1.3.7, 1.8): the norm working form
  (`Norm(f) = ∏ᵢ f(sᵢ)` after every base change, reduced to the universal case by KM 1.8.4;
  characteristic-polynomial variant alongside), fppf-local.
  **Representability by a closed subscheme is its own subproject**, not a wrapper: it needs
  representability of the ambient Hom functor; the universal family of sections; the norm
  or characteristic-polynomial equations; independence of the chosen affine presentation;
  gluing; arbitrary base-change compatibility; and the proof that the closed locus
  represents exactly the full-set predicate.
- **Exact order `N`** (KM 1.4): `P : S ⟶ E` has exact order `N` when
  `Σ_{a ∈ ℤ/N} [aP]` is a subgroup scheme of rank `N`; the exact-order locus as a closed
  subscheme of `E[N]`, with the Deligne–Oort order theory its group-scheme clause needs.
- **Cyclic subgroups** (KM 1.4.1, 6.1): rank-`N` subgroup schemes fppf-locally generated by
  a point of exact order `N`; the three KM §1.10 facts (1.10.2, 1.10.5, 1.10.13).
- **The four structures.** `[Γ(N)]`: pairs `P, Q` whose `N²` combinations are a full set of
  sections of `E[N]` (KM 3.1). `[Γ₁(N)]`: points of exact order `N` (KM 3.2). `[Γ₀(N)]`:
  cyclic subgroups of rank `N` (KM 3.4). **Balanced `[Γ₁(N)]`** (KM 3.3), defined **here**,
  not first mentioned at the final theorem: a `[Γ₀(N)]`-structure `C` together with points
  of exact order `N` generating `C` and its Cartier-dual quotient datum, in KM's exact
  formulation via cyclic subgroups and duality — with base-change functoriality, its naive
  description when `N` is invertible, its relative representing object, and its relation to
  the other three problems. The balanced problem is one of the reasons Cartier duality and
  the quotient theory exist in Layers 0 and 2.
- **Naive ⟺ Drinfeld over `ℤ[1/N]`** (KM 1.4.4, 3.7; Loeffler 3.8.1), the theorems letting
  Layer 5 work étale-locally with naive data.

**Dependencies.** Layers 0 (divisors, duality) and 2 (`E[N]`, quotients).

**Status.** The `LevelStructure/` provenance carries the working forms; the closed-locus
globalisation is identified there as a main missing step; the balanced problem is not yet
scoped anywhere and is new.

### Layer 4: the moduli formalism, and what regularity means (KM Ch. 4–5)

**Definitions.** The category `Ell/R` (objects elliptic curves over variable `R`-schemes,
morphisms cartesian squares); moduli problems as contravariant functors; representable and
relatively representable problems; rigidity (automorphisms act without fixed points).

**The presentation theorem for the Weierstrass parameter scheme.** "The affine scheme
`Spec R[a₁, …, a₆][Δ⁻¹]` with the variable-change action presents `Ell/R`" is made precise
without stacks, as three statements: every elliptic curve is Zariski-locally represented by
a Weierstrass equation; two equations define isomorphic curves exactly through the
variable-change groupoid; and these local descriptions satisfy effective descent — the
action groupoid supplies the descent data the rigidifier construction uses.

**The representability theorem** (KM 4.7.0; Loeffler 3.7.4): a relatively representable,
rigid, affine moduli problem is representable, the representing scheme built by descent
along a rigidifier; the three explicit rigidifiers (Legendre for `char ≠ 2`, level-`3`,
level-`4`) with their universal families and torsor properties.

**Katz–Mazur regularity, defined here.** "Regular of dimension two" is not a statement
about one scheme when the problem is not fine. Following KM: a relatively representable
problem is **regular of dimension `d`** when, for one (equivalently any) representable
étale rigidifying problem adjoined, the scheme representing the simultaneous problem is
regular of dimension `d`; the definition is copied from KM, with the independence-of-
rigidifier lemma. The scheme-level API this needs, built here: regularity of a scheme via
regular local rings; Krull dimension of the local rings; locality of regularity;
preservation and reflection along étale morphisms; invariance under isomorphism; the
completed-local-ring criterion. (Mathlib has the algebraic regular-local-ring layer;
the scheme-level property and local-to-global lemmas are new.) Layer 7's statement is
meaningful only after this definition.

**Dependencies.** Layers 1, 3 (rigidifiers use naive registers).

**Status.** `EllCategory`, the atlas, the rigidifier torsors, and the 4.7.0 engine exist in
provenance; the presentation theorem and the regularity definition are new as named
statements.

### Layer 5: fine curves over `ℤ[1/N]` — Tate normal form, `Y₁(N)`, full level (KM Ch. 3–4; Loeffler §§3.3–3.4, 3.8)

Base `ℤ[1/N]`, naive register.

**Tate normal form, fully specified** (Loeffler 3.3.4): the exact coefficients
`Y² + αXY + βY = X³ + βX²` with its discriminant; the open conditions excluding orders
`1, 2, 3`; the equation imposing `NP = 0`; removal of the loci of proper divisors of `N`;
the universal property of `Spec ℤ[A, B][Δ⁻¹]` (pairs `(E, P)` with `P` nowhere of order
`≤ 3`); rigidity of the resulting problem; finiteness and étaleness over the elliptic-curve
moduli problem; smoothness and affineness of the representing scheme.

**`Y₁(N)`, `N ≥ 4`** (Loeffler 3.3.6, 3.4.4): the naive `[Γ₁(N)]`-problem is rigid and
representable by a smooth affine `Y₁(N)/ℤ[1/N]`, cut out of the universal Tate curve's base
by division-polynomial conditions, with the étale forgetful cover.

**Full level, with the components correct.** The full ordered-basis problem — pairs `(P, Q)`
forming a full set of sections of `E[N]` — is rigid for `N ≥ 3` (KM 2.7.2), relatively
representable by the closed full-level locus in `E[N] ×_S E[N]` (KM 3.7.1), and
representable (KM 4.7.0/Cor 4.7.2) by a smooth affine scheme

- `Y_full(N)` over `ℤ[1/N]`, with its `GL₂(ℤ/N)`-action **and the determinant map**
  `(P, Q) ↦ e_N(P, Q)` to the scheme of primitive `N`-th roots of unity (Layer 2's
  pairing). `Y_full(N)` is **not** geometrically irreducible: after adjoining `ζ_N` it
  splits into components indexed by the primitive values of the pairing, permuted by
  `GL₂` through the determinant.
- The **fixed-pairing component** `Y(N, ζ_N) = {(E, P, Q) : e_N(P, Q) = ζ_N}` over
  `ℤ[1/N, ζ_N]`, with its `SL₂(ℤ/N)`-action. Connectedness/irreducibility statements belong
  to this component, and (per the out-of-scope note) are deferred until a supplier for the
  complex-connectedness input exists.

**The twisted curve `Y(ρ)`** (Buzzard, *Formalizing Fermat*, Lecture 8). Data: `V ≅ (ℤ/N)²`
with a continuous `Gal(ℚ̄/ℚ)`-action and an alternating Galois-equivariant perfect pairing
to `μ_N`. Build: `V_ρ/ℚ` by Layer 0's Grothendieck–Galois dictionary; the moduli problem of
pairs `(E, α)` with `α : E[N] ≅ V_ρ` carrying the Weil pairing to the given pairing — a
symplectic problem, hence a twist of the **fixed-pairing component**, not of `Y_full(N)`;
`yRho_representable` for `N ≥ 3` through the same engine; and the field-points description
(for characteristic-zero `K`, the `K`-points are naturally the pairs
`(E/K, E[N] ≅ ρ|_{G_K})` respecting the pairings) — the statement the FLT `3`–`5` switch
consumes.

**Dependencies.** Layers 3–4; Layer 0's dictionary and Layer 2's pairing for `Y(ρ)`.

**Status.** The `Y₁(N)` chain is the most complete piece of provenance (axiom-clean
headline, migration = decomposition); the full-level headline exists at the dev pin;
`Y(ρ)` is staged; the `Y_full`/fixed-component split is a **correction** new to this
revision.

### Layer 6: Drinfeld representability over `ℤ`, `Γ_H`, and coarse spaces (KM 3.6, Ch. 7)

**Relative representability of the Drinfeld problems** (KM 3.6.0), over `ℤ` with no
invertibility: `[Γ₁(N)]` by the exact-order locus, `[Γ(N)]` by the full-level locus,
`[Γ₀(N)]` by the cyclic-subgroup functor via the `N`-isogeny space, and the balanced
problem by Layer 3's definition.

**`[Γ_H]`-problems, with the conventions fixed** (KM 7.1): `H ≤ GL₂(ℤ/N)` acts on the
**right** on full ordered-basis structures (the convention pinned here once); the action on
`Y_full(N)` restricts to the fixed-pairing component exactly when `det H = 1`, and in
general `det H` acts on the root-of-unity components; the subgroups giving `[Γ₁(N)]`
(semi-Borel `(1 ∗; 0 ∗)`), `[Γ₀(N)]` (Borel), and the diamond-operator quotients
(`Γ_H ⊆ (ℤ/N)ˣ` variants — a different, quotient construction, named separately); relative
representability (KM 7.1.3); when the quotient problem is rigid and fine, and when only
coarse.

**Coarse spaces** (KM 8.1.1, 8.1.5, 7.4.2; Loeffler §3.6, §3.8). For non-rigid problems the
coarse moduli scheme `M(𝒫) = 𝔐(𝒫, δ)/G` along an auxiliary rigidifying `δ`; over a base
with some `N ≥ 3` invertible, `Y_H = Y_full(N)/H` by the invariant-`Spec` quotient. The
Borel contains `−1`, so `[Γ₀(N)]` is not rigid (Loeffler 3.8.3) and `Y₀(N)` is coarse-only;
the semi-Borel with `N ≥ 4` is rigid, recovering `Y₁(N)`.

**The `j`-line, as a real construction**: define the `j`-map on the Weierstrass parameter
scheme; prove invariance under variable changes; show `j` classifies elliptic curves over
algebraically closed fields; prove the coarse universal property (initial among maps to
schemes; bijective on algebraically-closed points); identify the descended coordinate ring
with `ℤ[j]`; record the exceptional automorphism loci `j = 0, 1728`; and record where
coarse formation fails to commute with base change (KM 8.1.7). Similarly `Y₀(N)`: the
acting Borel and side, its effect on the pairing components, and the coarse property.

**Dependencies.** Layers 3–5; Layer 0's quotients.

**Status.** The coarse engine, semi-Borel rigidity, and Borel obstruction exist at the dev
pin; `Γ₀`'s cyclic substrate (`NIsogeny`) is genuinely open; the `Γ_H` convention fixes are
new.

### Layer 7: the First Main Theorem — regularity (KM Ch. 5–6)

**The statement** (KM 5.1.1): each of `[Γ(N)]`, `[Γ₁(N)]`, `[bal. Γ₁(N)]`, `[Γ₀(N)]` is
relatively representable and finite flat of constant positive rank over `Ell/ℤ`; each is
regular of dimension two **in the Layer-4 sense**; each becomes finite étale over
`Ell/ℤ[1/N]`. The étale and finite-flat clauses ride Layers 3–6; the regularity clause is
the deformation-theoretic development below, staged as its own dependency tree.

**7A — formal deformation categories.** Complete local and Artinian local bases with residue
field `k`; deformations of an elliptic curve and their isomorphisms; the deformation
functor; pro-representability and universal deformation rings; compatibility with formal
completion of a (rigidified) moduli scheme.

**7B — formal groups and `p`-divisible groups.** One-dimensional commutative formal groups;
the `p`-series and height; Frobenius and Verschiebung; Barsotti–Tate groups and
connected–étale sequences; `E[p^∞]`; the ordinary and supersingular cases.

**7C — Serre–Tate.** Deforming an elliptic curve is equivalent to deforming its
`p`-divisible group, compatibly with the level structures in play.

**7D — Drinfeld deformation rings.** For each of the four problems at a prime-power level:
the local deformation functor; its universal ring; the ordinary and supersingular cases
separately; the explicit equations; flatness and regularity; the Krull dimension. The
universal deformation ring of a one-dimensional height-`2` formal group over perfect `k` is
`W(k)⟦u⟧` — **one** deformation parameter, Krull dimension two (the formal group law is a
series in two variables `X, Y`; that is a different statement, and the phrase "two-variable
deformation ring" is not used).

**7E — globalisation.** Identify the deformation rings with completed local rings of the
rigidified representing schemes; deduce regularity by the completed-local-ring criterion
(Layer 4's API); reduce general `N` to prime powers; treat `[Γ₀]` separately where KM
Ch. 6's cyclic-subgroup arguments are needed.

**Dependencies.** Everything before it; 7A–7E in order.

**Status.** Only the combinatorial early waves are stated in the provenance skeleton; 7A–7D
are new API throughout. This development is large enough that, if it outgrows this
document, it becomes a successor roadmap; until then, 7A–7E is its dependency tree.

## Worked examples (acceptance criteria)

- `projModel W` is proper and, for elliptic `W`, smooth of relative dimension `1`, with
  `K`-sections exactly `W.toAffine.Point` (seeded).
- `[N]` is finite locally free of rank `N²` (`[NeZero N]`), étale exactly away from `N` —
  rank by fibre length; and, **separately**, the geometric-point count `#E[N](k̄) = N²`
  when `N` is invertible in `k` — with the supersingular case witnessing the difference:
  `E[p](k̄) = 0` while `E[p]` has rank `p²`.
- Tate normal form: the unique variable change carrying a nowhere-order-`≤ 3` point to
  `(0, 0)`, and `Spec ℤ[A, B][Δ⁻¹]` as the universal such pair.
- `Y₁(5)` exists: the naive `[Γ₁(5)]`-problem over `ℤ[1/5]` is representable by a smooth
  affine curve.
- The `j`-line is coarse, not fine: `Y(1) = Spec ℤ[j]` with the coarse universal property,
  and `j = 0, 1728` witnessing the automorphism obstruction.
- **A Drinfeld structure where naive fails**: over `𝔽_p`, on a supersingular `E`, the zero
  section is a Drinfeld `[Γ₁(p)]`-structure because
  `Σ_{a ∈ ℤ/p} [a·0] = p·[0] = ker F_{E/S}` — the kernel of relative Frobenius, a finite
  locally free subgroup of rank `p` — while `E(𝔽̄_p)` has no point of naive order `p`.
  (The divisor `p·[0]` has degree `p`; it is not `E[p]`, whose rank is `p²`.)
- The comparison contract over a field: scheme isogenies biject with function-field
  isogenies, matching degree and `[N]`.
- `Y₀(N) = Y_full(N)/Borel` is coarse and not fine; `−1` in the Borel breaks rigidity.
- `Y(ρ)(K)` is naturally the set of pairs `(E/K, E[N] ≅ ρ|_{G_K})` respecting the pairings —
  the FLT-facing statement.

## Ordering

Layer 0 unblocks everything and proceeds in parallel strands. Layer 1 needs Layer 0's
descent only for the group-law gluing. Layer 2 builds on Layers 0–1. Layer 3 consumes
Layers 0 and 2. Layer 4 consumes Layers 1 and 3. Layer 5 consumes Layers 3–4 (plus Layer
0's dictionary and Layer 2's pairing for `Y(ρ)`). Layer 6 consumes Layers 3–5. Layer 7
consumes everything, in the order 7A → 7B → 7C → 7D → 7E; its `ℤ[1/N]` clauses land with
Layer 6. The elliptic-curves roadmap is a sibling: only the Layer-2 comparison contract
touches it.

## References

- N. M. Katz, B. Mazur, *Arithmetic Moduli of Elliptic Curves*, Ann. of Math. Studies 108
  (Princeton, 1985) — KM.
- D. Loeffler, *Modular Curves* (graduate lecture notes) — the companion for readable
  statements.
- P. Deligne, M. Rapoport, *Les schémas de modules de courbes elliptiques*, LNM 349 (1973).
- V. G. Drinfeld, *Elliptic modules*, Mat. Sbornik 94 (1974).
- B. Conrad, *Arithmetic moduli of generalized elliptic curves*, J. Inst. Math. Jussieu 6
  (2007) — background for the excluded compactified theory.
- K. Buzzard, *Formalizing Fermat* (lecture slides; Lecture 8) — the `Y(ρ)` target.
- Mathlib in flight: mathlib4#25983, mathlib4#35151 (Layers 1–2 coordinate with both).

## Provenance and status

Sources: **AINTLIB** (`github.com/CBirkbeck/AINTLIB`, public, **Apache-2.0**), at
`main @ 911a2eca9a04` (the consolidated `Y₁(N)` chain) and
`dev/modular-curves @ 9fec8eba7652` (2026-07-22; the active KM program — 310 files, 247
file-level `sorry` occurrences by grep), plus the stream branches
`dev/modular-curves-y1 @ d9f2fbbb7b3e` (full-level route),
`dev/modular-curves-b5da @ 0bb37c442f89` (`[N]` formally unramified), and
`dev/modular-curves-irr @ 320d99ea6182` (irreducibility scoping — deferred with its
milestone). Direct `sorry` counts are grep counts at those pins (they over-count comments
and see no cross-file dependence); every "axiom-clean" claim is re-established by
`#print axioms` in TauCeti CI at migration. The dev branch moves; re-pin before migrating.

| Milestone | Source | Direct `sorry` | Transitive audit | Status |
|---|---|---:|---|---|
| Projective model, points dictionary | mathlib4#25983 / AINTLIB `EllipticCurve/` | 0 at pin | pending | in progress upstream |
| Group law over a base | mathlib4#35151 / AINTLIB chart chain | 2 | pending | in progress |
| Layer-0 `ForMathlib` items | AINTLIB `ForMathlib/` (~130 files) | 41 | pending | migrate item-by-item |
| `[N]` finite flat of rank `N²` | AINTLIB `MulByHom*` | — | pending | incomplete |
| General dual isogeny | absent (`endDual` is endomorphism-only, 9 `sorry`s) | — | — | **new** |
| Weil pairing (construction) | AINTLIB `WeilPairing/` (comparison only) | 11 | — | mostly new |
| Quotient by finite subgroup | AINTLIB Hopf–Galois route | 0 at core | pending | migrate |
| `[Γ₀]` substrate (`NIsogeny`) | AINTLIB | 25 | — | open |
| Level structures, exact order | AINTLIB `LevelStructure/` | 20 | — | partially done |
| Closed-locus full sets | AINTLIB (affine form) | — | — | globalisation open |
| Balanced `[Γ₁(N)]` | absent | — | — | **new, not yet scoped** |
| `Ell/R`, atlas, rigidifiers, 4.7.0 | AINTLIB `Moduli/` | 2 | pending | migrate |
| KM regularity definition | absent | — | — | **new** |
| Tate normal form, `Y₁(N)` | AINTLIB `main` chain (≈21k lines) | 16 carriers | headline axiom-clean 2026-07-12 | proved; migration = decomposition |
| `Y_full(N)` representability | AINTLIB dev + `-y1` branch | — | pending | assembled at pin |
| Fixed-pairing `Y(N, ζ_N)` | absent | — | — | **new (correction)** |
| `Y(ρ)` | AINTLIB `YRho.lean` | 5 | — | staged |
| `Γ_H`, coarse spaces, `j`-line | AINTLIB `CoarseSpace`, `GammaH*` | 0–3 | pending | partially done |
| First Main Theorem (7A–7E) | skeleton only | — | — | **major new development** |
