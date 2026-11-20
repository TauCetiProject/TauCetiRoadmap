# Roadmap: complex analytification and Artin comparison

This roadmap connects Mathlib's algebraic geometry to its algebraic topology. It constructs the topological/analytic realization of every finite-type scheme over \(\mathbf C\), proves the geometric and topological finiteness results required for sheaf cohomology, establishes Riemann existence, compares topological sheaf cohomology with singular cohomology and local coefficients, and culminates in Artin comparison with compact support.

The mathematical progression is

\[
\text{complex points and analytification}
\longrightarrow
\text{triangulation and local topology}
\longrightarrow
\text{topological sheaves and local systems}
\longrightarrow
\text{Riemann existence}
\longrightarrow
\text{comparison of sites}
\longrightarrow
\text{Artin comparison}.
\]

Suggested code homes:

```text
TauCeti/AlgebraicGeometry/Analytification/
TauCeti/AlgebraicGeometry/Comparison/
TauCeti/AlgebraicTopology/SheafCohomology/
TauCeti/Topology/Semialgebraic/
```

Suggested Lean namespaces:

```text
TauCeti.AlgebraicGeometry
TauCeti.AlgebraicGeometry.Comparison
TauCeti.AlgebraicTopology
```

Direct roadmap dependencies:

```text
CohomologicalPointCounting/ConstructibleEtale
CohomologicalPointCounting/EtaleBaseChange
CohomologicalPointCounting/CompactSupport
UniversalCovers
```

The dependency on `UniversalCovers` concerns the topological covering-space and fundamental-groupoid API. This roadmap does not duplicate that material.

The Markdown roadmap is the definitive specification. `Suggested.lean` is nonexhaustive.

## Primary references and source-to-layer map

* SGA 1, Exposé XII, for the Riemann existence theorem.
* SGA 4, Exposés XI, XII, and XVI, for the comparison of classical and étale topoi and cohomology.
* J. S. Milne, *Étale Cohomology*, comparison theorem chapters.
* A. Dimca, *Sheaves in Topology*, for topological constructible sheaves and sheaf/singular comparison.
* H. Hironaka and standard semialgebraic/subanalytic triangulation theorems for complex algebraic sets.
* The Stacks Project, Chapter 59 for finite constructible étale coefficients and Chapter 63 for compact support; the Stacks Project does not supply the full complex-analytic comparison development.

| Roadmap material | Main source |
|---|---|
| Affine and global analytification | classical analytification/GAGA foundations; Mathlib affine-analytification design |
| Triangulation and finite homotopy type | semialgebraic triangulation; triangulation of complex algebraic sets |
| Riemann existence | SGA 1, Exp. XII |
| Comparison of sites and constructible sheaves | SGA 4, Exps. XI--XII |
| Elementary fibrations and Artin comparison | SGA 4, Exps. XI and XVI; Milne, §21 |
| Compact-support comparison | SGA 4½; Milne |

## Standing conventions

### Scope of analytification

Analytification is defined for every scheme of finite type over \(\mathbf C\), including nonreduced and singular schemes. Its underlying topological space is the classical topology on complex points of the reduced scheme; its analytic structure remembers nilpotents.

A smooth finite-type complex scheme has a complex-manifold analytification. This is a specialization of the general construction, not the definition of analytification. The roadmap must therefore not make all schemes artificially smooth in order to use a manifold-only API.

### Mathlib design coordination

