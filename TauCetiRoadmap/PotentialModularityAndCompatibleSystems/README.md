# Roadmap: potential modularity and compatible systems

**Summary.** This roadmap builds the field-selection and compatible-family machinery that turns residual modularity for representations of `G_F` into global lifts and transports modularity between coefficient primes. Its geometric core is Moret–Bailly's integral-point theorem with local splitting, completion and avoidance conditions. Its arithmetic core separates residual modular witnesses, finiteness of a global deformation ring, extraction of a characteristic-zero point, modularity of a given lift and construction of a family through that lift. The resulting interfaces support the Khare–Wintenberger proof of Serre's conjecture and the potential-automorphy arguments that use compatible systems of higher rank. The auxiliary modularity is proved through Skinner–Wiles level adjustment, Taylor's crystalline lifting theorem and soluble descent, and the ordinary finiteness applications rest on a rank-two ordinary patching and weight-algebra finiteness on definite unitary groups developed in Layer 8.

The generic family objects and their operations are developed independently of potential modularity. They contain actual continuous semisimple representations at coefficient places, common Frobenius polynomials and labeled Hodge data. Automorphic and geometric families then instantiate those objects. In rank two, keep the Khare–Wintenberger local compatibility conditions separate from the BLGGT conditions: an assertion away from the coefficient characteristic cannot replace an assertion at that characteristic.

The endpoints are controlled residual potential modularity, potential modularity of given lifts with the specified local types, compatible-system operations and strict-family upgrades. The rational unframed-ring finiteness, point extraction, four prescribed Khare–Wintenberger lifts and almost-strict families are consumed from ClassicalSerreModularity I.2–I.3 through the comparisons below. Higher-rank systems, monodromy, density-one residual irreducibility, polarized operations and their L-functions are included as reusable infrastructure. General regular de Rham potential modularity, full modularity-lifting theorems and the global proof of Serre's conjecture have their own owners.

## Scope and ownership

A prerequisite names its roadmap and section or target label, with all hypotheses of that owner’s mathematical interface. A reference to a target in this document names the relevant layer and links to its statement. Inputs from the following owners are used with their full hypotheses; their constructions are not repeated here.

| Owner | Interface used here |
| --- | --- |
| SchemeAndStackFoundations Layers 0–4; AlgebraicModuliForArithmeticGeometry §§3.1–3.4, 7.3 and 7.6.1; ComplexComparisonPartII §C3.2d.2; ReductiveGroupsPartII RG2.0.1–RG2.0.3, RG2.0a.2 | Smooth and geometrically connected schemes, finite étale torsors, Chow's lemma and smooth hyperplane sections, relative Cartier divisors, curve cohomology and Abel maps; effective descent and Weil restriction; relative Picard sheaves and representability; local point topology, openness of smooth maps, and smoothness and points of Weil restrictions |
| AbelianSchemesAndArithmeticModuli Layer A6; HilbertModularVarietiesAndShimuraCurves H2.2, H2.6, H6, R18.3 | Integral Hilbert models at good primes, openness of the ordinary locus, definite quaternionic class sets and pairings, representable twisted Hilbert moduli, descended geometrically connected components, paired torsion identifications, local points and Weil restriction |
| GlobalNumberFields Layers 1, 9–10; ClassFieldTheory Layers 7, 11–12; AutomorphicGaloisRepresentationsPartII AG2.0; AutomorphicGaloisRepresentations §3.13; Chebotarev Layer 10 | Algebraic Hecke characters, units and approximation, reciprocity, algebraic-character Galois avatars and their geometric converse, and Frobenius prime selection |
| SmallRamificationAndAbelianVarietyBaseCases §5.0d; AutomorphicGaloisRepresentationsPartII AG2.P, “Arbitrary-rank compatible data and operations”; AutomorphicGaloisRepresentations §7.1 | Shared raw family data and operations, weak and all-place strict compatibility with their transport, and the rank-two Dieulefait–Pacetti almost-strict predicate |
| ArithmeticGaloisRepresentations Layers 1–5, §§7.4, 7.6 and 7.9; PadicHodgeTheory Layers 3–6; LocalGaloisDeformationRings §§1.3, 1.6, 1.9, 1.13 and Layers 2–8 | Continuous representations and operations, finite residual image, stable lattices, local Euler and ε-factors, polarized representations with multipliers and signs, Zariski closures, adequacy, local WD and Hodge comparisons, Fontaine–Laffaille and ordinary local rings |
| ClassicalSerreModularity I.2 and R26.1 (Böckle's auxiliary-to-minimal deduction), `I.2/full-kw-global-finiteness` (including characteristic-zero point extraction), `I.3/prescribed-lifts`, `I.3/families-through-prescribed-lifts` and `I.3/residual-links-and-modularity-transfer` | Böckle's minimal comparison, rational Khare–Wintenberger finiteness, integral points, the four lifts, almost-strict families and classical residual-link transfer; §§8.2, 9.1, 10.3, 10.5–10.9, 12.4 and 13.3 identify these exports with this roadmap’s interfaces. Potential modularity over larger fields, compatible-system operations, all-place strictness and transfers with additional de Rham hypotheses remain here. |
| GlobalGaloisDeformations §§3.3–3.8, §4.2, §§5.1, 5.7, 6.1–6.4 and 8.1–8.5; ArithmeticGaloisRepresentations §5.10; DeformationAndDerivedPatchingAlgebra Layers 3–6 | Global deformation problems, Taylor–Wiles data and primes, finiteness of restriction, local-condition quotients, framed/unframed comparison, presentations and finite-image criteria; Carayol's trace theorem; finite-flat complete intersections and characteristic-zero integral points |
| GL2AutomorphicRepresentationsAndTransfer §R16.1.8 and Layers R17.3–R17.6 | Prescribed finite Hecke characters, Jacquet–Langlands, soluble base change and descent, quadratic induction and potential-modularity interfaces, with invariance and cuspidality hypotheses |
| SchemeAndStackFoundations §5.11; InverseGaloisAndArithmeticFundamentalGroups IG.2.5; WeightsInEtaleCohomology Layer R34.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4, R07.3.7 and R07.5.9–R07.5.10 | The smooth proper curve Weil bound, bounded-family Lang–Weil estimates and eigenform purity; Fontaine–Laffaille filtered modules and torsion realization; Savitt's residual types |
| AutomorphicGaloisRepresentations §§3.10–3.14, 4.3–4.9, 6.10 and 7.3 | Hilbert Galois realizations, quaternionic Hecke realizations, common-coefficient eigenform families, away-coefficient comparison and Skinner's full coefficient-prime theorem |
| OrdinaryAutomorphicFormsAndModularityLifting §§1.4–1.5, 2.9–2.11 and Layer 6; PadicFamilies §§0a.4, 0a.14 and 5.8 | Definite-quaternion pairing, traces and Ihara lemmas, Hilbert ordinary weight change and ordinary lifts, ordinary projectors and Hida control |
| GL2ModularityLifting §§1.1–1.8, 3.6, 4.2, 5.4, 5.18, 6.14–6.16, 8.7, 9.2 and 12.1–12.4 | Soluble prescribed completions (§1.7), allowable base change, integral `R=T` under smooth local conditions, full odd-prime and dyadic KW lifting, and the de Rham lifting and transfer results conditional on LL1–LL3 and CC1–CC5, with LC additionally assumed for the Pan transfer (see Conditional inputs) |
| NeronModelsAndSemistableAbelianVarieties §§5.1, 5.3; ShimuraVarieties §§5.3–5.10 | Néron–Ogg–Shafarevich, good-reduction crystalline comparison, CM abelian varieties, their models and complex multiplication |
| EtaleCohomologyFoundations §§F.0, F.0.A1–F.0.A2; InverseGaloisAndArithmeticFundamentalGroups IG.2; SerreWeightAndLevelOptimisation §6.6; EndoscopicTransferAndUnitaryTraceComparison §6.29; AutomorphicFormsOnReductiveGroups §§5.6 and 7.4–7.6; AdelicAlgebraicGroups Layer 1; IntegralHeckeAndGaloisDeterminants §§0.5 and 1.3 | Finite étale covers, monodromy, decomposition and inertia, the arithmetic fundamental-group sequence and path-dependent point sections; finite-quotient specialization and Lang–Weil; the KW optimisation field; Labesse base change and descent; algebraic modular forms and coefficient lattices; adelic group points; determinants and henselian reconstruction |


Layer 1 uses the shared carrier of SmallRamificationAndAbelianVarietyBaseCases §5.0d and its compatibility predicates from AutomorphicGaloisRepresentationsPartII AG2.P, “Arbitrary-rank compatible data and operations”, as consumed in AutomorphicGaloisRepresentations §7.1: `AutomorphicSystemData` with the supplied weak and strict predicates and AutomorphicGaloisRepresentations §7.1’s almost-strict predicate and the operations of coefficient extension, direct sum, dual, tensor product, algebraic-character twist, finite restriction and conjugation. It also builds on the polarized representations of ArithmeticGaloisRepresentations §7.4 and on the algebraic Hecke characters of AutomorphicGaloisRepresentationsPartII AG2.0 and AutomorphicGaloisRepresentations §3.13. It adds what those do not contain: the Khare–Wintenberger rank-two predicates, the rank-one and purity comparisons for very weak and extremely weak data, induction and symmetric and exterior powers of families, polarized families, regularity and purity, Artin and character families, L-functions, the arithmetic representation ring, monodromy and density-one irreducibility. The raw carrier and operations take no eigenform or potential-modularity theorem as a premise. The construction of an eigenform family belongs to AutomorphicGaloisRepresentations §7.3; proving that a supplied lift becomes automorphic belongs to Layer 5; assembling its descended family belongs to Layer 12.

Tau Ceti supplies line-bundle classes and their tensor group, arbitrary-morphism rigidified line bundles, their isomorphism classes, pullback, forgetting and the global-unit criterion for equality. AlgebraicVectorBundles Layer 0 supplies geometric tensor/dual infrastructure, and JacobianChallenge Layer D supplies the ordinary relative Picard functor. Layer 2 uses these objects for a finite flat boundary and adds the relative group-sheaf, representability, degree and divisor-fibration results. LocalGaloisGroups Layer 0 and Conventions, and ProfiniteArithmetic §§0.2–0.4 and 1.1–1.3, supply local Galois and profinite primitives; RestrictedProducts in Completed, Layers 0–2, supplies the restricted-product carrier. Those objects are imported. Tau Ceti's `HeckeCharacter/Purity.lean` supplies the purity of infinity types of algebraic Hecke characters. RepresentationTheory/InductionRestriction Layer 6 owns finite-group Brauer induction, and Tau Ceti’s `TauCeti.exists_simple_character_eq_of_characterPairing_self_eq_one` is the norm-one criterion for virtual characters of a finite group; the arithmetic ring of §1.16 needs the analogue for continuous representations of `G_F`, using the irreducible-multiplicity argument. Tau Ceti also supplies `TauCeti.repRing` for arbitrary monoids, its character homomorphism `repRingCharacter`, restriction `repRingRes`, and finite-index induction `repRingInd` in `RepresentationTheory/RepresentationRing/{Basic,Restriction,Induction}.lean`. This is the split Grothendieck ring of all algebraic finite-dimensional representations, without continuity or ramification conditions. The additional arithmetic carrier restricts to continuous, finitely ramified representations of `G_F` and imposes semisimplification relations; its trace recognition and arithmetic Euler factors require these additional conditions. It reuses the tensor, restriction and induction infrastructure rather than constructing another generic representation ring.

Layer 8 builds the rank-two ordinary theory on definite unitary groups in two variables (ordinary Hecke algebras, ordinary patching for adequate residual image, ordinary automorphy lifting and finiteness) that the ordinary finiteness and Newton–Thorne applications use; the arbitrary-rank versions are downstream applications in PotentialAutomorphyInfrastructure. Skinner–Wiles level adjustment is supplied by OrdinaryAutomorphicFormsAndModularityLifting §6.14; Layer 4 derives its even-degree, residual-inertia-killing application and proves Taylor's crystalline lifting theorem.

## Conventions

Fix algebraic closures and the compatible embeddings needed to compare local groups. Write `G_F` for the absolute Galois group with its Krull topology. Every arithmetic representation is continuous; an algebraic representation by itself does not include that condition. A residual representation is the semisimplification of reduction of a stable lattice, with independence up to isomorphism. Absolute irreducibility includes coefficient extension. S-type means a continuous, odd, absolutely irreducible two-dimensional representation over a finite field of characteristic p, as in KW I §1, p. 2. Normalized Serre weights are supplied by AlgebraicModularFormsAndSerreWeights R15.4 and are at least two. The residual prime of the starting representation is p; l is the residue characteristic of a system's coefficient place `λ`; q or v denotes a place of its base field. In Taylor's auxiliary ordinary construction l is the starting prime and p is a distinct auxiliary prime.

For the KW rank-two endpoints use their arithmetic-Frobenius and Hodge–Tate normalization, `HT(ε)=+1`. For the BLGGT generic carrier use geometric Frobenius and `HT(ε)=−1`. Thus the geometric cyclotomic system has good polynomial `X−q_v⁻¹` and pure weight `−2`. A weight-k newform with nebentypus ψ has, at good places, cohomological geometric data `H={0,k−1}, Q_v=X²−a_vX+ψ(v)q_v^(k−1)`; the KW arithmetic member is its contragredient with KW's Hodge convention. Use AutomorphicGaloisRepresentations Conventions and §1.5 for this comparison: duality inverts the determinant character on a fixed Galois element, and replacing geometric by arithmetic Frobenius inverts that element again. Thus the arithmetic dual has the same displayed good polynomial, including ψ(v). A common coefficient field is a number field, and Frobenius comparisons are made after its embeddings into the respective local algebraic closures, never by directly equating values in unrelated l-adic fields.

**Checks.** Trivial ψ recovers constant coefficient `q_v^(k−1)`. For `η(4z)^6`, weight three and level 16, `a₃=0` and `ψ(3)=−1`, giving `Q₃=X²−9` ([Li–Long–Tu][li-long-tu], §3, p.16). For a character value of order greater than two, the determinant at a fixed Frobenius changes from b to b⁻¹ under duality; ψ and ψ⁻¹ must remain distinguishable.

Weil–Deligne comparison means Frobenius semisimplification; it retains the monodromy operator N. Unramified WD data mean trivial inertia and `N=0`. For de Rham members this condition implies crystallinity at the coefficient prime through PadicHodgeTheory §§5.1–5.4. Inertial type alone forgets N and does not certify a local lift with a prescribed determinant. The global rings used in finiteness and point extraction are unframed, with fixed determinant; their framed formal power-series enlargements have a different finiteness behavior.

A Skolem point must satisfy every local embedding condition. Splitting after tensoring with `L_v` means a product of copies of `L_v` as an L_v-algebra. It is weaker than prescribing each completion to be `L_v`. A prescribed-completion theorem is identified explicitly when that stronger conclusion is needed. Galois closure and avoidance are tracked throughout; an intersection computation cannot replace the tensor definition of disjointness without its finite Galois hypotheses.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use the following library primitives at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

- `IntermediateField.LinearDisjoint` supplies tensor-based field disjointness. `IntermediateField.LinearDisjoint.inf_eq_bot` gives trivial intersection; `IntermediateField.LinearDisjoint.iff_inf_eq_bot` has finite-dimensional hypotheses on both fields and a Galois hypothesis on the left one.
- `AlgebraicGeometry.Spec` and `Scheme.Modules.pullback` supply scheme points and restriction of module sheaves. Tau Ceti's `InvertibleSheaf` and `InvertibleSheaf.trivial` supply the line bundles and trivial bundle. `LineBundleClass.mk_eq_mk_iff` recognizes equality of unrigidified classes by a sheaf isomorphism. Layer 2 adds the relative curve construction over Tau Ceti’s rigidified line-bundle classes. The latter are cited below as library prerequisites, without private substitutes in Suggested.lean.
- `NumberField.Chebotarev.frobeniusPrimeSet` defines the set of unramified primes of an Artin conjugacy class. Prime existence and density are theorems of the Chebotarev roadmap.
- `Field.absoluteGaloisGroup`, `Representation`, `Representation.IsSemisimpleRepresentation`, `Representation.IsIrreducible` and `Representation.dual` provide the Krull-topological Galois group and algebraic representation interfaces. Continuity, finite ramification and absolute irreducibility are additional arithmetic conditions. `NumberField.FinitePlace` and `FinitePlace.embedding` provide coefficient places and completion embeddings. `LinearMap.charpoly` applies to finite free modules.
- `Representation.ind` and `Rep.indResAdjunction` give algebraic induction and its restriction adjunction for groups over a commutative ring. Arithmetic continuity and finite-dimensionality are supplied by ArithmeticGaloisRepresentations §§1.3 and 1.12. `Finsupp` gives an additive irreducible-multiplicity lattice; tensor product needs its own structure constants.
- `MvPowerSeries`, `IsLocalRing`, `IsDiscreteValuationRing`, `IsAdicComplete`, `ringKrullDim`, `RingTheory.Sequence.IsRegular` and `Module.Flat` are the commutative-algebra vocabulary. Regularity includes a nonzero final quotient, and a DVR is not a field. The regular-local and Cohen–Macaulay algebra comes from DeformationAndDerivedPatchingAlgebra Layer 3; point extraction comes from DeformationAndDerivedPatchingAlgebra Layer 4.
- `Complex.Gammaℝ`, `Complex.Gammaℂ` and `Complex.Gammaℝ_mul_Gammaℝ_add_one` give the real and complex archimedean factors and their duplication identity.
- `NumberField.InfinitePlace.Completion` and `HeightOneSpectrum.adicCompletion` give the completion `K_v` at every place, `IsModuleTopology` the canonical topology on a finite extension of `K_v`, and `IntermediateField.LinearDisjoint`, `AlgebraicClosure` and `IntermediateField.extendScalars` the field-theoretic conditions. `Field.absoluteGaloisGroup.map` restricts Galois representations along field embeddings, `cyclotomicCharacter` and `PadicAlgCl` give the `p`-adic cyclotomic character and `ℚ̄_p`, and `NumberField.IsTotallyReal`, `NumberField.IsCMField` and `NumberField.Set.HasDirichletDensity` the field and density conditions.
- `AlgebraicGeometry.IsSeparated`, `LocallyOfFiniteType`, `QuasiCompact`, `GeometricallyIrreducible`, `Surjective`, `Smooth`, `GeometricallyConnected`, `GeometricallyIntegral`, `IsOpenImmersion`, `IsClosedImmersion`, `AffineSpace` and `topologicalKrullDim` give the scheme-theoretic conditions on Skolem data and their reductions; finite type requires both local finite type and quasi-compactness.

- `TauCeti.AlgebraicGeometry.RigidifiedLineBundle` and `RigidifiedLineBundleClass` in `TauCeti.AlgebraicGeometry.LineBundle.Rigidified.Basic` supply representatives and their compatible-isomorphism quotient for any morphism. In the `RigidifiedLineBundleClass` namespace use `mk_eq_mk_iff`, `lift`, `lift_mk`, `pullback`, `pullback_id`, `pullback_comp`, `toLineBundleClass` and `toLineBundleClass_pullback`. The module `TauCeti.AlgebraicGeometry.LineBundle.Rigidified.Automorphisms` supplies `mk_mk_eq_mk_mk_iff`, `stabilizer_eq_range` and `range_toLineBundleClass`: boundary trivializations agree exactly up to the image of global units. `TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor` and its `rigidifiedPicardFunctor_obj`, `rigidifiedPicardFunctor_map` and `rigidifiedPicardFunctor_map_mk` in `TauCeti.AlgebraicGeometry.PicardFunctor.Rigidified` handle rigidification along a section. The finite-flat-boundary relative sheaf and its representability in §2.5 extend that section case.
- `TauCeti.repRing`, `TauCeti.repRingCharacter`, `TauCeti.repRingRes` and `TauCeti.repRingInd` in `TauCeti.RepresentationTheory.RepresentationRing.Basic`, `.Restriction` and `.Induction` supply the split algebraic representation ring, character, restriction and finite-index induction. The arithmetic category and semisimplification relations in §1.16 are additional requirements. `TauCeti.exists_simple_character_eq_of_characterPairing_self_eq_one` in `TauCeti.RepresentationTheory.CharacterTable.VirtualCharacter` supplies the finite-group norm-one criterion under its characteristic-zero and realization hypotheses; §1.16 uses its irreducible-multiplicity argument for arithmetic representations.
- `TauCeti.GlobalNumberFields.HeckeCharacter.exists_weight` and `.IsAlgebraic.exists_weight_norm_apply` in `TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Purity` give a common integer conjugate-pair weight and the corresponding norm power. The Galois avatars and local WD comparisons come from AutomorphicGaloisRepresentationsPartII AG2.0 and AutomorphicGaloisRepresentations §3.13.
- `TauCeti.isOpen_range_powMonoidHom` in `TauCeti.NumberTheory.LocalField.PowerSubgroup.Open` states openness of the n-th-power subgroup of a nonarchimedean local field when `(n : K) ≠ 0`. In §2.15 the detecting residue characteristics avoid n, so `TauCeti.unitFiltration_one_le_range_powMonoidHom_of_isUnit` in `.PowerSubgroup.Basic` supplies the sharper unit-filtration containment as well.

### From the arithmetic roadmaps

The owner table in Scope and ownership gives the imported layers. Consume their actual arithmetic objects: continuous representations with coefficient embeddings and places; Weil–Deligne parameters with monodromy; labeled de Rham and crystalline comparisons; representable Hilbert moduli with their smooth, geometrically connected components; fixed-determinant unframed deformation rings and their point-to-lift equivalence. In particular, a coefficient realization uses a chosen algebraic closure of the relevant completion, not an arbitrary field. Changing coefficients requires the restriction of places and continuous completion embeddings. A monodromy datum is computed from the Zariski closures of the supplied system's images, rather than a collection of unrelated abstract groups and integer functions.

SmallRamificationAndAbelianVarietyBaseCases §5.0d supplies `AutomorphicSystemData` at arbitrary positive rank and over arbitrary number fields: common good polynomials over M, labelled Hodge data, and continuous semisimple members realized over specified finite extensions `L_λ/M_λ`. It also supplies raw coefficient extension, direct sum, tensor product, dual, Tate twist, finite restriction and convention adapters. AutomorphicGaloisRepresentationsPartII AG2.P, “Arbitrary-rank compatible data and operations”, supplies `Weak`, `Strict` and their preservation by these operations. AutomorphicGaloisRepresentations §7.1 supplies the rank-two `AutomorphicSystemData.IsAlmostStrictlyCompatible` and its precise omitted-pair transport. Good polynomials over M alone do not imply an `M_λ`-model. When rank-two arguments need chosen completed-coefficient-field models, use that section’s `HilbertSystemRealizations` after the stated common coefficient extension. The all-place WD parameter is allowed over an algebraic closure of the common field with its field of definition; choose a model over one enlarged number field when an application requires it.

Use `TauCetiRoadmap.PotentialModularityAndCompatibleSystems` for the names below. The README states the complete mathematics. [Suggested.lean](Suggested.lean) states split-field Zariski density, additive strong approximation away from one place and the finite-presentation complete-intersection theorem. Its module docstring identifies the missing objects needed to state the other headline results. The names below specify mathematical targets and their supplier interfaces.

### Conditional inputs

The following inputs are explicit hypotheses on the branches that use them. Conditional conclusions and their downstream applications retain these hypotheses.

- **The de Rham lifting theorems of GL2ModularityLifting (§§8.7 and 9.2) and its residually reducible transfer (§12.3).** These are Tung's Theorem 4.7 (odd p) and Theorem `8.0.3 (p = 2)`, over totally real fields in which p splits completely and assuming residual modularity, and the residually reducible de Rham transfer. GL2ModularityLifting proves them conditionally on its p-adic local Langlands inputs LL1–LL3 and completed-cohomology inputs CC1–CC5; CC5 is the statement that the auxiliary globalizations inside those proofs do not use Serre's conjecture. They are used by `dieulefait_families` and `regularDeRhamPotentialModularity` (§12.5) and by the residually reducible branches of §13.2 and §13.3. The milestone `dieulefait_families_kwTypes` and all other targets avoid them.
- **The Pan residually reducible alternatives** imported from GL2ModularityLifting §12.3 additionally assume its twist-two arithmetic vanishing hypothesis LC (GL2ModularityLifting, Conditional arithmetic hypotheses). Sections 13.2–13.3 carry LC for these alternatives; the KW alternatives retain their stated hypotheses.
- **The soluble-image seed `solubleResidualRegularOrdinarySeed`** (§4.7): for `ρ̄` as in Taylor's Theorem 1.6 with soluble image, a finite Galois totally real field split above l over which `ρ̄` is the residual representation of a regular algebraic cuspidal `π` with the ordinary local shape of that theorem. Taylor obtains it from strong Artin and congruences in the manner of Rogawski–Tunnell, whose Theorem 2.9 covers only coefficient places of large norm. It is used only in the soluble-image branch of §4.7.

- **Ordered polarization norm witnesses.** In §3.3 take, for every polarization module produced in H6.5 (O2) and (O3), a witness that its narrow class lies in the norm image from N. Section 3.2 constructs only (C1)–(C5). The Taylor/HBAV branch of §4.7, its uses in §§4.13–4.14, and their consumers in Layers 5–13 are conditional on these witnesses for each use of H6.5. The dyadic principal-polarization construction of §4.12a carries the same hypothesis when it uses that class adjustment. Neither the niveau-two construction of §4.8 nor the independent Snowden and BCGP constructions is made conditional on H6.5. Every *Needs* citation of these conditional branches carries their norm witnesses as part of its full input contract.

## How to read the build

Layer 1 builds compatible-system infrastructure independently of potential modularity. Layers 2–7 select fields, construct the auxiliary moduli points, prove the auxiliary modularity by level adjustment, crystalline lifting and descent, prove residual and given-lift potential modularity and record their exports. Layers 8–11 establish ring finiteness, including the rank-two ordinary patching on definite unitary groups and its finiteness theorem, extract points and apply the lifting theorems. Layers 12–13 assemble and compare the resulting families. Within each layer follow the construction order given there; each construction lists its sources and exact needs. In Layer 1 construct the KW carrier of §1.2 before its comparison in §1.1, and construct the character families of §1.9 before the rank-one comparison in §1.3. The Skolem definitions in §2.1 use only scheme-point topology; smooth-map openness enters after §2.2.

<a id="layer-r24-5-operations"></a>
## Layer 1: Compatible-family infrastructure


Use the imported carrier and its arithmetic operations before invoking any automorphic-family existence theorem. Character and Artin families give basic examples. Monodromy and density-one results use this same carrier, together with the reductive-group and local arithmetic inputs listed at each target.

<a id="target-weakly-compatible-system-rank-n"></a>
### 1.1 Weakly compatible families of arbitrary rank

Compare the imported weak-family predicate with Taylor's rank-d convention over `ℚ` and the rank-two Khare–Wintenberger convention. The additional target is the comparison, with the normalizations and coefficient-prime hypotheses made explicit. Taylor's contract fixes the labeled Hodge data at all members and crystallinity outside S but does not separately require de Rham behavior at exceptional coefficient primes. A Taylor family therefore satisfies the imported weak predicate once those exceptional members are also de Rham of the stated weights. A rank-two KW plain or almost-strict family likewise requires all-member de Rham comparison and crystallinity outside one fixed enlarged S; neither follows just by forgetting its WD data.

The comparison API is:

- `weakCompatibility_ofTaylor`: For Taylor's rank-d family over `ℚ`, add de Rham behavior of the common Hodge type at every exceptional coefficient prime; the resulting data satisfy the weak-family predicate.
- `weakCompatibility_ofKW`: For a rank-two KW family, identify coefficient embeddings, dualize its arithmetic member when changing the Frobenius convention, and assume the all-member de Rham and outside-S crystalline conditions. The transported data satisfy the weak-family predicate.
- `weakCompatibility_comparison_members`: Both comparisons preserve the specified representations, polynomials and weights after the stated normalization, rather than choosing representations from their traces.

**Checks.**

- `wcs_cyclotomic`: The geometric-Frobenius realization of `ε` has `Q_p=X−p⁻¹` and `H={−1}`. The reciprocal convention gives `X−p` and `H={1}`; a comparison retaining `X−p` in the geometric convention fails.
- `wcs_newform_delta`: For the cohomological `Δ` family, `Q₂=X²+24X+2048` and `H={0,11}`. Its dual has `Q₂=X²+(3/256)X+1/2048` and `H={0,−11}`; changing the member without changing the polynomial fails.
- `wcs_artin_weight_one`: An Artin family of a weight-one form has `H={0,0}`; the weak comparison applies, while regularity is false. Thus the comparison must not require regularity.
- `wcs_exceptional_deRham`: Plain or KW almost-strict axioms supply no de Rham comparison in the residually reducible ramified coefficient-prime branch; that branch needs the additional hypothesis of `weakCompatibility_ofKW`.

The sources are [BLGGT v1][blggt-2014], §5.1, definition of a weakly compatible system, p. 51 (arXiv v1; printed page = PDF page); [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, rank d weakly compatible systems over `ℚ, p`. 773 (PDF page 45).

*Needs:* §1.2 (the KW carrier, before this comparison); SmallRamificationAndAbelianVarietyBaseCases §5.0d (`AutomorphicSystemData`); AutomorphicGaloisRepresentationsPartII AG2.P, “Arbitrary-rank compatible data and operations” (`Weak`); AutomorphicGaloisRepresentations §7.1; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; PadicHodgeTheory Layer 3; PadicHodgeTheory §§5.3–5.4; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`; `mathlib:LinearMap.charpoly`; `mathlib:NumberField.FinitePlace`; `mathlib:NumberField.FinitePlace.embedding`.

<a id="target-compatible-system"></a>
### 1.2 Rank-two plain, almost-strict and strict families

For number fields F and E, define a rank-two E-rational family with continuous semisimple `ρ_ι` for every prime l and embedding `ι:E↪Q̄_l`, a Frobenius-semisimple WD parameter `r_q` over an algebraic closure of E, with its field of definition specified when a model is used, at each finite q, unramified except at finitely many q, and fixed integers `a≥b`. Plain compatibility compares WD parameters whenever `q∤l` and requires crystallinity of weights (a,b) at coefficient places for sufficiently large l.

KW strictness requires every member to be geometric of these weights and compares `WD(ρ_ι|D_q)^Fss` with `ιr_q` at **every** q, using Fontaine's construction when q|l. KW almost strictness adds to plain compatibility two coefficient-prime clauses: full geometric/WD comparison when the semisimplified residual member is irreducible; and, for `l≠2` and unramified `r_q`, crystallinity of the common weights. It imposes no further coefficient-prime comparison in the residually reducible ramified case. Regularity means `a≠b`. Plain and KW almost-strict carriers need not be de Rham at every member.

Dieulefait–Pacetti use a different almost-strict contract: every member is de Rham at its coefficient prime. Compare their five-tuple only after identifying coefficient embeddings and normalizations. Keep this additional condition explicit when translating between the two definitions.

AutomorphicGaloisRepresentations §7.1 uses the shared all-place predicate `Strict` from AutomorphicGaloisRepresentationsPartII AG2.P and defines `AutomorphicSystemData.IsAlmostStrictlyCompatible`, the Dieulefait–Pacetti almost-strict predicate, which at an odd coefficient prime with unramified common parameter still requires the full comparison. Use them. The Khare–Wintenberger family here is the rank-two specialization of that carrier indexed by embeddings `ι` with fixed integer weights `a≥b`; KW strictness is AGR's strict predicate for it, and KW almost strictness, which at such a prime asks only for crystallinity of the common weights, is the separate predicate below.

The additional API specializes the supplied carrier without reconstructing its all-place strict predicate or its coefficient extension:

- `CompatibleSystem`: the rank-two specialization with fixed weights `a≥b` and the KW plain compatibility predicate.
- `CompatibleSystem.IsAlmostStrict`: the separate KW coefficient-prime conditions (irreducible residual, or `ℓ≠2` and unramified common parameter).
- `CompatibleSystem.IsRegular`: `a≠b`.
- `CompatibleSystem.strict_implies_kwAlmostStrict`: the supplied all-place strict predicate implies KW almost strictness, which implies KW plain compatibility.
- `CompatibleSystem.dpAlmostStrict_implies_kwAlmostStrict`: after identifying embeddings and conventions, DP's full odd-unramified comparison implies the weaker KW crystallinity clause. No converse is asserted.

**Checks.**

- `newform_is_strict`: Import the `Δ` eigenform family from AutomorphicGaloisRepresentations §7.3: weights (11,0), regular and strict after the complete coefficient-prime theorem from AutomorphicGaloisRepresentations §§4.5–4.9.
- `weight_one_irregular`: a weight-one newform gives an irregular system, `a = b = 0`
- `almost_strict_not_strict`: The almost-strict axioms supply no WD comparison in the residually reducible ramified coefficient-prime case; this tests the scope of the axioms, not failure of the constructed geometric families.
- `hodge_tate_weights_convention`: weight `a + 1` when `b = 0`: a newform of weight k gives `(a, b) = (k − 1, 0)`

The sources are [KW I][kw-serre-modularity-I], §5, p. 7 of the preprint, §5, p. 8 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Definition 1.10 and after, pp. 6–7 of the arXiv version.

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.P, “Arbitrary-rank compatible data and operations” (`Strict`); AutomorphicGaloisRepresentations §7.1 (`AutomorphicSystemData.IsAlmostStrictlyCompatible`); PadicHodgeTheory §§5.3–5.4; ArithmeticGaloisRepresentations Layer 2; ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; ArithmeticGaloisRepresentations Layer 1; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`.

<a id="target-weakened-compatible-data"></a>
### 1.3 Very weak and extremely weak families

Use the predicates `ExtremelyWeak` and `VeryWeak` of AutomorphicGaloisRepresentationsPartII AG2.6, “Weak, very weak and extremely weak automorphic data”, on the shared carrier. Extremely weak data retain the number fields, finite exceptional set, actual continuous semisimple members and common monic good Frobenius polynomials of a weak system, but impose only `HT_τ(det r_λ)=ΣH_τ` at every `λ`. They require no full-member Hodge or de Rham comparison. Very weak data additionally require crystallinity at all places above l and the full Hodge multisets for l outside a Dirichlet-density-zero set. A weak system is very weak, and a very weak system is extremely weak.

In rank one the determinant condition recovers the full Hodge condition, and character classification gives weak compatibility. In higher rank it controls only the sum of the Hodge entries. Accordingly, induction and Artin-twist purity use the canonical transported Hodge data rather than arbitrary multisets with the same sum.

The supplier API exposes `ExtremelyWeak` (common Q, members and H with determinant-Hodge condition), `VeryWeak` (the additional density-one full-member clause), the implications `Weak ⇒ VeryWeak ⇒ ExtremelyWeak`, and the determinant Hodge-sum equality at every `λ`. Use these predicates and implications directly. The comparison in rank one uses the character classification of §1.9, and the purity applications in §§1.10–1.13 retain the transported Hodge multisets.

**Checks.**

- `weakening_rank_one`: A rank-one `H_τ={a}` is determined by its determinant Hodge sum a.
- `weakening_higher_rank_metadata`: Rank-two `H={0,2}` and `H′={1,1}` have the same determinant sum 2; the determinant condition distinguishes neither the Hodge multiset itself nor regularity.
- `weakening_hodge_purity_not_sum`: For a weight-zero rank-two Artin family, `H_τ={−1,1}` and `H_cτ={0,0}` have the correct zero determinant sums but fail `H_cτ=−H_τ`. Thus extremely weak Hodge metadata need not satisfy purity.
- `weakening_transitive`: The composite weak→very weak→extremely weak map preserves each `r_λ, Q_v` and `H_τ`.

The sources are [ACC+][acc-2023], §7.1, pp.1084–1085.

*Needs:* §1.9 (character families, before the rank-one comparison); [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); ArithmeticGaloisRepresentations Layer 1; PadicHodgeTheory Layer 3. AutomorphicGaloisRepresentationsPartII AG2.6, “Weak, very weak and extremely weak automorphic data”.

<a id="target-system-operations"></a>
### 1.4 Induction of families

Twists by algebraic-character families, restrictions to finite base-field extensions, coefficient extension and conjugation are the operations of AutomorphicGaloisRepresentations §7.1, with its transport of the weak and strict predicates and its rank-two almost-strict transport rule; import them. Construct here the induction from a finite extension, applying representation, WD and Hodge operations together. Enlarge S by ramification of the extension for induction, and at each local place use the sum of locally induced WD parameters. At a place above the coefficient prime this requires that `D_pst` of an induced representation is the induced Weil–Deligne representation; prove it here from the compatibility of Fontaine's functor with restriction and the Mackey description of induction. Plain compatibility is preserved; all-place strictness is preserved for the de Rham input systems using the local operations of PadicHodgeTheory §§5.1–5.4.

For an almost-strict system the unconditional output is plain. Retaining almost strictness requires checking every newly irreducible residual output against the source's coefficient-prime comparison cases and every unramified coefficient-prime output for crystallinity. A strict character twist preserves the residual irreducibility test in rank two; restriction or induction can change it. A virtual Brauer combination is still a class in a representation ring until genuineness is proved.

The construction has the following API:

- `induce`: For finite F′/F induce each member, rank multiplied by [F′:F], enlarge S by ramified primes, local WD induction and Hodge multiset union.
- `induce_coefficientPrime`: The coefficient-prime WD parameter is the local induction of the input parameters, with Fontaine’s functor and Mackey decomposition identified.
- `induce_rank`: Rank `Ind_F′^F ℛ=[F′:F] rank ℛ`; induction need not preserve regularity or irreducibility.

**Checks.**

- `twist_cyclotomic`: Twisting by `ε` shifts each BLGGT Hodge number by `−1` and pure weight by `−2`.
- `restrict_trivial_extension`: For `F′=F` restriction returns the same members, Q and H.
- `induce_quadratic_trivial`: Induce the trivial character across a quadratic extension: `rank 2, H={0,0}`, polynomial `(X−1)²` at split good primes and `X²−1` at inert good primes.
- `induced_regular_nonexample`: The induced quadratic trivial character is a sum of trivial and quadratic characters and is not regular; generic induction is not an irreducibility theorem.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93 of the preprint.

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); SmallRamificationAndAbelianVarietyBaseCases §5.0d (raw operations); AutomorphicGaloisRepresentationsPartII AG2.P (weak and strict transport); AutomorphicGaloisRepresentations §7.1 (rank-two almost-strict transport); PadicHodgeTheory §§5.3–5.4; PadicHodgeTheory §5.3; PadicHodgeTheory Layer 3 (induction and restriction of scalars); ArithmeticGaloisRepresentations Layer 2; ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 7; `mathlib:Representation.ind`; `mathlib:Representation.dual`.

<a id="target-polarized-system"></a>
### 1.5 Polarized weakly compatible families

For CM F/F⁺ and a weak system `ℛ`, take a rank-one multiplier system `ℳ` of `G_(F⁺)` over the same coefficient field, with ramification below that of `ℛ`. A polarization includes, for every `λ` and real place v, an actual perfect pairing B with `B(x,y)=ε_vB(y,x), B(r_λ(g)x,r_λ(c_vgc_v)y)=μ_λ(g)B(x,y)`, and `ε_v=−μ_λ(c_v)`. Total oddness means `ε_v=+1` at every real place. Forgetting the pairing gives essential conjugate self-duality, not a polarization witness. For totally real fields use the orthogonal/symplectic convention of BLGGT §2.1 instead of imposing the CM sign equation without a CM extension. The representation-level pairing, multiplier, sign and total oddness are those of ArithmeticGaloisRepresentations §7.4 (`PolarizedRep`); this target assembles them over a family.

The construction has the following API:

- `PolarizedSystem`: Pair `ℛ,ℳ` with an actual polarization witness at every `λ`.
- `PolarizedSystem.multiplier`: The rank-one character system `ℳ` of `G_F⁺`, including `μ(c_v)`.
- `PolarizedSystem.pairing`: The perfect representation-level pairing from ArithmeticGaloisRepresentations §7.4, for each `λ` and real place v.
- `PolarizedSystem.IsTotallyOdd`: All pairing signs `ε_v` are `+1`; for CM this requires `μ(c_v)=−1`.
- `PolarizedSystem.conjugateDual`: Each `r_λ^c` is isomorphic to `r_λ∨⊗μ_λ|G_F`, with the specified pairing.

**Checks.**

- `polarized_cm_unit`: The trivial rank-one system on `G_F` has a symmetric pairing and CM multiplier `δ_F/F⁺`, with `μ(c_v)=−1`; multiplier 1 has the wrong BLGGT sign.
- `polarized_rank_two` (README-only: family/pairing carrier): For the cohomological elliptic family over a CM field, use the rank-two duality pairing with the properly normalized multiplier and its real-place sign; total oddness is tested on the actual conjugate pairing, not only det on `G_F`.
- `polarized_multiplier_wrong`: Changing `μ(c_v)` while retaining the same pairing reverses the required CM equation `ε_v=−μ(c_v)`.
- `polarized_forget_pairing` (README-only: family/pairing carrier): Forgetting the perfect signed pairing gives `r^c≅r∨⊗μ`; an isomorphism alone does not determine a correctly signed polarization.

The sources are [BLGGT v4][blggt-2014-v4], §2.1, p.31; §5.1, p.62.

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); ArithmeticGaloisRepresentations Layer 7 (§7.4, `PolarizedRep`, `IsTotallyOdd`).

<a id="target-compatible-system-predicates"></a>
### 1.6 Regularity, purity, strictness and automorphy

Define the following predicates separately on a weak system `ℛ=(M,S,Q,r,H)`. Regular means every `H_τ` has distinct entries. Extremely regular additionally means that, for some `τ`, distinct submultisets of the same cardinality have different sums. For rank-one systems over totally real fields, total oddness means `r_λ(c_v)=−1`. Essential conjugate self-duality is expressed using a character system `ℳ` of `G_(F⁺)` and representation-level comparisons; total odd essential conjugate self-duality uses their signed pairing convention.

Irreducibility means irreducibility at every `λ` over a set of rational primes of Dirichlet density one. BLGGT strict compatibility supplies a `WD_v` over M̄ with Frobenius-semisimple comparison at all `λ` **away from the residue characteristic of v**. Purity of weight w requires `|ια|²=q_v^w` for every good Frobenius root and `H_(cτ)={w−h:h∈H_τ}`. Strict purity additionally requires every local `WD_v` pure of weight w, including its monodromy filtration. Automorphy requires a regular algebraic cuspidal `π` of `GL_n(A_F)` whose normalized `rec(π_v|det|^((1−n)/2))` has the specified good polynomial.

Taylor's strong compatibility over `ℚ` corresponds to this away-coefficient strictness; his rank-two regularity also includes odd determinant. The CM system convention and its totally real pairing variant must use their respective representation-level definitions. Neither this strictness nor purity upgrades to KW all-place strictness without a coefficient-prime theorem.

The construction has the following API:

- `WeaklyCompatibleSystem.IsRegular`: Distinct Hodge–Tate numbers for every `τ`.
- `WeaklyCompatibleSystem.IsExtremelyRegular`: Regular, and some `H_τ` has no distinct equal-cardinality submultisets with the same sum.
- `WeaklyCompatibleSystem.IsStrictlyCompatible`: A Weil–Deligne representation `WD_v(ℛ)` matching every `r_λ` at `v, λ ∤` residue characteristic of v.
- `WeaklyCompatibleSystem.IsPure`: Weight-w purity of the `Q_v` and the symmetry `H_{cτ} = w − H_τ`.
- `WeaklyCompatibleSystem.IsEssentiallySelfDual`: Essential conjugate self-duality with a character system of `G_{F⁺}`, and its totally odd version.
- `WeaklyCompatibleSystem.IsIrreducible`: Irreducible for `λ` above a density-one set of primes.
- `WeaklyCompatibleSystem.IsAutomorphic`: Frobenius polynomials of a regular algebraic cuspidal `π`.

**Checks.**

- `pred_newform`: A newform of weight `k ≥ 2` is regular, strictly pure of weight `k − 1`, irreducible and automorphic.
- `extreme_positive`: H=`{0,1,3,7}` has distinct sums of distinct equal-size subsets and is extremely regular; it is realized by a sum of Tate characters.
- `extreme_collision`: H=`{0,1,2,3}` is regular but not extremely regular: `{0,3}` and `{1,2}` have the same cardinality and sum.
- `extreme_repetition`: H=`{0,0}` is not regular and hence not extremely regular.
- `pred_regular_fails`: `ε ⊕ ε` is not regular `(H = {−1, −1})`.
- `pred_odd_purity`: For n odd and v real, purity forces w even (BLGGT p. 53).
- `pred_strict_vs_almost_strict`: Check the away-coefficient WD comparison separately from the coefficient-prime conditions. BLGGT strictness has no coefficient-prime WD clause, and KW almost strictness requires additional conditions there.

The sources are [BLGGT v1][blggt-2014], §5.1, the subsidiary definitions, p. 51 (arXiv v1; printed page = PDF page), §5.1, strict compatibility and purity, p. 52 (arXiv v1; printed page = PDF page), §5.1, automorphy, p. 53 (arXiv v1; printed page = PDF page); [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, Taylor's remark on motives, p. 773 (PDF page 45).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); PadicHodgeTheory §§5.3–5.4; ArithmeticGaloisRepresentations Layer 7; [Layer 1, Polarized weakly compatible families](#target-polarized-system).

<a id="target-linear-algebra-operations-on-systems"></a>
### 1.7 Linear-algebra operations on families

Over a common coefficient field use the direct sums, semisimplified tensor products and contragredients of AutomorphicGaloisRepresentations §7.1, and construct symmetric and exterior powers, using the characteristic-polynomial identities of ArithmeticGaloisRepresentations §7.1. At a good place, sum multiplies the polynomials, tensor multiplies every pair of roots, and the dual polynomial is `X^n Q_v(0)⁻¹Q_v(X⁻¹)`. Symmetric powers use repeated products, exterior powers distinct products. Hodge data are the corresponding disjoint unions, pairwise sums, negatives and repeated/distinct sums.

These operations, restriction and induction preserve weak and away-coefficient strict compatibility with the appropriate enlargement of S. Pure direct sums require equal weights; tensor weights add, duality negates weight, and the k-th powers have weight kw. Restriction and induction preserve weight with their canonical transported Hodge data; local strict purity uses the analogous WD preservation. Duality and restriction preserve regularity. The other operations can create Hodge collisions. Duality preserves irreducibility, while arbitrary sums, tensors, restrictions and inductions need not. Cuspidal automorphy is asserted only through a theorem establishing it for the particular operation.

For the dual characteristic polynomial, use the normalized reciprocal expression `C(Q(0)⁻¹)Q.reverse` only with the intended monic, nonzero-constant domain.

The shared raw carrier has positive rank. Extend the family interface to rank zero by adjoining `rankZeroSystem`: its members are the zero representation, its good polynomial is 1, and its Hodge multisets and local WD parameters are empty and zero. The API identifies its unique memberwise isomorphism class, transports it under coefficient extension and finite restriction, makes it the direct-sum identity and the tensor-product absorbing object, and identifies exterior powers above rank with it. Its L-factor is 1. These are targets here, with the same sources as the linear-algebra operations below; they do not change the supplier's positive-rank type. Symmetric powers of the zero system are zero for positive exponent and the rank-one unit for exponent zero.

**Rank-zero checks.** The zero-dimensional characteristic polynomial is 1, rather than X. Tensoring a positive-rank family with the zero family gives zero rank and empty Hodge multiset. The third exterior power of a rank-two family is zero, whereas its zeroth exterior power is the rank-one unit with polynomial `X−1`.

The construction has the following API:

- `symmetricPower`: `Sym^k` members and repeated k-fold weight sums; `rank binomial(n+k−1,k)` for `n≥1`, with the rank-zero cases just specified.
- `exteriorPower`: `∧^k` members and distinct k-fold weight sums; rank binomial(n,k), zero if `k>n`.
- The contragredient of an invertible matrix has the normalized reciprocal characteristic polynomial, monic of rank n; for `rank 2, X²−aX+b` becomes `X²−(a/b)X+1/b`.
- `directSum_pure`: Pure systems of the same weight w have pure direct sum of weight w; differing weights invalidate the conclusion.

**Checks.**

- `dual_polynomial_rank_one`: over `ℚ, X−2` becomes `X−1/2`.
- `dual_polynomial_rank_zero`: the polynomial 1 remains 1.
- `dual_polynomial_singular`: X has zero constant term, and the normalized reciprocal expression evaluates to 0; it is outside the invertible-operator domain.

- `dual_rank_two`: `X²−aX+b` with `b≠0` becomes `X²−(a/b)X+1/b`.
- `sym2_distinct`: For `h₁≠h₂, {2h₁,h₁+h₂,2h₂}` is distinct, so Sym² of regular rank two stays regular.
- `tensor_collision`: `H={0,1}` and `H′={0,−1}` give tensor `H={0,−1,1,0}`, which is not regular.
- `direct_sum_mixed_weights` (README-only: family/pairing carrier): `1⊕ε` has geometric-Frobenius roots 1,p⁻¹ and weights `0,−2`, so is not pure of one weight.
- `exterior_above_rank` (README-only: family/pairing carrier): `∧³` of a rank-two system is the rank-zero system with `Q_v=1` and H empty.

The sources are [BLGGT v1][blggt-2014], §5.1, operations, p. 51 (arXiv v1; printed page = PDF page), §5.1, restriction, p. 53 (arXiv v1; printed page = PDF page).

*Needs:* [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Induction of families](#target-system-operations); PadicHodgeTheory §§5.3–5.4; ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; ArithmeticGaloisRepresentations Layer 7; [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); PadicHodgeTheory Layer 3.

<a id="target-polarized-operations"></a>
### 1.8 Operations with polarization witnesses

Apply the multiplier and sign formulas of ArithmeticGaloisRepresentations §7.4 memberwise. Write `δ=δ_(F/F⁺)` in the CM setting. Duality has multiplier `μ⁻¹` and the same sign. Tensor product has multiplier `μμ′δ` and sign `εε′`; the quadratic factor corrects the value at complex conjugation while restricting trivially to `G_F`. For nonzero k-th symmetric or exterior powers in characteristic zero use sign `ε^k` and multiplier `μ^kδ^(k−1)`. At `k=0` the unit has multiplier `δ` and sign `+1`, consistent with the integer exponent in that formula.

Direct sums require the same multiplier and signs. A character twist uses `μ` times the extension of `χχ^c` having value `+1` at complex conjugation. Restriction requires compatible CM fields and real subfields. Induction requires a specified extension of the multiplier and a check of the induced perfect pairing and sign. Check regularity and irreducibility independently of these pairing constructions.

The construction has the following API:

- `PolarizedSystem.tensor`: Tensor pairings and multiplier `μμ′δ`; signs multiply.
- `PolarizedSystem.dual`: Dual perfect pairings and inverse multiplier.
- `PolarizedSystem.twist`: Twist by `χ` with norm-character multiplier correction.
- `PolarizedSystem.power`: Symmetric/exterior k-th pairing with `μ^kδ^(k−1)` and `ε^k`.
- `PolarizedSystem.tensor_isTotallyOdd`: Two totally odd CM systems yield a totally odd normalized tensor system.

**Checks.**

- `polarized_tensor_sign`: `ε=ε′=+1, μ(c)=μ′(c)=−1`: uncorrected product has `μμ′(c)=+1`; corrected `μμ′δ(c)=−1`.
- `polarized_dual_sign`: Inverse of `a −1` multiplier at c is `−1`, matching the unchanged `+1` sign.
- `polarized_unit_tensor`: The polarized CM unit has `μ=δ`; tensoring it with `(ℛ,μ)` gives `μδδ=μ`.
- `polarized_sum_mismatch` (README-only: family/pairing carrier): A block sum of pairings with signs `+1` and `−1` is neither symmetric nor alternating; there is no common sign without changing the inputs.

The sources are [BLGGT v4][blggt-2014-v4], §2.1, p.31; §5.1, p.62; tensor-product use in §4.3.

*Needs:* [Layer 1, Polarized weakly compatible families](#target-polarized-system); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); ArithmeticGaloisRepresentations Layer 7.

<a id="target-character-system"></a>
### 1.9 Algebraic character families

Use a type-A₀ algebraic Hecke character `χ` of F, with a number field M containing its algebraic finite values, to assemble the common-coefficient rank-one family of its l-adic realizations. It is de Rham at every coefficient place and crystalline outside the finite conductor set. If its connected-infinity character is `∏_τ(τx)^(−a_τ)`, its labeled Hodge multiset is `{a_τ}`. The good geometric-Frobenius polynomial comes from the common algebraic character value and the fixed reciprocity convention.

Conversely, a finitely ramified de Rham l-adic character is the avatar of such a Hecke character after enlarging the coefficient field. Import Hecke characters and their infinity types from GlobalNumberFields Layers 9–10 and reciprocity from ClassFieldTheory Layer 11, whose arithmetic normalization is composed with inversion for geometric Frobenius. The l-adic character of an algebraic Hecke character, its Hodge–Tate numbers and its weight are AutomorphicGaloisRepresentationsPartII AG2.0 (`AlgHeckeChar.galoisChar`); the converse is AutomorphicGaloisRepresentations §3.13 (`geometricCharacter_isHeckeAvatar`). This target assembles these realizations over one coefficient field into a family.

The construction has the following API:

- `characterSystem`: Assemble the common-field rank-one family from the owner’s algebraic Hecke character realizations.
- `characterSystem_hodge`: `H_τ={a_τ}` for connected-infinity exponent `−a_τ`.
- `characterSystem_frob`: The common linear polynomial matches the geometric Frobenius value with the chosen Artin convention.
- `characterSystem_unique`: Unique up to memberwise representation isomorphism from good Frobenius polynomials.

**Checks.**

- `character_trivial`: `χ=1` gives `Q_v=X−1, H={0}`, weight 0.
- `character_cyclotomic`: The algebraic idele norm `||·||_F` gives the cyclotomic family in the geometric Artin convention: `H={−1}, Q_p=X−p⁻¹`, pure weight `−2`.
- `character_finite_order`: A finite-order Hecke character has `H={0}`, all good roots roots of unity, and weight 0.
- `character_non_algebraic`: An arbitrary continuous character with nonintegral infinity exponent has no type-A₀ algebraic realization theorem and is not accepted by this constructor.

The sources are [BLGGT v4][blggt-2014-v4], Appendix A.2, p.87, before Lemma A.2.1; [ACC+][acc-2023], §7.1, pp.1085,1092.

*Needs:* GlobalNumberFields Layers 9–10; AutomorphicGaloisRepresentationsPartII Layer AG2.0 (`AlgHeckeChar.galoisChar`, `AlgHeckeChar.hodgeTate_galoisChar`, `AlgHeckeChar.wt`); `AutomorphicGaloisRepresentations` §3.13; [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); ArithmeticGaloisRepresentations Layer 1; ClassFieldTheory Layers 5 and 7–12.

<a id="target-rank-one-purity"></a>
### 1.10 Rank-one purity

Every rank-one weak system is pure of some integer weight w, and the same holds for rank-one extremely weak data with their determinant Hodge condition. Character classification (AutomorphicGaloisRepresentations §3.13) gives a single w with `a_(cτ)+a_τ=w` and `|ιr(Frob_v)|²=q_v^w` at every good v and complex embedding; the infinity-type identity is the purity of algebraic Hecke characters (`HeckeCharacter/Purity.lean` in Tau Ceti, and GlobalNumberFields Layer 10), and the Galois-side weight is AG2.0's `AlgHeckeChar.wt`. Algebraic Hecke-character theory also supplies pure local WD parameters. The algebraicity/Hodge hypothesis is necessary; arbitrary continuous character data do not carry this purity assertion.

Prove it as `rank_one_purity`.

The sources are [BLGGT v4][blggt-2014-v4], Appendix A.2, p.87, items (1),(2),(8); [ACC+][acc-2023], §7.1, p.1092, purity paragraph.

*Needs:* [Layer 1, Algebraic character families](#target-character-system); [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data); `AutomorphicGaloisRepresentations` §3.13; AutomorphicGaloisRepresentationsPartII Layer AG2.0; `TauCeti.GlobalNumberFields.HeckeCharacter.exists_weight` (purity of infinity types); ClassFieldTheory Layers 5 and 7–12.

<a id="target-induced-character-purity"></a>
### 1.11 Purity of induced character families

For finite F′/F, induction of a pure rank-one character system of weight w is pure of weight w, using the canonical Hodge data H_τ=⊔_(σ|τ)H_σ and adjoining extension ramification to S. In a residue-degree-f block an induced Frobenius eigenvalue `β` satisfies `β^f=α_w`. Since `q_w=q_v^f`, the absolute-value condition descends to `|ιβ|²=q_v^w`. The same conclusion holds for extremely weak rank-one character input with these transported Hodge multisets. It gives neither regularity nor irreducibility, and does not permit freely chosen higher-rank Hodge metadata with only the right total sum.

Prove it as `induced_character_purity`.

The sources are [ACC+][acc-2023], §7.1, p.1092, purity paragraph; [BLGGT v4][blggt-2014-v4], §5.1, pp.62–63.

*Needs:* [Layer 1, Rank-one purity](#target-rank-one-purity); [Layer 1, Induction of families](#target-system-operations); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-artin-system"></a>
### 1.12 Artin families

Given a finite quotient `Γ` of `G_F` and a characteristic-zero representation a of `Γ` over a number field M, extend coefficients at every finite place of M to construct its Artin family. Put in S all primes ramified in the quotient. Each member has finite image and is de Rham and potentially unramified, with n zero Hodge–Tate weights; it is crystalline at coefficient places outside S. Good Frobenius eigenvalues are roots of unity and the common polynomials are those of `a(Frob_v)`. The family has weight zero, with no automatic irreducibility or regularity conclusion.

The construction has the following API:

- `artinSystem`: Extend the given finite-quotient number-field representation to every coefficient place.
- `artinSystem_hodge`: `H_τ` is n copies of zero.
- `artinSystem_charpoly`: `Q_v` is the characteristic polynomial of the finite quotient Frobenius element.
- `artinSystem_pure`: The Artin family is pure of weight 0 with finite-monodromy local WD data.

**Checks.**

- `artin_trivial`: The trivial rank-one quotient gives `Q_v=X−1` and `H={0}`.
- `artin_quadratic`: For a quadratic character, good `Q_v` is `X−1` at split primes, `X+1` at inert primes.
- `artin_rank_two_irregular`: Any rank-two Artin family has `H={0,0}`, so it is not regular, even when its finite-group representation is irreducible.
- `artin_roots_unity`: Finite-order matrices have eigenvalues roots of unity under every complex embedding; their absolute value is 1.

The sources are [ACC+][acc-2023], §7.1, pp.1086,1092.

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 7; PadicHodgeTheory Layer 3; `mathlib:Representation`; `mathlib:LinearMap.charpoly`.

<a id="target-artin-twist-purity"></a>
### 1.13 Purity of Artin families up to twist

If `ℛ` is the tensor of a rank-n Artin system and a rank-one algebraic character system of weight w, it is pure of weight w with the canonical Hodge multisets consisting of n copies of the character's Hodge number. Good eigenvalues are roots of unity times the character value. Apply the same argument to an `ACC+` rank-two extremely weak system Artin up to twist only when the actual character twist and canonical Hodge data, or a very weak realization, identify that family. A determinant sum alone does not force higher-rank Hodge purity.

Prove it as `artin_twist_purity`.

The sources are [ACC+][acc-2023], §7.1, pp.1086,1092.

*Needs:* [Layer 1, Artin families](#target-artin-system); [Layer 1, Rank-one purity](#target-rank-one-purity); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-rank-two-reducibility-independent-of-lambda"></a>
### 1.14 Independence of characteristic-zero reducibility

For a rank-two weak system over `ℚ` in Taylor's sense, absolute reducibility of a characteristic-zero member implies absolute reducibility of every member. Classify its two one-dimensional Hodge–Tate constituents as finite-order characters times cyclotomic powers (AutomorphicGaloisRepresentations §3.13, `geometricCharacter_totallyReal`), extend them to algebraic Hecke-character systems, and compare their direct sum with the original family by good Frobenius polynomials. This is a theorem about characteristic-zero members, not the exceptional primes of residual reducibility.

Prove it as `rank_two_reducibility_independent_of_lambda`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §6, before Lemma 6.5, p. 773 (PDF page 45), §6, after Lemma 6.5, p. 774 (PDF page 46).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; `AutomorphicGaloisRepresentations` §3.13; [Layer 1, Algebraic character families](#target-character-system); [Layer 1, Very weak and extremely weak families](#target-weakened-compatible-data).

<a id="target-system-l-functions"></a>
### 1.15 L-functions and archimedean factors

For an embedding `ι:M↪ℂ`, define `L^S(ιℛ,s)=∏_(v∉S) q_v^(ns)/ιQ_v(q_v^s)`. Purity of weight w gives convergence and analyticity on `Re(s)>1+w/2`. Here `q_v>1` and every root of `ιQ_v` has modulus `q_v^(w/2)`, whereas `|q_v^s|=q_v^Re(s)`; hence the denominator is nonzero in this half-plane. When S contains every place above l, the partial function is determined by `r_λ`. For an away-coefficient strictly compatible system define the full finite Euler product using `WD_v`; it differs from `L^S` at only finitely many factors.

For a regular pure system use the following archimedean factors, with `Γ_R(s)=π^(−s/2)Γ(s/2)` and `Γ_C(s)=2(2π)^(−s)Γ(s)=Γ_R(s)Γ_R(s+1)`. At a complex place with embeddings `τ,τ′`, put

`L_v(s)=Γ_C(s−w/2)^n ∏_(h∈H_τ,h<w/2) Γ_C(s−h)/Γ_C(s−w/2) ∏_(h∈H_τ′,h<w/2) Γ_C(s−h)/Γ_C(s−w/2)`.

`ε_v=i^(Σ_(h∈H_τ)|h−w/2|+Σ_(h∈H_τ′)|h−w/2|)`.

At a real place let `d_+=d_−=n/2` for even n; for odd n and even w let `d_±=(n±(−1)^(w/2)det ℛ(c_v))/2`. Put

`L_v(s)=Γ_R(s−w/2)^(d_+) Γ_R(s+1−w/2)^(d_−) ∏_(h∈H_τ,h<w/2) Γ_C(s−h)/Γ_C(s−w/2)`.

`ε_v=i^(d_−+Σ_(h∈H_τ)|h−w/2|)`.

Complete the function by `Λ=L∏_(v|∞)L_v` and define the global ε-factor as the product of local WD ε-factors and these infinite factors, using the standard additive character of `A_F/F`. Interpret the archimedean quotient formulas as meromorphic expressions, with cancellation before evaluation at removable singularities. Evaluating the displayed quotients with Mathlib’s total complex Gamma functions agrees with the meromorphic expression only where `Γ_C(s−w/2)` is nonzero, namely `s−w/2∉{0,−1,−2,…}`. At other arguments use the continued, cancelled factor. The real-place formulas for d± are interpreted as multiplicities only for `det(c_v)∈{−1,1}` and, when n is odd, even w. These formulas use BLGGT v4; its v1 separate Hodge-factor expression is not used for odd w. Do not infer a functional equation for every system merely from defining its completed function.

The construction has the following API:

- `partialLFunction`: `L^S(ıℛ, s)` as an Euler product.
- `lFunction`: `L(ıℛ, s)` for strictly compatible `ℛ`.
- Archimedean L-factors: `L_v(ıℛ, s)` at complex and real v in BLGGT v4's form, through Complex.Gammaℝ and Complex.Gammaℂ.
- Archimedean root numbers: `ε_v(ıℛ, ψ_v, s) = i^{Σ|h − w/2|}` (complex v) or `i^{d− + Σ|h − w/2|}` (real v).
- Real-place multiplicities: `d±` at a real place: n/2, or `(n ± (−1)^{w/2}det ℛ(c_v))/2` for n odd.
- `completedLFunction`: `Λ(ıℛ, s)` and `ε(ıℛ, s)`.
- `partialLFunction_converges`: Convergence on `Re s > 1 + w/2` for pure `ℛ`.
- `partialLFunction_eq_of_lambda`: `L^S(ıℛ, s) = L^S(ı̃r_λ, s)` when S contains the places above l.

**Checks.**

- `trivial_character`: `F = ℚ, n = 1, r_λ` trivial: `w = 0, d+ = 1, d− = 0, H = {0}` has no `h < 0`, so `L_∞ = Γ_ℝ(s)` and `ε_∞ = 1`; `Λ(ı1, s) = Γ_ℝ(s)ζ(s)` is completedRiemannZeta, and `Λ(1 − s) = Λ(s)` is the functional equation with `ε = 1`.
- `gamma_duplication`: `Γ_ℂ(s) = Γ_ℝ(s)Γ_ℝ(s + 1)` is Mathlib's Complex.Gammaℝ_mul_Gammaℝ_add_one.
- `cyclotomic_character`: `F = ℚ, r_λ = ε_l` in BLGGT's conventions (`Frob_v` geometric, `HT_τ(ε_l) = {−1}`): `Q_p(X) = X − p^{−1}`, weight `−2, L^S(ıε_l, s) = ζ^S(s + 1)`; `d+ = (1 + (−1)(−1))/2 = 1, d− = 0`, so `L_∞ = Γ_ℝ(s + 1)` and `ε_∞ = i^{0 + |−1 + 1|} = 1`.
- `elliptic_curve_gamma_factor`: `F = ℚ, ℛ = H¹` of an elliptic curve: `n = 2, w = 1, H = {0, 1}, d± = 1`, so `L_∞ = Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)·Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s)` as a meromorphic function, and pointwise when s−1/2∉{0,−1,−2,…}; `ε_∞ = i^{1 + 1/2 + 1/2} = −1`. v1's Hodge factor is undefined here (w odd).
- `gamma_quotient_at_pole`: at `s=1/2` the raw quotient helper for `H={0,1}, w=1` gives 0 because `Γ_C(0)=0` in Mathlib’s total convention, while the cancelled factor `Γ_C(1/2)` is nonzero. Thus the unconditional pointwise identity fails.
- `archimedean_parity`: rank one with `w=0` and `det(c)=−1` gives `(d+,d−)=(0,1)` and epsilon i; rank two with `w=1` has (1,1). Rank zero with empty Hodge multisets gives factor and epsilon 1.
- `gamma_complex_pair`: at a complex place H=Hbar={0}, `w=0` gives `Γ_C(s)`; its epsilon is 1. For H=Hbar={0,1}, `w=1` the continued factor is `Γ_C(s)^2` and epsilon `−1`.

The sources are [BLGGT v1][blggt-2014], §5.1, pp. 52–53 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.1, pp. 63–64 (arXiv v4).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); PadicHodgeTheory §§5.3–5.4; ArithmeticGaloisRepresentations §2.5; ArithmeticGaloisRepresentations §2.7; `mathlib:Complex.Gammaℝ`; `mathlib:Complex.Gammaℂ`; `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one`.

<a id="target-galois-grothendieck-ring"></a>
### 1.16 The arithmetic representation ring

For a number field F and prime l, form the arithmetic specialization `Rep_(F,l)` by retaining continuous, finitely ramified objects and identifying each representation with its semisimplification. These conditions and relations distinguish it from the ambient split Grothendieck ring: a nontrivial unipotent extension of 1 by 1 has class 2[1] here, whereas the split ring does not impose that relation. Equivalently use the additive Grothendieck group of finite-dimensional semisimple continuous Q̄_l-representations of `G_F`, unramified almost everywhere. Semisimplified tensor product gives its commutative ring structure. Cancellation follows from trace recognition. Trace at `σ` is a ring homomorphism; `dim=tr(1)` takes integral values. The symmetric Hom pairing satisfies `([U],[V])=dim Hom_(G_F)(U,V)`, and for a virtual class `A=Σn_i[V_i]` in the irreducible basis, `(A,A)=Σn_i²`. Hence `(A,A)=1` and `dim A>0` force A to be a genuine irreducible class.

Supply the product formula along a Zariski-dense map into `G₁×G₂`, conjugation, restriction as a ring map, and induction with its trace and dimension formulas. Include the arithmetic projection formula, Frobenius reciprocity, Mackey decomposition and the pairing identity obtained by inflating the finite-group Brauer decomposition. For an unramified-outside-S virtual class, with S containing places above l, define `L^S` multiplicatively on the irreducible multiplicities; induction gives `L^S(Ind A)=L^(S′)(A)`. The additive multiplicity lattice can use `Finsupp`; its pointwise multiplication is not the tensor-product ring law.

The construction has the following API:

- `RepRing`: `Rep_{F,l}` with ⊗ as multiplication.
- `RepRing.trace`: `tr σ` : `Rep_{F,l} → ℚ̄_l`, a ring homomorphism.
- `RepRing.pairing`: `(A, B) = dim Hom`, extended bilinearly.
- `RepRing.eq_irreducible_of_pairing_eq_one`: Positive dimension and `(A,A)=1` imply A is the class of one genuine irreducible; expand A in the irreducible basis and use `Σn_i²=1`.
- `RepRing.res`: Restriction, a ring homomorphism.
- `RepRing.ind`: Induction with trace formula, projection formula, Frobenius reciprocity and Mackey.
- `RepRing.brauer_transport`: Inflate the supplied finite-quotient Brauer decomposition and use the arithmetic projection formula to obtain `A = Σ n_i ind([ı^{−1}ψ_i] res A)`.
- `RepRing.partialLFunction`: `L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}`, additive and inductive.

**Checks.**

- `pairing_norm`: `A = 2[V₁] − [V₂]` with V₁ ≇ V₂ irreducible: `(A, A) = 4 + 1 = 5`, and dim `A = 2 dim V₁ − dim V₂` may be negative.
- `trivial_class`: [1] is the unit, with `(1, 1) = 1` and `dim 1 = 1`.
- `induced_dimension`: `dim ind_{F′/F}[1] = [F′ : F]`, and `(ind[1], [1]) = 1` by Frobenius reciprocity.
- `virtual_not_genuine`: For the virtual C₂ class `A=3·1−ε, dim A=2` but `(A,A)=10`; rank two alone fails genuineness. Norm-one plus positive dimension is the criterion actually used.

The sources are [BLGGT v1][blggt-2014], §5.4, items (1)–(9), pp. 61–63 (arXiv v1).

*Needs:* [Layer 1, L-functions and archimedean factors](#target-system-l-functions); [Layer 1, Induction of families](#target-system-operations); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 7; `mathlib:Rep.indResAdjunction`; RepresentationTheory/InductionRestriction Layer 6.

<a id="target-monodromy-component-field"></a>
### 1.17 The common monodromy component field

For any weak system there is a single finite Galois F⁰/F identifying Gal(F⁰/F) with `G_λ/G_λ⁰` for every `λ`. If the system is regular, constituents restricted to an open subgroup have multiplicity one. After one finite extension of the coefficient field, every such constituent is defined over the corresponding completed coefficient field and admits a stable integral lattice. The result guarantees existence and coefficient descent; it chooses no canonical lattice. The split-eigenvalue descent criterion is part of its proof.

Use `componentKernelIndependent` in the following form. For each finite-index open `H⊆G_F` and coset `γH`, take the Zariski closure of its characteristic-polynomial image. Common good Frobenius polynomials make this an E-defined variety independent of the coefficient place. The identity-component image has the same property. A component coset has the same characteristic-polynomial image as the identity component exactly when it is that component (Larsen–Pink §4, Proposition 4.9 and Lemma 4.10, p. 11). Thus membership of `γ` in the inverse image of the identity component is independent of the coefficient place. This common open normal kernel cuts out F⁰. For coefficients E rather than `ℚ`, carry out the characteristic-polynomial argument over E with the chosen embeddings, as in BLGGT Lemma 5.3.1; restriction of scalars without tracking these embeddings would not identify the desired component kernel.

For the regularity assertion, the Hodge–Tate cocharacter has n distinct weights in the natural representation. Its image lies in `G_λ⁰` after extending scalars to the completed algebraic closure. Import PadicHodgeTheory §4.4’s Sen Lie-algebra theorem, including coefficient restriction of scalars: for `K/ℚ_l` finite and a Hodge–Tate representation V of `G_K` over a finite extension of `ℚ_l`, the Sen operator `Θ_V` lies in `Lie(ρ(G_K))⊗C` (Sen's Theorem 1). Containment in the inertia Lie algebra implies containment in the monodromy Lie algebra; export this comparison as `hodgeTateCocharacterInMonodromy`. Its eigenvalues are the Hodge–Tate weights, so for a Hodge–Tate member with n distinct weights the Lie algebra of `G_λ⁰` contains, after extension of scalars to C, a semisimple element with n distinct eigenvalues. The Sen module, operator and inertia Lie-algebra theorem are PadicHodgeTheory's; here derive `regularMonodromyDistinctWeights` from them. ArithmeticGaloisRepresentations §7.6 supplies only the Zariski closure, its identity component and the component field. A maximal torus therefore has n distinct weights. This implies multiplicity one and supplies an element of `G_λ⁰` with n distinct eigenvalues. Frobenius density supplies two good split primes of different residue characteristic with this property; adjoining the roots of their two E-polynomials gives one coefficient extension working for every `λ`. Every open subgroup has Zariski closure containing `G_λ⁰`, so BLGGT Appendix A.1 Lemma A.1.5 applies to all its subrepresentations. Compactness then supplies stable lattices.

The API `componentKernelIndependent` returns the common kernel and its quotient identifications, `hodgeTateCocharacterInMonodromy` the Sen-operator statement above, `regularMonodromyDistinctWeights` returns the torus-weight condition, and `constituentsDescendAfterCoefficientExtension` returns the single coefficient extension and the quantified descent/lattice assertion. **Checks.** A finite Artin system has F⁰ equal to its kernel field. The regular sum `1⊕ε` has connected torus monodromy and multiplicity-one constituents. The nonregular sum `1⊕1` has multiplicity two, so cannot satisfy the regular conclusion. A single Frobenius polynomial at residue characteristic q cannot supply the argument for coefficient places above q; the second polynomial is essential. For the cyclotomic character the Sen operator is the scalar 1 (with `HT(ε)=+1` in Sen's convention), whereas a finite-image character has Sen operator zero: a test placing a nonzero Sen operator in the Lie algebra of a finite image fails.

Prove it as `monodromy_component_field`.

The sources are [BLGGT v4][blggt-2014-v4], Lemma 5.3.1, pp.70–71, Appendix A.1 Lemma A.1.5, p.85; [Larsen–Pink][larsen-pink], §6, Lemma 6.11 and Propositions 6.12, 6.14, pp.14–15. The Hodge–Tate cocharacter statement is [Sen 1973][sen-1973], Theorem 1, as applied in the proof of BLGGT v4 Lemma 5.3.1, p.71; Frobenius compatibility alone does not give it.

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); ArithmeticGaloisRepresentations Layer 7 (§7.6: Zariski closure, identity component and component field of one representation); ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; ArithmeticGaloisRepresentations §1.6; PadicHodgeTheory §4.4 (the Sen module, operator and Sen Lie-algebra theorem, including coefficient restriction of scalars).

<a id="target-larsen-rational-system-groups"></a>
### 1.18 Rational-system monodromy data

For a rational weak system `r_l:G_F→GL_n(ℚ_l)`, form its algebraic monodromy group `G_l`, reductive identity component `G_l⁰`, image `Γ_l`, and `Γ_l⁰=Γ_l∩G_l⁰(ℚ_l)`. Include the common component field F⁰/F with `Gal(F⁰/F)≅Γ_l/Γ_l⁰`. Let `Z_l, G_l^der, G_l^ad, C_l` and `G_l^sc` be respectively the connected centre `Z(G_l⁰)⁰`, derived group, adjoint quotient, abelian quotient and simply connected cover. Use the finite central isogeny `H_l=G_l^sc×Z_l→G_l⁰`; the full centre can be disconnected.

Define `Γ_l^Z=Γ_l⁰∩Z_l(ℚ_l)`, `Γ_l^C` as the image in `C_l(ℚ_l)`, `Γ_l⁰⁰=Γ_l⁰∩im(H_l(ℚ_l)→G_l⁰(ℚ_l))`, and `Γ_l^H` as its preimage in `H_l(ℚ_l)`. Conjugation preserves the connected centre and these subgroups. The character-lattice inclusions use this connected centre, with A(n) clearing the kernels of both central isogenies. Choose maximal tori and constants A(n),B(n): the kernel orders of `G_l^sc→G_l^ad`, `H_l→G_l⁰` and `Z_l→C_l` divide A(n); `X*(T^ad)⊆X*(T^der)⊆X*(T^sc)⊆A(n)⁻¹X*(T^ad)`; and B(n) bounds the relevant representation weights. Put `O_(F⁰,l)=∏_(v|l) O_(F⁰_v)`, `S̃_(F⁰,l)=Res_(O_(F⁰,l)/ℤ_l) G_m` and `S_(F⁰,l)=S̃_(F⁰,l)×_(ℤ_l)ℚ_l`. Its geometric character group has basis `Hom(F⁰,ℚ̄_l)`. Supply Serre's `θ_l:S_(F⁰,l)→C_l`, agreeing with (`r_l mod` G_l^der)∘Art_(F⁰) on an open subgroup of `O_(F⁰,l)^×`. Construct it from the abelian representation `r_l mod G_l^der` of `G_(F⁰)` into the torus `C_l`: after a finite extension splitting `C_l`, every character of `C_l` composed with it is a geometric character, hence the avatar of an algebraic Hecke character (AutomorphicGaloisRepresentations §3.13), and the infinity types of these characters define the algebraic homomorphism `θ_l`. The group constructions depend on the actual rational members and their Zariski closures.

The construction has the following API:

- `LarsenData.G`: `G_l`, the Zariski closure of the image, with `G⁰_l, Z_l, G^der_l, G^ad_l, C_l, G^sc_l, H_l`.
- `LarsenData.componentField`: F⁰/F with `Gal(F⁰/F) ≅ Γ_l/Γ⁰_l` for every l.
- `LarsenData.gammaH`: `Γ^H_l ⊆ H_l(Q_l)`, the preimage of `Γ⁰⁰_l`.
- `LarsenData.A`: A(n) divisible by the kernel orders of `G_l^sc→G_l^ad`, `H_l→G_l⁰` and `Z_l→C_l`, uniformly in `ℛ` and l.
- `LarsenData.theta`: `θ_l` : `S_{F⁰,l} → C_l`.

**Checks.**

- `torus_case`: CM-type systems: `G⁰_l` a torus, `H_l = Z_l`, and `Γ^H_l = Γ^Z_l`.
- `gl2_case`: For a non-CM elliptic curve over `ℚ`: `G⁰_ℓ=GL₂, G^sc_ℓ=SL₂, Z_ℓ=𝔾_m, C_ℓ=𝔾_m` via det. The kernel of `SL₂→PGL₂` has order 2, so 2 divides a uniform A(2); no universal choice `A(2)=2` is asserted.
- `disconnected_centre`: `G_l⁰=SO₄` has full centre `μ₂` but connected centre 1; `Spin₄→SO₄` is the finite central cover. The tensor of the two non-CM elliptic families of conductors 11 and 37, with the cyclotomic normalization removing the similitude, gives this boundary. Treating `μ₂` as a torus fails.
- `restriction_torus`: for `F⁰=ℚ`, `S̃_(F⁰,l)=G_m/ℤ_l` and the generic character lattice is ℤ; for degree d it has d embedding generators.
- `finite_image`: An Artin representation: `G⁰_l = 1`, so F⁰ is the field cut out by `r_l` and all other groups are trivial.
- `theta_bound_depends_on_system`: A(n) and B(n) depend only on n, but `C(ℛ)` and `D(ℛ)` of Lemma 5.2.1 cannot be chosen independently of `ℛ`: for `ℛ = ε^k` over `ℚ (n = 1), θ_l` is x ↦ `x^{±k}`, so its exponent has absolute value |k|.

The sources are [BLGGT v4][blggt-2014-v4], §5.2, pp. 65–66 (arXiv v4).

*Needs:* [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, The common monodromy component field](#target-monodromy-component-field); ArithmeticGaloisRepresentations Layer 7 (§7.6); ReductiveGroups Layer 6 (Layer 6: centre, derived group, adjoint quotient, simply connected cover and central isogenies); `AutomorphicGaloisRepresentations` §3.13; ReductiveGroupsPartII RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-separable-splitting`, `weil-restriction-character-lattices`).

<a id="target-serre-theta-uniform-bounds"></a>
### 1.19 Uniform bounds for Serre's torus map

For the rational-system monodromy data, prove four uniform assertions: `θ_l` is surjective; for l outside S its reciprocity comparison holds on all `O_(F⁰,l)^×`; there is `C(ℛ)`, independent of l, such that (A(n)μ)∘θ_l=Σ_σm_(μ,σ)σ for every central weight `μ`, with `|m_(μ,σ)|<C(ℛ)`; and the torsion of `X*(S_(F⁰,l))/θ_l*X*(C_l)` has cardinality bounded by `D(ℛ)`, also independent of l. Use the actual algebraic tori and character-lattice maps, with the reciprocity and Hodge constraints supplied by their owners. The integral-unit comparison uses `S̃_(F⁰,l)(ℤ_l)=O_(F⁰,l)^×` from §1.18.

Prove it as `serre_theta_uniform_bounds`.

The sources are [BLGGT v4][blggt-2014-v4], §5.2, Lemma 5.2.1 and proof, pp. 66–67 (arXiv v4).

*Needs:* [Layer 1, Rational-system monodromy data](#target-larsen-rational-system-groups).

<a id="target-larsen-good-primes"></a>
### 1.20 Good integral monodromy primes

For a rational weak system choose a Dirichlet-density-one set L with the following integral monodromy properties. For `l∈L, G_l⁰` and its associated groups are unramified; there is a semisimple integral model `G̃_l^sc` with `Γ_l^H=G̃_l^sc(ℤ_l)×Γ_l^Z`; the index `[Z̃_l(ℤ_l):Γ_l^Z]` is uniformly bounded; the conjugation action extends uniquely to `H̃_l=G̃_l^sc×Z̃_l`; and `V_l` has an H̃_l⋊Γ_l-invariant lattice.

After an unramified extension `M_λ/ℚ_l` of uniformly bounded degree, all G_l^sc-irreducible subquotients are defined. In the decomposition `V_l⊗M_λ=⊕V_(λ,i)`, every H̃_l-invariant integral lattice splits into the intersections with these isotypic parts. Their irreducible G̃_l^sc(ℤ_l)-subquotients are absolutely irreducible of the expected constituent dimension and have one common isomorphism class for each i; distinct isotypic parts give distinct classes. These six conclusions are the input to the residual irreducibility theorem.

Keep the proof suppliers separate. `densityOneUnramifiedMonodromy` is Larsen–Pink Proposition 8.9: after restriction to the common connectedness field, a semisimple rational compatible system has unramified connected reductive monodromy for a density-one set of l. The Frobenius-torus splitting fields in §8 give a fixed finite splitting field for these groups; their unramified local splitting degrees are bounded using the finite-order automorphisms of a rank-at-most-n character lattice. `densityOneSimplyConnectedMaximality` is Larsen Theorem 3.17: the inverse image of the derived image in `G_l^sc(ℚ_l)` is hyperspecial maximal compact for a density-one set of l. Intersect these sets. Bogomolov's Hodge–Tate openness theorem supplies openness of `Γ_l` in `G_l(ℚ_l)`, needed for the central image, independently of maximality of the derived image. These are distinct inputs: unramifiedness of the algebraic group alone does not make its Galois image maximal compact.

For extending conjugation, use ReductiveGroupsPartII RG2.3 `hyperspecial-vertices` (Bruhat–Tits II 5.1.40): the smooth connected integral model with reductive special fibre corresponds to the appropriate special building point. Conjugation by `γ∈Γ_l` carries it to the model for `γx`. Its ℤ_l-points are unchanged because `γ` normalizes the lifted derived image. The rational-point/facet comparison in the proof of II 5.2.8 identifies the two facets, hence their special points and models. Prove here `conjugationExtendsIntegralModel`: for these density-one primes and every `γ∈Γ_l` normalizing the lifted derived image, conjugation extends uniquely to the selected simply connected integral model. The facet comparison just described proves the consequence from the supplier contracts. Combine it with uniqueness for unramified torus models of the connected centre `Z_l` to obtain the action on `H̃_l`; the full centre is not assigned a torus model.

For the invariant lattice and its decomposition use the integral highest-weight comparison of Larsen §1.12–§1.13: after uniformly bounded unramified coefficient extension, the finitely many bounded highest weights have integral forms; for sufficiently large l their reductions have the expected dimensions, remain absolutely irreducible and are pairwise nonisomorphic. Compact `Γ_l` permits replacing one model-stable lattice by the sum of its translates. The finite-group representation comparison then forces every model-stable lattice to split along the characteristic-zero isotypic pieces, rather than only a specially chosen lattice. The API `larsenGoodPrimes` returns the density-one set, integral models, action extension and quantified lattice/constituent comparisons together.

**Checks.** For `G_l^sc=SL₂` the subgroup congruent to 1 modulo l is compact open but is not hyperspecial maximal compact, so openness cannot replace Larsen maximality. A torus has trivial simply connected factor and still requires the central-index bound. A fixed finite exceptional set may be removed from a density-one set, but an arbitrary positive-density exceptional set may not. The repeated-weight representation `1⊕1` has a single isotypic summand with multiplicity two; distinct summands, rather than copies within one summand, are what the last assertion separates. A lattice splitting only after tensoring with `ℚ_l` does not satisfy the integral direct-sum accessor. For `conjugationExtendsIntegralModel`, conjugation by the identity extends as the identity; a normalizer of `SL₂(ℤ_l)` preserves its hyperspecial model; a normalizer of a proper congruence subgroup alone does not identify that subgroup with a hyperspecial group.

Prove it as `larsen_good_primes`.

The sources are [BLGGT v4][blggt-2014-v4], §5.2, Proposition 5.2.2 and proof, pp.68–70 (arXiv v4); [Larsen–Pink][larsen-pink], §8, Propositions 8.7–8.9, pp.17–18; [Bruhat–Tits II][bruhat-tits-II], 5.1.40, p.161, and the rational-point comparison in the proof of 5.2.8, p.165. The maximality and lattice inputs are [Larsen 1995][larsen-1995], Theorem 3.17 and §§1.12–1.13, and the openness input is Bogomolov 1980, pp. A701–A703, in the forms in which the proof of BLGGT v4 Proposition 5.2.2 applies them (pp. 65 and 68–69). They are targets of this subsection, stated above as `densityOneSimplyConnectedMaximality` and the openness of `Γ_l`.

*Needs:* [Layer 1, Rational-system monodromy data](#target-larsen-rational-system-groups); [Layer 1, Uniform bounds for Serre's torus map](#target-serre-theta-uniform-bounds); ReductiveGroupsPartII RG2.2–RG2.3 (`facets-and-special-points`, `parahoric-group-scheme`, `unramified-base-change-of-parahorics`, `hyperspecial-vertices`).

<a id="target-residual-irreducibility-density-one"></a>
### 1.21 Density-one residual irreducibility

For a regular weakly compatible system over any number field, there is a Dirichlet-density-one set L of rational primes such that, for every `λ` over `l∈L` and every irreducible subrepresentation s of `r_λ`, the semisimplified reduction s̄ remains irreducible on `G_(F(ζ_l))`. Apply the monodromy and integral-lattice results above after the coefficient-field reduction needed for the general system. The assertion concerns every irreducible constituent, and density one rather than a cofinite set of primes.

Prove it as `residual_irreducibility_density_one`.

The sources are [BLGGT v1][blggt-2014], §5.2, Lemma 5.2.1 and Proposition 5.2.2, pp. 54–58 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.3, Proposition 5.3.2, p. 71 (arXiv v4).

*Needs:* [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Weakly compatible families of arbitrary rank](#target-weakly-compatible-system-rank-n); [Layer 1, The common monodromy component field](#target-monodromy-component-field); [Layer 1, Good integral monodromy primes](#target-larsen-good-primes).

<a id="target-constituents-essentially-self-dual"></a>
### 1.22 Polarized constituents and CM descent

Let F be imaginary CM and `(ℛ,ℳ)` a pure, extremely regular polarized weak system. For finite F′/F and any subrepresentation s of `r_λ|G_F′`, find a CM intermediate field `F⊆F″⊆F′` over which s is invariant and polarized with multiplier `μ_λ|G_(F″⁺)`. Total oddness is inherited when the original pair is totally odd. Purity and extreme regularity make the constituent's Hodge subset stable under polarized duality. Use the CM-base statement of BLGGT v4 Lemma 5.4.5; it applies to reducible subrepresentations as well as irreducible constituents.

The actual polarization witness is required; essential self-duality alone does not replace the signed pairing. Irreducibility of s is not a hypothesis.

Prove it as `constituents_essentially_self_dual`.

The sources are [BLGGT v1][blggt-2014], §5.2, Lemma 5.2.3, pp. 58–59 (arXiv v1); [BLGGT v4][blggt-2014-v4], §5.4, Lemma 5.4.5 and proof, p. 76 (arXiv v4).

*Needs:* [Layer 1, Regularity, purity, strictness and automorphy](#target-compatible-system-predicates); [Layer 1, Linear-algebra operations on families](#target-linear-algebra-operations-on-systems); [Layer 1, Polarized weakly compatible families](#target-polarized-system).

### Examples

The cyclotomic, discriminant-form, rank-zero and elliptic-curve checks distinguish Frobenius, Hodge and Gamma conventions. The theta exponent of a cyclotomic power also tests the dependence of monodromy bounds on the system.

### Dependencies

This layer uses Mathlib and the Tau Ceti library; the Tau Ceti roadmaps ClassFieldTheory, GlobalNumberFields, ReductiveGroups and RepresentationTheory; and the roadmaps ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, PadicHodgeTheory and SmallRamificationAndAbelianVarietyBaseCases. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r23-1"></a>
## Layer 2: Integral points and controlled fields


Build from local point topology and scheme foundations to integral approximation. The curve proof needs its relative Picard and cohomology interfaces; the number-field and function-field field-selection refinements then retain their different completion and constant-field conclusions.

<a id="target-skolem-datum-and-integral-point"></a>
### 2.1 Skolem data and integral points

Let `B = Spec R`, where R is either a ring of S-integers in a number field or the coordinate ring of a smooth connected affine curve over a finite field, and put `K = Frac R`. A Skolem datum consists of a separated, finite-type, surjective map `X → B`, with X irreducible and `X_K` geometrically irreducible; a finite set Σ of places outside Max R; finite Galois extensions `L_v/K_v` for `v ∈ Σ`; and nonempty, open, Gal(L_v/K_v)-invariant sets `Ω_v` of smooth points in `X(L_v)`, using the local analytic topology.

Call the datum complete when Σ ∪ Max R contains every place of K. An integral point is an irreducible closed subscheme `Y ⊆ X` finite and surjective over B, with each `Y ×_R L_v` split into L_v-rational points in `Ω_v`. The equivalent field form uses a finite K′/K, the normalization R′ of R in K′, and `x ∈ X(R′)`: require `K′ ⊗_K L_v ≅ L_v^[K′:K]` **as L_v-algebras**, and require the local image of x to lie in `Ω_v` for every K-embedding `K′ ↪ L_v`. This imposes splitting after extension to `L_v`; it does not require every completion of K′ to equal `L_v`.

The construction has the following API:

- `SkolemDatum`: (f : `X → B, Σ, (L_v), (Ω_v)`) with the conditions above
- `SkolemDatum.IsComplete`: every place of K lies in Σ or Max(R)
- `SkolemDatum.IntegralPoint`: an irreducible closed `Y ⊆ X`, finite surjective over B, L_v-split and inside `Ω_v` for `v ∈ Σ`
- `SkolemDatum.integralPoint_iff`: Existence of a closed integral point is equivalent to existence of a finite extension K′/K and an integral field point with `K′ ⊗_K L_v` split and every local embedding landing in `Ω_v`. This is an equivalence of existence statements, not a bijection of presentations: pass from a field point to its scheme-theoretic image, and from a closed point to its normalization. Completions can be proper subfields of `L_v`.
- `SkolemDatum.enlargeSigma`: After removing a finite set of closed places from B, prescribe nonempty integral local opens over finite Galois `L_v`; closure of an integral point for the enlarged datum is an integral point for the original datum (II 1.10).
- `SkolemDatum.split_iff_algEquiv`: The generic splitting condition means that the multiplication/base-change algebra `K′⊗_K L_v` is isomorphic as an L_v-algebra to a finite product of `L_v`, not that `K′⊗_K K_v` has prescribed factors `L_v`.
- `SkolemDatum.fieldPoint_split`: An integral field point is split after scalar extension to every `L_v` in Σ; expose this without unfolding FieldPoint.
- `SkolemDatum.fieldPoint_local`: For each `v∈Σ` and each K-embedding `K′→L_v`, the induced local point belongs to `Ω_v`.
- `SkolemDatum.isComplete_congr`: Completeness depends only on Σ and Max(R): two data with equal sets have equivalent completeness predicates.
- `SkolemDatum.mapPoint`: For an R-morphism `X→Y` sending each `Ω_v` into the target `Ω_v` and preserving the place data, map normalized field integral points to target field points. This concerns the field-point presentation; geometric image/normalization comparison is separately required. Identity and composition of R-morphisms give the identity and composite maps on the normalized field-point presentation.

**Checks.**

- `skolem_complete_Z`: `R = Z, Σ = {∞}` is complete; `X = G_m, L_∞ = C` and `Ω_∞ = {0 < |z| < 1}` has no integral point, since the norm of an algebraic unit has absolute value 1.
- `skolem_incomplete_Z_half`: `R = ℤ[1/2], Σ = {∞}`: the place 2 lies neither in Σ nor in Max(R), so the datum is incomplete
- `skolem_trivial_X`: `X = B` and `Ω_v` the unique local point: `K′ = K` gives an integral point for every finite Galois `L_v/K_v`, including a nontrivial `L_v`. This distinguishes splitting over `L_v` from requiring completions equal `L_v`.
- `skolem_geometric_irreducibility`: take `X=Spec O_E[1/2]` for a real quadratic `E/ℚ` and select one real embedding as `Ω_∞`. Every extension point contains E and hence has both real embeddings; this datum fails the required conclusion. The generic fibre is irreducible over `ℚ` but not geometrically irreducible.
- `skolem_field_presentation_redundancy`: for `X=B` and Σ empty, `K′=K` and any quadratic K′/K both present the same closed integral point `Y=B`. A bijection between closed points and arbitrary field presentations is false.
- `skolem_open_required`: a single point {x} ⊂ `X(ℚ_p)` of a curve is not v-adically open, so it cannot serve as `Ω_v`
- `skolem_fieldPoint_local`: For an integral field point, every K-embedding of its generic field into every `L_v` with `v∈Σ` gives a local point in `Ω_v`; a definition checking only one embedding fails this test.

The sources are [Moret–Bailly II][moret-bailly-1989-II], 1.1 and Définition 1.2, p. 181, Remarque 1.5, p. 182, Définition 1.2, p. 181, Remarque 1.8, p. 184.

*Needs:* `mathlib:AlgebraicGeometry.Spec`; `mathlib:AlgebraicGeometry.GeometricallyIrreducible`; `mathlib:AlgebraicGeometry.Smooth`; `ReductiveGroupsPartII` RG2.0.1 (the topology on points of schemes over topological rings, `scheme-point-topology`); SchemeAndStackFoundations Layer 4 (models over the ring of integers).

<a id="target-density-of-algebraic-and-separable-local-points"></a>
### 2.2 Local density and integral points

Three density statements support the local conditions. For a finite-type, generically smooth scheme over a local field F, its points over the separable closure `F^s` are dense in its points over an algebraic closure, in the valuation topology. For a flat, surjective finite-type model over the integers A of a nonarchimedean local field F, with generically smooth generic fibre, an integral point exists over the integers A′ of some finite separable F′/F. Finally, if a discretely valued field F has separable completion F̂ and `F_a` is its relative algebraic closure in F̂, then `Z(F_a)` is dense in Z(F̂) for every finite-type F-scheme Z. Retain the separability/excellence assumption in the last statement. In characteristic zero the first density assertion identifies the two point sets.

Prove here also the local inverse function theorem for étale maps over a complete field, including ℝ and ℂ; smooth-map openness follows by local étale coordinates and projection. At archimedean places use this theorem and ordinary finite-dimensional local compactness. **Checks.** The projection `F²→F` is open; an étale coordinate near a point gives a local homeomorphism; the closed immersion `{0}→F` is not smooth and is not open.

Prove it as `density_of_algebraic_local_points`.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 1.6.1 and proof, p. 183, Lemme 2.1, p. 185.

*Needs:* `ReductiveGroupsPartII` RG2.0.1 (scheme-point topology), RG2.0.2 (`points-locally-compact-hausdorff`, `smooth-morphism-open-map`, for nonarchimedean fields); SchemeAndStackFoundations Layer 4; `mathlib:NumberField.FinitePlace`; `mathlib:Algebra.IsAlgebraic`; `mathlib:Algebra.IsSeparable`.

<a id="target-elementary-reductions-of-skolem-data"></a>
### 2.3 Shrinking and enlarging Skolem data

Establish the reductions needed to apply approximation on a curve. Chow's lemma permits a quasi-projective replacement. Removing the closure of a proper closed subset of `X_K` preserves surjectivity and leaves a nonempty open part of each `Ω_v`, so one can arrange that the generic fibre is smooth. For a finite set `T ⊆` Max R, replace B by B \ T and Σ by `Σ ∪ T`. The finite class group makes B \ T affine; local integral points over finite extensions supply the new Galois-stable opens at T. The closure in X of an integral point over the smaller base recovers an integral point for the original datum. The new arithmetic ring is a localization of R. These steps also allow a nonempty smooth open subscheme of X to replace X.

Prove it as `elementary_reductions`.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Remarque 1.4, p. 182, Remarque 1.10, p. 184, Exemple 1.10.1, p. 184.

*Needs:* [Layer 2, Local density and integral points](#target-density-of-algebraic-and-separable-local-points); SchemeAndStackFoundations §4.12 (Chow’s lemma); `ReductiveGroupsPartII` RG2.0.1; GlobalNumberFields Layers 1 and 5–10 (finiteness of the class group).

<a id="target-reduction-to-relative-dimension-one"></a>
### 2.4 Reduction to curves

For quasi-projective `X → B` with smooth generic fibre, construct a one-dimensional closed subset `T ⊆ X` that is quasi-finite and surjective over B and meets every `Ω_v`. When `dim X_K ≥ 2`, a geometrically irreducible hypersurface through `T_K`, regular at its points, gives a closed model X′ with generic dimension one less. Intersecting `Ω_v` with the smooth locus of `X′_K` gives another Skolem datum. Its integral points map to integral points of X; its completeness condition is unchanged. Iterate to relative dimension one. The reductions themselves do not assume incompleteness. The geometric irreducibility of a general hypersurface section through `T_K` is Jouanolou's Bertini irreducibility theorem, in the form of the [Stacks Project, Lemma 37.32.3 (Tag 0G4F)](https://stacks.math.columbia.edu/tag/0G4F); its smoothness on the smooth locus is the Bertini smoothness theorem of the scheme foundations.

Prove it as `reduction_to_curves`.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 2.2, p. 185, Proof of Lemme 2.3, p. 185, 2.4, p. 186.

*Needs:* [Layer 2, Local density and integral points](#target-density-of-algebraic-and-separable-local-points); [Layer 2, Shrinking and enlarging Skolem data](#target-elementary-reductions-of-skolem-data); SchemeAndStackFoundations §§4.12–4.13 (Chow’s lemma and Bertini smoothness); Stacks Project Lemma 37.32.3 (Bertini irreducibility).

<a id="target-generalized-picard-functor-and-effective-divisor-fibration"></a>
### 2.5 Rigidified Picard functors and divisor fibrations

In the smooth quasi-projective curve case, compactify X in a normal projective curve X̄ over B and let Z be the reduced boundary. After shrinking B and adding the removed places to Σ, require X̄ regular, all fibres geometrically integral, and Z regular, finite flat and surjective over B. Thus Z is a Cartier divisor. Write `g = h¹(X̄_K, O)` and `z = deg Z_K > 0`.

Use `RigidifiedLineBundleClass (Z_T ⟶ X̄_T)` as the objectwise classes and form their relative fppf sheaf PG(X̄,Z). Tau Ceti already defines the representatives, compatible-isomorphism quotient and pullback for an arbitrary morphism. The relative sheafification and its degree-d part `PG_d` are the additional constructions here. Tensor product and duality supply the group law. As relative sheaves the sequence is `1 → G_m,B → (π_Z)_*G_m,Z → PG(X̄,Z) → Pic_(X̄/B) → 1`. PG is represented by a smooth separated group scheme locally of finite presentation; generic-fibre representability is sufficient for the approximation argument.

The symmetric power `X^(d)` parametrizes effective Cartier divisors finite flat of degree d and disjoint from Z. Its étale-divisor open `U_d` contains the local set `Ω_v^[d]` of L_v-split divisors supported in `Ω_v`. This set is open and is nonempty when `[L_v:K_v]` divides d. For the convention that the trivialization goes from the restricted line bundle to `O_Z`, invert the nowhere-vanishing section `s_D|_Z`. Sending D to `(O(D),(s_D|_Z)⁻¹)` defines `φ_d` : `X^(d) → PG_d`. For `**d ≥ 2g + z − 1**`, it is locally an affine-space bundle of dimension `d + 1 − g − z`. Keep the relative divisor, sheaf and degree constructions separate from the underlying set of line-bundle isomorphism classes.

The construction has the following API:

- `Picard.generalizedPicard`: The relative fppf sheaf of the existing rigidified line-bundle classes on `(X̄_T,Z_T)`; define its degree grading and the base-change comparison.
- `generalizedPicard_exact`: The relative fppf sequence `1 → G_m,B → (π_Z)_*G_m,Z → PG(X̄,Z) → Pic_(X̄/B) → 1`, with the maps induced by boundary units and forgetting.
- `generalizedPicard_representable`: Under the relative curve and boundary hypotheses above, a smooth separated group scheme locally of finite presentation represents PG; its degree-d component represents `PG_d`.
- `divisorClassMap`: `φ_d` : `X^(d) → PG_d`, sending D to the class of `(O(D),(s_D|_Z)⁻¹)`.
- `divisorClassMap_affineFibration`: For `d ≥ 2g + z − 1, φ_d` is locally an affine-space bundle of dimension `d + 1 − g − z`.
- `omegaDivisors_open`: `Ω_v^[d]` is open in `U_d(K_v)` and nonempty when `[L_v:K_v]` divides d.
- `generalizedPicard_group`: In the relative curve setting the rigidified Picard functor is a commutative group sheaf. The product is `(L⊗M,α⊗β)` through the monoidal pullback comparison; the unit is `(O_X,id)`, and the inverse is `(Lᵛ,αᵛ)` through the duality comparison. Establish representative evaluation, independence of compatible isomorphisms, associativity, commutativity, unit and inverse laws.
- `generalizedPicard_forget_mul` and `generalizedPicard_forget_inv`: The forgetful morphism preserves the tensor product and dual, rather than merely mapping representatives to their classes.
- `generalizedPicard_boundary_units`: Use the existing boundary-unit action and `RigidifiedLineBundleClass.mk_mk_eq_mk_mk_iff`. In the proper geometrically integral relative curve setting their fppf sheafifications identify `(π_Z)_*G_m/G_m` with the kernel sheaf. Objectwise lifting of an arbitrary Picard class is not asserted: exactness is after fppf sheafification.
- `generalizedPicard_pullback`: Extend `RigidifiedLineBundleClass.pullback` to the relative sheaf, preserve unit, product and inverse, and commute with forgetting to the relative Picard functor and with the divisor class map. Import the objectwise identity, composition and forgetful naturality laws.

**Checks.**

- `pg_affine_line` (README-only: relative curve/Picard comparison): `X = 𝔸¹` ⊂ `ℙ¹, Z = {∞}`: `g = 0, z = 1`, and the fibre dimension `d + 1 − g − z = d` is that of monic polynomials of degree d
- `pg_multiplicative` (README-only: relative curve/Picard comparison): `X = G_m` ⊂ `ℙ¹, Z = {0, ∞}`: `g = 0, z = 2`, the degree-0 part is `G_m` (the generalized Jacobian of modulus `0 + ∞`), fibres of dimension `d − 1`
- `pg_small_degree` (README-only: relative curve/Picard comparison): `g = 1, z = 1, d = 1 < 2g + z − 1 = 2`: Lemme 3.6 does not apply
- `pg_trivial_Z` (README-only: relative curve/Picard comparison): The empty boundary recovers the Picard functor; the curve approximation construction instead arranges `z>0`.
- Over `F=𝔽₂(t)`, the regular degree-two boundary `Z=V(x²−t)⊂ℙ¹_F` becomes the dual numbers after algebraic closure. The quotient `Res_(Z/F) 𝔾_m / 𝔾_m` then becomes `𝔾_a`: a unit is `a(1+bε)`, and multiplication adds b. Regular finite flat boundary does not imply a torus.
- `pg_rigidified_iso`: A boundary-compatible line-bundle isomorphism gives equal rigidified classes; literal equality of representatives is unnecessary.
- `pg_boundary_matters` (README-only: relative curve/Picard comparison): Over `ℚ` let `X̄=ℙ¹` and `Z={0,∞}`. Give `O_X̄` the two trivializations (1,1) and (1,2), directed toward `O_Z`. They have the same forgotten class and different rigidified classes: every global bundle automorphism is one scalar `c∈ℚ×`, whereas compatibility would require both `c=1` and `2c=1`. This detects a quotient that forgets the boundary.
- `pg_tensor_dual` (README-only: relative curve/Picard comparison): On the same pair, normalize a trivialization `(a₀,a_∞)` by its ratio `a_∞/a₀`. Classes of ratios 2 and 3 multiply to ratio 6; the dual of ratio 2 has ratio 1/2; ratio 1 is the unit. This fixes both the tensor law and the direction of the trivialization.
- `pg_base_change` (README-only: relative curve/Picard comparison): Base change from `ℚ` to ℚ(√2) sends the ratio-2 class to ratio 2, preserves the product `2·3=6`, and commutes with forgetting. For a ring-valued test with unit a, specialization a↦1 can identify two classes, so no unconditional injectivity of base change is required.
- `pg_divisor_trivialization` (README-only: relative curve/Picard comparison): For an effective divisor disjoint from Z, its canonical section has no zero on Z. Its inverse trivializes `O(D)|_Z` and the resulting class has degree deg(D). A divisor through 0 is excluded for `Z={0,∞}`; using its zero section as a trivialization is impossible.
- `pg_whole_boundary`: rigidification along the identity of X gives one class; forgetting it gives the trivial line-bundle class. These are objectwise checks, distinct from relative fppf exactness.
- `pg_forget_representative`: For `(L,α)`, the forgotten class is LineBundleClass.mk L.

Import `RigidifiedLineBundle`, `RigidifiedLineBundleClass.mk_eq_mk_iff`, `lift`, `lift_mk`, `pullback`, `pullback_id`, `pullback_comp`, `toLineBundleClass` and `toLineBundleClass_pullback` from Tau Ceti (`LineBundle/Rigidified/Basic.lean`), and `mk_mk_eq_mk_mk_iff`, `stabilizer_eq_range` and `range_toLineBundleClass` from `LineBundle/Rigidified/Automorphisms.lean`, all in the `TauCeti.AlgebraicGeometry` namespace. These declarations are imported prerequisites and are not new targets.

The sources are [Moret–Bailly II][moret-bailly-1989-II], 3.1, pp. 186–187, 3.2.4 and Lemme 3.3, p. 187, 3.4, p. 188, Lemme 3.6, p. 189.

*Needs:* [Layer 2, Shrinking and enlarging Skolem data](#target-elementary-reductions-of-skolem-data); SchemeAndStackFoundations Layer 3; `mathlib:AlgebraicGeometry.Scheme.Modules.pullback`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`; `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial`; `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff`; AlgebraicModuliForArithmeticGeometry §7.6.1 (`relativePicardSheaf`) and §7.3 (`rigidification_gm_torsor`); ComplexComparisonPartII §C3.2d.2 (`relative_picard_algebraicSpace`); SchemeAndStackFoundations §3.7 (Picard stacks and high-degree Abel maps).

<a id="target-additive-strong-approximation-away-from-place"></a>
### 2.5a Additive approximation away from one place

For a number field K and any chosen place w, prove `additiveStrongApproximationAwayFromPlace`: the diagonal K is dense in the restricted product of all K_v with v≠w, using O_v at finite places. Concretely, for a finite set T of places disjoint from {w} and containing all archimedean places other than w, arbitrary nonempty local opens at T admit an element of K lying in those opens and integral at every finite v outside T∪{w}. The omitted place can be finite; omitting all archimedean places alone does not give this assertion. Suggested.lean states this finite-open formulation as `additiveStrongApproximationAwayFromPlace`.

For the function-field case import `TauCeti.Place.exists_forall_mem_valuation_sub_le_and_forall_mem_integers` from `TauCeti.FieldTheory.FunctionField.Consequences.StrongApproximation`, with exact finite constants and a proper set of places on which approximation and integrality are imposed. Local-field targets follow by density of K in each completion.

Extend both forms to finite projective R-modules and their torsors: if R is a Skolem base and Σ∪Max(R) omits w, the diagonal module is dense in its product of scalar extensions at Σ. Embed the module as a direct summand of a finite free R-module and project the free-module approximation. A torsor over affine Spec R under such a module has an R-point by vanishing of its first quasi-coherent cohomology, so translation gives the torsor statement.

**Checks.**

- For K=ℚ and w=∞, this recovers density in the finite adeles.
- For K=ℚ, w=2 and T={∞}, elements of ℤ[1/2] approximate every real number while remaining integral at every odd prime; ℤ alone fails this test.
- Omitting no place fails: the real interval (1/4,3/4), together with integrality at every finite prime, contains no rational diagonal point.
- The zero projective module has a one-point product and satisfies the density statement.

The source is [Moret–Bailly II][moret-bailly-1989-II], proof of Lemma 3.8, p.191, citing Cassels–Fröhlich II §15; the function-field source is Stichtenoth, Theorem 1.6.5, in the pinned Tau Ceti module above.

*Needs:* GlobalNumberFields Layers 0–1 and 5–6 (places, weak approximation and finite adeles); RestrictedProducts in Completed Layers 0–2; the pinned Tau Ceti function-field strong-approximation theorem; SchemeAndStackFoundations §2.6 (quasi-coherent cohomology on affine schemes); AlgebraicCurves Layers 0–5 (places and Riemann–Roch).

<a id="target-local-picard-open-sets-and-strong-approximation"></a>
### 2.6 Local Picard opens and approximation

Set `W_v^[d] = φ_d(Ω_v^[d])` in `PG_d(K_v)`. For `d ≥ 2g + z − 1` this is open, and it is nonempty if `[L_v:K_v]` divides d. If `d ≥ 2g + z` and `d′ ≥ 0`, multiplication of rigidified classes sends `W_v^[d] × W_v^[d′]` into `W_v^[d+d′]`. The multiplication bound is one larger than the affine-bundle bound.

Let an invertible sheaf M of degree `d ≥ 2g + z − 1` and a boundary trivialization `α` have class in every `W_v^[d]`. If the Skolem datum is incomplete, strong approximation in the torsor of global sections s with `α(s|_Z)=1` gives a section whose local divisor belongs to each `Ω_v^[d]`. Every irreducible component of div(s) is an integral point. Use strong approximation for torsors under finite projective R-modules: a finite projective R-module is a direct summand of a free one, so this reduces to additive strong approximation for the adeles away from one omitted place, which is where incompleteness enters. Use it together with the section/base-change and vanishing results for this relative curve.

Prove it as `local_picard_opens_and_approximation`.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 3.7.2(ii), p. 190, Proof of Lemme 3.8, p. 191.

*Needs:* [Layer 2, Rigidified Picard functors and divisor fibrations](#target-generalized-picard-functor-and-effective-divisor-fibration); §2.5a (`additiveStrongApproximationAwayFromPlace`, the imported function-field strong approximation, and their projective-module/torsor forms); SchemeAndStackFoundations Layer 3 (cohomology and base change for the relative curve).

<a id="target-quasi-compactness-of-the-generalized-jacobian-quotient"></a>
### 2.7 The compact generalized-Jacobian quotient

For an incomplete datum and any ample line bundle M₀ on X̄, find a positive tensor power `M₀^⊗n` and a trivialization along Z satisfying the preceding local Picard conditions. Normalize a starting power so its degree d is at least `2g + z`, divisible by all `[L_v:K_v]`, and its restriction to Z is trivial.

The controlling quotient `PG₀(K_Σ)/im Γ(Z,O_Z^×)`, with `K_Σ = ∏_(v∈Σ) K_v` and the product topology, is quasi-compact. Consequently the powers of each element have the identity as an accumulation point. Prove the constituent compactness statements: J(F) is compact for a proper regular geometrically integral curve over a locally compact F; `(R_Z ⊗_R K_Σ)^×/(R_Z^× K_Σ^×)` is quasi-compact; and `K_Σ^×/R^×` is quasi-compact under incompleteness. For the first, pass to a finite separable extension giving the curve a rational point and use the proper compactified Picard space Y of degree-zero rank-one torsion-free sheaves. Regularity of the curve makes every such sheaf over F invertible, so `Y(F)=J(F)`; compactness follows from properness of Y and descends along the finite extension. This does not assert that J itself is proper over an imperfect local field. For number fields the last assertion uses the S-unit logarithm lattice of HeightsAndUnits §§4.2–4.3. For function fields use `functionFieldUnitQuotientCompact` below. Moret–Bailly prints the Jacobian lemma as 3.30.2, although its position and references identify it as 3.10.2.

Prove `functionFieldUnitQuotientCompact`: for K with exact finite constant field, R the coordinate ring of a smooth connected affine curve with function field K, and Σ a proper subset of S∞=Places(K)\Max(R), the quotient `(∏_(v∈Σ) K_v^×)/im R^×` is compact. The valuations of R-units are exactly the principal divisors supported on S∞. Finiteness of the degree-zero divisor class group makes their image finite index in the degree-zero lattice on S∞. Projection to the coordinates in the proper subset Σ has finite-index image in ℤ^Σ: a missing place absorbs the degree equation after multiplication by its degree. Local unit groups are compact, hence so is the quotient. Apply this also to the finite normalizations appearing in the boundary algebra.

**Checks for `functionFieldUnitQuotientCompact`.**

- For K=𝔽_q(t), R=𝔽_q[t,t⁻¹] and Σ={0}, the units t^ℤ remove every valuation, leaving a quotient of the compact local units.
- For the same R and Σ={0,∞}, the degree sum survives as an unbounded ℤ-quotient, so compactness fails; this Σ is not proper.
- For Σ empty the quotient is a point.

Use the following compactification contract for this argument, including its field-of-definition and topology comparisons. Let C/F be a proper regular geometrically integral curve over a locally compact field, and first choose a finite Galois F′/F for which the smooth locus of C has an F′-point x. Such a point exists over a finite separable extension because the smooth locus is nonempty. The curve remains regular after this separable extension. Proper curves over a field are projective, so the projective compactified-Picard construction applies.

- `CurveCompactifiedPicard C χ`: the étale sheaf of families of coherent rank-one torsion-free sheaves on C with geometric fibres of Euler characteristic `χ`, modulo tensoring by line bundles on the test base. Retain flatness over the test base and the geometric-fibre conditions. With `χ=χ(O_C)`, it contains degree-zero invertible sheaves as an open subfunctor. The sheaf is represented by a projective scheme in the present curve setting; a proper algebraic space suffices for the compactness argument.
- `curveCompactifiedPicard_abelPresentation`: present this sheaf as the quotient of a sufficiently negative-Euler-characteristic Quot scheme of the dualizing sheaf, then shift Euler characteristic by tensoring with a sufficiently positive line bundle. Rank-one torsion-free sheaves on integral curves are simple and Cohen–Macaulay. Relative duality and cohomology/base change identify the fibres of the Abel map with projective linear systems; in the vanishing range they are projective spaces and the Abel map is smooth and surjective. The induced equivalence relation is proper, giving a proper quotient. The construction is the compactified Picard construction, not the ordinary Picard representability theorem.
- `curveCompactifiedPicard_rationalPoints`: over F′ use the rigidification at x to obtain a universal sheaf and identify F′-points with actual sheaves. A rank-one torsion-free module over every regular one-dimensional local ring is free. Thus every sheaf representing such an F′-point is invertible; at `χ=χ(O_C)` it has degree zero. Conversely every degree-zero line bundle gives an F′-point. This yields `Y(F′)=J(F′)`. The equality concerns rational points over the regular base curve; it does not say all geometric points of Y are line bundles.
- `curveJacobian_points_compact`: the open immersion `J→Y` induces an open topological embedding on F′-points. Since its image is all of Y(F′), it is a homeomorphism. Projectivity gives compact Hausdorff Y(F′). The usual topology on J(F) is the subspace topology in J(F′), and Galois descent identifies its image with the closed fixed-point set of Gal(F′/F). Hence J(F) is compact. No properness of the group scheme J over an imperfect F is used.

For the quotient construction import the coherent Quot functor, the dualizing sheaf and cohomology/base change from SchemeAndStackFoundations §§4.14, 2.20 and 2.6, and the relative Picard sheaf and its degree grading from AlgebraicModuliForArithmeticGeometry §7.6.1. The specialized compactified-Picard and rational-point comparison above are additional targets required here; they are not identified with the existing `picardZeroSheaf`.

**Checks.**

- For a smooth proper curve, J is an abelian variety and its local points are compact directly.
- Over `F=𝔽₂((t))`, the projective cubic `y²z=x³+tz³` is regular and geometrically integral, but becomes a cuspidal cubic over an algebraic closure. Its geometric Pic⁰ is the additive group, so Pic⁰ is not proper; the compactified-Picard argument is essential.
- With an empty set Σ the product and its quotient are trivial, hence compact; no extra nonemptiness hypothesis is needed for this quotient statement.
- For `C=ℙ¹` and `χ=1`, the compactified degree-zero Picard scheme is a point and every rational point represents `O_C`. Choosing `χ=2` instead parametrizes degree-one bundles and must not be identified with J by the degree-zero comparison.
- On a geometrically singular integral curve a rank-one torsion-free sheaf need not be invertible; the ideal of the cusp is a control. Thus the rational-point comparison uses regularity over F′ and cannot be asserted over every field extension.
- Without the section x, a point of the relative Picard sheaf can have a Brauer obstruction to being represented by a line bundle. The universal-sheaf comparison is applied only after the finite separable extension supplying x.

Prove it as `compact_generalized_jacobian_quotient`.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Lemme 3.9, proof, p. 191, Lemme 3.9.2, p. 192, Lemme 3.10.2 (printed 3.30.2), pp. 192–193, and proof of Lemme 3.10.4, p. 193; [Altman–Kleiman, compactified Jacobian][altman-kleiman-1976], Theorems (2)–(4) and the Quot/duality construction, p. 948, with the proper-algebraic-space variant on p. 949.

*Needs:* [Layer 2, Local Picard opens and approximation](#target-local-picard-open-sets-and-strong-approximation); SchemeAndStackFoundations §§3.7, 4.14 and 2.20; ComplexComparisonPartII §§C3.2f.1–C3.2f.2 (`picardZeroSheaf`, `picardZeroCriterion`); `ReductiveGroupsPartII` RG2.0.2 (`points-locally-compact-hausdorff` and proper-point compactness, over nonarchimedean fields); §2.2 (archimedean topology), with projective archimedean points closed in compact projective space; HeightsAndUnits §§4.2–4.3 (number-field S-units and their full logarithmic lattice); AlgebraicCurves Layers 3–5 (divisors, Riemann–Roch and finite degree-zero class group over finite exact constants).

<a id="target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points"></a>
### 2.8 The integral-point theorem

Prove the integral-point theorem for every incomplete Skolem datum with the hypotheses above. The result supplies irreducible `Y ⊆ X` finite and surjective over B, split over each `L_v` and satisfying all local opens; equivalently it supplies K′, its normalization R′ and `x ∈ X(R′)` with the splitting and every-embedding conditions. Incompleteness is essential. Treat Σ = ∅ by the integral-point argument of Rumely's local–global principle; the nonempty-Σ proof uses the local density, curve reduction, rigidified Picard construction, compact quotient and strong approximation developed here. Spreading out also extends the theorem to the localizations of the arithmetic and geometric rings described in Moret–Bailly II Remark 1.7.

Prove it as `moret_bailly_integral_point`.

The sources are [Moret–Bailly II][moret-bailly-1989-II], Théorème 1.3, p. 182, p. 182, after Théorème 1.3; [Moret–Bailly I][moret-bailly-1989-I], Théorème 1.7 (Rumely) and 1.11, pp. 162-163.

*Needs:* [Layer 2, Skolem data and integral points](#target-skolem-datum-and-integral-point); [Layer 2, Reduction to curves](#target-reduction-to-relative-dimension-one); [Layer 2, Local Picard opens and approximation](#target-local-picard-open-sets-and-strong-approximation); [Layer 2, The compact generalized-Jacobian quotient](#target-quasi-compactness-of-the-generalized-jacobian-quotient).

<a id="target-theorem-g-from-moret-bailly"></a>
### 2.9 From integral points to split-field density

Derive the split-field density statement from the integral-point theorem: for a chosen nonempty open `U ⊆ X`, spread U to a smooth surjective model with geometrically integral fibres over an appropriate ring of integers with finitely many primes inverted. Uniform Lang–Weil supplies a rational point on each fibre of sufficiently large residue cardinality; smooth Hensel lifting makes the local integral-point sets nonempty. Invert the finitely many remaining bad primes. Thus nonemptiness outside the prescribed places is a proved input to the Skolem datum, rather than an automatic consequence of spreading out. Enlarge the inverted set until the prescribed places and opens form a Skolem datum, while leaving a place outside both Σ and the closed places. An integral point gives a finite K′ split at S and a point of U(K′) in every prescribed open. Taking all U gives Zariski density. This construction explains why the integral theorem applies even when the conclusion concerns points on a variety over a field.

Prove it as `splitField_density_of_integralPoints`.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Introduction, Theorem G, p. 5; [Poonen][poonen-qpoints], Theorem 7.7.1(ii), p. 222 (uniform Lang–Weil), Theorem 7.7.2, p. 223 (local points outside finitely many places), and Theorem 3.5.63(a), p. 83 (smooth Hensel lifting).

*Needs:* [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Skolem data and integral points](#target-skolem-datum-and-integral-point); SchemeAndStackFoundations Layer 4; InverseGaloisAndArithmeticFundamentalGroups IG.2.5, “The Lang–Weil estimate”, including its bounded-family argument.

<a id="target-taylor-theorem-g-split-completely-points-are-dense"></a>
### 2.10 Split-field density

Fix a number field K and finite set S of places, and let `K_S` be the maximal subextension of a chosen algebraic closure in which every place of S splits completely. For a smooth, geometrically irreducible, quasi-projective X/K with `X(K_v)` nonempty for `v ∈ S`, prove that `X(K_S)` is Zariski dense. More precisely, points can be chosen in any prescribed nonempty local opens and outside a proper closed subset. Each point descends to a finite subextension K′/K; one can subsequently pass to its Galois closure without losing splitting. For `K = ℚ` and S containing infinity, the selected fields are totally real.

Prove it as `splitField_points_dense`.

In Suggested.lean, `maximalSplitExtension` constructs the maximal split extension as a supremum of finite intermediate fields, and `splitField_points_dense` states Zariski density over it. The statement applies to separated smooth schemes of finite type by affine-open reduction. The refinement prescribing local opens uses the scheme-point topology of §2.2.

The sources are [KW II][kw-serre-modularity-II], Proof of Theorem 6.1, ordinary case, p. 56; [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Introduction, Theorem G, pp. 4-5, Introduction, Theorem G, p. 5.

*Needs:* [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, From integral points to split-field density](#target-theorem-g-from-moret-bailly).

<a id="target-function-field-chebotarev"></a>
### 2.11 Chebotarev density for global function fields

Let K be a global function field with constant field `F_q, D/K` a finite Galois extension with group G and constant field `F_(q^d)`, and `C⊆G` a conjugacy class whose image in `Gal(F_(q^d)/F_q)=ℤ/d` is the class of the n-th power of the q-Frobenius. Then for every sufficiently large integer m≡n mod d there is an unramified place of K of degree m whose Frobenius class is C, and the number of such places is (#C/#G)·d·q^m/m+O(q^(m/2)) for m≡n mod d; for m≢n mod d there is none. Fix a finite set of forbidden places; the places produced can avoid it.

Prove it by twisting and the Lang–Weil estimate. Let X be a smooth geometrically connected curve over `F_q` with function field K, and remove the ramified places so that D defines a finite étale Galois cover `Y→X`. The curve Y has d geometric components. For `σ∈C` count the fixed points of `σ⁻¹Frob_q^m` on Y over an algebraic closure. This operator fixes a geometric component exactly when `σ` and `Frob_q^m` have the same action on the constant field; in that case it fixes all d components. Each component, with this twisted descent datum over `F_(q^m)`, is geometrically connected and contributes `q^m+O(q^(m/2))` points. Twisting the whole cover does not make it geometrically connected. Over a point of `X(F_(q^m))` whose Frobenius is conjugate to `σ`, the number of fixed lifts is #Z_G(σ). Thus the leading term before passing to places is d·q^m/#Z_G(σ). Remove the `O(q^(m/2))` points of degree properly dividing m and divide by m to obtain the asserted coefficient d·#C/#G. If the constant-field actions differ, there are no fixed lifts and no places of the required class.

**Checks.**

- `ffcheb_constant_extension`: for `D=K·F_(q^d)` and `C={φ^n}`, the places of degree m have Frobenius `φ^m`, so the class `φ^n` occurs exactly in degrees m≡n mod d; no place of degree m≢n mod d has that Frobenius.
- `ffcheb_trivial_extension`: for `D=K` the statement is the existence of places of every large degree, with count `q^m/m+O(q^(m/2))`.
- `ffcheb_two_components`: for a quadratic constant extension the cover and every twist still have two geometric components. In even degree the identity class has count `q^m/m+O(q^(m/2))`, rather than `q^m/(2m)`; in odd degree it has count zero.
- `ffcheb_number_field_contrast`: in a number field there is no constant-field quotient and every conjugacy class occurs; the function-field statement must retain the congruence condition on the degree.

Prove it as `function_field_chebotarev`.

The sources are [Poonen, rational points][poonen-qpoints], Theorem 7.7.1 (Lang–Weil) and its proof, pp. 222–223; [BHKT][bhkt-published], proof of Proposition 9.2, published p. 78, where the result is applied with two coprime degrees.

*Needs:* SchemeAndStackFoundations §5.11 (`weil_bound`), applied to smooth proper models of the finitely many geometric curve components, with bounded boundary error; SchemeAndStackFoundations §§1.15–1.16 (finite étale Galois covers and twists of torsors); EtaleCohomologyFoundations §§F.0, F.0.A2 (finite covers, monodromy and the arithmetic fundamental-group sequence).

<a id="target-frobenius-primes-generate"></a>
### 2.12 Generating Frobenius primes

For a finite Galois D/K, choose finitely many unramified primes outside any finite forbidden set with representatives of Frobenius conjugacy classes generating Gal(D/K). Use Chebotarev prime existence and, where the geometric application requires it, local nonemptiness at the selected primes. In the function-field case incorporate the image in the constant-field quotient rather than silently imposing a degree restriction that excludes needed Frobenius classes; use the function-field Chebotarev theorem of §2.11. Mathlib’s Frobenius-prime-set definition supplies the carrier; prime existence in number fields is the Chebotarev theorem imported from its owner.

Prove it as `frobenius_primes_generate`.

The sources are [Snowden v1][snowden], §5.2, proof of Proposition 5.2.2, p. 16.

*Needs:* Chebotarev Layer 10; `tauceti:NumberField.Chebotarev.frobeniusPrimeSet`; `ArithmeticGaloisRepresentations` §5.1 (every element of a finite Galois image is a Frobenius at a set of positive density); [Layer 2, Chebotarev density for global function fields](#target-function-field-chebotarev).

<a id="target-forcing-linear-disjointness-by-extra-split-places"></a>
### 2.13 Avoidance by extra split primes

Given a finite Galois avoidance field D/K, add finitely many unramified places outside the forbidden set whose Frobenius elements generate Gal(D/K), and at which the variety has local points. Alternatively, select a nonsplit place for each simple Galois subextension. A finite **Galois** K′/K split at these places is linearly disjoint from D. Indeed `K′ ∩ D` is normal over K, and all chosen Frobenius elements act trivially on it. They generate the quotient, so the intersection is K. For non-Galois avoidance data, first take the normal closure. Prime selection must preserve all originally prescribed local conditions.

Prove it as `disjointness_by_extra_split_places`.

The sources are [KW II][kw-serre-modularity-II], Proof of Theorem 6.1, last paragraph, p. 57; [KW Annals][kw-annals-2009], Proof of Theorem 2.1, p. 234.

*Needs:* [Layer 2, Generating Frobenius primes](#target-frobenius-primes-generate); [Layer 2, Split-field density](#target-taylor-theorem-g-split-completely-points-are-dense); `mathlib:IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

<a id="target-tower-linear-disjointness"></a>
### 2.14 Disjointness through towers

Work inside a common overfield with `C⊆B⊆A` and `C⊆D`. If A and D are linearly disjoint over C, then A and BD are linearly disjoint over B and `A∩BD=B`. Use tensor injectivity and the tower algebra structures to prove the transport. A converse from intersection alone requires the finite Galois hypotheses of Mathlib's `IntermediateField.LinearDisjoint.iff_inf_eq_bot`.

Prove the tensor and intersection conclusions together.

The sources are [Qian][qian], §2 opening facts, preceding Lemma 2.1, p. 5 (arXiv v1).

*Needs:* `mathlib:IntermediateField.LinearDisjoint`; `mathlib:IntermediateField.LinearDisjoint.inf_eq_bot`.

<a id="target-cht-character-extension"></a>
### 2.15 Extending finite local characters

Extend the given finite-order characters at a finite set of completions of a number field, including its infinite places when prescribed, to a continuous finite-order idele class character. The extension with trivial behaviour at infinity is GL2AutomorphicRepresentationsAndTransfer §R16.1.8 (`finite_hecke_full_local_prescription`, the same Lemma 4.1.1); this target adds prescribed components at the infinite places and the p-primary refinement. Use an open subgroup of finite index in the idele class group and extension into the discrete group of algebraic roots of unity. The resulting character may have larger order than the local characters. The p-primary refinement preserves p-primary values, without fixing an exact exponent.

Give the finite-image character target the discrete topology. Include all infinite places in S, extending the local data trivially at newly added ones.

Use GL2AutomorphicRepresentationsAndTransfer §R16.1.7’s `chevalley_power_congruence` and `chevalley_finiteIndex_congruence` for the congruence input: for a number field B, a finite set T of places and `n≥1`, let `Γ` be the units outside the finite places of T, positive at the real places outside T. There is an open subgroup U of `∏_(v finite,v∉T)` `O_(B_v)^×` with `Γ∩U⊆Γⁿ`. In particular every finite-index subgroup of `Γ` contains a congruence neighbourhood. This is Taylor's [Ta2, Lemma 2.1], in his icosahedral Artin paper.

Here is a proof using the existing S-unit and Chebotarev suppliers. Enlarge T to include the infinite places and pass to `B′=B(i)`, with `Γ′` its full S-unit group. Both groups are finitely generated abelian: the valuation map of an S-unit group has kernel the ordinary unit group and image a subgroup of the finite-rank lattice on S, so Dirichlet’s unit theorem suffices. The subgroup theorem in Smith normal form gives N with `Γ∩(Γ′)ᴺ⊆Γⁿ`. For each prime-power factor m of `N, Gal(B′(ζ_m)/B′)` is cyclic: at odd primes use cyclicity of `(ℤ/m)×`, and at 2 use `i∈B′`. If `a∈B′×` is an m-th power in every completion outside a finite set, every element of the Galois group of its splitting field acts on the roots of `Xᵐ−a` with a fixed point, by Chebotarev. The kernel over `B′(ζ_m)` acts by translations on the roots, so is trivial. The remaining group is cyclic, and a generator fixing a root makes that root B′-rational. A root of an S-unit is again an S-unit. Thus each nontrivial class in `Γ′/(Γ′)ᴺ` is detected by a local power condition away from T and the primes dividing N. This quotient is finite; choosing one detecting prime for each nontrivial class and open subgroups inside the local N-th powers gives U′. Pull back along the finitely many completion embeddings from B to B′ to obtain U. Positivity and the passage to B(i) are handled by the finitely generated subgroup comparison, without an unsupported descent of an n-th root.

For the character extension, include all infinite places in S, and let n be a common exponent of the prescribed finite images. The S-unit congruence theorem gives an open subgroup U away from S such that the product of the specified characters is trivial on the diagonal S-units meeting U. Declare the character trivial on U and descend to a character `χ_H` of H, the image of `U∏_(v∈S)F_v×` in the idele class group C. Its kernel K is open in C and contains the connected archimedean norm directions. The remaining idele class quotient is compact, so C/K is finite. Now H/K is a subgroup of this finite abelian group. Its character extends to C/K with values in the divisible group of roots of unity. For p-primary local data, use the divisible p-primary subgroup of roots of unity instead. The image is finite in either case, and no equality of the global and local character orders is asserted. This avoids the fixed-exponent obstruction in the Grunwald–Wang problem.

The additional API is `finiteCharacterExtension` and `pPrimaryCharacterExtension`, with restriction to each supplied completion and compatibility with local reciprocity. The openness used in the congruence proof is already `TauCeti.isOpen_range_powMonoidHom`; all detecting primes avoid N, so `(N : K) ≠ 0` holds, as does the stronger unit hypothesis used by the unit-filtration containment. No mixed-characteristic logarithm argument is needed here.

**Checks.**

- `sUnitCongruence_one`: `n=1` admits the whole product U, since `Γ¹=Γ`.
- `sUnitCongruence_sign`: for `B=ℚ` and T containing infinity and the prime `2, Γ={±2ʳ}`; the subgroup `Γ²` must exclude `−1` as well as odd powers of 2. Choosing only real positivity would miss the latter condition.
- `sUnitCongruence_wang_control`: the cyclic argument is applied prime-power by prime-power after adjoining i. `Gal(ℚ(ζ₈)/ℚ)` is not cyclic, so using that argument directly over `ℚ` for eighth powers would be invalid.

**Character checks.** A prescribed sign at a real place is allowed and the positive connected subgroup is killed. A nontrivial 2-primary local character requires a 2-primary global character, but its order may increase. Requiring a globally fixed order instead is a stronger Grunwald–Wang statement and is not an output. For trivial prescribed characters, the trivial global character is a witness.

Prove it as `cht_character_extension`.

The sources are [CHT][cht], Lemma 4.1.1 and proof, p. 116; [Taylor, icosahedral Artin representations II][taylor-artin-II], Lemma 2.1 and proof, printed pp.11–12 (April 23, 2002 author version, PDF pp.13–14). The finite-order and p-primary refinements use divisibility of the respective root-of-unity groups.

*Needs:* GL2AutomorphicRepresentationsAndTransfer §§R16.1.7–R16.1.8 (`chevalley_power_congruence`, `chevalley_finiteIndex_congruence`, `finite_hecke_full_local_prescription`); GlobalNumberFields Layer 1 (ordinary units); Chebotarev Layer 10; `TauCeti.isOpen_range_powMonoidHom`; the structure theorem for finitely generated abelian groups; ClassFieldTheory Layers 5 and 7–12.

<a id="target-cht-soluble-prescribed-completions"></a>
### 2.16 Soluble prescribed-completion extensions

Import `cht_soluble_prescribed_completions` from GL2ModularityLifting §1.7: given a finite set S of places of a number field F, a finite Galois avoidance field D/F, and finite Galois local extensions `E_v/F_v` with soluble groups, obtain a finite soluble Galois E/F, linearly disjoint from D/F, such that every completion E_w above v∈S is isomorphic to the prescribed `E_v` as an F_v-algebra. Real completions can be required to remain real, giving a totally real E when F is totally real. The construction is allowed to enlarge the global degree; it does not promise a cyclic extension of a specified degree. For an arbitrary finite avoidance extension use its Galois closure as D. This section exports the supplier theorem for the approximation applications, with its exact completion, avoidance and real-place hypotheses.

The sources are [CHT][cht], Lemma 4.1.2, statement p. 116 and proof p. 117.

*Needs:* GL2ModularityLifting §1.7 (`cht_soluble_prescribed_completions`).

<a id="target-moret-bailly-three-local-conditions"></a>
### 2.17 Three kinds of local conditions

For a smooth geometrically connected variety over a number field K, take a finite partition `S=S₁ ⊔ S₂ ⊔ S₃`, with every place in S₂ nonarchimedean. Prescribe nonempty opens in T(K_v) for v∈S₁, in T(K_v^nr) for v∈S₂, and in T(K̄_v) for v∈S₃; require local Galois invariance in the latter two cases. Obtain a finite Galois K′/K, disjoint from a specified finite extension, and a point with every local embedding satisfying the corresponding open. The first set splits in K′ and the second is unramified. Record a finite set of places with a three-way classification into splitting, unramified extension and arbitrary finite extension, requiring the unramified class to consist of nonarchimedean places.

**Checks.**

- For `T=𝔸¹_ℚ`, placing p in both S₁ and S₂ with opens `pℤ_p` and `{x∈ℚ_p^nr : |x−1|_p<1}` would force reductions zero and one. The partition excludes this input although both opens are nonempty and the second is invariant.
- A real place can belong to S₁ or S₃, but cannot belong to S₂.
- Empty S₂ and S₃ give the complete-splitting approximation theorem; empty S imposes only avoidance and existence of a point over a finite Galois extension.

Prove it as `moret_bailly_three_local_conditions`.

The sources are [Qian][qian], Proposition 4.2, statement and application, §4, p. 23 (arXiv v1).

*Needs:* [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [Layer 2, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); [Layer 2, Local density and integral points](#target-density-of-algebraic-and-separable-local-points).

<a id="target-moret-bailly-over-a-preliminary-extension"></a>
### 2.18 Approximation above a preliminary field

Use the partition `S=S₁ ⊔ S₂ ⊔ S₃` of §2.17, with S₂ nonarchimedean. Let M/K be finite Galois, split at S₁ and unramified at S₂, and take a smooth geometrically connected T/M with the corresponding nonempty invariant local opens at every place above S. Let L/K be finite Galois and disjoint from M/K. Obtain finite Galois K′/K containing M, disjoint from L, and a point in T(K′) satisfying all local conditions. Local invariance is over `M_w`; no extra equivariance of the opens under Gal(M/K) is required. Smoothness and geometric connectedness of the Weil restriction follow from the splitting of its base change to K̄ into the product of the conjugates of T, and its local points are the product of the local points of T over the places above v.

**Checks.** M=K recovers §2.17. The contradictory opens at a repeated p in §2.17 are excluded before Weil restriction. Distinct places of M above v can have different opens; their nonempty product imposes all of them without a Gal(M/K)-equivariance assumption.

Prove it as `moret_bailly_above_preliminary_field`.

The sources are [BLGHT][blght], Proposition 6.2, pp. 40–41.

*Needs:* [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [Layer 2, Disjointness through towers](#target-tower-linear-disjointness); AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); AlgebraicModuliForArithmeticGeometry §3.4 (relative Hom and Weil restriction, including base change).

<a id="target-snowden-soluble-preliminary-field"></a>
### 2.19 Soluble preliminary fields and split extensions

For a smooth geometrically connected number-field variety with finite local Galois extensions `L_v` and compatible nonempty invariant opens, choose a finite soluble Galois F₁/F and a finite Galois F₂/F. Arrange `F₁ ⊗_F L_v` split, F₂ split at the separately prescribed set S and after extension to each `L_v`, and F₂ disjoint from F₁ and the avoidance field. A point over F₁F₂ lies in every `Ω_v` under every F-embedding into `L_v`. Splitting over `L_v` is a scalar-extension condition; it does not identify the completions of F₂ with `L_v`.

Prove it as `snowden_soluble_preliminary_field`.

The sources are [Snowden v1][snowden], Proposition 8.2.2 and proof, p. 26.

*Needs:* [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); AlgebraicModuliForArithmeticGeometry §3.4 (relative Hom and Weil restriction, including base change).

<a id="target-surjective-specialisation-finite-quotient"></a>
### 2.20 Surjective specialization of finite quotients

Let F be imaginary CM and Galois over `ℚ`, and let T/F be smooth and geometrically irreducible. Fix a finite avoidance extension and a finite set S₀ of rational primes. For every v|l with `l∈S₀`, give finite Galois `L_v/F_v`, compatible under the G_(ℚ_l)-action by `σ(L_v)=L_(σv)`, and a nonempty open Gal(L_v/F_v)-invariant `Ω_v⊆T(L_v)`. Choose a CM F′/F, Galois over `ℚ` and disjoint from the avoidance field, and a point `P∈T(F′)`, with `F′_w≅L_v` and `P_w∈Ω_v` for every w|v. For any surjective finite quotient `f:π₁^ét(T)→G`, require also f∘P_*:G_F′→G surjective. The finite étale torsor combines this quotient condition with the completion conditions. Spell out the local conjugacy requirement when comparing the source's embedding notation: the prescribed `L_v/F_v` must be transported into one finite Galois `L_l/ℚ_l` for each l, compatibly with every embedding of F into `ℚ̄_l`. In particular they all have the same absolute local degree at places above l. This is required by `F′/ℚ` being Galois; arbitrary unrelated Galois extensions of the different `F_v` do not satisfy the theorem.

For exact completions first construct a soluble Galois totally real `E/ℚ` with completions `L_l` at the specified rational primes, using §2.16 and real local conditions. Use Weil restriction from F to `ℚ` and then from E to `ℚ` to impose the product of the local opens for every embedding. A further totally real Galois field split at those rational primes supplies the point. The final field is the compositum with F; it is CM and Galois over `ℚ`. Its completions equal `L_l` because adjoining a field split at l does not enlarge the prescribed completion. Extra split places impose avoidance before this construction; taking an uncontrolled normal closure after selecting a point is insufficient.

For the finite quotient, spread the connected finite étale G-torsor and T over a suitable open of `Spec O_F`. For each conjugacy class `C⊆G`, choose a distinct sufficiently large residue characteristic and a smooth residue-field point whose Frobenius maps into C. The exact prime-existence supplier is the finite-type-scheme Chebotarev statement in the proof of Bianchi Proposition 4.5.1 (its reference Serre Corollary 9.12), not just number-field Chebotarev. Require degree-one primes of F, so the underlying rational prime splits in the Galois field F; the positive-density prime selection permits deleting the degree-greater-than-one primes. Smooth Hensel lifting gives a nonempty open of F_v-points reducing to that point. At the other places above its rational prime use the full nonempty local point set, and prescribe split completions for this new prime. Specialization then meets C. If a proper subgroup `H⊊G` met every conjugacy class, every `g∈G` would fix a point in the transitive action on G/H. Burnside's fixed-point average is one, whereas the identity fixes `[G:H]>1` points, so some g must fix none. This contradiction proves surjectivity. Merely meeting a set of group generators up to independent conjugation would not suffice.

The prime-existence input is the target `schemeChebotarevPoints`, defined here: let 𝒯 be smooth of finite type over `O_F[1/N]` with geometrically irreducible generic fibre T, let 𝒴→𝒯 be a connected finite étale G-torsor and `C⊆G` a conjugacy class. Then for every X there are a degree-one prime v of F with `q_v>X` and a point x∈𝒯(k(v)) whose arithmetic Frobenius in G lies in C. Choose v by Chebotarev in the constant-field extension of 𝒴, so that its Frobenius there is the image of C; then count k(v)-points of the twists of the reduction of 𝒴 with the uniform Lang–Weil bound (Poonen Theorem 7.7.1), exactly as in the twisting argument of §2.11. This is the statement Bianchi cites as Serre's Chebotarev theorem for schemes of finite type over `ℤ`. EtaleCohomologyFoundations §§F.0, F.0.A2 supply finite covers and monodromy, the arithmetic exact sequence and path-dependent point sections; InverseGaloisAndArithmeticFundamentalGroups IG.2.6 concerns covers of the projective line and Hilbert irreducibility, a different statement that is not used here.

The API `surjectiveSpecialisation` returns the chosen field and point, the local F_v-algebra isomorphisms, membership for every embedding, the disjointness comparison and the finite-quotient surjectivity witness; `schemeChebotarevPoints` returns the prime and residue-field point.

**Checks.** The trivial quotient imposes no additional Frobenius conditions. Meeting only the identity class does not force a nontrivial quotient to be surjective. The degree-five action of A₅ shows that conjugates of a proper point stabilizer can contain many different elements; the proof requires every conjugacy class. Over `F=ℚ(i)`, the prime 5 has two completions `ℚ₅`: prescribing local degrees one and two at them cannot occur in an extension Galois over `ℚ`, and is rejected by the local conjugacy hypothesis. A normal closure taken without that hypothesis can enlarge completions and fails the exact-completion accessor.

The sources are [Bianchi potential automorphy][bianchi], Proposition 4.5.1 and proof, pp. 48–49; [BLGGT v4][blggt-2014-v4], Proposition 3.1.1 and proof, p.41 (the preliminary soluble field and normal-closure/local-conjugacy comparison).

*Needs:* [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); AbelianSchemesAndArithmeticModuli Layer A6; InverseGaloisAndArithmeticFundamentalGroups IG.2.5, “The Lang–Weil estimate”, including its bounded-family argument; EtaleCohomologyFoundations §§F.0, F.0.A2 (finite covers, monodromy, the arithmetic sequence and path-dependent point sections); [Layer 2, Chebotarev density for global function fields](#target-function-field-chebotarev) (the twisting count); Chebotarev Layer 10; AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); AlgebraicModuliForArithmeticGeometry §3.4 (relative Hom and Weil restriction, including base change).

<a id="target-function-field-isomorphism-torsor"></a>
### 2.21 The function-field isomorphism torsor

Let X,Y be smooth geometrically connected curves over `F_q, K=F_q(X), F=F_q(Y), H` finite, and `φ:π₁(X)→H` and `ψ:π₁(Y)→H`. On `Y_K` construct `Z=Isom_(Y_K,H)(X_φ,X_ψ)`, finite étale over `Y_K`. If `ψ` is surjective on the geometric fundamental group, Z is geometrically connected. It is a K-curve, not a finite K-scheme. For finite separable K′/K and `z∈Z(K′)` whose image does not come from `Y(F̄_q∩K′)`, the nonconstant image defines an F_q-embedding `β:F→K′`, and `β*ψ` is conjugate to `φ|G_K′`. Include this nonconstant-image condition in the specialization API.

**Checks.**

- For H trivial, `Z=Y_K`, and every K′-point of `Y_K` with nonconstant image gives an F_q-embedding of function fields; the conjugacy condition is empty.
- Z is finite étale over `Y_K` of degree #H. For `H=ℤ/2` it is a double cover of the curve `Y_K`, of dimension one over K; reading it as a finite K-scheme, as under a zero-dimensional interpretation, fails.
- If `ψ` is not surjective on the geometric fundamental group, for instance if it factors through the constant-field quotient, Z can be geometrically disconnected; the surjectivity hypothesis is what makes Z geometrically connected.
- A K′-point of Z whose image comes from `Y(F̄_q∩K′)` is constant and defines no embedding `F→K′`; the nonconstant-image condition excludes it.

Prove it as `function_field_isom_torsor`.

The sources are [BHKT][bhkt-published], Lemma 9.1 and diagram (9.1), published pp. 76–77; [Beuzart-Plessis–Harris–Thorne][bhkt-correction], p. 28, Isom-scheme paragraph.

*Needs:* SchemeAndStackFoundations §§1.15–1.16 (finite étale torsors and Isom schemes); EtaleCohomologyFoundations §§F.0, F.0.A2 (finite covers, geometric monodromy and the arithmetic sequence).

<a id="target-function-field-point-with-fixed-constants"></a>
### 2.22 Function-field points with fixed constants

Apply the function-field approximation construction with a proper closed subset excluded, preserving the constant field `F_q` and disjointness from a finite Galois avoidance extension. Obtain a finite Galois K′/K with the stated local splitting and a nonconstant specialization `β` such that `β*ψ` is conjugate to `φ`. Require geometric connectedness of the relevant torsor and the constant-field conditions separately; the embedding of the function field comes from the nonconstant image. Use the corrected BHKT statement rather than a zero-dimensional interpretation of its Isom torsor.

The output satisfies `K′∩F̄_q=F_q` and identifies `β*ψ` with `φ|G_K′` up to H-conjugacy.

Prove it as `fixed_constant_field`.

The sources are [BHKT][bhkt-published], Proposition 9.2 and proof, published p. 78.

*Needs:* [Layer 2, The function-field isomorphism torsor](#target-function-field-isomorphism-torsor); [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Generating Frobenius primes](#target-frobenius-primes-generate); [Layer 2, Chebotarev density for global function fields](#target-function-field-chebotarev).

<a id="target-potential-global-galois-local-data"></a>
### 2.23 Potential realization of local Galois data

Let K be a global field, S a finite set of places, H a finite group, and `M_v/K_v` finite Galois extensions with embeddings `Gal(M_v/K_v) ↪ H`. There is a finite K′/K split at S and an H-Galois extension M/K′ realizing these completions and decomposition-group embeddings up to conjugacy. At real places prescribe elements of order dividing two. For totally real number fields, Calegari's refinement permits K′/K to be totally real and Galois and the resulting M to avoid a prescribed finite field over K. The function-field assertion here is BHKT Theorem 9.3; its conclusion does not include these extra Galois, avoidance or fixed-constant-field properties of K′.

Prove it as `potential_global_galois_local_data`.

The sources are [BHKT][bhkt-published], Theorem 9.3, published pp. 78–79; [Calegari][calegari], Proposition 3.2 and proof, author pp. 5–6.

*Needs:* [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); [Layer 2, The function-field isomorphism torsor](#target-function-field-isomorphism-torsor); [Layer 2, Function-field points with fixed constants](#target-function-field-point-with-fixed-constants); SchemeAndStackFoundations §§1.15–1.16; EtaleCohomologyFoundations §§F.0, F.0.A1–F.0.A2.

### Examples

The split tensor algebra is compared with prescribed completions, and the rigidified Picard tests separate boundary trivializations from unrigidified line-bundle classes.

### Dependencies

This layer uses Mathlib and the Tau Ceti library; the Tau Ceti roadmaps Chebotarev, ClassFieldTheory, GlobalNumberFields and ReductiveGroupsPartII; and the roadmaps AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometry, ArithmeticGaloisRepresentations, ComplexComparisonPartII, EtaleCohomologyFoundations, GL2AutomorphicRepresentationsAndTransfer, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties, SchemeAndStackFoundations, HeightsAndUnits and AlgebraicCurves. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r23-2"></a>
## Layer 3: Auxiliary characters and moduli


Choose the arithmetic data before applying the geometric theorem. Import the moduli schemes, torsion pairings and local points within H6's stated domain. Sections 3.5–3.6 extend its paired descent to ramified coefficient primes and supply the two-prime A/B/C realization; the approximation applications use these specified components and local opens.

<a id="target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions"></a>
### 3.1 CM characters with simultaneous local reductions

Let O be the integers in a finite extension of `ℚ_p`, with residue field k. Let K be totally real and L/K totally imaginary quadratic, split at all places above p. Take a finite set S of finite places containing those above p and split in L, and choose `S_L` with exactly one place above each member of S. Let `φ:G_K→O^×` be continuous and odd, equal to `ε_p^n` times a finite-order character for `n∈ℤ`, and choose continuous `ψ̄_x:G_L_x→k^×` for `x∈S_L`. Over a finite coefficient extension with integers O′, construct continuous `ψ:G_L→O′^×`, unramified outside finitely many places, with finite inertia image at every chosen `x∈S_L`, reducing there to `ψ̄_x`, and satisfying `det Ind_(G_L)^(G_K)ψ=φ`. The construction may introduce ramification outside S; it does not promise an extension supported only on S. The algebraic character and reciprocity construction is supplied by its owner; this theorem imposes the simultaneous local reductions needed by auxiliary torsion.

Use GL2AutomorphicRepresentationsAndTransfer §R16.1.7’s S-unit congruence theorem in the form described in [Layer 2, Extending finite local characters](#target-cht-character-extension). For the character construction apply this to the image of `L_S^×/K_S^×` under u↦uᶜ/u. Its kernel is `K_S^×` and its image is a subgroup of the finitely generated S-unit group of L; the same finite-index comparison gives the induced congruence topology. The finite discrepancy between the initial algebraic avatar and the specified local residual characters therefore factors through a finite quotient of units away from S. Extend that finite character to the ambient finite quotient after enlarging the roots of unity in the coefficient field, and use global reciprocity to correct the avatar. This is the extra congruence step in Taylor's proof, distinct from avatar existence.

Prove it as `exists_cm_character_with_local_reductions`.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Lemma 1.1 and proof, printed pp. 7–9; [Taylor, icosahedral Artin representations II][taylor-artin-II], Lemma 2.1 and proof, printed pp. 11–12 of the April 23, 2002 author version (PDF pp. 13–14). The local-power argument above supplies the congruence input using Chebotarev.

*Needs:* ClassFieldTheory Layers 5 and 7–12; ClassFieldTheory Layers 5 and 7–12; GlobalNumberFields Layer 1 (`TauCetiRoadmap.GlobalNumberFields.weakApproximation_denseRange`) and its ordinary-unit input; Chebotarev Layer 10 (prime existence for every conjugacy class); the structure theorem for finitely generated abelian groups; [Layer 2, Extending finite local characters](#target-cht-character-extension).

<a id="target-taylor-auxiliary-data-p-l-psi-n-m"></a>
### 3.2 Auxiliary primes, characters and coefficient fields

Let l be odd, `k/F_l` finite and F totally real. Assume continuous `ρ̄:G_F→GL₂(k)` has insoluble image, determinant `ε̄_l`, and shape `(ε̄_lχ_v⁻¹,*;0,χ_v)` at each v|l. Let `F̃_v/F_v` be a totally tamely ramified extension of minimal degree making `χ_v` unramified. Before defining ζ or N₀, extend k to a finite field k′ splitting the characteristic polynomials of every element of the finite residual image. Transport `ρ̄` and each `χ_v` to k′ and retain their coefficient-extension identification. Use k′ throughout these auxiliary data and the H6.5 contract; write k for this enlarged field. For `ζ` of order #k−1 set N₀=ℚ(ζ,√(1−4l)); choose `λ₀|l` with residue field k at which a=(1+√(1−4l))/2 is a unit, reducing to 1. Write `q_v=l^[k(v):F_l]` and choose `β_v=ζ^(b_v)a^[k(v):F_l]` reducing to `χ_v(φ_v)` for a Frobenius lift in `G_F̃_v`. If `χ_v²≠1`, define `χ̃_v` with this Frobenius value and Teichmüller inertia; if `χ_v²=1` take the Teichmüller character.

Choose a prime `p>3, p≠l`, such that `ρ̄` is unramified at every w|p with distinct Frobenius eigenvalues, p splits completely in the Hilbert class field of N₀ and in the field cutting out `ε̄_l⁻¹det ρ̄`, and p avoids every `β_v−β_v^c`. In the `χ_v²=1` branch also exclude p dividing `q_v−1`. The field cut out by `ε̄_l⁻¹det ρ̄` contains F, so p splits completely in F and `F_w=ℚ_p` for every w|p. Fix `℘₀|p` and, for w|p, choose `α′_w` in the ring of integers of `ℚ(a)` of norm p and prime to `℘₀`; multiply by `ζ^(a_w)` to get `α_w` reducing to a residual Frobenius eigenvalue at `λ₀`. These are exactly the conditions (C2)–(C3) of the input contract of HilbertModularVarietiesAndShimuraCurves H6.5, together with `p>3`, which the crystalline lifting theorem of §4.5 needs when §4.6 applies it.

Such primes exist and have positive density. Let M₁ be the Galois closure over `ℚ` of the compositum of F, the Hilbert class field of N₀ and the field cut out by `ε̄_l⁻¹det ρ̄`, and M′ its compositum with the Galois closure of the field cut out by `ρ̄`. By Chebotarev it suffices to find `σ∈Gal(M′/M₁)` such that `ρ̄(gσg⁻¹)` has distinct eigenvalues for every `g∈Gal(M′/ℚ)`; the finitely many primes `p≤3, p=l, p|β_v−β_v^c` and `p|q_v−1` are then discarded. An element of GL₂ has a repeated eigenvalue exactly when its image in PGL₂ is trivial or unipotent. The projective image P of `ρ̄` is insoluble, hence almost simple with nonabelian simple socle S (Dickson). Its image P₁=proj `ρ̄(Gal(M′/M₁))` is normal in P, and it is nontrivial. Otherwise the projective field lies in M₁; the subgroup `Gal(M₁/F^gal)` is soluble (M₁ is generated over `F^gal` by conjugates of soluble and abelian extensions) and normal in Gal(M₁/F), so it acts on the projective field through a soluble normal subgroup of the almost simple group P, hence trivially. The projective field would then lie in the totally real field `F^gal`, on which every complex conjugation acts trivially, contradicting total oddness of `ρ̄`. Hence `P₁⊇S`. The map `σ↦(proj ρ̄(gσg⁻¹))_g` on the finite-index normal subgroup of Gal(M′/M₁) landing in S in every coordinate has image a subdirect product of copies of S, hence a product of diagonal copies twisted by automorphisms; an element whose components in each diagonal copy are semisimple, nontrivial and of order prime to l has every coordinate of order prime to l and different from 1, so all `ρ̄(gσg⁻¹)` have distinct eigenvalues.

Choose a totally imaginary quadratic L/F, split at every v|l and w|p and not contained in `F(ζ_p)`. Construct `ψ` with `det Ind ψ=ε_p`, reduction `χ̃_v` at the chosen v₁|v, and unramified local character at each w₁|p with Frobenius value lifting `α_w`. The reductions of `ψ` and `ψ^c` differ on the full local decomposition groups above l; inertia alone need not distinguish them. Enlarge N₀ to a Galois CM N in which its l-adic places split and its p-adic places are unramified, large enough for the chosen ψ̄-values at a place `℘|℘₀`. Choose `λ|λ₀` and let M be the maximal totally real subfield. The norm `β_vβ_v^c` is `q_v`, not the auxiliary prime p.

The construction has the following API:

- `TaylorAuxiliaryData`: The data `(p, ℘₀, α_w, L, ψ, N, ℘, λ, M)` with the stated properties, for a `ρ̄` satisfying Taylor's standing hypotheses.
- `TaylorAuxiliaryData.exists`: Such data exist, with `p>3` (the Chebotarev argument above for p, then Lemma 1.1 for `ψ`, then a CM extension N/N₀). They satisfy (C1)–(C5) of H6.5. Applications of H6.5 additionally take explicit witnesses that the produced polarization narrow classes lie in the norm image from N. These witnesses are hypotheses, not consequences of enlarging N.
- `TaylorAuxiliaryData.det_ind`: `det Ind_{G_L}^{G_F} ψ = ε_p`.
- `TaylorAuxiliaryData.psi_ne_conj`: `ψ̄|G_{v₁} ≠ ψ̄^c|G_{v₁}` for v | l: `β_vβ_v^c=q_v` when `χ_v²≠1`, with `p∤β_v−β_v^c`; when `χ_v²=1` use the additional exclusion `p∤q_v−1`. The full decomposition group is required; the inertia characters may agree.
- `TaylorAuxiliaryData.split`: Every place of F above l and above p splits in L; L is totally imaginary and not contained in `F(ζ_p)`.
- `TaylorAuxiliaryData.prime_ne_l`: The chosen auxiliary prime p is different from the original residual prime l, and `p>3`.
- `TaylorAuxiliaryData.conj_conj`: Conjugating the auxiliary character twice gives the original character; the involution is the nontrivial element of Gal(L/F).
- `TaylorAuxiliaryData.det_ind_apply`: For `g∈G_F, det(Ind ψ(g))=ε_p(g)`; this is a pointwise evaluation of the determinant identity.

**Checks.**

- `taylorAux_N0_l5`: For `l = 5` and `k = F_5`: `ζ` has order 4 and `N₀ = ℚ(ζ₄, √−19)`; 5 does not divide `1 − 4·5 = −19`, so 5 is unramified in N₀.
- `taylorAux_unramified_CM`: with the original `l=5,k=𝔽₅`, `N₀=ℚ(i,√−19)` is everywhere finitely unramified over `M₀=ℚ(√19)`. For any CM N containing N₀, `N=N₀N⁺`, so finite unramifiedness persists by base change; enlarging N cannot create finite ramification, and this argument supplies no ordered norm witness.
- `taylorAux_split_eigenvalues`: over 𝔽₅ the determinant-one matrix `[[0,−1],[1,−1]]` has projective order three but irreducible polynomial `X²+X+1`. Distinct eigenvalues alone do not lie in the initial field; they split over the coefficient extension k′.
- `taylorAux_det_needed`: The simultaneous alternating torsion pairing requires `det ρ̄=ε̄_l`. A different determinant, such as `ε̄_lω²`, cannot supply that pairing; also check the stored identity `det Ind ψ=ε_p`.
- `taylorAux_alpha_norm`: For `α_w` of algebraic norm `p, diag(α_w,α_w^c)` has determinant p. This is an algebraic norm calculation, not a p-adic cyclotomic value of a Frobenius lift at p.
- `taylorAux_not_in_cyclotomic`: L ⊄ `F(ζ_p)` is part of the data; a quadratic subfield of `F(ζ_p)` is not allowed.
- `taylorAux_local_decomposition`: The auxiliary object has a full local decomposition-group element on which `ψ̄` and `ψ̄^c` differ; distinction need not hold on inertia.
- `taylorAux_beta_norm`: With `l=5`, residue degree one and `a²−a+5=0, a^c=1−a` and `aa^c=5`, which differs from the auxiliary `p≠5`.
- `taylorAux_oddness_used`: if `ρ̄` were even, its projective field could lie in the totally real Galois closure of F, and every prime splitting completely in F would have scalar projective Frobenius; total oddness is what makes the prime choice possible.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], section 1, standing hypotheses, printed p. 6, choice of p, printed p. 7, choice of `L, ψ` and N, printed p. 9, and of M, printed p. 10; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Corrections to [Tay4], first bullet, p. 776.

*Needs:* [Layer 3, CM characters with simultaneous local reductions](#target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions); [Layer 2, Generating Frobenius primes](#target-frobenius-primes-generate); `HilbertModularVarietiesAndShimuraCurves` H6.5 (the input contract (C1)–(C5), and the separately assumed ordered norm witnesses for (C6)); `ArithmeticGaloisRepresentations` Layer 4 (Dickson's classification of subgroups of PGL₂); Chebotarev Layer 10.

<a id="target-local-points-at-l-p-infinity-and-the-point-over-e"></a>
### 3.3 The twisted Hilbert moduli application

Assume the ordered norm witnesses for the polarization modules in H6.5 (O2) and (O3), as specified in §3.2. Use the twisted Hilbert torsion moduli space X/K supplied by H6, with the prescribed real multiplication, ordered polarization module and identifications of `A[λ]` with `ρ̄` and `A[℘]` with `Ind ψ̄` carrying the fixed alternating forms to the Weil pairings; X is smooth and geometrically connected. Take the nonempty local opens at the places above l, p and infinity built from the explicit local points of H6.4 and H6.5. At the places above p (where `K_w=ℚ_p`) choose the open inside the locus of points whose abelian variety has good ordinary reduction; it contains the good ordinary point of H6.5 (O3). Under the full H6.5 input contract, (O1) and (O2), together with the fixed-pairing comparison (O4), give K_v-rational points at every v|l. Choose K_v-valued local opens and require complete splitting there. The auxiliary HBAV in (O2) acquires good reduction over `F̃_v`; that reduction property does not change the field of definition of the moduli point. The integral-point theorem then gives a finite Galois totally real E/K, split at every place above l and p and with the prescribed behaviour at infinity, linearly disjoint from the avoidance field, and an M-Hilbert–Blumenthal abelian variety A/E with `A[λ]≅ρ̄|G_E` and `A[℘]≅Ind ψ̄|G_E`, having good ordinary reduction at every place above p. In particular p splits completely in E.

The good-reduction locus at w|p is open. Forgetting the ℘-level structure gives a finite étale map from `X⊗K_w` to the moduli space with only the λ-level structure, which is prime to p and rigidifies the problem. That space has a smooth model over `ℤ_p`, because p is unramified in M; its ℤ_p-points form an open subset of its ℚ_p-points (derive this for the possibly nonaffine model by affine charts and RG2.0.3 `integral-points-compact-open` on each chart), and they are exactly the points whose abelian variety has good reduction (Néron–Ogg–Shafarevich, with the polarization, the O_M-action and the prime-to-p level structure extending by the Néron property). The reduction map on ℤ_p-points is locally constant and the ordinary locus is open in the special fibre, so the good ordinary locus is open; its preimage in `X(K_w)` is open.

Prove it as `local_points_twisted_hilbert_moduli`.

**Checks.**

- `aux_points_good_reduction_open`: a point of `X(K_w)` whose abelian variety has multiplicative reduction lies outside the chosen open; the Tate-HBAV points of H6.5 (O1) occur only at places above l, never at the auxiliary places above p.
- `aux_points_split_at_p`: because the local points at w|p are K_w-rational and `K_w=ℚ_p`, the field E is split at every place above p and p splits completely in E.
- `aux_points_defined_over_base`: potential good reduction only over `F̃_v` in (O2) does not prevent a K_v-rational moduli point or complete splitting at v.
- `aux_points_forget_level`: the ℘-level structure has p-power level and is not étale over `ℤ_p`; the openness argument forgets it before using the integral model.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], the moduli space and its local points, printed p. 13; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], the analogous twisted moduli space and the application of Moret-Bailly's theorem at the end of the proof of Proposition 4.1, p. 762.

*Needs:* [Layer 3, Auxiliary primes, characters and coefficient fields](#target-taylor-auxiliary-data-p-l-psi-n-m); `HilbertModularVarietiesAndShimuraCurves` H6.2 (twisted Hilbert torsion moduli), H6.3 (component descent), H6.4 (real points), H6.5 (finite local points) and H6.9 (the geometric and local input export); `HilbertModularVarietiesAndShimuraCurves` H2.2 (the integral Hilbert model at good primes) and H2.6 (the ordinary locus is open); `NeronModelsAndSemistableAbelianVarieties` §5.1 (Néron–Ogg–Shafarevich); `ReductiveGroupsPartII` RG2.0.1 (scheme-point topology), RG2.0.3 (`integral-points-compact-open` for affine integral models, applied chartwise); [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions).

<a id="target-restriction-of-scalars-moduli-application"></a>
### 3.4 The Weil-restricted moduli application

For a finite totally real F₁/F and the smooth geometrically connected auxiliary X/F₁, use Weil restriction to form `Res_(F₁/F) X`. It has the same smoothness and geometric connectedness, and its F_v-points are `∏_(w|v) X(F₁,w)`. Apply approximation to these product opens over F, avoiding F₁ together with the prescribed avoidance field. This gives a totally real Galois F′/F disjoint from their compositum and an auxiliary moduli object over F₁F′. Weil restriction, its representability and the torsion/polarization objects are imported from A6 and H6.

Prove it as `restricted_auxiliary_moduli`.

The sources are [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proof of Proposition 9.1.11, p. 458.

*Needs:* HilbertModularVarietiesAndShimuraCurves Layer H6; AbelianSchemesAndArithmeticModuli Layer A6; [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); AlgebraicModuliForArithmeticGeometry §3.4 (relative Hom and Weil restriction, including base change).

<a id="target-joint-paired-torsion-moduli"></a>
### 3.5 Joint prime levels, polarization descent and integral opens

**Joint paired moduli** (`jointPairedTorsionModuli`). Let K be totally real, F a characteristic-zero field and `𝔫=∏𝔭_i` a product of distinct primes of O_K over odd rational primes, with at least two residue characteristics. Give an ordered polarization module, rank-two residual modules at these primes and their perfect alternating pairings with the matching inverse-different/polarization targets. Allow ramification of K at these primes. Require the common kernel of the torsion actions on polarized O_K-linear automorphisms to be torsion-free. Construct the simultaneous paired Isom torsor, its twisted moduli scheme, its universal family and the smooth geometrically connected component for the specified pairing and narrow-class label. The label must be G_F-fixed to descend to F; otherwise use its stabilizer field. Import H6's torsor, ample-line and component arguments, extending the level datum by finite products. Fineness uses the common kernel, rather than torsion-freeness of each single-prime kernel. For two different residue characteristics p and q, a finite-order automorphism trivial on both markings has p-power and q-power order by the two local congruence kernels, hence is the identity.

Include Taylor's polarization-similitude variant: for `U₁={u∈O_K× : u≡1 mod 𝔫}`, use pairs `(γ,e)` with `e∈O_K,>0×/U₁²` and `e det γ=1 mod 𝔫`. The action changes the ordered polarization by e⁻¹ and the torsion frame by γ⁻¹. A continuous finite cocycle in this group supplies the twist and its point interpretation over the splitting field, including the polarization multiplier. In Taylor's specialization K=E, C=EM is quadratic CM over K, and `𝔟=λ℘₁℘₂` maps to 𝔫 with the specified residue-algebra isomorphism. Prove Lemma 4.2's unit congruence by class-field transfer; use its unit η and ζ to obtain the lifts `η_σ=(ηζ⁻¹)^(m_σ)≡1 mod 𝔟` and their norm multipliers. For a point represented by A over the multiplier splitting field, descend `B=A⊗_(O_K)O_C` with maps `κ_σ⊗η_σ`, polarization from the trace form `Tr_(C/K)(a b^c)`, and the prescribed 𝔟-torsion. The maps preserve this polarization, and the joint torsion condition forces their cocycle identity. This gives an O_C-action, dimension `[C:ℚ]` and Tate modules of rank two over C at its coefficient places. For the CM point take the type on C induced by one embedding of M, with its trace-polarized lattice. The main theorem of complex multiplication realizes χ on its Tate modules; compare the paired residual frames and descend its moduli point under complex conjugation as in Taylor Lemma 4.5. The local equivalence of the two twisting data then gives the stated local identifications.

**Checks.**

- At a ramified coefficient prime over p₁>3, a single-prime congruence kernel can contain torsion; the second residue characteristic supplies the joint rigidification.
- Taylor's E contains `E′ℚ(ζ_(p₁))⁺`, whose ramification index at p₁ is `(p₁−1)/2>1`. The joint datum admits this coefficient field.
- A nontrivial polarization multiplier changes j: descending the unpolarized A by κ_σ alone does not give the asserted polarized cocycle. The tensor construction retains η_σ.

Source: [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Lemma 4.2 and proof, p.757; paired moduli and multiplier action, pp.759–760; Lemmas 4.4–4.5, pp.761–762; [Snowden v1][snowden], proof of Proposition 5.3.1, pp.16–17.

*Needs:* HilbertModularVarietiesAndShimuraCurves H1.1, H1.8, H6.1–H6.4 (paired torsors, descent and component comparisons in their stated domain, with the finite-product and multiplier extensions proved here), H2.2a (ample descent); AlgebraicModuliForArithmeticGeometry §3.5; AbelianSchemesAndArithmeticModuli Layers A2, A5; ClassFieldTheory Layers 7–12; ShimuraVarieties §§5.3, 5.5 and 5.10.

**Good-reduction neighborhoods** (`hilbertGoodReductionOpen`). For the local moduli just described over a finite extension L/ℚ_p, let x be a point represented by an abelian variety with good reduction, with its O_K-action and polarization. After forgetting p-primary level, use a separated finite-type integral model with universal abelian scheme through the image of x; retain sufficiently fine prime-to-p markings. The preimage of its O_L-points contains an open neighborhood of x consisting of good-reduction points. For a twisted point use its compatible finite unramified descent datum when supplied by the CM construction. Extend the endomorphisms, polarization and prime-to-p markings by the abelian-scheme extension property. On each affine chart integral points are open by RG2.0.3; taking their union and pulling back along the generic-fibre forgetful map proves openness. Smoothness of the integral model is unnecessary. For Taylor's point the auxiliary CM characters at primes different from p₁ are unramified at p₁, as is the multiplier splitting field there, giving good reduction and the required integral descent. The all-prime Deligne–Pappas model, rather than a smooth good-prime model, supplies these charts.

**Checks.**

- A ramified real multiplication prime can give a singular special fibre of the Deligne–Pappas model; the integral-point neighborhood is still open.
- A p-primary level structure is forgotten before forming the integral neighborhood; its generic-fibre pullback is allowed even when it does not extend étale over O_L.
- A Tate curve has nonzero monodromy and cannot be an integral point of the universal abelian scheme. The neighborhood therefore enforces the good reduction needed for crystalline lifting.

Source: [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Lemma 4.5, p.762; HilbertModularVarietiesAndShimuraCurves H2.2 (Deligne–Pappas §2.1); the affine integral-point topology of ReductiveGroupsPartII RG2.0.3, applied chartwise.

*Needs:* HilbertModularVarietiesAndShimuraCurves H2.2–H2.2b; [Joint prime levels](#target-joint-paired-torsion-moduli); ReductiveGroupsPartII RG2.0.1, RG2.0.3; AbelianSchemesAndArithmeticModuli Layer A2; NeronModelsAndSemistableAbelianVarieties §5.1.

<a id="target-snowden-two-prime-realization"></a>
### 3.6 Two-prime HBAV realization with definite types

**Two-prime realization** (`snowdenTwoPrimeRealization`). Let F and K be totally real, M/F finite, and 𝔭,𝔩 primes of K over distinct odd rational primes p,ℓ. Give continuous rank-two representations over their residue fields with cyclotomic determinants, fixed alternating determinant pairings, and arbitrary definite type functions `t_p,t_ℓ` with values A/B/C at the places above p,ℓ. Obtain a finite Galois totally real F′/F disjoint from M and an O_K-HBAV A/F′ of dimension `[K:ℚ]`, with its ordered inverse-different polarization module, paired identifications of A[𝔭], A[𝔩] with the restricted representations, and corresponding Tate-module types `t_p|F′,t_ℓ|F′`. No local compatibility over the original F_v is required because finite local extensions are allowed.

Choose a third prime 𝔯 over an odd rational prime different from p,ℓ whose reduction kernel is torsion-free, and give its module `χ̄_r⊕1`. Use §3.5 for all three paired markings and the fixed inverse-different component. At each finite selected place construct, after a finite Galois extension, local HBAVs of the desired type: tensor an ordinary or supersingular good-reduction elliptic curve with O_K for A or B, and use the O_K-linear Tate uniformization for C. Compute the inverse-different polarization by trace duality; split all three finite torsion modules over a further finite extension and choose pairing-preserving frames. This gives nonempty local opens. Good ordinary and good nonordinary reduction give A and B; total toric degeneration gives a nonsplit type-C Tate module. Integral charts and the ordinary locus give the reduction opens, and the Tate parameters give an open with nonzero monodromy. At real places cyclotomic determinants give odd involutions and the trace-polarized real lattice gives a point. Apply §2.17 with infinity in S₁, the finite conditions in S₃ and avoidance of M. Thus the geometry and local nonemptiness precede approximation.

**Checks.**

- The split module `1⊕χ̄_p` can be realized with supersingular reduction after a finite extension that trivializes it and the supersingular p-torsion; restricting the original local representation need not preserve an ordinary/nonordinary distinction.
- A Tate HBAV has nonzero monodromy, giving definite C. The split characteristic-zero representation `1⊕χ_p` has ambiguous A/C type and cannot replace this local witness.
- An arbitrary ramified 𝔭 is admitted: fineness follows from the auxiliary 𝔯-marking. A third marking with no torsion-free common kernel would not suffice.

Source: [Snowden v1][snowden], Proposition 5.3.1 and proof, pp.16–17; local type definitions, §2.1, p.4.

*Needs:* [Joint prime levels and integral opens](#target-joint-paired-torsion-moduli); HilbertModularVarietiesAndShimuraCurves H1.1, H1.8, H2.6, H6.4; AbelianSchemesAndArithmeticModuli Layers A2–A5 (products of abelian schemes, elliptic reduction, polarizations and torsion; the O_K-linear tensor and trace-polarization calculations are part of the realization here); NeronModelsAndSemistableAbelianVarieties §3.14 (polarized toric uniformization); [Three kinds of local conditions](#target-moret-bailly-three-local-conditions).

### Examples

The checks on the auxiliary prime, the conjugate character and the separate local points at l, p and infinity constrain the auxiliary construction.

### Dependencies

This layer uses the Tau Ceti roadmaps Chebotarev, ClassFieldTheory, GlobalNumberFields and ReductiveGroupsPartII; the roadmaps AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometry, ArithmeticGaloisRepresentations, HilbertModularVarietiesAndShimuraCurves and NeronModelsAndSemistableAbelianVarieties; and Layer 2 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r23-3"></a>
## Layer 4: Residual potential modularity


Prove residual modularity independently of existence of a lift of the original representation. Taylor’s ordinary and niveau-two arguments supply the weight and level refinements; Snowden’s totally real theorem and the two-prime refinement have their own hypotheses and outputs.

<a id="target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l"></a>
### 4.1 The ordinary auxiliary Tate module

For the auxiliary M-Hilbert–Blumenthal abelian variety A/E with `A[λ]≅ρ̄|G_E` and `A[℘]≅Ind ψ̄|G_E`, take v|l unramified over `ℚ_l` and x|v in E. Assume `χ_v²|I_v=ε̄_l^n` with `0≤n<l−1`, and exclude `n=1` if `ρ̄|G_v` is semisimple. Then `T_λA⊗ℚ_l` has shape `(ε_l(χ′_v)⁻¹,*;0,χ′_v)` on `G_x`, for a tamely ramified lift `χ′_v` of `χ_v`. The differential inertia calculation uses `ω⁻¹`; this is what forces `n=1` in the excluded semisimple branch. The finite-flat group-scheme inertia and CDT inputs belong to their local owners.

Prove it as `auxiliary_tateModule_ordinary_shape`.

The sources are [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Lemma 1.5 and proof, printed pp. 14-15, proof of Lemma 1.5, printed p. 14, proof of Lemma 1.5, printed p. 15.

*Needs:* [Layer 3, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations"></a>
### 4.2 Quaternionic forms and Hecke–Galois realizations

Take F totally real of even degree, D ramified exactly at infinity, weights `k_σ≥2` with `w=k_σ−1+2w_σ` independent of `σ`, and continuous central character `ψ` agreeing with `(Na)^(1−w)` on an open subgroup of `F_l^×`. The quaternionic form space is a semisimple admissible representation of `GL₂(A_F^(∞,l))`; its U^l-invariants are the specified finite-level form space. After extending coefficients to `ℂ`, its quotient by reduced-norm functions decomposes into the regular algebraic cuspidal `π` of these weights and central character. Reduced-norm functions occur only in parallel weight two; at that weight the full decomposition also contains characters `χ` with `χ²=ψ`.

The corresponding Hecke algebra has a continuous Galois representation unramified at `x∤𝔫l`, with trace `T_x` and determinant ε_l(ψ∘Art⁻¹). At a non-Eisenstein maximal ideal it has an integral Carayol realization over the localized Hecke algebra. This algebra is generated by the `U_(ϖ_x)` for `x|𝔫, x∤l` and `T_x` at almost all other primes. The definite class sets and the fixed-central-character forms are HilbertModularVarietiesAndShimuraCurves R18.3.1–R18.3.3, the Jacquet–Langlands realization is R18.3.22, and the Galois representation over the localized quaternionic Hecke algebra is AutomorphicGaloisRepresentations §6.10; this target fixes Taylor's weight and central-character normalization on them.

Prove it as `quaternionic_hecke_galois_realisation`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §1, Lemma 1.3, p. 740 (PDF page 12), §1, proof of Lemma 1.3, p. 741 (PDF page 13), §1, the representations `ρ` and `ρ_𝔪, p`. 742 (PDF page 14).

*Needs:* GL2AutomorphicRepresentationsAndTransfer Layer R17.3; `HilbertModularVarietiesAndShimuraCurves` R18.3.1, R18.3.3 and R18.3.22; AutomorphicGaloisRepresentations §6.10; AutomorphicGaloisRepresentations §§3.10–3.14; ArithmeticGaloisRepresentations §5.10.

<a id="target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l"></a>
### 4.3 Fontaine–Laffaille shapes of quaternionic forms

Let `x∤𝔫` be a split place above l with `2≤k_x≤l−1`, and let `𝔪` be non-Eisenstein in the quaternionic Hecke algebra. For an open ideal I of `h_𝔪`, identify `((ρ_𝔪⊗ε_l^(−w_x)) mod I)|G_x` with the Fontaine–Laffaille realization of D in the specified local category, with `D≠D⁰` and `D⁰≠0`. Consequently residual inertia is either `ω₂^(k_x−1+(l+1)w_x)⊕ω₂^(l(k_x−1)+(l+1)w_x)`, or triangular `(ω^(k_x+w_x−1),*;0,ω^(w_x))`. Preserve the explicit twist and the split-place Fontaine–Laffaille interval. The torsion statement follows from the characteristic-zero one: `(ρ_𝔪⊗ε_l^(−w_x)) mod` I is a subquotient of a G_x-stable lattice in a direct sum of the representations attached to the eigenforms of the localized space, each crystalline at the split place x with weights in `[0,l−2]` (Hilbert local behaviour at l), and the essential image of the Fontaine–Laffaille functor is stable under subquotients.

Prove it as `local_residual_inertial_shape`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §1, proof of Corollary 1.5, p. 743 (PDF page 15).

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); PadicHodgeTheory §6.1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.7; AutomorphicGaloisRepresentations §§3.12 and 4.5–4.7; AutomorphicGaloisRepresentations §§4.5–4.7; PadicHodgeTheory §§6.1–6.2; AutomorphicGaloisRepresentations §§4.5–4.9.

<a id="target-skinner-wiles-level-adjustment"></a>
### 4.4 Level adjustment after a soluble totally real base change

Fix the residual triangular characters `(χ_(1,v),χ_(2,v))` at v|p, including their labeling when the residual representation splits. The residual representation is D_v-distinguished when these characters differ on the **full decomposition group**, rather than necessarily on inertia. A nearly ordinary seed is χ₂-good when its distinguished quotient character reduces to this chosen `χ_(2,v)` at every place above v. Ordinary means that the characteristic-zero quotient character is unramified with unit Frobenius eigenvalue; nearly ordinary means ordinary after a finite-order twist. These conditions depend on the selected coefficient place.

Let p be odd, F totally real and `ρ̄:G_F→GL₂(F̄_p)` irreducible and associated with a Hilbert newform f of parallel weight two and level `n_f`, written `n_f=n_f^(p)n_f′` with `n_f^(p)` supported above p and `n_f′` prime to p. The imported theorem gives a finite soluble totally real F′/F in which every place above p splits completely, such that `ρ̄|G_F′` is still irreducible and is associated with a weight-two newform g over F′ whose level divides `n_f^(p)∏_(q∈S)q`, where S is the set of places of F′ not above p at which `ρ̄|G_F′` is ramified. Ideals of F in this bound are extended to F′. If f is ordinary, or nearly ordinary, at the places above p, g can be taken with the same property; if moreover `ρ̄` is D_v-distinguished at every v|p and f is χ₂-good, then so are `ρ̄|G_F′` and g. The field F′ can also be required to have prescribed splitting and ramification at a finite set of places of F outside the level of f, and to have even degree. In applications S is made empty first: a soluble totally real base change with prescribed completions kills the finite residual inertia away from p, and the level of g then divides `n_f^(p)`.

Import the weight-two level-adjustment theorem, including the ordinary/nearly ordinary, distinguished and chosen-good-quotient refinements and outside-level local prescriptions, from OrdinaryAutomorphicFormsAndModularityLifting §6.14. Here derive only the even-degree and residual-inertia-killing application: use §2.16 to kill the finite away-p residual inertia while keeping all p-completions fixed, and take an even-degree soluble totally real extension split above p. Include the residual-kernel field in the avoidance datum, base change the seed and apply the imported theorem. Keep residual irreducibility at each step. For the auxiliary CM seed, the inducing quadratic field is split above p and the two residual characters on inertia have ratio `ε̄_p`, of order `p−1>1`. They remain distinct over every totally real extension split above p. Thus in that application one may take the soluble Galois closure and obtain an even-degree soluble Galois output without losing irreducibility or p-splitting.

**Checks.**

- `sw_level_already_minimal`: if `n_f′` is squarefree, F′/F is unramified at its support, and residual ramification persists at every place above that support, the displayed bound equals the extended `n_f`. If `n_f′` has a q² factor, the bound can still remove its higher exponent.
- `sw_level_one`: for the CM seed of §4.6, whose level is prime to p and whose residual representation is unramified away from p over F, the bound `n_f^(p)∏_(q∈S)q` equals 1, so g has level one.
- `sw_prescribed_splitting_outside_level`: prescribed splitting at a place in the level of f is not part of the conclusion; such a place can stay ramified in the residual representation over F′.
- `sw_full_decomposition_distinction`: two unramified characters with distinct Frobenius values are D_v-distinguished despite equal restrictions to inertia. An inertia-distinguished replacement would lose this case.
- `sw_quotient_label`: for a split local representation with distinct diagonal characters, interchanging them changes χ₂-goodness. The refinement preserves the selected label.
- `sw_weight_scope`: weight two is the direct theorem. Its ordinary or nearly ordinary weight-changing consequence uses Hida families and preserves the possible prime-to-p levels and χ₂-goodness; a general nonordinary weight-k version is not inferred from the authors' expectation.

Prove it as `skinner_wiles_level_adjustment`.

The sources are [Skinner–Wiles, base change][sw-base-change], main theorem and the remark following it, p. 17; reduction steps, p. 18; the definite quaternion algebra, Jacquet–Langlands–Shimizu and the pairing, pp. 18–20; Lemma 1 and the level-lowering congruence, pp. 20–25.

*Needs:* OrdinaryAutomorphicFormsAndModularityLifting §6.14 (Skinner–Wiles level adjustment with its selected quotient and outside-level local prescriptions); GL2AutomorphicRepresentationsAndTransfer §§R17.4.8–R17.4.11 (soluble base change/descent); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions).

<a id="target-taylor-crystalline-lifting"></a>
### 4.5 Crystalline lifting in the Fontaine–Laffaille range

Let `l>3` be prime, `2≤k≤l−1`, and F a totally real field of even degree in which l splits completely. Let `ρ:G_F→GL₂(O)` be continuous, irreducible and unramified outside finitely many places, with O the integers of a finite extension of `ℚ_l` inside `Q̄_l`, such that `ρ|G_x` is crystalline with Hodge–Tate numbers 0 and `1−k` at every place x above l. Assume that `ρ̄` restricted to G_F(√l*), `l*=(−1)^((l−1)/2)l`, is irreducible, and that there are a regular algebraic cuspidal `π` of `GL₂(A_F)` of weight k, unramified at every finite place, and an embedding `λ` of its coefficient field into `Q̄_l` with `ρ̄_(π,λ)≅ρ̄`. Then `ρ≅ρ_(π′,λ′)` for a regular algebraic cuspidal `π′` of weight k and an embedding `λ′`.

The determinant ratio `det ρ/det ρ_(π,λ)` is a finite l-power-order character: it is unramified at l, has Hodge–Tate weight zero, and reduces to one. Its square root exists for l>2; twist ρ by its inverse to match the determinant of the unchanged everywhere-unramified seed. This character is unramified at l, so crystallinity and the Hodge weights are preserved. Twist the resulting automorphic lift back at the end. Use the following two comparisons in sequence.

**Minimal comparison** (`taylorMinimalREqualsT`). Under the residual, weight, field and fixed-determinant hypotheses above, let R_∅ classify deformations unramified away from l and Fontaine–Laffaille at l, and let h_∅ act on the corresponding localized definite quaternionic space S_∅. Then `R_∅≅h_∅` is a complete intersection and S_∅ is finite free over h_∅. Taylor–Wiles prime selection uses irreducibility on `G_(F(√l*))`. Patching the minimal problem uses the smooth Fontaine–Laffaille conditions; apply the balanced module criterion with the minimal auxiliary-level control. Source: [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Theorem 2.6, p.751, with Lemmas 2.1–2.5, pp.745–750.

**Checks (minimal).** Σ=∅ imposes no extra away-l ramification. At k=l the Fontaine–Laffaille interval fails. Irreducibility only on G_F does not provide the stated Taylor–Wiles prime hypothesis.

**Nonminimal comparison** (`taylorNonminimalREqualsT`). For every finite set Σ of finite places away from l, let R_Σ have the same determinant and Fontaine–Laffaille conditions and allow unrestricted ramification at Σ, remaining unramified elsewhere. Let h_Σ and S_Σ be Taylor's localized Hecke algebra and definite quaternionic module at U_Σ. Then `R_Σ≅h_Σ` is a complete intersection and S_Σ is free over h_Σ. Prove the level-by-level extension from the minimal theorem. At `x∉Σ, x∤l`, put `α=diag(1,ϖ_x)` and construct `i_x(f)=q_xψ(ϖ_x)f−αT_xf+α²f`. The three-copy Ihara argument makes `S_(Σ∪{x})/i_xS_Σ` O-torsion-free. With Taylor's modified perfect pairings, compute `i_x†i_x=ψ(ϖ_x)q_x(1−q_x)(T_x²−(1+q_x)²ψ(ϖ_x))`. These pairings differ between the two levels, so the adjoint uses both.

For the augmentation at the fixed seed let `𝔭_Σ=ker(R_Σ→O)` and `Ω_Σ=S_Σ/(S_Σ[𝔭_Σ]+S_Σ[Ann_(h_Σ)(𝔭_Σh_Σ)])`. The augmented characteristic-zero eigenspace has dimension one by multiplicity one. Saturation identifies the augmented eigenspaces across i_x. Its adjoint gives the congruence-module length change; the deformation cotangent bound has at most the same change. Starting with the minimal equality, obtain `length_O(𝔭_Σ/𝔭_Σ²)≤length_O Ω_Σ`. Apply the numerical criterion in its paired-module form to deduce integral R=T, complete intersection and module freeness. Prove that module comparison here using the saturated eigenspace, perfect pairing and the numerical complete-intersection criterion of OrdinaryAutomorphicFormsAndModularityLifting §4.20, as in Diamond's Theorem 2.4 invoked by Taylor. No smoothness of the unrestricted away-l factors is used. Source: [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §3, Lemma 3.1 and the congruence/cotangent calculation, pp.751–754, Theorem 3.2, p.755.

**Checks (nonminimal).** Σ=∅ recovers the minimal theorem. For `q_x≡1 mod l` the factor `1−q_x` has positive valuation and its length contribution must be retained. For trivial residual local representation and `q_x≡1 mod l`, the determinant-one first-order matrices `F=I+t diag(1,−1), T=I+t E₁₂` satisfy `FTF⁻¹=T^q_x` modulo t². A lift modulo t³ would force `[diag(1,−1),E₁₂]=0`, whereas it is `2E₁₂≠0` for l>3. Thus that local factor need not be formally smooth.

Finally the determinant-normalized ρ defines a point of R_Σ for a finite Σ containing its away-l ramification. The nonminimal comparison supplies the eigenform π′, proving `taylor_crystalline_lifting` without restricting that ramification.

**Checks.**

- `taylor33_l_three_excluded`: `l=3` is excluded; the prime-selection step uses `l>3`.
- `taylor33_weight_range`: `k=l` lies outside the hypothesis `2≤k≤l−1`: the Fontaine–Laffaille window `[0,l−2]` does not contain the weights `{0,l−1}`.
- `taylor33_split_needed`: an inert place above `l (F_x≠ℚ_l)` is outside the hypothesis, so the theorem is not applied over a field in which l does not split completely.
- `taylor33_semistable_excluded`: a member with nonzero monodromy at a place above l, such as the Tate module of a Tate curve, is not crystalline, so the theorem does not apply to it.

Prove it as `taylor_crystalline_lifting`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Theorem 3.2 and Theorem 3.3 with its proof, p. 755; §2, the deformation rings and Hecke algebras with Lemmas 2.1–2.5 (Lemma 2.5 gives the Taylor–Wiles primes), pp. 745–750; §3, Lemma 3.1 and the argument for Theorem 3.2, pp. 751–755.

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); [Layer 4, Fontaine–Laffaille shapes of quaternionic forms](#target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l); LocalGaloisDeformationRings §1.6; LocalGaloisDeformationRings §1.13; `GlobalGaloisDeformations` §5.7 (existence of Taylor–Wiles primes for odd p, in Taylor's setting); `GlobalGaloisDeformations` §5.1 (Taylor–Wiles data) and §6.4 (the Taylor–Wiles system of deformation rings); DeformationAndDerivedPatchingAlgebra Layer 5; DeformationAndDerivedPatchingAlgebra §§5.5–5.6 and 6.5; GL2ModularityLifting §4.2; GL2AutomorphicRepresentationsAndTransfer Layer R17.3; OrdinaryAutomorphicFormsAndModularityLifting §§1.4–1.5, 2.9–2.10 (pairings, traces and Ihara), §4.20 (numerical complete-intersection criterion).

<a id="target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar"></a>
### 4.6 Modularity transfer through the auxiliary variety

Let E be a totally real field, M a number field and A/E an abelian variety of dimension `[M:ℚ]` with `O_M↪End_E(A)`, so that every Tate module `T_μA` is free of rank two over `O_(M,μ)`; for M totally real this is an M-Hilbert–Blumenthal abelian variety (Taylor 2002), and Taylor 2006 uses a CM coefficient field. Let `p>3` be a prime that splits completely in `E, ℘|p` a prime of M with arbitrary coefficient ramification over p, and suppose: A has good reduction at every place of E above p; `A[℘]≅Ind_(G_E′)^(G_E)ψ̄` for a quadratic CM extension E′/E in which every place above p splits, with `ψ̄` a character of `G_E′`; at each place w|p of E the two characters of `A[℘]|G_w` are one unramified and one of the form `ε̄_p` times an unramified character; and the CM form attached to the algebraic Hecke character lifting `ψ̄` (by automorphic induction from E′) has weight two and level prime to p. Then `T_℘A` is modular over E: there is a regular algebraic cuspidal `π` of `GL₂(A_E)` of parallel weight two with `ρ_(π,℘)≅T_℘A⊗ℚ`. Consequently `ρ_(π,μ)≅T_μA⊗ℚ` for every prime `μ` of M, and for every `μ` the residual representation `A[μ]` is modular over E. This is the step that turns the auxiliary point of Layer 3 into a residual modular witness for `ρ̄=A[λ]`.

Prove it by the base change, crystalline lifting and descent argument that Taylor gives as the alternative at the end of the proof of his Proposition 4.1; it does not use a nearly ordinary lifting theorem whose residual-image hypothesis excludes residual representations induced from a CM extension split above p.

1. Crystallinity and coefficient ramification. Good reduction at w|p makes the rational Tate module crystalline. Over an algebraic closure of the coefficient field, its ℘-summands are crystalline by the idempotent decomposition of `M⊗ℚ_p`; this uses characteristic-zero separability and permits ramified M_℘. Each has Hodge–Tate numbers 0 and −1. Indeed all endomorphisms are defined over the totally real E: complex conjugation on Betti homology commutes with M and interchanges the two Hodge summands. Their dimensions at each embedding of M are equal and sum to two, hence are one each. Transport through the de Rham and good-reduction crystalline comparisons. This proves the rank-two Hodge assertion with ramified coefficients, rather than inferring it from coefficient unramifiedness.
2. Residual irreducibility over E(√p*). The extension E′/E is split above p, whereas E(√p*)/E is ramified there, so the two are distinct and E′E(√p*) is a biquadratic extension. On inertia at a place of E(√p*) above p, which has index two in the inertia of `ℚ_p`, the ratio of the two local characters is `ε̄_p` restricted to that subgroup, of order `(p−1)/2`. This is nontrivial exactly because `p>3`, so `ψ̄≠ψ̄^c` on G_(E′E(√p*)) and the induced representation stays irreducible on G_(E(√p*)). The same argument works over every totally real extension of E in which p splits completely.
3. The seed. Choose a finite soluble Galois totally real E₁/E, split at every place above p, killing the finite residual inertia of `Ind ψ̄` at the finitely many ramified places away from p (Layer 2). Base change the CM form to E₁; it stays cuspidal because the residual representation is irreducible over E₁, and its level stays prime to p. Apply the level adjustment of §4.4 to it: over a soluble Galois totally real E₂/E₁ of even degree in which p splits completely, `ρ̄_℘` is the residual representation of a weight-two form of level one, because the residual representation is unramified away from p over E₁ and the p-part of the level is trivial.
4. Lifting. Over E₂ the representation `T_℘A` satisfies the hypotheses of the crystalline lifting theorem with `l=p` and `k=2`: `p>3, 2≤2≤p−1, E₂` has even degree and p splits completely in it, `T_℘A` is crystalline of Hodge–Tate numbers 0 and `−1` above p, its residual representation is irreducible on G_(E₂(√p*)) by step 2, and the seed of step 3 is unramified at every finite place. Hence `T_℘A|G_E₂` is modular.
5. Descent. The tower E₂/E is soluble and Galois, and `T_℘A` is irreducible on `G_E₂` (its residual representation is). Descend through the cyclic steps: at each step the automorphic representation upstairs is invariant under the Galois group, since its Galois representation is the restriction of `T_℘A`, so it descends to a cuspidal representation whose Galois representation is `T_℘A` twisted by a character of the step; choose the twist that recovers `T_℘A`.
6. Other primes. The traces of Frobenius on `T_μA` lie in M and do not depend on `μ` (for an abelian variety of this type the O_M-linear characteristic polynomial of Frobenius has coefficients in M independent of `μ`); by Chebotarev and Brauer–Nesbitt, `ρ_(π,μ)≅T_μA⊗ℚ` for every `μ`, and reducing modulo `μ` gives the residual witnesses.

The descent returns to E. The intermediate fields E₁ and E₂ may fail the splitting conditions at the starting prime of Layer 3, whereas E, produced by the approximation step there, has them; the output is therefore stated over E.

**Checks.**

- For `p=5`, coefficient field `ℚ(√5)` is ramified at 5, but the rational coefficient-idempotent and Hodge argument still gives weights {0,−1}; no unramified coefficient hypothesis is required.
- `aux_transfer_p_three`: for `p=3` the ratio `ε̄₃` restricted to the index-two inertia subgroup is trivial, so step 2 fails and `p=3` is excluded.
- `aux_transfer_tate_curve`: a member with multiplicative reduction at a place above p, such as the Tate module of a Tate curve, has nonzero monodromy and is not crystalline, so step 1 fails without good reduction.
- `aux_transfer_level_one`: for the CM seed with level prime to p and a residual representation unramified away from p after the first base change, the level bound of §4.4 is 1.
- `aux_transfer_descent_field`: the conclusion is over E, not over E₂, so the splitting conditions imposed on E in Layer 3 are retained.

Prove it as `auxiliary_modularity_transfer`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], end of the proof of Proposition 4.1 (the alternative through the main theorem of Skinner–Wiles' base change paper, Theorem 3.3 and descent), pp. 762–763; [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], the auxiliary variety and its torsion, printed pp. 13–15; [Skinner–Wiles, base change][sw-base-change], main theorem, p. 17.

*Needs:* [Layer 4, Level adjustment after a soluble totally real base change](#target-skinner-wiles-level-adjustment); [Layer 4, Crystalline lifting in the Fontaine–Laffaille range](#target-taylor-crystalline-lifting); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.9; GL2AutomorphicRepresentationsAndTransfer §R17.4.10; GL2AutomorphicRepresentationsAndTransfer §R17.6.19; GL2AutomorphicRepresentationsAndTransfer §R17.4.16 (automorphic induction of the CM Hecke character); AutomorphicGaloisRepresentationsPartII Layer AG2.0 (the ℘-adic character of an algebraic Hecke character); `NeronModelsAndSemistableAbelianVarieties` §5.1 (Néron–Ogg–Shafarevich) and §5.3 (the p-adic comparison at the residue prime: good reduction gives a crystalline Tate module); `ArithmeticGaloisRepresentations` Layer 6 (Tate modules with endomorphisms); PadicHodgeTheory Layers 3–5 (coefficient extension, direct summands and the de Rham comparison); ComplexComparisonPartII §§C5.1, C5.3 (Betti–de Rham comparison and Hodge decomposition); ArithmeticGaloisRepresentations §5.3 (recognition by Frobenius polynomials); AutomorphicGaloisRepresentations §7.3.

<a id="target-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l"></a>
### 4.7 Ordinary residual potential modularity

Let l be odd, `k/F_l` finite, F totally real, and `ρ̄:G_F→GL₂(k)` continuous irreducible and totally odd. Suppose at every v|l it has shape `(ε̄_lχ_v⁻¹,*;0,χ_v)`. Obtain finite Galois totally real E/F split at every v|l and a regular algebraic cuspidal `π` with residual member `ρ̄|G_E`. At an unramified x|l with nonscalar residual inertia, `χ_x²|I_x=ε̄_l^n, 0≤n<l−1` and `n≠1` in the semisimple case, require the characteristic-zero ordinary shape with a tamely ramified lift of `χ_x`. In the nonsoluble Taylor/HBAV branch assume the ordered polarization norm witnesses of §3.3 for each determinant-normalized auxiliary construction, and use its determinant normalization.

Corollary 1.7 treats an arbitrary continuous irreducible totally odd residual representation. Choose finite Galois totally real E/F whose l-adic places are unramified of residue degree at most two, with the residual modular witness. For its local ordinary conclusion, at the specified unramified v|l require nonscalar inertia and shape `(χ_(v,1),*;0,χ_(v,2))` with `**χ_(v,2)χ_(v,1)⁻¹|I_v=ε̄_l^n**`. The lifted lower-right character is a tamely ramified lift of `χ_(v,2)`. This ratio condition is on inertia; it does not normalize the determinant on all `G_v`. The quadratic-field and square-root-character construction must preserve total reality and the stated l-adic conditions.

The determinant adapter is `quadraticDeterminantNormalization`. Put `ψ=det ρ̄·ε̄_l⁻¹`, an even finite-order character. In the first theorem `ψ` is trivial on each full `G_(F_v), v|l`. The connecting class for `0→μ₂→Q/Z→Q/Z→0` lies in Br(F)[2]; it vanishes at infinity and at the places above l. Choose `a∈F×` positive at every real place, a square at every v|l, and a nonsquare at every finite place with nonzero obstruction. Weak approximation permits all these conditions simultaneously. Include the residual-kernel field in the finite avoidance extension M, and also give an odd valuation at a new prime split in its Galois closure. Then D=F(√a) is totally real, split at l and disjoint from M. Restriction to each nonsplit quadratic local extension multiplies its Brauer invariant by two; all local obstructions over D vanish. ClassFieldTheory Layer 10 (`eq_zero_of_localInv_eq_zero`) and the cohomology exact sequence give a continuous finite-order `η` with `η²=ψ|G_D`.

At places above `l, η` is quadratic. Choose a global quadratic character `θ` whose restrictions there equal `η⁻¹`, and whose values at complex conjugations make `ηθ` even. This uses weak approximation for square classes, not cyclic extensions of arbitrary 2-power degree. Replacing `η` by `ηθ` keeps its square `ψ` and makes it trivial on the specified l-adic groups. Its values have order dividing `2·ord ψ`, prime to l; a finite extension of k contains them. Now `ρ̄|G_D⊗η⁻¹` has determinant `ε̄_l`, the original local shape and total oddness. Apply the normalized construction, and twist the automorphic witness back by the Teichmüller lift of `η`. This also preserves the stated ordinary local lift. In this auxiliary-variety branch assume the residual image nonsoluble, as in §3.2. Taking Galois closure over F preserves total reality and l-splitting, and the restricted residual representation stays absolutely irreducible: its projective image is a normal subgroup containing a nontrivial complex conjugation; Dickson’s classification forces it to contain the nonabelian simple socle. To obtain the automorphic witness over a Galois field, select that field in the moduli step. For the normalized auxiliary moduli X/D apply Layer 2 to `Res_(D/F)X`, with a Galois totally real E₀/F disjoint from D and with all-conjugate local opens. The resulting point lies in X(DE₀), and DE₀/F is Galois. Local splitting at l follows from the split local data for both D/F and E₀/F. After the auxiliary modularity argument over DE₀, twist back by `η|G_(DE₀)`. Thus the proof uses an auxiliary point over the Galois field from the outset; it does not invoke automorphic base change along an arbitrary nonsoluble Galois closure. The soluble-image branch rests on the input `solubleResidualRegularOrdinarySeed`: for `ρ̄` as in the first theorem with soluble image, there are a finite Galois totally real E/F in which every place above l splits completely and a regular algebraic cuspidal `π` over E with residual representation `ρ̄|G_E`, satisfying the ordinary conclusion above at every unramified x|l with nonscalar residual inertia. Taylor deduces this case from the known cases of the strong Artin conjecture, which give a parallel weight-one form, together with congruences to regular weight in the manner of Rogawski–Tunnell (Taylor, Fontaine–Mazur, printed p. 15, the paragraph before Theorem 1.6). Rogawski–Tunnell Proposition 2.8, p. 25, lifts a power of the Hasse invariant for every l prime to an integer D, but their Theorem 2.9, pp. 26–27, produces a congruent cuspidal form of weight greater than two only at coefficient places of norm at least a bound `N(π)` depending on the form. A fixed l below that bound, and the ordinary shape at x|l, are therefore not covered by that theorem. The seed is a conditional input of this roadmap (see Conditional inputs), used only in the soluble-image branch; a weight-one lift alone does not supply it.

For Corollary 1.7, first prescribe at every v|l an unramified quadratic extension. An irreducible two-dimensional residual local representation becomes reducible there: wild inertia is a normal l-group and acts trivially in an irreducible characteristic-l representation, and the two tame inertia characters are interchanged by Frobenius. A reducible restriction stays reducible. Unramified local degree two also kills any local Brauer obstruction to a square root. Choose a totally real quadratic D/F with these completions and ramification at a new prime split in the residual-kernel field by weak approximation. Over D the obstruction is locally zero above l; kill the remaining obstruction by a further totally real quadratic extension split there, as above. Take the Galois closure D̃/F of this two-step quadratic tower before choosing the auxiliary point. It is a soluble 2-extension, and every l-adic completion remains inside the unique unramified quadratic extension of `F_v`. Restriction keeps the character square root; prescribe its local values when correcting `η` by a quadratic character over D̃. Apply the normalized moduli construction to `Res_(D̃/F)X` and choose E₀/F Galois with the required local opens and avoidance. Its point gives the witness over D̃E₀/F, which is Galois from the outset. Twist back there. Ratios of the two residual characters are unchanged by scalar twist, so the inertial ratio and the nonscalar test survive. The final Galois field is unramified at l with residue degree at most two: every conjugate local field is contained in the unique unramified quadratic extension of `F_v`.

**Checks.**

- `determinant_split_control`: `ψ|G_(F_v)=1` allows a split quadratic completion and `η|G_(F_v)=1`; merely knowing `ψ` is trivial on inertia would not justify that particular local choice.
- `determinant_real_control`: oddness makes `ψ(c)=1`. An odd `ψ` at a real place has no character square root on its order-two Galois group, and a totally real extension cannot remove that obstruction.
- `determinant_avoidance_control`: ramification at the additional prime split in M excludes `D⊆M`; total reality alone does not imply disjointness.
- `determinant_degree_control`: an unramified quadratic local completion, followed by split completions, stays of residue degree two after Galois closure. An arbitrary soluble local extension would not retain Corollary 1.7's degree bound.

Prove it as `taylor_ordinary_potential_residual`.

The sources are [Rogawski–Tunnell][rogawski-tunnell], Proposition 2.8, p.25, and Theorem 2.9, pp.26–27 (only the large-coefficient-prime congruence); [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Theorem 1.6, printed p. 15, Theorem 1.6, 'Moreover' clause, printed p. 15, paragraph before Theorem 1.6, printed p. 15, Corollary 1.7, printed p. 16; [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Corrections to [Tay4], last bullet, p. 777, same bullet, p. 777; [Snowden v1][snowden], Lemma 4.2.1 and Corollary 4.2.2, printed p. 12 (the character obstruction and its local–global criterion). The split quadratic refinement above uses the local invariant restriction law and weak approximation.

*Needs:* ClassFieldTheory Layers 5 and 10 (`brRes`, local invariant restriction, `eq_zero_of_localInv_eq_zero`); GlobalNumberFields Layer 1 (`TauCetiRoadmap.GlobalNumberFields.weakApproximation_denseRange`); `LocalGaloisGroups` (tame inertia and Frobenius); [Layer 4, Modularity transfer through the auxiliary variety](#target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar); [Layer 4, The ordinary auxiliary Tate module](#target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l); GL2AutomorphicRepresentationsAndTransfer Layer R17.5; [Layer 2, Approximation above a preliminary field](#target-moret-bailly-over-a-preliminary-extension) (Weil restriction with all-conjugate opens); `SerreWeightAndLevelOptimisation` (regular-weight congruences for the soluble branch).

<a id="target-taylor-2006-potential-modularity-when-residually-irreducible-at-l"></a>
### 4.8 The niveau-two potential-modularity theorem

Let `l>2` and `ρ̄:G_ℚ→GL₂(F̄_l)` be continuous odd with inertia `ω₂^(k−1)⊕ω₂^(l(k−1)), 2≤k≤l`. Obtain a totally real Galois `F/ℚ` of even degree split at l and a regular algebraic cuspidal weight-two `π` with residual representation `ρ̄|G_F`. At x|l its tame WD inertia is `ω₂^(k−(l+1))⊕ω₂^(lk−(l+1))`. Taylor's Corollary 4.6 permits its central character away from l to be unramified.

In Taylor's construction choose p₁,p₂ by his positive-density Chebotarev conditions, with p₁>3. Use `jointPairedTorsionModuli` for the combined λ,℘₁,℘₂ markings and polarization multipliers, and its trace-polarized descent to B with coefficient field EM. The real field E in this coefficient datum is tamely ramified at p₁; no individual unramified-prime rigidification is assumed. The twisted space X_ρ has a ℚ_(p₁)-point through its local identification with X_Dih and the CM point of Lemma 4.5. Its descended B has good reduction there by the away-p₁ CM characters and Néron–Ogg–Shafarevich. Apply `hilbertGoodReductionOpen` to the all-prime finite-type integral model, forgetting p₁-primary level first. This gives a nonempty good-reduction open without assuming smoothness of that integral model.

Approximation produces B/F with `B[λ]≅ρ̄|G_F` and the two auxiliary induced residual modules, good reduction above p₁, and complete splitting at l,p₁,p₂. Since p₁ splits in M, `B[℘₁]` is induced from FM/F, split above p₁, with one unramified and one cyclotomic-times-unramified local character. Apply §4.6 with base field F, coefficient field EM and its possibly ramified prime ℘₁. Its rational coefficient-summand argument gives the crystalline weights {0,−1}; §4.5 includes the required nonminimal away-p₁ ramification. Transfer modularity from `T_(℘₁)B` to `T_λB` and reduce at λ. Taylor's computed action of inertia at x|l on the auxiliary Tate module gives the stated WD type. Descent returns the modular form to F, retaining l-splitting.

**Checks.**

- For p₁=5, the coefficient extension contains a real cyclotomic field ramified with index two at 5; the application of §4.6 permits it.
- A single ramified coefficient-prime marking need not be fine; the combined λ,℘₁,℘₂ datum has the torsion-free common kernel needed for polarized descent.
- A singular integral Hilbert model at p₁ still has open integral-point charts. Smoothness is used for the generic moduli variety in approximation, not for those integral charts.
- Multiplicative reduction at p₁ would not give a crystalline Tate module and is excluded by the chosen open.

Prove it as `taylor_niveau_two_potential_residual`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Proposition 4.1 and following remark, pp. 755–756; the choice of p₁,p₂ and the twisted moduli spaces, pp. 756–760; Lemmas 4.4 and 4.5, pp. 761–762; end of the proof of Proposition 4.1, pp. 762–763; Corollary 4.6, p. 763.

*Needs:* [Layer 3, Joint prime levels, polarization descent and integral opens](#target-joint-paired-torsion-moduli); `HilbertModularVarietiesAndShimuraCurves` H2.2–H2.2b (the all-prime finite-type integral model); [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 4, Modularity transfer through the auxiliary variety](#target-modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar); `NeronModelsAndSemistableAbelianVarieties` §5.1; `AutomorphicGaloisRepresentations` §3.13 (CM characters as avatars of algebraic Hecke characters); `ShimuraVarieties` §5.3, §5.5 and §5.10 (CM abelian varieties, their number-field models and the main theorem of complex multiplication, for the CM point of Lemma 4.5); GL2AutomorphicRepresentationsAndTransfer Layer R17.4.

<a id="target-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction"></a>
### 4.9 Quaternionic weight reduction

Let `l>3` split completely in the even-degree totally real F, and `0≤i≤l−2`. For character `η̄^i` of `U₀(𝔫,l)/U₁(𝔫,l)`, use the local induced coefficient filtration `0→Sym^i→I_x^i→Sym^(l−1−i)⊗det^i→0`. Its global subspaces `S_T` satisfy S_∅≅S_(i+2)(U_H(𝔫)). For `x∉T` construct an injection `κ_x:S_(T∪{x})/S_T↪S_(T∪{x})`, equivariant for good `T_y,S_y` and the required `U_(ϖ_x)`, whose composite with the quotient projection is `V_(ϖ_x)`.

Deduce the surjection of Hecke algebras to weight `i+2`. Localization at `𝔪` is nonzero if every `V_(ϖ_x)` lies in every maximal ideal of h″ above `𝔪`. A sufficient condition is that `𝔪` is non-Eisenstein and each residual local restriction is not of shape `(εχ₁,*;0,ω^iχ₂)` with `χ₁,χ₂` unramified. The U-ordinary comparison gives the triangular local shape with lower-right Frobenius eigenvalue `φ(U_(ϖ_x))`; the perfect pairing and adjoints give the dual V-shape. Use `Sym^i` and the quotient `S_(T∪{x})/S_T` in the construction.

Prove it as `weight_reduction_hecke_surjection`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, the pairing and the operators 𝐔, 𝐕, p. 764 (PDF page 36), §5, Lemma 5.1, p. 765 (PDF page 37), §5, Corollary 5.2, p. 767 (PDF page 39).

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations); AutomorphicGaloisRepresentations §6.10; `HilbertModularVarietiesAndShimuraCurves` R18.3.5 (perfect quaternionic pairing).

<a id="target-taylor-2006-lemma-5-3-weight-shift"></a>
### 4.10 The weight shift by l+1

For `k≥2`, construct the weight shift from k to `k+l+1` with the prescribed cyclotomic twist. Track the Hecke normalization: `T_y` is multiplied by N(y), while `S_y` is multiplied by N(y)². Retain the level and central-character conditions needed for Taylor's coefficient injection; the result transports the chosen residual system of eigenvalues, rather than identifying untwisted characteristic-zero representations of different weights.

**Checks.**

- At every `y∤l` the shifted homomorphism has T_y-value `N(y)φ(T_y)` and S_y-value `N(y)²φ(S_y)`, so its residual representation is `ρ̄_φ⊗ε̄_l`: the Frobenius trace at y is multiplied by N(y). A shift that leaves `T_y` unchanged fails at any y with N(y)≢1 mod l.
- From weight `k=2` the shift lands in weight `l+3`, with central character ψ·(ε∘Art⁻¹). Multiplication by the Hasse invariant would instead give weight `k+l−1=l+1` with the same residual eigenvalues; the two shifts must not be confused.
- The coefficient embedding is multiplication by `X^lY−XY^l`, which transforms under `GL₂(F_l)` by the determinant. For `g=diag(a,1)` with `a∈F_(l²)` not in `F_l` it is not semi-invariant, since `a^l≠a`; this is why l must split completely in F.

Define it as `weightShift`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, proof of Lemma 5.3, p. 768 (PDF page 40).

*Needs:* [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-taylor-2006-lemmas-5-4-5-6-weight-and-level"></a>
### 4.11 Weight and level removal

For `l>3` and continuous odd `ρ̄` of `G_ℚ` with inertia `ω₂^(k−1)⊕ω₂^(l(k−1)), 2≤k≤l`, obtain a totally real Galois F split at l and a weight-two regular algebraic cuspidal witness whose conductor at x|l divides x. Next make it unramified at finite places away from l. Finally choose F of even degree and a weight-k witness unramified at every finite place. Establish respectively Lemma 5.4, Corollary 5.5 and Lemma 5.6 using the CDT type/Jordan–Hölder interfaces and the specified Skinner–Wiles base change.

Prove it as `weight_and_level_potential_residual`.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], §5, Corollary 5.5, p. 769 (PDF page 41), §5, proof of Lemma 5.6, p. 770 (PDF page 42). [Conrad–Diamond–Taylor][cdt], author manuscript Lemmas 3.1.1 and 4.2.4, PDF pp. 13 and 18, supplies the reductions of `Θ(χ_k)` and the type-to-Hecke passage used on Taylor p. 769.

*Needs:* [Layer 4, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [Layer 4, Level adjustment after a soluble totally real base change](#target-skinner-wiles-level-adjustment); [Layer 4, Fontaine–Laffaille shapes of quaternionic forms](#target-taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l); [Layer 4, Quaternionic weight reduction](#target-taylor-2006-lemma-5-1-corollary-5-2-weight-reduction); [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-taylor-2006-theorem-5-7-serre-weight-at-level-one"></a>
### 4.12 The Serre-weight level-one witness

Let `l>3` and `ρ̄:G_ℚ→GL₂(F̄_l)` be continuous irreducible odd with irreducible restriction to `G_(ℚ_l)`. Obtain a totally real Galois F of even degree split at l and a regular algebraic cuspidal `π` with residual member `ρ̄|G_F`, infinity weight `k_(ρ̄)` and no finite ramification. Combine the niveau-two construction, weight changes and level removal. The prime-three case required for the larger KW theorem uses the separate auxiliary-prime argument below.

Prove it as `taylor_serre_weight_potential_residual`.

For `l=3` with nonsoluble residual image, use the auxiliary-prime modification in Khare’s arXiv v1, §2.1, p. 10. Over every totally real field occurring in the construction the image remains nonsoluble, and `ε̄₃` has order two. Darmon–Diamond–Taylor Lemma 4.11 then gives an element g with `ε̄₃(g)=−1` and `(tr ρ̄(g))²/det ρ̄(g)≠0`: if there were no such element, the restriction to `ker ε̄₃` would be reducible, making the full image soluble. Chebotarev supplies an auxiliary prime r, away from the fixed ramification, with Nr≡−1 mod 3 and `tr ρ̄(Frob_r)≠0`. The level subgroup at r removes order-three stabilizers, while the trace inequality ensures that localization at the residual maximal ideal removes the unwanted auxiliary-level contribution. This supplies the non-neatness correction when passing from Taylor §4 to §5; the coefficient filtration and the weight/level argument then apply at 3. The same correction supplies the auxiliary levels in Taylor §§2–3. The `l=3` assertion is thus a separate target `khareThreeSerreWeightPotentialResidual`, with nonsoluble image, rather than an application of Taylor’s `l>3` statement. Soluble images use the strong-Artin and Serre-weight-optimization branch of KW II Theorem 6.1.

**Checks.** At `l=3` the needed residue class is `Nr=−1`, so replacing this by a Taylor–Wiles prime `Nr=1` loses the stabilizer control. The forbidden trace is zero because `1+Nr=0` in characteristic three. If the cyclotomic-kernel restriction is reducible, the contrapositive argument does not produce this prime. A soluble residual image is handled by the separate modular branch, not by the nonsoluble construction.

The sources are [Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation], Theorem 5.7 and proof, pp. 770–771; [Khare, level one][khare-level-one], arXiv v1 §2.1, p. 10 (the auxiliary-prime modification, with its references); [Darmon–Diamond–Taylor][ddt], Lemma 4.11 and the preceding auxiliary-level discussion, pp. 118–119, and Theorem 2.47(b), p. 81; [KW II][kw-serre-modularity-II], proof of Theorem 6.1, pp. 54 and 56–57. In the Duke version of Khare's paper this auxiliary-prime input is Lemma 2.2.

*Needs:* [Layer 4, Weight and level removal](#target-taylor-2006-lemmas-5-4-5-6-weight-and-level); [Layer 4, The weight shift by l+1](#target-taylor-2006-lemma-5-3-weight-shift); [Layer 4, Quaternionic forms and Hecke–Galois realizations](#target-taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations).

<a id="target-dyadic-auxiliary-moduli"></a>
### 4.12a Dyadic paired torsion moduli and local points

Construct `dyadicAuxiliaryModuli` for nonsoluble S-type residual data at 2, with the local weight-two finite-flat or weight-four toric alternative in KW II. Choose a distinct odd auxiliary prime, real multiplication and one fixed ordered polarization module, and pair the prescribed 2-torsion with the odd auxiliary torsion. Retain the actual pairings and determinant normalization. The odd prime level supplies fine rigidification: level 2 alone does not. Construct the simultaneous paired Isom twist and its universal HBAV, compute the multiplier and narrow-class component label, and descend the selected smooth geometrically connected component to its field of definition. Choose the coefficient and component data so that this field is the base field used for the local-point application. Whenever the construction adjusts a produced polarization module to the ordered principal module, assume its narrow-class norm witness as in §3.3.

Prove nonemptiness on that same descended component at the auxiliary odd prime, over ℚ₂, and over ℝ. In the reducible weight-two finite-flat case construct a good ordinary ℚ₂-point: the obstruction to lifting the extension class is the cup product of an unramified character with the finite class, hence zero. In weight four construct the completely toric ℚ₂-point. For irreducible local restriction use the niveau-two construction's ℚ₂-point. At a real place treat both the identity residual involution and the nonidentity unipotent involution: use the trace-polarized real lattice, and its lattice modification at 2 for the latter. Distinct ± eigenspaces in characteristic two cannot supply this step. Match both torsion pairings and the component in every local construction. Smoothness supplies nonempty local opens; the ℚ₂-valued opens permit complete splitting at 2.

**Checks.** Level 2 alone retains the automorphism −1, while the odd prime marking removes it. The identity and `[[1,0],[1,1]]` are the two dyadic residual involution classes and require the two real lattices. A weight-four toric point has nonzero monodromy and cannot be used as a finite-flat good-reduction point. A local point on a different component does not prove local nonemptiness of the descended component.

The sources are [KW II][kw-serre-modularity-II], proof of Theorem 6.1, pp.55–56 (real lattices, ℚ₂-points and reduction conditions); [Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur], Lemma 1.2 and its corrected polarization convention, as used there.

*Needs:* HilbertModularVarietiesAndShimuraCurves H1.1 and H1.8 (ordered modules and pairings), H6.2–H6.3 (the twisting/descent method, extended here to paired 2/odd torsion with odd rigidification, rather than H6.1 or H6.5 at 2); AlgebraicModuliForArithmeticGeometry §3.5 (effective descent); AbelianSchemesAndArithmeticModuli Layer A6; [Layer 3, CM characters with simultaneous local reductions](#target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions); [Layer 4, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l) (the CM local construction, extended to 2 here); ArithmeticGaloisDuality Layer D7 (local obstruction pairing); NeronModelsAndSemistableAbelianVarieties §3.14 (toric uniformization).

<a id="target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f"></a>
### 4.13 Controlled residual potential modularity

For an S-type residual `ρ̄` of `G_ℚ`, when `p>2` assume `2 ≤ k(ρ̄) ≤ p+1` and absolute irreducibility on `G_(ℚ(ζ_p))`; when `p=2` assume nonsoluble image and `k(ρ̄)∈{2,4}`. Construct a totally real Galois `F/ℚ` of even degree, unramified at p and split there if `ρ̄|D_p` is irreducible, preserving the residual image. When `p>2` or `k=2`, over F the representation has a cuspidal Hilbert modular witness of weight `k(ρ̄)`, unramified at every place above p. In all cases it has a witness of weight two with conductor dividing each v|p, unramified there when the residual representation is finite flat. Build the four field controls in this construction: if `k=p` and residual inertia is trivial, trivialize the full local decomposition restriction upstairs; make every completion at a prescribed away-p place contain its chosen finite local extension; for odd p and `k=p+1`, require complete splitting at p; and impose linear disjointness from the chosen finite avoidance field. In the dihedral case also use the split-prime condition of KW II p.54 preserving cyclotomic irreducibility. The odd ordinary Taylor/HBAV branch takes the norm witnesses of §3.3; the dyadic branch consumes §4.12a with its stated polarization hypotheses. This is a theorem about `ρ̄`; a characteristic-zero lift is not an input.

**Checks.** At `p=2,k=4`, the dyadic hypothesis holds although `4≤p+1` fails; the weight-two witness can be Steinberg, and no unramified weight-four witness is asserted. Trivial residual inertia can coexist with nontrivial unramified Frobenius, so the `k=p` control must kill the full decomposition restriction. An away-p extension prescribed only for one embedding does not meet the all-completion control. Odd `k=p+1` requires splitting, not merely unramified completions.

Prove it as `kw_potential_residual`.

The sources are [KW II][kw-serre-modularity-II], section 6, Theorem 6.1, pp. 53-54, Theorem 6.1(ii), p. 54, proof of Theorem 6.1, solvable case, p. 54, proof of Theorem 6.1, non-solvable case, p. 54, proof of Theorem `6.1, p = 2` and k(rho-bar) `= 4`, pp. 55-56, proof of Theorem 6.1, ordinary k(rho-bar) `= 2` branch, p. 56, proof of Theorem `6.1, p = 3` branch, p. 56, proof of Theorem 6.1, weight adjustment, p. 57.

*Needs:* [Layer 4, Dyadic paired torsion moduli and local points](#target-dyadic-auxiliary-moduli); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [Layer 2, Disjointness through towers](#target-tower-linear-disjointness); [Layer 2, The integral-point theorem](#target-moret-bailly-theorem-incomplete-skolem-data-have-integral-points); [Layer 2, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); GL2AutomorphicRepresentationsAndTransfer Layer R17.5; OrdinaryAutomorphicFormsAndModularityLifting Layer 6; [Layer 4, Ordinary residual potential modularity](#target-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l); [Layer 4, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [Layer 4, The Serre-weight level-one witness](#target-taylor-2006-theorem-5-7-serre-weight-at-level-one); AutomorphicGaloisRepresentations §§3.10–3.14; GL2ModularityLifting §6.15; GL2ModularityLifting §5.4; GL2ModularityLifting §§1.1–1.8; PadicFamilies §5.8; PadicFamilies Layer 5; SerreWeightAndLevelOptimisation Layer 3; HilbertModularVarietiesAndShimuraCurves Layer R18.3; [Layer 3, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity"></a>
### 4.14 The ordinary Annals variant

Let `ρ̄` be S-type in odd characteristic p, irreducible on `G_(ℚ(μ_p))`, with `2≤k(ρ̄)≤p+1` and `k(ρ̄)≠p`. Obtain totally real Galois `F/ℚ` of even degree, unramified at p and split there if the local residual representation is irreducible. Preserve `im ρ̄` and absolute irreducibility on `G_(F(μ_p))`. The first cuspidal Hilbert witness is everywhere unramified and has weight k; the second has weight two, is unramified away from p and has conductor dividing v at each v|p, with unramifiedness in the finite-flat case. Both are ordinary above p when `ρ̄` is ordinary. The ordinary Taylor/HBAV branch assumes the ordered norm witnesses of §3.3. Import the Hida and soluble base-change inputs giving these local properties. The supersingular cases use Taylor's `l>3` theorem and the separate prime-three input.

Prove it as `kw_ordinary_potential_residual`.

The sources are [KW Annals][kw-annals-2009], Theorem 2.1, p. 234, proof of Theorem 2.1, p. 234, proof of Theorem 2.1, p. 237, proof of Theorem 2.1, printed p. 235.

*Needs:* [Layer 4, The niveau-two potential-modularity theorem](#target-taylor-2006-potential-modularity-when-residually-irreducible-at-l); [Layer 4, The ordinary auxiliary Tate module](#target-taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l); [Layer 4, The Serre-weight level-one witness](#target-taylor-2006-theorem-5-7-serre-weight-at-level-one); HilbertModularVarietiesAndShimuraCurves Layer H6; GL2AutomorphicRepresentationsAndTransfer Layer R17.4; HilbertModularVarietiesAndShimuraCurves Layer R18.3; PadicFamilies §5.8; PadicFamilies Layer 5; [Layer 3, The twisted Hilbert moduli application](#target-local-points-at-l-p-infinity-and-the-point-over-e).

<a id="target-snowden-totally-real-potential-residual-modularity"></a>
### 4.15 Residual modularity over totally real fields

Let F be totally real, p odd, and `ρ̄` : `G_F → GL₂(F̄_p)` continuous and odd. Fix finite-order `ψ` with `det ρ̄ = ψ̄χ̄_p`, a finite M/F and a definite A/B/C type function t above p. Here Snowden's local types of a weight-two representation of `G_(F_v)` with determinant `χ_p` times a finite-order character are: A, potentially crystalline and ordinary; B, potentially crystalline and not ordinary; C, potentially an extension of the trivial character by `χ_p`. A type function assigns one letter to each v|p, and definite excludes the ambiguous A/C; for a parallel weight-two eigenform the type at v is A or B exactly when `π_v` is principal series or supercuspidal, and C exactly when `π_v` is special. Choose finite Galois M′/F containing M and a totally real Galois F′/F disjoint from M′ so that, for every further totally real F″/F′ disjoint from `M′, ρ̄|G_F″` is the residual representation of a cuspidal parallel-weight-two form f with determinant `ψχ_p` and `t_f=t|F″`. One may require F′ to split at a finite S when its prescribed p-types are compatible with the residual local representations there. Ordinary type A is included. Snowden's conditions (A1),(A2) apply to the auxiliary and given-lift arguments; they are not assumptions on the original `ρ̄` in this residual theorem.

The construction uses the following weight-two inputs over **arbitrary totally real fields**, in the order given here. They do not follow by changing the base field in a rational-field lifting theorem. Throughout, (A1) means that `ρ̄|G_(F(ζ_p))` is absolutely irreducible; (A2) means that if `p=5` and the projective image is `PGL₂(𝔽₅)`, then `[F(ζ₅):F]=4`. No adequacy hypothesis replaces these conditions.

- `snowdenWeightTwoLifting`: let `ρ` be odd, finitely ramified and weight two, meaning potentially semistable with labeled Hodge–Tate weights {0,1} in the cyclotomic-positive convention, and with determinant a finite-order character times `χ_p`. Suppose `ρ̄` satisfies (A1),(A2) and is isomorphic to the residual representation of a cuspidal parallel-weight-two Hilbert eigenform f over F. If t_ρ(v)≈t_f(v) for every v|p, then `ρ` is the representation of a Hilbert eigenform. Here X≈Y means equality or one of A≈A/C, C≈A/C, AB≈AB/C and C≈AB/C, symmetrically; B is never compatible with A/C. Away-p matching is not a hypothesis of this version. First adjust the seed away from p by the level-lowering and level-raising construction of Snowden Proposition 4.4.1; then apply the all-place matching version, Theorem 4.1.1. Determinant square roots and pre-soluble base changes reduce to determinant `χ_p`, trivial residual representations at the selected local places, even field degree and even cardinality of the type-C set. The quaternion algebra ramifies at infinity and that type-C set. The Taylor–Wiles sets of Proposition 3.4.1 and the patching criterion of Proposition 3.10.1 give Theorem 3.11.1: the modified framed deformation-to-Hecke map is surjective with p-power-torsion kernel, and the associated **unframed** ring is finite over O. This is generic-fibre `R=T`, not integral `R=T`. Soluble descent returns the assertion over F.
- `snowdenCMSeed`: for every totally real F and odd ℓ, construct a continuous odd finitely ramified weight-two representation `s:G_F→GL₂(ℚ̄_ℓ)` and finite Galois D/F such that for **every** finite totally real L/F disjoint from D, `s|G_L` is cuspidal Hilbert modular and its residual representation satisfies (A1),(A2). Choose an imaginary quadratic H/ℚ split at ℓ and not contained in F(ζ_ℓ), an algebraic Hecke character on FH with local inertia χ_ℓ at one place above each ℓ-adic v and 1 at its conjugate, and a finite-order twist whose residual character differs from its conjugate on `G_(FH(ζ_ℓ))`. Put `s=Ind_(FH/F)θ`, and include the residual-kernel field and F(ζ_ℓ) in D. Disjointness preserves the full residual image on the cyclotomic subgroup. Its nonscalar diagonal subgroup and an element interchanging the two characters prove (A1); its dihedral projective image is soluble, so (A2) holds also at ℓ=5. Automorphic induction of the restricted Hecke character proves modularity over each L directly, including nonsoluble L/F. **Seed checks.** For ℓ=3 and H=ℚ(√−2), the totally real L=ℚ(√6) satisfies `H⊂L(ζ₃)`, so (A1) fails there; D excludes such L. At ℓ=5 a dihedral image never triggers the PGL₂(𝔽₅) exception. Merely knowing s is modular over F does not give its modularity over arbitrary L; induction over LH/L supplies it. Source: [Snowden v1][snowden], Lemma 5.4.2 and Proposition 5.4.1, pp.17–18.
- The residual construction before finiteness uses `snowdenTwoPrimeRealization` (§3.6) and `snowdenCMSeed`. Choose ℓ≠p, normalize both determinants by finite-order square-root characters over a preliminary Galois totally real F₁/F disjoint from the avoidance field. Choose a quadratic F₁ nonsplit at every finite place with a nonzero square-root obstruction for either even determinant character, and ramified at an additional prime split in the avoidance field. Local Brauer invariants then vanish over F₁, as in the determinant adapter of §4.7; both square roots exist. Choose a totally real coefficient field K using §2.16 with residue fields at p and ℓ containing the two finite normalized residual images. Realize these modules by one HBAV through §3.6. Prescribe t at p and the seed's definite types at ℓ. Use avoidance containing D and the original M. For every further allowed totally real extension, `snowdenWeightTwoLifting` at ℓ makes the auxiliary Tate module modular because its residual seed retains (A1),(A2) and its types match. The common Frobenius polynomials of the HBAV then identify the p-adic member with the same Hilbert eigenform's p-adic representation. Twisting back gives the original residual module and determinant, with t preserved by finite-order twist. Use §3.6's moduli variety over F₁ with §2.18 to choose the final field Galois over F from the outset, containing F₁ and disjoint from the fixed avoidance field; infinity gives the splitting conditions and the finite places allow extensions. Its Tate-module argument works over every further allowed totally real extension. This is the residual assertion without prescribed splitting, as in Snowden §5.5, p.18; no global lift-existence or global-ring finiteness at p is used.
- `snowdenWeightTwoRingFiniteness`: fix an odd `ρ̄` satisfying (A1),(A2), a finite-order `ψ` with `det ρ̄=ψ̄χ̄_p`, and Σ containing p and all ramification of `ρ̄` and `ψ`. At each `v∈Σ` choose a nonzero reduced O-flat quotient `R_v` of the determinant-ψχ_p framed local deformation ring, of **Krull dimension** `[F_v:ℚ_p]+4` for v|p and 4 otherwise. Fix a definite type t(v), and a finite Galois `L_v/F_v`, such that every finite-coefficient characteristic-zero point of `R_v` becomes admissible of type t(v) on `L_v`. Admissible means crystalline ordinary of determinant `χ_p` for A, crystalline nonordinary of that determinant for B, an extension of 1 by `χ_p` for C, and unramified of determinant `χ_p` for AB away from p. The extension in C may split. Then the fixed-determinant unframed global quotient R† is finite over O and has nonzero rank. The definition uses the completed tensor product of the `R_v` with the globally framed ring and removes the framing variables; the local quotients are data, not a condition asserted only at one chosen point. For the proof, the residual potential-modularity construction, **without** the prescribed-splitting refinement, gives a weight-two modular seed of the selected p-types. Further pre-soluble extensions make the completions contain all `L_v`, normalize the determinant and parity, and put the local data into the preceding `R=T` theorem. Reduced O-flatness proves the local restriction factorization from its characteristic-zero points (Snowden Lemma 6.4.1). The extension-field global ring maps finitely to the original-field ring by trace integrality (Lemma 6.3.1). Finiteness descends in this direction. The global presentation and local dimension calculation give dim R†≥1 (Proposition 6.2.1); combined with O-finiteness this gives positive rank. Neither a positive-dimensional framed ring nor finiteness alone supplies that last conclusion.
- `snowdenPrescribedWeightTwoLift`: with `ρ̄, ψ` and Σ as above, let `Σ′⊆Σ` and choose a definite type t(v) at `v∈Σ′` **compatible with `ρ̄_v**`. Compatibility means existence of a local lift of that definite type, weight two at p, and is separate from the symbol ≈. Then there is a global weight-two lift of determinant `ψχ_p`, unramified outside Σ, with those definite types. Propositions 7.7.1 and 7.8.1 extend the local choices to Σ. Correct each chosen local determinant by the unique square root of its congruent-to-one finite character discrepancy; p is odd, so squaring is invertible on the finite p-group. This preserves reduction and potential type. Fix the resulting inertial types, use the reduced O-flat local rings of §7.3–§7.5 and the preceding finiteness/dimension theorem, and extract a characteristic-zero point as in Theorem 7.2.1. This argument precedes and does not use the rational-field extraction of Layers 9–10.
- `snowdenResidualSolubleDescent`: suppose a finite soluble totally real F′/F preserves (A1),(A2), and a weight-two seed for `ρ̄|G_F′` has the restriction of a compatible definite p-type t over F. The preceding prescribed-lift theorem first constructs `ρ` over F. The lifting theorem over F′ makes its restriction modular, and characteristic-zero soluble descent makes `ρ` modular over F. This is Proposition 8.1.1. It supplies the prescribed-splitting refinement of the residual potential-modularity construction, with its compatibility hypothesis at `S∩Σ_p`.

The inputs are used in this order: local type rings and matching-type lifting; the two-prime HBAV realization and extension-stable CM seed; residual potential modularity without prescribed splitting; global finiteness; prescribed lifts; residual soluble descent; and finally prescribed splitting. The residual construction uses matching-type lifting for its auxiliary prime, not global finiteness or the prescribed-lift theorem at the original prime.

**Checks.**

- For `p=5` and projective image `PGL₂(𝔽₅)`, a totally real F containing ℚ(√5) has `[F(ζ₅):F]=2`, so these lifting and finiteness inputs do not apply. Projective image `PSL₂(𝔽₅)` does not trigger (A2).
- An ordinary type-A seed does not match a type-B given lift at p. Matching away from p alone cannot repair this failure of `snowdenWeightTwoLifting`.
- The split representation `1⊕χ_p` over a p-adic field has the ambiguous type A/C. It is admissible of type C but is not a **definite-type-C** witness for the compatibility hypothesis in `snowdenPrescribedWeightTwoLift`.
- A local quotient `O/(ϖ)` has no characteristic-zero points and is not O-flat. Vacuity of the pointwise admissibility condition cannot make it admissible input to `snowdenWeightTwoRingFiniteness`.
- At v|p over `ℚ` the required framed local Krull dimension is 5, not 4; away from p it is 4. A global framing adds formal variables, so the finiteness conclusion applies only after removing them.
- Σ′=∅ prescribes no types, but Σ must still contain p and all ramification. A locally impossible type at a place of `Σ′` cannot be supplied by the global theorem.
- The determinant correction is a square root in a finite p-group, rather than a square root of an arbitrary character. At `p=2` this step fails and none of these assertions is exported.

Prove it as `snowden_potential_residual`.

The sources are [Snowden v1][snowden], §2.1 and Remark 2.1.1 (the local types), p. 4; §3.1, p. 6; Theorem 4.4.2, p. 13; Theorem 5.1.1 and Proposition 8.2.1, pp. 15, 26; Theorem 7.6.1 and its proof in §7.9, pp. 23, 25; Propositions 2.2.1 and 2.5.1, pp. 4–6; Theorems 3.11.1 and 4.1.1, pp. 10–12; Theorem 6.1.1, Proposition 6.2.1 and Lemmas 6.3.1–6.4.1, pp. 19–20; Theorem 7.2.1 and §7.3–§7.5, pp. 20–22; Proposition 8.1.1, p. 26; Propositions 5.3.1, 5.4.1 and §5.5, pp.16–18.

*Needs:* [Layer 3, Two-prime HBAV realization](#target-snowden-two-prime-realization); [Layer 4, Ordinary residual potential modularity](#target-taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l) (the even-character square-root adapter); [Layer 2, Character extension](#target-cht-character-extension); [Layer 3, The Weil-restricted moduli application](#target-restriction-of-scalars-moduli-application); [Layer 3, CM characters with simultaneous local reductions](#target-taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions); AutomorphicGaloisRepresentationsPartII AG2.0; GL2AutomorphicRepresentationsAndTransfer §R17.4.16 (quadratic automorphic induction); [Layer 2, Soluble preliminary fields and split extensions](#target-snowden-soluble-preliminary-field); AutomorphicGaloisRepresentations §§3.10–3.14; AutomorphicGaloisRepresentations Layer 6; GL2AutomorphicRepresentationsAndTransfer Layer R17.6; GlobalGaloisDeformations §§3.3–3.4 (fixed-determinant framed/unframed deformation functors and restriction); LocalGaloisDeformationRings Layers 2–5 (the reduced flat fixed-type local quotients); GL2ModularityLifting Layer 2 (quaternionic Hecke modules and Taylor–Wiles level comparison); GL2ModularityLifting Layer 3 (patching with the smooth local components); DeformationAndDerivedPatchingAlgebra Layer 4 (dimension and finite-characteristic-zero-point extraction). The arbitrary-field matching-type and generic-fibre `R=T` extensions are the contracts stated in this subsection; the rational-field KW theorem GL2ModularityLifting Layer 5 does not supply them.

<a id="target-bcgp-controlled-residual-modularity"></a>
### 4.16 The two-prime ordinary refinement

Let F₁/F be finite totally real, and let distinct `p,q>2` split completely in F₁. Suppose r : `G_F₁ → GL₂(F̄_q)` has determinant `ε̄_q⁻¹`, is unramified above p, and at every v|q has shape `diag(λ_(α_v), ε̄_q⁻¹λ_(α_v)⁻¹)`, where `λ_α` is the unramified character taking arithmetic Frobenius to `α`. There is a totally real Galois F′/F, split above p and q and disjoint from F₁F_avoid, and a q-ordinary weight-zero cuspidal `π` over F₁F′ with trivial central character, unramified above pq, whose residual representation is `r|G_F₁F′`.

Prove it as `bcgp_potential_residual`.

The sources are [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proposition 9.1.11 and proof, p. 458.

*Needs:* [Layer 4, Dyadic paired torsion moduli and local points](#target-dyadic-auxiliary-moduli); [Layer 4, Residual modularity over totally real fields](#target-snowden-totally-real-potential-residual-modularity); [Layer 3, The Weil-restricted moduli application](#target-restriction-of-scalars-moduli-application); AutomorphicGaloisRepresentations §§3.10–3.14.

### Examples

The ordinary and niveau-two cases test the separate residual shapes; the `l+1` weight shift and level removal retain their full hypotheses.

### Dependencies

This layer uses the Tau Ceti roadmaps ClassFieldTheory, GlobalNumberFields and LocalGaloisGroups; the roadmaps ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, DeformationAndDerivedPatchingAlgebra, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, GlobalGaloisDeformations, HilbertModularVarietiesAndShimuraCurves, LocalGaloisDeformationRings, NeronModelsAndSemistableAbelianVarieties, OrdinaryAutomorphicFormsAndModularityLifting, PadicFamilies, PadicHodgeTheory, SerreWeightAndLevelOptimisation and ShimuraVarieties; and Layers 2 and 3 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r23-4"></a>
## Layer 5: Potential modularity of a given lift


Take the lift as data and use the residual modular witnesses in the appropriate lifting theorem. Preserve the local type and residual-image assumptions through field selection.

<a id="target-potential-modularity-of-a-given-lift"></a>
### 5.1 Potential modularity of a given lift

Take an S-type `ρ̄` satisfying the KW I Theorem 5.1 hypotheses, and an odd finitely ramified lift `ρ`, minimal away from p as required by its lifting data, with one of the A/B/C p-types. At `p=2` allow crystalline weight two, or semistable weight two when `ρ̄` is not finite at 2. Select a totally real Galois F preserving the residual image and cyclotomic irreducibility, unramified at p and split there when the residual local restriction is irreducible or `k=p+1`. The residual witnesses and allowable base change give `(α),(β)`; the equivalence of modularity over F and over a soluble extension is GL2ModularityLifting Layer 5, and the soluble extension with the prescribed completions is that of Layer 2; the GL2ModularityLifting Layer 5/GL2ModularityLifting Layer 6 lifting theorem makes the **given `ρ|G_F**` the representation of a holomorphic cuspidal form. Existence of `ρ` is a separate premise. General regular de Rham lifts require a lifting theorem of that wider scope.

Prove it as `potential_modularity_given_lift`.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93.

*Needs:* [Layer 4, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); GL2ModularityLifting §5.4; GL2ModularityLifting §6.15; GL2ModularityLifting §§1.2 and 5.1; GL2ModularityLifting §1.3; GL2ModularityLifting §5.3.

### Examples

The prescribed local type and fixed determinant are tested on the supplied lift before applying a lifting theorem.

### Dependencies

This layer uses the roadmap GL2ModularityLifting and Layer 4 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r23-5"></a>
## Layer 6: Control of extensions


State each completion, splitting and avoidance condition in the field chosen for the modularity argument. Descent requires an automorphic theorem with invariance and cuspidality premises.

<a id="target-control-of-the-extension"></a>
### 6.1 Local control and avoidance

Export as accessors of the field constructed in §4.13 the four controls of KW II Theorem 6.1(iii): when `k=p` and the residual inertia is trivial, trivialize the entire local decomposition-group restriction upstairs; make completions contain the chosen away-p local extensions; in the odd-prime `k=p+1` case arrange complete splitting at p; and avoid the prescribed finite field by linear disjointness. Preserve the residual image and the cyclotomic irreducibility needed by subsequent lifting. Soluble descent is an additional automorphic theorem, requiring invariance and cuspidality; choosing a Galois extension alone supplies neither condition.

In the dihedral branch impose the extra split-prime condition of KW II p.54 that preserves irreducibility on `G_(F(μ_p))`. The determinant and weight are unchanged by field control.

Prove it as `controlled_extension`.

The sources are [KW II][kw-serre-modularity-II], Theorem 6.1 (iii), p. 54, proof of Theorem 6.1, p. 57.

*Needs:* [Layer 4, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); [Layer 2, Avoidance by extra split primes](#target-forcing-linear-disjointness-by-extra-split-places); GL2ModularityLifting §5.3; GL2AutomorphicRepresentationsAndTransfer Layer R17.4; [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); [Layer 2, Disjointness through towers](#target-tower-linear-disjointness); GL2AutomorphicRepresentationsAndTransfer Layer R17.6.

<a id="target-bcgp-local-galois-data-without-descent"></a>
### 6.2 Local Galois data over a composite field

Let E′/E and F_avoid/E be finite and linearly disjoint, and prescribe a finite group G with local Galois extensions `H_v/E′_v` and embeddings of their groups into G at a finite set S′ above S. At real places prescribe `c_v` of order dividing two. Choose finite Galois K/E disjoint from E′F_avoid such that `K′=KE′` splits every place in S′ over E′. Construct a G-Galois L′/K′ with the prescribed completions and decomposition groups up to conjugacy, including the prescribed complex conjugations. The result is over K′: no descent of L′ to K or disjointness of L′ from E′ over E is a conclusion.

Prove it as `bcgp_local_data`.

The sources are [Boxer–Calegari–Gee–Pilloni][bcgp-published], Proposition 9.1.12 and proof, pp. 458–459.

*Needs:* [Layer 2, Potential realization of local Galois data](#target-potential-global-galois-local-data); AbelianSchemesAndArithmeticModuli §§A6.30–A6.31; `ReductiveGroupsPartII` RG2.0a.2 (`weil-restriction-smoothness-and-immersions`, `weil-restriction-points-topology`); AlgebraicModuliForArithmeticGeometry §3.4 (relative Hom and Weil restriction, including base change); [Layer 2, Three kinds of local conditions](#target-moret-bailly-three-local-conditions); EtaleCohomologyFoundations §§F.0, F.0.A1–F.0.A2; InverseGaloisAndArithmeticFundamentalGroups IG.2.6.

### Examples

The local extensions and avoidance field are tracked before descent, so residual image preservation and soluble descent remain separate conditions.

### Dependencies

This layer uses the Tau Ceti roadmap ReductiveGroupsPartII; the roadmaps AbelianSchemesAndArithmeticModuli, AlgebraicModuliForArithmeticGeometry, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting and InverseGaloisAndArithmeticFundamentalGroups; and Layers 2 and 4 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r23-6"></a>
## Layer 7: Exports and their direction of use


Keep the residual and characteristic-zero exports separate. The mathematical direction is field selection and an independent auxiliary lifting theorem → residual modularity → finiteness → characteristic-zero points. Modularity of a given lift uses the residual witnesses and its local lifting theorem; the family construction uses that given-lift conclusion.

| Input | Export | Use |
| --- | --- | --- |
| Residual representation with the hypotheses of Layer 4 | Controlled residual modular witness | Finiteness in Layer 8; residual premise for lifting in Layer 5 |
| Separately given lift with its local type | Automorphy after restriction, Layer 5 | Brauer family in Layer 12 |
| Local containment, splitting and avoidance data | Controlled field and admissible descent data, Layer 6 | Preservation of residual image and chosen local conditions |
| Finiteness and dimension bound for an unframed ring | Integral characteristic-zero point, Layer 9 | Lift existence; subsequent modularity lifting |

The sources are [KW II][kw-serre-modularity-II], Theorem 6.1 and proof, pp.53–57; Theorem 10.1 and §§10.1–10.3, pp.90–94. *Needs:* Layer 2–Layer 6 with their stated interfaces. The independent auxiliary lifting theorem is an input from the modularity-lifting owner; it cannot be deduced using the lift whose existence is being established.

### Examples

The residual witness and given-lift exports have different inputs; passing one to the other requires the lifting theorem.

### Dependencies

The exact declarations and earlier constructions are specified by *Needs* at each subsection.

<a id="layer-r24-1"></a>
## Layer 8: Finiteness of global rings


Use residual modularity over an auxiliary totally real field to prove module finiteness of the unframed ring. The ordinary CM adapter and its local-ring comparisons are part of the ordinary application’s premises.

<a id="target-auxiliary-totally-real-field-for-the-finiteness-argument"></a>
### 8.1 The auxiliary field for global finiteness

Construct the auxiliary totally real `F/ℚ` for the fixed-determinant global deformation problem. The field with its preserved image, splitting or unramifiedness at p, the character `ψ_F` and the two residual witnesses is SerreWeightAndLevelOptimisation §6.6 (`kwOptimisationData`, the Khare–Wintenberger II §8.1 field); this target adds the requirement on the universal residual representation `τ` and the type-A/B/C projections below. Preserve nonsolubility at `p=2` or cyclotomic absolute irreducibility at `p>2`; arrange splitting at p when the local residual restriction is irreducible and unramifiedness otherwise. Require `ψ_F` unramified away from p and trivial local residual restrictions above p when the original restriction is unramified.

Supply the weight-k(ρ̄), everywhere-unramified cuspidal witness of central character `ψ_F` for type A only under `p≠2` or `k(ρ̄)=2`. Supply the weight-two witness of the same central character, unramified away from p and of conductor dividing v at v|p, for types B/C; at `p=2,k=4` it must arise from the specified semistable local quotient. Arrange splitting at p for the weight-p+1 lifting argument. Finally require the mod-p universal representation `τ|G_F` to be unramified away from p and infinity. This last condition is part of the finiteness construction, not a consequence of the existence of a single modular witness.

For this additional condition, prove `kwUniversalResidualInertiaFinite` for the universal representation, not only for its closed-point residual specialization. At `q≠p` the local quotients of KW II §3.3 have two forms. The inertia-rigid quotients of §2.7 are constructed from a fixed finite quotient I of inertia; their universal matrices, and hence their reductions modulo p, factor through I. The twist-of-semistable quotient of §3.3.4 has a fixed finite Teichmüller character on inertia and, after that character is killed, matrices `1+t_p(σ)N` with `N²=0`, where `t_p` is the p-component of tame inertia. Modulo p this map factors through `t_p` modulo p, even though N has entries in a possibly infinite deformation ring. Its inertia image therefore has at most p elements after the finite twist. For the semistable quotient, descend the identities integrally before reducing: its reduced O-flatness and characteristic-zero-point density imply that wild inertia and the prime-to-p tame factors act trivially after the fixed character is killed, and that `(ρ(σ)−1)²=0` for a tame p-generator `σ`. These identities hold at every characteristic-zero point and hence in the universal ring. They give `ρ(σ)^p=1` after reduction. Scheme-theoretic surjectivity of a resolution by itself would not justify reducing an injection modulo p. These two arguments are unaffected by taking further quotients, products of the finitely many allowed components, or extending coefficients. They give a single finite-index inertia kernel for the mod-p universal representation at each q in S. A finite local Galois extension kills that finite image. Include all these extensions among the prescribed completions in Theorem 6.1(iii)(c), and kill the finite away-p part of `ψ` at the same time. This supplies the exact comparison used in KW II §10.1, in place of assuming that a representation into an infinite characteristic-p coefficient ring has finite inertia automatically.

The additional API is `kwUniversalResidualInertiaFinite`, returning a finite inertia quotient and its kernel, and `AuxiliaryField.tau_unramified`, identifying the restriction of the **universal** mod-p representation with a representation of the Galois group unramified away from p. A universal matrix `1+tN` in characteristic p has p-th power one; its nonzero parameter does not make its inertia image infinite. A diagonal character of infinite p-power order in a characteristic-zero deformation ring is a negative control to applying this reduction argument before reducing modulo p. An inertia-rigid component with nontrivial finite wild image requires killing that image as well as the tame character.

The construction has the following API:

- `AuxiliaryField`: F with the conditions (1)–(4) and the representations `π′`
- `AuxiliaryField.piA`: `π′` unramified everywhere, weight `k(ρ̄)`, central character `ψ_F` (type (A)); this projection is available only under `p ≠ 2` or `k(ρ̄) = 2`. No type-(A) witness is supplied at `p = 2, k = 4`.
- `AuxiliaryField.piBC`: `π′` of conductor dividing v at v | p, weight 2, central character `ψ_F` (types (B), (C))
- `AuxiliaryField.tau_unramified`: the reduction `τ` of the universal representation is unramified on `G_F` outside p and ∞
- `AuxiliaryField.exists`: existence from Theorem 6.1 with (iii)(b)–(d), Theorem 8.2 and the local killing of ramification
- `AuxiliaryField.piA_iff`: The type-(A) automorphic witness is available under `p≠2` or `k(ρ̄)=2`; at `p=2, k=4` only the type-(B)/(C) witness is part of the construction.
- `AuxiliaryField.piBC_eq`: The accessor returns the chosen weight-two witness with central character `ψ_F`, together with its Galois realization.

**Checks.**

- `aux_dyadic_weight_four`: At `p=2,k=4` the type-A accessor has no witness; the type-B/C accessor returns the weight-two witness with the specified semistable condition C.
- `aux_unramified_at_p`: If the original local residual representation at p is unramified, require the selected field to trivialize it at every place above p; evaluate the stored restriction on the corresponding local Frobenius powers.
- `aux_not_cm`: The stored field is totally real and cannot contain an element i with `i²=−1`; a CM field cannot serve as the field of Hilbert modular witnesses here.
- `aux_tame_killing`: Tame inertia of order e at `l≠p` is killed by the prescribed ramified local extension; for `e=3,l=7` use `ℚ₇(7^(1/3))`, with `3|(7−1)`, and evaluate the restricted universal residual representation on inertia.

The sources are [KW II][kw-serre-modularity-II], §2.7 and Propositions 2.10–2.11, pp.14–16 (finite inertia quotient and its universal matrices); §3.3.1–§3.3.4, pp.32–37 (away-p local conditions, with the semistable-twist matrices on pp.36–37); proof of Theorem 10.1, pp.90–91 (the simultaneous field and universal residual-inertia requirement).

*Needs:* `SerreWeightAndLevelOptimisation` §6.6 (`kwOptimisationData`); [Layer 4, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); [Layer 6, Local control and avoidance](#target-control-of-the-extension); GL2ModularityLifting §§1.1–1.8; LocalGaloisDeformationRings Layers 2–5.

<a id="target-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring"></a>
### 8.2 Finiteness of the KW unframed ring

Consume ClassicalSerreModularity `I.2/full-kw-global-finiteness`, including its matching Hilbert finiteness comparisons. Let `ρ̄:G_ℚ→GL₂(k)` be S-type, with `2≤k(ρ̄)≤p+1` and cyclotomic absolute irreducibility for odd p, or nonsoluble image for `p=2`. Fix the coefficient DVR O, residual coefficient embedding, finite set S and arithmetic determinant `ψχ_p` of that export. Use its nonempty local quotients: crystalline weight k, prescribed potentially crystalline weight two, or semistable noncrystalline weight two at residual weight `p+1`; dyadically use crystalline weight two at residual weight two or the specified ordinary semistable weight-two condition at residual weight four. Retain oddness at infinity and the selected away-p local conditions.

The comparison `kwGlobalFiniteness` identifies the fixed-determinant unframed ring `R̄_S^ψ` here with the image of the universal unframed ring in the local-quotient base change of the framed ring in the owner's export. Identify the universal representations, trace subrings, local quotient maps and coefficient algebra structures; the supplied finiteness then gives O-finiteness and hence ℤ_p-finiteness here. This comparison includes weight `k=p`. It does not require residual modularity over `ℚ`.

The comparison `kwMinimalRingFiniteOverAuxiliaryField` identifies the auxiliary-field ring used in that export with the minimal odd ring over the field of §8.1, when its local quotients, determinant, modular Hecke witness and parity data match the export's Hilbert comparison. Its O-finiteness is the supplied conclusion of KW II Proposition 9.2(II) or 9.3(II), rather than a new patching construction. Retain the dyadic torus action with determinant transformation `d(tx)=t²d(x)`. The framed enlargement has `4|S_F|−1` variables; no finiteness over O is asserted for that enlargement, and no integral `R=T` is inferred from a p-power-torsion kernel.

**Checks.** Keeping a framing variable gives `O⟦X⟧`, which fails O-finiteness. Omitting the matching modular witness fails the auxiliary-field comparison's hypotheses. The dyadic torus formula with exponent one fails to encode fixed determinant. At `p=2,k=4` the crystalline witness is rejected. At `k=p` the full-range export applies even though the Annals minimal crystalline theorem excludes that weight.

The sources are [KW II][kw-serre-modularity-II], §9.1 setup and Lemma 9.1, pp.78–81; Proposition 9.2(II), pp.81–83; Proposition 9.3(I)–(III), pp.83–84 with proof through p.88; Theorem 10.1 and proof, pp.90–92.

*Needs:* ClassicalSerreModularity `I.2/full-kw-global-finiteness`; [Layer 8, The auxiliary field for global finiteness](#target-auxiliary-totally-real-field-for-the-finiteness-argument); GlobalGaloisDeformations §§6.1–6.2 and §4.2; LocalGaloisDeformationRings Layer 8.

<a id="target-rank-two-definite-unitary-ordinary-hecke-algebra"></a>
### 8.3 Definite unitary groups in two variables and their ordinary Hecke algebras

Let L be an imaginary CM field with maximal totally real subfield L⁺ such that L/L⁺ is unramified at every finite place (so `[L⁺:ℚ]` is even), let l be odd with every place of L⁺ above l split in L, and let `G/O_(L⁺)` be the unitary group in two variables of the standard hermitian form, quasi-split at every finite place and compact at every infinite place, with its integral model and the isomorphisms `ι_w:G(L⁺_v)≅GL₂(L_w)` at split places `v=ww^c`. For a finite extension `K/ℚ_l` with integers O containing every embedding of L, a weight `λ` indexed by the embeddings above the chosen places ṽ|l, characters `χ_v` of Iwahori quotients at a finite set R of split places, and an open compact U, let `S_(λ,{χ_v})(U,A)` be the O-module of functions `f:G(L⁺)\G(A^∞_(L⁺))→M_(λ,{χ_v})⊗A` with `f(gu)=u_(l,R)⁻¹f(g)`. Define:

- the Hecke operators `T_w^j (j=1,2)` at split places outside a finite set T and the Hecke algebra `T^T_(λ,{χ_v})(U,A)`, a finite O-algebra, reduced for `A=O`;
- the Iwahori levels `U(l^(b,c))`, the normalized operators `U^j_(λ,ϖ)` and diamond operators ⟨u⟩ for u in the diagonal torus `T(O_(L⁺,l))`, and, for `A=O`, `K/O`, `O/ϖ^r` or `ϖ^(−r)O/O` with `r≥1`, the ordinary idempotent `e=lim U(l)^(r!)` with `S^ord=eS`;
- the big ordinary Hecke algebra `T^(T,ord)_({χ_v})(U(l^∞),O)=lim_c T^(T,ord)(U(l^(c,c)),O)`, an algebra over Λ=O⟦T(l)⟧, T(l) the pro-l part of `T(O_(L⁺,l))`.

The construction has the following API:

- `DefiniteUnitaryTwo.group`: G with `ι_w` at split places; it exists under the parity of `[L⁺:ℚ]` above.
- `DefiniteUnitaryTwo.forms`: `S_(λ,{χ_v})(U,A)`; exact in A when no `t⁻¹G(L⁺)t∩U` has an element of order l, if U has no l-torsion stabilizers and V is normal open compact in U with U/V an abelian l-group, `S_(λ,{χ_v})(V,O)` is finite free over `O[U/V]`, and its U/V coinvariants identify by trace with `S_(λ,{χ_v})(U,O)`.
- `DefiniteUnitaryTwo.heckeAlgebra`: `T^T_(λ,{χ_v})(U,A)`, commutative and finite over O.
- `DefiniteUnitaryTwo.ordinaryIdempotent`: e on `S(U(l^(b,c)),A)` for the four coefficient modules just specified; `S^ord` is the largest O-submodule on which every `U^j` is bijective. For K-valued forms define `S^ord(U,K)=S^ord(U,O)⊗_O K`, the unit-root summand relative to the integral lattice.
- `DefiniteUnitaryTwo.ordinaryHeckeAlgebra`: `T^(T,ord)(U(l^∞),O)` over `Λ`.
- `DefiniteUnitaryTwo.ordinary_free_over_lambda`: at a level with no element of order l in any `t⁻¹G(L⁺)t∩U`, the Pontryagin dual of `eS(U(l^∞),K/O)` is free of finite rank over `Λ`; hence `T^(T,ord)` is finite over `Λ`.
- `DefiniteUnitaryTwo.hida_classicality`: for dominant `λ` and finite-order `α:T(l)→Q̄_l×`, choose `r≥1` with `T(l^r)⊆ker α`. Use Geraghty's twisted Λ-action (Definition 2.6.2), with `℘_(λ,α)=ker(α(w₀ν)⁻¹(w₀λ)⁻¹)` and `K′=Frac(Λ/℘_(λ,α))`. After localizing at `℘_(λ,α)` and passing to K′, the dual ordinary module identifies with the K′-linear dual of classical ordinary forms at level `U(l^(r,r))`, weight `λ` and pro-l nebentypus `α`. There is a surjection of Hecke algebras from the arithmetic fibre to this classical algebra with nilpotent kernel. On the tame-torus character `γ` summand the classical nebentypus is `(γω_(w₀λ))α`, with the Teichmüller weight character included. This is a statement about the characteristic-zero fibre, without an assertion of an integral isomorphism.

**Checks.**

- `unitaryTwo_scalar_q`: on the K-valued constant line at weight zero and Iwahori level, `U¹` acts by the residue cardinality q. It is bijective over K but `q^(r!)→0`, so that line is not ordinary; the largest-bijective characterization over arbitrary K-subspaces fails.
- `unitaryTwo_level_V`: for nontrivial U/V, level-U forms have trivial diamond action and a nonzero such module is not free over `O[U/V]`; the freeness statement uses level V and coefficients O.
- `unitaryTwo_ordinary_zero`: if `S(U(l^(b,c)),A)=0` then `eS=0`.
- `unitaryTwo_weight_zero_functions`: for `λ=0` and no characters `χ_v, S_0(U,O)` is the module of O-valued functions on the finite set `G(L⁺)\G(A^∞)/U`, of rank its cardinality when the level is l-torsion free.
- `unitaryTwo_rank_one_comparison`: the determinant of G is the norm-one torus of L/L⁺; for `n=1` the same constructions give functions on a finite quotient of the norm-one idele class group, `U^1` is invertible and `e=1`.
- `unitaryTwo_arithmetic_fibre`: a map to a characteristic-zero field kills the nilpotent kernel and therefore factors through the classical fibre; a map to a ring with nonzero nilpotents need not do so.
- `unitaryTwo_tame_weight`: on the `γ` component, forgetting `ω_(w₀λ)` gives the wrong classical nebentypus unless that weight character is trivial.
- `unitaryTwo_parity`: a CM extension L/L⁺ unramified at every finite place has `[L⁺:ℚ]` even; for instance no imaginary quadratic field is unramified over `ℚ` at every finite place, so `L⁺=ℚ` never occurs.

The sources are [Thorne][thorne], §6, the group, Definition 6.1, Proposition 6.2 and Lemmas 6.3–6.4, pp. 30–35; §8, the Iwahori levels, the operators `U^j` and ⟨u⟩, Definition 8.1, Proposition 8.2 and Definition 8.3, pp. 44–46; [Geraghty, ordinary][geraghty-ordinary], §2.2–§2.6 (items 2.2.1–2.2.4, Definition 2.3.1, items 2.4.1–2.4.5, Lemma 2.5.2, Propositions 2.5.3 and 2.6.1, Lemma 2.6.4), pp. 6–22.

*Needs:* AutomorphicFormsOnReductiveGroups §§7.4–7.6 and AutomorphicFormsOnReductiveGroups §5.6 (algebraic modular forms on groups compact at infinity, and the coefficient lattices); AdelicAlgebraicGroups Layer 1; PadicFamilies §0a.14; PadicFamilies §0a.4; LocalGaloisDeformationRings §1.3 (the ring `Λ`).

<a id="target-rank-two-unitary-galois-representations"></a>
### 8.4 Galois representations on the rank-two ordinary Hecke algebra

With the notation of §8.3: (1) Every irreducible constituent `π` of `S_(λ,{χ_v})(Q̄_l)` has a continuous semisimple `r_l(π):G_L→GL₂(Q̄_l)` with `r_l(π)^c≅r_l(π)^∨(−1)`, local–global compatibility up to semisimplification at split places outside `S_l∪R`, the prescribed Iwahori character on inertia at R, and de Rham (crystalline at unramified `π_v`) restrictions at the places above l of the corresponding weight. (2) For a maximal ideal m of `T^T_λ(U,O)` there is a residual `r̄_m:G_L→GL₂(T/m)` whose Frobenius characteristic polynomials at split `w∉T` are `X²−T_w^1X+(Nw)T_w^2` modulo m; m is non-Eisenstein when `r̄_m` is absolutely irreducible. For non-Eisenstein `m, r̄_m` extends to `r̄_m:G_(L⁺)→𝒢₂(T/m)` with multiplier `ε^(−1)δ_(L/L⁺)^(μ_m)`, and lifts uniquely up to strict equivalence to `r_m:G_(L⁺)→𝒢₂(T^T_λ(U,O)_m)` with the same Frobenius polynomials. (3) The same holds for the big ordinary Hecke algebra: `r_m:G_(L⁺)→𝒢₂(T^(ord)_m)`, and at each v|l its restriction factors through Geraghty's ordinary image ring over Λ_ṽ. For domain coefficients A the required flag exists over an algebraic closure of Frac(A). In particular, every algebraically closed characteristic-zero specialization admits a stable full flag whose ordered graded characters restrict on inertia to the specialized universal inertial characters. (4) Base change and descent: a RACSDC `π` of `GL₂(A_L)` of weight `ι_*λ` descends to an automorphic representation of `G(A_(L⁺))` with the same split-place components, and conversely every automorphic representation of G whose Galois representation is irreducible has a RACSDC base change whose Galois representation is `r_l(π)`; a homomorphism from the ordinary Hecke algebra to a characteristic-zero field whose restriction to `Λ` is arithmetic kills the nilpotent kernel in §8.3 and factors through the corresponding classical algebra. At a non-Eisenstein localization its classical constituent has irreducible Galois representation and hence a cuspidal base change. Maps to arbitrary nonreduced O-algebras are not covered by this classicality statement.

For (1) use Geraghty's Proposition 2.7.2, obtained from Labesse's weak base change and the automorphic Galois representation theorem. For (2) use Propositions 2.7.3–2.7.4: first construct the residual representation at classical finite levels, then reconstruct the polarized lift from the good Hecke polynomials; vertical control makes the finite-level maximal ideals compatible. For (3), Corollary 3.1.4 factors the map through the scheme-theoretic image of the proper ordinary-flag scheme. Regular arithmetic weights in the correct tame-character congruence class are Zariski dense in `Λ`; the big Hecke algebra is reduced, so vanishing on these fibres gives factorization on the whole algebra. LocalGaloisDeformationRings §1.9 supplies the domain point criterion over an algebraic closure of the fraction field. An algebraically closed characteristic-zero specialization then has an invariant full flag whose ordered graded characters restrict on inertia to the specialized universal inertial characters. For (4), use the explicit base-change/descent contract of EndoscopicTransferAndUnitaryTraceComparison §6.29 with the compact-at-infinity, quasi-split-finite group and its parity condition; Geraghty's Lemma 2.2.5 identifies algebraic forms with the automorphic multiplicity space; Proposition 2.2.7 then gives the definite-unitary descent. The latter requires L/L⁺ unramified at every finite place, as does the descent used here. The forward base-change theorem is Geraghty's Proposition 2.7.2. The Hida specialization uses Lemma 2.6.4, not a new consequence of pseudocharacter reconstruction.

**Checks.**

- At a split `w∉T, tr r_m(Frob_w)=T_w^1` and `det r_m(Frob_w)=(Nw)T_w^2` in the localized Hecke algebra itself, not only modulo m; a construction that matches traces only residually fails the uniqueness up to strict equivalence over `T_m`.
- The constant functions in weight zero give a reducible residual representation; their maximal ideal is Eisenstein, and no polarized lift is asserted for it.
- At v|l every algebraically closed characteristic-zero arithmetic specialization of the ordinary `r_m` admits a stable full flag whose ordered graded characters restrict on inertia to the specialized universal inertial characters. The algebra Λ_ṽ prescribes these restrictions; full Frobenius parameters belong to Λ̃_ṽ of LocalGaloisDeformationRings §1.3.
- The unramified local `ℤ₃`-representation with Frobenius `[[1,6],[3,1]]` has trivial residual representation and prescribed inertia characters `(1,1)`. Its polynomial `(T−1)²−18` splits over `ℚ̄₃`, so it satisfies the ordinary image condition. Since 2 is not a square in `ℚ₃`, it has no stable line over `ℚ₃` or `ℤ₃`.
- A homomorphism from the ordinary Hecke algebra to `F̄_l[e]/(e²)` need not factor through a classical Hecke algebra; only characteristic-zero arithmetic specializations kill the nilpotent kernel of §8.3.

Define it as `DefiniteUnitaryTwo.heckeGaloisRepresentation`.

The sources are [Thorne][thorne], §6, Theorem 6.5 and Propositions 6.6–6.7, pp. 35–36; §8, Propositions 8.4–8.5, p. 47; [Geraghty, ordinary][geraghty-ordinary], §2.7, Propositions 2.7.2–2.7.4, pp. 24–26, and §3.1, Corollary 3.1.4, pp. 32–33; [BLGGT v4][blggt-2014-v4], §2.2 (polarized automorphic representations and their Galois representations), pp. 35–37.

*Needs:* [Layer 8, Definite unitary groups in two variables and their ordinary Hecke algebras](#target-rank-two-definite-unitary-ordinary-hecke-algebra); `EndoscopicTransferAndUnitaryTraceComparison` §6.29 (Labesse's base change and descent between unitary groups and `GL_n` over CM fields); AutomorphicGaloisRepresentationsPartII AG2.6, “Polarized admissibility at the coefficient prime”; AutomorphicGaloisRepresentationsPartII AG2.6, “Full polarized local–global compatibility at `ℓ`”; AutomorphicGaloisRepresentationsPartII Layer AG2.7 (Galois-type and non-Eisenstein Hecke ideals); ArithmeticGaloisRepresentations §7.4; ArithmeticGaloisRepresentations §5.10; IntegralHeckeAndGaloisDeterminants §§0.5 and 1.3 (pseudocharacters and Cayley–Hamilton reconstruction); LocalGaloisDeformationRings §1.9.

<a id="target-rank-two-ordinary-r-equals-t"></a>
### 8.5 Rank-two ordinary patching for adequate residual image

With the notation of §8.3 and §8.4, with L/L⁺ unramified at all finite places, and let `T=R∪S_l∪{v₁}` be split places with `v₁∤l`. Assume r̄_m(G_(L_ṽ)) is trivial for `v∈R∪S_l`; Nv≡1 mod l for `v∈R`, with `l^N>2` when `l^N` exactly divides `Nv−1` and O containing an l^N-th root of unity; `r̄_m` unramified above v₁ with Nv₁≢1 mod l; `U_v` the Iwahori subgroup at `R∪{v₁}`, so that no `t⁻¹G(L⁺)t∩U` has an element of order l; m non-Eisenstein in the big ordinary Hecke algebra; `ζ_l∉L` and `ρ̄=r̄_m|G_L` with `ρ̄(G_(L(ζ_l)))` adequate. Let 𝒮 be the polarized deformation problem over `Λ` with the Ihara-avoidance rings at R (inertia acting with characteristic polynomial given by characters trivial `mod λ`), Geraghty's ordinary rings over Λ_ṽ at `S_l` and the unipotent ring at v₁. Then `r_m` is of type 𝒮, and every lifting r of `r̄_m` of type 𝒮 (with trivial characters at R) that is unramified above v₁, for which some Hecke specialization is also unramified there, is conjugate to a specialization of `r_m`. Moreover μ_m≡0 mod 2, and with the unramified ring at v₁ the universal ring `R^univ` is a finite Λ-module.

In rank two the adequacy notion of Thorne's 2012 paper and the corrected one of his 2017 paper agree because `l∤2`, and Thorne's 2017 Proposition 7.2 replaces the Taylor–Wiles prime proposition, which needs `ζ_l∉L`, so the theorem is stated with that hypothesis. By the rank-two classification, adequacy of `ρ̄(G_(L(ζ_l)))` means absolute irreducibility, except that projective image PSL₂(F₃) for `l=3` and PSL₂(F₅) for `l=5` are not adequate.

The proof is Thorne's: Taylor–Wiles data of size q exist with the generator count `q−[L⁺:ℚ]−`[L⁺:ℚ](1−(−1)`^(μ_m)`) (adequate Taylor–Wiles primes); the Taylor–Wiles level structures with the parahoric projections identify the patched modules; the ordinary forms are free over `Λ[Δ_Q]`; patching gives a module over a power-series ring whose support is the union of the components of the Ihara-avoidance rings; Taylor's comparison of the unipotent and the distinct-character problems modulo `λ` forces the support to be everything, and reducedness of the Hecke algebra gives the characteristic-zero factorization. The comparison is nearly faithful and yields Λ-finiteness; no isomorphism between the entire universal ring and the Hecke algebra is asserted.

**Checks.**

- `rankTwoRT_adequacy_l3`: for `l=3` a residual representation with projective image PSL₂(F₃) is absolutely irreducible on `G_(L(ζ₃))` but not adequate, so the theorem does not apply.
- `rankTwoRT_zeta_in_L`: if `ζ_l∈L` the corrected Taylor–Wiles prime argument is unavailable; the hypothesis `ζ_l∉L` is part of the statement.
- `rankTwoRT_v1`: the auxiliary place v₁ with Nv₁≢1 mod l is what makes the level l-torsion free; dropping it, finite stabilizers of order l can occur.

Prove it as `rank_two_ordinary_patching`.

The sources are [Thorne][thorne], §4, Definition 4.1, Lemma 4.3 and Proposition 4.4, pp. 15–18; §5, the parahoric operators and Propositions 5.8–5.12, pp. 19–30; §8, 'Another patching argument', Theorem 8.6 and its proof and Corollary 8.7, pp. 48–53; [Thorne, adequacy][thorne-2017], §7, Propositions 7.1–7.2 and Corollary 7.3, pp. 30–32; [Geraghty, ordinary][geraghty-ordinary], §4.3, Theorem 4.3.1, p. 51.

*Needs:* [Layer 8, Galois representations on the rank-two ordinary Hecke algebra](#target-rank-two-unitary-galois-representations); GlobalGaloisDeformations §8.1; GlobalGaloisDeformations §8.4; GlobalGaloisDeformations §8.3; `GlobalGaloisDeformations` §8.5 (Taylor–Wiles places in rank n); ArithmeticGaloisRepresentations §7.9; ArithmeticGaloisRepresentations §7.9 (rank-two adequacy); ArithmeticGaloisDuality Layer R02.4; LocalGaloisDeformationRings §2.15; LocalGaloisDeformationRings §6.24; LocalGaloisDeformationRings §1.9; DeformationAndDerivedPatchingAlgebra Layer 5; DeformationAndDerivedPatchingAlgebra §6.1; DeformationAndDerivedPatchingAlgebra §§6.1 and 6.4; Chebotarev Layer 10.

<a id="target-rank-two-ordinary-automorphy-and-finiteness"></a>
### 8.6 Rank-two ordinary automorphy lifting and ordinary finiteness

Let F be CM or totally real and l odd with `ζ_l∉F`. (1) Lifting. Let `(r,μ)` be a two-dimensional algebraic polarized l-adic representation of `G_F` with r̄ irreducible and `r̄(G_(F(ζ_l)))` adequate, r ordinary at every place above l, and `(r̄,μ̄)` ordinarily automorphic. Then `(r,μ)` is ordinarily automorphic, of level prime to l if r is crystalline above l. (2) Finiteness. Let F be imaginary CM, S a finite set of places of F⁺ containing those above l and split in `F, (π,χ)` an ι-ordinary RAECSDC representation of `GL₂(A_F)` unramified outside S with adequate `r̄_(l,ι)(π)(G_(F(ζ_l))), μ` an algebraic character of `G_(F⁺)` with `μ̄=r̄_(l,ι)(χ)ε̄^(−1)` and `HT_τ(μ)={w}`, and for every `τ` a pair `H_τ` of distinct integers with `H_(τc)={w−h:h∈H_τ}`. With unrestricted local conditions away from l and the semistable ordinary rings of Hodge type `{H_τ}` above l, the universal ring of the polarized deformation problem of r̄ with multiplier `μ` is a finite O-module. The weights `H_τ` need not be those of `π`.

Here ι-ordinary uses the weight-normalized Iwahori operators and ordered Galois characters of §§8.3–8.4. For a totally real Hilbert seed, retain OrdinaryAutomorphicFormsAndModularityLifting §2.1's chosen arithmetic quotient character, including its unit values `δ_v(u)=ν_v(u)∏_{τ:F_v→ℚ̄_l}τ(u)^(−v_τ)`, with selected smooth factor `ν_v` and labelled algebraic exponents `v_τ`. Transport the flag and full character together under the representation dictionary. On this nearly ordinary packet the supplier's `IsOrdinary` requires `δ_v|O_(F_v)×=1`, whereas `IsSmoothOrdinary` requires `ν_v|O_(F_v)×=1`, at every v|l. The exact comparison is `IsOrdinary ↔ (IsSmoothOrdinary ∧ ∀τ, v_τ=0)`. The general-weight statements (1) and (2) use ordinary filtrations with their prescribed algebraic characters and finite smooth ramification.

For (1) with F totally real, make a quadratic CM base change disjoint from the field cut out by r̄ over `F(ζ_l)` and descend at the end. For F imaginary, twist so that Thorne's automorphic polarization character `χ` is `δ_(F/F⁺)^n`. For `n=2` this character is trivial, whereas the `𝒢₂` multiplier is `ε⁻¹` (with the `κ=0` prolongation); the cyclotomic factor is retained. Make soluble CM base changes over which the hypotheses of the rank-two ordinary patching hold (places above l and the ramified places split, r̄ trivial there, Iwahori-fixed vectors, the congruences Nv≡1 mod l with `l^N>2`, and an auxiliary place v₁), apply it, and descend by soluble descent. For (2), make the analogous soluble CM base change M/F, use the finiteness of the restriction map of global rings to reduce to M, and specialize the Λ-finiteness of the rank-two ordinary patching theorem at the arithmetic prime of the chosen weight.

**Checks.**

- `rankTwoLift_totally_real`: for F totally real and a weight-two ordinary r with adequate residual image, (1) applies after quadratic CM base change; the output is a cuspidal Hilbert form over F.
- `rankTwoFinite_weights_free`: the Hodge type `{H_τ}` in (2) may differ from that of `π`, but must satisfy `H_(τc)=w−H_τ` for the same w as `μ`: a polarized lift with multiplier `μ` has Hodge–Tate numbers with this symmetry, so a type violating it carries no characteristic-zero point.
- `rankTwoFinite_framed`: the conclusion is for the unframed polarized universal ring; a framed ring adds formal variables and is not finite over O.
- For Hilbert weight `(2,4)` with exponents `(1,0)` and unramified smooth factor, the rational principal unit `u=4` at `l=3` has `δ_v(u)=1/4≠1` at the place carrying the first exponent. This packet satisfies `IsSmoothOrdinary` and fails `IsOrdinary`; a finite twist cannot cancel its algebraic character on an open unit subgroup. General-weight ι-ordinarity retains this quotient.

Prove it as `rank_two_ordinary_automorphy_and_finiteness`.

The sources are [BLGGT v4][blggt-2014-v4], §1.4, pp. 24–25 (ordinary filtrations), §2.1, pp. 32–34 (weight-normalized ι-ordinarity), and §2.4, Theorems 2.4.1 and 2.4.2, pp. 39–40; [Thorne][thorne], §9, Theorem 9.1 and its proof, pp. 53–54, and §10, Theorem 10.2 and its proof, pp. 56–58; [Gee–Geraghty][gee-geraghty], Lemma 3.2.5 and its proof, p. 14. The Hilbert character convention is OrdinaryAutomorphicFormsAndModularityLifting §2.1, using [Skinner–Wiles, *Residually reducible representations and modular forms*](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), §§3.1–3.2, pp. 27–32.

*Needs:* [Layer 8, Rank-two ordinary patching for adequate residual image](#target-rank-two-ordinary-r-equals-t); [Layer 8, Galois representations on the rank-two ordinary Hecke algebra](#target-rank-two-unitary-galois-representations); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions); GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.9; GL2AutomorphicRepresentationsAndTransfer §R17.4.10; AutomorphicGaloisRepresentationsPartII AG2.0, “Conjugate self-dual, essentially conjugate self-dual and polarized automorphic representations, with the multiplier character”; `OrdinaryAutomorphicFormsAndModularityLifting` §2.1 (nearly ordinary automorphic representations, the rank-two ι-ordinary notion); GlobalGaloisDeformations §4.2; GlobalGaloisDeformations §8.2; LocalGaloisDeformationRings §3.13.

<a id="target-ordinary-global-ring-finiteness"></a>
### 8.7 Ordinary unframed-ring finiteness

For `p>2` and totally real F, fix a totally odd absolutely irreducible `ρ̄`, adequate on `G_(F(ζ_p))`, with `ζ_p∉F`. Let O be the integers of a finite p-adic coefficient field containing all labeled embeddings used below. Fix a continuous determinant d lifting `det ρ̄` and S containing p and all ramification. Require an ordinary RAESDC cuspidal seed `π` with residual representation `ρ̄` and **characteristic-zero determinant d**. At p fix regular labeled Hodge multisets `H_τ={h_(τ,1),h_(τ,2)}`, with sum `HT_τ(d)`, and use the reduced O-flat semistable ordinary local quotient of this type. Away from p use unrestricted fixed-determinant local conditions. The fixed-determinant **unframed** global GL₂ ring `R_F` is finite over O; further away-p quotients remain finite.

The polarized input is the finiteness statement (2) of §8.6, the rank-two case of Thorne's Theorem 10.2: for a CM extension K/F, a polarized residual prolongation `r̄:G_F→𝒢₂(k)` and a fixed multiplier, an ordinary RAECSDC seed over K, adequacy on `G_(K(ζ_p)), ζ_p∉K`, a finite S split in K, unrestricted away-p lifting rings and the fixed symmetric regular Hodge-type semistable ordinary rings at p, the unframed polarized ring `R_K` is finite over O. The fixed Hodge type need not equal the seed's weight, but its symmetry must use the same multiplier.

Construct the totally real adapter as follows.

1. Choose a CM quadratic K/F split at every `v∈S` and disjoint from the residual-kernel/cyclotomic field. Quadratic weak approximation allows negative signs at all real places and local squares at S; an additional split-place avoidance prescription prevents containment in the finite avoidance field. Disjointness preserves the required residual image on `G_(K(ζ_p))`, hence adequacy, and ensures `ζ_p∉K`. Soluble base change of `π` is cuspidal because its restricted residual representation is absolutely irreducible.
2. Use the alternating determinant pairing of a rank-two representation to prolong every GL₂ deformation `ρ` of determinant d to `𝒢₂`, with fixed multiplier `ν=d`. Explicitly, put `J=(0,1;−1,0)`, send `g∈G_K` to `(ρ(g),d(g))`, and a complex conjugation c to `(ρ(c)J⁻¹,1)j`. Oddness and `p>2` give `det ρ(c)=−1` and `ρ(c)²=1`; `ρ(c)J⁻¹` is symmetric, so the square of this last element is 1. The identity `Jρ(g)^−tJ⁻¹=ρ(g)/d(g)` checks conjugation. The multiplier at c is `−1`, and `μ=dε` is even: this is the `κ=0` prolongation. This construction, up to strict equivalence, is natural in the coefficient algebra; it is not a separately chosen polarization for each point.
3. At each chosen `w|v∈S, K_w=F_v`. Restriction therefore identifies the selected local quotients, including their labeled Hodge types and the ordinary condition. The equality of the two Hodge sums with HT(d) gives the conjugate symmetry required by the multiplier. At nonsplit places outside S only the fixed CM component character is allowed to ramify; the underlying GL₂ representation is unramified. Thorne's `G_(F,S)` is Gal(K(S)/F), not the absolute Galois group of a totally real extension unramified outside S.
4. Universality gives `R_K→R_F`. The composite of the forgetful map from the unframed GL₂ ring of `ρ̄|G_K` to `R_K` with `R_K→R_F` is restriction of GL₂ deformations from F to K, and `R_F` is finite over the GL₂ ring of `ρ̄|G_K` because `ρ̄|G_K` is absolutely irreducible (GlobalGaloisDeformations §4.2, the argument of Gee–Geraghty Lemma 3.2.5: the closed fibre has finite image, traces generate, Nakayama). Hence `R_F` is a finite R_K-module, in the direction **extension-field ring → original-field ring**. Finiteness of `R_K` over O concludes the argument.

**Checks.** For an odd involution `ρ(c)=diag(1,−1)`, the matrix `ρ(c)J⁻¹=(0,−1;−1,0)` is symmetric, so `((ρ(c)J⁻¹,1)j)²=1` and its multiplier is `−1`. For the even involution `ρ(c)=1`, the matrix is skew-symmetric and the same square is `−1`; this rejects the prolongation when oddness is omitted. The identity extension gives the identity ring map. A free framing variable produces O[[x]], whose reduction k[[x]] is infinite: the argument does not prove finiteness of a framed ring. A local quotient selected by an ordinary flag with variable Hodge characters fails step 3; fixed regular type and a comparison of quotients are indispensable. A seed with the same residual determinant but a different characteristic-zero determinant fails the fixed-multiplier input. Absolute irreducibility alone also does not supply adequacy at the small primes.

Prove it as `ordinary_global_finiteness`.

The sources are [Thorne][thorne], §3, pp. 7–8, Theorem 10.2, setup and proof, author pp. 56–58, and Corollary 8.7, p. 53; [Gee–Geraghty][gee-geraghty], Lemma 3.2.5 and proof, p. 14. The rank-two determinant pairing gives the explicit prolongation formula above.

*Needs:* [Layer 8, Rank-two ordinary automorphy lifting and ordinary finiteness](#target-rank-two-ordinary-automorphy-and-finiteness); GlobalGaloisDeformations §4.2; GlobalGaloisDeformations §8.1; ArithmeticGaloisRepresentations §7.4; LocalGaloisDeformationRings §3.13; GL2AutomorphicRepresentationsAndTransfer §§R17.4.2–R17.4.9; [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions).

<a id="target-cg-ordinary-ring-finiteness"></a>
### 8.8 The Calegari–Geraghty finiteness application

In the scalar branch of Calegari–Geraghty Theorem 4.8, take `p≥3` and an absolutely irreducible modular `ρ̄` of `G_ℚ`, twist-minimal away from p, **unramified at p with scalar Frobenius**. For each harmless-prime character `φ` fix χ_φ=ε⟨det(ρ̄)ε̄⁻¹⟩φ, where the brackets denote the finite Teichmüller lift. Use the framed ordinary R† at p and unrestricted fixed-determinant local rings at the other ramified places. The corresponding unframed `R_φ` is finite over O. Its framed enlargement is a power-series ring over it; the version adjoining the Frobenius eigenvalue is finite quadratic over `R_φ`, hence finite over O as well. This supplies the finiteness input to the multiplicity argument.

Here `ρ̄|G_(ℚ(ζ_p))` is absolutely irreducible. Otherwise Clifford theory for the cyclic quotient and rank two makes `ρ̄` induced from its index-two subgroup, the quadratic subfield of `ℚ(ζ_p)`; its nontrivial quadratic self-twist would be ramified at p, contradicting the unramified local representation. Snowden's (A2) also holds: over `ℚ` the cyclotomic degree at `p=5` is 4. Thus the finiteness theorem of §4.15 applies without an adequacy assumption. In particular, projective images `PSL₂(𝔽₃)` at `p=3` and `PSL₂(𝔽₅)` at `p=5` are included. The adequate-image specialization `cgRingFinitenessAdequate` can also use §8.7, but it is not needed for these two cases.

The local-to-global comparison is part of the proof, with the following steps.

1. Twist the local residual scalar to 1 by an unramified character, adjusting the determinant accordingly. At p, Theorem 3.19 with `n=2` gives the reduced O-flat ring R̃† and its image R†. Its characteristic-zero points have matrices `(εω⁻¹λ(α⁻¹),*;0,λ(α))`, where `λ` is unramified. The ring R̃† is integral of relative dimension 4; it is finite over R† because `α` satisfies the Frobenius characteristic polynomial. The image R† is therefore reduced and O-flat of Krull dimension 5. The source's proof identifies this as a potentially crystalline ordinary component: `ω` is nontrivial when `p>2`, so the potentially semistable noncrystalline type is absent. Kill `ω` by a fixed finite Galois extension of `ℚ_p` and kill the finite determinant character as well. Every characteristic-zero point then becomes crystalline ordinary of determinant `ε`, hence admissible of type A. This is uniform over the whole local ring, not merely the modular seed.
2. At `v≠p` use the local descriptions in Lemma 4.11. After a finite coefficient extension, each reduced minimal-component quotient is O-flat of Krull dimension 4, with formally smooth generic fibre. The power-series-over-O[Δ] cases have finite inertial characters. In the remaining Chebyshev-relation case the trace roots separate the finite-inertia components from the unipotent one. On a finite-inertia component a single finite Galois `L_v` kills the inertia and determinant character, giving admissible type AB. On a unipotent component a fixed extension also kills the finite quadratic twist, giving an extension of 1 by `ε`, admissible of type C, including its split points. Thus each component has a **uniform** `L_v` and a definite admissible-type label, as required in §4.15. One cannot choose a different extension separately for every point and then invoke that theorem. For the two group-ring presentations, `O[Δ]` is finite free over O and has reduced characteristic-zero fibre. In the third presentation, the relation can be taken to be `C_v(T)−T`, where `C_v(t+t⁻¹)=t^v+t^(−v)` and T is the tame-inertia trace near 2 (Lemma 4.11, footnote 5). To use the trace as a formal coordinate, first put the nontrivial residual unipotent inertia matrix in a basis whose upper-right entry is a unit. Solve the determinant-one equation for its lower-left entry; its trace and its upper-left and upper-right entries are then formal coordinates. The Frobenius conjugation equation eliminates the remaining Frobenius entries except one centralizer parameter, leaving the single relation `C_v(T)−T`. More explicitly, cyclicity of the inertia matrix makes its intertwiner module a rank-two centralizer torsor. At the residual Frobenius `aI+bN`, a is nonzero; the derivative of its determinant in the scalar direction is 2a, a unit because p is odd. The fixed-determinant equation therefore eliminates one centralizer coordinate. This polynomial has nonzero reduction in the trace coordinate (its degree is v), so `ϖ` is a nonzerodivisor in the hypersurface presentation. Thus the whole ring is O-flat; its formally smooth generic fibre then makes it reduced. Its minimal-prime quotients remain O-flat and have Krull dimension 4. Generic smoothness alone would not exclude vertical components.
3. For each choice of an away-p component, impose its quotient along with R† at p. Apply `snowdenWeightTwoRingFiniteness` over `ℚ` to the resulting unframed global quotient, with determinant `χ_φ`. The local restriction factorization in its proof is an actual map of complete local rings: reduced O-flatness reduces the equality to characteristic-zero points, where admissibility supplies it. This proves O-finiteness on every component choice, including the exceptional residual images.
4. Recover finiteness of `R_φ` itself, retaining possible global nilpotents. Every prime of `R_φ/(ϖ)` contains the image of some minimal-component ideal at each local place. There are finitely many such choices, and their global quotients are O-finite by step 3. Hence `R_φ/(ϖ)` is zero-dimensional. It is a complete Noetherian local algebra with finite residue field, so is Artinian and finite over k. Completeness and topological Nakayama then make `R_φ` finite over O. This argument does not assume that the global ring is reduced, nor infer integral finiteness from a generic-fibre comparison alone.

For the Hecke comparison, the seed determinant must be corrected too: twist by the inverse half-power of the congruent-to-one finite determinant discrepancy, as on CG PDF p. 67. Squaring is an automorphism of its finite p-group because p is odd. This is not a square root of `ω`.

**Checks.**

- Projective `PSL₂(𝔽₃)` at `p=3` is not adequate, but satisfies Snowden's image hypotheses in this rational-field scalar branch. Removing it would weaken `cgRingFiniteness`.
- Projective `PGL₂(𝔽₅)` over `ℚ` satisfies (A2), whereas over a totally real field containing ℚ(√5) the same argument needs a different input. The rational base is used.
- R̃† has Krull dimension 5, while the unrestricted away-p components have dimension 4. Framing variables cannot be retained in the O-finiteness conclusion.
- A ring O⟦x⟧ has infinite special fibre and fails step 4. An O-finite ring with nilpotents, such as O[e]/(e²), passes: reducedness is not a hidden global hypothesis.
- An extension of 1 by `ε` with nonzero monodromy at p is not a point of the potentially crystalline component of step 1. Killing its tame determinant character would not make it crystalline.
- At an away-p unipotent component, the split point is still admissible of type C. Demanding that every such point have **definite global type C** would incorrectly exclude this specialization.

The sources are [Calegari–Geraghty][cg], Theorem 3.19, PDF p. 39, and Theorem 4.8 proof, PDF pp. 65–68, especially the determinant twist and component patching on p. 67 and the finiteness paragraph on p. 68; Lemma 4.11 and its proof, PDF pp. 68–69; [Snowden v1][snowden], Theorem 6.1.1 and Lemma 6.4.1, pp. 19–20; [Barnet-Lamb–Gee–Geraghty][rank-two-adequacy], Proposition A.2.1, author pp. 30–31 (the classification applied to the cyclotomic-restricted image).

*Needs:* [Layer 4, Dyadic paired torsion moduli and local points](#target-dyadic-auxiliary-moduli); [Layer 4, Residual modularity over totally real fields](#target-snowden-totally-real-potential-residual-modularity) (`snowdenWeightTwoRingFiniteness`); [Layer 8, Ordinary unframed-ring finiteness](#target-ordinary-global-ring-finiteness) (adequate specialization); LocalGaloisDeformationRings §6.7 (ordinary rings with a Frobenius eigenvalue); ArithmeticGaloisRepresentations §7.9 (rank-two adequacy); [Layer 2, Soluble prescribed-completion extensions](#target-cht-soluble-prescribed-completions).

### Examples

A framed ring adds formal variables and fails the asserted unframed finiteness conclusion. The auxiliary field tests retain its splitting and image conditions.

### Dependencies

This layer uses the Tau Ceti roadmaps AdelicAlgebraicGroups, Chebotarev and IntegralHeckeAndGaloisDeterminants; the roadmaps ClassicalSerreModularity, ArithmeticGaloisDuality, ArithmeticGaloisRepresentations, AutomorphicFormsOnReductiveGroups, AutomorphicGaloisRepresentations, AutomorphicGaloisRepresentationsPartII, DeformationAndDerivedPatchingAlgebra, EndoscopicTransferAndUnitaryTraceComparison, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings, OrdinaryAutomorphicFormsAndModularityLifting, PadicFamilies and SerreWeightAndLevelOptimisation; and Layers 2, 4 and 6 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r24-2"></a>
## Layer 9: Characteristic-zero points


Combine a dimension lower bound and finiteness to obtain an integral coefficient-extension point. The representation is then specialized from the universal one; modularity is a separate, subsequent application.

<a id="target-characteristic-zero-points-of-r-bar-s-psi-give-lifts-of-required-type"></a>
### 9.1 Points give lifts with the required local type

For a nonzero complete noetherian local fixed-determinant global ring `R̄_S^ψ` that is finite over O and has absolute Krull dimension at least one, use the characteristic-zero-point theorem to obtain a continuous map `R̄_S^ψ → O′` for the integers of a finite extension of Frac O. Specialize the universal representation: it lifts `ρ̄`, has determinant `ψχ_p` and satisfies the chosen local conditions at every place. The local A/B/C classifications identify its required type. Finiteness alone is insufficient: a nonzero finite O-algebra of dimension zero can be killed by a power of the uniformizer and have empty characteristic-zero fibre.

For the rational KW problems, `exists_lift_of_required_type` is the comparison with the characteristic-zero point extraction in ClassicalSerreModularity `I.2/full-kw-global-finiteness`: identify the ring and its local point characterization before specializing the supplied integral point. The same interface over larger base fields uses the generic point theorem with the displayed finiteness and dimension hypotheses; it does not assert new rational KW lifts.

**Checks.** `O/(π)` is finite but has dimension zero and no characteristic-zero point. The ring O has its identity integral point. A point of a different local quotient does not supply the prescribed type.

The sources are [KW II][kw-serre-modularity-II], proof of Proposition 4.5, p. 43, proof of Proposition 4.5, p. 45, Corollary 4.7 and proof, pp. 45-46, 10.3.1, p. 92, Corollary 4.7, p. 45.

*Needs:* ClassicalSerreModularity `I.2/full-kw-global-finiteness` (characteristic-zero point extraction); LocalGaloisDeformationRings §8.17; LocalGaloisDeformationRings §8.18; [Layer 8, Finiteness of the KW unframed ring](#target-kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring); GlobalGaloisDeformations §6.1; GlobalGaloisDeformations §6.2; GlobalGaloisDeformations §3.8; DeformationAndDerivedPatchingAlgebra §§4.1–4.2; GlobalGaloisDeformations §6.3.

<a id="target-newton-thorne-khare-wintenberger-extraction"></a>
### 9.2 Points on prescribed Newton–Thorne components

Use Newton–Thorne Lemma 3.1 with `p≥5, π` RAESDC over totally real F, determinant `ε⁻¹`, weight zero and Steinberg at p, tame dihedral order p at v₀ with q_(v₀)≡−1 mod p, potential unramifiedness away from p, and residual image containing `SL₂(F_(p^a))` for `a>a₀(p)`. Select the ordinary potentially crystalline components at p, the Steinberg component at v₀, and the specified regular components elsewhere. Hida specialization and the explicit unipotently ramified lift establish local nonemptiness. The chosen global lift has determinant `ε⁻²ω` and Hodge–Tate weights {0,2}. Export a RAESDC ordinary σ with the same residual representation as π, an unramified Steinberg twist at v₀, and `r_σ|G_(F_v)∼r_π|G_(F_v)` on the same local component at every `v∤pv₀`. The existence and these component conclusions are the target here; the ordinary supplier provides the Hida seed.

Use the Hida specialization `π′` of the proof of Lemma 3.1 as the ordinary seed of §8.7: its characteristic-zero determinant is `ε⁻²ω` and its local weights are {0,2}. The original `π` has determinant `ε⁻¹` and cannot itself serve as that seed. At each v|p, choose the unique regular potentially crystalline component through `r_(π′,ι)|G_(F_v)`. Its ordinary locus is a union of components, as the source checks by dimension and the fixed Hodge type. After a single soluble extension killing all the finite p-adic inertial types, the universal restrictions factor through the semistable ordinary local quotients of the same transported weights. Use the reduced O-flat quotient characterization to prove the ring maps, not just membership of one characteristic-zero point. Choose this extension disjoint from the residual-kernel/cyclotomic field. The `SL₂(F_(p^a))` image and `a>a₀(p)` condition supply the required adequacy; the nonordinary Steinberg component at v₀ is permitted by the unrestricted away-p ring in §8.7. Finite restriction and §8.7 then give module finiteness of the original selected-component global quotient. Its dimension bound gives a characteristic-zero point.

The automorphy of the extracted point is the lifting statement (1) of §8.6 (Thorne's Theorem 9.1 in rank two, after soluble CM base change and descent), applied with the ordinary seed `π′`; its residual image condition is the adequacy supplied by `SL₂(F_(p^a))⊆` image with `a>a₀(p)`.

**Checks.** The determinants `ε⁻¹` and `ε⁻²ω` have the same residual reduction but different characteristic-zero Hodge sums; this detects the wrong seed. A Steinberg p-adic point has nonzero N and does not belong to the selected potentially crystalline component. The Steinberg component at v₀ is allowed because `v₀∤p`; requiring ordinarity at every place would discard the needed local lift.

The dimension bound gives `dim R≥1` for the unframed global ring of these components, and the applicable finiteness comparison gives R finite over O. Hence `R[1/p]≠0` and an integral characteristic-zero point exists over a finite coefficient extension. Its representation lies on the prescribed local components. Automorphy is obtained by a subsequent lifting application; it is not used as a premise for extracting this point.

Prove it as `newton_thorne_point`.

The sources are [Newton–Thorne][newton-thorne], Lemma 3.1 and proof, §3, pp. 13–14 of arXiv:2212.03595v2; [Thorne][thorne], Theorem 9.1, pp. 53–54, and Theorem 10.2, pp. 56–58.

*Needs:* [Layer 8, Ordinary unframed-ring finiteness](#target-ordinary-global-ring-finiteness); [Layer 8, Rank-two ordinary automorphy lifting and ordinary finiteness](#target-rank-two-ordinary-automorphy-and-finiteness); DeformationAndDerivedPatchingAlgebra §§4.1–4.2; GlobalGaloisDeformations §3.8; GlobalGaloisDeformations Layer R04.6; LocalGaloisDeformationRings §8.12; OrdinaryAutomorphicFormsAndModularityLifting §2.11 (the Hida specialization `π′`, supplying local ordinary lifts only).

### Examples

The nontrivial special fibre and the chosen local component control point extraction; a zero algebra provides no characteristic-zero point.

### Dependencies

This layer uses the roadmaps ClassicalSerreModularity, DeformationAndDerivedPatchingAlgebra, GlobalGaloisDeformations, LocalGaloisDeformationRings and OrdinaryAutomorphicFormsAndModularityLifting; and Layer 8 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r24-3"></a>
## Layer 10: Prescribed lifts


Use the global presentation and finiteness separately, then identify the resulting local types. A compatible inertial lattice is not a substitute for a local solution of a prescribed lifting problem.

<a id="target-bockle-presentation"></a>
### 10.1 Böckle's global-ring presentation

Let `p>2` and let `ρ̄` : `G_ℚ → GL₂(k)` be odd and absolutely irreducible, with a global deformation condition X unramified outside finite S. Set `d=0` and `Ad_X=Ad⁰ρ̄` for fixed determinant, and `d=1` and `Ad_X=Adρ̄` otherwise. Assume the away-p local rings are complete intersections flat over `ℤ_p` of relative dimension `h⁰(G_l,Ad_X)−Δ_l`, and the p-adic ring is a flat complete intersection of relative dimension `h⁰(G_p,Ad_X)+1+d−Δ_p`. Writing `Δ=ΣΔ_l`, obtain a presentation `R_X ≅` O[[x₁,…,x_(n+d)]]/(f₁,…,f_(n+Δ)). In particular `Δ≤0` gives at most as many relations as variables; the minimal fixed-determinant case has a presentation W[[X₁,…,X_r]]/(f₁,…,f_s) with `r≥s`. Oddness enters the global Euler-characteristic computation. These local dimensions come from LocalGaloisDeformationRings Layer 8, and finiteness over O remains the separate input of Layer 8. For dyadic lift extraction use instead the KW full-adjoint dimension bound of GlobalGaloisDeformations §3.8, including the real-place local conditions, then §8.2 finiteness and §9.1 point extraction. This does not assert a dyadic Böckle presentation.

**Checks.** At odd p, trace splits off the scalar adjoint summand since 2 is invertible. At p=2, the identity matrix has trace zero, so the scalar and trace-zero modules do not give that splitting. The dyadic KW lower bound `dim R≥1`, combined with finiteness over O, forces a nonzero generic fibre and gives a characteristic-zero point; the dimension bound alone does not give finiteness.

Prove it as `bockle_presentation`.

The sources are [Böckle][bockle-appendix-2003], Proposition 1, p. 2, Proof of Proposition 1, p. 2; [KW Annals][kw-annals-2009], Proposition 3.4, printed p. 240.

*Needs:* GlobalGaloisDeformations §§3.6–3.7 (odd-prime presentation); LocalGaloisDeformationRings §§8.2 and 8.19; GlobalGaloisDeformations §3.8 (the separate dyadic dimension bound); §8.2 and §9.1 here (its finiteness and point extraction).

<a id="target-finite-presentation-complete-intersection"></a>
### 10.2 Finite presentations and complete intersections

Let O be a complete DVR with uniformizer `π`, let A=O[[x₁,…,x_n]], and take f₁,…,f_m in its maximal ideal with `m≤n`. Suppose R=A/(f₁,…,f_m) is nonzero, complete noetherian local, has the same residue field as O, and is finite over O. Then `m=n`, (π,f₁,…,f_n) is A-regular, and R is a finite flat complete intersection over O with `R[1/π]≠0`. Import the regular-local/Cohen–Macaulay proof from DeformationAndDerivedPatchingAlgebra Layer 3 and, when Frac(O) has characteristic zero, point extraction through Layer 9 from DeformationAndDerivedPatchingAlgebra Layer 4. Finiteness is essential: O[[x]] has no relations and is flat but is not finite over O, so it cannot imply `m=n`.

A presentation is an O-algebra equivalence with the quotient of r-variable formal power series by s equations. A flat complete intersection of relative dimension d is O-flat and has such a presentation with `s+d` variables and an s-term regular sequence, including a nonzero final quotient.

Suggested.lean states `Presentations.finite_presentation_complete_intersection`: equal counts, flatness, regularity of the equations with and without the initial uniformizer, and a nonzero generic fibre.

**Checks.**

- `presentation_empty`: O has a presentation with zero variables and zero equations.
- `presentation_variable`: O also has the one-variable presentation O[[x]]/(x).
- `presentation_unit`: O[[x]]/(1) is a valid presentation of the zero algebra, so presentation alone does not imply nontriviality.
- `ci_empty`: every nonzero O is flat over itself and has relative dimension zero via the empty regular sequence.
- For nonzero noetherian O, O[[x]] is O-flat of relative dimension one; arbitrary coefficient rings are excluded.
- Over any coefficient ring and in any relative dimension, the quotient by (1) fails the regular-sequence nonzero-quotient condition; in particular this excludes `ℚ[[x]]/(1)`.
- A nonzero scalar annihilating a nonzero algebra over a domain obstructs flatness in every relative dimension. In particular `ℤ/2` is not ℤ-flat, so it fails the flat-complete-intersection predicate.

The sources are [Böckle][bockle-appendix-2003], Lemma 2, p. 5; [Stacks Project, §10.97, Lemma 10.97.2](https://stacks.math.columbia.edu/tag/00MB) for noetherian completion flatness.

*Needs:* `mathlib:RingTheory.Sequence.IsRegular`; `mathlib:IsLocalRing`; `mathlib:ringKrullDim`; `mathlib:Module.Flat`; DeformationAndDerivedPatchingAlgebra §§3.2–3.5; [Layer 9](#layer-r24-2).

<a id="target-bockle-minimal-r-equals-t"></a>
### 10.3 From auxiliary to minimal R=T

Consume the auxiliary-to-minimal deduction owned by ClassicalSerreModularity I.2 and `R26.1/bockle-appendix-minimal-deformation-ring-presentation`. For `p>2`, retain its odd absolutely irreducible residual representation, coefficient ring W(k), determinant and local conditions in Böckle's appendix to Khare's 2003 theorem. Keep the canonical commutative square with surjective horizontal deformation-to-Hecke maps `R_Q → T_Q` and `R_∅ → T_∅`, and the actual vertical quotient maps `R_Q → R_∅` and `T_Q → T_∅`. The auxiliary integral isomorphism `R_Q ≅ T_Q` is a hypothesis of the supplied deduction. Retain finite flatness of both Hecke algebras over W(k), their reducedness (for T_Q by the choice of Q), and Carayol's conductor comparison: an auxiliary eigenform whose Galois representation is unramified at Q has conductor prime to Q.

The comparison `bockle_minimal_r_equals_t` identifies these rings, coefficient structures and quotient maps with the owner's data and imports its conclusion that the canonical `R_∅ → T_∅` is an isomorphism. The owner obtains finiteness through `R_Q → R_∅`, flatness from the numerical criterion and the generic-fibre comparison from reducedness and the conductor theorem.

**Checks.** The finite W(k)-algebra `W(k)[ε]/(pε,ε²)` maps to W(k) isomorphically after inverting p but has nonzero p-torsion, so that generic isomorphism does not supply the auxiliary integral premise. The finite flat algebra `W(k)[ε]/(ε²)` has the same geometric generic points as W(k) but retains a nilpotent; the point comparison uses reduced generic fibres. An auxiliary eigenform unramified at every prime in Q has conductor prime to Q by Carayol, so its generic point belongs to the minimal Hecke algebra.

The sources are [Böckle][bockle-appendix-2003], Theorem 1, p. 1, Corollary 2 and proof of Theorem 1, pp. 5–6.

*Needs:* ClassicalSerreModularity I.2 and `R26.1/bockle-appendix-minimal-deformation-ring-presentation`.

<a id="target-kw-annals-minimal-lifts"></a>
### 10.4 The minimal-lift theorem

For an S-type residual representation in odd characteristic, assume absolute irreducibility over `ℚ(μ_p), 2≤k(ρ̄)≤p+1` and `k(ρ̄)≠p`. There is a lift minimally ramified at every prime. At `k=p+1` one can choose either crystalline Hodge–Tate weights (0,p) or semistable weight two. Combine the minimal ring's presentation with at least as many variables as relations, potential-modularity finiteness and the complete-intersection result, then extract a characteristic-zero point. The source excludes weight p because its Fontaine–Laffaille and `R=T` inputs do not supply that case. This method is the one attributed to the remark in Khare–Ramakrishna §5.2; the theorem and its proof occur in KW Annals §3. The coefficient field of a lift is not fixed by the theorem.

Prove it as `exists_minimally_ramified_lift`.

The sources are [KW Annals][kw-annals-2009], Theorem 3.3, printed p. 239, Introduction, printed p. 231, Lemma 3.6, printed p. 241, References, printed p. 252, Proof of Proposition 3.8, printed p. 242.

*Needs:* [Layer 10, Böckle's global-ring presentation](#target-bockle-presentation); [Layer 10, Finite presentations and complete intersections](#target-finite-presentation-complete-intersection); LocalGaloisDeformationRings §§8.15–8.16; GL2ModularityLifting §3.6; [Layer 8](#layer-r24-1).

<a id="target-required-lift-types"></a>
### 10.5 The four required lift types

Consume ClassicalSerreModularity `I.3/prescribed-lifts`. Fix an S-type `ρ̄:G_ℚ→GL₂(k)`, with cyclotomic absolute irreducibility and `2≤k(ρ̄)≤p+1` for `p>2`, or nonsoluble image for `p=2`. The interface `RequiredLiftType` identifies its four prescriptions with the owner's four cases, including the full residual representation, chosen stable lattice, coefficient embedding, determinant and minimality. A lift of required type is an O′-point of the corresponding fixed-determinant global ring. The prescriptions being compared are:

1. It is minimal at all `l≠p` and crystalline of weight `k(ρ̄)` at p. Require `k=2` when `p=2`.
2. It is minimal at all `l≠p` and has weight two at p, with inertial WD parameter `(ω_p^(k−2)⊕1,0)`. At `k=p+1` replace this by (id,N) with `N≠0` nilpotent; the dyadic exceptional weight is `k=4`.
3. Let q be odd with q∥N(ρ̄), `p|(q−1)` and residual inertia `(χ,*;0,1)`. At p use type 2, and be minimal away from p,q. At q prescribe `(χ′,*;0,1)`, where `χ′=ω_q^i` lifts `χ` and `0<i≤q−2`. Require i even when `p=2`.
4. Let `q≠p, p|(q+1)`, and assume residual decomposition-group shape `(χ_p,*;0,1)` up to unramified twist. At p use type 2 and be minimal away from p,q. At q prescribe `χ′⊕χ′^q`, with `χ′=ω_(q,2)^iω_(q,2)^(qj)` of p-power order and genuinely level two, `0≤j<i≤q−1`. Require `i+j` even when `p=2`. Such a character is unavailable in the dyadic case `v₂(q+1)=1`.

The four cases retain the displayed prime, exponent, order and parity restrictions, with an auxiliary prime q only in cases 3–4. The minimal crystalline case has no Steinberg requirement; the other prescriptions require Steinberg monodromy exactly when `(p=2 ∧ k=4) ∨ (p≠2 ∧ k=p+1)`. The lift-type interface includes the residual local representation, determinant and point of a deformation ring, as well as these numerical restrictions.

Minimality uses Diamond's condition and the dyadic version from KW II §3.3.1, imported through LocalGaloisDeformationRings Layer 8. In type 4 the distinct inertia characters split any characteristic-zero extension. If q∥N(ρ̄) and `p∤q−1`, a geometric lift with q∥N(ρ) is automatically minimal there; this explains the divisibility hypothesis of type 3.

The comparison has the following API, using the owner’s prescriptions and the supplied deformation rings:

- `RequiredLiftType`: the case (1)–(4) of ClassicalSerreModularity `I.3/prescribed-lifts`, with its auxiliary data `(q, χ′)` and the fixed character `ψ`
- `RequiredLiftType.localCondition`: the local condition `X_v` of LocalGaloisDeformationRings Layer 8 at each `v ∈ S`
- `RequiredLiftType.ring`: the ring `R̄^ψ_S` of GlobalGaloisDeformations R04.6 for these conditions
- `RequiredLiftType.points_iff`: identify the owner’s local point characterization with 𝒪′-points of this ring ↔ lifts of the required type
- `RequiredLiftType.det`: every lift of the type has determinant `ψχ_p`

**Checks.**

- `type3_parity_p2`: `p = 2, q = 5`: `χ′ = ω₅` has `i = 1` odd and is excluded; `ω₅² (i = 2)` is allowed
- `type4_level_two_exists`: `p = 2`: `q = 7` has `v₂(8) = 3 ≥ 2`, so level-2 characters of 2-power order exist; `q = 5` has `v₂(6) = 1` and none exist
- `type2_steinberg`: for odd p and `k(ρ̄)=p+1`, or for `p=2,k=4`: the inertial parameter is (id, `N ≠ 0`), a Steinberg type
- `type2_parameters`: the weight-two prescription has no auxiliary prime; at `p=3` its weight `k=4` requires Steinberg monodromy, whereas `k=2` does not; at `p=2,k=4` it also requires Steinberg monodromy, while `p=2,k=3` does not trigger the numerical predicate.
- `type3_needs_p_divides`: `p=3, q=5`: `3∤4=q−1`, so type (3) is unavailable. For a geometric regular lift with q∥N(ρ̄), the imported LocalGaloisDeformationRings Layer 8 automatic-minimality criterion applies at q when `p∤q−1`.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1, p. 9 of the preprint, Theorem 5.1(4), p. 10 of the preprint, Remark after Theorem 5.1, p. 10.

*Needs:* ClassicalSerreModularity `I.3/prescribed-lifts`; LocalGaloisDeformationRings §§8.2 and 8.19; GlobalGaloisDeformations §6.1; GlobalGaloisDeformations §6.3; AlgebraicModularFormsAndSerreWeights Layer R15.6; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations Layer 2.

<a id="target-theorem-5-1-part-1-minimal-crystalline"></a>
### 10.6 Minimal crystalline lifts

With the common hypotheses of §10.5, identify case (1) of ClassicalSerreModularity `I.3/prescribed-lifts` with a type-1 lift here, minimal away from p and crystalline of weight k at p. The comparison retains the stable lattice reducing to the full `ρ̄` and the matching determinant; existence is the owner's export. At `p=2` require `k=2`. The odd-prime case includes `k=p` through the full KW export.

**Checks.** Dyadic residual weight two admits the crystalline weight-two prescription. Dyadic weight four fails this prescription. Odd `k=p` is included, although the Annals variant excludes it.

Prove it as `exists_minimal_crystalline_lift`.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(1), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* ClassicalSerreModularity `I.3/prescribed-lifts`; [Layer 10, The four required lift types](#target-required-lift-types).

<a id="target-theorem-5-1-part-2-weight-two"></a>
### 10.7 Minimal weight-two lifts

With the common hypotheses of §10.5, identify case (2) of ClassicalSerreModularity `I.3/prescribed-lifts` with a type-2 weight-two lift here, minimal away from p. Retain its determinant and chosen full residual reduction. Its inertial WD parameter is `(ω^(k−2)⊕1,0)`, or `(id,N≠0)` in the exceptional odd `k=p+1` branch. At `p=2,k=4` use the semistable noncrystalline weight-two condition C. Existence is supplied by the owner.

**Checks.** At `k=2` the potentially crystalline prescription has trivial inertial type and `N=0`. At odd `k=p+1` the weight-two prescription has nonzero N. Dyadic weight four also has nonzero N; it is not the crystalline weight-four lift.

Prove it as `exists_minimal_weight_two_lift`.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(2), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* ClassicalSerreModularity `I.3/prescribed-lifts`; [Layer 10, The four required lift types](#target-required-lift-types).

<a id="target-theorem-5-1-part-3-level-one-type-at-q"></a>
### 10.8 A level-one type at q

Under the common hypotheses and the complete type-3 local prescription of §10.5, compare case (3) of ClassicalSerreModularity `I.3/prescribed-lifts` with this interface. The supplied lift has the chosen level-one inertia character `χ′=ω_q^i` at q, the specified weight-two p-type, matching determinant and full residual reduction. Character parity at `p=2`, q∥N(ρ̄) and `p|(q−1)` remain essential. The residual-q weight comparison is the application in §12.4, rather than an additional lift construction.

**Checks.** At `p=2,q=5`, exponent one is excluded by parity. Exponent two meets that parity condition. At `p=3,q=5`, the condition `p|(q−1)` fails regardless of the chosen exponent.

Prove it as `exists_lift_level_one_type_at_q`.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(3), p. 9 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* ClassicalSerreModularity `I.3/prescribed-lifts`; [Layer 10, The four required lift types](#target-required-lift-types).

<a id="target-theorem-5-1-part-4-level-two-type-at-q"></a>
### 10.9 A level-two type at q

Under the common hypotheses and the type-4 residual shape of §10.5, compare case (4) of ClassicalSerreModularity `I.3/prescribed-lifts` with this interface. Retain `p|(q+1)`, the genuine level-two p-power character, its compatible reduction, the dyadic parity restrictions and the prescribed determinant. The owner supplies the lift; its use at an auxiliary dihedral prime is an application of that export.

**Checks.** At `p=2,q=7`, exponent pair `(6,0)` gives order eight and genuine level two. At `p=2,q=5`, no character meets all the order, parity and niveau restrictions. A character fixed by the q-power operation is niveau one and fails this prescription even if its order is a p-power.

Prove it as `exists_lift_level_two_type_at_q`.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1(4), p. 10 of the preprint; [KW II][kw-serre-modularity-II], §10.3.1, p. 92 of the preprint.

*Needs:* ClassicalSerreModularity `I.3/prescribed-lifts`; [Layer 10, The four required lift types](#target-required-lift-types).

<a id="target-modern-prescribed-type-lifts"></a>
### 10.10 Prescribed-type local-to-global lifting

Let p be odd and F totally real. Assume `ρ̄` is odd, absolutely irreducible on `G_(F(ζ_p))`; if `p=5` and its projective image is PGL₂(F₅), also assume `[F(ζ₅):F]=4`. For finite Σ containing p and all ramification, finite-order `ψ` with `det ρ̄=ψ̄χ̄_p`, a definite type t and inertial types `τ_v`, consider weight-two lifts of determinant `ψχ_p`, unramified outside Σ, with those local data. There are finitely many solutions, and a solution exists exactly when actual local solutions exist at every specified place. A compatible definite type on a subset `Σ′` also gives the lift of Snowden Theorem 7.6.1.

For the application over `ℚ` the `p=5` exception is automatic. Use crystalline p-type when `k=2` and Steinberg p-type when `k=p+1` where asserted. An inertial-type lattice reducing to residual inertia does not by itself provide a lift of the complete local decomposition-group representation with the chosen determinant and definite type. Establish that local nonemptiness through LocalGaloisDeformationRings Layer 8 before applying the theorem. Inertial type forgets N; definite type retains the relevant monodromy information. Snowden Proposition 7.7.1 supplies some definite-type lift of the same conductor, rather than every prescribed inertial type.

Prove it as `modern_prescribed_type_lifts`.

The sources are [Snowden v1][snowden], Theorem 7.2.1, p. 21 of arXiv:0905.4266v1, §1.4, notation, p. 3 of arXiv:0905.4266v1, §3.1 (A1)–(A2), p. 6; §7.1–7.7, pp. 20–23, especially Propositions 7.3.1 and 7.4.1 and Theorem 7.6.1 (arXiv v1); [Dieulefait–Pacetti v2][dieulefait-pacetti], Theorem 1.9(4), p. 6 of the arXiv version.

*Needs:* LocalGaloisDeformationRings Layer 8; [Layer 8](#layer-r24-1); [Layer 9](#layer-r24-2); LocalGaloisDeformationRings §8.18.

<a id="target-theorem-5-1-application-table"></a>
### 10.11 Lift prescriptions in the modularity arguments

Use the following map from modularity arguments to lift prescriptions. Each use first checks the residual q-shape, `p|(q±1)` and dyadic parity required by its type.

| Argument in KW I | Lift types |
| --- | --- |
| §8.1, Theorem 3.1, removal of ramification | 1 |
| §8.2, characteristic three | 2, then 4 with `ω_(3,2)² |`
| §8.2, characteristic five | 2, then 3 with `ω₅²`; for the new residual five-member use 2 if 3 divides its conductor, and 1 otherwise |
| §8.2, inductive step | 2, then 3 with `ω_P^i` from §7; for the new residual P-member use 2 if the original p divides its conductor, and 1 otherwise |
| §8.3, Corollary 8.1 | 1 |
| §8.4, Theorem 3.4 | 2, then 4 at the good dihedral prime |
| §9, Theorem 9.1 | 2 and the order-three type 4 at 2 |

The Annals minimal-lift theorem is the type-1 case with `k≠p`. In Dieulefait–Pacetti Theorem 1.9, cases 1–3 use the appropriate odd-prime or dyadic instances of types 1 and 2. Its fourth case uses the prescribed-type local-to-global theorem of §10.10.

Prove it as `requiredLiftType_applications`.

The sources are [Dieulefait–Pacetti v2][dieulefait-pacetti], Proof of Theorem 1.9, p. 6 of the arXiv version; [KW I][kw-serre-modularity-I], §8.2, pp. 13–15 of the preprint.

*Needs:* [Layer 10, Minimal crystalline lifts](#target-theorem-5-1-part-1-minimal-crystalline); [Layer 10, Minimal weight-two lifts](#target-theorem-5-1-part-2-weight-two); [Layer 10, A level-one type at q](#target-theorem-5-1-part-3-level-one-type-at-q); [Layer 10, A level-two type at q](#target-theorem-5-1-part-4-level-two-type-at-q); [Layer 10, The minimal-lift theorem](#target-kw-annals-minimal-lifts); [Layer 10, Prescribed-type local-to-global lifting](#target-modern-prescribed-type-lifts).

### Examples

The `q=5` and `q=7` dyadic checks distinguish the two inertial character types. A quotient by the unit ideal is excluded from complete-intersection point extraction.

### Dependencies

This layer uses Mathlib; the roadmaps ClassicalSerreModularity, AlgebraicModularFormsAndSerreWeights, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, DeformationAndDerivedPatchingAlgebra, GL2ModularityLifting, GlobalGaloisDeformations and LocalGaloisDeformationRings; and Layers 8 and 9 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r24-4"></a>
## Layer 11: Rational-field modularity lifting


Import the full rational-field lifting theorems, rather than reconstructing them from a smaller totally real theorem. This layer supplies the comparison needed by linked systems.

<a id="target-alpha-beta-from-residual-modularity"></a>
### 11.1 Residual weight witnesses for lifting

For a modular S-type `ρ̄` satisfying the image hypotheses of KW I Theorem 4.1, import the weight part of Serre's conjecture to produce a weight-k witness of level prime to p and a weight-two witness of level Np. An allowable soluble totally real base change, unramified or split at p as required, gives the residual conditions `(α),(β)` used in the odd-prime lifting theorem, and `(α)` at `p=k=2` and `(β)` at `p=2`. Gross's auxiliary level condition `N>4` causes no restriction because the level need not be optimal. The `k=p` argument has the separate treatment of KW II §10.2.

Prove it as `alpha_beta_from_residual_modularity`.

The sources are [KW II][kw-serre-modularity-II], §10.2, p. 92 of the preprint.

*Needs:* GL2ModularityLifting §§1.2 and 5.1; SerreWeightAndLevelOptimisation Layer 6; AlgebraicModularFormsAndSerreWeights Layer R15.4; GL2AutomorphicRepresentationsAndTransfer Layer R17.4; GL2ModularityLifting §5.3; GL2ModularityLifting §5.5; GL2ModularityLifting §1.3.

<a id="target-kw-theorem-4-1"></a>
### 11.2 The full rational-field lifting theorem

Import the full rational-field modularity lifting theorem from GL2ModularityLifting (GL2ModularityLifting Layer 5 for odd p, GL2ModularityLifting Layer 6 for `p=2`). Suppose `ρ̄` is modular, with nonsoluble image at `p=2` and absolute irreducibility on `G_(ℚ(μ_p))` at `p>2`. For `p=2`, an odd finitely ramified lift is modular if crystalline of weight two, or semistable of weight two with residual `k=4`. For `p>2`, a finitely ramified lift is modular if crystalline of weight `2≤k≤p+1` or potentially semistable of weight two.

The interface combines residual weight witnesses, allowable base change, the relevant cases of KW II Theorem 9.7, the additional lifting inputs and soluble descent. Import `GL2ModularityLifting Layer 5/kw-i-theorem-4-1-odd-prime` and `GL2ModularityLifting Layer 6/kw-i-theorem-4-1-dyadic`: substituting Theorem 9.7 alone would lose some odd-prime cases, including the additional nonordinary weight-p+1 input.

Prove it as `rational_field_modularity_lifting`.

The sources are [KW I][kw-serre-modularity-I], Theorem 4.1, p. 7 of the preprint; [KW II][kw-serre-modularity-II], §10.2, p. 92 of the preprint.

*Needs:* [Layer 11, Residual weight witnesses for lifting](#target-alpha-beta-from-residual-modularity); GL2ModularityLifting §5.18; GL2ModularityLifting §6.16; GL2ModularityLifting §5.3; GL2AutomorphicRepresentationsAndTransfer Layer R17.4.

### Examples

At `p=2` the dyadic theorem applies; at odd p, the residual and coefficient-prime hypotheses select the imported lifting interface.

### Dependencies

This layer uses the roadmaps AlgebraicModularFormsAndSerreWeights, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting and SerreWeightAndLevelOptimisation. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r24-5"></a>
## Layer 12: Families through potentially modular lifts


Start with a given potentially modular lift. Automorphic families over soluble intermediate fields give a virtual Brauer class; prove its genuineness before asserting that it is a compatible family. The full coefficient-prime theorem then gives all-place strictness.

<a id="target-brauer-induction-system"></a>
### 12.1 Genuine families from Brauer induction

Suppose a given two-dimensional lift `ρ` becomes the representation of a holomorphic cuspidal Hilbert form over a finite totally real Galois `F/ℚ`, and remains absolutely irreducible over F. Write the trivial character of `G=Gal(F/ℚ)` as `Σn_i Ind_(G_i)^Gχ_i` with soluble `G_i` and fixed fields `F_i`. Soluble base change gives the corresponding cuspidal forms `π_i` over `F_i`. In every coefficient characteristic define the virtual class `A_ι=Σn_i Ind_(G_F_i)^(G_ℚ)(χ_i⊗ρ_(π_i,ι))`.

Prove the overlap comparison before applying the norm criterion. Enlarge one number field E to contain the coefficients of the finitely many `π_i` and values of every `χ_i`; fix the embeddings at the original p-member and at each `λ`. For a representative g of `G_i\G/G_j` put `H_ijg=G_i∩gG_jg⁻¹` and `K_ijg=F^H_ijg`. On `G_(K_ijg)` compare `U_(i,λ)=(χ_i⊗ρ_(π_i,λ))|G_(K_ijg)` and `V_(j,g,λ)={}^g(χ_j⊗ρ_(π_j,λ))|G_(K_ijg)`. Their good Frobenius polynomials come from E: finite restriction, conjugation and finite-character twist preserve this property, using powers of Frobenius at the primes below. Both representations are absolutely irreducible. Indeed, restricting further to `G_F` gives a finite-character twist of the family of the cuspidal `π_F`; every member of that Hilbert family is absolutely irreducible. Soluble base change identifies these restrictions at all coefficient places, not merely at p.

Define `b_ijg(λ)=dim Hom_(G_(K_ijg))(U_(i,λ),V_(j,g,λ))`. Schur's lemma gives `b_ijg(λ)∈{0,1}`. It is one precisely when the two E-valued Frobenius polynomials agree at all primes outside a common finite bad set. One implication uses injectivity of `E→Ē_λ`; the other uses Chebotarev, continuity and Brauer–Nesbitt. This criterion does not depend on `λ`, so `b_ijg(λ)=b_ijg(p)`. This is `brauerOverlapHomCharacters`; it is proved from actual descent families and their restriction comparisons, without an assumed norm. No comparison between unrelated local coefficient fields is made.

Mackey's formula and Frobenius reciprocity now give ⟨A_λ,A_λ⟩=Σ_(i,j,g)n_i `n_j` b_ijg(λ)=⟨A_p,A_p⟩=1: at p, projection formula and Brauer's identity identify `A_p` with the given absolutely irreducible `ρ`. The degree is `2Σ_i n_i[G:G_i]=2`. In the free lattice on irreducible continuous representations, norm one means exactly one coefficient is `±1`; positive degree selects `+1`. Thus `A_λ` is a genuine absolutely irreducible representation. Finite-index induction preserves semisimplicity in characteristic zero here; the pairing is taken after semisimplification and extension to an algebraically closed coefficient field. Its good traces agree with the given lift, it is independent of Brauer choices, and restriction to any `F′⊆F` with F/F′ soluble gives the member of the descended automorphic form. Put all automorphic families and characters over one finite coefficient field before forming the family; unrelated coefficient fields at different primes do not define a system.

The construction has the following API:

- `brauerOverlapHomCharacters`: the integers `b_ijg(λ)` are independent of `λ` for every double coset, with all good polynomials in E and all overlap restrictions absolutely irreducible as above.
- `brauerSystem`: `ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι})` from the Brauer data and the base-changed `π_i`
- `brauerSystem_isTrue`: The virtual class has dimension 2 and norm-one pairing, hence is the class of a genuine absolutely irreducible member.
- `brauerSystem_trace`: After mapping the common algebraic trace into both coefficient fields, all good Frobenius characteristic polynomials agree with the given p-member; no direct equality between ℓ-adic and p-adic values is asserted.
- `brauerSystem_unique`: Uniqueness memberwise up to representation isomorphism after a common coefficient extension; no canonical basis, lattice or conjugating matrix is asserted.
- `brauerSystem_restrict`: restriction to `G_{F′}` with F/F′ solvable is automorphic

**Checks.**

- `brauer_trivial_F`: `F = ℚ`: `1_G = Ind 1`, and `ρ_ι = ρ_{π,ι}` is the system of `π` itself
- `brauer_quadratic_coefficients`: `G = ℤ/2`: the regular character (2, 0) minus the sign character `(1, −1)` is the trivial character (1, 1), i.e. `1_G = Ind_1^G 1 − ε`
- `brauer_overlap_self`: `i=j` and `g=1` with identical twists gives `b_ii1=1` at every `λ`, by absolute irreducibility.
- `brauer_overlap_distinct`: one good Frobenius polynomial with different E-coefficients forces `b_ijg=0` at every `λ`; the difference cannot disappear under a characteristic-zero field embedding.
- `brauer_overlap_reducible_control`: if an overlap restriction were `1⊕1`, its self-Hom dimension would be four. The zero-or-one argument requires absolute irreducibility; equality of dimensions is not inferred from compatibility alone.
- `brauer_virtual_nonexample`: the virtual character `3·1 − ε` of `ℤ/2` has degree 2 but value 4 at the generator, more than its degree, so it is not a character: degree 2 alone does not make a virtual representation true
- `brauer_trace_agreement`: For the geometric/dual family of a non-CM elliptic curve `E/ℚ` with `F=ℚ`, the construction returns the given automorphic cohomological family (or its KW-normalized dual) memberwise up to isomorphism.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93 of the preprint; [Khare, level one][khare-level-one], §3, proof of Proposition 3.1, pp. 16–17 of arXiv:math/0504080v1 (KW II cite it as the proof of Theorem 5.1 of the Duke version).

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); [Layer 1, Induction of families](#target-system-operations); GL2AutomorphicRepresentationsAndTransfer Layer R17.4; [Layer 5](#layer-r23-4); ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; [Layer 1, The arithmetic representation ring](#target-galois-grothendieck-ring); AutomorphicGaloisRepresentations §7.3; AutomorphicGaloisRepresentations §§4.3–4.4; GL2AutomorphicRepresentationsAndTransfer Layer R17.6; RepresentationTheory/InductionRestriction Layer 6; AutomorphicGaloisRepresentations §7.3; AutomorphicGaloisRepresentations §3.11.

<a id="target-almost-strict-compatibility"></a>
### 12.2 The historical almost-strict comparison

For the Brauer family choose the decomposition field F(q) at a place Q|q and the local WD parameter `r_q` of the form descended there. Away from the coefficient characteristic, Carayol–Taylor local–global compatibility identifies `r_q` with the member's parameter. At `q=l≠2` with unramified `r_q`, the Breuil–Berger input gives crystallinity and the same parameter. At `q=l` with irreducible residual member, Kisin's deformation input, after disjoint field selection, gives the geometric comparison. Together these establish exactly KW almost strictness. The contract does not cover `q=l=2` with reducible residual member, nor a reducible residual member with ramified `r_q`. The strict result below uses a stronger coefficient-prime theorem.

Prove it as `almost_strict_compatibility`.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, p. 93, §10.3.2, p. 94.

*Needs:* [Layer 12, Genuine families from Brauer induction](#target-brauer-induction-system); AutomorphicGaloisRepresentations §§4.5–4.7; [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); AutomorphicGaloisRepresentations §7.3; AutomorphicGaloisRepresentations §§4.3–4.4; [Layer 6](#layer-r23-5); AutomorphicGaloisRepresentations §§4.5–4.9; AutomorphicGaloisRepresentations §4.7; AutomorphicGaloisRepresentations §4.4; AutomorphicGaloisRepresentations §3.11.

<a id="target-strict-brauer-system"></a>
### 12.3 All-place strictness of the Hilbert–Brauer family

For the Brauer family built from holomorphic cuspidal Hilbert forms of motivic weights `k_τ≥2`, Skinner's full coefficient-prime theorem supplies common Hodge–Tate weights and Frobenius-semisimple WD comparison at every finite q, including `q=l, l=2` and residually reducible members. Decomposition-field descent therefore gives KW all-place strict compatibility. Unramified `r_q` then gives crystallinity, using the de Rham criterion that WD inertia is trivial and `N=0`.

Purity of the Hilbert modular families in the geometric convention descends to the same weight w; local strict purity is transported by local–global comparison. Invoke the automorphic purity and Skinner suppliers separately: BLGGT's away-coefficient strictness by itself does not establish the full coefficient-prime comparison.

Prove it as `strict_brauer_system`.

The sources are [KW II][kw-serre-modularity-II], §10.3.2, pp.93–94; [Skinner][skinner-2009], Theorem 1, pp.241–243; proof §2, pp.244–255; [BLGGT v4][blggt-2014-v4], §2.1 Theorem 2.1.1, pp.33–34; §5.1 pp.62–63.

*Needs:* [Layer 12, Genuine families from Brauer induction](#target-brauer-induction-system); AutomorphicGaloisRepresentations §§4.5–4.9; AutomorphicGaloisRepresentations §§4.3–4.4; WeightsInEtaleCohomology Layer R34.6; PadicHodgeTheory §5.3; AutomorphicGaloisRepresentations §4.7; AutomorphicGaloisRepresentations §4.4; AutomorphicGaloisRepresentations §3.11.

<a id="target-kw-theorem-5-1-systems"></a>
### 12.4 Families through the four required lifts

Consume ClassicalSerreModularity `I.3/families-through-prescribed-lifts`, with its common S-type hypotheses and the extra conditions of each case of `I.3/prescribed-lifts`. The comparison `exists_family_through_required_lift` identifies the supplied E-rational odd irreducible family and its selected p-member with the interfaces of §§1.2 and 10.5. Preserve the selected lift, stable lattice, full residual reduction, coefficient embeddings, determinant, good polynomials and Hodge pair. The owner's DP almost-strict predicate implies KW almost strictness by `CompatibleSystem.dpAlmostStrict_implies_kwAlmostStrict`; its all-member de Rham clause is retained. Both rational interfaces use arithmetic Frobenius and positive cyclotomic Hodge labels, so this comparison preserves the representations without dualizing them. The BLGGT normalization uses the separate comparison of §1.1.

The further target here upgrades these supplied families to all-place strictness through §12.3, retaining the chosen p-member. Its local comparison transports the owner's inertial-type, weight and ramification assertions to the interfaces here. In type 3, an irreducible residual q-member has weight `i+2` or `q+1−i` up to twist. In type 4 for odd q, it has weight `q+1−(i−j)` or `i−j` when `i>j+1`, and weight q when `i=j+1`. These computations use Savitt's reductions of tame potentially Barsotti–Tate types (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5, `savitt-residual-types`).

For this local comparison, distinguish the actual lattice reduction at q. When its G_(ℚ_q)-endomorphism ring is the residue field, apply corrected Savitt Corollary 6.15; local absolute irreducibility is one sufficient case. Global irreducibility alone does not imply this condition. For nonscalar local endomorphisms, use Theorems 6.11–6.12 and Remark 6.17 for the semisimplified characters; if the characteristic-zero local representation splits, reduce its two characters directly. These computations are independent of the choice of stable lattice after local semisimplification. Recover extension-sensitive weight restrictions separately: a split extension is peu ramifiée; in a nonsplit cyclotomic-ratio case the lattice is finite flat over the tame extension making the representation Barsotti–Tate. Savitt Lemma 6.13 excludes a très ramifiée extension because that would force q to divide the tame ramification index. Apply the Serre-weight rule to this actual local extension, retaining the equality-of-characters boundary. No classification of all nonscalar-endomorphism lattices is required. In the boundary case `i=1` of Theorem 6.12, the two displayed characters in part (4) coincide and have niveau one; the nonsplit lattice needed for the scalar-endomorphism assertion comes from the added part (5). A test that treats those equal characters as a niveau-two irreducible pair fails.

**Checks.** A split local sum of two distinct characters has a nonscalar diagonal projection, even when the global residual member is irreducible; use the split/semisimplified calculation. A cyclotomic-ratio très ramifiée extension cannot be finite flat over a tame splitting field, so it is excluded from the peu-ramifiée weight branch. At i=1 the repeated niveau-one characters require the corrected lattice calculation, and give no niveau-two irreducibility.

The `q=2` order-three application has its separate KW argument giving residual weight two; Savitt's theorem is not applied there. Diamond's allowed pairs `j=m(q+1)/p^r−1` and `i=q−1−j, 0<m<p^r/2`, exclude `i=j+1` in that selection. The good polynomials retain the owner’s finite coefficient field. The additional full coefficient-prime comparison of §12.3 supplies strictness and purity with the stated geometric normalization.

State this comparison and strictness upgrade as `exists_family_through_required_lift`.

The sources are [KW I][kw-serre-modularity-I], Theorem 5.1, p. 9 of the preprint, Remark after Theorem 5.1, p. 10, Proof of Theorem 9.1, pp. 18–19 of the preprint; [KW II][kw-serre-modularity-II], §10.3.2, p. 94; [Savitt, corrected][savitt-corrected], Theorems 6.11–6.12, pp.35–37, Lemma 6.13, p.38, Corollary 6.15, pp.38–39, Remark 6.17, p.39; [Savitt's corrigendum][savitt-corrigendum], pp. 1–3.

*Needs:* ClassicalSerreModularity `I.3/prescribed-lifts` and `I.3/families-through-prescribed-lifts`; [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); [Layer 10, The four required lift types](#target-required-lift-types); AlgebraicModularFormsAndSerreWeights Layer R15.4; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.5.9–R07.5.10; [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system).

<a id="target-dieulefait-families"></a>
### 12.5 Families through given lifts

Let `ρ:G_ℚ→GL₂(Q̄_p)` be continuous, odd, irreducible and finitely ramified, de Rham at p with Hodge–Tate weights `{0,k−1}, k>1`. Assume `ρ̄|G_(ℚ(ζ_p))` absolutely irreducible for `p>2`, and nonsoluble residual image for `p=2`. The target `dieulefait_families` is an E-rational almost-strict family through `ρ` in DP Definition 1.10: in particular **every member is de Rham at its own coefficient prime**. Do not replace this clause by the weaker KW almost-strict condition. No bound on k or prescribed inertial type is part of this target.

First obtain a totally real Galois `F/ℚ`, split at p and disjoint from the residual-kernel/cyclotomic field, over which `ρ̄` is modular. The following two residual constructions supply the required splitting.

- For `p>2`, Proposition 7.8.1 of Snowden supplies a local weight-two lift of some definite type at p. In the reducible case it uses either a non-torsion extension of 1 by the cyclotomic character, or an ordinary lift after an unramified-character adjustment killing the H² obstruction. In the irreducible case the tame inertia characters are interchanged by Frobenius. Snowden Proposition 7.8.1 multiplies an algebraic inducing character by a finite-order character to construct an induced potentially crystalline weight-two lift of definite type B. Retain its actual inertial type; crystallinity over ℚ_p is not required. Use this compatible type in Theorem 5.1.1 and Proposition 8.2.1 (§4.15), with the residual-kernel/cyclotomic field in the avoidance datum. The output is a modular residual representation over F with p completely split. The original lift need not have that weight-two type. Absolute irreducibility on `F(ζ_p)` survives by disjointness. At `p=5`, the degree condition of (A2) survives because `ℚ(ζ₅)` has degree four and is included in the avoided field.
- For `p=2` use `dyadicSplitResidualPotentialModularity`, consuming `dyadicAuxiliaryModuli` of §4.12a with its polarization hypotheses and Q₂-valued local points (KW II, pp.55–56). An irreducible local restriction already gives complete splitting in the printed theorem. For a reducible restriction, its one-dimensional characters are unramified, since `Z₂×` is pro-2 and the coefficient units have odd order. Put `δ=det ρ̄` and let η be its unique square root in the odd-order character group, so `η²=δ`. The character η is unramified at 2, and `ρ̄₀=ρ̄⊗η⁻¹` has `det ρ̄₀=δ η⁻²=1` without extending the local field. If `k(ρ̄)=2`, the local point has good ordinary reduction: the obstruction to lifting its finite-flat extension class is the cup product of an unramified character with that finite class, hence vanishes. If `k(ρ̄)=4`, choose the completely toric local point, giving a weight-two Steinberg witness. The real points in the same proof handle both identity and nonidentity residual complex conjugation. Applying the all-embedding Moret–Bailly construction to these Q₂-points gives a totally real Galois field split at 2, with avoidance as in KW II 6.1(iii)(d). Twist the resulting modular witness back by the Teichmüller lift of η to recover ρ̄; its unramifiedness at 2 preserves the local alternatives. This is a splitting refinement of the nonsoluble construction, not the assertion that the printed theorem always promises splitting. Tung Lemma 4.3.3 uses exactly this refinement to globalize local representations at 2. Nonsoluble residual image survives because the residual-kernel field was avoided.

Now use GL2ModularityLifting §8.7 (Tung Theorem 4.7) for `p>2` and `GL2ModularityLifting §9.2/totally-real-dyadic-lifting` (Tung Theorem 8.0.3) for `p=2`. Both theorems are over totally real fields in which the coefficient prime splits completely; they assume residual modularity rather than deducing it from Serre's conjecture. The p-adic monodromy theorem makes the local de Rham lifts potentially semistable, and restriction preserves their distinct Hodge–Tate weights. Consequently the **given** `ρ|G_F` is attached, up to a geometric character twist, to a cuspidal Hilbert form. Include the character family when removing that twist. The Hilbert families, soluble descent and Brauer argument of §12.1 then give a family through `ρ`. Hodge–Tate weights descend from restriction and are `{0,k−1}`; de Rham representations are stable under restriction, induction and subquotients, and de Rhamness descends through a finite local extension. These facts supply the all-member de Rham output. The full Hilbert coefficient-prime comparison of §12.3 gives the stronger local comparison for the constructed family.

The two de Rham lifting theorems are proved in GL2ModularityLifting conditionally on its p-adic local Langlands inputs LL1–LL3 and completed-cohomology inputs CC1–CC5. Their local patching proofs use auxiliary globalizations and weight change (Calegari Proposition 3.2, Snowden Proposition 8.2.1 and KW II Theorem 6.1, Paškūnas Proposition 3.29, BLGG13 Theorem A.4.1); input CC5 asserts that these globalizations are the restricted constructions that do not use Serre's conjecture. This target is therefore conditional on those inputs (see Conditional inputs), and a proof of Serre's conjecture that uses it must check CC5. The milestone `dieulefait_families_kwTypes` uses only Layer 5's classical local types, needs none of these inputs, and remains distinct from this full target.

The construction has the following API:

- `dyadicSplitResidualPotentialModularity`: nonsoluble S-type residual data, an avoidance field, the local `k=2/4` alternatives and the polarization hypotheses of `dyadicAuxiliaryModuli` give a modular witness over a totally real Galois field split at 2 and disjoint from the avoidance field.
- `regularDeRhamPotentialModularity`: the displayed input `ρ` gives a Hilbert modular realization of its restriction over such an F; conditional on the de Rham lifting theorems of GL2ModularityLifting (see Conditional inputs).
- `dieulefait_families`: construct the common coefficient field, chosen p-place and family member identified with `ρ`; retain the all-member de Rham clause.
- `dieulefait_families_kwTypes`: the narrower construction from Layer 5, without asserting that every regular de Rham lift has a KW local type.

**Checks.** At `p=5`, inducing `ω₂²` from the unramified quadratic extension gives residual inertia `ω₂²⊕ω₂¹⁰` and determinant `ω²`. A crystalline lift of weights `{0,1}` would instead have determinant inertia `ω`; the potentially crystalline lift retains a finite inertial factor. A weight `k>p+1` remains in the full target; it cannot pass a Fontaine–Laffaille bound by changing the residual witness's weight. At `p=3` the local residual shape `(ω,*;0,1)` is allowed by Tung Theorem 4.7, and must not be discarded as exceptional. At `p=2` a residual self-extension is allowed locally when the global residual image is nonsoluble. For an unramified order-three `δ:G_ℚ₂→𝔽₄×` and `ρ̄=diag(δ,1)`, the square root is `η=δ²`: the inverse twist has determinant one, whereas `det(ρ̄⊗η)=δ²≠1`. A scalar global residual image does not meet the dyadic hypothesis. An abstract KW almost-strict family with a residually reducible exceptional member does not by definition give de Rhamness at that member; the constructed Hilbert–Brauer family does. Using a nonsplit p-adic completion of F fails the hypotheses of both modern lifting suppliers.

The sources are [Dieulefait–Pacetti v2][dieulefait-pacetti], Definition 1.10 and Theorem 1.11 with proof, pp.6–7; [Snowden v1][snowden], Proposition 7.8.1 with proof, pp.24–25, Theorem 5.1.1, p.15, Proposition 8.2.1, p.26; [KW II][kw-serre-modularity-II], Theorem 6.1 and proof, pp.53–57 (local points pp.55–56); [Tung, odd primes][tung-odd], Theorem 4.7 and Remark 4.8, p.15; [Tung, dyadic][tung-dyadic], Lemma 4.3.3, p.21, Theorem 8.0.3 and proof, pp.38–39. Dieulefait's earlier Theorem 1.1, pp.1–2 of [arXiv v1][dieulefait-2004], assumes an odd crystalline prime q, weights {0,w} with w odd and `q≥2w+1`; it supplies only that narrower construction.

*Needs:* [Layer 4, Dyadic paired torsion moduli and local points](#target-dyadic-auxiliary-moduli); [Layer 4, Residual modularity over totally real fields](#target-snowden-totally-real-potential-residual-modularity); [Layer 4, Controlled residual potential modularity](#target-kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-f); [Layer 2, From integral points to split-field density](#target-theorem-g-from-moret-bailly); [Layer 5](#layer-r23-4); GL2ModularityLifting §8.7; GL2ModularityLifting §9.2; GL2ModularityLifting §12.4 (conditional on GL2ModularityLifting's inputs LL1–LL3 and CC1–CC5, in particular CC5); PadicHodgeTheory §5.1 and de Rham descent/stability; [Layer 12, Genuine families from Brauer induction](#target-brauer-induction-system); [Layer 12, The historical almost-strict comparison](#target-almost-strict-compatibility); [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system).

### Examples

A positive virtual dimension alone cannot make a Brauer combination genuine. Pairing one, positive dimension and compatible restriction identify the actual rank-two family.

### Dependencies

This layer uses the Tau Ceti roadmap RepresentationTheory; the roadmaps ClassicalSerreModularity, AlgebraicModularFormsAndSerreWeights, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, FiniteFlatGroupsAndIntegralPadicHodgeTheory, GL2AutomorphicRepresentationsAndTransfer, GL2ModularityLifting, PadicHodgeTheory and WeightsInEtaleCohomology; and Layers 1, 2, 4, 5, 6 and 10 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

<a id="layer-r24-6"></a>
## Layer 13: Residual members and linked systems


Reduce actual coefficient members on stable lattices, retaining the local and image conditions required by a change-of-prime argument. Distinguish a cofinite rank-two assertion from a general-rank density-one assertion.

<a id="target-residual-members"></a>
### 13.1 Residual members and their weights

For an E-rational odd irreducible rank-two almost-strict family over `ℚ`, take stable lattices and semisimplified reductions. Their determinants reduce the characteristic-zero determinants and their complex conjugations remain odd. Absolute irreducibility holds at every embedding above all but finitely many rational primes, using fixed Hodge weights and the uniform conductor bound. If `a≠b`, the restriction to `ℚ(ζ_l)` is also absolutely irreducible for all but finitely many l: outside ramification with `l>2(a−b)+1`, the weight `a−b+1` cannot equal either `(l+1)/2` or `(l+3)/2` forced by the reducible-restriction alternative.

For `q≠l` the residual Artin conductor divides that of `r_q`. Finite inertia of order prime to l reduces injectively, preserving its shape, including the dihedral case of order `2t^a` with `l∤2t`. At an odd l outside ramification, the member is crystalline. If the residual member is S-type and `**1≤a−b≤l−2**`, its normalized Serre weight is `a−b+1` after twisting. Equal weights are excluded: an odd absolutely irreducible unramified Artin residual member has normalized weight l, not one. The general-rank regular-system theorem gives the cyclotomic restriction statement for every constituent on a density-one set, rather than this rank-two cofinite conclusion.

Prove it as `residual_members`.

The sources are [KW I][kw-serre-modularity-I], Proof of Theorem 10.1, p. 20 of the preprint, §8.4, p. 17 of the preprint, Lemma 6.2(ii), p. 11 of the preprint, §1, p. 2 of the preprint; §10.1, p. 20; [Swinnerton-Dyer][swinnerton-dyer-1973], §2, Corollary 1, p. 15; §4, Theorem 4 and its corollary, pp. 31–33, which use the weight-12 congruences (2)–(3) of p. 4; [Dieulefait–Pacetti v2][dieulefait-pacetti], Lemma 1.14, proof, p. 9 of arXiv:2108.07577v2.

*Needs:* [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); ArithmeticGaloisRepresentations Layer 3; ArithmeticGaloisRepresentations Layer 4; PadicHodgeTheory §§6.1–6.2; AlgebraicModularFormsAndSerreWeights Layer R15.4; [Layer 1, Density-one residual irreducibility](#target-residual-irreducibility-density-one); [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system); ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; AlgebraicModularFormsAndSerreWeights R15.4, “fontaine-laffaille-weight-comparison”; AlgebraicModularFormsAndSerreWeights R15.4, “serre-weight-tame-cases”.

<a id="target-local-compatibility-at-the-coefficient-prime"></a>
### 13.2 Local information at the coefficient prime

For an arbitrary KW almost-strict family at its coefficient prime l, use only its residual-irreducible full WD/geometric clause or, for odd l and unramified parameter, its crystalline clause. Otherwise the definition gives no de Rham or WD comparison there. For the motivic Hilbert/Brauer families constructed here, the strict theorem gives potential semistability, common Hodge data and full WD comparison for every l, including `l=2` and reducible residual members; an unramified parameter gives crystallinity. Applications of the Pan residually reducible de Rham alternative assume LC in addition to the applicable LL1–LL3 and CC1–CC5, as in GL2ModularityLifting §12.3 (see Conditional inputs). The KW and strict-family comparisons carry their stated hypotheses.

Prove it as `local_compatibility_at_the_coefficient_prime`.

The sources are [KW I][kw-serre-modularity-I], §5, p. 8 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Paso 5, p. 14 of the arXiv version.

*Needs:* GL2ModularityLifting §12.3 (LC and the applicable LL1–LL3 and CC1–CC5 for the Pan alternative); [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); [Layer 12, The historical almost-strict comparison](#target-almost-strict-compatibility); [Layer 12, All-place strictness of the Hilbert–Brauer family](#target-strict-brauer-system); AutomorphicGaloisRepresentations §§4.5–4.9; PadicHodgeTheory §5.3; AutomorphicGaloisRepresentations §4.7.

<a id="target-linked-systems-modularity-transfer"></a>
### 13.3 Links and modularity transfer

Consume ClassicalSerreModularity `I.3/residual-links-and-modularity-transfer` for the classical rational branch. The comparison `linked_systems_modularity_transfer` identifies its link with an isomorphism of the selected semisimplified residual members here over a common residue field, preserving the places, lattices and coefficient embeddings. Symmetry and invariance under coefficient extension are the supplied link operations. Its classical modularity transfer applies with the exact hypotheses of the owner's I.1 or I.2 lifting theorem on each selected member: in the KW branch retain nonsoluble residual image at 2, normalized residual weight and cyclotomic absolute irreducibility at odd characteristic, and the required local lift type. The systems may have different conductors and weights. Once a member is modular, the supplied Frobenius recognition identifies the whole system with the newform family after a common coefficient extension.

The additional transfer here applies GL2ModularityLifting §§12.1–12.3 to continuous, odd, irreducible, finitely ramified selected members, de Rham with weights `{0,k−1}` and `{0,k′−1}`, `k,k′≥2`. The odd cyclotomically absolutely irreducible alternative assumes LL1–LL3 and CC4–CC5; the dyadic nonsoluble alternative assumes CC1 and CC4–CC5. The Pan residually reducible alternative assumes CC1–CC5 and LC, with `p≥5`, or `p=3` outside its cyclotomic-ratio exclusion (see Conditional inputs). Establish de Rhamness using the family's actual local comparison as in §13.2. These hypotheses are additional to the classical export; the residual isomorphism alone supplies none of them.

**Checks.** A family is linked to itself, and reversing the residual isomorphism reverses the link. Equal residual traces give only a semisimplified link, not a lattice realizing a prescribed full residual representation. A link between different local Hodge types permits transfer only when each member meets its own lifting theorem. A reducible residual member in an abstract KW almost-strict family need not be de Rham at a ramified coefficient prime, so it cannot by itself enter the Pan alternative.

The sources are [KW I][kw-serre-modularity-I], §8.2, p. 15 of the preprint; [Dieulefait–Pacetti v2][dieulefait-pacetti], Remark 4, p. 7 of the arXiv version.

*Needs:* ClassicalSerreModularity `I.3/residual-links-and-modularity-transfer` (with I.1 or I.2 for the classical lifting alternative); GL2ModularityLifting §12.3 (LC and the applicable LL1–LL3 and CC1–CC5 for the Pan alternative); [Layer 1, Rank-two plain, almost-strict and strict families](#target-compatible-system); ArithmeticGaloisRepresentations §§1.7–1.9 and Layer 5; [Layer 11, The full rational-field lifting theorem](#target-kw-theorem-4-1); AutomorphicGaloisRepresentations §7.3; GL2ModularityLifting §12.3; GL2ModularityLifting §12.2; GL2ModularityLifting §12.1.

### Examples

Residual weight comparisons exclude the two exceptional cyclotomic-restriction weights, and linked-family transfer preserves each embedding and local normalization.

### Dependencies

This layer uses the roadmaps ClassicalSerreModularity, AlgebraicModularFormsAndSerreWeights, ArithmeticGaloisRepresentations, AutomorphicGaloisRepresentations, GL2ModularityLifting and PadicHodgeTheory; and Layers 1, 11 and 12 of this roadmap. The *Needs* line of each subsection gives the exact declarations and constructions it consumes.

## Downstream consumers

ClassicalSerreModularity owns the rational finiteness and point extraction in `I.2/full-kw-global-finiteness`, the four lifts in `I.3/prescribed-lifts`, families in `I.3/families-through-prescribed-lifts` and classical transfer in `I.3/residual-links-and-modularity-transfer`; §§8.2, 9.1, 10.5–10.9, 12.4 and 13.3 consume them through the named comparisons. The additional larger-field potential-modularity results, compatible-system operations, all-place strictness upgrades and transfers with additional de Rham hypotheses are owned here. PotentialAutomorphyInfrastructure, WeightZeroCrystallineAutomorphyLifting and ModularityAndLanglandsExtensions consume the field-selection results of Layer 2 and the higher-rank compatible-system interfaces of Layer 1, and EllipticCurveModularityPartIIGL2TypeAbelianVarieties the rank-two families. These are applications, not suppliers to this roadmap.

## References

Page numbers below follow the indicated edition. BLGGT v1 and v4 have different numbering and pagination: the v4 archimedean formulas and CM constituent statement are used where specified. All mathematical statements above are formulations for this roadmap; citations identify their sources and the relevant hypotheses.

- **[Moret–Bailly II][moret-bailly-1989-II]** — Laurent Moret-Bailly. *Groupes de Picard et problèmes de Skolem II*. Ann. Sci. ENS (4) 22 (1989), 181–194; printed journal pages.

- **[Moret–Bailly I][moret-bailly-1989-I]** — Laurent Moret-Bailly. *Groupes de Picard et problèmes de Skolem I*. Ann. Sci. ENS (4) 22 (1989), 161–179; printed journal pages.

- **[Taylor, Fontaine–Mazur][taylor-2002-fontaine-mazur]** — Richard Taylor. *Remarks on a conjecture of Fontaine and Mazur*. Author preprint dated 23 May 2000 of the JIMJ 2002 paper; its printed page numbers, one behind the PDF page index.

- **[KW II][kw-serre-modularity-II]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *Serre's modularity conjecture (II)*. Author proofs.pdf preprint, 98 pages, of Invent. Math. 178 (2009), 505–586; preprint page numbers.

- **[KW Annals][kw-annals-2009]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)*. Annals 169 (2009), 229–253; printed journal pages.

- **[Taylor, degree-two L-functions][taylor-2006-meromorphic-continuation]** — Richard Taylor. *On the meromorphic continuation of degree two L-functions*. Documenta Math., Coates volume (2006), 729–779; printed journal pages (PDF page `+728`).

- **[Qian][qian]** — Lie Qian. *Potential automorphy for `GL_n*`. arXiv:2104.09761v1 (19 April 2021), published in Invent. Math. 231 (2023); arXiv v1 printed pagination.

- **[CHT][cht]** — Laurent Clozel, Michael Harris, Richard Taylor. *Automorphy for some l-adic lifts of automorphic mod l Galois representations*. Publ. Math. IHES 108 (2008), 1–181; printed journal pages.

- **[BLGHT][blght]** — Thomas Barnet-Lamb, David Geraghty, Michael Harris, Richard Taylor. *A family of Calabi–Yau varieties and potential automorphy II*. Final author copy (2010) of Publ. RIMS 47 (2011); author pagination.

- **[BHKT v2][bhkt]** — Gebhard Böckle, Michael Harris, Chandrashekhar Khare, Jack Thorne. *G-hat-local systems on smooth projective curves are potentially automorphic*. arXiv:1609.03491v2; author pagination.

- **[Bianchi potential automorphy][bianchi]** — George Boxer, Frank Calegari, Toby Gee, James Newton, Jack Thorne. *The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*. arXiv:2309.15880v3, final author version; author pagination.

- **[Boxer–Calegari–Gee–Pilloni][bcgp-published]** — George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. *Abelian surfaces over totally real fields are potentially modular*. Publ. Math. IHES 134 (2021), 153–501; printed journal pages.

- **[Snowden v1][snowden]** — Andrew Snowden. *On two dimensional weight two odd representations of totally real fields*. arXiv:0905.4266v1 (2009); author pagination.

- **[Calegari][calegari]** — Frank Calegari. *Even Galois representations and the Fontaine–Mazur conjecture II*. arXiv:1012.4819, author preprint of JAMS 25 (2012); author pagination.

- **[Thorne][thorne]** — Jack Thorne. *On the automorphy of l-adic Galois representations with small residual image*. Author copy of JIMJ 11 (2012); author pagination.

- **[Larsen–Pink][larsen-pink]** — Michael Larsen and Richard Pink. *On l-independence of algebraic monodromy groups in compatible systems of representations*. Author manuscript of Invent. Math. 107 (1992), 603–636; manuscript pagination, §6 pp.14–15 and §8 pp.17–18.

- **[Bruhat–Tits II][bruhat-tits-II]** — François Bruhat and Jacques Tits. *Groupes réductifs sur un corps local. II. Schémas en groupes. Existence d’une donnée radicielle valuée*. Publ. Math. IHÉS 60 (1984), 5–184; printed journal pagination.

- **[Tung, odd primes][tung-odd]** — Shen-Ning Tung. *On the automorphy of 2-dimensional potentially semi-stable deformation rings of `G_(Q_p)*`. arXiv:1803.07451v4; printed author pagination.

- **[Tung, dyadic][tung-dyadic]** — Shen-Ning Tung. *On the modularity of 2-adic potentially semi-stable deformation rings*. arXiv:1908.06174v3; printed author pagination.

- **[Altman–Kleiman][altman-kleiman-1976]** — Allen B. Altman and Steven L. Kleiman. *Compactifying the Jacobian*. Bull. Amer. Math. Soc. 82 (1976), 947–949; Theorems 2–4 and their construction on p. 948.

- **[Rogawski–Tunnell][rogawski-tunnell]** — Jonathan D. Rogawski and Jerrold B. Tunnell. *On Artin L-functions associated to Hilbert modular forms of weight one*. Invent. Math. 74 (1983), 1–42; printed journal pages.

- **[Darmon–Diamond–Taylor][ddt]** — Henri Darmon, Fred Diamond and Richard Taylor. *Fermat’s Last Theorem*. Current Developments in Mathematics 1995; the freely available author text, numbered pages 1–154.

- **[Skinner–Wiles, base change][sw-base-change]** — Christopher Skinner and Andrew Wiles. *Base change and a problem of Serre*. Duke Math. J. 107 (2001), 15–25; printed journal pages.

- **[Gee–Geraghty][gee-geraghty]** — Toby Gee and David Geraghty. *Companion forms for unitary and symplectic groups*. Final author preprint of Duke Math. J. 161 (2012); author page numbers.

- **[Geraghty, ordinary][geraghty-ordinary]** — David Geraghty. *Modularity lifting theorems for ordinary Galois representations*. Author preprint of 12 March 2010 of Math. Ann. 373 (2019); the preprint numbering, which BLGGT and Thorne cite.

- **[Thorne, adequacy][thorne-2017]** — Jack Thorne. *A 2-adic automorphy lifting theorem for unitary groups over CM fields*. Accepted manuscript (16 March 2016) of Math. Z. 285 (2017); manuscript pages.

- **[Poonen, rational points][poonen-qpoints]** — Bjorn Poonen. *Rational points on varieties*. Graduate Studies in Mathematics 186, AMS (2017); the author's online version, printed page numbers.

- **[Calegari–Geraghty][cg]** — Frank Calegari, David Geraghty. *Modularity lifting beyond the Taylor–Wiles method*. Published Invent. Math. 211 (2018) PDF; locators using its PDF page numbers are marked explicitly.

- **[Newton–Thorne][newton-thorne]** — James Newton, Jack Thorne. *Symmetric power functoriality for Hilbert modular forms*. arXiv:2212.03595v2; author pagination.

- **[BHKT][bhkt-published]** — Gebhard Böckle, Michael Harris, Chandrashekhar Khare, Jack Thorne. *Ĝ-local systems on smooth projective curves are potentially automorphic*. Acta Math. 223 (2019), 1–111; printed journal pages.

- **[Beuzart-Plessis–Harris–Thorne][bhkt-correction]** — Raphaël Beuzart-Plessis, Michael Harris, Jack Thorne. *Inductive construction of supercuspidal L-packets*. arXiv:2502.20611v1 (2025), p.28 correction to BHKT Lemma 9.1.

- **[KW I][kw-serre-modularity-I]** — Chandrashekhar Khare and Jean-Pierre Wintenberger. *Serre's modularity conjecture (I)*. Author results.pdf preprint of Invent. Math. 178 (2009), 485–504; preprint page numbers.

- **[Böckle][bockle-appendix-2003]** — Gebhard Böckle. *Appendix 1: On the isomorphism R_∅ → T_∅*. Author appendix to Khare, Invent. Math. 154 (2003); own pages 1–6.

- **[Dieulefait–Pacetti v2][dieulefait-pacetti]** — Luis Victor Dieulefait and Ariel Martín Pacetti. *A simplified proof of Serre's conjecture*. arXiv:2108.07577v2 (2022); arXiv page numbers.

- **[BLGGT v1][blggt-2014]** — Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. *Potential automorphy and change of weight*. arXiv:1010.2561v1 (2010), 68 pages; v1 pagination and numbering.

- **[BLGGT v4][blggt-2014-v4]** — Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. *Potential automorphy and change of weight*. arXiv:1010.2561v4 (2013), 93 pages; v4 pagination and numbering.

- **[Skinner][skinner-2009]** — Christopher Skinner. *A note on the p-adic Galois representations attached to Hilbert modular forms*. Documenta Math. 14 (2009), 241–258; printed journal pages.

- **[ACC+][acc-2023]** — Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne. *Potential automorphy over CM fields*. Annals 197 (2023), 897–1113; published journal-layout copy and printed pages.

- **[Khare, level one][khare-level-one]** — Chandrashekhar Khare. *Serre’s modularity conjecture: the level one case*. arXiv:math/0504080v1 (2005); §3 Proposition 3.1 is the Brauer argument cited as Theorem 5.1 in the Duke 2006 version.

- **[Dieulefait, families][dieulefait-2004]** — Luis V. Dieulefait. *Existence of families of Galois representations and new cases of the Fontaine-Mazur conjecture*. arXiv:math/0304433v1 (2003), of the J. reine angew. Math. 577 (2004) paper; preprint pages.

- **[Conrad–Diamond–Taylor][cdt]** — Brian Conrad, Fred Diamond and Richard Taylor. *Modularity of certain potentially Barsotti–Tate Galois representations*. J. Amer. Math. Soc. 12 (1999), 521–567; author manuscript, PDF page numbers.

- **[Savitt, corrected][savitt-corrected]** — David Savitt. *On a conjecture of Conrad, Diamond, and Taylor*. Duke Math. J. 128 (2005), 141–197; the author's corrected version, author pagination.

- **[Savitt's corrigendum][savitt-corrigendum]** — David Savitt. Erratum to *On a conjecture of Conrad, Diamond, and Taylor*; author's three-page corrigendum.

- **[Barnet-Lamb–Gee–Geraghty][rank-two-adequacy]** — Thomas Barnet-Lamb, Toby Gee and David Geraghty. *Serre weights for rank two unitary groups*. Math. Ann. 356 (2013); author preprint pagination (Appendix A, Proposition A.2.1).

- **[Sen 1973][sen-1973]** — Shankar Sen. *Lie algebras of Galois groups arising from Hodge–Tate modules*. Ann. of Math. 97 (1973), 160–170.

- **[Larsen 1995][larsen-1995]** — Michael Larsen. *Maximality of Galois actions for compatible systems*. Duke Math. J. 80 (1995), 601–630.

- **Bogomolov 1980** — Fedor Bogomolov. *Sur l'algébricité des représentations l-adiques*. C. R. Acad. Sci. Paris Sér. A–B 290 (1980), A701–A703.

- **[Swinnerton-Dyer][swinnerton-dyer-1973]** — H. P. F. Swinnerton-Dyer. *On ℓ-adic representations and congruences for coefficients of modular forms*. Modular functions of one variable III, LNM 350 (1973), 1–55; printed chapter pages.

[moret-bailly-1989-II]: https://www.numdam.org/item/10.24033/asens.1582.pdf
[moret-bailly-1989-I]: https://www.numdam.org/item/10.24033/asens.1581.pdf
[taylor-2002-fontaine-mazur]: https://virtualmath1.stanford.edu/~rltaylor/fm.pdf
[kw-serre-modularity-II]: https://www.math.ucla.edu/~shekhar/papers/proofs.pdf
[kw-annals-2009]: https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf
[taylor-2006-meromorphic-continuation]: https://ems.press/content/book-chapter-files/27484
[qian]: https://arxiv.org/pdf/2104.09761v1
[cht]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf
[blght]: https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf
[bhkt]: https://arxiv.org/pdf/1609.03491v2
[bianchi]: https://arxiv.org/pdf/2309.15880v3
[bcgp-published]: https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf
[snowden]: https://arxiv.org/pdf/0905.4266v1
[calegari]: https://arxiv.org/pdf/1012.4819
[thorne]: https://www.dpmms.cam.ac.uk/~jat58/bigness.pdf
[cg]: https://math.uchicago.edu/~fcale/papers/CG.pdf
[newton-thorne]: https://arxiv.org/pdf/2212.03595v2
[bhkt-published]: https://intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf
[bhkt-correction]: https://arxiv.org/pdf/2502.20611v1
[kw-serre-modularity-I]: https://www.math.ucla.edu/~shekhar/papers/results.pdf
[bockle-appendix-2003]: https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf
[dieulefait-pacetti]: https://arxiv.org/pdf/2108.07577v2
[blggt-2014]: https://arxiv.org/pdf/1010.2561v1
[blggt-2014-v4]: https://arxiv.org/pdf/1010.2561v4
[skinner-2009]: https://ems.press/content/serial-article-files/26055?nt=1
[acc-2023]: https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf
[khare-level-one]: https://arxiv.org/pdf/math/0504080v1
[dieulefait-2004]: https://arxiv.org/pdf/math/0304433v1
[swinnerton-dyer-1973]: http://gaetan.chenevier.perso.math.cnrs.fr/GT/swinnerton_dyer.pdf

[sw-base-change]: https://citeseerx.ist.psu.edu/document?doi=78be3e19b2caf9a472352165d0685620cf710b2f&repid=rep1&type=pdf
[gee-geraghty]: https://www.ma.imperial.ac.uk/~tsg/Index_files/cfug.pdf
[geraghty-ordinary]: https://web.archive.org/web/20200311145253id_/https://www2.bc.edu/david-geraghty/files/oml.pdf
[thorne-2017]: https://www.repository.cam.ac.uk/handle/1810/254922
[poonen-qpoints]: https://math.mit.edu/~poonen/papers/Qpoints.pdf

[cdt]: https://math.stanford.edu/~conrad/papers/cdtmaster.pdf
[savitt-corrected]: https://math.jhu.edu/~savitt/papers/pdfs/cdt_corrected.pdf
[savitt-corrigendum]: https://math.jhu.edu/~savitt/papers/pdfs/cdt_erratum.pdf
[rank-two-adequacy]: https://www.ma.imperial.ac.uk/~tsg/Index_files/U2.pdf

[taylor-artin-II]: https://virtualmath1.stanford.edu/~rltaylor/artin2.pdf

[altman-kleiman-1976]: https://www.ams.org/journals/bull/1976-82-06/S0002-9904-1976-14229-2/

[ddt]: https://wstein.org/edu/2011/581g/misc/Darmon-Diamond-Taylor-Fermats_Last_Theorem.pdf

[tung-odd]: https://arxiv.org/pdf/1803.07451v4
[tung-dyadic]: https://arxiv.org/pdf/1908.06174v3

[larsen-pink]: https://people.math.ethz.ch/~pinkri/ftp/LP2.pdf
[bruhat-tits-II]: https://www.numdam.org/item/PMIHES_1984__60__5_0/

[li-long-tu]: https://sigma-journal.com/2018/090/sigma18-090.pdf

[rogawski-tunnell]: https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0074/LOG_0007.pdf

[sen-1973]: https://doi.org/10.2307/1970879
[larsen-1995]: https://doi.org/10.1215/s0012-7094-95-08021-1
