# Roadmap: Gorenstein homological algebra

Gorenstein projective, injective, and flat modules over an associative ring, the complete
resolutions that define them, the homological dimensions they measure, and the strongly
Gorenstein modules that generate them under direct summands.

The subject replaces "projective" by "admits a complete resolution by projectives" and recovers a
homological dimension theory that is finite far more often than the projective one: over a
quasi-Frobenius ring every module has Gorenstein projective dimension zero while the projective
dimension theory is degenerate. The three classes are built in parallel throughout, and the
strongly Gorenstein classes are what make the general ones tractable, because every Gorenstein
projective module is a direct summand of a strongly Gorenstein projective one.

## Scope boundary

This roadmap covers modules and their Gorenstein dimensions over an associative unital ring. It
builds complete resolutions concretely, as complexes of modules with `Function.Exact` exactness
conditions and functor-exactness conditions, and it develops the resulting dimension theory. It
does not construct or use:

- Gorenstein or Cohen--Macaulay conditions on *rings* by way of dualizing complexes, canonical
  modules, local duality, or local cohomology;
- Gorenstein orders in number fields, which `GlobalNumberFields` owns as
  `NumberFieldOrder.IsGorenstein`;
- singularity categories, Verdier quotients, derived localization, or the stable module category
  as a triangulated category;
- Tate cohomology constructed through a derived category, or complete cohomology of groups;
- DG or A-infinity resolutions, which `DGAInfinity` owns;
- Auslander--Buchweitz approximation theory, or covers and envelopes in greater generality than
  the Gorenstein flat theory in Layer 6 consumes. Cotorsion pairs are *not* excluded: Layer 6
  needs the completeness of the `PGF` cotorsion pair, so the definition and the completeness
  statement are in scope, while the general theory of cotorsion pairs, deconstructibility, and
  the induced abelian model structures is not;
- Gorenstein categories, Gorenstein rings of finite Gorenstein global dimension as a
  classification target, or Gorenstein homological algebra over schemes.

Commutativity of the base ring is assumed exactly where Mathlib's `Module.Flat` forces it, and
nowhere else; the projective and injective theories are built over an arbitrary `Ring`.

This has a consequence worth stating rather than discovering. In the literature the Gorenstein
flat modules are a one-sided notion: a *right* `R`-module is Gorenstein flat when its complex of
flats stays exact under `− ⊗ I` for every injective *left* `R`-module `I`, and results such as
character-module duality trade the two sides against each other. `Module.Flat` is stated over a
`CommSemiring`, so every flat milestone here is the commutative specialization, where the two
sides coincide and the sidedness is invisible. The roadmap does not ask anyone to generalize
`Module.Flat`; it asks that flat milestones say `CommRing` in their statements, so that the day
Mathlib's flatness becomes one-sided the milestones that need revisiting are the ones that say so.

## Standing conventions

### Mathlib vocabulary

Every notion that Mathlib already spells is used in Mathlib's spelling: `Module.Projective`,
`Module.Injective` (with `Module.Baer` for its criterion), `Module.Flat`, `Function.Exact`,
`LinearMap.range`, `LinearMap.ker`, `TensorProduct.map`. No private predicate is introduced for
anything Mathlib states directly, and no notion here is wrapped in a new predicate when a
hypothesis says it in one line.

### Complexes and exactness

A complete resolution in this roadmap is a complex together with the statement that a functor
leaves it exact. Two presentations appear, and the roadmap fixes which is used where.

The periodic presentation carries a single module `P` and a single differential `f : P →ₗ[R] P`.
Exactness of `⋯ → P -f→ P -f→ P → ⋯` is then `Function.Exact f f`, a single condition, because the
complex repeats; and `f ∘ₗ f = 0` follows from it rather than being carried separately. This is
the presentation the strongly Gorenstein classes use, and it is what "strongly" names.

The general presentation is a `CochainComplex (ModuleCat R) ℤ` that is exact in every degree, with
projective (respectively injective, flat) terms. This is the presentation the general Gorenstein
classes use. Layer 1 states the comparison: a periodic complex unrolls to a general one.

