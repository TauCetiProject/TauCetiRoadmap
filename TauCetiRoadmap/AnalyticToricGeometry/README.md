# Roadmap: analytic toric geometry

This roadmap constructs algebraic and complex-analytic toric varieties from finite regular
rational fans. It supplies the algebraic cone-to-fan layer that is not yet exposed by the Toric
project, then builds complex points, analytic charts, gluing, torus actions, orbit strata,
normal-crossings boundary components, toric maps, properness, and the algebraic--analytic
comparison.

The public API has one toric dialect. Cones are Mathlib `PointedCone`s with additional
predicates, affine charts are schemes built from monoid algebras, and gluing uses the common
scheme and `TopCat.GlueData` carriers. Basis-dependent coordinates are theorems, not definitions
of the global objects.

Suggested homes: `TauCeti/Geometry/Toric/Algebraic/` for the common algebraic supplier and
`TauCeti/Geometry/Toric/Analytic/` for complex realization.

## Scope and completion criterion

The scope is smooth complex toric geometry for **finite regular rational fans**. Restricting to
finite fans makes all algebraic realizations quasi-compact and avoids an ambiguous notion of
local finiteness: every cone contains the origin, and every affine toric chart contains the dense
torus, so neither the cone family near the origin nor the affine-chart cover can be locally finite
in the naive sense.

Singular toric analytic spaces, infinite fans, general analytification, coherent toric sheaves,
intersection theory, symplectic moment maps, and special deformation retractions are outside the
roadmap.

The roadmap is complete when Tau Ceti supplies all of the following.

1. A Toric-compatible algebraic API for rational salient polyhedral cones, primitive rays,
   regularity, finite fans, fan morphisms, dual semigroups, affine toric schemes, face
   localizations, fan gluing, torus actions, and algebraic toric maps.
2. Every regular cone has an analytic affine chart on the complex points of its algebraic affine
   scheme. Its topology comes from a finite monomial embedding and is independent of the chosen
   semigroup generators. A basis extending the primitive ray generators gives a biholomorphism
   with `C^k x (C^*)^(n-k)`, independent of the extending basis.
3. Every finite regular fan has a Hausdorff second-countable complex manifold obtained by gluing
   its affine analytic charts along face localizations. Character functions, chart inclusions,
   and the torus action are holomorphic.
4. Cones correspond naturally to torus orbits. The complement of the dense torus is a finite
   union of closed embedded complex hypersurfaces indexed by rays, with reduced multiplicity one
   and the local coordinate-hyperplane simple-normal-crossings form.
5. A fan morphism induces a holomorphic toric map. Identity, composition, products, open subfans,
   and restrictions agree definitionally or by named natural isomorphisms. For finite source and
   target fans, the cone-by-cone support criterion characterizes properness.
6. The analytic realization is naturally biholomorphic, as a toric space, to the global complex
   points `Hom(Spec C, X_Sigma)` of the algebraic fan scheme. This comparison commutes with
   affine charts, characters, orbit strata, boundary components, and toric maps.
7. A finite regular fan is complete exactly when its analytic realization is compact. The
   standard fans for affine space, the algebraic torus, projective space, products, and a star
   subdivision satisfy the expected comparison and properness theorems.

## Ownership and dependencies

- **This roadmap owns the missing cone-to-fan algebraic supplier.** The public Toric project
  supplies `AlgebraicGeometry.ToricVariety` in `Toric.ToricVariety.Defs`, the affine-monoid
  construction in `Toric.ToricVariety.FromMonoid`, and the common torus and monoid-algebra
  infrastructure. It does not supply rational toric cones, fans, fan schemes, or their morphisms.
  Layer 0 below supplies those objects in the same vocabulary rather than treating a prospective
  external API as a dependency.
- **Matching external declarations are consumed immediately.** Before implementing a Layer 0
  declaration, search Toric, Mathlib, and active pull requests. If the exact object and laws
  exist, import them and delete the local target. Otherwise implement the target here with the
  public shape below. Analytic work never pauses for external upstreaming, and this roadmap does
  not assign work to another project.
