# Roadmap: the Behrend–Fantechi virtual fundamental class

The summit is the construction in Behrend and Fantechi's
[*The intrinsic normal cone*](https://arxiv.org/abs/alg-geom/9601010): from a perfect
obstruction theory on a Deligne–Mumford stack, construct a cycle class of the expected
dimension even when the stack itself has components of the wrong dimension. The construction
has three genuinely independent inputs which must all be formalized: the intrinsic normal cone,
the embedding of that cone into the vector-bundle stack supplied by the obstruction theory, and
the zero-section Gysin map in rational Chow theory. This roadmap builds all three and proves
that the resulting class is independent of every local embedding and global resolution used to
construct it.

The first summit follows the hypotheses of the original paper rather than silently importing a
later generalization. Thus `X` is a separated Deligne–Mumford stack, locally of finite type over
a field; the perfect obstruction theory has amplitude `[-1, 0]`, constant virtual rank, and a
global two-term resolution by finite-rank vector bundles; and the answer lies in the
dimension-graded rational Chow group of `X`. Properness is not needed to construct the class.
It enters only when taking the degree of a zero-dimensional class. The relative construction
over a smooth pure-dimensional algebraic stack is a second summit.

Suggested homes:

- `TauCeti/AlgebraicGeometry/Spaces/` and `TauCeti/AlgebraicGeometry/Stacks/` for algebraic
  spaces, algebraic stacks, quotient stacks, sites, and morphism properties;
- `TauCeti/AlgebraicGeometry/IntersectionTheory/` for cycles, Chow groups, Chern classes,
  deformation to the normal cone, and Gysin maps;
- `TauCeti/AlgebraicGeometry/CotangentComplex/` and
  `TauCeti/AlgebraicGeometry/Cones/` for the reusable derived and cone geometry;
- `TauCeti/AlgebraicGeometry/ObstructionTheory/` and
  `TauCeti/AlgebraicGeometry/VirtualFundamentalClass/` for the Behrend–Fantechi-specific
  interfaces and the final construction.

General foundations must live in those shared directories, not under a moduli problem which
happens to be their first consumer.

## The end goals

Fix a field `k`.

1. **The intrinsic normal cone.** For every Deligne–Mumford stack `X` locally of finite type
   over `k`, construct the intrinsic normal sheaf
   `𝔑_X = h¹/h⁰((L_X)∨)` and its canonical closed cone substack `𝔠_X ↪ 𝔑_X`. Prove that
   `𝔠_X` is pure of stack-dimension zero, has abelian hull `𝔑_X`, and is independent of all
   étale charts and embeddings into smooth schemes.
2. **Obstruction theories.** Define an obstruction theory as a morphism
   `φ : E → L_X` in the derived category inducing an isomorphism on `H⁰` and a surjection on
   `H⁻¹`. Prove the equivalent closed-immersion statement
   `𝔑_X ↪ h¹/h⁰(E∨)` and the square-zero deformation interpretation. Define perfectness by
   perfect amplitude in `[-1, 0]`; keep the existence of a global resolution as a separate
   hypothesis.
3. **The virtual fundamental class.** If `X` is separated, `φ` is perfect of constant rank
   `n`, and `E` has a global resolution, construct
   `[X, φ]vir ∈ A_n(X)_ℚ`. The class depends on the obstruction theory in the derived category,
   not on a chosen complex, chart, presentation of a cone stack, or global resolution.
4. **The basic properties.** Prove the no-obstruction, locally-free-obstruction, local complete
   intersection, product, and compatible Gysin-pullback formulas of Behrend–Fantechi §5.
   Recover the ordinary fundamental class for a local complete intersection equipped with its
   cotangent-complex obstruction theory.
5. **The relative construction.** For a morphism `f : X → Y` of relative
   Deligne–Mumford type, with `Y` smooth and pure of dimension `d`, construct
   `𝔠_{X/Y} ↪ 𝔑_{X/Y}` and, from a globally resolved relative perfect obstruction theory of
   rank `n`, the class `[X/Y, φ]vir ∈ A_{d+n}(X)_ℚ`. Prove flat and regular-immersion base
   change, products, and the compatible functoriality theorem of §7.
6. **A stable public interface.** Package the construction so a future formalization of a
   moduli stack supplies a Deligne–Mumford stack and a perfect obstruction theory, then receives
   a virtual class without reopening its chosen atlas, local embeddings, or resolution.

The classical construction has the following fixed shape. If

```text
F• = [F⁻¹ → F⁰] ≃ E,
F₀ = (F⁰)∨,                 F₁ = (F⁻¹)∨,
𝔈 = h¹/h⁰(E∨) ≅ [F₁/F₀],
C(F•) = 𝔠_X ×_𝔈 F₁,
```

then `C(F•)` is a closed cone in the vector bundle `F₁`, and

```text
[X, φ]vir = 0_F₁^! [C(F•)] ∈ A_rk(E)(X)_ℚ.
```

The roadmap must culminate in this formula, with every symbol in it independently usable and
with the independence theorem making the left-hand side intrinsic.

## Standing conventions

- **Cohomological grading and signs.** Complexes are cohomologically graded. A two-term
  obstruction complex is `[E⁻¹ → E⁰]`; its virtual rank is
  `rank(E⁰) - rank(E⁻¹)`. After derived duality set
  `E₀ = (E⁰)∨` and `E₁ = (E⁻¹)∨`, so `h¹/h⁰(E∨) = [E₁/E₀]`. Never reverse this quotient or
  define virtual dimension as the rank of the obstruction bundle alone.
- **Dimension grading.** Write `A_i(X)_ℚ` for cycles of dimension `i` modulo rational
  equivalence, tensored with `ℚ`. Codimension notation may be supplied for pure-dimensional
  stacks, but the virtual class is natively dimension-graded. A pure-dimensional stack of
  negative dimension, such as a vector-bundle stack, is legitimate.
- **The classical global-resolution hypothesis is visible.** `IsPerfect φ` and
  `HasGlobalTwoTermResolution E` are different predicates. A perfect complex is only locally a
  bounded complex of vector bundles; that does not supply the global presentation used by the
  original Chow-theoretic construction.
- **The virtual class does not require properness.** Properness is a hypothesis on a later
  degree or pushforward operation, never a field of an obstruction theory and never a premise of
  `virtualFundamentalClass` itself.
- **Stacks are groupoid-valued fppf stacks.** Build on Mathlib's pseudofunctor descent API.
  An algebraic stack has diagonal representable by algebraic spaces and a smooth surjective
  scheme atlas; a Deligne–Mumford stack has an étale surjective scheme atlas. Do not identify a
  stack with a chosen presentation groupoid.
- **Use genuine 2-categorical pullbacks.** Quotient stacks, diagonals, atlases, base change, and
  local embeddings carry specified 2-cells. Any strict model must be accompanied by comparison
  equivalences proving that the exported object is independent of strictification choices.
- **Keep the two sites distinct.** Cone stacks and torsors naturally live over the big fppf
  site; `L_X`, coherent complexes, and the original obstruction theory live on the small étale
  site of a Deligne–Mumford stack. Construct the morphism of ringed topoi and the comparison
  functors used in `h¹/h⁰((E_fl)∨)` rather than treating the sites as definitionally equal.
- **Cone means graded affine cone.** A cone over `X` is the relative spectrum of a graded
  quasi-coherent `𝒪_X`-algebra generated in degree one, with its vertex and `𝔸¹`-action. An
  abelian cone is `C(ℱ) = Spec_X Sym(ℱ)` for a coherent sheaf `ℱ`. A vector bundle is the
  abelian cone of a finite locally free dual.
- **Cone stacks remember their action.** A cone stack is locally a quotient `[C/E]` of a cone
  by a vector bundle acting compatibly with contraction. Its `𝔸¹`-action, vertex, morphisms, and
  coherence 2-cells are structure, not comments. In particular, spell out the coherence axioms
  which the original paper leaves to the reader.
- **Obstruction theories are morphisms, not pairs of sheaves.** The morphism
  `E → L_X` in the derived category and its homotopy class are essential. Kernel and cokernel
  data alone cannot state transitivity, compatibility, or the relative functoriality theorem.
- **Rational coefficients are deliberate.** The first summit follows Vistoli's rational
  intersection theory for separated Deligne–Mumford stacks. Do not promise integral stack Chow
  groups while silently dividing by stabilizer orders.
- **No chosen atlas leaks into the API.** Atlases and local embeddings are proof data used to
  construct stack objects. The exported intrinsic cone, Chow class, and comparison maps are
  invariant under refinement and equivalence.

## Inventory: what Mathlib and Tau Ceti already give us

This inventory was checked on 2026-08-03. The roadmap repository builds against Mathlib commit
`9caeba1000ef8f302920981f4a08651d325abc81`. Tau Ceti `main` was at commit
`25bd2193d5a83678b159ca7f0f91f864dd94b133`, pinned to the newer Mathlib commit
`30696563acb0596ab44d272bc5dfee96b2e72263`.

### Consume from Mathlib

- **Descent and fibred-category foundations.** `CategoryTheory.Functor.IsFibered`, the
  Grothendieck construction, bicategories and pseudofunctors, descent data, and
  [`Pseudofunctor.IsStack`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Sites/Descent/IsStack.html#CategoryTheory.Pseudofunctor.IsStack)
  are present. The latter deliberately permits arbitrary category-valued fibres; add the
  groupoid-valued condition needed here instead of defining a second stack predicate.
- **Sites of schemes.** Mathlib has the big étale, fppf, and fpqc topologies on `Scheme`, proves
  subcanonicity, and has small Zariski and étale sites
  (`AlgebraicGeometry/Sites/{Etale,Fpqc,Small}.lean`). These are the base sites for the stack
  layer, not themselves algebraic stacks or their lisse-étale sites.
- **Schemes and morphism properties.** Schemes, pullbacks, fibres, open and closed immersions,
  smooth, étale, unramified, flat, proper, finite-presentation, quasi-compact, separated, and
  descent/base-change APIs are available under `Mathlib/AlgebraicGeometry/`.
- **Sheaves of modules.** `Scheme.Modules` is an abelian category with pullback and pushforward.
  Mathlib defines quasi-coherent and finite-presentation sheaves locally by presentations and
  proves substantial affine-cover and pushforward results. It does not yet provide the full
  finite-locally-free, symmetric-algebra, or stack-level package needed for cones.
- **Homological algebra.** Mathlib has homological and homotopy categories, the triangulated
  derived category of an abelian category, bounded variants, Ext, derived functors, shifts,
  truncations, and distinguished triangles. The derived tensor product, derived internal Hom,
  perfect-complex/Tor-amplitude package for scheme or stack modules, and geometric cotangent
  complex remain to be built.
- **Kähler and presentation-level cotangent theory.** `RingTheory/Kaehler/*` and
  `RingTheory/Extension/Cotangent/*` contain Kähler differentials and the naive complex
  `I/I² → S ⊗ Ω`, together with functoriality and flat-base-change results. This is an affine
  input and a test oracle; it is not Illusie's cotangent complex on a scheme or stack.
- **Ideals, graded algebra, and `Proj`.** Ideal sheaves and closed subschemes, graded algebras,
  projective spectra, and `RingTheory.ReesAlgebra.reesAlgebra` are present. They do not yet form
  the conormal algebra, relative normal cone, blowup, or deformation-to-the-normal-cone API.
- **Raw scheme cycles on Tau Ceti's pin.** Mathlib PR
  [#37901](https://github.com/leanprover-community/mathlib4/pull/37901) introduced
  `AlgebraicGeometry.AlgebraicCycle`, locally finite functions on scheme points with a
  quasi-compact pushforward. It is available at Tau Ceti's pin, though not at this roadmap
  repository's older build pin. It supplies cycle data, not dimension-graded cycle groups,
  rational equivalence, Chow groups, pullback, or Gysin maps.

### Consume and coordinate with Tau Ceti

- The [Jacobian challenge](../JacobianChallenge/README.md) owns the existing line-bundle and
  divisor lane. Tau Ceti already has site-level and scheme-level invertible sheaves and a
  substantial scheme Weil-divisor API under `TauCeti/AlgebraicGeometry/{LineBundle,WeilDivisor}`.
  The intersection-theory layer extends these objects to Cartier divisors, Chern classes, and
  rational equivalence; it must not create parallel notions of line bundle or codimension-one
  cycle.
- Tau Ceti's `SchemeWeilDivisor.toAlgebraicCycle` already embeds finite codimension-one divisors
  into Mathlib's raw algebraic cycles. General cycle groups should make this the codimension-one
  comparison theorem and retain its coefficient/support API.
- The reductive-groups and Jacobian work both use fppf descent. General stack-level descent,
  torsors, and quotient stacks belong in neutral files and should be coordinated across those
  developments.

### Work already in motion

The audit found no open Tau Ceti issue, pull request, or public intention for algebraic stacks,
Chow groups, intrinsic normal cones, perfect obstruction theories, or virtual classes. It also
found no open Mathlib pull request directly implementing those objects.

Three narrower Mathlib pull requests should be followed:

- [#41556](https://github.com/leanprover-community/mathlib4/pull/41556) extends the Rees-algebra
  API used by normal cones and deformation to the normal cone;
- [#33369](https://github.com/leanprover-community/mathlib4/pull/33369) proves flat base change
  for Ext of finite modules over Noetherian rings, an affine input to the relative obstruction
  theory;
- [#33247](https://github.com/leanprover-community/mathlib4/pull/33247) relates cotangent-space
  dimension to the maximal ideal of a local ring; it is useful for local examples but is not a
  replacement for the cotangent complex.

Recheck Mathlib pull requests, Tau Ceti intentions, and the Lean Zulip before starting each of
the stack, intersection-theory, and cotangent-complex lanes. Follow landed APIs and coordinate
with their authors rather than vendoring snapshots of review branches.

## Inventory: what is missing

There is currently no Lean definition of an algebraic space or algebraic stack; no representable
morphism or quotient stack; no lisse-étale site or quasi-coherent sheaf theory on a stack; no
relative spectrum of a quasi-coherent algebra on a stack; no normal cone, deformation to the
normal cone, rational equivalence, Chow group, Chern class, or Gysin map; no geometric cotangent
complex; no perfect complex or global two-term resolution interface; no Picard/vector-bundle
stack `h¹/h⁰`; and no intrinsic normal cone, obstruction theory, or virtual fundamental class.
The summit therefore cannot be reached by stating one final `sorry`: every layer below is a
dependency of the displayed formula.

---

## The build, in layers

The main dependency lanes are:

```text
algebraic spaces and stacks
        ├── sheaves, vector bundles, and representable cones ── cone stacks ──┐
        ├── rational Chow and Gysin theory ───────────────────────────────────┤
        └── derived modules and the cotangent complex ── h¹/h⁰ ──────────────┤
                                                                              v
                      intrinsic normal cone → obstruction theories → VFC → relative VFC
```

Within a layer, prove the ordinary functorial and descent API before the named milestone. The
scheme cases are acceptance tests for the same definitions, not temporary substitutes which will
later be discarded.

### Layer 0: algebraic spaces, algebraic stacks, and quotient stacks

- Specialize Mathlib's category-valued pseudofunctor stack condition to pseudofunctors with
  groupoid fibres. Provide morphisms, invertible 2-morphisms, equivalences, strictification
  comparisons, and 2-fibre products. Relate this model to Mathlib's fibred categories through the
  Grothendieck construction.
- Build algebraic spaces as fppf sheaves of types with representable diagonal and a surjective
  étale scheme atlas. Develop their Yoneda embedding, fibre products, open/closed subspaces, and
  the scheme comparison. A scheme viewed as a space must recover Mathlib's morphisms and
  pullbacks without a second scheme API.
- Define representable morphisms of groupoid-valued stacks by all scheme base changes. Transfer
  properties of schemes and algebraic spaces—smooth, étale, unramified, flat, proper, separated,
  finite type/presentation, quasi-compact, local immersion, and regular immersion—to
  representable stack morphisms. Prove invariance under equivalence, composition, base change,
  and the relevant smooth/fppf descent statements.
- Define algebraic stacks by a representable diagonal and a smooth surjective scheme atlas, and
  Deligne–Mumford stacks by an étale surjective scheme atlas. Prove that an algebraic stack is
  Deligne–Mumford exactly when its diagonal is unramified. Develop diagonals, inertia,
  atlases, refinements, presentations by groupoids in algebraic spaces, and the underlying
  topological space.
- Define dimension and pure dimension of an algebraic stack by a smooth atlas with the relative
  dimension correction. Prove independence of atlas, compatibility with products and smooth
  maps, and `dim [U/G] = dim U - dim G` in the smooth-group case.
- Construct quotient stacks `[U/G]`, classifying stacks `BG`, torsor descriptions of their
  objects, and the quotient of an equivariant morphism. If `G` is a flat group algebraic space
  locally of finite presentation acting on an algebraic space `U`, prove `[U/G]` is algebraic.
  For finite étale `G`, prove `[U/G]` is Deligne–Mumford and separated when the action map is
  proper.

**Gate.** The 2-category contains schemes fully faithfully, has 2-pullbacks, and can state that a
cone or vector bundle over a Deligne–Mumford stack is acted on by another vector bundle and form
its quotient stack.

### Layer 1: modules, vector bundles, cones, and normal cones

- Construct the big fppf, lisse-étale, and—on a Deligne–Mumford stack—small étale sites, their
  structure sheaves, and the comparison morphisms of ringed topoi. Prove atlas descent for
  modules and identify the small-étale and lisse-étale quasi-coherent theories in the
  Deligne–Mumford case.
- Extend Mathlib's module-sheaf predicates to algebraic spaces and stacks: quasi-coherent,
  coherent, finite presentation, finite locally free of constant rank, and invertible. Build
  pullback, tensor product, dual, symmetric algebra, exterior powers, rank, and descent. Reuse
  Tau Ceti's invertible sheaves on schemes through comparison equivalences.
- Construct `Spec_X 𝒜` for a quasi-coherent `𝒪_X`-algebra, with its universal property and
  compatibility with arbitrary base change. Treat graded algebras, relative `Proj`, and the
  affine morphism represented by a symmetric algebra.
- Define graded cones, their vertices and contraction actions; cone morphisms; closed subcones;
  products; and abelian hulls. For a coherent sheaf `ℱ`, construct
  `C(ℱ) = Spec_X Sym(ℱ)` and prove its functor of points. Prove that `C(ℱ)` is a vector bundle
  exactly when `ℱ` is finite locally free, with the expected rank and smoothness.
- For a closed immersion `i : X ↪ Y` with ideal sheaf `I`, construct the conormal algebra
  `⊕_{m≥0} I^m/I^{m+1}`, normal cone `C_{X/Y}`, and normal sheaf
  `N_{X/Y} = C(I/I²)`. Prove base change under flat maps, products, the abelian-hull map
  `C_{X/Y} ↪ N_{X/Y}`, and equality for regular immersions.
- Develop exact sequences of cones under a smooth ambient morphism and the action of
  `T_M|_X` on `C_{X/M}`. Construct the Rees-algebra deformation to the normal cone, its generic
  fibre and special fibre, and compatibility with smooth base change.

**Gate.** For an affine presentation `X = Spec(B/I) ↪ Spec B`, the geometric definitions reduce
to the associated graded ring `⊕ I^m/I^{m+1}` and the conormal module `I/I²`; regular sequences
give the expected normal bundle.

### Layer 2: rational Chow theory and Gysin maps

This lane can proceed alongside Layers 1, 3, and 4, but the virtual class cannot begin until its
zero-section Gysin map is complete.

- Extend Mathlib's `AlgebraicCycle` into dimension-graded cycle groups on locally Noetherian
  schemes and algebraic spaces. Define integral closed subspaces, fundamental cycles,
  coefficients, locally finite sums, proper pushforward with residue degrees, flat pullback with
  multiplicities, and exterior products. Prove functoriality, localization, and compatibility
  with Tau Ceti's Weil divisors in codimension one.
- Define rational equivalence from principal divisors on integral substacks and form
  `A_i(-)_ℚ`. Prove proper pushforward, flat pullback, exterior products, and localization descend
  to Chow groups. Keep track of hypotheses—representability, relative dimension, and properness—
  in the morphism, not in ad hoc versions of the operations.
- Build Vistoli's rational Chow groups for separated Deligne–Mumford stacks, with cycles on
  integral closed substacks and the stabilizer/residue-degree factors required for pushforward.
  Prove independence of an atlas and agreement with the scheme and algebraic-space definitions.
  For `[U/G]` with finite `G`, compare with equivariant cycles and verify the expected
  `1/|G|` degree of `BG` when `G` is constant.
- Prove vector-bundle homotopy invariance, define the zero-section Gysin inverse, and develop
  Chern classes via the projective-bundle formula. Include Whitney sum, pullback, top Chern
  classes, and `0_E^! 0_{E*}[X] = c_top(E) ∩ [X]`.
- Construct refined Gysin pullback for a regular immersion through deformation to the normal
  cone. Prove base change, excess intersection, composition, compatibility with flat pullback
  and proper pushforward, and the self-intersection formula.
- Build the bivariant groups and orientations needed by Behrend–Fantechi. Formalize Vistoli's
  canonical rational equivalence comparing normal cones after a regular-immersion base change,
  prove smooth-base-change compatibility, and prove its invariance under the tangent-bundle
  actions used to descend it from presentations.

**Gate.** For every vector bundle `E → X` on a separated Deligne–Mumford stack there is a
grading-correct map `0_E^! : A_{i+rank E}(E)_ℚ → A_i(X)_ℚ`, and the map is invariant under
isomorphism of vector bundles and compatible with the cartesian squares used later.

### Layer 3: derived modules, perfect complexes, and the cotangent complex

- Equip derived categories of module sheaves with derived pullback, derived tensor product,
  derived internal Hom, duality against `𝒪_X`, cohomology objects, truncations, and Ext. Prove
  their pseudofunctoriality under stack morphisms and comparison across the small étale and big
  fppf sites.
- Define perfect complexes and perfect/Tor amplitude in `[a,b]` locally on an atlas. Develop
  finite locally free resolutions, duals, ranks as locally constant integers, direct sums,
  pullback, shifts, cones, and the two-out-of-three results used in distinguished triangles.
  Define a global two-term resolution as an isomorphism
  `[F⁻¹ → F⁰] ≅ E` in the derived category, not as equality of chosen complexes.
- Construct the full cotangent complex `L_{B/A}` of rings, compare its `[-1,0]` truncation with
  Mathlib's presentation complex, and prove Jacobi–Zariski/transitivity, derived base change,
  localization, and the smooth, étale, unramified, and local-complete-intersection criteria.
- Globalize to schemes and algebraic spaces on the small étale site, then descend along an étale
  atlas to a Deligne–Mumford stack. Prove functoriality, the transitivity triangle
  `f*L_Y → L_X → L_{X/Y} →`, flat base change, and compatibility with atlases.
- For a local embedding `U ↪ M` with `M` smooth, construct the canonical comparison
  `L_X|_U → [I/I² → Ω_M|_U]` and prove that it is an isomorphism on `H⁰` and `H⁻¹`. Prove
  `L_X` satisfies Behrend–Fantechi's coherence condition and has amplitude `[-1,0]` exactly in
  the local-complete-intersection case.
- Prove the deformation theorem for square-zero extensions: the obstruction to lifting a map is
  in `Ext¹(g*L_X,J)`; its vanishing is equivalent to existence; lifts and automorphisms are
  governed by the adjacent Ext groups. State it for the lifting groupoid so stack
  automorphisms are not erased.

**Gate.** The local embedding complex agrees with the affine Kähler/presentation API, and all
comparison morphisms commute with refinement of étale charts in the derived category.

### Layer 4: cone stacks and the `h¹/h⁰` construction

- Define an action of a vector bundle `E` on a cone `C`, the quotient stack `[C/E]`, and its
  vertex and `𝔸¹`-action. Develop equivariant morphisms, homotopies, quotient 2-morphisms, and
  the cartesian/surjectivity criterion for two quotient presentations to define equivalent cone
  stacks.
- Define cone stacks, abelian cone stacks, vector-bundle stacks, abelian hulls, actions of a
  vector-bundle stack, and short exact sequences. Prove that fibre products and quotients remain
  cone stacks and that exactness is local on the base.
- For a two-term complex of abelian sheaves `E⁰ → E¹`, construct the Picard stack
  `h¹/h⁰(E) = [E¹/E⁰]`. Show that a chain homotopy induces a specified 2-isomorphism and a
  quasi-isomorphism induces an equivalence. Extend the construction to derived objects by
  truncation and prove independence of resolutions.
- For a derived `𝒪_X`-complex `E` satisfying `Hⁱ(E)=0` for `i>0` and coherent `H⁰,H⁻¹`, construct
  the abelian cone stack `h¹/h⁰((E_fl)∨)`. Prove it is a vector-bundle stack when `E` is perfect
  of amplitude `[-1,0]`.
- Prove the cohomological criterion for a morphism `φ : E → L` to induce a representable map,
  closed immersion, or equivalence of the dual `h¹/h⁰` stacks. Turn a distinguished triangle
  with perfect third term into a short exact sequence of abelian cone stacks.

**Gate.** A global resolution `[F⁻¹ → F⁰] ≃ E` yields the quotient presentation
`h¹/h⁰(E∨) ≃ [(F⁻¹)∨/(F⁰)∨]`, functorially up to the required 2-isomorphism.

### Layer 5: the intrinsic normal sheaf and cone

- For a Deligne–Mumford stack `X`, define
  `𝔑_X = h¹/h⁰((L_X,fl)∨)`. For every affine étale chart `U → X` and local embedding
  `U ↪ M` into a smooth affine scheme, prove the presentation
  `𝔑_X|_U ≃ [N_{U/M}/T_M|_U]`.
- Define the category of local embeddings and common refinements. Prove that under a refinement
  `(U',M') → (U,M)`, the pair `(C_{U/M} ↪ N_{U/M})|_{U'}` is the quotient of
  `(C_{U'/M'} ↪ N_{U'/M'})` by `T_{M'/M}|_{U'}`.
- Glue `[C_{U/M}/T_M|_U]` inside the already intrinsic `𝔑_X`; prove cocycle coherence and
  uniqueness. Call the result `𝔠_X`. The construction must be unchanged under equivalence of
  Deligne–Mumford stacks and scalar extension of the ground field.
- Prove `𝔠_X` is pure of stack-dimension zero and its abelian hull is `𝔑_X`. Prove the local
  complete intersection characterization `𝔠_X = 𝔑_X`, the smooth specialization
  `𝔠_X = B T_X`, and the product formula.
- Prove the intrinsic pullback sequence for a local complete intersection morphism
  `f : X → Y` and the natural maps between intrinsic cones in the cartesian situations used by
  the functoriality theorem.

**Gate.** Recomputing `𝔠_X` from two unrelated atlases gives canonically equivalent closed cone
substacks of `𝔑_X`, and the comparison satisfies the cocycle condition rather than merely
existing noncanonically.

### Layer 6: obstruction theories and their deformation meaning

- Define an obstruction theory `φ : E → L_X` by the two cohomological conditions
  `H⁰(φ)` is an isomorphism and `H⁻¹(φ)` is an epimorphism. Prove this is equivalent to the
  induced map `𝔑_X → h¹/h⁰(E∨)` being a representable closed immersion.
- Define the obstruction cone as the image of `𝔠_X` in `h¹/h⁰(E∨)` and prove it is a closed
  pure-zero-dimensional cone stack. Prove invariance under isomorphism of obstruction theories
  in the derived category.
- Connect the definition to square-zero deformation theory. For `g : T → X` and an extension
  `T ↪ T̄` with ideal `J`, identify the obstruction class obtained from `E`; prove it vanishes
  exactly when a lift exists and identify the lift groupoid with the corresponding torsor of
  trivializations of the cone-stack obstruction.
- Define perfect obstruction theories by amplitude `[-1,0]`, prove their obstruction targets
  are vector-bundle stacks, and define virtual rank. Develop pullback, external direct sum, and
  compatibility data given by a morphism of distinguished triangles.
- Define `HasGlobalTwoTermResolution E` and show it is stable under the pullbacks, external sums,
  and comparison constructions used below. Do not make it a field of `PerfectObstructionTheory`.
- At a geometric point, identify the coarse intrinsic normal space as a universal obstruction
  space and prove the curvilinear-obstruction characterization by the fibre of `𝔠_X`. This is the
  local check that the intrinsic cone records actual obstructions rather than only tangent-space
  dimensions.

### Layer 7: construction and independence of the virtual class

- Let `φ : E → L_X` be perfect of constant virtual rank `n`, and choose a global resolution
  `F• = [F⁻¹ → F⁰] ≃ E`. Form the vector-bundle stack
  `𝔈 = h¹/h⁰(E∨)`, the vector bundles `F₀=(F⁰)∨`, `F₁=(F⁻¹)∨`, and the closed cone
  `C(F•) = 𝔠_X ×_𝔈 F₁ ↪ F₁`.
- Prove `C(F•) → 𝔠_X` is smooth of relative dimension `rank F₀`, hence `C(F•)` is pure of
  dimension `rank F₀`. Define
  `[X,φ]vir = 0_F₁^![C(F•)]` and verify that its dimension is
  `rank F₀-rank F₁ = rank E = n`.
- Given two global resolutions, construct a common dominating resolution and use smooth
  pullback plus zero-section Gysin compatibility to prove equality of the resulting classes.
  Upgrade this to invariance under derived isomorphism of obstruction theories and under
  equivalence of Deligne–Mumford stacks.
- Define the class noncomputably from the mere existence of a global resolution, with the
  independence theorem as its choice-independence proof. Also expose a theorem evaluating the
  intrinsic definition using any supplied resolution, so downstream proofs can calculate.
- Prove the no-obstruction theorem: if `H⁻¹(E)=0` and `H⁰(E)` is locally free, then `X` is
  smooth and `[X,φ]vir=[X]`. If `X` is smooth with locally free obstruction
  sheaf `Ob = H¹(E∨)`, prove `[X,φ]vir = c_top(Ob) ∩ [X]`.
- For a local complete intersection, prove that the canonical obstruction theory `L_X → L_X`
  is perfect, is globally resolvable whenever a global smooth embedding supplies the resolution,
  and gives the ordinary fundamental class. Prove the product formula for external sums.
- For proper `X` and virtual dimension zero, define `deg [X,φ]vir ∈ ℚ` and prove invariance under
  proper equivalence. Keep this numerical operation downstream of the class construction.

### Layer 8: compatible pullback and functoriality

- In a cartesian square with a local complete intersection morphism on the base, define
  compatibility of obstruction theories by a morphism between the transitivity distinguished
  triangles. Prove that it yields the exact sequence of vector-bundle stacks required by the
  cone comparison.
- For a smooth base morphism, identify the pulled-back intrinsic and obstruction cones and prove
  the virtual pullback formula directly from flat pullback and zero-section Gysin.
- For a regular local immersion between smooth bases, descend Vistoli's canonical rational
  equivalence through the tangent and vector-bundle actions, lift it to the global resolutions,
  and prove the refined Gysin formula.
- Factor a morphism between smooth bases through its graph and a projection to obtain the full
  Behrend–Fantechi functoriality statement under compatible perfect obstruction theories.
- Prove compatibility with products, composition of compatible squares, and replacement of any
  square or triangle by an isomorphic one. These coherence results are required before the
  theorem can safely serve downstream moduli constructions.

### Layer 9: the relative intrinsic cone and virtual class

- For `f : X → Y` of relative Deligne–Mumford type, define
  `𝔑_{X/Y} = h¹/h⁰((L_{X/Y})∨)` and construct `𝔠_{X/Y}` from local embeddings into schemes
  smooth over `Y`. When `Y` is smooth and pure of dimension `d`, prove `𝔠_{X/Y}` is pure of
  dimension `d`.
- Define relative obstruction theories `E → L_{X/Y}`, perfectness, global resolution, and
  constant virtual rank exactly as in the absolute case. For separated Deligne–Mumford `X`,
  construct `[X/Y,φ]vir ∈ A_{d+rank E}(X)_ℚ`.
- For a cartesian base change `Y' → Y`, construct
  `𝔠_{X'/Y'} → 𝔠_{X/Y} ×_Y Y'`; prove it is a closed immersion in general and an equivalence
  for flat base change. Deduce the flat virtual-pullback theorem.
- Use deformation to the normal cone and Vistoli's rational equivalence to prove regular-
  immersion base change. Prove the relative no-obstruction, obstruction-bundle, and product
  formulas.
- State and prove relative compatibility through a morphism of transitivity triangles and the
  corresponding functoriality theorem. Recover the absolute theory by taking
  `Y = Spec k`, with a theorem identifying the two classes.
- In a cartesian diagram `X = Y ×_W V` with `V,W` smooth and the horizontal maps local
  immersions, prove that `j*L_{V/W} → L_{X/Y}` is a relative perfect obstruction theory and
  that its virtual class agrees with the classical normal-cone/zero-section intersection.

## Acceptance criteria and worked examples

Build these examples with the layers. They are tests of signs, descent, stabilizer factors, and
the distinction between actual and virtual dimension.

- **Affine normal cone.** For `X = Spec(B/I) ↪ Spec B`, compute
  `C_{X/B} = Spec_X(⊕ I^m/I^{m+1})` and `N_{X/B}=Spec_X Sym(I/I²)`. For a regular sequence the
  comparison is an isomorphism. As a strict nonregular test, take
  `B=k[x,y]/(xy)` and `I=(x,y)`: the normal cone is `Spec k[a,b]/(ab)`, a proper closed subcone
  of the normal sheaf `Spec k[a,b]`.
- **Smooth schemes and stacks.** For smooth `X`, verify
  `𝔑_X = 𝔠_X = B T_X` and the canonical obstruction theory yields `[X]`. For a finite étale
  group `G`, verify the same statement on `BG` and obtain its rational fundamental class.
- **Quotient descent.** If a finite étale group `G` acts on `U`, identify
  `𝔠_[U/G]` with `[𝔠_U/G]` equivariantly and show that a `G`-equivariant obstruction theory on
  `U` gives the descended virtual class on `[U/G]` with the correct stabilizer weighting.
- **Zero locus of a section.** For a section `s` of a rank-`r` vector bundle `V → M` on a
  smooth `m`-fold, give its zero scheme the standard obstruction theory
  `[V∨|_X → Ω_M|_X]`. Prove the virtual dimension is `m-r`, its virtual class is the refined
  zero-section pullback, and its pushforward to `M` is `c_r(V)∩[M]`. When `s` is regular this
  is `[X]`; when `s=0`, the underlying scheme remains `M` while the virtual class is
  `c_r(V)∩[M]`.
- **Resolution independence.** Add an acyclic vector-bundle summand `[K ≅ K]` to a global
  resolution. Compute both cone presentations and prove the zero-section classes agree. This is
  the smallest executable test of Proposition 5.3.
- **Products.** Check the class of the product of two zero loci equals the exterior product of
  their virtual classes and that virtual dimensions add.
- **Flat and regular base change.** Test flat field extension and the pullback along a regular
  divisor. The two routes—base-changing the obstruction theory first or applying the bivariant
  class to the virtual cycle—must agree.
- **A fibre of a smooth-ambient morphism.** For a fibre product of smooth stacks as in the final
  Layer 9 item, compute the relative virtual class both from `j*L_{V/W}` and from the ordinary
  normal cone; prove equality.
- **Proper virtual dimension zero.** On a proper zero-dimensional scheme which is a local
  complete intersection, the degree of the virtual class agrees with the ordinary
  scheme-theoretic length after rationalization.

## Ordering and work packages

- Layer 0 is the common prerequisite. Its algebraic-space portion and groupoid-valued stack
  portion can be developed by separate contributors once their shared representability interface
  is fixed.
- Layers 1, 2, and 3 are the three long independent lanes. Layer 4 consumes Layers 0–3 only
  through the sheaf, quotient-stack, and derived-duality interfaces named above.
- Layer 5 consumes normal cones from Layer 1, `h¹/h⁰` from Layer 4, and stack dimension from
  Layer 0. It does not depend on Chow theory.
- Layer 6 consumes the intrinsic cone and cotangent deformation theory. Layer 7 is the first point
  where the completed Chow/Gysin lane is mandatory.
- Layers 8 and 9 consume all three lanes and should begin only after the absolute class and its
  resolution-independence theorem pass the worked examples.

Register separate intentions for narrow foundations—for example, algebraic spaces, stack sites,
scheme Chow groups, zero-section Gysin, the geometric cotangent complex, cone stacks, or the
intrinsic-cone gluing—rather than claiming the whole roadmap. Before implementing a general
foundation, recheck whether Mathlib or another Tau Ceti roadmap has acquired it.

## Boundary of this roadmap

This roadmap constructs the classical Chow-valued Behrend–Fantechi class and its relative
version. It does not construct a particular moduli stack of stable maps or sheaves, prove that
such a moduli stack is proper, or derive Gromov–Witten or Donaldson–Thomas invariants. Those are
downstream projects which must separately build the moduli object and its perfect obstruction
theory.

It also does not remove the global-resolution hypothesis by developing Chow groups for arbitrary
Artin vector-bundle stacks; construct virtual structure sheaves in `K`-theory; introduce derived
algebraic stacks; or build cosection-localized, reduced, logarithmic, equivariant, or symmetric
virtual cycles. These are later extensions. The interfaces here should not obstruct them: the
intrinsic cone, obstruction theory, and classical class remain separate objects, and the global
resolution appears as a premise only at the Chow-valued construction step.

## References

- K. Behrend and B. Fantechi,
  [*The intrinsic normal cone*](https://doi.org/10.1007/s002220050136), Invent. Math. 128
  (1997), 45–88; [arXiv version](https://arxiv.org/abs/alg-geom/9601010). This is the
  specification for cone stacks, `h¹/h⁰`, the intrinsic cone, obstruction theories, the global-
  resolution construction, and the absolute and relative properties.
- A. Vistoli,
  [*Intersection theory on algebraic stacks and on their moduli spaces*](https://doi.org/10.1007/BF01388892),
  Invent. Math. 97 (1989), 613–670, for rational Chow and bivariant theory on
  Deligne–Mumford stacks and the canonical rational equivalence used in functoriality.
- W. Fulton, *Intersection Theory*, 2nd ed., Springer, 1998, Chapters 1–6, for rational
  equivalence, Chern classes, deformation to the normal cone, and refined Gysin maps.
- L. Illusie,
  [*Complexe cotangent et déformations I*](https://doi.org/10.1007/BFb0059052) and II,
  Lecture Notes in Mathematics 239 and 283, for the cotangent complex, transitivity, perfect
  amplitude, and square-zero deformation theory.
- G. Laumon and L. Moret-Bailly, *Champs algébriques*, Ergebnisse der Mathematik 39,
  Springer, 2000, for algebraic stacks, quotient presentations, sites, and sheaves.
- The Stacks Project: [algebraic stacks](https://stacks.math.columbia.edu/tag/026N),
  [properties of algebraic stacks](https://stacks.math.columbia.edu/tag/04X8),
  [lisse-étale and flat-fppf sites](https://stacks.math.columbia.edu/tag/08MZ),
  [the cotangent complex](https://stacks.math.columbia.edu/tag/08P5),
  [Chow homology and Chern classes](https://stacks.math.columbia.edu/tag/02P3), and
  [Chow groups of algebraic spaces](https://stacks.math.columbia.edu/tag/0EDR).
