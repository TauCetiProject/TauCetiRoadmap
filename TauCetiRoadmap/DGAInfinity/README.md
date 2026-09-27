# Roadmap: DG and A-infinity algebras, categories, and modules

Differential graded objects make homological algebra compositional: morphisms themselves form
complexes, composition obeys the Leibniz rule, and derived categories retain a chain-level model.
`A∞` objects retain the same information while allowing associativity, functoriality, and module
actions to hold through coherent higher operations.  This is especially useful after passing to
cohomology: homological transfer places a minimal `A∞` structure directly on cohomology, where the
higher products record information which an ordinary cohomology algebra forgets.

This roadmap builds the reusable algebraic foundation from signed graded multilinear algebra
through DG and `A∞` categories, their module and bimodule theories, minimal models, bar--cobar and
controlled twisting, derived Morita theory, quotients, Hochschild deformation theory,
smooth/proper structures, Calabi--Yau structures and completions, Euler theory on perfect objects,
and relative quadratic Koszul duality.  The [Grothendieck groups and Euler forms
roadmap](../GrothendieckEulerForms/README.md) supplies ordinary exact and triangulated `K₀`,
finite-support Euler sums, graded Euler forms, and left/right numerical quotients.  This roadmap
uses those constructions for perfect DG and `A∞` categories; it does not rebuild them.

Suggested homes in Tau Ceti are `TauCeti/Algebra/Homology/DG/` and
`TauCeti/Algebra/Homology/AInfinity/` for the algebraic core,
`TauCeti/CategoryTheory/DG/` and `TauCeti/CategoryTheory/AInfinity/` for the many-object theory,
and `TauCeti/CategoryTheory/Perfect/` for the Morita, quotient, finiteness, and Euler layers.  The
file split is an implementation choice.  The conventions and dependency order below are not.

## Scope boundary

The roadmap treats uncurved, integer-cohomologically-graded DG and `A∞` objects.  Curved objects,
periodic complexes, applications to particular presented algebras, and application-specific
correspondence theorems are outside this roadmap.  It makes no claims about named root systems,
lattices, categorical glue constructions, or proposed homological finiteness mechanisms.

The roadmap does not claim that DG categories are unable to model a derived theory.  On the
contrary, a strictly unital augmented `A∞` algebra over a field, or over a separable semisimple base
with the split/K-flat hypotheses stated in Layer 4, has an enveloping DG algebra
`U(A) = Ω B∞ A` and an `A∞` quasi-isomorphism `A ⟶ U(A)`.  Analogous DG models exist for the
categorical theory under the corresponding smallness and flatness hypotheses.  `A∞` structures are
useful because transfer can keep a chosen small underlying complex--most importantly cohomology
with zero differential--and put the lost coherence into explicit `m₃,m₄,…`; this gives computable
minimal models, exposes Massey products and deformation obstructions, and makes finite
twisted-object calculations much smaller than a strict DG replacement.

## Standing conventions

### Ground rings, size, and handedness

- Basic graded, DG, bar, module, and category definitions work over a commutative ring `k` when
  tensor products and the required colimits exist.  Minimal-model, homological-transfer, and
  finite-dimensional duality theorems are stated over a field.  Their semisimple-base versions use
  an explicitly fixed finite product of fields, or more generally a separable semisimple
  `k`-algebra when the cited proof only needs bimodule splittings.  A theorem must not infer a
  splitting merely from projectivity over an arbitrary ground ring.
- Coderivation-square and brace formulations of `A∞` structures and formal deformations work over
  an arbitrary commutative base.  Any use of the dg-Lie Maurer--Cartan expression
  `dξ + [ξ,ξ]/2`, exponential gauge action, the Deligne groupoid, or Getzler's simplicial
  Maurer--Cartan construction requires `k` to be a `ℚ`-algebra (or a separately cited replacement
  in positive characteristic) and requires nilpotence or a complete pronilpotent filtration.
- DG and `A∞` categories are small in their object universe.  Hom complexes may live in a larger
  module universe.  Categories of all modules are correspondingly large; representables, finite
  cell modules, and their idempotent completion form an essentially small perfect subcategory.
  Whenever categorical `K₀` is formed, use the skeleton/shrink policy from the Grothendieck-group
  roadmap rather than quotienting a large type of objects.
- Right modules are primary: an `A∞` right module has operations
  `m_n^M : M ⊗ A^{⊗(n-1)} ⟶ M` of degree `2-n`.  A left `A`-module is a right
  `Aᵒᵖ`-module.  An `(A,B)`-bimodule means left `A`, right `B`, and is stored by its two-sided
  bar coderivation; it is compared with a right module over `Aᵒᵖ ⊗ B` only after a compatible
  `A∞` tensor-product model has been chosen.  The ordinary
  finite-dimensional modules in the dependency roadmap are left modules; comparison statements
  apply the opposite-algebra bridge explicitly.

### Cohomological grading and Koszul signs

- Gradings are by `ℤ`; differentials have degree `+1`.  For a homogeneous element `x`, its degree
  is `|x|`.  The symmetry sends `x ⊗ y` to `(-1)^{|x||y|} y ⊗ x`, and tensor products of
  homogeneous maps use
  `(f ⊗ g)(x ⊗ y) = (-1)^{|g||x|} f(x) ⊗ g(y)`.
- The cochain shift is `X[1]^p = X^{p+1}` with differential `-d_X`.  Suspension is the same
  regrading, denoted `sA`, and the canonical map `s : A ⟶ sA` has degree `-1`.  This convention is
  aligned with Mathlib's cochain-complex shift and `ComplexShape.up ℤ` tensor signs; translations
  to sources using a degree-`+1` suspension must be proved once and then used through named
  equivalences.
- A DG algebra satisfies
  `d(ab) = d(a)b + (-1)^{|a|} a d(b)`.  A DG category uses
  `d(g ∘ f) = d(g) ∘ f + (-1)^{|g|} g ∘ d(f)` when composition is presented as
  `Hom(Y,Z) ⊗ Hom(X,Y) ⟶ Hom(X,Z)`.  Mathlib's `EnrichedCategory.comp` orders the factors as
  `Hom(X,Y) ⊗ Hom(Y,Z)`; its equivalent formula is
  `d(f ≫ g) = d(f) ≫ g + (-1)^{|f|} f ≫ d(g)`.  The bridge uses the symmetric braiding: for
  homogeneous `f,g`, Mathlib-ordered composition is
  `f ≫ g = (-1)^{|f||g|}(g ∘ f)`, so braiding back recovers the untwisted Keller operation
  `m₂(g,f)=g∘f`.  This comparison sign is derived and tested once.  Tensor products, opposites,
  Hom complexes, module differentials, and shifts receive executable degree/sign lemmas, not
  separate ad hoc formulas.

### The primary `A∞` convention

Tau Ceti adopts the cohomological Getzler--Jones/Keller convention.  An uncurved `A∞` algebra has
maps `m_n : A^{⊗n} ⟶ A` of degree `2-n` for `n ≥ 1`, and no `m₀`.  For
`n = r+s+t`, `s ≥ 1`, and `u = r+1+t`, the Stasheff relation is the following equality of graded
maps:

```text
Σ (-1)^(r+s*t) m_u (1^⊗r ⊗ m_s ⊗ 1^⊗t) = 0.                 (SI_n)
```

The displayed sign is not the whole sign after evaluation on elements: the tensor-map Koszul rule
above contributes the degree-dependent signs.  For a category, inputs are written
`(a_n,…,a_1)` with `a_i : X_{i-1} ⟶ X_i`, and `m₂(g,f)=g∘f`.  Algebra multiplication is
`m₂(a,b)=ab`; no Seidel-style twist is inserted.

The primary implementation is the suspended reduced tensor-coalgebra encoding.  Put
`B∞A = Tᶜ(sA) = ⨁_{n≥1}(sA)^{⊗n}` and define degree-one maps `b_n` by the commuting square

```text
(sA)^⊗n  --b_n--> sA
    ↑s^⊗n            ↑s
 A^⊗n     --m_n-->  A.
```

The `b_n` extend uniquely to a degree-one coderivation `b` for deconcatenation, and `b²=0` is
equivalent to every `(SI_n)`.  This sign-free suspended equation is the stored law.  The
unsuspended `m_n`, their degrees, `(SI_n)`, and conversion in both directions are public API, so
users do not have to manipulate coalgebra words for ordinary calculations.