### Universes

The ring lives in `Type u` and modules in `Type v`, independently, matching
`Module.Projective (R : Type*) (P : Type*)`. Where a definition quantifies over test objects — the
projective `Q` in `Hom(-,Q)`, the injective `E` in `Hom(E,-)`, the injective `I` in `I ⊗ -` — that
quantifier is restricted to a single universe, following `Module.Injective`, whose own field reads
`∀ ⦃X Y : Type v⦄`. Each such definition is accompanied by the lemma moving it across universes.

### Ext and Tor

Vanishing conditions are stated twice and proved equivalent. The intrinsic form is exactness of a
Hom or tensor complex, which stays inside `Module R` and is what the definitions use. The named
form is `Ext` from `Mathlib.Algebra.Homology.DerivedCategory.Ext` on `ModuleCat R`, and Tor
likewise. Layer 4 proves the two agree; no milestone states a vanishing condition in only one of
the two forms.

## Existing foundations and formalization boundary

### Mathlib material to consume

`Module.Projective`, `Module.Injective`, `Module.Baer` and `Module.Baer.injective`, `Module.Flat`
(which requires `CommSemiring` on the base and so bounds the generality of every flat milestone),
`Function.Exact` with `Function.Exact.linearMap_comp_eq_zero` and
`LinearMap.exact_iff`, `TensorProduct.map` with its functoriality lemmas, `HomologicalComplex` and
`CochainComplex`, the abelian structure on `ModuleCat R`, and `CategoryTheory.Abelian.Ext`.

### Tau Ceti material to consume

None. This is a greenfield area: no Tau Ceti file develops Gorenstein homological algebra, and the
occurrences of the name elsewhere in the library refer to Daniel Gorenstein in classification
bibliographies.

### Sibling-roadmap dependencies

`GrothendieckEulerForms` supplies Grothendieck groups and Euler forms and explicitly excludes
singularity categories and stable, Frobenius, and periodic categories, so the boundary with this
roadmap is clean in both directions. `ZigzagPreprojective` supplies self-injective and symmetric
Frobenius algebras, which Layer 5 consumes as the source of examples where every module is
Gorenstein projective.

## The build, in layers

### Layer 0: totally acyclic complexes and the homotopy criterion

- Define, for a self-map `f : M →ₗ[R] M`, what it means for the periodic complex
  `⋯ → M -f→ M -f→ M → ⋯` to be exact, and prove it is `Function.Exact f f`. Derive `f ∘ₗ f = 0`
  from it.
- Prove the homotopy criterion: if `f ∘ₗ f = 0` and there is `s : M →ₗ[R] M` with
  `f ∘ₗ s + s ∘ₗ f = LinearMap.id`, then `Function.Exact f f`. Prove the converse fails by
  exhibiting an exact periodic complex with no contraction.
- Prove that a contraction is carried by every additive functor built in this roadmap: state and
  prove the transport of `f ∘ₗ s + s ∘ₗ f = id` along `Hom(-,Q)`, `Hom(E,-)`, and `I ⊗ -`, with
  the induced maps and induced homotopies named. These three transport lemmas are the basic API
  that every witness construction in Layers 2 and 5 consumes.
- Define the general totally acyclic complex of projectives (respectively injectives, flats) as an
  exact `CochainComplex (ModuleCat R) ℤ` with the stated terms, left exact by the relevant functor.

### Layer 1: Gorenstein projective, injective, and flat modules

- Define `IsGorensteinProjective`, `IsGorensteinInjective`, and `IsGorensteinFlat` by way of the
  general totally acyclic complexes of Layer 0, as the modules arising as a cocycle of such a
  complex.
- Prove every projective module is Gorenstein projective, every injective module is Gorenstein
  injective, every flat module is Gorenstein flat.
- Prove each class is closed under arbitrary direct sums and under direct summands, and that
  Gorenstein projective modules are closed under extensions.