- **Mathlib owns convex-cone vocabulary.** Use `PointedCone`, `PointedCone.FG`,
  `PointedCone.DualFG`, `PointedCone.IsFaceOf`, `PointedCone.Face`,
  `ConvexCone.Salient`, cone hulls, maps, duals, and the face lattice. A toric cone is a predicate
  on that carrier, not a replacement carrier.
- **The Toric project owns its existing scheme-level vocabulary.** Consume its tori,
  diagonalizable group schemes, monoid algebras, `ToricVariety` class, and affine-monoid
  construction. Layer 0 connects fan combinatorics to those objects; it does not put analytic
  fields into them.
- **The complex-manifolds roadmap owns analytic atlas transport, open gluing, compatible
  structure-groupoid atlases, and biholomorphism vocabulary.** This roadmap supplies toric
  affine charts and verifies the hypotheses of those generic theorems.
- **General scheme analytification is not claimed.** The comparison is toric and chartwise. It
  identifies affine functor-of-points carriers, proves compatibility on face localizations, and
  glues those comparisons.

## Pinned conventions

These conventions are acceptance conditions.

- An integral lattice is a finite free `Z`-module `N`, a finite-dimensional real vector space
  `N_R`, an additive map `i : N -> N_R`, and an `R`-linear equivalence
  `R tensor[Z] N ≃ N_R` sending `1 tensor n` to `i(n)`. Injectivity, discreteness, spanning, and
  equality of the integral and real ranks are consequences. An injective dense map with full
  real span is not accepted as a lattice.
- A toric cone is a Mathlib `PointedCone R N_R` satisfying finite generation, generation by
  finitely many lattice vectors, and `ConvexCone.Salient`. Salience is the condition
  `sigma inter (-sigma) = {0}`; Mathlib's name `PointedCone` alone does not assert it.
- Rays are one-dimensional Mathlib faces. Their primitive lattice generators are derived by an
  existence-and-uniqueness theorem. A cone record does not store an arbitrary generator list.
- Regularity includes the toric-cone hypothesis and says that all primitive ray generators occur
  in one integral basis. It is never a standalone property of an irrational or nonsalient cone.
  The analytic layer consumes such a basis and proves independence from its choice.
- A fan is a finite set of toric cones, closed under faces, whose pairwise intersections are
  faces of both cones. A fan morphism is an integral lattice map, its compatible real-linear map,
  and the theorem that each source cone maps into a target cone.
- The dual semigroup is the additive submonoid of integral characters nonnegative on the cone.
  The affine chart is the spectrum of its complex monoid algebra. Face inclusions act through
  localization and affine open immersions.
- The dense complex torus is represented coordinate-freely by multiplicative characters of the
  integral character lattice. It becomes `(C^*)^n` only after choosing a basis.
- Affine complex points are algebra homomorphisms from the complex monoid algebra to `C`. Their
  topology is induced by evaluation on a finite semigroup generating family. Independence from
  that family is proved before any regular-coordinate homeomorphism.
- A mixed chart is `C^k x (C^*)^l`. A mixed monomial map has natural-number exponents from
  noninvertible source coordinates and integer exponents from invertible source coordinates.
  No noninvertible source coordinate may contribute to an invertible target coordinate.
- Gluing uses `TopCat.GlueData.glued`. The analytic realization is not a second tagged quotient.
- Global algebraic complex points mean scheme morphisms `Spec C -> X`, not the underlying
  prime-ideal space of `X`.
- The toric boundary is a finite ray-indexed family of closed embedded complex hypersurfaces.
  Its simple-normal-crossings conclusion is a complex local biholomorphism, represented by a
  complex `PartialDiffeomorph`, under which the components are coordinate hyperplanes. A merely
  topological `PartialHomeomorph` does not establish this conclusion.
- Properness is stated only for finite fans. For every target cone `tau`, the inverse image of
  `tau` under the real-linear map equals the support of the source cones mapped into `tau`.

## Existing foundations to consume

At the dependency pin, the following anchors already exist.

- Mathlib's ordered-cone hierarchy, including finite generation, dual finite generation,
  simpliciality, salience, faces, maps, and the face lattice.
- Finite free modules, scalar extension, `Basis`, `Module.Dual`, `Finsupp`, matrices, additive
  submonoids, monoid algebras, localizations, affine schemes, and scheme gluing.
