# Roadmap: inverse Galois theory and arithmetic fundamental groups

**Summary.** This roadmap builds the arithmetic of finite covers that inverse Galois theory needs:
Galois algebras, local systems and the pro-étale fundamental group; tame quotients, Frobenius and
Grothendieck's specialization theorems using the arithmetic fundamental-group sequence and inertia; Hilbert
irreducibility over number fields with full-group, disjoint and locally prescribed specializations;
branch cycles, rational rigidity and the field-of-moduli obstruction; braid orbits of Nielsen
classes and their lifting invariants in the universal marked central extension; Shafarevich's
theorem that every finite solvable group is a Galois group over a number field, with proper
embedding problems, Grunwald–Wang and finite Poitou–Tate; Hurwitz spaces in characteristic zero and
over finite fields, their components, cohomology and point counts; and explicit realizations,
including the open inverse Galois problem as a named statement. We want it because realizing groups
as Galois groups, and counting how often they occur, is where the geometry of covers, the
arithmetic of number fields and the combinatorics of braid groups meet, and because the anabelian,
arithmetic-statistics and Galois-cohomological roadmaps all start from the objects built here.

A finite cover of a curve is, after choosing a base point, a finite set with an action of the
fundamental group; over a field that is not algebraically closed the fundamental group also records
how the Galois group of the constants moves the cover. This roadmap develops that dictionary in the
direction of the inverse Galois problem. Its first two layers fix the fundamental-group calculus:
the étale fundamental group is supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`,
for connected nonempty locally Noetherian schemes without coefficient invertibility.
What is built here are Galois algebras, `ℤ_p`-local systems, the pro-étale
fundamental group, tame quotients, tangential base points and specialization. Field and multiplicative-group
identifications, the arithmetic exact sequence, decomposition and inertia are supplied by
EtaleCohomologyFoundations §§F.0.A0–F.0.A2. Hilbert irreducibility then turns a regular Galois
extension of `K(T)` into infinitely many Galois extensions of a number field `K` with the same
group (Layer IG.2). Rigidity produces regular extensions from conjugacy classes, and the braid group
organises the tuples that classify covers; the lifting invariant of Ellenberg, Venkatesh, Westerland
and Wood separates their braid orbits (Layer IG.3). Independently, embedding problems over number
fields give Shafarevich's theorem (Layer IG.4). Hurwitz spaces assemble covers into moduli spaces,
whose components and points over finite fields are counted by the lifting invariant and by the
Grothendieck–Lefschetz formula (Layer IG.5). The last layer packages realizations and
states the inverse Galois problem over `ℚ` and its regular version as open propositions, together
with the implication between them.

The end theorems are Hilbert's irreducibility theorem over number fields with full-group and
linearly disjoint specializations (Layer IG.2), rational rigidity and the stable classification of
generating braid orbits by the lifting invariant (Layer IG.3), Shafarevich's solvable realization
theorem (Layer IG.4), and the identification of components of Hurwitz spaces and their
Frobenius-fixed points with lifting invariants (Layer IG.5).

The companion [Suggested.lean](Suggested.lean), in the namespace
`TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups`, states headline results against the
pinned Mathlib and Tau Ceti, with the simple definitions needed to express them. A target's Lean
line names its statements in that file; the other targets are specified here. Checks are
mathematical examples stated in prose.

## Scope and ownership

This roadmap builds on [BelyiMaps](../BelyiMaps/README.md) and starts where its three-point
theory stops. BelyiMaps owns permutation triples, dessins, three-point covers, Belyi's
theorem, fields of moduli of Belyi pairs, the branch-cycle theorem for the thrice-punctured line,
the pro-`ℓ` peripheral-power theorem and faithfulness of the Galois action on dessins (its Layers
0–13, the later ones through its named successors). This roadmap treats finite covers of general
schemes, arbitrarily many branch points, Hilbert specialization, arithmetic embedding problems and
Hurwitz families, and consumes the three-point theory at the points listed below.

The roadmap owns:

- Galois algebras over a field and the idempotent description of maps out of a finite étale
  algebra; curve and constructible trace formulas (IG.0.T1–IG.0.T4); integral, isogeny and rational
  `ℤ_p`-local systems with their lattice schemes and their
  comparison with the lisse part of the `ℓ`-adic realization; Noohi groups, infinite Galois
  categories and the pro-étale fundamental group (Layer IG.0);
- tame and prime-to-`p` quotients of fundamental groups of curves, tame tangential
  fibres, the Frobenius normalisation over finite fields, finite étale covers of proper schemes over
  a henselian local ring, proper descent of finite étale covers,
  invariance under algebraically closed base extension in characteristic zero, specialization for
  proper smooth families and for smooth pairs with a relative normal crossings boundary, arithmetic
  representations, exactness for the universal punctured curve, and
  the fundamental groups of homogeneous spaces with finite stabilisers (Layer IG.1);
- specialization of polynomials over `K(T)` at points of `K`, Hilbert subsets and thin sets,
  Hilbertian fields, Hilbert's irreducibility theorem over number fields and its full-group,
  linearly disjoint, local-condition, norm-pullback and quantitative forms, Hilbert specialization
  detected by the Frattini quotient, and normal subgroups of absolute Galois groups of Hilbertian
  fields (Layer IG.2);
- Riemann existence for punctured curves in the form used for branch cycles, Artin neighbourhoods
  as `K(π, 1)` spaces, branch tuples, Nielsen classes, the Hurwitz braid action and the braid-orbit
  monoid, exterior epimorphisms and `T`-systems, realization of generating tuples, rational rigidity,
  the field-of-moduli obstruction, reduced Schur multipliers and covers, marked central extensions
  and the universal marked extension `U(G, c)` with its kernel, the action of units and the
  cyclotomic twist, lifting invariants and the stable classification of braid orbits (Layer IG.3);
- proper embedding problems with local prescriptions over number fields, the abelian lifting
  obstruction, twisting of solutions, the restricted-ramification localization adapter
  and auxiliary cokernel comparisons for Shafarevich shrinking, Shafarevich's theorem with the Fitting
  subgroup and free operator groups, the Brauer–Manin set, Harpaz–Wittenberg density for
  supersolvable stabilisers and the unramified Brauer classes it needs, supersolvable and quaternion
  local prescriptions, unramified admissible `Γ`-groups, Property E, arithmetic lifting invariants
  and the marked extension count (Layer IG.4);
- configuration spaces, topological and arithmetic Hurwitz spaces, tame and admissible `G`-covers,
  the cohomological comparisons and point estimates for Hurwitz spaces, component invariants,
  hyperelliptic quotient families, versal families, field patching over complete discrete
  valuation rings with the patching of Galois algebras with prescribed local pieces and of covers
  with a fixed branch divisor, the Euler characteristic of `ℓ`-torsion local systems on affine
  curves, and Abhyankar's conjecture for affine curves through Serre's solvable step, Raynaud's
  theorem for the affine line and Harbater's theorem for the punctured line (Layer IG.5);
- realizations, their specialization, worked realizations, the transport of the
  BelyiMaps conventions, the inverse Galois problem and generic polynomials (Layer IG.6).

It does not own, and consumes by name:

- finite étale Galois categories, paths and finite lisse monodromy: Supplied by
  EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`.
  Based `π₁` requires connected nonempty locally Noetherian schemes; finite lisse coefficients
  need no invertibility;
- finite CW type, Riemann existence and finite/adic Artin comparison: Supplied by
  ComplexComparisonPartII §§C6.0–C6.6 / `complexAlgebraicTopology`, `riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`, `relativeArtinComparison`, `adicArtinComparison`.
  Riemann existence and ordinary comparison admit all finite-type complex schemes; global CW
  type and compact support require separatedness, and adic comparisons use uniformly bounded
  normalized ctf systems;
- finite-coefficient base change, cohomology, finiteness and adic realization: Supplied by
  EtaleCohomologyFoundations §§F.0–F.4 / `VanishingCycles.constructibleEtale`, `VanishingCycles.etaleTateTwists`, `VanishingCycles.constructibleDerivedCategory`, `VanishingCycles.finiteCoefficientCohomology`, `VanishingCycles.etaleBaseChange`, `VanishingCycles.etaleCompactSupports`, `VanishingCycles.etaleFiniteness`, `VanishingCycles.adicRealization`.
  Invertibility is carried by the particular theorem, constructible does not imply finite Tor
  amplitude, and fibre transport retains a chosen path or specialization datum;
- derived proper supports and localization: Supplied by
  EtaleCohomologyFoundations §§0.7–0.8 / `ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.properSupports`.
  These use étale module coefficients, with lower shriek defined by compactification on `D⁺`
  torsion complexes;
- Frobenius and rational-point fixed points: Supplied by
  EtaleCohomologyFoundations §§F.10.1–F.10.2b / `VanishingCycles.frobeniusFixedPoints`,
  `VanishingCycles.frobeniusCohomology`,
  and étale topological invariance: Supplied by
  EtaleCohomologyFoundations §F.0 / `VanishingCycles.universalHomeomorphismEtaleEquivalence`.
  Traces use compact support and geometric Frobenius, finite-level traces use perfect complexes,
  and topological invariance applies to every universal homeomorphism;
- the three-point theory of **BelyiMaps**: permutation triples and their enumeration (Layers 0 and
  3), the thrice-punctured sphere (Layer 5), covers and triples (Layer 6), fields of moduli and of
  definition of Belyi pairs (Layer 11), the branch-cycle theorem and peripheral inertia (Layer 12),
  and the pro-`ℓ` peripheral theorem with faithfulness of the Galois action on dessins (Layer 13,
  in particular 13.5, which this roadmap uses as stated there and does not reprove);
- the profinite integers as a ring, profinite powers and continuous outer automorphisms
  (**ProfiniteArithmetic**), peripheral power conventions (**PeripheralActions**), profinite and
  pro-`p` groups, Frattini subgroups and weak finite embedding problems with their cohomological
  obstruction (**ProfiniteProPGroups**, Layers 0, 3, 4 and 5; in Tau Ceti
  `TauCeti.FiniteEmbeddingProblem` and, for any abelian kernel,
  `TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`), and continuous
  cohomology (**ProfiniteCohomology**, Layers 1, 5, 7 and 10);
- general profinite full-image detection and openness of the Frattini subgroup for compact
  matrix groups (**ArithmeticGaloisRepresentations**, §6.4a). Detection requires a closed image;
  the finite-cover specialization application here assumes an open Frattini subgroup, and the
  compact-matrix openness theorem requires a compact subgroup of `GL_n(E)` with `E/ℚ_ℓ` finite;
- the `Sₙ` polynomials over `ℚ` (**PolynomialGaloisGroups**, Layer 9, with its Layers 2 and 3 for the
  Galois–permutation dictionary and the discriminant), and the Galois groups of the small cubics
  and quartics computed in the Tau Ceti library (`X³ − 3X − 1`, `X⁴ − 2`, `Φ₅`); places,
  completions and weak approximation of number fields (**GlobalNumberFields**, Layers 0 and 1);
  local and global class field theory with local Tate duality and the Brauer sequence
  (**ClassFieldTheory**, Layers 5, 7 and 10–12); finite Galois localization, absolute finite
  Poitou–Tate and Grunwald–Wang
  (**ArithmeticGaloisDuality**, §§R02.3.0d–R02.3.1, R02.4.2–R02.4.3, R02.4.5a–R02.4.6); Chebotarev density (**Chebotarev**); unramified extensions, Frobenius,
  ramification and the tame quotient of local Galois groups (**LocalFieldsRamification**, Layers
  2–4); curves and their places (**AlgebraicCurves**, Layers 3–5, 7, 8 and 12); finite étale schemes
  over a field and finite torsors (**ModularCurves**, Layers 0c–0d); affine group schemes, their
  quotients and semisimple groups (**ReductiveGroups**, Layers 0, 3 and 6); representation groups of
  finite groups (**RepresentationTheory/InductionRestriction**, Layer 7); fibrations and homotopy
  groups (**AlgebraicTopology**, Stages 5 and 8); semistable reduction of curves
  (**StableReduction**, Layer 7);
- schemes, descent, stacks, sites, étale and pro-étale cohomology, Brauer groups of schemes, curves,
  stable pointed curves, Popescu desingularization, Grothendieck existence and algebraization
  (**SchemeAndStackFoundations**, Layers 0–4),
  and the Weil bound for curves over finite fields (its §5.11, `weil_bound`); the smooth trace and
  Poincaré duality in étale cohomology (**EtaleCohomologyFoundations**, §§F.5–F.6 /
  `VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`, with invertible coefficients
  and finite Tor amplitude); Weil restriction
  and norm tori (**ReductiveGroupsPartII**, Layer RG2.0a); the Hasse principle for torsors under
  semisimple simply connected groups and their weak approximation (**AdelicAlgebraicGroups**, Layer
  4, §4.1); Swan conductors of local Galois representations and their tame-base-change scaling
  (**ArithmeticGaloisRepresentations**, §§3.1, 3.4, over complete discretely valued fields with
  perfect residue field, including the completions of curves over an algebraically closed field);
  lower ramification groups of places of function fields over an arbitrary residue field
  (**AlgebraicCurves**, Layer 8); resolution and normal crossings
  compactification (**ResolutionOfSingularitiesCharacteristicZero**, §§5.5, 6.2, consumed through
  **AlgebraicModuliForArithmeticGeometry**, §§9.4–9.5); complex analytic spaces,
  scheme and algebraic-space analytification and proper coherent GAGA
  (**ComplexComparisonPartII**, §§C−1.1–C−1.3, C1.9); derived categories of
  sheaves and derived limits (**EnhancedDerivedSheaves**, §§0.1–0.3 /
  `ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`, `ClassicalDerived.inverseLimits`),
  and replete topoi (**SchemeAndStackFoundations**, §2.17 / `Proetale.isReplete_proetale`); complex
  coherent analytic modules, derived GAGA for proper algebraic spaces and the affine-curve
  completion and connectedness comparisons (**ComplexComparisonPartII**, §§C0, C3 and C4.5).

This roadmap uses global class field theory and global duality only over number fields (ClassFieldTheory
and the number-field Poitou–Tate theorem of ArithmeticGaloisDuality), so the theorems of
Layer IG.4 that rest on class field theory are stated over number fields; the definitions of that layer
cover all global fields, including the rational function fields `𝔽_q(t)` that Layer IG.5 uses. The
Feit–Thompson theorem is not used: conjugacy of coprime complements is stated under a solvability
hypothesis.

The anabelian and nonabelian Chabauty extensions of the étale path groupoid, global duality for
compact coefficients, sieve methods with infinitely many local conditions, and weights in étale
cohomology are developed by other roadmaps that build on Layers IG.0–IG.5; nothing here depends on
them. Deligne's weight bound for compactly supported cohomology enters at one place, the Hurwitz
point estimate of Layer IG.5, where it is an explicit hypothesis of the statement
(Weil II, Corollaire (3.3.4)); DeligneWeightsAndPurity develops the weight theorem.

## Conventions

- `Γ_k = Gal(k^sep/k)` for a field `k`; `k̄` is an algebraic closure. Schemes in Layers IG.0–IG.1
  are locally Noetherian. Finite étale covers are covariant on fibres and contravariant on algebras.
  An étale path is a natural isomorphism of fibre functors; transport along a path is conjugation,
  so changing a path changes induced homomorphisms by inner automorphisms, and only outer actions
  are canonical.
- Arithmetic Frobenius over `𝔽_q` is `a ↦ a^q`; geometric Frobenius is its inverse. The cyclotomic
  character is defined by `σ(ζ) = ζ^{χ(σ)}`; a lift of `σ` conjugates a positive tame inertia
  generator at `P` to the `χ(σ)`-power of the generator at `σ(P)`, after chosen path transports.
  This is an action on one inertia conjugacy class only when `σ` fixes `P`; transporting a right
  action on covers uses `χ(σ)⁻¹`. Four
  Frobenius operations are kept apart: the `q`-power Frobenius endomorphism `F` of an
  `𝔽_q`-scheme, which acts on its `𝔽̄_q`-points exactly as arithmetic Frobenius does; the
  arithmetic and geometric Galois Frobenius acting on points, on components and on twisted sets;
  and the pullback `F^*` on cohomology, which is the action of geometric Frobenius used in the trace
  formula.
- Tame (tamely ramified along a chosen boundary) and prime-to-`p` (of order prime to `p`) give
  different quotients of the fundamental group in characteristic `p`; the free presentation on
  loops around punctures describes only the prime-to-`p` quotient.
- Permutations compose from right to left. The ordered product of a branch tuple is `g₁ g₂ ⋯ g_r`.
  The positive Hurwitz move is `(a, b) ↦ (a b a⁻¹, a)`. Inner Nielsen classes divide by
  simultaneous conjugation in `G`, absolute ones by the normaliser of a chosen faithful permutation
  representation, and `T`-systems by `Aut(F_r) × Aut(G)`. BelyiMaps writes its triples as `τ_∞ τ₁ τ₀ = 1`;
  Layer IG.6 transports that convention.
- In specialization, `T` is the parameter of Mathlib's `RatFunc K` and `Y` the outer polynomial
  variable; regularity at `t` means that the reduced denominator does not vanish at `t`.
- Field of moduli and field of definition, connected and regular, weak and proper solutions of
  embedding problems, a `G`-cover and its quotient cover, ordinary and tangential base points are
  distinct notions throughout, each with its own hypotheses.
- The inverse Galois problem over `ℚ` and the Nielsen transitivity conjectures are named open
  propositions; no realization theorem uses them as assumptions.

## Exact supplier contracts

### From Mathlib

| Object | Declarations | Used in |
| --- | --- | --- |
| Rational functions, reduced fractions and evaluation | `RatFunc`, `RatFunc.num`, `RatFunc.denom`, `RatFunc.denom_ne_zero`, `RatFunc.denom_dvd`, `RatFunc.denom_add_dvd`, `RatFunc.denom_mul_dvd`, `RatFunc.num_div_denom`, `RatFunc.eval`, `RatFunc.eval_add`, `RatFunc.eval_mul`, `RatFunc.eval_algebraMap` | IG.2 |
| Polynomials, coefficients, degrees and roots | `Polynomial.sum`, `Polynomial.coeff_sum`, `Polynomial.map`, `Polynomial.coeff_map`, `Polynomial.evalRingHom`, `Polynomial.toSubring`, `Polynomial.map_toSubring`, `Polynomial.eval_prod`, `Polynomial.leadingCoeff_ne_zero`, `Polynomial.natDegree_eq_of_le_of_coeff_ne_zero`, `Polynomial.finite_setOfPred_isRoot` | IG.2 |
| Finite sets and avoidance | `Set.Finite.subset`, `Set.Finite.union`, `Set.Finite.exists_notMem` | IG.2 |
| Field Galois theory and splitting fields | `IntermediateField`, `IsGalois`, `IsGalois.card_aut_eq_finrank`, `IsGalois.normalAutEquivQuotient`, `IsGalois.of_separable_splitting_field`, `Polynomial.SplittingField`, `Polynomial.Gal`, `AlgEquiv.autCongr` | IG.0, IG.6 |
| Finite étale algebras and Galois categories | `CommAlgCat.FiniteEtale`, `Algebra.Etale`, `CategoryTheory.GaloisCategory`, `CategoryTheory.PreGaloisCategory.FiberFunctor`, `CategoryTheory.PreGaloisCategory.functorToContAction` | IG.0 |
| Scheme morphisms | `AlgebraicGeometry.Etale`, `AlgebraicGeometry.IsFinite`, `AlgebraicGeometry.Scheme.Etale` | IG.0–IG.1 |
| Groups | `Subgroup`, `Subgroup.closure`, `FreeGroup`, `FreeGroup.lift`, `PresentedGroup`, `PresentedGroup.toGroup`, `MulAut.conj`, `frattini`, `Group.IsNilpotent`, `Group.IsSolvable`, `Subgroup.exists_right_complement'_of_coprime` (existence of complements only), `SemidirectProduct`, `DihedralGroup` | IG.3, IG.4 |
| Group extensions and group homology | `GroupExtension`, `GroupExtension.Splitting`, `groupHomology.H2`, `groupHomology.H2π`, `groupHomology.cycles₂`, `groupHomology.map`, `Rep.trivial`, `Abelianization`, `Finsupp`, `Submodule.basisOfPid`, `AddCommGroup.equiv_directSum_zmod_of_finite` | IG.3 |
| Number fields | `NumberField`, `NumberField.finrank_eq_one_of_unramified` | IG.2, IG.4 |
| Decomposition and inertia of primes in Galois extensions | `Ideal.inertia`, `Ideal.Quotient.stabilizerHom_surjective`, `Ideal.Quotient.stabilizerQuotientInertiaEquiv`, `Ideal.card_inertia_eq_ramificationIdxIn` | IG.1 |
| Topological groups and local fields | `IsTopologicalGroup`, `OpenSubgroup`, `IsKrasner` | IG.0, IG.2 |
| Galois groups of polynomials acting on roots | `Polynomial.Gal.galActionHom`, `Polynomial.Gal.galActionHom_injective` | IG.6 |
| Singular homology | `AlgebraicTopology.singularChainComplexFunctor`, `AlgebraicTopology.singularHomologyFunctor` | IG.3, IG.5 |
| Monoid algebras | `MonoidAlgebra` | IG.4 |
| Implicit function theorem over a complete nontrivially normed field | `HasStrictFDerivAt.implicitFunctionOfProdDomain` | IG.4 |

The Schur multiplier `M(G)` is Mathlib's `groupHomology.H2 (Rep.trivial ℤ G ℤ)`;
its carrier and additive-group API are used directly. No second multiplier carrier is introduced.

`Subgroup.exists_right_complement'_of_coprime` gives existence of a complement to a normal subgroup
of coprime order and index; conjugacy of complements in finite groups, under the solvability
alternatives, is LocalFiniteGroupTheory L1, and only the profinite statement is a target of Layer
IG.4. `RatFunc.eval` is total and returns `0` at a pole; its additive and multiplicative laws
carry nonvanishing-denominator hypotheses, which is why Layer IG.2 introduces the regular subring.

### From Tau Ceti

| Object | Declarations | Used in |
| --- | --- | --- |
| The Artin braid group with its presentation | `TauCeti.BraidGroup`, `TauCeti.BraidGroup.sigma`, `TauCeti.BraidGroup.lift`, `TauCeti.BraidGroup.lift_sigma`, `TauCeti.BraidGroup.strand`, `TauCeti.BraidGroup.strandSucc` (`TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean`) | IG.3, IG.5 |
| Finite places of `K(T)` and their valuation rings | `TauCeti.Place.adicOfIrreducible`, `TauCeti.Place.integers`, `TauCeti.Place.valuation_ofIrreducible_le_one_iff`, `TauCeti.Place.adicOfIrreducibleResidueFieldEquiv` (`TauCeti/FieldTheory/FunctionField/Place/RatFunc/`) | IG.2 |
| Decomposition and inertia of places in Galois extensions of function fields | `TauCeti.Place.stabilizer_eq_decompositionSubgroup`, `TauCeti.Place.decompositionQuotientInertiaEquiv`, `TauCeti.Place.card_inertiaSubgroup` (`TauCeti/FieldTheory/FunctionField/Place/Extension/`) | IG.1 |
| Splitting of central extensions by factor sets | `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` | IG.3 |
| Finite embedding problems and their solutions (ProfiniteProPGroups Layer 5) | `TauCeti.FiniteEmbeddingProblem`, `TauCeti.FiniteEmbeddingProblem.IsSolution` | IG.4 |
| The cohomological obstruction of a finite embedding problem with abelian kernel | `TauCeti.FiniteEmbeddingProblem.obstruction`, `TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero` | IG.4 |
| `Sₙ` as a Galois group over `ℚ` | `TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`, `Polynomial.HasFullSymmetricGaloisGroup`, `Polynomial.HasFullSymmetricGaloisGroup.nonempty_mulEquiv` | IG.6 |
| Galois groups of small cubics and quartics over `ℚ` by transitive-group label | `TauCeti.HasGaloisLabel`, `TauCeti.hasGaloisLabel_X_pow_three_sub_three_mul_X_sub_one`, `TauCeti.hasGaloisLabel_X_pow_four_sub_two`, `TauCeti.natCard_gal_X_pow_four_sub_two`, `TauCeti.hasGaloisLabel_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one` | IG.6 |
| Aspherical spaces | `TauCeti.IsAspherical` | IG.3 |

### From TauCetiRoadmap.BelyiMaps

Layers 0, 3, 5, 6 (triples, enumeration, the thrice-punctured sphere and its covers), 11 (fields of
moduli of Belyi pairs), 12 (the `ℚ̄`/`ℂ` comparison, the geometric fundamental group of
`ℙ¹ ∖ {0, 1, ∞}`, peripheral inertia and the branch-cycle theorem) and 13 (the peripheral-power
theorem and faithfulness on dessins). This roadmap uses their statements as written there, with the
convention transport of Layer IG.6.

### From AdicEtaleGeometry

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Algebraic Galois tensor map and finite étale torsors | Supplied by AdicEtaleGeometry §A4.2 / `Algebra.galoisTensorMap`, `Algebra.galoisTensorMap_restrictScalars`, `Algebra.IsFiniteEtaleTorsor`, `Algebra.IsFiniteEtaleTorsor.iff_field` | IG.0.2 restricts the tensor map to `K`-algebras and abbreviates the torsor class for finite groups over fields; disconnected algebras and arbitrary characteristic are included. |

### From EtaleCohomologyFoundations

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Finite and constructible module sheaves | Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.constructibleEtale` | Finite lissity needs no invertibility; global finite stratifications are Noetherian, and locally Noetherian constructibility is affine-local. |
| Finite covers, paths and monodromy | Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory` | Based `π₁` uses connected nonempty locally Noetherian schemes without coefficient invertibility, and transport uses a chosen path. |
| Field and multiplicative-group identifications | EtaleCohomologyFoundations §F.0.A0 / *The fundamental groups of a field and of `𝔾_m`* | Retain the intrinsic Tate module and the primitive-root coordinate convention. |
| Cover decomposition and inertia | EtaleCohomologyFoundations §F.0.A1 / *Decomposition and inertia groups of a cover* | The normalisation is finite; keep residue separability and defectless ramification hypotheses. |
| Arithmetic sequence | EtaleCohomologyFoundations §F.0.A2 / *The arithmetic fundamental-group sequence* | Exactness supplies the outer action; rational-point sections retain their path choices. |
| Henselian-trait inertia and tame character | EtaleCohomologyFoundations §F.3a / `VanishingCycles.HenselianTrait`, `VanishingCycles.tameCharacter_kummer`, `VanishingCycles.tameCharacter_surjective`, `VanishingCycles.tameCharacter_conj` | IG.1.2 applies it to the strictly henselian branches of curves over algebraically closed fields, whose residue field is infinite, and keeps the adapter to `TauCeti.PrimeToPTateModule`. |
| Continuous representations, stable lattices and integral models | Supplied by EtaleCohomologyFoundations §F.4.0 / `ContinuousRep`, `ContinuousRep.exists_stable_lattice_iff`, `GaloisLattice.IntegralModel` | IG.0.3 uses them for representations of `π₁^ét` and keeps the bounded lattice schemes, incidence, joins and isogeny descent. |
| Tate twists | Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.etaleTateTwists` | The annihilator is invertible; chosen primitive-root coordinates and peripheral orientation are retained. |
| Constructible and ctf complexes | Supplied by EtaleCohomologyFoundations §F.1 / `VanishingCycles.constructibleDerivedCategory` | Use the common module-valued derived carrier, with finite Tor amplitude required separately from constructibility. |
| Finite cohomology and coherent symmetry | Supplied by EtaleCohomologyFoundations §F.1 / `VanishingCycles.finiteCoefficientCohomology` | Preserve the coefficient-module and finite-group actions, without averaging when the group order is not invertible. |
| Proper base change | Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.properBaseChange` | Proper exchange applies to `D⁺` arbitrary torsion without an invertibility assumption. |
| Smooth base change | Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.smoothBaseChange` | Use the rotated smooth square with the other map qcqs and sectionwise invertible torsion, including separably closed field extensions. |
| Local acyclicity and fibre transport | Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.localAcyclicity`; Supplied by EtaleCohomologyFoundations §F.3 / `VanishingCycles.lisseDirectImageTransport` | Invertible finite coefficients and verified ULA/constructibility are required; §IG.5.5 proves the tame-boundary case and retains its specialization data. |
| Dimension, affine vanishing and proper finiteness | Supplied by EtaleCohomologyFoundations §F.3 / `VanishingCycles.etaleCohomologicalDimension`, `VanishingCycles.affineArtinVanishing`, `VanishingCycles.etaleFiniteness` | The dimension bounds are geometric over separably closed fields with invertible torsion, affine vanishing requires affineness, and proper finiteness retains its proper/Noetherian hypotheses. |
| Constructible lower shriek and compact cohomology | Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleCompactSupports`, `VanishingCycles.compactSupportCohomology`; Supplied by EtaleCohomologyFoundations §F.3 / `VanishingCycles.compactSupportFiniteness` | Use separated finite-type Noetherian geometry and invertible finite ctf coefficients for constructible exchange and perfectness. |
| Ordinary and compact Künneth | Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleKunneth`, `VanishingCycles.etaleKunnethCompactSupport` | The ordinary and compact-support maps are distinct; finite ctf coefficients have invertible annihilator, and the compact form requires separatedness. |
| Normalized systems and integral realization | Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.normalizedAdicSystems`, `VanishingCycles.classicalAdicRealization`, `VanishingCycles.adicFiniteness`, `VanishingCycles.adicFunctoriality` | Use invertible `ℓ`, coherent derived reductions and uniform cohomological/Tor bounds, retaining derived limits and coefficient/descent actions. |
| Compact-support rational finiteness | Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.rationalAdicRealization` | §IG.5.5 verifies separated finite type over the separably closed geometric field and invertible `ℓ`, using the chosen compact-support `ℚ_ℓ` realization. |
| Smooth trace and duality | EtaleCohomologyFoundations §§F.5–F.6 / `VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity` | Use bounded constructible finite-Tor complexes with invertible coefficients, then the normalized adic realization; smooth relative dimension fixes the shift and twist. |
| Frobenius and rational points | Supplied by EtaleCohomologyFoundations §§F.10.1–F.10.2b / `VanishingCycles.frobeniusFixedPoints`, `VanishingCycles.frobeniusCohomology` | Arithmetic Frobenius acts by `x↦x^q` and geometric Frobenius is its inverse, acting on `ℚ_ℓ(1)` by `q⁻¹`; coefficient descent data are retained. |
| Étale topological invariance | Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.universalHomeomorphismEtaleEquivalence` | Every universal homeomorphism gives an étale equivalence, with no coefficient-invertibility restriction. |
| Derived proper supports | Supplied by EtaleCohomologyFoundations §0.8 / `ClassicalAlgebraic.properSupports` | For separated finitely presented maps between qcqs schemes, including separated finite-type Noetherian maps, use `Rp_*j_!` on `D⁺` torsion module complexes, with compactification independence and coherent finite-group/coefficient maps. |
| Localization | Supplied by EtaleCohomologyFoundations §0.7 / `ClassicalAlgebraic.supportLocalization` | Use étale module open–closed triangles and apply the canonical lower-shriek functor to obtain compact-support triangles. |

Layer IG.0 owns integral local systems even when `p` is not invertible, their isogeny category
and stackified rational local systems without a global lattice; the comparison with §F.4 uses
integral lisse systems and the rational subcategory admitting a global lisse integral lattice.
Layers IG.1 and IG.5 apply the arithmetic `π₁` sequence to tame quotients and own the tame
relative-normal-crossings specialization argument; the generic smooth ULA theorem alone does
not supply local acyclicity at that boundary.

### Trace contracts in this roadmap

The four geometric trace declarations are constructed in §§IG.0.T1–IG.0.T4 under their public
`VanishingCycles` names. Applications consume these declarations with the hypotheses below.
Their perfect-complex trace algebra, free-torsor equivariant perfectness and derived coefficient
descent are supplied by EtaleCohomologyFoundations §§F.10.3–F.10.5.

| Object | Construction target | Convention/consumer |
| --- | --- | --- |
| Curve endomorphism trace | §IG.0.T1 / `VanishingCycles.curveEndomorphismTrace` | Use smooth proper geometrically connected curves and invertible `ℓ` with the supplied Tate coordinate and isolated fixed-point multiplicities. |
| Finite-coefficient trace formula | §IG.0.T2 / `VanishingCycles.etaleTraceFormulaFinite` | For separated finite-type finite-field schemes use descended ctf prime-to-characteristic coefficients and perfect-complex traces. |
| Rational constructible trace formula | §IG.0.T3 / `VanishingCycles.etaleTraceFormula` | Use the normalized rational realization of compatible finite-level systems, with descended coefficients, compact support and geometric Frobenius for every positive power. |
| Constant-sheaf point-count trace | §IG.0.T4 / `VanishingCycles.pointCountTrace` | §IG.5.5 takes `r=1`, `ℓ≠char k`, geometric Frobenius and compact support; the weight bound in the point estimate is a separate hypothesis. |

### From EnhancedDerivedSheaves

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Enhanced categories and replacements | EnhancedDerivedSheaves §§0.1–0.2 / `ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements` | Use module sheaves on the common ringed site and K-injective/K-flat replacements. |
| Derived inverse limits | EnhancedDerivedSheaves §0.3 / `ClassicalDerived.inverseLimits` | Retain derived products for sheaves, coherent towers and uniform bounds for tensor interchange. |

### From ComplexComparisonPartII

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Complex topology | Supplied by ComplexComparisonPartII §C6.0 / `complexAlgebraicTopology` | Global finite CW type/Hausdorffness uses separated finite type, without a manifold assumption. |
| Finite-cover comparison | Supplied by ComplexComparisonPartII §C6.2 / `riemannExistence` | All finite-type complex schemes are admitted; §IG.3.1 supplies the puncture-extension and cycle-length ramification adapter with the shared fibre/deck convention. |
| Finite-coefficient Artin comparison | Supplied by ComplexComparisonPartII §C6.3 / `artinComparison` | §IG.3.1 uses the stated constant finite abelian corollary and composes the inverse étale-to-topological map with the separately supplied group/topological comparison. |
| Compact-support Artin comparison | Supplied by ComplexComparisonPartII §C6.4 / `artinComparisonCompactSupport` | Use separated finite type and finite ctf/local coefficients with compact support. |
| Relative comparison | Supplied by ComplexComparisonPartII §C6.5 / `relativeArtinComparison` | Use the proper direct-image or separated finite-type lower-shriek branch and retain the chosen fibre transport. |
| Adic comparison | Supplied by ComplexComparisonPartII §C6.6 / `adicArtinComparison` | Use normalized finite ctf levels with uniform cohomological/Tor bounds, and separatedness for compact support; this supplies no canonical comparison of unrelated fibres. |

### From ArithmeticGaloisDuality

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Localization and Sha kernels | ArithmeticGaloisDuality §R02.3.0d / *Finite Galois localization and Sha kernels* | Absolute Galois cohomology of finite modules over number fields; retain modified real-place groups. |
| Absolute finite Poitou–Tate | ArithmeticGaloisDuality §R02.4.5a / *Finite-coefficient Poitou–Tate input* | IG.4 uses the all-place kernels and finite-set localization defects with the Cartier dual action. |
| Grunwald–Wang | ArithmeticGaloisDuality §R02.4.5b / *Grunwald–Wang and its exceptional class* | Retain the order-two alternative and the dyadic exception in cyclic prescriptions. |

### From topology roadmaps

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| `K(π, 1)` group/topological cohomology | ClassifyingSpaces §Stage 4 / item 17, Homology (including cohomology with local coefficients) | §IG.3.1 applies the comparison to the constructed neighbourhood through a CW model and the deck-group/opposite-`π₁` convention, with finite trivial coefficients |

### From SchemeAndStackFoundations

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Repleteness | SchemeAndStackFoundations §2.17 / `Proetale.isReplete_proetale` | IG.0 uses the pro-étale topos and its w-contractible covers. |
| Algebraic Riemann–Hurwitz | SchemeAndStackFoundations §3.2 / `scheme_riemann_hurwitz` | IG.3.3 applies the tame formula to smooth proper connected complex curves and groups the `|G|/e` points over each branch point. |

### From ResolutionOfSingularitiesCharacteristicZero

| Object | Exact supplier | Convention/consumer |
| --- | --- | --- |
| Resolution preserving the smooth locus | ResolutionOfSingularitiesCharacteristicZero §5.5 / `localIsomorphismResolution` | IG.1 uses a proper surjective smooth-source resolution of a reduced finite-type characteristic-zero scheme, preserving its smooth locus; the comparison is consumed through AlgebraicModuliForArithmeticGeometry §9.4. |
| SNC compactification | ResolutionOfSingularitiesCharacteristicZero §6.2 / `sncCompactification` | IG.1, IG.3 and IG.4 use a smooth projective compactification of a smooth quasi-projective finite-type characteristic-zero scheme, retaining the given open and reduced strict-SNC boundary; consumed through AlgebraicModuliForArithmeticGeometry §9.5. |

### From the other TauCetiRoadmap roadmaps

ProfiniteArithmetic Layer 0 (the ring `ẑ` and its units) and Layer 2 (continuous outer
automorphisms); PeripheralActions (peripheral powers); ProfiniteProPGroups Layers 0, 3, 4 and 5;
ProfiniteCohomology Layers 1, 5, 7 and 10 (corestriction); PolynomialGaloisGroups Layers 2, 3 and 9;
GlobalNumberFields Layers 0 and 1; ClassFieldTheory Layers 5, 7 and 10–12; Chebotarev (Layer 10); LocalFieldsRamification
Layers 2, 3 and 4; AlgebraicCurves Layers 3–5, 7, 8 and 12; ModularCurves Layers 0c and 0d;
ReductiveGroups Layers 0, 3 and 6; RepresentationTheory/InductionRestriction Layer 7, whose Schur
multiplier is `H²(G, k^×)` over an algebraically closed field, so the comparison with `H₂(G, ℤ)` used
in Layer IG.3 is part of the target *Reduced Schur covers* there; AlgebraicTopology Stages
5 and 8; StableReduction Layer 7 (semistable reduction of curves). The BelyiMaps Layers 11–13 used
here are the retained dependency specifications of that roadmap, whose ownership passes to its named
successors.

### From other roadmaps

SchemeAndStackFoundations Layers 0 (schemes and morphisms), 1 (descent, stacks, quotients),
2 (sites, étale and pro-étale cohomology, Brauer groups of schemes), 3 (curves) and 4
(deformations, stable pointed curves, formal schemes, Grothendieck existence and algebraization,
§4.10), with §0.12 (henselization), §0.14 (`henselian_smooth_lifting`), §0.15
(`popescu_desingularization`) and §0.21 (G-rings), and §5.11 (`weil_bound`, the Weil bound for
smooth proper geometrically integral curves over finite fields); ArithmeticGaloisDuality §R02.3.1
(*The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*), §R02.4.2
(*Unramified classes are exact annihilators*, *Restricted products of local cohomology and `Ш^r_S`*,
with `PoitouTate.sha_eq_absoluteSha`, and *`P^r_S(K, M)` is dual to `P^{2−r}_S(K, M^D)`*) and §R02.4.3 (*Poitou–Tate duality and the nine-term
exact sequence*), together with §§R02.3.0d, R02.4.5a–R02.4.5b
(localization, absolute finite duality and Grunwald–Wang), used by IG.4.2 twisting and cyclic
prescriptions and IG.4.3 *Restricted-ramification localization adapter*;
EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity` (smooth trace, relative
purity and Poincaré duality); ReductiveGroupsPartII Layer RG2.0a (Weil restriction and
norm tori); AdelicAlgebraicGroups Layer 4, §4.1 (*Hasse kernel and injectivity* for semisimple simply
connected groups, and *Weak approximation*, `Approximation.hasWeakApproximation_of_simplyConnected`);
LocalFiniteGroupTheory L1 (Schur–Zassenhaus conjugacy when the normal Hall subgroup or the quotient
is solvable) and L2 (the relative Fitting subgroup, whose value at the top subgroup is the `F(G)` of
IG.4.3, with nilpotence, characteristicity, maximality and `Φ(G) ≤ F(G)`);
ArithmeticGaloisRepresentations §§3.1, 3.4 (Swan conductors with finite coefficients over a
complete discretely valued field with perfect residue field, such as `k((z))` with `k`
algebraically closed, and their tame-base-change scaling, with the ramification filtrations of its
conductor setting); the finite-residue-field contract of LocalFieldsRamification Layers 3–4 is not
used at the completions of curves over an algebraically closed field;
ComplexComparisonPartII §C−1.1 (`ComplexAnalyticSpace` and
`complexSchemeAnalytification`), §§C−1.2, C1.9 (`complexSpaceAnalytification`, proper coherent GAGA);
ResolutionOfSingularitiesCharacteristicZero §5.5 / `localIsomorphismResolution` (resolution of
reduced finite-type characteristic-zero schemes) and §6.2 / `sncCompactification` (smooth
quasi-projective characteristic-zero schemes), consumed through AlgebraicModuliForArithmeticGeometry
§§9.4–9.5; EnhancedDerivedSheaves §§0.1–0.3 /
`ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`, `ClassicalDerived.inverseLimits`
(derived categories, replacements and derived inverse limits), and SchemeAndStackFoundations §2.17 /
`Proetale.isReplete_proetale` (replete topoi and w-contractible covers); ComplexComparisonPartII §C3.3 (`derivedGagaProperSpace`, for proper algebraic spaces) and §C4.5
(`affineCurveCompletionInterface`, `puncturedRiemannSurfaceConnected`, `affineCurveConnectedness`).

## How to read the build

Layer IG.0 builds curve and constructible trace formulas and extends the supplied étale fundamental
group in three directions (Galois algebras, `ℤ_p`-local systems, the pro-étale group).
Layer IG.1 applies the supplied arithmetic sequence and inertia to tame quotients, Frobenius and specialization. Layer IG.2
begins with elementary algebra over `K(T)` (the regular subring and polynomial specialization) and
ends with Hilbert's irreducibility theorem and its refinements. Layer IG.3 is the geometry and combinatorics of branched covers of the line: Riemann
existence, braid orbits, rigidity, descent, and the group theory of lifting invariants. Layer IG.4 is
independent of IG.3 except for the reduced Schur covers it uses for central lifts: it is the
arithmetic of embedding problems leading to Shafarevich's theorem and to the unramified groups of
Liu–Wood–Zureick-Brown. Layer IG.5 needs IG.1 and IG.3 and builds Hurwitz spaces with their
components and point counts. Layer IG.6 collects realizations. The layers are given in build order;
within a layer, definitions precede the theorems that use them. In IG.1 the order is tame quotients and tangential fibres, Frobenius, henselian proper
covers, proper descent, proper smooth specialization, relative-boundary specialization,
characteristic-zero base-extension invariance, then IG.1.4. In IG.2.4, finite-extension permanence
of Hilbertianity precedes the number-field theorem; IG.2.8 consumes that permanence theorem.

## Layer IG.0: Galois algebras, local systems and pro-étale fundamental groups

This layer builds what the arithmetic of finite covers needs around the étale fundamental group
`π₁^ét(X, x̄)` of a connected locally Noetherian scheme. EtaleCohomologyFoundations §§F.0.A0–F.0.A2 supply the field
and multiplicative-group identifications,
arithmetic sequence, decomposition and inertia. This layer builds trace formulas and finite Galois
algebras (torsors that need not be fields) with the
idempotent description of maps out of a finite étale algebra, and then leaves finite covers in two
directions: towards integral, isogeny and rational `ℤ_p`-local systems, whose topology differs
from that of finite covers, and towards Noohi groups and the pro-étale fundamental group of Bhatt
and Scholze, which classifies locally constant sheaves with infinite fibres and torsors under
non-compact `p`-adic groups.

Conventions particular to this layer. Finite étale covers are covariant on geometric fibres and
contravariant on algebras: on `Spec R` the category of finite étale covers is the opposite of
Mathlib's `CommAlgCat.FiniteEtale R`. An étale path from `x̄` to `ȳ` is a natural isomorphism of
fibre functors, and transport along a path acts by conjugation, so changing the path changes the
transported homomorphism by an inner automorphism. The pro-étale fundamental group is a Noohi
group; it is not in general an inverse limit of discrete groups, and it agrees with `π₁^ét` only
under a unibranch hypothesis.

### IG.0.T1 Weil's curve trace and graph–diagonal formula

**Weil's curve trace and graph–diagonal formula.** `VanishingCycles.curveEndomorphismTrace`.
For smooth proper geometrically connected `C/k`, `ℓ` invertible in `k` and `φ:C→C`, prove
`Δ_C·Γ_φ = 1 − Tr_alg(φ_* on J_C) + deg φ`, with constant maps of degree zero and the induced
Jacobian map included. Prove the finite-level geometric comparison
`H¹(C_k̄,ℤ/ℓⁿ) ≅ Hom(J_C[ℓⁿ](k̄),ℤ/ℓⁿ)`, with a chosen separable closure `k̄`,
supplied Tate coordinate, pullback/pushforward orientation and all reductions.
Identify isolated fixed-point intersection multiplicities. Over finite `k`, `q`-power scheme
Frobenius and its deck-twisted forms have transverse fixed points and yield the finite-level
curve trace. The identity endomorphism uses the diagonal's self-intersection rather than
a sum over finitely many fixed points. Derive rational `H¹` comparison using EtaleCohomologyFoundations §F.4.
(Stacks §64.14; SGA 4½, curve/Jacobian trace argument.)
*Needs:* JacobianChallenge Layers A–D; SchemeAndStackFoundations §§2.11, 2.16, 5.6, 5.9;
AbelianSchemesAndArithmeticModuli §§A3.2, A4.1, A6.10–A6.11 (torsion, `AbelianTate`, `End.trace`,
`charpolyTate`); EtaleCohomologyFoundations §§F.10.1–F.10.3
(frobeniusFixedPoints, finite-level frobeniusCohomology and projective trace algebra). The finite curve proof uses finite coefficients and algebraic Jacobian traces.

**Checks.**

- `ℙ¹` has `H¹=0` and graph intersection `1+deg φ`.
- A nonidentity translation of an elliptic curve has fixed-point intersection zero.
- Frobenius on a genus-`g` curve gives `1−Tr(H¹)+q`.

### IG.0.T2 Finite-coefficient Grothendieck–Lefschetz

**Finite-coefficient Grothendieck–Lefschetz.** `VanishingCycles.etaleTraceFormulaFinite`.
For separated finite-type `X/k`, `k` finite of characteristic `p` and cardinality `q`, finite
commutative `Λ` of order prime to `p` and `K∈Dᵇ_ctf(X,Λ)` descended over `k`, prove for every `r≥1`

`Σ_(x∈X(k_r)) L(Frob_(qʳ,x),K_x̄) = L(Frob_qʳ,RΓc(X_k̄,K))`.

Both terms are perfect-complex traces; stalk perfectness follows from ctf and global
perfectness from EtaleCohomologyFoundations §F.3. A local term at a `k_r`-point already uses geometric `qʳ`-Frobenius,
without another `r`-th power. Prove zero-dimensional and finite étale cases by permutation
trace, including nilpotents via étale invariance. Give enhanced open–closed devissage and
the dimension-one proof: reduce to smooth affine curves and finite lisse projective-stalk
coefficients over primary rings, trivialize on finite étale Galois covers, compactify and
apply freeTorsorEquivariantPerfectness and freeTorsorCoefficientDescent to obtain
the group-ring-perfect representatives, then curveEndomorphismTrace and the
group-ring/centralizer identities. In higher dimension
use Noether normalization `U→𝔸ᵈ` followed by `𝔸ᵈ→𝔸^(d−1)`; prove the fibre dimension bound `≤1`,
induct on the base and establish the reusable `Rf!` Fubini identity for local terms.
Include pushforward, coefficient maps, twists/tensor, products/Künneth, finite groups and
finite-field extensions. (Stacks §§64.16–64.17, with §64.14 for curves; SGA 4½ [Sommes trig.].)
*Needs:* EtaleCohomologyFoundations §§F.0–F.3, G.1–G.3, 0.7–0.8
(finite coefficients, compactifications and lower shriek), §§F.10.1–F.10.2
(finite-level frobeniusFixedPoints and frobeniusCohomology); EtaleCohomologyFoundations §F.10.3 PerfectComplex trace/additivity;
§IG.0.T1 / curveEndomorphismTrace; EtaleCohomologyFoundations §§F.10.4–F.10.5 /
freeTorsorEquivariantPerfectness and freeTorsorCoefficientDescent;
SchemeAndStackFoundations Noether normalization and dimension
lemmas, building any missing fibre-dimension steps here. The geometric proof uses finite coefficients.

**Checks.**

- A rational point contributes its own geometric stalk trace.
- A finite étale permutation sheaf gives the permutation fixed-point trace.
- Extension to `k_r` uses matching `r`-th powers in every local and global term.

### IG.0.T3 Rational constructible trace formula for all powers

**Rational constructible trace formula for all powers.** `VanishingCycles.etaleTraceFormula`.
For separated finite-type `X/k` with `k` finite of cardinality `q`, `ℓ≠char k`, `K` in EtaleCohomologyFoundations §F.4's rational
bounded constructible category with descent data, and every `r≥1`, prove

`Σ_i (−1)ⁱ Tr(Frob_qʳ | Hⁱc(X_k̄,K)) = Σ_(x∈X(k_r)) Σ_j (−1)ʲ Tr(Frob_(qʳ,x) | Hʲ(K_x̄))`.

Include finite coefficient-field extensions `E/ℚ_ℓ`. Derive the equation from the finite-level
theorem by normalized realization and scalar extension, using finite-dimensionality;
retain coefficient, tensor/twist, group, base-extension and lower-shriek compatibilities.
(SGA 4½ [Rapport], [Sommes trig.]; finite-level trace and flat scalar extension.)
*Needs:* §IG.0.T2 / etaleTraceFormulaFinite; EtaleCohomologyFoundations §F.10.2b /
frobeniusCohomology and §F.4 / classicalAdicRealization,
adicFiniteness, rationalAdicRealization, adicFunctoriality. No new geometric proof is required.

**Checks.**

- `ℙ¹` gives `1+qʳ`.
- `𝔸¹` has only compact-support degree two and gives `qʳ`.
- A nonconstant finite-monodromy coefficient contributes its local traces, not merely a point count.

### IG.0.T4 Constant-sheaf point count for every finite extension

**Constant-sheaf point count for every finite extension.** `VanishingCycles.pointCountTrace`.
For every separated finite-type `X/k` with `k` finite of cardinality `q`, `ℓ≠char k` and `r≥1`, prove

`#X(k_r) = Σ_i (−1)ⁱ Tr(Frob_qʳ | Hⁱc(X_k̄,ℚ_ℓ))`,

with the natural-number count embedded in `ℚ_ℓ`. The finite point type is that of
EtaleCohomologyFoundations §F.10.1 / frobeniusFixedPoints and each constant stalk contributes one. Give finite and integral
versions using perfect-complex trace, with the count mapped to the coefficient ring.
Compute `𝔸ⁿ`, `𝔾_m` and `ℙⁿ` independently: use the supplied projective-bundle/hyperplane class
formula and its Tate orientation, localization and compact Künneth, then compare their
traces to independently counted points. (SGA 4½ [Rapport] point-count corollary;
SGA 5 VII projective-space computation.)
*Needs:* EtaleCohomologyFoundations §F.10.1 / frobeniusFixedPoints;
§§IG.0.T2–IG.0.T3 / etaleTraceFormulaFinite, etaleTraceFormula; EtaleCohomologyFoundations §F.0 twists,
EtaleCohomologyFoundations §§F.2–F.3 compact cohomology/Künneth; EtaleCohomologyFoundations §0.9 / cycleClasses.

**Checks.**

- `𝔸ⁿ` gives `q^(nr)`.
- `𝔾_m` gives `qʳ−1`.
- `ℙⁿ` gives `1+qʳ+⋯+q^(nr)`.

### IG.0.2 Galois algebras

**Finite Galois algebras and torsors.** Let `K` be a field and `H` a finite group. An `H`-Galois
algebra over `K` is a **nonzero** finite étale `K`-algebra `A` with an action of `H` by `K`-algebra
automorphisms such that `Spec A` is an `H`-torsor, that is, its geometric fibre is a nonempty set on
which `H` acts freely and transitively. `A` need not be a field and may be disconnected. Equivalently,
`A ≠ 0` and the map

```text
A ⊗_K A → ∏_{h ∈ H} A,      a ⊗ b ↦ (a · h(b))_h
```

is an isomorphism of `K`-algebras. Fix once and for all that `H` acts on `A` on the left, so that it
acts on the set of points `Hom_K(A, K^sep)` on the right; every statement below is written in this
convention. Supplied by AdicEtaleGeometry §A4.2: the generic tensor map and finite étale
torsor class. The displayed map is the restriction of scalars to `K` of `Algebra.galoisTensorMap H K A`,
which `Algebra.galoisTensorMap_restrictScalars` identifies with the pure-tensor formula.
For finite `H`, an `H`-Galois algebra is exactly an `Algebra.IsFiniteEtaleTorsor H K A`.
Prove the field criterion, the specialization of
`Algebra.IsFiniteEtaleTorsor.iff_field`: `A` is an `H`-Galois algebra if and only if `A` is
nontrivial, finite and étale over `K`, and the displayed map is bijective.
Over a field, nonzero modules are free and faithfully flat, while faithful flatness forces
`K → A` to be injective, so the shared class has exactly this nonzero finite-étale formulation
([Stacks, Tag 00HQ](https://stacks.math.columbia.edu/tag/00HQ)).
Construct the split
algebra, the function algebra `K^H = Map(H, K)` with the translation action, and prove that it is an
`H`-Galois algebra. Prove that for a nonzero finite étale `K`-algebra with `H`-action the
displayed map is an isomorphism exactly when the torsor condition holds; that
for `N` normal in `H`, the invariants `A^N` form an `H/N`-Galois algebra, and `A^H = K`; and
that isomorphism classes of `H`-Galois algebras correspond to continuous
homomorphisms `Gal(K^sep/K) → H` up to conjugation in `H`, and the fields among them correspond to
the surjective homomorphisms. *Proof sketch.* Test the torsor condition after base change to
`K^sep`, where a finite étale algebra is a product of copies of `K^sep` and its points form a finite
set; compute the displayed map on the split algebra and descend; invariants under `N` correspond to
orbit sets of `N`. Source: [Merkurjev–Scavia](https://arxiv.org/pdf/2410.12560v1), §1.2, pp. 1–2,
and Lemma 3.2, pp. 8–9, where lifts of Galois representations are read as Galois algebras that need
not be fields. *Needs:* Supplied by AdicEtaleGeometry §A4.2 / `Algebra.galoisTensorMap`,
`Algebra.galoisTensorMap_restrictScalars`, `Algebra.IsFiniteEtaleTorsor`,
`Algebra.IsFiniteEtaleTorsor.iff_field`; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; Mathlib `CommAlgCat.FiniteEtale`;
SchemeAndStackFoundations Layer 1 (descent).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- `K^H` with the translation action is an `H`-Galois algebra for every finite `H`, including
  `|H| > 1`, although it is not a field; a definition demanding a field would reject it.
- A separable quadratic extension `L/K` with its nontrivial automorphism is a `C₂`-Galois algebra,
  and corresponds to a surjective homomorphism `Gal(K^sep/K) → C₂`.
- The trivial homomorphism `Gal(K^sep/K) → C₂` corresponds to `K × K` with the swap action, not to a
  quadratic field: weak solutions of lifting problems are Galois algebras, not realizations.
- `𝔽₂ × 𝔽₂` with the swap action is a `C₂`-Galois algebra: both the shared torsor class and
  the field criterion accept it, although the characteristic divides the group order.
- The zero algebra: its displayed tensor map is the isomorphism `0 → 0`, but its geometric fibre is
  empty, so it is not an `H`-Galois algebra; a definition that only asked for the tensor criterion
  without `A ≠ 0` would accept it.

**Idempotents representing maps out of a finite étale algebra.** Let `R` be a commutative ring, `A`
a finite étale `R`-algebra and `B` any commutative `R`-algebra. Then `R`-algebra maps `A → B`
correspond naturally in `B` to the idempotents `e ∈ A ⊗_R B` for which the composite
`B → A ⊗_R B → e(A ⊗_R B)` is an isomorphism; the map attached to such an `e` is
`a ↦ e(a ⊗ 1)` read in `e(A ⊗_R B) ≅ B`. The set of all idempotents of `A ⊗_R B` is larger: it
parametrises the open and closed summands of `Spec(A ⊗_R B)`, and only the summands mapping
isomorphically to `Spec B` come from maps. This gives the representability of the functor
`B ↦ Hom_R(A, B)` that underlies the affine description of finite étale covers and of the torsor
map above. *Proof sketch.* After an étale cover of `Spec R` splitting `A` into a finite product of
copies of the base, a map selects locally one factor; glue the selected rank-one summand and descend
the idempotent and the isomorphism. Source: [Kedlaya–Liu, *Relative `p`-adic Hodge theory:
foundations*](https://arxiv.org/pdf/1301.0792v5), Definition 1.2.2 and Lemma 1.2.3, PDF p. 13.
*Needs:* *Finite Galois algebras and torsors*; Mathlib `Algebra.Etale`, `Module.Finite`;
SchemeAndStackFoundations Layer 1.

**Checks.**

- For a nonzero ring `R`, with `A = R × R` and `B = R`, the two idempotents `(1,0) ⊗ 1` and `(0,1) ⊗ 1` select the two
  projections; the idempotent `1` is not of this form, since `A ⊗_R B = R × R` has rank two over `B`.
- For `A = R` the only representing idempotent is `1`, giving the unique map `R → B`.
- For `R = B = ℤ × ℤ` and `A = R × R`, the idempotent `((1,0),(0,1))` chooses different
  factors on the two components of `Spec R`. It represents a map `A → B` that is neither global
  projection.
- For the zero ring `R = B`, `A = R × R` is zero and `1 = 0` represents its unique map.

### IG.0.3 Local systems

**Integral local systems have finite monodromy.** Let `X` be a connected, normal, locally Noetherian
scheme with geometric point `x̄`, and `L` an étale locally constant sheaf of free `ℤ`-modules of
finite rank `r`. Its monodromy representation `π₁^ét(X, x̄) → GL_r(ℤ)` has finite image. Moreover
the finite orbit of one frame of `L_x̄` under the image defines a connected finite étale cover
`Y → X` over which `L` becomes constant; the whole sheaf of frames is in general an infinite étale
cover, and only the orbit is finite. On a normal base, locally constant sheaves of sets correspond
to continuous actions of `π₁^ét` on discrete sets, which is why normality is assumed. In the
application of Schröer this is applied in rank ten to the local system of numerical classes of
divisors in a family of Enriques surfaces. *Proof sketch.* Normality makes `L` a continuous
`π₁^ét`-module with discrete underlying group `ℤ^r`; the image of a compact group in the discrete
group `GL_r(ℤ)` is finite. The stabiliser of a frame is the intersection of the stabilisers of its
finitely many basis vectors, hence is open; the corresponding pointed cover trivialises `L`. Sources:
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé V, §7, for the fundamental-group correspondence;
[Stacks, Lemma 59.65.2 (0GIY)](https://stacks.math.columbia.edu/tag/0GIY), for finite-type locally
constant modules on an irreducible geometrically unibranch scheme (a connected normal locally
Noetherian scheme is integral). Finiteness of the image follows from the open-stabiliser argument
above. [Schröer](https://arxiv.org/pdf/2004.07025v3), Proposition 5.5, PDF p. 15, is the rank-ten
application.
*Needs:* Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; SchemeAndStackFoundations Layer 2.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- The constant system `ℤ^r` has trivial monodromy.
- On `Spec ℤ`, the rank-ten numerical divisor local system in Schröer's Enriques-family
  application is constant, since Minkowski's theorem gives `π₁^ét(Spec ℤ) = 1`.
- Normality cannot be dropped. On the nodal rational curve over an algebraically closed field, glue
  the constant sheaf `ℤ²` on the normalisation `ℙ¹` along the two points over the node by the matrix
  `[[1, 1], [0, 1]]`: the result is an étale locally constant sheaf of free `ℤ`-modules of rank two
  whose monodromy group `⟨[[1, 1], [0, 1]]⟩ ≅ ℤ` is infinite, and no continuous action of the
  profinite group `π₁^ét` on the discrete `ℤ²` produces it.

**Integral, isogeny and rational `ℤ_p`-local systems.** Let `X` be a scheme and `p` a prime; `p` need
not be invertible on `X`. A `ℤ_p`-local system `T` is a sequence of étale sheaves `T_n` of finite
locally free `ℤ/p^n`-modules with isomorphisms `T_{n+1}/p^n ≅ T_n`; write `ℤ_p-Loc(X)` for their
category. The isogeny category `ℤ_p-ILoc(X)` has the same objects and morphism groups
`Hom(T, T') ⊗_{ℤ_p} ℚ_p`. The category `ℚ_p-Loc(X)` of rational local systems is the étale
stackification of the prestack `U ↦ ℤ_p-ILoc(U)`, so a rational local system has integral lattices
locally on `X` that need not glue to a global one. Tensor products, pullbacks and actions of finite
extensions of `ℚ_p` are defined levelwise and by descent. Define the three categories
`ℤ_p-Loc(X)`, `ℤ_p-ILoc(X)` and `ℚ_p-Loc(X)`, and prove that reduction
modulo `p^n` is finite locally free and carries the given transition isomorphisms;
that pullback commutes with every reduction and with tensor products;
that morphisms in the isogeny category are integral morphisms tensored with
`ℚ_p`, with bilinear composition; and that étale descent data in the
isogeny prestack define rational local systems, and, for connected `X`, the canonical functor from
the isogeny category is fully faithful. Connectedness is a hypothesis of the full faithfulness only:
the definitions are made for every scheme, and on a scheme with infinitely many connected components
a locally integral morphism need not have a uniform denominator. *Proof sketch.* Build the category
of compatible reductions from finite locally free module sheaves and inverse systems; invert `p` in
morphism groups; stackify for the étale topology and prove the reduction, tensor and pullback
compatibilities. For full faithfulness on connected `X`, a morphism `T[1/p] → T′[1/p]` of rational
local systems is a global section of the stackified `Hom(T, T′)[1/p]`; its value at `x̄` has a
denominator `p^N`, and the locus where `p^N` times the section is integral is open and closed, hence
everything. Source: [Kedlaya–Liu,
*Relative `p`-adic Hodge theory: foundations*](https://arxiv.org/pdf/1301.0792v5), Definition 1.4.1
and Remarks 1.4.2–1.4.4 and 1.4.12, PDF pp. 20–23. *Needs:* Supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`;
SchemeAndStackFoundations Layers 1 and 2. This differs from the constructible `ℤ_ℓ`-systems of
Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.normalizedAdicSystems` in
that `p` is not assumed invertible and the objects are lisse sheaves
of modules, not complexes.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.
The adic inputs require invertible `ℓ`, coherent derived reductions and uniform cohomological/Tor
bounds; the integral-to-rational passage retains the whole finite-level tower.

**Checks.**

- The constant tower `((ℤ/p^n)^r)_n` with the reduction maps is a `ℤ_p`-local system of rank `r`.
- A tower whose terms have unrelated ranks, for example `T_1 = ℤ/p` and `T_2 = (ℤ/p²)²`, admits no
  isomorphism `T_2/p ≅ T_1` and is not a `ℤ_p`-local system.
- On two copies of `ℙ¹` glued at two points, gluing trivial rank-one systems with transition `1` at
  one node and `p` at the other gives a rational local system with no global integral lattice; a
  definition of `ℚ_p-Loc` as the isogeny category itself would not contain it.
- Connectedness cannot be dropped from full faithfulness. On `X = ⨿_{n ≥ 0} Spec k`, which is locally
  Noetherian, the constant rank-one system has isogeny endomorphisms `(∏_n ℤ_p)[1/p]`, while its
  rational endomorphisms are `∏_n ℚ_p`; the componentwise endomorphism `(p^{−n})_n` is locally
  integral up to a power of `p` but has no uniform denominator, so it is not in the image.

**Comparison with the lisse part of the `ℓ`-adic realization.** Let `X` be a connected Noetherian
scheme on which the prime `p` is invertible. Sending `T = (T_n)` in `ℤ_p-Loc(X)` to the same inverse
system, viewed as a `ℤ_p`-adic object of EtaleCohomologyFoundations §F.4 /
`VanishingCycles.normalizedAdicSystems` with `ℓ = p` concentrated in degree
zero, is fully faithful onto its lisse degree-zero objects with finite free stalks, and is compatible
with the reductions `T ⊗ ℤ/p^n ↦ T_n`, with pullback, with tensor products and with stalks at
geometric points. It induces a fully faithful functor from `ℤ_p-ILoc(X)` to the rational objects of
EtaleCohomologyFoundations §F.4 / `VanishingCycles.rationalAdicRealization`, with essential
image the rational lisse degree-zero objects admitting a global lisse finite free `ℤ_p` lattice.
The supplied rational category also contains lisse objects whose integral models are constructible
but not lisse. A comparison for the whole stackified category `ℚ_p-Loc(X)`, which can be strictly
larger than `ℤ_p-ILoc(X)` on nonnormal `X`, is outside this target's scope. The finite levels `T_n`
are the finite locally free `ℤ/p^n`-sheaves of EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory` in both theories; the towers
of this layer, their isogeny and rational versions, and the case where `p` is not invertible on `X`
are owned here, and the derived adic category and its constructible objects are supplied by
EtaleCohomologyFoundations §F.4 / `VanishingCycles.normalizedAdicSystems`,
`VanishingCycles.classicalAdicRealization`. *Proof sketch.* For `p` invertible both sides are
inverse systems of finite
locally free `ℤ/p^n`-sheaves with the reduction isomorphisms; on such systems the normalization of
adic objects is the identity, so the comparison is the inclusion of a full subcategory; reductions,
pullback and tensor products are computed levelwise on both sides, and stalks are inverse limits of
the stalks of the `T_n`. Inverting `p` in the morphisms gives full faithfulness for the isogeny
category; a global lisse integral lattice gives a compatible tower of finite free reductions,
which identifies the essential image. Sources: [Kedlaya–Liu, *Relative `p`-adic Hodge theory:
foundations*](https://arxiv.org/pdf/1301.0792v5), Definition 1.4.1 and Remark 1.4.4, PDF pp. 20–21,
which identify lisse `ℤ_p`-sheaves with these inverse systems and refer to SGA 5, Exposé VI, §1.2.4,
for the classical adic formalism; [Bhatt–Scholze, *The pro-étale topology for
schemes*](https://arxiv.org/pdf/1309.1198v2), Lemma 6.8.13 and Proposition 6.8.14, for constructible
integral models and the full rational constructible category.
*Needs:* *Integral, isogeny and rational `ℤ_p`-local systems*;
Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`;
Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.normalizedAdicSystems`.
The rational category is supplied by its §F.4 / `VanishingCycles.rationalAdicRealization`.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.
The adic inputs require invertible `ℓ`, coherent derived reductions and uniform cohomological/Tor
bounds; the integral-to-rational passage retains the whole finite-level tower.

**Checks.**

- The constant tower `((ℤ/p^n)^r)_n` goes to the constant lisse sheaf `ℤ_p^r` in degree zero, with stalk
  `ℤ_p^r` at every geometric point.
- On `𝔾_m` over an algebraically closed field of characteristic other than `p`, the rank-one systems
  with monodromy `u` and `u′ ∈ ℤ_p^×` around the puncture have tensor product the system with monodromy
  `uu′` on both sides, so the comparison respects tensor products.
- Outside the common range nothing is compared. Over `𝔽_p`, the Artin–Schreier–Witt tower of
  `𝔸¹` defined by `F(y) − y = (x, 0, 0, …)` in Witt vectors is a `ℤ_p`-torsor, not a linear local
  system: its monodromy is a continuous surjection `θ : π₁^ét(𝔸¹_{𝔽_p}) → ℤ_p` acting on each level
  `ℤ/p^n` by translations, and a nonzero translation moves `0`, so it is not a module automorphism.
  Composing `θ` with the continuous injective character `ψ(a) = (1 + p)^a` (`p` odd) or
  `ψ(a) = 5^a` (`p = 2`) of `ℤ_p` into `ℤ_p^×` gives a rank-one `ℤ_p`-local system of this layer,
  with `p` equal to the characteristic: its level `n` is
  `ℤ/p^n` with `π₁^ét` acting through `ψ ∘ θ` modulo `p^n`, these reductions are compatible, and its
  monodromy `ψ(ℤ_p)` (`1 + pℤ_p`, resp. `1 + 4ℤ_2`) is infinite.
- On the nodal rational curve `ℙ¹/(0 ∼ ∞)` over an algebraically closed field of characteristic
  different from `p`, the rational line with loop monodromy `p` is lisse and has a constructible
  integral model in `VanishingCycles.rationalAdicRealization`. It has no global lisse integral
  lattice, since `p · p^a ℤ_p = p^{a+1} ℤ_p ≠ p^a ℤ_p` for every integer `a`, and hence lies outside
  the essential image of `ℤ_p-ILoc(X)` under this comparison.

**Representations and bounded lattice schemes.** Let `X` be connected with geometric point `x̄`.
Taking the fibre at `x̄` gives a tensor equivalence between `ℤ_p-Loc(X)` and continuous
representations of `π₁^ét(X, x̄)` on finite free `ℤ_p`-modules, and between `ℤ_p-ILoc(X)` and
continuous representations on finite-dimensional `ℚ_p`-vector spaces. The representation carrier
is `ContinuousRep` of EtaleCohomologyFoundations §F.4.0, and the stable lattice of a representation
with compact image is its `ContinuousRep.exists_stable_lattice_iff`, with integral models
`GaloisLattice.IntegralModel` on Mathlib's `Submodule.IsLattice`; no second carrier is built here. For `T ∈ ℤ_p-Loc(X)` and `m ≥ 0`, the lattices between `p^m T` and
`p^{−m} T` are parametrised by a finite étale `X`-scheme `L_m(T)`; an incidence subscheme of
`L_m(T) ×_X L_m(T)` records inclusion, and finite sums give a canonical join. Using the join,
effective descent holds for isogeny local systems along a faithfully flat finite étale ring map, and
for a normal Noetherian `X` the functor from the isogeny category to rational local systems is an
equivalence. Define the lattice scheme `L_m(T)` and prove the equivalence with
continuous representations, identifying fibre representations and all morphisms; base change
`L_m(T_Y) = L_m(T) ×_X Y`; that the incidence locus is finite étale and
represents inclusion of the two parametrised lattices; and that the join of a finite
family is the least lattice containing each member. *Proof sketch.* Apply the classification of
finite étale covers level by level, and take stable lattices of compact-image representations from
EtaleCohomologyFoundations §F.4.0. Reduce `L_m` to a finite Grassmannian of submodules of
`p^{−m}T/p^m T` and build the incidence scheme after trivialising modulo `p^{4m}`. For descent, join
the finitely many translated lattices to make the descent datum integral; one closure step
stabilises locally and descends. Source: [Kedlaya–Liu, *Relative `p`-adic Hodge theory:
foundations*](https://arxiv.org/pdf/1301.0792v5), Remark 1.4.4, Examples 1.4.5–1.4.6, Remark 1.4.7,
Lemma 1.4.8 and Remark 1.4.9, pp. 21–23; the localisation in their argument is of the base ring only, since a finite étale
covering ring may be semilocal. *Needs:* *Integral, isogeny and rational `ℤ_p`-local systems*;
Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`;
Supplied by EtaleCohomologyFoundations §F.4.0 / `ContinuousRep`,
`ContinuousRep.exists_stable_lattice_iff`, `GaloisLattice.IntegralModel`.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- For the trivial rank-one system, `L_m` has `2m + 1` geometric points, the lattices `p^a ℤ_p` with
  `−m ≤ a ≤ m`, one for each submodule of `p^{−m}T/p^mT ≅ ℤ/p^{2m}`; a parametrisation by the free
  submodules of that quotient would see only the two extreme lattices `p^{±m}ℤ_p`.
- `L_0(T)` is the identity cover `X → X`.
- The nodal rational local system of the previous target is locally in the isogeny category but not
  globally, so the equivalence with rational local systems genuinely needs `X` normal.

### IG.0.4 Noohi groups and the pro-étale fundamental group

**Noohi groups and infinite Galois categories.** A Hausdorff topological group `G` whose open
subgroups form a basis of neighbourhoods of `1` is a Noohi group if the canonical map
`G → Aut(F_G)` is a homeomorphism, where `F_G` is the forgetful functor from discrete sets with
continuous `G`-action to sets and `Aut(F_G)` carries the topology of pointwise stabilisers. An
infinite Galois category is a category with all colimits and finite limits in which every object is
a disjoint union of connected objects, with a set of connected generators, and with a faithful
conservative fibre functor to sets preserving colimits and finite limits. It is tame if `Aut(F)` acts
transitively on the fibre of every connected object. For a tame infinite Galois category `(C, F)`,
`Aut(F)` is a Noohi group and `F` induces an equivalence of `C` with continuous `Aut(F)`-sets.
Define Noohi groups and infinite Galois categories, and prove that the reconstruction map
is an isomorphism of topological groups; that fibres of
connected objects are transitive exactly under tameness; that
for a tame category the fibre functor identifies it with continuous discrete actions; and
that an open subgroup of a Noohi group is Noohi. *Proof sketch.* Topologise
the natural automorphisms by pointwise stabilisers, identify stabilisers of points of fibres with
open subgroups, and prove reconstruction from connected generators and tameness. For the
open-subgroup assertion, use Proposition 7.1.5: an open subgroup is closed, so it is complete
for the induced two-sided uniformity, and its open subgroups still give a neighbourhood basis. Source:
[Bhatt–Scholze, *The pro-étale topology for schemes*](https://arxiv.org/pdf/1309.1198v2),
Definitions 7.1.1, 7.2.1 and 7.2.4, Proposition 7.1.5 and Theorem 7.2.5, PDF pp. 63–66;
Lemma 7.1.8 gives the converse, from an open Noohi subgroup to its ambient group. Tameness here is
a categorical condition and has nothing to do with tame ramification. *Needs:* Mathlib
`CategoryTheory.PreGaloisCategory.FiberFunctor` (the finite theory it generalises),
`IsTopologicalGroup`, `OpenSubgroup`; SchemeAndStackFoundations Layer 2.

**Checks.**

- Every profinite group is Noohi: the finite Galois category of finite continuous sets already
  reconstructs it.
- Every discrete group is Noohi; `ℤ` with the discrete topology is Noohi but not profinite, so a
  definition requiring compactness would exclude it.
- In discrete `ℤ`-sets the connected object `ℤ/2ℤ` has a two-point fibre on which the reconstructed
  group acts transitively and nontrivially; a reconstruction giving this fibre the trivial action
  fails tameness.

**Pro-étale fundamental groups and torsors.** Let `X` be a connected, locally topologically Noetherian
scheme with geometric point `x̄`. The category `Loc(X_proét)` of locally constant sheaves of sets on
the pro-étale site, with the stalk at `x̄`, is a tame infinite Galois category. Define
`π₁^proét(X, x̄)` as the automorphism group of this stalk functor with the pointwise topology; it is
a Noohi group and `Loc(X_proét)` is equivalent to continuous `π₁^proét(X, x̄)`-sets. Its profinite
completion is `π₁^ét(X, x̄)`, and if `X` is geometrically unibranch the map `π₁^proét → π₁^ét` is
already an isomorphism. Let `H` be a Hausdorff topological group with an open profinite subgroup
`U` (so `H` is Noohi by Lemma 7.1.8). The groupoid of pro-étale `H`-torsors, for the sheaf of
continuous maps to `H`, is equivalent to the groupoid of continuous homomorphisms
`π₁^proét(X, x̄) → H` with arrows given by conjugation in `H`. This applies to `H = GL_r(E)` for a
finite extension `E/ℚ_p`, to its closed subgroups, and to the groups `J_b(ℚ_p)` of Caraiani–Scholze;
profinite and discrete groups are included. A closed subgroup of `GL_r(E)` has the open profinite
subgroup obtained by intersection with `GL_r(𝒪_E)`. Define
`π₁^proét(X, x̄)` and prove the equivalence with continuous actions, compatible
with stalks; the comparison with the étale fundamental group, inducing the profinite completion and
agreeing on finite continuous actions; the equivalence
`Hom_cont(π₁^proét, H)//H ≃ H-torsors` for `H` with an open profinite subgroup, including all
conjugation arrows; and
functoriality, continuous homomorphisms induced by pointed maps, with change of
base point up to inner automorphisms. *Proof sketch.* Use the category `Cov(X)` of étale `X`-schemes
satisfying the valuative criterion of properness, whose fibres may be infinite, to verify the
axioms and tameness; apply the reconstruction theorem; restrict to finite actions for the profinite
completion; on a geometrically unibranch base a connected object of `Cov(X)` is finite étale.
For torsors, build the open-profinite-subgroup reduction as part of this target: given a
homomorphism `ρ`, pass to the pointed geometric covering for `ρ⁻¹(U)`, classify the resulting
`U`-torsor by Lemma 7.4.3, extend its structure group to `H`, and descend along the covering.
Conversely an `H`-torsor pushes out each discrete continuous `H`-set to a local system; the
fibre functor and Noohi reconstruction recover `ρ`. The two constructions are inverse on
objects and conjugation arrows, by the same descent argument as Lemma 7.4.7. Sources:
[Bhatt–Scholze, *The pro-étale topology for schemes*](https://arxiv.org/pdf/1309.1198v2), Lemma 7.3.9, Lemma 7.4.1, Definition 7.4.2 and
Lemmas 7.4.3 and 7.4.6 (profinite and discrete torsors), Lemma 7.4.7 and its proof
(linear groups over a local field), and Lemma 7.4.10, PDF pp. 67–71; the open-profinite-subgroup
form is the reduction above;
[Caraiani–Scholze](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf),
Proposition 1.13, Remarks 1.14 and 4.3.14, pp. 656–657 and 721. *Needs:* *Noohi groups and infinite
Galois categories*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; SchemeAndStackFoundations Layer 2 (pro-étale
site, w-contractible covers); SchemeAndStackFoundations §2.17 / `Proetale.isReplete_proetale` (replete topoi).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- For a connected normal locally Noetherian `X`, which is geometrically unibranch,
  `π₁^proét(X, x̄) → π₁^ét(X, x̄)` is an isomorphism.
- For the nodal rational curve, the loop through the node gives a continuous surjection of
  `π₁^proét` onto the discrete group `ℤ`; the rank-one `ℚ_p`-local system with monodromy `p`
  factors through it and through no finite quotient, so `π₁^ét` alone does not classify it.
- The discrete group `ℤ` has the open profinite subgroup `{0}`; the nodal-curve torsor with
  monodromy onto `ℤ` is included although its image is noncompact.
- An `H`-torsor without a chosen point of its stalk gives a homomorphism only up to conjugation in
  `H`; a chosen point of the stalk removes exactly this ambiguity.

### Examples

- For `X = Spec K`, every finite étale cover is `Spec` of a finite étale `K`-algebra; the
  `C₂`-Galois algebras are `K × K` and the separable quadratic extensions, matching the homomorphisms
  `Gal(K^sep/K) → C₂`.
- For `X = 𝔾_{m,ℂ}`, the Kummer covers `z ↦ z^n` exhaust the connected finite étale covers and
  `π₁^ét = lim μ_n(ℂ) ≅ ẑ`; the rank-one local systems `T_n = ℤ/p^n` with monodromy `u ∈ ℤ_p^×`
  around the puncture give the `ℤ_p`-local systems of rank one.
- The nodal rational curve separates the three notions of this layer: its rational local system
  with monodromy `p` is not isogenous to an integral one, is not classified by `π₁^ét`, and is
  classified by `π₁^proét`.

### Dependencies

On the small étale site, fibre functors, `π₁^ét`, paths and finite-cover monodromy are supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`;
field Galois theory and the finite étale algebras of a field
from Mathlib and ModularCurves Layer 0d; `ẑ` from ProfiniteArithmetic Layer 0 and the punctured-line
conventions from BelyiMaps Layers 12–13. Descent, the étale and pro-étale sites and w-contractible
covers are SchemeAndStackFoundations Layers 1–2, and replete topoi SchemeAndStackFoundations §2.17 / `Proetale.isReplete_proetale`.
The finite-cover contract uses connected nonempty locally Noetherian schemes for based `π₁`, without coefficient invertibility.

## Layer IG.1: arithmetic fundamental groups, inertia and specialization

Over a field that is not separably closed the étale fundamental group remembers the Galois action
on the constants. EtaleCohomologyFoundations §§F.0.A1–F.0.A2 supply the arithmetic exact sequence,
its outer action, and the decomposition and inertia groups of a Galois cover at a point.
This layer builds the tame and prime-to-`p` quotients
of the fundamental group of a curve with the tangential fibre at a boundary point, the Frobenius
normalisation over finite fields, finite étale covers of proper schemes over a henselian local ring,
proper descent of finite étale covers, invariance under extension
of an algebraically closed base field in characteristic zero, and the specialization theorems of
Grothendieck for proper smooth families and for smooth pairs with a relative normal crossings
boundary. It ends with the notion of an arithmetic representation of
a geometric fundamental group and with the fundamental groups of homogeneous spaces with finite
stabilisers, which Layer IG.4 uses.

Conventions particular to this layer. All schemes are locally Noetherian.
Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`:
based `π₁` requires connected nonempty schemes and finite lisse coefficients need no invertibility.
`k̄` is an algebraic closure of `k` and `Γ_k = Gal(k^sep/k)`. Arithmetic
Frobenius over `𝔽_q` is `a ↦ a^q`; geometric Frobenius is its inverse. Inertia conjugation uses the
cyclotomic character `χ`, defined by `σ(ζ) = ζ^{χ(σ)}` for roots of unity `ζ` of order prime to the
characteristic: a lift `σ̃` transports inertia at `P` to inertia at `σ(P)` with factor `χ(σ)`
after the chosen paths. Only the stabilizer of `P` acts on its own inertia conjugacy class. Tame means
tamely ramified along a chosen boundary; when `p` is a characteristic exponent (`p = 1` in
characteristic zero), prime-to-`p` means of order coprime to `p`; the two give
different quotients. Base points are geometric points; changing one changes every induced
homomorphism by an inner automorphism, and only outer actions are independent of the choices.

### IG.1.2 Tame quotients and tangential fibres

**Tame and prime-to-`p` fundamental quotients.** Let `U` be a smooth connected curve over an
algebraically closed field `K` of characteristic exponent `p`, with smooth proper compactification `X`
and boundary `D = X ∖ U`. The tame fundamental group `π₁^t(U)` is the quotient of `π₁^ét(U)` by the
closed normal subgroup generated by the wild inertia groups at the points of `D`; its finite
continuous actions classify the covers of `U` tamely ramified along `D`. The maximal prime-to-`p`
quotient `π₁^{(p′)}(U)` classifies the covers whose Galois closure has degree prime to `p`. They are
different quotients: a tame cover may have monodromy group of order divisible by `p`. The local
tame inertia group at a boundary point, that of the strictly henselian punctured branch, is the
prime-to-`p` Tate module, with no canonical generator; its image in the global group is a quotient of
it and need not be isomorphic to it. In characteristic zero (`p = 1`) both quotients are all of
`π₁^ét(U)`. Define `π₁^t(U)`
and `π₁^{(p′)}(U)`, and prove that the kernel of `π₁^ét(U) → π₁^t(U)` is exactly the
closed normal subgroup generated by wild inertia; that finite
actions of `π₁^t(U)` correspond to covers tamely ramified relative to the compactification;
that every continuous homomorphism to a finite group of order prime to `p`
factors uniquely through the prime-to-`p` quotient; and the peripheral map: for a
boundary point `P` and an étale path from the base point to a geometric point of the punctured
henselian branch at `P`, a continuous homomorphism from the local tame inertia
`lim_{n ≥ 1, gcd(n,p)=1} μ_n(K)` to
`π₁^t(U)`, with the conventions of BelyiMaps Layers 12–13; changing the path conjugates it by an
element of `π₁^t(U)`, and its image is the inertia subgroup at `P`. The limit is taken along the
power maps for divisibility of indices, using the existing `TauCeti.PrimeToPTateModule p K`,
whose indices satisfy `n ≠ 0 ∧ Nat.Coprime n p`. These are exactly the positive integers
invertible in `K`; for `p = 1` every positive index is included. Injectivity is not part of the
statement; it holds, for instance, when `U` is `ℙ¹` minus at least two points, where the composite to
the prime-to-`p` quotient sends a generator to a member of a free basis. *Proof sketch.* The
strictly henselian punctured branch at `P` has residue field `K`, which is infinite, so it is not a
local field; its inertia, wild inertia and tame character come from the henselian-trait package of
EtaleCohomologyFoundations §F.3a, whose surjectivity statement identifies inertia modulo wild
inertia with `∏_{ℓ ≠ p} ℤ_ℓ(1)` over the residue field. The adapter here identifies that product
with `TauCeti.PrimeToPTateModule p K`; the tame quotient description is then translated into the
normalisation condition on covers; describe both global quotients as intersections of kernels of finite quotients and
compare their categories of covers. Sources: [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé
XIII, §§2.1–2.4, pp. 277–285, §§2.10–2.12, pp. 289–290, and Corollary 5.3, p. 316
(the local Kummer tower); [Stacks, Lemma 59.28.1 (03PL)](https://stacks.math.columbia.edu/tag/03PL)
(Kummer theory for invertible indices); [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §5, pp. 8–11. In
positive characteristic the free presentation on loops around the punctures describes only the
prime-to-`p` quotient, not the full tame group. *Needs:* EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; EtaleCohomologyFoundations §F.3a (henselian traits,
inertia, wild inertia and the tame character with its Kummer, surjectivity and conjugation
statements); BelyiMaps Layers 12 and 13.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- On `𝔾_m` in characteristic exponent `p`, the Kummer cover `z ↦ z^n` for `n ≥ 1` with
  `gcd(n,p) = 1` is tame and factors through both quotients.
- Over `ℂ`, with `U = 𝔾_m` and boundary point `0`, the index `2` is included because
  `gcd(2,1) = 1`. The quadratic Kummer cover gives a nontrivial `C₂` inertia quotient at `0`.
- In characteristic `p > 0`, indices `p^r`, `r ≥ 1`, are excluded: the power maps are inseparable
  and do not give finite étale Kummer covers. Every positive index coprime to `p` is included.
- The Artin–Schreier cover `y^p − y = x` is finite étale over `𝔸¹` but wildly ramified at infinity,
  so it is killed in the tame quotient; a definition of "tame" that only looked at `U` would keep it.
- An ordinary elliptic curve `E` in characteristic `p` has an étale cyclic cover of degree `p`: it
  is tame (there is no boundary) but absent from the prime-to-`p` quotient, so the two quotients
  differ.
- For `U = 𝔸¹_ℂ` with boundary `{∞}`, the local tame inertia at `∞` is `ẑ(1)` but `π₁^t(U)` is trivial,
  so the peripheral map has trivial image; identifying the global inertia subgroup with the Tate
  module would be false here.
- For `U = 𝔾_m` over `𝔽̄_p`, the branch at `0` is the henselization of `𝔽̄_p[t]` at `(t)`, whose
  residue field `𝔽̄_p` is infinite, so a theorem about local fields with finite residue field does
  not apply; the henselian-trait tame character still gives local tame inertia
  `∏_{ℓ ≠ p} ℤ_ℓ(1)`, and the same holds for `ℂ((t))` with all primes.

**Tame tangential fibres at a boundary point.** Let `C/k` be a smooth curve, `P` a `k`-rational point
of its smooth compactification outside `C`, and `v` a nonzero tangent vector at `P`. A local
parameter `t` at `P` normalised by `v` identifies the strictly henselian punctured branch at `P`
with its tame Kummer tower `t^{1/n}`, `n` invertible in `k`. The tangential fibre of a finite cover
of `C` that is tamely ramified at `P` is its set of compatible lifts to this tower. Changing the
normalised parameter changes the fibre functor by a canonical isomorphism, so the construction is
independent of `t` up to the path ambiguity of ordinary base points. This gives a fibre functor on
covers tame at `P`, its cyclic inertia (the prime-to-characteristic Tate module) and, when `v` is
`k`-rational, a section of the arithmetic sequence on the tame branch. In positive characteristic it
concerns tame covers only. Define the tame tangential fibre functor at `(P, v)` on
objects, as the lifts into the parameter tower; the natural isomorphism for a
change of normalised parameter; the local inertia with the peripheral
character convention of PeripheralActions; and the arithmetic section
attached to a `k`-rational tangent vector. *Proof sketch.* Use the Kummer classification of tame
covers of a strictly henselian punctured disc with invertible indices; identify the towers for two
normalised parameters by henselian roots of units; verify the fibre-functor axioms by tame descent.
Sources: [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XIII, §§2.1–2.4, pp. 277–285, and
§§2.10–2.12, pp. 289–290; [Wood, *Nonabelian Cohen–Lenstra
moments*](https://par.nsf.gov/servlets/purl/10152050), Definition 3.12 and Theorem 3.13, pp.
394–398. *Needs:* EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*, *Tame and prime-to-`p` fundamental
quotients*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; BelyiMaps Layers 12 and 13.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- For the cover `z^n = t` with `n` invertible, the tangential fibre has `n` elements and inertia acts
  on it by a transitive rotation.
- For the parameter `t' = t(1 + t)`, the henselian `n`-th root of `1 + t` identifies the two Kummer
  fibres, so the construction does not depend on the parameter beyond the tangent vector.
- In characteristic `p` the Artin–Schreier cover `y^p − y = t^{−1}` is wild at `P` and is outside the
  domain of the tangential fibre functor.

**Frobenius and cyclotomic normalisation.** Let `X` be a geometrically connected variety over `𝔽_q`.
The arithmetic quotient of `π₁^ét(X)` is `Γ_{𝔽_q} ≅ ẑ`, topologically generated by arithmetic
Frobenius `a ↦ a^q` (LocalFieldsRamification Layer 2). On the prime-to-`q` Tate module arithmetic
Frobenius acts by multiplication by `q` and geometric Frobenius by `q^{−1}`. For a curve, arithmetic
Frobenius transports local inertia at `P` to that at `Frob_q(P)` with cyclotomic factor `q` after
the chosen paths. For a rational boundary point this is the `q`-power action on its inertia
conjugacy class; over a closed point of degree `f`, `Frob_q^f` stabilizes the geometric point
and has factor `q^f`. Images of local inertia in the global group retain its relations. This one convention is used in every lifting-invariant twist and
component count of Layers IG.3–IG.5. For the punctured projective line it agrees with BelyiMaps
Layer 12 and with PeripheralActions after restriction to the prime-to-`q` part. *Proof sketch.*
Combine the arithmetic exact sequence with the identification of `Γ_{𝔽_q}`; compute the action on
each `μ_n` with `n` prime to `q` and pass to the limit. Source: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), Theorem 5.2 and §6.1,
pp. 10–12, where the inverse cyclotomic action enters the discrete action defining the invariant.
*Needs:* EtaleCohomologyFoundations §F.0.A2 *The arithmetic fundamental-group sequence*, *Tame and prime-to-`p` fundamental quotients*;
LocalFieldsRamification Layers 2 and 4; Supplied by EtaleCohomologyFoundations §F.10.1 /
`VanishingCycles.frobeniusFixedPoints`; BelyiMaps Layers 12 and 13.
Over the chosen finite field and closure, arithmetic Frobenius is `x↦x^q` and geometric Frobenius its
inverse; rational points are the fixed points of their matching powers.

**Checks.**

- At a rational boundary point arithmetic Frobenius conjugates a tame inertia generator `τ` to
  `τ^q`, and geometric Frobenius to `τ^{q^{−1}}`, in the prime-to-`q` units; the opposite assignment would invert every lifting
  invariant of Layer IG.4.
- On `μ_n(𝔽̄_q)` with `n | q − 1` arithmetic Frobenius acts trivially, matching `q ≡ 1 (mod n)`.
- For `ℙ¹_{𝔽₂} − V(T² + T + 1)`, Frobenius exchanges the two geometric punctures. With
  `τ₁τ₂ = 1`, it sends `τ₁` to `τ₂² = τ₁⁻²` on the geometric prime-to-2 group. On its `C₃`
  quotient the action is trivial, whereas the 2-power action on that quotient is nontrivial.
- A boundary point of degree two is stabilized by `Frob_q²`, whose local cyclotomic factor is
  `q²`; the first Frobenius need not preserve either geometric inertia group.

### IG.1.3 Specialization and base extension

**Finite étale covers over a henselian local base.** Let `A` be a Noetherian henselian local ring
with residue field `κ`, `X → Spec A` a proper morphism and `X₀ = X ×_A Spec κ` its closed fibre.
Restriction `U ↦ U ×_X X₀` is an equivalence from finite étale covers of `X` to finite étale covers
of `X₀`. Restriction is base change along `X₀ → X`, so it commutes with pullback along every
`A`-morphism `X′ → X` of proper `A`-schemes; in particular it applies at once to every term `S′`,
`S′ ×_S S′`, `S′ ×_S S′ ×_S S′` of a proper morphism `S′ → S = Spec A`, compatibly with the
projections. `X` is connected exactly when `X₀` is, and then `π₁^ét(X₀, x̄) → π₁^ét(X, x̄)` is an
isomorphism. *Proof sketch.* First let `A` be complete, with maximal ideal `𝔪`, and
`X_n = X ×_A Spec A/𝔪^{n+1}`. Each `X_n → X_{n+1}` is a thickening, so étale schemes over `X₀` and
over `X_n` correspond, and a finite étale cover of `X₀` extends uniquely to a compatible system of
finite étale covers of the `X_n`. Grothendieck's existence theorem algebraizes that system to a
finite `X`-scheme `U`. `U` is étale at the points of `U₀` by the local flatness criterion, and every
point of `U` specializes into `U₀` because `U` is proper over `A`, so `U` is étale. Full faithfulness
follows by applying essential surjectivity to the graph of a morphism of closed fibres, an open and
closed subscheme of a fibre product. If `A` is a G-ring, Popescu desingularization writes the
completion `Â` as a filtered colimit of smooth `A`-algebras `A_j`; a cover over `X ×_A Spec Â`
descends to some `X ×_A Spec A_j`, and lifting the closed point of `Spec A_j` to an `A`-point, by
smoothness over the henselian `A`, gives a cover of `X` with the same closed fibre. In general `A` is
the filtered colimit of the henselizations of local rings of finite-type `ℤ`-algebras, which are
G-rings, `X` descends with its properness to a finite stage, and finite étale covers and their
morphisms descend to a finite stage too. Sources: [Stacks](https://stacks.math.columbia.edu/tag/0A48),
Lemma 58.9.1 (0A48), with its proof; [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé IX,
Theorem 1.10, p. 179 (complete base), and Exposé X, Theorem 2.1, p. 206 (the fundamental-group
form). *Needs:* Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.universalHomeomorphismEtaleEquivalence` (topological invariance of the
small étale site); SchemeAndStackFoundations §0.9 (`finite_presentation_limits`), §0.12
(henselization), §0.14 (`henselian_smooth_lifting`), §0.15 (`popescu_desingularization`), §0.21
(G-rings) and §4.10 (`Formal.grothendieck_existence`, `grothendieck_existence_fullyFaithful`).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.
The étale equivalence applies to every universal homeomorphism without coefficient invertibility.

**Checks.**

- For `X = Spec A` the statement is the henselian property of `A`; for `A = ℤ_p`, the connected
  finite étale `ℤ_p`-algebras are the rings of integers of the unramified extensions of `ℚ_p`, matched
  with the finite extensions of `𝔽_p`.
- Henselian cannot be dropped. `ℤ_(5)[i]` is a domain and is finite étale over `ℤ_(5)` (the
  discriminant `−4` is a unit at `5`), while its closed fibre `𝔽_5[x]/(x² + 1) ≅ 𝔽_5 × 𝔽_5` is split,
  since `2² ≡ −1 (mod 5)`; restriction to the closed fibre does not preserve connectedness. Over the
  henselian `ℤ_5` the root `2` lifts and the algebra splits.
- Properness cannot be dropped. For `A = ℂ[[t]]`, `X = Spec A[1/t] = Spec ℂ((t))` is of finite type
  over `A` with empty closed fibre, and `ℂ((t^{1/2}))` is a connected finite étale cover of degree two.

**Proper descent of finite étale covers.** Let `g : S′ → S` be a proper surjective morphism of
locally Noetherian schemes, `S″ = S′ ×_S S′` and `S‴ = S′ ×_S S′ ×_S S′`. Pullback along `g` is an
equivalence from finite étale covers of `S` to finite étale covers `E′` of `S′` with a descent
datum, an isomorphism `pr₁^*E′ ≅ pr₂^*E′` over `S″` satisfying the cocycle condition over `S‴`, with
the morphisms compatible with the data. Full faithfulness uses only that `g` is surjective and
universally closed; effectivity uses properness. *Proof sketch.* A universally closed surjection is
universally submersive, so an open and closed subscheme of a cover of `S′` that is stable under the
descent datum comes from one over `S`, and morphisms descend through their graphs. This argument
needs no finiteness hypothesis, and every base change of `g` is again universally closed and
surjective, so full faithfulness holds after any base change of `S`. Effectivity takes three
reductions and one computation.

1. Effectivity is Zariski local on `S`, the descended covers gluing by full faithfulness on the
   overlaps.
2. A datum that is effective over `Spec 𝒪_{S,s}` is effective over an open neighbourhood of `s`: the
   descended cover and its isomorphism with `E′` are of finite presentation and spread out, and they
   become compatible with the descent data after shrinking.
3. Effectivity over `Spec 𝒪_{S,s}` may be tested after the faithfully flat base change to the
   completion `Spec 𝒪̂_{S,s}`: a cover descended there carries, by full faithfulness over the
   fibre products of `Spec 𝒪̂_{S,s}` with itself (which are not Noetherian), a faithfully flat
   descent datum, and faithfully flat descent of finite étale covers finishes.
4. Let `S = Spec A` with `A` complete Noetherian local and closed point `S₀`. Then `S′`, `S″` and
   `S‴` are proper over `A`, as base changes and composites of `g`, and restriction to closed fibres
   is base change along `S₀ → S`, so it commutes with `g^*` and with the projections. By *Finite
   étale covers over a henselian local base* it is an equivalence on `S`, `S′` and `S″`. The
   restricted datum on `S′₀ → S₀`, a faithfully flat quasi-compact morphism to the spectrum of a
   field, is effective by faithfully flat descent, with descended cover `E₀`. Lift `E₀` to a cover
   `E` of `S`, lift the isomorphism `E₀ ×_{S₀} S′₀ ≅ E′ ×_{S′} S′₀` uniquely to an isomorphism
   `g^*E ≅ E′`, and check its compatibility with the descent data on the closed fibre of `S″`.

Sources: [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé IX, Theorem 4.12, p. 187, with the
reductions of Corollaries 4.2–4.3, Proposition 4.4 and Corollaries 4.5–4.6, pp. 183–184;
[Stacks](https://stacks.math.columbia.edu/tag/0BTL), Lemma 41.20.3 (0BTL), for full faithfulness,
[Stacks](https://stacks.math.columbia.edu/tag/0BTM), Lemma 41.20.4 (0BTM), for the Zariski
reduction, and [Stacks](https://stacks.math.columbia.edu/tag/0GF0), Lemma 59.104.3 (0GF0), the same
descent for all étale sheaves. *Needs:* *Finite étale covers over a henselian local base*;
Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`;
SchemeAndStackFoundations §0.9 (`finite_presentation_limits`) and §1.1
(`qcoh_fpqc_descent`).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- Let `C = {y² = x²(x + 1)}` over `ℂ` and `g : 𝔸¹ → C`, `t ↦ (t² − 1, t(t² − 1))`, its
  normalization, which identifies `t = 1` with `t = −1`. Then `S″` is the diagonal together with the
  points `(1, −1)` and `(−1, 1)`. Covers of `𝔸¹_ℂ` are trivial with fibre a finite set `F`, and a
  descent datum is a permutation of `F` at `(1, −1)`, the cocycle condition forcing its inverse at
  `(−1, 1)` and the identity on the diagonal. Covers of `C` of degree `m` thus correspond to
  permutations of `m` letters up to conjugacy, and an `m`-cycle gives the connected cover made of `m`
  lines glued in a cycle.
- Properness cannot be dropped. `S′ = 𝔾_{m,ℂ} ⊔ {0} → 𝔸¹_ℂ` is surjective and quasi-compact but not
  universally closed, and `S″` consists of the two diagonal pieces. The connected Kummer cover
  `z² = t` of `𝔾_m` with two points over `0` therefore carries a descent datum, which is not
  effective because every finite étale cover of `𝔸¹_ℂ` is trivial.
- For the finite surjection `Spec ℂ → Spec ℝ`, a descent datum on a finite étale `ℂ`-algebra `A` is
  an involution of `A` that is semilinear for complex conjugation, and the descended `ℝ`-algebra is
  its fixed subalgebra: on `ℂ × ℂ` the involution `(a, b) ↦ (b̄, ā)` gives `ℂ`, and
  `(a, b) ↦ (ā, b̄)` gives `ℝ × ℝ`.

**Specialization for proper smooth families.** Let `R` be a henselian discrete valuation ring with
generic point `η` and closed point `s`, and `X → Spec R` proper and smooth with geometrically
connected fibres. After a choice of geometric points and of the transport between them, geometric
specialization gives a continuous surjection `π₁^ét(X_{η̄}) → π₁^ét(X_{s̄})`. If the residue
characteristic is `p > 0` it induces an isomorphism of maximal prime-to-`p` quotients; if the residue
characteristic is zero it is an isomorphism. Restriction of finite covers agrees with
specialization. No full isomorphism is asserted in mixed or positive residue characteristic.
*Proof sketch.* Extend finite étale covers of the special fibre over `X` by *Finite étale covers
over a henselian local base*; lift prime-to-`p` covers in the other direction using
smoothness, and identify the fibre functors. Source: [SGA 1](https://arxiv.org/pdf/math/0206203v2),
Exposé X, Theorem 3.8 and Corollary 3.9, p. 217, with the proof in §§3.6–3.7, pp. 214–216.
*Needs:* *Finite étale covers over a henselian local base*; Supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- For a proper smooth curve over `k[[t]]` with `k` of characteristic zero, specialization is an
  isomorphism of fundamental groups.
- For an elliptic curve over the completion of `ℤ_p^{ur}` with ordinary reduction, the maximal pro-`p`
  quotient of the geometric generic fundamental group is `ℤ_p²` while that of the special fibre is
  `ℤ_p`; specialization is surjective but not injective, so only the prime-to-`p` isomorphism holds.

**Tame specialization with a relative boundary.** Let `R` be a strictly henselian discrete valuation
ring with residue characteristic exponent `p`, `X → Spec R` smooth and proper with geometrically
connected fibres, `D = D₁ + ⋯ + D_m ⊂ X` a divisor with strict normal crossings relative to `R`
(every nonempty intersection `D_J` of `|J|` components is smooth over `R` of codimension `|J|` in
`X`), and `U = X ∖ D`. Geometric specialization identifies the maximal prime-to-`p` quotients of
`π₁^ét(U_{η̄})` and `π₁^ét(U_{s̄})`; in residue characteristic zero (`p = 1`) every finite cover is
tame and the full groups are identified. Only the prime-to-`p` isomorphism is asserted, not an
isomorphism of tame groups. When `X` is a relative curve, so that `D` is a disjoint union of
sections, the identification matches peripheral inertia at each section after transport of the
common prime-to-`p` Tate module of `R`, and a finite `G`-cover of `U_{η̄}` with `gcd(|G|,p) = 1` specializes
to a `G`-cover with the same inertia orders and the same connectedness. *Proof sketch.* Apply the
tame lifting theorem of SGA 1 to the smooth pair `(X, D)`, which holds in every relative dimension:
prime-to-`p` torsors on `U` are tamely ramified along `D`, so their classifying sheaves are locally
constant and their formation commutes with base change, which makes the specialization maps
bijective. For relative curves compare the local Kummer covers along each section, tracking the
transport of the Tate module and the conjugations. Sources:
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XIII, Theorem 2.4, pp. 282–285, Corollaries
2.8 and 2.9, pp. 288–289, and §§2.10–2.12, pp. 289–290; [Wood, *An algebraic
lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), Theorem 5.2,
p. 10, and Theorem 6.1 with its proof, pp. 11–12. *Needs:* *Tame and prime-to-`p` fundamental
quotients*, *Specialization for proper smooth families*; SchemeAndStackFoundations Layer 3.

**Checks.**

- For `ℙ¹` with three disjoint sections `0, 1, ∞` over `ℤ_p^{ur}`, the prime-to-`p` quotients of both
  fibres are the prime-to-`p` completion of the free group of rank two, with the three inertia
  generators matched.
- If two sections meet in the special fibre the hypotheses fail; the special fibre then has fewer
  punctures and a smaller fundamental group.
- Relative normal crossings is needed in higher dimension too. Over `R = ℂ[[t]]` let `X = ℙ²_R` and
  `D = V(x) + V(y) + V(x − y − tz)`. On the generic fibre the three lines are in general position and
  `U_{η̄} ≅ 𝔾_m²` has abelian group `ẑ(1)²`; on the special fibre they pass through `[0 : 0 : 1]`,
  projection from that point makes `U_s` a line bundle over `ℙ¹` minus three points, and its group is
  the free profinite group of rank two. The triple intersection is empty on one fibre and not on the
  other, so `D` is not strict normal crossings relative to `R`.

**Invariance under algebraically closed base extension in characteristic zero.** Let `k ⊂ k'` be
algebraically closed fields of characteristic zero and `X` a scheme of finite type over `k`.
Pullback is an equivalence from finite étale covers of `X` to finite étale covers of `X_{k'}`; if `X`
is connected, so is `X_{k'}`, and `π₁^ét(X_{k'}, x̄') → π₁^ét(X, x̄)` is an isomorphism. For proper `X`
the same invariance holds in every characteristic; for non-proper `X` in characteristic `p > 0` it
fails, and no statement is made there. *Proof sketch.* For proper `X` use the algebraic proper
invariance theorem. In characteristic zero argue in four steps. (1) Full faithfulness holds for
every finite-type `k`-scheme `Y`: a morphism of finite étale covers is an open and closed subscheme
of their fibre product projecting isomorphically onto the source, and the connected components of a
finite-type scheme over an algebraically closed field do not change under extension of that field.
(2) One transcendental step for a smooth connected affine `Y`: let `K ⊇ k` be algebraically closed,
`t` transcendental over `K` and `Ω` an algebraic closure of `K(t)`, and compactify `Y_K` to a smooth
projective `Ȳ` with strict normal crossings boundary `D`. Let `R` be the henselization of `K[t]` at
`t = 0`, a strictly henselian discrete valuation ring with residue field `K`. Its fraction field is
algebraic over `K(t)`, so a `K(t)`-embedding into `Ω` makes `Spec Ω` a geometric generic point of
`Spec R`. The constant pair `(Ȳ ×_K R, D ×_K R)` is smooth and proper over `R` with geometrically
connected fibres and strict normal crossings relative to `R`. For this constant family the
specialization map `π₁^ét(Y_Ω) → π₁^ét(Y_K)` is the map induced by base change along
`Y_Ω → Y_K`, because the closed fibre `Y_K → Y_K ×_K R` is a section of the projection. Tame
specialization in residue characteristic zero makes it an isomorphism, so pullback from `Y_K` to
`Y_Ω` is an equivalence, both being connected by (1). (3) Smooth connected affine `Y`: a cover of
`Y_{k'}` is of finite presentation, so it is the base change of a finite étale cover of
`Y ×_k Spec B` for a finitely generated `k`-subalgebra `B ⊆ k'`. The fraction field of `B` has a
finite transcendence basis `t₁, …, t_d` over `k`. Let `K_i` be the algebraic closure of
`k(t₁, …, t_i)` in `k'`, so `K₀ = k` and `B ⊆ K_d`. Each `K_i` is algebraically closed, `t_i` is
transcendental over `K_{i−1}`, and `K_i` is an algebraic closure of `K_{i−1}(t_i)`. Applying (2) to
`K_{i−1} ⊆ K_i` for `i = 1, …, d` shows that the cover's base change to `Y_{K_d}` comes from `Y`,
so the given cover comes from `Y`, and with the full faithfulness of (1) pullback from `Y` to
`Y_{k'}` is an equivalence. (4) General `X`: composing a
resolution of `X_red` with `X_red → X` gives a proper
surjective `π : X̃ → X` with `X̃` smooth; cover `X̃` by finitely many smooth connected affine opens
`X̃_i`. A cover of `X_{k'}` restricts to covers of the `X̃_{i,k'}`, which descend by (3); the gluing
isomorphisms on the overlaps and the descent isomorphism on `X̃ ×_X X̃` descend by (1), and their
cocycle conditions on triple overlaps and on `X̃ ×_X X̃ ×_X X̃` hold because they hold after base
change. Zariski gluing and *Proper descent of finite étale covers* along `π` give a cover of `X` with
the given base change. The descent datum on `X̃ ×_X X̃` is essential: the resolution alone forgets
how the branches through a singular point are glued. Sources:
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé X, Corollary 1.8, p. 204 (proper case), and
Exposé XIII, Corollary 3.2 2) a), pp. 302–303, with Remark 3.1.3, p. 302 (the non-proper
characteristic-zero statement); its proof is the reduction in the proof of Theorem 3.1 2) a), steps
3) 2–3) 4), pp. 297–298 (descent along a proper surjection from a smooth scheme, Zariski reduction
to the smooth affine case, relative normal crossings compactification);
[Stacks](https://stacks.math.columbia.edu/tag/0363), Lemma 33.7.6 (0363), for the connected
components. *Needs:* *Proper descent of finite étale covers*, *Tame specialization with a relative
boundary*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; ResolutionOfSingularitiesCharacteristicZero
§5.5 / `localIsomorphismResolution` and §6.2 / `sncCompactification` (for smooth quasi-projective
varieties), consumed through AlgebraicModuliForArithmeticGeometry §§9.4–9.5;
SchemeAndStackFoundations §0.9 (`finite_presentation_limits`), §0.12 (henselization)
and Layer 1 (Zariski gluing).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- A finite étale cover of `𝔾_{m,ℚ̄}` stays a cover of the same degree and the same monodromy group
  after base change to `ℂ`, and every cover of `𝔾_{m,ℂ}` arises this way (both are Kummer covers).
- In characteristic `p`, the Artin–Schreier covers `y^p − y = a x` of `𝔸¹_{k'}` with
  `a ∈ k' ∖ k` do not descend to `k`, so the non-proper statement cannot be extended to positive
  characteristic.
- Invariance for a singular `X` is not invariance for its resolution. For the nodal curve
  `y² = x²(x + 1)` over `ℂ` with normalization `𝔸¹` (identifying `t = 1` with `t = −1`), gluing `m ≥ 2`
  copies of `𝔸¹` in a cycle, `1` in copy `i` to `−1` in copy `i + 1`, gives a connected cover of
  degree `m` whose pullback to the normalization is `m` disjoint lines; step (4) recovers it from the
  descent datum at the two points of `X̃ ×_X X̃` over the node off the diagonal.

### IG.1.4 Outer actions and arithmetic representations

**Arithmetic representations.** Let `X` be a geometrically connected variety over a finitely
generated field `K` of characteristic zero, `ℓ` a prime and `ρ : π₁^ét(X_{K̄}) → GL_r(ℚ̄_ℓ)` a
continuous representation. Call `ρ` arithmetic if its isomorphism class has finite orbit under `Γ_K`,
acting through the outer action of the arithmetic exact sequence. Isomorphism means conjugation in
`GL_r(ℚ̄_ℓ)`; no section of the sequence enters the definition. Arithmeticity implies neither finite
image nor geometric origin. Define arithmeticity and prove
invariance under conjugation;
invariance under restriction to a finite extension of
`K`; equivalence with finiteness of the orbit set; and
that changing the lift of `σ ∈ Γ_K` by a geometric element
changes `ρ ∘ (conjugation)` only by conjugation, so the action on classes is well defined. *Proof
sketch.* Define the action on isomorphism classes through lifts to `π₁^ét(X)` and check independence
of the lift. Source: [Landesman–Litt](https://arxiv.org/pdf/2205.15352v4), Definition 9.1.1, p. 45.
*Needs:* EtaleCohomologyFoundations §F.0.A2 *The arithmetic fundamental-group sequence*.

**Checks.**

- The trivial representation has an orbit with one element.
- A representation with finite image is arithmetic: `π₁^ét(X_{K̄})` is topologically finitely
  generated, so it has only finitely many continuous homomorphisms to a given finite group, and a
  finite group has finitely many `r`-dimensional representations up to isomorphism.
- For `X = 𝔾_m`, the unipotent representation `a ↦ [[1, a_ℓ], [0, 1]]` of `π₁ = ẑ(1)` has infinite
  image, while `σ` changes it to its conjugate by `diag(χ_ℓ(σ), 1)`; its orbit has one element, so
  finite orbit does not mean finite monodromy.

**Exactness in families and the moduli outer action.** Over a field of characteristic zero, let
`𝓜_{g,n}` be the moduli stack of smooth `n`-pointed genus-`g` curves in the hyperbolic range
`2g − 2 + n > 0`, and `𝓒_{g,n} → 𝓜_{g,n}` its universal punctured curve. The sequence

```text
1 → π₁^ét(C_{x̄}) → π₁^ét(𝓒_{g,n}) → π₁^ét(𝓜_{g,n}) → 1
```

is exact, geometrically and arithmetically, and its outer actions are compatible with
specialization at a dominant `K`-point. The geometric fibre group is the profinite completion of
the topological surface group. Finite étale covers of a stack are representable finite étale
morphisms, with fibre functors at geometric points. *Proof sketch.* Étale locally on the stack,
apply descent and the exact sequence for schemes, and descend the compatible stalk actions. For the
geometric universal curve, use the topological fibration exact sequence and the criterion of
Anderson (*Exactness properties of profinite completion functors*, Topology 13 (1974),
Proposition 3) for the exactness of its profinite completion, then the comparison of finite covers;
the hypotheses of that criterion on the surface-group kernel are part of this target, and
centrelessness alone is not claimed to preserve exactness of profinite completions. Sources:
[Landesman–Litt](https://arxiv.org/pdf/2205.15352v4), proof of Theorem 9.1.2, diagrams (9.1) and
(9.2), pp. 46–47;
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§7.4, pp. 766–768. *Needs:* EtaleCohomologyFoundations §F.0.A2 *The arithmetic fundamental-group sequence*, *Invariance under
algebraically closed base extension in characteristic zero*; Supplied by ComplexComparisonPartII
§C6.2 / `riemannExistence`;
SchemeAndStackFoundations Layers 1 (stacks and descent), 3 and 4 (stable pointed curves and
the universal curve).
Riemann existence uses finite-type complex schemes and the shared fibre/deck convention.

**Checks.**

- For `(g, n) = (0, 3)`, `𝓜_{0,3}` is a point and the fibre group is the profinite completion of the
  free group of rank two.
- For `(g, n) = (1, 1)` the stack `𝓜_{1,1}` has generic stabiliser `±1`, which must appear in its
  fundamental group; computing with the coarse space would lose it.

**Pointed finite étale covers of semisimple groups.** Let `k` be algebraically closed of
characteristic zero, `G/k` a connected semisimple algebraic group, `p : Y → G` a connected finite
étale Galois cover, and `y ∈ Y(k)` a point above the identity. There is a unique algebraic group
structure on `Y` with identity `y` making `p` a group morphism. Its source is a semisimple affine
group scheme and `p` is a central isogeny. Thus if `G` satisfies the algebraic predicate
`TauCeti.simplyConnectedSemisimpleAffineGroupSchemeProperty`, every such cover is an isomorphism
and `π₁^ét(G, 1) = 1`. This target constructs the group operations on the covering scheme.

*Proof sketch.* Over `ℂ`, put `N = p_*π₁^top(Y, y)`. The product formula and the
Eckmann–Hilton identity identify multiplication on `π₁^top(G, 1)` with its abelian group law;
inversion induces negation. Hence multiplication composed with `p × p` and inversion composed
with `p` have fundamental-group images contained in `N`. The pointed covering-space lifting
criterion gives their unique lifts with value `y` at the identity. Each lift is a section of the
corresponding pulled-back finite étale cover, and full faithfulness of Riemann existence makes
that section algebraic. Pointed uniqueness on the connected products of `Y` gives associativity,
the unit laws and the inverse laws. The source is smooth and affine since it is finite étale over
`G`. Conjugation on the finite étale kernel is constant along connected `Y`, so the kernel is
central. The connected solvable radical maps trivially to semisimple `G`, hence is contained in
that finite kernel and is trivial; thus `Y` is semisimple.

For arbitrary algebraically closed `k` of characteristic zero, descend `G`, the cover `p` and
the point `y` to an algebraic closure `k₀` of a finitely generated subfield of `k`, and embed `k₀` in `ℂ`.
The characteristic-zero base-extension equivalence descends the algebraic sections from `ℂ`
to `k₀`; extend them to `k`. Faithfulness transports their laws and pointed uniqueness.
Apply the pinned central-isogeny eliminator over `k` itself. Every connected finite étale cover
is dominated by a connected Galois cover, so triviality of the latter computes `π₁^ét(G)`.
Source: [Brion–Szamuely, *Prime-to-`p` étale covers of algebraic groups and homogeneous
spaces*](https://arxiv.org/html/1109.2802v4), Proposition 1.1(a) and its proof in §2; in
characteristic zero there is no restriction on the degree.
*Needs:* *Invariance under algebraically closed base extension in characteristic zero*;
Supplied by ComplexComparisonPartII §C6.2 / `riemannExistence` and §C6.0 / `complexAlgebraicTopology`;
Supplied by EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`;
ReductiveGroups Layer 6 (radicals, semisimple groups and central isogenies);
Mathlib `IsCoveringMap.existsUnique_continuousMap_lifts_of_range_le`;
Tau Ceti `TauCeti.FundamentalGroup.prodMulEquiv`, `FundamentalGroup.cast_map_prod_mul` and
`TauCeti.simplyConnectedSemisimpleAffineGroupSchemeProperty.isIso`.

**Checks.**

- For the identity cover pointed at `1`, the lifted multiplication and inversion are those of `G`.
- For `G = SL₂`, algebraic simple connectedness forces every connected finite étale Galois cover
  to have degree one, and `π₁^ét(SL₂, 1) = 1`.
- The pointed cover `SL₂ → PGL₂` has central kernel `μ₂` and degree two. Its source is semisimple,
  but the target is not algebraically simply connected, so the isomorphism conclusion fails.

**Homogeneous spaces with finite stabilisers.** Let `k` be a field of characteristic zero, `G` a
connected semisimple and simply connected algebraic group over `k` (using the algebraic
central-isogeny predicate on `G_{k̄}`), and `V` a homogeneous space of
`G` whose geometric stabiliser at a point `v ∈ V(k̄)` is a finite group `H`. The orbit map
`G_{k̄} → V_{k̄}` is a universal finite étale cover and an `H`-torsor, so
`π₁^ét(V_{k̄}, v) ≅ H`, and the arithmetic sequence reads `1 → H → π₁^ét(V, v) → Γ_k → 1`. Without a
rational point it gives an outer action and no chosen section. *Proof sketch.* Apply
*Pointed finite étale covers of semisimple groups* over `k̄` to get `π₁^ét(G_{k̄}, 1) = 1`.
The quotient map is a connected finite étale `H`-torsor; the finite Galois-category calculation
identifies its fibre at `v`, pointed by `1`, with `H` and gives `π₁^ét(V_{k̄}, v) ≅ H`.
For the right `H`-action on `G_{k̄}`, deck transformations compose in the opposite order;
use inverse right translations to identify the deck group with `H`, retaining the shared
fibre/deck convention. Apply the arithmetic sequence. Source: [Harpaz–Wittenberg,
*Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2), §5.1 and the proof of
Proposition 5.1, pp. 18–19. *Needs:* EtaleCohomologyFoundations §F.0.A2 *The arithmetic fundamental-group sequence*,
*Pointed finite étale covers of semisimple groups*; Supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`;
ReductiveGroups Layer 6; ModularCurves Layer 0c (finite quotients and
torsors).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.
The quotient calculation retains the shared fibre/deck convention.

**Checks.**

- For `H = 1`, `V_{k̄} = G_{k̄}` has trivial geometric fundamental group.
- For `G = SL₂` and `H = {±1}`, `V = PGL₂` and its geometric fundamental group is `C₂`.
- `𝔾_m` is not semisimple and has geometric fundamental group `ẑ(1)`, so the semisimplicity
  hypothesis cannot be dropped.

### Examples

- `X = ℙ¹ ∖ {0, 1, ∞}` over `ℚ`: the geometric group is the profinite completion of the free group
  on two inertia generators, the rational tangent vector at `0` gives a section, and the outer
  action of `Γ_ℚ` raises each inertia generator to its `χ(σ)`-th power up to conjugation. This is
  the setting of BelyiMaps Layers 12–13, transported to this roadmap's conventions in Layer IG.6.
- Over `𝔽_q`, the arithmetic Frobenius of the section given by the tangent vector at `0` acts on the
  tame inertia at `0` by `τ ↦ τ^q`.
- Specialization of `ℙ¹ ∖ {0, 1, ∞, λ}` from characteristic zero to characteristic `p ≥ 3` with
  `λ ≢ 0, 1 (mod p)` identifies the prime-to-`p` quotients with the prime-to-`p` completion of the
  free group of rank three.

### Dependencies

EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory` supplies the
étale fundamental group and paths; EtaleCohomologyFoundations §§F.0.A0–F.0.A2 supply field and
`𝔾_m` identifications, the arithmetic sequence, decomposition and inertia. EtaleCohomologyFoundations §F.3a supplies the inertia and tame character of the
general henselian traits at the boundary of a curve over an algebraically closed field, with
infinite residue field; LocalFieldsRamification Layers 2–4 supply Frobenius, local ramification and
the tame quotient for finite-residue local fields, and Mathlib the decomposition and inertia groups of primes; AlgebraicCurves Layers
8 and 12 the decomposition of places and the curve-place dictionary; BelyiMaps Layers
12–13, ProfiniteArithmetic and PeripheralActions the Tate-module and peripheral conventions.
SchemeAndStackFoundations Layers 0, 1, 3 and 4 supply limits, henselization, Popescu
desingularization, descent, stacks, smooth proper curves with sections, stable pointed curves and
Grothendieck existence, from which *Finite étale covers over a henselian local base* lifts covers
along proper morphisms; EtaleCohomologyFoundations §F.0 /
`VanishingCycles.universalHomeomorphismEtaleEquivalence` supplies the topological invariance of the
small
étale site;
ComplexComparisonPartII §C6.2 / `riemannExistence` supplies Riemann existence for complex
finite-type schemes, and
ResolutionOfSingularitiesCharacteristicZero §§5.5, 6.2 / `localIsomorphismResolution`,
`sncCompactification` supply resolution and normal crossings compactifications through
AlgebraicModuliForArithmeticGeometry §§9.4–9.5.
ReductiveGroups
Layer 6 and ModularCurves Layer 0c supply semisimple groups and finite torsors.
The finite-cover contract has no coefficient-invertibility condition, étale invariance uses universal homeomorphisms, and Riemann existence uses finite-type complex schemes.

## Layer IG.2: Hilbert irreducibility and specialization

This layer turns a Galois cover of the line, or of affine space, into Galois extensions of the
ground field with the same group. It starts with light algebra over a field: the rational functions
regular at a point, the specialization `p(T, Y) ↦ p(t, Y)` of polynomials with rational-function
coefficients, and one polynomial guard whose nonvanishing at `t` makes specialization a ring map on
the coefficients involved and preserves the degree, so that the bad parameters of a nonzero
polynomial form a finite set. It then defines Hilbert subsets at all scheme points and thin sets,
proves Hilbert irreducibility over number fields and the integral count of thin sets, and derives
full-group specialization of regular covers with linear disjointness, local conditions at finitely
many places and weak approximation, the pullback of Hilbert subsets through norm maps of tori,
Hilbert specialization detected by the Frattini quotient, and the triviality of finitely generated closed normal
subgroups of absolute Galois groups of fields finitely generated over `ℚ`. Layers IG.4 and IG.6 use
these theorems.

Conventions particular to this layer. In IG.2.1–IG.2.3, `K` is an arbitrary field, with no
assumption on its characteristic; extra hypotheses (an infinite field) are stated where they are
used. `K(T)` is Mathlib's `RatFunc K`, and `T` is its variable, the parameter that is specialized;
`K(T)[Y]` is `Polynomial (RatFunc K)`, and `Y`, the outer polynomial variable, is never specialized.
For `f ∈ K(T)`, `num(f)` and `denom(f)` are Mathlib's `RatFunc.num` and `RatFunc.denom`: coprime,
`denom(f)` monic, and `denom(0) = 1`. Regularity of `f` at `t ∈ K` means `denom(f)(t) ≠ 0` for this
reduced denominator, so common factors cancel before the test: `(T² − 1)/(T − 1) = T + 1` is regular
at `1`. Values are Mathlib's total evaluation `RatFunc.eval (RingHom.id K) t f = num(f)(t)/denom(f)(t)`.
At a pole the denominator value is `0`, and with the field convention `x/0 = 0` the value is `0`
(`RatFunc.eval_eq_zero_of_eval₂_denom_eq_zero`). So the value `0` does not tell a zero from a pole,
and total evaluation is not a ring map on `K(T)`: at `t = 0`, `T · T⁻¹ = 1` has value `1` while the
product of the values is `0`. Ring laws are therefore stated on the regular subring, or under
regularity hypotheses on every coefficient. Degree preservation needs only that the value of the
leading coefficient is nonzero; the guard of IG.2.3 asks for regularity of every coefficient and
nonvanishing of the leading coefficient at `t`. Neither condition implies irreducibility of the
specialized polynomial: `Y² − T` passes the guard at `t = 4`, and `Y² − 4` is reducible. We write
`Rₜ` for the regular subring, `eₜ` for evaluation on it, `spₜ` for specialization and `D(p)` for the
denominator product. The Lean names of IG.2.1–IG.2.3 are in the namespace `RationalSpecialization`.
From IG.2.4 on, varieties are integral separated schemes of finite type over a field, Hilbert
subsets are sets of scheme points, and `H(k)` denotes the `k`-rational points of a Hilbert subset `H`.

### IG.2.1 Rational functions regular at a point

**Rational functions regular at a point.** For `t ∈ K`, define the regular subring
`Rₜ` as the subring of `K(T)` whose elements are exactly the `f` with `denom(f)(t) ≠ 0`,
using the monic reduced denominator; its operations and its inclusion `Subring.subtype` are those of
`K(T)`. This is the valuation ring of the finite place of `K(T)` at the irreducible polynomial
`T − t`, which Tau Ceti already has: define `Rₜ` as the underlying subring of
`(TauCeti.Place.adicOfIrreducible (Polynomial.irreducible_X_sub_C t)).integers`, so that the
membership criterion below is `TauCeti.Place.valuation_ofIrreducible_le_one_iff` for `q = T − t`
(`T − t ∤ denom(f)` exactly when `denom(f)(t) ≠ 0`); what this target adds is the description by
reduced denominators and the interface with `RatFunc.eval` and polynomial specialization. Prove that for `f ∈ K(T)`, `f ∈ Rₜ` exactly when
`denom(f)(t) ≠ 0` (stated below as *Membership by reduced denominator*);
that the image of every `q ∈ K[T]` in `K(T)` lies
in `Rₜ`, since its reduced denominator is `1` (`RatFunc.denom_algebraMap`); and
that a subring `A` of `K(T)` satisfies `A ≤ Rₜ` exactly
when `denom(f)(t) ≠ 0` for every `f ∈ A`, by `Subring` extensionality. *Proof sketch.*
`RatFunc.denom_zero` and `RatFunc.denom_one` handle `0` and `1`; `RatFunc.denom_add_dvd` and
`RatFunc.denom_mul_dvd` show that `denom(f + g)` and `denom(fg)` divide `denom(f)·denom(g)`, whose
value at `t` is nonzero, and a divisor of a polynomial with nonzero value at `t` has nonzero value
at `t`. For negation write `−f = (−num(f))/denom(f)` by `RatFunc.num_div_denom`, so `denom(−f)`
divides `denom(f)` by `RatFunc.denom_dvd`. With the valuation-ring definition these closure facts
come for free; they are what a direct construction with the `Subring` constructor would bundle, and
they show that the two descriptions give the same subring.
Source: [Mathlib `RatFunc` sources](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean),
`RatFunc.eval`, `eval_add` and `eval_mul`, and the reduced-denominator API of `RatFunc/Basic`; the
specialization map and its finite exceptional set are motivated by
[Dèbes, *Arithmétique des revêtements de la droite*](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137 (this elementary part proves neither Proposition 5.2.5 there nor
Hilbert irreducibility). *Needs:* Mathlib `Subring`, `Subring.subtype`, `RatFunc.denom`,
`RatFunc.num`, `RatFunc.denom_zero`, `RatFunc.denom_one`, `RatFunc.denom_ne_zero`,
`RatFunc.denom_add_dvd`, `RatFunc.denom_mul_dvd`, `RatFunc.denom_dvd`, `RatFunc.num_div_denom`,
`RatFunc.denom_algebraMap`, `Polynomial.evalRingHom`; Tau Ceti `TauCeti.Place.adicOfIrreducible`,
`TauCeti.Place.integers`, `TauCeti.Place.valuation_ofIrreducible_le_one_iff`.

**Checks.**

- Over `ℚ`, the zero function lies in `R₀`, since `denom(0) = 1`; this is the degenerate case, and a
  test that declared `f` singular whenever its value at `t` is `0` would wrongly exclude it.
- Over `ℚ`, `(T² − 1)/(T − 1)` lies in `R₁`, because its reduced representative is `T + 1` with
  denominator `1`; a definition using the written denominator `T − 1` would exclude it.
- Over `ℚ`, `T⁻¹` does not lie in `R₀`: `denom(T⁻¹) = T` vanishes at `0`.
- The value `0` does not certify a pole: `T ∈ R₀` has value `0` at `0`, and `T⁻¹ ∉ R₀` also has
  value `0` there by Mathlib's convention, so membership is decided by the reduced denominator
  alone, and `Rₜ` is a subring although total evaluation is not a ring map.

**Membership by reduced denominator.** For `t ∈ K` and `f ∈ K(T)`, `f ∈ Rₜ` if and only if
`denom(f)(t) ≠ 0`. *Proof sketch.* With the definition through the Tau Ceti valuation ring,
`TauCeti.Place.valuation_ofIrreducible_le_one_iff` for `q = T − t` says that `f ∈ Rₜ` exactly when
`T − t ∤ denom(f)`, and `Polynomial.dvd_iff_isRoot` turns this into `denom(f)(t) ≠ 0`. Source: [Mathlib `RatFunc` sources](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean),
`RatFunc.eval`, `eval_add` and `eval_mul`, and the reduced-denominator API;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Rational functions regular at a point*; Tau Ceti
`TauCeti.Place.valuation_ofIrreducible_le_one_iff`; Mathlib `Polynomial.dvd_iff_isRoot`.

**Checks.**

- Both directions use the reduced denominator, including `denom(0) = 1`: over `ℚ`,
  `(T² − T)/T` reduces to `T − 1` and lies in `R₀`, while `T/T²` reduces to `T⁻¹` and does not.

**Evaluation on the regular subring.** For `t ∈ K`, define the ring map
`eₜ : Rₜ →+* K` as the restriction of `RatFunc.eval (RingHom.id K) t` to `Rₜ`, so that
`eₜ(f) = num(f)(t)/denom(f)(t)` with nonzero denominator. Prove
that for `f ∈ Rₜ`, `eₜ(f)` is `RatFunc.eval (RingHom.id K) t f`,
with Mathlib's normalized numerator and denominator; that
for `q ∈ K[T]`, carried into `Rₜ` because polynomials are regular everywhere,
`eₜ(q) = q(t)`; and that `eₜ` is onto `K`, the value `a`
being attained by the constant polynomial `a`. The ring-map laws come with the bundled `RingHom`.
*Proof sketch.* `RatFunc.eval_add` and `RatFunc.eval_mul` each require nonvanishing of the two
denominator values, which *Membership by reduced denominator* supplies; `RatFunc.eval_zero` and
`RatFunc.eval_one` give the remaining fields, and `RatFunc.eval_algebraMap` the polynomial values.
Source: [Mathlib `RatFunc` sources](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean),
`RatFunc.eval`, `eval_add` and `eval_mul`, and the reduced-denominator API;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Rational functions regular at a point*, *Membership by
reduced denominator*; Mathlib `RingHom`, `RatFunc.eval`, `RatFunc.eval_zero`, `RatFunc.eval_one`,
`RatFunc.eval_add`, `RatFunc.eval_mul`, `RatFunc.eval_algebraMap`. Equivalently, `eₜ` is the residue
map of the place at `T − t` followed by `K[T]/(T − t) ≅ K`, through Tau Ceti
`TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`; proving this agreement is part of the target.

**Checks.**

- Over `ℚ`, `e₀(1) = 1`, the unit law in the degenerate case.
- Over `ℚ`, `e₃(T) = 3`, with `T` carried into `R₃` by the polynomial inclusion; a map evaluating
  at another point, or acting on `Y` instead of `T`, would not give `3`. On a nonpolynomial element,
  `e₃(1/(T − 1)) = 1/2`.
- Over `ℚ`, `e₂(T − 2) = 0`: in general `T − t` lies in the kernel, so `eₜ` is not injective, and a
  construction asking for an injective map of fields would fail.
- `eₜ` is surjective: `e₅` sends the constant `7` to `7`, and every `a ∈ K` is attained by the
  constant `a`.

### IG.2.2 Specialization of polynomials

**Rational-coefficient polynomial specialization.** For `t ∈ K` and `p = Σₙ cₙ(T)Yⁿ ∈ K(T)[Y]`,
define `RationalSpecialization.specialize`, written `spₜ(p)`, by

```text
spₜ(p) = Σₙ RatFunc.eval (RingHom.id K) t cₙ · Yⁿ ∈ K[Y],
```

a finite sum (`Polynomial.sum`) over the support of `p`. It is a total function, defined even when
some coefficient has a pole at `t`; ring laws are asserted only when all coefficients involved are
regular at `t` (*Specialization preserves addition*, *Specialization preserves multiplication*).
Prove that the coefficient of `Yⁿ` in `spₜ(p)` is
`RatFunc.eval (RingHom.id K) t (p.coeff n)` (stated below as *Coefficients after specialization*);
that `spₜ(C f) = C(RatFunc.eval (RingHom.id K) t f)` for
`f ∈ K(T)`; that `spₜ(Y) = Y` and `spₜ(0) = 0` for every `t`; and
that for `p ∈ K[T][Y]`, specializing the
image of `p` in `K(T)[Y]` gives `Polynomial.map (Polynomial.evalRingHom t) p`. *Proof sketch.* Sum
`monomial n (RatFunc.eval (RingHom.id K) t cₙ)` with `Polynomial.sum`, so no new polynomial type is
introduced; `RatFunc.eval_zero` keeps coefficients outside the support zero. The total coefficient
function stays distinct from the ring map `eₜ` on `Rₜ`. Source: [Mathlib `RatFunc` sources](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean),
`RatFunc.eval`, `eval_add` and `eval_mul`, and the reduced-denominator API;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* Mathlib `Polynomial.sum`, `RatFunc.eval`,
`RatFunc.eval_zero`, `Polynomial.coeff_monomial`, `Polynomial.map`, `Polynomial.evalRingHom`.

*Lean:* `RationalSpecialization.specialize` supplies coefficientwise evaluation for the Hilbert
statements.

**Checks.**

- Over `ℚ`, `sp₀(0) = 0`, the degenerate case.
- Over `ℚ`, `sp₂(Y² − T) = Y² − 2`: `T` is replaced by `2` and `Y` is unchanged; a construction
  that substituted into the outer variable would not return `Y² − 2`.
- Over `ℚ` at `t = 0`, `sp₀(C(T)·C(T⁻¹)) = sp₀(1) = 1`, while `sp₀(C T)·sp₀(C T⁻¹) = 0·0 = 0`: at a
  pole the function still returns a polynomial, but multiplicativity fails, so a statement of the
  product law without regularity hypotheses is false.
- Over `ℚ`, `sp₀(TY + 1) = 1` has natural degree `0`, although `TY + 1` has degree `1` and both
  coefficients are regular at `0`: regularity alone does not preserve the degree.

**Coefficients after specialization.** For every `t ∈ K`, `p ∈ K(T)[Y]` and `n ∈ ℕ`, the coefficient
of `Yⁿ` in `spₜ(p)` is `RatFunc.eval (RingHom.id K) t (p.coeff n)`. *Proof sketch.* Apply
`Polynomial.coeff_sum` and `Polynomial.coeff_monomial` to the defining finite sum; at an index in the
support only its own term survives, and outside the support the coefficient is zero by
`Polynomial.mem_support_iff` and `RatFunc.eval_zero`. Source: Mathlib `Polynomial.coeff_sum`, `coeff_monomial` and `mem_support_iff`;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Rational-coefficient polynomial specialization*; Mathlib
`Polynomial.coeff_sum`, `Polynomial.coeff_monomial`, `Polynomial.mem_support_iff`, `RatFunc.eval_zero`.

**Checks.**

- The formula holds at a pole, as a statement about the total function: over `ℚ`, the coefficient
  of `Y` in `sp₀(T⁻¹Y)` is `RatFunc.eval (RingHom.id ℚ) 0 T⁻¹ = 0`, so `sp₀(T⁻¹Y) = 0`.

**Compatibility with polynomial coefficient maps.** For `t ∈ K` and `q ∈ Rₜ[Y]`,
`spₜ(Polynomial.map Rₜ.subtype q) = Polynomial.map eₜ q`, where `Rₜ.subtype : Rₜ → K(T)` is the
inclusion. *Proof sketch.* Compare coefficients: *Coefficients after specialization* on the left and
`Polynomial.coeff_map` on both sides reduce the claim to the definition of `eₜ`; conclude with
`Polynomial.ext`. Source: Mathlib `Polynomial.coeff_map` and `Polynomial.ext`;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Rational functions regular at a point*, *Evaluation on
the regular subring*, *Coefficients after specialization*; Mathlib `Subring.subtype`, `Polynomial.map`,
`Polynomial.coeff_map`, `Polynomial.ext`.

**Checks.**

- The right side is `Polynomial.map` along the ring map `eₜ`, on the domain where evaluation is a
  ring map: over `ℚ` at `t = 0`, `q = (T − 1)⁻¹Y + T ∈ R₀[Y]` gives `−Y` on both sides.

**Specialization preserves addition.** Let `t ∈ K` and `p, q ∈ K(T)[Y]` with
`denom(p.coeff n)(t) ≠ 0` and `denom(q.coeff n)(t) ≠ 0` for every `n`. Then
`spₜ(p + q) = spₜ(p) + spₜ(q)`. *Proof sketch.* By *Membership by reduced denominator*, `p` and `q`
lift to `Rₜ[Y]` with `Polynomial.toSubring`, and `Polynomial.map_toSubring` recovers them under the
inclusion; apply `Polynomial.map_add` to the lifts, *Compatibility with polynomial coefficient maps*
to the sum and to each summand, and `Polynomial.map_add` for `eₜ`. No ring map `K(T) → K` is ever
constructed. Source: Mathlib `Polynomial.toSubring`, `map_toSubring` and `map_add`;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Membership by reduced denominator*, *Compatibility with
polynomial coefficient maps*; Mathlib `Polynomial.toSubring`, `Polynomial.map_toSubring`,
`Polynomial.map_add`.

**Checks.**

- The regularity hypotheses cannot be dropped: over `ℚ` at `t = 0`, take `p = C(T⁻¹)` and
  `q = C(1 − T⁻¹) = C((T − 1)/T)`; then `sp₀(p + q) = sp₀(1) = 1`, while `sp₀(p) + sp₀(q) = 0 + 0 = 0`.
- With regular coefficients, over `ℚ` at `t = 2`: `sp₂((Y² − T) + (T − 1)⁻¹Y) = Y² + Y − 2`, the sum
  of `Y² − 2` and `Y`.

**Specialization preserves multiplication.** Let `t ∈ K` and `p, q ∈ K(T)[Y]` with
`denom(p.coeff n)(t) ≠ 0` and `denom(q.coeff n)(t) ≠ 0` for every `n`. Then
`spₜ(p · q) = spₜ(p) · spₜ(q)`. *Proof sketch.* As for addition, with `Polynomial.map_mul` for the
lifts and for `eₜ`: lift with `Polynomial.toSubring`, recover with `Polynomial.map_toSubring`, and
identify both sides by *Compatibility with polynomial coefficient maps*. No ring map `K(T) → K` is
constructed. Source: Mathlib `Polynomial.toSubring`, `map_toSubring` and `map_mul`;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Membership by reduced denominator*, *Compatibility with
polynomial coefficient maps*; Mathlib `Polynomial.toSubring`, `Polynomial.map_toSubring`,
`Polynomial.map_mul`.

**Checks.**

- The regularity hypotheses cannot be dropped: the pole test `sp₀(C(T)·C(T⁻¹)) = 1` against
  `sp₀(C T)·sp₀(C T⁻¹) = 0` over `ℚ` violates the conclusion, and there `T⁻¹` has a pole at `0`.
- With regular coefficients, over `ℚ` at `t = 2`: `sp₂((Y − T)(Y + T)) = (Y − 2)(Y + 2) = Y² − 4`.

### IG.2.3 Denominators and the specialization guard

**Denominator product of a polynomial.** For `p ∈ K(T)[Y]`, define the denominator product
`D(p) ∈ K[T]` by

```text
D(p) = ∏_{n ∈ p.support} denom(p.coeff n).
```

It is a product with repetitions, not a least common denominator; for `p = 0` it is the empty
product `1`. Because the denominators are Mathlib's reduced ones, `D(p)` depends only on `p`; zero
coefficients contribute no index, and their denominator would be `1` anyway. Prove
that `D(0) = 1`;
that `D(C f) = denom(f)` for every `f ∈ K(T)`, including
`f = 0`; and that for `p ∈ K[T][Y]`,
its image in `K(T)[Y]` has denominator product `1`. *Proof sketch.* Take the finite product over the
coefficient support in `K[T]`; `RatFunc.denom_zero` and `RatFunc.denom_algebraMap` give the special
values. Source: [Mathlib `RatFunc` sources](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean),
`RatFunc.eval`, `eval_add` and `eval_mul`, and the reduced-denominator API;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* Mathlib `RatFunc.denom`, `RatFunc.denom_zero`,
`RatFunc.denom_algebraMap`, `Polynomial.mem_support_iff`.

**Checks.**

- Over `ℚ`, `D(0) = 1`, the empty product.
- Over `ℚ`, `D(T⁻¹Y + T⁻¹) = T²`, not `T`: repeated denominator factors stay repeated, and a
  definition by least common denominator would return `T`.
- Over `ℚ`, `D(C((T² − 1)/(T − 1))) = 1`: an apparent pole removed by cancellation contributes no
  factor, and a definition using the written denominator would return `T − 1`.

**Nonvanishing denominator product.** For every `p ∈ K(T)[Y]`, including `p = 0`, `D(p)` is a nonzero
polynomial in `K[T]`. *Proof sketch.* Each factor is nonzero by `RatFunc.denom_ne_zero`, and a finite
product of nonzero elements of the domain `K[T]` is nonzero, the empty product being `1`. Source:
[Mathlib `RatFunc` sources](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean),
`RatFunc.eval`, `eval_add` and `eval_mul`, and the reduced-denominator API;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Denominator product of a polynomial*; Mathlib
`RatFunc.denom_ne_zero`.

**Checks.**

- The statement is about the polynomial, not its values: over `ℚ`, `D(C(T⁻¹)) = T` is nonzero but
  vanishes at `t = 0`.

**The exact coefficient-regularity locus.** For all `p ∈ K(T)[Y]` and `t ∈ K`, `D(p)(t) ≠ 0` if and
only if `denom(p.coeff n)(t) ≠ 0` for every `n ∈ ℕ`. *Proof sketch.* `Polynomial.eval_prod` writes
`D(p)(t)` as the product of the denominator values over the support, and a product in a field is
nonzero exactly when each factor is; outside the support the coefficient is `0`, whose denominator
is `1` by `RatFunc.denom_zero`, which extends the finite conjunction to all `n`. Source:
Mathlib `Polynomial.eval_prod` and `mem_support_iff`;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Denominator product of a polynomial*; Mathlib
`Polynomial.eval_prod`, `Polynomial.mem_support_iff`, `RatFunc.denom_zero`.

**Checks.**

- For `p = 0` both sides are true at every `t`: `D(0) = 1` and `denom(0) = 1`.
- Over `ℚ`, `D(T⁻¹Y + 1) = T` vanishes at `0`, and the coefficient of `Y` has a pole there.

**Degree preservation by the leading coefficient.** Let `t ∈ K` and `p ∈ K(T)[Y]`. If
`RatFunc.eval (RingHom.id K) t (p.leadingCoeff) ≠ 0`, then `natDegree(spₜ(p)) = natDegree(p)`. No
hypothesis on the lower coefficients is needed, since `spₜ` is the total coefficient function; the
hypothesis forces `p ≠ 0` and, by the pole convention, regularity of the leading coefficient at `t`.
*Proof sketch.* Above `natDegree(p)` the coefficients of `p` vanish
(`Polynomial.coeff_eq_zero_of_natDegree_lt`), so by `RatFunc.eval_zero` those of `spₜ(p)` do too;
apply `Polynomial.natDegree_le_iff_coeff_eq_zero`. At `natDegree(p)`, *Coefficients after
specialization* identifies the coefficient with the assumed nonzero value; apply
`Polynomial.natDegree_eq_of_le_of_coeff_ne_zero`. Source: Mathlib `Polynomial.natDegree_eq_of_le_of_coeff_ne_zero` and the high-coefficient tests;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Coefficients after specialization*; Mathlib
`Polynomial.coeff_eq_zero_of_natDegree_lt`, `Polynomial.natDegree_le_iff_coeff_eq_zero`,
`Polynomial.natDegree_eq_of_le_of_coeff_ne_zero`, `RatFunc.eval_zero`.

**Checks.**

- Over `ℚ`, `TY + 1` at `t = 0` fails the hypothesis (leading-coefficient value `0`) and loses
  degree: `sp₀(TY + 1) = 1`.
- An irreducible specialization can still lose degree: over `ℚ` at `t = 0`, the
  polynomial `TY² + Y + 1`, whose coefficients are all regular at `0`, specializes to the
  irreducible `Y + 1` of lower degree.
- Poles of lower coefficients are allowed: over `ℚ`, `Y + T⁻¹` has leading-coefficient value `1` at
  `0` and `sp₀(Y + T⁻¹) = Y` keeps degree `1`.

**A polynomial guard for regular specialization.** Let `t ∈ K` and `p ∈ K(T)[Y]`, and call
`D(p)·num(p.leadingCoeff) ∈ K[T]` the guard of `p`. If `(D(p)·num(p.leadingCoeff))(t) ≠ 0`, then
`denom(p.coeff n)(t) ≠ 0` for every `n`, and `natDegree(spₜ(p)) = natDegree(p)`. For `p = 0` the guard
is the zero polynomial, since `num(0) = 0`, and the hypothesis never holds. *Proof sketch.* A nonzero
product value gives `D(p)(t) ≠ 0` and `num(p.leadingCoeff)(t) ≠ 0`; *The exact
coefficient-regularity locus* gives regularity of every coefficient, in particular of the leading
one at `n = natDegree(p)`. The value `num(t)/denom(t)` of the leading coefficient is then nonzero,
and *Degree preservation by the leading coefficient* applies. Source: [Mathlib `RatFunc` sources](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean),
`RatFunc.eval`, `eval_add` and `eval_mul`, and the reduced-denominator API;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *The exact coefficient-regularity locus*, *Degree
preservation by the leading coefficient*; Mathlib `RatFunc.eval`, `RatFunc.num`, `Polynomial.evalRingHom`.

**Checks.**

- For `p = TY + 1` over `ℚ`, `D(p) = 1` and `num(T) = T`, so the guard is `T` and `t = 0` is
  excluded, exactly where the degree drops.
- The guard ensures regularity and degree, not irreducibility: `Y² − T` has guard `1`, nonzero at
  every `t`, and `sp₄(Y² − T) = (Y − 2)(Y + 2)`.
- For `p = 0` the guard is `0`, so the theorem says nothing, as it should for the polynomial without
  a leading coefficient.

**Finiteness of bad specialization parameters.** For nonzero `p ∈ K(T)[Y]`, the set of `t ∈ K` at
which some coefficient of `p` has a pole, or `natDegree(spₜ(p)) ≠ natDegree(p)`, is finite. This
holds over every field, finite fields included, and asserts nothing about the existence of a good
parameter. *Proof sketch.* The guard `G = D(p)·num(p.leadingCoeff)` is nonzero by *Nonvanishing
denominator product*, `Polynomial.leadingCoeff_ne_zero` and `RatFunc.num_ne_zero`; by the
contrapositive of *A polynomial guard for regular specialization*, every bad parameter is a root of
`G`, and `Polynomial.finite_setOfPred_isRoot` with `Set.Finite.subset` concludes. Source: Mathlib `Polynomial.finite_setOfPred_isRoot` and `Set.Finite.subset`;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Nonvanishing denominator product*, *A polynomial guard for
regular specialization*; Mathlib `Polynomial.leadingCoeff_ne_zero`, `RatFunc.num_ne_zero`,
`Polynomial.finite_setOfPred_isRoot`, `Set.Finite.subset`.

**Checks.**

- Over `ℚ`, `Y² − T` is regular of degree two at every `t`, so its bad set is empty, although
  irreducibility changes (`t = 4`).
- Over `𝔽₂`, `(T² − T)Y + 1` loses degree at both parameters `0` and `1`; the bad set is all of
  `𝔽₂`, which is finite, and no good parameter exists.

**Simultaneous avoidance for a finite polynomial family.** Let `K` be an infinite field, `s` a finite
set of nonzero polynomials in `K(T)[Y]`, and `A ⊂ K` a finite set. There is `t ∈ K ∖ A` such that,
for every `p ∈ s`, every coefficient of `p` is regular at `t` and `natDegree(spₜ(p)) = natDegree(p)`.
*Proof sketch.* *Finiteness of bad specialization parameters* gives a finite bad set for each
`p ∈ s`; induct on `s` with `Set.Finite.union` to unite them with `A`, and choose `t` outside the
union by `Set.Finite.exists_notMem`, since `K` is infinite. Source: Mathlib `Set.Finite.union` and `Set.Finite.exists_notMem`;
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§§5.2.1–5.2.2, printed pp. 135–137. *Needs:* *Finiteness of bad specialization parameters*; Mathlib
`Set.Finite.union`, `Set.Finite.exists_notMem`.

**Checks.**

- The empty family reduces the statement to `K ∖ A ≠ ∅`; over `𝔽₂` with `A = 𝔽₂` this fails, so
  infiniteness of `K` cannot be dropped.
- Over `𝔽₂`, even with `A = ∅`, the family `{(T² − T)Y + 1}` has no admissible parameter.
- The conclusion is not irreducibility, a prescribed Galois group or linear disjointness: for
  `s = {Y² − T}` over `ℚ` and `A = ∅`, `t = 4` is an admissible output and `Y² − 4` is reducible.

### IG.2.4 Hilbert subsets and Hilbert irreducibility

**Hilbert subsets and Hilbertian fields.** Let `k` be a field and `X` an integral `k`-variety. A
Hilbert datum on `X` is a nonempty open `U ⊂ X` together with finitely many finite étale morphisms
`Vᵢ → U` with each `Vᵢ` integral. Its Hilbert subset is the set of scheme points `x ∈ U` such that
every fibre `Vᵢ ×_U Spec κ(x)` is connected. Rational membership (`x ∈ X(k)`) and closed-point
membership (fibres over the residue field `κ(x)`, a finite extension of `k`) are restrictions of this
one set. For `X = 𝔸¹` over a field `k` of characteristic zero, the polynomial form takes finitely many
irreducible separable polynomials `f₁, …, f_m ∈ k(T)[Y]` of positive `Y`-degree and a nonzero
`g ∈ k[T]`, and consists of the `t ∈ k` at which `g(t) ≠ 0`, the guard of each `fᵢ` (*A polynomial
guard for regular specialization*) does not vanish, and each `spₜ(fᵢ)` is irreducible in `k[Y]`. A
field `k` of characteristic zero is Hilbertian if the Hilbert subset of every Hilbert datum on `𝔸¹_k`
contains a `k`-rational point; infinitude and finite avoidance are consequences, proved in
*Hilbert irreducibility over number fields*. The Lean predicate `IsHilbertian` states the
polynomial form over an arbitrary field, with separable polynomials (the separable Hilbert sets of
the literature, which in characteristic zero give the notion above); a nonzero `g` is encoded by
adjoining the linear polynomial `Y − 1/g`, whose coefficient is regular exactly where `g` does not
vanish, and in the same way any finite set of parameters can be excluded, which yields infinitely
many admissible parameters. Prove that membership is
connectedness of every finite étale fibre over the residue field; that a finite
intersection of Hilbert subsets of `X` is the Hilbert subset of the combined datum, over the
intersection of the opens; that rational membership evaluates the
fibres over `k`, while closed-point membership uses the residue extension; and
that the guarded polynomial datum gives exactly the parameters with
irreducible specializations of the full degree. *Proof sketch.* Fibres are taken at all scheme
points, not only at `k`-points. For the polynomial comparison, on the open set where `g`, the guards
and the discriminants of the `fᵢ` do not vanish, `Vᵢ = Spec 𝒪(U)[Y]/(fᵢ)` is finite étale and
integral, and its fibre at `t` is `Spec k[Y]/(spₜ(fᵢ))`, connected exactly when `spₜ(fᵢ)` is
irreducible; in characteristic zero an irreducible specialization of full degree is separable, so
the discriminant condition removes no admissible parameter. Sources:
[Dèbes, *Arithmétique des revêtements de la
droite*](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§5.2.1, the Hilbert subsets following Théorème 5.2.1, printed p. 136, and Définition 5.2.2
(Hilbertian fields), for polynomial Hilbert subsets with regular coefficients and preserved
degrees; [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
§1.1 p.6, for Hilbert subsets at all scheme points. *Needs:* *A polynomial guard for regular
specialization*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory` (finite étale covers and their fibres);
SchemeAndStackFoundations Layer 0 (scheme points, residue fields, fibre products).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

*Lean:* `IsHilbertian` expresses the polynomial condition on the affine line.

**Checks.**

- For `Y² − T` over `ℚ` on `𝔾_m`, a rational `t ≠ 0` belongs exactly when `t` is not a square in
  `ℚ`; a definition by geometric fibres would contain no point at all, since a degree-two étale
  fibre over `ℚ̄` is never connected.
- The generic point belongs whenever each `Vᵢ` is integral, its fibre being the spectrum of the
  function field of `Vᵢ`; a definition using only rational points cannot see it.
- For the identity datum (`U = X`, no covers) every point belongs, including nonrational closed
  points such as the point `T² + 1 = 0` of `𝔸¹_ℚ`; a definition restricted to rational points would
  lose them.

**Finite-extension permanence of Hilbertianity.** Let `K` be a Hilbertian field of characteristic
zero and `L/K` a finite extension. Then `L` is Hilbertian in the finite-family, regular-coefficient
and degree-preserving sense of *Hilbert subsets and Hilbertian fields*. No properness hypothesis
on `L/K` is required. *Proof sketch.* For each irreducible `f ∈ L(T)[Y]`, take a primitive
element of `L(T)[Y]/(f)` over `K(T)`. Its minimal polynomial has degree `[L : K] deg_Y(f)`.
Express a primitive element of `L/K` and the root of `f` as rational functions of this element,
and keep guards for all denominators and identities. Apply Hilbertianity over `K` simultaneously
to these minimal polynomials. Each specialized field contains the transported copy of `L`
and a root of the corresponding `f(t,Y)`; the preserved total degree forces `f(t,Y)` to have
its original degree and remain irreducible over that copy of `L`. Exclude the finitely many
`K`-rational zeros of the guards by adjoining the irreducible tests `Y² − (T − a)`, whose
specializations at `a` are reducible. Source:
Serre, *Topics in Galois Theory*,
§3.2.1, Proposition 3.2.1 and Corollary 3.2.2, printed pp. 21–22.
*Needs:* *Hilbert subsets and Hilbertian fields*; Mathlib finite extensions, primitive elements
and simple-extension degree formulas.

**Checks.**

- For the identity extension `L = K`, the conclusion is the given Hilbertianity; degree one is
  allowed, unlike the proper finite extension in Weissauer's theorem.
- If `ℚ` is Hilbertian, its quadratic extension `ℚ(√2)` is Hilbertian as well.
- Finiteness is essential: `ℚ̄/ℚ` is algebraic but `Y² − T` has no irreducible specialization
  over `ℚ̄`.

**Hilbert irreducibility over number fields.** Every number field `K` is Hilbertian. More precisely,
let `r ≥ 1`, let `f₁, …, f_m ∈ K(T₁, …, T_r)[Y]` be irreducible separable polynomials of positive
`Y`-degree, and let `g ∈ K[T₁, …, T_r]` be nonzero. The set of `t ∈ K^r` at which `g(t) ≠ 0`, every
coefficient of every `fᵢ` is regular, the leading coefficients do not vanish, and every `fᵢ(t, Y)` is
irreducible in `K[Y]` is Zariski dense in `𝔸^r_K`; for `r = 1` it remains infinite after removing any
finite subset of `K`. Compared with *Simultaneous avoidance for a finite polynomial family*, which
controls only regularity and degree, this adds irreducibility, and the proof is arithmetic.
*Proof sketch.* Over `ℚ`, finitely many conditions reduce to one by a fibre-product and
primitive-element argument, and the Hilbert–Dörge estimate (Puiseux expansions of the roots at
infinity) shows that the integers `t ≤ B` at which the reduced condition fails number `O(B^{1−δ})`
for some `δ > 0`; a guard is kept by intersecting with an open set. A number field `K` inherits the
property because a finite extension of a Hilbertian field is Hilbertian, and several parameters
reduce to one because the Hilbert property of `ℙ¹` gives that of `ℙ^r` (Serre, Corollaries 3.2.2
and 3.2.4). Iterating outside finite avoidance sets gives infinitude. Sources:
[Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
Proposition 5.2.5 (several conditions reduced to one), printed p. 137, and §5.2.3, Theorem 5.2.9
(the Hilbert–Dörge proof for `ℚ`), pp. 140–143;
Serre, *Topics in Galois Theory*,
Corollaries 3.2.2 and 3.2.4, printed pp. 22–23, and §3.4, Theorem 3.4.1, pp. 25–30, for Hilbertian
number fields and the thin-set formulation. *Needs:* *Hilbert subsets and Hilbertian fields*,
*Simultaneous avoidance for a finite polynomial family*, *Finite-extension permanence of Hilbertianity*;
GlobalNumberFields Layer 0.

*Lean:* `isHilbertian_of_numberField`, `hilbert_irreducibility` (the several-parameter form with an
arbitrary nonzero guard).

**Checks.**

- `Y² − T` has infinitely many nonsquare rational specializations over `ℚ`, for example every prime
  `t = p`.
- The number-field hypothesis is essential: over an algebraically closed field every specialization
  of `Y² − T` splits, so `ℂ` is not Hilbertian.
- `ℝ` is not Hilbertian: `Y² − (T² + 1)` is irreducible over `ℝ(T)`, but every specialization splits
  over `ℝ` because `t² + 1 > 0`.

**Rational function fields are Hilbertian.** For every field `K`, the rational function field
`K(T)` is Hilbertian, with no assumption on the characteristic or Hilbertianity of `K`.
Iteration gives `K(T₁, …, T_d)` for every `d ≥ 1`. Source: Fried–Jarden, *Field Arithmetic*,
third edition, Theorem 13.4.2; [Dèbes](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
§9.3, Théorème 9.3.1, printed pp. 246–249 (statement for every constant field, proof for infinite
constant fields, and the reference to the global-field argument for finite constant fields).
*Needs:* *Hilbert subsets and Hilbertian fields*; Mathlib `RatFunc`.

*Lean:* `isHilbertian_ratFunc`.

**Checks.**

- `𝔽₂(T)` is Hilbertian although its constant field `𝔽₂` is finite and not Hilbertian.
- `ℂ(T)` is Hilbertian although `ℂ` is algebraically closed and not Hilbertian.
- Applying the statement to `K = ℚ(T₁)` gives `ℚ(T₁, T₂)`; the case of no transcendental
  variables uses Hilbert's theorem for `ℚ` instead.

### IG.2.5 Thin sets and the integral count

**Thin sets for specialization.** Let `k` be a field of characteristic zero and `X` an integral
`k`-variety. A subset of `X(k)` is thin if it is contained in a finite union of sets of two types:
type I, the rational points `Z(k)` of a proper closed subvariety `Z ⊊ X`; type II, the image
`π(Y(k))` of a dominant, generically finite, separable morphism `π : Y → X` with `Y` integral and of
degree `[k(Y) : k(X)] ≥ 2`, so that `π` has no rational section over the generic point. The degree is
the degree of the function-field extension, not the size of a fibre. The full-group condition is
controlled by thin sets: for a Galois cover of an open subset of affine space with group `G`, the
parameters at which the specialization does not have the full group `G` lie in the union of a thin
set and the zero locus of the branch and coefficient guards. Prove that the rational
points of a proper closed subvariety form a thin set; that the image of the rational
points of a separable, generically finite integral cover of degree `≥ 2` is thin; that finite unions and subsets of thin sets are thin; and that the parameters
with non-full specialization lie in a thin set together with the displayed guard divisor. *Proof
sketch.* Construct the two kinds of thin data and their finite unions. For the full-group statement
use the quotient covers by proper subgroups of the generic Galois group: when the specialization at
`t` is not full, `t` is in the image of the rational points of one of these quotients, each of degree
`≥ 2`. Source: Serre, *Topics in Galois Theory*,
§3.1 Definitions 3.1.1/3.1.2 and §3.3, printed pp.19–27, for finite unions of the two types and
their Hilbert interpretation. *Needs:* *Hilbert subsets and Hilbertian fields*;
SchemeAndStackFoundations Layer 0.

**Checks.**

- The squares in `ℚ` form a thin set, the image of `z ↦ z²` on `𝔸¹`, of degree `[ℚ(z) : ℚ(z²)] = 2`;
  the fibre over `0` has one point, so a definition reading the degree off a fibre would misjudge it.
- `ℚ^r` is not thin for `r ≥ 1`, by *Hilbert irreducibility over number fields* (Serre, Theorem
  3.4.1); a definition admitting covers of degree one would make every set thin.
- The identity `𝔸¹ → 𝔸¹` has degree one and is not a type II datum; otherwise `ℚ` itself would be
  thin.
- Over `ℂ`, `z ↦ z²` is surjective on `ℂ`-points, so `𝔸¹(ℂ)` is thin: thinness of all rational points
  is the failure of the Hilbert property.

**The Lang–Weil estimate.** Let `K` be a number field with ring of integers `O`, `m ≥ 1`, and
`𝒱` a separated scheme of finite type over `O[1/m]` whose generic fibre `V` is geometrically
irreducible of dimension `d`. Then, as `v` runs over the finite places of `K` prime to `m`,

```text
|𝒱(κ(v))| = Nv^d + O(Nv^(d − 1/2)),
```

with an implied constant depending on `𝒱`. In particular `𝒱(κ(v))` is nonempty for all `v` of
large norm. Geometric irreducibility is essential. This target owns the reduction to curves and the
bounded-family argument; the bound for a single smooth proper curve is SchemeAndStackFoundations
§5.11 (`weil_bound`), consumed as stated there and not reproved. *Proof sketch.* Fibre `V` over a
lower-dimensional base by curves of bounded degree and genus, reducing to curves; for a geometrically
irreducible curve over `𝔽_q`, pass to the smooth proper model of its normalization, apply
`weil_bound` (`|C(𝔽_q) − q − 1| ≤ 2g√q`), and bound the difference with the original curve by the
number of singular and boundary points, which is bounded in the family; spread the constants over a
model of `V` over `O[1/m]`. Source: Serre, *Topics in Galois
Theory*,
Theorem 3.6.1, printed p.31, for the statement and the reduction to curves. *Needs:*
SchemeAndStackFoundations §5.11 (`weil_bound`); AlgebraicCurves Layers 3–5 and Layer 12 (normalization
and smooth proper models of curves); Supplied by EtaleCohomologyFoundations §F.10.1 /
`VanishingCycles.frobeniusFixedPoints`, `VanishingCycles.frobeniusCohomology` (Frobenius and
rational points as
fixed points); SchemeAndStackFoundations Layers 0 and 3.
Over the chosen finite field and closure, arithmetic Frobenius is `x↦x^q` and geometric Frobenius its
inverse; rational points are the fixed points of their matching powers.

**Checks.**

- For `𝒱 = 𝔸^d` the count is exactly `Nv^d`.
- For the conic `x² + y² = 1` over `ℤ[1/2]`, `|𝒱(𝔽_p)| = p − (−1/p)`, within `O(1)` of `p`.
- For `V = {x² = 2}` over `ℚ`, which is irreducible but not geometrically irreducible,
  `|𝒱(𝔽_p)|` is `0` or `2` according to `(2/p)`, never close to `Nv^0 = 1`; the hypothesis is needed.

**The integral thin-set count.** Let `r ≥ 1` and let `E ⊂ ℚ^r` be thin (as a subset of `𝔸^r(ℚ)`).
There is a real `C_E > 0`, depending on `E` through a fixed thin datum containing it, such that for
all integers `N ≥ 2`

```text
#{a ∈ E ∩ ℤ^r : |aᵢ| ≤ N for all i} ≤ C_E · N^(r − 1/2) · log N.
```

The proof is part of this layer: the reduction of the type II covers at good primes, a set of primes
of positive density at which a positive proportion of residue classes is omitted, and the large sieve
on a box. *Proof sketch.* A type I set lies in the zero set of a nonzero polynomial, whose integral
points in the box are counted directly. For each type II cover, extract a set of primes of positive
density at which the reduced cover omits at least a fixed positive proportion of `𝔽_p^r`, from the
Frobenius classes of the primes and point counts of the reduced cover over `𝔽_p` (Serre §3.6). Apply
the multidimensional large sieve on the box (Serre, Appendix §§10.1–10.4) with sieving primes up to
`N^(1/2)`, then sum the finitely many contributions and keep track of the constants. Sources:
Serre, *Topics in Galois Theory*,
§3.4 Theorem 3.4.4, printed p.27; §3.6 Theorem 3.6.2, pp.32–33; Appendix §§10.1–10.4, pp.103–107,
for the integral-box bound and the large sieve;
[Masser–Zannier](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf),
Proof of Lemma 5.1, p.659, citing Cohen and Serre's *Lectures on the Mordell–Weil theorem*, for the
quantitative form used there. *Needs:* *Thin sets for specialization*, *The Lang–Weil estimate*;
ClassFieldTheory Layer 10, ClassFieldTheory Layer 12; Chebotarev (primes of positive density with
prescribed Frobenius class).

**Checks.**

- For `r = 1` and `E` the squares, the box `[−N, N]` contains `⌊√N⌋ + 1` of them, which is
  `O(N^(1/2))` and within the bound; the exponent `r − 1/2` cannot be lowered for this `E`.
- The constant depends on `E`: `E = {1, …, M}` is thin (a proper closed subset of `𝔸¹`), and at
  `N = M` the count is `M`, so `C_E ≥ √M / log M`; no uniform constant over all thin sets exists.
- The condition `N ≥ 2` is needed: at `N = 1`, `log N = 0`, while the thin set `E = {0}` has one
  point in the box.

### IG.2.6 Full-group specialization

**Full-group specialization of regular covers.** Let `K` be a Hilbertian field of characteristic zero
and `L/K(T)` a finite Galois extension with group `G` in which `K` is algebraically closed. The
normalization of `ℙ¹_K` in `L` restricts to a geometrically connected finite étale `G`-cover of a
nonempty open `U ⊂ ℙ¹_K`. For infinitely many `t ∈ U(K)`, avoiding any prescribed finite set, the
fibre at `t` is `Spec L_t` for a field `L_t` Galois over `K` with `Gal(L_t/K) ≅ G`. The isomorphism
comes from the `G`-action on the cover and depends on the choice of a point of the fibre; changing
that point conjugates it. At any `t ∈ U(K)` whose fibre is connected, this conversion of the fibre
into a `G`-Galois field uses only the torsor criterion and no Hilbertian hypothesis; the hypothesis
serves to produce such `t`. For a defining polynomial of `L` over `K(T)`, the nonzero denominator,
discriminant and leading-coefficient guards are kept, and the full group cannot be inferred from
preservation of the degree. Every number field is Hilbertian (*Hilbert irreducibility over number
fields*), so the statement holds for number fields. *Proof sketch.* Build the finite étale
`G`-torsor over the complement of the branch locus, geometrically connected because `L/K(T)` is
regular. Choose a primitive element of `L` integral over the regular functions on `U`; its minimal
polynomial is irreducible and separable over `K(T)`, and at a parameter `t` in its Hilbert set
(also avoiding any finite set) its specialization is irreducible of
full degree `|G|`, so the fibre is connected; a connected `G`-torsor over `K` is the spectrum of a
`G`-Galois field. Pass to polynomial conditions with `RationalSpecialization.specialize`. Source:
Serre, *Topics in Galois Theory*,
§3.3 Proposition 3.3.1, printed p.23, for a Hilbertian field; §3.4 Theorem 3.4.1, p.25, for number
fields. *Needs:* *Hilbert subsets and Hilbertian fields*, *Hilbert irreducibility over number
fields* (number-field case), *Thin sets for specialization*, Layer IG.0 *Finite Galois algebras and
torsors*, EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*; SchemeAndStackFoundations Layer 0.

*Lean:* `IsHilbertian.infinite_full_group` states the polynomial form, including coefficient
regularity, degree and separability; it also allows a constant subextension.

**Checks.**

- The `C₂`-cover `Y² = T` over `ℚ` (with `U = 𝔾_m`) has full image at a nonsquare, for example the
  fibre `ℚ(√2)` at `t = 2`, and loses it at a square: at `t = 1` the fibre is `Spec(ℚ × ℚ)`; the
  branch point `t = 0` is outside `U`.
- Preservation of degree does not give the full group: `Y² − T` keeps degree two at `t = 4`, where
  it splits.
- For `G = 1`, `L = K(T)` and every fibre is `Spec K`, with `Gal(K/K) = 1 = G`.
- The Hilbertian hypothesis is needed: over `ℂ`, the regular `C₂`-extension `ℂ(T)(√T)` has split
  fibres `Spec(ℂ × ℂ)` at every `t ≠ 0`, so no fibre has the full group.

**Infinitely many linearly disjoint full-group fibers.** Under the hypotheses of *Full-group
specialization of regular covers*, with `K` a number field, for every finite extension `M/K` there
are infinitely many
`t ∈ U(K)` with `Gal(L_t/K) ≅ G` and `L_t` linearly disjoint from `M` over `K`. Moreover there is a
sequence `t₁, t₂, …` of such parameters whose fields are mutually linearly disjoint: each `L_{t_j}` is
linearly disjoint from the compositum of `M, L_{t_1}, …, L_{t_{j−1}}`. If `G ≠ 1` these fields are
pairwise distinct; if `G = 1` every `L_t` is `K`, and no infinite family of distinct extensions is
claimed. *Proof sketch.* Base-change the regular torsor along a Galois closure of `M`; regularity
keeps it geometrically connected. Apply the Hilbert condition for the full group after this base
change and compare the combined arithmetic group. Choose the parameters recursively, putting all
previous parameters and the compositum of the previous fields into the avoidance data. Source:
Serre, *Topics in Galois Theory*,
§3.3 Proposition 3.3.3 and Corollary 3.3.4, printed p.24; §3.4 Theorem 3.4.1, p.25. *Needs:*
*Full-group specialization of regular covers*, *Hilbert irreducibility over number fields*, Layer
IG.0 *Finite Galois algebras and torsors*.

*Lean:* `HasRegularRealization.exists_disjoint_realizations` states the field-realization
consequence: each member of a sequence is linearly disjoint from the prescribed extension and the
compositum of its predecessors.

**Checks.**

- For `Y² = T` over `ℚ` and `M = ℚ(√2)`, the fibre at `t = 3` is `ℚ(√3)`, linearly disjoint from `M`,
  while `t = 8` gives `ℚ(√8) = M` and must be avoided.
- For `M = ℚ(√2, √3)`, the fibre at `t = 6` is `ℚ(√6)`, distinct from `ℚ(√2)` and `ℚ(√3)` but contained
  in `M`: disjointness from a compositum is stronger than distinctness from its pieces, and the
  theorem excludes it for any fixed finite `M`.
- Regularity cannot be dropped: `L = ℚ(i)(T)` is Galois over `ℚ(T)` with group `C₂` but contains the
  constant field `ℚ(i)`, so every fibre contains `ℚ(i)` and none is disjoint from `M = ℚ(i)`.

**Hilbert specialization detected by the Frattini quotient.** Let `K` be a Hilbertian field of
characteristic zero, `U ⊂ 𝔸¹_K` a nonempty open, `P` a profinite group, and
`ρ : π₁^ét(U, x̄) → P` a continuous surjection. Assume that `Φ(P)`, the intersection of the maximal
proper open subgroups, is open. Put `Q = P/Φ(P)`. Construct the connected finite étale `Q`-torsor
`V → U` classified by the quotient of `ρ`, and its Hilbert subset
`H = {t ∈ U(K) : V_t is connected}`. For every `t ∈ H` with closed specialized image
`J_t = im(ρ_t) ≤ P`, prove `J_t = P`. Here `ρ_t : G_K → P` is restriction along the rational-point
section transported by a chosen étale path; continuity and compactness of `G_K` ensure closedness.
Changing the path conjugates the image and preserves the conclusion. The set `H` is infinite and
avoids any prescribed finite set. Geometric connectedness of `V` is not needed: connected finite
étale covers of the normal integral `U` are integral, as required by the Hilbert datum.
Openness of `Φ(P)` is an explicit hypothesis. For compact `P ≤ GL_n(E)` with `E/ℚ_ℓ` finite it is
supplied by ArithmeticGaloisRepresentations §6.4a, *Finite Frattini quotient of a compact matrix
group*; compactness alone does not imply it.
*Proof sketch.* The finite quotient of `ρ` gives a transitive `Q`-set and hence the connected
torsor. Membership in its Hilbert subset means that `G_K` acts transitively on the fibre, or
equivalently that `J_t → Q` is surjective. Apply the supplied closed-image detection theorem of
ArithmeticGaloisRepresentations §6.4a. Hilbertianity and the guarded polynomial comparison give
infinitude and finite avoidance for this integral cover. Source:
[Masser–Zannier](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf),
Proof of Lemma 5.1, published p.659 (specialization through a finite Frattini quotient).
*Needs:* *Hilbert subsets and Hilbertian fields*, *Hilbert irreducibility over number fields*;
Layer IG.0 *Finite Galois algebras and torsors*; EtaleCohomologyFoundations §§F.0, F.0.A2
(finite-cover classification and rational-point sections); ArithmeticGaloisRepresentations
§6.4a, *Frattini detection of full profinite image*.

**Checks.**

- For the `C₄`-cover `Y⁴ = T` over `K = ℚ(i)` on `𝔾_m`, `Φ(C₄) = C₂` and the detecting cover is
  `Z² = T`. At `t = 2` this quotient fibre is connected and the specialized group is `C₄`; at
  `t = 4` it splits and the specialized group is the proper `C₂`, which does not surject onto
  `C₄/Φ(C₄)`.
- A finite quotient whose kernel is not inside `Φ(P)` does not detect the full image: for
  `P = ℤ_p²` and the quotient onto `ℤ/p` by the first coordinate, the proper closed subgroup
  `ℤ_p × {0}` maps onto it.
- Openness of `Φ(P)` is what makes the detecting quotient finite: for `P = ∏_ℓ ℤ/ℓ` over all
  primes, the maximal open subgroups are the kernels of the projections and `Φ(P) = 1` is not open,
  so `P/Φ(P) = P` is infinite, and every finite quotient of `P` is hit by a proper closed subgroup,
  the kernel of the projection to a factor not involved in that quotient. Such a `P` does not
  satisfy the finite-cover hypothesis of this specialization target.
- The dense subgroup `ℤ ⊂ ℤ_p` maps onto `ℤ_p/pℤ_p` but is proper and not closed. It cannot be
  the image of a continuous representation of the compact absolute Galois group `G_K` in `ℤ_p`.

**A worked disjoint quadratic family.** Over `ℚ` take `Y² − T`. Its generic splitting field
`ℚ(T)(√T)` is a regular `C₂`-Galois extension of `ℚ(T)`, with branch points `0` and `∞` on `ℙ¹`. For
every prime `p` the fibre at `t = p` is `ℚ(√p)`, and `Y² − p` is separable and irreducible. Distinct
primes give distinct quadratic fields; the square classes of distinct primes `p₁, …, p_n` are
independent, so `ℚ(√p₁), …, ℚ(√p_n)` are mutually linearly disjoint and their compositum has degree
`2ⁿ`. The discriminant of `ℚ(√p)` is `p` when `p ≡ 1 (mod 4)` and `4p` otherwise (`8` for `p = 2`), so
the ramified primes are `p`, respectively `2` and `p`. At the real place, `p > 0` makes `ℚ(√p)` real,
so the real place splits. *Proof sketch.* Compute the square cover and its inertia at `0` and `∞`;
independence of the square classes follows from the `pᵢ`-adic valuations and gives the compositum
degrees. Ramification is read from the discriminant of the quadratic field and its places, not from
an irreducibility certificate. Source: Serre, *Topics in Galois Theory*,
§3.1–3.3, pp.19–27, the square-map example, of which this is an explicit specialization. *Needs:*
*Full-group specialization of regular covers*, *Infinitely many linearly disjoint full-group fibers*,
EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*; ClassFieldTheory Layer 10, ClassFieldTheory
Layer 12.

**Checks.**

- At a prime `p > 0` the fibre is `ℚ(√p)` with the real place split; at `t = 1` the fibre splits as
  `ℚ × ℚ`; `t = 0` is a branch point and excluded; at `t = −1` the fibre `ℚ(i)` has a nonsplit real
  place.
- The field discriminants are `5` for `ℚ(√5)`, `12` for `ℚ(√3)` and `8` for `ℚ(√2)`; the polynomial
  discriminant `4p` of `Y² − p` gives `20` for `p = 5`, so ramification cannot be certified from the
  polynomial alone.
- The compositum `ℚ(√2, √3, √5)` has degree `8`.

### IG.2.7 Weak approximation, local conditions and norm pullbacks

**Hilbert points with weak approximation.** Let `k` be a number field and `X` a smooth geometrically
integral `k`-variety with weak approximation for every finite set of places: `X(k)` is dense in
`∏_{v∈S} X(k_v)` for every finite `S`. Let `U ⊂ X` be a nonempty open and `H` a Hilbert subset of `U`
defined by finitely many integral finite étale covers. Then for every finite set `S` of places, every
nonempty product `∏_{v∈S} W_v` of open subsets `W_v ⊂ X(k_v)`, and every proper closed subset
`Z ⊊ X`, there is a point of `H(k)` in `∏_{v∈S} W_v` outside `Z`. More generally, if `X` has weak
weak approximation, that is weak approximation for every finite `S` disjoint from a fixed finite set
`S₀`, the same conclusion holds for every finite `S` disjoint from `S₀`. Weak approximation at the
prescribed set `S` alone does not suffice for the argument, which adds auxiliary places. No bound on
the height of the point is asserted. *Proof sketch.* The failure of connected fibres is a thin set,
by the resolvent covers attached to the finitely many proper subgroups of the Galois group of the
Galois closure; add the excluded closed set `Z`. Serre's Theorem 3.5.3 supplies auxiliary places
outside `S ∪ S₀` and a product of open sets at them avoiding this thin set; its step for type II
covers chooses primes splitting completely in the constant field of the Galois closure, and that
condition is kept. Apply weak approximation on the union of the prescribed and auxiliary places;
smoothness lets one avoid `X ∖ U` locally, and the resulting point lies in `H` and in every
prescribed neighbourhood. Sources: Serre, *Topics in Galois Theory*,
Theorem 3.5.3 and its proof, Lemma 3.5.5, Theorem 3.5.7; §§3.5–3.6 printed pp.28–33, for the
auxiliary-place argument and its constant-field splitting condition;
[Breuil–Conrad–Diamond–Taylor](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf), Proof
of Theorem 2.2.1, author final copy p.19 / published p.864, where the rational modular parameter
curve has weak approximation and the prescribed open is `3`-adic. *Needs:* *Hilbert subsets and
Hilbertian fields*, *Thin sets for specialization*, *The Lang–Weil estimate* (through Serre's
Propositions 3.5.1–3.5.2), *Full-group specialization of regular covers*;
ClassFieldTheory Layer 12, Chebotarev (primes splitting completely in a finite extension),
SchemeAndStackFoundations Layer 3.

**Checks.**

- For `X = 𝔸¹` over `ℚ`, `H` the nonsquare Hilbert subset of `Y² = T` and `S = {∞}`, every open
  interval of positive reals contains a rational nonsquare.
- Smooth `k`-rational varieties have weak approximation for every finite set of places and satisfy
  the hypotheses.
- A variety known to have weak approximation only at the prescribed `S` gives no approximation at
  the auxiliary primes the proof adds, so it is not covered.

**Hilbert specialization with local conditions.** Let `K` be a number field, `H ⊂ 𝔸^r_K` a Hilbert
subset and `S` a finite set of places of `K`. Then `H(K)` is dense in `∏_{v∈S} 𝔸^r(K_v)`. In
particular every nonempty product of open subsets of the `K_v^r`, `v ∈ S`, contains a point of `H(K)`
at which any given nonzero polynomial guard does not vanish; for the Hilbert subset of a regular
`G`-cover as in *Full-group specialization of regular covers* this gives full-group specializations
with prescribed local behaviour. The statement is for affine parameter space; weak approximation on
an arbitrary variety is not assumed. Breuil–Conrad–Diamond–Taylor use this statement, citing
Ekedahl's effective Hilbert irreducibility theorem (Theorem 1.3), on a rational modular parameter
line with a `3`-adic open condition. *Proof sketch.* Apply *Hilbert points with
weak approximation* to `X = 𝔸^r`, which has weak approximation for every finite set of places, taking
`Z` to be the zero locus of the guard; the complement of the Hilbert condition is thin. Prescriptions
on the local algebras `L_t ⊗_K K_v` are open conditions on `t`, because the isomorphism type of the
finite étale fibre with its `G`-action is locally constant in `t ∈ U(K_v)`; at finite places this is
Krasner's lemma (Mathlib `IsKrasner`), and it is a separate geometric step of the proof. Sources:
[Breuil–Conrad–Diamond–Taylor](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf),
Theorem 2.2.1 proof, author PDF p.19 / published p.864, citing Ekedahl Theorem 1.3, where local
Hilbert conditions, not irreducibility alone, are needed;
Serre, *Topics in Galois Theory*,
§3.5 Theorems 3.5.3 and 3.5.7, printed pp.28–30, for density in every finite product of local opens.
*Needs:* *Hilbert irreducibility over number fields*, *Full-group specialization of regular covers*,
*Hilbert points with weak approximation*; GlobalNumberFields Layers 0 and 1 (places, completions and
weak approximation); Mathlib `IsKrasner`.

**Checks.**

- Nonsquares occur in every nonempty finite product of local parameter opens: for `Y² − T` over `ℚ`
  and the open set `{t > 0} × (1 + 8ℤ₂)` at `S = {∞, 2}`, all of whose points are local squares, the
  rational nonsquare `t = 17` lies in it, and `ℚ(√17)` is real and split at `2`.
- Nonempty open conditions and a genuine Hilbert condition are needed: the closed condition `t = 4`
  is a nonempty local prescription, and it forces `Y² − 4` to split.

**Hilbert pullback through geometrically integral norm maps.** Let `b : Q′ → Q` be the norm map
between quasi-trivial tori in the construction of Harpaz–Wittenberg §4.2, over the number field `k`,
whose generic fibre is geometrically integral, and let `H ⊂ Q` be a Hilbert subset. Then there is a
Hilbert subset `H′ ⊂ Q′` with `H′ ⊂ b⁻¹(H)` as sets of scheme points and, in that construction,
`H′(k) = b⁻¹(H)(k) = {y ∈ Q′(k) : b(y) ∈ H}`. Membership is tracked at all scheme points through
connected fibres over residue fields; equality of the scheme-point sets does not follow from the
equality of rational points and is not asserted. The pullback for a general morphism needs a
geometrically integral generic fibre and the shrinking of the open domain described in the proof.
*Proof sketch.* Pull the cover data of `H` back to the generic fibre of `b`, where geometric
integrality keeps each pulled-back cover integral; shrink the domain until every pullback is finite
étale and integral, and compare fibres: at a rational point `y` the fibre of a pulled-back cover is
the fibre of the original cover at `b(y)`, and at any point a disconnected fibre at `b(y)` stays
disconnected over `κ(y)`, which gives the inclusion. Use the explicit torus construction of the norm
map and its field embeddings. Source: [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
§4.2 Theorem 4.2 and Lemmas 4.3–4.4, arXiv v2 pp.16–17, especially the Hilbert pullback step on
p.17. *Needs:* *Hilbert subsets and Hilbertian fields*; ReductiveGroupsPartII Layer RG2.0a (Weil
restriction and norm tori), SchemeAndStackFoundations Layer 0.

**Checks.**

- For the identity map `Q′ = Q`, the Hilbert subset is unchanged.
- Geometric integrality of the generic fibre cannot be dropped: for `z ↦ z²` on `𝔾_{m,ℚ}`, whose
  generic fibre `Spec ℚ(T)(√T)` is integral but, being a quadratic extension of `ℚ(T)`, splits over
  an algebraic closure of `ℚ(T)`, and `H` the nonsquare Hilbert
  subset of `Y² = T`, the preimage `b⁻¹(H)` has no rational point, whereas every Hilbert subset of
  `𝔾_{m,ℚ}` has rational points.
- Rational-point equality does not give scheme-point equality: for the projection
  `𝔾_m² → 𝔾_m`, `(x, s) ↦ x`, over `ℚ` and the same `H`, the closed point `x = 2, s² = 2` lies in
  `b⁻¹(H)`, but the pulled-back fibre over it is `ℚ(√2)[Y]/(Y² − 2)`, which is disconnected.

### IG.2.8 Normal subgroups of absolute Galois groups

**Weissauer's Hilbertian extension theorem.** Let `K` be a Hilbertian field of characteristic
zero, `M/K` an algebraic Galois extension, possibly infinite, and `L/M` a finite extension with
`1 < [L : M]`. Then `L` is Hilbertian. This arithmetic input is built here, including the
root-avoidance form used in its proof: for any finite family of polynomials in `L(T)[Y]` with
no root in `L(T)`, there are infinitely many regular specializations having no root in `L`.
For this form the polynomials have positive degree and are separable in `Y`.

*Proof sketch.* Use the root-avoidance criterion for Hilbertianity, proved here by applying it to
resolvent polynomials for proper subsets of the roots of an irreducible polynomial. Descend the
coefficients of the finite family and a primitive element for `L/M` to finite extensions of `K`.
Develop the conjugate-polynomial construction in the proof of Weissauer's theorem: Galois
normality of `M/K` and an element of `L` outside `M` allow Hilbert specialization over the finite
base to exclude roots in `L`, rather than only in that finite base. Keep the finite family and
finite avoidance set throughout; the properness hypothesis is essential to this step. Convert
root avoidance for the resolvents back to irreducibility, retaining denominators and degrees.
Finite-extension permanence is supplied by IG.2.4 *Finite-extension permanence of Hilbertianity*.
Source: Fried–Jarden, *Field Arithmetic*, third edition, §§13.2–13.3 and §13.9,
Theorem 13.9.1(b); the theorem's algebraic-Galois, proper-finite-separable hypotheses are also
stated in [Jarden, *Almost locally free fields*](https://www.math.tau.ac.il/~jarden/Articles/paper99.pdf),
Proposition 2.5 and its proof, pp. 7–8. *Needs:* *Hilbert subsets and Hilbertian fields*,
*Hilbert irreducibility over number fields*, IG.2.4 *Finite-extension permanence of Hilbertianity*;
Mathlib finite-extension, primitive-element and infinite Galois theory.

**Checks.**

- With `M = K = ℚ` and `L = ℚ(√2)`, this gives the finite-extension permanence theorem.
- Properness cannot be omitted: `M = ℚ̄` is Galois over the Hilbertian field `ℚ` but is not Hilbertian.
- Let `M = ℚ(μ_{2^∞})` and `L = M(∛2)`. Then `[L : M] = 3`: `M/ℚ` is abelian and cannot contain
  the nonnormal cubic field `ℚ(∛2)`. Thus `L` is Hilbertian although it is not finitely generated
  over `ℚ`.

**Independent quadratic characters of Hilbertian fields.** Let `F` be a Hilbertian field of
characteristic zero, with no finite-generation assumption on `F`. For each `r ≥ 0` there are
`a₁, …, a_r ∈ F^×` whose square classes are independent: no nonempty subproduct is a square.
Consequently `Γ_F` has a continuous quotient `C₂^r` for every `r`, and is not topologically
finitely generated.

*Proof sketch.* Given independent square classes, take representatives `b` for their finite
span and specialize simultaneously the irreducible polynomials `Y² − bT`, including `b = 1`.
Irreducibility of all specializations places the new class outside that span. The Kummer
extensions then have compositum of degree `2^r`, giving independent continuous quadratic
characters. A profinite group generated topologically by `d` elements has at most `2^d`
continuous homomorphisms to `C₂`, since their values on those generators determine them.
Sources: Fried–Jarden, *Field Arithmetic*, third edition, Proposition 16.11.6 and Chapter 13;
Mathlib Kummer and finite Galois theory. *Needs:* *Hilbert subsets and Hilbertian fields*;
Layer IG.0 *Finite Galois algebras and torsors*; ProfiniteProPGroups Layer 3 (topological generators).

**Checks.**

- In `ℚ`, any finite list of distinct primes has independent square classes.
- The conclusion applies to the infinite algebraic field `ℚ(μ_{2^∞})(∛2)` from the preceding target;
  it is not restricted to number fields or fields finitely generated over `ℚ`.
- In `ℝ`, only two square classes occur and `Γ_ℝ = C₂` is finitely generated; `ℝ` is not Hilbertian.

**Normal subgroups of absolute Galois groups.** Let `k` be a field finitely generated over `ℚ` and
`Γ_k` its absolute Galois group. Every closed normal subgroup `N ⊴ Γ_k` that is topologically finitely
generated is trivial. Choose a transcendence basis of `k/ℚ`; `k` is finite over the resulting
rational function field. Its Hilbertianity follows from *Rational function fields are Hilbertian*
when the basis is nonempty, from *Hilbert irreducibility over number fields* when it is empty,
and from *Finite-extension permanence of Hilbertianity*. The conclusion is the case of fields
finitely generated over `ℚ` of Fried–Jarden,
Proposition 16.11.6; Hilbert irreducibility alone is not its proof.

*Proof sketch.* Suppose `N ≠ 1`. A finite continuous quotient separating a nonidentity element
provides a proper open subgroup `H < N`. Put `M = (k^sep)^N` and `L = (k^sep)^H`. Infinite
Galois correspondence identifies `M/k` as Galois and `[L : M] = [N : H] > 1`, and identifies
`Γ_L` topologically with `H`. Use Mathlib's
`InfiniteGalois.IntermediateFieldEquivClosedSubgroup`, `InfiniteGalois.normal_iff_isGalois`
and `InfiniteGalois.isOpen_iff_finite`, over `k` and over `M`; the fixed-field subgroup
identifications and their Krull-topology compatibility are part of this target's interface.
Weissauer makes `L` Hilbertian. The open-subgroup theorem
`TauCeti.IsTopologicallyFinitelyGenerated.of_openSubgroup` makes `H` finitely generated, whereas
*Independent quadratic characters of Hilbertian fields* makes `Γ_L` not finitely generated,
a contradiction. No assumption that `M` or `L` is finitely generated over `ℚ` enters this argument.
Source: [Schmidt–Stix](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf),
Theorem 7.1 proof, published p. 850, citing Fried–Jarden, Proposition 16.11.6;
Fried–Jarden, Theorem 13.9.1(b). *Needs:* *Rational function fields are Hilbertian*,
*Hilbert irreducibility over number fields*, *Finite-extension permanence of Hilbertianity*,
*Weissauer's Hilbertian extension theorem*,
*Independent quadratic characters of Hilbertian fields*; Mathlib infinite Galois correspondence;
ProfiniteProPGroups Layers 0 and 3, with the pinned open-subgroup theorem above.

*Lean:* `normal_subgroup_absoluteGaloisGroup_eq_bot`, with `Algebra.EssFiniteType ℚ K` expressing
finite generation of the field extension.

**Checks.**

- The trivial subgroup satisfies the conclusion.
- An open subgroup is not a counterexample: `Γ_{ℚ(i)}` is closed and normal of index two in `Γ_ℚ`,
  but `ℚ(i)^×/ℚ(i)^{×2}` is infinite, so it is not topologically finitely generated.
- Normality is needed: the subgroup of `Γ_ℚ` generated by a complex conjugation is closed, of order
  two, and not normal.
- The hypothesis on `k` is needed: `ℝ` is not finitely generated over `ℚ`, and `Γ_ℝ ≅ ℤ/2` is a
  nontrivial finitely generated closed normal subgroup of itself.

### Examples

- The family `Y² − T` over `ℚ` runs through the whole layer. Its coefficients are polynomials, so
  `D = 1`, its guard is `1`, and every `t` is a regular, degree-preserving parameter;
  `spₜ(Y² − T) = Y² − t`. On `𝔾_m` its Hilbert subset consists of the rational nonsquares together with all scheme
  points whose fibre is connected; the complement in `ℚ` is the thin set of squares, of which
  `⌊√N⌋ + 1` lie in `[−N, N]`. The specialization has full group `C₂` exactly at the nonsquares; at
  the primes it gives the mutually linearly disjoint fields `ℚ(√p)`, with compositum of degree `2ⁿ`
  for `n` primes; and with the local prescription `{t > 0} × (1 + 8ℤ₂)` the parameter `t = 17` gives
  the real quadratic field `ℚ(√17)`, of discriminant `17`, in which `2` splits.
- Degree loss: `TY + 1` has guard `T` and `sp₀(TY + 1) = 1`; over `𝔽₂`, `(T² − T)Y + 1` loses degree
  at every parameter, which is why *Simultaneous avoidance for a finite polynomial family* needs an
  infinite field.
- Pole arithmetic at `t = 0` over `ℚ`: `C(T)·C(T⁻¹) = 1` and `C(T⁻¹) + C(1 − T⁻¹) = 1` both
  specialize to `1`, while the products and sums of the specialized factors are `0`; this is why the
  ring laws carry regularity hypotheses.
- Non-Hilbertian fields: over `ℂ` every specialization of `Y² − T` splits and `𝔸¹(ℂ)` is thin; over
  `ℝ` every specialization of `Y² − (T² + 1)` splits.
- For a family with image `P = ℤ_ℓ`, connected fibres of the detecting `ℤ/ℓ`-cover give full
  specialized image by ArithmeticGaloisRepresentations §6.4a. For `P = ∏_ℓ ℤ/ℓ` the Frattini
  subgroup is trivial and not open, so the finite-cover specialization target does not apply.

### Dependencies

IG.2.1–IG.2.3 use only Mathlib and Tau Ceti: `RatFunc` with its reduced numerator and denominator
and its total evaluation, `Polynomial` (`sum`, `map`, `toSubring`, `eval_prod`, the degree lemmas and
`finite_setOfPred_isRoot`), `Subring` and `Set.Finite`, and the valuation ring of Tau Ceti's finite
place of `K(T)` at `T − t`. Hilbert subsets use EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`
for finite étale covers and their fibres and SchemeAndStackFoundations Layer 0 for scheme points,
residue fields and fibre products; full-group specialization uses Layer IG.0 *Finite Galois algebras
and torsors* and EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*. The arithmetic theorems
use GlobalNumberFields Layers 0 and 1 for number fields, their places, completions and weak
approximation, ClassFieldTheory Layers 10–12 for the global class-field input, and Chebotarev for
primes of positive density with prescribed Frobenius, in the
integral count and in the auxiliary places of weak approximation; Mathlib's `IsKrasner` gives local
constancy of local fibres at finite places, and SchemeAndStackFoundations Layer 3 (curves,
divisors and Picard objects) enters the weak-approximation theorem. The Lang–Weil estimate takes
the Weil bound for a single curve from SchemeAndStackFoundations §5.11 (`weil_bound`) and owns only
the reduction to curves. The norm pullback uses ReductiveGroupsPartII Layer RG2.0a for Weil
restriction and norm tori. Hilbert specialization detected by the Frattini quotient uses the
Hilbert-subset and finite-torsor interfaces of IG.0 and IG.2 and the closed-image detection supplied
by ArithmeticGaloisRepresentations §6.4a; openness is assumed, with its compact-matrix case supplied
by the separate theorem in that section. The normal-subgroup theorem uses Mathlib infinite Galois correspondence and
ProfiniteProPGroups Layers 0 and 3, together with the Weissauer and independent-quadratic-character
targets of IG.2.8.

## Layer IG.3: branch cycles, rigidity, braid orbits and lifting invariants

A finite cover of the complex projective line branched over `r` points is the same thing as a
tuple of `r` elements of its monodromy group with product one. This layer makes that dictionary
precise for punctured curves, then studies the tuples themselves: branch tuples and Nielsen classes,
the Hurwitz action of the braid group, the monoid of braid orbits, exterior epimorphisms and
`T`-systems. On the arithmetic side it proves the rigidity criterion and computes the obstruction
separating the field of moduli of a cover from a field of definition. Its second half builds the
group theory of lifting invariants: reduced Schur covers, the universal marked central extension
`U(G, c)` of a group with a conjugacy-invariant generating set, its kernel, the action of units by
corrected powers and the cyclotomic twist, and with them the lifting invariant of a braid orbit,
which classifies braid orbits of generating tuples once every class multiplicity is large. Layers
IG.4 and IG.5 use these invariants for number fields and for components of Hurwitz spaces.

Conventions particular to this layer. Permutations compose from right to left. The ordered product
of a tuple `(g₁, …, g_r)` is `g₁ g₂ ⋯ g_r`; product one and generation are separate conditions on a
raw tuple. The positive Hurwitz move replaces an adjacent pair `(a, b)` by `(a b a⁻¹, a)`. Inner
classes divide by simultaneous conjugation in `G`; absolute classes divide by the normaliser of a
specified faithful permutation representation; `T`-systems divide generating homomorphisms from a
free group `F_r` by `Aut(F_r) × Aut(G)`. Throughout, `c ⊂ G` is a conjugacy-invariant subset, `D = c/G` its set of
conjugacy classes, and `M(G) = H₂(G, ℤ)` the Schur multiplier, Mathlib's `groupHomology.H2` of the
trivial module `ℤ`. The BelyiMaps roadmap writes its triples in the order `τ_∞ τ₁ τ₀ = 1`; Layer
IG.6 transports that convention to the present one.

### IG.3.1 Riemann existence for curves and the topological input

The targets below are the forms of Riemann existence and of the comparison between topological and
étale fundamental groups that the branch-cycle and Hurwitz-space arguments use.

**Riemann existence for punctured curves.** Let `C` be a smooth connected projective curve over `ℂ`,
`D ⊂ C` a finite set of points and `U = C ∖ D`, with base point `b ∈ U(ℂ)`. Connected finite étale
covers of `U` correspond to transitive actions of `π₁^top(U(ℂ), b)` on finite sets, compatibly with
fibres at `b` and with pullback; each such cover extends uniquely, by normalisation of `C` in its
function field, to a finite branched cover of `C`, and the ramification index at a point over
`P ∈ D` is the length of the cycle of the loop around `P` on the corresponding orbit. For
`C = ℙ¹` and `|D| = 3` this specialises to the Belyi dictionary of BelyiMaps Layers 0–6, which this
target does not rebuild. *Proof sketch.* ComplexComparisonPartII §C6.2 / `riemannExistence`
identifies finite étale covers
of `U` with finite topological covers of `U(ℂ)`; classify the latter by finite `π₁^top`-sets; extend
over each puncture by the local model `z ↦ z^e` of a finite cover of a punctured disc and normalise.
Source: [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XII, Theorem 5.1 and Corollary 5.2,
pp. 251–253. *Needs:* Supplied by ComplexComparisonPartII §C6.2 / `riemannExistence`;
ComplexComparisonPartII §C4.5 (`affineCurveCompletionInterface` and the connectedness comparisons);
AlgebraicCurves Layer 8; BelyiMaps Layers 5–6.
Riemann existence uses finite-type complex schemes and the shared fibre/deck convention.

**Checks.**

- For `U = 𝔾_m`, the connected covers of degree `n` correspond to the transitive actions of
  `π₁^top = ℤ` on `n` points, a single class, realised by `z ↦ z^n` with ramification `n` at `0`
  and at `∞`.
- For `U = ℂ` (one puncture at `∞`) there is no nontrivial connected cover, matching
  `π₁^top(ℂ) = 1`.

**Finitely many covers of bounded degree.** Let `X` be a connected smooth quasi-projective variety
over an algebraically closed field `k` of characteristic zero. Then `π₁^ét(X)` is topologically
finitely generated, and for each `d ≥ 1` there are only finitely many connected finite étale covers
of `X` of degree at most `d` up to isomorphism over `X`. Over `ℂ`, the image of
`π₁^top(X(ℂ))` in `π₁^ét(X)` is dense; density is all that is claimed, since injectivity would need
residual finiteness, which is not asserted for arbitrary `X`. *Proof sketch.* Over `ℂ`, `X(ℂ)` has
the homotopy type of a finite CW complex, so `π₁^top` is finitely generated; by Riemann existence
`π₁^ét` is its profinite completion. A connected cover of degree `n ≤ d` is a conjugacy class of
subgroups of index `n`, detected by a homomorphism to `S_n` determined by the images of the finitely
many generators. For general `k`, embed a model over a finitely generated field into `ℂ` and use
invariance under algebraically closed base extension. Sources:
[Gao–Habegger](https://arxiv.org/pdf/1801.05762v3),
Lemma B.2 and its proof, p. 58; [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XII,
Corollary 5.2, pp. 252–253. *Needs:* Layer IG.1 *Invariance under algebraically closed base
extension in characteristic zero*; Supplied by ComplexComparisonPartII §§C6.0, C6.2 /
`complexAlgebraicTopology`, `riemannExistence`; ProfiniteProPGroups Layer 0.
Global finite CW type uses separated finite type, and Riemann existence uses the shared fibre/deck convention.

**Checks.**

- For `X = 𝔾_{m,ℂ}` there is exactly one connected cover of each degree, so the count up to degree
  `d` is `d`.
- For `X = ℙ¹ ∖ {0, 1, ∞}` the connected covers of degree `≤ d` correspond to transitive actions
  of the free group of rank two on at most `d` points up to conjugation, a finite set; without the
  degree bound there are infinitely many.

**Artin neighbourhoods are `K(π, 1)`.** Let `X` be a smooth complex variety and `x ∈ X`. There is a
Zariski open neighbourhood `U` of `x` reached by a finite tower of elementary fibrations, each with
smooth affine curve fibres. For such `U`, the space `U(ℂ)` is a `K(π, 1)`: `π_i(U(ℂ)) = 0` for every
`i ≥ 2`, while `π₁` may be large. The neighbourhood and its tower are part of the data; an arbitrary
smooth open subset is not asserted to be a `K(π, 1)`. Define Artin neighbourhoods of `x` in `X` as data recording
that the chosen point lies in the open set and the
tower of elementary fibrations with affine curve fibres and finite étale boundaries, and prove
the vanishing of higher homotopy groups, stated as Tau Ceti's
`TauCeti.IsAspherical` for `U(ℂ)`.

Provides the group-to-topological cohomology comparison for the constructed Artin neighbourhood.
Supplied by ClassifyingSpaces §Stage 4 / item 17, Homology (including cohomology with local
coefficients).
Convention gap: this roadmap transports the chosen fundamental group through a CW model supplied
by ComplexComparisonPartII §C6.0 / `complexAlgebraicTopology` and the supplier's
deck-group/opposite-`π₁` convention, then specializes
the module coefficients to finite abelian `A` with trivial action.

Provides the finite-coefficient topological-to-étale cohomology comparison used in the same
neighbourhood. Supplied by ComplexComparisonPartII §C6.3 / `artinComparison`.
Convention gap: this roadmap restricts the finite-type complex comparison to `U` with the constant
finite coefficient sheaf `A` and composes it with the group/topological comparison in the direction
`H^i(π₁(U(ℂ)), A) → H^i(U(ℂ), A) → H^i_ét(U, A)`.

*Proof sketch.* The elementary fibrations are ComplexComparisonPartII §C6.3 / `artinComparison`;
induct on the length of
the tower using the long exact homotopy sequence of each fibration, whose fibres are punctured
curves with contractible universal covers. Source: [Landesman–Litt](https://arxiv.org/pdf/2205.15352v4),
proof of Lemma 2.3.3, p. 16, which uses SGA 4, Exposé XI, §4.6 for the neighbourhood construction.
*Needs:* Supplied by ComplexComparisonPartII §§C6.0, C6.3 / `complexAlgebraicTopology`, `artinComparison`;
ComplexComparisonPartII §C−1.1;
SchemeAndStackFoundations Layer 3; AlgebraicTopology Stages 5 and 8 (fibrations and homotopy groups);
Tau Ceti `TauCeti.IsAspherical`; the group/topological comparison in
*Exact supplier contracts / From topology roadmaps* and the finite-coefficient
Artin comparison in *Exact supplier contracts / From ComplexComparisonPartII*.
Global finite CW type uses separated finite type; the finite-type complex Artin contract supplies elementary fibrations and the constant finite abelian comparison.

**Checks.**

- A smooth affine curve is an Artin neighbourhood of each of its points, with a tower of length one
  over a point, and `𝔾_m(ℂ) ≃ S¹` is a `K(ℤ, 1)`.
- `ℙ¹` is not a `K(π, 1)` (`π₂ = ℤ`) and is not an Artin neighbourhood; the construction must
  produce an affine open subset, not accept the whole variety.
- For the constructed neighbourhood `U = 𝔾_m`, composing the supplied comparisons identifies
  `H¹(π₁, ℤ/n) = ℤ/n = H¹_ét(𝔾_m, ℤ/n)`, the Kummer classes, testing the coefficient and
  fundamental-group transports.

**Topological fundamental groups of curves are dense.** For a smooth connected complex curve `U`,
possibly punctured, the natural map `π₁^top(U(ℂ)) → π₁^ét(U)` has dense image: by
Riemann existence the target is the profinite completion of the source. Consequently a continuous homomorphism from `π₁^ét(U)` to a Hausdorff
topological group has finite image as soon as its restriction to `π₁^top(U(ℂ))` has finite image;
*Proof sketch.* Identify the completion map by
Riemann existence; the image of
the dense subgroup lies in a finite, hence closed, subset of the Hausdorff target, which then
contains the image of the whole group by continuity. Source: [Landesman–Litt](https://arxiv.org/pdf/2205.15352v4),
§9.1, p. 47, citing SGA 1, Exposé XII, Corollary 5.2. *Needs:* *Riemann existence for punctured
curves*; ComplexComparisonPartII §C−1.1; ProfiniteProPGroups Layer 0.

**Checks.**

- For `U = 𝔾_m`, `ℤ → ẑ` is injective with dense image.
- A continuous homomorphism `ẑ → GL_n(ℚ_p)` whose restriction to `ℤ` has finite image has finite
  image, by density; the projection `ẑ → ℤ_p` already has infinite image on `ℤ`.
- For a proper genus-two complex curve, the map from its surface group to the étale group is
  dense, and the same finite-image consequence applies without a residual-finiteness input.

### IG.3.2 Branch tuples, Nielsen classes and braids

**Branch tuples and Nielsen classes.** For a finite group `G` and `r ≥ 0`, a branch tuple is a
function `Fin r → G`. Its ordered product, the subgroup `H = ⟨g₁, …, g_r⟩` it generates and its
class multiplicities are separate data. A sphere Nielsen tuple has product one; the corresponding
`G`-cover is connected exactly when `H = G`. For specified conjugacy classes `C₁, …, C_r` impose
`g_i ∈ C_i`. The inner Nielsen class divides by simultaneous conjugation in `G`; for a chosen faithful
permutation representation, given as an isomorphism `e : G ≃ P` onto a subgroup `P ≤ S_d`, the
absolute Nielsen class divides by the normaliser of `P` in `S_d`, with the class conditions
transported. Faithfulness is part of the input: through a representation with a kernel the
normaliser relation would identify tuples with different products and generated subgroups. An
unramified puncture may carry the identity. Disc
tuples allow an arbitrary boundary product, read on `ℙ¹` as the inverse of the inertia at infinity.
Define `BranchTuple r G`, `BranchTuple.product`, `BranchTuple.generated` and the inner and absolute
Nielsen classes, with the API: `BranchTuple.product` uses the fixed order and the empty
product is `1`; `BranchTuple.generated` is the closure of the set of entries; the inner Nielsen class
is the quotient by simultaneous conjugation and preserves product one and generation;
the absolute Nielsen class uses the chosen faithful permutation representation `e : G ≃* P` and the
normaliser of `P`, not `Aut(G)` without that datum, and absolute
equivalence preserves product one and generation. *Proof sketch.* The data are functions on `Fin r`
and subgroup closures; construct the two quotients as quotients by group actions and descend the
invariants; for the absolute quotient, conjugation by an element of the normaliser restricts to an
automorphism of `P`, hence through `e` to an automorphism of `G`. Sources:
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§§2.1–2.3, pp. 738–741; [Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
§3, pp. 4–5. *Needs:* *Riemann existence for punctured curves*; Mathlib `Subgroup.closure`,
`List.prod`, `MulAut.conj`.

**Checks.**

- In an abelian target, two inner Nielsen classes agree exactly when the tuples agree;
  dividing by all target automorphisms would identify additional tuples.
- For the regular representation `C₃ ≅ A₃ ≤ S₃`, let `c` generate `C₃`. The tuples `(c)` and
  `(c⁻¹)` agree absolutely: a transposition normalises `A₃` and inverts its `3`-cycle.
  They are distinct inner classes because conjugation in `C₃` is trivial and `c ≠ c⁻¹`.
- The trivial action of `C₂` on one point is not a faithful representation and is not an admissible
  input: `C₂` is not isomorphic to a subgroup of `S₁`. Through it every pair of tuples would be
  related, including a generating and a nongenerating one.
- The empty tuple has product `1` and generates the trivial subgroup.
- In `S₃` the tuple `((12), (12))` has product one but generates `C₂`, not `S₃`, so product one does
  not imply generation.
- `((12), (23), (132))` has product one and generates `S₃` with right-to-left composition, since
  `(12)(23) = (123)`; with left-to-right composition the product would be `(132)(132) ≠ 1`.

**The Hurwitz braid action.** The Artin braid group `B_r` (Tau Ceti `TauCeti.BraidGroup`) acts on
`G^r` on the left, the generator `σ_i` replacing the adjacent pair `(g_i, g_{i+1}) = (a, b)` by
`(a b a⁻¹, a)`, with inverse `(a, b) ↦ (b, b⁻¹ a b)`. These moves satisfy far commutativity and the
braid relation, so they define an action, which descends to inner Nielsen classes and preserves the
ordered product exactly, the generated subgroup exactly, and the multiset of conjugacy classes. For
ordered distinct class conditions use the pure (colour-preserving) braid subgroup, since the full
braid group permutes the order of the classes. The geometric half-twist of
Ellenberg–Venkatesh–Westerland may correspond to the inverse generator; the comparison with the
present convention is part of this target. Define the `i`-th Hurwitz move, its inverse, the
move as a permutation of `BranchTuple r G` for `i : Fin (r - 1)`, and the Hurwitz action as a
homomorphism `TauCeti.BraidGroup r →* Equiv.Perm (BranchTuple r G)`. The move replaces the two
affected entries by `aba⁻¹` and `a`, and its inverse is `(a, b) ↦ (b, b⁻¹ab)`. Prove that the
generator `σ_i` acts by the `i`-th move, and that the ordered product is
unchanged (not merely up to conjugacy), the generated subgroup
is unchanged, and the multiset of conjugacy classes is unchanged.
*Proof sketch.* Check the braid
relation on three adjacent coordinates and commutation for disjoint pairs; define the action through
the presentation of `B_r`; match the chosen oriented path in configuration space with the half-twist.
Sources: [Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
§3, pp. 4–5; [Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§§2.1–2.2, pp. 738–740. *Needs:* *Branch tuples and Nielsen classes*; Tau Ceti `TauCeti.BraidGroup`.

**Checks.**

- For `a = (12)` and `b = (23)` in `S₃` the move gives `((13), (12))`, not the plain swap
  `((23), (12))`; both tuples have product `(123)`.
- Applying a move and then its inverse returns the original tuple.
- A full braid generator exchanges the positions of two distinct classes, so fixed ordered class
  conditions are preserved only by the pure braid group.

**The braid-orbit monoid.** For a conjugacy-invariant subset `c ⊂ G`, take all `c`-valued tuples of
every length, divide each length by the braid group, and multiply by concatenation. This is an
associative unital graded monoid, including the empty tuple and non-generating tuples. The ordered
product and generated subgroup of a representative are invariants; a tuple with product one is
central in this monoid. The generating locus is preserved by braid moves but is not the whole
monoid. Define the braid-orbit monoid of `(G, c)` and prove that multiplication is represented
by concatenation, that the empty tuple is a two-sided unit,
that length and class multiplicities are additive, and
that a block of product one commutes with every orbit. *Proof
sketch.* Block braids make concatenation well defined and associative. Moving a block past a tuple
by Hurwitz moves conjugates the tuple by the block's product, which is trivial for a product-one
block. Sources: [Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§3.3 and Proposition 3.4, pp. 743–745; [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), proof of Theorem 3.1,
pp. 5–6. *Needs:* *The Hurwitz braid action*.

**Checks.**

- The empty tuple is in the monoid for every `G`, including nontrivial `G`.
- If `1 ∈ c`, adjoining an identity entry raises the length by one without changing the generated
  subgroup; if `1 ∉ c` such a tuple is not `c`-valued.
- In `S₃` with `c` the transpositions, `((12), (12), (12))` is in the monoid although it generates
  only `C₂`; a definition restricted to generating tuples would not be closed under the operations
  used below.

**Exterior epimorphisms and `T`-systems.** For a finite group `G` and the free group `F_r` on `r`
generators, generating `r`-tuples of `G` are the surjective homomorphisms `F_r → G`. Exterior
epimorphisms are their classes modulo `Inn(G)`. `Aut(F_r)` acts by precomposition `e ↦ e ∘ α⁻¹`
(Nielsen equivalence); an inner automorphism of `F_r` acts by conjugation in the target, so this
descends to an action of `Out(F_r)` on exterior epimorphisms. A `T_r`-system is an orbit of
`Aut(F_r) × Aut(G)` on the surjections, `(α, β) · φ = β ∘ φ ∘ α⁻¹`; equivalently an `Out(F_r)`-orbit
on `Epi(F_r, G)/Aut(G)`, or an orbit of `Out(G)` on the `Out(F_r)`-orbits of exterior
epimorphisms. The two actions commute. Dividing by `Aut(G)` alone gives a finer intermediate
quotient, in general different (see the `C₂` check below), which is not the `T`-system. The minimal
generator number `d(G)`, the least
`r` admitting a surjection `F_r → G`, is Mathlib's `Group.rank`. Define the sets of exterior
epimorphisms and of `T`-systems, with an equivalence between the generating tuples
`{t : BranchTuple r G // BranchTuple.generated t = ⊤}` and the surjections `F_r → G`, the
action of `Out(F_r)` after the inner quotient, and
the quotient map from exterior epimorphisms, by `Out(F_r)` and `Out(G)`; prove that a
generating `r`-tuple exists exactly when `r ≥ Group.rank G`, padding with identities.
*Proof sketch.* Use the
universal property of `FreeGroup`, characterise surjectivity by the closure of the images, and
compute precomposition by inner automorphisms. Source: [Chen, *Nonabelian level
structures*](https://arxiv.org/pdf/2011.12940v2), §1.1, p. 5, and §1.6, p. 12. *Needs:* *Branch
tuples and Nielsen classes*; Mathlib `FreeGroup`, `FreeGroup.lift`, `MulAut`, `Group.rank`.

**Checks.**

- A generating one-tuple of `C_n` is an element of order `n`, so `d(C_n) = 1` for `n ≥ 2`.
- `C₂ × C₂` has `d = 2` and no surjection from `F₁`; `d(G)` is not the order of `G`.
- For `C₅`, inverting every image of a surjection changes its exterior class, since inner
  conjugation is trivial, but preserves its `T`-system, since inversion is a target automorphism.
- The quotient map to `T`-systems sends the class of each surjection to the `T`-system of that same
  surjection.
- For `G = C₂` and `r = 2`, the generating pairs `(g, 1)`, `(1, g)` and `(g, g)` are three exterior
  epimorphisms and, `Aut(C₂)` being trivial, three classes modulo `Aut(G)`; Nielsen moves join them
  into a single `T₂`-system. The rank-one `C₅` check cannot detect the missing `Aut(F_r)` quotient.
- Precomposing with the inner automorphism of `F_r` by a word `w` conjugates the image tuple by the
  image of `w`, which is trivial on exterior classes.

**Nielsen transitivity questions.** Three open statements are recorded as named propositions; no
theorem of this roadmap assumes any of them. The transitivity conjecture (Garion's, as recorded by
Chen): for every finite `G` and every `r ≥ d(G) + 1`, `Out(F_r)` acts transitively on exterior
epimorphisms `F_r ↠ G` (the Wiegold conjecture is its case of nonabelian finite simple groups; the
solvable case is a theorem of Dunwoody). McCullough–Wanderley: for `q`
outside `{3, 5, 7, 9, 11}`, the `T₂`-systems of `SL₂(𝔽_q)` are classified bijectively by the
`Aut(𝔽_q)`-orbit of `tr[a, b]`, the orbit of `2` being excluded; because `T₂` divides by `Aut(G)`,
the exact trace is not an invariant when `𝔽_q` is not a prime field. Chen's question: for a finite
nonabelian simple `G` and `φ : F₂ ↠ G`, does the order of `φ([a, b])` divide the size of the
`Out⁺(F₂)`-orbit of the exterior class of `φ`? None of these concerns product-one tuples. State the
Nielsen transitivity, McCullough–Wanderley trace and Chen orbit-divisibility assertions as named
propositions. *Proof
sketch.* State each with the quantifiers of its source and check its equivalence relation against
the exterior and `T`-system definitions. Sources: [Chen, *Nonabelian level
structures*](https://arxiv.org/pdf/2011.12940v2), Conjecture 1.1.3 (citing Garion, Conjecture 1),
p. 5, and Question 1.4.1, p. 11;
[McCullough–Wanderley](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/12B5FCFADCAFE740B31DEE5BB112DB85/S0017089512000675a.pdf/nielsen_equivalence_of_generating_pairs_of_sl2q.pdf),
§4, p. 487, and the trace theorem, pp. 481–482. *Needs:* *Exterior epimorphisms and `T`-systems*.

**Checks.**

- The rank parameter counts generating tuples modulo inner conjugation, not sphere tuples with
  product one; for `G = C₂` and `r = 2` there are three exterior epimorphisms, permuted
  transitively by `Out(F₂) ≅ GL₂(ℤ)`.
- Over `𝔽₄`, the Frobenius of `𝔽₄` changes the exact trace of a commutator while preserving its
  `Aut(𝔽₄)`-orbit and the `T`-system.
- The bound `r ≥ d(G) + 1` cannot be lowered to `r = d(G)`: for `G = C₅` and `r = 1` the exterior
  epimorphisms `F₁ ↠ C₅` are the four generators of `C₅`, and `Out(F₁) = {±1}` acts by inversion,
  with the two orbits `{g, g⁻¹}`; a statement quantified over all `r ≥ d(G)` is false.

**Extracting an element of a single class.** Let `G` be finite and `c` a single conjugacy class that
generates `G`. There is `N(G, c)` such that for every `n ≥ N`, every generating tuple in `c^n` is
braid equivalent to a tuple `(g, g₂, …, g_n)`, for any prescribed `g ∈ c`, whose tail
`(g₂, …, g_n)` still generates `G`. The tuple need not have product one. The single-class
hypothesis is essential: from a tuple in a union of classes one cannot extract a class that does not
occur in it. *Proof sketch.* If `n > d|c|`, where `d` is the order of the elements of `c`, some
element of `c` occurs `d + 1` times; move these copies to the front. A block of `d` equal entries has
product one, and braiding it around the generating remainder conjugates it by any word in the
remainder, so its value can be made `g`; keep the extra copy so that the remainder still generates.
Source: [Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
Proposition 3.4 and its proof, pp. 744–745. *Needs:* *The Hurwitz braid action*, *The braid-orbit
monoid*.

**Checks.**

- For `G = C₂` and its nontrivial class, every tuple is constant and the statement holds with
  `N = 2`.
- In `S₃` with `c` the transpositions and a tuple of transpositions, no braid move produces a
  `3`-cycle entry, because class multiplicities are braid invariant.
- The extraction preserves the ordered product exactly; it does not force product one.

### IG.3.3 Branch cycles, rigidity and fields of moduli

**Realizing generating sphere tuples.** Let `G` be finite, `P₁, …, P_r` distinct points of
`ℙ¹(ℂ)`, and `(g₁, …, g_r)` a generating tuple with product one. There is a connected `G`-Galois cover
of `ℙ¹_ℂ`, unramified outside the `P_i`, whose positively oriented local monodromy at `P_i` is `g_i`
(an identity entry marks an unramified point). The ramification index over `P_i` is `ord(g_i)`.
Simultaneous conjugation of the tuple gives isomorphic `G`-covers, and inner Nielsen classes
correspond to `G`-equivariant isomorphism classes. For `r = 3` this is the Belyi construction of
BelyiMaps Layers 3 and 5. Construct the `G`-cover attached to a tuple and prove that the inertia
group over `P_i` is generated by a conjugate of `g_i` and has order `ord(g_i)`, and
that conjugate tuples give isomorphic `G`-covers.

The algebraic genus is supplied by SchemeAndStackFoundations §3.2 / `scheme_riemann_hurwitz`.
Apply it to the finite separable morphism of smooth proper connected complex curves of degree
`|G|`. Tameness in characteristic zero gives a contribution `e − 1` at each of the `|G|/e`
points over `P_i`, where `e = ord(g_i)`, hence
`2g(C) − 2 = −2|G| + Σ_i |G|(1 − 1/ord(g_i))`.

*Proof sketch.* The fundamental group of `ℙ¹(ℂ) ∖ {P_i}` is generated by loops `γ_i` with
`γ₁ ⋯ γ_r = 1`; `γ_i ↦ g_i` defines a surjection to `G` and hence a connected Galois topological
cover; apply Riemann existence for punctured curves and compute the local cycle lengths. Sources:
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XII, Theorem 5.1, pp. 251–253, and Exposé XIII,
Corollary 2.12, p. 290; Serre, *Topics in Galois
Theory*,
§8.1, pp. 81–83 (realization and local monodromy). *Needs:* *Branch tuples and Nielsen classes*,
*Riemann existence for punctured curves*; EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*;
SchemeAndStackFoundations §3.2 / `scheme_riemann_hurwitz`; BelyiMaps Layers 3 and 5;
the algebraic genus formula in *Exact supplier contracts / From SchemeAndStackFoundations*.

**Checks.**

- The tuple `(a, a⁻¹)` with `a` a generator of `C_n` gives `z ↦ z^n`; transporting its inertia
  orders into `scheme_riemann_hurwitz` gives algebraic genus `0`.
- A product-one tuple generating a proper subgroup `H < G` gives a disconnected `G`-torsor
  (induced from an `H`-cover), not a connected `G`-cover.
- An identity entry has ramification index `1`, so its marked point is unramified.

**Rational rigidity.** Let `K` be a field of characteristic zero, `G` a finite group with trivial
centre, `P₁, …, P_r ∈ ℙ¹(K)` distinct, and `C₁, …, C_r` nontrivial conjugacy classes of `G` that are
rational, that is `C_i^m = C_i` for every `m` prime to `|G|`. Assume that the set of generating
tuples in `C₁ × ⋯ × C_r` with product one is nonempty and forms a single orbit under simultaneous
conjugation (rigidity). Then there is a regular `G`-Galois cover of `ℙ¹_K`, unramified outside the
`P_i`, whose inertia over `P_i` is generated by elements of `C_i`; it is unique up to `G`-equivariant
isomorphism, and `G` is the Galois group of a regular extension of `K(T)`. Both rationality and
rigidity are hypotheses; a nonempty class tuple gives neither. *Proof sketch.* `σ ∈ Γ_K` sends a
cover with branch tuple in `(C_i)` to one with tuple in `(C_i^{χ(σ)}) = (C_i)` (conjugation on a
positive inertia generator uses `χ(σ)`; the right action on covers uses `χ(σ)⁻¹`), so rigidity makes
the class Galois stable; since the centraliser of a generating tuple is `Z(G) = 1`, the cover descends
to `K`. Source: Serre, *Topics in Galois
Theory*,
Theorem 8.1.1 and Lemma 8.1.3, pp. 81–83. *Needs:* *Realizing generating sphere tuples*; EtaleCohomologyFoundations §F.0.A2 *The arithmetic fundamental-group sequence*; Layer IG.0 *Finite Galois algebras and torsors*;
SchemeAndStackFoundations Layer 1; BelyiMaps Layer 11.

*Lean:* `hasRegularRealization_of_rigid` states the regular field-realization consequence using
`IsRationalClass`, `IsRigid` and `HasRegularRealization`.

**Checks.**

- The finite-group hypothesis in `IsRationalClass` is essential: `Nat.card (Multiplicative ℤ) = 0`,
  so its displayed power test on that infinite group would only test `m = 1` and accept every class.
- For `G = S₃` and the classes (transposition, transposition, `3`-cycle) the generating product-one
  tuples form one orbit, and the cover descends to a regular `S₃`-cover over `ℚ`.
- For `G = C₃` with classes `(C, C, C)` where `C = {a}`, the class `{a}` is not rational (`a² ∉ {a}`)
  and `C₃` has nontrivial centre, so the theorem does not apply as stated.
- In `C₂`, the nonidentity class is rational, but its one-entry tuple is not rigid: no such
  tuple has product one. For `G = 1`, the empty class tuple is rigid.

**Field of moduli and the central descent obstruction.** Let `K` have characteristic zero and let a
`G`-cover of `ℙ¹_{K̄}` have a `Γ_K`-invariant `G`-equivariant isomorphism class, for a fixed model of
the target and branch divisor over `K`. Its field of moduli is the fixed field of the stabiliser of
this class (with the branch labels, if any, included in the class). Choose a rational or tame
tangential base point on the branch complement and its section of the arithmetic sequence. The
comparison elements are cosets `h̄_σ ∈ G/Z(G)`; choose continuous lifts `h_σ ∈ G`. Then
`c(σ, τ) = h_σ h_τ h_{στ}⁻¹` lies in `Z(G)` and defines a class in `H²(Γ_K, Z(G))` for the trivial
action of `Γ_K` on `Z(G)`, which vanishes exactly when the comparisons can be chosen to give
effective descent of the `G`-cover to `K`. Changing the lifts changes the cocycle by a coboundary,
and changing the section does not change the class. Define the field of moduli and the
central obstruction class, and prove the independence of the choices and the criterion for a model
over `K`, as stated. *Proof sketch.* The section gives comparison elements modulo the centraliser `Z(G)` of
the monodromy; compute the central `2`-cocycle and its change under the choices; use finite-level
effective descent and normalisation to compare a vanishing class with an actual model. Source:
[Wewers, *Field of moduli and field of definition*](https://arxiv.org/pdf/math/0108003v1),
Definition 1.1 and Propositions 1.2 and 1.5, pp. 4–6. *Needs:* *Realizing generating sphere
tuples*; EtaleCohomologyFoundations §F.0.A2 *The arithmetic fundamental-group sequence*, Layer IG.1 *Tame tangential fibres
at a boundary point*; SchemeAndStackFoundations Layers 1 and 2; ProfiniteCohomology Layer 1;
BelyiMaps Layer 11.

**Checks.**

- If `Z(G) = 1` the obstruction vanishes and the field of moduli is a field of definition.
- For the `SL₂(𝔽₅)` example below the field of moduli is `ℝ` and the obstruction is nonzero.
- The `C₂`-cover `y² = x² − 2` with unordered branch set `{√2, −√2}` has field of moduli `ℚ` and a
  `ℚ`-model; labelling `√2` as the first branch point changes the field of moduli to `ℚ(√2)`, so the
  stabiliser must be taken of the class with its labels.

**A real field of moduli that is not a field of definition.** Take `G = SL₂(𝔽₅)`, the nonsplit double
cover of `A₅`, and `g₁, g₂` the lifts of order three of `(123)` and `(345)`. The tuple
`(g₁, g₂, g₂⁻¹, g₁⁻¹)` generates `G` and has product one. Along Wewers's family of branch sets
`S_t = {±1 ± √(−t)}`, `0 < |t| < 1`, a negative real `t` gives a connected `G`-cover whose class is
invariant under complex conjugation; its comparison elements are the two lifts of `(12)(45)`, both
of order four. Since no comparison element is an involution, the cover has field of moduli `ℝ` and
no `G`-cover model over `ℝ`. For positive `t` the branch points come in complex conjugate pairs and a
real model exists. *Proof sketch.* Realise the tuple at the given branch points; compute complex
conjugation along the chosen path in the upper half plane and the two possible comparison elements;
apply the real descent criterion that a comparison realising descent must be an involution. Source:
[Wewers, *Field of moduli and field of definition*](https://arxiv.org/pdf/math/0108003v1),
Proposition 1.8, Theorem 1.9 and Example 1.10, pp. 7–9. *Needs:* *Realizing generating sphere
tuples*, *Field of moduli and the central descent obstruction*.

**Checks.**

- The two lifts of `(12)(45)` to `SL₂(𝔽₅)` have order four (their squares are `−1`), so neither is an
  involution.
- With `g₁, g₂` replaced by elements of `A₅` (centreless), the same tuple descends, so the obstruction
  comes from the centre `{±1}`.

**A rigid `S₃` cover and its dessin.** In `S₃` the classes (transposition, transposition, `3`-cycle)
are rational, have a single generating product-one orbit under simultaneous conjugation, and the
centraliser of a generating tuple is trivial; the tuple `((12), (23), (132))` represents the orbit.
The degree-three map `y ↦ y³ − 3y`, after the affine change of coordinate taking `−2, 2, ∞` to
`0, 1, ∞`, is a Belyi map whose Galois closure has group `S₃`, inertia orders `2, 2, 3`, and is
regular over `ℚ`; its dessin and the triple agree under the convention transport of Layer IG.6. This
single passport computation does not show that passports determine Belyi pairs in general. *Proof
sketch.* Enumerate the six ordered pairs of distinct transpositions and their products; they form
one orbit. The critical points of `y³ − 3y` are `±1`, with critical values `∓2`, each with one double
preimage, and `∞` is totally ramified. Source: Serre, *Topics in Galois
Theory*,
§8.1, Theorem 8.1.1, pp. 81–83. *Needs:* *Rational rigidity*; BelyiMaps Layers 3, 5 and 11.

**Checks.**

- There is exactly one orbit of generating triples `(t₁, t₂, s)` with `t₁, t₂` transpositions, `s` a
  `3`-cycle and `t₁ t₂ s = 1`.
- `y³ − 3y + 2 = (y − 1)²(y + 2)` and `y³ − 3y − 2 = (y + 1)²(y − 2)`, so the ramification over `∓2`
  is `(2, 1)` and over `∞` it is `(3)`.

### IG.3.4 Reduced Schur covers and the universal marked extension

The universal marked central extension `U(G, c)` is defined by a presentation and is canonical; the
reduced Schur cover `S_c` depends on a choice of Schur cover, and the comparison
`U(G, c) ≅ S_c ×_{G^{ab}} ℤ^D`, for finite `G` generated by `c`, makes `U(G, c)` computable.
Representation groups (Schur covers) of a finite group are RepresentationTheory/InductionRestriction
Layer 7; group extensions are
Mathlib's `GroupExtension`.

The Schur multiplier `M(G)` is Mathlib's `groupHomology.H2 (Rep.trivial ℤ G ℤ)`;
its carrier and additive-group API are used directly. No second multiplier carrier is introduced.

**Commutators of lifts and the class map of a central extension.** Let `1 → A → E → G → 1` be a
central extension. For commuting `x, y ∈ G` and any lifts `X, Y ∈ E`, the commutator `X Y X⁻¹ Y⁻¹`
lies in `A` and does not depend on the lifts; call it `κ_E(x, y)`. For commuting `x, y`, the chain
`[x | y] − [y | x]` is a `2`-cycle of `G` with coefficients in `ℤ`; its class in `M(G) = H₂(G, ℤ)` is
the homological commutator `⟨x, y⟩`, equivalently the image of the oriented generator of
`H₂(ℤ², ℤ)` under `(a, b) ↦ x^a y^b`. The class map `τ_E : M(G) → A` of the extension (defined
by evaluating the cocycle of a set-theoretic section on `2`-cycles) satisfies `τ_E⟨x, y⟩ = κ_E(x, y)`, and by the
universal coefficient theorem for the trivial module `A` the map `H²(G, A) → Hom(M(G), A)` sending
the class of `E` to `τ_E` is surjective with kernel `Ext(G^{ab}, A)`. Define the lift commutator
`κ_E` and the homological commutator. For commuting `x, y ∈ G` the defining cycle
lies in `groupHomology.cycles₂ (Rep.trivial ℤ G ℤ)`, and `⟨x, y⟩` is its image under
`groupHomology.H2π` in `groupHomology.H2 (Rep.trivial ℤ G ℤ)`. Prove that the commutator of any
lifts is the image of `κ_E(x, y)`; that changing a lift by an element of `A`
changes nothing; that `κ_E(y, x) = κ_E(x, y)⁻¹`; naturality of `κ_E` for maps of central
extensions; that `⟨y, x⟩ = −⟨x, y⟩`; naturality
`f_*⟨x, y⟩ = ⟨f x, f y⟩`; and that
`τ_E⟨x, y⟩ = κ_E(x, y)`. *Proof sketch.* Differences of lifts are central, so the commutator is
independent of them; the boundary of `[x | y]` is `[y] − [xy] + [x]`, and subtracting the reversed
formula gives zero when `xy = yx`; compute `τ_E` on this cycle from a set-theoretic section. Source:
[Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
§2.1, p. 2, and the proof of Theorem 2.5, p. 4 (universal coefficients). *Needs:* Mathlib
`GroupExtension`, `groupHomology.H2`, `groupHomology.H2π`, `groupHomology.cycles₂`, `Rep.trivial`,
`groupHomology.map`; RepresentationTheory/InductionRestriction Layer 7.

**Checks.**

- `κ_E(1, y) = 1` and `⟨1, y⟩ = 0`, the cycle being a boundary.
- In the split extension `A × G → G` every `κ_E(x, y)` is trivial.
- For `D₈ → C₂²` and for `Q₈ → C₂²`, lifts of two independent elements have commutator the
  nontrivial central element, and `⟨x, y⟩` is the generator of `M(C₂²) ≅ C₂`.
- For `G = ℤ²` with its ordered basis, `⟨e₁, e₂⟩` is the positive generator of `H₂(ℤ², ℤ) = ℤ` and
  `⟨e₂, e₁⟩` its negative; an unoriented definition would identify them.

**The reduced Schur multiplier.** For a conjugacy-invariant subset `c ⊂ G`, let `Q_c ⊂ M(G)` be the
subgroup generated by the classes `⟨x, y⟩` with `x ∈ c` and `y` in the centraliser of `x`. The reduced
Schur multiplier is the quotient `M(G, c) = M(G)/Q_c`. No generation or rationality hypothesis on `c`
is needed, the construction does not depend on a choice of Schur cover, and it is functorial for
group maps `f` with `f(c) ⊂ d`. Define `Q_c` and
`M(G, c)`, and prove that `x ∈ c`, `xy = yx` give
`⟨x, y⟩ ∈ Q_c`; that `Q_c ≤ B` iff every such class lies in `B`;
that `c ⊂ d` gives `Q_c ≤ Q_d`; that `f(c) ⊂ d` gives
`f_* Q_c ≤ Q_d`; that the quotient map is onto with kernel `Q_c`;
that maps out of `M(G, c)` are maps out of `M(G)` killing `Q_c`;
functoriality with identity and composition laws; and
that `Q_∅ = 0`, so `M(G, ∅) = M(G)`. *Proof sketch.* Take the additive subgroup closure and
the quotient; induce maps by the universal property of the quotient. Source: [Wood, *An algebraic
lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), definition of
`H₂(G, c)` and Lemma 2.3, p. 3. *Needs:* *Commutators of lifts and the class map of a central
extension*; Mathlib `AddSubgroup.closure`, `QuotientAddGroup`, `groupHomology.map`.

**Checks.**

- `Q_∅ = 0`, so `M(G, ∅) = M(G)`; for the trivial group `M(1, c) = 0` for both possible `c`.
- For a finite cyclic group `M(G) = 0`, so `M(G, c) = 0` for every `c`.
- For `G = C₂²`, `M(G, ∅) ≅ C₂` but `M(G, {x}) = 0` for any `x ≠ 1`, since `⟨x, y⟩` generates
  `M(G)`; relations from elements outside `c` must not be imposed.

**Reduced Schur covers.** Let `π : S → G` be a Schur cover (a representation group,
RepresentationTheory/InductionRestriction Layer 7) with its class isomorphism `τ_S : M(G) ≅ ker π`.
That layer describes the kernel through `H²(G, k^×)` over an algebraically closed field `k` of
characteristic zero; the comparison used here, that for a finite group `G` and a stem extension
`S → G` with `|ker π| = |M(G)|` the class map `τ_S` of *Commutators of lifts and the class map of a
central extension* is an isomorphism `M(G) ≅ ker π`, is part of this target and is proved without
the five-term exact sequence. With `A = ker π`, character transgression `Hom(A, ℂˣ) → H²(G, ℂˣ)`,
`χ ↦ χ_*[S]`, is injective because `A ⊆ [S, S]`; universal coefficients identify `H²(G, ℂˣ)` with
`Hom(M(G), ℂˣ)`, the `Ext` term vanishing since `ℂˣ` is divisible, and carry `χ_*[S]` to
`χ ∘ τ_S` by naturality of the class map in the coefficients. A character of `A` trivial on
`im τ_S` is therefore trivial; characters of the finite group `A / im τ_S` separate its points, so
`τ_S` is onto, and `|A| = |M(G)|` makes it bijective. The section-cocycle description of `τ_S`, and
with it the oriented formula `τ_S⟨x, y⟩ = κ_S(x, y)`, is unchanged. The reduced cover is `S_c = S/τ_S(Q_c)`,
with the induced central surjection `π_c : S_c → G`, whose kernel is identified with `M(G, c)` by
`τ_S`. The Schur cover and `τ_S` are parameters: different Schur covers give reduced covers that need
not be isomorphic. The composite `H₂(S_c, ℤ) → M(G) → M(G, c)` is zero. Define
the reduced cover and prove that `π_c` composed with the quotient map is
`π`; that `τ_c : M(G, c) ≅ ker π_c`, compatibly with the quotient from `M(G)`;
that lifts of `x ∈ c` and of `y` in its centraliser commute in `S_c`; and
that `S_c^{ab} → G^{ab}` is an isomorphism, inherited from the stem property of
`S`. *Proof sketch.* `τ_S(Q_c)` is central; take the quotient and identify the kernel by exactness;
the lift commutator of `x ∈ c` and `y ∈ C_G(x)` is `τ_S⟨x, y⟩ ∈ τ_S(Q_c)`; the vanishing of the
composite follows from naturality of the class maps. Source: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), definition of `H₂(G, c)`,
Lemmas 2.2 and 2.3, p. 3. *Needs:* *The reduced Schur multiplier*, *Commutators of lifts and the
class map of a central extension*; RepresentationTheory/InductionRestriction Layer 7; Tau Ceti
`TauCeti.FactorSet.characterTransgression_injective_of_range_inl_le_commutator`
(`TauCeti/GroupTheory/GroupExtension/Character.lean`); Mathlib
`CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`, `AddCommGrpCat.injective_of_divisible`.

**Checks.**

- For `c = ∅` the reduced cover is the chosen `S` itself.
- For `G = C₂²` and `c` the three nonidentity elements, both Schur covers `D₈` and `Q₈` reduce to
  `G`, since `M(G, c) = 0`.
- For `c = ∅` the two Schur covers `D₈` and `Q₈` of `C₂²` are not isomorphic, so `S_c` is not
  determined by `(G, c)` alone.
- For the stem extension `Q₈ → C₂²`, the nontrivial character of `ker π ≅ C₂` has nonzero
  transgression, and `τ_S` sends the generator `⟨x, y⟩` of `M(C₂²)` to `−1`; for the non-stem
  central extension `C₄ × C₂ → C₂²`, with kernel of order `2 = |M(C₂²)|`, transgression of the
  nontrivial character vanishes and `τ_S = 0`, so the stem hypothesis cannot be dropped.

**Conjugacy classes lift bijectively.** In a reduced cover `π_c : S_c → G`, if `x ∈ c` and `y`
commutes with `x`, any lifts of `x` and `y` commute; hence the centraliser of a lift `X` of `x` maps
onto `C_G(x)`, and every conjugacy class of `S_c` whose image lies in `c ∪ {1}` maps bijectively onto
its image class. Several classes of `S_c` may lie over one class of `c`; each maps bijectively. As a
consequence, after choosing a representative `x_d` of each class `d ∈ D` and a lift `X_d ∈ S_c`,
there is a unique conjugation-equivariant marking `x ↦ x̂` of `c` by elements of `S_c` with
`x̂_d = X_d`: for `x = g x_d g⁻¹` put `x̂ = g̃ X_d g̃⁻¹` for any lift `g̃` of `g`. Changing `X_d` by
`a_d ∈ M(G, c)` changes every marked lift in `d` by `a_d`. Construct this
class-compatible marking and prove that `π_c(x̂) = x`;
that the lift of `gxg⁻¹` is `g̃ x̂ g̃⁻¹`; that
`x̂_d = X_d`; the stated effect of changing `X_d`; and
that two equivariant markings agreeing on representatives agree.
*Proof sketch.* Lifts of commuting elements commute because their commutator lies in
`τ_S(Q_c)`; two conjugators with the same effect on `x` differ by an element of `C_G(x)`, whose lift
fixes `X`; kernel elements are central. Sources: [Wood, *Nonabelian Cohen–Lenstra
moments*](https://par.nsf.gov/servlets/purl/10152050), Definition 3.1, p. 388, and Lemmas 3.3–3.4,
p. 390; [Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
Lemma 2.3, p. 3. *Needs:* *Reduced Schur covers*.

**Checks.**

- For `c = ∅` the marking is the empty function; for a cyclic group with `S_c = G`, the marking is
  the inclusion of `c`.
- In `D₈ → C₂²` with `c = ∅` (so no relations are killed), lifts of two independent elements do not
  commute, so the hypothesis `x ∈ c` is needed.
- For nonempty `c` and `M(G, c) ≠ 0`, multiplying the chosen lift of one class by a nontrivial central
  element gives a different marking; the construction keeps this choice.

**Marked central extensions.** Let `c ⊂ G` be conjugacy-invariant and generate `G`. A `c`-marked
central extension is a central extension `1 → A → E → G → 1` with a map `s : c → E` over `G` such that
`s(g x g⁻¹) = e s(x) e⁻¹` whenever `e` lies over `g`. A morphism of marked extensions is a group map
over `G` preserving the markings; it need not fix an identification of the kernels. Define
`c`-marked central extensions and their morphisms, recording that `π(s(x)) = x`, the
equivariance, and the conditions on a
morphism; prove that a marking is equivalently a conjugation-invariant subset of `E` mapping
bijectively onto `c`, and that two morphisms out of an extension generated by
its marked subset agree if they agree on it (generation is essential). *Proof sketch.* Bundle a
Mathlib group extension with the marking and the centrality and equivariance conditions. Sources:
[Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
§2, Lemmas 2.1–2.4 and Theorem 2.5, pp. 2–4. *Needs:* *Conjugacy classes lift bijectively*; Mathlib
`GroupExtension`.

**Checks.**

- For `G = 1` and `c = ∅`, every central extension `A → A → 1` carries the empty marking.
- The identity extension `G → G` with the inclusion of `c` is marked.
- `C₄ → C₂` marked on the nontrivial class by an element of order four is a marked extension, although
  the marking is not a homomorphic splitting.

**The universal marked extension.** For a conjugacy-invariant generating subset `c ⊂ G`, let `U(G, c)`
be the group presented by generators `[x]`, `x ∈ c`, and relations `[x][y][x]⁻¹ = [x y x⁻¹]` for
`x, y ∈ c`, with `π_U : U(G, c) → G`, `[x] ↦ x`. Then `π_U` is surjective with central kernel,
`x ↦ [x]` is a marking, and `U(G, c)` is initial among `c`-marked central extensions: for each marked
`E` there is exactly one marked morphism `U(G, c) → E`, so any two universal marked extensions are
uniquely isomorphic through their markings. For a word `w`, `w [x] w⁻¹ = [π_U(w) x π_U(w)⁻¹]`. No
relation `[x]^{ord(x)} = 1` is imposed. Define `ReducedSchur.universalMarked G c` as a Mathlib
`PresentedGroup`, with its generators `[x]`, the conjugation relations, the projection `π_U`, and
the lifting property (a map on generators
satisfying the conjugation relations extends uniquely), and prove that `π_U` is surjective with
central kernel and that `U(G, c)` is initial among `c`-marked central extensions. *Proof sketch.* Construct `π_U` by checking the
relations in `G`; generation of `G` by `c` gives surjectivity; an element of the kernel conjugates
each generator trivially by the word-conjugation formula, so it is central; the marking of any `E`
satisfies the defining relations, which gives existence, and uniqueness holds because the `[x]`
generate. Sources: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §2, Lemmas 2.1–2.4 and
Theorem 2.5, pp. 2–4. *Needs:* *Marked central extensions*; Mathlib `PresentedGroup`,
`PresentedGroup.toGroup`.

**Checks.**

- `U(1, ∅) = 1`, the group on no generators.
- For `G = C₂` and `c` its nontrivial element, the only relation is trivial, so `U ≅ ℤ` and `π_U` is
  reduction modulo `2`.
- For `G = 1` and `c = {1}`, the sole conjugation relation is the identity word; `U ≅ ℤ`,
  its projection has full kernel, and the marked lift of the identity is nontrivial.
- Imposing `[x]^{ord(x)} = 1` would turn the `G = C₂` example above into `C₂`; the universal property
  fails for the marked extension `C₄ → C₂`.

**The class degree map.** Let `D = c/G` and `L = ℤ^D`, Mathlib's `D →₀ ℤ`. Define
`δ : L → G^{ab}` by sending the basis vector `e_d` to the image of a representative of `d`
(independent of the representative), and the degree `deg : U(G, c) → L` by `deg [x] = e_{[x]}`. Then
`deg` is a homomorphism, `δ ∘ deg` is the abelianised projection, and `δ` is surjective when `c`
generates `G`. Define `δ` and `ReducedSchur.degree`, and prove
the value of `δ` on basis vectors, surjectivity of `δ` under generation,
`δ(deg u) = [π_U u]` (with negative coefficients allowed),
`deg [x] = e_{[x]}`, `deg [x]⁻¹ = −e_{[x]}`,
and that `deg` is a homomorphism compatible with abelianization. *Proof sketch.* Extend on the free
module; each relator has degree zero, so the degree on the free group descends. Source: [Wood, *An
algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §2,
Lemmas 2.1–2.4, pp. 2–4. *Needs:* *The universal marked extension*; Mathlib `Finsupp`,
`Abelianization.of`.

**Checks.**

- For `G = C₂` with its one nontrivial class, `δ : ℤ → C₂` is reduction modulo `2` and `deg`
  identifies `U = ℤ` with `ℤ`.
- For `c = ∅`, `L = 0` and `δ = 0`.
- `deg [x]⁻¹ = −e_{[x]}`; replacing `L` by `ℕ^D` would not give a homomorphism on `U`.

**The marked fibre product and the computation of `U(G, c)`.** Assume `G` is finite and `c` is
conjugacy-invariant and generates `G`. For a reduced cover `S_c` with its class-compatible marking,
let `P = S_c ×_{G^{ab}} L` be the subgroup of pairs `(h, m)` of
`S_c × L` with `[π_c(h)] = δ(m)`, marked by `x ↦ (x̂, e_{[x]})`. Then `[P, P] = [S_c, S_c] × 0`, the
degree induces `P^{ab} ≅ L`, and `P` is a universal marked extension; hence there is a unique marked
isomorphism `U(G, c) ≅ P` sending `[x]` to `(x̂, e_{[x]})`, compatible with the projections to `G` and
with the degrees. A change of Schur cover or of marking is transported through `U(G, c)`; no
canonical isomorphism between two reduced covers is asserted. The fibre-product definition makes
sense without generation, but the commutator and abelianization formulas, universal property and
comparison isomorphism here require generation. Construct the
marked fibre product `P` with its projection onto `S_c` (surjective
when `c` generates `G`), its degree projection, its marking and its membership criterion, and the
marking correction with its value over `G`, its value on marked elements, its homomorphism property
and its sign; prove the isomorphism `U(G, c) ≅ P`. *Proof sketch.*
Pull a marked extension `E → G` back to `P`; its class map vanishes on `H₂(P, ℤ)` (it factors through
`H₂(S_c, ℤ) → M(G) → M(G, c)`, which is zero) and `Ext(P^{ab}, A) = 0` since `P^{ab} ≅ L` is free, so
the pullback splits by a homomorphism `φ : P → E` over `G`, for any abelian `A`, finite or not. If
`φ(x̂, e_{[x]}) = s(x) k_x` with `k_x ∈ A`, then `k_x` depends only on the class of `x`, and
`φ_corr = φ · ψ⁻¹`, with `ψ : P → A` the homomorphism through `deg` with `ψ(e_{[x]}) = k_x`, is a
marked morphism; uniqueness holds because two maps over `G` differ by a homomorphism `P → A` that
factors through `P^{ab} = L` and vanishes on its basis. Source: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §2, Lemmas 2.1–2.4 and
Theorem 2.5, pp. 2–4; the correction must be `φψ⁻¹`, not the `φψ` displayed there. *Needs:* *Reduced
Schur covers*, *Conjugacy classes lift bijectively*, *The universal marked extension*, *The class
degree map*; Tau Ceti `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`.

**Checks.**

- For `G = C₂` and `c = {nontrivial}`, `S_c = C₂` and `P = {(g, n) : g ≡ n mod 2} ≅ ℤ = U`.
- For `G = 1`, `c = ∅` and the trivial Schur cover, `P = 1`; the pair `(nontrivial, 0)` is not in
  `P` for `G = C₂`, so `P` is not the full product `C₂ × ℤ`.
- With kernel `ℤ/3` and discrepancy `k_x = 1`, the correct correction gives `0` while the uncorrected
  sign `φψ` gives `2`, so the sign of the correction is tested.
- For `G = C₂²`, `c = ∅` and `S_c = Q₈`, the fibre product is `ker(Q₈ → C₂²) = C₂`, whereas
  the presentation `U(G, ∅)` is trivial. The empty-class reduced-cover examples for nontrivial `G`
  do not satisfy generation and give no comparison isomorphism.

**The kernel of the universal marked extension.** Assume `G` is finite and `c` is conjugacy-invariant
and generates `G`. Let `K(G, c) = ker(π_U : U(G, c) → G)`. It is
central, hence abelian, although `U(G, c)` is not in general. Its degree image is `ker δ`, its torsion
subgroup is `M(G, c)`, and there is an exact sequence `0 → M(G, c) → K(G, c) → ker δ → 0`; in the
coordinates of a chosen reduced cover, `K(G, c) ≅ M(G, c) × ker δ`, with `ker δ` free abelian of rank
`|D|` and no preferred basis. Define `K(G, c)` and prove that
the subgroup inclusion is central in `U`, that the degree image is `ker δ`, that the torsion
equals `M(G, c)`, and the coordinate-dependent product decomposition. *Proof sketch.* Restrict
the isomorphism `U ≅ P` to kernels: a pair over `1` has first coordinate in `ker π_c ≅ M(G, c)` and
second coordinate in `ker δ`; `ker δ` is a subgroup of a free abelian group of finite rank, hence
free. Source: [Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
§2, Theorem 2.5, pp. 3–4. *Needs:* *The marked fibre product and the computation of `U(G, c)`*;
Mathlib `MonoidHom.ker`, `Submodule.basisOfPid`.

**Checks.**

- For `G = C₂` and `c = {nontrivial}`, `K = 2ℤ ⊂ U = ℤ`: infinite although `M(C₂, c) = 0`, so `K` is
  not the reduced multiplier.
- For `G = 1` and `c = ∅`, `K = 1`.
- For `G = C₂²` and `c` the three nonidentity elements, `M(G, c) = 0`, `L = ℤ³`, and
  `K ≅ ker(δ : ℤ³ → C₂²)`, free of rank three.
- For `G = C₂²` and `c = ∅`, the presentation has trivial kernel while `M(G, ∅) = C₂`.
  The kernel remains defined without generation, but the multiplier and product formulas do not apply.

**Coprime semidirect products and admissible inertia.** Let `H` and `Γ` be finite groups of coprime
orders, `Γ` acting on `H`, and `G = H ⋊ Γ`.

1. The projection `ρ : G → Γ` is split, so `M(G) → M(Γ)` is surjective; `M(G)` is finite of
   exponent dividing `|G|` and splits canonically as `M_H × M_Γ`, the parts supported at primes
   dividing `|H|` and `|Γ|`.
2. For a Schur cover `S → G`, let `S'` be the preimage of `H`; the central extension
   `1 → M_Γ → S'/M_H → H → 1` has a unique splitting, its kernel preimage `D ⊂ S'` is the unique
   subgroup of order `|H| |M_H|`, characteristic in `S'` and normal in `S`, and `S_Γ = S/D` is a
   Schur cover of `Γ` covering `G → Γ` (compatible Schur covers). Consequently
   `ker(M(G) → M(Γ)) ≅ M_H` has order prime to `|Γ|`.
3. Assume `H` is admissible: it is generated by the elements `h⁻¹ γ(h)`, `h ∈ H`, `γ ∈ Γ`. Let `c`
   be the set of nonidentity elements of `G` whose order equals the order of their image in `Γ`, and
   `d = Γ ∖ {1}`. Then `c` generates `G`, is stable under conjugation and invertible powers,
   `c/G → d/Γ` is a bijection, `G^{ab} → Γ^{ab}` is an isomorphism matching the class degree maps,
   the projection maps `Q_c` onto `Q_d`, and `M(G, c) → M(Γ, d)` is surjective with kernel of
   order prime to `|Γ|`; the compatible covers descend to reduced covers `S_c → (S_Γ)_d`.

Compatible covers are compatible choices, not covers functorial for every group map. Construct
them with their commuting square, kernel map and Schur-cover property, prove independence of the
choice, and prove statements 1–3. *Proof sketch.* Functoriality of `H₂` along the section gives
surjectivity, and transfer bounds the exponent. Schur–Zassenhaus gives a splitting; two splittings
differ by a homomorphism `H → M_Γ`, trivial by coprimality, and a subgroup of order `|D|` maps
trivially to `S'/D`, hence equals `D`. For (3), each element of `c` is conjugate into `Γ` by the
coprime splitting, uniquely up to `H`-conjugacy; each `h⁻¹γ(h)` is a commutator, so admissibility
kills `H` in `G^{ab}`; generators of `Γ` lift through the embedded `Γ` to commuting pairs with first
entry in `c`. Sources: [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Lemma 12.10 and
its proof and the proof of Theorem 10.4, arXiv v2 pp. 53–54 (published version pp. 62–64). The
cover argument uses only finiteness and coprime orders; admissibility is used for the inertia classes
and abelianisation. *Needs:* *Reduced Schur covers*, *The reduced Schur multiplier*, *The class degree
map*; Mathlib `Subgroup.exists_right_complement'_of_coprime`, `SemidirectProduct`,
`groupHomology.map`, `AddCommGroup.equiv_directSum_zmod_of_finite`;
RepresentationTheory/InductionRestriction Layer 7.

**Checks.**

- For `H = 1`, the compatible cover is the identity and the kernel is trivial; for `Γ = 1` the lower
  cover is trivial and `M_Γ = 0`.
- For `H = C₃` with `Γ = C₂` acting by inversion, `G = S₃`, both multipliers are trivial and the
  identity covers are compatible; `H` is admissible and `c` consists of the three transpositions.
- For `H = C₃` with the trivial action of `Γ = C₂`, admissibility fails: `G = C₆`, `H` survives in
  `G^{ab}`, and `c` is the single element of order two, which generates only `C₂`; so admissibility is
  needed for `c` to generate `G`.
- Excluding `1` from `c` is necessary: the identity has the same order as its image.

### IG.3.5 The action of units and the cyclotomic twist

Fix a characteristic exponent `p` (`p = 1` or a prime) with `gcd(p, |G|) = 1`, and let `ẑ^{(p′)×}` be the
group of units of the prime-to-`p` profinite integers. For `α ∈ ẑ^{(p′)×}` and an element `g` of a
finite group of order prime to `p`, `g^α` means `g^a` for any integer `a ≡ α` modulo `ord(g)`.

**Powers by units and the permutation of class degrees.** For a finite group `G` of order prime to
`p`, `α ∈ ẑ^{(p′)×}` acts on the set `G` by `g ↦ g^α`; this is independent of the integer
representative and factors through the units modulo the exponent of `G`. It is a group automorphism
when `G` is abelian, and only a permutation of the underlying set in general. If `c` is stable under
invertible powers, powering permutes `D = c/G`, `d ↦ d^α`, and permutes the coordinates of
`L = ℤ^D` by `m^α(d^α) = m(d)`; it is a coordinate permutation, not multiplication of the coordinates
by `α`. Define the power map `g ↦ g^α` and the permutation `m ↦ m^α` of `L`, and prove that the power
depends only on the residue of `α` modulo the exponent, that `1` acts trivially,
that `α(βg) = (αβ)g`, that powering is an
automorphism for abelian `G`, that `e_d ↦ e_{d^α}`, that
the total degree is preserved, that all coordinates are `≥ M` before
iff after, and that `δ(m^α) = δ(m)^α`. *Proof sketch.* Integer powers
depend only on residues modulo the order; invertible residues give inverse permutations; powering
commutes with conjugation. Source: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §4 and §4.1, equation (4),
pp. 6–8. *Needs:* *The class degree map*; ProfiniteArithmetic Layer 0 (the ring `ẑ` and its units).

**Checks.**

- On `C₃` the residue `2` exchanges the two nonidentity elements; the trivial group has the trivial
  action.
- In characteristic zero `p = 1` and `G = C₂` satisfy `gcd(1, 2) = 1`; all positive Tate indices
  are allowed and every profinite unit fixes the nonidentity element. Requiring `1 ∤ 2` would
  exclude this case.
- In `S₃`, inversion (`α = −1`) fixes the transpositions `(12)` and `(23)` but sends their product
  `(123)` to `(132)`, so it is not a group homomorphism.
- For `c` the two nonidentity elements of `C₃`, `α = 2` sends the degree vector `(1, 4)` to `(4, 1)`;
  for a single involution class every unit fixes the degree `1`, whereas multiplying coordinates by
  `α = 3` would give `3`.

**Central power corrections.** With the class-compatible marking `x ↦ x̂` in a reduced cover and a
representative `x_d` of each class, put `z_d(α) = x̂_d^{−α} · (x_d^α)^ ∈ M(G, c)` and extend to
`W_α : L → M(G, c)` by `W_α(m) = ∏_d z_d(α)^{m(d)}`. Then `W_α(m + n) = W_α(m) W_α(n)`, `W₁ = 1`, the
corrections do not depend on the representative within a class, and they satisfy the composition law
`W_{αβ}(m) = W_β(m)^α · W_α(m^β)`. Changing the marking by `x̂'_d = x̂_d a_d` changes `z_d(α)` to
`a_d^{−α} z_d(α) a_{d^α}`. Define `W_α`, prove its value on basis vectors,
additivity, `W₁ = 1` and the effect of a change of marking, and prove the composition law. *Proof sketch.*
Each `z_d(α)` projects to `1`, hence lies in the kernel; equivariance and centrality make it
independent of the representative; verify the composition law on basis vectors using
`(x^β)^ = x̂^β z(β)`, noting that the second correction is evaluated on the permuted degree. Source:
[Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
§4 and §4.1, equation (4), pp. 6–8. *Needs:* *Powers by units and the permutation of class degrees*,
*Conjugacy classes lift bijectively*.

**Checks.**

- `W_α(0) = 1` and `W₁ = 1`.
- The defining formula makes sense in any marked central extension. In `C₄ → C₂` (not a reduced
  cover, since `M(C₂) = 0`) with `X` a lift of the involution, the correction at `α = −1` is `X²`, the
  nontrivial central element; a definition forcing corrections to be `1` would lose it.
- For `G` abelian with `S_c = G` (so `M(G, c) = 0`), every correction is trivial.

**The discrete action of units.** Assume `c` is conjugacy-invariant, stable under invertible powers
and generates the finite group `G`. On `P = S_c ×_{G^{ab}} L` define

```text
α ∗ (h, m) = (h^α · W_α(m), m^α),
```

and transport it to `U(G, c)` through the marked isomorphism `U(G, c) ≅ P`. This is an action of
`ẑ^{(p′)×}` on the underlying set of `U(G, c)`; it is not by group automorphisms in general. Its
projection to `G` is the power map and its degree projection is the permutation of class degrees.
The marked comparison between two choices of reduced cover intertwines the two actions, and, in the
admissible semidirect situation of the previous subsection, the maps `U(G, c) → U(Γ, d)` and
`K(G, c) → K(Γ, d)` intertwine the actions. Define the unit action `α ∗ u` by the displayed formula
and prove that `π_U(α ∗ u) = π_U(u)^α`,
that `deg(α ∗ u) = deg(u)^α`, and independence of the
model. *Proof sketch.* The pair stays in `P` by the compatibility of `δ` with powers; the
composition law of the corrections gives the action axioms; a cover map commutes with finite powers
and carries corrections to corrections. Sources: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §4 and §4.1, equation (4),
pp. 6–8; [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), proof of Theorem 10.4,
arXiv v2 p. 54. *Needs:* *Central power corrections*, *The marked fibre product and the computation
of `U(G, c)`*, *Coprime semidirect products and admissible inertia*.

**Checks.**

- The unit `1` acts trivially and every unit fixes `1 ∈ U`.
- For `U(C₂, c) ≅ ℤ` the action is trivial: the generator and its class are fixed after correction.
- For `S₃` and `c` the transpositions, `α = −1` is not multiplicative on `U`: it fixes the marked
  transpositions but inverts the image `(123)` of their product.

**The cyclotomic twist of a set.** Let `B` be a group, `T` a nonempty set on which `B` acts simply
transitively, and `X` a `B`-set. The twist `X⟨−1⟩ = Map_B(T, X)` is the set of `B`-equivariant maps.
Evaluation at a chosen `t₀ ∈ T` is a bijection `X⟨−1⟩ ≅ X`, which depends on `t₀`; replacing `t₀` by
`b·t₀` changes the evaluated value by `b`. An equivariant map `X → Y` induces `X⟨−1⟩ → Y⟨−1⟩`. In
the arithmetic applications `B = ẑ^{(p′)×}` and `T` is the set of topological generators of the
prime-to-`p` Tate module `T^{(p′)}μ(k̄) = lim_{n ≥ 1, gcd(n,p)=1} μ_n(k̄)`, with transition maps
given by powers and its natural `Γ_k`-action, where `k̄` is a separable closure of the base field `k`.
In characteristic zero `p = 1`, so every positive index occurs. Take `X = U(G, c)` with the
discrete action. Let a group `Γ` act on `T` through a homomorphism `χ : Γ → B` whose image lies in
the centre of `B`
(`σ·t = χ(σ)·t`; centrality is automatic for commutative `B`, in particular for `B = ẑ^{(p′)×}`), and
trivially on `X`. Then `(σ·f)(t) = f(σ⁻¹·t)` is again `B`-equivariant, this is an action of `Γ` on
the twist, and evaluated at `t₀` it is the unit action of `χ(σ)⁻¹`. Without centrality the
translate of an equivariant map need not be equivariant, and no action on the twist is asserted. For
`Γ = Gal(𝔽̄_q/𝔽_q)` and the cyclotomic character, arithmetic Frobenius acts on evaluated values by
`q⁻¹` and geometric Frobenius by `q`. Define the cyclotomic twist and
prove that evaluation at `t₀` is bijective, the effect of changing `t₀`, functoriality, and,
for central `χ(Γ)`, the displayed action and its evaluation at `t₀`.
*Proof sketch.* The inverse of evaluation sends `x` to `b·t₀ ↦ b·x`, well defined by simple
transitivity. For the Galois action, centrality gives
`f(χ(σ)⁻¹·b·t) = f(b·χ(σ)⁻¹·t) = b·f(χ(σ)⁻¹·t)`, so the translate is equivariant;
`χ(στ)⁻¹ = χ(τ)⁻¹χ(σ)⁻¹` gives the action law; and `f(χ(σ)⁻¹·t₀) = χ(σ)⁻¹·f(t₀)` by equivariance.
Source: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §4, equation (2), p. 6.
*Needs:* *The discrete action of units*; Mathlib `MulAction`, `MulActionHom`.

**Checks.**

- For a one-point `X` the twist has one element.
- For `k = ℚ` and `p = 1`, the rational roots of unity are only `{±1}` and are fixed by `Γ_k`;
  their generator set is not a torsor for `ẑ×`. The compatible generators in the Tate module over
  `ℚ̄` form that torsor and carry the cyclotomic action.
- For `B = T = X = C₂` with the regular action there are exactly two equivariant maps.
- In that example there are four arbitrary maps `T → X` and no fixed points of `X`, so neither all
  maps nor fixed points give the twist.
- With `B = (ℤ/5)^×` acting on the class multiplicity vectors of `G = C₅ = ⟨a⟩`, `c = G − {1}`,
  indexed by `(a, a², a³, a⁴)`: the tuple `(a, a, a³)` has vector `(2, 0, 1, 0)`, sent by the unit `2`
  to `(1, 2, 0, 0)` and by its inverse `3` to `(0, 0, 2, 1)`. For `q ≡ 2 (mod 5)` arithmetic and
  geometric Frobenius therefore act differently on evaluated invariants; adding the same large
  integer to every coordinate keeps the distinction in the stable range.
- Centrality cannot be dropped. Take `B = T = X = S₃` with the left regular actions and `Γ = C₂`
  sending its generator to `s = (12)`, which is not central. The identity map is equivariant, but its
  translate `t ↦ s t` is not: for `b = (23)`, `s b = (123)` while `b s = (132)`.

### IG.3.6 Lifting invariants

**The braid lifting invariant.** For a finite group `G` and a conjugacy-invariant generating subset
`c`, the lifting invariant of a `c`-valued tuple `g = (g₁, …, g_r)` is `Π(g) = [g₁] ⋯ [g_r] ∈ U(G, c)`.
It is invariant under the braid action, multiplicative for concatenation on the whole braid-orbit
monoid, its projection to `G` is the ordered product and its degree is the vector of class
multiplicities. A product-one tuple has invariant in the central kernel `K(G, c)`; the degree vector
must be kept, since `K(G, c)` is infinite and is not the reduced multiplier. Define
`LiftingInvariant.tuple` and prove invariance under each move,
multiplicativity, and the two projections.
*Proof sketch.* The defining relation gives `[a b a⁻¹][a] = [a][b]`, which is exactly invariance under
a Hurwitz move; compute the projections on generators. Source: [Wood, *An algebraic lifting
invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), §3 and Theorem 3.1,
pp. 4–6. *Needs:* *The braid-orbit monoid*, *The universal marked extension*, *The class degree map*,
*The kernel of the universal marked extension*.

**Checks.**

- The empty tuple has invariant `1` and degree `0`.
- The tuples `(a, b)` and `(a b a⁻¹, a)` have the same invariant.
- Adjoining `ord(a)` copies of `a ∈ c` leaves the `G`-product unchanged and raises the degree of the
  class of `a` by `ord(a)`; the invariant changes, so the reduced multiplier alone cannot record it.
- For `G = 1` with `c = {1}`, a one-entry tuple has product one and a nonidentity marked lift in
  `U(1, {1}) ≅ ℤ`; marking the identity does not impose an order relation.

**Stable classification of generating braid orbits.** For a finite group `G` and a conjugacy-invariant
generating subset `c`, there is `M = M(G, c)` such that for every degree vector `m ∈ ℕ^D` with all
coordinates at least `M`, the lifting invariant is a bijection from the braid orbits of generating
`c`-tuples of degree `m` to the elements of `U(G, c)` of degree `m`. Prescribing the ordered product
corresponds to restricting both sides to the same projection to `G`. Non-generating tuples are not
classified, and large class multiplicities do not force generation. *Proof sketch.* A finite-group
cancellation lemma (Fried–Völklein, Appendix, Lemma 3) moves a full order block of any conjugate to a
chosen element while keeping the tuple generating; concatenation with such blocks becomes bijective
on orbits once every multiplicity is large; localising the orbit monoid at the product of all central
order blocks gives the group `U(G, c)`; insert a generating core for surjectivity. Sources: [Wood, *An
algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
Theorem 3.1 and its proof, pp. 5–6, and Remark 5.4, pp. 11–12. *Needs:* *The braid lifting
invariant*, *Extracting an element of a single class*.

*Lean:* `LiftingInvariant.stable_classification`, using `HurwitzEquivalent` for the equivalence
relation generated by the concrete Hurwitz moves, `ReducedSchur.degree` for class degrees and
`LiftingInvariant.tuple` for lift products.

**Checks.**

- Every coordinate of `m` must exceed the threshold; a large total length with one small class
  multiplicity is not enough.
- For `G = C₂` and `c = {nontrivial}`, braid orbits of tuples of length `n` are single points and
  `U = ℤ` has one element of degree `n`, so the bijection holds for all `n ≥ 1`.
- For `G = S₃` and `c` the transpositions, arbitrarily many repetitions of `(12)` remain inside
  a proper `C₂`; the generation hypothesis is needed even when the only class multiplicity is large.

**Tate-twisted arithmetic lifting invariants.** Let `G` be finite and `c` a union of rational classes
that generates `G`, over a base field whose characteristic does not divide `|G|`. For a tame marked
`G`-cover of the punctured line, the lifting invariant of its topological branch tuple, computed with
a chosen topological generator of the prime-to-`p` roots of unity, becomes independent of that choice as an
element of the twist `U(G, c)⟨−1⟩`, and the Galois action on covers corresponds to the discrete action
of units through the cyclotomic character: by *The cyclotomic twist of a set*, `σ` acts on evaluated
invariants by the unit `χ(σ)⁻¹`.

In the narrower setting of Wood's Cohen–Lenstra application (a surjection `ε : G ↠ C₂` whose
involutions outside `ker ε` form a single class `c`), let `p ∤ |G|`, let `B ⊂ 𝔸¹(𝔽̄_p)` be finite,
`S = B ∪ {∞}`, and `φ : π₁^t(ℙ¹_{𝔽̄_p} − S) → G` tame, not necessarily surjective, with inertia in
`c ∪ {1}`, ramified at every point of `B` and possibly at `∞`. The full tame group `π₁^t` is not free
pro-prime-to-`p`; its maximal prime-to-`p` quotient `π₁^{(p′)}` is, on generators `δ_1, …, δ_k` of tame
inertia at the points of `B`, chosen so that `δ_∞ = (δ_1 ⋯ δ_k)⁻¹` generates tame inertia at `∞`. As
`p ∤ |G|`, `φ` factors through `π₁^{(p′)}`, and all inertia generators are read there. Fix a reduced
Schur cover `S_c` with kernel `A = M(G, c)` and its class-compatible marking `x ↦ [x]`, extended by
`[1] = 1`, and for `f ∈ S_c` over `c ∪ {1}` let
`z(f)` be the conjugate of `f` lying over a fixed `c₀ ∈ c`, or `f` itself if `f` lies over `1`. Put
`J_S = [φ(δ_1)] ⋯ [φ(δ_k)] ∈ S_c` and let `N_fin ∈ ℤ^D` be the class multiplicity vector of the
finite branch points. Then:

1. `J_S` maps to `δ(N_fin)` in `G^{ab}`. If moreover `c` generates `G` (`Subgroup.closure c = ⊤`),
   then under the marked isomorphism `U(G, c) ≅ S_c ×_{G^{ab}} ℤ^D` the pair `(J_S, N_fin)` is the
   lifting invariant of the finite branch tuple; its degree is `N_fin`, not the number `m` of
   geometric branch points.
2. Tame lifts `φ̂` of `φ` to `S_c` exist: `|S_c| = |M(G, c)| · |G|` is prime to `p` because the
   multiplier is killed by `|G|`, so send each free generator `δ_i` of `π₁^{(p′)}` to a lift of
   `φ(δ_i)` and compose with `π₁^t → π₁^{(p′)}`. For every such lift the central element
   `C(φ) = ∏_{s ∈ S} z(φ̂(δ_s)) ∈ A` does not depend on `φ̂`, and in `S_c`
   `J_S = [c₀]^m · C(φ)⁻¹ · [φ(δ_∞)]⁻¹`, where `m` counts the geometric branch points, `∞` included
   when it is ramified. No generation hypothesis is needed here.
3. If `c` generates `G`, then in `U(G, c)` the same identity reads
   `(J_S, N_fin) = [c₀]_U^m · ι(C(φ))⁻¹ · [φ(δ_∞)]_U⁻¹`, with `ι` the degree-zero inclusion of `A` into
   the kernel `K(G, c)` and `[1]_U = 1`. The correction at a ramified `∞` is the universal marked
   lift, which removes one degree; the raw element `φ(δ_∞) ∈ G` cannot be used, since `U(G, c) → G`
   has no group-theoretic section in general.

Generation in (1) and (3) is a hypothesis on the class set `c`, not on `φ`: the branch tuple of `φ`
need not generate `G`.

These identities are algebraic and hold over `𝔽̄_p` for every such `φ`. Wood's Theorem 3.13
identifies `C(φ)⁻¹`, for a suitable norm-compatible root of unity `u`, with her arithmetic invariant
`I(φ, u)` of Definition 3.1 over `𝔽_q(t)`, the inversion between that statement and its proof being
absorbed in the choice of `u`. That identification needs the arithmetic invariant over the global
function field `𝔽_q(t)`; Layer IG.4 *The global arithmetic lifting invariant* is constructed over
number fields only, and its function-field analogue is outside this roadmap (end of Layer IG.4). It
is therefore not a target here, and no statement of this roadmap uses it. *Proof sketch.* Use the
common prime-to-`p` peripheral Tate module and compare the chosen generators at every finite branch
place; the twist makes the product independent of the Tate generator. For (1), `J_S` is a product of
marked lifts of the finite branch tuple, so its abelianized image is `δ(N_fin)`; when `c` generates
`G`, *The marked fibre product and the computation of `U(G, c)`* supplies the marked isomorphism,
which sends `[x]_U` to `([x], e_{[x]})`. For (2), each `φ̂(δ_s)⁻¹[φ(δ_s)]` is central and equals
`z(φ̂(δ_s))⁻¹[c₀]`, or `z(φ̂(δ_s))⁻¹` when `φ(δ_s) = 1`; multiply over `s ∈ S` and use
`δ_1 ⋯ δ_k δ_∞ = 1`. Two lifts differ by a homomorphism to the central `A`, whose product over the
`δ_s` is trivial. For (3), apply the marked isomorphism to each factor. Sources: [Wood, *An algebraic
lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf), Theorem 3.1,
Theorem 5.2, Remark 5.4, §6.1 and Theorem 6.1 with its proof, pp. 5–12; [Wood, *Nonabelian
Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), Definition 3.12, Theorem 3.13
and its proof, equation (4), pp. 394–398. *Needs:* *The braid lifting invariant*, *Stable
classification of generating braid orbits*, *The discrete action of units*, *The cyclotomic twist of
a set*, *Conjugacy classes lift bijectively*, *The marked fibre product and the computation of
`U(G, c)`*, *The kernel of the universal marked extension*; Layer IG.1 *Tame and prime-to-`p`
fundamental quotients*, Layer IG.1 *Tame tangential fibres at a boundary point*, Layer IG.1
*Frobenius and cyclotomic normalisation*.

**Checks.**

- If infinity is unramified its correction in (2) and (3) is `[1] = 1`.
- For a general union of rational classes only the twisted invariant is defined; applying the explicit
  involution formula outside its setting is excluded.
- For the double cover `y² = t`, with `G = C₂` and `S_c = C₂`, there are two geometric branch points
  (`0` and `∞`) but one finite one: `m = 2`, `N_fin = 1`, and `[c₀]_U² · [σ]_U⁻¹` has degree one in
  `U(C₂, c) ≅ ℤ`. A conversion keeping `J_S` but recording `m` as the degree would give two. For
  `y² = t(t − 1)`, unramified at `∞`, the correction is trivial and the degree is two.
- `U(C₂, {σ}) ≅ ℤ → C₂` is reduction modulo `2` and has no homomorphic section, so an element of `G`
  has no canonical image in `U(G, c)`.
- Generation of `G` by `c` is needed in (1) and (3). Let `N = C₇ ⋊ C₃ = ⟨r, s | r⁷ = s³ = 1,
  s r s⁻¹ = r²⟩` and `G = C₂ × N`, with `ε` the first projection. As `N` has odd order, the involutions
  outside `ker ε` form the single central class `c = {a}`, `a` the generator of the `C₂` factor, which
  generates only `C₂`. Then `U(G, c) ≅ ℤ`, while `M(G) = 0` gives `S_c = G` and
  `G ×_{G^{ab}} ℤ` contains `(r, 0)`, since `r ∈ [N, N]`: it has a subgroup of order seven and is not
  `ℤ`. A double Kummer cover in characteristic `5`, composed with `C₂ → G`, satisfies the other
  hypotheses, and (2) holds for it.

### Examples

- `G = S₃`, `c` the transpositions: `D` has one element, `M(S₃) = 0`, so `S_c = S₃` and
  `U(S₃, c) ≅ S₃ ×_{C₂} ℤ`, the pairs `(σ, n)` with `sign(σ) = (−1)^n`. A tuple of `n`
  transpositions with product one has invariant `(1, n)`; for `n ≥ 2` even and `n` large, the
  generating product-one tuples of length `n` form a single braid orbit.
- `G = C₂²`, `c` the three nonidentity elements: `M(G, c) = 0`, `S_c = G`, and
  `U(G, c) ≅ G ×_G ℤ³ ≅ ℤ³` through the degree, so the lifting invariant of a tuple is its vector of
  class multiplicities.

### Dependencies

ComplexComparisonPartII §§C6.0, C6.2–C6.3 / `complexAlgebraicTopology`, `riemannExistence`,
`artinComparison` supply finite CW type, Riemann existence and elementary
fibrations with the Artin comparison; ComplexComparisonPartII §C−1.1 supplies
analytic spaces and scheme analytification, and ComplexComparisonPartII §C4.5 supplies the
completion and connectedness interfaces for curves; AlgebraicTopology Stages 5 and 8 fibrations and
homotopy groups. EtaleCohomologyFoundations §§F.0.A1–F.0.A2 supply the arithmetic sequence
and inertia; Layer IG.1 supplies tangential base points and the Frobenius normalisation;
Layer IG.0 Galois algebras. The braid group is Tau Ceti `TauCeti.BraidGroup`; free groups,
presented groups, group extensions, group homology, Schur–Zassenhaus and finitely supported functions
are Mathlib's; Schur covers are RepresentationTheory/InductionRestriction Layer 7; `ẑ` is
ProfiniteArithmetic Layer 0; the Belyi dictionary for three points is BelyiMaps Layers 3, 5, 6 and 11.
The complex topology contract uses separated finite type for global finite CW type, and Riemann existence and Artin comparison keep the shared fibre/deck convention.

## Layer IG.4: embedding problems, Shafarevich's theorem and unramified `Γ`-groups

This layer develops the arithmetic of embedding problems over global fields. It starts from the finite
embedding problems and their (weak) solutions in ProfiniteProPGroups Layer 5 and adds two things:
properness, meaning surjective solutions, and prescribed local behaviour. It then builds the
abelian-kernel obstruction and twisting of solutions. ArithmeticGaloisDuality §§R02.3.0d,
R02.4.5a–R02.4.5b supply finite-coefficient localization kernels `Ш^i`, absolute Poitou–Tate duality
and the Grunwald–Wang
alternative (the obstruction group has order one or two) and Wang's cyclic-eight obstruction, and
ArithmeticGaloisDuality identifies the exceptional case exactly. The Schmidt–Wingberg proof of
Shafarevich's theorem comes next:
every finite solvable group is a Galois group over every number field. Its steps are free
operator-group shrinking, induced and cyclic corrections, the split nilpotent embedding theorem and
Fitting supplements.

The second half covers four topics:

- local prescriptions through the homogeneous spaces `SL_n/G`: weak approximation and nonabelian
  localization, the supersolvable and quaternion Grunwald problems, and realizations over fields whose
  degrees have greatest common divisor one;
- the unramified `Γ`-groups `Gal(K^#/K)` of Liu–Wood–Zureick-Brown, their admissibility and Property E;
- Wood's arithmetic lifting invariant for tame central lifts;
- marked extensions with their infinity types.

Conventions:

- For a global field `K`, `Γ_K` is the Galois group of a fixed separable closure. For each place `v` a
  decomposition embedding `ι_v : Γ_{K_v} → Γ_K` is fixed, and statements that depend on this choice say
  so. `H^i(K, A)` is continuous cohomology of `Γ_K` with coefficients in a finite discrete module.
- A *weak solution* of an embedding problem is a solution in the sense of ProfiniteProPGroups Layer 5.
  It need not be surjective; a *proper solution* is a surjective one.
- In IG.4.5, `Γ` is a finite group and a `Γ`-group is a profinite group with a continuous `Γ`-action. A
  pro-`n′` group is a profinite group all of whose finite quotients have order prime to `n`.

### IG.4.1 Embedding problems and the abelian obstruction

**Proper solutions with local prescriptions.** Let `K` be a global field. Let `π : Γ_K ↠ Q` and
`α : E ↠ Q` form a finite embedding problem for `Γ_K` in the sense of ProfiniteProPGroups Layer 5,
whose solutions are the continuous `β : Γ_K → E` with `α ∘ β = π`. This target differs from that notion
in one clause: a proper solution must be surjective, and its restrictions at finitely many places are
prescribed.

Define a proper solution as a weak solution `β` that is surjective. Define a local prescription
for a finite set `S` of places: for each `v ∈ S`, a compatible local lift `β_v : Γ_{K_v} → E`, that is,
one with `α ∘ β_v = π ∘ ι_v`. A global solution `β` satisfies the prescription when for every `v ∈ S`
there is `n_v ∈ ker α` with `β ∘ ι_v = n_v β_v n_v⁻¹`. Prescribing only the local extension is weaker: it
asks for conjugacy by some element of `E`. These are two different moduli problems and are kept apart.
Proper solutions correspond to `E`-Galois field extensions `M/K` that contain the `Q`-extension cut out
by `π`, compatibly with `α`. Weak solutions correspond to `E`-Galois algebras.

The API:
- Forgetting surjectivity returns exactly a solution in the sense of
  ProfiniteProPGroups Layer 5.
- A proper solution gives a field realization of `E`, and the fixed
  field of `β⁻¹(ker α)` is the specified `Q`-field.
- If `ι_v` is replaced by `g ι_v g⁻¹` with `g ∈ Γ_K`, the prescription
  `β_v` is replaced by `e β_v e⁻¹` for any `e ∈ E` with `α(e) = π(g)`; the result is well defined up to
  `ker α`-conjugacy.
- For two lifts of the same `π ∘ ι_v`, the equivalence keeps the
  map to `Q` fixed and is conjugacy by `ker α`.

*Proof sketch.* Keep the weak solution, its openness condition and its commuting square. Add
surjectivity and the two equivalence relations, and apply the correspondence between torsors and Galois
algebras. A change of decomposition embedding is conjugation by an element of `Γ_K`, so it conjugates
the local map.

Sources: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Introduction and Theorems 14–15, PDF
pp. 1–2, 20–22 (the distinction between solutions and proper solutions);
[Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), §§2.3–2.4,
pp. 1014–1016 (cohomology classes and twisting describe when two local lifts are equivalent).
*Needs:* ProfiniteProPGroups Layer 5; Layer IG.0 *Finite Galois algebras and torsors*, EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*.

**Checks.**

- Take `E = C₂` and `Q = 1`. The trivial homomorphism `Γ_K → C₂` is a weak solution, corresponding to
  the split algebra `K × K`, but it is not proper. A definition without surjectivity would accept it.
- When `α` is an isomorphism, `α⁻¹ ∘ π` is the unique weak solution, and it is proper because `π` is
  surjective. This is the degenerate case in which the two notions agree.
- Take `E = Q = S₃` and `α = id`, so `ker α = 1` and `ker α`-conjugacy is equality. Conjugating a local
  lift with image `⟨(12)⟩` by `(123)` gives a homomorphism with a different composite to `Q`. So
  `E`-conjugacy changes the fixed quotient map and cannot replace `ker α`-conjugacy.

**Finite abelian-kernel obstruction and pullback.** Let `1 → A → E → Q → 1` be an extension of finite
groups with `A` abelian, `Π` a profinite group and `π : Π → Q` a continuous homomorphism. Conjugation in
`E` makes `A` a `Q`-module; since `A` is abelian, this does not depend on the chosen lifts. Write `A_π`
for `A` viewed as a discrete `Π`-module through `π`. The class `e ∈ H²(Q, A)` of the extension pulls
back to `π*e ∈ H²_cont(Π, A_π)`, and

```text
there is a continuous β : Π → E with (E → Q) ∘ β = π   ⟺   π*e = 0.
```

When lifts exist, their `A`-conjugacy classes form a torsor under `H¹_cont(Π, A_π)`, and choosing one
lift identifies this torsor with `H¹_cont(Π, A_π)`. Pullback is natural for continuous homomorphisms of
the profinite source and for compatible homomorphisms of extensions. The criterion is about weak lifts
only and says nothing about surjectivity.

For a surjective `π`, the criterion itself is Tau Ceti's
`TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero` for the class
`TauCeti.FiniteEmbeddingProblem.obstruction` (implementing
ProfiniteProPGroups Layer 5, whose own statement is for elementary abelian `p`-kernels). This target
cites it, extends it to a `π` that need not be surjective by passing to its image, and adds the
torsor of lifts and the naturality.

*Proof sketch.* Use the continuous sections and factor sets of ProfiniteProPGroups Layer 5 to write the
defect of a set-theoretic lift as a 2-cocycle, and track how it changes under a continuous 1-cochain. A
lift is a splitting of the pulled-back extension. Two lifts differ by a 1-cocycle, and the coboundaries
are exactly the changes by `A`-conjugation.

Source: [Merkurjev–Scavia](https://arxiv.org/pdf/2410.12560v1), §1.2 and Proposition 2.1, PDF pp. 2, 5
(lifting with arbitrary abelian kernel, and its interpretation by Galois algebras).
*Needs:* *Proper solutions with local prescriptions*; ProfiniteProPGroups Layer 5; Tau Ceti
`TauCeti.FiniteEmbeddingProblem.obstruction`,
`TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`.

**Checks.**

- A split extension `E = A ⋊ Q` has `e = 0`, and `s ∘ π` is a weak solution for any splitting `s`.
- Take `A = E = C₂`, `Q = 1` and `Π = Γ_K`. Then `π*e = 0`, and the lifts are the homomorphisms
  `Γ_K → C₂`, a torsor under `H¹(K, ℤ/2)`. The trivial lift classifies the split algebra `K × K`, so a
  vanishing obstruction is no evidence of a proper solution.
- Take `Π = Q = C₂`, `π = id` and `E = C₄`. The class `e` is the nonzero element of
  `H²(C₂, ℤ/2) ≅ ℤ/2`, and the identity of `C₂` has no lift, because `C₄ → C₂` has no section.

### IG.4.2 Twisting and cyclic prescriptions

ArithmeticGaloisDuality §R02.3.0d supplies finite Galois localization and Sha kernels;
§R02.4.5a supplies the absolute finite-coefficient Poitou–Tate theorem; §R02.4.5b supplies
Grunwald–Wang and its exceptional class. This subsection applies these to twisting
abelian-kernel solutions and cyclic degree-eight prescriptions.

**Twisting abelian-kernel solutions.** Let `K` be a global field. Fix a finite embedding problem
`π : Γ_K ↠ Q`, `α : E ↠ Q` whose kernel `A = ker α` is abelian, and a weak solution `β`. Let `A_π` be
`A` with the action `σ · a = β(σ) a β(σ)⁻¹`, which depends only on `π`. Define the twist as
follows. For a continuous crossed homomorphism `z : Γ_K → A_π`, that is, one with
`z(στ) = z(σ) · (σ · z(τ))`, the map `zβ : γ ↦ z(γ)β(γ)` is again a weak solution. Every weak solution
equals `zβ` for a unique `z`, before passing to `A`-conjugacy.

Compatible local lifts `β_v` at the places `v ∈ S` determine local difference classes
`[β_v · (β ∘ ι_v)⁻¹] ∈ H¹(K_v, A_π)`. When `K` is a number field and `S` is finite, some weak solution
satisfies all these prescriptions up to `ker α`-conjugacy exactly when the tuple of difference classes
maps to zero in the localization defect of ArithmeticGaloisDuality §R02.3.0d *Finite Galois localization and Sha kernels*. Properness is a
separate condition on the image. Twisting does not preserve it, and it is obtained only from an
auxiliary-prime theorem such as *Induced abelian proper solutions*.

The API:
- `zβ` is a weak solution with the same map `π` to `Q`.
- For weak solutions `β` and `β′`, the map `β′β⁻¹ : γ ↦ β′(γ)β(γ)⁻¹` is the
  unique crossed homomorphism with `β′ = (β′β⁻¹)β`.
- Restriction along `ι_v` takes the twist by `z` to the twist by `z ∘ ι_v`.
- The class in the localization defect is zero exactly when the local
  difference classes are realized by a global twist.

*Proof sketch.* The crossed-homomorphism identity follows by expanding `(zβ)(στ)`. The local
differences, compared through the cokernel that defines the localization defect, give the criterion;
coboundaries correspond to `A`-conjugation.

Sources: [Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf),
Proposition 2.2 and equation 2.2, pp. 1015–1016, which fix the order of multiplication in `zβ`;
[Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), proof of Theorem 15, steps 3–4,
PDF pp. 27–32, which separates properness and local correction from weak solvability.
*Needs:* *Finite abelian-kernel obstruction and pullback*, ArithmeticGaloisDuality §R02.3.0d *Finite Galois localization and Sha kernels*,
ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input*.

**Checks.**

- The zero crossed homomorphism leaves `β` unchanged.
- Let `π : Γ_K → C₂` be a quadratic character and let `E = S₃ → C₂` be the sign map, so `A = C₃` with
  `C₂` acting by inversion. Take the two sections `s(σ) = (12)` and `s′(σ) = (13)` of the sign map,
  where `σ` generates `C₂`. The difference `z` of `s′ ∘ π` and `s ∘ π` is the 3-cycle `(13)(12)` on
  elements over `σ` and is `1` on elements over `1`. It is a crossed homomorphism but not a homomorphism:
  for `γ` over `σ`, `z(γ)²` is a nontrivial 3-cycle while `z(γ²) = 1`. So when `Q` acts nontrivially on
  `A`, a difference cannot be an ordinary homomorphism.
- Take `E = C₂` and `Q = 1`. A proper solution is a surjective character `β : Γ_K → C₂`, and twisting by
  its own inverse `z = β` gives the trivial lift. So twisting can turn a proper solution into a
  non-proper one.

**Two independent cyclic degree-eight lifts.** Let `p ≠ q` be primes with `p ≡ q ≡ 1 (mod 8)`. The
quadratic characters of `ℚ(√p)` and `ℚ(√(2q))` lift to surjections `ψ₁, ψ₂ : Γ_ℚ → ℤ/8`. The pair
`(ψ₁, ψ₂) : Γ_ℚ → (ℤ/8)²` is surjective, so the compositum `L` of the two cyclic fields has degree 64.
The three quadratic subfields of `L` are `ℚ(√p)`, `ℚ(√(2q))` and `ℚ(√(2pq))`, and none of them is
`ℚ(√−1)`, `ℚ(√2)` or `ℚ(√−2)`. Independence is proved modulo 2 and then by the Frattini criterion for
`(ℤ/8)²`; an arbitrary pair of cyclic lifts need not be independent.

*Proof sketch.* Each quadratic class lifts locally: at `2`, `p` and `q` the relevant Hilbert symbols
with `μ₄(ℚ_v)` are trivial, and at the other places the class is unramified or split. The global
obstruction attached to `0 → ℤ/4 → ℤ/8 → ℤ/2 → 0` then lies in `Ш²(ℚ, ℤ/4) = 0` (ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class*). A lift of a nonzero quadratic character is automatically onto `ℤ/8`. The classes of
`p`, `2q` and `2pq` are non-squares, by their `p`- and `q`-adic valuations. A subgroup of `(ℤ/8)²` that
maps onto `(ℤ/2)²` is the whole group.

Source: [Harpaz–Wittenberg, *Massey vanishing*](https://arxiv.org/pdf/1904.06512v2), Lemma 7.6 and the
final proof, PDF pp. 28–31. This is a concrete construction with two lifts, different from general
Grunwald prescriptions.
*Needs:* *Finite abelian-kernel obstruction and pullback*, ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class*,
ArithmeticGaloisRepresentations §6.4a *Frattini detection of full profinite image*.

**Checks.**

- The quadratic characters are independent modulo 2, so their `C₈`-lifts generate `C₈²` by the Frattini
  criterion. For `p = 17` and `q = 41`, the quadratic subfields are `ℚ(√17)`, `ℚ(√82)` and `ℚ(√1394)`,
  and `[L : ℚ] = 64`.
- Let `ψ` lift the character of `ℚ(√p)`. Then `ψ` and `3ψ` are both surjective lifts, but `(ψ, 3ψ)` has
  image `{(x, 3x)}` of order 8 and the compositum has degree 8. Independence modulo 2 is what forces
  degree 64.

**Wang's cyclic-eight local obstruction.** There is no cyclic extension `L/ℚ` of degree 8 for which
`L ⊗_ℚ ℚ₂` is the unramified field extension of `ℚ₂` of degree 8. Hence a supersolvable group such as
`C₈` does not satisfy arbitrary local Grunwald prescriptions once places dividing its order are allowed.
The statement concerns this one place and this one local field; other `C₈`-realizations are not
excluded.

*Proof sketch.* By the factorization
`x⁸ − 16 = (x² − 2)(x² + 2)(x² − 2x + 2)(x² + 2x + 2)`, and since one of `2, −2, −1` is a square in
every `ℚ_v` with `v ≠ 2` (the real place included), `16` is an eighth power at every `v ≠ 2`. Hence `16`
is a local norm from `L` at every such `v`. The local invariants of the cyclic algebra formed from a
generating character of `L/ℚ` and `16` sum to zero, so `16` is also a local norm at `2`. But every norm
from the unramified extension of `ℚ₂` of degree 8 has valuation divisible by 8, while `v₂(16) = 4`.

Source: [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
Introduction, p. 4, citing Wang (1948).
*Needs:* ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class*; ClassFieldTheory Layers 7 and 10.

**Checks.**

- The excluded local algebra is the unramified field of degree 8, not any degree-8 étale algebra. Let
  `L` be the cyclic degree-8 subfield of `ℚ(ζ₁₇)`, the fixed field of `{±1} ⊂ (ℤ/17)^×`. Since `2` has
  order 8 modulo 17 and `2⁴ ≡ −1`, the decomposition group `⟨2⟩` of `2` contains `−1`, so its image in
  `Gal(L/ℚ) ≅ (ℤ/17)^×/{±1}` has order 4: `L ⊗ ℚ₂` is the product of two copies of the unramified
  extension of `ℚ₂` of degree 4. Cyclic degree-8 extensions of `ℚ` therefore exist; the theorem
  excludes only the unramified octic completion.
- The numerical obstruction is that `v₂(16) = 4` is not divisible by 8. For the unramified extension of
  degree 4 the same argument gives no contradiction, since `4 | 4`.

### IG.4.3 Shafarevich's theorem

**Free operator-group shrinking.** Let `G` be a finite group and `p` a prime. For `d ≥ 1`, let `F(d)`
be the free pro-`p` group (ProfiniteProPGroups Layer 4) on the basis `x_{i,g}`, `1 ≤ i ≤ d`, `g ∈ G`,
with `G` acting by `g′ · x_{i,g} = x_{i,g′g}`. This is the free pro-`p` `G`-operator group of rank `d`.
Write `F(d)^i` for the descending `p`-central series (`F^1 = F`, `F^{i+1} = (F^i)^p [F^i, F]`) and
`F(d)_j` for the lower central series. For `ν = (i, j)` with `i ≥ j ≥ 1`, put

```text
F(d)^ν = (F(d)^i ∩ F(d)_j) · F(d)^{i+1},
ν + 1  = (i, j+1) if j < i,   (i+1, 1) if j = i,
E(d, ν) = F(d)^ν / F(d)^{ν+1},   an 𝔽_p[G]-module.
```

Fix `n, t ≥ 1`, an integer `k`, and a finite `𝔽_p[G]`-module `T`.

1. There is `m₀ ≥ n` with the following property for every `m ≥ m₀`. For any `t` classes in Tate
   cohomology `Ĥ^k(G, E(m, ν) ⊗ T)`, some surjective `G`-operator homomorphism `F(m) → F(n)` sends all
   of them to zero in `Ĥ^k(G, E(n, ν) ⊗ T)`.
2. The same holds for `t` classes in Tate degree `−2`, that is in `H₁`, of either `F(m)/F(m)^ν ⋊ G` or
   `F(m)/F(m)^ν`, with coefficients `E(m, ν) ⊗ T` on which `F(m)/F(m)^ν` acts trivially. The classes
   are killed by the corresponding map to level `n`.

These are separate statements, each about its own group and coefficients. No single map kills arbitrary
classes in every degree at once.

*Proof sketch.* The iterated-commutator `p`-power map from the `j`-th tensor power of the Frattini
quotient onto `E(d, ν)` is surjective (Proposition 5). Chevalley–Warning gives a surjective
`𝔽_p[G]`-linear shrinking map that kills finitely many tensor elements (Proposition 2), and freeness
with Frattini generation lifts it to `F(m) → F(n)`. Dimension shifting reduces (1) (Proposition 6) to
Tate degree `−1`. Statement (2) (Proposition 7) uses `Ĥ^{−2} = H₁`, the low-degree homology sequence of
the semidirect product, and two successive shrinkings. The induction of *Split nilpotent proper
embedding theorem* uses these statements in four separate ways.

Source: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Propositions 2 and 5–7 with proofs,
PDF pp. 3–11.
*Needs:* ProfiniteProPGroups Layers 3, 4 and 5; ProfiniteCohomology Layers 1 and 7.

**Checks.**

- The shrinking map `F(m) → F(n)` stays surjective after it kills the finite list of classes.
- `F(d)^{(1,1)} = F(d)` and `F(d)^{(2,1)} = F(d)^2`. So `E(d, (1,1))` is the Frattini quotient, the free
  module `𝔽_p[G]^d`.
- The successor of `(1,1)` is `(2,1)`, that of `(2,1)` is `(2,2)`, and that of `(2,2)` is `(3,1)`. The
  degree `−2` statement is about homology `H₁`, not ordinary `H²`.

**Induced abelian proper solutions.** Let `K/k` be a finite Galois extension of number fields with group
`G`, let `p` be a prime and `n ≥ 0`. Then every finite embedding problem `Γ_k ↠ G = Gal(K/k)`,
`E ↠ G`, whose kernel is the induced `G`-module `𝔽_p[G]^n`, has a proper solution. The statement is
about this induced module, not about every abelian kernel.

*Proof sketch.*
- By Shapiro's lemma `H²(G, 𝔽_p[G]^n) = 0`. So `E` splits, the pulled-back obstruction vanishes, and
  there is a weak solution.
- Choose primes `𝔭_1, …, 𝔭_r` of `k` that split completely in `K` (Chebotarev), not above 2,
  together with local homomorphisms `Γ_{k_{𝔭_i}} → 𝔽_p[G]^n` whose images generate the
  kernel.
- Through Shapiro's lemma, ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class* (which has no exceptional class in
  prime exponent) and ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input* make the global restriction onto these
  local factors surjective.
- Twisting the weak solution to match them (*Twisting abelian-kernel solutions*) puts the whole kernel
  in the image, so the image is all of `E`.

Source: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Proposition 11 and its proof, PDF
p. 11 (vanishing for induced modules, and auxiliary generators that force properness).
*Needs:* *Proper solutions with local prescriptions*, ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input*,
*Twisting abelian-kernel solutions*, ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class*; ProfiniteCohomology
Layer 7; ClassFieldTheory Layers 10 and 12; Chebotarev Layer 10.

**Checks.**

- For `n = 0` the kernel is trivial, and `Γ_k ↠ G` itself is the proper solution.
- For `G = 1` (that is, `K = k`) and `n = 1`, the problem is `𝔽_p → 1`. A proper solution is a
  surjective character `Γ_k → 𝔽_p`, that is, a cyclic extension of degree `p`. The zero character is a
  weak solution that is not proper; the auxiliary local generators are what exclude it.
- The induced hypothesis cannot be dropped. Over `k = ℚ` with `K = ℚ(√−1)` and `p = 2`, the kernel `𝔽₂`
  with trivial action gives `C₄ → C₂`. `H²(C₂, 𝔽₂) ≠ 0`, and `ℚ(√−1)` does not embed in a cyclic quartic
  field because `−1` is not a sum of two squares in `ℚ` ([Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1),
  Introduction, PDF pp. 1–2). So there is not even a weak solution.

**Restricted-ramification localization adapter.** Let `F` be a number field, `p` a prime,
`T` a finite set of places and `S ⊇ T ⊇ S_p ∪ S_∞` a possibly infinite set of allowed ramification
places. Use ArithmeticGaloisDuality R02.3.1's field `F_S` and group `G_{F,S}`. For a finite
`G_{F,S}`-module `A`, inflation embeds `H¹(G_{F,S}, A)` in `H¹(Γ_F, A)` with image precisely the
classes whose restrictions to inertia at every finite `v ∉ S` vanish. The action on `A` factors
through `G_{F,S}`; the characterization concerns classes, not just the ramification of `A`.
For finite `K/k` inside `k_S`, with `S_K` the places above `S`, the supplier's tower identification
`K_{S_K} = k_S` gives `H¹(k_S/K, A) = H¹(G_{K,S_K}, A)`. Inflation, restriction, corestriction and
coefficient maps commute with these identifications and localization; local corestriction sums
over the places above the base place. These operations preserve the indicated ramification bounds.

For `μ_p ⊆ F`, construct the mixed localization and ramification row

```text
H¹(G_{F,S}, μ_p) → B_{S,T}(F, μ_p) → H¹(G_{F,T}, ℤ/p)^*,
B_{S,T}(F, μ_p) = (∏_{v∈T} H¹(F_v, μ_p))
                 × (⊕_{v∈S∖T} H¹(F_v, μ_p)/H¹_nr(F_v, μ_p)).
```

It is exact at `B_{S,T}`. The first map records full local classes on `T` and only ramification
classes on `S ∖ T`. For `b = (b_v)` and `χ ∈ H¹(G_{F,T}, ℤ/p)`, the second map is
`χ ↦ ∑_{v∈S} inv_v(b_v ∪ χ_v)`. At `v ∈ S ∖ T`, choose a representative of `b_v`: the value is
independent of it since `χ_v` is unramified and the unramified subgroups are exact annihilators.
The sum is finite. Retain the real terms: in degree one they are ordinary `H¹`, with the supplier's
Tate modifications in degree zero. The star denotes the Pontryagin dual of the discrete group.
Exactness also applies after replacing `T` by any finite `T′` between `T` and `S`.

*Proof sketch.* Consume ArithmeticGaloisDuality R02.3.1's quotient, membership and tower interfaces,
R02.4.2's restricted products, their duality and unramified annihilators, and R02.4.3's Poitou–Tate
sequence for this `S`, with `p` invertible in the ring of `S`-integers. Inflation–restriction gives
the image characterization; the closed normal subgroup defining `G_{F,S}` is generated by inertia
outside `S`. Quotient `P¹_S(F, μ_p)` by the compact subgroup with zero components on `T` and
unramified components elsewhere. Its annihilator on global dual classes is exactly the inflated
`H¹(G_{F,T}, ℤ/p)`. Exactness of Poitou–Tate and Pontryagin duality gives the mixed row; the global
image plus that compact subgroup is closed. This construction preserves allowed ramification,
including when `S = cs(Ω/k) ∪ T` and after passing to `K`.

Sources: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Definition 9 and Lemma 10,
PDF pp. 10–11, and the mixed row in the proof of Theorem 13, PDF pp. 14–15;
Milne, *Arithmetic Duality Theorems*, Chapter I,
§4, Theorem 4.10 and its proof, pp. 56–62 (PDF pp. 64–70).
*Needs:* ArithmeticGaloisDuality §§R02.3.1, R02.4.2–R02.4.3, with precisely the quotient/tower,
unramified-annihilator, restricted-product and possibly infinite-`S` contracts above;
ProfiniteCohomology Layers 1, 7 and 10; ClassFieldTheory Layer 5; LocalFieldsRamification Layers 2–4.

**Checks.**

- If `S = T` is finite, the direct sum disappears and the row is the degree-one localization row
  of restricted-ramification Poitou–Tate. Taking `S` to be all places instead recovers absolute
  global cohomology, with ramification data still retained outside `T`.
- For `p = 2` and `F = ℚ`, the real components of both degree-one groups are `ℤ/2`; their nonzero
  classes pair to `1/2 ∈ ℚ/ℤ`. They cannot be deleted from the sum.
- For `k = ℚ`, `K = ℚ(i)` and `S ⊇ {2, ∞}`, `K ⊆ k_S` and `K_{S_K} = k_S`; restriction followed by
  corestriction is multiplication by two on `H¹(G_{k,S}, A)`. Localization of corestriction is
  the sum of local corestrictions, also at the split places with two places above them.

**Auxiliary cokernel comparison.** Let `k` be a number field, `p` a prime,
`S′ ⊇ S ⊇ T ⊇ S_p ∪ S_∞`, with `T` finite, and `A` a finite `G_{k,S}`-module killed by `p`.
Write `A^D = Hom(A, μ_p)` and define

```text
C_{S,T}(A) = coker(H¹(G_{k,S}, A) → ∏_{v∈T} H¹(k_v, A)),
X_{S,T}(A^D) = ker(H¹(G_{k,S}, A^D) → ∏′_{v∈S∖T} H¹(k_v, A^D)).
```

The kernel here requires zero full local classes on `S ∖ T`, not merely unramified ones.
Restricted-ramification duality identifies
`C_{S,T}(A)^* = X_{S,T}(A^D)/X_{S,∅}(A^D)` and hence embeds `C_{S,T}(A)` in `X_{S,T}(A^D)^*`.
These finite cokernels have the quotient maps induced by localization. Coefficient maps induce
covariant maps on `C`; enlargement `S ⊆ S′` gives a surjection `C_{S,T}(A) → C_{S′,T}(A)` by
inflation and the identity on the local product. Enlargement of `T` gives maps in the opposite
direction by projection of local products. For finite field towers inside `k_S`, restriction and
corestriction give the corresponding cokernel maps with sets lifted to the extension field;
corestriction uses sums over places. Their dual maps are adjoint under the local pairings.

Suppose further that `N/k` is finite Galois inside `k_S`, contains the splitting field `k(A)` and
`μ_p`, and `S′ ∖ T ⊆ cs(N/k)`. Then build the commuting comparison diagram

```text
C_{S,T}(A)   ↪ X_{S,T}(A^D)^*   --η-->  H¹(Gal(N/k), A^D)^*
    ↓                 ↓ φ                         ║
C_{S′,T}(A)  ↪ X_{S′,T}(A^D)^*  --η′->  H¹(Gal(N/k), A^D)^*.
```

The rows are not asserted exact. The maps `η` and `η′` are surjections dual to finite-group
inflation into `X`. The map `φ` is dual to descent of the classes in `X_{S′,T}` to `G_{k,S}`:
vanishing at the new places kills their inertia restrictions. If
`cs(N/k) ∖ (S′ ∖ T)` has Dirichlet density zero, `η′` is an isomorphism. The comparison is natural
for coefficient maps and compatible finite splitting-field towers, with restriction/corestriction
adjunction and local sums as above. This target also constructs the finite-group comparison

```text
H¹(Gal(N/k), A^D)^* ≅ H₁(Gal(N/k), A(−1)),
A(−1) = A ⊗_{𝔽_p} Hom(μ_p, 𝔽_p).
```

For the shrinking application put `Q_d = Gal(N_d/k) = F(d)/F(d)^ν ⋊ G`, `A_d = E(d,ν)` and
`S_d = cs(N_d/k) ∪ T_m`, for `d = m,n`, with `N_n ⊆ N_m` and `N_d` splitting `A_d` and containing
`μ_p`. Here `T_m` is finite and contains `Ram(N_m/k) ∪ S_p ∪ S_∞`. A shrinking map gives `Q_m ↠ Q_n` and `A_m → A_n`. First apply its coefficient map at `S_m`,
then enlarge allowed places to `S_n`. The comparison diagram and the finite-group duality must
commute with `H₁(Q_m, A_m(−1)) → H₁(Q_n, A_n(−1))`. If the image of a local defect under
`C_{S_m,T_m}(A_m) ↪ X_{S_m,T_m}(A_m^D)^* ≅ H₁(Q_m, A_m(−1))` is killed by this map, it has zero image in
`C_{S_n,T_m}(A_n)`: the lower horizontal comparison is an isomorphism and the cokernel injection
is faithful. The same comparison over `K` uses `Q_d = Gal(N_d/K) = F(d)/F(d)^ν` in place of the
semidirect product, with the place sets lifted to `K`. Since `K/k` is Galois, the lifted
`cs(N_d/k)` agrees with `cs(N_d/K)` up to a density-zero set of places of `K` of residue degree
larger than one over `k`; the isomorphism hypothesis still holds. These are the two comparisons
used by the nilpotent embedding theorem.

*Proof sketch.* Apply the restricted-ramification adapter and dualize localization, extending local
families by zero on `S ∖ T`, to obtain the quotient description and cokernel injection. Inflation
from `Gal(N/k)` lands in `X` because its allowed places outside `T` split in `N`. Vanishing at
`S′ ∖ S` permits descent and gives `φ`; dualizing yields the diagram. Under the density hypothesis,
Chebotarev over `N` makes restriction to `N` of every class in `X_{S′,T}` zero, so finite-group
inflation is an isomorphism. Dualizing the finite-dimensional group chain complex over `𝔽_p`
constructs the displayed cohomology/homology duality, natural for group and coefficient maps
together, and transports the operator shrinking map to the local defect.

Source: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Definition 9 and Lemmas 10–12,
PDF pp. 10–13, and proof of Theorem 15, steps 3–4, PDF pp. 28–32 (especially the diagrams on
pp. 29–30 and their version over `K` on p. 32).
*Needs:* *Restricted-ramification localization adapter*; ProfiniteCohomology Layers 1, 5, 6 and 10
(inflation–restriction and transfer); Mathlib `groupCohomology` and `groupHomology` with their
inhomogeneous cochain and chain complexes; Chebotarev Layer 10.

**Checks.**

- For `A = 0` every cokernel, kernel and finite-group term is zero. For `S′ = S` the vertical
  comparison maps are identities; no density hypothesis is needed for commutativity.
- For `S = S′ = cs(N/k) ∪ T`, with `T` containing the ramification of `N/k`, the places above `p`
  and infinity, and with `N` splitting `A` and containing `μ_p`, `η = η′` is an isomorphism.
  An arbitrary allowed-place set only gives the surjection; the isomorphism needs the density
  and splitting hypotheses.
- In a compatible pair `N_n ⊆ N_m`, the coefficient map followed by enlargement `S_m ⊆ S_n`
  sends the local defect to the same element as the homology map through the comparison diagram.
  Repeat over `K`, where the acting finite group omits `G`; killing a semidirect-product homology
  class alone does not assert that this second defect vanishes.

**Cyclic ramification correction.** Let `p` be a prime and `Ω ⊇ K ⊇ k` finite extensions of number
fields with `Ω/k` and `K/k` Galois and `μ_p ⊂ K`. Let `T` be a finite set of places of `k` that contains
`Ram(Ω/k)`, the places `S_p` above `p`, and the archimedean places `S_∞`. Put `S = cs(Ω/k) ∪ T`, where `cs(Ω/k)`
is the set of places that split completely in `Ω`. Let `A` be a finite `𝔽_p[Gal(K/k)]`-module, and let
`y ∈ H¹(k_S/K, A)` be unramified at every place `𝔓` of `K` above `T` and zero at the places above
`Ram(K/k) ∪ S_p ∪ S_∞`.

Then there is `x ∈ H¹(k_S/k, A)` with `x_v = (cor_K^k y)_v` for `v ∈ T`, and with `x_v` cyclic for
`v ∉ T`, meaning split by a cyclic extension of `k_v`. The proof gives more: `x = cor_K^k z` for some
`z ∈ H¹(k_S/K, A)` with `z_𝔓 = y_𝔓` above `T`, and such that at every newly ramified `𝔓`, `z_𝔓` is
cyclic and `z_{σ𝔓} = 0` for every `σ ≠ 1` in `Gal(K/k)`. For `p = 2` the construction combines three
classes.

*Proof sketch.* Identify `H¹(k_S/K, A)` with `H¹(G_{K,S_K}, A)` by *Restricted-ramification
localization adapter*. Its mixed row, with the finite prescription set enlarged by the previously
chosen primes and their conjugates, records full classes at old places and ramification classes at
other allowed places. Choose new primes with prescribed splitting and Frobenius (Chebotarev), and
solve the character corrections in that row by reciprocity. Every constructed class stays in the
restricted-ramification group. For `p = 2`, combine the three Kummer classes, keeping conjugate
primes and ramification separated as specified in the source. Local corestriction gives the stated
class over `k` without enlarging the allowed ramification set.

Source: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Theorem 13 and its full proof,
PDF pp. 14–20 (the exact hypotheses on the class, the corestriction conclusion, and the correction at
conjugate primes).
*Needs:* *Induced abelian proper solutions*, *Twisting abelian-kernel solutions*,
*Restricted-ramification localization adapter*; ClassFieldTheory Layers 10 and 12; Chebotarev Layer 10.

**Checks.**

- For `y = 0`, the class `x = 0` satisfies the conclusion.
- The hypotheses require `y` to vanish at the places above `Ram(K/k)`, `p` and infinity, and only to be
  unramified at the other places above `T`. For `p = 2` the condition `μ₂ ⊂ K` holds automatically, and
  the three-class correction is needed.
- For `k = K = ℚ`, `Ω = ℚ(i)`, `p = 2` and `T = {2, ∞}`, the character of `ℚ(√33)` is zero on `T`
  since `33 > 0` and `33 ≡ 1 mod 8`. Its discriminant is `33`, so it ramifies at `3` and `11`, both
  outside `S = cs(Ω/ℚ) ∪ T`. Thus it matches zero at the prescribed places but is not in
  `H¹(G_{ℚ,S}, C₂)`; zero itself is an allowed correction.

**Split nilpotent proper embedding theorem.** Let `k` be a number field. Every finite split embedding
problem for `Γ_k` with nilpotent kernel has a proper solution. Such a problem consists of a continuous
surjection `π : Γ_k ↠ G` onto a finite group and the projection `N ⋊ G ↠ G`, for a finite nilpotent
group `N` with a `G`-action.

More precisely (Schmidt–Wingberg, Theorem 15), let `K/k` be the `G`-extension cut out by `π`. For every
prime `p`, every `n` and every `ν`, the problem with kernel `F(n)/F(n)^ν` (*Free operator-group
shrinking*) has a proper solution `N_{n,ν}/k` with two properties:
- (i) every place in `Ram(K/k) ∪ S_p ∪ S_∞` splits completely in `N_{n,ν}/K`;
- (ii) every place ramified in `N_{n,ν}/K` splits completely in `K/k` and has a cyclic, totally
  ramified local extension over `k`.

Nonsplit nilpotent embedding problems are not covered.

*Proof sketch.*
- `N` is the product of its Sylow subgroups, and every finite `G`-operator `p`-group is a quotient of
  some `F(n)/F(n)^ν`. So it suffices to treat these quotients. Solutions for different primes combine in
  a compositum over `K`, whose group is all of `N ⋊ G` because the orders are coprime.
- For a fixed `p`, induct on `ν`. At each step first pass to `K(μ_{p^e})`, where `p^e` is the
  exponent of `F(n)/F(n)^{ν+1}`, inflate the quotient group and eventually descend by its quotient.
  This supplies the roots of unity required by the duality comparisons; the coefficient action
  factors through `Gal(K/k)`, so the fields `N_d` split it. The cyclotomic enlargement ramifies
  only above `p`, so the descent preserves (i) and (ii).
  Shrink the local `H²` obstructions at the old bad places by means of
  induced modules, then shrink the resulting global `Ш²` obstruction with the duality surjection and a
  Tate twist.
- Get properness from *Induced abelian proper solutions* and auxiliary local generators. Use
  *Auxiliary cokernel comparison* at `T_m`, first for `Gal(N_d/k)` and then for `Gal(N_d/K)`, to
  carry the defects through the coefficient shrinking and the enlargement
  `cs(N_m/k) ∪ T_m ⊆ cs(N_n/k) ∪ T_m`. Its commuting diagrams and finite-group homology
  identifications show that the killed homology classes give zero restricted-ramification defects.
  Twist once more (*Cyclic ramification correction*) to restore (i) and (ii), retaining the
  auxiliary generators and the specified local conditions through these maps.

Source: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Theorems 14–15 and their proof,
PDF pp. 20–32 (the complete constructive input for solvable realization).
*Needs:* *Free operator-group shrinking*, *Induced abelian proper solutions*, *Cyclic ramification
correction*, *Auxiliary cokernel comparison*, *Restricted-ramification localization adapter*,
*Finite abelian-kernel obstruction and pullback*, ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input*.

*Lean:* `exists_proper_solution_of_split_nilpotent`, on `TauCeti.FiniteEmbeddingProblem` with a
splitting section, nilpotent kernel and a surjective solution.

**Checks.**

- For `N = 1`, `π` itself is the proper solution.
- The split hypothesis cannot be dropped. Over `ℚ(√−1)/ℚ`, the problem `C₄ → C₂` has nilpotent kernel
  `C₂` but no solution at all (*Induced abelian proper solutions*).
- For `p = 2` the induction retains real localization groups, and the auxiliary splitting field
  contains the required roots of unity. Descent from that field gives the same prescribed splitting
  above infinity and `2`; these conditions are part of (i), not discarded by shrinking.

**Fitting supplements for solvable groups.** Mathlib has the Frattini subgroup `frattini G` but no
Fitting subgroup. For a finite group `G`, the Fitting subgroup `F(G)` is the supremum of the
nilpotent normal subgroups of `G`; that it is normal, characteristic and nilpotent (Fitting's
theorem: the product of two nilpotent normal subgroups is nilpotent), hence the largest nilpotent
normal subgroup, is consumed from the supplier below and not proved here. There is one Fitting
carrier: `F(G)` is the value at the
top subgroup of the relative Fitting subgroup of a subgroup `H ≤ G` (generated by the nilpotent
normal subgroups of `H`) of LocalFiniteGroupTheory L2, whose nilpotence, characteristicity,
maximality and Frattini inclusion are the first three API items below and the inclusion
`Φ(G) ≤ F(G)`; no
second, group-level Fitting definition is introduced.

Prove the following theorem of Huppert, as cited by Schmidt–Wingberg: for a nontrivial finite solvable
group `G`, `Φ(G) < F(G)`. The inclusion `Φ(G) ≤ F(G)` holds for every finite `G`, because `Φ(G)` is a
nilpotent normal subgroup. Also prove that a normal subgroup `N` of a finite group `G` with `N ⊄ Φ(G)`
has a proper supplement: a subgroup `U < G` with `N ⊔ U = G`, so that `NU = G`.

For nontrivial solvable `G`, applying this to `N = F(G)` gives a proper supplement `U` of `F(G)`, which
is solvable. Let `U` act on `F(G)` by conjugation. Then the multiplication map `F(G) ⋊ U → G`,
`(f, u) ↦ fu`, is a surjective homomorphism. In the induction of *Shafarevich solvable realization*,
`F(G)` is the kernel of the embedding problem.

The API (the first three items are LocalFiniteGroupTheory L2 at the top subgroup, restated for
use; the last two are the targets of this roadmap):
- `F(G)` is normal and characteristic.
- For finite `G`, `F(G)` is nilpotent.
- Every nilpotent normal subgroup `N` of a finite `G` satisfies `N ≤ F(G)`.
- For a finite nontrivial solvable `G`, `Φ(G) < F(G)`.
- For a finite nontrivial solvable `G` there is `U < G` with
  `F(G) ⊔ U = G`, and the semidirect multiplication homomorphism is surjective.

*Proof sketch.* `Φ(G) ≤ F(G)` follows from Mathlib's `frattini_nilpotent`. For the strict inclusion,
`G/Φ(G)` is nontrivial and solvable, so it has a nontrivial abelian normal subgroup. Its preimage
contains `Φ(G)` and is nilpotent by Frattini's argument, so it lies in `F(G)` and properly contains
`Φ(G)`. For the supplement, a maximal subgroup `U` not containing `N` exists because `N ⊄ Φ(G)`, and
`NU = G` by maximality. Finally, check that the multiplication map from the conjugation semidirect
product is a homomorphism.

Source: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), Propositions 16–17, arXiv v1 p. 32,
stated without proof and cited from Huppert, *Endliche Gruppen I*, Kap. III, Satz 3.2(b) and
Satz 4.2(c); the proof sketch above gives the arguments used here.
*Needs:* Mathlib `Subgroup`, `frattini`, `frattini_nilpotent`, `Group.IsNilpotent`, `Group.IsSolvable`,
`SemidirectProduct`; LocalFiniteGroupTheory L2 (the relative Fitting subgroup and its basic API).

**Checks.**

- For a finite abelian group, `F(G) = G`. This includes the trivial group, where `F(1) = 1 = Φ(1)`, so
  the strict inclusion `Φ(G) < F(G)` needs the nontriviality hypothesis.
- For `S₃`, `F(S₃) = A₃ ≅ C₃` and `Φ(S₃) = 1`. The subgroup `⟨(12)⟩ ≅ C₂` is a proper supplement, and
  `C₃ ⋊ C₂ → S₃` is an isomorphism.
- For `S₄`, `F(S₄) = V₄` (because `A₄` is not nilpotent) and `Φ(S₄) = 1`. A point stabilizer `S₃` is a
  proper supplement, and `V₄ ⋊ S₃ → S₄` is an isomorphism.
- For `S₅`, `F(S₅) = 1 = Φ(S₅)`. Without solvability the strict inclusion cannot be stated.
- For a nontrivial `p`-group, `F(G) = G` and `Φ(G) < G`. The proper subgroup `U = 1` is already a
  supplement.

**Shafarevich solvable realization.** Let `k` be a number field. Every finite solvable group `G` is
isomorphic to `Gal(M/k)` for some finite Galois extension `M/k`. The theorem gives solvable
realizations only; the inverse Galois problem for arbitrary finite groups over `ℚ` is open.

*Proof sketch.* Induct on `|G|`; the trivial group is realized by `k` itself. For `G ≠ 1`:
- *Fitting supplements for solvable groups* gives a proper supplement `U` of `F(G)`, and by induction
  `U ≅ Gal(K/k)` for some Galois extension `K/k`.
- *Split nilpotent proper embedding theorem* gives a proper solution of `F(G) ⋊ U ↠ U` above `K`: a
  Galois extension `M′/k` with group `F(G) ⋊ U`.
- The fixed field of the kernel of `F(G) ⋊ U ↠ G` is Galois over `k` with group `G` (Mathlib
  `IsGalois.normalAutEquivQuotient`).

Source: [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1), the Theorem of Shafarevich in the
Introduction, PDF pp. 1–2, and the concluding proof, p. 32.
*Needs:* *Fitting supplements for solvable groups*, *Split nilpotent proper embedding theorem*; Mathlib
`IsGalois.normalAutEquivQuotient`.

*Lean:* `shafarevich`.

**Checks.**

- `C₂`, `C₃` and `D₈` are covered. `A₅` is outside the solvable hypothesis.
- For `G = S₃`, the induction realizes `U = C₂` by a quadratic field and solves `C₃ ⋊ C₂ ↠ C₂`
  properly; the final quotient map `C₃ ⋊ C₂ → S₃` is an isomorphism.
- The final group comes from the normal fixed field of a proper solution. A weak solution would give
  only a Galois algebra, and the fixed algebra of a kernel need not be a field.

### IG.4.4 Homogeneous spaces and local prescriptions

**Approximation and nonabelian localization.** Let `k` be a number field, `F` a finite étale `k`-group
with an embedding `F ↪ SL_n`, and `X = SL_n/F`. For every finite set `S` of places of `k`,

```text
X(k) is dense in ∏_{v∈S} X(k_v)   ⟺   H¹(k, F) → ∏_{v∈S} H¹(k_v, F) is surjective,
```

as a map of pointed sets. For nonconstant `F` the cohomology uses the actual Galois action on `F` and
its cocycles. For constant `F`, `H¹(k, F)` is the set of continuous homomorphisms `Γ_k → F` modulo
conjugation. The right-hand side does not involve the embedding, so neither does the equivalence. A
class in `H¹(k, F)` need not come from a field realization; full image is a separate criterion with
auxiliary places, *Auxiliary cyclic prescriptions force full image*.

*Proof sketch.* The quotient map `SL_n → X` is an `F`-torsor. Since `H¹(k, SL_n) = 1`, and likewise over
each `k_v`, the connecting maps `X(k) → H¹(k, F)` and `X(k_v) → H¹(k_v, F)` are onto, and their fibres
are orbits of `SL_n(k)` and `SL_n(k_v)`. The local connecting maps are locally constant, so density
implies that localization is surjective. Conversely, choose a global class that matches the local
classes and a rational point `x` in its fibre, write each local point as `g_v x` with
`g_v ∈ SL_n(k_v)`, and approximate the `g_v` using weak approximation for `SL_n`.

Sources: [Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), §2.5,
Proposition 2.4 and its proof, published p. 1018 (the exact equivalence);
[Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
Introduction, Grunwald application, pp. 3–4.
*Needs:* *Proper solutions with local prescriptions*, Layer IG.0 *Finite Galois algebras and torsors*,
Layer IG.1 *Homogeneous spaces with finite stabilisers*; ReductiveGroups Layers 0 and 3 (the group
scheme `SL_n` and its quotients), SchemeAndStackFoundations Layer 1.

**Checks.**

- For `F = 1` both sides hold: `X = SL_n` has weak approximation, and the localization map is a map
  between one-point sets.
- For constant `F = C₂`, `H¹(k, C₂) = k×/k×²`, and the localization map is
  `k×/k×² → ∏_{v∈S} k_v×/k_v×²`. It is surjective because `k_v×²` is open in `k_v×` and `k` is dense in
  `∏_{v∈S} k_v`. So `SL_n/C₂` has weak approximation, and the criterion is about prescribed square
  classes.
- The trivial global class matches split local torsors at every place, yet its homomorphism `Γ_k → F`
  has trivial image. Matching local classes therefore does not guarantee a nontrivial field.

**Auxiliary cyclic prescriptions force full image.** Let `k` be a number field and `G` a finite group,
viewed as a constant `k`-group. Fix a finite set `B` of bad places containing the archimedean places, and
call the finite places outside `B` good. Assume that `H¹(k, G) → ∏_{v∈S} H¹(k_v, G)` is surjective for
every finite set `S` of good places.

Take prescriptions at a finite set of good places. For each conjugacy class `C_j` of `G`, add a further
good place `w_j`, all distinct, with the unramified local homomorphism `Γ_{k_{w_j}} → G` that sends the
arithmetic Frobenius to an element of `C_j`. Then there is a global homomorphism `Γ_k → G` that matches
all these prescriptions up to conjugacy, and every such homomorphism is surjective. So its fixed field
is a `G`-realization with the original local data, up to conjugacy.

*Proof sketch.* There are infinitely many good places, and every element of `G` is the Frobenius of an
unramified local homomorphism. So the auxiliary prescriptions exist, and surjectivity of localization
gives the global homomorphism. Its image meets every conjugacy class, and a proper subgroup `H < G`
misses one. Indeed, `G` acts transitively on `G/H`, so by Burnside's lemma the average number of fixed
points is one, while the identity fixes all `[G : H] > 1` points. Some element therefore fixes no coset,
and its conjugacy class does not meet `H`.

Sources: [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
Introduction, Grunwald application, pp. 3–6, and Remark 7.11, pp. 28–29;
[Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), Proposition 2.4
and its proof, published p. 1018. The latter identifies weak approximation on the quotient with
surjectivity of localization; the full-image step is the counting argument above, since Proposition 2.4
alone does not give properness.
*Needs:* *Proper solutions with local prescriptions*; LocalFieldsRamification Layer 2.

**Checks.**

- For `G = C₃`, an auxiliary place whose Frobenius is a generator rules out the trivial character.
- For `G = S₃`, the subgroup `C₃` misses the transpositions and each subgroup `C₂` misses the 3-cycles.
  So auxiliary Frobenius values in both nontrivial classes force full image; every subgroup meets the
  identity class.
- Without the auxiliary conditions, a global class that matches the prescriptions may have trivial
  image, classifying the split Galois algebra.

**The Brauer–Manin set.** Let `k` be a number field and `X` a smooth geometrically integral
`k`-variety, with Brauer group `Br X = H²_ét(X, 𝔾_m)` (SchemeAndStackFoundations Layer 2). For
`α ∈ Br X` and `x_v ∈ X(k_v)`, write `α(x_v) ∈ Br k_v` for the pullback and `inv_v` for the local
invariant. For an adelic point `(x_v) ∈ X(𝔸_k)`, `α(x_v) = 0` for almost all `v`, which defines
`(α, (x_v)) = Σ_v inv_v(α(x_v)) ∈ ℚ/ℤ`, the sum running over all places, archimedean ones included.
Each map `x_v ↦ α(x_v)` is locally constant on `X(k_v)`; rational points pair to zero with every
`α`; and classes coming from `Br k` pair to zero with every adelic point, so only `Br X / Br k`
matters. The Brauer–Manin set `X(𝔸_k)^{Br}` of adelic points orthogonal to all of `Br X` is closed and
contains `X(k)`. For weak approximation one uses, in the same way, the product `∏_v X(k_v)` and the
unramified Brauer group, the Brauer group of a smooth compactification; for proper `X` the two
versions agree. Define the Brauer–Manin set, and prove that almost all local
evaluations vanish, that the evaluations are locally constant, that `X(k)` is
contained in it, and that constant classes impose no condition. Since `X` is regular and integral,
`H²_ét(X, 𝔾_m)` injects into `Br k(X)` and is therefore torsion, so on smooth geometrically integral
varieties this pairing and set coincide with those defined from the torsion of cohomological `H²` on
separated finite-type schemes; this is the shared carrier on that domain, and any such wider
construction is compared with it there. *Proof sketch.* Spread `X` and `α` out over a
ring of `S`-integers; for `v ∉ S` an integral point evaluates `α` in `Br O_v = 0`. Rational points:
the evaluation lies in `Br k`, and the reciprocity sequence `0 → Br k → ⊕_v Br k_v → ℚ/ℤ → 0` kills
the sum. Local constancy is the continuity of evaluation for the analytic topology. Sources:
Poonen, *Rational points on varieties*, §8.2,
Propositions 8.2.1, 8.2.2 and 8.2.9, Definition 8.2.5 and Corollary 8.2.6, printed pp. 229–231;
[Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), §2.5, published
p. 1017 (the unramified version for weak approximation);
[Česnavičius, *Purity for the Brauer group*](https://arxiv.org/abs/1711.06456), Lemma 3.2, arXiv v4
p. 6, after Grothendieck, *Le groupe de Brauer II*, 1.8 (torsion for regular integral schemes).
*Needs:* SchemeAndStackFoundations Layer 2
(Brauer groups of schemes, étale cohomology); ClassFieldTheory Layers 5 and 10–12 (local invariants and
the Brauer sequence); GlobalNumberFields Layers 0 and 1.

**Checks.**

- For `X = Spec k`, `X(𝔸_k)` is one point and every `α ∈ Br k` pairs to `Σ_v inv_v(α) = 0`, so the
  Brauer–Manin set is all of `X(𝔸_k)`.
- For `X = 𝔸¹_k`, `Br X = Br k` in characteristic zero, so only constant classes occur and the
  Brauer–Manin set is all of `X(𝔸_k)`.
- For `X = 𝔾_{m,ℚ}` and `α` the quaternion class `(−1, t)`, the adelic point equal to `−1` at the real
  place and to `1` at every finite place pairs to `inv_∞(−1, −1) = 1/2`, so it is outside the
  Brauer–Manin set; a sum over finite places only would keep it.

**Torus types and Brauer–Manin descent for cyclic stabiliser quotients.** Let `k` be a number
field, `G` semisimple simply connected, `V` a homogeneous `G`-space with finite geometric stabiliser
`H`, and `X` a smooth proper compactification of `V`. Fix a proper normal subgroup `H' ⊂ H`,
stable under the Galois outer action, with cyclic quotient `C = H/H'`. Define the finite group of
multiplicative type `R` by `R(k̄) = C`, so its character module is
`R̂ = Hom(C, k̄^×)` with the induced Galois action. The character identification
`Pic(V_k̄) = Hom(H^ab, k̄^×)` gives an injection `λ : R̂ → Pic(V_k̄)`. With
`Q̂ = Div_{X_k̄ ∖ V_k̄}(X_k̄)`, form
`T̂ = Pic(X_k̄) ×_{Pic(V_k̄)} R̂` and its projection `ν : T̂ → Pic(X_k̄)`.
Then `0 → Q̂ → T̂ → R̂ → 0` is exact, `Q` is a quasi-trivial torus, `T̂` is torsion free,
and the dual sequence is `1 → R → T → Q → 1` with `T` a torus.

If `X(𝔸_k)^{Br}` is nonempty, a `T`-torsor `f : Y → X` of type `ν` exists. For every such torsor,
letting `f^σ : Y^σ → X` range over all twists `σ ∈ H¹(k,T)`, one has
`X(𝔸_k)^{Br} ⊂ ⋃_σ f^σ(Y^σ(𝔸_k)^{Br_nr Y^σ})`.
Smooth proper compactifications of these twists, with maps to `X` obtained by resolving
indeterminacy, therefore reduce density on `X` to density on every such compactification.
The descent statement also covers norm-kernel tori
`T₀ = ker(Res_{E⊗_kℓ/k} 𝔾_m → Res_{E/k} 𝔾_m)` for finite étale `E/k` and finite Galois `ℓ/k`.
For a dense open `O` of a smooth proper rationally connected variety `Z` and any `T₀`-torsor
`W₀ → O`, `Z(𝔸_k)^{Br}` lies in the closure of the images of
`W₀^σ(𝔸_k)^{Br_nr W₀^σ}` as `σ` ranges over all of `H¹(k,T₀)`.

This target includes Harari's formal lemma in the form needed here: for a smooth proper
rationally connected variety `Z`, a dense open `O`, and a subgroup `B ⊂ Br O` containing
`Br Z` with `B/Br k` finite, `Z(𝔸_k)^{Br}` lies in the closure of `O(𝔸_k)^B`. Specify local
evaluation constancy, smooth local lifting near prescribed points, finitely many additional
places to cancel the evaluations of `B`, and integral control outside those places.

*Proof sketch.* Build the character/Picard identification from the fundamental-group sequence of
IG.1. The geometric group `G_k̄` is rational, so its finite quotients are unirational; their smooth
compactifications are rationally connected and have torsion-free finitely generated geometric
Picard group. Establish these properties here. Since `λ` is injective, so is `ν`, making `T̂`
torsion free. The boundary-divisor sequence is exact because `k̄[V]^× = k̄^×`; its permuted basis
makes `Q` quasi-trivial. The type obstruction lies in `H²(k,T)`; local liftability and the
algebraic Brauer pairing kill it for a Brauer–Manin point. Develop this type-obstruction criterion
here. The perfect torus Sha pairing and adelic annihilator theorem are supplied by
ArithmeticGaloisDuality §R02.4.6, *Torus Sha duality and adelic annihilators*. Verify that the type
and norm-kernel groups are number-field tori and identify their character lattices, then transport
the supplied pairing into the descent functional. With the source's convention the functional
changes by `ε_σ(α′) = ε_0(α′) − ⟨α′, [σ]⟩`; retain this negative sign and all real-place terms.
Use the Leray and Hochschild–Serre sequences for a torus torsor to compare unramified Brauer
classes across twists. Their residual evaluation functional is killed first by a
Tate–Shafarevich twist and then by adelic translation in `T`; this proves the displayed inclusion
for the full Brauer group, including transcendental classes. For the dense-open closure version,
prove finiteness modulo constants of the inverse image of the torsor's unramified Brauer group
and use the formal lemma and local control above, proving its finite-evaluation cancellation
by global reciprocity and local duality.

Source: [Harpaz–Wittenberg](https://arxiv.org/pdf/1802.09605v2), Theorem 2.1, Corollary 2.2,
§§2.2–2.3 (especially Propositions 2.3, 2.6 and 2.7), diagram (3.1), and the type-existence step
in the proof of Theorem 6.6, PDF pp. 7–13 and 23; the latter cites Skorobogatov,
*Torsors and rational points*, Theorem 6.1.1. For the torus arithmetic, §2.3 uses
Neukirch–Schmidt–Wingberg, Theorem 8.6.7, and Harari (2008), Theorem 2; for the formal lemma,
Corollary 2.2 uses Colliot-Thélène–Skorobogatov (2000), Proposition 1.1.
*Needs:* *The Brauer–Manin set*; IG.1 *Homogeneous spaces with finite stabilisers*;
SchemeAndStackFoundations Layers 1–3 (torsors, Picard groups, Brauer groups and spectral sequences);
ReductiveGroups Layers 0 and 3, ReductiveGroupsPartII RG2.0a (multiplicative-type groups and
quasi-trivial tori); ArithmeticGaloisDuality §R02.4.6 *Torus Sha duality and adelic annihilators*;
ClassFieldTheory Layers 5 and 10–12; ProfiniteCohomology;
ResolutionOfSingularitiesCharacteristicZero §§5.5, 6.2 (smooth compactification and resolution,
through AlgebraicModuliForArithmeticGeometry §§9.4–9.5).

**Checks.**

- For the split quotient `H = C₂`, `H' = 1`, the character module `R̂` is `ℤ/2`, not a lattice;
  `T̂` is nevertheless torsion free. Replacing `R` by a torus would lose the finite quotient.
- For `V = PGL₂`, `X = ℙ³` and `H' = 1 ⊂ H = C₂`, the determinant quadric is the boundary.
  Here `Pic(X_k̄) = ℤ`, `Pic(V_k̄) = ℤ/2`, and the dual torus sequence is
  `1 → μ₂ → 𝔾_m → 𝔾_m → 1`, with last map squaring.
- Density on one chosen twist is insufficient: a local torsor class need not be zero, and the
  inclusion ranges over all of `H¹(k,T)`. On the split torus `𝔾_m`, Hilbert 90 makes this set a
  singleton, illustrating the special case in which one twist suffices.

**Quotient fibration and the smaller stabiliser.** In the preceding cyclic-quotient construction,
let `Y → X` be any `T`-torsor of type `ν` and `W = Y ×_X V`. Then `W/R ≅ V × Q` as `Q`-torsors
over `V`. A choice of this trivialization gives a smooth map `π : W → Q`; for every `q ∈ Q(k)`,
`W_q → V` is an `R`-torsor of type `λ`. Its `G`-action lifts uniquely from `V`, and its geometric
stabiliser is `H'`, with the induced Galois outer action compatible with that on `H`. In particular,
a stable cyclic normal series ending in `H' ⊂ H` shortens to the stable series inside `H'`.
Smooth compactifications of the geometric generic fibre are rationally connected, and
`π_k̄` has a rational section.

*Proof sketch.* The pushout type in `H¹(V_k̄,Q)` is zero; injectivity over `k` follows from
`H¹(k,Q) = 0`, so the quotient is trivial. Restrict its `R`-torsor to `V × {q}` to obtain the
fibres. Geometrically the fibre cover is `G_k̄/H' → G_k̄/H`. Build the unique lifted `G`-action
by lifting the orbit maps through the cover using the trivial geometric fundamental group of `G`;
uniqueness gives the action law and descent. Identify its stabiliser and the compatible outer
actions through the two fundamental-group extensions of IG.1.
For the geometric section, lift a generator of the cyclic `R̂` to `T̂`. The resulting diagram
reduces `π_k̄` by base change to a fibration over `𝔾_m`. This target includes the rational-section
input used in this reduction: over an algebraically closed characteristic-zero field, a smooth
projective family over a smooth curve with rationally connected geometric generic fibre has a
rational section with generic image in any prescribed dense open of the total space. Develop the
curve case by the Graber–Harris–Starr multisection construction, attaching very free rational
curves to remove deformation obstructions and deforming to a section; the very-free-curve
argument also gives density of generic-fibre rational points, as in Kollár, Chapter IV,
Theorem 6.10. Compactification gives the open-curve form with image in `W`. Pull the section back
along the diagram.
For a proper compactification of `π_k̄`, extend the rational section over the discrete valuation
ring of each codimension-one base point. Smoothness of the total space implies that its image
lies on a multiplicity-one geometrically integral fibre component, giving split geometric fibres.

Sources: [Harpaz–Wittenberg](https://arxiv.org/pdf/1802.09605v2), Propositions 3.1, 3.3(ii), 5.1 and
5.2, diagram (3.9) and the proof of Theorem 6.6, PDF pp. 12–15, 18–20 and 23–24;
[Graber–Harris–Starr, *Families of rationally connected varieties*](https://arxiv.org/pdf/math/0109220v1),
Theorem 1.1 and §§2–3, PDF pp. 2 and 5–14.
*Needs:* *Torus types and Brauer–Manin descent for cyclic stabiliser quotients*;
IG.1 *Homogeneous spaces with finite stabilisers*; ReductiveGroups Layers 0 and 3;
SchemeAndStackFoundations Layers 1, 3 and 4 (torsors, curves and deformations);
ResolutionOfSingularitiesCharacteristicZero §6.2 / `sncCompactification`
(through AlgebraicModuliForArithmeticGeometry §9.5).

**Checks.**

- For `H = S₃`, `H' = A₃`, the fibres have stabiliser `C₃`, not `C₂`; the shortened series is
  `1 ⊂ C₃` and its outer action is inherited from that on `S₃`.
- With `H = C₂²` and an outer action cyclically permuting its three order-two subgroups, no one
  of those subgroups is stable. An arbitrary group-theoretic cyclic series cannot be shortened
  equivariantly in this way.
- For the split product fibration `V' × Q → Q`, a geometric point of `V'` gives a geometric
  section, even when `V'(k)` is empty. A geometric rational section need not be a `k`-section.

**Brauer–Manin fibration density over a quasi-trivial torus.** Let `k` be a number field, `E` a
finite étale `k`-algebra of dimension `n`, `Q = Res_{E/k} 𝔾_m`, and
`Q_aff = Res_{E/k} 𝔸¹ ≅ 𝔸^n ⊂ ℙ^n`, after choosing a basis of `E`. Let `Z` be smooth proper
geometrically integral and `f : Z → ℙ^n` dominant, with rationally connected geometric generic
fibre. Suppose every fibre over a codimension-one point of `Q` is split over its residue field,
and every geometric codimension-one fibre over `Q_aff,k̄` is split. Here split means possessing
an irreducible component of multiplicity one which is geometrically integral over the residue
field. If `Z_q(k)` is dense in `Z_q(𝔸_k)^{Br}` for every rational `q` in a Hilbert subset of `Q`
on which the fibres are smooth geometrically integral, then `Z(k)` is dense in `Z(𝔸_k)^{Br}`.

This target also develops the fibration theorem with all codimension-one fibres over `Q_aff`
split over `k`, using specialization of a finite set of generic-fibre Brauer classes on a Hilbert subset and
Hilbert irreducibility with local conditions to approximate in a fibre.

*Proof sketch.* Establish that `Z_k̄` is rationally connected from its rational base and
rationally connected geometric generic fibre, using the curve-section argument of the preceding
target (Graber–Harris–Starr, Corollary 1.3). Choose a finite Galois extension `ℓ/k` splitting
the finitely many boundary fibres of `Q_aff ∖ Q`. For `Q' = Res_{E⊗_kℓ/k} 𝔾_m` use the translated norm maps
`b_r : Q' → Q`, `x ↦ r N(x)` for `r ∈ Q(k)`. On `Q` these are torsors under the norm-kernel
torus. The pullback compactifications have split codimension-one fibres over all of `Q'_aff`:
inside `Q'` use the split-fibre hypothesis over `Q`; on its boundary the residue fields contain
`ℓ`. Apply the dense-open Brauer–Manin descent of the torus-type target to lift and approximate
an adelic point on a twist; Hilbert 90 represents every twist by some `b_r`. Norm pullback
preserves the Hilbert subset by IG.2. Apply the fibration theorem with split fibres over `k`
to this pullback and push its rational approximants down to `Z`.
For the fibration of *Quotient fibration and the smaller stabiliser*, resolve to a smooth proper
`Z → ℙ^n`. Its fibres over `Q` contain the smooth geometrically integral dense opens `W_q`,
so are split over `k`; its geometric rational section gives split geometric codimension-one
fibres on `Q_aff`. After shrinking `Q` its smooth proper fibres compactify the `W_q`, so the
inductive hypothesis supplies exactly the fibre-density assumption.

Source: [Harpaz–Wittenberg](https://arxiv.org/pdf/1802.09605v2), Corollary 2.2, Theorems 4.1(ii)
and 4.2(ii), Lemmas 4.3–4.4 and the proof of Theorem 6.6, PDF pp. 8, 15–17 and 23–24;
§4.1 cites Harari (1997), Theorem 3.2.1 and the remark at the end of §3.2;
Corollary 2.2 and the proof of Theorem 4.2 cite Colliot-Thélène–Skorobogatov (2000), Proposition 1.1,
for the formal lemma. *Needs:* *The Brauer–Manin set*, *Torus types and Brauer–Manin descent for
cyclic stabiliser quotients* (its norm-kernel dense-open descent assertion),
*Quotient fibration and the smaller stabiliser* (its geometric curve-section input);
IG.2 *Hilbert specialization with
local conditions*, *Hilbert pullback through geometrically integral norm maps*;
ReductiveGroupsPartII RG2.0a;
SchemeAndStackFoundations Layers 1–3; ResolutionOfSingularitiesCharacteristicZero §6.2 /
`sncCompactification` (through AlgebraicModuliForArithmeticGeometry §9.5);
GlobalNumberFields Layers 0 and 1.

**Checks.**

- For `Z = ℙ¹ × ℙ^n` with the projection, all fibres are split and satisfy weak approximation;
  the conclusion recovers density in the whole adelic product.
- The conic family `x² − a y² = t z²` over `𝔾_m`, with `a ∈ k^×` nonsquare, has split smooth
  fibres on the torus. Its boundary fibre at `t = 0` consists of two conjugate lines, each of
  multiplicity one: geometrically split, but not split over `k`. Thus the theorem requires
  geometric splitting on the affine boundary and arithmetic splitting on `Q` separately.
- A section over `k̄` supplies the geometric boundary condition, while it supplies no arithmetic
  density on the fibres. Fibre Brauer–Manin density remains a separate hypothesis.

**Brauer–Manin density for supersolvable stabilisers.** Let `k` be a number field and `X` a smooth
proper geometrically integral `k`-variety birational to a homogeneous space `V` of a semisimple simply
connected linear `k`-group whose geometric stabiliser `H` is finite and supersolvable as a group with
an outer action of `Γ_k`: there is a chain `1 = H_0 ⊂ H_1 ⊂ ⋯ ⊂ H_m = H` of normal subgroups of `H`,
each stable under the outer action, with cyclic quotients `H_i/H_{i−1}`. Then `X(k)` is dense in
`X(𝔸_k)^{Br}`. With the trivial outer action, nilpotent and dihedral groups are supersolvable. The
theorem gives density in the Brauer–Manin set, not weak approximation. *Proof sketch.* The statement
is birationally invariant among smooth proper varieties (part of this target; Harpaz–Wittenberg cite
Colliot-Thélène–Pál–Skorobogatov, Proposition 6.1(iii)), so take `X` to be a smooth compactification
of `V`, with `V` a dense open subset. If `X(𝔸_k)^{Br}` is empty there is nothing to prove; otherwise
induct on `|H|`.

- *Trivial stabiliser.* For `H = 1`, `V` is a torsor under the group `G`, not necessarily `G` itself.
  For every place `v`, `V(k_v)` is dense in `X(k_v)` for the analytic topology, by the implicit
  function theorem on the smooth `X` over the complete field `k_v` (Mathlib
  `HasStrictFDerivAt.implicitFunctionOfProdDomain`; this local density is part of this target). As
  `X(k_v) ≠ ∅`, `V` has points at every real place, so it is trivial by the Hasse principle for
  torsors under semisimple simply connected groups (Kneser, Harder, Chernousov). Hence `V(k) ≠ ∅`,
  `V ≅ G`, and weak approximation for `G`, with the same local density, makes `X(k)` dense in
  `X(𝔸_k) = ∏_v X(k_v)`, which contains the Brauer–Manin set.
- *Inductive step.* Apply *Torus types and Brauer–Manin descent for cyclic stabiliser quotients*
  with `H' = H_{m−1}`. It reduces approximation on `X` to approximation on compactifications of
  all torsors of that type, including every twist. *Quotient fibration and the smaller stabiliser*
  gives their fibrations over `Q`, their geometric sections and the stable shortened series on
  `H_{m−1}`. Induction supplies density in the fibre Brauer–Manin sets. The codimension-one
  verification in *Brauer–Manin fibration density over a quasi-trivial torus* then gives density
  on each torsor compactification, and descent gives density on `X`.

Source: [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
Théorème B, PDF p. 3, which is Théorème 6.6, with Définition 6.4, Exemple 6.5 and the proof of
Théorème 6.6 through §6.1, PDF pp. 21–25. The trivial-stabiliser case is in the proof of Théorème 6.1,
PDF p. 21, citing Kneser, Harder and Chernousov through Platonov–Rapinchuk, Theorems 6.6 and 7.8. The
passage between `V` and `X` by the implicit function theorem is the remark after Lemme 6.3, PDF p. 22.
*Needs:* *The Brauer–Manin set*, *Torus types and Brauer–Manin descent for cyclic stabiliser
quotients*, *Quotient fibration and the smaller stabiliser*, *Brauer–Manin fibration density over
a quasi-trivial torus*; AdelicAlgebraicGroups Layer 4, §4.1 (*Hasse kernel and injectivity*, and *Weak approximation*,
`Approximation.hasWeakApproximation_of_simplyConnected`); ReductiveGroups Layers 0 and 3,
ReductiveGroupsPartII Layer RG2.0a (quasi-trivial tori), ResolutionOfSingularitiesCharacteristicZero
§6.2 / `sncCompactification` (smooth compactifications, through AlgebraicModuliForArithmeticGeometry
§9.5), SchemeAndStackFoundations Layers 1 and 2; Mathlib
`HasStrictFDerivAt.implicitFunctionOfProdDomain`.

**Checks.**

- For `H = 1` the space `V` is a torsor, which may have no rational point. For the Hamilton
  quaternions `D = (−1, −1)_ℚ`, `G = SL₁(D)` and `V = {x ∈ D : Nrd(x) = −1}`, given by
  `x₀² + x₁² + x₂² + x₃² = −1`, the smooth compactification `x₀² + x₁² + x₂² + x₃² + w² = 0` in `ℙ⁴` has
  no real point. So `X(𝔸_ℚ)` is empty and the theorem holds vacuously, while `X` is not birational to
  `G`, which has the real point `1`. When `X(𝔸_k)` is nonempty the Hasse principle gives `V ≅ G`, and
  the statement is weak approximation for `G`.
- `A₄` is solvable but not supersolvable (it has no normal subgroup of order two or three), so
  `SL_n/A₄` is outside the theorem.
- For `H = C₈` over `ℚ` the theorem applies, while `SL_n/C₈` fails approximation at `{2}` (*Wang's
  cyclic-eight local obstruction* and *Approximation and nonabelian localization*): density in the
  Brauer–Manin set does not give weak approximation.

**Unramified Brauer classes of finite quotients of `SL_n`.** Let `k` be a number field, `G` a
semisimple simply connected `k`-group, `F ⊂ G` a finite `k`-subgroup and `V = G/F`, with its unramified
Brauer group `Br_nr V`. Call a place `v` good if it is archimedean, or finite, prime to `|F|` and
unramified in the field `L` cut out by the Galois action on the points of `F`.

1. At every good place `v`, the evaluation `Br_nr V × V(k_v) → Br k_v` is constant in the point.
   Consequently, for every finite set `S` of good places, the unramified Brauer–Manin set of `V`
   maps onto `∏_{v∈S} V(k_v)`.
2. For `F = Q_{2^m}` (`m ≥ 3`), the generalized quaternion group as a constant subgroup of `SL_n`,
   `Br_nr V = Br k`.

*Proof sketch.* (1) Normalise the classes to vanish at the base point; a point of `V(k_v)` corresponds
to a section of `F ⋊ Γ_{k_v} → Γ_{k_v}`. At a good place the section agrees with that of the base
point on wild inertia, and modulo that it factors through a subgroup generated by a cyclic subgroup of
`F` and one further element: the image of complex conjugation at a real place, the images of a
Frobenius lift and of a tame inertia generator at a good finite place. Normalised unramified classes
vanish on such subgroups. For the surjection, put the rational base point at the places outside `S`
and use reciprocity. (2) Apply Demarche's group-cohomological description of the unramified Brauer
group of `SL_n/F` for a finite constant `F` to the generalized quaternion groups; this computation is
part of the target. Sources: [Lucchini Arteche, *The unramified Brauer group of homogeneous
spaces with finite stabilizer*](https://arxiv.org/pdf/1709.01170v3), definition of good places,
Theorems 6.1 and 6.2 with their proofs and Corollary 6.3, PDF pp. 14–16;
[Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), Proposition 2.4
and the tame approximation problem, published pp. 1017–1018; [Harpaz–Wittenberg, *Zéro-cycles sur les
espaces homogènes*](https://arxiv.org/pdf/1802.09605v2), PDF p. 4, which takes (2) from Demarche (2010),
Corollaire 3 and Remarque 7. *Needs:* *The Brauer–Manin set*, *Approximation and nonabelian
localization*; LocalFieldsRamification Layers 2–4 (unramified and tame local Galois groups);
ProfiniteCohomology Layer 1; SchemeAndStackFoundations Layer 2.

**Checks.**

- For `F = 1`, `V` is the group itself, `Br_nr V = Br k`, and both parts hold trivially.
- The residue-characteristic condition in (1) is needed: for `F = C₈` over `ℚ`, constancy at `2`
  together with *Brauer–Manin density for supersolvable stabilisers* would give approximation at
  `{2}`, hence a cyclic octic field whose completion at `2` is unramified of degree eight, which
  *Wang's cyclic-eight local obstruction* excludes.
- Part (2) does not extend to `C₈`: if `Br_nr(SL_n/C₈) = Br ℚ`, the density theorem would give weak
  approximation, again contradicting Wang's obstruction at `2`.

**Supersolvable Grunwald prescriptions.** Let `G` be a finite supersolvable group and `k` a number
field. Let `S` be a finite set of places of `k` that contains no finite place whose residue
characteristic divides `|G|`. For each `v ∈ S`, let `L_v/k_v` be a Galois extension whose group embeds
in `G`. Then there is a Galois extension `L/k` with group `G` (a proper realization) such that, for
every `v ∈ S`, `L ⊗_k k_v` is a product of copies of `L_v`. When marked local homomorphisms
`Γ_{k_v} → G` are prescribed instead of fields, the embeddings are specified and matched up to
conjugacy. The condition on residue characteristics cannot be removed: *Wang's cyclic-eight local
obstruction* rules out a version that allows all places.

*Proof sketch.* This is an application of three targets above. Embed `G` in `SL_n` and put
`V = SL_n/G`; for `G` constant, the good places of *Unramified Brauer classes of finite quotients of
`SL_n`* are the archimedean places and the finite places prime to `|G|`, so `S` consists of good
places. By part (1) of that target the unramified Brauer–Manin set of `V` maps onto `∏_{v∈S} V(k_v)`,
and by *Brauer–Manin density for supersolvable stabilisers*, applied to a smooth compactification,
`V(k)` is dense in it; so `V` has approximation in `S`, and in `S` enlarged by finitely many further
good places. By *Approximation and nonabelian localization* this is surjectivity of
`H¹(k, G) → ∏_v H¹(k_v, G)` on these places. Add auxiliary cyclic prescriptions at good places
(*Auxiliary cyclic prescriptions force full image*) to force image `G`, and recover the field and its
completions.

Sources: [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
Théorème B and its corollary, PDF pp. 3–4, where the corollary is derived from Théorème B,
Lucchini Arteche's §6 and Demarche–Lucchini Arteche–Neftin, Proposition 2.4;
[Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), Proposition 2.4,
published p. 1018 (surjectivity of local `H¹` is the same as approximation on the quotient).
*Needs:* *The Brauer–Manin set*, *Brauer–Manin density for supersolvable stabilisers*, *Unramified
Brauer classes of finite quotients of `SL_n`* (part (1)), *Approximation and nonabelian
localization*, *Auxiliary cyclic prescriptions force full image*, *Proper solutions with local
prescriptions*, Layer IG.0 *Finite Galois algebras and torsors*.

**Checks.**

- For `G = C₃`, prescribed cyclic extensions at places of residue characteristic other than `3` are
  realized by a surjective global character.
- For `G = C₈`, `k = ℚ`, `S = {2}` and `L_2` the unramified extension of degree 8, no realization exists
  (*Wang's cyclic-eight local obstruction*). Here `2` divides `|G|`, so the hypothesis excludes this `S`.
- For `G = S₃`, supersolvable through `1 ⊂ A₃ ⊂ S₃`, `k = ℚ` and `S = {5}`, every Galois `L_5/ℚ₅`
  whose group embeds in `S₃` is induced by an `S₃`-field; without the auxiliary places the global
  class could have image `A₃` or `C₂` only.

**Quaternion prescriptions at every place.** Let `Q_{2^m}` (`m ≥ 3`) be the generalized quaternion group
of order `2^m`, `k` a number field, and `S` any finite set of places of `k`. For each `v ∈ S`, let
`L_v/k_v` be a Galois extension whose group embeds in `Q_{2^m}`. Then there is a Galois extension `L/k`
with group `Q_{2^m}` that induces `L_v` at every `v ∈ S`; dyadic places are allowed. Beyond
supersolvability, the proof uses the vanishing of the unramified Brauer group of `SL_n/Q_{2^m}` modulo
the constant classes. The statement does not hold for every nilpotent or supersolvable group.

*Proof sketch.* `Q_{2^m}` is a `2`-group, hence nilpotent and supersolvable. By part (2) of
*Unramified Brauer classes of finite quotients of `SL_n`*, `Br_nr(SL_n/Q_{2^m}) = Br k`, so the
unramified Brauer–Manin set of `V = SL_n/Q_{2^m}` is all of `∏_v V(k_v)`, and *Brauer–Manin density
for supersolvable stabilisers* gives weak approximation on `V` at every finite set of places, dyadic
ones included. Conclude as in *Supersolvable Grunwald prescriptions*, through *Approximation and
nonabelian localization* and auxiliary cyclic prescriptions.

Source: [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
discussion after the corollary, PDF p. 4, which invokes Demarche (2010), Corollary 3 and Remark 7, for
the version at every place.
*Needs:* *Brauer–Manin density for supersolvable stabilisers*, *Unramified Brauer classes of finite
quotients of `SL_n`* (part (2)), *Approximation and nonabelian localization*, *Auxiliary cyclic
prescriptions force full image*, *Supersolvable Grunwald prescriptions*.

**Checks.**

- For `Q₈`, the prescribed local groups must embed in `Q₈`, and dyadic places are allowed under this
  separate theorem. The subgroups of `Q₈` are `1`, `C₂`, the three `C₄` and `Q₈`, so the biquadratic
  extension `ℚ₂(√−1, √2)/ℚ₂`, with group `C₂ × C₂`, is outside the hypothesis.
- The statement does not extend to `C₈`, which fails at the dyadic place (*Wang's cyclic-eight local
  obstruction*).
- Over `ℚ` with `S = {2}`, the unramified quartic extension of `ℚ₂`, with group `C₄ ⊂ Q₈`, is induced
  by a `Q₈`-field: a dyadic prescription excluded by the residue-characteristic hypothesis of
  *Supersolvable Grunwald prescriptions* and allowed here by the quaternion Brauer computation.

**Collectively coprime realization degrees.** Let `G` be a finite group and `k` a number field. Then
there are finite extensions `k_1, …, k_r` of `k` with `gcd([k_i : k]) = 1` such that, for every `i`,
`G` is the Galois group of a finite Galois extension of `k_i`.

*Proof sketch.* Embed the constant group `G` into `SL_n` and use the Hilbert subset of
`V = SL_n/G` defined by connected fibres of `SL_n → V`. This target includes the Hilbert-subset
moving theorem: on a smooth geometrically integral variety over a number field, every zero-cycle
can be moved, preserving its degree, to a rationally equivalent cycle supported in a specified
Hilbert subset. Prove it by reduction to curves through the cycle's support and induction on
dimension, using Hilbert irreducibility to
choose divisors in the required linear systems on smooth projective models of those curves, with
zeros and poles in the open variety. This gives equality of degrees on the projective curves;
no degree map on the Chow group of a nonproper variety is assumed. The rational point
`1G ∈ V(k)` gives a zero-cycle of degree one. Move it to `Σ_i n_i P_i` in the Hilbert subset, allowing signed integer coefficients.
Then `Σ_i n_i [k(P_i) : k] = 1`, so those positive residue-field degrees have gcd one. The connected
`G`-torsor above each `P_i` is a `G`-Galois field extension of `k_i = k(P_i)`.

Source: [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes*](https://arxiv.org/pdf/1802.09605v2),
Remark 7.11, PDF p. 28, for the moving theorem and ordinary realizations.
*Needs:* Layer IG.2 *Hilbert subsets and Hilbertian fields*, *Hilbert irreducibility over number
fields*; Layer IG.0 *Finite Galois algebras and torsors*; ReductiveGroups Layers 0 and 3 (the
quotient); SchemeAndStackFoundations Layer 3 and §5.1 (divisors, zero-cycles and rational equivalence).

*Lean:* `exists_realizations_coprime_degrees`.

**Checks.**

- A list of degrees with greatest common divisor one, such as `2, 3`, need not contain `1`.
- No realization over `k` itself follows from the conclusion; the degree-one cycle can have signed
  coefficients, for example `−P₂ + P₃` with degrees two and three.
- For `G = 1`, the single field `k_1 = k` works, with the identity extension `k/k`.
- A nontrivial Galois extension `L/k_i` gives a constant extension `L(t)/k_i(t)` whose constants
  contain `L`. It is not regular over `k_i`, so these fibres do not imply regular realizations.

### IG.4.5 Unramified `Γ`-groups and Property E

**No unramified split-infinity extension of the base.**
1. A number field `K` whose ring of integers is unramified over `ℤ` has degree one over `ℚ`. This is
   Mathlib's `NumberField.finrank_eq_one_of_unramified`, and no hypothesis at the infinite place is
   needed.
2. A finite separable extension `L` of `𝔽_q(t)` that is unramified at every place, `∞` included, and in
   which `∞` splits completely, equals `𝔽_q(t)`.

This target proves (2) and states (1) and (2) in the common form used below: `ℚ` and `𝔽_q(t)` have no
nontrivial finite extension that is unramified everywhere and split completely at infinity.

*Proof sketch.* For (2), let `𝔽_{q^f}` be the constant field of `L` and `d = [L : 𝔽_{q^f}(t)]`. The
extension `L·𝔽̄_q / 𝔽̄_q(t)` is unramified, so the Hurwitz formula gives `2g − 2 = −2d` with `g ≥ 0`.
Hence `d = 1`, and `L = 𝔽_{q^f}(t)` is a constant extension, in which `∞` has residue degree `f`.
Splitting at `∞` forces `f = 1`.

Sources: [Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), §2.1,
published p. 383; [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), §2.1, PDF pp. 10–11,
where it is used for admissibility.
*Needs:* Mathlib `NumberField.finrank_eq_one_of_unramified`; AlgebraicCurves Layers 7 and 8.

**Checks.**

- The constant extension `𝔽_{q²}(t)` is unramified everywhere, but `∞` is inert in it. Splitting at
  infinity is what excludes it.
- Let `p = char 𝔽_q`. The Artin–Schreier extension `y^p − y = t` of `𝔽_q(t)` is unramified at every
  finite place but ramified at `∞`, because `v_∞(t) = −1` is prime to `p`. So unramifiedness is required
  at `∞` as well.
- Over `ℚ` the conclusion is Mathlib's theorem, applied without any condition at the real place.

**Coprime profinite complements.** Let `E` be a profinite group and `N` a closed normal subgroup with
`Γ = E/N` finite. Suppose every finite continuous quotient of `N` has order coprime to `|Γ|`. Then
`E → Γ` has a continuous homomorphic section. If moreover `Γ` is solvable or `N` is prosolvable, any two
such sections are conjugate by an element of `N`; consequently the actions of `Γ` on `N` induced by two
sections give isomorphic `Γ`-groups, conjugation by that element being a `Γ`-equivariant isomorphism.
(Without the solvability hypothesis, conjugacy follows from the Feit–Thompson theorem, since one of two
coprime orders is odd; that theorem is not part of this roadmap, and the conjugacy statement here
carries the hypothesis.) For finite groups, Mathlib's
`Subgroup.exists_right_complement'_of_coprime` gives existence and LocalFiniteGroupTheory L1 gives
conjugacy. This target adds the profinite case.

*Proof sketch.* The open normal subgroups `U` of `E` contained in `N` are cofinal, and in each `E/U` the
image `N/U` is a normal Hall subgroup, so Mathlib provides a complement. Conjugacy of complements in
finite groups, when the normal Hall subgroup or the quotient is solvable, is the Schur–Zassenhaus
conjugacy theorem of LocalFiniteGroupTheory L1, with the same hypotheses; the hypothesis here
provides them at every finite level. This target adds only the passage to profinite groups. At each finite level, the sections and the conjugating
elements form nonempty finite compatible sets, so compactness gives a continuous section of `E` and a
conjugating element of `N`.

Source: [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), paragraph before Definition 2.1,
arXiv v2 p. 10, citing Ribes–Zalesskii (2010), Theorem 2.3.15. This is the section and conjugacy input
that defines the arithmetic `Γ`-action.
*Needs:* Mathlib `Subgroup.exists_right_complement'_of_coprime`; LocalFiniteGroupTheory L1
(Schur–Zassenhaus conjugacy); ProfiniteProPGroups Layer 0.

**Checks.**

- In a split semidirect product `N ⋊ Γ` with coprime orders, `1 ⋊ Γ` is a complement.
- In `S₃ = C₃ ⋊ C₂`, the three subgroups of order two are complements of `C₃` and are conjugate by
  elements of `C₃`.
- Existence fails without coprimality: `C₄ → C₂` has kernel `C₂` and no section.
- Conjugacy fails without coprimality: in `C₂ × C₂` with `N = C₂ × 1`, the complements `1 × C₂` and the
  diagonal are not conjugate, because the group is abelian.

**Unramified admissible `Γ`-groups.** Let `Q₀` be `ℚ` or `𝔽_q(t)`, `Γ` a finite group, and `K/Q₀` a
`Γ`-extension, that is, a Galois extension together with an identification `Gal(K/Q₀) ≅ Γ`. Put
`Δ = 2|Γ|` if `Q₀ = ℚ` and `Δ = q(q − 1)|Γ|` if `Q₀ = 𝔽_q(t)`. Let `K^#` be the maximal extension of
`K` that is unramified everywhere, split completely at every place above `∞`, and has all finite
subextensions of degree prime to `Δ`. Put `H = Gal(K^#/K)`. Then `K^#/Q₀` is Galois, and
`1 → H → Gal(K^#/Q₀) → Γ → 1` is exact with `H` pro-prime-to-`|Γ|`. So *Coprime profinite complements*
gives sections `Γ → Gal(K^#/Q₀)`. A section makes `H` a `Γ`-group by conjugation; the objects below
carry the chosen section. When `Γ` is solvable or `H` is prosolvable, sections are conjugate by elements
of `H`, so the `Γ`-group does not depend on the choice up to isomorphism.

A profinite `Γ`-group `H` is admissible when it is pro-prime-to-`|Γ|` and topologically generated by the
elements `h⁻¹γ(h)` for `h ∈ H` and `γ ∈ Γ`; its `Γ`-coinvariants are then trivial. The arithmetic `H`
also satisfies the stronger pro-prime-to-`Δ` condition, and it is admissible. Define
the unramified `Γ`-group (the group `H` with a chosen section) and the admissibility predicate.

The API:
- A complement supplies the `Γ`-action; under the solvability
  hypothesis of *Coprime profinite complements*, conjugacy of complements is exactly the statement that
  the action does not depend on the choice up to isomorphism.
- Finite quotients of `H` by `Γ`-stable open normal subgroups
  correspond to the finite subextensions of `K^#/K` that are Galois over `Q₀`. Here `Γ`-stability means
  stability under the chosen action, not being characteristic in `H`.
- The closed normal subgroup generated by the elements `h⁻¹γ(h)` is
  all of `H`.
- Every finite `Γ`-equivariant quotient of an admissible group is
  admissible.

*Proof sketch.* Because `K/Q₀` is Galois, `K^#` is stable under `Gal(Q̄₀/Q₀)`, which gives the
extension. Choose and compare complements with *Coprime profinite complements*. For admissibility, `Γ`
acts trivially on the quotient of `H` by the closed normal subgroup generated by the `h⁻¹γ(h)`. So the
corresponding extension of `Q₀` is a direct product with `Γ`. Inertia groups and the decomposition group
at `∞` have order dividing `|Γ|`, so the fixed field of `Γ` is unramified over `Q₀` and split at
infinity. By *No unramified split-infinity extension of the base* it is trivial.

Source: [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Definition 2.1 and Proposition 2.2
with its proof, PDF pp. 10–11 (the choice of `Δ`, the choice of action, and admissibility).
*Needs:* *No unramified split-infinity extension of the base*, *Proper solutions with local
prescriptions*, *Coprime profinite complements*.

**Checks.**

- The trivial group is admissible for every `Γ`.
- Let `Γ = C₂` act on `C₃` by inversion. Then `h⁻¹γ(h) = h⁻²` generates `C₃`, and `3` is prime to `2`,
  so `C₃` is admissible. With the trivial action `h⁻¹γ(h) = 1`, so `C₃` is not admissible. In general a
  nontrivial group with trivial `Γ`-action is not admissible.
- For `Γ = 1` only the trivial group is admissible. This matches `K = Q₀` and `K^# = Q₀` (*No
  unramified split-infinity extension of the base*).
- Take `K = 𝔽_q(t)` and `Γ = 1`. The constant extension `𝔽_{q²}(t)` is unramified everywhere, but `∞`
  is inert in it, so it is not contained in `K^#`.

**Central Property E.** Fix a finite group `Γ`, a positive integer `Δ` divisible by `|Γ|`, and the full
category `C` of pro-`Δ′` `Γ`-groups. Define Property E as follows. An admissible `H` in `C` has
Property E for `C` if the following holds for every `Γ`-equivariant surjection `H ↠ F` in `C`. For every
central extension of `Γ`-groups in `C`

```text
1 → C_p → Ẽ → F → 1,      p prime, Γ acting trivially on C_p,
```

that does not split as an extension of `Γ`-groups, the surjection `H ↠ F` lifts to a `Γ`-equivariant
surjection `H ↠ Ẽ`. Since `Ẽ` is pro-`Δ′`, necessarily `p ∤ Δ`.

This is a restricted family of central problems with proper solutions. It is not projectivity for all
finite embedding problems, as in ProfiniteProPGroups Layer 5. In this setting a weak lift is
automatically proper. Its closed image `I` maps onto `F`, so `I·C_p = Ẽ`. If `I ≠ Ẽ`, then
`I ∩ C_p = 1`, and the inverse of `I → F` is a `Γ`-equivariant section, contradicting nonsplitting.

The API:
- Every nonsplit central problem of prime order of this kind has a `Γ`-equivariant
  proper lift.
- For a nonsplit extension whose central kernel has prime order, every
  `Γ`-equivariant weak lift is proper.
- Property E holds as soon as the lifting condition holds for the finite
  `Γ`-quotients `F` of `H` in `C`; the bullets below give the argument.
- `H` is admissible and pro-`Δ′`. The second condition is stronger than the
  pro-`|Γ|′` condition built into admissibility, and admissibility alone does not give it.

The argument for the finite reduction:
- A problem with finite `F` factors through a finite `Γ`-stable quotient of `H`.
- For profinite `F`, use the `Γ`-stable open normal subgroups `U` of `Ẽ` with `U ∩ C_p = 1`. These are
  cofinal, and normality is what allows forming the quotients `Ẽ/U ↠ F/Ū`.
- Each finite level has weak lifts: from a section if it splits, from the finite condition otherwise.
- At each level the weak lifts form a torsor under `Hom_Γ(H, C_p)`, and the transition maps are
  equivariant, so a compatible family exists.
- Since `Ẽ = lim Ẽ/U` by compactness, the family gives a weak lift to `Ẽ`, which is proper because
  weak lifts of nonsplit prime-order central problems are proper.
- This is the compatibility and inverse-limit argument of LWZB Lemma 2.7. It is an additional step, not
  a factorization of a profinite quotient through a finite group.

*Proof sketch.* Start from the finite embedding problems of ProfiniteProPGroups Layer 5 and add
`Γ`-equivariance. Properness of weak lifts is the intersection dichotomy for the prime-order kernel
above, and the finite reduction is the inverse-limit argument.

Source: [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Definition 2.3, the displayed
extension (2.4), Theorem 2.5 and Lemma 2.7, PDF pp. 11–13 (the special central property of the
arithmetic admissible group).
*Needs:* *Proper solutions with local prescriptions*, *Unramified admissible `Γ`-groups*;
ProfiniteProPGroups Layer 5.

**Checks.**

- For the nonsplit extension `Ẽ = C_{p²} → F = C_p`, every homomorphism that lifts a surjection onto
  `C_p` is surjective, since its image is not contained in the unique subgroup of order `p`.
- For the split extension `C_p × F → F`, the lift `h ↦ (1, π(h))` is a weak lift with image `1 × F`.
  Without nonsplitting, weak lifts need not be proper.
- Consider `C₄ × C₂ → C₂`, `(a, b) ↦ a mod 2`. Its kernel is `2C₄ × C₂ ≅ C₂²`, and it does not split,
  because every element over the generator has order 4. Yet a surjection `H ↠ C₄`, followed by
  `C₄ ≅ C₄ × 1`, is a weak lift with image `C₄ × 1`. So automatic properness needs a kernel of prime
  order.
- The trivial group has Property E: its only quotient is `1`, and the extension `C_p → 1` splits.

**Property E for the arithmetic unramified group.** In the setting of *Unramified admissible `Γ`-groups*
with `Q₀ = ℚ`, `H = Gal(K^#/K)`, with any of its conjugate `Γ`-actions, has Property E for the category of pro-`Δ′`
`Γ`-groups.

*Proof sketch.*
- For a finite quotient, the central problem for `Γ_{Q₀}` is solvable at every place. It is then
  solvable globally, by the obstruction criterion and duality in the range `p ∤ Δ`, where `p` is prime to
  the number of roots of unity in `Q₀`.
- Twist the global solution by a character `Γ_{Q₀} → C_p` that agrees with prescribed characters on the
  inertia group at each finite place and on the whole decomposition group at `∞`. Such a character exists
  by LWZB Lemma 2.6, and after the twist inertia and the decomposition group at `∞` map trivially to
  `C_p`.
- The resulting extension of `K` is unramified, split completely above `∞` and of degree prime to `Δ`,
  hence lies in `K^#`. The lift is proper because weak lifts of nonsplit prime-order central
  problems are proper.
- For profinite quotients, take `Γ`-stable open normal subgroups `U` of the extension group with
  `U ∩ C_p = 1`; normality is needed to form the quotient. Pass to the inverse limit of the finite,
  nonempty sets of lifts that satisfy the local conditions.
- Only the inertia groups at finite places are prescribed. Prescribing whole finite decomposition groups
  would be a stronger statement.

Source: [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Theorem 2.5 and Lemmas 2.6–2.7
with proofs, PDF pp. 11–13.
*Needs:* *Central Property E*, *Unramified admissible `Γ`-groups*, *Finite abelian-kernel obstruction and
pullback*, ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input*, *Twisting abelian-kernel solutions*;
ClassFieldTheory Layers 10 and 12.

**Checks.**

- Once a weak lift exists for a nonsplit central problem of prime order, it is proper (*Central
  Property E*).
- Over `ℚ`, `p = 2` divides `Δ = 2|Γ|`, so central `C₂`-extensions are outside the category. The roots
  of unity of `ℚ` are `μ₂`, and the character step requires `p` to be prime to this order.
- For `Γ = 1` we have `K = ℚ` and `H = 1`, and Property E holds trivially.

### IG.4.6 Arithmetic lifting invariants

**Tame central lift after adjoining roots.** Work in Wood's setting. Let `F` be a finite group with a
surjection `ε : F ↠ C₂` such that the involutions of `F` outside `ker ε` form a single conjugacy class
`c`. Let `K` be a number field and `φ : Γ_K → F` a tamely
ramified homomorphism whose inertia images lie in `c ∪ {1}`. Let `S_c → F` be a reduced Schur cover
(Layer IG.3 *Reduced Schur covers*), with central kernel `A`, the reduced multiplier, and put
`L = K(μ_{4|S_c|})`. Then `φ|_{Γ_L}` has a tame lift `Γ_L → S_c`.

The central `H²` obstruction vanishes over `L`. The exponent of `A` divides `|μ_L|`, and in this range,
where the action is trivial, the everywhere-local dual `H¹` kernel vanishes. Local lifts are then
adjusted by characters to keep tameness. The dyadic condition `μ₄ ⊂ L` is part of the statement.

*Proof sketch.* Work with the prime divisors of `|A|`. Check the local equations for a tame lift,
including `Frob · x · Frob⁻¹ = x^{Nv}` on tame inertia, and remove the `p`-primary factors at places of
residue characteristic `p`. Then apply the `Ш²` duality of ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input*, the
argument with everywhere-split characters, and ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class*, which has no
exceptional class once `μ₄ ⊂ L`. Conjugacy classes over `c ∪ {1}` are handled by Layer IG.3
*Conjugacy classes lift bijectively*.

Source: [Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050),
Lemma 3.2 and its full proof, published pp. 389–390 (the global lifting lemma needed to define the
arithmetic invariant).
*Needs:* *Finite abelian-kernel obstruction and pullback*, ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input*,
ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class*, *Twisting abelian-kernel solutions*; ClassFieldTheory Layers
10 and 12; Layer IG.3 *Reduced Schur covers*, Layer IG.3 *Conjugacy classes lift bijectively*.

**Checks.**

- For `F = C₂`, `ε = id` and `c = {σ}`, the Schur multiplier `M(C₂) = 0`, so `S_c = C₂` and the lift is
  `φ|_{Γ_L}` itself.
- For `F = S₆` with `ε` the sign, the odd involutions form two classes: transpositions and products of
  three disjoint transpositions. So this datum is outside the theorem. The hypotheses of a single class,
  tameness and a number field are all part of the statement.
- The lift need not have full image in `S_c`; for trivial `φ` it is trivial. No field realization is
  claimed.

**The global arithmetic lifting invariant.** Work in the setting of *Tame central lift after adjoining
roots*. Choose a tame lift `φ̃ : Γ_L → S_c` of `φ|_{Γ_L}` and an element `c₀ ∈ c`. For `f ∈ S_c` lying
over `c ∪ {1}`, let `z(f)` be defined as follows:
- if `f` lies over `c`, then `z(f)` is the unique element of the conjugacy class of `f` lying over `c₀`;
  uniqueness is Layer IG.3 *Conjugacy classes lift bijectively*;
- if `f` lies over `1`, then `f ∈ A` is central and `z(f) = f`.

For `u ∈ μ_L` and each finite place `v` of `L`, let `Q_v` be the maximal tame abelian quotient of
exponent dividing `n = |S_c|` of `Γ_(L_v)`, with quotient maps `q_v : Γ_(L_v) → Q_v` and
`q̄_v : Γ_(L_v)^ab → Q_v`, and let `rec_v : L_vˣ → Γ_(L_v)^ab` be the local Artin map. Choose `β_v`
in the inertia group `I_v` with `q_v(β_v) = q̄_v(rec_v(u))`; such a lift exists because `u` is a unit,
so every lift of `rec_v(u)` lies in inertia. The group `Q_v` is not a group of roots of unity in
general: it has an unramified factor, and at places of residue characteristic dividing `n` the image
of inertia in it can be smaller. Define

```text
I(φ, u) = ∏_{v finite} z(φ̃(β_v)).
```

The factors commute, because they all lie over `c₀` or over `1`, and only finitely many are nontrivial.
The product lies in `A[|μ_K|]`. It does not depend on `φ̃`, the `β_v`, `c₀` or conjugation, and
`u ↦ I(φ, u)` is a homomorphism `μ_L → A[|μ_K|]`. The construction keeps the product over finite places
and its normalization by roots of unity, and it is not made for arbitrary unions of conjugacy classes.
Define the arithmetic lifting invariant `I(φ, u)`.

The API:
- The product over finite places is defined and lies in
  `A[|μ_K|]`.
- All the auxiliary choices give the same value.
- `I(φ, u^a) = I(φ, u)^a` for all integers `a`.
- Conjugating `φ` leaves the invariant unchanged.

*Proof sketch.* Define `z` through the bijection of classes and check that the factors commute. Changing
the central lift multiplies by a global character, whose product over the finite places is one by
reciprocity. Independence of conjugation, centrality, `|μ_K|`-torsion and the power law are Wood's
Lemmas 3.3–3.11.

Source: [Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050),
Definition 3.1 and Lemmas 3.3–3.11 with full proofs, published pp. 388–393.
*Needs:* *Tame central lift after adjoining roots*; Layer IG.3 *Conjugacy classes lift bijectively*,
Layer IG.3 *The kernel of the universal marked extension*; ClassFieldTheory Layer 7 (`artinMap` and
`mem_inertiaSubgroup_of_mk_eq_artinMap`: lifts of the Artin image of a unit lie in inertia),
ClassFieldTheory Layers 10 and 12.

**Checks.**

- `I(φ, 1) = 1`: one may take `β_v = 1` at every place.
- For `F = C₂`, `ε = id`, `c = {σ}`, `K = ℚ` and trivial `φ`, one has `n = 2` and `L = ℚ(ζ₈)`. At a
  place over `17`, `L_v = ℚ₁₇` and `Q_v ≅ ℚ₁₇ˣ/(ℚ₁₇ˣ)² ≅ C₂ × C₂` is not cyclic, so it is not a group of
  roots of unity; at a place over `2`, `Q_v` is the unramified `C₂`, inertia maps trivially, and
  `q̄_v(rec_v(−1)) = 1`, so `β_v = 1` is allowed.
- If every finite inertia image of the chosen lift is trivial, every factor is `1` and `I(φ, u) = 1`
  for all `u`.
- Take `F = C₃` and `c = {a, a⁻¹}` with `a` of order three. There is no surjection `F → C₂`, and `c`
  consists of two classes of elements of order three, not of involutions. This datum is outside the
  construction: the definition of `z` through involution classes and the parity argument do not apply.

**Identity-root obstruction for the arithmetic invariant.** For every input to *The global arithmetic
lifting invariant*, `I(φ, 1) = 1`. Hence, for a nonidentity `h ∈ A[|μ_K|]`, the refined count of inputs
with `I(φ, 1) = h` is zero at every height. Its ratio to the full count is zero at every height where
the full count is nonzero, so this ratio cannot have normalized limiting average one. The result is an
obstruction to formulations that prescribe the invariant at an arbitrary root of unity, `u = 1`
included. No replacement conjecture is chosen here.

*Proof sketch.* `u ↦ I(φ, u)` is a homomorphism, so it sends `1` to `1`. For nonidentity `h` the
numerator is therefore empty, and at every height with nonzero denominator the ratio is zero.

Source: [Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050),
Definition 3.1 and Lemma 3.11, published pp. 388–393, and Conjecture 5.1, p. 411.
*Needs:* *The global arithmetic lifting invariant*.

**Checks.**

- For `h = 1`, the condition `I(φ, 1) = 1` imposes no restriction.
- A nonidentity `h` is impossible at `u = 1`, even when `h` is attained at a primitive root of unity.
- At heights where the full count is zero no ratio is formed, and no moment limit is asserted there.

**Marked extensions and their infinity types.** Let `k` be a global field with a chosen place `∞`. Fix a
separable closure `k̄_∞` of the completion `k_∞`; it contains a separable closure `k̄` of `k`, which fixes
a decomposition group and an inertia group at `∞` in `Gal(k̄/k)`. Let `G′` be a finite group and `c` a
union of conjugacy classes of `G′`.

Define marked extensions: a marked `(G′, c)`-extension of `k` is a triple `(M, ι_M, m)` consisting of
- a finite Galois field extension `M/k`;
- an isomorphism `ι_M : Gal(M/k) ≅ G′` under which every inertia group at a place other than `∞` maps
  into `{1} ∪ c`;
- a marking `m : M ⊗_k k_∞ → k̄_∞`, a homomorphism of `k_∞`-algebras.

Isomorphisms of marked extensions are field isomorphisms that carry `ι_M` and `m` to the corresponding
data. The marking gives a map `Gal(k̄_∞/k_∞) → Gal(M/k)`. Composed with `ι_M` it is the infinity type
`Gal(k̄_∞/k_∞) → G′`, an actual homomorphism and not only a conjugacy class.

Wood's Proposition 4.4 translates marked extensions into surjections. Let `G` be a finite group,
`G′ ≤ G ≀ S₂ = (G × G) ⋊ S₂`, and `c` the set of involutions of `G′` with nontrivial image in `S₂`. Write
`G_K^{un,∞}` for the Galois group of the maximal extension of `K` that is unramified everywhere and
split completely above `∞`. Write `τ` for the nontrivial element of `S₂`. Assume the pure swap
`((1,1), τ)` belongs to `G′` and that
`ker(G′ → S₂) → G`, by first-coordinate projection, is surjective; conjugation by the swap then
gives surjectivity of the second projection. For a surjection `ϱ` cutting out `L/K`, let `L̃/k`
be its Galois closure. Its type is the image of the injection `Gal(L̃/k) → G ≀ S₂`: on
`Gal(L̃/K)` the coordinates are the quotient map to `Gal(L/K) ≅ G` and its conjugate by an
order-two element `y ∈ Gal(L̃/k) ∖ Gal(L̃/K)`, and `y` maps to the pure swap. In the ramified
branch `y` is determined by infinity inertia; in the split branch this choice is the twist.
The proposition has two branches with different data at infinity.
- Ramified branch. Fix a ramified `ρ : Gal(k̄_∞/k_∞) → G′` with image `⟨((1,1), τ)⟩`.
  Marked `(G′, c)`-extensions with infinity type `ρ` correspond to pairs
  `(K, ϱ)`, where `K ⊂ k̄` is quadratic over `k`, `K_∞/k_∞` is the quadratic extension cut out by
  `ker ρ`, and `ϱ : G_K^{un,∞} ↠ G` is a surjection of type `G′`.
- Split branch. Marked `(G′, c)`-extensions with trivial infinity type correspond to triples
  `(K, ϱ, y)`, where `K_∞/k_∞` is split completely and `y` is a chosen twist of the surjection `ϱ`,
  with `(ϱ, y)` of type `G′`.

These bijections require the specified swap and the surjective coordinate projection of its
index-two kernel, as well as type exactly `G′`; surjectivity to `S₂` alone does not suffice.
A group `G′` inside `G × G` has no quadratic fixed field. In the tame quadratic function-field case,
`Disc(M) = Disc(K)^{|G′|/2}`.

The API:
- The marking determines the whole local homomorphism at `∞`, through
  the decomposition embedding fixed by `k̄ ⊂ k̄_∞`.
- Each isomorphism class contains the distinguished
  representative with `M ⊂ k̄` whose marking restricts to the inclusion.
- The ramified and split branches, each with its own
  surjection and twist data.
- The tame quadratic divisor equality, which includes `∞` when `∞`
  ramifies.

*Proof sketch.* A marking selects a distinguished embedded representative, hence an actual
homomorphism rather than a conjugacy class. Apply the two constructions of Proposition 4.4 under the
stated hypotheses on the quotient and the type, and check that they are inverse to each other. Compute
the tame quadratic ramification exponents, keeping the contribution of `∞`.

Source: [Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050),
§2.1, published pp. 383–385 (the type and twist), and Definition 4.3 and Proposition 4.4 with its
proof, published pp. 402–403 (the two correspondences have different data at infinity and
different twists).
*Needs:* *Proper solutions with local prescriptions*, *No unramified split-infinity extension of the
base*, *Unramified admissible `Γ`-groups*.

**Checks.**

- A trivial infinity type means that `M ⊗_k k_∞` is split, so the factor selected by the marking is
  `k_∞` itself.
- At a nonarchimedean place of residue characteristic different from two, a ramified quadratic
  infinity type sends a tame inertia generator to the chosen involution. Its value on a fixed
  Frobenius lift may be either `1` or that involution and is part of the prescribed homomorphism.
  Over `𝔽₅((u))`, `z² = 2u` sends Frobenius fixing the compatible roots of `u` to the involution,
  since it negates `√2`. The tangential type used for the Hurwitz count separately prescribes `1`.
- If `G′ ≤ G × G`, so that its projection to `C₂` is trivial, there is no quadratic fixed field. The
  converse of Proposition 4.4 as printed, without this hypothesis, fails in this case.
- For `k = ℚ`, `G = C₂` and `G′ = ⟨((1,1), τ)⟩`, `ℚ(i)` is a marked extension of the ramified
  infinity type with its finite inertia in `c`. But `ker(G′ → S₂) = 1` cannot project onto `G`,
  so it is not the type of a surjection onto `G` in this correspondence.

**The marked extension count over `𝔽_q(t)`.** Let `Γ` be a finite group, `H` a finite `Γ`-group of
order prime to `|Γ|`, `G = H ⋊ Γ`, `c` the set of elements of `G` whose order equals the order of their
image in `Γ`, and `q` a prime power prime to `|G|`; `∞` is the usual place of `𝔽_q(t)`. For a finite
Galois extension `M/𝔽_q(t)` define the reduced discriminant `rDisc(M) = ∏_v |κ(v)|`, the product over
the places `v` of `𝔽_q(t)` ramified in `M` of their residue cardinalities; if `∞` is unramified it is
`q^{deg B}` for the reduced finite branch divisor `B`. Define `N(H, Γ, D, 𝔽_q(t))` as the number of
continuous surjections `ψ : Gal(𝔽_q(t)^sep/𝔽_q(t)) ↠ G` whose extension `M` (the fixed field of
`ker ψ`, with `Gal(M/𝔽_q(t)) ≅ G` through `ψ`) satisfies: the `H`-extension `M/M^H` is unramified
everywhere and split completely at every place above `∞`; the `Γ`-extension `M^H/𝔽_q(t)` is split
completely at `∞`; and `rDisc(M) = D`. Equivalently, `∞` splits completely in `M`, every inertia
group is generated by an element of `c ∪ {1}`, and `rDisc(M) = D`. Then:

1. `N(H, Γ, D, 𝔽_q(t))` is finite, and it is zero unless `D = q^n` for some `n ≥ 0`;
2. the surjections counted correspond bijectively to the isomorphism classes of marked
   `(G, c)`-extensions of `𝔽_q(t)` (*Marked extensions and their infinity types*, with `k̄ ⊂ k̄_∞` fixed)
   with trivial infinity type, the same local conditions and the same `rDisc`, through the
   distinguished embedded representative of each class; the marking is part of the data on the right.

The count is of surjections, not of fields: an extension contributes once for each identification of
its Galois group with `G` that satisfies the conditions. *Proof sketch.* Everything is tame since `q`
is prime to `|G|`. The ramified places are finite, of total degree `n` where `D = q^n`; there are
finitely many reduced effective divisors of degree `n` on `𝔸¹_{𝔽_q}`, and for each the tame fundamental
group of `ℙ¹_{𝔽_q}` minus that divisor is topologically finitely generated (Layer IG.1 *Tame and
prime-to-`p` fundamental quotients* over `𝔽̄_q` and the arithmetic sequence), so it has finitely many
homomorphisms to `G`. Inertia is cyclic and tame, and it meets `H` trivially exactly when it is
generated by an element of `c ∪ {1}`. For (2), the marking of a marked extension selects the embedded
representative and hence `ψ`; conversely `ψ` gives the fixed field and the marking induced by
`k̄ ⊂ k̄_∞`. Sources: [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Lemma 9.3, PDF
p. 38 (the definition of `N`, over `ℚ`; the function-field count uses the same conditions), and
Lemma 10.2 with its proof, PDF pp. 39 and 45–46 (`rDisc = q^n`, inertia generated by `c`, and the
marked representatives). *Needs:* *Marked extensions and their infinity types*, *Unramified
admissible `Γ`-groups*; Layer IG.1 *Tame and prime-to-`p` fundamental quotients*, EtaleCohomologyFoundations §F.0.A2 *The arithmetic fundamental-group sequence*, EtaleCohomologyFoundations §F.0.A1 *Decomposition and inertia groups of a cover*;
AlgebraicCurves Layers 7 and 8.

**Checks.**

- For `H = 1` and `Γ = C₃`, a cyclic cubic extension `M` split at `∞` contributes two surjections, one
  for each identification of `Gal(M/𝔽_q(t))` with `C₃`, although it is one field.
- In a tame cyclic cubic extension, a totally ramified rational finite place contributes `q` to
  `rDisc`, exponent one in the branch degree, but exponent `e − 1 = 2` to the discriminant; `rDisc`
  and the discriminant are not interchangeable.
- For `q` odd, `H = 1`, `Γ = C₂` and a nonsquare `ε ∈ 𝔽_q`, the extensions `y² = t(t − 1)` and
  `y² = εt(t − 1)` have the same geometric branch locus; `∞` splits in the first and is inert in the
  second, so only the first is counted. Forgetting the infinity condition would count both.

### Examples

- **Solvable realization of `S₄`.** `F(S₄) = V₄`, with the point stabilizer `S₃` as supplement, and the
  multiplication map `V₄ ⋊ S₃ → S₄` is an isomorphism. In turn `F(S₃) = C₃` with supplement `C₂`.
  Over a number field `k`, realize `C₂` by `k(√d)`, then solve `C₃ ⋊ C₂ ↠ C₂` properly to get an
  `S₃`-extension `K/k`. Finally solve `V₄ ⋊ S₃ ↠ S₃` properly above `K`, using the split nilpotent
  theorem. The result is an `S₄`-extension of `k`.
- **A nonsplit problem without solutions.** `ℚ(√−1)` is not contained in a cyclic quartic field, since
  `−1` is not a sum of two squares in `ℚ`. The problem `C₄ → C₂` has nilpotent kernel but does not split,
  and it has no weak solution. Split problems with nilpotent kernel are always properly solvable over
  number fields.
- **Wang's example.** `16` is an eighth power in `ℝ` and in `ℚ_p` for every odd `p`, but not in `ℚ₂`,
  since `v₂(16) = 4`. So `Ш¹(ℚ, μ₈) = 0` while `Ш¹_{2}(ℚ, μ₈) ≅ ℤ/2` for `T = {2}`. Dually, the
  unramified character of `ℚ₂` of order 8 is not the restriction of a global character of order 8, and
  no cyclic octic field has the unramified octic completion at `2`. The octic subfield of `ℚ(ζ₁₇)` shows
  that cyclic octic fields exist; in it `2` is unramified with residue degree 4.
- **Two independent lifts.** For `p = 17` and `q = 41`, lift the characters of `ℚ(√17)` and `ℚ(√82)` to
  `ℤ/8`. The compositum `L` has degree 64, its quadratic subfields are `ℚ(√17)`, `ℚ(√82)` and
  `ℚ(√1394)`, and `Ш¹(L, μ₈) ≅ ℤ/2` is generated by `16`. This is an exceptional Grunwald–Wang field.
- **Weak approximation on `SL_n/C₂`.** `k×/k×² → ∏_{v∈S} k_v×/k_v×²` is surjective for every finite `S`.
  The trivial class, however, matches split local data and has trivial image, so full image needs the
  auxiliary places. For `S₃`, two auxiliary places, with Frobenius a transposition and a 3-cycle, suffice.
- **Admissibility and Property E in small cases.** `C₃` with `C₂` acting by inversion is admissible,
  and with the trivial action it is not. For `Γ = 1` and `Q₀ = ℚ` or `𝔽_q(t)`, `K^# = Q₀` and `H = 1`.
  Over `ℚ`, `Δ = 2|Γ|` excludes central extensions by `C₂`.

### Dependencies

This layer uses the following earlier layers of this roadmap:

- Layer IG.0: *Finite Galois algebras and torsors*.
- Layer IG.1: *Tame and prime-to-`p` fundamental quotients*, *Homogeneous spaces with finite stabilisers*.
- Layer IG.2: *Hilbert subsets and Hilbertian fields*, *Hilbert irreducibility over number fields*
  for specialization and realization.
- Layer IG.3: *Reduced Schur covers*, *Conjugacy classes lift bijectively*, *The kernel of the universal
  marked extension*.

From Mathlib it uses `frattini`, `frattini_nilpotent`, `Group.IsNilpotent`, `Group.IsSolvable`,
`SemidirectProduct`, `Subgroup.exists_right_complement'_of_coprime`,
`NumberField.finrank_eq_one_of_unramified`, `IsGalois.normalAutEquivQuotient` and, for local
density of points on smooth varieties, `HasStrictFDerivAt.implicitFunctionOfProdDomain`.

From other roadmaps:

- ProfiniteProPGroups Layers 0, 3, 4 and 5: profinite foundations, Frattini theory, free pro-`p`
  groups, finite embedding problems and the extension dictionary.
- ArithmeticGaloisRepresentations §6.4a: closed-image detection by the Frattini quotient,
  used for the independence of the two `C₈`-lifts.
- ProfiniteCohomology Layers 1, 5 and 7: continuous cohomology, inflation–restriction and Shapiro's
  lemma.
- ClassFieldTheory Layers 5, 7, 10 and 12: local duality, Kummer theory, local Artin maps, local
  invariants, the Brauer sequence and global class field theory.
- ArithmeticGaloisDuality §§R02.3.1, R02.4.2–R02.4.3: maximal extensions unramified outside a
  possibly infinite set, their tower identifications, local unramified annihilators and finite
  Poitou–Tate duality; §§R02.3.0d, R02.4.5a–R02.4.5b supply localization, absolute finite
  duality and Grunwald–Wang for twisting and the restricted-ramification applications.
- EtaleCohomologyFoundations §§F.0.A1–F.0.A2: cover decomposition, inertia and the arithmetic
  fundamental-group sequence. *Auxiliary cokernel comparison* owns the application-specific comparison diagrams.
- LocalFieldsRamification Layers 2–4, AlgebraicCurves Layers 7 and 8, Chebotarev Layer 10,
  ReductiveGroups Layers 0 and 3, SchemeAndStackFoundations Layers 1, 2 (Brauer groups of schemes) and
  4, ResolutionOfSingularitiesCharacteristicZero §6.2 / `sncCompactification` (smooth compactifications,
  through AlgebraicModuliForArithmeticGeometry §9.5), and ReductiveGroupsPartII
  Layer RG2.0a.
- AdelicAlgebraicGroups Layer 4, §4.1: the Hasse principle for torsors under semisimple simply
  connected groups and their weak approximation.
- From Tau Ceti, the finite embedding problems and their
  obstruction class `TauCeti.FiniteEmbeddingProblem.obstruction`.

ClassFieldTheory covers number fields only, and so do the theorems of this layer that rest on it:
ArithmeticGaloisDuality §R02.3.0d *Finite Galois localization and Sha kernels*, ArithmeticGaloisDuality §R02.4.5a *Finite-coefficient Poitou–Tate input*, ArithmeticGaloisDuality §R02.4.5b *Grunwald–Wang and its exceptional class*, *Induced abelian proper solutions*, *Restricted-ramification localization
adapter*, *Auxiliary cokernel comparison*, *Cyclic ramification correction*,
*Property E for the arithmetic unramified group*, *Tame central lift after adjoining roots* and *The
global arithmetic lifting invariant*. The definitions of the layer (embedding problems, unramified
`Γ`-groups, Property E, marked extensions) are stated for global fields, including `𝔽_q(t)`, which
Layer IG.5 uses, and *The marked extension count over `𝔽_q(t)`* uses no class field theory; the
function-field analogues of the theorems just listed need global class field theory of function
fields and are outside this roadmap. In particular the comparison of Wood's arithmetic invariant over
`𝔽_q(t)` with the component invariant (Layer IG.3 *Tate-twisted arithmetic lifting invariants*) is not
a target here.

## Layer IG.5: configuration spaces and Hurwitz moduli

This layer builds the geometry of families of `G`-covers of the line and the counts it controls. It
starts from configuration spaces and the braid group, forms the marked topological Hurwitz spaces of
the Hurwitz action of Layer IG.3, and constructs the tame Hurwitz stacks and schemes over
`ℤ[1/|G|]`, their marked variants with arbitrary monodromy, and admissible covers in every genus.
From these it proves the fixed-degree comparison between complex and finite-field Hurwitz spaces
with finite and `ℓ`-adic coefficients, the trace formula and the point estimate
`|#C(𝔽_q) − q^n| ≤ K_n q^{n−1/2}` for Frobenius-fixed components (with Deligne's weight bound as an
explicit hypothesis), the dictionary between rational points of marked Hurwitz schemes and marked
extensions of `𝔽_q(t)`, the lifting invariant of components with the Frobenius-fixed component
formulas of Liu–Wood–Zureick-Brown, and Seguin's component monoid with its bounded cores. It closes
with the labelled hyperelliptic family of Ellenberg–Venkatesh–Westerland §8.8, field patching over a
complete discrete valuation ring with the patching of Galois algebras, and Abhyankar's conjecture for
affine curves through the theorems of Serre, Raynaud and Harbater.

Conventions particular to this layer. Tuples are raw functions `Fin n → G`: product one, generation
and membership in a class set `c` are separate conditions, and the exact subgroup `H` generated by a
tuple is recorded. "Marked" means an ordinary point over an unramified `∞`; the tangential marking
at `∞` is named as such, and the two markings give different moduli. Frobenius on cohomology is
geometric Frobenius, the inverse of `x ↦ x^q`, as in EtaleCohomologyFoundations §F.10.2b /
`VanishingCycles.frobeniusCohomology`; arithmetic Frobenius is
`x ↦ x^q`. The `q`-power Frobenius endomorphism `F` of a Hurwitz scheme over `𝔽_q` acts on its
`𝔽̄_q`-points, and so on geometric components, as arithmetic Frobenius does, while `F^*` on cohomology is
geometric Frobenius; component statements say which of the two point actions they use. Geometric
components and rational points are different counts: a geometric component contributes to
`𝔽_q`-points only when Frobenius fixes it. Every cohomological comparison is for a
fixed number `n` of branch points; no homological stability is asserted. Field patching is an input
to, not a substitute for, formal patching of branched covers.

### IG.5.1 Configuration spaces

**Ordered and unordered configurations.** For a Hausdorff space `T` and `n ≥ 0`, define `PConf_n(T)`
as the space of injective maps `Fin n → T` with the subspace topology from `T^n`, and
`Conf_n(T) = PConf_n(T)/S_n` with the quotient topology. Let `D` be the closed unit disc and
`𝔻 = int D` the open disc; configurations are taken in `𝔻`, and for `ℂ` in the plane. Fix a
standard base configuration in `𝔻` and a base point `* ∈ ∂D`, which is not a point of `𝔻` (for `ℂ`,
a base point near `∞`). Algebraically,
`PConf_n(A¹)` is the principal open subscheme of `A^n_ℤ` where `∏_{i<j}(x_i − x_j)` is invertible,
so an `R`-point is a tuple whose pairwise differences are units of `R`, not merely distinct
elements; `Conf_n(A¹)` is the open subscheme of the affine space of monic degree-`n` polynomials
where the discriminant is invertible; and `Conf_n(P¹)` is the open subscheme of the projective space
of binary forms of degree `n` where the discriminant does not vanish. The map from ordered to
unordered configurations, `(x_i) ↦ ∏(X − x_i)`, is a finite étale `S_n`-torsor, on `A¹` and on `P¹`;
for `n = 0, 1` the group is trivial and the torsor is the identity. Prove that injective tuples give
topological configurations, and tuples with unit differences give algebraic points; that the
quotient map is a covering map, and on schemes a finite étale `S_n`-torsor; that over a field,
unordered affine configurations are the monic separable polynomials of degree `n`; and that the complex
points of the algebraic configuration spaces, with the analytic topology, are the topological
configuration spaces of `ℂ`. The topologies are Mathlib's subtype and quotient topologies, and
disjoint coordinate neighbourhoods make the permutation action a covering; the polynomial map is
given by the elementary symmetric functions and the discriminant; the torsor statement is checked on
the functor of `R`-points and descended, and the complex comparison is checked after analytification
([Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§2.1 and §§7.1, 7.3, 7.5, published pp. 738–739, 765–767). *Needs:*
SchemeAndStackFoundations Layer 0, SchemeAndStackFoundations Layer 1.

**Checks.**

- `n = 0`: `PConf_0(T) = Conf_0(T)` is one point (the empty tuple), and algebraically
  `PConf_0(A¹) = A^0 = Spec ℤ`, the empty product of differences being `1`; a definition that
  required a nonempty tuple would make these empty.
- `n = 1`: `PConf_1(T) = Conf_1(T) = T`, and algebraically `A¹`, respectively `P¹`, with the trivial
  torsor.
- Over `ℤ` the values `0` and `2` are distinct, but `2 − 0 = 2` is not a unit, so `(0, 2)` is not a
  `ℤ`-point of `PConf_2(A¹)` (it is a `ℤ[1/2]`-point); a definition by distinct coordinates would
  wrongly accept it.

**Configurations and punctured-disc groups.** For every `n ≥ 0`, `Conf_n(𝔻)` is aspherical with
fundamental group Tau Ceti's Artin braid group `TauCeti.BraidGroup n`, so it is a `K(B_n, 1)`: the
standard adjacent exchanges of the base configuration correspond to the generators
`TauCeti.BraidGroup.sigma i`, with the orientation convention of
Layer IG.3 *The Hurwitz braid action*, and the `S_n`-cover `PConf_n(𝔻) → Conf_n(𝔻)` corresponds to
`TauCeti.BraidGroup.permHom`, so that `π₁(PConf_n(𝔻))` is `TauCeti.BraidGroup.pureSubgroup`. The
fundamental group at `* ∈ ∂D` of the closed disc `D` minus `n` points of `𝔻` is Mathlib's
`FreeGroup (Fin n)`, freely generated by positively oriented small loops around the punctures. For
the plane minus `n` points the ordered product of these loops is unconstrained; adding the loop
around `∞` in `P¹` gives the single relation that the product of all `n + 1` loops is one. The
identification of `B_n` with the mapping class group of the punctured disc is not part of this
statement and is not used. The proof deforms the punctured disc onto a wedge of `n` circles
preserving the chosen loops; uses the fibration of ordered configurations that forgets the last
point to prove inductively that the higher homotopy groups vanish and to identify the pure braid
group; and passes to the `S_n`-cover to compare the adjacent exchanges with the Artin presentation
([Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§2.1, published pp. 738–739). *Needs:* *Ordered and unordered configurations*,
Layer IG.3 *The Hurwitz braid action*; Mathlib `FreeGroup`; Tau Ceti `TauCeti.BraidGroup`.

**Checks.**

- For `n = 0, 1` the braid group is trivial and `Conf_n(𝔻)` is contractible (a point, respectively
  `𝔻`).
- For `n = 2`, `Conf_2(𝔻)` is homotopy equivalent to a circle and `TauCeti.BraidGroup 2` is infinite
  cyclic on `sigma 0` (`TauCeti.BraidGroup.orderOf_sigma`), whose image under `permHom` is the
  transposition and whose square is pure.
- For `n = 1`, the loop around the puncture of `ℂ − {a}` generates `FreeGroup (Fin 1) ≅ ℤ` without
  relation, while in `P¹ − {a, ∞}` the two loops are mutually inverse: the affine product is
  unconstrained and the projective product is one.

**A normal-crossings configuration compactification.** For `n ≥ 2`, sending an ordered configuration
`(p_1, …, p_n)` in `A¹` to the pointed line `(P¹; p_1, …, p_n, ∞)` and to the affine frame
`(p_2 − p_1, p_1)` gives an isomorphism over `ℤ`

```text
PConf_n(A¹) ≅ M_{0,n+1} × Aff,        Aff ≅ G_m × G_a,
```

where `M_{0,n+1}` is the scheme of smooth `(n+1)`-pointed genus-zero curves. Hence
`X_n = M̄_{0,n+1} × P¹ × P¹` is proper and smooth over `ℤ` and contains `PConf_n(A¹)` as the
complement of a divisor with normal crossings relative to `ℤ`: the boundary of `M̄_{0,n+1}` together
with `{0, ∞} × P¹` and `P¹ × {∞}`. For `n = 0` and `n = 1` the frame is undefined and the
compactifications are the point and `A¹ ⊂ P¹`. The stable genus-zero moduli `M̄_{0,n+1}` and its
boundary are those of SchemeAndStackFoundations Layer 4 and are not rebuilt here. Prove that
for `n ≥ 2` the affine frame and the normalized pointed curve
give the displayed isomorphism, that the ordered configuration
space is the stated open subscheme of `X_n`, that the reduced
boundary is a relative normal-crossings divisor and that the permutation action is transported on the open part and compared there; no extension of every
permutation to the product model `X_n` is asserted, since the frame singles out `p_1` and `p_2`.
The proof normalizes the first two points to `0` and `1` using the unit `p_2 − p_1`, uses the
universal stable marked curve and its boundary charts, and takes the product with the explicit
compactifications of `G_m` and `G_a`
([Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
Lemma 7.6 and its proof, published pp. 767–768). *Needs:* *Ordered and unordered configurations*;
SchemeAndStackFoundations Layer 1, SchemeAndStackFoundations Layer 3,
SchemeAndStackFoundations Layer 4.

**Checks.**

- For `n = 2`, `M̄_{0,3} = Spec ℤ` and `X_2 = P¹ × P¹`, with `PConf_2(A¹) ≅ G_m × G_a` the
  complement of the three lines `{0} × P¹`, `{∞} × P¹`, `P¹ × {∞}`.
- For `n = 1` the two-point frame is undefined; the separate compactification `A¹ ⊂ P¹` is required,
  and a construction applying the frame formula uniformly in `n` has no input there.
- The normalization divides by `p_2 − p_1`, which must be a unit of the base ring, not merely
  nonzero: over `ℤ` the tuple `(0, 2)` has no image in `M_{0,3} × Aff`, consistently with
  `(0, 2) ∉ PConf_2(A¹)(ℤ)`.

### IG.5.2 Topological Hurwitz spaces

**Marked topological Hurwitz spaces.** Let `G` be a finite group and `n ≥ 0`, and let
`TauCeti.BraidGroup n` act on `G^n` by the Hurwitz action of Layer IG.3 *The Hurwitz braid action*.
Define `Hur_{G,n} → Conf_n(𝔻)` as the covering space associated with this action, `Ẽ ×_{B_n} G^n`
with `Ẽ → Conf_n(𝔻)` the universal cover; its fibre over the base configuration is `G^n`, so its
degree is `|G|^n`. For a conjugation-invariant subset `c ⊆ G`, restricting the fibre independently
to `c^n`, to the tuples generating `G`, or to both gives the subcovers `Hur^c_{G,n}` (fibre `c^n`),
`CHur_{G,n}` (fibre the generating tuples of `G^n`) and `CHur^c_{G,n}` (fibre the generating tuples
in `c^n`). No product-one condition is imposed: the boundary product is a locally constant function
on `Hur_{G,n}`. A marked branched `G`-cover of `D` branched at a configuration in `𝔻` is a `G`-torsor over
`D` minus the branch points, extended over each of them by its normalized cyclic local
model, together with a point over the boundary base point `* ∈ ∂D`; it is connected exactly when its
monodromy `FreeGroup (Fin n) → G` is surjective. Classifying marked covers by their monodromy tuples
identifies `Hur_{G,n}` with the space of marked branched `G`-covers of `D`, and `CHur_{G,n}` with
the connected ones. Prove that the associated covering has exactly the
stated fibre and projection, that the class and generating
inclusions commute with the projections to `Conf_n(𝔻)`, that with fixed
branch points, marked covers up to isomorphism correspond to tuples in `G^n` themselves, not to
their conjugacy classes and that the covering curve is connected exactly
on the generating locus. The covering space is formed from the universal cover and the action;
unramified covers are classified by their based monodromy and extended over each puncture by the
cyclic local model; and connectedness is transitivity of the monodromy on the regular fibre `G`
([Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
Definition 2.2 and §2.3, published pp. 738–740). *Needs:*
*Configurations and punctured-disc groups*, Layer IG.3 *The Hurwitz braid action*,
Layer IG.3 *Riemann existence for punctured curves*.

**Checks.**

- At `n = 0` the fibre is the empty tuple, which generates only the trivial subgroup: `Hur_{G,0}` is
  a point and `CHur_{G,0}` is empty unless `G = 1`.
- The degree of `Hur^c_{G,n} → Conf_n(𝔻)` is `|c|^n`: for `G = S₃`, `c` the transpositions and
  `n = 2` it is `9`, and since the three constant tuples `(t, t)` generate only `C₂`, the degree of
  `CHur^c_{S₃,2}` is `6`.
- A one-puncture `C₂`-cover of `𝔻` with nontrivial local monodromy is a point of `Hur_{C₂,1}` whose
  boundary product is the nontrivial element; a definition imposing product one would delete it.

**Forgetting the boundary marking.** The group `G` acts on `Hur_{G,n}` by simultaneous conjugation
of tuples; this action commutes with the braid action and with the projection to `Conf_n(𝔻)`, and
moving the marked point over the boundary base point by `g ∈ G` conjugates the monodromy tuple by
`g`. Hence the quotient `Hur_{G,n}/G` forgets exactly the boundary marking. The stabilizer of a
tuple whose entries generate exactly `H ≤ G` is the centralizer `C_G(H)`; it is constant along a
component, and on the generating locus it is the centre `Z(G)`. So `G` acts freely on `CHur_{G,n}`
when `Z(G) = 1` and the monodromy is full. The exact subgroup `H` is recorded before the quotient
and only its conjugacy class after it. Prove that `G` acts compatibly with
the branch projection and the braid transport, that the quotient forgets
precisely the boundary lift, that the stabilizer of a tuple with exact
image `H` is `C_G(H)` and that for `Z(G) = 1` the action on the generating
locus is free. Conjugation is checked against each braid formula, changes of marking are compared
with the induced conjugation of tuples, and the stabilizer is the intersection of the centralizers
of the entries
([Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§§2.2–2.3 and proof of Corollary 6.2, published pp. 738–740, 763–764). *Needs:*
*Marked topological Hurwitz spaces*, Layer IG.3 *The Hurwitz braid action*.

**Checks.**

- Every central element of `G` fixes every tuple; for `G = C₂` the conjugation action is trivial, so
  the quotient map is the identity, not a `G`-torsor.
- The generating tuple `((12), (23))` of `S₃` has trivial stabilizer, since
  `C_{S₃}(S₃) = Z(S₃) = 1`.
- The trivial tuple `(1, …, 1)` in the centreless group `S₃` has stabilizer all of `S₃`:
  centrelessness alone does not make the action free off the generating locus.

### IG.5.3 Algebraic Hurwitz moduli

**Tame G-covers in families.** Let `G` be a finite group and `S` a scheme on which `|G|` is
invertible, and `D/S` a proper smooth relative curve of any genus with geometrically connected
fibres. A tame `G`-cover of `D` is a finite morphism `f : C → D` from a proper smooth
relative curve `C/S`, with an action of `G` on `C` over `D`, such that there is a reduced
relative divisor `B ⊂ D`, finite étale over `S`, over whose complement `f` is a `G`-torsor, and
such that near every geometric point of `B` the cover has the cyclic Kummer model `z ↦ z^e` with `e`
prime to every residue characteristic; in the full-monodromy variant `C/S` has geometrically
connected fibres. The branch divisor `B` is exactly the locus over which `f` is not étale. For the specialization `D = P¹_S`, two
markings at `∞` are distinguished: marking at unramified infinity is a section of `C` over
`∞ ∈ P¹_S`, which requires `f` to be étale over `∞`; tangential marking is the fibre functor of
Layer IG.1 *Tame tangential fibres at a boundary point* at a tangent vector at `∞`, and it
allows `∞` to be a branch point. Prove that base change preserves the cover, its
`G`-action and its exact branch divisor, that at a geometric branch point the
inertia is cyclic of order prime to the characteristic, with its Kummer model, that
a section over an unramified `∞` is a marking of the torsor and that
on covers unramified at `∞` the tangential marking agrees with the
ordinary fibre. Over an arbitrary base the family is not recovered from its restriction to the complement of `B`
by normalization: integral closure is not finite and does not commute with base change over a
nonreduced base. The cover is therefore the finite morphism with relative Kummer charts of the
definition; its existence and uniqueness over complete local bases with lifted branch sections is
the tame deformation theorem, and it is descended along étale charts using that isomorphisms of
tame covers with the same branch divisor form a scheme finite étale over the base. Over a
Noetherian normal integral base, and only there, the cover is the normalization of `D` in the
torsor over the generic fibre of the complement. The local Kummer conditions are checked to be
stable under base change, and the two markings are defined by their fibre functors. Sources:
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§7.1, published p. 765 (the genus-zero specialization and exact branch divisor);
[Romagny–Wewers](https://imag.umontpellier.fr/~romagny/articles/hurwitz_spaces.pdf), Proposition
4.5, Lemma 4.6(iii) and Remark 4.7, pp. 324–325 (tame deformations with moving branch points, the
normal-base normalization description and the finite étale isomorphism scheme over arbitrary
bases); [Stacks, Lemma 035O](https://stacks.math.columbia.edu/tag/035O) (absolute normalization
factors through the reduction);
[Chen, *Nonabelian level structures*](https://arxiv.org/pdf/2011.12940v2), Definition 2.1.4, Remark 2.1.5 and Definition 2.1.6,
preprint pp. 14–15 (the smooth locus of general-genus marked covers);
[Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), §11.1, PDF pp. 41–42 (the marked and
unramified-infinity variants);
[Ellenberg–Venkatesh–Westerland II (withdrawn preprint)](https://arxiv.org/pdf/1212.0923v1), §8.2.2,
PDF pp. 42–43 (the tangential construction only; no counting result of this withdrawn paper is
used). *Needs:* Layer IG.1 *Tame and prime-to-`p` fundamental quotients*,
Layer IG.1 *Tame tangential fibres at a boundary point*; Supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`,
SchemeAndStackFoundations Layer 3, BelyiMaps Layer 12, BelyiMaps Layer 13.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- For `G = 1` the identity `P¹_S → P¹_S` is a tame cover with empty branch divisor.
- For `m ≥ 2` invertible on `S`, with `S` over `ℤ[1/m, ζ_m]` so that `G = μ_m ≅ ℤ/m` acts by
  `z ↦ ζz`, the map `z ↦ z^m` is a tame cover branched exactly at `0` and `∞`, with inertia of order
  `m` at both; for `m = 1` it is the identity and has no branch point.
- In characteristic `p`, the Artin–Schreier cover `y^p − y = x` is an `𝔽_p`-torsor étale over `A¹`
  but wildly ramified at `∞`, so it is not a tame cover (and `|G| = p` is not invertible).
- Over `R = k[ε]/(ε²)` with `char k ≠ 2`, the cover `y ↦ y² = x` of `P¹_R` is a tame `C₂`-cover
  branched at `0` and `∞`, with finite model `R[y]` over `R[x]`. The integral closure of `R[x]` in
  `R[y, y⁻¹]` contains every `ε y⁻ᵐ`, since `(ε y⁻ᵐ)² = 0`, so it is not finite and is not `R[y]`;
  absolute normalization discards `ε`. Neither recovers the family, which the definition by finite
  maps with Kummer charts does.

**Arithmetic Hurwitz stacks and schemes.** Let `G` be a finite group and `n ≥ 0`. Over `ℤ[1/|G|]`,
construct the stack of tame `G`-covers of `P¹` (target fixed) with connected source and exactly `n`
branch points. It is a separated smooth Deligne–Mumford stack, and its branch map, on coarse spaces,
is finite étale over `Conf_n(P¹)`. If `Z(G) = 1`, its coarse points over a field `k` of
characteristic prime to `|G|` classify `G`-covers defined over `k`; without centrelessness a coarse
`k`-point records only a Galois-invariant isomorphism class, and descent to a cover over `k` can be
obstructed. The variant whose finite branch points form a configuration in `A¹` is the disjoint
union of two pullbacks of the projective schemes: along `Conf_n(A¹) → Conf_{n+1}(P¹)`, adding `∞`
(ramified infinity), and along `Conf_n(A¹) ⊂ Conf_n(P¹)` (unramified infinity). Unions of conjugacy
classes stable under invertible powers (rational class unions) define open and closed loci over
`ℤ[1/|G|]`. The full-monodromy stack with an ordinary marking at unramified `∞` is a scheme, finite
étale over `Conf_n(A¹)`, for every finite group `G`, because the marking kills the vertical
automorphisms. The tangentially marked scheme used by Wood is a different object, defined for
centreless `G` generated by involutions, with its own fixed type at infinity. Prove that
the branch map is finite étale over `ℤ[1/|G|]`, that
class data stable under invertible powers define open and closed
arithmetic loci, that for centreless `G` the coarse field points
classify actual covers and that the ordinary marking at
unramified infinity gives a scheme for arbitrary finite `G`. The proof applies the centre-free
descent lemma and uniqueness of tame deformations with moving branch points; algebraizes the versal
deformation, glues the local models by descent and proves the branch morphism étale; uses the
constancy of the number of prime-to-characteristic covers for properness and finiteness, treating
stack automorphisms before coarse descent; and computes the remaining vertical stabilizer of the
marked problem as trivial to obtain representability. Sources:
[Romagny–Wewers](https://imag.umontpellier.fr/~romagny/articles/hurwitz_spaces.pdf), Propositions
4.4–4.5 and 4.10, Theorem 4.11, Corollary 4.12 and Remark 4.15(ii), pp. 323–331 (descent,
deformation, algebraization and gluing);
[Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Theorem 11.1, Lemma 11.2 and
Proposition 11.4, PDF pp. 41–43 (the unramified marking for arbitrary `G`);
[Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), Theorem
4.5(1)–(2), published pp. 403–404 (the tangential scheme, with its narrower group and class range).
*Needs:* *Tame G-covers in families*, *Forgetting the boundary marking*,
Layer IG.3 *Finitely many covers of bounded degree*; SchemeAndStackFoundations Layer 1,
SchemeAndStackFoundations Layer 4.

**Checks.**

- An unmarked connected `C₂`-cover keeps its deck involution as a vertical automorphism over `P¹`,
  so the stack has `C₂` as automorphism group at every point and is not a fine moduli scheme.
- A `G`-equivariant automorphism of a connected cover that fixes a marked point over an unramified
  `∞` is the identity: it is given by an element of `Z(G)`, which acts freely on the fibre over `∞`.
- A cover ramified at `∞` lies in the affine-branch variant (its ramified-infinity part) but not in
  the scheme marked at unramified infinity.

**Marked moduli with arbitrary monodromy.** For a finite group `G` and `r ≥ 0`, define the groupoid
of possibly disconnected tame `G`-torsors over `P¹` minus `r` specified distinct finite punctures,
extended over the punctures as tame covers of *Tame G-covers in families* (finite maps with
relative Kummer charts; by normalization only over Noetherian normal integral bases), together with
an ordinary marked point over an unramified `∞`. A listed puncture may carry trivial inertia, and the exact monodromy subgroup
`H ≤ G` is recorded. Over a complex configuration the marked fibre is the set of all tuples in `G^r`
with product one; the full-monodromy locus, which is open and closed, is where the tuple generates
`G`; and the connected components correspond to the braid orbits on the fibre. Before the marking is
forgotten `H` is an actual subgroup; afterwards only its conjugacy class is defined. The
concatenation product and the bounded cores of Section IG.5.6 are built on this space: the connected
scheme with exact branch divisor of *Arithmetic Hurwitz stacks and schemes* excludes identity
entries and proper images and cannot replace it. Prove that the
geometric marked fibre consists of all product-one tuples, including those with proper image `H` and
identity entries, that the connected locus is exactly `H = G`, that
the exact image `H` is preserved by marked transport and
recorded by each component and that inserting an identity
entry adds a specified unramified puncture without changing the cover or its image. The proof
constructs the finite local system of marked monodromy homomorphisms by Riemann existence and
descent of finite covers; algebraizes and descends the parametrized functor of possibly disconnected
covers with ordinary marking at infinity, by Emsalem's construction or by Kanev's pointed
construction; and identifies the loci of exact image and of inactive punctures locally, showing that
transport preserves them. Sources:
[Seguin](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf), §§2.2.2–2.2.6 and
2.3.1–2.3.3, PDF pp. 4–9 (the conventions for marked components of arbitrary tuples);
[Emsalem](https://www.numdam.org/item/10.24033/bsmf.2250.pdf), Théorème 3 and its construction, pp.
62–64 (the arithmetic moduli construction, for connected covers, enlarged here to disconnected
ones); [Kanev](https://arxiv.org/pdf/2403.12756v2), Theorems 4.13 and 4.17, PDF pp. 20–22 (an
alternative pointed construction). *Needs:* *Arithmetic Hurwitz stacks and schemes*,
*Marked topological Hurwitz spaces*, Layer IG.3 *Realizing generating sphere tuples*;
Supplied by ComplexComparisonPartII §C6.2 / `riemannExistence`, SchemeAndStackFoundations Layer 1,
SchemeAndStackFoundations Layer 4.
Riemann existence uses finite-type complex schemes and the shared fibre/deck convention.

**Checks.**

- For `r = 0` the only object is the trivial torsor `P¹ × G` with a marked point; the marked fibre
  is the empty tuple and `H = 1`, for every `G`.
- The tuple `(1, …, 1)` is allowed: every puncture is inactive and `H = 1`.
- For `G = S₃` the product-one tuple `((12), (12))` has `H = C₂` and is a point of this space;
  `CHur_{S₃,2}` contains only generating tuples and omits it.

**Analytic and topological Hurwitz comparison.** Over `ℂ`, the analytification of the tame Hurwitz
stack of *Arithmetic Hurwitz stacks and schemes* is the analytic stack of `G`-covers, and the
analytification of the scheme marked at unramified infinity over `Conf_n(A¹)_ℂ` is the part of the
marked topological Hurwitz space `CHur^{c₁}_{G,n}` of the plane, with `c₁ = G ∖ {1}` (the disc replaced
by `ℂ`, the boundary base point near `∞`), on which the boundary product is one. Its fibre over a
configuration is the set of generating tuples with product one and every entry different from `1`,
because the configuration is the exact branch locus, and its connected components correspond to the
braid orbits on that set. For a conjugation-invariant `c ⊆ G ∖ {1}`, the class locus corresponds in
the same way to `CHur^c_{G,n}`. Tuples with identity entries belong to *Marked moduli with arbitrary
monodromy*, where listed punctures may be inactive, and not to this comparison. For the unmarked
Hurwitz scheme of Ellenberg–Venkatesh–Westerland with affine branch locus and centreless `G`, the
complex space is `CHur^{c₁}_{G,n}/G`. This comparison provides no Frobenius equivariance. The proof
applies Riemann
existence on each fibre; compares the local Artinian deformation functors and their algebraizations
using proper coherent GAGA on the curve presentations and descent of their deformation
groupoids along the configuration charts; and concludes because a map over configuration space that
is bijective
on fibres between covering spaces is an isomorphism. Sources:
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
Lemma 7.4 and its proof, published pp. 766–767 (the unmarked centreless case);
[Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Proposition 11.5, Theorem 11.7 and
§11.3, PDF pp. 43–45 (the stack and the ordinary marked scheme, via Hall's relative GAGA). *Needs:*
*Arithmetic Hurwitz stacks and schemes*, *Marked moduli with arbitrary monodromy*,
*Marked topological Hurwitz spaces*, *Forgetting the boundary marking*; Supplied by
ComplexComparisonPartII §C6.2 / `riemannExistence`,
ComplexComparisonPartII §§C−1.2, C1.9 (algebraic-space analytification and proper coherent
GAGA), ComplexComparisonPartII §C3.3 (proper algebraic-space derived GAGA), SchemeAndStackFoundations Layer 1,
SchemeAndStackFoundations Layer 4.
Riemann existence uses finite-type complex schemes and the shared fibre/deck convention.

**Checks.**

- A marked fibre is a set of raw tuples, whereas forgetting the marking introduces simultaneous
  conjugation and central stabilizers.
- For `G = S₃`, `c` the transpositions and `n = 4`, there are `27` product-one tuples in `c^4`, of
  which the `3` constant ones do not generate; the marked fibre has `24` points, and since `S₃` is
  centreless and acts freely on generating tuples, the unmarked fibre has `24/6 = 4` points.
- For `G = C₂ = {1, g}` and `n = 3`, the tuple `(g, g, 1)` generates and has product one but has only
  two branch points, so it is not in the fibre of the scheme with exactly three branch points; that
  fibre is empty, as Riemann–Hurwitz requires an even number of branch points for a connected double
  cover of `ℙ¹` in characteristic zero.

**Component bound from finite étale degree.** Let `G` be a finite centreless group and `n ≥ 0`
fixed, and let `D_n` be the rank of a marked Hurwitz scheme of
*Arithmetic Hurwitz stacks and schemes* (ordinary or tangential marking) as a finite étale cover of
the configuration scheme `Conf_n` over `ℤ[1/|G|]`; the rank is constant because `Conf_n` is
connected. Then every geometric fibre over `Spec ℤ[1/|G|]` of the Hurwitz scheme has at most `D_n`
connected components, and any family of pairwise disjoint open and closed pieces of it, with
prescribed inertia multidegrees and infinity type, has at most `D_n` components in total. The bound
is uniform in the residue characteristic and needs no comparison of `H⁰`. The proof: each geometric
fibre of the configuration space is connected, being the open subset of the coefficient space where
the discriminant does not vanish; each connected component of a finite étale cover of a connected
base maps onto it with positive degree; the degrees of the components add up to `D_n`, and the
prescribed pieces are disjoint inside the same cover
([Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), Theorem
4.5(1)–(2), published pp. 403–405). *Needs:* *Arithmetic Hurwitz stacks and schemes*,
*Ordered and unordered configurations*.

**Checks.**

- For a split cover of rank `D` (a disjoint union of `D` copies of the base) the number of
  components is exactly `D`.
- A connected double cover has rank two and one component, so the theorem is an upper bound, not an
  equality.
- The pieces of different infinity types must be disjoint parts of one cover; adding the ranks of
  unrelated covers would change the constant.

### IG.5.4 Admissible covers and versal families

**General-genus Hurwitz comparison.** Let `D/ℂ` be a smooth proper connected curve of genus `g`
with `n` distinct labelled points and let `H` be a finite group. Restriction to the punctured
curve and analytification identify the groupoid of tame H-covers of `D`, with branch locus
contained in the markings, with the groupoid of finite topological H-torsors on the punctured
Riemann surface. Keep every equivariant isomorphism; connected covers correspond to surjective
monodromy. Identity inertia is allowed at inactive markings. In analytic families of pointed
curves this equivalence respects pullback, monodromy transport and local Artinian deformation
groupoids; for `2g − 2 + n > 0` it compares the analytic Hurwitz stack over `M_{g,n}` with
this torsor stack. The projective-line comparison is its genus-zero specialization, with the
exact-branch and infinity-marking conditions imposed separately.

*Proof sketch.* Apply Riemann existence to the complement and normalize over the marked points;
cycle lengths give the local Kummer extensions. For smooth pointed families, apply
ComplexComparisonPartII §C5.2 / `ehresmannFibration` to the proper smooth family on manifold
charts. Choose horizontal lifts agreeing with the tangent fields of the disjoint labelled
sections; extend them from disjoint coordinate neighbourhoods using smooth bump functions.
Their flows give trivializations preserving all sections and hence the punctured fibres.
Use unique infinitesimal lifting of finite étale covers. Extend over the markings
by the Kummer charts, compare the proper deformation presentations by GAGA, and descend along
analytic and algebraic charts with the chosen fibre/deck convention. Sources:
[SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XII, Theorem 5.1 and Corollary 5.2,
pp. 251–253; [Chen, *Nonabelian level structures*](https://arxiv.org/pdf/2011.12940v2),
Definition 2.1.4, Remark 2.1.5 and Definition 2.1.6, pp. 14–15, and Theorem 2.4.9, p. 23.
*Needs:* *Tame G-covers in families*, IG.3.1 *Riemann existence for punctured curves*;
ComplexComparisonPartII §§C5.2, C6.2 / `ehresmannFibration`, `riemannExistence`;
ComplexComparisonPartII §§C−1.2, C1.9 (proper GAGA); SchemeAndStackFoundations Layers 1, 3–4;
Mathlib smooth bump functions and partitions of unity; DifferentialGeometry Layer 3 (flows).

**Checks.**

- With `g = 2`, `n = 0` and `H = C₂`, any nonzero quadratic character of the surface group gives
  a connected étale double cover of `D`, whose genus is `3` by algebraic Riemann–Hurwitz.
- With `D = P¹` and no markings, the only H-torsor is the split disconnected cover `P¹ × H`;
  it is connected only when `H = 1`.
- Trivial monodromy at a marked point extends étale across it; requiring every marking to be an
  actual branch point would omit this object from the smooth admissible-cover locus.

**Admissible G-covers of marked curves.** Over `ℤ[1/|G|]`, let `D/S` be a prestable `n`-pointed
curve of genus `g`. An admissible `G`-cover of `D` is a finite `G`-equivariant morphism `C → D`,
with `C/S` a proper flat nodal curve, such that `C → D` is a `G`-torsor over the complement of the
nodes and markings; étale locally at a marking it has the model `x = ξ^e`; and étale locally at a
node of `D` with equation `xy = a^e` it has the model `ξη = a`, `x = ξ^e`, `y = η^e`, the stabilizer
of the node acting by `ξ ↦ ζξ`, `η ↦ ζ⁻¹η` (the action is balanced). Admissible covers in the sense
of Abramovich–Corti–Vistoli may have disconnected `C`; the connected variant requires `C` prestable
with geometrically connected fibres. Morphisms are cartesian squares preserving the `G`-action and
the labels, and they may move the target curve. For the proper stack `Adm̄_{g,n}(G)` the target is
required to be stable, `2g − 2 + n > 0`. Prove that the charts and the
balanced action persist under arbitrary base change, that the
connected variant is open and closed in the stack of all admissible covers, that
`C/S` is smooth if and only if `D/S` is, and on this locus
admissible covers are the tame marked `G`-covers and that the two
faithful branch characters at a node are inverse to each other. The definition uses nodal marked
curves, their local rings and quotient descent; the charts and the balanced cyclic action are shown
to be étale-local and stable under base change; connectedness and stability are imposed separately
and the fibred category is constructed
([Chen, *Nonabelian level structures*](https://arxiv.org/pdf/2011.12940v2), Definitions 2.1.1–2.1.6
and Remark 2.1.5, preprint pp. 13–15, which treat general `(g, n)` before the paper specializes to
elliptic curves). *Needs:* *Tame G-covers in families*, *General-genus Hurwitz comparison*; SchemeAndStackFoundations Layer 1,
SchemeAndStackFoundations Layer 3, SchemeAndStackFoundations Layer 4.

**Checks.**

- For `G = 1` the identity of a stable marked curve is an admissible cover.
- At a node with stabilizer of order `e`, the action `ξ ↦ ζξ`, `η ↦ ζ⁻¹η` preserves `ξη = a`.
- The characters `(ζ, ζ)` with `ζ² ≠ 1` send `ξη` to `ζ²ξη ≠ ξη`; such an unbalanced node cannot
  occur in a generically smooth admissible family.

**Admissible stacks and stable marked G-curves.** For `2g − 2 + n > 0` the stack of admissible
`G`-covers over `ℤ[1/|G|]` is a proper Deligne–Mumford stack whose smooth locus is the stack of tame
marked `G`-covers. A stable marked `G`-curve over `S` is a prestable curve `C/S` with geometrically
connected fibres and a marking `R ⊂ C`, an effective Cartier divisor in the smooth locus finite étale
over `S`, such that the geometric fibres of `(C, R)` have finite automorphism groups preserving `R`
(stability of the marked curve, not of `C` alone), together with a faithful action of `G` such that
`G` preserves `R`, the quotient map `C → C/G` is étale on `C^sm − R` (equivalently `G` acts with
trivial inertia there), and the action at every geometric node is balanced. Of type `(g, n)` means a
decomposition `R = ⊔_{i=1}^n R_i` into open and closed pieces, each preserved by `G`, with
`R_i/G ≅ S`, and `C/G` prestable of genus `g`. Connected admissible covers of `n`-pointed stable
curves of genus `g` are equivalent to stable marked `G`-curves of type `(g, n)`. The functor from
covers marks, for each label, the reduced ramification divisor over a ramified label and the whole
étale fibre over an unramified label; the functor back is `C ↦ C/G` with the sections `R_i/G`, and
taking the quotient commutes with base change and has the node and marking charts of *Admissible
G-covers of marked curves*. For a
connected smooth cover of a fixed target, the group of vertical `G`-equivariant automorphisms is
`Z(G)`. Rigidification in general `(g, n)` and the compactification of `G`-structures in the
exceptional case `(g, n) = (1, 1)` are not part of this statement. The proof uses charts of finite
tame quotients to identify `C/G` and its behaviour under base change; uses Riemann–Hurwitz on each
component to check stability and to build the inverse functors on markings; applies the
twisted-cover construction of Abramovich–Corti–Vistoli for proper Deligne–Mumford representability;
and computes the vertical automorphisms of a smooth cover as the centre. Sources:
[Chen, *Nonabelian level structures*](https://arxiv.org/pdf/2011.12940v2), Propositions 2.4.4,
2.4.6, 2.4.8 and Theorem 2.4.9 with Definitions 2.4.3 and 2.4.7, preprint pp. 21–23, and §2.5,
pp. 23–30 (the admissible action conditions, the type data, the equivalence and the
central automorphisms; properness in general is the theorem of Abramovich–Corti–Vistoli cited
there); [Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Theorem 11.1 and Remark 11.3,
PDF pp. 42–43 (a marked ramified point, as opposed to the unramified marking that produces a
scheme). *Needs:* *Admissible G-covers of marked curves*, *General-genus Hurwitz comparison*;
SchemeAndStackFoundations Layer 1, SchemeAndStackFoundations Layer 4.

**Checks.**

- At a node the two inertia characters are inverse; an unbalanced node is excluded.
- Central vertical automorphisms survive unless a marking rigidifies them: for `G = C₂` every
  connected smooth cover has its deck involution as a vertical automorphism.
- The trivial action of `C₂` on a stable marked genus-two curve preserves the markings and has a
  quotient of genus two, but it is not faithful and `C → C/C₂` has degree one, not a `C₂`-torsor away
  from the markings; faithfulness and trivial inertia off `R` exclude it.
- The double cover `z ↦ z²` of `(ℙ¹; 0, ∞, 1, λ)` gives `C = ℙ¹` with the six marked points
  `0, ∞, ±1, ±√λ`: a stable marked curve, although `ℙ¹` without markings is not stable, so a
  definition asking `C` itself to be stable would lose this admissible cover.

**Versal families with specified topological monodromy.** Let `H` be a finite group, `(g, n)` with
`2g − 2 + n > 0`, `Σ_{g,0,n}` a closed oriented surface of genus `g` with `n` punctures and base
point `v₀`, and `φ : π₁(Σ_{g,0,n}, v₀) → H` a surjection. Over `ℂ`, construct a scheme `M` with a
dominant étale map `M → M_{g,n}`, an `H`-Galois finite étale cover of the punctured universal curve
over `M`, a point `m ∈ M`, and an identification of the punctured fibre over `m` with `Σ_{g,0,n}`
under which the monodromy of the cover is `φ`. After a further dominant étale base change, obtained
from an étale multisection of the punctured universal curve, the punctured family acquires a section
and `M → M_{g,n}` lifts to `M_{g,n+1}`. The Hurwitz stack of such covers has vertical isotropy
`Z(H)`; the étale scheme chart `M` does not make that stack a scheme. Prove that
`M → M_{g,n}` is dominant étale and contains the chosen `φ`-cover point, that
the punctured universal curve carries the finite étale `H`-cover, that
the identified complex fibre over `m` induces `φ`, up to the chosen
base-point transport and that a further dominant étale base change gives
a section and the lift to `M_{g,n+1}`. The proof takes the Hurwitz stack of `H`-covers in genus `g`
(the smooth locus of *Admissible stacks and stable marked G-curves*) and an étale chart through the
given cover; identifies the selected fibre with `φ` by
*General-genus Hurwitz comparison*; and shrinks, spreads out a separable generic
multisection of the punctured universal curve and base changes to obtain the section
([Landesman–Litt](https://arxiv.org/pdf/2205.15352v4), Definition 7.3.1 and proof of Theorem 7.2.1,
p. 37, where existence is taken from Wewers (1998), Theorem 4). *Needs:*
*General-genus Hurwitz comparison*, *Admissible stacks and stable marked G-curves*; SchemeAndStackFoundations Layer 1,
SchemeAndStackFoundations Layer 4.

**Checks.**

- For `H = 1` the cover is the identity of the punctured universal curve.
- For `(g, n) = (2, 0)` and `H = C₂`, a nonzero quadratic surface-group character is realized
  in a family of connected étale double covers; no genus-zero Hurwitz space supplies this fibre.
- For `(g, n) = (1, 1)`, `π₁(Σ_{1,0,1})` is free of rank two and a surjection onto `C₂` gives a
  connected double cover of each once-punctured fibre, nontrivial in every fibre.
- For `H = C₂` the unmarked Hurwitz stack has isotropy `Z(H) = C₂` at every point; the scheme chart
  `M` is not its coarse space.

### IG.5.5 Cohomology and point counts

Applications of smooth duality use bounded constructible finite-Tor complexes with invertible
finite coefficients; their normalized adic realizations retain uniform cohomological and Tor
bounds. These are the domains of EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`.

**Tame cohomological specialization with symmetry.** Let `A` be a henselian discrete valuation ring
whose fraction field has characteristic zero, with geometric generic point `η̄` and geometric
special point `s̄`. Let `X/A` be proper and smooth, `D ⊂ X` a reduced divisor with normal crossings
relative to `A`, `U = X − D`, `π : U′ → U` a finite étale cover, and `Σ` a finite group acting on
`U′` and on `U` over `A`, compatibly with `π`. Then for every prime `ℓ` invertible in `A` and every
`i` there is a `Σ`-equivariant isomorphism

```text
H^i(U′_{s̄}, ℤ/ℓ) ≅ H^i(U′_{η̄}, ℤ/ℓ)
```

([Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
Proposition 7.7 and its proof, published pp. 768–769). No bound prime to the residue characteristic
is imposed on the degree of `U′ → U`. The comparison is built from compactly supported cohomology of
`j_!π_*(ℤ/ℓ)`, with `j : U → X`. Every component of the relative divisor `D` dominates `Spec A`, so
the characteristic-zero generic fibre makes `π_*(ℤ/ℓ)` tamely ramified along `D`
([SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XIII, Remarques 2.3(a) and (c), pp. 281–282);
the local acyclicity
of `j_!π_*(ℤ/ℓ)` along a tame relative normal-crossings boundary (SGA 7, Exposé XIII §2.1.11, as
used in the proof of EVW Proposition 7.7) makes the cospecialization maps isomorphisms, and proper
base change for `X/A` then gives the `Σ`-equivariant isomorphism of compactly supported cohomology
of `U′_{s̄}` and `U′_{η̄}`. Poincaré duality on the smooth fibres of `U′`, supplied by
EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity` and compatible with the finite symmetry, converts it into
the displayed isomorphism; the finite symmetry is carried through every sheaf map. Coherent duality
(SchemeAndStackFoundations Layer 2) is not a substitute for it. These hypotheses (henselian base with
characteristic-zero fraction field, proper smooth `X`, relative normal-crossings boundary) are not
replaced by an arbitrary degenerating family.
*Needs:* *A normal-crossings configuration compactification*,
Layer IG.1 *Tame and prime-to-`p` fundamental quotients*; Supplied by
EtaleCohomologyFoundations §F.2 / `VanishingCycles.properBaseChange`,
Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.localAcyclicity`, Supplied by
EtaleCohomologyFoundations §F.3 / `VanishingCycles.lisseDirectImageTransport`, Supplied by
EtaleCohomologyFoundations §0.8 / `ClassicalAlgebraic.properSupports`; Supplied by
EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleCompactSupports`, Supplied by
EtaleCohomologyFoundations §0.7 / `ClassicalAlgebraic.supportLocalization`,
Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.compactSupportCohomology`;
Supplied by EtaleCohomologyFoundations §F.3 / `VanishingCycles.compactSupportFiniteness`,
EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`, SchemeAndStackFoundations Layer 2.
Proper base change is the arbitrary-torsion `D⁺` theorem, without coefficient invertibility.
ULA and lisse transport use invertible finite coefficients and verified constructibility/fibre
comparisons; the tame-boundary argument here supplies local acyclicity and the transport datum is
retained.
Use étale module localization and compactification-defined lower shriek on `D⁺` torsion; constructible
exchange and perfectness use separated finite-type Noetherian geometry and invertible finite ctf
coefficients.

**Checks.**

- The theorem applies to every finite étale cover of `U`, including covers of degree divisible by
  the residue characteristic: tameness comes from the boundary, not from the degree.
- For Hurwitz spaces the condition `gcd(q, |G|) = 1` (equivalently `char 𝔽_q ∤ |G|`) makes the Hurwitz scheme exist over the base; it is a
  separate condition from the degree of the Hurwitz scheme over configuration space.
- With `q = 4` and `G = C₂`, `4 ∤ 2` but the characteristic divides `|G|`; the tame Hurwitz
  scheme over `ℤ[1/2]` has no base change to `𝔽₄`.
- Smoothness of `X` cannot be dropped: for a proper flat curve over `A` with elliptic generic fibre
  and nodal cubic special fibre (multiplicative reduction), `H¹(−, ℤ/ℓ)` has dimension `2` on the
  generic and `1` on the special geometric fibre.

**Fixed-degree Hurwitz mod-`ℓ` comparison.** Let `G` be a finite centreless group, `c` a conjugacy
class that generates `G` and is rational (stable under invertible powers), `q` a prime power prime
to `|G|`, `n ≥ 0` fixed, and `ℓ` a prime with `ℓ > max(|G|, q, n)`. For the Hurwitz scheme `Hur^c_n`
over `ℤ[1/|G|]` of *Arithmetic Hurwitz stacks and schemes*, there are isomorphisms, for every `i`,

```text
H^i(Hur^c_n(ℂ), ℤ/ℓ) ≅ H^i_ét(Hur^c_{n, F̄_q}, ℤ/ℓ)
```

([Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
equation (7.8.2) and its proof, published pp. 769–770; this is the fixed-degree comparison, distinct
from the stability statement (7.8.3)). The comparison concerns one `n` at a time; it makes no
assertion about Frobenius equivariance or homological stability. The same construction, for the
marked Hurwitz schemes with `q` prime to `|G|`, is used by Wood and in
[Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Lemma 10.3 and its proof, PDF pp. 39,
46. The proof pulls back to the ordered Hurwitz scheme, a finite étale cover of `PConf_n(A¹)`
compactified by *A normal-crossings configuration compactification*; applies
*Tame cohomological specialization with symmetry* with `Σ = S_n` over a henselian discrete valuation
ring of characteristic zero with residue field `F̄_q` (for instance the Witt vectors `W(F̄_q)`);
passes from an algebraic closure of its fraction field to `ℂ` by invariance of étale cohomology
under extension of algebraically closed fields, and applies the Artin comparison at the complex
fibre; and, since `ℓ ∤ n!`, takes `S_n`-invariants, which is exact and computes the cohomology of
the unordered space by transfer. *Needs:* *Tame cohomological specialization with symmetry*,
*A normal-crossings configuration compactification*, *Analytic and topological Hurwitz comparison*,
*Arithmetic Hurwitz stacks and schemes*; Supplied by EtaleCohomologyFoundations §F.2 /
`VanishingCycles.smoothBaseChange`, Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.lisseDirectImageTransport`,
Supplied by ComplexComparisonPartII §C6.3 / `artinComparison`, SchemeAndStackFoundations Layer 2.
The finite-type complex comparison includes elementary fibrations and constant finite abelian
coefficients; its inverse supplies the topological-to-étale direction.
Smooth exchange uses the rotated square with the other map qcqs and sectionwise invertible torsion,
including separably closed field extension.
ULA and lisse transport use invertible finite coefficients and verified constructibility/fibre
comparisons; the tame-boundary argument here supplies local acyclicity and the transport datum is
retained.

**Checks.**

- The comparison is for each fixed `n` with `ℓ ∤ n!`, so invariants under the ordering group are
  exact.
- The bound `ℓ > n` is used: for `n = 2` and `ℓ = 2`, the quotient `PConf_2(ℂ) → Conf_2(ℂ)` is, up
  to homotopy, the squaring map of `ℂ^×`, which induces zero on `H¹(−, 𝔽_2) ≅ 𝔽_2`, although `S_2`
  acts trivially on `H¹(PConf_2(ℂ), 𝔽_2)`; invariants of the ordered cohomology then do not compute
  the unordered cohomology through the pullback.

**Coefficient towers and rational Betti dimensions.** In the setting of
*Fixed-degree Hurwitz mod-`ℓ` comparison* (fixed `n`, `ℓ ∤ n!`), the comparison maps exist with
`ℤ/ℓ^a` coefficients for every `a ≥ 1`, built from the same ordered compactification, and commute
with the reductions `ℤ/ℓ^{a+1} → ℤ/ℓ^a`. The groups at each level are finite, so the towers satisfy
the Mittag–Leffler condition, and the derived inverse limit identifies the `ℤ_ℓ`-cohomology with the
limit of the finite levels; `ℤ_ℓ` and `ℚ_ℓ` coefficients are used only after this, and no other
interchange of inverse limits and cohomology is assumed. Consequently, for every connected component
`Y` of the Hurwitz scheme, smooth of dimension `n`, with special fibre `Y_{F̄_q}` and complex fibre
`Y_ℂ`,

```text
dim_{ℚ_ℓ} H^i_c(Y_{F̄_q}, ℚ_ℓ) = dim_ℚ H^{2n−i}(Y_ℂ, ℚ)   for every i,
```

where Poincaré duality on the smooth `n`-dimensional `Y_{F̄_q}` and `Y_ℂ` is that of
EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`, with the Artin comparison on the complex side. For a
finitely generated `ℤ_ℓ`-module of cohomology the rank is
at most the `𝔽_ℓ`-dimension of the corresponding mod-`ℓ` cohomology, by the universal coefficient
sequence. Sources:
[Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), proof of
Theorem 4.7, published pp. 405–406 (the passage through the tower, made explicit here);
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
end of the proof of Proposition 7.8, published p. 770 (rational rank against the mod-`ℓ` bound);
[Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), proof of Lemma 10.3, PDF p. 46
(compactly supported dimensions of components). *Needs:* *Fixed-degree Hurwitz mod-`ℓ` comparison*,
*Tame cohomological specialization with symmetry*; Supplied by EtaleCohomologyFoundations
§F.4 / `VanishingCycles.normalizedAdicSystems`,
Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.classicalAdicRealization`,
Supplied by EtaleCohomologyFoundations §F.4 / `VanishingCycles.adicFiniteness`, Supplied by
EtaleCohomologyFoundations §F.4 / `VanishingCycles.rationalAdicRealization`,
EnhancedDerivedSheaves §§0.1–0.3 /
`ClassicalDerived.enhancedCategory`, `ClassicalDerived.replacements`, `ClassicalDerived.inverseLimits`, Supplied by EtaleCohomologyFoundations §F.2 /
`VanishingCycles.compactSupportCohomology`; Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.compactSupportFiniteness`, Supplied by ComplexComparisonPartII §C6.3 /
`artinComparison`,
Supplied by ComplexComparisonPartII §C6.4 / `artinComparisonCompactSupport`; Supplied by
ComplexComparisonPartII §C6.6 / `adicArtinComparison`, EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`,
SchemeAndStackFoundations
Layer 2.
The finite-type complex comparison includes elementary fibrations and constant finite abelian
coefficients; its inverse supplies the topological-to-étale direction.
The adic inputs require invertible `ℓ`, coherent derived reductions and uniform cohomological/Tor
bounds; the integral-to-rational passage retains the whole finite-level tower.
Use étale module localization and compactification-defined lower shriek on `D⁺` torsion; constructible
exchange and perfectness use separated finite-type Noetherian geometry and invertible finite ctf
coefficients.
Compact Artin comparison requires separated finite type, and its adic version uses the normalized
uniformly bounded ctf tower.

**Checks.**

- The comparison maps at levels `a + 1` and `a` commute with reduction modulo `ℓ^a`.
- A single mod-`ℓ` isomorphism does not determine the `ℤ_ℓ`-modules: `ℤ/ℓ` and `ℤ/ℓ²` both have
  one-dimensional reduction modulo `ℓ`; the inverse-limit claim uses the whole Mittag–Leffler tower.
- The rank inequality can be strict: `H¹(ℝP², 𝔽_2) ≅ 𝔽_2` while `H¹(ℝP², ℚ) = 0`.

**Finite Hurwitz cohomology and the trace formula.** Let `Y` be a Hurwitz scheme of this layer
over `𝔽_q` in the tame range (`q` prime to `|G|`), smooth, separated and of finite type of pure
dimension `n`; let `ℓ` be a prime not dividing `q`, and `Frob_q` geometric Frobenius.

Provides finite-dimensional compactly supported `ℚ_ℓ`-cohomology for the Hurwitz schemes satisfying
this layer's hypotheses. Supplied by EtaleCohomologyFoundations §F.4 /
`VanishingCycles.rationalAdicRealization`.
Convention gap: this roadmap verifies that `Y` is separated and finite type and that `ℓ` is
invertible, and uses the already chosen compact-support `ℚ_ℓ` realization.

Provides the constant-`ℚ_ℓ` point-count identity for those Hurwitz schemes.
§IG.0.T4 / `VanishingCycles.pointCountTrace`.
Supplied by EtaleCohomologyFoundations §F.10.2b / `VanishingCycles.frobeniusCohomology` for the
geometric action,
which acts on `ℚ_ℓ(1)` by `q⁻¹`.
Convention gap: this roadmap takes `r = 1` and geometric Frobenius on compactly supported
geometric-fibre cohomology, with the supplier's Tate-twist normalization.

The consumer verifies these hypotheses from *Arithmetic Hurwitz stacks and schemes* and the
finite étale map to the smooth configuration scheme. It supplies the degree range
`0 ≤ i ≤ 2n` using compact-support cohomology in nonnegative degrees
(Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.compactSupportCohomology`;
Supplied by EtaleCohomologyFoundations §F.3 / `VanishingCycles.compactSupportFiniteness`) and
smooth Poincaré duality (EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`); that same duality and its trace
map identify, for geometrically connected `Y`, `H^{2n}_c(Y_{F̄_q}, ℚ_ℓ) ≅ ℚ_ℓ(−n)`, with
`Frob_q` acting by `q^n`. This top term contributes `q^n` in the supplied trace identity.
Deligne's weight bound, that every eigenvalue `α` of `Frob_q` on `H^i_c(Y_{F̄_q}, ℚ_ℓ)` satisfies
`|ι(α)| ≤ q^{i/2}` for every embedding `ι : Q̄_ℓ → ℂ`, enters
this roadmap as an explicit hypothesis of *Fixed-degree uniform Hurwitz point estimate*.
Source for that hypothesis: [Deligne, *La conjecture de Weil.
II*](http://www.numdam.org/item/PMIHES_1980__52__137_0/), Corollaire (3.3.4), p. 206.
*Needs:* *Arithmetic Hurwitz stacks and schemes*, *Coefficient towers and rational Betti dimensions*;
Supplied by EtaleCohomologyFoundations §F.2 / `VanishingCycles.compactSupportCohomology`;
Supplied by EtaleCohomologyFoundations §F.3 / `VanishingCycles.compactSupportFiniteness`,
Supplied by EtaleCohomologyFoundations §F.10.1 / `VanishingCycles.frobeniusFixedPoints`,
`VanishingCycles.frobeniusCohomology`, EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`,
SchemeAndStackFoundations Layer 2; the compact-support rational finiteness in *Exact supplier contracts / From EtaleCohomologyFoundations*;
§IG.0.T4 *Constant-sheaf point count for every finite extension*.
Over the chosen finite field and closure, arithmetic Frobenius is `x↦x^q` and geometric Frobenius its
inverse; rational points are the fixed points of their matching powers.
Use étale module localization and compactification-defined lower shriek on `D⁺` torsion; constructible
exchange and perfectness use separated finite-type Noetherian geometry and invertible finite ctf
coefficients.

**Checks.**

- For `Y = A^n`, the only nonzero group is `H^{2n}_c = ℚ_ℓ(−n)`, on which geometric Frobenius acts
  by `q^n`, giving `#A^n(𝔽_q) = q^n`; with arithmetic Frobenius the trace would be `q^{−n}`.
- For `Y = G_m`, `H¹_c = ℚ_ℓ` and `H²_c = ℚ_ℓ(−1)` give `−1 + q = #G_m(𝔽_q)`, while ordinary
  cohomology (`H⁰ = ℚ_ℓ`, `H¹ = ℚ_ℓ(−1)`) would give `1 − q`: in the smooth nonproper setting the
  trace formula needs compact support.
- On `H¹_c(G_m)` Frobenius acts by `1`, of absolute value `q⁰ < q^{1/2}`: the weight bound assumed
  below is an inequality, not an equality, for nonproper `Y`.

**Fixed-degree uniform Hurwitz point estimate.** Let `G` be a finite centreless group and `c`
a union of conjugacy classes of involutions generating `G`, as in Wood's Theorem 4.5. Assume Deligne's
weight bound for these Hurwitz schemes: for every `q` prime to `|G|`, every component `Y` over `𝔽_q`
and every `i`, each eigenvalue `α` of geometric Frobenius on `H^i_c(Y_{F̄_q}, ℚ_ℓ)` satisfies
`|ι(α)| ≤ q^{i/2}` for every embedding `ι`. The hypothesis is Weil II, Corollaire (3.3.4).
Then for fixed `n ≥ 1`
there is a constant `K_n` depending only on `G`, `c` and `n` such that for every prime power `q`
prime to `|G|`, every class multiplicity vector of total `n`, every allowed type at infinity, and
every geometric component `C` of the corresponding Hurwitz scheme over `F̄_q` that is fixed by
Frobenius,

```text
|#C(𝔽_q) − q^n| ≤ K_n q^{n−1/2}.
```

`K_n` is bounded by the sum of the finitely many complex Betti numbers of the Hurwitz spaces with
`n` branch points, through the coefficient towers and the weight bound. Nothing uniform in `n` is
asserted, and no result of the withdrawn
counting argument of EVW II is used. The proof bounds all compactly supported Betti numbers below
the top degree by the fixed-degree complex comparison; applies the identity supplied by
§IG.0.T4 / `VanishingCycles.pointCountTrace` with geometric
Frobenius and the bound `q^{i/2}`
for `i ≤ 2n − 1`; and sums the finitely many dimensions into `K_n`, which is independent of `q`
and of the chosen component
([Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), Theorem 4.7
and its proof, published pp. 404–406). *Needs:*
*Finite Hurwitz cohomology and the trace formula*,
*Coefficient towers and rational Betti dimensions*, *Arithmetic Hurwitz stacks and schemes*,
*Component bound from finite étale degree*; Supplied by EtaleCohomologyFoundations §F.4 /
`VanishingCycles.rationalAdicRealization`, Supplied by EtaleCohomologyFoundations §F.10.1 /
`VanishingCycles.frobeniusFixedPoints`;
§IG.0.T4 *Constant-sheaf point count for every finite extension*; the stated weight bound as a hypothesis.
Over the chosen finite field and closure, arithmetic Frobenius is `x↦x^q` and geometric Frobenius its
inverse; rational points are the fixed points of their matching powers.
Rational finiteness uses the chosen normalized compact-support realization on separated finite-type
geometric fibres with `ℓ` invertible.

**Checks.**

- The leading coefficient counts only Frobenius-fixed components: a component `C` with `Frob(C) ≠ C`
  has no `𝔽_q`-points, since such a point would lie in `C ∩ Frob(C) = ∅`; summing over a Hurwitz
  scheme `X`, `#X(𝔽_q) = π q^n + O(q^{n−1/2})` with `π` the number of fixed components.
- `K_n` may depend on `n`; no estimate uniform as the number of branch points grows is asserted.
- A single class of 5-cycles in `A₅` is not an involution class and is exchanged with the other
  5-cycle class by the 7-power map. Over `𝔽₇` it does not define this arithmetic class locus.
- The shape of the bound on a one-dimensional example: for `Y = 𝔾_m`, `#Y(𝔽_q) − q = −1`, and the
  hypothesis in degree one with `dim H¹_c = 1` gives `|#Y(𝔽_q) − q| ≤ q^{1/2}`; the top-degree term
  alone, without the hypothesis, bounds nothing.

**Hurwitz points and marked extensions.** Let `q` be prime to `|G|`. For the Hurwitz scheme over
`𝔽_q` with ordinary marking at unramified infinity, an `𝔽_q`-point is the same as a triple: a
regular (geometrically connected) `G`-extension `M` of `𝔽_q(t)`, an isomorphism `Gal(M/𝔽_q(t)) ≅ G`,
and an embedding at `∞` with trivial local type, that is, with `∞` split completely; a split `∞`
excludes extensions of the constant field. For `G = H ⋊ Γ` with `H` a finite admissible `Γ`-group
(Layer IG.4 *Unramified admissible `Γ`-groups*) and `c` the nonidentity elements of `G` whose order
equals the order of their image in `Γ`, this identifies the number of `𝔽_q`-points of total branch
degree `n` with the extension count `N(H, Γ, q^n, 𝔽_q(t))` of Layer IG.4 *The marked extension count
over `𝔽_q(t)`*: continuous surjections onto `G` with the stated local conditions and reduced
discriminant `q^n`, matched with marked points through that target's bijection, which keeps the
marking at `∞`. For Wood's separate tangentially marked
scheme the type at infinity is exactly her prescription: tame inertia `g ∈ c ∪ {1}` and Frobenius
lift equal to one, with the multiplicity degree the degree of the finite branch divisor. The two
marking conventions are not interchangeable. The proof uses fine moduli and effective
`G`-equivariant descent, keeping the marking; translates covers into function fields, distinguishing
regularity from connectedness; and reads the branch-degree exponent `q^n` and the type at infinity
from the chosen local embedding. Sources:
[Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Lemma 10.2 and its proof, PDF pp. 39,
45–46 (stated here with the degree argument giving `q^n` and with `c` excluding the identity);
[Wood, *Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), Theorem
4.5(2), published p. 404 (the separately specified tangential type at infinity). *Needs:*
*Arithmetic Hurwitz stacks and schemes*, Layer IG.4 *Marked extensions and their infinity types*,
Layer IG.4 *The marked extension count over `𝔽_q(t)`*, Layer IG.4 *Unramified admissible `Γ`-groups*.

**Checks.**

- A rational marked point fixes the Frobenius lift at infinity as well as the tame inertia type
  there.
- Over `𝔽_q` the central descent obstruction lies in `H²(𝔽_q, Z(G))`, which vanishes because
  `Gal(𝔽̄_q/𝔽_q) ≅ ẑ` has cohomological dimension one, so a coarse rational point of the unmarked
  space comes from a `G`-cover over `𝔽_q`. What it need not satisfy is the specification at `∞`: the
  Frobenius element of the fibre over the unramified point `∞` is determined only up to the twists by
  `Z(G)`, and for centreless `G` it is fixed. For `G = S₃` and a cover with `∞` inert in its cubic
  subfield it is a `3`-cycle, and the coarse point is not the image of any rational point of the
  marked scheme.
- The identity is excluded from `c`: an identity entry would be an unramified puncture, and the
  count would no longer be indexed by the branch degree `q^n`.

### IG.5.6 Components and their invariants

**Specialization and component lifting invariants.** Let `G` be finite and `c ⊆ G − {1}` a
conjugation-invariant set generating `G` and stable under invertible powers. Over algebraically
closed fields of characteristic prime to `|G|`, every point of the marked Hurwitz space has a
lift-product invariant in the inverse Tate twist `U(G,c)⟨−1⟩` of the universal marked extension,
lying in the slice of its boundary product and its nonnegative class degrees. The invariant is
constant on components and compatible with tame specialization from characteristic zero to
characteristic `p` after transport of the torsor of Tate generators. Over `F̄_q`, the `q`-power
Frobenius endomorphism `F` of the Hurwitz scheme, which acts on `F̄_q`-points as arithmetic Frobenius
does, sends a point whose invariant takes the value `g` at a fixed Tate generator to a point whose
invariant takes the value `q⁻¹ ∗ g` there, for the set action of Layer IG.3 *The discrete action of
units*; geometric Galois Frobenius, the inverse action on points, acts by `q ∗`, in agreement with
Layer IG.3 *The cyclotomic twist of a set*. A point or component is fixed by one exactly when it is
fixed by the other. There is `M = M(G,c)` such that, on the generating locus
where every class occurs at least `M` times, components are in bijection with the corresponding
slice of `U(G,c)⟨−1⟩`, by the stable braid-orbit classification and the comparison of components;
outside that stable locus no bijection is asserted. The proof identifies complex components with
braid orbits and uses the lift product of the marked tuple; compares specializations through the
common peripheral Tate module, including the boundary marking; and transports the stable generating
bijection, checking the Frobenius convention. Sources:
[Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Lemma 11.8, PDF p. 46 (the action of
`F` on points is base change along `x ↦ x^q`), Theorem 12.1, Corollary 12.2, Theorem 12.4 and
Corollary 12.6, PDF pp. 46–50 (components, specialization and the unit `q⁻¹` for `F`);
[Wood, *An algebraic lifting invariant*](https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf),
Theorem 5.2, PDF p. 10, Remark 5.4, p. 11, and Theorem 6.1 with its proof, pp. 11–12 (the stable
classification of generating components);
[Ellenberg–Venkatesh–Westerland II (withdrawn preprint)](https://arxiv.org/pdf/1212.0923v1), proof
of Proposition 8.7.1, PDF pp. 52–54 (only the specialization argument for the tangential marking is
used from this withdrawn source). *Needs:* *Analytic and topological Hurwitz comparison*,
*Coefficient towers and rational Betti dimensions*,
Layer IG.1 *Tame and prime-to-`p` fundamental quotients*, Layer IG.3 *The braid lifting invariant*,
Layer IG.3 *Stable classification of generating braid orbits*,
Layer IG.3 *Tate-twisted arithmetic lifting invariants*, Layer IG.3 *The discrete action of units*,
Layer IG.3 *The cyclotomic twist of a set*.

**Checks.**

- The invariant lies in the inverse Tate twist and records the exact class degrees; evaluating it at
  a chosen Tate generator identifies it with an element of `U(G,c)` that changes when the generator
  changes.
- Geometric components are not rational points: a component contributes `𝔽_q`-points only when
  Frobenius fixes it, that is, when its invariant is fixed by the action of `q⁻¹`, equivalently of `q`.
- For `G = C₅ = ⟨a⟩`, `c = G − {1}` and `q ≡ 2 (mod 5)`, a component whose invariant has class
  degree `(2, 0, 1, 0)` (indexed by `a, a², a³, a⁴`) is sent by `F` to one of degree `(0, 0, 2, 1)`,
  the action of `q⁻¹ ≡ 3`, and by geometric Galois Frobenius to one of degree `(1, 2, 0, 0)`;
  attaching `q⁻¹` to geometric Frobenius would interchange them.

**General rational-class fixed-fiber formula.** Let `G` be finite, `c ⊆ G − {1}` a
conjugation-invariant set generating `G` and stable under invertible powers, `q` prime to `|G|`, and
`m` a class multiplicity vector fixed by the `q`-power permutation of classes, whose image in `G^ab`
is trivial. The elements of `U(G,c)` of degree `m` lying over `1 ∈ G` are the pairs `(h, m)` with
`h` in the finite reduced central kernel `A`, and the set action of `q⁻¹` from
Layer IG.3 *The discrete action of units*, `q⁻¹ ∗ (h, m) = (h^{q⁻¹} W_{q⁻¹}(m), m)`, preserves them.
Its fixed elements are the `(h, m)` with `h = h^{q⁻¹} W_{q⁻¹}(m)`, that is, after raising to the
`q`-th power, the solutions `h ∈ A` of

```text
h^{q−1} = W_{q⁻¹}(m)^q,
```

where `W_{q⁻¹}(m)` is the central power correction. Since `q` is prime to `|A|`, `x ↦ x^q` is an
automorphism of `A` commuting with `(q−1)`-th powers, so the number of solutions is
`nr_{q−1}(W_{q⁻¹}(m)^q) = nr_{q−1}(W_{q⁻¹}(m))`: zero unless `W_{q⁻¹}(m)` is a `(q−1)`-th power in
`A`, and then `|A[q−1]|`. Only the counts agree; the solution sets of the two equations differ. The
formula covers every rational class union; it does not reduce to the special formulas for classes of
involutions. The proof chooses a lift of the degree vector, computes its displacement under the
twisted action, translates fixedness into the power equation, removes the `q`-th power from the
count by the automorphism `x ↦ x^q`, and uses translation by `A[q−1]` to identify every nonempty
solution set
([Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Proposition 12.7, its proof and the
defining formula for `b`, PDF pp. 50–52). *Needs:* Layer IG.3 *The braid lifting invariant*,
Layer IG.3 *The discrete action of units*.

**Checks.**

- If `W_{q⁻¹}(m) = 1`, the fixed fibre has `|A[q−1]|` elements.
- If `W_{q⁻¹}(m)` is not a `(q−1)`-th power in `A`, the fixed fibre is empty.
- For `q = 2` (so `|G|` is odd) the equation reads `h = W_{q⁻¹}(m)²` and has exactly one solution.
- For `A = C₃ = ⟨a⟩`, `q = 5` (so `q⁻¹ ≡ 2` on `A`) and correction `a`, fixedness `h = h² a` gives
  `h = a²`, which solves `h⁴ = a⁵ = a²` but not `h⁴ = a`, whose solution is `a`; both equations have
  one solution. This tests the algebraic conversion only, not a particular Hurwitz space.

**Frobenius-fixed component formulas.** Let `G` be finite and `c ⊆ G − {1}` a rational
conjugation-invariant set generating `G`; let `n ≥ 1` and `q` prime to `|G|`, and let `d(q)` be the
number of orbits of the `q`-power map on the set `c/G` of classes. Define

```text
b(G, c, q, n) = Σ_m nr_{q−1}(W_{q⁻¹}(m)),
```

the sum over the multiplicity vectors `m ≥ 0` on `c/G` of total `n`, fixed by the `q`-power
permutation and with trivial image in `G^ab`, with `W` and `nr` as in
*General rational-class fixed-fiber formula*. The number `π(q, n)` of Frobenius-fixed components of
the marked Hurwitz scheme of degree `n` satisfies

```text
π = b + O_G(n^{d(q)−2}),
```

uniformly in `q` and `n`, and `b = 0` implies `π = 0`. If moreover `G ≠ 1`, then for each residue
`a` of `q` modulo `|G|²` a count of lattice points with strictly positive weights gives a nonempty
set `E_a` of allowed residues of `n` modulo an integer `M_a` and positive constants `r_{a,e}`
(`e ∈ E_a`) such that `π = 0` when `n mod M_a ∉ E_a`, and `π = r_{a,e} n^{d(q)−1} + O_G(n^{d(q)−2})`
when `n ≡ e mod M_a` with `e ∈ E_a`. The case `n = 0` is excluded, and the lattice weights are
strictly positive, since zero weights destroy finiteness. The proof counts fixed points of the
twisted action on `U(G,c)⟨−1⟩` and splits them by multiplicity vector; bounds the components in
which some class occurs fewer than `M` times by the orbit estimate for low class counts used in the
cited proof; and counts the congruence lattice in a simplex with strictly positive weights, keeping
its periodic residues and positivity criterion
([Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Proposition 12.7 and Corollary 12.9
with their proofs, PDF pp. 50–52, stated here for `n ≥ 1` with positive weights). *Needs:*
*Specialization and component lifting invariants*, *General rational-class fixed-fiber formula*.

**Checks.**

- The multiplicity vectors have total `n` and trivial abelianized degree; a vector with nontrivial
  image in `G^ab` contributes nothing, since no product-one tuple has it.
- A vector whose power equation has no root contributes zero to `b`.
- For `G = 1` the set `c` is empty, no multiplicity vector of positive total exists, and `b = π = 0`
  for every `n ≥ 1`; the residue statement, which asserts a nonempty `E_a`, needs `G ≠ 1`.

**Semidirect components versus quotient components.** Let `Γ` be a finite group, `H` a finite
admissible `Γ`-group (Layer IG.4 *Unramified admissible `Γ`-groups*), `G = H ⋊ Γ`, and `c` the set of
nonidentity elements of `G` whose order equals the order of their image in `Γ`. Let `q` be a prime
power prime to `|G|` with `gcd(q(q−1), |H|) = 1`, let `n ≥ 1`, and let `d_Γ(q)` be the number of
`q`-power orbits on the nontrivial conjugacy classes of `Γ`. Then

```text
π_{G,c}(q, n) = π_{Γ,Γ−{1}}(q, n) + O_G(n^{d_Γ(q)−2}),
```

uniformly in `q` and `n`; for `q ≡ a mod |G|²` both sides have the same allowed residue classes of
`n` modulo `M_a`, they vanish outside them, and inside them `π_{G,c}(q, n) ≥ C_G n^{d_Γ(q)−1}` for
sufficiently large `n`, with `C_G > 0`. The coprimality with `q − 1` is essential. Admissibility
identifies `G^ab` with `Γ^ab` and the classes of `c` with the nontrivial classes of `Γ`
(Layer IG.3 *Coprime semidirect products and admissible inertia*); the reduced multiplier of `G`
maps onto that of `Γ` with kernel of order prime to `q − 1`, so the power equations of
*General rational-class fixed-fiber formula* have the same numbers of solutions and the two
`b`-formulas agree; the low-class-count bounds and the periodic lattice estimate then give the
comparison ([Liu–Wood–Zureick-Brown](https://arxiv.org/pdf/1907.05002v2), Theorem 10.4 and its proof
and Lemma 12.10, PDF pp. 39–40, 53–55). *Needs:* *Frobenius-fixed component formulas*,
*General rational-class fixed-fiber formula*, Layer IG.4 *Unramified admissible `Γ`-groups*,
Layer IG.3 *Coprime semidirect products and admissible inertia*,
Layer IG.3 *The discrete action of units*.

**Checks.**

- The hypothesis is coprimality with `q(q−1)`, not with `q` alone: for `H = 𝔽_3²` with `Γ = C₂`
  acting by inversion and `q ≡ 1 mod 3` (for example `q = 7`), a reduced multiplier of order `3`
  makes the stable fixed-component count of `G` three times that of `Γ`, not equal to it.
- For `H = 1` the statement is the identity `π_{Γ,Γ−{1}} = π_{Γ,Γ−{1}}`.

**The product-one component monoid.** For an arbitrary finite group `G`, take the components of the
marked Hurwitz spaces of *Marked moduli with arbitrary monodromy*, possibly disconnected covers with
product-one monodromy, in all lengths, allowing identity entries and recording the exact monodromy
subgroup `H`. Concatenation of tuples makes them a graded monoid, with the empty tuple as unit. For
a rational class set `c`, class multiplicities add under the product, the exact image of a product
is the subgroup `⟨H₁, H₂⟩` generated by the two images, and the lifting invariant `Π` is
multiplicative. The absolute Galois action on components respects the product of two components
whose images are nested, `H₁ ⊆ H₂` or `H₂ ⊆ H₁` (Seguin's condition); it is not asserted to respect
products of components with unrelated images. Prove that concatenation
defines the graded product, that the exact image of a product is the join
of the two exact subgroups, that `Π` multiplies and class multiplicities
add and that the Galois action commutes with products satisfying
the nested-image condition. The proof identifies components with braid orbits of product-one tuples
in the ordinary marked moduli; uses concatenation and block-braid interchanges to define the product
and prove the grading and image formulas; and applies Seguin's arithmetic branch-cycle action and
his proof of Galois compatibility under nested images
([Seguin](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf), §§2.2.3–2.3.3 and Theorem
3.3(ii), (iii), PDF pp. 5–9, 11–13). *Needs:* *Marked moduli with arbitrary monodromy*,
Layer IG.3 *The braid-orbit monoid*, Layer IG.3 *The braid lifting invariant*.

**Checks.**

- The empty tuple is the unit, with `H = 1`.
- Appending an identity entry keeps `H` and product one and increases the length by one.
- For `G = S₃` the tuple `((12), (12))` is a valid component with `H = C₂`; a bounded core may not
  discard it.

**Bounded cores and a finite Galois quotient.** Let `G` be finite and `c` a rational
conjugation-invariant set. Every marked product-one `c`-component reduces to a core of length at
most Seguin's explicit bound, depending only on `G` and `c`, with the same exact image `H ≤ G`,
followed by full order blocks `(g, …, g)` of length `ord(g)` with `g ∈ c ∩ H`. The extracted factors
have images nested in `H`, so the Galois product law of *The product-one component monoid* applies,
and one finite extension of the base number field over which every component of every core degree up
to the bound is defined controls the Galois action on all such components. Product one is kept
through each removal; an arbitrary truncation of a tuple is not a core. For `c` consisting of
involutions the order blocks have length two, which gives the bounded-core statement in that case.
The proof applies repeated extraction of class elements and removal of order blocks to a generating
core in its exact subgroup `H`; bounds the remaining core uniformly over the finitely many subgroups
`H` and uses the nested-image product theorem; and, since there are finitely many components in the
bounded core degrees, intersects their stabilizers to obtain one finite Galois quotient
([Seguin](https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf), Corollary 2.13(iii), PDF pp. 10–11, and
Proposition 6.1 with its preceding proof, PDF p. 23). *Needs:*
*The product-one component monoid*, Layer IG.3 *Stable classification of generating braid orbits*.

**Checks.**

- The core keeps the exact monodromy subgroup `H`, and every extracted block has product one.
- No passage from a proper image `H` to the whole group `G` is allowed.
- In `C₂`, removing an even block of the nonidentity element leaves product one; retaining
  two occurrences as the core preserves the image `C₂`, whereas an empty core would lose it.

### IG.5.7 Hyperelliptic quotients

**Double covers and trace-zero normal forms.** Let `2` be invertible on the base. A finite locally
free algebra `𝒜` of rank two over `𝒪` splits as `𝒪 ⊕ ℒ⁻¹`, where `ℒ⁻¹` is the kernel of the trace
and the splitting is `a ↦ tr(a)/2`; multiplication restricted to `ℒ⁻¹` is a section `s` of `ℒ²`, and
conversely `(ℒ, s)` reconstructs the algebra. When the double cover is a smooth hyperelliptic curve,
its reduced branch divisor is the zero divisor of `s`. Over a labelled genus-zero quotient with a
distinguished branch section `∞`, étale-local coordinates and frames of `ℒ` give the equation
`y² = λ∏_{i=1}^{n}(x − a_i)` with `λ` a unit and `n = 2g + 1` odd, the remaining branch point being
`∞`; adjoining an étale square root of `λ` makes the equation monic. This form is not used for
non-flat covers or in residue characteristic `2`. The proof splits the unit and trace-zero summands
by half the trace and computes the square by Cayley–Hamilton; glues the trace-zero line and the
multiplication section under change of frame; and uses the relative trivialization of genus-zero
curves and their Picard groups to identify the branch degree `2g + 2`. The monic odd-degree family
is that of
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§8.8, published pp. 778–779; the trace-zero splitting is the standard derivation for rank-two
algebras, proved here. *Needs:* SchemeAndStackFoundations Layer 1,
SchemeAndStackFoundations Layer 3.

**Checks.**

- The splitting uses `1/2`: in characteristic two `tr(1) = 2 = 0`, so `𝒪 · 1` lies in the trace-zero
  part and is not complemented by it.
- The zero section `s = 0` gives the non-reduced algebra `𝒪[y]/(y²)`, which is not a smooth
  hyperelliptic fibre.
- For `A = ℚ(√2)`, `tr(a + b√2) = 2a`, the trace-zero line is `ℚ√2` and its square section is
  `2`. This gives a field, whereas square section `1` gives `ℚ × ℚ`.

**The lifted affine coordinate group.** For `n` odd, define the group scheme `Ã_n` over `ℤ[1/2]` of
triples `(a, b, d)` with `a, d` units, `b` arbitrary and `d² = a^n` (the notation `Ã_n` avoids a
clash with the braid group `B_n`). It acts on monic double-cover equations by `x′ = ax + b`,
`y′ = dy`, which carries `y² = ∏(x − a_i)` to `y′² = ∏(x′ − (a a_i + b))`, and its group law is

```text
(a, b, d)(a′, b′, d′) = (aa′, ab′ + b, dd′).
```

Since `n` is odd, `u = d/a^{(n−1)/2}` satisfies `a = u²` and `d = u^n`, so `Ã_n ≅ G_m ⋉ G_a` with
`G_m` acting on `G_a` through `u²`; in particular `Ã_n` is smooth with geometrically connected
fibres. `Ã_n` is a group scheme on these coordinates, not the quotient of points obtained by
forgetting the square-root lift `d`. Over any commutative ring `R`, the coordinate group
`Ã_n(R)` is defined for every `n : ℕ`; the odd-degree equivalence is asserted only
under `Odd n`, while smoothness and connectedness above are over `ℤ[1/2]`. Prove that
composition is the displayed
law and preserves `d² = a^n`, that for odd `n` the parameter `u` gives
`a = u²`, `d = u^n`, that the group acts on the cover, with its
hyperelliptic involution and distinguished point at infinity and that the
geometric scheme is `G_m × G_a`, hence connected. The proof checks that the leading coefficient
stays one and the multiplication law, builds the mutually inverse maps `u ↔ (a, d)`, and reads
smoothness and connectedness from `G_m × G_a`. The coordinate group is the one acting on the family
of
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§8.8, published pp. 778–779; its description is proved here. *Needs:*
*Double covers and trace-zero normal forms*; SchemeAndStackFoundations Layer 0.

**Checks.**

- For `n = 2` over `ℚ`, composing `(-1, 2, 1)` with `(1, 3, -1)` gives translation
  `(-1)·3 + 2 = -1`; the translations are not simply added.
- `(1, 0, 1)` is the identity.
- `(1, 0, −1)` acts on the cover by the hyperelliptic involution `y ↦ −y`, fixing every `a_i`; it is
  a nontrivial element and is not discarded.
- For `n` even, `(d/a^{n/2})² = 1` gives the two components `d = ±a^{n/2}`, so the connectedness
  conclusion needs `n` odd.

**The labelled hyperelliptic quotient family.** Let `n = 2g + 1` be odd and work over `ℤ[1/2]`. The
labelled smooth hyperelliptic stack classifies smooth proper curves `C` with an involution whose
quotient is a genus-zero curve, with the `n` finite branch points labelled and the branch point `∞`
distinguished. The monic family `y² = ∏_{i=1}^{n}(x − a_i)` over `PConf_n(A¹)` presents this stack
as the quotient stack `[PConf_n(A¹)/Ã_n]`, with `Ã_n` the lifted affine group acting on
`PConf_n(A¹)` through `a_i ↦ a a_i + b`. Isomorphisms preserve the labels, the distinguished point
over `∞` and the hyperelliptic involution. Quotient stacks are those of
SchemeAndStackFoundations Layer 1. The statement concerns smooth curves only; nothing is claimed
about Jacobians of nodal hyperelliptic curves. Prove that the
monic family carries the `n` labelled finite branch points and the distinguished `∞`, that
every object is étale locally in this normal form, that
isomorphisms preserving labels and involution are exactly
the coordinate changes by `Ã_n` and that this description of the
Isom sheaves gives the equivalence with the quotient stack. The proof uses
*Double covers and trace-zero normal forms* for étale-local essential surjectivity; shows that every
isomorphism of covers has the affine form with scaling `d² = a^n`; and checks the composition law
and descends the Isom sheaves to the quotient-stack equivalence. The monic family is that of
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§8.8, published pp. 778–779; the quotient equivalence is proved here. *Needs:*
*Double covers and trace-zero normal forms*, *The lifted affine coordinate group*,
*Ordered and unordered configurations*; SchemeAndStackFoundations Layer 1.

**Checks.**

- For `n = 3` the compactified curves have genus `1`, with four labelled branch points (three
  finite, one at `∞`).
- For `n = 1` (genus zero) the quotient `[PConf_1(A¹)/Ã_1]` is a valid algebraic stack, but its
  stabilisers are positive-dimensional, so it is not Deligne–Mumford; the monodromy criterion of the
  next target is applied only for `n ≥ 3`.
- The element `(1, 0, −1)` of `Ã_n` fixes every label and acts as the hyperelliptic involution, so
  every object has this automorphism.
- A repeated root `a_i = a_j` lies outside `PConf_n(A¹)` and gives a singular curve, not an object
  of the family.

**Finite-cover criteria for full monodromy image.** Let `f : U → X` be a morphism of connected
locally noetherian Deligne–Mumford stacks. The induced map on étale fundamental groups is surjective
if and only if every connected finite étale cover of `X` stays connected after pullback to `U`. A
representable smooth surjection with nonempty geometrically connected fibres satisfies this
condition, and its source is connected. The inclusion of a nonempty dense open substack of a
connected normal locally noetherian Deligne–Mumford stack also satisfies it, because a connected
finite étale cover of a normal stack is normal and hence irreducible, so its dense open part stays
irreducible. For `n = 2g + 1 ≥ 3` the stabiliser in `Ã_n` of a configuration of at least two
distinct labelled points is `{(1, 0, ±1)} ≅ μ₂`, finite étale over `ℤ[1/2]`, so `[PConf_n(A¹)/Ã_n]`
is Deligne–Mumford. Consequently, for `n ≥ 3`, the connected `Ã_n`-torsor
`PConf_n(A¹) → [PConf_n(A¹)/Ã_n]`, and the restriction from a compact-type hyperelliptic locus to its
smooth dense open part, preserve finite and `ℓ`-adic monodromy images, whenever the relevant abelian
scheme exists on the locus. For `n = 1` the quotient stack is algebraic but not Deligne–Mumford and is
outside this criterion. The proof
translates finite covers into finite continuous sets under the fundamental group of the stack; for
smooth maps with connected fibres, a decomposition of the pullback into two open and closed parts
would have disjoint open images covering the connected cover; and for normal dense opens it uses
irreducibility of connected normal covers, checked on an atlas. These facts are used in
[Ellenberg–Venkatesh–Westerland](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf),
§8.8, published pp. 778–779; the finite-cover proofs are given here, independently of any statement
about Jacobians of nodal curves. *Needs:* *The lifted affine coordinate group*,
*The labelled hyperelliptic quotient family*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`,
SchemeAndStackFoundations Layer 1, SchemeAndStackFoundations Layer 4.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- A dense open inclusion into a connected normal scheme induces a surjection on étale `π₁`, while a
  general dominant map needs the finite-cover criterion.
- Normality is needed: for the nodal cubic `X` and `U = X − {node} ≅ G_m`, the connected cover of
  `X` by a cycle of `m ≥ 2` projective lines pulls back to `m` disjoint copies of `G_m`, so
  `π₁(U) → π₁(X)` is not surjective.
- The genus-zero case `n = 1` is excluded: at the configuration `a₁ = 0` every `(u², 0, u)`,
  `u ∈ 𝔾_m`, fixes the configuration and satisfies `d² = a`, so `[PConf_1(A¹)/Ã_1]` has a
  one-dimensional stabiliser and unramifiedness of its diagonal fails (the curve `y² = x` has the
  automorphisms `(x, y) ↦ (u²x, uy)`).

### IG.5.8 Patching and Abhyankar's conjecture

**Field patching for curves over a complete DVR.** Let `T` be a complete discrete valuation ring
with uniformizer `t`, `X̂` a smooth connected projective `T`-curve with connected closed fibre `X`
and function field `F`, and `η` the generic point of `X`. For `U ⊆ X` let `R_U` be the ring of
`f ∈ F` regular at `η` and at every point of `U`; in particular `R_∅ = 𝒪_{X̂,η}`, following
Harbater–Hartmann's Notation 4.3, not `F`. Let `R̂_U` be its `t`-adic completion, `F_U = Frac(R̂_U)`
for `U ≠ X`, and `F_X = F`. For `U₁, U₂ ⊆ X`, inside `F_{U₁∩U₂}` one has
`F_{U₁} ∩ F_{U₂} = F_{U₁∪U₂}`, and every invertible matrix over `F_{U₁∩U₂}` is a product of
invertible matrices over `F_{U₁}` and over `F_{U₂}`. Consequently finite-dimensional vector spaces
over `F_{U₁∪U₂}` are equivalent to pairs of vector spaces over `F_{U₁}` and `F_{U₂}` with an
isomorphism over `F_{U₁∩U₂}`. This tensor equivalence extends to finite separable commutative
algebras and to Galois algebras of finite groups, with their actions. It is not an equivalence of
field extensions: connectedness and properness must hold after gluing. The proof uses the
patch rings and their inclusions and the intersection computation of Theorem 4.9; proves matrix
factorization by the iteration over the complete discrete valuation ring and approximation on the
projective curve of Theorem 4.10; glues vector spaces by the inverse fibre-product construction of
Theorem 4.11; and transports algebra structures and `G`-actions by the tensor equivalence of Theorem
7.1 ([Harbater–Hartmann](https://arxiv.org/pdf/0710.1392v1), Notation 4.3, p. 9; Theorems 4.9–4.11,
pp. 12–13; Theorem 7.1, p. 22). *Needs:* Layer IG.0 *Finite Galois algebras and torsors*;
SchemeAndStackFoundations Layer 1, SchemeAndStackFoundations Layer 3.

**Checks.**

- Patching the split `G`-Galois algebras `∏_{g∈G} F_{U₁}` and `∏_{g∈G} F_{U₂}` along the identity
  gives the split algebra `∏_{g∈G} F_{U₁∪U₂}`, equal to `∏_{g∈G} F` when `U₁ ∪ U₂ = X`.
  It is disconnected for `G ≠ 1`: the glued algebra need not
  be a field.
- The field-patching equivalence does not by itself give a formal patching theorem for branched
  covers.
- For `T = k[[t]]` and `X̂ = ℙ¹_T`, `t⁻¹` belongs to `F` but not to
  `R_∅ = 𝒪_{X̂,η}`: the empty patch ring is not the function field.
- With both patches empty in this example the split algebra glues over `F_∅ = k(x)((t))`,
  rather than over `F = k((t))(x)`.

**Patching Galois algebras with prescribed local pieces.** Let `T` be a complete discrete valuation
ring with uniformizer `t`, fraction field `K` and residue field `k`, `X̂` a smooth connected projective
`T`-curve with closed fibre `X` and function field `F`, `P₁, …, P_r` distinct closed points of `X`,
`F_i` the patch field at `P_i`, `F_{r+1}` the patch field of `X ∖ {P₁, …, P_r}` and `F₀` the overlap
field at the generic point of `X` (Harbater–Hartmann's Notation 4.3 and Theorem 4.13). Let `G` be a
finite group, `H_i ≤ G` subgroups and `E_i/F_i` `H_i`-Galois field extensions whose base change to
`F₀` is split, with a chosen splitting. Then:

1. *Algebra patching.* The induced algebras `Ind_{H_i}^G E_i`, together with the split algebra
   `Ind_1^G F_{r+1}`, patch to a `G`-Galois `F`-algebra `A` inducing each of them, and `A ⊗_F F₀` is
   split. So `A ≅ Ind_J^G E` for a subgroup `J ≤ G` and a `J`-Galois field extension `E/F`, and `E`
   has an `F`-embedding into `F₀`.
2. *Field criterion.* The factor `E` can be chosen with `J` containing every `H_i`; so if
   `H₁, …, H_r` generate `G`, then `A = E` is a field, Galois over `F` with group `G`.
3. *Constants.* If moreover `X` is geometrically connected over `k`, that is `H⁰(X, 𝒪_X) = k`, then
   `K` is algebraically closed in `F₀`, hence in every factor field `E` of `A`, and in `A` itself
   when the `H_i` generate `G`. For disconnected `A` the statement concerns the factor fields only:
   a nontrivial idempotent of `A` is algebraic over `K` and does not lie in `K`.
4. *Closed-fibre ramification.* On the normalization of `X̂` in `A`, the completed local behaviour at
   the points over `P_i` is that of `E_i`, the cover is étale at every point of the closed fibre other
   than the `P_i`, and so every branch point of its generic fibre specializes to one of the `P_i`.
   This does not fix the branch locus of the generic fibre; *Patching covers with a fixed branch
   divisor* does.

*Proof sketch.* (1) Patch the induced algebras with Theorem 7.1(v) in the multi-patch form of
Theorem 4.13. Over `F₀` every piece becomes `Ind_1^G F₀`, so `A ⊗_F F₀` is split and each factor
field of `A` embeds in `F₀`. (2) The factor `E` lying over the identity copy of `F₀` contains, after
base change to `F_i`, the identity copy of `E_i`, so its stabiliser contains `H_i`. (3) An element of
`F₀` algebraic over `K` generates a finite extension `K'` of the complete field `K`; the
uniformizer `t` of `F₀` stays a uniformizer of `K'`, and the residue field of `K'` is a finite
extension of `k` inside `k(X)`, hence equal to `k`; so `[K' : K] = ef = 1`. (4) Local behaviour is
read on each patch from the corresponding induced algebra; at a closed point other than the `P_i`
the completion factors through the split patch, so the branch locus meets the closed fibre only in
the `P_i`, and every closed point of the generic fibre specializes into the closed fibre because `X̂`
is proper over `T`. Source: [Harbater–Hartmann](https://arxiv.org/pdf/0710.1392v1), Theorem 4.13,
p. 13; Theorem 7.1(v), p. 22; §7.2, the induced algebras and Theorem 7.3 with its proof, pp. 24–26
(there `X̂ = ℙ¹_T`, whose closed fibre is geometrically connected), and Remark 7.4(a), p. 26 (other
smooth curves). *Needs:* *Field patching for curves over a complete DVR*, Layer IG.0 *Finite Galois
algebras and torsors*; SchemeAndStackFoundations Layers 1 and 3.

**Checks.**

- If every `H_i` is trivial, `A` is the split algebra `Ind_1^G F`, disconnected for `G ≠ 1`. For
  `X̂ = ℙ¹_T` and `G = C₂`, `A = F × F` and the idempotent `(1, 0)` solves `e² − e = 0` without lying
  in `K`: only the factor `F` is regular over `K`.
- Geometric connectedness of `X` is needed in (3): for `T = ℝ[[t]]` and `X̂ = ℙ¹_{ℂ[[t]]}`, viewed as a
  `T`-curve, `X̂` is smooth, connected and projective with connected closed fibre `ℙ¹_ℂ`, but
  `H⁰(X, 𝒪_X) = ℂ`; for `G = 1` the algebra `A = F = ℂ((t))(x)` is a field containing `ℂ((t))`, which is
  algebraic over `K = ℝ((t))`.
- Generation is needed: if the `H_i` generate a proper subgroup `J`, then `A ≅ Ind_J^G E` for a
  `J`-Galois field `E`, which is not a field.
- For `G = C₂ × C₂`, two patches with `H₁ = C₂ × 1` and `H₂ = 1 × C₂` glue to a `C₂ × C₂`-Galois field
  extension of `F`, although no single patch carries the whole group.

**Patching covers with a fixed branch divisor.** Let `T` be a complete discrete valuation ring with
uniformizer `t`, fraction field `K` and residue field `k`, and `X̂` a normal connected projective
`T`-curve with reduced closed fibre `X` and function field `F`, admitting a finite morphism to a
smooth projective `T`-curve. Let `S` be a nonempty finite set of closed points of `X` containing the
singular points of `X`. For an irreducible component `U` of `X ∖ S` let `R̂_U` be the `t`-adic
completion of the ring of rational functions regular along `U`; for `P ∈ S` let `R̂_P` be the complete
local ring of `X̂` at `P`; for a branch `℘` of `X` at `P`, a height-one prime of `R̂_P` containing `t`,
let `R̂_℘` be the complete local ring of `R̂_P` at `℘`; write `F_U`, `F_P`, `F_℘` for the fraction fields
(Harbater–Hartmann, §6). Fix a finite group `G` and a closed subscheme `B̂ ⊂ X̂` finite over `T`, the
fixed horizontal branch divisor. A patching problem of `G`-covers étale off `B̂` consists of normal
`G`-Galois covers `Ŷ_U → Spec R̂_U` and `Ŷ_P → Spec R̂_P` (finite, with `G`-Galois algebras `A_U` over
`F_U` and `A_P` over `F_P`), each étale over the points of `Spec R̂_U[t⁻¹]`, respectively
`Spec R̂_P[t⁻¹]`, outside `B̂`, together with, for every branch `℘` at `P` lying on `U`, a
`G`-equivariant isomorphism of `F_℘`-algebras `A_U ⊗ F_℘ ≅ A_P ⊗ F_℘`. These isomorphisms are
arbitrary: they need not come from splittings. Then:

1. there is a normal `G`-Galois cover `Y → X̂`, unique up to unique isomorphism, with `G`-isomorphisms
   `Y ×_{X̂} Spec R̂_U ≅ Ŷ_U` and `Y ×_{X̂} Spec R̂_P ≅ Ŷ_P` inducing the given isomorphisms over every
   `F_℘`;
2. `Y_K → X̂_K` is étale over `X̂_K ∖ B̂_K`;
3. choose factor fields `E_U` of `A_U` and `E_P` of `A_P`, with quotient kernels `𝔪_U` and `𝔪_P`.
   Suppose that for every branch `℘` on an edge `(U,P)`, the identified branch algebra
   `A_℘ = A_U ⊗ F_℘ ≅ A_P ⊗ F_℘` has a prime `𝔮_℘` contracting to both `𝔪_U` and `𝔪_P`.
   Thus the chosen factors have a common field factor after extension to the branch field;
   their entire scalar extensions need not agree. If the stabilisers in `G` of the chosen local
   factors generate `G`, then `Y` is connected;
4. if moreover `k` is algebraically closed and `Y → X̂` is étale over the generic point of some
   component of `X`, then `K` is algebraically closed in the function field of `Y`, so `Y_K` is
   geometrically connected over `K`.

*Proof sketch.* (1) The complete-local patching of finite-dimensional vector spaces, Theorems
5.7–5.9 of Harbater–Hartmann for smooth `X̂` and Theorem 6.1 for normal `X̂`, is part of this target;
with Theorem 7.1(v) it patches the `A_U` and `A_P` to a `G`-Galois `F`-algebra `A`, their inverse
limit. Let `Y` be the normalization of `X̂` in `A`. The maps from `Spec R̂_U` and `Spec R̂_P` to `X̂` are
flat with geometrically regular fibres because `X̂` is excellent, so normalization commutes with them
and gives the identifications. (2) A closed point of `X̂_K ∖ B̂_K` specializes to a closed point `Q` of
`X`. If `Q = P ∈ S`, the map `Spec R̂_P → Spec 𝒪_{X̂,Q}` is faithfully flat; if `Q` lies on a component
`U`, so is `Spec R̂_U → Spec R_U`, since `t` lies in the Jacobson radical of `R_U`, and `𝒪_{X̂,Q}` is a
localization of `R_U`. In both cases étaleness off `B̂` over the points where `t` is invertible
descends from the piece. (3) Contract each chosen local prime to `A`. A common branch prime
contracts to the same prime of `A` along both sides of an edge; the patch graph is connected,
so all chosen primes contract to one prime `𝔪`. Each local factor stabiliser fixes `𝔪`.
Generation makes `𝔪` fixed by all of `G`, and transitivity of `G` on the factors of a `G`-Galois
algebra forces `A` to be a field. Hence its normalization `Y` is connected. (4) Let `K'` be the
algebraic closure of `K` in the function field of `Y` and `T'` the integral closure of `T` in it, so
`T' ⊆ H⁰(Y, 𝒪_Y)`. As `k` is algebraically closed, `T'` is totally ramified of degree `[K' : K]` over
`T`, so `t` is a unit times the `[K' : K]`-th power of a function on `Y`, and the closed fibre of `Y`
is nonreduced along every component when `K' ≠ K`; it is reduced over a generic point of `X` where
`Y → X̂` is étale. Sources: [Harbater–Hartmann](https://arxiv.org/pdf/0710.1392v1), Theorems 5.7–5.9
and Proposition 5.11, PDF pp. 16–18; Theorem 6.1, pp. 18–19; Theorem 7.1(v), p. 22;
§7.2, proof of Theorem 7.3, pp. 24–26 (induced factors and their common branch prime);
[Harbater–Obus–Pries–Stevenson](https://arxiv.org/pdf/1408.0859v1), §3.3, sketches of Theorems 3.8
and 3.13 and of the general case, PDF pp. 11–13 (the patching steps that consume this contract);
[EGA IV₂](https://www.numdam.org/item/PMIHES_1965__24__5_0/), Corollaire (6.14.5), printed p. 176
(normalization and normal base change), and
Scholie (7.8.3)(v), printed p. 215 (completions of excellent rings). *Needs:*
*Field patching for curves over a complete DVR*, Layer IG.0 *Finite Galois algebras and torsors*;
SchemeAndStackFoundations Layers 0, 1 and 3 (excellence, normalization, faithfully flat descent of
étaleness, curves).

**Checks.**

- Support on the closed fibre does not fix the generic branch locus. For `T = k[[t]]`, `k`
  algebraically closed of characteristic `p`, the Artin–Schreier cover `y^p − y = 1/(tx − 1)` of
  `ℙ¹_K` is étale over a neighbourhood of the closed affine line, since `tx − 1` reduces to `−1`
  there, so all its generic branch points specialize to `∞`; but it is ramified at `x = t⁻¹`, where
  the right side has a simple pole. With `B̂` the section `∞_T` the hypothesis fails on the patch at
  `∞`, where the cover is ramified along the section `{x = t⁻¹}`, which is not `∞_T`.
- If every piece is the split cover `⨿_{g∈G}` of its patch, glued by the identity, then `Y` is
  `⨿_{g∈G} X̂`, which is disconnected for `G ≠ 1`: the generation hypothesis of (3) fails, every
  stabiliser being trivial.
- For `T = ℂ[[t]]` and `K = ℂ((t))`, the quadratic extension
  `K(x)(√((x+t)/x))` on `ℙ¹_T` is a field at the patch `P` with `x = 0`, since `(x+t)/x` has odd
  `x`-valuation, and splits on the complementary patch `U`, where `1+t/x` has a Hensel square
  root. It also splits over the branch field. The field factor's idempotent `1` becomes `(1,1)`
  there, whereas a chosen factor of the split complementary algebra has a primitive idempotent.
  A branch prime nevertheless contracts to the selected primes on both sides; the stabilisers
  `C₂` and `1` generate `C₂`. The only compatible global idempotents are `0` and `1`, as connectedness
  requires. Equality of the whole extended factors would exclude this example. Its horizontal
  branch divisor consists of the sections `x = 0` and `x = −t`.
- The étaleness hypothesis of (4) is needed: for `2` invertible in `k` and `T' = T[s]/(s² − t)`, the
  cover `ℙ¹_{T'} → ℙ¹_T` is a connected `C₂`-cover étale over all of `ℙ¹_K` (so `B̂ = ∅`), but its
  function field contains `K(√t)`; its closed fibre is nonreduced, so it is étale over no point of `X`.

**Specialization of covers from `k((t))` to `k`.** Let `k` be an algebraically closed field,
`K = k((t))`, `U` a smooth connected affine `k`-curve and `Y → U_K` a finite étale `G`-Galois cover
with `Y` geometrically connected over `K`. Then there is a connected finite étale `G`-Galois cover
of `U` itself, obtained as a fibre of a spreading out of `Y`. *Proof sketch.* `Y`, its `G`-action and
the étale and Galois conditions are defined over a finitely generated `k`-subalgebra `R ⊂ K`, giving
a finite étale `G`-Galois cover `𝒴 → U_R`; the locus of `s ∈ Spec R` with geometrically connected
fibre is constructible and contains the generic point, so it contains a dense open set, which has a
`k`-point because `k` is algebraically closed; the fibre there is the required cover. Sources:
[Harbater–Obus–Pries–Stevenson](https://arxiv.org/pdf/1408.0859v1), §3.3, sketches of Theorems 3.8
and 3.13, PDF pp. 11–13 (specialization of `t`); [EGA IV₃](https://www.numdam.org/item/PMIHES_1966__28__5_0/),
Théorème (8.8.2) (descent of finitely presented objects to a finitely generated subalgebra) and
Théorème (9.7.7) (constructibility of geometric connectedness of fibres). *Needs:* Layer IG.0 *Finite
Galois algebras and torsors*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; SchemeAndStackFoundations Layer 0 (limits
and spreading out).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- For `G = 1` the statement is the identity cover of `U`.
- Geometric connectedness is needed: if `char k ≠ 2`, `U_{K(√t)} → U_K` is a connected `C₂`-cover
  that is not geometrically connected, and its constant fibres after spreading out over
  `k[t,t⁻¹]` are split. In characteristic two `K(√t)/K` is purely inseparable; use instead the
  separable Artin–Schreier constant extension `K(a)`, `a² − a = t⁻¹`, whose fibres over the same
  parameter space split over `k`.
- The bad fibres are excluded by the open set: the Artin–Schreier cover `y^p − y = tx` of `𝔸¹_K` in
  characteristic `p` specializes at `t = a ≠ 0` to the connected cover `y^p − y = ax`, and at `t = 0`
  to the split one.

**Euler characteristic of `ℓ`-torsion local systems on affine curves.** Let `k` be an algebraically
closed field of characteristic `p > 0`, `ℓ ≠ p` a prime, `U` a smooth connected affine `k`-curve with
smooth compactification `C` of genus `g`, and `C ∖ U = {x₁, …, x_s}`, `s ≥ 1`. Let `M` be an
`n`-dimensional `𝔽_ℓ`-vector space with a continuous action of `π₁^ét(U)` and `M̃` the corresponding
locally constant sheaf (EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`). Then `H^q(U, M̃) = 0` for `q ≥ 2`,
`H^q(U, M̃) = H^q(π₁^ét(U), M)` for `q = 0, 1`, both finite-dimensional, and

```text
dim H⁰(π₁^ét(U), M) − dim H¹(π₁^ét(U), M) = n · (2 − 2g − s) − Σ_{i=1}^{s} Sw_{x_i}(M),
```

where `Sw_{x_i}(M)` is the Swan conductor (ArithmeticGaloisRepresentations Layer 3, discrete
coefficients `𝔽_ℓ`) of `M` as a representation of the absolute Galois group of the completion of
`k(C)` at `x_i`, acting through a decomposition group. In particular, on `U = 𝔸¹_k` a representation
with `M^{π₁} = 0` has `dim H¹(π₁^ét(𝔸¹_k), M) = Sw_∞(M) − n`. *Proof sketch.* Degree two vanishes by
affine Artin vanishing, and in degrees zero and one the cohomology of a locally constant sheaf is
given by invariants and by classes of torsors, hence by group cohomology of `π₁^ét(U)`. For the
formula, trivialise `M` on a connected Galois cover `V → U` with group `Q` and smooth compactification
`D → C`. Since `Q` acts freely on `V`, `RΓ_c(V, 𝔽_ℓ)` is a perfect complex of `𝔽_ℓ[Q]`-modules, and
`χ_c(U, M̃)` is obtained by pairing its class with `M`. That class is determined by its Brauer
character, which the Hurwitz formula on `D` evaluates at `1` and the Lefschetz fixed-point formula on
`D` evaluates at the other `ℓ`-regular elements; their fixed points lie over the `x_i`, with
multiplicities read from the lower ramification filtration. Comparing characters, the class is
`χ_c(U)` times the free module minus the modules induced from the Swan modules of the decomposition
groups at the `x_i`. The Swan module of a finite inertia group is the projective `ℤ_ℓ`-module whose
character is the Artin character minus the augmentation character (Swan's theorem), and its pairing
with `M` is `Sw_x(M)`. Finally `χ_c = χ` for locally constant sheaves on a smooth curve: the two
differ by the cohomology of the punctured henselian neighbourhoods of the `x_i`, which is that of
their inertia groups; as wild inertia is pro-`p` and the tame quotient is procyclic, degrees zero and
one are the kernel and cokernel of one endomorphism of a finite-dimensional space, of equal
dimension. The Brauer-character and Swan-module inputs are part of this target. Sources:
[Raynaud, *Caractéristique d'Euler–Poincaré d'un faisceau et cohomologie des variétés
abéliennes*](http://www.numdam.org/item/SB_1964-1966__9__129_0/),
Séminaire Bourbaki exp. 286, n° 1 with Proposition 1 (the Swan module), pp. 130–131; n° 3, Théorème
1 and formula (2 ter), its form for the fundamental group, p. 133; n° 4, the proof, pp. 133–136;
[Stacks, Lemma 59.69.3 (03RR)](https://stacks.math.columbia.edu/tag/03RR) (constant coefficients) and
[Theorem 59.83.11 (03RT)](https://stacks.math.columbia.edu/tag/03RT) (vanishing in degree two).
*Needs:* ArithmeticGaloisRepresentations Layer 3 (Swan conductors in its conductor setting, whose
perfect residue field covers the algebraically closed `k`); AlgebraicCurves Layer 8 (*Galois II*:
lower ramification groups `G_i(P′∣P)` of places and Hilbert's different formula, with no
finiteness or perfectness of the residue field, and the completion bridge to the local lower
groups); Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.affineArtinVanishing` (affine geometric prime-to-characteristic torsion); Supplied
by EtaleCohomologyFoundations §0.8 / `ClassicalAlgebraic.properSupports`; Supplied by
EtaleCohomologyFoundations §0.7 / `ClassicalAlgebraic.supportLocalization`; Supplied by
EtaleCohomologyFoundations §F.2 / `VanishingCycles.etaleCompactSupports`,
`VanishingCycles.compactSupportCohomology`; Supplied by EtaleCohomologyFoundations §F.3 /
`VanishingCycles.compactSupportFiniteness`; §IG.0.T1 / `VanishingCycles.curveEndomorphismTrace` (fixed points of curve endomorphisms);
SchemeAndStackFoundations Layer 3 (curves and the Hurwitz formula).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.
The curve input uses smooth proper geometrically connected compactifications, invertible `ℓ`, the
chosen Tate coordinate and isolated fixed-point multiplicities.
Affine vanishing is geometric over the algebraically closed field, with `ℓ≠p`.
Use étale module localization and compactification-defined lower shriek on `D⁺` torsion; constructible
exchange and perfectness use separated finite-type Noetherian geometry and invertible finite ctf
coefficients.

**Checks.**

- For `M = 𝔽_ℓ` with trivial action every Swan conductor vanishes and the formula gives
  `dim H¹ = 2g + s − 1`, the rank in Stacks 03RR; for `U = 𝔸¹_k` it gives `H¹ = 0`.
- In characteristic two with `ℓ = 3`, the sign character `L` of the Artin–Schreier cover `y² − y = x`
  of `𝔸¹_k` has one break, `1`, at `∞`, so `dim H¹(𝔸¹_k, L) = 1 − 1 = 0`, matching `H¹(𝔸¹_y, 𝔽₃) = 0`
  for the source line. Its pullback along `x = z³` has Swan conductor `3` and `dim H¹ = 2`, matching
  the cover `y² − y = z³`: its completion `Y²W + YW² = Z³` is smooth of genus one with one point at
  infinity, so its `H¹` with `𝔽₃` coefficients has dimension `2`.
- For `m ∣ ℓ − 1` with `p ∤ m`, a nontrivial `𝔽_ℓ^×`-valued character of the Kummer quotient
  `π₁^ét(𝔾_{m,k}) → μ_m` is tame at `0` and `∞`, so the right side is `2 − 2 = 0`; indeed `H⁰` and
  `H¹` of a nontrivial character of the procyclic prime-to-`p` quotient both vanish.

**Serre's solvable step on the affine line.** Let `k` be algebraically closed of characteristic
`p > 0` and write `π_A(U)` for the set of finite groups that are Galois groups of connected finite
étale covers of `U`. Let `1 → H → G → G/H → 1` be exact with `H` solvable and `G` quasi-`p`. If
`G/H ∈ π_A(𝔸¹_k)` then `G ∈ π_A(𝔸¹_k)`. In particular every solvable quasi-`p` group, and every
`p`-group, lies in `π_A(𝔸¹_k)`. *Proof sketch.* Reduce by induction to `H` elementary abelian of
exponent a prime `ℓ`, with irreducible action of `Q = G/H`, and fix a surjection
`φ : π₁^ét(𝔸¹_k) → Q`. The obstruction to lifting `φ` to `G` lies in `H²(π₁^ét(𝔸¹_k), H)`, `H` acting
through `φ` (`TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`). This group
vanishes, as does `H²(π₁^ét(𝔸¹_k), M)` for every finite `ℓ`-primary module `M`, constant or not:
trivialise `M` on a connected Galois cover `V → 𝔸¹_k` with group `Q_M` and put `V' = V/Q_ℓ` for an
`ℓ`-Sylow subgroup `Q_ℓ` of `Q_M`. Restriction to the open subgroup `π₁^ét(V')` is injective on `H²`,
its index being prime to `ℓ` (corestriction). Over `π₁^ét(V')` the module is a successive extension of
copies of `ℤ/ℓ` with trivial action, since `Q_ℓ` fixes a nonzero vector of every nonzero `ℓ`-primary
module. Finally `H²(π₁^ét(V'), ℤ/ℓ)` embeds in `H²(V', ℤ/ℓ)` by the Hochschild–Serre sequence of the
pro-universal cover, and this vanishes on the smooth affine curve `V'` (Artin–Schreier for `ℓ = p`;
Kummer, `ℓ`-divisibility of `Pic(V')` and Tsen for `ℓ ≠ p`). A lift is surjective if the extension
does not split. In the split case, a surjective lift exists once the inflation
`H¹(Q, H) ⊂ H¹(π₁^ét(𝔸¹_k), H)` along `φ` is strict. For `ℓ = p` the right side is infinite. For
`ℓ ≠ p` the action of `Q` on `H` is nontrivial, since otherwise `G = H × Q` would have the quotient
`H` of order prime to `p`; by irreducibility `H^Q = 0`, and *Euler characteristic of `ℓ`-torsion
local systems on affine curves* gives `d(φ) := dim H¹(π₁^ét(𝔸¹_k), H) = Sw_∞(H) − dim H`. Pull `φ`
back along `z ↦ z^m`, `p ∤ m`. The result `φ_m` is still surjective, because the Kummer cover is
totally ramified over `0`, where the `Q`-cover is étale. The base change at `∞` is tame of
ramification index `m`. ArithmeticGaloisRepresentations §3.4, whose conductor setting allows the
residue field `k`, gives `Sw_L(V|_{G_L}) = m · Sw_K(V)` for a tame extension `L/K` of index `m`, so

```text
d(φ_m) = m · d(φ) + (m − 1) · dim H.
```

For `m > 1` this exceeds `d(φ) ≥ dim H¹(Q, H)`, so the inflation along `φ_m` is strict. The growth
is not multiplicative: the rank term `(m − 1) · dim H` is part of it, and all of it when `d(φ) = 0`.
Sources: [Harbater–Obus–Pries–Stevenson](https://arxiv.org/pdf/1408.0859v1), Theorem 3.6 and its
sketch and Corollary 3.7, PDF pp. 10–11 (Serre's theorem), whose sketch prints the growth as
`d′ = md`, which the last Check below contradicts;
[Stacks, Lemma 59.63.1 (0A3K)](https://stacks.math.columbia.edu/tag/0A3K) and
[Lemma 59.69.3 (03RR)](https://stacks.math.columbia.edu/tag/03RR) (degree-two vanishing on affine
curves). *Needs:* *Euler characteristic of `ℓ`-torsion local systems on affine curves*; Layer IG.1
*Tame and prime-to-`p` fundamental quotients*; Supplied by EtaleCohomologyFoundations §F.0 /
`VanishingCycles.finiteEtaleGaloisCategory`; ArithmeticGaloisRepresentations
§3.4 (Swan conductors under tame base change, over the perfect residue field `k`);
ProfiniteCohomology Layers 1, 5 and 10
(inflation–restriction, corestriction); ProfiniteProPGroups Layer 5 (lifting along embedding
problems); SchemeAndStackFoundations Layers 2 and 3 (Artin–Schreier and Kummer sequences,
Hochschild–Serre for Galois coverings, Tsen, Picard groups of curves).
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- `ℤ/p` lies in `π_A(𝔸¹_k)`, realized by the Artin–Schreier cover `y^p − y = x`.
- The quasi-`p` hypothesis is needed: `ℤ/ℓ` for a prime `ℓ ≠ p` is solvable but is not a quotient of
  `π₁^ét(𝔸¹_k)`, whose maximal prime-to-`p` quotient is trivial.
- For `G = (ℤ/p)²` over `G/H = ℤ/p`, the lift through a splitting is not surjective; the infinitude
  of `H¹(π₁^ét(𝔸¹_k), ℤ/p)` supplies a surjective one.
- The growth is not `d(φ_m) = m · d(φ)`. In characteristic two take `ℓ = 3`, `G = S₃`, `H = A₃ ≅ 𝔽₃`
  and `Q = C₂` acting on `H` by the sign, with `φ` the Artin–Schreier cover `y² − y = x`. Then
  `d(φ) = 0 = dim H¹(C₂, 𝔽₃)`, so the inflation along `φ` is not strict. For `m = 3` the pullback is
  `y² − y = z³`, an elliptic curve minus one point, and `d(φ₃) = 2 = 3 · 0 + 2 · 1`, not `3 · 0`; the
  strict inclusion then realizes `S₃` over `𝔸¹_k` in characteristic two.

**Raynaud's theorem for the affine line.** Let `k` be algebraically closed of characteristic `p > 0`.
Every quasi-`p` group lies in `π_A(𝔸¹_k)`. *Proof sketch.* Induction on `|G|`. If `G` has a nontrivial
normal `p`-subgroup `H`, then `G/H` is quasi-`p` and smaller, and *Serre's solvable step on the affine
line* applies. Otherwise fix a Sylow `p`-subgroup `S` and let `G(S)` be the subgroup generated by the
proper quasi-`p` subgroups whose Sylow subgroups lie in `S`. If `G(S) = G`, realize these subgroups by
induction, make their inertia at `∞` a `p`-group inside `S` by pulling back along `z ↦ z^m` with
`p ∤ m` (Abhyankar's lemma), and patch them over `K = k((t))` along their common inertia at `∞` with
*Patching covers with a fixed branch divisor* (in place of Raynaud's rigid patching), on a model of
`ℙ¹_K` whose fixed branch divisor is the section `∞_T`. The pieces are the thickenings of the realized
covers, induced to `G`, and a piece with inertia `S` at the patch through `∞_T`, with boundary
isomorphisms identifying their local extensions at `∞`; every piece is étale over the generic-fibre
points of its patch off `∞_T`. Choose factors containing the identified inertia extensions;
under the boundary isomorphisms their primes have common branch primes as in condition (3).
Constructing these pieces, choices and isomorphisms is part of this target. By
that contract the patched `G`-cover of `ℙ¹_K` is étale over `𝔸¹_K`, connected because the realized
subgroups generate `G`, and geometrically connected because a thickened piece is étale over the
generic point of the closed fibre; specialize it (*Specialization of covers from `k((t))` to `k`*).
If `G(S) ≠ G`, take a `G`-cover of
`ℙ¹` over an algebraic closure of `Frac W(k)` branched at `r + 1` points with `p`-power branching
indices and pairwise noncongruent branch points (Riemann existence in characteristic zero), descend
it to a finite extension, pass to its `G`-equivariant stable model, and find a tail component `ℙ¹_k`
of the special fibre over which the cover is a `G`-cover branched at one point only. The equivariant
stable model of the cover and the analysis of its tails are part of this target. Source:
[Harbater–Obus–Pries–Stevenson](https://arxiv.org/pdf/1408.0859v1), Theorems 3.8 and 3.11 with
their sketches and Remarks 3.9–3.12, PDF pp. 11–12 (Raynaud's theorem). *Needs:* *Serre's solvable
step on the affine line*, *Patching covers with a fixed branch divisor*, *Specialization of covers
from `k((t))` to `k`*; Layer IG.1 *Tame and prime-to-`p` fundamental quotients* (Abhyankar's
lemma), Layer IG.1 *Invariance under algebraically closed base extension in characteristic zero*,
Layer IG.3 *Realizing generating sphere tuples*; StableReduction Layer 7 (semistable reduction of
curves); SchemeAndStackFoundations Layers 1, 3 and 4.

**Checks.**

- `PSL₂(𝔽_p)` is generated by its elements of order `p`, hence quasi-`p`, and lies in `π_A(𝔸¹_k)`.
- In characteristic two `S₃` is generated by its transpositions and lies in `π_A(𝔸¹_k)`; in
  characteristic three it is not quasi-`3`, since `S₃/A₃ ≅ C₂` has order prime to `3`, and it is not
  a Galois group over `𝔸¹_k`.
- A nontrivial `p`-group is its own nontrivial normal `p`-subgroup, so it is handled by the solvable
  step before the case distinction; the distinction itself depends only on `G`, since `G(S)` depends
  on `S` only up to conjugacy.

**Harbater's theorem for the punctured line.** Let `k` be algebraically closed of characteristic
`p > 0` and `G` a finite group with `G/p(G)` cyclic (necessarily of order prime to `p`). Then
`G ∈ π_A(𝔸¹_k − {0})`, by a cover tamely ramified over `0`. The affine-line case enters as an input:
Raynaud's theorem is used for `p(G)` before the punctured line is treated. *Proof sketch.* Reduce by
group theory to `G = p(G) ⋊ C` with `C` cyclic of order prime to `p`, and fix a Sylow `p`-subgroup `P`
normalized by `C`. Over `K = k((t))`, build a `P ⋊ C`-cover of `𝔸¹_K − {0}`, starting from `y^{|C|} = x`
and extending by a strengthening of *Serre's solvable step on the affine line* with prescribed
completed-local behaviour at finitely many `K`-points (part of this target). By *Raynaud's theorem for
the affine line*, Abhyankar's lemma and deformation of covers, build a `p(G)`-cover of `𝔸¹_k` with
inertia `P` at `∞`, and take its completion at a point over `∞`. Patch the two along that local
extension with *Patching covers with a fixed branch divisor* on `ℙ¹_T`, `T = k[[t]]`, whose fixed
branch divisor is the pair of sections `0_T` and `∞_T`. The pieces are the `P ⋊ C`-cover and the
thickened `p(G)`-cover, both induced to `G`, with the boundary isomorphism identifying the completion
of the latter at `∞` with the local extension of the former at the chosen `K`-point; every piece is
étale over the generic-fibre points of its patch off `0_T` and `∞_T`. The choice of patches and of
this isomorphism, with selected factor primes contracting from a common branch prime, is part of
this target. By that contract the patched `G`-cover is étale over
`𝔸¹_K − {0}`, tame over `0`, connected because `p(G)` and `P ⋊ C` generate `G`, and geometrically
connected because the thickened piece is étale over the generic point of the closed fibre. Specialize
with *Specialization of covers from `k((t))` to `k`*. Source:
[Harbater–Obus–Pries–Stevenson](https://arxiv.org/pdf/1408.0859v1), Theorem 3.13 with its sketch and
Remark 3.14, PDF pp. 12–13 (Harbater's theorem). *Needs:* *Raynaud's theorem for the affine line*,
*Serre's solvable step on the affine line*, *Patching covers with a fixed branch divisor*,
*Specialization of covers from `k((t))` to `k`*; Layer IG.1 *Tame and prime-to-`p` fundamental
quotients*; SchemeAndStackFoundations Layer 4 (deformations of covers).

**Checks.**

- For `G = C_m` with `p ∤ m`, the Kummer cover `y^m = x` realizes it, tamely ramified over `0`.
- The cyclic hypothesis is needed: for a prime `ℓ ≠ p`, `(ℤ/ℓ)²` has `G/p(G) = G` not cyclic, and
  the prime-to-`p` fundamental group of `𝔾_m` is procyclic, so `(ℤ/ℓ)²` is not a Galois group over
  `𝔸¹_k − {0}`.
- A quasi-`p` group has `G/p(G) = 1`; its cover of `𝔸¹_k` from Raynaud's theorem restricts to a
  connected cover of `𝔸¹_k − {0}`, consistently with the statement.

**Abhyankar affine-curve realization.** Let `k` be an algebraically closed field of characteristic
`p > 0`, `C/k` a smooth connected proper curve of genus `g`, and `D ⊂ C` a set of `r ≥ 1` points. A
finite group `G` is a quotient of `π₁^ét(C − D)` if and only if `G/p(G)` is generated by at most
`2g + r − 1` elements, where `p(G)` is the normal subgroup generated by the `p`-subgroups of `G`.
For `C − D = A¹` this says that `G` is a quasi-`p` group, `G = p(G)`, which is *Raynaud's theorem for
the affine line*. The hypotheses `r ≥ 1` and `k` algebraically closed are kept. This is a theorem on
wild covers of affine curves; it is not a realization theorem over finite fields or number fields.
*Proof sketch.* Necessity uses the maximal prime-to-`p` quotient, which is the prime-to-`p`
completion of a free group on `2g + r − 1` generators. For sufficiency, reduce by group theory to
`G = p(G) ⋊ Ḡ` with `Ḡ` of order prime to `p` generated by `2g + r − 1` elements, and realize `Ḡ` by a
tame cover `f` of `U = C − D` (SGA 1, Exposé XIII, Corollary 2.12). Let `C₀` be the cyclic inertia
group of `f` at a chosen point `ξ` above a point of `D`, allowing `C₀ = 1`, and put
`H = ⟨p(G), C₀⟩`, reduced to a semidirect product. If `C₀ = 1`, use *Raynaud's theorem for the
affine line* to realize `H = p(G)` and restrict the cover to `𝔸¹_K − {0}`, `K = k((t))`:
it is étale at `0`, with split completed-local fibre there. If `C₀ ≠ 1`, use *Harbater's theorem
for the punctured line* with the prescribed tame inertia `C₀` at `0`. Patch the constant thickening of `f` with it at `ξ` with
*Patching covers with a fixed branch divisor* on `C_T`, `T = k[[t]]`, whose fixed branch divisor is
the union of the constant sections through the points of `D`, so that the tame ramification at `0`
matches that of `f` at `ξ`, with the split local pieces matched when `C₀ = 1`, and all branch
points remain in `D`: the boundary isomorphism at the image of `ξ`
identifies the inertia extensions, and every piece is étale over the generic-fibre points of its
patch off those sections. The selected factors have a common branch prime via the identified
inertia extension, also when it is split. By that contract the result is a `G`-cover of `C_K` étale over `U_K`,
connected since `H` and `Ḡ` generate `G`, and geometrically connected since the thickening of `f` is
étale over the generic point of the closed fibre. Specialize with *Specialization of covers from
`k((t))` to `k`*. The group-theoretic reductions, the matching of inertia at `ξ`, the choice of patches
and the boundary isomorphism are part of this target. Sources:
[Harbater–Obus–Pries–Stevenson](https://arxiv.org/pdf/1408.0859v1), Conjecture 3.2 (now a theorem),
p. 8, and §3.3, the sketch of the general case, PDF p. 13; [SGA 1](https://arxiv.org/pdf/math/0206203v2),
Exposé XIII, Corollary 2.12, p. 290. *Needs:* *Harbater's theorem for the punctured line*, *Raynaud's
theorem for the affine line*, *Patching covers with a fixed branch divisor*,
*Specialization of covers from `k((t))` to `k`*, *Field patching for curves over a complete DVR*,
Layer IG.1 *Tame and prime-to-`p` fundamental quotients*; Supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

*Lean:* `abhyankar_affine_curve` states the equivalent function-field criterion on Tau Ceti places,
genus and ramification indices, with `pGenerated` the normal subgroup generated by elements of
prime-power order for the characteristic prime.

**Checks.**

- For an elliptic curve `C` and `D = {O}`, take `G = C_p × C_ℓ²`, `ℓ ≠ p`. The prime-to-`p`
  quotient is realized by the everywhere étale cover `[ℓ] : C → C`, with trivial inertia over
  `O`; patching uses the affine-line realization of `C_p` and its split local piece at `0`.
- For `A¹` in characteristic `p` the condition is that `G` be generated by its `p`-subgroups: the
  Artin–Schreier cover `y^p − y = x^m`, `m` prime to `p`, realizes `ℤ/p`, while `ℤ/ℓ` for a prime
  `ℓ ≠ p` is not a quotient of `π₁^ét(A¹)`. (The example in HOPS §3.2.1, PDF p. 9 of v1, is printed
  with `x^{−m}`, which has a pole at `0` and is not étale over `A¹`; the étale cover has `x^m`.)
- For a curve of genus `g` minus `r ≥ 1` points, `G/p(G)` needs at most `2g + r − 1` generators.
- `r ≥ 1` cannot be dropped: `P¹` has no nontrivial connected finite étale cover, although `ℤ/p` is
  quasi-`p`.

### Examples

- **Two points.** `PConf_2(A¹) ≅ G_m × G_a` by `(p_1, p_2) ↦ (p_2 − p_1, p_1)` (here
  `M_{0,3} = Spec ℤ`), and `X_2 = P¹ × P¹`. Over `ℂ`, `PConf_2(ℂ) ≃ S¹`, `Conf_2(ℂ) ≃ S¹`, and the
  quotient map is the squaring map on `ℂ^×` up to homotopy, matching `TauCeti.BraidGroup 2 ≅ ℤ` and
  the image of `sigma 0` under `permHom`.
- **Simple covers of degree three.** For `G = S₃`, `c` the transpositions and `n = 4`, the character
  formula gives `(3⁴/6)(1 + 1 + 0) = 27` product-one tuples in `c^4`, the trivial, sign and
  two-dimensional characters contributing `1`, `1` and `0`. Removing the `3` constant tuples leaves
  `24` generating ones, the fibre of the marked Hurwitz scheme over a configuration; `S₃` acts
  freely, so the unmarked fibre has `4` points. By Riemann–Hurwitz the `S₃`-Galois covers have genus
  `1` and their degree-three quotients `C/C₂ → P¹` have genus `0`. The piece of the marked scheme
  with all inertia in `c` has rank `24` over `Conf_4`, so by
  *Component bound from finite étale degree* each of its geometric fibres has at most `24`
  components.
- **The group of order two.** For `G = C₂` and `c` its involution, `U(C₂, c) ≅ ℤ` and the reduced
  multiplier is trivial, so every power equation has exactly one solution and `d(q) = 1`. The only
  multiplicity vector of total `n` is `(n)`, with trivial abelianized degree exactly for `n` even;
  hence `b(C₂, c, q, n) = 1` for even `n` and `0` for odd `n`, matching the single marked
  hyperelliptic family `y² = ∏(x − a_i)` with `∞` unramified for even `n`.
- **Point counts.** `#A^n(𝔽_q) = q^n` and `#G_m(𝔽_q) = q − 1` are recovered from compactly supported
  cohomology with geometric Frobenius; the leading term `q^n` of the point estimate is the top class
  `ℚ_ℓ(−n)` of a geometrically connected component.
- **Genus one.** For `n = 3`, the lifted affine group `Ã_3` acts on `PConf_3(A¹)` through `Aff`,
  which acts freely with quotient `M_{0,4} = P¹ − {0, 1, ∞}` via `λ = (a_3 − a_1)/(a_2 − a_1)`,
  while the kernel `{(1, 0, ±1)} ≅ μ₂` acts trivially. So `[PConf_3(A¹)/Ã_3]` is a `μ₂`-gerbe over
  the `λ`-line, and the Legendre family `y² = x(x − 1)(x − λ)` is an object over it.
- **Abhyankar for the line.** In characteristic `p`, `PSL₂(𝔽_p)` is generated by its elements of
  order `p`, hence is quasi-`p` and a quotient of `π₁^ét(A¹_k)`; no nontrivial group of order prime
  to `p` is.

### Dependencies

This layer uses Layer IG.0 (finite Galois algebras), Layer IG.1 (tame and prime-to-`p` quotients,
tangential fibres and invariance under algebraically closed base extension),
EtaleCohomologyFoundations §F.0.A2 (the arithmetic sequence),
Layer IG.3 (the Hurwitz braid action, the braid-orbit monoid, realization of
sphere tuples, Riemann existence for punctured curves, finitely many bounded-degree covers, the
braid lifting invariant with its stable classification and Tate twist, coprime semidirect products,
the discrete action of units and the cyclotomic twist) and Layer IG.4 (admissible `Γ`-groups,
marked extensions and the marked extension count). From Mathlib it uses `FreeGroup` and the subtype
and quotient topologies; from Tau Ceti, `TauCeti.BraidGroup` with `sigma`, `permHom` and
`pureSubgroup`. From other roadmaps it uses SchemeAndStackFoundations Layers 0–4 (stacks, descent,
curves, stable pointed curves, deformations), ComplexComparisonPartII §§C−1.2, C1.9 and
ComplexComparisonPartII §C3.3 for proper algebraic-space GAGA, EnhancedDerivedSheaves §0.3 /
`ClassicalDerived.inverseLimits` for derived inverse limits and the Mittag–Leffler criterion, EtaleCohomologyFoundations §§F.5–F.6 /
`VanishingCycles.etaleVerdierDuality`, `VanishingCycles.smoothPurity`
for Poincaré duality and the trace map, StableReduction Layer 7 for semistable reduction of curves,
and ProfiniteCohomology Layers 1, 5 and 10 with ProfiniteProPGroups Layer 5, Tau Ceti's
`TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero` and
ArithmeticGaloisRepresentations Layer 3 (Swan conductors) for the solvable step of Abhyankar's
conjecture, with AlgebraicCurves Layer 8 (lower ramification groups of places) for the Euler
characteristic of local systems on curves. Supplied by EtaleCohomologyFoundations §§F.0–F.4 /
`VanishingCycles.finiteEtaleGaloisCategory`, `VanishingCycles.etaleBaseChange`,
`VanishingCycles.etaleCompactSupports`, `VanishingCycles.compactSupportCohomology`,
`VanishingCycles.compactSupportFiniteness`, `VanishingCycles.adicRealization`
for finite covers and invertible-coefficient geometric cohomology on the domains in the supplier
contracts above, retaining the tame-boundary argument and chosen transport.
Supplied by EtaleCohomologyFoundations §§0.7–0.8 / `ClassicalAlgebraic.supportLocalization`,
`ClassicalAlgebraic.properSupports`
for étale module localization and compactification-defined `D⁺` torsion lower shriek.
Supplied by ComplexComparisonPartII §§C6.2–C6.6 / `riemannExistence`, `artinComparison`,
`artinComparisonCompactSupport`, `relativeArtinComparison`, `adicArtinComparison`
for finite-type complex comparison, with separatedness for compact support and uniformly bounded
normalized ctf systems for the adic passage.
Supplied by EtaleCohomologyFoundations §§F.10.1–F.10.2b / `VanishingCycles.frobeniusFixedPoints`,
`VanishingCycles.frobeniusCohomology`; §§IG.0.T1–IG.0.T4 /
`VanishingCycles.curveEndomorphismTrace`, `VanishingCycles.etaleTraceFormulaFinite`,
`VanishingCycles.etaleTraceFormula`, `VanishingCycles.pointCountTrace`
for finite-field descent and compact-support geometric-Frobenius traces, with invertible
coefficients and perfect-complex finite-level traces. It also uses BelyiMaps Layers 12 and 13 for
tame inertia and peripheral conventions. Deligne's
weight bound is not used as a theorem: it is an explicit hypothesis of
*Fixed-degree uniform Hurwitz point estimate*.

## Layer IG.6: realizations and the inverse Galois problem

This layer turns the constructions of the roadmap into realizations of finite groups as Galois
groups. It defines field and polynomial realizations on Mathlib's Galois theory, packages
the specializations of Layer IG.2 as such realizations, proves worked realizations of cyclic groups
and of the dihedral group of order eight, converts the symmetric-group polynomials of
PolynomialGaloisGroups Layer 9 into realizations, and fixes how the arithmetic conventions of
BelyiMaps Layer 12 are transported to those of this roadmap. It ends with the inverse Galois problem
and its regular version as named open propositions, the proved implication from a regular
realization to a realization over `ℚ`, the index of proved families with their base fields, and
generic polynomials.

Conventions particular to this layer. Galois groups are Mathlib's: `Gal(L/K)` is `L ≃ₐ[K] L` and the
Galois group of a polynomial is `Polynomial.Gal f`, the automorphisms of `f.SplittingField`. The
dihedral group of order `8` is Mathlib's `DihedralGroup 4`. The cyclotomic character is normalized
by `σ(ζ) = ζ^{χ(σ)}`, and products of permutations compose from right to left, as in Mathlib. An
open problem appears as a named proposition. Realization theorems use individual realizations;
`inverseGaloisProblem_of_regular` states the logical implication between the two propositions.

### IG.6.1 Realizations

**Field and polynomial realizations.** For fields `K` and `L` with `[Algebra K L]` and a
finite group `G`, define the structure of a field realization of `G` by `L/K`:
`FiniteDimensional K L`, `IsGalois K L`, and a group isomorphism `Gal(L/K) ≃* G`. For `f ∈ K[Y]`,
define a polynomial realization of `G` by `f`: separability of `f` and a group isomorphism
`Gal(f.SplittingField/K) ≃* G`. Irreducibility of `f` is an additional predicate and is not part of
the realization. Refinements record more data on top of a realization: an explicit extension carries
its generators and relations, and an explicit cover carries its finite map and the comparison of its
generic fibre with the function field. A field realization carries its isomorphism
`Gal(L/K) ≃* G`. Prove that `[L : K] = |G|`, from `IsGalois.card_aut_eq_finrank`; that
the splitting field of a separable polynomial carries the field
realization, by `IsGalois.of_separable_splitting_field`; and that a
`K`-algebra isomorphism `L ≃ₐ[K] L′` transports the realization and its group isomorphism.
Everything is stated with Mathlib's `Field`, `Algebra`, `FiniteDimensional`, `IsGalois`, `AlgEquiv`
and `Polynomial.SplittingField`, and a separable reducible polynomial realization is kept distinct
from an irreducible primitive presentation: a realization is a Galois extension with its exact
group, not a polynomial of a given degree
(Serre, *Topics in Galois Theory*,
§1.1, pp. 1–2; §3.3, pp. 23–25). *Needs:* Mathlib `IsGalois`, `Polynomial.SplittingField`,
`Polynomial.Gal`, `IsGalois.card_aut_eq_finrank`, `IsGalois.of_separable_splitting_field`.

**Checks.**

- `K/K` carries the realization for the trivial group, with `[K : K] = 1`; a nonzero constant
  polynomial is separable with splitting field `K` and realizes the trivial group, while the zero
  polynomial is not separable and realizes no group.
- Over `ℚ`, `(Y² − 2)(Y² − 3)` is separable with splitting field `ℚ(√2, √3)` and group `C₂ × C₂`, so
  it is a polynomial realization for `C₂ × C₂` although it is reducible; a definition requiring
  irreducibility would reject it.
- `ℚ(∛2)/ℚ` has degree `3` but is not Galois (the other two cube roots of `2` are not real), so it
  realizes no group, in particular not `C₃`; a definition by degree alone would accept it.

**Specialization with its realization data.** Let `K` be a Hilbertian field of characteristic zero
and `G` a finite group, and let a regular finite `G`-cover of `P¹_K` with its guarded integral model
be given as in Layer IG.2 *Full-group specialization of regular covers*, which is stated for exactly
these fields. At a rational point `t ∈ K` of the Hilbert set of that theorem, provide the connected
finite étale fibre, its `G`-action, its field `L_t` and the isomorphism `Gal(L_t/K) ≃* G`, as a field
realization. The conversion at a given `t` whose fibre is connected is algebraic and
needs no Hilbertian hypothesis; the hypothesis is used only to guarantee that such `t` exist. For a
polynomial model,
provide the coefficientwise specialization at `t`, the nonvanishing at `t` of the denominator
product and the leading-coefficient numerator from
Layer IG.2 *A polynomial guard for regular specialization*. In addition to that coefficient-and-degree
guard, impose the nonvanishing specialized discriminant. Provide the degree and separability of the
specialized polynomial, and the comparison of its splitting field with `L_t`. Preservation of the
full group comes from the Hilbert and full-monodromy theorem, not from the coefficient guard alone.
Local conditions at finitely many places and linear disjointness from a given extension `M` are
provided only when `K` is a number field, under the hypotheses of Layer IG.2 *Hilbert specialization
with local conditions*, respectively Layer IG.2 *Infinitely many linearly disjoint full-group
fibers*; they are not extended to other Hilbertian fields. Construct
the extension `L_t/K` with its finite Galois structure and group
isomorphism, and the specialized polynomial with its guarded degree
and separability; prove that the root map of the integral model identifies the
splitting field of the specialized polynomial with `L_t`, and that `L_t ∩ M = K` under the
disjointness hypothesis. The proof applies coefficient
specialization with its guard; obtains the group isomorphism from connectedness of Hilbert fibres
and the torsor criterion; and transports through the integral model of a generic root, keeping the
local and disjointness witnesses. Sources:
[Dèbes, *Arithmétique des revêtements de la droite*](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf),
Proposition 5.2.5, printed p. 137, and §5.2.4, Proposition 5.2.14 and Remark 5.2.15, pp. 143–144
(the full group through a primitive element, the denominators of its conjugates and the
discriminant);
Serre, *Topics in Galois Theory*,
Propositions 3.3.1 and 3.3.3 and Corollary 3.3.4, pp. 23–24 (connected regular specializations and
disjointness). *Needs:* *Field and polynomial realizations*,
Layer IG.2 *Full-group specialization of regular covers*,
Layer IG.2 *Hilbert subsets and Hilbertian fields*,
Layer IG.2 *A polynomial guard for regular specialization*,
Layer IG.2 *Infinitely many linearly disjoint full-group fibers*,
Layer IG.2 *Hilbert specialization with local conditions*.

*Lean:* `HasRegularRealization.exists_realization` states the existence of a finite Galois
realization over a characteristic-zero Hilbertian field from a regular realization.

**Checks.**

- `Y² − T` over `ℚ(T)` specialized at a prime `t = p` gives `ℚ(√p)` with its `C₂` realization.
- At `t = 4` the guards hold (the discriminant `4t = 16` is nonzero) but `Y² − 4 = (Y − 2)(Y + 2)`
  splits: `4` is outside the Hilbert set, so the guard alone does not give the group; at `t = 0` the
  coefficient-and-degree guard still holds, but the additional discriminant condition fails.
- A coefficient `1/(T − 1)` has no value at `t = 1`; the regular coefficient map is not defined
  there and the guard excludes it.

### IG.6.2 Worked realizations

**Cyclic realization examples.** Provide realizations, with exact degree, separability, normality and group
isomorphism: `ℚ(√p)/ℚ` for a prime `p`, by the polynomial `Y² − p` and `C₂`; the irreducible
polynomial `Y³ − 3Y + 1`, of discriminant `81 = 9²`, with `C₃`; and the cyclotomic polynomial
`Φ₅(Y) = Y⁴ + Y³ + Y² + Y + 1` with `C₄`, generated by `ζ₅ ↦ ζ₅²`. Arbitrary finite cyclic groups
are not inferred from these examples; they are realized by the abelian case of class field theory or
by Layer IG.4 *Shafarevich solvable realization*. For the quadratic, `Y² − p` is Eisenstein at `p`
and both roots lie in `ℚ(√p)`. For the cubic, the rational-root test gives irreducibility, the
discriminant is a nonzero square, and the transitive subgroup of `S₃` with square discriminant is
`A₃ ≅ C₃` (PolynomialGaloisGroups Layers 2–3). For `Φ₅`, irreducibility of cyclotomic polynomials,
the basis of powers of a primitive fifth root of unity, and `Gal ≅ (ℤ/5ℤ)^×`, generated by `2`, give
the cyclic group of order four
(Serre, *Topics in Galois Theory*,
§§1.1–1.2, printed pp. 1–4). The two Galois groups are already computed, by transitive-group label,
in the Tau Ceti library: `TauCeti.hasGaloisLabel_X_pow_three_sub_three_mul_X_sub_one` (label
`3T1` for `X³ − 3X − 1`; substituting `Y = −X` turns `Y³ − 3Y + 1` into `−(X³ − 3X − 1)`, so the
two cubics have the same splitting field) and
`TauCeti.hasGaloisLabel_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one` (label `4T1` for `Φ₅`).
What this target adds to them is the realization with its explicit group isomorphism.
*Needs:* *Field and polynomial realizations*, Layer IG.4 *Shafarevich solvable
realization*; PolynomialGaloisGroups Layer 2, PolynomialGaloisGroups Layer 3, ClassFieldTheory
Layer 10, ClassFieldTheory Layer 12; Tau Ceti `TauCeti.hasGaloisLabel_X_pow_three_sub_three_mul_X_sub_one`,
`TauCeti.hasGaloisLabel_X_pow_four_add_X_pow_three_add_X_sq_add_X_add_one`.

**Checks.**

- `Y³ − 3Y + 1` has no rational root (its values at `±1` are `−1` and `3`) and discriminant
  `−4(−3)³ − 27 = 81`; `Φ₅` has degree `4` and cyclic Galois group, `2` having order `4` modulo `5`.
- The discriminant test discriminates: `Y³ − 2` is irreducible with discriminant `−108`, not a
  square, and its group is `S₃`, not `C₃`.

**A degree-eight dihedral realization.** Let `α = 2^{1/4} ∈ ℝ` and `L = ℚ(α, i) ⊂ ℂ`, Mathlib's
`IntermediateField.adjoin ℚ {α, i}`. `Y⁴ − 2` is Eisenstein at `2`, so `[ℚ(α) : ℚ] = 4`; `ℚ(α)` is
real and does not contain `i`, so `[L : ℚ] = 8`. The four roots `α, iα, −α, −iα` lie in `L` and are
distinct, so `L` is the splitting field of `Y⁴ − 2` and is Galois over `ℚ`. Define `r` by
`r(α) = iα`, `r(i) = i`, and `s` by `s(α) = α`, `s(i) = −i` (complex conjugation). Then
`r⁴ = s² = 1` and `srs = r⁻¹`, and the eight normal forms `r^j s^e` (`0 ≤ j < 4`, `e ∈ {0, 1}`) are
all the automorphisms, so `Gal(L/ℚ)` is the dihedral group of order `8`, Mathlib's
`DihedralGroup 4`. The convention is explicit: sources call this group `D₄` or `D₈`, and Mathlib
indexes it by `4`. Prove that `α⁴ = 2` and `α` lies in the real subfield, that
the assignment defines the automorphism `r` of order four, that
complex conjugation is `s` and satisfies `srs = r⁻¹` and that
the normal forms give the isomorphism with `DihedralGroup 4` and the
polynomial realization for `Y⁴ − 2`. The proof builds `L` as an intermediate field in the tower
`ℚ ⊂ ℚ(α) ⊂ L ⊂ ℂ`, extends the root assignments to algebra automorphisms using the basis of degree
eight, verifies the dihedral relations on `α` and `i`, and shows that the eight normal forms are
distinct. The example is the dihedral one of
Serre, *Topics in Galois Theory*,
§1.2, p. 2. The Galois group of `X⁴ − 2` is already computed in the Tau Ceti library, by
transitive-group label (`TauCeti.hasGaloisLabel_X_pow_four_sub_two`, label `4T3`) and order
(`TauCeti.natCard_gal_X_pow_four_sub_two`, order `8`); this target adds the explicit generators `r`
and `s`, the isomorphism with Mathlib's `DihedralGroup 4` and the realization inside `ℂ`. *Needs:*
*Field and polynomial realizations*; Mathlib `IntermediateField`,
`IntermediateField.adjoin`, `DihedralGroup`; PolynomialGaloisGroups Layer 2,
PolynomialGaloisGroups Layer 3; Tau Ceti `TauCeti.hasGaloisLabel_X_pow_four_sub_two`,
`TauCeti.natCard_gal_X_pow_four_sub_two`.

**Checks.**

- `[L : ℚ] = 8`, not `4`: the splitting field is strictly larger than the stem field `ℚ(α)`.
- `r²(α) = −α` and `r²(i) = i`, so `r² ≠ 1` and `r` has order `4`.
- `sr(α) = s(iα) = −iα` while `rs(α) = r(α) = iα`, so the group is not abelian; replacing
  `DihedralGroup 4` by `C₄ × C₂` fails.

**Symmetric groups as realizations.** For every `n ≥ 1`, PolynomialGaloisGroups Layer 9
provides an explicit monic `f_n ∈ ℤ[X]` of degree `n`, irreducible over `ℚ`, satisfying its
predicate `HasFullSymmetricGaloisGroup`: the polynomial is separable and the action `galActionHom`
of its Galois group on the root set in the splitting field is surjective; in the Tau Ceti
library these are `Polynomial.HasFullSymmetricGaloisGroup` and
`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`. This target is only the
comparison with the realizations of this roadmap: for every `f` of degree `n` over `ℚ` with
`HasFullSymmetricGaloisGroup f`, Tau Ceti's `Polynomial.HasFullSymmetricGaloisGroup.nonempty_mulEquiv`
gives an isomorphism `Gal(f.SplittingField/ℚ) ≃* Equiv.Perm (Fin n)`, and with the separability in
the predicate this is a polynomial realization of `Equiv.Perm (Fin n)` by `f`. The construction of `f_n` — its reductions modulo
`2`, `3` and `5`, the Chinese remainder step and the separate small degrees — stays in
PolynomialGaloisGroups Layer 9 and is not repeated here, and the alternating examples of that layer
(degrees `3`, `4`, `5` only) are not claimed to realize every alternating group. The proof
transports the isomorphism of `Polynomial.HasFullSymmetricGaloisGroup.nonempty_mulEquiv` (which
combines the injectivity of `galActionHom`, Mathlib `Polynomial.Gal.galActionHom_injective`, the
surjectivity in the predicate and an enumeration `rootSet f ≃ Fin n`) into the realization. The symmetric
family is that of
Serre, *Topics in Galois Theory*,
§4.4, printed pp. 40–42. *Needs:* *Field and polynomial realizations*;
PolynomialGaloisGroups Layer 9; Mathlib `Polynomial.Gal.galActionHom`; Tau Ceti
`Polynomial.HasFullSymmetricGaloisGroup.nonempty_mulEquiv`,
`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`.

**Checks.**

- For `n = 1` the realized group `Equiv.Perm (Fin 1)` is trivial; for `n = 2` it is `C₂`.
- The predicate includes separability: `X²` has a bijection from its trivial Galois group onto the
  permutations of its one-element root set, but it is not separable and gives no `S₂` realization.
- The predicate includes surjectivity: `X³ − 3X + 1` is separable and irreducible with group
  `C₃ ⊊ S₃` (*Cyclic realization examples*), so it gives no `S₃` realization.

### IG.6.3 Dessins and the Belyi conventions

**Transport of the Belyi conventions.** BelyiMaps Layer 12 (milestones 12.4–12.12) provides the
outer action of `Gal(ℚ̄/ℚ)` on the fundamental group of the thrice-punctured line, its inertia
classes and the branch-cycle theorem, and BelyiMaps milestones 2.4, 6.3, 8.6 and 9.8 the
correspondence between permutation triples of degree `d`, dessins and Belyi pairs. This target
transports them to the conventions of this roadmap. First,
positive local inertia and arithmetic conjugation, `σ̃γσ̃⁻¹ = γ^{χ(σ)}`, use the cyclotomic
character normalized by `σ(ζ) = ζ^{χ(σ)}`; a convention in which covers are pulled back by a right
action uses `χ(σ)⁻¹`. Second, the triples `(τ0, τ1, τinf)` of BelyiMaps satisfy
`τinf · τ1 · τ0 = 1`, and the transport to this roadmap's relation `g₁g₂g₃ = 1` reverses the order,
`(g₁, g₂, g₃) = (τinf, τ1, τ0)` with the branch points `∞, 1, 0` in that order, stated as an
explicit lemma. Third, the degree `d` of a dessin and the exponent `e` of its monodromy group are
separate parameters, and `χ(σ)` acts through its residue modulo `e`. Fourth, the branch-cycle
classes form a passport, which does not determine a dessin. Fifth, equivalence of `G`-covers and of
ordinary covers, and field of moduli and field of definition, are kept separate. The proof
transports the fibre and loop conventions along the maps of BelyiMaps Layer 12; computes the
cyclotomic exponent on the Kummer tower `t^{1/m}` and checks it in each action convention; and
reuses the triple correspondence with the order reversal and the conjugacy transport made explicit.
Sources: [SGA 1](https://arxiv.org/pdf/math/0206203v2), Exposé XIII Corollary 2.12, p. 290 (tame
inertia and its relation, with the prime-to-`p` restriction);
Serre, *Topics in Galois
Theory*,
§7.1, pp. 65–66 (rational classes), and §8.1, pp. 81–83 (the branch-cycle argument in the proof
of Theorem 8.1.1). *Needs:*
Layer IG.1 *Tame tangential fibres at a boundary point*,
Layer IG.3 *Tate-twisted arithmetic lifting invariants*; Supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`,
BelyiMaps milestones 2.4, 6.3, 8.6 and 9.8, BelyiMaps Layer 12, BelyiMaps Layer 13.
Finite lisse coefficients require no invertibility; based `π₁` and paths use connected nonempty
locally Noetherian schemes or the componentwise groupoid.

**Checks.**

- For `σ` with `χ(σ) ≡ 2 mod 5` and the Kummer automorphism `γ(t^{1/5}) = ζ₅ t^{1/5}`, the positive
  convention gives `σ̃γσ̃⁻¹ = γ²` and the right-action convention gives `γ³ = γ^{2⁻¹ mod 5}`; the
  two differ.
- Complex conjugation has `χ = −1 = (−1)⁻¹`, so on its own it cannot distinguish the two
  conventions.
- The BelyiMaps triple `(τ0, τ1, τinf) = ((0 1 2), (0 1), (1 2))` satisfies `τinf τ1 τ0 = 1`, while
  `τ0 τ1 τinf` sends `0 ↦ 2`; the reversed triple `((1 2), (0 1), (0 1 2))` satisfies `g₁g₂g₃ = 1`,
  so the reversal cannot be omitted.

### IG.6.4 The inverse Galois frontier

**The inverse Galois frontier.** Define two propositions. `IGP(ℚ)`: every finite group `G` has a
field realization over `ℚ`, that is, a finite Galois extension `L/ℚ` with
`Gal(L/ℚ) ≃* G`. `RIGP(ℚ)`: every finite group `G` has a finite Galois extension `L` of `ℚ(T)` with
`Gal(L/ℚ(T)) ≃* G` that is regular, `ℚ` being algebraically closed in `L`. Both are open problems;
they appear as named propositions. Realization theorems require individual regular realizations;
`inverseGaloisProblem_of_regular` states `RIGP(ℚ) → IGP(ℚ)`. Prove, for each finite group `G`: a
regular realization of `G` over `ℚ(T)` gives a field
realization of `G` over `ℚ`, by *Specialization with its realization data* at a point of
the Hilbert set. The proved families are indexed with their exact theorems and base fields: finite
solvable groups over every number field (Layer IG.4 *Shafarevich solvable realization*); all
symmetric groups over `ℚ` (*Symmetric groups as realizations*); centreless groups with a
rationally rigid tuple of classes, under the hypotheses of
Layer IG.3 *Rational rigidity*, regularly over `ℚ(T)` and hence over
`ℚ`; and quasi-`p` groups as Galois groups of covers of `A¹` over an algebraically closed field of
characteristic `p` (Layer IG.5 *Abhyankar affine-curve realization*), a statement over a different
base field that gives nothing over `ℚ`. The index is a list of theorems, not a universal statement.
The proof defines the propositions from the realization, adding regularity for `ℚ(T)`; proves the
implication for a given regular realization by guarded Hilbert specialization; and attaches each
family to its theorem and base field
(Serre, *Topics in Galois Theory*,
Introduction and §§3.3, 8.1, pp. 1, 23–25, 81–83). *Needs:*
*Field and polynomial realizations*, *Specialization with its realization data*,
*Symmetric groups as realizations*, Layer IG.4 *Shafarevich solvable realization*,
Layer IG.3 *Rational rigidity*,
Layer IG.5 *Abhyankar affine-curve realization*.

*Lean:* `InverseGaloisProblem`, `RegularInverseGaloisProblem`, `inverseGaloisProblem_of_regular`.

**Checks.**

- `IGP(ℚ)` and `RIGP(ℚ)` are named propositions. The implication `RIGP(ℚ) → IGP(ℚ)` follows
  group by group from individual regular realizations; no open realization result is asserted.
- Solvable groups come from Shafarevich's theorem; symmetric groups come from
  PolynomialGaloisGroups Layer 9 through *Symmetric groups as realizations*.
- The quasi-`p` entry gives no realization over `ℚ`: that `PSL₂(𝔽_p)` is a quotient of `π₁^ét(A¹_k)`
  for `k = F̄_p` is a statement over `k`.

**Generic-polynomial universality.** Let `G` be a finite group and `K` a field. A `G`-generic
polynomial over `K` is a separable polynomial `f` over `K(T₁, …, T_r)` whose splitting field is
regular over `K` with Galois group `G`, together with a specified guard (the denominators of the
coefficients and the discriminant) and the universality property: for every infinite field `L ⊇ K`
and every Galois extension `M/L` with group `G`, there is a parameter `a ∈ L^r` outside the guard
such that `M` is `L`-isomorphic to the splitting field of the specialization `f(a, Y)`. Universality
is stronger than regularity and than preservation of the full group at Hilbert points. The existence
of a `G`-generic polynomial over `K` is a named proposition for each pair `(K, G)`; nothing is
asserted for all finite groups, since existence has obstructions. For `char K ≠ 2`, `Y² − T` is
`C₂`-generic: every quadratic extension of `L` is `L(√a)` for a nonsquare `a ∈ L^×`. Specify the domain of
allowed coefficients and discriminant, and prove that
the generic splitting field has the prescribed group and regular
constants, that every `G`-extension of an infinite overfield is the
splitting field of an allowed specialization and that extending the base
field restricts the quantifier over overfields and transports the polynomial realization. The
definition uses Mathlib's rational-function fields as coefficient fields and the guarded
specialization map, and quantifies over actual overfields and actual finite Galois extensions with
their algebra isomorphisms; for `C₂` it uses the normal form of quadratic extensions, the guard
`T ≠ 0` and the splitting-field isomorphism. The quadratic construction and its distinction from
ordinary specialization are in
Serre, *Topics in Galois Theory*,
§§1.1, 3.3, pp. 1–2, 23–25; the general universality predicate is formulated here. *Needs:*
*Field and polynomial realizations*, *Specialization with its realization data*;
PolynomialGaloisGroups Layer 2, PolynomialGaloisGroups Layer 3.

**Checks.**

- Over a field of characteristic `≠ 2`, `Y² − T` realizes every quadratic extension `L(√a)` of an
  infinite overfield `L`, at the parameter `a`; in characteristic `2` it is not separable and is not
  generic for `C₂`.
- Specializing at a nonzero square `a = b²` gives the split algebra `L × L`: universality does not
  say that every allowed parameter has group `C₂`.
- The constant family `Y² − 2` over `ℚ(T)` has group `C₂`, but its splitting field `ℚ(√2)(T)` is not
  regular over `ℚ` and no specialization gives `ℚ(√3)`: the generic group alone does not give
  universality.
- For `G = 1` the polynomial `Y`, with `r = 0`, is generic: a Galois extension of `L` with trivial
  group is `L` itself.

### Examples

- **Two quadratic fields.** `(Y² − 2)(Y² − 3)` realizes `C₂ × C₂` over `ℚ`, with splitting field
  `ℚ(√2, √3)` of degree `4 = |C₂ × C₂|`, although the polynomial is reducible and no root generates
  the splitting field.
- **A cyclic cubic.** The roots of `Y³ − 3Y + 1` are `2cos(2π/9)`, `2cos(4π/9)`, `2cos(8π/9)`, since
  `(2cos θ)³ − 3(2cos θ) = 2cos 3θ = −1` for `θ = 2π/9`; its splitting field is the real subfield of
  `ℚ(ζ₉)`, with group `(ℤ/9ℤ)^×/{±1} ≅ C₃`, matching the square discriminant `81`.
- **Order eight.** `Y⁴ − 2` realizes `DihedralGroup 4`, with rotation `r : α ↦ iα` and reflection
  the complex conjugation; its stem field `ℚ(2^{1/4})` has degree `4` and is not Galois.
- **Specializing `Y² − T`.** At `t = −1` the specialization gives `ℚ(i)`, at `t = p` it gives
  `ℚ(√p)`, and at `t = 4` it splits; distinct primes give linearly disjoint quadratic fields.
- **`S₃` three ways.** `S₃` is realized over `ℚ` as a solvable group by
  Layer IG.4 *Shafarevich solvable realization*, as `Equiv.Perm (Fin 3)` by
  *Symmetric groups as realizations*, and regularly over `ℚ(T)` from the rigid classes
  (transposition, transposition, `3`-cycle) of Layer IG.3 *A rigid `S₃` cover and its dessin*; the
  three realizations are different data for the same group.

### Dependencies

This layer uses Layer IG.1 (tangential fibres), Layer IG.2 (Hilbert sets, the polynomial guard,
full-group specialization, local conditions and linear disjointness), Layer IG.3 (rational rigidity
and the Tate-twisted lifting invariants), Layer IG.4 (Shafarevich's theorem) and Layer IG.5
(Abhyankar's conjecture for affine curves). From Mathlib it uses `IsGalois`, `Polynomial.Gal`,
`Polynomial.SplittingField`, `Polynomial.Gal.galActionHom`, `IntermediateField.adjoin`,
`DihedralGroup`, `IsGalois.card_aut_eq_finrank` and `IsGalois.of_separable_splitting_field`. From
TauCetiRoadmap it uses PolynomialGaloisGroups Layers 2, 3 and 9, ClassFieldTheory Layers 10 and 12,
and BelyiMaps Layers 12 and 13; finite-cover monodromy is supplied by
EtaleCohomologyFoundations §F.0 / `VanishingCycles.finiteEtaleGaloisCategory`,
with connected nonempty locally Noetherian based `π₁` and no coefficient-invertibility condition.

## Worked examples

- **`S₃` over `ℚ`, three ways.** The rigid triple `((12), (23), (132))` gives a regular
  degree-six `S₃`-Galois cover of `ℙ¹_ℚ`, the Galois closure of the degree-three Belyi map
  `y ↦ (y³ − 3y + 2)/4` with `S₃` monodromy (Layer IG.3); Hilbert irreducibility specializes it to
  infinitely many linearly disjoint `S₃`-extensions of `ℚ` (Layer IG.2); and Shafarevich's theorem
  realizes `S₃` as a solvable group by successive proper embedding problems with abelian kernels
  `C₃` and `C₂` (Layer IG.4). The realizations of Layer IG.6 make the three outputs
  comparable.
- **Quadratic specializations.** For `Y² − T` over `ℚ(T)`, the guard of Layer IG.2 is `1`, every
  rational `t` is regular, and `Y² − t` is irreducible exactly when `t` is not a square; the set of
  bad parameters is the thin set of squares, with `O(N^{1/2})` integral points of height at most `N`.
- **The dihedral group of order eight.** `X⁴ − 2` has splitting field `ℚ(2^{1/4}, i)` of degree
  eight; the automorphisms `2^{1/4} ↦ i·2^{1/4}, i ↦ i` and `2^{1/4} ↦ 2^{1/4}, i ↦ −i` generate
  `D₄` (Layer IG.6).
- **Lifting invariants for `S₃` and transpositions.** `U(S₃, c) = S₃ ×_{C₂} ℤ`; product-one tuples
  of `n` transpositions have invariant `(1, n)`, and for large even `n` the generating ones form a
  single braid orbit, matching the connectedness of the corresponding Hurwitz space of simply
  branched `S₃`-covers (Layers IG.3 and IG.5).
- **A field of moduli that is not a field of definition.** Wewers's `SL₂(𝔽₅)`-cover of `ℙ¹_ℂ` with
  four branch points has field of moduli `ℝ` and no real model, because the two candidate comparison
  elements have order four (Layer IG.3).
- **Grunwald–Wang.** No cyclic extension `L/ℚ` of degree eight has `L ⊗_ℚ ℚ₂` equal to the
  unramified extension of `ℚ₂` of degree eight, although cyclic extensions of `ℚ` of degree eight
  exist (the degree-eight subfield of `ℚ(ζ₁₇)`); local prescriptions at the prime `2` can therefore
  fail for `C₈`, while `Ш¹(ℚ, μ₈) = 0` (Layer IG.4).

## Downstream consumers

The étale path groupoid, tame tangential base points and the arithmetic exact sequence of Layers
IG.0–IG.1 are the starting point of the anabelian and nonabelian Chabauty roadmap
(AnabelianGeometryAndNonabelianChabauty) and of arithmetic dynamics (ArithmeticDynamics). The
integral thin-set count of Layer IG.2 is used by the sieve roadmaps; the finite Hurwitz cohomology and trace
statements of Layers IG.0 and IG.5 by the roadmap on weights; and the lifting invariants and Hurwitz component counts of Layers
IG.3–IG.5 by arithmetic statistics (Cohen–Lenstra and nonabelian Cohen–Lenstra heuristics).

## References

Sources and the editions or versions to which the locators refer.

- B. Bhatt and P. Scholze, *The pro-étale topology for schemes*, Astérisque 369 (2015);
  arXiv:1309.1198v2. <https://arxiv.org/pdf/1309.1198v2>
- C. Breuil, B. Conrad, F. Diamond and R. Taylor, *On the modularity of elliptic curves over `ℚ`:
  wild 3-adic exercises*, J. Amer. Math. Soc. 14 (2001), 843–939; author final copy.
  <https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf>
- A. Caraiani and P. Scholze, *On the generic part of the cohomology of compact unitary Shimura
  varieties*, Ann. of Math. 186 (2017), 649–766.
  <https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf>
- W. Y. Chen, *Nonabelian level structures, Nielsen equivalence, and Markoff triples*,
  arXiv:2011.12940v2 (locators refer to this preprint). <https://arxiv.org/pdf/2011.12940v2>
- B. Conrad, *Lifting global representations with local properties*, author's preprint (locators
  refer to this copy). <https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf>
- P. Dèbes, *Arithmétique des revêtements de la droite*, author's working text (version of
  16 May 2024). <https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf>
- P. Deligne, *La conjecture de Weil. II*, Publ. Math. IHÉS 52 (1980), 137–252.
  <http://www.numdam.org/item/PMIHES_1980__52__137_0/>
- C. Demarche, G. Lucchini Arteche and D. Neftin, *The Grunwald problem and approximation
  properties for homogeneous spaces*, Ann. Inst. Fourier 67 (2017), 1009–1033.
  <https://www.numdam.org/item/10.5802/aif.3104.pdf>
- A. Grothendieck, *Éléments de géométrie algébrique IV, seconde partie*, Publ. Math. IHÉS 24
  (1965). <https://www.numdam.org/item/PMIHES_1965__24__5_0/>
- A. Grothendieck, *Éléments de géométrie algébrique IV, troisième partie*, Publ. Math. IHÉS 28
  (1966). <https://www.numdam.org/item/PMIHES_1966__28__5_0/>
- J. Ellenberg, A. Venkatesh and C. Westerland, *Homological stability for Hurwitz spaces and the
  Cohen–Lenstra conjecture over function fields*, Ann. of Math. 183 (2016), 729–786.
  <https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf>
- J. Ellenberg, A. Venkatesh and C. Westerland, *Homological stability and the Cohen–Lenstra
  conjecture over function fields, II*, arXiv:1212.0923v1, withdrawn; only the
  constructions of §8.2.2 and of the proof of Proposition 8.7.1 are used, none of its counting
  statements. <https://arxiv.org/pdf/1212.0923v1>
- M. Emsalem, *Familles de revêtements de la droite projective*, Bull. Soc. Math. France 123 (1995),
  47–85. <https://www.numdam.org/item/10.24033/bsmf.2250.pdf>
- Z. Gao and P. Habegger, *Heights in families of abelian varieties and the geometric Bogomolov
  conjecture*, arXiv:1801.05762v3. <https://arxiv.org/pdf/1801.05762v3>
- A. Grothendieck and M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*, recomposed
  edition, arXiv:math/0206203v2 (printed page numbers of that edition).
  <https://arxiv.org/pdf/math/0206203v2>
- D. Harbater and J. Hartmann, *Patching over fields*, arXiv:0710.1392v1.
  <https://arxiv.org/pdf/0710.1392v1>
- D. Harbater, A. Obus, R. Pries and K. Stevenson, *Abhyankar's conjectures in Galois theory*,
  arXiv:1408.0859v1. <https://arxiv.org/pdf/1408.0859v1>
- Y. Harpaz and O. Wittenberg, *Zéro-cycles sur les espaces homogènes et problème de Galois
  inverse*, J. Amer. Math. Soc. 33 (2020); arXiv:1802.09605v2. <https://arxiv.org/pdf/1802.09605v2>
- Y. Harpaz and O. Wittenberg, *The Massey vanishing conjecture for number fields*, Duke Math. J.
  172 (2023), 1–41; author final copy. <https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf>
- V. Kanev, *Hurwitz moduli varieties parameterizing pointed covers of an algebraic curve*,
  arXiv:2403.12756v2. <https://arxiv.org/pdf/2403.12756v2>
- K. S. Kedlaya and R. Liu, *Relative `p`-adic Hodge theory: foundations*, Astérisque 371 (2015);
  arXiv:1301.0792v5. <https://arxiv.org/pdf/1301.0792v5>
- A. Landesman and D. Litt, *Canonical representations of surface groups*, arXiv:2205.15352v4.
  <https://arxiv.org/pdf/2205.15352v4>
- G. Lucchini Arteche, *The unramified Brauer group of homogeneous spaces with finite stabilizer*,
  Trans. Amer. Math. Soc. 372 (2019), 5393–5408; arXiv:1709.01170v3.
  <https://arxiv.org/pdf/1709.01170v3>
- Y. Liu, M. M. Wood and D. Zureick-Brown, *A predicted distribution for Galois groups of maximal
  unramified extensions*, arXiv:1907.05002v2 (locators refer to this version).
  <https://arxiv.org/pdf/1907.05002v2>
- D. Masser and U. Zannier, *Abelian varieties isogenous to no Jacobian*, Ann. of Math. 191 (2020),
  635–674. <https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf>
- D. McCullough and M. Wanderley, *Nielsen equivalence of generating pairs of `SL(2, q)`*, Glasgow
  Math. J. 55 (2013), 481–509.
  <https://www.cambridge.org/core/services/aop-cambridge-core/content/view/12B5FCFADCAFE740B31DEE5BB112DB85/S0017089512000675a.pdf/nielsen_equivalence_of_generating_pairs_of_sl2q.pdf>
- A. Merkurjev and F. Scavia, *Galois representations modulo `p` that do not lift modulo `p²`*,
  arXiv:2410.12560v1. <https://arxiv.org/pdf/2410.12560v1>
- B. Poonen, *Rational points on varieties*, Graduate Studies in Math. 186, Amer. Math. Soc., 2017.
  Printed page numbers.
- M. Raynaud, *Caractéristique d'Euler–Poincaré d'un faisceau et cohomologie des variétés
  abéliennes*, Séminaire Bourbaki, exp. 286 (1965), 129–147.
  <http://www.numdam.org/item/SB_1964-1966__9__129_0/>
- M. Romagny and S. Wewers, *Hurwitz spaces*, in *Groupes de Galois arithmétiques et
  différentiels*, Sémin. Congr. 13 (2006), 313–341.
  <https://imag.umontpellier.fr/~romagny/articles/hurwitz_spaces.pdf>
- A. Schmidt and J. Stix, *Anabelian geometry with étale homotopy types*, Ann. of Math. 184 (2016),
  817–868. <https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf>
- A. Schmidt and K. Wingberg, *Šafarevič's theorem on solvable Galois groups*,
  arXiv:math/9809211v1. <https://arxiv.org/pdf/math/9809211v1>
- S. Schröer, *There is no Enriques surface over the integers*, arXiv:2004.07025v3.
  <https://arxiv.org/pdf/2004.07025v3>
- B. Seguin, *Fields of definition of components of Hurwitz spaces*, author's copy.
  <https://beranger-seguin.fr/assets/pdf/articles/fielddef.pdf>
- J.-P. Serre, *Topics in Galois Theory*, second edition, A K Peters, 2008.
- The Stacks project authors, *The Stacks project*, cited by tag. <https://stacks.math.columbia.edu>
- S. Wewers, *Field of moduli and field of definition of Galois covers*, arXiv:math/0108003v1.
  <https://arxiv.org/pdf/math/0108003v1>
- M. M. Wood, *Nonabelian Cohen–Lenstra moments*, Duke Math. J. 168 (2019), 377–427.
  <https://par.nsf.gov/servlets/purl/10152050>
- M. M. Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and Westerland*, Res. Math.
  Sci. 8 (2021); author's copy. <https://abel.math.harvard.edu/~mmwood/Publications/lifting.pdf>

Cited through the sources above, for statements those sources use: M. P. Anderson, *Exactness
properties of profinite completion functors*, Topology 13 (1974) (through Landesman–Litt); E. Artin
and J. Tate, *Class Field Theory*, Chapter X, Theorem 1, and S. Wang, *A counter-example to
Grunwald's theorem*, Ann. of Math. 49 (1948) (through Harpaz–Wittenberg); C. Demarche, *Groupe de
Brauer non ramifié d'espaces homogènes à stabilisateurs finis*, Math. Ann. 346 (2010),
J.-L. Colliot-Thélène, A. Pál and A. N. Skorobogatov, *Pathologies of the Brauer–Manin obstruction*,
Math. Z. 282 (2016), Proposition 6.1(iii), and V. Platonov and A. Rapinchuk, *Algebraic groups and
number theory*, Academic Press, 1994, Theorems 6.6 and 7.8 (through Harpaz–Wittenberg); R. G. Swan,
*Induced representations and projective modules*, Ann. of Math. 71 (1960) (through Raynaud);
M. J. Dunwoody, *Nielsen transformations* (1970), and S. Garion, *Connectivity of
the product replacement algorithm graph of `PSL(2, q)`*, J. Group Theory 11 (2008) (through Chen);
T. Ekedahl's effective Hilbert irreducibility theorem (through Breuil–Conrad–Diamond–Taylor);
M. Fried and M. Jarden, *Field Arithmetic*, third edition, Springer, 2008 (through Schmidt–Stix);
M. Fried and H. Völklein, *The inverse Galois problem and rational points on moduli spaces*, Math.
Ann. 290 (1991), appendix (through Wood); B. Huppert, *Endliche Gruppen I*, Springer, 1967 (through
Schmidt–Wingberg); L. Ribes and P. Zalesskii, *Profinite Groups*, second edition, Theorem 2.3.15
(through Liu–Wood–Zureick-Brown); S. Wewers, *Construction of Hurwitz spaces* (1998), Theorem 4
(through Landesman–Litt); SGA 4, Exposé XI, and SGA 7, Exposé XIII (through Landesman–Litt and
Ellenberg–Venkatesh–Westerland); J.-P. Serre, *Construction de revêtements étales de la droite
affine en caractéristique `p`*, C. R. Acad. Sci. Paris 311 (1990), M. Raynaud, *Revêtements de la
droite affine en caractéristique `p > 0` et conjecture d'Abhyankar*, Invent. Math. 116 (1994), and
D. Harbater, *Abhyankar's conjecture on Galois groups over curves*, Invent. Math. 117 (1994)
(through Harbater–Obus–Pries–Stevenson); SGA 5, Exposé VI (through Kedlaya–Liu).

The rational-function specialization of Layer IG.2 follows the pinned Mathlib `RatFunc` sources:
<https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean>
(`RatFunc.eval` and its laws) and `Mathlib/FieldTheory/RatFunc/Basic.lean` (reduced numerators and
denominators).