- Prove a Gorenstein projective module embeds in a projective module with Gorenstein projective
  cokernel, and the injective and flat duals of this statement.
- Prove the unrolling comparison: a periodic complex in the sense of Layer 0 yields a general
  totally acyclic complex with the same cocycle.

### Layer 2: strongly Gorenstein modules

- Define `IsStronglyGorensteinProjective`, `IsStronglyGorensteinInjective`, and
  `IsStronglyGorensteinFlat` by way of the periodic presentation: a projective (respectively
  injective, flat) module `P` with `f : P →ₗ[R] P`, the complex exact, the complex left exact by
  `Hom(-,Q)` for every projective `Q` (respectively `Hom(E,-)` for every injective `E`, `I ⊗ -`
  for every injective `I`), and the module isomorphic to `LinearMap.range f`.
- Prove every projective module is strongly Gorenstein projective, and the injective and flat
  analogues, by the contractible witness `P × P` with `f (x, y) = (y, 0)` and contraction
  `s (x, y) = (0, x)`, discharging every functor-exactness condition through the Layer 0 transport
  lemmas.
- Prove a strongly Gorenstein projective module embeds in a projective module, and deduce that the
  class is a proper subclass of all modules by exhibiting a module that is not one.
- Prove strongly Gorenstein implies Gorenstein in each of the three cases, using the Layer 1
  unrolling comparison.
- Prove the short exact sequence characterization: a module `M` is strongly Gorenstein projective
  if and only if there is an exact sequence `0 → M → P → M → 0` with `P` projective and `Ext¹(M,Q)`
  vanishing for every projective `Q`, and the injective and flat analogues.
- Prove each strongly Gorenstein class is closed under arbitrary direct sums.

### Layer 3: the summand theorem

The projective and injective cases are equivalences; the flat case is not, and the roadmap keeps
them apart. Bennis--Mahdou state the flat case (their Theorem 3.5) in one direction only, and the
equivalence is recovered over a coherent ring by a separate argument. A milestone that states the
flat case as an equivalence over an arbitrary ring is stating something the literature does not
supply, and is not a target here.

- Prove that a module is Gorenstein projective if and only if it is a direct summand of a strongly
  Gorenstein projective module, and the same for the injective case (Bennis--Mahdou Theorem 2.7).
  This is the theorem that makes the general classes computable from the periodic ones, and every
  subsequent layer that reduces a statement about Gorenstein modules to the periodic case cites it.
- Deduce that the Gorenstein projective modules are the smallest class containing the strongly
  Gorenstein projective modules and closed under direct summands, and the injective analogue.
- Prove the one direction available over an arbitrary ring in the flat case: a Gorenstein flat
  module is a direct summand of a strongly Gorenstein flat module (Bennis--Mahdou Theorem 3.5).
- Prove the converse over a coherent ring, giving the equivalence there (Mahdou--Tamekkante
  Proposition 1.3, from Bennis--Mahdou Theorem 3.5 together with Holm Theorem 3.7). State the
  coherence hypothesis in the milestone rather than in a comment.
- Prove the finitely presented comparison over a coherent ring: a finitely presented module is
  strongly Gorenstein projective if and only if it is strongly Gorenstein flat (Bennis--Mahdou
  Corollary 3.7).

### Layer 4: Ext and Tor characterizations

- Construct the comparison between the intrinsic Hom-complex exactness conditions of Layer 2 and
  `Ext` on `ModuleCat R`, and prove the two agree, in each of the three cases; the flat case
  compares tensor exactness with Tor.
- Prove `Ext¹(M,Q) = 0` for every projective `Q` when `M` is Gorenstein projective, and the higher
  vanishing `Extⁿ(M,Q) = 0` for `n ≥ 1`, with the injective and flat duals.
- Prove that over a ring of finite global dimension the Gorenstein projective modules are exactly
  the projective modules, and the same for the injective and flat classes.

### Layer 5: Gorenstein dimensions