- The Toric modules for diagonalizable group schemes, tori, monoid algebras,
  `AlgebraicGeometry.ToricVariety`, and affine toric varieties from affine monoids.
- Complex differentiability, finite products, open subspaces, complex manifolds, local
  diffeomorphisms, and structure groupoids.
- `TopCat.GlueData`, its canonical open embeddings, its open-set criterion, and its colimit
  universal property.
- Proper maps, compactness, local compactness, quotient maps, and second-countability tools.

## Layer 0: the Toric-compatible algebraic supplier

This layer closes the algebraic prerequisite chain. Each item has an exact carrier and feeds the
representative declarations in `Suggested.lean`.

1. Define the integral-lattice predicate by an `R`-linear equivalence
   `R tensor[Z] N ≃ N_R` whose restriction to `1 tensor N` is the chosen lattice map. Derive
   injectivity, discreteness, spanning, equality of integral and real ranks, and naturality under
   integral linear maps.
2. Define `IsToricCone i sigma` on a Mathlib `PointedCone` by finite generation, lattice
   rationality, and salience. Prove preservation under faces, intersections, products, injective
   integral maps, and lattice equivalences.
3. Define rays as one-dimensional Mathlib faces. Prove existence and uniqueness of the primitive
   generator of every ray, finiteness of the ray type, generation of the cone by its primitive
   rays, and naturality under lattice equivalences.
4. Define regularity as the conjunction of `IsToricCone` with the existence of an integral basis
   containing every primitive ray generator. Prove regular cones are simplicial and that faces
   and products of regular cones are regular. Pin the block form relating two extending bases.
5. Define a finite fan as a finite set of toric cones closed under faces with pairwise
   intersections a face of each. Define support, completeness, open subfans, products,
   subdivisions, and fan morphisms. Prove identity, composition, and support functoriality.
6. Define the dual affine semigroup as the additive submonoid of integral characters
   nonnegative on a cone. Prove finite generation, face-localization, functoriality, and the
   regular-coordinate equivalence with `N^k x Z^(n-k)`.
7. Construct the affine toric scheme as the spectrum of the complex monoid algebra. Connect it
   to the Toric project's affine-monoid `ToricVariety` instance, identify its dense torus, and
   construct the torus action.
8. For every face inclusion, construct the localization map and prove it is an affine open
   immersion. Prove identity, composition, pairwise-overlap, and cocycle laws.
9. Glue the affine schemes of a finite fan along these open immersions. Construct the global
   dense torus, torus action, cone opens, and algebraic toric maps. Prove identity, composition,
   products, open-subfan restriction, and naturality of the affine inclusions.

**Source spine:** Cox--Little--Schenck, Chapters 1 and 3; Fulton, Chapter 1 and §2.1; the public
Toric modules named above.

## Layer 1: characters and mixed monomial maps

1. Define evaluation of an integral character on the complex torus without choosing a basis.
   Prove its multiplicative laws, separation of points, compatibility with lattice maps, and its
   Laurent-monomial formula after choosing a basis.
2. For a semigroup homomorphism, construct the contravariant map on affine complex points. Prove
   compatibility with the monoid-algebra map, continuity for monomial-embedding topologies, and
   independence from chosen generators.
3. Define typed mixed exponent data for maps
   `C^k x (C^*)^l -> C^k' x (C^*)^l'`. Prove preservation of the invertible-coordinate locus,
   holomorphy there, identity, composition **on that locus**, products, Jacobian formulas, and
   biholomorphicity for the appropriate unimodular block matrices. No composition theorem is
   stated on ambient points with a zero torus coordinate, where integer-power conventions break
   exponent arithmetic.
4. Prove that localization along a face gives an open complex subspace and a biholomorphism onto
   its image. Verify the cocycle equations for successive face inclusions.

**Source spine:** Cox--Little--Schenck, §§1.1--1.3 and §3.1; Fulton, §§1.2--1.3.

## Layer 2: affine analytic charts of regular cones

1. Put the finite-monomial-embedding topology on the affine complex-point carrier. Prove
   independence from the generating family, Hausdorffness, local compactness, and second
   countability.
