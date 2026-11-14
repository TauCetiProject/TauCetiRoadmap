# Roadmap: mapping class groups and canonical representations of surface groups

**Summary.** A representation `ρ : π₁(Σ_{g,n}) → GL_r(ℂ)` of the fundamental group of an oriented
genus-`g` surface with `n` punctures is *MCG-finite* (a *canonical representation*) when its actual
conjugacy class has finite orbit under the mapping class group. This roadmap builds the theory that
proves Landesman and Litt's theorem: an MCG-finite representation of rank `r` with `r² < g + 1` has
finite image, with no semisimplicity hypothesis. It starts from the pure mapping class groups of
punctured surfaces acting on presented surface groups, with the pure Birman sequence and capping
(Layer 0), group-cohomological and
deformation-theoretic tools for arbitrary discrete groups (Layer 1), and étale-versal families of
pointed curves (Layer 2). It realizes an irreducible MCG-finite representation as the fibre of a
projective and then of a linear local system on a versal family (Layers 3–4), and it develops the
Hodge theory of unitary local systems on families of punctured curves, ending in the rank bound for
sub-local systems of `R¹π°_* V` and its Artinian vanishing form (Layer 5). From these it proves the
higher Prym rank bound and the Putman–Wieland property for groups of order `< g²` (Layer 6),
rigidity, integrality and finiteness in the unitary case (Layer 7), the semisimple case by
nonabelian Hodge theory and a constancy argument (Layer 8), and the general case by induction on the
socle filtration, with the free-group, Nielsen-tuple, isomonodromy and fibral corollaries
(Layer 9). The arithmetic layers deduce finite monodromy for low-rank arithmetic representations of
the geometric étale fundamental group of the generic pointed curve over `ℚ`, its Hodge-theoretic
characterisation, and the non-liftability of residual surjections onto `GL_r(𝔽_p)` (Layers 10–11).
Layer 12 constructs the examples that show which hypotheses and ranges are needed.

The end theorems are: the finiteness theorem (Layer 9, `mcgFinite_finite_image`), its free-group
form (`freeGroup_finite_image`), its rank-two form in every genus `g ≥ 2`
(`rankTwo_mcgFinite_finite_image`, Layer 12), the higher Prym rank bound (`higherPrym_rank_bound`,
Layer 6), the Putman–Wieland theorem for groups of small degree and of small order
(`putmanWieland_of_irreducible_dim_lt` and `putmanWieland_of_card_lt`, Layer 6),
the sub-local-system rank bound (Layer 5), arithmetic finite monodromy on the generic curve and its
four-way characterisation (Layer 10), and residual non-liftability (Layer 11).

## Scope and ownership

**This roadmap owns** the theory of MCG-finite representations of surface and free groups and its
applications: the finiteness predicate and its closure properties, the projective and linear
realization of irreducible MCG-finite representations on étale-versal families, the relative
unitary decomposition over Artinian coefficients, higher Prym representations and the
Putman–Wieland property, rigidity and integrality of fibre-irreducible low-rank local systems on
versal families, the semisimple and general finiteness theorems, the free-group, Nielsen-tuple,
characteristic-quotient, isomonodromy and finite-total-image corollaries, arithmetic finiteness on
the generic curve and its Hodge characterisation, residual non-liftability, non-density of
arithmetic representations, and the examples of Layer 12.

It also owns the following foundational targets:

- the identification of the presented surface group with the fundamental group of a surface with
  punctures and boundary, the algebraic pure mapping class group, the comparison of the twist and
  push conventions of its suppliers with the positive twist used here, the pure form of the Birman
  exact sequence, capping all boundary circles at once with its based actions, the finiteness of
  the abelianization of mapping class groups in genus at least two, Nielsen generation of
  `Aut(F_N)`, and quasi-unipotence of multitwists in finite-index subgroups (Layers 0, 7 and 9);
- Teichmüller uniformization of the analytic moduli stack of pointed curves in the whole hyperbolic
  range `2g − 2 + n > 0`, the finite-index image of fundamental groups under dominant morphisms, and
  boundary monodromy of good compactifications of versal total spaces (Layers 2 and 7);
- the transgression term of the five-term exact sequence for arbitrary discrete groups (existence of
  the lift and exactness; the cochain construction is pinned in Tau Ceti), the lifting
  obstruction of a projective representation through a finite central isogeny, deformations of
  representations of discrete groups over Artinian `ℂ`-algebras with the constancy criterion,
  representation schemes of finitely presented groups, with and without fixed determinant, and
  their quotients, the Jordan identity `[x^{m(r)}, y^{m(r)}] = 1` in finite linear groups and
  two-generation of `GL_r(𝔽_p)` (Layer 1);
- polarizable complex variations of Hodge structure on complex manifolds with the notions of
  geometric origin and integral PVHS, parabolic semistability of Deligne extensions,
  isomonodromic deformations and their semistability, the limit theorem for polarizable complex
  variations on the punctured disc whose monodromy need not be quasi-unipotent, real variations of
  mixed Hodge structure with graded-polarizability and admissibility for real coefficients, the
  mixed Hodge structure on `H¹` of
  unitary local systems in families with the theorem of the fixed part for real admissible
  variations, the derivative of the period map,
  Mochizuki's deformation of local systems to variations, cohomological rigidity, Drinfeld's
  comparison of the pro-semisimple completions of fundamental groups of smooth varieties over
  finite fields with its `G`-valued companions, integrality of rigid local systems, and the
  unitarity theorem for low-rank variations on analytically general curves (Layer 5).

**It leaves to named roadmaps:**

- the presented surface group `⟨a₁, b₁, …, a_g, b_g, p₁, …, p_m | ∏ [aᵢ, bᵢ] ∏ pⱼ⟩` with its
  peripheral tuple, the universal property of its presentation, its abelianization and its
  freeness for `m ≥ 1`: FreeGroupsAndLimitGroups §§6.1–6.2 (`OrientableSurfaceGroup`,
  `isFreeGroup_orientable`), with §6.1a for the comparison with polygonal surface models. The Lean
  carrier `surfaceGroup g n` of this roadmap is `OrientableSurfaceGroup g n` transported along the
  inversion of the handle generators `aᵢ ↦ aᵢ⁻¹`, `bᵢ ↦ bᵢ⁻¹`, `pⱼ ↦ cⱼ`, which carries the
  commutator `x⁻¹y⁻¹xy` of that roadmap to the commutator `xyx⁻¹y⁻¹` used here; it is declared in
  `Suggested.lean` only because that file cannot import a roadmap module;
- Jordan's theorem on finite subgroups of `GL_r(K)` in characteristic zero and its constant
  `jordanBound r`: FiniteGroupInvariants §10.5;
- compact smooth surfaces with boundary, their classification and genus, their mapping class
  groups `Mod(F)` fixing the boundary with the orientation-preserving subgroup `Mod⁺(F)`, Dehn
  twists with the sign convention used here, the action of a twist on `H₁` and Lickorish's twist
  theorem for `Mod⁺(F)`: GeometricTopology §§1.7 and 1.7.2, with §11.2.1 item 5 identifying smooth
  and topological mapping classes;
- surfaces with boundary and punctures, their classification, the mapping class group `Mod(S)`
  (which may permute punctures) and its marked-point form `Mod(S*)`, cutting along curves, change
  of coordinates, Dehn twists and multitwists and their action on homology, simple closed curves
  in primitive classes, asphericity and trivial centres, the evaluation fibration, point-pushing,
  the Birman exact sequence and capping one boundary circle: MordellLawrenceVenkatesh Layer LV.5
  (§§5.1, 5.4, 5.7, 5.9–5.13, 5.15–5.17, 5.19–5.21). Its positive twist turns left and is the
  inverse of the twist used here; §0.3 compares the two;
- Teichmüller space of closed surfaces of genus `≥ 2`, the mapping-class action and the
  Dehn–Nielsen–Baer theorem for closed surfaces: TeichmullerGeometry Layer 2 (§2.4), Layer 3
  (§§3.1–3.3) and Layer 5 (§§5.1, 5.2, 5.6). Layer 2's uniformization differs in covering punctured
  surfaces and the analytic moduli stack;
- the algebraic moduli stack `M̄_{g,n}`, its open substack `M_{g,n}`, the forgetful morphism, the
  boundary normal-crossings structure and the level covers: SchemeAndStackFoundations §4.15;
- the analytic stable pointed chart groupoid, its universal curve and the Orbifolds adapter:
  ComplexCurveModuli D5–D8;
- the Ehresmann fibration theorem for proper holomorphic submersions, the relative Betti local
  systems, Deligne's regular-singular theory with the canonical logarithmic extension and residue
  normalization, Riemann existence and the Artin comparison: ComplexComparisonPartII §§C5.2, C5.6,
  C6.0–C6.3;
- arithmetic representations of geometric étale fundamental groups, exactness of the étale
  sequence of the universal punctured curve with its moduli outer action, Artin neighbourhoods as
  `K(π, 1)` spaces with their cohomology comparisons, density of topological fundamental groups of
  curves, and versal families of `φ`-covers: InverseGaloisAndArithmeticFundamentalGroups §§IG.1.4,
  IG.3.1 and IG.5.4;
- the closed-tuple criterion for complete reducibility, with semisimplicity for `GL(V)`:
  ArithmeticGaloisRepresentations §1.11, *Complete reducibility and closed tuples*;
- reductive quotients of affine schemes of finite type over a field, reducible and nonreduced
  ones included (finite generation of invariants, closed images and separation of invariant
  closed subsets, a unique closed orbit in every geometric fibre): LanglandsParameterStacks §2.2,
  extending the integral case of ArithmeticGaloisRepresentations §1.11, *Reductive quotients over
  fields and DVRs*;
- deformation functors and universal deformation rings of profinite groups satisfying Mazur's
  condition `Φ_p`: LocalGaloisDeformationRings §§F.1–F.2; generic fibres and valued points of
  complete local rings: DeformationAndDerivedPatchingAlgebra §§4.2 and 4.4;
- SNC compactification of smooth quasi-projective schemes: ResolutionOfSingularitiesCharacteristicZero
  §6.2;
- L. Lafforgue's global Langlands correspondence for `GL_r` over function fields at every level:
  AutomorphicLFunctionsAndLocalFactors §AL.3.10.13 (*Leveled shtukas and ramified rank induction*),
  with the compatible systems on curves it implies requested there (gap:curve-companions); weights,
  purity, geometric semisimplicity and monodromy of lisse sheaves over finite fields:
  DeligneWeightsAndPurity §§5.5, 7.8, 8.14 and 8.19; tame and prime-to-`p` specialization of
  fundamental groups: InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–IG.1.3, with the
  surjection onto the tame group requested there (gap:tame-specialization);
- local coefficients, relative homology, cup and cap products, Poincaré duality and the
  intersection pairing, transfer for finite covers and Serre fibrations: AlgebraicTopology
  Layers 1, 2, 5 and 6; the homotopy exact sequence of a Serre fibration: DGFloer Layer 1
  item 2; universal covers and deck groups: Completed/UniversalCovers; group cohomology of a
  `K(π, 1)`: ClassifyingSpaces Stage 4;
- pure, mixed and polarized Hodge structures as linear algebra: Completed/HodgeStructures; pure
  real and rational variations of Hodge structure on complex manifolds, their morphisms and rational
  polarizations: ShimuraData §§3.1–3.3 (`Variation`, `RationalPolarizedVariation`); graded-polarizable
  rational variations of mixed Hodge structure, the limit mixed Hodge structure for quasi-unipotent
  monodromy, their admissibility and the rigidity of admissible rational variations with constant
  local system: MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3 and 5.6. §5.4 differs in using
  real coefficients, which a unitary local system forces, and in stating the limit theorem for
  monodromy that need not be quasi-unipotent; the relative monodromy filtration:
  LefschetzPencilsAndVanishingCycles §1.5; Hermitian holomorphic bundles, Dolbeault cohomology and
  Serre duality: ComplexKahlerGeometry K4–K5;
- the Wedderburn decomposition and the irreducible index of a finite group:
  RepresentationTheory/CharacterTheory Layer 2; Schur's lemma for arbitrary groups is Mathlib's
  (`Representation.IsIrreducible.bijective_or_eq_zero`); factor sets and Schur multipliers of
  finite groups: RepresentationTheory/InductionRestriction Layer 7.

The five-term sequence with transgression for profinite groups and closed normal subgroups is
ProfiniteCohomology Layer 5, and the Hochschild–Serre spectral sequence for profinite groups is
NoncommutativeAndEquivariantIwasawa §F.3; Layer 1's §1.1 differs in treating arbitrary discrete
groups, such as surface groups and mapping class groups, which are not profinite.
The inflation–restriction sequence in all positive degrees, the cochain construction of the
transgression from a lift for arbitrary topological groups, projective representations of arbitrary
monoids with their factor sets and linearizing central extensions, the socle, unitary semisimplicity
and the degree-square identity are pinned Tau Ceti declarations (*Exact supplier contracts*). That a
finite-image representation of a geometric étale fundamental group is arithmetic is
InverseGaloisAndArithmeticFundamentalGroups §IG.1.4 (*Outer actions and arithmetic
representations*, the finite-image Check of its arithmetic representations), proved there by
descending the finite cover and its group action; Layer 10 uses it without restating it.

The source's open questions (Questions 10.1.1, 10.1.3, 10.1.5, 10.2.3, 10.2.6 and 10.3.1) and its
Conjecture 10.2.8 are not targets of this roadmap.

## Conventions

- `Σ_g` is a closed oriented connected surface of genus `g`; `Σ_{g,n}` is `Σ_g` minus `n`
  points; `Σ_{g,b,p}` is `Σ_g` minus `b` open discs and `p` further points, so it has `b`
  boundary circles and `p` punctures. The hyperbolic range is `2g − 2 + n > 0` (respectively
  `2g − 2 + b + p > 0`).
- `Mod(Σ)` is the group of isotopy classes of orientation-preserving homeomorphisms fixing the
  boundary pointwise, which may permute punctures; `PMod(Σ)` is the subgroup fixing each puncture.
  `PMod(g, n) = PMod(Σ_{g,n})`, and `PMod(g, b, p)` fixes boundary circles pointwise and punctures
  individually. A base point counts as an extra puncture: `PMod(g, n + 1)` acts on
  `π₁(Σ_{g,n}, x)` by automorphisms, and `PMod(g, n)` acts by outer automorphisms.
- `T_β` is the positive Dehn twist of GeometricTopology §1.7.2: on a tube `(ℝ/ℤ) × [0, 1]` of `β`
  oriented by `dθ ∧ dt` it turns `θ` by an increasing function of `t` from `0` to `1`. On the torus
  with `î(a, b) = 1` it sends `[b]` to `[b] + [a]`. MordellLawrenceVenkatesh's twist is `T_β⁻¹`
  (§0.3).
- Fundamental groups use Mathlib's `FundamentalGroup`, whose product `p * q` traverses `q` first
  (`FundamentalGroup.mul_def`). Point-pushing along `α` acts on based loops by `γ ↦ α * γ * α⁻¹`.
  The standard presentation is `π₁(Σ_{g,n}) = ⟨a₁, b₁, …, a_g, b_g, c₁, …, c_n | ∏ᵢ [aᵢ, bᵢ] ∏ⱼ cⱼ⟩`
  with `[x, y] = x y x⁻¹ y⁻¹`; it is `surfaceGroup g n` of the Lean file, and `cⱼ` is
  `peripheralLoop j`. It is FreeGroupsAndLimitGroups §6.1's `OrientableSurfaceGroup g n`, whose
  commutator is `x⁻¹y⁻¹xy`, transported along the inversion of the handle generators.
- A representation is a homomorphism to `GL_r(ℂ) = Matrix.GeneralLinearGroup (Fin r) ℂ`; rank zero
  is allowed and `GL₀(ℂ)` is trivial. Conjugacy means actual `GL_r(ℂ)`-conjugacy of homomorphisms,
  never equality of semisimplifications; a character variety is used only for semisimple points.
- A representation is *unitary* when its image has compact closure, equivalently when it preserves
  a positive definite Hermitian form. For `GL_r` the adjoint representation is the trace-zero Lie
  algebra, of rank `r² − 1` for `r ≥ 1`; for `PGL_r` it is the adjoint representation on `pgl_r`.
- Local systems are Tau Ceti's `TauCeti.LocalCoefficientSystem` (functors from the fundamental
  groupoid), with monodromy `TauCeti.LocalCoefficientSystem.monodromyRepresentation`. On cohomology
  a homeomorphism acts by inverse pullback, so actions on `H¹` and on `H₁` are contragredient.
- Open-surface cohomology `H¹(Σ_{g',n'}, ℂ)` and compact-surface homology `H₁(Σ_{g'}, ℂ)` are
  different spaces. The `σ`-isotypic component of a representation `V` of a finite group is the
  image of `σ ⊗ Hom_H(σ, V)` under evaluation, not the multiplicity space `Hom_H(σ, V)`.
- A *punctured étale-versal family* (Layer 2) has classifying map to `M_{g,n}` dominant **and
  étale**. All family statements assume the hyperbolic range.
- Fundamental groups of complex varieties and Deligne–Mumford stacks are those of the analytic
  space or analytic stack. Over a field `K` of characteristic zero, `π₁^ét` is the étale fundamental
  group and `Γ_K` the absolute Galois group.
- An isomorphism `ℚ̄_ℓ ≅ ℂ` is an abstract field isomorphism; it is never assumed continuous.
- Local monodromy of a canonical logarithmic extension along a positive loop is conjugate to
  `exp(−2πi Res)` (ComplexComparisonPartII §C5.6). The canonical extension uses residue eigenvalues
  with real parts in `[0, 1)`.
- *Integral* means `G(ℂ)`-conjugate into `G(O_K)` for a number field `K`, for `G = GL_r` or
  `PGL_r` as group schemes over `ℤ`. *Integral PVHS* is read in the `O_K` sense of Layer 5: a local
  system of finite free `O_K`-modules all of whose complex conjugates underlie polarizable complex
  variations of Hodge structure.

## Exact supplier contracts

### From Mathlib

- `FundamentalGroup` with `FundamentalGroup.mul_def` (`p * q = q.trans p`), `IsCoveringMap` and
  path lifting; the fundamental-group conventions of every layer are checked against
  `FundamentalGroup.mul_def`.
- `FreeGroup`, `FreeGroup.lift` (`Mathlib/GroupTheory/FreeGroup/Basic.lean`): the free group and
  the equivalence between generator assignments and homomorphisms, used for the Nielsen-tuple
  dictionary of Layer 9. `PresentedGroup` (`Mathlib/GroupTheory/PresentedGroup.lean`): the carrier
  of `surfaceGroup`. `MulAut` and `Subgroup.relIndex` (`Mathlib/GroupTheory/Index.lean`), whose
  value `0` encodes infinite relative index. `MulAut.conjNormal`
  (`Mathlib/GroupTheory/GroupAction/ConjAct.lean`): conjugation `k ↦ x k x⁻¹` on a normal subgroup,
  through which `prymIsotypic` reads the deck-group action on `Hom(ker φ, ℂ)`.
- `Matrix.GeneralLinearGroup` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`),
  including rank zero; Mathlib's projective linear group `PGL`.
- `Representation.IsIrreducible` (`Mathlib/RepresentationTheory/Irreducible.lean`), the simple
  group-algebra-module notion, with Schur's lemma `Representation.IsIrreducible.bijective_or_eq_zero`
  (an intertwiner between irreducible representations is bijective or zero; the module form is
  `LinearMap.bijective_or_eq_zero` in `Mathlib/RingTheory/SimpleModule/Basic.lean`); over `ℂ` an
  endomorphism of a finite-dimensional irreducible representation is therefore a scalar, the form
  used for arbitrary groups in Layers 3–5; `isotypicComponent`
  (`Mathlib/RingTheory/SimpleModule/Isotypic.lean`), the sum of submodules isomorphic to a given
  simple module, specialized to the group algebra of the deck group in Layer 6; `Representation.ind` (`Mathlib/RepresentationTheory/Induced.lean`),
  induction along a group homomorphism, used in Layer 7.
- `groupCohomology.H1InfRes_exact`
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean`): exactness of
  `H¹(G/S, A^S) → H¹(G, A) → H¹(S, A)`. It does not contain the transgression term, which Layer 1
  constructs.

### From Tau Ceti

- `TauCeti.LocalCoefficientSystem`, `TauCeti.LocalCoefficientSystem.monodromyRepresentation` and
  `TauCeti.LocalCoefficientSystem.pullback` (`TauCeti/AlgebraicTopology/LocalCoefficient.lean`):
  local systems as functors on the fundamental groupoid, monodromy on the actual fibre with the
  library path convention, and pullback along continuous maps compatible with monodromy. No second
  local-system carrier is introduced.
- `TauCeti.IsAspherical` (`TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean`):
  path-connectedness together with the vanishing of the homotopy groups in degrees at least two (no
  CW structure is part of the predicate), the form in which the asphericity of Artin neighbourhoods
  (§IG.3.1) is consumed in §4.1, and that of the punctured fibres of a versal family
  (MordellLawrenceVenkatesh §5.15) by gap:local-system-direct-images.
- `TauCeti.TopCat.serreFibrations` (`TauCeti/Topology/Homotopy/SerreFibration/Basic.lean`), the
  morphisms of `TopCat` with the homotopy lifting property for all discs, and
  `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`
  (`TauCeti/Topology/Homotopy/SerreFibration/FiberBundle.lean`): a map every point of whose base
  lies in the base set of a local trivialization is a Serre fibration, with no paracompactness
  hypothesis. Used in §2.6 to apply the homotopy exact sequence to the locally trivial punctured
  family.
- `TauCeti.socle` and `TauCeti.isSemisimpleModule_socle` (`TauCeti/RingTheory/SimpleModule/Socle.lean`):
  the socle as the supremum of simple submodules, and its semisimplicity.
- `IsFreeGroup.commute_iff_exists_common_zpow` (`TauCeti/GroupTheory/FreeGroup/Commuting.lean`): two
  elements of a free group commute exactly when both are integer powers of one element, used for the
  non-inversion property of peripheral loops in §0.2; `TauCeti.FreeGroup.nielsenMul`
  (`TauCeti/GroupTheory/FreeGroup/Nielsen.lean`): the automorphism `a ↦ a bⁿ` of a free group fixing
  the other generators, the transvection among the Nielsen generators of §9.6. The generation
  theorem itself is not at the pin.
- `ContRepresentation.IsUnitary.isSemisimpleRepresentation`
  (`TauCeti/RepresentationTheory/Continuous/InvariantComplement.lean`): a finite-dimensional unitary
  representation of an arbitrary group is semisimple.
- `TauCeti.sum_characterDegree_sq_eq_card` (`TauCeti/RepresentationTheory/CharacterTable/Table.lean`):
  for a finite group over an algebraically closed field of characteristic prime to its order, the
  squares of the irreducible degrees sum to the order.
- `TauCeti.groupCohomology.HInfRes_exact` and `TauCeti.groupCohomology.mono_HInfRes_f`
  (`TauCeti/RepresentationTheory/Homological/GroupCohomology/InflationRestriction.lean`): exactness
  of inflation–restriction in degree `n + 1` and injectivity of inflation when `Hⁱ(S, A) = 0` for
  `0 < i ≤ n`, for an arbitrary group and normal subgroup; for `n = 0` the vanishing hypothesis is
  empty and the statement is the degree-one sequence.
- `TauCeti.ContCohomology.H1ConjInvariants`, `TauCeti.ContCohomology.IsTransgressionLift`,
  `TauCeti.ContCohomology.IsTransgressionLift.cocycle` and
  `TauCeti.ContCohomology.IsTransgressionLift.cocycle_sub_mem_B2`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/FiveTerm.lean` and `Transgression.lean`):
  for an arbitrary topological group `G`, normal subgroup `N` and topological `G`-module `M`, the
  conjugation-invariant classes in `H¹(N, M)`, the continuous cochains `f` on `G` lifting a function
  `c` on `N` (`f(gn) = f(g) + g·c(n)` and `f(g)` trivializing the difference between `c` and its
  conjugate by `g`), the descended coboundary of a lift as a `2`-cocycle on `G ⧸ N` with values in
  `M^N`, and its independence, up to a `2`-coboundary, of the lift and of the representative of the
  class of `c`. Existence of lifts, `TauCeti.ContCohomology.transgression` and the exactness theorems
  `TauCeti.ContCohomology.fiveTerm_exact_H1N` and `TauCeti.ContCohomology.fiveTerm_exact_H2Q` assume
  `G` compact and totally disconnected; §1.1 supplies them for discrete groups.
- `TauCeti.IsProjectiveRep`, `TauCeti.IsProjectiveRep.toPGL`,
  `TauCeti.IsProjectiveRep.cohomologyClass`, `TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff`
  and `TauCeti.isProjectiveRepEquivExtensionHom` (`TauCeti/RepresentationTheory/ProjectiveRepresentation/`),
  with `MonoidHom.exists_isProjectiveRep_toPGL_eq`: projective representations of an arbitrary
  group as normalized lifts with factor sets, their homomorphisms to `PGL`, every homomorphism to
  `PGL` arising this way, the class in `H²(G, kˣ)` vanishing exactly when the lift is a rescaled
  homomorphism, and the bijection with linear representations of the central extension of the
  factor set. These carry no finite-isogeny or fibre-prescribed refinement; Layer 1 adds it.

### From TauCetiRoadmap.FreeGroupsAndLimitGroups

§6.1 (`OrientableSurfaceGroup g m`, the presented group on `a₁, b₁, …, a_g, b_g, p₁, …, p_m` with
the single relator `∏ [aᵢ, bᵢ] ∏ pⱼ`, commutator `x⁻¹y⁻¹xy`; the peripheral tuple
`SurfaceGroup.peripheral`; `SurfaceGroup.lift`, homomorphisms out of it as tuples satisfying the
relator; `SurfaceGroup.abelianization`, free abelian of rank `2g` for `m = 0` and `2g + m − 1`
for `m ≥ 1`), §6.1a (comparison with polygonal surface models and their boundary traversals) and
§6.2 (`isFreeGroup_orientable`: for `m ≥ 1` the group is free on `a₁, …, b_g, p₁, …, p_{m−1}` and
`p_m` is the inverse of the product of the others; for `m = 0` the closed orientable group is not
free when `g ≥ 1`, that is `χ ≤ 0`, while for `g = 0` it is the trivial group, free of rank zero).
Layer 0 consumes
these through the generator inversion of *Conventions*, which is an isomorphism
`OrientableSurfaceGroup g n ≃* surfaceGroup g n` matching `pⱼ` with `cⱼ`.

### From TauCetiRoadmap.FiniteGroupInvariants

§10.5: `jordanBound r`, the least `J` such that every finite subgroup of `GL_r(ℂ)` has an abelian
normal subgroup of index at most `J`, and `jordan_exists_abelian_normal_index_le`: over every field
of characteristic zero every finite subgroup of `GL_r(K)` has an abelian normal subgroup of index at
most `jordanBound r`. Layer 1 writes `J(r)` for `jordanBound r` and uses only this bound.

### From TauCetiRoadmap.GeometricTopology

§1.7 (the classification of compact connected smooth surfaces, the genus `(2 − χ − b)/2`, and
`rank H₁ = 2g` or `2g + b − 1`); §1.7.2 (the mapping class group `Mod(F)` of a compact connected
smooth surface, classes of diffeomorphisms fixing `∂F` pointwise up to isotopy rel `∂F`, and for
oriented `F` its subgroup `Mod⁺(F)` of orientation-preserving classes, equal to `Mod(F)` when
`∂F ≠ ∅`; for the closed torus `Mod⁺(T²) ≅ SL₂(ℤ)` has index two in `Mod(T²) ≅ GL₂(ℤ)`; the Dehn
twist `T_c`, the identity off a tube `(ℝ/ℤ) × [0, 1]` of `c` oriented by `dθ ∧ dt` and
`([θ], t) ↦ ([θ + φ(t)], t)` on it with `φ` increasing from `0` to `1`; the formulas
`f T_c f⁻¹ = T_{f(c)}` for orientation-preserving `f`, `Mod(D²) = 1`, `Mod(annulus) = ℤ`; the action
`[x] ↦ [x] + (c · x)[c]` on `H₁(F; ℤ)`, with the torus matrices `[[1, 1], [0, 1]]` and
`[[1, 0], [−1, 1]]` for `a · b = 1`; Lickorish's theorem that `Mod⁺(F)` of a compact connected
orientable `F` is generated by Dehn twists); §11.2.1 item 5 (the forgetful map from `Mod(F)` to
isotopy classes of homeomorphisms fixing `∂F` is an isomorphism, so `Mod⁺(F)` is the group of
isotopy classes of orientation-preserving homeomorphisms fixing `∂F`). Assumed for every compact
connected oriented `F`; no punctures or marked points are treated there. Only `Mod⁺` is consumed:
it is `PMod(g, b, 0)` of §0.2, and the orientation-reversing classes of a closed `F`, such as the
swap of the two factors of `T²`, of determinant `−1` on `H₁`, are not products of twists, which
act with determinant `1`.

### From TauCetiRoadmap.MordellLawrenceVenkatesh

Layer LV.5: §5.1 (a surface is `Σ ∖ P`, `Σ` a compact connected oriented topological surface with
boundary and `P` a finite subset of its interior), §5.4 (such a surface is determined up to
orientation-preserving homeomorphism by its type `(g, b, n)`), §5.7 (annular neighbourhoods of
simple closed curves and cutting along them), §5.9 (`Mod(S)`, classes of
orientation-preserving homeomorphisms fixing `∂S` pointwise up to isotopy rel `∂S`, which may
permute punctures; `Mod(S*)` for a marked interior point `x`; the surjection
`Forget : Mod(S*) → Mod(S)`; the actions on `H₁(S; ℤ)` and on simple closed curves), §5.10 (change of
coordinates for nonseparating curves and for pairs meeting once), §5.11 (the twist `T^{LV}_α`, the
twist map `(θ, t) ↦ (θ + 2πt, t)` on a model annulus oriented by `dt ∧ dθ`), §5.12
(`Ψ(T^{LV}_b)^k(x) = x + k · î(x, b) · [b]`, and the multitwist formula, unipotent), §5.13 (on a
closed surface of genus `≥ 1`, or one with a single puncture or boundary circle, a nonzero class
is represented by a simple closed curve iff it is primitive, and a simple closed curve is
nonseparating iff its class is nonzero), §5.15 (a connected oriented surface of finite type other
than the sphere has contractible universal cover), §5.16 (for `χ(S) < 0` centralizers of nontrivial
elements of `π₁` are infinite cyclic), §5.17 (the evaluation map `Homeo⁺(S, ∂S) → int S` is a
locally trivial bundle), §5.19 (`Push : π₁(S, x) → Mod(S*)`, acting on based loops by
`γ ↦ α * γ * α⁻¹` in Mathlib's convention), §5.20 (for `χ(S) < 0` the Birman sequence
`1 → π₁(S, x) → Mod(S*) → Mod(S) → 1` is exact, and `Push(α) = T^{LV}_a (T^{LV}_b)⁻¹` for a simple
loop `α` with left and right push-offs `a`, `b`), §5.21 (capping a boundary circle `β` with a
once-marked disc gives the exact sequence `1 → ⟨T_β⟩ → Mod(S) → Mod(S′, p) → 1`). Its twist is
the inverse of the twist of GeometricTopology §1.7.2, a comparison stated in GeometricTopology's
ownership section and proved for punctured surfaces in §0.3; every formula is consumed through
that comparison.

### From TauCetiRoadmap.TeichmullerGeometry

Layer 2 (§2.4: the marked deformation atlas and the dimension `3g − 3`), Layer 3 (§§3.1–3.3: the
mapping class groups, their action on marked structures, proper discontinuity and the moduli
groupoid) and Layer 5 (§5.1 asphericity of closed surfaces of genus `≥ 2`, §5.2 Dehn–Nielsen–Baer,
§5.6 finite stabilizers), for closed surfaces of genus `g ≥ 2`. Layer 2 uses them as the closed
case of its punctured uniformization theorem.

### From TauCetiRoadmap.SchemeAndStackFoundations

§4.15: `StableCurves.Mbar` with `Mbar.smooth` (the open substack `M_{g,n}` of smooth families),
`Mbar.forget` (forgetting the last marking and its identification with the universal curve),
`Mbar_smooth` (smoothness of relative dimension `3g − 3 + n` and the normal-crossings boundary),
`Mbar_algebraic_proper_DM`, `level_structure_cover` and `level_structure_cover_representable`
(finite étale level covers of `M_{g,n}[1/m]`, algebraic spaces for `m ≥ 3`, quasi-projective over
`ℂ` by the projectivity of their normalized compactification). §2.2: `leray_spectral_sequence`.
Assumed for all `2g − 2 + n > 0`.

### From TauCetiRoadmap.ComplexCurveModuli

D0.4 (finite-type uniformization of stable punctured components by complete finite-area hyperbolic
metrics), D0.5 (properness of the diffeomorphism action and finiteness of automorphism groups of
stable marked curves), D5 (the countable stable pointed chart groupoid), D7 (the universal curve and
its Morita comparison with the `(g, n + 1)` groupoid) and D8 (the Orbifolds adapter). Layer 2 uses
these as the analytic moduli stack `M_{g,n}^an` and its universal curve.

### From TauCetiRoadmap.ComplexComparisonPartII

§C5.2: `ehresmannFibration` (a proper surjective holomorphic submersion is a smooth fibre bundle,
with pullback compatibility) and `relativeBettiLocalSystem`. §C5.6: `RegularSingular`;
`CanonicalLogExtension`, the unique logarithmic extension of a local system to a smooth proper SNC
compactification whose residue eigenvalues lie in a chosen set of representatives of `ℂ/ℤ`, here
the strip `0 ≤ Re λ < 1`, with local monodromy along a positive loop conjugate to `exp(−2πi Res)`;
the scalar normalizations `localMonodromy a = exp(−2πia)` and `residueStripRep a = a − ⌊Re a⌋`;
and `deligneRiemannHilbert`. §C6.0: `complexAlgebraicTopology`;
§C6.1: `topologicalCoefficientComparison` (finite coefficient rings); §C6.2: `riemannExistence`;
§C6.3: `artinComparison`.

What ComplexComparisonPartII must provide (gap:local-system-direct-images): extend §C6.1's
dictionary between `TauCeti.LocalCoefficientSystem` and locally constant sheaves to coefficients in
`ℂ` and in finite-dimensional commutative `ℂ`-algebras, and for a smooth fibre bundle `f : T → S`
of manifolds and a locally constant sheaf `V` of finite free `A`-modules on `T` prove that
`R^q f_* V` is locally constant with stalk `H^q(f⁻¹(s), V)`, equal to the group cohomology of the
fibre group when the fibre is a `K(π, 1)`, together with the projection formula
`R^q f_*(V ⊗_A f^*W) ≅ R^q f_* V ⊗_A W` for a local system `W` of finite free `A`-modules on `S`.
Freeness of `W` is needed: for `A = ℂ[x, y]/(x, y)²`, `T = ℂ^×`, `S` a point, `V = A` with
monodromy `1 + x` and `W = A/𝔪_A`, one has `H⁰(V) = 𝔪_A` of dimension two, so
`H⁰(V) ⊗_A W = 𝔪_A/𝔪_A²` has dimension two while `H⁰(V ⊗_A W) = ℂ` has dimension one; for
`W = A` the comparison is the identity of `𝔪_A`.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

§IG.1.2, *Tame and prime-to-`p` fundamental quotients*, and §IG.1.3, *Tame specialization with a
relative boundary* (for `X` smooth and proper over a strictly henselian discrete valuation ring with
geometrically connected fibres and `D` a relative strict normal crossings divisor, geometric
specialization identifies the maximal prime-to-`p` quotients of `π₁^ét(U_η̄)` and `π₁^ét(U_s̄)`,
`U = X ∖ D`). §IG.1.4, *Outer actions and arithmetic representations*: the arithmetic
representations (finite `Γ_K`-orbit of the isomorphism class) with their conjugation, base-extension
and lift-independence properties, and the finite-image criterion proved there by descent in the
finite-image Check of that item: a continuous representation of `π₁^ét(X_K̄)` with finite image
factoring through the Galois group of a cover defined over a finite extension `K′/K` has orbit of at
most `[K′ : K]` classes, in every characteristic and without finite generation; and *Exactness in
families and the moduli outer action* (the étale sequence
`1 → π₁^ét(C_x̄) → π₁^ét(𝓒_{g,n}) → π₁^ét(𝓜_{g,n}) → 1`, geometric and arithmetic, with compatible
outer actions and the profinite completion of the surface group as fibre group). §IG.3.1: *Riemann
existence for punctured curves*, *Finitely many covers of bounded degree*, *Artin neighbourhoods are
`K(π, 1)`* (a pointed Artin neighbourhood of a point of a smooth variety, its tower of elementary
fibrations, its asphericity in the sense of `TauCeti.IsAspherical`, and the comparison chain
`H^i(π₁(U(ℂ)), A) → H^i(U(ℂ), A) → H^i_ét(U, A)` for finite abelian `A`), and *Topological
fundamental groups of curves are dense*. §IG.5.4: *General-genus Hurwitz comparison* and *Versal
families with specified topological monodromy* (a chart dominant and étale over `M_{g,n}`, the
`H`-cover of its universal punctured curve with prescribed topological monodromy, and the refinement
carrying a section).

What InverseGaloisAndArithmeticFundamentalGroups must provide (gap:tame-specialization): in the
setting of §IG.1.3's *Tame specialization with a relative boundary*, prove that the specialization
homomorphism `π₁^ét(U_η̄) → π₁^t(U_s̄)` onto the tame fundamental group of the special fibre (§IG.1.2)
is surjective, compatibly with the prime-to-`p` identification (Klevdal–Patrikis, §5.2, footnote 3,
KP20 line 549, and its use in §6.2, KP20 line 761). In residue characteristic zero it
is the identification itself; for an ordinary elliptic curve over `ℤ_p^{ur}` with `U = X` it is
surjective but not injective on maximal pro-`p` quotients (`ℤ_p² → ℤ_p`).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.11, *Complete reducibility and closed tuples* (over an algebraically closed field the
simultaneous conjugation orbit of a tuple in `G(k)ⁿ` is closed exactly when the Zariski closure of
the generated subgroup is completely reducible; for `GL(V)` complete reducibility is
semisimplicity). This needs no integrality: an orbit in a closed `G`-stable subscheme of `G(k)ⁿ` is
closed there exactly when it is closed in `G(k)ⁿ`. Its *Reductive quotients over fields and DVRs*
is stated for integral affine varieties and is used here only through LanglandsParameterStacks
§2.2.

### From TauCetiRoadmap.LanglandsParameterStacks

§2.2 (*Reductive quotients over fields and DVRs*): for a connected reductive group acting on an
affine scheme of finite type over a field, with no integrality or reducedness hypothesis, the
invariant algebra is finitely generated, so `X//G = Spec O(X)^G` is of finite type, invariant closed
subsets of `X` have closed images, disjoint ones have disjoint images, and each geometric fibre of
`X → X//G` contains a unique closed orbit; integrality and normality of `X//G` are asserted
only under the corresponding hypotheses on `X`. Its Checks include the trivial action on
`Spec k[ε]/(ε²)`. Used for the representation schemes `R_r(Γ)_χ` of §1.4, which can be reducible
and nonreduced.

