# Roadmap: the Behrend–Fantechi virtual fundamental class

**Summary.** The roadmap develops the construction in Behrend and Fantechi's
[*The intrinsic normal cone*](https://arxiv.org/abs/alg-geom/9601010): from a perfect
obstruction theory on a Deligne–Mumford stack, construct a cycle class of the expected
dimension even when the stack itself has components of the wrong dimension. The construction
has three genuinely independent inputs which must all be formalized: the intrinsic normal cone,
the embedding of that cone into the vector-bundle stack supplied by the obstruction theory, and
the zero-section Gysin map in rational Chow theory. This roadmap builds all three and proves
that the resulting class is independent of every local embedding and global resolution used to
construct it.

The first summit follows the hypotheses of the original paper rather than silently importing a
broader generalization. Thus `X` is a separated Deligne–Mumford stack, locally of finite type over
a field; the perfect obstruction theory has amplitude `[-1, 0]`, constant virtual rank, and a
global two-term resolution by finite-rank vector bundles. Work on stacks with the resolution
property for the global comparison, and place the answer in the
dimension-graded rational Chow group of `X`. Properness is not needed to construct the class.
It enters only when taking the degree of a zero-dimensional class. The relative construction
over a pure-dimensional algebraic stack extends the construction to relative obstruction theories.

Suggested homes:

- `TauCeti/AlgebraicGeometry/Stack/` for stack dimension, the lisse-étale and small étale sites,
  relative spectra over stacks, and the stack extensions of vector bundles and cones;
- `TauCeti/AlgebraicGeometry/Chow/` for rational Chow groups, bivariant classes,
  and Gysin maps on Deligne–Mumford stacks;
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
   `φ : E → L_X` in the derived category, where `Hⁱ(E)=0` for `i>0` and `H⁰(E)` and
   `H⁻¹(E)` are coherent, inducing an isomorphism on `H⁰` and a surjection on `H⁻¹`. Prove the equivalent closed-immersion statement
   `𝔑_X ↪ h¹/h⁰(E∨)` and the square-zero deformation interpretation. Define perfectness by
   perfect amplitude in `[-1, 0]`; keep the existence of a global resolution as a separate
   hypothesis.
3. **The virtual fundamental class.** If `X` is separated, `φ` is perfect of constant rank
   `n`, and `X` has the resolution property and `E` a global resolution, construct
   `[X, φ]vir ∈ A_n(X)_ℚ`. The class depends on the obstruction theory in the derived category,
   not on a chosen complex, chart, presentation of a cone stack, or global resolution.
4. **The basic properties.** Prove the no-obstruction, locally-free-obstruction, local complete
   intersection, product, and compatible Gysin-pullback formulas of Behrend–Fantechi §5.
   Recover the ordinary fundamental class for a pure-dimensional local complete intersection with
   the resolution and class hypotheses, equipped with its
   cotangent-complex obstruction theory.
5. **The relative construction.** For a morphism `f : X → Y` of relative
   Deligne–Mumford type over a pure-dimensional algebraic stack `Y` of dimension `d`, construct
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

## Conventions

Use quasi-separated algebraic stacks as in Behrend–Fantechi §1. Use finite type over the
field for Chow class constructions, and local finite type for the local cone and site constructions.

- **Cohomological grading and signs.** Complexes are cohomologically graded. A two-term
  obstruction complex is `[E⁻¹ → E⁰]`; its virtual rank is
  `rank(E⁰) - rank(E⁻¹)`. After derived duality set
  `E₀ = (E⁰)∨` and `E₁ = (E⁻¹)∨`, so `h¹/h⁰(E∨) = [E₁/E₀]`. Never reverse this quotient or
  define virtual dimension as the rank of the obstruction bundle alone.
- **Dimension grading.** Write `A_i(X)_ℚ` for cycles of dimension `i` modulo rational
  equivalence, tensored with `ℚ`. Provide codimension notation for pure-dimensional stacks; the virtual class is natively dimension-graded. A pure-dimensional stack of
  negative dimension, such as a vector-bundle stack, is legitimate.
- **The classical global-resolution hypothesis is visible.** Perfectness and existence of a global two-term resolution are distinct conditions. A perfect complex is only locally a
  bounded complex of vector bundles; that does not supply the global presentation used by the
  original Chow-theoretic construction.
- **The virtual class does not require properness.** Properness is a hypothesis on the
  degree or pushforward operation, never a field of an obstruction theory and never a premise of
  construction of the virtual class itself.
- **Stacks are groupoid-valued fppf stacks.** Use the carriers from
  `SchemeAndStackFoundations` Layer 1. An algebraic stack has diagonal representable by algebraic
  spaces and a smooth surjective scheme atlas; a Deligne–Mumford stack has an étale surjective
  scheme atlas. Do not identify a stack with a chosen presentation groupoid.
- **Use genuine 2-categorical pullbacks.** Quotient stacks, diagonals, atlases, base change, and
  local embeddings carry specified 2-cells. Any strict model must be accompanied by comparison
  equivalences proving that the exported object is independent of strictification choices.
- **Keep the two sites distinct.** Cone stacks and torsors naturally live over the big fppf
  site; `L_X`, coherent complexes, and the original obstruction theory live on the small étale
  site of a Deligne–Mumford stack. Construct the morphism of ringed topoi and the comparison
  functors used in `h¹/h⁰((E_fl)∨)` rather than treating the sites as definitionally equal.
- **Cone means graded affine cone.** A cone over `X` is the relative spectrum of a graded
  quasi-coherent `𝒪_X`-algebra `S` with `S₀ = 𝒪_X`, coherent `S₁`, and generated by `S₁`,
  with its vertex and `𝔸¹`-action. In particular `X ⊔ X` and `𝔸^∞_X` are not cones in this sense. An
  abelian cone is `C(ℱ) = Spec_X Sym(ℱ)` for a coherent sheaf `ℱ`. A vector bundle is the
  abelian cone of a finite locally free dual.
- **Cone stacks remember their action.** A cone stack is locally a quotient `[C/E]` of a cone
  by a vector bundle acting compatibly with contraction. Its `𝔸¹`-action, vertex, morphisms, and
  coherence 2-cells are structure, not comments. In particular, spell out the coherence axioms
  which the original paper leaves to the reader.
- **Obstruction theories are morphisms, not pairs of sheaves.** The morphism
  `E → L_X` in the derived category and its homotopy class are essential. Kernel and cokernel
  data alone cannot state transitivity, compatibility, or the relative functoriality theorem.
  This derived morphism is distinct from the obstruction theories of deformation functors in
  `SchemeAndStackFoundations` §4.5.
- **Rational coefficients are deliberate.** The first summit follows Vistoli's rational
  intersection theory for separated Deligne–Mumford stacks. Do not promise integral stack Chow
  groups while silently dividing by stabilizer orders.
- **No chosen atlas leaks into the API.** Atlases and local embeddings are proof data used to
  construct stack objects. The exported intrinsic cone, Chow class, and comparison maps are
  invariant under refinement and equivalence.

## Exact supplier contracts

The dependency manifests pin Mathlib and Tau Ceti. This roadmap uses the APIs at those pins. The shared Tau Ceti roadmaps below
own the foundational carriers; this roadmap imports their results and does not define competing
scheme-level versions.

### From Mathlib

- **Descent and fibred-category foundations.** `CategoryTheory.Functor.IsFibered`, the
  Grothendieck construction, bicategories and pseudofunctors, descent data, and
  [`Pseudofunctor.IsStack`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/CategoryTheory/Sites/Descent/IsStack.html#CategoryTheory.Pseudofunctor.IsStack)
  are present. The latter permits category-valued fibres; use `StackInGroupoids` from
  `SchemeAndStackFoundations` §1.18 for the groupoid-valued condition.
- **Sites of schemes.** Mathlib has the big étale, fppf, and fpqc topologies on `Scheme`, proves
  subcanonicity, and has small Zariski and étale sites
  (`AlgebraicGeometry/Sites/{Etale,Fpqc,Small}.lean`). These are the base sites for the stack
  layer, not themselves algebraic stacks or their lisse-étale sites.
- **Schemes and morphism properties.** Schemes, pullbacks, fibres, open and closed immersions,
  smooth, étale, unramified, flat, proper, finite-presentation, quasi-compact, separated, and
  descent/base-change APIs are available under `Mathlib/AlgebraicGeometry/`.
- **Sheaves of modules.** `Scheme.Modules` is an abelian category with pullback and pushforward.
  Mathlib defines quasi-coherent and finite-presentation sheaves locally by presentations and
  proves substantial affine-cover and pushforward results. The Tau Ceti roadmaps below extend this
  input to the finite-locally-free, relative-spectrum, and stack-level packages used here.
- **Homological algebra.** Mathlib has homological and homotopy categories, the triangulated
  derived category of an abelian category, bounded variants, Ext, derived functors, shifts,
  truncations, and distinguished triangles. `EnhancedDerivedSheaves` §0.3 and E1.8 specify
  derived tensor, internal Hom and perfect complexes; `DerivedModuleAlgebra` §0.4 specifies
  the affine cotangent complex. This roadmap extends the required geometry to stacks.
- **Kähler and presentation-level cotangent theory.** `RingTheory/Kaehler/*` and
  `RingTheory/Extension/Cotangent/*` contain Kähler differentials and the naive complex
  `I/I² → S ⊗ Ω`, together with functoriality and flat-base-change results. This is an affine
  input and a test oracle; it is not Illusie's cotangent complex on a scheme or stack.
- **Ideals, graded algebra, and `Proj`.** Ideal sheaves and closed subschemes, graded algebras,
  projective spectra, and `reesAlgebra` are present. They do not yet form
  the conormal algebra, relative normal cone, blowup, or deformation-to-the-normal-cone API.
- **Raw scheme cycles.** `AlgebraicGeometry.AlgebraicCycle` gives locally finite functions on
  scheme points with quasi-compact pushforward.

### From Tau Ceti

- Tau Ceti supplies
  `TauCeti.AlgebraicGeometry.Chow.ChowGroup` and `Chow.pushforward` for closed immersions,
  as well as `SchPseudofunctor` and `Spaces.IsAlgebraicSpace`. The remaining scheme Chow and
  Gysin theory is owned by `SchemeAndStackFoundations` Layer 5.

### From other Tau Ceti roadmaps

- [`SchemeAndStackFoundations`](../SchemeAndStackFoundations/README.md) Layer 1 owns descent,
  algebraic spaces, stacks in groupoids, algebraic and Deligne–Mumford stacks, representable
  morphisms, 2-fibre products, quotient stacks, and quasi-coherent modules on stacks. Its Layer 5
  owns dimension-graded cycle groups, rational equivalence, Chow groups, Chern classes, normal
  cones, deformation to the normal cone, and refined Gysin maps for schemes locally of finite
  type over a field.
- [`AlgebraicVectorBundles`](../AlgebraicVectorBundles/README.md) owns finite locally free sheaves,
  their tensor, dual, symmetric and exterior operations, relative spectra of quasi-coherent
  algebras, and geometric vector bundles on schemes. The scheme instances in this roadmap use
  those carriers and comparison theorems.
- [`DerivedModuleAlgebra`](../DerivedModuleAlgebra/README.md) §§0.1–0.17 and 0.25 own module
  derived tensor, the full cotangent complex of rings, transitivity, base change, localization,
  smooth and regular-quotient computations, and square-zero obstruction classes.
- [`EnhancedDerivedSheaves`](../EnhancedDerivedSheaves/README.md) Layers 0 and E1 own derived
  tensor and internal Hom on ringed sites, enhanced quasicoherent derived sheaves, and perfect
  complexes on schemes. This roadmap uses those constructions on the stack sites supplied below.
- [`DerivedDeRhamCohomology` §5.8](https://github.com/TauCetiProject/TauCetiRoadmap/pull/868)
  supplies the scheme cotangent complex. Layer 3 identifies its étale realization and supplies
  the algebraic space and stack extensions.
- The [Jacobian challenge](../JacobianChallenge/README.md) owns the line-bundle and divisor lane.
  Tau Ceti's `SchemeWeilDivisor.toAlgebraicCycle` is the codimension-one comparison used by
  `SchemeAndStackFoundations`; this roadmap does not introduce another divisor or line-bundle
  carrier.

## Scope and ownership

The supplier roadmaps do not specify stack dimension, the lisse-étale and small étale ringed
sites of a Deligne–Mumford stack and their comparison with the big fppf site, relative spectra and
cones over stacks, or Vistoli's rational Chow and bivariant theory for separated
Deligne–Mumford stacks. DerivedDeRhamCohomology supplies the scheme cotangent complex. This roadmap extends it to
algebraic spaces and stacks and constructs Picard and vector-bundle stacks, the intrinsic
normal cone, obstruction theories, and the virtual fundamental class. The layers below supply exactly these
extensions and then assemble the displayed formula. In particular, this roadmap supplies the
rational Chow groups, proper pushforward and Chern classes on separated smooth Deligne–Mumford
stacks used in StableReductionPartII. SchemeAndStackFoundations owns the underlying scheme
intersection theory.

This roadmap constructs the classical Chow-valued Behrend–Fantechi class and its relative
version. It does not construct a particular moduli stack of stable maps or sheaves, prove that
such a moduli stack is proper, or derive Gromov–Witten or Donaldson–Thomas invariants. Those are
downstream projects which must separately build the moduli object and its perfect obstruction
theory.

It also does not remove the global-resolution hypothesis by developing Chow groups for arbitrary
Artin vector-bundle stacks; construct virtual structure sheaves in `K`-theory; introduce derived
algebraic stacks; or build cosection-localized, reduced, logarithmic, equivariant, or symmetric
virtual cycles. Those constructions are outside this roadmap. The intrinsic cone, obstruction
theory, and classical class remain separate objects, and the global resolution appears as a
premise only at the Chow-valued construction step.

## How to read the build

The main dependency lanes are:

```text
shared stack, vector-bundle, scheme Chow, and derived foundations
        ├── stack sites and representable cones ───────────── cone stacks ───┐
        ├── rational Chow and Gysin theory for DM stacks ────────────────────┤
        └── geometric cotangent complexes on stacks ──────── h¹/h⁰ ─────────┤
                                                                             v
                      intrinsic normal cone → obstruction theories → VFC → relative VFC
```

Within a layer, prove the ordinary functorial and descent API before the named milestone. The
scheme cases are compatibility tests against the supplier roadmaps, not replacement definitions.

## Layer 0: shared stack foundations and stack dimension

### 0.1 Shared stack carriers

Import stacks in groupoids, 2-fibre products, representable morphisms, algebraic and
Deligne–Mumford stacks, atlases, quotient stacks, and quasi-coherent modules from
`SchemeAndStackFoundations` Layer 1. Every object and morphism in this roadmap uses those
carriers, including their specified 2-cells and equivalences.

*Needs:* SchemeAndStackFoundations Layer 1.

### 0.2 Dimension and pure dimension

Define dimension and pure dimension of a locally finite-type algebraic stack over a field by a
smooth scheme atlas with the relative-dimension correction. Prove independence of the atlas,
invariance under stack equivalence, and compatibility with open substacks, products, smooth
maps, and base-field extension.

*Needs:* SchemeAndStackFoundations Layer 1.

### 0.3 Quotient dimension

Prove `dim [U/G] = dim U - dim G` when the finite-type group scheme `G` acts on the finite-type scheme `U` (Stacks Project, Tags 0AFL–0AFR).
Include the negative-dimensional classifying-stack case.

*Needs:* SchemeAndStackFoundations Layer 1.

**Gate.** Stack dimension is independent of every atlas and gives the expected dimensions for
schemes, quotient stacks, and smooth morphisms.

### Examples

**Checks.**

- A smooth scheme has its usual Krull dimension.
- The classifying stack of the multiplicative group has dimension −1.
- In characteristic p, the classifying stack of μₚ has dimension zero.

### Dependencies

SchemeAndStackFoundations Layer 1.

## Layer 1: stack sites, representable cones, and normal cones

### 1.1 Ringed sites and comparison

Construct the lisse-étale site and, for a Deligne–Mumford stack, the small étale site, their
structure sheaves, and the morphisms to the big fppf ringed site used by
`SchemeAndStackFoundations` §1.22. Prove that quasi-coherent modules agree under these
comparisons and that the equivalences commute with pullback and atlas restriction.

*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.

### 1.2 Locally free sheaves

Extend the finite-presentation, finite-locally-free, dual, symmetric-algebra, and exterior-power
API from `AlgebraicVectorBundles` and `SchemeAndStackFoundations` to quasi-coherent modules on
algebraic spaces and stacks by descent. Prove that the restriction to a scheme is the supplied
scheme API.

*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.

### 1.3 Relative spectrum

Construct `Spec_X 𝒜` for a quasi-coherent algebra on an algebraic space or stack, with its
universal property and arbitrary base change. For a scheme, identify it with
`AlgebraicVectorBundles` L1A. Treat graded algebras and the affine morphism represented by a
symmetric algebra; relative `Proj` is not needed for this roadmap.

*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.

### 1.4 Graded and abelian cones

Define graded cones, vertices, contraction actions, cone morphisms, closed subcones, products,
and abelian hulls over algebraic spaces and stacks. For coherent `ℱ`, construct
`C(ℱ) = Spec_X Sym(ℱ)`. Identify the finite-locally-free case with the supplier's geometric
vector bundle on schemes and its descended stack version.

*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.

### 1.5 Normal cones and deformation

Import scheme normal cones and deformation to the normal cone from
`SchemeAndStackFoundations` §5.5. Extend their formation to representable closed immersions of
algebraic spaces and stacks by smooth descent. Prove flat base change, products, the closed map
`C_{X/Y} ↪ N_{X/Y}`, equality for regular immersions, and agreement with the scheme definition.

*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.

### 1.6 Smooth ambient comparison

Develop exact sequences of cones under a smooth ambient morphism and the action of
`T_M|_X` on `C_{X/M}`. Prove that these actions and sequences commute with smooth refinement of
the ambient presentation.

*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.

**Gate.** The stack definitions descend uniquely from smooth presentations and reduce on
`Spec(B/I) ↪ Spec B` to `⊕ I^m/I^{m+1}` and `I/I²`.

### Examples

**Checks.**

- The trivial rank-r bundle has affine r-space as each fibre and the origin as its vertex.
- The degree-zero algebra 𝒪 × 𝒪 and the symmetric algebra of a free module of infinite rank fail the cone conditions.
- The normal cone to the node at its origin is a proper closed subcone of its normal sheaf.

### Dependencies

Layer 0 and AlgebraicVectorBundles L1A–L2B.

## Layer 2: rational Chow theory and Gysin maps for Deligne–Mumford stacks

This lane consumes every scheme-level cycle, Chow, Chern, normal-cone, and Gysin carrier from
`SchemeAndStackFoundations` Layer 5. It adds the stack theory required by Behrend–Fantechi.

### 2.1 Rational Chow groups

Build Vistoli's dimension-graded rational Chow groups for separated Deligne–Mumford stacks,
with cycles on integral closed substacks and the stabilizer and residue-degree factors required
for pushforward. Prove atlas independence and agreement with the supplied scheme Chow groups.
For `[U/G]` with finite constant `G`, verify the `1/|G|` degree of `BG`.

*Needs:* Layer 1 and SchemeAndStackFoundations Layer 5.

### 2.2 Chow operations

Extend proper pushforward, flat pullback, localization, and exterior products to these rational
stack Chow groups. State representability, relative-dimension, separation, and properness
hypotheses on the morphisms, and prove agreement with the scheme operations. Construct the
cap action by operational Chow classes and prove the projection formula for proper pushforward,
including the first-Chern-class case needed for the Deligne pairing on smooth moduli stacks.

*Needs:* Layer 1 and SchemeAndStackFoundations Layer 5.

### 2.3 Homotopy invariance and Chern classes

Prove homotopy invariance for vector bundles on Deligne–Mumford stacks and define the zero-
section Gysin inverse. Descend the supplier's Chern classes and projective-bundle formula and
prove Whitney sum, pullback, the top-Chern formula, and
`0_E^! 0_{E*}[X] = c_top(E) ∩ [X]`.

*Needs:* Layer 1 and SchemeAndStackFoundations Layer 5.

### 2.4 Refined Gysin maps

Extend refined Gysin pullback to representable regular local immersions of
Deligne–Mumford stacks using Layer 1 and the supplied scheme deformation. Prove base change,
excess intersection, composition, proper-pushforward and flat-pullback compatibility, and the
self-intersection formula.

*Needs:* Layer 1 and SchemeAndStackFoundations Layer 5.

### 2.5 Bivariant orientations and comparison

Build the rational bivariant groups for morphisms of relative Deligne–Mumford type
to algebraic stacks, in the range of Behrend–Fantechi §7. Construct the flat orientation and
the regular-local-immersion orientation for representable morphisms of algebraic stacks,
acting on rational Chow groups after base change to separated finite-type Deligne–Mumford
test stacks whose pullbacks are separated. Prove compatibility with the scheme orientations.
Construct
Vistoli's canonical rational equivalence comparing normal cones after regular-immersion base
change, prove smooth-base-change compatibility, and prove invariance under the tangent-bundle
actions needed for descent from presentations.

*Needs:* Layer 1 and SchemeAndStackFoundations Layer 5.

**Gate.** For every rank-`r` vector bundle `E → X` on a separated Deligne–Mumford stack, there is
a grading-correct map `0_E^! : A_{i+r}(E)_ℚ → A_i(X)_ℚ`, invariant under bundle isomorphism and
compatible with the cartesian squares in Layers 7–9.

### Examples

**Checks.**

- The degree of the classifying stack of a finite constant group of order m is 1/m.
- The inverse to flat pullback for a trivial rank-r bundle sends its total-space fundamental class to the base fundamental class.
- The zero-section self-intersection of 𝒪(1) on the projective line is a point class.

### Dependencies

Layer 1 and SchemeAndStackFoundations Layer 5.

## Layer 3: geometric cotangent complexes and perfect complexes on stacks

### 3.1 Derived operations on stack sites

Instantiate the ringed-site tensor, internal Hom, pullback, duality, cohomology, truncation, and
Ext constructions from `EnhancedDerivedSheaves` on the sites of Layer 1. Prove
pseudofunctoriality under stack morphisms and comparison across the small étale, lisse-étale,
and big fppf sites. Construct arbitrary-morphism pullback on the quasi-coherent derived
categories by descent and site comparison; do not assume arbitrary stack morphisms induce
morphisms of lisse-étale topoi (Stacks Project, Tags 07BF and 0GR1).

*Needs:* Layer 1, DerivedModuleAlgebra, EnhancedDerivedSheaves and DerivedDeRhamCohomology §5.8.

### 3.2 Perfectness and global resolutions

Define perfect complexes and Tor amplitude `[a,b]` locally on an atlas. Descend finite locally
free resolutions, duals, ranks, direct sums, pullback, shifts, cones, and the two-out-of-three
properties from the scheme theory. Define a global two-term resolution as an isomorphism
`[F⁻¹ → F⁰] ≅ E` in the derived category, not as equality of chosen complexes.

*Needs:* Layer 1, DerivedModuleAlgebra, EnhancedDerivedSheaves and DerivedDeRhamCohomology §5.8.

### 3.3 Relative cotangent complexes

Consume the scheme cotangent complex from DerivedDeRhamCohomology §5.8 and compare its
Zariski and small étale realizations on schemes. Extend it to algebraic spaces by étale
descent. For a morphism of relative Deligne–Mumford type to an algebraic stack, construct
the relative cotangent complex using smooth atlases on the target and étale charts after
base change. Use flat base change and refinement coherence for descent, and prove vanishing
in positive degrees and coherence in degrees 0 and −1 for locally finite type morphisms
(Behrend–Fantechi §7). Prove functoriality and transitivity, including the triangle
`f*L_Y → L_X → L_{X/Y} →` on the common quasi-coherent derived category.

*Needs:* Layer 1, DerivedModuleAlgebra, EnhancedDerivedSheaves and DerivedDeRhamCohomology §5.8.

### 3.4 Local presentation

For a local embedding `U ↪ M` with `M` smooth, construct the canonical comparison
`L_X|_U → [I/I² → Ω_M|_U]` and prove that it is an isomorphism on `H⁰` and `H⁻¹`. Prove
`L_X` satisfies Behrend–Fantechi’s coherence condition (Illusie III, Cor. 3.1.3 for the
embedding comparison). For a local complete intersection, prove that `L_X` is perfect of
Tor amplitude `[-1,0]` (Stacks Project, Tag 08SL).

*Needs:* Layer 1, DerivedModuleAlgebra, EnhancedDerivedSheaves and DerivedDeRhamCohomology §5.8.

### 3.5 Square-zero lifting

Globalize `DerivedModuleAlgebra` §0.25 to square-zero extensions of schemes and stacks. For
`g : T → X`, put the obstruction in `Ext¹(g*L_X,J)`, characterize its vanishing, and describe
lifts and automorphisms by the adjacent Ext groups. State the result for the lifting groupoid.

*Needs:* Layer 1, DerivedModuleAlgebra, EnhancedDerivedSheaves and DerivedDeRhamCohomology §5.8.

**Gate.** The geometric complex agrees on affines with `DerivedModuleAlgebra`, its local embedding
model agrees with the Kähler presentation complex, and all comparisons commute with refinement of
étale charts.

### Examples

**Checks.**

- A finite locally free sheaf in degree zero has perfect amplitude [0,0].
- A perfect two-term complex has virtual rank equal to degree-zero rank minus degree-minus-one rank.
- The cotangent complex of Spec k over the classifying stack of the multiplicative group is one-dimensional in degree zero.

### Dependencies

Layer 1, DerivedModuleAlgebra, EnhancedDerivedSheaves and DerivedDeRhamCohomology §5.8.

## Layer 4: cone stacks and the `h¹/h⁰` construction

### 4.1 Quotient presentations

Define an action of a vector bundle `E` on a cone `C`, the quotient stack `[C/E]`, and its
vertex and `𝔸¹`-action. Develop equivariant morphisms, homotopies, quotient 2-morphisms, and
the cartesian/surjectivity criterion for two quotient presentations to define equivalent cone
stacks.

*Needs:* Layers 0, 1 and 3.

### 4.2 Cone stacks and exactness

Define cone stacks, abelian cone stacks, vector-bundle stacks, abelian hulls, actions of a
vector-bundle stack, and short exact sequences. Prove that fibre products and quotients remain
cone stacks and that exactness is local on the base. Define their dimension from local quotient
presentations and prove the expected rank formula for vector-bundle stacks.

*Needs:* Layers 0, 1 and 3.

### 4.3 The strictly commutative Picard stack

For a two-term complex of abelian sheaves `E⁰ → E¹`, construct the strictly commutative Picard stack
`h¹/h⁰(E) = [E¹/E⁰]`. Show that a chain homotopy induces a specified 2-isomorphism and a
quasi-isomorphism induces an equivalence. Extend the construction to derived objects by
truncation and prove independence of resolutions.

*Needs:* Layers 0, 1 and 3.

### 4.4 The abelian cone stack

For a derived `𝒪_X`-complex `E` satisfying `Hⁱ(E)=0` for `i>0` and coherent `H⁰,H⁻¹`, construct
the abelian cone stack `h¹/h⁰((E_fl)∨)`. Prove it is a vector-bundle stack when `E` is perfect
of amplitude `[-1,0]`.

*Needs:* Layers 0, 1 and 3.

### 4.5 Maps and triangles

Prove the cohomological criterion for a morphism `φ : E → L` to induce a representable map,
closed immersion, or equivalence of the dual `h¹/h⁰` stacks. Turn a distinguished triangle
with perfect third term into a short exact sequence of abelian cone stacks.

*Needs:* Layers 0, 1 and 3.

**Gate.** A global resolution `[F⁻¹ → F⁰] ≃ E` yields the quotient presentation
`h¹/h⁰(E∨) ≃ [(F⁻¹)∨/(F⁰)∨]`, functorially up to the required 2-isomorphism.

### Examples

**Checks.**

- A cone with a zero-rank acting bundle represents itself.
- The quotient for the zero differential is the product of the degree-one sheaf with the classifying stack of the degree-zero sheaf.
- Adding an acyclic identity summand leaves the cone stack equivalent and preserves its dimension.

### Dependencies

Layers 0, 1 and 3.

## Layer 5: the intrinsic normal sheaf and cone

### 5.1 Intrinsic normal sheaf

For a Deligne–Mumford stack `X`, define
`𝔑_X = h¹/h⁰((L_X,fl)∨)`. For every affine étale chart `U → X` and local embedding
`U ↪ M` into a smooth affine scheme, prove the presentation
`𝔑_X|_U ≃ [N_{U/M}/T_M|_U]`.

*Needs:* Layers 0, 1 and 4.

### 5.2 Refinements of local embeddings

Define the category of local embeddings and common refinements. Prove that under a refinement
`(U',M') → (U,M)`, the pair `(C_{U/M} ↪ N_{U/M})|_{U'}` is the quotient of
`(C_{U'/M'} ↪ N_{U'/M'})` by `T_{M'/M}|_{U'}`.

*Needs:* Layers 0, 1 and 4.

### 5.3 Intrinsic normal cone

Glue `[C_{U/M}/T_M|_U]` inside the already intrinsic `𝔑_X`; prove cocycle coherence and
uniqueness. Call the result `𝔠_X`. The construction must be unchanged under equivalence of
Deligne–Mumford stacks and scalar extension of the ground field.

*Needs:* Layers 0, 1 and 4.

### 5.4 Dimension and basic properties

Prove `𝔠_X` is pure of stack-dimension zero and its abelian hull is `𝔑_X`. Prove that
`X` is a local complete intersection exactly when `𝔠_X` is a vector-bundle stack; in that
case `𝔠_X = 𝔑_X`. Prove the smooth specialization `𝔠_X = B T_X` and the product formula
for finite-type stacks (Behrend–Fantechi Thm. 3.11 and Props. 3.12–3.13, with the
characterization in Prop. 3.12 restricted to the vector-bundle-stack condition).

*Needs:* Layers 0, 1 and 4.

### 5.5 Pullback and transitivity

For a smooth morphism `f : X → Y`, prove the short exact sequence of cone stacks
`𝔑_{X/Y} → 𝔠_X → f*𝔠_Y` (the smooth case of Behrend–Fantechi Prop. 3.14). For a local complete intersection morphism prove the
transitivity sequence for intrinsic normal sheaves; use deformation to the normal cone and
Layer 8’s Vistoli comparison for regular-immersion virtual pullback. Construct the natural
cone maps used by functoriality. As checks, use `k[x,y]/(x²,xy)` to show equality of the
intrinsic cone and normal sheaf alone does not characterize lci, and the Cartier divisor
`x+y+z=0` in `Spec k[x,y,z]/(xy,xz,yz)` over `k=ℚ` to show the cone sequence need not
be exact for a general lci morphism.

*Needs:* Layers 0, 1 and 4.

**Gate.** Recomputing `𝔠_X` from two unrelated atlases gives canonically equivalent closed cone
substacks of `𝔑_X`, and the comparison satisfies the cocycle condition rather than merely
existing noncanonically.

### Examples

**Checks.**

- On a smooth stack the normal sheaf and cone are both the classifying stack of the tangent bundle.
- On the dual numbers the normal sheaf and cone agree by the regular hypersurface presentation.
- On Spec k[x,y]/(x²,xy), equality of the normal sheaf and cone holds without the vector-bundle-stack condition.

### Dependencies

Layers 0, 1 and 4.

## Layer 6: obstruction theories and their deformation meaning

### 6.1 Obstruction theories

For `E` satisfying the Layer 4 condition `Hⁱ(E)=0` for `i>0` with coherent `H⁰(E)` and
`H⁻¹(E)`, define an obstruction theory `φ : E → L_X` by the two cohomological conditions
`H⁰(φ)` is an isomorphism and `H⁻¹(φ)` is an epimorphism. Prove this is equivalent to the
induced map `𝔑_X → h¹/h⁰(E∨)` being a representable closed immersion (Behrend–Fantechi
Def. 4.4 and Thm. 4.5).

*Needs:* Layers 3–5.

### 6.2 Obstruction cone

Define the obstruction cone as the image of `𝔠_X` in `h¹/h⁰(E∨)` and prove it is a closed
pure-zero-dimensional cone stack. Prove invariance under isomorphism of obstruction theories
in the derived category.

*Needs:* Layers 3–5.

### 6.3 Lifting criterion

Connect the definition to square-zero deformation theory. For `g : T → X` and an extension
`T ↪ T̄` with ideal `J`, identify the obstruction class obtained from `E`; prove it vanishes
exactly when a lift exists and identify the lift groupoid with the corresponding torsor of
trivializations of the cone-stack obstruction.

*Needs:* Layers 3–5.

### 6.4 Perfect obstruction theories

Define perfect obstruction theories by amplitude `[-1,0]`, prove their obstruction targets
are vector-bundle stacks, and define virtual rank. Develop pullback, external direct sum, and
compatibility data given by a morphism of distinguished triangles.

*Needs:* Layers 3–5.

### 6.5 Global two-term resolutions

Define existence of a global two-term resolution and show it is stable under the pullbacks,
external sums, and comparison constructions used below. Do not make it part of perfectness.

*Needs:* Layers 3–5.

### 6.6 Curvilinear obstructions

At a geometric point, identify the coarse intrinsic normal space as a universal obstruction
space and prove the curvilinear-obstruction characterization by the fibre of `𝔠_X`. This is the
local check that the intrinsic cone records actual obstructions rather than only tangent-space
dimensions.

*Needs:* Layers 3–5.

### Examples

**Checks.**

- The identity on a smooth cotangent complex is a perfect obstruction theory.
- The direct sum of that complex with a vector bundle in degree −1 is also a perfect obstruction theory, with rank lowered by the bundle rank.
- The zero map from an infinite-dimensional vector space in degree −1 on a point fails coherence.

### Dependencies

Layers 3–5.

## Layer 7: construction and independence of the virtual class

### 7.1 The resolved cone

Let `φ : E → L_X` be perfect of constant virtual rank `n`, and choose a global resolution
`F• = [F⁻¹ → F⁰] ≃ E`. Form the vector-bundle stack
`𝔈 = h¹/h⁰(E∨)`, the vector bundles `F₀=(F⁰)∨`, `F₁=(F⁻¹)∨`, and the closed cone
`C(F•) = 𝔠_X ×_𝔈 F₁ ↪ F₁`.

*Needs:* Layers 2 and 6.

### 7.2 Zero-section formula

Prove `C(F•) → 𝔠_X` is smooth of relative dimension `rank F₀`, hence `C(F•)` is pure of
dimension `rank F₀`. Define
`[X,φ]vir = 0_F₁^![C(F•)]` and verify that its dimension is
`rank F₀-rank F₁ = rank E = n` (Behrend–Fantechi Def. 5.2).

*Needs:* Layers 2 and 6.

### 7.3 Independence of resolution

For a separated finite-type Deligne–Mumford stack with the resolution property, start
with a roof representing the derived isomorphism between the two global resolutions.
Resolve the roof by a bounded-above complex of finite-rank vector bundles and truncate
below degree −1. Use Tor amplitude to prove the degree −1 cokernel is locally free. The
resulting two-term complex maps to both presentations by chain quasi-isomorphisms.
Use the induced smooth pullbacks and zero-section Gysin compatibility to prove equality
(Behrend–Fantechi Prop. 5.3). Deduce invariance under derived isomorphism of obstruction
theories and equivalence of Deligne–Mumford stacks.

*Needs:* Layers 2 and 6.

### 7.4 Public construction

Define the class noncomputably from the mere existence of a global resolution, with the
independence theorem as its choice-independence proof. Also expose a theorem evaluating the
intrinsic definition using any supplied resolution, so downstream proofs can calculate.

*Needs:* Layers 2 and 6.

### 7.5 Obstruction sheaf formulas

Prove the no-obstruction theorem: if `H⁻¹(E)=0` and `H⁰(E)` is locally free, then `X` is
smooth and `[X,φ]vir=[X]`. If `X` is smooth with locally free obstruction
sheaf `Ob = H¹(E∨)`, prove `[X,φ]vir = c_top(Ob) ∩ [X]` (Behrend–Fantechi Props. 5.5–5.6).

*Needs:* Layers 2 and 6.

### 7.6 Local complete intersections and products

For a pure-dimensional local complete intersection, prove that the canonical obstruction theory `L_X → L_X`
is perfect, is globally resolvable whenever a global smooth embedding supplies the resolution,
and gives the ordinary fundamental class. Prove the product formula for external sums
(Behrend–Fantechi, example following Prop. 5.3 and Prop. 5.7).

*Needs:* Layers 2 and 6.

### 7.7 Virtual degree

For proper `X` and virtual dimension zero, define `deg [X,φ]vir ∈ ℚ` and prove invariance under
equivalence of proper Deligne–Mumford stacks. Keep this numerical operation downstream of the class construction.

*Needs:* Layers 2 and 6.

### Examples

**Checks.**

- Adding an acyclic summand to a chosen global resolution preserves the class.
- A smooth scheme with its canonical theory gives its ordinary class.
- The dual numbers give twice the point class. A zero section on a smooth scheme gives the top Chern class capped with its fundamental class.

### Dependencies

Layers 2 and 6.

## Layer 8: compatible pullback and functoriality

### 8.1 Compatible theories

In a cartesian square with a local complete intersection morphism on the base, define
compatibility of obstruction theories by a morphism between the transitivity distinguished
triangles. Prove that it yields the exact sequence of vector-bundle stacks required by the
cone comparison.

*Needs:* Layers 2, 5 and 7.

### 8.2 Smooth pullback

For a smooth base morphism, identify the pulled-back intrinsic and obstruction cones and prove
the virtual pullback formula directly from flat pullback and zero-section Gysin.

*Needs:* Layers 2, 5 and 7.

### 8.3 Regular-immersion pullback

For a regular local immersion between smooth bases, descend Vistoli's canonical rational
equivalence through the tangent and vector-bundle actions, lift it to the global resolutions,
and prove the refined Gysin formula.

*Needs:* Layers 2, 5 and 7.

### 8.4 Functoriality

Factor a morphism between smooth bases through its graph and a projection to obtain the full
Behrend–Fantechi functoriality statement under compatible perfect obstruction theories
(Prop. 5.10).

*Needs:* Layers 2, 5 and 7.

### 8.5 Coherence

Prove compatibility with products, composition of compatible squares, and replacement of any
square or triangle by an isomorphic one. These coherence results are required before the
theorem can safely serve downstream moduli constructions.

*Needs:* Layers 2, 5 and 7.

### Examples

**Checks.**

- Flat extension of the ground field commutes with the class.
- For a compatible pullback to a regular divisor between smooth bases, compute the result both from the pulled-back theory and from its Gysin class.
- Two successive compatible smooth pullbacks agree with the composite.

### Dependencies

Layers 2, 5 and 7.

## Layer 9: the relative intrinsic cone and virtual class

### 9.1 Relative intrinsic cone

For `f : X → Y` of relative Deligne–Mumford type, define
`𝔑_{X/Y} = h¹/h⁰((L_{X/Y})∨)` and construct `𝔠_{X/Y}` on smooth charts of the target,
using local closed embeddings into schemes smooth over those charts and descending the
cone along their common refinements. For `Y` pure of dimension `d`, prove purity of
`𝔠_{X/Y}` of dimension `d` (Behrend–Fantechi §7).

*Needs:* Layers 1–8.

### 9.2 Relative virtual class

Define relative obstruction theories `E → L_{X/Y}`, perfectness, global resolution, and
constant virtual rank exactly as in the absolute case. For separated finite-type
Deligne–Mumford `X` with the resolution property and a global resolution of `E`,
construct `[X/Y,φ]vir ∈ A_{d+rank E}(X)_ℚ`.

*Needs:* Layers 1–8.

### 9.3 Flat base change

For a cartesian base change `Y' → Y`, construct
`𝔠_{X'/Y'} → 𝔠_{X/Y} ×_Y Y'`; prove it is a closed immersion in general and an equivalence
for flat base change. Deduce the flat virtual-pullback theorem (Behrend–Fantechi Prop. 7.1).

*Needs:* Layers 1–8.

### 9.4 Regular base change and formulas

Use deformation to the normal cone and Vistoli's rational equivalence to prove regular-
immersion base change between bases smooth over the common base as in Behrend–Fantechi
Prop. 7.2. Prove the relative no-obstruction and obstruction-bundle formulas over a smooth
base and the product formula (Props. 7.3–7.4).

*Needs:* Layers 1–8.

### 9.5 Relative functoriality

State and prove relative compatibility through a morphism of transitivity triangles and the
corresponding functoriality theorem under the smoothness hypotheses of Prop. 7.5. Recover the absolute theory by taking
`Y = Spec k`, with a theorem identifying the two classes.

*Needs:* Layers 1–8.

### 9.6 Pullback from smooth stacks

In a cartesian diagram

```text
X --j--> V
|g       |h
v        v
Y --i--> W
```

with `V` and `W` smooth and `i,j` local immersions, assume that `h` has unramified diagonal. Prove that
`j^*L_{V/W} → L_{X/Y}` is a relative perfect obstruction theory. If `i` is also a regular
local immersion and the relative class hypotheses hold, prove that the resulting virtual class is the
zero-section intersection of `C_{X/V}` in `g^*N_{Y/W}`. These are the separate hypotheses and
conclusions of Behrend–Fantechi Example 7.6.

*Needs:* Layers 1–8.

### Examples

**Checks.**

- Over Spec k the relative construction gives the absolute class.
- For a point over the classifying stack of the multiplicative group, the base dimension and relative rank cancel.
- For the identity square over the regular divisor xy=0 in the affine plane, the construction gives the sum of the two axis classes.

### Dependencies

Layers 1–8.

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
  the smallest test of Proposition 5.3.
- **Products.** Check the class of the product of two zero loci equals the exterior product of
  their virtual classes and that virtual dimensions add.
- **Flat and regular base change.** Test flat field extension and the pullback along a regular
  divisor. The two routes—base-changing the obstruction theory first or applying the bivariant
  class to the virtual cycle—must agree.
- **A fibre of a smooth-ambient morphism.** For a fibre product of smooth stacks as in the final
  Layer 9 item, compute the relative virtual class both from `j^*L_{V/W}` and from the ordinary
  normal cone; prove equality.
- **Proper virtual dimension zero.** On a proper zero-dimensional scheme which is a local
  complete intersection, the degree of the virtual class agrees with the ordinary
  dimension `dim_k Γ(X,𝒪_X) = Σ_x length(𝒪_{X,x}) · [κ(x):k]`, after rationalization.

## Downstream consumers

[Algebraic Gromov–Witten theory](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1998)
uses the relative class over the prestable-curve stack. [StableReductionPartII](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1841) uses rational
Chow operations on smooth Deligne–Mumford stacks.

## References

- K. Behrend and B. Fantechi,
  [*The intrinsic normal cone*](https://doi.org/10.1007/s002220050136), Invent. Math. 128
  (1997), 45–88; [arXiv version](https://arxiv.org/abs/alg-geom/9601010). This is the
  specification (all numbered locators refer to arXiv v1) for cone stacks, `h¹/h⁰`, the intrinsic cone, obstruction theories, the global-
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