2. For a regular cone of dimension `k` in a rank-`n` lattice, use an extending basis to construct
   a biholomorphism with `C^k x (C^*)^(n-k)`. Prove its coordinate functions are the expected
   characters.
3. Install the named complex `ChartedSpace` and prove `IsManifold`. Show that changing the
   extending basis preserves the complex structure through the corresponding mixed monomial
   biholomorphism.
4. Identify the dense torus as an open submanifold and the orbit associated to every face as a
   locally closed complex submanifold. Compute its dimension and closure relation.
5. Prove that face localization is an open holomorphic embedding and agrees on carriers with
   complex points of the algebraic open immersion.

**Source spine:** Fulton, §§1.2 and 2.1; Cox--Little--Schenck, §§1.2, 3.1, and 3.3.

## Layer 3: finite-fan analytic gluing

1. Form the `TopCat.GlueData` diagram of affine charts and face-localization overlaps. Derive its
   symmetry and cocycle equations from the fan intersection axiom and Layer 0 localization laws.
2. Apply the complex-manifold gluing theorem to `TopCat.GlueData.glued`. Prove every affine chart
   inclusion is an open holomorphic embedding and every cone-orbit chart agrees on overlaps.
3. Prove Hausdorffness from the fan intersection property and closedness of the generated gluing
   relation. The proof must separate points in noncommon faces rather than store separation in a
   fan record.
4. Prove second countability from finiteness of the chart family and second countability of each
   affine chart. Prove local compactness and finite dimensionality.
5. Establish invariance under fan equivalence and functoriality for open subfans. A subdivision
   produces a holomorphic map to the original realization, not an asserted isomorphism.

**Source spine:** Fulton, §§1.4 and 2.4; Cox--Little--Schenck, §§3.1 and 3.4; Oda, Chapter I.

## Layer 4: torus actions, strata, and the boundary

1. Glue the affine torus actions and prove the group law, joint continuity, holomorphy, and
   equivariance of chart inclusions and character functions.
2. Prove the orbit--cone correspondence as an order-reversing equivalence between cones and
   torus orbits. Compute stabilizers and quotient tori using sublattices.
3. For each ray, construct the invariant closed embedded complex hypersurface. Prove that the
   finite union of these components is exactly the complement of the dense torus and that every
   component has reduced multiplicity one.
4. At every point, construct a regular affine chart, the finite set of boundary components
   through the point, and an injection from those components to coordinate indices. Make this a
   complex local biholomorphism and prove that a point of the chart lies in a component exactly
   when the corresponding holomorphic coordinate vanishes.
5. Deduce transversality and the intersection formula indexed by cones. Prove naturality under
   fan isomorphisms, products, and open subfans.

**Source spine:** Fulton, §§2.1--2.2 and §3.1; Cox--Little--Schenck, §§3.2--3.3 and §4.1.

## Layer 5: toric maps and properness

1. Glue the affine mixed monomial maps attached to a fan morphism. Prove holomorphy, identity,
   composition, product compatibility, and uniqueness from the dense torus.
2. Describe preimages of affine cone charts and orbit strata cone by cone. Prove restriction and
   base-change results for open subfans.
3. For finite source and target fans, prove that the analytic map is proper exactly when, for
   every target cone, its real-linear inverse image equals the support of the source cones mapped
   into that cone.
4. Deduce that the realization of a complete finite fan is compact and that a star subdivision
   induces a proper map because the supports agree.
5. Prove that a fan isomorphism induces a biholomorphism, with inverse induced by the inverse fan
   morphism.

**Source spine:** Fulton, §2.4; Cox--Little--Schenck, §3.3 and Theorem 3.4.11.

## Layer 6: global algebraic--analytic comparison

1. For every cone, compare algebra homomorphisms from its complex monoid algebra to `C` with
   morphisms `Spec C -> U_sigma`. Prove compatibility with the independent monomial-embedding
   topology.
2. Prove that complex points preserve the finite affine-open gluing used to construct the fan
   scheme. Identify the resulting topological gluing with `TopCat.GlueData.glued` and show that
   both overlap maps are the same face-localization maps.