### From TauCetiRoadmap.LocalGaloisDeformationRings and TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

LocalGaloisDeformationRings §§F.1.1–F.1.7 (lifting and deformation functors of an arbitrary
profinite group, with fixed determinant) and §§F.2.1, F.2.3, F.2.5, F.2.9 (Mazur's condition
`Φ_p`, universal lifting and deformation rings, fixed-determinant rings).
DeformationAndDerivedPatchingAlgebra §4.2 (algebraic and valued integral points) and §4.4 (generic
fibres and punctured spectra). Used only in Layer 11's conditional statement.

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

§6.2 (SNC compactification): a smooth quasi-projective variety `U` over a field of characteristic
zero embeds as a dense open subset of a smooth projective variety `Ū` whose complement is a reduced
strict normal crossings divisor with labelled smooth components, every modification restricting to
the identity on `U`; the compactification depends on a chosen projective closure. Its Check
`𝔾_m² ⊂ ℙ¹ × ℙ¹`, with the four coordinate curves as boundary, exhibits the three properties used
in §§5.10 and 7.2: the open subset is retained, the boundary is strict SNC, and the compactification
is projective.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

§AL.3.10.13, *Leveled shtukas and ramified rank induction*, and §AL.3.10.14, *The unramified pure
realization theorem*: for a smooth projective geometrically connected curve `X` over `𝔽_q`,
`ℓ ≠ char 𝔽_q`, every effective level divisor `D` and every `r ≥ 1`, L. Lafforgue's bijection
between cuspidal automorphic representations of `GL_r` over `𝔽_q(X)` with finite-order central
character, unramified outside `supp D`, and irreducible rank-`r` lisse `ℚ̄_ℓ`-sheaves on
`X ∖ supp D` with finite-order determinant, matching Frobenius characteristic polynomials with
Satake parameters and local factors at every place; the sheaves it constructs are pure of weight
zero.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:curve-companions): deduce from
§AL.3.10.13's `GL_r` correspondence that for an irreducible lisse `ℚ̄_ℓ`-sheaf `E` of rank `r ≥ 1`
with finite-order determinant on a smooth geometrically connected curve over `𝔽_q`, the
characteristic polynomials of the geometric Frobenius elements at closed points have coefficients in
one number field, their roots are pure of weight zero and are units at every finite place not above
`p`, and for every finite place `λ′ ∤ p` of `ℚ̄` and isomorphism of the coefficient fields there is
an irreducible lisse `ℚ̄_{λ′}`-sheaf with finite-order determinant and the same Frobenius
characteristic polynomials whose Frobenius-semisimplified Weil–Deligne representation at every point
of the boundary is isomorphic to that of `E`, so tameness and the orders of the eigenvalues of local
monodromy are the same (Drinfeld 2012, Remark 1.2, Dri12 line 27, for the companions on curves;
Klevdal–Patrikis, proof of Proposition 6.2(1) and (4), KP20 lines 694–725, for the local
compatibility at the boundary).

### From TauCetiRoadmap.DeligneWeightsAndPurity

§5.5 (the geometric image of a rank-one `ℓ`-adic Weil sheaf on a normal geometrically connected
`X₀/𝔽_q` is finite, so an irreducible lisse sheaf becomes finite-determinant after a rank-one
twist), §7.8 (`R^i f_!` of a mixed sheaf of weights `≤ n` has weights `≤ n + i`), §8.14 (geometric
monodromy groups; with algebraically closed characteristic-zero coefficients a lisse sheaf is
geometrically semisimple iff the identity component of the Zariski closure of its geometric
monodromy is reductive) and §8.19 (a punctually `ι`-pure lisse sheaf on a normal `X₀` is
geometrically semisimple). Used in §§5.9a–5.10 with `ℓ ≠ p` and rational `ℓ`-adic coefficients.

### From TauCetiRoadmap.AlgebraicTopology, TauCetiRoadmap.DGFloer, Completed/UniversalCovers and TauCetiRoadmap.ClassifyingSpaces

AlgebraicTopology Layer 1 (van Kampen), Layer 2 (relative singular chains and local coefficient
systems), Layer 5 (bundles, covers and, in §5.3, transfer for finite covers), Layer 6 (cup and cap
products, Poincaré duality and the intersection pairing of closed oriented manifolds). DGFloer
Layer 1 item 2: the homotopy exact sequence `… → π₁(F) → π₁(E) → π₁(B) → π₀(F) → π₀(E) → π₀(B)` of
a Serre fibration in the sense of `TauCeti.TopCat.serreFibrations`, which Layer 2 applies to the
punctured family `C° → M` of §2.6.
Completed/UniversalCovers: based universal covers, deck groups and the covering classification.
ClassifyingSpaces Stage 4, item 17: group cohomology of `π` agrees with cohomology of a `K(π, 1)`
with local coefficients.

### From Completed/HodgeStructures and TauCetiRoadmap.ComplexKahlerGeometry

Completed/HodgeStructures: pure, polarized and mixed Hodge structures, used fibrewise in Layer 5.
ComplexKahlerGeometry K4–K5: holomorphic bundles, Hermitian metrics, Dolbeault cohomology and
Serre duality on compact curves.

### From TauCetiRoadmap.ShimuraData, TauCetiRoadmap.MixedHodgeModulesAndIrregularHodgeTheory and TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

ShimuraData §3.1 (`Variation`: a pure real or rational variation of Hodge structure of weight `n`
on a complex manifold, a finite-rank local system with a filtration of its holomorphic flat bundle
by holomorphic subbundles, opposed on every fibre and satisfying Griffiths transversality), §3.2
(morphisms, subvariations, kernels and images) and §3.3 (`RationalPolarizedVariation`, the
rational polarization by a parallel form satisfying the Hodge–Riemann relations fibrewise).
MixedHodgeModulesAndIrregularHodgeTheory §3.1 (graded-polarizable variations of mixed Hodge
structure: a flat weight filtration with pure graded pieces in the sense of ShimuraData §3.1, and
morphisms strict for `W` and `F`), §3.2 (the limit mixed Hodge structure of a rationally polarized
pure variation on the punctured disc with quasi-unipotent monodromy, through a finite cover on which
the monodromy is unipotent), §3.3 (admissibility along punctured discs with quasi-unipotent
monodromy: extension of the Hodge bundles to the canonical extension with the limit filtration on
the graded pieces, and existence of the relative monodromy filtration) and §5.6 (for an admissible
variation with constant local system on a smooth connected variety, the global sections form a
mixed Hodge structure mapping isomorphically to every fibre). These are stated with rational
coefficients and quasi-unipotent monodromy, and §5.4 compares its statements with them in that
case; §5.4 uses the definitions of §3.1 with a local system of real vector spaces and real
polarizations, states the limit theorem for polarizable complex variations on the punctured disc
with monodromy that need not be quasi-unipotent and the admissibility it defines as its own targets,
and states the theorem of the fixed part for real admissible variations with nonconstant local
system as its own target. LefschetzPencilsAndVanishingCycles §1.5 (the relative monodromy filtration
of a nilpotent endomorphism with respect to a finite increasing filtration, unique when it exists
and unchanged by a nonzero scalar multiple of the endomorphism; existence is a hypothesis), used in
condition (b) of §5.4's admissibility.

### From TauCetiRoadmap.RepresentationTheory

CharacterTheory Layer 2 (Wedderburn decomposition and irreducible indexing of finite groups, used
for the isotypic decompositions of Layers 6 and 9) and InductionRestriction Layer 7 (factor sets
and Schur multipliers of finite groups). Schur's lemma itself is Mathlib's (*From Mathlib*).

## How to read the build

Layer 0 adapts the surfaces, mapping class groups, twists, point-pushing and capping of
MordellLawrenceVenkatesh and GeometricTopology to presented surface groups, pure and based actions
and the positive twist, and proves the finite abelianization of mapping class groups; it defines
the Lean carriers `surfaceGroup` and `pureMappingClassAut`. Layer 1 supplies the group theory used
throughout: the five-term sequence with transgression, lifting through finite central isogenies,
Artinian deformations with the constancy criterion, representation schemes and the Jordan
identity.
Layer 2 defines MCG-finiteness and étale-versal families and identifies their fundamental groups
with mapping class groups through Teichmüller uniformization. Layers 3 and 4 realize an irreducible
MCG-finite representation projectively and then linearly on a versal family and decompose Artinian
deformations of fibre-unitary local systems. Layer 5 is the Hodge theory: variations of Hodge
structure, isomonodromy, the mixed Hodge structure on the cohomology of unitary local systems, the
rank bound and its Artinian vanishing form, nonabelian Hodge theory, rigidity, companions over
finite fields and integrality.
Layer 6 deduces the higher Prym rank bound and the Putman–Wieland theorem; Layer 7 the unitary
case; Layer 8 the semisimple case; Layer 9 the general theorem and its corollaries. Layers 10 and 11
are arithmetic, and Layer 12 collects the examples. Layers 2–4 do not use Layer 5, and Layer 5 uses
Layer 4 only in its Artinian vanishing theorem.

## Layer 0: surfaces with punctures, pure mapping class groups and point-pushing

This layer takes surfaces with boundary and punctures, their mapping class groups, Dehn twists,
point-pushing, the Birman sequence and capping from MordellLawrenceVenkatesh Layer LV.5, and the
compact case with its sign convention and Lickorish's theorem from GeometricTopology §1.7.2. It
adds what the finiteness theory needs on top of them: the standard presentation of surface groups,
the pure mapping class groups and their based actions on presented surface groups, the comparison
of the two twist conventions with the formulas in the positive convention, the pure Birman
sequence, capping all boundary circles at once, and the finiteness of the abelianization of mapping
class groups in genus at least two.

### 0.1 Punctured surfaces and the standard presentation

For `g, b, p ≥ 0` let `Σ_{g,b,p}` be MordellLawrenceVenkatesh §5.1's surface of type `(g, b, p)`, a
compact connected oriented surface of genus `g` with `b` boundary circles minus `p` interior
points, determined up to orientation-preserving homeomorphism by its type (§5.4), and
`Σ_{g,n} = Σ_{g,0,n}`.
The presented surface group is FreeGroupsAndLimitGroups §6.1's `OrientableSurfaceGroup g n`, with
its peripheral tuple, the universal property of its presentation and its abelianization (§6.1),
and its freeness on `a₁, …, b_g, c₁, …, c_{n−1}` for `n ≥ 1` (§6.2). The Lean carrier
`surfaceRelator g n`, the word `∏ᵢ [aᵢ, bᵢ] · ∏ⱼ cⱼ` in the free group on `Fin g ⊕ Fin g ⊕ Fin n`
with `[x, y] = xyx⁻¹y⁻¹`, `surfaceGroup g n`, the presented group on it, and `peripheralLoop j`,
the image of `cⱼ`, are that group transported along the inversion of the handle generators: the
automorphism `aᵢ ↦ aᵢ⁻¹`, `bᵢ ↦ bᵢ⁻¹`, `pⱼ ↦ cⱼ` of the free group carries the relator
`∏ aᵢ⁻¹bᵢ⁻¹aᵢbᵢ ∏ pⱼ` to `surfaceRelator g n` and induces an isomorphism of presented groups
matching peripheral tuples. Nothing about the presented group is proved here.

Prove the standard presentation theorem, the identification with the topological fundamental
group: for a base point `x` of `Σ_{g,b,p}` there are based loops
`aᵢ, bᵢ, cⱼ` (`j ≤ b + p`) such that the induced homomorphism `surfaceGroup g (b + p) → π₁(Σ_{g,b,p}, x)`
is an isomorphism and `cⱼ` is freely homotopic to the positively oriented boundary of a small
neighbourhood of the `j`-th puncture or boundary circle. The closed case is the cell structure with
one 2-cell attached along `∏ [aᵢ, bᵢ]` and van Kampen (Hatcher, §1.2, printed p. 51); removing a
point of the 2-cell and collapsing gives the punctured case, and a collar retraction identifies a
boundary circle with a puncture (Landesman–Litt 2022, proof of Lemma 7.5.1, LL22 line 2048; Landesman–Litt,
proof of Lemma 7.2.5, LL24 line 1500). Through the isomorphism, FreeGroupsAndLimitGroups §6.2 gives
that `π₁(Σ_{g,b,p}, x)` is free on `a₁, …, b_g, c₁, …, c_{b+p−1}`, of rank `2g + b + p − 1`, when
`b + p ≥ 1`. *Needs:* FreeGroupsAndLimitGroups §§6.1–6.2; MordellLawrenceVenkatesh §§5.1, 5.4;
AlgebraicTopology Layer 1; Mathlib `PresentedGroup`, `FreeGroup`, `FundamentalGroup`.

- Changing the chosen loops changes the isomorphism by an automorphism sending each `cⱼ` to a
  conjugate of `cⱼ`; the isomorphism is canonical up to such automorphisms.
- The isomorphism depends on `b + p` only: `Σ_{g,b,p}` and `Σ_{g,0,b+p}` have isomorphic
  fundamental groups with matching peripheral tuples, through the collar retraction.

**Checks.**

- `(g, n) = (1, 1)`: the generator inversion sends FreeGroupsAndLimitGroups' relator `a⁻¹b⁻¹ab p₁`
  to `aba⁻¹b⁻¹c₁ = surfaceRelator 1 1`, so `p₁` corresponds to `c₁` and `c₁ = [a, b]⁻¹` is the
  positively oriented loop around the puncture; a transport along the identity on `a, b` would
  make `c₁` the loop `(a⁻¹b⁻¹ab)⁻¹`, which is conjugate to `[a, b]⁻¹` by `ab`, so for one handle
  both transports give the same conjugacy class of peripheral loop, but only the inversion carries
  the relator to the relator word for word.
- `(g, b, p) = (0, 1, 2)`, `(0, 0, 3)` and `(0, 3, 0)` all give the free group of rank two on
  `c₁, c₂` with `c₃ = (c₁c₂)⁻¹` (the pair of pants of FreeGroupsAndLimitGroups §6.1), and the
  three peripheral loops lie in three distinct conjugacy classes; an identification sending two of
  them to loops around the same puncture would make `c₁` conjugate to `c₂` or `c₂⁻¹`, which the
  abelianization `ℤ²` with basis `c₁, c₂` excludes.
- `(g, n) = (1, 0)`: the closed torus group `⟨a, b | aba⁻¹b⁻¹⟩ ≅ ℤ²` has no peripheral loop, and
  the isomorphism with `π₁(T²)` sends `a, b` to the two standard circles, whose classes have
  `î(a, b) = 1` in the orientation of §0.3; the inversion transport changes the sign of neither
  intersection number since it inverts both generators. The torus group is not free, whereas the
  closed genus-zero group `surfaceGroup 0 0` is trivial, free of rank zero: the non-freeness of
  FreeGroupsAndLimitGroups §6.2 for closed groups needs `g ≥ 1`.

### 0.2 Pure mapping class groups and their actions on surface groups