This suspension fixes the sign in twisting as well.  If `α` has degree one, then the unsuspended
Maurer--Cartan equation corresponding to the sign-free suspended equation is

```text
Σ_{n≥1} (-1)^{n(n-1)/2} m_n(α,…,α) = 0.                 (MC)
```

Thus in the DG subcase `(MC)` is `dα-α²=0`.  Keller's twisting matrix is
`δ=-α`, and therefore satisfies the familiar equation `dδ+δ²=0`.  The implementation
keeps `α` for algebraic twisting and `δ` for twisted objects, exposes the negation bridge, and
never mixes the two sign conventions.  Keller, Section 7.6, equation (7.1), is the acceptance test.

The first four relations are fixed acceptance equations:

```text
n=1:  m₁m₁ = 0.

n=2:  m₁m₂ - m₂(m₁⊗1) - m₂(1⊗m₁) = 0.

n=3:  m₁m₃ + m₂(m₂⊗1) - m₂(1⊗m₂)
       + m₃(m₁⊗1⊗1 + 1⊗m₁⊗1 + 1⊗1⊗m₁) = 0.

n=4:  m₁m₄ - m₂(m₃⊗1) - m₂(1⊗m₃)
       + m₃(m₂⊗1⊗1) - m₃(1⊗m₂⊗1) + m₃(1⊗1⊗m₂)
       - m₄(m₁⊗1⊗1⊗1 + 1⊗m₁⊗1⊗1
             + 1⊗1⊗m₁⊗1 + 1⊗1⊗1⊗m₁) = 0.
```

For example, evaluating `n=2` gives
`m₁(m₂(a,b)) = m₂(m₁a,b) + (-1)^{|a|}m₂(a,m₁b)`.  An implementation must derive each displayed
unsuspended equation from the arity component of `b²=0` and derive the converse.  Setting
`m_n=0` for `n≥3` must reduce them definitionally or by short simplification to the DG
differential and associativity laws.

For clarity, put `ε(p)=(-1)^p` and let `a,b,c,d` have degrees `p,q,r,s`.  The tensor-map rule turns
the map equations in arities three and four into the following element equations; these are part
of the sign test, not new axioms:

```text
0 = m₁m₃(a,b,c) + m₂(m₂(a,b),c) - m₂(a,m₂(b,c))
    + m₃(m₁a,b,c) + ε(p)m₃(a,m₁b,c) + ε(p+q)m₃(a,b,m₁c).

0 = m₁m₄(a,b,c,d)
    - m₂(m₃(a,b,c),d) - ε(p)m₂(a,m₃(b,c,d))
    + m₃(m₂(a,b),c,d) - m₃(a,m₂(b,c),d) + m₃(a,b,m₂(c,d))
    - m₄(m₁a,b,c,d) - ε(p)m₄(a,m₁b,c,d)
    - ε(p+q)m₄(a,b,m₁c,d) - ε(p+q+r)m₄(a,b,c,m₁d).
```

### Units, morphisms, and equivalences

- Strictly unital objects are the primary public variant.  A strict unit `e` has degree zero,
  `m₁(e)=0`, `m₂(e,a)=a=m₂(a,e)`, and
  `m_n(…,e,…)=0` for `n≠2`.  A strictly unital morphism preserves `e` in arity one and its higher
  components vanish on an input `e`.  Augmented objects split as the semisimple base plus a
  reduced augmentation ideal, and their bar construction uses that ideal.
- A cohomologically unital object has a unit only in `H*(A,m₁)`.  Build it as a separate predicate
  and prove that over a field every cohomologically unital object is `A∞` quasi-isomorphic to a
  strictly unital one; in the minimal case the comparison can be an `A∞` isomorphism.  Do not
  silently select chain-level representatives and call them strict units.
- An `A∞` morphism has components `f_n : A^{⊗n} ⟶ B` of degree `1-n`; an `A∞` functor has the
  analogous components on composable strings.  “Strict” means all components above arity one
  vanish.  “Quasi-isomorphism” means `f₁` induces an isomorphism on cohomology.  For categories,
  a quasi-equivalence is quasi-fully faithful on every Hom complex and essentially surjective on
  `H⁰`; it is not the same predicate as a derived Morita equivalence.
- Over a field, a quasi-isomorphism of complexes is a chain-homotopy equivalence after choosing
  splittings, and the obstruction construction produces an `A∞` inverse up to homotopy.  Over an
  arbitrary commutative ring the same theorem requires `f₁` itself to be a chain-homotopy
  equivalence (or explicit cofibrancy/splitting hypotheses); a bare quasi-isomorphism is not enough.

### Suspended modules and bimodules

- A right module has unsuspended operations
  `m_n^M : M ⊗ A^{⊗(n-1)} ⟶ M` of degree `2-n`.  It is stored by degree-one Taylor maps
  `b_n^M : sM ⊗ (sA)^{⊗(n-1)} ⟶ sM`, extended to a coderivation over `b` on the cofree
  right bar comodule `sM ⊗ Tᶜ(sA)`.  The module equation is `(b^M)²=0`, together with the
  coderivation-over-`b` equation
  `Δ_M b^M = (b^M⊗1 + 1⊗b)Δ_M`; unsuspension derives every element-level sign.
- An `(A,B)`-bimodule has degree-one suspended components
  `b_{i,j} : (sA)^{⊗i} ⊗ sM ⊗ (sB)^{⊗j} ⟶ sM`, equivalently unsuspended operations
  of degree `1-i-j`.  They extend to the square-zero bicomodule coderivation on
  `Tᶜ(sA) ⊗ sM ⊗ Tᶜ(sB)`.  This is the primary definition.  Identification with a right
  module over `Aᵒᵖ⊗B` is supplied only when a particular `A∞` tensor-product model and its
  diagonal have already been constructed; it is not used as a definition over an arbitrary base.

## Existing foundations

### Mathlib material to consume

- `CategoryTheory.GradedObject`, its shift functors and direct sums, together with ordinary
  multilinear maps and tensor powers; the signed graded substitution and tensor-coalgebra APIs
  required here are not already packaged;
- `ComplexShape.TensorSigns`, in particular the `ComplexShape.up ℤ` sign character;
  `HomologicalComplex`, `CochainComplex`, Hom complexes, cochain shifts, tensor products, total
  complexes, mapping cones, homotopies, and `HomologicalComplex.QuasiIso`;
- `HomologicalComplex.monoidalCategory` from `Mathlib/Algebra/Homology/Monoidal.lean`, which
  already supplies the monoidal structure on `HomologicalComplex C c` for any `c` with
  `c.TensorSigns`, hence on unbounded `CochainComplex (ModuleCat k) ℤ`.  Consume it; do not build
  a second totalization;
- `CategoryTheory.EnrichedCategory` and enriched functors.  A strict DG category over `k` will be
  represented as enrichment in `CochainComplex (ModuleCat k) ℤ`.  Two pieces of that enrichment
  are genuinely missing from Mathlib: the braiding, and a `k`-linear enriched Hom complex.
  `GradedObject.braidedCategory` and `GradedObject.symmetricCategory` exist, but nothing installs
  a `BraidedCategory` on `HomologicalComplex`, and the Koszul sign is exactly the content of that
  transport.  The existing `CochainComplex.HomComplex` is valued in `AddCommGrpCat`, so it cannot
  simply be reused as the required enrichment;
- `MorphismProperty.Localization`, homotopy categories, the localization of complexes at
  quasi-isomorphisms, `DerivedCategory`, shifts, distinguished triangles, and Mathlib's
  pretriangulated/triangulated API;
- tensor algebras and tensor powers, tensor products, direct sums, graded submodules,
  `DirectSum.IsInternal`, multilinear maps, ordinary coalgebras, opposite algebras/categories, and
  finite-dimensional duals.  Mathlib has no Hochschild chain/cochain, brace, or Gerstenhaber API
  meeting Layer 8, and its ordinary `Coalgebra` API does not provide the conilpotent graded tensor
  coalgebra or signed coderivations required in Layer 0.

