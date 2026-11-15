<!--tauceti-status:v1 {"roadmap":"ScatteringDiagrams","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5","ts":"2026-11-11T09:30:56+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the BCH element and groups, PBW equivalence, degree truncations, completed exponential and actions, ordered products","state":"partial"},{"id":"Layer 1","remaining":"homogenization and faces, rational Minkowski-Weyl, polyhedral complexes, generic paths, cochains and sweeps","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"wall groups and zeroDirectionLieWord in 3.1; directed walls, local scattering and completion in 3.2-3.4","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"}],"readme_sha":"2e41073226c212b8f09c64a724699e672e3abd004ae6d13772ca5adb3014edb1","roadmap":"ScatteringDiagrams","to_sha":"d9fbe7bd6aedb5ed0ffb867836c3ed71aa7d28e5"}-->
# Status: ScatteringDiagrams

This file documents the status of the ScatteringDiagrams roadmap up until `d9fbe7b` (2026-11-11T09:30:56+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations of Layers 0 and 1 are partly built, and the first piece of Layer 3, its wall spaces, is in place. The Layer 0 summit is still open: the BCH group, the completed exponential and the PBW symmetrization equivalence are missing. No scattering diagram, broken line or theta function exists yet, so Layers 2 and 4–7 are untouched.

### Named results

- **The Minkowski–Weyl theorem** — a pointed cone in a finite-dimensional space over an ordered field is finitely generated exactly when it is cut out by finitely many halfspaces, lineality allowed ([`PointedCone.fg_iff_dualFG`](https://taucetiproject.org/docs/TauCeti/Geometry/Convex/Cone/MinkowskiWeyl.html#PointedCone.fg_iff_dualFG)). This is one of the `Suggested.lean` headlines; the rational form for lattice-rational cones is not yet stated.
- **Faces of finitely generated cones are exposed** — each face is cut out by a functional that is nonnegative on the cone ([`PointedCone.IsFaceOf.isExposed_of_fg`](https://taucetiproject.org/docs/TauCeti/Geometry/Convex/Cone/Face/Exposed.html#PointedCone.IsFaceOf.isExposed_of_fg)).
- **Density of the generic locus** — points avoiding countably many finite arrangements of proper affine subspaces form a dense set, the starting point for generic paths ([`ExceptionalArrangement.dense_iInter_isGeneric`](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Affine/Generic.html#TauCeti.ExceptionalArrangement.dense_iInter_isGeneric)).
- **Primitive elements of a symmetric algebra** — over a commutative rational algebra these are exactly the generators, the step that will identify completed primitives with the Lie algebra ([`SymmetricAlgebra.isPrimitiveElem_iff_mem_range_ι`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/SymmetricAlgebra/Primitive.html#SymmetricAlgebra.isPrimitiveElem_iff_mem_range_ι)).
- **Fiberwise limits over a Grothendieck construction** — the limit over the total category is the limit over the base of the limits on the fibers ([`limitFiberwiseLimitIso`](https://taucetiproject.org/docs/TauCeti/CategoryTheory/Limits/Shapes/Grothendieck.html#CategoryTheory.Limits.limitFiberwiseLimitIso)).

### Notable definitions and infrastructure

- **Positive degree data and their maps** ([`PositiveDegrees`](https://taucetiproject.org/docs/TauCeti/Algebra/PositiveDegrees/Basic.html#TauCeti.PositiveDegrees), [`PositiveDegreeMap`](https://taucetiproject.org/docs/TauCeti/Algebra/PositiveDegrees/Map.html#TauCeti.PositiveDegreeMap)) give the finite cutoffs and cutoff moduli that every truncation and completion in the roadmap is indexed by. They come with the decomposition of nonzero degrees into supported rays.
- **Completions as inverse limits.** Filtered rings and algebras have [completions](https://taucetiproject.org/docs/TauCeti/RingTheory/FilteredAlgebra/Completion.html#TauCeti.AlgFiltration.completion) and group towers have [completed groups](https://taucetiproject.org/docs/TauCeti/GroupTheory/CompletedGroup/Basic.html#TauCeti.completedGroup), each with maps along cutoff moduli and identified with the categorical limit. This is where wall labels and their actions will live.
- **Directed wall spaces** ([`DirectedWallSpaces`](https://taucetiproject.org/docs/TauCeti/Geometry/ScatteringDiagram/WallSpace/Basic.html#TauCeti.DirectedWallSpaces)) package the homogeneous wall submodules with their normal and bracket laws, and show that walls with proportional normals commute.

### Roadmap coverage

**Layer 0** is partial. §0.1 is done apart from the lattice-cone instances (`σ∩N` as positive degree data). §0.8's correspondences, transfers, degree-history expansions, finite recursion, graphs and matching families are in place. So are most of §0.7's limit comparisons, fiberwise limits and reindexing. §0.3 has ring, algebra and module-tower completions and the tensor filtration, but not the completed tensor map or *principalCompletionEquiv*. §0.5 has completed groups and their maps, but not ordered products, *completedMap* or *changeDegreeEquiv*. §0.2 has graded subalgebras, quotients and scalar change, but no degree ideals or truncations. §0.4 has only ingredients (free Lie grading, enveloping-algebra grading, PBW symmetrization map, Dynkin operator). §0.6 has only the induced action on a module limit.

**Layer 1** is partial. It has rational polyhedra with integral-affine transport, Minkowski–Weyl over a field, exposed faces, generic loci, singular supports of wall families and the integral-affine structure groupoid. Homogenization and *finite_faces*, rational Minkowski–Weyl, finite polyhedral complexes, generic-path crossing, *jointLoopGeneration* and the §1.4 cochains are all missing.

**Layer 3** is partial: §3.1's wall spaces exist with maps, scalar extension and coordinate changes, but wall groups and *zeroDirectionLieWord* are missing, and so is everything in §§3.2–3.4. **Layers 2, 4, 5, 6 and 7** are untouched.

## The frontier

- **The BCH element and BCH groups (§0.4)** — `comap_freeAugmentation_pow_ι` and `exists_bch_exp_mul_exp` remain, then *BCHGroup* and the truncated groups. The free Lie grading and its lower-central identification are ready for this.
- **PBW symmetrization equivalence (§0.4)** — the symmetrization map is a surjective coalgebra map; injectivity and the filtered equivalence `exists_pbwSymmetrizationEquiv` remain.
- **Degree ideals and truncations (§0.2)** — *degreeIdeal* and *truncatedLie* with their transition and induced maps, needed before §0.5's *completedMap* and the Layer 3 wall groups.
- **Rational polyhedral geometry (§1.1)** — homogenization, *finite_faces*, the rational Minkowski–Weyl refinement and *FinitePolyhedralComplex*, which Layer 2 needs.
- **Generic paths (§1.2)** — finite crossing and *jointLoopGeneration*, building on the generic-locus density and singular-support results already in place.