- Define Gorenstein projective, injective, and flat dimension of a module as the length of a
  shortest resolution by modules of the corresponding class, valued in `ℕ∞`.
- Prove each dimension is zero exactly on the corresponding Gorenstein class, and that it is
  bounded above by the ordinary projective, injective, and flat dimension.
- Prove the Ext characterization of finite Gorenstein projective dimension, and the dual for
  injective dimension.
- Prove the three inequalities on a short exact sequence `0 → N → N' → N'' → 0` for Gorenstein
  projective dimension and for Gorenstein injective dimension: the dimension of any one of the
  three terms is bounded by the maximum of the dimensions of the other two, adjusted by one in the
  direction the sequence dictates. Each inequality carries an equality clause, and the milestone
  is the inequality together with its clause, not the inequality alone: for Gpd, `Gpd N ≤
  max{Gpd N', Gpd N'' - 1}` with equality when `Gpd N' ≠ Gpd N''`, and similarly for the other two
  (Bennis--Mahdou Lemmas 1.5 and 1.6, from Holm Theorems 2.20 and 2.24).
- Prove the same three inequalities for Gorenstein flat dimension **over a coherent ring**
  (Bennis--Mahdou Lemma 1.7, from Holm Proposition 3.11). The coherence hypothesis is part of the
  statement; the flat case is not known in the generality of the other two.
- Prove that over a quasi-Frobenius ring every module has Gorenstein projective dimension zero,
  consuming the self-injective algebras of `ZigzagPreprojective` for concrete instances.

### Layer 6: the flat theory, and what coherence is still for

The literature this layer rests on moved after Bennis--Mahdou. Until 2020 the good behaviour of
the Gorenstein flat modules was known only over coherent rings, and coherence appears throughout
the 2004--2010 papers for that reason. Šaroch and Šťovíček then proved that over **any** ring the
Gorenstein flat modules are the left-hand class of a complete cotorsion pair and are closed under
extensions, so every ring is GF-closed. A roadmap that presented the coherent-ring statements as
the frontier would send a contributor to prove a special case of a theorem that already holds in
general, so this layer states the general form and keeps coherence only where it is still doing
work.

- Prove that the Gorenstein flat modules are closed under extensions over an arbitrary ring, by
  way of the characterization `M` is Gorenstein flat if and only if `Ext¹(M, C) = 0` for every
  cotorsion `C ∈ PGF⊥` (Šaroch--Šťovíček Theorem 3.11). Closure under direct limits and under
  direct summands comes with it.
- Define the projectively coresolved Gorenstein flat modules, `PGF`: syzygies of an acyclic
  complex of **projectives** that stays exact under `− ⊗ I` for every injective `I`. This is a
  different class from both Gorenstein projective and Gorenstein flat, and it is what makes the
  general statements work.
- Prove `PGF ⊆ GP`, that every `PGF`-module is Gorenstein projective (Šaroch--Šťovíček
  Theorem 3.4), and that `PGF` is the left-hand class of a complete hereditary cotorsion pair with
  thick right-hand class (Theorem 3.9).
- Prove `PGF = GF` if and only if `R` is right perfect (Šaroch--Šťovíček Theorem 3.9, moreover
  clause), which is what separates the three classes.
- Prove the relation between Gorenstein flat and Gorenstein projective dimension over a coherent
  ring, and the finitely presented comparison, where coherence is genuinely used.
- Prove the character-module duality relating Gorenstein flat modules to Gorenstein injective
  modules over the opposite ring, within the commutative generality that `Module.Flat` imposes.

## Open problems, which are not targets

These are stated so that no milestone is written against them by accident. A contributor who finds
a layer's milestone reducing to one of these has found a defect in the roadmap, not a hard exercise.

- **Is every Gorenstein projective module `PGF`?** Equivalently, is `GP ⊆ GF`? Open in general
  (Šaroch--Šťovíček, remark following Theorem 3.9). Over a right ℵ₀-coherent ring it would follow
  from every Gorenstein projective module being filtered by countably presented Gorenstein
  projective modules, itself open. No milestone above asserts `GP ⊆ GF` or `GP ⊆ PGF`.
