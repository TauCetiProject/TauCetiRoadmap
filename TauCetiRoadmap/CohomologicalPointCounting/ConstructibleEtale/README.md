# Roadmap: constructible étale coefficients and finite-coefficient cohomology

This roadmap builds the coefficient theory used throughout cohomological arithmetic geometry. Its central objects are finite locally constant and constructible sheaves of modules on the small étale site, bounded complexes with constructible cohomology and finite Tor dimension, and their étale cohomology.

The mathematical progression is

\[
\text{module sheaves and geometric stalks}
\longrightarrow
\text{lisse sheaves}
\longrightarrow
\text{constructible sheaves}
\longrightarrow
D^b_{\mathrm{ctf}}(X,\Lambda)
\longrightarrow
\text{finite-coefficient étale cohomology}.
\]

Suggested code home:

```text
TauCeti/AlgebraicGeometry/EtaleCohomology/Constructible/
```

Suggested Lean namespaces:

```text
TauCeti.AlgebraicGeometry
TauCeti.AlgebraicGeometry.Etale
```

The Markdown roadmap is the definitive specification. `Suggested.lean` is a nonexhaustive prototype and should acquire compiled signatures only when the underlying sheaf and derived-category types can be stated without empty placeholders.

## Primary references and source-to-layer map

* The Stacks Project, Chapter 59, [Étale Cohomology](https://stacks.math.columbia.edu/tag/03N1), especially §§59.29, 59.34--59.38, 59.64--59.77.
* SGA 1, Exposé V, for finite étale Galois categories and the étale fundamental group.
* SGA 4, Exposés IX, XI, XIV, and XVII.
* P. Deligne, *Cohomologie étale* (SGA 4½), Arcata lectures and finiteness formalism.
* J. S. Milne, *Étale Cohomology*, Chapters II and V.

| Roadmap material | Main source |
|---|---|
| Geometric stalks and functoriality | Stacks, §§59.29, 59.34--59.38 |
| Locally constant sheaves | Stacks, §§59.64--59.65 |
| Finite étale Galois category and monodromy | SGA 1, Exposé V; Mathlib `CategoryTheory.Galois` |
| Extension by zero at the abelian level | Stacks, §59.70 |
| Constructible sheaves | Stacks, §§59.71--59.74 |
| Constructible complexes | Stacks, §59.76 |
| Finite Tor dimension | Stacks, §59.77 |
| Kummer sheaves and twists | Stacks, §59.28; SGA 4½ |

## Standing conventions

### Coefficient rings

Let \(\Lambda\) be a finite commutative ring and fix \(N\ge1\) annihilating \(\Lambda\). Every theorem involving Kummer exactness, finite étale cohomological finiteness, or base change assumes that \(N\) is invertible on the relevant base scheme; constructibility theory and purely categorical closure theorems carry no invertibility hypothesis.

The standard coefficient systems are

\[
\Lambda=\mathbf Z/n\mathbf Z,
\qquad
\Lambda_m=\mathbf Z/\ell^m\mathbf Z.
\]

Build a reusable predicate saying that an integer is invertible on a scheme, with equivalent affine, stalkwise, and residue-field formulations. Do not repeat the phrase “\(n\) is invertible on \(X\)” as an unstructured collection of local hypotheses.

### Site model

Use Mathlib's small affine étale site when essential smallness is required for Grothendieck-abelian and derived-category constructions. Transport statements to the ordinary small étale site through Mathlib's sheaf equivalence. Do not maintain two independent theories.

### Sheaves of modules

The primary abelian category is the category of sheaves of \(\Lambda\)-modules on the small étale site. It should be represented using Mathlib's module-valued sheaf and `ModuleCat` infrastructure, not as an abelian-group sheaf plus an unbundled action.

### Lisse and constructible

A lisse finite \(\Lambda\)-sheaf means a finite locally constant sheaf of \(\Lambda\)-modules. “Constructible” means constructible relative to a finite stratification by locally closed subschemes, with lisse finite restriction to each stratum. On Noetherian schemes this agrees with the standard affine-local characterization of the Stacks Project; on merely locally Noetherian schemes the finite-stratification notion is strictly stronger, so this family states its constructibility theory for Noetherian schemes and treats the locally Noetherian case affine-locally.

Do not use “lisse” for arbitrary locally constant infinite modules in this roadmap.

### Derived category

The primary derived coefficient category is

\[
D^b_{\mathrm{ctf}}(X,\Lambda),
\]

consisting of bounded complexes whose cohomology sheaves are constructible and which have finite Tor dimension over \(\Lambda\). Finite Tor dimension is part of the type-level interface used by compact support and traces; it is not a theorem-specific assumption attached only at the final stage.

## What Mathlib already has: consume

Before implementation, re-check Mathlib and open pull requests. Consume the following existing infrastructure.

* `AlgebraicGeometry.Scheme.Etale` and the big and small étale topologies.
* `AlgebraicGeometry.Scheme.AffineEtale`, including essential smallness and `Scheme.AffineEtale.sheafEquiv`.
* Grothendieck-abelian instances for sheaf categories on the small affine étale site.
* geometric points and enough points from `Mathlib/AlgebraicGeometry/Sites/EtalePoint`.
* `CategoryTheory.Sheaf.H` and generic sheaf-cohomology/Ext infrastructure.
* sheaves valued in `ModuleCat`, abelian-category instances, exactness and stalkwise criteria.
* homological complexes, cohomology objects, derived categories, shifts, truncations, distinguished triangles, Ext, and derived tensor products already in Mathlib.
* scheme-theoretic open and closed immersions, locally closed immersions, constructible subsets, and finite-cover infrastructure; extend the existing APIs rather than defining parallel notions.
* roots of unity, `IsUnit`, finite modules, and tensor products.
* Mathlib's `CategoryTheory.PreGaloisCategory`, `GaloisCategory`, `FiberFunctor`, profinite automorphism-group topology, and the equivalence with finite continuous actions.

Mathlib gives the site, sheaf-category, and cohomological foundations but does not package the finite constructible coefficient theory required here.

## What is missing: build here

The missing reusable library consists of:

1. the scheme-level invertibility predicate for coefficient torsion;
2. module-valued geometric stalks and their exactness/conservativity API;
3. finite locally constant/lisse étale sheaves;
4. the finite étale Galois category, geometric fibre functors, étale paths, and the profinite étale fundamental group;
5. finite stratifications by locally closed subschemes;
6. constructible module sheaves and their abelian-category closure properties;
7. support and restriction APIs for constructible sheaves;
8. roots-of-unity sheaves, Kummer theory, and Tate twists;
9. derived tensor and internal-Hom interfaces at the constructible level;
10. bounded constructible complexes;
11. finite Tor amplitude and the category \(D^b_{\mathrm{ctf}}\);
12. finite-coefficient étale cohomology with module structure and standard functoriality;
13. finite group actions and equivariant cohomology actions needed by downstream Frobenius and monodromy constructions.

## The build, in layers

### Layer 0: coefficient torsion invertible on a scheme

Define a Mathlib-native predicate expressing that \(n\in\mathbf N\) is invertible on a scheme \(X\). Prove equivalences between:

* invertibility in every stalk \(\mathcal O_{X,x}\);
* invertibility on every affine open coordinate ring;
* absence from every residue characteristic;
* factorization of the structure morphism through \(\operatorname{Spec}\mathbf Z[1/n]\).

Prove stability under base change, restriction to open and locally closed subschemes, composition of structure maps, divisors of \(n\), and products.

For a finite coefficient ring \(\Lambda\), expose an annihilating integer and the derived condition that the torsion of \(\Lambda\) is invertible on \(X\).

### Layer 1: module sheaves and geometric stalks

Define the category

\[
\operatorname{Sh}(X_{\acute et},\Lambda\text{-Mod})
\]

using the small affine étale site as the essentially small model. Prove and package:

* its abelian and Grothendieck-abelian structures;
* kernels, cokernels, limits, colimits, and exactness;
* constant \(\Lambda\)-module sheaves;
* restriction and scalar restriction/extension along coefficient-ring maps;
* tensor products and internal Hom where supplied by the general sheaf API;
* underived pullback of module-valued sheaves along the morphism of small étale sites induced by a morphism of schemes, with composition and identity lemmas.

Extend Mathlib's geometric-point functors to module-valued sheaves. For every geometric point \(\bar x\to X\), construct the stalk

\[
\mathcal F_{\bar x}
\]

as a \(\Lambda\)-module. Prove:

* exactness of stalks;
* compatibility with all colimits and with finite limits in the module-valued sheaf categories used here;
* compatibility with tensor products and coefficient change;
* conservativity of the family of all geometric stalks;
* the stalkwise criteria for monomorphisms, epimorphisms, isomorphisms, exact sequences, and vanishing.

Do not reprove these statements separately for abelian-group-valued and module-valued sheaves. Transport or generalize the existing Mathlib statements.

### Layer 2: finite locally constant and lisse sheaves

Define a locally constant sheaf using étale-local triviality by a constant module sheaf. Define a finite lisse \(\Lambda\)-sheaf by requiring a finite underlying \(\Lambda\)-module on local trivializations.

Develop:

* local trivializations and refinement;
* invariance under isomorphism;
* pullback stability;
* closure under finite limits, finite colimits, kernels, cokernels, and extensions; closure under tensor products; and dual/internal-Hom constructions for sheaves whose stalks are finite projective \(\Lambda\)-modules;
* constant finite sheaves as lisse sheaves;
* local constancy of stalk cardinality and module isomorphism type on connected components;
* descent along étale covers;
* equivalence between finite lisse \(\Lambda\)-module sheaves and finite étale \(X\)-schemes equipped with fibrewise \(\Lambda\)-module operations whose structure maps are morphisms over \(X\).

The representation-theoretic classification and path transport are built in the next layer from Mathlib's Galois-category abstraction.

### Layer 3: finite étale Galois category, paths, and monodromy

For a scheme \(X\), define the category `FiniteEtale X` as the full subcategory of `Over X` on morphisms that are finite and étale. Build pullback, finite coproduct, connected-component, deck-transformation, and quotient constructions using Mathlib's scheme and categorical APIs.

For connected nonempty locally Noetherian \(X\), prove that `FiniteEtale X` is a Galois category in the sense of Mathlib's `CategoryTheory.PreGaloisCategory` and `CategoryTheory.GaloisCategory`. In particular, construct and verify:

* the terminal object and pullbacks;
* finite coproducts and decomposition into connected components;
* quotients by finite group actions;
* the direct-summand property for monomorphisms;
* effective finite étale descent used by these constructions.

For a geometric point \(\bar x\to X\), define the geometric fibre functor

\[
F_{\bar x}:\operatorname{FiniteEtale}(X)\longrightarrow\operatorname{Fintype}
\]

by lifts of \(\bar x\) to a finite étale cover. Prove the `FiberFunctor` axioms and compatibility with pullback of covers.

Define the profinite étale fundamental group by

\[
\pi_1^{\acute et}(X,\bar x)=\operatorname{Aut}(F_{\bar x})
\]

with the topology already supplied by Mathlib's Galois-category theory. For geometric points in the same connected component, define an étale path

\[
\operatorname{EtalePath}(\bar x,\bar y)
=
\operatorname{Iso}(F_{\bar x},F_{\bar y})
\]

as a natural isomorphism of fibre functors. Build identity paths, inverse paths, composition, the simply transitive left/right actions by the two fundamental groups, and nonemptiness of the path type for connected \(X\). This gives an étale fundamental groupoid without choosing paths globally.

Apply Mathlib's fundamental theorem of Galois categories to prove:

* finite étale covers of connected \(X\) are equivalent to finite continuous \(\pi_1^{\acute et}(X,\bar x)\)-sets;
* connected covers correspond to transitive actions;
* finite lisse \(\Lambda\)-module sheaves are equivalent to finite continuous \(\Lambda\)-module representations;
* a chosen étale path transports fibres of every finite lisse sheaf, with identity, inverse, composition, tensor, and dual compatibility;
* change of basepoint conjugates the based monodromy representation by the chosen path.

For a disconnected locally Noetherian scheme, package the theory componentwise through the resulting fundamental groupoid. Do not choose a basepoint in every component as hidden global data.

### Layer 4: finite stratifications

Build a reusable finite stratification API for a locally Noetherian scheme \(X\). A stratification consists of finitely many locally closed immersions

\[
j_i:X_i\hookrightarrow X
\]

whose images are pairwise disjoint and cover \(|X|\).

Prove:

* restriction to opens and locally closed subschemes;
* pullback of a stratification;
* common refinement of two finite stratifications;
* refinement by intersections;
* gluing of stratifications along an open--closed decomposition;
* induction on the number of strata;
* Noetherian induction tools producing a dense open stratum and a closed complement.

The images and covering conditions should be expressed using Mathlib's scheme/topological APIs, not as an independent finite partition of points disconnected from subschemes.

### Layer 5: constructible sheaves

For Noetherian \(X\), define a finite constructible \(\Lambda\)-module sheaf as one admitting a finite stratification on which every restriction is finite lisse; on locally Noetherian \(X\), a sheaf is constructible when its restriction to every affine open is. On Noetherian \(X\) the two notions agree — a target of this layer, together with the standard equivalent formulations of the Stacks Project.

Prove independence of the chosen stratification. Define abelian-level extension by zero \(j_!\) along an open immersion, with its adjunction against restriction, exactness, and stalk description; the derived compactly supported theory built on \(j_!\) is owned by `CompactSupport`. Build the ordinary API:

* pullback stability;
* locality for the étale and Zariski topologies;
* closure under kernels, cokernels, extensions, finite direct sums, and tensor products; dual closure for constructible sheaves with finite-projective stalks;
* constructibility of images and coimages;
* support as a constructible subset;
* restriction to open, closed, and locally closed subschemes;
* gluing across an open--closed decomposition;
* constructibility after extension by zero along a quasi-compact open immersion;
* finite stalks, and finite sets of stalk isomorphism types on quasi-compact \(X\);
* scalar extension and restriction along maps of finite coefficient rings.

Prove that constructible sheaves form a Serre subcategory of the abelian category of all \(\Lambda\)-module sheaves.

### Layer 6: roots of unity and Tate twists

For \(n\) invertible on \(X\), define the étale roots-of-unity sheaf

\[
\mu_n=\ker(\mathbf G_m\xrightarrow{(-)^n}\mathbf G_m)
\]

as a sheaf of \(\mathbf Z/n\mathbf Z\)-modules. Prove that it is finite lisse and establish the Kummer exact sequence

\[
0\longrightarrow\mu_n
\longrightarrow\mathbf G_m
\xrightarrow{(-)^n}\mathbf G_m
\longrightarrow0
\]

on the small étale site.

For \(\Lambda\) annihilated by \(N\) invertible on \(X\), define \(\Lambda(1)=\Lambda\otimes_{\mathbf Z/N\mathbf Z}\mu_N\), positive Tate twists by its tensor powers, negative twists using the dual, and arbitrary integer twists; for \(\Lambda_m=\mathbf Z/\ell^m\mathbf Z\) this is the tower of powers of \(\mu_{\ell^m}\). Prove:

* additivity of twists;
* compatibility with pullback, tensor products, and duals;
* compatibility across \(m\) for the \(\ell\)-power tower;
* for a separably closed field containing \(\mu_n\), an equivalence between \(\mu_n\) and the constant \(\mathbf Z/n\mathbf Z\)-sheaf after choosing a primitive \(n\)-th root, with change-of-choice described by \((\mathbf Z/n\mathbf Z)^\times\);
* finite lissity and constructibility.

Pin the convention at finite level: arithmetic Frobenius acts on \(\Lambda_m(1)=\mu_{\ell^m}\) by \(q\), and geometric Frobenius by its inverse. The \(\mathbf Q_\ell(1)\) form of this convention, with geometric Frobenius acting by \(q^{-1}\), is stated by `EllAdicRealization`.

### Layer 7: constructible complexes

For a homological complex or derived object \(K\), define constructible cohomology by requiring every cohomology sheaf \(\mathcal H^i(K)\) to be constructible. Define bounded constructible objects and prove stability under:

* shifts;
* cones and distinguished triangles;
* truncations;
* finite direct sums;
* derived pullback;
* derived tensor products when one factor has finite Tor dimension over \(\Lambda\);
* derived internal Hom when the source is bounded with constructible cohomology of finite-projective stalks.

Build the full subcategory

\[
D^b_c(X,\Lambda).
\]

The definition should be independent of a chosen complex representative.

### Layer 8: finite Tor dimension

Define Tor amplitude in an interval \([a,b]\) for a complex of sheaves of \(\Lambda\)-modules, using derived tensor product with arbitrary \(\Lambda\)-modules or the equivalent stalkwise criterion.

Prove:

* equivalence of global and geometric-stalk formulations;
* invariance under quasi-isomorphism;
* stability under pullback, shifts, triangles, tensor products, and duality where applicable;
* local nature on \(X\);
* finite locally free sheaves have Tor amplitude \([0,0]\);
* bounded complexes of finite projective lisse sheaves have finite Tor dimension.

Define

\[
D^b_{\mathrm{ctf}}(X,\Lambda)
\]

as the full subcategory of \(D^b_c\) on finite-Tor-dimension objects. Prove it is triangulated and symmetric monoidal under derived tensor product.

### Layer 9: finite-coefficient étale cohomology

Package derived global sections

\[
R\Gamma(X,-)
\]

and cohomology

\[
H^i_{\acute et}(X,K)
\]

for module-valued sheaves and derived objects. Reuse Mathlib's sheaf cohomology and derived-functor machinery; do not define cohomology as a new unrelated construction.

Build:

* functoriality in coefficients;
* contravariant functoriality in schemes, through the underived pullback of Layer 1 — the topos-level packaging and the derived theory are owned by `EtaleBaseChange`;
* long exact sequences;
* cup products;
* coefficient change;
* group actions induced by automorphisms of \(X\) and equivariant structures on \(K\);
* comparison with Čech cohomology for a finite étale cover whose finite intersections are acyclic for the coefficient sheaf, stated through the associated Čech-to-derived spectral sequence;
* cohomology of a geometric point and a separably closed field;
* the Kummer long exact sequence and its standard low-degree interpretations.

Keep cohomology objects as \(\Lambda\)-modules. Do not forget the coefficient action and then reconstruct it downstream.

### Layer 10: finite-group equivariance

Let a finite group \(G\) act on \(X\). Define a \(G\)-equivariant étale coefficient object as coherent isomorphisms between pullbacks along the action maps. Build:

* pullback and tensor operations on equivariant objects;
* induced \(G\)-actions on \(R\Gamma\) and \(H^i\);
* invariance under equivariant isomorphism;
* restriction along group homomorphisms;
* compatibility with stalks and stabilizer actions.

This layer supplies a common interface for finite monodromy and symmetry. It does not construct quotient stacks.

**Summit:** `D^b_ctf(X, Λ)` is a usable functorial coefficient category with geometric stalks, Tate twists, tensor products, cohomology actions, and a path-aware finite-monodromy interface built from the finite étale Galois category.

## Worked examples and acceptance criteria

1. Constant finite \(\Lambda\)-module sheaves are lisse and constructible.
2. A finite étale cover \(Y\to X\) produces a permutation sheaf, and the geometric fibre functor makes finite étale covers into a Galois category over connected \(X\).
3. A chosen étale path transports the fibre of a nontrivial finite lisse sheaf and satisfies composition with a second path.
4. On \(X=\operatorname{Spec}\bar k\), every finite lisse sheaf is constant and higher étale cohomology vanishes.
5. For \(n\) invertible on \(X\), the Kummer sequence is exact on geometric stalks and hence exact as a sequence of sheaves.
6. Tate twists satisfy \(\Lambda(a)\otimes^L\Lambda(b)\simeq\Lambda(a+b)\).
7. Constructible sheaves glue across an open--closed decomposition.
8. `D^b_ctf` is closed under shifts, cones, pullback, and derived tensor product.
9. A finite group action on \(X\) induces the expected action on cohomology of an equivariant coefficient object.

A contributor should not declare a layer complete when only a predicate exists. Lisse and constructible objects need restriction, pullback, tensor, exact-sequence, stalk, support, and equivalence-invariance APIs.

## Design notes for Lean

### Transport through the small affine site

Use the essentially small affine site to obtain Grothendieck-abelian and derived constructions. Expose user-facing statements on the ordinary small étale site through the existing sheaf equivalence. Keep the equivalence and all transports centralized.

### Use subcategories, not duplicated categories

Constructible and ctf objects should be full subcategories of the existing sheaf and derived categories. Do not create a second notion of morphism or quasi-isomorphism.

### Make stalkwise proofs reusable

Conservativity and exactness of geometric stalks should support generic lemmas saying that a property of a morphism follows from all stalks. Avoid repeating the same pointwise argument in Kummer, constructibility, base change, and trace files.

### Do not encode stratifications as evidence-free predicates

A constructibility proof needs an actual finite stratification that can be refined and pulled back. Provide both the existential predicate and a structured witness API.

## Scope boundaries

The following are not targets of this roadmap:

* proper and smooth base change, owned by `EtaleBaseChange`;
* \(Rf_!\) and compact support, owned by `CompactSupport`;
* analytification and Artin comparison, owned by `ComplexComparison`;
* inverse systems and \(\ell\)-adic coefficients, owned by `EllAdicRealization`;
* traces and Grothendieck--Lefschetz, owned by `TraceFormula`;
* perverse sheaves;
* arbitrary ind-constructible or unbounded \(\ell\)-adic coefficient categories;
* quotient stacks or equivariant derived categories of stacks.

## Completion criterion

This roadmap is complete when:

* finite lisse and constructible \(\Lambda\)-module sheaves are defined on the small étale site with complete stalkwise and algebraic APIs;
* the finite étale category is a Mathlib Galois category, geometric fibre functors and étale paths are implemented, and finite lisse sheaves have their continuous monodromy classification;
* finite stratifications and common refinements are formalized;
* constructible sheaves form the required Serre subcategory;
* roots-of-unity sheaves, Kummer exactness, and all integer Tate twists are available;
* bounded constructible complexes and finite Tor amplitude are formalized;
* \(D^b_{\mathrm{ctf}}(X,\Lambda)\) is triangulated and supports the required tensor operations;
* finite-coefficient étale cohomology retains its module structure and has long exact sequences, cup products, coefficient change, and automorphism actions;
* finite group equivariance is supported;
* the worked examples pass;
* the Tau Ceti implementation contains no `sorry`.