Mathlib pull request [#34626, “analytification of schemes (affine case)”](https://github.com/leanprover-community/mathlib4/pull/34626) is an explicit design coordination point. Follow its names and structure. Where the needed declaration is absent, build the same mathematical interface locally in Tau Ceti so replacement by a Mathlib import requires deletion rather than redesign.

The cited affine design does not restrict the roadmap to affine schemes or smooth manifolds. General finite-type gluing and singular analytic spaces are explicit targets here.

### Classical topology and analytic spaces

Distinguish:

* the type of complex points \(X(\mathbf C)\);
* its classical topology;
* the associated complex analytic space \(X^{\mathrm{an}}\);
* the underlying topological space of \(X^{\mathrm{an}}\);
* the analytic site and its sheaf category.

Artin comparison uses a morphism from the classical/analytic site to the étale site. A topological space alone is not enough to state every coefficient comparison, while a complex manifold is too restrictive.

### Coefficients

Use the finite constructible coefficient category from `ConstructibleEtale`. The principal theorem is stated for finite commutative \(\Lambda\) and

\[
K\in D^b_{\mathrm{ctf}}(X,\Lambda).
\]

The comparison includes finite locally constant coefficients and their corresponding topological local systems. Constant coefficients are a corollary, not the only supported case.

### Cohomology theories

Keep three constructions distinct until comparison theorems identify them:

1. étale sheaf cohomology of \(X\);
2. sheaf cohomology on \(X^{\mathrm{an}}\);
3. singular cohomology of the underlying topological space, with local coefficients where required.

Do not define one as an alias for another before proving comparison.

## What Mathlib and Tau Ceti already have: consume

Consume:

* schemes over a base, affine schemes, finite type, fibre products, open/closed immersions, finite, proper, smooth, and étale morphisms;
* topological spaces, locally ringed spaces, manifolds, local homeomorphisms, covering maps, and gluing infrastructure;
* sheaves on topological spaces, stalks, abelian and Grothendieck-abelian sheaf categories;
* generic sheaf cohomology and derived categories;
* singular simplices, singular chains, singular homology, homotopies, fundamental groupoids, and covering-space machinery;
* the Tau Ceti `UniversalCovers` roadmap for universal covers, deck transformations, and classification-oriented covering theory;
* `ConstructibleEtale` for finite constructible coefficient complexes;
* `EtaleBaseChange` for direct images and proper base change;
* `CompactSupport` for algebraic \(Rf_!\) and \(R\Gamma_c\).

Mathlib does not provide a complete topological analytification of arbitrary finite-type complex schemes, complex analytic spaces with the needed site, Riemann existence, singular cohomology with local coefficients, or Artin comparison.

## What is missing: build here

The missing reusable library consists of:

1. affine classical topology on complex algebraic sets, independent of presentation;
2. topological and analytic-space analytification for all finite-type complex schemes;
3. functoriality and compatibility with fibre products and standard morphism properties;
4. semialgebraic triangulation sufficient for complex algebraic sets;
5. local contractibility, local compactness, paracompactness, second countability, and finite CW homotopy type;
6. topological local systems and singular chains/cochains with local coefficients;
7. comparison between topological sheaf cohomology and singular cohomology;
8. compactly supported topological sheaf and singular cohomology;
9. Riemann existence for finite étale covers;
10. the morphism of analytic/classical and étale sites;
11. analytification of lisse and constructible coefficient sheaves;
12. elementary fibrations and the generic-projection theorem used in Artin's dimensional induction;
13. derived Artin comparison for constructible coefficients;
14. compact-support Artin comparison;
15. relative/proper comparison and compatibility with finite group actions, products, and base change.

## The build, in layers

### Layer 0: affine complex points and their topology

Let \(A\) be a finitely generated \(\mathbf C\)-algebra. Define the complex-point type of \(\operatorname{Spec}A\) as

\[
\operatorname{Hom}_{\mathbf C\text{-alg}}(A,\mathbf C).
\]

For a finite presentation

\[
A\cong \mathbf C[x_1,\ldots,x_n]/I,
\]

embed this type as the zero locus \(V(I)\subset\mathbf C^n\) and give it the subspace topology. Prove independence of presentation by showing every algebra morphism induces the expected polynomial map and is continuous, with inverse continuity for algebra equivalences.

Build:

* functoriality contravariant in finitely generated \(\mathbf C\)-algebras;
* compatibility with localization and principal opens;
* compatibility with tensor products/fibre products;
* agreement with the Euclidean topology on affine space;
* closed-embedding behaviour for quotient algebras;
* product topology for affine products;
* Hausdorffness, local compactness, and second countability.

Do not choose a permanent coordinate presentation as part of an affine scheme's analytification.

### Layer 1: topological analytification of finite-type schemes

Glue the affine classical topologies along affine open covers to construct

\[
X^{\mathrm{cl}}
\]

for every finite-type \(\mathbf C\)-scheme \(X\). Prove independence of the cover and construct a functor from finite-type \(\mathbf C\)-schemes to topological spaces.

Build:

* identification of the underlying type with \(X(\mathbf C)\);
* open-immersion analytification as an open embedding;
* closed-immersion analytification as a closed embedding on underlying reduced spaces;
* compatibility with products and fibre products;
* finite coproducts;
* proper maps induce proper continuous maps;
* finite maps induce finite/proper maps on complex points;
* a smooth morphism of smooth finite-type \(\mathbf C\)-schemes induces a submersion of the associated complex manifolds, and for a smooth morphism with arbitrary finite-type target the induced map is open with the local product structure over the smooth locus;
* étale maps give local homeomorphisms;
* compatibility with reduction.

The topology on a nonreduced scheme agrees with that of its reduction, but the analytic structure constructed next must retain the nilpotent sheaf.

### Layer 2: complex analytic spaces and analytification

Construct a category of complex analytic spaces sufficient for analytification and the analytic site. An object should be locally isomorphic to a closed analytic subspace of an open subset of \(\mathbf C^n\), with a sheaf of holomorphic functions and nilpotent analytic ideals allowed. The underlying topological space is not required to be Hausdorff, so that every finite-type \(\mathbf C\)-scheme has an analytification; separated schemes yield Hausdorff analytic spaces.

Build:

* affine analytification as the closed analytic subspace cut out by the algebraic ideal;
* gluing along open analytic subspaces;
* the functor
  \[
  (-)^{\mathrm{an}}:
  (\text{finite-type }\mathbf C\text{-schemes})\to
  (\text{complex analytic spaces});
  \]
* agreement of underlying topology with Layer 1;
* compatibility with products, fibre products, open/closed immersions, finite maps, and proper maps;
* analytification of étale morphisms as local biholomorphisms;
* analytification of smooth schemes as complex manifolds and agreement with Mathlib's smooth affine/manifold analytification design.

This layer is not a full development of complex analytic geometry. It builds the objects and morphisms used by covering theory and sheaf comparison.

### Layer 3: semialgebraic and algebraic triangulation

Develop the semialgebraic topology needed to prove finite topological type. Build:

* semialgebraic subsets of \(\mathbf R^n\), maps, and finite Boolean operations;
* semialgebraic cell decomposition at the strength required for triangulation;
* finite semialgebraic triangulation compatible with a finite family of semialgebraic subsets, in which a noncompact locally closed set is represented by a union of open simplices in a finite simplicial complex;
* the compact specialization, in which a compact semialgebraic set is represented by a finite subcomplex;
* compatibility with products, closed subsets, and finite stratifications;
* transfer from complex algebraic sets in \(\mathbf C^n\cong\mathbf R^{2n}\) to semialgebraic sets.

Prove that every finite-type complex algebraic variety has a triangulation compatible with a prescribed finite algebraic stratification. Include singular and reducible varieties.

Any foundational real algebraic geometry missing from Mathlib and used here is part of this layer. Do not state triangulation as an unexplained external oracle.

### Layer 4: topological finiteness of complex algebraic varieties

From triangulation prove that \(X^{\mathrm{cl}}\) for separated finite-type \(X\) is:

* Hausdorff;
* locally compact;
* second countable;
* paracompact;
* locally contractible;
* locally path-connected;
* of finite cohomological dimension for finite coefficients;
* homotopy equivalent to a finite CW complex;
* homeomorphic to a compact finite polyhedron when \(X\) is proper and reduced, after choosing a triangulation compatible with a prescribed finite algebraic stratification.

For arbitrary finite-type \(X\), deduce the local properties — local compactness, second countability, local contractibility, local path-connectedness, and finite cohomological dimension — from the separated case via affine covers. The global properties are stated for separated \(X\) only: the affine line with doubled origin is finite type and not Hausdorff.

Build compactly supported finiteness consequences and compatibility with algebraic stratifications. These are theorem-level dependencies for sheaf/singular comparison and must be exported as ordinary topology results.

### Layer 5: topological local systems

Define a local system of finite \(\Lambda\)-modules on a topological space as a locally constant sheaf, using Mathlib's topological sheaf category. Build:

* stalks, pullback, tensor products, duals, kernels, cokernels, and extensions;
* finite monodromy and finite stalks;
* equivalence with functors from the fundamental groupoid to finite \(\Lambda\)-modules on locally path-connected, semilocally simply connected spaces;
* based equivalence with representations of the fundamental group on connected spaces;
* compatibility with the `UniversalCovers` classification and basepoint change.

Use the fundamental groupoid for unbased statements. Do not make all local systems depend on a globally chosen basepoint.

### Layer 6: singular chains and cochains with local coefficients

For a fundamental-groupoid local system \(L\), construct singular chains and cochains with local coefficients. Pin the convention for transporting coefficients between vertices of a simplex and prove independence/coherence.

Build:

* boundary and coboundary maps;
* chain-complex identities;
* functoriality in spaces and local systems;
* homotopy invariance;
* long exact sequences of pairs;
* excision;
* Mayer--Vietoris;
* cup products with local coefficients under the standard tensor pairing;
* comparison with ordinary singular (co)homology for constant local systems;
* compactly supported singular cochains on locally compact spaces.

Do not define cohomology with local coefficients merely as group cohomology of a fundamental group; the singular construction must work componentwise and for pairs/compact supports.

### Layer 7: topological sheaf cohomology and singular comparison

Package sheaf cohomology on a topological space using Mathlib's generic site/sheaf cohomology. Construct the canonical map between singular cochains with local coefficients and a sheaf resolution.

Prove, for locally contractible paracompact spaces in the pinned class,

\[
H^i_{\mathrm{sheaf}}(X,L)
\cong
H^i_{\mathrm{sing}}(X,L)
\]

naturally in \(X\) and the local system \(L\).

Develop the constructible-sheaf generalization using a finite triangulation compatible with the stratification. State the resulting derived comparison in the category of \(\Lambda\)-modules.

For a locally compact Hausdorff, paracompact, locally contractible space carrying a finite triangulation compatible with a finite constructible stratification, define topological extension by zero \(j_!\) along open embeddings, the compactly supported pushforward \(R f_!\) along locally proper separated continuous maps of such spaces, and topological compact support \(R\Gamma_c\). These constructions are targets of this layer. Prove, for every finite constructible \(\Lambda\)-sheaf \(L\),

\[
R\Gamma_c^{\mathrm{sheaf}}(X,L)
\simeq
R\Gamma_c^{\mathrm{sing}}(X,L).
\]

Prove that these complexes are bounded, and perfect over \(\Lambda\) when the triangulation is finite and \(L\) has stalks of finite Tor dimension over \(\Lambda\) — the topological counterpart of the ctf condition. Boundedness alone does not give perfectness: the constant sheaf \(\mathbf Z/2\) over \(\Lambda=\mathbf Z/4\) on a point already fails.

### Layer 8: Riemann existence

For a finite-type complex scheme \(X\), analytification sends a finite étale morphism \(Y\to X\) to a finite covering map

\[
Y^{\mathrm{an}}\to X^{\mathrm{an}}.
\]

Prove the Riemann existence equivalence

\[
\{\text{finite étale covers of }X\}
\simeq
\{\text{finite topological covering spaces of }X^{\mathrm{an}}\}.
\]

Build:

* full faithfulness and essential surjectivity;
* compatibility with pullback, products, disjoint unions, and connected components;
* compatibility with Galois covers and deck groups;
* equivalence of finite lisse sheaves and finite topological local systems;
* comparison of algebraic and topological fundamental groups after profinite completion;
* naturality in \(X\).

Coordinate the topological covering side with `UniversalCovers`; do not duplicate lifting/classification results.

### Layer 9: the analytic-to-étale morphism of sites

Let \(X^{\mathrm{an}}_{\mathrm{lh}}\) be the small site of local homeomorphisms over the underlying topological space of \(X^{\mathrm{an}}\), with jointly surjective families as coverings. Construct the functor sending an étale \(X\)-scheme to its analytified local homeomorphism and the resulting morphism of sites/topoi

\[
\varepsilon_X:X^{\mathrm{an}}_{\mathrm{lh}}
\longrightarrow X_{\acute et}.
\]

Prove that sheaves on \(X^{\mathrm{an}}_{\mathrm{lh}}\) are equivalent to sheaves on the ordinary open-set site of the underlying topological space, and transport the comparison through this equivalence. The analytic-space structure is used to construct the functor and prove local-isomorphism statements; it is not a second competing coefficient site.

Build:

* inverse and direct image;
* compatibility with constant sheaves;
* analytification \(K\mapsto K^{\mathrm{an}}=\varepsilon_X^*K\);
* compatibility with stalks;
* preservation of finite lisse and constructible sheaves;
* compatibility with tensor products, duals, coefficient change, and Tate twists;
* naturality in scheme morphisms;
* the natural comparison morphism between analytic and étale derived direct images for morphisms of finite-type complex schemes; the isomorphism theorems are targets of Layers 10--12.

### Layer 10: finite-level Artin comparison

For \(X\) finite type over \(\mathbf C\), finite commutative \(\Lambda\), and

\[
K\in D^b_{\mathrm{ctf}}(X,\Lambda),
\]

construct the canonical comparison

\[
R\Gamma_{\acute et}(X,K)
\longrightarrow
R\Gamma(X^{\mathrm{an}},K^{\mathrm{an}})
\]

and prove it is an isomorphism.

Pin the proof to Artin's elementary-fibration induction rather than citing comparison as a black box.

1. Define an elementary fibration \(u:U\to S\) by a factorization
   \[
   U\overset j\hookrightarrow \bar U\overset{\bar u}\longrightarrow S
   \]
   in which \(\bar u\) is a smooth projective relative curve with geometrically connected fibres and \(\bar U\setminus U\to S\) is finite étale with nonempty fibres.
2. Prove Artin's generic-projection theorem: for every point of a smooth complex variety, a Zariski neighbourhood admits an elementary fibration over a smooth variety of dimension one less. The projective embedding, normalization, generic linear projection, shrinking, and boundary-finiteness arguments are explicit targets.
3. For an elementary fibration and a finite lisse sheaf, compare the analytic and étale higher direct images in degrees \(0\) and \(1\), prove vanishing in higher degrees, and identify their monodromy through Riemann existence.
4. Use the analytic and étale Leray spectral sequences and induction on dimension to prove comparison for finite lisse sheaves on smooth varieties.
5. Pass to arbitrary finite-type schemes and constructible sheaves by Noetherian induction, finite stratification, open--closed localization, and finite direct images.
6. Pass from sheaves to \(D^b_{\mathrm{ctf}}\) by bounded truncation and the enhanced derived formalism already built.

Prove naturality in \(X\) and \(K\), coefficient change, cup products, Künneth, Tate twists, and finite group actions.

As a corollary, for constant finite coefficients prove

\[
H^i_{\acute et}(X,\Lambda)
\cong
H^i_{\mathrm{sing}}(X(\mathbf C),\Lambda).
\]

For lisse coefficients, identify the right side with singular cohomology of the corresponding topological local system.

### Layer 11: compact-support Artin comparison

Use algebraic compactification from `CompactSupport`, analytic properness, topological extension by zero, and open--closed localization to construct

\[
R\Gamma_{c,\acute et}(X,K)
\longrightarrow
R\Gamma_c(X^{\mathrm{an}},K^{\mathrm{an}})
\]

and prove it is an isomorphism for separated finite-type \(X/\mathbf C\) and \(K\in D^b_{\mathrm{ctf}}\).

Prove independence of algebraic compactification and compatibility with:

* proper pushforward;
* extension by zero;
* base change along complex conjugation, the only nonidentity field automorphism of \(\mathbf C\) acting continuously on the classical topology;
* localization triangles;
* Künneth and external products;
* finite group actions.

Deduce the compact-support singular-cohomology statement for lisse and constant coefficients.

### Layer 12: relative comparison

For a proper finite-type morphism \(f:X\to Y\) over \(\mathbf C\), prove compatibility of analytification with derived direct image:

\[
(Rf_*K)^{\mathrm{an}}
\simeq
R(f^{\mathrm{an}})_*(K^{\mathrm{an}})
\]

for the pinned constructible coefficient category.

For separated finite-type \(f\), prove the compact-support form

\[
(Rf_!K)^{\mathrm{an}}
\simeq
R(f^{\mathrm{an}})_!(K^{\mathrm{an}}).
\]

Package the fibrewise consequence used by the parent family: the singular cohomology of a complex fibre agrees with its finite-coefficient étale cohomology, and this comparison is compatible with the lisse higher-direct-image/monodromy structure supplied by `EtaleBaseChange`.

**Summit:** Artin comparison and its compact-support and relative forms are natural equivalences for ctf coefficients, with constant and local-system singular cohomology as corollaries.

## Worked examples and acceptance criteria

1. The analytification of \(\mathbf A^n_\mathbf C\) is \(\mathbf C^n\) with its Euclidean topology.
2. The analytification of \(\mathbf G_m\) is \(\mathbf C^\times\), and comparison recovers its degree-one finite-coefficient cohomology.
3. The analytification of \(\mathbf P^1\) is the Riemann sphere, and comparison matches degree \(0\) and \(2\) cohomology.
4. A finite étale cover of \(\mathbf G_m\) given by \(z\mapsto z^n\) matches the corresponding topological covering.
5. A nodal affine curve is included as a singular test of the general analytification and triangulation APIs.
6. A finite local system with nontrivial monodromy is compared on both sides.
7. Compact-support comparison for \(\mathbf A^1\) and \(\mathbf G_m\) commutes with the localization triangle.
8. A finite group action on a complex variety gives equivariant Artin comparison on cohomology.

A layer is not complete if it works only for smooth manifolds, only for constant coefficients, or only at the level of abstract cardinalities of cohomology groups.

## Design notes for Lean

### Separate general analytic spaces from the smooth manifold specialization

Mathlib pull request #34626 determines the naming and affine design followed here. Extend that interface to singular finite-type schemes through complex analytic spaces or an equivalent general category. Do not fork the smooth and singular theories.

### Make topology independent of coordinates

Affine presentations are proof tools, not stored data. All user-facing constructions are invariant under algebra equivalence and compatible with scheme gluing.

### Use derived natural equivalences

Artin comparison should be a natural isomorphism of derived global-section functors. Degreewise group isomorphisms are corollaries.

### Do not hide triangulation

The topological hypotheses used in sheaf/singular comparison must be supplied by proved triangulation and local-contractibility theorems. A typeclass instance asserted without a construction or theorem does not discharge the roadmap.

### Preserve local coefficients

The functor from lisse étale sheaves to topological local systems is part of the core comparison. Constant-coefficient shortcuts would make the development unsuitable for monodromy and trace-function applications.

## Scope boundaries

The following are not targets of this roadmap:

* de Rham comparison, GAGA for coherent cohomology, or Hodge theory;
* arbitrary complex analytic spaces unrelated to algebraic analytification beyond the local category needed here;
* perverse sheaves or constructible derived categories with the perverse t-structure;
* algebraic stacks and orbifold comparison;
* \(\ell\)-adic inverse limits, owned by `EllAdicRealization`;
* Frobenius or trace formulas, owned by the finite-field roadmaps;
* weights and purity.

## Completion criterion

This roadmap is complete when:

* analytification exists functorially for every finite-type complex scheme, including singular and nonreduced schemes;
* the underlying classical topology is coordinate independent and compatible with standard scheme constructions;
* the necessary semialgebraic triangulation and finite-topological-type theorems are formalized;
* topological local systems and singular cohomology with local coefficients and compact support are available;
* topological sheaf cohomology is compared with singular cohomology for the locally compact, paracompact, locally contractible, finitely triangulated spaces and finite constructible coefficients fixed in Layer 7;
* Riemann existence is proved with functorial and Galois-cover compatibility;
* the analytic/classical-to-étale morphism of sites is constructed;
* Artin comparison is proved for \(D^b_{\mathrm{ctf}}\), with compact-support and relative forms;
* cup products, Künneth, Tate twists, coefficient change, and finite group actions are compatible with comparison;
* the worked examples pass;
* the Tau Ceti implementation contains no `sorry`.