- **Is `FL ∩ GP = P₀`?** Whether a flat Gorenstein projective module is projective; open, and it
  is what stands between the previous item and `GF ∩ GP ⊆ PGF`.
- **Is the flat summand theorem an equivalence over an arbitrary ring?** Bennis--Mahdou prove one
  direction (Theorem 3.5) and the equivalence over coherent rings; Layer 3 asks for exactly those
  two and no more.

## Named examples and acceptance criteria

### Every projective module

For every projective `P`, `IsStronglyGorensteinProjective R P` holds by the `P × P` witness. This
is the acceptance criterion for Layer 2's definitions: a definition that cannot prove it is wrong.

### `ZMod 2` over `ZMod 4`

Multiplication by `2` on `ZMod 4` has kernel and range both equal to `{0, 2}`, so the periodic
complex it generates is exact, and `ZMod 2` is its cocycle. `ZMod 2` is strongly Gorenstein
projective over `ZMod 4` and is not projective, since `ZMod 4` is local and its projective modules
are free. This is the acceptance criterion separating the Gorenstein classes from the classical
ones, and the same computation over `k[x]/(x²)` with multiplication by `x` is stated alongside it.
Both are stated for the ideal generated by the element rather than for the quotient module it is
isomorphic to, because Mathlib carries no `Module (ZMod 4) (ZMod 2)` instance, while a submodule of
`ZMod 4` is a `ZMod 4`-module directly.

### `ZMod 2` over `ℤ`

`ZMod 2` is not Gorenstein projective over `ℤ`, because `ℤ` has global dimension one and Layer 4
identifies the Gorenstein projective modules with the projective ones there; concretely, a
Gorenstein projective module embeds in a projective module and `ZMod 2` embeds in no torsion-free
group. This is the acceptance criterion for non-degeneracy: it shows the predicates are not
satisfied by every module.

### A quasi-Frobenius ring

Over a quasi-Frobenius ring every module is Gorenstein projective and Gorenstein injective, and
every Gorenstein dimension is zero. Group algebras of finite groups over a field give the
instances.

## Primary references

- D. Bennis and N. Mahdou, *Strongly Gorenstein projective, injective and flat modules*, Journal
  of Pure and Applied Algebra **210** (2007), 437--445.
- H. Holm, *Gorenstein homological dimensions*, Journal of Pure and Applied Algebra **189** (2004),
  167--193.
- E. E. Enochs and O. M. G. Jenda, *Relative Homological Algebra*, de Gruyter, 2000.
- M. Auslander and M. Bridger, *Stable module theory*, Memoirs of the AMS **94**, 1969.
- L. W. Christensen, *Gorenstein Dimensions*, Lecture Notes in Mathematics 1747, Springer, 2000.
- L. W. Christensen, A. Frankild, and H. Holm, *On Gorenstein projective, injective and flat
  dimensions -- a functorial description with applications*, Journal of Algebra **302** (2006),
  231--279.
- N. Mahdou and M. Tamekkante, *Strongly n-Gorenstein projective, injective and flat modules*,
  which supplies the coherent-ring form of the flat summand theorem (Proposition 1.3) and the
  short exact sequence inequalities (Lemmas 1.5--1.7) that Layers 3 and 5 cite.
- J. Šaroch and J. Šťovíček, *Singular compactness and definability for Σ-cotorsion and Gorenstein
  modules*, Selecta Mathematica **26** (2020), article 23; `arXiv:1804.09080`. Layer 6 rests on
  this: the Gorenstein flat and Gorenstein injective classes sit in complete cotorsion pairs over
  an arbitrary ring, and the class `PGF` is introduced there.
- D. Bravo, J. Gillespie, and M. Hovey, *The stable module category of a general ring*,
  `arXiv:1405.5768`, for the modified classes that Šaroch--Šťovíček showed were not necessary --
  context for why the older literature is stated over coherent rings.
