module

public import Mathlib

/-!
# Étale homotopy types: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems when statable against the pinned APIs. None is statable at these pins: each requires
one of the missing carriers listed below. No substitute assertion is stated.

Layer 0:
* Isaksen's simplicial model structure, properness and the strong-fibration presentation result
  lack the homotopy pro-local-system carrier and its model structure on pro-simplicial sets.
* Connected pointed homotopy detection and local-coefficient weak-equivalence detection lack
  those pro-local systems, their cohomology and the associated pointed homotopy category.

Layer 1:
* Sub-pro-group covering representability and invariance of covering categories lack native
  pro-coverings and the pointed pro-space homotopy category.
* Coverings as fibrations and homotopy-isomorphism base change with deck-equivariant cohomology
  lack the Isaksen model, its covering objects and their coefficient comparison.
* Full faithfulness of pro-classifying spaces, representability of maps into them and raw
  K(pi,1) recognition lack the classifying pro-space and raw homotopy-group carriers.

Layer 2:
* The derived constant/limit adjunction and nonabelian profinite derived-limit vanishing lack
  the unstable derived limit and nonabelian derived-limit carriers on these small pro-diagrams.
* Homotopy groups of materialization for profinite pro-spaces lack their derived materialization.
* Absolute monodromy orbit bijection, pointed isomorphism lifting, relative pointed surjectivity,
  relative isomorphism lifting and the stabilizer orbit bijection lack the pro-space homotopy
  categories and materialized path transport.

Layer 3:
* The profinite-completion universal property for a pro-group is an adapter rather than a
  headline and is not stated; its finite-quotient form is expressible with the native levelwise
  completion, the native profinite limit cone and limits and colimits of types.
* Profinite local-coefficient detection, raw K(pi,1) finite-cover effacement and its product
  formula lack the raw etale type and its homotopy pro-groups.
* Etale local-coefficient comparison, raw/finite fundamental-group comparison, raw profiniteness,
  the field classifying equivalence and finite etale base change lack the rigid etale type.
* Galois-equivariant geometric cohomology transport and the elementary-fibration homotopy
  sequence lack that type, its cover tower and its homotopy-fiber comparison.
* The characteristic-zero finite etale product formula, over a field and over an algebraically
  closed field, and the homotopy exact sequence of fundamental groups it rests on lack the scheme
  finite-etale fiber-functor fundamental group and its geometric product comparison interface;
  Mathlib's finite etale algebras over a ring cover only affine schemes.
* Strong desingularizability of finite-type schemes over an algebraically closed field of
  characteristic zero lacks resolution of singularities and the strong-desingularizability
  notion of SGA 5. Cohomological properness of normal-crossings complements over an arbitrary
  base and of quasi-compact quasi-separated schemes, the relative Abhyankar step, the
  base-change criterion for universal local acyclicity, universal local 1-asphericity and
  0-acyclicity of projections lack relative normal-crossings divisors, stacks of etale torsors
  with their direct images and base change, strict localizations of schemes and the relative
  purity of finite etale covers. Cohomological properness over an arbitrary field for every
  etale sheaf of sets and, in characteristic zero, for every ind-finite sheaf of groups, with
  universal local 1-asphericity in characteristic zero, lacks in addition the direct image and
  base-change exchange of sheaves of sets on the small etale sites of schemes along a morphism,
  ind-finite sheaves of groups and their torsor stacks, and constructible sheaves of sets with
  their descent along limits of schemes.

Layer 4:
* Open arithmetic image lacks the scheme finite-etale fiber-functor fundamental group.
* Pointed arithmetic lifting, arithmetic isomorphism lifting, the geometric orbit surjection and
  bijection, the outer fundamental-group map, the open-image restriction and the product mapping
  result lack the raw etale homotopy category and its arithmetic structural maps.

Layer 5:
* Algebraic evaluation representability lacks the supplied analytification/analytic-points
  functor on quasi-projective complex schemes. Continuous-function evaluation alone is not it.
* Smooth Cech descent and analytic etale hypercover descent lack that functor and its diagonal
  Betti realization. A definition on arbitrary simplicial topological spaces would not state
  these scheme theorems.

Layer 6:
* The p-profinite completion mapping-space universal property and its localized-model comparison
  lack the homotopy-coherent category of p-finite types and its Pro construction.
* Finite-type materialization comparison lacks that p-profinite carrier and materialization.
* The Betti-etale zigzag, mod-p cohomology/homology comparison on finite-type and specified-graded
  objects, field-automorphism naturality, and strictification of the functor and action lack the
  rigid etale realization, its completion, the analytic functor and coherent action carriers.

No substitute predicates, admitted data, API lemmas or boundary-case theorems are asserted.
-/

namespace TauCetiRoadmap.EtaleHomotopyTypes

end TauCetiRoadmap.EtaleHomotopyTypes