Write `Mod(g, b, p)` for MordellLawrenceVenkatesh §5.9's `Mod(Σ_{g,b,p})`, whose classes may
permute the punctures, and define `PMod(g, b, p)` as its subgroup of classes fixing each puncture,
the kernel of the permutation action on the `p` punctures; it has index `p!`, every permutation
being realized. For `p = 0` it is GeometricTopology §1.7.2's `Mod⁺(Σ_{g,b})` through §11.2.1 item 5,
equal to GeometricTopology's `Mod(Σ_{g,b})` when `b ≥ 1`; for `b = 0` GeometricTopology's group also
contains the orientation-reversing classes, which the `Mod` of *Conventions* and of
MordellLawrenceVenkatesh §5.9 excludes (for the torus, `PMod(1, 0, 0) = Mod(1, 0, 0) ≅ SL₂(ℤ)`, of
index two in GeometricTopology's `Mod(T²) ≅ GL₂(ℤ)`).
Marking a base point `x` as an extra puncture, `PMod(g, b, p + 1)` is the subgroup of
MordellLawrenceVenkatesh's `Mod(Σ_{g,b,p}*)` fixing each of the other punctures. A class in it acts
on `π₁(Σ_{g,b,p}, x)` by functoriality; this based action factors through isotopy because isotopies
fix `x`, and `PMod(g, b, p)` acts by outer automorphisms.

Define `pureMappingClassAut g n` as the subgroup of `MulAut (surfaceGroup g n)` of automorphisms
sending each `peripheralLoop j` to a conjugate of itself. Prove that under the standard presentation
of §0.1 the image of `PMod(g, b, p + 1)` in `Aut(π₁(Σ_{g,b,p}, x))` lies in
`pureMappingClassAut g (b + p)`: an orientation-preserving homeomorphism fixing the `j`-th puncture
or boundary circle maps a small positively oriented loop around it to another such loop, which is
freely homotopic to `cⱼ`. By the Dehn–Nielsen–Baer theorem the image is the whole of this subgroup
for `b + p ≥ 1` in the hyperbolic range, and the orientation-preserving part of it for `b + p = 0`
(Farb–Margalit, §8.2); only the containment is used in this roadmap. *Needs:* §0.1;
MordellLawrenceVenkatesh §5.9; GeometricTopology §§1.7.2, 11.2.1; Mathlib `MulAut`.

- `pureMappingClassAut g n` contains every inner automorphism, and for `n = 0` it is the whole
  automorphism group.
- It is a subgroup: closure under products and inverses follows from the conjugation formula, and
  the proof is part of the definition in the Lean file.
- For `n ≥ 1` and `(g, n) ≠ (0, 1)` no `cⱼ` is conjugate to `cⱼ⁻¹`, so no element sends some `cⱼ`
  to a conjugate of `cⱼ⁻¹`. For `n ≥ 2` the abelianization is free abelian of rank `2g + n − 1`, the
  classes of `c₁, …, c_{n−1}` are basis vectors and that of `c_n` is minus their sum, so each `[cⱼ]`
  is nonzero and `[cⱼ] ≠ −[cⱼ]`. For `n = 1` and `g ≥ 1` the class `[c₁]` is zero, but
  `c₁ = (∏ [aᵢ, bᵢ])⁻¹` is a nontrivial element of the free group on `a₁, …, b_g`
  (FreeGroupsAndLimitGroups §6.2), and in a free group `h w h⁻¹ = w⁻¹` forces `w = 1`: `h²`
  commutes with `w`, centralizers of nontrivial elements are cyclic and the group is torsion-free
  (two elements of a free group commute exactly when they are powers of one element,
  `IsFreeGroup.commute_iff_exists_common_zpow`).
  For `(g, n) = (0, 1)` the group is trivial and `c₁ = c₁⁻¹ = 1`.

**Checks.**

- `(g, n) = (0, 3)`: `PMod(0, 3)` is trivial and `PMod(0, 4)` is the point-pushing group `F₂`
  (§0.3), acting on `π₁(Σ_{0,3})` by inner automorphisms; the automorphism `c₁ ↦ c₂, c₂ ↦ c₁` lies
  in `Mod(0, 3)`'s outer image but not in `pureMappingClassAut 0 3`.
- `(g, n) = (1, 0)`: `pureMappingClassAut 1 0 = Aut(ℤ²) = GL₂(ℤ)`, containing the
  orientation-reversing class `a ↦ b, b ↦ a` of determinant `−1`.
- The automorphism of `surfaceGroup 0 2 ≅ ℤ` sending `c₁` to `c₁⁻¹` is not in
  `pureMappingClassAut 0 2`: in `ℤ` the element `c₁` is conjugate only to itself.
- The once-punctured sphere is the exception to the non-inversion property: `surfaceGroup 0 1` is
  trivial, so the identity, which lies in `pureMappingClassAut 0 1`, sends `c₁ = 1` to `c₁⁻¹ = 1`; for
  the once-punctured torus `c₁ = [a, b]⁻¹` has abelianization class zero, so the argument there is
  the free-group one, not the abelianization.

### 0.3 Twist and push conventions and the pure Birman sequence

Throughout, `T_β` is the positive twist of GeometricTopology §1.7.2 (*Conventions*), and
`T^{LV}_β` is MordellLawrenceVenkatesh §5.11's twist, defined on a model annulus oriented by
`dt ∧ dθ`. Prove that for every simple closed curve `β` in the interior of `Σ_{g,b,p}` avoiding the
punctures, `T^{LV}_β = T_β⁻¹` in `Mod(Σ_{g,b,p})`, and that for `p = 0` the class `T_β` is
GeometricTopology §1.7.2's twist under §11.2.1 item 5: the substitution `s = 1 − t` carries the model
annulus oriented by `dt ∧ dθ` to one oriented by `dθ ∧ ds` and the map `(θ, t) ↦ (θ + 2πt, t)` to
`([θ], s) ↦ ([θ − s], s)` in the coordinate `θ/2π`, the inverse of the positive twist up to the
rotation by one full turn, which is the identity. Consequently MordellLawrenceVenkatesh §5.12 reads,
for every `x ∈ H₁(Σ_{g,b,p}; ℤ)` and `k ∈ ℤ`,

`T_β^k(x) = x + k · î(β, x) · [β]`, equivalently `x − k · î(x, β) · [β]`,

with `î` the algebraic intersection number, positive at a crossing where the ordered pair of
directions agrees with the orientation; a multitwist `∏ T_{βᵢ}^{mᵢ}` about pairwise disjoint
curves acts by `x ↦ x + Σ mᵢ î(βᵢ, x)[βᵢ]` and is unipotent (Farb–Margalit, Proposition 6.3,
stated for the left twist, with the opposite sign). Likewise MordellLawrenceVenkatesh §5.20's
formula `Push(α) = T^{LV}_a (T^{LV}_b)⁻¹` for a simple loop `α` with left and right push-offs `a`,
`b` reads `Push(α) = T_a⁻¹ T_b` (Farb–Margalit, Fact 4.7, which reads `T_a T_b⁻¹` for the left
twist), and `Push(α)` acts on `π₁(Σ, x)` by `γ ↦ α * γ * α⁻¹` (MordellLawrenceVenkatesh §5.19).

Prove the pure Birman sequence: for `χ(Σ_{g,b,p}) < 0` the sequence

`1 → π₁(Σ_{g,b,p}, x) → PMod(g, b, p + 1) → PMod(g, b, p) → 1`

(`Push`, then forgetting `x`) is exact; in particular
`1 → π₁(Σ_{g,n}, x) → PMod(g, n + 1) → PMod(g, n) → 1` for `2g − 2 + n > 0`. The image of `Push` is
the kernel of `Forget`, whose classes are isotopic to the identity on `Σ_{g,b,p}` and so fix every
puncture; hence `PMod(g, b, p + 1)` is the preimage of `PMod(g, b, p)` under `Forget`, and the
restriction of MordellLawrenceVenkatesh §5.20 to it is exact (Farb–Margalit, Theorem 4.6).
*Needs:* §§0.1, 0.2; MordellLawrenceVenkatesh §§5.9, 5.11, 5.12, 5.19, 5.20; GeometricTopology
§§1.7.2, 11.2.1; AlgebraicTopology Layer 6 (intersection pairing); Mathlib
`FundamentalGroup.mul_def`.

**Checks.**

- On the torus with `î(a, b) = 1` and ordered basis `(a, b)`, `T_a` sends `[b]` to `[b] + [a]` and
  has matrix `[[1, 1], [0, 1]]`, and `T_b` sends `[a]` to `[a] − [b]` and has matrix
  `[[1, 0], [−1, 1]]`, GeometricTopology §1.7.2's twist matrices; MordellLawrenceVenkatesh §5.12's
  torus matrices `[[1, −1], [0, 1]]` and `[[1, 0], [1, 1]]` are their inverses, and applying the
  formula `x + k î(x, β)[β]` to `T_a` would give `T_a[b] = [b] − [a]`, the wrong sign for the
  positive twist.
- The sign witness for the push: in a collar `(ℝ/ℤ) × [−1, 1]` of `α = {t = 0}` with orientation
  `dθ ∧ dt`, the left push-off is `a = {t = 1/2}` and the right one `b = {t = −1/2}`, and pushing
  `x = ([0], 0)` once along `α` ends at `([θ], t) ↦ ([θ + ψ(t)], t)` with `ψ(0) = 1` and `ψ(±1) = 0`.
  The positive twist about `b` on `t ∈ [−1, −ε]` turns `θ` by a function rising from `0` to `1`, and
  the inverse positive twist about `a` on `t ∈ [ε, 1]` by one falling from `1 ≡ 0` to `0`; together
  they are such a `ψ`, so the push is `T_a⁻¹ T_b`, and `T_a T_b⁻¹` is the push along `α⁻¹`. On a
  closed genus-two surface the two conventions give the same action
  `x + î(a, x)[a] − î(b, x)[b] = x` on `H₁`, since `[a] = [b]`, so that computation does not fix the
  sign.
- `(g, n) = (0, 3)`: the pure sequence is `1 → F₂ → PMod(0, 4) → 1 → 1`, so `PMod(0, 4) ≅ F₂`, while
  the sequence of MordellLawrenceVenkatesh §5.20 with punctures permuted has the same kernel `F₂`
  and quotient `Mod(Σ_{0,3}) ≅ S₃`; restricting to pure classes changes the quotient, not the
  kernel.
- On the torus `Push` is trivial (`π₁` is abelian and translations give the isotopies), so the
  injectivity statement needs `χ < 0`.

### 0.4 Capping boundary circles

Prove that replacing each boundary circle of `Σ_{g,b,p}` by a puncture induces a surjection
`PMod(g, b, p) → PMod(g, 0, b + p)` whose kernel is generated by the Dehn twists about the `b`
boundary-parallel curves, a central free abelian group of rank `b` when `2g − 2 + b + p > 0`
(Farb–Margalit, Theorem 3.18 and Proposition 3.19; Landesman–Litt, proof of Lemma 7.2.5): cap the
circles one at a time by MordellLawrenceVenkatesh §5.21, restrict to pure classes, note that capping
a circle by a marked disc leaves `2g − 2 + b + p` unchanged, so every intermediate surface is
hyperbolic and each boundary twist has infinite order, and that the twists about disjoint boundary
curves commute and are central. A boundary twist acts trivially on `π₁(Σ_{g,b,p}, v₀)` for `v₀`
outside its collar, so the based actions of `PMod(g, b, p + 1)` and of its image in
`PMod(g, 0, b + p + 1)` on the fundamental group have the same image. *Needs:* §§0.2, 0.3;
MordellLawrenceVenkatesh §5.21.

**Checks.**

- For `b = 0` the map is the identity.
- For the torus with one boundary circle the kernel is generated by the boundary twist and the
  quotient is `PMod(1, 0, 1) ≅ SL₂(ℤ)`.
- For `g ≥ 1` the boundary twist of `Σ_{g,1,0}` is nontrivial in `PMod(g, 1, 0)` but trivial in
  `Aut(π₁(Σ_{g,1,0}, v₀))`. For the disc, `g = 0`, it is trivial already in
  `PMod(0, 1, 0) = Mod(D²) = 1` (GeometricTopology §1.7.2), outside the hyperbolic range: the kernel
  is not free abelian of rank one there.

### 0.5 Finite abelianization in genus at least two

Prove that for a connected oriented surface of genus `g` with `r` boundary circles and `n`
punctures, the first homology `H₁(PMod; ℤ)` of its pure mapping class group (fixing boundary
pointwise and each puncture) is `ℤ/10` for `g = 2` and `0` for `g ≥ 3`, for all `r, n ≥ 0`; for
`g = 1` it is `ℤ/12` if `r = 0` and `ℤ^r` if `r ≥ 1` (Korkmaz, Theorem 5.1, Kor02 line 357). In
particular every homomorphism from `PMod` to `ℂ^×` has finite image of order dividing `10` when
`g ≥ 2`. The route is Gervais's presentation and the lantern relation, which express the twist about
a nonseparating curve through twists about curves of the same type; generation of the pure
mapping class groups of punctured surfaces by twists follows from Lickorish's theorem for `Mod⁺` of
the capped compact surface, which is its `PMod(g, b, 0)` (§0.2), and the pure Birman sequence,
since `Push(α) = T_a⁻¹ T_b`. *Needs:* §§0.3, 0.4; GeometricTopology §1.7.2 (Lickorish's twist
theorem for `Mod⁺`); MordellLawrenceVenkatesh §5.10 (change of
coordinates).

**Checks.**

- `g = 1, r = 1`: the abelianization is `ℤ`, generated by a nonseparating twist; a character
  sending it to `2` has infinite image, so genus `≥ 2` is needed for finiteness.
- `g = 1, r = 0`: `SL₂(ℤ)^ab ≅ ℤ/12`.
- `g = 2`: the abelianization `ℤ/10` is nonzero, so the statement is finiteness, not perfectness.

### Examples

- On `Σ_{2,1}` the based action of `PMod(2, 2)` contains the point-pushing copy of the free group of
  rank four, acting on `surfaceGroup 2 1` by inner automorphisms (§0.3), inside
  `pureMappingClassAut 2 1` (§0.2).
- On the torus, `T_a` and `T_b` act on `H₁` by the two elementary matrices of §0.3 and generate
  `SL₂(ℤ)`, the image of `PMod(1, 0)`.

### Dependencies

MordellLawrenceVenkatesh §§5.1, 5.4, 5.9–5.12, 5.19–5.21; GeometricTopology §§1.7.2, 11.2.1;
FreeGroupsAndLimitGroups §§6.1–6.2; AlgebraicTopology Layers 1 and 6; Mathlib `PresentedGroup`,
`FreeGroup`, `MulAut`, `FundamentalGroup`; Tau Ceti `IsFreeGroup.commute_iff_exists_common_zpow`.

## Layer 1: group cohomology, central isogenies, Artinian deformations and representation schemes

This layer states, for arbitrary discrete groups, the cohomological and deformation-theoretic tools
the lifting and constancy arguments use: the Hochschild–Serre sequence in low degrees with the
transgression, the obstruction to lifting a projective representation through a finite central
isogeny with a prescribed restriction, deformations over Artinian `ℂ`-algebras with the constancy
criterion of Landesman–Litt, representation schemes with fixed determinant and their reductive
quotients, and the Jordan identity in finite linear groups.

### 1.1 The Hochschild–Serre sequence in low degrees

Let `1 → N → G → Q → 1` be an extension of groups and `M` a `G`-module. Prove that there is a
spectral sequence `E₂^{p,q} = H^p(Q, H^q(N, M)) ⇒ H^{p+q}(G, M)`, natural in the extension and in
`M` (Hochschild–Serre, Chapter I, §7, Proposition 7, printed p. 117), and deduce:

- the five-term exact sequence
  `0 → H¹(Q, M^N) → H¹(G, M) → H¹(N, M)^Q → H²(Q, M^N) → H²(G, M)`, whose third map is the
  transgression `tg` (Hochschild–Serre, Chapter III, §4, Theorem 2 with `m = 1`, printed p. 129);
- the degree-two filtration: writing `F¹H²(G, M)` for the kernel of restriction to `N`, there is a
  natural map `F¹H²(G, M) → H¹(Q, H¹(N, M))` whose kernel is the image of inflation from
  `H²(Q, M^N)`;
- for a trivial `G`-module `μ`, a homomorphism `χ : N → μ` invariant under conjugation by `G`
  extends to `G` if and only if `tg(χ) = 0` in `H²(Q, μ)`.

Exactness of inflation–restriction in every positive degree is pinned
(`TauCeti.groupCohomology.HInfRes_exact`, `groupCohomology.H1InfRes_exact`). So is the cochain
construction of the transgression for an arbitrary topological group and normal subgroup:
`TauCeti.ContCohomology.IsTransgressionLift` with its descended coboundary
`TauCeti.ContCohomology.IsTransgressionLift.cocycle` on `G ⧸ N` with values in `M^N` and its
independence of the lift and the representative,
`TauCeti.ContCohomology.IsTransgressionLift.cocycle_sub_mem_B2`, on the conjugation-invariant
classes `TauCeti.ContCohomology.H1ConjInvariants`. For a discrete group with the discrete topology
every cochain is continuous, so a lift exists through a set-theoretic section of `G → G ⧸ N`, and
the descended coboundary defines `tg`. The targets here are the existence of that lift for
discrete groups, exactness at `H¹(N, M)^Q` and at `H²(Q, M^N)`, the comparison of the explicit
low-degree classes with Mathlib's `groupCohomology` of the discrete group, and the degree-two
filtration: the pinned `TauCeti.ContCohomology.transgression`,
`TauCeti.ContCohomology.fiveTerm_exact_H1N` and `TauCeti.ContCohomology.fiveTerm_exact_H2Q` assume
`G` compact and totally disconnected, and the profinite five-term sequence of ProfiniteCohomology
Layer 5 is the same statement for profinite groups and closed normal subgroups; neither applies to
infinite discrete groups. *Needs:* Mathlib group cohomology of `Rep`; Tau Ceti
`TauCeti.groupCohomology.HInfRes_exact`, `TauCeti.ContCohomology.H1ConjInvariants`,
`TauCeti.ContCohomology.IsTransgressionLift`, `TauCeti.ContCohomology.IsTransgressionLift.cocycle`,
`TauCeti.ContCohomology.IsTransgressionLift.cocycle_sub_mem_B2`.

**Checks.**

- `N = G`: then `Q = 1`, `H²(Q, −) = 0` and the sequence gives `H¹(G, M) ≅ H¹(G, M)`; for `N = 1`
  inflation `H¹(Q, M) → H¹(G, M)` is an isomorphism.
- `G = ℤ/4`, `N = 2ℤ/4`, `μ = ℤ/2` trivial: the nonzero character of `N` is invariant but does not
  extend, since every homomorphism `ℤ/4 → ℤ/2` kills `2`; its transgression is the nonzero class of
  the extension `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` in `H²(ℤ/2, ℤ/2) = ℤ/2`.
- `G = ℤ/2 × ℤ/2`, `N = ℤ/2 × 0`: the nonzero character of `N` extends by the projection and its
  transgression vanishes, distinguishing the split from the nonsplit extension of the previous check.

### 1.2 Lifting through a finite central isogeny with prescribed restriction

For `r ≥ 1` and a finite subgroup `D ⊂ ℂ^×`, let `G_D = {A ∈ GL_r(ℂ) | det A ∈ D}`. The projection
`G_D → PGL_r(ℂ)` is surjective with finite cyclic central kernel `μ_D = {ζ ∈ ℂ^× | ζ^r ∈ D}`
(scalar matrices). Prove, for an arbitrary group `G` and a homomorphism `q : G → PGL_r(ℂ)`:

- there is a class `o_D(q) ∈ H²(G, μ_D)` (trivial action), natural under pullback, which vanishes
  exactly when `q` lifts to a homomorphism `G → G_D`; its image in `H²(G, ℂ^×)` is
  `TauCeti.IsProjectiveRep.cohomologyClass` of a normalized lift of `q`;
- two lifts differ by multiplication by a unique homomorphism `G → μ_D`;
- let `N ⊴ G` and let `ρ_N : N → G_D` lift `q|_N` and satisfy `A ρ_N(n) A⁻¹ = ρ_N(γ n γ⁻¹)` for
  every `γ ∈ G`, every lift `A ∈ G_D` of `q(γ)` and every `n ∈ N`. If `o_D(q) = 0` and `ρ̃` is any
  lift of `q`, then `ρ̃|_N = χ · ρ_N` for a unique `G`-invariant `χ : N → μ_D`, and some lift of `q`
  restricts to `ρ_N` on `N` if and only if `tg(χ) = 0` in `H²(G/N, μ_D)` (§1.1).

The class is that of the central extension `1 → μ_D → q^*G_D → G → 1`; the pinned
`TauCeti.IsProjectiveRep`, `TauCeti.IsProjectiveRep.toPGL`, `MonoidHom.exists_isProjectiveRep_toPGL_eq`
and `TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff` supply the passage between homomorphisms
to `PGL_r` and lifts with factor sets, and the vanishing criterion with `ℂ^×` coefficients
(Landesman–Litt, proof of Proposition 2.3.4, pp. 16–18). *Needs:* §1.1; Tau Ceti
`TauCeti.IsProjectiveRep`, `TauCeti.IsProjectiveRep.cohomologyClass_eq_zero_iff`,
`TauCeti.isProjectiveRepEquivExtensionHom`; RepresentationTheory/InductionRestriction Layer 7 for
the finite-group case.

**Checks.**

- `r = 1`: `PGL₁` is trivial, `μ_D = D`, `o_D = 0` and the lifts are the homomorphisms `G → D`.
- `G = ℤ/2 × ℤ/2` with `q` the Klein-four subgroup of `PGL₂(ℂ)` (images of `diag(1, −1)` and
  `[[0, 1], [1, 0]]`): any two lifts anticommute, so no lift exists for any `D` and `o_D(q) ≠ 0`;
  pulled back along `Q₈ → ℤ/2 × ℤ/2`, the class vanishes (the standard representation of `Q₈` in
  `SL₂(ℂ)` lifts it), as naturality requires.
- `G = ℤ`, `N = 2ℤ`, `r = 1`, `q` trivial and `ρ_N(2) = −1`: a lift restricting to `ρ_N` is a
  homomorphism `ℤ → D` with `ρ̃(1)² = −1`. It exists for `D = μ₄` and not for `D = μ₂`, and
  correspondingly `tg(χ)` is the class of `−1` in `H²(ℤ/2, D) = D/D²`, zero for `μ₄` and nonzero
  for `μ₂`.

### 1.3 Artinian deformations and the constancy criterion

Let `Art` be the category of local Artinian `ℂ`-algebras with residue field `ℂ`. For a group `G`, a
representation `ρ_A : G → GL_r(A)` and a square-zero extension `0 → I → B → A → 0` in `Art`, a
deformation of `ρ_A` to `B` is a lift `ρ_B`, and two are equivalent when they are conjugate by a
matrix congruent to the identity modulo `I`. Prove:

- for `A[ε]/ε² → A`, the constant-determinant deformations of `ρ_A` up to equivalence form a set in
  natural bijection with `H¹(G, ad ρ_A)`, functorially in `G` (Landesman–Litt, Lemma 3.1.1, citing
  Mazur);
- for `1 → N → G → Q → 1` with `H⁰(Q, H¹(N, ad ρ|_N)) = 0`, every constant-determinant deformation
  of `ρ` to `A[ε]/ε²` restricts on `N` to the constant deformation (Landesman–Litt, Lemma 3.1.2,
  by §1.1);
- **the constancy criterion**: put `B_n = ℂ[t]/(t^{n+1})` for `n ≥ 0`, and for `n ≥ 1` put
  `R_n = B_{n−1}[ε]/ε² = ℂ[t, ε]/(t^n, ε²)` and `d_n : B_n → R_n`, `f ↦ f + ε f′` (well defined
  since `(t^{n+1})′ = (n + 1) t^n` vanishes in `B_{n−1}`). If for every `n ≥ 0` and every
  deformation `γ : G → GL_r(B_n)` of `ρ₀` with `γ|_N` constant one has
  `H⁰(Q, H¹(N, ad γ|_N)) = 0`, then every `ρ_∞ : G → GL_r(ℂ[[t]])` with `ρ_∞ ≡ ρ₀ (mod t)` and
  constant determinant has `ρ_∞|_N` conjugate over `ℂ[[t]]` to a constant representation
  (Landesman–Litt, Proposition 3.2.1, pp. 21–23). The conjugators are built as a convergent product
  of compatible corrections `id + C t^n / n`, one for each `n ≥ 1`, each obtained from `d_n` at that
  order; a separate conjugator at each order without compatibility does not suffice.

*Needs:* §1.1; Mathlib `PowerSeries`, `Matrix.GeneralLinearGroup`.

**Checks.**

- `d_n` is injective for `n ≥ 1`: `f + ε f′ = 0` forces `f = c t^n` in `B_n` and then
  `f′ = n c t^{n−1} = 0` in `B_{n−1}`, so `n c = 0` and `c = 0`. For `n = 1`, `a + bt ↦ a + bε`; for
  `n = 2`, `a + bt + ct² ↦ a + bt + ε(b + 2ct)`; both have kernel `0`.
- No `d₀` is used: the formula would give `R₀ = B_{−1}[ε]/ε² = 0` (from `ℂ[t]/(t⁰) = 0`), and
  `d₀ : ℂ → 0` is not injective, while the correction `id + C t^n / n` has no meaning at `n = 0`.
  Reading `B_{0−1}` as `B₀` by truncated subtraction does not help either: `f ↦ f + ε f′` would not
  be well defined on `B₀`, since `t = 0` there while `t′ = 1`. The hypothesis still quantifies
  over `B₀ = ℂ`, where it reads `H⁰(Q, H¹(N, ad ρ₀|_N)) = 0`.
- `r = 1`: `ad ρ₀ = 0`, so the hypothesis holds, and a constant-determinant `ρ_∞` of rank one is
  constant, as the criterion asserts.
- `G = N = ℤ`, `ρ₀` trivial of rank two, `ρ_∞(1) = [[1, t], [0, 1]]`: the determinant is constant,
  `H¹(ℤ, sl₂) = sl₂ ≠ 0` violates the hypothesis, and `ρ_∞` is not conjugate to a constant
  representation (the only constant lift of `ρ₀` is trivial), so the hypothesis cannot be dropped.

### 1.4 Representation schemes with fixed determinant and their quotients

For a finitely presented group `Γ = ⟨s₁, …, s_k | w₁, …, w_l⟩`, `r ≥ 1` and a character
`χ : Γ → ℂ^×`, define `R_r(Γ)_χ` as the closed subscheme of `GL_r^k` over `ℂ` cut out by
`w_j(A₁, …, A_k) = 1` and `det A_i = χ(s_i)`, with `GL_r` acting by simultaneous conjugation, and
`M_r(Γ)_χ = Spec O(R_r(Γ)_χ)^{GL_r}` with quotient map `π`. Write `R_r(Γ)` and
`M_r(Γ) = Spec O(R_r(Γ))^{GL_r}` for the same constructions without the determinant equations, so
that `R_r(Γ)` represents `B ↦ Hom(Γ, GL_r(B))`, `M_r(Γ)` is the character variety of `Γ`, and
`R_r(Γ)_χ` is a closed `GL_r`-stable subscheme of `R_r(Γ)`, the determinant equations being
conjugation-invariant. The three statements below hold for `R_r(Γ)` and `M_r(Γ)` with the same
proofs, the determinant condition being dropped from the first. Prove:

- `R_r(Γ)_χ` represents `B ↦ {ρ : Γ → GL_r(B) | det ρ = χ}` on commutative `ℂ`-algebras, and a
  change of presentation gives a canonical equivariant isomorphism; a connected component `X` of
  `R_r(Γ)_χ` is a connected affine `ℂ`-scheme of finite type carrying the universal representation
  `Γ → GL_r(O(X))` of determinant `χ`;
- the `GL_r(ℂ)`-orbit of a `ℂ`-point is closed if and only if the representation is semisimple
  (ArithmeticGaloisRepresentations §1.11, *Complete reducibility and closed tuples*; Sikora,
  Theorem 30, Sik12 line 572), and each fibre of `π` over a `ℂ`-point contains exactly one closed
  orbit (LanglandsParameterStacks §2.2), that of the semisimplification;
- `π` is surjective, connected components of `R_r(Γ)_χ` are `GL_r`-stable, and `π` induces a
  bijection between connected components of `R_r(Γ)_χ` and of `M_r(Γ)_χ`: images of disjoint closed
  invariant subsets are disjoint and closed, and every fibre is connected because each orbit closure
  in it contains its unique closed orbit.

*Needs:* LanglandsParameterStacks §2.2 (finite generation, closed images, separation of invariant
closed subsets and the unique closed orbit for arbitrary affine schemes of finite type over a field);
ArithmeticGaloisRepresentations §1.11 (*Complete reducibility and closed tuples*);
SchemeAndStackFoundations Layer 0; Mathlib `AlgebraicGeometry.Scheme`.

**Checks.**

- `Γ = ℤ`, `r = 2`, `χ = 1`: the unipotent `[[1, 1], [0, 1]]` and the identity have the same image
  in `M_2(ℤ)_1`, only the identity has a closed orbit, and both lie in one connected component.
- `Γ` trivial: `R_r(Γ)_χ` is a point and so is `M_r(Γ)_χ`.
- `Γ = ℤ/2`, `r = 2`, without fixed determinant: `R_2(Γ)` is the set of involutions, the points `I`
  and `−I` and the closed orbit of `diag(1, −1)`, of dimension `4 − 2 = 2`; it has three connected
  components and `M_2(Γ)` has three points. Fixing the determinant selects `±I` for `χ` trivial and
  the orbit of `diag(1, −1)` for `χ(s₁) = −1`, so `R_2(Γ)` is the disjoint union of its two
  fixed-determinant subschemes; a reading of `M_r(Γ)` as one of the `M_r(Γ)_χ` would lose a
  component.
- `Γ = ℤ/2`, `r = 2`, `χ` trivial: an involution of determinant one is `±I`, so `R_2(Γ)_χ` has
  the two points `±I`, two components, and `M_2(Γ)_χ = R_2(Γ)_χ`, matching the bijection on
  components; for `χ` trivial and `r = 1` the scheme is the single point `1`, since fixing the
  determinant fixes a rank-one representation. The coordinate ring `ℂ × ℂ` of `R_2(Γ)_χ` has the
  idempotents `(1, 0)`, `(0, 1)` with product `0`, so it is not a domain: a quotient theorem for
  integral affine varieties alone does not cover it, and the general one of LanglandsParameterStacks
  §2.2 is what keeps both components.

### 1.5 The Jordan identity and two-generation of finite general linear groups

Jordan's theorem is FiniteGroupInvariants §10.5: for every `r ≥ 1` there is `J(r) = jordanBound r`
such that every finite subgroup of `GL_r(K)`, for a field `K` of characteristic zero, has an
abelian normal subgroup of index at most `J(r)` (`jordan_exists_abelian_normal_index_le`;
Curtis–Reiner, Theorem 36.13, is the classical reference). Put `m(r) = J(r)!` and prove that every
finite subgroup `F` of `GL_r(K)` satisfies the identity `[x^{m(r)}, y^{m(r)}] = 1`: for an abelian
normal `A ⊴ F` of index `k ≤ J(r)`, the exponent of `F/A` divides `k!`, which divides `m(r)`, so
`x^{m(r)}` and `y^{m(r)}` lie in `A` and commute. Prove also that `GL_r(𝔽_p)` is generated by two
elements for every prime `p` and every `r ≥ 2` (Waterhouse). *Needs:* FiniteGroupInvariants §10.5;
Mathlib `Matrix.GeneralLinearGroup`, `Subgroup.index`.

**Checks.**

- In `GL₂(𝔽_p)` put `u = [[1, 1], [0, 1]]`, `l = [[1, 0], [1, 1]]`. Then
  `u^m l^m = [[1 + m², m], [m, 1]]` and `l^m u^m = [[1, m], [m, 1 + m²]]`, which agree exactly when
  `p | m`; so `GL_r(𝔽_p)`, containing these as a block, violates the identity when `p ∤ m(r)`.
- The factorial matters: if the index `k` of the abelian subgroup does not divide the chosen
  exponent, `x^{exponent}` need not lie in it; `k ≤ J(r)` always divides `J(r)!`.
- `r = 1`: finite subgroups of `K^×` are cyclic, so `J(1) = 1` (FiniteGroupInvariants §10.5's
  `jordanBound 1 = 1`) and the identity holds with `m = 1`.

### Examples

- For the extension `1 → π₁(Σ_{g,n}) → PMod(g, n + 1) → PMod(g, n) → 1` of §0.3 and `μ` finite,
  §1.1 gives the sequence used in Layer 4 to kill obstruction classes in two steps: first their
  image in `H¹(Q, H¹(N, μ))`, then the inflated class from `H²(Q, μ)`.
- For `Γ = π₁(Σ_{g,n})`, the component of `R_r(Γ)_χ` through a point is the connected finite-type
  parameter scheme of Layer 8's constancy lemma.

### Dependencies

Mathlib group cohomology, `Matrix.GeneralLinearGroup`, `PowerSeries`, `AlgebraicGeometry.Scheme`;
Tau Ceti `TauCeti.groupCohomology.HInfRes_exact`, `TauCeti.ContCohomology.IsTransgressionLift` and
its descended cocycle, `TauCeti.IsProjectiveRep` and its cohomology class;
ArithmeticGaloisRepresentations §1.11; LanglandsParameterStacks §2.2; FiniteGroupInvariants
§10.5; RepresentationTheory/InductionRestriction Layer 7; SchemeAndStackFoundations Layer 0.

## Layer 2: finite orbits and surface monodromy

This layer defines MCG-finiteness and punctured étale-versal families, identifies the orbifold
fundamental groups of the moduli stacks with pure mapping class groups through Teichmüller
uniformization, and proves that every local system on the total space of a versal family restricts
to an MCG-finite representation of a fibre.

### 2.1 MCG-finite representations

Define `HasFiniteConjugacyOrbitUnder H ρ`, for a group `G`, a subgroup `H` of `MulAut G` and
`ρ : G → GL_r(ℂ)`: there is a finite set `S` of homomorphisms such that for every `φ ∈ H` the
pullback `ρ ∘ φ` is `GL_r(ℂ)`-conjugate to some `σ ∈ S`. A representation `ρ` of `π₁(Σ_{g,n}, x)` is
*MCG-finite* when this holds for the image of the based action of `PMod(g, n + 1)` (§0.2); since
inner automorphisms change `ρ` only by conjugation, this is finiteness of the orbit of the actual
conjugacy class of `ρ` under the outer action of `PMod(g, n)`, and, as `PMod(g, n)` has index `n!`
in `Mod(g, n)`, under `Mod(g, n)` (Landesman–Litt, Definition 1.1.1, p. 2). No semisimplification is
taken. *Needs:* §0.2; Mathlib `MulAut`, `Matrix.GeneralLinearGroup`.

- `HasFiniteConjugacyOrbitUnder H ρ` holds if and only if the stabilizer in `H` of the conjugacy
  class of `ρ` has finite index in `H`.
- It depends only on the conjugacy class of `ρ`; it passes from `H` to every subgroup of `H`, and
  from a subgroup of finite index in `H` back to `H`.
- Precomposition with conjugation by `x` is conjugation of `ρ` by `ρ(x)`, so the predicate for `H`
  and for `H` together with the inner automorphisms agree.
- For an automorphism `ψ` of `G` normalizing `H`, `ρ` has the property exactly when `ρ ∘ ψ` has it.
- If `ρ` has the property then so do `det ∘ ρ` and every exterior power of `ρ`.

**Checks.**

- The trivial representation, including rank zero, has a one-element orbit.
- A representation with finite image of a finitely generated group has finite orbit: there are
  finitely many homomorphisms into its image, and finitely many conjugacy classes of embeddings.
- On a closed genus-two surface let `f : π₁ → ℂ` be the homomorphism with `f(a₁) = 1` and
  `f(b₁) = f(a₂) = f(b₂) = 0`. The unipotent representation `γ ↦ [[1, f(γ)], [0, 1]]` has conjugacy
  class determined by the line of `f`, and `Sp₄(ℤ)` moves this line to infinitely many lines, so
  the orbit is infinite although the semisimplification is trivial with a one-element orbit.

### 2.2 Punctured étale-versal families

For `2g − 2 + n > 0`, a *punctured étale-versal `(g, n)`-family* is a smooth proper morphism
`π : C → M` with geometrically connected genus-`g` fibres over a connected smooth complex variety
`M`, with `n` disjoint sections, whose classifying map `M → M_{g,n}` to the moduli stack of
SchemeAndStackFoundations §4.15 (`Mbar.smooth`) is dominant and étale; `C°` is the complement of
the sections and `π° : C° → M` (Landesman–Litt, Notation 1.10.1, pp. 10–11). The word *versal*
includes étaleness. *Needs:* SchemeAndStackFoundations §4.15.

- The fibre of `C°` over `m` is the pointed curve minus its section values.
- Connected dominant étale base change preserves the family and its ordered sections.
- A chosen marking of an analytic fibre identifies its fundamental group with `π₁(Σ_{g,n})`,
  compatibly with `TauCeti.LocalCoefficientSystem.monodromyRepresentation`.
- The universal pointed curve over a connected component of a level cover
  (`level_structure_cover`, `m ≥ 3`) is a punctured étale-versal family.

**Checks.**

- `(g, n) = (0, 3)`: `M_{0,3} = Spec ℂ` is a point, and a connected variety étale over a point is a
  point, so a versal family is the constant family `ℙ¹` with three sections over a point; the
  punctured fibre group is free of rank two. A base with two points is excluded by connectedness.
- A constant family over a point is not versal when `3g − 3 + n > 0`, since its classifying map is
  not dominant.
- A dominant but ramified classifying map, for instance a ramified double cover of a level chart,
  is excluded: versal includes étale.

### 2.3 Teichmüller uniformization of the pointed moduli stack

For `2g − 2 + n > 0`, prove that the Teichmüller space `T(g, n)` of marked complex structures on
`Σ_{g,n}` is a contractible complex manifold of dimension `3g − 3 + n`; that `PMod(g, n)` acts by
change of marking properly discontinuously with finite stabilizers, the automorphism groups of the
pointed curves; that the analytic moduli stack `M_{g,n}^an` is the orbifold quotient
`[T(g, n)/PMod(g, n)]`; and that the universal pointed curve over `T(g, n)` is topologically the
product `T(g, n) × Σ_g` with `n` constant sections. Hence `M_{g,n}^an` has contractible orbifold
universal cover and orbifold fundamental group `PMod(g, n)`, and changing the marking of the base
fibre changes this identification by an inner automorphism (Farb–Margalit, §10.6.3, as used in
Landesman–Litt, proof of Lemma 2.0.1, p. 12). For closed surfaces of genus `≥ 2` the marked atlas,
the dimension and the proper action are TeichmullerGeometry §§2.4 and 3.1–3.3; for punctured
surfaces one route
uses ComplexCurveModuli D0.4's complete finite-area hyperbolic metrics, D0.5's properness and
Fenchel–Nielsen coordinates, which identify `T(g, n)` with `ℝ^{6g−6+2n}`. *Needs:* §0.2;
TeichmullerGeometry §§2.4, 3.1–3.3, 5.1, 5.2, 5.6; ComplexCurveModuli D0.4, D0.5, D5;
SchemeAndStackFoundations §4.15.

**Checks.**

- `(g, n) = (0, 4)`: `M_{0,4}` is the thrice-punctured line, a scheme without stabilizers, and the
  theorem gives `π₁ ≅ PMod(0, 4)`, free of rank two.
- `(g, n) = (1, 1)`: `T(1, 1)` is the upper half-plane and `PMod(1, 1) = SL₂(ℤ)` acts through
  `PSL₂(ℤ)` with `−1` acting trivially; the generic stabilizer `±1` is the elliptic involution. Three
  objects must be kept apart: the stack `M_{1,1}^an = [T(1, 1)/SL₂(ℤ)]` has orbifold fundamental
  group `SL₂(ℤ)`; the effective orbifold `T(1, 1)/PSL₂(ℤ)`, which forgets the generic stabilizer
  but keeps the cone points of orders `2` and `3`, has orbifold group `PSL₂(ℤ)`; and the coarse
  `j`-line is `ℂ`, with trivial fundamental group. The theorem concerns the first.
- The statement concerns the stack: whenever stabilizers are nontrivial the coarse space has a
  different fundamental group.

### 2.4 Moduli and point-pushing comparison

For `2g − 2 + n > 0`, a base point `m ∈ M_{g,n}` and a lift `m′ ∈ M_{g,n+1}`, prove that there are
isomorphisms `π₁(M_{g,n}, m) ≅ PMod(g, n)` and `π₁(M_{g,n+1}, m′) ≅ PMod(g, n + 1)` under which the
homotopy sequence of the forgetful morphism `M_{g,n+1} → M_{g,n}` (identified with the universal
punctured curve by `Mbar.forget`) becomes the pure Birman exact sequence of §0.3; the fibre inclusion is
point-pushing and its conjugation action is the outer action. These are orbifold groups, not
fundamental groups of coarse spaces (Landesman–Litt, Lemma 2.0.1, p. 12, where the second group is
misprinted as `PMod(g, n)`). Changing the markings changes both vertical isomorphisms by the same
inner automorphism. *Needs:* §§0.3, 2.3; SchemeAndStackFoundations §4.15 (`Mbar.forget`); Tau Ceti
`TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Checks.**

- `(g, n) = (0, 3)`: the forgetful map `M_{0,4} → M_{0,3}` is the thrice-punctured line over a
  point and the sequence is `π₁(Σ_{0,3}) ≅ PMod(0, 4) ≅ F₂` with `PMod(0, 3)` trivial.
- The kernel of `PMod(g, n + 1) → PMod(g, n)` is the `n`-punctured surface group, so the second
  group must be `PMod(g, n + 1)`: with `PMod(g, n)` the sequence would have the wrong kernel.

### 2.5 Dominant étale maps have finite-index image on fundamental groups

Prove that for a dominant étale morphism `f : X → Y` from a connected complex variety to a normal
irreducible complex variety, the image of `π₁(X) → π₁(Y)` has finite index. One route: over a dense
Zariski open `V ⊂ Y` the map `f⁻¹(V) → V` is finite étale (by Zariski's main theorem the complement
of `X` in the normalization of `Y` in its function field has image of smaller dimension), so the
image of `π₁(f⁻¹(V))` has finite index in `π₁(V)`, and `π₁(V) → π₁(Y)` is surjective because `Y` is
normal (Landesman–Litt, proof of Lemma 2.1.4, p. 13; Debarre, Lemma 4.19). For a dominant étale
map to `M_{g,n}` the same holds after pulling back to a level cover (§2.2). *Needs:*
ComplexComparisonPartII §§C6.0, C6.2 (`complexAlgebraicTopology`, `riemannExistence`);
SchemeAndStackFoundations §4.15.

**Checks.**

- An open immersion of a dense open into a smooth variety is surjective on `π₁`.
- The connected double cover `z ↦ z²` of `ℂ^×` has image of index two.
- Dominance is needed: the inclusion of a point has trivial image, of infinite index in
  `π₁(ℂ^×) = ℤ`.

### 2.6 Fundamental groups of versal families

For a punctured étale-versal family with `2g − 2 + n > 0` and compatible base points, prove that
`1 → π₁(C°_m) → π₁(C°) → π₁(M) → 1` is exact and that `π₁(M) → PMod(g, n)` has finite-index image;
hence the outer monodromy on the fibre group is the restriction of the mapping-class action
(Landesman–Litt, Lemmas 2.1.4–2.1.5, pp. 13–14). The family `C° → M` is a locally trivial fibre
bundle by ComplexComparisonPartII §C5.2 (`ehresmannFibration`), with horizontal lifts tangent to
the disjoint sections so that the trivializations preserve them; injectivity on the left holds
because the fibre inclusion factors through the universal punctured curve, where the fibre group
injects by §2.3 — no vanishing of `π₂(M)` is assumed. A locally trivial map is a Serre fibration
(`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`), so the homotopy exact sequence
applies. *Needs:* §§2.2–2.5; ComplexComparisonPartII §C5.2; Tau Ceti
`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`; DGFloer Layer 1 item 2.

**Checks.**

- For the constant family over a point with `(g, n) = (0, 3)` the sequence is `1 → F₂ → F₂ → 1`.
- The finite-index statement needs dominance: a constant map from a point has trivial image, of
  infinite index in `PMod(g, n)` when `3g − 3 + n > 0`.

### 2.7 Fibral finite-orbit monodromy

Prove that the restriction to a fibre of every finite-dimensional complex local system on the total
space `C°` of a punctured étale-versal family is MCG-finite: conjugation by lifts of loops of `M`
supplies actual intertwiners for the finite-index image of `π₁(M)` in `PMod(g, n)`
(Landesman–Litt, Proposition 2.1.3, pp. 13–14). *Needs:* §§2.1, 2.6; Tau Ceti
`TauCeti.LocalCoefficientSystem`, `TauCeti.LocalCoefficientSystem.monodromyRepresentation`.

**Checks.**

- A local system pulled back from `M` restricts trivially to every fibre, a one-element orbit.
- For the universal punctured curve over a level chart this is §3.2 for the image
  of `π₁` of the total space in `PMod(g, n + 1)`.

### Examples

- The unipotent representation of §2.1 restricted from the closed genus-two surface is not the
  fibre of a local system on any versal family, by §2.7.
- Over `M_{0,4}`, the universal curve is a punctured étale-versal family whose total-space group
  `π₁(M_{0,5})` maps onto `PMod(0, 5)`.

### Dependencies

Layer 0; SchemeAndStackFoundations §4.15; TeichmullerGeometry §§2.4, 3.1–3.3, 5.1, 5.2, 5.6;
ComplexCurveModuli D0.4, D0.5, D5; ComplexComparisonPartII §§C5.2, C6.0, C6.2; DGFloer Layer 1 item
2; Tau Ceti `TauCeti.LocalCoefficientSystem`,
`TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization`.

## Layer 3: projective realization

This layer proves the closure properties of MCG-finiteness, the point-pushing restriction theorem,
finiteness of MCG-finite characters in positive genus, and constructs the canonical projective
extension of an irreducible MCG-finite representation to the stabilizer of its class.

### 3.1 Closure properties

Prove that finite direct sums, tensor products and duals of MCG-finite representations are
MCG-finite, that every irreducible constituent of the semisimplification is MCG-finite, and that a
subrepresentation or quotient singled out functorially under all representation isomorphisms, in
particular the socle (`TauCeti.socle`) and its quotient, is MCG-finite. Arbitrary
non-characteristic subquotients of a nonsplit representation are not asserted to be MCG-finite
(Landesman–Litt, Proposition 2.1.1, p. 12, citing Lawrence–Litt, Lemma 2.2.1; §8.7, p. 44).
*Needs:* §2.1; Tau Ceti `TauCeti.socle`, `TauCeti.isSemisimpleModule_socle`.

**Checks.**

- The stabilizer of `ρ ⊕ σ` and of `ρ ⊗ σ` contains the intersection of the two finite-index
  stabilizers.
- In the abelianization unipotent example `U` on `H ⊕ ℂ` of §12.1 on a closed surface of genus
  `g ≥ 1`, the quotient by a line `L ⊂ H` has conjugacy class determined by `L`, and `Sp_{2g}(ℤ)`
  moves a rational line to infinitely many lines: non-characteristic quotients need not be
  MCG-finite.
- For `g ≥ 1` the socle of `U` is `H`, a characteristic subrepresentation, and both it and the
  quotient `ℂ` are MCG-finite; for `g = 0`, `H = 0` and the socle is all of `ℂ`.

### 3.2 Point-pushing restriction

Prove that for `2g − 2 + n > 0`, a finite-index subgroup `Γ ⊂ PMod(g, n + 1)` containing the
point-pushing subgroup `π₁(Σ_{g,n})` and any representation `ρ : Γ → GL_r(ℂ)`, the restriction of
`ρ` to `π₁(Σ_{g,n})` is MCG-finite: for `γ ∈ Γ`, `n ↦ ρ(γ n γ⁻¹)` is conjugate to `ρ` by `ρ(γ)`
(Landesman–Litt, Proposition 2.1.2, p. 13). *Needs:* §§0.3, 2.1.

**Checks.**

- For `n = 0`, `Γ = PMod(g, 1)` and the symplectic representation on `H₁(Σ_g)` pulled back along
  the forgetful map, the restriction to the point-pushing subgroup is trivial.
- The intertwiner for `γ` is `ρ(γ)` itself, so the orbit under the image of `Γ` in `PMod(g, n)` is a
  single conjugacy class.

### 3.3 Rank-one finiteness

Prove that for `g ≥ 1` and `n ≥ 0` every MCG-finite character `π₁(Σ_{g,n}) → ℂ^×` has finite image;
in particular every positive-rank MCG-finite representation has finite determinant (Landesman–Litt,
Proposition 2.3.1 and Lemma 2.3.2, pp. 15–16). A character factors through `H₁`; for a
nonseparating curve `a` and a class `x` with `î(a, x) = 1`, a power `T_a^k` stabilizes the
character, and §0.3 gives `χ(T_a^k x) = χ(x) χ(a)^k`, so `χ(a)^k = 1`; the standard generators are
nonseparating, and for `n ≥ 2` a puncture loop `cⱼ` is handled through a nonseparating curve in the
class `a₁ + cⱼ`. *Needs:*
§§0.3, 2.1, 3.1; MordellLawrenceVenkatesh §5.10 (a nonseparating curve has a dual curve meeting it
once).

**Checks.**

- `g = 1, n = 0`: a character of `ℤ²` with finite orbit under `SL₂(ℤ)` is torsion, by the two
  transvections.
- Genus zero is excluded: on `Σ_{0,3}` the pure mapping class group is trivial, so the character
  with `c₁ ↦ 2`, `c₂ ↦ 1/2` is MCG-finite with infinite image.

### 3.4 The canonical projective extension

Let `2g − 2 + n > 0`, `N = π₁(Σ_{g,n})` the point-pushing subgroup of `PMod(g, n + 1)`, and
`ρ : N → GL_r(ℂ)`, `r ≥ 1`, irreducible and MCG-finite. Let `Γ ⊂ PMod(g, n)` be the finite-index
stabilizer of the class of `ρ` and `Γ̃` its preimage in `PMod(g, n + 1)`. For `γ ∈ Γ̃` choose an
actual intertwiner `A_γ ∈ GL_r(ℂ)` from `ρ` to `ρ ∘ conj_γ`; by Schur's lemma it is unique up to a
scalar, so `γ ↦ [A_γ]` is a homomorphism `ρ̂ : Γ̃ → PGL_r(ℂ)` restricting to `Pρ` on `N`.
Uniqueness holds among extensions whose values are classes of actual intertwiners, not among
arbitrary `PGL_r` extensions (Landesman–Litt, Lemma 2.2.2, pp. 14–15, with the uniqueness clause
corrected as in the authors' erratum). On the total space of a finite étale scheme cover of
`M_{g,n}` with `π₁`-image in `Γ`, `ρ̂` defines a projective local system restricting on the based
fibre to `Pρ` (Landesman–Litt, Lemma 2.2.3, p. 15). *Needs:* §§2.1, 2.4; Mathlib
`Representation.IsIrreducible`, `Representation.IsIrreducible.bijective_or_eq_zero`; Tau Ceti
`TauCeti.IsProjectiveRep.toPGL`;
SchemeAndStackFoundations §4.15 (`level_structure_cover`).

- On `N` the extension is `Pρ`, and for `n ∈ N` its value is `[ρ(n)]`.
- The value on `γ` is the class of any actual intertwiner; rescaling the intertwiners does not
  change `ρ̂`.
- For `γ ∈ Γ̃` and `η ∈ N`, `ρ̂(γ) Pρ(η) ρ̂(γ)⁻¹ = Pρ(γ η γ⁻¹)`.
- Restriction to a smaller stabilizer agrees with pulling back the extension.

**Checks.**

- At rank one `PGL₁` is trivial and so is the extension.
- For the two-dimensional irreducible representation of `Q₈` and `G = Q₈ × C₂`, the projective
  image is the Klein four-group, its own centralizer in `PGL₂(ℂ)`, so the `C₂` factor may be sent to
  any element of it: arbitrary projective extensions of `Pρ` are not unique, while actual
  intertwiners for the trivial `C₂`-action are scalar.
- If `Pρ` has trivial centralizer in `PGL_r(ℂ)`, for instance for irreducible `ρ` with Zariski-dense
  image in `SL_r`, every `PGL_r` extension restricting to `Pρ` coincides with `ρ̂`.

### Examples

- For a finite-image irreducible `ρ`, `ρ̂` factors through the finite group of automorphisms of the
  cover defined by `ker ρ` up to the stabilizer.
- On `Σ_{1,1}`, a character with values in `μ_N` is MCG-finite by §2.1 and torsion by §3.3.

### Dependencies

Layers 0–2; Mathlib `Representation.IsIrreducible`; Tau Ceti `TauCeti.socle`,
`TauCeti.isSemisimpleModule_socle`, `TauCeti.IsProjectiveRep.toPGL`; SchemeAndStackFoundations
§4.15.

## Layer 4: linear lifting and relative structure

This layer kills finite cohomological obstructions by pointed dominant étale refinement, lifts the
projective extension to an actual representation with the fibre prescribed, realizes irreducible
MCG-finite representations on versal families, proves the normal-restriction lemma for arbitrary
groups, and decomposes Artinian local systems whose fibre restriction is a constant deformation of
a unitary one.

### 4.1 Pointed étale killing of finite obstruction classes

Let `M` be a smooth connected complex variety, `m ∈ M`, `μ` a finite abelian group with trivial
action, `i > 0` and `α ∈ H^i(π₁(M, m), μ)`. Prove that there are a smooth connected complex variety
`M′`, a point `m′` and a dominant étale map `f : (M′, m′) → (M, m)` with `f^*α = 0` in
`H^i(π₁(M′, m′), μ)`; `f` need not be finite or surjective, but its image contains `m`
(Landesman–Litt, Lemma 2.3.3, p. 16, in the pointed form of the authors' erratum). Map `α` to
`H^i_ét(M, μ)`; a positive-degree class of a sheaf on a site restricts to zero on some covering, so
it vanishes on a pointed étale neighbourhood of `m`, whose component through the base point is
dominant because `M` is irreducible; refine to an Artin neighbourhood of the base point, a
`K(π, 1)`, on which group, singular and étale cohomology with coefficients in `μ` agree. *Needs:*
InverseGaloisAndArithmeticFundamentalGroups §IG.3.1 (*Artin neighbourhoods are `K(π, 1)`*, with its
comparison chain); ComplexComparisonPartII §C6.3 (`artinComparison`); SchemeAndStackFoundations
§§2.1–2.2.

**Checks.**

- `M = 𝔾_m`, `i = 1`, `μ = ℤ/2`, `α` the nontrivial class: the squaring map pointed at `1` is finite
  étale and kills `α`.
- The base point must survive: a neighbourhood of the generic point need not contain `m`, and the
  fibre over `m` carries the prescribed representation of §4.2.

### 4.2 Fibre-prescribed linear lifting

Let `g ≥ 1`, let `ρ` be an irreducible MCG-finite representation of rank `r ≥ 1` with finite
determinant `D = det ρ(N)` (§3.3), and let `ρ̂` be its projective extension realized on a versal
family (§3.4). Prove that after a connected pointed dominant étale base change `ρ̂` lifts to an
actual representation of the total-space group into `G_D` (§1.2) whose restriction to the based
fibre is `ρ` itself, not `ρ ⊗ χ` for a finite character `χ` (Landesman–Litt, Proposition 2.3.4,
pp. 16–18, and Corollary 2.3.5, p. 18). The obstruction `o_D(ρ̂)` restricts to zero on the fibre
group; by §1.1 first kill its image in `H¹(Q, H¹(N, μ_D))`, after making the finite module constant
by a finite étale cover, and only then kill the resulting inflated class in `H²(Q, μ_D)`; finally
the mismatch character `χ` of §1.2 is invariant, and killing its transgression lets one twist the
lift to restrict to `ρ`. Every killing uses the pointed §4.1. *Needs:* §§1.1, 1.2, 3.3, 3.4, 4.1;
Mathlib `groupCohomology.H1InfRes_exact`.

**Checks.**

- `r = 1`: the projective extension is trivial and the lift is the finite character extended to
  the total space after killing its transgression.
- The restriction to the based fibre is `ρ`, not a twist `ρ ⊗ χ` by a finite character.

### 4.3 Linear versal realization

Prove that every irreducible MCG-finite representation of `π₁(Σ_{g,n})` of rank `r ≥ 1`, with
`g ≥ 1` and `2g − 2 + n > 0`, is the fibre restriction of a finite-determinant local system on a
punctured étale-versal family with smooth quasi-projective base, and that every further connected
pointed dominant étale restriction preserves this realization (Landesman–Litt, Corollary 2.3.5,
p. 18). *Needs:* §§2.2, 4.2; SchemeAndStackFoundations §4.15.

**Checks.**

- For finite-image irreducible `ρ`, write `ρ = ρ̄ ∘ φ` with `φ` onto the finite group
  `H = ρ(π₁(Σ_{g,n}))` and `ρ̄ : H → GL_r(ℂ)` the inclusion. A versal family of `φ`-covers
  (InverseGaloisAndArithmeticFundamentalGroups §IG.5.4) extends `φ` to `Φ : π₁(C°) → H`, and
  `ρ̄ ∘ Φ` realizes `ρ` on the genus-`g` family itself. The cover of `C°` defined by `ker Φ` only
  trivializes this local system: for a character of order three on a closed genus-two surface the
  fibre of that cover has genus `1 + 3(2 − 1) = 4` and the pulled-back system is trivial, whereas the
  realization on the original fibre has image `μ₃`.
- The determinant of the realization has finite order, as §4.4 requires.

### 4.4 Irreducible normal restriction

For an arbitrary group `G`, a normal subgroup `N` and `ρ : G → GL_r(ℂ)` with finite determinant
whose restriction to `N` is irreducible, prove: if `ρ(N)` is finite then `ρ(G)` is finite, and if
`ρ|_N` is unitary then `ρ` is unitary. No finiteness of `G` or of `G/N` is assumed (Landesman–Litt,
Lemma 2.4.1, p. 19). For the first part, the kernel of the conjugation action of `G` on the finite
group `ρ(N)` has finite index and centralizes an irreducible representation, hence acts by scalars,
which finite determinant bounds; for the second, an `N`-invariant positive Hermitian form is unique
up to a positive scalar, `G` transports it to a multiple, and finite determinant forces the multiple
to be one. *Needs:* Mathlib `Representation.IsIrreducible`,
`Representation.IsIrreducible.bijective_or_eq_zero`; Tau Ceti
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`.

**Checks.**

- The finite-determinant hypothesis is needed in both parts: for `G = N × ℤ` and
  `ρ(n, k) = 2^k σ(n)` with `σ` irreducible, unitary and of finite image, `ρ|_N` is finite,
  unitary and irreducible while `ρ` has infinite non-unitary image.
- `N = G`: both statements are tautologies.
- The first part uses only Schur's lemma and the finite-index kernel of the conjugation action, not
  Burnside's theorem on groups of finite exponent.

### 4.5 The relative unitary decomposition over Artinian coefficients

Let `A ∈ Art` and `V` a local system of finite free `A`-modules on the total space of a punctured
étale-versal family with `g ≥ 1`, whose restriction to a chosen fibre is isomorphic over `A` to
`U ⊗_ℂ A` with `U` unitary. Prove that after connected dominant étale base change
`V ≅ ⊕ᵢ Uᵢ ⊗_ℂ π°^* Wᵢ`, where the `Uᵢ` are unitary complex local systems on the total space with
finite-order determinant and pairwise nonisomorphic irreducible fibre restrictions and
`Wᵢ = π°_* Hom(Uᵢ, V)` are local systems of finite free `A`-modules on `M` (Landesman–Litt,
Lemma 2.4.2, pp. 19–20, with `g ≥ 1` as in the authors' erratum). This is a fibre-constant
decomposition, not a unitary reduction modulo `m_A`. Extend the irreducible constituents of `U` by
§4.3, make them unitary on the total space by §4.4, and use Schur's lemma and fibrewise evaluation
for the freeness of `Wᵢ` and the isomorphism. *Needs:* §§4.3, 4.4; Mathlib
`Representation.IsIrreducible.bijective_or_eq_zero`; Tau Ceti
`TauCeti.LocalCoefficientSystem`, `TauCeti.LocalCoefficientSystem.pullback`,
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`; ComplexComparisonPartII §C6.1
(*gap:local-system-direct-images* for `π°_*` of local systems of `A`-modules).

- The sum of the evaluation maps `Uᵢ ⊗ π°^* Wᵢ → V` is an isomorphism, and `Wᵢ` carries its actual
  induced `A`-monodromy.
- The decomposition commutes with further dominant étale pullback and with change of Artinian
  coefficients.
- On the fibre, `V|_{C°} ≅ ⊕ᵢ Uᵢ|_{C°} ⊗ (Wᵢ)_m` with the `Uᵢ|_{C°}` irreducible and pairwise
  nonisomorphic.

**Checks.**

- `A = ℂ` and `V` unitary on the total space with irreducible fibre restriction and finite-order
  determinant: one summand, `U₁ = V` and `W₁` trivial of rank one. Without the determinant condition
  `U₁ = V` is excluded: on an open subset `M` of a level chart carrying a dominant regular function
  `f : M → 𝔾_m`, let `χ` be the pullback along `f` of the unitary character of `π₁(𝔾_m) = ℤ` with
  `1 ↦ exp(2πi√2)` and `V = π°^* χ`. The image of `π₁(M)` in `ℤ` has finite index `k ≥ 1` and
  `exp(2πi√2 k m) ≠ 1` for `m ≠ 0`, so `det V = V` has infinite order, also after every finite
  étale base change; the decomposition is `U₁ = ℂ`, `W₁ = χ`, with `U₁ ⊗ π°^* W₁ = V`.
- `V = 0`: the index set is empty and the evaluation map is the unique isomorphism `0 → 0`.
- `V = π°^* W` with `W` a nonconstant rank-one `A`-local system on `M`: `W₁ = W`, not a constant
  multiplicity module; and for `A = ℂ[ε]/ε²` a non-constant first-order deformation of a unitary
  fibre admits no decomposition with constant fibres, so the fibre hypothesis cannot be weakened to
  unitarity modulo `m_A`.

### Examples

- For `ρ` a character of §3.3 of order `N`, §4.3 realizes it on a level-chart family as a character
  `π₁(C°) → μ_N` restricting to `ρ` on the based fibre, the monodromy of the `μ_N`-cover of the total
  space obtained by extracting an `N`-th root; that cover trivializes the character, and the
  realization lives on the original genus-`g` family.
- For a finite étale Galois `H`-cover `f : X° → C°`, §4.5 with `A = ℂ` decomposes `f_* ℂ` as
  `⊕_σ U_σ ⊗ π°^* W_σ`, the decomposition used in Layer 6.

### Dependencies

Layers 1–3; InverseGaloisAndArithmeticFundamentalGroups §IG.3.1; ComplexComparisonPartII §§C6.1,
C6.3; SchemeAndStackFoundations §§2.1–2.2, 4.15; Mathlib `Representation.IsIrreducible`,
`groupCohomology.H1InfRes_exact`; Tau Ceti `TauCeti.LocalCoefficientSystem`,
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`.

## Layer 5: Hodge theory of local systems on families of punctured curves

This layer states the Hodge-theoretic results the finiteness theorem rests on: polarizable complex
variations of Hodge structure and the notions of geometric origin and integral PVHS, semistability
of parabolic Deligne extensions, isomonodromic deformations and their semistability, the limit
theorem for polarizable variations on the punctured disc, the mixed Hodge structure on the
cohomology of unitary local systems in families, the derivative of its
period map, the rank bound for sub-local systems and its Artinian vanishing form, nonabelian Hodge
theory, cohomological rigidity, companions over finite fields with Drinfeld's pro-semisimple
comparison, integrality of rigid local systems, and unitarity of low-rank variations on
analytically general curves. Throughout, `π : C → M` is a punctured étale-versal
`(g, n)`-family (§2.2), `D ⊂ C` the union of the sections and `π° : C° → M`.

### 5.1 Polarizable complex variations of Hodge structure

On a complex manifold `X`, a *complex variation of Hodge structure* is a `C^∞` complex vector
bundle `𝒱 = ⊕_{p,q} 𝒱^{p,q}` with a flat connection `D` satisfying Griffiths transversality
`D(𝒱^{p,q}) ⊂ A^{1,0}(𝒱^{p,q}) ⊕ A^{0,1}(𝒱^{p,q}) ⊕ A^{1,0}(𝒱^{p−1,q+1}) ⊕ A^{0,1}(𝒱^{p+1,q−1})`; a
*polarization* is a flat Hermitian form `ψ` for which the `𝒱^{p,q}` are orthogonal and `(−1)^p ψ`
is positive definite on `𝒱^{p,q}`. A local system *underlies* a polarizable complex variation
(complex PVHS) when it is `ker D` for one (Landesman–Litt 2022, Definition 4.1.1, p. 26). A local
system on a smooth complex variety `X` is *of geometric origin* when on a dense Zariski open
`U ⊂ X` it is a subquotient of `R^i f_* ℂ` for a smooth proper morphism `f : Y → U` and some
`i ≥ 0` (Landesman–Litt, p. 45; Landesman–Litt 2022, p. 3, with direct summands, equivalent by
semisimplicity). For a number field `K`, an *integral PVHS* is a local system `V` of finite free
`O_K`-modules such that `V ⊗_{O_K, ι} ℂ` underlies a complex PVHS for every embedding
`ι : O_K → ℂ` (the reading of Landesman–Litt, Corollary 9.1.4(4) fixed by Landesman–Litt 2022,
Theorem 1.2.5). A representation into `G(ℂ)`, for `G = GL_r` or `PGL_r` over `ℤ`, is *integral*
when it is conjugate into `G(O_K)` for some number field `K` (Landesman–Litt, Definition 8.3.1).
*Needs:* Completed/HodgeStructures (polarized Hodge structures fibrewise); ComplexKahlerGeometry K4;
ComplexComparisonPartII §C5.2 (`relativeBettiLocalSystem`).

- The local system underlying a complex PVHS on a smooth quasi-projective curve is semisimple, and
  decomposes canonically as `⊕ᵢ Lᵢ ⊗ Wᵢ` with the `Lᵢ` pairwise nonisomorphic irreducible local
  systems underlying complex PVHS and the `Wᵢ` polarized Hodge structures (Landesman–Litt 2022,
  Proposition 4.1.4(1)–(2)).
- A unitary local system underlies a complex PVHS concentrated in one bidegree, with the invariant
  positive Hermitian form as polarization; conversely a variation in one bidegree is unitary.
- Complex PVHS are stable under pullback, tensor product, dual and direct sum, and under
  conjugation of coefficients by an automorphism of `ℂ` when the local system has a model over a
  number field whose conjugates all underlie variations.
- A local system with finite monodromy is of geometric origin, as a summand of the push-forward of
  the constant sheaf along the finite étale cover it defines; a local system of geometric origin
  underlies an integral PVHS (Landesman–Litt 2022, proof of Corollary 1.2.7).

**Checks.**

- A rank-one complex PVHS has a single bidegree and is therefore unitary.
- On every closed curve of genus `g ≥ 2` the uniformizing representation underlies a rank-two
  complex PVHS of infinite monodromy (Landesman–Litt 2022, Remark 1.2.6, LL22 line 108). Whether it is
  an integral PVHS depends on the curve. For the quaternion algebra `B = (−1, 3)/ℚ` of discriminant
  `6` the order `ℤ[1, i, j, ij]` embeds by `i ↦ diag(i, −i)`, `j ↦ [[0, 3], [1, 0]]`, and a
  torsion-free finite-index subgroup of its norm-one group uniformizes a closed curve with integral
  monodromy. On an analytically very general curve of genus `g ≥ 2`, Landesman–Litt 2022,
  Theorem 1.2.5 (LL22 line 100, §5.11), would force `2 ≥ 2√(g + 1) ≥ 2√3`, which is false, so there
  the rank-two variation is not an integral PVHS: integrality is a genuine condition.
- A non-real character of finite order `ℤ/3 → ℂ^×` is an integral PVHS over `ℤ[ζ₃]` but preserves
  no rank-one `ℤ`-lattice; a reading of "integral" as an invariant `ℤ`-lattice would exclude this
  finite-image system.

### 5.2 Parabolic Deligne extensions and semistability

Let `C` be a smooth projective connected curve of genus `g` and `D = x₁ + ⋯ + x_n` a reduced
divisor. Define a *parabolic bundle* `E⋆ = (E, {E_{ij}}, {α_{ij}})` on `(C, D)` as a vector bundle
`E` with, at each `x_j`, a strictly decreasing filtration
`E_{x_j} = E_{1j} ⊋ E_{2j} ⊋ ⋯ ⊋ E_{n_j + 1, j} = 0` and weights `0 ≤ α_{1j} < ⋯ < α_{n_j j} < 1`, the
weight `α_{ij}` belonging to the step `E_{ij}` (Landesman–Litt 2022, Definition 2.1.1, LL22 line 401,
p. 10). Define its *parabolic degree*
`par-deg(E⋆) = deg E + Σ_j Σ_i α_{ij} · dim(E_{ij}/E_{i+1,j})` and, when `rk E ≥ 1`, its *parabolic
slope* `µ⋆(E⋆) = par-deg(E⋆)/rk E` (Definition 2.1.2, LL22 line 414, p. 11). A subbundle `F ⊂ E`
carries the induced structure, the filtration `E_{ij} ∩ F_{x_j}` with repetitions removed and each
step weighted by the largest `α_{kj}` producing it, and a quotient the analogous one (§2.3, LL22
line 504, p. 13). `E⋆` is *parabolically semistable* when `µ⋆(F⋆) ≤ µ⋆(E⋆)` for every nonzero
subbundle `F` (Definition 2.4.1, LL22 line 525, p. 14). The *coparabolic zero term* `Ê₀ ⊂ E` is the
subsheaf of sections whose value at each `x_j` lies in the largest step of positive weight: no
condition at `x_j` when `α_{1j} > 0`, and value in `E_{2j}` when `α_{1j} = 0`. It is the value at `0`
of the coparabolic bundle `Ê⋆`, `Ê_α = colim_{β > α} E_β`, whose slope is by definition `µ⋆(E⋆)` and
which is coparabolically semistable exactly when `E⋆` is semistable (Example 2.2.4 and
Definitions 2.2.8, 2.2.9 and 2.4.2, LL22 lines 462, 490, 496 and 529; Landesman–Litt, Remark 5.2.5,
LL24 line 1289).

For a flat bundle `(E, ∇)` with regular singularities along `D`, its *parabolic Deligne extension*
is the canonical logarithmic extension of ComplexComparisonPartII §C5.6 (`CanonicalLogExtension`,
residue eigenvalues with real parts in `[0, 1)`; Deligne 1970, Remarques 5.5(i)) with, at `x_j`, the
distinct real parts `λ_{1j} < ⋯ < λ_{n_j j}` of the eigenvalues of `Res_{x_j} ∇` as weights and
`E_{ij}` the sum of the generalized eigenspaces whose eigenvalues have real part `≥ λ_{ij}`
(Landesman–Litt 2022, Definition 3.3.1, LL22 line 742, p. 20). Prove:

- for a unitary local system on `C ∖ D` the parabolic Deligne extension is parabolically polystable
  of parabolic degree zero (Mehta–Seshadri, Theorem 4.1; Simpson 1990, Theorem 5; Landesman–Litt,
  Remark 5.2.2);
- for a complex PVHS on `C ∖ D` the parabolic Deligne extension has parabolic degree zero and the
  associated parabolic Higgs bundle is parabolically polystable of degree zero (Landesman–Litt 2022,
  Proposition 4.1.4(3)–(5));
- if the parabolic Deligne extension of a complex PVHS on a hyperbolic pointed curve is
  parabolically semistable, its monodromy is unitary (Landesman–Litt 2022, Lemma 7.1.1, p. 49).

*Needs:* §5.1; ComplexComparisonPartII §C5.6 (`CanonicalLogExtension`, `residueStripRep`);
ComplexKahlerGeometry K4–K5.

- Parabolic degree is additive for a parabolic subbundle with the induced structure and the quotient
  with the induced structure, so semistability may be tested on quotients: `µ⋆(E⋆) ≤ µ⋆(Q⋆)` for
  every nonzero quotient (LL22 Lemma 2.4.5, line 541).
- With all weights zero, `par-deg(E⋆) = deg E`, parabolic semistability is ordinary semistability
  and `Ê₀ = E(−D)`; with all weights positive, `Ê₀ = E`.
- Tensoring with a line bundle `L` adds `deg L` to the parabolic slope and preserves semistability;
  dualizing negates it, so for `µ⋆(E⋆) = 0` the parabolic bundle `(E⋆)^∨ ⊗ ω_C(D)` has slope
  `2g − 2 + n`, the case used in §5.5 (Landesman–Litt, proof of Proposition 5.2.3, LL24 line 1298).

**Checks.**

- The trivial rank-one system has Deligne extension `O_C` with all weights zero, parabolic degree
  zero, and is semistable. Its coparabolic zero term is `Ê₀ = O_C(−D)`, of degree `−n`, so for
  `n ≥ 1` one has `h⁰(Ê₀) = 0` while `h⁰(O_C) = 1`: the integer `δ` of §5.3 changes if `Ê₀` is replaced
  by the untwisted bundle `E`.
- On `ℙ¹ ∖ {0, ∞}` the unitary character with monodromy `exp(−2πi a)` around `0`, `0 < a < 1`,
  has canonical extension of degree `−1` (minus the sum of the residues) with residues `a` at `0`
  and `1 − a` at `∞`, so parabolic degree `−1 + a + (1 − a) = 0`; a convention attaching weights
  `−a` would give a nonzero parabolic degree.
- The uniformizing PVHS of §5.1 has Hodge line of positive degree `g − 1` in its Deligne extension,
  which destabilizes it, consistent with the third item since its monodromy is not unitary.
- On `ℙ¹` with `D = 0`, `E = O ⊕ O(1)` has slope `1/2` and the line `O(1)` has slope `1 > 1/2`, so it
  is not semistable. With `D = x` and the filtration `E_x ⊋ O_x ⊋ 0` with weights `0 < a < 1`, the
  parabolic degree is `1 + a` and the slope `(1 + a)/2 < 1`, while `O(1)` meets `O_x` in zero, gets
  the induced weight `0` and slope `1`, and still destabilizes. The zero bundle has no slope and is
  excluded from the Clifford bound of §5.3.

### 5.3 Isomonodromic deformations and their semistability

For a hyperbolic pointed curve `(C, x₁, …, x_n)` and a flat bundle `(E, ∇)` with regular
singularities at the `xᵢ`, the *isomonodromic deformation* over the universal cover `T(g, n)` of
`M_{g,n}^an` (§2.3) is the unique flat bundle with regular singularities along the sections of the
universal curve extending the local system of `(E, ∇)|_{C∖{xᵢ}}` and restricting to `(E, ∇)` on the
central fibre; its restriction to another fibre is an isomonodromic deformation to a nearby curve
(Landesman–Litt 2022, Definitions 3.4.3–3.4.4, p. 22). The *parabolic structure of `∇`* on the
given lattice `E` has at `x_j` the distinct fractional parts `λ_{ij}` of the real parts of the
eigenvalues of `Res_{x_j} ∇` as weights and, as `E_{ij}`, the sum of the generalized eigenspaces
whose eigenvalues have fractional real part `≥ λ_{ij}` (Landesman–Litt 2022, Definition 3.3.1, LL22
line 742); on the canonical lattice it is the parabolic Deligne extension of §5.2. A parabolic
structure on `E` is *refined by* it when each of its steps is a step of that structure carrying the
same weight, so that it arises by deleting steps together with their weights, a point where only
`E_{x_j}` with weight `0` is kept counting as a point with trivial structure (Definition 3.4.8 and
Remark 3.4.9, LL22 lines 871–882). Such a structure deforms with `(E, ∇)`, with constant weights and
constant ranks of the graded pieces of the filtrations (Remark 3.4.7, LL22 line 861). Prove:

- *Irreducible monodromy.* If the monodromy of `(E, ∇)` is irreducible and `rk E < 2√(g + 1)`, then
  for every parabolic structure `E⋆` refined by the one of `∇`, the isomonodromic deformation of `E⋆`
  to an analytically general nearby curve is parabolically semistable (Landesman–Litt 2022,
  Theorem 6.1.1(1), LL22 line 1296, pp. 34–35, with the inequality of arithmetic and geometric
  means: a nonsemistable deformation has two Harder–Narasimhan pieces of ranks `a`, `b` with
  `ab ≥ g + 1` and `a + b ≤ rk E`, whence `rk E ≥ 2√(g + 1)`).
- *Equal-slope filtrations.* Let `rk E < 2√(g + 1)` and `E⋆` be refined by the parabolic structure of
  `∇`. Suppose `E` has a filtration `0 = F₀ ⊊ F₁ ⊊ ⋯ ⊊ F_k = E` by `∇`-stable subbundles such that
  each `G_i = F_i/F_{i−1}` with its induced connection has irreducible monodromy, the parabolic
  structure `G_i⋆` induced from `E⋆` is refined by the parabolic structure of that connection, and
  `µ⋆(G_i⋆) = µ⋆(E⋆)` for every `i`. Then the isomonodromic deformation of `E⋆` to an analytically
  general nearby curve is parabolically semistable: the filtration deforms with `(E, ∇)`, each
  deformed `G_i⋆` is semistable by the first item (off a finite union of nowhere dense closed
  analytic subsets), parabolic slopes are constant along the deformation, and an iterated
  extension of semistable parabolic bundles of one slope is semistable by additivity of parabolic
  degree (§5.2).
- *The parabolic Deligne extension.* The parabolic Deligne extension of §5.2 (the canonical lattice
  with the full parabolic structure of `∇`) satisfies these hypotheses for every filtration by
  `∇`-stable subbundles with irreducible graded pieces, and such a filtration exists (a composition
  series of the local system, saturated in `E`). Indeed the structure induced on a `∇`-stable
  subbundle `F`, and on a quotient, is the full parabolic structure of the induced connection, whose
  weights are the real parts of its residue eigenvalues (they lie in `[0, 1)`), so
  `par-deg(F⋆) = deg F + Σ_j Re tr Res_{x_j}(∇|_F) = 0` by the residue theorem
  `deg F = −Σ_j tr Res_{x_j}(∇|_F)`; all graded pieces and `E⋆` have parabolic slope `0`. Hence for
  `rk E < 2√(g + 1)` and every flat bundle with regular singularities along `D`, the isomonodromic
  deformation of its parabolic Deligne extension to an analytically general nearby curve is
  parabolically semistable. This is the case used in §5.11 (Landesman–Litt 2022, proof of
  Theorem 1.2.12, LL22 line 1896).

Without the equal-slope hypothesis the conclusion fails for reducible monodromy, both on
noncanonical lattices and for coarsened structures on the canonical lattice (Checks): Landesman–Litt
2022, Corollary 6.1.2 (LL22 line 1310), and its special case Corollary 1.3.6 (LL22 line 252) assert
it for every refined structure, and the reduction to irreducible monodromy in their proof (§6.4.10,
LL22 line 1834) presupposes that the graded pieces have equal slopes (References, *Corrections to
the sources*). The main input of the irreducible case is the parabolic Clifford bound: for a nonzero
parabolically semistable parabolic bundle `E⋆` on `(C, D)` (§5.2), a subbundle `U ⊂ Ê₀` of its
coparabolic zero term, `c = rk E − rk U` and `δ = h⁰(Ê₀) − h⁰(U)`, the parabolic slope
`µ⋆(E⋆) = µ⋆(Ê⋆) > 2g − 2 + n` forces `rk E > gc − δ` and `µ⋆(E⋆) = 2g − 2 + n` forces
`rk E ≥ gc − δ` (Landesman–Litt 2022, Proposition 6.3.6, LL22 line 1538, p. 41; Landesman–Litt,
Proposition 5.2.4, LL24 line 1283). Here *analytically general* means off a nowhere dense closed
analytic subset, and *analytically very general* off a locally countable union of such subsets
(Landesman–Litt 2022, Definition 1.2.3, p. 2). *Needs:* §§2.3, 5.2; ComplexComparisonPartII §C5.6.

**Checks.**

- A unitary flat bundle has a polystable parabolic Deligne extension of parabolic degree zero on
  every curve (§5.2); residues are constant along the deformation, so the isomonodromic deformation
  of that extension is the parabolic Deligne extension of the same unitary local system on the
  nearby curve, semistable in every rank and without the bound.
- A noncanonical lattice: on a curve of genus one with one marked point `p` (hyperbolic, since
  `2g − 2 + n = 1`), `E = O(p) ⊕ O(−p)` with the connection `d` of trivial monodromy has residue `−1`
  on `O(p)` (local frame `z⁻¹`, `d(z⁻¹) = −z⁻¹ dz/z`) and `+1` on `O(−p)` (frame `z`). Both fractional
  parts are `0`, so its parabolic structure has the single weight `0`, `par-deg(E⋆) = deg E = 0`, and
  `O(p)` of slope `1 > 0` destabilizes it. The splitting deforms with `(E, ∇)` over the universal
  pointed genus-one family with degrees `1` and `−1` on every fibre, so no deformation is semistable
  although `rk E = 2 < 2√2`. Every `∇`-stable line subbundle is `O(p)` (degree `1`) or isomorphic to
  `O(−p)` (degree `−1`), so the graded pieces of every flat filtration have slopes `{1, −1}` and the
  equal-slope hypothesis fails; the parabolic Deligne extension of the same trivial local system is
  `O ⊕ O` with slopes `0, 0`, semistable on every fibre.
- A coarsened structure on the canonical lattice: on a genus-one curve with marked points `x₁, x₂`,
  let `L` be the canonical extension of the unitary character with local monodromies `exp(−2πi a)`
  at `x₁` and `exp(2πi a)` at `x₂`, `0 < a < 1` (their product is `1`, since a character kills the
  commutator); `L` has residues `a`, `1 − a` and degree `−1`. For `E = L ⊕ O` the full structure has
  `par-deg = −1 + a + (1 − a) = 0` and is polystable. Deleting the weight `a` at `x₁` gives a refined
  structure with `par-deg(E⋆) = −a`, induced slopes `−a` on `L` and `0` on `O`, and `O` destabilizes
  (`0 > −a/2`); the trivial structure, also refined, gives `deg E = −1` with `O` of slope `0 > −1/2`.
  Both splittings persist on every nearby curve and `rk E = 2 < 2√2`, so "every refined structure"
  fails even for unitary monodromy; the unequal graded slopes (`−a, 0` and `−1, 0`) exclude both from
  the equal-slope item.
- The bound cannot be dropped: Landesman–Litt 2022, Theorem 1.3.2, gives, for `g ≥ 2`, flat bundles
  with semisimple monodromy on the fibres of `M_{g,1} → M_g` whose isomonodromic deformations are
  never semistable.
- For `g = 0` the bound `rk E < 2` allows only rank one, where semistability is automatic.

### 5.4 The mixed Hodge structure on the cohomology of a unitary local system

A unitary local system has no rational structure in general (the rank-two orthogonal system of the
character of `ℤ` with `1 ↦ e^{i}` has trace `2 cos 1 ∉ ℚ`), so this section works with real
coefficients. A *real variation of mixed Hodge structure* on a complex manifold is the variation of
mixed Hodge structure of MixedHodgeModulesAndIrregularHodgeTheory §3.1 with a local system of
finite-dimensional real vector spaces in place of rational ones: a finite increasing filtration `W`
by sub-local systems and a finite decreasing filtration `F` of the associated holomorphic bundle by
holomorphic subbundles satisfying Griffiths transversality, such that each `gr^W_k`, with the
induced `F`, is a pure real variation of weight `k` in the sense of ShimuraData §3.1 (`Variation`).
It is *graded-polarizable* when each `gr^W_k` carries a parallel real bilinear form of parity
`(−1)^k` satisfying the Hodge–Riemann relations on every fibre (the real form of ShimuraData §3.3's
rational polarization).

The local monodromy of a polarizable real variation along a punctured disc need not be
quasi-unipotent (Checks), while MixedHodgeModulesAndIrregularHodgeTheory §3.2 constructs the limit
only for rationally polarized variations with quasi-unipotent monodromy, through a finite cover
`t = u^e` on which the monodromy becomes unipotent. Prove the limit theorem without that
hypothesis. Let `L` be a polarizable complex variation of pure Hodge structure of weight `k` on the
punctured disc `Δ^*` (§5.1; the complexification of a polarizable real variation is one), `Ψ` its
space of multivalued flat sections, `T = T_s T_u` its monodromy with `T_s` semisimple and `T_u`
unipotent, `N = (2πi)⁻¹ log T_u`, and `Φ(z)` the Hodge filtration on `Ψ` at the point `t = e^z`,
`Re z < 0`. Then:

- every eigenvalue of `T` has absolute value one, so the residue eigenvalues of the canonical
  extension are real (Sabbah–Schnell, §14 Proposition, proved in §64, SS22 lines 228 and 1366);
- the Hodge bundles extend to holomorphic subbundles of the canonical extension `Ē` with residue
  eigenvalues in `[0, 1)` (*Conventions*), and the limit `F_lim = lim e^{−zN} Φ(z)`, as `Re z → −∞`
  with `Im z` bounded, exists and satisfies `T_s F^p_lim = F^p_lim` and `N F^p_lim ⊂ F^{p−1}_lim`
  (Sabbah–Schnell, §24 Theorem and §28, SS22 lines 407–415 and 476–490);
- `Ψ` carries a mixed Hodge structure with Hodge filtration `F_lim` and weight filtration
  `M_j = W(N)_{j−k}`, the monodromy weight filtration of `N` centred at `k`, for which
  `N : Ψ → Ψ(−1)` and `T_s` are morphisms (Sabbah–Schnell, §39 Theorem, SS22 line 710).

Identifying `Ψ` with the fibre `Ē(0)`, `F_lim` is obtained from the fibre at `0` of the extended
Hodge bundles by passing to the graded pieces of the filtration of `Ψ` by residue eigenvalues: its
part in the generalized eigenspace of the residue for the eigenvalue `α` consists of the components
there of the vectors of the fibre whose components in the generalized eigenspaces for eigenvalues
`< α` vanish (SS22 line 413). It equals that fibre when `T` is unipotent, and differs from it
in general (Checks). For rationally polarized variations with quasi-unipotent monodromy this is the
setting of MixedHodgeModulesAndIrregularHodgeTheory §3.2, which this statement extends without
passing to a cover.

The real variation of mixed Hodge structure is *admissible* when, along every holomorphic map from
a disc sending the punctured disc into the base, the pulled-back variation satisfies: (a) its Hodge
bundles extend to holomorphic subbundles of the canonical extension `Ē` which induce on the
canonical extension of each `gr^W_k` the extended Hodge bundles of the limit theorem; and (b) the
relative monodromy filtration of `N` with respect to the filtration of `Ψ` induced by `W` exists
(LefschetzPencilsAndVanishingCycles §1.5). No quasi-unipotence is assumed; for rational variations
with quasi-unipotent monodromy these are conditions (a) and (b) of
MixedHodgeModulesAndIrregularHodgeTheory §3.3.

Let `V` be a unitary local system on `C°` with a real structure `V_ℝ` (an orthogonal local system with
`V ≅ V_ℝ ⊗ ℂ`; `V ⊕ V^∨` always has one). Prove that `R¹π°_* V_ℝ` underlies an admissible
graded-polarizable real variation of mixed Hodge structure on `M` with weights in `[1, 2]`,
`W₁ = R¹π_* j_* V_ℝ`, and Hodge filtration
`F¹ = im(π_*(E ⊗ Ω¹_{C/M}(log D)) → R¹π°_* V ⊗ O_M)`, where `(E, ∇)` is the canonical logarithmic
extension and `R¹π°_* V ⊗ O_M ≅ R¹π_*(E → E ⊗ Ω¹_{C/M}(log D))` (Landesman–Litt, Theorem 4.1.1,
pp. 24–25; Timmerscheidt, Theorem 7.1; Schnell, Theorem 21.1, Sch19 line 1493). Landesman–Litt
deduce graded-polarizability and admissibility from Saito's mixed Hodge modules through Schnell's
Theorem 21.1, and that theory is stated for quasi-unipotent local monodromy (Sch19 line 520); the route
covers the `V` whose local monodromies along the boundary divisors of a smooth compactification of
`C°` are quasi-unipotent, and for general `V` admissibility is the condition defined above with the
limit theorem of this section (References, *Corrections to the sources*). For an arbitrary
unitary `V`, write `H_V = R¹π°_* V ⊗ O_M`; the flat positive Hermitian form identifies `V^∨` with
the complex conjugate local system `V̄`, and so gives a complex-antilinear isomorphism
`c_V : H_V → H_{V^∨}`. Let `F̄¹ ⊂ H_V` be the preimage of `F¹H_{V^∨}` under `c_V`, the conjugate
Hodge filtration. Prove that `H_V = H^{1,0}_V ⊕ H^{0,1}_V ⊕ H^{1,1}_V` with
`H^{1,0}_V = F¹ ∩ W₁`, `H^{0,1}_V = F̄¹ ∩ W₁` and `H^{1,1}_V = F¹ ∩ F̄¹`, and that `c_V` carries
`H^{i,j}_V` onto `H^{j,i}_{V^∨}` (Landesman–Litt, Lemma 4.1.2, p. 25, LL24 lines 1044–1060, where
the identification `H_V ≅ H_{V^∨}` is this antilinear one). Prove the theorem of the fixed part:
for an admissible graded-polarizable real variation `W` on a smooth quasi-projective variety `X`,
`H⁰(X, W)` carries a real mixed Hodge structure making `H⁰(X, W) ⊗ ℝ → W` a morphism of variations
(Steenbrink–Zucker, 4.19; Peters–Steenbrink, Theorem 14.52); for rational variations whose whole
local system is constant this is MixedHodgeModulesAndIrregularHodgeTheory §5.6, and the real form
for the maximal constant sub-local system is the target here. Prove its variant: if `L` is an
irreducible complex local system with `Hom(L, W_ℂ) ≠ 0`, then `L̃` (`L` if it has a real structure,
`L ⊕ L̄` otherwise) underlies a polarizable real variation and there is a nonzero map of variations
`Q ⊗ L̃ → W` from a nonzero constant real mixed Hodge structure `Q` (Landesman–Litt,
Proposition 4.2.2, p. 26). *Needs:* §§5.1–5.2; ShimuraData §§3.1–3.3;
MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3, 5.6; LefschetzPencilsAndVanishingCycles §1.5;
ComplexComparisonPartII §§C5.2, C5.6; Completed/HodgeStructures (mixed Hodge structures);
gap:local-system-direct-images.

**Checks.**

- The limit theorem without quasi-unipotence: the rank-two real orthogonal local system on `Δ^*`
  whose monodromy is the rotation by the angle `2π√2`, a variation of weight `0` and type `(0, 0)`,
  has `T = T_s` with eigenvalues `exp(±2πi√2)`, of absolute value one and of infinite order, so
  MixedHodgeModulesAndIrregularHodgeTheory §3.2 does not apply. Here `N = 0`, the canonical extension
  has residues `2 − √2 ≈ 0.586` and `√2 − 1 ≈ 0.414` (`exp(−2πi Res)` has eigenvalues
  `exp(±2πi√2)`), `F⁰` is the whole canonical extension and `F¹ = 0`, and the limit is `Ψ`, pure of
  type `(0, 0)`. Such monodromy occurs in this section: on the complement `M` of the zero locus of a
  nonconstant regular function `f` on a level chart `M′`, with `χ` the pullback along `f` of the
  character `1 ↦ exp(2πi√2)` of `π₁(𝔾_m)` (the first Check of §4.5) and `V = π°^* χ`, the system
  `R¹π°_*(V ⊕ V^∨)_ℝ` has, along a disc in `M′` meeting `f = 0` transversally at a smooth point, local
  monodromy with eigenvalues `exp(±2πi√2)`, since the family is smooth over that disc.
- The limit is not the fibre at `0`: for `0 < α < 1`, the complex weight-one variation of rank two
  on `Δ^*` whose Hodge line at `t = e^z` is spanned by `(1, e^{αz})` in a basis of multivalued flat
  sections (Sabbah–Schnell, §190 Example, SS22 line 4053) has `N = 0` and residues `0` and `α`. The
  extended Hodge line has fibre at `0` spanned by `(1, 1)`, which meets both residue eigenspaces in
  zero and so is not `T_s`-stable, while `F¹_lim`, the leading term for the smaller residue, is
  spanned by `(1, 0)`. A definition of the limit as the fibre of the extended bundle would give a
  line that is not the Hodge filtration of a polarized Hodge structure.
- The hypothesis of polarizability is needed: the rank-one local system on `Δ^*` with monodromy `2`
  underlies no polarizable complex variation, since a rank-one variation has a single bidegree and is
  unitary (§5.1, Checks), and `|2| ≠ 1` violates the first item of the limit theorem.
- For `V` trivial of rank one and `n = 0`, `R¹π_* ℝ` is the weight-one variation of the family,
  pure, with `H^{1,1} = 0`.
- The identification of `H_V` with `H_{V^∨}` is antilinear: for `V = V^∨` trivial of rank one on a
  closed fibre of genus two, `c_V` is complex conjugation of `H¹(C, ℂ)` and carries the holomorphic
  differentials `H^{1,0}`, of dimension two, onto the antiholomorphic ones `H^{0,1}`, which meet
  `H^{1,0}` in zero; reading `H_V ≅ H_{V^∨}` as the identity would equate these two subspaces.
- For `V` trivial and `n ≥ 2`, `W₂/W₁` has rank `n − 1`, generated by the residues at the
  punctures, of type `(1, 1)`.
- For a nontrivial unitary character with nontrivial local monodromy at every puncture,
  `j_* V = j_! V` and the weight filtration has `W₁ = W₂`.

### 5.5 The derivative of the period map

In the setting of §5.4 over a contractible base, let `P : B → Gr(rk F¹, rk H)` be the period map of
`F¹ ⊂ H` and `∇̄ : F¹ → (H/F¹) ⊗ Ω¹_B` the map induced by the Gauss–Manin connection. Prove that at
`b ∈ B`, with `C = C_b`, `E = E|_C` and Serre duality, the dual of the derivative is the composite
`H⁰(E ⊗ ω_C(D)) ⊗ H⁰(E^∨ ⊗ ω_C) → H⁰(E ⊗ E^∨ ⊗ ω_C^{⊗2}(D)) → H⁰(ω_C^{⊗2}(D)) → Ω¹_{B,b}` of
multiplication, the trace and the codifferential of the classifying map, and that it is adjoint to
`∇̄_b` (Landesman–Litt, Theorem 5.1.6, p. 29, proved in Appendix A). Prove the rank lemma: for a
semistable parabolic bundle `E⋆` of parabolic degree zero and nonzero `v ∈ H⁰(E ⊗ ω_C(D))`, if
`u ↦ tr(v ⊗ u)` has rank `ρ` on `H⁰(E^∨ ⊗ ω_C)`, then `rk E ≥ g − ρ` (Landesman–Litt,
Proposition 5.2.3, p. 31, by §5.3's parabolic Clifford bound with `c = 1`, `δ = ρ`). *Needs:*
§§5.2–5.4; ComplexKahlerGeometry K5 (Serre duality); ComplexCurveModuli D3.4 (Kodaira–Spencer map).

**Checks.**

- For `V` trivial of rank one and `n = 0` this is the classical identification of the derivative
  of the period map of curves with the multiplication `H⁰(ω) ⊗ H⁰(ω) → H⁰(ω^{⊗2})`.
- For `g = 0` the rank lemma is empty, `g − ρ ≤ 0`.
- For `E = O_C`, `D = 0` and `v` a nonzero holomorphic differential on any curve of genus `g ≥ 1`,
  multiplication by `v` on `H⁰(ω_C)` is injective, a nonzero section of a line bundle on an integral
  curve being a non-zero-divisor, so `ρ = g` and the lemma reads `1 ≥ 0`; no non-hyperelliptic
  hypothesis enters. In rank one generally `ρ = h⁰(E^∨ ⊗ ω_C) = g − 1 − deg E + h⁰(E) ≥ g − 1` by
  Riemann–Roch, as `deg E ≤ 0` for parabolic degree zero, so the lemma `1 ≥ g − ρ` holds
  automatically (with equality for `E` nontrivial of degree zero and `D = 0`); it has content only
  in rank at least two.

### 5.6 The rank bound for sub-local systems

Prove that for a punctured étale-versal family and a unitary local system `V` on `C°`, every
nonzero sub-local system of `R¹π°_* V` has rank at least `2g − 2 rk V` (Landesman–Litt,
Theorem 1.7.1, p. 6, proved in §6.1, pp. 32–33). A nonzero irreducible sub-local system `L`
underlies a variation by §5.4, and after possibly replacing `V` and `L` by their complex conjugates
there is a nonzero `v ∈ L_m ∩ F¹H_m` with `∇̄_m(v)` of rank at most `rk L / 2`
(Landesman–Litt, Lemma 6.1.1); §5.5 then gives `rk V ≥ g − rk L / 2`. In particular
`H⁰(M, R¹π°_* V) = 0` when `g > rk V`. *Needs:* §§2.2, 5.2, 5.4, 5.5;
gap:local-system-direct-images.

**Checks.**

- For `g ≤ rk V` the bound `2g − 2 rk V ≤ 0` is empty.
- For `g = 3` and `V` trivial of rank one, every nonzero sub-local system of `R¹π°_* ℂ` has rank at
  least `4`; for `n = 0` the whole `R¹π_* ℂ` has rank `6` and the symplectic monodromy is
  irreducible, consistent with the bound.
- The bound concerns sub-local systems, not subquotients: for `n ≥ 2` the trivial quotient
  `W₂/W₁` of rank `n − 1` can have rank below `2g − 2`.

### 5.7 Artinian vanishing

Prove that for a punctured étale-versal family, a point `m` with fibre `C°_m`, `A ∈ Art` and a
local system `V` of finite free `A`-modules on `C°` such that `V|_{C°_m} ≅ V₀ ⊗ A` with `V₀` unitary
and `rk_A V < g`, one has `H⁰(M, R¹π°_* V) = 0` (Landesman–Litt, Theorem 6.2.1, p. 34). After
dominant base change §4.5 writes `V ≅ ⊕ Uᵢ ⊗ π°^* Wᵢ`; the `m_A`-adic filtration reduces to
`A = ℂ`, and a nonzero section of `R¹π°_* U ⊗ W` gives a map `W^∨ → R¹π°_* U`, so §5.6 forces
`rk W + 2 rk U ≥ 2g`, hence `rk U · rk W ≥ g`. *Needs:* §§4.5, 5.6;
gap:local-system-direct-images.

**Checks.**

- For `A = ℂ` and `V` unitary this is the case `g > rk V` of §5.6.
- `V = 0` has rank zero and `H⁰ = 0`.
- Pullbacks from the base satisfy the fibre hypothesis automatically: for `A = ℂ` and `V = π°^* W`
  with `W` a local system on `M`, the fibre restriction is trivial, hence unitary and constant, and
  the projection formula gives `R¹π°_* V = R¹π°_* ℂ ⊗ W`, so a nonzero invariant section is a nonzero
  map `W^∨ → R¹π°_* ℂ`. Its image is a nonzero sub-local system of rank at most `rk W`, and
  `rk W < g ≤ 2g − 2` for `g ≥ 2`, which §5.6 for trivial `V` of rank one excludes; for `g = 1`,
  `rk W < 1` forces `W = 0`. At `g = 2`, `rk W = 1` the image would have rank one, below the bound
  `2`. Nothing is asserted when `rk W ≥ g`.

### 5.8 Nonabelian Hodge theory: deformation to variations and rigid systems

Let `X` be a smooth projective variety, `Z ⊂ X` a strict normal crossings divisor and
`X° = X ∖ Z`. Prove that every representation `ρ : π₁(X°) → GL_r(ℂ)` with finite determinant lies in
the same connected component of the representation scheme `R_r(π₁(X°))_{det ρ}` (§1.4) as a
representation underlying a complex PVHS (Landesman–Litt, Theorem 4.3.1, p. 27; Mochizuki,
Theorem 10.5, Moc06 line 4707): one route deforms `ρ` to its semisimplification, takes a tame
pure imaginary harmonic bundle, flows its Higgs field by `t → 0` in the Betti quotient, and lifts
the limit to the same component by §1.4. Prove also that a semisimple `ρ` with finite determinant and
`H¹(X°, ad ρ) = 0` itself underlies a complex PVHS (Landesman–Litt, Lemma 4.3.2, p. 27; Mochizuki,
Lemma 10.13, Moc06 line 4821). *Needs:* §§1.4, 5.1; ComplexComparisonPartII §C5.6;
ComplexKahlerGeometry K4–K5; ArithmeticGaloisRepresentations §1.11; LanglandsParameterStacks §2.2.

**Checks.**

- A unitary `ρ` already underlies a complex PVHS (§5.1), and the deformation may be constant.
- For `X°` a curve of genus `≥ 2` and `ρ` the uniformizing representation lifted to `SL₂`, `ρ`
  underlies a PVHS and is rigid in the sense of the second statement only if `H¹(X°, ad ρ) = 0`,
  which fails since `dim H¹(ad ρ) = 6g − 6`: the second statement does not apply, the first does.
- In rank one the deformation within fixed determinant is constant, since the representation
  scheme with fixed determinant is a point.

### 5.9 Cohomological rigidity and rigidity on versal families

For `X°` as in §5.8, a reductive group `G` over `ℂ` and `ρ : π₁(X°) → G(ℂ)` with quasi-unipotent
local monodromy at infinity, `ρ` is *cohomologically rigid* if `H¹(X, j_{!*} ad ρ) = 0` and *strongly
cohomologically rigid* if `H¹(X°, ad ρ) = 0`; the first notion is defined only under
quasi-unipotent local monodromy (Landesman–Litt, Definitions 8.1.1 and 8.1.4, pp. 38–39; Klevdal–
Patrikis, Definition 1.1). Prove that strong rigidity implies rigidity once local monodromy is
quasi-unipotent (Landesman–Litt, Lemma 8.1.3, p. 39), and that both are preserved by conjugating
the coefficients by an automorphism of `ℂ`. Prove: for a punctured étale-versal family and a
`GL_r` (respectively `PGL_r`) local system `V` on `C°` with `r < √(g + 1)` whose restriction to a
fibre is (respectively is the projectivization of) an irreducible unitary local system, `V` is
strongly cohomologically rigid (Landesman–Litt, Proposition 8.2.1, p. 39): by the Leray sequence it
suffices that `H⁰(M, R¹π°_* ad V) = 0`, which is §5.7 with `A = ℂ` since `rk ad V = r² − 1 < g`, and
`π°_* ad V = 0` by Schur's lemma. *Needs:* §§2.2, 5.7; SchemeAndStackFoundations §2.2
(`leray_spectral_sequence`); Mathlib `Representation.IsIrreducible.bijective_or_eq_zero`;
gap:local-system-direct-images.

**Checks.**

- `r = 1`: `ad V = 0` and every rank-one system is strongly rigid, while the `PGL₁` statement is
  empty.
- The order of steps matters: rigidity in the sense of `j_{!*}` is meaningful only after
  quasi-unipotence of local monodromy is known (Layer 7).
- For `V` with reducible fibre restriction, `π°_* ad V ≠ 0` (the fibre has nonscalar
  endomorphisms), and the proof gives nothing.

### 5.9a Companions over finite fields and the pro-semisimple comparison

Let `X₀` be an irreducible smooth variety over a finite field `k` of characteristic `p`, with a
universal cover, `Π = π₁^ét(X₀)` and `Π_Fr ⊂ Π` the set of positive powers of the geometric Frobenius
elements at closed points of the universal cover (Drinfeld 2018, §1.1, Dri18 line 111). For a
non-archimedean place `λ ∤ p` of `ℚ̄`, the `λ`-adic pro-semisimple completion `Π̂_λ` is the limit of
the semisimple, not necessarily connected, groups `H` over `ℚ̄_λ` carrying a continuous
homomorphism `Π → H(ℚ̄_λ)` with Zariski-dense image; it descends along `ℚ̄ ⊂ ℚ̄_λ` to an object
`Π̂(λ)` of the groupoid `Pro-ss(ℚ̄)` of pro-semisimple groups, whose morphisms are isomorphisms
modulo conjugation by the identity component, and `[G]` is the quotient of `G` by conjugation by
`G°` (Drinfeld 2018, §§1.2.1–1.2.4, Dri18 lines 132–169). Call a continuous semisimple
representation of `Π` on a finite-dimensional `ℚ̄_λ`-vector space *determinant-finite* when each of
its irreducible constituents has finite-order determinant; these form Drinfeld's category `T_λ(X₀)`
(Dri18 lines 1164–1167). Prove:

- *Weights.* The characteristic polynomials `det(1 − t F_x)` of a determinant-finite representation
  at closed points `x` have coefficients in `ℚ̄`, their roots are pure of weight zero, and the roots and
  their inverses are integral over `ℤ[1/p]`, so they are units at every finite place not above `p`
  (Drinfeld 2018, Proposition 1.3.1 and Theorem 5.1.1(i), Dri18 lines 175 and 1168; Drinfeld 2012,
  §1.2, Dri12 lines 33–42; Klevdal–Patrikis, proof of Proposition 6.2(2), KP20 line 728). On curves
  this is gap:curve-companions; in higher dimension it follows from the curve case by a Bertini
  argument (Dri12 line 41).
- *Companions.* For every non-archimedean `λ′ ∤ p` and every determinant-finite `λ`-adic `E` there
  is a determinant-finite `λ′`-adic `E′` with the same Frobenius characteristic polynomials, unique
  up to isomorphism and irreducible exactly when `E` is (Drinfeld 2018, Theorem 5.1.1(ii) and Remark 5.1.2,
  Dri18 lines 1170–1181; Drinfeld 2012, Theorem 1.1, Dri12 line 20, deduced there from the curve case,
  Remark 1.2, Dri12 line 27).
- *The pro-semisimple comparison.* For non-archimedean `λ, λ′ ∤ p` there is a unique isomorphism
  `Π̂(λ) ≅ Π̂(λ′)` in `Pro-ss(ℚ̄)` carrying the map `Π_Fr → [Π̂(λ)](ℚ̄)` to the corresponding map for
  `λ′`, compatibly with the projections onto `Π` (Drinfeld 2018, Theorem 1.4.1, Dri18 line 182;
  Klevdal–Patrikis, Theorem 6.1, KP20 line 666).
- *`G`-valued companions.* Let `G` be a split connected reductive group over `ℤ` and
  `ρ_λ : Π → G(ℚ̄_λ)` continuous with semisimple, not necessarily connected, Zariski closure `G_λ`.
  Choose a reductive group `H` over `ℚ̄` with an isomorphism `H ⊗ ℚ̄_λ ≅ G_λ` and an embedding
  `α : H → G_ℚ̄` whose base change is `G(ℚ̄_λ)`-conjugate to `G_λ ⊂ G`. Then `ρ_λ` induces a surjection
  `Π̂(λ) → H` defined up to `H°`-conjugation (Drinfeld 2018, Proposition 2.3.3, Dri18 line 447), and
  composing with the comparison gives a continuous `ρ_{λ′} : Π → G(ℚ̄_{λ′})` whose Zariski closure is
  `α(H) ⊗ ℚ̄_{λ′}` and with `ρ_λ(F)` and `ρ_{λ′}(F)` having the same image in `[H](ℚ̄)` for every
  `F ∈ Π_Fr` (Klevdal–Patrikis, §6.1, KP20 lines 669–681).

The `G`-valued statement is not a consequence of the companions of `r ∘ ρ_λ` for one faithful
representation `r` of `G`: equal characteristic polynomials in `r` fix neither the image of a
Frobenius element in `[H]` nor the algebraic monodromy group. *Needs:* gap:curve-companions;
AutomorphicLFunctionsAndLocalFactors §§AL.3.10.13–AL.3.10.14; DeligneWeightsAndPurity §§5.5, 8.14,
8.19; InverseGaloisAndArithmeticFundamentalGroups §IG.1.3.

**Checks.**

- `X₀ = Spec k`: `Π = ℤ̂` is abelian, so a Zariski-dense image in a semisimple group forces a finite
  group; hence `Π̂(λ)` is the profinite group `ℤ̂` for every `λ`, the comparison is the identity and
  sends Frobenius to Frobenius, and the companion of a finite-order character is obtained by
  transporting its roots of unity.
- The determinant condition is needed: the rank-one sheaf on `Spec k` with geometric Frobenius `q`
  has Zariski closure `𝔾_m`, a torus, so it lies outside the pro-semisimple completion; its
  Frobenius eigenvalue has weight `2` and normalized slope `v_λ(q)/v_λ(q) = 1` at a place `λ` above
  `p`, while its twist by `q⁻¹`, of finite (trivial) determinant, has weight `0` and slope `0`.
- Equal characteristic polynomials in a faithful representation do not give equal images in `[H]`:
  in `SO(4)`, the rotations `R(π/2) ⊕ R(π/3)` and `R(π/2) ⊕ R(−π/3)` both have characteristic
  polynomial `(x² + 1)(x² − x + 1)` on `ℂ⁴`, but their traces on the self-dual summand `∧²₊ℂ⁴`,
  `1 + 2cos(θ₁ + θ₂)`, are `1 − √3` and `1 + √3`, so they are not `SO(4)`-conjugate.

### 5.10 Integrality of rigid local systems

Prove: let `X°` be a connected smooth quasi-projective complex variety, `G` a split connected
reductive group over `ℤ`, and `ρ : π₁(X°) → G(ℂ)` `G`-irreducible and `G`-cohomologically rigid,
with quasi-unipotent local monodromy and finite image in the maximal abelian quotient of `G`; then
the identity component of the Zariski closure of the image is semisimple and `ρ` is
`G(ℂ)`-conjugate into `G(O_L)` for a number field `L` (Klevdal–Patrikis, Theorem 1.2, KP20 line 62;
Esnault–Groechenig, Theorem 1.1, for `G = GL_n`). Fix a strict normal crossings compactification
`j : X° → X` (ResolutionOfSingularitiesCharacteristicZero §6.2); rigidity is read on `X` as in §5.9.
The route of Esnault–Groechenig and Klevdal–Patrikis has five steps, with these inputs.

1. *Finiteness and models.* Reduce to `G` simple and adjoint through the projectivization
   (Klevdal–Patrikis, Lemma 5.1, KP20 line 407). Fix `h ≥ 1` such that every local monodromy of `ρ`
   is quasi-unipotent of index dividing `h`, the index being the order of the semisimple part. The
   set `S(G, h)` of conjugacy classes of `G`-irreducible, `G`-cohomologically rigid representations
   with local monodromy quasi-unipotent of index dividing `h` is finite, and every member is
   represented over `O_{K,Σ}` for one number field `K` and one finite set `Σ` of finite places:
   rigid classes are isolated points of a finite-type moduli space whose tangent space is
   `H¹(X, j_{!*} 𝔤^{der})` (Klevdal–Patrikis, Proposition 4.7 and Lemma 5.3, KP20 lines 390 and 449;
   §1.4 for `GL_n`). Integrality at the places of `Σ` suffices (Klevdal–Patrikis, Proposition 3.1,
   KP20 line 184).
2. *Spreading out and descent.* Fix a finite place `λ ∉ Σ` above a prime `ℓ`, so that each member
   `ρ_i` takes values in `G(O_{K_λ})` and extends to `π₁^ét(X°)`. Spread `j : X° → X` out over a
   finitely generated subring of `ℂ`, keeping the boundary strict normal crossings, write
   `j_s : X°_s → X_s` for its fibre at a closed point `s` and `s̄` for a geometric point over `s`, and
   choose `s` so that its residue characteristic `p` is prime to `ℓ`, to the places of `Σ`, to the
   orders of the residual images and to `h`. The `ρ_{i,λ}` factor through the prime-to-`p`
   quotient, which §IG.1.3's tame specialization identifies with that of `X°_s̄`; after a finite
   extension of `k(s)` each descends to `π₁^ét(X°_s)` with the same Zariski closure `G_{i,λ}` as
   on the geometric fibre (Klevdal–Patrikis, Proposition 5.6, KP20 line 567), and `G_{i,λ}°` is
   semisimple, being also the identity component of the geometric monodromy group of a pure lisse
   sheaf (Klevdal–Patrikis, Corollary 5.7, KP20 line 632; DeligneWeightsAndPurity §§8.14, 8.19).
3. *Companions.* For every finite place `λ′ ∤ p`, in particular those above `Σ`, §5.9a gives
   companions `ρ_{i,λ′,s}` with Zariski closure the `λ′`-form of the same `ℚ̄`-group and the same
   Frobenius images in `[G_i]`. On a curve through the boundary meeting each component
   transversally, a faithful representation of `G_i` turns the two into compatible lisse sheaves, and
   gap:curve-companions transfers tameness and the index of quasi-unipotence, tameness being
   detected on such curves (Klevdal–Patrikis, Proposition 6.2(1), (4), KP20 line 682).
4. *Rigidity of the companions.* The adjoint local systems of `ρ_{i,λ,s}` and `ρ_{i,λ′,s}` are
   determinant-finite because `G_{i,λ}` is semisimple, hence pure of weight zero (§5.9a), tame and
   compatible, so their `L`-functions agree. For a tame lisse sheaf `A` on the open `X°_s`, pure of
   weight zero, the natural map `H¹(X_s̄, j_{s̄,!*} A) → H¹(X°_s̄, A)` (intermediate extension of the
   sheaf placed in degree zero, unshifted, as in §5.9) is injective with cokernel of weights `≥ 2`,
   and its image is the weight-one part of `⊕_i H^i(X°_s̄, A)`, which lies in degree one because
   `H^i(X°_s̄, A)` has weights `≥ i`. The cokernel is a boundary term: on the complement `U_s` of the
   singular locus of the boundary, `j_{s,!*} A` restricts to `a_{s,*} A` for `a_s : X°_s → U_s`, and
   `R¹a_{s̄,*} A` has weights `≥ 2`, as seen on curves where `A` is tame (Esnault–Groechenig,
   Lemma 3.4, EG18 line 410, through DeligneWeightsAndPurity §7.8 and duality). Hence the companions
   are again `G`-cohomologically rigid, `G`-irreducible and pairwise non-conjugate (Klevdal–Patrikis,
   Proposition 6.2(2)–(3)).
5. *Return to `ℂ`.* Pull the companions back along the tame specialization surjection
   (gap:tame-specialization) and transport them by the Betti–étale comparison (ComplexComparisonPartII
   §C6.3, `artinComparison`): they are `N = #S(G, h)` distinct members of `S(G, h)` with values in
   `G(ℤ̄_{λ′})`, hence all of them, so every member is integral at `λ′` (Klevdal–Patrikis, §6.2,
   KP20 line 761).

*Needs:* §§1.4, 5.9, 5.9a; gap:curve-companions; gap:tame-specialization;
InverseGaloisAndArithmeticFundamentalGroups §IG.1.3; DeligneWeightsAndPurity §§7.8, 8.14, 8.19;
ComplexComparisonPartII §C6.3; ArithmeticGaloisRepresentations §1.11; LanglandsParameterStacks
§2.2; ResolutionOfSingularitiesCharacteristicZero §6.2; SchemeAndStackFoundations Layer 0.

**Checks.**

- `G = GL₁`: a rank-one system with finite determinant has finite image and is integral over a
  cyclotomic ring.
- For `G = PGL_r` the abelianization condition is vacuous, since `PGL_r` has trivial maximal abelian
  quotient.
- The hypotheses cannot all be dropped: on `𝔾_m` the character with monodromy `2` is
  `GL₁`-irreducible and rigid (the derived Lie algebra of `GL₁` is zero) but violates both
  quasi-unipotence and the finite-abelianization condition, and it is not integral since `1/2` is
  not an algebraic integer.
- Quasi-unipotence is what makes the descent of step 2 possible: the arithmetic Frobenius of
  `k(s)`, with `q = #k(s)`, acts on the tame inertia `lim μ_m` of `𝔾_m` at `0` by the `q`-th power,
  so it moves the specialization of the character with monodromy `2` to the character with
  monodromy `2^q ≠ 2`, and that specialization descends over no finite extension of `k(s)`; a
  character of finite order `m`, `p ∤ m`, goes to its `q`-th power and descends once
  `q ≡ 1 (mod m)`.
- The coefficient sheaf of step 4 lives on the open variety: on `X°_s = 𝔾_m` over `k(s)` of odd
  characteristic, the quadratic Kummer sheaf has inertia `−1` at `0` and `∞`, so it extends to no
  lisse sheaf on `ℙ¹`; its open cohomology vanishes in every degree and `H¹(ℙ¹_s̄, j_{!*} A) = 0`,
  so the comparison reads `0 = 0`. On an elliptic curve `E` minus two points with `A` trivial,
  `H¹` of the open curve has dimension `3` (weights `1, 1, 2`), and its weight-one part has
  dimension `2 = dim H¹(E_s̄, ℚ̄_{ℓ′})`: the comparison is with the compactification, not with the
  whole open `H¹`.

### 5.11 Unitarity of low-rank variations on analytically general curves

Prove: for an `n`-pointed hyperbolic curve of genus `g` and a flat bundle `(E, ∇)` with regular
singularities and `rk E < 2√(g + 1)`, if an isomonodromic deformation of `(E, ∇)` to an analytically
general nearby curve underlies a complex PVHS, then `(E, ∇)` has unitary monodromy (Landesman–Litt
2022, Theorem 1.2.12, pp. 4–5). Route: the statement depends only on the local system, so replace
`(E, ∇)` by its parabolic Deligne extension, whose isomonodromic deformations are again parabolic
Deligne extensions; by the parabolic Deligne extension case of §5.3 the deformed extension is
semistable on an analytically general nearby curve, where it underlies a complex PVHS, and the
third item of §5.2 makes its monodromy, which is that of `(E, ∇)`, unitary. Only the canonical
lattice with its full parabolic structure enters, never a coarsened structure or another lattice.
Prove that a representation `ρ : Γ → GL_m(O_K)`, `K` a number field, whose scalar extension
`ρ ⊗_{O_K, ι} ℂ` is unitary for every field embedding `ι : K → ℂ`, the real embeddings included, has
finite image, since its image is discrete in a compact group (Landesman–Litt 2022, Lemma 7.2.1,
p. 51, LL22 lines 1908–1911). Deduce: on an analytically very general
hyperbolic pointed curve of genus `g`, an `O_K`-local system with infinite monodromy all of whose
complex conjugates underlie complex PVHS has rank at least `2√(g + 1)` (Landesman–Litt 2022,
Theorem 1.2.5, p. 3), and a local system of geometric origin with infinite monodromy has dimension at
least `2√(g + 1)` (Landesman–Litt 2022, Corollary 1.2.7, p. 3). *Needs:* §§2.3, 5.1–5.3.

**Checks.**

- A unitary flat bundle satisfies the conclusion trivially; the content is for non-unitary
  variations.
- Unitarity at one embedding is not enough: the Salem polynomial `x⁴ − x³ − x² − x + 1` has two
  real roots `λ ≈ 1.722`, `λ⁻¹` and two roots on the unit circle (with `y = x + 1/x` it becomes
  `y² − y − 3 = 0`, whose roots are about `2.30` and `−1.30`); the character `ℤ → O_K^×`, `1 ↦ λ`,
  for `K = ℚ(λ)` is integral, unitary at the pair of non-real embeddings (where `|λ′| = 1`) and of
  infinite image, and is not unitary at the two real embeddings (`λ ≈ 1.722`, `λ⁻¹ ≈ 0.581`), so the
  hypothesis of the finiteness criterion fails there, as it must.
- `g = 0`: the bound `2√1 = 2` forces rank one, where variations are unitary.

### Examples

- For the universal curve over a level cover of `M_{g,1}` and `V` trivial of rank one, §5.6 says
  that `R¹π_* ℂ`, the standard symplectic local system of rank `2g`, has no nonzero sub-local
  system of rank below `2g − 2`.
- For `ρ` an irreducible unitary MCG-finite representation of rank `r` with `r² < g + 1`, realized
  on a versal family by §4.3, §5.9 makes the realization strongly rigid, §5.8 makes every
  `Aut(ℂ)`-conjugate a PVHS, and §5.11 makes it unitary: the chain of Layer 7.

### Dependencies

Layers 1–2 and 4; ComplexComparisonPartII §§C5.2, C5.6, C6.3 and gap:local-system-direct-images;
Completed/HodgeStructures; ShimuraData §§3.1–3.3; MixedHodgeModulesAndIrregularHodgeTheory
§§3.1–3.3, 5.6; LefschetzPencilsAndVanishingCycles §1.5; ComplexKahlerGeometry K4–K5;
ComplexCurveModuli D3.4;
ArithmeticGaloisRepresentations §1.11; LanglandsParameterStacks §2.2; SchemeAndStackFoundations
§2.2; ResolutionOfSingularitiesCharacteristicZero §6.2; AutomorphicLFunctionsAndLocalFactors
§§AL.3.10.13–AL.3.10.14 and gap:curve-companions; DeligneWeightsAndPurity §§5.5, 7.8, 8.14, 8.19;
InverseGaloisAndArithmeticFundamentalGroups §IG.1.3 and gap:tame-specialization.

## Layer 6: higher Prym representations and the Putman–Wieland property

This layer defines the action of the stabilizer of a finite quotient of a surface group on the
cohomology of the open cover and the homology of the compactified cover, proves the higher Prym
rank bound from Layer 5, and deduces the Putman–Wieland property for groups all of whose
irreducible representations have dimension `< g`, in particular for groups of order `< g²`.

### 6.1 Higher Prym actions

Let `φ : π₁(Σ_{g,b,p}, v₀) → H` be a surjection onto a finite group, `K = ker φ`, and
`Σ_{g′,b′,p′} → Σ_{g,b,p}` the corresponding Galois cover with compactification `Σ_{g′}`. Let
`Γ ⊂ PMod(g, b, p + 1)` be the finite-index subgroup of classes `γ` with `φ ∘ γ = c_h ∘ φ` for some
`h ∈ H` (preservation of `φ` up to conjugacy in `H`). Then `Γ` preserves `K` and acts on
`H¹(Σ_{g′,b′,p′}, ℂ) = Hom(K, ℂ)` by inverse pullback, on `H₁(Σ_{g′,b′,p′}, ℂ) = K^{ab} ⊗ ℂ`, and,
by filling the punctures and boundary of the cover, on `V_K = H₁(Σ_{g′}, ℂ)`, the higher Prym
representation; it normalizes the deck action of `H` up to inner automorphisms, so it preserves the
`σ`-isotypic subspaces `σ ⊗ Hom_H(σ, −)` of each (Landesman–Litt, Notation 7.1.1, p. 35). In the
algebraic presentation of §0.2, for an arbitrary group `H` and an arbitrary homomorphism
`φ : surfaceGroup g n → H`, define `prymStabilizer φ` as the elements of `pureMappingClassAut g n`
with `φ ∘ γ = c_h ∘ φ` for some `h ∈ H`, and `compactPrymCohomology φ` as the subspace of
`Hom(ker φ, ℂ)` of homomorphisms vanishing on every element of `ker φ` conjugate in the surface
group to a power of a peripheral loop. When `H` is finite and `φ` is surjective,
`compactPrymCohomology φ` is `H¹(Σ_{g′}, ℂ)` of the compactified cover, since those elements are
exactly the powers of the loops around the punctures of the cover, and the image of `Γ` in `Aut(π₁)`
lies in `prymStabilizer φ` for `n = b + p` (§§0.2, 0.4); for an infinite quotient there is no
compactified cover of finite type and the subspace is only the algebraic object. The surface group
acts on `Hom(ker φ, ℂ)` by conjugation, `(x · f)(k) = f(x⁻¹ k x)` (Mathlib's `MulAut.conjNormal`),
and `ker φ` acts trivially because `f` is additive on `ker φ`; for finite `H` and surjective `φ`
this is, through the identification of `H` with the deck group, the left action of the deck group on
`H¹(Σ_{g′,0,n′}, ℂ) = Hom(ker φ, ℂ)`. For a representation `σ` of `H` on `ℂ^d`, define
`prymIsotypic φ σ` as the sum of the images of all linear maps `T : ℂ^d → Hom(ker φ, ℂ)` with
`T(σ(φ(x)) v)(k) = T(v)(x⁻¹ k x)` for all `x`, `v` and `k ∈ ker φ`, the intertwiners from `σ ∘ φ` to
the conjugation action. *Needs:* §§0.1–0.4; AlgebraicTopology Layers 2, 5 and 6; Mathlib
`isotypicComponent`, `MulAut.conjNormal`; Tau Ceti `TauCeti.LocalCoefficientSystem`.

- Restricting to a finite-index `Γ′ ⊂ Γ` preserves all actions and isotypic subspaces.
- The isotypic subspace is the image of `σ ⊗ Hom_H(σ, V)` under evaluation, not the multiplicity
  space alone.
- Open-to-compact homology and compact-to-open cohomology maps are equivariant for the chosen
  actions. Two identifications are kept apart. Evaluation identifies `H¹(Σ_{g′}, ℂ)` with the dual
  of `H₁(Σ_{g′}, ℂ)`; the actions are contragredient, and the `σ`-component of `H¹` is the dual of
  the `σ^∨`-component of `H₁`. Compact Poincaré duality `H¹(Σ_{g′}, ℂ) ≅ H₁(Σ_{g′}, ℂ)`, cap product
  with the fundamental class, is equivariant for orientation-preserving classes and for the deck
  group (inverse pullback on `H¹`, push-forward on `H₁`), and carries the `σ`-component of `H¹` onto
  the `σ`-component of `H₁`: it preserves labels.
- `compactPrymCohomology φ` is a `ℂ`-subspace of `Hom(ker φ, ℂ)` stable under `prymStabilizer φ`.
- `prymIsotypic φ σ` is stable under the conjugation action and under `prymStabilizer φ`: for
  `φ ∘ γ = c_h ∘ φ`, transport by `γ` carries intertwiners from `σ` to intertwiners from `σ ∘ c_h`,
  which is isomorphic to `σ` through `σ(h)`. It depends only on the isomorphism class of `σ`.
- For irreducible `σ` it is the sum of the subrepresentations isomorphic to `σ`, the `σ`-isotypic
  component in the sense of Mathlib's `isotypicComponent` for the group-algebra module, since the
  image of an intertwiner from an irreducible representation is zero or isomorphic to it.
- For finite `H` and surjective `φ`, `Hom(ker φ, ℂ)` is the direct sum of the `prymIsotypic φ σ`
  over representatives `σ` of the irreducible representations of `H` (Maschke), and
  `compactPrymCohomology φ`, being stable under the conjugation action, is the direct sum of its
  intersections with them.

**Checks.**

- `H = 1`: `V_K = H₁(Σ_g, ℂ)` has dimension `2g`, and for `b = p = 0` the action of `PMod(g, 1)`
  is the symplectic action of `Mod(g)` pulled back along the forgetful map.
- The identity cover of the thrice-punctured sphere has open `H¹` of dimension two and compact
  `H₁` of dimension zero, so the two carriers must differ.
- If `V = σ ⊕ σ`, its `σ`-isotypic subspace has dimension `2 dim σ` while `Hom_H(σ, V)` has
  dimension two.
- For the trivial quotient `H = 1`, `prymStabilizer φ` is all of `pureMappingClassAut g n`, with
  `h = 1`.
- Every inner automorphism `c_x` lies in `prymStabilizer φ`, with `h = φ(x)`:
  `φ(x y x⁻¹) = φ(x) φ(y) φ(x)⁻¹`.
- The stabilizer is not the subgroup preserving `ker φ`: on the closed torus let
  `φ : ℤ² → ℤ/3` be `(a, b) ↦ a mod 3`. The automorphism `−I` (in `SL₂(ℤ)`, so orientation-preserving)
  preserves `ker φ = 3ℤ × ℤ` but sends `φ` to `−φ`, and as `ℤ/3` is abelian every `c_h` is the
  identity, so `−I` would need `2 = 1` in `ℤ/3`; it is not in `prymStabilizer φ`.
- For an infinite quotient the algebraic subspace is not the cohomology of a compact surface: for
  `g = 2`, `n = 0` and `φ : surfaceGroup 2 0 → ℤ` sending `a₁` to `1` and the other generators to `0`,
  `ker φ` is the fundamental group of a noncompact infinite cyclic cover, free of infinite rank, and
  `compactPrymCohomology φ = Hom(ker φ, ℂ)` is infinite-dimensional; for the identity quotient
  (`H = 1`) of the same surface it is `H¹(Σ₂, ℂ)`, of dimension four.
- `prymIsotypic` for the trivial quotient: for `H = 1` and `σ` trivial of dimension one every
  `f ∈ Hom(π₁, ℂ)` lies in `prymIsotypic φ σ`, because `f(x⁻¹ k x) = f(k)` for a homomorphism to an
  abelian group, so the subspace has dimension `2g + n − 1` for `n ≥ 1` and `2g` for `n = 0`; for
  the zero representation on `ℂ⁰`, which is not irreducible, it is `0`.
- Unramified double covers of genus two: for `g = 2`, `n = 0` and a surjection `φ` onto `ℤ/2`, the
  cover has Euler characteristic `2 · (−2) = −4`, hence genus `3`, and `Hom(ker φ, ℂ) = H¹(Σ₃, ℂ)`
  has dimension `6`. The trivial part `prymIsotypic φ 1` consists of the restrictions of
  homomorphisms `π₁(Σ₂) → ℂ`, which restriction maps injectively (transfer), so it has dimension
  `4`, and the sign part, its complement, has dimension `2`; both are at least `2g − 2 = 2`, as
  §6.5 requires.
- On the torus the conjugation action is trivial, the group being abelian: for
  `φ : ℤ² → ℤ/2`, `(a, b) ↦ a mod 2`, the trivial part of `Hom(2ℤ × ℤ, ℂ) ≅ ℂ²` is everything and
  the sign part is `0`, matching the fact that the deck transformation of the double cover, a
  translation, acts trivially on `H¹`; a convention in which the nontrivial deck transformation
  acted by `−1` on the classes not pulled back from the base would wrongly see a sign part here,
  although every class of `Hom(2ℤ × ℤ, ℂ)` is a restriction from `ℤ²`.
- For the reducible `σ = 1 ⊕ 1` on `ℂ²` the subspace is again the trivial part, the sum of the
  images of maps from the constituents: the reading as the `σ`-isotypic component needs `σ`
  irreducible, as in `higherPrym_rank_bound`.
- Poincaré duality preserves labels: an automorphism of order three of an elliptic curve, the
  compactified cyclic triple cover of the thrice-punctured sphere, acts on `H₁` by
  `A = [[0, −1], [1, −1]]` (`A³ = I`, eigenvalues `ζ₃`, `ζ₃⁻¹`) and on `H¹` by
  `A^{−T} = [[−1, −1], [1, 0]]`; with `J = [[0, 1], [−1, 0]]` one has
  `J⁻¹A^{−T} = A J⁻¹ = [[−1, 0], [−1, −1]]`, so the duality `J⁻¹` sends a `ζ₃`-eigenvector of `H¹` to
  a `ζ₃`-eigenvector of `H₁`, not to a `ζ₃⁻¹`-eigenvector. Dimensions agree either way, as
  `dim σ = dim σ^∨`.

### 6.2 The Putman–Wieland property

For a finite group `H` and `g, b, p ≥ 0`, `PW(H, g, b, p)` asserts that for every surjection
`φ : π₁(Σ_{g,b,p}, v₀) → H` every nonzero vector of `V_K` has infinite orbit under `Γ`
(Landesman–Litt, Definition 7.1.2, p. 35). Prove that it is equivalent to `V_K^{Γ′} = 0` for every
`φ` and every finite-index `Γ′ ⊂ Γ`, that it holds vacuously when no surjection exists, and that
the `ℚ` and `ℂ` formulations agree by base change of the fixed-vector equations (Landesman–Litt,
Remark 7.1.4). *Needs:* §6.1.

**Checks.**

- If every compactified cover has genus zero, `V_K = 0` and the property holds.
- A single nonzero vector fixed by a finite-index `Γ′` gives a finite `Γ`-orbit and refutes the
  property.
- The property can fail: Marković's counterexample in genus two (Landesman–Litt, Remark 7.1.5).

### 6.3 Reductions for the higher Prym rank bound

This section provides the two reductions that §6.5 consumes: boundary circles replaced by
punctures (§6.3), and the isotypic cover cohomology identified with family monodromy (§6.4).

Prove that shrinking boundary circles to punctures gives a `Γ′`-equivariant isomorphism
`H¹(Σ_{g′,b′,p′}, ℂ)_σ ≅ H¹(Σ_{g′,0,b′+p′}, ℂ)_σ` of covers of the same genus `g′`, and that for a
finite-index `Γ′ ⊂ Γ` its image `Γ″` in `PMod(g, 0, b + p + 1)` has finite index and the same
invariant subspaces (Landesman–Litt, Lemma 7.2.5, p. 36, where the target cover is printed with genus
`g`). Boundary twists act trivially on cohomology by §0.4. *Needs:* §§0.4, 6.1; AlgebraicTopology
Layer 2.

**Checks.**

- For `b = 0` the reduction is the identity.
- Both sides have genus `g′`; a target of genus `g` would have the wrong first Betti number.

**6.4 Cover cohomology and family monodromy.**
For `b = 0`, `n = p` and `g ≥ 1`, prove: after dominant étale refinement of a versal family of
`φ`-covers `X° → C° → M` (InverseGaloisAndArithmeticFundamentalGroups §IG.5.4, *Versal families
with specified topological monodromy*: chart, cover, monodromy and section),
`f_* ℂ ≅ ⊕_σ U_σ ⊗ π°^* W_σ` with `U_σ` unitary of finite image and
rank `dim σ` and `W_σ` constant, by §4.5 with `A = ℂ` and §4.4; the action of `π₁(M)` on the stalk of
`R¹π°_* U_σ ⊗ W_σ` is identified with the action of its image in `Γ` on `H¹(Σ_{g′,0,p′}, ℂ)_σ`, with
the deck and dual conventions of §6.1; compact `H¹` injects equivariantly into open `H¹`, and
compact Poincaré duality transfers subspace bounds to compact `H₁` (Landesman–Litt, proof of
Theorem 7.2.1, pp. 37–38). Refining to a finite étale cover of the base with `π₁`-image in a given
finite-index `Γ′` makes the comparison `Γ′`-equivariant. *Needs:* §§4.4, 4.5, 6.1;
InverseGaloisAndArithmeticFundamentalGroups §IG.5.4; AlgebraicTopology Layer 6;
gap:local-system-direct-images.

**Checks.**

- `H = 1`: `f_* ℂ = ℂ`, and the identification is `R¹π°_* ℂ` with the open-surface `H¹`.
- Without refining to `Γ′`, only the action of the image of `π₁(M)` is controlled, which is why the
  base is refined to a finite étale cover with image in `Γ′`.

### 6.5 The higher Prym rank bound and its consequences

This section proves the higher Prym rank bound and deduces from it the Putman–Wieland theorems and
infinite orbits on small isotypic components; §9.2 consumes §6.5, and §§6.5–6.7 are end theorems.

Prove that for every finite quotient `φ` of `π₁(Σ_{g,b,p})`, every irreducible complex `H`-module
`σ` and every finite-index `Γ′ ⊂ Γ`, every nonzero `Γ′`-stable subspace of the `σ`-isotypic
component of `H¹(Σ_{g′,b′,p′}, ℂ)` has dimension at least `2g − 2 dim σ`, and the same holds for the
`σ`-isotypic component of `H₁(Σ_{g′}, ℂ)`. Nothing is asserted for subquotients of the open
cohomology, which need not be semisimple (Landesman–Litt, Theorem 7.2.1 and Remark 7.2.2, p. 36).
For `g ≤ 1` the bound is not positive; otherwise reduce to `b = 0` by §6.3, refine by §6.4, and
apply §5.6 to `U_σ`. In the algebraic form of the Lean file, `higherPrym_rank_bound`: for all
`g, n ≥ 0`, a finite group `H`, a surjection `φ : surfaceGroup g n → H`, an irreducible
representation `σ` of `H` on `ℂ^d`, a subgroup `Γ′ ≤ prymStabilizer φ` of finite relative index and
a nonzero subspace `W ≤ prymIsotypic φ σ` such that for `γ ∈ Γ′` and `f ∈ W` the class
`k′ ↦ f(γ⁻¹ k′)` again lies in `W`, one has `2g ≤ dim W + 2d`. This is the statement for the open
cohomology `Hom(ker φ, ℂ) = H¹(Σ_{g′,0,n′}, ℂ)` with `b = 0` and `p = n`; it follows from the
topological form because the image of `Γ` lies in `prymStabilizer φ` (§6.1), so `Γ′ ∩ Γ` has finite
index in `Γ` and `W` is `Γ′ ∩ Γ`-stable. Its case of a line `W = ℂ f` with `f` in
`compactPrymCohomology φ` is §6.8, through the label-preserving duality of §6.1. *Needs:* §§5.6,
6.1, 6.3, 6.4.

**Checks.**

- `g = 3`, `dim σ = 1`: every nonzero invariant subspace has dimension at least `4`.
- `H = 1`, `σ` trivial, `b = p = 0`: every nonzero `Γ′`-stable subspace of `H₁(Σ_g, ℂ)` has
  dimension at least `2g − 2`; the whole space has dimension `2g` and finite-index subgroups of
  `Sp_{2g}(ℤ)` act irreducibly, consistent with the bound.
- For `p ≥ 2` the trivial quotient of open `H¹` coming from the punctures has dimension `p − 1`,
  which may be below `2g − 2`: the restriction to subrepresentations is necessary. For `H = 1` and
  `g ≥ 1` no `Γ′`-stable complement of the compact part realizes it as a subspace: pushing the
  `j`-th puncture along a loop `α` acts on `H₁(Σ_{g,n})` by `x ↦ x ± î(α, x)[cⱼ]`, the intersection
  number being computed in the punctured surface, where `[cⱼ]` is in its radical; a power of this
  push lies in `Γ′`, so a `Γ′`-fixed class in open `H¹` vanishes on every `cⱼ` and lies in the
  compact part. For `g = 0` the intersection form vanishes and nothing is excluded, matching the
  empty bound.
- The Lean form avoids truncated subtraction: for `g = 1` and `d = 1` it reads `2 ≤ dim W + 2`,
  true for every `W`, matching the empty bound `2g − 2d = 0`; for `g = 3`, `d = 1` it gives
  `dim W ≥ 4`.

**6.6 Putman–Wieland for groups of small degree.**
Prove that if every irreducible complex representation of a finite group `H` has dimension `< g`,
then `PW(H, g, b, p)` holds for all `b, p ≥ 0`: a fixed vector of a finite-index `Γ′` projects to a
nonzero fixed line in some isotypic component, contradicting `2g − 2 dim σ ≥ 2` (Landesman–Litt,
Corollary 7.2.3, p. 36, LL24 line 1481). In the algebraic form of the Lean file,
`putmanWieland_of_irreducible_dim_lt`: for all `g, n ≥ 0`, a finite group `H` such that every
irreducible representation of `H` on `Fin d → ℂ` has `d < g`, a surjection
`φ : surfaceGroup g n → H`, a subgroup `Γ′ ≤ prymStabilizer φ` of finite relative index and an
element of `compactPrymCohomology φ` fixed by `Γ′`, that element is zero. Every finite-dimensional
irreducible complex representation of `H` is isomorphic to one on some `Fin d → ℂ`, and every
irreducible one is finite-dimensional since `H` is finite, so the hypothesis is the one of the
source; the algebraic form follows from the topological one as in §6.7. *Needs:* §§6.1, 6.2, 6.5;
RepresentationTheory/CharacterTheory Layer 2; Mathlib `Representation.IsIrreducible`;
AlgebraicTopology Layer 6.

**Checks.**

- For abelian `H` the hypothesis is `g ≥ 2`.
- For `H = S₃`, which has an irreducible of dimension two, the hypothesis requires `g ≥ 3`.
- For `g ≤ 1` the trivial representation on `Fin 1 → ℂ` is irreducible with `d = 1 ≥ g`, so the
  hypothesis fails and nothing is asserted; the zero representation on `Fin 0 → ℂ` is not
  irreducible, so it imposes no condition.
- `H = ℤ/5`, `g = 2`: every irreducible has `d = 1 < 2`, so §6.6 applies although `#H = 5 ≥ 4`
  puts the group outside §6.7.

**6.7 Putman–Wieland for groups of small order.**
Prove that for a finite group `H` with `#H < g²`, `PW(H, g, b, p)` holds for all `b, p ≥ 0`, since
`#H = Σ_σ (dim σ)²` forces `dim σ < g`, so that §6.6 applies (Landesman–Litt, Corollary 7.2.4 and
Theorem 1.4.1, pp. 4 and 36; `TauCeti.sum_characterDegree_sq_eq_card`); in the Lean file it follows
from `putmanWieland_of_irreducible_dim_lt` and the degree-square identity. In the algebraic form of
the Lean file, `putmanWieland_of_card_lt`: for all `g, n ≥ 0`, a finite group `H` with `#H < g²`, a surjection
`φ : surfaceGroup g n → H`, a subgroup `Γ′ ≤ prymStabilizer φ` of finite relative index and an
element of `compactPrymCohomology φ` fixed by `Γ′`, that element is zero. It follows from the
topological form: the image of `Γ` lies in `prymStabilizer φ` (§6.1), so `Γ′ ∩ Γ` has finite index
in `Γ`, and orientation-preserving Poincaré duality turns a fixed class into a fixed vector of
`V_K`. *Needs:* §§6.1, 6.6; Tau Ceti `TauCeti.sum_characterDegree_sq_eq_card`; AlgebraicTopology
Layer 6.

**Checks.**

- For cyclic `H` and `g ≥ 2`, §6.6 gives the property even when `#H ≥ g²`.
- `H = 1`, `g = 2`: `#H = 1 < 4` and the statement says no nonzero class of `H¹(Σ₂, ℂ)` is fixed by
  a finite-index subgroup of the automorphism group; the strict inequality is not extended to
  `#H = g²`.
- `g = 0` or `1`: `#H < g²` has no solution and the statement is vacuous.

**6.8 Infinite orbits on small isotypic components.**
Prove that for an irreducible `H`-module `σ` with `dim σ < g`, every nonzero vector of the
`σ`-isotypic component of `H₁(Σ_{g′}, ℂ)` has infinite `Γ`-orbit, with no condition on the other
irreducibles of `H` (Landesman–Litt, Theorem 1.4.2, p. 5): the line spanned by a vector with finite
orbit is stable under a finite-index subgroup, and §6.5 gives `1 ≥ 2g − 2 dim σ ≥ 2`. In the Lean
file this is `higherPrym_rank_bound` for the line `W = ℂ f` of a class `f` of
`compactPrymCohomology φ ⊓ prymIsotypic φ σ`. *Needs:* §6.5.

**Checks.**

- For cyclic `H` and `g ≥ 2` every isotypic component satisfies the criterion, whatever `#H`.
- The hypothesis is `dim σ < g`: at `dim σ = g` the bound `2g − 2 dim σ = 0` gives nothing.

### Examples

- `H = ℤ/2`, `g ≥ 2`: no nonzero class in `H₁` of a connected double cover has finite orbit, by
  §6.7 since `2 < g²`.
- For the trivial cover (`H = 1`) and `g ≥ 2`, §6.7 recovers the absence of finite orbits of
  `Sp_{2g}(ℤ)` on nonzero vectors of `ℂ^{2g}`.

### Dependencies

Layers 0, 4 and 5; InverseGaloisAndArithmeticFundamentalGroups §IG.5.4; AlgebraicTopology Layers 2,
5 and 6; RepresentationTheory/CharacterTheory Layer 2; Mathlib `isotypicComponent`,
`MulAut.conjNormal`; Tau Ceti `TauCeti.sum_characterDegree_sq_eq_card`;
gap:local-system-direct-images.

## Layer 7: unitary rigidity, integrality and the unitary case

This layer proves quasi-unipotence of multitwists in finite-index subgroups of mapping class groups
and of boundary monodromy on good compactifications of versal total spaces, deduces projective and
linear integrality of irreducible unitary MCG-finite representations of low rank, unitarity of all
their Galois conjugates, and finite image in the unitary case.

### 7.1 Quasi-unipotent local monodromy on versal total spaces

For `g ≥ 3`, linear and projective local systems on a scheme `C°` finite étale over `M_{g,n+1}` have
quasi-unipotent local monodromy along a good compactification of `C°`; §7.4 consumes §7.3.

Prove: let `S` be a connected oriented surface of finite type and genus `g ≥ 3`, `Γ ⊂ Mod(S)` of
finite index and `r ≥ 1`. There is `k = k(Γ, r) ≥ 1` such that for every `ρ : Γ → GL_r(ℂ)` and every
multitwist `μ ∈ Γ` about pairwise disjoint simple closed curves, `ρ(μ)^k` is unipotent
(Aramayona–Souto, Proposition 2.4 and Lemma 2.5, pp. 10–11; Landesman–Litt, Proposition 8.3.2,
p. 40). Since the twists commute it suffices to treat `T_γ^m ∈ Γ`. Cutting along `γ`, some
complementary component `Z` has genus `≥ 2` and a boundary circle `η` with `ι(T_η) = T_γ` under the
inclusion homomorphism. Induce `ρ ∘ ι` from the finite-index preimage of `Γ` to `PMod(Z)`
(`Representation.ind`); `ρ ∘ ι` is a direct summand of the restriction of the induced
representation (the identity double coset in Mackey's formula). `T_η` is central in `PMod(Z)`, so
its generalized eigenspaces are `PMod(Z)`-stable and the determinant on each is a character of
`PMod(Z)`, of order dividing `10` by §0.5; hence the eigenvalues of `ρ(T_γ^m)` are roots of unity
of bounded order. *Needs:* §§0.3, 0.4, 0.5; MordellLawrenceVenkatesh §§5.7, 5.10 (cutting along a
curve, change of coordinates); GeometricTopology §1.7.2 (twists of a cut surface are twists of the
surface); Mathlib `Representation.ind`.

**Checks.**

- Under the symplectic representation of `Mod(Σ_g)`, `g ≥ 3`, every Dehn twist maps to a
  transvection (§0.3), which is unipotent: `k = 1` there.
- The genus bound is needed: `PMod(0, 4)` is free of rank two on two Dehn twists, and the
  character sending one of them to `2` is not quasi-unipotent.
- The restriction of an induced representation contains `ρ` as a summand but need not be a sum of
  copies of `ρ`: for `A₃ ⊂ S₃` and `ρ` a nontrivial character `ω`, the restriction of the induced
  representation is `ω ⊕ ω²`.

**7.2 Boundary monodromy of versal total spaces.**
Let `C° → M_{g,n+1}` be finite étale with `C°` a scheme (for instance the universal punctured curve
over a level cover). Prove that there is a smooth projective compactification `C̄` with strict SNC
boundary, an isomorphism over `C°`, such that a small meridian around the generic point of every
boundary component, exceptional ones included, maps in `π₁(M_{g,n+1}) = PMod(g, n + 1)` to a
conjugate of a multitwist about pairwise disjoint simple closed curves with nonnegative exponents.
Construct `C̄` by blowing up boundary strata of `M̄_{g,n+1}` to a strict normal crossings
compactification `M̄′`, normalizing in the function field of `C°`, and taking a log resolution that
is an isomorphism over `C°` (Landesman–Litt, proof of Lemma 8.3.3, p. 40, with the compactification
paragraph replaced as in the authors' erratum, LL-P04 line 2848). The monodromy around a
boundary divisor of `M̄_{g,n+1}` is the Dehn twist about the vanishing cycle of the node, and the
inertia of the exceptional divisor over a boundary stratum is generated by the multitwist about the
curves of its dual graph (Li–Litt–Salter–Srinivasan, Lemma 2.1.1, LLSS20 line 321, stated for
`M̄_g`; the pointed case is the same local computation at a normal-crossings stratum); a meridian of a
component of `C̄ ∖ C°` maps to a product of nonnegative powers of the meridians of the components of
`M̄′ ∖ M_{g,n+1}` through its image. *Needs:* §§0.3, 2.4; SchemeAndStackFoundations §4.15
(`Mbar_smooth`, `Mbar_algebraic_proper_DM`); ResolutionOfSingularitiesCharacteristicZero §6.2.

**Checks.**

- For finite-image local systems quasi-unipotence holds on every compactification, independently
  of this theorem.
- Normalization alone need not give a smooth space with SNC boundary; the exceptional components of
  the log resolution are covered because their meridians are again products of the commuting
  node-smoothing twists.
- The smoothing `xy = t` of a node has local monodromy a single Dehn twist about the vanishing
  cycle, a unipotent transvection on `H₁` by §0.3.

**7.3 Quasi-unipotent boundary monodromy.**
Prove: for `g ≥ 3`, every local system on `C°` as in §7.2 has quasi-unipotent local monodromy
along `C̄ ∖ C°`; the same holds for a projective local system with values in `PGL_r(ℂ)`, tested
through its faithful adjoint representation `Ad ∘ ρ̂` (Landesman–Litt, proof of Lemma 8.3.3,
p. 40). Since `C° → M_{g,n+1}` is finite étale, the fundamental group of each connected component
of `C°` is a finite-index subgroup of `PMod(g, n + 1)`, and the monodromy is a representation of
it. Apply §7.1 to that subgroup and the multitwists of §7.2, and use that commuting
quasi-unipotent matrices have quasi-unipotent product. *Needs:* §§3.4, 7.1, 7.2.

**Checks.**

- For finite-image `ρ` every local monodromy has finite order.
- For `PGL_r`, quasi-unipotence of `Ad ∘ ρ̂(μ)` gives quasi-unipotence of `ρ̂(μ)` since `Ad` is
  faithful on `PGL_r`.

### 7.4 Integrality and unitarity of all conjugates

For `g ≥ 3` and an irreducible unitary MCG-finite representation of rank `r` with `r² < g + 1`,
this section proves integrality and the unitarity of every conjugate; §7.7 consumes §§7.5 and 7.6.

Prove: for `g ≥ 3` and an irreducible unitary MCG-finite representation `ρ` of `π₁(Σ_{g,n})` of rank
`r ≥ 1` with `r² < g + 1`, the projectivization `Pρ` is integral, that is `PGL_r(ℂ)`-conjugate into
`PGL_r(O_K)` for a number field `K` (Landesman–Litt, Lemma 8.3.3, p. 40). Realize `Pρ` on the total
space of a finite étale level chart (§3.4); it is strongly cohomologically rigid by §5.9 since
`r² − 1 < g`, has quasi-unipotent local monodromy by §7.3, hence is cohomologically rigid by §5.9,
in this order; it is `PGL_r`-irreducible because its fibre restriction is irreducible, and `PGL_r`
has trivial abelianization; apply §5.10. *Needs:* §§3.4, 5.9, 5.10, 7.3.

**Checks.**

- `r = 1`: the statement is empty since `PGL₁` is trivial.
- Cohomological rigidity is deduced only after quasi-unipotence of local monodromy is known,
  since it is not defined before.

**7.5 Linear integrality.**
Prove that under the hypotheses of §7.4, `ρ` itself is conjugate into `GL_r(O_L)` for a finite
extension `L` of the projective coefficient field (Landesman–Litt, Lemma 8.3.4, pp. 40–41). With
`D = det ρ` finite (§3.3), the map `G_D → PGL_r` is finite (§1.2); for each of finitely many
generators the actual matrix lies in the finite fibre over its integral projective image, hence in
`G_D(O_L)` after a finite extension, and the same for inverses, so the matrices lie in `GL_r(O_L)`
and not merely in `M_r(O_L)`. *Needs:* §§1.2, 3.3, 7.4.

**Checks.**

- `r = 1`: `ρ` is a finite-order character, integral over a cyclotomic ring of integers.
- The values lie in `GL_r(O_L)`, not only in `M_r(O_L)`: the inverses are integral by the same
  finite-fibre argument.

**7.6 Unitarity of all conjugates.**
Prove: for `g ≥ 3` and an irreducible unitary MCG-finite `ρ` of rank `r` with `r² < g + 1`, integral
over a number field `K` by §7.5, every embedding `τ : K → ℂ` gives a unitary conjugate `ρ ⊗_τ ℂ`
(Landesman–Litt, proof of Proposition 8.4.1, p. 41). Realize `ρ` on a punctured versal family with
finite determinant (§4.3); the total representation `ρ′` is irreducible and strongly rigid (§5.9).
For `σ ∈ Aut(ℂ)` with `σ ∘ ι = τ`, `ρ′ ⊗_σ ℂ` is irreducible, strongly rigid and of finite determinant,
hence underlies a complex PVHS on the total space (§5.8); restrictions to nearby fibres are
isomonodromic deformations of one another, so every fibre restriction is unitary by §5.11 since
`r < 2√(g + 1)`; parallel transport identifies
the fibre representation with `ρ ⊗_τ ℂ`. *Needs:* §§4.3, 4.4, 5.8, 5.9, 5.11, 7.5.

**Checks.**

- For the identity embedding the conclusion is the hypothesis.
- A complex PVHS on a single curve is not enough: §5.11 needs a variation on the total space of the
  versal family, so that its isomonodromic deformations to nearby curves are variations.

### 7.7 Finiteness in the unitary case

Prove that every unitary MCG-finite representation of `π₁(Σ_{g,n})` of rank `r` with `r² < g + 1`
has finite image, for all `g, n ≥ 0` (Landesman–Litt, Proposition 8.4.1, p. 41). Split it into
irreducibles (`ContRepresentation.IsUnitary.isSemisimpleRepresentation`, §3.1); for `g < 3`
the bound gives `r ≤ 1` (and `r = 0` for `g = 0`), handled by §3.3; for `g ≥ 3` use §7.5, §7.6 and
§5.11's finiteness criterion for representations into `GL_r(O_L)` unitary at every embedding.
*Needs:* §§3.1, 3.3, 5.11, 7.5, 7.6; Tau Ceti
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`.

**Checks.**

- On `Σ_{0,3}` the unitary character `c₁ ↦ e^{2πiθ}`, `c₂ ↦ e^{−2πiθ}` with `θ` irrational is
  MCG-finite (the pure mapping class group acts by inner automorphisms, §0.3) with infinite image,
  which is why `g = 0` allows only rank zero.
- Unitarity at one embedding does not suffice: the Salem character of §5.11 is integral, unitary at
  some embeddings and of infinite image.

### Examples

- For `g = 3`, `r = 1` is the only positive rank in range; the unitary case reduces to §3.3.
- For `g = 8`, ranks `r ≤ 2` are in range (`4 < 9`); a unitary irreducible MCG-finite representation
  of rank two is integral by §7.5, unitary at all conjugates by §7.6 and finite by §7.7.

### Dependencies

Layers 0–5; MordellLawrenceVenkatesh §§5.7, 5.10; GeometricTopology §1.7.2;
SchemeAndStackFoundations §4.15; ResolutionOfSingularitiesCharacteristicZero §6.2;
Mathlib `Representation.ind`; Tau Ceti
`ContRepresentation.IsUnitary.isSemisimpleRepresentation`.

## Layer 8: constancy and the semisimple case

This layer applies the constancy criterion of §1.3 to fibre-unitary formal families, proves that a
connected algebraic family of fixed-determinant representations with one unitary fibre restriction
has conjugate fibre restrictions, and deduces finiteness for semisimple MCG-finite representations
of low rank by nonabelian Hodge theory.

### 8.1 Fibral constancy of families with a unitary fibre

For `r² < g + 1`, a family of fixed-determinant representations of `π₁(C°)` with one unitary fibre
restriction has fibre restrictions constant up to conjugacy, over `ℂ[[t]]` (§8.1) and over a
connected base of finite type (§8.2); §8.3 consumes §8.2.

Prove: for a punctured étale-versal family, a base point `c ∈ C°` over `m` and
`ρ_∞ : π₁(C°, c) → GL_r(ℂ[[t]])` with constant determinant, `r ≥ 1` and `r² < g + 1`, if
`ρ₀ = ρ_∞ mod t` restricts to a unitary representation of `π₁(C°_m, c)`, then `ρ_∞|_{π₁(C°_m, c)}` is
conjugate over `ℂ[[t]]` to a constant representation (Landesman–Litt, Lemma 8.5.1, p. 42). Apply the
constancy criterion of §1.3 to `1 → π₁(C°_m) → π₁(C°) → π₁(M) → 1` (§2.6): for a deformation `γ`
over `B_n`, `n ≥ 0`, with constant fibre restriction, `ad γ` has rank `r² − 1 < g` and its fibre
restriction is the constant deformation of the unitary `ad ρ₀`, so `H⁰(M, R¹π°_* ad γ) = 0` by §5.7.
*Needs:* §§1.3, 2.6, 5.7.

**Checks.**

- If `ρ_∞` is conjugate to `ρ₀ ⊗ ℂ[[t]]` the conclusion holds trivially.
- The rank bound enters only through `rk ad γ = r² − 1 < g`; for `r² − 1 ≥ g` nothing is
  concluded.

**8.2 Connected algebraic fibral constancy.**
Prove: let `X` be a connected `ℂ`-scheme of finite type and `ρ : π₁(C°, c) → GL_r(O(X))` a
representation whose determinant is a fixed character, with `r ≥ 1` and `r² < g + 1`. If its
specialization at one closed point `y` restricts to a unitary representation of `π₁(C°_m, c)`, then
the restrictions at all closed points are `GL_r(ℂ)`-conjugate (Landesman–Litt, Lemma 8.5.2,
pp. 42–43). Reduce to a smooth connected curve through `y` by chains of reduced curves and
normalization; complete at `y` and apply §8.1 to get conjugacy on a dense open; the orbit of the
unitary, hence semisimple, fibre restriction is closed in the representation scheme (§1.4), so the
whole curve maps into it; propagate across intersecting components. This is a statement about
representations, not about maps to a character variety. *Needs:* §§1.4, 8.1.

**Checks.**

- `X` a point: the statement is empty.
- Closedness of the orbit is essential: `A(t) = [[1, t], [0, 1]]` is conjugate to `A(1)` for `t ≠ 0`
  and equals `I` at `t = 0`. The common orbit on the dense open `t ≠ 0` is that of `A(1)`, which is
  not closed: `I` lies in its closure (`rank(A(t) − I) = 1` for `t ≠ 0`, `0` at `t = 0`) but not in it.
  So conjugacy on a dense open to a point with non-closed orbit does not extend across `t = 0`, whose
  own orbit `{I}` is closed; the argument above needs the dense open to be conjugate to the unitary
  fibre, whose orbit is closed.
- Formal constancy is essential too: the same family of representations of `ℤ` has the unitary
  specialization `I` at `0` with closed orbit, yet its other specializations are not conjugate to
  it, because `H¹(ℤ, sl₂) ≠ 0` and §8.1 does not apply.

### 8.3 Finiteness in the semisimple case

Prove that every semisimple MCG-finite representation `π₁(Σ_{g,n}) → GL_r(ℂ)` with `r² < g + 1` has
finite image, without assuming unitarity (Landesman–Litt, Theorem 8.5.3, p. 43). Reduce to
irreducible `ρ` (§3.1) of rank `r ≥ 1`. For `g < 3` the bound gives `r = 1` (and no positive rank
for `g = 0`), and the statement is §3.3, which covers the closed torus `(g, n) = (1, 0)` outside the
hyperbolic range. For `g ≥ 3` the surface is hyperbolic; realize `ρ` as the fibre of a
finite-determinant local system `V` with determinant `χ` on a versal family (§4.3). By §5.8 there is `V₀` underlying a complex PVHS
in the same connected component `X` of the representation scheme `R_r(π₁(C°))_χ` (§1.4); `X` carries
the universal representation over `O(X)` with determinant `χ`. The fibre restriction of `V₀` is
unitary (§5.11, as `r < 2√(g + 1)`) and MCG-finite (§2.7), hence finite (§7.7), and by §8.2 the fibre
restriction of `V`, that is `ρ`, is conjugate to it. The connected family of actual representations
required by §8.2 is the component `X` itself, which is how the gap in the source's argument is
closed. *Needs:* §§1.4, 2.7, 3.1, 3.3, 4.3, 5.8, 5.11, 7.7, 8.2.

**Checks.**

- For unitary `ρ` the deformation may be taken constant and the theorem is §7.7.
- Outside the range the statement fails: the special dihedral representations of genus-one
  punctured surfaces (§12.5) are semisimple of rank two with infinite image, and
  `r² = 4 ≥ g + 1 = 2`.

### Examples

- For `g = 3` and `r = 1`, §8.3 is §3.3; for `g = 8` and `r = 2` it is the first case beyond
  characters.
- The family `t ↦ diag(t, t⁻¹)` of representations of `ℤ` into `SL₂` has non-conjugate semisimple
  specializations at `t = 1` and `t = 2`; it is not a family over a versal family with unitary
  fibre, so §8.2 does not apply.

### Dependencies

Layers 1–5 and 7.

## Layer 9: the general finiteness theorem and its corollaries

This layer removes the semisimplicity hypothesis by induction on the socle filtration, using the
higher Prym rank bound to split extensions, and deduces the fibral, isomonodromy, free-group,
Nielsen-tuple, characteristic-quotient and total-image corollaries.

### 9.1 Socle filtrations and splitting of low-rank extensions

This section provides the two inputs of the induction in §9.3, which consumes both: the
MCG-finite socle filtration and the splitting of low-rank MCG-finite extensions.

Prove that for an MCG-finite finite-dimensional complex representation of a surface group, its
socle (`TauCeti.socle` of the group-algebra module) and the quotient by it are MCG-finite; iterating
gives a finite characteristic socle filtration with semisimple graded pieces (Landesman–Litt, §8.7,
p. 44). Transport the supremum of simple submodules along each intertwiner by the universal
property of the socle; finite dimension makes the filtration finite. *Needs:* §3.1; Tau Ceti
`TauCeti.socle`, `TauCeti.isSemisimpleModule_socle`.

**Checks.**

- For semisimple `ρ` the socle filtration has length one.
- For the abelianization unipotent example of §12.1 with `H ≠ 0` the socle is `H` and the quotient
  is the trivial line, both MCG-finite; with `H = 0` the representation is trivial of rank one and
  its socle filtration has length one.

**9.2 Splitting of low-rank extensions.**
Prove: let `ρ` be MCG-finite of rank `r` with `r² < g + 1`, with a characteristic subrepresentation
`V₁` such that `V₁` and `V₂ = V/V₁` are semisimple with finite image. Then the extension splits and
`ρ` has finite image (Landesman–Litt, Lemma 8.6.1, p. 44). With `a = dim V₁`, `b = dim V₂`,
`ab ≤ r²/4 < (g + 1)/4`. Trivialize `V₁ ⊕ V₂` on a finite Galois cover with group `H`; the
restricted extension class is an `H`-equivariant map from `H₁` of the open cover to `Hom(V₂, V₁)`.
Choose a finite-index subgroup `Γ′` stabilizing the actual conjugacy class of `ρ`, the cover and the
labels of the constituents: stabilizing only the constituents of `Hom(V₂, V₁)` does not suffice;
the map is then `Γ′`-equivariant for the induced action on `Hom(V₂, V₁)`. Its image `I` is a
quotient of `H₁` of the open cover, not a subspace of a cohomology group, so §6.5 does not apply to
it directly. Dualize: the transpose of the surjection onto the `σ`-isotypic piece `I_σ` is a
`Γ′`-equivariant injection of `I_σ^∨` into `H¹` of the open cover (evaluation), landing in the
`σ^∨`-isotypic component, of dimension `≤ ab`, with `dim σ^∨ = dim σ ≤ ab`. Since
`2g − 2 dim σ ≥ 2g − 2ab > ab`, because `3ab < 3(g + 1)/4 ≤ 2g`, §6.5 forces `I_σ^∨ = 0`. The
extension is then trivial on the cover, so `ρ` has finite image and splits by averaging. *Needs:*
§§2.1, 6.1, 6.5; RepresentationTheory/CharacterTheory Layer 2.

**Checks.**

- A nonzero unipotent extension of trivial representations with infinite image is excluded by the
  MCG-finite hypothesis, not by semisimplicity of the graded pieces; with the stabilizer of the
  constituents alone, the unipotent representation of §2.1 would refute the argument.
- For `a = b = 1` the bound reads `2g − 2 > 1`, true for `g ≥ 2`, and `r = 2` requires `g ≥ 4`.
- The image must be dualized before §6.5 is applied: for the shear `(x, y) ↦ (x + y, y)` on `ℂ²`
  the equivariant quotient `(x, y) ↦ y` onto the trivial line has no equivariant section, since
  `(x, 1) ↦ (x + 1, 1)`, while its transpose embeds the trivial line as the fixed covector `e₂*`,
  because `e₂*(x − y, y) = y`.

### 9.3 Finiteness of canonical representations

Prove the main theorem: for all `g, n, r ≥ 0`, an MCG-finite representation
`ρ : π₁(Σ_{g,n}) → GL_r(ℂ)` with `r² < g + 1` has finite image; no semisimplicity is assumed
(Landesman–Litt, Theorem 1.2.1, p. 3, proved in §8.7, p. 44). For `g = 0` the bound forces `r = 0`.
Induct on the length of the socle filtration (§9.1): the socle and the quotient have finite image by
§8.3 and induction, and §9.2 splits the extension. In the algebraic form of the Lean file,
`mcgFinite_finite_image`: for `ρ : surfaceGroup g n → GL_r(ℂ)` with
`HasFiniteConjugacyOrbitUnder (pureMappingClassAut g n) ρ` and `r² < g + 1`, the image is finite;
it follows because the image of the based action of `PMod(g, n + 1)` lies in
`pureMappingClassAut g n` (§0.2), so a finite orbit under the latter is a finite orbit under the
former. *Needs:* §§0.2, 8.3, 9.1, 9.2, 3.3.

**Checks.**

- The bound is strict: `r² < g + 1`, not `r² ≤ g + 1`; at `g = 3` it allows `r = 1` only.
- At `g = 1` it allows `r = 1`, and the genus-one rank-two examples of §12.5 show that `r = 2`
  fails there.
- For `g ≥ 1` the abelianization unipotent representation of rank `2g + 1` of §12.1 is MCG-finite
  with infinite image, so finiteness fails in rank `2g + 1`: without semisimplicity no range of
  ranks growing faster than linearly in `g` can hold.

### 9.4 Finite fibral monodromy

Prove that for a local system of rank `r` with `r² < g + 1` on the total space of a punctured
étale-versal family of genus `g`, its restriction to every fibre has finite image, with no
semisimplicity of the total representation (Landesman–Litt, Corollary 1.3.1, p. 4). Combine §2.7
with §9.3 and use parallel transport between fibres. *Needs:* §§2.7, 9.3.

**Checks.**

- A local system pulled back from the base has trivial fibre restrictions.
- For `g = 3`, rank one: a character of `π₁(C°)` restricts to a finite-order character of each
  fibre, by §3.3 already.

### 9.5 Algebraic isomonodromic deformations

For an `n`-pointed curve `(C, D)` with `2g − 2 + n > 0` and an algebraic logarithmic connection
`(E, ∇)` with poles along `D` and monodromy `ρ`, a universal algebraic isomonodromic deformation is an
algebraic isomonodromic deformation over a variety dominant and étale over `M_{g,n}` whose analytic
germ is the universal analytic one over Teichmüller space (Cousin–Heu, §2.4). Prove: if `∇` is mild
(for instance the canonical extension, with residue eigenvalues of real parts in `[0, 1)`), and `ρ`
is semisimple when `r > 2`, a universal algebraic isomonodromic deformation exists exactly when the
orbit of the class of `ρ` under the mapping class group is finite (Cousin–Heu, Theorem A, p. 4).
Deduce: for semisimple regular-singular `(E, ∇)` of rank `r ≥ 1` with `r² < g + 1` and residue
eigenvalues with real parts in `[0, 1)`, an algebraic universal isomonodromic deformation exists if
and only if the monodromy is finite (Landesman–Litt, Corollary 1.2.3, p. 4). *Needs:* §§2.3, 5.3,
9.3; ComplexComparisonPartII §C5.6 (`CanonicalLogExtension`, `deligneRiemannHilbert`);
SchemeAndStackFoundations §4.15.

**Checks.**

- A flat bundle with finite monodromy has an algebraic universal isomonodromic deformation over a
  finite étale cover of the moduli stack: the easy direction.
- The residue condition says the connection is the canonical extension, which is mild; other
  connections are first gauge-transformed birationally.
- The statement is in the hyperbolic range `2g − 2 + n > 0`, which Cousin–Heu's theorem requires;
  the unpointed torus is not covered.

### 9.6 Finiteness for free groups and the Nielsen-tuple criterion

This section proves the free-group form `freeGroup_finite_image` (§9.7) and, with Nielsen generation
of `Aut(F_N)` (§9.6), the Nielsen-tuple criterion (§9.8); §9.9 consumes §9.7.

Prove that for `N ≥ 1` and the free group on the ordered basis `x₁, …, x_N`, `Aut(F_N)` is generated
by the cyclic shift `xᵢ ↦ xᵢ₊₁` (indices mod `N`), the transposition of `x₁` and `x₂` (`N ≥ 2`), the
inversion `x₁ ↦ x₁⁻¹` and the transvection `x₁ ↦ x₁x₂` (`N ≥ 2`), each fixing the other basis
elements (Nielsen 1924; Magnus–Karrass–Solitar, Theorem 3.2, p. 131, as cited in Landesman–Litt,
Remark 1.6.3). Under `FreeGroup.lift`, precomposition with these is the operation `c`, `τ`, `ε` or
`d` on `N`-tuples of group elements, and inner automorphisms act by simultaneous conjugation. The
route is Nielsen reduction of a basis. The transvection is Tau Ceti's
`TauCeti.FreeGroup.nielsenMul x₁ x₂ _ 1`, the automorphism `x₁ ↦ x₁ x₂` fixing the other generators.
*Needs:* Mathlib `FreeGroup`, `FreeGroup.lift`; Tau Ceti `TauCeti.FreeGroup.nielsenMul`.

**Checks.**

- For `N = 2` the abelianized images are `[[0, 1], [1, 0]]` (the shift and the transposition
  coincide), `diag(−1, 1)` and `[[1, 0], [1, 1]]`; they generate `GL₂(ℤ)`, as surjectivity of
  `Aut(F₂) → GL₂(ℤ)` requires.
- `N = 1`: `Aut(ℤ) = {±1}` is generated by the inversion; the cyclic shift is the identity.
- `N = 2`, values in `GL₃(ℂ)`: the transvection sends the pair `(I + E₁₃, I + E₂₃)` to
  `(I + E₁₃ + E₂₃, I + E₂₃)`, which is conjugate to the original by the matrix fixing `e₂, e₃` and
  sending `e₁` to `e₁ + e₂`, an instance of the fixed conjugacy class of §12.1.

**9.7 Finiteness for free groups.**
Prove: for `N = 2g` or `N = 2g + 1` and `ρ : F_N → GL_r(ℂ)` whose conjugacy class has finite orbit
under `Out(F_N)`, if `r² < g + 1` then `ρ` has finite image (Landesman–Litt, Corollary 1.6.1, p. 5).
Identify `F_N` with `π₁(Σ_{g,1})` for even `N` and with `π₁(Σ_{g,2})` for odd `N` (§0.1) and restrict
the action to the pure mapping class group; apply §9.3. This is `freeGroup_finite_image`, with
`Aut(F_N)` in place of `Out(F_N)` since inner automorphisms act by conjugation. Finite orbit under
the mapping class group is not claimed to imply finite orbit under `Out(F_N)`. *Needs:* §§0.1, 0.2,
9.3; Mathlib `FreeGroup`, `Matrix.GeneralLinearGroup`.

**Checks.**

- `N = 0` or `1`: then `g = 0` and the bound forces `r = 0`.
- For odd `N = 2g + 1` the surface is `Σ_{g,2}`, whose fundamental group is free of rank `2g + 1`.
- For `N ≥ 1` the rank-`(N + 1)` representation of §12.1 for `F_N` is `Out`-fixed with infinite
  image, so finiteness fails in rank `N + 1`; for `N = 0` it is the trivial representation of rank
  one, with image of size one, the negative control of §12.1.

**9.8 The Nielsen-tuple criterion.**
Prove: for `N ≥ 2` with `N = 2g` or `2g + 1` and invertible matrices `A₁, …, A_N ∈ GL_r(ℂ)`, if the
tuples obtained by repeatedly applying the cyclic shift, the swap of the first two entries, the
inversion of `A₁` and the replacement of `A₁` by `A₁A₂` meet only finitely many simultaneous
conjugacy classes, and `r² < g + 1`, then the `Aᵢ` generate a finite group (Landesman–Litt,
Remark 1.6.3, pp. 5–6). Each operation permutes the finite set of reached classes, so the set is
closed under inverses as well; by §9.6 it is an `Aut(F_N)`-orbit, and §9.7 applies. *Needs:* §§9.6,
9.7; Mathlib `FreeGroup.lift`.

**Checks.**

- `N = 2`, `r = 1`: roots of unity satisfy the hypothesis, and for `λ` of infinite order the
  operation `d` sends `(λ, μ)` to `(λμ, μ)` and with `τ` produces infinitely many pairs.
- Forward closure suffices: each operation is a bijection on conjugacy classes, and a bijection
  of a finite set onto itself has its inverse among its powers.

### 9.9 Characteristic quotients

Prove that for a quotient `G` of `F_N` (`N = 2g` or `2g + 1`) by a characteristic subgroup, a rank-`r`
representation of `G` with finite `Out(G)`-orbit has finite image when `r² < g + 1`, and likewise for
a quotient of a surface group by a subgroup characteristic for the mapping-class action (Landesman–
Litt, Remark 1.6.5, p. 6). Pull back along the quotient map: automorphisms descend, and pullback
preserves conjugacy and the image. *Needs:* §§9.3, 9.7.

**Checks.**

- `G = F_N^{ab} = ℤ^N` with `Out(G) = GL_N(ℤ)` and `N ≥ 2`, so that `g ≥ 1` and `r = 1` is in range:
  the conclusion recovers finiteness of `GL_N(ℤ)`-finite characters of `ℤ^N`. For `N = 2` the
  transvection `e₂ ↦ k e₁ + e₂` sends the character `(λ, μ)` to `(λ, λ^k μ)`, so a finite orbit forces
  `λ`, and symmetrically `μ`, to be roots of unity. For `N = 1` the character `1 ↦ 2` of `ℤ` has
  `GL₁(ℤ)`-orbit `{2, 1/2}` and infinite image; it lies outside the range, since `N = 1 = 2g + 1`
  gives `g = 0` and `r = 1` fails `1 < 1`.
- The quotient must be characteristic so that automorphisms of `F_N` descend to `G`.

### 9.10 Finite total image

Prove: for a finite-index `Γ ⊂ PMod(g, n + 1)` containing the point-pushing subgroup and a
representation of `Γ` of rank `r` with `r² < g + 1`, finite determinant and irreducible restriction
to the point-pushing subgroup, the image of `Γ` is finite (Landesman–Litt, Remark 10.1.7, p. 51), by
§3.2, §9.3 and §4.4. *Needs:* §§3.2, 4.4, 9.3.

**Checks.**

- The trivial representation of `Γ` has finite image.
- The finite-determinant and irreducibility hypotheses are those of §4.4, through which finiteness
  passes from the surface group to `Γ`.

### Examples

- For `g = 15`, every MCG-finite representation of rank `r ≤ 3` of `π₁(Σ_{15,n})` has finite image,
  since `9 < 16`; rank four would need `g ≥ 16`.
- For `F₆ = π₁(Σ_{3,1})`, an `Out(F₆)`-finite character is torsion by §9.7 with `g = 3`, `r = 1`.

### Dependencies

Layers 0–8; RepresentationTheory/CharacterTheory Layer 2; ComplexComparisonPartII §C5.6;
SchemeAndStackFoundations §4.15; Mathlib `FreeGroup`, `FreeGroup.lift`; Tau Ceti `TauCeti.socle`,
`TauCeti.isSemisimpleModule_socle`, `TauCeti.FreeGroup.nielsenMul`.

## Layer 10: arithmetic representations of the generic pointed curve

Throughout this layer `K` is a finitely generated field of characteristic zero, `(C, x₁, …, x_n)` a
smooth geometrically connected `n`-pointed curve of genus `g` over `K` with `2g − 2 + n > 0`, whose
moduli map `Spec K → M_{g,n,ℚ}` factors through the generic point, `C°_K̄ = C_K̄ ∖ {x₁, …, x_n}`, and
`ℓ` a prime. Arithmetic representations are those of
InverseGaloisAndArithmeticFundamentalGroups §IG.1.4 (*Outer actions and arithmetic
representations*).

### 10.1 Finite monodromy of low-rank arithmetic representations

Continuous arithmetic representations of `π₁^ét(C°_K̄)` become MCG-finite after transport to `ℂ`
(§10.1) and have finite image when `r² < g + 1` (§10.2); §§10.3, 11.3 and 11.5 consume §10.2.

Prove: every continuous arithmetic representation `ρ : π₁^ét(C°_K̄) → GL_r(ℚ̄_ℓ)` becomes MCG-finite
after choosing an embedding `K → ℂ`, restricting to the dense topological surface group
`π₁(C°(ℂ))` and transporting coefficients by an abstract field isomorphism `ℚ̄_ℓ ≅ ℂ`
(Landesman–Litt, proof of Theorem 9.1.2, pp. 46–47). Compare the arithmetic sequence of the curve
over `K` with that of the universal punctured curve over `M_{g,n,ℚ}` (§IG.1.4, *Exactness in families
and the moduli outer action*); since the moduli map is generic, `Γ_K` has open image in
`π₁^ét(M_{g,n,ℚ})`, so the orbit of the class of `ρ` under `π₁^ét(M_{g,n,ℚ̄})` is finite, and by
Riemann existence and §2.4 so is its orbit under the topological `PMod(g, n)`. MCG-finiteness is a
statement about finitely many conjugacy classes, so it survives the abstract coefficient isomorphism,
which is not assumed continuous. *Needs:* §§2.4, 2.1; InverseGaloisAndArithmeticFundamentalGroups
§§IG.1.4, IG.3.1; ComplexComparisonPartII §C6.2 (`riemannExistence`).

**Checks.**

- For finite-image `ρ` the comparison is immediate.
- `Γ_K` acts through the outer action on the geometric group, in which the topological surface
  group is dense (§IG.3.1), so a finite Galois orbit restricts to a finite mapping-class orbit.

**10.2 Arithmetic finite monodromy.**
Prove that every continuous arithmetic `ρ : π₁^ét(C°_K̄) → GL_r(ℚ̄_ℓ)` with `r² < g + 1` has finite
image (Landesman–Litt, Theorem 9.1.2, p. 45). By §10.1 and §9.3 its restriction to the topological
surface group has finite image; a finite subset of `GL_r(ℚ̄_ℓ)` is closed in the `ℓ`-adic topology,
so by continuity and density (§IG.3.1, *Topological fundamental groups of curves are dense*) the
whole image is that finite set. *Needs:* §§9.3, 10.1; InverseGaloisAndArithmeticFundamentalGroups
§IG.3.1.

**Checks.**

- `r = 1`, `g ≥ 1`: a continuous arithmetic character of the geometric group has finite order.
- Genericity is essential: if a pointed curve admits a nonconstant map to a modular curve carrying
  the punctured curve into the open modular curve, the pulled-back Tate module is an arithmetic
  rank-two representation of infinite image, so for `g ≥ 4` (where `4 < g + 1`) such a curve is
  never generic.

### 10.3 Characterisations of finite image by geometric origin and Hodge theory

This section proves the four-way characterisation of finite image, an end theorem, for
`r² < g + 1` (§10.3), and its form without arithmeticity for `r < 2√(g + 1)` (§10.4).

Prove that for a continuous `ρ : π₁^ét(C°_K̄) → GL_r(ℚ̄_ℓ)` with `r² < g + 1` the following are
equivalent: (1) `ρ` has finite image; (2) `ρ` is arithmetic; (3) for every embedding `K → ℂ` and every
field isomorphism `ℚ̄_ℓ ≅ ℂ` the complex local system on the punctured Riemann surface is of geometric
origin; (4) for every such choice it underlies an integral PVHS in the sense of §5.1, that is, it
is `V ⊗_{O_L, ι} ℂ` for a number field `L`, an embedding `ι : L → ℂ` and a local system `V` of finite
free `O_L`-modules such that `V ⊗_{O_L, ι′} ℂ` underlies a complex PVHS for every embedding
`ι′ : L → ℂ` (Landesman–Litt, Corollary 9.1.4, pp. 45–46). The number field `L` is unrelated to the
base field `K`, which contains the function field of `M_{g,n,ℚ}`, of transcendence degree
`3g − 3 + n` over `ℚ`, and can be a number field only for `(g, n) = (0, 3)`. (1) ⇒ (2) is the
finite-image criterion of InverseGaloisAndArithmeticFundamentalGroups §IG.1.4 and (2) ⇒ (1) is
§10.2; (1) ⇒ (3) because a finite local system is a summand of a push-forward of the constant
sheaf; (3) ⇒ (4) is §5.1; (4) ⇒ (1): choose the embedding at an analytically very general point,
possible because the points over the generic point of `M_{g,n,ℚ}` form a comeagre set and so does
the very general locus, and apply §5.11 (Landesman–Litt 2022, Theorem 1.2.5; the source cites
Corollary 1.2.7 at this step), using `r < 2√(g + 1)`. *Needs:* §§5.1, 5.11, 10.2;
InverseGaloisAndArithmeticFundamentalGroups §IG.1.4.

**Checks.**

- A non-real character of order three satisfies (4) with `L = ℚ(ζ₃)`, a number field whatever the
  base field `K` is, though it has no invariant rank-one `ℤ`-lattice; under a `ℤ`-lattice reading
  (1) ⇒ (4) would fail.
- The quantifiers in (3) and (4) range over all embeddings and all coefficient isomorphisms.
- (1) ⇒ (2) through §IG.1.4: the trivial representation has a one-element orbit, and a finite-image
  representation whose cover and group action descend to `C°_{K′}` with `[K′ : K] = d` has at most
  `d` classes in its orbit; the converse fails without the rank bound, since Tate modules of
  abelian schemes are arithmetic of infinite image.

**10.4 The wider Hodge range.**
Prove that conditions (1), (3) and (4) of §10.3 are equivalent whenever `r < 2√(g + 1)`;
arithmeticity is not part of this wider equivalence (Landesman–Litt, Corollary 9.1.4, final
assertion, p. 46). The implications (1) ⇒ (3) ⇒ (4) hold in every rank and (4) ⇒ (1) uses only
`r < 2√(g + 1)` in §5.11. *Needs:* §§5.1, 5.11, 10.3.

**Checks.**

- Arithmeticity is excluded in this range: only the relative Fontaine–Mazur conjecture would extend
  it to semisimple `ρ` with `r < 2√(g + 1)` (Landesman–Litt, Remark 9.1.5).
- For `g = 3` the wider range allows `r ≤ 3` (`3 < 4`), while §10.3 allows only `r = 1`.

### Examples

- For `g = 8`, every arithmetic representation of rank at most two of the geometric fundamental
  group of the generic curve of genus `8` has finite image (§10.2), and for rank at most five
  (`5 < 2·3 = 6`) geometric origin is equivalent to finite image (§10.4).
- For `g = 0` the hypothesis of §10.2 forces `r = 0`.

### Dependencies

Layers 2, 5 and 9; InverseGaloisAndArithmeticFundamentalGroups §§IG.1.4, IG.3.1;
ComplexComparisonPartII §C6.2.

## Layer 11: residual lifts and non-density

This layer defines arithmetic lifts of residual representations, proves that surjections onto
`GL_r(𝔽_p)` of the geometric fundamental group of the generic curve have no arithmetic lifts for
`1 < r < √(g + 1)` and `p` prime to Jordan's constant, constructs such surjections for every `p`,
proves non-density of finite-image representations in character varieties, and records the
conditional non-flatness of deformation rings.

### 11.1 Arithmetic lifts and residual non-liftability

This section defines arithmetic lifts and proves residual non-liftability, an end theorem, from
§10.2 and the Jordan obstruction (§11.2); §§11.4 and 11.6 consume §11.3.

For a residual representation `ρ̄ : π₁^ét(C°_K̄) → GL_r(𝔽_p)`, an *arithmetic lift* is a finite
extension `E/ℚ_p`, an `O_E`-lattice `L` of rank `r` and a continuous arithmetic representation on
`L ⊗ E` preserving `L`, whose reduction is isomorphic to `ρ̄` after an embedding of residue fields
and scalar extension; ramified `E` are allowed. A *residual geometric-origin realization* is the
reduction of a stable lattice in a characteristic-zero representation of geometric origin, with
coefficients in `W(F)[1/p]` for a finite field `F` (Landesman–Litt, Definition 9.2.1, pp. 47–48).
Prove that a representation of geometric origin is arithmetic: the family is defined over a finite
extension `K′` of `K`, `Γ_{K′}` permutes the isomorphism classes of subquotients of the cohomology
sheaf, and these are finitely many because that sheaf is semisimple on the geometric group (§5.1,
semisimplicity of variations, transported by density from the topological group). *Needs:* §5.1;
InverseGaloisAndArithmeticFundamentalGroups §§IG.1.4, IG.3.1.

- Reduction of the chosen stable lattice, after the specified residue extension, is isomorphic to
  `ρ̄`.
- A finite coefficient extension of a lift is a lift with the induced reduction comparison.
- A residual geometric-origin realization gives an arithmetic lift, by the geometric-origin
  statement above.

**Checks.**

- The trivial residual representation has the trivial `ℤ_p`-lattice lift.
- Lifting generator matrices arbitrarily to `O_E` is not a lift unless all relations hold and the
  resulting homomorphism is continuous.
- A lift over a ramified finite extension with residue field `𝔽_p` is admitted, and agrees with
  ordinary scalar-extended reduction.

**11.2 The Jordan obstruction.**
Prove that for `r ≥ 2` and every prime `p` not dividing `m(r) = J(r)!` (§1.5), no finite subgroup of
`GL_r(O_E)`, for a finite extension `E/ℚ_p`, reduces onto a subgroup of `GL_r(k_E)` conjugate to
`GL_r(𝔽_p)` (Landesman–Litt, proof of Corollary 9.2.2, p. 48; Landesman–Litt 2022, proof of
Lemma 7.5.1, p. 54): the identity `[x^{m(r)}, y^{m(r)}] = 1` holds in the finite subgroup, survives
reduction and quotients, and fails for the opposite unipotent blocks of §1.5. *Needs:* §1.5;
FiniteGroupInvariants §10.5.

**Checks.**

- The `2 × 2` computation of §1.5: `[u^m, l^m] = 1` exactly when `p | m`.
- For primes dividing `m(r)` no conclusion is drawn.

**11.3 Residual non-liftability.**
Prove that for the generic pointed curve, `1 < r < √(g + 1)`, `p ∤ m(r)` and `ρ̄` a surjection of
`π₁^ét(C°_K̄)` onto `GL_r(𝔽_p)`, `ρ̄` has no arithmetic lift, and hence no residual geometric-origin
realization (Landesman–Litt, Corollary 9.2.2, p. 48): an arithmetic lift has finite image by §10.2,
contradicting §11.2. *Needs:* §§10.2, 11.1, 11.2.

**Checks.**

- `r = 1` is excluded: `GL₁(𝔽_p)` is cyclic and the Jordan identity holds there.
- For `p | m(r)` nothing is claimed.

### 11.4 Surjective residual representations

Prove that for every prime `p` and `r ≥ 2`, the geometric fundamental group of a smooth
characteristic-zero curve with `n ≥ 1` and `2g + n − 1 ≥ 2`, or with `n = 0` and `g ≥ 2`, has a
continuous surjection onto `GL_r(𝔽_p)`; on the generic curve with `1 < r < √(g + 1)` these have no
arithmetic lift when `p ∤ m(r)` (Landesman–Litt, Example 9.2.3, pp. 48–49, with non-liftability
restricted to such `p` as in the authors' erratum). For `n ≥ 1` the geometric group is free
profinite of rank `2g + n − 1` (the profinite completion of §0.1's free group, by §IG.3.1); for
`n = 0`, sending every `bᵢ` to `1` gives a free profinite quotient on `a₁, …, a_g`; map two free
generators to a generating pair of `GL_r(𝔽_p)` (§1.5). *Needs:* §§0.1, 1.5, 11.3;
InverseGaloisAndArithmeticFundamentalGroups §IG.3.1.

**Checks.**

- `n ≥ 1`: the geometric group is free profinite on `2g + n − 1` generators.
- `n = 0`: the quotient sending every `bᵢ` to `1` respects the relation `∏ [aᵢ, bᵢ] = 1`.

### 11.5 Non-density of finite-image representations

Prove that for `2g − 2 + n > 0` and `r ≥ 2` the semisimple representations of `π₁(Σ_{g,n})` with
finite image lie in a proper closed subset of the character variety `M_r(π₁(Σ_{g,n}))` of §1.4,
without fixed determinant, since finite-image representations have varying determinants; consequently,
on the generic curve in the range `1 < r < √(g + 1)`, arithmetic representations are not Zariski
dense (Landesman–Litt 2022, Lemma 7.5.1, pp. 53–54; Landesman–Litt, Remark 9.1.3, p. 45). The Jordan
identity of §1.5 cuts out a closed conjugation-invariant subset of the representation scheme, whose
image in the quotient is closed (§1.4); it is proper because a free quotient on two generators sends
them to the opposite unipotents of §1.5, whose semisimplification in a two-dimensional irreducible
block still violates the identity. *Needs:* §§1.4, 1.5, 10.2; FiniteGroupInvariants §10.5.

**Checks.**

- `r = 1`: torsion characters are dense in the character torus, so `r ≥ 2` is needed.
- The unpointed torus is excluded: its group is abelian and finite-image representations are
  dense.

### 11.6 Conditional non-flatness of deformation rings

Let `K′/K` be finite, `Π = π₁^ét(C°_{K′})` and `ρ̄_Π : Π → GL_r(F)` a continuous absolutely irreducible
representation whose restriction to `π₁^ét(C°_K̄)` is a surjection onto `GL_r(𝔽_p)` as in §11.3. Prove:
for every continuous quotient `Π → Π′` satisfying Mazur's condition `Φ_p` through which `ρ̄_Π`
factors, the universal deformation ring `R` of `ρ̄_Π` on `Π′` satisfies `R[1/p] = 0`; hence `R` is
not flat and not formally smooth over `W(F)` (Landesman–Litt, Remarks 9.2.5–9.2.6, p. 49, in the
form left by the authors' erratum). A nonzero `R[1/p]` has a point over a finite extension of
`W(F)[1/p]`, which gives a lift of `ρ̄_Π` whose restriction to the geometric group is arithmetic,
contradicting §11.3. No failure of the complete-intersection property follows: `ℤ_p[[x]]/(p)` is a
non-flat complete intersection. *Needs:* §11.3; LocalGaloisDeformationRings §§F.1.1–F.1.7, F.2.1,
F.2.5; DeformationAndDerivedPatchingAlgebra §§4.2, 4.4.

**Checks.**

- `ℤ_p[[x]]/(p)` is a complete intersection and not flat over `ℤ_p`, so non-flatness does not
  contradict the complete-intersection property.
- The statement is conditional on the extension `ρ̄_Π` to an arithmetic group; the geometric
  surjection alone does not specify it.

### Examples

- For `g = 8`, `r = 2` and every `p ∤ m(2)`, the generic curve of genus `8` with one marked point
  has geometric surjections onto `GL₂(𝔽_p)` without arithmetic lifts.
- For `r = 2` the identity `[x^{m(2)}, y^{m(2)}] = 1` is violated in `GL₂(𝔽_p)` by `u` and `l`
  whenever `p ∤ m(2)`.

### Dependencies

Layers 0, 1, 5 and 10; InverseGaloisAndArithmeticFundamentalGroups §§IG.1.4, IG.3.1;
FiniteGroupInvariants §10.5; LocalGaloisDeformationRings §F; DeformationAndDerivedPatchingAlgebra
§§4.2, 4.4.

## Layer 12: examples and range checks

This layer constructs the examples that show which hypotheses and ranges the theorems need: the
abelianization unipotent representations, Morita's extensions, the augmentation-ideal extension,
the rank-two classifications in genus one and in genus at least two, large-rank semisimple examples,
small free-group examples and rigid local systems on punctured spheres.

### 12.1 Abelianization unipotent representations

For `G` a free group `F_N` or a closed genus-`g` surface group, let `H = G^{ab} ⊗ ℂ` and
`a : G → H` the abelianization map. Define `U_G(γ)(v, t) = (v + t a(γ), t)` on `H ⊕ ℂ`. Prove that
`U_G` is a unipotent representation of rank `dim H + 1` (`N + 1`, respectively `2g + 1`), that its
actual conjugacy class is fixed by every automorphism of `G` (conjugation by the block-diagonal
action of the automorphism on `H ⊕ ℂ` implements precomposition, and inner automorphisms act
trivially on `H`), and that for `H ≠ 0` it has infinite image and is a nonsplit extension of trivial
representations, an invariant complement to `H` forcing `a = 0` (Landesman–Litt, Example 10.1.6(3),
p. 51, and Remark 10.2.7, pp. 52–53). *Needs:* §§0.1, 2.1.

- The action is `(v, t) ↦ (v + t a(γ), t)`; the representation law is additivity of `a`.
- The block-diagonal action of an automorphism `α` conjugates `U_G` to `U_G ∘ α`.
- The extension splits exactly when `a = 0`.

**Checks.**

- For the two basis elements of `F₂` the matrices are `I₃ + E₁₃` and `I₃ + E₂₃`.
- For `F₀` the representation is the trivial one-dimensional representation.
- For `F₁ = ℤ` the generator acts by `[[1, 1], [0, 1]]`, of infinite order with a non-split invariant
  line, though its semisimplification is trivial.

### 12.2 Non-split extensions of mapping class group representations

This section constructs non-split extensions of representations of mapping class groups: Morita's
classes (§§12.2, 12.4) and the augmentation-ideal extension (§12.3).

Prove that for a closed surface of genus `g ≥ 3` with `H = H₁(Σ_g, ℚ)` and the symplectic inclusion
`H → ∧³H`, `ω ∧ −` with `ω` the symplectic class, there is a nonzero class in `H¹(Mod_g, ∧³H/H)`,
hence a non-split extension `0 → ∧³H/H → W → ℚ → 0` and a nontrivial deformation of the split
representation (Landesman–Litt, Example 10.1.6(1), p. 50; Morita 1993). The route is Morita's
extension of the Johnson homomorphism to a crossed homomorphism on the whole mapping class group.
*Needs:* §§0.2–0.3, 1.1.

**Checks.**

- At `g = 2`, `H → ∧³H` is an isomorphism (`dim ∧³H = 4 = dim H`), so the quotient is zero and
  carries no nonzero class; the genus bound is needed.
- Scaling a cocycle by `t` gives a family of extensions whose special fibre `t = 0` is split.

**12.3 The augmentation-ideal extension.**
Let `I` be the augmentation ideal of `ℚ[π₁(Σ_{g,n−1}, x)]`, with the based action of `PMod(g, n)`.
Prove that for `n ≥ 1` and `2g − 2 + (n − 1) > 0` the sequence `0 → I²/I³ → I/I³ → I/I² → 0` of
`PMod(g, n)`-representations does not split (Landesman–Litt, Example 10.1.6(2), p. 51). The
point-pushing subgroup (§0.3) acts trivially on `I/I²` and on `I²/I³`, and `α` acts on `I/I³` by
`x ↦ x + [α − 1, x]`; an equivariant splitting would force `[α − 1, x] ∈ I³` for all `α` and `x ∈ I`,
which fails because the commutator `I/I² × I/I² → I²/I³` is nonzero for a nonabelian surface group.
*Needs:* §§0.1, 0.3.

**Checks.**

- `(g, n) = (1, 1)`: the group is `ℤ²`, the completed group algebra is commutative, and the truncated
  logarithm gives an `Aut(ℤ²)`-equivariant splitting; this case is excluded by `2g − 3 + n > 0`.
- The terms are `I²/I³` and `I/I²`, not the untruncated augmentation ideal.
- For `n − 1 ≥ 1` the graded pieces are `H` and `H ⊗ H`, and `[a, b] = a ⊗ b − b ⊗ a ≠ 0` for
  independent `a, b`.

**12.4 Morita's pointed extension.**
Prove that for `g ≥ 2`, `H¹(Mod_{g,*}; H₁(Σ_g; ℤ))` is infinite cyclic, generated by the class of
Morita's crossed homomorphism `f`, whose image under restriction to the point-pushing subgroup is
`2 − 2g` times the generator of `Hom(π₁(Σ_g), H₁(Σ_g))^{Mod_g} ≅ ℤ` given by the intersection pairing
(Morita 1989, Proposition 6.4, p. 804, Mor89 line 886). Over `ℚ` the corresponding non-split
extension `0 → H₁(Σ_g, ℚ) → W → ℚ → 0` restricts on the point-pushing subgroup, after rescaling by
`1/(2 − 2g)`, to the representation `U` of §12.1 (Landesman–Litt, Example 10.1.6(3), p. 51). The
surface example §12.1 does not depend on this global extension. *Needs:* §§0.3, 1.1, 12.1.

**Checks.**

- The normalization factor `2 − 2g` is nonzero for `g ≥ 2`, so the rational rescaling exists; the
  integral class itself restricts to a non-primitive multiple.
- The integral class and its rational restriction are distinct objects: the former generates a
  group isomorphic to `ℤ`, the latter is defined only after inverting `2g − 2`.

### 12.5 Rank two: infinite image in genus one, finite image in higher genus

MCG-finite representations of rank two can have infinite image in genus one (§12.5) and have finite
image in genus at least two (§12.6, `rankTwo_mcgFinite_finite_image`); §12.8 consumes §12.5.

Prove that for `g = 1` and `n ≥ 1` there are semisimple MCG-finite representations of `π₁(Σ_{1,n})`
into `SL₂(ℂ)` with infinite special-dihedral image, and non-split reducible MCG-finite
representations of rank two with infinite image (Landesman–Litt, Remark 10.2.1, p. 52;
Biswas–Gupta–Mj–Whang, Theorem B; Cousin–Heu, Theorem B, p. 6). For instance on `π₁(Σ_{1,1})`, free
on `a, b`, send `a ↦ diag(λ, λ⁻¹)` and `b ↦ [[0, 1], [−1, 0]]` with `λ` not a root of unity: the
image lies in the infinite dihedral group, the fundamental group of the complement of the curve `a`
is generated by `a` and `b a b⁻¹`, which map to `diag(λ, λ⁻¹)` and `diag(λ⁻¹, λ)`, so the restriction
there is diagonal, and the representation is irreducible with infinite image; Cousin–Heu's `ρ_{μ,c}` give the
non-split examples. *Needs:* §2.1.

**Checks.**

- In `ρ_{μ,c}` some `cᵢ ≠ 0` since `Σ cᵢ = 1`, so `ρ(γᵢ)` is a nontrivial unipotent: the image is
  infinite and the representation reducible and non-split.
- Rank two in genus one has `r² = 4 ≥ g + 1 = 2`, outside §9.3.
- These are representations of punctured tori; the closed torus group is abelian and has no
  irreducible representation of rank two.

**12.6 Rank two in genus at least two.**
Prove that for `g ≥ 2` and every `n ≥ 0`, every MCG-finite representation `π₁(Σ_{g,n}) → GL₂(ℂ)` has
finite image (Landesman–Litt, Remark 10.2.2, p. 52, LL24 line 2192). Reducible ones are sums of
finite characters by Cousin–Heu, Theorem B (CH19 line 268, for actual conjugacy classes
`Hom(π₁, GL₂(ℂ))/GL₂(ℂ)` and orientation-preserving mapping classes). For irreducible `ρ`, the
determinant is a finite character (§3.3) with a finite-order square root `χ` (the abelianization is
free abelian); `ρ ⊗ χ⁻¹` lands in `SL₂(ℂ)` and is MCG-finite on the finite-index stabilizer of `χ`,
hence finite by Biswas–Gupta–Mj–Whang, Theorem A (BGMW17 line 53, for semisimple representations
of surfaces of genus `≥ 2` with any number of punctures). These two classification theorems are
part of this target. For `g = 2, 3` this goes beyond §9.3, which needs `r² < g + 1`. In the algebraic
form of the Lean file, `rankTwo_mcgFinite_finite_image`: for `g ≥ 2`, all `n ≥ 0` and
`ρ : surfaceGroup g n → GL₂(ℂ)` with `HasFiniteConjugacyOrbitUnder (pureMappingClassAut g n) ρ`, the
image is finite; it follows from the topological form as §9.3 does, since the image of the based
action of `PMod(g, n + 1)` lies in `pureMappingClassAut g n` (§0.2). *Needs:* §§0.2, 2.1, 3.1, 3.3.

**Checks.**

- `r = 2` and `g = 2, 3`: `r² ≥ g + 1`, outside §9.3, so the statement is a genuine improvement there.
- `g = 1`: false by §12.5.
- The square root exists because a character of a free abelian group into `ℂ^×` has square roots of
  finite order when it has finite order.

### 12.7 Large-rank semisimple examples

Prove that there is a real constant `C > 1` such that for every `g ≥ 2` there are a rank
`r ≤ C^g` and a semisimple MCG-finite representation `π₁(Σ_g) → GL_r(ℂ)` with infinite image; the
constant comes first and does not depend on `g` (Landesman–Litt, Example 10.2.4, p. 52;
Koberda–Santharoubane, Corollary 4.5, KS16 line 552, with one prime `p` for all genera, KS16
lines 546–550). One route: for an odd prime `p ≫ 0` the integral quantum `SO(3)` representation
`ρ_p` of the pointed mapping class group `PMod(g, 1)` restricts on the point-pushing subgroup to a
projective representation into `PGL_d(ℂ)`, `d ≤ C₀^g`, whose image contains a nonabelian free group
(Koberda–Santharoubane, Corollaries 4.3 and 4.4; Biswas–Koberda–Mj–Santharoubane, Theorem 5.1);
composing with the adjoint embedding `PGL_d → GL_{d²}` gives an MCG-finite representation of rank
`d² ≤ (C₀²)^g` by §3.2, and its semisimplification is MCG-finite by §3.1, of the same rank, and
still of infinite image, because a nonabelian free group has no finite-index subgroup mapping
injectively into a unipotent group. The quantum representations and the free-subgroup statement are
part of this target. *Needs:* §§0.3, 3.1, 3.2.

**Checks.**

- Semisimplification can destroy infinite image in general (the unipotent example of §12.1 becomes
  trivial); here it does not, because of the free subgroup.
- The rank is bounded above by `C^g` only: below, it is at least `3` for `g ≥ 2`, since ranks one
  and two give finite image (§§3.3, 12.6), and at least `√(g + 1)` by §9.3; at `g = 8`, for
  instance, `r ≥ 3`, `r² ≥ 9 = g + 1`. The upper bound `C^g` is compatible with both, so there is no
  contradiction.
- Rank zero cannot witness the statement: `GL₀(ℂ)` is trivial, so every rank-zero representation
  has image of size one.

### 12.8 Small free groups

Prove that for `F₁ = ℤ` a character of infinite order has infinite image and an `Out(F₁)`-orbit of
size two, and that for `F₂` the representation of §12.5 on `π₁(Σ_{1,1}) = F₂` is semisimple of infinite
image with finite `Out(F₂)`-orbit, since `Out(F₂)` contains the orientation-preserving mapping class
group of `Σ_{1,1}` with index two (Landesman–Litt, Remark 10.2.7, pp. 52–53; Farb–Margalit, §8.2).
*Needs:* §§2.1, 12.5; Mathlib `FreeGroup`.

**Checks.**

- `Out(ℤ) = {±1}`, and inversion sends the character `λ` to `λ⁻¹`, a different class unless
  `λ = ±1`.
- For `F₁` and `r = 1` the theorem of §9.7 needs `1 < g + 1` with `N = 1 = 2g + 1`, so `g = 0`, and
  `r = 1` is outside its range.

### 12.9 Rigid local systems on punctured spheres

Prove that a physically rigid irreducible local system on `ℙ¹ ∖ {x₁, …, x_n}`, one determined up to
global conjugacy by its ordered local conjugacy classes, is MCG-finite: pure mapping classes preserve
each local class, so the orbit is a single class (Landesman–Litt, Example 10.2.5, p. 52; Katz,
Rigid Local Systems). Every rank-one local system is physically rigid, so for `n ≥ 3` a character
with a local monodromy of infinite order is an infinite-image example. *Needs:* §§0.1, 2.1.

**Checks.**

- `n = 3`: `PMod(0, 3)` is trivial and every representation is MCG-finite.
- On `Σ_{0,4}` the character `c₁ ↦ 2, c₂ ↦ 1/2, c₃ ↦ 1, c₄ ↦ 1` is determined by its local
  monodromies, hence MCG-finite, with infinite image.

### Examples

- On `π₁(Σ_{1,1})`, free on `a, b`, the representation of §12.5 with `λ = 2`, `a ↦ diag(2, 1/2)` and
  `b ↦ [[0, 1], [−1, 0]]`, is MCG-finite of rank two with infinite image, and `r² = 4 ≥ g + 1 = 2`;
  every MCG-finite character of the same group has finite image (§3.3), so two is the least rank of
  an MCG-finite representation of `π₁(Σ_{1,1})` with infinite image.
- For `F₂` the representation of §12.1 has rank three and sends the basis to `I₃ + E₁₃` and
  `I₃ + E₂₃`; its conjugacy class is fixed by every automorphism of `F₂` and its image is infinite.
  With `N = 2 = 2g` the bound `r² < g + 1 = 2` of §9.7 allows only `r ≤ 1`, and `3² = 9 ≥ 2`.

### Dependencies

Layers 0–3, 5 and 9; Mathlib `FreeGroup`.

## Downstream consumers

- StableReductionPartII §7.14 states the classifying property of smooth pointed families in the form
  that §2.2's versality condition reads, and leaves the punctured family, its dominant étale charts,
  analytification, stack fundamental groups and the mapping-class identifications of §§2.2–2.6 to
  this roadmap.
- NonabelianLevelStructures and MotivicStructuresInModuliOfCurves use the Teichmüller uniformization
  of the pointed moduli stack and its orbifold fundamental group `PMod(g, n)` (§§2.3–2.4).
- Roadmaps on mapping class groups and finite covers of moduli spaces use Layer 6's higher Prym
  rank bound and the Putman–Wieland theorem for small groups.
- Roadmaps on rigid local systems and variations of Hodge structure use Layer 5's rank bound,
  Artinian vanishing and rigidity on versal families, and Layer 1's representation schemes.

## Worked examples

- **The unipotent example against the main theorem.** On a closed surface of genus `g ≥ 1`, the
  representation `U` of §12.1 has rank `2g + 1`, is fixed by the mapping class group and has infinite
  image. The main theorem §9.3 needs `(2g + 1)² < g + 1`, which never holds, so there is no
  contradiction; the socle of `U` is `H` and the quotient `ℂ` (§9.1), and the extension does not
  split, the situation §9.2 excludes in low rank. In genus zero `H = 0` and `U` is the trivial
  representation on `ℂ`: image of size one, socle `ℂ` and a split extension.
- **Putman–Wieland for double covers of a genus-two surface.** For `g = 2` and `H = ℤ/2`, `#H = 2 < 4`,
  so §6.7 applies: for a connected double cover `Σ₃ → Σ₂`, no nonzero class of `H₁(Σ₃, ℂ)` has finite
  orbit under the stabilizer `Γ ⊂ PMod(2, 1)`. The isotypic decomposition is
  `H₁(Σ₃) = H₁(Σ₃)^{triv} ⊕ H₁(Σ₃)^{sgn}` of dimensions `4` and `2`, and §6.5 requires every nonzero
  stable subspace of either to have dimension at least `2·2 − 2 = 2`, which both dimensions satisfy.
- **The genus-eight rank-two chain.** For `g = 8` and an irreducible unitary MCG-finite `ρ` of rank
  two (`4 < 9`): §4.3 realizes `ρ` on a versal family; §5.9 makes the realization strongly rigid since
  `r² − 1 = 3 < 8`; §7.2–§7.3 give quasi-unipotent boundary monodromy; §7.4–§7.5 make `ρ` integral;
  §7.6 makes every conjugate unitary since `2 < 2√9 = 6`; §7.7 gives finite image.
- **Nielsen tuples in rank one.** For `N = 2`, `g = 1`, `r = 1` (`1 < 2`), a pair `(λ, μ)` of nonzero
  complex numbers satisfies the finiteness hypothesis of §9.8 exactly when both are roots of unity:
  `d`, `τ` and `ε` generate all `(λ^a μ^b, λ^c μ^d)` with `[[a, b], [c, d]] ∈ GL₂(ℤ)`, finitely many only for
  torsion values, in agreement with §9.7.

## References

- **LL24** A. Landesman, D. Litt, *Canonical representations of surface groups*, Annals of
  Mathematics 199 (2024); [arXiv:2205.15352v4](https://arxiv.org/abs/2205.15352v4). Page numbers are
  those of the arXiv version.
- **LL-P04** A. Landesman, D. Litt, author-adopted erratum P04 for *Canonical representations of
  surface groups*, [author page](https://www.daniellitt.com/published-paper-reviews.html); only the
  authors' erratum entries are used, not the reviews on the same page.
- **LL22** A. Landesman, D. Litt, *Geometric local systems on very general curves and isomonodromy*;
  [arXiv:2202.00039v2](https://arxiv.org/abs/2202.00039v2).
- **KP20** C. Klevdal, S. Patrikis, *G-rigid local systems are integral*;
  [arXiv:2009.07350v2](https://arxiv.org/abs/2009.07350v2).
- **EG18** H. Esnault, M. Groechenig, *Cohomologically rigid local systems and integrality*, Selecta
  Math. 24 (2018); [arXiv:1711.06436](https://arxiv.org/abs/1711.06436).
- **Dri18** V. Drinfeld, *On the pro-semisimple completion of the fundamental group of a smooth
  variety over a finite field*, Adv. Math. 327 (2018), 708–788;
  [arXiv:1509.06059v8](https://arxiv.org/abs/1509.06059v8). Locators are those of the arXiv version.
- **Dri12** V. Drinfeld, *On a conjecture of Deligne*, Moscow Math. J. 12 (2012), 515–542;
  [arXiv:1007.4004v7](https://arxiv.org/abs/1007.4004v7). Locators are those of the arXiv version.
- **CH19** G. Cousin, V. Heu, *Algebraic isomonodromic deformations and the mapping class group*;
  [arXiv:1612.05779v4](https://arxiv.org/abs/1612.05779v4).
- **AS16** J. Aramayona, J. Souto, *Rigidity phenomena in the mapping class group*, Handbook of
  Teichmüller theory VI; [author copy](https://www.math.univ-toulouse.fr/~jaramayo/rigidity-survey.pdf).
- **LLSS20** W. Li, D. Litt, N. Salter, P. Srinivasan, *Surface bundles and the section conjecture*;
  [arXiv:2010.07331v1](https://arxiv.org/abs/2010.07331v1).
- **Moc06** T. Mochizuki, *Kobayashi–Hitchin correspondence for tame harmonic bundles and an
  application*, Astérisque 309 (2006); [arXiv:math/0411300](https://arxiv.org/abs/math/0411300).
- **Sim90** C. Simpson, *Harmonic bundles on noncompact curves*, J. Amer. Math. Soc. 3 (1990),
  713–770.
- **MS80** V. B. Mehta, C. S. Seshadri, *Moduli of vector bundles on curves with parabolic
  structures*, Math. Ann. 248 (1980), 205–239.
- **Tim87** K. Timmerscheidt, *Mixed Hodge theory for unitary local systems*, J. Reine Angew. Math.
  379 (1987), 152–171.
- **SZ85** J. Steenbrink, S. Zucker, *Variation of mixed Hodge structure I*, Invent. Math. 80 (1985),
  489–542.
- **PS08** C. Peters, J. Steenbrink, *Mixed Hodge Structures*, Ergebnisse 52, Springer (2008).
- **Sch19** C. Schnell, *An overview of Morihiko Saito's theory of mixed Hodge modules*;
  [arXiv:1405.3096v1](https://arxiv.org/abs/1405.3096v1).
- **SS22** C. Sabbah, C. Schnell, *Degenerating complex variations of Hodge structure in dimension
  one*; [arXiv:2206.08166v1](https://arxiv.org/abs/2206.08166v1). Locators are the numbered
  paragraphs of that version.
- **Del70** P. Deligne, *Équations différentielles à points singuliers réguliers*, Lecture Notes in
  Math. 163, Springer (1970).
- **FM12** B. Farb, D. Margalit, *A Primer on Mapping Class Groups*, Princeton (2012).
- **Kor02** M. Korkmaz, *Low-dimensional homology groups of mapping class groups: a survey*;
  [arXiv:math/0307111](https://arxiv.org/abs/math/0307111).
- **Hat02** A. Hatcher, *Algebraic Topology*, Cambridge (2002);
  [author copy](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf).
- **HS53** G. Hochschild, J.-P. Serre, *Cohomology of group extensions*, Trans. Amer. Math. Soc. 74
  (1953), 110–134.
- **Deb01** O. Debarre, *Higher-Dimensional Algebraic Geometry*, Universitext, Springer (2001).
- **Sik12** A. Sikora, *Character varieties*, Trans. Amer. Math. Soc. 364 (2012);
  [arXiv:0902.2589](https://arxiv.org/abs/0902.2589).
- **CR62** C. W. Curtis, I. Reiner, *Representation Theory of Finite Groups and Associative Algebras*,
  Interscience (1962).
- **Wat89** W. C. Waterhouse, *Two generators for the general linear groups over finite fields*,
  Linear and Multilinear Algebra 24 (1989), 227–230.
- **Nie24** J. Nielsen, *Die Isomorphismengruppe der freien Gruppen*, Math. Ann. 91 (1924), 169–209.
- **MKS04** W. Magnus, A. Karrass, D. Solitar, *Combinatorial Group Theory*, second edition, Dover
  (2004).
- **Mor89** S. Morita, *Families of Jacobian manifolds and characteristic classes of surface bundles
  I*, Ann. Inst. Fourier 39 (1989), 777–810.
- **Mor93** S. Morita, *The extension of Johnson's homomorphism from the Torelli group to the mapping
  class group*, Invent. Math. 111 (1993), 197–224.
- **BGMW17** I. Biswas, S. Gupta, M. Mj, J. P. Whang, *Surface group representations in `SL₂(ℂ)` with
  finite mapping class orbits*; [arXiv:1707.00071v4](https://arxiv.org/abs/1707.00071v4).
- **KS16** T. Koberda, R. Santharoubane, *Quotients of surface groups and homology of finite covers
  via quantum representations*, Invent. Math. 206 (2016);
  [arXiv:1510.00677](https://arxiv.org/abs/1510.00677).
- **BKMS18** I. Biswas, T. Koberda, M. Mj, R. Santharoubane, *Representations of surface groups with
  finite mapping class group orbits*, New York J. Math. 24 (2018);
  [arXiv:1702.03622](https://arxiv.org/abs/1702.03622).
- **LL19** B. Lawrence, D. Litt, *Representations of surface groups with universally finite mapping
  class group orbit*; [arXiv:1907.03941v3](https://arxiv.org/abs/1907.03941v3).
- **Kat96** N. M. Katz, *Rigid Local Systems*, Annals of Mathematics Studies 139, Princeton (1996).

### Corrections to the sources

The following statements of the sources are corrected in the targets cited.

- Landesman–Litt, Lemma 2.0.1, p. 12: the second fundamental group is `PMod(g, n + 1)`, not
  `PMod(g, n)`; the kernel of `PMod(g, n + 1) → PMod(g, n)` is the `n`-punctured surface group (§2.4).
- Landesman–Litt, Lemma 2.2.2, pp. 14–15: the projective extension is unique only among extensions
  whose values are classes of actual intertwiners; the `Q₈ × C₂` check of §3.4 shows arbitrary
  extensions are not unique. The authors' erratum deletes the uniqueness clause.
- Landesman–Litt, Proposition 2.3.4, pp. 16–18: the obstruction is first killed in
  `H¹(Q, H¹(N, μ))` and only then as an inflated class from `H²(Q, μ)`, after a second application
  of the killing lemma; the killing lemma is used in the pointed form of §4.1, so the based fibre
  survives (the authors' erratum gives the pointed form).
- Landesman–Litt, Lemma 2.4.2, pp. 19–20: the hypothesis `g ≥ 1` is needed, since the proof uses
  Corollary 2.3.5 (§4.5; the authors' erratum adds it).
- Landesman–Litt, §3.2, p. 21: the auxiliary map `d_n` is defined and injective only for `n ≥ 1`,
  the range in which the proof of Proposition 3.2.1 uses it (§1.3).
- Landesman–Litt, §4.1 and proof of Theorem 4.1.1, pp. 24–25: admissibility of real variations is
  said to be analogous to the rational case, and the proof appeals to Saito's mixed Hodge modules,
  which assume quasi-unipotent local monodromy; for a unitary `V` the local monodromy of
  `R¹π°_* V_ℝ` need not be quasi-unipotent, and the limit filtration in the admissibility conditions
  is that of the limit theorem for arbitrary polarizable complex variations on the punctured disc
  (§5.4, with the rotation check).
- Landesman–Litt, Lemma 7.2.5, p. 36: the boundary-replaced cover has genus `g′`, not `g` (§6.3).
- Landesman–Litt, Theorem 8.5.3, p. 43: Lemma 8.5.2 needs a connected finite-type family of actual
  fixed-determinant representations; §8.3 takes the connected component of the representation scheme
  containing the nonabelian Hodge deformation (§§1.4, 5.8).
- Landesman–Litt, Lemma 8.6.1, p. 44: the finite-index subgroup must stabilize the actual class of
  `ρ` and the covering data, not only the constituents of `Hom(ρ₂, ρ₁)` (§9.2).
- Landesman–Litt, Corollary 9.1.4, pp. 45–46: "integral PVHS" is read in the sense of §5.1, over the
  ring of integers of a number field unrelated to the base field, and the step (4) ⇒ (1) uses
  Landesman–Litt 2022, Theorem 1.2.5 (§10.3).
- Landesman–Litt, Example 9.2.3, pp. 48–49: surjections exist for every `p`, non-liftability only for
  `p ∤ m(r)` (§11.4; the authors' erratum restricts it).
- Landesman–Litt, Remarks 9.2.5–9.2.6, p. 49: non-flatness does not imply failure of the
  complete-intersection property (§11.6; the authors' erratum deletes the inference).
- Landesman–Litt, Example 10.1.6(2), p. 51: the augmentation sequence splits for `(g, n) = (1, 1)`;
  it is non-split exactly in the range `2g − 3 + n > 0` proved in §12.3.
- Landesman–Litt, Proposition 8.2.1 and Lemma 8.3.3, pp. 39–40: Proposition 8.2.1 gives strong
  rigidity only; rigidity follows after quasi-unipotence of local monodromy (§§5.9, 7.4; the authors'
  erratum fixes the order), and the compactification needs a log resolution after normalization
  (§7.2).
- Aramayona–Souto, proof of Lemma 2.5, p. 11: the restriction of the induced representation contains
  `ρ` as a direct summand; it is not a sum of copies of `ρ` (§7.1, with the `A₃ ⊂ S₃` check).
- Landesman–Litt 2022, Corollary 6.1.2, p. 35, and its special case Corollary 1.3.6, p. 7: for
  reducible monodromy the deformed parabolic bundle need not be semistable; the conclusion needs
  irreducible monodromy or a flat filtration with irreducible graded pieces of equal parabolic slope,
  which the parabolic Deligne extension always has. `O(p) ⊕ O(−p)` with the connection `d` on a
  once-pointed genus-one curve, and a coarsened structure on the canonical lattice of a sum of two
  unitary characters, are counterexamples in rank two (§5.3). The reduction to irreducible
  monodromy in the proof (§6.4.10, p. 49) assumes equal slopes; Theorem 1.2.12 uses only the
  parabolic Deligne extension and stands (§5.11).
- Landesman–Litt 2022, Lemma 7.5.1, p. 53: the statement needs a nonabelian fundamental group,
  since torsion characters of the torus and of the annulus are dense; §11.5 states it in the
  hyperbolic range.
