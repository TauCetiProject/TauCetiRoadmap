# Model category theory

A connected family of roadmaps for the model-categorical foundations of homotopy theory, downstream of
Mathlib's model categories (`HomotopicalAlgebra.ModelCategory`) and small object argument. It covers lifting
properties and presentable categories, combinatorial and transferred model structures, the Kan–Quillen model
structure, simplicial and enriched model categories, the Bergner model structure on simplicial
categories, localization of enriched categories, Bousfield localization and Dugger's theorem. Each
subdirectory is a self-contained roadmap: a definitive `README.md` plus a `Suggested.lean` of target
signatures. This page is the index. It owns no mathematics of its own.

Within each member, every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its
position within that section — and a single labeled statement, cited as `Part KanQuillen §3.5.2`, is one target.

## The roadmaps

They are listed in merge order: each consumes only roadmaps above it, Mathlib and Tau Ceti.

1. [**ModelCategories**](ModelCategories/README.md): lifting properties and the small object argument in locally
   presentable categories, with Mathlib's presentability notions (κ-compact objects and locally presentable
   categories, compared with Lurie's definitions); cell trees describing saturated classes without retracts;
   homotopy extension, the model structure on an under-category, left properness and homotopy pushout squares;
   Quillen adjunctions and Quillen equivalences; accessible and perfect classes of morphisms, combinatorial model
   categories, Smith's recognition theorem and the transfer theorem; the projective and Reedy model structures on
   diagram categories, and coends; closed monoidal categories, enrichment, tensors and cotensors.
2. [**KanQuillen**](KanQuillen/README.md): the elementary theory of Kan complexes (abelian higher homotopy groups,
   change of basepoint, the long exact sequence of a Kan fibration and Whitehead's theorem), on top of the anodyne
   maps, factorizations and homotopy groups already in Mathlib and Tau Ceti; Kan's `Ex^∞` as a functorial Kan
   replacement, built from Mathlib's subdivision and `Ex`; the combinatorial, left and right proper Kan–Quillen
   model structure on simplicial sets; connectivity, Postnikov towers and Eilenberg–MacLane complexes.
3. [**SimplicialCategories**](SimplicialCategories/README.md): left Quillen bifunctors and monoidal, enriched and
   simplicial model categories; the injective model structure, homotopy limits and homotopy Kan extensions; Reedy
   diagrams compared with injective and projective ones, coends as left Quillen bifunctors, realization of
   simplicial objects, diagonals of bisimplicial sets and hypercovers; the model structure on S-enriched
   categories (the Bergner model structure for simplicial categories), excellent model categories and the
   excellence of simplicial sets; projective and injective model structures on enriched diagram categories.
4. [**EnrichedLocalization**](EnrichedLocalization/README.md): chunks and the representability of maps in the
   homotopy category of enriched categories; localization, homotopy colimits and homotopy limits of enriched
   categories; left Bousfield localization and Dugger's presentation theorem; weak exponentials and homotopy
   limits of diagram categories.

Every roadmap uses all the roadmaps before it.

## Scope and boundaries

- **No ∞-categories here.** The quasicategorical theory, including the Joyal model structure and
  straightening, lives in the InfinityCategoryTheory family.
- **Locally presentable categories.** Part ModelCategories uses Mathlib's presentability notions and adds
  only what lifting and the small object argument need. The rest of the theory of locally presentable
  1-categories beyond Mathlib, including their completeness, is not used.
- **No topological realization.** Comparisons with topological spaces belong to GeneralizedCohomology §G2.1 and
  AlgebraicTopology.