Mathlib has no landed DG-category or `A∞` hierarchy covering these targets.  The open
[A-infinity grading-data PR](https://github.com/leanprover-community/mathlib4/pull/40984) proposes
graded linear quivers and determines naming and universe choices which Mathlib may own.  Tau Ceti
implements every missing layer now in a compatible shape and replaces it by imports when the
upstream interface lands.  The bridge between the enriched DG definition and the `A∞` definition
with vanishing higher operations is a theorem, not a choice of one spelling to the exclusion of
the other.

### Tau Ceti and dependency-roadmap material to consume

The Grothendieck/Euler roadmap supplies exact and triangulated `K₀`, finite-support Euler descent,
graded Euler forms, and separate left/right numerical radicals.  Its hypotheses--essential
smallness, finite-dimensional terms, and finite cohomological support--remain visible in every
perfect-category specialization below.

Landed Tau Ceti supplies `TauCeti.eulerForm`, `titsForm`, and `titsPolarForm`, as well as
`eulerForm_dimVector_indecProjRep_eq_finrank_hom` and projective/simple evaluations for finite
quivers.  The perfect-DG comparison recovers these declarations for an ordinary finite acyclic
quiver algebra viewed as a DG algebra in degree zero; it does not introduce another numerical
quiver form.

---

## The build, in layers

### Layer 0: signed graded multilinear and tensor-coalgebra infrastructure

- Package `ℤ`-graded modules both as Mathlib graded objects and, when multiplication is easier on a
  total module, as an internal direct-sum grading.  Prove equivalences between the presentations,
  homogeneous-element induction, degreewise extensionality, and compatibility with shifts,
  tensor products, duals under finite-projectivity hypotheses, opposites, and direct sums.
- Build homogeneous multilinear maps with a degree, their substitution/brace operations, and the
  exact Koszul sign for substituting a degree-`q` operation after the first `r` inputs.  Supply
  dependent versions for composable paths in a graded quiver without relying on equality casts as
  the public interface; transport along linear equivalences of the relevant graded pieces.
- Construct reduced and coaugmented tensor coalgebras with deconcatenation, their conilpotence
  filtration, coderivations, and the equivalence between degree-one coderivations and their Taylor
  components.  Construct completed tensor coalgebras as products by tensor length and distinguish
  them from direct-sum conilpotent coalgebras.
- Complete the symmetric monoidal structure on unbounded `CochainComplex (ModuleCat k) ℤ`.  The
  monoidal structure itself is Mathlib's `HomologicalComplex.monoidalCategory`, instantiated at
  `ComplexShape.up ℤ` and its `TensorSigns`; import it rather than re-totalizing.  What has to be
  added is the braiding: transport `GradedObject.braidedCategory` through the totalization,
  supply the Koszul sign `x ⊗ y ↦ (-1)^{|x||y|} y ⊗ x` on the degreewise summands, and prove the
  hexagon and symmetry axioms at complex level.  Then construct the `k`-linear Hom complex, its
  signed differential `d(f)=d_Y f-(-1)^{|f|}f d_X`, closed composition map, and the enrichment,
  and compare its underlying additive-group complex with Mathlib's `CochainComplex.HomComplex`.
- Implement the suspension/unsuspension equivalence fixed above.  Prove the general Stasheff
  component formula and the arity `1`--`4` equations verbatim.  Reuse Mathlib's
  `ComplexShape.TensorSigns`; a second private parity calculus is not an accepted endpoint.

Getzler--Jones, Sections 1--2, supplies the bar/coderivation convention and brace signs.  Keller,
Sections 3.1 and 3.6, supplies the exact degree `2-n`, sign `(-1)^{r+st}`, degree-`-1` suspension,
and `b²=0` equivalence used here.

### Layer 1: DG algebras, categories, modules, and bimodules

- Define nonunital, unital, and augmented DG algebras on graded `k`-modules; DG algebra morphisms;
  opposites and tensor products; cycles, boundaries, and the induced graded cohomology algebra.
  Provide constructors from an ordinary graded algebra with zero differential and from endomorphism
  complexes.  Prove all unit, Leibniz, opposite, and tensor sign formulas on homogeneous elements.
- Define DG categories as categories enriched in cochain complexes of `k`-modules.  Build the
  underlying graded category, `Z⁰` category of closed degree-zero maps, and `H⁰` homotopy category;
  DG functors and DG natural transformations; opposite and tensor DG categories; full DG
  subcategories; quasi-fully faithful functors and quasi-equivalences.  Compare the enriched
  presentation to explicit Hom-complex data.
- Define right/left DG modules and `(A,B)`-bimodules, their DG categories of morphism complexes,
  restriction and extension of scalars, tensor product and derived tensor target, internal Hom,
  representable modules, and the DG Yoneda embedding.  Prove the DG Yoneda lemma and composition
  laws for tensoring bimodules.
- Construct a DG algebra as the one-object DG category and the endomorphism DG algebra of an
  object.  Prove that the module conventions agree under these conversions and that an ordinary
  left module from the dependency roadmap becomes the pinned right module over the opposite
  degree-zero DG algebra.

Keller, *Deriving DG Categories*, Sections 2--6, supplies DG modules, representables, tensor/Hom,
resolutions, and derived functors.  Drinfeld, Section 2, supplies the small DG-category,
quasi-equivalence, twisted-envelope, and module conventions.

### Layer 2: `A∞` algebras, categories, morphisms, functors, modules, and bimodules

- Define nonunital `A∞` algebras by square-zero coderivations and expose their unsuspended
  operations.  Add the strictly unital, augmented, and cohomologically unital predicates.  Build
  opposites, tensor products under the exact hypotheses where the chosen diagonal is available,
  one-object categories, and restriction to a full subcategory.
- Define `A∞` morphisms via bar-coalgebra morphisms and expose components `f_n`, their full
  component equation and composition signs.  Prove identity and associativity, strict and
  strictly unital subcases, homotopies, and quasi-isomorphisms.  Prove existence of an `A∞`
  inverse up to homotopy over a field; over a general ring require `f₁` to be a chain-homotopy
  equivalence or state the exact cofibrant/splitting hypotheses from the proof.
- Define small `A∞` categories on graded linear quivers, `A∞` functors, transformations, and the
  `A∞` category of functors.  Build `H⁰`, strict identities, cohomological identities,
  quasi-equivalences, full subcategories, opposites, and the Yoneda functor.  Prove that enriched
  DG categories are exactly the `m_n=0` (`n≥3`) subcase, with mutually inverse conversions.
- Define right `A∞` modules using the suspended comodule coderivation `b^M` fixed above; expose
  `b_n^M`, unsuspended `m_n^M`, and their full component equations.  Define module morphisms and
  homotopies, quasi-isomorphisms, representables,
  the DG category of modules, and the Yoneda lemma.  Define `(A,B)` `A∞` bimodules with operations
  having inputs on both sides, relate them to modules over the tensor product/opposite when that
  tensor model applies.  Store bimodules by the suspended `b_{i,j}` bicomodule coderivation, expose
  the unsuspended operations and equations, and construct composition by bar tensor product.  State
  every local finiteness or completion condition needed for its sums.
- Prove Keller's algebra unit strictification over a field.  For categories, implement precisely
  Lyubashenko's unital and strictly unital replacement theorem, including its ground and splitting
  hypotheses.  Do not infer a module strictification theorem from the algebra statement: add only
  the module comparison actually proved by the cited module source.  In each case distinguish a
  quasi-isomorphic replacement from the stronger minimal-model isomorphism.

Keller, Sections 3--5 and 7, is the convention source for algebras, morphisms, modules, derived
modules, categories, and algebra strict units.  Lyubashenko, *Category of A-infinity-categories*,
supplies functors, transformations, functor categories, and the categorical unital replacement.
Lyubashenko--Manzyuk,
*A-infinity-bimodules and Serre A-infinity-functors*, supplies bimodule and Serre-functor
conventions.

### Layer 3: minimal models and homological transfer

- Define minimality as `m₁=0`, formality as an `A∞` quasi-isomorphism to cohomology with only
  `m₂`, and intrinsic formality as formality of every `A∞` structure with the specified
  cohomology algebra.  Keep these three predicates distinct.
- Package a strong deformation retract of cochain complexes
  `(H,0) ⇄ (A,d)` by maps `i,p` of degree zero and `h` of degree `-1`, with
  `p i = 1`, `1-i p = d h + h d`, and the side conditions `h i=0`, `p h=0`, `h²=0` after the
  standard normalization.  Give a weaker contraction input and prove normalization rather than
  requiring arbitrary callers to supply side conditions.
- Construct transferred operations as finite sums over planar rooted trees, with leaves `i`,
  internal vertices of arity at least two labelled by the old operations, internal edges `h`, and
  root `p`; the unary differential belongs to the contraction and is not allowed as a tree vertex.
  This exclusion makes the fixed-arity tree sum finite.  Prove the transferred
  Stasheff identities, construct the extending `A∞` quasi-isomorphism, and prove naturality under
  compatible contractions.
- Prove Kadeishvili's theorem over a field: `H*(A)` has a minimal `A∞` structure with induced
  `m₂`, together with an `A∞` quasi-isomorphism to `A` inducing the identity on cohomology; the
  structure is unique up to a non-unique `A∞` isomorphism.  Give algebra, category, module, and
  compatible bimodule versions, each with its actual splitting hypotheses.
- Develop the basic perturbation lemma for complete filtered contractions.  State filtration
  lowering/raising so the geometric series is pointwise finite or convergent, prove the perturbed
  contraction, and identify the tree formulas with transferred higher products.
- **Modules over a DG algebra and modules over its cohomology.**  State and prove the theorem the
  minimal model exists for: over a field, the `A∞` quasi-isomorphism
  `(H^*A, m₂, m₃, …) ⟶ A` of the previous item induces, through the derived invariance of Layer 6,
  an equivalence of `A∞` categories of modules and hence a triangle equivalence
  `D(A) ≃ D_∞(H^*A, m₂, m₃, …)` restricting to `Perf(A) ≃ Perf(H^*A, m₂, m₃, …)`.
  The transferred structure is essential and the statement is false without it: the plain
  cohomology algebra `(H^*A, m₂)` is a different object, and `A` is *formal* exactly when the two
  agree up to `A∞` quasi-isomorphism.  `A = Λ_k(a,b,c)` with `d(c) = ab` in the examples below is
  a DG algebra where they do not agree, so no equivalence with `(H^*A, m₂)` can be asserted.
  Give the category and module versions with their splitting hypotheses.  This is the general
  theorem the transfer machinery exists to supply, and the worked examples below instantiate it.

Kadeishvili's 1982 paper supplies the minimal-model theorem.  Gugenheim--Lambe--Stasheff,
*Perturbation theory in differential homological algebra II*, supplies the filtered perturbation
theorem; Keller, Section 3.3 and Section 4.3, supplies the precise existence/uniqueness statement;
Merkulov's explicit construction and Keller's 2006 survey, Theorem 2.3, supply the transfer
formulas.

### Layer 4: bar--cobar, DG strictification, and controlled Maurer--Cartan twisting

- For an augmented `A∞` algebra form `B∞A = Tᶜ(s\bar A)` with its coaugmentation,
  conilpotence filtration, and square-zero coderivation.  For a coaugmented conilpotent DG
  coalgebra form `ΩC = T(s⁻¹\bar C)`.  Construct twisting cochains and the bar--cobar adjunction;
  prove the universal property rather than identifying maps only on generators.
- Over a field, or a separable semisimple base with split augmentation and the K-flatness required
  by the length-filtration comparison, construct `U(A)=ΩB∞A` and the canonical `A∞`
  quasi-isomorphism `A ⟶ U(A)`, universal among strictly unital augmented `A∞` maps from `A` to
  augmented DG algebras.  Extend the construction to small categories and modules under the
  corresponding Hom-wise flatness hypotheses and prove the induced equivalence of derived module
  categories.  This is the promised DG model, not evidence against the utility of minimal `A∞`
  models.
- State bar--cobar unit/counit quasi-isomorphisms only in the coaugmented conilpotent model setting
  or under the connectedness, filtration, and cofibrancy hypotheses used in the proof.  Do not
  promote them to unrestricted equivalences for arbitrary DG coalgebras.
- Define a Maurer--Cartan element `α` as a degree-one element satisfying the signed equation
  `(MC)` above.  Give three accepted regimes: strictly upper-triangular twisting data,
  where the sum is finite; an explicit arity-nilpotence bound; or a complete separated
  descending filtration `F⁰A=A ⊇ F¹A ⊇ ⋯` with `A ≅ lim A/FᵖA`, `⋂FᵖA=0`,
  `α∈F¹`, and
  `m_n(F^{p₁},…,F^{p_n})⊆F^{p₁+⋯+p_n}`, so the arity-`n` term tends to zero.
  There is no unrestricted infinite sum on a bare graded module.
- In each accepted regime construct the twisted operations by inserting copies of `α`, prove
  their convergence/finite support and Stasheff identities, and show that the twisted differential
  squares to zero.  Prove that in the DG case `δ=-α` converts `(MC)` to
  `dδ+δ²=0`.  Over a `ℚ`-algebra, and only for the complete pronilpotent Hochschild dg Lie
  algebra, compare Deligne/Getzler gauge-equivalent twists.  Over an arbitrary commutative ring,
  formulate equivalence through filtered coalgebra automorphisms and braces, without division by
  factorials.

Keller's 2006 survey, Sections 4.3--4.8, supplies the model structure, bar/cobar, enveloping DG
algebra, and derived-module comparison.  Keller, Sections 7.6 and 8, supplies finite
upper-triangular twisting.  Getzler, *Lie theory for nilpotent L-infinity algebras*, supplies the
nilpotent MC/gauge framework; the complete version must be obtained by the proved inverse-limit
argument, not by applying a finite theorem without completeness.

### Layer 5: derived modules, twisted complexes, and perfect envelopes

- Localize the category of `A∞` modules at quasi-isomorphisms and identify it with the homotopy
  category of suitable semi-free/cofibrant modules and with `D(U(A))`.  Give restriction,
  derived extension, derived tensor, and derived Hom, with unit/counit and projection formulas.
  Connect this localization to Mathlib's categorical localization and derived-category API.
- Build finite shifts, finite sums, and one-sided twisted complexes.  An object
  `(⊕_i X_i[r_i],δ)` has a degree-one strictly upper-triangular matrix `δ` satisfying the MC
  equation; its entries use the normalized shifted-Hom identification in the next item, and upper
  triangularity makes every higher sum finite.  Construct morphism complexes and
  their twisted differential, shifts and cones, and prove `d²=0` from MC.
- Pin the shift closure before constructing twisted objects.  With `X[r]^p=X^{p+r}` and
  `d_{X[r]}=(-1)^r d_X`, identify
  `Hom(X[r],Y[s]) ≅ Hom(X,Y)[s-r]` in shifted degree `p` by multiplying the underlying map by
  `(-1)^{rp}`.  On raw shifted maps the differential corresponds to `(-1)^s d_Hom`; on the
  normalized representative in `Hom(X,Y)[s-r]` it is `(-1)^{s-r}d_Hom`.  Composition of a
  degree-`p` map out of `X[r]` with a degree-`q` map out of
  `Y[s]` acquires `(-1)^{(s-r)q}`.  Derive the higher shifted-composition signs from the same
  suspension/tensor braiding.  Test these formulas on the two-term cone; do not leave the shift
  signs as an implementation choice.
- Construct the pretriangulated envelope `pretr(C)`, prove the Yoneda embedding into modules is
  quasi-fully faithful, and identify its image with finite semi-free modules.  Prove `H⁰(pretr C)`
  is triangulated and that a closed degree-zero `f:X⟶Y` produces the triangle
  `X⟶Y⟶Cone(f)⟶X[1]`, using Mathlib's triangle vocabulary.
- Define `tria(C)` as the triangulated closure of representables and `Perf(C)` as its idempotent
  completion, equivalently the compact objects of `D(C)`.  Prove the equivalence between retracts
  of finite semi-free modules, the thick closure of representables, and compact objects.  Construct
  the DG/A∞ Karoubi envelope and compare `H⁰` with triangulated idempotent completion.

Bondal--Kapranov, *Enhanced triangulated categories*, supplies twisted complexes and their
pretriangulated envelope.  Drinfeld, Section 2.4, supplies the one-sided formulas and cone.
Keller, *Deriving DG Categories*, Sections 4--5, proves that representables compactly generate and
that the compact objects are the perfect modules.  Balmer--Schlichting supplies triangulated
idempotent completion.

### Layer 6: quasi-equivalence, derived Morita theory, and compact generators

- Prove that a quasi-equivalence induces equivalences on module-derived categories,
  pretriangulated envelopes, perfect categories, and their idempotent completions.  Prove the same
  for an `A∞` quasi-equivalence, directly and through `U(-)`; record which comparison is canonical
  only up to quasi-equivalence.
- Define a Morita equivalence as a DG/`A∞` functor or bimodule inducing an equivalence of derived
  module categories.  Characterize invertible Morita bimodules by derived tensor inverse and by
  their action on representable compact generators.  Quasi-equivalence implies Morita
  equivalence; the converse is not a target.
- For a localizing subcategory generated by a set of compact objects, form the endomorphism DG
  category and prove the derived Morita equivalence.  If there is a single compact generator `G`,
  identify the category with modules over `RHom(G,G)` and identify compact objects with
  `Perf(RHom(G,G))`.  State generation as vanishing of all shifted Homs, not merely density on
  `K₀`.
- Build the Morita bicategory whose 1-morphisms are suitable bimodules and composition is derived
  tensor.  Prove invariance of Hochschild (co)homology, smoothness, properness, `Perf`, and the
  Euler pairing under Morita equivalence with the hypotheses stated in their respective layers.

Keller, *Deriving DG Categories*, Theorem 8.0 and the preceding compact-generation results,
supplies the generator form of derived Morita theory.  Toën, Sections 4, 6, and 7, supplies mapping
objects as quasi-representable bimodules, internal Homs, and derived Morita theory for small DG
categories.

### Layer 7: DG and `A∞` quotients, Verdier comparison, and `K₀` localization

- For a small DG category `C` and full DG subcategory `B`, construct a DG quotient after a
  homotopically flat replacement over a general commutative ring.  Over a field, also construct
  the explicit model adjoining a contracting morphism of degree `-1` with differential `1` to
  each object of `B`.  Prove its universal property for quasi-functors annihilating `B`.
- Prove Drinfeld's comparison
  `C^tr / B^tr ≃ (C/B)^tr`.  For the unreplaced explicit quotient over a general ring, require that
  `Hom(X,U)` or `Hom(U,X)` is homotopically flat over `k` for every `X∈C,U∈B`; otherwise use the
  homotopically flat resolution.  Do not state the comparison for the naive quotient without one
  of these routes.
- Construct quotients of strictly/cohomologically unital `A∞` categories by full subcategories,
  prove the unital universal property, and compare them to the DG quotient after enveloping-DG
  replacement.  Prove that `H⁰` of the pretriangulated quotient gives the corresponding Verdier
  quotient.
- Apply the triangulated `K₀` construction from the dependency roadmap.  For the raw Verdier
  quotient prove the right-exact sequence
  `K₀(B) ⟶ K₀(C) ⟶ K₀(C/B) ⟶ 0` and identify its first image with the subgroup generated by
  classes of `B`.  Treat the idempotent-completed quotient separately: new retracts can enlarge
  `K₀`, so no unqualified cokernel or short exact sequence is asserted after Karoubi completion.
  Nonconnective negative `K`-theory explains the missing correction, but constructing it is outside
  this roadmap; stop at the proved raw-quotient statement and a documented non-comparison.

Drinfeld, Definition 1.2 and Main Theorem 1.6.2, supplies existence and the quasi-functor universal
property; Theorem 3.4 supplies the Verdier comparison with the precise homotopical-flatness
alternatives.  Lyubashenko--Ovsienko constructs `A∞` quotients, and
Lyubashenko--Manzyuk supplies the unital quotient.  Thomason's dense-subcategory theorem and
Schlichting's localization results justify the `K₀`/idempotent-completion caveat; negative
`K`-groups themselves are not implementation targets here.

### Layer 8: Hochschild cochains, deformations, Massey products, and formality

- Construct Hochschild chains and cochains of DG and `A∞` algebras/categories, normalized versions
  for strict units, the bar differential, cup product, braces, Gerstenhaber bracket, and the
  Hochschild differential `[m,-]`.  Prove comparison under normalized inclusion and invariance
  under quasi-equivalence and derived Morita equivalence with the required cofibrant replacements.
- Over every commutative base, identify an `A∞` structure with a degree-one square-zero
  coderivation and equivalently with the brace equation `m{m}=0` in arity-complete Hochschild
  cochains.  Develop filtered formal deformations, first-order classes, and obstruction lifting in
  that language.  When `k` is a `ℚ`-algebra, identify this equation with Maurer--Cartan in the
  complete pronilpotent Hochschild dg Lie algebra and only then construct exponential gauge,
  Deligne groupoids, and Getzler simplicial sets.  For an ordinary associative algebra, recover
  `HH²` for infinitesimal deformations and `HH³` for obstructions; for a general higher operation,
  retain both Hochschild arity and internal degree.
- Define matric and higher Massey products only when the lower products and defining systems make
  them defined.  Prove that transferred `m₃` selects an element of the corresponding triple Massey
  product and that higher `m_n` encode compatible defining systems.  Do not identify a generally
  multi-valued Massey product with one operation without recording its indeterminacy.
- Prove that vanishing transferred operations gives formality.  For a graded algebra `H` over a
  field, prove the standard sufficient intrinsic-formality criterion
  `HH^{n,2-n}(H,H)=0` for every `n≥3`, with the bigrading and strict-unit normalization explicit.
  Develop obstruction-by-obstruction killing of `m_n`; do not present this sufficient criterion as
  necessary.

Getzler--Jones supplies braces and the coderivation/Hochschild description.  Gerstenhaber's
*On the deformation of rings and algebras* supplies the `HH²`/`HH³` deformation theory.
Kadeishvili's 1988 paper supplies the Hochschild obstruction method for higher operations and
intrinsic formality.  May's *Matric Massey products* and Keller's minimal-model discussion supply
the defining-system and transferred-product comparison.

### Layer 9: smoothness, properness, Serre, and Calabi--Yau structures and completions

- A small DG/`A∞` category is **proper over `k`** when every Hom complex is perfect as a
  `k`-complex; over a field this is equivalent to finite-dimensional total cohomology.  It is
  **smooth over `k`** when its diagonal bimodule is perfect in
  `D(Cᵒᵖ⊗C)`.  Build both as Morita-invariant predicates and keep them independent.  For a DG
  algebra, compare with perfection over `Aᵉ=Aᵒᵖ⊗A`.
- For a smooth category construct the inverse-dualizing bimodule `C!`, and for a proper category
  construct the linear-dual bimodule `C*`.  State the left and right notions separately:
  a smooth/left `d`-Calabi--Yau bimodule identification is `C! ≅ C[-d]`, while a proper/right
  identification is `C[d] ≅ C*`.  Their negative-cyclic refinements are lifts of different
  Hochschild classes.  Do not call either one merely "the" Calabi--Yau structure.
- Construct the derived tensor algebra `T_C(M)=⨁_{n≥0} M^{⊗_C n}` of a bimodule over a small DG
  category, graded by tensor length, with its universal property and its cofibrancy hypotheses.
  For homologically smooth `C` define the `n`-Calabi--Yau completion
  `Π_n(C)=T_C(C![n-1])`, prove that it carries a smooth/left `n`-Calabi--Yau structure, and prove
  that its tensor-length grading is the Adams grading the downstream applications use.  For a
  class `ξ` construct the deformed completion `Π_n(C,ξ)` by twisting the differential, and prove
  `Π_n(C,0)=Π_n(C)`.  State which input each theorem takes: the twist itself needs only a
  Hochschild class in `HH_{n-2}(C)`, while Keller's canonical form lifts it to negative cyclic
  homology, which this roadmap does not construct -- so any theorem needing the lift carries the
  class as a hypothesis rather than producing it.
  These completions are the objects the zigzag/Ginzburg roadmap identifies with its explicit
  `Π₂(Q)` and `Γ₃(Q,W)`; without them that identification has no right-hand side.
- For a proper category, prove that tensoring with `C*` gives the Serre functor on `Perf(C)` when it
  preserves perfect objects, and prove the bifunctorial duality
  `Hom(X,Y)^* ≅ Hom(Y,SX)` and uniqueness of `S`.  A right identification `C[d]≅C*` then yields
  `S≅[d]`.  Under both smoothness and properness, construct the duality relating left and right
  structures exactly as in Brav--Dyckerhoff; do not infer one from the other without those
  dualizability hypotheses.
- Construct Hochschild homology, Chern characters of perfect modules, and Shklyarov's pairing for
  a proper DG algebra.  Prove HRR:
  `χ(X,Y)` is the pairing of the corresponding Chern characters, with the opposite-category
  involution placed as in the source.  If the category is also smooth, prove nondegeneracy of the
  Hochschild pairing.  Extend this to a DG category only after giving a Morita equivalence to a DG
  algebra via a specified compact generator and applying Morita invariance; Shklyarov's cited
  theorem is not itself an unrestricted many-object statement.  This is not a claim that the Euler
  form on unquotiented `K₀` is nondegenerate.

Keller's DG-category survey, Section 5, supplies smooth/proper Morita invariance.  Keller,
*Deformed Calabi--Yau completions*, Sections 4--5, supplies the tensor-algebra completion
`Π_n(C)=T_C(C![n-1])`, its Calabi--Yau structure, and the deformation by a Hochschild class.
Bondal--Kapranov supplies Serre functors.  Shklyarov, Theorems 3.4--3.5 and 6.2, supplies the DG-algebra HRR pairing
and its nondegeneracy under smoothness; the category formulation here passes through Layer 6.
Brav--Dyckerhoff, Sections 3--5, supplies the distinction
between smooth/left, proper/right, and negative-cyclic Calabi--Yau structures.

### Layer 10: `K₀(Perf)`, Euler and numerical forms

- Define `K₀(Perf C)` as triangulated `K₀` of the essentially small idempotent-complete perfect
  category.  First prove
  `K₀^tri(H⁰(pretr C)) ≅ K₀^tri(tria(C))` using the equivalence with finite semi-free
  modules.  The inclusion into `Perf(C)`, which is the idempotent completion, induces a map on
  triangulated `K₀` but need not be an isomorphism.  Do not replace either group by split `K₀`
  of finite-cell objects without a separately proved resolution/cofinality theorem.  Prove
  invariance of the appropriate group under quasi-equivalence and Morita equivalence.
- Under properness, define
  `χ(X,Y)=Σ_i (-1)^i dim_k H^i RHom_C(X,Y)` for perfect `X,Y`.  Prove termwise
  finite-dimensionality and finite support before invoking finite Euler descent.  For an ordinary
  finite-dimensional algebra of finite global dimension, compare this pairing and `K₀(Perf A)`
  with the Cartan/Ext-Euler constructions of the dependency roadmap; for an acyclic quiver compare
  it with `TauCeti.eulerForm`.
- From Serre duality prove
  `χ(X,Y)=χ(Y,SX)`.  Only after a specified natural identification `S≅[d]` prove
  `χ(X,Y)=(-1)^dχ(Y,X)`.  The shift sign is derived from finite support, not asserted for a
  divergent sum.
- Form the left and right numerical quotients by the radicals from the dependency roadmap.  Serre
  duality identifies the left radical with the inverse image of the right radical under `S`; under
  `S≅[d]` the two radicals agree.  Without such a duality they remain distinct.
- Prove compatibility of quotient localization maps with Euler pairings only when the pairing
  descends, and prove radical preservation before inducing numerical maps.  Relate the Chern
  character to the numerical quotient through HRR, while recording that nondegeneracy of the
  Hochschild pairing does not imply injectivity of the Chern character or nondegeneracy on raw
  `K₀`.

This layer uses the Grothendieck/Euler roadmap for every group quotient and finite-support sum.
Shklyarov supplies HRR; Bondal--Kapranov supplies the Serre identity.  Schlichting supplies the
nonconnective localization caveat when perfect quotients are idempotent completed.

### Layer 11: relative quadratic and derived Koszul duality

- Let `S` be a finite-dimensional separable semisimple `k`-algebra and `V` a finitely generated
  projective `S`-bimodule.  Define a quadratic algebra
  `A=T_S(V)/(R)`, where `R⊆V⊗_SV` is an `S`-subbimodule.  Take the **right dual in the monoidal
  category of `S`-bimodules**, with evaluation `V^∨⊗_SV⟶S` and coevaluation fixed as part of
  the finite-projective duality data.  Use the induced order-reversing perfect comparison
  `(V⊗_SV)^∨ ≅ V^∨⊗_SV^∨` to define `R^⊥` as the kernel of restriction to `R`, and
  define `A! = T_S(V^∨)/(R^⊥)`.  State the alternative left-dual definition and its explicit
  opposite equivalence, rather than treating the two duals as definitionally equal.  Over a field
  with `S=k^I`, compute the idempotent components and recover reversed quiver arrows.  Prove
  double-orthogonal and opposite/tensor comparison formulas only under the stated dualizability
  and perfect-pairing hypotheses.
- Define Koszulity using graded **right** `A`-modules by a linear graded projective resolution of
  the augmentation module `S`, equivalently by diagonal vanishing of bigraded `Tor`/`Ext`.  Take
  "linear graded projective resolution" and the equivalence with diagonal `Ext` vanishing from the
  Grothendieck/Euler roadmap's Layer 3 rather than redefining them, so that one notion of
  linearity serves this layer, the zigzag roadmap's classical Koszulity, and the graded Cartan
  matrices all three compare against.  Prove that a Koszul algebra is quadratic, its quadratic dual
  is Koszul, and, with Yoneda multiplication `[f][g]=[f∘g]`,
  `Ext^*_{Mod-A}(S,S)` identifies with `A!`; the parallel left-module theorem identifies with
  `(A!)ᵒᵖ` under the displayed opposite bridge.  Fix left/right, multiplication order, and
  internal-degree shifts by an explicit quiver calculation.
- Define the derived Koszul dual of an augmented DG/`A∞` algebra as
  `E(A)=RHom_A(S,S)`, retaining its natural DG or transferred `A∞` structure.  Compare it with the
  linear dual of `B∞A` only when tensor-length pieces are finite projective; otherwise retain the
  coalgebraic bar dual rather than replacing a direct sum by an unjustified product.  Reuse the
  split-augmentation, conilpotence, and K-flatness/cofibrancy hypotheses from Layer 4; the notation
  `B∞A` does not erase them.
- Prove the double-dual map `A⟶E(E(A))` under stated Adams-connected, local-finiteness and
  completeness hypotheses.  State the derived/coderived equivalence with its conilpotence and
  boundedness conditions.  No unrestricted double-dual equivalence is asserted for arbitrary
  augmented DG algebras.
- Compute polynomial/exterior duality over a field and a relative quadratic example over a finite
  separable semisimple base.  Compute a finite quiver quadratic example over `k^I`, and expose the
  base-change, opposite, and bimodule-duality interfaces needed by downstream applications without
  developing those applications here.

Beilinson--Ginzburg--Soergel, Section 2, supplies Koszul rings, diagonal Ext, dual Koszulity, and
double duality in the locally finite graded setting.  Positselski, Chapter 6 and Appendices A--B,
supplies the conilpotent/nonconilpotent bar-coalgebra, coderived/contraderived, homogeneous, and
DG Koszul formulations and their finiteness boundaries.  Keller's augmented semisimple-base
convention in Section 3.5 supplies the `S`-relative `A∞` presentation.

---

## Worked examples and acceptance criteria

Each subsection below is an acceptance test for a **named general theorem stated in the layers
above**, not an illustration standing on its own.  The general statements are the deliverables;
these are the finite computations which pin their signs, hypotheses and handedness, and which fail
if a convention has drifted.  The correspondence is:

| Example | General theorem it tests |
| --- | --- |
| arity `1`--`4` sign audit | the `b²=0`/Stasheff equivalence of Layer 0 |
| DG algebra as an `A∞` algebra, and back | the `m_n=0` subcase of Layer 2, and the enveloping DG algebra `U(A)=ΩB∞A` with `D(A) ≃ D(U(A))` of Layer 4 |
| finite transfer with a nonzero `m₃` | Kadeishvili's minimal model and `D(A) ≃ D_∞(H^*A, m_i)` of Layer 3 |
| two-object twisted-complex path | the pretriangulated envelope and its triangles, Layer 5 |
| proper, smooth, Serre, numerical boundaries | smoothness/properness and the Euler theory of Layers 9--10 |
| quotient and idempotent-completion boundary | the DG quotient and right-exact `K₀` sequence of Layer 7 |
| Koszul checks | relative quadratic and derived Koszul duality, Layer 11 |

### The arity `1`--`4` sign audit

On formal homogeneous symbols `a,b,c,d`, verify both as maps and after evaluation that the four
displayed Stasheff identities are exactly the tensor-length `1`--`4` components of `b²=0`.
In arity two the evaluated sign must be `(-1)^{|a|}` on `m₂(a,m₁b)`.  With `m_n=0` for
`n≥3`, arity three must be ordinary associativity and arity four must be zero.  Suspend and
unsuspend the same operations and prove round trips.  A unit must satisfy
`m₂(e,a)=a=m₂(a,e)` with no degree-dependent correction.

### A DG algebra as an `A∞` algebra, and back to a DG model

This example tests the two directions of the comparison between the strict and the higher theory:
that a DG algebra is exactly an `A∞` algebra with vanishing higher operations, and that an `A∞`
algebra has a DG model with the same derived module category.  Together with the transfer example
that follows, it is what makes the phrase "`A∞` structures lose nothing" a theorem rather than a
slogan.

For a unital DG algebra `A`, set `m₁=d`, `m₂=μ`, and `m_n=0` for `n≥3`.  Prove every
Stasheff relation, strict unitality, and functoriality on DG algebra morphisms.  Under the
split-augmentation and flatness hypotheses of Layer 4, its enveloping DG algebra comparison
`A⟶U(A)` must agree, up to the proved natural quasi-isomorphism, with the original strict DG
model.  For a general finite augmented `A∞` example with nonzero `m₃`, construct
`U(A)` and show explicitly why the DG replacement is larger while derived module categories are
equivalent.

### A finite transfer with a nonzero `m₃`

Let `k` be a field of characteristic different from two and

```text
A = Λ_k(a,b,c),       |a|=|b|=|c|=1,
d(a)=d(b)=0,          d(c)=ab.
```

This is eight-dimensional.  Use cohomology representatives
`1,a,b,ac,bc,abc`; let `p` kill `c` and `ab`, let `i` include the representatives, and let the
degree-`-1` homotopy satisfy `h(ab)=c` and vanish on the other basis monomials.  Verify
`1-ip=dh+hd` and the side conditions.  With the transfer signs fixed above, prove

```text
m₂^H = p μ(i⊗i),
f₂ = -h μ(i⊗i),
m₃^H([a],[a],[b]) = [ac] ≠ 0.
```

The calculation must show the Koszul sign in `i⊗f₂`, not merely quote a Massey-product result.
Relate the output to the defined triple Massey product and its indeterminacy.  This example rejects
a transfer interface that can state only existence or that forces every cohomology algebra to be
formal.  Then instantiate the Layer 3 equivalence on it: `D(A) ≃ D_∞(H^*A, m₂, m₃)` with the
transferred `m₃` above, and `A` is not formal, so the same statement with `(H^*A, m₂)` in place of
the transferred structure is false.  That contrast is the point of the example.

As a source-pinned second check, implement Keller's Section 3.3 example: the four-vertex linearly
oriented quiver with the length-three relation `γβα=0`.  On the Ext algebra verify that the only
higher arity is `m₃(a,b,c)=e` (up to the already fixed arrow normalization), while `m_n=0` for
`n≠2,3`.  This example tests that the transfer API can reproduce a published finite computation,
not only the exterior-algebra contraction above.

### The two-object twisted-complex path

Take the DG category with objects `X,Y`, identity endomorphisms, one closed degree-zero arrow
`f:X⟶Y`, and zero differential.  In the additive shift closure form
`Cone(f)=(Y⊕X[1],δ)`, where the only nonzero upper-triangular component of the degree-one matrix
`δ` is `f`.  Prove the MC equation, compute the twisted morphism differential, and obtain the
triangle `X⟶Y⟶Cone(f)⟶X[1]` in `H⁰`.  Verify that `Cone(id_X)` is contractible and
`Cone(0)` is isomorphic to `Y⊕X[1]`.  This is the smallest path through graded signs, MC,
twisted objects, pretriangulation, and Mathlib triangles.

Carry this out in a genuine two-object DG category, not in the one-object matrix-algebra surrogate:
construct its `k`-linear Hom complexes and enriched composition, form the shift/additive closure,
compute each twisted Hom differential, and exhibit the three closed maps and homotopies giving the
triangle in `H⁰`.

### Proper, smooth, Serre, and numerical boundaries

For a finite acyclic quiver algebra in degree zero, prove smoothness and properness, identify
`Perf(A)` with bounded complexes of finitely generated projectives, and compare its Euler form with
`TauCeti.eulerForm`.  Compute the Serre action and verify
`χ(X,Y)=χ(Y,SX)` on projective and simple generators.

Also treat the dual numbers `k[ε]/(ε²)` in degree zero: they are proper but not smooth.  This
must prevent any proof that finite-dimensional total cohomology implies smoothness.  The API must
allow a nonzero numerical radical and must not infer nondegeneracy of raw `K₀` from smoothness and
properness or from nondegeneracy of the Hochschild pairing.

For an explicit numerical radical, use the one-object proper DG category whose endomorphism algebra
is `Λ_k(ε)` with `|ε|=1` and zero differential.  Its representable generator has
`χ(A,A)=1-1=0`; prove that its nonzero `K₀` class lies in both radicals.  This keeps the
proper/non-smooth example distinct from the smooth acyclic-quiver calculation.

### Quotient and idempotent-completion boundary

Let `Q` be the linearly oriented quiver `1→2→3`, let `C` be the DG enhancement of
`Perf(kQ)`, and let `B` be the full pretriangulated subcategory thickly generated by the middle
vertex projective.  Construct a homotopically flat DG quotient model, compute its Hom complexes on
the images of the three projectives, and verify the Verdier universal property on those generators.
Compute the right-exact `K₀` sequence for the raw quotient.  After Karoubi completion, construct
only the canonical map on `K₀` and verify that the raw cokernel theorem does not prove it is an
isomorphism; negative `K`-theory is documented as the external explanation, not formalized here.

### Koszul checks

Over a field, compute the quadratic and derived Koszul duals of a symmetric algebra on a finite
space and obtain the exterior algebra on the dual space with the pinned internal shift.  Repeat
over `S=k^{\{1,2,3\}}` for the quiver `1→ᵃ 2→ᵇ 3`: calculate both `R=0`, whose dual kills
the reversed length-two path, and `R=k(ba)`, whose dual has no quadratic relation.  Use the right
augmentation modules to verify the `Ext≅A!` multiplication order, then repeat with left modules to
exhibit the opposite.  These
computations must fail to typecheck if finite-projectivity or the semisimplicity hypothesis is
removed from a theorem that uses linear duals.

## Ordering and cross-roadmap dependencies

Layer 0 fixes the representation and signs.  Layers 1 and 2 build the strict and higher algebraic
objects.  Layer 3 uses both for transfer.  Layer 4 uses Layers 0--3 for bar--cobar and twisting.
Layer 5 constructs derived and perfect categories; Layer 6 builds Morita theory on them.  Layer 7
uses pretriangulated envelopes and the Grothendieck-group dependency.  Layer 8 uses bar
coderivations and Morita bimodules.  Layers 9--10 use perfect categories, Hochschild theory, and
the dependency roadmap's finite Euler and numerical machinery.  Layer 11 uses the bar, transfer,
and derived-module layers.

The arity sign audit is completed with Layer 0; the DG-as-`A∞` test with Layer 2; the finite
transfer with Layer 3; the two-object twisted path with Layer 5; the quotient test with Layer 7;
the smooth/proper and Euler boundaries with Layers 9--10; and the Koszul checks with Layer 11.

## References

- Ezra Getzler and J. D. S. Jones, [“A-infinity algebras and the cyclic bar
  complex,”](https://projecteuclid.org/journals/illinois-journal-of-mathematics/volume-34/issue-2/A-infinity-algebras-and-the-cyclic-bar-complex/ijm/1255988268.full)
  *Illinois Journal of Mathematics* 34 (1990), 256--283: suspended bar convention, coderivations,
  signs, braces, and cyclic/Hochschild constructions.
- Bernhard Keller, [“Introduction to A-infinity algebras and
  modules,”](https://webusers.imj-prg.fr/~bernhard.keller/publ/ioan.pdf) *Homology, Homotopy and
  Applications* 3 (2001), 1--35: Sections 3.1--3.6 (the pinned operations, arity identities,
  morphisms, strict units, minimal models, bar construction), Sections 4--5 (modules and derived
  modules), and Section 7 (categories and twisted objects).
- Bernhard Keller, [“A-infinity algebras, modules and functor
  categories,”](https://webusers.imj-prg.fr/~bernhard.keller/publ/ainffun.pdf), in *Trends in
  Representation Theory of Algebras and Related Topics*, Contemporary Mathematics 406 (2006),
  67--93: Theorem 2.3 and Proposition 2.4 (minimal models and algebra unit strictification),
  Sections 4.3--4.8
  (bar--cobar, DG envelopes, modules), and Section 5 (functor cocategories).
- Tornike Kadeishvili, “The algebraic structure in the homology of an `A(∞)`-algebra,”
  *Soobshch. Akad. Nauk Gruzin. SSR* 108 (1982), 249--252; and “The structure of the
  `A(∞)`-algebra, and the Hochschild and Harrison cohomologies,” *Trudy Tbiliss. Mat. Inst.* 91
  (1988), 19--27: minimal models, uniqueness, obstruction theory, and intrinsic formality.
- V. K. A. M. Gugenheim, L. A. Lambe, and J. D. Stasheff, “Perturbation theory in differential
  homological algebra II,” *Illinois Journal of Mathematics* 35 (1991), 357--373: complete
  filtered perturbation and transfer.
- S. A. Merkulov, [“Strongly homotopy algebras of a Kähler
  manifold,”](https://doi.org/10.1155/S1073792899000070) *International Mathematics Research
  Notices* 1999 (3), 153--164: explicit recursively transferred higher products.
- Volodymyr Lyubashenko, [“Category of A-infinity-categories,”](https://www2.math.ethz.ch/EMIS/journals/HHA/volumes/2003/n1a1/v5n1a1.pdf)
  *Homology, Homotopy and Applications* 5 (2003), 1--48: functors, transformations, functor
  categories, and unital variants.
- Bernhard Keller, [“Deriving DG
  categories,”](https://webusers.imj-prg.fr/~bernhard.keller/publ/deriving.pdf) *Annales
  scientifiques de l'École Normale Supérieure* 27 (1994), 63--102: DG modules, compact
  generation, perfect objects, tensor/Hom, and derived Morita theory.
- Bernhard Keller, [“On differential graded
  categories,”](https://arxiv.org/abs/math/0601185), in *International Congress of
  Mathematicians, Madrid 2006*, Volume II, 151--190: smooth/proper DG categories, Morita theory,
  localization, and Hochschild invariants.
- Vladimir Drinfeld, [“DG quotients of DG
  categories,”](https://arxiv.org/abs/math/0210114) *Journal of Algebra* 272 (2004), 643--691:
  Sections 1--3 for quotient definitions, universal property, twisted envelopes, exact flatness
  hypotheses, and Verdier comparison.
- Volodymyr Lyubashenko and Sergiy Ovsienko, [“A construction of quotient
  A-infinity-categories,”](https://arxiv.org/abs/math/0211037) *Homology, Homotopy and
  Applications* 8 (2006), 157--203; Volodymyr Lyubashenko and Oleksandr Manzyuk,
  [“Quotients of unital A-infinity-categories,”](https://arxiv.org/abs/math/0306018) *Theory and
  Applications of Categories* 20 (2008), 405--496: nonunital and unital `A∞` quotients.
- Volodymyr Lyubashenko and Oleksandr Manzyuk, [“A-infinity-bimodules and Serre
  A-infinity-functors,”](https://arxiv.org/abs/math/0701165), in *Geometry and Dynamics of Groups
  and Spaces*, Progress in Mathematics 265 (2008), 565--645: `A∞` bimodules, Yoneda, and Serre
  `A∞` functors.
- Alexander Bondal and Mikhail Kapranov, “Enhanced triangulated categories,” *Mathematics of the
  USSR-Sbornik* 70 (1991), 93--107, and [“Representable functors, Serre functors, and
  mutations,”](https://doi.org/10.1070/IM1990v035n03ABEH000716) *Mathematics of the USSR-Izvestiya*
  35 (1990), 519--541: twisted/pretriangulated envelopes and Serre functors.
- Bertrand Toën, [“The homotopy theory of dg-categories and derived Morita
  theory,”](https://arxiv.org/abs/math/0408337) *Inventiones Mathematicae* 167 (2007), 615--667:
  quasi-functors, bimodule mapping objects, internal Homs, localization, and Morita theory.
- Jean-Louis Loday and Bruno Vallette, *Algebraic Operads*, Grundlehren der mathematischen
  Wissenschaften 346, Springer (2012), Chapters 9--10: bar--cobar constructions, twisting
  morphisms, homotopy transfer, and operadic Koszul duality.
- Murray Gerstenhaber, “On the deformation of rings and algebras,” *Annals of Mathematics* 79
  (1964), 59--103: Hochschild brackets, infinitesimal deformations, and obstructions; J. Peter May,
  “Matric Massey products,” *Journal of Algebra* 12 (1969), 533--568: defining systems and
  indeterminacy.
- Ezra Getzler, [“Lie theory for nilpotent
  L-infinity algebras,”](https://annals.math.princeton.edu/2009/170-1/p04) *Annals of Mathematics*
  170 (2009), 271--301: nilpotent Maurer--Cartan simplicial sets and gauge theory.
- Bernhard Keller, [“Deformed Calabi--Yau completions,”](https://arxiv.org/abs/0908.3499)
  *Journal für die reine und angewandte Mathematik* 654 (2011), 125--180, Sections 4--5: the
  tensor-algebra completion `Π_n(A)=T_A(θ_A[n-1])`, its bimodule Calabi--Yau structure, and the
  deformation by a Hochschild class.
- Dmytro Shklyarov, [“Hirzebruch--Riemann--Roch theorem for DG
  algebras,”](https://arxiv.org/abs/0710.1937) *Proceedings of the London Mathematical Society*
  106 (2013), 1--32: proper DG algebras, perfect-module Chern characters, HRR, and
  nondegeneracy of the Hochschild pairing under smoothness.
- Christopher Brav and Tobias Dyckerhoff, [“Relative Calabi--Yau
  structures,”](https://arxiv.org/abs/1606.00619) *Compositio Mathematica* 155 (2019), 372--412:
  smooth/proper duality and Hochschild versus negative-cyclic Calabi--Yau structures.
- Paul Balmer and Marco Schlichting, “Idempotent completion of triangulated categories,”
  *Journal of Algebra* 236 (2001), 819--834; Marco Schlichting, “Negative K-theory of derived
  categories,” *Mathematische Zeitschrift* 253 (2006), 97--134: Karoubi envelopes and the
  localization correction beyond `K₀`.
- Robert W. Thomason, “The classification of triangulated subcategories,” *Compositio
  Mathematica* 105 (1997), 1--27: dense triangulated subcategories and the `K₀` boundary.
- Alexander Beilinson, Victor Ginzburg, and Wolfgang Soergel, [“Koszul duality patterns in
  representation theory,”](https://www.ams.org/journals/jams/1996-9-02/S0894-0347-96-00192-0/)
  *Journal of the American Mathematical Society* 9 (1996), 473--527, Section 2: quadratic Koszul
  rings, diagonal Ext, dual Koszulity, and locally finite double duality.
- Leonid Positselski, [*Two Kinds of Derived Categories, Koszul Duality, and
  Comodule-Contramodule Correspondence*](https://bookstore.ams.org/memo-212-996), Memoirs of the
  American Mathematical Society 212, no. 996 (2011), Chapter 6 and Appendices A--B: conilpotent
  and nonconilpotent Koszul duality, second-kind derived categories, homogeneous Koszul duality,
  and DG bar--cobar duality.