3. Glue the affine comparisons to a torus-equivariant homeomorphism from
   `Hom(Spec C, X_Sigma)` to the analytic realization. Prove it and its inverse are holomorphic.
4. Prove naturality for fan morphisms, characters, products, orbit inclusions, and boundary
   components. The comparison identifies analytic compactness with algebraic completeness
   through the common finite-fan support criterion.

**Source spine:** Cox--Little--Schenck, Chapters 1 and 3; Fulton, Chapters 1--2; Gunning--Rossi,
Chapter I.

## Dependency order

| Track | Depends on | Feeds |
| --- | --- | --- |
| L0 algebraic supplier | Mathlib and the existing Toric modules | every later layer |
| L1 character and mixed-monomial calculus | L0, Mathlib complex analysis | L2, L5--L6 |
| L2 affine regular charts | L0--L1, complex manifolds | L3--L6 |
| L3 finite-fan gluing | L2, complex-manifold gluing | L4--L6 |
| L4 orbit and boundary theory | L2--L3 | L6 and downstream geometry |
| L5 maps and properness | L1--L3 | L6 and compactness applications |
| L6 global comparison | L0--L5 | reusable analytic realization |

After L0 fixes the carriers, L1's character calculus and the generator-independence part of L2
can proceed in parallel. L4 and L5 can proceed independently after L3. L6 joins those tracks.

## Acceptance checks

- The map `ℤ² -> ℝ`, `(a,b) |-> a + √2 b`, is rejected as an integral lattice even though it
  is injective and has full real span. It cannot produce two competing primitive generators of
  the same ray.
- The full line in a rank-one real lattice is a Mathlib `PointedCone` but fails the toric-cone
  salience predicate. Its dual semigroup gives a point; it is never accepted as the cone of an
  affine toric curve with a dense one-dimensional torus.
- The affine ray cone produces `C`, the zero cone produces `C^*`, and face localization is the
  ordinary inclusion `C^* -> C`.
- A rank-`n` regular cone of dimension `k` produces a chart biholomorphic to
  `C^k x (C^*)^(n-k)`. Two extending bases give the same atlas.
- A mixed monomial with a negative exponent in a noninvertible source coordinate is rejected by
  its type. Identity and composition agree with matrix block composition on `mixedChartDomain`;
  no equality is claimed at ambient points with zero torus coordinates.
- The fan with only the zero cone produces the coordinate-free complex torus. A basis identifies
  it with `(C^*)^n`, and changing basis acts by the corresponding Laurent monomial map.
- The standard complete fan produces complex projective space with its standard affine charts;
  the comparison respects homogeneous-coordinate monomials.
- Product fans realize as products of complex manifolds, with matching character and orbit
  formulas.
- A star subdivision gives the expected proper toric map through the finite-fan support
  criterion.
- The boundary is proved to be a finite ray-indexed family of closed embedded complex
  hypersurfaces through a holomorphic coordinate-hyperplane local normal form. A
  `PartialHomeomorph` or a stored SNC assertion is insufficient.
- The global comparison starts from `Hom(Spec C, X_Sigma)`, agrees on every affine chart and
  overlap, and is natural for toric maps. An unrelated homeomorphism of final carriers is
  insufficient.
- No public declaration introduces a competing convex-cone, semigroup-algebra, scheme, gluing
  quotient, or biholomorphism carrier.

## References

- William Fulton, *Introduction to Toric Varieties*, Annals of Mathematics Studies 131,
  Princeton University Press, 1993, especially Chapters 1--2.
- David Cox, John Little, and Henry Schenck, *Toric Varieties*, Graduate Studies in Mathematics
  124, American Mathematical Society, 2011, especially Chapters 1, 3, and 4.
- Tadao Oda, *Convex Bodies and Algebraic Geometry*, Ergebnisse der Mathematik 15,
  Springer, 1988, Chapter I.
- Robert Gunning and Hugo Rossi, *Analytic Functions of Several Complex Variables*, Prentice-Hall,
  1965, Chapter I.
- Yaël Dillies et al., [*Toric varieties in Lean*](https://github.com/YaelDillies/Toric), for
  the existing tori, monoid-algebra, affine-monoid, and `ToricVariety` interfaces consumed here.
