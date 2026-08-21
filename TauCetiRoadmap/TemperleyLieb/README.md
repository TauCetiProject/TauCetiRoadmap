# Roadmap: Temperley–Lieb diagrams, categories, and algebras

The Temperley–Lieb category is the smallest interesting diagram category: morphisms are
planar matchings of boundary points together with a count of closed circles, composition is
gluing, and the tensor product is side-by-side juxtaposition. It sits at the crossroads of
low-dimensional topology (the Kauffman bracket and the Jones polynomial), operator algebras
(Jones' index theorem and subfactors), representation theory (it is `Rep U_q(sl₂)` in
disguise), and categorical algebra (it is the origin story of pivotal, spherical, and fusion
categories). Mathlib has none of it: no diagram categories, no pivotal or spherical structure,
no cellular algebras, no fusion categories. Elsewhere the closest prior formalization we have
found is the Isabelle AFP entry [*Knot Theory*](https://www.isa-afp.org/entries/Knot_Theory.html)
(T. V. H. Prathamesh), which builds tangle diagrams from cups, caps and crossings modulo
relations and reaches the bracket polynomial; that is the Layer 2 picture, without the linear,
cellular or fusion theory above it. On the Lean side the material has been attempted and
abandoned more than once — see
[Zulip, *new members > knot theory*](https://leanprover.zulipchat.com/#narrow/channel/113489-new-members/topic/knot.20theory)
(2022-05) on the Temperley–Lieb algebra, the Jones polynomial and planar algebras — and none of
it survives as usable material.

The end goals:

- **v1 (the combinatorics and the category).** Planar matchings with several encodings and
  conversion functions, full counting (Catalan numbers and the through-strand refinement),
  the diagram category with its monoidal and rigid structure, and its **universal property**
  as a presented monoidal category.
- **v2 (the linear theory).** The `R`-linear category `TL(R, δ)` for a loop parameter
  `δ ∈ R`, with pivotal, spherical, and (after base change) braided and ribbon structure;
  the Temperley–Lieb algebras `TL_n`, the `e_i` presentation theorem, the Markov trace and
  its uniqueness; cell modules, the Gram determinant formula, and the **semisimplicity /
  nondegeneracy classification** (over a field of characteristic zero: nondegenerate iff `δ` is
  not `ζ + ζ⁻¹` for a root of unity `ζ ≠ ±1`).
- **v3 (Jones–Wenzl and the summits).** The Jones–Wenzl projections with both recursions and
  the explicit coefficient formula; the negligible ideal and the Goodman–Wenzl theorem that
  the Jones–Wenzl projection generates the unique proper nonzero tensor ideal at a root of
  unity; the Karoubi envelope with its simple objects and Clebsch–Gordan fusion at generic
  `δ`; and the root-of-unity semisimplified quotients, which would be the **first fusion
  categories in a proof assistant**.

Suggested homes: `TauCeti/TemperleyLieb/` for everything specific to Temperley–Lieb
(`Matching/`, `Category/`, `Algebra/`, `Cell/`, `JonesWenzl/`, `Karoubi/`), and three pieces
of deliberately reusable infrastructure elsewhere: monoidal categories presented by
generators and relations in `TauCeti/CategoryTheory/Monoidal/Presentation/`, cellular
algebras in `TauCeti/Algebra/Cellular/`, and the monoidal, linear and rigid structure of the
additive-and-idempotent envelope, together with quotients by tensor ideals, in
`TauCeti/CategoryTheory/Monoidal/Envelope/` (Layer 7 spells out what that means). The general
pivotal, spherical, balanced, and ribbon API is **not** built here: it is the target of the
[pivotal and spherical categories roadmap](../PivotalSpherical/README.md) (home
`TauCeti/CategoryTheory/Monoidal/Pivotal/`), which this roadmap consumes and repays with
its first diagrammatic instances.

⚠ That roadmap is not yet in Tau Ceti: it is
[#57](https://github.com/TauCetiProject/TauCetiRoadmap/pull/57), still open at the time of
writing, and the cross-links here resolve only once it merges. Treat the pivotal/spherical API
as a declared dependency on a roadmap, not as material already available.

## Standing conventions

- **The loop parameter is `δ = q + q⁻¹`** (a closed circle evaluates to `δ`). State
  everything in terms of `δ` and quantum integers wherever possible; `q` itself appears only
  when a statement genuinely needs it (root-of-unity phrasing, the braiding). The sign
  conventions relating `δ`, `q`, and the Kauffman variable `A` (where `δ = −A² − A⁻²`, so
  `q = −A²`) are a classical trap; P. Tingley,
  [*A minus sign that used to annoy me but now I know why it is there*
  (arXiv:1002.0555)](https://arxiv.org/abs/1002.0555), is the reference for why the sign is
  intrinsic. With `δ = q + q⁻¹` every statement on this roadmap through Layer 6 is
  sign-free; the sign enters only with the braiding.
- **Quantum integers are Chebyshev evaluations, with the off-by-one absorbed once.**
  Mathlib's rescaled Chebyshev polynomial `Polynomial.Chebyshev.S`
  (`Mathlib/RingTheory/Polynomial/Chebyshev.lean`) satisfies `S_0 = 1`, `S_1 = X`,
  `S_{n+2} = X·S_{n+1} − S_n`, so `S_k` evaluated at `δ` is the quantum integer `[k+1]`.
  The definition `qInt R δ n := (Polynomial.Chebyshev.S R (n − 1)).eval δ` is `[n]`, and is
  this roadmap's **one deliberate wrapper**: it exists exactly to absorb that off-by-one at
  a single point instead of at every use site. There is still **no bracket notation**
  (square brackets are overworked already); `[n]` in this README is prose shorthand for
  `qInt R δ n`. No `q` is needed anywhere, so genericity hypotheses are ring-level
  statements about `δ`. ⚠ `[0] = 0` always; genericity conditions read "`qInt R δ k ≠ 0`
  for `1 ≤ k ≤ n`", never "for all `k`".
- **Boundary points live on a circle.** A diagram `n → m` is drawn in a rectangle and read
  **bottom to top**, but its boundary datum is the cyclic order: points `0, …, n−1` along
  the bottom from left to right, then `n, …, n+m−1` along the top from **right to left**
  (counterclockwise around the rectangle). A planar matching is then a fixed-point-free
  involution of `Fin (n+m)` whose pairs do not interleave, a condition invariant under
  rotation; the rectangle only matters for composition. This makes rotation, reflection, and
  corner-dragging cheap, and it is the design decision the operations of Layer 1 rest on.
- **Composition order:** `f ≫ g` stacks `g` on top of `f`. Two composites pin this down, and
  every other cup/cap composite on this roadmap should be checked against them:
  `cup ≫ cap = δ · 1_𝟙` (the closed circle) and `cap ≫ cup = e₁` (the endomorphism of `2`).
- **Algebra multiplication is Mathlib's.** `TLAlg R δ n` is `End (TLCat.of n)`, so it inherits
  Mathlib's `End` product, which *reverses* composition: `x * y = y ≫ x`
  (`Mathlib/CategoryTheory/Endomorphism.lean`, "agrees with `Function.comp`, not with
  `CategoryStruct.comp`"). So `x * y` stacks `x` on top of `y`. The relations of Layer 4 are
  symmetric enough not to notice (`e_i² = δ·e_i`, `e_i e_{i±1} e_i = e_i`, distant commutation),
  which is exactly why this needs pinning: the Jones normal form, the Markov property and the
  Jones–Wenzl recursions are not symmetric, and an implementor who assumes the other convention
  will not find out here.
- **Closed circles are data, then coefficients.** In the diagram category a morphism carries
  its circle count as a natural number: discarding the count would silently impose `δ = 1`,
  and the universal property needs the circle to remain a nontrivial endomorphism of the
  unit so that linearization at *every* `δ` factors through this one category. In
  `TL(R, δ)` the hom-modules are free on matchings alone and composition multiplies by
  `δ^{#circles}`. The linearization functor relates the two; neither is quotiented silently
  into the other.
- **The trace is unnormalized.** The diagrammatic (Markov) trace closes a diagram to the
  right and evaluates circles: `tr̂(1_n) = δⁿ`. Normalized traces divide by `δⁿ` and exist
  only when `δ` is invertible; keep them separate, never silently identified.
- **Objects are one-field structures.** The objects of `TLDiagCat` and `TLCat R δ` wrap a
  natural number of boundary points in a one-field structure (constructor `of`), so
  category and monoidal instances hang on a dedicated type, never on `ℕ` itself; tensor
  adds the underlying numbers.
- **Semisimple and nondegenerate are different words.** "Nondegenerate" refers to the trace
  pairings `Hom(n,m) × Hom(m,n) → R`; "semisimple" to the algebras `TL_n`. Both
  classifications are targets and they do not coincide statement-for-statement (see the ⚠ in
  Layer 5).
- **Use Mathlib's vocabulary:** `catalan`, `DyckWord`, `Polynomial.Chebyshev.S`,
  `RigidCategory`, `Karoubi`, `Mat_`, `IsSemisimpleRing`, `TwoSidedIdeal`, `StarRing`,
  `Simple`. Where Mathlib has no vocabulary (pivotal, cellular, fusion) we build the general
  notion, not a TL-private one.

## What Mathlib already has (consume)

- **Catalan numbers and Dyck words:** `catalan`
  (`Mathlib/Combinatorics/Enumerative/Catalan/`), `DyckWord` with
  `card_dyckWord_semilength_eq_catalan` (`…/DyckWord.lean`). Dyck words are both the
  counting engine and a candidate computational encoding of matchings.
- **Chebyshev polynomials:** `Polynomial.Chebyshev.S`
  (`Mathlib/RingTheory/Polynomial/Chebyshev.lean`), with the recurrences already proved;
  `qInt` is a one-definition evaluation layer over it (see the conventions). The identities
  underneath the Layer 0 milestones are statements about the Chebyshev polynomials themselves,
  with no diagram algebra in sight, so state and prove them at that generality — in `ℤ[X]`,
  about `S` — and evaluate afterwards, rather than in a Temperley-Lieb-shaped form that would
  have to be re-proved by the next caller.
- **Monoidal category theory:** `MonoidalCategory`, `BraidedCategory`
  (`Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean`), rigidity via `ExactPairing` and
  `RigidCategory` (`…/Monoidal/Rigid/Basic.lean`), `MonoidalPreadditive`
  (`…/Monoidal/Preadditive.lean`), `MonoidalLinear` (`…/Monoidal/Linear.lean`), and the free
  monoidal category on a *type* (`…/Monoidal/Free/`) powering coherence.
- **Idempotent completion:** `CategoryTheory.Idempotents.Karoubi`
  (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean`, with `Biproducts.lean` and
  `KaroubiKaroubi.lean`) and matrix categories `Mat_`
  (`Mathlib/CategoryTheory/Preadditive/Mat.lean`) for the additive envelope.
- **(Semi)simplicity, ideals, forms:** `Simple` (`Mathlib/CategoryTheory/Simple.lean`),
  `IsSemisimpleRing` (`Mathlib/RingTheory/SimpleModule/Basic.lean`), `TwoSidedIdeal`,
  `LinearMap.BilinForm` and the `SeparatingLeft`/`Nondegenerate` API for pairings, and
  `StarRing` for the reflection involution.

⚠ Mathlib has **no** pivotal, spherical, ribbon, or dagger categories, **no** monoidal
categories presented by generating morphisms and relations, **no** cellular algebras, **no**
semisimple-category API, **no** fusion categories, and **no** braid groups (a grep of the
pinned toolchain finds nothing usable for any of these). ⚠ It also has **no** monoidal and
**no** `Linear` structure on `Mat_` or on `Karoubi`: those constructions are supplied as bare
categories only, which is much less than Layer 7 needs. Monoidal presentations, cellular
algebras, and the monoidal/linear/rigid structure of the envelope together with quotients by
tensor ideals are targets here; the pivotal/spherical/ribbon API belongs to the
[pivotal and spherical categories roadmap](../PivotalSpherical/README.md) and is consumed,
not rebuilt; braid groups are out of scope (see Non-goals).

**Boundary with Schur–Weyl.** The
[Schur–Weyl roadmap](../RepresentationTheory/SchurWeyl/README.md) builds the Brauer algebra
`B_k(δ)` in its Layer 9, and the two roadmaps meet twice. The **cellular-algebra
infrastructure of Layer 5 is built here** and consumed there, as that roadmap says. The
**Brauer diagram combinatorics and gluing are built there**, not here: Brauer diagrams are not
planar and the associativity argument does not transfer, so Layer 2's gluing is deliberately
TL-private.

## What is missing (build here)

Everything above the consume list: planar matchings and their operations; the diagram
category with its monoidal, rigid structure and universal property; monoidal presentations
in general; `TL(R, δ)` with its pivotal, spherical, braided, and ribbon instances (against
the general API of the
[pivotal and spherical categories roadmap](../PivotalSpherical/README.md)); the algebras, the
`e_i` presentation, the Markov trace; cellular algebras in general and the TL cell theory
with Gram determinants; the semisimplicity and nondegeneracy classifications; Jones–Wenzl
projections; tensor ideals, negligibles, and Goodman–Wenzl; the monoidal, linear and rigid
structure of the additive-and-idempotent envelope and quotients by tensor ideals, both in
general; the Karoubi envelope classification and the root-of-unity fusion quotients.
`Suggested.lean` pins the load-bearing definitions and named milestones as `sorry`-targets.

---

## The build, in layers

The ordering is the dependency order; each layer's milestones become expressible as the
previous layers land.

### Layer 0: quantum integers

- `qInt R δ n`, the quantum integer `[n]`, the roadmap's one wrapper (see the
  conventions): `[0] = 0`, `[1] = 1`, `[2] = δ`, `[n+2] = δ·[n+1] − [n]`. Basic
  identities: the recurrence in both directions, `[m+n+1] = [m+1][n+1] − [m][n]`, and
  divisibility `[d] ∣ [n]` when `d ∣ n`. None of these is about Temperley-Lieb: prove them in
  `ℤ[X]` as identities between Chebyshev polynomials, at that generality and under those names,
  and evaluate at `δ` afterwards.
- **The `q`-side interface:** for a unit `q` with `δ = q + q⁻¹`,
  `[n] = q^{n−1} + q^{n−3} + ⋯ + q^{1−n}` and `(q − q⁻¹)·[n] = qⁿ − q⁻ⁿ`. Over a field of
  **characteristic zero**: `[n](δ) = 0` for some `n ≥ 1` iff `δ = ζ + ζ⁻¹` for a root of unity
  `ζ ≠ ±1` (in a quadratic extension), with the order bookkeeping made precise. This is the
  dictionary between the `δ`-language of the roadmap and the "`q` a root of unity" language of
  the literature, and both restrictions on it are real: `ζ = 1` gives `δ = 2` and `[n](2) = n`,
  `ζ = −1` gives `δ = −2` and `[n](−2) = (−1)^{n−1}·n`, neither of which ever vanishes in
  characteristic zero, while in characteristic `p` both of them vanish at `n = p`. State the
  characteristic-zero form as the milestone and the `[n](±2) = ±n` evaluations separately, so
  the modular case is visible rather than hidden inside a false iff.
- **A computable evaluator.** `qInt` is definitionally an evaluation of `Polynomial.Chebyshev.S`,
  and Mathlib's `Polynomial` is noncomputable, so `qInt` itself can never be `#eval`ed. Provide
  `qIntAux : R → ℕ → R` by the `ℕ`-recurrence (`[0] = 0`, `[1] = 1`, `[n+2] = δ·[n+1] − [n]`)
  with `qIntAux δ n = qInt R δ n`, and use it wherever a milestone below asks for evaluation.
  The Chebyshev definition stays the official one, because it is what carries the polynomial
  identities.
- **The quantum order of `δ`:** `ℓ(δ) :=` the least `ℓ ≥ 1` with `[ℓ](δ) = 0` (infinite in
  the generic case). All root-of-unity hypotheses below are phrased as `[ℓ] = 0` and
  `[k] ≠ 0` for `1 ≤ k < ℓ`.

### Layer 1: planar matchings, encodings, counting, operations

- **The definitional model:** `PlanarMatching k`, a fixed-point-free involution of `Fin k`
  whose pairs do not interleave in the linear order; prove that non-interleaving is a
  cyclic-order condition (invariant under rotation), so the circular picture of the standing
  conventions is theorem, not decree. `DecidableEq`, `Fintype`, and a `decide`/`#eval`-able
  API are required, not nice-to-haves: this layer is the computational bedrock. The
  requirement is on the *combinatorics* — matchings, diagrams, their operations and counts,
  all of which are coefficient-free. It does not extend to the linear objects of Layers 3 to 7:
  a bare `[CommRing R]` supplies no `DecidableEq R`, and already `TL_0 ≅ R`, so equality in
  `TLAlg R δ n` is decidable only over coefficient rings where it is decidable. Keep the
  abstract instances and the executable ones apart.
- **The Dyck-word model and counting:** the equivalence
  `PlanarMatching (2k) ≃ {p : DyckWord // p.semilength = k}` (an innermost-cup induction),
  hence `card = catalan k`, and emptiness for odd `k`. The Dyck encoding doubles as the
  efficient composition algorithm later (a stack machine that also counts the circles it
  closes).
- **Through-strands and the refined count:** `through D`, the number of strands connecting
  bottom to top; `halfCount n k` (the number of half-diagrams on `n` points with `k`
  defects), with `halfCount n k = C(n, (n−k)/2) − C(n, (n−k)/2 − 1)` for `k < n` **and `n − k`
  even**, `halfCount n n = 1`, and `halfCount n k = 0` off that parity or for `k > n`. The
  parity side condition is not decoration: at `n = 4`, `k = 1` the displayed formula returns
  `C(4,1) − C(4,0) = 3` while there is no half-diagram at all, and the vanishing lemma is what
  the counting and Gram-determinant statements below silently rest on, so name it. Then the
  product formula for the number of `(n,m)`-diagrams with `k` through-strands, and
  `Σ_k (halfCount n k)² = catalan n`.
- **The innermost cup lemma:** every matching on `≥ 2` points pairs some cyclically adjacent
  boundary points. This single lemma powers the Dyck equivalence, the normal form of Layer
  2, and most inductions; name it once.
- **Operations:** the rotation `Equiv.Perm (PlanarMatching k)` with `rotate^k = 1`,
  reflection with `reflect² = 1` and the dihedral relation
  `reflect · rotate · reflect = rotate⁻¹`. `TLDiagram n m` is a matching on `n + m` points
  plus a circle count; corner-dragging (`TLDiagram (n+1) m ≃ TLDiagram n (m+1)`) is
  reindexing along the cyclic order, and the diagram-level laws relating rotation,
  reflection, and dragging are proved here, before any category exists.

### Layer 2: the diagram category and its presentation

- **The category `TLDiagCat`:** objects a one-field structure wrapping the number of
  boundary points (constructor `of`), `Hom (of n) (of m) ≃ TLDiagram n m`. Composition glues
  along the middle boundary and adds circle counts, including the newly formed circles: the
  middle points have degree ≤ 2 in the union of the two matchings, so components are paths
  or cycles, and the new circles are the cycle count (a finite-graph argument; Mathlib's
  `SimpleGraph` connectivity machinery, or a direct path-following induction on the Dyck
  encoding). **Associativity is the hard theorem of this layer**; plan for it, do not
  discover it.
- **Monoidal structure:** juxtaposition (`+` on objects, index-shifting on matchings), with
  the strictness handled once: tensor adds the underlying point counts, and the associators
  are equality-induced isomorphisms.
- **Rigidity:** every object is self-dual via nested cups and caps; the zigzag identities
  are diagram computations. `RigidCategory TLDiagCat`.
- **Monoidal presentations (reusable infrastructure):** the general construction of the
  monoidal category presented by generating objects, generating morphisms between tensor
  words, and relations, with its universal property (functors out = interpretations of the
  generators satisfying the relations). Mathlib's free monoidal category is free on a type
  only; this is the missing piece, and Brauer, partition, and symmetric-group diagram
  categories will all reuse it. Three choices to pin before building it, because an
  implementor should not have to guess them. The presented category is **strict** (as
  `TLDiagCat` is: tensor is `+` on the underlying counts, an equality of objects). "Functors
  out" means **strong** monoidal functors into an arbitrary, not necessarily strict, monoidal
  target; no strictification theorem is needed for that, and Mathlib already has the shape in
  `FreeMonoidalCategory.project` (`Mathlib/CategoryTheory/Monoidal/Free/Basic.lean`), which
  produces a monoidal functor out of the free monoidal category into any monoidal `D`.
  Relations are imposed as a **congruence** on the hom-sets of the free monoidal category,
  closed under composition and whiskering on both sides — the same closure conditions as the
  tensor ideals Layer 6 defines for a general monoidal linear category, so build the two
  together rather than twice.
- **The presentation theorem for `TLDiagCat` (the universal property):** `TLDiagCat` is the
  monoidal category presented by one generating object with morphisms `cup : 0 → 2`,
  `cap : 2 → 0` and exactly the two zigzag relations. Equivalently: monoidal functors
  `TLDiagCat ⥤ C` correspond to objects `V` with `η : 𝟙 → V ⊗ V`, `ε : V ⊗ V → 𝟙`
  satisfying the snake equations. This is *the* reason TL is useful, and it resolves the
  multiple-presentations tension: the presented category has trivial composition and hard
  normal forms, the matching model the reverse, and this equivalence (via the innermost-cup
  normal form) lets each side do what it is good at.
- **Through-strand factorization:** every diagram factors as a *surjection* (all top points
  of the intermediate object are through-strands) followed by an *injection* (all bottom
  points through), through `through D`, uniquely once the circles are pinned to the
  surjective factor; and the re-factorization lemma computing the factored form of a
  composite from factored inputs.

### Layer 3: the linear category `TL(R, δ)`

- **The category:** for a commutative ring `R` and `δ ∈ R`, hom-modules free on matchings
  (no circle data), composition inserting `δ^{#new circles}`; the identity-on-objects
  linearization functor from `TLDiagCat` sending a circle to `δ`. Instances:
  `Preadditive`, `Linear R`, `MonoidalCategory`, `MonoidalPreadditive`, `MonoidalLinear`,
  `RigidCategory`; the basis `diagBasis` of each hom-module indexed by matchings.
- **Pivotal and spherical instances:** the general API (the double-dual functor, pivotal
  structures, left and right traces and dimensions, sphericality) is the core of the
  [pivotal and spherical categories roadmap](../PivotalSpherical/README.md), a dependency
  of this layer, not a target of it. Here we supply that API's first diagrammatic
  instances: the pivotal structure on `TL(R, δ)` *is* the rotation operation of Layer 1
  transported through `diagBasis`, sphericality is a closure computation, and the quantum
  dimension of the object `n` is `δⁿ`.
- **The reflection involutions:** vertical reflection is a contravariant monoidal involution
  (on endomorphism algebras this is the `StarRing` structure of Layer 4), horizontal
  reflection a covariant one; rotation, the two reflections, and the rigidity data satisfy
  the dihedral compatibility laws, stated once at category level so Layer 4 does not restate
  them per algebra.
- **Corner-dragging as linear isomorphisms** `Hom(n+1, m) ≃ₗ Hom(n, m+1)` (Frobenius
  reciprocity for the self-duality), compatible with the Layer 1 reindexing along
  `diagBasis`.
- **The braidings:** for a unit `A ∈ R` with `δ = −A² − A⁻²` (that is, `q = −A²`; this is
  where Tingley's minus sign lives, and the only place the roadmap leaves the bare
  `δ = q + q⁻¹` convention), the Kauffman braiding `σ = A·1 + A⁻¹·(cap ≫ cup)` on `TL(R, δ)`:
  `BraidedCategory`, the second braiding via `A ↦ A⁻¹`, their inverse relationship, and the
  **ribbon structure** (twist `θ₁ = −A³`), against the balanced/ribbon definitions of the
  [pivotal and spherical categories roadmap](../PivotalSpherical/README.md).
- **The evaluation representation:** for the same unit `A ∈ R` with `δ = −A² − A⁻²` as the
  braidings need (there is no cup and cap over `R` alone giving circle value `q + q⁻¹`; the
  square root is what `A` is for), via the universal property, `V = R²` with the standard
  cup and cap (matrix entries `0, ±A^{±1}`, circle value `δ`) gives a monoidal functor
  `TL(R, δ) ⥤ ModuleCat R`, hence algebra maps `TL_n → End((R²)^{⊗n})`. This is quantum
  `sl₂` Schur–Weyl with no quantum group in sight, the first real test of the universal
  property, and (faithfulness, via Layer 5's Gram machinery, when `[k] ≠ 0` for `k ≤ n`) a
  concrete matrix model.
- **Monos and epis:** for a single diagram `D` (nontrivial `R`, `δ` a non-zero-divisor),
  `D` is mono iff all its bottom points are through-strands, and epi iff all its top points
  are. Forward (mono ⟹ through-strands), by contraposition: if `D` has an arc joining two of
  its bottom points then planarity gives an innermost such arc, joining adjacent points `i`,
  `i+1`, and `e_i ≫ D = δ·D = (δ·1_n) ≫ D` with `e_i ≠ δ·1_n`; dually `D ≫ e_i = δ·D` for epi,
  using an arc among the top points. Converse (through-strands ⟹ mono): `D ≫ D̄ = δ^c·1_n`,
  where `c` counts the arcs among `D`'s top points *and* twice its stored circles.
  ⚠ The hypothesis on `δ` is real, but not for the reason one first guesses: `cup : 0 → 2` is
  mono for **every** `δ`, since precomposition just adjoins a disjoint arc and closes no circle.
  What `δ` a non-zero-divisor rules out is the stored circle count: the empty diagram `0 → 0`
  carrying one circle has all (zero) bottom points through, yet is `δ · 1_𝟙`, which is `0` at
  `δ = 0` and is multiplication by `2` over `ℤ/6`. Both are acceptance tests, and both are
  invisible if one thinks only about circle-free diagrams.

### Layer 4: the algebras, the tower, and the Markov trace

- **`TLAlg R δ n := End(n)`**, literally Mathlib's `End (TLCat.of n)`, so the `Ring` and
  `Algebra R` structures come from `CategoryTheory.Preadditive` and `CategoryTheory.Linear`
  rather than being rebuilt (see the multiplication-order convention above). What is left to
  prove: free as an `R`-module with `finrank = catalan n` (over a nontrivial `R` — over the
  trivial ring Mathlib's `finrank` is `1`), a `StarRing` structure via vertical reflection, and
  `star (r • x) = r • star x`, since `StarRing` alone constrains only the ring structure and
  the reflection is claimed to be `R`-linear.
- **Generators and the presentation theorem:** the `e_i := cap_i ≫ cup_i`, with `cap_i` the map
  `n+1 → n−1` joining the adjacent points `i`, `i+1` and `cup_i` its reflection `n−1 → n+1`.
  ⚠ In the other order `cup_i ≫ cap_i` is `δ·1`, not `e_i`, and it type-checks, so nothing will
  catch the mistake. Index the generators of `TL_{n+1}` by `Fin n` rather than those of `TL_n`
  by `Fin (n−1)`: truncated subtraction then never appears, and the last generator — the one
  the Markov property and the Wenzl recursion both need — is literally `Fin.last`. Relations:
  `e_i² = δ·e_i`, `e_i e_{i±1} e_i = e_i`, and distant commutation;
  the abstract algebra `PresentedTL R δ n` on these generators and relations (via
  `FreeAlgebra` and `RingQuot`), and the isomorphism `PresentedTL ≃ₐ TLAlg`. The proof
  forces the **Jones normal form** for reduced words in the `e_i` and the spanning argument,
  with the Catalan count of Layer 1 pinning the dimension; the inductive
  add-a-cap/drag-a-corner generation of diagrams is the normal-form half of this theorem.
- **The tower:** the inclusions `incl : TLAlg R δ n →ₐ TLAlg R δ (n+1)` (add a through
  strand on the right), injective for every `R` and `δ` (basis-injective, no invertibility
  needed).
- **The diagrammatic (Markov) trace:** `tr̂ : TLAlg R δ n →ₗ R` by right closure;
  `tr̂(1) = δⁿ`, traciality `tr̂(xy) = tr̂(yx)`, compatibility `tr̂(incl x) = δ·tr̂(x)`, and
  the **Markov property** `tr̂(incl x · e_n) = tr̂(x)`, all division-free in the unnormalized
  convention. The pairing `⟨x, y⟩ = tr̂(star x · y)` and its relation to Layer 5's cell
  forms.
- **The conditional expectation** `condExp : TLAlg R δ (n+1) →ₗ TLAlg R δ n` (close the last
  strand only): `TLAlg n`-bimodule map, `condExp (incl x) = δ·x`,
  `tr̂ ∘ condExp = tr̂`.
- **Uniqueness of the Markov trace:** any family of linear maps satisfying traciality, the
  compatibility, the Markov property, and `tr 1 = 1` in degree `0` equals `tr̂`.

### Layer 5: cellular algebras, Gram determinants, semisimplicity

- **Cellular algebras (reusable infrastructure):** the Graham–Lehrer definition, cell
  modules, the bilinear form on each cell, and the two general theorems this roadmap
  consumes: the classification of simples as quotients of cells with nonzero form, and the
  criterion *semisimple iff every cell form is nondegenerate*. Built in general in
  `TauCeti/Algebra/Cellular/`: Hecke, Brauer, and partition algebras will reuse it, and the
  general proofs are no harder than the TL-specific ones.
- **The TL cell structure:** the through-strand filtration is a cell structure with cells
  indexed by `k ≡ n (mod 2)`, `0 ≤ k ≤ n`; the cell module `CellModule R δ n k` has the
  half-diagram basis (`finrank = halfCount n k` over a nontrivial `R`, these are Layer 2's
  injective morphisms), and the cell form `⟨u, v⟩` is defined by `ū ≫ v = ⟨u,v⟩ · 1_k + (lower
  through-strand terms)`. The `TLAlg R δ n`-action and the `R`-action on `CellModule R δ n k`
  are compatible (`IsScalarTower R (TLAlg R δ n) (CellModule R δ n k)`): without that they are
  formally unrelated structures and `cellForm` being `R`-bilinear says less than intended.
- **The Gram determinant formula, universally:** with `G_{n,k}` the Gram matrix in the
  half-diagram basis, `det G_{n,k}` is the evaluation at `δ` of an explicit polynomial
  `gramPoly n k ∈ ℤ[X]`, characterized in `ℤ[X]` (a domain, where every `[j]` is nonzero) by
  `gramPoly n k · Π_{j=1}^{(n−k)/2} [j]^{m_j} = Π_{j=1}^{(n−k)/2} [k+j+1]^{m_j}` with
  `m_j = halfCount n (k+2j)` (Westbury; Ridout–Saint-Aubin), and transported to any `R` by base
  change. **The universal form is the milestone, not the specialized one.** Cross-multiplied and
  then evaluated at a particular `δ`, the identity says nothing whenever some `[j]` with
  `j ≤ (n−k)/2` vanishes, since then both sides are `0` and every `m_j` in range is positive —
  and that is not a corner case, it is exactly where the classification below lives. It already
  bites at `δ = 0`, `n = 4`, `k = 0`, whose denominator is `[1]³[2]`, so even the anchor
  `det G_{4,0} = [2]²[3]` is not recoverable from the specialized identity there. Sanity anchors:
  `det G_{2,0} = [2]`, `det G_{3,1} = [3]`, `det G_{4,2} = [4]`, `det G_{4,0} = [2]²[3]`,
  `det G_{5,1} = [3]⁴·(δ²−2)`.
- **Semisimplicity:** over a field, `IsSemisimpleRing (TLAlg K δ n)` iff every
  `det G_{n,k} ≠ 0`; in particular semisimple whenever `[k] ≠ 0` for `1 ≤ k ≤ n`. Over a field
  of **characteristic zero** this becomes the closed classification: `TL_n(K, δ)` is semisimple
  iff `ℓ(δ) > n`, or `δ = 0` and `n` is odd.
  ⚠ **The `δ = 0` trap:** `[2](0) = 0` yet `TL_3(0)` *is* semisimple (the Gram determinants
  `det G_{3,1} = [3] = −1`, `det G_{3,3} = 1` are nonzero); `TL_2(0)` is not
  (`det G_{2,0} = 0`). So "semisimple iff `[k] ≠ 0` for `k ≤ n`" is **false** as an iff, which
  is what the `δ = 0`/odd-`n` clause above repairs.
  ⚠ **And that clause is characteristic-zero.** `det G_{5,1} = [3]⁴·(δ²−2)`, which at `δ = 0`
  is `−2`: nonzero in characteristic zero, zero in characteristic 2. So `TL_5(𝔽̄₂, 0)` is *not*
  semisimple and the parity rule fails. Any statement proposed here must be checked against
  `TL_2(0)`, `TL_3(0)` and `TL_5(𝔽̄₂, 0)`; they are acceptance tests below. The modular
  classification in general is out of scope (see Non-goals).
- **Nondegeneracy of the category:** the closure pairings
  `Hom(n,m) × Hom(m,n) → R` are nondegenerate for *all* `n, m` iff `[k] ≠ 0` for all
  `k ≥ 1`. That `δ`-side statement holds over any field; it is the clean category-level one,
  with no parity exception, and it is the form to state and prove. Over an algebraically closed
  field of **characteristic zero** it translates to "`δ ≠ ζ + ζ⁻¹` for every root of unity
  `ζ ≠ ±1`", which already excludes `δ = 0` (the case `ζ = ±i`). The characteristic hypothesis
  is not decoration: in characteristic `p`, `δ = 2 = 1 + 1⁻¹` has `[p] = 0` while `ζ = 1` is
  excluded by `ζ ≠ ±1`, so the translated form is simply false there.

### Layer 6: Jones–Wenzl projections

- **Existence and characterization:** `jonesWenzl n`, defined when `[k]` is invertible for
  `1 ≤ k ≤ n`: the unique nonzero idempotent killed on both sides by every `e_i` (uniqueness
  over a field); `star`-invariant; coefficient of the identity diagram equal to `1`.
- **Both recursions:** the quadratic (Wenzl) recursion
  `f_{n+1} = f_n − ([n]/[n+1]) · f_n e_n f_n`, and the **single-clasp (linear) recursion**
  expanding `f_{n+1}` as `f_n` plus a `[·]/[n+1]`-weighted sum of once-capped terms, which
  is the efficient one and the route to coefficients.
- **The coefficient formula:** the closed formula for the coefficient of any diagram in
  `f_n` as a product of quantum-integer ratios read off the diagram, following S. Morrison,
  [*A formula for the Jones–Wenzl projections*
  (arXiv:1503.00384)](https://arxiv.org/abs/1503.00384). Milestone: a `#eval`-able
  computation of any single coefficient, checked against `f_2` and `f_3`.
- **Traces:** `tr̂(f_n) = [n+1]` and the partial trace
  `condExp f_{n+1} = ([n+2]/[n+1]) · f_n`; absorption `f_n · incl(f_{n-1}) = f_n` and its
  tensor variants.
- **Tensor ideals and negligibles:** the definition of a tensor ideal (hom-submodules closed
  under composition and whiskering on both sides), stated for a general monoidal `R`-linear
  category and not for `TL(R, δ)` alone — Layer 7 has to push one along `Mat_` and `Karoubi`
  and quotient by it, and the same shape imposes the relations on a presented monoidal category
  in Layer 2; the negligible ideal of `TL(R, δ)` (`f` with `tr̂(f ≫ g) = 0` for all `g`) is the
  instance that matters here. Then: over a field of **characteristic zero**,
  at quantum order `ℓ`, `f_{ℓ−1}` exists, is negligible (`tr̂ f_{ℓ−1} = [ℓ] = 0`), and
  **generates the negligible ideal, which is the unique proper nonzero tensor ideal**
  (Goodman–Wenzl). Generic complement: when `[k] ≠ 0` for all `k ≥ 1`, the only tensor ideals
  are `0` and everything. The characteristic hypothesis is carried deliberately: Goodman–Wenzl
  is a characteristic-zero theorem, and in characteristic `p` both the Jones–Wenzl projections
  and the ideal lattice genuinely differ — the modular Temperley–Lieb algebra and the
  mixed-case `SL₂` tilting picture are separate subjects, out of scope here (see Non-goals).

### Layer 7: the Karoubi envelope and the root-of-unity quotient

- **The envelope, as reusable infrastructure.** `TLKar K δ := Karoubi (Mat_ (TL(K, δ)))` uses
  two Mathlib constructions, but *only* as plain categories: on the pinned toolchain there is
  no `MonoidalCategory` instance for either `Mat_ C` or `Karoubi C`, and no `Linear R` instance
  for either. Both lifts are targets here, in general and not for `TL` alone: for a monoidal
  preadditive (resp. `R`-linear) category `C`, the induced monoidal (resp. `R`-linear)
  structure on `Mat_ C` and on `Karoubi C`, together with the induced rigid structure, and the
  compatibility of the two lifts. Only the finite biproducts come free, from `Mat_` plus
  `Mathlib/CategoryTheory/Idempotents/Biproducts.lean`. Everything Layer 7 says about tensor
  products, duals or quantum dimensions in the envelope rests on this, so it is the first
  milestone of the layer, and it belongs in `TauCeti/CategoryTheory/Monoidal/Envelope/`
  alongside the quotient below: every diagram category that ever wants a semisimplified
  quotient needs exactly this.
- **Quotients by tensor ideals, as reusable infrastructure.** Layer 6's `negligibleIdeal` is a
  tensor ideal of `TL(K, δ)`, but the quotient below is taken in `TLKar K δ`, and the passage
  is not automatic. Targets: extension of a tensor ideal of `C` along `Mat_` and `Karoubi`; the
  additive/`R`-linear quotient of a category by a tensor ideal; descent of the monoidal, rigid,
  pivotal, spherical, braided and ribbon structure to that quotient; and idempotent
  completeness of the result (or its idempotent completion, if the quotient loses it). Mathlib
  has general categorical quotients but no monoidal quotient, so this is built here.
- **The generic classification:** when `[k] ≠ 0` for all `k ≥ 1`: the images of the
  Jones–Wenzl projections are simple, pairwise non-isomorphic, every simple is one of them,
  and every object is a finite biproduct of them (semisimplicity, stated object-by-object
  since Mathlib has no semisimple-category API; defining that predicate is part of this
  layer). **Clebsch–Gordan:** `X_{n+1} ⊗ X_1 ≅ X_n ⊞ X_{n+2}` and the general
  `X_a ⊗ X_b ≅ ⊞ X_c` (`c = |a−b|, |a−b|+2, …, a+b`); quantum dimensions `[n+1]`; the
  fusion ring is `ℤ[X]` with `X_n ↦ S_n`. This is the semisimple representation theory of
  `U_q(sl₂)` with no quantum group defined.
- **The root-of-unity quotient:** over an algebraically closed field `K` of characteristic
  zero, at quantum order `ℓ`, the quotient of `TLKar K δ` by the negligible ideal (via the two
  infrastructure bullets above): semisimple with simples `X_0, …, X_{ℓ−2}`, truncated fusion
  rules (the `A_{ℓ−1}` fusion rules), spherical with dimensions `[k+1]`, and braided/ribbon
  when the braiding descends. Following the
  [pivotal and spherical categories roadmap](../PivotalSpherical/README.md)'s convention,
  "fusion" is stated as explicit hypotheses rather than a bundled class until a refactor earns
  one, and the hypotheses are that roadmap's, verbatim, so that its results apply to these
  categories: `K`-linear, rigid, semisimple, finitely many simple objects, and
  `End 𝟙 ≅ K` (which is what "simple unit" has to mean here; over a general field the two are
  not the same condition). Prove the quotients satisfy every one of them, making them the first
  fusion categories in a proof assistant, and the entry point to the world mapped in
  C. Edie-Michell and S. Morrison,
  [*A field guide to categories with `Aₙ` fusion rules*
  (arXiv:1710.07362)](https://arxiv.org/abs/1710.07362) (which is context here, not a
  target: this roadmap constructs the categories; the field guide's classification program
  is future work).

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **Counting, by `decide`/`#eval`:** `card (PlanarMatching 6) = catalan 3 = 5`;
  `halfCount 4 2 = 3`; `Σ_k (halfCount 4 k)² = catalan 4 = 14`.
- **Composition counts circles:** `e₁ ≫ e₁` in the diagram category is `e₁`'s matching with
  circle count `1`; in `TL(R, δ)`, `e₁² = δ·e₁`.
- **Rotation and reflection:** `rotate⁶ = 1` on `PlanarMatching 6`; rotating `e_i` by one
  click gives the corner-dragged cup/cap diagram; `reflect` fixes every `e_i`.
- **Jones–Wenzl:** `f_2 = 1 − [2]⁻¹·e₁`; `f_3 = 1 − ([2]/[3])(e₁ + e₂) + [3]⁻¹(e₁e₂ + e₂e₁)`;
  `tr̂ f_2 = [3]`, `tr̂ f_3 = [4]`; the coefficient formula reproduces both.
- **Gram anchors:** `G_{3,1} = [[δ, 1], [1, δ]]` with determinant `[3]`;
  `det G_{4,2} = [4]`; `det G_{4,0} = δ²(δ² − 1)`; `det G_{5,1} = [3]⁴·(δ² − 2)`, which the
  cross-multiplied identity cannot see at `δ = 0` and the universal form can.
- **The `δ = 0` trap, concretely:** `TL_2(0)` is not semisimple, `TL_3(0)` is, and `TL_5(0)`
  is over a characteristic-zero field but not over `𝔽̄₂`.
- **Monos:** `cup : 0 → 2` is mono for every `δ`, and `cup ≫ cap = δ`, `cap ≫ cup = e₁`. The
  empty diagram `0 → 0` with one stored circle is `StringInjective` and is *not* mono at
  `δ = 0`, nor over `ℤ/6` at `δ = 2`.
- **Karoubi:** `X_1 ⊗ X_1 ≅ X_0 ⊞ X_2` when `[2] ≠ 0`; at `δ = 1` (quantum order `3`) the
  quotient has two simples with `X_1 ⊗ X_1 ≅ X_0`; at `δ = (1+√5)/2` (quantum order `5`)
  the quotient contains the Fibonacci fusion rules.

## Ordering

Layers 0 and 1 are independent of everything and fully parallelizable; they are also the
cheapest place to get the encodings and conversion functions right. Layer 2 is the
load-bearing combinatorial work (associativity of gluing, the presentation theorem); Layer 3
is wide but each structure is a separate milestone once the category exists. Layer 4 sits on
Layer 3, whose pivotal and spherical instances additionally wait on the
[pivotal and spherical categories roadmap](../PivotalSpherical/README.md)'s core layers
(everything else in Layer 3 is independent of that roadmap). Layer 5's cellular
infrastructure can start any time, but the TL instance needs Layer 4. Layer 6 needs Layers 4 and 0 only (the recursions live in the algebras), with the
ideal-theoretic half needing Layer 5's pairings. Layer 7 is the summit and consumes
everything — except its two infrastructure milestones (the monoidal/linear/rigid structure of
the envelope, and quotients by tensor ideals), which are general category theory, depend on
nothing else here, and can be started as early as Layers 0 and 1. They are on the critical
path to the fusion summit, so starting them early is worth doing.

## Non-goals

Each of these is out of scope for this roadmap, and each would make a good separate one;
nothing here depends on any of them.

- **Braid groups, the Kauffman bracket, and the Jones polynomial.** Mathlib has no braid
  groups, and the braiding of Layer 3 makes `σ_i ↦ A·1 + A⁻¹·e_i` a two-line definition
  once they exist, with the writhe-normalized Markov trace invariant under the Markov
  moves as the natural algebraic summit; a diagrammatic route to links could reuse the grid
  diagrams and Cromwell moves of the
  [combinatorial Heegaard Floer roadmap](../CombinatorialHeegaardFloer/README.md).
- **The modular theory.** Every field-level result here is stated over characteristic zero
  where the characteristic matters (the semisimplicity classification of Layer 5, Goodman–Wenzl
  in Layer 6, the fusion quotients of Layer 7). Characteristic `p` is a different subject —
  the modular Temperley–Lieb algebra, modular Jones–Wenzl projections, and `SL₂` tilting
  modules in the mixed case — and the `δ`-level statements built here (the Gram determinants
  as polynomials, the `[k] ≠ 0` criteria) are exactly what a modular roadmap would start from.
- **Annular and affine Temperley–Lieb, and planar algebras.** The rotation and reflection
  operations here are their shadow; the general formalism is out of scope.
- **Positivity, subfactors, and the Jones index theorem.** These need real-coefficient
  positivity and operator algebras; a different roadmap.
- **The equivalence with tilting modules for `U_q(sl₂)`.** Quantum groups do not exist in
  Mathlib or Tau Ceti; when they do, the evaluation representation of Layer 3 is the seam
  where that future roadmap attaches.
- **Turaev–Viro and skein-module TQFT** (where Chen's thesis heads after constructing the
  categories).

## References

- J. Chen, [*The Temperley–Lieb categories and skein modules*
  (arXiv:1502.06845)](https://arxiv.org/abs/1502.06845): a careful, self-contained
  diagrammatic development of exactly Layers 1 through 7, and the closest thing to a
  formalization blueprint.
- D. Ridout and Y. Saint-Aubin, [*Standard modules, induction and the structure of the
  Temperley–Lieb algebra* (arXiv:1204.4505)](https://arxiv.org/abs/1204.4505): the cell
  modules, Gram determinants, and the root-of-unity structure, stated with unusual care.
- L. H. Kauffman and S. L. Lins, *Temperley–Lieb Recoupling Theory and Invariants of
  3-Manifolds*, Princeton University Press, 1994: the Jones–Wenzl calculus.
- S. Morrison, [*A formula for the Jones–Wenzl projections*
  (arXiv:1503.00384)](https://arxiv.org/abs/1503.00384): the Layer 6 coefficient formula.
- H. Wenzl, *On sequences of projections*, C. R. Math. Rep. Acad. Sci. Canada 9 (1987),
  5–9: the quadratic recursion.
- J. J. Graham and G. I. Lehrer, *Cellular algebras*, Invent. Math. 123 (1996), 1–34: the
  Layer 5 infrastructure.
- B. W. Westbury, *The representation theory of the Temperley–Lieb algebras*, Math. Z. 219
  (1995), 539–565: Gram determinants and semisimplicity.
- F. M. Goodman and H. Wenzl, *Ideals in the Temperley–Lieb category*, appendix to
  M. H. Freedman, *A magnetic model with a possible Chern–Simons phase*, Comm. Math. Phys.
  234 (2003), 129–183: the unique-tensor-ideal theorem of Layer 6.
- P. Tingley, [*A minus sign that used to annoy me but now I know why it is there*
  (arXiv:1002.0555)](https://arxiv.org/abs/1002.0555): the `δ = q + q⁻¹` versus
  `δ = −A² − A⁻²` sign conventions.
- C. Edie-Michell and S. Morrison, [*A field guide to categories with `Aₙ` fusion rules*
  (arXiv:1710.07362)](https://arxiv.org/abs/1710.07362): the landscape the Layer 7
  quotients live in.
- T. V. H. Prathamesh, [*Knot Theory*](https://www.isa-afp.org/entries/Knot_Theory.html),
  Archive of Formal Proofs, 2016: the closest prior formalization, in Isabelle — tangle
  diagrams from cups, caps and crossings, and the bracket polynomial.
- For the modular theory declared out of scope: R. Spencer,
  [*The modular Temperley–Lieb algebra* (arXiv:2011.01328)](https://arxiv.org/abs/2011.01328),
  and L. T. Jensen, D. Tubbenhauer and P. Wedrich,
  [*Quantum `SL₂` tilting modules in the mixed case*
  (arXiv:2105.07724)](https://arxiv.org/abs/2105.07724), for what changes in characteristic
  `p` and why the characteristic-zero hypotheses above are not laziness.
