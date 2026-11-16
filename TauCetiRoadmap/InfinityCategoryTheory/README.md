# Infinity-category theory

A connected family of roadmaps for the theory of ∞-categories, modeled as quasicategories (Mathlib's
`SSet.Quasicategory`), including the theory of presentable ∞-categories, (pre)stable ∞-categories, and ∞-topoi. Each subdirectory is a self-contained roadmap: a definitive `README.md` plus a
`Suggested.lean` of target signatures. This page is the index and the map of how they fit together. It owns no mathematics of its own.

The family builds the general theory, beyond what Mathlib has, that later roadmaps consume. Its scope is characterized by there being no applications (topological or geometric uses of the theory belong to the roadmaps that need them) and nothing that develops or requires the theory of ∞-operads (e.g. symmetric monoidal ∞-categories).

Within each member, every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its
position within that section — and a single labeled statement, cited as `Part CartesianFibrations §2.2.2`, is one
target.

## The roadmaps

They are listed in merge order: each consumes only roadmaps above it, Mathlib, Tau Ceti, the
[ModelCategoryTheory](../ModelCategoryTheory/README.md) family and DGAInfinity (dg categories, in
DerivedInfinityCategories).

1. [**InfinityCategoryFoundations**](InfinityCategoryFoundations/README.md):
   the family's basic notions (size, functor ∞-categories, limits and colimits), mapping spaces and the
   homotopy category, left and right fibrations, the covariant and contravariant model structures, the
   straightening theorem for right fibrations (unmarked straightening) and the classification of small right
   fibrations, the comparison theorem for the coherent nerve, the Joyal model structure with Joyal's theorem on
   its fibrant objects and categorical fibrations over an ∞-category, the forms of categorical equivalence,
   minimal models, and n-categories and truncated objects.
2. [**CartesianFibrations**](CartesianFibrations/README.md): Cartesian and
   coCartesian edges and fibrations with their mapping-space and fiberwise criteria, the invariance of functor
   ∞-categories under categorical equivalence, correspondences and bifibrations, the Cartesian and coCartesian
   model structures on marked simplicial sets over a base, mapping simplices over Δ[n], base change along
   (co)Cartesian fibrations, the fiberwise criterion for maps of Cartesian fibrations, (co)Cartesian fibrations
   over ∞-categories as categorical fibrations, fibrations over Kan complexes, invariance of section spaces and
   functor fibrations.
3. [**LimitsAndKanExtensions**](LimitsAndKanExtensions/README.md):
   cofinality and Quillen's Theorem A for ∞-categories, homotopy colimits as ∞-categorical colimits, small
   limits and colimits in spaces and in `Cat∞`, pointwise Kan extensions, and simplicial, groupoid and group
   objects with their geometric realizations.
4. [**AdjunctionsAndLocalizations**](AdjunctionsAndLocalizations/README.md):
   adjoints and their preservation of limits, the representability criterion, localization functors and
   reflective subcategories, the localization `C[W⁻¹]` and the underlying ∞-category of a model category,
   factorization systems, and absolute Kan extensions as derived functors.
5. [**Straightening**](Straightening/README.md): the straightening
   theorem for Cartesian fibrations, the classification of Cartesian fibrations by maps to `Cat∞`, limits in
   `Cat∞` as ∞-categories of Cartesian sections and colimits by inverting Cartesian edges, and descent for
   coCartesian fibrations.
6. [**PresheavesAndCompletions**](PresheavesAndCompletions/README.md):
   Yoneda's lemma, presheaf ∞-categories as free cocompletions, idempotent completions, filtered and sifted
   ∞-categories, and `Ind_κ` as the free completion under κ-filtered colimits.
7. [**AccessibleInfinityCategories**](AccessibleInfinityCategories/README.md): the characterization of κ-accessible ∞-categories by
   κ-compact generators, raising the cardinal, and the closure of accessibility under functor ∞-categories,
   slices, categorical pullbacks and limits.
8. [**PresentableInfinityCategories**](PresentableInfinityCategories/README.md): the presentation theorem, the adjoint functor
   theorem, localization at a small set of morphisms, `Pr^L` and `Pr^R`, truncation and Postnikov towers,
   `P_Σ`, and presentations by combinatorial simplicial model categories.
9. [**StableInfinityCategories**](StableInfinityCategories/README.md): the triangulated
   homotopy category, t-structures and their hearts, Verdier quotients, spectrum objects and stabilization,
   spectra as the free presentable stable ∞-category on one object, and the spectral sequences of filtered and
   simplicial objects.
10. [**InfinityTopoi**](InfinityTopoi/README.md): Giraud's theorem for ∞-topoi, object
    classifiers, sheaves on a Grothendieck topology, geometric morphisms and limits of ∞-topoi, truncation,
    connectivity and Eilenberg–MacLane objects, and n-topoi and localic reflection.
11. [**HypercompletenessAndCoherence**](HypercompletenessAndCoherence/README.md):
    hypercompletion and hyperdescent, homotopy dimension, sheaves of spectra and their t-structure, coherent
    ∞-topoi and the ∞-categorical Deligne completeness theorem, and Postnikov completeness.
12. [**PrestableInfinityCategories**](PrestableInfinityCategories/README.md): prestable ∞-categories as full
    subcategories of stable ones closed under finite colimits and extensions (the stable envelope criterion),
    and, when they have finite limits, as connective parts of t-structures; prestability of `P_Σ` of additive categories; Grothendieck
    prestable ∞-categories, their left exact localizations and filtered colimits; separation, completion and
    the equivalence between anticomplete and complete ones; coherence, the recognition of Ind-completions of
    bounded connective parts, and locally Noetherian prestable ∞-categories.
13. [**DerivedInfinityCategories**](DerivedInfinityCategories/README.md): the dg nerve of chain
    complexes as a stable ∞-category; the Dwyer–Kan theorem and the underlying ∞-categories of combinatorial
    model categories as presentable ∞-categories, with homotopy (co)limits as (co)limits; the derived
    ∞-categories `D⁻(A)` and `D(A)` with their t-structures and universal properties, the injective model
    structure on unbounded complexes, and their comparison with Mathlib's derived categories.

Every roadmap uses all the roadmaps before it, with these exceptions: InfinityTopoi does not use
StableInfinityCategories; PrestableInfinityCategories does not use HypercompletenessAndCoherence; and
DerivedInfinityCategories does not use HypercompletenessAndCoherence.

## Scope and boundaries

- **No ∞-operads.** Every result here can be stated and proved without referencing the theory of
  ∞-operads. Results that need them belong to later roadmaps.
- **No applications.** Topological applications (shape theory, covering dimension, proper base change) and
  geometric ones (sheaves on schemes or ringed sites) belong to the roadmaps that use them.
