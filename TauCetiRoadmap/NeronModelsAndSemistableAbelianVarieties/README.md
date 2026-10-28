# Roadmap: Néron models and semistable abelian varieties

**Summary.** This roadmap builds the scheme-theoretic reduction theory of abelian varieties over arithmetic
bases: finite-type Néron models over arbitrary discrete valuation rings and over Dedekind schemes
such as rings of integers and of `S`-integers, with the Néron mapping property as the defining
universal property; their special fibres, identity components and finite étale component groups;
semistable reduction, Grothendieck's monodromy criterion and the semistable reduction theorem
after a finite extension; the Raynaud extension and the polarised uniformisation of a
degenerating abelian variety; the degree-zero Picard scheme of a regular semistable curve, the
identification of its toric characters with the integral first homology of the dual graph, the
integral monodromy pairing, the component group as its cokernel and Grothendieck's pairing on
component groups; and the Galois-theoretic consequences — Néron–Ogg–Shafarevich, isogeny
invariance of good reduction, potential good reduction, finite-étale torsion specialization and the
Frobenius/Euler comparison at good places, the `p`-adic comparison at the residue prime,
the elliptic conductor with Ogg's and Saito's formulas and residual bounds, the conductor of a
semistable abelian variety, the local Euler polynomial at bad places — together with the exact
interfaces that level lowering, the Faltings height, the isogeny theorem and the modularity of
abelian surfaces consume. The end theorems are the local existence theorem of Néron models,
Grothendieck's criterion `A semistable ⇔ inertia unipotent on T_ℓ(A)`, Néron–Ogg–Shafarevich,
the identification `Φ_A ≅ coker(X_{A^∨} → Hom(X_A, ℤ))` of the component group with the
cokernel of the monodromy pairing, the equation-level–scheme-level comparison of every
reduction invariant of an elliptic curve, and the independence and closed-point
specialization of the arithmetic Tate systems of abelian varieties.

The objects are schemes and group schemes over the base, carried with their generic-fibre
markings; the mapping property quantifies over all smooth test schemes, and the finite-type
convention is enforced. Equation-level reduction theory of elliptic curves, semistable reduction
of curves, Jacobians of smooth curves, Néron models of tori, Tate modules and conductors of
Galois representations, and the general theory of formal schemes, Picard functors and group
spaces are consumed from the roadmaps named below, not rebuilt.

## Scope and ownership

The roadmap owns:

- the Néron mapping property as a predicate on `Over S` relative to a base morphism `j : η → S`,
  marked finite-type Néron models, weak Néron models, extension of morphisms and uniqueness;
- the group law on a Néron model and the extension of homomorphisms; smoothening over an
  excellent discrete valuation ring and local existence over every discrete valuation ring;
  spreading out and the Dedekind local-to-global construction; the comparison with abelian-scheme models; étale base change; the
  invariant-differential lattice of a Néron model and its Hodge line;
- the identity component and the finite étale component group of the special fibre, with the
  distinction between rational and geometric components; the Chevalley decomposition of the
  identity fibre; the toric character lattice of a Néron special fibre and its functoriality;
  functoriality under isogeny with the correct (non-exact) statements;
- for elliptic curves: the identification of the equation-level filtration `E₁ ⊂ E₀ ⊂ E` with
  the Néron model, the smooth locus of the minimal regular model as the Néron model, the
  Kodaira fibre configurations and geometric component groups by type;
- the semistable reduction predicate and its invariance under isogeny and identity-model base
  change; the toric–finite filtration of the Tate module, Weil orthogonality, unipotence of
  inertia, Grothendieck's monodromy criterion, semistable reduction after a finite separable
  extension, and the full-level criterion; the Raynaud extension and the polarised rigid
  uniformisation with its lattice and valuation pairing;
- the degree-zero Picard scheme of a regular semistable curve over a discrete valuation ring,
  the normalisation sequence, the dual-multigraph adapters for the supplied integral cycle
  lattice and its identification with the toric characters, the Picard–Néron identity comparison,
  the integral monodromy pairing of a semistable abelian variety and its graph formula for
  Jacobians, the
  component group as a cokernel, Grothendieck's pairing on component groups, the
  intersection-matrix description, the one-node hyperelliptic curves of Bhargava–Gross–Wang
  with their generalised Jacobians, two-torsion and odd-factor torsors, and the semi-abelian
  Picard scheme of a stable family;
- Néron–Ogg–Shafarevich, isogeny invariance of good reduction, the crystalline and semistable
  comparison for the `p`-adic Tate module, finite-étale specialization, good-reduction
  Frobenius and Euler polynomials, potential good reduction, the elliptic conductor and its values and bounds, the special-fibre and
  étale Euler-characteristic comparisons, determinant of cohomology, Ogg's and Saito's
  conductor–discriminant formulas, the comparison with Mathlib's local polynomial,
  the conductor interface and semistable formula, and residual conductor comparisons;
- the interfaces of Layer 6: Serre's independence and Noot's closed-point specialization,
  degeneracy-map functoriality, character exact sequences with
  verified kernels, semistable and isogeny behaviour of the differential lattice, connected-model
  Kummer and localization sequences, isogeny component defects and exact cotangents of semistable
  quotients under the strict ramification bound, the
  equation-level–scheme-level comparisons for elliptic curves, the compatible system of
  cohomology of an abelian variety, the semistable-ordinary adapters for abelian surfaces over
  `ℚ₂`, and the full-level extension for curves.

It leaves to other roadmaps, and consumes from them:

- **EllipticCurves** (Tau Ceti), Layers 1–5: the minimal Weierstrass model, Mathlib's
  reduction predicates, the reduction map, `E₀(K)`, `E₁(K)` and its identification with the
  formal group, the full Tate algorithm with its `ReductionSymbol`, the algorithmic exponent
  `v(Δ) − m + 1`, the local index `c_p = [E(K) : E₀(K)]`, the Tate curve and its point
  uniformisation, the invariant differential at the level of the function field, the minimal
  discriminant, the Tate module of an elliptic curve with its Galois action and Weil pairing,
  the three equation-level Néron–Ogg–Shafarevich statements, and the point count over finite
  fields. That roadmap excludes Néron models by design; this roadmap owns the comparisons.
- **StableReduction** (Tau Ceti), Layers 0–7: models over a discrete valuation ring with
  their generic-fibre markings (`TauCeti.Model`), nodes, normalisation and the dual graph with
  its Betti number, stable curves, blow-ups and intersection theory on arithmetic surfaces,
  regular and minimal models with their components and multiplicities, numerical types and the
  numerical Picard group `TauCeti.NumericalType.Pic` with its degree map and torsion, semistable
  reduction of curves and the curve–Jacobian criterion. Layer 5 supplies the minimal regular
  model; `KodairaConfiguration` in 2.8 here identifies its fibre with the configuration
  attached to EllipticCurves' `ReductionSymbol`. This roadmap also owns the smooth-locus
  and component-group comparisons.
- **FreeGroupsAndLimitGroups**, §2.2a
  ([finite cycle spaces and independent cycles](../FreeGroupsAndLimitGroups/README.md#22a-finite-cycle-spaces-and-independent-cycles)):
  signed integral incidence and its kernel, binary cycles, spanning forests and their count,
  integral and binary chord bases, coefficient reduction and both rank formulas, for all finite
  multigraphs. Section 4.2 here identifies these carriers on the dual graph of a semistable curve
  and compares its integral cycles with toric characters.
- **JacobianChallenge** (Tau Ceti), Layers D–F: the Picard functor, Jacobian and Abel–Jacobi map
  of a smooth proper curve over a field.
- **AlgebraicCurves** (Tau Ceti), Layer 10: hyperelliptic models.
- **ReductiveGroups** (Tau Ceti), Layers 4 and 7: character lattices of tori, exactness of the
  character functor, and the Galois action on characters.
- **ReductiveGroupsPartII** (Tau Ceti), RG2.0a, RG2.3.1 and RG2.3.2: norm-one tori and Weil
  restriction; quotients of group schemes over a base of dimension at most one; locally
  finite-type Néron models of tori, their finite-type and connected open subgroups; RG2.3.7 supplies Lang's theorem for connected smooth
  groups over finite fields and the vanishing of `H¹(k,H)`. The torus models have the
  affine mapping property `lftMappingProperty`. Those models satisfy the mapping property of
  1.1 and inhabit `NeronModel` exactly when they are quasi-compact. Positive-rank split tori
  have non-quasi-compact models; some nonsplit torus models are finite type. Construction and
  ownership of all torus models remain in ReductiveGroupsPartII; RG2.3.2 supplies the
  comparison of the full and affine mapping properties.
- **ModularCurves** (Tau Ceti), Layer 1: the scheme-theoretic elliptic curve attached to a
  Weierstrass equation with unit discriminant over a base.
- **ProfiniteCohomology** (Tau Ceti), Layer 8: the `(1,1)` cup product in continuous
  Galois cohomology, with its coefficient pairing and connecting-map identities.
- **SchemeAndStackFoundations**, §§0.12–0.14 (henselisation and henselian finite algebras),
  §§0.16, 0.20–0.21 (catenary, Nagata and excellent rings), §§1.13–1.17 (group spaces,
  torsors and quotients), §§2.1–2.4, 2.10, 2.15 (fppf cohomology and
  comparison with field Galois cohomology), §2.22 (scheme Brauer groups), §3.6 (Picard torsors and rational
  divisor classes), §3.8 (invariant differentials), §§4.7–4.10 (adic thickening systems,
  coherent formal existence and algebraisation of compatible morphisms), §§4.11–4.13
  (modifications and one-dimensional resolution), and §4.15 (moduli of stable curves). Zariski's main
  theorem is Mathlib's `Scheme.Hom.exists_isIso_morphismRestrict_toNormalization`.
- **AlgebraicModuliForArithmeticGeometry**, §6.1 (`artinApproximationClassical`),
  §7.3 (Picard-stack and representability inputs), §7.6.1 (relative Picard sheaf and base change),
  §7.9 (`spaceSectionComponentCriterion`, general group-space identity components).
- **ComplexComparisonPartII**, §C3.2d.2 (`relative_picard_algebraicSpace`),
  §C3.2f.1 (`picardZeroSheaf`) and §C3.2f.2 (`picardZeroCriterion`).
- **RigidAnalyticGeometry**, §§6.1–6.2 (`RigidSpace K` and its G-site),
  §8.1 (rigid analytification), §§8.2–8.3 (classical points and rigid–adic comparison),
  and **AdicSpacesPartIII**, F0 and R2.3 (formal schemes, completion and generic fibres).
  The quotient by the period lattice belongs to 3.14 here; polarised algebraisation
  uses AbelianSchemesAndArithmeticModuli A4.8. Finite analytic isogeny quotients do not
  supply a quotient by an infinite lattice.
- **AbelianSchemesAndArithmeticModuli** A0.1–A1 (abelian schemes over a base, rigidity, homomorphisms,
  products), A2 (the dual abelian scheme and the Poincaré biextension) and A3 (finite flat
  torsion, isogenies and the Weil pairing), together with A4.1,
  A4.5, A4.3 and A4.2 (integral Tate modules, the minimal
  Barsotti–Tate tower, degree-one de Rham cohomology and its vector-extension comparison),
  A4.4 (`exteriorCohomology`), A4.8 (`polarizedEffectivity` of compatible polarised
  abelian-scheme thickenings), A6.5 (`poincareReducibility`), A6.10–A6.12
  (endomorphism polynomials), A6.14–A6.15 (Rosati positivity and its real operator adapter),
  and A1.8 (Weil extension for abelian schemes).
- **SmoothRepresentationsOfLocalGroups**, SR.5.2, `classical-llc-normalization`,
  `wd-parameter-operations` and `wd-frobenius-semisimplification`: the canonical
  Weil–Deligne parameter fields, coefficient descent and extension, parameter operations
  and Frobenius semisimplification.
- **ArithmeticGaloisRepresentations**, §§2.1–2.1a (local-field inertia and its trait comparison),
  §§2.3–2.5 (tame characters, arithmetic Weil–Deligne adapters and local factors),
  §§3.1–3.7 (Artin, Swan, global and residual conductor theory), §§6.1–6.2 (continuous
  Tate-module representations, elliptic comparison, isogeny maps and Weil pairing),
  §6.3 **The Tate curve** and **Local Euler factors** (uniformisation representation and
  generic Euler definition), §7.6 (Zariski closures), §6.4a **Finite Frattini quotient of a compact matrix group**
  and §6.6 **Serre's wild bound**. Good-reduction Frobenius, elliptic conductor and
  local-polynomial comparisons are the targets of §§5.0a–5.3i here.
- **EtaleCohomologyFoundations**, §§F.0–F.1, F.3–F.4: finite-coefficient cohomology,
  universal-homeomorphism invariance, finiteness and adic realizations; §F.3a:
  the general henselian-trait Galois and residue interface, valuation-inertia identification,
  and tame character with Kummer formula, surjectivity, conjugation and finite-extension
  normalisation. Its arbitrary-trait contract includes infinite and imperfect residue fields
  and residue characteristic zero. Section F.3a also supplies
  `VanishingCycles.tameCharacter_eq_inertiaTameCharacter` for valuation rings of
  nonarchimedean local fields; ArithmeticGaloisRepresentations §2.1a transports this
  comparison to global decomposition groups. Sections G.1–G.3 supply scheme compactifications,
  Nagata existence and common refinements (`Compactification`, `nagataCompactification`,
  `compactificationCommonRefinement`) for separated finite-type morphisms over qcqs bases.
- **PadicPeriodRings**, §§1–2 and 4.1–4.3: completed algebraic closure with Galois action,
  Tate fixed points/twists, topological `B_cris`, `B_dR`, `B_st`, their invariant functors,
  canonical comparison maps, regularity and crystalline/semistable/de Rham predicates.
- **NoncommutativeAndEquivariantIwasawa**, §F.6, generic period-realization prefix:
  the potentially semistable period functor and Weil–Deligne realization on actual
  `B_st` invariants, for all finite `K/ℚ_p`, finite coefficient fields and every prime.
  It supplies nilpotent `N_p`, admissible tensor/dual comparisons, filtered de Rham
  Galois descent, change of semistable extension, coefficient extension and descent.
  Section 5.3 here transports its output by `N_K = e_K N_p` and compares it with the
  filtered-module realization and the geometric Raynaud and abelian realizations.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, §§R07.P2–R07.P5a and R07.3.0:
  finite-`K` crystalline/de Rham structures and `finiteKPeriodComparison` with those
  foundational carriers, maps and predicates; §R07.4.27:
  `FilteredPhiNModuleDD` and `FilteredPhiNModuleDD.weilDeligne`, the arithmetic-normalized
  filtered-module construction with semilinear descent. Sections R07.P7.1–R07.P7.5 supply
  finite-coefficient period functors, labelled Sen operators and Hodge–Tate lifts.
  Section 5.3 here owns `PadicWeilDeligneRealization`, the normalization transport of
  NoncommutativeAndEquivariantIwasawa §F.6's generic realization and its identification
  with this filtered-module construction, including at `p = 2`, and the geometric
  Raynaud realization and abelian-variety period comparison.
- **InverseGaloisAndArithmeticFundamentalGroups**, §§IG.2.4, IG.2.6, IG.2.8: Hilbertian fields,
  their finite-extension and finitely-generated permanence, full-group specialization of finite
  covers and its Frattini application for 6.0.
- **NumberFieldArithmetic**, Layer 5, and **LocalFieldsRamification**, Layer 2:
  finite places, completions and arithmetic Frobenius for 5.0b.
  LocalFieldsRamification Layers 3–4 supply the finite and absolute ramification filtrations,
  lower and upper numbering, Herbrand functions and Hasse–Arf over nonarchimedean local fields
  (finite residue field). Over arbitrary perfect residue fields, including infinite ones such as
  `F̄_p((t))`, the conductor comparisons in 5.3a–5.7 consume the filtration, breaks and Swan and
  Artin conductors through ArithmeticGaloisRepresentations Layer 3 (§§3.1–3.2), which carries
  that generality.
- **AlgebraicVectorBundles**, L0C (finite-projective determinants), and
  **SchemeAndStackFoundations**, §2.6 (proper coherent cohomology), supply the
  determinant-of-cohomology construction in 5.3d; **StableReduction** Layer 2
  supplies the relative dualizing line.
- **CrystallineCohomology**, CR.2.1 (crystalline cohomology), CR.2.3 (proper smooth formal
  comparison over a PD base), CR.3.4 (semilinear Frobenius and its linearization): the
  crystalline realization of the good abelian quotient, including `p = 2`.
- **NeronModelsAndSemistableAbelianVarieties Part II**: Ferrand pinching and conductor squares,
  genus-one fibres and their forms, multiple fibres over excellent discrete valuation rings,
  global Weierstrass models and Jacobians of genus-one curves, Picard constancy and fibre
  configurations, and the explicit models over `𝔽₂`. Part II consumes Layers 2 and 4 of this
  roadmap.
- **JacobianChallenge Part II**: the comparison of the Hodge line `det e^*Ω¹` of the Picard
  scheme of a stable family with `det π_*ω`; it consumes 4.13.
- **RelativeJacobiansAndIntegralCurveModels**, §§3.2–3.5: Raynaud's representability of
  `Pic⁰` for normal models with multiplicity gcd one, the Néron comparison of the quotient
  `P/E` for regular models over an arbitrary Dedekind base with perfect residue field or an
  étale quasi-section, and the gluing of the Picard-computed global Néron model. This roadmap keeps the strictly henselian, algebraically closed residue-field case of
  3.9 and 4.7, which that roadmap consumes.
- **ModularCurvesPartII**, **SerreWeightAndLevelOptimisation**, **ArakelovGeometryAndAbelianHeights**,
  **FaltingsFinitenessAndIsogenyTheorems**, **SmallRamificationAndAbelianVarietyBaseCases**,
  **HeegnerPointEulerSystems**, **GrossZagierAndArithmeticHeights**,
  **ComplexMultiplicationAndExplicitReciprocity**: consumers (see Downstream consumers).

Already in Tau Ceti, used and not restated: abelian varieties over a field with their
homomorphisms, isogenies, rigidity, products and tangent spaces
(`TauCeti.AlgebraicGeometry.AbelianVariety`, `AbelianVariety.baseChange`, `AbelianVariety.IsIsogeny`,
`isMonHom_of_one_hom`); group objects of `Over S` and their closed subgroups, kernels and
isogenies over `Spec R` (`TauCeti.ClosedSubgroupScheme`, `TauCeti.GroupScheme.kernelBaseChangeIso`, the isogeny class
of `GroupScheme/CentralIsogeny`); generic and special fibres over a discrete valuation ring and
extensionality along the generic fibre (`TauCeti.genericFiber`, `specialFiber`,
`ext_of_genericFiberι_eq`); models with generic-fibre markings, their uniqueness when separated,
and their base change along finite extensions of discrete valuation rings (`TauCeti.Model`,
`Model.subsingleton_iso`, `Model.baseChange`, `FiniteDVRExtension`); identity components and
finite étale component groups of affine finite-type groups over an algebraically closed field
(`TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec`, `componentGroupScheme`,
`componentGroupFppfGroupObjectIso`); character lattices of tori with Galois action, maximal tori
and unipotent radicals of affine groups (`TauCeti.CommHopfAlgCat.geometricCharacterGroup`,
`TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor`, `IsMaximalTorus`, `unipotentRadical`,
`DiagonalizableGroup.isShortExact_mapDomainBialgHom_iff`); the rigidified Picard functor and the
degree-zero Picard group of an integral curve (`TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor`,
`LineBundleClass.picZero`); numerical types and their Picard groups (`TauCeti.NumericalType`,
`NumericalType.Pic`, `NumericalType.degree`, `NumericalType.torsion`, `topologicalGenus`); families
of curves (`TauCeti.AlgebraicGeometry.FamilyOfCurves`); and the elliptic suppliers
`WeierstrassCurve.IsSemistable` (no additive reduction at any place of a Dedekind base),
`localMinimalDiscriminantValuation`, `minimalDiscriminantIdeal`, `projModel` with its smoothness
for unit discriminant, `kerReduction` and `formalPointAddEquivKerReduction`, `tateCurve`,
`tateModuleGaloisRepresentation`, `tateModuleWeilPairing`, `nodePolynomial`,
`exists_quadraticTwist_hasSplitMultiplicativeReduction` and `localPolynomial_eq_of_hasGoodReduction`.
From Mathlib: the morphism classes `Smooth`, `Etale`, `IsSeparated`, `QuasiCompact`,
`LocallyOfFiniteType`, `IsProper`, `Flat`, `GeometricallyIntegral`; `Over.pullback` and the
cartesian monoidal structure of `Over X`; `GrpObj`, `IsCommMonObj`; `HenselianLocalRing`,
`IsDiscreteValuationRing`; `WeierstrassCurve.minimal`, `IsMinimal`, `reduction`,
`HasGoodReduction`, `HasMultiplicativeReduction`, `HasSplitMultiplicativeReduction`,
`HasAdditiveReduction`, `hasGoodReduction_iff_isElliptic_reduction`, `localPolynomial`;
`BrauerGroup`; `ValuationSubring.inertiaSubgroup`; `BDeRham`; `Finsupp.linearCombination`,
`Matrix.toLin'`, `AddCircle`.

Where a target here is a variant of an existing statement, the entry says in one clause how it
differs: a marked Néron model is a `TauCeti.Model` with smooth, separated and quasi-compact
structure morphism, over an arbitrary base morphism `j`, and with the mapping property (1.2);
marked extensionality and uniqueness are `ext_of_genericFiberι_eq` and `Model.subsingleton_iso`
over `Spec R` and are derived from the mapping property over arbitrary `j` (1.2, 1.4); the
component group of 2.2 is for smooth finite-type groups over any field and agrees with
`componentGroupScheme` in the affine algebraically-closed case; the cycle lattice adapter of 4.2
identifies FreeGroupsAndLimitGroups §2.2a's integral `H₁` with the kernel on StableReduction's
dual-graph coordinates; the intersection-matrix description of 4.7 is a comparison with
`NumericalType.Pic`, not a second numerical Picard group; the semistable predicate of 3.1 is for abelian varieties and
restricts, for elliptic curves, to the local form of `WeierstrassCurve.IsSemistable`.
The existing symmetric discriminant form is
`TauCeti.IntegralLattice.discriminantPairing` and `discriminantPairing_mk` in
`TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Bilinear.lean` (IntegralLattices Layer 1D and Completed/IntegralLattices
Layer 1.4). The retained pairing in 4.6 is between cokernels of a pairing of two possibly
different lattices, without a symmetry hypothesis; it does not reconstruct the symmetric
lattice theory.

## Conventions

1. **Bases.** `S` is a connected Dedekind scheme (Noetherian, normal, of dimension one) with
   generic point `η`, function field `K` and inclusion `j : η → S`. Local statements use a
   discrete valuation ring `R` with fraction field `K` and residue field `k`; `k^sep` and `k̄`
   are a separable and an algebraic closure. Henselian, strictly henselian, complete, excellent,
   perfect-residue and finite-residue hypotheses are stated separately at each statement; none is
   implicit in "discrete valuation ring".
2. **The test category.** The Néron mapping property tests every smooth `S`-scheme. Testing only
   étale `S`-schemes is the weak-model condition (1.6); testing only sections or `R`-points is
   neither.
3. **Finite type.** A Néron model is smooth, separated and quasi-compact over `S`; "locally of
   finite type" is never silently accepted. The locally-finite-type Néron models of tori belong to
   ReductiveGroupsPartII.
4. **Markings.** A model is carried with its generic-fibre isomorphism, and every uniqueness or
   functoriality statement is a statement about marked models; "unique up to isomorphism" means
   unique up to the unique marked isomorphism.
5. **Dimensions.** `A` has dimension `g`; for a semistable special fibre `t` is the toric rank,
   `a` the abelian rank, and `g = t + a`; the unipotent rank `u` is recorded where the fibre is not
   semistable, with `t + a + u = g`.
6. **Components.** `Φ_A = M_k/M_k⁰` is a finite étale `k`-group; `Φ_A(k̄)` is the geometric
   component group and `Φ_A(k)` the rational one, the Galois-fixed subgroup. The Tamagawa number
   of an elliptic curve is `#Φ_E(k)`.
7. **Lattices and pairings.** Character lattices are free `ℤ`-modules with continuous residue
   Galois action. The monodromy pairing `u : X_{A^∨} × X_A → ℤ` is integral; its adjoint `u♯`
   is injective with finite cokernel; the discriminant pairing on cokernels takes values in `ℚ/ℤ`
   with the positive inverse-form convention: for `u = [5]`, the specified classes of `1, 1`
   have value `1/5`, and those of `1, 2` have value `2/5`. Here `u` is normalised by the
   valuation pairing of the Raynaud `1`-motive, so a split Tate curve gives `[ord(q)]`.
   The prime-to-residue inertia formula uses the `1`-motive quotient projection in 4.3;
   the Weil-pairing quotient is its negative, with the pairing order specified in 4.3.
   The biextension obstruction equals the positive inverse pairing (4.6). No integral unimodularity is assumed.
8. **Dual graphs.** The dual graph of a nodal curve is a finite connected multigraph: vertices
   the components of the normalisation, edges the nodes, loops and parallel edges allowed, with a
   chosen orientation; `H₁(Γ, ℤ) = ker(∂ : ℤ^E → ℤ^V)`; a non-regular node `xy = π^m` is an edge
   of length `m`.
9. **Tate modules and cohomology.** `T_ℓ(A)` is the homological Tate module with its Galois
   action; `H¹_ét(A_{K̄}, ℚ_ℓ)` is its dual. Local Euler polynomials use geometric Frobenius on
   `H¹`; Weil–Deligne representations and conductors follow the conventions of
   ArithmeticGaloisRepresentations Layer 2 (§2.4) and Layer 3 (§§3.1–3.6). The conductor is
   the Artin conductor with its Swan part.
10. **Elliptic curves.** Equation-level objects are Mathlib's and EllipticCurves', on a minimal
    Weierstrass model; "good reduction" means the multiplicative valuation of the discriminant
    is `1`, that is, the discriminant is a unit. The reduction symbol is EllipticCurves'
    `ReductionSymbol`; "Kodaira type" is used here only for the geometric configuration attached
    to it by `KodairaConfiguration` in 2.8.
11. **Names.** All new declarations live under `TauCeti.AlgebraicGeometry.Neron` (the mapping
    property, models, components, semistability and monodromy) and
    `TauCeti.AlgebraicGeometry.Curves.SemistablePicard` (the Picard theory of Layer 4); Lean
    names below describe the intended API. `Suggested.lean` states the headline theorems
    `LocalExistence` (§1.7), `DedekindExistence` (§1.9) and `EquationGoodComparison` (§6.5);
    its module documentation
    identifies the geometric carriers needed to state the other headline results.

## Exact supplier contracts

The library pins are Mathlib `6b7abb3` and Tau Ceti `a91d3aa`.
Roadmap section contracts describe the requested mathematics independently of implementation.

### From Mathlib

`AlgebraicGeometry.Smooth`, `Etale`, `IsSeparated`, `QuasiCompact`, `LocallyOfFiniteType`,
`IsProper`, `Flat`, `GeometricallyIntegral`: the morphism classes with their composition and
base-change instances; nothing is assumed about them beyond the stated properties.
`CategoryTheory.Over.pullback j`: the base-change functor on `Over S`, used for generic
restriction; its action on morphisms is the restriction map of 1.1. `Over.cartesianMonoidalCategory`
(an abbreviation, activated as a local instance), `GrpObj`, `IsCommMonObj`: group objects in
`Over S` for the group law of 1.5. `HenselianLocalRing`, `IsDiscreteValuationRing`,
`IsLocalRing.ResidueField`: the local hypotheses. `WeierstrassCurve.minimal`, `IsMinimal`,
`reduction`, `HasGoodReduction`, `HasMultiplicativeReduction`, `HasSplitMultiplicativeReduction`,
`HasAdditiveReduction`, `hasGoodReduction_iff_isElliptic_reduction`, `localPolynomial`: the
equation-level predicates compared in Layer 6; `localPolynomial` reads the residue cardinality
as `Nat.card`, which is `0` for an infinite residue field. `BrauerGroup`: the target of the
connecting map of 4.12. `BDeRham`, `WittVector.fontaineTheta`: the only period-ring material
available for 5.3. `Finsupp.linearCombination`, `LinearMap.ker`, `Module.Dual`, `AddCircle`,
`ZMod`: the lattice-level carriers of Layer 4 and the component-group arithmetic of Layer 2.
`AlgebraicGeometry.Scheme.Hom.exists_isIso_morphismRestrict_toNormalization`, in
`Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean`: for a separated finite-type morphism,
the quasi-finite locus is the inverse image of an open subset of its relative normalisation
on which the canonical morphism is an isomorphism; this is the input for 3.3.

### From Tau Ceti

The declarations listed under "Already in Tau Ceti" above, with these contracts:
`TauCeti.AlgebraicGeometry.AbelianVariety` is over a field and supplies the generic fibre; abelian schemes over a
base are `AbelianSchemesAndArithmeticModuli:A0.1–A1`. `TauCeti.Model` carries a flat finitely presented
model with a generic-fibre marking over `Spec R`; `Model.subsingleton_iso` needs a separated
target; `ext_of_genericFiberι_eq` needs a flat source and a separated target over `Spec R`.
`componentGroupScheme` and `identityComponentSpec` require an affine finite-type group over an
algebraically closed field. `characterLatticeFunctor` is an equivalence over a perfect field and
a functor in general. `NumericalType.Pic` is the quotient of `ℤ^{components}` by the rows
`a_{ij}/w_j` of the weighted intersection matrix, `degree` its degree map, `torsion ℓ` the
`ℓ`-torsion, finite for `ℓ ≠ 0`. `kerReduction` is the kernel of reduction on points over the
adic completion at a height-one prime, `formalPointAddEquivKerReduction` its identification with
the formal group. `tateCurve` is the Tate curve over `ℤ⟦q⟧`; `tateModuleGaloisRepresentation` is
the Galois representation on `T_ℓ(E)`.
The abelian-variety carrier and base change are in
`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`; its rigidity supplier is
`TauCeti.AlgebraicGeometry.isMonHom_of_one_hom` in `AbelianVariety/Hom/Rigidity.lean`.
The model uniqueness and flat generic-fibre extensionality suppliers are in
`Curves/StableReduction/Model/Uniqueness.lean` and `Fibers/SchematicDensity.lean`.
The affine component suppliers are in `TauCeti/Algebra/AlgebraicGroup/Connected/GroupScheme.lean`
and `Connected/ComponentGroup/{FiniteEtale,Representable}.lean`, all under
`TauCeti.FiniteTypeCommHopfAlgCat`; the character functor is in
`Torus/CharacterLattice/Functoriality.lean`, and its perfect-field equivalence in
`Torus/CharacterLattice/Equivalence.lean`.
For a symmetric nondegenerate integral lattice, use
`TauCeti.IntegralLattice.discriminantPairing` and `discriminantPairing_mk` in
`TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Bilinear.lean`;
`TauCeti.IntegralLattice.rankOneClass` and `TauCeti.IntegralLattice.discriminantPairing_zsmul_rankOneClass`
in `TauCeti/LinearAlgebra/IntegralLattice/RankOne.lean` pin the positive rank-one
value `kl/(2m)` modulo integers for `m : ℤ` with `m ≠ 0`: its lattice is `⟨2m⟩`,
not `⟨m⟩`. Thus at `m = 2` its generator has self-pairing `1/4`, whereas the scalar
pairing `rankOne 5` in 4.3 has coefficient `5` and inverse value `1/5`.
Section 4.6 here constructs the two-lattice pairing without symmetry and compares
it with that supplier when the two lattices come from a symmetric integral form.
`TauCeti.AlgebraicGeometry.rigidifiedPicardFunctor`, in
`TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean`, is the functor of line
bundles rigidified along a given section, not the entire relative Picard space.
`TauCeti.AlgebraicGeometry.LineBundleClass.picZero`, in
`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/PicZero.lean`, is the kernel of the
Euler degree for a proper integral Noetherian curve with DVR codimension-one stalks
and finite-dimensional `H¹(𝒪)`.
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical`, in
`TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Construction.lean`, supplies the
maximal connected normal smooth unipotent subgroup of an affine finite-type group;
`TauCeti.HopfIdeal.IsMaximalTorus`, in
`TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean`, supplies the maximal-torus predicate
on a Hopf ideal. Section 2.3 applies these inside its affine subgroup after the
Chevalley construction, with the stated perfect-field hypothesis.

`Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one` in
`TauCeti/RepresentationTheory/PGroupInvariants.lean` supplies the nonzero invariant vector
for a finite group representation over a commutative ring of characteristic `p`, when every
image element has `p`-power order. Section 6.13 uses `p = 2`, `k = ZMod 2`; no finite-generation
hypothesis is needed. Mathlib's `IsPGroup.exists_pow_pow_eq_one` and `IsPGroup.of_card`
supply the power identities from the `2`-group hypothesis.

### From `TauCetiRoadmap.EllipticCurves`

Layer 1: the invariant differential `dx/(2y + a₁x + a₃)` in the function field. Layer 2: torsion, Tate modules, the Galois action and the Weil pairing. Layer 3: the
Hasse bound and the point count. Layer 4: the reduction map, `E₀(K)`, `E₁(K)`, Tate's algorithm
with `ReductionSymbol`, termination and correctness of the residue tests, the component count
`m` and the exponent `v(Δ) − m + 1`, the local index `c_p = [E(K) : E₀(K)]`, the Tate curve with
its Galois-equivariant uniformisation `L^×/q^ℤ ≅ E_q(L)`, `localMinimalDiscriminant`, and the
three equation-level Néron–Ogg–Shafarevich statements; all on a minimal Weierstrass equation over
a complete or henselian discrete valuation ring with the residue hypotheses stated there.

### From `TauCetiRoadmap.StableReduction`

Layer 0: `FamilyOfCurves`, generic and special fibres, `FiniteDVRExtension`, models and their base
change. Layer 1: at-worst-nodal families, the étale-local normal form `uv = π^n`, normalisation,
nodes and branches, the dual graph with loops, valence and `b₁`. Layer 3: stable curves. Layer 4:
blow-ups, strict transforms, intersection multiplicities and the resolution of `xy = π^n`.
Layer 5: regular and minimal proper models of a positive-genus curve, their uniqueness,
components, multiplicities, `div(π) = Σ m_i C_i`, adjunction and the genus formula. Layer 6: `NumericalType`,
its Picard group, degree map and torsion. Layer 7: semistable reduction of curves after a finite
separable extension and the curve–Jacobian criterion with its residue-field hypotheses. All over
an arbitrary discrete valuation ring unless stated.

### From `TauCetiRoadmap.ProfiniteCohomology`

Layer 8's low-degree cup uses
`TauCeti.ContCohomology.explicitCup11 : H1 G M →+ H1 G N →+ H2 G P` in
`TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean`.
The input is a `G`-equivariant biadditive coefficient pairing `M →+ N →+ P`, with
discrete coefficients in the Galois application. Section 4.12 uses it with the
Weil pairing on `J[2]` and the class of `W[2]`; the target is the comparison with
the boundary of the exact sequence, rather than a second cup-product construction.

### From `TauCetiRoadmap.JacobianChallenge`

Layer D: `Pic_{X/k}` as the fppf sheafification of `T ↦ Pic(X_T)/Pic(T)`, rigidification by a
point, `Pic⁰` as the identity component, representability and properness, over a field. Layers E
and F: the Jacobian as an abelian variety and the Abel–Jacobi map.

### From `TauCetiRoadmap.ReductiveGroups` and `ReductiveGroupsPartII`

ReductiveGroups Layer 4: character lattices of tori and exactness of `X^*`; Layer 7: the Galois
action on `X^*` and the anti-equivalence with Galois lattices. ReductiveGroupsPartII RG2.0a:
`NormTorus.normOne` (`R¹_{k'/k}𝔾_m`) and Weil restriction; RG2.3.1: quotients of locally
finite-type group schemes over a base of dimension at most one by closed flat subgroups, with
smoothness; RG2.3.2: locally-finite-type Néron models of tori, their finite-type and connected
open subgroups. RG2.3.7 supplies Lang's theorem and `H¹(k,H) = 0`
for smooth geometrically connected finite-type groups over finite fields.

### From `SchemeAndStackFoundations`

The contracts are §§0.12–0.14 for henselisation, equivalence of finite étale algebras
and the finite part of henselian quasi-finite algebras; §§0.16, 0.20–0.21 for catenary,
Nagata and excellent rings and finiteness of normalisation; §§1.13–1.17 for group spaces,
torsors and quotients; §2.22 for scheme Brauer groups; §3.6 for Picard degree torsors
and the rational-divisor-class obstruction; §3.8 for `invariant_differentials`;
§§4.7–4.10 for adic thickening systems, coherent formal modules,
`grothendieck_existence` and `algebraize_hom`; §§4.11–4.13 for modifications and
one-dimensional resolution; and §4.15 for the moduli of stable curves. The §4.10 algebraisation contract
concerns coherent modules and compatible morphisms on given proper schemes. The
polarised algebraisation of the formal abelian quotient uses
AbelianSchemesAndArithmeticModuli A4.8, whose polarised input is established in 3.13.

### From `RigidAnalyticGeometry` and `AdicSpacesPartIII`

Over a complete nontrivially valued nonarchimedean field `K`, RigidAnalyticGeometry
§§6.1–6.2 supplies the G-site and `RigidSpace K`, including admissible restrictions,
gluing and fibre products. Section 8.1 supplies rigid analytification of schemes locally
of finite type over `K`, with its universal property and fibre-product compatibility.
Sections 8.2–8.3 supply the classical-point comparison and the fully faithful functor `r`,
with `r(Sp A) = Spa(A,A°)` and compatibility with gluing, products and ringed topoi.
The equivalence with adic spaces locally of finite type over `Spa(K,K°)` is restricted
to quasi-separated objects on both sides ([Huber, Proposition 4.5(i–v), pp. 543–544](https://virtualmath1.stanford.edu/~conrad/Perfseminar/refs/Huberformalrigid.pdf)).
AdicSpacesPartII R1.1 and R1.7 consume these same carriers and comparisons.
AdicSpacesPartIII F0's formal-scheme carrier and completion, and R2.3's
formal generic fibre supply the comparison between completed identity models and
analytic groups over a complete discrete valuation field. The quotient by the Raynaud
period lattice is the target `RigidUniformisation` in 3.14 here.

### From `AlgebraicModuliForArithmeticGeometry`, `ComplexComparisonPartII`, `AbelianSchemesAndArithmeticModuli` and `ArithmeticGaloisRepresentations`

AlgebraicModuliForArithmeticGeometry §6.1 gives `artinApproximationClassical` over
henselisations of finite-type algebras over excellent DVRs; §7.6.1 gives the relative
Picard fppf sheaf and base change; §7.3 supplies Picard-stack and representability inputs;
§7.9 gives `spaceSectionComponentCriterion` for general
group-space identity components, including the field-level neutral-component construction.
ComplexComparisonPartII §C3.2d.2 gives `relative_picard_algebraicSpace` under proper, flat,
finitely presented and universal-global-functions hypotheses; §§C3.2f.1–C3.2f.2 give
`picardZeroSheaf` and `picardZeroCriterion` for fibrewise Picard identity components. Sections 3.8–3.9 here
establish the stronger separated semi-abelian curve case and its Néron comparison.
AbelianSchemesAndArithmeticModuli A0.1 supplies abelian schemes over bases, A1 supplies
products and rigidity, A2 supplies dual abelian schemes and Poincaré biextensions,
and A3 supplies isogenies, finite flat quotients, Cartier-dual kernels and Weil pairings.
Its A4.1, A4.2, A4.3, A4.5 and A4.10 supply integral Tate modules, universal vector
extensions, degree-one de Rham cohomology, Barsotti–Tate towers and ordinary coordinates,
with the prime-to-characteristic and henselian/perfect-field restrictions stated there.
Its A4.4 `exteriorCohomology` supplies `H^n_ét(A, ℤ_ℓ) ≅ Λ^n H¹_ét(A, ℤ_ℓ)` over an
algebraically closed field, naturally in `A`, for 6.10; its A6.5 `poincareReducibility`
supplies Poincaré complete reducibility over an arbitrary field, imperfect fields
included, for 3.10.

Tate modules and Weil pairings have one carrier. For an abelian variety `A` over a field `K`
and a prime `ℓ ≠ char K`, the Tate module is AbelianSchemesAndArithmeticModuli A4.1's
`AbelianTate`, whose fibre over `K` is Tau Ceti's `TateModule ℓ (A(K^sep))` with its
`Gal(K^sep/K)`-action; the Weil pairing is `AbelianTate.dualPairing`, the limit of the A3.5
pairings `e_{ℓ^r}`; homomorphisms and isogenies act through `AbelianTate.map`.
ArithmeticGaloisRepresentations §6.1 (`TateModule.tateModuleRep`) packages this module
as a continuous representation, and its Layer 2 (§2.4) and Layer 3 (§§3.1–3.6) attach
Weil–Deligne representations and conductors to it. Where a statement here uses the torsion, Weil-pairing or isogeny targets of
ArithmeticGaloisRepresentations §§6.1–6.2, it uses them through a natural isomorphism with the A4.1 carrier that
respects the transition maps, the Galois action, the Weil pairing and isogenies; equality of
ranks is not such a comparison. This roadmap adds to that one carrier the Néron filtration
(3.5–3.6) and the monodromy comparisons (4.3).
A4.8's `polarizedEffectivity` algebraises compatible polarised abelian schemes over the
thickenings of a complete Noetherian local ring, with a compatible relatively ample
line bundle after a finite faithfully flat extension when needed; morphisms algebraise
uniquely. Section 3.13 constructs the formal abelian quotient and its compatible
polarisation so this supplier applies.
SmoothRepresentationsOfLocalGroups SR.5.2, `classical-llc-normalization`, supplies the canonical
parameter fields and coefficient descent/extension. Its `wd-parameter-operations` supplies the
rescaling isomorphism for nonzero scalars, `q ≥ 2` and finite inertia image, and
`wd-frobenius-semisimplification` supplies Frobenius semisimplification.
ArithmeticGaloisRepresentations Layer 2 (§§2.1–2.5) supplies local-field inertia, the arithmetic
quasi-unipotence and prime-to-residue Weil–Deligne adapters, and local Euler factors.
LocalFieldsRamification Layers 3–4 supply the finite and absolute ramification filtrations
over nonarchimedean local fields; over complete discretely valued fields with arbitrary perfect
residue field, including infinite ones, the filtration, breaks and conductors are those of
ArithmeticGaloisRepresentations §§3.1–3.2.
ArithmeticGaloisRepresentations §§3.1–3.7 supplies Artin, Swan, global and residual
conductor theory; §§6.1–6.2 supplies the Tate representation and pairing adapters, and
§6.3 **Local Euler factors** supplies the generic factor on the cohomological dual with
geometric Frobenius. Sections 5.0a–5.0c here specialize torsion and identify the good-reduction
Frobenius and Euler polynomials; 5.1a gives potential good reduction; 5.3a–5.3i develops the
elliptic conductor, discriminant and local-polynomial comparisons. The Raynaud Frobenius
construction in 5.3 uses 5.0b. Sections 5.4–5.7 and 6.7 consume the elliptic comparisons
and the retained generic conductor and Euler-factor definitions.
These are mathematical dependency targets. Only the declarations in the Mathlib and
Tau Ceti contracts above are asserted to exist at the pins; a carrier required from
another roadmap is specified in this README and is not a Lean import or declaration.

PadicPeriodRings §§1–2 and 4.1–4.3 supplies the completed algebraic closure, continuous
Galois action, topological period carriers, invariant functors, canonical comparison maps,
fixed fields, regularity and admissibility predicates. Here `B_cris`, `B_dR`, `B_st`,
`D_cris`, `D_dR` and `D_st` denote those carriers and functors. Consume
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a and R07.3.0's
`finiteKPeriodComparison` to identify the finite-`K` crystalline/de Rham carriers, maps
and predicates with these foundational ones, preserving topology, Frobenius, filtration,
variance and logarithmic embedding. Its §§R07.P7.1–R07.P7.5 supplies the finite-coefficient
period and Sen interfaces. Its §R07.4.27 supplies `FilteredPhiNModuleDD.weilDeligne`.
NoncommutativeAndEquivariantIwasawa §F.6's generic period-realization prefix supplies
`D_pst` and the all-prime potentially semistable Weil–Deligne functor with `N_p`,
admissible tensor/dual isomorphisms, filtered de Rham Galois descent, nilpotence,
extension comparisons and coefficient descent. Section 5.3's `PadicWeilDeligneRealization`
is this functor followed by `N_K = e_K N_p`; its additional comparison identifies the
transported filtered-module realization, including at `p = 2`. Ramified restriction
inherits the generic functor's comparisons with this normalization transport. The order
is the shared period core and its finite-`K` comparisons, then the generic functor, then
this adapter and 5.3's geometric Raynaud realization, then `RaynaudPeriodComparison`,
`PadicComparison` and 6.10's trace exports.
SelmerIwasawaCohomology §4.26 consumes the geometric comparison for its elliptic
Bloch–Kato diagram.

CrystallineCohomology CR.2.1 supplies `H¹_cris(B_k/W(k))[1/p]`, CR.2.3 supplies the proper
smooth formal comparison over its specified PD bases, and CR.3.4 supplies semilinear Frobenius
and its linearization. These apply to the good abelian special fibre over a finite residue field,
including `p = 2`. The comparison with the Coleman–Iovita and period realizations over a
possibly ramified `K/ℚ_p` is part of `PadicComparison` and
`RaynaudFilteredRealization` in 5.3; `good_abelian_frobenius_polynomial` in 6.10 consumes
that bridge. CR.2.3 is not asserted to provide a smooth lift over
`W(k)` for an arbitrary abelian scheme over the ramified valuation ring.

### From `EtaleCohomologyFoundations` and `ArithmeticGaloisRepresentations`

EtaleCohomologyFoundations §F.3a supplies `VanishingCycles.HenselianTrait`, `HenselianTrait.inertia_exact` and
`VanishingCycles.inertia_eq_valuation_inertia` for every henselian DVR `R`. In the Galois
adapters of 3.5 and 4.3, its geometric generic field is the same chosen `K^sep` used by
`AbelianTate`; its residue action identifies `Gal(s̄/s)` with `Gal(k^sep/k)`. The uniquely
extended valuation makes the decomposition group all of `Gal(K^sep/K)`, and its inertia
kernel is Mathlib's `ValuationSubring.inertiaSubgroup`, transported along this identification.
No second inertia subgroup is defined. The residue field of the normalisation in `K^sep`
can be purely inseparable over `k^sep`; its automorphism group still gives this residue action.

For each prime `ℓ ≠ char k`, reduction identifies `μ_{ℓ^r}(K^sep)` with `μ_{ℓ^r}(s̄)`,
compatibly with power maps and Galois action, by henselian lifting of prime-to-residue roots
of unity. Thus the supplier's `ℤ_ℓ(1)` is the coefficient module of
`AbelianTate.dualPairing`, namely Tau Ceti's `PadicTateTwist ℓ K^sep`, not another twist.
Consume `VanishingCycles.tameCharacter_kummer`, `tameCharacter_surjective`,
`tameCharacter_conj` and `tameCharacter_restrict` through these identifications:
`t_ℓ(σ) = (σ(π^{1/ℓ^r})/π^{1/ℓ^r})_r`, the positive Kummer direction;
`t_ℓ : I → ℤ_ℓ(1)` is continuous and surjective, vanishes on wild inertia and satisfies
`t_ℓ(gσg⁻¹) = g·t_ℓ(σ)`; for a finite separable trait extension of ramification index `e`,
`t_ℓ|_{I'} = e·t'_ℓ`. Inertia acts trivially on the twist. At a nonarchimedean local field,
EtaleCohomologyFoundations §F.3a's
`VanishingCycles.tameCharacter_eq_inertiaTameCharacter` identifies this character with the
`ℓ`-component of `TauCeti.inertiaTameCharacter`, hence with `inertiaPadicTameCharacter`.
The latter pinned declaration requires `IsNonarchimedeanLocalField`; its coprimality
hypothesis cannot supply the residue-characteristic-zero case. ArithmeticGaloisRepresentations
§2.1a transports this comparison to global decomposition groups.

These identifications and character properties are the F.3a contract, sourced by Stacks
09ED, 09EE, 0BU4, 0BU5, 0BU7 and 0BU8. F.3a supplies the arbitrary-trait inertia
used in 3.5–3.12, 4.3 and 5.1 and its local-field comparison;
ArithmeticGaloisRepresentations §2.1a supplies its transport to global decomposition groups.
The downstream Picard and graph targets of LefschetzPencilsAndVanishingCycles consume
Layers 3–4 here.

### Additional supplier contracts

| Target | Supplier and exact section / label | Retained adapter and consumer |
| --- | --- | --- |
| §4.2 finite multigraph cycle core | FreeGroupsAndLimitGroups §2.2a / `SerreGraph.integralCycleBoundary`, `SerreGraph.cycleLattice`, `SerreGraph.modTwoCycleSpace`, `SerreGraph.supportGraph`, `SerreGraph.IsSpanningForest`, `SerreGraph.exists_spanningForest`, `SerreGraph.spanningForest_card`, `SerreGraph.exists_forest_cycleBasis`, `SerreGraph.cycleLattice_modTwoEquiv`, `SerreGraph.finrank_cycleLattice`, `SerreGraph.modTwoCycleSpace_finrank` | The dual graph's actual edges identify with the positive darts of its doubled Serre graph. `DualGraph.boundary` and `DualGraph.cycleLattice` are the incidence and kernel in those edge coordinates. Characters, monodromy and weighted pairings are compared here. |
| §4.2 excess identification | GraphConnectivityAndFlows §1.3 / `Assignment`, `excessAt` | Endpoint-indexed arrows correspond to actual dual-edge identities; finite assignments and vertex functions correspond to Finsupp coordinates. Identify `DualGraph.boundary` with incoming-minus-outgoing excess. |
| §4.2 signed circulation group | GraphConnectivityAndFlows §8.1 / `signedCirculations`, `sub_mem_signedCirculations_iff` | Identify the supplied additive subgroup with the additive group of `DualGraph.cycleLattice`; ℤ satisfies the prototype's `AddCommGroup`, `LinearOrder`, and `IsOrderedAddMonoid` hypotheses. The character-lattice realization and pairings are targets here. |
| §4.2 component count | GraphConnectivityAndFlows §1.1 / Components and their count: `Graph.componentCount` | Use the simplification bridge to identify the count with the components of FreeGroupsAndLimitGroups §2.2a's `SerreGraph.supportGraph` on the dual multigraph. Its supplied forest bases, coefficient comparison and rank formulas apply without connectedness or nonemptiness; only connected nonempty graphs have component count one. |

Section 4.2 identifies the supplied incidence and cycle carriers in dual-graph coordinates
and with the circulation group. The general cycle bases, coefficient comparison and rank
formulas are consumed from FreeGroupsAndLimitGroups §2.2a.

## How to read the build

The layers are in build order with the definition and Raynaud exceptions specified below.
Layer 1 defines the Néron mapping property and marked models,
proves uniqueness, extension and the group law, constructs models locally and globally, and
extracts the differential lattice. Layer 2 builds the identity component, the component group,
the Chevalley decomposition and the toric character lattice, and compares the elliptic
equation-level objects with the model. Layer 3 defines semistability, proves the Tate-module
filtration, the Picard–Néron identity comparison, semistable reduction after a finite
extension and then Grothendieck's criterion, and
compares the formal identity model with the Raynaud extension and the rigid uniformisation.
Layer 4 builds the graph and monodromy theory of a regular semistable curve, the integral pairing of
any semistable abelian variety, the component group as its cokernel, Grothendieck's pairing, the
intersection-matrix description, and the one-node hyperelliptic curves. Layer 5 proves
Néron–Ogg–Shafarevich, isogeny invariance of good reduction, the `p`-adic comparison, the
semistable conductor formula and the local Euler polynomial at bad places. Layer 6 packages the
interfaces for the consumers. Downstream roadmaps refer to the six layers as R11.1–R11.6. Within a
layer, build the definition of `SemistableReduction` in 3.1 immediately after 2.4,
then 2.5, and then the remaining API of 3.1 and 3.2. In Layer 3, the Raynaud
subsections 3.13–3.14 need only 2.4 and 3.1, and they are built after 3.5 and before 3.6,
whose finite flat orthogonality uses the dual Raynaud extensions; the `completion` comparison
of 3.5 is likewise proved after 3.14. The build order of Layer 3 is therefore 3.1–3.5,
3.13–3.14, then 3.6–3.12. Each layer ends with worked examples and the list of layers and
roadmaps it needs.

## Layer 1: Néron models and their uniqueness

This layer fixes the object. A Néron model is a smooth separated finite-type model of an abelian
variety whose points are tested against *every* smooth scheme over the base, not only against the
base itself; the mapping property is the whole content, and the model is carried together with the
isomorphism of its generic fibre with the given variety. The layer proves the formal consequences
of the mapping property (uniqueness, extension of morphisms, the group law), constructs the model
locally over every discrete valuation ring and globally over a Dedekind scheme, and
extracts the one integral invariant the height theory consumes: the lattice of invariant
differentials. Throughout, `S` is a connected Dedekind scheme with generic point `η` and function
field `K`, `j : η → S` the inclusion, and `A` an abelian variety over `K`; the abstract part works
for any morphism `j : η → S` of schemes and any object of `Over η`.

### 1.1 The Néron mapping property

Define, for a fixed morphism `j : η → S` and an object `X` of `Over S`, the predicate
`NeronMappingProperty j X`: for every `Y` in `Over S` whose structure morphism is smooth
(Mathlib `AlgebraicGeometry.Smooth`), the generic-restriction map

```text
Hom_S(Y, X) → Hom_η(Y ×_S η, X ×_S η),   f ↦ (Over.pullback j).map f
```

is bijective (Bosch–Lütkebohmert–Raynaud, §1.2, Definition 1, p. 12). Testing only sections
`S → X`, or only étale `Y`, is a strictly weaker condition and is not this predicate. Prove the
unpacking lemmas `NeronMappingProperty.bijective`, `injective`, `surjective`, `existsUnique`
(for each generic `f` there is exactly one `g` restricting to it), `hom_ext` (two `S`-morphisms
from a smooth `Y` with equal restrictions are equal), `iff_existsUnique` (the predicate is
equivalent to unique extension for every smooth test object), `of_iso` (transport along an
isomorphism in `Over S`), `identityRestriction` (for smooth `X`, an endomorphism restricting to
the identity is the identity), and the two refutation lemmas
`not_of_restriction_not_injective` and `not_of_restriction_not_surjective`, which say that one
smooth test object with a non-injective or non-surjective restriction map refutes the property.
*Needs:* Mathlib `AlgebraicGeometry.Smooth`, `CategoryTheory.Over.pullback`.

**Checks.**

- `nonextendible_test` (non-example) — one smooth `Y` and one generic morphism `Y_η → X_η` that no
  `Y → X` restricts to refute `NeronMappingProperty j X`; a definition that tested only sections
  would not see this failure.
- `identity_test` — for smooth `X` with the property, an endomorphism `f : X → X` with
  `(Over.pullback j).map f = 𝟙` equals `𝟙 X`.
- `identity_base_test` (degenerate) — for `j = 𝟙 S` every object of `Over S` has the property, so
  the predicate alone carries no arithmetic content; existence statements must restrict `j` to the
  generic inclusion of a Dedekind base.

### 1.2 Marked finite-type Néron models

Define the structure `NeronModel j A`, for `A` in `Over η`, with fields: an object `model` of
`Over S`; a marking `genericIso : (Over.pullback j).obj model ≅ A`; `smooth`, `separated` and
`quasiCompact` for the structure morphism of `model` (Mathlib `Smooth`, `IsSeparated`,
`QuasiCompact`); and `mapping : NeronMappingProperty j model` (Bosch–Lütkebohmert–Raynaud, §1.2,
Definition 1 and Proposition 2, pp. 12–13). Smoothness already gives local finite presentation, so
quasi-compactness is exactly what turns a locally-finite-type model into the finite-type object
this roadmap uses. A torus model from ReductiveGroupsPartII RG2.3.2 inhabits this structure
precisely when it is quasi-compact; positive-rank split tori fail this condition, whereas the
rank-zero torus and some nonsplit tori satisfy it. Prove the projections `NeronModel.smooth_model`,
`separated_model`, `quasiCompact_model`, `mappingProperty`, the marking identities
`generic_hom_inv`, `generic_inv_hom` and `genericIso_isIso`, the marked extensionality
`NeronModel.hom_ext` (for smooth `Y` and `f, g : Y → model`, equality of
`(Over.pullback j).map f ≫ genericIso.hom` and the same for `g` forces `f = g`),
`extension_existsUnique` (for smooth `Y` and `f : Y_η → A` there is exactly one `g : Y → model`
whose marked restriction is `f`), and `identity_unique` (an endomorphism whose marked restriction
is the marking is the identity). Over an affine base `Spec R` with `R` a discrete valuation ring
and separated target, Tau Ceti's `TauCeti.ext_of_genericFiberι_eq` already gives the
extensionality half without the mapping property; the statement here is over an arbitrary `j` and
derives it from the property. *Needs:* 1.1; Mathlib `IsSeparated`, `QuasiCompact`.

**Checks.**

- A good abelian scheme with its generic marking satisfies the full model predicate (1.8).
- The marked smooth blowup of `WeakNeronBlowup` (1.6) fails the full predicate despite
  smoothness, separatedness, finite type and generic-fibre extensionality.
- The lft model of a positive-rank split torus satisfies the mapping property but fails
  quasi-compactness and hence the finite-type model predicate.
- The rank-zero torus has model `Spec R`. Over `R = ℂ[[π]]`, the ramified quadratic
  norm-one torus for `ℂ((√π))/ℂ((π))` has quasi-compact lft model and also inhabits
  `NeronModel` (ReductiveGroupsPartII RG2.3.2, `ramified_torus_lft_eq_ft`).

### 1.3 Extension of generic morphisms

For `M : NeronModel j A`, a smooth `Y` in `Over S` and `f : Y_η → A`, define
`NeronModel.extend M Y f : Y → M.model` as the unique morphism whose marked restriction is `f`
(Bosch–Lütkebohmert–Raynaud, §1.2, Proposition 2, p. 13). Prove `extend_restrict` (the marked
restriction of `extend M Y f` is `f`), `extend_unique` (any `g` with marked restriction `f` equals
`extend M Y f`), `extend_map` (extending the marked restriction of a given `S`-morphism returns
it), `extend_identity` (extending the marking of `M` from `M.model` itself gives `𝟙`),
`extend_precomp` (for smooth `Z, Y` and `g : Z → Y`, extending `f ∘ g_η` is `g ≫ extend M Y f`),
`extend_proof_irrel` (the extension does not depend on the smoothness proof), `extend_to_model`
(the extension from another marked model `N` of `A` has generic restriction compatible with both
markings), `extend_comp_model` (for three marked models `P, N, M` the extensions `P → N → M`
compose to the extension `P → M`), `extend_inverse_model` (the two canonical extensions between
two marked models are mutually inverse) and `extend_isIso`. *Needs:* 1.1, 1.2.

**Checks.**

- `extend_identity_test` — extending the marking returns `𝟙 M.model`.
- `extend_inverse_test` — for two marked models `M, N` of `A`, the composite
  `extend M N.model N.genericIso.hom ≫ extend N M.model M.genericIso.hom` is `𝟙 N.model`.
- `extend_restrict_test` — the extension of an arbitrary generic test map `f` has marked
  restriction exactly `f`.

### 1.4 Uniqueness of marked Néron models

Prove `NeronModel.unique_iso`: for marked models `M, N` of the same `A` over the same `j`, there is
exactly one isomorphism `e : M.model ≅ N.model` in `Over S` with
`(Over.pullback j).map e.hom ≫ N.genericIso.hom = M.genericIso.hom`
(Bosch–Lütkebohmert–Raynaud, §1.2, Proposition 2(a), p. 13). The proof extends each marking to the
other model by 1.3, uses `extend_inverse_model` for the inverse identities and `hom_ext` for
uniqueness. Changing either marking changes the compatibility equation, so an unmarked statement
"any two Néron models are isomorphic" is weaker. The graph and torsion interfaces of
Layer 4 use extension of homomorphisms from 1.3 and 1.5 directly; they impose no separate
marked-uniqueness hypothesis on their consumers. For models over
`Spec R` of a discrete valuation ring, Tau Ceti's `TauCeti.Model.subsingleton_iso` gives the
uniqueness half for any separated model; the existence half is new. *Needs:* 1.3.

### 1.5 The group law and extension of homomorphisms

Let `S` be a connected Dedekind scheme and `A` an abelian variety over `K`. Prove `GroupLaw`: the
Néron model of `A` carries a unique structure of commutative group scheme over `S` (a `GrpObj` structure
on `model` in the cartesian monoidal category `Over S`, Mathlib `CategoryTheory.Monoidal.Grp`)
extending the group law of `A`, and that every `K`-homomorphism `A → B` of abelian varieties
extends uniquely to an `S`-homomorphism of Néron models (Bosch–Lütkebohmert–Raynaud, §1.2,
Proposition 6, p. 14). `NeronModel.GroupLaw` states existence and uniqueness of the commutative
group structure with a homomorphic marking, for any `j` and marked model of a commutative generic
group. Products of smooth `S`-schemes are smooth, so multiplication, inverse and
identity are extensions in the sense of 1.3, and the group axioms and the compatibility of
homomorphisms follow from `hom_ext`. A generic isogeny extends to a homomorphism of models; it is
not asserted to extend to a finite flat morphism. *Needs:* 1.3, 1.4;
`AbelianSchemesAndArithmeticModuli:A0.1–A1` for the abelian-variety and abelian-scheme carriers over a
base and the group objects of `Over S`; Mathlib `GrpObj`, `IsCommMonObj`.

**Checks.**

- The extension of the zero homomorphism `A → B` is the zero homomorphism of models.
- The extension of the group law restricts to the group law of `A` on the generic fibre.
- A translation `x ↦ x + a` by a nonzero `K`-point `a` of `A` extends as a morphism of `S`-schemes but
  is not a homomorphism; the extension functor does not turn scheme maps into group maps.

### 1.6 Weak Néron models

Define the structure `WeakNeronModel j A`: the same carrier as 1.2 (a smooth, separated,
quasi-compact object of `Over S` with a marking) but with the extension property required only
for `Y` in `Over S` with étale structure morphism (Mathlib `AlgebraicGeometry.Etale`)
(Bosch–Lütkebohmert–Raynaud, §1.2, Definition 1, p. 12). In the arithmetic application `j` is the
generic inclusion of a discrete valuation ring, and the étale test objects are the sections over
strictly henselian base changes. A weak model need not be unique. Prove the projections
`WeakNeronModel.smooth_model`, `separated_model`, `quasiCompact_model`, the marking identities
`generic_hom_inv`, `generic_inv_hom`, the restriction lemmas `bijective`, `injective`,
`surjective`, `existsUnique` and `hom_ext` for étale `Y`, and `WeakNeronModel.ofNeronModel`
(every Néron model is a weak Néron model). This light conversion keeps exactly the
same underlying model and generic-fibre marking, and restricts the mapping property
using `Etale → Smooth`. Its API consists of preservation of `model` and `genericIso`,
the three structural morphism properties, and the unique marked extension for étale
tests; it asserts no uniqueness among arbitrary weak models. *Needs:* 1.2; Mathlib `Etale`.

**Checks.**

- `structure_test` — the weak model is smooth, separated and quasi-compact. Converting
  a Néron model preserves its total space, so its geometric components are not replaced
  by only the identity component.
- Converting a model with a marking composed with a nonidentity generic automorphism
  preserves that marking; resetting it to a chosen reference marking fails this check.
- For `j = 𝟙 S`, converting a marked Néron model retains the same generic isomorphism
  and structure morphism; it does not claim arithmetic existence or make all weak
  models unique.
- `etale_extension_test` — a map from an étale generic test object has exactly one marked
  extension.
- `identity_base_test` (degenerate) — for `j = 𝟙 S` every smooth separated quasi-compact `X` is
  its own weak model; as in 1.1 the degenerate base carries no arithmetic content.
- `WeakNeronBlowup` (non-example) — over a complete strictly henselian discrete
  valuation ring, blow up one closed point of the special fibre of a good elliptic
  model and take its smooth locus. Every section lifts into that smooth locus, but
  the identity on the generic elliptic curve does not extend from the original
  smooth model: the ideal `(π, t)` of the centre is not invertible on it. Thus this
  is weak and fails the full mapping property. Prove this local blowup calculation
  using the weak definition (BLR §1.2, p. 12) and StableReduction Layer 4.

### 1.7 Smoothening and local existence

Let `R` be an excellent discrete valuation ring with fraction field `K` and `A` an abelian variety
over `K`. Prove the construction `Smoothening`: properness of `A` bounds `A(K^sh)` in the sense of
Bosch–Lütkebohmert–Raynaud, §1.1, the smoothening process (blow-ups of the special fibre along the
centres where the defect is positive, with the defect strictly decreasing) produces a smooth
separated finite-type weak Néron model of `A`, and the group structure of `A` upgrades a weak
model to a model with the full mapping property by the criterion of §1.2, Criterion 9
(Bosch–Lütkebohmert–Raynaud, §1.2, Criterion 9, p. 15; §1.3, Theorem 1 and Corollary 2,
pp. 16–17). The construction of a *group* weak model from a weak model is part of this target
(rational group law, saturation under the group law); the uniqueness and group-law results of
1.4–1.5 assume the full mapping property and cannot replace it. Bijectivity of the restriction map
on `R`-points alone does not give the mapping property.

Prove `LocalExistence` for every discrete valuation ring `R`: every abelian variety over its
fraction field has a finite-type Néron model over `R` (Bosch–Lütkebohmert–Raynaud, §1.3,
Corollary 2, p. 17). Construct the model
over the complete, hence excellent, ring `R̂` by
`Smoothening`, then descend existence along `R ⊂ R̂` by §7.2, Theorem 1(i), p. 176.
The boundedness comparison of §1.1, Proposition 5, p. 10, is part of this descent; it does
not require excellence of `R`. No existence is asserted for an arbitrary smooth group
(a positive-rank split torus has only a locally-finite-type Néron model, which is
ReductiveGroupsPartII's object) nor for a genus-one curve without a rational point.
*Needs:* 1.5, 1.6; excellence of a ring is SchemeAndStackFoundations §§0.16, 0.20–0.21
(catenary, Nagata and excellent rings); dilatations and blow-ups along closed subschemes of the
special fibre are SchemeAndStackFoundations §§4.11–4.13 (modifications).

*Lean:* `LocalExistence` in `Suggested.lean` states this existence theorem on the pinned
`AbelianVariety` and `Over` carriers, with a generic marking, smoothness, separatedness,
quasi-compactness and bijective restriction for every smooth test scheme.

**Checks.**

- The construction handles a non-proper smooth test `Y` (for instance an open subscheme of the
  model itself) and positive residue characteristic; a construction verified only on proper
  generic points is not this target.
- For an abelian scheme over `R` the smoothening process stops immediately and returns the
  abelian scheme.
- For a positive-rank split torus over `K` the boundedness hypothesis fails, and the construction does not
  apply; the finite-type existence statement is false for it.
- For a non-excellent DVR `R`, `LocalExistence` still gives a model over `R`; its base change
  to `R̂` is the constructed model, by §7.2, Theorem 1(ii) and Corollary 2, pp. 176–177.
  Excellence of the completion does not imply excellence of `R`.

### 1.8 Abelian schemes are Néron models

Prove `AbelianSchemeModel`: an abelian scheme `𝒜` over `S` (smooth proper group scheme with
geometrically connected fibres, `AbelianSchemesAndArithmeticModuli:A0.1–A1`) satisfies the Néron
mapping property, hence is the marked Néron model of its generic fibre
(Bosch–Lütkebohmert–Raynaud, §1.2, Proposition 8, p. 15). The proof is the extension theorem for
rational maps from a smooth `S`-scheme into an abelian scheme over the connected Dedekind
base, supplied by AbelianSchemesAndArithmeticModuli A1.8 (Weil's extension theorem),
followed by 1.4. Define `GoodReduction` of `A` at a closed point
`s` as the existence of an abelian scheme over the local ring at `s` with generic fibre
`A`; it is not the equation-level predicate of EllipticCurves, and 6.5 proves the comparison.
*Needs:* 1.4; AbelianSchemesAndArithmeticModuli A0.1–A1.2 (abelian schemes, pointed
rigidity), A1.8 (Weil extension over a connected Dedekind base).

**Checks.**

- Over a complete discrete valuation ring an abelian scheme is proper, so its Néron model is
  proper and the component group of 2.2 is trivial.
- The Néron model of an abelian variety with good reduction is unique up to the unique marked
  isomorphism of 1.4 and coincides with any abelian-scheme model.
- A split Tate elliptic curve has a smooth separated finite-type Néron model and semi-abelian
  identity fibre, but no proper smooth model of its generic fibre; it fails `GoodReduction`.

### 1.9 Spreading out and the Dedekind local-to-global construction

Prove `SpreadAbelian`: for `A` over `K` and `S` connected Dedekind, there is a nonempty open
`U ⊂ S` and an abelian scheme `A_U` over `U` with generic fibre `A`; the group law, the identity
section and the smooth proper geometrically connected fibres spread out together with the scheme,
by finite presentation of the defining equations and of the group morphisms and by shrinking `U`
until the group identities and the fibre conditions hold (Bosch–Lütkebohmert–Raynaud, §1.4,
Proposition 2 and Theorem 3, pp. 18–20). The complement of `U` is a finite set of closed points. A
stalk-level spreading lemma for a single morphism (Mathlib `AlgebraicGeometry/SpreadingOut.lean`)
is an input, not a substitute. Then prove `DedekindGluing`: if `A` admits an abelian-scheme model over some dense open `U ⊂ S` and has finite-type Néron models over the local rings at the finitely many
closed points outside `U`, then these glue to a finite-type `S`-model with the full mapping
property; the gluing spreads each local model and its marking to an open neighbourhood
(Bosch–Lütkebohmert–Raynaud, §1.2, Lemma 5, pp. 13–14), uses 1.4 for the transition isomorphisms
and their cocycle condition, and checks the mapping property locally on the finite open cover
(Bosch–Lütkebohmert–Raynaud, §1.4, Proposition 1 and Theorem 3, pp. 18–20). Apply it to the ring
of integers and the rings of `S`-integers of a number field. *Needs:* 1.4, 1.7, 1.8;
`AbelianSchemesAndArithmeticModuli:A0.1–A1`; Mathlib `AlgebraicGeometry.Scheme.OpenCover`, `Scheme.GlueData`.

*Lean:* `DedekindExistence` in `Suggested.lean` states the resulting global existence theorem
for every connected Dedekind scheme and abelian variety over its function field. The base is
expressed as an integral Noetherian scheme of dimension one with integrally closed stalks;
the generic restriction uses Mathlib's function field and generic-point inclusion.

**Checks.**

- Only finitely many closed points of `S` lie outside `U`.
- The localisation of the glued model at a closed point `s ∉ U` is the prescribed local model at
  `s`, and at `s ∈ U` it is the abelian scheme.
- Gluing over an infinite open cover does not itself refute finite type: quasi-compactness
  must be proved. Infinitely many connected components in a single locally finite-type
  special fibre refute quasi-compactness of that fibre, hence finite type of the model over
  the Noetherian base. Components over infinitely many different closed points give no such
  obstruction: the zero abelian variety over `ℚ` has Néron model `Spec ℤ`, which is
  quasi-compact. Checking only the generic fibre does not establish the mapping property.

### 1.10 Étale and unramified base change

Prove `EtaleBasechange`: for an étale morphism `S' → S` of Dedekind schemes, the base change of a
Néron model of `A` is the Néron model of `A ×_K K'`; in the local case this applies to an
unramified extension of discrete valuation rings (Bosch–Lütkebohmert–Raynaud, §1.2,
Proposition 2(c), p. 13). A smooth `S'`-scheme is smooth over `S`, its generic morphism extends by
the mapping property over `S`, and the structure morphism to `S'` is forced by the extension;
separatedness and finite type survive base change. Arbitrary ramified base change of the full
model is false and is not asserted; 3.3 and 3.4 give the identity-component statement that does
hold. Prove the full mapping-property comparison for arbitrary `j`; smoothness, separatedness
and quasi-compactness are preserved by the same base change.
*Needs:* 1.2, 1.4; Mathlib `AlgebraicGeometry.Etale`, `Smooth` (composition and base change
instances).

**Checks.**

- For `S' = S` the base change is the identity.
- For an unramified extension of discrete valuation rings the special fibre of the base-changed
  model is the base change of the special fibre; the component group of 2.2 does not change.
- (non-example) For a split Tate curve with `ord(q) = n` and a ramified extension of index `e`
  the component group becomes `ℤ/en` (3.4), so the base-changed model is not the Néron model;
  the étale hypothesis cannot be dropped.

### 1.11 The invariant-differential lattice

For the global Néron model `M` over `S` with identity section `e`, the sheaf `ω_M := e^*Ω¹_{M/S}`
and its translation invariance `Ω¹_{M/S} ≅ π^*ω_M` are SchemeAndStackFoundations §3.8 (invariant
differentials of a group scheme over a base); define `DifferentialLattice` as that sheaf for the
Néron model, and prove what the height theory needs of it (Yuan–Zhang, §1.1, p. 534):
`NeronDifferentials.rank` (`ω_M` is locally free of rank `g = dim A`, `S` connected),
`generic_iso` (`ω_M ⊗ K` is the space of invariant differentials of `A`), `localize` (the
localisation of `ω_M` at a closed point is the invariant-differential module of the local Néron
model), `pullback` (an extended homomorphism `f : M → N` induces `f^* : ω_N → ω_M`) with `map_id`
and `map_comp`, `det` (the determinant `det ω_M` is an invertible sheaf, the integral Hodge line)
with `det_localize`, `etale_basechange` (compatibility with the base change of 1.10) and
`affine_colie` (for `S = Spec R` and an affine open chart `U = Spec B` of `M` through the identity
section with augmentation `ε : B → R`, the conormal module `ker ε / (ker ε)²` is `ω_M`; the chart
need not be a group scheme or carry a Hopf algebra). On `S = Spec R` the module `ω_M` is a finite
projective `R`-lattice in the `K`-vector space of invariant differentials and is not asserted to
be free. *Needs:* 1.5, 1.9; SchemeAndStackFoundations §3.8; Mathlib `KaehlerDifferential` on
affine charts.

**Checks.**

- `zero_dimension` (degenerate) — the zero abelian variety has `ω_M = 0` and trivial Hodge line.
- `localization_test` — over a discrete valuation ring with good elliptic reduction the minimal
  invariant differential of EllipticCurves Layer 1 is a basis of `ω_M` (the comparison is 6.9).
- `projective_test` (non-example) — for `S = Spec R` with `det ω_M` of nonzero class in `Pic R`,
  the lattice `ω_M` is finite projective and not free; a definition carrying a free module would be
  wrong for such `R`.

### Examples

- Over `ℤ_p` an elliptic curve with good reduction has as Néron model the smooth proper
  Weierstrass model, which is an abelian scheme (1.8).
- For an abelian variety over `ℚ` with good reduction outside `N`, the Néron model over the
  open subscheme `Spec ℤ[1/N] ⊂ Spec ℤ` is an abelian scheme, and the Dedekind construction of
  1.9 glues it with the local models at the primes dividing `N` to the Néron model over `ℤ`.
- A split torus `𝔾_m` over `ℚ_p` has no finite-type Néron model: its locally-finite-type Néron
  model (ReductiveGroupsPartII RG2.3.2) has special fibre `𝔾_m × ℤ`, which is not quasi-compact.

### Dependencies

Mathlib's scheme-morphism classes and `Over.pullback`; `AbelianSchemesAndArithmeticModuli:A0.1–A1`
for abelian schemes over a base; SchemeAndStackFoundations §§0.16, 0.20–0.21 (excellent rings) and §§4.11–4.13
(modifications) for 1.7; ReductiveGroupsPartII RG2.3.2 is a sibling, not an input: its
locally-finite-type Néron models of tori share the mapping property of 1.1 and are compared with
it there, not here.

## Layer 2: special fibres and component groups

The special fibre `M_k` of a Néron model is a smooth finite-type commutative group over `k`,
usually disconnected and usually not affine. This layer constructs its identity component, the
finite étale component group `Φ_A`, the Chevalley decomposition of the identity component into
toric, abelian and unipotent parts, and the character lattice of the toric part with its residue
Galois action; it proves functoriality under isogeny without the false exactness statements; and
for elliptic curves it compares all of this with the equation-level objects of EllipticCurves
Layer 4 and with the geometry of the minimal regular model. Throughout, `R` is a discrete
valuation ring with fraction field `K` and residue field `k`, `A` an abelian variety over `K`, and
`M` its Néron model over `R` (Layer 1); perfectness of `k` and base change to `k̄` are stated where
used.

### 2.1 The identity component

Specialize the field-level neutral-component construction of AlgebraicModuliForArithmeticGeometry
§7.9 `spaceSectionComponentCriterion` to construct `IdentityComponent`: the open and closed
subgroup `M_k⁰ ⊂ M_k` whose geometric fibre is
the connected component of the identity, descended to `k`, and the open subgroup `M⁰ ⊂ M` with
generic fibre `A` and special fibre `M_k⁰` (SGA 7 I, Exposé IX, §1.1, pp. 321–322). Neither group
is affine in general: for good reduction `M_k⁰ = M_k` is an abelian variety. Prove
`NeronIdentity.open` (`M_k⁰` is open and closed in `M_k`), `normal` (it is a normal subgroup,
commutative since `A` is), `contains_zero` (the identity section of `M` factors through `M⁰`),
`geometrically_connected` (`M_k⁰ ×_k k̄` is connected), `generic_iso` (the generic fibre of `M⁰`
is `A`), `basechange_field` (formation of `M_k⁰` commutes with extension of `k`), `map`,
`map_id`, `map_comp` (a homomorphism of models sends identity components to identity components,
functorially) and `good` (for an abelian-scheme model, `M⁰ = M`). The Néron specialization,
relative open subgroup `M⁰ ⊂ M` and marked-model API belong here; the field-level
representability and descent are supplied by AlgebraicModuliForArithmeticGeometry §7.9.
The construction agrees with Tau Ceti's `TauCeti.FiniteTypeCommHopfAlgCat.identityComponentSpec`
for affine groups over an algebraically closed field. *Needs:* 1.5;
AlgebraicModuliForArithmeticGeometry §7.9; Mathlib `AlgebraicGeometry.Scheme.Hom.fiber`,
connected components of a scheme.

**Checks.**

- `good_test` — for an elliptic curve with good reduction `M_k⁰` is the whole special fibre.
- `split_tate_test` — for split multiplicative elliptic reduction with `ord(q) = n > 1`,
  `M_k⁰ = 𝔾_m` although the special fibre of the minimal regular model has `n` components; the
  identity component of the Néron model is not the special fibre of the regular model.
- `nonaffine_test` (non-example) — for a positive-dimensional abelian variety with good
  reduction, `M_k` is a proper connected smooth group of positive dimension, so it is not affine;
  a construction that assumed an affine group would not apply.

### 2.2 The component group

Construct `ComponentGroup`, written `Φ_A := M_k / M_k⁰`, as a finite étale commutative `k`-group
scheme representing the fppf quotient sheaf (SGA 7 I, Exposé IX, §§1.1–1.2, pp. 322–323). The
quotient of a locally-finite-type group scheme over a field by an open normal subgroup is a
scheme by ReductiveGroupsPartII RG2.3.1 (quotients over a base of dimension at most one);
finiteness and étaleness are proved here. Prove `NeronComponents.projection` (the group
morphism `M_k → Φ_A`), `kernel` (its kernel is `M_k⁰`), `quotient` (a morphism from `M_k`
constant on cosets of `M_k⁰` factors uniquely through `Φ_A`), `finite_etale`, `geometric`
(`Φ_A(k̄)` is the finite group of geometric connected components of `M_k`), `rational`
(`Φ_A(k) = Φ_A(k^sep)^{Gal(k^sep/k)}`, so the rational component group is the Galois-fixed
subgroup of the geometric one), `map`, `map_id`, `map_comp` (an extended homomorphism `A → B`
induces `Φ_A → Φ_B`, functorially) and `good` (an abelian-scheme model has `Φ_A = 0`). Where
`M_k` is affine and `k` algebraically closed, `Φ_A` agrees with Tau Ceti's
`TauCeti.FiniteTypeCommHopfAlgCat.componentGroupScheme`. *Needs:* 2.1; ReductiveGroupsPartII
RG2.3.1 (quotients over a discrete valuation ring and over a field).

**Checks.**

- `good_test` (degenerate) — good reduction gives `Φ_A = 0`, not a group with one nonzero class.
- `tate_test` — for a split Tate curve with `ord(q) = n > 0`, `Φ_E(k^sep) = ℤ/n`.
- `nonsplit_test` — for `k` finite and `E` with nonsplit multiplicative reduction and geometric
  component group `ℤ/n`, residue Frobenius acts by `−1`, so `Φ_E(k)` has order `1` for odd `n`
  and `2` for even `n`; this differs from `n` exactly when `n ≥ 3`, the two counts agreeing at
  `n = 1, 2`. Check the fixed-point formula at `n = 4, 5, 1`, and exclude `n = 0`:
  `ℤ/0 = ℤ` has one fixed point while the formula would say `2`, so the hypothesis `0 < n`
  is necessary.

### 2.3 The Chevalley decomposition of the identity fibre

Let `k` be perfect. Prove `Chevalley`: `M_k⁰` has a unique maximal smooth connected affine
subgroup `L`, with `M_k⁰ / L` an abelian variety `B`; the commutative group `L` is the product
over `k` of its maximal torus `T` and its unipotent radical `U`; record the toric rank
`t = dim T`, the abelian rank `a = dim B` and the unipotent rank `u = dim U`, with
`t + a + u = g` (Conrad, §2, Theorem 2.6, pp. 3–4; Proposition 2.16, p. 6; §3, Theorem 3.1,
pp. 7–8). The structure theorem for connected smooth groups over a perfect field is applied to
the identity component, not to the disconnected fibre, and is part of this target; over an
imperfect field the exact smooth form is not asserted, and 2.4 records what descends. Tau Ceti's
`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical` and `TauCeti.HopfIdeal.IsMaximalTorus` (affine groups) are the suppliers for
`U` and `T` inside `L`. *Needs:* 2.1; Tau Ceti `unipotentRadical`, `IsMaximalTorus`.

**Checks.**

- Good reduction has `t = u = 0`, `a = g`.
- Split multiplicative elliptic reduction has `t = 1`, `a = u = 0`.
- Additive elliptic reduction has `u = 1`, `t = a = 0`; a decomposition that omitted the
  unipotent part could not distinguish it from multiplicative reduction.

### 2.4 The toric character lattice

For the identity fibre `M_k⁰` with semi-abelian geometric structure, the maximal torus `T ⊂ M_k⁰`
and the abelian quotient descend to `k` even when `k` is imperfect (Conrad, Theorem 3.1 and
proof, pp. 7–8; Proposition 2.16, p. 6). Define `ToricCharacter`: the character lattice
`X^*(T) = Hom_{k^sep}(T, 𝔾_m)`, a free `ℤ`-module of rank `t` with continuous
`Gal(k^sep/k)`-action, taken from ReductiveGroups Layer 4 (character lattices of tori) and
Layer 7 (the Galois action), and in Tau Ceti `TauCeti.CommHopfAlgCat.geometricCharacterGroup`
with the anti-equivalence `TauCeti.TorusCommHopfAlgCat.characterLatticeFunctor`. Prove that a
homomorphism of Néron models `f : M_A → M_B` restricts to `f_T : T_A → T_B` and induces the
contravariant `f_T^* : X^*(T_B) → X^*(T_A)`, with `map_id` and `map_comp`, and that `X^*`
commutes with extension of `k` (SGA 7 I, Exposé IX, 11.6.1, p. 456, and 10.4, p. 444). *Needs:*
2.1; ReductiveGroups Layers 4 and 7; Tau Ceti `geometricCharacterGroup`, `characterLatticeFunctor`.

**Checks.**

- For split `T = 𝔾_m`, `X^*(T) = ℤ`.
- Multiplication by `m` on `A` induces multiplication by `m` on `X^*(T_A)`.
- For a nonsplit one-dimensional torus (nonsplit multiplicative reduction) the Galois action on
  `X^* = ℤ` is by `−1`; a lattice carried without its Galois action would make the rational
  component count of 2.2 wrong.

### 2.5 Functoriality under isogeny

Prove `IsogenyComponents`: a generic isogeny `A → B` extends to a homomorphism of Néron models,
hence to homomorphisms `M_{A,k}⁰ → M_{B,k}⁰` and `Φ_A → Φ_B`; if `A` is semistable, the map of
connected special fibres is an isogeny and `B` is semistable (Conrad, Proposition 4.1 and proof,
pp. 8–9). The kernel is bounded by the finite kernel of multiplication by the degree on the
semi-abelian identity fibre, and the Chevalley decomposition is applied only after base change to
`k̄`. The extended map of models is not asserted to be finite flat, and taking Néron models does
not preserve exact sequences: Yuan–Zhang's erratum withdraws exactly that step
(Yuan–Zhang, Erratum, introduction, p. 1, citing Bosch–Lütkebohmert–Raynaud, p. 190, Example 8).
*Needs:* 1.5, 2.2, 2.3; the definition of `SemistableReduction` in 3.1.

**Checks.**

- The component map `Φ_A → Φ_B` of an isogeny has a kernel and cokernel that must be computed;
  for the isogeny `E_q → E_{q^m}`, `[z] ↦ [z^m]`, with `ord(q) = n > 1` and `m > 1`,
  the component map `ℤ/n → ℤ/mn`, `r ↦ mr`, is neither surjective nor zero. For `n = 1`
  it is zero, and for `m = 1` it is the identity.
- For an isogeny between abelian varieties with good reduction the induced map of abelian
  special fibres is an isogeny of abelian varieties over `k`.
- (non-example) A short exact sequence `0 → A' → A → A'' → 0` of abelian varieties does not give
  an exact sequence of Néron models or of component groups; a lemma asserting it would be false.

### 2.6 The elliptic reduction filtration

Let `R` be complete with perfect residue field `k` and `E` an elliptic curve over `K`. Prove
`EllipticFiltration`: the equation-level subgroup `E₀(K)` of points with nonsingular reduction
(EllipticCurves Layer 4) is `M⁰(R)`, and the kernel of reduction `E₁(K)` (EllipticCurves
Layer 4; Tau Ceti `kerReduction`, with `formalPointAddEquivKerReduction` identifying it with the
formal group on the maximal ideal) is the kernel of `M⁰(R) → M_k⁰(k)`; and for finite `k`,
`E(K)/E₀(K) ≅ Φ_E(k)` (Tate, §4, Theorems 4.1–4.2 and §6, pp. 41–46). The comparison of sections
uses smooth lifting over the complete base and the mapping property; for finite `k` the
surjectivity of `M_k(k) → Φ_E(k)` uses `H¹(k, M_k⁰) = 0` (Lang's
theorem for connected smooth groups over a finite field), supplied by
ReductiveGroupsPartII RG2.3.7. Smoothness over the henselian base already gives the lifting
`M⁰(R) → M_k⁰(k)`; it does not use Lang's theorem. Over an arbitrary residue field the rational lifting obstruction is retained and `E(K)/E₀(K) → Φ_E(k)`
is only injective. *Needs:* 2.1, 2.2; EllipticCurves Layers 1 and 4; Tau Ceti `kerReduction`,
`formalPointAddEquivKerReduction`; ReductiveGroupsPartII RG2.3.7 (Lang).

**Checks.**

- For good reduction over a complete ring with finite residue field, `E(K) = E₀(K)` and
  `Φ_E(k) = 0`.
- For nonsplit multiplicative reduction the order of `E(K)/E₀(K)` is `1` or `2`, not the
  geometric component count.
- The identification `E₁(K) = ker(M⁰(R) → M_k⁰(k))` matches Tau Ceti's `kerReduction`.

### 2.7 The smooth locus of the minimal regular model

Let `R` be a discrete valuation ring, with no henselian, completeness or residue-field
hypothesis, `E` an elliptic curve over `K` and `X` its minimal proper regular model over `R`
(StableReduction Layer 5). Prove `MinimalRegularSmoothLocus`: the relative smooth locus
`X_sm ⊂ X` is the Néron model of `E` (Bosch–Lütkebohmert–Raynaud, §1.5, Proposition 1, p. 21,
over a strictly henselian base with algebraically closed residue field; Liu–Tong, Theorem 4.1
and its proof, pp. 12–13, over an arbitrary Dedekind base). First reduce to a complete `R`:
formation of `X_sm` commutes with completion (Liu–Tong, Remark 4.5, p. 14), and a smooth
separated finite-type model whose base change along the faithfully flat `R → R̂` has the
mapping property has it over `R` (Liu–Tong, Proposition 2.4(1), pp. 3–4); both reductions are
part of this target. Over the complete, hence excellent, base the Néron model `N` of `E` exists
by 1.7. Use a dense Nagata compactification of `N`, then normalize it; excellence makes the
normalization finite and leaves the regular open `N` unchanged. Resolve the resulting normal
proper curve model by StableReduction Layer 4's normalized blowups, preserving its existing
regular open locus, to obtain a proper regular model containing `N`. The identity of `E` extends
from it to `X` by the terminal property of the
minimal regular model, and a morphism from a smooth scheme to the regular `X` lands in `X_sm`
(Liu–Tong, Corollary 3.2, p. 8). The resulting map `N → X_sm` is an isomorphism on generic
fibres, so `X_sm` inherits the mapping property. The residue field is never enlarged, so this
holds for imperfect residue fields. *Needs:* 1.1, 1.7; EtaleCohomologyFoundations §§G.1–G.3,
`Compactification`, `nagataCompactification`, `compactificationCommonRefinement`, for the
separated finite-type model over the complete DVR; StableReduction Layer 4 (resolution of
normal proper models of smooth curves over a DVR preserving the regular open locus) and
Layer 5 (minimal models and their terminal property); SchemeAndStackFoundations §§0.20–0.21
and §§4.11–4.13 (finite normalization and modification APIs).

**Checks.**

- A component of multiplicity greater than one lies outside `X_sm`.
- For good reduction `X_sm = X` is the smooth proper model.
- The generic fibre of `X_sm` is `E`, and the zero section lies in `X_sm`.
- Over `R = 𝔽_p(s)[[t]]` the statement applies to `R` itself. Its strict henselisation has
  residue field `𝔽_p(s)^sep`, which does not contain `s^{1/p}`, so a hypothesis of algebraically
  closed residue field could not be reached by strict henselisation; none is used.

### 2.8 Geometric component groups by type

Let `R` be strictly henselian with algebraically closed residue field, and let `E` and `X` be as
in 2.7.

**Kodaira configurations — `KodairaConfiguration`.** Prove that the special fibre of `X` has
the configuration in Tate's table for the `ReductionSymbol` of a minimal equation of `E`:
the components with their multiplicities, normalisations, singularities and intersections
agree with the labelled configuration, in every residue characteristic (Tate, §6, pp. 45–46;
§§7–8, pp. 47–52). Compare the full Tate algorithm after completion with this minimal regular
model; the geometric configuration is unchanged by completion. The discriminant and conductor
rows restricted away from characteristics `2, 3` are used only under that restriction in 2.9.
*Needs:* 2.7; StableReduction Layers 4–5 (regular models, components, multiplicities and
intersection theory); EllipticCurves Layer 4 (`ReductionSymbol` and the full Tate algorithm).

**Checks.**

- `I₀`, `I₁` and `II` each have one component: respectively a smooth genus-one curve,
  a rational nodal curve and a rational cuspidal curve. Their intersection matrices alone
  do not distinguish them.
- `I₂` has two rational components meeting transversely at two points, hence a double edge.
- `I₀*`, `IV*`, `III*`, `II*` have respectively `5`, `7`, `8`, `9` components with the
  multiplicities of Tate's table; counting components alone does not specify a configuration.

Prove `KodairaComponentGroups`: `Φ_E(k̄)` is `0` for `I₀`, `ℤ/n`
for `Iₙ` with `n ≥ 1`, `0` for `II` and `II*`, `ℤ/2` for `III` and `III*`, `ℤ/3` for `IV` and `IV*`, `(ℤ/2)²`
for `Iₙ*` with `n ≥ 0` even and `ℤ/4` for `Iₙ*` with `n` odd (Tate, §6, component-group row,
p. 46). The group law on the multiplicity-one components meeting `X_sm` is computed from the
smooth-locus group of 2.7; the orders agree with the torsion of StableReduction Layer 6's
numerical Picard group of the fibre, and the group structure is determined here. These are
geometric groups; rational component groups need the Galois action of 2.2. *Needs:* 2.2,
2.7, `KodairaConfiguration`; StableReduction Layer 6.

**Checks.**

- `I₀*` has group `(ℤ/2)²` although the fibre has five components.
- `I₁` has trivial component group although the fibre is singular.
- `I₃*` has group `ℤ/4`, not `(ℤ/2)²`: the parity of `n` matters.

### 2.9 Wild primes in the elliptic comparison

Prove `WildKodairaComparison`: the Kodaira geometry of `KodairaConfiguration` and the groups
of 2.8 are stated for every residue characteristic, including `2` and `3`, with the reduction
symbol produced by the full Tate algorithm of EllipticCurves Layer 4; the tame discriminant valuations (`II: 2`, `III: 3`,
`IV: 4`, `I₀*: 6`, `Iₙ*: n + 6`, `IV*: 8`, `III*: 9`, `II*: 10`) and the tame additive conductor
value `2` are consequences only when `char k ≠ 2, 3` and are not copied into the wild cases
(Tate, §6, the restriction below the table and §§7–8, pp. 46–52).
*Needs:* 2.8 (`KodairaConfiguration`); EllipticCurves Layer 4.

Tate's table restricts its discriminant, conductor and `j`-valuation rows away from
characteristics `2, 3`; the fibre configurations and geometric component groups are not
subject to that restriction. The algorithm in §§7–8 assumes a complete valuation ring
and perfect residue field (§7, p. 47); these hold after completion in the algebraically
closed-residue situation of 2.8. The ramified coefficients and branch tests, rather than
the tame valuation rows, supply the wild discriminant exponents.

**Checks.**

- Over `ℤ₂`, `y² = x³ + 32` reaches the `II*` branch of Tate’s algorithm: `v₂(a₆) = 5`
  and `v₂(Δ_min) = v₂(−432·32²) = 14`, exceeding the tame value `10`.
- Over `ℤ₃`, `y² = x³ + 9` reaches the `IV` branch because `v₃(b₆) = 2` and
  `b₈ = 0`; `v₃(Δ_min) = v₃(−432·9²) = 7`, exceeding the tame value `4`.
- For `char k ≥ 5` the tame table applies and gives the discriminant valuations above.

### Examples

- `X₀(11)` over `ℚ_{11}`: split multiplicative, `Φ(k̄) = ℤ/5`, `Φ(𝔽_{11}) = ℤ/5`.
- The curve `y² + y = x³ − x² − 10x − 20` (`11a1`) has `I₅` at `11`; the curve `y² + y = x³ − x²`
  (`11a3`) has `I₁` at `11`, trivial component group, and is isogenous to it (2.5).
- An elliptic curve with nonsplit `I₂` reduction over `𝔽_p` has `Φ(k̄) = ℤ/2` and
  `Φ(𝔽_p) = ℤ/2`; with nonsplit `I₃` it has `Φ(𝔽_p) = 0`.

### Dependencies

Layer 1; the definition of `SemistableReduction` in 3.1 for 2.5;
ReductiveGroups Layers 4 and 7 and ReductiveGroupsPartII RG2.3.1 and RG2.3.7; EllipticCurves
Layers 1 and 4; EtaleCohomologyFoundations §§G.1–G.3, `Compactification`,
`nagataCompactification`, `compactificationCommonRefinement`; StableReduction Layers 4–6,
with Layer 4 supplying resolution of normal proper curve models preserving the regular open
locus in 2.7; SchemeAndStackFoundations §§0.20–0.21 and §§4.11–4.13 for normalization and
modifications; Tau Ceti's affine identity components and component
groups, character lattices, `kerReduction` and `formalPointAddEquivKerReduction`.

## Layer 3: semistable reduction and uniformisation

Semistability is a property of the identity component of the special fibre: it is semi-abelian.
This layer defines the predicate, proves what survives isogeny and base change, builds the
toric–finite filtration of the Tate module, establishes the Picard identity comparison and
semistable reduction after a finite extension, and then proves Grothendieck's monodromy criterion, and compares the formal completion of the
semistable identity model with the Raynaud extension and the rigid uniformisation. Throughout,
`R` is a discrete valuation ring with fraction field `K` and residue field `k`, `A` an abelian
variety over `K` with Néron model `M` (Layer 1), identity model `M⁰` and component group `Φ_A`
(Layer 2); henselian, complete and residue-characteristic hypotheses are stated where used.

### 3.1 The semistable reduction predicate

Define `SemistableReduction R A`: the identity component `M_k⁰` of the special fibre of the Néron
model is a semi-abelian variety over `k`, that is, there is a torus `T ⊂ M_k⁰` (the canonical
maximal torus of 2.4) with `M_k⁰ / T` an abelian variety (Conrad, §3, definition before
Theorem 3.1, pp. 6–7, and §4, p. 9). The predicate is applied to the identity component, not to
the whole fibre, and it is a condition over the actual residue field `k`: by 2.4 the torus and the
abelian quotient descend to `k` even when `k` is imperfect. Prove `SemistableReduction.iff_identity`
(the predicate is equivalent to the identity special fibre being semi-abelian), `good` (good
reduction, an abelian-scheme model as in 1.8, implies semistability), `no_unipotent` (over perfect
`k`, semistability is equivalent to the vanishing of the unipotent part in the Chevalley
decomposition of 2.3), `dimension` (for semistable `A` of dimension `g` with toric rank `t` and
abelian rank `a`, `g = t + a`), `isogeny` (3.2), `dual` (`A` is semistable if and only if its
dual is), `finite_basechange` (3.3), `identity_basechange` (3.3), `toric_zero` (for semistable
`A`, toric rank zero is equivalent to good reduction) and `product` (a product is semistable if
and only if both factors are, via the product model and its connected special fibre).
For every discrete valuation ring `R`, prove `SemistableReduction.henselization_iff`:
semistability over `R` is equivalent to semistability over its henselisation. Extend 1.10 to
this filtered limit of local étale `R`-algebras using finite presentation, and descend the
semi-abelian special fibre by 2.4; the residue field is unchanged, and no excellence of `R`
enters (Conrad, §4, p. 9; the limit construction is
SchemeAndStackFoundations §§0.12–0.14). Good
reduction is not a consequence of semistability; it requires the abelian-scheme model of 1.8.
*Needs:* 1.10, 2.1, 2.3, 2.4; SchemeAndStackFoundations §§0.12–0.14;
`AbelianSchemesAndArithmeticModuli:A2.2` for the dual abelian
variety.

**Checks.**

- `good_test` — an elliptic curve with good reduction is semistable with `t = 0`, `a = 1`.
- `tate_test` — a split Tate curve is semistable with `t = 1`, `a = 0`, and is not good.
- `additive_test` (non-example) — an elliptic curve with additive reduction has identity fibre
  `𝔾_a` over `k̄`, which is not semi-abelian; a predicate that only asked for a torus inside the
  fibre would wrongly accept it.

### 3.2 Semistability under isogeny

Prove `SemistabilityIsogeny`: for an isogeny `f : A → B` over `K`, `A` is semistable over `R`
if and only if `B` is. If these equivalent conditions hold, the induced map
`M_{A,k}⁰ → M_{B,k}⁰` of connected special fibres is an isogeny of semi-abelian varieties; in
particular the toric and abelian ranks of `A` and `B` agree (Conrad, Proposition 4.1(1) and its
proof, pp. 8–9). Choose `g : B → A` and `n ≠ 0` with `g ∘ f = [n]_A` and `f ∘ g = [n]_B`; 2.5
applied to `f` and to `g` gives the two implications and the special-fibre isogeny. An isogeny
of semi-abelian varieties maps the maximal torus and the abelian quotient of its source to those
of its target with finite kernel, so applying this to `f_k⁰` and `g_k⁰` gives equal ranks. The
degree of `f` is not restricted relative to the residue characteristic: semistable `p`-power
isogenies are covered. Without semistability the special-fibre map can have
positive-dimensional kernel, so the second sentence carries the hypothesis. No statement
about the component groups is made: a generic isogeny of Tate curves changes `ord(q)` and hence
the order of `Φ`. *Needs:* 2.5, 3.1.

**Checks.**

- Multiplication by a nonzero integer `n` on `A` preserves semistability and both ranks.
  On a positive-dimensional variety `[0]` is not an isogeny.
- (non-example) For `E/ℚ_p` with additive reduction, the extension of `[p]` acts on
  `M_k⁰ = 𝔾_a` as multiplication by `p`, which is zero in characteristic `p`; its kernel is
  positive-dimensional. `E` is not semistable, so the special-fibre conclusion is not asserted
  for it (Conrad, p. 12).
- For a split Tate curve over `ℚ_p`, `[p]` restricts to `[p]` on `M_k⁰ = 𝔾_m`, an isogeny with
  kernel `μ_p` of degree `p`: an isogeny whose degree is divisible by the residue characteristic
  satisfies the special-fibre conclusion.
- Isogenous Tate curves with parameters `q` and `q^n` are both semistable with `t = 1`; their
  component groups have orders `ord(q)` and `n·ord(q)`.
- A statement claiming equal component groups for isogenous semistable varieties is refuted by
  the previous item.

### 3.3 Semistable identity models and finite base change

Prove `SemistableIdentityBasechange`: for semistable `A` over `K`, a finite extension of discrete
valuation rings `R → R'` with fraction fields `K'/K`, and `N` the Néron model of `A ×_K K'` over
`R'`, the canonical map `M⁰ ×_R R' → N⁰` is an isomorphism (Conrad, Theorem 4.4 and its proof,
pp. 10–16; Corollary 4.5, pp. 11–12). The proof first establishes the open-immersion theorem,
which is part of this target and is also consumed by 3.9: over an arbitrary discrete valuation
ring, a smooth separated finite-type group scheme `G` with its generic-fibre marking
by an abelian variety and with a semi-abelian open identity component `G⁰`
(smooth, with semi-abelian fibres)
maps to the Néron model of its generic fibre by an open immersion; in particular a
semi-abelian `G = G⁰` maps isomorphically onto the identity model (Conrad, Theorem 4.4, p. 10). Its proof uses Zariski's main theorem,
smooth and étale lifting and the density of integral sections. Applied to `G = M⁰ ×_R R'`, the
image is exactly `N⁰` because it contains the whole connected identity fibre and the whole
generic fibre. Identity models do not in general have the full Néron mapping property (one with
`Φ ≠ 0` does not), so the uniqueness theorem of 1.4 cannot prove this base-change comparison
in general; the open immersion must be established and its image identified with `N⁰`. The full
Néron model `M ×_R R'` is not asserted to be `N`. *Needs:* 2.1, 3.1;
Mathlib `Scheme.Hom.exists_isIso_morphismRestrict_toNormalization` for Zariski's
main theorem; SchemeAndStackFoundations §0.14 for smooth and étale lifting.

**Checks.**

- For good reduction the base change of the abelian scheme is the abelian scheme over `R'`, and
  the statement reduces to 1.10 without the étale hypothesis.
- For a split Tate curve with `ord(q) = n` and ramification index `e`, the identity fibre stays
  `𝔾_m` while the component group becomes `ℤ/en` (3.4).
- (non-example) For an elliptic curve with additive reduction that acquires good reduction over
  `K'`, the identity fibres are `𝔾_a` and an elliptic curve; the map of identity models is not an
  isomorphism, so the semistability hypothesis cannot be dropped.
- (non-example) With uniformiser `π`, the finite group scheme
  `H = Spec R[e]/(e²-e, πe) = Spec R ⊔ Spec k` has trivial generic fibre and
  `H⁰ = Spec R`, but is not flat: the nonzero class `e` is killed by `π`.
  It is the subgroup of the constant `(ℤ/2)_R` with only the special fibre of the
  nonidentity component; `Δ(e) = e⊗1 + 1⊗e - 2e⊗e` preserves the relation `πe = 0`.
  Neither `H` nor `𝒜 ×_R H` for a positive-dimensional abelian scheme `𝒜/R`
  is smooth, and neither can be open in its Néron model.
- Both `M⁰ ×_R R'` and `Pic⁰_{X/R}` under 3.8's hypotheses are smooth separated
  finite-type group schemes with semi-abelian fibres. They satisfy the helper's
  hypotheses over the actual discrete valuation rings, with arbitrary residue fields.

### 3.4 Ramified base change of a Tate curve

Prove `RamifiedTateCounterexample`: for a split Tate curve `E_q` over a complete discrete
valuation ring with `ord(q) = n > 0`, the geometric component group is `ℤ/n`; after a base change
of ramification index `e` it is `ℤ/en`, and the canonical component map `ℤ/n → ℤ/en` sends `r`
to `er` (Conrad, Example 4.6, pp. 11–12). Prove the split valuation-to-component
comparison here over arbitrary residue fields: the identity-model sections correspond to
classes of units in `E_q(K) = K^×/q^ℤ`, and `Φ_E` is the constant group `ℤ/n`.
Use EllipticCurves Layer 4's point uniformisation and 2.7's smooth-locus model of the split
polygon from StableReduction Layer 5 (Conrad, Example 4.6). Smooth lifting over the henselian
ring and `H¹(k,𝔾_m) = 0` give the section comparison; the latter is the triviality of line
bundles over a field. The component of `[z]` is `ord(z) mod n`, with `[π]` fixing the
positive generator. This split comparison applies without the perfect-residue-field
hypothesis of `EllipticFiltration` in 2.6. In particular the full Néron model does not
commute with ramified base change. In Lean the map is `RamifiedTate.componentMap n e`, with
`componentMap_apply`, `componentMap_injective` for `e > 0` and
`RamifiedTate.componentMap_not_surjective` for `n > 0`, `e > 1`. *Needs:* 2.2, 2.7, 3.3;
EllipticCurves Layer 4 (the Tate curve and its point uniformisation);
StableReduction Layer 5 (the split multiplicative minimal regular model).

**Checks.**

- For `n = 1`, `e = 2` the old component group is trivial and the new one is `ℤ/2`, with the
  identity torus unchanged.
- For `e = 1` the component map is the identity.
- Over `R = 𝔽_p(s)[[t]]` with `q = t²`, the component group is constant `ℤ/2`;
  adjoining a root of the separable Eisenstein polynomial `X² − tX − t` gives
  ramification index `2` and component map `ℤ/2 → ℤ/4`, `r ↦ 2r`, including at
  `p = 2`. The imperfect residue field requires no use of 2.6.
- The component map is injective for `e > 0` and, for `e > 1` and `n > 0`, not surjective;
  for `e = 0` it is the zero map `ℤ/2 → ℤ`, not injective (negative control for `0 < e`).

### 3.5 The toric–finite filtration of the Tate module

Let `R` be henselian, `A` semistable, and `ℓ` a prime different from the characteristic of `K`.
Prove `ToricFiniteFiltration`: there are saturated `Gal(K̄/K)`-stable submodules
`T_t ⊂ T_f ⊂ T_ℓ(A)` with `T_t` of rank `t` and `T_f` of rank `t + 2a`, so that `T_ℓ(A)/T_f` has
rank `t`; `T_f` is the Tate module of the finite part of the `ℓ`-power torsion of the Néron model
(the torsion of `M⁰` lifted through the henselian quasi-finite decomposition) and `T_t` the Tate
module of the toric part (Conrad, Lemma 5.4 and the preceding definitions, pp. 17–18). If moreover
`ℓ ≠ char k`, then `T_f` is the submodule of inertia invariants; at `ℓ = char k` this
identification is not asserted and the finite part is described by the finite flat torsion. The
printed corank `2g − (2t + a)` in the source is a misprint for `2g − (t + 2a) = t`. *Needs:* 3.1;
`AbelianSchemesAndArithmeticModuli:A4.1` (the Tate module `AbelianTate` with its Galois action
and isogeny compatibility, packaged as a representation by `ArithmeticGaloisRepresentations:§§6.1–6.2`);
`AbelianSchemesAndArithmeticModuli:A3` (finite flat torsion subgroup schemes);
EtaleCohomologyFoundations §F.3a for the arbitrary-trait Galois/residue identification
and, when `ℓ ≠ char k`, the unramified Tate twist, through the exact supplier contract above. The adapters
identify its generic Galois action with the action on `AbelianTate`, and its residue action
with the action on the toric character sheaves; these identifications respect finite
separable trait extensions.

Also construct `FiniteFlatToricFiltration` over a henselian `R`, for every positive integer
`m`, **without** requiring `m` invertible in `K`. Let `F_m` be the finite flat part of
`M⁰[m]` in the henselian quasi-finite decomposition, of rank `m^(t+2a)`, and let the lifted
toric torsion `P_m ⊂ F_m` be its multiplicative-type finite flat subgroup of rank `m^t`. Over
`R` there is an exact sequence `0 → P_m → F_m → H_m → 0` with `H_m := F_m/P_m` of rank
`m^(2a)`. On generic fibres there are closed subgroup inclusions `P_{m,K} ⊂ F_{m,K} ⊂ A[m]`;
put `Q_{m,K} := A[m]/F_{m,K}`, of rank `m^t`, so that `0 → F_{m,K} → A[m] → Q_{m,K} → 0` is
exact. The subgroup of `A[m]` divided out is `F_{m,K}`; `H_m` is a subquotient, and no
embedding `H_{m,K} → A[m]` is asserted. The finite étale `R`-model `Q_m` of `Q_{m,K}`, the
Cartier dual of `P_m(A^∨)`, is supplied by `FiniteFlatOrthogonality.quotient_duality` in 3.6.
Prove `FiniteFlatToricFiltration.toric_inclusion`, `finite_inclusion`, `quotient_exact`,
`transition` (the multiplication-kernel maps for divisibility of levels), `completion`
and `special_fibre`. The comparison `completion` is proved after 3.13–3.14 and uses them:
over the completion, 3.13 identifies `P_m,F_m,H_m` with `T_R[m],G[m],B[m]`, and 3.14
identifies `Q_{m,K}` with `Y/mY`. Over an incomplete henselian trait these finite group
schemes are defined directly, without claiming a Raynaud abelian scheme `B` over `R`.

Construct the finite part using the quasi-finite torsion kernel of multiplication on
`M⁰`; its special fibre is finite because the identity fibre is semi-abelian, and flatness
follows from the smooth ambient model and the fibrewise finite kernel. Henselian
quasi-finite decomposition isolates the finite flat part. For the toric lift, the special-fibre inclusion `T_k[m] → (F_m)_k` dualises
to an étale quotient of `D((F_m)_k)`. Lift that quotient and its map uniquely over
the henselian finite `R`-scheme `D(F_m)`, then Cartier-dualise; its dual is `P_m`.
This uses henselian lifting of finite étale targets, without imposing a connected/étale
decomposition over an imperfect residue field. Compare after faithfully flat completion. Faltings–Chai II §2, pp. 34–36, III Corollaries 7.3–7.4, p. 77, and
SGA 7 IX §9.6, pp. 436–437, supply the filtered finite-group-scheme and duality
construction. *Additional needs:* SchemeAndStackFoundations §0.14 (henselian
quasi-finite decomposition) and §1.1 (flat descent); AbelianSchemesAndArithmeticModuli
A3 (finite flat quotients and Cartier duality), A4.5 (compatible towers).
This is the finite flat supplier for the equal-characteristic residue-prime comparison
in 4.3; it is separate from the rank-`2g` Tate module of geometric points.

**Checks.**

- For a split Tate curve (`g = t = 1`, `a = 0`) the Tate-module finite part has rank one
  and the Tate-module quotient rank one; a corank of zero would be wrong.
- For good reduction `T_t = 0` and `T_f = T_ℓ(A)`.
- For an abelian surface with `t = 1`, `a = 1` the ranks are `1 ⊂ 3 ⊂ 4`.
- At `m = 1` all finite group schemes are trivial (rank one); for `g = 0` the
  same holds at every positive level. `m = 0` is excluded, since for `g > 0`
  its generic multiplication kernel is all of `A` and is not finite.
- In equal characteristic `p`, a split Tate curve has `P_p = F_p = μ_p`, `H_p = 0`
  and `Q_p = ℤ/p`, with total generic rank `p²`. The geometric points of `μ_p`
  form the trivial group; they do not compute its scheme rank `p`. Dividing `A[p]` by
  `H_{p,K} = 0` would leave rank `p²`, whereas the quotient by `F_{p,K} = μ_p` is `ℤ/p` of
  rank `p`: the two readings differ already in rank.
- For an abelian-scheme model `𝒜/R` with supersingular elliptic special fibre in
  characteristic `p`, `F_p = H_p = 𝒜[p]` has rank `p²` and `P_p = Q_p = 0`,
  although `𝒜_k[p](k̄)` is trivial.
- Over `R = 𝔽₂[[t]]`, the elliptic scheme `y² + txy + y = x³` has unit
  discriminant `1+t³` and supersingular special fibre `y²+y=x³`, whose inverse
  sends `(x,y)` to `(x,y+1)`, so it has no nonidentity geometric two-torsion.
  In the generic algebraic closure choose `u²=t`; the point `(u⁻²,u⁻³)` lies on
  the curve and is fixed by `(x,y) ↦ (x,y+tx+1)`, so is nonzero two-torsion.
  The generic and special geometric-point counts differ while both torsion
  group schemes have rank `4`.

### 3.6 Weil orthogonality

Under the Tate-module hypotheses of 3.5, in particular `ℓ ≠ char K`, prove `Orthogonality`: for the Weil pairing
`T_ℓ(A) × T_ℓ(A^∨) → ℤ_ℓ(1)`, the finite part `T_f(A)` is the exact annihilator of the toric part
`T_t(A^∨)`, and `T_ℓ(A)/T_f(A)` is dual to `T_t(A^∨)` with the Tate twist (Conrad, Theorem 5.5 and
proof, pp. 18–20). For `ℓ = char k` in mixed characteristic, take inverse limits of the following finite flat
comparison; inertia invariants are not used. Prove `FiniteFlatOrthogonality` for the
finite flat filtration of 3.5 at every positive `m`: under the perfect Cartier-dual
Weil pairing of generic group schemes `A[m] × A^∨[m] → μ_m`, the annihilator of
`F_m(A)_K` is exactly `P_m(A^∨)_K`, and
`A[m]/F_m(A)_K ≅ D(P_m(A^∨)_K)`. The induced duality between
`H_m(A)_K` and `H_m(A^∨)_K` extends over `R`.
Prove `FiniteFlatOrthogonality.bidirectional`, `quotient_duality`, `transition` and
`completion`. Over the completion use the dual Raynaud extensions and their torsion
(Faltings–Chai II §2, pp. 34–36, III Corollary 7.4, p. 77); equality of closed subgroup
schemes and the finite flat duality descend faithfully flatly. This works when `m` is
divisible by `char K` as well: Cartier duality is a duality of group schemes, not of
their geometric point groups. At primes invertible in `K`, inverse limits recover
`Orthogonality`, including the Tate twist. SGA 7 IX (9.6.1)–(9.6.2), pp. 436–437,
uses these partial extensions for all coefficient primes. Its further recovery of the
whole filtration from the generic BT system alone invokes Tate full faithfulness;
that extra recovery is not a premise of the finite-level construction here.
`quotient_duality` also supplies the finite étale `R`-model `Q_m := D(P_m(A^∨))` of the
quotient `Q_{m,K}` of 3.5. Both `FiniteFlatOrthogonality` and `Orthogonality`, which is
recovered from it, consume the dual Raynaud extensions, their torsion sequences and duality
from 3.13–3.14 (`RaynaudExtension.dual_abelian`, `RaynaudOneMotive.torsion_exact` and
`RaynaudOneMotive.dual`). Those subsections need only 2.4 and 3.1, so they are built before
this one, and 3.7–3.12 after it.
*Needs:* 3.5, 3.13, 3.14; `AbelianSchemesAndArithmeticModuli:A3` and A4.1 for Cartier duality
and the integral Weil pairing `AbelianTate.dualPairing`, with its Galois packaging in
`ArithmeticGaloisRepresentations:§§6.1–6.2`; A4.5 for transitions; SchemeAndStackFoundations §1.1
(flat descent).

**Checks.**

- The ranks satisfy `rk T_f(A) + rk T_t(A^∨) = 2g`.
- For a principally polarised `A` the pairing identifies `T_ℓ(A)/T_f` with the dual of `T_t`.
- Saturation and the Tate twist are kept before reducing modulo `ℓ`: the reduction of `T_f` is
  the finite part of `A[ℓ]`, not merely a subspace of the same dimension.
- For good reduction, `F_m = A[m]` annihilates exactly the zero toric group.
- For a split Tate curve in characteristic `p` at `m = p`, the duality
  `D(μ_p) = ℤ/p` gives the period quotient. Replacing `μ_p` by its one geometric
  point would give the wrong dual quotient.
- At `m = 1` both the pairing and every group are trivial; biduality still holds.

### 3.7 Unipotence of inertia of exponent two

Under the hypotheses of 3.5 with `ℓ ≠ char k`, prove `InertiaSquareZero`: every element `σ` of
the inertia group acts on `T_ℓ(A)` with `(σ − 1)² = 0`, and `σ − 1` factors through the toric
part (Conrad, Remark 5.6, p. 18). Inertia fixes `T_f` by 3.5 and acts trivially on the quotient
by 3.6, so `σ − 1` maps `T_ℓ(A)` into `T_f` and kills `T_f`. For the stronger
toric-image assertion, pair with the inertia-fixed `T_f(A^∨)` using the invariant Weil
pairing (the prime-to-residue Tate twist is unramified): its annihilator is `T_t(A)`
by 3.6. *Needs:* 3.5, 3.6; EtaleCohomologyFoundations §F.3a for the general-trait
inertia and unramified twist, and for the surjective tame character in the Tate-curve Check.

**Checks.**

- For a Tate curve there exists a tame inertia element `σ` with `σ − 1 ≠ 0` on `T_ℓ`,
  while every inertia element has `(σ − 1)² = 0`; semisimplification loses the nonzero
  tame operator. At `σ = 1` the operator is zero, and wild inertia acts trivially.
- For good reduction `σ − 1 = 0`.
- The image of `σ − 1` lies in `T_t`, not merely in `T_f`.
- Over `R = ℂ[[t]]`, the split Tate curve with parameter `t` has valuation pairing `[1]`.
  EtaleCohomologyFoundations §F.3a's `tameCharacter_surjective` applies for every coefficient prime,
  so 4.3 gives a nonzero inertia operator, also at `ℓ = 2`; no finite-residue hypothesis applies.

### 3.8 The degree-zero Picard scheme of a semistable curve

Let `R` be a discrete valuation ring, with no henselian or residue-field hypothesis, and let
`X/R` be proper, flat and regular, with geometrically connected smooth generic fibre and
special fibre `X_k` that is geometrically reduced with at worst ordinary double points over
`k̄`; write `g` for the genus of `X_K`. Raynaud's separatedness theorem and the semi-abelian structure of `Pic⁰` of such a
curve hold over an arbitrary discrete valuation ring and an arbitrary residue field (Conrad,
Theorem 7.13 and Proposition 7.14, pp. 34–35), so nothing below enlarges `k`; geometric
statements about components are made after base change to `k̄`. Starting from the relative Picard
fppf sheaf `Pic_{X/R}` of AlgebraicModuliForArithmeticGeometry §7.6.1, its algebraic-space
representability from ComplexComparisonPartII §C3.2d.2 `relative_picard_algebraicSpace` when
`𝒪_R ≅ f_*𝒪_X` universally, and §§C3.2f.1–C3.2f.2's `picardZeroSheaf` and `picardZeroCriterion`, construct
`PicardZero`, written `Pic⁰_{X/R}`: the open subgroup of `Pic_{X/R}` whose
fibres are the identity components, so that its special fibre parametrises line-bundle classes of
degree zero on every irreducible component of `X_k̄`. Prove `SemistablePicard.generic` (the generic
fibre is `Jac(X_K)`), `special` (the special fibre is `Pic⁰` of `X_k`), `multidegree` (a geometric
class in the identity component has degree zero on each normalisation component), `smooth`,
`separated` (under the regularity and reduced-nodal hypotheses the identity component is
separated), `semiabelian` (each fibre is an extension of an abelian variety by a torus),
`pullback`, `pullback_id`, `pullback_comp` (contravariant functoriality for morphisms of curves
respecting multidegree zero) and `smooth_case` (for a smooth proper family the construction is the
relative Jacobian of JacobianChallenge Layer D over a field, and over `R` the abelian scheme of
`AbelianSchemesAndArithmeticModuli:A2`, not a second definition) (Conrad, Theorem 7.12 (Artin),
Theorem 7.13 (Raynaud), Proposition 7.14, pp. 34–35). The non-separated relative Picard functor
itself is not a Néron model. Establish the hypotheses of `picardZeroCriterion` by the nodal
units calculation of Conrad, Proposition 7.14: each geometric identity component is an
extension of the product of the normalization Jacobians by the graph torus, hence smooth of
dimension `Σ_v g_v + b₁(Γ) = g`. Flatness makes the arithmetic genus `g` constant, and the
reduced base `Spec R` then gives smoothness of the open identity subgroup. This calculation
applies to reducible fibres and uses no torsion-component theorem for geometrically integral
fibres. *Needs:* AlgebraicModuliForArithmeticGeometry §§7.6.1 and 7.9;
ComplexComparisonPartII §C3.2d.2 and §§C3.2f.1–C3.2f.2;
JacobianChallenge Layer D; `AbelianSchemesAndArithmeticModuli:A2`.

**Checks.**

- `smooth_test` — for a smooth special fibre `Pic⁰_{X/R}` has no toric part and its special fibre
  is the Jacobian of `X_k`.
- `irreducible_node_test` — an irreducible rational curve with one split node has
  `Pic⁰ = 𝔾_m`, not `0`; with a node whose two branches are conjugate over a quadratic
  extension it is the corresponding nonsplit one-dimensional torus, still not `0`.
- `tree_test` (degenerate) — a nodal tree of rational curves has `Pic⁰ = 0` although each
  component has nontrivial Picard group; the multidegree condition kills everything.
- A split regular `I₂` model has two geometric special-fibre components and
  `Pic⁰_{X_k} = 𝔾_m` of dimension `g = 1`; `picardZeroCriterion` applies to this reducible fibre.

### 3.9 The Picard identity component is the Néron identity component

Under the curve hypotheses of 3.8, over an arbitrary discrete valuation ring, prove
`PicardNeronIdentity`: `Pic⁰_{X/R}` is canonically the identity open subgroup `N⁰` of the Néron
model `N` of `Jac(X_K)`. By 3.8 it is a separated smooth finite-type `R`-group with
semi-abelian fibres and generic fibre `Jac(X_K)`, so the open-immersion theorem of 3.3 maps it
isomorphically onto `N⁰` (Conrad, Theorem 4.4, p. 10, with Theorem 7.13 and Proposition 7.14,
pp. 34–35); no residue-field hypothesis enters. If moreover `R` is strictly henselian with
algebraically closed residue field, prove also that `N` itself is the degree-zero part of the
quotient of `Pic_{X/R}` by the closure of the generic identity section (SGA 7 I, Exposé IX,
Theorem 12.1(a)–(d), pp. 465–467; 12.1.11, p. 468). Write `P⁰_deg` for the open subgroup of
the relative Picard functor with total generic degree zero. The quotient `P⁰_deg/E` by the
closure of the generic identity (the vertical-divisor subgroup) has the mapping property, so
1.4 applies to it and to `N`; `Pic⁰_{X/R}` alone has no full mapping property when `Φ ≠ 0`.
Representability of the quotient and separatedness under the reduced-nodal hypothesis are part
of this target. *Needs:* 1.4, 3.3, 3.8.

**Checks.**

- For a split `Iₙ` model, `Pic⁰_{X/R}` has special fibre `𝔾_m` while `N` has `n` geometric
  components.
- For a smooth model `Pic⁰_{X/R} = N` is the abelian scheme.
- The quotient `P⁰_deg/E` is the full Néron model; the unrestricted `P/E` retains the
  integer degree components even for a smooth curve and cannot be the Néron model of its
  Jacobian. For `n > 1`, the split `Iₙ` case also refutes the full mapping property for `Pic⁰`.

### 3.10 Semistable reduction after a finite separable extension

Let `R` be an excellent discrete valuation ring. Prove `FiniteSeparableSemistableExtension`: there
is a finite separable extension `K'/K` such that `A ×_K K'` is semistable at every discrete
valuation ring of the integral closure of `R` in `K'` lying over `R` (Conrad, Theorem 4.2 and
Proposition 4.3, pp. 9–10; §7, pp. 24–35). The proof is independent of the monodromy criterion.
First prove `JacobianIsogenyFactor`: over the infinite field `K`, every positive-dimensional
abelian variety `A` admits a smooth proper geometrically connected curve `C`, an abelian
variety `B`, and an isogeny `Jac(C) → A × B`. Construct the quotient by Bertini slicing and
obtain the isogeny from AbelianSchemesAndArithmeticModuli A6.5, `poincareReducibility`, over
`K` itself (Conrad, Proposition 4.3 and proof, pp. 9–10;
Milne, *Jacobian Varieties*, Theorem 10.1 and proof, pp. 33–35, for the Bertini quotient). This reduction lemma
is a target here; JacobianChallenge supplies the Jacobian, not the Bertini quotient, and
Poincaré reducibility is consumed, not reproved.
The zero-dimensional abelian variety already has good reduction. For positive dimension,
this lemma expresses `A` as an isogeny factor of the Jacobian of a
smooth geometrically connected projective curve (Conrad, Proposition 4.3, pp. 9–10). Apply
StableReduction Layer 7's curve-reduction existence theorem and Layer 4's resolution to obtain
a regular semistable model; a section is obtained by a further finite separable extension when
needed. The semi-abelian Picard identity fibre of 3.8 and its Néron comparison 3.9 make the
Jacobian semistable. Products and isogeny invariance (3.1–3.2) then give the assertion for `A`.
Only the curve-reduction existence theorem is consumed here; the later curve–Jacobian criterion,
which consumes this roadmap, is not an input. The integral closure of an excellent `R` is finite
and semilocal; check each prime above `R`. At each such localisation `R'`, 3.8 and 3.9 apply to
the regular semistable model over `R'` itself, whatever its residue field, so no strict
henselisation and no enlargement of the residue field is needed. *Needs:* 3.1, 3.2, 3.8, 3.9;
StableReduction Layers 4 and 7 (curve existence); JacobianChallenge Layers D–F (Jacobians);
AbelianSchemesAndArithmeticModuli A3 (isogenies) and A6.5 (`poincareReducibility`);
SchemeAndStackFoundations §§0.20–0.21 (finiteness of integral closure).

**Checks.**

- The extension is separable; a purely inseparable extension does not change the inertia action
  on `T_ℓ` and would not help.
- For an elliptic curve with additive reduction and `j ∈ R`, a finite extension gives good
  reduction; the theorem asserts only semistability.
- For a non-henselian `R` with two primes above it in `K'`, semistability is checked at both.
- For `R = 𝔽_p(s)[[t]]` the residue field `𝔽_p(s)` is imperfect, and the strict henselisation
  has residue field `𝔽_p(s)^sep`, which does not contain `s^{1/p}`
  ([Stacks, Lemma 10.155.2, tag 04GP](https://stacks.math.columbia.edu/tag/04GP)).
  The chain still applies: StableReduction Layers 7 and 4 give regular semistable
  models over each localisation `R'` of the integral closure in `K'`, and 3.8–3.9 are stated over `R'`
  itself, so no step requires an algebraically closed residue field.

### 3.11 Grothendieck's monodromy criterion

Let `R` be excellent and henselian and `ℓ ≠ char k`. Prove `MonodromyCriterion`: `A` is semistable over `R` if
and only if inertia acts unipotently on `T_ℓ(A)`, and in that case with exponent at most two
(Conrad, Theorem 5.8 and proof, pp. 20–22; SGA 7 I, Exposé IX). The forward direction is 3.7. The
converse uses potential semistability (3.10), proved independently by the Picard comparison.
Pass to a strictly henselian base and an extension over which `A` is semistable. The fixed
rational Tate spaces are equal before and after that extension (Conrad, Lemma 5.9, p. 21);
intersecting with `T_ℓ(A)` gives equality of the saturated fixed Tate lattices. The divisible
subgroup obtained from this lattice, namely the image of
`T_ℓ(A)^I ⊗ (ℚ_ℓ/ℤ_ℓ) → V_ℓ(A)/T_ℓ(A)`, is constant over the original fraction field.
Use its toric and finite subgroups, the Néron mapping property and étale torsion over the
strictly henselian ring to descend these divisible systems to the identity special fibre.
Their Zariski closures and the dimension argument of Conrad, pp. 21–22, give a torus and an
abelian quotient. The target includes this divisible-system descent, not equality of every
finite-level torsion group: `[[1, ℓ], [0, 1]]` and its `ℓ`-th power have equal fixed Tate
lattices but different fixed points modulo `ℓ²`. Thus the finite-level inference printed on
p. 21 is not used. *Needs:* 3.7, 3.10; `ArithmeticGaloisRepresentations:§§6.1–6.2`;
EtaleCohomologyFoundations §F.3a for the trait inertia, residue action and
finite-extension identifications;
SchemeAndStackFoundations §§0.12–0.14; the special-fibre group theory of 2.3–2.4.

**Checks.**

- No criterion of this form holds at `ℓ = char k`; the statement carries `ℓ ≠ char k`.
- Triviality of inertia on `A[ℓ]` alone does not give semistability (3.12 needs `N ≥ 3`).
- For a Tate curve the criterion holds with the unipotent operator of 3.7, exponent exactly two.

### 3.12 Full level forces semistability

Let `R` be excellent and henselian, and let `N ≥ 3` be invertible in `k`. Prove `FiniteTorsionSemistability`: if inertia acts trivially on
`A[N](K^sep)`, then `A` is semistable over `R`; in particular `A` acquires semistable reduction at
every place not dividing `N` after adjoining its `N`-torsion (Conrad, Proposition 6.5 and proof,
pp. 23–24). By 3.10, `A` becomes semistable over a finite separable extension; by 3.7,
inertia over that extension acts unipotently. Its inertia subgroup has finite index in the
original inertia, so some positive power of each original inertia matrix is unipotent. The congruence to
the identity modulo `N` bounds every eigenvalue in the valuation ring of `Q̄_ℓ` (in `1 + ℓ𝒪` at an
odd prime `ℓ ∣ N`, in `1 + 4𝒪` for `ℓ = 2`), no nontrivial root of unity satisfies the bound, so
the eigenvalues are `1` and 3.11 applies. The integral matrix argument at level `N` is part of
this target; torsion-freeness of a group of scalar units is not the argument. No good reduction is
claimed. For a non-henselian excellent DVR apply the criterion over its henselisation
and then `SemistableReduction.henselization_iff` of 3.1.
*Needs:* 3.1, 3.7, 3.10, 3.11; `ArithmeticGaloisRepresentations:§§6.1–6.2`;
EtaleCohomologyFoundations §F.3a for inertia restriction and the residue action over
the finite separable extension. The general-trait supplier of 3.5 and 3.7 also supplies the
inertia used in 3.11; the quasi-unipotence argument here uses 3.10 and 3.7.

**Checks.**

- `N = 2` is excluded (non-example): the quadratic twist of an elliptic curve with good
  reduction by a ramified quadratic character has additive reduction, yet inertia acts on its
  `2`-torsion through `−1 ≡ 1`, trivially; the eigenvalue bound `1 + 2𝒪` admits `−1`, and the
  conclusion is false for `N = 2`.
- For `q = π^N` over a complete discrete valuation field with finite residue field and `N`
  invertible in it, the Tate curve has unramified `N`-torsion and is semistable but not good.
- For `A` with good reduction the hypothesis holds for every `N` prime to `char k`.
- Over `R = ℂ[[t]]`, the Tate curve with period `t³` has rational `3`-torsion and is
  semistable. The proof applies although the residue field is infinite.

### 3.13 The Raynaud extension

Let `R` be a complete discrete valuation ring, with arbitrary residue characteristic, and
`A` semistable. Construct `SemiabelianExtensionClassification`: for an abelian scheme `B/R`
and an `R`-torus `T_R`, classify commutative group-scheme extensions of `B` by `T_R` by
homomorphisms of étale sheaves `X^*(T_R) → B^∨`. Pushout along each character gives the
corresponding rigidified algebraically trivial line bundle; reconstruct the extension from
these compatible classes using the Poincaré bundle. Prove naturality under base change and
étale descent, and that completion induces an equivalence between these extensions and
extensions of `B̂` by `T̂_R` (Faltings–Chai, Chapter II §1, p. 34). Over the henselian base the
character sheaf carries the residue Galois action; the map has values in the full dual sheaf,
not only in `B_k^∨`. *Needs:* AbelianSchemesAndArithmeticModuli A2.2–A2.3 (dual and
Poincaré bundle); ReductiveGroups Layer 7 (character sheaves and descent);
AdicSpacesPartIII F0; SchemeAndStackFoundations §§4.8–4.10 (formal existence and morphisms).

**Checks.**

- For `T_R = 𝔾_m`, the extension classes are `B^∨(R)` and completion gives `B̂^∨(R)`
  through the same rigidified line bundles.
- For `T_R = 0`, or for `B = 0`, only the split extension occurs; completion preserves it.
- For a good elliptic scheme over `ℂ[[π]]`, a nonzero point of its dual specializing to zero
  gives a nonsplit extension by `𝔾_m` with split special fibre. The special-fibre class alone
  does not classify the extension over `R`.

Prove `RaynaudExtensionComparison`: the maximal torus `T` of the special fibre
`M_k⁰` lifts uniquely to a formal torus `𝒯` in the completion `M̂⁰` along the special fibre;
the quotient is a formal abelian scheme `ℬ̂`; and the extension
`0 → 𝒯 → M̂⁰ → ℬ̂ → 0` algebraises to `0 → T_R → G → B → 0`, with `B` an abelian scheme
and `T_R` a torus over `R`. Prove `RaynaudExtension.formal_identity` (`Ĝ ≅ M̂⁰`),
`special_fibre`, `unique` (unique isomorphism respecting the formal comparison), `dual_abelian`
(the abelian quotient for `A^∨` is `B^∨`) and `unramified_basechange`. Faltings–Chai,
Chapter II §§1–3, pp. 33–37, gives the formal construction, algebraisation and duality over
complete normal bases without a residue-characteristic restriction; Chapter III §8 and
Proposition 8.1, pp. 77–78, identifies its semi-abelian model with the Néron identity model.
Raynaud 1994, §4.2(i–iv), pp. 302–303, Theorem 4.2.2 and Definition 4.2.3, pp. 304–305,
gives the same comparison when `char k > 0`.

For the construction, lift the torus through nilpotent thickenings and form the
proper smooth formal quotient with its geometrically connected fibres. Lift an ample
bundle compatibly through the thickenings, so they form polarised abelian schemes.
Apply AbelianSchemesAndArithmeticModuli A4.8, `polarizedEffectivity`, to algebraise
this quotient as `B`, including its group law and formal comparison. The compatible
ample system, rather than properness of the initial fibre alone, is the required input
(Faltings–Chai II §§1–3, pp. 33–37; Stacks, Theorem 30.28.4, tag 089A).
Apply `SemiabelianExtensionClassification` to algebraise the formal extension and prove uniqueness.
Split the character lattice after a finite étale cover and descend this canonical comparison,
retaining the residue Galois action. The comparison concerns the identity model: `G_K` is
not `A`, and this target does not identify completions of the full Néron model.
*Needs:* 2.4, 3.1; AdicSpacesPartIII F0 (formal schemes and completion); SchemeAndStackFoundations
§§4.8–4.10 (coherent formal existence and algebraisation of compatible morphisms)
and Layer 1 (étale descent); `SemiabelianExtensionClassification`;
AbelianSchemesAndArithmeticModuli A2 (duality and the Poincaré bundle),
and A4.8 (polarised effectivity).

**Checks.**

- For good reduction `T = 0` and `G = B` is the abelian scheme; polarised formal
  algebraisation returns the chosen abelian-scheme model with its completion.
- For a split Tate curve `G = 𝔾_m` over `R` and `B = 0`, also over `ℂ[[π]]` with
  period `q = π⁵`; the residue-characteristic-zero case has the same formal identity comparison.
- A dimension-zero proper formal group algebraises to the zero abelian scheme.
  An arbitrary unpolarised formal scheme is outside the effectivity supplier:
  properness of its initial fibre does not supply a compatible ample system.
- The comparison concerns the identity model only: the component group of `M` is invisible in
  `M̂⁰`, and a statement identifying `Ĝ` with the completion of the full model is false whenever
  `Φ_A ≠ 0`.

### 3.14 Polarised uniformisation

Under the hypotheses of 3.13, prove `RigidUniformisation`: `A^an` is the quotient of `G^an`
by an unramified Galois lattice `Y` of rank `t`, with exact sequence
`0 → Y → G^an → A^an → 0`. Define its `RaynaudOneMotive` as the data
`[iota : Y → G_K]`, including the extension `0 → T_R → G → B → 0`, the character lattice
`X := X^*(T_R)`, the maps `Y → B` and `X → B^∨`, and the Poincaré trivialisation recording
`iota`. Here `Y = X_{A^∨}` and `X = X_A`; these are residue Galois lattices, not chosen
constant groups. Its API is `period_projection` (the torsion cone projects to `Y/nY`),
`torsion_exact` (`0 → G_K[n] → A[n] → Y/nY → 0` for every `n > 0` as finite flat
**generic-fibre** group schemes), `torsion_transition`, `dual` (exchange `X,Y` and `B,B^∨`),
`bidual`, `weil_toric_period` (the toric/period evaluation duality with its order as in 4.3)
and `unramified_descent`. This does not assert that all of `A[n]` extends to a finite flat
group over `R`.

Faltings–Chai, Chapter II Theorem 6.2 and Remark 6.3, pp. 51–52, and Chapter III
Theorem 7.1, Corollaries 7.2–7.4 and §8, pp. 76–78, supply the degeneration data, torsion,
duality and analytic quotient in every residue characteristic. In their notation the extension
class is `-c` and the actual period is the inverse Poincaré trivialisation `tau⁻¹`; use the
divisor pairing `B(y,x)` of Corollary 7.3, which is positive under a polarisation. These
inversions must accompany any translation to the period notation here. Raynaud 1994,
§2.4.1, p. 298, §3.1, p. 299, §4.2 and Theorem 4.2.2, pp. 302–304, and §4.3, pp. 308–309,
gives the dual motive, torsion cone and valuation formulation for positive residue characteristic.

For a polarisation `lambda : A → A^∨`, prove `RaynaudOneMotive.polarized_positive`: the
contravariant map `lambda^* : Y → X` makes `u(y,lambda^* z)` symmetric and positive definite
over `ℝ`. Obtain positivity from the positivity condition on the degeneration data
(Faltings–Chai II 6.2–6.3), rather than from a sign-unspecified inertia operator. Construct
the analytic quotient after an unramified splitting extension and descend the period embedding
and quotient; constant split lattices are auxiliary choices. *Needs:* 2.4, 3.13;
RigidAnalyticGeometry §§6.1–6.2 (rigid spaces), §8.1 (rigid analytification),
§§8.2–8.3 (classical points and rigid–adic comparison); AdicSpacesPartIII
F0 and R2.3 (formal schemes, completion and generic fibres);
AbelianSchemesAndArithmeticModuli A2–A3 (Poincaré duality and finite flat torsion).

**Checks.**

- For a split Tate curve `Y = q^ℤ ⊂ 𝔾_m^an` has rank one and the pairing is `ord(q)`.
  At `q = π⁵`, the class `(1,q^{1/n})` projects to `1 mod n`, and the toric class
  `(0,ζ_n)` projects to zero. Reversing the period projection changes the sign in 4.3.
- For good reduction `Y = 0` and `A^an = B^an`; the torsion exact sequence reduces to
  `G_K[n] ≅ A[n]`. At `n = 1` every torsion term is zero; `n = 0` is excluded.
- For a nonsplit torus the lattice `Y` is not constant: its Galois action is nontrivial, and a
  construction with a constant lattice would give the wrong abelian variety.

### Examples

- An elliptic curve with multiplicative reduction becomes split after an unramified extension
  of degree at most two and is semistable before and after (3.1, 3.3); over `ℂ((t))` every
  multiplicative reduction is already split and no unramified quadratic extension exists.
- The Jacobian of a curve with a regular semistable model is semistable (Layer 4) with toric
  rank the first Betti number of the dual graph (4.2), giving the ranks of 3.5 directly.
- The elliptic curve `y² = x³ + p` over `ℚ_p` (`p ≥ 5`) has additive reduction and nonunipotent
  inertia, and acquires good reduction after adjoining a sixth root of `p` (3.10). That field is
  sufficient, not necessary: over `ℚ₅(α)` with `α⁶ = 10` the substitution `x = α²X`, `y = α³Y`
  gives `Y² = X³ + 1/2` with unit discriminant `−108`, yet `ℚ₅(α)` contains no sixth root of `5`,
  since `2` is not a sixth power in `𝔽₅`.

### Dependencies

Layer 2 for the identity component, the Chevalley decomposition and the toric character lattice;
`ArithmeticGaloisRepresentations:§§6.1–6.2` for representation packaging of Tate modules;
`AbelianSchemesAndArithmeticModuli:A2–A3` for duals, finite flat torsion and the Weil pairing,
A4.1 for the Tate-module carrier, A4.8 for polarised formal effectivity and A6.5 for Poincaré
reducibility;
EtaleCohomologyFoundations §F.3a for arbitrary henselian-trait inertia, the residue
Galois action and tame characters;
SchemeAndStackFoundations §§0.12–0.14, 0.20–0.21 and §§4.7–4.13 for henselisation,
excellence and formal geometry; Mathlib's Zariski main theorem;
RigidAnalyticGeometry §§6.1–6.2 and §§8.1–8.3
and AdicSpacesPartIII F0 and R2.3 for analytic and formal carriers; EllipticCurves Layer 4 for the Tate curve; StableReduction Layers
4 and 7 for curve existence and regular resolution; JacobianChallenge Layers D–F for Jacobians;
AlgebraicModuliForArithmeticGeometry §§7.6.1 and 7.9 for the Picard sheaf and group-space components;
ComplexComparisonPartII §C3.2d.2 and §§C3.2f.1–C3.2f.2 for Picard representability and identity components.

## Layer 4: Picard schemes of semistable curves and the monodromy pairing

For a Jacobian the Néron model is computed by the Picard functor of a regular semistable model,
and the toric part, the monodromy pairing and the component group are read off the dual graph of
the special fibre. Using the Picard identity comparison of 3.8–3.9, this layer builds the
normalisation sequence, identifies the toric character lattice with the integral first homology
of the dual graph, constructs Grothendieck's integral monodromy pairing for any semistable
abelian variety, derives the component group and Grothendieck's pairing on it, proves the
intersection-matrix description, treats the one-node hyperelliptic curves of Bhargava–Gross–Wang,
and states the semi-abelian Picard scheme of a stable family. The standing hypotheses for the
curve statements are: `R` a strictly henselian discrete valuation ring with algebraically closed
residue field `k`, `X` a proper flat regular curve over `R` with geometrically connected smooth
generic fibre `X_K` and geometrically reduced nodal special fibre `X_k`; projectivity and a
section are added where used. The pairing statements are for any semistable abelian variety
over a henselian `R`.

### 4.1 The normalisation sequence

For a proper connected nodal curve `C` over an algebraically closed field `k` with normalisation
components `C_v` (StableReduction Layer 1: normalisation, nodes, branches), prove
`NormalizationExactSequence`: there is an exact sequence of fppf group schemes

```text
0 → T_Γ → Pic⁰(C) → ∏_v Jac(C_v) → 0,
```

where `T_Γ` is a torus whose character lattice is `H₁(Γ, ℤ)` for the dual multigraph `Γ` of `C`
(loops and parallel edges retained) (SGA 7 I, Exposé IX, 12.3, formulas 12.3.1–12.3.14,
pp. 469–473). The proof takes cohomology of the units sequence of the normalisation, separates
constant functions from the gluing scalars at the nodes, and identifies the quotient of the node
scalars by the vertex rescalings with `T_Γ`; the fppf cohomology of the units sequence and the
representability of the torus are part of this target. *Needs:*
ComplexComparisonPartII §C3.2d.2 (relative Picard representability);
JacobianChallenge Layer D; StableReduction Layer 1.

**Checks.**

- For one rational curve with one node, `H₁ = ℤ` and `Pic⁰ = 𝔾_m`.
- For a tree of rational curves `H₁ = 0` and `Pic⁰ = 0`.
- For two rational curves meeting in two points `H₁ = ℤ` and `Pic⁰ = 𝔾_m`; a simple-graph
  model with one edge would give `0`.

### 4.2 Characters are integral graph cycles

Let `V` and `E` be finite types and `src, tgt : E → V` the ends of the dual multigraph;
loops and parallel edges are retained. For StableReduction Layer 1's dual graph, these are
`endpoint e 0` and `endpoint e 1`. The finite multigraph cycle core is supplied by
FreeGroupsAndLimitGroups §2.2a
([finite cycle spaces and independent cycles](../FreeGroupsAndLimitGroups/README.md#22a-finite-cycle-spaces-and-independent-cycles)).
Its statements require neither connectedness nor a nonempty vertex set.

To identify the carriers, take darts `E × Bool`, reversal `(e,b) ↦ (e,!b)`, and source
`src e` on `(e,false)`, `tgt e` on `(e,true)`. This gives a Serre graph `Γ` whose positive
darts are `O = {(e,false) | e ∈ E}`. The edge bijection `ι : E ≃ O` transports Finsupp
coordinates by `ι_*`, sending `δ_e` to `δ_(e,false)` and leaving vertex coordinates fixed.
The supplied `SerreGraph.integralCycleBoundary` and `SerreGraph.cycleLattice` are identified
with the following two adapters; their geometric interpretation is a target here.

**`DualGraph.boundary`.** (*boundary*) Retain signed incidence in the actual dual-edge coordinates:
`DualGraph.boundary src tgt = Finsupp.linearCombination ℤ (e ↦ δ_tgt(e) − δ_src(e))`.
The identification equation is
`Γ.integralCycleBoundary O ∘ ι_* = DualGraph.boundary src tgt`.
This uses FreeGroupsAndLimitGroups §2.2a's boundary and the cellular sign convention
of Hatcher, §2.2, pp. 140–141. For the excess comparison with GraphConnectivityAndFlows §1.3,
set `Q v w := {e : E // src e = v ∧ tgt e = w}` and transport finite assignments to
`E →₀ ℤ` and vertex functions to `V →₀ ℤ`. Identify incoming-minus-outgoing excess
with this boundary, retaining loops and parallel edge identities.

**Checks.**

- A loop has boundary zero because its two ends coincide.
- An edge `0 → 1` has boundary `δ₁ − δ₀`, fixing the incidence sign.
- Two parallel edges `0 → 1` have equal boundaries but distinct basis vectors; their
  difference has boundary zero, whereas their sum has boundary `2δ₁ − 2δ₀` over ℤ.

**`DualGraph.cycleLattice`.** (*cycle-lattice*) Retain the kernel in dual-edge coordinates:
`DualGraph.cycleLattice src tgt = ker (DualGraph.boundary src tgt)`.
Under `ι_*`, the identification equation is
`ι_*(DualGraph.cycleLattice src tgt) = Γ.cycleLattice O`.
Thus `H₁(Γ, ℤ)` on the curve's edges is FreeGroupsAndLimitGroups §2.2a's cycle lattice.
Identify its additive group with GraphConnectivityAndFlows §8.1's
`signedCirculations (K := ℤ) Q`, using `sub_mem_signedCirculations_iff` and the coordinate/excess
comparison above; ℤ satisfies that prototype's ordered additive-group hypotheses.
The incidence-kernel description is Hatcher, §2.2, pp. 140–141. The assignment
correspondence sends `f` to `c` with `c e = f ⟨e, rfl, rfl⟩` in `Q (src e) (tgt e)`;
its excess at `v` is exactly `(DualGraph.boundary src tgt c) v`. It imposes no
nonnegativity or capacity constraint.

**Checks.**

- One vertex and one loop give the full rank-one edge module.
- Two vertices joined by a single edge have zero cycle lattice.
- Two parallel edges with the same orientation have cycle lattice generated by `(1, −1)`;
  identifying the edges would remove this generator.

Consume `SerreGraph.modTwoCycleSpace`, `SerreGraph.supportGraph` and
`SerreGraph.IsSpanningForest` from FreeGroupsAndLimitGroups §2.2a on `(Γ,O)`. Its `SerreGraph.exists_spanningForest` and
`SerreGraph.spanningForest_card` provide a forest of actual edges with `#F + #components = #V`;
`SerreGraph.exists_forest_cycleBasis` provides integral and binary chord bases with matching
reductions.
In particular, loops are chords and distinct parallel edges retain separate coordinates.
Its `SerreGraph.cycleLattice_modTwoEquiv` supplies the coefficient-reduction isomorphism
`𝔽₂ ⊗_ℤ H₁(Γ, ℤ) ≅ Γ.modTwoCycleSpace O`, with `1 ⊗ c` sent to the edgewise reduction
of `c`. These are supplied general statements, including disconnected and empty graphs
(Hatcher, §1.A, Propositions 1A.1–1A.2, pp. 83–85 and §2.2, pp. 140–141, 153–154).

Consume the rank formulas `SerreGraph.finrank_cycleLattice` and
`SerreGraph.modTwoCycleSpace_finrank` from the same section:
`rank_ℤ H₁(Γ, ℤ) + #V = #E + #components` and
`dim_𝔽₂ Γ.modTwoCycleSpace O + #V = #E + #components`.
GraphConnectivityAndFlows §1.1 supplies the component count via its simplification bridge
with `Γ.supportGraph O`. The equal ranks and the connected specialization
`rank H₁ + #V = #E + 1` follow from these supplied formulas; connectedness includes a
nonempty vertex set. Two isolated vertices give `0 + 2 = 0 + 2`, while the empty graph gives
`0 = 0`; neither has the connected specialization. On a connected curve's dual graph the
rank agrees with StableReduction's `firstBetti`.

**Integral graph adapter and character lattice.** (*integral-graph-adapter*) Prove the
endpoint-indexed assignment/Finsupp equivalences in the GraphConnectivityAndFlows §1.3 and
§8.1 contracts above, including ℤ-linearity, and realize the integral module on the supplied
circulation group. For a proper reduced nodal curve `C` over an algebraically closed field,
prove `CharactersGraphHomology`: `X^*(T_Γ) ≅ H₁(Γ, ℤ)` canonically, where `T_Γ` is the
torus in 4.1's normalisation sequence, taken componentwise if `C` is disconnected.
Use the supplied integral cycle lattice in the dual-graph coordinates just specified.
The isomorphism changes by the corresponding coordinate sign when an edge is reversed,
and it is equivariant for automorphisms of `C` and for Galois descent: an automorphism
interchanging the two branches acts by a signed edge permutation, including on a loop.
The dual lattice `Hom(X^*(T_Γ), ℤ)` is `H¹(Γ, ℤ)` (SGA 7 I, Exposé IX,
12.3.6–12.3.7 and 12.3.11–12.3.14, pp. 471–473; BLR §9.2, Example 8 and its proof,
pp. 246–247). *Needs:* 2.4, 4.1; FreeGroupsAndLimitGroups §2.2a
(`SerreGraph.integralCycleBoundary`, `SerreGraph.cycleLattice`, `SerreGraph.modTwoCycleSpace`,
`SerreGraph.supportGraph`, `SerreGraph.IsSpanningForest`, `SerreGraph.exists_spanningForest`,
`SerreGraph.spanningForest_card`, `SerreGraph.exists_forest_cycleBasis`,
`SerreGraph.cycleLattice_modTwoEquiv`, `SerreGraph.finrank_cycleLattice`,
`SerreGraph.modTwoCycleSpace_finrank`);
GraphConnectivityAndFlows §§1.1, 1.3, 8.1 as contracted above;
StableReduction Layer 1 (`DualGraph`, `firstBetti`);
Mathlib `Finsupp.linearCombination`, `LinearMap.ker`, `TensorProduct`.

**Checks.**

- A rational curve with one node has integral character lattice ℤ. Reduction of its unit
  loop cycle generates its one-dimensional binary cycle space. Interchanging its branches
  acts by inversion on the torus and by `−1` on the integral cycle, not by the identity.
  For a Tate curve with `v(q) = n > 0`, the nodal contraction has one loop of thickness `n`;
  its regular `I_n` model has the same rank-one lattice, pairing `[n]` and component group `ℤ/n`.
- Two rational components meeting at two nodes give character lattice ℤ. The integral
  generator `(1, −1)` reduces to `(1, 1)`; reversing one edge changes the corresponding
  integral coordinate sign and leaves the binary cycle unchanged.
- A tree of rational components has zero character lattice and zero binary cycle space;
  vertex rescalings remove all node gluing parameters.
- For a smooth connected curve there are no edges: the torus and both cycle modules are zero,
  while `Pic⁰(C) = Jac(C)` need not be zero. For two isolated vertices both cycle modules vanish
  and coefficient reduction is still an isomorphism. Disjoint unions give products of Picard
  identity groups and direct sums of character lattices; no graph adapter requires connectedness.
- Two rational components meeting at three nodes give a totally degenerate genus-two curve.
  Orient all three edges in the same direction. Its characters are
  `{(x,y,z) ∈ ℤ³ | x+y+z = 0}`, with basis `(1,−1,0)`, `(0,1,−1)`.
  Both ranks are `2`, satisfying `2 + 2 = 3 + 1`; at unit thickness the Gram matrix is
  `[[2,−1],[−1,2]]` and the component group is `ℤ/3`. For two components meeting twice,
  the corresponding formulas are `1 + 2 = 2 + 1` and Gram matrix `[2]`.

**Weighted graphs and their discriminant groups.** Define `WeightedGraph V E` on arbitrary
vertex and edge types, with endpoint maps `src, tgt : E → V` and positive integral
`thickness : E → ℕ+`. The edge form, Gram map and finite discriminant group assume finite
`E`; the incidence kernels and the bipartite-double membership criterion need no finiteness.
Finite `V` is needed for the component-count rank formulas above. Its `WeightedGraph.H1` is `DualGraph.cycleLattice src tgt`;
`WeightedGraph.gram` is the restriction of `DualGraph.edgeForm thickness` to this lattice,
and `WeightedGraph.componentGroup` is `Module.Dual ℤ H1 ⧸ LinearMap.range gram`.
Here `DualGraph.edgeForm len` on the ambient edge module is
`(c,d) ↦ Σ_e (len e : ℤ) c_e d_e` for arbitrary `len : E → ℕ`, including zero lengths;
`DualGraph.edgeForm_symm` and `DualGraph.edgeForm_neg_coord` assert symmetry and invariance
under simultaneous coordinate sign reversal in both arguments. Transporting cycles also
interchanges the endpoints of the reversed edge, as in the supplied orientation API.
Prove `WeightedGraph.gram_positive`, strict positivity on nonzero cycles,
`WeightedGraph.gram_injective` and `WeightedGraph.componentGroup_finite`, including empty
and disconnected graphs. These are geometry-free objects; their geometric identification
is 4.4–4.5 (Hatcher, §2.2, pp. 140–141 and Chapter 3, p. 187; SGA 7 I, Exposé IX,
12.4–12.5, pp. 473–475).

Define `WeightedGraph.bipartiteDouble` using vertices `V ⊕ V`, the same edges and
thicknesses, and endpoints `inl ∘ src`, `inr ∘ tgt`. Prove
`WeightedGraph.mem_bipartiteDouble_H1`: an edge assignment belongs to its cycle lattice
exactly when both endpoint pushforwards vanish separately. This is an application of
signed incidence on the disjoint vertex sets, not an identification with `H1` of the
original graph. The double is used when the geometric fibre has two labelled families
of components; a graph identification with that fibre is required.

**Checks.**

- One vertex and one loop of thickness `n > 0` have `H1 = ℤ`, Gram map `[n]` and
  component group `ℤ/n`. The ambient form on loop coefficients `r,s` is `n*r*s`;
  in particular coefficients `1,−1` give `−n`, and restricting to the unit cycle gives `n`.
  These identities also hold for the ambient zero-length form. The bipartite double has
  one edge between two distinct vertices and zero cycle lattice (`WeightedGraph.bipartiteDouble_single_loop`). The two
  constructions cannot be interchanged.
- Two parallel edges from one vertex to another, of thicknesses `a,b`, give Gram map
  `[a+b]`; two endpoint maps to a singleton give the same augmentation kernel in the double.
- A tree, or a graph with no vertices and no edges, has zero `H1` and trivial component
  group. Disjoint unions give direct sums of lattices and component groups.
- Three cyclically oriented edges forming a triangle have ordinary cycle `(1,1,1)`;
  neither endpoint pushforward vanishes. Positivity of thickness is essential to finite
  cokernel: a zero-weight loop would give the infinite quotient `ℤ`.

**Hecke families and adjoint functoriality.** Define `HeckeFamily` on a weighted graph:
for an index type of places, commuting integral endomorphisms of the edge module and of
the vertex module, together with a finite exceptional set `S`. Away from `S`, the
endomorphisms commute with signed incidence. In the bipartite presentation require
commutation with each endpoint pushforward and its corresponding vertex endomorphism.
The induced endomorphisms on `H1` consequently commute. At exceptional indices an action
on `H1` requires an explicit stability law; no action is supplied by a zero default.

For weighted graphs `G,H` and lattice maps `a : G.H1 → H.H1`, `b : H.H1 → G.H1`
satisfying `gram_H(a x,y) = gram_G(x,b y)`, prove
`WeightedGraph.gram_adjoint_range`: `b.dualMap` carries `range gram_G` into
`range gram_H`. It therefore induces a map `G.componentGroup → H.componentGroup`;
prove its identity, composition and quotient-projection formulas. This supplies the
component action from an operator together with its adjoint, including the transpose
Hecke action, rather than presuming self-adjointness. The algebra is the adjunction
identity; its geometric instances use SGA 7 I, Exposé IX, 10.2.6–10.2.8, p. 441,
and 4.3, 4.6, 6.1. No automorphic Hecke algebra is defined here.

**Checks.**

- If both endpoint pushforwards of `c` vanish and each intertwines the edge operator,
  both pushforwards of its image vanish; commuting edge operators give commuting restrictions.
- For rank-one forms `[n]` and `[mn]`, the pair `a = 1`, `b = m` is adjoint and the
  induced component map is multiplication by `m` from `ℤ/n` to `ℤ/(mn)`.
- A commuting edge operator alone need not preserve cycles: on two parallel edges,
  `diag(1,2)` takes `(1,−1)` to `(1,−2)`. Stability at an exceptional index is substantive.

**Matchings.** Define `Matching` between two `HeckeFamily` objects to consist of edge
and vertex bijections preserving both endpoints and thickness, with the induced coordinate
maps intertwining the edge and vertex actions outside a specified finite set containing
the two exceptional sets. In a bipartite presentation preserve each labelled vertex family.
Prove that it gives integral isometries of `H1`, hence isomorphisms of component groups,
intertwining the induced Hecke actions wherever the adjoint families also match.
Prove identity, inverse and composition with exceptional sets enlarged by union. At an
excluded index no intertwining is inferred. These are reindexing and quotient consequences
of the weighted form and the preceding adjunction identity (Hatcher, §2.2, pp. 140–141;
SGA 7 I, Exposé IX, 10.2.6–10.2.8 and 12.5).

**Checks.**

- Swapping two parallel edges of equal thickness gives an isometry, acting by `−1` on
  their rank-one cycle lattice and component group.
- A bijection changing thickness `2` to `3` on a loop is not a matching: its discriminant
  groups have different orders.
- Matching actions away from one place gives no comparison at that place; composing
  matchings retains the union of their exceptional sets.

### 4.3 The integral monodromy pairing

Let `R` be henselian and `A` semistable, with toric character lattices `X_A := X^*(T_A)` and
`X_{A^∨} := X^*(T_{A^∨})` (2.4 applied to `A` and its dual). Construct
`IntegralMonodromyPairing`, the bilinear map `u : X_{A^∨} × X_A → ℤ` obtained from the valuation
of the trivialisation of the Poincaré biextension on the Raynaud extensions (Raynaud 1994,
§4.3, pp. 308–309, for positive residue characteristic, and Faltings–Chai III
Corollary 7.3 and §8, pp. 77–78, in all residue characteristics, for the valuation
construction over the completion; descent to the henselian
trait is part of this target; SGA 7 I, Exposé IX, Theorem 10.4, p. 444, for an integral
pairing defined from monodromy). Prove
`NeronMonodromy.bilinear`, `adjoint` (`u♯ : X_{A^∨} → Hom(X_A, ℤ)`), `non_degenerate` (`u♯` is
injective with finite cokernel), `dual_symmetry` (the pairing of `A^∨` is the transpose of that
of `A` under biduality), `polarized_symmetric` and `polarized_positive` (for a polarisation
`λ : A → A^∨`, its contravariant map is `λ^* : X_{A^∨} → X_A`, and
`(x, y) ↦ u(x, λ^* y)` on `X_{A^∨}` is symmetric and positive definite over `ℝ`; no
integral unimodularity is asserted), `prime_to_residue_inertia` (the formula below),
`prime_adic` (comparison with the Weil-pairing monodromy construction for `ℓ ≠ char k`
and with the `p`-divisible-group construction at the residue prime),
`basechange` (a base change of ramification index `e` multiplies `u` by `e` under the identity
torus comparison of 3.3), `functorial` (for `f : A → B`, `y ∈ X_{A^∨}` and `x ∈ X_B`,
`u_A(y, f^* x) = u_B((f^∨)^* y, x)`) and `zero_torus` (zero lattices give the zero pairing with
zero cokernel). Define the lattice-level objects `LatticePairing.adjoint`,
`componentGroup` (the cokernel of `u♯`) and `rankOne n`, the pairing `(y, x) ↦ n·x·y` on
`ℤ × ℤ`. These light definitions inherit the additive and scalar-multiplication
API of Mathlib's `LinearMap`, `Module.Dual` and `Submodule.Quotient`: the adjoint
is the curried pairing itself, quotient classes have kernel `range(u♯)`, and
`rankOne n y x = n*y*x`. This last arithmetic definition permits `n = 0`, unlike
the finite discriminant-group contract of the symmetric integral-lattice supplier;
its coefficient is `n`, whereas that supplier's rank-one form has coefficient `2m`. *Needs:* 2.4, 3.13; `AbelianSchemesAndArithmeticModuli:A2` (dual abelian variety and Poincaré biextension),
A3 (finite flat torsion and Cartier duality), A4.5 (the full BT tower);
the dual `1`-motive data of 3.14; EtaleCohomologyFoundations §F.3a for the general-trait
inertia, twist and tame character, identified with the Galois and coefficient carriers of 3.5.

For `ℓ ≠ char k`, the dual `1`-motive identifies its period lattice
`Y` with `X_{A^∨}` and its torus character lattice with `X_A` (Raynaud 1994,
§2.4.1, p. 298). Let `β_ℓ : T_ℓ(A) → Y ⊗ ℤ_ℓ` be the quotient projection:
a torsion class represented by `(y, g)` with `ℓ^r g = u_Y(y)` maps to `y mod ℓ^r`,
where `u_Y : Y → G` is the period map (Raynaud, §3.1, p. 299). Use the continuous surjective
character supplied by EtaleCohomologyFoundations §F.3a. Its Kummer formula, after
strict henselisation and a choice of compatible roots of a uniformiser, is
`t_ℓ(σ) = (σ(π^{1/ℓ^r})/π^{1/ℓ^r})_r ∈ ℤ_ℓ(1)`.
Reduction and henselian lifting identify this twist with `PadicTateTwist ℓ K^sep` in the
Weil pairing. Conjugation is `t_ℓ(gσg⁻¹) = g·t_ℓ(σ)`, and under a finite separable trait
extension of ramification index `e` its restriction is `e·t'_ℓ`. Thus the formula below
and `basechange` carry the same valuation normalisation, including in residue characteristic
zero and over imperfect residue fields.
With `ι_ℓ : T_ℓ(T) → T_ℓ(A)` the toric inclusion, the positive valuation convention gives

```text
(σ − 1)v = ι_ℓ((u♯ ⊗ ℤ_ℓ)(β_ℓ(v)) ⊗ t_ℓ(σ)).
```

This is `prime_to_residue_inertia`: evaluate each torus character on the root of the
period, use its valuation to compute the Kummer ratio, and pass to the inverse limit
(Raynaud, §4.6, equation (7), p. 314, and Proposition 4.6.1, p. 315).
Inertia acts trivially on the toric term, so this formula also gives square-zero monodromy.
For a Tate curve with `q = π^n`, in the ordered toric/period basis the operator after a
choice of generator of `ℤ_ℓ(1)` is `[[0,n],[0,0]]`; at `n = 5` it sends `(0,1)` to `(5,0)`.
It is zero for `n = 0` algebraically, although that parameter has no multiplicative Tate
curve. The integral arithmetic operator sends `(a,b)` to `(n*b,0)`; prove its evaluation
formula and square-zero identity, with the zero, basis-image and nonzero/square-zero Checks
stated below.

Prove the signed comparison `prime_adic` in two parts. Write the Weil pairing additively
as `e_A : T_ℓ(A) × T_ℓ(A^∨) → ℤ_ℓ(1)`, with biduality convention
`e_{A^∨}(w,v) = -e_A(v,w)`. The toric duality from 3.14 gives

```text
e_{A^∨}(t,v) = evaluation(t,beta_ℓ(v)),   t ∈ T_ℓ(T_{A^∨}).
alpha_ℓ(v)(t) := e_A(v,t) = -evaluation(t,beta_ℓ(v)).
alpha_ℓ = -beta_ℓ : T_ℓ(A)/T_ℓ(G) ≅ Y ⊗ ℤ_ℓ.
N(v) = iota_ℓ((u♯ ⊗ ℤ_ℓ)(beta_ℓ(v))) in T_ℓ(T)(-1).
u_Weil,ℓ := N ∘ alpha_ℓ⁻¹ = -(u♯ ⊗ ℤ_ℓ).
```

In the expression for `N`, untwist the toric inclusion:
`T_ℓ(T)(-1) = Hom(X_A,ℤ_ℓ)`. The preceding inertia formula still uses `beta_ℓ` and the
positive Kummer character; replacing `beta_ℓ` by `alpha_ℓ` also replaces `u♯` by `-u♯`.
Derive `alpha_ℓ = -beta_ℓ` at finite torsion level from the evaluation duality and biduality,
then pass to the limit (Faltings–Chai III Corollary 7.4, p. 77). This explains the negative
polarised form in Illusie, formulas (4.3)–(4.11), pp. 94–95, Theorem 4.1 and footnote 12,
p. 95: his Weil quotient and the positive period quotient have opposite orientations.
Both twists and the order of the pairing are essential. In the ordered toric/period basis,
`e((a,b),(c,d)) = ad-bc`, so `alpha(a,b) = -b` while `beta(a,b) = b`.
Prove the corresponding coordinate identities: `beta(v) = v.2`, `alpha = -beta`,
`N(a,b) = (-n*alpha(a,b),0)`, additivity of the displayed Weil form in either input,
and `e(v,w) = -e(w,v)` for all `v,w` in `ℤ × ℤ`. These are arithmetic identities in
the displayed coordinate form; the geometric Tate-module and pairing comparisons are the
targets above.

At `p = char k > 0`, use `prime_adic_finite_flat`, not the tame inertia formula. For each
`m = p^r`, `r ≥ 1`, use the toric, finite and quotient pieces of the finite flat torsion
and their Cartier-dual partial extensions from `FiniteFlatToricFiltration` and `FiniteFlatOrthogonality` in 3.5–3.6.
The generic three-step extension has
an obstruction class in the quotient of generic extensions by integral extensions.
On strict henselisation its character pushouts lie in
`H¹(K,μ_m)/H¹(R,μ_m) ≅ (K^×/(K^×)^m)/(R^×/(R^×)^m) ≅ ℤ/mℤ`, where the last map is
`ord_π mod m`. This is fppf Kummer cohomology even in equal characteristic `p`; it does not
replace `μ_m` by its geometric points. SGA 7 I, Exposé IX, Lemma 9.4.3,
Corollary 9.4.4 and (9.4.5), pp. 428–430, constructs this obstruction and its valuation map;
§§9.5–9.6, formulas (9.5.4)–(9.5.5), pp. 433–438, applies it to the filtered torsion.

The levelwise comparison target is explicit: with the **period** quotient, the obstruction
on `y ⊗ x` is `u(y,x) mod m`; with the Weil quotient it is `-u(y,x) mod m`.
Prove it by representing the generic torsion as the pullback of `[m] : G_K → G_K` along
`iota : Y → G_K`. Push out the **torus part** by `x`, keeping its extension of `B` and its Poincaré line.
The points in `B` and `B^∨` extend over `R` by properness; their Poincaré line is an
invertible `R`-module. Choose an integral generator and express the period trivialisation
as a nonzero scalar in `K`; changing the generator multiplies it by a unit. Dividing
by the integral partial extensions therefore gives its Kummer class modulo units.
This step does not assume that `x` extends to a character of `G`. Its image is its valuation
modulo `m` (Faltings–Chai III Corollary 7.3, p. 77). Cartier duality supplies the evaluation
identification of the quotient, and switching to `alpha = -beta` supplies the same minus sign
as above. Prove `prime_adic_transition` under reduction `ℤ/p^{r+1} → ℤ/p^r`; taking the
inverse limit gives `u_period,p = u♯ ⊗ ℤ_p` and `u_Weil,p = -u♯ ⊗ ℤ_p`.
The comparison uses finite flat group schemes in equal characteristic, and Barsotti–Tate
systems in mixed characteristic. It does not assert an isomorphism from the full Tate module
of geometric points in characteristic `p` to those systems.

Prove `henselian_valuation_descent`: these integral maps, initially computed over the
completion and a splitting étale cover, define a unique residue-Galois-equivariant pairing
on the original henselian trait. Construct the finite-level obstruction there by §9.4,
descend it using §9.4.6, p. 430, and compare after completion, which preserves the residue
field, units-versus-valuation quotient and the normalisation `ord(π)=1`.
All reductions of the completed integral pairing therefore agree with the original
finite-level maps. They determine its integral coefficients uniquely, and the uniqueness
makes it Galois equivariant and independent of the splitting cover. This descends the
pairing; it does not require an algebraic period lattice in `G(K)` over an incomplete `K`.
For `char k = 0`, all primes use the prime-to-residue construction and the all-characteristic
formal comparison of 3.13–3.14. The finite-level Kummer valuation argument also works for
arbitrary `m > 0` there. Faltings–Chai II §§1–3, pp. 33–37, and III §8, pp. 77–78,
supply this completed comparison. The resulting all-prime integral map has the
non-degeneracy and functoriality asserted by SGA 7 IX, Theorem 10.4, p. 444, with its sign
translated as above.

**Checks.**

- `tate_test` — for a split Tate curve with `ord(q) = n`, the self-dual rank-one pairing is
  multiplication by `n`; composing with the polarisation `[m]`, `m > 0`, gives the form
  `[mn]` on `X_{A^∨}`, with value `mn > 0` at `(1, 1)`.
- `ramification_test` — a base change of ramification index `e` changes the Tate pairing from
  `n` to `en`.
- `weil_sign_test` — at `n = 5`, `e((1,0),(0,1)) = 1` and
  `e((0,1),(1,0)) = -1`; `beta(0,1) = 1`, `alpha(0,1) = -1`, while
  `N(0,1) = (5,0)`. Thus the period map is `[5]` and the Weil-coordinate map is `[-5]`.
  At `(2,3)` the quotients are `beta = 3`, `alpha = -3`, and both kill `(0,0)`.
  At `n = 1,2` the same sign remains, and at `n = 0` both operators are zero.
  The two-term Weil values at `(2,3),(5,-7)` and in reverse order are `-29` and `29`;
  an equal pair or a zero vector gives zero.
- `coefficient_two_test` — the levelwise period class for valuation `5` is `1` in `ℤ/4`,
  whereas the Weil class is `3`; both reduce to `1` in `ℤ/2`. Testing only mod `2`
  would miss the sign. At level `1` both classes vanish. This computation uses the
  valuation quotient of fppf Kummer classes, also for `k = 𝔽₂`.
- Adjoint orientation — on `X = Y = ℤ²`, set
  `u(y,x) = y₁x₁ + 2y₁x₂ + 3y₂x₂`. Its adjoint at `y = (1,0)` evaluates
  to `2` on `x = (0,1)`; the transpose evaluates to `0`. Thus an adjoint that
  silently exchanges the two lattices fails even though symmetric rank-one tests pass.
- `good_test` (degenerate) — good reduction has zero lattices and the zero pairing, not a
  positive-rank pairing. The adjoint is `y ↦ (x ↦ u(y, x))`: for `rankOne 5`,
  evaluating at `y = 1`, `x = 2` gives `10`; `rankOne 1` gives the ordinary product,
  whereas `rankOne 0` is degenerate and has infinite cokernel.

### 4.4 The graph formula for the monodromy pairing of a Jacobian

Under the standing curve hypotheses with `X` projective, prove `GraphMonodromy`: under the
autoduality of the Jacobian and the isomorphism of 4.2, the pairing `u` on `H₁(Γ, ℤ)` is
`u(c, d) = Σ_e c_e d_e`, the edge form with all edge lengths `1`; reversing an edge changes the
sign of both coordinates and preserves the form (SGA 7 I, Exposé IX, 12.4–12.5, pp. 473–475).
For a stable model whose node is `xy = π^m` with `m > 1` the regular resolution replaces the
node by a chain of `m − 1` rational curves, and the formula holds with edge length `m`; this
weighted form is derived through the subdivision comparison with the regular model
(StableReduction Layer 4). The weighted graph of 4.2 packages these endpoints and positive
thicknesses; the formula
identifies its `WeightedGraph.gram` on its ordinary `H1` with `u`. For a supplied bipartite
fibre identification the same statement uses the double and its joint kernel. Integral
`Matching` isometries and adjoint pairs transport this identification with their induced
component maps. In Lean the ambient weighted form is `DualGraph.edgeForm len`, with
`edgeForm_symm` and `edgeForm_neg_coord`. *Needs:* 4.2, 3.9, 4.3; StableReduction Layer 4.

**Checks.**

- A single loop of length `n` has pairing `[n]`; at length `5` the values on
  `(1, 1)` and `(1, 2)` are `5` and `10`, fixing bilinearity and the sign.
- A tree has zero cycle lattice and zero pairing; a zero edge length gives zero
  form, so positive edge lengths are needed for positive definiteness.
- Two vertices joined by two edges of lengths `a` and `b` have pairing `[a + b]` on the
  rank-one cycle lattice. A single length-`5` coordinate with coefficients `1` and
  `−1` gives `−5`; reversing both coefficients still gives `−5`, whereas reversing
  just one gives `5`.

### 4.5 The component group as the cokernel of the monodromy map

Let `R` be henselian and `A` semistable. Prove `ComponentCokernel`: the finite cokernel of
`u♯ : X_{A^∨} → Hom(X_A, ℤ)`, with its residue Galois action, is canonically `Φ_A(k̄)` as a
Galois module, hence `Φ_A` as a finite étale `k`-group; for every prime `ℓ` its `ℓ`-primary part
is the cokernel of `u♯ ⊗ ℤ_ℓ`, with the `p`-divisible-group description at the residue prime
(SGA 7 I, Exposé IX, Theorem 11.5, Remark 11.5.2(b) and the opening of 11.6, pp. 455–456). The
integral statement is the target; a rational isomorphism of lattices says nothing about `Φ`.
For a Jacobian with the graph identification of 4.4 this identifies `Φ_J(k̄)` with
`WeightedGraph.componentGroup`, including its adjoint-induced endomorphisms. A bipartite
double computes this group only with an identification of that double with the geometric
fibre graph. *Needs:* 2.2, 4.3; 4.2–4.4 for the graph specialization.

**Checks.**

- For the Tate pairing `[n]` the cokernel is `ℤ/n`;
  for `n = 0` the cokernel is `ℤ`, infinite, so
  nondegeneracy is a genuine hypothesis.
- For `n = 1` the cokernel is trivial.
- An integral adjoint of index `n > 0` has cokernel of order `n`; the index alone does not
  determine its group structure. In rank one the cokernel is `ℤ/n`.
- For `u♯ = 2 I₂`, the cokernel is `(ℤ/2)²`, of order `4`, and every element is killed by `2`.
  For `diag(1,4)` the cokernel is `ℤ/4`, also of order `4`, with an element of order `4`.
  Both pairings are symmetric positive definite and rationally invertible. The product of
  two split Tate curves of valuation `2` realises the first case. These quotients use
  Mathlib's existing PID module theory; `AddSubgroup.index_eq_card` identifies order with index.

### 4.6 Grothendieck's pairing on component groups

Construct `ComponentPairing`: the canonical pairing `Φ_A × Φ_{A^∨} → ℚ/ℤ` defined by the
obstruction to extending the Poincaré biextension to the Néron models (SGA 7 I, Exposé IX,
§§1.2–1.3, pp. 323–324). For semistable `A`, prove that it equals the positive inverse
pairing induced by the valuation form `u` on the two cokernels of 4.5 and is therefore
perfect (Werner 1997, §§3–5, pp. 209–214, Proposition 5.1, pp. 213–214; SGA 7 I,
Exposé IX, §11.4 and Theorem 11.5, pp. 454–455, give the cokernel pairing). Prove `NeronComponentPairing.bilinear`, `galois` (residue Galois
equivariance), `dual` (the pairing of `A^∨` is the transpose), `perfect_semistable`,
`discriminant` (identify the obstruction pairing with the positive inverse pairing
using the character and biduality identifications of 4.3), `independent_lifts` (changing a representative by an element of the image of `u♯`
changes the rational value by an integer), `zero_left`, `zero_right`, `functorial`
(`⟨f_* a, b⟩_B = ⟨a, (f^∨)_* b⟩_A`) and `good` (good reduction has the zero pairing on zero
groups). Perfectness beyond the semistable case is not asserted. At the lattice level construct `LatticePairing.discriminantPairing` for finite free
`ℤ`-modules `X,Y`, an integral pairing `u : Y →ₗ[ℤ] X →ₗ[ℤ] ℤ`, an injective adjoint
`u♯` and finite cokernel. Its intended signature is
`componentGroup u →+ (componentGroup u.flip →+ AddCircle (1 : ℚ))`, where the second
cokernel uses the transpose and no symmetry of `u` is assumed. This construction and
its comparison are README targets. Its defining evaluation theorem is
`discriminantPairing_mk`: if `u♯ y = m a` with `m ≠ 0`, the value on the specified functional
classes `[a], [b]` is `b(y)/m` modulo `ℤ`. The rank-one classes `rankOneClass n r` and
`rankOneDualClass n s` are the classes of the functionals `x ↦ r x` and `y ↦ s y`; their API gives zero
at representative zero, equality after adding `n`, and nonvanishing of the class of
`1` for `n > 1`, using Mathlib's quotient operations. In particular,
`discriminantPairing_rankOne` gives `rs/n` for `n > 0`;
`discriminantPairing_zero_left` and `zero_right` state vanishing on either zero class.
`LatticePairing.exists_discriminantPairing` states existence of the biadditive pairing with
this evaluation formula and bijective adjoint maps in both directions.
`LatticePairing.discriminantPairing_perfect` states perfectness of the chosen pairing.
These statements use the same injectivity and finite-cokernel hypotheses. *Needs:* 4.3, 4.5.

The sign is fixed by Werner’s comparison, not by Theorem 11.5 alone. In Werner’s
notation, the positive valuation form gives a Yoneda class map `σ`, and the connecting
map `τ` from `0 → ℤ → ℚ → ℚ/ℤ → 0` turns `σ` into the positive inverse pairing
(§4, p. 212). Passing from Yoneda extensions to the injective-resolution convention
for the obstruction introduces `−τ` (Werner §4, pp. 212–213); the Poincaré linearisation
contributes the inverse torus character and hence `−σ` (Proposition 5.1, pp. 213–214).
Thus the obstruction is `(−τ)(−σ) = τσ`. Completion and strict henselisation preserve
the comparison (§2, pp. 207–209); equivariance descends it to the residue field.

**Checks.**

- `tate_test` — on the specified rank-one classes both the lattice and obstruction values
  are `rs/n` modulo `ℤ`.
  At `n = 5`, `(r, s) = (1, 1)` gives `1/5` and `(1, 2)` gives `2/5`; the negative and zero
  forms fail these two tests.
- `lift_test` — replacing `r` by `r + n` changes `rs/n` by the integer `s`.
- `n1_test` (degenerate) — for `n = 1` both groups and the pairing are zero.
- `class_test` — in either rank-one cokernel the class of `0` is zero, adding `n` to a
  representative preserves its class, and the class of `1` at modulus `5` is nonzero.
  These distinguish the chosen quotient representatives from arbitrary existential classes.

### 4.7 The intersection-matrix description of the component group

Let `R` be strictly henselian with algebraically closed residue field, `X` a regular proper flat
curve over `R` with smooth geometrically connected generic fibre, `f_*𝒪_X = 𝒪_R`, special-fibre
components `C_v` with multiplicities `m_v` of greatest common divisor `1`, and intersection matrix
`I`. Prove `IntersectionComponentQuotient`: the component group `Φ_J(k)` of the Jacobian is the
finite group `ker(d : ℤ^V → ℤ) / im(I)` with `d(a) = Σ_v m_v a_v` (SGA 7 I, Exposé IX,
Theorem 12.1(a)–(d), pp. 465–467, with `d = d^t = 1` from the hypotheses), and that for reduced
nodal fibres this is `WeightedGraph.componentGroup` of the graph in 4.4, compatibly
with its adjoint-induced maps. Passing to a bipartite double requires a geometric graph
identification; arbitrary intersection graphs are retained as ordinary weighted graphs.
The numerical side is StableReduction
Layer 6's numerical Picard group `TauCeti.NumericalType.Pic` with its degree map
`TauCeti.NumericalType.degree` (the quotient by the rows `a_{ij}/w_j` of the weighted
intersection matrix): the target is the comparison of the kernel of the degree map with `Φ_J(k)`,
through the degree-zero part of the general Picard quotient `P/E` of SGA 7 I,
Exposé IX, Theorem 12.1(b)–(d), pp. 466–467. Prove `RegularPicardNeronQuotient` here under
these regular, possibly nonreduced-fibre hypotheses: `E` is the schematic closure of the
identity in the relative Picard scheme `P`, and the kernel of the degree map on `P/E` is the
Néron model of `J`. The semistable identity comparison 3.9 alone does not supply this
nonreduced case. The multiplicity relation `I·m = 0` and connectedness give
finiteness, which is not a formal consequence of the quotient syntax. Fibres whose multiplicities
have greatest common divisor greater than one are not treated here. *Needs:* 2.2;
AlgebraicModuliForArithmeticGeometry §§7.3, 7.6.1 and 7.9;
ComplexComparisonPartII §C3.2d.2 (relative Picard representability);
StableReduction Layer 6; Tau Ceti `NumericalType.Pic`, `NumericalType.degree`.

**Checks.**

- A tree of reduced components gives the trivial group.
- A cycle of `n` reduced components gives `ℤ/n`; two components meeting in two points give
  `ℤ/2`.
- The `I₀*` configuration (five components, central multiplicity `2`) gives `(ℤ/2)²`, matching
  2.8; a computation ignoring the multiplicities would give the wrong group.

### 4.8 The one-node hyperelliptic curve

Let `char K ≠ 2`, `g ≥ 1`, and `f(x, y)` a binary form of degree `2g + 2` over `K` with nonzero
discriminant and leading coefficient `f₀ ≠ 0`. Construct `BgwSmoothHyperellipticModel`, the
weighted projective curve `C : z² = f(x, y)` in `ℙ(1, 1, g + 1)`, and prove that it is smooth,
projective and geometrically integral of genus `g`, with a degree-two map to `ℙ¹` whose
infinity fibre is the quadratic étale algebra `D = K[s]/(s² − f₀)` (Bhargava–Gross–Wang,
§3, pp. 9–10). Construct the weighted projective scheme by its graded `Proj`, or equivalently
the cone over the rational normal curve and its quadric section avoiding the vertex. On the
two base charts the separability of `f` gives smoothness; the double cover and its branch
divisor give the genus. This construction includes unpointed genus one. AlgebraicCurves
Layer 10 supplies only the `g ≥ 2` function-field equation and genus comparison.
*Needs:* Mathlib `AlgebraicGeometry.Proj`; AlgebraicCurves Layers 7 and 10 (separable
double-cover genus and the `g ≥ 2` function-field comparison).

**Checks.**

- At `g = 1`, `f = x⁴ − y⁴` over `ℚ` gives a genus-one curve with split infinity.
- At `g = 1`, `f = −x⁴ − y⁴` over `ℝ` gives a genus-one curve with conjugate infinity
  and no real points; the construction requires no rational point.
- At `g = 2`, `f = x⁶ − y⁶` over `ℚ` gives a genus-two curve and the same function field
  as AlgebraicCurves Layer 10's double-cover model.

Define `BgwNodalPinch`, the curve
`C_m : z² = y² f(x, y)` in `ℙ(1, 1, g + 2)`, and prove that `C_m` is a proper geometrically
integral curve of arithmetic genus `g + 1` whose unique singular point `[1 : 0 : 0]` is an
ordinary node with branches conjugate over `D`, that `C → C_m`, `[x : y : w] ↦ [x : y : yw]`, is
the normalisation, an isomorphism away from the node, and that it identifies the two points at
infinity (Bhargava–Gross–Wang, §3, pp. 9–10). The curve is given by its equation; the general
pushout construction that identifies a finite subscheme to a point is NeronModels Part II's
Ferrand pinching, and the genus computation here is by the equation. *Needs:*
`BgwSmoothHyperellipticModel`; StableReduction Layer 1 (nodes and normalisation).

**Checks.**

- If `f₀` is a square, `D = K × K` and the two branches are rational; the split case is not a
  field extension.
- The arithmetic genus of `C_m` is `g + 1`, one more than that of `C`.
- Away from `[1 : 0 : 0]` the normalisation map is an isomorphism.

### 4.9 The generalised Jacobian of the one-node curve

With `J = Pic⁰(C)` and `J_m = Pic⁰(C_m)`, prove `BgwGeneralizedJacobian`: there is an exact
sequence of fppf group schemes `0 → (Res_{D/K} 𝔾_m)/𝔾_m → J_m → J → 0`, and the torus is
canonically the norm-one torus `R¹_{D/K} 𝔾_m` of ReductiveGroupsPartII RG2.0a (`NormTorus.normOne`)
(Bhargava–Gross–Wang, §3, pp. 10–11). The sequence is 4.1 descended to `K` along the quadratic
algebra, and the identification of the quotient torus uses `a/b ↦ a/σ(a)` under the quadratic
involution; the statement is an isomorphism of group schemes, not merely a surjection on
`K`-points. Points of `J(K)` may have a Picard–Brauer obstruction. Every point of `J_m(K)`
is represented by a line bundle on `C_m`: its rational node `Q = [1 : 0 : 0]` supplies a
section and rigidifies the Picard functor. The boundary `J(K) → H¹(K,T)` recovers the
obstruction for `J` (Bhargava–Gross–Wang, §3, pp. 10–11;
SchemeAndStackFoundations §3.6). *Needs:*
4.1, 4.8; ReductiveGroupsPartII RG2.0a (norm-one tori and Weil restriction);
SchemeAndStackFoundations §3.6.

**Checks.**

- For split `D` the torus is `𝔾_m`; for nonsplit `D` it is the nonsplit one-dimensional torus,
  the quadratic twist of `𝔾_m`.
- On `K`-points the sequence is exact on the left and in the middle, and the cokernel on the
  right is controlled by `H¹(K, R¹_{D/K} 𝔾_m) = K^×/N(D^×)` (Hilbert 90 for the norm-one torus).
- `J_m` has dimension `g + 1` and `J` dimension `g`.
- For `f = −x⁴ − y⁴` over `ℝ`, the smooth curve has no real point but `C_m` has the
  real node `Q`; every real point of `J_m` is still represented by a real line bundle.

### 4.10 Two-torsion of the one-node curve

Let `L = K[t]/(f(t, 1)/f₀)`, an étale algebra of degree `2g + 2`. Prove `BgwTwoTorsion`:
`J_m[2] ≅ ker(N : Res_{L/K} μ₂ → μ₂)` and `J[2]` is that kernel modulo the diagonal `μ₂`, as
finite étale group schemes over `K`; the geometric orders are `2^{2g+1}` and `2^{2g}`; geometric
points of `J[2]` correspond to even-cardinality subsets of the roots of `f` modulo complement,
and a `K`-rational point of `J[2]` may come from a subset that is Galois-stable as an unordered
pair of complementary subsets without either being `K`-rational (Bhargava–Gross–Wang, §3,
Proposition 22, p. 11; divisor proof p. 12). Galois fixed points do not commute with the
quotient by `μ₂`. *Needs:* 4.9; `ArithmeticGaloisRepresentations:§§6.1–6.2`,
`AbelianSchemesAndArithmeticModuli:A3` (torsion and the Weil pairing).

**Checks.**

- For `g = 1` the geometric orders are `8` and `4`.
- The diagonal `μ₂` is nontrivial and is divided out only for `J[2]`, not for `J_m[2]`.
- A quadratic factorisation `f = f₁ f₂` with `f₁, f₂` conjugate over a quadratic extension gives
  a nonzero `K`-rational point of `J[2]` when the conjugate factors have positive even degree;
  neither chosen factor need be defined over `K`. Odd-degree factors instead give points
  of the torsor of 4.11.

### 4.11 Odd-factor torsors

Let `d` be the class of the hyperelliptic line bundle of degree `2`. Prove `BgwOddFactorTorsors`:
`Pic_{C/K}/ℤd = J ⊔ J¹` with `J¹` the degree-one component, a `J`-torsor (SchemeAndStackFoundations
§3.6, Picard torsors without a rational point), and likewise for `C_m`; `W[2] := {c ∈ Pic¹_{C/K} : 2c = d}` (equivalently the zero fibre of
`[2] : J¹ → J` in the quotient by `ℤd`) is a `J[2]`-torsor, and `W_m[2]` a `J_m[2]`-torsor; `W_m[2](K)`
corresponds to odd-degree factors of `f` over `K`, whereas `W[2](K)` corresponds to odd unordered
factorisations including pairs of factors conjugate over a quadratic extension
(Bhargava–Gross–Wang, §3, Proposition 22(3)–(4), p. 11). A torsor without a `K`-point has no
zero element and is not a group. *Needs:* 4.10; SchemeAndStackFoundations §3.6.

**Checks.**

- The geometric cardinalities of `W[2]` and `W_m[2]` are those of `J[2]` and `J_m[2]`.
- If `f` has a `K`-rational root then `W_m[2](K)` is nonempty; if `f` is irreducible over `K`
  (of even degree `2g + 2`), `W_m[2](K)` is empty.
- An odd factorisation into two conjugate factors gives a point of `W[2](K)` not in the image
  of `W_m[2](K)`.

### 4.12 The connecting class of the two-torsion sequence

Prove `BgwBoundaryCupProduct`: the exact sequence `0 → μ₂ → J_m[2] → J[2] → 0` has connecting
map `H¹(K, J[2]) → H²(K, μ₂) = Br(K)[2]` equal, under the Weil self-duality of `J[2]`, to the cup
product with the class of the torsor `W[2]`; its kernel is the image of `H¹(K, J_m[2])`
(Bhargava–Gross–Wang, end of §3, p. 12, citing Poonen–Schaefer, Proposition 10.3;
the statement is on pp. 18–19 of their author manuscript of 10 February 1997,
with the cocycle comparison proved on pp. 19–20). The connecting class is not represented by a rational divisor without the Brauer
obstruction of SchemeAndStackFoundations §3.6. *Needs:* 4.10, 4.11; Mathlib `BrauerGroup`, cup products in Galois
cohomology (ProfiniteCohomology Layer 8); SchemeAndStackFoundations §3.6.

**Checks.**

- If `W[2]` is a trivial torsor, the connecting map is zero and
  `H¹(K, J_m[2]) → H¹(K, J[2])` is surjective.
- If `C` has a `K`-rational Weierstrass point, `W[2]` is trivial.
- The connecting map lands in `Br(K)[2]`; for split `D = K × K`, splitting the torus
  does not by itself trivialise `W[2]` or this boundary. The Picard–Brauer obstruction killed
  over `D` (SchemeAndStackFoundations §3.6) is a different map.

### 4.13 The Picard scheme of a stable family

Let `S` be an integral Noetherian scheme and `X → S` a stable curve of genus `g > 1`
(StableReduction Layer 3; the moduli of stable curves is SchemeAndStackFoundations §4.15). Prove
`StableFamilyPicard`: the fibrewise identity component `Pic⁰_{X/S}` is a smooth separated
semi-abelian group scheme over `S` (Yuan, §3.1.3 and Lemma 3.4, pp. 43–44, citing
Bosch–Lütkebohmert–Raynaud, §9.4, Theorem 1, p. 259). The total space need not be regular, unlike in 3.9,
and the base is not Dedekind: Picard representability and the identity-component criterion are
ComplexComparisonPartII §C3.2d.2 and §§C3.2f.1–C3.2f.2, and
the semi-abelian structure of the geometric fibres follows from 4.1. Here semi-abelian means
fibrewise: the toric rank can jump, so a single global extension by an `S`-torus of constant
rank is not required. *Needs:* 4.1; AlgebraicModuliForArithmeticGeometry §7.6.1;
ComplexComparisonPartII §C3.2d.2 and §§C3.2f.1–C3.2f.2; StableReduction Layer 3.

**Checks.**

- A stable nodal family `xy = π^m` with `m > 1` has singular total space and still satisfies the
  statement; it is not a model to which 3.9 applies.
- Over a point `s` with smooth fibre `Pic⁰_{X_s}` is the Jacobian.
- Over a point with a one-node irreducible fibre the fibre of `Pic⁰_{X/S}` has toric rank `1`;
  a smoothing can have generic toric rank `0`, refuting a definition requiring a global torus
  of constant rank.

### 4.14 Semistable torsion with commuting coefficient actions

**The torsion datum and specialization laws.** Define `SemistableTorsionDatum` over an
arbitrary commutative ring `𝕋`, a prime `ℓ`, a henselian discrete valuation field `K`
of residue characteristic different from `ℓ`, and a finite weighted graph `G` as in 4.2.
Its data are a finite `𝔽_ℓ`-module `T`, a ring action `𝕋 →+* End_𝔽_ℓ(T)`, a continuous
Galois action factoring through a finite Galois extension and commuting with `𝕋`,
`𝕋`-stable subgroups `Tᵗ ⊆ T⁰ ⊆ Tᶠ ⊆ T`, a finite `𝔽_ℓ`-module `U` with
commuting coefficient and residue-Galois actions, an `𝔽_ℓ`-linear map `T⁰ → U`, an isomorphism
`Tᵗ ≅ Hom_ℤ(G.H1, μ_ℓ(K̄))`, and an additive specialization homomorphism
`sp : T^I → G.componentGroup`. Include a residue-Galois action on `G.H1` preserving
its Gram form, and commuting coefficient actions on the character lattice and its
adjoint-induced component quotient; the displayed isomorphism carries
the corresponding contragredient character action. The toric identification is naturally
twisted: a chosen primitive root identifies its underlying group with
`Hom_ℤ(G.H1, 𝔽_ℓ)`, but the cyclotomic Galois action remains. The ordinary graph, or a
geometrically identified bipartite presentation, is part of the datum's parameters.

Define a separate Prop structure `SemistableTorsionLaws` asserting that `Tᶠ = T^I`,
`ker sp = T⁰`, `image sp = (G.componentGroup)[ℓ]`, and `sp` is Hecke- and
residue-Galois-equivariant. Its toric isomorphism is decomposition-equivariant and
`0 → Tᵗ → T⁰ → U → 0` is exact and equivariant for the decomposition group and
coefficient action. The geometric realization identifies `U` with the `ℓ`-torsion of
the abelian quotient of the identity fibre. Thus `0 → T⁰ → T^I → Φ[ℓ] → 0` is exact,
with `Φ = G.componentGroup`.
Here `Tᶠ` refers to the finite part of the full Néron torsion kernel; `T⁰` is the
finite part of identity-model torsion constructed in 3.5. At finite level the two
can differ by `Φ[ℓ]`. Prove functoriality for homomorphisms with the corresponding
monodromy adjoints and compatibility with changing the finite extension through which
the action factors. These targets use Conrad, §5, exact sequence (5.1), Lemma 5.2,
Remark 5.3 and the finite flat subgroups preceding Lemma 5.4, pp. 17–18, and
SGA 7 I, Exposé IX, §§9.6, 11.5–11.6. *Needs:* 2.1–2.4, 3.5–3.6, 4.2–4.5;
ArithmeticGaloisRepresentations §§2.1–2.1a, 6.1 for Galois and inertia actions;
AbelianSchemesAndArithmeticModuli A3 for torsion and quotient group schemes.

**Checks.**

- For good reduction of a positive-dimensional Jacobian, `G.H1 = Φ = Tᵗ = 0` and
  `T⁰ = Tᶠ = T`. Hence the kernel of `sp` is all of `T`, not the toric subgroup.
- For a split Tate curve with valuation `n > 0`, `Tᵗ = T⁰ = μ_ℓ`, while
  `Tᶠ/T⁰ = (ℤ/n)[ℓ]`. If `ℓ ∣ n`, the invariant finite-level torsion has order `ℓ²`;
  if `ℓ ∤ n`, it has order `ℓ`. Reduction of invariant Tate modules alone misses this jump.
- For toric rank `1` and abelian rank `1`, `dim Tᵗ = 1`, `dim T⁰ = 3` and `dim T = 4`.
  The toric subgroup cannot be the specialization kernel in this mixed case.
- At the residue prime, geometric points and scheme ranks differ already for `μ_p`;
  this point-module datum requires `ℓ ≠ char k`, whereas 3.5 retains finite flat group schemes.

**Frobenius and good-place laws.** Over finite residue field of cardinality `q_r`,
with a distinguished element `t_r ∈ 𝕋`, define the separate Prop structure
`SemistableTorsionFrobeniusLaws`: arithmetic Frobenius acts by `q_r t_r` on `Tᵗ`
and by `t_r` on `T/Tᵗ`. Its geometric realization requires totally toric reduction,
the identified action of `t_r` on the character and period lattices, and the equality
of the character-dual and period actions giving these two formulas. Under those
hypotheses derive the formulas from the torus twist and the Raynaud lattice quotient
of 3.13–3.14. They are extra operator comparisons, not consequences of semistability
for an arbitrary coefficient action. On `T^I/Tᵗ` the quotient formula follows by
restriction. The source for the modular comparison is Ribet–Stein, §3.9, Lemma 3.17,
pp. 46–47; the general torus and period description is Conrad, §5, Theorem 5.5,
pp. 18–20, and SGA 7 I, Exposé IX, §§9.6, 10.2.

For a global datum over a number field, define `SemistableTorsionGoodPlaceLaws` for
a finite set `S` containing the bad-reduction places and all places above `ℓ`,
relative to specified integral polynomials `P_v` at `v ∉ S`. The laws assert that
inertia is trivial and `P_v(F_v) = 0` on `T`; the geometric realization identifies
`P_v` with the actual good-fibre characteristic polynomial of 5.0b–5.0c. In a weight-two Hecke realization with
specified `t_v,s_v ∈ 𝕋` and the compatible geometric correspondence identity, its
Eichler–Shimura specialization is `F_v² − t_v F_v + N(v)s_v = 0` on `T`.
Trivial determinant character gives `s_v = 1`; it is not imposed on general coefficient
rings or characters. No Hecke realization or quadratic identity is inferred from a
bare ring action. The geometric correspondence comparison is supplied by each producer;
the good-reduction representation comparison is 5.0a–5.0c here (Ribet–Stein,
Chapter 5 by B. Conrad, Theorem 5.12, p. 73, and §5.3, Theorem 5.16,
pp. 74–75, for the Hecke normalization). *Needs:* 3.13–3.14,
4.14 specialization laws, 5.0a–5.0c; ArithmeticGaloisRepresentations §§2.1–2.2.

**Checks.**

- On split Tate torsion with `t_r = 1`, arithmetic Frobenius is `q_r` on `μ_ℓ`
  and `1` on the period quotient; geometric Frobenius gives the inverse factors.
- Choosing `t_r = 0` in the coefficient ring acting on nonzero toric torsion cannot
  satisfy the Frobenius laws: Frobenius is invertible. A bare action supplies no such laws.
- For good reduction, the specialization kernel can be nonzero with no torus;
  the general characteristic polynomial remains valid, while a quadratic Hecke polynomial
  requires a Hecke realization. A nontrivial diamond action retains `s_v`.
- A place above `ℓ` is excluded even when reduction is good; good reduction alone
  does not make the residual `ℓ`-torsion representation unramified there.

**Jacobian realization and two places.** Prove `SemistableJacobianTorsion`: for the
Jacobian of a proper regular semistable curve over a henselian DVR, with `ℓ ≠ char k`
and a commutative ring acting by endomorphisms defined over `K`, its geometric `ℓ`-torsion gives
`SemistableTorsionDatum` satisfying `SemistableTorsionLaws`. Use 4.4–4.5 to identify
its graph discriminant group, and the finite flat subgroups of 3.5 together with
the finite part of the full torsion kernel to produce
`Tᵗ ⊆ T⁰ ⊆ Tᶠ = T^I ⊆ T`. The geometric reduction map and the surjectivity of
multiplication by `ℓ` on the semi-abelian identity fibre give the specialization
sequence. Preserve the filtration under the coefficient action and the component
pairing and adjoints of 4.6. For a nonregular nodal model use its regular resolution
and the weighted subdivision comparison of 4.4. The Frobenius and good-place laws
hold with the additional operator hypotheses just specified. Sources: Conrad,
§5, (5.1), Remark 5.3, Lemma 5.4, pp. 17–18; SGA 7 I, Exposé IX, §§11.5–12.5.

Define `TwoPlaceSemistableTorsionDatum` for a number field and two distinct finite
places of residue characteristics different from `ℓ`: one global `T`, one coefficient
ring action and one finite-level Galois action, with the two local graphs, filtrations,
toric identifications and specialization maps. The separate Prop structure
`TwoPlaceSemistableTorsionLaws` requires the specialization laws at both places and
the shared global good-place laws relative to the specified `P_v`. Keep the local
Frobenius-law structures as additional hypotheses in the totally toric specialization
with the specified compatible operators. Prove `TwoPlaceSemistableJacobianTorsion` for one Jacobian
semistable at both places, by restricting its single global torsion representation.
The two projections recover the same `T` and actions, not merely isomorphic copies.
*Needs:* the preceding targets, 4.4–4.6, 5.0a–5.0c.

**Checks.**

- The same split Tate calculation gives `ker sp = Tᵗ` precisely in the totally toric
  case; a positive-dimensional abelian quotient contributes `2a` further kernel dimensions.
- At two good places both graph lattices vanish while the single global `T` remains;
  the two specialization maps are zero on their invariant groups.
- Ramification multiplying a graph pairing by `e` may change `Φ[ℓ]`; the new local
  datum uses the new cokernel and inertia group, while its underlying geometric torsion
  is the restriction of the same representation.

The producers are ModularCurvesPartII §12 (modular graph, with §13's actual Hecke
correspondences) and HilbertModularVarietiesAndShimuraCurves R18.5.17–R18.5.18
(quaternionic graph and monodromy). Their geometric and operator comparisons instantiate
these general targets. SerreWeightAndLevelOptimisation §§2.6–2.10 consumes the one-place
and two-place interfaces. These are downstream realizations and applications; this
roadmap takes none of them as a prerequisite.

### Examples

- For a regular model with special fibre two rational curves meeting in two points: toric rank
  `1`, pairing `[2]`, `Φ = ℤ/2` (4.2, 4.4, 4.5, 4.7).
- For a regular model whose special fibre is a tree of rational curves: cycle lattice `0`,
  `Pic⁰` of the fibre trivial, `Φ = 0`.
- `X₀(11)` over `ℤ_{11}`: its semistable modular model has special fibre two rational curves crossing at the
  two supersingular points `j = 1728` and `j = 0`, with thicknesses `2` and `3`; `H₁(Γ, ℤ) = ℤ`,
  the weighted edge form is `[2 + 3] = [5]`, and the component group of `J₀(11)` at `11` is
  `ℤ/5` (4.4, 4.5).

### Dependencies

Layers 1–3; FreeGroupsAndLimitGroups §2.2a (`SerreGraph.integralCycleBoundary`,
`SerreGraph.cycleLattice`, `SerreGraph.modTwoCycleSpace`, `SerreGraph.supportGraph`,
`SerreGraph.IsSpanningForest`, `SerreGraph.exists_spanningForest`, `SerreGraph.spanningForest_card`,
`SerreGraph.exists_forest_cycleBasis`, `SerreGraph.cycleLattice_modTwoEquiv`,
`SerreGraph.finrank_cycleLattice`, `SerreGraph.modTwoCycleSpace_finrank`); GraphConnectivityAndFlows §§1.1, 1.3, 8.1;
StableReduction Layers 1, 3, 4 and 6; AlgebraicModuliForArithmeticGeometry
§§7.3, 7.6.1 and 7.9; ComplexComparisonPartII §C3.2d.2 and §§C3.2f.1–C3.2f.2;
JacobianChallenge Layer D; `AbelianSchemesAndArithmeticModuli:A2–A3`;
ReductiveGroupsPartII RG2.0a; SchemeAndStackFoundations §3.6 and §4.15;
AlgebraicCurves Layer 10; ProfiniteCohomology Layer 8; Mathlib `BrauerGroup`.

## Layer 5: Tate modules, conductors and local factors

This layer turns the reduction theory into statements about the Galois representation on the
Tate module: the Néron–Ogg–Shafarevich criterion, isogeny invariance of good reduction, the
`p`-adic comparison for the residue prime, the conductor of an abelian variety, and the local
Euler polynomial with its full monodromy. Throughout `K` is the fraction field of a henselian
discrete valuation ring `R` with residue field `k`, `A` an abelian variety over `K` and `ℓ` a
prime; the statements that need a finite residue field, a complete `R` or `ℓ ≠ char k` say so.

### 5.0a Finite-étale specialization of abelian torsion

Let `R` be a henselian discrete valuation ring with fraction field `K` and residue
field `k`, and let `𝒜/R` be an abelian scheme. For every positive integer `n` invertible
in `R`, specialize the finite étale group scheme `𝒜[n]` using
`henselian_finiteEtale_equivalence` on the henselian pair `(R, 𝔪_R)`.
Construct the identification `A[n](K^sep) ≅ A_k[n](k^sep)` equivariantly for the
decomposition group, with inertia acting trivially on the special-fibre side.
For a prime `ℓ ≠ char k`, prove compatibility with the power-transition maps and
pass to the inverse limit to identify the generic and special geometric Tate modules.
Preserve homomorphisms, products, isogeny maps and the Weil pairing from
AbelianSchemesAndArithmeticModuli A3.1–A3.5 and A4.1
(Stacks, Lemma 15.13.2, tag 09ZL; Milne 2008, Ch. I, Theorem 7.2 and Remark 7.3;
Serre–Tate 1968, §1).
*Needs:* AbelianSchemesAndArithmeticModuli A3.1–A3.5, A4.1;
SchemeAndStackFoundations §§0.12–0.14, `henselian_finiteEtale_equivalence`.

**Checks.**

- For good elliptic reduction and `ℓ ≠ char k`, both geometric `ℓ^r`-torsion
  groups have `ℓ^{2r}` points; rational torsion need not have that cardinality.
- The identifications for `ℓ^r` and `ℓ^{r+1}` commute with multiplication by `ℓ`,
  so the inverse-limit identification respects the full Tate module and pairing.
- At residue characteristic `p`, the kernel of `[p]` need not be étale, and the
  finite-étale specialization argument cannot give a rank-two `T_p` for a
  supersingular elliptic special fibre.

### 5.0b Good reduction and the Frobenius polynomial

**Good reduction.** Let `K` be a nonarchimedean local field of residue characteristic `p`, `𝒜/O_K` an
abelian scheme with fibres `A`, `A_k`, and `ℓ ≠ p`. Use the supplied finite-étale specialization
`A[ℓ^n](K̄) ≅ A_k[ℓ^n](k̄)` of 5.0a to prove that `I_K` acts trivially and `T_ℓA ≅ T_ℓA_k`. Let `F` be a
number field, `v` a finite place with residue field `F_{q_v}` of characteristic `p`, `A` with good
reduction at `v` and `π_v` the `q_v`-Frobenius endomorphism of `A_v` (Tau Ceti's
`Isogeny.frobeniusIsogeny` for `g = 1`). Prove that `V_ℓA` is unramified at `v`, the arithmetic
`Frob_w` acts as `T_ℓπ_v`, and `P_v(V_ℓA, X)` is the supplied endomorphism polynomial of `π_v`:
AbelianSchemesAndArithmeticModuli A6.10–A6.11 give integer coefficients, degree `2g` and
`ℓ`-independence. Prove that this arithmetic Frobenius polynomial satisfies `X^{2g} P_v(q_v/X) = q_v^g P_v(X)`;
for `g = 1` with `WeierstrassCurve.HasGoodReduction`, `P_v = X² − a_v X + q_v` with `a_v` Tau Ceti's
`WeierstrassCurve.frobeniusTrace` of the reduction (Milne 2008, Ch. I, Prop. 10.20, p. 52, and Ch. IV,
Thm 3.5, p. 141). *Needs:* 5.0a; AbelianSchemesAndArithmeticModuli A3.2, A4.1, A6.10–A6.11;
ArithmeticGaloisRepresentations §6.1 (Tate-module representation);
NumberFieldArithmetic Layer 5; LocalFieldsRamification Layer 2.

**Checks.**

- Arithmetic Frobenius on `T_ℓA` corresponds to `π_v`; geometric Frobenius corresponds to `π_v⁻¹`.
- For an elliptic curve the constant term is `q_v`, not `q_v⁻¹`.
- The dimension-zero abelian variety has polynomial `1`.

### 5.0c The Euler factor at good reduction

For an abelian variety `A` of dimension `g` over a nonarchimedean local field
with residue cardinality `q_v`, good reduction and `ℓ ≠ char k`, prove
`TateModule.localEulerFactor A = T^{2g} P_v(V_ℓA, 1/T)`.
Here `P_v(V_ℓA, X)` is the arithmetic-Frobenius characteristic polynomial of 5.0b;
the supplied Euler factor is `det(1 − T Φ_v | H¹_ℓ(A)^{I_v})`, with
`H¹_ℓ(A) = V_ℓA^∨` and `Φ_v` geometric Frobenius, equivalently the arithmetic
Frobenius factor on homological coinvariants. Prove that this good-reduction
polynomial has integer coefficients, degree `2g` and is independent of `ℓ`
(Darmon–Diamond–Taylor 2007, §1.7, p. 46; Milne 2008, Ch. I, Prop. 10.20,
p. 52, and Ch. IV, Thm 3.5, p. 141).
*Needs:* 5.0b; ArithmeticGaloisRepresentations §2.5 and §6.3 **Local Euler factors**
(the generic definition and coinvariant convention).

**Checks.**

- `y² = x³ − x` at `5` has `L_5 = 1 + 2T + 5T²` for every `ℓ ≠ 5`.
- On `V_ℓA` rather than its dual the factor would be
  `1 + (2/5)T + (1/5)T² ∉ ℤ[T]`.
- In dimension zero the characteristic polynomial and Euler factor both equal `1`;
  reversing a degree-zero polynomial introduces no power of `T`.

### 5.1 Néron–Ogg–Shafarevich

Let `R` be excellent and henselian and `ℓ ≠ char k`. Prove `NeronOggShafarevich`: `A` has good reduction over
`R` (an abelian-scheme model, 1.8) if and only if the inertia group acts trivially on `T_ℓ(A)`
(Conrad, §4, discussion before Proposition 4.3, pp. 9–10; Theorem 5.8, pp. 20–22; SGA 7 I, Exposé IX,
Theorem 10.4, p. 444). Good reduction makes the prime-to-`char k` torsion finite étale over `R`,
hence unramified. Conversely an unramified action is unipotent, so `A` is semistable by 3.11; the
monodromy pairing of 4.3 is then zero: `β_ℓ` is surjective and `ι_ℓ` injective, and
EtaleCohomologyFoundations §F.3a's `tameCharacter_surjective` gives an inertia element
whose character generates the free rank-one `ℤ_ℓ(1)`. The inertia formula therefore forces
`u♯ ⊗ ℤ_ℓ = 0`, equivalently `u_Weil,ℓ = 0` in the signed comparison. Faithfulness of
`ℤ → ℤ_ℓ` on the free character lattices gives vanishing of the integral pairing.
Its nondegeneracy forces `t = 0`, and `A` has good
reduction by `toric_zero` of 3.1. The identification of the inertia operator of 3.7 with the
monodromy pairing of 4.3 is part of this target. The statement concerns the whole `ℓ`-adic
representation; triviality on one torsion level `A[N]` is a different hypothesis (3.12). For a
non-henselian excellent discrete valuation ring the good-reduction predicate descends from the
henselisation, and this descent is stated explicitly in 5.2. *Needs:* 1.8, 3.11, 4.3;
`ArithmeticGaloisRepresentations:§§6.1–6.2`; EtaleCohomologyFoundations §F.3a for the
arbitrary-trait inertia interface and tame-character surjectivity.

**Checks.**

- A split Tate curve has nontrivial inertia action on `T_ℓ` for every prime
  `ℓ ≠ char k` and bad reduction.
- For parameter `t` over `ℂ((t))`, this holds for every prime, since the valuation pairing
  is `[1]` and `t_ℓ` is surjective. Over `𝔽_p(s)((t))`, the same calculation applies for
  every `ℓ ≠ p`; the imperfect residue field changes neither the inertia interface nor
  the Kummer argument. Neither example requires residue finiteness or perfectness.
- For an elliptic curve with additive reduction and perfect residue field the inertia action
  on `T_ℓ`, `ℓ ≠ char k`, is not unipotent, so
  neither direction of the criterion is vacuous.
- (non-example) Unramified `A[N]` for one `N` does not imply good reduction. Over a complete
  discrete valuation ring with finite residue field and `N ≥ 3` prime to its characteristic,
  write `q = π^m u` with `u ∈ R^×`; the Tate curve `E_q` has unramified `N`-torsion exactly when
  `N ∣ m`. Indeed `R[X]/(X^N − u)` is finite étale, since `X` is a unit and `N` is invertible,
  so `u` acquires an `N`th root, and `μ_N` is defined, over a finite unramified extension;
  conversely an `N`th root of `q` in an unramified extension has integral valuation `m/N`. At `q = π^N` the root
  `π` already lies in `K`. At `K = ℚ₇`, `N = 3`, `q = 2·7³`, the unit `2` is not a cube modulo
  `7` (the cubes there are `0, 1, 6`), hence not a cube in `ℚ₇`, yet `X³ − 2` is irreducible and
  separable modulo `7`, so its root lies in the unramified cubic extension and `E_q[3]` is
  unramified. No such criterion is asserted when the residue characteristic divides `N`.

### 5.1a Potential good reduction

**Potential good reduction.** Prove that for `K` a nonarchimedean local field of residue
characteristic `p` and `ℓ ≠ p`, `ρ_{A,ℓ}(I_K)` is finite iff `A` has potential good reduction, and
then the image of inertia is independent of `ℓ` and `A` acquires good reduction over the fixed field
of the kernel of `I_K` on `A[m]` for any `m ≥ 3` prime to `p` (Serre–Tate 1968, §2, Thm 2, p. 496, and
its corollaries). Use 5.1 `NeronOggShafarevich`
(good reduction iff `T_ℓA` unramified, in every dimension) and 1.5's extension of homomorphisms
to Néron models; the target here is the potential-reduction and inertia consequence of those
criteria (Serre–Tate 1968, §1, Thm 1; §2, Thm 2 and corollaries). *Needs:* 1.5, 5.1; ArithmeticGaloisRepresentations §§6.1–6.2 (Tate-module and pairing adapters).

**Checks.**

- Good reduction gives trivial inertia image for every `ℓ ≠ p`.
- The Tate curve has infinite unipotent inertia image for every `ℓ ≠ p`, hence no potential
  good reduction.
- `y² = x³ − x` over `ℚ_2` has bad reduction and integral `j = 1728`, hence potential good
  reduction and finite inertia image; finite inertia is weaker than unramifiedness.

### 5.2 Good reduction is isogeny invariant

Let `R` be an excellent discrete valuation ring. Prove `GoodIsogeny`: isogenous abelian
varieties over `K` have good reduction over `R` simultaneously (Conrad, Proposition 4.1, pp. 8–9, and pp. 9–10). An isogeny induces an
isomorphism of the rational Tate modules `V_ℓ(A) ≅ V_ℓ(B)` even when `ℓ` divides its degree,
inertia acts trivially on the torsion-free lattice `T_ℓ(A)` if and only if it does on `V_ℓ(A)`,
and 5.1 applies; for a non-henselian `R` the abelian-scheme model descends from the henselisation
(fpqc descent of the proper smooth model and of its group law), which is part of this target.
*Needs:* 5.1; `ArithmeticGaloisRepresentations:§§6.1–6.2` (isogeny compatibility of Tate modules).

**Checks.**

- The Néron models of `A` and `B` are both abelian schemes, but the integral Tate lattices
  `T_ℓ(A)` and `T_ℓ(B)` are not identified when `ℓ` divides the degree.
- A `p`-power isogeny over a `p`-adic field is not an étale isomorphism of the integral models;
  the statement is about good reduction, not about isomorphism of models.
- Multiplication by `n ≠ 0` is an isogeny from `A` to itself. For `dim A > 0`,
  `[0]` has positive-dimensional kernel and is not an isogeny; it cannot test this theorem.

### 5.3 Period rings and the `p`-adic comparison at the residue prime

Let `K` be a finite extension of `ℚ_p`, and `K₀` its maximal unramified subfield.
Use PadicPeriodRings §§4.1–4.3's topological period carriers, invariant functors,
crystalline/semistable/de Rham predicates and canonical comparison maps.
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a and R07.3.0's
`finiteKPeriodComparison` identifies the finite-`K` crystalline/de Rham structures with
these same carriers, maps and predicates. Choose the logarithm branch in the shared
`B_st → B_dR`; normalize monodromy by `ord_K(π) = 1`, so `N_K = e_K N_p` for
`e_K = ord_K(p)` (Fontaine, Exposé III, §5.2.1, p. 158). Write `N = N_K` over `K`.
Preserve Frobenius, filtration, `K₀`/`K` scalar fields and tensor/dual maps.
The filtration-index convention is `ℚ_p(1)` of weight `−1` and filtration jump `−1`;
R07.P7.1–R07.P7.5's labelled Sen weights use the opposite numeric sign, giving `+1` on
`ℚ_p(1)`. Dualising negates either label.

Import NoncommutativeAndEquivariantIwasawa §F.6's generic period-realization prefix
for finite-dimensional continuous `E`-representations `V` of `G_K`, finite `E/ℚ_p`,
every prime `p`, and a finite Galois semistabilizing extension `F/K`. It supplies the
actual invariant modules `D_st^F(V)`, their algebraic-unramified direct limit `D_pst(V)`,
nilpotent `N_p`, the admissible tensor/dual isomorphisms and filtered de Rham descent
`D_dR,K(V) ≅ D_dR,F(V)^{Gal(F/K)}`. Its change-of-extension comparisons and coefficient
extension and effective descent retain the coefficient action, scalar components,
Frobenius, filtration and logarithm branch, and compose in towers.

**Period-to-Weil–Deligne adapter.** Define `PadicWeilDeligneRealization` on this full
domain as §F.6's realization followed by the transport `(r,N_p) ↦ (r,e_K N_p)`.
The underlying Weil action and maps are those of the supplied functor; the output
operator is `N_K = e_K N_p`. The additional comparisons are as follows.

- Identify the supplied admissible invariant modules with the corresponding
  `FilteredPhiNModuleDD` objects, preserving `φ`, `N_p`, filtration, coefficient and
  semilinear descent actions. The tensor ordering agrees through tensor symmetry and
  `finiteKPeriodComparison`; that comparison also identifies the crystalline/de Rham
  predicates and canonical maps used by `RaynaudPeriodComparison` and `PadicComparison`.
  Use PadicPeriodRings §4.3's semistable predicate. Prove that this identification
  respects §F.6's supplied tensor, dual, twist and filtered descent maps.
- Identify the output with `FilteredPhiNModuleDD.weilDeligne` on those period modules,
  followed by the same transport of `N_p` to `N_K`. R07.4.27 states its interface for
  odd `p`; establish this identification on admissible period modules also at `p = 2`,
  using the same carrier and operation. On the same scalar component over a specified
  common characteristic-zero parameter field `Ω` containing the images of `E` and `F₀`,
  both recipes have `r(g) = g_D ∘ φ^{−a_K(g)}`, where
  `a_K(g) = [k_K:𝔽_p] α_K(g)` and `α_K(Φ_K) = 1` for arithmetic Frobenius.
  The comparison is the identity on the actual period-module component and uses
  §F.6's coefficient extension and descent maps. Compare the resulting `(V,r,N_K)`
  fields with ArithmeticGaloisRepresentations §2.4 and
  SmoothRepresentationsOfLocalGroups SR.5.2 before and after Frobenius semisimplification.
  The transported relation is `r(g) N_K r(g)⁻¹ = p^{a_K(g)} N_K`, giving the factor
  `q_K⁻¹` at geometric Frobenius.
- Derive `restrict` from §F.6's restriction comparison and the normalization transport:
  for finite `L/K` it identifies the output for `V|G_L` with
  `(r|W_L, e(L/K) N_K)` on the common parameter field, since
  `e_L = e(L/K)e_K` and the supplied `N_p` is unchanged. Naturality, tensor/dual
  compatibility and the identity and tower-composition laws follow from those of the
  supplied functor and scalar multiplication. Transport commutes with coefficient change
  and its descent maps. The supplied nonzero-monodromy-rescaling isomorphism preserves
  the rational Weil–Deligne isomorphism class; the filtered period comparison retains
  its chosen logarithm and normalized operator.

*Source:* Fontaine, Exposé III, §§5.2.1–5.2.3, pp. 158–159, §§5.6.3–5.6.8,
pp. 167–170; Exposé VIII, §§1.3.5–1.3.7, pp. 329–330, §§2.3.2–2.3.7, pp. 335–339.
The semilinear cancellation formula is the one in
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.27 (Savitt 2005, §2.2, Definition 2.7,
p. 6); its use on actual period modules here covers finite `K/ℚ_p` and all primes.
*Needs:* NoncommutativeAndEquivariantIwasawa §F.6 (generic period-realization prefix);
PadicPeriodRings §§4.1–4.3;
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a, R07.3.0 and R07.4.27;
ArithmeticGaloisRepresentations §§2.4–2.5 (arithmetic adapters and local factors);
SmoothRepresentationsOfLocalGroups SR.5.2, `classical-llc-normalization`,
`wd-parameter-operations` and `wd-frobenius-semisimplification`.

**Checks.**

- For `V = ℚ_p(1)`, `D_cris` is generated by `t⁻¹`, `φ = p⁻¹σ`, `N_p = 0`
  and the filtration jump is `−1`. Its WD inertia is trivial, arithmetic Frobenius
  acts by `q_K` and geometric Frobenius by `q_K⁻¹`, although its `p`-adic Galois
  inertia is infinite. A direct use of the prime-to-`p` inertia construction fails.
- For a Tate curve with period `π⁵` over `K` with `e_K = 2`, the positive
  toric/period coefficient is `5` for `N_K` and `5/2` for `N_p`. Under a further
  ramified quadratic extension it becomes `10` for `N_L`, while `N_p` stays `5/2`.
- At `p = 2`, the good elliptic scheme `y² + y = x³` over `ℤ₂` has crystalline
  WD with trivial inertia and `N = 0`; its degree-one cohomological geometric
  Frobenius polynomial is `t² + 2`. The same adapter applies over `ℚ₂(√2)`.
- Enlarging a semistable extension without changing `K` leaves `N_K` unchanged;
  restricting the representation to that extension multiplies normalized monodromy
  by its ramification index. These are different comparisons.
- For the trivial and zero representations the output has `N = 0`, respectively
  trivial rank-one and zero Weil action; duality inverts the Tate-line Frobenius.
- For unramified quadratic `K/ℚ_p`, `a_K(Φ_K) = 2`; using `φ⁻¹` in place of
  `φ⁻²` fails scalar linearity on `K₀`. The parameter still has rank `dim_E V`
  after selecting a scalar factor, rather than multiplying its rank by `[K₀:ℚ_p]`.

**Full filtered Raynaud realization.** For semistable `A/K`, construct
`RaynaudFilteredRealization` of the full `1`-motive `[Y → G]` from 3.14, independently of
the tensor-invariant period functors. Start with split torus and lattice, then descend through
a finite unramified splitting extension. Its cohomological carrier `H_Ray` is a `K₀`-vector
space of dimension `2g`, with invertible semilinear `φ`, a `K₀`-linear operator `N = e N_p`
satisfying `Nφ = pφN`, and a comparison
`K ⊗_{K₀} H_Ray ≅ H¹_dR(A/K)`. Carry the Hodge filtration through this comparison:
`Fil⁰ = H¹_dR(A/K)`, `Fil¹ = H⁰(A,Ω¹)`, `Fil² = 0`, using A4.3's carrier. Its homological
realization is the dual with the dual filtration. The construction includes the exact maps

```text
0 → Hom(Y,K) --δ--> H¹_dR(A/K) --res_G--> H¹_dR(G_K/K) → 0,
0 → H¹_dR(B_K/K) → H¹_dR(G_K/K) --res_T--> X_A ⊗ K → 0.
```

Here `res_T` is restriction to the torus followed by the character/residue identification;
`δ` is the period boundary of the analytic quotient. The maps, their naturality and these
exact sequences are targets of this construction (Coleman–Iovita, Chapter I §2(i), pp. 9–10).
On de Rham cohomology the normalized monodromy is
`N = δ ∘ u_K^t ∘ res_T ∘ res_G`, where `u_K^t(x)(y) = u(y,x)` uses 4.3's positive
valuation pairing. This operator preserves the constructed `K₀`-structure and has square zero.

Let `A#` be A4.2's universal vector extension and `G*` its pullback to `G^an`, with the
canonical lift of the period embedding `Y → G*` over zero in `A#`. Identify
`H¹_dR(A/K)` with invariant forms on `G*`. For each such form `ω`, construct the unique
additive locally analytic primitive `λ_ω` on `G*(ℂ_p)` whose differential is `ω` and whose torus
restriction is the `K`-linear combination of `log ∘ χ` determined by its residues.
Evaluation on the lifted periods defines the retraction
`I_log(α)(y) = λ_ω(y)` with `I_log ∘ δ = id`; its kernel supplies the section of `res_G`.
This logarithmic primitive and its uniqueness are owned here (Coleman–Iovita, Chapter I
§2(ii), Theorem 2.1 and the splitting following it, pp. 11–12).
For two logarithms agreeing on units, put `c = log'(π) − log(π)`. Prove
`I_log' − I_log = c·u_K^t ∘ res_T ∘ res_G`, so the sections differ by the corresponding
monodromy translation. The Hodge filtration remains the intrinsic filtration on `H¹_dR(A)`;
its coordinates in the Frobenius realization retain the logarithms of the actual periods.

Construct the semiabelian Frobenius comparison of Chapter I §2(ii), diagram (3), p. 12:
the above sequence for `B,G,T` maps isomorphically to the degree-one dagger-cohomology
sequence of their good models. Construct this degree-one comparison and Frobenius for
these models here. The `B` term is identified with the supplied
`H¹_cris(B_k/W(k))[1/p]`, including its `K₀`-structure, semilinear Frobenius and comparison
after extending to `K`, also when `K` is ramified and `p = 2`. The toric term is
`X_A ⊗ K₀` with crystalline Frobenius `p` in the split case. If `q = p^f`, the `q`-eigenspace
of the `K`-linear dagger Frobenius on `H¹_dR(G)` maps isomorphically onto the toric term:
prove the required abelian eigenvalue separation here. For the finite-field Frobenius
`π_B`, the identity `π_B^† π_B = q` and Rosati positivity give complex absolute value
`√q` for every root of its endomorphism polynomial, excluding `q ≥ 2`
(Milne, *Abelian Varieties*, §19, Theorem 19.1 and Lemmas 19.2–19.3, pp. 40–41).
Use AbelianSchemesAndArithmeticModuli A6.11–A6.12 and A6.14–A6.15 for the endomorphism
polynomial, positivity and its real operator adapter; 5.0b's good-reduction Frobenius
comparison and Katz–Messing Theorem 1, pp. 74–75, transfer this separation to the
crystalline term.
This specifies the semiabelian splitting and its `K₀`/semilinear Frobenius structure.
Combine it with `I_log` and `Hom(Y,K₀)` (split Frobenius `1`) to construct `H_Ray` and
`φ`; prove the relation with `N` and compatibility of all boundary, pullback and residue maps.
The ramified good-abelian crystalline/de Rham bridge is part of this construction, using
CR.2.1, CR.2.3 over its PD bases and CR.3.4; no smooth `W(k)`-lift of the given `B/R` is
assumed. All maps and both splittings are equivariant under unramified splitting descent.
The API is `RaynaudFilteredRealization.deRham_exact`, `semiabelian_frobenius`,
`logarithmic_retraction`, `branch_change`, `monodromy`, `hodge`, `map` (contravariantly in
abelian homomorphisms, preserving identities and composites), `dual` (the perfect Poincaré
pairing with the dual abelian variety into `K₀(-1)`, respecting all structures) and
`unramified_descent`.
*Needs:* 3.13–3.14, 4.3; AbelianSchemesAndArithmeticModuli A4.2–A4.3,
A6.11–A6.12 and A6.14–A6.15;
RigidAnalyticGeometry §§6.1–6.2 and §§8.1–8.3, with the analytic carriers of the 3.14 contract;
CrystallineCohomology CR.2.1, CR.2.3, CR.3.4; 5.0b (good-reduction Frobenius). The logarithmic and dagger comparisons just specified are
degree-one abelian/Raynaud targets here.

**Checks.**

- For good reduction `Y = X_A = 0`, the realization is the good-abelian crystalline
  realization, with `N = 0` and the full Hodge filtration, also over ramified `K`.
- For a split Tate curve, `B = 0` and `H_Ray` has dimension two; `N` has valuation
  coefficient `ord(q)` and the logarithmic retraction evaluates the lifted period by
  `log(q)`. Omitting `Y` gives dimension one and loses the period boundary.
- Over `ℚ₅` with `log(5) = 0`, compare Tate periods `q = 5` and `q' = 30 = 5·6`.
  Both valuations are `1`, so the normalized monodromy coefficient and graded Frobenius
  data agree. Evaluation of the logarithmic primitive on the periods gives `0` and
  `log(6)` respectively, and `log(6) ≡ 5 mod 25` is nonzero. The resulting Hodge lines
  differ in the common Frobenius/monodromy realization. Brinon–Conrad's contravariant
  basis records this difference as the parameters `c_5 = 0` and `c_30 = −log(6)`.
  (Brinon–Conrad, §8.3, Proposition 8.3.8 and the Tate calculation, pp. 123–126.)
- For dimension zero every term and map is zero; for a nonsplit torus the unramified
  descent retains its character action and the resulting Frobenius eigenvalues.

**Geometric period comparison.** Construct `RaynaudPeriodComparison`: the geometric
period-integration pairing
`T_p(A) × H¹_dR(A/K) → B_dR^+` induces a natural `G_K`-equivariant isomorphism
`B_dR ⊗_K H¹_dR(A/K) ≅ B_dR ⊗_{ℚ_p} H¹_ét(A_K̄,ℚ_p)` and restricts to
`B_st ⊗_{K₀} H_Ray ≅ B_st ⊗_{ℚ_p} H¹_ét(A_K̄,ℚ_p)`.
Construct the integration pairing and prove its nondegeneracy and this restriction here,
for the abelian/Raynaud `1`-motive (Coleman–Iovita, introduction, main comparison theorem,
pp. 2–3). The latter map commutes with Frobenius and normalized monodromy; after extension
through the chosen logarithmic embedding it is the former filtered isomorphism. Its
compatibility with the period boundary, toric residues, good abelian quotient, homomorphisms
and duality is part of the target. Taking invariants gives
`H_Ray ≅ D_st(H¹_ét(A_K̄,ℚ_p))`, and the displayed map, after this
identification, is the canonical tensor-invariant comparison map of the shared period
functors. The induced `K`-linear invariant comparison is the shared `D_dR` map and
identifies its filtration with A4.3's Hodge filtration. For the good abelian quotient the
map restricts over `B_cris` and yields
`D_cris(H¹_ét(B_K̄,ℚ_p)) ≅ H¹_cris(B_k/W(k))[1/p]` with its de Rham comparison,
also over ramified `K` and at `p = 2`. These are comparisons of maps and structures,
rather than dimension equalities. Prove naturality under finite extensions with
`N = e N_p` and the corresponding logarithm branch, and descend the split comparison
and admissibility through a finite unramified splitting extension as in Fontaine Exposé
III §1.8.6, p. 135. *Needs:* `RaynaudFilteredRealization`; the shared period core and
PadicPeriodRings §§4.1–4.3's `B_st`, `D_st`, predicates and canonical comparison maps;
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3.0's `finiteKPeriodComparison`;
NoncommutativeAndEquivariantIwasawa §F.6's admissible tensor/dual and filtered descent
comparisons, transported through `PadicWeilDeligneRealization`;
3.14's torsion and duality.

**Checks.**

- For a split Tate curve with positive valuation the period comparison carries the nonzero
  residue/boundary monodromy to Fontaine's `N`; it is a `B_st` comparison, and the full
  representation is not crystalline.
- For the periods `5` and `30` over `ℚ₅` with `log(5) = 0`, it preserves the different
  lines `Fil¹` calculated above. Their equal graded Frobenius traces do not identify
  these filtered realizations.
- For good reduction it restricts to the crystalline comparison with `N = 0`, including
  over a ramified base; for dimension zero it is the isomorphism of zero modules.
- A nonsplit semistable variety is compared after unramified splitting and descended
  with its Galois action on `X_A,Y`; the invariant comparison remains filtered.

Construct `RaynaudFilteredRealization` and `RaynaudPeriodComparison` before
`PadicComparison`; 6.10's trace and compatible-system exports and
SelmerIwasawaCohomology §4.26 then consume that comparison. Potential semistability from
3.10, the comparison over a semistable extension and §F.6's supplied de Rham descent give
`AbelianVariety.deRham` for every `A`. Prove `PadicComparison`: if `A` has good reduction then `V_p(A)` is crystalline, and if `A` has
semistable reduction then `V_p(A)` is semistable, with
`D_st(V_p(A)) ≅ RaynaudFilteredRealization(A)^*` as filtered `(φ,N)` modules.
This is the homological dual of the full cohomological realization of `[Y → G]` in
`RaynaudPeriodComparison` (dimension `2g`, including the lattice contribution), with `N`
induced by the lattice `Y` and the valuation pairing
(Coleman–Iovita, *The Frobenius and monodromy
operators for curves and abelian varieties*, Duke Math. J. 97 (1999), main theorem of the
introduction, for the semistable case: the public arXiv version math/9701229v1, introduction,
pp. 2–3, states the comparison with `D_st(V_p(A))^*` and the crystalline criterion.
Its semistable comparison is stated for split semistable reduction; for the general
semistable case, pass to a finite unramified extension splitting the Raynaud torus and
lattice, then descend the comparison and semistable admissibility, retaining their
Galois action. This descent is part of `PadicComparison` (Fontaine Exposé III,
§1.8.6, p. 135, gives admissibility descent when the extension acts faithfully on
the period-ring scalar field, as for an unramified extension);
Boxer–Calegari–Gee–Pilloni 2021, Proposition 2.8.1, pp. 194–195, uses the associated
Weil–Deligne systems rather than stating this period-ring comparison). The convention for
the dual: `V_p(A)` is the homological Tate module and `H¹_ét(A_{K̄}, ℚ_p)` its dual, so
`D_cris(H¹)` is the dual Dieudonné module with the opposite Hodge weights.
The resulting de Rham comparison identifies the supplied `D_dR(V_p(A))` with
`H¹_dR(A/K)^*`, with the dual Hodge filtration of AbelianSchemesAndArithmeticModuli
A4.3, naturally in `A` and under finite extensions. Finite-extension descent and
the crystalline comparison use the same supplied comparison maps and predicates.
For the good abelian quotient `B`, retain the crystalline/de Rham bridge constructed in
`RaynaudFilteredRealization` and compared with the shared period maps by
`RaynaudPeriodComparison`, including for ramified `K` and `p = 2`.
*Needs:* 1.8, 1.10, 3.1, 3.10, 3.13, 3.14;
`RaynaudFilteredRealization`, `RaynaudPeriodComparison`;
PadicPeriodRings §§4.1–4.3 (period carriers, invariant functors and predicates);
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a and R07.3.0;
NoncommutativeAndEquivariantIwasawa §F.6 (admissible period-module comparisons and descent);
`PadicWeilDeligneRealization` (normalization and filtered-module identification);
AbelianSchemesAndArithmeticModuli A4.2–A4.3;
CrystallineCohomology CR.2.1, CR.2.3, CR.3.4;
SmoothRepresentationsOfLocalGroups SR.5.2, `classical-llc-normalization` and
`wd-parameter-operations`; ArithmeticGaloisRepresentations Layer 2 (§2.4)
(arithmetic Weil–Deligne adapter).

Apply `PadicWeilDeligneRealization` of this section to these potentially semistable Tate
representations, through the supplied `FilteredPhiNModuleDD.weilDeligne`. Keep its
semilinear descent action, geometric Frobenius convention,
`N = e N_p` and the specified rescaling under ramified restriction. Compare parameters
over the common characteristic-zero field supplied by SmoothRepresentationsOfLocalGroups
SR.5.2. Thus changing from `N_p` to `e N_p`
preserves the rational Weil–Deligne isomorphism class without discarding 4.3's integral
normalisation.

**Checks.**

- `V_p(A)` is de Rham for every `A`, and a de Rham representation is not automatically
  crystalline: an elliptic curve with additive reduction at `p` gives a representation that is de
  Rham but not semistable.
- For a Tate curve `V_p(E_q)` is semistable and not crystalline, with `N ≠ 0`.
  For `q = π⁵` and ramification index `e = 2`, the toric/period coefficient is `5`
  for `N`, and `5/2` for `N_p`; multiplying the latter by `e` gives `5`. This
  distinguishes the two valuation normalisations.
- At the residue prime the inertia invariants of `V_p(A)` are not the finite part of 3.5; the
  crystalline predicate, not unramifiedness, detects good reduction.
- For an elliptic curve `E/K`, the period term in SelmerIwasawaCohomology §4.26's
  de Rham/exponential/Kummer diagram is this same `dDeRham(V_p(E))/Fil⁰`.
  Its identification with `Lie(E/K)` uses the dual Hodge filtration transported by
  `PadicComparison`, including for a Tate curve and after ramified descent.
  The diagram requires no equivalence between separate period carriers or predicates.

### 5.3a The elliptic conductor exponent

For 5.3a–5.3e, `K` is complete for a discrete valuation `v_K` with
`v_K(K^×) = ℤ`, `R = O_K`, perfect residue field `k` of characteristic `p > 0`,
and `char K ∈ {0,p}`. The elliptic curve `E/K` is given by a Weierstrass curve `W`
with `IsElliptic`; the coefficient prime `ℓ` is different from `p`. For finite `k`,
`K` is a nonarchimedean local field and the ramification filtrations are those of
LocalFieldsRamification Layers 3–4. For arbitrary perfect `k`, for instance `K = F̄_p((t))`,
use the ramification filtration, breaks and conductor conventions of
ArithmeticGaloisRepresentations Layer 3 (§§3.1–3.2), which are stated over every perfect residue
field; residue finiteness is not assumed.

**The conductor exponent.** Define `f(E) := a(V_{ℓ₀}E)` with `ℓ₀` the least prime `≠ p`, the tame part
`ε(E) := codim (V_{ℓ₀}E)^{I_K}`, the wild part `δ(E) := Sw(V_{ℓ₀}E)`, and over a number field
`N_E := ∏_v 𝔭_v^{f(E_{F_v})}` (intended signatures `TateModule.ellipticConductorExp W : ℕ`,
`TateModule.ellipticConductor W : Ideal (𝓞 F)`). Prove that `a(V_ℓE) = f(E)` for every `ℓ ≠ p`, `ε`
and `δ` are independent of `ℓ` and `δ(E) = Sw(E[ℓ])`; that `ε(E) = 0, 1, 2` as `W.minimal R` (never a
bare integral equation) has good, multiplicative or additive reduction
(`WeierstrassCurve.HasGoodReduction`, `WeierstrassCurve.HasMultiplicativeReduction`,
`WeierstrassCurve.HasAdditiveReduction`); that `δ(E) = 0` for `p ≥ 5` and under good or multiplicative
reduction; and that `a((V_ℓE)^∨) = f(E)`. Its API is the comparison with the Artin conductor, `f = 0`
iff good reduction, `f = 1` iff multiplicative reduction, invariance under unramified base change and
under duality (Serre 1970, n° 2.4, cases b), c), p. 10; Brumer–Kramer 1994, §6, (6.1), p. 243).
*Needs:* LocalFieldsRamification Layers 3–4 (finite `k`); ArithmeticGaloisRepresentations §§3.1, 3.2, 3.4, 3.6, 6.2;
5.1a; EllipticCurves
Layers 2–5; Mathlib `WeierstrassCurve.minimal`,
`WeierstrassCurve.hasGoodReduction_or_hasMultiplicativeReduction_or_hasAdditiveReduction`.

**Checks.**

- `y² + y = x³ − x² − 10x − 20` over `ℚ` has `f_11 = 1` and `f_v = 0` otherwise, so `N_E = 11`.
- Good reduction of `W.minimal R` gives `f = 0`; scaling a good minimal equation by a uniformiser gives
  `v(Δ) = 12` and a bare-equation reading of additive reduction, yet `f = 0`.
- `y² = x³ − x` over `ℚ_2` has `f = 5`; for `p = 2`, `a(V_3E) = a(V_5E)`.

### 5.3b The special fibre of the minimal regular elliptic model

**The special fibre of the minimal regular model.** Let `Δ_min` be the minimal discriminant, `X` the
minimal proper regular model of `E` over `R` (`TauCetiRoadmap.StableReduction` layers 4–5) and `m` the
number of geometric irreducible components of `X_k̄`, without multiplicity. Consume
2.7 `MinimalRegularSmoothLocus` for the Néron model,
2.8 `KodairaConfiguration` for the Kodaira configurations, and 2.9
`WildKodairaComparison` for their agreement with Tate's algorithm in every residue characteristic.
Use this dictionary to identify `m` with the component count of the symbol produced by Tate's
algorithm on `W.minimal R` (EllipticCurves Layer 4; Silverman, *Advanced Topics in the Arithmetic
of Elliptic Curves*, Ch. IV, §§5–6, 8–9). Over the completed strict henselisation
`R^{sh∧}` the supplied counts are
`m = 1, n, 1, 2, 3, 5, n + 5, 7, 8, 9` for `I_0, I_n, II, III, IV, I_0^*, I_n^*, IV^*, III^*, II^*`,
in every residue characteristic including `2` and `3`. Prove the arithmetic comparison that
passage from `R` to `R^{sh∧}` preserves `v(Δ_min)`, `f(E)` and `m`, the minimal regular model
being compatible with this base change (Liu 1994, Introduction, p. 51; Silverman, *Advanced Topics*,
Ch. IV, §6). *Needs:* 2.7, 2.8 (`KodairaConfiguration`), 2.9, 5.3a; StableReduction Layers 4–5
(intersection theory, minimal regular models, components and multiplicities); EllipticCurves Layer 4
(`ReductionSymbol`, component count, independence of the minimal equation); Mathlib
`WeierstrassCurve.IsMinimal`, `WeierstrassCurve.Δ`; Tau Ceti
`WeierstrassCurve.valuation_Δ_eq_of_isMinimal_smul`.

**Checks.**

- Type `I₀*` has `m = 5`, although its geometric Néron component group has order `4`: components
  of multiplicity greater than one do not meet the relative smooth locus.
- Nonsplit `I_n` has `m = n` after strict henselisation, although the number of rational Néron
  components can be smaller; the conductor comparison uses the geometric count.
- Strict henselisation and completion preserve `v(Δ_min)` and `f(E)` in residue characteristics
  `2` and `3`; the tame discriminant table is not used for those characteristics.

### 5.3c Étale Euler characteristics and elliptic comparison

**Étale Euler characteristics and elliptic comparison.** For `ℓ ≠ p`, construct the rational
`ℓ`-adic étale cohomology of the geometric generic and special fibres of the regular model, with
their Galois actions, finite dimensions and Euler characteristic
`χ(Y) = Σ_i (−1)^i dim H^i_ét(Y,ℚ_ℓ)`. Prove invariance under nilpotent thickenings and the
normalization exact sequence used to compute the special-fibre Euler characteristic. Construct the
Galois-equivariant isomorphism `H¹_ét(E_K̄,ℚ_ℓ) ≅ V_ℓE^∨`, naturally under isogenies and base change,
by finite-level torsion/dual pairings and passage to the inverse limit; identify its Swan conductor
with that of `V_ℓE` by conductor duality. Deduce `χ(E_K̄) = 0` and, using the special-fibre
configurations above, `χ(X_k̄) = m − 1 + ε(E)`
(Milne, *Étale Cohomology*, Ch. III, §4, the Kummer sequence and Picard groups;
Saito 1988, §1; Liu 1994, Introduction, p. 51).
*Needs:* 5.3a–5.3b; ArithmeticGaloisRepresentations §6.1 (elliptic Tate comparison)
and §3.4 (conductor duality); EtaleCohomologyFoundations §F.0
`universalHomeomorphismEtaleEquivalence`, §F.1 `finiteCoefficientCohomology`,
§F.3 `etaleFiniteness`, and §F.4 `classicalAdicRealization`,
`rationalAdicRealization`, `adicFiniteness`; AbelianSchemesAndArithmeticModuli
A3.5 and A4.1 (torsion pairing and Tate module).

**Checks.**

- A smooth geometric elliptic fibre has dimensions `(1,2,1)` and Euler characteristic zero.
- A geometric `I_n` fibre has Euler characteristic `n = m − 1 + ε`, including the nodal `I_1`.
- Type `I₀*` has Euler characteristic `6`, with `m = 5` and `ε = 2`; multiplicity of its central
  component changes neither its étale cohomology nor this calculation.

### 5.3d Determinant of cohomology and the discriminant valuation

**Determinant of cohomology and the discriminant valuation.** For a proper flat regular curve
`f : X → Spec R`, with `R` a complete DVR, perfect residue field, smooth projective geometrically
connected generic fibre `C` of genus at least one, and relative dualizing line `ω`, prove that
`Rf_*ω` and `Rf_*ω²` are perfect. Construct their determinant lines over `R` from bounded finite
free resolutions, with quasi-isomorphism, exact-sequence and flat-base-change compatibility.
This determinant-of-cohomology construction is owned here, using finite-projective determinants
from AlgebraicVectorBundles L0C and coherent finiteness from SchemeAndStackFoundations §2.6.
Use the canonical generic-fibre Mumford isomorphism
`det Rf_*ω² ≅ (det Rf_*ω)^13` to define the rational discriminant section `Δ_{X/R}` of
`(det Rf_*ω)^13 ⊗ (det Rf_*ω²)^−1`. Define its order by writing the section as `a` times an
`R`-basis and taking `v_K(a)`; prove basis independence and compatibility with unramified base
change. For the minimal regular elliptic model identify this line with the twelfth power of the
invariant-differential line and its section with the minimal Weierstrass discriminant, giving
`ord Δ_{X/R} = v(Δ_min)`
(Saito 1988, §1 and Theorem 1; Knudsen–Mumford 1976, §I, Theorem 1;
Deligne, *Le discriminant d'une courbe*, Appendix 3 to *Lettre à Quillen*;
Liu 1994, §2.1, pp. 58–59, for the determinant-line formulation).
*Needs:* AlgebraicVectorBundles L0C (determinants of finite projective modules);
SchemeAndStackFoundations §2.6 (proper coherent cohomology);
StableReduction Layer 2 (relative dualizing line) and Layers 4–5 (regular models);
Mathlib DVRs, valuations, finite modules and complexes. Construct the finite free resolutions
over the DVR in this target. The determinant-line and generic Mumford
isomorphism constructions are subtargets here, before the conductor–discriminant theorem.

**Checks.**

- Smooth elliptic reduction gives a unit section and order zero.
- For the Tate curve, the order is `v(q)`, the number of components of its `I_{v(q)}` fibre.
- Changing an integral basis multiplies the scalar by a unit and leaves the order unchanged;
  replacing a minimal Weierstrass equation by its uniformiser scaling adds `12` to its equation
  discriminant valuation, which cannot be used as `ord Δ_{X/R}` without correcting the basis.

### 5.3e Ogg's formula and the conductor–discriminant theorem

**Ogg's formula.** Prove that for `p ≥ 5`, `v(Δ_min) = f(E) + m − 1` (Darmon–Diamond–Taylor 2007,
§2.2, Rem. 2.14, p. 58). Prove Saito's conductor–discriminant formula: for `R` a complete discrete
valuation ring with perfect residue field of characteristic `p`, `C/K` smooth projective geometrically
connected of genus `≥ 1` with minimal regular model `X/R`,
`Art(X/R) := χ(X_K̄) − χ(X_k̄) − Sw(H¹_ét(C_K̄, ℚ_ℓ))` (`ℓ ≠ p`) and Deligne's discriminant `Δ_{X/R}`,
`−Art(X/R) = ord Δ_{X/R}` (Saito 1988, Thm 1; Liu 1994, Introduction, p. 51, and §2.1, pp. 58–59).
Prove that for `C = E`, `ord Δ_{X/R} = v(Δ_min)`, `χ(X_k̄) = m − 1 + ε(E)` and `χ(X_K̄) = 0`, so
`−Art(X/R) = f(E) + m − 1` (same locators); hence Ogg's formula `v(Δ_min) = f(E) + m − 1` in every
residue characteristic, including `2` and `3`, in mixed and equal characteristic (Liu 1994,
Introduction, p. 51). *Needs:* 5.3a–5.3d (conductor, special fibre, étale Euler characteristics,
determinant of cohomology and discriminant valuation);
ArithmeticGaloisRepresentations §3.1 (Swan conductor).

**Checks.**

- Good reduction has `v(Δ_min) = f = 0` and `m = 1`.
- Type `I₀*` in residue characteristic at least five has `6 = 2 + 5 − 1`.
- For `y² = x³ − x` over `ℚ₂`, the minimal discriminant valuation is `6`, `f = 5` and
  `m = 2`; substituting the tame additive value `f = 2` would fail.

### 5.3g Elliptic conductor values and bounds

**Values and bounds.** For `K` a nonarchimedean local field of residue characteristic `p` and `E/K`
elliptic, prove that `f(E) = 0, 1, 2 + δ(E)` for good, multiplicative, additive reduction, the last
equal to `2` when `p ≥ 5` (Darmon–Diamond–Taylor 2007, Prop. 2.13, p. 58); that additive potentially
multiplicative reduction with ramified quadratic twisting character `χ` gives `f(E) = 2a(χ)`, with
values `4` and `6` over `ℚ_2` (same locator; `TauCetiRoadmap.EllipticCurves` layer 5, quadratic
twists); that `f(E) ≤ 2 + 3v_K(3)` for `K/ℚ_3` finite (Serre 1987, §4.9 (a), p. 216) and
`f(E) ≤ 2 + 6v_K(2)` for `K/ℚ_2` finite, so `f_2 ≤ 8` over `ℚ_2` (Serre 1987, §4.9 (b), p. 216;
Brumer–Kramer 1994, Thm 6.2, p. 243); that `K`-isogenous curves have equal `f`, and equal `N_E` over a
number field; and that for `E/ℚ`, `p | N_E` iff `E` has bad reduction at `p`, `v_p(N_E) = 1` iff the
reduction is multiplicative, and `N_E | 2⁸ · 3⁵ · ∏_{p ≥ 5, p | N_E} p²` (same locators). *Needs:* 5.3a; ArithmeticGaloisRepresentations §§3.4, 3.6, 3.7, §6.1 (isogenies),
§6.6 **Serre's wild bound**; EllipticCurves Layers 4–5 (quadratic twists).

**Checks.**

- Over `ℚ_2`, the bound `f_2 ≤ 8` is attained; `f_2 ≤ 2` would incorrectly
  substitute the tame bound at a wild prime.
- Ramified quadratic twists of multiplicative elliptic curves over `ℚ_2`
  have conductor exponents `4` and `6`, according as the quadratic character
  has conductor `2` or `3`.
- Over `ℚ`, good reduction contributes exponent zero and multiplicative reduction
  exponent one to `N_E`; isogenous curves have equal conductor ideals.

### 5.3h Residual elliptic conductors

**Residual conductors.** For `E/K` elliptic over a nonarchimedean local field of residue
characteristic `p` and `ℓ ≠ p`, `E[ℓ]` is the reduction of `T_ℓE` and `Sw(E[ℓ]) = δ(E)`. Prove that
good reduction gives `a(E[ℓ]) = 0`; multiplicative reduction gives `a(E[ℓ]) = 0` if `ℓ | v(Δ_min)` and
`1` otherwise (Serre 1987, §4.1, (4.1.12), p. 201); additive potentially multiplicative reduction and
odd `ℓ` give `a(E[ℓ]) = f(E)`; and additive potentially good reduction with `ℓ` not dividing the order
of the inertia image gives `a(E[ℓ]) = f(E)`, which holds for `ℓ ≥ 5` (Serre 1987, §4.6, Lemme 5, p.
207). Prove that for `E/ℚ` and `ℓ ≥ 5`, with `E[ℓ]` the actual residual representation (not
semisimplified), `N(E[ℓ]) = N_E^{(ℓ)} / ∏ q` over `q ∥ N_E`, `q ≠ ℓ`, `ℓ | v_q(Δ_min)`, hence
`N(E[ℓ]) | N_E`, while for the semisimplification only `N(E[ℓ]^ss) | N(E[ℓ])` is asserted (same
locator; Bennett–Siksek 2020, §2, (3), p. 358). *Needs:* 5.3a, 5.3g; ArithmeticGaloisRepresentations §3.6 (residual conductors),
§3.3 (global conductors); EllipticCurves Layers 4–5.

**Checks.**

- For `E = 11a1`, `N(E[5]) = 1` (`5 | v_11(Δ_min) = 5`) and `N(E[3]) = 11`.
- Good reduction gives `a(E[ℓ]) = 0` and multiplicative reduction with `ℓ ∤ v(Δ_min)` gives `1`, like
  `V_ℓE`.
- Over `ℚ_2`, `f_2 ≤ 8`, attained; a bound `f_2 ≤ 2` would be the tame bound and is false.

### 5.3i Comparison with Mathlib's local polynomial

**Comparison with Mathlib's local polynomial.** Prove that for `F` a number field, `W` elliptic over
`F`, `𝔭` a height-one prime with `R = adicCompletionIntegers`, `q = #(O_F/𝔭)` and `ℓ ∤ q`, with the
minimal model over `R`, `WeierstrassCurve.localPolynomial R W` equals `L_v(V_ℓE^∨, X)`: at good
reduction its linear coefficient is the negative of the `frobeniusTrace` of the reduction; at split, resp. nonsplit,
multiplicative reduction both are `1 − X`, resp. `1 + X`; at additive reduction `(V_ℓE)^{I_v} = 0` and
both are `1`, for every Kodaira type and residue characteristic; so `WeierstrassCurve.LFunction` has
the Euler factors of `V_ℓE^∨` away from `ℓ` (Darmon–Diamond–Taylor 2007, §2.2, Prop. 2.12, pp. 57–58).
*Needs:* 5.0b–5.0c, 5.1a, 5.3a; 2.6–2.9 and 3.5–3.7 (reduction filtration and
inertia); ArithmeticGaloisRepresentations §6.3 **Local Euler factors** and
**The Tate curve**; EllipticCurves Layers 4–5; Mathlib `WeierstrassCurve.minimal`.

**Checks.**

- For `y² = x³ − x` at `5`, `a_5 = −2` and the linear coefficient is `+2`.
- Split multiplicative reduction gives `1 − X`; nonsplit multiplicative reduction gives `1 + X`.
- Additive reduction gives `1` even in residue characteristics `2` and `3`.

### 5.4 The conductor interface

Let `K` be a nonarchimedean local field with finite residue field and `ℓ ≠ char k`. The conductor
exponent `f(A)` of `A` is the Artin conductor, with its Swan part, of the Weil–Deligne
representation attached to `H¹_ét(A_{K̄}, ℚ_ℓ)` (the dual of `V_ℓ(A)`); the conductors and the
Weil–Deligne representation are supplied by ArithmeticGaloisRepresentations §§3.1–3.6,
§2.4 and §§6.1–6.2 and are not
redefined here (Calegari–Geraghty–Harris, Appendix, Lemma A.7 and its proof, p. 89). Prove
`ConductorInterface.independent_of_ell` for `dim A > 1` (the exponent is independent of `ℓ`:
after a finite extension `A` is semistable by 3.10; retain the finite inertia action on
the strict `1`-motive of 3.14 and its Weil–Deligne realisations, not just the ranks
after extension. The finite inertia characters and nilpotent operator determine the
Artin and Swan terms over the original field and are independent of `ℓ`, by Raynaud
1994, §§4.7.3–4.7.4, p. 317, and Noot 2013, Corollary 2.7, pp. 256–257), `dual` (`A` and `A^∨`
have the same conductor) and `isogeny` (isogenous varieties have the same conductor, by 5.2 and
the isomorphism of rational Tate modules). *Needs:* 3.10, 3.13, 3.14, 5.2;
ArithmeticGaloisRepresentations §§3.1–3.6, 6.1–6.2; 5.3a (elliptic conductor).

**Checks.**

- Good reduction gives `f(A) = 0`.
- Multiplicative elliptic reduction gives `f(E) = 1`, split or not.
- Wild additive reduction at `p = 2` or `3` has a positive Swan term, so `f(E) > 2` occurs; an
  interface forcing `f ≤ 2` for additive reduction would be wrong.

### 5.5 Conductors of semistable abelian varieties

Under the hypotheses of 5.4 with `A` semistable, prove `SemistableConductorRank`: the Swan
conductor vanishes and the conductor exponent is the toric rank,
`f(A) = 2g − dim V_ℓ(A)^I = 2g − (t + 2a) = t` (Conrad, Lemma 5.4, pp. 17–18, for the dimension of
the invariants; Calegari–Geraghty–Harris, Appendix, Lemma A.7, p. 89, for the use with surfaces). The tame
unipotent operator of 3.7 factors through the prime-to-`p` quotient of inertia, so wild inertia
acts trivially. *Needs:* 3.5, 3.7, 5.4.

**Checks.**

- Good reduction has `t = 0` and conductor `0`.
- A multiplicative elliptic curve has `t = 1` and conductor `1`.
- An abelian surface with `t = 2` has conductor `2` and an abelian surface with `t = 1`, `a = 1`
  has conductor `1`.

### 5.6 The local Euler polynomial at bad places

Let `K` be a nonarchimedean local field with complete `R`, residue field of cardinality `q`, and
`ℓ ≠ char k`. The local Euler polynomial `P_v(A, T) = det(1 − T·Frob_q | H¹_ét(A_{K̄}, ℚ_ℓ)^{I})`,
with `H¹` the dual of the homological Tate module and `Frob_q` geometric Frobenius, is defined in
ArithmeticGaloisRepresentations §6.3 **Local Euler factors** on top of its §2.5
Weil–Deligne factor. Section 5.3i identifies it with Mathlib's
`WeierstrassCurve.localPolynomial` for elliptic curves. Prove
`LocalEulerPolynomial`: for semistable `A`, the inertia invariants of `H¹` are the dual of
`T_ℓ(A)/T_t` (3.5, 3.6), geometric Frobenius acts on the toric character contribution with
eigenvalues of weight `0` and on the abelian contribution with eigenvalues of weight `1` (through
the Raynaud extension of 3.13), hence `P_v(A, T)` has integer coefficients independent of `ℓ`;
for arbitrary `A` the same follows after the finite extension of 3.10 by descent; and the
inertia semisimplification alone does not determine `P_v` (Raynaud 1994, Proposition 4.6.1,
p. 315, and Proposition 4.7.4, p. 317, which act on the homological realisation with arithmetic
Frobenius; the passage to the cohomological dual with geometric Frobenius is part of this
target). *Needs:* 3.5, 3.6, 3.10, 3.13, 4.3, 5.0b–5.0c;
ArithmeticGaloisRepresentations §§2.4–2.5, §6.3 **Local Euler factors**.

**Checks.**

- A split Tate curve has `P_v = 1 − T`; with arithmetic Frobenius on the homological invariants
  one would get `1 − qT`, which is not this convention.
- A nonsplit Tate curve has `P_v = 1 + T`, and additive reduction has `P_v = 1`.
- For a semistable abelian surface with `t = 1`, `a = 1`, `P_v` has degree `3` with one root of
  absolute value `1` and two of absolute value `q^{-1/2}`.

### 5.7 Residual conductors and dual component groups

Let `K` be local with residue characteristic `r`, `A` semistable, and `ℓ ≠ r` a prime not
dividing the order of `Φ_{A^∨}(k̄)`. Prove `ResidualConductorComponents`: the inertia invariants
of the residual representation `A[ℓ]` have the same dimension as those of `V_ℓ(A)`, so the
residual and characteristic-zero conductor exponents agree (Calegari–Geraghty–Harris, Appendix,
Lemma A.7 and proof, p. 89). The defect of reduction of the saturated invariant submodule is
measured by the `ℓ`-primary part of the cokernel of the monodromy map (4.5), which vanishes
under the hypothesis; by the perfect pairing of 4.6 one may use `#Φ_A(k̄)` in place of
`#Φ_{A^∨}(k̄)`, but that is a consequence of 4.6 and not an assumption. *Needs:* 3.5, 4.5, 4.6,
5.4; ArithmeticGaloisRepresentations Layer 3 (§§3.1–3.6) (conductors of residual representations).

**Checks.**

- For a Tate curve with `ℓ ∣ ord(q)` the residual inertia action is trivial and the residual
  conductor is `0`, while the characteristic-zero exponent is `1`; the hypothesis
  `ℓ ∤ #Φ` is necessary.
- For a Tate curve with `ℓ ∤ ord(q)` both exponents are `1`.
- For good reduction both exponents are `0` for every `ℓ ≠ r`.

### Examples

- For `E = X_0(11)` over `ℚ_{11}` (split multiplicative, `ord(q) = 5`): inertia is unipotent on
  `T_ℓ` for `ℓ ≠ 11`, the conductor exponent is `1`, `P_v = 1 − T`, and for `ℓ = 5` the residual
  conductor drops to `0`.
- For an elliptic curve with good reduction at `p` and `#E(𝔽_p) = p + 1 − a`, the local
  polynomial is `1 − aT + pT²`, and the comparison with Mathlib's `localPolynomial` is
  5.3i.

### Dependencies

Layers 1, 3 and 4; ArithmeticGaloisRepresentations §§2.1–2.5, 3.1–3.7, 6.1–6.2,
§6.3 **The Tate curve**/**Local Euler factors**, §6.6 **Serre's wild bound**;
`AbelianSchemesAndArithmeticModuli:A3`, `A4.3`; EllipticCurves Layer 4;
PadicPeriodRings §§4.1–4.3 (period rings, functors and predicates),
FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5a, R07.3.0 and R07.4.27,
CrystallineCohomology CR.2.1, CR.2.3, CR.3.4 and
SmoothRepresentationsOfLocalGroups SR.5.2, `classical-llc-normalization`, for 5.3.

## Layer 6: interfaces for modularity and finiteness

The last layer packages what the consumers use: the functoriality of character lattices and
component groups under given homomorphisms of modular Jacobians, the integral differential
lattice under semistable base change and under isogeny, the comparison of every elliptic
equation-level invariant with its scheme-level counterpart, the compatible system of
cohomology of an abelian variety, the semistable-ordinary adapters for abelian surfaces over
`ℚ₂`, and the full-level extension for curves. The base hypotheses are those of the layer each
statement draws on; number-field bases are Dedekind schemes as in Layer 1.

### 6.0 Serre's independence and Noot's specialisation

**Serre's independence and Noot's specialisation.** Prove that for `K` a number field some finite
`L/K` has adelic image `∏_ℓ U_ℓ` with each `U_ℓ` Zariski connected in `GL(V_ℓA)` (Richard–Yafaev 2025,
Thm 4.9(1)–(2), p. 17). Prove that for `F` finitely generated over `ℚ`, `S` a normal geometrically
irreducible variety over `F` with function field `K`, `X/S` an abelian scheme, `σ` a closed point and
`D_σ ⊆ G_K` its decomposition group, `X_η[n](K̄) ≅ X_σ[n](F̄)` equivariantly for `D_σ`, so
`T_ℓX_η ≅ T_ℓX_σ` and `ρ_{X_η,ℓ}(D_σ) = ρ_{X_σ,ℓ}(G_{F(σ)})`; and that there are closed points with
`ρ_{X_σ,ℓ}(G_{F(σ)}) = ρ_{X_η,ℓ}(G_K)`, by Hilbert specialization of the single finite quotient `P/Φ(P)`, where
`P = ρ_{X_η,ℓ}(G_K)` (Noot 1995, §§1.2–1.3, p. 163). Hilbertianity of `F` is imported: InverseGaloisAndArithmeticFundamentalGroups IG.2.4 supplies
finite-extension permanence and Hilbertianity of rational function fields, and IG.2.8 combines them
along a transcendence basis for fields finitely generated over `ℚ`. For a connected finite étale cover of a normal
geometrically irreducible `S`, use a separating Noether normalization on a smooth dense open and
Hilbert irreducibility of the composite finite cover to obtain a closed point with connected
fibre. Applied to the `P/Φ(P)`-torsor, this gives surjectivity to that quotient, and Frattini
detection gives full compact image. This closed-point argument carries the constant-field part
of the torsor and does not require an `F`-rational point on `S`
(Serre, *Topics in Galois Theory*, §3.2; Noot, §§1.2–1.3).
*Needs:* 5.0a; ArithmeticGaloisRepresentations §6.1 (torsion and Tate representation),
§7.6 (Zariski closures), §6.4a **Finite Frattini quotient of a compact matrix group**;
InverseGaloisAndArithmeticFundamentalGroups IG.2.4 (Hilbertian fields and Hilbert
irreducibility, finite-extension permanence, rational function fields), IG.2.6 **Full-group
specialization** and its specialization application of Frattini detection, IG.2.8 (Hilbertianity
of fields finitely generated over `ℚ`); SchemeAndStackFoundations finite normalization.
The Noether-normalization bridge to closed points with connected fibre, the full-image
specialization and the abelian-scheme comparison are subtargets here.

**Checks.**

- For the cover `Y² = T` over `G_m/ℚ`, the fibre at `T = 2` has full group `C₂`; the fibre at
  `T = 1` does not, even though both fibres have degree two.
- For `P = ℤ_ℓ`, surjectivity of the specialized image modulo `ℓ` forces equality with `P`.
- A variety without an `F`-rational point still has closed specialization points of finite degree;
  over `ℂ` the cover `Y² = T` has split closed fibres, showing why the Hilbertian input is needed.

### 6.1 Degeneracy maps and monodromy adjoints

Let `R` be henselian and let homomorphisms between semistable abelian varieties (the degeneracy
maps between modular Jacobians supplied by ModularCurvesPartII, which consumes this roadmap, are
the intended instances) be given. Prove `DegeneracyFunctoriality`: each homomorphism `f : A → B`
extends to the Néron models (1.5) and induces the contravariant character map
`f_T^* : X_B → X_A` (2.4), the covariant component map `f_* : Φ_A → Φ_B` (2.2), the dual maps for
`f^∨`, and the commutative diagrams `u_A(y, f^* x) = u_B((f^∨)^* y, x)` and
`⟨f_* a, b⟩_B = ⟨a, (f^∨)_* b⟩_A` of 4.3 and 4.6 (SGA 7 I, Exposé IX, 10.2.6–10.2.8, p. 441;
§1.2, p. 323). No level-lowering statement and no exactness of Néron models is asserted.
*Needs:* 1.5, 2.2, 2.4, 4.3, 4.6.

**Checks.**

- The source and target of the character map are reversed relative to `f`.
- For `f = [m]` the character map is multiplication by `m` and the component map is
  multiplication by `m`.
- For an isogeny of Tate curves with parameters `q` and `q^m` the adjunction identity reads
  `n·(m y)·x = (mn)·y·x` on the rank-one lattices.

### 6.2 Character exact sequences with verified kernels

Given a commutative diagram of two short exact sequences of finite free lattices
`0 → L₁ → L → L₂ → 0` and `0 → D₁ → D → D₂ → 0`, with vertical maps
`u₁, u, u₂` identified with the relevant monodromy adjoints, prove `CharacterExactSequences`: the snake lemma gives the induced sequence of component
groups with its kernel and cokernel terms (SGA 7 I, Exposé IX, 10.2.6–10.2.8, p. 441;
Theorem 11.5, p. 455). Applied to degeneracy maps between modular Jacobians, the exactness of the
torus sequence and the saturation of the lattices are hypotheses that the consumer establishes;
they are not consequences of an exact sequence of abelian varieties (Yuan–Zhang, Erratum,
introduction, p. 1). *Needs:* 4.5, 6.1; ReductiveGroups Layer 4.

**Checks.**

- For a supplied product-torus sequence the two lattice rows split, and block-diagonal
  monodromy maps give the direct sum of their two component cokernels.
- For `T₁ = μ_n`-type non-torus kernels the hypothesis fails and nothing is asserted: the
  sequence must consist of tori.
- The finite cokernels of the three monodromy maps are not erased: the snake lemma relates
  three component groups in a short exact sequence when both lattice rows are short exact
  and all three vertical monodromy maps are injective. Nonzero vertical kernels produce the
  usual connecting term; they must be specified rather than inserted by assumption.

### 6.3 Semistable base change of the differential lattice

Let `K` be a number field, `S` the spectrum of its ring of integers (or a localisation), `A`
semistable at every finite place of `S`, and `K'/K` a finite extension with Dedekind base `S'`.
Prove `SemistableDifferentialBasechange`: the pullback to `S'` of the lattice `ω_A` of 1.11
identifies with the lattice of the identity Néron model of `A ×_K K'` at every finite place,
including ramified ones (Yuan–Zhang, §1.1, p. 534). The proof is 3.3 place by place, the
localisation statement of 1.11, and gluing over the Dedekind base; the component groups change
and the full models do not pull back. *Needs:* 1.11, 3.3.

**Checks.**

- For a Tate curve the differential `du/u` on the identity torus is unchanged by ramified base
  change while the component group grows; no identification with `dq/q` is claimed.
- For good reduction everywhere the statement is base change of abelian schemes and 1.8;
  the extension need not be étale.
- Without semistability the identity model can change (additive reduction becoming good), and
  the statement fails.

### 6.4 Isogenies and the differential lattice

Let `K` be a number field, `A, B` abelian varieties of the same dimension with global Néron
models, and `f : A → B` an isogeny. Prove `IsogenyDifferentialExport`: `f` extends to a
homomorphism of Néron models and induces an inclusion `f^* : ω_B → ω_A` of finite projective
lattices of the same rank with torsion cokernel, invertible after tensoring with `K`; the length
of the cokernel at each finite place is the local datum the height theory consumes, and no
degree-only formula and no vanishing of the `p`-primary contributions is asserted.
Derive the inclusion from 1.5 and the isogeny identity `f′ ∘ f = [deg f]`: on the generic
cotangent spaces multiplication by the nonzero integer `deg f` is invertible in characteristic
zero, and the lattices are torsion-free by 1.11. This is a formal consequence of those targets,
not the general statement of Yuan–Zhang's specialised CM erratum (introduction, p. 1,
Theorems 1–2, p. 2); that erratum supplies the warning against exactness of Néron models.
*Needs:* 1.5, 1.11, 5.2; AbelianSchemesAndArithmeticModuli A3 (the isogeny identity).

**Checks.**

- At a place `v | p` dividing the degree of `f`, `f^*` can fail to be an isomorphism even when
  both varieties have good reduction there: an isogeny of degree `p` whose reduction at `v` is
  the Frobenius of an ordinary elliptic curve has `f^* ω ≡ 0` modulo `p`.
- At a place prime to the degree with good reduction, `f^*` is an isomorphism.
- The ranks of `ω_A` and `ω_B` are equal, so the cokernel is torsion.

### 6.4a Kummer theory of the connected Néron model

**Connected Néron Kummer sequence.** Let `S` be a Dedekind scheme with function field `K`,
`A/K` an abelian variety with marked Néron model `M/S`, and `G = M⁰` its open identity model.
Assume `A` is semistable at every closed point of `S`. Prove `ConnectedNeronKummer`: for every
integer `m > 0`, multiplication `[m] : G → G` is faithfully flat, quasi-finite and of finite
presentation, and
`0 → G[m] → G --[m]--> G → 0` is exact on the fppf site of `S`. Consequently
`0 → G(S)/mG(S) → H¹_fppf(S,G[m]) → H¹_fppf(S,G)[m] → 0` is exact. Construct the connecting
maps and prove naturality under homomorphisms, restriction to an open subscheme and generic
restriction. For `m | n`, the kernel inclusion and multiplication by `n/m` on the right-hand
copy of `G` give the coefficient transition, hence the corresponding primary direct-limit
sequence. The same assertions hold without semistability if `m` is invertible at every
non-semiabelian geometric fibre of `G`.

On each semiabelian fibre, multiplication is a finite flat surjection; the fibrewise flatness
criterion gives the assertion over `S`. The kernel `G[m]` is separated, quasi-finite and flat,
but need not be finite over `S`: its generic and special ranks can differ. Its finite part over
a henselian trait is the object of 3.5. The sections are `G(S)`, with the component map
`A(K) = M(S) → ⊕_v Φ_{A,v}(κ(v))`; over a number-field integer base its kernel is `G(S)`
and its image is finite. Sources: Mazur, *Modular curves and the Eisenstein ideal*, III,
Lemma 3.3 and its Kummer/direct-limit diagram, p. 149; Milne, *Arithmetic Duality Theorems*,
III, Lemma 5.3, p. 267, for fibrewise exactness. *Needs:* 1.9, 2.1–2.2, 3.1, 3.5;
SchemeAndStackFoundations §§2.1–2.4, 2.10 (sheaf cohomology, torsors and topology comparison);
Mathlib `Sheaf.H.longSequence_exact` and `Sheaf.H.δ_naturality`.

**Checks.**

- For `A = 0` every group in the Kummer sequence is zero; for `m = 1` the kernel, quotient
  of sections and torsion subgroup of `H¹` are zero. Multiplication by zero is excluded.
- For a split Tate curve of dimension one and `m > 1`, the generic kernel has rank `m²`
  and the special kernel `μ_m` has rank `m`. Thus quasi-finite flat torsion is insufficient
  to assert a finite flat kernel of constant rank `m²` over the trait.
- In equal characteristic `p`, an additive elliptic identity fibre is `𝔾_a` and `[p]` on it
  is zero. It is not a surjection of fppf sheaves; the semiabelian-fibre hypothesis cannot
  be omitted when the multiplication integer is divisible by the residue characteristic.
- A nonzero image in a rational component group gives `G(S) ⊊ A(K)`; replacing `G(S)`
  by all generic points changes the left term of the Kummer sequence.

### 6.4b Connected Néron torsors and localization

**Connected Néron localization.** Let `F` be any number field, `S` a nonempty open subscheme
of `Spec 𝒪_F`, `M/S` the marked Néron model of an abelian variety `A/F`, and `G = M⁰`.
Semistability is unnecessary for this target. With `i_v : Spec κ(v) → S`, construct the component
sheaf `𝒫_A = ⊕_v (i_v)_*Φ_{A,v}` and the exact sequence of fppf abelian sheaves
`0 → G → M → 𝒫_A → 0`. Prove `ConnectedNeronLocalization`: the generic restriction image of
`H¹_fppf(S,G) → H¹(F,A)` is exactly
`L_S(A) = ker(H¹(F,A) → ∏_{v ∈ S closed} H¹(F_v,A))`, and there is an exact sequence
`0 → G(S) → A(F) → ⊕_v Φ_{A,v}(κ(v)) → H¹_fppf(S,G) → L_S(A) → 0`.
Construct its maps from the component-sheaf and localization long exact sequences, with
compatibility under homomorphisms and shrinking `S`. For a good-reduction open `U ⊆ S`,
put `D = S ∖ U` and construct the low-degree localization sequence
`0 → G(S) → A(F) → ⊕_{v ∈ D} Φ_{A,v}(κ(v)) → H¹(S,G) → H¹(U,M_U) → ⊕_{v ∈ D} H¹(F_v,A)`.
The étale localization and henselian excision comparison for these smooth group sheaves are
part of this target, transported to fppf cohomology by the smooth-group comparison.
Retain the adjoining terms
`H¹(S,M) → ⊕_v H¹(κ(v),Φ_{A,v}) → H²(S,G)` of the component-sheaf sequence.

The local inputs are `H¹(𝒪_v,G) = 0` by smoothness, connectedness, Lang's theorem and henselian
lifting, and `H¹(𝒪_v,M) ≅ H¹(κ(v),Φ_{A,v})`. Over a good-reduction open, generic restriction
identifies torsors with classes trivial at its finite places. Localization at its complement
gives the displayed sequence: locally `A(F_v)/G(𝒪_v) = Φ_{A,v}(κ(v))`, and the next local
obstruction is `H¹(F_v,A)`. These identifications also hold using henselizations, and comparison
with completions preserves `H¹`. Sources: Milne, *Arithmetic Duality Theorems*, I,
Proposition 3.8 and Remark 3.10, pp. 46–48; II, Lemma 5.5 and (5.5.1), pp. 201–202;
III, Proposition 2.1, p. 246, for the local component calculation. The localization argument
is also the one in III, Proposition 9.2, pp. 295–296, over a finite-field curve.

For `S = Spec 𝒪_F`, identify the all-place localization kernel `Ш(A/F)` with Mathlib's
`ContinuousCohomology.tateShafarevich` in degree one for the discrete geometric point module,
using its membership and kernel-of-product API and the smooth fppf/Galois comparison. Prove
`0 → Ш(A/F) → L_S(A) → ⊕_{v real} H¹(F_v,A)` exact, without asserting surjectivity at the right.
The real groups are killed by `2`; complex `H¹` is zero. Thus `L_S(A)[ℓ∞] = Ш(A/F)[ℓ∞]` for
odd `ℓ`, while at `2` one retains `Ш(A/F)[2∞] ⊆ L_S(A)[2∞]` and its real localization kernel.
This gives the connected-model comparison for any semistable modular Jacobian over `ℚ`,
including the odd equality and dyadic inclusion used in Mazur, III, Lemma 3.3, p. 149;
real-place duality is Milne, I, §3, pp. 45–46. *Needs:* 1.9, 2.1–2.2;
ReductiveGroupsPartII RG2.3.7 (Lang's theorem); SchemeAndStackFoundations §§0.12–0.14,
1.15–1.16, 2.1–2.4, 2.10, 2.15 (henselian lifting, torsors, cohomology and field comparison);
Mathlib `ContinuousCohomology.tateShafarevich`, `mem_tateShafarevich`,
`tateShafarevich_eq_ker_pi`. The comparison uses these intrinsic localization kernels;
height and Selmer consumers identify their abelian Sha carriers with them.

**Checks.**

- For `A = 0`, the component sheaf, torsor groups and both localization kernels vanish.
- If `A` has good reduction throughout `S`, the component terms vanish and generic restriction
  injects `H¹(S,G)` with image `L_S(A)`; it imposes no condition at finite places removed from `S`.
- Nonzero rational components remain between `A(F)` and `H¹(S,G)`; the kernel of generic
  restriction is `coker(A(F) → ⊕_v Φ_{A,v}(κ(v)))`, which need not vanish.
- Over `ℝ`, the elliptic curve `y² = x³ − x` has two connected components and
  `H¹(ℝ,E) ≅ ℤ/2`. Real local triviality is an additional condition at `2`; this local
  calculation alone does not assert a global torsor violating it. At odd primes the real
  target vanishes on primary parts.

### 6.4c Isogenies and component defects

**Néron isogeny component defects.** Let `S` be a Dedekind scheme, and let `f : A → B` be any
isogeny of abelian varieties over its function field, with their marked Néron models `M_A,M_B`.
Form `𝒫_A = M_A/M_A⁰ = ⊕_v (i_v)_*Φ_{A,v}` by gluing the component projections of 2.2,
and similarly for `B`. Write `f⁰ : M_A⁰ → M_B⁰` and `φ : 𝒫_A → 𝒫_B` for their induced maps.
In fppf abelian sheaves put `K⁰ = ker f⁰`, `Q⁰ = coker f⁰`, `K = ker f`, `Q = coker f`.
Prove `NeronIsogenyComponentDefects`: the component diagram gives the natural exact sequence
`0 → K⁰ → K → ker φ → Q⁰ → Q → coker φ → 0`.
Together with the two short exact sequences obtained by factoring each of `f,f⁰` through
its sheaf image, give their cohomology long exact sequences and their generic and local
restriction diagrams. In particular a four-term kernel/cokernel sequence is not itself a
short exact sequence to which a three-term cohomology sequence can be applied.

If `A` is semistable throughout `S`, then so is `B`, and `f⁰` is a quasi-finite faithfully flat
surjection by its fibrewise isogeny property. Thus `Q⁰ = 0`,
`0 → K⁰ → K → ker φ → 0` is exact and
`Q ≅ coker φ = ⊕_v (i_v)_*coker(Φ_{A,v} → Φ_{B,v})`.
The cokernel is a finite component skyscraper sheaf. For arbitrary reduction retain `Q⁰`; neither
flatness of the full kernel nor a component-only description of the cokernel is assumed.
Sources: Mazur, *Modular curves and the Eisenstein ideal*, III, (3.7) and Proposition 3.6,
pp. 150–151, for the sheaf kernel/cokernel and its cohomological use; the general defect
sequence is the snake lemma on the two component rows. Semistable fibrewise isogenies are
2.5 (Conrad, Proposition 4.1, pp. 8–9). The specific Eisenstein isogeny's kernel and component
map are determined by the consumer. *Needs:* 1.5, 2.1–2.2, 2.5, 3.2, 6.4b;
SchemeAndStackFoundations §§2.1–2.4; Mathlib's snake lemma and sheaf cohomology long exact sequence.

**Checks.**

- For an isomorphism, both kernel and cokernel and all component defects vanish. With good
  reduction, `φ` is the map `0 → 0`, so `K = K⁰` and `Q = 0`.
- For split Tate curves `E_q → E_{q^m}`, `[z] ↦ [z^m]`, with `ord(q) = n > 0` and `m > 1`,
  the component map is `ℤ/n → ℤ/(mn)`, `r ↦ mr`: its kernel is zero and its cokernel is
  `ℤ/m`. The sheaf cokernel is therefore nonzero at the closed point, although the generic
  isogeny is surjective.
- Multiplication by `m` on a split Tate curve with `ord(q) = n` gives both component kernel
  and component cokernel of order `gcd(m,n)`; when this exceeds one, the full kernel differs
  from the identity-model kernel and the component cokernel is retained.
- For multiplication by `p` on an additive elliptic identity fibre in characteristic `p`,
  the map on `𝔾_a` is zero. The identity cokernel `Q⁰` has a nonzero special-fibre quotient,
  so the semistable component-only cokernel formula cannot be extended to this case.

### 6.4d Exact cotangents of semistable quotients

**Semistable quotient cotangents.** Let `K/ℚ_p` be any finite extension, `𝒪 = 𝒪_K`, and
`e = v_K(p) < p − 1`. For every exact sequence of abelian varieties
`0 → A --i--> B --q--> C → 0` with `B` semistable, prove `SemistableQuotientCotangent`:
`A,C` are semistable and the maps on their connected Néron models give exact sequences
`0 → Lie(M_A⁰) → Lie(M_B⁰) → Lie(M_C⁰) → 0` and
`0 → ω_C --q^*--> ω_B --i^*--> ω_A → 0`
of finite free `𝒪`-modules. In particular `coker q^* ≅ ω_A` is free and every scalar extension,
including tensoring with the residue field, preserves exactness. The quotient map has connected
kernel `A`; an isogeny with nontrivial finite kernel is a different hypothesis.

The finite-flat step is part of this target: take the connected components of the henselian
finite parts of the `p^r`-torsion from 3.5. Under the ramification bound the sequence of these
connected finite flat groups is exact for every `r ≥ 1`; their compatible formal groups give
the tangent sequence, and duality gives the cotangent sequence. Sources: Mazur,
*Rational isogenies of prime degree*, §1(d), Propositions 1.2–1.3 and Corollary 1.1,
pp. 135–137; the strict-bound counterexample is §1(e), p. 138. This supplies the free quotient
needed for integral differential and formal-immersion applications; the equal-rank inclusion
of 6.4 has a torsion cokernel instead.

For the modular specialization in a consumer, let `N ≥ 1`,
`m_N = ∏_r r^⌊v_r(N)/2⌋`, and work over `ℤ[1/m_N]`. At every odd prime remaining in this base,
a connected quotient of a semistable modular Jacobian satisfies the theorem with `e = 1`.
This includes `p ∥ N`, where reduction can be multiplicative. The application to integral
regular differentials uses the consumer's Picard/dualizing comparison (Mazur, §2(d–e),
pp. 140–141); the theorem here quantifies over all semistable abelian sequences and every
finite `K/ℚ_p` satisfying the bound. *Needs:* 1.5, 1.11, 3.5;
AbelianSchemesAndArithmeticModuli A3, A6.3–A6.5 (torsion, abelian subvarieties and quotients);
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.3, R07.1.9, R07.1.30
(henselian finite parts, connected torsion and full faithfulness for `e < p − 1`);
SchemeAndStackFoundations §3.8 (invariant differentials).

**Checks.**

- For `B = A × C` the sequences split, with cotangent ranks `dim C`, `dim A + dim C`,
  `dim A`. They include `A = 0` and `C = 0`.
- Multiplication by `p` on a good elliptic Néron model induces `p : ω → ω`, with cokernel
  `𝒪/p𝒪`; its residue map is zero. An isogeny lattice injection does not provide this theorem's
  free quotient or its residue-field injectivity.
- At `p = 2, e = 1`, Serre's example in Mazur §1(e) takes good elliptic curves `E,E'` with
  respectively an étale order-two subgroup generated by `P` and a multiplicative one
  generated generically by `P'`. For `B = (E × E')/⟨(P,P')⟩`, the generic sequence
  `0 → E → B → E'/μ₂ → 0` is exact, but the special-fibre cotangent map from the quotient
  to `B` is zero. Thus the conclusion fails at the boundary `e = p − 1`, even with good reduction.
- For an optimal quotient of a semistable modular Jacobian at an odd `p ∥ N`, the residue
  cotangent injection holds although good reduction is not assumed. Inverting the primes
  dividing `m_N` removes precisely the primes with `p² | N`, rather than all primes dividing `N`.

### 6.5 Equation-level and scheme-level good reduction

Let `R` be a discrete valuation ring and `W` a minimal integral Weierstrass model of an elliptic
curve `E` over `K`. Prove `EquationGoodComparison`: Mathlib's `WeierstrassCurve.HasGoodReduction R W`
(the multiplicative valuation of the discriminant is `1`, that is, `ord(Δ) = 0`; equivalently
`hasGoodReduction_iff_isElliptic_reduction`) holds if and only if the smooth proper Weierstrass
scheme of `W` over `R` (ModularCurves Layer 1 and `AbelianSchemesAndArithmeticModuli:A0.1–A1`) is an
abelian scheme, if and only if `E` has good reduction in the sense of 1.8; the scheme-level
property is independent of the chosen minimal model (Bosch–Lütkebohmert–Raynaud, §1.5,
pp. 20–23). The smooth-locus comparison 2.7 is stated over an arbitrary discrete valuation
ring, so it is applied over `R` itself, with no passage to a larger residue field.
*Needs:* 1.8, 2.7; Mathlib `WeierstrassCurve.HasGoodReduction`,
`hasGoodReduction_iff_isElliptic_reduction`; EllipticCurves Layer 4; ModularCurves Layer 1.

*Lean:* `EquationGoodComparison` in `Suggested.lean` states these equivalences for every DVR
and minimal elliptic equation. It expresses the abelian-scheme model as an object of
`Over (Spec R)` with a group structure, smooth proper geometrically connected structure morphism
and marked generic fibre, and also states smoothness of the projective integral equation.

**Checks.**

- The multiplicative valuation `1` means `ord(Δ) = 0`; a reading `ord(Δ) = 1` would be `I₁`,
  which is bad reduction.
- A non-minimal Weierstrass equation with `ord(Δ) = 12` of a curve with good reduction is not a
  counterexample: the predicate is on the minimal model.
- The comparison holds over an arbitrary discrete valuation ring, not only a strictly henselian
  one.

### 6.6 Equation-level and toric multiplicative reduction

For a minimal integral Weierstrass equation `W` over a discrete valuation ring `R`,
prove `EquationMultiplicativeComparison`: Mathlib's `HasMultiplicativeReduction R W`
(`ord(Δ) > 0`, `ord(c₄) = 0`) holds if and only if the reduced cubic is nodal and the identity
fibre `M_k⁰` is a one-dimensional torus; the residual quadratic of Mathlib's
`HasSplitMultiplicativeReduction` (Tau Ceti's `nodePolynomial`) splits if and only if that torus
is split, so equation-level splitness is torus splitness (Tate, §4, p. 41;
Bosch–Lütkebohmert–Raynaud, §1.5, p. 23, gives the split comparison in residue characteristic
different from `2, 3`).

Tate assumes perfect residue field (§4, p. 41, and §7, p. 47). To prove the stated
arbitrary-field form, include `nodal_normalization_descent`: a cubic with `Δ = 0` and
`c₄ ≠ 0` has a unique ordinary double point, rational over `k`; translate it to the
origin and compute its tangent algebra `D`, the quadratic étale algebra given by
`T² + a₁T − a₂`. The normalisation is `ℙ¹_k`, with the rational point at infinity,
and the two branches form `Spec D`. Its smooth degree-zero Picard group is
`(Res_{D/k} 𝔾_m)/𝔾_m`, a one-dimensional torus, split exactly when `D ≅ k × k`.
The normalisation sequence of 4.1 supplies this descent argument. Comparing the
translated tangent polynomial with `nodePolynomial`, using the library’s
`splits_variableChange_nodePolynomial_map_iff`, proves the splitness equivalence;
no square-class test is used in characteristic `2`. The minimal-regular smooth-locus
comparison 2.7 holds over `R` itself, with the residue field `k` unchanged and possibly
imperfect, so it applies directly.
*Needs:* 2.6, 2.7, 4.1, StableReduction Layer 5;
Mathlib `HasMultiplicativeReduction`, `HasSplitMultiplicativeReduction`; Tau Ceti
`nodePolynomial`, `splits_variableChange_nodePolynomial_map_iff`; EllipticCurves Layer 4.

**Checks.**

- Good and multiplicative reduction are exclusive on both sides.
- Splitness is a statement over `k`, not over `k̄`: every multiplicative curve is split over
  `k̄`, and the comparison must keep the residue field.
- Over `ℤ₂`, the minimal equations `y² + xy = x³ + a₂x² + 2` with `a₂ = 0, 1`
  have nodal reduction and `c₄` a unit. Their tangent polynomials over `𝔽₂` are
  `T² + T` (split) and `T² + T + 1` (irreducible), respectively; the identity tori
  are split and nonsplit. Testing whether the discriminant is a square fails here.
- Tau Ceti's `exists_quadraticTwist_hasSplitMultiplicativeReduction` produces a split twist,
  whose torus is `𝔾_m`.

### 6.7 The minimal discriminant and the regular fibre

Prove `EquationDiscriminantComparison`: EllipticCurves' `localMinimalDiscriminant` valuation
`v(Δ_min)` (Tau Ceti `localMinimalDiscriminantValuation`) is invariant under changes of minimal
equation, equals `n` for type `Iₙ`, and for the additive types equals the tame table values of
2.9 when `char k ≠ 2, 3`, the wild values being those of the full Tate algorithm (Tate, §6,
discriminant row and the restriction, p. 46). The relation with the conductor,
`v(Δ_min) = f(E) + m − 1` (Ogg's formula), is 5.3e's conductor–discriminant
comparison. *Needs:* 5.3a–5.3b, 5.3e; 2.8 (`KodairaConfiguration`), 2.9; EllipticCurves Layer 4;
Tau Ceti `localMinimalDiscriminantValuation`.

**Checks.**

- `I₀`, `I₁`, `II` have the same component count and discriminant valuations `0`, `1`, `2` in the
  tame case.
- `I₅` has `v(Δ_min) = 5`.
- For `char k = 2` the valuation of a type-`II*` curve can exceed `10`.

### 6.8 The Tamagawa number counts rational components

Let `R` be complete with finite residue field `k`. Prove `EquationComponentComparison`:
EllipticCurves Layer 4's local index `c_p = [E(K) : E₀(K)]` equals `#Φ_E(k)`, through 2.6; the
geometric component count `m` and `#Φ_E(k̄)` are different invariants (Tate, §§4–6, pp. 41–46).
*Needs:* 2.2, 2.6, 2.8; EllipticCurves Layer 4.

**Checks.**

- Nonsplit `Iₙ` has `c_p = 1` for odd `n` and `2` for even `n`, while `#Φ(k̄) = n` and `m = n`
  by the fixed-point calculation of 2.2.
- `I₀*` has `m = 5` and `#Φ(k̄) = 4`; `c_p ∈ {1, 2, 4}` according to the Galois action.
- Split `Iₙ` has `c_p = n`.

### 6.9 The minimal differential generates the Néron lattice

Let `R` be a discrete valuation ring and `W` a minimal integral Weierstrass equation. Prove
`EquationMinimalDifferential`: the invariant differential `dx/(2y + a₁x + a₃)` of EllipticCurves
Layer 1, with its alternative expression on the chart where that denominator vanishes, is a
basis of the local lattice `ω_E` of 1.11; under a change between minimal equations it is
scaled according to the explicit convention
`x = u²x' + r`, `y = u³y' + s u²x' + t`: the old differential pulls back to
`u⁻¹` times the primed differential (and `Δ_old = u¹² Δ_primed`); for two minimal
equations `u` is a unit (Tate, Theorem 4.2 and the differential
computation, pp. 42–43). The comparison identifies the smooth-locus charts of the Weierstrass
scheme with charts of the Néron model (2.7) and the pullback of `Ω¹` along the identity section
(SchemeAndStackFoundations §3.8); it is not `dq/q` of a Tate parameter. *Needs:* 1.11, 2.7;
EllipticCurves Layer 1; SchemeAndStackFoundations §3.8.

**Checks.**

- In residue characteristic `2` or `3` the chart with denominator `3x² + 2a₂x + a₄ − a₁y` is
  used where `2y + a₁x + a₃` vanishes; no division by a vanishing denominator occurs.
- For residue characteristic at least `5`, compare `y'² = x'³ + 1` with
  `y² = x³ + π⁶`, under `x = π²x'`, `y = π³y'`. The second discriminant has valuation
  `12`, and its differential pulls back to `π⁻¹ω_min`; it lies outside the Néron lattice,
  so it is not a generator. Reversing the coordinate map reverses the scaling direction.
- For good reduction the basis element is the Néron differential of the abelian scheme.

### 6.10 The compatible system of an abelian variety

Let `F` be a number field and `A` an abelian variety over `F`. Prove
`StrictCompatibleSystemExport`: for `0 ≤ i ≤ 2 dim A`, the representations
`H^i_ét(A_F̄, ℚ_ℓ) = Λ^i H¹`, after extension to `ℚ̄_ℓ`, form a strictly compatible
system defined over `ℚ`, pure of weight `i`, with the Weil–Deligne conventions of
ArithmeticGaloisRepresentations Layer 2 (§2.4); `H¹` is the dual of the homological Tate module, and
for an abelian surface the `GSp₄` multiplier of `H¹` is `ε_ℓ^{-1}`
(Boxer–Calegari–Gee–Pilloni 2021, Proposition 2.8.1, Definition 2.8.2 and Remark 2.8.3,
pp. 194–195; the printed `dim X` is `dim A`). Here the local parameter is a
Weil–Deligne representation over `ℚ̄`, with isomorphism class invariant under
`Aut(ℚ̄/ℚ)`, whose scalar extensions give all Frobenius-semisimplified local
realisations. This is the geometric compatibility of Noot 2013 §2.3, p. 254,
and Fontaine Exposé VIII §§2.4.1–2.4.2, p. 342; it does not assert a chosen
representation on a `ℚ`-vector space. The identification `H^i = Λ^i H¹` itself, by cup
product and naturally in `A`, is AbelianSchemesAndArithmeticModuli A4.4, `exteriorCohomology`,
applied over `F̄`; its naturality makes it `Gal(F̄/F)`-equivariant, and it is consumed, not
reproved. The inputs are 3.10 and 3.14 for the local
description at places of bad reduction through the strict `1`-motive, 5.3 at places above `ℓ`,
and the `ℓ`-independence of 5.6; the coefficient-prime trace comparison and
Saito's base-change argument are built below. *Needs:* 3.10, 3.14, 5.3, 5.6;
`AbelianSchemesAndArithmeticModuli:A4.4` (`exteriorCohomology`);
ArithmeticGaloisRepresentations Layer 1 (character comparison) and Layer 2 (§2.4).

Prove `good_abelian_frobenius_polynomial` here for the
good abelian quotient over the valuation ring of finite `K/ℚ_p`: consume its supplied
crystalline realization and Frobenius through the ramified crystalline/de Rham and period
bridges of 5.3, retaining their `K₀`-structures and the comparison after extension to `K`.
The characteristic polynomial of `φ^f`, where `q = p^f`, equals its prime-to-`p`
cohomological Frobenius polynomial by Katz–Messing Theorem 1, pp. 74–75; Coleman–Iovita
§2(ii), pp. 11–12, supplies the good-reduction Frobenius realization. This is the degree-one
abelian comparison.

Then prove `semistable_trace_comparison`, consuming `good_abelian_frobenius_polynomial`.
Let `K/ℚ_p` be finite with residue field
`k = 𝔽_q`, let `A/K` be semistable, and let `g ∈ W_K` have geometric Frobenius degree
`d > 0`. For every coefficient prime, including `p`, the cohomological Weil–Deligne
realisation has an equivariant filtration whose graded pieces are

```text
weight 0: Y^∨ ⊗ ℚ_ℓ,
weight 1: H¹_ét(B_k̄,ℚ_ℓ),
weight 2: X_A ⊗ ℚ_ℓ(-1).
```

At `ℓ = p`, replace the middle piece by `H¹_cris(B_k/W(k))[1/p]` in the
`K₀`-semilinear realisation, and then apply `PadicWeilDeligneRealization` of 5.3
using the canonical parameter fields of SmoothRepresentationsOfLocalGroups SR.5.2,
`classical-llc-normalization`, and the ArithmeticGaloisRepresentations Layer 2 (§2.4) operations.
The lattice pieces retain their unramified Galois action; the geometric Frobenius convention makes the last piece carry the factor `q^d`.
The boundary, pullback and residue maps and their Frobenius actions are constructed in
5.3's `RaynaudFilteredRealization.deRham_exact` and `semiabelian_frobenius`, before the
period comparison. Consume them here through `RaynaudPeriodComparison` and
`PadicComparison`; their equivariant unramified descent retains nonsplit Frobenius
eigenvalues. Coleman–Iovita, arXiv math/9701229v1, Chapter I §2(i–ii), pp. 9–12,
supplies the geometric maps and their splittings, and the introduction, pp. 2–3,
supplies the comparison theorem. The target here is the resulting coefficient-prime
trace comparison of this already constructed full realization.

Consequently the full trace, for `ℓ ≠ p` and for `ℓ = p`, is

```text
tr(r_ℓ(g)) = tr(g | Y^∨⊗ℚ) + tr(Frob_q^d | H¹(B)) + q^d tr(g | X_A⊗ℚ).
```

The middle trace is independent of the cohomology theory: Katz–Messing, Theorem 1,
pp. 74–75, compares crystalline and prime-to-`p` étale Frobenius polynomials of smooth
projective varieties over finite fields; apply it to the abelian variety `B`, then take
powers by Newton identities. The lattice terms are integral representations independent
of `ℓ`. On the prime-to-residue side, 3.5 and Raynaud 1994, §§4.7.3–4.7.4, p. 317,
gives exactly the same three terms after cohomological duality. Additivity of trace in
the filtration proves the coefficient-prime comparison, including the weight-two toric term which
is absent from the local Euler factor. Unit parts of periods can change extensions and
the chosen logarithmic splitting, but do not change these graded Frobenius actions.

Prove `semistable_trace_descent` for arbitrary `A/K` with the same positive-degree `g`
(BCGP 2021, Proposition 2.8.1, proof, pp. 194–195). Choose one prime `ℓ₀ ≠ p` and let
`I₀ = ker(r_ℓ₀|I_K)`, an open subgroup of inertia normalised by `g`. The closure
`H = closure⟨g,I₀⟩` is open in `G_K`: its image in the residue Galois group is
`d·Ẑ`, and `H∩I_K = I₀`. Indeed the closure of the cyclic group generated by `g` maps
isomorphically onto `d·Ẑ` (multiplication by nonzero `d` on `Ẑ` is injective); hence it
has no additional inertia kernel. The fixed field `K'` is a finite extension, `g ∈ W_K'`,
and the original `ℓ₀`-adic inertia on `I_K'` is unipotent. Thus 3.11 gives semistability
over `K'`, and `semistable_trace_comparison` compares the trace of this **same element**
`g` at every prime. Functoriality of the Weil–Deligne construction under finite extension
(ArithmeticGaloisRepresentations Layer 2 (§2.4) for `ℓ ≠ p`,
`PadicWeilDeligneRealization.restrict` for `ℓ = p`) identifies these traces with those over `K`;
no replacement of `g` by an arbitrarily chosen Frobenius lift is allowed. This argument is local and requires no
global field realisation of `K'`.

Finally prove `pure_WD_export`: the monodromy map is a rational isomorphism between
weights `2` and `0` by 4.3 and 5.3, while the abelian piece has weight `1`; hence the
semistable realisations at every prime are pure of weight `1`. Purity descends from a
finite extension (raising Frobenius eigenvalues to a positive power preserves their
weights, and the monodromy isomorphisms survive scalar extension). Noot 2013,
§2.3, p. 254, and Corollary 2.7, pp. 256–257, supply a common Frobenius-semisimple
geometric Weil–Deligne isomorphism class, defined over `ℚ` in the preceding sense,
for the prime-to-residue realisations. The positive-degree trace
comparison identifies its semisimple Weil representation with the coefficient-prime one.
For the character step, the traces of `j·Frob^n` are known for every inertia element `j`
and `n > 0`; the characteristic polynomial of invertible Frobenius gives a recurrence
with nonzero constant term, extending equality to `n = 0` and negative `n`. Brauer–Nesbitt
then applies in characteristic zero (ArithmeticGaloisRepresentations Layer 1). This spells
out the character argument used in BCGP Proposition 2.8.1. Purity then determines the nilpotent
operator up to isomorphism (BCGP Lemma 2.5.1, p. 189, consumed through
ArithmeticGaloisRepresentations Layer 2 (§2.4)).
Thus the same geometric parameter and its `Aut(ℚ̄/ℚ)`-invariance work at `p` as well; equality of traces alone
is not asserted to determine monodromy. Exterior powers give weight `i`, and A4.4's
`H^i = Λ^i H¹` transfers the result to all `H^i`.
*Additional needs:* `RaynaudFilteredRealization`, `RaynaudPeriodComparison` and
`PadicComparison` of 5.3 for the degree-one de Rham maps and their period comparison;
5.3's `PadicWeilDeligneRealization`, reusing
FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.27's
`FilteredPhiNModuleDD.weilDeligne`, for the shared coefficient-prime WD fields,
Frobenius convention and ramified restriction;
CrystallineCohomology CR.2.1 (crystalline cohomology), CR.2.3 (proper smooth formal
comparison over a PD base), CR.3.4 (semilinear Frobenius and its linearization), applied to
`B_k/W(k)`, including `p = 2`; SmoothRepresentationsOfLocalGroups SR.5.2,
`classical-llc-normalization`.
Mathlib `Matrix.trace`, `Matrix.det_fin_two`, exterior powers and characteristic polynomials
supply the linear algebra.

For the rank-one calculation take the diagonal matrix `F = diag(delta,q^d delta)`
on the period/torus graded pieces; in the geometric elliptic instances `delta = 1` or `-1`
is the action of the **chosen element** `g` on both lattices. For `N_n = [[0,n],[0,0]]`,
verify `N_n F = q^d (F N_n)`. For all rational `q,delta` and natural `d`, the trace is
`delta + q^d*delta` and the determinant is `q^d*delta²`. At degree zero,
`F(q,delta,0) = delta·I₂`, and for zero lattice action `F(q,0,d) = 0`.
These last two arithmetic identities also hold at scalars excluded by the geometric
interpretation.

**Checks.**

- For `i = 0` the system has rank one and weight zero; `H^i = 0` for `i > 2 dim A`.
- For an elliptic curve the system at `i = 1` is the dual of the Tate-module system, with
  determinant `ε_ℓ^{-1}`.
- At a place of good reduction the Weil–Deligne representation is unramified with `N = 0`.
- For split multiplicative reduction at `q = 2`, `d = 1`, the full trace is `1+2 = 3`,
  whereas the trace on `ker N` used for the local Euler factor is `1`. For the nonsplit
  case with `delta = -1` the full trace is `-3` and the kernel trace is `-1`.
  The diagonal matrices have determinant `2` in both cases.
- At `q = 2`, `d = 2`, a nonsplit Frobenius generator has `delta = (-1)^2 = 1`, so
  the full trace is `5`. At degree zero the arithmetic matrix has trace `2 delta`,
  but the open-subgroup argument excludes `d = 0`: an inertia element can generate a
  subgroup whose residue image is zero and therefore has infinite index.
- Rank-zero lattice and abelian pieces give trace zero; for a split rank-one toric
  piece plus a good elliptic quotient of Frobenius trace `a`, the full trace is `1+a+q`.
  At `q = 2`, `a = 1`, it is `4`, while the invariant trace is `2`.
  The arithmetic value `q = 1` gives coincident toric eigenvalue weights and is excluded
  from the geometric purity argument since a finite residue field has `q ≥ 2`.
- The Tate periods `5` and `30` over `ℚ₅` have full trace `1+5 = 6` at geometric
  Frobenius, while 5.3's logarithmic construction gives different Hodge filtrations for
  `log(5) = 0`. The trace export retains the Frobenius data without determining the filtration.
- For the good elliptic scheme `y² + y = x³` over `ℤ₂`, the special-fibre degree-one
  Frobenius polynomial is `t² + 2` and its trace is zero in both crystalline and étale
  cohomology. Base change to `ℚ₂(√2)` keeps this polynomial; the comparison bridge also
  covers this ramified field. For `B = 0`, the same target gives polynomial `1`.

### 6.11 Semistable ordinary reduction

For `A` over `ℚ_p`, define `SemistableOrdinaryAdapter`: `A` has semistable ordinary reduction if
it is semistable (3.1) and the abelian quotient `B` of `M_k⁰` is an ordinary abelian variety over
`𝔽_p` (Boxer–Calegari–Gee–Pilloni 2025, Definition 9.1.7, p. 190). The toric rank is unrestricted;
a purely toric fibre has `B = 0` and is ordinary. Prove that the `p`-primary finite and toric
parts of 3.5 (through `p`-divisible groups, not inertia invariants) give the connected–étale
decomposition of the `p`-divisible group of `B`. *Needs:* 2.3, 3.1, 3.5, 3.6;
`AbelianSchemesAndArithmeticModuli:A4.5` (the connected–étale BT tower)
and its ordinary specialisation in A4.10.

**Checks.**

- Good ordinary reduction is semistable ordinary.
- A split Tate curve over `ℚ_p` is semistable ordinary with `B = 0`.
- An abelian surface with good supersingular reduction is not semistable ordinary; ordinarity of
  `B` alone without semistability is not the definition.

### 6.12 The isotropic filtration of an ordinary surface

Let `B` be a principally polarised abelian surface over `ℚ₂` with semistable ordinary reduction.
Prove `OrdinaryIsotropicFiltration`: `T₂(B)` contains a saturated `Gal(ℚ̄₂/ℚ₂)`-stable isotropic
submodule of rank two whose reduction is a Galois-stable Lagrangian subspace of `B[2]`: for toric
rank `t = 2` it is the toric part `T_t` of 3.5 (of rank `2`; the whole `T₂(B)` has rank `4` and
is not isotropic), for `t = 1` the full inverse image in `T_f` of the rank-one connected part of `T_f/T_t`, and for
`t = 0` the connected part of the ordinary `2`-divisible group (Boxer–Calegari–Gee–Pilloni 2025,
proof of Lemma 9.1.8, p. 191, where the toric subscript is missing). *Needs:* 3.5, 3.6, 6.11.

**Checks.**

- For `t = 2` the submodule has rank `2` and `T₂(B)` rank `4`.
- The submodule is saturated, so its reduction has dimension `2` in `B[2]`.
- The reduction is isotropic for the Weil pairing on `B[2]`.

### 6.13 Residual image in `S₅(b)` and a rational two-torsion point

Under the hypotheses of 6.12 and the identification `S₆ ≅ GSp₄(𝔽₂)` fixed by the source, prove
`OrdinaryResidualPointExport`: if the image of the residual representation on `B[2]` lies in the
subgroup `S₅(b)` (one of the two conjugacy classes of `S₅` in `S₆`), then that image is a
`2`-group and `B[2](ℚ₂) ≠ 0` (Boxer–Calegari–Gee–Pilloni 2025, Lemma 9.1.8, p. 191). By 6.12 the
image lies in a Siegel parabolic of order `48`, identified in `S₆` with the centraliser
of `(12)(34)(56)`. Here `S₅(b)` is the standard point stabiliser. Its intersection with
that centraliser has order `8`: fixing one point forces its partner to be fixed, leaving
two pairs with independent swaps and a permutation of those pairs. In particular it is a
`2`-group; a `2`-group acting on a nonzero `𝔽₂`-vector space fixes a nonzero vector
by the pinned `Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one` from
`TauCeti.RepresentationTheory.PGroupInvariants`, at `p = 2` and `k = ZMod 2`.
The `2`-group hypothesis gives `2`-power orders of all elements, and applying the
representation preserves these power identities. The supplied theorem requires neither
finite generation nor finite dimension of the nonzero module. The choice of `S₅(b)` and
the order of the
intersection are finite-group inputs supplied with the statement. *Needs:* 6.12;
Tau Ceti `Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one`; Mathlib
`IsPGroup.of_card`, `IsPGroup.exists_pow_pow_eq_one` and finite group theory.

**Checks.**

- A `2`-group acting linearly on `𝔽₂⁴` fixes a nonzero vector; a group of order `3` permuting
  the three nonzero vectors of `𝔽₂²` fixes none (negative control for the `2`-group hypothesis).
- A rational Weierstrass point of the curve alone, without the ordinary hypothesis, does not give
  the conclusion.
- The Siegel parabolic has order `48 = 16·3`, so it is not a `2`-group; its point-stabiliser
  intersection has order `8`. The other `S₅` conjugacy class is not asserted to give a `2`-group.

### 6.14 Full-level extension for curves

Let `K` be a function field of one variable over a perfect field `k`, `C` a smooth projective
geometrically integral curve of genus `g > 1` over `K`, `J = Jac(C)`, `N ≥ 3` prime to `char K`
(`N = 3` if `char K ≠ 3`, else `N = 4`), and `K' = K(J[N])`. Prove `YuanFullLevelExtension`:
`J ×_K K'` is semistable at every valuation of `K'` trivial on `k` (3.12 at the valuations prime
to `N`); `C ×_K K'` is semistable at those valuations by the curve–Jacobian criterion of
StableReduction Layer 7. Here the residue fields at these places are finite over
the perfect constant field. Deligne–Mumford, §2, Theorem 2.4, pp. 87–90, states the
criterion with algebraically closed residue field; passage to a strict henselisation and
descent of the stable model give this perfect-residue-field form; and `[K' : K] < N^{4g²}` because `Gal(K'/K)` injects into `GSp_{2g}(ℤ/N)`,
whose order is less than `N^{4g²}` (Yuan, Lemma 4.9 and the full-level paragraph, p. 75,
where `J` is the Jacobian of `C`). No height lower bound is asserted. *Needs:* 3.12;
StableReduction Layer 7; `ArithmeticGaloisRepresentations:§§6.1–6.2`,
`AbelianSchemesAndArithmeticModuli:A3` (the Galois action on `J[N]` preserves the Weil pairing).

**Checks.**

- `N = 3` when `char K ≠ 3` and `N = 4` when `char K = 3`.
- The Galois group of `K'/K` is a subgroup of `GSp_{2g}(ℤ/N)`, so its order is less than
  `N^{4g²}`.
- A curve already semistable at a valuation stays semistable after the extension.

### Examples

The worked comparisons of this roadmap combines the layers on four examples, each under its own
hypotheses: an elliptic curve with good reduction over a complete ring with finite residue field
(abelian scheme, `Φ = 0`, `c_p = 1`, `P_v = 1 − aT + qT²`); split multiplicative `Iₙ` (identity
fibre `𝔾_m`, `Φ(k̄) = ℤ/n`, pairing `[n]`, `c_p = n`, `P_v = 1 − T`, components `ℤ/en` after
ramified base change); nonsplit multiplicative `Iₙ` over a finite residue field (nonsplit torus,
Frobenius `−1` on `Φ(k̄)`, `c_p ∈ {1, 2}`, `P_v = 1 + T`); and a regular semistable curve over a
strictly henselian base with algebraically closed residue field whose special fibre has two
components meeting twice (toric rank `1`, cycle pairing `[2]`, `Φ = ℤ/2`), against a rational
tree (`H₁ = 0`, `Pic⁰ = 0`, `Φ = 0`). The unramified-`3`-torsion example of 3.12 (a split Tate
curve over `ℚ₂` with `q = 8` has unramified `E[3]` and multiplicative reduction: semistable, not
good) is the `N = 3`, `k = 𝔽₂` instance used by the abelian-surface modularity consumer.

### Dependencies

All earlier layers; ReductiveGroups Layer 4; EllipticCurves Layers 1 and 4; ModularCurves
Layer 1; StableReduction Layer 7; SchemeAndStackFoundations §3.8;
ArithmeticGaloisRepresentations §§2.1–2.5, 3.1–3.7, 6.1–6.2,
§6.3 **The Tate curve**/**Local Euler factors**, §6.6 **Serre's wild bound**; `AbelianSchemesAndArithmeticModuli:A0.1–A1`,
`A3`, `A4.4`; CrystallineCohomology CR.2.1, CR.2.3, CR.3.4;
SmoothRepresentationsOfLocalGroups SR.5.2, `classical-llc-normalization`;
Mathlib's Weierstrass reduction predicates and `IsPGroup` fixed-point theorems.

## Downstream consumers

- **ArakelovGeometryAndAbelianHeights** (the Hodge bundle and the Faltings metric; the stable
  Faltings height): the differential lattice and Hodge line of 1.11, their localisations, the
  semistable base change of 6.3 and the isogeny lattice export of 6.4.
- **HeegnerPointEulerSystems** (geometric norm and reduction-congruence relations; local
  reciprocity): the identity component, component group and rational-versus-geometric
  distinction of 2.1–2.2 and the elliptic comparisons of 2.6 and 6.8.
- **ModularCurvesPartII** (Jacobians and integral Hecke actions): the Picard–Néron identity
  comparison 3.9, the character lattices 4.2 and the degeneracy functoriality 6.1–6.2 for
  modular Jacobians, and the graph and semistable torsion interfaces of 4.2 and 4.14
  (produced by its §12 with the §13 Hecke correspondences).
- **GrossZagierAndArithmeticHeights** (admissible pairings on arithmetic surfaces; local
  arithmetic identities): the monodromy pairing 4.3–4.4, the component pairing 4.6 and the
  intersection-matrix description 4.7.
- **RankZeroOneBSD** (arithmetic invariants; the Heegner index formula): the Tamagawa numbers of
  6.8 and the component groups of Layer 4.
- **SerreWeightAndLevelOptimisation** (level-changing algebra): the character exact sequences
  and monodromy adjoints of 6.1–6.2, the component cokernel 4.5 and the one-place and
  two-place torsion laws of 4.14 for its §§2.6–2.10.
- **HilbertModularVarietiesAndShimuraCurves** R18.5.17–R18.5.18: produces the
  quaternionic graph and semistable Jacobian realizations of 4.2 and 4.14.
- **SmallRamificationAndAbelianVarietyBaseCases** (Schoof's semistable small-prime theorem):
  the semistable reduction predicate 3.1, the full-level criterion 3.12 and the conductor
  formula 5.5.
- **FaltingsFinitenessAndIsogenyTheorems** (height finiteness on arithmetic moduli): the
  isogeny differential export 6.4, isogeny invariance of good reduction 5.2 and semistable
  reduction after a finite extension 3.10.
- **ComplexMultiplicationAndExplicitReciprocity** (reduction, isogenies and certified
  computation): Néron–Ogg–Shafarevich 5.1 and the good-reduction comparison 6.5.
- **PadicHodgeTheory** R06.6: the semistable reduction predicate 3.1, which that roadmap uses to
  state its semistable comparison.
- **SelmerIwasawaCohomology** §4.26: `AbelianVariety.deRham`, `PadicComparison` and
  finite-extension descent from 5.3, and the Raynaud uniformisation of 3.13–3.14,
  for its elliptic tangent, exponential and Kummer comparison on the shared `D_dR`.
- **StableReduction** Layer 7 (the curve–Jacobian criterion): local existence 1.7, the
  semistable predicate 3.1 and the Picard–Néron comparison 3.9.
- **NeronModelsAndSemistableAbelianVarieties Part II** and **JacobianChallenge Part II**: the
  component groups and configurations of Layer 2, the Picard theory of Layer 4 and the stable
  Picard scheme 4.13.
- The modularity of abelian surfaces over `ℚ` (through PotentialModularityAndCompatibleSystems
  and its successors): the compatible system 6.10, the ordinary adapters 6.11–6.13 and the
  unramified-`3`-torsion example of 3.12.

- **EisensteinIdealAndRationalTorsion**: Kummer theory of the connected Néron model (6.4a),
  connected Néron torsors and localization (6.4b), isogenies and component defects (6.4c) and
  exact cotangents of semistable quotients (6.4d). Its Eisenstein-specific kernels, component maps,
  integral modular differential comparison and formal-immersion theorem remain with the consumer.

## References

- B. Mazur, *Modular curves and the Eisenstein ideal*, Publ. Math. IHÉS 47 (1977), 33–186;
  [public text](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf): III, Lemmas 3.2–3.3,
  pp. 148–149, (3.7) and Proposition 3.6, pp. 150–151, for 6.4a–6.4c.
- B. Mazur, *Rational isogenies of prime degree*, Invent. Math. 44 (1978), 129–162;
  [public text](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf): §1(d),
  Propositions 1.2–1.3 and Corollary 1.1, pp. 135–137; §1(e), p. 138; §2(d–e), pp. 140–141,
  for 6.4d and its strict-bound and modular Checks.
- J. S. Milne, *Arithmetic Duality Theorems*, second edition, 2006;
  [author text](https://www.jmilne.org/math/Books/ADTnot.pdf): I, §3, pp. 45–48;
  II, Lemma 5.5, pp. 201–202; III, Proposition 2.1, p. 246, Lemma 5.3, p. 267,
  and Proposition 9.2, pp. 295–296, for 6.4a–6.4b.

- K. A. Ribet and W. A. Stein, *Lectures on Serre's conjectures*,
  [author text](https://wstein.org/papers/serre/ribet-stein.pdf): §3.9, (3.1) and
  Lemma 3.17, pp. 45–47; B. Conrad's Chapter 5 in the same text, Theorem 5.12,
  p. 73, and §5.3, Theorem 5.16, pp. 74–75, for the geometric Hecke and
  Frobenius comparisons instantiated in 4.14.

- A. Hatcher, *Algebraic Topology*, Cambridge University Press, 2002;
  [author text](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf): §1.A, Proposition 1A.1 and
  tree paths, pp. 83–85; §2.2, cellular boundary, pp. 140–141, and coefficients, pp. 153–154;
  Chapter 3, graph cohomology calculation, p. 187, for the supplied graph core and its
  dual-graph identifications in 4.2.
- S. Bosch, W. Lütkebohmert and M. Raynaud, *Néron Models*, Ergebnisse der Mathematik 21,
  Springer, 1990. Chapter 1 (§§1.1–1.5) for Layer 1 and 2.7; §9.4, Theorem 1, p. 259, for 4.13;
  p. 190, Example 8, for the failure of exactness.
- Q. Liu and J. Tong, *Néron models of algebraic curves*, Trans. Amer. Math. Soc. 368 (2016),
  7019–7043; [author version of 16 December 2013](https://www.math.u-bordeaux.fr/~jtong/Recherche/Neron.pdf):
  Proposition 2.4 (pp. 3–4), Corollary 3.2 (p. 8), Theorem 4.1 and its proof (pp. 12–13) and
  Remark 4.5 (p. 14), for 2.7 over an arbitrary discrete valuation ring.
- B. Conrad, *Semistable reduction for abelian varieties*, lecture notes, Stanford, 2011
  (35 pages). §§2–7 for Layers 2–5. The corank in the paragraph after Lemma 5.4 (p. 18) reads
  `2g − (2t + a)` and should read `2g − (t + 2a) = t`; the inference at p. 21 from equal rational
  fixed spaces to equal finite-level torsion is not valid and is replaced in 3.11.
- A. Grothendieck, *Groupes de monodromie en géométrie algébrique I* (SGA 7 I), Exposé IX,
  Lecture Notes in Mathematics 288, Springer, 1972: §1 (pp. 321–324), §§9.4–9.6 (pp. 427–438), Theorem 10.4 (p. 444),
  Theorem 11.5 and §11.6 (pp. 455–456), Theorem 12.1 (pp. 465–467), §§12.3–12.5 (pp. 469–475).
- M. Raynaud, *1-motifs et monodromie géométrique*, Astérisque 223 (1994), 295–319: §4.2
  (pp. 302–305), §4.3 (pp. 308–309), Propositions 4.6.1 and 4.7.4 (pp. 315–317).
- J. Tate, *Algorithm for determining the type of a singular fiber in an elliptic pencil*,
  Lecture Notes in Mathematics 476 (1975), 33–52: §§4–6 (pp. 41–46), §§7–8 (pp. 47–52);
  [public scan](https://www.wstein.org/Tables/antwerp/tate/tate.pdf).
- A. Werner, *On Grothendieck’s pairing of component groups in the semistable reduction case*,
  J. reine angew. Math. 486 (1997), 205–215: §§3–5, pp. 209–214, Proposition 5.1,
  pp. 213–214; [public scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0486/LOG_0012.pdf).
- X. Yuan and S.-W. Zhang, *On the averaged Colmez conjecture*, Annals of Mathematics 187
  (2018), 533–638: §1.1 (p. 534), §2.3 (pp. 549–550); and their Erratum, Annals of Mathematics
  198 (2023), 867–878 (author version of 18 December 2022, pp. 1–2).
- X. Yuan, *Arithmetic bigness and a uniform Bogomolov-type result*,
  arXiv:2108.05625v4 (2024): §3.1.3 and Lemma 3.4 (pp. 43–44), Lemma 4.9 and the full-level
  paragraph (p. 75, where the Jacobian `J` is that of `C`).
- F. Calegari and D. Geraghty, *Minimal modularity lifting for nonregular symplectic
  representations*, Duke Math. J. 169 (2020), 801–896; Appendix, *Bloch–Kato conjectures
  for automorphic motives*, by F. Calegari, D. Geraghty and M. Harris, Lemma A.7 and proof,
  author p. 89 (journal p. 889); [author copy](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf).
- M. Bhargava, B. H. Gross and X. Wang, *A positive proportion of locally soluble hyperelliptic
  curves over ℚ have no point over any odd degree extension*, arXiv:1310.7692v2: §3 (pp. 9–12),
  Proposition 22 (p. 11).
- G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Abelian surfaces over totally real fields are
  potentially modular*, Publ. Math. IHÉS 134 (2021): Proposition 2.8.1, Definition 2.8.2 and
  Remark 2.8.3 (pp. 194–195; the statement reads `dim X` for `dim A`).
- G. Boxer, F. Calegari, T. Gee and V. Pilloni, *Modularity theorems for abelian surfaces*,
  arXiv:2502.20645v1 (2025): Definition 9.1.7, Lemma 9.1.8 (pp. 190–191; the proof omits the
  toric subscript on `T₂(B)`), Lemma 9.2.2 (p. 192).
- B. Poonen and E. Schaefer, *Explicit descent for Jacobians of cyclic covers of the
  projective line*, author manuscript of 10 February 1997: Proposition 10.3 and proof, pp. 18–20.
- J. S. Milne, *Jacobian varieties*, revised author notes: Theorem 10.1 and proof, pp. 33–35.
- R. Noot, *The system of representations of the Weil–Deligne group associated to an abelian variety*,
  Algebra & Number Theory 7 (2013): §2.3, p. 254, Corollary 2.7, pp. 256–257.
- L. Illusie, *Grothendieck and vanishing cycles*, Annales de la Faculté des Sciences de
  Toulouse 30 (2021): Theorem 4.1 and footnote 12, p. 95; §4.3, pp. 97–98.
- P. Deligne and D. Mumford, *The irreducibility of the space of curves of given genus*,
  Publ. Math. IHÉS 36 (1969): §2, Theorem 2.4, pp. 87–90.
- J.-M. Fontaine, *Sur certains types de représentations p-adiques du groupe de Galois d'un corps
  local; construction d'un anneau de Barsotti–Tate*, Annals of Mathematics 115 (1982), 529–577;
  and *Le corps des périodes p-adiques*, Astérisque 223 (1994), 59–111;
  *Représentations p-adiques semi-stables*, same volume, 113–184, §§3.1, 3.8–3.9,
  5.1.1–5.1.7 and the following theorem (pp. 136–137, 142–143, 155–158);
  *Représentations ℓ-adiques potentiellement semi-stables*, same volume, 321–347:
  §§1.1.1, 1.3.5, Theorem 2.3.2 and §2.3.7 (pp. 322–323, 329, 336–337, 339–340),
  §§2.4.1–2.4.2, p. 342; [public scan](https://www.numdam.org/item/AST_1994__223__321_0.pdf).
- R. Coleman and A. Iovita, *The Frobenius and monodromy operators for curves and abelian
  varieties*, Duke Mathematical Journal 97 (1999), 171–215; [public author version](https://arxiv.org/pdf/math/9701229v1),
  introduction pp. 2–3 and Chapter I §2, pp. 9–12.
- O. Brinon and B. Conrad, *CMI Summer School Notes on p-adic Hodge Theory*,
  [author notes](https://math.stanford.edu/~conrad/papers/notes.pdf), §8.3,
  Proposition 8.3.8 and the Tate-curve filtration calculation, pp. 123–126.
- J. S. Milne, *Abelian Varieties*, [revised author notes](https://www.jmilne.org/math/xnotes/AVs.pdf),
  §19, Theorem 19.1 and Lemmas 19.2–19.3, pp. 40–41, for the good-abelian Frobenius
  eigenvalue separation in 5.3.
- G. Faltings and C.-L. Chai, *Degeneration of Abelian Varieties*, Ergebnisse der Mathematik
  22, Springer, 1990: Chapter II §§1–3, pp. 33–37, Theorem 6.2 and Remark 6.3,
  pp. 51–52; Chapter III Theorem 7.1, Corollaries 7.2–7.4 and §8, pp. 76–78.
- N. Katz and W. Messing, *Some consequences of the Riemann hypothesis for varieties over
  finite fields*, Inventiones mathematicae 23 (1974), 73–77: Theorem 1, pp. 74–75;
  [author-hosted scan](https://web.math.princeton.edu/~nmk/old/katzmessing.pdf).
- M. A. Bennett, S. Siksek, *A conjecture of Erdős, supersingular primes and short character sums*,
  Ann. of Math. 191 (2020), 355–392.
- A. Brumer, K. Kramer, *The conductor of an abelian variety*, Compositio Math. 92 (1994), 227–248.
- H. Darmon, F. Diamond, R. Taylor, *Fermat's Last Theorem*, revised version (2007) of Current
  Developments in Mathematics 1995.
- Q. Liu, *Conducteur et discriminant minimal de courbes de genre 2*, Compositio Math. 94 (1994), 51–79.
- J. S. Milne, *Abelian Varieties*, course notes, version 2.00, 2008.
- R. Noot, *Abelian varieties — Galois representation and properties of ordinary reduction*, Compositio
  Math. 97 (1995), 161–171.
- R. Richard, A. Yafaev, *Generalised André–Pink–Zannier conjecture for Shimura varieties of abelian
  type*, arXiv:2111.11216v4.
- T. Saito, *Conductor, discriminant, and the Noether formula of arithmetic surfaces*, Duke Math. J. 57
  (1988), 151–173.
- J.-P. Serre, *Facteurs locaux des fonctions zêta des variétés algébriques (définitions et
  conjectures)*, Séminaire Delange–Pisot–Poitou 11 (1969/70), exp. 19.
- J.-P. Serre, *Sur les représentations modulaires de degré 2 de `Gal(ℚ̄/ℚ)`*, Duke Math. J. 54 (1987),
  179–230.
- J.-P. Serre, J. Tate, *Good reduction of abelian varieties*, Ann. of Math. 88 (1968), 492–517.
- J. H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, Graduate Texts in Math. 151,
  Springer, 1994.
- J.-P. Serre, *Topics in Galois Theory*, §3.2, for the Hilbertian permanence and
  closed-point specialization bridge in 6.0.
- J. S. Milne, *Étale Cohomology*, Ch. III, §4, for the Kummer and elliptic cohomology
  comparisons of 5.3c.
- F. Knudsen and D. Mumford, *The projectivity of the moduli space of stable curves. I*,
  1976, §I, Theorem 1, for the determinant-line construction of 5.3d.
- P. Deligne, *Le discriminant d'une courbe*, Appendix 3 to *Lettre à Quillen*,
  for the discriminant section in 5.3d–5.3e.
