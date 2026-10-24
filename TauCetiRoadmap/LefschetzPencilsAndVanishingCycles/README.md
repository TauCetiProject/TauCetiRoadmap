# Roadmap: Lefschetz pencils, nearby cycles and vanishing cycles

**Summary.** This roadmap builds the geometric theory of degenerations in étale cohomology on which Deligne's proofs
of the Weil conjectures, and many arithmetic applications, rest. It constructs nearby and vanishing cycles over a
henselian trait, with their inertia action, the variation, the monodromy operator `N` and the monodromy
filtration; computes them at ordinary quadratic singularities and proves the Picard–Lefschetz formula in both parities,
with the signs fixed and the even-dimensional case in characteristic two given by the even Clifford algebra; constructs Lefschetz pencils and proves that they exist after a
Veronese re-embedding; and proves the global monodromy theorems of a pencil: conjugacy of the vanishing cycles,
generation of monodromy by local transvections, absolute irreducibility of the vanishing quotient, and the
Kazhdan–Margulis theorem that the monodromy is open in the symplectic group. It then proves Gabber's theorems that
nearby cycles commute with duality and preserve perversity, computes nearby cycles, the monodromy filtration and
the weight spectral sequence of semistable curves and strictly semistable degenerations, and builds the geometric
half of Deligne's local and global invariant-cycle theorems, stated in a form whose only remaining hypothesis is the
weight bound that the theory of weights supplies. The end theorems are the Picard–Lefschetz formula (2.8), the
existence of Lefschetz pencils (3.4), the Kazhdan–Margulis theorem (5.8), Gabber's perversity theorems (6.2), the
weight spectral sequence of a strictly semistable degeneration (7a.8) and the invariant-cycle theorems (7b.5, 7b.11).

## Scope and ownership

This roadmap owns:

1. **Nearby and vanishing cycles over a henselian trait** (Layer LPV.0): the topos `X_s ×_s S` and its Galois
   description, the functors `Ψ_η`, `Ψ`, `RΨ`, `RΦ`, the specialization triangle and the variation, functoriality under
   proper, smooth, quasi-finite and trait base change, constructibility over an excellent trait, finite and adic
   coefficients, the nearby–Betti comparison (0.8a),
   and Gabber's absolute cohomological purity for regular pairs (0.10).
2. **Inertia and monodromy** (Layer LPV.1): Grothendieck's monodromy theorem for residue fields with no finite
   extension containing all ℓ-power roots of unity and the geometric local monodromy theorem, the twisted operator
   `N`, the monodromy filtration of a nilpotent endomorphism of an object of an abelian category with its primitive
   decomposition and `𝔰𝔩₂` realization, the relative monodromy filtration, `can` and `var`, tame restriction along a
   normal crossings divisor, the two-component semistable complex and the semisimple trace of Frobenius.
3. **Ordinary quadratic singularities and Picard–Lefschetz** (Layer LPV.2): ordinary quadratic forms over any base,
   quadrics and their cohomology, ordinary quadratic points, their henselian normal forms and local equations, and
   the local and global Picard–Lefschetz theory.
4. **Lefschetz pencils and their monodromy** (Layers LPV.3–LPV.5).
5. **Perverse nearby cycles** (Layer LPV.6), **semistable degenerations** (Layer LPV.7a) and **invariant cycles**
   (Layer LPV.7b).

It uses, and does not redevelop:

- the site, pullback, derived direct image, supports and pro-étale foundations of
  SchemeAndStackFoundations §§2.1–2.2, 2.5, 2.7, 2.9–2.11, 2.15 and 2.17. The additional étale,
  duality and perverse prerequisites are supplied by EtaleCohomologyFoundations §§F.0–F.8
  and §§0.7–0.11, using EnhancedDerivedSheaves §§0.1–0.4;
- the shared fs log schemes, charts, characteristic monoids, morphism predicates and log
  regularity of CrystallineCohomology §§CR.5:log-algebra.1–CR.5:log-algebra.4, and the
  logarithmic differential module of §CR.5.1; 0.10 builds purity-specific equivariant
  modifications, actions and quotients on those objects;
- the logarithm of a unipotent automorphism, Grothendieck's monodromy theorem for local fields, and the monodromy
  filtration of a nilpotent endomorphism of a finite-dimensional vector space with its tensor and dual rules from
  ArithmeticGaloisRepresentations Layer 2 (§§2.4, 2.6); function-field Chebotarev from its Layer 5 (§5.13);
- the inertia group and tame character of a nonarchimedean local field from TauCetiRoadmap LocalFieldsRamification
  Layer 4 (the comparison of 0.1 is with it);
- dual graphs, normalization, Rees-algebra blow-ups and the test case `xy = π^n` from TauCetiRoadmap StableReduction
  Layers 1 and 4; the Picard scheme of a semistable curve and Grothendieck's integral monodromy pairing from
  NeronModelsAndSemistableAbelianVarieties Layers 3–4;
- closed subgroups of `ℓ`-adic Lie groups and their Lie algebras from AdelicAlgebraicGroups Layer 4, §4.2;
  orthogonal groups over `ℚ_ℓ` from TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2; the centre of the even Clifford
  algebra over a field in which two is invertible, in every even positive dimension, from Tau Ceti
  (`CliffordAlgebra.adjoinRootEquivCenterEven`; 2.2 states it for every even rank over any base, characteristic two
  included, as the discriminant cover of a quadric needs); root systems, integral lattices, character values and
  `𝔰𝔩₂`-modules from TauCetiRoadmap RepresentationTheory and Completed IntegralLattices; abelian Chebotarev from
  TauCetiRoadmap Chebotarev Layer 9; mixed Hodge structures and strictness from Completed HodgeStructures (layer L2) and
  Tau Ceti's `TauCeti.Hodge.MixedHodgeStructure`;
- curve/Jacobian comparison, finite-coefficient and rational constructible trace formulas,
  and constant-sheaf point counts from InverseGaloisAndArithmeticFundamentalGroups
  §§IG.0.T1–IG.0.T4, on the domains specified in F.10;
- local-field specialization of the general-trait tame character from
  ArithmeticGaloisRepresentations §2.1a, as used in 0.1;
- cover decomposition and inertia from EtaleCohomologyFoundations §F.0.A1,
  and tame specialization of fundamental groups from
  InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3.

It leaves to other roadmaps:

- **Weights.** Weil numbers, punctual and mixed weights, the purity theorems of Weil I and Weil II, hard Lefschetz
  and the decomposition theorem are weight-theory inputs, kept as explicit hypotheses here. The
  invariant-cycle theorems of Layer LPV.7b are stated with the outputs of that theory as explicit hypotheses
  (disjointness of two Frobenius spectra, or local surjectivity at the singular members of a pencil); the
  unconditional theorems (Weil II 3.6.1, 6.2.9, 6.2.12) are obtained there by supplying them. Likewise, the even
  orthogonal alternative (5.10) assumes the nondegeneracy that hard Lefschetz provides, and the gcd theorem of
  Weil II 4.5.1 assumes the decomposition of Weil II 4.3.9.
- **Limit mixed Hodge structures** (Steenbrink, Schmid, Clemens) are not built; the complex invariant-cycle theorem
  (7b.6) assumes them in the form it needs.
- **Hyodo–Kato monodromy** belongs to CrystallineCohomology Layer CR.6 and its `B_st` comparison to
  CohomologyComparisons; no comparison of it with the ℓ-adic `N` is made here. The **weight–monodromy conjecture**
  is not stated: 7a.8 constructs the weight spectral sequence without identifying its filtration with the monodromy
  filtration in dimension above one.
- **Nearby cycles over higher-dimensional bases** are not constructed. Generic local acyclicity over
  hyperplane parameter spaces is the prerequisite of EtaleCohomologyFoundations §F.3 and the restriction target of 7b.7;
  the nearby-cycle functor of 0.2–0.8 remains a trait construction.

## Conventions

- **Traits.** `S = Spec R` is a henselian trait with closed point `s`, generic point `η`, geometric points `s̄`, `η̄`
  (`k(η̄)` a separable closure), normalization `S̄`, inertia `I ⊂ Gal(η̄/η)` and wild inertia `P`; `p ≥ 0` is the residue
  characteristic and `ℓ ≠ p` a prime. Finite coefficients `Λ` are torsion rings killed by an integer invertible on `S`;
  `ℤ_ℓ`- and `ℚ_ℓ`-coefficients are derived adic realizations (0.8), never ordinary inverse limits of cohomology.
- **Twists and Frobenius.** `ℤ_ℓ(1) = lim μ_{ℓ^n}`. For ℓ-primary coefficients, `Λ(1) = Λ ⊗_{ℤ_ℓ} ℤ_ℓ(1)`;
  for coefficients killed by an invertible integer `r`, `Λ(1) = Λ ⊗_{ℤ/r} μ_r`; `t_ℓ : I → ℤ_ℓ(1)` is the tame character, `t_ℓ(σ) mod ℓ^n = σ(π^{1/ℓ^n})/π^{1/ℓ^n}`.
  Frobenius is geometric: it acts on `ℚ_ℓ(1)` by `q⁻¹`, so on `ℚ_ℓ(−1)` by `q`. The monodromy operator is
  `N : V → V(−1)`, characterized by `ρ(σ) = exp(t_ℓ(σ) N)` on an open subgroup of inertia, and satisfies `NF = qFN`.
- **Triangles and directions.** The specialization triangle is `sp^* i^* K → RΨ_η(K_η) → RΦ(K) →` with no shift on `RΦ`;
  specialization goes from the special to the generic fibre. This triangle retains Galois descent.
  For `σ ∈ I`, variation is `Var(σ) : U(RΦ) → U(RΨ_η)`, where `U` is the geometric restriction
  of 0.2. It satisfies `Var(σ) ∘ U(can) = σ − 1` and `U(can) ∘ Var(σ) = σ − 1` in the
  underlying derived category; the family satisfies Galois conjugation covariance (0.4).
- **Picard–Lefschetz.** `(x, δ) = Tr(x ∪ δ)`, with `δ ∈ H^n(X_η̄)(m)` for `n = 2m` or `2m + 1`; the formula is
  `σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ` for `n` odd, and the reflection `x ↦ x + (−1)^{m+1}(x, δ)δ` with `(δ, δ) = (−1)^m · 2` for `n` even
  when `ε(σ) = −1`. For `n ≡ 0, 1, 2, 3 mod 4` the sign is `−, −, +, +` and `(δ, δ) = 2, 0, −2, 0`, as in the complex case.
- **Filtrations.** The monodromy filtration `M` of a nilpotent `N` centred at `c` has `N M_i ⊂ M_{i−2}` and
  `N^r : gr_{c+r} ≅ gr_{c−r}`; primitive parts use the lower convention `P_i = ker(N : gr_i → gr_{i−2})`, `i ≤ c`. Indices of
  monodromy filtrations are labels; no Frobenius weight is attached to them in this roadmap.
- **Perversity.** On a scheme over a field the middle perversity of EtaleCohomologyFoundations §F.8; on a scheme over a trait the glued
  perversity of 6.2, for which `Λ_X[d + 1]` is perverse on `X` smooth of relative dimension `d`. Fibrewise `RΨ` has no shift;
  for a perverse complex on the total space the convention is `RΨ[−1]` and `RΦ[−1]`. The integral perversities `p` and
  `p⁺` are not identified.
- **Lefschetz pencils.** `X ⊂ P = P^N_k` is smooth, connected, projective of dimension `n + 1`, `k` algebraically closed;
  a pencil has axis `A`, parameter line `D ⊂ P̌`, total space `X̃ = Bl_{A∩X} X`, singular set `S ⊂ D`, `U = D − S`, base point
  `u ∈ U`; `E` is the vanishing subspace (not a coefficient field) and `V = E/(E ∩ E^⊥)` the vanishing quotient.
- **Names.** Lean names are relative to the suggested home `TauCeti.AlgebraicGeometry`, in the namespaces
  `VanishingCycles` (Layers LPV.0, LPV.1, LPV.2 local theory, LPV.6), `Quadric` (quadratic forms, quadrics and quadratic
  points), `LefschetzPencil` (Layers LPV.3–LPV.5), `Semistable` (Layer LPV.7a) and `InvariantCycles` (Layer LPV.7b).
  [Suggested.lean](Suggested.lean) states headline theorems on the pinned libraries' native carriers, in the
  namespace `TauCetiRoadmap.LefschetzPencilsAndVanishingCycles`. The names in the layer targets specify the
  intended library interfaces; the compiled statements are identified explicitly in their sections.
  The shared `PerfectComplex` trace algebra is supplied by
  EtaleCohomologyFoundations §F.10.3.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- Rings: `HenselianLocalRing`, `HenselianRing`, `IsDiscreteValuationRing`, `ValuationSubring.inertiaSubgroup`,
  `ValuationSubring.decompositionSubgroup`; `MvPowerSeries` with its total-degree order `MvPowerSeries.order`
  (`MvPowerSeries.le_order`, `MvPowerSeries.coeff_of_lt_order`): a series has order at least three, as in 2.4, exactly
  when `3 ≤ MvPowerSeries.order R`; `AdicCompletion` (completed local rings and their jets `O/𝔪^{k+1}`);
  `finite_of_finite_type_of_isJacobsonRing` (the residue field of a closed point of a scheme of finite type over a field
  is finite over it).
- Smoothness and the Jacobian criterion: `Algebra.Smooth`, `Algebra.IsSmoothAt`, `Algebra.IsStandardSmooth` (a
  presentation whose Jacobian is invertible), which is smooth, and `Algebra.IsSmoothAt.exists_notMem_isStandardSmooth`
  (smoothness at a prime is standard smoothness after inverting an element outside it). These are the Jacobian
  criterion of 2.1, 3.2 and 3.4.
- Linear algebra: `QuadraticMap`, `QuadraticMap.polarBilin`, `QuadraticMap.Nondegenerate` (radical zero and polar kernel
  of rank at most one, agreeing with 2.1 ordinarity over nonzero finite-dimensional field spaces;
  over rings use 2.1 fibrewise ordinarity), `CliffordAlgebra.even`, `Subalgebra.center` (the centre
  `Z(Q)` of 2.2 is `Subalgebra.center A (CliffordAlgebra.even Q)`, with no separate name), `LinearMap.BilinForm`,
  `LinearMap.BilinForm.orthogonal`, `LinearMap.IsAlt`, `LinearMap.transvection`, `LinearEquiv.transvection`,
  `LinearEquiv.mem_fixedSubmodule_transvection_iff` (fixed space of a transvection with `f v = 0`), `IsNilpotent.exp`,
  `Module.End.HasEigenvalue`, `Module.End.maxGenEigenspace`, `Submodule.mkQ`, `LinearMap.codRestrict`,
  `Representation.invariants`, `Representation.trivial`.
- Lie theory: `skewAdjointLieSubalgebra` (the symplectic Lie algebra `𝔰𝔭(V, ψ)`), `LieModule.IsIrreducible`, `IsSl2Triple`.
- Geometry and homological algebra: `AlgebraicGeometry.Scheme`, the morphism classes `AlgebraicGeometry.IsProper`,
  `AlgebraicGeometry.IsIntegral`, `AlgebraicGeometry.LocallyOfFiniteType`, `AlgebraicGeometry.QuasiCompact`,
  `AlgebraicGeometry.IsOpenImmersion`, `AlgebraicGeometry.SmoothOfRelativeDimension`,
  `AlgebraicGeometry.Scheme.Hom.isClosedMap` (a universally closed, in particular proper, morphism has closed image),
  `IsGenericPoint`, `AlgebraicGeometry.Scheme.smallEtaleTopology`, `CategoryTheory.IsPullback`, `DerivedCategory`,
  `HasDerivedCategory.standard`, `CategoryTheory.shiftFunctor`, `CategoryTheory.Abelian.SpectralObject` and its
  `spectralSequence`, `CategoryTheory.CohomologicalSpectralSequence`, `ModuleCat`.

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

- `TauCeti.genericFiber`, `TauCeti.specialFiber` (`TauCeti/AlgebraicGeometry/Fibers.lean`): the generic and special
  fibres of a scheme over `Spec R` as over-schemes; the trait diagram of EtaleCohomologyFoundations §F.3a is built on them.
- `LinearMap.GeneralLinearGroup.IsUnipotent` (`TauCeti/LinearAlgebra/GeneralLinearGroup/Unipotent.lean`) and
  `TauCeti.exp_smul_eq_sum_smul_dividedPower` (`TauCeti/RingTheory/Nilpotent/Exp.lean`).
- `TauCeti.inertiaTameCharacter` (`TauCeti/NumberTheory/LocalField/Tame/Character.lean`): the tame character
  `I_K → ℤ̂^{(p')}(1)` of a nonarchimedean local field, the Kummer character of a uniformizer; 0.1 compares with it
  (`VanishingCycles.tameCharacter_eq_inertiaTameCharacter`).
- `CliffordAlgebra.center_even_eq_adjoin_volume`, `CliffordAlgebra.adjoinRootEquivCenterEven` and
  `TauCeti.CliffordAlgebra.exists_mem_center_even_forall_ne_algebraMap`
  (`TauCeti/LinearAlgebra/CliffordAlgebra/Even/Center.lean`): over a field with `2 ≠ 0` and in even positive dimension,
  the centre of the even Clifford algebra is `K[X]/(X² − d)`, `d` the signed discriminant, generated by the volume
  element. This is the field case of 2.2 when two is invertible; 2.2 adds characteristic two and a general base.
- `TauCeti.Hodge.MixedHodgeStructure` (`TauCeti/Geometry/Hodge/Mixed/Basic.lean`) with strictness, used in 7b.6.

### From other roadmaps

- **SchemeAndStackFoundations**: Layer 0 (§0.8 smoothness, étale coordinates and quasi-sections; §0.9 limits of
  schemes and spreading out of finitely presented data; §§0.12–0.14 henselization of pairs and henselian pairs, with
  Elkik's smooth lifting; §0.21 regular and excellent rings and schemes); Layer 1 (§1.1 descent of quasi-coherent
  modules); Layer 2 (sites and scheme cohomology); Layer 3 (§3.2
  `scheme_riemann_hurwitz`, which gives `π_1(P¹_k) = 1` over an algebraically closed field; §§3.4 and 3.7, Picard
  groups and Picard functors).
- **TauCetiRoadmap ModularCurves** Layer 4D (strict henselization and completion of strict henselizations, regular
  schemes and completion of noetherian local rings).
- **PurityOfBranchLocus** §§2.1–2.2 (Stacks 0BMB and its global corollary): pointwise
  étaleness for a quasi-finite morphism between locally noetherian schemes with normal source
  stalk, regular target stalk, equal positive local dimensions and unramifiedness at every
  codimension-one generalization; globally, étaleness of a finite dominant morphism from a
  normal integral locally noetherian scheme to a regular integral locally noetherian scheme
  that is generically étale and unramified in codimension one. Generic étaleness here is
  separability of the finite function-field extension. These supply branch purity in 1.8.
- **AbhyankarLemma** §§3.3–3.4 (Stacks 0EYG/0EYH): for a regular effective Cartier divisor
  on a locally noetherian scheme and a finite étale cover of its complement tame in
  codimension one, the étale-local description by prime-to-residue-characteristic roots of
  a divisor equation, and the finite locally free normalization with regular reduced boundary.
  These supply the regular-divisor inputs to 1.8 and 5.1–5.2; the normal-crossings extension,
  compatible Kummer tower and tame fundamental group used in 1.8 are supplied by
  CrystallineCohomology §CR.5:log-algebra.4, *The classical Abhyankar lemma*.
- **TauCetiRoadmap StableReduction** Layer 1 (nodes, local equations `uv = π^n`, normalization, oriented dual
  multigraphs) and Layer 4 (Rees-algebra blow-ups, the test case `xy = π^n`). The oriented dual graph is
  `TauCetiRoadmap.StableReduction.DualGraph`, an edge `e` having tail `endpoint e 0` and head `endpoint e 1`;
  the normalization differential of 7a.1 uses these endpoints.
- **TauCetiRoadmap EllipticCurves** Layer 4 (Tate's algorithm, multiplicative reduction).
- **TauCetiRoadmap LocalFieldsRamification** Layer 4 (inertia, wild inertia and the tame character of a local field).
- **AdelicAlgebraicGroups** Layer 4, §4.2 (closed subgroups of `p`-adic Lie groups, their Lie algebras, openness).
- **TauCetiRoadmap OrthogonalSpinGroups** Layers 0 and 2 (orthogonal groups over a general field and over `ℚ_p`, their
  topology and closedness).
- **TauCetiRoadmap Chebotarev** Layer 9 (abelian Chebotarev).
- **TauCetiRoadmap RepresentationTheory**: CharacterTheory Layer 4, LieHighestWeight Layer 0 (`𝔰𝔩₂`-modules,
  Clebsch–Gordan), RootSystems Layer 5 (the Cartan–Killing classification, whose simply laced types are A, D and E).
- **Completed IntegralLattices** Layer 1 and **Completed HodgeStructures** layer L2 (mixed Hodge structures and
  strictness).
- **CrystallineCohomology** §§CR.5:log-algebra.1–CR.5:log-algebra.4: monoids,
  étale log structures and fs charts, log fibre products, strict/exact/integral/Kummer
  morphisms, log smooth/log étale predicates and Kato's chart criterion, divisorial log
  structures and log regularity. Section CR.5:log-algebra.4, *The classical Abhyankar lemma*,
  supplies the SNC Abhyankar theorem, the compatible Kummer tower with its transition maps,
  the universal tame pro-cover and the full tame fundamental group used in 1.8.
  From §CR.5.1 use only the logarithmic differential
  module and its universal property. These log-algebra sections and that differential
  construction are independent of crystalline cohomology, Cartier and Hyodo–Kato theory.
  Section 0.10 extends this shared carrier with log blow-ups, finite-group actions,
  quotients, equivariant alteration and purity descent.
- **EnhancedDerivedSheaves** §§0.1–0.4 (`ClassicalDerived.enhancedCategory`,
  `ClassicalDerived.replacements`, `ClassicalDerived.tensorHom`, `ClassicalDerived.inverseLimits`,
  `ClassicalDerived.functorCoherence`, `ClassicalDerived.derivedCompletion`) on scheme étale sites.
- **EtaleCohomologyFoundations** §§F.0–F.8 (finite-cover monodromy, constructible
  cohomology, base change, local acyclicity, adic realization, duality, Gysin maps,
  weak Lefschetz and field perversity), §F.3a (henselian traits, inertia and tame
  characters), §F.0.A1 (cover decomposition and inertia), §§0.7–0.11
  (algebraic localization, supports, traces, cycle classes
  and smooth purity), §§G.1–G.3 (compactifications and common refinements),
  and §§F.10.1–F.10.5 (finite-field Frobenius, perfect-complex trace algebra and
  finite-torsor perfectness and coefficient descent).
- **AlgebraicModuliForArithmeticGeometry** Layer 1 (§1.1 projective bundles, §1.3 Grassmannians, §1.4 relative very
  ampleness and the classifying map `ProjectiveBundles.IsRelativelyVeryAmple.completeMap`, from which 3.4 builds
  the Veronese embeddings), Layer 6 (Artin approximation), and §7.6.1
  (`relativePicardSheaf`, `RelativePicard.baseLineBundle`, relative Picard sheaves over arbitrary bases).
- **InverseGaloisAndArithmeticFundamentalGroups** §§IG.0.T1–IG.0.T4 (curve/Jacobian
  comparison, finite-coefficient and rational constructible trace formulas, and constant-sheaf
  point counts); Layer IG.1 (§IG.1.2 tame fundamental groups of curves;
  §IG.1.3 tame specialization).
- **ArithmeticGaloisRepresentations** Layer 2 (§2.1a local-field specialization of the general-trait
  tame character, §2.3 tame characters of local fields, §2.4 unipotent logarithm and
  Grothendieck's monodromy theorem for local fields, §2.6 monodromy filtration of a nilpotent on a vector space) and
  Layer 5 (§5.13 Chebotarev for function fields of curves over finite fields).
- **DerivedModuleAlgebra** §1.T.1 (towers, inverse limits, `lim¹` and Milnor sequences).
- **ArithmeticGaloisDuality** Layers R02.1 (continuous cochains and lattices) and R02.2 (Hochschild–Serre).
- **NeronModelsAndSemistableAbelianVarieties** Layer 3 (§§3.8–3.9 Picard schemes of
  semistable curves) and Layer 4 (§§4.1–4.4 normalization sequence, characters as graph cycles, the integral monodromy
  pairing and its graph formula).
- **AbelianSchemesAndArithmeticModuli** §A4.1 (Tate modules and their duality pairing).
- **ComplexComparisonPartII** Layers C1–C5 for Betti constructions and §C5.2
  (`relativeBettiLocalSystem`) for the smooth punctured analytic family; §C−1.1
  (`complexSchemeAnalytification`) for analytification; §§C6.0–C6.6 for finite-cover,
  finite-ctf ordinary/compact/relative and normalized adic comparison, as specified in 0.8a.
- **SchemeAndStackFoundations** §0.29 (`absoluteFrobenius`,
  `schemeFrobeniusTwist`, `relativeFrobenius`, `iteratedSchemeFrobenius`, `qPowerFrobenius`)
  for characteristic-p scheme maps; EtaleCohomologyFoundations §§F.10.1–F.10.2b
  supplies Galois/cohomology conversion.
- **TauCetiRoadmap AlgebraicTopology** Stage 5 item 2 (mapping-torus Wang sequence) and Stage 6
  item 4 (Poincaré–Lefschetz duality), adapted to cohomology and singular-fibre supports in 7b.6.

## How to read the build

| Layer | Content | End results |
| --- | --- | --- |
| LPV.0 | Nearby and vanishing cycles over a henselian trait | `RΨ`, `RΦ`, variation, constructibility, absolute purity |
| LPV.1 | Inertia and monodromy | local monodromy theorem, `N`, monodromy filtration, semisimple trace |
| LPV.2 | Ordinary quadratic singularities | cohomology of quadrics, Picard–Lefschetz formula |
| LPV.3 | Lefschetz pencils | existence after a Veronese embedding, arithmetic specialization of global monodromy |
| LPV.4 | Global vanishing cycles | vanishing subspace, radical quotient and its pairing |
| LPV.5 | Global monodromy | conjugacy, generation, irreducibility, middle-degree reduction, Kazhdan–Margulis |
| LPV.6 | Perverse nearby cycles | Gabber's duality and perversity theorems |
| LPV.7a | Semistable degenerations | monodromy of nodal curves, weight spectral sequence |
| LPV.7b | Invariant cycles | local and global invariant-cycle theorems |

EtaleCohomologyFoundations §§F.0–F.8 supplies the finite-coefficient and adic theory.
Layer LPV.0 builds the functors; Layer LPV.1 extracts the linear algebra of inertia; Layer LPV.2 is the local theory at
an ordinary quadratic point, and uses the semistable calculation of 1.9 for the odd-dimensional sign. Layers LPV.3–LPV.5
are the global theory of a pencil: LPV.3 supplies geometry and arithmetic specialization,
LPV.4 linear algebra of the vanishing cycles on one fibre, LPV.5
the monodromy theorems, which need the conjugacy and generation results before the middle-degree reduction can be
stated. Layer LPV.6 depends only on LPV.0–LPV.2. Layer LPV.7a uses LPV.0–LPV.2 and LPV.6; Layer LPV.7b uses LPV.0,
LPV.3, LPV.5 and LPV.7a. Each target names its sources by section, statement and page, and its inputs, in a final
*Needs:* clause; numbers such as 2.8 refer to the subsections of this roadmap.

## F.10 Trace-formula imports and compatibility

InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T1–IG.0.T4 constructs the four
geometric trace interfaces below. Applications here use their supplied coefficient,
Frobenius, Jacobian and functorial identifications on the stated domains.

| Imported interface | Construction owner | Hypotheses and compatibility used here |
| --- | --- | --- |
| `VanishingCycles.curveEndomorphismTrace` | InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 | Smooth proper geometrically connected `C/k`, `ℓ` invertible in `k` and `φ:C→C`. The graph–diagonal intersection is `1 − Tr_alg(φ_* on J_C) + deg φ`, including constant maps of degree zero and the identity's diagonal self-intersection. The finite-level comparison `H¹(C_k̄,ℤ/ℓⁿ) ≅ Hom(J_C[ℓⁿ](k̄),ℤ/ℓⁿ)` uses a chosen separable closure, the supplied Tate coordinate, pullback/pushforward orientation and compatible reductions; rational realization uses EtaleCohomologyFoundations §F.4. Over finite `k`, `q`-power scheme Frobenius and its deck-twisted forms have transverse fixed points. |
| `VanishingCycles.etaleTraceFormulaFinite` | InverseGaloisAndArithmeticFundamentalGroups §IG.0.T2 | Separated finite-type `X/k`, `k` finite of characteristic `p` and cardinality `q`, finite commutative `Λ` of order prime to `p`, `K∈Dᵇ_ctf(X,Λ)` descended over `k`, and every `r≥1`. The sum of local perfect-complex traces over `X(k_r)` equals the global trace on `RΓc(X_k̄,K)`. A local term at a `k_r`-point uses geometric `qʳ`-Frobenius without an additional `r`-th power. Use the supplied pushforward, coefficient-change, tensor/twist, Künneth, finite-group and finite-field-extension compatibilities. |
| `VanishingCycles.etaleTraceFormula` | InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 | Separated finite-type `X/k`, `k` finite of cardinality `q`, `ℓ≠char k`, `K` in EtaleCohomologyFoundations §F.4's rational bounded constructible category with descent data, and every `r≥1`. The alternating trace on `Hⁱc(X_k̄,K)` equals the sum over `X(k_r)` of alternating geometric `qʳ`-Frobenius stalk traces. Finite coefficient-field extensions `E/ℚ_ℓ`, normalized finite-level realization and coefficient, tensor/twist, group, base-extension and lower-shriek compatibilities are included. |
| `VanishingCycles.pointCountTrace` | InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4 | Separated finite-type `X/k`, `k` finite of cardinality `q`, `ℓ≠char k` and every `r≥1`. The natural-number count `#X(k_r)`, embedded in `ℚ_ℓ`, equals `Σ_i (−1)ⁱ Tr(Frob_qʳ on Hⁱc(X_k̄,ℚ_ℓ))`; each constant stalk contributes one. Finite and integral forms map the count to the coefficient ring. The projective-space computations use the supplied hyperplane class and Tate orientation. |

EtaleCohomologyFoundations §§F.10.1–F.10.5 supplies the separate Frobenius and
algebraic trace package: fixed points, finite and adic cohomological Frobenius,
`PerfectComplex` traces and coherent additivity, free-torsor equivariant compact-support
perfectness and derived coefficient descent. Its §§F.10.4–F.10.5 apply to finite étale
Galois torsors with finite lisse projective-stalk coefficients on smooth affine curves,
including deck groups whose order is divisible by ℓ. Finite-coefficient traces use
§§F.0–F.3, G.1–G.3 and 0.7–0.8; rational traces additionally use §F.4.

The local uses are the point-count compatibility for quadrics (2.3), the all-power
rational trace in the finite-monodromy character argument (5.10), and the
curve/Jacobian compatibility for semistable specialization and polarization (7a.4).
Their Frobenius and Tate coordinates follow the Conventions above and the supplied
interfaces; the nearby-cycle, monodromy and normalization diagrams are constructed in
those local targets.

## Layer LPV.0: Nearby and vanishing cycles over a henselian trait

This layer constructs the nearby-cycle functor of a scheme over a henselian trait on the actual
étale sites, its derived functor `RΨ`, the vanishing cycles `RΦ`, the specialization triangle and
the variation, and proves the standard functorialities: proper and smooth base change, finite
coefficient change, change of trait, constructibility, and passage to `ℤ_ℓ`- and `ℚ_ℓ`-coefficients.
It also proves absolute cohomological purity for regular pairs and the nearby–Betti comparison.
The henselian trait, inertia and tame character are supplied by EtaleCohomologyFoundations §F.3a.
The construction uses its §§F.0–F.6 for sheaves, derived categories and base change, together with
EnhancedDerivedSheaves §§0.1–0.4 for the enhanced derived functors.

### 0.1 Local-field specialization of the tame character

For a henselian trait whose valuation ring is that of a nonarchimedean local field,
use `VanishingCycles.tameCharacter_eq_inertiaTameCharacter`, supplied by EtaleCohomologyFoundations §F.3a and transported by
ArithmeticGaloisRepresentations §2.1a: under the valuation-inertia and residue-Tate
identifications, the general-trait `t_ℓ` is the ℓ-component of Tau Ceti's
prime-to-residue-characteristic tame character `TauCeti.inertiaTameCharacter`.
The supplied comparison uses the positive Kummer ratio for a uniformizer on both
sides and is compatible with conjugation and finite extension.
(Stacks Project, Section 15.114, Remark 0BU8.)
*Needs:* ArithmeticGaloisRepresentations §2.1a; EtaleCohomologyFoundations §F.3a
(general-trait tame character and its Kummer formula); LocalFieldsRamification
Layer 4; Tau Ceti `TauCeti.inertiaTameCharacter`.

**Checks.**

- For a local-field uniformizer, reduction modulo `ℓ^n` is the same Kummer quotient
  in the two constructions, independently of the chosen root.

### 0.2 The topos `Y ×_s S` and its galoisian description

**The gluing topos.** For a henselian trait `S` and a scheme `Y` over `s`, construct the
2-fibre product of étale topoi `T = Y_et ×_{s_et} S_et`. On the geometric closed fibre `Ȳ` an object
of `T` is a triple `(F_s, F_η, φ)`: a sheaf `F_s` with continuous `Gal(s̄/s)`-action, a sheaf `F_η`
with continuous `Gal(η̄/η)`-action, and a `Gal(η̄/η)`-equivariant map `φ : F_s → F_η`, where the action
on `F_s` is inflated along specialization. The generic part `Y_et ×_{s_et} η_et` is an open subtopos
with closed complement `Y_et`; projection to `Y` is `F ↦ (F, F, id)` and generic restriction selects
`F_η`. For `Y = s` this gluing category is equivalent to `S_et`, and the gluing map lands in the
inertia invariants `F_η^I`. Henselian specialization identifies the finite étale covers of `S` and
of `s`, and gives `sp_*F = i^*F`, `sp_*j_*G = i^*j_*G`. The construction is independent of the
separable closure up to canonical equivalence, has conservative families of points `(x, s̄)` and
`(x, η̄)`, and is functorial for quasi-compact maps in `Y` and surjective maps of traits; for a finite
trait extension the direct image is induction of the generic Galois action. Extension by zero along
locally closed immersions and proper-support pushforward along separated maps of finite type have
their usual descriptions on triples, and for abelian sheaves the right adjoint `f^!` of `f_!` exists
for quasi-finite `f` and is `f^*` for `f` étale. A reader may take the triple description as the
definition. When `k(s)` is not separably closed the 2-product is fibred over `Spec(k(s))_et`.

Define `VanishingCycles.OrientedFibreTopos` as the category of triples, with:

- `VanishingCycles.OrientedFibreTopos`: For `Y` over `s`, the category of triples `(F_s, F_η, φ)`: `F_s` a sheaf on `Y` (a `Gal(s̄/s)`-sheaf on `Ȳ`), `F_η` a continuous `Gal(η̄/η)`-sheaf on `Ȳ`, `φ : F_s → F_η` equivariant (XIII 1.2.4).
- `VanishingCycles.OrientedFibreTopos.sp_pullback`: `sp^* : sheaves on Y → sheaves on Y ×_s S`, `F ↦ (F, F, id)`.
- `VanishingCycles.OrientedFibreTopos.etaPart`: The restriction to `Y ×_s η`, `(F_s, F_η, φ) ↦ F_η`, retaining its continuous Galois descent.
- `VanishingCycles.OrientedFibreTopos.geometricGenericRestriction`: The exact restriction from sheaves on `Y_et ×_{s_et} η_et` to sheaves on `Ȳ_et`. For a ring sheaf `A` on `Y`, it induces `U : D⁺(Y_et ×_{s_et} η_et, A) → D⁺(Ȳ_et, A_Ȳ)`, where `A_Ȳ` is the pullback of `A`; on triples this forgets the descent of the generic part.
- `VanishingCycles.OrientedFibreTopos.equivSheavesOnTrait`: For `Y = s`, sheaves on `S` `≌` triples `(F_s̄, F_η̄, φ : F_s̄ → F_η̄^I)` (XIII 1.2.2).

Write `G = Gal(η̄/η)`. For a generic-part object `M`, write
`c_M(g) : g^*U(M) ≅ U(M)` for its descent isomorphism, with the usual cocycle compatibility;
`g^*` denotes pullback along the inverse of the residue action of `g` on `Ȳ`. When `Y = s`,
this is the representation action `ρ_M(g)`. Inertia acts trivially on `Ȳ`, so each `σ ∈ I`
gives an endomorphism of `U(M)`, whereas general `g` requires the pullback `g^*`.

*Proof sketch.* The henselian equivalence of finite étale covers of `S` and `s` gives specialization
and its Galois quotient. Open–closed recollement on the trait shows the closed sheaf maps into
inertia invariants, and base change along `Y_et → s_et` gives the general gluing. Changes of
separable closure are handled by conjugate Galois descent. (SGA 7 II, Exposé XIII, Construction
1.2.4, p. 10, and 1.2.2(b), p. 9; Illusie 1994, §4.1, pp. 44–45.) The geometric restriction
is an exact inverse image of topoi; it preserves cohomology, shifts and distinguished triangles.
*Needs:* EtaleCohomologyFoundations §F.3a; EtaleCohomologyFoundations §F.0.

**Checks.**

- `VanishingCycles.equivSheavesOnTrait_constant`: The constant sheaf `Λ` on `S` is the triple `(Λ, Λ, id)` with `I` acting trivially.
- `VanishingCycles.equivSheavesOnTrait_jPushforward`: `j_*G` for a `Gal(η̄/η)`-module `G` is the triple `(G^I, G, inclusion)`.
- `VanishingCycles.equivSheavesOnTrait_degenerate`: For `Y = ∅` the category is the terminal one.
- `VanishingCycles.not_triple_of_noninvariant`: For `Y = s`, take `F_s̄=ℚ_ℓ` with trivial inertia, `F_η̄=ℚ_ℓ` with a nontrivial quadratic inertia character, and `φ(1)=1`. This map is not equivariant and cannot be a specialization map of a sheaf on `S`.
- A sheaf on `Y ×_s S` restricted to the closed `Y` is `F_s` and to the open `Y ×_s η` is `F_η`; `sp^*(F_s) = (F_s, F_s, id)`.
- Points `(x, s̄)` and `(x, η̄)` form conservative families (1.2.5).
- For `Y = s`, `U` sends a continuous Galois `A`-module to its underlying `A`-module; an equivariant morphism becomes an `A`-linear map.
- Applying `U` to a short exact sequence gives an exact sequence of sheaves on `Ȳ`; its derived functor sends the associated triangle to the underlying triangle.
- For the constant generic sheaf `A`, `U(A)` is `A_Ȳ`, with descent recovered by the maps `c_A(g)`.

**The oriented product.** The oriented product `X_s ←×_S η` has as points triples of a geometric
point `x` of `X_s`, a geometric generic point and a specialization path; its derived nearby stalk at
`x` is `RΓ(X_(x) ×_{S_(f(x))} η̄, K)`. For a trait the oriented product is identified with the generic
part of `X_s ×_s S`, carrying the same specialization and inertia action. The whole gluing topos has
a special and a generic part and is not identified with its generic part alone. For a base of higher
dimension no base-change or constructibility statement is made here. *Proof sketch.* Use the site of
triples `U → V ← W` with its covering families, describe its points by specialization paths,
identify the strict-local tube, and compare the universal gluing maps on a trait with XIII 1.2–1.3.
(Illusie 2006, §§2.1–2.3, pp. 3–5, especially 2.2.3 and 2.3.4.) *Needs:* this subsection; EtaleCohomologyFoundations §F.3a;
EtaleCohomologyFoundations §F.1 (derived sheaves on the oriented site); TauCetiRoadmap ModularCurves
Layer 4D (strict henselization).

**Checks.**

- The specialization arrow runs from the special stalk to the generic nearby stalk.
- For the identity of the trait with constant coefficients the specialization map is the identity and the vanishing cycles are zero.
- For `X = S` and a nontrivial quadratic inertia line on `η`, the oriented nearby object retains the full line, although its inertia invariants are zero.

### 0.3 The functors `Ψ_η` and `Ψ`

Fix `X → S` over a henselian trait, its geometric normalization `S̄` and the inclusions
`j̄ : X_η̄ → X_{S̄}`, `ī : X_s̄ → X_{S̄}`. For a sheaf `G` on `X_η` define
`VanishingCycles.psiEta G = ī^* j̄_* G_η̄`, a sheaf on `X_s̄` with continuous `Gal(η̄/η)`-action compatible
with the action on `X_s̄`. For a sheaf `F` on `X` define `VanishingCycles.psi F` as the triple
`(F_s, Ψ_η(F_η), sp_F)` in `X_s ×_s S`, where `sp_F` comes from the unit `F → j_*j^*F`. Both functors are
left exact; `Ψ` is not the direct image of a morphism of topoi. For an `S`-morphism `f` construct the
base-change maps `Ψ f_* → f_* Ψ` and `f^* Ψ → Ψ f^*`; the first is an isomorphism when `f` is proper,
and for `X' = S` it identifies sections over the geometric generic fibre with sections of the nearby
sheaf. For quasi-finite `f` construct `f_! Ψ → Ψ f_!` and `Ψ f^! → f^! Ψ`, inverse to the direct-image
map for `f` finite and to the inverse-image map for `f` étale. A map of henselian traits has its
inverse-image comparison. All of this is on the actual sites, for sheaves of sets (pointed sets for
`f_!`).

- `VanishingCycles.psiEta`: `Ψ_η(F) = ī^* j̄_* F_η̄`, a continuous `Gal(η̄/η)`-sheaf on `X_s̄` (XIII 1.3.2.2).
- `VanishingCycles.psi`: `Ψ(F) = (F_s, Ψ_η(F_η), φ)` on `X_s ×_s S`, `φ` from `F → j_*j^*F` (XIII 1.3.3).
- `VanishingCycles.psi_leftExact`: `Ψ` and `Ψ_η` are left exact.
- `VanishingCycles.psi_pushforward`: The base-change map `Ψ f_* → f_* Ψ`, an isomorphism for `f` proper (XIII 1.3.6).

*Proof sketch.* `Ψ_η` is pullback to `η̄`, direct image to `X̄` and restriction to `X_s̄`, with the Galois
action by transport of structure; the triple is assembled from the adjunction unit, and the
functorialities come from the base-change maps of EtaleCohomologyFoundations §§F.2–F.3, proper base change being the theorem of EtaleCohomologyFoundations §F.2. (SGA 7 II, Exposé XIII, 1.3.1–1.3.3, p. 13, and
1.3.6, p. 15.) *Needs:* EtaleCohomologyFoundations §F.3a, 0.2; EtaleCohomologyFoundations §§F.1–F.2;
EtaleCohomologyFoundations §§F.2–F.3.

**Checks.**

- `VanishingCycles.psiEta_trait`: For `X = S`, `Ψ_η(F)` is `F_η̄` with its `Gal(η̄/η)`-action.
- `VanishingCycles.psiEta_ne_invariants`: For `X = S`, `Ψ_η(F) = F_η̄` differs from `i^*j_*F = F_η̄^I` whenever `I` acts nontrivially: using `j_*` in place of `j̄_*` loses the inertia action.
- `VanishingCycles.psiEta_smooth_constant`: For `X` smooth over `S` and `Λ` constant, `Ψ_η(Λ) = Λ`, since the strict henselisations of `X̄` at points of `X_s̄` are normal domains.
- `VanishingCycles.psi_proper_pushforward_id`: For `f = id` the base-change map is the identity.
- For `X = S`, `Ψ_η(F)` is the `Gal(η̄/η)`-set `F_η̄` viewed over `s̄` and `Ψ(F)_s = F_s` with `φ: F_s -> F_η̄^I`.

### 0.4 Vanishing cycles of a triple and the variation

Let `K` be a bounded-below complex of `A`-modules in the gluing topos `Y_et ×_{s_et} S_et`, with closed part `K_s`,
generic part `K_η` and specialization `φ : K_s → K_η`, where `A` is a ring or a sheaf of rings on `Y`.
Replace `K` by a homotopy-equivalent
representative whose specialization `φ'` is injective and split in each degree (a mapping-cylinder
replacement), and define `Φ(K)` as its cokernel. This gives the distinguished triangle
`sp^*K_s → K_η → Φ(K) →` in the Galois-equivariant generic-part derived category, independent of
the representative, and its cohomology sequence. Inertia acts trivially on the image of the closed
part, so for `σ ∈ I` the map `σ − 1` on `U(K'_η)` factors through the underlying quotient
`U(q) : U(K'_η) → U(Φ(K))`. The resulting **variation**
`VanishingCycles.variation σ : U(Φ(K)) → U(K_η)` satisfies, in `D⁺(Ȳ_et, A_Ȳ)`,

```text
Var(σ) ∘ U(q) = σ − 1  on U(K_η),      U(q) ∘ Var(σ) = σ − 1  on U(Φ(K)),
Var(στ) = Var(σ) ∘ U(q) ∘ Var(τ) + Var(σ) + Var(τ).
```

The underlying derived morphism is independent of the representative and natural in `K`. Its
family has conjugation covariance: with the descent notation of 0.2, for every `g ∈ G`,

```text
c_{K_η}(g) ∘ g^*Var_K(σ) ∘ c_{Φ(K)}(g)⁻¹ = Var_K(gσg⁻¹).
```

For `Y = s` this reads `ρ_K(g) Var_K(σ) ρ_Φ(g)⁻¹ = Var_K(gσg⁻¹)`. A fixed member need not be a
Galois-equivariant morphism. In the representation case it is a `LinearMap`; a
`Representation.IntertwiningMap` additionally requires commutation with every group element.
The uniqueness of a degree-zero factor through the underlying cokernel is separate from
independence of the derived representative.

- `VanishingCycles.variation`: `Var_K(σ) : U(Φ(K)) → U(K_η)` for `σ ∈ I` and `K` a bounded-below complex on `Y ×_s S`, in the underlying geometric derived category (XIII 1.4.3).
- `VanishingCycles.variation_left`: `σ = 1 + Var(σ) ∘ U(q)` on `U(K_η)`.
- `VanishingCycles.variation_right`: `σ = 1 + U(q) ∘ Var(σ)` on `U(Φ(K))`.
- `VanishingCycles.variation_mul`: `Var(στ) = Var(σ) U(q) Var(τ) + Var(σ) + Var(τ)`, in the underlying derived category.
- `VanishingCycles.variation_natural`: For a morphism `f : K → L` of gluing complexes, `U(f_η) ∘ Var_K(σ) = Var_L(σ) ∘ U(Φ(f))`.
- `VanishingCycles.variation_conjugation`: The family satisfies the descent/pullback conjugation formula above for every `g ∈ G` and `σ ∈ I`.
- `VanishingCycles.variation_wellDefined`: The underlying derived morphism `Var_K(σ)` depends only on `K`, not on the representative `K'`.
- `VanishingCycles.variation_unique`: The degree-zero underlying cokernel factor of `σ − 1` is uniquely characterized by its composite with `U(q)`; independence of the derived representative is `variation_wellDefined`.

*Proof sketch.* The cone replacement gives an injective, degreewise split specialization whose
quotient realizes the cone. Trivial inertia on the closed image makes `σ − 1` vanish there; factor it
and compute the two composites and the product rule after geometric restriction. Equivariant
maps of triples give naturality; transporting the cokernel factor by `c(g)` gives the factor for
`gσg⁻¹`, proving covariance before passage to the derived category. Homotopy-compatible
replacements and localization give independence of the representative. (SGA 7 II, Exposé XIII, 1.4.3 and formulas
(1.4.3.2)–(1.4.3.4), p. 17.) *Needs:* EtaleCohomologyFoundations §F.3a, 0.2; EtaleCohomologyFoundations §F.1 (homotopy-coherent
cones).

**Checks.**

- `VanishingCycles.variation_one`: `Var(1) = 0`.
- `VanishingCycles.variation_of_phi_zero`: If `Φ(K) = 0` then `Var(σ) = 0` and `I` acts trivially on `U(K_η)`, by `σ = 1 + Var(σ) U(q)`.
- `VanishingCycles.variation_picardLefschetz`: At an ordinary quadratic point in odd relative dimension `n = 2m + 1`, `Var(σ)(a) = (−1)^{m+1} t_ℓ(σ)(a, δ)δ`, which over rational coefficients is nonzero when `t_ℓ(σ) ≠ 0`, `(a, δ) ≠ 0` and `δ ≠ 0` (XV 3.3).
- `VanishingCycles.variation_ne_sub_one`: `Var(σ)` has source `U(Φ(K))` and target `U(K_η)`; `σ − 1` on `U(K_η)` is its composite with `U(q)`, which vanishes on the closed image. For `K_s = 0`, `q` is the identity and `Var(σ)` does equal `σ − 1`.
- Let `S = Spec 𝔽₂[[t]]`, `Y = s`, `A = 𝔽₅`.
  The splitting field `𝔽₄((u))`, `u³ = t`, has group `C₃ ⋊ C₂ ≅ S₃`. On the permutation module
  `V = 𝔽₅³`, take inertia `T = [[0,0,1],[1,0,0],[0,1,0]]` and Frobenius
  `F = [[1,0,0],[0,0,1],[0,1,0]]`. For `K = (0,V,0)`, `q = id` and `Var(σ) = T − 1`, but
  `F(T − 1)e₁ = e₃ − e₁ ≠ e₂ − e₁ = (T − 1)Fe₁`. Thus this underlying variation does not lift
  to an intertwining map.
- In the same example, `T³ = F² = 1`,
  `FTF⁻¹ = T²`, and `F Var(σ) F⁻¹ = T² − 1 = Var(σ²)`. The family satisfies covariance even
  though its fixed member is not equivariant.
- The variation determines the inertia action on `K_η` through 1.4.3.2; the cocycle rule 1.4.3.4 is the algebraic analogue of the classical variation.

### 0.5 `RΨ`, `RΦ`, the vanishing triangle and Milnor fibres

Let `X` be a scheme over a henselian trait `S` and `A` a torsion ring whose torsion is prime to the
residue characteristic (or a sheaf of such rings). Derive `Ψ` and `Ψ_η` on bounded-below complexes:
`VanishingCycles.RPsi : D⁺(X, A) → D⁺(X_s ×_s S, A)` has closed part `i^*K` and generic part
`RΨ_η(K_η)`, which on the geometric closed fibre is `ī^* Rj̄_* K_η̄`. Define
`VanishingCycles.RPhi K = Φ(RΨ K)`. The specialization triangle is

```text
sp^* i^* K  →  RΨ_η(K_η)  →  RΦ(K)  →
```

in the Galois-equivariant generic-part category, with no shift on `RΦ`. Its map `can` is equivariant;
the elementwise variation of 0.4 is `Var(σ) : U(RΦ(K)) → U(RΨ_η(K_η))`, satisfying its two
composition identities with `U(can)` and its conjugation covariance. At a geometric point
`x̄` of `X_s` the stalk of `R^iΨ(K)` is `H^i(X_(x̄) ×_{S^nr} η̄, K)`, the cohomology of the geometric
Milnor fibre, with `X_(x̄)` and `S^nr` the strict henselizations. `(X, K)` is locally acyclic over `S`
exactly when `RΦ(K) = 0`; in particular `RΦ` vanishes on a smooth locus where the cohomology sheaves of
`K` are locally constant. This last statement compares the nearby-cycle formulation with the
local-acyclicity predicate of EtaleCohomologyFoundations §§F.2–F.3, which defines
local acyclicity without nearby cycles.

- `VanishingCycles.RPsi`: `RΨ : D⁺(X, A) → D⁺(X_s ×_s S, A)`, the right derived functor of `Ψ`, with `RΨ(K)_s = i^*K` and `RΨ(K)_η = RΨ_η(K_η)` (XIII 2.1.2).
- `VanishingCycles.RPhi`: `RΦ(K) = Φ(RΨ(K))`, in `D⁺(X_s ×_s η, A)`.
- `VanishingCycles.vanishingTriangle`: The distinguished triangle `sp^* i^*K → RΨ_η(K_η) → RΦ(K) →` (XIII 2.1.2.4).
- `VanishingCycles.RPsi_stalk`: `R^iΨ(K)_(x̄, η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K)`, the cohomology of the geometric Milnor fibre (XIII 2.1.4).
- `VanishingCycles.RPhi_eq_zero_iff_locallyAcyclic`: `(X, K)` is locally acyclic over `S` if and only if `RΦ(K) = 0` (Illusie 2006, §1.1, pp. 1–2); the smooth locally constant special case is SGA 7 XIII, 2.1.5, p. 19.

*Proof sketch.* Derive on injective resolutions: open restriction preserves injectives and geometric
pullback has the needed acyclicity, so the closed and generic parts are as stated. Apply the cone
and variation construction of 0.4. Compute a geometric stalk by strict localization and the stalk
theorem for direct images. Smooth local acyclicity of locally constant coefficients is
EtaleCohomologyFoundations §§F.2–F.3. (SGA 7 II, Exposé XIII, 2.1.1, p. 17; Proposition 2.1.4 and Reformulation
2.1.5, p. 19.) *Needs:* 0.2, 0.3, 0.4; EtaleCohomologyFoundations §§F.1–F.2;
EtaleCohomologyFoundations §F.1; EtaleCohomologyFoundations §§F.2–F.3.

**Checks.**

- `VanishingCycles.RPhi_smooth`: For `X → S` smooth and `K = Λ`: `RΦ(Λ) = 0` and `RΨ_η(Λ) = Λ`.
- `VanishingCycles.RPsi_trait`: For `X = S`: `RΨ_η(K) = K_η̄` with its `Gal(η̄/η)`-action.
- `VanishingCycles.RPhi_node`: For `X = Spec R[x, y]/(xy − π)`, `π` a uniformiser and `S` strictly henselian: `R^iΦ(Λ) = 0` for `i ≠ 1`, and `R^1Φ(Λ)` is supported at the origin, free of rank 1 (XV 3.1.2 with `n = 1`).
- `VanishingCycles.specialization_direction`: For `f` proper the triangle gives `H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K)`: specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle.
- For a smooth family with locally constant coefficients `RΦ = 0` and `sp^*i^*K ≅ RΨ_η(K_η)`.
- For a disjoint union, `RΨ` is computed componentwise (functoriality in `X`); for a nodal curve over a trait the stalk formula at the node gives the cohomology of the Milnor fibre (an annulus), as in SGA 7 XV §2.

### 0.6 Functoriality and the specialization sequence

**Theorem (functoriality of `RΨ`).** For a separated morphism of finite type `g` over a henselian
trait, construct the natural exchange maps of `RΨ` with `g^*`, `Rg_*` and `Rg_!`. The `Rg_*` exchange is an
isomorphism for `g` proper and the `g^*` exchange for `g` smooth. For `g` quasi-finite construct the
`Rg^!` exchange, an isomorphism for `g` étale; exchange with `Rg^!` for general separated maps of finite
type is not part of this theorem. A dominant map of henselian traits with compatible geometric points
gives an isomorphism after restricting the inertia action. For `f : X → S` proper, the specialization
triangle gives the inertia-equivariant long exact sequence

```text
H^i(X_s̄, K) → H^i(X_η̄, K) → H^i(X_s̄, RΦK) → H^{i+1}(X_s̄, K)
```

whose first arrow is specialization (from the special to the generic fibre). The compactly supported
comparison runs from nearby cohomology of the special fibre to compactly supported cohomology of the
generic fibre and is an isomorphism when `f` is proper. Hypotheses: noetherian schemes of finite
type; torsion coefficients invertible on the trait; bounded-below complexes.

*Proof sketch.* Construct the exchange maps from adjunction units and the geometric fibre square;
apply smooth or proper base change (EtaleCohomologyFoundations §§F.2–F.3), keeping
the comparison map in the other cases. XIII 2.1.7.5 constructs dominant trait exchange;
its isomorphy on this finite-type domain is SGA 4½ [Th. finitude], recalled by
Illusie 2006 §1.1(b), p. 2. Apply `RΓ` and proper
base change to the triangle; naturality gives inertia equivariance. (SGA 7 II, Exposé XIII,
2.1.7.1–2.1.7.5, pp. 20–21; 1.3.9, p. 16; 2.1.8.9, p. 22.) *Needs:* 0.3, 0.5;
EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.5 (exceptional inverse image);
EtaleCohomologyFoundations §§F.2–F.3 and EtaleCohomologyFoundations §F.2.

**Checks.**

- The connecting map raises the degree by one: `RΦ` enters the triangle with no shift.
- All maps are equivariant for inertia and for `Gal(η̄/η)`, because they come from the topos
  `X_s ×_s S`.
- For `X = S` and `K = Λ` the sequence is `0 → Λ → Λ → 0`: specialization is the identity.

### 0.7 Constructibility, coefficient change and change of trait

**Theorem (constructibility of nearby cycles).** Let `X` be of finite type over an excellent
henselian trait and `K` a bounded constructible complex with finite torsion coefficients invertible on
`S`. Then `RΨK` and `RΦK` have bounded constructible cohomology, and finite Tor-amplitude of `K` passes
to `RΨK` and `RΦK`. Constructibility here is the actual stratification condition of EtaleCohomologyFoundations §§F.1–F.2, not a
statement about finite stalks. The oriented nearby-cycle functor over a base of higher dimension is
not asserted constructible.

*Proof sketch.* This is Deligne's finiteness theorem for nearby cycles (SGA 4½, [Th. finitude]),
recalled with exactly these hypotheses in Illusie 2006, §1.1(b), p. 2, and Illusie 2021, §6.2,
pp. 103–104; it rests on the finiteness of `Rf_*` for proper maps (EtaleCohomologyFoundations §§F.2–F.3) and the excellence of the trait. Finite cohomological and Tor amplitude come
from the strict-local stalk formula of 0.5 and XIII 2.1.13, pp. 25–26. The triangle passes bounded
constructibility from `RΨ` to `RΦ`. *Needs:* 0.5; EtaleCohomologyFoundations §§F.1–F.2 (constructible complexes of
finite Tor dimension); SchemeAndStackFoundations Layers 0 (§0.21, excellent
schemes) and 2; TauCetiRoadmap ModularCurves Layer 4D (strict henselization); EtaleCohomologyFoundations §§F.2–F.3.

**Checks.**

- For an ordinary node only the single middle vanishing sheaf survives (0.5, `RPhi_node`).
- For `X → S` smooth and `K` constant, `RΨK = K_s` and `RΦK = 0`, which are constructible.

- For the disjoint union of a smooth family and a nodal family, nearby cohomology is the componentwise constructible sum.

**Theorem (coefficient change and change of trait).** Nearby and vanishing cycles commute with derived
extension of finite coefficient rings `Λ → Λ'` for constructible complexes of finite Tor dimension with
`ℓ` invertible, and with dominant change of henselian traits with transported geometric points. These
isomorphisms respect specialization, the cone triangle and, after restriction, the inertia action. For
adic systems the statement applies at each finite level before derived completion; the underived
tensor product is not substituted for the derived one.

*Proof sketch.* The universal coefficient comparison is XIII 2.1.13 with derived tensor and its Tor
terms; XIII 2.1.7.5 constructs trait exchange with restriction on inertia, and
SGA 4½ [Th. finitude] proves isomorphy for finite-type schemes (Illusie 2006 §1.1(b), p. 2); check that the
unit/counit construction of specialization and the enhanced cone commute with both comparisons.
(SGA 7 II, Exposé XIII, 2.1.7.5, p. 21, and 2.1.13, pp. 25–26.) *Needs:* EtaleCohomologyFoundations §F.3a (tame character under
ramified extension), 0.6 and the constructibility theorem; EtaleCohomologyFoundations §§F.1–F.2;
EtaleCohomologyFoundations §F.1 and EtaleCohomologyFoundations §F.4.

**Checks.**

- Reduction `ℤ/ℓ² → ℤ/ℓ` carries the derived Tor correction when a stalk is not flat.
- A ramification-index `e` extension replaces `t_ℓ` by `e` times the new tame character (EtaleCohomologyFoundations §F.3a).

- For the identity trait extension and identity coefficient map, both comparison maps are identities.

### 0.8 Adic and rational coefficients

A compatible system `(K_r)` of bounded constructible `ℤ/ℓ^r`-complexes with uniform amplitude defines,
through the derived adic realization of EtaleCohomologyFoundations §F.1 and EtaleCohomologyFoundations §F.4, the integral nearby and
vanishing complexes `RΨ(K)`, `RΦ(K)` with `ℤ_ℓ`-coefficients; tensoring with `ℚ_ℓ` gives the rational
functors and their inertia-equivariant specialization triangle. This is the realization of the
finite-level construction of 0.5, not a second definition of nearby cycles. A non-flat finite-level
system is not realized by an ordinary inverse limit. (Illusie 1994, §4.4, p. 47.) *Proof sketch.*
Apply 0.7 to the transition maps, use the adic completion and realization equivalence with derived
inverse-limit control, and rationalize, keeping integral Tor and inverse-limit terms visible.
*Needs:* 0.7; EtaleCohomologyFoundations §F.1 and EtaleCohomologyFoundations §F.4; EtaleCohomologyFoundations §F.0 (Tate
twists); EtaleCohomologyFoundations §F.4 and ComplexComparisonPartII §C6.6 (adic and rational realization); EtaleCohomologyFoundations §F.4.

**Checks.**

- The vanishing stalk of the node `xy = π` realizes to `ℤ_ℓ(−1)` in degree one.
- The rational triangle is equivariant for inertia, and its first map is specialization.

### 0.8a Nearby-cycle and Betti comparison

The general comparison theorems are supplied by ComplexComparisonPartII §§C6.2–C6.6 /
`riemannExistence`, `artinComparison`, `artinComparisonCompactSupport`,
`relativeArtinComparison`, `adicArtinComparison`. Use its §§C6.0–C6.1 /
`complexAlgebraicTopology`, `topologicalCoefficientComparison` for singular complex spaces,
local coefficients and stratified cochains. Analytification is supplied by
ComplexComparisonPartII §C−1.1 / `complexSchemeAnalytification`.
For finite-type complex schemes use the finite-cover and ordinary finite-ctf comparison;
compact-support comparison requires separated finite type. Proper relative and separated
lower-shriek exchange, chosen-path monodromy, cup, trace, localization and Tate orientation
come from those same suppliers. Integral/rational comparison uses EtaleCohomologyFoundations §F.4's normalized systems
and the supplied adic theorem. There is one coefficient category on each side.

**Nearby-cycle and inertia comparison.** `VanishingCycles.nearbyBettiCompatibility`.
For an algebraic complex one-parameter degeneration, compare the stalk of trait `RΨ` with
the cohomology of the corresponding analytic Milnor fibre using the supplied relative
Artin comparisons and the algebraic strict-local/analytic neighbourhood limits. Identify
chosen étale inertia paths with analytic loops via riemannExistence and prove that
specialization, variation, cup pairings and Picard–Lefschetz generators correspond, with
the pinned Tate orientation. This target is the nearby-cycle adapter of the supplied
general comparisons. (SGA 7 XIII–XV; SGA 4 XVI §4; Weil I §4.1.)
*Needs:* EtaleCohomologyFoundations §§F.0–F.6; 0.2–0.8 (nearby cycles and variation);
ComplexComparisonPartII §§C6.0–C6.6 and §C5.2 (`relativeBettiLocalSystem`).
The LPV.0 constructions use the general supplied comparison, independently of this adapter.

**Checks.**

- The Kummer cover of `ℂ×` has the same cyclic analytic and étale monodromy.
- The trace on `H²(ℙ¹,ℤ/ℓ(1))` is one in both comparison theories.
- For `z²=t` the inertia loop exchanges the two generic points in both fibres.

### 0.10 Absolute cohomological purity

The prerequisite build order is the pointwise reduction, shared log charts and actions, Galois alteration,
equivariant resolution, regular log resolution, log-smooth purity and prime-to-ℓ descent below.
All purity statements carry invertible coefficients; none assumes absolute purity of 0.10.
The log objects throughout this section are those of the shared CrystallineCohomology contract.

**Theorem (pointwise reduction).** Define `VanishingCycles.PointwisePure X Λ` by requiring
`Λ(−d)[−2d]→i_x^!Λ` to be an isomorphism at every regular local point of dimension `d`.
Prove `VanishingCycles.purity_pointwiseReduction`: for a regular immersion between regular
schemes, pointwise purity of source and target implies purity of the pair; establish invariance
under strict henselization and completion, reduction of `ℤ/n` to `ℤ/ℓ`, and Fujiwara's reduction
of general regular local schemes to regular integral quasi-projective schemes flat over strictly
henselian mixed-characteristic traits. (ILO XVI §§3.2–3.3, especially 3.2.3–3.2.5; §3.7 citing
Fujiwara 2002 Corollary 6.1.5.) *Needs:* EtaleCohomologyFoundations §§F.1–F.6; SchemeAndStackFoundations §§0.12–0.14, 0.21;
ModularCurves Layer 4D (completion).

**Checks.**

- A geometric point has dimension zero and its fundamental class is the identity.
- For a trait and its closed point the required map has degree two and twist minus one.
- Reduction `ℤ/15→ℤ/3×ℤ/5` tests both prime factors; purity at only one factor does not
  establish purity with `ℤ/15` coefficients.

**Construction (purity-specific logarithmic actions and quotients).** Use the fs log
schemes, charts, log differentials, log smooth/log étale predicates and log regularity
supplied by CrystallineCohomology §§CR.5:log-algebra.1–CR.5:log-algebra.4 and the
logarithmic-differential construction of §CR.5.1. Use its canonical trait chart
`ℕ→R`, `1↦π`, and divisorial boundary structures. On this carrier build log blow-ups
and finite-group actions. An action is tame when every geometric point stabilizer has
order invertible in its residue field, and very tame when in addition each stabilizer
acts trivially on the characteristic monoid and on the corresponding stratum.
Prove `VanishingCycles.veryTameQuotient`: for a noetherian fs log-regular scheme with an
admissible, generically free, very tame finite-group action, the quotient exists as an
fs log-regular scheme and the quotient map is a Kummer étale cover. Admissibility means
that each orbit is contained in an affine open. The quotient log structure and log
modifications use the shared log sheaves and fs fibre products.
(ILO VI §§1–3, especially Definition 3.1 and Theorem 3.2; XVI 3.6.1–3.6.4.)
*Needs:* the specified CrystallineCohomology sections; SchemeAndStackFoundations
§§0.8, 1.1 (descent and quotients); StableReduction Layer 4 (blow-ups).

**Checks.**

- With trivial group on a regular scheme with normal-crossings boundary, the quotient
  is the same shared fs log scheme and the identity is Kummer étale.
- For `π=u^e`, with `e` prime to the residue characteristic, the cyclic action on the
  canonical log trait is very tame; its quotient has the root chart `1↦e` and is log regular.
- In residue characteristic dividing `e`, the root chart remains Kummer but is not
  log étale, and its wild stabilizer fails the tame hypothesis.

**Theorem (Galois semistable alteration).** Let `S` be an excellent strictly henselian trait with
generic point `η`, and `X` a normal integral scheme, proper and flat of finite type over `S`, with
geometrically integral generic fibre. Construct `VanishingCycles.galoisSemistableAlteration`: a
finite extension of traits `S'→S` with generic point `η'`, a finite group `G` acting on `S'` over
`S`, and a `G`-equivariant projective surjective `X'→X` over `S'→S`, with `G` trivial on `X` and
faithful on `X'`, and `X'` regular, connected and strictly semistable over `S'` with the shared fs
log model. The fixed field `η'^G` is radicial over `η`, and there are a dense open `U ⊂ X_η` and a
`G`-stable dense open `W ⊂ X'_{η'}` over it such that, with `K = ker(G → Aut(η'))`, `W → W/K` is a
Galois étale cover with group `K` and `W/K → U ×_η η'` is a universal homeomorphism. When `η` has
characteristic zero, in particular over every trait of mixed
characteristic `(0, p)` (such a trait is a Dedekind domain with fraction field of characteristic
zero, hence excellent), purely inseparable extensions are trivial: the universal homeomorphism is
an isomorphism over a dense open, `η'/η` is Galois with group `G/K`, and `X'→X` is generically a
Galois étale cover with group `G`. Purity uses only this case, because a regular scheme over a
prime field is already pointwise pure (ILO XVI Proposition 3.2.5), so equal-characteristic traits
never reach this step. Apply to a projective closure and restrict to a quasi-projective open when
needed. (ILO X Lemma 2.5, p. 153, and Remark 3.3.2, after Vidal 2004b, Proposition 4.4.1; ILO XVI
§3.7, pp. 254–255, for the mixed-characteristic form; Stacks 07QW for excellence.)
*Needs:* SchemeAndStackFoundations §§0.21, 4.19–4.20; the log charts above.

**Checks.**

- A smooth proper model already has the identity alteration and trivial group.
- A strictly semistable proper model permits the identity and its existing boundary chart.
- In a tame cyclic trait extension `π=u^e`, the generic Galois action sends `u` to `ζu`
  and extends to the regular model; the base extension and action are retained as data.
- In equal characteristic `p`, take `X = S`, `S'` the normalization of `S` in `η(π^{1/p})`,
  `X' = S'` and `G = K = 1`: the data satisfy the general statement, with `η'^G = η'`
  radicial over `η`, but `X'→X` is a universal homeomorphism of degree `p` and is not
  generically étale. The generically Galois étale form needs the characteristic-zero
  generic point.

**Theorem (equivariant log resolution).** For a noetherian quasi-excellent separated
log-regular fs scheme `X` with a tame generically free action of a finite group `H`, construct
`VanishingCycles.equivariantLogResolution`: an `H`-equivariant morphism of fs log schemes
`h:X′→X` whose underlying scheme map is a projective modification, hence an isomorphism
over a dense open. If `Z` is the boundary where the log structure of `X` is nontrivial
and `T` is the nonfree locus of the action, the source has boundary `Z′=h⁻¹(Z∪T)`,
is log regular and carries a very tame action. The morphism `h` need not be log smooth
or log étale (ILO VIII Theorem 1.1 and Remark 1.2(a), pp. 85–86).
For the relative version assume `X→B` is an equivariant log-smooth map of log-regular pairs
between noetherian quasi-excellent separated log-regular fs schemes, `H` acts trivially on
`B`, and tamely and generically freely on `X`. With the same enlarged boundary,
`(X′,Z′)` is log smooth over `B`; when the action on `X′` is admissible, its quotient
pair `(X′/H,Z′/H)` exists and is log smooth over `B`
(ILO X Theorem 1.1, pp. 135–136; VI §3). Admissibility means that every orbit lies in an affine open.
The regular log blow-up below is a separate log-étale morphism.
*Needs:* log charts, quotients, tame and generically free actions above;
SchemeAndStackFoundations §§0.21, 1.1; StableReduction Layer 4 (blow-ups).
The relative construction uses these hypotheses on both `X` and `B`.

**Checks.**

- With trivial `H` on a regular normal-crossings pair, the identity is very tame.
- In the tame diagonal action `(x,y)↦(ζx,ζ⁻¹y)` on the boundary `xy=0`, the stabilizer
  acts trivially on its characteristic monoid and on the zero-dimensional closed stratum.
- A free action has trivial point stabilizers, so is very tame; a stabilizer acting
  nontrivially on a positive-dimensional stratum fails very tameness.
- For the scalar `{±1}` action on `𝔸²_k` with trivial log structure and `char k≠2`,
  `Z=∅` and `T={0}`. Blowing up the origin and adding the exceptional divisor as `Z′`
  gives a very tame action. The modification map is not log smooth: its exceptional
  fibre has chart `ℕ→O_{ℙ¹}`, `1↦0`, over the trivially logged point.

**Theorem (regular log blow-up resolution).** For a noetherian quasi-excellent log regular
fs scheme, construct `VanishingCycles.regularLogResolution`: a projective birational log
blow-up with regular underlying scheme; the map is log étale, hence preserves log smoothness.
Its toric-chart construction uses subdivisions of rational polyhedral cones and descends
compatibly across charts. (ILO VI, log blow-up resolution; VIII §§3.3–3.4; XVI §3.7.)
*Needs:* the log charts above; SchemeAndStackFoundations §0.21; StableReduction Layer 4.

**Checks.**

- A smooth toric chart with free characteristic monoid needs no subdivision.
- The toric surface `xy=z²` is resolved by its vertex blow-up; the exceptional curve is `ℙ¹`.
- For `xy=π²`, subdivision inserts the exceptional rational component and makes the
  underlying model regular; log regularity alone did not imply regularity of the original model.

**Theorem (regular log-smooth purity).** Prove `VanishingCycles.logSmooth_pointwisePure`:
if an fs log scheme is log smooth over a trait with its canonical log structure, and its
underlying scheme is regular, then it is pointwise pure. Reduce by charts to monomial models,
prove the semistable monomial case by Kummer cohomology and smooth purity, and handle general
exponents by the coefficient and Kummer reductions of ILO XVI §3.5. (ILO XVI Theorem 3.6.2,
Propositions 3.5.12 and 3.6.5.) *Needs:* pointwise reduction and log charts above; EtaleCohomologyFoundations §F.2, EtaleCohomologyFoundations §F.6;
ArithmeticGaloisDuality R02.1–R02.2 (continuous Kummer cohomology).

**Checks.**

- The canonical trait is pointwise pure at its closed point.
- The regular semistable surface `xy=π` has pointwise purity with the dimension-two twist.
- A smooth affine space over the trait inherits pointwise purity by smooth base change.

**Theorem (prime-to-ℓ purity descent).** Prove `VanishingCycles.pointwisePure_descent`:
for a proper dominant generically étale map of regular integral finite-type schemes over a
trait, both admitting ample bundles, of degree `d` invertible in `Λ`, pointwise purity of the
source implies pointwise purity of the target. Construct trace and Gysin maps whose composites
are `d id`, so the target fundamental-class map is a retract of the pushed-forward source map.
(ILO XVI Proposition 3.5.7 and Lemmas 3.5.8–3.5.9.) *Needs:* EtaleCohomologyFoundations §F.2, EtaleCohomologyFoundations §F.5, EtaleCohomologyFoundations §F.6 and pointwise reduction.

**Checks.**

- A degree-one modification has trace composite the identity.
- A degree-two finite étale cover with `Λ=ℤ/3` has trace composite `2 id`, which is invertible.
- With `Λ=ℤ/2` the same degree-two composite is zero; the retract argument fails.

**Theorem (absolute purity, Gabber).** Let `X` be a regular noetherian scheme, `i : Z → X` a closed
immersion with `Z` regular and of pure codimension `c`, and `n` an integer invertible on `X`. Then
`Ri^!(ℤ/n) ≅ ℤ/n(−c)[−2c]` on `Z`, the isomorphism being given by the fundamental class
`cl_Z ∈ H^{2c}_Z(X, ℤ/n(c))`. Equivalently `R^q i^! ℤ/n = 0` for `q ≠ 2c` and `R^{2c} i^! ℤ/n(c)` is free
of rank one generated by `cl_Z`. Consequences: for a morphism of finite type `f : X → Y` between regular schemes
(with ample line bundles) of virtual relative dimension `d`, the Gysin map `ℤ/n(d)[2d] → Rf^!ℤ/n` is an isomorphism;
and for a strict normal crossings divisor `D = ΣD_i` in a regular `X` with complement `j`,
`R^1j_*ℤ/n ≅ ⊕_i (ℤ/n)_{D_i}(−1)` and `R^*j_*ℤ/n` is the exterior algebra on it. The fundamental classes are compatible with transverse pullback and
with composition of regular immersions, and for `X` smooth over a field they agree with the cycle
classes of EtaleCohomologyFoundations §F.6.

The uses in this roadmap are regular pairs over a henselian trait: the components and their
intersections in a regular strictly semistable scheme (1.9 and Layer LPV.7a), and the exceptional
divisor of a blown-up ordinary quadratic point in odd relative dimension (2.7). There the statement
supplies the Gysin isomorphisms `H^q_Z(X, Λ) ≅ H^{q−2c}(Z, Λ)(−c)` and the localization sequences with
their boundary signs.

*Proof sketch.* Riou's proof of Gabber's theorem: construct the Gysin morphism from Chern classes;
reduce to `Λ = ℤ/ℓ` and to pointwise purity of regular local schemes; by Fujiwara's reduction pass to a
regular integral scheme, quasi-projective and flat over a strictly henselian trait of mixed
characteristic, using the completion reduction to an excellent trait. Apply the Galois
semistable alteration and take an ℓ-Sylow subgroup `H⊂G`. Put `T=S′/H`: the extension
`S′→T` is tame, hence log étale for the canonical trait charts. Thus `X′` is log smooth
over `T`, on which `H` acts trivially. The regular semistable `X′` and the trait `T`
are noetherian quasi-excellent separated log-regular fs schemes; `H` is tame because ℓ
is invertible and generically free by the generic Galois cover. Quasi-projectivity over
the affine trait makes its action admissible, as it does after the projective modification.
Apply ILO X 1.1 to obtain a very tame action and log-smooth quotient, and resolve that quotient
by a regular log blow-up. Regular log-smooth pointwise purity and prime-to-ℓ descent then
conclude, using the named prerequisites above. For a
strict normal crossings divisor `D = ΣD_i` in a regular `X` with complement `j`, purity gives
`R^1j_*Λ ≅ ⊕Λ_{D_i}(−1)` and `R^*j_*Λ` is the exterior algebra on it. (Illusie–Laszlo–Orgogozo,
*Travaux de Gabber sur l'uniformisation locale et la cohomologie étale des schémas quasi-excellents*,
Astérisque 363–364 (2014), arXiv:1207.3648, Exposé XVI (J. Riou), Théorème 3.1.1, Corollaires 3.1.2–3.1.3,
and the proof in §3.7.) *Needs:* EtaleCohomologyFoundations §F.6 (smooth purity) and EtaleCohomologyFoundations §F.6 (cycle classes and Gysin
maps); the seven prerequisites above; SchemeAndStackFoundations Layer 0, §0.21 (regular and excellent schemes).

**Checks.**

- `absolutePurity_smooth_pair`: for `Z ⊂ X` smooth over a field, the fundamental class is the cycle
  class of EtaleCohomologyFoundations §F.6 and the theorem is relative purity of EtaleCohomologyFoundations §F.6.
- `absolutePurity_point_on_trait`: for `X = S` a henselian trait and `Z = {s}`, `c = 1`:
  `H^2_s(S, μ_n) ≅ ℤ/n` generated by the class of a uniformizer, and `H^1_s = 0`; the map
  `H^1(η, μ_n) = k(η)^×/n → H^2_s(S, μ_n)` is the valuation mod `n`.
- `absolutePurity_not_singular`: for the node `X = Spec k[x, y]/(xy)` and `Z` the origin (`X` not regular),
  `H^q_Z(X, Λ)` is nonzero for `q = 1`, so regularity cannot be dropped.

### Examples

- The node `xy = π` over a strictly henselian trait: `R^1Φ(Λ)` is free of rank one at the origin and
  zero elsewhere, `RΦ = 0` away from the origin, and the specialization sequence of 0.6 for a proper
  family acquiring one node is `0 → H^1(X_s̄) → H^1(X_η̄) → Λ(−1) → H^2(X_s̄) → H^2(X_η̄) → 0`.
- For `X = S`, `Ψ_η(F)` is the generic representation `F_η̄`, while `i^*j_*F = F_η̄^I` loses the inertia
  action.

### Dependencies

Mathlib (henselian and discrete valuation rings, valuation inertia groups, small étale sites,
derived categories); Tau Ceti (`TauCeti.genericFiber`, `TauCeti.specialFiber`);
EtaleCohomologyFoundations §§F.0–F.6, F.3a, 0.7–0.11; EnhancedDerivedSheaves §§0.1–0.4;
ComplexComparisonPartII §§C−1.1, C5.2, C6.0–C6.6; SchemeAndStackFoundations Layers 0 and 2;
TauCetiRoadmap ModularCurves Layer 4D; ArithmeticGaloisRepresentations §2.1a and
LocalFieldsRamification Layer 4 (local-field specialization of the tame character);
CrystallineCohomology §§CR.5:log-algebra.1–CR.5:log-algebra.4 and §CR.5.1
(logarithmic differentials for 0.10).

## Layer LPV.1: Inertia, variation and the monodromy operator

This layer turns the inertia action on nearby cycles into linear algebra. It proves that inertia acts
quasi-unipotently on the cohomology of a family over a henselian trait, defines the twisted monodromy
operator `N : V → V(−1)` and its compatibilities with Frobenius, finite extensions, `can` and `var`,
builds the monodromy filtration of a nilpotent endomorphism of an object of an abelian category with
its primitive decomposition and the relative variant, and computes the filtered nearby complex of a
regular semistable scheme with two components. It ends with the semisimple trace of Frobenius on
nearby cycles. The logarithm of a unipotent automorphism and the monodromy filtration of a nilpotent
endomorphism of a finite-dimensional vector space, with its uniqueness and tensor and dual rules, are
ArithmeticGaloisRepresentations Layer 2 (§2.4 `IsUnipotent.log`, `IsUnipotent.log_exp_and_exp_log`; §2.6
`WeilDeligneRep.monodromyFiltration`); this layer uses them and adds what the geometric applications need.

### 1.1 The geometric local monodromy theorem

Let `K` be the fraction field of a henselian discrete valuation ring with residue field `k` of
characteristic `p ≥ 0`, `G = Gal(K^sep/K)`, `I` its inertia group and `ℓ ≠ p`. An ℓ-adic representation
`ρ : G → GL(V)` is **quasi-unipotent** if `ρ` is unipotent on an open subgroup `I_1 ⊂ I`.

**Theorem (Grothendieck's arithmetic monodromy theorem).** If no finite extension of `k` contains all
ℓ-power roots of unity, every ℓ-adic representation of `G` is quasi-unipotent. For `k` finite this is
ArithmeticGaloisRepresentations Layer 2, §2.4 (`GaloisRep.grothendieck_quasiUnipotent`); the proof for general `k` is
the same: the image of the wild inertia is finite, and a Frobenius-type element acting on the tame
quotient through an infinite subgroup of `ℤ_ℓ^×` forces the eigenvalues of `ρ(σ)`, `σ` in the tame
inertia, to be roots of unity. (Illusie 1994, Théorème 1.2, pp. 11–12.)
*Lean:* `Suggested.lean` states `grothendieck_arithmeticMonodromy` for every henselian discrete valuation
field, coefficient prime invertible in its residue field, and finite-dimensional continuous ℓ-adic
representation. It uses the native valuation inertia subgroup in the algebraic closure and its Krull topology.
The residue-field extension generated by all ℓ-power roots of unity is required to be infinite.
*Needs:* EtaleCohomologyFoundations §F.3a, EtaleCohomologyFoundations §F.4; ArithmeticGaloisRepresentations §2.4.

**Checks.**

- For a finite quadratic inertia representation over a finite residue field, the quadratic extension kills inertia.
- For the two-dimensional Tate-curve representation over a local field, inertia is already unipotent and nontrivial.
- Over a strictly henselian equal-characteristic-zero trait, the character of `ℤ_ℓ` sending `1` to `1+ℓ²` is not quasi-unipotent; the roots-of-unity hypothesis fails.

**Construction (smooth-stage trait descent).** Build
`VanishingCycles.geometricMonodromy_traitDescent`. For henselian DVRs `R₀→R` with a common
uniformizer `π` and separable residue and fraction-field extensions, express `R` as a filtered
colimit of henselian essentially smooth finite-type `R₀`-algebras `B_i`, using
SchemeAndStackFoundations §0.15 and henselizing its smooth stages; descend finite
presentation data over `R[1/π]` to a common `B_i[1/π]`. For a separated finite-type `K`-scheme
and a fixed degree of ordinary or compactly supported geometric cohomology, descend its
finite-rank cohomology local system to a punctured smooth stage, with its integral lattice,
its geometric-stalk identification and its inertia-action comparison. First pass to a trait
extension making the lattice modulo ℓ constant. In mixed characteristic include passage to
completion and perfect residue field, preserving geometric cohomology and a finite-index
inertia image. Choose the smaller trait with residue field finitely generated over the prime
field or purely inseparable over such a field, as in SGA 7 I 0.5.2–0.5.3. The latter case is
needed in mixed characteristic.
The divisor `π=0` on the smooth stage is regular. Prove the regular-divisor arithmetic variant:
for a henselian regular local scheme with this regular divisor, finite wild image and a
residue field satisfying the roots-of-unity hypothesis of the arithmetic theorem imply
quasi-unipotence of its local inertia (SGA 7 I 1.4). Construct the diagram comparing trait
inertia with divisor inertia, identifying tame characters; its pullback recovers the original
cohomology representation. (SGA 7 I 0.5.1–0.5.3, 1.3–1.4; BLR §3.1 Theorem 3 and §3.6
Lemma 5; Illusie 1994 §1.4, p. 12.) *Needs:* EtaleCohomologyFoundations §F.3a, EtaleCohomologyFoundations §§F.0–F.4;
SchemeAndStackFoundations §§0.9, 0.12–0.15, 0.21 (finite-presentation limits, henselization,
Néron–Popescu approximation and completion); the arithmetic theorem above. Separability
of both field extensions makes `R₀→R` regular; prove the trait and regular-divisor inertia
comparisons here.

**Checks.**

- For `R₀=R`, the identity smooth stage descends the same family and inertia action.
- For `xy=π`, a stage containing `π` retains the nodal equation and its nonzero unipotent cohomology action.
- For a mixed-characteristic complete DVR with perfect residue field, the smaller residue
  field can be the perfect closure of a finitely generated field; it need not itself be finitely generated.
- The character `1↦1+ℓ²` over a strictly henselian characteristic-zero trait is not an
  instance of this construction: there is no asserted geometric cohomology local system producing it.

**Theorem (geometric local monodromy theorem).** For `X` separated of finite type over `K`, inertia acts
quasi-unipotently on `H^n(X_{K^sep}, ℚ_ℓ)` and on `H^n_c(X_{K^sep}, ℚ_ℓ)`, for every residue field `k`.
After a finite extension of `K` the action of inertia is unipotent and factors through the tame
character `t_ℓ` of EtaleCohomologyFoundations §F.3a. An arbitrary continuous representation of the inertia group of a field with
algebraically closed residue field is not quasi-unipotent, and the theorem says nothing about it.

*Proof sketch.* Ordinary and compactly supported geometric cohomology are finite-dimensional
by EtaleCohomologyFoundations §F.3. Apply `geometricMonodromy_traitDescent` and the regular-divisor arithmetic variant
to the descended local system, then pull back its quasi-unipotent inertia action through the
comparison diagram. On an open subgroup with unipotent action the finite wild image is trivial
in characteristic zero, so the action factors through `t_ℓ`.
(Illusie 1994, Théorème 1.4, pp. 11–12.) *Needs:* EtaleCohomologyFoundations §F.3a, 0.8, EtaleCohomologyFoundations §§F.0–F.4;
`VanishingCycles.geometricMonodromy_traitDescent`; the arithmetic theorem and its
regular-divisor variant above; ArithmeticGaloisRepresentations §2.4.

**Checks.**

- `localMonodromy_quadratic`: for `X = Spec K[y]/(y² − π)` with `p ≠ 2`, inertia acts on
  `H^0(X_{K^sep}, ℚ_ℓ) = ℚ_ℓ²` by swapping the two points, a finite (quadratic) action; after the
  extension `K(√π)` it is trivial, and `N = 0`.
- `localMonodromy_tate`: for a Tate elliptic curve with `v(q) > 0`, inertia acts unipotently but
  nontrivially on `H^1`, already over `K`.
- `arithmetic_needs_residue_hypothesis`: for `k` algebraically closed of characteristic zero, the
  character `σ ↦ (1 + ℓ)^{t_ℓ(σ)}` of `I ≅ Ẑ(1)` (after a generator of `ℤ_ℓ(1)`) is continuous and is not
  quasi-unipotent; so the arithmetic theorem needs its residue-field hypothesis, and the geometric
  theorem is a statement about cohomology, not about all representations.

### 1.2 The twisted monodromy operator

Let `ρ : G → GL(V)` be a quasi-unipotent representation on a finite-dimensional `ℚ_ℓ`-vector space (for
instance the geometric cohomology of 1.1). There is a unique nilpotent `N : V → V(−1)` such that
`ρ(σ) = exp(t_ℓ(σ) N)` for `σ` in every open subgroup of `I` on which `ρ` is unipotent; here
`t_ℓ(σ) N` means `N` followed by evaluation of the twist on `t_ℓ(σ) ∈ ℤ_ℓ(1)`, and the exponential and
logarithm are those of ArithmeticGaloisRepresentations Layer 2, §2.4 (`IsUnipotent.log` is the finite
sum `Σ_{1≤j<d} (−1)^{j+1}(T − 1)^j/j` for `(T − 1)^d = 0`, independent of `d` and inverse to
`IsNilpotent.exp`). Define
`VanishingCycles.monodromyOperator ρ` as this `N`. Prove:

- `VanishingCycles.monodromyOperator_equivariant`: `N` is `G`-equivariant as a map `V → V(−1)`: for
  `g ∈ G`, after trivializing the twist, `ρ(g) N ρ(g)⁻¹ = χ_ℓ(g) N` with `χ_ℓ` the cyclotomic character. When
  `k = 𝔽_q` and `F` is a lift of the geometric Frobenius, `χ_ℓ(F) = q⁻¹` and this reads `N F = q F N`.
- `VanishingCycles.monodromyOperator_generator`: replacing the generator `ζ` of `ℤ_ℓ(1)` used to write `N`
  as an endomorphism by `uζ`, `u ∈ ℤ_ℓ^×`, multiplies the matrix of `N` by `u` and the coordinate of
  `t_ℓ(σ)` by `u⁻¹`, and leaves the twisted map unchanged.
- `VanishingCycles.monodromyOperator_restrict`: for a finite extension `K'/K` of ramification index `e`,
  `N_{K'} = e · N_K` relative to the respective tame characters (EtaleCohomologyFoundations §F.3a, `tameCharacter_restrict`). Over
  `ℚ_ℓ` the nilpotency index, the monodromy filtration and the dimensions of primitive parts are
  unchanged, because the filtration is invariant under nonzero scalars (1.3). Integral statements do
  not cancel `e` when `ℓ ∣ e`.
- `VanishingCycles.monodromyOperator_eq_grothendieck`: for `K` a nonarchimedean local field, `N` is the
  operator of `GaloisRep.grothendieck_quasiUnipotent` (ArithmeticGaloisRepresentations Layer 2, §2.4).

*Proof sketch.* On an open subgroup `I_1` where `ρ` is unipotent, the kernel of `t_ℓ` is profinite of order
prime to `ℓ`, so its image is finite and unipotent, hence trivial; thus `ρ|_{I_1}` factors through
`t_ℓ(I_1) ⊂ ℤ_ℓ(1)`, and `log ρ(σ)` is `ℤ_ℓ`-linear in `t_ℓ(σ)`. Uniqueness is clear from
`exp`/`log`. Equivariance is the conjugation rule `t_ℓ(gσg⁻¹) = χ_ℓ(g) t_ℓ(σ)`; geometric Frobenius acts
on `ℚ_ℓ(−1)` by `q`. The ramified extension uses `t_ℓ|_{I'} = e t'_ℓ`. (Illusie 1994, 1.5 and
(1.5.1)–(1.5.4), pp. 12–13; Weil II, 1.6.14 and 1.7.2, pp. 169–172.) *Needs:* EtaleCohomologyFoundations §F.3a, 1.1;
ArithmeticGaloisRepresentations Layer 2, §2.4; EtaleCohomologyFoundations §F.0 (Tate twists).

**Checks.**

- `monodromyOperator_two_block`: on `V = ℚ_ℓ²` with `ρ(σ) = [[1, t_ℓ(σ)], [0, 1]]` (after a generator of
  `ℤ_ℓ(1)`), `N(e_1) = e_0`; if Frobenius has eigenvalue `a` on `ker N = ℚ_ℓ e_0` and `qa` on the quotient,
  then `NF = qFN`; arithmetic Frobenius would give `q⁻¹` instead.
- `monodromyOperator_finite`: if `ρ(I)` is finite then `N = 0`, for example a quadratic character of
  inertia; after the quadratic extension the action is trivial.
- `monodromyOperator_restrict_node`: for a nodal curve and the base change `t = u^e`, the rank-one
  logarithm is multiplied by `e`.

### 1.3 The monodromy filtration in an abelian category

Let `𝒜` be an abelian category, `X` an object of `𝒜` and `N` a nilpotent endomorphism of `X` (or a
morphism `N : X → X(−1)` for a Tate twist functor that is an autoequivalence commuting with `N`), and
`c ∈ ℤ`. **Definition.** The monodromy filtration centred at `c`, `VanishingCycles.monodromyFiltration N c`,
is the unique finite increasing filtration `M` of `X` with

```text
N(M_i) ⊂ M_{i−2}(−1)    and    N^r : gr^M_{c+r} X ≅ gr^M_{c−r} X(−r)   for all r ≥ 0.
```

For a finite-dimensional vector space and `c = 0` it is `WeilDeligneRep.monodromyFiltration` of
ArithmeticGaloisRepresentations Layer 2, §2.6, given by the kernel–image formula
`M_k = Σ_{a−b=k, a,b≥0} ker N^{a+1} ∩ im N^b`; the centred version is its shift by `c`. For `N = 0` it is
`M_{c−1} = 0`, `M_c = X`. Primitive parts use Deligne's lower convention:
`P_i = ker(N : gr_i → gr_{i−2})`, the bottom vectors of the `N`-strings; it is zero for `i > c`, because
`N` is injective on `gr_i` for `i > c`.

- `VanishingCycles.monodromyFiltration`: The finite increasing kernel-image filtration `M` indexed by `ℤ` and centered at `c`.
- `VanishingCycles.monodromyFiltration_mono`: `M_i≤M_j` for `i≤j`, with a finite lower and upper bound.
- `VanishingCycles.monodromyFiltration_lowering`: `N(M_i)⊂M_(i−2)`.
- `VanishingCycles.monodromyGradedPower`: The induced map `N^r` from `Gr_(c+r)` to `Gr_(c−r)`, with twist `−r`.
- `VanishingCycles.monodromyGradedPower_bijective`: Each opposite graded-power map is bijective.
- `VanishingCycles.monodromyFiltration_scalar`: In an `R`-linear abelian category, `M(aN,c)=M(N,c)` for `a∈Rˣ`; over a field, `a≠0` suffices.
- `VanishingCycles.primitivePart`: `P_i` is the kernel of the induced graded `N`, using the lower-weight convention.
- `VanishingCycles.monodromyFiltration_conj`: Conjugation by a linear equivalence maps each filtration submodule to the corresponding submodule of the conjugate operator.
- `VanishingCycles.gradedN`: The map on the actual associated graded induced by `N`, lowering the index by two.
- `VanishingCycles.gradedN_mk`: On a class represented by `x`, the induced graded map returns the class represented by `Nx`.
- `VanishingCycles.monodromyGradedPower_mk`: The opposite graded-power map returns the class of `N^r x`, fixing its relation to the input operator.
- `VanishingCycles.monodromyFiltration_eq_vectorSpace`: for a finite-dimensional vector space the
  filtration centred at `0` is ArithmeticGaloisRepresentations' `WeilDeligneRep.monodromyFiltration N`.

*Proof sketch.* Existence and uniqueness by induction on a nilpotence bound `d` (`N^{d+1} = 0`): put
`M_{c+d} = X`, `M_{c−d−1} = 0`, `M_{c+d−1} = ker N^d`, `M_{c−d} = im N^d`, and apply the induction hypothesis
to `ker N^d / im N^d` with the induced endomorphism. Uniqueness uses the same extreme graded pieces.
Scalar invariance: the defining conditions are unchanged by `N ↦ aN`, `a` invertible. (Weil II,
1.6.1–1.6.7 and 1.6.14, pp. 165–170.) *Needs:* ArithmeticGaloisRepresentations Layer 2, §2.6; Mathlib
abelian categories (`CategoryTheory.Abelian`), images and kernels; EtaleCohomologyFoundations §F.0 (Tate twists).
*Lean:* `Suggested.lean` states existence, uniqueness and strictness in every abelian category as
`monodromyFiltration_exists_unique`, using `IsMonodromyFiltration` for the defining conditions.
For each `r ≥ 0`, the subobject equalities
`N^r M_(c+r) + M_(c−r−1) = M_(c−r)` and
`M_(c+r) ∩ (N^r)⁻¹ M_(c−r−1) = M_(c+r−1)` express graded surjectivity and injectivity.

**Checks.**

- `VanishingCycles.monodromyFiltration_zero`: For `N=0` the filtration is 0 below `c` and `V` at and above `c`.
- `VanishingCycles.monodromyFiltration_two_block`: For `N(e₁)=e₀` on `ℚ²` centered at zero, `M_−2=0`, `M_−1=M_0=ℚe₀` and `M_1=V`.
- `VanishingCycles.monodromyFiltration_three_block`: For `N(e₂)=e₁`, `N(e₁)=e₀`, the weights are `−2,0,2` and `Gr_−1=Gr_1=0`.
- `VanishingCycles.monodromyFiltration_not_kernel_filtration`: For a two-block, `ker N` is `M_−1`, and `M_0` is still `ker N`, whereas `ker N²` is `V`.
- A size-three Jordan block has weights `c − 2, c, c + 2`; a size-two block has weights `c − 1, c + 1`, so
  the filtration is not the kernel filtration `ker N^j`.

### 1.4 Strictness and primitive decomposition

**Theorem.** For the monodromy filtration centred at `0` in an abelian category:

1. `N : (X, M) → (X(−1), M[−2])` is strict: `N(M_{i+2}) = im N ∩ M_i(−1)`. Consequently
   `gr_i(ker N) ≅ P_i`.
2. (Primitive decomposition.) For every `i`,
   `gr_i X = ⊕_{j ≥ |i|, j ≡ i mod 2} N^{(j−i)/2} (N^j)^{−1} P_{−j}`: each graded piece is the direct sum of
   the images of the lower primitive parts `P_{−j}`, `j ≥ |i|`, `j ≡ i mod 2`, under the inverse of the
   opposite isomorphism `N^j : gr_j ≅ gr_{−j}` followed by a power of `N`, with the twists attached to
   powers of `N`. On a Jordan block of length `d + 1` the weights are
   `d, d − 2, …, −d`.
3. (The `sl₂` realization.) For an untwisted nilpotent endomorphism of a finite-dimensional vector space
   over a field `k` of characteristic zero, `gr^M X` carries a canonical ordinary `𝔰𝔩₂` action, expressed
   as a Lie algebra homomorphism `sl (Fin 2) k →ₗ⁅k⁆ Module.End k (gr^M X)` and its induced `LieModule`.
   The induced graded `N` is the lowering operator `Y` and `H` acts by the weight `i` on `gr_i`; the raising
   operator `X` is defined on the primitive decomposition by `X(N^a u) = a(j − a + 1) N^{a−1} u` for
   `u = (N^j)^{−1} p`, `p ∈ P_{−j}`, `1 ≤ a ≤ j`, with the endpoint value `X(u) = 0`.
   These operators satisfy `[X,Y] = H`, `[H,X] = 2X` and `[H,Y] = −2Y`, including when `N = 0`,
   where the action is trivial. If `N ≠ 0`, they also satisfy Mathlib's `IsSl2Triple H X Y`:
   a string of length at least two has a nonzero weight, so `H ≠ 0`. Each `N`-string through a primitive
   vector of `P_{−j}` is the irreducible `𝔰𝔩₂`-module of dimension `j + 1` (TauCetiRoadmap
   RepresentationTheory/LieHighestWeight Layer 0).

For a Tate-twisted `N`, the intrinsic lowering and raising maps have targets twisted by `−1` and `1`,
respectively. An ordinary `𝔰𝔩₂` action requires a trivialization of the Tate line; multiplying its
generator by `a` multiplies the lowering map by `a` and the raising map by `a⁻¹`.

Strictness is asserted for `N` and for isomorphisms commuting with `N`, not for an arbitrary morphism
commuting with `N`. The rules for tensor products (`N_1 ⊗ 1 + 1 ⊗ N_2`, filtration the convolution of
the two with centres added) and duals (`−Nᵗ`, `M_i(V^*) = ann M_{−i−1}(V)` at centre zero) over a field of
characteristic zero are ArithmeticGaloisRepresentations Layer 2, §2.6; with the `𝔰𝔩₂` realization of
item 3 they follow from the Clebsch–Gordan rule, and `Sym^d` of the two-block is the block of length
`d + 1` with weights `−d, −d + 2, …, d`.

*Proof sketch.* Split each graded piece into the primitive kernel and the image of the next power of
`N` using the opposite isomorphisms; iterate; strictness follows by graded surjectivity and injectivity.
In characteristic zero define `X` on the primitive decomposition by the displayed formula and check the
three bracket relations on each string, giving the homomorphism even for the trivial action;
for `N ≠ 0`, a nontrivial string supplies the nonzero weight operator required by the native triple.
(Weil II, 1.6.3–1.6.8 and 1.6.10–1.6.12, pp. 165–168.)
*Needs:* 1.3; Mathlib `LieHom`, `LieModule` and `IsSl2Triple`; TauCetiRoadmap RepresentationTheory/LieHighestWeight Layer 0
(finite-dimensional `𝔰𝔩₂`-modules and Clebsch–Gordan); ArithmeticGaloisRepresentations Layer 2, §2.6.

**Checks.**

- For `N = 0` on `ℚ`, only `gr_0` is nonzero and
  `H = X = Y = 0`. The canonical action is trivial and satisfies the bracket relations, but
  `IsSl2Triple H X Y` is false because its `h_ne_zero` field would require `0 ≠ 0`.
- For `N(e₁) = e₀` on `ℚ²`, the graded weights are `−1, 1`.
  In the basis `(e₀,e₁)`, `H = diag(−1,1)`, `X(e₀) = e₁`, `X(e₁) = 0` and `Y = N`;
  the operators satisfy `IsSl2Triple H X Y`.
- `primitive_three_block`: a size-three block has a one-dimensional `P_{−2}` and no other primitive
  part; with `u = (N²)^{−1}p` its top vector, `X` sends `u` to `0`, `Nu` to `2u` and `N²u = p` to `2Nu`.
- `strict_fails_for_commuting_map`: for the inclusion of a trivial one-dimensional module into `ker N` of a
  two-block, strictness fails at index `−1`; the theorem does not assert it for such maps.
- `tensor_two_blocks`: two size-two blocks tensor to a size-three block plus a size-one block (weights
  `−2, 0, 2` and `0`).
- `dual_two_block`: the dual of a size-two block has weights `−1, 1` for the operator `−Nᵗ`.
- For `N(e₁)=e₀` and geometric Frobenius `diag(a,qa)`, `NF=qFN`; if `q≠1`, the nonzero coordinate lowering map is not Galois-equivariant as an untwisted endomorphism.
- On `ℤ/4`, `N=2 id` has `M₋₁=M₀=2X`, `M₁=X`; `2N=0` has `M₋₁=0`, `M₀=X`. A nonunit scalar need not preserve the filtration.

### 1.5 The relative monodromy filtration

**Theorem (uniqueness).** Let `W` be a finite increasing filtration of `X` and `N` a nilpotent
endomorphism preserving `W`. At most one finite increasing filtration `M` satisfies `N M_i ⊂ M_{i−2}` and
`N^r : gr^M_{w+r} gr^W_w X ≅ gr^M_{w−r} gr^W_w X` for all `w` and `r ≥ 0` (with twist `−r` for twisted `N`);
call it the relative monodromy filtration `VanishingCycles.relativeMonodromyFiltration`. It is unchanged
by replacing `N` by `aN` in an `R`-linear abelian category for an invertible scalar `a`;
over a field it suffices that `a ≠ 0`. Existence is not asserted; it is a hypothesis wherever used.

*Proof sketch.* Induct on the length of `W`, using the three identities that determine `M` from `W`'s last
graded quotient and the previous subobject, and the uniqueness of 1.3 on each `gr^W_w`. (Weil II,
1.6.13–1.6.14, pp. 168–170.) *Needs:* 1.3.

**Checks.**

- For W pure of weight w the relative filtration is the ordinary filtration centered at w.
- For `N(e₁)=e₀`, `W_0=ℚe₀` and `W_1=ℚ²`, no relative `M` exists: the prescribed graded centers force `N M_1⊂M_−1=0`, contradicting `N≠0`.
- For the same `N` with `W_0=W_1=ℚe₀` and `W_2=ℚ²` (graded pieces in weights 0 and 2), the relative filtration exists and is `W` itself:
  `M_−1=0`, `M_0=M_1=ℚe₀`, `M_2=ℚ²`, and `N M_2=ℚe₀⊂M_0`. Existence depends on the gap between the weights, which a definition
  ignoring W would not see.

### 1.6 Maximal unipotence

On a nonzero finite-dimensional vector space `V` of dimension `n` over a field `K` (of any characteristic),
`T ∈ GL(V)` is **maximally unipotent** when its minimal polynomial is `(X − 1)^n`, and a nilpotent `N` is
**maximally nilpotent** when its minimal polynomial is `X^n`, that is `N^n = 0` and `N^{n−1} ≠ 0`. For `T`
unipotent (Tau Ceti's `LinearMap.GeneralLinearGroup.IsUnipotent`) these are equivalent, in every characteristic, to
`T − 1` being a single Jordan block and to `dim ker (T − 1)^j = min(j, n)`, and, when `K` has characteristic zero, to
`log T` being maximally nilpotent. The zero space is excluded from the definition: it is not a Jordan block of size
zero. Define `VanishingCycles.IsMaximallyNilpotent` and `VanishingCycles.IsMaximallyUnipotent`.

- `VanishingCycles.IsMaximallyNilpotent`: For `dim V=n>0`, `N^n=0` and `N^(n−1)≠0`.
- `VanishingCycles.IsMaximallyUnipotent`: `T` is unipotent and `T−1` is maximally nilpotent; equivalent to `minpoly T=(X−1)^n`.
- `VanishingCycles.maximalLog_iff`: In characteristic zero, maximal unipotence of `T` is equivalent to maximal nilpotence of `log T`.
- `VanishingCycles.maximalNilpotent_kernel_rank`: `dim ker N^j=min(j,n)`.
- `VanishingCycles.maximalNilpotent_conj`: Maximal nilpotence is invariant under conjugation by a linear equivalence.

*Proof sketch.* `log(1 + U) = U · u(U)` with `u` a polynomial with constant term one, so `U` and `log(1 + U)`
have the same kernels of powers; Jordan decomposition identifies minimal polynomial and kernel
dimensions. (Qian 2023, published Definition 3.6, PDF p. 21.) *Needs:* Tau Ceti
`LinearMap.GeneralLinearGroup.IsUnipotent`; ArithmeticGaloisRepresentations Layer 2, §2.4 (logarithm);
1.4 (Jordan blocks as `N`-strings).

**Checks.**

- `VanishingCycles.maximal_three_block`: The size-three Jordan block is maximally nilpotent.
- `VanishingCycles.maximal_not_two_plus_one`: A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent.
- `VanishingCycles.maximal_one_dimension`: The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent.
- `maximal_unipotent_three_block`: `1+J₃` on `ℚ³` is maximally unipotent.
- `maximal_unipotent_not_two_plus_one`: `1+(J₂⊕0)` on `ℚ³` is not maximally unipotent.
- `maximal_unipotent_identity_two`: the identity on `ℚ²` is not maximally unipotent.
- `VanishingCycles.maximal_zero_dimension_excluded`: The zero-dimensional vector space does not satisfy the nonzero-dimension definition.

### 1.7 Canonical and variation maps

For the geometric triangle of 0.5, write `can : RΨK → RΦK` for the second map of the specialization
triangle (the quotient `q` of 0.4); here `RΨK` abbreviates its generic part `RΨ_η(K_η)`.
The map `can` retains Galois descent. For `σ ∈ I`, the elementwise variation is
`Var(σ) : U(RΦK) → U(RΨK)`, with
`Var(σ) ∘ U(can) = σ − 1` and `U(can) ∘ Var(σ) = σ − 1` in the underlying derived category.
With rational ℓ-adic coefficients on the unipotent part, choose `σ` in a common unipotent open
subgroup with `t_ℓ(σ) ≠ 0`. Choose a basis of `ℚ_ℓ(1)` and write `t_ℓ(σ) = a_σ` in that basis.
Set `T_Φ = σ` on `U(RΦK)` and `P(T_Φ) = log(T_Φ)/(T_Φ − 1)`, the finite polynomial in
`T_Φ − 1` with constant coefficient one. The normalized underlying map is

```text
v = a_σ⁻¹ Var(σ) ∘ P(T_Φ) : U(RΦK) → U(RΨK).
```

It is independent of every such `σ`. Its conjugation law is
`c_{RΨK}(g) ∘ g^*v ∘ c_{RΦK}(g)⁻¹ = χ_ℓ(g) v` for all `g ∈ G`. Restoring the twist gives
`var : RΦK → RΨK(−1)` in the Galois-equivariant generic-part derived category:
`c_{RΨK(−1)}(g) ∘ g^*U(var) ∘ c_{RΦK}(g)⁻¹ = U(var)`.
This twisted map is independent of the chosen basis, natural in `K`, and satisfies
`var ∘ can = N` and `can(−1) ∘ var = N_Φ` in that category, with the twisted Galois-equivariant
monodromy operators on the nearby and vanishing objects. The finite logarithm is taken only after
unipotence is proved (1.1).

*Proof sketch.* Apply the polynomial to the underlying composition identities of 0.4. The
variation multiplication rule on the unipotent part makes `Var(σ) P(T_Φ)` additive in the tame
parameter, yielding independence of `σ` after division. Transport this construction using the
family covariance of 0.4 and `t_ℓ(gσg⁻¹) = χ_ℓ(g)t_ℓ(σ)`; the resulting factor `χ_ℓ(g)` is canceled
by the action on the target twist. Carrying this descent through the construction gives the
equivariant maps and their composition identities, as for `N` in 1.2. (SGA 7 II, Exposé XIII,
(1.4.3.2)–(1.4.3.4), p. 17; Illusie 1994, 1.5, pp. 12–13.)
*Needs:* 0.2, 0.4, 0.8, 1.2; EtaleCohomologyFoundations §F.3a (`tameCharacter_conj`).

**Checks.**

- When `U(can) ∘ Var(σ) = 0` (as at an ordinary quadratic point in odd relative dimension, where the forget-supports
  map vanishes, 2.3), `T_Φ = 1`, the polynomial factor is one, and the underlying normalized map is
  `v = a_σ⁻¹ Var(σ)`.
- In that situation, with local equation `Q = b` for a uniformizer `b`, `Var(σ) = (−1)^{m+1} t_ℓ(σ)(·, δ)δ` (2.7), so `var = (−1)^{m+1}(·, δ)δ` for every `σ` with
  `t_ℓ(σ) ≠ 0`; omitting the division by `t_ℓ(σ)` would make `var` depend on `σ`.
- For a nonseparating node `N≠0` but `Var(1)=0` and `t_ℓ(1)=0`; the identity element cannot define normalized variation.
- Over `𝔽_q`, conjugating by geometric Frobenius multiplies the untwisted normalized map `v` by `q⁻¹`; the target twist multiplies by `q`, so `var` is equivariant and its nearby-cycle composite satisfies `NF = qFN` as in 1.2.

### 1.8 Tame restriction along a normal crossings divisor

**Theorem (purity of branch locus).** Deduce `VanishingCycles.purityOfBranchLocus`
from PurityOfBranchLocus §2.1 (Stacks 0BMB):
for `f:X→Y` between locally noetherian schemes, `x∈X`, `y=f(x)`, assume `O_{X,x}` normal,
`O_{Y,y}` regular, `f` quasi-finite at `x`, equal local dimensions at least one, and
unramifiedness at every codimension-one generalization of `x`. Then `f` is étale at `x`.
The global corollary applies to a finite dominant generically étale morphism from a
normal integral locally noetherian scheme to a regular integral locally noetherian
scheme, unramified at every codimension-one point of the source; it is étale everywhere.
For the normal-crossings application, use CrystallineCohomology §CR.5:log-algebra.4,
*The classical Abhyankar lemma*: on a regular strictly local scheme of residue characteristic
`p ≥ 0` with strict normal crossings boundary, a finite étale cover of the complement tame
along the boundary becomes étale over a root chart after normalized pullback by a
prime-to-`p` Kummer cover. Use its supplied compatible Kummer tower, with transition
`T_a ↦ T_a^{n_a/m_a}` for `m_a ∣ n_a`, and universal tame pro-cover. With `r` boundary
branches its full tame fundamental group is `∏_{ℓ≠p} ℤ_ℓ(1)^r`; in particular its maximal
pro-ℓ quotient is `ℤ_ℓ(1)^r`, for ℓ invertible there. (Stacks 0BMB; SGA 1 XIII, Appendice I,
Propositions 5.1–5.2 and Corollary 5.3, pp. 314–316.)
*Needs:* PurityOfBranchLocus §§2.1–2.2 (branch purity and its global corollary);
AbhyankarLemma §§3.3–3.4 (regular-divisor local structure and normalization, Stacks 0EYG/0EYH);
CrystallineCohomology §CR.5:log-algebra.4, *The classical Abhyankar lemma* (SNC Abhyankar,
compatible Kummer tower and universal tame pro-cover with its full tame fundamental group);
SchemeAndStackFoundations §§0.8, 0.21 (regularity, normalization and quasi-finite maps);
EtaleCohomologyFoundations §F.0 (Kummer theory).

**Checks.**

- A finite étale cover satisfies the criterion at every point of positive local dimension.
- For `x=u^e`, `y=v^f` with `e,f` prime to the residue characteristic, the coordinate
  crossing has two independent tame Kummer factors, giving `ℤ_ℓ(1)^2`.
- `V(xy)⊂𝔸²` is not a regular divisor at the origin; the single-regular-divisor statement
  of Stacks 0EYG does not give this crossing case.
- For `x=u^p` in characteristic `p`, ramification in codimension one violates the criterion.
- For `k=𝔽_p(t)` and `L=k(u)` with `u^p=t`, `Spec L→Spec k` has no codimension-one
  points but is not étale: `Ω_{L/k}=L·du`. It fails generic étaleness and the positive
  local-dimension hypothesis of the pointwise theorem.

**Theorem.** Let `X` be regular locally noetherian, `D = ∪_a D_a` a strict normal crossings divisor, and `F` a lisse
`ℚ_ℓ`-sheaf on `X − D` whose local monodromy along each `D_a` is tame and unipotent after a specified
Kummer cover. Then the tame unipotent local inertia defines commuting twisted residues `N_a` on the
tame restriction of `F` to each stratum `D_J = ∩_{a∈J} D_a`. The restriction is built from a compatible
system of Kummer covers `t_a^{1/n}` in fixed local equations `t_a` of the `D_a`, and does not depend on the
cofinal system chosen; the intrinsic version replaces the local equations by the torsor of the normal
bundle. Relative monodromy filtrations along a stratum are unique when they exist (1.5); their
existence under mixedness hypotheses is a statement about weights and is not part of this theorem.

*Proof sketch.* Apply the SNC Abhyankar theorem and compatible Kummer tower supplied by
CrystallineCohomology §CR.5:log-algebra.4, *The classical Abhyankar lemma*, to construct the tame
restriction system of `F`; the maximal pro-ℓ quotient of tame local inertia at a strict normal crossings
point is `∏_a ℤ_ℓ(1)`, abelian, so the logarithms
`N_a` of the unipotent factors commute; uniqueness of relative filtrations is 1.5. (Weil II, 1.7.8–1.7.10,
pp. 172–174.) *Needs:* 1.2, 1.5; `VanishingCycles.purityOfBranchLocus`;
CrystallineCohomology §CR.5:log-algebra.4, *The classical Abhyankar lemma* (SNC Abhyankar,
compatible Kummer tower and tame fundamental group; SGA 1 XIII, Appendice I, Corollary 5.3).

**Checks.**

- On the coordinate divisor `xy = 0` the two residues commute.
- A wildly ramified local system is not assigned a tame Kummer restriction.
- For a constant local system on the coordinate crossing, both residues vanish and its tame restriction is constant.

### 1.9 The two-component semistable nearby complex

**Construction.** Let `X` be regular and strictly semistable over an excellent strictly henselian trait,
with special fibre `D_1 ∪ D_2`, the components smooth and meeting transversely in `C = D_1 ∩ D_2`, and let
`Λ` be finite with `ℓ` invertible, or rational ℓ-adic after realization. The filtered Rapoport–Zink
complex `VanishingCycles.twoComponentNearbyComplex` is a filtered complex on `D_1 ∪ D_2`, built from the
restriction and Gysin maps between `Λ_{D_1} ⊕ Λ_{D_2}` and `Λ_C` (Gysin maps from absolute purity 0.10),
whose total complex is quasi-isomorphic to `K = RΨΛ` (not to the inertia-cohomology cone
`L = RΓ(I, K)`), and whose graded objects are

```text
gr_1 = Λ_C[−1](−1),    gr_0 = Λ_{D_1} ⊕ Λ_{D_2},    gr_{−1} = Λ_C[−1],
```

all other grades zero. The operator `N : gr_1 → gr_{−1}(−1)` is the identity of `Λ_C[−1](−1)`, and `N² = 0`
in the filtered derived category. For rational coefficients inertia acts by `exp(t_ℓ N)`; with finite
coefficients, in this two-step case, `T − 1` is used directly without denominators. Inertia can act
trivially on the cohomology sheaves while `N` on the derived object is nonzero. Only this
two-component calculation belongs here; the general strictly semistable case is Layer LPV.7a.

The filtered derived category is built here. Define `VanishingCycles.FilteredDerived Y Λ` as the stable category of
finite increasing filtered objects of the enhanced derived category `D(Y, Λ)` of EtaleCohomologyFoundations §F.1:
diagrams `F : (ℤ, ≤) → D(Y, Λ)` (coherent diagrams, EtaleCohomologyFoundations §F.1) with `F_i = 0` for `i ≪ 0` and `F_i → F_{i+1}` an
isomorphism for `i ≫ 0`. Its functors are the total object `colim F` and the graded pieces
`gr_i F = cofib(F_{i−1} → F_i)`. Prove `VanishingCycles.FilteredDerived.isIso_of_isIso_gr`: a filtered morphism inducing
isomorphisms on every `gr_i` is an isomorphism, by induction on the length of the filtration through the cofibre
triangles. The Rapoport–Zink complex above is an object of `FilteredDerived (D_1 ∪ D_2) Λ`.

**Checks for `FilteredDerived`.** (Finite filtrations and cofibre triangles: Weil II §1.4;
Illusie 2021 §6.3.)

- A filtration `0 → X → X → …` has its sole nonzero grade `X` and total object `X`.
- On a point with `Λ=ℤ/ℓ²`, the filtration of `ℤ/ℓ²` by its submodule `ℓΛ` has two
  grades `ℤ/ℓ`; its connecting class in `Ext¹_Λ(ℤ/ℓ,ℤ/ℓ)` is nonzero, so the filtered
  object is not replaced by the split sum.
- For `X≠0`, take `F_i=0` for `i<0`, `F_0=X`, and `F_i=0` for `i≥1`. The grades are
  `X` and `X[1]`, the total object is zero, and the nonzero identity filtered map becomes zero
  under the total functor; the total functor is not faithful.

- `VanishingCycles.twoComponentNearbyComplex`: The filtered nearby complex on `D₁∪D₂`, with actual restriction/Gysin differentials.
- `VanishingCycles.twoComponentNearbyComplex_grades`: The three graded objects are `Λ_C[−1](−1)`, `Λ_D₁⊕Λ_D₂` and `Λ_C[−1]`.
- `VanishingCycles.twoComponentNearbyComplex_monodromy`: `N` on the outer grades is the identity after the Tate twist, and `N²=0`.
- `VanishingCycles.twoComponentNearbyComplex_resolves`: The corrected total complex is quasi-isomorphic to the geometric nearby complex `K`, not to `L=RΓ(I,K)`.

*Proof sketch.* Build the two-row restriction/Gysin double complex from the intersections, with
`1 − T` as the upper differential (Illusie's 1994 erratum corrects its sign); the corrected filtered
quasi-isomorphism with `K` gives the three nonzero grades; `N` is the identity shift of the double
complex and its square vanishes because there are only two components. Absolute purity (0.10) supplies
`Ri^!Λ` for the regular divisors over the trait. (Illusie 2021, §6.3, pp. 104–105, formulas (6.2)–(6.4);
Illusie 1994 errata.) *Needs:* 0.5, 0.10, 1.2; EtaleCohomologyFoundations §F.1 (the stable
enhancement, unbounded derived sheaves and coherent diagrams from which the filtered derived category is built);
EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.6 (Gysin sequence and cycle classes over the residue field); SchemeAndStackFoundations Layer 0, §0.21 (excellent schemes).

**Checks.**

- `VanishingCycles.twoComponent_node`: For `xy=π`, the degree-one nearby stalk is `Λ(−1)`.
- `VanishingCycles.twoComponent_disjoint`: If `C` is empty then `N=0` and only the center-zero grade remains.
- `VanishingCycles.twoComponent_not_sheaf_split`: For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived `N` map on the two outer grades is an isomorphism.
- `VanishingCycles.twoComponent_N_square`: The filtered two-component operator has `N²=0` and `gr₁N` equal to identity onto `gr_−1(−1)`.
- For `xy=π` the intersection term is a point, `R¹Ψ=Λ(−1)`, and the sheaf-level inertia action is trivial.
- With `C` empty all off-center grades vanish and `N=0`.
- A nonzero derived N in the nodal case prevents replacing the filtered complex by the direct sum of its cohomology sheaves.

### 1.10 The semisimple trace of Frobenius

Let `F` be an automorphism of a finite-dimensional vector space `V` over a field of characteristic zero,
and `ρ` an action of an inertia group `I` that is quasi-unipotent, with `F ρ(g) F⁻¹ = ρ(α(g))` for an
automorphism `α` of `I` (for nearby cycles, `F` a lift of geometric Frobenius). An **admissible
filtration** is a finite increasing filtration `0 = W_0 ⊂ … ⊂ W_r = V`, stable under `ρ` and `F`, such
that `I` acts through a finite quotient on each `W_{i+1}/W_i`. The degree-zero **semisimple trace** is
`Tr^{ss}(F, V) = Σ_i Tr(F | (W_{i+1}/W_i)^I)`; for a bounded complex with such actions on its cohomology
it is the alternating sum over cohomological degrees. Define
`VanishingCycles.AdmissibleInertiaFiltration` and `VanishingCycles.semisimpleTrace`.

**Theorem.** Admissible filtrations exist (for a quasi-unipotent action, the kernel filtration of the
logarithm on a unipotent open subgroup); the semisimple trace does not depend on the admissible
filtration or on the lift of Frobenius; it is additive in equivariant short exact sequences and, for
complexes, in equivariant distinguished triangles; and it changes sign under shift by one.

- `VanishingCycles.semisimpleTrace`: Alternating sum of Frobenius traces on the inertia invariants of finite-inertia graded cohomology.
- `VanishingCycles.semisimpleTrace_refinement`: The trace is unchanged under a finite common refinement.
- `VanishingCycles.semisimpleTrace_additive`: For an equivariant distinguished triangle, `trace B=trace A+trace C`.
- `VanishingCycles.semisimpleTrace_frobeniusLift`: Changing Frobenius by an inertia element leaves the semisimple trace unchanged.
- `VanishingCycles.AdmissibleInertiaFiltration`: Length, monotone submodules with endpoints `0,V`, actual action/`F` stability and finite inertia image on each grade.
- `VanishingCycles.filtrationRepresentation`: The inertia action induced by `ρ` on `W_(i+1)/W_i`.
- `VanishingCycles.filtrationRepresentation_mk`: Applying `g` to the class of `x` gives the class of `ρ(g)x`.
- `VanishingCycles.filtrationFrobenius`: The map induced by `F` on the same actual associated graded.
- `VanishingCycles.filtrationFrobenius_mk`: Applying graded Frobenius to the class of `x` gives the class of `Fx`.
- `VanishingCycles.semisimpleTrace_finiteImage`: When the original inertia image is finite, the admissible trace equals the ordinary trace on its invariants.
- `VanishingCycles.semisimpleTrace_shortExact`: The three actual representations in a short exact sequence have equivariant injection and surjection, range equals kernel, and intertwining `F`; their admissible degree-zero traces are additive.

*Proof sketch.* Two admissible filtrations have a common refinement whose subquotients are equivariant
subquotients of finite-inertia pieces, hence have finite inertia image; averaging over the finite
inertia quotient in characteristic zero makes invariants exact, so the trace is unchanged under
refinement. On graded inertia invariants, changing `F` by an inertia element acts trivially. Additivity
factors through the Grothendieck group, and the cohomology sequence of a triangle gives the complex
version. (Haines–Ngô 2002, §3.1, Lemma 8 and Corollary 9, pp. 126–127; Kisin–Pappas 2018, §4.7.1,
p. 212.) *Needs:* 1.1, 1.2; 0.8 (the nearby-cycle stalks it is applied to); EtaleCohomologyFoundations §§F.1–F.2.

**Checks.**

- `VanishingCycles.semisimpleTrace_trivial`: For `a` degree-zero trivial inertia line with Frobenius `a`, the semisimple trace is `a`.
- `VanishingCycles.semisimpleTrace_unipotent_block`: For `ρ(g)(x, y) = (x + gy, y)` on `ℚ²`, `g ∈ ℤ`, and `F` the identity (the specialization `q = 1`), the two-step admissible filtration gives semisimple trace two, while the trace on invariants is one.
- `VanishingCycles.semisimpleTrace_quadratic`: For a nontrivial quadratic finite inertia line, the semisimple trace is 0.
- `VanishingCycles.semisimpleTrace_shift`: Shifting a complex by one negates its semisimple trace.
- A trivial one-dimensional inertia module gives its ordinary Frobenius trace.
- For a nontrivial two-dimensional unipotent inertia block with compatible Frobenius eigenvalues a and qa on the two finite-inertia grades, the semisimple trace is a+qa; the trace on inertia invariants is just the eigenvalue on ker N. The Frobenius normalization fixes the direction of q-rescaling.
- A finite quadratic character has invariant trace zero.

### Examples

- Two-block monodromy: `ρ(σ) = [[1, t_ℓ(σ)], [0, 1]]`, `N(e_1) = e_0`, `M_{−1} = M_0 = ℚ_ℓ e_0`, `M_1 = V`
  (centre 0); with Frobenius eigenvalues `a` on `e_0` and `qa` on the quotient the semisimple trace is
  `a + qa`, while the trace on inertia invariants is `a`.
- The node `xy = π` (1.9): `R^1Ψ Λ = Λ_C(−1)` with trivial sheaf-level inertia action, yet the derived `N`
  is an isomorphism between the outer grades.

### Dependencies

Layer LPV.0; ArithmeticGaloisRepresentations Layer 2 (§2.4 logarithm and Grothendieck's monodromy
theorem for local fields; §2.6 the vector-space monodromy filtration with its tensor and dual rules);
`VanishingCycles.geometricMonodromy_traitDescent` (1.1);
`VanishingCycles.purityOfBranchLocus` (1.8); InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3; EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.6; EtaleCohomologyFoundations §F.1;
EtaleCohomologyFoundations §F.0 (Tate twists); Stacks Project 0BMB; SGA 1 XIII 5.3;
TauCetiRoadmap RepresentationTheory/LieHighestWeight Layer 0; Mathlib (`IsSl2Triple`, abelian categories);
Tau Ceti (`LinearMap.GeneralLinearGroup.IsUnipotent`).

## Layer LPV.2: Ordinary quadratic singularities and the Picard–Lefschetz formula

This layer is the local theory of a Lefschetz degeneration. It defines ordinary quadratic forms over
any base, including characteristic two, their quadrics and the discriminant double cover given by the
even Clifford algebra; computes the ℓ-adic cohomology of smooth and affine quadrics with their
distinguished generators; defines ordinary quadratic points and proves their henselian canonical form
and the local equation of a family; and computes nearby cycles, vanishing cycles and the variation at
an ordinary quadratic point. The layer ends with the Picard–Lefschetz formula for a proper family with
one ordinary quadratic singular point, the description of its direct images and the comparison of
signs with the complex case. Quadratic forms and the even Clifford algebra are Mathlib's
(`QuadraticMap`, `QuadraticMap.polarBilin`, `QuadraticMap.Nondegenerate`, `CliffordAlgebra.even`).

### 2.1 Ordinary quadratic forms and their normal form

**Definition.** Let `S = Spec A`, `V` a locally free `A`-module of positive rank `r`, and `Q` a quadratic
form on `V` with polar form `Φ(x, y) = Q(x + y) − Q(x) − Q(y)`. `Q` is *nowhere zero* if its values generate
the unit ideal; then `Q = 0` defines a closed subscheme of `P(V^*)` (projective bundle in the convention
of AlgebraicModuliForArithmeticGeometry Layer 1, §1.1), flat of pure relative dimension `r − 2`, the
*quadric* of `Q`. `Q` is **ordinary** if it is nowhere zero and its quadric is smooth over `S`; this can be
checked on the fibres at the points of `S`. Over a field: if `r` is even or the characteristic is not
two, `Q` is ordinary if and only if `Φ` is nondegenerate; if `r` is odd and the characteristic is two, `Q`
is ordinary if and only if the kernel of the alternating form `Φ` is a line on which `Q` does not vanish.
Over a field and for `V ≠ 0` this is Mathlib's `QuadraticMap.Nondegenerate` (radical zero and polar kernel
of rank at most one). The case `r = 0` is excluded, and no invertibility of two is assumed. Define
`Quadric.IsOrdinary`. In geometric prose, **polar-nondegenerate** means that the polar pairing
is perfect; over a field this means that its kernel is zero. Ordinarity allows a one-dimensional
polar kernel in odd rank in characteristic two.

- `Quadric.IsOrdinary`: `IsOrdinary Q : Prop` — `Q` nowhere zero with smooth quadric.
- `Quadric.IsOrdinary.baseChange`: Ordinary is stable under base change and can be checked on the fibres at points of `S`.
- `Quadric.isOrdinary_iff_polar_nondegenerate`: Over a field with `r` even or `2 ≠ 0`: `IsOrdinary Q ↔ (polarBilin Q).Nondegenerate`.
- `Quadric.isOrdinary_iff_of_char_two`: Over a field of characteristic 2 with `r` odd: `IsOrdinary Q ↔ finrank (ker Φ) = 1 ∧ Q ≠ 0` on `ker Φ`.
- `Quadric.isOrdinary_iff_nondegenerate`: Over a field with `V ≠ 0`: `IsOrdinary Q ↔ QuadraticMap.Nondegenerate Q`.

*Proof sketch.* Apply the Jacobian criterion after passing to an algebraic closure: the projective quadric
is singular at a geometric point `v ≠ 0` exactly when `Q(v) = 0` and `Φ(v, ·) = 0`. Smoothness and the rank
conditions descend to the base field; testing only rational vectors over an imperfect field would not
suffice. If two is invertible then `Q(v) = Φ(v, v)/2` and the condition is nondegeneracy of `Φ`. In
characteristic two `Φ` is alternating and its kernel has the parity of `r`. Scalar extension of `Q` is
defined coefficientwise in a local basis (Mathlib's quadratic base change needs two invertible). (SGA 7
II, Exposé XII, 1.1 and 1.1 a)–b), p. 2; the source writes `card(A) = 2` where characteristic two is
meant.) *Needs:* Mathlib `QuadraticMap.Nondegenerate`, `QuadraticMap.polarBilin`;
AlgebraicModuliForArithmeticGeometry Layer 1, §1.1 (projective bundles); SchemeAndStackFoundations Layer
0 (§0.8 smoothness, §§0.12–0.14 henselization); Mathlib's Jacobian criterion (`Algebra.IsStandardSmooth`,
`Algebra.IsSmoothAt.exists_notMem_isStandardSmooth`).

**Checks.**

- Characteristic 2, `r = 3`, `Q = xy + z²`: `ker Φ = k·e_z` and `Q(e_z) = 1`, so `Q` is ordinary (the conic `xy = z²` is smooth).
- Characteristic 2, `r = 2`, `Q = x² + y² = (x + y)²`: `Φ = 0` and the quadric is a double point, so `Q` is not ordinary.
- `Quadric.isOrdinary_rank_one`: `r = 1`, `Q = ax²` with `a` `a` unit: the quadric is empty and `Q` is ordinary in every characteristic.
- `Quadric.isOrdinary_iff_nondegenerate_test`: Over a field and for `V ≠ 0`, `IsOrdinary Q` agrees with Mathlib's `QuadraticMap.Nondegenerate Q`: in characteristic 2 the alternating `Φ` has kernel of dimension `≡ r mod 2`, so `rank ≤ 1` forces 0 or 1 according to the parity of `r`.
- `Quadric.isOrdinary_zero_rank_excluded`: The zero form on the zero module is not ordinary: rank zero is excluded explicitly.
- Over a field `K` of characteristic 2 and `a ∈ K` not a square (for example `t` in `𝔽₂(t)`), `Q = x² + a y²` on `K²` has zero radical, since its only rational zero is `0`, but `Φ = 0`, so `ker Φ = K²` has rank two and `Q` is not ordinary: over `K̄` its quadric is the double point `(x + √a y)² = 0`. Zero radical alone does not give ordinarity; the rank bound on `ker Φ` is needed.
- `xy + z²` in characteristic 2 is ordinary; `x² + y²` in characteristic 2 is not; `ax²` is ordinary.

**Theorem (normal form).** Let `Q` be an ordinary quadratic form on a locally free `A`-module of rank
`r = 2m` (resp. `2m + 1`). Étale locally on `Spec A` there is a basis `e_1, …, e_r` with
`Q(Σ x_i e_i) = Σ_{i=1}^{m} x_i x_{i+m}` (resp. `Σ_{i=1}^{m} x_i x_{i+m} + λ x_{2m+1}²` with `λ` invertible). The
source prints the upper limit of the sum as `m − 1`; the sum runs to `m`. *Proof sketch.* Induct on `m`;
`m = 0` is `Q = λx²` with `λ` a unit. For `m > 0` the quadric is smooth with nonempty geometric fibres, so
étale locally it has a section, a nowhere-zero `e` with `Q(e) = 0`; smoothness at `[e]` gives `f'` with
`Φ(e, f') = 1`, and `f = −Q(f')e + f'` makes `Ae + Af` hyperbolic; its orthogonal is ordinary of rank `r − 2`.
(SGA 7 II, Exposé XII, Proposition 1.2 and its proof, pp. 2–3.) *Needs:* the definition above;
SchemeAndStackFoundations Layer 0, §0.8 (étale-local sections of smooth morphisms).

**Checks.**

- `r = 2`: `Q = x₁x₂`; `r = 3`: `Q = x₁x₂ + λx₃²`, which over a separably closed field of characteristic not 2 is equivalent to `x² + y² + z²`.
- In rank one, `λx²` remains the odd normal form, including characteristic two.
- In rank four, `x₁x₃+x₂x₄` is the split even form with two hyperbolic planes.

### 2.2 The even Clifford centre and the discriminant cover

**Construction.** Let `Q` satisfy `Quadric.IsOrdinary` of 2.1 on `V` locally free of rank
`2m > 0` over `A`: its geometric fibres are ordinary. In even rank this is equivalent
to the polar map `V → V*` being an isomorphism. The ring-level predicate
`QuadraticMap.Nondegenerate` alone is insufficient. The centre
`Z(Q)` of the even Clifford algebra `C⁺(Q) = CliffordAlgebra.even Q` is a finite étale `A`-algebra of rank
two, and `C⁺(Q)` is an Azumaya algebra over `Z(Q)`; `C⁺(Q)` depends only on the quadric `Q = 0`. A totally
isotropic direct summand `W` of rank `m` defines an idempotent `e(W) ∈ Z(Q)`, and over a field
`e(W_1) = e(W_2)` exactly when `dim(W_1/(W_1 ∩ W_2))` is even. For a smooth quadric `X/S` of dimension
`n = 2m > 0` this gives the étale double cover `Z(X) → S` (`Z(X) = X` for `n = 0`), and the generatrices
(linear subspaces of dimension `m` of `P(X)` contained in `X`) form a smooth projective `S`-scheme
`Gén(X)` whose Stein factorization is `Gén(X) → Z(X)`. For rank two in characteristic not two, `Z(Q)` is
the discriminant algebra. The centre is Mathlib's `Subalgebra.center A (CliffordAlgebra.even Q)` and gets no
separate name; over a field in which two is invertible it is Tau Ceti's `K[X]/(X² − d)`
(`CliffordAlgebra.adjoinRootEquivCenterEven`, with `d` the signed discriminant). Define
`Quadric.lagrangianIdempotent` and `Quadric.discriminantCover`, and prove:

- `Quadric.center_even_isEtale`: For `Q` satisfying `IsOrdinary` in positive even rank, `Z(Q)` is finite étale of rank 2 over `A`, and `C⁺(Q)` is Azumaya over `Z(Q)`.
- `Quadric.lagrangianIdempotent`: `e(W) ∈ Z(Q)` for `W` totally isotropic of rank `m`.
- `Quadric.lagrangianIdempotent_eq_iff`: Over a field, `e(W₁) = e(W₂) ↔ Even (finrank (W₁ ⧸ W₁ ⊓ W₂))`.
- `Quadric.discriminantCover`: `Z(X) → S` for a smooth quadric of even dimension, with `e : Gén(X) → Z(X)` the Stein factorisation.

*Proof sketch.* Étale locally `Q` is split; for `V = W_1 ⊕ W_2` with both summands totally isotropic,
`C(Q) ≅ End(ΛW_1)` as graded algebras, so `C⁺(Q) ≅ End(ΛW_1)⁺ × End(ΛW_1)⁻` has centre `A × A`; descent
gives the étale rank-two centre and the Azumaya property. The idempotent `e(W_1, W_2)` depends only on
`W_1` by connectedness of the affine space of complements. The parity criterion reduces by the addition
formula `e(W_1 ⊕ W_2) = e(W_1)e(W_2) + (1 − e(W_1))(1 − e(W_2))` to dimension two. For a smooth quadric,
`C⁺` of the ambient form descends; generatrices disjoint from a given one form an affine space, so
`Gén(X)` is smooth, and its geometric fibres over `Z(X)` are connected by reduction to `P¹ × P¹`. (SGA 7
II, Exposé XII, Proposition 1.5, p. 5; Proposition 1.12, p. 8; Proposition 2.8, p. 13.) *Needs:* 2.1;
Mathlib `CliffordAlgebra.even`, `Subalgebra.center`; Tau Ceti `CliffordAlgebra.adjoinRootEquivCenterEven` (the field
case with two invertible); SchemeAndStackFoundations Layers 0 (§0.8, étale localization) and 1 (§1.1, descent of
quasi-coherent modules). *Lean:* `Suggested.lean` states this algebraic theorem as
`evenClifford_center_etale_azumaya` for finite projective modules over any commutative base ring,
with positive even rank at every prime and a bijective polar map. Its conclusions are finiteness,
étaleness, local rank two for the centre and the Azumaya property over the centre, including characteristic two.

**Checks.**

- Over `ℤ`, `Q=x²+y²` has injective polar map `2I`, hence satisfies the native
  QuadraticMap.Nondegenerate, but its reduction at 2 is not ordinary. Its even Clifford
  centre `ℤ[t]/(t²+1)` has fibre `𝔽₂[t]/((t+1)²)`, so is not étale at 2 and is excluded.
- `Quadric.center_even_hyperbolic`: `V = Ae ⊕ Af` with `Q(xe + yf) = xy`: `C⁺(Q) = Z(Q) ≅ A × A`, and the isotropic lines `Ae` and `Af` give the two idempotents `fe` and `ef = 1 − fe` (XII 1.12, proof).
- `Quadric.center_even_discriminant`: Over a field of characteristic not 2, `Q = x² − dy²` with `d ≠ 0`: `C⁺(Q) = k ⊕ k·e₁e₂` with `(e₁e₂)² = d`, so `Z(Q) ≅ k[t]/(t² − d)`, split if and only if `d` is a square; this agrees with Tau Ceti's `CliffordAlgebra.adjoinRootEquivCenterEven` for the orthogonal basis `(e₁, e₂)`, whose signed discriminant is `(−1)·1·(−d) = d`.
- `Quadric.center_even_char_two`: Over `a` field of characteristic 2, `Q = x² + xy + ay²` on `k²`: with `u = e₁e₂` one has `u² = u − Q(e₁)Q(e₂)`, so `Z(Q) = C⁺(Q) = k[u]/(u² + u + a)`, the Artin–Schreier algebra of the Arf invariant `a`, étale for every `a` and split exactly when `a = t² + t` for some `t ∈ k`. No algebra of the shape `k[X]/(X² − d)` is étale in characteristic 2 (`X² − d = (X − √d)²` over `k̄`), so the characteristic-not-two description does not extend.
- `Quadric.lagrangianIdempotent_sum`: For an orthogonal sum, `e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂))` (XII 1.10.1): the sections add as `ℤ/2`-torsors, not as idempotents.
- `n = 2`: `X ≅ P¹ × P¹`, `Gén(X)` is two copies of `P¹` (the two rulings) and `Z(X)` is two points.
- `n = 0`: `Z(X) = X`, a double cover.

### 2.3 Smooth quadrics, their cohomology and affine quadrics

**Definition.** Over an algebraically closed field a smooth quadric of dimension `n` is a scheme
isomorphic to the quadric of an ordinary form on a space of dimension `n + 2`. Over a scheme `S` it is a
proper smooth `S`-scheme whose geometric fibres are smooth quadrics; for `n = 0` it is an étale double
cover, for `n = 1` a Severi–Brauer scheme of relative dimension one, and for `n = 2` its geometric fibres
are `P¹ × P¹`. Étale locally on `S` it is the quadric of an ordinary form; for `n > 0` its ambient
Severi–Brauer scheme `P(X)` depends only on `X/S`. Over an algebraically closed field,
`ω_X ≅ O_X(−n)`; over `S`, the relative Picard class is `−n` times the hyperplane class,
which need not be represented by a global `O(1)`. Define
`Quadric.IsSmoothQuadric`.

- `Quadric.IsSmoothQuadric`: `IsSmoothQuadric (f : X ⟶ S) (n : ℕ) : Prop` — proper, smooth, geometric fibres smooth quadrics of dimension `n`.
- `Quadric.isSmoothQuadric_of_isOrdinary`: The quadric of an ordinary form of rank `n + 2` is a smooth quadric of dimension `n`.
- `Quadric.ambientProjective`: For a smooth quadric `X/S` of relative dimension `n>0`, the canonical ambient Severi–Brauer `S`-scheme `P(X)` with `X` a relative divisor of degree 2.
- `Quadric.isSmoothQuadric_zero_iff`: A smooth quadric of dimension 0 is the same as an étale double cover.
- `Quadric.canonical_iso`: Over an algebraically closed field, `ω_X ≅ O_X(−n)` for the hyperplane bundle of a smooth `n`-dimensional quadric.

*Proof sketch.* Over an algebraically closed field compute `Ω^n ≅ O(−n)`, `Pic` and the vanishing of
`H^i(O)` and `H^1(O(1))`. Use `relativePicardSheaf` and
`RelativePicard.baseLineBundle` over general bases; prove here that the quadric family has
étale-locally constant `Pic_{X/S}` (SGA 7 XII 2.4–2.6), so étale locally for `n > 0` there
is a positive hyperplane bundle `L` with `p_*L` locally free of rank `n + 2` and `X ⊂ P(p_*L)` the quadric
of an ordinary form, unique up to a unit; `P(p_*L)` does not depend on `L` and descends to `P(X)`. (SGA 7
II, Exposé XII, 2.1, p. 9; Définition 2.4 and 2.4–2.6, pp. 10–12.) *Needs:* 2.1;
AlgebraicModuliForArithmeticGeometry §1.1 and §7.6.1 (`relativePicardSheaf`,
`RelativePicard.baseLineBundle`); SchemeAndStackFoundations Layer 0.

**Checks.**

- `Quadric.smoothQuadric_dim_zero`: `n = 0` over an algebraically closed field: `X ≅ Spec k ⊔ Spec k`.
- `Quadric.smoothQuadric_dim_two`: `n = 2`: `xy = zw` in `P³` is `P¹ × P¹` (Segre).
- `Quadric.smoothQuadric_real_conic`: `n = 1` over `ℝ`: `x² + y² + z² = 0` is a smooth conic without real points, a nontrivial Severi–Brauer curve.
- For `X=Q×ℙ¹` and the hyperplane bundle `L=O_Q(1)⊠O(1)`, `ω_{X/ℙ¹}=O_Q(−n)⊠O`, whereas `L^(−n)=O_Q(−n)⊠O(−n)`; only their relative Picard classes agree.
- `Quadric.not_smoothQuadric_cone`: The cone `xy = z²` in `P³` (a form of rank 3 in 4 variables) is singular at `(0:0:0:1)`; the form is not ordinary.

**Theorem (cohomology of smooth quadrics).** Let `p : X → S` be a smooth quadric of dimension `n` and `ℓ`
invertible on `S`, with hyperplane class `η ∈ H⁰(S, R²p_*ℤ_ℓ(1))`.

1. `R^{2i+1} p_* ℤ_ℓ = 0`.
2. For `0 ≤ 2i < n` (resp. `n < 2i ≤ 2n`), `R^{2i} p_* ℤ_ℓ(i)` is canonically the constant sheaf `ℤ_ℓ`,
   generated by `η^i` (resp. by the class `η^i/2`, an integral class `c` with `2c = η^i`).
3. For `n = 2m` the cycle-class map `cl : ℤ_ℓ^{Z(X)} → R^n p_* ℤ_ℓ(m)` of the two families of generatrices
   is an isomorphism, and for the two sections `α, β` of `Z(X)`: `η^m = cl(α) + cl(β)`; for `m` even,
   `Tr(cl(α)²) = Tr(cl(β)²) = 1` and `cl(α)cl(β) = 0`, while for `m` odd, `cl(α)² = cl(β)² = 0` and
   `Tr(cl(α)cl(β)) = 1`; and `η · (cl(α) − cl(β)) = 0`.
4. Over `𝔽_q`, `#X(𝔽_q) = Σ_{i=0}^{n} q^i` for `n` odd, and `Σ_{i=0}^{n} q^i + ε q^m` for `n = 2m`, with `ε = 1`
   if `X` has a rational generatrix and `ε = −1` otherwise.

The source writes `η ∈ H⁰(S, R¹p_*ℤ_ℓ(1))`; the hyperplane class lives in degree two.

*Proof sketch.* Items 1–2 are the cohomology of smooth complete intersections (weak Lefschetz and
Poincaré duality), with `η^i/2` above the middle because a hyperplane section of a quadric has degree
two. Item 3 is étale local: for `Σ_{i=0}^{m} x_i x_{i+m+1} = 0` in `P^{2m+1}`, `η^m` is the class of a linear
section that is the union of two generatrices from different families; disjoint generatrices have
product zero and generatrices meeting transversally in one point have trace one, and the parity
criterion of 2.2 decides which families they lie in; `cl` is an isomorphism because the Gram matrices
`[[1,0],[0,1]]` and `[[0,1],[1,0]]` are unimodular. Item 4 is the Grothendieck–Lefschetz trace formula,
Frobenius swapping `α` and `β` exactly when there is no rational generatrix. (SGA 7 II, Exposé XII,
Théorème 3.3, pp. 14–15; Vérification 3.4, p. 17.) *Needs:* 2.2, the definition above;
EtaleCohomologyFoundations §F.6 (Poincaré duality and the trace), EtaleCohomologyFoundations §F.6 (Gysin sequence,
cycle classes) and EtaleCohomologyFoundations §F.7 (weak Lefschetz, cohomology of projective space); InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4 (point counting).

**Checks.**

- `n = 2`, `X = P¹ × P¹`: the two rulings have square 0 and product 1 (`m = 1` odd); `#X(𝔽_q) = (1 + q)²` when split and `1 + q²` for the nonsplit form (Weil restriction of `P¹` from `𝔽_{q²}`).
- `n = 0`: two points, `Tr(cl(α)²) = 1` (`m = 0` even), `#X(𝔽_q) = 1 + ε ∈ {0, 2}`.
- For a smooth conic, the only groups are `H⁰=ℤ_ℓ` and `H²(1)=ℤ_ℓ`; its hyperplane class is twice the top generator, including at `ℓ=2`.

**Theorem (affine quadrics and the vanishing class).** Let `X` be the smooth quadric over `S` of an
ordinary form on `V` of rank `n + 2`, `H` a hyperplane meeting `X` transversally, `Y = X ∩ H` (a smooth
quadric of dimension `n − 1` for `n > 0`, and empty for `n = 0`), `X° = X − Y`, `f : X° → S`, and `q : Y → S`. For `n = 2m` the primitive part of
`R^n p_*ℤ_ℓ(m)` is the orthogonal of `η^m`, generated by `cl(α) − cl(β)`, and the primitive quotient is
`R^n p_*ℤ_ℓ(m)/ℤ_ℓ η^m`. The cohomology of `X°` is torsion-free; for `n > 0` its nonzero Betti numbers are `b_0 = b_n = 1`,
and with compact supports `b_{2n} = b_n = 1`; for `n = 0` both theories have `b_0 = 2` and nothing
else. For `n = 2m > 0`, `R^n f_!ℤ_ℓ(m)` is the
primitive part and `R^n f_*ℤ_ℓ(m)` the primitive quotient of `R^{2m} p_*ℤ_ℓ(m)`; for `n = 2m + 1`, `R^n f_!ℤ_ℓ(m)`
is the primitive quotient and `R^n f_*ℤ_ℓ(m + 1)` the primitive part of `R^{2m} q_*ℤ_ℓ(m)`. Locally these
have natural generators up to sign, `δ` with compact support and `δ'` without. The forget-supports map
`φ : R^n f_!ℤ_ℓ → R^n f_*ℤ_ℓ` is zero for `n` odd and sends `±δ` to `±2δ'` for `n` even and positive;
`Tr(δδ') = ±1`, and `Tr(δ²) = 0` for `n = 2m + 1` and `(−1)^m · 2` for `n = 2m`. For `n > 0` the compactly
supported sheaves are concentrated in degrees `n` and `2n`; the top one is `ℤ_ℓ(−n)` and the middle one is
a rank-one lisse sheaf with the orientation character of the quadric, which becomes a Tate line once
that character is trivialized.

*Proof sketch.* Use the localization sequence of `X° ⊂ X ⊃ Y` and its dual Gysin sequence, and compute
restriction with 2.3: in even dimension the image of a ruling class is the integral generator `c` of the
adjacent odd-dimensional quadric with `2c = η^m` (the notation `η^m/2` does not invert two in `ℤ_2`); in odd
dimension restriction is injective with the primitive quotient as cokernel. For `n = 2m`, `δ ↦ ±(cl(α) − cl(β))` gives `Tr(δ²) = cl(α)² − 2cl(α)cl(β) + cl(β)²`, which is `1 + 1 − 0 = 2` for `m` even and
`0 + 0 − 2 = −2` for `m` odd. For `n = 2m + 1`, `δ = ∂cl(α)` and `δ² = 0`. (SGA 7 II, Exposé XII, 3.5–3.6,
pp. 17–18; Table 3.7, p. 20.) *Needs:* the theorem above, 2.3; EtaleCohomologyFoundations §F.6.

**Checks.**

- `n = 1`: `X° = P¹` minus two points `≅ 𝔾_m`, `H¹_c` and `H¹` of rank 1, `φ = 0`, `Tr(δ²) = 0`.
- `n = 2`: `Tr(δ²) = −2`, the self-intersection of the vanishing sphere of a surface node; over `ℂ`, `Σ z_i² = 1` is diffeomorphic to the tangent bundle of a sphere (XII 3.8).
- For `n=0`, `Y=∅`, both ordinary and compactly supported cohomology are `Λ²` in degree zero; no smooth-quadric carrier of dimension minus one is used.

### 2.4 Ordinary quadratic points

**Definition.** Let `y` be a closed point of a scheme `Y` of finite type over a field `k` of characteristic
`p`, and `n = dim_y Y`. For `k` algebraically closed, `y` is an **ordinary quadratic point** if, as
`k`-algebras, `Ô_{Y,y} ≅ k[[x_1, …, x_{n+1}]]/(f)` with `f = Q(x) + R(x)`, `Q` an ordinary quadratic form in
`n + 1 > 0` variables and every coefficient of `R` of total degree below three zero. For general `k`, `y` is
ordinary quadratic if the points of `Y ⊗_k k̄` over `y` are. Requiring the leading form to be
*polar-nondegenerate* defines polar-nondegenerate quadratic points (called nondegenerate in Exposé XV);
`y` is polar-nondegenerate exactly when it is
ordinary and (`p ≠ 2` or `n` is odd), and an ordinary quadratic point with `p = 2` and `n` even is called
polar-degenerate (degenerate in Exposé XV). An arbitrary ordinary germ is not replaced by its pure quadratic cone. Define
`Quadric.IsOrdinaryQuadraticPoint`, `Quadric.IsNondegenerateQuadraticPoint`, and the coordinate
expansion `Quadric.quadraticSeries` of a quadratic form as a multivariate power series, whose
diagonal coefficients are `Q(e_i)` and whose mixed coefficients are `Q(e_i + e_j) − Q(e_i) − Q(e_j)`, with
no division by two.

- `Quadric.IsOrdinaryQuadraticPoint`: Geometric predicate on `(Y/k,y)`, tested after algebraic closure. Its field formal-germ specialization takes a `k`-algebra `A` and `r=n+1>0` and requires `A≅k[[x₁,…,x_r]]/(quadraticSeries(Q)+R)` as `k`-algebras, with `Q` ordinary and `R` of order at least three (`3 ≤ MvPowerSeries.order R`). This is the case `k(y) = k`: a completed local ring of this form has residue field `k`. For instance, in characteristic 2 with `a ∉ k²`, the point `(√a, 0, 0)` of `x₀² − a + x₁x₂ = 0` is ordinary quadratic and polar-degenerate (`n = 2`, geometric local equation `u² + x₁x₂` with `u = x₀ − √a`), but its residue field is `k(√a)`, so its local ring is not an `IsOrdinaryQuadraticGerm` over `k`.
- `Quadric.IsNondegenerateQuadraticPoint`: The same with the leading form polar-nondegenerate.
- `Quadric.isNondegenerate_iff`: `IsNondegenerateQuadraticPoint Y y ↔ IsOrdinaryQuadraticPoint Y y ∧ (p ≠ 2 ∨ Odd n)`.
- `Quadric.isOrdinaryQuadraticPoint_baseChange`: The notion is geometric: it holds at `y` if and only if it holds at the points over `y` after any field extension.
- `Quadric.isOrdinaryQuadraticPoint_cone`: For `r > 0` and `Q` ordinary, the formal quotient `k[[x]]/(quadraticSeries Q)` is an ordinary germ; its identification with the completed local ring of the cone `Q = 0` at its vertex is a statement about schemes (Mathlib `AdicCompletion`; TauCetiRoadmap ModularCurves Layer 4D).
- `Quadric.quadraticSeries`: The coordinate expansion of `Q` in multivariate formal power series; its diagonal coefficients are `Q(e_i)`, and its mixed coefficients are `Q(e_i+e_j)−Q(e_i)−Q(e_j)`, with no division by two.
- `Quadric.quadraticSeries_proj`: For `Q=proj_i·proj_j` the constructor returns `X_i X_j`, including `i=j`.

*Proof sketch.* The quadratic part of `f` is determined up to a linear change of coordinates and a unit,
because `f` has no linear term, and ordinarity is invariant under both. Polar-nondegeneracy is the criterion of
2.1 for the form in `n + 1` variables. (SGA 7 II, Exposé XV, Définition 1.2.1, p. 4; 1.2.2, pp. 4–5;
Exemple 1.2.4, p. 5.) *Needs:* 2.1; Mathlib `MvPowerSeries`, `MvPowerSeries.order`, `AdicCompletion`
(completed local rings); TauCetiRoadmap ModularCurves Layer 4D.

**Checks.**

- For the mixed projection `xy`, `quadraticSeries` is `X₀X₁`; for `x²` it is `X₀²`.
- For `xy+z²` over a characteristic-two field, `quadraticSeries` is `X₀X₁+X₂²`, with no division by two.
- `Quadric.node_isOrdinary`: The node `xy = 0` in `𝔸²` (`n = 1`): `Q = xy` is ordinary and polar-nondegenerate in every characteristic.
- `Quadric.doublePoint_char_two`: `n = 0`, `Y = Spec k[x]/(x²)`: `Q = x²` is ordinary in every characteristic, so the origin is ordinary; it is polar-nondegenerate if and only if `p ≠ 2`, and for `p = 2` it is polar-degenerate.
- `Quadric.cusp_not_ordinary`: The cusp `y² = x³` (`n = 1`): the quadratic part `y²` in two variables is not ordinary (its quadric is a double point of `P¹`), so the cusp is not an ordinary quadratic point.
- `Quadric.smooth_point_not_quadratic`: A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension `n`, not `n + 1`.
- The node, the double point in both characteristics, the cusp and a smooth point.

**Lemma (the Tjurina module).** Let `y` be an ordinary quadratic point of `Y/k` with `k(y)` purely
inseparable over `k`, and `T¹_{Y/k} = O_Y/J` the quotient by the Jacobian ideal. Near `y`, `T¹` is monogenic
and concentrated at `y`, of rank one over `k` if `y` is polar-nondegenerate (and then `k(y) = k`), of rank two if `y`
is polar-degenerate (`p = 2`, `n = 2m`), in which case `k(y) = k` or `k(y) ≅ k(√a)` with `a ∈ k − k²`. *Proof
sketch.* Check over `k̄` after completion. If `y` is polar-nondegenerate the partial derivatives of
`f = Q + (order ≥ 3)` generate the maximal ideal by Nakayama, so the quotient is `k`. In the polar-degenerate case
`f = x_0² + Σ_{i=1}^m x_i x_{i+m} + R` in suitable coordinates, and `(f, ∂f/∂x_i) = (x_0², x_i (i ≠ 0))`, so the
quotient is `k[x_0]/(x_0²)`; a radicial subscheme of rank two of affine space lies on a unique line.
(SGA 7 II, Exposé XV, Lemmes 1.2.7–1.2.8, pp. 6–7; 1.2.9–1.2.10.) *Needs:* the definition above.

**Checks.**

- `n = 0`, `Y = Spec k[x]/(x²)`: `T¹ = k[x]/(x², 2x)` has dimension 1 for `p ≠ 2` and 2 for `p = 2`.

- For `xy=0`, the quotient by the equation and its derivatives is `k` in every characteristic.
- In characteristic two, `x₀²+x₁x₂=0` has Tjurina quotient `k[x₀]/(x₀²)` of rank two.

**Theorem (henselian implicit function theorem, Tougeron).** Let `(A, 𝔞)` be a henselian pair with `A`
noetherian, `X ⊂ 𝔸^N_A` a closed subscheme of finite presentation defined by `f_1, …, f_c`, `δ'` the ideal of
`A[x]` generated by the `c × c` minors of the Jacobian matrix, and `x̄ ∈ A^N` with `f(x̄) ≡ 0 mod δ'(x̄)² 𝔞`.
Then there is `x ∈ X(A)` with `x ≡ x̄ mod δ'(x̄) 𝔞`. In the quadratic application: a formal coordinate change
tangent to the identity that carries the equation of an ordinary quadratic germ to `Q` modulo a high
power of the maximal ideal is approximated by a henselian coordinate change with the same jet; the
linear part stays invertible and the quadratic leading term is preserved. *Proof sketch.* Newton
iteration in the henselian pair, the Jacobian-square condition giving quadratic convergence; for the
quadratic germ, present the coordinate-change equations as a finite-type scheme of solutions and apply
the theorem with `δ'` the Jacobian ideal of `Q`. (SGA 7 II, Exposé XV, Théorème 1.1.2, pp. 2–3.) *Needs:*
2.1; Mathlib `HenselianRing`; SchemeAndStackFoundations Layer 0, §0.14 (henselian pairs, smooth lifting
over henselian pairs).

**Checks.**

- `N = c = 1`, `X : g(x) = 0` in `𝔸¹_A` with `g′(x̄)` a unit (so `δ′(x̄) = A`): a root `x̄` of `g` modulo `𝔞` lifts to a root in `A` congruent to `x̄` modulo `𝔞`, which is Hensel's lemma.

- For `A=k[[t]]` with `2` invertible, `g(x)=x²−(1+t)` and `x̄=1`, the lifted root is congruent to one modulo `t`.
- For `A=k[[t]]`, `g(x)=x²−t` and `x̄=0`, the Jacobian-square hypothesis fails; a root need not exist in `A`.

**Theorem (canonical form up to henselization).** Let `y` be an ordinary quadratic point of a `k`-scheme
`Y` and `k'` the separable closure of `k` in `k(y)`. There are a `k'`-scheme `Y_0 ⊂ 𝔸^{n+1}_{k'}` and a point
`y_0` with an isomorphism of henselizations `Y_(y) ≅ Y_0(y_0)` over `k`, where either `Y_0` is the cone `Q = 0`
of a polar-nondegenerate form and `y_0` the origin, or (`p = 2`, `n = 2m`) `Y_0` is
`(x_0² − a) + Σ_{0<i≤j≤2m} a_{ij} x_i x_j = 0` with the `2m`-variable form polar-nondegenerate and `y_0 = (√a, 0, …, 0)`.
The same holds for the affine quadric of a non-homogeneous quadratic form with an ordinary singular
point, by an affine change of variables. *Proof sketch.* Pass to an étale neighbourhood that is a
`k'`-scheme; `dim(Ω¹_{Y/k})_y = n + 1`, so `Y` is a hypersurface in a smooth `Z` of dimension `n + 1`. In the
polar-nondegenerate case `k(y) = k` (Tjurina lemma), choose étale coordinates with `f = Q + (order > 2)` and apply
the implicit function theorem to get coordinates `x'_i ≡ x_i mod 𝔪²` with `Q(x') = 0`; the polar-degenerate case
uses the line of the Tjurina lemma. (SGA 7 II, Exposé XV, Théorème 1.2.6 and its proof, pp. 5–7.)
*Needs:* the definition, the Tjurina lemma and the implicit function theorem above; 2.1.

**Checks.**

- The node `xy = 0` is the cone of `x₁x₂`; `y² = x² + x³` at the origin (`p ≠ 2`) is étale locally the node.

- The double point `x²=0` is already its rank-one quadratic cone in every characteristic.
- Over an imperfect field of characteristic two, `x₀²−a+x₁x₂=0` has its ordinary point over `k(√a)`; the henselian model retains that residue extension.

**Theorem (henselian versal deformation).** Over a henselian noetherian local base, an isolated ordinary
quadratic germ has a henselian versal deformation: the one-parameter family `Q − b = 0` in the
polar-nondegenerate case, and the two-parameter family `x_0² + b x_0 + c + Q'` in the polar-degenerate case
(characteristic two, even fibre dimension). A chosen identification on the special fibre extends once
the lifts of the coefficients are prescribed. *Proof sketch.* The Tjurina lemma gives one or two
deformation parameters; the formal versal deformation is computed by the Jacobian calculation of
XV 1.3.1–1.3.3; Artin approximation (AlgebraicModuliForArithmeticGeometry Layer 6) and Elkik's theorem
pass from the formal to the henselian deformation. (SGA 7 II, Exposé XV, Théorème 1.1.4 (Elkik), p. 4,
and 1.3.1–1.3.3, pp. 10–12.) *Needs:* the Tjurina lemma; AlgebraicModuliForArithmeticGeometry Layer 6
(Artin approximation); SchemeAndStackFoundations Layer 0, §§0.12–0.14 (henselization, Elkik's smooth lifting).

**Checks.**

- The ordinary quadratic point has a one-parameter versal deformation `Q − b = 0` (polar-nondegenerate case) and a two-parameter one in the polar-degenerate case, matching the `T¹` ranks one and two.

- For the node `xy=0`, `xy=b` supplies the one smoothing parameter.
- In characteristic two, `x²=0` has the two-parameter deformation `x²+bx+c`; the linear parameter cannot be absorbed by translating `x`.

**Theorem (local equation of a family).** Let `S = Spec A` be henselian local with closed point `s`,
`f : X → S` flat of finite presentation, and `x` a closed point of `X_s` at which `X_s` (of dimension `n`) has an
ordinary quadratic singularity, with `k(x)` purely inseparable over `k(s)`.
(i) If `x` is polar-nondegenerate, there are a polar-nondegenerate quadratic form `Q` in `n + 1` variables over `A` and
`b` in the maximal ideal such that the henselization of `X` at `x` is isomorphic to that of `Q − b = 0` at the
origin of `𝔸^{n+1}_S`.
(ii) If `x` is polar-degenerate (`n = 2m`, characteristic two), there is
`Q(x) = x_0² + b x_0 + c + Σ_{1≤i≤j≤2m} a_{ij} x_i x_j` over `A`, with `b` in the maximal ideal and the
`2m`-variable form polar-nondegenerate, such that the henselization of `X` at `x` is isomorphic to that of `Q = 0`
at `(√c, 0, …, 0)`.
The isomorphism can be chosen to extend a given one on the special fibre. The source prints `x_0` for
`x_0²` in (ii). *Proof sketch.* The special fibre at `x` is in canonical form; pull back the henselian versal
deformation along a local morphism, which specializes `b` (and `c`) to elements of `A`. (SGA 7 II,
Exposé XV, Corollaire 1.3.2(i), p. 11; Remarque 1.3.3, p. 12.) *Needs:* the canonical form and versal
deformation theorems above.

**Checks.**

- A family of curves acquiring a node: `xy = b` with `b ∈ m_A`; for a regular total space `b` is a uniformiser, which is the `b(x)` of XV 3.3.1.

- For `x²=π` with residue characteristic not two, the local model has `Q=x²` and `b=π`.
- In characteristic two, `x²+πx+π=0` has both linear and constant parameters in the maximal ideal and a smooth separable generic fibre.

**Corollary.** In the situation of the local-equation theorem there is a neighbourhood `U` of `x` in `X`
such that every point of `U` at which `f` is not smooth is an ordinary quadratic point of its fibre. *Proof
sketch.* On `Q − b = 0` the morphism fails to be smooth exactly where all `∂Q/∂x_i` vanish and `Q = b`, that
is at the origin over `V(b)`, where the fibre is the cone `Q = 0`; the degenerate model is analogous.
(SGA 7 II, Exposé XV, Corollaire 1.3.4, p. 12.) *Needs:* the local-equation theorem.

**Checks.**

- In a Lefschetz pencil the singular points of the fibres near `x_s` are `x_s` itself, as condition (B) requires.

- For `xy=b` over `Spec k[b]`, the only nonsmooth point in each nonsmooth fibre is its quadratic origin.
- For `x²+bx+c=0` in characteristic two, the nonsmooth fibres have `b=0` and their unique geometric point is an ordinary double point.

### 2.5 Cones: homotopy invariance and the Gysin sequence

**Lemma (homotopy invariance).** Let `k` be algebraically closed and `Λ` a torsion ring prime to
`char k`. A morphism `(U, K) → (V, L)` of schemes with complexes in `D⁺` is a pair `(f : U → V, φ : f^*L → K)`;
it induces `f^* : H^*(V, L) → H^*(U, K)`. Two such morphisms are homotopic if there are a connected `k`-scheme
`T` of finite type, points `0, 1 ∈ T(k)` and a morphism `(U × T, pr_1^*K) → (V, L)` with fibres `f_0` and `f_1` at
`0` and `1`. Homotopic morphisms induce the same map on cohomology. *Proof sketch.* Join `0` and `1` by a
chain of smooth connected curves mapping to `T`; for a smooth connected curve, smooth base change makes
`R^n pr_{2*}(pr_1^*K)` the constant sheaf `H^n(U, K)`, and evaluation at the two points of a connected curve
agree on a constant sheaf. (SGA 7 II, Exposé XV, Lemme 2.1.3, p. 14.) *Needs:*
EtaleCohomologyFoundations §§F.2–F.3 (smooth base change); EtaleCohomologyFoundations §§F.1–F.2.

**Checks.**

- The homotheties `(x, t) ↦ tx`, `t ∈ 𝔸¹`, make the identity of an affine cone homotopic to the constant map to its vertex.
- For an affine line, homotheties identify the pullbacks by identity and by the constant map in degree zero.
- On `ℂ^×`, the maps `z↦z` and `z↦z²` act by one and two on `H¹(−,ℤ/3)`; they are not homotopic by such a connected algebraic parameter.

**Proposition (cones).** Let `Y ⊂ P^r` be projective over an algebraically closed `k`, `X ⊂ 𝔸^{r+1}` its affine
cone with vertex `0`, `X_(0)` its henselization at `0`, `X* = X − {0}`, `X*_(0) = X_(0) − {0}`, `X_1 ⊂ P^{r+1}` the
projective cone (so `X = X_1 − Y`), and `F` a torsion group prime to `char k`. Then `H^i(X, F) ≅ H^i({0}, F)`
(`F` for `i = 0`, zero otherwise), `H^i_{0}(X, F) ≅ H^i_c(X, F)`, and `H^i(X*, F) ≅ H^i(X*_(0), F)`. *Proof
sketch.* The homotheties make the identity of `X` homotopic to the constant map at the vertex; for
compact supports, homotheties of large ratio retract `X_1 − {0}` onto `Y`, and the five lemma on the
localization sequences concludes; the henselian comparison is the five lemma with supports in `{0}`.
(SGA 7 II, Exposé XV, Proposition 2.1.2, p. 13; Corollaire 2.1.4, p. 15.) *Needs:* the homotopy lemma.

**Checks.**

- `Y = P⁰` (`X = 𝔸¹`): `H^i(𝔸¹) = F` for `i = 0` and 0 otherwise, and `H^i_{0}(𝔸¹) = H^i_c(𝔸¹) = F(−1)` for `i = 2`.

- For the cone of two points in `ℙ¹`, the affine nodal union has `H⁰=Λ` and no positive ordinary cohomology.
- For that nodal cone, supported `H¹` at its vertex has rank one, and equals compactly supported `H¹`.

**Theorem (Gysin sequence of a punctured cone).** In the notation of the cone proposition, let `X̃`,
`X̃_(0)`, `X̃_1` be the blow-ups at `0`, `Y_0` the exceptional divisor, `h : X̃_1 → Y` the projection and
`y_0, y_∞ : Y → X̃_1` the sections with images `Y_0` and `Y`. Restriction gives `H^i(X̃_1 − Y_0) ≅ H^i(Y)` and
`H^i(X̃) ≅ H^i(Y_0) = H^i(Y)`, through which the localization sequences of `(X̃_1 − Y_0, Y)` and
`(X̃_1 − Y, Y_0)` become the rows of a commutative diagram
`… → H^{i−1}(X*) → H^{i−2}(Y)(−1) → H^i(Y) → H^i(X*) → …`, the middle arrows being cup product with the class `η`
of a hyperplane section in one row and with `−η` in the other. Locally `H^i(X̃_(0)) ≅ H^i(Y_0)` by proper base
change, and the sequence of `(X̃_(0), Y_0)` maps to the second row. *Proof sketch.* The Leray sequences of
`h` on the two line bundles give the restriction isomorphisms; `±η` is the restriction of the class of
`O(Y)` or `O(Y_0)`; commutativity reduces, through the triangles `y^*Ry^!F → R h_*F → R(h|X*)_*F →` whose
cohomology lies in degrees 0–2, to `Y` a point. (SGA 7 II, Exposé XV, Lemme 2.1.6 and 2.1.7, p. 16.)
*Needs:* the cone proposition; EtaleCohomologyFoundations §F.6 (Gysin sequence, cycle classes);
EtaleCohomologyFoundations §§F.2–F.3.

**Checks.**

- `Y = P^{r−1}` (`X = 𝔸^r`, `X* = 𝔸^r − {0}`): the sequence recovers `H^i(𝔸^r − {0}) = F` for `i = 0, 2r − 1` and 0 otherwise, because cup with `η` is an isomorphism `H^{i−2}(P^{r−1})(−1) → H^i(P^{r−1})` for `2 ≤ i ≤ 2r − 2`.

- For `Y=ℙ¹`, the punctured affine-plane cone has `H³=Λ(−2)` and `H¹=H²=0`.
- The zero section in the blow-up of `𝔸²` has normal bundle `O(−1)` and the infinity section has normal bundle `O(1)`, detecting the opposite signs.

**Lemma (anticommutative boundary).** The composite
`H^{n−1}(Y_0) ≅ H^{n−1}(X̃) → H^{n−1}(X*) → H^n_{0}(X) → H^n_c(X)` is the negative of the boundary
`∂ : H^{n−1}(Y) → H^n_c(X)` of the pair `(X_1, Y)`, under `Y_0 ≅ Y`. The source numbers this lemma 2.7.8; it is
Lemma 2.1.8, as its use in 2.2.7 shows. *Proof sketch.* By the local diagram it suffices to compare the
boundary maps for the closed subsets `{0}` and `Y` of `X_1`, whose complement is `X*`; the sign is the
orientation reversal `−η` versus `η`. (SGA 7 II, Exposé XV, Lemme 2.1.8, p. 17.) *Needs:* the punctured-cone
theorem.

**Checks.**

- For a cone over two points, `H⁰(Y)/Λ=Λ` maps isomorphically to `H¹_c` of the nodal cone; the two boundary identifications differ by minus one.
- Exchanging the two point labels negates both branch coordinates and preserves the negative comparison.
- For a cone over one point, the reduced `H⁰(Y)` is zero and both compared degree-one boundary maps vanish.

### 2.6 Standard quadratic degenerations

**Definition.** Let `S` be a henselian trait and `Λ = ℤ/k` with `k` invertible on `S`. A standard quadratic
degeneration of relative dimension `n` is the closed subscheme `X ⊂ 𝔸^{n+1}_S` defined by
`Q(x) = Σ_{i≤j} a_{ij} x_i x_j + Σ b_i x_i + c`, nonzero modulo the uniformizer, such that, with `X_1 ⊂ P^{n+1}_S`
the quadric `Σ a_{ij} x_i x_j + Σ b_i x_i z + c z² = 0` and `Y = X_1 ∩ {z = 0}` (so `X = X_1 − Y`): (a) the leading form `Σ a_{ij} x_i x_j` is ordinary,
so `Y` is a smooth quadric of dimension `n − 1` for `n > 0`, and `Y = ∅` for `n = 0`; (b) `X_s̄` is a quadratic cone, with vertex `x_0` the
singular point of `X_s`. The subscheme of `X_s` cut out by the `∂Q/∂x_i` is concentrated at `x_0` and has degree
one, so `x_0` is rational, except when the residue characteristic is two and `n` is even, where it has rank
two and `k(x_0)` is `k(s)` or a purely inseparable quadratic extension. If `x_0 = 0` the `b_i` and `c` lie in the
maximal ideal. Smoothness of the generic fibre is an additional hypothesis, not part of the definition.
(The source writes "`n + 1` pair" for the exceptional case; it is `n + 1` odd.) Define
`VanishingCycles.StandardQuadraticDegeneration`.

- `VanishingCycles.StandardQuadraticDegeneration`: The data `(S, Λ, Q)` with the ordinarity of the leading form (a) and the cone condition (b).
- `VanishingCycles.StandardQuadraticDegeneration.vertex`: The singular point `x₀` of `X_s`, rational unless `char k(s) = 2` and `n` is even.
- `VanishingCycles.StandardQuadraticDegeneration.projectiveClosure`: `X₁ ⊂ P^{n+1}_S` with `X = X₁ − Y`; `Y = X₁ ∩ H` is a smooth quadric of dimension `n−1` for `n>0` and is empty for `n=0`.
- `VanishingCycles.StandardQuadraticDegeneration.discriminantCharacter`: For `n` even, the character `ε : I → {±1}` of the separable quadratic extension of `k(η)` given by the centre of the even Clifford algebra of the rank-`n+2` homogenized form defining `X₁,η` in (2.2.1.1), assuming the generic fibre smooth.
- `VanishingCycles.StandardQuadraticDegeneration.ofLocalEquation`: The local model `Q − b = 0` of a family at a polar-nondegenerate ordinary quadratic point (XV 1.3.2) is a standard degeneration.

*Proof sketch.* The projective closure is a flat family of quadrics and (a) says its section at infinity is
smooth; on `X_s` the partial derivatives define the singular locus of the cone, whose degree is computed
over `k(s̄)` as in the Tjurina lemma; if `x_0` is rational, translate it to the origin. (SGA 7 II, Exposé XV,
2.2.1 and (2.2.1.1), pp. 17–18.) *Needs:* 2.1, 2.2, 2.4.

**Checks.**

- `VanishingCycles.standard_node`: `n = 1`, `Q = xy − π` with `π` a uniformiser: `Y = {xy = 0, z = 0}` is two points (a smooth quadric of dimension 0), `X_s` is the cone `xy = 0`, and the generic fibre is smooth.
- `VanishingCycles.standard_double_point`: `n = 0`, `Q = x² − π` with `p ≠ 2`: `Y = ∅`, `X_s = Spec k(s)[x]/(x²)` is a cone, and the geometric generic fibre is two points.
- `VanishingCycles.not_standard_char_two`: `char k(s) = 2`, `n = 1`, `Q = x² + y² − π`: the leading form `(x + y)²` is not ordinary, so (a) fails.
- `VanishingCycles.standard_trivial_family`: `Q = xy` (`c = 0`): the geometric generic fibre is again a cone, so the generic fibre is not smooth, and all `R^iΦ` vanish (SGA 7 XV, Corollaire 2.2.4).
- The node `xy = π` and the double point `x² = π` are standard; `x² + y² − π` in characteristic 2 is not.

**Theorem (nearby cycles of a standard degeneration).** Let `X/S` be a standard quadratic degeneration
over a strictly henselian trait, `Λ = ℤ/k` with `k` invertible. Ordinary cohomology of the geometric
generic fibre is the nearby stalk at `x_0`, and compactly supported cohomology is the nearby costalk
there. If the generic fibre is still a cone, specialization is an isomorphism and `RΦΛ = 0`. If the
generic fibre is smooth, `RΦΛ` is a rank-one skyscraper at `x_0` in degree `n`; for `n > 0`, `RΨΛ` has the
constant sheaf in degree zero and a rank-one skyscraper in degree `n`, its costalk is concentrated in
degrees `n` and `2n`, both of rank one, and the top trace after twist `n` is an isomorphism; the middle
nearby stalk and costalk pair perfectly with complementary twists by cup product and trace. For `n = 0`
the nearby stalk and costalk are `Λ²`, specialization is the diagonal `Λ → Λ²`, and the vanishing line is its
cokernel; these degree-zero objects are kept apart.

*Proof sketch.* The comparisons with the geometric generic fibre come from proper base change for `X_1`
and supports (XIII 2.1.8.6, 2.1.10.5); the cone proposition applies to `Λ` on `X_s̄`, and `RΦ` is supported
at `x_0`. If `X_η̄` is a cone both sides have cohomology `Λ` in degree zero only, and the specialization
sequence gives `RΦ = 0`. If `X_η` is smooth, `X_η̄` is an affine quadric and 2.3 computes `H^i` and `H^i_c`; pass
to `ℤ/k` by the universal coefficient formula, and use Poincaré duality on `X_η̄`. (SGA 7 II, Exposé XV,
Proposition 2.2.3, pp. 18–19; Corollaire 2.2.4, p. 19; 2.2.5 A–C, pp. 19–20.) *Needs:* the definition
above, 2.3, 2.5, 0.5, 0.6; EtaleCohomologyFoundations §F.6.

**Checks.**

- `n = 1`, `xy = π`: `R¹Φ(Λ)` is `Λ` at the origin, and `H¹_c(X_η̄) ≅ Λ` with `X_η̄ ≅ 𝔾_m`.
- `n=0`, `x²=π` with residue characteristic `≠2`: `R⁰Ψ` and degree-zero nearby costalk have rank 2, while `R⁰Φ=coker(Λ→Λ²)` for the diagonal specialization has rank 1. The trace-zero kernel of `Λ²→Λ` belongs to the dual support description, not the definition of `R⁰Φ`.

- For the persistent cone `xy=0` over the trait, specialization is an isomorphism and every vanishing sheaf is zero.

**Theorem (coefficient-compatible local variation).** For a standard quadratic degeneration
with smooth generic fibre and `n>0` over a strictly henselian trait, and each prime `ℓ`
invertible on the trait, construct `VanishingCycles.localVariation_coefficientReduction`.
The middle nearby stalk and costalk lines at levels
`ℤ/ℓ^ν` have compatible geometrically oriented generators, trace pairings and surjective reduction maps. Their derived adic
realizations are free rank-one `ℤ_ℓ` modules with the twists of 2.3. Prove that the actual
maps `Var(σ)` of 0.4, the forget-supports map and the local restriction/Gysin maps commute
with derived coefficient reduction and recover those finite-level maps. Fix one geometric
sign across the levels and prime factors, as in the local description below.
The relevant twisted Hom module between these two local lines is free rank one, hence
multiplication by two is injective on it, including at `ℓ=2`. For `n=0` use the rank-two
nearby stalk/costalk and rank-one vanishing quotient, not two middle nearby lines.

*Proof sketch.* The affine-quadric calculations of 2.3 and the stalk/costalk comparisons
above give free cohomology and compatible generators at every level. Apply the derived
coefficient exchange maps to the specialization triangle and to the construction of
`Var(σ)` itself; supports, cup product and trace give compatibility of the local dualities.
The surjective towers of these local lines have no higher inverse-limit term; EtaleCohomologyFoundations §F.4 and
0.8 identify their normalized adic realizations and reductions. Cancellation takes place
in their torsion-free integral Hom module before reduction, never in a finite ring or
in arbitrary global cohomology. (SGA 7 II, Exposé XII 3.5–3.7; XIII 1.4.3 and 2.1.8;
XV 2.2.5–2.2.7, pp. 20–23; Illusie 2021 §6.3, pp. 104–105, for the compatible
semistable maps.) *Needs:* EtaleCohomologyFoundations §F.4, EtaleCohomologyFoundations §F.6, 0.4, 0.8, 2.3, the nearby-cycle theorem above.

**Checks.**

- In `ℤ/2`, doubling annihilates both `0` and `1`; in `ℤ/4`, `0` and `2` have the
  same double. Multiplication by two on the integral local Hom module is injective.
- For `xy=π` in residue characteristic different from two, the coefficient `−1` reduces
  to `1` modulo two and `3` modulo four. Restriction after `π=s²` sees zero modulo two
  and `2` modulo four, so it cannot itself recover the original finite-level coefficient.
- In residue characteristic two with `ℤ/3` coefficients, two is a unit and cancellation
  is valid at that level; no `ℤ/6` nearby-cycle theory is used.

**Theorem (variation in a standard degeneration).** For a standard quadratic degeneration with smooth
generic fibre over a strictly henselian trait, choose the middle costalk generator `δ` and stalk
generator `δ'` compatibly with the orientation of the affine quadric, normalized by `(δ', δ) = 1`.

- (`n = 2m > 0`.) Both have twist `m`, the forget-supports map sends `δ` to `(−1)^m · 2δ'`, both transform by the
  quadratic character `ε` of the even Clifford centre of the rank-`n + 2` homogenized form
  defining the smooth projective generic quadric `X_{1,η}`, and
  `Var(σ)(a) = (−1)^m ((ε(σ) − 1)/2) (a, δ) δ`, where the half is the integer
  `0` or `−1` reduced to the coefficient ring. Compute it in
  `ℤ/k` directly when `k` is odd (two is a unit). When `k` has a 2-primary part,
  the residue characteristic is different from two: compute on the compatible local
  integral lines above, cancel there, and reduce to `ℤ/k` using the same geometric sign.
- (`n = 2m + 1`.) The costalk twist is `m`, the stalk twist `m + 1`, the forget-supports map is zero, and
  inertia acts trivially on these cohomology groups although the variation can be nonzero:
  `Var(σ)(δ') = λ(σ)δ` for an additive character `λ : I → Λ(1)`, which is a scalar `λ_X` times the Kummer
  character of the uniformizer, so `Var(σ)(a) = λ_X t_k(σ) (a, δ) δ`. The value of `λ_X`, sign included, is
  the odd Picard–Lefschetz theorem of 2.7.

The source writes `D(σ)` for `Var(σ)` in (2.2.5.9). *Proof sketch.* Even case: 2.3 gives `δ`, `δ'` and
`φ(δ) = (−1)^m · 2δ'`; inertia acts on the two families of generatrices of `X_{1,η̄}` through the Clifford centre,
hence by `ε` on `δ = cl(α) − cl(β)` and on `δ'`; `Var(σ)(a) = c(σ)(a, δ)δ` because the target is the line spanned
by `δ`, and `σ = 1 + q ∘ Var(σ)` (0.4) with `q(δ) = φ(δ)` gives `ε(σ)δ' = (1 + 2c(σ)(−1)^m)δ'`. If `k` is odd solve in `ℤ/k`.
If it has a 2-primary part use coefficient-compatible local variation above: solve on
`ℤ₂` by injectivity of multiplication by two on the local Hom line, and reduce; the
odd-primary factors allow division already. All coefficient orders used are invertible
on the trait.
Odd case: the trivial action follows from 2.3 and the smoothness of `Y/S`; `λ` is additive by the cocycle rule
of 0.4, and every homomorphism from tame inertia to `Λ(1)` is a multiple of the Kummer character. (SGA 7 II,
Exposé XV, 2.2.5 D, (2.2.5.3)–(2.2.5.6), p. 21; 2.2.5 E–F, (2.2.5.9)–(2.2.5.10), pp. 21–22.) *Needs:* the
nearby-cycle and coefficient-compatible local variation theorems above, 2.2, 2.3, EtaleCohomologyFoundations §F.3a, 0.4.

**Checks.**

- `n = 0`, `x² = π`, `p ≠ 2`: `ε` is the character of `k(η)(√π)`, and `Var(σ)(a) = −(a, δ)δ` when `ε(σ) = −1`, the swap of the two points.
- `n = 1`, `xy = π`: `Var(σ)(a) = λ_X t_ℓ(σ)(a, δ)δ` with `λ_X = −1` (Weil I (4.1): `x − (x, δ)δ` for `n ≡ 1 mod 4`).
- For `xy+z²=π` with residue characteristic not two, the leading rank-three form has scalar even-Clifford centre, while the rank-four form `xy+z²−πw²` has quadratic centre with square class `π`; its nontrivial inertia character changes the sign of the vanishing line.

**Theorem (local description of the vanishing cycle).** In a standard quadratic degeneration with
smooth generic fibre over a strictly henselian trait, with `Λ = ℤ/k`:

- (`n` even.) `±δ` is the unordered pair obtained from the distinguished geometric classes of 2.3 by
  coefficient reduction with one common geometric sign. When `k` is a power of one odd prime this is the
  same as `(δ, δ) = (−1)^m · 2`; for `k` with two distinct odd prime factors the norm condition does not
  single out `±δ` (the source claims it does whenever `2 ∤ k`), and neither does a choice made separately at
  each primary factor.
- (`n = 2m + 1`, so `x_0` is rational.) Let `X_{s(0)}` be the henselization of `X_s` at `x_0`, `X̃_{s(0)}` its blow-up at
  `x_0`, `Y_0` the exceptional divisor (a smooth quadric of dimension `2m`) and `X*_{s(0)} = X_{s(0)} − {x_0}`. The
  composite `H^{n−1}(Y_0, Λ(m)) ≅ H^{n−1}(X̃_{s(0)}, Λ(m)) → H^{n−1}(X*_{s(0)}, Λ(m)) → H^n_{x_0}(X_s, Λ(m)) → H^n_{x_0}(X_s, RΨ_η̄Λ(m))` identifies the last group with the primitive quotient of `H^{2m}(Y_0, Λ(m))`, and `±δ`
  is the image of the natural generators of that primitive quotient.

*Proof sketch.* Even case: another generator with the same norm is `uδ` with `u² = 1` in `ℤ/k`, and `u = ±1` only
when `ℤ/k` has no other square roots of one. Odd case: `±δ` is determined by its image in `H^n_c(X_η̄)`; by the
local diagram of 2.5 the composite is, by the anticommutativity lemma and up to sign, the boundary
`H^{n−1}(Y_η̄) → H^n_c(X_η̄)` of 2.3, which carries the generators of the primitive quotient to `±δ`. (SGA 7 II,
Exposé XV, 2.2.6 and (2.2.6.1)–(2.2.6.2), p. 22; Lemme 2.2.7, pp. 22–23.) *Needs:* the variation theorem
above, 2.3, 2.5.

**Checks.**

- `n = 1`, `xy = π`: `Y₀` is the two tangent directions at the node, `H⁰(Y₀) = Λ²`, its primitive quotient is `Λ`, and `δ` generates `H¹_c(X_η̄) = H¹_c(𝔾_m)`.
- `k = 15`, `m` even: `u = 4` satisfies `u² ≡ 1`, so `4δ` also has `(4δ, 4δ) = 2`, and the characterisation by `(δ, δ)` alone does not single out `±δ`.
- The ambiguity persists after a 2-primary lift: `19²=1` in `ℤ/60` and 19 reduces to 4 in `ℤ/15`; this is not the reduction of either globally signed geometric generator.

### 2.7 Nearby cycles and variation at an ordinary quadratic point

**Theorem (concentration and rank).** Let `f : X → S` be flat of finite type and of pure relative dimension
`n` over a henselian trait, with special fibre smooth away from finitely many ordinary quadratic points;
let `Σ` be those points and `E ⊂ Σ` the points near which the generic fibre is smooth. With finite
coefficients `Λ` invertible on `S`, `R^iΦΛ = 0` for `i ≠ n`, and `R^nΦΛ` is supported exactly on `E`, with stalks
free of rank one. The local nearby stalk and costalk pairing is perfect. For `n = 0` the nearby-cycle stalk
in degree zero has rank two while the vanishing-cycle stalk has rank one. (The source calls `Σ` the set
written `E` here, and its part (iii) is about `Ψ`, not `Φ`.) *Proof sketch.* Reduce through the local equation
(2.4) to the standard degeneration (2.6); smooth local acyclicity removes the smooth locus and the
persistent-cone case removes `Σ − E`; the affine-quadric duality calculation gives the rest, keeping `Ψ`
and `Φ` apart in degree zero. (SGA 7 II, Exposé XV, Proposition 3.1.2 and its proof, p. 24.) *Needs:* 0.5,
2.4, 2.6.

**Checks.**

- Outside E (points near which the generic fibre is not smooth) the vanishing cycles vanish (SGA 7 XV, Corollaire 2.2.4).
- For `n=0` the nearby stalk and nearby costalk have rank two; the vanishing stalk, `coker(Λ→Λ²)`, has rank one.

- For `xy=π`, the vanishing line occurs in degree one; at every other point of the special fibre it vanishes.

**Theorem (even relative dimension).** Let `x ∈ E` be an ordinary quadratic point of relative dimension
`n = 2m` over a strictly henselian trait. The middle nearby costalk twisted by `m` has an integral
orientation `δ`, unique up to sign, with `(δ, δ) = (−1)^m · 2` (for `n = 0`, impose trace zero inside the
rank-two nearby object). The vanishing line carries a quadratic inertia character `ε_x`, independent of
the coefficients, and `Var(σ)(a) = (−1)^m ((ε_x(σ) − 1)/2)(a, δ)δ`, the integral coefficient being defined
before reduction (using twice the modulus when necessary). `ε_x` is the character of the centre of the
even Clifford algebra of the homogenized generic local quadratic model, of rank `n + 2`. When the residue characteristic is not two and the
local model is `Q = b`, `ε_x = ε^{v(b)}` with `ε` the quadratic Kummer character of a uniformizer, and the
Clifford centre is obtained by adjoining a square root of `(−1)^{m+1} · 2b · det(a_{ij})` in the polar-matrix
convention of the source: even `v(b)` gives trivial variation and odd `v(b)` the reflection. In
characteristic two the Clifford-centre description is the statement. *Proof sketch.* Treat the universal
case `A = ℤ_ℓ` and use uniqueness of `δ` up to sign; reduce to the standard degeneration (2.6, the variation
theorem); compute `ε_x` from the Clifford algebra (2.2). (SGA 7 II, Exposé XV, Proposition 3.2.1,
pp. 24–25; 3.2.3, pp. 25–26.) *Needs:* the theorem above, 0.4, 2.2, 2.3, 2.6.

**Checks.**

- For `v(b)` even the local monodromy is trivial in even relative dimension; for `v(b)` odd it is the reflection `σ(δ) = −δ` (when `ε_x(σ) = −1`).
- Sign convention: `(δ, δ) = (−1)^m·2` fixes `δ` up to sign, and the `n mod 4` sign table of 2.8 is checked against this normalisation.

- For `xy+z²=π` with residue characteristic not two, the homogenized discriminant character is nontrivial and the vanishing orientation has square `−2`.

**Theorem (characteristic two).** In even fibre dimension and residue characteristic two, the vanishing stalk at an ordinary quadratic
point is still of rank one, but `ε_x` is the separable quadratic character of the even Clifford centre of the
rank-`n + 2` homogenized generic quadratic model; it can be wildly ramified, and is not replaced by the unique tame quadratic
character used when `p ≠ 2`. With rational coefficients (`ℓ ≠ 2`) the local monodromy is
`x ↦ x + (−1)^m ((ε_x(σ) − 1)/2)(x, δ)δ` with `δ² = (−1)^m · 2`; with finite coefficients the formula is defined by
lifting before dividing by two. A nontrivial reflection occurs exactly where `ε_x(σ) = −1`. *Proof sketch.*
Apply the even theorem and identify the separable quadratic extension of the Clifford centre, keeping the
linear term `x_0` of the degenerate local model, whose discriminant extension is not the Kummer extension of
a uniformizer. (Weil II, 4.2.1–4.2.3, pp. 219–220.) *Needs:* the even theorem, 2.2, 2.4; EtaleCohomologyFoundations §F.3a.

**Checks.**

- For a characteristic-two zero-dimensional separable quadratic family the two generic points are exchanged by the wild quadratic character.
- The tame generation statements of Layer LPV.5 are not applied to this wild branch.

- Over `k[[t]]` in characteristic two, `x²+tx+t=0` has Artin–Schreier character `u²+u=1/t`, which is wild for every odd coefficient prime.

**Theorem (odd relative dimension, the Picard–Lefschetz formula at a point).** Let `X → S` have an ordinary
polar-nondegenerate quadratic singularity of relative dimension `n = 2m + 1` with smooth generic fibre, local
equation `Q − b = 0`, `b ≠ 0` in the maximal ideal of the henselian trait. The primitive quotient of the
cohomology of the exceptional quadric determines `±δ` (2.6). For finite coefficients prime to the residue
characteristic,

```text
Var(σ)(a) = (−1)^{m+1} ε_b(σ) (a, δ) δ,     ε_b(σ) = σ(b^{1/r})/b^{1/r} ∈ μ_r = Λ(1),
```

the root being a root of `b`; for a proper family this gives `σ(a) = a + (−1)^{m+1} ε_b(σ)(a, δ)δ` on middle
cohomology, and with `ℚ_ℓ` coefficients `ε_b = v(b) t_ℓ`. The twists make `ε_b(σ)(a, δ)δ` untwisted.

*Proof sketch.* The algebraic proof (Illusie 2002, described in Illusie 2021, §6.1) runs through the
semistable calculation of 1.9. For the model `Q(x_0, …, x_n) = t` (`n + 1` even), the base change `t = s²` of
ramification index two gives the ordinary quadratic cone `Q(x) = s²` in `n + 2` variables. In residue
characteristic two its leading form has polar kernel the `s`-line, on which the quadratic form is nonzero;
it is ordinary and polar-degenerate. Blowing up its vertex
gives a regular scheme whose special fibre is reduced with two smooth components, the strict transform of
the cone `Q = 0` and the exceptional divisor (the smooth quadric `Q(x) = s²` of dimension `n` in `P^{n+1}`),
meeting transversally in the smooth quadric `Q = 0` of dimension `n − 1`. The two-component complex of 1.9
identifies `N`; restriction and Gysin maps on the exceptional quadric and its primitive classes (2.3) give the
coefficient after multiplying by the ramification index two. Use the coefficient-compatible
actual local variation maps of 2.6, not only rational normalized `var`. For `ℓ=2` (hence
residue characteristic different from two), write the original integral variation as
`λ_X t₂(σ)` on the local Hom line, as in 2.6, and use `t₂|_{I'}=2t'₂` (EtaleCohomologyFoundations §F.3a).
The semistable comparison identifies twice `λ_X` with twice `(−1)^{m+1}` in that
free `ℤ₂` module. Cancel there and then reduce compatibly to every `ℤ/2^ν`.
For odd `ℓ` multiplication by two is a unit, including in residue characteristic two.
Combine the primary factors with the common geometric sign. The dominant-trait exchange
(0.6) and naturality of the actual variation (0.4) preserve these maps; arbitrary global
integral cohomology need not be torsion-free.
Illusie's erratum corrects the concentration range used in the local calculation (`|i| > 1`, not `|i| > −1`).
The purity needed for the regular pairs over the trait is 0.10 (in the semistable case it is due to
Rapoport–Zink, Illusie 2021, §6.3). The original proof of SGA 7 XV 3.3 is transcendental: it lifts to
characteristic zero and compares with Betti nearby cycles; the comparison of 2.8 checks the signs. (Illusie 2021, §6.1, pp. 103–104,
and §6.3, pp. 104–105; Illusie 2002 erratum, correcting p. 251, line 18; SGA 7 II, Exposé XV, 3.3.2–3.3.6,
pp. 26–30.) *Needs:* 0.4, 0.6, 0.10, 1.7, 1.9, 2.3, 2.4, 2.6 (coefficient-compatible local variation); EtaleCohomologyFoundations §F.3a (Kummer and tame characters);
EtaleCohomologyFoundations §F.6.

**Checks.**

- The formula has the sign `(−1)^{m+1}` and the twist `Λ(m)`; the quadratic character of the even case is replaced by the Kummer character `ε_b` of `b`.
- The global formula requires properness; the case `δ = 0` is the direct-image theorem of 2.8.

- For `xy=π`, residue characteristic different from two and modulus two/four, the
  coefficients are `1`/`3`; the doubled comparison distinguishes neither `0` from `1`
  modulo two nor `1` from `3` modulo four. The integral local lift gives `−1` at both levels.
- For `xy=π` in residue characteristic two and odd modulus `k`, the coefficient is
  `−1` modulo `k`; two is invertible in `ℤ/k` and no coefficient order divisible by the
  residue characteristic enters the argument.
- For `xy=π²`, the odd-dimensional variation is `−2t_ℓ(σ)(·,δ)δ`; thickness two detects the valuation factor.
- In characteristic two, the base-changed cone `xy=s²` has polar kernel `k·e_s` with
  `(xy−s²)(e_s)=−1=1`. Its projective conic is smooth, so the cone is ordinary although its polar form is degenerate.

### 2.8 The Picard–Lefschetz formula for a proper family

In this subsection `S` is the spectrum of a henselian discrete valuation ring with algebraically closed
residue field of characteristic `p`, `ℓ ≠ p`, and `f : X → S` is proper with `X` regular of pure dimension
`n + 1`, smooth except at one ordinary quadratic point `x` of the special fibre (so the generic fibre is
smooth and proper); write `n = 2m` or `n = 2m + 1`, and `(x, δ) = Tr(x ∪ δ)`. The general residue field is
reached by passing to the strict henselization.

**Theorem (specialization sequence).** (i) There is a vanishing cycle `δ ∈ H^n(X_η̄, ℚ_ℓ)(m)`, well defined up
to sign. (ii) `sp : H^i(X_s, ℚ_ℓ) ≅ H^i(X, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ)` is an isomorphism for `i ≠ n, n + 1`. (iii) There
is an exact sequence

```text
0 → H^n(X_s, ℚ_ℓ) → H^n(X_η̄, ℚ_ℓ) → ℚ_ℓ(m − n) → H^{n+1}(X_s, ℚ_ℓ) → H^{n+1}(X_η̄, ℚ_ℓ) → 0
```

whose middle map is `x ↦ Tr(x ∪ δ)` and whose other maps are specialization.

*Proof sketch.* Proper base change gives `H^i(X_s) = H^i(X)` and `H^i(X_η̄) = H^i(X_s̄, RΨ_ηℚ_ℓ)` (finite
coefficients, then the limit, 0.8). The vanishing triangle gives the long exact sequence; by 2.7, `RΦℚ_ℓ` is
a line in degree `n` supported at `x`, giving (ii); the generator of 2.7 and the duality of 2.7 identify
`R^nΦ_x` with `ℚ_ℓ(m − n)` and the map with `x ↦ Tr(x ∪ δ)`. (Weil I, (4.2), p. 288; (4.3) and (4.3.1)–(4.3.3),
p. 288; (5.13) B), p. 294.) *Needs:* 0.5, 0.6, 0.8, 2.6, 2.7; EtaleCohomologyFoundations §F.6
(Poincaré duality and the trace pairing).

**Checks.**

- `n = 1`, a curve of genus `g` acquiring one node: if the node is nonseparating, `δ ≠ 0`, the middle map is onto, `dim H^1(X_s) = 2g − 1` and `H^2(X_s) ≅ H^2(X_η̄)`; if it separates, `δ = 0`, `H^1(X_s) ≅ H^1(X_η̄)` and `dim H^2(X_s) = 2`.
- `n = 0`, `X = Spec A[y]/(y² − π)` with `p ≠ 2`: `X_η̄` is two points, `δ = e₁ − e₂` and the sequence is `0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0`.
- For a smooth proper family, the vanishing term is zero and specialization is an isomorphism in every degree.

**Theorem (Picard–Lefschetz formula).** Let `I = Gal(η̄/η)` act on `H^i(X_η̄, ℚ_ℓ)`. Inertia acts trivially for
`i ≠ n`. On `H^n`:

- (A) if `n = 2m + 1` is odd, `σx = x + (−1)^{m+1} t_ℓ(σ) (x, δ) δ`, with `t_ℓ : I → ℤ_ℓ(1)` the tame character;
- (B) if `n = 2m` is even and `p ≠ 2`, let `ε : I → {±1}` be the unique character of order two; then `σx = x` when
  `ε(σ) = 1`, `σx = x + (−1)^{m+1} (x, δ) δ` when `ε(σ) = −1`, and `(δ, δ) = (−1)^m · 2`.

Equivalently, in the table of Weil I (4.1), the sign in `σx = x ± …` is `−` for `n ≡ 0, 1` and `+` for
`n ≡ 2, 3 mod 4`, and `(δ, δ) = 2, 0, −2, 0`. The twists are those of the specialization sequence:
`δ ∈ H^n(X_η̄)(m)` and `(x, δ) ∈ ℚ_ℓ(m − n)`, so `t_ℓ(σ)(x, δ)δ ∈ H^n(X_η̄)` for `n` odd.

*Proof sketch.* Proper base change identifies the `I`-module `H^n(X_η̄)` with `H^n(X_s̄, RΨ_ηℚ_ℓ)`, on which
`σ = 1 + Var(σ) ∘ q` (0.4); for `i ≠ n`, `R^iΦ = 0` and `σ` acts trivially. For `n` odd use 2.7 with `b` a
uniformizer (`X` is regular), so `ε_b = t_ℓ`. For `n` even and `p ≠ 2` use the even theorem of 2.7: regularity of
`X` makes `ε_x` nontrivial, and the tame quotient of `I` has a unique character of order two. Evaluate at
`n = 0, 1, 2, 3` to obtain the table. (Weil I, (4.3) A)–B), pp. 288–289; (4.1), p. 287.) *Needs:* the
specialization sequence, EtaleCohomologyFoundations §F.3a, 0.4, 2.7.

**Checks.**

- `n = 0`, `X = Spec A[y]/(y² − π)`, `p ≠ 2`: `σ` with `ε(σ) = −1` swaps the two points, and `x − (x, δ)δ` with `δ = e₁ − e₂` sends `e₁` to `e₂`.
- Sign table for `n = 0, 1, 2, 3`: signs `−, −, +, +`; `(δ, δ) = 2, 0, −2, 0`; `σδ = −δ` for `n` even when `ε(σ) = −1` and `σδ = δ` for `n` odd.
- For a separating nodal curve, `δ=0` and the middle-cohomology inertia operator is the identity.

**Theorem (direct images).** Let `j : η → S`. (a) If `δ ≠ 0`, then `R^i f_*ℚ_ℓ` is constant for `i ≠ n` and
`R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ`. (b) If `δ = 0`, which happens only for `n` odd since `(δ, δ) = ±2` for `n` even, then
`R^i f_*ℚ_ℓ` is constant for `i ≠ n + 1`, and `0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0` is exact,
with `j_*j^*R^{n+1}f_*ℚ_ℓ` constant and `ℚ_ℓ(m − n)_s` the skyscraper at `s`. *Proof sketch.* A sheaf on `S` is a
triple `(G_s̄, G_η̄, φ : G_s̄ → G_η̄^I)` (0.2), which for `R^i f_*ℚ_ℓ` is `(H^i(X_s), H^i(X_η̄), sp)`; it is constant iff
`I` acts trivially and `sp` is an isomorphism, and equals `j_*j^*` of itself iff `sp` is an isomorphism onto the
invariants. If `δ ≠ 0`, Poincaré duality gives `x` with `(x, δ) ≠ 0`, so the middle map of the sequence is onto;
in degree `n`, `sp` is injective with image `δ^⊥`, which is the invariant subspace because the fixed space of
`x ↦ x + c(x, δ)δ`, `c ≠ 0`, is `δ^⊥` (Mathlib `LinearEquiv.mem_fixedSubmodule_transvection_iff` in the odd case,
where the functional kills `δ`; a direct computation for the even reflection). If `δ = 0`, inertia acts
trivially and the sequence becomes the stalk at `s̄` of the stated sequence. (Weil I, (4.4) a)–b), p. 289.)
*Needs:* the specialization sequence and the Picard–Lefschetz formula above; 0.2 (sheaves on a trait as triples);
EtaleCohomologyFoundations §F.6; Mathlib `LinearEquiv.mem_fixedSubmodule_transvection_iff`.

**Checks.**

- `δ = 0` is realised by a genus-`g` curve acquiring a separating node (`n = 1`): `R² f_*ℚ_ℓ` has stalk `ℚ_ℓ(−1)²` at `s` and `ℚ_ℓ(−1)` at `η̄`.
- For a nonseparating nodal genus-g family, the degree-one closed stalk is the `(2g−1)`-dimensional inertia-fixed subspace, exactly the `j_*` stalk.
- For `n=0`, `x²=π` has degree-zero generic stalk of rank two and closed stalk its diagonal invariant line.

**Comparison (complex signs).** For an algebraic family over `ℂ` of finite type with a single ordinary
quadratic critical point, the étale specialization triangle with finite coefficients, the inertia action
and the primitive-quadric generator of 2.6 correspond under Artin comparison to the classical Milnor-fibre
triangle, the positively oriented small loop and the vanishing sphere (up to sign), compatibly with cup
products, trace and the Tate orientation `ℤ/n(1) = μ_n ↔ (2πi)ℤ/n`. For `n mod 4 = 0, 1, 2, 3` the
Picard–Lefschetz coefficient is `−, −, +, +` and the self-intersection of the vanishing cycle is
`2, 0, −2, 0`. This comparison checks conventions; it is not the algebraic proof in positive
characteristic. *Proof sketch.* Use the relative Artin comparison, its cup-product and trace
compatibility and the Riemann existence identification of paths (0.8a); identify the algebraic generator with the Milnor vanishing
sphere through the ordinary local normal form; compare the specialization sequences and monodromy; check
the four entries of Weil I (4.1); replacing `δ` by `−δ` does not change the operator. (Weil I, §4.1,
pp. 287–288.) *Needs:* the Picard–Lefschetz formula, the local description of the vanishing cycle;
0.8a; EtaleCohomologyFoundations §F.4 and 0.8a.

**Checks.**

- The `n=0` model `z²=t` exchanges the two points and `δ=(1,−1)` has square 2.
- The `n=1` nodal Milnor fibre gives a transvection with coefficient `−` and `δ²=0`.
- For a complex surface node (`n=2`), the vanishing sphere has square `−2` and its local monodromy is the reflection with positive Picard–Lefschetz coefficient.

### Examples

- The double point `x² = π` (`n = 0`, `p ≠ 2`): `X_η̄` is two points, `δ = e_1 − e_2`, the specialization sequence is
  `0 → ℚ_ℓ → ℚ_ℓ² → ℚ_ℓ → 0`, and the inertia element with `ε(σ) = −1` swaps the points:
  `x ↦ x − (x, δ)δ` sends `e_1` to `e_2`.
- A curve of genus `g` acquiring one node (`n = 1`): if the node is nonseparating, `δ ≠ 0`,
  `dim H^1(X_s) = 2g − 1` and `H^2(X_s) ≅ H^2(X_η̄)`; if it separates, `δ = 0`, `H^1(X_s) ≅ H^1(X_η̄)` and
  `dim H^2(X_s) = 2`, and `R^2 f_*ℚ_ℓ` has stalk `ℚ_ℓ(−1)²` at `s` and `ℚ_ℓ(−1)` at `η̄`.
- The Fresán–Sabbah–Yu models (Fresán–Sabbah–Yu, §5.1.3, pp. 41–44, determinant on p. 44): for an odd
  prime and the ordinary quadratic points of their Kloosterman family with `k = 2m + 1`, the orthogonal
  vanishing line has square `(−1)^m · 2`, Tate twist `−m`, and quadratic Galois character given by adjoining a
  square root of `(−1)^{(1+ap)/2} · 2ap`, the Clifford-centre character of the even theorem of 2.7 computed from
  the Hessian determinant in their coordinates.

### Dependencies

Layers LPV.0 and LPV.1; Mathlib (quadratic forms, Clifford algebras, smoothness and the
Jacobian criterion); Tau Ceti (the centre of the even Clifford algebra when two is invertible);
AlgebraicModuliForArithmeticGeometry Layers 1 and 6; SchemeAndStackFoundations Layers 0 and 3;
TauCetiRoadmap ModularCurves Layer 4D; EtaleCohomologyFoundations §§F.1–F.7;
InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4 (point counting);
ComplexComparisonPartII §§C6.0–C6.6 and the nearby–Betti adapter 0.8a.

## Layer LPV.3: Lefschetz pencils

This layer defines Lefschetz pencils as actual schemes and morphisms and proves that they exist after a
Veronese re-embedding of degree at least two. It constructs the dual variety and the incidence family,
identifies the total space of a pencil with the blow-up of the variety along the axis, proves openness
of the good axes by jet calculations, treats the low-dimensional and characteristic-two cases, and
descends pencils to finite fields with their selected global monodromy data. Throughout, `k` is algebraically closed
of characteristic `p` (except in 3.5–3.6), `P = P^N_k` with `N ≥ 1`, `P̌` its dual, `H_t` the hyperplane of
`t ∈ P̌`, and `X ⊂ P` a smooth connected projective variety of dimension `n + 1`. Projective spaces, their
duals and Grassmannians are the projective bundles and Grassmannians of AlgebraicModuliForArithmeticGeometry
Layer 1 (§1.1 and §1.3); the Veronese embeddings are built in 3.4 from its relative very ampleness (§1.4).

### 3.1 Lefschetz pencils

**Definition.** For a linear subspace `A ⊂ P` of codimension two (the *axis*), let `D ⊂ P̌` be the line of
hyperplanes containing `A`, `X_t = X ∩ H_t` for `t ∈ D`, and `X̃ = {(x, t) ∈ X × D : x ∈ H_t}` with projections
`π : X̃ → X` and `f : X̃ → D`, so that `f^{−1}(t) = X_t`. The family `(X_t)_{t∈D}` is a **Lefschetz pencil** if:

- (A) `A` is transverse to `X`: `A ∩ X` is smooth of codimension two in `X`, or empty;
- (B) there are a finite set `S ⊂ D` and points `x_s ∈ X_s`, `s ∈ S`, such that `f` is smooth outside `{x_s}`;
- (C) each `x_s` is an ordinary quadratic singular point of `X_s` (2.4).

Under (A), 3.3 identifies `π` with the blow-up of `X` along `A ∩ X`, so `X̃` is smooth, and for each `s ∈ S` the
local theory of Layer LPV.2 applies to `X̃ ×_D D_(s)` over the henselization `D_(s)`. Define
`LefschetzPencil.IsLefschetzPencil X A`.

- `LefschetzPencil.IsLefschetzPencil`: `IsLefschetzPencil X A : Prop`, conditions (`A`)–(C) for the axis `A`.
- `LefschetzPencil.totalSpace`: `X̃ ⊂ X × D` with `π` and `f`, and `f^{-1}(t) = X ∩ H_t`.
- `LefschetzPencil.totalSpace_iso_blowup`: Under (A), `π : X̃ ≅ Bl_{A∩X} X` and `X̃` is smooth over `k`.
- `LefschetzPencil.singularSet`: The finite set `S ⊂ D` with its points `x_s`, and `f` smooth on `X̃ − {x_s}`.
- `LefschetzPencil.localModel`: `X̃ ×_D D_s → D_s` is proper, `X̃ ×_D D_s` is regular of dimension `n + 1`, and it is smooth except at the ordinary quadratic point `x_s`.

*Proof sketch.* `X̃` is cut out in `X × D` by the bilinear incidence equation. (B) makes `S` finite with `f` smooth
elsewhere, and (C) is the local condition of 2.4; by 2.4, `X̃ ×_D D_(s)` is regular of dimension `n + 1` (given the
smoothness of `X̃` from 3.3) and smooth except at `x_s`. (Weil I, §5, (5.1)–(5.1.1), p. 289, and (5.6), pp. 291–292.)
*Needs:* 2.4 (ordinary quadratic points and the corollary on non-smooth points); AlgebraicModuliForArithmeticGeometry
Layer 1 (projective bundles).

**Checks.**

- `LefschetzPencil.line_in_plane`: `X` a line in `P²`, `A` a point not on `X`: every line through `A` meets `X` transversally in one point, so `S = ∅` and `f : X̃ = X → D` is an isomorphism. This is a Lefschetz pencil with no singular fibre.
- `LefschetzPencil.quadric_surface`: `X` a smooth quadric surface in `P³`, `p ≠ 2`, `A` a general line: `S` has two points, each `X_s` is a pair of lines meeting in one point, and `X̃` is `X` blown up in the two points of `A ∩ X`; `χ(X̃) = 6 = 2·2 + 2·1`.
- `LefschetzPencil.cubic_surface`: `X` a smooth cubic surface in `P³`, `p = 0`, `A` a general line: `|S| = 12`, the degree `3·2²` of the dual surface, each `X_s` a plane cubic with one node; `χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1`.
- `LefschetzPencil.hermitian_curve_not_lefschetz`: `p` odd, `q = p^e`, `X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²`: along the tangent direction `(u, v)` at an affine point `(a, b)`, with `a^q u + b^q v = 0`, one has `F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1})`. So every tangent line meets `X` with multiplicity `≥ q ≥ 3` at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding.

### 3.2 The dual variety

**Definition.** Let `Y = {(x, t) ∈ X × P̌ : x ∈ H_t}` with `g : Y → P̌`, whose fibre over `t` is `X_t`. The **dual
variety** `X̌ ⊂ P̌` is the reduced closed image of the conormal variety
`C = {(x, t) : x ∈ X, T_xX ⊂ H_t}` (`T_xX` the projective tangent space); `t ∈ X̌` exactly when `H_t` is tangent to
`X`, that is when `X_t` is singular or `X ⊂ H_t`. `C` is a projective bundle over `X` with fibres `P^{N−n−2}` (empty
when `N = n + 1`), so `X̌` is irreducible when nonempty; `g` is smooth over `P̌ − X̌`; and for a Lefschetz pencil
with parameter line `D`, `S = D ∩ X̌` (`X ⊂ H_t` cannot happen for `t ∈ D`, because `A ∩ X` has codimension two in
`X`). For `X = P` the conormal variety and the dual are empty. Define `LefschetzPencil.dualVariety`.

- `LefschetzPencil.dualVariety`: `X̌ ⊂ P̌`, the reduced closed image of the conormal variety `{(x, t) : T_xX ⊂ H_t}`.
- `LefschetzPencil.mem_dualVariety_iff`: `t ∈ X̌` if and only if `X ∩ H_t` is singular or `X ⊂ H_t`.
- `LefschetzPencil.dualVariety_isIrreducible`: If `X` is smooth, connected, projective and its dual is nonempty, the reduced dual is irreducible. For `X` equal to the ambient projective space the dual is empty.
- `LefschetzPencil.incidence_smooth_off_dual`: `g : Y → P̌` is smooth over `P̌ − X̌`.
- `LefschetzPencil.singularSet_eq_inter_dual`: For a Lefschetz pencil, `S = D ∩ X̌`.

*Proof sketch.* The conormal variety is a projective bundle over `X`, hence irreducible when nonempty, and
`X̌` is its image. The Jacobian criterion at each point of `X ∩ H_t` shows `t ∉ X̌` exactly when `X ∩ H_t` is smooth of
dimension `n`, which is smoothness of `g` along `g^{−1}(t)`. (Weil I, §5, proof of (5.4), pp. 290–291.) *Needs:*
AlgebraicModuliForArithmeticGeometry Layer 1, §1.1 (projective bundles); Mathlib's Jacobian criterion
(`Algebra.IsStandardSmooth`) and `AlgebraicGeometry.Scheme.Hom.isClosedMap` (images of proper maps).

**Checks.**

- `LefschetzPencil.dualVariety_projectiveSpace`: `X = P`: every `H_t ∩ P = H_t` is smooth and `P ⊄ H_t`, so `X̌ = ∅`.
- `LefschetzPencil.dualVariety_linear`: `X` a linear subspace of dimension `d`, `1 ≤ d < N`: `X ∩ H_t` is always smooth, so `X̌ = {t : X ⊂ H_t}`, a linear subspace of codimension `d + 1 ≥ 2`, not a hypersurface.
- `LefschetzPencil.dualVariety_conic`: `X` the conic `xz = y²` in `P²`, `p ≠ 2`: `X̌` is the conic of lines `(a : b : c)` with `b² = 4ac`.
- `LefschetzPencil.dualVariety_conic_char_two`: `p = 2`, `X` the conic `xz = y²`: the tangent line at `(s² : st : t²)` is `t²x + s²z = 0`, which passes through the nucleus `(0 : 1 : 0)`. So `X̌` is a line in `P̌²` and `X → X̌` is purely inseparable of degree 2, not the dual conic.
- A smooth plane conic has the dual conic for `p ≠ 2` and a line for `p = 2`.

### 3.3 The total space of a pencil

**Theorem.** Let `X ⊂ P` be smooth projective of dimension at least one and `A` an axis transverse to `X`. The
incidence family `X̃ = {(x, H) : x ∈ X ∩ H, H ⊃ A}` over the line `D` is canonically the blow-up `Bl_{A∩X} X`, with
the hyperplane sections as fibres. The centre is smooth of codimension two when nonempty, `X̃` is smooth and
`f : X̃ → D` is projective. For a curve a general axis misses `X`, the centre is empty and the blow-up is `X`.
*Proof sketch.* Write the incidence equation `s_0 u_1 − s_1 u_0 = 0` with `s_0, s_1` the sections cutting out
the axis; since `(s_0, s_1)` is a regular sequence on `X` near `A ∩ X`, the universal property of the Rees-algebra
blow-up identifies `X̃` with `Bl_{A∩X} X`; check smoothness in the two coordinate charts and projectivity of
`f`; the empty centre is the identity case of the universal property. (SGA 7 II, Exposé XVII, 2.2,
pp. 4–5 (book pp. 215–216); Exposé XVIII, §§2–3, pp. 5–17 (book pp. 259–271).) *Needs:* 3.1;
TauCetiRoadmap StableReduction Layer 4 (Rees algebra and blow-up of a finite-type ideal, universal
property, affine charts); SchemeAndStackFoundations Layer 0, §0.8.

**Checks.**

- A quadric-surface pencil blows up the two points of its axis intersection.
- A line in `P²` with a disjoint point axis has total space `X` and no critical fibre.

- A transverse-axis pencil on a smooth cubic surface blows up its three axis-intersection points.

### 3.4 Existence of Lefschetz pencils

**Theorem (good axes form a dense open).** For `X` smooth projective connected of positive dimension,
after a Veronese embedding of degree `r ≥ 2`, the hyperplanes whose section has at most one singular point,
an ordinary quadratic one, form a dense open subset of the dual locus, and the bad hyperplanes form a
closed subset of codimension at least two in `P̌`. Together with the open transversality condition on the
axis this gives a nonempty open set of axes `A` (in the Grassmannian of codimension-two subspaces) for which
`(X_t)_{t∈D}` is a Lefschetz pencil. The good-axis conditions concern ordinary singularities, not the
separability of the Gauss map. *Proof sketch.* Use the degree-`r` one-jet map and prescribe an ordinary
quadratic two-jet at one point; bound the hyperplanes with a nonordinary singularity using the open set of
ordinary forms (2.1); estimate the incidence of hyperplanes with two singular points, separating `r ≥ 3`
from `r = 2`, where the common mixed coefficient can lower the number of independent conditions by one when
the joining line lies in both tangent spaces; treat linear `X` by an explicit quadratic pencil; combine the
codimension bounds with transversality of the axis. (SGA 7 II, Exposé XVII, Théorème 2.5, p. 6 (book
p. 217); §§3.2–3.7, pp. 7–23 (book pp. 218–234); §§4.1–4.3, pp. 24–29 (book pp. 235–240), especially
Proposition 4.3.) *Needs:* 2.1, 2.4, 3.2; AlgebraicModuliForArithmeticGeometry Layer 1, §1.3
(Grassmannians); Mathlib `AdicCompletion` (jets and completed local rings).

**Checks.**

- A degree-two embedding of a linear variety is covered by the explicit quadratic-pencil case.
- In degree two the proof does not assert that the two one-jet maps are jointly surjective onto two
  arbitrary independent jet spaces; the count loses one condition in the tangent-line configuration.

- For `X=ℙ¹` in its degree-two embedding as a conic, a general axis point gives two ordinary critical double-point members when the characteristic is not two.

**Theorem (existence of Lefschetz pencils).** For `r ≥ 1` let `i_r : P → P^{C(N+r, N) − 1}` be the Veronese
embedding by the monomials of degree `r`, whose hyperplane sections are the degree-`r` hypersurface sections
of `P`. Define it as `LefschetzPencil.veronese r`, the classifying map of `O(r)` on `P^N_k`
(AlgebraicModuliForArithmeticGeometry Layer 1, §1.4, `ProjectiveBundles.IsRelativelyVeryAmple.completeMap`), and
prove `LefschetzPencil.veronese_isClosedImmersion` (`O(r)` is very ample for `r ≥ 1`, so `i_r` is a closed
immersion) and `LefschetzPencil.veronese_hyperplane` (the pullback of a hyperplane is the hypersurface of the
corresponding degree-`r` form). If `r ≥ 2` and `X` is embedded by `i_r ∘ i_1`, the axes `A` for which `(X_t)_{t∈D}` is a Lefschetz pencil
contain a nonempty open subset of the Grassmannian; equivalently, a sufficiently general pencil of
degree-`r` hypersurface sections of `X` is a Lefschetz pencil. For `r = 1` and `p ≠ 0` the original embedding may
admit no Lefschetz pencil at all. *Proof sketch.* Take an axis in the open set of the previous theorem; the
incidence blow-up (3.3) gives the smooth projective total space; the ordinary one-point conditions give
finitely many critical fibres, each with one ordinary quadratic point. (Weil I, §5, (5.7), p. 292, and
(5.13) C), p. 294; the proof is SGA 7 XVII.) *Needs:* 3.1–3.3 and the previous theorem; 2.4;
AlgebraicModuliForArithmeticGeometry Layer 1, §1.4 (relative very ampleness).

**Checks.**

- The Hermitian curve of degree `q + 1` in characteristic `p` odd has no Lefschetz pencil of lines, while a general pencil of conics (`r = 2`) is Lefschetz.

- For `X=ℙ¹` with the identity degree-one embedding in `ℙ¹`, the parameter fibres are single points and no singular member occurs.
- The degree-two Veronese of a line has hyperplane pullbacks given by binary quadratic forms, including the double-root critical members.

### 3.5 Characteristic two, low dimension and finite fields

**Comparison.** In characteristic two and even fibre dimension `n` the ordinary hyperplane locus can have an
inseparable Gauss map, and a Lefschetz axis is not required to meet the reduced dual transversely as if
the Gauss map were étale; the existence criterion of 3.4 (bad locus of codimension at least two) is applied
directly. For linear `X` the dual has codimension at least two and a general pencil has no singular fibre;
for `X = P` the dual is empty; for a curve a general axis has empty intersection with `X`. Connected-fibre cohomology arguments are
applied only in the dimensions where weak Lefschetz in degree zero (connectedness of the hyperplane sections) holds, and `n = 0` is
handled by finite fibres. *Proof sketch.* Use the Hessian and Gauss differential criterion of XVII 3.3–3.5,
separate the characteristic-two parity where ordinary does not imply a nondegenerate polar Hessian, and
check the linear and curve models. (Weil II, 4.2.1–4.2.3 and 4.2.7, pp. 219–221.) *Needs:* 3.2, 3.4, 2.4;
EtaleCohomologyFoundations §F.7 (weak Lefschetz, whose degree-zero case is the connectedness of
hyperplane sections).

**Checks.**

- The characteristic-two conic has a line as reduced dual and purely inseparable degree-two Gauss map.
- The line-in-plane pencil has finite singleton fibres and no singular locus.
- For a conic in `ℙ²`, the axis is a point off the conic; its intersection with `X` is empty although the axis itself is not.

**Theorem (descent of pencils to a finite field).** Let `X` be smooth projective over `𝔽_q`, embedded by a
Veronese embedding of degree at least two. The open set of good axes is defined over `𝔽_q` and, being
geometrically nonempty, has a point over some finite extension `𝔽_{q^r}`; the resulting axis, its finite
singular set and the ordinary local models descend to `𝔽_{q^r}` by finite presentation. After this extension
the arithmetic Frobenius acting on the cohomology of the fibres is `Frob_{q^r} = (Frob_q)^r`, so a Frobenius
eigenvalue `α` becomes `α^r`. The open set need not have an `𝔽_q`-point. *Proof sketch.* The good-axis open is
Galois-stable by its construction; the residue field of a closed point of this finite-type `𝔽_q`-scheme
is a finite extension; descend the incidence equation and the finite-presentation local conditions;
transport the ℓ-adic realization along the base extension. (Weil I, §7.1, p. 299.) *Needs:* 3.4;
Mathlib `finite_of_finite_type_of_isJacobsonRing` (residue fields of closed points of schemes of finite type
over a field); SchemeAndStackFoundations Layer 0, §0.9 (spreading out of finitely presented data); SchemeAndStackFoundations §0.29 (`qPowerFrobenius`); EtaleCohomologyFoundations §§F.10.1–F.10.2b (finite-field descent);
EtaleCohomologyFoundations §§F.1–F.2.

**Checks.**

- The descent theorem supplies a finite extension rather than claiming a rational axis over every small finite field.
- A Frobenius eigenvalue `α` becomes `α^r` after the extension; this is how statements about Frobenius eigenvalues are transported from `𝔽_{q^r}` back to `𝔽_q`.
- For an axis already rational over `𝔽_q`, take the extension degree to be one and retain the same Frobenius.

### 3.6 Arithmetic specialization of global monodromy

**Theorem (full geometric monodromy under arithmetic specialization).** Prove
`LefschetzPencil.arithmeticGlobalMonodromy`: let `A` be an integral scheme of finite
type over `ℤ`, `C→A` a smooth relative curve with geometrically connected fibres,
`u:A→C` a section, and `ℱ_i` a finite collection of lisse finite free `O_i`-adic systems
on `C`, where `O_i` is the ring of integers of a finite extension of `ℚ_{ℓ_i}` and
every `ℓ_i` is invertible on `A`. After shrinking `A`, the joint images of
`π₁(C_a,u(a))` on the fibres of the `ℱ_i` modulo every power of their maximal ideals
are fibres of compatible finite locally constant group sheaves on `A`. Their inverse
limit identifies the full compact geometric images under transport, up to the
conjugation determined by the chosen paths. Preserve specified morphisms of systems,
tensor pairings and Tate twists in these identifications.

If `C=C̄−D` for a smooth proper relative curve with finite étale boundary, preserve
the boundary-inertia images as well, including their finite wild parts. For a
Lefschetz pencil over an arbitrary algebraically closed field, descend the pencil,
axis, base section, smooth locus, finite boundary, ordinary local equations, cup pairing and the
local vanishing-cycle maps together with the selected finite collection of integral
cohomology systems. After shrinking an arithmetic parameter base, transport their
rational realizations and all transported vanishing cycles, up to sign, to a closed
finite-field fibre. Thus the global image, its boundary reflections and the subspace generated by
their vanishing cycles identify at each selected coefficient prime. For a pairing of
coefficient primes, make this choice for that pair; no single open for all primes is
asserted.

*Proof sketch.* Descend the finite-presentation geometric data and use proper and
smooth base change for their cohomology and cup maps. For the joint residual
representation, take the component through the identity section of the finite étale
isomorphism cover between the residual systems and their pullbacks from `u`.
After shrinking, its fibrewise deck groups are locally constant. Normalize a proper
compactification of this initial cover; after a finite radicial base change and
shrinking it is a smooth proper relative curve with finite étale boundary. The
remaining congruence tower has pro-`{ℓ_i}` group. Prime-to-residue-characteristic
specialization applies to this tower on the initial cover, retaining the initial
finite cover itself, even when its group has order divisible by the residue
characteristic. Boundary stabilizers recover full inertia images; the compatible
local vanishing-cycle maps transport their distinguished lines and reflections.
(Weil II Proposition 1.11.1 and Remarks 1.11.2–1.11.3, pp. 184–185; Proposition
4.4.5, p. 229.) *Needs:* 0.6–0.8, 2.7–2.8, 3.1–3.5;
EtaleCohomologyFoundations §§F.0–F.4, F.6;
SchemeAndStackFoundations §§0.9, 0.20–0.21, 0.23–0.23a (descent, finite
normalization, universal homeomorphisms and étale invariance);
InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 (prime-to-residue-characteristic
specialization of smooth proper curves with finite étale boundary);
ArithmeticGaloisDuality R02.1 (integral continuous realizations).

**Checks.**

- A pencil over `ℂ`, or one with transcendental coefficients in characteristic `p`,
  acquires a finite-field fibre with the same selected global image and transported
  reflections; descent of its equations alone does not supply that identification.
- In characteristic two the cover `y²−y=1/t` of `𝔾_m` has global image `ℤ/2` and
  wild inertia at `t=0`. For odd coefficient primes its finite initial cover is
  retained; replacing the original fundamental group by its prime-to-two quotient
  would lose this image.
- A constant integral system has identity geometric image at every finite level
  and in the inverse limit; specialization preserves that zero-monodromy case.
- For a selected prime and one auxiliary prime the joint residual cover and both
  congruence towers use one common parameter open and one finite-field fibre.

### Examples

- A line in `P²` with an axis point off it: `S = ∅`, `f : X̃ = X → D` is an isomorphism.
- A smooth quadric surface in `P³` (`p ≠ 2`) with a general line as axis: two singular fibres, each a pair of
  lines; `χ(X̃) = 6 = 2·2 + 2·1`.
- A smooth cubic surface (`p = 0`) with a general axis: twelve nodal plane cubics, the degree `3 · 2²` of the dual
  surface; `χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1`.
- The Hermitian curve `x^{q+1} + y^{q+1} + z^{q+1} = 0`, `q = p^e`, `p` odd: every tangent line meets it with
  multiplicity at least `q ≥ 3`, so no pencil of lines is Lefschetz in this embedding, while a general pencil of
  conics (`r = 2`) is.

### Dependencies

Layer LPV.2; AlgebraicModuliForArithmeticGeometry Layer 1 (projective bundles, Grassmannians, relative very
ampleness); TauCetiRoadmap StableReduction Layer 4 (blow-ups); SchemeAndStackFoundations Layer 0; Mathlib's Jacobian criterion and
`AdicCompletion`;
EtaleCohomologyFoundations §§F.1–F.4, F.6–F.7, F.10.1–F.10.2b;
InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 (prime-to-residue-characteristic
specialization after the finite initial cover); ArithmeticGaloisDuality R02.1.

## Layer LPV.4: Global vanishing cycles

For a Lefschetz pencil this layer describes the direct images `R^i f_*ℚ_ℓ` on the parameter line, defines
the vanishing subspace `E` of the middle cohomology of a smooth fibre by transporting the local vanishing
cycles along étale paths, proves the fixed-space lemma for the local transvections and reflections, and
constructs the nondegenerate pairing on the radical quotient `E/(E ∩ E^⊥)`. It then computes the cohomology
of the total space of the pencil in terms of `X` and the axis. The reduction of the middle cohomology of the
total space to `H^1` of the middle direct image uses the conjugacy and generation theorems and is therefore
stated in Layer LPV.5 (5.5). Throughout, `(X_t)_{t∈D}` is
a Lefschetz pencil of hyperplane sections of `X` (3.1). The definitions and transport API of 4.2
apply in every characteristic, using 2.7 in the characteristic-two even branch; the tame
direct-image and generation results retain `n` odd or `p ≠ 2`. Throughout, `U = D − S`,
`j : U → D`, `u ∈ U` is a geometric point, `ℓ ≠ p`, and coefficients are `ℚ_ℓ`; `E` denotes the vanishing
subspace, not a coefficient field. `π_1(U, u)` and étale paths are those of
EtaleCohomologyFoundations §F.0.

### 4.1 The direct images of a pencil

**Theorem.** Assume `n` odd or `p≠2`. Then `R^n f_*ℚ_ℓ` is lisse on `U` and tamely ramified at every `s ∈ S`. Let `δ_s` be the vanishing cycle at
`s` (2.8), transported to `X_u` along a path; whether `δ_s` is zero does not depend on the path.
If `S=∅`, all direct images are constant and `E=0`. For `S≠∅` the two cases are:

- (a) If `δ_s ≠ 0` for every `s ∈ S`: `R^i f_*ℚ_ℓ` is constant on `D` for `i ≠ n`, and `R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ`.
- (b) If `δ_s = 0` for every `s ∈ S`, then `n = 2m + 1` is odd: `R^i f_*ℚ_ℓ` is constant for `i ≠ n + 1`,
  there is an exact sequence `0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0` with `ℱ` constant, and `E = 0`.

For `S≠∅`, Layer LPV.5 proves, from the conjugacy of the vanishing cycles, that one of (a) and (b) holds.
*Proof sketch.* `f` is smooth and proper over `U`, so the
`R^i f_*ℚ_ℓ` are lisse there (EtaleCohomologyFoundations §§F.2–F.3). At `s ∈ S` apply 2.8 to
`X̃ ×_D D_(s)`: inertia acts through `t_ℓ` or the quadratic character, so the ramification is tame, and the
local description of the direct images holds at `s`. A sheaf lisse on all of `D = P¹_k` is constant, since
`π_1(P¹_k) = 1`: a connected finite étale cover `Y → P¹_k` of degree `d` has `g_Y − 1 = −d` by Riemann–Hurwitz
(SchemeAndStackFoundations Layer 3, §3.2, `scheme_riemann_hurwitz`), so `d = 1`; this gives (a) and, in
degree `n + 1`, (b), where the local skyscraper sequences glue and `ℱ = j_*j^*R^{n+1}f_*ℚ_ℓ`. (Weil I, §5, (5.8)
and (5.8) a) 1)–2), b), pp. 292–293; (5.13) D), p. 294.) *Needs:* 3.1, 2.8; EtaleCohomologyFoundations §§F.2–F.3; InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3.

**Checks.**

- The quadric-surface pencil (`n = 1`, `|S| = 2`) is in case (b): `R² f_*ℚ_ℓ` has an extra `ℚ_ℓ(−1)` at each
  singular fibre.
- The line-in-plane pencil has `S=∅` and even fibre dimension `n=0`, with
  `R⁰f_*ℚ_ℓ=ℚ_ℓ` and all higher direct images zero. Every `δ_s` is vacuously zero;
  no oddness follows.

- For the conic pencil, the degree-zero direct image has the order-two swap at each critical point and equals its `j_*` extension.

### 4.2 The vanishing subspace

**Construction.** Fix `ℚ_ℓ(1) ≅ ℚ_ℓ` (k is algebraically closed). For `s ∈ S` an étale path from `u` to a
geometric generic point of `D_(s)` transports the local vanishing cycle of 2.7–2.8 to
`LefschetzPencil.vanishingCycle s γ ∈ H^n(X_u, ℚ_ℓ)(m)`, defined up to sign once the path is fixed; changing the
path changes it by an element of `π_1(U, u)`. The **vanishing subspace** `LefschetzPencil.vanishingSubspace`
`E ⊂ H^n(X_u, ℚ_ℓ)` is the span of all transports `g δ_s` (`g ∈ π_1(U, u)`, `s ∈ S`). It does not depend on the paths
and is `π_1(U, u)`-stable; only `E`, not the individual oriented vectors, is path independent. For suitable
paths `E` is already spanned by the `δ_s`, `s ∈ S`, when `n` is odd or `p ≠ 2` (5.3).
In the characteristic-two even branch retain the span of all transports; a single vector
per singular value need not span it. An element of the inertia at `s` acts on `H^n(X_u)` by
`x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s` (`n` odd), and by the reflection in `δ_s` when `ε_s(σ) = −1` (`n` even), using the possibly wild character
of 2.7 when `p=2`.

- `LefschetzPencil.vanishingCycle`: `vanishingCycle (s : S) (γ : path u ⇝ η̄_s) : H^n(X_u, ℚ_ℓ)(m)`, up to sign.
- `LefschetzPencil.vanishingCycle_changePath`: `vanishingCycle s (g · γ) = ± g • vanishingCycle s γ` for `g ∈ π₁(U, u)`.
- `LefschetzPencil.vanishingSubspace`: `E : Submodule ℚ_ℓ (H^n(X_u, ℚ_ℓ))`, the span of all vanishing cycles for all paths.
- `LefschetzPencil.vanishingSubspace_stable`: `g • E = E` for every `g ∈ π₁(U, u)`.
- `LefschetzPencil.localMonodromy_vanishingCycle`: `σ` in the inertia at `s` acts on `H^n(X_u)` by `x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s` (`n` odd), and by the reflection in `δ_s` when `ε_s(σ) = −1` (`n` even), with `ε_s` from 2.7 when `p=2`.

*Proof sketch.* The local vanishing cycle lives in `H^n` of the geometric generic fibre of `X̃ ×_D D_(s)`, and a path
identifies that fibre functor with the one at `u`; a change of path is an element of `π_1(U, u)`, so the set of
all transports is stable and so is its span; the local monodromy is the Picard–Lefschetz formula of 2.8
transported along the path; in the wild branch use 2.7 instead. (Weil I, §5, (5.2), p. 290;
(5.8) a) 3), p. 292; Weil II 4.2.3.) *Needs:* 3.1, 2.7 (all characteristics), 2.8 (tame branch);
EtaleCohomologyFoundations §F.0 and EtaleCohomologyFoundations §§F.2–F.3 (paths and transport).

**Checks.**

- `LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre`: If `S = ∅` (a line in `P²`) then `E = 0`.
- `LefschetzPencil.vanishingSubspace_quadric_surface`: Quadric-surface pencil: `|S| = 2` but each `δ_s` lies in `H^1` of a conic, which is 0, so `E = 0` (case (b)).
- `LefschetzPencil.vanishingSubspace_conic`: `n = 0`, `X` a smooth conic in `P²`, `p ≠ 2`, `A` a general point: `X_u` is two points, `|S| = 2` (the tangents from `A`), `δ_s = ±(e₁ − e₂)` for both `s`, `E = ℚ_ℓ(e₁ − e₂)` and `E^⊥ = ℚ_ℓ(e₁ + e₂)`.
- `LefschetzPencil.wild_twisted_cubic`: in characteristic two the basepoint-free pencil
  `[s:t]↦[s³+t³:st²]` on the twisted cubic has one singular value, infinity. For finite
  `a`, `x³+ax+1` is separable since its derivative is `x²+a` and substitution leaves `1`.
  The infinity fibre is `2[∞]+[0]`; locally `v=u²/(1+u³)` has an ordinary double point.
  The connected degree-three cover has transitive monodromy and inertia a transposition,
  hence image `S₃`. For odd `ℓ`, all transports of `e₁−e₂` span the two-dimensional
  sum-zero plane in `ℚ_ℓ³`; one vector at the sole singular value cannot span `E`.
- `LefschetzPencil.vanishingCycle_depends_on_path`: For the shear `ρ(g)(x, y) = (x + gy, y)` on `ℚ²`, `δ = (0, 1)` and `g = 1`, the transport `gδ = (1, 1)` is neither `δ` nor `−δ`: individual vanishing cycles depend on the path, while their span does not.

### 4.3 The fixed space of the local transvections

**Lemma.** Let `V` be a finite-dimensional vector space over a field `K` with a symmetric or alternating
bilinear form `( , )`, `(δ_s)_{s∈S}` an arbitrary family in `V`, `E` its span, and `T_s(x) = x + c_s(x, δ_s)δ_s` with
`c_s ∈ K^×` (Mathlib's `LinearMap.transvection` of the functional `c_s(·, δ_s)` and the vector `δ_s`: a transvection
when `(δ_s, δ_s) = 0`, a reflection when `c_s(δ_s, δ_s) = −2`). Then `⋂_s Fix(T_s) = E^⊥`. If `δ_s = 0` then `T_s = id`
and `δ_s` contributes nothing to `E`. Arbitrary indexing permits the full transported
orbit of 4.2, including the wild branch. State it as `LefschetzPencil.fixedSpace_localTransvections`.
*Proof sketch.* `T_s x = x` iff `c_s(x, δ_s)δ_s = 0` (Mathlib `LinearEquiv.mem_fixedSubmodule_transvection_iff` for
an isotropic `δ_s`, the same computation for a reflection), iff `(x, δ_s) = 0` when `δ_s ≠ 0`; intersecting gives
`E^⊥` (Mathlib `LinearMap.BilinForm.orthogonal` of the span). (Weil I, §5, Proposition (5.3), p. 290.) *Needs:*
Mathlib `LinearMap.transvection`, `LinearEquiv.transvection`,
`LinearEquiv.mem_fixedSubmodule_transvection_iff`, `LinearMap.BilinForm.orthogonal`.

**Checks.**

- `fixedSpace_symplectic_plane`: on `ℚ²` with the standard alternating form and one `δ ≠ 0`, `Fix(T) = ℚδ = δ^⊥`;
  for `δ = 0`, `T = id` and `Fix(T) = V = E^⊥`.
- `fixedSpace_reflection`: on `ℚ²` with the dot product, `δ = (1, −1)` and `c = −1` (so `c(δ, δ) = −2`), `T` swaps the
  coordinates and `Fix(T) = ℚ(1, 1) = δ^⊥`.
- `fixedSpace_needs_nonzero_coefficient`: with `c_s = 0` the operator is the identity although `δ_s ≠ 0`; the
  lemma requires `c_s ≠ 0`.

### 4.4 The radical quotient and its pairing

**Construction.** With `( , ) = Tr(x ∪ y)` the cup-product pairing `H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n)`, perfect by
Poincaré duality, the subspace `E ∩ E^⊥` is the kernel of the restriction of `( , )` to `E`, so `( , )` induces a
nondegenerate form `ψ` on `V = E/(E ∩ E^⊥)` with values in `ℚ_ℓ(−n)`, alternating for `n` odd and symmetric for `n`
even. Monodromy preserves `ψ`; for `n` odd it gives a continuous representation
`ρ : π_1(U, u) → Sp(V, ψ)(ℚ_ℓ)`. The restriction of `( , )` to `E` can be degenerate: irreducibility and the open
image concern `V`, not `E`. Define `LefschetzPencil.vanishingQuotient`, `LefschetzPencil.vanishingForm`,
`LefschetzPencil.monodromyRep`.

- `LefschetzPencil.vanishingQuotient`: `E ⧸ (E ⊓ E^⊥)`, a finite-dimensional `ℚ_ℓ`-space with a `π₁(U, u)`-action.
- `LefschetzPencil.vanishingForm`: `ψ`, the form induced by `Tr(x ∪ y)`, with values in `ℚ_ℓ(−n)`.
- `LefschetzPencil.vanishingForm_nondegenerate`: `ψ` is nondegenerate.
- `LefschetzPencil.vanishingForm_isAlt`: `ψ` is alternating for `n` odd (`LinearMap.IsAlt`) and symmetric for `n` even.
- `LefschetzPencil.monodromyRep`: `ρ : π₁(U, u) →* Sp(vanishingQuotient, ψ)` for `n` odd, continuous.
- `LefschetzPencil.vanishingProjection`: The quotient map `E → E/(E ∩ E^⊥)`.
- `LefschetzPencil.vanishingForm_mk`: The pairing of the classes of `x` and `y` is `B(x, y)`, with values in `ℚ_ℓ(−n)` in the geometric case.
- `LefschetzPencil.vanishingQuotient_lift`: Any linear functional on `E` killing `E∩E⊥` uniquely descends through the quotient.
- `LefschetzPencil.vanishingQuotient_lift_comp`: Composition of the descended map with the quotient projection is the original map.

*Proof sketch.* The kernel of `( , )|_E` is `E ∩ E^⊥` by definition, so the induced form is nondegenerate.
`Tr(x ∪ y) = (−1)^{n²} Tr(y ∪ x)` and `x ∪ x = 0` for `n` odd, by graded commutativity.
For the smooth proper restriction `f_U = f|_{f^{-1}(U)}`, use EtaleCohomologyFoundations §F.6's relative trace morphism
`Tr_{f_U} : R^{2n}(f_U)_*ℚ_ℓ(n) → ℚ_{ℓ,U}`. Its naturality and base-change compatibility,
together with those of cup product, give a morphism of lisse sheaves
`R^n(f_U)_*ℚ_ℓ ⊗ R^n(f_U)_*ℚ_ℓ → ℚ_{ℓ,U}(−n)`.
Thus `π_1(U, u)` preserves the pairing without a connectedness hypothesis on the fibres;
it preserves `E` by 4.2, hence also `E^⊥` and the quotient.
(Weil I, §5, (5.9), p. 293; SGA 4 XVIII 3.2; Stacks §59.66, tag 03SH for dimension zero.)
*Needs:* 4.2; EtaleCohomologyFoundations §F.6 (Poincaré duality and the relative trace, with EtaleCohomologyFoundations §F.4's adic realization);
EtaleCohomologyFoundations §0.8 (`ClassicalAlgebraic.finiteTrace`) for dimension zero;
Mathlib `LinearMap.BilinForm.orthogonal`, `LinearMap.IsAlt`,
`Submodule.mkQ`. The descended form is Mathlib's `LinearMap.IsRefl.liftQ₂` of the restriction to `E`;
its nondegeneracy and, for alternating `B`, its alternation give the stated pairing.

**Checks.**

- The standard form on `ℚ⁴` with `B(e₀,e₁)=B(e₂,e₃)=1` and all other upper-triangular entries zero is alternating; its matrix has determinant one, hence it is nondegenerate.
- `LefschetzPencil.vanishingQuotient_zero`: For `E = 0` in the four-dimensional symplectic space of the next check the quotient is zero; this is the situation of the quadric-surface pencil.
- Over `ℚ` with basis `e₀,e₁,e₂,e₃` and `B(e₀,e₁)=B(e₂,e₃)=1`, `E=span(e₀,e₁,e₂)` has radical `ℚe₂` and quotient dimension two; `span(e₀,e₂)` has quotient dimension zero.
- `LefschetzPencil.vanishingQuotient_conic`: For the dot product on `ℚ²` and `E = ℚ(1, −1)`, the radical is zero, the quotient is a line and the generator has square two; this is the radical quotient of the conic pencil.
- For the conic pencil with `n = 0` and `p ≠ 2`, the source of the relative trace has rank two:
  `H⁰(X_u,ℚ_ℓ) = ℚ_ℓ²`. The trace `(a,b) ↦ a+b` is invariant under the coordinate swap.
  Cup product is componentwise, so `Tr(x ∪ y) = x₁y₁+x₂y₂`, the dot-product pairing,
  also invariant under the swap.
- `LefschetzPencil.vanishingForm_on_E_degenerate`: The restriction of the standard symplectic form of `ℚ⁴` to `span(e₀, e₁, e₂)` is degenerate, whereas the induced form on the quotient is nondegenerate.

### 4.5 The cohomology of the total space

**Theorem (restriction and Gysin formulas).** For a transverse-axis pencil with centre `Z = A ∩ X` and
blow-up `π : X̃ → X` (3.3), the blow-up formula of EtaleCohomologyFoundations §F.7 identifies
`H^i(X̃) = H^i(X) ⊕ H^{i−2}(Z)(−1)` by `π^*` plus the exceptional Gysin map; its inverse carries the exceptional
minus sign. For a smooth fibre `Y` of the pencil, with `m : Y → X` and `h : Z → Y` the inclusions, restriction
sends `(a, b)` to `m^*a + h_*b` and the fibre Gysin map sends `y` to `(m_*y, −h^*y)`. For an empty centre (a curve)
there is no exceptional summand and the formulas are ordinary restriction and Gysin on `X`. *Proof sketch.*
Take the blow-up formula from EtaleCohomologyFoundations §F.7; compute restriction and fibre Gysin through the normal bundle of the
exceptional divisor; check both signs with the self-intersection and projection formulas of EtaleCohomologyFoundations §F.6; use
weak Lefschetz below the middle degree to identify the ambient and axis images. (SGA 7 II, Exposé XVIII,
§§2–4 and 5.1, pp. 5–27 (book pp. 259–281).) *Needs:* 3.3; EtaleCohomologyFoundations §F.6 (Gysin maps, self-intersection formula) and EtaleCohomologyFoundations §F.7 (blow-ups, weak Lefschetz).

**Checks.**

- For an empty centre the formula is ordinary restriction and Gysin on `X`.
- For a surface blown up at a point the exceptional class has square `−1`, which detects the sign of the
  inverse.

- For the two-point centre of a quadric-surface pencil, the exceptional summand is two copies of `ℚ_ℓ(−1)` in degree two.

**Application (hypersurfaces outside the middle degree).** For a smooth projective hypersurface `Y` of
dimension `n` over an algebraically closed field, `H^i(Y, ℚ_ℓ)` for `i ≠ n` is that of projective space: `ℚ_ℓ(−i/2)`
generated by the power of the hyperplane class for `i` even with `0 ≤ i ≤ 2n`, and zero for `i` odd; above the middle
degree the generators are the duals. In a sufficiently ample pencil of hypersurface sections this identifies
the constant direct images and isolates the middle vanishing quotient. The middle cohomology is not
asserted to be of Tate type. *Proof sketch.* Weak Lefschetz below `n`, projective-space cohomology, and
Poincaré duality above `n`. (Weil I, Remarque 5.12, p. 294.) *Needs:* 4.1; EtaleCohomologyFoundations §F.6, EtaleCohomologyFoundations §F.7 (weak Lefschetz, and the cohomology of projective space from the projective-bundle
formula).

**Checks.**

- A smooth cubic surface has `b_0 = b_4 = 1`, `b_1 = b_3 = 0`; its `b_2 = 7` is a middle-degree contribution.
- An odd-dimensional smooth hypersurface has its only odd contribution in degree `n`.

- A smooth conic (`n=1`) has only `H⁰=ℚ_ℓ` and `H²=ℚ_ℓ(−1)` outside its zero middle group.

### Examples

- The conic pencil (`n = 0`, `X` a smooth conic in `P²`, `p ≠ 2`, axis a general point): `X_u` is two points, `|S| = 2`
  (the two tangents through the axis point), `δ_s = ±(e_1 − e_2)` for both `s`, `E = ℚ_ℓ(e_1 − e_2)`, `E^⊥ = ℚ_ℓ(e_1 + e_2)`,
  and `E/(E ∩ E^⊥)` is a line with `ψ(δ, δ) = 2`.
- The quadric-surface pencil: each `δ_s` lies in `H^1` of a conic, which is zero, so `E = 0`.
- Linear algebra of the radical quotient: on `ℚ⁴` with `B(e_0, e_1) = B(e_2, e_3) = 1`, `E = span(e_0, e_1, e_2)` has radical
  `ℚe_2` and quotient of dimension two, while `span(e_0, e_2)` is totally isotropic with quotient zero.

### Dependencies

Layers LPV.2 and LPV.3;
EtaleCohomologyFoundations §§F.0, F.2–F.3;
EtaleCohomologyFoundations §F.6, EtaleCohomologyFoundations §F.7; InverseGaloisAndArithmeticFundamentalGroups
§§IG.1.2–IG.1.3; Mathlib (`LinearMap.transvection`, `LinearEquiv.mem_fixedSubmodule_transvection_iff`,
`LinearMap.BilinForm.orthogonal`, `LinearMap.IsAlt`).

## Layer LPV.5: Conjugacy, monodromy and the open image theorem

This layer proves the global monodromy theorems for a Lefschetz pencil: a general line sees the whole
monodromy of the complement of the dual variety, the vanishing cycles are conjugate up to sign, the
geometric monodromy is topologically generated by the local transvections (so that `E^⊥` is the space of
global invariants), and the radical quotient `E/(E ∩ E^⊥)` is absolutely irreducible. With these it states the
middle-degree reduction of Deligne's first proof, and then proves the Kazhdan–Margulis theorem: for `n` odd
the monodromy image is open in `Sp(E/(E ∩ E^⊥))(ℚ_ℓ)`. It ends with the characteristic-two branch and the
even-dimensional alternative: orthogonal monodromy is open or finite, and finite monodromy is the Weyl
group of a root system of type A, D or E, together with the gcd lemma for Frobenius polynomials. The
notation of Layer LPV.4 is kept.

### 5.1 Bertini for monodromy images

**Theorem.** Let `W ⊂ P̌` be a dense open subset and `F` a lisse `ℚ_ℓ`-sheaf of finite rank on `W` (for instance
`W = P̌ − X̌` and `F = R^n g_*ℚ_ℓ` for the incidence family of 3.2, or, in 7b.10, any open over which the direct
images of a constructible complex are lisse). For a sufficiently general line `D ⊂ P̌`, with `V = D ∩ W` and
`u ∈ V`, the images of `π_1(V, u)` and of `π_1(W, u)` in `GL(F_u)` coincide. The general line depends on `F`: no single
open set of lines is claimed to work for every finite cover or every representation. The cases where `W`
contains no line, or where the dual is empty or linear, are treated separately (3.5).

The proof uses Bertini's irreducibility theorem, which is part of this target: if `X` is geometrically
irreducible of finite type over a field and `g : X → P^r` is a morphism with `dim g(X) > s`, then `g^{−1}(L)` is
geometrically irreducible for the generic linear subspace `L` of codimension `s` (SGA 7 II, Exposé XVIII, 6.1.6.1,
p. XVIII-61; Jouanolou, *Théorèmes de Bertini et applications*, Progress in Math. 42 (1983), Théorème 6.3).
For the complement of a hypersurface `Z ⊂ P^r` the conclusion holds for the tame fundamental groups and every line
meeting `Z` transversally in smooth points, and the local inertia homomorphisms are conjugate when `Z` is
irreducible (SGA 7 II, Exposé XVIII, Proposition 6.1, pp. XVIII-58–XVIII-62).

*Proof sketch.* The image `H` of `π_1(W, u)` is compact; choose an open normal pro-ℓ subgroup `H_1` and let `H_2` be
its Frattini subgroup, open in `H` (`H_1` is a finitely generated pro-ℓ group). A closed subgroup of `H` that maps
onto `H/H_2` is all of `H`. The finite étale cover of `W` corresponding to `H/H_2` is irreducible, and by Bertini's
irreducibility theorem its restriction to a general line is irreducible, so `π_1(V, u)` maps onto `H/H_2`, hence
onto `H`. In the tame situation of a pencil, Abhyankar's lemma and the tame specialization theorem identify the
local inertia along the smooth locus of `X̌` with the inertia at the points of `S`. (Weil I, §5, proof of (5.4),
p. 291, and (5.8), p. 292; SGA 7 II, Exposé XVIII, 6.1, using SGA 1 XIII 2.8.) *Needs:* 3.2, 3.4; InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3
(§IG.1.2 tame quotients, §IG.1.3 tame specialization); AbhyankarLemma §§3.3–3.4
(Abhyankar's lemma for a regular divisor and its normalization, Stacks 0EYG/0EYH);
AlgebraicModuliForArithmeticGeometry Layer 1, §1.3 (Grassmannian of lines).

**Checks.**

- `bertini_conic`: over `ℂ`, for `X` a smooth conic in `P²` the dual is a conic, `π_1(P̌² − X̌) = ℤ/2`, and a general line
  `D` meets `X̌` in two points; over `ℂ`, `π_1^ét(D − S) = ℤ̂` maps onto `ℤ/2`
  (the analytic fundamental group is `ℤ` before profinite completion).
- `bertini_needs_generality`: a line contained in `X̌`, or tangent to `X̌` at a smooth point, does not meet the
  hypotheses, and the restriction of the double cover of the conic example to a tangent line is not
  irreducible.
- For a constant rank-one local system, both monodromy images are trivial on any line meeting the dense open.

### 5.2 Conjugacy of the vanishing cycles

**Theorem.** For every Lefschetz pencil in the tame branch (`n` odd or `p ≠ 2`), the vanishing cycles `±δ_s`, `s ∈ S`, are
conjugate up to sign under `π_1(U, u)`: for `s, s' ∈ S` there is `g` with `gδ_s = ±δ_{s'}`. Consequently one vanishing cycle
is zero exactly when all are (`LefschetzPencil.vanishingCycle_eq_zero_iff_forall`), and one of the two cases of
4.1 always holds. The characteristic-two even branch is 5.9. *Proof sketch.* The dual variety is irreducible
(3.2), so the smooth locus of `X̌` is connected and the local inertia groups at its generic point form one
conjugacy class in `π_1(P̌ − X̌)`; Abhyankar's lemma controls the ramification of `R^n g_*ℚ_ℓ` along that smooth
locus. The unique polar-nondegenerate critical point makes the dual smooth at each critical
hyperplane; the incidence local equation has a polar-nondegenerate quadratic part and a smoothing
parameter. Regularity of the pencil total space makes that parameter a uniformizer, so `D` meets
the dual transversely there. Apply the transverse-line tame statement of SGA 7 XVIII 6.1
(in 5.1), which holds for every such line, to transport conjugacy to `π_1(U, u)`; transporting the primitive vanishing
generator along the conjugacies gives `±gδ`. An empty `S` is trivial. (Weil I, §5, Théorème (5.4) and its proof,
pp. 290–291; (5.8), p. 292; SGA 7 XVIII, 6.1.1–6.1.2, pp. XVIII-58–59.) *Needs:* 3.2, 4.2, 5.1, 2.8; InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3;
AbhyankarLemma §§3.3–3.4 (Abhyankar's lemma for a regular divisor and its normalization, Stacks 0EYG/0EYH).

**Checks.**

- The conic pencil (`n = 0, p ≠ 2`): both vanishing cycles are `±(e₁ − e₂)`.
- The quadric-surface pencil: both vanishing cycles are 0, consistent with the rule that one zero vanishing cycle forces all to vanish.
- For a tame Lefschetz pencil of plane cubics, every nodal vanishing cycle is nonzero and conjugate up to sign, even without an additional general-line hypothesis.

### 5.3 Boundary inertia and generation by the local transvections

**Theorem (all-characteristic normal generation).** Let `k` be algebraically closed,
`S⊂ℙ¹_k` a finite set of closed points, `U=ℙ¹_k−S`, and `u` a geometric point of `U`.
Then `π₁(U,u)` is the closed normal subgroup generated by the boundary inertia images
`I_s`, with their maps into `π₁(U,u)` chosen using any paths. For any continuous representation on a finite-dimensional
`ℚ_ℓ`-space, with compact image `H=ρ(π₁(U,u))`, prove
`LefschetzPencil.boundaryInertia_imageGeneration`:

```text
H = closure ⟨ g ρ(I_s) g⁻¹ : s∈S, g∈H ⟩.
```

No tameness or pencil genericity is required. For a Lefschetz pencil, 2.7 identifies
these conjugates with the local operators for every transported vanishing cycle. Thus
`E^⊥=H^n(X_u,ℚ_ℓ)^{π₁(U,u)}` by 4.3, and the induced image on the radical quotient
is generated in the same way. This asserts normal generation by inertia subgroups;
it does not select one generating element per puncture.
*Proof sketch.* A finite quotient killing every boundary inertia gives a finite étale
cover of `U` unramified at the missing points. Normalization extends it to a finite étale
cover of `ℙ¹_k`, which is trivial by SchemeAndStackFoundations §3.2
(Riemann–Hurwitz, also used in 4.1). Finite quotients detect a
closed normal subgroup of a profinite group. Apply the continuous surjection to `H`
and use compactness to identify its quotient by the closed normal closure. Intersect
the fixed spaces of all transported local operators to obtain the invariant-space equality.
(Weil II 4.2.4–4.2.5, p. 220; Stacks Project Proposition 0BQM, unramified extensions.)
*Needs:* EtaleCohomologyFoundations §F.0 (finite-cover Galois categories and paths), EtaleCohomologyFoundations §F.3a (boundary-trait inertia);
SchemeAndStackFoundations §3.2
(`scheme_riemann_hurwitz`); 2.7 and 4.2–4.4 for the pencil application.

**Checks.**

- For `S=∅`, every finite cover is unramified everywhere, so both `π₁(ℙ¹_k)` and `H` are trivial.
- For the characteristic-two twisted-cubic pencil of 4.2, inertia has image a single
  transposition; its conjugates generate `S₃`, while one chosen transposition generates only `C₂`.
- In that example the transported roots span the sum-zero plane and their common
  orthogonal is the diagonal line, exactly the invariants of the permutation representation.

**Theorem (tame generation by chosen elements).** Assume `n` odd or `p ≠ 2`.
For a suitable choice of paths, the image of `π_1(U, u)` in `GL(H^n(X_u, ℚ_ℓ))` is topologically generated
by the local monodromies `T_s`, `s ∈ S`, with `T_s x = x ± (x, δ_s)δ_s` for a generator of the inertia at `s` (for `n` odd, one
with `t_ℓ(γ_s)` a chosen generator of `ℤ_ℓ(1)`; the sign is that of 2.8). Consequently `E = span(δ_s : s ∈ S)`,
`E^⊥ = H^n(X_u, ℚ_ℓ)^{π_1(U, u)}` (the common fixed space of the local operators of 4.3 is the full invariant space),
and the image of `π_1(U, u)` in `GL(E/(E ∩ E^⊥))` is topologically generated by the induced `T_s`. The equality of `E^⊥`
with the global invariants does not use hard Lefschetz or the nondegeneracy of `E`. *Proof sketch.* The tame
fundamental group of `P¹_k − S` is a quotient of the profinite completion of the fundamental group of the Riemann
sphere minus `|S|` points (lifting of tame covers to characteristic zero and Riemann existence; SGA 1, Exposé XIII,
Corollaire 2.12, as used in Weil I (5.8)); so it is topologically generated by inertia elements `γ_s`, `s ∈ S`, with
product one. This generation statement is part of the target; the tame fundamental group itself is
InverseGaloisAndArithmeticFundamentalGroups §IG.1.2. `R^n f_*ℚ_ℓ` is tame (4.1);
apply the local formulas of 2.8; take the closed subgroup generated by the local images; combine with the
fixed-space lemma 4.3. The characteristic-two even branch is not covered by the tame presentation. (Weil I, §5,
(5.8) and (5.8) a) 3), p. 292; Proposition (5.3), p. 290, and §§5.8–5.9, pp. 292–293.) *Needs:* 2.8, 4.1–4.4;
InverseGaloisAndArithmeticFundamentalGroups §IG.1.2; ComplexComparisonPartII §C6.2
(Riemann existence).

**Checks.**

- Conic pencil: the image is `ℤ/2`, generated by the swap of the two points, and the invariants are `ℚ_ℓ(e₁ + e₂) = E^⊥`.
- A three-dimensional subspace of a four-dimensional symplectic space can have a one-dimensional radical;
  the local-to-global equality does not need `E` nondegenerate.
- For a pencil with no singular fibres, the generating family is empty and its tame image is trivial since the local system extends over `ℙ¹`.

### 5.4 Absolute irreducibility

**Theorem.** For a Lefschetz pencil in the tame branch (`n` odd, or `p ≠ 2`), the representation of `π_1(U, u)` on
`V = E/(E ∩ E^⊥)` is absolutely irreducible when `V ≠ 0`; for `V = 0` it is the zero representation and is not called
irreducible. The statement persists after extending scalars to any finite extension of `ℚ_ℓ` or to `ℚ̄_ℓ`. *Proof
sketch.* Let `W` be a stable nonzero subspace after scalar extension. If some vanishing cycle `δ` has `(W, δ) ≠ 0`,
apply the local transvection or reflection to an element `w` with `(w, δ) ≠ 0` to get `δ ∈ W`, and conjugacy (5.2)
puts all transported cycles in `W`, so `W = V`. Otherwise `W` is orthogonal to `E`, hence zero in `V`. (Weil I, §5,
Corollaire (5.5) and its proof, p. 291; (5.13) D), p. 294.) *Needs:* 4.4, 5.2, 5.3.

**Checks.**

- The quadric-surface pencil has `E/(E ∩ E^⊥) = 0`; the conic pencil has a one-dimensional quotient.
- For a plane-cubic Lefschetz pencil, the quotient is the nonzero symplectic plane and has no invariant line even after scalar extension.
- For the conic pencil, the quotient is a one-dimensional sign representation, irreducible over every extension of `ℚ_ℓ`.

### 5.5 The middle-degree reduction

**Theorem.** Let `f : X̃ → D = P¹` be the proper incidence pencil with smooth locus `U`, `n = 2m + 1` odd, `V` the
restriction of `R^n f_*ℚ_ℓ` to `U`, `E ⊂ V` the vanishing local subsystem, `R = E ∩ E^⊥`, and `A = R^n f_*ℚ_ℓ = j_*V`.

1. The Leray filtration of `H^{n+1}(X̃)` has graded pieces `E_∞^{2,n−1}`, `E_∞^{1,n}`, `E_∞^{0,n+1}`, each an actual
   subquotient of its `E_2` term; the only possible differentials on a curve are
   `d_2^{0,b} : H^0(D, R^b f_*) → H^2(D, R^{b−1} f_*)`, and both the incoming and the outgoing ones at the two corner
   terms are retained; `E_∞^{1,n} = H^1(D, A)`.
2. (Nonradical case.) If the vanishing cycles are not in `R`, the sequences `0 → j_*E → A → C → 0` and
   `0 → j_*R → j_*E → j_*(E/R) → 0` have `C` and `j_*R` constant, so `H^1(j_*E) → H^1(A)` is surjective and
   `H^1(j_*E) → H^1(j_*(E/R))` is injective.
3. (Nonzero totally isotropic case.) If `0 ≠ E ⊂ E^⊥`, equivalently the global vanishing cycles
   are nonzero and lie in the radical by 5.2, put `F = coker(j_*E^⊥ → A)`. The sequences
   `0 → j_*E^⊥ → A → F → 0` (with `j_*E^⊥` constant) and `0 → F → j_*j^*F → ⊕_s i_{s*}L_s → 0` give an injection
   `H^1(A) → H^1(F)` and a surjection `⊕_s H^0(L_s) → H^1(F)`, where `L_s` is the evaluation line `ℚ_ℓ(m − n)` with its
   orientation character, after a finite extension of the residue field that makes the critical points and
   characters rational (3.5). Weil I prints the opposite twist in (7.1.5); pairing an untwisted class with
   `δ ∈ H^n(m)` lands in `ℚ_ℓ(m − n)`, while the printed numerical Frobenius eigenvalue is correct.
4. If `E = 0`, `A` is constant and `H^1(A) = 0`; `E^⊥ = V`, so the cokernel
   `F = coker(j_*E^⊥ → A)` is zero and the defect
   `coker(F → j_*j^*F)` is zero. The skyscraper contribution in degree `n + 1` (4.1(b)) remains.

No hard Lefschetz theorem, degeneration at `E_2` or splitting of the filtration is used. The hypotheses are
uniform over the critical points because the local vanishing cycles are conjugate (5.2), and `E^⊥` is the
global fixed subsystem (5.3), so `j_*E^⊥` is constant.

*Proof sketch.* Use the Leray spectral sequence of `Rf_*` and the cohomological dimension two of `P¹`; the lower
corner is `H^{n−1}(X_u)(−1)`, controlled by weak Lefschetz on the axis, and the upper constant quotient by the
surjective Gysin map `H^{n−1}(A ∩ X)(−1) → H^{n+1}(X_u)` (4.5). In the nonradical case use the inclusion
`j_*E → A`, the quotient `A → C` and the projection `j_*E → j_*(E/R)`, with `H^1(P¹, constant) = 0`. In the totally
isotropic case with `E ≠ 0`, form `F` from `j_*E^⊥`; each `δ_s` is nonzero by 5.2, so cup-product
evaluation onto its Tate line is surjective and identifies the local defect; the two long
exact sequences give the injection and the surjective boundary. Transport the middle maps through the
blow-up restriction and Gysin maps of 4.5. (Weil I, §7.1, (7.1.2)–(7.1.5), pp. 299–300; §5.8,
pp. 292–293.) *Needs:* 4.1, 4.2, 4.4, 4.5, 5.2, 5.3; 3.5; EtaleCohomologyFoundations §§F.2–F.3
(Leray); EtaleCohomologyFoundations §F.7.

**Checks.**

- For the quadric-surface pencil, `n = 1` and `|S| = 2`, but the smooth fibres are conics with
  `H¹ = 0`. Thus `V = E = A = F = 0` and `F → j_*j^*F` has zero defect; the two nonzero
  `ℚ_ℓ(−1)` skyscrapers belong to `R²f_*ℚ_ℓ` as in 4.1(b).
- For `n = 1`, `m = 0` and `E ≠ 0` in item 3, each defect evaluation line is `ℚ_ℓ(−1)`.
- Nonradical case: `H^1(j_*E)` surjects onto `H^1(A)` and injects into `H^1(j_*(E/R))`; totally isotropic case: `H^1(A)`
  injects into `H^1(F)` and the skyscraper boundary surjects onto `H^1(F)` when `E ≠ 0`.

### 5.6 The symplectic Lie algebra generated by transvections

**Lemma.** Let `V` be a finite-dimensional vector space over a field `k` of characteristic zero, `ψ` a nondegenerate
alternating form on `V`, and `𝔏 ⊂ 𝔰𝔭(V, ψ)` a Lie subalgebra (`𝔰𝔭(V, ψ)` is Mathlib's `skewAdjointLieSubalgebra ψ`). For
`δ ∈ V` let `N(δ) : x ↦ ψ(x, δ)δ`. If `V` is a simple `𝔏`-module (Mathlib `LieModule.IsIrreducible`) and `𝔏` is generated
as a Lie algebra by a family `N(δ_i)`, then `𝔏 = 𝔰𝔭(V, ψ)`. Define `LefschetzPencil.symplecticTransvectionGenerator` for
`N(δ)`. *Proof sketch.* `N(δ)` is skew-adjoint with `N(δ)² = 0`. The set `W` of `δ` with `N(δ) ∈ 𝔏` is a Zariski-closed
cone; `exp(λN(δ)) = 1 + λN(δ)` normalizes `𝔏`, so `δ'' + λψ(δ'', δ')δ' ∈ W` for `δ', δ'' ∈ W`, and `W` is a union of
pairwise orthogonal maximal linear subspaces, each stable under all `N(δ)`, `δ ∈ W`, hence `𝔏`-stable; simplicity
forces `W = V`, and the `N(δ)` span `𝔰𝔭(V, ψ) ≅ Sym² V`. (Weil I, §5, Lemme (5.11), p. 293, and its proof,
pp. 293–294.) *Needs:* Mathlib `skewAdjointLieSubalgebra`, `LieModule.IsIrreducible`, `LinearMap.IsAlt`,
`IsNilpotent.exp`.

**Checks.**

- `dim V = 2` with `ψ(e₁, e₂) = 1`: `N(e₁) = −E₁₂` and `N(e₂) = E₂₁` generate `sl₂ = sp(V, ψ)`, since their bracket is `−H`.
- `N(δ)` is quadratic in `δ`, `N(cδ) = c²N(δ)`, and lies in `sp(V, ψ)` with `N(δ)² = 0`, because `ψ(x, δ)(ψ(δ, y) + ψ(y, δ)) = 0` and
  `ψ(δ, δ) = 0` for alternating `ψ`; for a symmetric form the same formula is not skew-adjoint, and a definition linear in `δ`
  fails the first identity.
- The simplicity hypothesis is needed: the Lie algebra spanned by `N(e₁)` alone is one-dimensional, and `V` is not a simple module for it.

### 5.7 Compact subgroups of `Sp(V)(ℚ_ℓ)` and `O(V)(ℚ_ℓ)`

**Lemma.** Let `V` be a finite-dimensional `ℚ_ℓ`-vector space with a nondegenerate form `ψ`, alternating or symmetric,
with the canonical topology on `End(V)` and the subgroup topology on `GL(V)`; let `G(ψ)` be its isometry group,
`Sp(V, ψ)(ℚ_ℓ)` or `O(V, ψ)(ℚ_ℓ)`, which is closed in `End(V)`, being cut out by polynomial equations, and `𝔤(ψ)` its Lie
algebra of `ψ`-skew-adjoint endomorphisms (Mathlib's `skewAdjointLieSubalgebra ψ`). Let `H ⊂ G(ψ)` be a compact subgroup and
`𝔏 = {X ∈ 𝔤𝔩(V) : exp(tX) ∈ H for all t in a neighbourhood of 0 in ℚ_ℓ}`. Then `𝔏` is a `ℚ_ℓ`-Lie subalgebra of `𝔤(ψ)`; if
`h ∈ H` is unipotent, `h = exp(N)` with `N` nilpotent and `N ∈ 𝔏`; and if `𝔏 = 𝔤(ψ)` then `H` is open in `G(ψ)`. For `ψ`
symmetric, the orthogonal group and its topology are those of TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2. Closedness of `H` is essential: the group generated by the local monodromies is only dense in the
image of `π_1`. *Proof sketch.* The analytic structure on closed subgroups of an `ℓ`-adic Lie group, the
identification of `Lie(H)` as a Lie subalgebra, and openness when it is the full Lie algebra are TauCetiRoadmap
AdelicAlgebraicGroups Layer 4, §4.2 (closed subgroups of `p`-adic Lie groups; Schneider 2011, Theorem 27.1,
Exercise 26.2, Proposition 29.2 and Corollaries 29.4–29.6). If `exp(N) ∈ H`, its powers `exp(aN)`, `a ∈ ℤ`, lie in `H`,
and closedness extends `a` to `ℤ_ℓ`; differentiating this one-parameter subgroup gives `N ∈ 𝔏`. The argument does not use
the type of `ψ`. (Weil I, §5, proof of (5.10), p. 293; Schneider 2011, §§18.10–19, pp. 144–153; Exercise 26.2, pp. 181–182; Theorem 27.1,
pp. 192–194; Proposition 29.2 and Corollaries 29.4–29.6, pp. 202–205.) *Needs:* TauCetiRoadmap
AdelicAlgebraicGroups Layer 4, §4.2; Mathlib `skewAdjointLieSubalgebra`, `IsNilpotent.exp`.

**Checks.**

- `H = Sp(V)(ℤ_ℓ)` is compact and open with `𝔏 = sp(V, ψ)`; `H = {1}` has `𝔏 = 0`; the closure of the group generated by one unipotent `exp(N)`, `N ≠ 0`, is `exp(ℤ_ℓN)` with `𝔏 = ℚ_ℓN`.
- On a symplectic plane, the congruence subgroup reducing to identity modulo `ℓ` has the full `sl₂` Lie algebra and is open.
- The finite subgroup `{±1}` has zero Lie algebra; compactness alone does not imply full Lie algebra.

### 5.8 The Kazhdan–Margulis theorem

**Theorem (Kazhdan–Margulis).** Let `n` be odd. The image of `ρ : π_1(U, u) → Sp(E/(E ∩ E^⊥), ψ)(ℚ_ℓ)` is open. The statement
is for the `ℚ_ℓ`-model; openness in `Sp(V ⊗ E')(E')` for a larger coefficient field `E'` is not asserted. `V = 0` is
allowed (`Sp(0)` is trivial). *Proof sketch.* `H = ρ(π_1(U, u))` is compact; let `𝔏` be its Lie algebra (5.7). The inertia at
`s` maps onto `{exp(aN_s) : a ∈ ℤ_ℓ}`, `N_s = ±N(δ_s)`, since `t_ℓ` is onto `ℤ_ℓ(1)`, so `N_s ∈ 𝔏`. Let `𝔤_S ⊂ 𝔏` be generated by the
`N_s`. A `𝔤_S`-stable subspace is stable under each `N_s`, hence under `T_s = exp(±N_s)`, hence under the closed group
they generate, which is `H` (5.3); by 5.4 it is `0` or `V`. Lemma 5.6 gives `𝔤_S = 𝔰𝔭(V, ψ)`, so `𝔏 = 𝔰𝔭(V, ψ)` and `H` is open
by 5.7. (Weil I, §5, Théorème (5.10) and its proof, p. 293; Milne, *Lectures on Étale Cohomology*,
Lemmas 32.7–32.8, pp. 191–192.) *Lean:* `Suggested.lean` states `kazhdanMargulis`, the
closed-subgroup theorem on `Matrix.GeneralLinearGroup (Fin d) ℚ_[ℓ]`, for every prime `ℓ`
and every dimension `d`. A nondegenerate alternating form, preservation of the form,
topological generation by transvections with nonzero coefficients, and absence of proper
nonzero invariant subspaces imply openness in the form-preserving subgroup. The geometric
image satisfies these hypotheses by compactness, 5.3 and 5.4; dimension zero is included. *Needs:* EtaleCohomologyFoundations §F.3a, 4.4, 5.3, 5.4, 5.6, 5.7.

**Checks.**

- `V = 0` for the quadric-surface pencil, where the statement is trivial.
- A Lefschetz pencil of plane cubics (`X = P²` re-embedded with `r = 3`): `X̃` is `P²` blown up in 9 points, so `H^1(X̃) = 0`; the singular fibres are irreducible nodal cubics, so the vanishing cycles are nonzero; `f` has a section, so the Leray spectral sequence degenerates and the invariants `H^0(D, R^1 f_*ℚ_ℓ) ⊂ H^1(X̃)` vanish. Hence `E = H^1(X_u)` is two-dimensional with `E ∩ E^⊥ = 0`, and the image is open in `Sp₂(ℚ_ℓ) = SL₂(ℚ_ℓ)`.

- In a nonzero symplectic plane, the closure of one transvection is one-dimensional and not open; it fails the irreducibility and full-generation hypotheses.

### 5.9 Characteristic two

**Theorem.** In characteristic two and even fibre dimension (the branch of Weil II 4.2), keep the possibly wild
quadratic inertia characters of 2.7. For a transverse pencil whose axis lies in the generic open set of Weil II
4.2.7, the ordinary local vanishing cycles form one monodromy orbit up to sign after transport within the
pencil, and their transported span is stable under the monodromy of that pencil. Independence of the span
across different pencils is not asserted (Weil II 4.2.5 notes that it needs a theory of vanishing cycles over
higher-dimensional bases), and no tame generation statement is made for this branch. State it as
`LefschetzPencil.vanishingCycle_conj_of_charTwo`. *Proof sketch.* Keep the wild quadratic character in the local formula; choose the axis in the generic open of 4.2.7; apply 4.2.6–4.2.8
to connect critical fibres and compare transported local cycles; take the span of the orbit. (Weil II,
4.2.3–4.2.8, pp. 220–221.) *Needs:* 2.7, 3.4, 4.2; InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3;
EtaleCohomologyFoundations §§F.1–F.2.

**Checks.**

- Over `k[[t]]` in characteristic two, `x²+tx+t=0` gives a regular total space and a
  zero-dimensional ordinary special double point; `u=x/t` satisfies `u²+u=1/t`, a genuinely
  wild separable quadratic character exchanging the generic points.
- In characteristic two a conic pencil with axis off the conic and its nucleus has one ordinary
  double critical fibre; its two-point local system has wild order-two monodromy and one vanishing line.
- A pencil with no critical fibres has zero transported vanishing subspace.
- The twisted-cubic pencil of 4.2 has one critical value and a two-dimensional
  transported span; its three root lines form the `A₂` reflection orbit.

**Theorem (generic wild irreducibility).** Under the characteristic-two even and generic-axis
hypotheses above, `V=E/(E∩E^⊥)` is absolutely irreducible if nonzero. The full transported
reflection orbit spans `V`, and its reflections topologically generate the compact image.
*Proof sketch.* Apply all-characteristic normal generation (5.3) and the conjugacy above.
A stable subspace pairing nontrivially with a transported root contains that root by the
reflection formula, hence the whole orbit by conjugacy. A subspace orthogonal to every
root is zero in the radical quotient. This is the argument of 5.4 with the transported
orbit in place of one chosen cycle per puncture. (Weil II 4.2.5, 4.2.7–4.2.8,
pp. 220–221; Lemma 4.4.2ˢ, the symmetric case, p. 228.) *Needs:* 2.7, 4.2–4.4, 5.3 (normal generation),
the generic conjugacy theorem above.

**Checks.**

- The characteristic-two conic pencil has a one-dimensional absolutely irreducible sign representation.
- In the twisted-cubic example the sum-zero plane is the absolutely irreducible standard
  `S₃` representation over `ℚ_ℓ`, including `ℓ=3`; the coefficient field has characteristic zero.
- If `E=0`, the quotient is zero and is not called irreducible.

### 5.10 Even dimension: orthogonal monodromy

**Theorem.** Let `n` be even, and assume that the vanishing space `E` is nondegenerate over `ℚ_ℓ` (an explicit
hypothesis; in Weil II it is a consequence of hard Lefschetz). Assume `p ≠ 2`, or, when
`p=2`, that the pencil satisfies the generic-axis condition of 5.9. Use the full transported
orbit of 4.2: its cycles are conjugate up to sign by 5.2 or 5.9, and their reflections
topologically generate the compact image by all-characteristic normal generation (5.3).
Then the compact geometric monodromy image in `O(E)(ℚ_ℓ)` is open or finite. The
orthogonal group over `ℚ_ℓ`, its topology and its closedness are those of TauCetiRoadmap OrthogonalSpinGroups
Layers 0 and 2. *Proof sketch.* The reflections in the full transported orbit and its
conjugacy act on `E`; the alternative of Weil II
4.4.1–4.4.4 for the Lie algebra of the compact image (either zero or the full `𝔰𝔬(E)`, by irreducibility and the
reflection argument) and 5.7 for the symmetric form give the dichotomy. (Weil II, 4.4.1–4.4.4, pp. 227–229.)
*Lean:* `Suggested.lean` states the linear theorem as `orthogonalMonodromy_open_or_finite`:
a compact subgroup preserving a nondegenerate symmetric form, topologically generated by reflections
in a spanning family of roots forming one orbit up to sign, is open in the isometry group or finite.
Multiplying the geometric form by `(−1)^{n/2}` normalizes every root to square two.
*Needs:* 2.7, 4.2, 5.2 and 5.4 (tame conjugacy and irreducibility), or 5.9
(generic wild conjugacy and irreducibility),
5.3 (all-characteristic normal generation), 5.7; TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2; TauCetiRoadmap
AdelicAlgebraicGroups Layer 4, §4.2.

**Checks.**

- For the conic pencil the one-dimensional orthogonal image is finite of order two.
- In characteristic two the twisted-cubic pencil has nondegenerate sum-zero plane and
  finite image `S₃`; all transported reflections, rather than its sole chosen inertia image, generate it.
- The hyperbolic plane with matrix `[[0,1],[1,0]]` is isotropic and nondegenerate
  (determinant `−1`), so satisfies the form hypothesis; a space with nonzero radical fails it.

- For the zero space, its orthogonal group and monodromy image are trivial, hence both finite and open.

**Theorem (finite monodromy is a Weyl group of type A, D or E).** In the situation of 5.10, suppose `E ≠ 0` and the
geometric monodromy group `M` is finite. Use every transported vanishing cycle in the
reflection orbit, rather than one vector per singular value. Then, after changing the form
by `(−1)^{n/2}`, the vanishing cycles `δ` have
`(δ, δ) = 2`, their pairings are integers, they span a lattice `L` on which the form is positive definite, and they
form an irreducible root system all of whose roots have the same length, so of type A, D or E, with `M` its Weyl
group. *Proof sketch.* For the selected prime `ℓ` and each auxiliary `ℓ′` separately,
apply 3.6 to descend and specialize the pencil and both integral cohomology systems
to a common finite-field fibre, preserving their global images, pairings, boundary
inertia and transported reflection data. At `ℓ` the assumed nondegeneracy gives
`H^n=E⊕E^⊥`, with `E^⊥` fixed. At `ℓ′` put `R_{ℓ′}=E_{ℓ′}∩E_{ℓ′}^⊥` and
`W_{ℓ′}=E_{ℓ′}/R_{ℓ′}`. The filtration
`0⊂R_{ℓ′}⊂E_{ℓ′}⊂H^n` has fixed outer quotients `R_{ℓ′}` and `H^n/E_{ℓ′}`:
normal generation and 4.3 fix `E_{ℓ′}^⊥`, and each boundary operator is the identity
modulo `E_{ℓ′}`. All degrees other than `n` are fixed as well. The remaining
constituent `W_{ℓ′}` is absolutely irreducible when nonzero, by 5.4 or 5.9, and is
nontrivial since an even-dimensional vanishing cycle has square `±2` and its
reflection acts by `−1`. Thus removing trivial constituents from the alternating
cohomology recovers `E` at `ℓ` and `W_{ℓ′}` at `ℓ′`; no nondegeneracy of
`E_{ℓ′}` is assumed. For the finite quotient `M`, the trace formula for all powers of Frobenius
(InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3, trace formula for all powers) and Chebotarev density for the finite étale cover of `U`
(ArithmeticGaloisRepresentations Layer 5, §5.13, Chebotarev for function fields) compare these virtual characters
(Weil II, Lemmas 4.4.6 and 4.4.7). They identify the faithful finite action of `M` on
`E` with that on `W_{ℓ′}`, as quotients of the original geometric fundamental group,
and give the same rational integer character at every auxiliary prime. The images
of the transported cycles in `W_{ℓ′}` have the same self-pairing and define the
corresponding reflections. For two vanishing cycles, with `s_δ(x) = x − (x, δ)δ` and `P_δ = (·, δ)δ`,
`Tr(s_δ s_{δ'}) = dim E − Tr P_δ − Tr P_{δ'} + Tr(P_δ P_{δ'}) = dim E − 4 + (δ, δ')²`, so
`a = Tr(s_δ s_{δ'}) − dim E + 4 = (δ, δ')²` is an integer with a square root in `ℚ_ℓ` for every `ℓ ≠ p` (Weil II prints the
constant as `2` in place of `4` on p. 230; the argument is unchanged); abelian Chebotarev for `ℚ(√a)` (TauCetiRoadmap Chebotarev Layer 9)
makes `a` a square, so `(δ, δ') ∈ ℤ`. A rational basis of vanishing cycles gives the lattice (TauCetiRoadmap Completed
IntegralLattices Layer 1); averaging a positive form over the finite group and absolute irreducibility make the
invariant form positive definite; the roots form one conjugacy class, so the root system is irreducible and
simply laced, of type A, D or E (TauCetiRoadmap RepresentationTheory/RootSystems Layer 5), with `M` generated by the
reflections of the full transported orbit, by 5.3 in every characteristic. (Weil II,
4.4.5–4.4.9 including Lemmas 4.4.6–4.4.7, pp. 229–231.) *Needs:* 3.6, 4.3–4.4,
5.3–5.4 and 5.9 (fixed constituents and the irreducible quotient), 5.10;
ArithmeticGaloisRepresentations Layer 5, §5.13; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (trace formula for all powers);
TauCetiRoadmap Chebotarev Layer 9; TauCetiRoadmap Completed IntegralLattices Layer 1; TauCetiRoadmap
RepresentationTheory/CharacterTheory Layer 4 (rationality of character values); TauCetiRoadmap
RepresentationTheory/RootSystems Layer 5.

**Checks.**

- The conic-pencil root `δ=(1,−1)` gives `A₁` and its order-two Weyl group.
- In characteristic two the twisted-cubic pencil gives the six roots `±(e_i−e_j)`
  of `A₂`, with Weyl group `S₃`, although the base has only one singular value.
- Trace identity: for `δ' = δ`, `s_δ²` is the identity, of trace `dim E`, and `(δ, δ)² = 4`; for an `A₂` pair, `(δ, δ') = −1`
  in `E = span(δ, δ')`, `s_δ s_{δ'}` is a rotation of order three with trace `−1 = 2 − 4 + 1`. The constant `2` printed in
  Weil II would give `dim E + 2` and `1` in these two cases.
- The lattice `L` is the integral span of the vanishing cycles after the rationality argument; an arbitrary `ℤ_ℓ`-lattice stable under `M` is not a substitute.
- For a pencil over `ℂ` or with transcendental coefficients in characteristic `p`,
  3.6 supplies the finite-field trace comparison while preserving `M`; proper and
  smooth base change alone identify cohomology fibres, not this global image.
- If an auxiliary vanishing space has a fixed radical of dimension `r`, removing
  trivial constituents gives the character of `W_{ℓ′}`, of dimension
  `dim E_{ℓ′}−r`, rather than that of `E_{ℓ′}`. Pairings of roots are unchanged
  on passing to this quotient.

### 5.11 Frobenius polynomials of the fibres

**Lemma (gcd lemma).** Let `X_0` be smooth projective absolutely irreducible of dimension `n + 1` over `𝔽_q` with a
Lefschetz pencil defined over `𝔽_q` (sufficiently general when `p = 2` and `n` is even), `S` its singular set and `E(X_t)` the
vanishing part of `H^n(X_t)`. Assume that `E(X_t)` is nondegenerate in both parities;
in the geometric setting this is the hard-Lefschetz input of Weil II 4.3.9, retained as
an explicit hypothesis. Let `P(T) = ∏(1 − γ_i T)` and `Q(T) = ∏(1 − δ_j T)` with all `γ_i, δ_j ≠ 0`. If for every
`t ∈ (P¹ − S)(𝔽_{q^k})`, `k ≥ 1`, with `F` the Frobenius of `X_t` relative to `𝔽_{q^k}`,
`∏(1 − γ_i^k T)` divides `∏(1 − δ_j^k T) · det(1 − FT, E(X_t))`, then `P` divides `Q`. *Proof sketch.* Induct on `deg P`; for
`P = 1 − γT` with `γ` different from every `δ_j`, choose `N ≥ 1` such that `γ^k ≠ δ_j^k` for `k ≡ 1 mod N`.
Write `U_0 = (P¹ − S)_0`. Since `#U_0(𝔽_{q^k}) ≥ q^k + 1 − #S(𝔽̄_q)`, there is such a point for every sufficiently
large `k ≡ 1 mod N`. At one of these points the premise makes `γ^k` an eigenvalue of Frobenius on `E`.
The continuous arithmetic representation has compact image and hence a stable lattice
(EtaleCohomologyFoundations §F.4.0). Each operator and its inverse preserve that lattice, so its eigenvalues
are `ℓ`-adic units. Thus `γ` is a unit, a consequence of the premise. If `E = 0`, the rank-one premise is already
impossible at that point.

Choose a finite extension `L/ℚ_ℓ` containing `γ`. Its unit group `O_L^× = lim_r (O_L/𝔪_L^r)^×` is profinite.
Use the native `TauCeti.zHat`, whose multiplicative notation has `TauCeti.zHat.gen` for additive degree one,
and `TauCeti.zHat.lift` on `O_L^×` to obtain the continuous character `θ_γ : ℤ̂ → O_L^×`.
The native `TauCeti.zHat.lift_gen` and `TauCeti.zHat.lift_ofInt` give `θ_γ(1) = γ` and `θ_γ(k) = γ^k`
for every integer `k`.

Normalize `deg : π₁^ét(U_0, ū) → ℤ̂` so that geometric Frobenius at a degree-`k` closed point has degree `k`;
it is the negative of the arithmetic-Frobenius normalization of ArithmeticGaloisRepresentations §5.13.
The arithmetic fundamental-group sequence (EtaleCohomologyFoundations §F.0.A2) gives the compact diagonal image
`G = im(ρ, deg) ⊂ GL(E)(ℚ_ℓ) × ℤ̂`, with its subspace topology, and the exact sequence
`1 → M → G → ℤ̂ → 1`, where `M` is the geometric monodromy image.
Over `L`, the condition `det(ρ(g) − θ_γ(deg g) · Id) = 0` defines a closed conjugacy-invariant subset of `G`:
the matrix entries and `θ_γ ∘ deg` are continuous, the determinant is polynomial, and `L` is Hausdorff.
The premise places every closed-point geometric Frobenius with `deg ≡ 1 mod N` in this subset.
Profinite Chebotarev (ArithmeticGaloisRepresentations Layer 5, §5.13), with its arithmetic Frobenius classes inverted,
makes these conjugacy classes dense in the clopen slice `deg ≡ 1 mod N`, so the condition holds throughout that slice.
Restrict to the nonempty fibre `deg = 1`: there `θ_γ(deg g) = γ`, and the matrices form one coset of `M`.
This is impossible because the
elements of a coset `gM` of the geometric monodromy group have no common eigenvalue, by the description of the
Zariski closure of `M` as a symplectic group (5.8), an orthogonal group (5.10) or a Weyl group of type A, D or E
(the finite case of 5.10), using `±Id` and Coxeter elements. (Weil II, Lemme 4.5.2 and its proof, Lemme 4.5.4, pp. 231–233.)
*Needs:* nondegeneracy of `E(X_t)` in both parities, as above; 5.3, 5.8, 5.10;
ArithmeticGaloisRepresentations Layer 5, §5.13; EtaleCohomologyFoundations §§F.0.A2, F.4.0;
Tau Ceti `Topology/Algebra/Group/Profinite/ZHat/Basic.lean`; 5.9 and all-characteristic normal generation
of 5.3 for the characteristic-two even branch. The no-common-eigenvalue input is Weil II
4.5.4: a normalizer coset has no common eigenvalue for `Sp(E)`, `O(E)`, or the finite
ADE reflection group obtained from the full transported orbit. In the finite case treat
diagram automorphisms as well as Coxeter elements, including the `D_{2r}` outer involution
and `D₄` triality cases of that lemma.

Combined with the Frobenius-equivariant decomposition `H^n(X_t) = H^n(X) ⊕ E(X_t)` (Weil II, 4.3.9, a consequence of the
hard Lefschetz theorem, used here as a hypothesis), the lemma gives Weil II, Théorème 4.5.1: `det(1 − FT, H^n(X))` is
the least common multiple of the polynomials `∏(1 − α_i T)` such that `∏(1 − α_i^k T)` divides `det(1 − FT, H^n(X_t))` for every
`t ∈ (P¹ − S)(𝔽_{q^k})`. With `ℤ_ℓ` coefficients the decomposition fails: the intersection of the vanishing part with the
image of `H^n(X)` is the kernel of cup product with the hyperplane class on `H^n(X, ℤ_ℓ)`, which can be a nonzero torsion
group (Weil II, 4.3.10, p. 226), so the rational statements of this layer are not asserted integrally.

**Checks.**

- A nonzero radical is fixed by geometric monodromy (5.3). If Frobenius has eigenvalue
  `γ` on it, `P=1−γT`, `Q=1` satisfies the divisibility premise; the coset argument requires nondegeneracy.
- In the characteristic-two `A₂` example, every normalizer coset of the finite reflection
  group has no common eigenvalue: after scalar multiplication its diagram automorphism
  is trivial or opposition, reducing to identity and an order-three Coxeter element with
  disjoint spectra. This tests the finite wild branch of the gcd argument.
- `gcd_lemma_degree_zero`: for `P = 1` the conclusion is trivial; for `Q = P` the hypothesis holds and so does the
  conclusion.
- `no_common_eigenvalue_symplectic`: `Id` and `−Id` in `Sp(V)` have no common eigenvalue, so a coset of a group whose
  Zariski closure is `Sp(V)` has no common eigenvalue.
- `integral_torsion_kernel`: replacing the hyperplane class `η` by `ℓη` (the hyperplane class of the `ℓ`-uple Veronese
  re-embedding) makes the kernel of cup product with it contain every class of `H^n(X, ℤ_ℓ)` killed by `ℓ`, so the integral
  intersection is nonzero as soon as `H^n(X, ℤ_ℓ)` has torsion.
- A continuous map from a compact group to discrete `ℤ` has finite image. For a homomorphism that image is a finite
  subgroup of `ℤ`, hence zero; it cannot record all Frobenius degrees.
- For the nonunit `γ = ℓ`, the integers `m!` tend to zero in `ℤ̂`, whereas `ℓ^(m!)` tends to zero in `ℚ_ℓ`.
  A continuous character would have to tend to its value `1` at degree zero, so no such extension exists.
- For a unit `γ`, the native lift is continuous and agrees with `γ^k` at every integer `k`; the resulting determinant
  zero locus is closed. When `E = 0`, its determinant is `1` and the zero locus is empty.
- The open curve `U_0 = P¹_{𝔽₂} − {0,1,∞}` has no degree-one points. Its Weil group has a nonempty open degree-one
  fibre meeting no positive power of a closed-point Frobenius, since every such point has degree at least two.
  In the profinite diagonal image, Chebotarev gives density on each clopen congruence slice and extends the closed
  determinant condition to the nonempty degree-one fibre.

### Examples

- The conic pencil (`n = 0`): the image of monodromy is `ℤ/2`, generated by the swap of the two points, the invariants
  are `ℚ_ℓ(e_1 + e_2) = E^⊥`, and the finite orthogonal monodromy is the Weyl group of `A_1`.
- A Lefschetz pencil of plane cubics (`X = P²` re-embedded by `r = 3`): `X̃` is `P²` blown up in nine points, `H^1(X̃) = 0`
  and `f` has a section, so `E = H^1(X_u)` is two-dimensional with `E ∩ E^⊥ = 0`, and the image is open in
  `Sp_2(ℚ_ℓ) = SL_2(ℚ_ℓ)`.
- The quadric-surface pencil: `E = 0`, all statements are trivial.

### Dependencies

Layers LPV.2–LPV.4; EtaleCohomologyFoundations §F.3a (tame character); InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3;
ArithmeticGaloisRepresentations Layer 5, §5.13; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3 (trace formula for all powers);
TauCetiRoadmap AdelicAlgebraicGroups Layer 4; TauCetiRoadmap OrthogonalSpinGroups Layers 0 and 2; TauCetiRoadmap
Chebotarev Layer 9; TauCetiRoadmap Completed IntegralLattices Layer 1; TauCetiRoadmap RepresentationTheory
(CharacterTheory Layer 4, RootSystems Layer 5); SchemeAndStackFoundations Layer 0;
AbhyankarLemma §§3.3–3.4 (regular-divisor local structure and normalization, Stacks 0EYG/0EYH);
Mathlib (`skewAdjointLieSubalgebra`, `LieModule.IsIrreducible`, `IsNilpotent.exp`).

## Layer LPV.6: Perverse nearby cycles

This layer proves Gabber's theorems: nearby cycles commute with Verdier duality, are t-exact for the middle
perverse t-structures, and shifted vanishing cycles preserve perversity. It deduces the exchange with
intermediate extensions under explicit exchange hypotheses, defines the perverse t-structure over a trait, fixes the coefficient and shift conventions
for finite, adic and rational coefficients, proves a support criterion for filtered colimits of nearby-cycle
complexes, and concludes with the middle-degree concentration of vanishing cycles at isolated
singularities. The perverse t-structures over a field, their gluing and intermediate extension are
EtaleCohomologyFoundations §F.8; the glued t-structure over a trait is defined in 6.2. No weight or decomposition theorem is used. Coefficients are
`Λ = ℤ/ℓ^ν` (`ν ≥ 1`) or rational ℓ-adic coefficients through the realization of 0.8; the integral perversities
`p` and `p⁺` are kept distinct and are not identified with each other.

### 6.1 Nearby cycles and duality

**Theorem (Gabber).** Let `X` be separated of finite type over a henselian trait and `K ∈ D_ctf(X_η, Λ)` with finite
coefficients of order invertible on the trait. Gabber's map `RΨ(D_η K) → D_s(RΨ K)` is a natural isomorphism,
equivariant for inertia, where `D_η` and `D_s` are the Verdier dualities of the generic and special fibres with the
dualizing complexes and Tate twists of EtaleCohomologyFoundations §F.5, EtaleCohomologyFoundations §F.6. The bounded
constructible adic and rational variant holds through 0.8 with uniform finite-level amplitude. Shifted
vanishing-cycle duality keeps its `can`/`var` and specialization-pairing conventions. Finite Tor dimension is
not dropped for general finite coefficient rings. *Proof sketch.* Construct the tensor/trace comparison of
Illusie 4.3 with the geometric functors; apply Gabber's theorem and the dévissage of 4.2–4.3; check naturality
under the inertia automorphisms; pass to adic coefficients and identify the shifts of the cone. (Illusie 1994,
4.2–4.4, pp. 44–47.) *Needs:* 0.5, 0.8; EtaleCohomologyFoundations §F.5 (biduality, exceptional
inverse image) and EtaleCohomologyFoundations §F.6 (Poincaré duality, dualizing complexes), EtaleCohomologyFoundations §F.8.

**Checks.**

- The rank-one nodal stalk/costalk pairing reproduces the twist `−1`.
- On a point, `ℤ_ℓ/ℓ` is `p`-perverse; its integral Verdier dual is `(ℤ_ℓ/ℓ)[−1]`, which is `p⁺`-perverse and not `p`-perverse.
- For a smooth constant family, nearby duality is the identity comparison on the dualizing Tate line.

### 6.2 Perverse sheaves over a trait and exactness

**Definition (perverse sheaves on a scheme over a trait).** Let `X` be of finite type over a henselian trait `S`, with
`i : X_s → X` and `j : X_η → X`. On `X_s` take the middle perverse t-structure of EtaleCohomologyFoundations §F.8, and on `X_η` the middle perverse
t-structure shifted by one, `(ᵖD^{≤−1}, ᵖD^{≥−1})`. The perverse t-structure on `D^b_c(X, Λ)` is obtained by gluing these along
the recollement (EtaleCohomologyFoundations §F.8): `K ∈ ᵖD^{≤0}(X)` iff `j^*K ∈ ᵖD^{≤−1}(X_η)` and `i^*K ∈ ᵖD^{≤0}(X_s)`; `K ∈ ᵖD^{≥0}(X)` iff `j^*K ∈ ᵖD^{≥−1}(X_η)` and
`i^!K ∈ ᵖD^{≥0}(X_s)`. Equivalently, with Artin's rectified dimension function, `δ(x)` the dimension of the closure of `x` if that closure
meets `X_s` and that dimension plus one otherwise, `K` is perverse iff `ℋ^q(i_x^*K) = 0` for `q > −δ(x)` and `ℋ^q(i_x^!K) = 0` for `q < −δ(x)` at every
point `x`. For `X` smooth of relative dimension `d`, `Λ_X[d + 1]` is perverse. For `X = S` strictly henselian, `Λ_S[1]` and `Rj_*Λ_η[1]`
are perverse, and for `K = Rj_*Λ_η[1]` the complex `i^*K[−1] = Λ ⊕ Λ(−1)[−1]` has perverse cohomology in degrees `0` and `1`,
so `i^*K[−1]` need not be perverse. When `X/S` is the localization at a closed point of a separated scheme `Z` of finite type over a smooth curve over a
field, this is the perversity of `Z`. Define `VanishingCycles.traitPerverseTStructure`. (Illusie 1994, the definition
following Corollaire 4.6, p. 48; SGA 4, Exposé XIV, 2.2.) *Needs:* EtaleCohomologyFoundations §F.8 (middle
perverse t-structures over a field and gluing along a recollement).

**Checks.**

- For `X` smooth over `S` of relative dimension `d` with nonempty generic fibre and `Λ≠0`, `Λ_X[d + 1]` is perverse, while `Λ_X[d]` is not: its generic restriction
  `Λ_{X_η}[d]` is perverse on `X_η`, hence not in `ᵖD^{≤−1}(X_η)`. Gluing the unshifted t-structure of `X_η` would accept `Λ_X[d]`.
- For `X=∅→S`, both shifts are zero and perverse; a nonempty generic fibre is essential to distinguish them.
- For `X = S` strictly henselian, `Λ_S[1]` and `K = Rj_*Λ_η[1]` are perverse, and `i^*K[−1] = Λ ⊕ Λ(−1)[−1]` has perverse
  cohomology in degrees `0` and `1`.
- The point `πx = 1` of `𝔸¹_S` is closed in `𝔸¹_S` and its closure misses the special fibre, so `δ(x) = 0 + 1 = 1`, the same
  value as for a section of `𝔸¹_S → S`; this is the shift by one on the generic fibre.

**Theorem (t-exactness of nearby cycles).** For `X` separated of finite type over a henselian trait with `ℓ` invertible,
geometric nearby cycles carry middle perverse sheaves on the geometric generic fibre to perverse sheaves on
the special fibre, and the induced functor between the perverse hearts is exact. Fibrewise, `RΨ` adds no shift.
For a perverse complex `K` on the total space for the rectified trait dimension function, the generic
restriction is shifted by `−1` before this fibrewise functor is applied: the total-space convention is `RΨ[−1]`.
*Proof sketch.* Work locally on separated affine pieces; right t-exactness comes from affine Artin vanishing
and the strict-local stalk formula (0.5); the opposite bound follows from right t-exactness for the dual and
nearby duality (6.1), over rational coefficients or finite fields; for `Λ = ℤ/ℓ^ν` this is the finite-coefficient
statement with the conventions of EtaleCohomologyFoundations §F.8. (Illusie 1994, Corollaire 4.5 and its proof, p. 47, which uses the right t-exactness of
Beilinson–Bernstein–Deligne, 4.4.2; Illusie 2021, §1.1, p. 85, and §6.2, p. 104.) *Needs:* 0.5, 0.7, 6.1, the definition above; EtaleCohomologyFoundations §F.8 (perverse
t-structures, support and cosupport conditions) and EtaleCohomologyFoundations §§F.2–F.3 (affine Artin vanishing).

**Checks.**

- For a smooth family of relative dimension `d`, `ℚ_ℓ[d]` on the geometric generic fibre goes to `ℚ_ℓ[d]` on the special fibre, with no extra fibrewise shift.
- For `ℚ_ℓ[d+1]` on the smooth total trait space, `ψ[−1]` gives `ℚ_ℓ[d]` on the special fibre.

- A geometric-generic skyscraper specializing to a section of the family stays a point skyscraper in perverse degree zero.

**Theorem (Gabber: vanishing cycles).** For a perverse complex `K` on `X` for the perversity of the definition above, `RΦK[−1]` is perverse on the special fibre, and, after shifting, `can` and each `Var(σ)` of 0.4 are morphisms of perverse
sheaves. For rational coefficients on the unipotent part, the normalized `var` of 1.7 is also
a perverse morphism to the Tate-twisted nearby object. This is not the statement that `i^*K` or `i^*K[−1]` is perverse: the
restriction has the two adjacent perverse degrees of the gluing argument. *Proof sketch.* Use the gluing bounds
for `j^*K[−1]` and `i^*K[−1]` on the total space and 6.2 on the generic restriction; the triangle places `RΦK[−1]` in
perverse degrees `−1` and `0`; dévissage reduces the vanishing of degree `−1` to the injectivity of specialization
into inertia invariants, which follows from exactness of invariants of the pro-`p` wild inertia and the two-term
complex of the tame inertia. This is the additional step of Gabber's argument. (Illusie 1994, Corollaire 4.6 and
Gabber's proof, pp. 47–51; Illusie 2021, §6.2, p. 104.) *Needs:* the previous theorem, 0.4; 1.7 for rational normalized variation;
EtaleCohomologyFoundations §F.8.

**Checks.**

- At a nodal curve, `RΦℚ_ℓ[2][−1]` is the point skyscraper `ℚ_ℓ(−1)` in perverse degree zero.
- For a smooth total family the shifted vanishing object is zero.
- Over `ℤ/2`, a size-three unipotent block admits `Var(σ)` and `can`, but the coefficient `1/2` in the logarithm is unavailable.

### 6.3 Intermediate extensions

**Theorem.** Let `j_η` and `j_s` be compatible open immersions in a family over a trait, and `P` a constructible
perverse sheaf. Suppose that nearby cycles are t-exact for the perverse structures used, and that the exchange
maps `RΨ ∘ j_{η!} ≅ j_{s!} ∘ RΨ` and `RΨ ∘ Rj_{η*} ≅ Rj_{s*} ∘ RΨ` are isomorphisms on `P`, compatibly with the map `! → *`.
Then `RΨ(j_{η!*}P) ≅ j_{s!*}(RΨP)`. For a constant product pair `U₀ ⊂ Y₀` over a field, times the trait, these exchanges hold
when `P` is pulled back from a perverse sheaf on `U₀`, by product base change. The geometric
product condition alone does not imply the exchanges for arbitrary `P` on `U_η`. *Proof sketch.* `j_{!*}P = im(ᵖH⁰ j_!P → ᵖH⁰ Rj_*P)` (EtaleCohomologyFoundations §F.8); apply the exactness of `RΨ` on perverse hearts
and the two exchange isomorphisms, checking that they carry the `! → *` map to itself. (Illusie 1994,
Corollaires 4.5–4.6, pp. 47–51.) *Needs:* 0.6, 6.2; EtaleCohomologyFoundations §F.8.

**Checks.**

- A sheaf pulled back from `U₀` on the constant smooth pair `U₀⊂Y₀` times the trait yields the pulled-back intermediate extension.
- For `Y=𝔸¹_S`, `U=𝔾_m,S` and the generic skyscraper at `x=π`, `RΨ(j_!P)` is the skyscraper at zero, while `RΨP=0` on `U_s`; the `!` exchange fails.
- For the identity open immersion the comparison is the identity on `RΨP`.

### 6.5 Filtered colimits and towers

**Theorem (filtered-colimit criterion).** In the unbounded derived category of étale sheaves of EtaleCohomologyFoundations §F.1, which contains nonconstructible objects, let `K = colim K_a` be a filtered colimit of constructible
complexes with a common lower perverse bound relative to a fixed dimension function. Geometric stalks commute with filtered colimits; the
costalk `i_x^!` at a geometric point commutes with them whenever the inclusion of the complement of `x` in the strict
localization at `x` is quasi-compact, quasi-separated and of finite cohomological dimension, because the cohomology of a
coherent topos commutes with filtered colimits (SGA 4, Exposé VI, §5, and Exposé VII, §5). Under this hypothesis `K` satisfies
the same lower bound, because cohomology commutes with filtered colimits of modules; the upper bound is the same
argument with stalks. The colimit need not be constructible: the conclusion is a support or cosupport bound in the
unbounded derived category, not membership in the constructible perverse heart. *Proof sketch.* Express the lower bound by
vanishing of costalk cohomology below the threshold; use the costalk–colimit commutation above (not an assumption
that `Ri^!` commutes with every colimit); conclude by exactness of filtered colimits of modules. (Caraiani–Scholze,
§4.6, pp. 60–63.) *Needs:* 6.2; EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.8; EtaleCohomologyFoundations §F.1.

**Checks.**

- An increasing union of arbitrarily many point-supported perverse sheaves can retain the bound while failing constructibility.
- A system with bounds tending to `−∞` is not covered by the uniform-bound assertion.
- On a fixed point, the constant diagram `Λ` in degree zero has degree-zero colimit and preserves both bounds.

**Theorem (semiperversity of a nearby-cycle diagram).** Fix a common scheme or étale topos `Y`
with a dimension function and a homotopy-coherent filtered diagram `K_a ∈ D(Y,Λ)`.
For scheme nearby cycles, such terms have the form `K_a=T_a(RΨ_{η,f_a}L_a)`, where
`f_a:X_a→S_a` is of finite type over an excellent henselian trait with ℓ invertible,
`L_a∈Dᵇ_c(X_{a,η},Λ)`, and
`T_a:D(X_{a,s}←×_{S_a}η_a,Λ)→D(Y,Λ)` are specified transport functors from the
generic nearby-cycle topoi of 0.2 and 0.5. Coefficients are finite, or integral/rational after 0.8's
realization; the transition maps between the transported terms are part of the diagram.
Assume the transported `K_a` are constructible and have one common lower perverse bound; also
assume the costalk–colimit commutation hypotheses of the preceding criterion on `Y`. Then
`colim_a K_a ∈ D(Y,Λ)` has that bound. In applications deriving the bound from affine
finite-level maps, the affineness, continuity of integral pushforward and uniform cohomological
dimension bound are required for the specified transport functors.

If a boundary term `B_a` is removed from this diagram, require `colim B_a = 0` with finite
coefficients, equivalently every stalk cohomology class dies under a later transition. For
rational coefficients, a uniformly ℓ-power-torsion integral boundary system vanishes after
rationalization. *Proof sketch.* Apply the preceding criterion to the specified coherent
diagram on `Y`, using its assumed constructibility, uniform bound and costalk commutation. The boundary triangle may be discarded only after its
colimit vanishes. (Caraiani–Scholze, §4.6, Theorem 4.6.1 and Lemma 4.6.2, pp. 60–63.) *Needs:*
the filtered-colimit criterion; 0.2, 0.5, 0.7–0.8, 6.2; EtaleCohomologyFoundations §F.8 and §F.4;
EtaleCohomologyFoundations §F.1 (the common category and coherent diagram).

**Checks.**

- On a fixed point `Y`, an increasing sum of copies of `Λ` in degree zero has lower bound zero,
  while its infinite colimit is not constructible.
- With `Λ=ℤ/ℓ`, the constant boundary system `Λ --id→ Λ --id→ …` has nonzero colimit `Λ`,
  although every term is killed by ℓ; it cannot be discarded.
- A boundary system with zero transition maps has zero colimit, as do the positive-degree
  boundary terms of Caraiani–Scholze Lemma 4.6.2.
- The diagram `Λ[a]` on a point with `a→∞` has no common lower bound and fails the hypothesis.

### 6.6 Isolated singularities

**Theorem.** Let `f : X → S` be flat of finite type and of pure relative dimension `n` over a henselian trait, with `X`
regular, and let `x` be a closed point of `X_s` such that `f` is smooth on `X − {x}`. Then `R^iΦ(ℚ_ℓ) = 0` for `i ≠ n`, and
`R^nΦ(ℚ_ℓ)` is supported at `x`. If `f` is proper, specialization `H^n(X_s̄) → H^n(X_η̄)` is injective. No rank, reflection
or quadric-generator statement is made: for a nonordinary singularity the vanishing stalk can have any dimension.
This covers the isolated quadratic singularities in residue characteristic two used by Fresán–Sabbah–Yu, which are
not ordinary. *Proof sketch.* `X` regular of dimension `n + 1` makes `ℚ_ℓ[n + 1]` perverse on `X`; by 6.2 (vanishing
cycles) `RΦ(ℚ_ℓ[n + 1])[−1] = RΦ(ℚ_ℓ)[n]` is perverse on `X_s`, and it is supported at the point `x` (smooth local acyclicity,
0.5), so it is concentrated in degree zero; the specialization sequence (0.6) then gives the injection.
(Illusie 2021, §6.2, p. 104, for Gabber's theorem; Illusie, *Perversité et variation*, Manuscripta Math. 112 (2003),
Corollaire 2.10, as used in Fresán–Sabbah–Yu, §5.1.3, pp. 43–44.) *Needs:* 0.5, 0.6, 0.10 (`ℚ_ℓ[n + 1]` is perverse on the
regular `X` by absolute purity), 6.2.

**Checks.**

- For an ordinary quadratic point this recovers the concentration of 2.7, without the rank-one statement.
- The Fresán–Sabbah–Yu characteristic-two boundary singularity is an isolated singularity covered here and not by 2.7.
- For `n = 0` and `X = Spec R[y]/(y² − π)` with `p ≠ 2`, the theorem gives `R^0Φ` of rank one at the closed point and zero in
  other degrees, as in 2.7.

### Examples

- A smooth relative curve of relative dimension `d = 1`: `ℚ_ℓ[1]` on each fibre is preserved, with no fibrewise shift; for
  `ℚ_ℓ[2]` on the smooth total space, `ψ[−1]` gives `ℚ_ℓ[1]` on the special fibre.
- The node `xy = π`: `RΦ(ℚ_ℓ[2])[−1]` is the skyscraper `ℚ_ℓ(−1)` at the node, in perverse degree zero, and the rank-one
  stalk–costalk pairing has twist `−1`.

### Dependencies

Layers LPV.0, LPV.1 and LPV.2; EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.5, EtaleCohomologyFoundations §F.6, EtaleCohomologyFoundations §F.7, EtaleCohomologyFoundations §F.8, EtaleCohomologyFoundations §F.4 and 0.8a;
EtaleCohomologyFoundations §F.1.

## Layer LPV.7a: Semistable curves and strictly semistable degenerations

This layer computes nearby cycles, monodromy and the monodromy filtration for proper nodal curves over a
henselian trait in terms of the dual graph, compares them with the Jacobian and its monodromy pairing, and then
treats strictly semistable degenerations of any dimension: the stalks of nearby cycles, the graded pieces of the
monodromy filtration on `RΨ`, the weight spectral sequence with its differentials, and the action of `N` on it. It
uses the weights of the monodromy filtration only as labels; no Frobenius weight or purity statement is made.
Its inputs are Layers LPV.0–LPV.2, TauCetiRoadmap StableReduction (nodes, normalization, dual graphs, blow-ups),
NeronModelsAndSemistableAbelianVarieties Layer 4 (the Picard scheme of a semistable curve and the integral
monodromy pairing) and absolute purity (0.10). In 7a.1–7a.6, `X/S` is a proper flat curve over a strictly henselian
trait `S` with smooth geometrically connected generic fibre and reduced nodal special fibre `Y`, with étale local
equations `uv = a_e`, `a_e ≠ 0`, at the nodes `e` (thickness `n_e = v(a_e) ≥ 1`); `ν : Ỹ → Y` is the normalization, `Γ` the
oriented dual multigraph (vertices the components of `Ỹ`, edges the nodes, loops and multiple edges kept), and `Λ` is
`ℤ/ℓ^m`, `ℤ_ℓ` or a finite extension of `ℚ_ℓ`, with `ℓ` invertible on `S`.

### 7a.1 The normalization complex

**Construction.** Let `Γ` be the oriented dual graph of `Y`, TauCetiRoadmap StableReduction's
`TauCetiRoadmap.StableReduction.DualGraph` (Layer 1), with branch set `B_e = Fin 2` and endpoint map `i ↦ Γ.endpoint e i`. The distinct
branch labels `0,1` have images `tail e = Γ.endpoint e 0` and `head e = Γ.endpoint e 1`,
which coincide for a loop. Define
`Semistable.normalizationDifferential Γ : Λ^V → Λ^E`, `(da)(e) = a(tail e) − a(head e)`, the degree-zero map of a
two-term complex. Its kernel and cokernel are `H^0(Γ, Λ)` and `H^1(Γ, Λ)`; the carrier, endpoints and first Betti number come from StableReduction Layer 1.
The integral boundary `DualGraph.boundary` and cycle lattice `DualGraph.cycleLattice`
`H_1(Γ, ℤ) = ker ∂`, with its dual, come from NeronModelsAndSemistableAbelianVarieties §4.2.
Its target-minus-source boundary satisfies `∂ᵗ = −d` in these branch coordinates.

- `Semistable.normalizationDifferential_apply`: For `a:Λ^V` and `e∈E`, `d(a)(e)=a(tail e)−a(head e)`.
- `Semistable.normalizationDifferential_constant`: `d` sends every constant vertex function to zero.
- `Semistable.normalizationDifferential_reverse`: Swapping tail and head multiplies `d` by `−1` on the corresponding edge coordinates.
- `Semistable.normalizationDifferential_ker`: Kernel membership is equality of the vertex values at the two ends of each edge; the quotient map `Λ^E → Λ^E/range d` is surjective with kernel `range d`. Regarding `d` as a two-term complex, these are its degree-zero kernel and degree-one cokernel.

*Source.* Illusie 1991, §§1.1, 2.1–2.3, formulas (1.1.1)–(1.1.3), (2.1.2), (2.3.5). *Needs:* TauCetiRoadmap
StableReduction Layer 1 (nodes, normalization, dual graphs);
NeronModelsAndSemistableAbelianVarieties §4.2 (integral boundary, cycle lattice and dual); Mathlib `LinearMap.ker`, `LinearMap.range`.
Over every field, the dimension of the edge cokernel of a connected graph is `#edges + 1 − #vertices`.

**Checks.**

- `Semistable.normalization_tree_test`: For two vertices and one oriented edge, `d(a0,a1)=a0−a1`; hence the degree-one quotient vanishes.
- `Semistable.normalization_loop_test`: For one vertex and one loop, `d=0` and the edge quotient is `Λ`, not zero.
- `Semistable.normalization_parallel_test`: For two vertices and two parallel edges with the same orientation, `d(a0,a1)=(a0−a1,a0−a1)`, whose quotient has rank one over `ℚ_ℓ`.
- A loop has zero differential; two parallel edges remain two coordinates.
- The maps retain the exact source branch sign.

**Theorem (normalization resolution).** With `i_e : {e} → Y` the nodes and `Λ(e) = coker(diag : Λ → Λ^{Fin 2})`, the sequence
`0 → Λ_Y → ν_*Λ_Ỹ → ⊕_e i_{e*}Λ(e) → 0` is exact, the last map being restriction to the two branches followed by the
quotient. Branch ordering identifies `Λ(e)` with `Λ`, with the sign of the normalization differential, and on global
sections the map `H^0(Ỹ, Λ) → ⊕Λ(e)` is that differential. This is an étale constant-sheaf statement, distinct from the
coherent normalization and conductor sequence. *Proof sketch.* Check stalks at smooth points and at the two-branch
nodes, using conservativity of geometric stalks. (Illusie 1991, §2.3, (2.3.1)–(2.3.5), and Lemme 2.4.) *Needs:* the
construction above; StableReduction Layer 1; EtaleCohomologyFoundations §§F.1–F.2.

**Checks.**

- At a node the cokernel of the diagonal `Λ→Λ²` is rank one.
- At a smooth point the cokernel vanishes.
- On an irreducible nodal cubic the two branch labels are distinct although their vertex images coincide; the node cokernel is still `Λ`.

### 7a.2 Nearby cycles at the nodes and the specialization sequence

**Theorem.** `R^0ΨΛ = Λ_Y`, `R^1ΨΛ` is supported at the nodes, and `R^qΨΛ = 0` for `q > 1`. There is a canonical residue
identification `R^1ΦΛ(e)(1) ≅ Λ'(e)`, with `Λ'(e) = ker(sum : Λ^{Fin 2} → Λ)` dual to `Λ(e)`. Inertia acts trivially on these
cohomology sheaves, although its action on the complex `RΨΛ` and on `H^1` of the generic fibre need not be trivial. In
the strictly semistable case (`X` regular), every thickness is one. *Proof sketch.* Off the nodes use smooth local
acyclicity (0.5); at a node use the stalk formula of 0.5 and the one-dimensional quadratic calculation of 2.6; the
branch residue and trace dualities identify the twist. (Illusie 1991, §§1.2–1.5, (1.2.1)–(1.2.2), (1.3.3), (1.5.1).)
*Needs:* 0.5, 2.6; StableReduction Layer 1; EtaleCohomologyFoundations §F.6 (trace pairing).

**Checks.**

- The smooth locus has `R¹Φ=0`.
- A split node has one copy of `Λ(−1)` in `R¹Φ`; trivial sheaf action does not force `N=0` globally.

- An irreducible nodal cubic has two branches at its one node and one rank-one `R¹Φ`, even though both branch endpoints are the same component.

**Lemma (node residue and the sign of the variation).** With Illusie's dual branch bases `δ'_e = (1, −1)` and `δ_e`, the
normalized local variation `N_e : R^1ΦΛ(e)(1) → H^1_e(Y, RΨΛ)` sends `δ'_e` to `−n_e δ_e`, and the map to `H^2(Y, Λ)(1)` sends
`δ'_e` to `[C_{tail e}] − [C_{head e}]`; then `Var_e(σ) = t_ℓ(σ) N_e`. The two connecting morphisms compared through the
localization and normalization sequences differ by a sign: in the nine-diagram of distinguished triangles built from
`Y − {nodes} ⊂ Y ⊃ {nodes}` and the normalization, the two composite boundary maps `H^0(nodes, Λ(e)) → H^1_{nodes}(Y, Λ)`
are negatives of each other (the anticommutativity of the boundary maps of a nine-diagram, a statement about
triangulated categories proved here). Reversing the branch order changes both bases and leaves the geometric map
unchanged. *Proof sketch.* Identify the boundary map through local trace duality and the odd Picard–Lefschetz
formula 2.7 for the local equation `uv = a_e`, whose Kummer character is `v(a_e) t_ℓ = n_e t_ℓ`; compare local
cospecialization with normalization through the nine-diagram sign; insert `t_ℓ(σ)`. (Illusie 1991, Lemme 1.5.4, §1.7,
(1.7.1)–(1.7.4), Lemme 2.4.) *Needs:* 7a.1, the theorem above, 0.4, 1.2, 2.7; EtaleCohomologyFoundations §F.5 (localization triangles).

**Checks.**

- For `uv=π`, `N_e` is minus the identity in the branch bases.
- Reversing the branch order changes both bases, leaving the geometric map unchanged.

- For `uv=π²`, the local residue operator is `−2 id`; with rational coefficients it is nonzero even for `ℓ=2`.

**Theorem (specialization sequence of a nodal curve).** Proper base change and the vanishing triangle give the exact
sequence

```text
0 → H^1(Y, Λ) → H^1(X_η̄, Λ) → ⊕_e Λ'(e)(−1) → H^2(Y, Λ) → H^2(X_η̄, Λ) → 0,
```

whose middle boundary is, in branch coordinates, the oriented incidence map on edges followed by the component trace
classes; `H^2(X_η̄, Λ) ≅ Λ(−1)` since the generic fibre is connected, and `H^0` specializes isomorphically. All arrows,
twists and Galois actions are kept; the descent from the strict henselization is part of 7a.5. *Proof sketch.* Use
the proper comparison of 0.6, the vanishing triangle and the theorem above (the node support kills `H^j(Y, R^1Φ)`, `j > 0`);
identify the boundary through the sign lemma and the final trace through connectedness. (Illusie 1991, §1.6,
(1.6.1)–(1.6.6), and §2.2.) *Needs:* 0.6, the two results above; EtaleCohomologyFoundations §F.6.

**Checks.**

- The kernel of the node-to-component map is `H₁(Γ,Λ)(−1)`.
- A bridge contributes a local vanishing cycle but no nonzero quotient in generic `H¹`.
- For a one-loop rational special fibre, the edge-to-component map is zero; the sequence has one-dimensional special `H¹` inside two-dimensional generic `H¹`.

**Theorem (graph and component cohomology).** The normalization resolution gives a canonical exact sequence
`0 → H^1(Γ, Λ) → H^1(Y, Λ) → ⊕_v H^1(Ỹ_v, Λ) → 0` and `H^2(Y, Λ) ≅ ⊕_v Λ(−1)`; here `H^1(Γ, Λ) = coker d`, while
`H_1(Γ, Λ) = ker ∂` is the dual lattice. No canonical splitting is asserted. With branch choices, the normalization
injection `γ'` and the cospecialization map `c'` satisfy `c' = −γ'`. *Proof sketch.* Take the long exact sequence of the
normalization resolution, using that the node scheme is finite; identify the graph quotient with `coker d` and the
component `H^2` by the trace of EtaleCohomologyFoundations §F.6; compare the two graph injections through the sign lemma. (Illusie 1991,
§§2.1–2.4, especially (2.3.5) and Lemme 2.4; (2.6.1)–(2.6.5).) *Needs:* 7a.1, the sign lemma;
EtaleCohomologyFoundations §F.6; NeronModelsAndSemistableAbelianVarieties Layer 4, §4.2 (characters of the
torus as integral graph cycles).

**Checks.**

- A tree has `H¹(Y)=⊕H¹(Ỹ_v)`; a cycle of rational components has graph `H¹` of rank one.
- For an irreducible rational nodal cubic, graph `H¹=Λ`, component `H¹=0`, and `H²(Y)=Λ(−1)`.
- For two rational components joined by one bridge, graph `H¹=0` and `H²(Y)=Λ(−1)²`.

### 7a.3 Monodromy of a nodal curve

**Theorem (graph factorization of monodromy).** Put `V = H^1(X_η̄, ℚ_ℓ)`, `M = H_1(Γ, ℤ)` and `M^∨ = H^1(Γ, ℤ)`. The monodromy
operator `N : V(1) → V` of 1.2 factors as `N = c' ∘ u_− ∘ c`, where `c : V(1) → M ⊗ ℚ_ℓ` is the specialization quotient,
`c' : M^∨ ⊗ ℚ_ℓ → V` is cospecialization, and `u_−(a)(b) = −Σ_e n_e a_e b_e`; equivalently `N = γ' ∘ u_− ∘ γ` with `γ = −c`, `γ' = −c'`.
The form `u_−` is nondegenerate over `ℚ_ℓ` (negative definite over `ℚ`), but need not be an integral isomorphism. *Proof
sketch.* Factor `σ − 1` through the local variations (0.4 and the sign lemma); identify the quotient and the injection
with the graph lattices through the specialization sequence and its dual; sum the local maps; `Σ n_e a_e²` is positive
definite on `H_1(Γ, ℚ)`. (Illusie 1991, §§2.1–2.2, (2.1.3), (2.2.3); (2.6.5)–2.7.) *Needs:* 7a.2, 1.2;
NeronModelsAndSemistableAbelianVarieties Layer 4, §4.2; Mathlib `LinearMap.ker`, `LinearMap.range`, `Module.finrank`.
In Tate coordinates the factorization has surjective `c`, injective `c′`, an isomorphism `u₋`
and `c ∘ c′ = 0`, giving `N² = 0`, `ker N = ker c`, `im N = im c′` and `rank N = dim M`.
The negative edge pairing is `Matrix.toBilin'` of `−diag(n)`, with its weighted-sum formula
valid over every coefficient ring.

**Checks.**

- `N²=0` and `rank N=b₁(Γ)`.
- For a two-edge cycle the scalar pairing is `−2`; the integral determinant is not forced to be a unit.
- For the negative edge pairing on one edge of thickness three, the basis norm is `−3`.
- Distinct edge basis vectors pair to zero.
- Doubling every thickness doubles the negative edge pairing.

**Theorem (invariant cycles for nodal curves, without weights).** With rational coefficients, specialization
`sp : H^1(Y, ℚ_ℓ) → V` is injective with image `V^I = ker N`. In degrees `0` and `2` specialization is onto the invariants as
well; in degree `2` it is the component-trace sum, an isomorphism only when there is one geometric component. *Proof
sketch.* From the factorization, `u_−` and `c'` are injective over `ℚ_ℓ`, so `ker N = ker c`, which is the image of `H^1(Y)` by the
specialization sequence; `ρ(σ) = 1 + t_ℓ(σ)N` and surjectivity of `t_ℓ` identify `ker N` with the invariants. (Illusie 1991,
Remarques 2.8–2.9, p. 42.) *Needs:* the factorization, 7a.2, 1.2.

**Checks.**

- Smooth specialization has `N=0` and is an isomorphism in all degrees.
- A two-component rational cycle has invariant `H¹` of dimension one and generic `H¹` of dimension two.

- For two components joined by one bridge, `N=0` on generic `H¹`, while specialization in degree two is the surjective component-trace sum.

**Theorem (monodromy filtration of a nodal curve).** The monodromy filtration of `V` centred at `1` (1.3) is `M_j = 0` for
`j < 0`, `M_0 = im N`, `M_1 = ker N = sp H^1(Y)` and `M_j = V` for `j ≥ 2`, after Tate-coordinate identifications; canonically
`gr_0 ≅ H^1(Γ, ℚ_ℓ)`, `gr_1 ≅ ⊕_v H^1(Ỹ_v, ℚ_ℓ)` and `gr_2 ≅ H_1(Γ, ℚ_ℓ)(−1)`, and `N : gr_2 → gr_0(−1)` is the negative edge pairing
in the residue coordinates. These indices label the monodromy filtration; no Frobenius weight is asserted over an
arbitrary residue field. *Proof sketch.* `N² = 0` and the uniqueness of 1.3; the invariants theorem and 7a.2 give `gr_1`
and the graph subspace; the specialization sequence and the factorization give `gr_2`. (Illusie 1991, Remarque 2.9,
p. 42; (2.2.3), (2.6.5).) *Needs:* 1.3, the two theorems above, 7a.2.

**Checks.**

- For a smooth curve only `gr_1` survives.
- For a cycle of rational components `gr_1=0`, and `gr_0,gr_2` each have dimension one.
- For a smooth genus-one component with one nonseparating node, the graph outer grades each have rank one and the middle grade has rank two, retaining the normalization genus.

### 7a.4 The Jacobian

**Comparison.** For a regular projective semistable model `X/S` of a smooth geometrically connected curve, over a
strictly henselian base with algebraically closed residue field, `V_ℓ(Jac(X_η)) ≅ H^1(X_η̄, ℚ_ℓ)(1)` (Kummer theory and
`Pic^0 = Jac`), and under this identification the invariant part is `V_ℓ(Pic^0_Y)`, the toric part is `H^1(Γ, ℚ_ℓ)(1)` and the
abelian quotient is `⊕_v V_ℓ(Jac(Ỹ_v))`. The character lattice of the torus is `H_1(Γ, ℤ)`, not `H^1`. The normalization,
specialization and Tate exact sequences commute, the identifications being fixed by the Kummer realization and the
canonical principal polarization; the diagrams agree as Galois modules, not only in dimension. The integral Tate
modules are rationalized only after their maps are constructed. *Proof sketch.* Use the normalization sequence and
the identification of the Néron identity component with `Pic^0` (NeronModelsAndSemistableAbelianVarieties Layer 3,
§§3.8–3.9, and Layer 4, §§4.1–4.2), the Tate module and its duality pairing (AbelianSchemesAndArithmeticModuli Layer
A4, §A4.1), and the finite-level comparison of `H^1_ét(C, ℤ/ℓ^n)` with the dual of `J_C[ℓ^n]`
(InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1, curve/Jacobian comparison); Kummer theory compares the additive normalization sequence with
the multiplicative Picard sequence; the sign lemma and the torsion-compatible specialization maps identify the
filtration. (Illusie 1991, §§2.3–2.6, (2.3.3)–(2.3.5), (2.6.1)–(2.6.5).) *Needs:* 7a.2, 7a.3;
NeronModelsAndSemistableAbelianVarieties Layers 3–4; AbelianSchemesAndArithmeticModuli Layer A4;
InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 (curve/Jacobian comparison).

**Checks.**

- The torus rank equals `b₁`; the abelian rank is twice the sum of normalization genera.
- For split multiplicative genus-one reduction the toric Tate subspace is `ℚ_ℓ(1)`, the component Jacobians vanish, and the graph cycle quotient is `ℚ_ℓ`.
- For a smooth genus-g special fibre the torus is zero and the comparison is the ordinary Jacobian Kummer isomorphism.

**Comparison (the monodromy pairing).** Under the Jacobian identification, the ℓ-adic pairing defined from `N` by the
trace-dual quotient and injection is Illusie's negative form `u_− ⊗ ℚ_ℓ`, whereas Grothendieck's integral monodromy pairing
in the convention of NeronModelsAndSemistableAbelianVarieties Layer 4, §§4.3–4.4 is the positive form `u_+ = Σ_e a_e b_e` on a
regular model. Then `u_− = −u_+`; the two connecting-map signs are transported explicitly. The pairing and the
factorization are compatible with reorientation and coefficient extension; for a model that is not regular, the
thickness-weighted form is obtained through the regular subdivision of 7a.5. No integral unimodularity is
asserted. *Proof sketch.* Illusie's Theorem 2.7 compares the trace-dual Tate realization with SGA 7 IX 9.1.2 and
records the opposite conventions; use `c' = −γ'` and `c = −γ`. (Illusie 1991, Théorème 2.7 and its comparison with SGA 7 I,
IX 9.1.2, p. 41.) *Needs:* the factorization of 7a.3 and the Jacobian comparison; NeronModelsAndSemistableAbelianVarieties
Layer 4, §§4.3–4.4; Mathlib `LinearMap.BilinForm`.

**Checks.**

- For a regular two-edge cycle the two pairings are `[−2]` and `[2]`.
- For the one-loop graph of a nodal cubic of thickness two, `u₋=[−2]` and `u₊=[2]`; their integral cokernels are `ℤ/2`, so neither is unimodular.
- For a tree both cycle lattices vanish and both graph pairings have rank zero.

### 7a.5 Changes of choices and of the base

**Theorem.** The comparison diagrams of 7a.2–7a.4 descend from the strict henselization, are equivariant for the
residue Galois action permuting components and branches, and commute with coefficient extension; reorientation
acts by signed edge permutations. Replacing a generator of `ℤ_ℓ(1)` by a unit multiple rescales the matrix of `N` and the coordinate of `t_ℓ(σ)`
inversely, so `log T = t_ℓ(σ)N` and the twisted `N` are unchanged. Under a finite extension of the trait of ramification index `e`, with
compatible tame identifications, `N_new = e · N_old`. An edge of thickness `n_e` becomes, in a regular semistable
resolution, a chain of `e · n_e` unit-thickness edges (exceptional rational components contribute no `H^1`), and the summed
edge pairing scales by `e`. *Proof sketch.* Use the trait base change of 0.6, the compatibility of the tame character with
ramified extensions (EtaleCohomologyFoundations §F.3a, 1.2) and the signed branch transports; compare normalization maps and variation factors
before passing to graph quotients; a chart `uv = π^{n_e}` becomes `uv = π_new^{e n_e}` up to a unit, and its resolution is
the subdivision of TauCetiRoadmap StableReduction Layer 4. (Illusie 1991, §0 (thicknesses) and §§1.7, 2.1–2.7; Illusie
2021, §4.4.) *Needs:* 7a.3, 7a.4, 0.6, 1.2; TauCetiRoadmap StableReduction Layers 1 and 4.

**Checks.**

- Unramified base change preserves N; ramification e scales it.
- An orientation change conjugates matrices, preserving the underlying map and pairing.
- An edge of thickness 2 under ramification index 3 resolves into 6 unit edges; the summed pairing is 3 times the original thickness-2 form.

### 7a.6 Examples of nodal curves

**Application.** The constructions are instantiated on three models.

- A smooth proper model: `N = 0` and specialization is an isomorphism in all degrees.
- Two smooth components meeting in one node (a tree): `R^1Φ` is nonzero at the node, but `N = 0` on `H^1` of the generic
  fibre.
- A split genus-one model with special fibre two smooth rational curves meeting transversally in two points (type
  `I_2`): over a henselian trait with residue characteristic not two or three, the Weierstrass curve
  `y² = x³ + x² + π²` has `v(Δ) = 2` and split multiplicative reduction, its Weierstrass model has one node of thickness two
  at the origin (local equation `uv = π²`), and one blow-up of that point (TauCetiRoadmap StableReduction Layer 4,
  the test case `xy = π^n`) gives a regular model whose special fibre is the normalized nodal cubic and the exceptional
  conic, meeting in two points. Here `gr_0` and `gr_2` have rank one, `gr_1 = 0`, and in compatible rational bases
  `N(a, b) = (−2b, 0)` and `ρ(σ) = 1 + t_ℓ(σ) N`: the graph has one cycle `(1, −1)` of norm `−2` for `u_−`.

The algebraic computation alone (a two-dimensional linear map) is only a test; the existence of the model is part of
the statement. (Illusie 1991, §§2.1–2.2, (2.1.1), (2.1.3); Remarques 2.8–2.9; TauCetiRoadmap EllipticCurves Layer 4
for Tate's algorithm.) *Needs:* 7a.3, 7a.4; TauCetiRoadmap StableReduction Layer 4; TauCetiRoadmap EllipticCurves
Layer 4.

**Checks.**

- The two-edge `N` is nonzero over `ℚ_ℓ` for every `ℓ`, including `ℓ=2`.
- The bridge is not mistaken for a nonzero global monodromy contribution.

- On the original nodal Weierstrass model of thickness two, the single-loop weighted pairing is `−2`; subdivision to the regular `I₂` model gives the same form.

### 7a.7 Strictly semistable degenerations: nearby cycles

In 7a.7–7a.9, `X/S` is strictly semistable of pure relative dimension `d` over a henselian trait: étale locally
`X → Spec R[t_0, …, t_d]/(t_0 ⋯ t_r − π)`, `0 ≤ r ≤ d`, with smooth irreducible components `Y_i` of the special fibre `Y`. For a
set `J` of components, `Y_J = ∩_{i∈J} Y_i`, and `Y^{(j)}` is the disjoint union of the `(j + 1)`-fold intersections (`Y^{(0)}` the
components), with `a_j : Y^{(j)} → Y`.

**Theorem (stalks).** For `Λ = ℤ/ℓ^m`, `ℤ_ℓ` or `ℚ_ℓ` and a geometric point `x` lying on `a` components,
`R^qΨΛ_x ≅ ∧^q(coker(diag : Λ → Λ^a))(−q)`, the stalk form of the Kummer residue description; `R^0Ψ = Λ`, and inertia acts
trivially on every `R^qΨ`. The residue resolution is canonical before a basis is chosen. The cohomology sheaves do not
determine the derived inertia action. *Proof sketch.* Absolute purity (0.10: relative purity `Λ ≅ Rf^!Λ(−d)[−2d]` for the
regular `X → S`, and `R^*j_*Λ` the exterior algebra on `⊕Λ_{Y_i}(−1)`) and tameness give `R^qΨ` as the cokernel of the Kummer
class of the uniformizer acting on `R^qj_*`; evaluate at a geometric point. (Saito 2003, §1.1, Propositions 1.1.1–1.1.2 and
Corollary 1.1.3; Illusie 2021, §2.2, formula (2.5), and §6.3.) *Needs:* 0.5, 0.10, 1.2; EtaleCohomologyFoundations §F.6.

**Checks.**

- One branch gives `R^qΨ = 0` for `q > 0`; two branches give one `Λ(−1)`; three give ranks 1, 2, 1.

- At a point on three components, `R²Ψ=Λ(−2)` and `R³Ψ=0`.
- At a point on one component, the cokernel of the diagonal is zero and all positive-degree stalks vanish.

**Comparison (the graded nearby complex).** With `ℚ_ℓ` coefficients, `RΨℚ_ℓ[d]` is perverse (6.2), and the monodromy filtration
centred at `0` of the nilpotent `N` on it, taken in the abelian category of perverse sheaves (1.3), has

```text
gr_r RΨℚ_ℓ ≅ ⊕_{p, q ≥ 0, p − q = r} a_{p+q,*} ℚ_ℓ(−p)[−p − q].
```

`N` lowers `r` by two and sends the `(p, q)` summand identically onto the `(p − 1, q + 1)` summand after a twist `(−1)` when
`p ≥ 1`, and to zero otherwise. This is a concrete model of the filtration of 1.3, not a second construction. *Proof
sketch.* The kernel filtration of `N` is the canonical truncation and the image filtration is identified through residues
(Saito, Lemma 2.2.1 and Corollary 2.2.2); the convolution characterization of 1.3 gives the graded pieces; check
independence of the generator and that `log T` and `T − 1` induce the same map on the graded pieces. (Saito 2003,
Lemma 2.2.1, Corollary 2.2.2, Proposition 2.2.3; Illusie 2021, §6.3, (6.3)–(6.4).) *Needs:* 1.3, 6.2, the stalk theorem;
Mathlib `DerivedCategory`.

**Checks.**

- For two components, `gr₁=ℚ_ℓ_C(−1)[−1]`, `gr₀=ℚ_ℓ_D1⊕ℚ_ℓ_D2`, `gr₋₁=ℚ_ℓ_C[−1]`.
- Trivial action on `R^qΨ` does not replace the nonzero derived `N`.
- For a smooth model with one component, only the central grade survives and the graded operator is zero.

### 7a.8 The weight spectral sequence

**Construction.** From the finite filtered complex of 7a.7, the spectral sequence of a filtered object (Mathlib
`CategoryTheory.Abelian.SpectralObject.spectralSequence`) gives the cohomological spectral sequence

```text
E_1^{p,q} = ⊕_{i ≥ max(0, −p)} H^{q−2i}(Ȳ^{(p+2i)}, ℚ_ℓ(−i))  ⇒  H^{p+q}(Ȳ, RΨℚ_ℓ),
```

with `d_r` of bidegree `(r, 1 − r)`; strata with negative or out-of-range index contribute zero, so the sum is finite. For `X`
proper, proper base change identifies the abutment with `H^{p+q}(X_η̄, ℚ_ℓ)`; without properness the abutment is the nearby
cohomology, not the generic-fibre cohomology. The induced filtration `M'` on `H^m` gives the weight indexing
`W_s H^m = M'_{s−m}`; its equality with the monodromy filtration of `N` on `H^m` is a separate statement, not asserted here.
The columns lie in `[−d, d]`, so the sequence degenerates at the page `2d + 2` without any assumption of degeneration at
`E_2`. Define `Semistable.weightSpectralSequence`.

- `Semistable.weightSpectralSequence_e1`: The first page is canonically isomorphic to the displayed finite sum of twisted stratum cohomology.
- `Semistable.weightSpectralSequence_e2`: The second page is the homology of the first-page differential.
- `Semistable.weightSpectralSequence_abutment`: For proper `X` the finite filtration converges to generic-fibre cohomology with induced filtration `M′` and actual comparison maps. Relative dimension `d` bounds columns by `[-d,d]`, so page `2*d+2` is stabilized and identifies with the graded abutment. Earlier stabilization requires a separate degeneration proof.
- `Semistable.weightSpectralSequence_reindex`: A signed permutation of component indices induces an isomorphism of spectral sequences compatible with stratum maps and `N`.

*Proof sketch.* Apply the spectral sequence of a filtered complex to 7a.7; compute `E_1` from the graded pieces and proper
pushforward from the strata; convergence from the bounded filtration and proper base change. (Saito 2003, Corollary 2.2.4
and its proof, published as Corollary 2.8; Liu–Tian–Xiao–Zhang–Zhu 2022, §5.9, Construction 5.9.1, p. 231, and the proof
of Lemma 5.9.3, pp. 233–240, for the nonproper form.) *Needs:* 7a.7, 0.6; EtaleCohomologyFoundations §§F.1–F.2;
Mathlib `CategoryTheory.Abelian.SpectralObject`, `CategoryTheory.CohomologicalSpectralSequence`, `ModuleCat`.

**Checks.**

- `Semistable.weight_ss_smooth_test`: With one smooth component, `E₁^{0,q}=H^q(Y,ℚ_ℓ)`, and `E₁^{p,q}=0` for `p≠0`.
- `Semistable.weight_ss_curve_test`: For relative dimension 1, `E₁^{−1,2} = H⁰(nodes, ℚ_ℓ)(−1)`, `E₁^{0,1} = ⊕H¹(components, ℚ_ℓ)`, `E₁^{1,0} = H⁰(nodes, ℚ_ℓ)`; `d₁` also includes `components → nodes` and `nodes → H²(components)`.
- `Semistable.weight_ss_nonproper_test`: Take `X=𝔸¹_S` minus the closed special-fibre
  origin. This smooth strictly semistable family has `X_s=𝔾_m`, `X_η=𝔸¹` and
  `RΨℚ_ℓ=ℚ_ℓ` on the geometric special fibre. Nearby `H¹` is `ℚ_ℓ(−1)`, whereas
  geometric generic-fibre `H¹=0`; properness is needed for the alternative abutment.
  For relative dimension one the page-four bound still applies.
- A smooth model has only `p=0` terms.
- For curves the page carries the normalization restriction and node Gysin maps of 7a.2.
- Nonproperness does not erase the spectral sequence but changes the justified abutment.

**Theorem (the differential `d_1`).** Order the components. For `J = I − {i_j}` use the sign `(−1)^j`; let `δ^*` be the alternating
restriction maps from `(r + 1)`-fold to `(r + 2)`-fold intersections and `δ_*` the alternating Gysin maps in the opposite
direction, of degree two and twist `(1)`. In Saito's convention `d_1 = δ^* + δ_*` on the corresponding summands of `E_1`; their
squares vanish and the mixed composites anticommute, by the compatibility of divisors and intersections. Passing to
Rapoport–Zink's coordinates uses the signed conjugation `(−1)^{ij}`; the matrices are not equal without it. *Proof sketch.*
Use the transverse restriction and Gysin maps, the self-intersection and projection formulas of EtaleCohomologyFoundations §F.6, and the residue
classes of Saito, Lemma 2.2.5 and Proposition 2.2.6; compute the total-complex signs. (Saito 2003, Lemma 2.2.5 and
Proposition 2.2.6, including the final sign comparison.) *Needs:* 7a.7, the construction above, 0.10;
EtaleCohomologyFoundations §F.6.

**Checks.**

- For curves the maps agree with the incidence maps of the specialization sequence of 7a.2, in its residue coordinates.
- For three intersecting components, the alternating second boundary vanishes.
- For a smooth model there are no adjacent intersection strata, so every first-page differential vanishes.

### 7a.9 Monodromy on the weight spectral sequence

**Comparison.** The twisted `N` induces `E_1^{p,q}(1) → E_1^{p+2, q−2}`, the identity on common stratum summands in the
normalized coordinates of 7a.7 and zero on absent summands; it commutes with `d_1` and passes to the abutment. For curves the
page positions force `E_2 = E_∞`, and the induced filtration, recentred at `1`, is that of 7a.3, the identification of `N`
including the residue-coordinate sign. In higher dimension, equality of `M'` with the monodromy filtration on cohomology is
not inferred from the existence of the sequence or from degeneration at `E_2`. The integral statement of the source is for
`ν = T − 1`; `log T` is not defined integrally in general. *Proof sketch.* Saito's Corollary 2.2.4(2) computes `N` on each common
summand; compatibility with `d_1` comes through the filtered morphism; for curves compute the `E_2` kernels and cokernels
and compare their edge pairing with 7a.3. (Saito 2003, Corollary 2.2.4(2); Illusie 2021, §§6.3–6.4;
Liu–Tian–Xiao–Zhang–Zhu 2022, §5.9, p. 233.) *Needs:* 7a.8, 7a.3.

**Checks.**

- The curve `E₂` pieces are graph cohomology, component `H¹` and graph homology with the stated twist.
- The rational logarithm and `T−1` have the same leading action on `gr`, without claiming they are equal on every higher-dimensional complex.
- For a proper `I₂` curve, the induced outer-grade operator has matrix `[−2]` in the graph bases, agreeing with 7a.3.

### Examples

- The node `uv = π` (relative dimension one, two branches): `R^1Ψ = Λ(−1)` at the node with trivial sheaf-level action, the
  weight spectral sequence of a proper curve with this local picture has `E_1^{−1,2} = H^0(nodes)(−1)`,
  `E_1^{0,1} = ⊕ H^1(components)`, `E_1^{1,0} = H^0(nodes)`, and `N` maps `E_1^{−1,2}(1)` isomorphically onto `E_1^{1,0}`.
- Three components through a point (`r = 2`): the stalks of `R^qΨ` have ranks `1, 2, 1`.

### Dependencies

Layers LPV.0, LPV.1, LPV.2 and LPV.6; TauCetiRoadmap StableReduction Layers 1 and 4; TauCetiRoadmap EllipticCurves
Layer 4; NeronModelsAndSemistableAbelianVarieties Layers 3 and 4; AbelianSchemesAndArithmeticModuli Layer A4;
InverseGaloisAndArithmeticFundamentalGroups §IG.0.T1 (curve/Jacobian comparison); EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.5, EtaleCohomologyFoundations §F.6; Mathlib (spectral
objects and spectral sequences, `DerivedCategory`).

## Layer LPV.7b: Invariant cycles

This layer builds the geometric half of Deligne's invariant-cycle theorems (Weil II §3.6 and §6.2): the specialization
map into inertia invariants, the continuous Wang sequence, arithmetic spreading of a degeneration to a finite field,
the localization–Wang cross with its support duality, the support-bound weak Lefschetz theorem, the extension
obstruction for general pencils and the comparison of monodromy images on a general line. It proves the local and
global invariant-cycle theorems in the form in which every input except the theory of weights is supplied here: the
local theorems assume that the Frobenius spectra of the two outer terms of the cross are disjoint, and the global
theorem assumes local surjectivity at the singular members of a general pencil. Deligne's weight theory supplies
exactly these hypotheses (Weil II, Lemmes 3.6.2–3.6.3, Proposition 6.2.6 and Théorème 6.2.9); this roadmap does not develop
weights. The complex local invariant-cycle theorem is stated in the same conditional form for mixed Hodge
structures. Throughout, `k` is algebraically closed, `ℓ` is invertible in `k`, and coefficients are `ℚ_ℓ` or `ℚ̄_ℓ`.

### 7b.1 Specialization into invariants

**Construction.** For `f : X → S` proper over a henselian trait and `K ∈ D^b_c(X, ℚ_ℓ)`, the specialization map
`sp_i : H^i(X_s̄, K) → H^i(X_η̄, K)` of 0.6 has image in the invariants of the continuous inertia representation, because
inertia acts trivially on `i^*K` and the vanishing triangle is equivariant. Define
`InvariantCycles.invariantSpecialization` as its corestriction (Mathlib `LinearMap.codRestrict`) to
`Representation.invariants`; its composite with the inclusion is `sp_i`. It is defined for every proper family;
surjectivity is a theorem only under the hypotheses of 7b.5, 7b.6 and 7b.8.

- `InvariantCycles.invariantSpecialization_coe`: The inclusion of invariants composed with `sp^I` equals `sp`.
- `InvariantCycles.invariantSpecialization_range`: `sp^I` is surjective exactly when `range sp` equals the invariant submodule.
- `InvariantCycles.invariantSpecialization_unique`: A linear map to invariants whose composite with inclusion is `sp` equals `sp^I`.
- `InvariantCycles.invariantSpecialization_natural`: For equivariant cohomology comparison maps commuting with `sp`, the corestricted maps commute too.

*Source.* Weil II, introduction to §3.6, p. 212, and 6.2.9. *Needs:* 0.6; Mathlib `Representation.invariants`,
`Representation.mem_invariants`, `Representation.trivial`, `LinearMap.codRestrict`; ArithmeticGaloisDuality Layer R02.1
(continuous coefficients); DerivedModuleAlgebra §1.T.1 (inverse limits); EtaleCohomologyFoundations §§F.1–F.2.

**Checks.**

- `InvariantCycles.invariant_sp_identity_test`: For the identity map and trivial action, the corestriction is surjective.
- `InvariantCycles.invariant_sp_zero_test`: The zero map to a nonzero trivially acted-on one-dimensional space corestricts but is not surjective.
- `InvariantCycles.invariant_sp_unipotent_test`: On `ℚ²` with `ρ(t)(a, b) = (a + tb, b)`, the injection `a ↦ (a, 0)` corestricts surjectively onto the invariants `ℚ ⊕ 0`, while the identity map `ℚ² → ℚ²` does not land in the invariants and has no corestriction.
- The underlying map is exactly `sp_i`.
- There is no surjectivity assertion in this construction.

### 7b.2 The continuous Wang sequence

**Theorem.** For `f : X → S` proper over the strict henselization `S` of a smooth curve at a point, in equal
characteristic, and `K ∈ D^b_c(X, ℚ_ℓ)` (or a finite extension of `ℚ_ℓ`), continuous Hochschild–Serre gives the exact sequence

```text
0 → H^{i−1}(X_η̄, K)_I(−1) → H^i(X_η, K) → H^i(X_η̄, K)^I → 0.
```

No smoothness of the total space or of the generic fibre is needed. *Proof sketch.* Let `I' = ker(t_ℓ : I → ℤ_ℓ(1))`; it is
profinite of order prime to `ℓ` (wild inertia and the other tame factors), so averaging over its finite quotients makes
invariants and coinvariants exact on compatible `ℤ/ℓ^n`-systems, with `W = V^{I'} ≅ V_{I'}`. The quotient `ℤ_ℓ(1)` has
cohomological dimension one: `H^0(ℤ_ℓ(1), W) = V^I`, `H^1(ℤ_ℓ(1), W) = V_I(−1)`, `H^j = 0` for `j ≥ 2`. The two-column spectral
sequence gives the exact sequence at each finite level; pass to the limit and rationalize under finite
constructibility. Discrete group cohomology of the underlying abstract group is not this theorem. (Weil II, proof
of 3.6.1, equations (1)–(5), p. 213; proof of 6.2.9, p. 249.) *Needs:* EtaleCohomologyFoundations §F.3a, 0.8; ArithmeticGaloisDuality Layers R02.1
(continuous cochains and lattices) and R02.2 (Hochschild–Serre, the case of a quotient of cohomological
dimension one); DerivedModuleAlgebra §1.T.1 (inverse limits); EtaleCohomologyFoundations §§F.1–F.2.

**Checks.**

- For trivial rank-one coefficients, `H¹(I,ℚ_ℓ)=ℚ_ℓ(−1)`.
- The degree-two term vanishes without treating `ℤ_ℓ` as a discrete infinite cyclic group.
- For a nontrivial finite quadratic inertia line with rational coefficients, both invariants and coinvariants vanish; so do its inertia cohomology groups.

### 7b.3 Arithmetic spreading

**Theorem (full local monodromy under arithmetic specialization).** Prove
`InvariantCycles.arithmeticLocalMonodromy`: let `C→A` be a smooth relative curve over an
integral finite-type arithmetic base on which ℓ is invertible, with a marked section,
and `f:X→C` proper. Let `K` be a
bounded constructible rational ℓ-adic complex on `X`, with a compatible integral realization,
whose hypercohomology direct images are lisse on the complement of the section. After shrinking
`A`, the geometric cohomology at the section and on the punctured curve, the specialization
morphism, its image, and the full local inertia-fixed subspace identify under transport between
geometric fibres. Retain the finite wild inertia action; do not replace inertia by its
prime-to-residue-characteristic quotient.

*Proof sketch.* Generic base change makes the special direct image and the specialization
morphism locally constant. Étale locally on `A`, choose a base section off the marked
section and apply 3.6 to the lisse cohomology systems on the punctured curve,
retaining their finite initial covers and congruence towers. Its boundary-stabilizer
comparison identifies the full inertia images, including finite wild inertia;
equivariance identifies their invariants
and the specialization image. (Weil II §§1.11.1–1.11.3, pp. 184–185; proofs of 3.6.1 and 6.2.9.)
*Needs:* 0.6–0.8, 3.6, 7b.1; EtaleCohomologyFoundations §§F.0–F.4; SchemeAndStackFoundations §§0.8–0.9, 0.21, 0.23 (quasi-sections, descent, finite
normalization and universal homeomorphisms); InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 only for the pro-ℓ tower
of compactified smooth curves with finite étale boundary; ArithmeticGaloisDuality R02.1.

**Checks.**

- In a constant smooth proper family, specialization is the identity, its image is all
  cohomology, and inertia is trivial.
- In a nonseparating one-node family, `sp H¹=ker N` has codimension one; this image and
  the nonzero rank-one monodromy survive the comparison.
- In characteristic two the local family `x²+tx+t=0` has wild quadratic generic monodromy:
  its `H⁰=ℚ_ℓ²` has diagonal inertia invariants for `ℓ≠2`, whereas omitting wild inertia
  would incorrectly give both dimensions.

**Lemma.** Let `S = Spec k[T]^h_(T)`, `f : X → S` proper with `X` essentially smooth over `k` and `X_η` smooth. Then `f` spreads out to
`f' : X' → C` with `C` a smooth `k`-curve with a marked point, `X'` smooth, and `f'` smooth away from the marked point; and,
after shrinking an integral arithmetic parameter base of finite type over `ℤ` and choosing a closed point, to a family
over a smooth curve over a finite field `𝔽_q` with an `𝔽_q`-rational marked point, such that the specialization maps of
cohomology and the image of local inertia in the relevant ℓ-adic local system are preserved. What is preserved is the
inertia-fixed subspace and the specialization image, not only Betti numbers. *Proof sketch.* Limit descent of finitely
presented data algebraizes the henselian family with its marked point;
`arithmeticLocalMonodromy` preserves the full inertia-fixed subspace and specialization image,
including finite wild inertia, on a small enough parameter open; proper and smooth base change
transport the cohomology maps. (Weil II, proof of 3.6.1, p. 213, referring to 1.11.1–1.11.3.)
*Needs:* 7b.1, `arithmeticLocalMonodromy`; SchemeAndStackFoundations Layer 0, §0.9
(limits of finitely presented data); EtaleCohomologyFoundations §§F.2–F.3; ArithmeticGaloisDuality
Layer R02.1.

**Checks.**

- For a constant smooth proper family, the comparison carries identity specialization to identity specialization.
- For a nonseparating nodal genus-g curve, the preserved specialization image has dimension `2g−1` and generic `H¹` has dimension `2g`.
- For a separating node, specialization on `H¹` is an isomorphism but special `H²` has two component classes mapping by sum to the generic trace line.

### 7b.4 The localization–Wang cross

**Comparison.** If `X` is essentially smooth over `k` of pure dimension `d` and proper over `S`, combine the Wang sequence with the
localization sequence `H^i(X) → H^i(X_η) → H^{i+1}_{X_s}(X)`, proper base change `H^i(X) ≅ H^i(X_s)`, and support duality
`H^{i+1}_{X_s}(X) ≅ H^{2d−i−1}(X_s)^∨(−d)`. The result is an exact cross with centre `H^i(X_η)`, lower term `H^i(X_s)`, upper term
`C = H^{2d−i−1}(X_s)^∨(−d)` and right term `B = H^i(X_η̄)^I`, the composite `H^i(X_s) → B` being `sp^I`. After arithmetic spreading the
cross is Frobenius-equivariant. It is a statement with rational coefficients; no torsion-free integral duality is
assumed. *Proof sketch.* Localization (EtaleCohomologyFoundations §§F.1–F.2), Verdier duality on the smooth `X` (EtaleCohomologyFoundations §F.5, EtaleCohomologyFoundations §F.6), proper base change, and the
Wang sequence of 7b.2, keeping all maps and arithmetic actions. (Weil II, proof of 3.6.1, equations (6)–(8), p. 214.)
*Needs:* 7b.1, 7b.2; EtaleCohomologyFoundations §F.5 (biduality) and EtaleCohomologyFoundations §F.6 (smooth trace and purity).

**Checks.**

- The upper twist is `−d` and its cohomological degree is `2d − i − 1`.
- Integral torsion is explicitly excluded from this dual-vector-space identification.

- For `X=ℙ¹×S` with `d=2` and `i=0`, the upper term is `H³(ℙ¹)^∨(−2)=0` and the right term is the constant line, so the cross gives identity specialization.

### 7b.5 The local invariant-cycle theorem

**Lemma (spectral separation).** Let `F` act compatibly on an exact cross of finite-dimensional vector spaces over an
algebraically closed field: `L → M → C` exact at `M`, and `M → B → 0` exact, with `F`-equivariant maps. If no eigenvalue of `F` on
`B` is an eigenvalue of `F` on `C`, then the composite `L → B` is surjective. *Proof sketch.* Taking the sum of the generalized eigenspaces of `F`
for the eigenvalues of `F` on `B` is an exact functor on finite-dimensional `F`-modules; it is all of `B`, kills `C`, and so the
corresponding part of `M` maps into the image of `L` and onto `B`. (The argument of Weil II, final paragraph of the proof of
3.6.1, p. 214, with exact weight filtrations replaced by generalized eigenspaces.) *Needs:* Mathlib
`Module.End.maxGenEigenspace`, `Module.End.HasEigenvalue`.

**Checks.**

- `separation_needed`: for `L = 0`, `M = B = C = k` with `M → C` the identity and `F = 1`, the spectra meet and `L → B` is not surjective.
- `separation_trivial_C`: if `C = 0` the lemma reduces to the exactness `L → M → 0` composed with `M → B`.
- `separation_two_eigenvalues`: with `q≠1`, `M = k²`, `F = diag(1, q)`, `B` the first coordinate and `C` the second, the hypothesis holds
  and the conclusion is the surjectivity of `ker(M → C) = k ⊕ 0` onto `B`.

**Theorem (local invariant cycles, conditional form).** Let `S = Spec k[T]^h_(T)` and `f : X → S` proper, with `X` essentially
smooth over `k` and `X_η` smooth. Suppose that for one finite-field model of 7b.3 the Frobenius spectra on
`B_0 = H^i(X_{0,η̄}, ℚ_ℓ)^I` and on `C_0 = H^{2d−i−1}(X_{0,s̄}, ℚ_ℓ)^∨(−d)` are disjoint. Then
`H^i(X_s, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ)^I` is surjective. The theorem is about this equicharacteristic, algebraizable situation with
rational coefficients; it is not asserted over an arbitrary mixed-characteristic trait or with integral coefficients.
Deligne's weight bounds give the hypothesis for every such model: `B_0` has weights at most `i` and `C_0` weights at least
`i + 1` (Weil II, Lemmes 3.6.2–3.6.3), so the unconditional theorem is Weil II, Théorème 3.6.1. *Proof sketch.* Spread out
(7b.3), apply the cross (7b.4) over the finite-field model and the spectral separation lemma, and transport the
surjectivity back through the preserved specialization maps and inertia images. (Weil II, Théorème 3.6.1 and its proof,
pp. 213–214.) *Needs:* 7b.1, 7b.3, 7b.4, the spectral separation lemma.

**Checks.**

- For a smooth proper family the conclusion holds without the hypothesis: specialization is an isomorphism and
  inertia acts trivially (0.5).
- For a nodal curve, the conclusion agrees with the weight-free calculation of 7a.3: `sp` maps `H^1(Y)` onto `ker N = V^I`.
- An arbitrary mixed-characteristic trait is not an instance of this statement.

### 7b.6 The complex local invariant-cycle theorem

**Construction (Betti localization–Wang cross).** Build
`InvariantCycles.bettiLocalizationWangCross` for a proper analytic map `f:X→D` with `X`
a smooth complex manifold, smooth over `D*`, and a closed projective factorization
`X⊂ℙ^N(ℂ)×D`. After shrinking the disc about zero, construct the central-fibre retraction
and the compatible cohomology identification `H^i(X,ℚ)≅H^i(X₀,ℚ)` by analytic
stratification and Thom isotopy. Construct localization with supports in the possibly
singular `X₀`, and its maps `H^i(X,ℚ)→H^i(X−X₀,ℚ)→H^{i+1}_{X₀}(X,ℚ)`.
Use the mapping torus of positive punctured-disc monodromy `T` to construct the cohomological
Wang sequence, including the surjection `H^i(X−X₀,ℚ)→ker(T−1)` on `H^i(X_t,ℚ)`.
Build Poincaré–Lefschetz duality with these supports via regular neighborhoods, excision
and the orientation of the smooth total space; no manifold structure on `X₀` is assumed.
Prove compatibility of localization, retraction and Wang maps, so their composite is Betti
specialization. Include independence under further disc shrinking.
(SGA 7 XIV 1.3.5–1.3.6, Thom isotopy and specialization; Weil II 3.6.4, p. 215.)
*Needs:* AlgebraicTopology Stage 5 item 2 and Stage 6 item 4, with the cohomological and
support adaptations built here; ComplexComparisonPartII §C5.2 only for the smooth
punctured-family local system. Build analytic retraction, singular-fibre support duality
and the comparison maps here.

**Checks.**

- For `Y×D` the retraction is projection to `Y`, and Wang evaluation is onto `H^i(Y,ℚ)`.
- For a nodal elliptic degeneration the central fibre is singular; the retraction and
  support localization are defined, and Wang evaluation lands on the rank-one invariant part of `H¹`.
- For monodromy `T=[[1,1],[0,1]]`, Wang evaluation has image `ker(T−1)=ℚe₀`,
  rather than all of `ℚ²`.
- A sufficiently small disc and any further smaller disc give the same specialization maps.

**Theorem (conditional form).** Let `D ⊂ ℂ` be the unit disc and `f : X → D` proper with `X` a smooth complex manifold, `f` smooth over
`D* = D − {0}`, and `X ⊂ P^N(ℂ) × D` a closed analytic subspace whose projection is `f`. After the disc shrinking of
`bettiLocalizationWangCross`, for `t ∈ D*` the Betti analogue of the cross
of 7b.4 (localization, topological Wang sequence over the punctured disc, Poincaré–Lefschetz duality) has centre
`H^i(X − X_0, ℚ)`, lower term `H^i(X_0, ℚ)`, upper term `H^{i+1}_{X_0}(X, ℚ)` and right term `H^i(X_t, ℚ)^{π_1(D*, t)}`. If this cross underlies
a cross of mixed Hodge structures (Tau Ceti's `TauCeti.Hodge.MixedHodgeStructure`) in which the right term has weights at most `i` and the
upper term weights at least `i + 1`, then `H^i(X_0, ℚ) → H^i(X_t, ℚ)^{π_1(D*, t)}` is surjective. The mixed Hodge structures with these
weight bounds are Steenbrink's limit mixed Hodge structure and Deligne's mixed Hodge structure on local cohomology, which
this roadmap does not construct. *Proof sketch.* The weight filtration is strict for morphisms of mixed Hodge structures
(Completed HodgeStructures, layer L2, mixed Hodge structures and strictness), so `W_i` is exact on the
cross and the separation argument of 7b.5 applies. (Weil II, 3.6.4, p. 215.) *Needs:* the spectral separation lemma
of 7b.5 in its mixed-Hodge form; Completed HodgeStructures, layer L2 (mixed Hodge structures, strictness); Tau Ceti
`TauCeti.Hodge.MixedHodgeStructure`; `InvariantCycles.bettiLocalizationWangCross` above;
ComplexComparisonPartII §C5.2 for the punctured-family local system.

**Checks.**

- The trivial family `Y × D` has identity specialization.
- The rational coefficients and the projective factorization are part of the statement; without the weight hypothesis
  the conclusion is not asserted.
- For a projective nodal elliptic degeneration over the disc, the invariant part of smooth-fibre `H¹` is a line and the special nodal cubic maps onto it.

### 7b.7 Arithmetic models of complexes

Throughout 7b.7–7b.11 use `X⊂ℙ^N_k` with `N≥1`; a projective embedding into `ℙ⁰`
can be composed with `ℙ⁰⊂ℙ¹`. The general-incidence construction below supplies the
pencils in these sections for arbitrary projective `X`.

**Construction (hyperplane incidence for projective schemes).** Build
`InvariantCycles.hyperplaneIncidence` for every closed immersion `X⊂ℙ^N_k`, `N≥1`, over an
algebraically closed field, with no smoothness or reducedness assumption on `X`.
Let `Z={(x,H):x∈H}⊂X×(ℙ^N_k)∨`, with projections `q:Z→X` and `f:Z→(ℙ^N_k)∨`.
Construct the rank-`N` kernel bundle `E` of evaluation of linear forms at `x`.
Hyperplanes through `x` are lines in `E_x`, so `Z=ℙ(E^∨)` in the quotient convention
of AlgebraicModuliForArithmeticGeometry §1.1. Prove `q` smooth projective of relative dimension `N−1` and `f`
projective, compatibly with base change. For a line `D` define `X̃_D=Z×_{(ℙ^N)∨}D`,
`i_D:X̃_D→Z` and `f̃:X̃_D→D`; its fibres are the scheme-theoretic hyperplane sections.
Supply this incidence diagram throughout 7b.7–7b.11. When the two axis equations form a
regular sequence along their common zero locus, prove `X̃_D≅Bl_{A∩X}X` by the Rees-algebra
presentation; an empty axis gives `X̃_D≅X`. A sufficiently general pair over the infinite
field `k` avoids the successive associated points, giving this regular-sequence condition
where the axis is nonempty, even for singular `X`. This identification supplies the axis
comparison used in 7b.10. It specializes to 3.3 for smooth `X` with transverse axis.
(Weil II 6.2.10, diagram (6.2.10.1), p. 249; projective bundles and the Rees presentation.)
*Needs:* AlgebraicModuliForArithmeticGeometry §1.1; SchemeAndStackFoundations Layers 0–1
(associated points, scheme-theoretic intersections, kernel bundles); StableReduction Layer 4
(Rees-algebra blow-ups). Prove the incidence and axis comparisons here on the stated domain.

**Checks.**

- For a singular plane nodal cubic, `q:Z→X` is a smooth `ℙ¹`-bundle although `Z` is singular.
- For `X=Spec k⊂ℙ¹`, `Z` is its unique containing hyperplane and `q` is the identity;
  a general parameter has empty fibre.
- For a smooth surface and transverse axis, the line incidence is the blow-up of 3.3.
- For `X=V(x₀)⊂ℙ²` and axis equations `x₀,x₁`, the first equation is zero on `X`
  and the axis is a point; the regular-sequence hypothesis fails, but the incidence family exists.

**Theorem (generic noncharacteristic hyperplane restriction).** Prove
`InvariantCycles.genericHyperplaneRestriction`: for `X⊂ℙ^N_k` projective over an algebraically
closed field and `K∈D^b_c(X,ℚ̄_ℓ)`, `ℓ≠char k`, there is a dense open in the dual parameter
space on which the universal hyperplane incidence family with pulled-back `K` is universally
locally acyclic. For a section `h:Y→X` in that open the noncharacteristic exchange gives
`h^!K≅h^*K(−1)[−2]` and `D_Y(h^*K)≅h^*(D_XK)(−1)[−2]`. The same exchange applies to restriction
of the incidence family to a sufficiently general line; with the smooth incidence projection
of relative dimension `N−1` and the line restriction of codimension `N−1`, their duality twists
and shifts cancel. Empty sections contribute zero objects. *Proof sketch.* Apply EtaleCohomologyFoundations §F.3 to the
universal incidence morphism and both `K` and `DK`; use smooth purity for its projection to `X`,
then locally acyclic base change and duality for hyperplane and line restrictions. (SGA 4½
[Th. finitude], generic acyclicity; Weil II, proofs of 6.2.11–6.2.12, p. 250.)
*Needs:* EtaleCohomologyFoundations §§F.1–F.6; `InvariantCycles.hyperplaneIncidence` above.

**Checks.**

- On smooth `X` with constant `K`, a smooth hyperplane section has dualizing complex
  `Λ(dim X−1)[2 dim X−2]`, exactly the displayed twist and shift.
- For a skyscraper at `x`, a general hyperplane avoiding `x` has both restrictions zero.
- On `X=ℙ¹` with a skyscraper at `x`, the section `{x}` fails the exchange: `h^!K=Λ`
  and `h^*K(−1)[−2]=Λ(−1)[−2]`; generality cannot be dropped.

**Definition (arithmetic model at a geometric generic point).** For a projective `k`-scheme `X` and `K ∈ D^b_c(X, ℚ̄_ℓ)`, an
arithmetic model `InvariantCycles.GeometricGenericArithmeticModel X K` consists of an integral scheme `A_0` of finite type over
`ℤ[1/ℓ]`, a morphism `Spec k → A_0` onto its generic point, a proper `X_0 → A_0`, a complex `K_0 ∈ D^b_c(X_0, ℚ̄_ℓ)`, and isomorphisms
`X ≅ X_0 ×_{A_0} Spec k` (a pullback square) and `K ≅` the pullback of `K_0`. It is data, not a proposition. A complex is
*potentially pure of weight `w`* when it has such a model with `K_0` pure of weight `w` in Deligne's arithmetic sense (Weil II,
6.2.7); purity belongs to the theory of weights and is not part of the structure here. API:

- `InvariantCycles.GeometricGenericArithmeticModel.base`, `.family`: the arithmetic base `A_0` and the model `X_0`, with the
  generic point, the structure map and properness as separate projections.
- `InvariantCycles.GeometricGenericArithmeticModel.realization`: the complex isomorphism `pullback(K_0) ≅ K`; the family
  base-change square is a separate projection.
- `InvariantCycles.GeometricGenericArithmeticModel.transport`: transport along compatible isomorphisms of `X` and `K`.
- `InvariantCycles.GeometricGenericArithmeticModel.shiftTwist`: a model of `K` gives one of `K[a](b)`.
- `InvariantCycles.GeometricGenericArithmeticModel.mk`, `.ext`: construction from all the data, and equality of models
  when all scheme, map, complex and realization data agree (proof fields are irrelevant; schemes and isomorphisms are
  data).

*Source.* Weil II §6.2.7 and Définition 6.2.8(a)–(d), p. 248. *Needs:* EtaleCohomologyFoundations §§F.1–F.4;
SchemeAndStackFoundations §0.9 (models and pullback squares).

**Checks.**

- A smooth projective scheme defined over a finitely generated subring of `k`, with constant complex, has a geometric-generic arithmetic model after replacing the base by its integral image.
- Shifting and twisting the constant model changes only the complex and its realization, retaining the family square.
- A map landing in a proper closed subset of an integral arithmetic base fails the geometric-generic condition even for the constant complex.

**Definition (arithmetic model of a trait family).** For `S = Spec k[T]^h_(T)`, `f : X → S` proper and `K ∈ D^b_c(X, ℚ̄_ℓ)`,
`InvariantCycles.TraitArithmeticModel f K` consists of an integral `A_0` of finite type over `ℤ[1/ℓ]` with `Spec k` mapping to its
generic point, a smooth relative curve `S_0 → A_0` with a section, a proper `f_0 : X_0 → S_0`, a complex `K_0`, and isomorphisms
identifying `S` with the henselization of `S_0 ×_{A_0} Spec k` along the section and `(X, K)` with the pullback of `(X_0, K_0)`. A
trait family is potentially pure of weight `w` (Weil II, 6.2.8) when it has such a model with `K_0` pure of weight `w`. API:
`InvariantCycles.TraitArithmeticModel.base`, `.family`, `.realization`, `.transport`, `.mk`, `.ext` as above, and
`InvariantCycles.TraitArithmeticModel.shrink` (restriction to a nonempty open of `A_0` containing the image of the generic
point, keeping the section).

*Source.* Weil II, Définition 6.2.8(a)–(d), p. 248; 6.2.7; proof of 6.2.12, p. 250. *Needs:* Mathlib
`AlgebraicGeometry.Scheme`, `IsProper`, `IsIntegral`, `LocallyOfFiniteType`, `QuasiCompact`, `IsOpenImmersion`,
`SmoothOfRelativeDimension`, `IsGenericPoint`, `CategoryTheory.IsPullback`, `HasDerivedCategory.standard`,
`CategoryTheory.shiftFunctor`; EtaleCohomologyFoundations §§F.1–F.2; SchemeAndStackFoundations Layer 0.

**Checks.**

- `model_constant`: a smooth projective `X` defined over a finitely generated subring of `k`, with `K = ℚ̄_ℓ`, has the evident model,
  with its fibre and complex identifications.
- `model_shift_twist`: from a model of `K` one gets a model of `K[a](b)` with the same schemes; if `K_0` is pure of weight `w`, the new
  one is pure of weight `w + a − 2b`.
- `model_not_closed_point`: a parameter map `Spec k → A_0` factoring through a proper closed subset of `A_0` is not a model, even if
  the schemes and the complex are present.

**Lemma (models along a general incidence pencil).** Let `X ⊂ P` be projective, `K` with a model at the geometric generic point,
and `X ← Z ← X̃` the incidence diagram (`q : Z → X` the smooth incidence projection, `i : X̃ → Z` the restriction to a sufficiently
general line `D`, `hyperplaneIncidence`). Then, after shrinking the arithmetic base, the model spreads along the incidence diagram and gives
a trait model of `i^*q^*K` at every point of `D`, and `D(i^*q^*K) ≅ i^*q^*DK` in Deligne's normalization of the incidence pullback,
the relative-dimension shifts cancelling (`q` smooth, `i` generic-locally-acyclic for `K`). For a sufficiently general hyperplane section `Y`,
`D(K|_Y) = DK|_Y(−1)[−2]`. Arbitrary closed immersions are not covered. When `K_0` is pure, the directional weight
estimates and this duality identity make the pulled-back model pure (Weil II, proof of 6.2.12); that conclusion belongs
to the theory of weights. *Proof sketch.* Spread the incidence diagram, the line and its section along the model;
apply `genericHyperplaneRestriction` and the shifted Verdier duality exchanges for smooth and generic-locally-acyclic
pullback. (Weil II, proof of 6.2.12, p. 250; the duality comparison in the proof of 6.2.11.) *Needs:* the two definitions
above, `genericHyperplaneRestriction`, `hyperplaneIncidence`; EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.5 (biduality, exchange with pullback).

**Checks.**

- For a general smooth hyperplane section, `D(K|_Y) = DK|_Y(−1)[−2]`.
- The statement needs the generality of the line; a special line through a singular point of `K` is not covered.

- For constant `K` on a smooth surface, restriction to a general smooth hyperplane curve has dual `Λ(1)[2]`, obtained from `Λ(2)[4]` by the displayed twist and shift.

### 7b.8 Local invariant cycles for complexes

**Theorem (conditional form).** In the trait setting of 7b.7, let `f : X → S` be proper and `K ∈ D^b_c(X, ℚ̄_ℓ)` with a trait arithmetic
model. The cross of 7b.4 holds for `K` with upper term `H^{i+1}_{X_s}(X, K) ≅ H^{−i−1}(X_s, DK)^∨`, with no smoothness of `X` or `X_η`. If,
for the finite-field fibres of the model over a dense open of `A_0`, the Frobenius spectra of the right term and the upper
term are disjoint, then `H^i(X_s, K) → H^i(X_η̄, K)^I` is surjective for every integer `i`. When `K_0` is pure, Deligne's theorems that
proper direct images preserve purity and that compactly supported direct images do not increase weights (Weil II,
6.2.3, 6.2.6–6.2.7) give the separation, and the unconditional statement is Weil II, Théorème 6.2.9. *Proof sketch.* Spread all
maps along the model; use the Wang sequence of 7b.2 in hypercohomology and the support duality of EtaleCohomologyFoundations §F.5; apply the spectral
separation lemma at a closed point of the dense open; descend the surjectivity through the model realization. (Weil II,
Théorème 6.2.9 and its proof, pp. 248–249.) *Needs:* 7b.1, 7b.2, 7b.3 (`arithmeticLocalMonodromy`), 7b.5 (separation lemma), 7b.7; EtaleCohomologyFoundations §F.5.

**Checks.**

- For constant coefficients on a smooth total space this is 7b.5 after choosing a model.
- The statement allows complexes with several nonzero cohomology sheaves, not only lisse sheaves.

- For the zero complex with its zero arithmetic model, both terms of the cross and specialization image are zero in every degree.

### 7b.9 Support bounds and weak Lefschetz

**Lemma (affine vanishing from a dual support bound).** Let `X ⊂ P^N` be projective over `k`, `K ∈ D^b_c(X, ℚ_ℓ)`, `n ∈ ℤ`, and assume
`dim Supp ℋ^j(DK[−2n − 2]) ≤ n + 1 − j` for every `j` (`dim ∅ = −∞`), equivalently `dim Supp ℋ^q(DK) ≤ −n − 1 − q`. Then for every hyperplane
complement `A = X − Y`, which is affine, `H^i_c(A, K) = 0` for `i ≤ n`. Neither smoothness of `X` nor purity of `K` is assumed. Define
`InvariantCycles.dualSupportAffineVanishing`. *Proof sketch.* Affine Artin vanishing for constructible sheaves
(`H^a(A, F) = 0` for `a > dim Supp F`, EtaleCohomologyFoundations §§F.2–F.3) applied to the cohomology sheaves of `DK` gives
`H^a(A, ℋ^q DK) = 0` for `a + q ≥ −n`, hence `H^{−i}(A, DK) = 0` for `i ≤ n`; duality `H^i_c(A, K)^∨ ≅ H^{−i}(A, DK)` concludes. (Weil II,
Proposition 6.2.11 and its proof, pp. 249–250; compare 4.1.6.) *Needs:* EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.5;
EtaleCohomologyFoundations §§F.2–F.3.

**Checks.**

- For `X` smooth of dimension `n + 1` and `K = ℚ_ℓ`, `DK[−2n − 2] = ℚ_ℓ(n + 1)`; the bound at `j = 0` is `n + 1`, as required.
- Replacing `n + 1 − j` by `n − 1 − j` would wrongly exclude this case.

- For `X=ℙ¹`, `K=ℚ_ℓ` and `n=0`, the affine complement has `H⁰_c=0`; the degree-zero bound is attained.

**Theorem (weak Lefschetz under a support bound).** Under the hypothesis of the lemma, for every hyperplane section `Y`,
singular ones included, restriction `H^i(X, K) → H^i(Y, K|_Y)` is an isomorphism for `i < n` and injective for `i = n`. For a sufficiently
general `Y`, `genericHyperplaneRestriction` gives `D_Y(K|_Y) = DK|_Y(−1)[−2]`, and the same bound holds on `Y` with `n` replaced by `n − 1`.
*Proof sketch.* The localization sequence of `A ⊂ X ⊃ Y` and the lemma; `genericHyperplaneRestriction` for the general section, keeping
its shifts; the support dimensions drop by one on a general hyperplane. (Weil II, Proposition 6.2.11(i) and the first two
paragraphs of its proof, pp. 249–250.) *Needs:* the lemma, 7b.7 (`genericHyperplaneRestriction`); EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.5.

**Checks.**

- The boundary degree n is injective, not asserted surjective.
- The constant sheaf on a smooth projective (n + 1)-fold recovers ordinary weak Lefschetz.
- For a conic in `ℙ²` with `n=0`, restriction `H⁰(X)→H⁰(Y)` to a general two-point section is the injective diagonal and is not onto.

### 7b.10 General pencils for complexes

**Comparison (monodromy on a general line).** Let `Z → P̌` be the full hyperplane incidence family of `X` and `K` as above, and
`U ⊂ P̌` a dense open over which all `R^j f_* q^*K` are lisse (generic lissity of constructible complexes). For a sufficiently
general line `D` and `u ∈ V = D ∩ U`, the images of `π_1(V, u)` and `π_1(U, u)` in `GL(H^j(Y_u, K))` agree, for each of the finitely many
relevant `j`, and so do their invariant subspaces. This is an equality of images, not an isomorphism of fundamental groups.
*Proof sketch.* Choose `U` by generic lissity (EtaleCohomologyFoundations §§F.1–F.2); apply the Bertini theorem 5.1 to the finitely many lisse sheaves
`R^j f_*q^*K` on `U`; compare images and invariants with the same base points and paths. (Weil II, 6.2.10, formulas
(6.2.10.1)–(6.2.10.2), p. 249.) *Needs:* `hyperplaneIncidence` (7b.7), 5.1; EtaleCohomologyFoundations §§F.1–F.2; Mathlib
`Representation.invariants`.

**Checks.**

- For the conic incidence family (`p≠2`), both the full-complement and the general-line monodromy images are the order-two swap on `ℚ_ℓ²`; both invariant spaces are the diagonal line.
- For `X` a line in `P²` and constant `K`, the singleton hyperplane fibres give the trivial image for both groups.
- For `K=0`, both representations and invariant spaces are zero.

**Definition (relative cohomology and transported local maps).** Over an algebraically closed field `k`,
with `Λ=ℚ_ℓ` or `ℚ̄_ℓ`, `ℓ≠char k`, use the enhanced complexes of EtaleCohomologyFoundations §§F.1–F.4 and define
`RΓ(T mod T′, L)=fib(RΓ(T,L)→RΓ(T′,L))=cone(RΓ(T,L)→RΓ(T′,L))[−1]` for a morphism
`T′→T` and `L∈D⁺_c(T,Λ)`, with `L` pulled back to `T′`. Its integer cohomology groups are `H^i(T mod T′,L)`;
provide the fibre triangle, its long exact sequence and functoriality for coherent squares.
For `t,b∈ℙ¹(k)`, write `ℙ¹_(t)` and `ℙ¹_(b)` for their strict henselizations and choose
geometric generic points `η̄_t`, `η̄_b`. For each `ℙ¹`-isomorphism `σ:η̄_b≅η̄_t`, construct
`λ_{b,σ}:H¹(ℙ¹ mod t,L)→H¹(ℙ¹_(b) mod η̄_b,L)` by the coherent restriction square:
its top arrow restricts global sections to `ℙ¹_(b)`, and its bottom arrow is
`RΓ(t,L)≅RΓ(ℙ¹_(t),L)→RΓ(η̄_t,L)→RΓ(η̄_b,L)`, with the last arrow induced by `σ`.
Prove the strict-local comparison used here and naturality in `L`. Changing `σ` replaces
this last arrow by the corresponding stalk transport; compositions obey the transport
cocycle and induce the same compatibilities on fibres and cohomology. The kernels of
individual `λ_{b,σ}` need not be independent of `σ`. (Weil II §§4.3.4–4.3.5, pp. 223–224.)
*Needs:* EtaleCohomologyFoundations §F.0 (geometric points and paths), EtaleCohomologyFoundations §§F.1–F.4;
EnhancedDerivedSheaves §§0.1–0.4 (`ClassicalDerived.enhancedCategory`, replacements
and functor coherence); strict henselization from ModularCurves Layer 4D.

**Checks.**

- For `T′=T` with the identity restriction, the relative complex is zero.
- For a degree-zero sheaf with `H¹(T,L)=0`, the long exact sequence identifies
  `H¹(T mod T′,L)` with the cokernel of `H⁰(T,L)→H⁰(T′,L)`.
- In the three-sheet cover of `wild_twisted_cubic`, relabelling the sheets changes the
  local fixed plane from `x₁=x₂` to `x₁=x₃`; the resulting local maps can have different kernels.

**Theorem (local detection of the extension obstruction).** Let `L∈D⁺_c(ℙ¹_k,Λ)` with the
field and coefficients of the preceding definition, assume every negative cohomology sheaf has finite
support, and let `B` be finite with every cohomology sheaf lisse on `ℙ¹−B`. For every `t∈ℙ¹(k)`,
with the chosen geometric generic points above, the map
`H¹(ℙ¹ mod t,L)→∏_{b∈B} ∏_{σ:η̄_b≅η̄_t over ℙ¹} H¹(ℙ¹_(b) mod η̄_b,L)`
with components `λ_{b,σ}` is injective; equivalently, the intersection of all these kernels is zero.
For the general pencil of `K` (the line incidence `X̃_D` of 7b.7 with `f̃:X̃_D→D`), the
obstruction to extending a class from a fibre `Y_u` to `X` is a relative class on `ℙ¹` built
from the shifted fibre of the comparison between pushforward and the axis. The support bounds
of 7b.9 put its negative cohomology sheaves in finite support. Its component `λ_{b,σ}` is the
obstruction to extending the `σ`-transported fibre class over the strict-local pencil at `b`;
this identification is compatible with change of transport. Hence the global obstruction
vanishes when all transported local obstructions vanish. *Proof sketch.* Remove the negative
and point-supported part, reducing to `H⁰` and `H¹` of sheaves, with the degree-zero sheaf
having no point-supported sections. A relative torsor killed by every `λ_{b,σ}` has trivial
local action for every transported inertia subgroup. Their images generate by 5.3, so the
torsor extends trivially over `ℙ¹`, with its trivialization at `t`. Apply this to the relative
axis comparison using 7b.9. (Weil II Proposition 4.3.6 and §§4.3.7–4.3.8, pp. 224–226;
proof of 6.2.11.) *Needs:* the preceding relative-cohomology construction;
`hyperplaneIncidence` (7b.7), including its regular-sequence axis comparison for a sufficiently
general line; 7b.9; EtaleCohomologyFoundations §§F.1–F.4; 5.3 (all-characteristic normal generation).

**Checks.**

- An invariant class extending over each singular neighbourhood has zero obstruction for
  every transport, since each transport gives the same invariant fibre class.
- The argument uses Weil II 4.3.6–4.3.8 and not the orthogonal splitting of 4.3.9, which depends on hard Lefschetz.
- For a conic pencil, the diagonal class extends across both double-point critical fibres
  and has zero obstruction for every transport and globally.
- `local_obstruction_single_transport`: in characteristic two let `h` be `wild_twisted_cubic`,
  `Λ=ℚ_ℓ` with `ℓ≠2`, `L=h_*Λ` and `t∈𝔸¹(k)`. Finite pushforward gives
  `H⁰(ℙ¹,L)=Λ`, `H¹(ℙ¹,L)=0` and `L_t=Λ³`, hence
  `H¹(ℙ¹ mod t,L)=Λ³/Λ(1,1,1)`, of dimension two. At the sole bad point infinity,
  the strict-local cover has two connected components and no `H¹`; its specialization
  image is `{(u,u,v)}`. Thus the local relative group is one-dimensional, and a single
  transport kills the nonzero global class of `(1,1,0)`.
- `local_obstruction_all_transports`: for the same cover all transports test the three
  pair differences `x₁−x₂`, `x₁−x₃`, `x₂−x₃`. Their common kernel is the diagonal line,
  so they jointly detect the two-dimensional global quotient.

**Theorem (ambient and pencil images).** For `K` with the dual support bound of 7b.9 and a sufficiently general pencil `D`, for
every `u ∈ D` the image of `H^n(X, K)` in `H^n(Y_u, K)` equals the image of `H^0(D, R^n f̃_*(i^*q^*K))`. No degeneration of Leray spectral
sequences, splitting into fixed and vanishing parts, or hard Lefschetz is used. *Proof sketch.* Restriction from `X` gives a
global section of the pencil direct image; conversely, for each `b` and every `σ`, transport
of its fibre value is its geometric generic value near `b`. The strict-local section supplies
a lift of that value, so every `λ_{b,σ}` of its extension obstruction vanishes. The
all-transport obstruction theorem gives an ambient lift; the general-incidence axis comparison of 7b.7
and weak Lefschetz on the general fibres and axis place
the obstruction in the finite-support range. (Weil II, Proposition 6.2.11(ii) and its proof; 4.3.7–4.3.8.) *Needs:* `hyperplaneIncidence` (7b.7), the
all-transport obstruction theorem, 7b.9.

**Checks.**

- For a smooth conic with `K=ℚ_ℓ`, `n=0`, ambient restriction and evaluation of the pencil direct image both have image the diagonal in a two-point fibre.
- At a critical double-point fibre of that pencil both images are its full one-dimensional `H⁰`.
- For `K=0`, both images are zero at every fibre.

### 7b.11 The global invariant-cycle theorem

**Theorem (conditional form).** Let `X ⊂ P^N` be projective over `k`, `K ∈ D^b_c(X, ℚ̄_ℓ)`, `n ∈ ℤ` with
`dim Supp ℋ^j(DK[−2n − 2]) ≤ n + 1 − j` for all `j`, and `U ⊂ P̌` as in 7b.10. Let `D` be a sufficiently general line, `V = D ∩ U`, and assume
that at every point `b ∈ D − V` the local specialization `H^n(Y_b, K) → H^n(Y_{η̄_b}, K)^{I_b}` of the pencil pullback is surjective. Then,
for `u ∈ V`, restriction is an isomorphism `H^n(X, K) ≅ H^n(Y_u, K)^{π_1(U, u)}`; the isomorphism is the corestricted restriction map, not
an abstract isomorphism of vector spaces. When `K` is potentially pure (7b.7), the local hypothesis is 7b.8 applied to the
pulled-back models of 7b.7, with Deligne's weight theorems; the unconditional statement is Weil II, Corollaire 6.2.12.
*Proof sketch.* Injectivity is weak Lefschetz (7b.9). For surjectivity, a `π_1(U, u)`-invariant class is `π_1(V, u)`-invariant (7b.10),
hence a global section of the pencil direct image over `V`. At each `b∈D−V`, every
transport `σ` sends it to the same local inertia-invariant class, because two transports
differ by global monodromy fixing the original class. Local surjectivity lifts this value at
`b`, and the resulting sections glue to a section over `D`. Thus all transported local
extension obstructions vanish, as required by 7b.10; image equality lifts the section to `H^n(X,K)`.
No decomposition `E ⊕ E^⊥` is used. (Weil II, Corollaire 6.2.12 and its proof,
p. 250.) *Needs:* 7b.1, 7b.7, 7b.9, 7b.10.

**Checks.**

- For the smooth conic pencil with `K=ℚ_ℓ` and `n=0`, restriction sends `1` to `(1,1)`, identifying ambient `H⁰` with the swap-invariant diagonal line.
- For `K=0`, corestricted restriction is the unique isomorphism between zero spaces.
- For `K = ℚ_ℓ` on a smooth projective `X` of dimension `n + 1`, `DK[−2n − 2] = ℚ_ℓ(n + 1)` and the bound at `j = 0` is `n + 1`, as
  required; the theorem then identifies `H^n(X)` with the monodromy invariants of the middle cohomology of a general
  hyperplane section, once the local surjectivity holds (by 7b.5, when its spectral hypothesis is supplied).
- The support bound cannot be weakened to `n − 1 − j`: that excludes the constant sheaf of the previous check.

### Dependencies

Layers LPV.0, LPV.1, LPV.3, LPV.5 and LPV.7a; DerivedModuleAlgebra §1.T.1; ArithmeticGaloisDuality Layers R02.1 and R02.2;
InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3; EtaleCohomologyFoundations §§F.1–F.2, EtaleCohomologyFoundations §F.5, EtaleCohomologyFoundations §F.6, EtaleCohomologyFoundations §F.7; SchemeAndStackFoundations Layer 0; EtaleCohomologyFoundations §§F.2–F.3; ComplexComparisonPartII
Layer C5; Completed HodgeStructures (layer L2) and Tau Ceti `TauCeti.Hodge.MixedHodgeStructure`; Mathlib (`Representation.invariants`,
`LinearMap.codRestrict`, generalized eigenspaces, scheme morphism classes).

## Downstream consumers

- **DeligneWeightsAndPurity** uses the pencil theory for Deligne's proofs: the vanishing subspace and its radical
  quotient (4.2, 4.4) and their descent to finite fields (3.5–3.6) for the rational local factors of a pencil; the
  middle-degree reduction (5.5), the Kazhdan–Margulis theorem (5.8) and the blow-up formulas (4.5) for the dimension
  induction; the monodromy filtration and `N` (1.2–1.5) for weight–monodromy statements on curves; and the
  invariant-cycle theorems of Layer LPV.7b, whose hypotheses it discharges with the weight bounds of Weil II to obtain
  Weil II 3.6.1, 6.2.9 and 6.2.12 and hence hard Lefschetz.
- **WeightsInEtaleCohomology** and **WeilConjectures** use the local Picard–Lefschetz formula, the existence of
  pencils and the semistable calculations of Layer LPV.7a.
- **ClassicalAdicEtaleCohomology** §4.5a uses scheme nearby cycles (0.5–0.8),
  trait perversity (6.2), the nearby–Betti adapter (0.8a) and the filtered-colimit
  criterion (6.5).
- **IgusaVarietiesAndTorsionConcentration** uses the filtered-colimit criterion of 6.5
  and the semisimple trace of 1.10.
- **EndoscopicTransferAndUnitaryTraceComparison** uses nearby-cycle duality and perversity (6.1–6.2).
- **AutomorphicGaloisRepresentations** uses the specialization sequence of a proper curve (0.6, 7a.2) for Carayol's
  vanishing-cycle filtration; the semisimple trace of 1.10 is the one used for local models of Shimura varieties.

## References

- [SGA 1] A. Grothendieck et al., *Revêtements étales et groupe fondamental*, Lecture Notes
  in Math. 224, Springer, 1971; Exposés V, XII, XIII.
- [SGA 5] A. Grothendieck et al., *Cohomologie ℓ-adique et fonctions L*, Lecture Notes in Math.
  589, Springer, 1977; Exposé VII.
- [Bhatt–Scholze] B. Bhatt, P. Scholze, *The pro-étale topology for schemes*, Astérisque 369
  (2015), 99–201, §§3, 5–6. https://arxiv.org/abs/1309.1198
- [Fujiwara 2002] K. Fujiwara, *A proof of the absolute purity conjecture (after Gabber)*,
  Adv. Stud. Pure Math. 36 (2002), 153–183; Corollary 6.1.5, as used in ILO XVI §3.7.
- [Vidal 2004b] I. Vidal, *Théorie de Brauer et conducteur de Swan*, J. Algebraic Geom. 13
  (2004), 349–391; Proposition 4.4.1, as used in ILO XVI §3.7.
- [SGA 7 I] A. Grothendieck et al., *Groupes de monodromie en géométrie algébrique (SGA 7 I)*,
  Lecture Notes in Math. 288, Springer, 1972; Exposé I §§0.5, 1.3–1.4.
- [BLR] S. Bosch, W. Lütkebohmert, M. Raynaud, *Néron Models*, Ergebnisse der Mathematik
  21, Springer, 1990; §3.1 Theorem 3, §3.6 Lemma 5.
- [SGA 7 II] P. Deligne, N. Katz, *Groupes de monodromie en géométrie algébrique (SGA 7 II)*, Lecture Notes in Math. 340,
  Springer, 1973; Exposés XII, XIII, XIV, XV (Deligne), XVII, XVIII (Katz).
- [Weil I] P. Deligne, La conjecture de Weil. I, *Publ. Math. IHÉS* 43 (1974), 273–307.
  https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf
- [Milne] J. S. Milne, *Lectures on Étale Cohomology*, version 2.21 (2013),
  Lemmas 32.7–32.8, pp. 191–192. https://www.jmilne.org/math/CourseNotes/LEC.pdf
- [Weil II] P. Deligne, La conjecture de Weil. II, *Publ. Math. IHÉS* 52 (1980), 137–252.
  https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf
- [Illusie 1991] L. Illusie, Réalisation ℓ-adique de l'accouplement de monodromie, d'après A. Grothendieck,
  *Astérisque* 196–197 (1991), 27–44. https://www.numdam.org/item/AST_1991__196-197__1_0.pdf
- [Illusie 1994] L. Illusie, Autour du théorème de monodromie locale, *Astérisque* 223 (1994), 9–57, with the author's
  errata sheet. https://www.numdam.org/item/AST_1994__223__9_0/ ;
  https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrTML.pdf
- [Illusie 2002] L. Illusie, Sur la formule de Picard–Lefschetz, in *Algebraic Geometry 2000, Azumino*, Adv. Stud. Pure
  Math. 36 (2002), 249–268, with the author's erratum. https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf
- [Illusie 2003] L. Illusie, Perversité et variation, *Manuscripta Math.* 112 (2003), 271–295.
- [Illusie 2006] L. Illusie, Vanishing cycles over general bases, lecture notes, December 2006.
  https://www.imo.universite-paris-saclay.fr/~luc.illusie/vanishing1b.pdf
- [Illusie 2021] L. Illusie, Grothendieck and vanishing cycles, *Ann. Fac. Sci. Toulouse Math.* (6) 30 (2021), 83–115.
  https://www.numdam.org/article/AFST_2021_6_30_1_83_0.pdf
- [ILO] L. Illusie, Y. Laszlo, F. Orgogozo (eds.), *Travaux de Gabber sur l'uniformisation locale et la cohomologie étale
  des schémas quasi-excellents*, Astérisque 363–364 (2014); Exposé XVI by J. Riou. All ILO locators use the
  printed page and section numbering of arXiv:1207.3648v1 (16 July 2012). https://arxiv.org/abs/1207.3648v1
- [Saito 2003] T. Saito, Weight spectral sequences and independence of ℓ, *J. Inst. Math. Jussieu* 2 (2003), 583–634;
  author manuscript of 9 June 2003 (numbering cited). https://www.ms.u-tokyo.ac.jp/~t-saito/pp/wmr2r.pdf
- [Haines–Ngô 2002] T. Haines, B. C. Ngô, Nearby cycles for local models of some Shimura varieties, *Compositio Math.* 133
  (2002), 117–150. https://math.uchicago.edu/~ngo/nearby-cycle.pdf
- [Kisin–Pappas 2018] M. Kisin, G. Pappas, Integral models of Shimura varieties with parahoric level structure, *Publ.
  Math. IHÉS* 128 (2018), 121–218. https://www.numdam.org/article/PMIHES_2018__128__121_0.pdf
- [Caraiani–Scholze] A. Caraiani, P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura
  varieties, author manuscript. https://people.mpim-bonn.mpg.de/scholze/Noncompact.pdf
- [Huber 1996] R. Huber, *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*, Aspects of Mathematics E30,
  Vieweg, 1996.
- [Schneider 2011] P. Schneider, *p-Adic Lie Groups*, Grundlehren der mathematischen Wissenschaften 344, Springer, 2011.
- [Qian 2023] L. Qian, Potential automorphy for `GL_n`, *Invent. Math.* 231 (2023). https://par.nsf.gov/servlets/purl/10388233
- [Fresán–Sabbah–Yu] J. Fresán, C. Sabbah, J.-D. Yu, Hodge theory of Kloosterman connections, arXiv:1810.06454.
- [Liu–Tian–Xiao–Zhang–Zhu 2022] Y. Liu, Y. Tian, L. Xiao, W. Zhang, X. Zhu, On the Beilinson–Bloch–Kato conjecture for
  Rankin–Selberg motives, *Invent. Math.* 228 (2022), 107–375. https://par.nsf.gov/servlets/purl/10323568
- [SGA 4] M. Artin, A. Grothendieck, J.-L. Verdier, *Théorie des topos et cohomologie étale des schémas*, Lecture Notes in
  Math. 269, 270, 305, Springer, 1972–1973.
- [SGA 4½] P. Deligne, *Cohomologie étale*, Lecture Notes in Math. 569, Springer, 1977 ([Th. finitude]).
- [BBD] A. Beilinson, J. Bernstein, P. Deligne, Faisceaux pervers, *Astérisque* 100 (1982).
- [Jouanolou 1983] J.-P. Jouanolou, *Théorèmes de Bertini et applications*, Progress in Math. 42, Birkhäuser, 1983.
- [Stacks] The Stacks Project, https://stacks.math.columbia.edu (tags cited in the text).
