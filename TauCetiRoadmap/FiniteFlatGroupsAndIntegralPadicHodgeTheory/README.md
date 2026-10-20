# Roadmap: finite flat group schemes and integral `p`-adic Hodge theory

**Summary.** This roadmap develops the arithmetic theory of finite flat commutative group schemes
and `p`-divisible groups, and the integral `p`-adic Hodge theory that classifies them by semilinear
algebra. It starts from Tau Ceti's finite locally free commutative group schemes over an affine base
with Cartier duality, from ModularCurves' finite locally free group schemes and descent, and from
the Barsotti–Tate interface of AbelianSchemesAndArithmeticModuli. Layer R07.1 builds the structure
theory, preceded by finite-`K` interfaces to the supplied period structures and rational
realization predicates, integral coefficient predicates and labelled Sen theory of §§R07.P2–R07.P5a and R07.P7.1–R07.P7.5: group Frobenius and Verschiebung,
étale and multiplicative groups and their rigidity, the general theory of `p`-divisible groups (levels, Cartier duality, Tate modules, connected–étale sequences,
truncations), formal Lie groups and dimension, Tate's Hodge–Tate decomposition and his generic-fibre
theorem, schematic closures and finite flat models, Raynaud's uniqueness theorem for `e < p − 1`,
his classification of `F`-vector schemes and his bound on tame inertia, the Oort–Tate classification
of groups of prime order, gluing over rings of `S`-integers, Raynaud's embedding into abelian
schemes and flat descent. Layer R07.G develops global admissible groups over `ℤ[1/P]`,
their marked quasi-finite models over `ℤ`, their cohomology, global purity and dyadic amalgams.
Layer R07.2 is Dieudonné theory: the classification of finite commutative
`p`-group schemes and `p`-divisible groups over a perfect field, slopes and the Dieudonné–Manin
classification, the Hasse invariant of a `BT₁`, smoothness of the stacks of truncated Barsotti–Tate
groups, universal covers, and Dieudonné theory over smooth bases, semiperfect rings and perfect
valuation rings. Layer R07.3 is Fontaine–Laffaille theory over `W(k)`, preceded by the filtered `(φ, N)`-modules, weak admissibility and Fontaine's admissibility results it needs. Layer R07.4 is
Breuil–Kisin theory: Kisin modules, the field of norms of the Kummer tower and étale `φ`-modules,
Kedlaya's slope filtration, Kisin's classification of crystalline and semistable lattices (which
proves that weakly admissible modules are admissible), the classification of `p`-divisible groups
and finite flat group schemes over `𝒪_K` for every `p`, integral comparisons, Wach modules,
coefficients and Savitt's weight-two descent data. Layer R07.5 computes local residual types: tame
inertia on the torsion of elliptic curves, peu and très ramifiée representations, Serre's
finite-flat criterion, Savitt's residual types for tame potentially Barsotti–Tate representations,
peu ramifié classes and Serre weights. Layer R07.6 draws the deformation-theoretic and ramification
consequences: torsion of abelian schemes, Fontaine's ramification bound, Illusie's obstruction
theory, the flat deformation condition and its tangent space, Raynaud's determinant theorem and the
cyclotomic image lemma used in modularity proofs.

Every object keeps its scheme structure: orders and degrees are ranks of finite locally free
algebras, never point counts, and every statement over a discrete valuation ring says whether it
needs mixed characteristic, the bound `e < p − 1`, `p > 2`, or a perfect residue field. Every
comparison carries its variance and normalisation: Dieudonné modules are contravariant, the
Hodge–Tate weight of the cyclotomic character is `+1`, Kisin's functors are contravariant, and the
Fontaine–Laffaille functor is contravariant with its safe interval `[0, p − 2]`.

| Layer | Title | Headline targets |
| --- | --- | --- |
| R07.P | Finite-`K` periods and labelled Sen theory | `aCris`, `bCris`, `dCris`, `dDeRham`, `IsCrystalline`, `IsDeRham`, `GaloisRep.deRhamSupplierEquiv` |
| R07.1 | Finite flat group schemes and `p`-divisible groups | `frobeniusHom`, `etaleGroupEquivContAction`, `multiplicativeTypeRigidity`, `BarsottiTate.tateModule`, `BarsottiTate.connectedEtale_exact`, `TruncatedBT.of_exact`, `FormalLieGroup`, `BarsottiTate.hodgeTate`, `BarsottiTate.extend_genericFibre`, `Prolongation`, `prolongation_unique_of_lt`, `tameInertiaIso`, `FVectorScheme`, `tameInertia_exponents_le`, `oortTate_classification`, `raynaudAbelianEmbedding` |
| R07.G | Global admissible groups | `admissible-global-models`, `admissible-geometric-lengths`, `admissible-cohomology-bound`, `admissible-rank-one-global`, `admissible-global-purity`, `dyadic-D-model`, `dyadic-finite-flat-amalgam` |
| R07.2 | Dieudonné theory | `canonicalDecomposition`, `DieudonneRing`, `dieudonneEquivalenceFinite`, `dieudonnePDivisible`, `dieudonneManinClassification`, `isogenyClassification`, `hasseInvariant`, `btStackSmooth`, `BarsottiTate.universalCover`, `deJongDieudonneEquivalence` |
| R07.3 | Filtered modules and Fontaine–Laffaille theory | `FilteredPhiNModule`, `FilteredPhiNModule.IsWeaklyAdmissible`, `dSt_isWeaklyAdmissible`, `FLModule`, `flExactFaithful`, `flTameInertia`, `flFullFaithfulness`, `flAdmissibility`, `flFiniteFlatDictionary` |
| R07.4 | Breuil–Kisin modules | `KisinModule`, `kummerFieldOfNorms`, `kedlayaSlopeFiltration`, `kisinCrystallineEmbedding`, `semistableFiniteHeight`, `crystalline01IsBt`, `kisinPDivisibleClassification`, `dyadicClassification`, `bmsKisinFunctor`, `descentDataLatticeClassification` |
| R07.5 | Local residual types | `formalGroupTorsionInertia`, `supersingularTorsionInertia`, `IsPeuRamifiee`, `finiteFlatWeightTwoCriterion`, `savittResidualTypes`, `flResidualWeights`, `peuRamifieH1`, `SerreWeight` |
| R07.6 | Deformation and ramification consequences | `abelianSchemeTorsionFiniteFlat`, `fontaineRamificationBound`, `illusieObstructionHomomorphisms`, `flatDeformationTangentSpace`, `raynaudDetTateModule`, `cyclotomicImageStability` |

## Scope and ownership

**Owned here.** The flat-affine extension of Frobenius and Verschiebung of commutative group schemes;
the group-object applications of the supplied finite étale Galois-category equivalence;
the finite part of a quasi-finite group over a henselian base; rigidity of homomorphisms into étale
and out of multiplicative groups. The general
theory of `p`-divisible groups of arbitrary height over arbitrary bases beyond the basic interface
listed below: homomorphisms as inverse limits, the levels as torsion, Tate modules and their
pairing, the connected–étale sequence over a henselian local base, exact-sequence and coLie
recognition on the supplied truncated Barsotti–Tate carrier, formal Lie groups and the Serre–Tate
equivalence with connected `p`-divisible groups, dimension and the identity `dim G + dim G^D = h`, discriminants, invariant differentials and
Raynaud's absolute different, Tate's Hodge–Tate decomposition, closures of
generic subgroups and Tate's generic-fibre theorem. Finite flat models over Dedekind bases:
schematic closure, simple objects, prolongations and their order, Raynaud's uniqueness theorem and
the boundary case `e = p − 1`, `F`-vector schemes and their classification, the Jordan–Hölder
factors over a strictly henselian base, Raynaud's bounds on tame inertia and on the determinant, the
Oort–Tate classification over a ring and over rings of integers, the Katz–Mazur groups, orthogonals
of schematic closures, gluing from a completion and a localisation, and the Mayer–Vietoris sequence
for `Hom` and `Ext¹`. Global admissible groups, their marked quasi-finite models over `ℤ`,
geometric-fibre lengths and fppf cohomology bound; global rank-one classification, the
finite-flat application of the supplied cyclotomic class-group obstruction and global Ext
vanishing, odd purity, and the dyadic `D`-model and finite-flat amalgams. Raynaud's embedding into abelian schemes, lifting along henselian pairs and flat
descent of `p`-divisible groups. Dieudonné theory: the canonical decomposition, the
multiplicative–connected–étale filtration, finite Witt group schemes, the Dieudonné ring and the
classification of finite commutative `p`-group schemes and of `p`-divisible groups over a perfect
field, Galois descent, tangent spaces and Lie algebras, the standard and elliptic examples, slopes,
the integral consequences of the imported Dieudonné–Manin classification and the isogeny
classification, `α_p`-filtrations,
Frobenius-fixed Witt vectors and the descent of characteristic polynomials, the covariant module and
the dictionary between conventions, the Hasse invariant and Hasse–Witt duality of a `BT₁`,
smoothness of the stacks of `BT_n`, universal covers, and Dieudonné theory over smooth bases (de
Jong), over `f`-semiperfect rings (Scholze–Weinstein) and over perfect valuation rings (Berthelot).
Filtered `(φ, N)`-modules, their Hodge and Newton numbers, weak admissibility and Fontaine's theorem
that semistable representations give weakly admissible modules. Fontaine–Laffaille theory over
`W(k)` for any perfect `k`. Breuil–Kisin theory, including the Robba ring and Kedlaya's slope
filtration theorem in the form Kisin uses, the field of norms of the Kummer tower, Kisin's
classification of crystalline and semistable lattices with its proof of the Colmez–Fontaine theorem,
Breuil's `S`-modules, the classification of `p`-divisible groups and finite flat group schemes over
`𝒪_K` (with the dyadic case), Breuil–Kisin modules with torsion and the all-weight Kisin functor,
integral comparisons with the Dieudonné crystal, Wach modules, coefficients and Savitt's weight-two
descent data. The local residual types of R07.5 and the consequences of R07.6.

SchemeAndStackFoundations §0.29 supplies absolute, relative and finite-field `q`-power
scheme Frobenius, with arbitrary-base twists, naturality, products, base change and
coherent iterates. These maps are independent of group structure, étale cohomology and
Galois actions. Its §0.23 supplies universal-homeomorphism criteria and §§0.24–0.26
supply perfection. EtaleCohomologyFoundations §§F.10.1–F.10.2 and `F`.10.2b supply the
Galois and cohomological Frobenius conventions and their bridge to scheme pullback.

**Imported from Tau Ceti and its roadmaps, never planned here.**

- Tau Ceti's finite locally free commutative affine group schemes over `Spec R`
  (`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`), Cartier duality on them with biduality,
  base change and preservation of the rank function, and the finite constant and diagonalizable
  groups with their Cartier duality (`ℤ/N ↔ μ_N`); the exact declarations are listed under *Exact
  supplier contracts*.
- TauCetiRoadmap.ModularCurves: Layer 0B (the finite locally free carrier over any base, kernels,
  constant and diagonalizable groups, Cartier duality with evaluation, biduality, rank and base
  change, and the theorem that a group of rank `N` is killed by `N`), Layer 0C (fppf quotients by
  finite locally free subgroups), Layer 0D (the field-valued finite étale/Galois-set dictionary
  and transport of group objects), Layer 0E (effective descent for finite locally free schemes,
  groups and morphisms) and Layer 7E (the elliptic tower `E[p^∞]`, the finite-level connected–étale
  sequence over a henselian local ring with its special-fibre splitting over a perfect residue
  field, Frobenius and Verschiebung of elliptic curves, supersingular Frobenius kernels and the two
  `p`-divisible groups of an elliptic curve over an algebraically closed field). ModularCurves
  schedules neither Dieudonné theory nor the Oort–Tate classification; both are owned here.
- TauCetiRoadmap.LocalFieldsRamification: Layer 3 (Herbrand functions, upper numbering and the
  different for finite residue fields; PadicPeriodRings §2 owns the mixed-characteristic
  perfect-residue extension, and §R07.6.1a owns its equal-characteristic counterpart) and
  Layer 4 (the tame quotient `I_K/P_K ≅ lim_{p ∤ m} μ_m` and the tame character,
  which Tau Ceti implements as `TauCeti.inertiaTameCharacter` and
  `TauCeti.quotientWildInertiaSubgroupEquiv`). §R07.1.26 keeps only what lies beyond Layer 4:
  the tame quotient for arbitrary perfect residue fields and its agreement with that carrier.
  ArithmeticGaloisRepresentations §2.3 owns the finite-residue fundamental characters and their
  Frobenius, norm and cyclotomic facts; §R07.1.26 supplies their perfect-residue generalisation
  and agreement theorem.
- TauCetiRoadmap.EllipticCurves Layer 4 (the Tate curve), TauCetiRoadmap.ProfiniteCohomology Layer 9
  (Hilbert `90` and Kummer theory) and TauCetiRoadmap.ClassFieldTheory Layers 5, `7` and `11` (local Tate
  duality and the local and global Artin maps); ClassFieldTheory Layer 11 (global Artin reciprocity) and GlobalNumberFields
  Layers 9–10 supply the global character and Hecke infinity-type inputs of §R07.P7.3.

**Imported from the arithmetic-geometry and representation-theory roadmaps.**

- AbelianSchemesAndArithmeticModuli §A4.5 owns the carrier `BarsottiTate S p h` of `p`-divisible
  groups with its truncation, Cartier dual and biduality, base change, the tower `A[p^∞]` of an
  abelian scheme, and the connected–étale sequence over a perfect field or over a complete henselian
  local base whose connected parts are finite flat at every level. Every `p`-divisible group below
  is this carrier; the targets of R07.1 that touch the same objects add only what is stated in them
  (homomorphisms as limits, the standard examples, the connected–étale sequence over an arbitrary
  henselian local base, Tate modules). §A4.5a owns the shared `TruncatedBT S p n` carrier for
  prime `p` and `n ≥ 1`, its height, base change, effective fppf descent, Cartier duality,
  restriction and full-tower truncation. It also supplies the canonical Frobenius and
  Verschiebung of finite locally free commutative groups in characteristic `p`, with naturality,
  base change and `VF = [p] = FV`. Every truncated Barsotti–Tate group below uses this carrier;
  §R07.1.10 adds exact-sequence recognition, and §R07.1.11 adds coLie and fibrewise recognition.
  §A3.2 `multiplicationAndDensity` supplies finite locally free
  `A[n]` of rank `|n|^{2g}` for integers `n ≠ 0`,
  with arbitrary base change, and §A4.5 `BarsottiTate.ofAbelian` supplies its height-`2g` tower.
- CrystallineCohomology §CR.4.7, *Slope decomposition on the existing isocrystal carrier*,
  owns standard cyclic blocks, the full Dieudonné–Manin classification over algebraically closed
  fields, different-slope `Hom` vanishing and slope descent to perfect fields. §CR.7.3 owns
  relative crystalline direct images; DerivedDeRhamCohomology §§PD.1–PD.7 own divided-power
  envelopes and universal thickenings.
- AbelianSchemesAndArithmeticModuli §A4.CR.7.2 owns the crystalline Dieudonné crystal of a
  Barsotti–Tate group, its variance, Frobenius, Verschiebung and twists, and Grothendieck–Messing
  deformation theory. Its public namespace is `TauCetiRoadmap.CrystallineCohomology`. The classical
  Dieudonné theory of R07.2 over a perfect field evaluates this crystal at `W(k)`; §R07.2 owns the
  classification theorems.
- PadicPeriodRings owns the early period-ring foundations: the completed algebraic closure,
  its continuous Galois action, normalized traces, Tate fixed points and twists (§§1–2),
  the principal `O_C` envelope, presentation, completion, `θ_cris` and logarithm (§3),
  and the general-base topological period carriers, actions, invariant functors, rational
  predicates, fixed fields, regularity and underlying fundamental sequence (§§4.1–4.3).
  Its §2 also owns mixed-characteristic perfect-residue Herbrand theory, the different and
  the completed maximal unramified filtration comparison used in §R07.6.
  Sections R07.P2–R07.P5 import their finite-`K` specializations and supply the
  crystalline-to-de Rham implication. Section R07.P3 specializes the continuous sections,
  both period-sequence long exact sequences and `blochKatoExp` supplied by
  PhiGammaModulesAndIwasawaCohomology §5.7 to the finite-flat realization interfaces.
  Section R07.P5a owns the integral coefficient predicates. Sections R07.P7.1–R07.P7.5 give finite-coefficient de Rham and
  Hodge–Tate adapters, labelled Sen theory, character criteria and lifting applications.
  Section R07.3.3a owns the general-ring filtered Frobenius carrier; §R07.3.4 specializes its
  generating objects to `W(k)`, with Fontaine–Laffaille's contravariant realization in §R07.3.7.
  Section R07.3.0 compares the finite-`K` crystalline and semistable realizations with
  PadicPeriodRings §§4.1–4.3, preserving topology, structure maps and variance.
- DerivedModuleAlgebra (the full cotangent complex, §0.4, and its transitivity triangle,
  §0.8), SchemeAndStackFoundations §4.1 (thickenings, formally smooth and formally étale morphisms
  and the infinitesimal lifting criterion), EtaleCohomologyFoundations §F.0.2
  (`VanishingCycles.finiteEtaleGaloisCategory`) (finite étale covers of a connected nonempty
  scheme, their Galois-category structure and geometric fibre functors),
  SchemeAndStackFoundations §0.14 `henselian_smooth_lifting` (smooth sections along henselian
  pairs), and PurityOfBranchLocus §2.1
  (purity of the branch locus, SGA 1 `X` 3.1, Stacks Tag 0BMB) and §2.2
  (the global corollary for finite normal covers with dominant components over regular bases),
  ArithmeticGaloisRepresentations §2.3 (finite-residue fundamental characters and residual tame
  inertia) and Layer 6 (Tate modules of elliptic curves), and the smooth and
  compact induction of SmoothRepresentationsOfLocalGroups Layer SR.2.

**Not built here.** The general theory of displays (Zink), the Norman–Oort deformation theory of
`p`-divisible groups with polarisations and the polarised `O`-displays of PEL moduli belong to the
moduli roadmaps that use them (PELModuli). Finite flat models with descent data in the sense of
Breuil–Conrad–Diamond–Taylor beyond Savitt's weight-two tame case, Kisin modules with tame descent
data, semistable strongly divisible modules in higher weights, and the weights `{0, p − 1}` and `{0, p}` belong to the deformation and modularity roadmaps that consume them
(LocalGaloisDeformationRings, EllipticCurveModularity and its Part II), built on the targets of
R07.1 and R07.4. The quotient supplied by §R07.1.20a is by a finite flat subgroup over a complete
DVR. General-base finite-subgroup quotients belong to HodgeTateAndCanonicalSubgroups;
quotients by sub-`p`-divisible groups in families, with exactness, base change and height
additivity, belong to IgusaVarietiesAndTorsionConcentration. Faltings' integral Hodge–Tate
complex, Fargues' degree function and canonical subgroups belong to HodgeTateAndCanonicalSubgroups.
LocalGaloisDeformationRings consumes the scalar
Fontaine–Laffaille theory of R07.3 and owns its common coefficient extension in §1.6: the shared
coefficient category, labelled factors and their Frobenius permutation, and the covariant
realization by lattice and Pontryagin duals. Section R07.6.7 uses only commuting finite-field
actions on the scalar category to calculate extension spaces. The generic deformation functors,
Schlessinger conditions and representing-ring consequences belong to LocalGaloisDeformationRings
F.1.1–F.1.4, F.2.5, F.3.1–F.3.2 and §4.1; none is an input to R07.6.7.
AutomorphicGaloisRepresentations and
PotentialAutomorphyInfrastructure consume these specializations for labelled weights and
automorphic applications; Serre's computation of the characters on `E[p]` for ramified
bases `e > 1` belongs to SerreWeightAndLevelOptimisation. The general `p`-adic comparison theorems
for varieties belong to PadicHodgeTheory, which imports the filtered modules, weak admissibility and
the Colmez–Fontaine theorem from here.

## Conventions

- **Finite locally free** means finite, flat and of finite presentation, as in ModularCurves Layer
  0B; over an affine base the objects are those of
  `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`. The **order** of a finite locally free group
  is the rank of its coordinate algebra (locally constant). An extension of `G` by `H` is an exact
  sequence `0 → H → X → G → 0` of fppf sheaves.
- A **`p`-divisible group of height `h`** is AbelianSchemesAndArithmeticModuli's `BarsottiTate S p h`: levels `G_v` of rank `p^{hv}` with `G_v = G_{v+1}[p^v]`. Its **dimension** is the dimension of
  the formal Lie group of its connected part, so `dim μ_{p^∞} = 1` and `dim ℚ_p/ℤ_p = 0`.
- **Tate modules** are `T_p G = lim_v G_v(K̄)` along multiplication by `p`, and Cartier duality
  gives `T_p(G^D) ≅ Hom(T_p G, ℤ_p(1))`.
- **Ramification index.** For a discrete valuation ring `R` of mixed characteristic `(0, p)` with
  normalised valuation `v`, `e = v(p)`. Raynaud's uniqueness theorem needs `e < p − 1`; there is no
  such case for `p = 2`. At `e = p − 1` uniqueness can fail: over `ℤ_p[ζ_p]`,
  `ℤ/p` and `μ_p` have isomorphic generic fibres and nonisomorphic integral models.
  In Lean this is `absRamificationIndex R p`, defined for every discrete valuation ring because
  Raynaud's theorems need neither completeness nor a finite residue field; for the ring of integers
  of a finite extension `K/ℚ_p` it equals Tau Ceti's `TauCeti.absoluteRamificationIndex K p`, which
  is defined only for such `K` (`TauCeti.absoluteRamificationIndex_eq_natCastValuation`).
  The extension of this definition has value `0` when `p` is a unit and also in equal
  characteristic `p`, where `v(0) = ⊤` is sent to `0` by `ENat.toNat`; the latter is a junk
  value, not a mixed-characteristic ramification index. In particular it does not remove
  the characteristic-zero hypothesis of Raynaud's generic-fibre statements.
- **Oort–Tate.** Pairs `(a, b)` satisfy `ab = w_p`, where `w_p` is the Oort–Tate constant (`p` times
  a unit of `Λ_p = ℤ[ζ_{p−1}, 1/(p(p−1))] ∩ ℤ_p`), and `G_{a,b} = Spec R[X]/(X^p − aX)`; Cartier
  duality swaps `a` and `b`.
- **Dieudonné modules are contravariant** (Demazure, Fontaine, Pink):
  `M(G_rl) = colim_n Hom(G_rl, W_n)` along postcomposition with Verschiebung `v`, and
  `M(G_ll) = colim_{n,m} Hom(G_ll, W_n^m)` along postcomposition with `v` and `i`
  (§R07.2.4); the multiplicative part is obtained by Cartier duality, `F` on `M(G)` comes from `F_G` and
  `V` from `V_G`. Then `M(ℚ_p/ℤ_p) = (W(k), F = σ)`, `M(μ_{p^∞}) = (W(k), F = pσ)`, `dim G = dim_k M/FM`, and `M_{a,b} = W[F, V]/(F^a − V^b)` has slope `b/(a + b)`: étale groups have slope `0` and
  multiplicative groups slope `1`. The covariant module is `M_cov(G) = M(G^D) ≅ M(G)^t`, with
  `M_cov(μ_{p^∞}) = (W, σ)`. This agrees with the evaluation at `W(k)` of the contravariant crystal
  of AbelianSchemesAndArithmeticModuli §A4.CR.7.2. For `σ_k(c) = c^p`, write `σ_k^*L = k ⊗_{k,σ_k} L`,
  so `1 ⊗ cℓ = c^p ⊗ ℓ`. The tangent comparison is
  `σ_k^*Lie(G) ≅ Hom_k(M/FM,k)`, or `Lie(G) ≅ (σ_k^{−1})^*Hom_k(M/FM,k)`;
  §R07.2.20 gives its scalar map and the ordinary `k`-linear covariant quotient.
- **Hodge–Tate weights.** The cyclotomic character has Hodge–Tate weight `+1`, so `V_p(μ_{p^∞}) = ℚ_p(1)` has weight `1` and the Tate module of a `p`-divisible group has weights in `{0, 1}`, with
  weight `1` of multiplicity `dim G`. Representation intervals, including
  `IsTorsionCrystalline` and `IsIntegralCrystalline`, use these Hodge–Tate weights. For
  crystalline `V`, `HT(V) ⊆ [a,b]` iff the filtration jumps of covariant `D_cris(V)` lie in `[-b,-a]`;
  the jumps of contravariant `D*_cris(V) = D_cris(V^∨)` lie in `[a,b]`.
- **Filtered `(φ, N)`-modules** are over `K₀ = W(k)[1/p]` with the filtration on `K ⊗_{K₀} D`; the
  Tate twist `D⟨r⟩` multiplies `φ` by `p^{−r}` and sets `Fil^i(D⟨r⟩) = Fil^{i+r}(D)`. With
  `D*_cris(V) = Hom_{G_K}(V, B_cris)`, `D*_cris(ℚ_p(1)) = K₀` with `φ = pσ` and its filtration jump
  in degree `1`; the covariant `D_cris(ℚ_p(1))` has `φ = p^{−1}σ` and its jump in degree `−1`.
- **Fontaine–Laffaille** theory is that of Fontaine and Laffaille over `W(k)` (`e = 1`, `π = p`):
  `Fil^i` with `σ`-semilinear `φ^i` and `φ^i|_{Fil^{i+1}} = p φ^{i+1}`; `MF_tor^{[a,b]}` means
  `Fil^a = M` and `Fil^{b+1} = 0`. The functor `U_S` is contravariant, a filtration jump in degree
  `i` in `[0,p−1]` gives the character `ω^i` on inertia, and the torsion functor is fully faithful
  on `[0, p − 2]`.
  For a translated safe interval use `U_[a,b](M) = U_S(M(−a))(a)` (§R07.3.3a).
- **Breuil–Kisin** theory follows Kisin: `𝔖 = W(k)⟦u⟧` with `φ(u) = u^p`, `E(u)` the Eisenstein
  polynomial of a fixed uniformiser `π` of `K` (totally ramified of degree `e` over `K₀`),
  `π_{n+1}^p = π_n` and `K_∞ = ⋃_n K(π_n)`. Kisin's functors are contravariant: `D = Hom_{G_K}(V, B⁺_cris)`, `V_𝔖(𝔐) = Hom_{𝔖,φ}(𝔐, 𝔖^ur)` and `G ↦ 𝔻(G)(S)`. The introduction of Kisin's 2006 paper
  uses the opposite sign for Hodge–Tate weights in its Theorem (0.1) and the paragraph before
  Theorem (0.3); the body of the paper and everything here use `HT(χ) = +1`. Kisin's 2009 paper
  composes with Cartier duality to make its finite-flat functor covariant; each target says which
  normalisation it uses. Breuil–Kisin modules with torsion follow Bhatt–Morrow–Scholze, and for a
  `p`-divisible group `H` their module is `M(H) = 𝔐(T_p(H)^∨)`.
- **Ramification** follows Fontaine 1985: `v_K(K^×) = ℤ`, `i_{L/K}(g) = v_K(a_g)` and `G^{(u)} = G^{u−1}` in Serre's upper numbering; "`G_K^{(u)}` acts trivially for `u > e(n + 1/(p − 1))`" is
  the form of the bound.
- **Tame inertia** follows Serre: `I_t = I_K/P_K` with `θ : I_t ≅ lim_d μ_d`; the fundamental
  characters of level `n` are `θ_{p^n−1}` composed with the embeddings of `F_{p^n}`, and the mod-`p`
  cyclotomic character is `θ_{p−1}^e` on `I_t`. For a representation over `𝔽̄_p`, "finite at `p`"
  means that a finite coefficient model over `k/𝔽_p` has a finite flat `ℤ_p`-model with `k`-action;
  for odd `p`, this is independent of the model and coefficient enlargement (§R07.5.6a). Peu and très
  ramifiée are Serre's, defined in the extension-sensitive case `β = α + 1`.
- **Truncated Barsotti–Tate groups** follow Illusie (flat over `ℤ/p^n`, with `ker F = im V` for `n = 1`). The Hasse invariant of a `BT₁` is `Ha(G) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)})`.
- **Universal covers** follow Scholze–Weinstein: `G̃ = lim_p G` on `Nilp_R^op`, and `G̃ = T_p G[1/p]` as sheaves.
- **Carriers at the pins.** `Suggested.lean` states the targets whose carriers exist at the pinned
  Mathlib and Tau Ceti. SchemeAndStackFoundations §0.29 supplies
  `SchemeFrobenius.SchemeCharP` on general schemes, with scheme morphisms and pullbacks
  for the absolute, relative and iterated constructions.
  The group part of Layer R07.1 works over an affine base with `FLF R` (Tau Ceti's finite
  locally free commutative group schemes over `Spec R`), its order `rank` (the order over a local
  base), the predicates `IsEtale`, `IsMultiplicative` (étale Cartier dual) and `IsConnectedLocal`
  (local coordinate algebra, which is connectedness over a henselian local base), the generic fibre
  `genericFibre`, finite flat models `Prolongation` with `Prolongation.Dominates`, and the
  ramification index `absRamificationIndex`; its test objects are Tau Ceti's finite constant groups
  `TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme` and diagonalizable groups
  `TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme` (so `μ_p = D(ℤ/p)`). The statements
  there are `isMultiplicative_cartierDual_iff` (§R07.1.7 at finite level; that duality preserves the
  order is Tau Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat.finrank_cartierDual`),
  `isEtale_of_isUnit_rank` (§R07.1.2, over a local base),
  `rank_eq_one_of_isEtale_of_isConnectedLocal` (§R07.1.9 at finite level), `rank_genericFibre`,
  `schematicClosure_flat` (§R07.1.20), `Prolongation.self`, `Prolongation.dominates_unique` and
  `Prolongation.exists_max_min` (§R07.1.24), `prolongation_unique_of_lt` and
  `genericFibre_map_bijective` (§R07.1.30) and `isEtale_or_isMultiplicative_of_rank_eq` (§R07.1.34
  over `ℤ_p`), with the checks named in those sections. Layer R07.2 has `DieudonneModule` with its
  category structure, the standard modules `DieudonneModule.qpZp` and `DieudonneModule.muPInfty`,
  `DieudonneModule.imageF`, `frobeniusTwist`, the category `PGroup` of finite commutative
  `p`-group schemes, `dieudonneEquivalenceFinite` (§R07.2.8, stated as the existence of a fully
  faithful functor with the length, étaleness and essential-image properties) and `padicConstants`
  with `frobenius_eq_self_iff` and `exists_padic_charpoly`. Layer R07.3 has `FilteredPhiNModule`
  with `FilteredPhiNModule.Hom`, `FilteredPhiNModule.IsEffective`, `FilteredPhiNModule.tH` and
  `FilteredPhiNModule.nilpotent_N`, and `FLModule` with `FLModule.Hom`, `FLModule.IsTorsion` and
  `FLModule.IsTorsionIn`. Layer R07.4 has `Sfrak`, `frob`, `Eisenstein` with
  `eisensteinUnramified` and `Eisenstein.not_isUnit`, `KisinModule` with `KisinModule.HeightLE`,
  `KisinModule.Hom`, `KisinModule.rankOne` and `KisinModule.unit`, and `SemilinearDescentData`.
  Layer R07.5 has `IsPeuRamifieeClass` (the case `L = ℚ_p`, `χ̄ = 1` of §R07.5.13) and the labels
  `SerreWeights.Label` of the Serre weights of `GL₂(F_p)`.
- **Lean names.** Names are relative to the topic namespaces `FiniteFlat` (Layers R07.1, R07.5,
  R07.6), `Dieudonne` (R07.2), `FontaineLaffaille` (R07.3, with the filtered modules of
  §R07.3.1–§R07.3.3), `BreuilKisin` (R07.4) and `SerreWeights` (§R07.5.15), all inside
  `TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory`.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3`)

`IsDiscreteValuationRing` with `IsDiscreteValuationRing.addVal`, `HenselianLocalRing`,
`IsLocalRing`, `IsNoetherianRing`, `IsDedekindDomain`, `IsIntegrallyClosed`, `IsFractionRing`,
`IsAdicComplete`, `AdicCompletion`, `Localization.Away`, `Module.Free`, `Module.Finite`,
`Module.Projective`, `Module.finrank`, `Module.length`, `Algebra.Etale`, `Algebra.QuasiFinite`,
`Algebra.discr`, `KaehlerDifferential`, `differentIdeal` (for the extension `O_L/O_K` only; it is
not the absolute different of a Hopf algebra), `IsRegularLocalRing`, `DividedPowers`,
`MvPowerSeries`, `PowerSeries` with `PowerSeries.expand`, `LaurentSeries`,
`Polynomial.IsEisensteinAt`, `Matrix.charpoly`, `MvPolynomial.homogeneousSubmodule`, `PerfectField`,
`PerfectRing`, `frobenius`, `Valued`, `IsKrasner.krasner`, `Field.absoluteGaloisGroup`,
`continuousCohomology` (on Mathlib's topological representations `TopRep`), `PadicInt` with
`PadicInt.irreducible_p`, `Padic` with `Padic.valuation`, `PadicComplex`, `CommAlgCat.FiniteEtale`
(no `GaloisCategory` instance at the pin) and `CategoryTheory.PreGaloisCategory.functorToContAction`
(which needs `[GaloisCategory C]` and `[FiberFunctor F]`). Witt vectors: `WittVector`,
`TruncatedWittVector` (the carrier of `W_n(R)`, not the group scheme), `WittVector.frobenius`,
`WittVector.verschiebung`, `WittVector.frobeniusEquiv`, `WittVector.map`, `WittVector.equiv`
(`W(F_p) ≅ ℤ_p`), `WittVector.frobenius_zmodp`, `WittVector.irreducible` and
`WittVector.isDiscreteValuationRing`, `WittVector.FractionRing.frobenius`, and the isocrystals
`WittVector.Isocrystal`, `WittVector.StandardOneDimIsocrystal` with
`WittVector.isocrystal_classification` (rank one over an algebraically closed field). Perfectoid
inputs: `PreTilt`, `WittVector.fontaineTheta`, `BDeRhamPlus`, `BDeRham`. Elliptic curves:
`WeierstrassCurve.HasGoodReduction`. Formal groups: `FormalGroup` (one-dimensional formal group
laws) with `FormalGroup.IsComm`.

### From Tau Ceti (pinned at `a91d3aa`)

- **Finite locally free commutative group schemes over an affine base.**
  `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat` with `coordinateHopfAlgebra`, `cartierDual`,
  `cartierDualDualIso` (biduality) and `cartierDuality`
  (`TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean`);
  `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.baseChangeFunctor` and
  `cartierDualBaseChangeIso` (`…/CartierDuality/BaseChange.lean`);
  `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.finrank_cartierDual`
  (`…/CartierDuality/Rank.lean`: Cartier duality preserves the whole locally constant rank function,
  with no hypothesis on the base). Every finite flat group over `Spec R` in this roadmap is an
  object of this category, and the Lean abbreviation `FLF R` names it.
- **Constant and diagonalizable finite groups.**
  `TauCeti.ConstantGroup.finiteLocallyFreeGroupScheme R Γ` (the constant group of a finite
  commutative group `Γ`, coordinate algebra `Map(Γ, R)`) and
  `TauCeti.DiagonalizableGroup.finiteLocallyFreeGroupScheme R M` (`D(M) = Spec R[M]` for a finite
  object `M` of `TauCeti.FGCommGrpCat`, so that `μ_N = D(ℤ/N)`), with the dualities
  `TauCeti.ConstantGroup.cartierDualIso` and `TauCeti.DiagonalizableGroup.cartierDualIso`
  (`…/CartierDuality/Constant.lean`). They are the test objects of the Lean predicates of Layer
  R07.1.
- **Further group schemes.** `TauCeti.multiplicativeTypeCommHopfAlgProperty` (groups of
  multiplicative type over a field), `TauCeti.AlphaP.CoordinateRing` (the Hopf algebra `R[x]/(x^p)`
  of `α_p` in characteristic `p`) and `TauCeti.RootsOfUnityGroup.groupScheme` (`μ_n` as a group
  scheme over `Spec R`).
- **Local fields.** `TauCeti.inertiaTameCharacter` and `TauCeti.quotientWildInertiaSubgroupEquiv`
  (`NumberTheory/LocalField/Tame/Character.lean`), the tame character of LocalFieldsRamification
  Layer 4; `TauCeti.LocalFieldsRamification.lowerRamificationGroup`,
  `TauCeti.LocalFieldsRamification.upperRamificationGroup`,
  `TauCeti.LocalFieldsRamification.herbrand` and `TauCeti.differentExponent`, the ramification
  groups, Herbrand function and different exponent of LocalFieldsRamification Layer 3;
  `TauCeti.absoluteRamificationIndex K p` for a finite extension `K/ℚ_p`
  (`TauCeti.FinitePadicExtension`), with `TauCeti.absoluteRamificationIndex_eq_natCastValuation` and
  `TauCeti.absoluteRamificationIndex_padic`. The Lean `absRamificationIndex R p` of this roadmap is
  defined for every discrete valuation ring and agrees with it on rings of integers (Conventions).
- **Tate modules.** `TauCeti.TateModule p A` of an abelian group `A` with
  `TauCeti.TateModule.mapLinearMap` (`Algebra/Module/Torsion/TateModule.lean`), and
  `TauCeti.PadicTateTwist p K` for `ℤ_p(1)` (`RingTheory/RootsOfUnity/PadicTateTwist.lean`).

### From TauCetiRoadmap.ModularCurves, LocalFieldsRamification, EllipticCurves, ProfiniteCohomology and ClassFieldTheory

- **ModularCurves.** Layers 0B, `0C, 0D, 0E` and `7E` as listed under *Scope and ownership* (`0D`, the
  equivalence between finite étale schemes over a field and finite continuous Galois sets, is used
  in §R07.1.23). Nothing in this roadmap assumes more of them than is stated there; in particular
  the finite-level connected–étale sequence of `7E` is used over henselian local rings, and its
  splitting only on the special fibre over a perfect residue field.
- **LocalFieldsRamification.** Layer 3 (the lower and upper numbering, Herbrand's functions, the
  different for finite residue fields) and Layer 4 (the tame character `I_K/P_K ≅ lim μ_m` and its Frobenius twist).
- **EllipticCurves.** Layer 4 (the Tate curve `E_q` and its `p`-torsion).
- **ProfiniteCohomology.** Layer 9 (Hilbert `90` and Kummer theory for local fields).
- **ClassFieldTheory.** Layer 5 (local Tate duality, its target `tateDualityPairing_perfect_mixed`),
  Layer 7 (the local Artin map) and Layer 11 (global Artin reciprocity), used in §R07.1.35 and
  §R07.5.14; Layer 11 (global Artin reciprocity) supplies the global character input of §R07.P7.3.
- **GlobalNumberFields.** Layers 9–10 supply Hecke characters, algebraic infinity types and
  unit relations for §R07.P7.3.

### From AbelianSchemesAndArithmeticModuli, CrystallineCohomology, PadicPeriodRings and the further foundational roadmaps

- **AbelianSchemesAndArithmeticModuli.** §A4.5 `BarsottiTate` with `BarsottiTate.truncation`,
  `BarsottiTate.dual`, `BarsottiTate.baseChange`, `BarsottiTate.ofAbelian` and
  `BarsottiTate.connectedEtale` as described above. §A4.5a supplies `TruncatedBT`,
  `TruncatedBT.height`, `TruncatedBT.baseChange`, effective fppf descent,
  `TruncatedBT.cartierDual` with biduality, `TruncatedBT.restrict` for `1 ≤ m ≤ n`, and
  `BarsottiTate.truncation` with values in this carrier, preserving height and commuting with
  base change and duality. Its canonical finite-group Frobenius and Cartier-dual Verschiebung
  satisfy naturality, base change and `VF = [p] = FV`; §R07.1.1 extends these maps to flat affine
  groups and proves agreement on finite locally free groups. Layer A3 (isogenies over a base, quotients by
  finite locally free subgroups, and §A3.2 `multiplicationAndDensity`, including finite locally
  free `A[n]` of rank `|n|^{2g}` for integers `n ≠ 0` and base change). §A4.CR.7.2 supplies
  `LogCrystalline.dieudonneEvaluation` (evaluation of `D(G)` on divided-power thickenings,
  contravariant, with `FV = VF = p`), the variance-and-twist values `D(ℚ_p/ℤ_p) = (W(k), σ)` and
  `D(μ_{p^∞}) = (W(k), pσ)`, and Grothendieck–Messing (lifts of `G₀` along a locally PD-nilpotent
  thickening on which `p` is locally nilpotent correspond to lifts of the Hodge filtration).
- **CrystallineCohomology.** §CR.4.7 *Slope decomposition on the existing isocrystal carrier*
  supplies standard cyclic blocks, algebraically closed Dieudonné–Manin classification,
  different-slope `Hom` vanishing and perfect-field slope descent. §CR.7.1 supplies
  the Tate twist of coefficients with Frobenius and filtration; §CR.7.3 supplies relative
  crystalline direct images and base change. DerivedDeRhamCohomology §§PD.1–PD.7 supplies
  divided powers, envelopes and universal thickenings.
- **PurityOfBranchLocus.** §2.1 supplies purity of the branch locus (SGA 1 `X` 3.1,
  Stacks Tag 0BMB), and §2.2 supplies the global corollary: for an excellent regular local
  ring `A`, its finite normalization in a finite separable generic-fibre algebra,
  if unramified above every height-one point, is étale. The source normality hypothesis
  is essential (Stacks Tag 0BMB).
- **PadicPeriodRings.** §§1–4 supply `C_p`, `A_inf`, `θ`,
  `B_dR^+`, `B_dR`, the period `t` with `g(t) = χ(g)t`, the continuous Galois action,
  `padicComplex_fixed_eq`, `tate_normalizedTrace`, `tate_almostEtale`,
  `tate_H0_padicComplex_twist` and `tate_H1_padicComplex_twist`.
  Section `2` supplies mixed-characteristic perfect-residue ramification and Herbrand theory
  through the prerequisite of `senUpperBreaks`, and the different inputs of general-base
  `periodTraceIdeal` and `senTowerEstimates`. These include quotient compatibility of upper
  numbering and the inertia, upper-filtration and normalized-different comparisons under
  completed maximal unramified base change, on the existing `Ideal.ramificationGroup` carrier.
  Section `3` supplies the principal `O_C` envelope, its presentation and completion, `θ_cris`
  and logarithm. Sections 4.1–4.3 supply the crystalline and semistable carriers, actions,
  period maps, invariant functors, rational predicates, fixed fields, regularity and underlying
  fundamental exact sequence. Sections R07.P2–R07.P5 import their finite-`K` specializations;
  §R07.P3 identifies the supplied continuous sequences and boundaries on the finite-flat
  realization interfaces, §R07.P5 gives the crystalline-to-de Rham implication, and
  §R07.P5a owns integral coefficient predicates.
  Section R07.3.0 gives the finite-`K` arithmetic realization comparisons.
- **PhiGammaModulesAndIwasawaCohomology.** Section 5.7, *The local exponential and the
  all-level image condition*, supplies continuous nonequivariant sections of both fundamental
  period sequences, their tensor-cochain long exact sequences and `blochKatoExp` for every
  finite-dimensional continuous representation over a finite extension of `ℚ_p`.
  Section R07.P3 uses its `x−y` and `1−φ` conventions and identifies its boundaries with
  the finite-flat realization interfaces; no de Rham hypothesis is needed for these boundaries.
- **ArithmeticGaloisDuality.** §R02.1.2 supplies continuous-cochain long exact sequences
  for quotient maps admitting continuous nonequivariant sections; §R02.2.3a supplies
  the finite-type procyclic cohomology calculation.
- **RestrictedPowerSeries.** Section 7.1 supplies the open-disc scalar algebra, its Gauss topology,
  completeness, evaluations, differentiation and bounded-coefficient inclusion. Section R07.4.1
  specializes it to radius one over `K₀` and owns its arithmetic structures.
- **ArithmeticGaloisRepresentations.** §§1.1–1.2 supply continuous representations and maps;
  §1.4 supplies `residual_descent_finite_field` for residual finite coefficient models;
  §1.5 supplies characteristic-zero finite coefficient models; §7.6 supplies strong irreducibility,
  the Zariski and
  Goursat inputs, roots of characters and projective lifting used in §§R07.P7.1–R07.P7.5.
  Section 2.3 supplies the finite-local-field `fundamentalCharacter`,
  `fundamentalCharacter_pow_p`, norm maps between levels, `cyclotomic_restrict_tameInertia`
  and the residual tame-inertia classification. Section R07.1.26 extends the characters to
  arbitrary perfect residue fields as `perfectResidueFundamentalCharacter`, with
  `perfectResidueFundamentalCharacter_eq_fundamentalCharacter` after identifying the tame
  quotient, roots of unity and residue embeddings; the finite-residue API has this single supplier.
- **PerfectoidSpaces.** §§P1.6, P1.`10` and P1.`16`–P1.`18` supply the tilt, Fontaine map,
  primitive kernel and perfectoid-field inputs to the period constructions.
- **DerivedDeRhamCohomology.** §§PD.1–PD.7 supply divided powers, envelopes and their
  completions; §0.20 supplies syntomic morphisms.
- **DerivedModuleAlgebra** §0.4 (the full cotangent complex) and §0.8 (its transitivity
  triangle), **SchemeAndStackFoundations** §0.14 `henselian_smooth_lifting`
  (a smooth-algebra section over `C/J` lifts to `C` for every henselian pair, Stacks Tag 0H74),
  and §4.1 (thickenings, formally smooth and formally étale
  morphisms, the infinitesimal lifting criterion), **EtaleCohomologyFoundations**
  §F.0.2 (`VanishingCycles.finiteEtaleGaloisCategory`, the general finite étale Galois-category
  and geometric fibre-functor construction), **ModularCurves** Layer 0D (the field-valued
  finite étale/Galois-set dictionary and transport of group objects),
  **ArithmeticGaloisRepresentations** Layer 6 and **SmoothRepresentationsOfLocalGroups**
  Layer SR.2 (smooth and compact induction for `GL₂(F)`), as listed under *Scope and ownership*.

### Scheme Frobenius contract

| Owner | Provides / consumer | Convention |
| --- | --- | --- |
| SchemeAndStackFoundations §0.29 / `absoluteFrobenius`, `schemeFrobeniusTwist`, `relativeFrobenius`, `iteratedSchemeFrobenius`, `qPowerFrobenius` | Scheme maps, naturality, products, arbitrary relative base change and iteration; §R07.1.1 upgrades the relative map to `frobeniusHom` | `F_X : X → X` is absolute; `F_{X/S} : X → X^{(p/S)}` is relative. The group `F_G` is relative. The existing group `frobeniusTwist` is the affine group base-change adapter to `schemeFrobeniusTwist`. The finite locally free group maps are supplied by AbelianSchemesAndArithmeticModuli §A4.5a; §R07.1.1 extends them by the symmetric-tensor construction for flat affine groups and proves agreement. |

### Supplied downstream: tame connected–étale rank one

Section R07.3.19 exports `tameConnectedEtaleRankOne` and its rank, inertia, duality,
descent and residual-quotient API to the local weight-two applications of PadicHodgeTheory.
The contract uses the actual stable lattice over `L = F₀(μ_p)`, cyclotomic determinant
on `I_L` and a nonzero fixed residual vector. It supplies potential ordinarity; an
unramified quotient over the original unramified field also requires that the descended
étale quotient reduce to the specified residual unramified quotient. The integral
height-one realization, including all groups at `p = 2`, is §R07.4.20.

## How to read the build

Layer R07.1 is the structure theory of finite flat groups and `p`-divisible groups over general
bases: group Frobenius and Verschiebung consume SchemeAndStackFoundations §0.29
and the étale and multiplicative building blocks. It develops `p`-divisible groups,
formal Lie groups and Tate's theorems using PadicPeriodRings §2, and then works over Dedekind
bases: models, Raynaud's theory with its tame characters, Oort–Tate, gluing and descent.
Layer R07.2 classifies over perfect fields by Dieudonné
modules and reaches out to smooth, semiperfect and valuation-ring bases; its last targets use
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 for crystalline evaluation and deformation theory. Layer R07.3
begins with the filtered `(φ, N)`-modules and weak admissibility that the rest of the roadmap
uses, and builds Fontaine–Laffaille theory. Layer R07.4 builds Breuil–Kisin theory on
R07.2 and R07.3, with Kedlaya's slope filtration as its analytic input, and classifies `p`-divisible
groups and finite flat group schemes over `𝒪_K`. Layer R07.5 applies R07.1–R07.4 to compute residual
local Galois representations, and Layer R07.6 draws the deformation-theoretic and ramification
consequences. The `TruncatedBT` carrier and basic API come from
AbelianSchemesAndArithmeticModuli §A4.5a; exact-sequence recognition (§R07.1.10) and
`btNRecognition` (§R07.1.11) use that carrier, with the conormal consequences of §R07.1.11.
Build the Dieudonné ring (§R07.2.5) before its action on Witt kernels (§R07.2.4).
The Hasse invariant precedes btStackSmooth, and the quasi-polarised `LF` compatibility
uses the smoothness and density proved there. Section labels identify contracts; this
dependency order governs their construction. All other targets use preceding inputs
of the same or earlier layers and the explicit supplier contracts.

## Layer R07.1: Finite flat group schemes and `p`-divisible groups

This layer builds the structure theory of groups over general bases. Group Frobenius and
Verschiebung use SchemeAndStackFoundations §0.29, along
with the two rigid building blocks, étale groups (Galois modules) and multiplicative groups
(their Cartier duals). It then develops `p`-divisible groups on the carrier `BarsottiTate` of
AbelianSchemesAndArithmeticModuli §A4.5: torsion levels, duality, Tate modules, the connected–étale
sequence over a henselian local base, recognition on the truncated carrier of
AbelianSchemesAndArithmeticModuli §A4.5a, formal Lie groups and dimension, and Tate's two
theorems over a complete discrete valuation ring, using Tate–Sen from PadicPeriodRings §2. Over
Dedekind bases it treats schematic closure and finite flat models, Raynaud's uniqueness theorem and
his theory of `F`-vector schemes (written in the tame characters, which are introduced here), the
Oort–Tate classification, gluing over rings of `S`-integers, Raynaud's embedding into abelian
schemes and flat descent.

### R07.1.1 Relative Frobenius and Verschiebung of commutative group schemes

Absolute and relative scheme Frobenius with naturality, products and arbitrary relative
base change for the group construction are supplied by SchemeAndStackFoundations
§0.29 / `absoluteFrobenius`, `schemeFrobeniusTwist`, `relativeFrobenius`.
Here `F_G : G → G^{(p)}` means `F_{G/Spec k}`, while `F_X : X → X` in SchemeAndStackFoundations §0.29 is absolute.
The twist `G^{(p)} = G ⊗_{k,σ} k` uses the `p`-power map `σ` on the base; the group API retains
the flat-group extension to characteristic-`p` ring bases. The finite locally free group maps,
their naturality, base change and `VF = [p] = FV` are supplied by
AbelianSchemesAndArithmeticModuli §A4.5a. The construction here extends those maps to flat affine
groups and agrees with them on finite locally free groups, including all these identities.

Construct `frobeniusHom` and `verschiebungHom`. Let `k` be a field of characteristic `p`. For an affine
commutative group scheme `G` over `k`, upgrade the supplied relative scheme Frobenius to a homomorphism
`F_G : G → G^{(p)}`. The Verschiebung `V_G : G^{(p)} → G` is the homomorphism whose algebra map is
obtained from iterated comultiplication
`A → (A^{⊗p})^{S_p}`, projection modulo the symmetrization norm image, and the inverse of
`λ_A : A ⊗_{k,σ} k ≅ (A^{⊗p})^{S_p}/im(N_{S_p})`; it is functorial, compatible with products and base
extension, and for finite `G` it
is the Cartier dual of `F_{G^*}`. Moreover `V_G ∘ F_G = p·id_G` and `F_G ∘ V_G = p·id_{G^{(p)}}`. The
same constructions work over any ring `R` of characteristic `p`: for a flat affine commutative `R`-group
`G, F_G : G → G^{(p)} = G ×_{R,Frob} R` is a homomorphism, `V_G : G^{(p)} → G` is defined by the
isomorphism `λ_A : A ⊗_{R,Frob} R ≅ (A^{⊗p})^{S_p}/im(N_{S_p})`
for flat modules, where `N_{S_p}` is the sum over permutations, for `G` finite locally
free `V_G = (F_{G^D})^D`, both are natural and compatible with base change, and `V∘F = [p], F∘V = [p]`;
for a `p`-divisible group over `R` they are isogenies of the whole `p`-divisible group. Their
restrictions to truncations are compatible finite-level maps and need not be epimorphisms.

Over a field `G` is affine commutative, and over a ring `R` of characteristic `p` it is flat affine
commutative; the duality statement needs `G` finite (finite locally free over `R`). For elliptic
curves this specialises to ModularCurves Layer 7E (PD-`3`).

*Construction.* Use SchemeAndStackFoundations §0.29's scheme naturality, product and base-change identities to prove
that `F_G` preserves multiplication, identity and inversion, and transport those identities to
the group API. `V_G`: project the iterated comultiplication to
`(A^{⊗p})^{S_p}/im(N_{S_p})` and compose with `λ_A⁻¹` (Stix (8.3)–(8.5)); functoriality, products and base
change (Proposition 14.3). For finite `G, V_G = (F_{G^*})^*` under the Cartier duality of Tau Ceti's
FiniteLocallyFreeCommAffineGroupSchemeCat. `V_G ∘ F_G = p` and `F_G ∘ V_G = p`: on algebras, `F_A` and `V_A`
compose to the `p`-th power of the comultiplication followed by multiplication (Pink Theorem 14.4).
(Pink 2005, §14, Theorem 14.4, p. 31: the relations; Pink 2005, §14, Proposition 14.3, p. 30:
functoriality of `V`; Stix 2012, §8.5.2, (8.3)–(8.5) and Proposition 51, pp. 45–47; §9.4, p. 56:
Verschiebung over a base `R` of characteristic `p`, as the Cartier dual of the Frobenius of the dual and
by the symmetric-tensor construction for flat affine groups, with `V∘F = [p]` and `F∘V = [p]`; Frobenius
and Verschiebung of `p`-divisible groups over `R`.)

The API:

- `frobeniusHom`: `F_G : G ⟶ G^{(p)}`, a homomorphism of group schemes.
- `verschiebungHom`: `V_G : G^{(p)} ⟶ G`.
- `verschiebung_comp_frobenius`: `V_G ∘ F_G = p • 𝟙 G`.
- `frobenius_comp_verschiebung`: `F_G ∘ V_G = p • 𝟙 G^{(p)}`.
- `frobeniusHom_naturality`: `F` and `V` are natural in `G` and commute with base extension.
- `verschiebungHom_eq_cartierDual`: For finite `G, V_G = (F_{G^*})^*`.
- `frobeniusTwist`: over a field `k` of characteristic `p`, the twist `G^{(p)} = G ⊗_{k,σ} k` of a
  finite flat group, the base change along the Frobenius of `k`; at the pins this is a light
  definition through Tau Ceti's `baseChangeFunctor`.

*Needs:* SchemeAndStackFoundations §0.29 (scheme Frobenius, naturality, products and arbitrary relative base change);
AbelianSchemesAndArithmeticModuli §A4.5a (canonical finite-group Frobenius and Verschiebung);
Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`; Mathlib `PerfectField`.

**Checks.**

- `frobeniusTwist_primeField`: over `F_p`, the Frobenius of the base is the identity, so
  `G^{(p)} ≅ G` for every finite flat commutative `G`.
- `frobeniusTwist_constantGroup`: a finite constant group `Γ_k` has `Γ_k^{(p)} ≅ Γ_k`.
- `frobenius_constZModP_iso`: For `G = ℤ/pℤ, F_G` is an isomorphism and `V_G = 0`.
- `verschiebung_muP_iso`: For `G = μ_p, F_G = 0` and `V_G` is an isomorphism.
- `frobenius_alphaP_zero`: For `G = α_p, F_G = V_G = 0` although `α_p ≠ 0`.
- `verschiebung_not_inverse`: `V_G` is not an inverse of `F_G`: on `μ_p, F_G = 0` while `V_G ≠ 0`, and `V_G ∘ F_G = p = 0`.
- `frobenius_Ga_Gm`: on `𝔾_a: F(x) = x^p` and `V = 0`; on `𝔾_m: F(x) = x^p` and `V = id` after identifying
  `𝔾_m^{(p)} = 𝔾_m`.
- For `p = 2` and `A = F₂ × F₂`, the invariant tensor space has dimension `3`, while the
  quotient by the norm image has dimension `2`, equal to the Frobenius twist of `A`.
- On `μ_p` over `F_p`, the restriction of Frobenius to this truncation is zero and is not
  faithfully flat onto `μ_p`; Frobenius is an isogeny on `μ_{p^∞}`.

### R07.1.2 Finite étale group schemes over a connected base are `π₁`-modules

Prove `etaleGroupEquivContAction`. Let `S = Spec R` be connected with a geometric point `s̄`. The fibre
functor `G ↦ G(s̄)` is an equivalence between finite étale (commutative) group schemes over `S` and
finite (abelian) groups with a continuous action of `π₁(S, s̄)`; constant groups correspond to trivial
actions, and every finite étale group is constant over some finite étale cover. The inverse sends `ρ : π₁(S, s̄) → Aut(M)` to the twisted form `V(ρ)(T) = M(T ⊗_R R′)^Γ`, for `R → R′` finite Galois with
group `Γ` through which `ρ` factors. For `R = ℤ[1/N]` and `s̄ = Spec ℚ̄, π₁ = Gal(ℚ_S/ℚ)` for `S` the primes
dividing `N` together with `∞`, so finite étale commutative group schemes over `ℤ[1/N]` are the finite
`G_ℚ`-modules unramified outside `N∞`. A finite flat group scheme whose order is invertible on `S` is
étale.

The base `S` is connected; `Spec ℤ[1/N]` is connected and normal.

*Proof sketch.* Import the Galois-category structure and geometric fibre functor on finite étale
`S`-schemes from EtaleCohomologyFoundations §F.0.2
(`VanishingCycles.finiteEtaleGaloisCategory`); the chosen geometric point makes `S` nonempty.
For this affine base, construct the comparison from `(CommAlgCat.FiniteEtale R)ᵒᵖ` to the
supplier's finite étale full subcategory of `Over S` by relative `Spec`. Restrict Mathlib's
`AlgebraicGeometry.AffineScheme.equivCommRingCat` over `R`: finite morphisms to `Spec R` are affine,
and finite étale algebras correspond to finite étale morphisms. Identify its fibre at `s̄` with
Mathlib's `CommAlgCat.FiniteEtale.fiber R Ω` for `s̄ = Spec Ω`, and transport the supplied
`GaloisCategory` and `FiberFunctor` structures along this equivalence. Mathlib's
`PreGaloisCategory.functorToContAction` then gives the equivalence with finite continuous
`π₁(S, s̄)`-sets (SGA 1, Exposé V; Stacks, Theorem 58.6.2, tag 0BND). The comparison and fibre
equivalence preserve finite products, so transport group objects to identify finite étale group
schemes with finite groups carrying a continuous `π₁`-action (Stix Theorem 33). Over a field use
ModularCurves Layer 0D's finite étale/Galois-set dictionary and its transport of group objects,
compatibly with the affine comparison. The inverse is the explicit twist of Stix 7.3.1,
representable by fpqc descent (ModularCurves Layer 0E); its fibre at `s̄` is `M` with action `ρ`. For a
normal connected `S` with generic point `η, π₁(S, η̄)` is the Galois group of the maximal extension of
the function field unramified over `S` (SGA 1, Exposé V, 8.2; part of this target); for `ℤ[1/N]` this is
`Gal(ℚ_S/ℚ)`. Order invertible `⇒` étale: Stix Theorem 34 (Oort–Tate Lemma 5). (Stix 2012, §7.3, Theorem
33, p. 35: the equivalence; Stix 2012, §7.3.1, pp. 35–36: the inverse construction; Stix 2012, §7.4,
Theorem 34, p. 37: order invertible implies étale.)

*Needs:* EtaleCohomologyFoundations §F.0.2 `VanishingCycles.finiteEtaleGaloisCategory`
(finite étale Galois categories and geometric fibre functors); Mathlib
`AlgebraicGeometry.AffineScheme.equivCommRingCat`; Mathlib `CommAlgCat.FiniteEtale`; Mathlib
`CategoryTheory.PreGaloisCategory.functorToContAction`; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; TauCetiRoadmap.ModularCurves Layers 0D
(the field dictionary and transport of group objects) and `0E` (descent of the twisted form).

**Checks.**

- The affine comparison sends `R` to the terminal cover `S → S`, sends the zero algebra to
  the empty cover, and identifies the fibre of `Spec A` with `Hom_{R-alg}(A, Ω)`.
- For finite étale `R`-algebras `A, B`, `A ⊗_R B` corresponds to the fibre product of their
  covers, and its `Ω`-fibre is the product of their fibres; this is the product comparison used
  to transport the group law.
- For a separably closed field `Ω`, the comparison agrees with
  `CommAlgCat.FiniteEtale.equivOfIsSepClosed Ω` and ModularCurves Layer 0D: finite étale groups
  become finite constant groups with trivial Galois action.
- `etaleGroupEquivContAction_const`: the constant group `ℤ/nℤ ↔` trivial action; `μ_n` over `ℤ[1/n] ↔ (ℤ/n)(1)`, the cyclotomic character.
- `etaleGroupEquivContAction_twist`: the twisted constant scheme `V(ρ)` of a representation `ρ : G_ℚ → GL_2(𝔽_p)` unramified outside `l∞` is a finite étale group scheme over `ℤ[1/l]` (for `p = l` only over
  `ℤ[1/l]`, as `μ_p` is not étale at `p`).
- `isEtale_constantGroup` and `rank_constantGroup`: a finite constant group `Γ_R` is étale over
  every base, and over a local base its order is `|Γ|`. `not_isEtale_muP`: `μ_p` over `F_p` is not
  étale (its algebra `F_p[x]/(x − 1)^p` is nonreduced); its order `p` is not invertible, so this
  does not contradict `isEtale_of_isUnit_rank`, the local form of the last statement of this target.

### R07.1.3 The finite part of a quasi-finite group scheme over a henselian base

Prove `finitePart`. Let `R` be a henselian local ring and `𝒢 → Spec R` a separated, quasi-finite, flat,
finitely presented commutative group scheme. Then `𝒢 = 𝒢^f ⊔ 𝒢′` with `𝒢^f` open and closed, finite over
`R` and containing the unit section, and `𝒢′` with empty special fibre. `𝒢^f` is a finite flat closed
subgroup scheme. If `R` is a henselian DVR with fraction field `K`, then `𝒢^f(K̄)` is the set of points of
`𝒢(K̄)` that extend to `𝒪_L`-points for some finite extension `L/K` inside `K̄`.


*Proof sketch.* The special fibre is finite, so its points are isolated; by Stacks Lemma 37.41.5
there is an étale neighbourhood over which `𝒢` splits into finite pieces through these points and a
part `W` with no points over the closed point. Since `R` is henselian the étale neighbourhood may be
taken to be `Spec R` itself (Stacks Lemma 10.153.3; in the affine case this is condition `(13)`: a
quasi-finite `R`-algebra is `A × B` with `A` finite and `B ⊗ κ = 0`). `𝒢^f` is finite and flat (open in `𝒢`). It
is a subgroup: `𝒢^f ×_R 𝒢^f` is finite over `R`, and over a henselian base each connected component of a
finite `R`-scheme meets the special fibre (condition `(10)`), so its image under multiplication lies in
`𝒢^f`, which is open and closed. The same argument applies to the inverse and the unit section.
Points: let `𝒪_L` be the unique valuation ring extending `R` in a finite extension `L/K`.
`Spec 𝒪_L` is connected, and the inverse image of the open-and-closed `𝒢^f` contains its
closed point because `𝒢′` has empty special fibre. Thus every `𝒪_L`-point lands in `𝒢^f`; conversely
`𝒢^f` is finite, hence proper, and the valuative criterion extends `K̄`-points of `𝒢^f`. (Stacks Project,
Tag 02LO, Lemma 37.41.5: the decomposition; Stacks Project, Tag 04GG, Lemma 10.153.3 `(13)`: the
henselian case.)

*Needs:* Mathlib `HenselianLocalRing`; Mathlib `Algebra.QuasiFinite`.

**Checks.**

- `finitePart_trivial`: for a quasi-finite flat group whose generic fibre is `ℤ/pℤ` but whose special
  fibre is trivial (the open complement of the nonzero sections of `ℤ/pℤ` over the closed point), `𝒢^f`
  is the unit section.
- `finitePart_of_finite`: for finite `𝒢, 𝒢^f = 𝒢`.
- `finitePart_nonfinite_normalization`: in characteristic `p` let `f = Σ_{n≥1}t^{n!}`
  be transcendental, `K = F_p(t,f^p)`, and `R = (K ∩ F_p⟦t⟧)^h`. The immediate
  purely inseparable extension `K^h(f)/K^h` has degree `p` and nonfinite normalization:
  a finite normalization would be free of rank `p` over `R` but have residue length one.
  Its valuation spectrum is still connected, so the point-extension argument applies.
- `finitePart_points`: for that group over `ℤ_p`, `𝒢^f(K̄) = 0` while `𝒢(K̄) = ℤ/p`: the nonzero
  generic points do not extend to `𝒪_L`-points, matching the description of `𝒢^f(K̄)`.

**Special-fibre types and the ordinary counting identity.** For a finite flat commutative
`p`-group `G` over a henselian local ring `R` of residue characteristic `p`, define
`FiniteFlat.IsUnipotent G := IsConnectedLocal (cartierDual G)`. Prove that
`IsConnectedLocal`, `IsUnipotent`, `IsEtale` and `IsMultiplicative` can each be tested on
the special fibre. Here connectedness and unipotence refer to the integral group and its
special fibre; the characteristic-zero generic fibre is étale. Over an algebraically closed
residue field, the unipotent simple groups are `ℤ/p` and `α_p`, whereas `μ_p` is not
unipotent. Use the connected–étale sequence and its Cartier dual (Stix 2012,
§§8.1–8.4, Propositions 37, 40 and 44, pp.38–42; §8.5, Theorem 54, p.46).

Prove `card_points_quot_multiplicativePart`. Let `R` be a complete mixed-characteristic
DVR with perfect residue field `k`, fraction field `K`, and `e < p−1`. Let `G/R` be finite
flat, killed by `p^n`, put `M=G(K̄)`, and let `W⊆M` be Galois stable. Assume inertia acts
on `W` by the `p^n`-cyclotomic character and acts trivially on `M/W`. The second
assumption means `σx−x∈W` for every `σ∈I_K` and `x∈M`. Then the closure of `W` is `G⁰`, is of
multiplicative type, and `[M:W]=#G_k(k̄)`. Indeed `W` has a multiplicative model and
`M/W` an étale model, by the unramified character dictionary; Raynaud full faithfulness
identifies these with the closed subgroup and quotient of `G`. The connected–étale
sequence then identifies the reduction kernel with `W`. Sources: Stix 2012, Proposition
37 and Corollary 43, pp.38–41; Raynaud 1974, Corollaire 3.3.6, p.268;
§§R07.1.9, R07.1.20 and R07.1.30. The identity supplies the ordinary finite-flat
point-counting input for the downstream Mazur-principle and weight arguments.

**Checks.**

- Over `𝔽_p`, `ℤ/p` is étale and unipotent, `μ_p` is connected and multiplicative,
  and `α_p` and its dual are connected. These distinguish all four tests.
- For `G=μ_{p^n}×ℤ/p^m` and `W=μ_{p^n}(K̄)`, the quotient and the geometric
  special-fibre points both have `p^m` elements; the pure factors give indices `1` and `p^m`.
- For supersingular `E/W(𝔽̄_p)`, `E[p]` has no multiplicative part and only one
  special-fibre point, but `p²` generic points. The counting identity requires the
  unramified-quotient hypothesis; it does not hold for an arbitrary multiplicative part.
- At `p=2` over `ℤ₂`, `μ₂` and `ℤ/2` have the same generic module and respectively
  one and two geometric special-fibre points. The strict ramification bound is essential.

### R07.1.4 Rigidity: homomorphisms into étale groups and out of multiplicative groups lift uniquely

Prove `multiplicativeTypeRigidity`. Let `S` be a scheme or a `p`-adic formal scheme. `(i)` If `T ⊂ T′` is a
nilpotent thickening over `S, F′` is a finite locally free group scheme over `T′` and `E′` an étale group
scheme over `T′`, every homomorphism `F′|_T → E′|_T` extends uniquely to `F′ → E′`; and every étale group
scheme over `T` lifts uniquely to `T′`. `(ii)` If `H` is finite locally free of multiplicative type over `S`
(étale locally a product of groups `μ_n`) and `N` is finite locally free, then `Hom_S(H, N) = Hom_S(N^D, H^D)` with `H^D` étale, so homomorphisms `H → N` lift uniquely along nilpotent thickenings and
from the closed point to the completed local ring at a point of `S`; and (iii) the locus of `S` where a
given homomorphism `H → N` vanishes is open and closed. Consequence used for Hecke correspondences:
for a finite locally free `C ⊂ G` and `H ⊂ G` of multiplicative type, the locus where `C ∩ H = 0` is open
and closed.

Here `S` is a scheme, or a `p`-adic formal scheme through its reductions `S ⊗ ℤ/p^m`; Cartier
duality over `S` is that of ModularCurves Layer 0B, and groups of multiplicative type over a field
are Tau Ceti's (`multiplicativeTypeCommHopfAlgProperty`), used étale locally.

*Proof sketch.* `(i)` An étale `S`-scheme is formally étale, so morphisms into it lift uniquely along
nilpotent thickenings (SchemeAndStackFoundations §4.1); applied to the group laws this gives the
unique lifting of homomorphisms (the source cites Illusie, Complexe cotangent II, Théorème
VII.4.2.5). The unique lifting of the étale group `E` itself is the topological invariance of the
étale site under a nilpotent thickening (SGA 1, Exposé I, Théorème 8.3): base change along `T ⊂ T′`
is an equivalence between étale `T′`-schemes and étale `T`-schemes. This equivalence, for the étale
schemes used here, is part of this target; it is proved from the infinitesimal lifting criterion by
lifting étale algebras locally and gluing the unique lifts. `(ii)`
Cartier duality is an anti-equivalence of finite locally free groups compatible with base change;
`H^D` is étale because `H` is étale locally a product of `μ_n`; apply `(i)` to `N^D → H^D`. Over the
completed local ring `Ô_{S,s} = lim Ô/m^k`, apply `(ii)` to each Artinian thickening and pass to the
limit. (iii) For the dual of a fixed homomorphism, `f : N^D → H^D`, the equalizer of `f`
and zero is open and closed in `N^D`, since the diagonal of the separated étale target `H^D` is
open and closed. Its complement is finite locally free over `S`, being an open-and-closed part
of `N^D`. Its image in `S` is therefore both open and closed; the complement of that image is
exactly the locus where `f`, and hence the original homomorphism, vanishes. For `C ∩ H`: the locus where `C ∩ H = 0` is the complement of the support of the coherent sheaf `I_e/J` (`I_e` the augmentation ideal of `H, J` the ideal of `C ∩ H`), hence open; it is closed because a nonzero map from `H` to `C` at a point extends
over the completed local ring by `(ii)` (Pilloni, Lemma 10.2.1, proof; BCGP 2021, Lemma 4.5.9, proof).
(Pilloni 2020, §9.1.1, proof of Lemma 9.1.1.1, pp. 54–55: unique extension of a homomorphism from a
finite flat group into an étale group along a nilpotent thickening (citing Illusie, *Complexe
cotangent et déformations II*, LNM `283`, VII.4.2.5); Pilloni 2020, §10.2, proof of Lemma 10.2.1, p.
58: openness by a support argument, and closedness deduced from the rigidity of multiplicative
groups; BCGP 2021, §4.5.1 (pp. 99–100), §4.5.6 (p. 101) and the proof of Lemma 4.5.9 (p. 102),
arXiv:1812.09269v3: the same rigidity used without reference for the Hecke correspondences at `p`.)

*Needs:* TauCetiRoadmap.ModularCurves Layer 0B; SchemeAndStackFoundations §4.1 (thickenings,
formally smooth and formally étale morphisms, the infinitesimal lifting criterion); Tau Ceti
`TauCeti.multiplicativeTypeCommHopfAlgProperty`.

**Checks.**

- `multiplicativeTypeRigidity_muP`: `H = μ_p, N = μ_p` over `ℤ_p: Hom(μ_p, μ_p) = ℤ/p` is a constant
  étale scheme; the identity of `μ_p ⊗ F_p` lifts uniquely to `ℤ_p`.
- `multiplicativeTypeRigidity_alphaP`: rigidity fails for `N → H` with `H` multiplicative replaced by
  `α_p: Hom(α_p, α_p)` over `F_p[ε]` contains `a ↦ (1 + cε)a` for all `c`, so homomorphisms out of `α_p` do
  not lift uniquely, and the vanishing locus of a section need not be open.
- Over `R = ℤ₃[ζ₃], Hom(μ₃, (ℤ/3)_R)` has three geometric generic maps and only
  the zero special-fibre map, so the whole `Hom` scheme is not finite étale. Rigidity applies
  to a fixed map and its nilpotent lifts.
- Over `F₂, μ₃` is of multiplicative type and has order `3`; products of `μ_{2^m}` do not
  exhaust finite multiplicative-type groups.

### R07.1.5 The levels of a `p`-divisible group are its torsion, and multiplication by `p` is an epimorphism

Prove `BarsottiTate.exact_levels`. For a `p`-divisible group `G = (G_v)` of height `h` over `S: (i) G_{v+t}[p^v] = G_v`; `(ii)` the sequence `0 → G_v → G_{v+t} → G_t → 0`, with the second map induced by
`p^v`, is exact; (iii) `p : G → G` is finite locally free and surjective (as fppf sheaves) of degree
`p^h`.

*Proof sketch.* `(i)` Induction on `t` from the defining exactness: `G_{v+t+1}[p^v] = G_{v+t+1}[p^{v+t}] ∩ G_{v+t+1}[p^v] = G_{v+t} ∩ G_{v+t+1}[p^v] = G_{v+t}[p^v] = G_v`. `(ii)` The image of `p^v` on `G_{v+t}`
is killed by `p^t`, so `p^v` factors through `j : G_{v+t} → G_t`. Left exactness is `(i)`. The induced
`G_{v+t}/G_v → G_t` is a monomorphism of finite locally free groups of the same rank `p^{ht}`, hence an
isomorphism (a surjective endomorphism of a finitely generated module is bijective; quotients from
ModularCurves Layer 0C). (iii) follows from `(ii)` with `t = 1: p` is levelwise the map `G_{v+1} → G_v`
with kernel `G_1` of rank `p^h`. (Stix 2012, §9.1.1–9.1.3, Lemma 61, Proposition 62 and Corollary 64,
pp. 54–55: the statement and proof.)

*Needs:* AbelianSchemesAndArithmeticModuli §A4.5 (`BarsottiTate`); TauCetiRoadmap.ModularCurves
Layer 0C.

**Checks.**

- `BarsottiTate.exact_levels_muPInfty`: for `μ_{p^∞}: 0 → μ_{p^v} → μ_{p^{v+t}} → μ_{p^t} → 0` with
  the second map `x ↦ x^{p^v}`.
- `BarsottiTate.mul_p_degree`: multiplication by `p` on a group of height `h` has degree `p^h`; on
  `μ_{p^∞}` it is `x ↦ x^p`, of degree `p`, and it is not a monomorphism.

### R07.1.6 Homomorphisms and standard examples of `p`-divisible groups

Define `BarsottiTate.Hom`, `BarsottiTate.muPInfty` and `BarsottiTate.constQpZp`. Let `S` be a
scheme, `p` a prime and `h ≥ 0`. A `p`-divisible group of height `h` over `S` is
AbelianSchemesAndArithmeticModuli's `BarsottiTate S p h`: an inductive system `G = (G_v, i_v)_{v ≥ 0}` of finite locally free commutative group schemes with `G_v` of rank `p^{hv}` and `0 → G_v → G_{v+1} → G_{v+1}` exact, the first map `i_v` and the second multiplication by `p^v`; its
truncation, Cartier dual, base change and the tower of an abelian scheme are that roadmap's. This
target adds the morphisms and the standard objects used throughout. A homomorphism `G → H` is a
compatible system of homomorphisms of the levels, and `Hom(G, H) = lim_v Hom(G_v, H_v)`; it is a
`ℤ_p`-module. The multiplicative group `μ_{p^∞} = (μ_{p^v})_v` and the constant group `ℚ_p/ℤ_p = (p^{−v}ℤ/ℤ)_v` have height `1`.

*Construction.* Because the levels are the `p^v`-torsion (§R07.1.5), a compatible system of maps
`f_v : G_v → H_{v + t_v}` lands in `H_v`, so `Hom` is the inverse limit of the level homomorphisms;
base change along `S′ → S` is levelwise. Over an affine base `Spec R` the levels are objects of Tau
Ceti's `FiniteLocallyFreeCommAffineGroupSchemeCat R`; the elliptic tower `E[p^∞]` of ModularCurves
Layer 7E is the height-two instance. (Stix 2012, §9.1, p. 54: the definition and homomorphisms;
Raynaud 1974, §2.3, p. 261: Tate's definition and the generic-fibre theorem built on it.)

The API:

- `BarsottiTate.Hom`: compatible families `(f_v : G_v ⟶ H_v)`, with the extensionality lemma (two
  homomorphisms agree iff all level maps agree) and the `ℤ_p`-module structure.
- `BarsottiTate.Hom.baseChange`: base change of homomorphisms along `R → R′`, compatible with
  AbelianSchemesAndArithmeticModuli's `BarsottiTate.baseChange`.
- `BarsottiTate.muPInfty`: `μ_{p^∞} = (μ_{p^v})_v`, of height `1`.
- `BarsottiTate.constQpZp`: `ℚ_p/ℤ_p = (p^{−v}ℤ/ℤ)_v`, constant, of height `1`.
- `BarsottiTate.ofHopfTower`: over `Spec R`, construct the supplied `BarsottiTate` carrier
  from finite locally free bicommutative Hopf algebras `A_v` of rank `p^{hv}` and
  compatible surjective Hopf maps `A_{v+1}→A_v`. Require the induced closed immersion
  `Spec A_v→Spec A_{v+1}` to identify its source with the kernel of `[p^v]`, and
  require the exact level sequences of §R07.1.5. This is an affine constructor for
  the same group, with levelwise base change and morphisms (Stix 2012, §9.1, pp.54–55).
- `BarsottiTate.points G L`: the direct limit of `FiniteFlat.points G_v L` along
  the level inclusions, functorial in the `R`-algebra `L`. For a geometric generic
  field it carries postcomposition Galois action. The level inclusion identifies
  `G_v(L)` with the `p^v`-torsion in this direct limit. The Tate module is the
  inverse limit along multiplication by `p`, as in §R07.1.8, with continuous
  representation `BarsottiTate.tateModuleRep`; these are different limits.

*Needs:* AbelianSchemesAndArithmeticModuli §A4.5 (`BarsottiTate`); Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; TauCetiRoadmap.ModularCurves Layers 0B and `0E`;
§R07.1.5.

**Checks.**

- `BarsottiTate.height_muPInfty`: `μ_{p^∞}` has height `1`: `μ_{p^v}` has rank `p^v`.
- `BarsottiTate.height_zero`: a `p`-divisible group of height `0` has all levels trivial.
- `BarsottiTate.not_of_constant_ZpZ`: the constant system `G_v = ℤ/pℤ` with identity transitions is
  not a `p`-divisible group: every level has rank `p`, which is not `p^{hv}` for a fixed `h`.
- `BarsottiTate.height_constQpZp`: the constant tower `ℚ_p/ℤ_p` has height `1` and is étale.
- `BarsottiTate.hom_muPInfty`: `End(μ_{p^∞}) = ℤ_p` and `Hom(μ_{p^∞}, ℚ_p/ℤ_p) = 0` over a connected
  base of characteristic `p`.
- `BarsottiTate.ordinary_nonsplit`: for the Serre–Tate lift `E` of an ordinary elliptic curve over
  `F̄_p` with parameter `q ≠ 1`, the connected–étale sequence of `E[p^∞]` over `W(F̄_p)` does not
  split (§R07.1.9).
- `BarsottiTate.supersingular_connected`: for `E` over `W(F̄_p)` with supersingular reduction,
  `E[p^∞]` is connected of height `2`: its special fibre is connected (ModularCurves Layer 7E,
  PD-`5`), and over a henselian local ring a finite flat group with connected special fibre is
  connected.
- `BarsottiTate.height_abelianScheme`: for an abelian scheme `A/S` of relative dimension `g`,
  `A[p^∞]` has height `2g`; for an elliptic curve it is ModularCurves' `E[p^∞]`, of height `2`.

### R07.1.7 The Cartier dual of a `p`-divisible group

Prove `BarsottiTate.cartierDual_levels` and the properties of AbelianSchemesAndArithmeticModuli's
`BarsottiTate.dual` used below. For a `p`-divisible group `G = (G_v)` of height `h` over `S`, its Cartier
dual is `G^D = (G_v^D)` with transition maps the Cartier duals `j_v^D : G_v^D → G_{v+1}^D` of the maps
`j_v : G_{v+1} → G_v` induced by `p`. `G^D` is a `p`-divisible group of height `h`, and `G^{DD} ≅ G`.

*Proof sketch.* The dual is AbelianSchemesAndArithmeticModuli's `BarsottiTate.dual`; this target
pins its transition maps and the facts used here. Levelwise Cartier duality (Tau Ceti's
`FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`; ModularCurves Layer 0B) applied to the
exact sequences `0 → G_1 → G_{v+1} → G_v → 0` of §R07.1.5 gives exact sequences `0 → G_v^D → G_{v+1}^D → G_1^D → 0`; the ranks are `p^{hv}`, so `G^D` is `p`-divisible of height `h`. Biduality levelwise gives
`G^{DD} ≅ G`; duality commutes with base change (cartierDualBaseChangeIso). (Stix 2012, §9.3 and
Example `65`, p. 56: the construction.)

The API:

- `BarsottiTate.cartierDual`: the dual `G^D`, equal to AbelianSchemesAndArithmeticModuli's
  `BarsottiTate.dual G`, of height `h`.
- `BarsottiTate.cartierDual_levels`: (cartierDual `G`).levels `v =` (`G`.levels `v`)`^D`.
- `BarsottiTate.cartierDualDual`: cartierDual (cartierDual `G`) `≅ G`, naturally.
- `BarsottiTate.cartierDual_baseChange`: Duality commutes with base change.

*Needs:* §R07.1.6; §R07.1.5; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso`;
TauCetiRoadmap.ModularCurves Layer 0B.

**Checks.**

- `BarsottiTate.cartierDual_constQpZp`: `(ℚ_p/ℤ_p)^D ≅ μ_{p^∞}`.
- `BarsottiTate.cartierDual_height`: The dual has the same height.
- `BarsottiTate.cartierDual_transition`: Using the duals of the inclusions `i_v` as transitions
  (instead of the duals of `j_v`) does not give a `p`-divisible group: for `μ_{p^∞}` it gives the maps
  `ℤ/p^{v+1} → ℤ/p^v`, which go the wrong way.
- `BarsottiTate.cartierDual_zero`: The dual of the height-zero group is the height-zero group.
- `isMultiplicative_diagonalizableGroup`: at finite level, a diagonalizable group `D(M)` (for
  instance `μ_N = D(ℤ/N)`) is of multiplicative type over every base, its Cartier dual being the
  constant group `M` (`TauCeti.DiagonalizableGroup.cartierDualIso`); together with
  `not_isEtale_muP` this separates multiplicative from étale. The finite-level duality statement is
  `isMultiplicative_cartierDual_iff`.
- `(ℚ_p/ℤ_p)^D = μ_{p^∞}`; `A[p^∞]^D = A^t[p^∞]` for an abelian scheme `A` with dual `A^t`.

### R07.1.8 The Tate module of a `p`-divisible group over a mixed-characteristic base

Construct `BarsottiTate.tateModule`. Let `R` be a henselian local domain whose fraction field `K` has
characteristic `0`, and `G` a `p`-divisible group of height `h` over `R`. Its Tate module is `T_p(G) = lim_v G_v(K̄)`, with transition maps induced by `p`, a free `ℤ_p`-module of rank `h` with a continuous action of
`Gal(K̄/K)`; `V_p(G) = T_p(G) ⊗ ℚ_p`. Cartier duality gives a perfect Galois-equivariant pairing `T_p(G) × T_p(G^D) → ℤ_p(1)`.

*Construction.* `G_v ⊗ K` is étale (characteristic `0`), so `G_v(K̄) ≅ (ℤ/p^vℤ)^h`: by §R07.1.5 the
discrete system satisfies the axioms, hence is free of rank `h` over `ℤ/p^v` at level `v` (Stix 9.2(2)).
`T_p(G) = lim G_v(K̄)` is free of rank `h` over `ℤ_p`; `Gal(K̄/K)` acts through the finite quotients
`Gal(K(G_v(K̄))/K)`, so the action is continuous for the `p`-adic topology. Cartier duality `G_v × G_v^D → μ_{p^v}` gives compatible perfect pairings of the points and, in the limit, `T_p(G) × T_p(G^D) → ℤ_p(1)`. In Tau Ceti, `T_p(G)` is `TauCeti.TateModule p` of the torsion group `colim_v G_v(K̄)`, whose
`p^v`-torsion is `G_v(K̄)` by §R07.1.5, with the Galois action by functoriality
(`TauCeti.TateModule.mapLinearMap`), and `ℤ_p(1)` is `TauCeti.PadicTateTwist p K̄`; this target adds
the freeness of rank `h` and the duality pairing. (Stix 2012, §9.2(2)–(4) and `(6)`, pp. 55–56: freeness
of the levels of points; Stix 2012, §11.2.2 and Corollary 85, p. 70: the duality pairing, `T_p(G^D) = Hom(T_p G, ℤ_p(1))`.)

The API:

- `BarsottiTate.tateModule`: tateModule `G` : Type with ModuleCat `ℤ_[p]` structure and a continuous
  action of Field.absoluteGaloisGroup `K`.
- `BarsottiTate.tateModule_free`: Module.Free `ℤ_[p]` (tateModule `G`) and finrank `= h`.
- `BarsottiTate.continuous_galoisAction`: The Galois action is continuous.
- `BarsottiTate.tateModule_map`: A homomorphism `G → H` induces a Galois-equivariant `ℤ_p`-linear map.
- `BarsottiTate.tateModulePairing`: The perfect pairing `T_p(G) × T_p(G^D) → ℤ_p(1)`.

*Needs:* §R07.1.6; §R07.1.5; §R07.1.7; Mathlib `PadicInt`; Mathlib `Field.absoluteGaloisGroup`;
Mathlib `Module.Free`; Mathlib `HenselianLocalRing`.

**Checks.**

- `BarsottiTate.tateModule_muPInfty`: `T_p(μ_{p^∞}) ≅ ℤ_p(1)`, with Galois acting through the
  cyclotomic character.
- `BarsottiTate.tateModule_constQpZp`: `T_p(ℚ_p/ℤ_p) ≅ ℤ_p` with trivial action.
- `BarsottiTate.tateModule_height_zero`: Height `0` gives the zero module.
- `BarsottiTate.tateModule_not_direct_limit`: The direct limit `lim→ G_v(K̄)` (the 'Tate comodule'
  `ℚ_p/ℤ_p ⊗ T_p`) is `p`-divisible torsion, not a free `ℤ_p`-module; a definition using it fails the
  freeness test.
- `BarsottiTate.tateModule_elliptic`: for an elliptic curve `E` over `R` with good reduction,
  `T_p(E[p^∞])` is the `p`-adic Tate module of `E_K`.

### R07.1.9 The connected–étale sequence of a `p`-divisible group over a henselian local base

Prove `BarsottiTate.connectedEtale_exact`. Let `R` be a henselian local ring with residue field of
characteristic `p` and `G` a `p`-divisible group of height `h` over `R`. The connected components `G_v^0` and
étale quotients `G_v^{ét}` of the levels form `p`-divisible groups `G^0` and `G^{ét}`, of heights `h^0` and
`h^{ét}` with `h^0 + h^{ét} = h`, and `0 → G^0 → G → G^{ét} → 0` is exact levelwise, functorial in `G` and
compatible with local base change of henselian local rings. Over a perfect residue field the special
fibre of the sequence splits; over `R` the sequence need not split. In the opposite order an extension
does split: for finite flat groups over `R`, every extension `0 → E → G → C → 0` with `E` étale and `C`
connected is canonically `G ≅ E × C`.

This extends AbelianSchemesAndArithmeticModuli's `BarsottiTate.connectedEtale`, which is stated over
a perfect field or a complete henselian local base whose connected parts are finite flat at every
level; here the base is any henselian local ring, and the content is that the connected parts of the
levels form a `p`-divisible group.

*Proof sketch.* Finite level: ModularCurves Layer 7E (PD-`2`) gives, for each finite locally free
commutative `G_v`, the exact functorial sequence `0 → G_v^0 → G_v → G_v^{ét} → 0` with `G_v^{ét}` finite
étale, compatible with local base change (Stix Propositions `37, 40`). Exactness of `G ↦ G^0` and `G ↦ G^{ét}` on finite flat groups (Stix Proposition 40(1)) turns `0 → G_v → G_{v+1} → G_{v+1}` into the
corresponding sequences for `G^0` and `G^{ét}`; the ranks are powers `p^{h^0 v}` and `p^{h^{ét} v}` by the
Lagrange formula for quotients, so both are `p`-divisible, with `h^0 + h^{ét} = h`. Over a perfect field
the finite-level sequence splits canonically by the reduced subgroup (Stix Proposition 39); for `R`
henselian with perfect residue field this splits the special fibre only. Opposite order (Stix
Proposition 40(4)): if `E ⊆ G` is étale with connected quotient `C`, then `G^0 ∩ E = E^0 = 0`, and `G^0 → C`
is a monomorphism, faithfully flat by exactness of `G ↦ G^0` (Proposition 40(1)); so `G^0 ≅ C` is a
complement to `E`, and `G → G^{ét} ≅ E` is a retraction. In the connected–étale sequence itself `G^0` is
the sub and `G^{ét}` the quotient, so no splitting over `R` follows. (Stix 2012, §8.1.1, Proposition 37,
p. 38: the finite-level sequence; Stix 2012, §9.2(5), p. 56: the tower-level statement; Stix 2012,
§8.1.1, Proposition 40(4), p. 39: the splitting in the opposite order.)

*Needs:* §R07.1.6; §R07.1.5; AbelianSchemesAndArithmeticModuli §A4.5
(`BarsottiTate.connectedEtale`); TauCetiRoadmap.ModularCurves Layers 0C and `7E`; Mathlib
`HenselianLocalRing`.

**Checks.**

- `BarsottiTate.connectedEtale_ordinary`: for an elliptic curve `E` over `W(𝔽̄_p)` with ordinary
  reduction, `0 → Ê[p^∞] → E[p^∞] → E[p^∞]^{ét} → 0` has heights `1 + 1`; it is an extension of `ℚ_p/ℤ_p`
  by `μ_{p^∞}` whose class is the Serre–Tate parameter `q(E) ∈ 1 + pW`, and it splits exactly when `q(E) = 1`, that is, when `E` is the canonical lift.
- `BarsottiTate.connectedEtale_supersingular`: supersingular reduction: `E[p^∞]` is connected, `G^{ét} = 0` and `h^0 = 2` (ModularCurves Layer 7E (PD-`4`), PD-`5`).
- `BarsottiTate.connectedEtale_opposite`: over `ℤ_p`, every extension `0 → ℤ/pℤ → G → μ_p → 0` of finite
  flat groups splits, `G ≅ ℤ/pℤ × μ_p`, while nonsplit extensions `0 → μ_p → G → ℤ/pℤ → 0` exist (for
  instance the Katz–Mazur groups `G_ε` for units `ε ∉ ℤ_p^{×p}`).
- `isConnectedLocal_muP` and `not_isConnectedLocal_constantGroup`: at finite level, `μ_p` over
  `F_p` has local coordinate algebra and is connected, while a nontrivial constant group over a
  field is not; a group that is both étale and connected has order `1`
  (`rank_eq_one_of_isEtale_of_isConnectedLocal`).

### R07.1.10 Exact-sequence recognition on truncated Barsotti–Tate groups

Use the shared `TruncatedBT S p n` carrier and basic API of
AbelianSchemesAndArithmeticModuli §A4.5a, including height, base change, descent, Cartier duality,
restriction and `BarsottiTate.truncation`. The coLie and dimension consequences are §R07.1.11.

Prove `TruncatedBT.of_exact`. Let `S` be any scheme, `p` a prime and `n ≥ 1`, and let
`0 → G₁ → G₂ → G₃ → 0` be an exact sequence of fppf sheaves represented by finite locally free
commutative `S`-group schemes, all killed by `p^n`. If any two are objects of `TruncatedBT S p n`,
then so is the third. Their locally constant heights satisfy `h₂ = h₁ + h₃`.

*Proof sketch.* Flatness as fppf `ℤ/p^n`-module sheaves and the level-one Frobenius–Verschiebung
exactness give the two-out-of-three property (Illusie 1.6, quoted in Anschütz–Le Bras 2023,
§4.6, fact (3), p. 59, arXiv `v4`). Multiplicativity of finite locally free ranks in the exact
sequence and `rk Gᵢ = p^{nhᵢ}` give height additivity. The same source, pp. 58–59,
paragraph after Proposition 4.6.2 and facts (1)–(2), supplies the definition and basic operations
owned by AbelianSchemesAndArithmeticModuli §A4.5a.

*Needs:* AbelianSchemesAndArithmeticModuli §A4.5a (`TruncatedBT` and its basic API);
TauCetiRoadmap.ModularCurves Layers 0B and 0C (finite locally free groups, quotients and ranks).

**Checks.**

- `0 → μ_{p^n} → μ_{p^n} × (ℤ/p^n)_S → (ℤ/p^n)_S → 0` has heights `1, 2, 1`,
  over any scheme `S`.
- The split exact sequence with middle term `(ℤ/p^n)_S^{a+b}` and outer terms of ranks
  `p^{na}` and `p^{nb}` recovers the constant height identity `a + b`.
- Over `𝔽̄_p`, for a supersingular elliptic curve the exact sequence
  `0 → α_p → E[p] → α_p → 0` has only its middle term a `BT₁`. One `BT₁` term alone
  does not imply recognition of the others.
- Over `𝔽_p`, `0 → μ_{p^n} → μ_{p^{2n}} → μ_{p^n} → 0` has `BT_n` outer terms,
  but the middle term is not killed by `p^n`. The common torsion hypothesis is necessary.

### R07.1.11 Recognising truncated Barsotti–Tate groups: Illusie's coLie criterion and the fibrewise criterion

Prove `btNRecognition`. Let `G` be a finite locally free group scheme killed by `p^n` over a scheme `S`
with `p^n O_S = 0`, with coLie complex `ℓ_G, ω_G = H⁰(ℓ_G), n_G = H^{−1}(ℓ_G), t_G = H⁰(ℓ̌_G)` and `ν_G = H¹(ℓ̌_G)`. Grothendieck's duality formula identifies `ℓ̌_G` with `τ^{≤1} RHom(G^D, G_a)`, giving a
canonical `φ_G : ν_G → t_G`. `(i)` (Illusie) `G` is a `BT_n` if and only if `t_G` and `t_{G^D}` are locally free
and `φ_G` and `φ_{G^D}` are isomorphisms; then `ω_G` is locally free of rank `dim G` and `ν_{G^D}` is locally
free of rank `h − dim G`. `(ii)` (Fibrewise criterion) Let `p` be nilpotent on `S` and `G` finite
locally free and killed by `p^n`. For `n = 1`, `G` is a `BT₁` if and only if every fibre `G_s`, `s ∈ S`, is a `BT₁` over `κ(s)`. For `n ≥ 2` the same holds under the additional hypothesis that the
kernels `G[p^i]`, `1 ≤ i < n`, are finite locally free over `S`. The statement for `n ≥ 2` without
that hypothesis is attributed to Fargues in the literature without a published proof, and is not
asserted here.

Over an `F_p`-base, `ω_G` is locally free of rank `dim G` and `dim G + dim G^D = h`.
For a truncation `G = H[p^n]` over a mixed-characteristic base, instead use
`ω_G ≅ ω_H/p^nω_H`; this is not generally locally free over `O_S`.

Construct the common group-specific complexes here and in §R07.6.6: for every flat, finitely
presented commutative group scheme `G/S` with unit `e_G`, the coLie complex is
`ℓ_G = Le_G* L_(G/S)` and its derived dual, the Lie complex, is
`ℓ̌_G = RHom_(O_S)(ℓ_G, O_S)`, using DerivedModuleAlgebra §0.4. A homomorphism `H → G`
induces `ℓ_G → ℓ_H` and dually `ℓ̌_H → ℓ̌_G`. Nilpotence of `p` is required for the recognition
criteria above, not for these constructions.

*Proof sketch.* `(i)` is Illusie's Corollaire 2.2.5, quoted with its notation by Anschütz–Le Bras,
Remark 4.6.3. `(ii)` for `n = 1`: reduce to `S` over `F_p`; `F : G → G^{(p)}` factors through `G → ker(V : G^{(p)} → G)`; this map is surjective by the hypothesis on fibres, hence flat by the fibrewise
flatness criterion (EGA IV₃ 11.3.10) and so faithfully flat; then `ker F = im V` (Pilloni, Lemma
10.1.1, proof, p. 57). `(ii)` for `n ≥ 2`: since each `G[p^i]` is finite locally free by hypothesis,
the fibrewise flatness criterion applies to the maps `p^{n−i} : G → G[p^i]`, which are surjective on
fibres because the fibres are `BT_n`; so they are faithfully flat and `im p^{n−i} = ker p^i`, which
is flatness over `ℤ/p^n`; the Frobenius condition is the case `n = 1` applied to `G[p]`. Pilloni
asserts the unconditional statement and attributes it to Fargues (footnote `14`). (Anschütz–Le Bras
2023, §4.6, Remark 4.6.3, p. 59 (arXiv `v4`): Illusie's criterion (Corollaire 2.2.5) for a `BT_n` in
terms of `t_G, t_{G^D}, φ_G, φ_{G^D}`, with the ranks of `ω_G` and `ν_{G^D}`; Pilloni 2020, §10.1, proof
of Lemma 10.1.1 and footnote `14`, p. 57: the fibrewise criterion, proved for `n = 1`, with the general
case asserted and attributed to Fargues.)

*Needs:* AbelianSchemesAndArithmeticModuli §A4.5a (`TruncatedBT`); §R07.1.1;
DerivedModuleAlgebra §0.4 (the full cotangent complex); TauCetiRoadmap.ModularCurves Layer 0B.

**Checks.**

- `btNRecognition_muP`: `μ_p` over `ℤ/p²` has every fibre a `BT₁` (the only fibre is `μ_p` over
  `F_p`), so it is a `BT₁` over `ℤ/p²`.
- `btNRecognition_alphaP`: over `F_p[ε]`, any finite locally free group whose special fibre is `α_p`
  fails `(ii)`, since `α_p` is not a `BT₁` (AbelianSchemesAndArithmeticModuli §A4.5a).
- `btNRecognition_ranks`: for `G = μ_{p^n}`, `(i)` gives `ω_G` locally free of rank `1 = dim G` and
  `ν_{G^D}` of rank `h − dim G = 0`; for `G = ℤ/p^n` the ranks are `0` and `1`.
- For `G = μ_p` over `R = ℤ/p², ω_G = R/pR` is not free over `R`; nilpotence of `p`
  alone does not give `O_S`-local freeness. Over `F_p` it has rank `1`.
- For `G = μ_p` over any ring `R`, the coLie complex is `[R →^{p} R]` in degrees
  `−1, 0`, and its derived dual is the Lie complex in degrees `0, 1`; over `F_p` both
  differentials vanish, so the two degree conventions remain distinct.

### R07.1.12 Commutative formal Lie groups, their dimension and `p`-divisibility

Define `FormalLieGroup`. Let `Λ` be a complete noetherian local ring and `p` a prime (`p`-divisibility is
a nontrivial condition only when the residue characteristic of `Λ` is `p`). A commutative formal Lie
group of dimension `n` over `Λ` is `Spf Λ⟦X_1, …, X_n⟧` with a group law given by an `n`-tuple of power
series `Φ(X, Y) ∈ Λ⟦X, Y⟧^n` satisfying `Φ(X, Φ(Y, Z)) = Φ(Φ(X, Y), Z), Φ(X, 0) = X = Φ(0, X)` and `Φ(X, Y) = Φ(Y, X)`; homomorphisms are `n′`-tuples of power series without constant term compatible with the
laws. It is `p`-divisible if `[p]^* : Λ⟦X⟧ → Λ⟦X⟧` makes `Λ⟦X⟧` a free module of finite rank over itself;
the rank is then `p^h, h` the height. For `n = 1` the law is Mathlib's one-dimensional `FormalGroup Λ`
with `FormalGroup.IsComm`, and the `n`-dimensional structure follows its conventions.

*Construction.* Definition as displayed (Stix §10.2.2): connected and formally smooth with a unit
section is equivalent to the coordinate ring being `Λ⟦X_1, …, X_n⟧`, and `n` is the rank of `I/I²` for the
augmentation ideal `I`, so the dimension is well defined. The inverse exists automatically: the left
inverse `λ(X)` is built degree by degree, `λ_{m+1} = λ_m − Φ(λ_m(X), X)` modulo degree `m + 2` (Stix
§10.2.2), and it equals the right inverse. `[p]^*` is finite flat of degree `p^h`; its kernel is a
connected finite flat group because it is represented by a quotient of `Λ⟦X⟧` (Stix §10.3). (Stix
2012, §10.2.2, p. 59: the definition and the dimension; Stix 2012, §10.3, p. 60: `p`-divisibility and
height.)

The API:

- `FormalLieGroup`: structure FormalLieGroup `(Λ) (n : ℕ)` : law : Fin `n →` MvPowerSeries (Fin `n ⊕` Fin
  `n`) `Λ` with associativity, unit and commutativity axioms.
- `FormalLieGroup.dim`: The dimension `n`.
- `FormalLieGroup.inv`: The formal inverse, with `Φ`(`X`, inv `X`) `= 0`.
- `FormalLieGroup.mulP`: `[p]` : the `p`-fold sum, an endomorphism.
- `FormalLieGroup.IsPDivisible`: `[p]^*` makes `Λ⟦X⟧` free of finite rank over itself.
- `FormalLieGroup.height`: `log_p` of the rank of `[p]^*`, for a `p`-divisible formal Lie group.
- `FormalLieGroup.Hom` and `FormalLieGroup.End`: law-preserving tuples with zero
  constant term, with composition, extensionality, pointwise formal-group addition and
  additive inverses; the endomorphisms form a ring. The linear terms give the Lie
  functor and the ring map `FormalLieGroup.linearPartHom : End F →+* Matrix (Fin n) (Fin n) Λ`.
- `FormalLieGroup.Points F S J`: for a `Λ`-algebra `S` complete and separated for an
  ideal `J`, the tuples in `J.radical`, with addition obtained by convergent adic
  evaluation of the law. A formal homomorphism induces an additive map on these
  points, functorial under continuous algebra maps carrying the ideals into one another.
  `FormalLieGroup.evalPoints` is evaluation of a formal homomorphism on this group.
- `FormalLieGroup.ofFormalGroup`: the dimension-one comparison with Mathlib's
  commutative `FormalGroup`; `FormalLieGroup.nthSeries` is the integer multiplication
  series, whose linear term is `n·id`. These interfaces use formal substitution and
  the chain rule (Stix 2012, §§10.2.2 and 11.3.1, pp.59, 70–71).

*Needs:* Mathlib `MvPowerSeries`; Mathlib `IsAdicComplete`; Mathlib `IsNoetherianRing`; Mathlib
`IsLocalRing`.

**Checks.**

- `FormalLieGroup.dim_multiplicative`: `Ĝ_m = (X + Y + XY)` has dimension `1`, and height `1` over `ℤ_p`.
- `FormalLieGroup.not_isPDivisible_additive`: Over `𝔽_p, Ĝ_a (X + Y)` is not `p`-divisible: `[p] = 0` is
  not finite.
- `FormalLieGroup.dim_zero`: The zero-dimensional formal Lie group is `Spf Λ`, of height `0`.
- `FormalLieGroup.height_elliptic`: For `E` over `W(𝔽̄_p), Ê` has dimension `1` and height `1` (ordinary) or
  `2` (supersingular) (ModularCurves Layer 7E (PD-`5`)).
- For `Ĝ_m`, `nthSeries n=(1+X)^n−1` has linear term `nX`; its points on
  a complete local ring identify with `1+m`, with multiplication as the group law.
- On square-zero ideals all quadratic terms vanish: the point functor becomes the
  additive tangent space and `evalPoints` is the linear part.
- Over `𝔽_p`, `[p]` on `Ĝ_m` is `X^p`, a nonzero series with zero linear part.
  Thus the Lie functor need not be faithful.

### R07.1.13 Connected `p`-divisible groups are `p`-divisible formal Lie groups

Prove `BarsottiTate.equivFormalLieGroup`. Let `Λ` be a complete noetherian local ring with residue
field of characteristic `p > 0`. The functor `𝒢 ↦ 𝒢[p^∞] = (ker [p^v])_v` is an equivalence between
`p`-divisible commutative formal Lie groups over `Λ` and connected `p`-divisible groups over `Λ`, preserving
height. Its inverse sends `G = (Spec A_v)` to `Spf(lim A_v)`, whose coordinate ring is `Λ⟦X_1, …, X_n⟧`.

*Proof sketch.* For `𝒢 = Spf Λ⟦X⟧ p`-divisible of height `h: [p]^v` is finite flat of degree `p^{hv}`, so
`𝒢[p^v]` is connected finite flat of order `p^{hv}` and `0 → 𝒢[p^v] → 𝒢[p^{v+1}] → 𝒢[p^{v+1}]` is exact.
Fully faithful: `[p](I) ⊆ pI + I² ⊆ MI`, so `[p]^v(I) → 0 M`-adically and `Λ⟦X⟧ = lim A_v`; hence `Hom(𝒢, 𝒢′) = lim Hom(A′_v, A_v) = Hom(𝒢[p^∞], 𝒢′[p^∞])` (Tate Proposition 1, Stix Theorem 70). Essentially
surjective: for connected `G, A = lim A_v` is `Λ`-flat and its reduction modulo `m` is `lim` of the
Frobenius kernels `H_v = ker F^v`; the augmentation ideals satisfy `I_v/I_v² ≅ I_1/I_1²`, so `k⟦X_1, …, X_n⟧ → A/mA` is surjective, and a count of orders (#`H_v = p^{nv}`, from the structure of Frobenius
height one, Stix Proposition 48) makes it bijective; lift to `Λ` by Nakayama and flatness. (Tate 1967,
(2.2), Proposition 1, p. 162: the statement; Stix 2012, §10.3.1, Theorem 70, pp. 60–62: the
statement with a full proof.)

*Needs:* §R07.1.12; Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

**Checks.**

- `equivFormalLieGroup_muPInfty`: `μ_{p^∞} ↔ Ĝ_m: lim Λ[T]/(T^{p^n} − 1) = Λ⟦X⟧` with `T = 1 + X`.
- `equivFormalLieGroup_elliptic`: for `E` over `W(𝔽̄_p), E[p^∞]^0 ↔ Ê`, of height `1` (ordinary) or `2`
  (supersingular).
- `equivFormalLieGroup_etale`: an étale `p`-divisible group such as `ℚ_p/ℤ_p` is not connected and
  is not in the source category; its formal completion at the identity is the trivial formal group,
  of height `0`, not `1`.

### R07.1.14 The dimension of a `p`-divisible group

Define `BarsottiTate.dim`. Let `Λ` be a complete noetherian local ring with residue field of
characteristic `p` and `G` a `p`-divisible group over `Λ`. The dimension `dim G` is the dimension of the
`p`-divisible formal Lie group attached to the connected part `G^0` (§R07.1.13). It is unchanged by
reduction modulo the maximal ideal, and the tangent space `t_G` of `G` is that of this formal Lie group.

*Construction.* Definition as displayed (Tate (2.2)). Over a field `k` of characteristic `p, dim G = n`
where `ker(F : G^0 → G^{0(p)})` has order `p^n` (Tate, proof of Proposition 3; Stix Proposition 48),
which shows invariance under reduction. `t_G(Λ) = Hom(I/I², Λ)` for the augmentation ideal `I` of `Λ⟦X_1, …, X_n⟧`; it is free of rank `n`. (Tate 1967, (2.2), before Proposition 2, p. 164: the definition.)

The API:

- `BarsottiTate.dim`: `dim G : ℕ`, the dimension of the formal Lie group of `G⁰`.
- `BarsottiTate.tangentSpace`: `t_G`, a free `Λ`-module of rank `dim G`.
- `BarsottiTate.dim_baseChange`: The dimension is unchanged by local base change, in particular by
  reduction to the residue field.
- `BarsottiTate.dim_le_height`: `dim G ≤` height of `G⁰ ≤ h`.

*Needs:* §R07.1.13; §R07.1.9; §R07.1.12.

**Checks.**

- `BarsottiTate.dim_muPInfty`: `dim μ_{p^∞} = 1`.
- `BarsottiTate.dim_constQpZp`: `dim ℚ_p/ℤ_p = 0`.
- `BarsottiTate.dim_supersingular`: For supersingular `E` over `W(𝔽̄_p), E[p^∞]` is connected of height
  `2` but has dimension `1`: the dimension is not the height of the connected part.
- `BarsottiTate.dim_height_zero`: A height-zero `p`-divisible group has dimension `0`.
- `BarsottiTate.dim_abelianScheme`: `dim A[p^∞] = dim A` for an abelian scheme `A` over `Λ`.

### R07.1.15 `dim G + dim G^D =` height

Prove `BarsottiTate.dim_add_dim_cartierDual`. For a `p`-divisible group `G` of height `h` over a complete
noetherian local ring with residue characteristic `p, dim G + dim G^D = h`.

*Proof sketch.* Both dimensions and the height are unchanged by reduction to the residue field `k`, so
assume `Λ = k` of characteristic `p`. From `V ∘ F = p` on `G_1 = ker p` (Frobenius and Verschiebung,
§R07.1.1) one gets `0 → ker F → ker p → ker V → 0`; `ker p` has order `p^h` and `ker F` has order `p^n` (`F` is
injective on `G^{ét}`, and on `G⁰` its kernel has order `p^n`). `V` is dual to `F` on `G^D`, so `ker V` has order
`p^{n′}`; hence `h = n + n′`. (Tate 1967, (2.3), Proposition 3, pp. 166–167: the statement and proof.)

*Needs:* §R07.1.14; §R07.1.7; §R07.1.1.

**Checks.**

- `dim_add_dim_cartierDual_muPInfty`: `μ_{p^∞}`: `1 + 0 = 1`, since its dual is `ℚ_p/ℤ_p`.
- `dim_add_dim_cartierDual_supersingular`: supersingular `E[p^∞]`: `1 + 1 = 2`; the dimension of a
  connected group is not its height.
- `dim_add_dim_cartierDual_ordinary`: ordinary `E[p^∞]` over `F̄_p`, `μ_{p^∞} × ℚ_p/ℤ_p`: `1 + 1 = 2`.

### R07.1.16 The discriminant of the levels of a `p`-divisible group

Prove `BarsottiTate.discr_level`. Let `R` be a complete noetherian local ring with residue
characteristic `p`, and `G = (Spec A_v)` a `p`-divisible group of height `h` and dimension `n` over `R`. The
discriminant ideal of the finite free `R`-algebra `A_v` is generated by `p^{n v p^{hv}}`. For an exact
sequence `0 → H′ → H → H″ → 0` of finite groups of orders `m′, m, m″, disc(H) = disc(H′)^{m″} · disc(H″)^{m′}`.

*Proof sketch.* Transitivity of discriminants gives the formula for extensions (Tate (2.2)); so
reduce to the connected and étale parts, the étale part contributing a unit. For connected `G` with
formal Lie group `Spf 𝒜, 𝒜 = R⟦X_1, …, X_n⟧` is free of rank `p^{hv}` over itself via `[p^v]`; the
discriminant of `𝒜` over `𝒜′ = [p^v]^*(𝒜)` is generated by the norm of the Jacobian determinant `a` of
`[p^v]`, which is `p^{nv}` on invariant differentials (Tate Lemma 1, via the trace map). Base change `𝒜′ → R` along the augmentation gives `disc(A_v) = (N(a)) = (p^{n v p^{hv}})`. (Tate 1967, (2.2),
Proposition 2 and Lemma 1, pp. 164–165: the statement.)

*Needs:* §R07.1.14; §R07.1.13; Mathlib `Algebra.discr`.

**Checks.**

- `discr_level_muP`: `μ_{p^v}: A_v = R[T]/(T^{p^v} − 1)` has discriminant `±p^{v p^v} (n = h = 1)`.
- `discr_level_etale`: for étale `G (n = 0)` the discriminant is the unit ideal.

### R07.1.17 Invariant differentials of the levels and the absolute different

Prove `invariantDifferentialsAndAbsoluteDifferent`. Let `R` be a complete discrete valuation ring of
mixed characteristic `(0, p)` with perfect residue field, and for a finite flat commutative `R`-group
scheme `𝒢 = Spec A` write `ω_𝒢 = e*Ω¹_{𝒢/R}`. `(i)` If `G` is a `p`-divisible group of dimension `d` over `R`,
then for every `v ≥ 1` the invariant differentials of the level `G[p^v]` form a free `R/p^v`-module of
rank `d: ω_{G[p^v]} ≅ (R/p^vR)^d`, so `length_R ω_{G[p^v]} = v·e·d` with `e = v_R(p)`. `(ii)` For every
finite flat commutative `𝒢` over `R` the absolute different `𝔇(𝒢)` of Raynaud (the ideal of `R` with `𝔇_{A/R} = 𝔇(𝒢)·A`) is the `0`th Fitting ideal of the `R`-module `ω_𝒢`; hence `v_R(𝔇(𝒢)) = length_R ω_𝒢` (`ω_𝒢` is
torsion because the generic fibre is étale). (iii) Consequently `v_R(𝔇(G[p^v])) = v·e·d`, and the
discriminant ideal of `G[p^v]` is `𝔇(G[p^v])^{p^{hv}} = (p^{d v p^{hv}})`, which recovers Tate's
Proposition 2 (§R07.1.16).

`R` a complete DVR of mixed characteristic `(0, p)` with perfect residue field; `𝒢` finite flat
commutative over `R`; `G p`-divisible of height `h` and dimension `d` (§R07.1.14). Finite flat group schemes
over `R` are local complete intersections over `R`: their fibres are finite group schemes over fields,
whose affine algebras are complete intersections (over a perfect field the connected part has
algebra `k[X₁, …, X_n]/(X_i^{p^{r_i}})`), and a flat finitely presented morphism with lci fibres is
lci (syntomic). This is the input Raynaud uses for the duality of the appendix and Fontaine uses in
Théorème 1 `(a)`.

*Proof sketch.* `(i)` The connected–étale sequence (§R07.1.9) reduces to `G` connected, since the étale
part has `ω = 0` and `ω` is additive on short exact sequences of finite flat groups with étale quotient.
For connected `G` with formal Lie group `Spf R⟦X₁, …, X_d⟧` (§R07.1.13), `ω_G` is free of rank `d` and `[p^v]`
acts on it by `p^v`; the exact sequence `0 → G[p^v] → G → G → 0` (multiplication by `p^v`) gives `0 → ω_G →^{p^v} ω_G → ω_{G[p^v]} → 0`, so `ω_{G[p^v]} ≅ ω_G/p^vω_G ≅ (R/p^v)^d` (Fontaine 1985, §2.1, proof of
Théorème 1 `(b)`). `(ii)` For a finite flat lci `R`-algebra `A`, the Dedekind (Noether) different equals the
Kähler different, the `0`th Fitting ideal of `Ω¹_{A/R}` (Tate, in the appendix to Mazur–Roberts; Stacks,
Tag 0BWG). For a group scheme `Ω¹_{A/R} ≅ A ⊗_R ω_𝒢` (invariant differentials), and Fitting ideals
commute with base change, so `Fitt₀^A(Ω¹_{A/R}) = Fitt₀^R(ω_𝒢)·A`. Since `𝔇_{A/R} = 𝔇(𝒢)·A` (Raynaud,
Appendice, Définition `8`) and `A` is faithfully flat over `R, 𝔇(𝒢) = Fitt₀^R(ω_𝒢)`; for a finite torsion
module over a DVR the `0`th Fitting ideal is `π^{length}`. (iii) Combine `(i)` and `(ii)`; the discriminant
of the finite free `R`-algebra `A` is the norm of its different, `N_{A/R}(𝔇(𝒢)·A) = 𝔇(𝒢)^{rank A}`.
(Fontaine 1985, §2.1, proof of Théorème 1 `(b)`, pp. 525–526: for a Barsotti–Tate group `Γ` over `O_K, ω_Γ` is free over `O_K` and the exact sequence of invariant differentials of `0 → Γ_{p^n} → Γ → Γ → 0`
makes `ω_{Γ_{p^n}}` free over `O_K/p^n`; Raynaud 1974, Appendice, Définition `8` and the paragraph before
it, p. 279: the absolute different: the different of the Hopf algebra `A` is translation invariant,
hence comes from an ideal of `R`; the duality used is that of finite locally complete intersection
`R`-algebras; Stacks Project, Tag 0BWB (Discriminants and differents, §12) and Tag 0BWG, Lemma 12.3:
for a flat, quasi-finite, local complete intersection morphism of Noetherian schemes the different
equals the Kähler different (Tate, appendix to Mazur–Roberts); Tate 1967, (2.2), Proposition 2 and
Lemma 1, pp. 164–165: the discriminant formula `disc(G(v)) = (p^{n v p^{hv}})` that (iii) recovers.)

*Needs:* §R07.1.14; §R07.1.13; §R07.1.9; §R07.1.5; §R07.1.16; Mathlib `KaehlerDifferential`; Mathlib
`IsDiscreteValuationRing`.

**Checks.**

- `μ_{p^v}` over `ℤ_p: A = ℤ_p[T]/(T^{p^v} − 1), Ω¹ =` A `dT/(p^v T^{p^v−1} dT)`, so `ω = ℤ_p/p^v`, of
  length `v = v·e·d` with `e = d = 1`; the different is `(p^v T^{p^v−1}) = (p^v)·A`, so `𝔇(μ_{p^v}) = (p^v)`
  as `(ii)` predicts, and the discriminant is `(p^{v p^v})`.
- `ℤ/p^vℤ` (étale): `ω = 0` and `𝔇 = R`.
- Over `ℤ_p[ζ_p] (e = p − 1): μ_p` has `ω = R/p` of length `p − 1`, matching `𝔇(μ_p) = (p) = (π^{p−1})` and
  the character `θ_{p−1}^{p−1} = 1` of §R07.1.33 `(μ_p ⊂ K)`.

### R07.P2 Crystalline period ring and its structures

Throughout §§R07.P2–R07.P5a, `p` is prime, `K/ℚ_p` is finite inside `PadicAlgCl p`,
`G_K` has its Krull topology, `C_p` is `PadicComplex p` with the supplied continuous Galois
action, `k` is the residue field of `K`, and `K₀ = Frac W(k)`. All period rings carry their
canonical period topologies; `V` is a finite-dimensional continuous `ℚ_p`-representation.

Import the principal `O_{ℂ_p}` envelope, its divided-power presentation, separated `p`-adic
completion, initial property, `θ_cris` and logarithmic period from PadicPeriodRings §3.
Import `B_cris^+=A_cris[1/p], B_cris=B_cris^+[1/t]` and their topological period
structures from PadicPeriodRings §4.1: the continuous `G_K`-action, Witt Frobenius,
`φ(t)=pt`, the `K₀`-embedding with `σ`-semilinear Frobenius, the injective maps
`B_cris→B_dR` and `K⊗_{K₀}B_cris→B_dR`, and the pullback filtration.
Use these supplied objects and identities at finite `K` throughout this roadmap.
The arithmetic realization comparisons are specified in §R07.3.0.

(Fontaine, Le corps des périodes, Theorem 2.2.1 and proof, pp. 76–77;
§§2.3.1–2.3.4, pp. 78–79; §4.1, pp. 83–84; Theorem 4.2.4, p. 86,
proof §4.3, pp. 87–89.)

The consumer names denote the following supplied objects and identities:

- `aCris` — The `O_{ℂ_p}` carrier of PadicPeriodRings §3.
- `aCris_model_equiv` — Its supplied canonical PD `A_inf`-algebra isomorphism from the
  completed explicit model, preserving `θ_cris` and the logarithmic period; §4.1 supplies
  compatibility with `G_K`, Frobenius and the `B_dR^+` map.
- `bCris` — The supplied localization obtained by inverting `p` and `t` (§4.1).
- `bCris_toBDR` — The supplied injective Galois-compatible period map (§4.1).
- `bCris_frobenius` — The supplied `σ`-semilinear Frobenius commuting with `G_K` and sending `t` to `pt` (§4.1).
- `bCris_generatorIndependent` — The supplied canonical identifications under changes of
  primitive kernel generator or Tate generator (§§3, 4.1).

**Checks on the imported interface.**

- The model comparison fixes `A_inf` and `θ_cris`, sends `log[ε]` to the same nonzero `t`,
  and intertwines `φ(t)=pt` and `g(t)=χ(g)t`.
- `θ(t)=0` before `t` is inverted; `θ` cannot extend as a unital map `B_cris→C_p`.
- The period map to `B_dR` is injective and respects `G_K`; a free formal PD variable does not satisfy this comparison.

*Needs:* PadicPeriodRings §§3, 4.1 (principal envelope, completed model, logarithm,
crystalline carriers and period structure maps).

### R07.P3 Fundamental period sequences with continuous sections

Consume PhiGammaModulesAndIwasawaCohomology §5.7, *The local exponential and the
all-level image condition*: its continuous nonequivariant sections of the fundamental
sequence of PadicPeriodRings §4.3 and its pullback
`0→ℚ_p→B_cris^(φ=1)⊕B_dR^+→B_dR→0`, and of the companion sequence
`0→ℚ_p→B_cris⊕B_dR^+→B_cris⊕B_dR→0`.
The first maps are diagonal; the last maps are respectively `x−y` and
`((1−φ)x,x−y)`. Use the supplied continuous-cochain long exact sequences after
tensoring over `ℚ_p` with any finite-dimensional continuous `V`, including finite
coefficient extensions, and the supplied boundary
`blochKatoExp V : D_dR(V)/Fil⁰→H¹(K,V)`. These constructions require no de Rham
hypothesis. The sections and topologies are part of the supplied interface, not consequences
of algebraic exactness alone.

For a `p`-divisible group `G` of arbitrary height over `O_K`, use
`T = BarsottiTate.tateModule G` and `V = T⊗_{ℤ_p}ℚ_p` from §R07.1.8, whose
finite levels satisfy `T/pⁿT ≅ G[pⁿ](K̄)` for `n≥1`. Identify the supplied sequences
and boundaries on the realization interfaces of §R07.P5. The tensor flip
`v⊗b↦b⊗v` intertwines their diagonal and difference maps; Frobenius acts on the
crystalline period factor. With `δ_e,V` and `δ_f,V` denoting the connecting maps from
`D_dR(V)` and `D_cris(V)⊕D_dR(V)` respectively, prove the specialization equations
`δ_e,V(z) = blochKatoExp V ([z]) = δ_f,V(0,z)` for every `z∈D_dR(V)`.
For a lift `w=(x,y)` of `z` under the first difference map, this class is represented
by `g↦g(w)−w`, using `v↦(1⊗v,1⊗v)` to identify the kernel with `V`.
Require these identifications to commute with homomorphisms of `p`-divisible groups,
finite coefficient extensions and Tate twists of `V`. Retain the supplied general-`V`
interface for consumers. Over unramified `K`, finite flat torsion coefficients use
§R07.P5a's integral predicates; §R07.1.24a gives the finite-flat model predicate for any
finite `K/ℚ_p`. Section R07.3.0 preserves these boundary equations under its period comparisons.

The specialization uses the naturality of the supplied connecting maps and the inclusion
of the first tensor sequence into the companion, whose map on the final term is
`z↦(0,z)`. (Bloch–Kato, Proposition 1.17 and Remark 1.18, pp. 340–341;
Example 3.9, p. 359, for the rank-one boundary cases.)

**Checks.**

- For `V = 0` every term and the boundary map vanish.
- For `V = ℚ_p`, the diagonal scalar pair maps to zero under the difference map; the sign is `x−y`.
- On a Tate twist, tensoring and the boundary commute with the twist and retain the period's continuous Galois action.
- For `G=ℚ_p/ℤ_p`, `V=ℚ_p` and `D_dR(V)/Fil⁰=0`, so the exponential image
  `H¹_e(K,V)` is zero, while `H¹_f(K,V)` contains the nonzero unramified class.
- For `G=μ_{p^∞}`, `V=ℚ_p(1)` and the two specialized boundaries agree on
  `D_dR(V)/Fil⁰`; their image is the rational Kummer image of `O_K^×` and excludes
  a uniformizer class. Here `T/pⁿT=μ_{pⁿ}(K̄)`.
- For the nonzero finite flat group `μ_p`, its generic points tensor to zero over
  `ℤ_p` with `ℚ_p`; the rational boundary cannot define its integral crystalline predicate.

*Needs:* PhiGammaModulesAndIwasawaCohomology §5.7 (`blochKatoExp`, continuous sections
and both tensor-cochain long exact sequences); PadicPeriodRings §4.3 (underlying fundamental
exact sequence); §§R07.P2 and R07.P5 (period and realization interfaces);
§R07.1.8 (Tate modules and finite levels); §R07.1.24a (finite-flat model predicate);
§R07.P5a (integral coefficient predicates over unramified bases).

### R07.P4 Period fixed fields and dimension bounds

Import PadicPeriodRings §4.3's fixed fields and regularity at finite `K/ℚ_p: (B_dR^+)^G_K=B_dR^G_K=K` and `B_cris^G_K=K₀`, injectivity of the invariant
comparison maps, the dimension bounds `dim_K D_dR(V)≤dim_ℚp V` and
`dim_K₀ D_cris(V)≤dim_ℚp V`, and the period-line invertibility criterion.
Use these supplied identities on the finite-`K` interfaces of §§R07.P2 and R07.P5;
§R07.3.0 supplies their compatibility with the arithmetic realization comparisons.

(Fontaine, Le corps des périodes, §1.5.7, p. 74; §4.1, pp. 83–84; Fontaine, Représentations semi-stables, Proposition 1.4.2, pp. 123–124; Proposition 5.1.2 and Lemma 5.1.3, pp. 155–156; Nizioł, §2, pp. 749–750.)

**Checks.**

- For `V = ℚ_p`, the fixed fields give `D_dR(V) = K` and `D_cris(V) = K₀`, both of dimension one.
- For `V = 0` both dimension bounds are equalities with dimension zero.
- For ramified `K/ℚ_p`, the crystalline fixed field is `K₀`, not `K`; the scalar-extension injection into `B_dR` uses `K⊗_{K₀}B_cris`.

*Needs:* PadicPeriodRings §4.3 (fixed fields, regularity and dimension bounds); §R07.P2 (supplied crystalline structures).

### R07.P5 Crystalline and de Rham realization data

Import the finite-`K` specializations of PadicPeriodRings §§4.2–4.3's invariant
functors and rational predicates. In the tensor order used here,
`D_cris(V)=(V⊗B_cris)^G_K` over `K₀` and `D_dR(V)=(V⊗B_dR)^G_K` over `K`,
with inherited Frobenius and filtration. The tensor flip identifies these with the
supplier's `(B⊗V)^G_K`, naturally in `V` and compatibly with coefficient extension,
Tate twists and comparison maps. Use the supplied crystalline and de Rham predicates,
including their dimension-equality and comparison-map-isomorphism formulations.
Finite coefficient fields `E/ℚ_p` act through scalar restriction and the commuting
`E`-action on invariants. The finite-`K` arithmetic comparisons are §R07.3.0.

Prove `crystalline_isDeRham` on this supplied interface using the injective map
`K⊗_{K₀}B_cris→B_dR`. Retain the inherited filtration jump `−1` on `ℚ_p(1)`;
§R07.P7.1 defines its labelled Hodge–Tate weight as `+1`. The semistable interface
uses §R07.3.0, and §R07.P5a supplies the integral coefficient predicates.

(Nizioł, §2, pp. 748–751; Bloch–Kato, §1, pp. 337–340.)

The consumer names denote supplied functors, predicates and identities:

- `dCris` — The supplied period tensor invariants over `K₀` (§4.2), in the tensor order above.
- `dDeRham` — The supplied period tensor invariants over `K` with filtration (§4.2), in the tensor order above.
- `IsCrystalline` — The supplied crystalline predicate (§4.3).
- `IsDeRham` — The supplied de Rham predicate (§4.3).
- `crystalline_iff_dim` — The supplied equivalence between dimension equality and the crystalline comparison isomorphism (§4.3).
- `crystalline_isDeRham` — Crystalline implies de Rham via the canonical embedding.

**Checks.**

- The zero representation is crystalline and de Rham with zero realization.
- `D_cris(ℚ_p(n))` is generated by `t^−n`, Frobenius `p^−n` and filtration jump `−n`.
- For ramified `K, D_cris` is a `K₀`-space while `D_dR` is a `K`-space; identifying their scalar rings is wrong.

*Needs:* PadicPeriodRings §§4.2–4.3 (invariant functors, rational predicates and regularity);
§R07.P2 (supplied crystalline structures); §R07.P4 (finite-`K` fixed-field interface).

### R07.P5a Crystalline predicates for integral coefficients

**Integral crystalline coefficient predicates.** For unramified `K/ℚ_p`, define `IsTorsionCrystalline` for a finite `ℤ_p`-Galois module `R` in `[a,b]` by existence of stable lattices `R′⊆R″` in a crystalline rational representation of weights `[a,b]` and a Galois-equivariant isomorphism `R≅R″/R′`. Define `IsIntegralCrystalline` for a finite-type integral module by this predicate on every `R/p^mR, m≥1`. For `O`-coefficients first restrict scalars to `ℤ_p`. These definitions use §R07.P5's rational crystalline predicate and no small-weight realization. Prove invariance under equivariant isomorphisms, scalar restriction, and closure under finite products and subquotients with the same interval; a stable lattice in a crystalline rational representation has crystalline finite reductions.

Here `[a,b]` is always a Hodge–Tate interval with `HT(χ_p)=+1`: the witnessing rational
representation has covariant crystalline filtration jumps in `[−b,−a]`. Torsion modules carry
this existence predicate, not a weight multiset determined by their rationalization. The
source's Hodge–Tate interval `[c,d]`, with `HT(χ_p)=−1`, becomes `[−d,−c]` here.
(Liu–Tian–Xiao–Zhang–Zhu, Definition 2.2.4 and footnote `4`, pp. 124–125.)

**Checks.**

- The zero module satisfies both predicates in every interval.
- `ℤ_p(1)` is integral crystalline in `[1,1]`, and `ℤ/p^m(1)` is torsion crystalline in `[1,1]`
  via `p^mℤ_p(1)⊆ℤ_p(1)`; the rational witness has covariant filtration jump `−1`.
- `ℤ_p(−1)` is integral crystalline in `[−1,−1]`, and `ℤ/p^m(−1)` is torsion crystalline
  in `[−1,−1]`; the rational witness has covariant filtration jump `+1`. No uniqueness of a
  torsion module's witnessing interval is asserted: modulo `p` the twists `1` and `−1` agree
  when `p=3`.
- The trivial `ℤ/p` module in `[0,0]` is nonzero and crystalline, although its tensor over `ℤ_p` with `B_cris` is zero; rational period tensors cannot define the torsion predicate.
- For `K=ℚ₃, μ₃` is not torsion crystalline in `[0,0]`: weight-zero crystalline lattice quotients are unramified by the weight-zero realization of §R07.3.7 (with duality and the interval shift), whereas inertia acts nontrivially on `μ₃`. Indeed, `Φ₃(1+X)=X²+3X+3` is Eisenstein, so `ℚ₃(μ₃)/ℚ₃` is ramified. Thus `ℤ₃(1)` is not integral crystalline in `[0,0]`, already by its mod-`3` reduction. Both `μ₃` and every finite reduction of `ℤ₃(1)` rationalize to zero, so a rational-period-only predicate incorrectly accepts them.

*Needs:* §R07.P5 (Crystalline and de Rham realization data).

### R07.P7.1 Period functors with finite coefficients

Let `K/ℚ_p` inside `ℂ_p` and `E/ℚ_p` be finite, with `E`
containing all embeddings of `K`, and `V` a finite-dimensional continuous `E`-representation of
`G_K`. Consume the topological period rings and actions of PadicPeriodRings §§1–2,
the fixed fields of §R07.P4 and the realization and predicate of §R07.P5. Write `D_dR(V)` for the supplied
`dDeRham(Res_{ℚ_p} V)` and use its `IsDeRham` predicate, filtration and canonical comparison map.
Prove the named adapter `GaloisRep.deRhamSupplierEquiv`: the tensor flip
`v ⊗ b ↦ b ⊗ v` identifies the supplied `(V ⊗_{ℚ_p} B_dR)^{G_K}` with
`(B_dR ⊗_{ℚ_p} V)^{G_K}`, naturally in `ContinuousRep` maps. It is a filtered `K ⊗_{ℚ_p} E`-linear
isomorphism, with `(k ⊗ e)(b ⊗ v) = kb ⊗ ev`, carrying the supplied comparison map to
`B_dR ⊗_K D_dR(V) → B_dR ⊗_{ℚ_p} V`, `b' ⊗ (Σ b_i ⊗ v_i) ↦ Σ b'b_i ⊗ v_i`.
It commutes with every finite coefficient extension `E'/E`, identifying
`D_dR(V) ⊗_E E'` with `D_dR(V ⊗_E E')` and each filtration step with its scalar extension.
De Rham admissibility and its dimension bound are inherited from the supplier;
use the bound to prove that admissibility is equivalent to freeness of rank `dim_E V` over
`K ⊗_{ℚ_p} E`.
Set `B_HT = ⨁_{i∈ℤ} ℂ_p(i)` as a graded Galois algebra, define
`D_HT(V) = (B_HT ⊗_{ℚ_p} V)^{G_K}` and Hodge–Tate by its canonical comparison isomorphism,
equivalently freeness of the same rank over `K ⊗ E`. Prove its dimension bounds, the natural
injection `gr D_dR(V) → D_HT(V)` and its being an isomorphism for de Rham `V`, hence de Rham
implies Hodge–Tate. Split `K ⊗ E = ∏_{τ:K→E} E` to define the labelled weight multisets: a jump
at filtration index `i` has weight `−i` with multiplicity `dim_E gr^i(e_τ D_dR(V))` in the de Rham
case, so `HT_τ(χ_p) = +1`. The adapter preserves the filtration and assigns weight `+1` to the cyclotomic character
at this labelled-weight step. For crystalline `V`, prove the interval identity
`HT_τ(V) ⊆ [a,b] ↔ ∀ i ∉ [-b,-a], gr^i(e_τ D_cris(V)_K) = 0`;
replacing `V` by `V^∨` gives the contravariant filtration interval `[a,b]`.
For `ℚ̄_p`-coefficients, first
descend by ArithmeticGaloisRepresentations §1.5, enlarge `E` to contain the embeddings, and prove that extension of `E` preserves
these properties and weight multisets, independently of the model
(Patrikis 2019, §§2.2.1–2.2.2, pp. 21–23; Brinon–Conrad, §6.1 and §6.3, Proposition 6.3.2, pp. 73–76).
*Needs:* ArithmeticGaloisRepresentations §§1.1–1.2, 1.5; PadicPeriodRings §§1–2; §§R07.P4–R07.P5.

**Checks.**

- On `E(1)`, the adapter sends `e ⊗ t⁻¹` to `t⁻¹ ⊗ e`, preserving the filtration jump `−1`;
  `χ_p` has weight `+1`. The trivial `E`-character gives a free rank-one `K ⊗ E` module,
  filtration jump `0` and weight `0` under both tensor orderings.
- The dual of a Hodge–Tate representation negates every labelled weight.
- The lines `E(1)` and `E(−1)` have Hodge–Tate intervals `[1,1]` and `[−1,−1]`,
  respectively, and covariant filtration jumps `−1` and `+1`; the contravariant jumps
  are `+1` and `−1`.
- If `K ≠ ℚ_p`, a labelled Lubin–Tate character has weight `1` at one embedding and `0` at the
  others; the filtration need not have constant rank over `K ⊗ E` in each degree.
- For `V = 0`, both sides of `GaloisRep.deRhamSupplierEquiv` and their filtrations are zero,
  and the supplied de Rham comparison is an isomorphism of zero modules.
- Extending `E` to `E'` preserves every labelled filtration jump; the `E'`-action comes from the
  representation tensor factor, and the adapter commutes with its extension.

### R07.P7.2 Labelled Sen operators

For the finite-coefficient inputs above, use the normalized traces
of PadicPeriodRings §§1–2 to construct the finite-dimensional Sen module over
`K_∞ = K(μ_{p^∞})`, with a model stable under a small cyclotomic subgroup at a sufficiently
large finite layer, and its operator given by
`log(ρ(γ))/log(χ_p(γ))` for sufficiently small cyclotomic `γ` on the Sen module.
Prove recovery after extension to `ℂ_p`, independence of the layer, model and generator,
functoriality under maps, and insensitivity to finite restriction. For an embedding
`ι : ℚ̄_p → ℂ_p`, descend to `E` and restrict to `G_{Kι(E)}` before constructing the operator;
the induced label is `τ = ι⁻¹|_K`. Define Hodge–Tate–Sen weights as its eigenvalues with
multiplicity. Prove that Hodge–Tate is equivalent to semisimplicity of every labelled Sen operator
with integer eigenvalues, with eigenvalues equal to `HT_τ`. Prove the direct-sum, tensor
(`Θ_{V⊗W} = Θ_V ⊗ 1 + 1 ⊗ Θ_W`), dual and symmetric-power formulas, hence the weight
formulas used below (Patrikis 2019, §2.2.2, Lemmas 2.2.4–2.2.6, pp. 23–24; Brinon–Conrad,
§15.1, Corollary 15.1.6 and Theorem 15.1.7). *Needs:* §R07.P7.1;
ArithmeticGaloisRepresentations §1.5; PadicPeriodRings §§1.3–1.4, `2` (normalized traces).

**Checks.**

- The cyclotomic Sen operator is `1`; its dual has operator `−1`.
- The extension defined by the cocycle `log χ_p` has a nonzero nilpotent Sen operator with
  eigenvalues `0,0`, so integer eigenvalues alone do not imply Hodge–Tate.
- Enlarging the coefficient field or restricting to a finite local extension preserves the
  labelled eigenvalues under the corresponding restriction of embeddings.

### R07.P7.3 Local character criterion and global weights

For `K/ℚ_p`, `E/ℚ_p` finite, with `E`
containing all embeddings of `K`, and a continuous
`χ : G_K → E^×`, prove that Hodge–Tate is equivalent to de Rham and to being locally algebraic
under local reciprocity: on some open subgroup of `O_K^×` the character is
`x ↦ ∏_τ τ(x)^{m_τ}`, with integer exponents, with `HT_τ = −m_τ`: arithmetic reciprocity gives
`χ_p(Art_K(u)) = N_{K/ℚ_p}(u)⁻¹` for units, as in ClassFieldTheory Layer 7. Prove that all labelled Sen operators vanish
iff the inertia image is finite; unramified characters may still have infinite image.
For `F` totally real and a continuous global character unramified almost everywhere, prove that
rational labelled Sen weights are all equal, hence a de Rham character has one common integer
weight. Use the locally algebraic character–Hecke character correspondence and the unit relations
of GlobalNumberFields Layers 9–10 (`HeckeCharacter`, `AlgebraicInfinityType`, `HeckeCharacter.IsAlgebraic`), together with ClassFieldTheory's arithmetic reciprocity;
prove the local-to-global identification of labels and infinity exponents here. For `x ∈ ℤ`,
`d ≥ 1`, construct a character with every Sen weight `x/d` by ArithmeticGaloisRepresentations §7.6 (Roots of characters);
it is Hodge–Tate iff `d | x` (Patrikis 2019, Theorem 2.3.13, Remark 2.3.14 and Lemmas 2.3.15, 2.3.17, pp. 30–32;
Brinon–Conrad, Example 6.3.9, pp. 81–82, for the zero-weight character case). *Needs:* §R07.P7.2; ArithmeticGaloisRepresentations §7.6 (Roots of characters); ClassFieldTheory Layers 7 and 11 (global Artin reciprocity);
GlobalNumberFields Layers 9–10 (Hecke-character infinity types and unit relations).

**Checks.**

- A finite-order character has all weights zero and finite inertia image.
- An unramified character sending Frobenius to `1+p` has weight zero and infinite total image;
  the criterion concerns inertia.
- A square root of `χ_p` up to finite order has weight `1/2` and is not Hodge–Tate; its square
  has weight `1`. The cyclotomic character fixes the reciprocity sign in the algebraic formula.

### R07.P7.4 Strong irreducibility of tensor products

Prove that for `F` a number field,
`ρ, ρ' : G_F → GL₂(ℚ̄_p)` continuous and strongly irreducible, and `τ : F → ℚ̄_p` at `v | p` with both
restrictions Hodge–Tate, `HT_τ(ρ) = {a, b}`, `HT_τ(ρ') = {a', b'}` and `a − b ≠ ±(a' − b')`, the image
of `Proj ρ × Proj ρ'` is Zariski dense in `PGL₂ × PGL₂`, and
`(Sym^m ρ ⊗ Sym^{m'} ρ')|_{G_{F(ζ_{p^∞})}}` is strongly irreducible for all `m, m' ≥ 1` (Newton–Thorne 2026, Lemma
2.2, p. 10).

*Needs:* §§R07.P7.1–R07.P7.2; ArithmeticGaloisRepresentations §7.6
(Strong irreducibility, Zariski closures and Goursat for `PGL₂`); ArithmeticGaloisRepresentations
§1.5 (finite coefficient models).

**Checks.**

- For `m = m′ = 1` the theorem gives strong irreducibility of the four-dimensional tensor product after cyclotomic restriction.
- Taking `ρ′ = ρ` violates the weight-gap condition; `V⊗V` has its invariant exterior-square summand, so the condition cannot be dropped.
- Interchanging the two weights in either pair changes a gap's sign; the condition with `±` and the conclusion are invariant under that interchange.

### R07.P7.5 Hodge–Tate lifts

Prove: `(1)` for `P : G_F → PGL₂(ℚ̄_ℓ)` continuous, unramified almost everywhere,
with `ad⁰` of one (hence every) lift de Rham at all `v | ℓ`, a lift exists with Hodge–Tate–Sen weights
in `½ℤ` at every `v | ℓ` and `τ` and `det` of finite order, and every such lift has `Sym² ρ` and
`det ρ` geometric. A finite-determinant lift need not be Hodge–Tate: for the projectivization
of an elliptic Tate module with weights `{0, 1}`, every finite-determinant lift has weights
`{−½, ½}` and is not Hodge–Tate, although the original Tate module is
(Patrikis 2019, Remark 2.1.5, p. 17). The proof uses §R07.P7.3: a character of
`G_{F_v}` with zero labelled Sen operators has finite inertia image. `(2)` For `F` totally real, `F'/F` quadratic and `s : G_{F'} → GL₂(ℚ̄_ℓ)`
unramified almost everywhere, de Rham at all `v | ℓ` with weights `{−1, 0}` at every `τ` (BCGP 2021 write
`{0, 1}` with `HT(ε) = −1`), and `Proj s` extending to `P` on `G_F`: `P` lifts to
`r̃ : G_F → GL₂(ℚ̄_ℓ)` unramified almost everywhere, Hodge–Tate of weights `{−1, 0}` at every `v | ℓ`
and `τ`, with `r̃|_{G_{F'}} = s ⊗ ψ` for `ψ` of finite order (BCGP 2021, proof of Prop. 9.2.1, p. 254).
*Needs:* ArithmeticGaloisRepresentations §7.6 (Projective lifting; Roots of characters);
§§R07.P7.1–R07.P7.3.

**Checks.**

- The projectivization of an elliptic Tate module of weights `{0,1}` has a determinant-finite
  lift with weights `{−1/2,1/2}`. No finite-determinant lift is Hodge–Tate, while the original
  Tate module is a Hodge–Tate lift with cyclotomic determinant.
- Twisting a lift by a finite-order character preserves its labelled Sen weights.
- A local character with zero Sen operator can have infinite unramified image; finite inertia
  suffices to preserve unramifiedness outside finitely many places in the lifting argument.

### R07.1.19 Tate's Hodge–Tate decomposition for `p`-divisible groups

Prove `BarsottiTate.hodgeTate`. Let `R` be a complete discrete valuation ring with perfect residue
field of characteristic `p` and fraction field `K` of characteristic `0, C` the completion of an algebraic
closure of `K`, and `G` a `p`-divisible group over `R` with Cartier dual `G^D`. `(i)` (Tate Theorem 3) The maps
`Ĝ(R) → Hom_{G_K}(T_p(G^D), 𝔘)` and `t_G(K) → Hom_{G_K}(T_p(G^D), C)`, where `𝔘` is the group of principal
units of the ring of integers of `C` and `α` is induced by the Cartier pairing, are bijective. `(ii)`
There is a unique `G_K`-equivariant decomposition `T_p(G) ⊗_{ℤ_p} C ≅ (t_{G^D}(K)^∨ ⊗_K C) ⊕ (t_G(K) ⊗_K C(1))`; so `V_p(G)` is Hodge–Tate with weights `0` and `1`, of multiplicities `dim G^D` and `dim G`. (iii)
`T_p(G)` determines `dim G`.

Define `BarsottiTate.completedPoints` by
`Ĝ(V) = lim_i colim_n G`[p^n](V/m_R^iV) for a complete valuation ring `V` over `R`.
For connected `G` this is the points of its formal Lie group; for étale `G` it is the torsion
group of residue-field points. Its functoriality, connected–étale exactness and logarithm
are part of this target (Stix §11.1, Definition of points and Example `81`, pp. 68–69).

*Proof sketch.* Tate–Sen (PadicPeriodRings §2): `H^0(G_K, C) = K, H^0(G_K, C(j)) = 0` and `H^1(G_K, C(j)) = 0` for
`j ≠ 0` (Tate Theorems `1`–`2`; Stix Theorem 88). The logarithm of the formal group gives `0 → Φ_p(G) → Ĝ(𝒪_C) → t_G(C) → 0`, and the Cartier pairing gives `α : Ĝ(𝒪_C) → Hom(T_p(G^D), 𝔘)` with differential
`dα` (Stix §11.3–11.5). Injectivity of `α_R` and `dα_R`: reduce to `G` connected or étale by exactness of `G ↦ Ĝ(R)` on the connected–étale sequence; `Ĝ(R)` contains no `K`-vector space (Stix Theorem 91, Steps
`1`–`4`). Surjectivity by dimensions: `d = dim_K W^{G_K}, d′ = dim_K W′^{G_K}` for `W = Hom(T_p G, C), W′ = Hom(T_p G^D, C)`; the invariants pair into `H^0(G_K, C(−1)) = 0`, so `d + d′ ≤ h = n + n′` (§R07.1.15),
forcing equality. `(ii)` The exact sequence `0 → t_G(C)(1) → T_p(G) ⊗ C → t_{G^D}(C)^∨ → 0` splits
uniquely since `H^1(G_K, C(1)) = 0 = H^0(G_K, C(1))` (Stix Corollaries `92`–`93`); (iii) follows from
`(ii)`. (Tate 1967, (4.1), Theorem 3 and its Corollary 1, pp. 179–180: parts `(i)` and (iii); Stix 2012,
§11.7, Theorem 91 and Corollaries `92`–`93`, pp. 73–75: part `(ii)`, with a full proof of `(i)`.)

*Needs:* §R07.1.8; §R07.1.14; §R07.1.15; §R07.1.7; §R07.1.13; PadicPeriodRings §2 (`tateSen`, `PadicFieldCompletion`).

**Checks.**

- `hodgeTate_muPInfty`: for `μ_{p^∞}`, `T_p ⊗ C = C(1)`, weight `1` of multiplicity `1 = dim μ_{p^∞}`; for `ℚ_p/ℤ_p`, weight `0`. A convention with `HT(χ) = −1` would give weight `−1` for
  `μ_{p^∞}`.
- `hodgeTate_det`: `det V_p(G) ⊗ C ≅ C(dim G)` (Stix Corollary 94).
- `hodgeTate_elliptic`: for an elliptic curve with good reduction, `V_p(E)` has Hodge–Tate weights
  `0` and `1`, each of multiplicity one, whether the reduction is ordinary or supersingular; the
  weights do not see the reduction type.
- For `μ_{3^∞}` over `ℤ₃, Ĝ(ℤ₃) = 1 + 3ℤ₃`, whereas `colim_n μ_{3^n}(ℤ₃) = {1}`.
  The map `n ↦ (1 + 3)^n` is a nonzero continuous homomorphism `ℤ₃ → 𝔘` and
  corresponds to a completed point, as the points theorem requires.

### R07.1.20 Schematic closure of generic subgroups over a Dedekind base

Prove `schematicClosure_flat`. Let `R` be a Dedekind domain (a discrete valuation ring in Raynaud; the
argument uses only that torsion-free `R`-modules are flat) with fraction field `K, 𝒢` a finite flat
commutative group scheme over `R` and `H ⊆ 𝒢_K` a closed subgroup scheme. The schematic closure `ℋ` of `H`
in `𝒢` is a closed subgroup scheme, finite and flat over `R`, with `ℋ_K = H`; the fppf quotient `𝒢/ℋ` is a
finite flat `R`-group scheme. `H ↦ ℋ` is a bijection between closed subgroups of `𝒢_K` and closed `R`-flat
subgroup schemes of `𝒢`, compatible with inclusions.

*Proof sketch.* On an affine open with ring `𝒜` and generic ring `A = 𝒜 ⊗ K`, the closure is cut out by
the preimage `𝒥` of the ideal `I` of `H`; `𝒜/𝒥 ⊆ A/I` is torsion free, hence flat over the Dedekind domain
`R`; it is finitely presented as a quotient of the finitely presented `R`-module `𝒜` by a submodule with
flat quotient. Closure commutes with fibre products over `R` (flatness), so it takes the group law of
`H` to one on `ℋ: ℋ` is a closed flat subgroup scheme, finite since `𝒢` is. The quotient `𝒢/ℋ` by a finite
flat closed subgroup is representable and finite flat (ModularCurves Layer 0C). Bijection: a closed
`R`-flat subgroup `𝒳 ⊆ 𝒢` is the closure of `𝒳_K`, since its ring embeds in its generic ring. (Raynaud
1974, §2.1, pp. 259–260: the statement and proof.)

The subgroup closure uses contraction of the generic Hopf ideal, or equivalently
removal of scalar torsion from an integral quotient presentation.
`TauCeti.HopfIdeal.scalarTorsion` removes scalar torsion from a coordinate Hopf algebra
and hence closes that algebra's entire generic group; applied to the already flat
coordinate algebra of `𝒢` it is zero. A generic sub-Hopf algebra instead describes
a quotient group: its intersection with the integral coordinate algebra constructs
a quotient Hopf order, rather than the closed subgroup `ℋ` in this target.

*Needs:* TauCetiRoadmap.ModularCurves Layer 0C; Mathlib `IsDiscreteValuationRing`; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

**Checks.**

- `schematicClosure_graph`: over `R = ℤ_p[ζ_p]` take `𝒢 = ℤ/pℤ × μ_p` and `H ⊂ 𝒢_K` the graph of the
  generic isomorphism `ℤ/pℤ ≅ μ_p, 1 ↦ ζ_p`. Its closure `ℋ` is a flat subgroup with generic fibre `H ≅ ℤ/pℤ`, and the two projections `ℋ → ℤ/pℤ` and `ℋ → μ_p` extend the identity; this is how suprema of
  prolongations are formed (§R07.1.24).
- `schematicClosure_trivial`: the closure of the trivial subgroup is the unit section, and the
  closure of `𝒢_K` is `𝒢`, since `𝒢` is flat.
- `schematicClosure_needs_flat`: the closure need not be a subgroup when `R` is not Dedekind: over
  `k[x, y]`, a torsion-free module need not be flat, and the argument through flatness of
  torsion-free modules fails.
- Over `ℤ₂`, the generically invertible map `ℤ/2 → μ₂, 1 ↦ −1`, is categorically
  monic but its special-fibre map is zero. It is not a closed immersion; the closure
  theorem requires the geometric closed-immersion condition on its integral inclusion.

### R07.1.20a Quotients of `p`-divisible groups by finite flat subgroups over a complete DVR

Construct `BarsottiTate.quotientFiniteFlatSubgroup`. Let `R` be a complete DVR of mixed
characteristic `(0,p), G` a `p`-divisible group of height `h` over `R`, and `H ↪ G` a finite locally
free closed subgroup killed by `p^N`. The fppf quotient `Q = G/H` is a `p`-divisible group of
height `h`, and `G → Q` is an isogeny with kernel `H`. Construct its torsion levels, quotient
map, functoriality for maps preserving `H`, and compatibility with complete-DVR base change.
There is a canonical `G_K`-equivariant exact sequence
`0 → T_p(G) → T_p(Q) → H(K̄) → 0`; thus the induced inclusion in `V_p(G)` identifies
`T_p(Q)/T_p(G)` with `H(K̄)`.

*Construction.* For each `n`, let `P_n = [p^n]⁻¹(H)` inside `G[p^{n+N}]`. The map `P_n → H` is
the base change of the finite faithfully flat map `[p^n]`, so `P_n` is finite locally free.
The finite quotient `P_n/H` is representable by ModularCurves Layer 0C. These are `Q[p^n]`,
of rank `p^{nh}`, and their transition sequences prove `p`-divisibility. Over `K̄` the exact
sequence follows by taking compatible `p`-power lifts in `Q` and recording their boundary
in `H`. (Tate 1967, §2, pp. 160–165: levels, isogenies and Tate modules; Stix 2012, §9.1,
pp. 55–56: the sheaf definition and isogenies; ModularCurves Layer 0C: finite quotients.)

*Needs:* §R07.1.5; §R07.1.6; §R07.1.8; §R07.1.20; ModularCurves Layer 0C.

**Checks.**

- `H = 0: Q = G` and its map on Tate modules is the identity.
- `H = G[p^N]: Q ≅ G` by `[p^N]`; the Tate-module map is multiplication by `p^N`
  with quotient `G`[p^N](K̄), of order `p^{Nh}`.
- For `G = μ_{p^∞}, H = μ_p, Q = μ_{p^∞}`; under the rational isogeny identification
  its Tate lattice is `p⁻¹ℤ_p(1)`, containing `ℤ_p(1)` with quotient `μ_p(K̄)`.

### R07.1.21 Closures of generic `p`-divisible subgroups become `p`-divisible after a shift

Prove `BarsottiTate.exists_of_tateModule_summand`. Let `R` be a complete DVR of mixed characteristic
`(0, p)` with perfect residue field, `F` a `p`-divisible group over `R`, and `M ⊆ T_p(F)` a `G_K`-stable
`ℤ_p`-direct summand. Let `E_* ⊆ F_K` be the corresponding `p`-divisible subgroup of the generic fibre
and `E_v` the schematic closure of `E_{*v}` in `F_v`. Then the `E_v` need not form a `p`-divisible group, but
for some `i_0` the system `Γ_v = E_{i_0+v}/E_{i_0}` is a `p`-divisible group over `R`, with a homomorphism `φ : Γ → F` inducing `T_p(Γ) ≅ M`. The map `φ` need not be a closed immersion.

*Proof sketch.* The closures `E_v ⊆ F_v` are closed flat subgroups (§R07.1.20) with `E_v ⊆ E_{v+1}`;
generically `E_*` is `p`-divisible, so `p` induces maps `E_{i+v+1}/E_{i+1} → E_{i+v}/E_i` that are
isomorphisms on the generic fibre. The affine algebras `D_i` of `E_{i+1}/E_i` form an increasing
sequence of `R`-orders in one finite separable `K`-algebra, so they stabilise: `D_i = D_{i+1}` for `i ≥ i_0`. With `Γ_v = E_{i_0+v}/E_{i_0}`, multiplication by `p^v` on `Γ_{v+1}` factors through an isomorphism,
so its kernel is `Γ_v: Γ` is `p`-divisible, and `p^{i_0}` gives `Γ → E ⊆ F` inducing `T_p(Γ) ≅ M` (Tate, proof
of Proposition 12). Serre's example uses an elliptic curve mapped to the product of two quotients
whose kernels are distinct generically but have the same nonzero reduction, as in the check below.
(Tate 1967, (4.2), Proposition 12, p. 181: the statement; proof of Proposition 12, p. 182:
the closure and the shift; pp. 182–183, immediately after that proof: Serre's counterexample.)

*Needs:* §R07.1.20; §R07.1.8; §R07.1.5; §R07.1.9; §R07.1.16; §R07.1.19;
TauCetiRoadmap.ModularCurves Layers 2B and `7E` (elliptic quotients and torsion towers).

**Checks.**

- `exists_of_tateModule_summand_self`: `M = T_p(F)` gives `Γ = F` (`i_0 = 0`); `M = 0` gives the
  zero group.
- `exists_of_tateModule_summand_serre`: let `X/R` be an elliptic scheme with ordinary special
  fibre and all geometric generic `p`-torsion `K`-rational. Choose independent
  `x, y ∈ X_K[p](K)` whose reductions satisfy `x̄ = ȳ = z ≠ 0`. Their schematic closures
  `H_x, H_y ⊆ X[p]` are constant étale groups of order `p`, with
  `(H_x)_k = (H_y)_k = ⟨z⟩`. Let `q_x : X → Y_x = X/H_x` and
  `q_y : X → Y_y = X/H_y`, and set `f = (q_x, q_y)` and
  `F = Y_x[p^∞] × Y_y[p^∞]`. The generic kernels have zero intersection, so `f_K` is a
  closed immersion. Its map on generic `p`-torsion is injective, so
  `M = im(T_p(f) : T_p(X[p^∞]) → T_p(F))` is saturated, hence a `ℤ_p`-direct summand;
  it is `G_K`-stable. On the special fibre `ker(f_k) = ⟨z⟩`, so
  `f[p^∞] : X[p^∞] → F` is not a closed immersion. Were the closures `E_v` a
  `p`-divisible tower, the generically isomorphic maps `X[p^v] → E_v` would be
  isomorphisms: their heights agree generically and their dimensions agree by §R07.1.19;
  the induced inclusions of coordinate orders have equal discriminants by §R07.1.16 and
  hence are equal. This contradicts the kernel
  containing `z` at level one. Thus `i_0 > 0` is necessary, and a realizing `φ` cannot be a
  closed immersion, since its levels would then be precisely the closures `E_v`.
- `exists_of_tateModule_summand_canonicalLift`: for the canonical lift `X/W(F̄_p)` of an
  ordinary elliptic curve, take `F = X[p^∞] ≅ μ_{p^∞} × (ℚ_p/ℤ_p)` and `M` the Tate
  module of its étale factor (§R07.1.9). A nonzero rational `p`-torsion point in that
  factor has nonzero reduction, but the closures are already `(ℤ/p^vℤ)_R`:
  `i_0 = 0` and the factor inclusion is closed. A single rational `p`-torsion point with
  nonzero reduction therefore does not force the failure in Serre's product construction.

### R07.1.22 Tate's theorem: `p`-divisible groups are determined by their generic fibres

Prove `BarsottiTate.extend_genericFibre`. Let `R` be an integrally closed noetherian domain whose
fraction field `K` has characteristic `0`, and `G, H p`-divisible groups over `R`. `(i)` Every homomorphism
`G_K → H_K` of generic fibres extends uniquely to a homomorphism `G → H`. `(ii)` If `R` is a complete DVR
with perfect residue field, `Hom(G, H) → Hom_{G_K}(T_p G, T_p H)` is bijective. (iii) A homomorphism `G → H` that is an isomorphism on generic fibres is an isomorphism.

*Proof sketch.* Reduction: `R = ⋂ R_𝔭` over height-one primes and each `R_𝔭` is a DVR, so it suffices to
treat DVRs; pass to a complete DVR `R′` with algebraically closed residue field and `R = R′ ∩ K`. If the
residue characteristic is not `p, G` is étale and the statement is Galois theory. (iii) first: `u_v : B_v → A_v` is injective (`B_v` free, `u_v ⊗ K` bijective). The discriminants of `A_v` and `B_v` are `p^{n v p^{hv}}` (§R07.1.16); the height is read off the generic fibre and the dimension from `T_p` (§R07.1.19
(iii)), so the discriminants agree and `u_v` is bijective. `(i)` Given `f : G_K → H_K`, apply §R07.1.21 to
`F = G × H` and `M` the graph of `T_p(f)`: the resulting `Γ → G × H` composed with `pr_1` is an isomorphism on
generic fibres, hence an isomorphism by (iii); then `pr_2 ∘ φ ∘ (pr_1 ∘ φ)^{−1}` extends `f`.
Uniqueness: `A_v ⊆ A_v ⊗ K`. `(ii)` is `(i)` together with the equivalence between `p`-divisible groups over
`K` and `G_K`-lattices (§R07.1.2 over `K`). (Tate 1967, (4.2), Theorem 4, p. 180: part `(i)`; Tate 1967,
(4.2), Corollaries `1` and `2` of Theorem 4, p. 181: parts `(ii)` and (iii).)

*Needs:* §R07.1.16; §R07.1.19; §R07.1.21; §R07.1.8; Mathlib `IsIntegrallyClosed`; Mathlib
`IsNoetherianRing`.

**Checks.**

- `extend_genericFibre_hom_zero`: `Hom(ℚ_p/ℤ_p, μ_{p^∞}) = 0` over `ℤ_p` although both have `T_p ≅ ℤ_p` as
  modules: the Galois actions differ.
- `extend_genericFibre_levels`: contrast with finite flat groups: at `e = p − 1` (for instance `ℤ_2`)
  the generic fibre does not determine the finite flat model (§R07.1.31); `p`-divisibility removes the
  ambiguity for every `e`.
- `extend_genericFibre_not_onto_tate`: over a DVR whose residue field is not perfect, or for the
  `G_K`-equivariant maps of Tate modules when `K` is not complete, `(ii)` is not asserted; `(i)` needs
  only integral closedness.

### R07.1.23 Simple finite flat groups over a Dedekind base

Prove `isSimple_killed_by_prime`, using ModularCurves Layer 0B's order-annihilation theorem
(a finite locally free commutative group of rank `m` is killed by `m`). Let `R` be a Dedekind domain whose
fraction field `K` has
characteristic `0` and `𝒢` a nonzero finite flat commutative `R`-group scheme. If `𝒢` is simple (no closed
flat subgroup schemes other than `0` and `𝒢`), then `𝒢` is killed by a prime `ℓ` and its generic Galois
module `𝒢(K̄)` is a simple `𝔽_ℓ[Gal(K̄/K)]`-module. Conversely, closed flat subgroups of `𝒢` correspond to
Galois-stable subgroups of `𝒢(K̄)`.

*Proof sketch.* Consume the order-annihilation theorem of ModularCurves Layer 0B. Correspondence:
closed subgroups of the étale `𝒢_K` are the Galois-stable
subgroups of `𝒢(K̄)` (ModularCurves Layer 0D, field case), and §R07.1.20 identifies these with closed
flat subgroups of `𝒢`. If `𝒢` is simple then `𝒢(K̄)` has no proper nonzero Galois-stable subgroup. For a
prime `ℓ` dividing its order, `ℓ·𝒢(K̄)` is a proper Galois-stable subgroup, hence `0`; so `𝒢(K̄)` is an
`𝔽_ℓ`-vector space with a simple Galois action. Multiplication by `ℓ` on `𝒢` vanishes generically, hence
vanishes, since the ring of `𝒢` embeds in that of `𝒢_K` (flatness). (Oort–Tate 1970, §1, Theorem
(Deligne), p. 4: the imported order-annihilation theorem; Raynaud 1974, §2.1, pp. 259–260: the
flatness of closures on which the
correspondence rests.)

*Needs:* §R07.1.20; TauCetiRoadmap.ModularCurves Layers 0B and `0D`; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

**Checks.**

- `isSimple_order_p`: over `ℤ, ℤ/pℤ` and `μ_p` are simple (every finite flat group of prime order is),
  and `ℤ/pℤ × μ_p` is not.
- `isSimple_graph`: over `ℤ_p[ζ_p]`, the closure of the graph subgroup in `ℤ/pℤ × μ_p` is flat of order
  `p`, hence simple.
- `deligne_killed_by_order`: `ℤ/p²` has order `p²` and is killed by `p²` but not by `p`; Deligne's
  theorem gives the exponent bound `m`, not `p` for every `p`-group.

### R07.1.24 Finite flat models (prolongations) of a generic group scheme and their order

Define `Prolongation`. Let `R` be a DVR with fraction field `K` and `G` a finite commutative `K`-group
scheme. A prolongation (finite flat model) of `G` is a finite flat `R`-group scheme `𝒢` with an
isomorphism `𝒢_K ≅ G`. `𝒢` dominates `𝒢′ (𝒢 ≥ 𝒢′)` if the identity of `G` extends to an `R`-morphism `𝒢 → 𝒢′`;
the morphism is then unique. This is a partial order on isomorphism classes of prolongations; any
two have a supremum and an infimum, and when `char K = 0` and a prolongation exists there are a
maximal one `𝒢⁺` and a minimal one `𝒢⁻`.

*Construction.* Order: identifying the rings `𝒜, 𝒜′` of `𝒢, 𝒢′` with `R`-subalgebras of the ring `A` of `G, 𝒢 ≥ 𝒢′` iff `𝒜′ ⊆ 𝒜`; uniqueness of the extension follows since `𝒜′ → A` is injective. Supremum: the
schematic closure of the kernel of `G × G → G, (g, g′) ↦ g − g′`, in `𝒢 × 𝒢′` (§R07.1.20) is a
prolongation dominating both, and it is the least such. Infimum: by Cartier duality. Maximum when `G`
is étale: every prolongation's ring lies in the integral closure of `R` in `A`, which is finite;
combined with suprema this gives a maximum. Minimum when `G` is multiplicative: by duality. When `char K = 0, G` is étale, so both exist. (Raynaud 1974, §2.2, Definition 2.2.1, Proposition 2.2.2 and
Corollary 2.2.3, pp. 260–261: the definition and the lattice statements.)

The API:

- `Prolongation`: structure Prolongation `(R)` (`G` : finite commutative `K`-group) : `𝒢` finite flat over
  `R, e : 𝒢_K ≅ G`.
- `Prolongation.Dominates`: `𝒢 ≥ 𝒢′` iff `∃ R`-morphism extending the identity; the morphism is unique
  (`Prolongation.dominates_unique`).
- `Prolongation.sup`: The supremum of two prolongations (closure of the antidiagonal kernel).
- `Prolongation.inf`: The infimum, by Cartier duality.
- `Prolongation.exists_max_min`: If `char K = 0` and a prolongation exists, a maximal and a minimal
  prolongation exist.
- `HopfOrder R A`: for a finite-dimensional bicommutative `K`-Hopf algebra `A`, a
  finite projective `R`-subalgebra spanning `A` over `K`, stable under counit and
  antipode, with comultiplication landing in its tensor square. Its induced Hopf
  algebra `HopfOrder.toHopfAlgebra` and `HopfOrder.baseChangeEquiv` identify
  `K⊗_R H` with `A`. Relative `Spec` identifies these orders with prolongations of
  `Spec A`, reversing inclusions. `HopfOrder.dual` uses the integral linear dual
  and the generic Cartier pairing. Intersection with a specified completed order
  is the order supplied by §R07.1.38. Sources: Raynaud 1974, §2.2, pp.260–261,
  and Stix 2012, §3.2, pp.9–12 (finite locally free Hopf duality).

*Needs:* §R07.1.20; Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`;
Mathlib `IsDiscreteValuationRing`.

**Checks.**

- `Prolongation.two_models_mu_p`: Over `ℤ_p[ζ_p], ℤ/pℤ` and `μ_p` are nonisomorphic prolongations of the
  same generic group, with `ℤ/pℤ ≥ μ_p`.
- `Prolongation.unique_etale_Zp`: Over `ℤ_p` with `p` odd, `ℤ/pℤ` is the only prolongation of the constant
  group `ℤ/pℤ` over `ℚ_p` (Raynaud, `e = 1 < p − 1`).
- `Prolongation.dyadic_two_models`: Over `ℤ_2` the constant group `ℤ/2ℤ` over `ℚ_2` has the two
  prolongations `ℤ/2ℤ` and `μ₂ (e = 1 = p − 1)`, so a definition asserting uniqueness of models fails at
  `p = 2`.
- `Prolongation.self`: Every prolongation dominates itself, and the dominating morphism is the
  identity.
- The coordinate orders of `ℤ/p` and `μ_p` over `ℤ_p[ζ_p]` span the same generic
  Hopf algebra; their unequal integral inclusions correspond to domination.
- The dual order of the constant group is the diagonalizable group's order, and
  integral biduality returns the starting order. For the trivial group the order is `R⊂K`.

### R07.1.24a Points and finite flat models of Galois modules

Construct `FiniteFlat.points G L`, for `G : FLF R` and a commutative `R`-algebra `L`,
as the additive convolution group of algebra maps `coord G →ₐ[R] L`. Its zero is
the counit followed by `R→L`, addition uses comultiplication and multiplication in
`L`, and negation uses the antipode. Prove functoriality in group morphisms and in
`L`, compatibility with products and scalar extension, and agreement with the
relative-`Spec` functor of points. If `L` is a `K`-algebra and `R→K→L` is a scalar
tower, `L ≃ₐ[K] L` acts by postcomposition: `(σ • x)(a)=σ(x(a))`. This action
commutes with group homomorphisms and the additive law. Sources: Stix 2012,
§§1.1–1.2 and 3.1, pp.1–4, 8–9 (affine groups and Hopf algebras).

For a DVR `R` with fraction field `K` of characteristic zero, a chosen separable
closure `L/K`, and a finite discrete abelian group `M` with continuous `Gal(L/K)`
action, define `GaloisModel R L M` to consist of a model `G : FLF R` and a
Galois-equivariant additive equivalence `FiniteFlat.points G L ≃+ M`. Equivariance
uses the postcomposition action. Define
`HasFiniteFlatModel R L M := Nonempty (GaloisModel R L M)`. The primary arithmetic
case is `R=O_K` for a finite extension `K/ℚ_p`. With a coefficient ring acting
on `M`, a coefficient model also carries the corresponding ring action by group
endomorphisms and the points equivalence is coefficient-linear.

Prove `galoisModelEquivProlongation`: the category of such models is equivalent
to `Prolongation R K (etaleGroupOf M)` from §R07.1.24, where the finite étale
generic group is supplied by §R07.1.2. Morphisms commute with the specified
identifications. In characteristic zero every finite group scheme here is étale
on the generic fibre, so geometric points recover that fibre and all its maps.
This comparison is an equivalence of model categories, and induces a bijection on
isomorphism classes; it does not identify distinct choices of presentation as data.
Sources: Stix 2012, Theorem 33, p.35; Raynaud 1974, Définition 2.2.1, p.260.

The points API also identifies precomposition by `[n]^*` with `n • x`, and points
of a Hopf-ideal quotient with points vanishing on that ideal. In particular the
ideal of `[n]`-torsion is generated by `[n]^*(a)−ε(a)`; it differs from the
scalar-torsion ideal of §R07.1.20.

*Needs:* §R07.1.2; §R07.1.24; Tau Ceti's coordinate Hopf algebra and base-change
functor; Mathlib `WithConv`, `AlgHom` and `Field.absoluteGaloisGroup`.

**Checks.**

- Over `K̄`, the constant group has points `M` with trivial Galois action; `μ_{p^n}` has
  points `(ℤ/p^n)(1)`. Their zero points are the identity sections.
- Over `ℤ_p[ζ_p]`, the two prolongations `ℤ/p` and `μ_p` give models of the same
  Galois module. `HasFiniteFlatModel` asserts existence and retains no uniqueness claim.
- Over `𝔽_p`, `α_p(𝔽̄_p)=0` despite rank `p`; the prolongation comparison needs
  characteristic zero (or an explicit finite étale generic-fibre restriction).
- For `G=ℤ/p²`, the kernel of `[p]` has rank `p`, whereas scalar torsion of
  `coord G` over `ℤ_p` is zero. The two quotient constructions are different.

### R07.1.25 A generic `p`-divisible group whose levels extend has a `p`-divisible extension

Prove `BarsottiTate.exists_extension_of_levels`. Let `R` be a DVR of mixed characteristic `(0, p)` and `G = (G_n)` a `p`-divisible group over `K`. If every `G_n` extends to a finite flat `R`-group scheme, then `G`
extends to a `p`-divisible group over `R`, unique up to isomorphism.

No bound on the ramification is needed.

*Proof sketch.* Uniqueness is Tate's theorem (§R07.1.22). `(a)` Choose prolongations `𝒢(n)` and modify
them inductively so that each inclusion `G_n → G_{n+1}` extends to `𝒢(n) → 𝒢(n+1)`: dualise, take the
closure of the graph of the dual epimorphism in `𝒢(n+1)′ × 𝒢(n)′`, and dualise back (§R07.1.20). `(b)`
Close up the filtration `G_i ⊆ G_n`: the successive quotients `𝒢(n)_i/𝒢(n)_{i−1}` are prolongations of
`G_1`, decreasing in `n` for fixed `i` and increasing in `i` for fixed `n` (via `p`). `(c)` By Corollary 2.2.3
(maximal and minimal prolongations, §R07.1.24) both sequences stabilise; after dividing by the
stable part one may take `i_0 = 1`, and then the stable values of `𝒢(n)` form a `p`-divisible group
extending `G` (Raynaud Proposition 2.3.1). (Raynaud 1974, §2.3, Proposition 2.3.1, p. 261: the
statement; the proof is on pp. 261–263.)

*Needs:* §R07.1.24; §R07.1.20; §R07.1.22; Mathlib `IsDiscreteValuationRing`.

**Checks.**

- `exists_extension_of_levels_mu`: for `G = μ_{p^∞}` over `K = ℚ_p` the extension is `μ_{p^∞}`; its levels
  have the unique models `μ_{p^n}` over `ℤ_p` when `p` is odd.
- `exists_extension_of_levels_dyadic`: over `ℤ_2` the level `G_1 = μ₂` has two models, but the
  `p`-divisible extension is still unique.

### R07.1.26 Tame inertia and its fundamental characters

Construct `tameInertiaIso` for arbitrary perfect residue fields and
`perfectResidueFundamentalCharacter`, extending ArithmeticGaloisRepresentations §2.3.
For `d` prime to `p` and a uniformiser `x` of `K_nr, K_d = K_nr(x^{1/d})` is totally and tamely ramified of degree `d`, and `θ_d(s) = s(x^{1/d})/x^{1/d}`
defines an isomorphism `Gal(K_d/K_nr) → μ_d` independent of `x` and of the root; the `θ_d` assemble to an
isomorphism `θ : I_t → lim_d μ_d` (transition maps `α ↦ α^{d′}`). For `q = p^n`, the fundamental
characters of level `n` are the `n` characters `I_t → μ_{q−1} = F_q^* → k̄^*` obtained from `θ_{q−1}` and
the `n` embeddings of `F_q` in `k̄`; they are `θ_{q−1}^{p^i}, 0 ≤ i < n`, and `θ_{q−1}^{1+p+⋯+p^{n−1}} = θ_{p−1}`. `I_t` acts on `μ_p` through `θ_{p−1}^e`; in particular the mod-`p` cyclotomic character restricts
to `θ_{p−1}` on `I_t` when `e = 1`. For a continuous `ρ : G → GL₂(F̄_p), P_K` acts trivially on the
semisimplification of `ρ`. If `k = F_p, I_t` acts through two characters `φ, φ′` that are
either both of level `1` or of level `2` and conjugate `(φ′ = φ^p, φ = φ′^p)`. For `k = F_{p^f}`,
the multiset of characters is stable under `φ ↦ φ^{p^f}`; no level-`1`/level-`2` restriction
is asserted for arbitrary perfect `k`.

`K` is a field of characteristic `0`, complete for a discrete valuation `v` with `v(K^*) = ℤ`, with perfect
residue field `k` of characteristic `p`; `e = v(p)` is its absolute ramification index. `K_s ⊃ K_t ⊃ K_nr ⊃ K` are a separable closure and the maximal tamely ramified and unramified subextensions; `G = Gal(K_s/K), I = I_K = Gal(K_s/K_nr)` (full inertia), `P_K = Gal(K_s/K_t)` and `I_t = I/P_K` (Serre 1972,
§1.2). Characters of
`I_t` of level `1` are the powers of `θ_{p−1}`. When `k = F_{p^f}`, an arithmetic Frobenius
lift acts on `I_t` by `u ↦ u^{p^f}`; for `k = F_p` this is `u ↦ u^p` (Serre 1987, §2.1).

*Construction.* For `K` a local field (finite residue field) the isomorphism `θ : I_t ≅ lim_{(d,p)=1} μ_d, σ ↦ (σ(π^{1/d})/π^{1/d})_d`, independent of the uniformiser and the roots, is
TauCetiRoadmap.LocalFieldsRamification Layer 4 (implemented in Tau Ceti as
`TauCeti.inertiaTameCharacter` and `TauCeti.quotientWildInertiaSubgroupEquiv`); this target uses it
for its finite-residue specialization. ArithmeticGaloisRepresentations §2.3 supplies the
finite-residue fundamental characters, their Frobenius powers, norm and cyclotomic restriction,
and the finite-residue two-dimensional classification. This target extends the character
construction and its identities to arbitrary perfect residue fields, with explicit agreement
after identifying inertia, roots of unity and the chosen residue embeddings; it consumes the
finite-residue classification. For a perfect residue field the same construction applies:
`K_d/K_nr` is a Kummer
extension, totally ramified of degree `d`, and `θ_d` is independent of `x` because units of `K_nr` have `d`-th
roots in `K_nr` (Serre 1972, §1.3); the two agree when both are defined. `K_t` is the union of the `K_d`
for `(d, p) = 1`, so `I_t = lim Gal(K_d/K_nr) ≅ lim μ_d` (Serre 1972, Proposition 1). Fundamental
characters: `θ_{q−1}` composed with the embeddings of `F_q` in `k̄`; the norm `F_{q}^* → F_p^*` is `x ↦ x^{1+p+⋯+p^{n−1}}`, which gives `θ_{q−1}^{(q−1)/(p−1)} = θ_{p−1}` (Serre 1972, §1.7). `μ_p`: for `z ∈ μ_p, z ≠ 1, v(z − 1) = e/(p − 1)`, and `z ↦ z − 1` embeds `μ_p G`-equivariantly in `m_α/m_α^+` with `α = e/(p − 1)`, on which `I_t` acts by `θ^e_{p−1}` (Serre 1972, Propositions `7`–`8`). Semisimplification: `P_K` is pro-`p`,
so it fixes a nonzero vector of every `F̄_p`-representation and acts trivially on `V^ss`; conjugation by
an arithmetic Frobenius lift raises `I_t` to the `p^f`-th power when `k = F_{p^f}`.
For `k = F_p`, stability of `{φ, φ′}` under `φ ↦ φ^p` forces level `1` or conjugate level `2` (Serre 1987,
Proposition 1). (Serre 1972, §1.3, Proposition 1, p. 263:
the structure of tame inertia; Serre 1972, §1.7, p. 267: fundamental characters; Serre 1972, §1.8,
Proposition 8, p. 269: the cyclotomic character on tame inertia; Serre 1987, §2.1, Proposition 1, p.
183: levels of the characters of a two-dimensional representation.)

The API:

- `tameInertia`: `I_t = I/P_K` as a profinite group.
- `tameInertiaIso`: `θ : I_t ≅ lim_{(d,p)=1} μ_d`.
- `perfectResidueFundamentalCharacter`: For `n ≥ 1`, the level-`n` character attached to an
  embedding `F_{p^n} → k̄`, for a complete mixed-characteristic DVR with perfect residue field.
- `perfectResidueFundamentalCharacter_pow_p`: The characters are `θ_{q−1}^{p^i}, 0 ≤ i < n`,
  permuted by `φ ↦ φ^p`.
- `perfectResidueFundamentalCharacter_norm`: `θ_{q−1}^{(q−1)/(p−1)} = θ_{p−1}`.
- `perfectResidueCyclotomic_restrict_tameInertia`: `χ̄|_{I_t} = θ_{p−1}^e`.
- `perfectResidueFundamentalCharacter_eq_fundamentalCharacter`: For finite residue field,
  after the tame-quotient identification and matching the embedding `F_{p^n} → k̄`, this is
  ArithmeticGaloisRepresentations §2.3's `fundamentalCharacter`; its Frobenius powers, norm
  and cyclotomic identity agree with that API.
- `tameInertiaIso_eq_inertiaTameCharacter`: For `K` a nonarchimedean local field (finite residue
  field), `θ` agrees with Tau Ceti LocalFieldsRamification Layer 4's tame character `I_K/P_K ≅ Ẑ^{(p′)}(1)` (`TauCeti.inertiaTameCharacter`), composed with `lim μ_d ≅ Ẑ^{(p′)}(1)`.

*Needs:* Mathlib `Field.absoluteGaloisGroup`; Mathlib `IsDiscreteValuationRing`;
TauCetiRoadmap.LocalFieldsRamification Layer 4; ArithmeticGaloisRepresentations §2.3
(the finite-residue fundamental-character API and residual tame-inertia classification).

**Checks.**

- `perfectResidueFundamentalCharacter_one_surjective`: `θ_{p−1} : I_t → F_p^*` is surjective, and `θ_{p−1}^{p−1} = 1`.
- `perfectResidueFundamentalCharacter_two_norm`: For `ψ = θ_{p²−1}: ψ^{p+1} = θ_{p−1}` and `ψ^{p²} = ψ, ψ^p ≠ ψ`.
- `cyclotomic_restrict_ne_one`: For `e < p − 1` the restriction `χ̄|_{I_t} = θ_{p−1}^e` is not trivial,
  so `μ_p` is ramified.
- `theta_one`: `d = 1: θ_1` is the trivial character and `K_1 = K_nr`.
- For finite residue field, the agreement theorem intertwines `θ`, every Frobenius power and
  the norm between levels, and gives the imported cyclotomic identity with exponent `e`.
- `K = ℚ_p (e = 1): I_t` acts on `μ_p` by `θ_{p−1}`, which is surjective onto `F_p^*`; for `K = ℚ_p(ζ_p) (e = p − 1)` it acts by `θ_{p−1}^{p−1} = 1`, as `μ_p ⊂ K` requires.
- For `K = Frac W(F̄_p)`, full inertia equals `G_K` and `θ_{p³−1} ⊕ 1` is a
  continuous two-dimensional representation with a level-three character. Its wild
  inertia `P_K` acts trivially; the residue-field hypothesis for the two-level conclusion is needed.

### R07.1.27 `F`-vector schemes of rank one (Raynaud)

Define `FVectorScheme`. Let `F` be a finite field with `q = p^r` elements, `C = ℚ(μ_{q−1})`, and `D` the
Dedekind ring obtained from the ring of integers of `C` by inverting `q − 1` and removing the primes
above `p` other than a chosen prime `𝔭` (Raynaud §1.1); the fundamental characters `χ_i : F^× → D^× (i ∈ ℤ/r)` are those whose reduction modulo `𝔭` is a field embedding `F → D/𝔭`, and `w ∈ D` is Raynaud's
constant, `p` times a unit. An `F`-vector scheme over a `D`-scheme `S` is a finite locally free commutative
group scheme `G` over `S` with a ring homomorphism `F → End_S(G)`, such that `(**)` the eigen-sheaves `𝓛_χ`
of the augmentation ideal of its algebra for the fundamental characters `χ_i : F^× → D^× (i ∈ ℤ/r)`
are invertible `O_S`-modules. Its rank is then `q`.

Here `S` is a scheme over Raynaud's ring `D` and `F` has `q = p^r` elements. A henselian local ring
whose residue field contains `𝔽_q` is a `D`-scheme (Raynaud §1.2, Exemples `(a)`).

*Construction.* Definition as displayed (Raynaud §1.2); the condition `(**)` holds automatically
when `S` is connected with an étale or multiplicative fibre, in particular when `S` is integral with
fraction field of characteristic `0` (Proposition 1.2.2). Cartier duality preserves `F`-vector schemes
(Remark 1.5.3): the dual of the system `(𝓛_i, c_i, d_i)` is `(𝓛_i^{-1}, d_i^t, c_i^t)`. (Raynaud 1974,
§1.2, condition `(**)` and Proposition 1.2.2, pp. 246–247: the condition and when it holds.)

The API:

- `FVectorScheme`: structure FVectorScheme `(F) (S) : G` finite locally free commutative, act : `F →+* End G`, and the eigenline condition `(**)`.
- `FVectorScheme.rank_eq`: rank `G =` card `F`.
- `FVectorScheme.cartierDual`: The Cartier dual carries an `F`-vector scheme structure (Remark 1.5.3).
- `FVectorScheme.of_generic_char_zero`: Over an integral base with fraction field of characteristic
  `0`, an `F`-action on a finite locally free `G` of rank `q` satisfies `(**)`.

On coordinate Hopf algebras the `F`-action is by Hopf endomorphisms: scalar
addition is convolution and scalar multiplication is composition. This is the
coordinate form of the ring map to group endomorphisms, with its contravariant
direction fixed by relative `Spec`.

*Needs:* Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; TauCetiRoadmap.ModularCurves
Layer 0B.

**Checks.**

- `FVectorScheme.zModP`: `ℤ/pℤ` with its `𝔽_p`-action is an `𝔽_p`-vector scheme; so is `μ_p`.
- `FVectorScheme.supersingular_E_p`: `E[p]` of a supersingular elliptic curve over `W(𝔽̄_p)` is an
  `𝔽_{p²}`-vector scheme (rank `p²`).
- `FVectorScheme.not_of_rank`: `ℤ/pℤ × ℤ/pℤ` with the diagonal `𝔽_p`-action is not an `𝔽_p`-vector scheme
  in Raynaud's sense (rank `p² ≠ p`): `𝔽_p^×` acts freely on the `p² − 1` nonzero points with `p + 1`
  orbits, so each eigen-sheaf of the augmentation ideal has rank `p + 1`, not `1`.
- `FVectorScheme.cartierDual_zModP`: The Cartier dual of the `𝔽_p`-vector scheme `ℤ/pℤ` is `μ_p`.
- `FVectorScheme.fp_eq_order_p`: for `F = 𝔽_p` the `F`-vector schemes are exactly the group schemes of
  order `p` of Oort–Tate (§R07.1.34).

### R07.1.28 Raynaud's classification of `F`-vector schemes

Prove `FVectorScheme.classification`. Over a `D`-scheme `S`, isomorphism classes of `F`-vector schemes
satisfying `(**)` correspond to isomorphism classes of systems `(𝓛_i, c_i, d_i)_{i∈ℤ/r}` of invertible
`O_S`-modules with maps `c_i : 𝓛_{i+1} → 𝓛_i^{⊗p}` and `d_i : 𝓛_i^{⊗p} → 𝓛_{i+1}` such that `d_i ∘ c_i = w·id`. Over a local ring `R` this is the data of `r` pairs `(γ_i, δ_i) ∈ R²` with `γ_i δ_i = w`, the group
having equations `X_i^p = δ_i X_{i+1}`, with `(γ_i, δ_i) ~ (u_i^{−p} u_{i+1} γ_i, u_i^p u_{i+1}^{−1} δ_i)` for units `u_i`. Over a strictly henselian DVR of mixed characteristic with absolute ramification
`e`, the classes are in bijection with families `(n_i)` of integers with `0 ≤ n_i ≤ e`, via `n_i = v(δ_i)`.

*Proof sketch.* Raynaud Theorem 1.4.1: from `G` one reads the eigenline sheaves `𝓛_i = 𝓛_{χ_i}` and the
maps `c_i, d_i` induced by comultiplication and the `p`-th power; conversely the universal case over `E = D[U_i, V_i]/(U_i V_i − w)` is constructed and checked after the faithfully flat extension `E′`
trivialising it (Lemma 1.4.2). Corollary 1.5.1: over a local ring every `𝓛_i` is free, giving the
pairs and the equations, with the stated equivalence. Corollary 1.5.2: over a strictly henselian
DVR, `v(δ_i) ∈ [0, e]` because `γ_i δ_i = w` has valuation `e`; two families with the same valuations are
isomorphic because `u_{i+1}` can be solved from `u_i^{q−1} =` (unit) by henselianity. (Raynaud 1974,
§1.4, Théorème 1.4.1, p. 255: the classification; Raynaud 1974, §1.5, Corollaires 1.5.1–1.5.2, pp.
257–258: the local and strictly henselian forms.)

*Needs:* §R07.1.27; TauCetiRoadmap.ModularCurves Layer 0E.

Over a mixed-characteristic DVR with `v(p)=e`, package the local equations as
`FVectorScheme.normalForm`, recording the cyclic eigenlines, `γ_iδ_i=w`,
valuations `n_i∈[0,e]` and the tame character of §R07.1.32.
Changing eigenline generators changes the coefficients by the stated units;
the valuation tuple is invariant under this change, with its cyclic labels retained.

**Checks.**

- `FVectorScheme.classification_order_p`: `r = 1` recovers the Oort–Tate classification (§R07.1.34).
- `FVectorScheme.classification_unramified`: over `W(𝔽̄_p)` (strictly henselian, `e = 1`), `F`-vector
  schemes of rank `q` are classified by `r`-tuples of `0s` and `1s: q = p` gives the two schemes `ℤ/pℤ (n = 0)` and `μ_p (n = 1)`, and for `q = p²` the `E[p]` of Raynaud's supersingular example, `X₁^{p²} = pX₁`, is
  the tuple `(n₁, n₂) = (0, 1)` (equivalently `(1, 0)` after the relabelling `i ↦ i + 1`, which changes
  the `F`-structure by Frobenius).
- `FVectorScheme.classification_bound`: over `ℤ_p[ζ_p]` (`e = p − 1`) the order-`p` models have `n ∈ {0, …, p − 1}`, so there are `p` classes over the strict henselisation, not two; the bound `0 ≤ n_i ≤ e` depends on `e`.

### R07.1.29 Over a strictly henselian base the Jordan–Hölder factors are `F`-vector schemes

Prove `exists_fVector_composition`. Let `R` be a strictly henselian DVR of mixed characteristic with `e ≤ p − 1`, and `𝒢` a finite flat commutative `R`-group scheme killed by a power of `p`. Then `𝒢` has a
composition series by closed flat subgroup schemes whose successive quotients carry structures of
`F_i`-vector schemes for suitable finite fields `F_i`. Generically, every Jordan–Hölder quotient of a
finite commutative `K`-group killed by a power of `p` that is étale or multiplicative is an `F`-vector
scheme satisfying `(**)`.

*Proof sketch.* Generic statement (Proposition 3.2.1): a simple étale Galois module of `p`-power order
is killed by `p`; since inertia acts through the abelian tame quotient on it (strict henselianity),
its commutant is a finite field `F` over which it has dimension `1`, and it is an `F`-vector scheme
satisfying `(**)` (Proposition 1.2.2); the multiplicative case follows by duality. Integral
statement (Corollary 3.3.7): close up a generic Jordan–Hölder filtration (§R07.1.20); for `e ≤ p − 1`
the `F`-structure extends to the maximal and minimal prolongations (Proposition 3.3.1) and, by the
analysis of Proposition 3.3.2, to every prolongation of a simple `F`-vector scheme. (Raynaud 1974,
§3.2, Proposition 3.2.1, p. 265: the generic statement; Raynaud 1974, §3.3, Corollaire 3.3.7, p.
268: the integral statement.)

*Needs:* §R07.1.27; §R07.1.20; §R07.1.24.

Express the existence of this filtration as `HasFVectorDevissage`: the zero group
has the property, and an exact sequence with a previously filtered subgroup and
an `F`-vector-scheme quotient extends it. Prove invariance under isomorphism and
compatibility with the composition series above; a filtration is a witness to a
property rather than additional structure on every finite flat group.

**Checks.**

- `exists_fVector_composition_elliptic`: for `E[p]` with supersingular reduction over `W(𝔽̄_p)`, the
  only composition series is `E[p]` itself, an `𝔽_{p²}`-vector scheme; with ordinary reduction, `μ_p ⊂ E[p] → ℤ/pℤ`.
- `exists_fVector_composition_cyclic`: for `ℤ/p²` the series `0 ⊂ ℤ/p ⊂ ℤ/p²` has both factors
  `ℤ/p`, which are `F_p`-vector schemes; `ℤ/p²` itself is not an `F`-vector scheme for any `F`,
  since it is not killed by `p`.
- The zero group has the empty dévissage. Its product with `μ_p` has the
  one-factor dévissage of `μ_p`, with no extra zero composition factor.

### R07.1.30 Raynaud's theorem: uniqueness of finite flat models and full faithfulness when `e < p − 1`

Prove `prolongation_unique_of_lt` and `genericFibre_map_bijective`. Let `R` be a DVR of mixed
characteristic `(0, p)` with absolute
ramification index `e = v(p) < p − 1`, and `K = Frac R`. `(i)` Every finite commutative `K`-group scheme
killed by a power of `p` has at most one finite flat prolongation over `R`, up to unique isomorphism.
`(ii)` If `𝒢, ℋ` are finite flat commutative `R`-group schemes killed by a power of `p`, every
`K`-homomorphism `𝒢_K → ℋ_K` extends uniquely to `u : 𝒢 → ℋ`, and `Ker(u), Coker(u)` are flat over `R`. (iii)
`Ext¹_R(𝒢, ℋ) → Ext¹_K(𝒢_K, ℋ_K)` is injective.

In particular `p ≥ 3`: there is no dyadic case.

*Proof sketch.* By §R07.1.24 it suffices that a morphism of prolongations `u : 𝒢 → 𝒢′` extending the
identity is an isomorphism. Dévissage (Raynaud Proposition 3.2.1 and Corollary 3.3.7; §R07.1.29)
reduces, after strict henselisation, to `F`-vector schemes of rank `q = p^r`. For those, Raynaud's
classification (§R07.1.28) writes `𝒢, 𝒢′` with equations `X_i^p = δ_i X_{i+1}, X_i′^p = δ_i′ X_{i+1}′, 0 ≤ v(δ_i), v(δ_i′) ≤ e`, related generically by `X_i′ = α_i X_i` with `δ_i′ = α_i^p δ_i α_{i+1}^{−1}`.
If some `α_i` is not a unit, taking `v(α_i) ≥ 1` maximal gives `v(δ_i′) ≥ p − 1 > e`, a contradiction. So
`u` is an isomorphism (Proposition 3.3.2, `2`°). `(ii)` and (iii): Corollary 3.3.6 — apply `(i)` to the
graph of a generic homomorphism (the closure of the graph is a prolongation of `𝒢_K`, hence `𝒢` itself)
and to kernels and cokernels; injectivity on `Ext¹` follows since an extension split generically has
its generic splitting extend. (Raynaud 1974, §3.3, Théorème 3.3.3, p. 268: part `(i)`; Raynaud 1974,
§3.3, Corollaire 3.3.6, p. 268: parts `(ii)` and (iii).)

*Needs:* §R07.1.24; §R07.1.28; §R07.1.29; Mathlib `IsDiscreteValuationRing`.

**Checks.**

- `absRamificationIndex_padic`: `absRamificationIndex ℤ_[p] p = 1`. For the unit
  `2 ∈ ℤ₃`, the same definition gives `absRamificationIndex ℤ_[3] 2 = 0`; on
  `F_p⟦t⟧` it also gives `0`, because `(p : F_p⟦t⟧) = 0` and `⊤.toNat = 0`.
  The equal-characteristic value is outside the characteristic-zero hypotheses here.
  `absRamificationIndex_dyadicSqrtTwo`: on Tau Ceti's `𝒪[TauCeti.DyadicSqrtTwo]` it is `2`,
  since the uniformizer `√2` squares to `2` (pinned `DyadicSqrtTwo.irreducible_integerSqrtTwo`).
- `prolongation_unique_Zp`: `e = 1 < p − 1` for `p ≥ 3`: over `ℤ_p` (`p` odd), generic-fibre functor is
  fully faithful on finite flat `p`-group schemes.
- `prolongation_unique_boundary`: the strict inequality is essential: at `e = p − 1` (for instance
  `ℤ_2`, or `ℤ_p[ζ_p]`) `μ_p` and `ℤ/pℤ` are two models of one generic group (§R07.1.31).
- `prolongation_unique_ext`: over `ℤ_p`, `p` odd, the extension classes of `ℤ/p` by `μ_p` inject
  into those of the generic fibres: an extension of finite flat groups over `ℤ_p` that splits over
  `ℚ_p` already splits over `ℤ_p`.
- At `p = 3, R = ℤ₃[√3]` has `e = p − 1` but `Frac R` does not contain `ζ₃: μ₃` and `ℤ/3` have different generic Galois modules. Equality of `e` alone does not identify them.

### R07.1.31 The boundary case `e = p − 1`: at most two models, étale and multiplicative

Prove `prolongation_boundary`. Let `R` be a henselian DVR of mixed characteristic with `e = p − 1, F` a
finite field with `q` elements, and `G` a simple `K`-scheme in `F`-vector spaces of rank `q` (§R07.1.27) with
a finite flat prolongation. Then either `G` has a unique prolongation, or it has exactly two, one
étale and one multiplicative; in both cases the prolongations are `F`-vector schemes. More generally,
for `G` killed by a power of `p` the biconnected part of a prolongation does not depend on the
prolongation.

*Proof sketch.* In the analysis of Proposition 3.3.2: if the maximal and minimal prolongations
differ, the case analysis with `v(δ_i′) ≥ p − 1 = e` forces `v(α_i) = 1, v(δ_j) = 0` and `v(δ_j′) = p − 1`
for all `j: 𝒢⁺` is étale and `𝒢⁻` is multiplicative. Any prolongation `𝒢` lies between them; since `R` is
henselian and `G` simple, the special fibre of `𝒢⁺` is simple, so `u : 𝒢⁺ → 𝒢` is an isomorphism or zero
on the special fibre, and in the latter case `𝒢` is multiplicative. Remark 3.3.5: the canonical map `𝒢⁺ → 𝒢⁻` induces an isomorphism on biconnected components. (Raynaud 1974, §3.3, Proposition 3.3.2 `3`°, p.
267: the statement; Raynaud 1974, §3.3, Remarque 3.3.5, p. 268: the biconnected part.)

*Needs:* §R07.1.24; §R07.1.27; §R07.1.28; Mathlib `HenselianLocalRing`.

**Checks.**

- `prolongation_boundary_examples`: over `ℤ_2 (p = 2, e = 1)` the generic group `ℤ/2ℤ` has the two
  models `ℤ/2ℤ` and `μ₂`; over `ℤ_p[ζ_p]` the generic `μ_p` has the two models `ℤ/pℤ` and `μ_p`.
- `prolongation_boundary_needs_simple`: for the non-simple `G = ℤ/p × ℤ/p` over `ℚ_p(ζ_p)`, the
  products `ℤ/p × ℤ/p`, `ℤ/p × μ_p` and `μ_p × μ_p` are three pairwise nonisomorphic prolongations;
  simplicity is needed for "at most two".
- `prolongation_boundary_dyadic`: every base with `p = 2` has `e ≥ 1 = p − 1`, so the uniqueness
  theorem §R07.1.30 never applies at `p = 2`.

### R07.1.32 Tame inertia on finite flat group schemes: Raynaud's exponent bound

Prove `tameInertia_exponents_le`. Let `R` be a strictly henselian DVR of mixed characteristic `(0, p)`
with absolute ramification `e` and `K = Frac R`. `(i)` If `G` is a `K-F`-vector scheme with equations `X_i^p = δ_i X_{i+1}` (`F` of order `q = p^r`), then `Gal(K̄/K)` acts on the `F`-line `G(K̄)` by homotheties through the
tame character `ψ = ψ_i^{n_i} ψ_{i+1}^{n_{i+1}} ⋯ ψ_{i+r−1}^{n_{i+r−1}}` with `n_j = v(δ_j)`. Index the
coordinate characters by `χ_(j+1) = χ_j^p`, put `θ = θ_(q−1)` as in §R07.1.26, and define the
fundamental characters of level `r` by `ψ_j := χ_(j+1)⁻¹ ∘ θ`, with indices modulo `r`.
Here `χ_(j+1)⁻¹` denotes the inverse of the coordinate-character identification
`F^× ≅ μ_(q−1)`. `(ii)` Such `G` extends to a finite flat `R`-group scheme if
and only if `ψ` can be written this way with `0 ≤ n_j ≤ e` for all `j`. (iii) Consequently, for any finite
flat commutative `R`-group scheme killed by a power of `p`, every Jordan–Hölder quotient of `G(K̄)` is an
`F`-line on which tame inertia acts by `ψ_1^{n_1} ⋯ ψ_r^{n_r}` with `0 ≤ n_j ≤ e`.

*Proof sketch.* `(i)` Eliminating `X_j (j ≠ i)` from the equations, the points are the solutions of
`X_i^{q−1} = a_i` with `a_i = δ_i^{p^{r−1}} δ_{i+1}^{p^{r−2}} ⋯ δ_{i−1}`; `G` is trivialised by the tame
extension of degree `q − 1`, and `σ ∈ I` acts on a nonzero root `x` by `σ(x) = j(σ)^{v(a_i)} x` (Theorem
3.4.1). `(ii)` If `G` extends, the `F`-structure extends (Proposition 3.3.2) and the integral equations
force `0 ≤ v(δ_j) ≤ e` (§R07.1.28); conversely such `δ_j` define an integral model (Theorem 3.4.3).
(iii) Each Jordan–Hölder quotient of `G_K` is an `F`-vector scheme (Corollary 3.4.4, from the generic
statement Proposition 3.2.1 of §R07.1.29, which needs no bound on `e`), and it prolongs to a finite
flat `R`-group by schematic closure of the corresponding subquotient (§R07.1.20); apply `(ii)`. For `e ≥ p − 1` the conclusion is empty (Remark 3.4.6). (Raynaud 1974, §3.4, Théorème 3.4.1, pp. 269–270: part
`(i)`; Raynaud 1974, §3.4, Théorème 3.4.3 and Corollaire 3.4.4, p. 270: parts `(ii)` and (iii).)

*Needs:* §R07.1.27; §R07.1.28; §R07.1.29; Mathlib `Field.absoluteGaloisGroup`; §R07.1.20.

Export `finiteFlat_inertia_eigencharacter` over an unramified finite extension
`K/ℚ_p` of residue degree `f`, for odd `p` and a nonzero finite-dimensional
finite-flat `k[G_K]`-module `V` killed by `p`, with finite coefficient field `k`.
After extending coefficients, `V` has an inertia eigenline whose character is a
product of level-`r` fundamental characters with digits in `{0,1}`, where
`r≤f·dim_k V`. Indeed wild inertia has nonzero invariants and tame inertia is
diagonalizable there; Frobenius permutes the eigencharacters in orbits of length
at most `dim_k V`, with `p^f`-power conjugation. Raynaud bounds the digits of
these constituents. In particular, for `K=ℚ_p` and `dim_k V=2`, an eigencharacter
is `ψ₂^{a+pb}` with `a,b∈{0,1}`; a level-one character uses equal digits.
This is the rank-two specialization of the full bound, not a level-two assertion
for representations of arbitrary rank or residue degree (Raynaud 1974,
Corollaire 3.4.4, p.270; Serre 1987, §2.8, pp.189–190).

**Checks.**

- `tameInertia_exponents_muP`: for `μ_p` over `ℤ_p (e = 1, r = 1, n = 1)` inertia acts by `ψ = ω`, the
  mod-`p` cyclotomic character; for `ℤ/pℤ, n = 0`.
- `tameInertia_exponents_boundary`: for `e ≥ p − 1` the bound says nothing (Remark 3.4.6): every tame
  character of level `r` has such a form, and every `F`-vector scheme over `K` extends.
- `tameInertia_exponents_supersingular`: over `W(F̄_p)` (`e = 1`), the `F_{p²}`-line `E[p]` of a
  supersingular elliptic curve has exponents `(n₁, n₂) = (0, 1)` up to relabelling, so inertia acts
  by a fundamental character of level `2`, not by a power of `θ_{p−1}`.
- At level `r = 3`, valuations `(v(δ₀), v(δ₁), v(δ₂)) = (1, 0, 0)` give `ψ = ψ₀`
  and `χ₀ ∘ ψ = θ^{p²}`, since eliminating the other coordinates gives
  `v(a₀) = p²`. The unshifted choice `χ₀⁻¹ ∘ θ` would instead give `θ`.
- Over `ℚ_p`, an unramified rank-two module gives `a=b=0`, and the
  supersingular elliptic example gives `(a,b)=(1,0)` or `(0,1)`.
- A supersingular elliptic `p`-torsion module stays rank two after coefficient
  extension, while its two eigenlines need not be defined over the original field.
- A simple niveau-three finite-flat representation over `ℚ_p` has dimension
  three and can have character `ψ₃`; it is covered by the general bound and
  excluded from the level-two specialization.

### R07.1.33 Raynaud: the determinant of a finite flat group killed by `p` is the tame character of its different

Prove `raynaudDeterminantTameDifferent`. Let `R` be a strictly henselian DVR of mixed characteristic
`(0, p)` with fraction field `K` and absolute ramification index `e ≤ p − 1`, and `𝒢` a finite flat
commutative `R`-group scheme killed by `p`, of order `p^h`, with generic fibre `G`. Let `𝔇 = π^d R` be the
absolute different of `𝒢` (the ideal of `R` from which the different of the Hopf algebra of `𝒢` over `R`
comes by translation invariance). Then `Gal(K̄/K)` acts on `det G = Λ^h G` (an étale group of order `p`)
through the tame character `τ_𝔇 = θ_{p−1}^d`. For the Cartier dual, `𝔇(𝒢)·𝔇(𝒢^D) = (p^h)` (the ideal
generated by the order). In terms of invariant differentials, `v(𝔇) = d = length_R ω_𝒢` (§R07.1.17),
so the character is `θ_{p−1}^{length ω_𝒢}`.

Raynaud's standing hypotheses of his §4: `R` strictly henselian of unequal characteristic; `e ≤ p − 1`
(Raynaud notes that the conclusion is expected without the restriction, and it follows from §R07.6.9
when `𝒢` is the `p`-torsion of a `p`-divisible group). `θ_{p−1} : I_t → μ_{p−1}` is the fundamental
character of level `1` (§R07.1.26); Raynaud writes `τ` for it.

*Proof sketch.* `F`-vector schemes: for `𝒢` an `F`-vector scheme with equations `(1)` of Raynaud §3.3,
Theorem 3.4.1 gives the Galois character on `G(K̄)` as `ψ` composed with the fundamental characters, so
`det G` has character the norm, which composed with `I_t → μ_{q−1}` is `θ_{p−1}^{Σ}`; the equations show
for equations `X_i^p = δ_i X_{i+1}`, the augmentation Jacobian gives the absolute
different `(∏_i δ_i)`, with valuation `Σ_i v(δ_i)`, the same exponent. In complementary
parameters `γ_iδ_i = w`, this ideal can also be written `(p^r/∏_i γ_i)`, since `w/p` is a unit (Raynaud,
§4.1, p. 272; §R07.1.28, §R07.1.32). General `𝒢`: dévissage by Corollary 3.3.7
into `F`-vector schemes (§R07.1.29), using that both `det` and the absolute different are multiplicative
in short exact sequences. Duality of differents: Appendix, Definition 8 and Proposition 9 (invariant
measures and the trace form). (Raynaud 1974, §4.1, the computation for `F`-vector schemes and Théorème
4.1.1, pp. 271–272; Remarque 4.1.2, p. 272: Galois acts on `det G` through the tame character of the
absolute different when `e ≤ p − 1`; Raynaud 1974, Appendice, Définition `8` and Proposition 9, p. 279:
the absolute different and `𝔇(G)𝔇(G′) = (n)` for the Cartier dual `G′`.)

*Needs:* §R07.1.28; §R07.1.32; §R07.1.29; §R07.1.27; §R07.1.26; §R07.1.17.

**Checks.**

- `raynaudDeterminant_muP`: `𝒢 = μ_p`: the Hopf algebra `R[x]/(x^p − 1)` has different `(p x^{p−1})`, so `𝔇 = (p) = π^e` and `det = μ_p` has character `θ_{p−1}^e = χ̄` (§R07.1.26). `𝒢 = ℤ/p`: étale, `𝔇 = R`, trivial
  character. And `𝔇(μ_p)𝔇(ℤ/p) = (p)`.
- `raynaudDeterminant_bound`: for `e > p − 1` the dévissage of Corollary 3.3.7 is unavailable and the
  theorem is not claimed.
- `raynaudDeterminant_product`: for `𝒢 = μ_p × ℤ/p`, `𝔇 = (p)` and `det G = μ_p ⊗ ℤ/p ≅ μ_p`, with
  character `θ_{p−1}^e`; the determinant is multiplicative in the factors while the order `p²` is
  not what the character records.
- In rank `p` with equation `X^p = X (δ = 1)`, the group is étale and its
  different is the unit ideal; the expression `p/δ` would give the wrong ideal.

### R07.1.34 The Oort–Tate classification of group schemes of prime order

Prove `oortTate_classification`. Let `Λ = ℤ[ζ_{p−1}, 1/(p(p−1))] ∩ ℤ_p` and `w_p ∈ Λ` Oort–Tate's
constant (`w_p = p·unit`). For a `Λ`-scheme `S`, isomorphism classes of finite locally free group schemes
of order `p` over `S` correspond to isomorphism classes of triples `(L, a, b)` with `L` an invertible
`O_S`-module, `a ∈ Γ(S, L^{⊗(p−1)}), b ∈ Γ(S, L^{⊗(1−p)})` and `a ⊗ b = w_p`. Over a `Λ`-algebra `R` with Pic
`R = 0` the group is `G_{a,b} = Spec R[X]/(X^p − aX)`, with `G_{a,b} ≅ G_{c,d}` iff `(c, d) = (u^{p−1}a, u^{1−p}b)` for a unit `u`, and the Cartier dual of `G_{a,b}` is `G_{b,a}`. For `p = 2 (Λ = ℤ, w₂ = 2)` the
group attached to `(L, a, b)` with `a ∈ L, b ∈ L^{⊗−1}, a ⊗ b = 2` is `G(A) = {f ∈ L ⊗ A : f^{⊗2} = a ⊗ f}` with the law `f ⋆ g = f + g − b ⊗ f ⊗ g`; a change of trivialisation `u` of `L` replaces `(a, b)` by `(ua, u^{−1}b)`; Cartier duality is `(L, a, b) ↦ (L^{⊗−1}, b, a)`, compatibly with base change; `(R, 1, 2)`
gives `ℤ/2, (R, 2, 1)` gives `µ₂` through `u = 1 − f`, and over `F₂` the triple `(R, 0, 0)` gives `α₂`.

Since `Λ ⊂ ℤ_p`, every `ℤ_p`-scheme is a `Λ`-scheme; for `p = 2`, `Λ = ℤ` and every scheme is a
`Λ`-scheme.

*Proof sketch.* Every group of order `p` is commutative, and its augmentation ideal decomposes under
the action of `𝔽_p^× ⊂ Λ` into eigensheaves `I_j = I_1^{⊗j}` (Oort–Tate Lemma 3); this is the case `F = 𝔽_p` of §R07.1.28. The algebra and coalgebra structures are determined by the triple `(L, a, a′)` with
`a ⊗ a′ = w_p` (Theorem 2 and its proof), the group law being recovered from the Cartier pairing;
every triple arises, by the universal construction over `Λ[A, B]/(AB − w_p)`. Over a local ring (Stix
Theorem 60): `L` is free, giving `(a, b)` with `ab = w_p` up to `(u^{p−1}a, u^{1−p}b)`; duality swaps `a` and
`b`. (Oort–Tate 1970, §2, Theorem 2, p. 12, and Remark 2 (Cartier duality), p. 15; Stix 2012, §8.4, Theorem 60, p. 53: the local
form, with duality in part `(4)`; Schröer 2023, §5, the paragraph after Proposition 5.3, p. 14 (arXiv
`v3`): the rank-two groups `G^L_{a,b}` with `a ⊗ b = 2`, the special cases `ℤ/2` and `µ₂`, and Cartier duality
`(L, a, b) ↦ (L^{⊗−1}, b, a)`; the printed group law has a sign misprint; Pilloni 2020, proof of Lemma
14.1.2, p. 92: the proof of Lemma 14.1.2 is an easy computation with Oort–Tate theory; the formulas
`G_{a,b}` and `G_{a,b}^D = G_{b,a}` are Oort–Tate's (Theorem 2, p. 12, and Remark 2, p. 15), not printed in Pilloni.)

*Needs:* §R07.1.28; §R07.1.27.

**Checks.**

- `oortTate_Zp`: over `ℤ_p, v(w_p) = 1`, so one of `a, b` is a unit: every group of order `p` is étale (`a`
  a unit) or multiplicative (`b` a unit), and since `ℤ_p^×/(ℤ_p^×)^{p−1} ≅ 𝔽_p^×` there are `p − 1` of
  each, the unramified twists of `ℤ/pℤ = G_{1,w_p}` and of `μ_p = G_{w_p,1}`. Over `W(𝔽̄_p)` only `ℤ/pℤ` and
  `μ_p` remain. Over `ℤ` with `p = 2` (`Λ = ℤ, u = ±1` acts by `(a, b) ↦ (ua, ub)`), exactly `ℤ/2ℤ` and `μ₂`.
  The dichotomy over `ℤ_p` is `isEtale_or_isMultiplicative_of_rank_eq`.
- `oortTate_Fp`: over `𝔽_p` (a `Λ`-algebra, where `w_p = 0`) the pairs `(a, b) = (1, 0), (0, 1), (0, 0)`
  give `ℤ/pℤ, μ_p` and `α_p`; `α_p` has no finite flat lift to `ℤ_p`, since its pair would need `ab = w_p`
  with both `a` and `b` in the maximal ideal, which forces `v(w_p) = v(p) ≥ 2`.
- `oortTate_two_constant`: `p = 2, (L, a, b) = (ℤ, 1, 2): f² = f` and `f ⋆ g = f + g − 2fg` give `ℤ/2`;
  with the plus sign `f = g = 1` would give `4`, not idempotent.
- `oortTate_two_mu`: `p = 2, (ℤ, 2, 1): u = 1 − f` satisfies `u² = 1` and `(1 − f)(1 − g) = 1 − f ⋆ g`, so
  the group is `µ₂`; its dual `(ℤ, 1, 2)` is `ℤ/2`.
- `oortTate_dual`: over `O_K, G_{a,b}^D = G_{b,a}` (Oort–Tate §2, Theorem 2, p. 12, and Remark 2 (Cartier duality), p. 15; Pilloni's proof of Lemma
  14.1.2 is a computation with it).

### R07.1.35 Group schemes of order `p` over rings of integers: Oort–Tate Theorem 3

Prove `oortTate_numberRing`. Let `K` be a number field, `R ⊆ K` an integrally closed subring with
fraction field `K` (for instance `ℤ` or `ℤ[1/N]`), `M` the set of maximal ideals of `R` and `M_p ⊆ M` those
above `p`. `(i)` (Lemma 4) An `R`-group of order `p` is the same as its generic fibre `H` over `K` together
with, for each `𝔭 ∈ M`, an `R_𝔭`-group of order `p` (`R_𝔭` the completion) with generic fibre `H ⊗ K_𝔭`: the
square of isomorphism-class sets `E(R) → ∏ E(R_𝔭)` over `E(K) → ∏ E(K_𝔭)` is cartesian. `(ii)` (Theorem 3)
`R`-groups of order `p` correspond to systems `(χ, (n_𝔭)_{𝔭∈M_p})` of a continuous character `χ : C_K → 𝔽_p^×` of the idele class group and integers `0 ≤ n_𝔭 ≤ v_𝔭(p)`, with `χ` unramified at every `𝔭 ∈ M − M_p`
and `χ_𝔭(u) = N_{k_𝔭/𝔽_p}(ū)^{−n_𝔭}` for `u ∈ U_𝔭, 𝔭 ∈ M_p`. (iii) (Artin–Mazur) Over `ℤ` the only group
schemes of order `p` are `ℤ/pℤ` and `μ_p`.

*Proof sketch.* `(i)` Lemma 4: a finite flat `R`-group is determined by its generic fibre and its
completions (fpqc gluing, ModularCurves Layer 0E), and away from `p` every `R_𝔭`-group of order `p` is
étale (order invertible; Oort–Tate Lemma 5), so determined by an unramified Galois character. `(ii)`
Lemma 6 identifies `E(K), E(K_𝔭)` and `E(R_𝔭) (𝔭 ∉ M_p)` with continuous characters of `G_K, K_𝔭^×` and
`K_𝔭^×/U_𝔭` into `𝔽_p^×` through the reciprocity maps (global and local class field theory,
TauCetiRoadmap.ClassFieldTheory Layers 7 and `11`); at `𝔭 ∈ M_p`, §R07.1.34 over the complete local `R_𝔭`
gives the pair `(a, b)`, and `n_𝔭 = v_𝔭(a)`; Lemma 7 computes the local character of the generic fibre
by the tame norm residue symbol, giving condition `(ii)`. (iii) Over `ℤ: C_ℚ` characters unramified
outside `p` are powers of the mod-`p` cyclotomic character `ω`; condition `(ii)` at `p` with `0 ≤ n ≤ 1` leaves
`χ = 1, n = 0 (ℤ/pℤ)` and `χ = ω, n = 1 (μ_p)`. (Oort–Tate 1970, §3, Theorem 3, p. 20: part `(ii)`;
Oort–Tate 1970, §3, Lemma 4, p. 17: part `(i)`; Oort–Tate 1970, Introduction, pp. 1–2: part (iii).)

*Needs:* §R07.1.34; §R07.1.23; TauCetiRoadmap.ClassFieldTheory Layers 7 and `11` (the local and
global Artin maps);
TauCetiRoadmap.ModularCurves Layer 0E.

**Checks.**

- `oortTate_numberRing_Z`: over `ℤ`, exactly `ℤ/pℤ` and `μ_p`.
- `oortTate_numberRing_Z_half`: over `ℤ[1/2]` with `p = 3` there are exactly eight: `χ ∈ {1, χ_{−4}, χ_8, χ_{−8}}` with `n = 0` and `χ ∈ ω·{1, χ_{−4}, χ_8, χ_{−8}}` with `n = 1`, where `χ_d` is the quadratic
  character of `ℚ(√d)` and `ω` the mod-`3` cyclotomic character.
- `oortTate_numberRing_local`: the integers `n_𝔭` recover the local Oort–Tate pairs: `G_𝔭` is étale iff
  `n_𝔭 = 0` and multiplicative iff `n_𝔭 = v_𝔭(p)`.

### R07.1.36 The Katz–Mazur group schemes `T_ε`

Construct `katzMazur`. Let `R` be a ring, `p` a prime and `ε ∈ R^×`. The Katz–Mazur group scheme is `T_ε = Spec ⊕_{i=0}^{p−1} R[X_i]/(X_i^p − ε^i)`, whose `S`-points (`S` with connected spectrum) are pairs `(s, i), 0 ≤ i < p, s^p = ε^i`, with `(t, i)·(s, j) = (ts, i + j)` if `i + j < p` and `(ts/ε, i + j − p)`
otherwise. It is finite flat of order `p²`, killed by `p`, and sits in `0 → μ_p → T_ε → ℤ/pℤ → 0`. `T_ε ≅ T_{ε′}` when `ε/ε′ ∈ (R^×)^p`; over a field, the points of `T_ε` generate `R(ζ_p, ε^{1/p})`.

*Construction.* The algebra is free of rank `p²` over `R`; the displayed law is well defined because
`(ts)^p = ε^{i+j}` and `(ts/ε)^p = ε^{i+j−p}`. The summand `i = 0, R[X_0]/(X_0^p − 1)`, is `μ_p`, a closed
flat subgroup; the quotient by it is `ℤ/pℤ`, the index `i`. Rescaling `X_i` by `u^i` identifies `T_ε` with
`T_{εu^p}`; over a field the points are the `p`-th roots of `ε^i`, so they generate `R(ζ_p, ε^{1/p})`
(Katz–Mazur Interlude 8.7, as recalled by Schoof). Over `ℤ[1/l]` the extension class of `T_ε` in
`Ext¹(ℤ/pℤ, μ_p)` is the Kummer class of `ε`, so `T_ε` and `T_{ε′}` are isomorphic as extensions iff `ε/ε′` is
a `p`-th power of a unit (Schoof 2005 §2.4). As bare group schemes `T_ε ≅ T_{ε^a}` for every `a ∈ 𝔽_p^×`
(compose with the automorphism `a` of `ℤ/pℤ`), so the group scheme alone determines only the line
spanned by the class. (Schoof 2003, §2, p. 418: the construction; Schoof 2005, §2.4, p. 850: the
groups `G_ε` over `ℤ[1/l]` and when two of them are isomorphic.)

The API:

- `katzMazur`: `T_ε`, a finite locally free commutative group scheme over `R` for `ε ∈ R^×`.
- `katzMazur_rank`: rank (katzMazur `p ε`) `= p ^ 2`.
- `katzMazur_extension`: The exact sequence `0 → μ_p →` katzMazur `p ε → ℤ/pℤ → 0`.
- `katzMazurIsoOfDiv`: katzMazur `p ε ≅` katzMazur `p (ε * u ^ p)`.

*Needs:* Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`.

**Checks.**

- `katzMazur_one`: katzMazur `p 1 ≅ μ_p × ℤ/pℤ`.
- `katzMazur_neg_one_two`: Over `ℤ` with `p = 2`, katzMazur `2 (−1)` is nonsplit, and its points generate
  `ℚ(i)`.
- `katzMazur_not_split`: Over `ℤ_p` (`p` odd), katzMazur `p (1 + p)` is not isomorphic to `μ_p × ℤ/pℤ`,
  since `1 + p ∉ ℤ_p^{×p}`.

### R07.1.37 Schematic closure commutes with orthogonals: `J^D/M^⊥ = M^D`

Prove `orthogonalSchematicClosure`. Let `K` be a complete discretely valued field of characteristic `0`
with ring of integers `O_K` and `J` a finite flat commutative group scheme over `O_K`. For a subgroup `M_K ⊂ J_K` with schematic closure `M ⊂ J`, let `M_K^⊥ ⊂ J_K^D` be its orthogonal under the Cartier pairing
and `M^⊥ ⊂ J^D` its schematic closure. Then the Cartier pairing induces an isomorphism `J^D/M^⊥ ≅ M^D`.

*Proof sketch.* The restriction `J^D = (J)^D → M^D` is faithfully flat because `M → J` is a closed
immersion of finite flat groups (Cartier duality turns monomorphisms into epimorphisms); its kernel
`K` is a closed flat subgroup with generic fibre `M_K^⊥`. A closed flat subgroup of `J^D` is the schematic
closure of its generic fibre (§R07.1.20), so `K = M^⊥` and `J^D/M^⊥ ≅ M^D` (Pilloni leaves the proof to
the reader). (Pilloni 2020, §14.3, Lemma 14.3.2, p. 94: `J^D/M^⊥ = M^D` for schematic closures over
`O_K`.)

*Needs:* §R07.1.20; §R07.1.24; TauCetiRoadmap.ModularCurves Layer 0B.

**Checks.**

- `orthogonalSchematicClosure_graph`: `O_K = ℤ_p[ζ_p], J = ℤ/p × μ_p, M_K` the graph of `1 ↦ ζ_p: M` is
  the graph of the `O_K`-morphism `ℤ/p → μ_p, 1 ↦ ζ_p`, so `M ≅ ℤ/p` and `M^D ≅ μ_p`; under the Cartier
  pairing `M_K^⊥ ⊂ J_K^D = μ_p × ℤ/p` is the graph of `b ↦ ζ_p^{−b}`, its closure `M^⊥ ≅ ℤ/p` is again a
  graph, and `J^D/M^⊥ ≅ μ_p ≅ M^D`.
- `orthogonalSchematicClosure_needs_dvr`: the DVR hypothesis matters. Flatness of a schematic
  closure uses that torsion-free modules over a DVR are flat; over a two-dimensional regular base
  such as `ℤ_p⟦T⟧` a torsion-free module need not be flat, so the closures `M` and `M^⊥` need not be
  finite flat subgroups and `J^D/M^⊥` is not then a finite flat group.

### R07.1.38 Gluing finite flat group schemes from a completion and a localisation

Prove `gluingEquiv`. Let `R` be a noetherian ring, `p ∈ R, R̂` the `p`-adic completion. The functor `G ↦ (G ⊗ R̂, G ⊗ R[1/p], id)` is an equivalence between finite flat `R`-group schemes and triples `(G_1, G_2, θ)` of a finite flat `R̂`-group scheme `G_1`, a finite flat `R[1/p]`-group scheme `G_2` and an isomorphism `θ : G_1 ⊗ R̂[1/p] ≅ G_2 ⊗ R̂[1/p]`. For `R = ℤ[1/N]` and `p ∤ N` the triples are over `ℤ_p, ℤ[1/pN]` and `ℚ_p`.

*Proof sketch.* `R` noetherian, so `R → R̂` is flat and `(R, p)` is a glueing pair (Stacks Remark
15.92.8); every `R`-module is glueable, and `Can : Mod_R → Glue(R → R̂, p)` is an equivalence (Stacks
Theorem 15.92.16). A module is finite projective iff both of its pieces are (Stacks Lemma 15.92.19),
so the equivalence restricts to finite locally free modules. `Can` is compatible with tensor products,
so it carries commutative algebras, Hopf-algebra structures and their morphisms along: finite flat
group schemes over `R ↔` triples (Schoof Proposition 2.3, which cites Artin's module version). (Schoof
2003, §2, Proposition 2.3, p. 419: the statement; Stacks Project, Tag 0BNI, Theorem 15.92.16 and
Lemma 15.92.19: the module-level gluing on which the proof rests.)

*Needs:* Tau Ceti `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`; Mathlib `IsNoetherianRing`;
Mathlib `IsAdicComplete`; Mathlib `Localization.Away`.

Deduce `exists_model_localization_of_completion`. For a Dedekind domain `R`
with characteristic-zero fraction field `K` and nonzero prime `𝔭`, write
`R_𝔭` for the local DVR and `R̂_𝔭` for its completion, with fraction field `K_𝔭`.
A finite-dimensional bicommutative `K`-Hopf algebra `A`, a finite flat
`R̂_𝔭`-Hopf model, and a specified Hopf isomorphism of its generic fibre with
`K_𝔭⊗_K A` glue to a Hopf order over `R_𝔭`. The order inside `A` is the
inverse image of the completed order under `A→K_𝔭⊗_K A`; its extension to
`R̂_𝔭` is the chosen order. This uses `gluingEquiv` for the local DVR, with
its uniformizer as gluing element (Stacks Tags 0BP2 and 0BP6).

Deduce `hasFiniteFlatModel_localization_iff_completion`: for a finite continuous
`G_K`-module and a chosen embedding `K^sep→K_𝔭^sep`, existence of a model
over `R_𝔭` is equivalent to existence of a model of the restricted representation
over `R̂_𝔭`. Use §R07.1.24a's finite étale generic group to obtain the specified
generic Hopf isomorphism. The local predicate remains the definition of finite
flatness. Sources: Schoof 2003, Proposition 2.3, p.419; Stacks Tags 0BP2 and 0BP6.

**Checks.**

- `gluingEquiv_Z_l`: for `R = ℤ[1/l]` and `p ≠ l`: a finite flat `p`-group scheme over `ℤ[1/l]` is a
  `G_ℚ`-module unramified outside `pl∞` together with a finite flat model over `ℤ_p` of its restriction to
  `G_{ℚ_p}`.
- `gluingEquiv_unit`: with `p` a unit in `R, R̂ = 0` and the triples are just `R`-groups.
- At `R_𝔭=ℤ_(p)`, a `ℤ_p`-model with its identified rational generic fibre
  produces a `ℤ_(p)`-model; the generic representation remains the original one.
- For `μ_p` the intersection order is `ℤ_(p)[T]/(T^p−1)` inside
  `ℚ[T]/(T^p−1)`; for a constant group it is the product of copies of `ℤ_(p)`.
- At `p=2` the two completed models `μ₂` and `ℤ/2` glue separately to
  nonisomorphic localized models. The existence equivalence does not assert uniqueness.

### R07.1.39 The Mayer–Vietoris sequence for `Hom` and `Ext¹` of finite flat groups

Prove `mayerVietoris_exact`. For `R` noetherian, `p ∈ R` and finite flat `R`-group schemes `G, H` there is a
natural exact sequence `0 → Hom_R(G, H) → Hom_{R̂}(G, H) × Hom_{R[1/p]}(G, H) → Hom_{R̂[1/p]}(G, H) →^δ Ext¹_R(G, H) → Ext¹_{R̂}(G, H) × Ext¹_{R[1/p]}(G, H) → Ext¹_{R̂[1/p]}(G, H)`, where `Ext¹` is the
group of extensions `0 → H → X → G → 0` of finite flat group schemes and `δ(φ)` is the extension glued
from the trivial extensions `H × G` over `R̂` and `R[1/p]` along `θ(h, g) = (h + φ(g), g)`.

*Proof sketch.* Injectivity of the first map: `R̂ × R[1/p]` is faithfully flat over `R`. Exactness at
the second group and the construction of `δ`: §R07.1.38 applied to morphisms and to `H × G`. At the
third group: `δ(φ)` is split iff `φ = ψ − f` with `ψ` over `R̂` and `f` over `R[1/p]`, by comparing isomorphisms
with the trivial extension over each piece. At `Ext¹_R`: an extension trivial over both pieces is `δ` of
the difference of the two trivialisations; at the fifth group: a compatible pair of extensions glues
by §R07.1.38 (Schoof, proof of Corollary 2.4). (Schoof 2003, §2, Corollary 2.4 and its proof, pp.
419–420: the statement; the sequence and `δ` are displayed after it.)

*Needs:* §R07.1.38.

**Checks.**

- `mayerVietoris_mu_Z`: over `ℤ` with `G = μ_p, H = ℤ/pℤ (R = ℤ, p)`: the sequence computes `Ext¹_ℤ(μ_p, ℤ/pℤ)` from Galois cohomology over `ℤ[1/p]` and the local extensions over `ℤ_p`.
- `mayerVietoris_variance`: the extensions are of `G` by `H`, `0 → H → X → G → 0`; the last step of
  Schoof's proof speaks of extensions of `H` by `G`, which is the other variance, and the sequence
  is stated here with the variance above.

### R07.1.40 Raynaud's embedding of a finite locally free group scheme into an abelian scheme

Prove `raynaudAbelianEmbedding`. Let `S` be a scheme and `G` a finite locally free commutative group
scheme over `S`. Zariski-locally on `S` there exist a projective abelian scheme `A` and a closed immersion
of group schemes `G ↪ A`; the quotient `A/G` is then an abelian scheme, giving an exact sequence `0 → G → A → A′ → 0` of fppf sheaves.

Abelian schemes and their quotients by finite locally free subgroups are those of
AbelianSchemesAndArithmeticModuli Layers A1–A3.

*Proof sketch.* Raynaud's theorem, as stated in Berthelot–Breen–Messing, Théorème 3.1.1, and quoted
by Anschütz–Le Bras; they use it to reduce statements about finite locally free groups and `BT_n` to
abelian schemes (Theorem 4.6.1 and Proposition 4.6.2). The quotient `A/G` is an abelian scheme by
AbelianSchemesAndArithmeticModuli A3 (finite flat quotients). (Anschütz–Le Bras 2023, §4.6, Theorem
4.6.1 and the proof of Proposition 4.6.2, p. 58 (arXiv `v4`; published Theorem 4.65): Zariski-local
closed immersion into a projective abelian scheme, citing Berthelot–Breen–Messing 3.1.1, and its use
to get exact sequences `0 → G → X → X′ → 0`.)

*Needs:* AbelianSchemesAndArithmeticModuli Layer A3; TauCetiRoadmap.ModularCurves Layer 0B.

**Checks.**

- `raynaudAbelianEmbedding_muP`: over `ℤ_p, μ_p` embeds in `E[p]` for an elliptic curve `E` with good
  ordinary reduction and `a_p ≡ 1 mod p` (the connected part of `E[p]` is then `μ_p`), and `E/μ_p` is
  again an elliptic curve.
- `raynaudAbelianEmbedding_local`: the theorem gives an embedding over each member of a Zariski
  cover of `S`, not a global one; a statement with a single global `A` is a different claim.

### R07.1.41 `p`-divisible groups and finite locally free groups form stacks for the `p`-completely faithfully flat topology

Prove `pCompleteFlatDescent`. On the category of `p`-complete rings with bounded `p^∞`-torsion, the
fibred categories of finite locally free group schemes and of `p`-divisible groups are stacks for the
`p`-completely faithfully flat topology. The input is that finite projective `R`-modules are equivalent
to compatible systems of finite projective `R/p^n`-modules, and form a stack for this topology.

Here `R` is derived `p`-complete with bounded `p^∞`-torsion, and `R → R′` is `p`-completely
faithfully flat when `R/p^n → R′/p^n` is faithfully flat for all `n` (by the bounded-torsion
hypothesis).

*Proof sketch.* Finite projective modules: `R` is classically `p`-complete, so finite projective
`R`-modules are the `2`-limit of those over `R/p^n` (Stacks, Tag 0D4B); each `R/p^n → R′/p^n` is faithfully
flat, so classical descent applies levelwise (Anschütz–Le Bras, Lemma A.1). Finite locally free
group schemes are finite projective algebras with comultiplication; base change commutes with fibre
products, so they form a stack; `p`-divisible groups are colimits of such (Proposition A.2).
(Anschütz–Le Bras 2023, Appendix `A`, Lemma A.1 and Proposition A.2, p. 94 (arXiv `v4`): descent of
finite projective modules, finite locally free group schemes and `p`-divisible groups along
`p`-completely faithfully flat maps; Stacks Project, Tag 0D4B: finite projective modules over a
`p`-complete ring as compatible systems modulo `p^n`.)

*Needs:* §R07.1.6; TauCetiRoadmap.ModularCurves Layer 0E; Mathlib `Module.Projective`.

**Checks.**

- `pCompleteFlatDescent_unramified`: `ℤ_p → W(F̄_p)` is `p`-completely faithfully flat; descent of
  `p`-divisible groups along it restricts on special fibres to the Galois descent of §R07.2.7.
- `pCompleteFlatDescent_bounded`: without bounded `p^∞`-torsion, `R/p^n → R′/p^n` need not be flat for a
  `p`-completely flat `R → R′`, and the levelwise descent argument fails (Anschütz–Le Bras, Example `A`.`4`
  gives a ring with unbounded `p^∞`-torsion).

### Examples

- **Groups of order `p` over `ℤ_p`.** For `p` odd, `w_p` has valuation `1`, so in `ab = w_p` exactly
  one of `a`, `b` is a unit: every group of order `p` over `ℤ_p` is étale (`ℤ/p` twisted by an
  unramified character) or multiplicative (`μ_p` twisted likewise), in accordance with Raynaud's
  uniqueness theorem (`e = 1 < p − 1`). Over `ℤ_p[ζ_p]` (`e = p − 1`) the constant group `ℤ/p` and
  `μ_p` have isomorphic generic fibres and are both models (§R07.1.31).
- **`μ_{p^∞}` and `ℚ_p/ℤ_p`.** Both have height `1`; their dimensions are `1` and `0`, their Tate
  modules are `ℤ_p(1)` and `ℤ_p`, they are Cartier dual, and Tate's decomposition gives `C(1)` and
  `C`.
- **Elliptic curves.** For `E` over `ℤ_p` with good ordinary reduction, `E[p^∞]` has height `2`,
  dimension `1`, connected part of height `1` and étale quotient of height `1`; with supersingular
  reduction `E[p^∞]` is connected of height `2` and its tame inertia on `E[p]` is given by the
  fundamental characters of level `2` (§R07.5.3).

### Dependencies

Tau Ceti `FiniteLocallyFreeCommAffineGroupSchemeCat` with Cartier duality and base change, and its
constant and diagonalizable groups; TauCetiRoadmap.ModularCurves Layers 0B, `0C, 0D, 0E` and `7E`;
TauCetiRoadmap.LocalFieldsRamification Layers 3 and `4`; TauCetiRoadmap.ClassFieldTheory Layers 7
and `11`; AbelianSchemesAndArithmeticModuli §A4.5 and Layer A3; DerivedModuleAlgebra §0.4;
SchemeAndStackFoundations §0.23 and §4.1 (and §5.4 for the projective-line-bundle Check);
EtaleCohomologyFoundations §F.0.2 (`VanishingCycles.finiteEtaleGaloisCategory`);
PadicPeriodRings §§1–2; Mathlib's local rings, discrete valuation rings, power series, Kähler
differentials and continuous cohomology; Mathlib schemes, ringed-space gluing, pullbacks,
étale and smooth morphisms, ring Frobenius and finite-field Frobenius.

## Layer R07.G: Global admissible groups and dyadic amalgams

Fix distinct primes `P, ℓ`, put `S = Spec ℤ`, `U = Spec ℤ[1/P]`, and let
`j : U → S`, `i : Spec 𝔽_P → S` be the inclusions. All groups are commutative.
A μ-type group is the Cartier dual of a finite constant group; being of multiplicative
type alone does not impose trivial Galois action on its character group. This layer owns
the global group-scheme constructions and their arithmetic. Saturation inside modular
Jacobians with Hecke action uses additional hypotheses belonging to the application.

### R07.G1 Admissible groups and their marked global models

<a id="admissible-global-models"></a>

**Admissible global models (`admissible-global-models`).** An admissible group over `U`
is finite flat, killed by a power of `ℓ`, with a filtration by finite flat closed
subgroups whose successive quotients are `ℤ/ℓ` or `μ_ℓ`. An admissible model over `S`
is a separated, quasi-finite, flat group scheme of finite presentation with an
identified admissible restriction to `U`. Retain the injection
`H = G(𝔽̄_P) ↪ G(ℚ̄)`, using compatible geometric points; its image is stable under
the decomposition group at `P` and contained in the inertia invariants. Prove that
models of a fixed admissible `U`-group correspond to these submodules `H`.
Construct `admissibleModelMinimal` with `H = 0` and `admissibleModelMaximal` with
`H = G(ℚ̄)^{I_P}`, including their canonical inclusions around every marked model.
The minimal model is the group-scheme extension by zero, retaining the identity
section at `P`. A finite flat extension to `S` exists exactly when `I_P` is trivial,
and is then the maximal model. These models concern the missing fibre at `P`;
the finite-flat prolongations at `ℓ` remain those of §R07.1.24.

Construct `admissible_subquotient`: close a generic Galois-stable subgroup in a
marked model, represent its fppf quotient, and preserve admissibility and the
specified generic and `P`-fibre exact sequences. On the retained fibre the subgroup
is the intersection with `H`; its quotient is the corresponding quotient of `H`.
Give morphisms, exact sequences and restriction to `U`, including their compatibility
with schematic closures. Sources: Mazur 1977, I §1(a)–(c), (f), pp.43–47,
including Proposition 1.3; §R07.1.20 supplies the finite-flat closure over `U`.

*Needs:* §§R07.1.2, R07.1.20, R07.1.24, R07.1.34–R07.1.35, R07.1.38;
ModularCurves Layers 0C–0E; SchemeAndStackFoundations §1.2 (quasi-finite descent).

**Checks.**

- The full constant `ℤ/ℓ` has retained fibre of order `ℓ`; its minimal model has
  only the identity at `P`, with the same generic Galois module.
- For a constant generic module its maximal model has the full fibre and is finite
  flat. For a module with nontrivial `I_P` action the maximal model still omits the
  noninvariant geometric points and is quasi-finite rather than finite over `S`.
- The zero group has a single marked model, and closing the zero or whole generic
  subgroup gives respectively the identity section or the original model.

### R07.G2 Geometric-fibre lengths

<a id="admissible-geometric-lengths"></a>

**Admissible geometric lengths (`admissible-geometric-lengths`).** For a marked
admissible `G/S` define `length(G) = log_ℓ #G(ℚ̄)`,
`δ(G) = length(G) − log_ℓ #G(𝔽̄_P)` and `α(G) = log_ℓ #G(𝔽̄_ℓ)`.
The logarithms are integer lengths of finite `ℓ`-groups. Prove `length_exact`,
`defect_exact` and additivity of `α` in exact admissible sequences.
Prove `etaleLength_geometric`: `α` counts the constant factors in an admissible
filtration after restriction to `ℤ_ℓ`, equivalently the length of the geometric
étale special fibre. These are geometric point counts; the rank of a group scheme
at characteristic `ℓ` can be larger. The length depends on the generic module,
`δ` on the marked fibre at `P`, and `α` on the integral model at `ℓ`.
Source: Mazur 1977, I §1(f)–(g), pp.47–49.

*Needs:* §R07.G1; §§R07.1.2, R07.1.9; ModularCurves Layer 7E (finite-level
connected–étale sequences).

**Checks.**

- `ℤ/ℓ` and `μ_ℓ` over `ℤ_ℓ` have geometric étale lengths `1` and `0` respectively,
  although both have rank `ℓ`. At `ℓ = 2` even their generic characters agree.
- The full constant model over `S` has `δ = 0`; its extension-by-zero model at `P`
  has `δ = 1`, with the same length and `α = 1`.
- A nontrivial unramified one-dimensional character over `ℤ_ℓ` can have only its
  zero `𝔽_ℓ`-rational point but `ℓ` geometric points. Its geometric étale length
  is `1`. For the zero group all three invariants are zero.

### R07.G3 The global cohomology bound

<a id="admissible-cohomology-bound"></a>

**Admissible cohomology bound (`admissible-cohomology-bound`).** Prove finiteness of
`Hⁱ_fppf(S,G)` for `i = 0,1` and every marked admissible `G/S`. Set
`hⁱ(G) = log_ℓ #Hⁱ_fppf(S,G)`. Prove `cohomology_bound`:
`h¹(G) − h⁰(G) ≤ δ(G) − α(G)`, with subtraction in `ℤ`.
There is no congruence hypothesis on `P`. For an exact admissible sequence
`0 → G₁ → G₂ → G₃ → 0`, prove subadditivity of `h¹ − h⁰` from its long exact
fppf cohomology sequence. Together with §R07.G2 this reduces the bound to the
four elementary marked groups, the full and minimal models of `ℤ/ℓ` and `μ_ℓ`.
Construct the comparison sequence
`0 → Eᵇ → E → i_* E_{𝔽_P} → 0` for the minimal model of either full elementary
model `E`, and its cohomology maps. The sheaf supported at `P` uses the finite
étale fibre, since `P ≠ ℓ`. Compute `H¹(S,ℤ/ℓ) = 0` by global reciprocity and
`H¹(S,μ_ℓ) = ℤˣ/(ℤˣ)^ℓ` by fppf Kummer theory and `Pic(ℤ) = 0`.
Source: Mazur 1977, I §1(g), table and Proposition 1.7 with proof, pp.48–49.

*Needs:* §§R07.G1–R07.G2; SchemeAndStackFoundations §§2.1, 2.3, 2.10–2.11
(site cohomology, torsors, fppf/étale comparison and Kummer theory);
EtaleCohomologyFoundations §0.7 (étale extension by zero and localization);
ClassFieldTheory Layers 11–13 (global reciprocity and unramified abelian extensions).

**Checks.**

- For the full constant `ℤ/ℓ`, `(δ,α,h⁰,h¹) = (0,1,1,0)` and both sides are `−1`.
  Omitting `h⁰` would give a false inequality.
- For `μ₂`, `(δ,α,h⁰,h¹) = (0,0,1,1)`; its nontrivial torsor is
  `Spec ℤ[t]/(t²+1)`. For odd `ℓ` the full `μ_ℓ` has all four invariants zero.
- The minimal constant model has `(δ,α,h⁰,h¹) = (1,1,0,0)`.
  For the minimal `μ₂` model, `h¹ = 1` when `P ≡ 1 mod 4` and `h¹ = 0` when
  `P ≡ 3 mod 4`, while `(δ,α,h⁰) = (1,0,0)`. Thus the bound holds in both cases;
  the congruence controls equality for this elementary group.
- The zero group has `h⁰ = h¹ = δ = α = 0`.

### R07.G4 Rank-one groups over the global base

<a id="admissible-rank-one-global"></a>

**Global rank-one classification (`admissible-rank-one-global`).** For every finite
field `k` of characteristic `ℓ`, a finite flat `k`-vector group scheme `V/S` with
`dim_k V(ℚ̄) = 1` is `k`-linearly isomorphic to
`(ℤ/ℓ) ⊗_{𝔽_ℓ} k` or `μ_ℓ ⊗_{𝔽_ℓ} k`. Construct these scalar extensions,
their generic and Cartier-dual comparisons, and `rankOne_constant_or_cyclotomic`.
The theorem concerns a finite flat group over all of `S`. In particular,
`FiniteFlat.globalPrimeOrderClassification` says that every finite flat group of
rank `ℓ` over `ℤ` is `ℤ/ℓ` or `μ_ℓ`; it has a signature in Suggested.lean.
The generic character is abelian and ramified only at `ℓ`; reciprocity puts its
values in `𝔽_ℓˣ`, and the order-`ℓ` subgroup classification of §R07.1.35 determines
the integral model. Source: Mazur 1977, I §1(e), Proposition 1.5 and proof,
pp.46–47; Oort–Tate 1970, corollary to Theorem 3.

*Needs:* §§R07.1.20, R07.1.34–R07.1.35; Cartier duality and finite constant groups;
ClassFieldTheory Layers 11–13 (including Kronecker–Weber).

**Checks.**

- For `k = 𝔽_ℓ` these are exactly the two order-`ℓ` groups over `ℤ`.
  Over `ℤ` the coordinate algebra is free, so its `Module.finrank` is its rank.
- For `k = 𝔽_{ℓ²}` the two groups have rank `ℓ²`, with respectively `ℓ²` and `1`
  geometric points in characteristic `ℓ`. Coefficient rank one means rank `#k`, not `ℓ`.
- At `ℓ = 2` the two generic modules are isomorphic, but the integral groups are
  distinguished by their geometric special fibres.
- Over `ℤ[1/5]` the order-three finite étale group with character the quadratic
  character of `ℚ(√5)` is neither constant nor `μ₃`. Thus restriction to a punctured
  global base does not give the classification asserted over `S`.

### R07.G5 The cyclotomic class-group input and global Ext vanishing

<a id="admissible-cyclotomic-class-obstruction"></a>

**Cyclotomic class-group obstruction (`admissible-cyclotomic-class-obstruction`).**
For odd `ℓ`, put `K = ℚ(ζ_ℓ)`, let `Y` be the `ℓ`-primary ideal class group of `K`,
and let `ω : Gal(K/ℚ) → ℤ_ℓˣ` be the Teichmüller lift of the mod-`ℓ` cyclotomic
character. Define `Y^(j)` by the natural action on ideals through `ω^j`.
Prove the Stickelberger annihilator statement: `Y^(1) = 0`, and for odd
`1 < j < ℓ−1` the integral scalar
`L_j = (1/ℓ) Σ_{a=1}^{ℓ−1} a ω(a)^(−j)` annihilates `Y^(j)`.
Deduce Herbrand's implication `B_{ℓ−j} ≢ 0 mod ℓ ⇒ Y^(j) = 0`, and in particular
`Y^(−1) = 0`. Transport reciprocity equivariantly: the ideal action agrees with
`x ↦ gxg⁻¹` on the Hilbert-class Galois group. Thus no nonzero everywhere
unramified cyclic `ℓ`-extension of `K`, Galois over `ℚ`, has that inverse-character
conjugation action. At `ℓ = 2`, `K = ℚ` has trivial class group.
Use CyclotomicClassGroupsAndStickelberger §§0.2–0.3, 2.1–2.5, 3.1–3.2 and 8.1–8.3:
its `cyclotomicClassEigenspaces`, `bernoulli_annihilates_component`, `herbrand`,
`cyclotomicClassEigenspace_one_eq_zero`, `inverseCharacterClassGroup` and
`inverseCharacterUnramifiedQuotient_zero` supply this prime-conductor specialization,
with the same covariant ideal action. That roadmap owns the integral annihilator and
eigenspace proof; this target transports it to the finite-flat Ext calculation.
Source: Mazur 1977, I §2, Proposition 2.8 and Corollaries 2.9–2.10, pp.52–54;
Sharifi, *Iwasawa Theory*, Lemmas 4.5.2, 4.5.4–4.5.5 and Theorems 4.5.6–4.5.7,
pp.114–117. The annihilator proof uses Gauss-sum ideal factorization to annihilate
classes by integral smoothings `(b−[b])θ_ℓ`, where
`θ_ℓ = (1/ℓ) Σ_a a[a⁻¹]`, `[a]` denotes `ζ_ℓ ↦ ζ_ℓ^a`, and `b` is a positive
integer prime to `ℓ`. Projection to the `ω^j` component gives
`(b−ω(b)^j)L_j`. For `j ≠ 1`, choose a unit smoothing factor. At `j = 1`, let
`L_1` denote the same weighted sum; it need not be integral, but `b = 1+ℓ`
gives the unit `ℓL_1`. Bernoulli congruences give the stated implication.

Related formalizations are [SKW, revision 20218b5](https://github.com/xroblot/SKW/tree/20218b5bf97b1c49fc3f1c4e6c2ea996fe66cfc9)
for Gauss-sum factorization and [KummerCriterion, revision 89967c4](https://github.com/riccardobrasca/KummerCriterion/tree/89967c49526beb9b38e03e91060d15c04e964fae)
for Bernoulli values and Kummer congruences. API alignment and proof reuse belong to
the cyclotomic supplier. These projects are external to the pins; SKW's admitted
prerequisites and its terminal denominator-cleared annihilator do not supply the
integral smoothings or the exceptional eigenspace statement by themselves.

*Needs:* CyclotomicClassGroupsAndStickelberger §§0.2–0.3, 2.1–2.5, 3.1–3.2 and 8.1–8.3
(integral annihilation, character components and the unramified inverse-character obstruction);
ClassFieldTheory Layers 11–13 (Hilbert class fields and reciprocity,
including equivariance); GlobalNumberFields (ideal classes and cyclotomic fields);
Mathlib's Bernoulli numbers, `PadicInt` and finite group actions.

**Checks.**

- For `ℓ = 3`, the exponent `−1` equals `1 mod 2`, so the `Y^(1)` statement applies;
  no integrality claim for `B₂` at `3` is used.
- For `ℓ ≥ 5`, `j = ℓ−2` gives `B_{ℓ−j} = B₂ = 1/6`, an `ℓ`-adic unit.
  At `ℓ = 5` the element `2` acts by `3` on an inverse-character cyclic quotient,
  rather than by `2`; this tests the reciprocity and dual-action convention.
- For `ℓ = 2`, `Y = 0`; for every odd `ℓ`, use the Teichmüller lift on the entire
  `ℓ`-primary group, since multiplication by a residue-field scalar alone does not
  define an action on a group of exponent `ℓ²`.
- For `ℓ = 5`, `5L_1 ≡ −1 mod 5`, so `L_1` is not integral. The exceptional
  vanishing uses the unit `5L_1`, whereas `L_3` itself is an integral unit.

<a id="admissible-global-ext-vanishing"></a>

**Global Ext vanishing (`admissible-global-ext-vanishing`).** For every prime `ℓ`,
prove `Ext¹_S(μ_ℓ,ℤ/ℓ) = 0`, for extensions
`0 → ℤ/ℓ → E → μ_ℓ → 0` of finite flat commutative groups.
More generally deduce `Ext¹_S(M,C) = 0` for every finite `ℓ`-primary μ-type group
`M` and constant group `C`, by dévissage in both variables. For every prime `ℓ`,
construct `admissibleConnectedEtaleFiltration`: every finite flat admissible `G/S`
has a canonical exact sequence `0 → M → G → C → 0` with `M` μ-type and `C`
constant. The subgroup is the connected part at `ℓ`, extended globally: Ext
vanishing reorders an admissible filtration, global reciprocity makes the étale
quotient constant, and Cartier duality makes the multiplicative subgroup μ-type.
The sequence need not split at `2`. Reduce the prime-order Ext calculation to
primitive classes in `H¹_ét(Sch μ_ℓ,ℤ/ℓ)`: multiplication pulls such a
class back to the sum of its two projections. The cyclotomic component identifies
these classes with the dual of an inverse-character quotient of the unramified
cyclotomic class group, and the preceding obstruction makes them vanish.
Give the comparison with the local/complement extension classes of §R07.1.39;
that exact sequence supplies gluing, while this arithmetic calculation supplies
vanishing. SmallRamificationAndAbelianVarietyBaseCases §3.3 specializes this
vanishing at `ℓ = 2` as `ext_muTwo_zModTwo_eq_zero`. Its independent classification
of simple finite flat two-groups establishes admissibility; applying
`admissibleConnectedEtaleFiltration` then gives its
`exists_diagonalizable_constant_filtration`. The all-prime Ext and admissible
filtration theory is owned here. Source: Mazur 1977, I Proposition 2.1 and proof, pp.49–54;
I §4, Step 1 of the proof of Proposition 4.5, pp.59–60 (filtration consequence).

*Needs:* §R07.G5's cyclotomic class-group obstruction; §§R07.1.38–R07.1.39;
SchemeAndStackFoundations §§2.1, 2.3, 2.10;
ClassFieldTheory Layers 11–13.

**Checks.**

- Every extension `0 → ℤ/2 → E → μ₂ → 0` over `ℤ` splits, whereas
  `0 → μ₂ → D → ℤ/2 → 0` of §R07.G7 does not. The Ext variance is essential.
- The claim has base `ℤ`: over `ℤ[1/P]`, for `P ≡ ±1 mod 8`, there is a nonzero
  extension of `μ₂` by `ℤ/2` killed by `2` (Mazur I Proposition 5.1, pp.60–61).
- Taking `M = 0` or `C = 0` gives the zero Ext group; dévissage includes
  `M = μ_{ℓ²}`, `C = ℤ/ℓ²`, rather than just groups killed by `ℓ`.

### R07.G6 Global purity at odd primes

<a id="admissible-global-purity"></a>

**Odd global purity (`admissible-global-purity`).** For odd `ℓ` and admissible `G/U`,
prove `odd_purity`: the following are equivalent: `G` is a product of a constant
and a μ-type group; its generic module is the direct sum of a trivial module and
the Cartier dual of a trivial module; `I_P` acts trivially; and `G` extends finite
flat over `S`. Use §R07.G5's all-prime connected–étale filtration over `S`.
For odd `ℓ`, the reverse mixed Ext group vanishes as well, by
`ℤˣ/(ℤˣ)^ℓ = 0` and `μ_ℓ(ℤ) = 0`, so the resulting sequence splits.
Source: Mazur 1977, I Proposition 3.1, p.54; Proposition 4.1, p.58;
Proposition 4.5 and proof, pp.59–60.

*Needs:* §§R07.G1, R07.G4–R07.G5; §R07.1.30 (odd-prime full faithfulness);
SchemeAndStackFoundations §2.11; ClassFieldTheory Layers 11–13.

**Checks.**

- `ℤ/ℓ^a × μ_{ℓ^b}` is pure and unramified at every `P ≠ ℓ`, including `a = 0`
  or `b = 0`, where the corresponding factor is trivial.
- A nontrivial unipotent two-dimensional `𝔽₃`-representation from the cubic
  subextension of `ℚ(ζ₇)` gives an admissible finite étale group over `ℤ[1/7]`.
  Its nontrivial inertia at `7` prevents both purity and a finite flat extension to `S`.
- `D` of §R07.G7 is unramified at every odd `P` and extends over `S`, but is not
  pure. The equivalences require `ℓ ≠ 2`.

### R07.G7 The dyadic D-model

<a id="dyadic-D-model"></a>

**Dyadic D-model (`dyadic-D-model`).** Construct `dyadic_D` as `katzMazur 2 (−1)`
over `S`. It has rank four, is killed by `2`, and represents the unique nonzero
extension `0 → μ₂ → D → ℤ/2 → 0` over `S` killed by `2`.
Its generic splitting field is `ℚ(i)`. If `ε_{−1} : G_ℚ → 𝔽₂` is the character
of this quadratic extension, then `σx − x = ε_{−1}(σ) γ(x)` on `D(ℚ̄)`, where
`γ` is the map from the order-two quotient to the subgroup `μ₂`.
Prove integral-model rigidity: for every odd `P`, every finite flat model `D′/U`
of this generic group, and every specified generic isomorphism `D_ℚ ≅ D′_ℚ`,
that isomorphism extends uniquely over `U`; also give the version over `S`.
The connected subgroup over `ℤ₂` is `μ₂`, with constant étale quotient `ℤ/2`.
Sources: Mazur 1977, I Proposition 4.2, formula 4.3 and Proposition 4.4,
pp.58–59; §R07.1.36 identifies the explicit model.

*Needs:* §§R07.1.9, R07.1.35–R07.1.36, R07.1.38; §§R07.G1, R07.G4–R07.G5.

**Checks.**

- The torsor above the nonzero quotient section is `Spec ℤ[t]/(t²+1)`;
  it has no `ℤ`-section, so `D` is nonsplit and its generic points generate `ℚ(i)`.
- Over `𝔽₂`, `D ≅ μ₂ × ℤ/2` and has two geometric points, although its rank
  is four. Its connected part has rank two and its étale quotient has rank two.
- The two other nonzero extension classes of `ℤ/2` by `μ₂` have geometric
  underlying group cyclic of order four, so the killed-by-two hypothesis singles out `D`.
- At every odd `P`, `D` is unramified at `P` but is not a product of a constant
  group with a μ-type group. Odd purity cannot identify this dyadic model.

### R07.G8 Finite-flat dyadic amalgams

<a id="dyadic-finite-flat-amalgam"></a>

**Dyadic finite-flat amalgam (`dyadic-finite-flat-amalgam`).** Let `P` be odd and
`M/U` a finite flat admissible `2`-group of multiplicative type with a specified
closed immersion `μ₂ ↪ M`. Construct `dyadic_amalgam`
`G = M ⊕_{μ₂} D = (M × D)/{(a,−a) : a ∈ μ₂}`.
Prove the pushout property for commutative fppf sheaves, representability and
finite flatness, the compatible closed immersions of `M` and `D`, and the exact
sequence `0 → M → G → ℤ/2 → 0`. Thus `rank G = 2 rank M` and `G` is admissible.
Give functoriality for maps of `M` preserving its specified `μ₂`, and base change.
Prove `dyadic_amalgam_connectedEtale`: over `ℤ₂`, `G⁰ = M_{ℤ₂}` and
`G^ét = ℤ/2`; the same identification holds on the special fibre. Consequently
its local generic connected subgroup is the restriction of the global subgroup
`M_ℚ`. No μ-type hypothesis on `M` is required.
Sources: Mazur 1977, II §17, amalgam definition and Lemma 17.3, pp.130–131;
ModularCurves Layer 0C supplies the finite-flat quotient used in this construction.

*Needs:* §§R07.G1, R07.G7; §§R07.1.9, R07.1.20; ModularCurves Layers 0B–0C.

**Checks.**

- For `M = μ₂` the pushout is `D`, of rank four. A rank-four `M` gives rank eight,
  rather than sixteen, since the quotient removes the common rank-two subgroup.
- At `P = 5`, take the Cartier dual of the rank-four finite étale group whose
  `𝔽₂²` generic module has the nontrivial unipotent action of `Gal(ℚ(√5)/ℚ)`.
  It is admissible and multiplicative, contains `μ₂`, and is not μ-type. Its
  amalgam still has the stated connected subgroup and order-two étale quotient.
- `M = 0` has no `μ₂` closed subgroup, so it is outside the domain of the pushout.
  For every allowed `M`, the special geometric étale fibre of `G` has order two.

## Layer R07.2: Dieudonné theory

Over a perfect field `k` of characteristic `p`, finite commutative `p`-group schemes and
`p`-divisible groups are classified by modules over the Dieudonné ring `W(k)[F, V]`. This layer
proves that classification in the contravariant normalisation, with its dictionary (étale is `F`
bijective, connected is `F` nilpotent, the tangent space and Lie algebra are read off from `M/FM`),
the standard and elliptic examples, slopes and the Dieudonné–Manin classification of isocrystals,
and the isogeny classification of `p`-divisible groups. It then treats the Hasse invariant of a
`BT₁`, smoothness of the stacks of truncated Barsotti–Tate groups and lifting along henselian pairs,
universal covers, and the extensions of Dieudonné theory to smooth bases, `f`-semiperfect rings and
perfect valuation rings, which use the crystalline Dieudonné crystal of AbelianSchemesAndArithmeticModuli
§A4.CR.7.2. The coefficient statements (Frobenius-fixed Witt vectors and descent of characteristic
polynomials) make Dieudonné modules over finite fields usable for point counts.

### R07.2.1 The canonical decomposition of finite commutative group schemes over a perfect field

Prove `canonicalDecomposition`. Let `k` be a perfect field of characteristic `p` and `G` a finite
commutative group scheme over `k`.
Call `G` reduced (`=` étale) or local (`=` connected), and say `G` is of `x`–`y` type if `G` is `x` and its Cartier
dual `G*` is `y`. Then there is a unique and functorial decomposition `G = G_rr ⊕ G_rl ⊕ G_lr ⊕ G_ll`
into summands of reduced–reduced, reduced–local, local–reduced and local–local type. If `G` has
`p`-power order then `G_rr = 0`. `G_rl` is étale with `F_G` an isomorphism, `G_lr` is of multiplicative type
with `V_G` an isomorphism, and on `G_ll` both `F_G` and `V_G` are nilpotent.

*Proof sketch.* Over a perfect field the connected–étale sequence splits canonically by the reduced
subgroup (Stix Proposition 39; compare §R07.1.9 over a henselian base). Apply the splitting to `G` and
to `G*` and combine (Pink Theorem 15.5); the group orders of the four types are computed in Pink §17,
which gives `G_rr = 0` for `p`-power order. `F_G` is an isomorphism exactly on reduced groups and
nilpotent on local ones (Pink §15); dually for `V_G` via `V_G = (F_{G*})*`. (Pink 2005, §15, Theorem
15.5, p. 33: the decomposition; Pink 2005, §28, p. 72: the `p`-power case.)

*Needs:* §R07.1.1; §R07.1.9; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`.

**Checks.**

- `canonicalDecomposition_types`: `ℤ/pℤ` is reduced–local, `μ_p` local–reduced, `α_p` local–local; `ℤ/ℓℤ (ℓ ≠ p)` is reduced–reduced.
- `canonicalDecomposition_elliptic`: `E[p]` for an ordinary elliptic curve over `𝔽̄_p` is `μ_p ⊕ ℤ/pℤ`;
  for a supersingular one it is local–local.
- `canonicalDecomposition_not_perfect`: over the imperfect field `F_p(t)` the connected–étale
  sequence of a finite group need not split (a nonsplit extension of `ℤ/p` by `α_p` exists), so
  perfectness is used.

### R07.2.2 The multiplicative–connected–étale filtration and its splitting over perfect bases

Prove `multiplicativePartFiltration`. Let `S` be a scheme of characteristic `p` and `G` a Barsotti–Tate
group (or a `BT_N`) over `S` whose étale rank and multiplicative rank are locally constant. `(i) G` has a
filtration `G^m ⊂ G^0 ⊂ G` by Barsotti–Tate subgroups, where `G^m` is of multiplicative type (the
Cartier dual of the étale quotient of `G^D`), `G^0` is the connected part (`G/G^0` étale) and `G^0/G^m` has
neither multiplicative nor étale part (biconnected); `G/G^m` is a Barsotti–Tate group without
multiplicative part. `(ii)` If `S` is perfect, the filtration splits canonically: `G = G^m ⊕ G^{oo} ⊕ G^{et}`, with `G^{oo}` biconnected, the splitting being produced by the Verschiebung of `G` and of `G^D`.

Over a henselian local base the connected–étale part is §R07.1.9, and over a perfect field `(ii)` is
the canonical decomposition of §R07.2.1.

*Proof sketch.* `(i)` Constant étale rank makes the étale quotients `G[p^n]^{et}` finite étale of
constant rank, so `G^0 = ker(G → G^{et})` is a Barsotti–Tate subgroup; applying this to `G^D` and
dualising gives `G^m` (Harris–Taylor, Corollary II.1.2, as cited by Pilloni). `(ii)` Over a perfect `S`,
Frobenius twists are isomorphisms; the image of a high power of the Verschiebung on `G[p^n]` is the
multiplicative part and the image of a high power of Frobenius (equivalently of `V` on `G^D`, dualised)
gives a complement to `G^0`; these images are direct summands (Oort–Zink, Proposition 1.3, as cited by
Pilloni). Over a perfect field this recovers `G_rl ⊕ G_lr ⊕ G_ll` of §R07.2.1. (Pilloni 2020, §6.3.4,
proof of Lemma 6.3.4.2, p. 34: the multiplicative Barsotti–Tate subgroup `G^m ⊂ G` at constant
multiplicative rank (citing Harris–Taylor, Corollary II.1.2); Pilloni 2020, §6.3.2, p. 30: the
multiplicative–connected filtration `G^m ⊂ G^o ⊂ G` of a `BT₁` with `G^{oo} = G^o/G^m`; Pilloni 2020,
§7.4.2, proof of Lemma 7.4.2.1, p. 44: splitting `G = G^m ⊕ G^{oo} ⊕ G^{et}` over a perfect scheme via
Verschiebung (citing Oort–Zink, Proposition 1.3).)

*Needs:* §R07.1.6; §R07.1.9; §R07.1.7; AbelianSchemesAndArithmeticModuli §A4.5a
(`TruncatedBT`); §R07.1.10; §R07.2.1; §R07.1.1.

**Checks.**

- `multiplicativePartFiltration_elliptic`: ordinary elliptic curve over a perfect `F_p`-algebra:
  `E[p^∞] = μ_{p^∞}`-twist `⊕ (ℚ_p/ℤ_p)`-twist with `G^{oo} = 0`; supersingular: `G = G^{oo}`.
- `multiplicativePartFiltration_not_split`: over a non-perfect base the filtration need not split:
  the Serre–Tate lift of an ordinary curve over `k[[t]]` with nonconstant `q`-parameter gives a nonsplit
  extension (§R07.1.9).

### R07.2.3 Splitting the base by the type of an order-`p` subgroup

Prove `orderPSubgroupTypeDecomposition`. Let `S` be a scheme of characteristic `p, N ≥ 1, G` a `BT_N` over
`S` with constant étale and multiplicative ranks, and `H ⊂ G` a finite locally free subgroup of order `p`.
Then `S = S^{et} ⊔ S^m ⊔ S^{oo}` with each piece open and closed, such that at every geometric point
of `S^{et}, S^m, S^{oo}` the group `H` is isomorphic to `ℤ/p, μ_p, α_p` respectively.

Order-`p` groups over an algebraically closed field of characteristic `p` are `ℤ/p`, `μ_p` or `α_p`
(§R07.1.34).

*Proof sketch.* Replace `S` by its perfection, which has the same underlying space and geometric
points. Over the perfection `G = G^m ⊕ G^{oo} ⊕ G^{et}` (§R07.2.2 `(ii)`); `H` is étale, multiplicative or
biconnected at a point according to which summand it lies in, and these are closed conditions. Being
étale or multiplicative is open (§R07.1.4 (iii) and its dual); so `S^{et}` and `S^m` are open and closed
and `S^{oo}` is the complement (Pilloni, Lemma 7.4.2.1, proof). (Pilloni 2020, §7.4.2, Lemma 7.4.2.1
and its proof, p. 44: the decomposition `S = S^{et} ⊔ S^m ⊔ S^{oo}` by the type of an order-`p`
subgroup.)

*Needs:* §R07.2.2; §R07.1.4; §R07.1.34; AbelianSchemesAndArithmeticModuli §A4.5a
(`TruncatedBT`).

**Checks.**

- `orderPSubgroupType_ordinary`: for `G = E[p]` with `E` ordinary over a connected base, `H =` the
  canonical subgroup is `μ_p` everywhere: `S = S^m`.
- `orderPSubgroupType_ranks`: without constant étale and multiplicative ranks (e.g. `E` over the
  `j`-line in characteristic `p`) the type of the kernel of Frobenius jumps from `μ_p` to `α_p` at
  supersingular points and `S^m` is not closed.

### R07.2.5 The Dieudonné ring

Define `DieudonneRing`. Let `k` be perfect of characteristic `p, W(k)` its Witt vectors and `σ` the
Frobenius of `W(k)`, an automorphism because `k` is perfect (Mathlib `WittVector.frobeniusEquiv`). The
Dieudonné ring `E = D_k` is the ring of noncommutative polynomials over `W(k)` in `F` and `V` with `Fξ = σ(ξ)F, Vσ(ξ) = ξV (ξ ∈ W(k))` and `FV = VF = p`. A Dieudonné module is a left `E`-module; equivalently a
`W(k)`-module `M` with a `σ`-linear `F` and a `σ^{−1}`-linear `V` such that `FV = VF = p`.

*Construction.* Definition as displayed (Pink §23; Yu Definition 1, where it is written `A_k`). `E` is a
free left, and a free right, `W(k)`-module with basis `{…, V², V, 1, F, F², …}`, from the relations and
`FV = p`. (Pink 2005, §23, Definition, p. 54: the definition; Yu 2026, §2.1, Definition 1, p. 2:
Dieudonné modules.)

The API:

- `DieudonneRing`: The ring `E` over `W(k)` with generators `F, V` and the displayed relations.
- `DieudonneRing.F_mul`: `F * ξ = σ ξ * F`.
- `DieudonneRing.mul_V`: `V * σ ξ = ξ * V`.
- `DieudonneRing.F_mul_V`: `F * V = p` and `V * F = p`.
- `DieudonneRing.basis`: `E` is a free left `W(k)`-module with basis `V^i, 1, F^j`.
- `DieudonneModule`: A `W(k)`-module with `σ`-linear `F, σ^{−1}`-linear `V` and `FV = VF = p`, equivalently a
  left `E`-module; with `DieudonneModule.Hom` (`W(k)`-linear maps commuting with `F` and `V`) it is a
  category, and `DieudonneModule.imageF` is the submodule `FM`, equal to the image of `F` because
  `σ` is bijective on `W(k)` (`DieudonneModule.coe_imageF`).

*Needs:* Mathlib `WittVector`; Mathlib `WittVector.frobeniusEquiv`; Mathlib
`WittVector.isDiscreteValuationRing`; Mathlib `PerfectField`.

**Checks.**

- `DieudonneRing.comm_of_Fp`: For `k = 𝔽_p, E` is commutative and `≅ ℤ_p[F, V]/(FV − p)`.
- `DieudonneRing.not_comm`: For `k = 𝔽_{p²}, F ξ ≠ ξ F` for `ξ = [a]` with `a ∉ 𝔽_p`, so `E` is not
  commutative and the naive commutative ring `W(k)[F, V]/(FV − p)` is wrong.
- `DieudonneRing.quot_F_V`: `E/(EF + EV) ≅ k`.
- `DieudonneModule.zero`: The zero module is a Dieudonné module (of the trivial group).

### R07.2.4 Finite Witt group schemes `W_n^m`

Construct `wittGroup`. Let `k` be a perfect field of characteristic `p` and `n, m ≥ 1`. `W_n` is the
additive group scheme of Witt vectors of length `n` over `k` (its `R`-points are the truncated Witt
vectors `W_n(R)`), and `W_n^m = ker(F^m : W_n → W_n)`. Truncation `r : W_{n+1} ↠ W_n`, Verschiebung `v : W_n ↪ W_{n+1}`, inclusion `i : W_n^m ↪ W_n^{m+1}` and Frobenius `f : W_n^{m+1} ↠ W_n^m` satisfy `rv = vr = V` and if `= fi = F`, with short exact sequences `0 → W_{n′}^m → W_{n+n′}^m → W_n^m → 0` and `0 → W_n^m → W_n^{m+m′} → W_n^{m′} → 0`. The `W_n^m` form a direct system under `v` and `i`, and the Dieudonné ring acts
on each `W_n^m, ξ ∈ W(k)` acting by `σ^{−n}(ξ)`, compatibly with the system.

*Construction.* `W_n(R) =` TruncatedWittVector `p n R` is functorial in `k`-algebras `R` and represented by
an affine space; the group law is the Witt addition (Mathlib). The exact sequences: `r^{n′}` has the
scheme-theoretic splitting `x ↦ (x, 0, …, 0)` (Pink §22), and the `F`-kernel sequences follow by
restriction. The action of §R07.2.5: `F(ξx) = σ(ξ)F(x)` and `ξV(x) = V(σ(ξ)x)` on Witt vectors, so
letting `ξ` act by `σ^{−n}(ξ)` on `W_n^m` is compatible with `F, V` and the transition maps (Pink
Proposition 23.1). (Pink 2005, §22, p. 48: the construction; Pink 2005, §23, Proposition 23.1, p.
54: the `E`-action.)

The API:

- `wittGroup`: `W_n` as an affine commutative group scheme over `k, R ↦` TruncatedWittVector `p n R`.
- `wittGroupKer`: `W_n^m := ker`(`F^m` on `W_n`), a finite local–local group scheme.
- `wittGroup_exact`: The two short exact sequences.
- `wittGroupKer_dieudonneAction`: The `E`-action on `W_n^m` with `ξ` acting by `σ^{−n}(ξ)`, compatible with
  `v` and `i`.

*Needs:* §R07.2.5; Mathlib `TruncatedWittVector`; Mathlib `WittVector`; Mathlib `WittVector.frobenius`;
Mathlib `WittVector.verschiebung`; §R07.1.1.

**Checks.**

- `wittGroup_one`: `W_1 ≅ 𝔾_a` and `W_1^1 ≅ α_p`.
- `wittGroupKer_order`: `W_n^m` has order `p^{nm}`.
- `wittGroupKer_points_zero`: `W_n^m(k̄) = 0`: the group is infinitesimal.
- `wittGroup_not_constant`: `W_n` is not the constant group `ℤ/p^n`: its `k`-points form `W_n(k)`, and for `k = 𝔽_p` these are `ℤ/p^n`, but `W_n` is a smooth group of dimension `n`.

### R07.2.6 The contravariant Dieudonné module of a finite commutative `p`-group scheme

Construct `dieudonneModule`. Let `k` be perfect and `G` a finite commutative group scheme of `p`-power
order over `k`, decomposed as `G = G_rl ⊕ G_lr ⊕ G_ll` (§R07.2.1). Define `M(G_ll) = colim_{n,m} Hom(G_ll, W_n^m)` along postcomposition with `v` and `i, M(G_rl) = colim_n Hom(G_rl, W_n)` along
postcomposition with `v`, and, for a finite-length `W(k)`-module `N` with `F, V, N* = Hom_{W(k)}(N, W(k)[1/p]/W(k))` with `(Fℓ)(n) = σ(ℓ(Vn))` and `(Vℓ)(n) = σ^{−1}(ℓ(Fn))`. Then `M(G) := M(G_rl) ⊕ M(G_lr*)* ⊕ M(G_ll)` is a left `E`-module of finite length, contravariant in `G`, with `F` and
`V` induced by `F_G` and `V_G`.

*Construction.* `M(G_ll)`: the `E`-action on the direct system `W_n^m` (§R07.2.4) makes `colim_{n,m} Hom(G, W_n^m)`
a left `E`-module (Pink §23). `M(G_rl)`: the same with the `W_n` (Pink §27). `N ↦ N*` is an
anti-equivalence on finite-length `W(k)`-modules with `N ≅ N**` (Pink Proposition 26.1), and on left
`E`-modules (Proposition 26.2); since `G_lr*` is reduced–local, `M(G_lr*)*` is defined, and (28.1)
assembles `M(G)`. (Pink 2005, §28, (28.1), p. 72: the definition; Pink 2005, §26, Proposition 26.1, p.
64: the dual module.)

The API:

- `dieudonneModule`: `M` : (finite commutative `p`-group schemes over `k`)`ᵒᵖ ⥤` (left `E`-modules of finite
  length).
- `dualModule`: `N* = Hom_{W(k)}(N, W(k)[1/p]/W(k))` with the twisted `F, V`.
- `dieudonneModule_F`: `F` on `M(G)` is induced by `F_G`, and `V` by `V_G`.
- `dieudonneModule_prod`: `M(G × H) ≅ M(G) ⊕ M(H)`.
- `wittPrimitiveHom G n`: the subgroup of `W_n(coord G)` whose elements define
  homomorphisms `G→W_n`: the counit gives zero and comultiplication agrees with
  the Witt addition polynomials. Identify it with `Hom(G,W_n)`, functorially in
  `G`, with the Frobenius, Verschiebung and the `σ^{−n}` scalar action of
  §R07.2.4. For the unipotent summand `G_rl⊕G_ll`, its colimit along
  Verschiebung is the module constructed above. Retain Cartier duality for
  `G_lr`, then assemble the three summands by (28.1); the primitive colimit
  alone does not give the Dieudonné module of multiplicative groups.
  Sources: Pink 2005, §23, Proposition 23.1, p.54; §27, Theorem 27.1,
  pp.69–71; §28, (28.1), p.72.

*Needs:* §R07.2.1; §R07.2.4; §R07.2.5; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`.

**Checks.**

- `dieudonneModule_zmodp`: `M(ℤ/pℤ) ≅ k` with `F = σ, V = 0`.
- `dieudonneModule_muP`: `M(μ_p) ≅ k` with `F = 0, V = σ^{−1}`.
- `dieudonneModule_alphaP`: `M(α_p) ≅ k` with `F = V = 0`.
- `dieudonneModule_transition`: over `F_p, Hom(ℤ/p,W_n) = p^{n−1}W_n(F_p)`.
  Postcomposition with `v` identifies these one-dimensional groups, giving `colim = F_p`;
  Witt truncation gives zero maps and inverse limit zero.
- `dieudonneModule_trivial`: `M(0) = 0`.
- `dieudonneModule_not_covariant`: `M` is contravariant: the inclusion `μ_p ↪ μ_{p²}` induces the
  surjection `M(μ_{p²}) ↠ M(μ_p)`, not an injection.
- `dieudonneModule_cyclic`: `M(ℤ/p^nℤ) = W_n(k)` with `F = σ`.
- For `α_p`, the first Witt coordinate `X` is primitive and gives the
  one-dimensional module; precomposition by `X↦aX` multiplies the first
  Witt-coordinate coefficient by `a`, with the stated twisted scalar action.
- `Hom(μ_p,W_n)=0` for every `n`, although `M(μ_p)=k`. This separates the
  primitive construction on the unipotent summand from its Cartier-dual extension.

### R07.2.7 Base change and Galois descent for Dieudonné modules

Prove `dieudonneGaloisDescent`. Let `k` be perfect with algebraic closure `k̄`. `(i)` For a perfect
extension `K/k, M(G_K) ≅ W(K) ⊗_{W(k)} M(G)` functorially, for finite commutative `p`-group schemes and
for `p`-divisible groups. `(ii) M(G) = M(G_{k̄})^{Gal(k̄/k)}`. On `M(G_{k̄})` the descent action satisfies
`g(am) = W(g)(a)g(m)`, `1(m) = m` and `g(h(m)) = (gh)(m)`, where `W(g)` is the Witt-vector
lift of that same `g ∈ Gal(k̄/k)`. The action commutes with `F,V`; `σ` denotes only Witt
Frobenius. For finite groups require continuity with the discrete topology on the finite-length
module and the Krull topology on the Galois group. For `p`-divisible groups require continuity
modulo every `pⁿ`, equivalently for the `p`-adic topology. This gives anti-equivalences onto
finite-length Dieudonné modules with descent action, respectively finite free Dieudonné modules
with descent action. Morphisms are Dieudonné maps commuting with every `g`. The forms of `G₀`
over `k̄` correspond to such descent structures on `M(G₀)`. (iii) Over `k̄`, a
finite-length `W(k̄)`-module `N` with a bijective `σ`-linear `F` satisfies `N ≅ W(k̄) ⊗_{ℤ_p} N^{F=1}` (Lang).

*Proof sketch.* `(i)` The functors `colim_n Hom(−, W_n)` and `colim_{n,m} Hom(−, W_n^m)` commute with perfect base
change because `W_n(K) = W(K) ⊗_{W(k)} W_n(k)` for perfect `K/k` (Demazure via nLab; Yu Theorem 3 and
the remark after it). `(ii)` Finite Galois descent for vector spaces (Pink Theorem 11.2) passes to
`W_n(k′)`-modules and to affine group schemes; passing to the limit over finite Galois subextensions
of `k̄/k` gives descent for Hopf algebras and for finite-length `W(k̄)`-modules with continuous
semilinear action; `M(G_{k̄})^{Gal} = colim_n Hom(G_{k̄}, W_{n,k̄})^{Gal} = colim_n Hom(G, W_n) = M(G)` (Pink,
proof of Theorem 27.1). (iii) Pink Proposition 27.3: choose `W(k̄)`-bases, write `F = φgσφ^{−1}` with `g`
in the connected group `Aut_{W(k̄)}(N)` and apply Lang's theorem to write `g = h^{−1}σ(h)`. (Pink 2005,
§27, proof of Theorem 27.1, p. 71: descent from `k̄`; Pink 2005, §27, Proposition 27.3, p. 70: part
(iii); Demazure 1972, III.`8`, Remark (Demazure pp. 71–72): part `(i)`.)

*Needs:* §R07.2.6; Mathlib `WittVector`; Mathlib `PerfectField`.

**Checks.**

- `dieudonneGaloisDescent_twist`: over `𝔽_p` (`p` odd), the twist `G` of `ℤ/pℤ` on which the Frobenius of
  `Gal(𝔽̄_p/𝔽_p)` acts by `−1` has `M(G) = 𝔽_p` with `F = −1`, not isomorphic to `M(ℤ/pℤ) = 𝔽_p` with `F = 1`;
  over `k̄` both become `k̄` with `F = σ`, and only the Galois actions tell them apart.
- On the constant `ℤ/p` over `k̄`, the module is `k̄` with `g(a)=g(a)` and identity action
  `1(a)=a`. For `a∉𝔽_p`, replacing every scalar action by `σ(a)=a^p` violates this identity law.
- `dieudonneGaloisDescent_length`: length is preserved: `length_{W(k)} M(G) = length_{W(k̄)} M(G_{k̄})`.

### R07.2.8 Dieudonné classification of finite commutative `p`-group schemes

Prove `dieudonneEquivalenceFinite`. Let `k` be a perfect field of characteristic `p`. The functor `M` of
§R07.2.6 is an anti-equivalence from finite commutative group schemes of `p`-power order over `k` to
left `E`-modules of finite length over `W(k)`; `length_{W(k)} M(G) = log_p |G|`, and `M(G*) ≅ M(G)*`
functorially. Under it, `G` is étale iff `F` is bijective on `M(G)`, of multiplicative type iff `V` is
bijective, and local–local iff `F` and `V` are nilpotent; these match the unique decomposition `M = M_rl ⊕ M_lr ⊕ M_ll` of finite-length `E`-modules.

*Proof sketch.* Local–local case (Pink Theorem 23.2): `E_n^m := E/(EF^m + EV^n) ≅ End(W_n^m) ≅ M(W_n^m)` and length `M(G) = log_p |G|` (Proposition 23.3); every local–local `G` embeds in a sum of
`W_n^m`, and the functor is fully faithful and essentially surjective by the resulting resolutions.
Étale case (Pink Theorem 27.1): over `k̄, M(G) = W(k̄) ⊗_{ℤ_p} Hom(Γ, ℚ_p/ℤ_p)` for the constant group
`Γ`, and Lang's theorem (Proposition 27.3) shows every finite-length module with bijective `F` is of
this form; descend by §R07.2.7. Duality: `M(G*) ≅ M(G)*` in the local–local case (Theorem 26.3, via
`(W_n^n)* ≅ W_n^n`); the multiplicative part is defined by duality. Lemma 28.2: every finite-length
`E`-module splits uniquely as `M_rl ⊕ M_lr ⊕ M_ll` according to `F` and `V`; together with §R07.2.1 this
assembles the equivalence (Theorem 28.3). (Pink 2005, §28, Theorem 28.3, p. 73: the theorem; Pink
2005, §23, Theorem 23.2, p. 55: the local–local case.)

*Needs:* §R07.2.6; §R07.2.1; §R07.2.4; §R07.2.5; §R07.2.7.

**Checks.**

- `dieudonneEquivalenceFinite_length`: `|μ_p| = p` and length `M(μ_p) = 1`; `|W_n^m| = p^{nm}` and
  `M(W_n^m) = E/(EF^m + EV^n)` has length `nm`.
- `dieudonneEquivalenceFinite_simple`: the simple objects are `ℤ/pℤ, μ_p` and `α_p` over `k̄` (compare
  Stix Theorem 54 and Corollary 55).
- `dieudonneEquivalenceFinite_etale`: `G` étale iff `F` bijective: for `ℤ/p` (`F = σ`) yes, for
  `μ_p` (`F = 0`) no, and `μ_p` is instead the case where `V` is bijective.

At the pins the theorem is stated as `dieudonneEquivalenceFinite`: on the full subcategory `PGroup`
of finite commutative group schemes of `p`-power order over `k` there is a fully faithful
contravariant functor to `DieudonneModule` with `length M(G) = log_p |G|`, with `G` étale exactly
when `F` is bijective on `M(G)`, and whose essential image contains every Dieudonné module of
finite length.

### R07.2.9 The tangent space of a finite group scheme from its Dieudonné module

Prove `dieudonneTangentSpace`. For a finite commutative group scheme `G` of `p`-power order over a
perfect field `k`, with `σ_k(c) = c^p`, there is a natural `k`-linear isomorphism
`σ_k^*T_{G,0} ≅ Hom_k(M(G)/FM(G),k)`. Equivalently, the comparison from `T_{G,0}` to the ordinary
`k`-dual is `σ_k`-semilinear. It commutes with group homomorphisms and perfect-field base change,
using `σ_K ∘ i = i ∘ σ_k` for every perfect extension `i : k → K`.

*Proof sketch.* The étale case has both sides zero. For the local cases, Cartier duality
identifies `T_{G,0}` with `Hom(G^D,𝔾_a)` with its usual `k`-scalar action (Pink Proposition 13.1).
Its inclusion into `M(G^D)` identifies it additively with `ker V`. The scalar action on `W_1` in
§R07.2.4 is `c` acting by `c^{1/p}`, so this inclusion is `σ_k`-semilinear.
The ordinary Cartier pairing identifies `ker V` in `M(G)^*` with `Hom_k(M(G)/FM(G),k)`, using
`p^{−1}W/W ≅ k` via `p^{−1}w ↦ w mod p`. The resulting comparison has the stated scalar transport.
(Pink 2005, §23, Proposition 23.1, pp. 54–55: the `σ^{−n}` scalar action;
§26, Proposition 26.2, p. 64: dual `F` and `V`; §28, Proposition 28.4, p. 73: the tangent
comparison, with this scalar action retained.)

*Needs:* §R07.2.8; §R07.2.4.

**Checks.**

- `dieudonneTangentSpace_alphaP`: `α_p`: both spaces have dimension one. For `x ↦ ax`,
  the action on `M(α_p)`, in the `W_1` scalar normalization, is `a^p`; the action on `T` is `a`.
  The `σ_k` pullback intertwines them even for `a ∉ F_p`.
- `dieudonneTangentSpace_muP`: `μ_p: T = k` and `M(μ_p)/F = k (F = 0)`.
- `dieudonneTangentSpace_zmodp`: `ℤ/pℤ: T = 0` and `F` is bijective.

### R07.2.10 Dieudonné classification of `p`-divisible groups

Prove `dieudonnePDivisible`. Let `k` be perfect. For a `p`-divisible group `G = (G_n)` of height `h` over `k`
put `M(G) = lim_n M(G_n)`, with transitions induced contravariantly by the inclusions
`G_n ↪ G_{n+1}`. Then `G ↦ M(G)` is an anti-equivalence from `p`-divisible groups over `k` to
`W(k)`-free Dieudonné modules of finite rank (free `W(k)`-modules with `σ`-linear `F, σ^{−1}`-linear `V, FV = VF = p`). Moreover `M(G_n) ≅ M(G)/p^n M(G), rank_{W(k)} M(G) = h, M` is exact and commutes with perfect
base change, and `M(G^D) ≅ M(G)^t := Hom_{W(k)}(M(G), W(k))` with `(Ff)(x) = σ(f(Vx))` and `(Vf)(x) = σ^{−1}(f(Fx))`. The crystalline adapter in §R07.2.20 identifies this scalar normalization with
`D(G)_{W(k)}` of AbelianSchemesAndArithmeticModuli §A4.CR.7.2, preserving the ordinary `W(k)`-scalar action,
Cartier pairing, `F, V`, group-map variance and perfect-field base change. The pairing satisfies
`⟨Fx,F^t f⟩ = pσ⟨x,f⟩`; rationally this is `D(G^D) ≅ D(G)^∨(−1)`.

*Proof sketch.* Limit lemma (Demazure III.`8`, via nLab): for a system `… → M_{n+1} → M_n → … → M_1` of
finite-length `W(k)`-modules with `M_{n+1} →^{p^n} M_{n+1} → M_n → 0` exact, `M = lim M_n` is finitely
generated and `M ↠ M_n` identifies `M_n = M/p^n M`. Apply it to `M_n = M(G_n)`: §R07.1.5 gives `0 → G_n → G_{n+1} →^{p^n} G_{n+1}`, and `M`, being exact and contravariant (§R07.2.8), turns it into the required
right-exact sequences. `M(G)` is torsion free because multiplication by `p` on `G` is an epimorphism with
finite kernel; lengths give `rank_{W(k)} M(G) = h` (length `M(G_1) = log_p |G_1| = h`). Conversely a
`W`-free Dieudonné module `M` gives `G_n` with `M(G_n) = M/p^n M`, and the `G_n` form a `p`-divisible group;
full faithfulness passes to the limit. Duality: `M(G_n^D) = M(G_n)* = Hom(M/p^n M, W(k)[1/p]/W(k)) = M^t/p^n M^t`, compatible in `n`, with the twisted `F, V` of §R07.2.6; base change from §R07.2.7.
(Demazure 1972, III.`8`, Theorem and Remark (Demazure pp. 71–72): freeness, height and duality;
Demazure 1972, III.`8`, Lemma: the limit lemma; Yu 2026, §2.1, Theorem 3 and the paragraph after it,
p. 2: the theorem, with exactness, base change and the dual `M^t`.)

*Needs:* §R07.2.8; §R07.2.7; §R07.2.5; §R07.1.6; §R07.1.5; §R07.1.7.

**Checks.**

- `dieudonnePDivisible_standard`: `M(ℚ_p/ℤ_p) = W(k)` with `F = σ` and `V = pσ^{−1}`; `M(μ_{p^∞}) = W(k)`
  with `F = pσ` and `V = σ^{−1}` (§R07.2.12).
- `dieudonnePDivisible_rank`: the height is the rank: `E[p^∞]` has a rank-two module (§R07.2.14).
- `dieudonnePDivisible_torsion_free`: `M(G)` is `W(k)`-free. The inverse limit is taken along the
  surjections `M(G_{n+1}) ↠ M(G_n)` induced by the inclusions `G_n ↪ G_{n+1}`; for `G = ℚ_p/ℤ_p` it
  is `W(k)`. The direct limit along the injections `M(G_n) ↪ M(G_{n+1})` induced by `p : G_{n+1} ↠ G_n` is `W(k)[1/p]/W(k)` instead, a torsion module that is not finitely generated, so a definition
  using it fails the freeness test.

### R07.2.11 Lie algebra, dimension and height from the Dieudonné module

Prove `dieudonneLieAlgebra`. For a `p`-divisible group `G` over a perfect field `k` with `M = M(G)`,
there is a natural `k`-linear isomorphism `σ_k^*Lie(G) ≅ Hom_k(M/FM,k)`, equivalently
`Lie(G) ≅ (σ_k^{−1})^*Hom_k(M/FM,k)`. Consequently `dim G = dim_k M/FM, dim G^D = dim_k M/VM`, and `h =` rank `M = dim G + dim G^D`. The comparison and both dimension
formulas commute with perfect-field base change.

*Proof sketch.* `Lie(G) = Lie(G[p])` because `d[p] = p = 0` on tangent spaces; `M(G[p]) = M/pM`,
and `(M/pM)/F = M/FM`. Apply §R07.2.9 with its scalar transport. `F` injective and
`pM = FVM` give the `σ_k`-semilinear exact sequence
`0 → M/VM →^{F} M/pM → M/FM → 0`; its linear form starts with `σ_k^*(M/VM)`.
Applying the tangent comparison to `G^D` and the ordinary dual `F` formula gives
`dim G^D = dim_k M/VM`. The exact sequence then gives the height formula, recovering
§R07.1.15 over perfect fields. The crystalline Hodge identification and its scalar-explicit
comparison with `Hom_k(M/FM,k)` are the adapter of §R07.2.20.
(Yu 2026, §2.1, pp. 2–3: height and the Lie-space carrier; Pink 2005, §23,
Proposition 23.1 and §28, Proposition 28.4: its scalar transport; AbelianSchemesAndArithmeticModuli
§A4.CR.7.2, *Grothendieck–Messing deformation theory*: the Hodge exact sequence.)

*Needs:* §R07.2.10; §R07.2.9; §R07.1.14; §R07.1.15.

**Checks.**

- `dieudonneLieAlgebra_standard`: `μ_{p^∞}: M/FM = W/pW, dim 1`; `ℚ_p/ℤ_p: F` bijective, `dim 0`.
- `dieudonneLieAlgebra_elliptic`: elliptic curves: `dim M/FM = dim M/VM = 1` (Yu p. 3).
- `DieudonneModule.muPInfty_length_quotient_imageF` computes length `1` for the
  Frobenius cokernel of `μ_{p^∞}`; `DieudonneModule.qpZp_length_quotient_imageF`
  computes length `0` for `ℚ_p/ℤ_p`. `DieudonneModule.muPInfty_imageF_ne_top`
  states only that the multiplicative image is proper.

### R07.2.12 The Dieudonné modules of `μ_{p^∞}, ℚ_p/ℤ_p` and the rank-two models

Prove `standardDieudonneModules`. Over a perfect field `k: (i) M(ℚ_p/ℤ_p) = W(k)e` with `Fe = e, Ve = pe`; `(ii) M(μ_{p^∞}) = W(k)e` with `Fe = pe, Ve = e`; (iii) the rank-two modules M1 `= ⟨e₁, e₂⟩` with `Fe₁ = e₁, Ve₁ = pe₁, Fe₂ = pe₂, Ve₂ = e₂` (M1 `= M(ℚ_p/ℤ_p) ⊕ M(μ_{p^∞})`) and M2 `= ⟨e₁, e₂⟩` with `Fe₁ = Ve₁ = e₂, Fe₂ = Ve₂ = pe₁` are `W`-free Dieudonné modules of height `2` and dimension `1`. Rationally,
`M(ℚ_p/ℤ_p) ⊗ L` and `M(μ_{p^∞}) ⊗ L` are the standard one-dimensional isocrystals of slope `0` and `1`.

Here `L = W(k)[1/p]`.

*Proof sketch.* `(i) M(ℤ/p^nℤ) = colim_m Hom(ℤ/p^n, W_m) = W_n(k)` along postcomposition with `v`,
with `F = σ`; take the inverse limit
(§R07.2.10). `(ii) μ_{p^∞}` is the Cartier dual of `ℚ_p/ℤ_p` (§R07.1.7), so `M(μ_{p^∞}) = M(ℚ_p/ℤ_p)^t`:
for `f` the dual basis vector, `(Ff)(e) = σ(f(Ve)) = p` and `(Vf)(e) = σ^{−1}(f(Fe)) = 1`. (iii) `FV = VF = p` on the displayed bases; `dim M/FM = 1` in both (§R07.2.11). Rationally, `F` acts on `M(ℚ_p/ℤ_p) ⊗ L` by
`φ` and on `M(μ_{p^∞}) ⊗ L` by `pφ`, which are Mathlib's StandardOneDimIsocrystal `0` and `1`. (Yu 2026, §2.1,
Example `2`, p. 2: the rank-two models.)

*Needs:* §R07.2.10; §R07.2.11; §R07.1.7; Mathlib `WittVector.StandardOneDimIsocrystal`.

**Checks.**

- `standardDieudonneModules_dim`: `dim μ_{p^∞} = 1` and `dim ℚ_p/ℤ_p = 0` via `M/FM`, agreeing with
  §R07.1.14.
- `standardDieudonneModules_M2`: M2 has no `F`-stable line on which `F` is bijective, so it has no étale
  part.
- `standardDieudonneModules_FV`: on `M2`, `FV e₁ = F e₂ = p e₁` and
  `VF e₂ = V(p e₁) = p e₂`, so `FV = VF = p`. Changing only `Fe₂ = p e₁` to
  `Fe₂ = e₁` gives `(FV)e₁ = e₁ ≠ p e₁`, with `FV = diag(1,p)`, and is not a Dieudonné module.
- `DieudonneModule.dual_qpZp` and `DieudonneModule.dual_muPInfty`: Witt duality
  exchanges the standard étale and multiplicative modules, including both `F` and `V`.
- The rank-one modules `(i)` and `(ii)` are the light definitions `DieudonneModule.qpZp` and
  `DieudonneModule.muPInfty` on `W(k)`, with `V = pσ^{−1}` and `V = σ^{−1}` respectively.
  `qpZp_F_bijective`: on `M(ℚ_p/ℤ_p)` the Frobenius is bijective (slope `0`).
  `muPInfty_F_not_surjective` and `muPInfty_imageF_ne_top`: on `M(μ_{p^∞})` the Frobenius is not
  surjective and `FM ≠ M`, so `M/FM ≠ 0` (dimension `1`); a covariant convention would exchange the
  two modules in these tests.

### R07.2.13 Biconnected groups killed by `p` are successive extensions of `α_p`

Prove `alphaPFiltration`. Let `k` be a field of characteristic `p` and `G` a finite commutative `k`-group
scheme killed by `p` such that `G` and its Cartier dual `G^D` are connected (`G` is local–local). Then `G` has
a filtration `0 = G₀ ⊂ G₁ ⊂ ⋯ ⊂ G_r = G` by closed subgroups with every `G_i/G_{i−1} ≅ α_p`, where `α_p = ker(F : G_a → G_a)`. Consequently `H^i_fppf(k, G) = 0` for `i ≥ 2`, since this holds for `α_p` (coherent
cohomology of `G_a` vanishes in positive degrees).

No perfectness is assumed; over a perfect field, local–local means that `F` and `V` are nilpotent on
`G` (§R07.2.1).

*Proof sketch.* Over a perfect field: by §R07.2.8, `M = M(G)` is killed by `p` with `F` and `V` nilpotent;
since `FV = VF = p = 0, ker F ∩ ker V ≠ 0` (take the last nonzero iterate of `V` on a nonzero vector of
`ker F`, which is `V`-stable), so `M` has a filtration by Dieudonné submodules with one-dimensional graded
pieces killed by `F` and `V`; the unique such module `k` with `F = V = 0` is `M(α_p)`. Over an arbitrary field
the statement is SGA 3, Exposé XVII, 4.2.1 `(ii) ⇔ (iv)` (unipotent infinitesimal groups), as used by
Česnavičius. The cohomological consequence: the long exact sequences of the filtration reduce
`H^i_fppf(k, G)` to `H^i_fppf(k, α_p)`, and `0 → α_p → G_a →F G_a → 0` with `H^i(k, G_a) = 0` for `i ≥ 1`.
(Česnavičius 2019, Appendix `A`, proof of Theorem A.3, p. 15 (arXiv:1711.06456v4): a finite
commutative group killed by `p`, connected with connected dual, is a successive extension of copies of
`α_p` (citing SGA 3 XVII 4.2.1), used to compute fppf cohomology of fields of dimension `≤ 1`; Yu 2026,
§2.1, Example `2` and Lemma 4, pp. 2–3: the Dieudonné module `M₂` of a supersingular elliptic curve.)

*Needs:* §R07.2.1; §R07.2.8; §R07.2.12; Tau Ceti
`TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`.

**Checks.**

- `alphaPFiltration_supersingular`: `G = E[p]` for a supersingular elliptic curve `E/F̄_p`: an extension
  of `α_p` by `α_p` (its Dieudonné module is `M₂` of Yu's Example `2 mod p`).
- `alphaPFiltration_needs_dual_connected`: the hypothesis that `G^D` is connected is needed: `μ_p` is
  connected, killed by `p`, but has no `α_p` subquotient.
- `alphaPFiltration_length`: `W_n^m` is killed by `p` exactly when `min(n,m) = 1`.
  `W_1^m = ker F^m` on `𝔾_a` has `m` factors `α_p`; `W_n^1` has `n` factors `α_p`.
  In particular `W₂¹` is killed by `p` and has order `p²`, since `p = VF`.

### R07.2.14 Dieudonné modules of elliptic curves: ordinary and supersingular

Prove `ellipticDieudonne`. Let `k` be algebraically closed of characteristic `p` and `E/k` an elliptic
curve with `M = M(E[p^∞])`. Then `M ≅` M1 or `M ≅` M2 (§R07.2.12), and `E` is ordinary iff `M ≅` M1 and
supersingular iff `M ≅` M2.

*Proof sketch.* `M` has rank `2` with `dim M/FM = dim M/VM = 1` (§R07.2.11, `E[p^∞]` self-dual). If `FM̄ ≠ VM̄` in `M̄ = M/pM: F` and `V` are bijective on `FM̄` and `VM̄`; `F^∞M = ⋂ F^mM` and `V^∞M` are free of rank one,
with generators `e₁ = Fe₁` and `e₂ = Ve₂`, so `M ≅` M1, and `F^∞M` is the étale part: `E` is ordinary. If `FM̄ = VM̄: F²M = pM`, the skeleton `{m : F²m = pm}` is a Dieudonné module over `𝔽_{p²}` with `M^⋄ ⊗ W(k) ≅ M`;
`e₁ ∉ (F, V)M^⋄` and `e₂ = Fe₁` give `M ≅` M2, with no étale part: `E` is supersingular (Yu Lemma 4). (Yu
2026, §2.1, Lemma 4, p. 3: the statement and proof.)

*Needs:* §R07.2.12; §R07.2.11; §R07.2.10.

**Checks.**

- `ellipticDieudonne_ordinary`: ordinary: `M ≅ M(μ_{p^∞}) ⊕ M(ℚ_p/ℤ_p)`, matching ModularCurves Layer
  7E (PD-`5`) `(E₀[p^∞] ≅ μ_{p^∞} × ℚ_p/ℤ_p)`.
- `ellipticDieudonne_supersingular`: supersingular: M2 `⊗ L` is simple of slope `1/2` (§R07.2.16),
  matching the connected height-two group of PD-`5`.

### R07.2.15 Integral consequences of the Dieudonné–Manin classification

Prove `dieudonneManinClassification` as the comparison of integral Dieudonné modules with the
standard blocks and classification of CrystallineCohomology §CR.4.7, *Slope decomposition on the
existing isocrystal carrier*. Consume its cyclic blocks `E_{r/s}, F^s = p^r`, their simplicity,
different-slope `Hom` vanishing, algebraically closed classification and descent of slope summands
to perfect fields. For a `W(k)`-free Dieudonné module `M` over a perfect field, `pM ⊆ FM ⊆ M` implies
that `M[1/p]` has slopes in `[0,1]`. Over algebraically closed `k, M_{a,b} = W[F,V]/(F^a − V^b)` has
slope `b/(a+b)`, giving the slope dictionary for `p`-divisible groups. Here also compute
`End(E_{r/s})`, for `gcd(r,s) = 1` and `s > 0`: it is the central division algebra over `ℚ_p` of
dimension `s²` and Brauer invariant `−r/s` modulo `ℤ`.

*Proof sketch.* Use the imported decomposition on Mathlib's `WittVector.Isocrystal` carrier.
The two integral inclusions bound all slopes between `0` and `1`. Inverting `p` in `F^a = V^b` gives
`F^{a+b} = p^b`. For endomorphisms, use the cyclic basis and the skeleton fixed by `p^{−r}F^s`;
commuting with left multiplication realizes the endomorphisms as the opposite of the cyclic
algebra of invariant `r/s`. (Yu 2026, §2.2, Theorem 5, p. 3: integral isogeny classification;
§3, Theorem 12 and Remark 13, pp. 8–9: the opposite endomorphism algebra and effective slopes.)

*Needs:* §R07.2.5; §R07.2.12; CrystallineCohomology §CR.4.7 (*Slope decomposition on the
existing isocrystal carrier*); Mathlib `WittVector.Isocrystal`.

**Checks.**

- `dieudonneManin_standard`: `E₀ = (L, σ)` is `M(ℚ_p/ℤ_p)[1/p], E₁ = (L, pσ)` is
  `M(μ_{p^∞})[1/p]`, and `E_{1/2}` is the supersingular elliptic isocrystal.
- `dieudonneManin_needs_closed`: over `F_p`, (`ℚ_p`, up), `u ∈ ℤ_p^×` with `u ≠ 1`, has slope `1`
  and is not isomorphic to `(ℚ_p,p)`; the standard-block classification needs algebraic closure.
- `dieudonneManin_endomorphisms`: `End(E_{1/2})` has dimension `4` and invariant `1/2`, while
  `End(E₀ ⊕ E₁) = ℚ_p × ℚ_p`. For `E_{1/3}`, the invariant is `−1/3 = 2/3`, not `1/3`.

### R07.2.16 Slopes, Newton polygon and a-number of a Dieudonné module

Define `standardDieudonne`. For coprime `(a, b) ≠ (0, 0)` with `a, b ≥ 0` let `M_{a,b} = W(𝔽_p)[F, V]/(F^a − V^b)`, of slope `λ = b/(a + b) ∈ [0, 1]`. For a `W`-free Dieudonné module `M` over an
algebraically closed `k`, the Dieudonné–Manin theorem gives `M ⊗_W L ≅ ⊕_i (M_{a_i,b_i} ⊗ L)^{m_i}`; the
slope sequence of `M` lists `λ_i` with multiplicity `(a_i + b_i)m_i`. Over a perfect `k` the slopes are
those of `M ⊗ W(k̄)`. The a-number is `a(M) = dim_k M/(F, V)M`. For a `p`-divisible group `G` these are
defined through `M(G)`.

*Construction.* Definitions as displayed (Yu §2.2); well defined by the uniqueness in
the classification of CrystallineCohomology §CR.4.7 and by base-change invariance (§R07.2.7). The sum
of the multiplicities
is rank `M`; the slopes lie in `[0, 1]` because `F(M) ⊆ M` and `V(M) ⊆ M`. (Yu 2026, §2.2, p. 3: the
standard modules and slopes; Yu 2026, §2.2, Theorem 5, p. 3: the Dieudonné–Manin classification
(CrystallineCohomology §CR.4.7).)

The API:

- `standardDieudonne`: `M_{a,b} = W(𝔽_p)[F, V]/(F^a − V^b)` for coprime `(a, b) ≠ (0, 0)`.
- `slopeSequence`: The slope sequence of a `W`-free Dieudonné module, a multiset of rationals in `[0, 1]` of size rank `M`.
- `aNumber`: `a(M) = dim_k M/(F, V)M`.
- `slopeSequence_baseChange`: Slopes are invariant under perfect base change.
- `slopeSequence_dual`: The slopes of `M^t` are `1 − λ_i`.

*Needs:* CrystallineCohomology §CR.4.7 (*Slope decomposition on the existing isocrystal carrier*);
§R07.2.10; §R07.2.12; Mathlib `WittVector.Isocrystal`; Mathlib
`WittVector.isocrystal_classification`; §R07.2.15.

**Checks.**

- `slope_constQpZp`: `M(ℚ_p/ℤ_p) = M_{1,0}`: slope `0`.
- `slope_muPInfty`: `M(μ_{p^∞}) = M_{0,1}`: slope `1`.
- `slope_supersingular`: M2 `= M_{1,1}`: slope `1/2` with multiplicity `2`.
- `slope_out_of_range`: The isocrystal StandardOneDimIsocrystal `2 (F = p²φ)` has slope `2` and contains
  no `F,V`-stable lattice: `V = pF^{−1}` would not preserve it. So it is not `M ⊗ L` for any Dieudonné
  module.
- `aNumber_M1`: `a`(M1) `= 0` while `a`(M2) `= 1`.

### R07.2.17 Isogeny classification of `p`-divisible groups over a perfect field

Prove `isogenyClassification`. Let `k` be perfect and `L = W(k)[1/p]`. `(i) Hom(G, H) ⊗ ℚ ≅ Hom_{F}(M(H) ⊗ L, M(G) ⊗ L)` (maps of isocrystals), so `G` and `H` are isogenous iff `M(G) ⊗ L ≅ M(H) ⊗ L`. `(ii)` Over `k`
algebraically closed, isogeny classes of `p`-divisible groups correspond to finite multisets of slopes
in `[0, 1]` satisfying the Dieudonné–Manin integrality (each slope `b/(a+b)` occurring with multiplicity
divisible by `a + b`); height `=` number of slopes and `dim G =` the sum of the slopes. (iii) `G` is étale
iff all slopes are `0`, of multiplicative type iff all are `1`, and `E[p^∞]` is ordinary iff its slopes
are `{0, 1}`.

*Proof sketch.* `(i) M` is an anti-equivalence (§R07.2.10). A map of isocrystals `f` satisfies `p^N f(M(H)) ⊆ M(G)` for large `N` and commutes with `F`, hence with `V = pF^{−1}`; so it comes from `Hom(G, H) ⊗ ℚ`. An isogeny induces an isomorphism after `⊗ L`, and conversely an isomorphism of isocrystals scaled
into lattices is an isogeny. `(ii)` Every isocrystal with slopes in `[0, 1]` contains an `F,V`-stable
`W`-lattice, namely `⊕ (M_{a,b} ⊗ W)^{m}`; CrystallineCohomology §CR.4.7 classifies the isocrystals. `dim G = dim_k M/FM = v_p(det F)` (length of the cokernel of a `σ`-linear injective endomorphism of a free
module), and on `M_{a,b} ⊗ L, F^{a+b} = p^b·`(unit), so `v_p(det F)` is the sum of the slopes
(§R07.2.11). (iii) `F` bijective iff slope `0` only, `V` bijective iff slope `1` only (§R07.2.8 and
§R07.2.12). (Yu 2026, §2.2, Theorem 5 and the definition of the slope sequence, pp. 3–4: slope
sequences; the isogeny statement is derived here from Theorem 3 and Theorem 5.)

*Needs:* CrystallineCohomology §CR.4.7 (*Slope decomposition on the existing isocrystal carrier*);
§R07.2.10; §R07.2.16; §R07.2.11; §R07.2.12; §R07.2.15.

**Checks.**

- `isogenyClassification_supersingular`: supersingular elliptic curves: slopes `{1/2, 1/2}, dim 1`,
  height `2`.
- `isogenyClassification_integrality`: the slope multiset `{1/2}` (multiplicity `1`) is excluded: slope
  `1/2` needs multiplicity divisible by `2`.
- `isogenyClassification_ordinary`: `μ_{p^∞} × ℚ_p/ℤ_p` and a supersingular `E[p^∞]` have the same
  height `2` and dimension `1` but slopes `{0, 1}` and `{1/2, 1/2}`, so they are not isogenous;
  height and dimension do not classify up to isogeny.

### R07.2.18 Frobenius-fixed Witt vectors are the `p`-adic integers

Prove `frobenius_eq_self_iff` and `padicConstants_injective`. For a prime `p` and a field `k` of
characteristic `p`, let `ι_k : ℤ_p ≅ W(F_p) → W(k)` be the map induced by `F_p ⊆ k`. Then `ι_k` is an
injective ring homomorphism, natural in field maps `k → k′`, and an element `x ∈ W(k)` satisfies `F(x) = x` (`F` the Witt vector Frobenius) if and only if `x = ι_k(z)` for a unique `z ∈ ℤ_p`. No finiteness or
perfectness of `k` is needed.

The identification `W(F_p) ≅ ℤ_p` is Mathlib's `WittVector.equiv`.

*Proof sketch.* `F` acts on Witt coordinates by `x = (x₀, x₁, …) ↦ (x₀^p, x₁^p, …)`, since `F` is `W`
applied to the Frobenius of `k` (characteristic `p`). So `F(x) = x` iff every `x_i ∈ k` satisfies `x_i^p = x_i`, i.e. `x_i ∈ F_p`, i.e. `x ∈ W(F_p)`. Injectivity and naturality: `W` is a functor and `W(F_p) → W(k)`
is injective on coordinates. (Lipnowski–Tsimerman 2018, §3, the Dieudonné-module setup, p. 6
(arXiv:1511.02212v1): the setting that uses the lemma: Dieudonné modules of abelian varieties over
`F_q` with coefficients `O = W(F_q)`; the lemma itself is a standard fact derived here.)

*Needs:* Mathlib `WittVector`; Mathlib `WittVector.frobenius`; Mathlib `WittVector.map`.

**Checks.**

- `wittFrobeniusFixed_Fp2`: `k = F_{p²}: W(k) = ℤ_{p²}` and its `F`-fixed ring is `ℤ_p`.
- `wittFrobeniusFixed_disconnected`: connectedness matters. For the disconnected ring `A = k × k` the
  Frobenius-fixed Witt vectors are `W(F_p × F_p) = ℤ_p × ℤ_p`, strictly larger than `ι(ℤ_p)`. (A ring
  with nilpotents such as `k[ε]` does not break the statement: `x^p = x` forces `x ∈ F_p` in a connected
  ring of characteristic `p`.)
- `wittFrobeniusFixed_Fp2`: over `F_{p²}`, the Frobenius-fixed Witt vectors are exactly
  the `p`-adic constants, and there are Witt vectors not fixed by Frobenius.
- `wittFrobeniusFixed_Fp`: for `k = F_p` every Witt vector is fixed (Mathlib's
  `WittVector.frobenius_zmodp`), and `ι` is the identity of `ℤ_p`.

### R07.2.19 The characteristic polynomial of a `σ`-conjugation-invariant matrix descends to `ℤ_p`

Prove `exists_padic_charpoly`. Let `k` be a perfect field of characteristic `p, W = W(k), L = W[1/p]`
and `σ` the Witt Frobenius. If `T ∈ M_n(W)` and `B ∈ GL_n(L)` satisfy `T = B σ(T) B^{−1}` in `M_n(L)`, there
is a unique monic `P ∈ ℤ_p[X]` of degree `n` with `ι_k(P) = charpoly_W(T)`. Applied to the linear
Frobenius `F^a` of a Dieudonné module over `F_{p^a}` (`F` is `σ`-semilinear and `σ^a = 1`, so `F^a`
is `W(F_{p^a})`-linear),
the characteristic polynomial of `F^a` has `ℤ_p` coefficients (it is the characteristic polynomial of
the `q`-Frobenius of an abelian variety over `F_q, q = p^a`).

The case `n = 0` gives `P = 1`.

*Proof sketch.* `charpoly(T) = charpoly(BσT B^{−1}) = charpoly(σT) = σ(charpoly T)`, so each
coefficient of `charpoly(T) ∈ W[X]` is `σ`-fixed. By §R07.2.18 each coefficient is `ι_k` of a unique
`p`-adic integer; monic of degree `n` is preserved. (Lipnowski–Tsimerman 2018, §2, end, and §3, p. 6
(arXiv:1511.02212v1): over `F_{p^r}` the characteristic polynomial of Frobenius is the norm of a
twisted conjugacy class in `GL_{2g}(ℚ_{p^r})`, and §3 works with `⟨F, V⟩`-stable lattices in the
Dieudonné module; the `ℤ_p`-integrality of the characteristic polynomial is derived here.)

*Needs:* §R07.2.18; Mathlib `Matrix.charpoly`.

**Checks.**

- `charpolyDescent_rankOne`: `n = 1, T = (t)` with `t = bσ(t)b^{−1} = σ(t): t ∈ ℤ_p`
  and `charpoly(T) = X − t`, the image of its `p`-adic polynomial.
- `charpolyDescent_zero`: the empty matrix has characteristic polynomial `1`, which descends as `1`.
- `charpolyDescent_needs_conjugation`: without the conjugation hypothesis, `T = (ζ)` with `ζ ∈ W(F_{p²})` a primitive `(p² − 1)`-th root of unity has `charpoly X − ζ ∉ ℤ_p[X]`.
- For the constant group `ℚ_p/ℤ_p` over `F_{p²}`, `F = σ` is not Witt-linear,
  while `F² = 1` is Witt-linear and has characteristic polynomial `X − 1`.

### R07.2.20 The covariant Dieudonné module and the comparison of conventions

Construct `covariantModule`. Let `k` be a perfect field of characteristic `p` and `G` a `p`-divisible group
over `k` with `M = M(G) = D(G)_{W(k)}` in §R07.2.10's contravariant crystalline normalization.
Put `M_cov(G) = M(G^D) ≅ M^t = Hom_W(M,W)`, with ordinary `W`-scalars and
`F^t(f) = σ∘f∘V, V^t(f) = σ^{−1}∘f∘F`. The Hodge sequence for `G^D` gives an ordinary
`k`-linear isomorphism `q_G : Q_G = M^t/V^tM^t → Lie(G)`; equivalently `Q_G ≅ (VM/pM)^∨` by the
Cartier pairing. Write `H_G = Hom_k(M/FM,k)`. There is a natural `σ_k`-semilinear bijection

`Ψ_G : Q_G → H_G,     Ψ_G([f])([x]) = σ(f(Vx)) mod p`.

Thus `σ_k^*Q_G ≅ H_G` and `σ_k^*Lie(G) ≅ H_G`. These statements use the scalar convention
`1 ⊗ cℓ = c^p ⊗ ℓ` in `σ_k^*L = k ⊗_{k,σ_k} L`. For a homomorphism `u : G → H`, put
`T = M(u) : M(H) → M(G)`. The naturality square is
`Ψ_H ∘ T^t = (T mod F)^∨ ∘ Ψ_G`, while `q_H ∘ T^t = Lie(u) ∘ q_G`.
Here `T^t` is induced by ordinary precomposition and the horizontal `Ψ` maps are `σ_k`-semilinear.
For a perfect extension `i : k → K`, the base-change identifications of `Q, H` and Lie intertwine
`q` and the linearized `Ψ`; on representatives `Ψ_K([b ⊗ f])([1 ⊗ x]) = σ_K(b) i(Ψ_k([f])([x]))`. This specifies the base-change square, including its scalar map.

`M_cov` has rank the height of `G`. Its slopes are `1` minus the contravariant ones;
with `φ = p^{−1}F` they lie in `[−1,0]`, with `ℚ_p/ℤ_p` of slope `0` and `μ_{p^∞}` of slope `−1`.
Over `F_p` the separate linear-dual realization `D^lin(G) = Hom_{ℤ_p}(M(G),ℤ_p)`,
with `F_D(f) = f∘F` and `V_D(f) = f∘V`, exchanges `F` and `V` relative to `M_cov`.

*Construction.* Cartier duality and contravariance of `M` give covariance and the displayed
ordinary dual. For the classical/crystalline adapter, on a length-`n` covector with terminal
index zero, Witt scalars act on its first coordinate by `σ^{1−n}(ξ)`. Replacing this action by
`σ^{−n}(ξ)`, as in §R07.2.4, gives its `σ_W` pullback, `W ⊗_{W,σ_W} (−)`.
Thus the BBM comparison `σ_W^*Hom(G,CW) ≅ D(G)_{W(k)}` is ordinary `W`-linear on the
carrier `M(G)` specified here. Pass through finite levels to the inverse limit of §R07.2.10.
The Hodge sequence is `0 → ω_G = VM/pM → M/pM → Lie(G^D) → 0`; its Cartier-dual
quotient gives `q_G : M(G^D)/VM(G^D) ≅ Lie(G)`. The evaluation pairing identifies this
quotient with `(VM/pM)^∨`. The map `V : M/FM → VM/pM` is a
`σ_k^{−1}`-semilinear bijection: it is surjective, and `Vx ∈ pM = VFM` iff `x ∈ FM`,
since `V` is injective on `M`. Dualize this map with the displayed `σ` to obtain `Ψ`.
`VF = p` makes `Ψ` vanish on `FM`; replacing `f` by `f + V^t g` changes `σ(f(Vx))` by `p g(x)`.
For `c ∈ k, Ψ(c[f]) = c^p Ψ([f])`. Precomposition and `TV = VT` give the naturality square;
`σ_K ∘ i = i ∘ σ_k` gives its base-change counterpart. The `μ` and constant normalizations follow
from §R07.2.12. (Yu 2026, §2.1, Theorem 3 and the dual formulas, pp. 2–3;
Pink 2005, §23, Proposition 23.1 and §28, Proposition 28.4, with scalar transport;
Berthelot–Breen–Messing, Theorem 4.2.14, as stated in
[Panny–Robert–Sferlazza, Appendix B](https://www.math.u-bordeaux.fr/~damienrobert/pro/publications/articles/lifting_traces.pdf),
p. 36: the `σ_W` pullback of the covector realization;
de Jong 1995, Propositions 2.5.2 and 2.5.5, pp. 27–28: Verschiebung image and Hodge filtration;
AbelianSchemesAndArithmeticModuli §A4.CR.7.2, *Dieudonné variance and Tate twists* and
*Grothendieck–Messing deformation theory*, for Cartier duality and the Hodge quotient;
Caraiani–Scholze 2017, §4.1, after Proposition 4.1.2 and Example 4.1.3, p. 691:
the normalization `φ = p^{−1}F`.)

The API:

- `covariantModule`: `M_cov(G) = M(G^D)`, covariant in `G`.
- `covariantModule_equiv_dual`: `M_cov(G) ≅ M(G)^t` with `F = σ∘(−)∘V` and `V = σ^{−1}∘(−)∘F`.
- `covariantModule_lie`: The ordinary `k`-linear Hodge quotient `q_G : M_cov(G)/V ≅ Lie(G)`,
  and the `σ_k`-semilinear `Ψ_G` above, with their naturality and perfect-field base-change squares.
  The algebraic prototypes use `DieudonneModule.dual`, `DieudonneModule.imageV` and
  `DieudonneModule.frobeniusCokernelDual` for `M^t, V^tM^t` and `H_G`;
  `DieudonneModule.lieScalarMap` is the explicit additive map
  `[f] ↦ (x ↦ constantCoeff (σ(f(Vx))))`, defined on every Dieudonné module.
  `DieudonneModule.lieScalarMap_bijective` gives bijectivity for finite free modules;
  `DieudonneModule.lieScalarMap_apply`, `DieudonneModule.lieScalarMap_smul` and
  `DieudonneModule.lieScalarMap_naturality` give its value, scalar transport and the square
  without a freeness hypothesis.
- `covariantModule_rank`: `rank_W M_cov(G) =` height `G`.
- `covariantModule_slope`: Covariant slope `= 1 −` contravariant slope; with `φ = p^{−1}F` the slopes
  lie in `[−1, 0]`.
- `linearDualModule`: Over `F_p: D^lin(G) = Hom_{ℤ_p}(M(G), ℤ_p)` with `F_D = F^T, V_D = V^T`.

*Needs:* §R07.2.10; §R07.1.7; §R07.2.12; §R07.2.11; §R07.2.16;
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (Cartier pairing and Hodge exact sequence).

**Checks.**

- `covariantModule_mu`: `M_cov(μ_{p^∞}) = (W, F = σ)` and `M_cov(ℚ_p/ℤ_p) = (W, F = pσ)`.
- `covariantModule_lie_mu`: `dim_k M_cov(μ_{p^∞})/V = 1 = dim` Lie `μ_{p^∞}`, and `0` for `ℚ_p/ℤ_p`.
- `linearDual_ne_covariant`: For `G = μ_{p^∞}` over `F_p, D^lin(G)` has `F_D = p` (transpose of `F = p`)
  while `M_cov(G)` has `F = 1`: the two realisations differ by exchanging `F` and `V`.
- `DieudonneModule.lieScalarComparison_Fp2`: over `F_{p²}`, let `M = We₁ ⊕ We₂` with
  `Fe₁ = Ve₁ = e₂` and `Fe₂ = Ve₂ = pe₁`. For `a ∉ F_p` and `α = [a]`, the automorphism
  `Te₁ = αe₁, Te₂ = σ(α)e₂` commutes with `F` and `V`. On `H_G` it acts by `a`; on `Q_G` it acts
  by `a^p`. The `σ_k`-semilinear `Ψ` sends the class of `f₂` to the functional `e₁ ↦ 1` and
  intertwines these actions since `(a^p)^p = a`. No ordinary `k`-linear intertwiner exists.
  `DieudonneModule.lieScalarComparison_F9` specializes to `p = 3, a² = −1`, with actions `a` and `−a`.
- After `F_{p²} ↪ F̄_p`, the same bases and automorphism retain the actions `a` and `a^p`.
  For `b ∈ F̄_p, Ψ(b[f₂])([e₁]) = b^p`, so the base-change square uses `σ_{F̄_p}(b)`.
- `covariantModule_zero`: Height `0` gives the zero module.
- `covariantModule_supersingular`: for `E` supersingular over `F̄_p, M_cov(E[p^∞]) ≅ M(E[p^∞])` (`E[p^∞]`
  is self-dual), with `dim M_cov/VM_cov = 1 = dim` Lie `E`.

**Covariant crystalline evaluation over semiperfect bases.** Construct
`covariantCrystalEvaluation`. Let `R` be a semiperfect `F_p`-algebra and `G` a `p`-divisible group
over `R`. Put `D_cov(G) := D_contra(G^D)`, using the contravariant crystal of
AbelianSchemesAndArithmeticModuli §A4.CR.7.2. A map `G→H` gives `D_cov(G)→D_cov(H)`,
compatibly with composition, base change and evaluation on PD thickenings. Form `A=A_cris(R)`
as the `p`-adically completed, base-compatible PD envelope of `W(lim_Φ R)→R`, and `B=A[1/p]`.
Construct `σ_A` by extending Witt Frobenius through the envelope and its completion.
Define the integral evaluation `M_A(G)=lim_n D_cov(G)_{A/p^n}`; prove that it is finite
projective of rank height `G`, with linearized maps `F:σ_A^*M_A→M_A` and
`V:M_A→σ_A^*M_A` satisfying `FV=p` and `VF=p` on their respective domains. These statements
use Frobenius pullback and do not assume that `σ_A` is an automorphism.

Cartier duality gives a perfect pairing `D_contra(G)⊗D_cov(G)→𝟙(−1)`, where the
rank-one target has `F=pσ` and `V=σ⁻¹` over a perfect field. Specify its compatibility
with `F` and `V`: the linearization of `F` on the target carries the pulled-back pairing
to the pairing of the two `F`-images, and `F` and `V` are interchanged by duality.
Thus `D_cov(G)≅D_contra(G)^∨(−1)`. On `M_B(G)=M_A(G)[1/p]` define the normalized
semilinear Frobenius `φ_G` by the linearization `p⁻¹F`. After this normalization the
rational Cartier pairing is the untwisted dual pairing with `D_contra(G)[1/p]`.
The integral evaluation retains its original `F` and `V`; `φ_G` is rational and is not
required to preserve `M_A(G)`. Prove that evaluation at `W(k)` for a perfect field `k`
is `covariantModule`, including its `F, V`, Cartier pairing and `φ_G=p⁻¹F`.

*Construction and source:* compose Cartier duality with the supplied crystal and its
evaluation/base-change maps, pass through the finite PD thickenings and use the completed
coefficient evaluation of CrystallineCohomology §CR.7.1. Use the universal PD envelope
of DerivedDeRhamCohomology §§PD.6–PD.7 for `A`. Scholze–Weinstein 2013,
Introduction, Remark 1.0.1, p. 3, §4.1, Proposition 4.1.3 and the following evaluation
formulas, pp. 29–30 (arXiv `v2`), give the integral evaluation; Caraiani–Scholze 2017,
§4.1, after Proposition 4.1.2, footnote `18` and Example 4.1.3, p. 691,
give the rational normalization.
*Needs:* §R07.1.7 (Cartier duality); §R07.2.10;
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (contravariant crystal and Cartier pairing);
CrystallineCohomology §CR.7.1 (completed finite projective coefficient evaluation);
DerivedDeRhamCohomology §§PD.6–PD.7 (universal and completed PD envelopes).

**Checks.**

- Over `F_p, G=ℚ_p/ℤ_p` has `M_A=ℤ_p, F=p` and `V=1`; on `M_B=ℚ_p` the normalized
  `φ_G=1` has fixed line `ℚ_p`, equal to `G̃(F_p)`.
- Over `F_p, G=μ_{p^∞}` has `M_A=ℤ_p, F=1` and `V=p`; `φ_G=p⁻¹` has no nonzero
  fixed vector in `ℚ_p`, equal to `G̃(F_p)=0`. Here `φ_G` does not preserve `M_A`.
- The Cartier pairing between these two integral evaluations takes values in the
  line with `F=p`, not the unit `F=1` line; after rational normalization it identifies
  `M_B(G)` with the ordinary dual of `D_contra(G)[1/p]`.
- Over every perfect `k, A_cris(k)=W(k)` and evaluation recovers `covariantModule`
  with its naturality and perfect-field base-change maps.

### R07.2.21 The Hasse invariant of a `BT₁` and the Hasse–Witt map

Define `hasseInvariant` and the Hasse–Witt map `hasseWitt`. Let `S` be an `F_p`-scheme and `G` a `BT₁` over
`S` (AbelianSchemesAndArithmeticModuli §A4.5a) with conormal sheaf `ω_G` along the unit section,
locally free of rank `d = dim G`. The
Verschiebung `V : G^{(p)} → G` has differential `V* : ω_G → ω_G^{(p)} = ω_G ⊗_{O_S,Frob} O_S`, the
Hasse–Witt map, and the Hasse invariant is `Ha(G) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)})`. `G` is
ordinary at `s ∈ S` iff `Ha(G)` is invertible near `s`. Fargues: there is a canonical functorial
isomorphism `LF : (det ω_G)^{⊗(p−1)} ≅ (det ω_{G^D})^{⊗(p−1)}` with `LF(Ha(G)) = Ha(G^D)`; for a
principally quasi-polarised group with `p > 2` the compatibility with `LF` is §R07.2.23. The `BT₁`
Hodge–Tate sequence `0 → ker F → G →HT ω_{G^D} →(F − V*_{G^D}) ω_{G^D}^{(p)}`
is exact.

Here `ω_G = e*Ω¹_{G/S}` and `V` is the Verschiebung of §R07.1.1 over a base of characteristic `p`.

*Construction.* Define `V*` as the map on conormal sheaves induced by `V` and take determinants;
`det(ω^{(p)}) = (det ω)^{⊗p}` gives the line bundle `(det ω)^{⊗(p−1)}`. Ordinarity: `V*` is an
isomorphism exactly where `G` has no biconnected part, i.e. where the multiplicative rank is `d`
(§R07.2.2). `LF` and `LF(Ha(G)) = Ha(G^D)`: Fargues, La filtration canonique, §2.2.3, Proposition 2, as
quoted by Pilloni (Proposition 6.3.1.1). Hodge–Tate sequence: `HT` sends a point `x` of `G` to the pullback of the
invariant differential through the Cartier pairing; exactness is Fargues §2.1.2 as quoted by Pilloni
(proof of Lemma 6.3.3.2). (Pilloni 2020, §6.3.1, Proposition 6.3.1.1 and Lemma 6.3.1.1, p. 30: `ha(G) = det V*`, Fargues' isomorphism `LF` with `LF(Ha(G)) = Ha(G^D)`, and the quasi-polarised compatibility;
Pilloni 2020, §6.3.3, proof of Lemma 6.3.3.2, p. 32: the Hodge–Tate exact sequence `0 → ker F → G → ω_{G^D} → ω_{G^D}^{(p)}` (citing Fargues §2.1.2).)

The API:

- `hasseWitt`: `V* : ω_G → ω_G^{(p)}`, the differential of Verschiebung.
- `hasseInvariant`: `Ha(G) = det V* ∈ H⁰(S, (det ω_G)^{⊗(p−1)})`.
- `hasseInvariant_baseChange`: `Ha` commutes with base change `S′ → S`.
- `isUnit_hasseInvariant_iff_ordinary`: `Ha(G)` is invertible at `s` iff `G_s` is ordinary.
- `farguesLF`: `LF : (det ω_G)^{p−1} ≅ (det ω_{G^D})^{p−1}` with `LF(Ha(G)) = Ha(G^D)`.
- `hodgeTateMap_exact`: `0 → ker F → G → ω_{G^D} → ω_{G^D}^{(p)}` is exact, the last map `F − V*_{G^D}`.

*Needs:* AbelianSchemesAndArithmeticModuli §A4.5a (`TruncatedBT`); §R07.1.1; §R07.2.2;
§R07.1.7.

**Checks.**

- `hasseInvariant_mu`: `Ha(μ_p)` is a unit and `Ha(ℤ/p) = 1`.
- `hasseInvariant_supersingular`: For `E/F̄_p` supersingular, `Ha(E[p]) = 0`; for `E` ordinary it is
  nonzero.
- `hasseInvariant_weight`: `Ha` is a section of `(det ω)^{⊗(p−1)}`, not of `det ω`: a definition taking
  `det` of `V : ω^{(p)} → ω` (the wrong direction) gives a section of `(det ω)^{⊗(1−p)}` and fails the
  ordinary criterion's base-change law.
- `hasseInvariant_dual`: For every isomorphism `λ : G ≅ G^D`, functoriality gives
  `λ*(Ha(G^D)) = Ha(G)`.

### R07.2.22 The Hasse–Witt maps of a `BT₁` and of its dual: the exact sequence of complexes

Prove `bt1HasseWittDuality`. Let `S` be an `F_p`-scheme, `G` a `BT₁` over `S` and `𝓔 = D(G)_S` the evaluation on
`S` of the contravariant crystalline Dieudonné crystal (AbelianSchemesAndArithmeticModuli §A4.CR.7.2), locally free with
Hodge filtration `0 → ω_G → 𝓔 → ω_{G^D}^∨ → 0`. The linearised `F* : 𝓔^{(p)} → 𝓔` and `V* : 𝓔 → 𝓔^{(p)}`
satisfy `ker F* = ω_G^{(p)} = im V*` and `ker V* = im F*`, so the complex `(ω_{G^D}^∨)^{(p)} →F* 𝓔 →V* ω_G^{(p)}` is exact, and the rows `[ω_G →V*_G ω_G^{(p)}], [(ω_{G^D}^∨)^{(p)} → 𝓔 → ω_G^{(p)}], [(ω_{G^D}^∨)^{(p)} →F* ω_{G^D}^∨]` form a short exact sequence of complexes in which `F*` on
`ω_{G^D}^∨` is the dual of `V*_{G^D}`. The long exact sequence compares the kernel and cokernel of `V*_G`
with those of the
transpose of `V*_{G^D}`. On geometric fibres the maps have equal coranks: their kernel
and cokernel dimensions agree, and
`rank(V*_G) − rank(V*_{G^D}) = dim G − dim G^D`. On loci where the kernels and cokernels
are locally free, this gives `ker V*_G ≅ (coker V*_{G^D})^∨` and
`coker V*_G ≅ (ker V*_{G^D})^∨`. Ranks agree only when `dim G = dim G^D`.

For a `BT₁` `G`, `D(G)` is defined from a resolution `0 → G → H → H′ → 0` by Barsotti–Tate groups
(Raynaud's embedding, §R07.1.40) as the cokernel of `D(H′) → D(H)` for the crystal of
AbelianSchemesAndArithmeticModuli §A4.CR.7.2, independently of the resolution (Berthelot–Breen–Messing); this
extension of the crystal to truncated groups is part of this target. Its local freeness for a `BT₁`
and the exactness of `F*, V*` hold after base change to perfect fields and hence on `S` (Cais–Lau,
(2.4.2)).

*Proof sketch.* Over a perfect field the claims are Dieudonné-module linear algebra: for `M = M(G)`
killed by `p, ker F = im V` and `ker V = im F` (§R07.2.8; AbelianSchemesAndArithmeticModuli §A4.5a). Over `S`, the complex `𝓔 → 𝓔^{(p)} → 𝓔` of locally free modules is exact because it is exact at all perfect points and its images are
locally free (Cais–Lau, discussion of (2.4.2)). Identify `F*` on the quotient `ω_{G^D}^∨` with the dual
of `V*_{G^D}` through Cartier duality `D(G^D) ≅ D(G)^∨(−1)` (CR.`7`, variance and twists). The long exact
cohomology sequence of a short exact sequence of complexes with exact middle term identifies the
cohomology of the top and bottom rows (Pilloni, Lemma 6.3.3.1, proof; the exactness of the middle
row is used there without being stated). (Pilloni 2020, §6.3.3, Lemma 6.3.3.1 and its proof, pp.
31–32: the short exact sequence of complexes relating `V*_G` and `V*_{G^D}` (after Fargues, p. 915),
stated by Pilloni for a `BT₁` of height `4` and dimension `2` over a normal reduced base; the construction
of the sequence is general; Cais–Lau 2017, §2.4, (2.4.2), Definition 2.4.1 and Proposition 2.4.3,
pp. 10–11 (arXiv:1412.3174v2): exactness of the `F`–`V` complex of a Dieudonné crystal by reduction to
perfect fields; the Hodge filtration and its compatibility with duality.)

*Needs:* §R07.2.21; §R07.1.40; §R07.2.8; §R07.1.10;
AbelianSchemesAndArithmeticModuli §A4.5a (`TruncatedBT`) and §A4.CR.7.2 (the crystalline
Dieudonné crystal, variance and Tate twists).

**Checks.**

- `bt1HasseWittDuality_muP`: `G = μ_p: ω_G` of rank `1` with `V*` an isomorphism; `G^D = ℤ/p` with `ω = 0`;
  both `V*` have zero kernel and cokernel.
- `bt1HasseWittDuality_alphaP`: without the exactness of the middle row the long exact sequence does
  not identify the two Hasse–Witt maps; for a non-`BT₁` group such as `α_p` the middle row is not exact.
- For `G = μ_p × (ℤ/p)², dim G = 1` and `dim G^D = 2`; both Hasse–Witt maps
  are invertible, with ranks `1` and `2` and corank `0`. Equality of rank is not the duality invariant.

### R07.2.23 Smoothness of the stacks of truncated Barsotti–Tate groups

Prove `btStackSmooth`. For `n ≥ 1` and `h ≥ 0`, the stack `BT_n^h` of truncated Barsotti–Tate groups of
level `n` and height `h` is a smooth algebraic stack over `ℤ`, and the truncation `BT_n^h → BT_{n−1}^h, G ↦ G[p^{n−1}]`, is smooth. Over `F_p`, the stack of quasi-polarised `BT₁` (`λ : G ≅ G^D` with `λ^D = −λ`) of
height `2g` is smooth and its ordinary locus is dense, under the hypothesis `p > 2`.
For this clause a principal quasi-polarisation is an alternating perfect pairing on the
Dieudonné module; for `p > 2` this agrees with `λ^D = −λ`. The smoothness and density clause
is not asserted for dyadic skew self-dual objects without alternation.

Prove `farguesLF_quasiPolarisation` for `p > 2`: the composite of `λ*` and `LF` on
`(det ω_{G^D})^{⊗(p−1)}` is the identity. It is the identity on the ordinary locus by
functoriality and extends over this smooth stack by its density (Pilloni 2020, §6.3.1,
Lemma 6.3.1.1 and proof, p. 30).

Smoothness of `BT_n^h` is Illusie's theorem (*Déformations de groupes de Barsotti–Tate*, Astérisque
`127`, Théorème 4.4), and smoothness of the truncation maps is due to Wedhorn and Lau; both are part
of this target. Grothendieck–Messing deformation theory is AbelianSchemesAndArithmeticModuli §A4.CR.7.2.

*Proof sketch.* Deformations of a `BT_n` along a square-zero thickening are unobstructed (Illusie,
Théorème 4.4: the obstruction to deforming a truncated Barsotti–Tate group lies in a group that
vanishes for `BT_n`, computed with the coLie complex of §R07.1.11), which gives formal smoothness;
algebraicity of `BT_n^h` is the algebraicity theorem for the stack of truncated Barsotti–Tate
groups cited below, applied to the supplied finite locally free carrier. In a parameter space,
the BT exactness conditions involve open rank conditions as well as equations. The truncation map
is smooth because a `BT_{n−1}` lifts to a `BT_n`
locally (Illusie; Anschütz–Le Bras use both facts in Lemma 4.6.6). The quasi-polarised statement is
quoted by Pilloni from Illusie (Lemma 6.3.1.1, proof); density of the ordinary locus is checked on
the versal deformation, where the Hasse invariant is a nonzero function (§R07.2.21). (Anschütz–Le
Bras 2023, §4.6, proof of Lemma 4.6.6, p. 62 (arXiv `v4`): `BT_n^h` is a smooth Artin stack and `BT_n^h → BT_{n−1}^h` is smooth (citing Illusie Thm 4.4 and Wedhorn §2); Pilloni 2020, §6.3.1, proof of Lemma
6.3.1.1, p. 30: the stack of quasi-polarised `BT₁` is smooth with dense ordinary locus (citing
Illusie, Astérisque `127`).)

*Needs:* §R07.2.21; §R07.1.10; §R07.1.11; AbelianSchemesAndArithmeticModuli §A4.5a
(`TruncatedBT`) and §A4.CR.7.2 (Grothendieck–Messing deformation theory).

**Checks.**

- `btStackSmooth_elliptic`: for an elliptic curve `E` over the ordinary locus, `E[p]` gives a point of
  `BT₁²`; the map from the moduli of elliptic curves to `BT₁²` is smooth (Serre–Tate with
  Grothendieck–Messing) and the ordinary locus is dense, as the theorem predicts.
- Over `R=𝔽₂[t]`, the Hopf algebra `R[x]/(x²)` with
  `Δx=x⊗1+1⊗x+t x⊗x` has BT₁ locus `D(t)`: there `1+tx` identifies the group with `μ₂`,
  while at `t=0` it is `α₂` with `F=V=0`. Thus the BT condition is not closed.
- `btStackSmooth_needs_bt`: the stack of all finite locally free groups of order `p²` is not smooth
  (`α_p × α_p` and its deformations); the `BT` condition is what makes the stack smooth.
- At `p = 2`, take `M = F₂²` with `Fe₁ = Ve₁ = e₂` and `Fe₂ = Ve₂ = 0`, paired by
  `B = [[1,1],[1,0]]`. This is perfect and satisfies skew self-duality, but `B(e₁,e₁) = 1`:
  it is not alternating. Ordinary such self-dual objects are alternating, so they cannot
  be dense in the stack defined using skew self-duality alone.
- For `p > 2` and `G = μ_p^g × (ℤ/p)^g` with its standard alternating pairing,
  `LF ∘ λ*` is the identity on the ordinary point.

### R07.2.24 Lifting `p`-divisible groups along a henselian pair

Prove `henselianLiftingPDivisible`. Let `(C, J)` be a henselian pair and `Ḡ` a `p`-divisible group over
`C/J`. Then there is a `p`-divisible group `G` over `C` with `G ⊗_C C/J ≅ Ḡ`. The input is that the stack
`BT_n^h` of truncated Barsotti–Tate groups of level `n` and height `h` is a smooth algebraic stack over `ℤ`
and the truncation `BT_n^h → BT_{n−1}^h` is smooth.

Here `J` lies in the Jacobson radical of `C` and Hensel's lemma holds for étale `C`-algebras; the
smoothness statements are §R07.2.23.

*Proof sketch.* By the smoothness of `BT_n^h → BT_{n−1}^h` and SchemeAndStackFoundations §0.14
`henselian_smooth_lifting`
(Stacks Tag 0H74: a smooth-algebra section lifts along any henselian pair), lift
`Ḡ[p^n]` inductively to compatible `BT_n`'s `H_n` over `C`. `G = colim H_n` is a `p`-divisible group lifting `Ḡ`
(Anschütz–Le Bras, Lemma 4.6.6, proof). (Anschütz–Le Bras 2023, §4.6, Lemma 4.6.6 and its proof, pp.
62–63 (arXiv `v4`; published Lemma 4.70): lifting along henselian pairs through the smooth stacks
`BT_n^h` and Elkik's theorem.)

*Needs:* AbelianSchemesAndArithmeticModuli §A4.5a (`TruncatedBT`); §R07.1.6; §R07.2.23;
SchemeAndStackFoundations §0.14
`henselian_smooth_lifting` (Stacks Tag 0H74).

**Checks.**

- `henselianLifting_Zp`: `C = ℤ_p, J = (p)`: every `p`-divisible group over `F_p` lifts to `ℤ_p` (for
  instance a supersingular `E[p^∞]` to the `p`-divisible group of a lift of `E`).
- `henselianLifting_not_unique`: the lift is not unique (deformations form a smooth formal moduli
  space of dimension `dim G · dim G^D`).
- The trivial height-zero group lifts to the trivial group for every henselian pair;
  smooth-section lifting requires no noetherian hypothesis.

### R07.2.25 The Tate module sheaf and the universal cover of a `p`-divisible group

Construct `BarsottiTate.universalCover` and `BarsottiTate.tateSheaf`. Let `R` be a `p`-adically complete
`ℤ_p`-algebra and `Nilp_R^op` the opposite of the category of `R`-algebras on which `p` is nilpotent. View a
`p`-divisible group `G` over `R` as the fpqc sheaf `S ↦ colim_n G`[p^n](S). Its Tate module sheaf is `T_pG(S) = lim_n G`[p^n](S) and its universal cover is `G̃(S) = lim_{p : G → G} G(S)`; `T_pG` is a sheaf of
`ℤ_p`-modules, `G̃ = T_pG[1/p]` a sheaf of `ℚ_p`-vector spaces, `T_pG = Hom(ℚ_p/ℤ_p, G)` and `G̃ = Hom(ℚ_p/ℤ_p, G)[1/p]`, and `0 → T_pG → G̃ → G → 0` is exact. Moreover (Messing, Scholze–Weinstein): `(1)`
if `G` is connected it is representable by an affine formal scheme with finitely generated ideal of
definition, and `G ≅ Spf R[[x₁, …, x_r]]` when Lie `G` is free of rank `r`; `(2)` an isogeny `ρ : G₁ → G₂`
induces an isomorphism `G̃₁ ≅ G̃₂`; `(3)` if `R` is perfect of characteristic `p, G` connected and Lie `G`
free of rank `r`, then `G̃ ≅ Spf R[[x₁^{1/p^∞}, …, x_r^{1/p^∞}]]` and `T_pG ≅ Spec R[[x_i^{1/p^∞}]]/(x₁, …, x_r)`.

`R p`-adically complete; `G̃` is representable by a formal scheme when `G` is isogenous to an extension of
an étale by a connected `p`-divisible group (Scholze–Weinstein 3.1.3(iii)). Over a
mixed-characteristic DVR, compare with §R07.1.8 through the finite-level point functors on
all `R`-algebras: the affine inverse-limit scheme `T_alg(G) = lim_n G[p^n]` represents
`A ↦ lim_n G[p^n](A)` and restricts to `T_pG` on `Nilp_R^op`. Properness at each finite level gives
`T_alg(G)(O_{K̄}) = lim_n G[p^n](K̄)`, the Galois Tate module of §R07.1.8.
Here `O_{K̄}` is an `R`-algebra on which `p` is not nilpotent.

Write `underline(M)` for the ordinary constant fpqc sheaf of the discrete group `M`.
The coefficient sheaves for the étale example are
`ℤ_p,cont = lim_n underline(ℤ/p^n)` and `ℚ_p,cont = ℤ_p,cont[1/p]`, with the limit and
localization taken in fpqc sheaves. They differ from `underline(ℤ_p)` and `underline(ℚ_p)`.

*Construction.* Define `T_pG` and `G̃` as limits of the sheaves `G[p^n]` and `G` along `p`; `G̃(S) = lim_p G(S)`
is uniquely `p`-divisible, hence a `ℚ_p`-space. `Hom(ℚ_p/ℤ_p, G) = lim_n Hom(p^{−n}ℤ/ℤ, G) = lim_n G[p^n] = T_pG`; inverting `p` gives `G̃`. Exactness of `0 → T_pG → G̃ → G → 0`: projection to the last coordinate;
its kernel is `T_pG`, and it is surjective because multiplication by `p` is an epimorphism of fpqc
sheaves (§R07.1.5). `(1)` is Messing's representability of connected `p`-divisible groups as formal Lie
groups (§R07.1.13 over complete local bases); `(2)` and `(3)` are Scholze–Weinstein 3.1.3(i),(iii):
`p`-power multiplication is an isomorphism on `G̃`, and over a perfect base Frobenius identifies `lim_p G`
with `lim_F G^{(p^{−n})}`. (Caraiani–Scholze 2017, §4.1, Definition 4.1.1 and Proposition 4.1.2 with
proof, pp. 690–691 (arXiv `v1`, pp. 37–38): `T_pG, G̃`, their descriptions as `Hom(ℚ_p/ℤ_p, G)(⊗ℚ)`, and
the representability statements `(1)`–`(4)`; Scholze–Weinstein 2013, §3.1, Lemma 3.1.2 and Proposition
3.1.3, p. 22; §3.3, Proposition 3.3.1, p. 26 (arXiv `v2`): representability of `Ĝ` (Lemma 3.1.2),
isogeny invariance and the perfect-base description of `G̃` (Proposition 3.1.3(i),(iii)), and
representability of `T(G)` by an affine scheme flat over `R` (Proposition 3.3.1). The exact sequence `0 → T_pG → G̃ → G → 0` is not stated there; it follows from `p` being an epimorphism of fpqc sheaves
(§R07.1.5).)

For the étale example, Scholze–Weinstein §4.4, immediately after Lemma 4.4.1, identifies the
coordinate ring of `T(ℚ_p/ℤ_p)` with `C_lc(ℤ_p,R)`. The ordinary constant group scheme is the
disjoint union indexed by its discrete group (Stacks Tag 03YW).

The API:

- `BarsottiTate.tateSheaf`: `T_pG` as an fpqc sheaf of `ℤ_p`-modules on `Nilp_R^op`.
- `BarsottiTate.universalCover`: `G̃ = lim_p G` as an fpqc sheaf of `ℚ_p`-vector spaces.
- `BarsottiTate.universalCover_eq_hom`: `G̃ = Hom(ℚ_p/ℤ_p, G)[1/p]`.
- `BarsottiTate.tateSheaf_exact`: `0 → T_pG → G̃ → G → 0` is exact.
- `BarsottiTate.universalCover_isogeny`: An isogeny induces an isomorphism of universal covers.
- `BarsottiTate.universalCover_perfect`: Over perfect `R`, connected `G` with free Lie `G` of rank `r: G̃ ≅ Spf R[[x_i^{1/p^∞}]]`.

*Needs:* §R07.1.6; §R07.1.5; §R07.1.13; §R07.1.8; §R07.1.12.

**Checks.**

- `BarsottiTate.universalCover_etale`: For `G = ℚ_p/ℤ_p`, identify
  `T_pG ≅ ℤ_p,cont` and `G̃ ≅ ℚ_p,cont`.
- Over `R=𝔽_p`, take `A=C_lc(ℤ_p,𝔽_p)`, so `Spec A ≅ ℤ_p`. The compatible sections
  `f_n(x)=x mod p^n` define the identity map in `T_p(ℚ_p/ℤ_p)(A)` and its image in `G̃(A)`.
  This section has infinite image. Sections of the ordinary constant sheaves on this
  quasi-compact affine have finite image, so neither ordinary constant sheaf gives this section.
- `BarsottiTate.universalCover_mu`: For `G = μ_{p^∞}` over a perfect `F_p`-algebra `R, G̃ ≅ Spf R[[x^{1/p^∞}]]`.
- `BarsottiTate.universalCover_not_colim`: The direct limit of `G` along multiplication by `p` is not
  `G̃`: for `G = ℚ_p/ℤ_p` it is again a torsion sheaf with no map onto `G` whose kernel is `ℤ_p,cont`; a
  definition using colimits instead of the inverse limit fails the exact sequence `0 → T_pG → G̃ → G → 0`.
- `BarsottiTate.universalCover_zero`: Height `0` gives `G̃ = 0`.

### R07.2.26 Rigidity of `p`-divisible groups up to isogeny and of universal covers along nilpotent thickenings

Prove `universalCoverRigidity`. Let `S → R` be a surjection of rings with nilpotent kernel (`p`
nilpotent in `S`). Then reduction is an equivalence between the categories of `p`-divisible groups over
`S` up to isogeny and over `R` up to isogeny. For a `p`-divisible group `G` over `R` the universal cover `G̃`
lifts canonically to a sheaf `G̃_S` over `S` with `G̃_S(S) = G̃(R)`; in particular, for a `p`-adically
complete ring `A, S ∈ Nilp_A` and `G` over `S, G̃(S) = G̃(S/p)`. Consequently, for `X` over `F̄_p`, a
quasi-isogeny `X ×_{F̄_p} S/p → G ×_S S/p` induces `X̃_S ≅ G̃` over `S`, and `Aut(X̃)(S) = Aut(X̃)(S/p)`.

Here "up to isogeny" means after `⊗ ℚ` on `Hom` groups.

*Proof sketch.* Full faithfulness up to isogeny: if the kernel `I` satisfies `I^N = 0` and `p` is
nilpotent, a fixed power of `p` kills both the obstruction to lifting a homomorphism and the
difference of two lifts (Drinfeld's rigidity, as used by Scholze–Weinstein); essential surjectivity:
`p`-divisible groups lift along nilpotent thickenings (§R07.2.24, or Grothendieck–Messing,
AbelianSchemesAndArithmeticModuli §A4.CR.7.2). `G̃(R) = Hom_R(ℚ_p/ℤ_p, G)[1/p]`, so the statement for `G̃` is the
equivalence up to isogeny applied to homomorphisms with source `ℚ_p/ℤ_p` (Scholze–Weinstein,
Proposition 3.1.3(ii), proof). For `S ∈ Nilp_A, S → S/p` has nilpotent kernel; apply the previous
step. (Scholze–Weinstein 2013, §3.1, Proposition 3.1.3(ii) and Remark 3.1.4, p. 22 (arXiv `v2`):
equivalence up to isogeny along nilpotent surjections, the canonical lift of `G̃` and `G̃_S(S) = G̃(R)`;
Caraiani–Scholze 2017, §4.1, proof of Proposition 4.1.2 (p. 691); §4.2, the Rapoport–Zink set-up
before Definition 4.2.1 and the proof of Lemma 4.2.10 (pp. 699, `704`): the uses: `X̃_b ≅ G̃` through a
quasi-isogeny `mod p`, and `Aut(X̃_b)(R) = Aut(X̃_b)(R/p)`.)

*Needs:* §R07.2.25; §R07.2.24; AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (Grothendieck–Messing deformation
theory).

**Checks.**

- `universalCoverRigidity_dual_numbers`: `S = F_p[ε]/ε² → R = F_p`: for `G = ℚ_p/ℤ_p, G̃(S) = ℚ_p = G̃(F_p)`; for `G = μ_{p^∞}, G̃(S) = G̃(F_p) = 0` although `μ_{p^∞}(S) ⊇ 1 + εF_p` is nonzero.
- `universalCoverRigidity_integral`: the statement is false integrally: `Hom(G, H)` over `S` need not
  equal `Hom` over `R` (deformations of an ordinary elliptic curve have different integral
  endomorphisms), only after `⊗ℚ`.

### R07.2.27 de Jong: the crystalline Dieudonné functor over smooth bases and finitely generated fields

The analytic descent used for reduced singular bases has the following local targets.
Fix a complete discrete valuation ring `O`, uniformizer `π`, residue field `k` and
fraction field `K`. Write `FS_O` for locally Noetherian adic formal schemes over
`Spf O` whose reductions are locally of finite type over `k` (de Jong 1995,
Definition 7.0.1, p.74). Their Berthelot generic fibre is the discrete-valuation
specialization of AdicSpacesPartIII R2.9's `FormalScheme.FSC` and `rigOfFSC`,
including quotients of restricted power-series rings with formal variables.

**Crystalline morphisms on tubes (`deJongCrystalTubeRealization`).** In mixed
characteristic `(0,p)`, let `k` have a finite `p`-basis and let `(O,σ)` be a Cohen
lift with `π = p` and Frobenius lift. Let a reduced affine finite-type `k`-scheme
`S` be embedded in a formally smooth lift `𝔜 = Spf B` as in de Jong §5.2, with
`𝔜_red = S` and ideal of definition `I`; fix a lift of Frobenius on `B`.
For lifted `p`-divisible groups `H₁,H₂` on `𝔜`, write `G_i = H_i|_S`, and
let `M_i = D(H_i)_𝔜` denote the completed crystal evaluations. Every crystalline map `α : D(G₂) → D(G₁)` induces a
`K`-linear analytic map `α_an : M₂^rig → M₁^rig` on `𝔜^rig`.
Construct its first restriction through the completed PD-envelope map
`D_I(B) → B₁`, `x^[n] ↦ x^n/n!`, where
`B_n = (B[I^n/p])^∧_p` and `V_n = Sp(B_n[1/p])`.
Extend to `⋃ V_n = 𝔜^rig` using
`α_(n+1) = p⁻¹ F₁ σ*(α_n) V₂` and `σ(V_(n+1)) ⊆ V_n`.
The map agrees with crystal evaluation on PD test objects, is horizontal,
commutes with `F,V`, is functorial and independent of the Frobenius lift under
the crystalline pullback identifications. Its value at a rigid point agrees
with the rational crystalline evaluation of the lifted special-fibre map.
Source: de Jong 1995, §5.3, equations (5.3.2)–(5.3.7), pp.54–55, and
§5.4.1, equation (5.4.1.6), pp.56–57.

*Needs:* DerivedDeRhamCohomology §§PD.1–PD.7 (completed PD envelopes);
CrystallineCohomology §§CR.1.2–CR.1.3 (crystals and their connections);
AbelianSchemesAndArithmeticModuli §A4.CR.7.2; AdicSpacesPartIII R2.9.

**Checks.**

- The identity crystalline map realizes to the identity, and composition of
  crystalline maps agrees with composition of their analytic realizations.
- On `Spf O`, the constant and multiplicative groups have `F = σ` and
  `F = pσ` respectively; the recurrence gives the same map on every `V_n`.
- On `Spf ℤ_p⟦t⟧`, the lifts `σ(t) = t^p` and `σ'(t) = t^p+pt`
  give the same analytic realization after the crystal's Taylor comparison.
  The matrix of an evaluation in a chosen basis need not be unchanged.

**Bounded analytic functions recover formal functions (`deJongBoundedFormalFunctions`).**
For any `O`-flat, formally normal `𝔛 ∈ FS_O`, the natural map
`Γ(𝔛,O_𝔛) → Γ(𝔛^rig,O^{≤1})` is an isomorphism, where the right side consists
of analytic functions of absolute value at most one at every rigid point.
Require compatibility with restriction to formal opens. Applying this locally
to matrix entries gives descent of analytic maps of finite locally free modules
whose entries are integral in formal trivializations. Use the Artin–Rees
construction of the auxiliary maps `β_n : B_n → B/I^(n−c)` in the 1998 erratum;
the erroneous generation assertion of the original Lemma 7.1.13.1 is not an input.
Source: de Jong 1995, Theorem 7.4.1, pp.90–91; de Jong 1998, p.175.

*Needs:* AdicSpacesPartIII R2.9; SchemeAndStackFoundations §4.8
(Noetherian completion); Mathlib's Artin–Rees theorem.

**Checks.**

- For `𝔛 = Spf O`, the map is `O ≅ {a ∈ K : |a| ≤ 1}`.
- For `𝔛 = Spf O⟦t⟧` with the `(π,t)`-adic topology, the bounded functions
  on the open unit disc are `O⟦t⟧`, including `Σ_(n≥0) t^n`; the restricted
  power-series algebra would omit this function.
- For the nonnormal flat ring `A = O⟨πt,t²⟩ ⊂ O⟨t⟩`, the generic fibre is
  the closed unit disc. Its bounded function `t` is integral over `A` and
  absent from `A`, so formal normality cannot be omitted.
- For `Spf(O/π)`, the generic fibre is empty and the map is not injective;
  flatness is necessary.

**Rigid descent and the formal lifting locus (`deJongFormalLiftingLocus`).**
Let `𝔜 ∈ FS_O`, let `T ⊆ 𝔜_red` be closed, put `U = 𝔜_red ∖ T`, and write
`𝔜_T` for the completion along `T` and `𝔜_U` for the open formal part.
Given `O`-flat closed formal subschemes `𝔃_T ⊆ 𝔜_T`, `𝔃_U ⊆ 𝔜_U` and a
closed analytic subspace `Z ⊆ 𝔜^rig` with
`𝔃_T^rig = Z ∩ ]T[` and `𝔃_U^rig = Z ∩ ]U[` as closed analytic subspaces,
construct the `O`-flat closed formal subscheme `𝔃 ⊆ 𝔜` with these restrictions
and generic fibre `Z`. The equalities include the defining ideals, not just
point sets. Use the erratum's `β_n` in this descent too.

In the simultaneous versal situation of §5.2 (the two Kodaira–Spencer maps
jointly surjective), an isomorphism `α : D(G₂) ≅ D(G₁)` gives the closed
analytic locus `Z` of §§5.4–5.7 on which the special-fibre isomorphism at a
rigid point lifts integrally. Prove that this locus descends to a formally
smooth `𝔃/Spf O` with `𝔃_red = S`. Induction on the reduced closed singular
part and full faithfulness on the regular complement give `𝔃_T,𝔃_U` above.
Their integral maps bound the coefficients of `α_an|_Z` by one; the preceding
target descends them to a horizontal `F,V`-compatible map preserving the Hodge
filtrations. The formally smooth classification and Grothendieck–Messing then
give `H₁|_𝔃 → H₂|_𝔃`. Include the dyadic lifting argument of §5.7.8(a).
On `S`, the difference between its crystal and `α` is `p`-power torsion:
the PD-to-tube map detects crystalline morphisms modulo torsion (§5.5).
General morphisms reduce to isomorphisms by the upper-triangular map on a
product, as in §5.2. Source: de Jong 1995, Proposition 7.5.2, pp.91–94;
§5.4.3 and §§5.5–5.8, pp.58–67; de Jong 1998, p.175.

*Needs:* The two preceding local targets; §§R07.1.6, R07.2.10 and the
formally smooth classification in this section; AdicSpacesPartIII R2.9;
SchemeAndStackFoundations §4.8; AbelianSchemesAndArithmeticModuli §A4.CR.7.2.
The formally smooth classification precedes this descent and does not use it.

**Checks.**

- For `T = ∅`, descent recovers `𝔃_U`; for `T = 𝔜_red` it recovers `𝔃_T`.
- In `𝔜 = Spf O⟨x,y⟩` and `T = V(x) ⊆ 𝔜_red`, the restrictions of
  the flat closed locus `y = 0` descend to that same locus, with its ideal.
  The disjoint tubes `]T[` and `]U[` need not be an admissible covering;
  ordinary sheaf gluing on an admissible cover is insufficient.
- For constant étale `H₁ = H₂` and `α = id`, the lifting locus is all of `𝔜` and
  the recovered map is the identity, including at `p = 2`.
- For a constant ordinary group on the reduced singular curve
  `Spec k[x,y]/(xy)`, a constant diagonal endomorphism descends across the
  node. This curve is a local complete intersection, so the crystalline error
  is zero; general reduced bases retain the torsion clause.

Prove `deJongDieudonneEquivalence`. Let `𝔛` be a formal scheme of characteristic `p`, formally smooth
over `F_p`, whose reduction is locally of finite type over a field with a finite `p`-basis. Then the
crystalline Dieudonné functor `G ↦ D(G)` (AbelianSchemesAndArithmeticModuli §A4.CR.7.2) is an anti-equivalence from
`p`-divisible groups over `𝔛` to Dieudonné crystals over `𝔛` (de Jong's Main Theorem 1); in particular
over a regular scheme of finite type over such a field, and over a field `E` finitely generated over
`F_p`. If `S` is reduced of finite type over a field with a finite `p`-basis, `Hom(D(G₂), D(G₁)) =`
(torsion) `⊕ D(Hom(G₁, G₂))`, so `D` is fully faithful up to isogeny, and fully faithful when `S` is a
local complete intersection (Main Theorem 2). For an abelian scheme `f : A → X` over a smooth base,
`R¹f_{crys*}O_{A,crys}` is the Dieudonné crystal of `A[p^∞]` (Berthelot–Breen–Messing 2.5.6(ii)) and,
where `A[p^∞]` has an étale quotient (constant `p`-rank, for instance over a field), its unit-root part
is the Dieudonné crystal of `A[p^∞]^{et}`.

Characteristic `p`; a field with a finite `p`-basis is one with `[k : k^p] < ∞` (for instance a finitely
generated extension of a perfect field). The identification of `R¹f_crys* O` with `D(A[p^∞])` uses
the relative crystalline cohomology of CrystallineCohomology §CR.7.3.

*Proof sketch.* Full faithfulness over formally smooth bases with a `p`-basis: Berthelot–Messing,
transferred to formal schemes (de Jong, Chapter `2`). Essential surjectivity: induction on dimension,
using deformations of Dieudonné crystals and of `p`-divisible groups (de Jong, Chapter `3`, with
Grothendieck–Messing, AbelianSchemesAndArithmeticModuli §A4.CR.7.2) and the field case (Chapter `4`).
For Main Theorem 2, apply `deJongCrystalTubeRealization`,
`deJongFormalLiftingLocus` and `deJongBoundedFormalFunctions` to lift the analytic
map over the singular part and regular complement to a group homomorphism,
with crystalline error killed by a power of `p`. Over a local complete
intersection the crystalline Hom has no torsion, giving integral full faithfulness.
The abelian-scheme statement: BBM 2.5.6(ii); the unit-root part is the slope-zero
sub-`F`-crystal, which is `D` of the étale quotient because `D` is exact and sends étale groups to
unit-root crystals (`D`'Addezio, proof of Theorem 5.1.6). (de Jong 1995, Introduction, Main Theorems `1`
and `2`, pp. 6–7; §2.3, Definition 2.3.2 and paragraph 2.3.3, p. 21: the equivalence over formally
smooth formal schemes with a finite `p`-basis and full faithfulness up to isogeny over reduced schemes
of finite type; `D`'Addezio 2023, §5.1, proof of Theorem 5.1.6, p. 25; §5.2, proof of Theorem 5.2.2,
p. 26 (arXiv:2012.12879v4): `R¹f_crys O_A = D(A[p^∞])` (BBM 2.5.6(ii)), its unit-root part, and the
use of de Jong's full faithfulness for an abelian variety over a finitely generated field.)

*Needs:* §R07.2.10; AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (the crystalline Dieudonné crystal);
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (Grothendieck–Messing deformation theory); CrystallineCohomology
§CR.7.3 (relative crystalline direct images); the three local analytic-descent
targets of this section.

The general convergent-coefficient categories belong to
PadicDifferentialEquationsAndRigidCohomology RD.3.33–RD.3.36; they are not inputs
to this restricted construction.

**Checks.**

- `deJong_finite_field`: over a finite field `E = F_q: D` is the classical Dieudonné module
  (§R07.2.10), and full faithfulness recovers `End(G)` for `G` over `F_q`.
- `deJong_idempotent`: for `A` over a field `E` finitely generated over `F_p`, an idempotent
  of `End(D(A[p^∞]))` comes from `End(A[p^∞])` by crystalline full faithfulness.
- `deJong_zero`: the zero `p`-divisible group gives the zero crystal, whose only endomorphism
  and idempotent is zero; the equivalence preserves it.

### R07.2.28 Scholze–Weinstein: Dieudonné theory over `f`-semiperfect rings

Let `R` be an `f`-semiperfect ring (a semiperfect ring of characteristic `p` such that `lim_Φ R`
has a finitely generated ideal of definition, e.g. a quotient of a perfect ring by a
finitely generated ideal, such as `O_C/p`). Use the two evaluations of
§R07.2.20's `covariantCrystalEvaluation`, with `A=A_cris(R), B=B⁺_cris(R)=A[1/p]`.
Prove the following distinct `Hom` comparisons, natural in `G` and `H`:

- `swDieudonneSemiperfect`: the rational functor `G↦M_B(G)` from `p`-divisible groups
  up to isogeny to finite projective `B`-modules with linearized `F` and `V` is fully faithful:
  `Hom_R(G,H)⊗_{ℤ_p}ℚ_p ≅ Hom_{B,F,V}(M_B(G),M_B(H))`.
- `swDieudonneIntegral`: if `R=S/J` with `S` perfect and `J` generated by a finite regular
  sequence, the integral functor `G↦M_A(G)` is fully faithful:
  `Hom_R(G,H) ≅ Hom_{A,F,V}(M_A(G),M_A(H))`. Here `A` is `p`-torsion-free, so `M_A(G)`
  embeds as a distinguished `A`-lattice in `M_B(G)`; equivalently the right side consists
  of rational `F,V`-morphisms carrying `M_A(G)` into `M_A(H)`.

For `G,G′` over a perfect field `k` and an `f`-semiperfect `k`-algebra `R`, put
`K₀=W(k)[1/p]` and `D_G=M_{W(k)}(G)[1/p]`. Base change gives
`Hom_R(G_R,G′_R)[1/p] ≅ (Hom_{K₀}(D_G,D_{G′})⊗_{K₀}B⁺_cris(R))^{φ=1}`,
and `H̃(R) ≅ (D_H⊗_{K₀}B⁺_cris(R))^{φ_H=1}` for every `p`-divisible group `H` over `k`.
Here `φ_G=p⁻¹F` on the rational covariant module, extended with the ring Frobenius;
the internal `Hom` has `φ(f)=φ_{G′}∘f∘φ_G⁻¹` before scalar extension. The integral
`Hom` comparison retains `M_A` and its `F,V`, rather than only this normalized rational module.

*Proof sketch.* Reduce to `R = S/J` with `S` perfect, by invariance under isogenies of semiperfect rings
(Scholze–Weinstein, Proposition 4.1.5). Compare homomorphisms with their Dieudonné modules on the
universal cover: `G̃(R) = Hom(ℚ_p/ℤ_p, G)[1/p]` (§R07.2.25) is identified with the `F = p` part,
equivalently the normalized `φ = 1` part, of the rational covariant module
(Scholze–Weinstein §§4.2–4.4). For the integral comparison, Proposition 4.1.11 gives
`p`-torsion-freeness and Corollary 4.1.12 proves that divisibility of a crystalline
homomorphism by `p` implies divisibility of the group homomorphism by `p`.
The consequence for `G, G′` over `k` uses base change
of the crystalline modules and full faithfulness: take the `φ`-fixed part of the linear
`Hom` module `Hom(D(G)[1/p], D(G′)[1/p]) ⊗ B⁺_cris(R)`. The universal-cover formula is
applied only to actual `p`-divisible groups `H` (Caraiani–Scholze, proof of Lemma 4.1.8).
(Scholze–Weinstein 2013, Introduction, Theorem A, p. 3; §4.1, Definition/Proposition 4.1.2,
Proposition 4.1.3 and Theorem 4.1.4, pp. 29–30 (arXiv `v2`): `f`-semiperfect rings and `A_cris(R)`
(Definition/Proposition 4.1.2, Proposition 4.1.3); full faithfulness up to isogeny (Theorem 4.1.4)
and integrally for quotients of perfect rings by regular ideals (Theorem A;
§4.1, Proposition 4.1.11 and Corollary 4.1.12, pp. 33–34); Caraiani–Scholze 2017,
§4.1, proof of Lemma 4.1.8, p. 695: the formulas for `Hom_R(G, G′)[1/p]` and `H̃(R)` in terms of
`B⁺_cris(R)`.)

*Needs:* §R07.2.25; §R07.2.10; §R07.2.20 (`covariantCrystalEvaluation`, including
the integral `A_cris` evaluation, Cartier pairing and normalized rational Frobenius).

**Checks.**

- `swDieudonne_perfect`: `R = k` perfect: `A_cris(k) = W(k)` and the theorem is the classical full
  faithfulness into `W(k)`-modules integrally and `W(k)[1/p]`-modules up to isogeny (§R07.2.10).
- Over `R=F_p, G=ℚ_p/ℤ_p` has `End_R(G)=ℤ_p=End_{A,F,V}(M_A(G))`, whereas
  `End_{B,F,V}(M_B(G))=ℚ_p`. The endomorphism `p⁻¹id` exists only rationally and
  does not preserve `M_A(G)=ℤ_p`.
- Over `R=F_p, H=μ_{p^∞}` has `φ_H=p⁻¹`, so `M_B(H)^{φ_H=1}=0=H̃(F_p)`;
  for `H=ℚ_p/ℤ_p, φ_H=1` and the fixed space is `ℚ_p`. Using bare `F=1` for
  `μ_{p^∞}` would incorrectly give a nonzero fixed space.
- `swDieudonne_mu`: for `H = μ_{p^∞}` and `R = O_C/p`: the covariant `D(μ_{p^∞}) = L` with `φ = p^{−1}σ`
  gives `H̃(R) = B⁺_cris(R)^{φ = p}`, the period module of the cyclotomic character.
- For `G = G′ = μ_{p^∞}` over a perfect field, `Hom(G,G′) = ℤ_p` and its rational
  `Hom` space is `ℚ_p`; `ℤ_p` is not a `p`-divisible group. The Frobenius-invariant linear
  `Hom` module gives the rational formula without a `p`-divisible internal `Hom`.

### R07.2.28a Witt covectors and their Dieudonné operators

Construct `wittCovectors` over a perfect `F_p`-algebra `A`. For an `A`-algebra `B, CW_A(B)`
consists of sequences `(x_i)_{i≤0}` whose sufficiently far negative tail generates a
nilpotent ideal: there exist `r ≥ 0` and `s ≥ 1` with `(x_i : i ≤ −r)^s = 0`. Define addition
by the stabilized Witt addition polynomials. This is an fpqc sheaf of abelian groups,
with Berthelot's standard `W(A)`-action: a Teichmüller scalar `[a]` acts by
`([a]x)_i = a^{p^i}x_i` for `i ≤ 0`, using inverse Frobenius on the perfect base `A`.
Thus its first coordinate on `W_n` has scalar action `σ_A^{1−n}`. Its coordinate
Frobenius is `F(x)_i = x_i^p`, with Verschiebung
`V(x)_i = x_{i−1}`, and `FV = VF = p` with the Dieudonné semilinearity relations.
Construct its finite-length inclusions from `W_n` along Verschiebung, its nilpotent-tail
subfunctors `CW_{r,s}`, and restriction/base-change along perfect `A → A′`. On arbitrary
`A`-algebras the full covector sheaf is used; `CW` is not asserted to be a group scheme.
Also supply the shifted covectors `CW₋₁`, indexed by `i ≤ −1`, with the filtration and
convergent evaluation maps on `Ā/pĀ` used in Fontaine–Laffaille §9.12–§9.13.

*Construction.* Witt addition stabilizes because the negative tails are nilpotent.
The subfunctors `CW_{r,s}` are representable as functors of sets; they give the fpqc
sheaf and the convergent `W(A)`-action. The shift and coordinate `p`-th powers give `FV = p`.
Use these same coordinate polynomials for base change and for the shifted realization.
(Berthelot 1980, §1.1, formulas (1.1.1)–(1.1.6), pp. 227–230: `CW`, sheaf property,
operators and `W(A)`-action; Fontaine–Laffaille 1982, §9.12–§9.13, pp. 605–606: `CW₋₁`
and its period realization.)

*Needs:* §R07.2.4; §R07.2.5; Mathlib `WittVector` and `TruncatedWittVector`.

**Checks.**

- On `F_p, CW(F_p) ≅ ℚ_p/ℤ_p`, with `F = 1` and `V = p`; the finite-length inclusions
  realize `p^{-n}ℤ_p/ℤ_p` and their union.
- For `B = F_p[ε]/ε²`, the sequence `x_i = ε` for every `i ≤ 0` is a covector.
  It has a nilpotent tail without finite support, so finite-length vectors alone do not give `CW`.
- On `F_{p²}, F` acts nontrivially on the length-one covector of `a ∉ F_p`, while `V`
  kills that covector and `FV = VF = p` kills it. This distinguishes `F` from `V`.

### R07.2.29 Berthelot: Dieudonné theory over perfect valuation rings

**Modules of constant fibre length.** For a perfect integral domain `A` of characteristic `p`
whose localisations are fields or valuation rings, define `BerthelotConstantLength(A,M)` for
a `W(A)`-module `M`: it is finitely generated, killed by a power of `p`, and the finite lengths
of `M ⊗_{W(A)} W(κ(𝔭))` are equal for every `𝔭 ∈ Spec A`. Prove finite presentation,
vanishing of `Tor₁` with `W(κ(𝔭))`, and compatibility with localization and the dual
`Hom_{W(A)}(M,W(A)[1/p]/W(A))`. For nonzero `M` the projective dimension is one;
zero is also admitted. This fibre length is distinct from the global Module.length.
(Berthelot 1980, §3.1, Corollaries 3.1.2–3.1.3 and the following definition, p. 247;
Proposition 3.1.4, pp. 247–248: duality.)

*Needs:* §R07.2.5; Mathlib `WittVector`, `Module.Finite` and `Module.length`.

**Checks.**

- For `A = k` a perfect field, the fibre length is the ordinary finite `W(k)`-module length.
- For a nonfield perfect valuation ring `V, M(μ_p) = V = W(V)/p` has fibre length one
  at every prime but infinite global Module.length: powers of a nonzero nonunit give
  arbitrarily long chains of `W(V)`-submodules.
- Zero has constant fibre length zero; an infinite direct sum of `W(A)/p` is excluded
  by finite generation and infinite fibre length.

Prove `berthelotPerfectValuationRings`. Let `A` be a perfect integral domain of characteristic `p` whose
localisations are fields or valuation rings (for instance a perfect valuation ring). With `CW` the
standard Witt covectors of §R07.2.28a and `D_A = W(A)[F, V]/(FV − p, VF − p)`
(semilinear relations), define `berthelotCovectorModule` by `M_B(G) = Hom(G,CW)`.
Define `berthelotCrystallineModule`, the local normalization, by

`M(G) = σ_A^*M_B(G) = W(A) ⊗_{W(A),σ_A} M_B(G),   1 ⊗ cm = σ_A(c) ⊗ m`.

On this pullback put `F(a ⊗ m) = σ_A(a) ⊗ Fm` and
`V(a ⊗ m) = σ_A^{−1}(a) ⊗ Vm`; morphisms act by `1 ⊗ M_B(u)`.
Both `M_B` and `M` are anti-equivalences (the inverse for `M` first applies `σ_A^{−1*}`,
then Berthelot's `M ↦ G_M`) from finite locally free commutative
`p`-torsion group schemes over `A` to left `D_A`-modules satisfying `BerthelotConstantLength(A,M)`, and from
`p`-divisible groups over `A` to left `D_A`-modules that are locally free of finite rank over `Spf W(A)`;
`M(G)` has rank the height of `G`. In particular the Dieudonné functor over a perfect valuation ring `V`
is fully faithful, and a homomorphism of `p`-divisible groups over `Frac V` extends to `V` iff its
Dieudonné module does.

Transport exactness, Cartier duality, localization and perfect-base change along `σ_A^*`.
For duality use the natural identification `σ_A^*Hom(M_B,T_A) ≅ Hom(σ_A^*M_B,T_A)`,
where `T_A = W(A)[1/p]/W(A)` for finite groups and `T_A = W(A)` for `p`-divisible groups;
the target-line identification is `a ⊗ t ↦ aσ_A(t)`. It intertwines the dual `F/V` operators.
For every perfect `A → A′`, the square comparing scalar extension of `M` with `M(G_{A′})`
commutes with `1 ⊗ M_B(u), F` and `V`, since `σ_{A′}` commutes with the base map.
Over a perfect field `k`, the resulting natural `W(k)`-linear comparison is
`M(G) = σ_k^*M_B(G) ≅ M_classical(G)` of §§R07.2.8–R07.2.10, with the
crystalline comparison of §R07.2.20. The native `M_B` is related by this scalar pullback.

`A` perfect of characteristic `p`, integral, with local rings fields or valuation rings; the extension
to all perfect rings (Gabber, Lau) is not part of this target.

*Proof sketch.* First use the native realization `M_B`. Finite groups:
`G → G_{M_B(G)}` is an isomorphism over a field (classical covector theory);
both native functors commute with localisation, so reduce to a valuation ring and conclude by
Nakayama and a rank count (Berthelot, Théorème 3.4.1, proof). Exactness of `M ↦ G_M` on short exact
sequences of modules of constant length (Corollaire 3.4.2). `p`-divisible groups: pass to the limit
over `G[p^n]`, using that `M_B(G₁)` is torsion-free over `A` hence locally free of rank `h`
(Corollaire 3.4.3, proof). Since `σ_A` is an automorphism, scalar pullback is an exact
autoequivalence preserving constant fibre length, finite local freeness and the duality pairing.
It gives the stated normalization and field comparison. (Berthelot 1980, §3.4,
Théorème 3.4.1, p. 251; Corollaires 3.4.2–3.4.3, pp. 252–253: the
anti-equivalences for finite `p`-torsion groups and `p`-divisible groups over perfect domains whose
local rings are fields or valuation rings; Caraiani–Scholze 2017, §4.2, proof of Lemma 4.2.16, pp.
710–711: full faithfulness over perfect valuation rings used to extend homomorphisms.)

*Needs:* `BerthelotConstantLength` and its finite-presentation/localization API above;
§R07.2.28a `wittCovectors`; §R07.2.8; §R07.2.10; §R07.2.20 (the crystalline scalar
comparison); §R07.2.5; Mathlib `WittVector`.

**Checks.**

- `berthelot_field`: `A = k` perfect field: `σ_k^*M_B` recovers the classical crystalline
  normalization with `M(ℚ_p/ℤ_p) = (W(k), F = σ)` and `M(μ_{p^∞}) = (W(k), F = pσ)`.
- Over `k = F_{p²}`, for `G = α_p` and `u : x ↦ ax` with `a ∉ F_p`, precomposition
  acts by a on `M_B(G)` and by `a^p` on `M(G)`. An ordinary `k`-linear natural
  identification of these two unshifted functors would force `a = a^p`; the scalar
  pullback in `berthelot_field` is necessary.
- `berthelot_extension`: as used in Caraiani–Scholze, Lemma 4.2.16: for an isocrystal `D` over `F̄_p`
  and a perfect valuation ring `V` with fraction field `K, (D ⊗ W(V)[1/p])^{φ=1} = (D ⊗ W(K)[1/p])^{φ=1}`, which by full faithfulness extends homomorphisms from `K` to `V`.
- For `G = 0, M_B(G) = 0` and `σ_A^*M_B(G) = 0`; the field case and the valuation-ring
  case both send the trivial group to the zero Dieudonné module.


### Examples

- `M(ℚ_p/ℤ_p) = W(k)` with `F = σ`, `V = pσ^{−1}` (slope `0`); `M(μ_{p^∞}) = W(k)` with `F = pσ`, `V = σ^{−1}` (slope `1`); `M(α_p) = k` with `F = V = 0`.
- For an ordinary elliptic curve over `k = k̄`, `M(E[p^∞]) ≅ M(μ_{p^∞}) ⊕ M(ℚ_p/ℤ_p)` with slopes
  `0, 1`; for a supersingular one, `M(E[p^∞]) = M_{1,1} = W[F, V]/(F − V)` with slope `1/2` and
  `a`-number `1`.
- A `BT₁` of height `2` and dimension `1` over an `F_p`-scheme has Hasse invariant a section of
  `ω^{⊗(p−1)}`; for the `p`-torsion of the Legendre curve it is the Hasse polynomial, up to a unit.

### Dependencies

Layer R07.1; DerivedDeRhamCohomology §§PD.1–PD.7;
CrystallineCohomology §§CR.4.7, CR.7.3;
AbelianSchemesAndArithmeticModuli §A4.CR.7.2; Mathlib `WittVector` with
Frobenius, Verschiebung, `WittVector.Isocrystal` and `isocrystal_classification`; Tau Ceti Cartier
duality.

## Layer R07.3: Filtered modules and Fontaine–Laffaille theory

The first three targets fix the linear algebra of `p`-adic Hodge theory used by the rest of the
roadmap: filtered `(φ, N)`-modules, their Hodge and Newton numbers, weak admissibility, and
Fontaine's theorem that the module of a semistable representation is weakly admissible, with full
faithfulness of `D_st`. PadicPeriodRings §§4.1–4.3 supply the general-base period rings
and functors; §R07.3.0 compares their finite-`K` specializations with §§R07.P2–R07.P5a. The rest of the
layer is Fontaine–Laffaille theory over `W(k)` for a perfect field `k`: the abelian categories of
torsion filtered Dieudonné modules, the ring `S` and the contravariant functor `U_S`, exactness, the
simple objects and their tame inertia, full faithfulness on the safe interval `[0, p − 2]` and the
endpoint, strongly divisible lattices and the lattice functor, the admissibility of weakly
admissible modules of filtration length `< p`, and the dictionary with finite flat group schemes
over `W(k)`.

### R07.3.0 Finite-`K` comparison of period rings and realizations

Prove `finiteKPeriodComparison`. Let `K/ℚ_p` be finite, `k` its residue field and
`K₀ = W(k)[1/p]`. Consume PadicPeriodRings §§1–4 for the completed
algebraic closure, topological period rings, structure maps, invariant functors and
period identities. Use the imported finite-`K` crystalline structures, fixed fields,
functors and rational predicates of §§R07.P2, R07.P4–R07.P5 on these same carriers.
Identify their arithmetic realization interfaces, the supplied continuous-sequence
contracts specialized in §R07.P3 and the integral coefficient predicates of §R07.P5a. Give canonical topological algebra isomorphisms on `A_inf, A_cris, B_cris⁺, B_cris, B_dR⁺` and `B_dR` and their induced natural isomorphisms on realizations.
The comparisons commute with `θ` on plus carriers, `φ`, Galois action, filtration and
continuous valued embeddings with compatible algebraic closures.

Use the supplied `B_st` and `D_st` to give the finite-`K` semistable realization interface,
with `D*_st(V) = D_st(V^∨)` and `D*_cris(V) = D_cris(V^∨)`. Retain the logarithm branch
in `B_st → B_dR` and the `p`-normalized monodromy `N_p`; for `ord_K(π) = 1`, uniformizer-normalized
monodromy is `N = e N_p, e = ord_K(p)`. Identify `D_cris(V)` with `D_st(V)^{N=0}`, and
identify the crystalline and de Rham dimension-equality predicates and comparison maps
with §§R07.P5–R07.P5a. Identity and composition of field embeddings, Tate twists,
duality and changes of logarithm branch commute with these identifications. General-`K`
uses in Layers R07.3–R07.4 consume PadicPeriodRings §§4.1–4.3; this target compares
only their finite-`K` specializations.

*Construction.* Use PadicPeriodRings §§3–4.1's canonical envelope and localization
identifications, preserving their supplied continuous structure maps. Apply the
§4.2 invariant functors to the compatible finite-dimensional tensor maps, including
the tensor flip for §R07.P5's convention. Use §4.3 for fixed fields, regularity,
rational predicates and the underlying fundamental sequence; use §R07.P3's identification
of the supplied continuous sections and boundary maps and §R07.P5a for integral predicates. (Brinon–Conrad 2009, §§4.3–4.4, pp. 49–55; §9.1, pp. 128–135;
§9.2, pp. 135–146.)

*Needs:* PadicPeriodRings §§1–4; §§R07.P2–R07.P5a.

**Checks.**

- `K = ℚ_p`: the comparison gives Mathlib's PadicComplex, BDeRhamPlus and BDeRham
  with the supplied crystalline and semistable rings and functors, preserving topology.
- `K = Frac W(F_p(t)^perf)` is a general-`K` input of PadicPeriodRings §§4.1–4.3,
  with `K₀ = K`; no finite-`K` comparison is asserted for this field.
- For `ℚ_p(1)`, covariant `D_cris` has `φ = p^{−1}σ` and jump `−1`; `D*_cris` has `φ = pσ`
  and jump `1`. The comparison preserves `g(t) = χ(g)t` and `φ(t) = pt`.

### R07.3.1 Filtered `(φ, N)`-modules

Define `FilteredPhiNModule`. Let `K` be a field of characteristic `0`, complete for a discrete
valuation, with perfect residue field `k` of characteristic `p`; let `K₀ = W(k)[1/p] ⊆ K` and let
`σ` be the Witt vector Frobenius on `K₀`. A filtered `(φ, N)`-module over `K` is a
finite-dimensional `K₀`-vector space `D` with

- a `σ`-semilinear bijection `φ : D → D` (so `(D, φ)` is an isocrystal);
- a `K₀`-linear endomorphism `N : D → D` with `N φ = p φ N`;
- a decreasing filtration `(Fil^i D_K)_{i ∈ ℤ}` of `D_K = K ⊗_{K₀} D` by `K`-subspaces, exhaustive
  (`Fil^i D_K = D_K` for `i ≪ 0`) and separated (`Fil^i D_K = 0` for `i ≫ 0`), with no condition
  linking it to `φ` or `N`.

Morphisms are `K₀`-linear maps commuting with `φ` and `N` whose `K`-linear extension preserves the
filtrations. Filtered `φ`-modules are the full subcategory with `N = 0`. The category is additive
and `ℚ_p`-linear but not abelian (a bijective morphism need not be an isomorphism: the filtration
can strictly grow). Tensor products use `φ ⊗ φ`, `N ⊗ 1 + 1 ⊗ N` and the tensor filtration; duals
use `(φ^∨ f) = σ ∘ f ∘ φ^{−1}`, `N^∨ = −N^t` and `Fil^i(D^∨_K) = (Fil^{1−i} D_K)^⊥`. The Tate twist
`D⟨r⟩` has the same `D` and `N`, Frobenius `p^{−r} φ` and `Fil^i(D⟨r⟩_K) = Fil^{i+r} D_K`; this is
the twist of CrystallineCohomology §CR.7.1, and it moves every slope and every filtration jump down
by `r`. `D` is effective when `Fil⁰ D_K = D_K`. The monodromy `N` is automatically nilpotent: `N`
maps the slope-`α` part of the isocrystal into the slope-`(α − 1)` part.

*Construction.* Everything is linear algebra over `K₀` and `K` on top of Mathlib's isocrystals;
nilpotence of `N` follows from the Dieudonné–Manin decomposition of CrystallineCohomology §CR.4.7
after extending scalars
to `W(k̄)[1/p]`, since `N φ = p φ N` shifts slopes by `−1` and only finitely many slopes occur.
(Brinon–Conrad 2009, Definition 7.3.4, p. 98: filtered `φ`-modules; Definition 8.2.5, p. 112: `(φ, N)`-modules and the category `MF^{φ,N}_K`; Lemma 8.2.8, p. 113: nilpotence of `N`; Definition 8.3.1,
p. 117: Tate twists; Kisin 2006, §1.1: the same category as the target of Kisin's contravariant
functors.)

The API:

- `FilteredPhiNModule`: the structure above, with `FilteredPhiNModule.Hom`.
- `FilteredPhiNModule.toIsocrystal`: the underlying isocrystal, an object of Mathlib's
  `WittVector.Isocrystal` after forgetting `N` and the filtration.
- `FilteredPhiNModule.unit`: `K₀` with `φ = σ`, `N = 0`, `Fil⁰ = D_K`, `Fil¹ = 0`.
- `FilteredPhiNModule.tensor`, `FilteredPhiNModule.dual`: the tensor structure above.
- `FilteredPhiNModule.twist`: `D⟨r⟩`, with `twist_zero : D⟨0⟩ = D` and `twist_add : D⟨r⟩⟨s⟩ = D⟨r + s⟩`.
- `FilteredPhiNModule.IsEffective`: `Fil⁰ D_K = D_K`.
- `FilteredPhiNModule.nilpotent_N`: `N` is nilpotent.
- `FilteredPhiNModule.subobject`: a `φ`- and `N`-stable `K₀`-subspace `D′` with the induced
  filtration `Fil^i D′_K = D′_K ∩ Fil^i D_K`; quotients carry the image filtration.

*Needs:* CrystallineCohomology §CR.4.7 (*Slope decomposition on the existing isocrystal carrier*);
Mathlib `WittVector`; Mathlib `WittVector.frobeniusEquiv`; Mathlib `WittVector.Isocrystal`;
§R07.2.15.

**Checks.**

- `FilteredPhiNModule.unit_twist`: `unit⟨−1⟩` is `K₀` with `φ = pσ` and its single filtration jump
  in degree `1`; it is the module `Hom_{G_K}(ℚ_p(1), B_cris)` of Kisin's contravariant convention
  (`φ(t) = pt` and `t ∈ Fil¹`). A twist convention with `φ ↦ p^r φ` and the same filtration shift
  would give `φ = p^{−1}σ` with the jump in degree `1`, so `t_N = −1 ≠ 1 = t_H`, which is not weakly
  admissible (§R07.3.2).
- `FilteredPhiNModule.zero`: the zero space is an object, with every structure zero; it is the zero
  object of the additive category, is effective, and has `tH = 0` because all its graded pieces vanish.
- `FilteredPhiNModule.not_abelian`: the identity of `K₀` from (`φ = σ`, jump in degree `0`) to (`φ = σ`, jump in degree `1`) is a bijective morphism that is not an isomorphism.
- `FilteredPhiNModule.N_nonzero`: `D = K₀e₀ ⊕ K₀e₁` with `φ(e₀) = e₀`, `φ(e₁) = p e₁`, `N(e₁) = e₀`,
  `N(e₀) = 0` satisfies `Nφ = pφN`; with `N(e₀) = e₁` instead the relation fails (`N φ e₀ = e₁` but
  `p φ N e₀ = p² e₁`).

### R07.3.2 Hodge and Newton numbers and weak admissibility

Define `FilteredPhiNModule.IsWeaklyAdmissible`, with the Hodge and Newton numbers
`FilteredPhiNModule.tH` and `FilteredPhiNModule.tN`. For a nonzero filtered `(φ, N)`-module `D` over
`K` (§R07.3.1):

```text
t_H(D) = Σ_i i · dim_K gr^i(D_K),        gr^i = Fil^i D_K / Fil^{i+1} D_K,
t_N(D) = v_p(det φ) = v_p(λ)   where φ(e) = λ e on the line det D = Λ^top D,
```

with `v_p(p) = 1`; `v_p(λ)` does not depend on the basis vector `e`, since changing `e` to `ce`
replaces `λ` by `σ(c) c^{−1} λ`. Both numbers are additive in short exact sequences of filtered `(φ, N)`-modules (the induced filtration on the subobject and the image filtration on the quotient) and
satisfy `t(D^∨) = −t(D)` and `t(D⟨r⟩) = t(D) − r · dim D`. `D` is **weakly admissible** if `t_H(D) = t_N(D)` and `t_H(D′) ≤ t_N(D′)` for every subobject `D′ ⊆ D` stable under `φ` and `N`, with the
induced filtration. Equivalently, the Newton polygon of every such `D′` lies on or above its Hodge
polygon, with the same endpoints for `D′ = D`.

*Construction.* The definitions are as displayed. Additivity of `t_H` is additivity of `dim gr^i` on
strict exact sequences; additivity of `t_N` is multiplicativity of determinants. The Newton and
Hodge polygon form is Fontaine's lemma comparing the two polygons; it makes weak admissibility
invariant under the unramified scalar extension `K₀ → W(k̄)[1/p]`. Weak admissibility is stable
under duality and Tate twist, and the weakly admissible objects form an abelian full subcategory,
closed under extensions, in which every morphism is strict for the filtrations. (Brinon–Conrad 2009,
Definition 8.1.1, p. 102: the Hodge polygon and `t_H`; Definition 8.1.7, p. 105: the Newton polygon
and `t_N`; Lemma 8.1.13, p. 109: the polygon form; Definition 8.2.1, p. 110, and Definition 8.2.9,
p. 114: weak admissibility without and with `N`; Proposition 8.2.2, p. 110: duality.)

The API:

- `FilteredPhiNModule.tH`, `FilteredPhiNModule.tN`: the two integers, with `tH_add`, `tN_add` on
  short exact sequences, `tH_dual`, `tN_dual` and `tH_twist`, `tN_twist`.
- `FilteredPhiNModule.IsWeaklyAdmissible`: the predicate above.
- `IsWeaklyAdmissible.dual`, `IsWeaklyAdmissible.twist`: stability under `D ↦ D^∨` and `D ↦ D⟨r⟩`.
- `IsWeaklyAdmissible.abelian`: weakly admissible modules form an abelian category, closed under
  extensions, and morphisms between them are strict.
- `isWeaklyAdmissible_iff_polygon`: the Newton–Hodge polygon form.

*Needs:* §R07.3.1; §R07.2.16.

**Checks.**

- `isWeaklyAdmissible_rankOne`: `D = K₀ e` with `φ(e) = λ e` and its filtration jump in degree `r`
  is weakly admissible exactly when `v_p(λ) = r`; so `unit` and `unit⟨−1⟩` are weakly admissible,
  and `K₀` with `φ = pσ` and jump in degree `0` is not.
- `isWeaklyAdmissible_split_vs_line`: for `K = K₀` and `D = K₀e₁ ⊕ K₀e₂` with `φ = diag(σ, pσ)`, `N = 0`: with `Fil¹ D = K₀(e₁ + e₂)` and `Fil² = 0`, `D` is weakly admissible; with `Fil¹ D = K₀e₁`
  it is not, since the subobject `K₀e₁` has `t_H = 1 > 0 = t_N`. A definition that checks only
  `t_H(D) = t_N(D)` accepts both.
- `isWeaklyAdmissible_zero`: the zero module is weakly admissible (all conditions are empty).
- `tN_basis_independent`: replacing `e` by `pe` in the rank-one example multiplies `λ` by `σ(p)/p = 1`, and replacing it by a unit `c` multiplies `λ` by the unit `σ(c)/c`; `t_N` is unchanged.

### R07.3.3 Fontaine's theorem: semistable representations give weakly admissible modules

Prove `dSt_isWeaklyAdmissible` and `dSt_fullyFaithful`. Let `K` be as in §R07.3.1 and let `D_st`,
`D_cris`, `IsSemistable` and `IsCrystalline` be the period functors and predicates of PadicPeriodRings §§4.2–4.3,
with finite `K/ℚ_p` comparisons supplied by
§R07.3.0 (covariant, `D_st(V) = (B_st ⊗_{ℚ_p} V)^{G_K}`, with
`D_cris(V) = D_st(V)^{N = 0}`), whose `B_cris` agrees on finite `K` with §R07.P2. Then:

`1`. for every semistable representation `V`, the filtered `(φ, N)`-module `D_st(V)` is weakly
   admissible (§R07.3.2); in particular `D_cris(V)` is weakly admissible for crystalline `V`;
`2`. `D_st` is fully faithful from semistable representations to filtered `(φ, N)`-modules, with
   quasi-inverse on its essential image `V_st(D) = (B_st ⊗_{K₀} D)^{φ = 1, N = 0} ∩ Fil⁰(B_dR ⊗_K D_K)`, and it is compatible with tensor products, duals and Tate twists;
`3`. call `D` **admissible** if `D ≅ D_st(V)` for a semistable `V`; then `D` is admissible exactly
   when `D` is weakly admissible and `dim_{ℚ_p} V_st(D) = dim_{K₀} D`, and for every weakly
   admissible `D` the space `V_st(D)` is finite-dimensional with `dim_{ℚ_p} V_st(D) ≤ dim_{K₀} D`.

The contravariant functors used in Layer R07.4 are `D*_st(V) = Hom_{G_K}(V, B_st) ≅ D_st(V^∨)`, and
likewise for `D*_cris`; they carry the same statements through `D ↦ D^∨`.

Prove `crisEigenvector_filtration_bound`: after completed unramified extension so that `k` is
algebraically closed, for `λ ∈ K₀^×, s ∈ ℤ` and nonzero `b ∈ B_cris` with `φ(b) = λb`
and `b ∈ Fil^s B_dR`, one has `s ≤ v_p(λ)`. This is an arithmetic consequence of the supplied
period identity. Put `n = v_p(λ)`; divide `b` by `t^n` and write `λ/p^n = σ(w)/w` for a Witt
unit `w` (Brinon–Conrad, Lemma 9.3.3), the unit-slope case of Mathlib's
`WittVector.exists_frobenius_solution_fractionRing`. If `s > n`, then `b/(t^n w)` belongs to
`(B_cris)^{φ=1} ∩ Fil¹ B_dR = 0`, by the fundamental exact sequence, a contradiction.

*Proof sketch.* `(1)` For rank-one semistable `V`, completed unramified base change makes `V` a
Tate character, whose period `t^{−n}` gives `t_H = t_N`. The same argument applies to `det V`
and hence gives equality for `D = D_st(V)`. It applies to a subobject via a subrepresentation
only for subobjects `D′ = D_st(W)`, with their induced filtration, actually realized by a
semistable `G_K`-subrepresentation `W ⊆ V` (admissible subobjects); arbitrary filtered
`(φ,N)`-subobjects are not assumed to have this form. For such an arbitrary nonzero `D′` of
rank `r`, embed `det D′` into `Λ^r D = D_st(Λ^r V)`. Monodromy is nilpotent and hence zero
on this determinant line. Expand a generator `e` in a `ℚ_p`-basis of `Λ^r V`: its period
coefficients `b_i` satisfy `N(b_i) = 0`, so `b_i ∈ B_cris, φ(b_i) = λb_i`, and
`b_i ∈ Fil^{t_H(D′)} B_dR`. Apply `crisEigenvector_filtration_bound` to any nonzero
coefficient to get `t_H(D′) ≤ v_p(λ) = t_N(D′)`. This uses no realization of `D′`.
`(2)` Regularity of `B_st` makes
the comparison map `B_st ⊗_{K₀} D_st(V) → B_st ⊗_{ℚ_p} V` an isomorphism compatible with `φ`, `N`,
the filtration and `G_K`; take `φ = 1`, `N = 0` and `Fil⁰` invariants, using `B_cris^{φ = 1} ∩ Fil⁰ B_dR = ℚ_p` (the fundamental exact sequence, §R07.P3). `(3)` The dimension bound
for weakly admissible `D` is the first half of the Colmez–Fontaine argument; the converse direction
"weakly admissible implies admissible" is the theorem proved in §R07.4.13. (Brinon–Conrad 2009,
Proposition 9.2.11, p. 144: regularity of `B_st`; Proposition 9.2.14, p. 146: full faithfulness and
the quasi-inverse; Lemma 9.3.3 and Theorem 9.3.4 with its proof, pp. 147–148:
the eigenvector filtration bound and weak admissibility; Definition 9.3.8 and Proposition
9.3.9, p. 151: admissibility and the dimension bound.)

The API:

- `crisEigenvector_filtration_bound`: the bound above for `λ ∈ K₀^×` after completed
  unramified base change to algebraically closed residue field.
- `dSt_isWeaklyAdmissible`, `dCris_isWeaklyAdmissible`: part `1`.
- `dSt_fullyFaithful`, `vSt`, `vSt_dSt`: part `2`, with `V_st` and the natural isomorphism
  `V_st(D_st(V)) ≅ V`.
- `FilteredPhiNModule.IsAdmissible`: `D ≅ D_st(V)` for some semistable `V`.
- `isAdmissible_iff`: part `3`, and `finrank_vSt_le` for weakly admissible `D`.
- `dStar`: the contravariant `D*_st` and `D*_cris`, with `dStar_eq_dual : D*_st(V) ≅ D_st(V^∨)`.

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.3.1; §R07.3.2;
PadicPeriodRings §§4.1–4.3 (`B_st`, `D_st`,
`D_cris`, semistable and crystalline representations); §R07.P2 (`bCris`) and
§R07.P3 (the fundamental exact sequence); Mathlib
`WittVector.exists_frobenius_solution_fractionRing` (Witt-unit Frobenius normalization).

**Checks.**

- `dCris_cyclotomic`: `D_cris(ℚ_p(1)) = K₀ t^{−1}` with `φ = p^{−1}σ` and its jump in degree `−1`,
  and `D*_cris(ℚ_p(1)) = K₀ f`, `f(e) = t`, with `φ = pσ` and its jump in degree `1`; both have `t_H = t_N`.
- `dSt_tate_curve`: for the Tate curve `E_q` over `K` (`v(q) > 0`), `D_st(V_p E_q)` has `N ≠ 0`; it
  is weakly admissible but not in the image of `D_cris`.
- The period `t^n` has `φ(t^n) = p^n t^n` and filtration degree `n`, for every `n ∈ ℤ`,
  attaining equality in `crisEigenvector_filtration_bound`.
- A `φ = 1` period in `Fil¹ B_dR` is zero; the nonzero hypothesis in the bound is essential.
- For `K = K₀ = ℚ_p`, take `φ = diag(1,p), N = 0, Fil⁰ D = D, Fil¹ D = ℚ_p(e₁+e₂), Fil² D = 0` as in `isWeaklyAdmissible_split_vs_line`.
  The induced-filtration subobject `D′ = ℚ_p e₂` has `t_H = 0 < 1 = t_N`.
  Thus it is not admissible and cannot be `D_st(W)` for a semistable subrepresentation,
  although `D` is weakly admissible. Its period coefficients require the inequality argument.
- `dSt_zero`: the zero representation goes to the zero module.
- `not_isAdmissible_of_not_wa`: `K₀` with `φ = pσ` and its jump in degree `0` is not the module of
  any representation, because it is not weakly admissible (§R07.3.2).

### R07.3.3a Small-weight filtered Frobenius modules

For a commutative ring `W`, an automorphism `σ` and a natural number `p`, define the generating filtered Frobenius carrier on a finite `W`-module `M`, with an exhaustive separated decreasing filtration `Fil^i M` and `σ`-semilinear maps `φ_i:Fil^i M→M` satisfying `φ_i|Fil^(i+1)=p φ_(i+1)`, with `Σ_i im φ_i=M`. For arithmetic applications take `p>2, K₀/ℚ_p` finite unramified, `W=O_K₀` and `σ` the Witt Frobenius. In the free case each filtration step is a direct summand. Restrict to a filtration-jump interval `[a,b]` of width `≤p−2`, and form morphisms preserving the filtration and all `φ_i`. The covariant realization uses Nizioł §2; translating Fontaine–Laffaille’s contravariant `Hom` realization requires a dual. For torsion exactness use the abelian enlarged category with separate filtration modules and their inclusion maps, not an assertion that the entire category of all filtered modules is abelian.

For the covariant realization `T_cov`, filtration support `[a,b]` corresponds to the
Hodge–Tate interval `[−b,−a]` in §R07.P5a. In particular `ℤ_p(1)` has Hodge–Tate
weight `+1` and its covariant crystalline filtration jump is `−1`. Define `flIntervalRealization`, written
`U_[a,b](M) = U_S(M(−a))(a)`, where the filtered twist of §R07.3.4 places `M(−a)` in
`[0,b−a]`, and the outer `(a)` is a Galois Tate twist. For finite free objects use
`lim_n U_S(M(−a)/pⁿ)(a)`. This contravariant realization has Hodge–Tate interval `[a,b]`
in the lattice case; for torsion objects this interval records the corresponding crystalline
lattice-quotient condition. Define `T_cov` as its integral linear dual, or its exact
Pontryagin dual `Hom_{ℤ_p}(−,ℚ_p/ℤ_p)` for torsion objects, with contragredient action.
Its interval is `[−b,−a]`. The raw `U_S` retains the definition of §R07.3.7 and is used
without translation only in its effective range.

Prove natural identifications of `U_[a,b]` for any two permitted intervals containing the
same support, satisfying the transitivity law on triple overlaps. Prove compatibility with
finite reductions, rationalization and §R07.3.16's translated rational functor. Direct sums,
duals and tensor products commute with realization whenever the input and resulting intervals
have width at most `p−2`; a filtered jump shift by `j` gives a Galois twist by `j`.
These comparisons use the effective-range period pairing after translating all relevant
objects; they do not identify raw `U_S(M(j))` with `U_S(M)(j)` outside that range.

The construction proceeds as follows. Define the finite module, filtration, divided Frobenius maps and morphisms on native module carriers. Embed in the category of diagrams with separate filtration modules as Fontaine–Laffaille §1.11; establish exactness on strongly divisible torsion objects. Give induced direct sums, interval restriction, allowed tensor/dual operations and the scalar-forgetting convention.

(Fontaine–Laffaille, §§0.4–0.6, pp. 549–550 (Numdam PDF pp. 4–5); §1.11, pp. 558–559; §§7.12–7.15, pp. 593–594; Nizioł, §2, pp. 750–751.)

The named operations and identities are:

- `FontaineLaffailleModule` — Finite filtered `W`-module with compatible generating divided Frobenius maps.
- `FontaineLaffailleHom` — Filtration- and Frobenius-preserving linear maps.
- `fontaineLaffaille_sum` — Direct sums and their divided Frobenius maps.
- `fontaineLaffaille_interval` — Filtration support `[a,b]`, meaning `Fil^a=M` and `Fil^{b+1}=0`;
  its covariant Hodge–Tate interval is `[−b,−a]`, and its translated `U_[a,b]` interval is `[a,b]`.
- `fontaineLaffaille_dual` — On free objects, dual filtration support is `[−b,−a]`.
  Tensoring with the rank-one filtered object of jump `j` shifts support to `[a+j,b+j]`;
  `T_cov` is twisted by `−j`, and `U_[a,b]` by `+j` (with the interval shifted). For torsion objects use the exact dual
  `Hom_{ℤ_p}(−,ℚ_p/ℤ_p)` on the representation side. Impose the small-width bound
  whenever the realization comparison is used.
- `IsFreeFontaineLaffaille` — The module is free and every filtration step has a `W`-submodule complement. `FontaineLaffailleModule` is stated for a general ring `W` with an automorphism `σ`; the arithmetic statements take `W = W(k) = 𝒪_{K₀}` with `σ` the Witt Frobenius.

**Checks.**

- `Tests.zero_interval`: the zero module with zero filtration is free with split steps in every interval.
- `Tests.unit_and_generation`: the free rank-one weight-zero object has split steps, `Fil⁰=M, Fil¹=0` and unit Frobenius; omitting generation would admit `φ₀=0`.
- For interval support, a weight-zero line lies in `[0,0]` and `[−1,1]`, but not `[1,2]`. `Tests.not_reversed_interval`: a nonzero object cannot lie in a reversed interval `a>b`; the zero object can.
- `Tests.jump_neg_one` and `Tests.jump_pos_one`: the free rank-one filtered object with jump `−1` and `φ_{−1}=σ` has `T_cov=ℤ_p(1)`
  and `U_[−1,−1]=ℤ_p(−1)`; the object with jump `+1` and `φ_1=σ` has `T_cov=ℤ_p(−1)`
  and `U_[1,1]=ℤ_p(1)`. Their reductions modulo `p^m` have the same realization formulas.
  Their filtration intervals are `[−1,−1]` and `[1,1]`, respectively.
- `Tests.identity_and_zero`: the identity and zero maps are Fontaine–Laffaille morphisms.
  `Tests.identity_not_frobenius`: between weight-zero rank-one objects over `ℤ₃` with `φ₀` multiplication by `1` and by `2`, the underlying identity preserves the filtration but does not commute with Frobenius, so it is not a morphism.
- At `p=5`, the jump-`−1` line `𝔽₅e` with `φ_{−1}(e)=e` has raw `U_S=0`:
  in the enlarged cokernel `S₁`, degree `−1` has identity inclusion and divided Frobenius
  `pΦ=0`, forcing every morphism to vanish. Its translated realization is `𝔽₅(−1)`.
- A tensor product with combined width `>p−2` is not covered by the small-weight comparison theorem.
- `Tests.free_step_ne_three` over `ℤ` at `p=3`: in the free rank-one `W`-module, the proper filtration step `pW` (`p` nonunit) is not a direct summand. A free filtered object admitting that step fails IsFreeFontaineLaffaille, even if its underlying module is free.

*Needs:* §R07.P2 (Crystalline period ring and its structures).

### R07.3.4 Fontaine–Laffaille modules

Define `FLModule`. `A` (Fontaine–Laffaille) filtered module over `W(k)` is a `W(k)`-module `M` with a
decreasing, exhaustive, separated filtration `(Fil^i M)_{i∈ℤ}` by submodules and, for each `i`, a
`σ`-semilinear map `φ^i : Fil^i M → M` such that `φ^i(x) = p·φ^{i+1}(x)` for `x ∈ Fil^{i+1} M`. `MF_tor` is
the full subcategory of objects of finite length with `Σ_i φ^i(Fil^i M) = M`; `MF_tor^{[a,b]}` requires
moreover `Fil^a M = M` and `Fil^{b+1} M = 0` (FL write `MF_tor^{f,p}` for `[0, p − 1]`).

`K = K₀ = W(k)[1/p]` with `k` perfect of characteristic `p` (absolutely unramified, `e = 1`); FL's general
`(A, τ, π)` is specialised to `A = W(k), τ = σ, π = p, E = ℚ_p, q = p`. Over a finite field `k` this
category uses the `W(k)` specialization of §R07.3.3a's `FontaineLaffailleModule`,
`FontaineLaffailleHom` and `fontaineLaffaille_interval` on finite generating objects.
The enlarged `FLModule` category also admits nongenerating objects: generation is part of
`FLModule.IsTorsion`, and the two carriers agree on that full subcategory. The covariant
realization dualizes the translated `flIntervalRealization` of §R07.3.3a, using the raw
functor of §R07.3.7 only after the input twist.

*Construction.* Definition as displayed (FL 1.2 and 0.4 with `π = p`; 1.5 for `MF_tor`; 3.2 for the
range condition). Equivalently (FL 1.4(b)) one gives the filtered module and a single `σ`-semilinear
map `φ_M` from the colimit `M̃` of the diagram of the `Fil^i M` (the inclusions and multiplication by `p`)
to `M`; for finite length, `M ∈ MF_tor` iff `φ_M` is surjective iff injective iff bijective, because
`length M̃ = length M` (FL Proposition 1.6, Lemma 1.7). (Fontaine–Laffaille 1982, §0.4, pp. 549–550:
the definition; Fontaine–Laffaille 1982, §1.5, p. 555: the torsion category.)

The API:

- `FLModule`: A `W(k)`-module with a decreasing exhaustive separated filtration and `σ`-semilinear `φ^i`
  with `φ^i|Fil^{i+1} = p φ^{i+1}`.
- `FLModule.Hom`: `W(k)`-linear maps preserving the filtrations and commuting with every `φ^i`.
- `FLModule.IsTorsion`: Finite length and `Σ φ^i(Fil^i M) = M`; equivalent to bijectivity of `φ_M : M̃ → M` (FL 1.6).
- `FLModule.weights`: The filtration-jump interval `[a, b]` with `Fil^a = M` and `Fil^{b+1} = 0`,
  giving translated `U_[a,b]` interval `[a,b]` and covariant realization interval `[−b,−a]`
  in the small-width comparison of §R07.3.3a.
- `FLModule.twist`: The shift `M(j): Fil^i M(j) = Fil^{i−j} M, φ^i_{M(j)} = φ^{i−j}_M`.

*Needs:* Mathlib `WittVector`; Mathlib `WittVector.frobeniusEquiv`; Mathlib `Module.length`;
§R07.2.5; §R07.3.3a (the general finite generating carrier, morphisms and interval API).

**Checks.**

- `FLModule.unit`: `W(k)/p` with `Fil^0 = M, Fil^1 = 0` and `φ^0 = σ` is in `MF_tor^{[0,0]}`, and its twist
  by `j` (`Fil^i = M` for `i ≤ j, Fil^{j+1} = 0, φ^j = σ`) lies in `MF_tor^{[j,j]}`.
  `FLModule.unit_isTorsionIn` verifies the nonzero weight-zero object.
- `FLModule.not_isTorsion_of_phi_eq_zero`: a nonzero filtered module all of whose `φ^i` vanish is not
  in `MF_tor`, since `Σ Im φ^i = 0 ≠ M`; for instance `W(k)/p` with `Fil^0 = M, Fil^1 = 0` and `φ^0 = 0` is a
  filtered module outside `MF_tor`.
- `FLModule.zero_isTorsionIn`: the zero module `FLModule.zero` is in every `MF_tor^{[a,b]}`.
- `FLModule.isTorsion_iff`: For finite length `M: M ∈ MF_tor` iff `φ_M` is injective (FL 1.6).

### R07.3.5 `MF_tor` is an abelian artinian category, stable under extensions in each range

Prove `mfTorAbelian`. `MF_tor` is abelian and artinian; kernels and cokernels of its morphisms are
kernels and cokernels in `MF`, with the induced filtrations, so morphisms are strict. For every `a ≤ b, MF_tor^{[a,b]}` is closed under subobjects, quotients and extensions in `MF_tor`. `MF` embeds fully
faithfully in an abelian `O`-linear category `MF̃`, in which `Ext` groups are computed.

The setting is the Fontaine–Laffaille setting of §R07.3.4.

*Proof sketch.* Lemma 1.9: for a subobject `L ⊆ M` with `L̃ → M̃` injective and `M` of finite length,
`Fil^i L = L ∩ Fil^i M`. Kernel: the kernel of the underlying map with the induced filtration is a
kernel in `MF`; `φ` restricts, and Proposition 1.6 (injectivity of `φ`) shows it lies in `MF_tor`. Image and
cokernel: the image with the image filtration has `L̃ ≅ L` via `φ`, so `Fil^i L = L ∩ Fil^i M` (Lemma
1.9), and image `=` coimage; the cokernel inherits a surjective `φ` (FL 1.10). Range: if `0 → M′ → M → M″ → 0` is exact in `MF_tor, M ∈ MF_tor^{[a,b]}` iff `M′` and `M″` are (FL 3.2). `MF̃`: objects `(M, M^i, α^i, β^i, φ^i)` with the displayed compatibilities (FL 1.11); `MF` is the full subcategory with `α, β` injective, and kernels and cokernels of `MF_tor`-morphisms agree in both. (Fontaine–Laffaille 1982,
§1.8, Proposition 1.8, p. 556: the statement; proof in 1.9–1.10; Fontaine–Laffaille 1982, §3.2, p.
562: closure in the range.)

*Needs:* §R07.3.4.

**Checks.**

- `mfTorAbelian_not_morphism`: the identity of `W(k)/p` from the weight-`0` object to the weight-`1`
  object respects the filtrations but is not a morphism: `φ⁰ = σ` on the source while `φ⁰ = pφ¹ = 0` on
  the target.
- `mfTorAbelian_range`: an extension of two objects of weights `[0, 1]` has weights `[0, 1]`.
- `mfTorAbelian_strict`: a morphism in `MF_tor` is strict for the filtrations; in the larger
  category of all filtered modules the identity of the first check is a bijective non-strict map,
  which `MF_tor` excludes.

### R07.3.6 The Fontaine–Laffaille ring `S`

Construct `ringS`. Let `C` be the completion of `K̄, R = lim_{x↦x^p} 𝒪_{K̄}/p, W(R)` its Witt vectors
with `θ : W(R)[1/p] → C`, and `ξ` a generator of `ker θ`. The ring `S` is `W(R)[[x]/p] ⊆ W(R)[1/p]` for any `x ∈ R` with `v_R(x) = p` (FL 2.7; equivalently the elements `Σ p^n[u_n]` with `v_R(u_{−m}) ≥ mp` for `m > 0`),
filtered by `Fil^i S = (ker θ)^i ∩ {x ∈ S : Φx ∈ p^i S}` for `i ≥ 0` (the `i`-th power of the kernel of `θ`
on `W(R)[1/p]`) and `Fil^i S = S` for `i ≤ 0`, with `φ^i = p^{−i}Φ` on `Fil^i S`. It is a filtered
module over `W(k)`, stable under `Gal(K̄/K)`, whose Galois action commutes with `Φ` and preserves the
filtration; its `p`-adic completion `Ŝ = lim S/p^n S` and `S_K = K ⊗_{W(k)} Ŝ` are the rings used for lattices
and for rational representations.

The setting is the Fontaine–Laffaille setting of §R07.3.4. The ring `R = lim_{x↦x^p} O_K̄/p, W(R)` and
`θ` are Mathlib's PreTilt and WittVector.fontaineTheta at the pin; `A_cris` and `B_dR`
use PadicPeriodRings §§4.1–4.3 and agree through §R07.3.0 for finite `K` with PadicPeriodRings §§1–2 and §R07.P2, and the comparison of `S`
with them is §R07.3.15.

*Construction.* `R, W(R), W_K(R)` and `θ` with its principal kernel (FL 2.1–2.5, citing Fontaine [F2]
Proposition 2.4). `W_K(R)` as a filtered module (FL 2.6) and the subring `S` with its filtration and `φ^i`
(FL 2.7). The Galois group acts continuously on `R`, hence on `W(R)` and `S`, commuting with `Φ` and
preserving `Fil^i S` (FL 3.1). `S̄ := coker(p on S)` in `MF̃` and `Ŝ = lim S/p^n S`.
(Fontaine–Laffaille 1982, §2.1, p. 559: the ring `R`; Fontaine–Laffaille 1982, §0.5, p. 550: the role
of `S`; Fontaine–Laffaille 1982, §§2.6–2.7, p. 561: the filtration of `W_K(R)` by the powers of `ker θ`,
the ring `S` and its filtration; §§7.14–7.17, pp. 593–594: completion and `S_K`.)

The API:

- `ringS`: `S ⊆ W(R)[1/p]` as a `W(k)`-algebra with filtration `Fil^i S` and `φ^i = p^{−i}Φ`.
- `ringS.galoisAction`: Continuous action of Field.absoluteGaloisGroup `K` commuting with `Φ` and
  preserving `Fil^i`.
- `ringS.completion`: `Ŝ = lim S/p^n S`.
- `ringS.reduction`: `S̄ = coker(p on S)` in `MF̃`.

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); PadicPeriodRings §§1–2 and §R07.P2 (`A_inf`, `θ`,
`aCris`); §R07.3.4; Mathlib `WittVector`;
Mathlib `Field.absoluteGaloisGroup`; Mathlib `PreTilt`; Mathlib `WittVector.fontaineTheta`.

**Checks.**

- `ringS.contains_WR`: `W(R) ⊆ S`, with `Fil^0 S = S`.
- `ringS.phi_teichmuller`: `Φ[x] = [x^p]` for `x ∈ R`.
- `ringS.not_WR`: `S ≠ W(R): [x]/p ∈ S` for `v_R(x) = p`, and `[x]/p ∉ W(R)`.
- `ringS.galois_fixed`: The Galois action is trivial on the image of `W(k) ⊆ S`.

### R07.3.7 The Fontaine–Laffaille functor on torsion modules

Construct `flFunctor`. For `M ∈ MF_tor` put `U_S(M) = Ext¹_{MF̃}(M, S)` (FL 3.2), a
`ℤ_p`-module with a linear action of `G_K` through the action on `S`; for `M` killed by `p^n` it is `Hom(M, S_n)` with `S_n` the cokernel of `p^n` on `S` (FL 7.14). This gives a contravariant `ℤ_p`-linear functor `U_S : MF_tor → Rep_tor(G_K)`, and its restriction to `MF_tor^{[0,p−1]}`.

The setting is the Fontaine–Laffaille setting of §R07.3.4.

*Construction.* The `O[G]`-module structure on `S` makes `Ext¹(M, S)` a left `ℤ_p[G_K]`-module (FL 3.2). For
`M` killed by `p^n`, the long exact sequence of `0 → S →^{p^n} S → S_n → 0` identifies `Ext¹(M, S)` with
`Hom(M, S_n)` (FL 7.14). (Fontaine–Laffaille 1982, §0.6, p. 550: the definition.)

The API:

- `flFunctor`: `U_S : (MF_tor)ᵒᵖ ⥤ Rep_tor(G_K), M ↦ Ext¹(M, S)`.
- `flFunctor_eq_hom`: For `M` killed by `p^n, U_S(M) ≅ Hom(M, S/p^n S), G_K`-equivariantly.
- `flFunctor_map`: Contravariant functoriality in `M`.

*Needs:* §R07.3.6; §R07.3.5.

**Checks.**

- `flFunctor_unit`: `U_S` of the weight-`0` unit object `W(k)/p` is `𝔽_p` with trivial action.
- `flFunctor_zero`: `U_S(0) = 0`.
- `flFunctor_not_covariant`: `U_S` is contravariant: an injection `M′ ↪ M` gives a surjection `U_S(M) ↠ U_S(M′)`, not an injection.

### R07.3.8 The simple objects `M(h; i)`

Prove `flSimpleObjects`. Let `k` be algebraically closed. For `h ≥ 1` and `i : ℤ/h → ℤ, M(h; i)` is
`k^{ℤ/h}` with basis `(e_m), Fil^j = ⊕_{i_m ≥ j} k e_m` and `φ^{i_m}(e_m) = e_{m−1}`. It is simple in
`MF_tor` iff the period of `i` is `h`, and then `End(M) ≅ 𝔽_{p^h}` via `v_a(e_m) = a^{p^{−m−1}} e_m`, with indices
modulo `h`. Every simple object
of `MF_tor` is killed by `p` and is represented by `M(h; i)`, uniquely up to cyclic rotation
of `i` as an underlying filtered module. If an identification `𝔽_{p^h} ≅ End(M)` is fixed,
the representative is unique as a `𝔽_{p^h}`-object (FL Proposition 4.4(ii), Remark 4.5).

`k` algebraically closed (the general case is reached by base change, FL §3).

*Proof sketch.* Simple objects are killed by `p`, hence are `k`-vector spaces with `φ_M : gr M → M`
bijective and `σ`-semilinear (FL §4). Classify semilinear bijections by the Dieudonné–Manin style
argument over `k̄`: the cycle structure of `φ` on a graded basis gives `M(h; i)` (FL 4.1–4.3). Simplicity
iff period `h`, and `End = 𝔽_{p^h}` (FL Proposition 4.4). (Fontaine–Laffaille 1982, §4.4, Proposition
4.4, p. 566: the classification.)

*Needs:* §R07.3.5.

**Checks.**

- `flSimpleObjects_distinct`: `M(1; 0)` and `M(1; p − 1)` are simple and non-isomorphic in
  `MF_tor^{[0,p−1]}`.
- `flSimpleObjects_period`: `M(2; (0, 0))` has period `1`, so it is not simple: it is `M(1; 0)²`.
- `flSimpleObjects_end`: `End M(2; (0, 1)) = F_{p²}`, not `F_p` and not `k`.
- For `h = 3, i = (0,1,2), a ∈ F_{p³}` and `m` modulo `3`, both `φ^{i_m}v_a(e_m)`
  and `v_aφ^{i_m}(e_m)` equal `a^{p^{−m}}e_{m−1}`. The direction of the basis cycle
  is required for this commutation.
- `M(2;(0,1))` and `M(2;(1,0))` are isomorphic after exchanging basis vectors. The
  exchange twists the fixed `F_{p²}`-action by Frobenius, so it does not contradict
  uniqueness with that action fixed.

### R07.3.9 Theorem 5.3: tame inertia on the simple objects, and the weight dictionary

Prove `flTameInertia`. Let `k` be algebraically closed, `ϖ ∈ K̄` with `ϖ^{p^h − 1} = p`, and `χ_h : G_K → 𝔽_{p^h}^×` the character `g ↦` image of `gϖ/ϖ`. For `i : ℤ/h → ℤ` of period `h` with `0 ≤ i_n ≤ p − 1` and `M = M(h; i): (i) Ext¹(M, S̄) = 0`; `(ii) U_S(M) = Hom(M, S̄)` is one-dimensional over `𝔽_{p^h}`; (iii) `g·u = χ_h(g)^{i_0 + p i_1 + ⋯ + p^{h−1} i_{h−1}}·u`. In particular `(h = 1) U_S(M(1; i))` is the character
`ω^i, ω` the mod-`p` cyclotomic character on inertia: a filtration jump in degree `i` corresponds to
Hodge–Tate weight `i` in the convention where `χ_cyc` has weight `+1`.

*Proof sketch.* Explicit description of `S` (FL Lemma 5.4) and reduction of the computation to a
system of equations over the valuation ring of `K̄` (FL 5.5 onward). Solve for the homomorphisms `M(h; i) → S̄`: they are determined by `ϖ^{…}` with exponent `Σ i_m p^m`, giving one-dimensionality and the
Galois action (iii). The weight dictionary: for `h = 1, χ_1 = ω` on inertia `(ϖ^{p−1} = p)`, so `U_S(M(1; i)) ≅ ω^i`. The rational sign is §R07.3.16 (`U_{S_K}` is the dual of `V_B`). (Fontaine–Laffaille 1982,
§5.3, Theorem 5.3, p. 570: the theorem; Fontaine–Laffaille 1982, §0.8, p. 551: the fundamental
character.)

*Needs:* §R07.3.8; §R07.3.7; §R07.3.6; Mathlib `Field.absoluteGaloisGroup`.

**Checks.**

- `flTameInertia_endpoint`: `U_S(M(1; 0))` and `U_S(M(1; p − 1))` are both the trivial character, since
  `ω^{p−1} = 1` (FL 0.9): the endpoint collision.
- `flTameInertia_level_two`: `M(2; (1, 0))` gives the fundamental character of level two, `χ_2^{1}`,
  which is not a power of `ω` on inertia.
- `flTameInertia_field_action`: for `i = (1,0)`, choose `ϖ^{p²−1} = p, a₁ = ϖ` and
  `a₀ = ϖ^p`, so `a₀^p = pa₁` and `a₁^p = a₀`. Precomposition by `v_a` acts by a on
  `a₁`, giving inertia scalar `χ₂`. The identification `e_m ↦ a^{p^{−m}}e_m` instead
  gives `χ₂^p`.
- `flTameInertia_sign`: `U_S(M(1; 1)) = ω`, the Galois module of `μ_p` on inertia; with the opposite
  weight convention it would be `ω^{−1}`.

### R07.3.10 Theorem 3.3: `U_S` is exact, faithful and length-preserving

Prove `flExactFaithful`. For `M ∈ MF_tor^{[0,p−1]}, U_S(M)` has finite `ℤ_p`-length equal to the
`W(k)`-length of `M`; the contravariant functor `U_S : MF_tor^{[0,p−1]} → Rep_tor(G_K)` is exact and
faithful. Moreover `M` and `U_S(M)` have the same invariant factors: `W(k) ⊗ U_S(M) ≅ M` as `W(k)`-modules
(not canonically).

The setting is the Fontaine–Laffaille setting of §R07.3.4.

*Proof sketch.* Reduction to `k` algebraically closed by the base change `M ↦ W(k′) ⊗ M`, which is exact
and faithful (FL §3). Dévissage to simple objects of `MF_tor` killed by `p`: it suffices that `dim_𝔽 Hom(M, S̄) = dim_k M` and `Ext¹(M, S̄) = 0` for every simple `M` (FL 0.6, end of §3). The simple objects
are the `M(h; i)` (§R07.3.8) and Theorem 5.3 (§R07.3.9) gives both statements when `0 ≤ i_n ≤ p − 1`.
Exactness and length additivity then follow from the long exact `Ext` sequence; faithfulness from
exactness and length preservation. (Fontaine–Laffaille 1982, §3.3, Theorem 3.3, p. 562: the theorem;
Fontaine–Laffaille 1982, §3.4, Remark, p. 562: invariant factors.)

*Needs:* §R07.3.7; §R07.3.8; §R07.3.9; §R07.3.5.

**Checks.**

- `flExactFaithful_length`: `U_S(M(1; i))` has length `1` for `0 ≤ i ≤ p − 1`.
- `flExactFaithful_invariant_factors`: `W(k)/p²` with weight `0` goes to `ℤ/p²` (same invariant factors).

### R07.3.11 Theorem 6.1: full faithfulness away from the endpoint collision

Prove `flFullFaithfulness`. Let `MF′ ⊆ MF_tor^{[0,p−1]}` consist of the objects with no nonzero
quotient `N` with `Fil^{p−1} N = N`, and `MF″` of those with no nonzero subobject `N` with `Fil^1 N = 0`. `(i)`
Each is closed under subobjects, quotients and extensions in `MF_tor^{[0,p−1]}`; over `k̄, M ∈ MF′`
(resp. `MF″`) iff no Jordan–Hölder factor is `M(1; p − 1)` (resp. `M(1; 0)`). `(ii) U_S` restricted to `MF′`,
and to `MF″`, is fully faithful. In particular `MF_tor^{[0,p−2]} ⊆ MF′`, so `U_S` is exact and fully
faithful on the safe interval `[0, p − 2]`; on all of `MF_tor^{[0,p−1]}` it is not full `(U_S(M(1; 0)) ≅ U_S(M(1; p − 1)))`. For `p = 2` the safe interval is `[0, 0]`.

The setting is the Fontaine–Laffaille setting of §R07.3.4. FL prove Proposition 6.6
(`Ext¹`-injectivity) for `MF′` and only indicate the proof for `MF″` (FL 6.6); the `MF″` half, by the dual
argument, is part of this target, while the safe interval `[0, p − 2]` needs only `MF′`.

*Proof sketch.* `(i)`: first pass to the full subcategory killed by `p` and extend scalars to `k̄`
for the simple-object description. In the killed-by-`p` category over `k̄, Ext¹(M(1; p−1), M(1; p−1)) = 0`; objects there with `N = Fil^{p−1}N` are sums of
`M(1; p−1)`. Lemma 6.3 then identifies `MF′` there with the objects having no endpoint
Jordan–Hölder factor (FL 6.4); the dual argument uses `M(1; 0)` for `MF″`. For arbitrary
`p^n`-torsion, dévissage along the subquotients `p^jM/p^{j+1}M` recovers the stated
Jordan–Hölder criterion and Serre-subcategory conclusion; pure endpoint objects in the full
torsion category are not asserted to be semisimple. `(ii)` on simple objects:
`Hom_MF(M, N) = 0` for `M ≇ N` and `End = 𝔽_{p^h}` (Proposition 4.4), and Theorem 5.3 gives the same on the Galois side within `MF′`
or `MF″` (FL 6.5). Induction on length reduces to injectivity of `Ext¹_{MF}(M, N) → Ext¹_{G}(U_S(N), U_S(M))` for simple `M, N` (FL Proposition 6.6), proved via the field `L` cut out by `U_S(M)` (Proposition
6.7), with the same torsion dévissage for arbitrary `p^n`-torsion. Safe interval: if
`Fil^{p−1}M = 0`, every nonzero quotient `N` has `Fil^{p−1}N = 0 ≠ N`, so `M ∈ MF′`.
Endpoint: `U_S(M(1; 0)) ≅ U_S(M(1; p − 1)) ≅ 𝔽_p` trivial, but `M(1; 0) ≇ M(1; p − 1)` (FL 0.9).
(Fontaine–Laffaille 1982, §6.1, Theorem 6.1, p. 581: the theorem; Fontaine–Laffaille 1982, §0.9, p.
551: the endpoint collision; §6.4, p. 583: restriction to objects killed by the coefficient
uniformiser and dévissage; Fontaine–Laffaille 1982, §6.6, p. 584: the `MF″` case is only indicated.)

*Needs:* §R07.3.10; §R07.3.8; §R07.3.9; §R07.3.5.

**Checks.**

- `flFullFaithfulness_dyadic`: `p = 2: [0, p − 2] = [0, 0]`; weight-one objects such as the Dieudonné
  data of `μ₂` are outside the safe range and are handled by Breuil–Kisin (R07.4).
- `flFullFaithfulness_restricted`: the two restricted subcategories are different: `M(1; 0) ∈ MF′ ∖ MF″` and `M(1; p − 1) ∈ MF″ ∖ MF′`.
- For `r = p−1, N = W(k)/p²` with `Fil^i N = N` for `i ≤ r` and `0` for `i > r`,
  and `φ^i = p^{r−i}σ` for `i ≤ r`, is pure endpoint torsion. The sequence
  `0 → pN → N → N/pN → 0` is nonsplit even as `W(k)`-modules. Over `k̄` its ends are
  `M(1;r)`, so endpoint self-`Ext` in the full torsion category is nonzero.
- `flFullFaithfulness_not_full`: on all of `MF_tor^{[0,p−1]}`, `Hom(M(1; 0), M(1; p − 1)) = 0` while
  `Hom(U_S M(1; p − 1), U_S M(1; 0)) = F_p`; fullness fails at the endpoint.

### R07.3.12 The essential image on the safe interval is closed under subquotients

Prove `flEssentialImageSubquotients`. The essential image of `U_S : MF_tor^{[0,p−2]} → Rep_tor(G_K)`
is closed under `G_K`-stable submodules and quotients: every `G_K`-submodule of `U_S(M)` is `U_S(M/K′)` for
a unique subobject `K′ ⊆ M`, and every quotient is `U_S(K′)` for a subobject. The same holds on `MF′` and
on `MF″`.

The setting is the Fontaine–Laffaille setting of §R07.3.4. Derived here from Theorems 3.3, 5.3 and
6.1; FL do not state it, and remark (p. 589) that no reasonable characterisation of the whole
essential image is apparent.

*Proof sketch.* `U_S` sends simple objects to simple `𝔽_p[G_K]`-modules: over `k̄` the character `χ_h^{Σ i_m p^m}` of Theorem 5.3 has field of values `𝔽_{p^h}` because `i` has period `h`; the general case follows
by descent (FL §3). A simple `G_K`-submodule `T ⊆ U_S(M)` is isomorphic to a Jordan–Hölder factor `U_S(S)`
(exactness); full faithfulness gives the map as `U_S(f)` for a surjection `f : M ↠ S`, so `T = U_S(S)`
inside `U_S(M)`. Induction on length: with `K = ker f`, a submodule `Y ⊇ T` gives `Y/T ⊆ U_S(K) = U_S(M)/T`,
so `Y/T = U_S(K/K′)` by induction, and exactness identifies `Y` with `U_S(M/K′)`. Quotients are dual.
(Fontaine–Laffaille 1982, §6, remark before `7`, p. 589: FL leave the essential image open; closure
under subquotients is derived here.)

*Needs:* §R07.3.11; §R07.3.10; §R07.3.9.

**Checks.**

- `flEssentialImage_sum`: every `G_K`-subrepresentation of `U_S(M(1; 0) ⊕ M(1; 1)) = 𝔽_p ⊕ ω` is `U_S` of
  a quotient.
- `flEssentialImage_endpoint`: on all of `[0, p − 1]` the lemma needs `MF′` or `MF″: U_S` is not full
  there.

### R07.3.13 Strongly divisible lattices

Define `StronglyDivisibleLattice`. Let `D` be a filtered `φ`-module over `K₀` (a finite-dimensional
`K₀`-vector space with a bijective `σ`-semilinear `Φ` and a decreasing exhaustive separated filtration). A
lattice `M ⊆ D` (a finitely generated `W(k)`-submodule with `K₀ ⊗ M = D`) is strongly divisible if `Σ_i p^{−i}Φ(M ∩ Fil^i D) = M`. With `Fil^i M = M ∩ Fil^i D` and `φ^i = p^{−i}Φ, M` is an object of `MF` with
`(fd₁) M` torsion free, `(fd₂)` each `Fil^i M` a direct summand, `(fd₃) Σ Im φ^i = M`; conversely such
objects give `(D, M)`. A strongly divisible lattice exists iff `D` is weakly admissible (`t_H(D) = t_N(D)`
and `t_H(D′) ≤ t_N(D′)` for all `Φ`-stable `D′`), and then `M` is strongly divisible iff `φ^i(Fil^i M) ⊆ M`
for all `i` and `(fd₃)` holds.

The setting is the Fontaine–Laffaille setting of §R07.3.4. Weak admissibility and the Hodge and
Newton numbers `t_H`, `t_N` are those of §R07.3.2.

*Construction.* Definition as displayed (FL 7.7) and the dictionary with `MF` (FL 7.12). Existence iff
weakly admissible: reduce to slopes `≥ 0` and apply Laffaille's theorem on adapted lattices (FL
Proposition 7.8, citing [L1] Theorem 3.2). For `M` strongly divisible and `Fil^0 D = D, Fil^p D = 0`,
each `M/p^n M` lies in `MF_tor^{[0,p−1]}` (FL 7.14). (Fontaine–Laffaille 1982, §7.7, Definition, p. 591:
the definition; Fontaine–Laffaille 1982, §7.8, Proposition 7.8, p. 592: existence;
Fontaine–Laffaille 1982, §7.4, p. 591: weak admissibility.)

The API:

- `IsStronglyDivisible`: `Σ_i p^{−i} Φ(M ∩ Fil^i D) = M`.
- `StronglyDivisibleLattice`: A weakly admissible `D` with a strongly divisible lattice `M`.
- `StronglyDivisibleLattice.toFLModule`: `(D, M) ↦ M` with `Fil^i M = M ∩ Fil^i D` and `φ^i = p^{−i}Φ`,
  satisfying `(fd₁)`–`(fd₃)`.
- `exists_stronglyDivisible_iff`: A strongly divisible lattice exists iff `D` is weakly admissible (FL
  7.8).

*Needs:* §R07.3.2; §R07.3.4; Mathlib `WittVector.Isocrystal`.

**Checks.**

- `sdl_slope_zero`: `D = (K₀, Φ = σ, Fil^0 = D, Fil^1 = 0): W(k)` is strongly divisible.
- `sdl_slope_one`: `D = (K₀, Φ = pσ, Fil^1 = D, Fil^2 = 0): W(k)` is strongly divisible.
- `sdl_not_weakly_admissible`: `D = (K₀, Φ = σ, Fil^1 = D, Fil^2 = 0)` has `t_H = 1 ≠ t_N = 0`, so it
  has no strongly divisible lattice: `p^{−1}Φ(M) = p^{−1}M ≠ M` for every lattice `M`.
- `sdl_zero`: `D = 0` has the unique strongly divisible lattice `0`.

### R07.3.14 The lattice functor: Propositions 7.14–7.15

Prove `flLatticeFunctor`. For a strongly divisible lattice `M` with `Fil^0 = M` and `Fil^p = 0`, the
reductions `M_n = M/p^n M` lie in `MF_tor^{[0,p−1]}`, each `U_S(M_n) = Hom(M_n, S_n)` is free over `ℤ/p^n`
of rank `rk M`, and `U_S(M) := lim_n U_S(M_n) = Hom(M, Ŝ)` is a free `ℤ_p`-module of rank `rk_{W(k)} M` with
continuous `G_K`-action. The functor `M ↦ U_S(M)` is exact and faithful, with `rk U_S(M) = rk M`, and its
restriction to the lattices with `M/pM ∈ MF′` (resp. `MF″`) is fully faithful; in particular it is fully
faithful on the lattices with `Fil^{p−1} = 0`.

The setting is the Fontaine–Laffaille setting of §R07.3.4.

*Proof sketch.* Levels: multiplication by `p` induces monomorphisms `M_n ↪ M_{n+1}`, hence epimorphisms
`U_S(M_{n+1}) ↠ U_S(M_n)`, and each `U_S(M_n)` is free of rank `h` by Theorem 3.3 and Remark 3.4 (FL
7.14). Exactness, faithfulness and rank: pass to the limit in Theorem 3.3 (FL Proposition 7.15(i)).
Full faithfulness: from Theorem 6.1 at each level and a limit argument (FL Proposition 7.15(ii)).
(Fontaine–Laffaille 1982, §7.15, Proposition 7.15, pp. 593–594: the proposition; Fontaine–Laffaille
1982, §7.14, p. 593: the levels.)

*Needs:* §R07.3.13; §R07.3.10; §R07.3.11; §R07.3.6.

**Checks.**

- `flLatticeFunctor_rankOne`: the slope-zero lattice `W(k)` (weight `0`) goes to `ℤ_p` with trivial
  action; the slope-one lattice of weight `1` goes to `ℤ_p(1)` (§R07.3.9 and §R07.3.16).
- `flLatticeFunctor_rank`: rank is preserved: `rk U_S(M) = rk M`.
- `flLatticeFunctor_range`: the hypothesis `Fil^p = 0` is needed: the lattice `W(k)` with `Φ = p^pσ`
  and its jump in degree `p` has reductions outside `MF_tor^{[0,p−1]}`, and the theorem says nothing
  about it.

### R07.3.15 `S_K` as a filtered Galois subring of the crystalline period ring

Prove `flPeriodComparison`. For `E = ℚ_p`, the `K`-algebra `S_K = K ⊗_{W(k)} Ŝ` with its filtration, `Φ` and
`G_K`-action is identified with a filtered Galois subring of Fontaine's crystalline period ring (the
ring written `B` in [F2] §4, a ring of `B⁺_cris` type); in terms of `A_cris, Ŝ ⊆ A_cris` with
`Φ` compatible and `Fil^i S_K = S_K ∩ Fil^i B_dR`.

The setting is the Fontaine–Laffaille setting of §R07.3.4. `A_cris`, `B_cris` and `B_dR` with their
Frobenius, filtration and Galois action are PadicPeriodRings §§1–2 and §R07.P2; Fontaine–Laffaille
predates `A_cris` and states the identification with the ring of Fontaine's [F2] §4.

*Proof sketch.* FL, proof of Theorem 8.4: with a the ideal of `R` of elements of valuation `≥ p, S_K` is
identified, as a filtered Galois ring, with Fontaine's ring of [F2] §4. The inclusion `S → A_cris` extends to the `p`-adic completion `Ŝ`;
inverting `p` gives `S_K → B⁺_cris`, with `θ` and `Φ` compatible. The filtered-ring identification
of FL §8.4 gives the filtration comparison (§R07.P2). (Fontaine–Laffaille 1982, §§7.14–7.17, pp. 593–594: the completed ring; §8.4, proof of
Theorem 8.4, pp. 595–596: the identification.)

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.3.6; §R07.P2 (`aCris`, `bCris`).

**Checks.**

- `flPeriodComparison_xi`: `ξ = [p̃] − p` (`p̃ ∈ R` with `p̃^{(0)} = p`) lies in `Fil^1 S`, since `θ(ξ) = 0`
  and `Φ(ξ) = [p̃]^p − p ∈ pS`, matching `ξ ∈ Fil^1 B_dR`; the element `p` lies in neither, although
  `Φ(p) = p ∈ pS`, so the condition on `Φ` alone does not define the filtration.
- `flPeriodComparison_positive_period`: the jump-one unit has a nonzero period `s ∈ S_K`
  with `Φ(s) = ps`. In `A_inf[1/p]` there is no such nonzero `s`: Frobenius preserves its
  `p`-adic order, whereas multiplication by `p` increases that order by one.
- `flPeriodComparison_frobenius`: the comparison respects `Φ: Φ[x] = [x^p]` on both sides, and
  `[p̃]^p/p ∈ S` lies in `A_cris`.
- Over `K = Frac W(F_p(t)^perf)`, the weight-zero unit gives the trivial `ℚ_p`
  representation through the general-base period rings; no finite-`K` carrier is required.

### R07.3.16 Theorem 8.4: weakly admissible modules of filtration length `< p` are admissible

Prove `flAdmissibility`. Let `D` be a weakly admissible filtered `φ`-module over `K₀` with `Fil^j D = D` and
`Fil^{j+p} D = 0` for some `j` (filtration length `< p`). Then `D` is admissible (crystalline). For an effective `D` with `Fil⁰D = D` and `Fil^pD = 0`,
put `U_{S_K}(D) = Hom_{Fil,Φ}(D,S_K) ≅ ℚ_p ⊗ U_S(M)` for a strongly divisible lattice `M`
of `D`. For the translated interval define `U(D) = U_{S_K}(D⟨j⟩)(j)`, applying `U_S` only
to lattices of `D⟨j⟩`. This is naturally `V_cris(D)^∨`, independent of `j` and the lattice.
In the unshifted range, `dim_{ℚ_p} U_{S_K}(D) = dim_{K₀} D` and `D ↪ Hom_{G_K}(U_{S_K}(D), S_K)` (Proposition 7.17). This rational statement is distinct from the torsion
full faithfulness, whose safe interval is `[0, p − 2]`.

The setting is the Fontaine–Laffaille setting of §R07.3.4. Admissibility is that of §R07.3.3, and
`V_cris`, `D_cris` are those of §R07.P5; §§R07.3.7, R07.3.10–R07.3.11 and R07.3.15 give the
finite-residue-field covariant form of this theorem; the filtered Galois ring `S_K` is identified with
Fontaine's period ring in §R07.3.15.

*Proof sketch.* Proposition 7.17: `dim U_{S_K}(D) = dim D` from rank preservation (7.15(i)); the
canonical map `D → Hom_{G}(U_{S_K}(D), S_K)` is injective by comparing with the torsion levels `M_n → Hom_G(U_S(M_n), S_n)`. Theorem 8.4: `S_K` is a filtered Galois subring of Fontaine's period ring (8.4
proof), so `dim Hom_G(V, S_K) ≥ dim D` forces `D` to be admissible, and `U_{S_K}(D) = V_B(D)^∨` naturally.
For general `j` use `D⟨j⟩` of §R07.3.1 and twist its contravariant realization by `j`; the range `0 ≤` weights `≤ p − 1` is allowed rationally
(length `< p`), unlike the torsion safe interval. (Fontaine–Laffaille 1982, §8.4, Theorem 8.4, p. 595:
the theorem; Fontaine–Laffaille 1982, §7.17, Proposition 7.17, p. 594: dimension and injectivity.)

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.3.14; §R07.3.13; §R07.3.15; §R07.3.2;
§R07.P5 (`dCris`,
`IsCrystalline`).

**Checks.**

- `flAdmissibility_cyclotomic`: `D = K₀` with `Φ = pσ, Fil^1 = D, Fil^2 = 0` (weight `1`) is admissible
  and `U_{S_K}(D) = ℚ_p(1)`: in the convention `HT(χ_cyc) = +1`, a filtration jump at `1` is Hodge–Tate
  weight `1` for this contravariant realization. The covariant realization of the same `D`
  is `ℚ_p(−1)`, with Hodge–Tate weight `−1`; covariant `D_cris(ℚ_p(1))` instead has jump `−1`.
- `flAdmissibility_length`: a weakly admissible `D` with weights `{0, p}` (length `p + 1 > p`) is outside
  the theorem; such weights need Breuil–Kisin (R07.4).
- `flAdmissibility_negative_twist`: `D = unit⟨1⟩` has jump `−1` and `Φ = p^{−1}σ`.
  The unshifted `Hom(M,Ŝ)` is zero, since `f(e) = pΦ(f(e))` forces divisibility by every `p^n`;
  `U(D) = U_{S_K}`(unit)`(−1) = ℚ_p(−1)`.
- For the zero filtered module, the period realization is zero and all admissibility
  dimension equalities hold, over every allowed perfect residue field.

### R07.3.17 `G_K`-stable lattices of crystalline representations of weights in `[0, p − 2]`

Prove `flLatticeCorrespondence`. Let `V` be crystalline with Hodge–Tate weights in `[0, p − 2]` (in the
convention `HT(χ_cyc) = +1`), so `V ≅ U_{S_K}(D)` for the weakly admissible `D = D_cris(V^∨)` with `Fil^0 D = D` and `Fil^{p−1} D = 0`. Then `M ↦ U_S(M)` is an inclusion-reversing bijection between strongly
divisible lattices `M ⊆ D` and `G_K`-stable `ℤ_p`-lattices `T ⊆ V`, compatible with the torsion functor on
quotients: `T/p^n T = U_S(M/p^n M)`.

The setting is the Fontaine–Laffaille setting of §R07.3.4. Fontaine and Laffaille do not state it;
it is derived from their Proposition 7.8, Proposition 7.15 and Theorem 8.4 with §R07.3.12.

*Proof sketch.* Injectivity and order: `U_S` reverses inclusions (`M ⊆ M′` gives `U_S(M′) ⊆ U_S(M)`,
restriction along `M ⊆ M′` being injective since `Ŝ` is `p`-torsion free). If `U_S(M) = U_S(M′)` inside `V`,
full faithfulness (§R07.3.14) turns the identity into an isomorphism `M′ ≅ M` compatible with the
embeddings in `D`, so `M = M′`. Surjectivity: choose a strongly divisible `N` (Proposition 7.8) scaled so
that `U_S(N) ⊆ T ⊆ p^{−a}U_S(N) = U_S(p^a N)`. Then `T/U_S(N) ⊆ U_S(p^a N)/U_S(N) ≅ U_S(N/p^a N)` is a
`G_K`-submodule, hence equals `U_S(Q)` for a quotient `N/p^a N ↠ Q` in `MF_tor^{[0,p−2]}` (§R07.3.12). Let `M = ker(N → Q)`, a lattice between `p^a N` and `N`. The filtration of `Q` is the image filtration
(strictness, §R07.3.5), so `0 → Fil^i M → Fil^i N → Fil^i Q → 0` is exact for all `i`, and the five
lemma with `φ_N, φ_Q` bijective shows `φ_M` bijective: `M` is strongly divisible. The long exact sequence
of `Hom(−, Ŝ)` gives `U_S(M)/U_S(N) = Ext¹(Q, Ŝ) = U_S(Q)`, so `U_S(M) = T`. The convention: `V = V_cris(D)^∨`-type duality of Theorem 8.4 and the weight dictionary of Theorem 5.3 fix `D = D_cris(V^∨)`
and `HT(χ_cyc) = +1`. (Fontaine–Laffaille 1982, §7.15, Proposition 7.15(ii), p. 594: full faithfulness
on lattices; the bijection is derived here.)

*Needs:* §R07.3.14; §R07.3.12; §R07.3.16; §R07.3.13; §R07.3.5.

**Checks.**

- `flLatticeCorrespondence_cyclotomic`: `V = ℚ_p(1), D = (K₀, Φ = pσ, Fil^1 = D, Fil^2 = 0)`: every
  lattice `p^{−n}W(k)` is strongly divisible, and they correspond, reversing inclusions, to the
  `G_K`-stable lattices `p^n ℤ_p(1)`.
- `flLatticeCorrespondence_dyadic`: `p = 2: [0, p − 2] = [0, 0]`, so only unramified representations
  are covered.

### R07.3.18 Finite flat group schemes over `W(k)` and Fontaine–Laffaille modules of weights `[0, 1]`

Prove `flFiniteFlatDictionary`. Let `k` be perfect of characteristic `p` and `A = W(k)`. A finite Honda
system is a pair `(L, M)` with `M` a finite Dieudonné module over `k` (a left `D_k`-module of finite
`W`-length) and `L ⊆ M` a `W`-submodule with `FM ∩ L = pL, L/pL ≅ M/FM` and `V` injective on `L`; it is
unipotent if `V` is nilpotent on `M`. `(i)` (Fontaine) `J ↦ LM(J)` is an anti-equivalence from finite flat
commutative `p`-group schemes over `A` to finite Honda systems if `p ≠ 2`, and from unipotent ones to
unipotent Honda systems for every `p`. `(ii)` The functors `I : SH_f → MF_tor^{[0,1]}` and `H : MF_tor^{[0,1]} → SH_f`, with `H(M) = (L, M_σ), L = im φ¹`, are quasi-inverse equivalences. (iii) The
composite `ILM` is an anti-equivalence from finite flat `p`-group schemes over `A` to `MF_tor^{[0,1]}` for `p ≠ 2`, and from unipotent ones to the full subcategory `MF_tor^{[0,1],u}` of objects with no nonzero
quotient `N = N¹` for every `p`; and `J(Ā) ≅ U_S(ILM(J))` canonically and functorially (`Ā` the integral
closure of `A` in `K̄`).

`e = 1 (A = W(k), K = W(k)[1/p])`, filtration in `[0, 1]` (FL's `MF_tor^{f,2}`); the Dieudonné module of a
finite group over `k` is §R07.2.6; `U_S` is §R07.3.7. For `p = 2` only the unipotent (connected-dual) part
is covered.

*Proof sketch.* `(i)` is Fontaine's classification of finite flat groups over `W(k)` by Honda systems
(Fontaine, Groupes `p`-divisibles sur les corps locaux, Astérisque `47`–`48`), as recalled by
Fontaine–Laffaille in 9.5; its proof is part of this target. `(ii)` FL 9.7–9.10: define `I` and `H` and
check (SH1)–(SH3) directly (Proposition 9.9), giving the equivalence (Proposition 9.10). (iii)
Compose `(i)` and `(ii)` (FL 9.11); the identification `J(Ā) ≅ U_S(M)` uses Witt covectors `CW₋₁(Ā/pĀ)` and
the convergence of `Σ p^{−n} x_{−n}^{p^n}` in `C` (FL Proposition 9.12, proof in 9.13).
(Fontaine–Laffaille 1982, §9, 9.1–9.6 (recalled: Dieudonné modules, finite Honda systems, Fontaine's
classification), pp. 600–602: finite Honda systems and Fontaine's anti-equivalence with finite flat
`p`-groups over `W(k)`; Fontaine–Laffaille 1982, §9, 9.7–9.11 and Proposition 9.12, pp. 602–606: the
equivalence between Honda systems and `MF_tor^{f,2}`, the anti-equivalence with finite flat `p`-groups
(unipotent ones for `p = 2`), and `J(Ā) = U_S(M)`.)

*Needs:* §R07.2.28a `wittCovectors`; §R07.3.4; §R07.3.7; §R07.3.10; §R07.2.6; §R07.2.8; §R07.2.5.

**Checks.**

- `flFiniteFlat_rankOne`: `J = μ_p: M = k` with `Fil¹ = M` (`φ¹` bijective), the multiplicative object; `J = ℤ/p: M = k` with `Fil¹ = 0`, the étale object.
- `flFiniteFlat_dyadic`: for `p = 2` the non-unipotent group `μ₂` over `ℤ₂` is not covered by (iii) for
  all `p`; its module `k` with `Fil¹ = k` is a quotient `N = N¹`, excluded from `MF_tor^{[0,1],u}`.
- For `J = 0`, the Honda system and Fontaine–Laffaille module are zero, and
  the covector evaluation and the Galois realization both give zero.


### R07.3.19 Tame connected–étale rank one with coefficients

**Tame connected–étale rank one.** Prove `tameConnectedEtaleRankOne`. Let `F₀/ℚ_p`
be finite unramified, `L = F₀(μ_p)` and `A = O_L`, of absolute ramification
`e = p − 1`. Let `O′` be the integers of a finite extension `E/ℚ_p`, with
uniformiser `λ`, and let `Γ/A` be a `p`-divisible group with `O′`-action. Assume
`M = T_pΓ` is free of rank two over `O′`, `det_{O′} M|I_L = χ_p`, and
`M/λM` has a nonzero `G_L`-fixed vector. In the connected–étale sequence
`0 → M⁰ → M → M^{et} → 0`, both outer terms are free of `O′`-rank one;
`I_L` acts by `χ_p` on `M⁰` and trivially on `M^{et}`. This holds for every
prime, including `p = 2`. (Conrad–Diamond–Taylor 1999, Lemma 2.1.2 and its
proof, author version pp. 8–9: the group calculation; the dyadic argument uses
§R07.1.34 rather than Fontaine–Laffaille's unipotent classification.)

*Proof sketch.* Put `r = v_λ(p)`. Multiplication by `λ^{r−1}` identifies
`M/λM` with `(M/pM)[λ]`, since `(p) = (λ^r)`. If `Γ` is connected, a
nonzero fixed vector therefore gives a generic subgroup `μ_p ⊂ Γ[p]_L`.
The order-`p` classification at `e = p − 1` identifies its connected closure
with `μ_{p,A}` (§§R07.1.31, R07.1.34). Thus `Γᴰ[p]` has a nonzero étale
quotient. Cartier duality identifies its Tate module canonically with
`Hom_{ℤ_p}(M, ℤ_p(1))`; the trace pairing identifies this with
`Hom_{O′}(M, 𝔇_{O′/ℤ_p}^{−1} ⊗_{ℤ_p} ℤ_p(1))`. Choosing a generator of the
inverse different gives an `O′`-linear isomorphism with
`Hom_{O′}(M, O′(1))`, preserving rank two and the inertia determinant `χ_p`.
Its nonzero étale quotient cannot have rank two, because `χ_p|I_L ≠ 1`.
Its connected part consequently has rank one and inertia character `χ_p`.
Dualizing gives an unramified quotient of `M`. The étale realization of
unramified lattices and Tate full faithfulness turn this into a nonzero
map from `Γ` to an étale `p`-divisible group, contradicting connectedness. Hence `M^{et} ≠ 0`; the
same determinant argument gives the claimed ranks and inertia characters.

The API:

- `tameConnectedEtaleRankOne_rank` and `tameConnectedEtaleRankOne_inertia`
  record the two ranks and the two inertia actions on the canonical sequence.
- `tameConnectedEtaleRankOne_dual` records the trace-dual identification,
  its dependence on the inverse-different generator, and the interchange of
  the connected and étale rank-one terms under Cartier duality.
- `tameConnectedEtaleRankOne_descent`: for finite unramified `F/ℚ_p` and
  `F₀/F`, a `G_F`-stable `O′`-lattice `T` in a rank-two representation `V`
  of weights `{0,1}`, crystalline over `L`, is realized by `Γ` with
  `T_pΓ ≅ T|G_L` by §R07.4.20. Assume the determinant and fixed-vector
  hypotheses above. Full faithfulness transports the coefficient action
  and generic Galois descent datum to `Γ`. Its canonical connected part
  preserves this datum, yielding a `G_F`-stable weight-one line and a
  rank-one quotient `η` with `η|I_L = 1`. Therefore `η|I_F` is tame of
  order dividing `p − 1`. Descent here concerns the generic representation;
  it does not assert a Barsotti–Tate model over `O_F`. A finite factor in
  `det V` must be trivial on `I_L` before applying the group theorem.
- `tameConnectedEtaleRankOne_residualQuotient`: if a character
  `η : I → O′ˣ` satisfies `η(g)^{p−1} = 1` for every `g` and its reduction
  modulo `λ` is trivial, then `η = 1`. Reduction is injective on roots of
  unity of order prime to `p`. Apply this to the descended étale quotient
  when `T^{et}/λT^{et}` is the specified residual unramified quotient of
  `T/λT`; freeness makes reduction of the quotient sequence exact. A
  nonsplit residual representation with unique rank-one quotient has this
  compatibility. Existence of some residual unramified quotient alone
  does not ensure compatibility for split residual data.

The representation adapter is built after §R07.4.20; the group calculation
uses only Layer R07.1. The integral realization applies at every prime
(Liu 2013, Theorems 1.0.1 and 2.2.1, published pp. 662, 666).

*Needs:* §§R07.1.2, R07.1.7–R07.1.9, R07.1.20, R07.1.22, R07.1.31,
R07.1.34; §R07.4.20 for the representation adapter.

**Checks.**

- For `Γ = μ_{p^∞} × ℚ_p/ℤ_p` and `O′ = ℤ_p`, the ranks are `(1,1)`
  and the inertia characters are `(χ_p,1)`; the constant residual factor
  gives a fixed vector. After finite free coefficient extension the
  ranks remain `O′`-ranks, while the underlying `ℤ_p`-heights scale by
  `[E : ℚ_p]`.
- For ramified `O′`, the fixed vector is transferred through
  `x mod λ ↦ λ^{r−1}x mod p`. The trace-dual lattice involves the inverse
  different; identifying it with `O′` requires a generator and is not an
  equality of integral lattices.
- At `p = 2`, `L = F₀`, `e = 1` and `μ₂` is rational. Its connected
  closure is `μ₂,A` by the all-prime order-`p` classification, and the
  height-one adapter realizes every stable lattice. The tame quotient
  character has order dividing `p − 1 = 1`.
- Without the fixed-vector hypothesis, take `p = 5`, `F₀ = ℚ₅`, `O′ = ℤ₅`
  and `Γ = C[5^∞]` over `O_L` for `C : y² = x³ + 1`, with good
  supersingular reduction. Its determinant is `χ₅`, but its ranks are
  `(2,0)`. The niveau-two inertia characters on `C[5]` restrict to
  nontrivial characters of order `6` on `I_L`, so there is no fixed
  vector (Serre 1972, §1.11, Proposition 12, p. 275).
- For odd `p`, over `F = ℚ_p` take
  `V = E(χ_p ω̃⁻¹) ⊕ E(ω̃)`, with `ω̃` the Teichmüller lift of the
  mod-`p` cyclotomic character. Over `L` it is realized by the split
  ordinary group. Its reduction has an unramified quotient, but the
  descended étale quotient reduces to `ω`, not to that quotient. Both
  characteristic-zero summands are ramified, so `V` has no unramified
  quotient over `F`. This distinguishes potential ordinarity from the
  conclusion with residual quotient compatibility.


### Examples

- For `0 ≤ j ≤ p − 1`, the unit object of weight `j` (`W(k)/p` with its jump in degree `j` and `φ^j = σ`) gives the
  character `ω^j` on tame inertia; for `j = 1` and `k = F_p` this is the mod-`p` cyclotomic
  character, the Galois module of `μ_p`.
- Over `W(k)`, the finite flat group `ℤ/p` corresponds to `k` with its filtration jump in degree `0`
  and `μ_p` to `k` with its jump in degree `1` (§R07.3.18); their product corresponds to the direct
  sum, and `U_S` recovers the Galois modules `F_p` and `ω`.

### Dependencies

Layer R07.2 (Dieudonné–Manin and slopes); §§R07.P2–R07.P5 and PadicPeriodRings §§3–4 (supplied period rings, `D_cris`,
rational crystalline predicates); §R07.3.3a (general filtered Frobenius carrier) and
§§R07.3.4–R07.3.15 (Fontaine–Laffaille theory and period realization);
PadicPeriodRings §§4.1–4.3 (`B_st`, `D_st`); Mathlib `WittVector`, `PreTilt`,
`WittVector.fontaineTheta`, `Module.length`.

## Layer R07.4: Breuil–Kisin modules

Breuil–Kisin theory classifies `G_K`-stable lattices in crystalline and semistable representations,
and finite flat group schemes and `p`-divisible groups over `𝒪_K`, by modules over `𝔖 = W(k)⟦u⟧`
with a Frobenius. The layer builds the coefficient rings, Kisin modules of finite `E`-height, the
field of norms of the Kummer tower and Fontaine's étale `φ`-modules, Kisin's comparison of filtered
`(φ, N)`-modules with modules over the open unit `disc`, the Robba ring and Kedlaya's slope
filtration, and from them Kisin's theorems: weakly admissible modules embed into Kisin modules,
semistable representations have lattices of finite `E`-height (so weakly admissible modules are
admissible), and restriction to `G_{K_∞}` is fully faithful on crystalline representations. It then
classifies `p`-divisible groups by Kisin modules of height `≤ 1` (for every `p`, with the dyadic
case), proves Fontaine's conjecture for weights `{0, 1}`, classifies finite flat group schemes, and
treats Breuil–Kisin modules with torsion, the all-weight functor of Bhatt–Morrow–Scholze, integral
comparisons with the Dieudonné crystal, Wach modules, descent data in weight two and coefficients.

### R07.4.1 The Breuil–Kisin coefficient rings `𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪` and `S`

Construct `frob`. `𝔖 = W⟦u⟧` with the Frobenius `φ` that is the Witt-vector Frobenius on `W` and sends `u`
to `u^p`; `θ_𝔖 : 𝔖 → 𝒪_K, u ↦ π`, has kernel `E(u)𝔖`, and `E(u) ≡ u^e mod p`. `𝒪_ℰ` is the `p`-adic completion
of `𝔖[1/u]`, a complete discrete valuation ring with uniformiser `p` and residue field `k((u))`, and `ℰ = 𝒪_ℰ[1/p]`. With `π̃ = (π_n)_n ∈ R = lim_{x↦x^p} 𝒪_K̄/p`, the map `u ↦ [π̃]` embeds `𝔖` in `W(R)` compatibly
with `φ` and `θ, 𝒪_ℰ` in `W(Fr R)` and `ℰ` in `W(Fr R)[1/p]`; `ℰ^ur` is the maximal unramified extension of `ℰ` in
`W(Fr R)[1/p], 𝒪̂_{ℰ^ur}` the `p`-adic completion of its ring of integers, and `𝔖^ur = 𝒪̂_{ℰ^ur} ∩ W(R)`.
`G_{K∞}` acts on these rings, fixing `𝔖` and `𝒪_ℰ`. Use RestrictedPowerSeries §7.1's
open-disc subring of `PowerSeries K₀`, at radius one, as the scalar carrier `𝒪`, with its
supplied Gauss topology, completeness, evaluations and differentiation. Prove
`kisinOpenDiscBounded`: its bounded-coefficient subring is canonically `𝔖[1/p]`, by
coefficientwise inclusion; bounded denominators are equivalent to bounded coefficients since
`W(k)` is a discrete valuation ring. This identification preserves constants, `u`, evaluation
and the Gauss seminorms. Here extend Witt Frobenius by `φ(u)=u^p` and prove its continuity,
the convergence of `λ` and its Frobenius and differentiation identities, with
`λ = ∏_{n≥0} φⁿ(E(u)/E(0))`, `λ(0)=1` and `N_∇ = −uλ·d/du`.
`S` is the `p`-adic completion of the divided-power envelope of `W[u]` for the ideal `(E(u))`,
with `Fil¹S` the closure of the ideal generated by the `E(u)ⁱ/i!`, `φ(u) = u^p, φ(Fil¹S) ⊆ pS` and `φ₁ = φ/p` on `Fil¹S`; `u ↦ [π̃]` extends to `S → A_cris`.

`k` is a perfect field of characteristic `p, W = W(k), K₀ = W[1/p]`, and `K/K₀` is finite and totally
ramified of degree `e`, with a uniformiser `π`, its Eisenstein polynomial `E(u) ∈ W[u]`, and `π_n ∈ K̄` with
`π_0 = π` and `π_{n+1}^p = π_n`; `K_∞ = ∪_n K(π_n)` and `G_{K∞} = Gal(K̄/K_∞)`. A general finite `K/ℚ_p` is of
this form over its maximal unramified subfield. `R`, `W(R)` and `θ` are Mathlib's `PreTilt` and
`WittVector.fontaineTheta`; `A_cris` and `B⁺_cris` are those of §R07.P2, and
`B⁺_st ⊂ B_st` (PadicPeriodRings §4.1) is taken with the element `log[π̃]`.
Kisin 2006 (2.1.1) places `ℰ, ℰ̂^ur` and `𝔖^ur` inside `W(Fr R)`; the corrected placement is Kisin's own
erratum `(E.3)`, used here.

*Construction.* `𝔖` is a regular local ring of dimension `2`, and `φ : 𝔖 → 𝔖` is finite free of rank `p`
(basis `1, u, …, u^{p−1}` over `φ(𝔖)`), hence flat. `E(u) ≡ u^e mod p`, so `E(u)` becomes a unit in `𝒪_ℰ`,
whose residue ring `𝒪_ℰ/p = k((u))` is a field (Kisin 2006, 2.1.1). `θ([π̃]) = π`, so `W[u] → W(R), u ↦ [π̃]`, extends to `𝔖 ↪ W(R)`, compatible with `φ`, with `θ` restricting to `u ↦ π` (Kisin 2006, 2.1.1). `Fr R`
is algebraically closed, so `𝒪_{ℰ^ur}/p` is a separable closure of `k((u))` (Fontaine, Grothendieck
Festschrift, `A`.3.1.6, as cited by Kisin). Erratum `(E.3): ℰ` embeds in `W(Fr R)[1/p]`, not `W(Fr R)`;
`ℰ̂^ur` is the `p`-adic closure of `ℰ^ur` in `W(Fr R)[1/p]`; `𝔖^ur` is defined as `𝒪̂_{ℰ^ur} ∩ W(R)`. Kisin 2008
(1.1) and Kisin 2009 (1.1.12) use this corrected form. `S: φ(E(u)) ≡ E(u)^p mod p` and `E(u)^p = p!·(E(u)^p/p!) ∈ pS`, so `φ(Fil¹S) ⊆ pS`, and `c = φ₁(E(u))` is a unit of `S` (Kisin 2009, 1.1.1). (Kisin
2006, §1.1.1, p. 4: `𝔖` and the points `π_n`; Kisin 2006, §2.1.1, p. 20; Kisin 2008, Errata for `[Ki 2], (E.3)`, p. 34: the corrected placement of `ℰ`; the erratum goes on to place `ℰ̂^ur` in `W(Fr R)[1/p]` and
to define `𝔖^ur` as `𝒪̂_{ℰ^ur} ∩ W(R)`; Kisin 2006, §A.5, p. 31: Breuil's ring `S`.)

The API:

- `Sfrak`: `𝔖 =` PowerSeries (WittVector `p k`).
- `frob`: `φ` on `𝔖`: WittVector.frobenius on coefficients and `u ↦ u^p`.
- `Eisenstein`: a monic `E(u) ∈ W[u]` of positive degree satisfying Mathlib's
  `Polynomial.IsEisensteinAt` for `(p)` (which alone admits `E = 1`); the Eisenstein polynomial of `π` has
  `E(π) = 0` and `E ≡ u^e mod p`.
- `OE`: `𝒪_ℰ = p`-adic completion of `𝔖[1/u]`, with its Frobenius.
- `SUr`: `𝔖^ur = 𝒪̂_{ℰ^ur} ∩ W(R)` with its `G_{K∞}`-action and `φ`.
- `toWittR`: `𝔖 → W(R), u ↦ [π̃], φ`-equivariant, with `θ ∘ (𝔖 → W(R)) = θ_𝔖`.
- `breuilS`: Breuil's `S` with `Fil¹S, φ` and `φ₁ = φ/p` on `Fil¹S`.
- `breuilMonodromyIdeal`: `I_N = Σ_{i≥1} S·u^i/⌊i/e⌋!`, the ideal generated by these
  divided monomials. For §R07.4.33 set `J_N = Σ_{i≥1} S_R·u^i/⌊i/e⌋!`, the extended
  ideal `I_N S_R`; coefficient maps carry these generators to the same generators.
  These ideals are distinct from the PD filtration ideals and from coefficient ideals in `R`
  (Savitt §3.2, p.14; Definition 4.1(8), p.22).

*Needs:* RestrictedPowerSeries §7.1 (open-disc scalar algebra);
PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.P2 (`aCris`, `bCris`);
PadicPeriodRings §4.1 (`B_st`); Mathlib `PowerSeries`; Mathlib `WittVector`; Mathlib `WittVector.frobenius`; Mathlib
`Polynomial.IsEisensteinAt`; Mathlib `AdicCompletion`; Mathlib `PreTilt`; Mathlib
`WittVector.fontaineTheta`.

**Checks.**

- The series `Σ_{n≥0} u^n` is in `𝔖⊂𝒪`; it need not converge on the closed unit disc.
  The series `Σ_{n≥0} p^{−⌊√n⌋}u^n` lies in `𝒪` but has unbounded coefficients and is
  outside `𝔖[1/p]`. Evaluation at zero and differentiation agree with the supplied carrier.
- `N(u^i/⌊i/e⌋!) = −i u^i/⌊i/e⌋!` gives `N(S)⊆I_N` and `N(S_R)⊆J_N`.
  In particular `N(u)=−u∈I_N`, whereas `u∉Fil¹S` since its image is `π≠0`.
- `frob_X` and `frob_C`: frob `u = u^p`, and frob restricts to WittVector.frobenius on `W`.
- `theta_eisenstein`: `θ_𝔖(E(u)) = 0` and `ker θ_𝔖 = E(u)𝔖`.
- `Eisenstein.not_isUnit`: `E(u)` is not a unit of `𝔖 (θ_𝔖(E(u)) = 0)`, although it is a unit of `𝒪_ℰ`;
  the degree condition of `Eisenstein` is what excludes `E = 1`.
- `eisensteinUnramified`: `e = 1, π = p: E(u) = u − p`, Eisenstein because `p` is a uniformiser of `W`.
- `toWittR_equivariant`: the inclusions `𝔖 ⊂ 𝔖^ur ⊂ W(R)` and `𝒪_ℰ ⊂ 𝒪̂_{ℰ^ur} ⊂ W(Fr R)` are
  `φ`-equivariant.

### R07.4.2 Kisin modules of finite `E`-height and their torsion versions

Define `KisinModule`. `Mod^φ_{/𝔖}` is the category of finite free `𝔖`-modules `𝔐` with a `φ`-semilinear `φ_𝔐 : 𝔐 → 𝔐` whose linearisation `1 ⊗ φ : φ*𝔐 = 𝔖 ⊗_{φ,𝔖} 𝔐 → 𝔐` has cokernel killed by a power of `E(u)`; `𝔐`
has `E`-height `≤ h` if `E(u)^h` kills the cokernel, and `BT^φ_{/𝔖}` is the full subcategory of `E`-height `≤ 1`. Morphisms are `φ`-compatible `𝔖`-linear maps, and `Mod^φ_{/𝔖} ⊗ ℚ_p` is the isogeny category. Torsion
versions: `′(Mod/𝔖)` consists of `𝔖`-modules with `φ`-semilinear `φ` whose linearisation has cokernel killed
by `E(u)`; `(Mod/𝔖)` is its full subcategory of finitely generated `p`-power-torsion modules with a finite
free resolution of length at most `1` (equivalently, no `u`-torsion, including zero), whose
Frobenius linearisation has cokernel killed by `E(u)`. These are iterated extensions in
`′(Mod/𝔖)` of finite free `𝔖/p`-modules, and `(Mod FI/𝔖)` consists
of those isomorphic to `⊕ᵢ 𝔖/p^{nᵢ}`. An object of `(Mod/𝔖)` is multiplicative if `1 ⊗ φ` is an
isomorphism and étale if its image is `E(u)𝔐`. With coefficients in a finite `ℤ_p`-algebra `A, 𝔖_A = 𝔖 ⊗_{ℤ_p} A` and objects carry a commuting `A`-action.

The setting is the Kummer frame of §R07.4.1. Kisin 2009 §1 assumes `k` finite and `p ≠ 2` throughout;
the definitions themselves need neither.

*Construction.* For `𝔐` in `(Mod/𝔖), 1 ⊗ φ` is injective: by dévissage reduce to `p𝔐 = 0`, where `𝔐` is free
of rank `r` over `𝔖/p = k⟦u⟧` and `det(1 ⊗ φ)` divides `u^{er}`, a non-zero-divisor (Kisin 2009, 1.1.9). In
`Mod^φ_{/𝔖}, 1 ⊗ φ` is injective: its source and target are free of the same rank and its cokernel is
torsion. Kisin 2006 (2.3.2): a nonzero finitely generated torsion `𝔖`-module has projective dimension `1` iff it
has depth `1` (Auslander–Buchsbaum, `𝔖` regular of dimension `2`) iff it has no nonzero section supported
at the closed point; then the `𝔐[pⁱ]/𝔐[pⁱ⁻¹]` are free over `𝔖/p`, and `1 ⊗ φ` on each has kernel killed
by `E(u)`, hence is injective. Heights add under `⊗`: if `E(u)^a` and `E(u)^b` kill the two cokernels, the
image of `1 ⊗ φ` on `𝔐 ⊗ 𝔐′` contains `E(u)^{a+b}(𝔐 ⊗ 𝔐′)`. (Kisin 2006, §2.1.3, p. 21: `mod^φ_{/𝔖}`; Kisin
2006, §2.2.1, p. 25: `BT^φ_{/𝔖}`; Kisin 2006, §2.3.1, p. 27: the torsion category; Kisin 2009,
§1.1.16, p. 10: étale and multiplicative objects.)

The API:

- `KisinModule`: A finite free `𝔖`-module with `φ`-semilinear `φ` whose linearisation has cokernel killed
  by a power of `E(u)`.
- `KisinModule.HeightLE`: `E(u)^h` kills `coker(1 ⊗ φ)`.
- `KisinModule.Hom`: `𝔖`-linear maps commuting with `φ`.
- `KisinModule.rankOne`: the rank-one module `𝔖e` with `φ(e) = c·e`, for `c ∈ 𝔖` of finite `E`-height, and
  `KisinModule.unit`, the unit object `(𝔖, φ) (c = 1)`.
- `KisinModule.category`: The category `Mod^φ_{/𝔖}`, with `⊗` and the full subcategory `BT^φ_{/𝔖}`.
- `TorsionKisinModule`: A finitely generated `p`-power-torsion `𝔖`-module with a finite free
  resolution of length at most `1`, including zero, and Frobenius linearisation cokernel killed
  by `E(u)`.
- `TorsionKisinModule.IsMultiplicative`: `1 ⊗ φ` is an isomorphism.
- `TorsionKisinModule.IsEtale`: The image of `1 ⊗ φ` is `E(u)𝔐`.

*Needs:* §R07.4.1; Mathlib `Module.Free`; Mathlib `Module.Finite`.

**Checks.**

- `KisinModule.unit_height_zero`: `(𝔖, φ)` has `E`-height `≤ 0`.
- `KisinModule.eisenstein_height_one`: `𝔖e` with `φ(e) = E(u)e` has `E`-height `≤ 1` and not `≤ 0`.
- `KisinModule.not_finite_height`: `𝔖e` with `φ(e) = p·e` is not of finite `E`-height: its cokernel `𝔖/p` is
  killed by no power of `E(u)`, since `E(u) ≡ u^e` is not nilpotent in `k⟦u⟧`.
- `TorsionKisinModule.zero`: The zero module is in `(Mod/𝔖)` and is both étale and multiplicative.
- `TorsionKisinModule.rankOne`: in `(Mod/𝔖), 𝔖/p` with `φ_𝔐 = φ` is multiplicative, and `𝔖/p·e` with `φ(e) = E(u)e` is étale; the two notions are exclusive on nonzero modules.
- The infinite direct sum `⊕_{n∈ℕ} 𝔖/p` with height-zero Frobenius is not an object:
  it is not finitely generated. The zero object is allowed by resolution length at most `1`.

### R07.4.3 The field of norms of the Kummer tower

Prove `kummerFieldOfNorms`. The extension `K_∞/K` is strictly APF (arithmetically profinite in
Wintenberger's sense, with strictly positive ramification constant); its field of norms `X_K(K_∞) = lim_{N} (K(π_n)^×) ∪ {0}` (transition maps the norms, addition defined by limits of norms of sums) is
a complete discretely valued field of characteristic `p`. Its norm-compatible uniformiser is
`π̃ = (π_n)_n` for odd `p` and `π̃ = (−π_n)_n` for `p = 2`, so
`X_K(K_∞) ≅ k((u))` with `u ↦ π̃` and its valuation ring `≅ k⟦u⟧`. For every finite extension `L/K_∞` inside
`K̄, X_K(L)` is a finite separable extension of `X_K(K_∞)` of degree `[L : K_∞]`, and `L ↦ X_K(L)` induces
an isomorphism `G_{K∞} ≅ Gal(k((u))^sep/k((u)))`, compatible with the embedding `k((u)) ⊂ Fr R (R = lim_{x↦x^p} O_{K̄}/p)` sending `u` to `(π_n mod p)_n`.

The setting is the Kummer frame of §R07.4.1. Strict APF-ness: the Galois closure `K_∞(μ_{p^∞})` has
Galois group an open subgroup of `ℤ_p(1) ⋊ ℤ_p^×`, a `p`-adic Lie group, so it is strictly APF
(Wintenberger 1.2.2), and so is the subextension `K_∞` (Wintenberger 1.2.3(iii)); Breuil proves this
for `K = K₀` and the argument is the same for general `K` (as cited by Kisin 2009, 1.1.12).

*Proof sketch.* Strict APF: Breuil, Lemme 2.1.1, from Wintenberger 1.2.2–1.2.3. Field structure:
Wintenberger 2.1.3 (addition by limits of norms), 2.2.4 and 2.3.1 (complete DVR, fraction field); `π̃`
has valuation `1` (Wintenberger 2.1.2), so `X ≅ k((π̃))` (Breuil §2.1). Finite extensions and Galois
groups: Wintenberger 3.1.2 (`X_K(L)/X_K(K_∞)` finite separable of degree `[L : K_∞]`) and 3.2.2–3.2.3
(the separable closure and `G_{K∞} ≅ Gal(X^sep/X)`). The embedding into `Fr R`: the norm-compatible
system just specified maps to the `p`-power-compatible system `(π_n mod p)`; at `p = 2`
the signs disappear modulo `p` (§R07.4.1). (Wintenberger 1983, §1.2,
1.2.2–1.2.3, p. 62; §2.1, Théorème 2.1.3, p. 65; §3.1, Théorème 3.1.2, p. 71; §3.2, Théorème 3.2.2
and Corollaire 3.2.3, p. 72: strictly APF extensions, the field of norms, its finite extensions and
the identification of Galois groups; Breuil 1999, §2.1, Lemme 2.1.1 and the construction of `X`, pp.
2–3: the Kummer tower `K_∞/K₀` is strictly APF and its field of norms is `k((π̃))` with `H_∞ = Gal(X^s/X)`.)

*Needs:* §R07.4.1; Mathlib `Valued`; Mathlib `IsDiscreteValuationRing`;
TauCetiRoadmap.LocalFieldsRamification Layer 3.

**Checks.**

- `kummerFieldOfNorms_Qp`: `K = ℚ_p, π = p: K_∞ = ℚ_p(p^{1/p^∞})` and `X ≅ F_p((u))` with `u` the class of
  `(p^{1/p^n})_n` for odd `p`, and `(−2^{1/2^n})_n` for `p = 2`.
- `kummerFieldOfNorms_not_cyclotomic`: the cyclotomic tower `ℚ_p(μ_{p^∞})` gives the different field
  of norms `F_p((ε − 1))` with a `Γ`-action; the Kummer tower is not Galois, and its field of norms has
  no residual group action.
- For `K = ℚ₂` and `π₁ = √2, N(π₁) = −2`. Instead `N(−π_{n+1}) = −π_n`
  in each quadratic transition; this gives the norm-compatible uniformiser with the same
  image modulo `2`.

### R07.4.4 Fontaine's equivalence for étale `φ`-modules over a Cohen ring

Prove `etalePhiModulesCohenRing`. Let `F` be any field of characteristic `p` with separable closure `F^s`
and `H = Gal(F^s/F)`. `(i) (mod p) D ↦ T(D) = (F^s ⊗_F D)^{φ⊗φ=1}` is an equivalence from étale
`φ`-modules over `F` (finite-dimensional `F`-spaces with a Frobenius-semilinear map
whose linearisation `F ⊗_{F,Frob} D → D` is bijective) to finite-dimensional continuous
`F_p`-representations of `H`, with
quasi-inverse `V ↦ (F^s ⊗_{F_p} V)^H`; the comparison `F^s ⊗_F D ≅ F^s ⊗_{F_p} T(D)` is an isomorphism
(Hilbert `90` for `GL_n`). `(ii)` (integral) Let `𝒪_ℰ` be a Cohen ring of `F` with a Frobenius lift `φ` and
`𝒪_{ℰ^ur}` the strict henselisation with completion `𝒪̂_{ℰ^ur}` (residue field `F^s`). Then `M ↦ (𝒪̂_{ℰ^ur} ⊗ M)^{φ=1}` is an exact tensor equivalence from finitely generated étale `φ`-modules over `𝒪_ℰ` to
finitely generated `ℤ_p`-modules with continuous `H`-action, compatible with ranks, duals and `⊗`.

Here `F` is any field of characteristic `p` (no `Γ`-action is needed) and `𝒪_ℰ` is a complete DVR
with uniformiser `p` and residue field `F`, with a lift `φ` of the Frobenius. For `F = k((u))` the field of
norms of §R07.4.3, `𝒪_ℰ` is the `p`-adic completion of `𝔖[1/u]` (§R07.4.1).

*Proof sketch.* `(i) H¹(H, GL_n(F^s)) = 1` makes `F^s ⊗_F D_F(T) → F^s ⊗ T` an isomorphism, so `D_F(T)`
has dimension `dim T`; the inverse functor uses that `φ − 1` is surjective on `F^s` (Artin–Schreier)
(Breuil, Proposition 2.2.1, quoting Fontaine). `(ii)` Dévissage from `(i)`: for `p`-torsion modules apply
`(i)`; for `p^n`-torsion induct using exactness, which follows from surjectivity of `φ − 1` on
`𝒪̂_{ℰ^ur}/p^n`; pass to the limit for finite free modules (Fontaine, `A`.1.2.6, as cited by Kisin 2006,
2.1.4). (Breuil 1999, §2.2, Proposition 2.2.1 and its quasi-inverse `T_F`, p. 4: Fontaine's `mod p`
equivalence for an arbitrary field `F` of characteristic `p`, quoting Fontaine, Grothendieck Festschrift
II, p. 259; Kisin 2006, §2.1, proof of Lemma (2.1.2) and Corollary (2.1.4), p. 21: Kisin's use of
Fontaine's equivalence (citing Fontaine `B`.1.8.4 and `A`.1.2) for `V_𝔖` and its torsion version; Kisin
2009, §1.1.12, pp. 8–9: `K_∞/K` is strictly APF and, by Fontaine `A`.1.2.6 and `A`.`3, M ↦ (𝒪̂_{ℰ^ur} ⊗ M)^{φ=1}` is an equivalence of abelian categories from étale `φ`-modules over `𝒪_ℰ` to
`ℤ_p`-representations of `G_{K∞}`, with the displayed quasi-inverse.)

*Needs:* §R07.4.3; §R07.4.1; Mathlib `Field.absoluteGaloisGroup`; TauCetiRoadmap.ProfiniteCohomology
Layer 9.

**Checks.**

- `etalePhiModules_unit`: the unit object `𝒪_ℰ` with `φ` gives `ℤ_p` with trivial action; a rank-one `φ(e) = ae, a ∈ W^×`, gives an unramified character (Lang).
- `etalePhiModules_not_etale`: a `φ`-module whose linearised `φ` is not an isomorphism `(φ(e) = pe)` is
  not étale and has `(𝒪̂ ⊗ M)^{φ=1} = 0`.
- For `F = F_p(t), φ(x,y) = (x^p + t y^p,0)` is injective because `1` and `t` are
  independent over `F^p`. Its linearisation has rank `1` on `F²`, so it is not étale.

### R07.4.5 Étale `φ`-modules over `𝒪_ℰ` and representations of `G_{K∞}`

Prove `kummerEtalePhiModules`. Let `ΦM_{𝒪_ℰ}` be the category of finitely generated `𝒪_ℰ`-modules `M` with
a `φ`-semilinear `φ_M` whose linearisation `φ*M → M` is an isomorphism. Then `T(M) = (𝒪̂_{ℰ^ur} ⊗_{𝒪_ℰ} M)^{φ=1}` is an exact equivalence from `ΦM_{𝒪_ℰ}` to finitely generated `ℤ_p`-modules with continuous
`G_{K∞}`-action, with quasi-inverse `V ↦ (𝒪̂_{ℰ^ur} ⊗_{ℤ_p} V)^{G_{K∞}}`, preserving ranks, `⊗` and duals.
For `𝔐` in `Mod^φ_{/𝔖}, V_𝔖(𝔐) = Hom_{𝔖,φ}(𝔐, 𝔖^ur)` is free over `ℤ_p` of rank `rk_𝔖 𝔐`, exact in `𝔐`, and
equals `Hom_{𝒪_ℰ,φ}(𝒪_ℰ ⊗_𝔖 𝔐, 𝒪̂_{ℰ^ur})`; for `𝔐 ≅ ⊕ᵢ 𝔖/p^{nᵢ}` with finite `E`-height, `Hom_{𝔖,φ}(𝔐, 𝔖^ur[1/p]/𝔖^ur) = Hom_{𝔖,φ}(𝔐, ℰ^ur/𝒪_{ℰ^ur}) ≅ ⊕ᵢ ℤ_p/p^{nᵢ}`, exact in `𝔐`. With coefficients: for a
local Artinian `ℤ_p`-algebra `A` and `V_A` free of rank `d` over `A` with continuous `G_{K∞}`-action, `M_A = (𝒪̂_{ℰ^ur} ⊗_{ℤ_p} V_A^*)^{G_{K∞}}` is free of rank `d` over `𝒪_ℰ ⊗_{ℤ_p} A`.

The setting is the Kummer frame of §R07.4.1. `K_∞/K` is strictly APF (Breuil's argument, as cited by
Kisin 2009, 1.1.12), so its field of norms is `k((u))` with `u ↦ π̃`, and `G_{K∞} ≅ Gal(k((u))^sep/k((u)))`; this and Fontaine's equivalence for a field of characteristic `p` with Cohen
ring `𝒪_ℰ` (`[Fo 1] A`.1.2.6–`A`.1.2.7, `B`.1.8.4) are §R07.4.3 and §R07.4.4. The coefficient statement is
Kisin 2008 (1.2), which cites Kisin 2009, 1.2.7(4).

*Proof sketch.* Field of norms: identify `G_{K∞}` with the absolute Galois group of `k((u)) = 𝒪_ℰ/p`,
compatibly with `𝒪_{ℰ^ur}/p = k((u))^sep` inside `Fr R` (§R07.4.3). Fontaine's equivalence for the Cohen
ring `𝒪_ℰ` of `k((u))` (§R07.4.4) gives `T`, its quasi-inverse and exactness; ranks, `⊗` and duals follow
from the comparison isomorphism `𝒪̂_{ℰ^ur} ⊗ M ≅ 𝒪̂_{ℰ^ur} ⊗ T(M)`. Torsion `V_𝔖`: the comparison
`𝔖^ur[1/p]/𝔖^ur ↔ ℰ^ur/𝒪_{ℰ^ur}` is Fontaine `B`.1.8.4, the rest Fontaine §A.1.2 (Kisin 2006, 2.1.2).
Free `V_𝔖`: pass to the limit over `𝔐/pⁿ𝔐` using the torsion case (Kisin 2006, 2.1.4). Coefficients: an
`A`-action on `V_A` gives an `𝒪_ℰ ⊗ A`-structure on `M_A` by functoriality; freeness follows from the local
criterion over the Artinian ring `A`, as in Kisin 2009, 1.2.7. (Kisin 2009, §1.1.12, p. 9: the
equivalence; Kisin 2006, §2.1.4, Corollary (2.1.4), p. 21; Kisin 2008, §1.2, p. 5: coefficients.)

*Needs:* §R07.4.1; §R07.4.2; Mathlib `Field.absoluteGaloisGroup`; §R07.4.3; §R07.4.4.

**Checks.**

- `kummerEtale_unit`: `T(𝒪_ℰ, φ) = ℤ_p` with trivial action.
- `kummerEtale_rankOne`: rank one: `M = 𝒪_ℰe` with `φ(e) = a·e, a ∈ W^×`: by Lang's theorem there is `b ∈ W(k̄)^×` with `φ(b)a = b`, so `T(M) = ℤ_p·(b ⊗ e)` and `G_{K∞}` acts through an unramified character.

### R07.4.6 Filtered `(φ, N)`-modules as `(φ, N_∇)`-modules over the open unit `disc`

Prove `phiNNablaModules`. Let `D` be an effective filtered `(φ, N)`-module over `K (Fil⁰D_K = D_K)`. Kisin
constructs `a (φ, N_∇)`-module `𝓜(D)` over `𝒪`: a finite free `𝒪`-module with `φ`-semilinear `φ` and a
differential operator `N_∇` over `−uλ·d`/du, satisfying `N_∇φ = (p/c₀)E(u)φN_∇` with `c₀ = E(0)`; and
conversely a filtered `(φ, N)`-module `D(𝓜)` from `𝓜` of finite `E`-height. `(1) coker(1 ⊗ φ : φ*𝓜(D) → 𝓜(D)) ≅ ⊕_{i≥0} (𝒪/E(u)ⁱ)^{hᵢ}` with `hᵢ = dim_K grⁱD_K`; in particular `𝓜(D)` has finite `E`-height, and
height `≤ h` iff `grⁱD_K = 0` for `i > h`. `(2) D(𝓜(D)) ≅ D` as filtered `(φ, N)`-modules. `(3) D` and `𝓜` are
exact quasi-inverse `⊗`-equivalences between effective filtered `(φ, N)`-modules and `Mod^{φ,N_∇}_{/𝒪}`.

The setting is the Kummer frame of §R07.4.1. Conventions: `HT(χ_cyc) = +1`. Kisin's functors are
contravariant: `D = Hom_{G_K}(V, B⁺_cris)` (resp. `B⁺_st`) and `V_𝔖(𝔐) = Hom_{𝔖,φ}(𝔐, 𝔖^ur)`; so `V` is
effective `(Fil⁰D_K = D_K)` iff its Hodge–Tate weights are `≥ 0`, and `V_p(μ_{p^∞}) = ℚ_p(1)` has weight
`1`. Kisin 2006's introduction uses the opposite sign in Theorem (0.1) and the paragraph before
Theorem (0.3). Filtered `(φ, N)`-modules are those of §R07.3.1.

*Proof sketch.* Construct `𝓜(D)` inside `(𝒪[ℓ_u, 1/λ] ⊗_{K₀} D)^{N=0}` from the filtration of `D_K` at the
points `π_n` (Kisin 2006, 1.2.1–1.2.2); it is finite free by Kisin's Lemma (1.1.4). Lemma (1.2.2): the
cokernel of `1 ⊗ φ` is `⊕ᵢ(𝒪/E(u)ⁱ)^{hᵢ}`, computed at the zero `π` of `E(u)` from the filtration jumps;
only the jumps `≥ 0` occur because `D` is effective. Proposition (1.2.8): recover `D` from `𝓜(D)` via `𝓜/u𝓜`
with the filtration induced by `ξ_{[0,r)}` (1.2.6). Theorem (1.2.15): essential surjectivity of `𝓜` by
(1.2.13), and exactness and `⊗`-compatibility by construction. (Kisin 2006, §1.2.2, Lemma (1.2.2), p.
6: the construction and the cokernel formula; Kisin 2006, §1.2.8, Proposition (1.2.8), p. 10:
`D(𝓜(D)) ≅ D`; Kisin 2006, §1.2.15, Theorem (1.2.15), p. 12: the equivalence.)

*Needs:* §R07.4.1; §R07.3.1.

**Checks.**

- `phiNNabla_unit`: `D = K₀` with `φ = σ, N = 0` and `Fil⁰D_K = D_K, Fil¹ = 0: 𝓜(D) = 𝒪` with `φ = φ_𝒪, E`-height `0`.
- `phiNNabla_negative_twist`: `D = K₀` with `φ = p^{−1}σ` and filtration jump `−1`
  is excluded by effectivity `(Fil⁰ = 0 ≠ D)`. Its Tate twist `D⟨−1⟩` is the weight-zero
  unit and lies in the effective category.
- `phiNNabla_cyclotomic`: `D = K₀` with `φ = pσ` and `Fil¹D_K = D_K, Fil² = 0` (the module of `ℚ_p(1)` under
  Kisin's contravariant convention): `coker(1 ⊗ φ) ≅ 𝒪/E(u), E`-height exactly `1`.

### R07.4.7 The Robba ring and `φ`-modules over it

Define `robba`, `robbaBounded`, `robbaInt` and `PhiModule.slope`. Keep the notation of §R07.4.1 (`k`
perfect, `W = W(k)`, `K₀ = W[1/p]`, `φ` acting as `σ` on coefficients and `u ↦ u^p`). For `0 < r < 1` let `ℛ_r` be the ring of Laurent series `f = Σ_{i ∈ ℤ} a_i u^i` with `a_i ∈ K₀` converging on the
annulus `r ≤ |u| < 1` (for the absolute value with `|p| = p^{−1}`). Then:

- the **Robba ring** is `ℛ = ⋃_{r < 1} ℛ_r`, the ring of germs at the boundary of the open unit
  `disc`; it contains `𝒪 = ℛ ∩ K₀⟦u⟧`, the rigid functions on the open unit `disc` of §R07.4.1;
- the **bounded Robba ring** `ℛ^b ⊂ ℛ` consists of the `f` with bounded coefficients (`sup_i |a_i| < ∞`); it is a field, the overconvergent subfield `ℰ^† = ℰ ∩ ℛ` of `ℰ = 𝒪_ℰ[1/p]`;
- `ℛ^int = ℛ^b ∩ 𝒪_ℰ` is the subring of series with coefficients in `W`; it is a henselian discrete
  valuation ring with uniformiser `p` and residue field `k((u))`, not `p`-adically complete, and the
  units of `ℛ` are exactly the nonzero elements of `ℛ^b`.

`φ` preserves `ℛ`, `ℛ^b`, `ℛ^int` and `𝒪`. A **`φ`-module** over one of these rings `A` is a finite
free `A`-module `M` with a `φ`-semilinear `φ_M` whose linearisation `φ*M → M` is an isomorphism. For
`M` of rank one over `ℛ` with `φ_M(v) = λ v`, `λ ∈ ℛ^× = (ℛ^b)^×`, the **degree** is `deg M = w(λ)`,
where `w` is the `p`-adic valuation of `ℛ^b` (`w(Σ a_i u^i) = min_i v_p(a_i)`); in general `deg M = deg Λ^{rank} M` and the **slope** is `μ(M) = deg M / rank M`. `M` is **semistable** if `μ(M′) ≥ μ(M)` for every nonzero saturated `φ`-submodule `M′`, and **pure of slope `c/d`** (`d > 0`) if it
has an `ℛ^int`-lattice on which `p^{−c} φ^d` carries some (equivalently any) basis to a basis. Pure
of slope `0` means: `M = ℛ ⊗_{ℛ^int} M^int` for an étale `φ`-module `M^int` over `ℛ^int`.

*Construction.* The rings and their basic properties are Kedlaya's `Γ_an,con`, `Γ_con[π^{−1}]` and
`Γ_con` for `K = k((u))` with `q = p`; that `ℛ^int` is a henselian discrete valuation ring and that
`ℛ^× = (ℛ^b)^×` (a nonzero element of `ℛ_r` is a unit exactly when it has no zero on the annulus,
which for germs at the boundary means that it is bounded and invertible in `ℛ^b`) are Kedlaya's
lemmas on these rings. The degree is well defined because changing the generator `v` multiplies `λ`
by `φ(c)/c` for a unit `c ∈ (ℛ^b)^×`, and `w(φ(c)) = w(c)`. The characterisation of "pure" through
lattices is Kedlaya's alternative description of isoclinic modules; his definition (all absolute
Harder–Narasimhan slopes equal) is equivalent to it and is stated as an API item. (Kedlaya 2005,
Definition 2.2.13, p. 9, and Definition 2.4.8, p. 15: the rings; Lemma 2.1.12, p. 7: henselian;
Corollary 2.5.12, p. 19: units of the annulus rings; Definition 3.1.1, p. 31: `σ`-modules;
Definition 3.4.1, p. 36: degree and slope; Definition 3.4.5, p. 37: semistability; Definition 4.6.1,
p. 52: pure (isoclinic) modules; Proposition 6.3.5, p. 65: the lattice description; Kisin 2006,
§1.3.1–§1.3.2: these rings and notions in the notation used here.)

The API:

- `robba`, `robbaBounded`, `robbaInt`: the three rings with `φ`, and the inclusions `𝒪 ⊂ ℛ`, `ℛ^int ⊂ ℛ^b ⊂ ℛ`, `ℛ^int ⊂ 𝒪_ℰ`.
- `robbaInt_isHenselian`, `robbaInt_residueField : ℛ^int/p ≅ k((u))`.
- `robba_units : ℛ^× = (ℛ^b)^×`.
- `PhiModule`, `PhiModule.deg`, `PhiModule.slope`, with `deg_tensor`, `deg_dual` and additivity of
  `deg` in short exact sequences.
- `PhiModule.IsSemistable`, `PhiModule.IsPure`, and `isPure_iff_hnSlopes`: Kedlaya's definition
  through absolute Harder–Narasimhan slopes agrees with the lattice form.
- `PhiModule.isPure_zero_iff_etale`: pure of slope `0` iff it comes from an étale `φ`-module over
  `ℛ^int`.

*Needs:* §R07.4.1; Mathlib `WittVector`; Mathlib `PowerSeries`; Mathlib `LaurentSeries`.

**Checks.**

- `PhiModule.deg_twist`: the rank-one module `ℛ e` with `φ(e) = p e` has degree `1` and is pure of
  slope `1`; with `φ(e) = u e` it has degree `0` (`u` is a unit of `ℛ^b` of valuation `w(u) = 0`),
  so it is pure of slope `0`; a definition of degree through the `u`-adic order would give `1`.
- `robba_unit_not_unit_in_O`: `u` is a unit in `ℛ` but not in `𝒪`; the slope theory lives on `ℛ`,
  not on the `disc`.
- `PhiModule.zero`: the zero module is pure of every slope and has degree `0`.
- `PhiModule.not_pure_sum`: `ℛ e₁ ⊕ ℛ e₂` with `φ = diag(1, p)` has slope `1/2` but is not pure: the
  saturated submodule `ℛ e₁` has slope `0 < 1/2`, so it is not semistable either.

### R07.4.8 Kedlaya's slope filtration theorem

Prove `kedlayaSlopeFiltration`. In the setting of §R07.4.7:

`1`. (Dieudonné–Manin over the extended Robba ring.) After base change to the extended Robba ring
   `ℛ^alg` (built in the same way from the completed algebraic closure of `k((u))` in place of
   `k((u))`), every `φ`-module is a direct sum of standard modules `M_{c,d}`: `M_{c,d}` is free on
   `e₁, …, e_d` with `φ(e_i) = e_{i+1}` for `i < d` and `φ(e_d) = p^c e₁`, for `c ∈ ℤ`, `d > 0` with `gcd(c,d) = 1`,
   of slope `c/d`.
`2`. (Slope filtration.) Every `φ`-module `M` over `ℛ` has a unique filtration `0 = M₀ ⊂ M₁ ⊂ ⋯ ⊂ M_l = M` by saturated `φ`-submodules whose successive quotients `M_i/M_{i−1}` are pure of slopes `s₁ < ⋯ < s_l`; it is the Harder–Narasimhan filtration of `M`, and it is compatible with base change
   to `ℛ^alg`.
`3`. (Descent of pure modules.) Base change is an equivalence from pure `φ`-modules of slope `s` over
   `ℛ^b` to pure `φ`-modules of slope `s` over `ℛ`, and is fully faithful into `φ`-modules over `ℰ`;
   in particular a `φ`-module over `ℛ` is semistable if and only if it is pure.

*Proof sketch.* `(1)` Over `ℛ^alg` every `φ`-module of positive rank contains an eigenvector `φ(v) = λ v` (Kedlaya's existence of eigenvectors, by successive approximation in the extended Robba ring);
comparing slopes of eigenvectors with the Harder–Narasimhan polygon and splitting extensions of
standard modules of increasing slope gives the decomposition. `(2)` The Harder–Narasimhan filtration
exists over any of these rings because slopes are bounded on saturated submodules; it is compatible
with base change to `ℛ^alg`, where it splits by `(1)`, and it descends to `ℛ` because each step is the
unique maximal submodule of minimal slope, hence Galois-stable, and its top exterior power descends
by the Bézout property of `ℛ`. `(3)` A pure module of slope `0` over `ℛ` acquires a Frobenius-stable
lattice over `ℛ^b` after a finite separable extension of `k((u))`, unique by full faithfulness,
hence Galois-stable and descending; the case `c/d` reduces to slope `0` by restriction of `φ` to
`φ^d` and a twist by `p^{−c}`. This is the full content of Kedlaya's theorem; the auxiliary results
it uses (Bézout property of `ℛ`, existence of eigenvectors over `ℛ^alg`, the calculus of slopes,
Galois descent of saturated submodules) are part of this target. (Kedlaya 2004, Theorem 4.16, p. 57:
part `1`; Theorem 6.10, p. 77: part `2`; Kedlaya 2005, Definition 4.1.1, p. 40: standard modules;
Theorem 4.5.7, p. 50: Dieudonné–Manin over `ℛ^alg`; Theorem 6.3.3, p. 64: part `3`; Theorem 6.4.1, p.
65: part `2` in the form used here; Corollary 6.4.3, p. 66: semistable equals pure; Kisin 2006,
§1.3.2, Theorem (1.3.2): the statement as used for Breuil–Kisin modules.)

The API:

- `PhiModule.standard`: `M_{c,d}`, with `standard_slope : slope M_{c,d} = c/d` and
  `standard_isPure`.
- `dieudonneManin_robbaAlg`: part `1`.
- `PhiModule.slopeFiltration`, `slopeFiltration_unique`, `slopeFiltration_eq_hn`,
  `slopeFiltration_baseChange`: part `2`.
- `PhiModule.pure_descends`: part `3`, and `isSemistable_iff_isPure`.

*Needs:* CrystallineCohomology §CR.4.7 (*Slope decomposition on the existing isocrystal carrier*);
§R07.4.7; §R07.2.15; Mathlib `WittVector`.

**Checks.**

- `standard_zero_negative`: `M_{0,1}` is the unit with `φ(e) = e`, of slope `0`;
  `M_{−1,1}` has `φ(e) = p^{−1}e`, of slope `−1`. Both are standard pure modules.
- `standard_one_two`: `M_{1,2}` (`φ(e₁) = e₂`, `φ(e₂) = p e₁`) has rank `2`, degree `1` and slope
  `1/2`, and it is pure of slope `1/2`: `p^{−1} φ²` fixes `e₁` and `e₂`. A slope read off as the
  least valuation of the entries of the matrix of `φ` would give `0`.
- `slopeFiltration_split`: for `ℛ e₁ ⊕ ℛ e₂` with `φ = diag(1, p)` the slope filtration is `0 ⊂ ℛ e₁ ⊂ M`, with slopes `0 < 1`; the order of the steps is by increasing slope.
- `slopeFiltration_pure`: for a pure module the filtration has one step.
- `pure_descends_zero`: `ℛ e` with `φ(e) = u e` descends to `ℛ^b` (it is already defined there) and
  is pure of slope `0`; `ℛ e` with `φ(e) = p e` does not descend to an étale module over `ℛ^int`.

### R07.4.8a Rational-fibre monodromy

Define `KisinRationalMonodromy` on a finite-height Kisin module `𝔐`: it is a
`K₀`-linear endomorphism `N₀` of `D₀=(𝔐/u𝔐)[1/p]` satisfying
`N₀φ₀=pφ₀N₀`, with `φ₀` induced by `φ`. No integral preservation of `𝔐/u𝔐`
is required. The category `Mod^{φ,N}_{/𝔖}` has these objects and Kisin morphisms whose
rational fibres commute with `N₀`. On the disc use the same definition on `𝓜/u𝓜`;
base change `𝔐↦𝒪⊗_𝔖𝔐` identifies these rational fibres and their `φ₀,N₀`.
Prove functoriality, tensor and dual compatibility wherever the underlying finite-height
categories admit those operations. Distinguish `N₀` from a disc differential operator `N_∇`,
which satisfies the Leibniz rule for `−uλ d/du` and reduces to `N₀` at zero.
(Conrad, Definition 2.4.4 and Remark 2.4.5, p.18; Kisin 2006, §1.3.10.)

*Needs:* §R07.4.1; §R07.4.2; §R07.4.6.

**Checks.**

- The unit Kisin module has `D₀=K₀`, `φ₀=σ` and `N₀=0`.
- For `K=ℚ_p`, `E=u−p`, take `φe₁=e₁`, `φe₂=(p−u)e₂`,
  `N₀e₂=p⁻¹e₁`, `N₀e₁=0`. The height is at most one and
  `N₀φ₀=pφ₀N₀`, but `N₀` does not preserve the integral fibre.
- The underlying identity between this example and the same `φ`-module with `N₀=0`
  is not a monodromy morphism. Base change to `𝒪` retains this distinction.

### R07.4.9 Weak admissibility is slope `0` over the Robba ring

Prove `weaklyAdmissibleSlopeZero`. Let `D` be an effective filtered `(φ, N)`-module over `K` and `𝓜(D)` its
`(φ, N_∇)`-module over `𝒪`. Then `D` is weakly admissible iff `𝓜(D) ⊗_𝒪 ℛ` is pure of slope `0` in Kedlaya's
sense, `ℛ` being the Robba ring (the germs at the boundary of functions on annuli `(r, 1)`).
Consequently (Kisin 2006, 1.3.13) `𝔐 ↦ 𝔐 ⊗_𝔖 𝒪` is an exact tensor equivalence of effective categories from `(φ, N)`-modules over `𝔖` of finite `E`-height, up to isogeny, to the `(φ, N)`-modules over `𝒪` of finite `E`-height
whose base change to `ℛ` is pure of slope `0`.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*. The Robba ring and slopes are §R07.4.7, and Kedlaya's slope filtration
with the descent of pure modules to `ℛ^b` is §R07.4.8; the auxiliary lemmas Kisin quotes from
Kedlaya 2004 (Lemma 4.1, Propositions 4.4, 4.5, 5.13 and 6.5) are steps of that target.

*Proof sketch.* Rank one: for `D = K₀e` with `φ(e) = αe, 𝓜(D) = λ^{−t_H(D)}·𝒟₀`, and its slope is `v_p(α) − t_H(D) = t_N(D) − t_H(D)` (Kisin 2006, 1.3.8, first part). The slope filtration of `𝓜(D) ⊗ ℛ`
(Kedlaya) descends to a filtration of `𝓜(D)` by saturated, `φ`- and `N_∇`-stable submodules (Kisin 2006,
1.3.3–1.3.7). Hence subobjects of `D` correspond to saturated submodules of `𝓜(D)`, and the slope of the
top exterior power computes `t_N − t_H: D` is weakly admissible iff all slopes vanish (Kisin 2006,
1.3.8). (1.3.13): a pure slope `0` module over `ℛ` descends to `ℛ^b`, whose integral lattice glues with `𝓜`
to a finite free `𝔖[1/p]`-module; `φ`-stability and finite `E`-height are read off on `𝒪`. (Kisin 2006,
§1.3.8, Theorem (1.3.8), p. 17: the theorem; Kisin 2006, §1.3.2, Theorem (1.3.2), p. 14: Kedlaya's
slope filtration, as quoted by Kisin.)

*Needs:* §R07.4.6; §R07.3.2; §R07.4.7; §R07.4.8; §R07.4.8a.

**Checks.**

- `waSlopeZero_rankOne`: the rank-one module `𝓜(K₀e, φ = pσ, Fil¹ = D) (t_N = t_H = 1)` is pure of
  slope `0`; the same module with `Fil⁰ = D, Fil¹ = 0` has `t_H = 0 ≠ 1 = t_N` and slope `1`.
- `waSlopeZero_dual_boundary`: the height-one object of `ℚ_p(1)` is effective, while its
  tensor dual has filtration jump `−1` and is outside the effective category.
- `waSlopeZero_rankTwo`: `K = K₀, D = K₀e₁ ⊕ K₀e₂` with `φ = diag(σ, pσ)`: with `Fil¹D = K₀(e₁ + e₂)` (and
  `Fil² = 0`) `D` is weakly admissible, so `𝓜(D)` is pure of slope `0`; with `Fil¹D = K₀e₁` the line `K₀e₁` has
  `t_H = 1 > 0 = t_N`, so `𝓜(D)` is not pure of slope `0`.

### R07.4.10 Kisin's embedding of weakly admissible modules into Kisin modules up to isogeny

Prove `kisinCrystallineEmbedding`. There is a fully faithful `⊗`-functor `D ↦ 𝔐(D)` from effective
weakly admissible filtered `(φ, N)`-modules over `K` to `Mod^{φ,N}_{/𝔖} ⊗ ℚ_p` (`(φ, N)`-modules over `𝔖` of
finite `E`-height up to isogeny), with `𝔐(D) ⊗_𝔖 𝒪 ≅ 𝓜(D)`. For `𝔐` in `Mod^{φ,N}_{/𝔖}` and `𝓜 = 𝔐 ⊗_𝔖 𝒪`, the
module `𝓜[1/(uλ)]` carries a canonical connection into ordinary `K₀`-differentials,
with Frobenius horizontality. It has residue `−N₀` at zero. The object `𝔐` is in the
essential image iff this connection has at most simple poles on `𝓜` at the zeros of `uλ`,
equivalently its associated `N_∇` preserves `𝓜`. On crystalline representations `(N = 0)` this gives a fully
faithful embedding of crystalline `G_K`-representations with Hodge–Tate weights `≥ 0` into `Mod^φ_{/𝔖} ⊗ ℚ_p`, which is not essentially surjective.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*.

*Proof sketch.* By (1.3.8) and (1.2.15), `D ↦ 𝓜(D)` is an equivalence from effective weakly admissible
modules to `(φ, N_∇)`-modules over `𝒪` of slope `0` (Kisin 2006, 1.3.15, proof). By (1.3.10), forgetting
`N_∇` to `N = N_∇ mod u` is fully faithful onto the modules stable under the operator `N_∇` on `𝓜[1/λ]`, and
every rank-one object is in the image. By (1.3.13), `(φ, N)`-modules over `𝒪` of slope `0` are the base
changes of `Mod^{φ,N}_{/𝔖} ⊗ ℚ_p`; compose. The image criterion: `∇(m) = −λ⁻¹N_∇(m)·du/u`, and
`N_∇`-stability of `𝓜` inside `𝓜[1/(uλ)]` is the simple-pole condition on `∇` (Kisin 2006, 1.3.15, end of proof).
Crystalline case: `V ↦ D = Hom_{G_K}(V, B⁺_cris)`, effective iff weights `≥ 0`, with `N = 0` (Kisin 2006,
Theorem 0.1, read with `HT(χ) = +1`). (Kisin 2006, §1.3.15, Corollary (1.3.15), p. 19: the functor;
Kisin 2006, Introduction, Theorem (0.1), p. 2: crystalline case.)

*Needs:* §R07.4.6; §R07.4.8a; §R07.4.9; §R07.4.2; §R07.3.2; §R07.3.3.

**Checks.**

- `kisinEmbedding_rankOne`: `ℚ_p ↦ (𝔖, φ)` and `ℚ_p(1) ↦ (𝔖e, φ(e) = a·E(u)e)` up to isogeny, with `a ∈ W^×` fixed by the normalisation (`E(0)/p` is a unit of `W`); `E`-heights `0` and `1`.
- For the height-one rational-monodromy example of §R07.4.8a, `λ(0)=1` but the
  residue is `−N₀≠0`. Inverting `λ` alone therefore does not give a connection into
  ordinary differentials; inverting `uλ` does (Conrad, equation (2.4.6), p.21).
- `kisinEmbedding_not_surjective`: the embedding is not essentially surjective (Kisin 2006,
  introduction): its image is cut out by the logarithmic-pole condition on `∇`.

### R07.4.11 Full faithfulness of `𝔐 ↦ 𝒪_ℰ ⊗ 𝔐`

Prove `kisinEtaleFullFaithfulness`. The functor `Mod^φ_{/𝔖} → ΦM_{𝒪_ℰ}, 𝔐 ↦ 𝒪_ℰ ⊗_𝔖 𝔐`, is fully
faithful. Equivalently, the contravariant functor `𝔐 ↦ V_𝔖(𝔐)` from `Mod^φ_{/𝔖}` to free `ℤ_p`-modules
with continuous `G_{K∞}`-action is fully faithful. Auxiliary statements: (2.1.9) a morphism of
`Mod^φ_{/𝔖}` that becomes an isomorphism over `𝒪_ℰ` is an isomorphism; (2.1.10) for `𝔐` of rank `d, Hom_{ℤ_p[G_{K∞}]}(V_𝔖(𝔐), 𝔖^ur)` is free of rank `d` over `𝔖` and contains `𝔐`.

The setting is the Kummer frame of §R07.4.1. The proof printed in Kisin 2006 has a gap in the
general case (Conrad), repaired in Kisin 2008, Errata `(E.4)`; this target uses the repaired argument.

*Proof sketch.* `F(𝔐) := (𝒪_ℰ ⊗_𝔖 𝔐) ∩ 𝔐[1/p]` is finite free, `φ`-stable and of finite `E`-height, and
contains `𝔐` (as in Kisin 2006, 1.3.13). (2.1.9): reduce to rank one by determinants; over `𝒪` both
sides come from filtered `(φ, N)`-modules (1.3.13, 1.3.10), the induced map is nonzero hence an
isomorphism (1.2.15), so `h` is multiplication by `pⁱ` in suitable bases, and `i = 0` because `h` is an
isomorphism over `𝒪_ℰ`. (2.1.10): `𝔐′ = Hom_{G_{K∞}}(V_𝔖(𝔐), 𝔖^ur)` is `p`-adically separated and torsion
free, and `𝔐′/p𝔐′` embeds in a free `k⟦u⟧`-module of rank `≤ d` (Fontaine `A`.1.2.7), so `𝔐′` is a quotient of
`𝔖^d`; it contains `𝔐`, so it is free of rank `d`. Identity case: if `𝒪_ℰ ⊗ 𝔐₁ = 𝒪_ℰ ⊗ 𝔐₂`, both lie in `𝔐′`
(2.1.10), `𝔐₃ = 𝔐₁ + 𝔐₂` is finite, `φ`-stable, of finite `E`-height, and `𝔐₁ → F(𝔐₃) ← 𝔐₂` are isomorphisms
by (2.1.9), so `𝔐₁ = 𝔐₂`. General `h : 𝒪_ℰ ⊗ 𝔐₁ → 𝒪_ℰ ⊗ 𝔐₂` (Errata `E`.`4`): replace `𝔐₂` by `𝔐₁ ⊕ 𝔐₂` and `h` by
its graph, so `h` is injective; `V_𝔖(𝔐₂) → V_𝔖(𝔐₁)` is surjective (2.1.4), so `𝔐₁, 𝔐₂ ⊆ Hom_{G_{K∞}}(V_𝔖(𝔐₂), 𝔖^ur)` by (2.1.10); `𝔐₃ = 𝔐₁ + 𝔐₂` has rank `d, F(𝔐₃) ⊗ 𝒪_ℰ ≅ 𝒪_ℰ ⊗ 𝔐₂`, so `F(𝔐₃) = 𝔐₂` by (2.1.9), and `𝔐₁ ⊆ 𝔐₂`. (Kisin 2006, §2.1.12, Proposition (2.1.12), p. 23: the proposition;
Kisin 2008, Errata for `[Ki 2], (E.4)`, p. 34: the gap and its repair.)

*Needs:* §R07.4.2; §R07.4.5; §R07.4.10.

**Checks.**

- `kisinEtaleFF_rankOne`: if `(p − 1) ∤ e`, there is no nonzero `φ`-map `𝒪_ℰe → 𝒪_ℰe′` with `φ(e) = E(u)e`
  and `φ(e′) = e′`: it would send `e` to `a·e′` with `φ(a) = E(u)a`, and after dividing a by a power of `p`,
  reduction to `k((u))` gives `(p − 1)·v_u(ā) = e`. So `Hom` in `Mod^φ_{/𝔖}` vanishes as well.
- `kisinEtaleFF_faithful`: faithfulness is visible directly: `𝔐 ⊂ 𝒪_ℰ ⊗ 𝔐` because `𝔐` is free and `𝔖 ⊂ 𝒪_ℰ`.

### R07.4.12 `𝔖`-lattices of finite `E`-height: uniqueness, existence and all `G_{K∞}`-stable lattices

Prove `finiteHeightLattices`. Let `M` be an étale `φ`-module over `𝒪_ℰ` of rank `d`. An `𝔖`-lattice of
`E`-height `≤ h` in `M` is a finite free `φ`-stable `𝔖`-submodule `𝔐` of rank `d` spanning `M` with `coker(φ*𝔐 → 𝔐)`
killed by `E(u)^h`. `(1) M` contains at most one `𝔖`-lattice of finite `E`-height. `(2)` If `𝔐 ∈ Mod^φ_{/𝔖}, V = V_𝔖(𝔐) ⊗ ℚ_p` and `𝓜 = ℰ ⊗_𝔖 𝔐`, then `𝔑 ↦ V_𝔖(𝔑)` is a bijection between finite free `φ`-stable
`𝔖`-submodules `𝔑 ⊂ 𝓜` of finite `E`-height with `ℰ ⊗ 𝔑 = 𝓜` and `G_{K∞}`-stable `ℤ_p`-lattices in `V`; the
inverse sends `L` to `𝒩 ∩ 𝔐[1/p], 𝒩` the étale lattice of `L`. `(3)` If one `G_{K∞}`-stable lattice in `V` has
`E`-height `≤ h`, every one does. With coefficients (Kisin 2008, 1.2): for `V_A` free over a local
Artinian `A, 𝔖_B`-lattices of `E`-height `≤ h` in `M_B = M_A ⊗_A B` are finite projective `𝔖_B`-submodules of
rank `d` spanning `M_B, φ`-stable with cokernel killed by `E(u)^h`, and they are stable under base change
`B → B′`.

The setting is the Kummer frame of §R07.4.1.

*Proof sketch.* `(1)` Two such lattices `𝔐, 𝔐′` give the identity of `M = 𝒪_ℰ ⊗ 𝔐 = 𝒪_ℰ ⊗ 𝔐′`, which by
full faithfulness (2.1.12) comes from mutually inverse maps `𝔐` ⇄ `𝔐′`, so `𝔐 = 𝔐′` (Kisin 2008, 1.2,
citing 2.1.12). `(2)` Étale `𝒪_ℰ`-lattices in `𝓜` correspond to `G_{K∞}`-stable lattices (Fontaine `A`.1.2.7);
given `𝒩, 𝔑 = 𝒩 ∩ 𝔐[1/p]` is finite free, `φ`-stable, of finite `E`-height with `𝒪_ℰ ⊗ 𝔑 = 𝒩` (as in
1.3.13), and injectivity follows from (2.1.4) and (2.1.9) (Kisin 2006, 2.1.15). `(3)`, derived here
(Kisin 2008, 1.2, asserts it citing 2.1.15): let `𝔐` have height `≤ h` and `𝔑 = 𝒩 ∩ 𝔐[1/p]`. For `x ∈ 𝔑, E(u)^h x` lies in `(1 ⊗ φ)(φ*𝔐[1/p])` and, `E(u)` being a unit of `𝒪_ℰ`, in `(1 ⊗ φ)(φ*𝒩)`. Since `1 ⊗ φ` is
injective on `φ*𝓜` and `φ` is flat on `𝔖`, the preimage lies in `φ*𝔐[1/p] ∩ φ*𝒩 = φ*(𝔐[1/p] ∩ 𝒩) = φ*𝔑`. Coefficients: `𝒪_ℰ ⊗_𝔖 𝔐_B ⊗_B B′` is projective of rank `d` over `𝒪_ℰ ⊗ B′` and surjects onto
`M_{B′}`, hence is isomorphic to it (Kisin 2008, 1.2). (Kisin 2006, §2.1.15, Lemma (2.1.15), p. 24:
part `(2)`; Kisin 2008, §1.2, p. 4: part `(1)`.)

*Needs:* §R07.4.11; §R07.4.5.

**Checks.**

- `finiteHeightLattices_unique`: `M = (𝒪_ℰ, φ)`: the lattice `u𝔖` is `φ`-stable, but the image of `1 ⊗ φ` on
  it is `u^p𝔖 = u^{p−1}·(u𝔖)`, and `𝔖/u^{p−1}` is killed by no power of `E(u) (E(0) ≠ 0)`; only `𝔖` has
  finite `E`-height, as uniqueness requires.
- `finiteHeightLattices_zero`: the zero étale module has the unique zero `𝔖`-lattice,
  corresponding to the unique lattice of the zero representation.
- `finiteHeightLattices_cyclotomic`: `ℚ_p(1)`: the `G_{K∞}`-stable lattices `pⁿℤ_p(1)` correspond, reversing
  inclusions, to `p^{−n}𝔖e ⊂ ℰe`, all of `E`-height `1`. These embeddings come from the
  contravariant `Hom` pairing.

### R07.4.13 Semistable representations have finite `E`-height; weakly admissible implies admissible

Prove `semistableFiniteHeight`. Let `D` be an effective weakly admissible filtered `(φ, N)`-module over
`K` and `𝔐 ∈ Mod^{φ,N}_{/𝔖}` a lattice in `𝔐(D)` (the image of `D` under Kisin's embedding). Then there is a
canonical `G_{K∞}`-equivariant bijection `Hom_{𝔖,φ}(𝔐, 𝔖^ur) ⊗ ℚ_p ≅ Hom_{Fil,φ,N}(D, B⁺_st)`; both
sides have dimension `dim_{K₀} D`, and `D` is admissible. Consequently: `(a)` weakly admissible filtered
`(φ, N)`-modules are admissible (Colmez–Fontaine; Kisin's proof); `(b)` if `V` is semistable with
Hodge–Tate weights in `[0, h]`, every `G_{K∞}`-stable lattice of `V` has `E`-height `≤ h`, and the filtered
`(φ, N)`-module `D*_st(V)` is recovered from its `𝔖`-lattice by `D(𝔐 ⊗ 𝒪)`.

Here `D*_st(V) = D_st(V^∨) = Hom_{G_K}(V, B_st)`, with its effective
`B⁺_st` realization for weights in `[0,h]`.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*.

*Proof sketch.* Put `𝓜 = 𝔐 ⊗_𝔖 𝒪` and identify `D` with `D(𝓜)` (1.2.8). The inclusion `𝔖 ⊂ B⁺_cris` extends
continuously to `𝒪`, sending `E(u)` into `Fil¹B⁺_cris` (Kisin 2006, 2.1.5, proof). Compose `𝔐 → 𝔖^ur ⊂ W(R)`
with `φ` and the maps (2.1.6)–(2.1.8) to get a `G_{K∞}`-equivariant injection `Hom_{𝔖,φ}(𝔐, 𝔖^ur) ⊗ ℚ_p → Hom_{Fil,φ,N}(D, B⁺_st)`. The left side has dimension `d = dim D` (2.1.4), and the right side has
dimension `≤ d` (§R07.3.3, part `3`), so the map is a bijection and `D` is admissible. `(b): D = D*_st(V)` is
effective with `grⁱD_K = 0` for `i > h`, so `coker(1 ⊗ φ)` on `𝓜(D) = ⊕_{i≤h}(𝒪/E(u)ⁱ)^{hᵢ}` is killed by
`E(u)^h` (1.2.2). The cokernel `C` of `1 ⊗ φ` on `𝔐` is killed by a power of `E(u)`, so `C ⊗_𝔖 𝒪 = C[1/p]`, and
`E(u)^h C[1/p] = 0`. The lattice `𝒩 ∩ 𝔐[1/p]` of any `G_{K∞}`-stable lattice then has `E`-height `≤ h` by the
argument of §R07.4.12 `(3)` (Kisin 2008, 2.5.5, cites 1.2.2 and 2.1.5 for this). (Kisin 2006, §2.1.5,
Proposition (2.1.5), p. 21: hypotheses of the proposition; Kisin 2006, Introduction, p. 2:
consequence `(a)`; Kisin 2008, §2.5, proof of Theorem (2.5.5), p. 19: consequence `(b)`.)

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.4.10; §R07.4.12; §R07.4.6; §R07.3.3;
PadicPeriodRings §§4.1–4.3
(`B_st`, `D_st`).

**Checks.**

- `semistableFiniteHeight_cyclotomic`: `V = ℚ_p(1): D` has its only jump in degree `1`, and every
  lattice has `E`-height exactly `1`.
- `semistableFiniteHeight_weight_two`: `V = ℚ_p(2)` (weight `2, h = 2`): `E`-height `2`, not `≤ 1`, so `ℚ_p(2)`
  is not Barsotti–Tate.
- `semistableFiniteHeight_tate_curve`: `V_p(E_q)` of a Tate curve is semistable and not crystalline
  (`N ≠ 0`), with weights `0, 1`; its lattices have `E`-height `≤ 1`, so finite height does not
  detect crystallinity.

### R07.4.14 Restriction from `G_K` to `G_{K∞}` is fully faithful on crystalline representations

Prove `crystallineRestrictionFullFaithfulness`. The functor `Rep^cris_{G_K} → Rep_{G_{K∞}}`
restricting a crystalline representation of `G_K` on a finite-dimensional `ℚ_p`-vector space to `G_{K∞} = Gal(K̄/K(π_n : n ≥ 0))` is fully faithful (Breuil's conjecture).

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*.

*Proof sketch.* Twisting by a power of `ℚ_p(1)` reduces to `Rep^{cris,+}_{G_K}`, the crystalline
representations with Hodge–Tate weights `≥ 0` (Kisin 2006, 2.1.14, proof). Square of functors:
`Rep^{cris,+} → Mod^φ_{/𝔖} ⊗ ℚ_p` (`D*_cris` followed by (1.3.15), fully faithful), `Mod^φ_{/𝔖} ⊗ ℚ_p → ΦM_{𝒪_ℰ} ⊗ ℚ_p` (2.1.12, fully faithful), `ΦM_{𝒪_ℰ} ⊗ ℚ_p → Rep_{G_{K∞}}` (Fontaine, an equivalence).
The square commutes up to natural isomorphism with restriction to `G_{K∞}` by (2.1.5); the other three
sides are fully faithful, so restriction is fully faithful. (Kisin 2006, §2.1.14, Corollary
(2.1.14), p. 24: the corollary; Kisin 2006, Introduction, Theorem (0.2), p. 2: theorem (0.2).)

*Needs:* §R07.4.10; §R07.4.11; §R07.4.13; §R07.4.5.

**Checks.**

- `crystallineRestriction_cyclotomic`: `ℚ_p` and `ℚ_p(1): Hom_{G_K}(ℚ_p, ℚ_p(1)) = 0`, so by the theorem
  `Hom_{G_{K∞}}(ℚ_p, ℚ_p(1)) = 0` as well, i.e. `K_∞` does not contain `μ_{p^∞}`.
- `crystallineRestriction_needs_crystalline`: the crystalline hypothesis is needed: if `μ_p ⊂ K`, then
  `K(π₁)/K` is Galois and totally ramified of degree `p`, and the permutation representation
  `ℚ_p[Gal(K(π₁)/K)]` is trivial on `G_{K∞}` but not on `G_K`; it is ramified, hence not crystalline.
- For `V = ℚ_p(1)`, the effective `D*_cris(V)` has `φ = pσ` and filtration jump `1`;
  covariant `D_cris(V)`, with jump `−1`, cannot be used in the positive-weight square.

### R07.4.15 Breuil–Kisin modules with torsion and their structure

Prove `bkModuleStructure`. A Breuil–Kisin module is a finitely generated `𝔖`-module `M` with an
isomorphism `φ_M : (𝔖 ⊗_{φ,𝔖} M)[1/E] ≅ M[1/E]`; with the obvious morphisms these form an abelian
`⊗`-category containing Kisin's finite free modules of finite `E`-height (§R07.4.2). Every Breuil–Kisin
module sits in a canonical exact sequence of Breuil–Kisin modules `0 → M_tor → M → M_free → M̄ → 0`,
where `M_tor` is the torsion submodule and is killed by a power of `p, M_free` is finite free over `𝔖`,
and `M̄` is killed by a power of `(p, u)`. In particular `M[1/p] ≅ M_free[1/p]` is finite free over
`𝔖[1/p]`. The Breuil–Kisin twist `𝔖{1} = lim_r (𝔖/E_r){1}` is a rank-one Breuil–Kisin module, and `M{n} = M ⊗ 𝔖{1}^{⊗n}`.

The setting is the Kummer frame of §R07.4.1. `𝔖` is a two-dimensional regular local ring; the Iwasawa
classification of finitely generated `𝔖[1/p]`-modules is used for the torsion bound.

*Proof sketch.* `M′ = M/M_tor` is torsion-free, hence locally free on the punctured spectrum `Spec 𝔖 ∖ {s}`; `M_free = H⁰(Spec 𝔖 ∖ {s}, M′)` is finite free (`𝔖` regular of dimension two) and `M′ → M_free` is
injective with cokernel supported at `s` (BMS, Proposition 4.3, proof). Functoriality gives Frobenii
on all terms. `M_tor` is killed by a power of `p`: for a nonzero Fitting ideal `I, φ`-stability gives
`(𝔖/I)[1/E] = (𝔖/φ*I)[1/E]`; by the Iwasawa classification the zeros of `I[1/p]` in the open unit `disc`
would form a `φ`-stable finite set accumulating at the boundary unless empty. (Bhatt–Morrow–Scholze
2018, §4.1, Definition 4.1, p. 31; Proposition 4.3 and its proof, p. 32 (arXiv:1602.03148v3):
Breuil–Kisin modules as finitely generated `𝔖`-modules with `φ_M` an isomorphism after inverting `E`, and
the structure sequence `0 → M_tor → M → M_free → M̄ → 0`; Bhatt–Morrow–Scholze 2018, §4.1, Example 4.2
(the Tate twist) and the construction of `𝔖{1}`, pp. 31–32: the Breuil–Kisin twist.)

*Needs:* §R07.4.1; §R07.4.2; Mathlib `IsRegularLocalRing`; Mathlib `Module.Free`.

**Checks.**

- `bkModule_torsion`: `M = 𝔖/p` with `φ_M` induced by `φ` is a Breuil–Kisin module with `M_tor = M, M_free = 0, M̄ = 0`.
- `bkModule_ideal`: `M = (p, u) ⊂ 𝔖` with `φ` restricted: `M_free = 𝔖` and `M̄ = 𝔖/(p, u) = k`, which shows
  `M̄ ≠ 0` can occur.
- `bkModule_ainf`: the analogous statement over `A_inf` fails without assuming `M[1/p]` free, which is
  why Breuil–Kisin–Fargues modules are defined with that hypothesis.

### R07.4.16 Kisin's functor on crystalline lattices of all weights

Prove `bmsKisinFunctor`. There is a natural fully faithful `⊗`-functor `T ↦ 𝔐(T)` from `ℤ_p`-lattices `T` in
crystalline `G_K`-representations `V` (any Hodge–Tate weights) to finite free Breuil–Kisin modules
in the sense of §R07.4.15, with meromorphic Frobenius. It is characterised by a `φ`- and
`G_{K∞}`-equivariant identification
`𝔐(T) ⊗_{𝔖,ι₁} W(C^♭) ≅ T ⊗_{ℤ_p} W(C^♭)`. The functor is not exact. Moreover,
`𝔐(T) ⊗_{𝔖,ι₁} A_inf[1/µ] ≅ T ⊗_{ℤ_p} A_inf[1/µ]`, and
`𝔐(T) ⊗_{𝔖,β₁} B⁺_cris = D_cris(V) ⊗_{K₀} B⁺_cris`
inside `𝔐(T) ⊗_{𝔖,β₁} B_cris = T ⊗_{ℤ_p} B_cris`. Consequently
`𝔐(T) ⊗_{𝔖,ε₁} W(k)[1/p] = D_cris(V)`, and
`𝔐(T) ⊗_{𝔖,ε₁} W(k)` is its natural lattice. The functor sends `ℤ_p(1)` to `𝔖{1}`.
The tensor products of `D_cris(V)` over `K₀` use the usual coefficient inclusion.

The setting is the Kummer frame of §R07.4.1. `D_cris` and crystalline representations are those of
PadicPeriodRings §§4.1–4.3, with finite-`K` comparison in §R07.3.0 extending §R07.P5. Fix the coefficient inclusion `W(k) → A_inf`
and the compatible roots `π^♭`. Include `kisinPeriodScalarMaps` with these named ring maps:

- `ι₀ : 𝔖 → A_inf` uses the coefficient inclusion and sends `u` to `[π^♭]`.
- `ι₁ = φ_Ainf ∘ ι₀ = ι₀ ∘ φ_𝔖` uses `σ` on coefficients and sends `u` to `[π^♭]^p`.
- `βᵢ : 𝔖 → B⁺_cris` is `ιᵢ` followed by the period inclusion, for `i = 0,1`;
  the same label denotes its composite into `B_cris`.
- `ε₀ : 𝔖 → W(k)` is evaluation at `u = 0` with identity on coefficients;
  `ε₁ = σ ∘ ε₀` uses `σ` on coefficients. The residue specializations of `ιᵢ` and `βᵢ`
  to `W(k̄)` and `W(k̄)[1/p]` are the corresponding `εᵢ` followed by coefficient inclusion.

All comparisons above use the index-one maps, including the composite `ι₁` into `W(C^♭)`.
Write `θ̃ = θ ∘ φ_Ainf^{−1}`; `θ ∘ ι₀` and `θ̃ ∘ ι₁` are the same evaluation `u ↦ π`,
and `ι₀(E)` and `ι₁(E)` generate `ker θ` and `ker θ̃` respectively. Include
`bkPeriodScalarAdapter` with two distinct transports. For `Lᵢ = 𝔐 ⊗_{𝔖,ιᵢ} A_inf`,
scalar Frobenius gives a `φ_Ainf`-semilinear bijection `L₀ → L₁, m ⊗ a ↦ m ⊗ φ(a)`.
It extends to a semilinear isomorphism from `L₀[1/µ]` to `L₁[1/φ(µ)]` and to the
`W(C^♭)`-base changes. On the completions of `A_inf[1/p]` at `ker θ` and `ker θ̃` it
identifies the respective ideal-power filtrations. It does not identify these two divisors
inside a single fixed `θ`-filtered period ring.

Separately, linearised module Frobenius gives an `A_inf`-linear isomorphism
`L₁[1/ι₀(E)] ≅ L₀[1/ι₀(E)]`. For effective modules its unlocalised map sends
`m ⊗ a` to `φ_𝔐(m) ⊗ a`; for arbitrary weights it is defined only meromorphically.
After `βᵢ`-base change the same linearisation identifies the two `B⁺_cris`-base changes
upon inverting `β₀(E)`; no unlocalised `B⁺_cris` lattice identification is asserted.
For `εᵢ` it identifies the two `W(k)[1/p]`-base changes, since `ε₀(E)` is a unit times `p`;
scalar `σ` also gives the semilinear transport `m ⊗ a ↦ m ⊗ σ(a)` between their
integral `W(k)`-base changes. Scalar transport respects the specified specialization kernels;
the module-Frobenius adapter requires the stated localizations.

This is a covariant functor on lattices. After `T ↦ T^∨`, its restriction to `T = T_p(G)`
with weights in `[0,1]` gives the contravariant group functor of §R07.4.21:
`𝔐(G) = 𝔐(T_p(G)^∨)`. The effective module in §§R07.4.13–R07.4.17 is `D*_cris(V)`,
whereas the comparisons displayed here use the covariant `D_cris(V)`.

*Proof sketch.* Existence and the `W(C^♭)`-identification: Kisin's construction (§R07.4.10,
§R07.4.12), as stated in Kisin, Integral models, Theorem 1.2.1. Uniqueness: by Kisin 2006, 2.1.12,
it suffices to compare after base change to the `p`-adic completion of `𝔖[1/u]`, where it follows from
the étale `φ`-module equivalence (§R07.4.4) and full faithfulness of restriction to `G_{K∞}` (§R07.4.14)
(BMS, proof of Theorem 4.4). The `B⁺_cris` comparison: Kisin's construction starts from `D_cris(V) ⊗ 𝒪`
on a rigid open of the `disc` (Kisin 2006, Lemma 1.2.6) (BMS, Proposition 4.34). Non-exactness: the
extension of a vector bundle from the punctured spectrum of `𝔖` is not exact. (Bhatt–Morrow–Scholze
2018, §4.1, Theorem 4.4 with its proof and Remark 4.5, pp. 33–34; Corollary 4.33 and Proposition
4.34, p. 44 (arXiv:1602.03148v3): the all-weight Kisin functor on crystalline lattices, its
characterisation, the `A_inf` and `B⁺_cris` comparisons and the image of `ℤ_p(1)`;
§4.4, Lemma 4.30 and Proposition 4.32, pp. 43–44: the `σ`-twisted scalar map and
its Eisenstein divisor. The scalar adapters follow from ring Frobenius on `A_inf` and
the meromorphic linearisation of Definition 4.1.)

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.4.10; §R07.4.12; §R07.4.14; §R07.4.4; §R07.4.15;
§R07.P5
(`dCris`, `IsCrystalline`); PadicPeriodRings §§1–2 and §R07.P2 (`A_inf`, `aCris`).

**Checks.**

- `bmsKisin_twist`: `T = ℤ_p(1): 𝔐(T) = 𝔖{1}` and
  `𝔖{1} ⊗_{𝔖,ι₁} A_inf = A_inf{1} = µ^{−1}(ℤ_p(1) ⊗_{ℤ_p} A_inf)`
  (BMS Corollary 4.33). Under the `W(C^♭)`-comparison transported by inverse scalar
  Frobenius, the `ι₀` Tate lattice is `φ^{−1}(µ)^{−1}(ℤ_p(1) ⊗_{ℤ_p} A_inf)`;
  the scalar adapter takes it to the displayed `µ^{−1}` lattice at `ι₁`. `T = ℤ_p` gives `𝔖`.
- For `K = ℚ_p, π = p` and `E(u) = u−p, θ(ι₀(E)) = 0` whereas
  `θ(ι₁(E)) = p^p−p ≠ 0`; `θ̃(ι₁(E)) = 0`. Thus the scalar maps cannot be
  interchanged in an integral filtered comparison.
- `bmsKisin_height`: for `T = ℤ_p(−2)`, with covariant filtration jump `2`, the effective
  `𝔐(T)` has `E`-height `2`, so the all-weight functor does not factor through `p`-divisible groups.
  For `ℤ_p(2)` its Frobenius is meromorphic rather than an effective height-one endomorphism.
- For `V = ℚ_p(1), 𝔐(V)`'s `ε₁`-specialization has covariant `φ = p^{−1}σ` and jump `−1`;
  `D*_cris(V)` has `φ = pσ` and jump `1`. Applying the functor to `T_p(μ_{p^∞})^∨`
  gives the effective height-one group module. The `ε₀` and `ε₁` rational specializations
  are related by linearised Frobenius; the `ε₁` lattice supplies the stated `D_cris` comparison.

### R07.4.17 Weakly admissible modules of Barsotti–Tate type and `BT^φ_{/𝔖} ⊗ ℚ_p`

Prove `btTypeEquivalence`. A weakly admissible filtered `φ`-module `D` over `K` is of Barsotti–Tate type
if `grⁱD_K = 0` for `i ≠ 0, 1`. The functor of (1.3.15) restricts to an exact equivalence between weakly
admissible modules of Barsotti–Tate type and `BT^φ_{/𝔖} ⊗ ℚ_p`. With `HT(χ) = +1` these are the
`D*_cris(V) = D_cris(V^∨)`
of crystalline representations with Hodge–Tate weights in `{0, 1}`.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*.

*Proof sketch.* For `𝔐 ∈ BT^φ_{/𝔖}`, the module `𝔐 ⊗ 𝒪` lies in `BT^φ_{/𝒪}` (`N = 0`, cokernel killed by
`E(u)`); it is pure of slope `0` by (1.3.8) and (1.2.15), and `N_∇ = 0 mod u`, so it lies in the image of
(1.3.15) with `N = 0` (Kisin 2006, 2.2.2, proof). Conversely, if `𝔐` is the image of `D`, then `𝔐 ∈ BT^φ_{/𝔖} ⊗ ℚ_p` iff `D` is of Barsotti–Tate type, by the cokernel formula (1.2.2). Exactness is
inherited from (1.2.15). (Kisin 2006, §2.2.2, Proposition (2.2.2), p. 25: the proposition; Kisin
2006, §2.2.1, p. 25: Barsotti–Tate type.)

*Needs:* §R07.4.10; §R07.4.6; §R07.4.2.

**Checks.**

- `btType_rankOne`: `D` of `ℚ_p(1)` (weight `1`) `↦ 𝔖e` with `φ(e) = a·E(u)e` for a unit `a ∈ W^×`; `D` of `ℚ_p ↦ (𝔖, φ)`.
- `btType_weight_two`: `D` of `ℚ_p(2)` is not of Barsotti–Tate type, and its `𝔐` has `E`-height `2`.
- The covariant `D_cris(ℚ_p(1))` has its jump at `−1` and is outside the
  effective `{0,1}` category; `D*_cris(ℚ_p(1))` lies inside it.

### R07.4.18 Breuil's `S`-modules and the Dieudonné crystal on `S`

Construct `BreuilModule`. `BT^φ_{/S}` is the category of finite free `S`-modules `𝓜` with an `S`-submodule
`Fil¹𝓜` and a `φ`-semilinear `φ₁ : Fil¹𝓜 → 𝓜` such that `Fil¹S·𝓜 ⊆ Fil¹𝓜` with `𝓜/Fil¹𝓜` free over `𝒪_K`, and
`φ*(Fil¹𝓜) → 𝓜` is surjective; `φ(x) = φ₁(E(u))⁻¹φ₁(E(u)x)`. `(i) 𝔐 ↦ S ⊗_{φ,𝔖} 𝔐` with `Fil¹𝓜 = {m : (1 ⊗ φ)(m) ∈ Fil¹S ⊗_𝔖 𝔐}` and `φ₁ = (φ₁ ⊗ 1)∘(1 ⊗ φ)` is a functor `BT^φ_{/𝔖} → BT^φ_{/S}`. `(ii) G ↦ 𝔻(G)(S)`,
the contravariant Dieudonné crystal of Mazur–Messing evaluated on the PD thickening `S → 𝒪_K`, with
`Fil¹` the preimage of `ω_G =` (Lie `G`)`^* ⊆ 𝔻(G)(𝒪_K)` (Kisin, `A`.`2`), is an exact contravariant functor
from `p`-divisible groups over `𝒪_K` to `BT^φ_{/S}`; it is an anti-equivalence if `p > 2` and an
anti-equivalence of isogeny categories if `p = 2`.

The setting is the Kummer frame of §R07.4.1. The Dieudonné crystal of a `p`-divisible group over a
non-perfect base and Grothendieck–Messing deformation theory are those of AbelianSchemesAndArithmeticModuli
§A4.CR.7.2. Kisin's proof of `(ii)` builds a `p`-divisible group over `𝒪_K/πⁱ` step by step using `R_i = W[u]/uⁱ` as a PD thickening and Grothendieck–Messing (Kisin 2006, `A`.`6`, proof).

*Construction.* `(i): Tor₁^𝔖(S/Fil¹S, 𝔐) = 0` for `𝔐` free, so `Fil¹S ⊗ 𝔐 ⊆ S ⊗ 𝔐` and `Fil¹𝓜` is well
defined; `𝓜/Fil¹𝓜` embeds in `𝔐/E(u)𝔐` via `1 ⊗ φ` with image that of `φ*𝔐`, a free `𝒪_K`-module direct
summand since `E(u)𝔐 ⊆ im(1 ⊗ φ)` (Kisin 2006, 2.2.3; Kisin 2009, 1.1.10). `(ii): 𝔻(G)(S)` is a crystal
evaluated on the `p`-adic PD thickening `S → 𝒪_K`; `Fil¹` is the preimage of the Hodge filtration, and `φ₁ = φ/p` on `Fil¹` comes from Frobenius on `𝔻` (Kisin 2006, `A`.`2`). Quasi-inverse: for `i ≤ e`, lift `𝓜 ⊗ R_i`
with its filtration to `p`-divisible groups `G_i` over `𝒪_K/πⁱ` by Grothendieck–Messing, compatibly in `i`,
and algebraise (Kisin 2006, `A`.`6`, proof). For `p = 2` the divided powers are not topologically
nilpotent and only an isogeny statement results. (Kisin 2006, §A.5, p. 31: `BT^φ_{/S}`; Kisin 2006,
§A.6, Proposition `(A.6)`, p. 31: `(ii)`; Kisin 2006, §2.2.3, p. 25.)

The API:

- `BreuilModule`: An object of `BT^φ_{/S}: (𝓜, Fil¹𝓜, φ₁)`.
- `BreuilModule.ofKisin`: `𝔐 ↦ S ⊗_{φ,𝔖} 𝔐` with `Fil¹` and `φ₁`.
- `BreuilModule.ofPDivisible`: `G ↦ 𝔻(G)(S)`, exact and contravariant.
- `BreuilModule.frob`: `φ(x) = φ₁(E(u))⁻¹φ₁(E(u)x)`.

*Needs:* §R07.4.1; §R07.4.2; §R07.1.6; AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (the crystalline Dieudonné
crystal); AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (Grothendieck–Messing deformation theory).

**Checks.**

- `BreuilModule.ofKisin_unit`: `S ⊗_{φ,𝔖} (𝔖, φ) =` (`S, Fil¹S, φ₁` of `S`).
- `BreuilModule.fil_quotient_free`: `𝓜/Fil¹𝓜` is free over `𝒪_K` for every object.
- `BreuilModule.not_surjective`: `(S, Fil¹ = Fil¹S, φ₁ = 0)` satisfies the filtration axiom but not
  surjectivity of `φ*(Fil¹𝓜) → 𝓜`.
- `BreuilModule.zero`: The zero module is an object, the image of the trivial `p`-divisible group.
- `BreuilModule.ofPDivisible_standard`: `G = μ_{p^∞}: ω_G` has full rank, so `Fil¹𝓜 = 𝓜`; `G = ℚ_p/ℤ_p: ω_G = 0`, so `Fil¹𝓜 = Fil¹S·𝓜`.
- `BreuilModule.fil_quotient_lie`: `𝓜(G)/Fil¹𝓜(G) ≅ Lie(G^∨)` is free of rank `dim G^∨` over `𝒪_K` (from `0 → ω_G → 𝔻(G)(𝒪_K) → Lie(G^∨) → 0`).

### R07.4.19 The Tate module of a `p`-divisible group from its Breuil module and `A_cris`

**Crystalline comparison for `p`-divisible groups.** Prove `BarsottiTate.isCrystalline`.
Let `K` be complete discretely valued of mixed characteristic `(0,p)`, with perfect residue
field `k, K₀ = W(k)[1/p]` and `K/K₀` finite totally ramified. For every `p`-divisible group
`G` over `O_K, V_p(G)` is crystalline, and there is a natural identification
`D_cris(V_p(G)^∨) ≅ D(G_k)(W(k))[1/p]`. Construct the `G_K`-equivariant, Frobenius-compatible
comparison
`B_cris ⊗_{K₀} D(G_k)(W(k))[1/p] ≅ B_cris ⊗_{ℚ_p} V_p(G)^∨`.
After extension to `B_dR` it preserves the Hodge filtration coming from
`0 → ω_G → D(G)(O_K) → Lie(G^∨) → 0`. Its `G_K`-action comes from the crystalline
period evaluation, before the Kisin classification.

*Proof sketch.* Evaluate the contravariant crystal on the `G_K`-equivariant PD period
thickenings, using maps from the constant `p`-divisible group to `G` over `O_K̄`. Faltings's
period pairing becomes perfect after passing to `B_cris`; crystalline base change identifies
its special-fibre evaluation with `D(G_k)(W(k))[1/p]`. The Hodge filtration is the
filtration induced by evaluation on `O_K`. Take `G_K`-invariants in the comparison, then
use preservation of crystallinity by duals. (Faltings 1999, Theorem 7, as quoted in Kisin 2006, §2.2.4;
Kisin 2006, §2.2.4, Lemma (2.2.4), p. 26: the period pairing.)

*Needs:* PadicPeriodRings §§4.1–4.3 `generalBasePeriodRings`; §R07.1.8; §R07.2.10;
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (the contravariant crystal, base change and Hodge filtration).

**Checks.**

- For `G = ℚ_p/ℤ_p`, both rational realizations are the unit, with Frobenius `σ` and jump zero.
- For `G = μ_{p^∞}, D_cris(V_p(G)^∨)` has Frobenius `pσ` and jump one. Its comparison
  uses the period `t`; `D_cris(V_p(G))` instead has `p^{−1}σ` and jump `−1`.
- Over `O_K` with arbitrary perfect `k` and also at `p = 2`, the rational comparison has
  dimension equal to the height. The zero group has zero comparison on both sides.

**Integral Tate-module pairing.**

Prove `tateModuleAcris`. Let `G` be a `p`-divisible group over `𝒪_K` and regard `A_cris` as an `S`-algebra via
`u ↦ [π̃]`. There is a canonical `G_{K∞}`-equivariant injection `T_p(G) ↪ Hom_{S,Fil,φ}(𝓜(G), A_cris), 𝓜(G) = 𝔻(G)(S)`; it is an isomorphism if `p > 2`, and its cokernel is killed by `p` if `p = 2`. For `𝔐 ∈ BT^φ_{/𝔖}` and `𝓜 = S ⊗_{φ,𝔖} 𝔐`, the map `Hom_{𝔖,φ}(𝔐, 𝔖^ur) → Hom_{S,Fil,φ}(𝓜, A_cris)` is injective
with finite free source and target of the same rank, and an isomorphism if `p > 2`.

The setting is the Kummer frame of §R07.4.1. Injectivity and the bound on the cokernel are Faltings'
theorem (*Integral crystalline cohomology over very ramified valuation rings*, `J`. Amer. Math. Soc.
`12` (1999), Theorem 7), as cited by Kisin; its proof is part of this target.

*Proof sketch.* An element of `T_p(G)` is a map `ℚ_p/ℤ_p → G` over `𝒪_K̄`; since `A_cris` is a divided-power
thickening of `𝒪̂_K̄`, evaluating crystals on `A_cris` gives `𝓜(G) ⊗_S A_cris → A_cris` compatible with
filtrations and `φ` (Kisin 2006, 2.2.4). Injectivity, and the isomorphism for `p > 2` with cokernel
killed by `p` for `p = 2`, is Faltings' Theorem 7 (as cited); Breuil's calculations (Kisin 2006, 2.2.5)
give the `p > 2` case too. (2.2.8): compose `𝔐 → 𝔖^ur` with `𝔖^ur →^φ A_cris` and extend `S`-linearly; both
sides are free of rank `d` by (2.2.4) and (2.1.4), and the map is injective, hence an isomorphism
after inverting `p`. For `p > 2` a map whose composite factors through `pA_cris` already factors through
`p𝔖^ur` (Breuil, as cited in Kisin 2006, 2.2.7, proof). (Kisin 2006, §2.2.4, Lemma (2.2.4), p. 26: the
lemma.)

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.4.18; §R07.4.5; §R07.1.8; §R07.P2 (`aCris`, `bCris`).

**Checks.**

- `tateModuleAcris_etale`: `G = ℚ_p/ℤ_p: 𝓜(G) = S` with `Fil¹ = Fil¹S`, and the target is `A_cris^{φ=1} = ℤ_p = T_p(G)`, for every `p`.
- `tateModuleAcris_mu`: `G = μ_{p^∞}: Fil¹𝓜(G) = 𝓜(G)`, so the target is `(Fil¹A_cris)^{φ=p}`, which
  contains `t`; for `p = 2` it also contains `t/2`, since `t^{p−1} ∈ pA_cris`, which is how a cokernel
  killed by `2` can arise.
- For `G = 0` the comparison source and target are zero, over every allowed
  complete DVR, including `Frac W(F_p(t)^perf)`.

### R07.4.20 Crystalline representations with Hodge–Tate weights in `{0, 1}` come from `p`-divisible groups

Prove `crystalline01IsBt`. For every prime `p` (including `p = 2`) and every finite `K/ℚ_p`: if `V` is a
crystalline representation of `G_K` with all Hodge–Tate weights equal to `0` or `1`, there is a
`p`-divisible group `G` over `𝒪_K` with `V ≅ T_p(G) ⊗_{ℤ_p} ℚ_p` as `G_K`-representations (Fontaine's
conjecture). Consequently a potentially crystalline representation with Hodge–Tate weights `{0, 1}` is
potentially Barsotti–Tate, and, for every `p, G ↦ T_p(G)` is an equivalence from `p`-divisible groups
over `𝒪_K` onto `G_K`-stable `ℤ_p`-lattices in crystalline representations with Hodge–Tate weights in `{0, 1}`. In the opposite convention `HT(χ_cyc) = −1` the weights are `{0, −1}`.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*.

*Proof sketch.* Let `D = Hom_{G_K}(V, B⁺_cris)`, weakly admissible of Barsotti–Tate type, and `𝔐 ∈ BT^φ_{/𝔖}` a lattice in its image under (2.2.2). `𝓜 = S ⊗_{φ,𝔖} 𝔐` lies in `BT^φ_{/S}` (2.2.3) and, up to
isogeny even when `p = 2`, is `𝔻(G)(S)` for a `p`-divisible group `G (A.6)`. By (2.2.4), `T_p(G) ⊗ ℚ_p ≅ Hom_{S,Fil,φ}(𝓜, A_cris) ⊗ ℚ_p ≅ Hom_{S,Fil,φ}(D, B⁺_cris) = V` as `G_{K∞}`-representations, using `𝓜 ⊗ ℚ_p ≅ D ⊗_W S` compatibly with `φ` and filtrations (Breuil, as cited; or from Kisin 2006, 1.2.6). By §R07.4.19 `BarsottiTate.isCrystalline`, `V_p(G)` is crystalline. Both
sides are therefore crystalline `G_K`-representations, so the `G_{K∞}`-isomorphism is `G_K`-equivariant by (2.1.14).
Potentially crystalline case: apply the theorem over a finite extension `L/K` over which `V` becomes
crystalline. Lattices: full faithfulness is Tate's theorem (§R07.1.22). Given a `G_K`-stable lattice `T`
in `V ≅ V_p(G′)`, scale so that `T_p(G′) ⊆ T ⊆ p^{−N}T_p(G′)`; the image of `T/T_p(G′)` in
`p^{−N}T_p(G′)/T_p(G′) ≅ G′`[p^N](K̄) is `G_K`-stable, its schematic closure `H` is finite flat
(§R07.1.20), and §R07.1.20a gives `G = G′/H` with `T_p(G) = T` inside `V_p(G′)`. This is the step Kim uses
at `p = 2` (Raynaud's limit
theorem). (Kisin 2006, §2.2.6, Corollary (2.2.6), p. 26: the corollary, all `p`; Kisin 2006,
Introduction, Theorem (0.3), p. 3: theorem (0.3).)

*Needs:* §R07.4.19 `BarsottiTate.isCrystalline`;
§R07.1.20a `BarsottiTate.quotientFiniteFlatSubgroup`; §R07.4.17; §R07.4.18; §R07.4.19;
§R07.4.14; §R07.1.8; §R07.1.22; §R07.1.20.

**Checks.**

- `crystalline01_examples`: `V = ℚ_p(1) = V_p(μ_{p^∞})` and `V = ℚ_p = V_p(ℚ_p/ℤ_p)`; `V = V_p(E)` for an
  elliptic curve with good reduction.
- `crystalline01_weights`: `ℚ_p(2)` (weight `2`) and `ℚ_p(−1)` (weight `−1`) are crystalline but not
  Barsotti–Tate.
- For a `G_K`-stable lattice `p⁻¹T_p(G′)`, the finite subgroup is `G′[p]`.
  The quotient of §R07.1.20a realizes this larger lattice via the isogeny `[p]`.

### R07.4.21 Kisin's classification of `p`-divisible groups by `BT^φ_{/𝔖}`

Prove `kisinPDivisibleClassification`. There is an exact functor `G ↦ 𝔐(G)` from `p`-divisible groups
over `𝒪_K` to `BT^φ_{/𝔖}` (contravariant in Kisin's and Kim's normalisation) with a natural
`G_{K∞}`-isomorphism `T_p(G) ≅ V_𝔖(𝔐(G))`. If `p > 2` it is an (anti-)equivalence; if `p = 2` it induces an
equivalence of isogeny categories. Equivalently for `p > 2` (Kisin 2009, 2.2.22, via Cartier duality
and Breuil's `(Mod FI/S)`): `(Mod FI/𝔖)_{ℤ_p} = lim_n` of the `p`-power torsion Kisin modules is
equivalent to `p`-divisible groups over `𝒪_K`.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*. Kisin 2009 (2.2.22) assumes `k` finite and `p ≠ 2` (standing hypothesis of
its §1).

*Proof sketch.* Given `G, T_p(G)` is a lattice in the Barsotti–Tate representation `V_p(G)`; by (2.2.2)
and (2.1.15) there is `𝔐 ∈ BT^φ_{/𝔖}`, unique up to canonical isomorphism, with `T_p(G) ≅ V_𝔖(𝔐)`, and `G ↦ 𝔐(G)` is functorial by (2.1.12) (Kisin 2006, 2.2.7, proof). Given `𝔐`, (2.2.3) and `(A.6)` produce
`G(𝔐)`. For `p > 2`, (2.2.4) and (2.2.8) give `𝔐(G(𝔐)) ≅ 𝔐`, and `T_p(G(𝔐(G))) ≅ V_𝔖(𝔐(G)) ≅ T_p(G)` gives
`G(𝔐(G)) ≅ G` by Tate's theorem. For `p = 2` the same arguments hold up to isogeny, or use (2.2.2) with
(2.2.6). Kisin 2009 (2.2.22): `(Mod FI/S)_{ℤ_p}` is anti-equivalent to `p`-divisible groups (Breuil, `[Br 3]` 4.2.2.9, as cited), composed with Cartier duality; (1.2.4) with `A = ℤ/pⁿ` and a limit gives a
fully faithful functor from `(Mod FI/𝔖)_{ℤ_p}`, essentially surjective by lifting modulo `p` (1.2.5) and
deformation. (Kisin 2006, §2.2.7, Theorem (2.2.7), p. 26: the theorem; Kisin 2009, §2.2.22,
Corollary (2.2.22), p. 29: the `p > 2` form of Kisin 2009.)

*Needs:* §R07.4.19 `BarsottiTate.isCrystalline`;
§R07.1.20a `BarsottiTate.quotientFiniteFlatSubgroup`; §R07.4.17; §R07.4.18; §R07.4.19;
§R07.4.12; §R07.4.11; §R07.1.22; §R07.1.7.

**Checks.**

- `kisinPDivisible_rankOne`: `𝔐(μ_{p^∞})` and `𝔐(ℚ_p/ℤ_p)` are the rank-one objects `(𝔖e, φ(e) = a·E(u)e)`
  with `a ∈ W^×` and `(𝔖, φ)`, in the order fixed by the contravariance.
- `kisinPDivisible_dyadic`: `p = 2`: this argument alone gives essential surjectivity only up to
  isogeny (Kisin 2006, 2.2.7); §R07.4.23 removes the isogeny.
- For `G = ℚ_p/ℤ_p` and `H = ℤ/p, G/H ≅ G`; the quotient map multiplies
  Tate modules by `p` and its cokernel is `ℤ/p`, agreeing with the quotient contract.

### R07.4.22 Classification of finite flat group schemes by `(Mod/𝔖)` for `p > 2`

Prove `finiteFlatClassification`. Let `p > 2`. There is an exact anti-equivalence between `(Mod/𝔖)` and
the category of finite flat group schemes of `p`-power order over `𝒪_K`, compatible with the functor of
§R07.4.21 on kernels of isogenies; it restricts to an anti-equivalence between `(Mod FI/𝔖)` and the
finite flat `H` such that every `H[pⁿ]` is finite flat. For `H` corresponding to `𝔐` there is a canonical
`G_{K∞}`-isomorphism between `H(K̄)` and `Hom_{𝔖,φ}(𝔐, 𝔖^ur[1/p]/𝔖^ur)`, up to Kisin 2009's twist and
Cartier duality `(T(𝒪_ℰ ⊗ 𝔐)(1) ≅ Gr^D(𝓜)(𝒪_K̄))`.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*. `p > 2` is needed: the proof uses the equivalence of (2.2.7), which holds
only up to isogeny at `p = 2`. Kisin 2006 states Theorem (2.3.5) without this hypothesis; the `p = 2`
case is §R07.4.23. Raynaud's embedding of a finite flat group scheme into a `p`-divisible group
(Berthelot–Breen–Messing, Théorème 3.1.1, as cited by Kisin and Kim) is §R07.1.40: over the local
ring `𝒪_K, H` embeds in a projective abelian scheme `A`, hence in `A[p^∞]`, with `A[p^∞]/H p`-divisible by
§R07.1.20a.

*Proof sketch.* (2.3.3)–(2.3.4): `(Mod/𝔖)` is equivalent to `(Mod/𝔖)^•`, two-term complexes `𝔐₁ → 𝔐₂` in
`BT^φ_{/𝔖}` that are isogenies, modulo homotopies (Errata `E`.`5`: not homotopy equivalences) and with
quasi-isomorphisms inverted; essential surjectivity by an explicit resolution `𝔐̃ ↠ 𝔐` with `𝔐̃ ∈ BT^φ_{/𝔖}`. Kernels of isogenies of `p`-divisible groups are finite flat, and every finite flat `H`
embeds in a `p`-divisible group `G₁` with `G₁/H p`-divisible (Raynaud), so (`p-Gr/𝒪_K`)`^•` of isogenies is
equivalent to (`p-Gr/𝒪_K`) (Kisin 2006, 2.3.5, proof). (2.2.7) for `p > 2` gives (`p-Gr/𝒪_K`)`^• ≃ (Mod/𝔖)^•` (anti-equivalence), and compose. `(Mod FI/𝔖)` case: by the formal argument of Breuil (`[Br 2]`
4.2.2.5 from 4.2.1.6, as cited; Kisin 2006, 2.3.6). Galois compatibility: the torsion comparison
`Hom_{𝔖,φ}(𝔐, 𝔖^ur[1/p]/𝔖^ur) → Hom_{S,φ₁,Fil¹}(𝓜, A_cris[1/p]/A_cris)` is an isomorphism by dévissage
to `p𝔐 = 0` (Kisin 2009, 1.1.13–1.1.14). (Kisin 2006, §2.3.5, Theorem (2.3.5), p. 28: the theorem as
printed (stated there without the hypothesis `p > 2`, which the proof needs); Kisin 2006,
Introduction, Theorem (0.5), p. 3: the hypothesis `p > 2`; Kisin 2009, §1.1.13, Proposition (1.1.13),
p. 9: Galois compatibility.)

*Needs:* §R07.1.20a `BarsottiTate.quotientFiniteFlatSubgroup`; §R07.4.21; §R07.4.2; §R07.1.6;
§R07.1.5; §R07.1.40.

**Checks.**

- `finiteFlatClassification_rankOne`: `μ_p` and `ℤ/p` correspond to the rank-one objects `𝔖/p·e` with `φ(e) = a·E(u)e (a ∈ W^×)` and `φ(e) = e`, in the order fixed by contravariance; the multiplicative/étale
  dictionary is §R07.4.37.
- `finiteFlatClassification_killed_by_p`: objects killed by `p: (Mod/𝔖)` and `(Mod FI/𝔖)` have the same
  objects killed by `p` (Kisin 2009, 1.1.8), so every `H` killed by `p` is in the `(Mod FI/𝔖)` part; `μ_{p²}`
  is too, since `μ_{p²}[p] = μ_p` is flat.
- For `H = μ_p ↪ μ_{p^∞}`, the quotient is `μ_{p^∞}` via `[p]`. Its finite-flat
  module is the cokernel of multiplication by `p` on the rank-one group module.

### R07.4.23 The dyadic classification of `p`-divisible groups and finite flat group schemes

Prove `dyadicClassification`. Let `p = 2` and `𝒪_K` a `2`-adic discrete valuation ring with perfect
residue field. `(1)` The functor `G ↦ 𝔐_G = 𝔐*(T_p(G))` is an anti-equivalence from `2`-divisible groups
over `𝒪_K` to `Mod_𝔖(φ)^{≤1} = BT^φ_{/𝔖}`, with a natural `G_{K∞}`-isomorphism `T_p(G) ≅ T*_𝔖(𝔐_G)`. `(2) 𝔻*(G)(S) = S ⊗_{φ,𝔖} 𝔐_G` as strongly divisible `S`-lattices, and `G ↦ 𝔐_G` takes short exact sequences
to short exact sequences. `(3)` There is an exact anti-equivalence `H ↦ 𝔐_H` from `2`-power order finite
flat group schemes over `𝒪_K` to `(Mod/𝔖)^{≤1}`, with `H(K̄) ≅ T*_𝔖(𝔐_H) G_{K∞}`-equivariantly,
`𝔐*(T_p(G)) ≅ lim_n 𝔐_{G[2ⁿ]}`, and `S ⊗_{φ,𝔖} 𝔐_H ≅ 𝔻*(H)(S)` respecting `Fil¹` and `φ₁`. Kisin (Invent.
2009, Theorem 0.8) proved the connected case earlier: connected objects of `BT^φ_{/𝔖}` (resp. `(Mod/𝔖)`)
correspond to connected `2`-divisible groups (resp. connected finite flat group schemes), in Kisin's
covariant normalisation.

The setting is the Kummer frame of §R07.4.1. Conventions: Kisin's contravariant functors and `HT(χ) = +1`, as in *Conventions*. Kim's proof of `(1)` shows that the `G_{K∞}`-stable lattice `T*_𝔖(𝔐)` in
`V_p(G′)` is `G_K`-stable (Kim, Proposition 4.5, via Propositions 5.4–5.5), then applies Raynaud's limit
theorem ([Ray74] Proposition 2.3.1). Lau (displays and windows) and Liu (`(φ, Ĝ)`-modules) gave
independent proofs, and Kisin's connected case uses Zink's windows and displays.

*Proof sketch.* Full faithfulness of `𝔐* ∘ T_p`: Tate's theorem with Kisin's full faithfulness (Kim,
Theorem 2.3(1)–`(2)`). Essential surjectivity: for `𝔐 ∈ BT^φ_{/𝔖}`, Kisin's isogeny statement gives `G′`
with `𝔐[1/2] ≅ 𝔐*(T_p(G′))[1/2]`; `T = T*_𝔖(𝔐)` is a `G_{K∞}`-stable lattice in `V = V_p(G′)` (Kim, §4).
Kim, Proposition 4.5: `T` is `G_K`-stable (Kim §5, using Breuil's strongly divisible `S`-lattices at `p = 2`
as far as they work, Propositions 5.4–5.5). A `G_K`-stable lattice in `V_p(G′)` is `T_p` of a `2`-divisible
group isogenous to `G′`: take the schematic closure of the finite subgroup cut out by the lattice
(§R07.1.20, §R07.1.20a and §R07.1.25). `(2)` is Kim, Proposition 4.2 (§§5.6–5.7), using
exactness of `𝔻*`. `(3)`: write `H = ker(f : G → G′)` for an isogeny (Raynaud), set `𝔐_H = coker 𝔐*(T_p(f))`, independent of `f` by `(2)`; the proof of Kisin 2006, 2.3.5 then applies (Kim, Corollary
4.3), exactness being Kim, Proposition 5.7.3. (Kim 2012, §4, Theorem 4.1, p. 10 (arXiv `v3`); Kim
2012, §4, Corollary 4.3, p. 10 (arXiv `v3`); Kisin 2009b, Introduction, Theorem (0.8), p. 4: the
connected case.)

*Needs:* §R07.1.20a `BarsottiTate.quotientFiniteFlatSubgroup`; §R07.4.21; §R07.4.18; §R07.4.12;
§R07.4.14; §R07.1.20; §R07.1.25; §R07.1.22; §R07.1.40.

**Checks.**

- `dyadic_rankOne`: `μ_{2^∞}` and `ℚ₂/ℤ₂` correspond to the two rank-one objects; `E[2^∞]` of an elliptic
  curve with good reduction over `𝒪_K` gives a rank-two object, connected iff the reduction is
  supersingular.
- `dyadic_integral`: the statement is integral; at `p = 2` Kisin's (2.2.7) alone classifies
  `2`-divisible groups only up to isogeny, and Kisin 2009b, (0.8), integrally only the connected ones.
- For `H = μ₂ ↪ μ_{2^∞}`, the quotient gives the integral isogeny `[2]` and
  the Tate-module cokernel `μ₂(K̄)`; the quotient construction uses no odd-prime hypothesis.

### R07.4.24 Restriction to `G_{K∞}` is fully faithful on finite flat representations

Prove `finiteFlatRestrictionFullFaithfulness`. For every `p`: the functor `T ↦ T|_{G_{K∞}}` from `p`-power
torsion `G_K`-representations of the form `H(K̄), H` a finite flat group scheme over `𝒪_K`, to `p`-power
torsion `G_{K∞}`-representations is fully faithful.

The setting is the Kummer frame of §R07.4.1. Breuil ([Bre02] Theorem 3.4.3, as cited by Kim)
observed that this follows formally from the classification; the formal argument is written out
below. Input: an exact anti-equivalence `H ↦ 𝔐_H` from finite flat group schemes to `(Mod/𝔖)` with a
natural `G_{K∞}`-isomorphism `H(K̄) ≅ T*(𝔐_H) := Hom_{𝔖,φ}(𝔐_H, 𝔖^ur[1/p]/𝔖^ur)`: §R07.4.22 for `p > 2`,
§R07.4.23 for `p = 2`.

*Proof sketch.* Faithfulness is clear. Let `f : H(K̄) → H′(K̄)` be `G_{K∞}`-equivariant and `Γ ⊂ (H × H′)(K̄)` its graph, a `G_{K∞}`-stable subgroup; it suffices that `Γ` is `G_K`-stable. Let `𝔐 = 𝔐_{H×H′}` and
`M = 𝒪_ℰ ⊗ 𝔐`. By Fontaine's equivalence (§R07.4.5), `Γ ⊂ T*(𝔐) = T*(M)` corresponds to a quotient `M ↠ N` of étale `φ`-modules. Let `𝔑` be the image of `𝔐` in `N`. `𝔑 ∈ (Mod/𝔖)`: it is finitely generated, killed by
a power of `p, φ`-stable, and has no `u`-torsion (`N` is a module over `𝒪_ℰ`, in which `u` is invertible), so
if nonzero it has depth `1` and projective dimension `1`, while zero has a resolution of length `0`
(Kisin 2006, 2.3.2); and `E(u)𝔑` lies in the image of `1 ⊗ φ`
because this holds for `𝔐`. Moreover `𝒪_ℰ ⊗ 𝔑 = N`, since `𝒪_ℰ` is flat over `𝔖`. `𝔎 = ker(𝔐 ↠ 𝔑)` is in
`(Mod/𝔖)`: if `x ∈ 𝔎` and `E(u)x = (1 ⊗ φ)(y)`, the image of `y` in `φ*𝔑` is killed by the injective map `1 ⊗ φ` (Kisin 2009, 1.1.9), so `y ∈ φ*𝔎` by flatness of `φ`. Thus `0 → 𝔎 → 𝔐 → 𝔑 → 0` is exact in `(Mod/𝔖)`. By
the exact anti-equivalence, `𝔑 ↪ …` corresponds to a closed finite flat subgroup scheme `Γ̃ ⊆ H × H′`
with `Γ̃(K̄) =` image of `T*(𝔑) = T*(N) = Γ`. Being defined over `𝒪_K, Γ̃(K̄)` is `G_K`-stable, so `Γ` is,
and `f` is `G_K`-equivariant. (Kim 2012, §4, Corollary 4.4, p. 11 (arXiv `v3`): the corollary; Kim
attributes the deduction to Breuil [Bre02, Theorem 3.4.3].)

*Needs:* §R07.4.22; §R07.4.23; §R07.4.5; §R07.4.2.

**Checks.**

- `finiteFlatRestriction_muP`: `H = H′ = μ_p: Hom_{G_{K∞}}(μ_p, μ_p) = Hom_{G_K}(μ_p, μ_p) = 𝔽_p`.
- `finiteFlatRestriction_needs_flat`: the finite flat hypothesis is needed: let `μ_p ⊂ K` and `V` the
  extension `0 → μ_p → V → ℤ/p → 0` given by the Kummer class of `π`. On `G_{K∞}` the class dies `(π₁ ∈ K_∞)`, so `V ≅ μ_p ⊕ ℤ/p` there but not over `G_K`; consistently `V` is not finite flat: its splitting
  field `K(π^{1/p})` has Serre upper ramification break `pe/(p − 1)`, hence
  `u_{L/K} = pe/(p − 1) + 1` in Fontaine's numbering, exceeding Fontaine's bound
  `e(1 + 1/(p − 1))` (§R07.6.5; for `K = ℚ₂`, the Serre break of `ℚ₂(√2)` is `2`
  and its Fontaine break is `3`, exceeding the bound `2`; the model with sub `μ_p` and quotient `ℤ/p` is excluded more
  simply, since `H¹_fppf(𝒪_K, μ_p) = 𝒪_K^×/(𝒪_K^×)^p` does not contain the class of `π`, but for `e ≥ p − 1` other models of the two factors exist).

### R07.4.25 Integral comparisons of the Breuil–Kisin module of a `p`-divisible group with its Dieudonné crystal

Prove `bkIntegralComparisons`. For a `p`-divisible group `H` over `O_K` let `M(H) = 𝔐(T_p(H)^∨)` (the Kisin
functor of §R07.4.16 on the dual Tate module; `T_p(H^∨) ≅ T_p(H)^∨(1)` differs by a twist). Then `H ↦ M(H)` is an exact contravariant equivalence from `p`-divisible groups over `O_K` to Breuil–Kisin modules
of `E`-height `1`, and, with `D(H)` the contravariant Dieudonné crystal (AbelianSchemesAndArithmeticModuli §A4.CR.7.2)
and `Fil¹D(H)(O_K) = Lie(H)^∨: (1)` the composite `φ*M(H)/uφ*M(H) → M(H)/uM(H)[1/p] ≅ D_cris(T_p(H)^∨) ≅ D(H)(W)[1/p]`, whose first map is `φ_{M(H)}`, carries `φ*M(H)/uφ*M(H)`
isomorphically onto `D(H)(W)` (`D` of the reduction to the residue field); `(2)` the filtered isomorphism
`φ*M(H)/E(u)φ*M(H)[1/p] ≅ K ⊗ D_cris(T_p(H)^∨) ≅ D(H)(O_K)[1/p]` carries `φ*M(H)/E(u)φ*M(H)` onto
`D(H)(O_K)`, with source filtration `Fil¹ = {x : φ_{M(H)}(x) ∈ E(u)M(H)}` and target the Hodge
filtration; `(3)` there is a canonical `φ`-equivariant isomorphism `S ⊗_{φ,𝔖} M(H) ≅ D(H)(S), S` the
`p`-adic completion of the PD envelope of `W[u] → O_K`, reducing to `(2)` along `S → O_K`.

The setting is the Kummer frame of §R07.4.1. Every `p` including `p = 2` (Kim, Lau, Liu at `p = 2`); AGHMP
work with `k` algebraically closed but the statement is Kisin's for perfect `k`. The correct functor is
`M(T_p(H)^∨)`: the printed `H ↦ M(T_p(H^∨))` in AGHMP's first sentence is off by a Tate twist, which
also corrects Kisin 2010, Theorem 1.4.2.

*Proof sketch.* The equivalence: §R07.4.21 for `p > 2` and §R07.4.23 for `p = 2`. `(3)` is the comparison
of Breuil's `S`-modules with the Dieudonné crystal (§R07.4.18), made integral and canonical. `(1)`
and `(2)` follow from `(3)` by base change along `S → W (u ↦ 0)` and `S → O_K (u ↦ π)`, together with the
rational identifications of §R07.4.16 (AGHMP, Theorem 2.1.1, proof, from Kisin's Theorem 1.1.6 of
'`Mod p` points on Shimura varieties'). (AGHMP 2018, §2.1, Theorem 2.1.1 and its proof, p. 10
(arXiv:1508.00178v3): the equivalence `H ↦ M(T_p(H)^∨)` onto Breuil–Kisin modules of `E`-height `1` and
the integral comparisons `(1)`–`(3)`, correcting the twist of Kisin 2010, Theorem 1.4.2.)

*Needs:* §R07.4.16; §R07.4.21; §R07.4.23; §R07.4.18; AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (the crystalline
Dieudonné crystal).

**Checks.**

- `bkIntegral_rankOne`: `H = ℚ_p/ℤ_p: T_p(H)^∨ = ℤ_p` and `M(H) = 𝔖` with `φ(e) = e` (`E`-height `0`, étale);
  `H = μ_{p^∞}: T_p(H)^∨ = ℤ_p(−1)` and `M(H)` is the rank-one Breuil–Kisin module of `ℤ_p(−1)`, with `φ(e) = c·E(u)e` for a unit `c` (`E`-height exactly `1`); its reduction at `u = 0` is `D(μ_{p^∞})(W) = (W, F = pσ)`.
- `bkIntegral_twist`: with `H ↦ 𝔐(T_p(H^∨))` instead, `ℚ_p/ℤ_p` would go to the Breuil–Kisin module of
  `ℤ_p(1)`, whose reduction at `u = 0` is `D_cris(ℚ_p(1))` with Frobenius `p^{−1}σ`; no module with `φ(𝔐) ⊆ 𝔐`
  reduces to it, so the twisted functor does not land in `E`-height `1`.

### R07.4.26 `p`-divisible groups, Wach modules and Kisin–Ren modules in the cyclotomic frame

Prove `wachBreuilKisinComparison`. Let `k` be a perfect field of characteristic `p > 2`,
`r ≥ 1, d ≥ 0, F = W(k)[1/p], F ⊆ K ⊆ F_r = F(µ_{p^r}), Γ_K = Gal(F(µ_{p^∞})/K),`
`R = O_K⟦t₁, …, t_d⟧` and `𝔖_cyc = W(k)⟦u, t₁, …, t_d⟧` with Witt Frobenius on coefficients,
`φ(1 + u) = (1 + u)^p, φ(t_i) = t_i^p, γ(1 + u) = (1 + u)^{χ(γ)}`;
`Γ_K` fixes `W(k)` and every `t_i`. Put `E = φ^r(u)/φ^{r−1}(u)`. `(i)` There is
a contravariant equivalence `G ↦ M(G)` from `p`-divisible groups over `R` to the category `BT(𝔖_cyc)^{Γ_K}`
of finite free `(φ, Γ_K)`-modules `M` over `𝔖_cyc` such that the `𝔖_cyc`-span of `φ(M)` contains `EM` and `Γ_K`
acts trivially on `M/uM`; it recovers the Dieudonné crystal of `G` and the Tate module, and is
compatible with duality and change of `r` and `K`. `(ii)` For `d = 0` and a lattice `T` in a crystalline
representation with non-positive Hodge–Tate weights, the Wach module `N(T)` (the maximal distinguished
submodule) and the Kisin–Ren module `M_KR(T)` satisfy `N(V) = D⁺(V) ∩ M_KR(V)[E_n(u)^{−1}]_{1≤n≤r}` and
`M_KR(V) = N_r(V)` by the recursion `N_{i+1} = φ*(N_i)[E_r(u)^{−1}] ∩ N_i, N₁ = N(V)`; in particular
`M_KR = N` for `r = 1`, and for `T = T_p(G)^∨, M(G) = 𝔖 ⊗ M_KR(T)`.

The case `K = K₀` (`r = 1`) is the comparison of the Wach module with the Breuil–Kisin-type module
that PadicHodgeTheory uses; Dieudonné crystals are those of AbelianSchemesAndArithmeticModuli §A4.CR.7.2.

The following four targets construct the integral window theory used in this equivalence.
Write `R_r = O_(F_r)⟦t₁,…,t_d⟧`, choose compatible roots of unity, and let
`𝔖_cyc → R_r` send `1+u` to `ζ_(p^r)`. Its kernel is `(E)`.

**Restricted cyclotomic frames and windows (`cyclotomicWindowBaseChange`).**
Construct the frame with ring `𝔖_cyc`, filtration ideal `(E)` and divided Frobenius
`φ₁′(Ex) = φ(x)`, and the PD frame with ring `S_r`, the `p`-adic completion of
the PD envelope of `(E)`, filtration `Fil¹S_r = ker(S_r → R_r)` and
`φ₁ = φ/p` on that ideal. Prove `p`-torsion freeness of `S_r` and that
`c = φ(E)/p` is a unit. A window `(P, Fil¹P, Φ, Φ₁)` has finite free `P`,
a normal decomposition `P = L ⊕ N, Fil¹P = L ⊕ (Fil¹S)N`, semilinear `Φ,Φ₁`,
`Φ₁(ax) = φ₁(a)Φ(x)` for `a ∈ Fil¹S`, and `Φ = ϖΦ₁` on `Fil¹P`, with
`ϖ = φ(E)` on `𝔖_cyc` and `ϖ = p` on `S_r`; the images of `Φ,Φ₁` generate `P`.
Morphisms preserve the filtration and both maps; exactness includes the filtered submodules.
This recovers the strongly divisible vocabulary of §R07.4.18 on the corresponding
PD frame, retaining the chosen Frobenius lift.

For `Γ_r ⊆ Γ′ ⊆ Γ ⊆ Γ_F`, define `Γ′`-strict actions of `Γ` by triviality on
`P ⊗ 𝔖_cyc/(u)`. On `𝔖_cyc`-windows the semilinear action satisfies
`Φ₁γ = c_γ γΦ₁`, where `c_γ = γ(φ(E))/φ(E)`; on PD windows it commutes with
`Φ₁`. Both actions commute with `Φ`, and morphisms are equivariant.
On a BT module `𝔐`, use `𝔐/u𝔐` instead. The inclusion of
frames is a `c`-homomorphism: base change scales the divided Frobenius by `c`.
For finite free `𝔐` with `E` annihilating the cokernel of linearized Frobenius,
prove that this linearization is injective and its cokernel is free over `R_r`.
Prove exact equivalences from BT modules to `𝔖_cyc`-windows and then to
`S_r`-windows, with composite underlying module `S_r ⊗_(φ,𝔖_cyc) 𝔐`,
preserving these actions. In the first equivalence `𝔐 = Fil¹P`, its Frobenius
is `EΦ₁`, and its action is `E/γ(E)` times the window action on `Fil¹P`.
For duality retain `λ_γ = ∏_(n≥0) φ^n(E/γ(E))`: the BT dual pairing transforms
by `λ_γ`, the `𝔖_cyc`-window dual by `φ(λ_γ)`, and the PD-window dual has
the ordinary contragredient action. Prove the compatible duality isomorphisms.
Source: Cais–Lau 2017, §§2.1–2.3, Definitions 2.1.1, 2.1.3 and 2.1.13,
Remark 2.1.14, Lemma 2.1.16 and Proposition 2.3.2; §3.1, Proposition 3.1.4,
Lemma 3.1.6 and Remarks 3.1.7–3.1.8.

*Needs:* §R07.4.18's filtered semilinear vocabulary; §R07.4.1's PD-envelope construction.

**Checks.**

- The unit BT module gives `(S_r, Fil¹S_r, φ, φ/p)`, and its dual gives
  `(S_r, S_r, pφ, φ)`. The latter comparison includes the unit correction
  `y = u₀/τ`, where `u₀ = φ^r(u), τ = log(1+u₀)` and `φ(y) = cy`.
- Triviality of a window action on `P ⊗ W(k)` is equivalent to strictness
  on `P ⊗ W(k)⟦t₁,…,t_d⟧`; this uses Frobenius, even when `d > 0`.
- With variables `u_r`, the map for `r → r+1` is `u_r ↦ φ(u_(r+1))`,
  fixing the `t_i`. It carries `E_r` to `E_(r+1)` and commutes with the
  BT/window comparison and its divided Frobenius.

**Filtered crystals and windows with connection (`cyclotomicCrystalWindowEquivalence`).**
Over `Spf R_r`, form filtered Dieudonné crystals as compatible systems on the
nilpotent thickenings, using AbelianSchemesAndArithmeticModuli §A4.CR.7.2's
contravariant crystal and Hodge filtration, with `F,V` on the characteristic-`p`
restriction. Require an admissible locally direct summand filtration: on each
characteristic-`p` crystalline thickening `U → Z`,
`φ̄*(Fil¹D_U) = im V_(Z/U) = ker F_(Z/U)`, where `φ̄ : Z → U` factors the
Frobenius of `Z`, as in Cais–Lau Definition 2.4.1.
Evaluation on `S_r` identifies this category with windows carrying a connection
`∇ : P → P ⊗_(𝔖_cyc) Ω̂_(𝔖_cyc/W(k))` over the PD derivation, satisfying
`∇Φ = (Φ ⊗ dφ)∇`. Prove that these connections are integrable and topologically
quasi-nilpotent, that `F,V` are horizontal, and that evaluation is an exact
equivalence preserving duality, crystalline pullback and filtration.

Also prove that `p`-divisible groups over `R_r` are contravariantly equivalent
to these filtered crystals. For the auxiliary lift `φ₀(u) = u^p,
φ₀(t_i) = t_i^p`, prove the restricted group/window equivalence and unique
horizontal-connection theorem under nilpotence of `p⁻¹dφ₀` on the residue
differentials. Passing through filtered crystals then gives the group/window
with connection equivalence for the cyclotomic lift. This target includes
essential surjectivity over the relative base `R_r`; the resulting filtered
crystal is independent of the auxiliary lift.
Source: Cais–Lau 2017, Proposition 2.5.2, Lemma 2.6.3, Proposition 2.6.4,
Propositions 2.7.1 and 2.7.3, Corollary 2.7.4 and Remark 2.7.5, restricted to `R_r`.

*Needs:* `cyclotomicWindowBaseChange`; §§R07.1.6 and R07.1.41;
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (crystalline evaluation and Grothendieck–Messing).

**Checks.**

- For `ℚ_p/ℤ_p`, `Fil¹P = Fil¹S_r·P, Φ(e) = e, ∇e = 0`;
  reduction to `W(k)` gives `F = σ`.
- For `μ_(p^∞)`, `Fil¹P = P, Φ(e) = pe, ∇e = 0`; reduction gives `F = pσ`.
  Cartier duality exchanges these two filtered windows integrally.
- Changing between `φ₀` and cyclotomic `φ` changes the semilinear window maps;
  evaluation of the recovered crystal on a fixed PD thickening and its Hodge
  filtration agree through the crystalline comparison isomorphism.

**Strict actions and integral connections (`cyclotomicStrictActionConnection`).**
Prove that forgetting the connection gives an exact equivalence from
`S_r`-windows with a horizontal strict `Γ_r`-action to windows with a strict
`Γ_r`-action. Equivalently, every such action determines a unique horizontal
connection, and every equivariant window morphism is horizontal. Conversely
each window with a Frobenius-horizontal connection has a unique horizontal
strict `Γ_r`-action.
The equivalences preserve duality and are natural for additional `Γ_K`-actions.

Use `τ = log(1+u₀) = u₀·unit` in `S_r`, with `τ^(p−1) ∈ pS_r`.
For `γ ∈ Γ_r`, prove the integral estimates
`(γ−1)^(n+1)P ⊆ (τ,p^r)^n τP` and, for `γ ∈ Γ_(r+n)`,
`(γ−1)P ⊆ (τ,p)^n τP`. They give continuity and convergence of the logarithm.
For nonidentity `γ` sufficiently close to `1`, the operator
`N_P = p^r log(γ)/log(χ(γ))` is independent of `γ` and satisfies
`N_P(P) ⊆ τP` and `N_PΦ = ΦN_P`. Thus
`∇_(∂/∂u) = ((1+u)τ)⁻¹N_P` is integral and obeys the Leibniz rule.
Extend this `du` connection uniquely to all `dt_i` directions by Frobenius
horizontality, using topological nilpotence of `p⁻¹dφ` on `⊕_i 𝔖_cyc dt_i`
for the maximal ideal topology and the complete-ring argument of Proposition 2.7.3.
Prove uniqueness and horizontality on morphisms as well as on objects.
Source: Cais–Lau 2017, Definition 3.1.9, Lemma 3.1.10, Proposition 3.2.2,
Lemma 3.2.3, Lemma 3.3.3, Proposition 3.3.4 and Corollaries 3.3.5–3.3.6.

*Needs:* `cyclotomicWindowBaseChange`; `cyclotomicCrystalWindowEquivalence`.

**Checks.**

- `p⁻¹dφ(du) = (1+u)^(p−1)du` fixes the residue vector `du`, as do its
  iterates, with `σ`-semilinearity on `k`. On `dt_i` it is `t_i^(p−1)dt_i`,
  zero on residue differentials. Nilpotence for the full cyclotomic divided derivative fails.
- For `d = 1` and the unit window with horizontal basis `e`,
  `∇(t₁e) = e ⊗ dt₁` and `∇Φ(t₁e) = pe ⊗ t₁^(p−1)dt₁`.
  The reconstructed connection retains the relative direction although `Γ_r`
  fixes `t₁`; both formulas hold before inverting `p`.
- For the unit and multiplicative PD windows above, reconstruct `∇e = 0`;
  transporting back through the window comparison recovers `wach_unit` and
  `wach_mu`, including the latter's nontrivial semilinear action in its BT basis.

**Effective descent to intermediate fields (`cyclotomicWindowDescent`).**
For `F ⊆ K ⊆ K′ ⊆ F_r`, put `R′ = O_(K′)⟦t₁,…,t_d⟧` and
`Γ = Γ_K, Γ′ = Γ_(K′)`. Groups over `R_r` with descent of their generic fibre
to `R[1/p]` correspond to `Γ_r`-strict `Γ`-windows. Base change from groups
over `R′` with that generic descent is fully faithful; its essential image
is exactly those for which `Γ′/Γ_r` acts trivially on the special fibre `G_k`.
Under crystalline evaluation this is precisely `Γ′`-strictness, giving
the equivalences with `Γ′`-strict `Γ`-windows and BT modules. In particular
`K′ = K` gives groups over `R` and strict `Γ_K`-modules.

Prove effectivity by the marked universal deformation of `G_k`: descent
isomorphisms reducing to the identity preserve the marking, so the coefficient
map from its deformation ring to `R_r` is invariant under `Γ′/Γ_r`.
It factors through `(R_r)^(Γ′/Γ_r) = R′`, and the effective universal family
gives the descended group; rigidity identifies its descent maps with the given ones.
Use the preliminary
`BarsottiTate.markedUniversalDeformation` target of §R07.6.9 with coefficient
ring `W(k)`. Its inputs are §§R07.1.6, R07.1.11 and R07.6.6,
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 and SchemeAndStackFoundations
§§4.4 and 4.8; the order is these inputs, marked deformation and effectivity,
the present descent, then `wachBreuilKisinComparison` and `raynaudDetTateModule`.
Prove that descent commutes with the window comparisons, duality and the
maps for change of `r` and intermediate fields.
Source: Cais–Lau 2017, Definition 3.4.1, Remark 3.4.2, Proposition 3.4.3,
Lemma 3.4.4, Proposition 3.4.5, Corollary 3.4.6 and Remark 3.4.7.

*Needs:* `cyclotomicStrictActionConnection`; `BarsottiTate.markedUniversalDeformation`
(only the preliminary target of §R07.6.9); §R07.1.22's generic-fibre rigidity
and §R07.1.41's flat descent.

**Checks.**

- For `K = F_r`, the quotient descent group is trivial and the equivalence
  reduces to `p`-divisible groups over `R_r` and strict `Γ_r`-windows.
- For `K = F`, the constant and multiplicative groups have trivial
  `Γ_F/Γ_r`-action on their special fibres, and descend integrally with their
  filtrations and horizontal connections.
- Choose `a ∈ ℤ_pˣ` of order `p−1`. The constant group `ℚ_p/ℤ_p` over `R₁`
  has generic descent to `W(k)⟦t₁,…,t_d⟧[1/p]` obtained by sending a generator
  of `Gal(F₁/F)` to `[a]`. This action is nontrivial on its special fibre;
  the descended generic group has no `p`-divisible model over
  `W(k)⟦t₁,…,t_d⟧`. Generic descent alone does not imply integral effectivity.

*Proof sketch of `wachBreuilKisinComparison`.* Evaluate the filtered crystal on
`S_r`, use `cyclotomicCrystalWindowEquivalence` and
`cyclotomicStrictActionConnection` to construct the inverse on arbitrary
strict windows, and transport through `cyclotomicWindowBaseChange`.
Apply `cyclotomicWindowDescent` for intermediate `K`. These functors recover
the crystal integrally and preserve duality and the stated base changes.
For arbitrary `d`, recover the Tate module by this inverse classification
followed by §R07.1.8's Tate functor. Wach and Kisin–Ren modules for `d = 0`:
Berger–Breuil's maximal distinguished submodule and Kisin–Ren's `φ`-stable one, compared through
`E_n(u)` (Cais–Lau, Proposition 4.5.2 and Remark 4.5.3). (Cais–Lau 2017, §1, Theorem 1, p. 2;
§2.4–2.5, Definition 2.4.1, Propositions 2.4.3 and 2.5.2, pp. 10–11 (arXiv:1412.3174v2): the `(φ, Γ)`-module classification of `p`-divisible groups over `O_K⟦t⟧` and the filtered Dieudonné crystal and
windows behind it; Cais–Lau 2017, §4.5, (4.5.1), Proposition 4.5.2 and Remark 4.5.3, pp. 31–32: Wach
modules, Kisin–Ren modules and their comparison with `M(G)`.)

*Needs:* `cyclotomicWindowBaseChange`; `cyclotomicCrystalWindowEquivalence`;
`cyclotomicStrictActionConnection`; `cyclotomicWindowDescent`; §R07.1.8;
PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.4.21; §R07.4.4;
§R07.P5 (`dCris`, `IsCrystalline`).

**Checks.**

- `wach_mu`: `G = μ_{p^∞}` over `O_F (r = 1): M(G) = 𝔖_cyc·e` is the Wach module of `ℤ_p(−1) = T_p(μ_{p^∞})^∨` (basis `u ⊗ e^∨`), with `φ(e) = (φ(u)/u)·e = E·e`, of `E`-height exactly `1`, and `γ(e) = (γ(u)/(χ(γ)u))·e`, a unit congruent to `1 mod u`; so `Γ` acts trivially on `M/uM` as the definition
  requires. `Γ` does not act through the cyclotomic character on this basis.
- `wach_dyadic`: for `p = 2` the theorem is not claimed; the frame `S` used in the proof needs `p > 2`.
- `wach_unit`: `G = ℚ_p/ℤ_p` gives `M(G) = 𝔖_cyc` with `φ = φ` and trivial `Γ_K`, of `E`-height `0`.

### R07.4.27 Filtered `(φ, N, F/F′, E)`-modules and Weil–Deligne types

Define `FilteredPhiNModuleDD`. A filtered `(φ, N, F/F′, E)`-module of rank `n` is a free `F₀ ⊗_{ℚ_p} E`-module `D` of rank `n` with an `F₀`-semilinear, `E`-linear automorphism `φ`, a nilpotent `F₀ ⊗ E`-linear `N`
with `Nφ = pφN`, a decreasing exhaustive separated filtration on `D_F = F ⊗_{F₀} D`, and an
`F₀`-semilinear, `E`-linear action of `Gal(F/F′)` commuting with `φ` and `N` and preserving the filtration. It
is weakly admissible if the underlying filtered `(φ, N)`-module over `F` (forgetting the
`Gal(F/F′)`-action) is weakly admissible. Let `α_{F′} : W_{F′} → ℤ` send arithmetic Frobenius to `1` and put
`a(g) = [k_{F′}:F_p]α_{F′}(g)`. If `g_D` is the semilinear descent action,
`r(g) = g_D ∘ φ^{−a(g)}` is `F₀ ⊗ E`-linear and defines `WD(D)`, with
`r(g)Nr(g)^{−1} = p^{a(g)}N`. Here the Weil norm is `|g| = p^{−a(g)}`, so the
monodromy factor is `|g|^{−1}` in this arithmetic-Frobenius convention;
for `V` an `E`-representation of `G_{ℚ_p}` semistable over `F, WD(V) = WD(D^F_st(V))` and the Galois type
`τ(V) = WD(V)|_{I}`, independent of `F`. Structure: when `F ⊆ E`, every `(F, E, G)`-module (an `F ⊗_K E`-module with semilinear `G = Gal(F/K)`-action) is free and isomorphic to `∐_{σ: F ↪ E} V` for an
`E`-vector space `V`.

`p` is odd; `E` and `F` are finite extensions of `ℚ_p` inside `ℚ̄_p, F′ ⊆ F` with `F/F′` Galois, `F₀` the maximal
unramified subfield of `F`, and the uniformiser `p` of `ℚ_p` fixes the embedding `B_st ⊂ B_dR` (Savitt,
§2.2).

*Construction.* `(F, E, G)`-modules are free by Galois descent: `M = F ⊗_K M^G` and `M^G` is an `E`-vector
space (Savitt, Lemma 2.1). For `F ⊆ E, θ : F ⊗_K E ≅ ∐_σ E, f ⊗ e ↦ (σ(f)e)_σ`, is an isomorphism of
`(F, E, G)`-modules, and `M ≅ ∐_σ M_σ` with the `M_σ` identified by the `G`-action (Lemma 2.2, Proposition
2.4). The `p`-power Frobenius acts on `F₀` by `σ`; the descent action of `g` acts on `F₀` by
`σ^{a(g)}`, so `φ^{−a(g)}` cancels it. The two actions commute. From `Nφ = pφN`
one gets `φ^{−a(g)}Nφ^{a(g)} = p^{a(g)}N`. Thus `r` gives a representation on each `M_σ`, all
isomorphic (Definition 2.6). Weak admissibility is that of Breuil–Mézard for the underlying module
(Definition 2.8); the properties of `WD(V)` (independence of `F, ⊗, WD(ε_F)` unramified) are from
Conrad–Diamond–Taylor, App. `B`.`2`, as recalled by Savitt. (Savitt 2005, §2.2, Definition 2.7, p. 6:
the definition; Savitt 2005, §2.2, Definition 2.8, p. 6: weak admissibility; Savitt 2005, §2.2,
Definition 2.15, p. 8: the Galois type.)

The API:

- `FilteredPhiNModuleDD`: A filtered `(φ, N, F/F′, E)`-module.
- `FilteredPhiNModuleDD.galoisAction`: The semilinear `Gal(F/F′)`-action commuting with `φ` and `N` and
  preserving the filtration.
- `FilteredPhiNModuleDD.IsWeaklyAdmissible`: Weak admissibility of the underlying filtered `(φ, N)`-module.
- `FilteredPhiNModuleDD.weilDeligne`: `WD(D)` with `r(g) = g_D ∘ φ^{−[k_{F′}:F_p]α_{F′}(g)}` and its arithmetic norm relation.
- `galoisType`: `τ(V) = WD(V)|_{I}`.

*Needs:* §R07.3.1; §R07.3.2.

**Checks.**

- `dst_unramified_quadratic`: `F = F′ = E = ℚ_{p²}, D = F₀ ⊗ E` and `φ = σ ⊗ 1`.
  Arithmetic Frobenius has `a(g) = 2`, so `r(g) = φ^{−2} = 1` is `F₀ ⊗ E`-linear;
  `φ^{−1}` would interchange the two embeddings and fail linearity.
- `dst_cyclotomic_teichmuller`: For `F₁ = ℚ_p(ζ_p): D^{F₁}_{st,k}(ε^i ω̃^j λ_a) = E·e` with `N = 0, φ(e) = p^{k−i−1}a^{−1}e` and `g·e = ω̃^j(g)e` (Savitt, Example 2.13).
- `trivial_descent`: `F′ = F`: the `Gal(F/F′)`-action is trivial and the object is a filtered `(φ, N)`-module with coefficients.
- `not_commuting_action`: A `Gal(F/F′)`-action that does not commute with `φ` does not define an object,
  even if `D_F` with its filtration is weakly admissible.
- `galoisType_principal_series`: `τ(V)` for `V = ω̃^i ⊕ ω̃^j` (unramified twists) is `ω̃^i ⊕ ω̃^j` on `I`
  (Example 2.16).

### R07.4.28 Potentially semistable representations and filtered modules with descent data

Prove `potentiallySemistableDescentEquivalence`. `D^F_st(V) = (B_st ⊗ V)^{G_F}` and `V^{F′}_st(D) = (B_st ⊗_{F₀} D)^{φ=1, N=0} ∩ Fil⁰(B_dR ⊗_F D_F)` are quasi-inverse equivalences between
`E`-representations of `G_{F′}` that become semistable over `F` and weakly admissible filtered `(φ, N, F/F′, E)`-modules. With `D^F_{st,k}(V) = D^F_st(V(1 − k))` and `V^{F′}_{st,k}(D) = (B_st ⊗ D)^{φ=p^{k−1}, N=0} ∩ Fil^{k−1}(B_dR ⊗ D_F) ≅ V^{F′}_st(D)(k − 1), V^{F′}_{st,k}` is an equivalence
from weakly admissible `D` with `Fil⁰D_F = D_F` and `Fil^k D_F = 0` to representations semistable over `F`
with Hodge–Tate weights in `{0, …, k − 1}`.

The setting is Savitt's setting of §R07.4.27. Colmez–Fontaine (weakly admissible implies admissible)
is §R07.4.13.

*Proof sketch.* `G_{F′}` acts on `B_st` and, through `Gal(F/F′)`, on `D`, and `B_st ⊂ B_dR` is
Galois-equivariant, so `D^F_st(V)` carries the descent data and `V^{F′}_st(D)` is a
`G_{F′}`-representation, semistable over `F` of dimension `rk D` by the Colmez–Fontaine theorem
(§R07.4.13; Savitt, §2.2). The natural map `B_st ⊗ V^{F′}_st(D) → B_st ⊗ D` is `G_{F′}`-equivariant; its
`G_F`-invariants give `D^F_st(V^{F′}_st(D)) ≅ D`, an isomorphism of `(φ, N, F, E)`-modules that respects
`Gal(F/F′)` (Proposition 2.9); similarly `V ≅ V^{F′}_st(D^F_st(V))`. `V^{F′}_{st,k}(D) ≅ V^{F′}_st(D)(k − 1)` as in Breuil–Mézard, Lemme 3.1.1.2 (Lemma 2.11), which gives the weight-range statement
(Corollary 2.12). (Savitt 2005, §2.2, Proposition 2.9, p. 6: the equivalence; Savitt 2005, §2.2,
Corollary 2.12, p. 7: the weight range.)

*Needs:* PadicPeriodRings §§4.1–4.3 (`generalBasePeriodRings`); §R07.4.27; §R07.3.3; §R07.4.13;
PadicPeriodRings §4.1 (`B_st`).

**Checks.**

- `psDescent_weight_two`: `k = 2`: representations semistable over `F` with weights `{0,1}`
  correspond to weakly admissible `D` with `Fil⁰ = D_F` and `Fil² = 0`. The potentially
  Barsotti–Tate subcategory additionally requires `N = 0`.
- `psDescent_trivial`: `F = F′` recovers the Colmez–Fontaine equivalence for semistable
  representations with coefficients.
- The Tate-curve representation has weights `{0,1}` and nonzero monodromy `N`, which
  persists under finite extension. It is potentially semistable and is never potentially crystalline.

### R07.4.29 Weakly admissible modules of Hodge–Tate weights `(0, 1)` and tame type

Prove `tameTypeWeightTwoFilteredModules`. Let `V` be a `2`-dimensional potentially semistable
`E`-representation of `G_{ℚ_p}` with Hodge–Tate weights `(0, 1)` and tame type `τ(V)`. Then `τ(V) = ω̃^i ⊕ ω̃^j` (principal series) or `ω̃₂^m ⊕ ω̃₂^{pm}` with `p + 1 ∤ m` (supercuspidal). `(1)` If `τ(V) = ω̃^i ⊕ ω̃^j` with `i ≢ j mod p − 1` and `V` is indecomposable, `V` is crystalline over `F₁ = ℚ_p((−p)^{1/(p−1)})`
and `D^{F₁}_{st,2}(V) = D_{x₁,x₂}: E e₁ ⊕ E e₂` with `φ(e_i) = x_i e_i, N = 0, Fil¹ = (F₁ ⊗ E)(π^{j−i}e₁ + e₂), g·e₁ = ω̃(g)^i e₁, g·e₂ = ω̃(g)^j e₂, x_i ∈ O_E` and `v_p(x₁x₂) = 1`; over `F₂` the
analogous `D′_{x₁,x₂}` with `(D′_{x₁,x₂})^{Gal(F₂/F₁)} = D_{x₁,x₂}`. `(2)` If `E ⊇ ℚ_{p²}` and `τ(V) = ω̃₂^m ⊕ ω̃₂^{pm}, m = i + (p + 1)j` with `i ∈ {1, …, p}, V` is crystalline over `F₂ = ℚ_{p²}((−p)^{1/(p²−1)})`
and `D^{F₂}_{st,2}(V) = D_{m,[a:b]}: φ(e₁) = e₂, φ(e₂) = (1 ⊗ x)e₁` with `v_p(x) = 1, Fil¹ = (F₂ ⊗ E)((ϖ^{(p−1)i} ⊗ a)e₁ + (1 ⊗ b)e₂)`, with the descent data of Proposition 2.18. `(3)` All of these
filtered modules are weakly admissible.

The setting is Savitt's setting of §R07.4.27. The types are recalled from Conrad–Diamond–Taylor; `ω̃`
is the Teichmüller lift of the mod-`p` cyclotomic character and `ω̃₂(g) = g(ϖ)/ϖ` for `ϖ = (−p)^{1/(p²−1)}`.

*Proof sketch.* A nonscalar tame type forces potentially crystalline (Breuil–Mézard, Lemme 2.2.2.2),
and `τ|_{I_{F₁}}` (resp. `I_{F₂}`) is trivial, so `V` is crystalline over `F₁` (resp. `F₂`) and `N = 0` (Savitt,
Proposition 2.17). The Galois action diagonalises `D` on a basis with characters `ω̃^i, ω̃^j`; `φ`
commutes with it, so `φ` is diagonal; the `Gal`-stable filtration line is `(π^{j−i}a e₁ + b e₂)`, and
indecomposability forces `a, b ≠ 0`. Supercuspidal case: the two embeddings `σ₁, σ₂` of `ℚ_{p²}` split `D`;
`g_φ` swaps them with `g_φ g g_φ = g^p`, and `φ` swaps them, which gives the normal form `D_{m,[a:b]}`
(Proposition 2.18); the second principal-series form over `F₂` is Proposition 2.20. Weak
admissibility: every `φ`-stable proper submodule of `D_{m,[a:b]}` is generated by `u(ae₁ + be₂), v(bxe₁ + ae₂)` for the idempotents `u, v` of `ℚ_{p²} ⊗ E`, and has `t_H = 0 ≤ t_N` (Proposition 2.21). (Savitt 2005,
§2.2, Proposition 2.17, pp. 8–9: principal series; Savitt 2005, §2.2, Proposition 2.18, p. 9:
supercuspidal; Savitt 2005, §2.2, Proposition 2.21, p. 10: weak admissibility.)

*Needs:* §R07.4.28; §R07.4.27.

**Checks.**

- `tameType_ordinary`: `x₁ = 1, x₂ = p` (the ordinary case): `D_{1,p}` is weakly admissible; the unit
  root line is `E e₁`.
- `tameType_supercuspidal`: the supercuspidal modules match Fontaine–Mazur's 'type IV' when `E = ℚ_p`
  (Savitt, Remark 2.19).
- `tameType_valuation`: `v_p(x₁x₂) = 1` is forced by weak admissibility (`t_N = t_H = 1`); `x₁ = x₂ = 1` gives `t_N = 0 ≠ 1` and no representation.

### R07.4.30 Lattices in potentially Barsotti–Tate representations and `p`-divisible groups with descent data

Prove `descentDataPDivisibleGroups`. Descent data relative to `F′` on a `p`-divisible group `G` over `O_F`
is a collection of morphisms `[g] : G → ᵍG`, `g ∈ Gal(F/F′)`, of `p`-divisible groups over `O_F` with
`[1] = id` and `[gh] = (ᵍ[h]) ∘ [g]`, using the canonical identifications of iterated pullbacks
(`ᵍG` is the base change by `g`). The unit and cocycle laws make each `[g]` an isomorphism, with
inverse `ᵍ[g⁻¹]`. Sending a `G_{F′}`-stable `ℤ_p`-lattice `T` to the `p`-divisible
group over `O_F` prolonging the generic group `Γ = ∪Γ(n)` of the `T/pⁿ`, with its descent data, is an
equivalence between `G_{F′}`-stable lattices in potentially crystalline representations that become
crystalline over `F` with Hodge–Tate weights in `{0, 1}`, and `p`-divisible groups over `O_F` with descent
data relative to `F′`; the inverse is `G ↦ lim_n G(n)(O_{ℚ̄_p})` with its `G_{F′}`-action.

The setting is Savitt's setting of §R07.4.27. Savitt's Definition 3.1 prints the index set as
`Gal(F′/F)`; since `F′ ⊆ F` the group is `Gal(F/F′)`.

*Proof sketch.* `Γ(n) = Spec Maps_{G_F}(T/pⁿ, ℚ̄_p)` carries a `Gal(F/F′)`-action `g·f = g̃ ∘ f ∘ g̃^{−1}`, independent of the lift `g̃` and compatible in `n`, giving `g`-semilinear `⟨g⟩ : Γ → Γ` and `[g] : Γ → ᵍΓ` with `[1] = id` and `[gh] = (ᵍ[h]) ∘ [g]` (Savitt, §3.1). `Γ` prolongs to a `p`-divisible group over `O_F`:
crystalline with Hodge–Tate weights in `{0, 1}` gives one lattice from a `p`-divisible group (Breuil
2000, Th. 5.3.2 for `p ≠ 2` and finite residue field; for every `p`, §R07.4.20), and schematic closure
transports it to every lattice (Raynaud, §§2.2–2.3). Tate's full faithfulness extends each `[g]`
uniquely to the prolongation; uniqueness preserves both the unit and cocycle laws (Savitt, §3.1).
Conversely descent
data gives compatible `Gal(F/F′)`-actions on the bigebras `R_n` of `G(n)`, and `σ·f = σ ∘ f ∘ (σ^{−1}|_F)`
defines a `G_{F′}`-action on `lim G(n)(O_{ℚ̄_p})`; the two constructions are inverse (Proposition 3.2).
(Savitt 2005, §3.1, Definition 3.1, p. 12: the definition; Savitt 2005, §3.1, Proposition 3.2, p.
12: the equivalence; Breuil 2000, Théorème 5.3.2, p. 51: Breuil's theorem as Savitt uses it.)

*Needs:* §R07.4.20; §R07.1.22; §R07.1.20; §R07.1.6.

**Checks.**

- `descentData_trivial`: `F = F′`: the unit law forces the sole map `[1]` to be the identity,
  and the statement is the lattice form of §R07.4.20.
- For `F = F′ = ℚ_p`, `p > 2` and the nonzero height-one group `G = ℚ_p/ℤ_p`, the family
  `[1] = 0` satisfies the cocycle equation but violates the unit law, so it is excluded. For
  any Galois group the all-zero family is excluded on every nonzero group. The module-side
  theorem `SemilinearDescentData.not_all_zero` excludes the all-zero action on a nonzero module.
- `descentData_tame`: a potentially Barsotti–Tate lattice of tame type becoming crystalline over `F₁ = ℚ_p(ζ_p)` gives a `p`-divisible group over `ℤ_p[ζ_p]` with an action of `Gal(F₁/ℚ_p) ≅ (ℤ/p)^×`.
- `descentData_cocycle`: the cocycle condition is `[gh] = (ᵍ[h]) ∘ [g]`; the condition `[gh] = [g] ∘ [h]` without the twist by `g` is not well typed, since `[h] : G → ʰG` and `[g] : G → ᵍG` have
  different targets.

### R07.4.31 Strongly divisible modules with tame descent data

**Breuil's syntomic sheaves and completed period rings.** Construct `breuilSyntomicPeriods`.
Let `F/ℚ_p` be finite with uniformiser `π`, residue field `k_F` and Breuil ring `S` of §R07.4.1.
Construct the small `p`-adic formal syntomic site of `O_F`, with flat formally finitely
presented local complete intersection objects and jointly surjective syntomic covers.
For `X` in this site put `X_n = X ×_{O_F} O_F/p^n`. Define `O^cris_{n,π}` by sheafifying
the PD envelope of
`W_n(k_F)[u] ⊗_{φ^n,W_n(k_F)} W_n(Γ(X₁,O_{X₁})) → Γ(X_n,O_{X_n})`,
where `u` maps to `π` and Witt coordinates map by the lifted Witt evaluation; the divided
powers extend those on `(p)`. Construct its augmentation kernel `J^cris_{n,π}`, crystalline
Frobenius, divided `φ₁`, reduction maps and multiplication-by-`p` inclusions. Supply sheaf
descent and the direct-limit sheaves `O^cris_{∞,π}, J^cris_{∞,π}` along those inclusions.

Using compatible `p`-power roots of `π`, construct
`Â_cris = lim_n O^cris_{n,π}(O_{ℚ̄_p})`, equivalently the `p`-adic completion of
`A_cris[(u−[π̃])^i/i!]`. Construct `Â_st` as the `p`-adic completion of the PD polynomial
algebra `A_cris[X^i/i!]`, with `φ(1+X) = (1+X)^p` and `N(X) = 1+X`. Its total filtration
is generated by `Fil^a A_cris · X^b/b!` with `a+b ≥ r` in degree `r`. Supply its `G_F`-action
and `S`-action `u ↦ [π̃]/(1+X)`.
The embedding `Â_cris → Â_st` and specialization `X ↦ 0` to `A_cris` preserve filtration
and Frobenius. Construct the torsion versions `A[1/p]`/A for these rings, their divided
`φ_{k−1}` for `1 ≤ k ≤ p`, and the semilinear `G_{F′}`-actions under Hypotheses 3.5 used
in `T_st`. (Savitt 2005, §3.2, pp. 12–13; Breuil 1999b, §2.2.2, as described in Savitt §3.2: the completed period
rings; Breuil 2000, §2.3: the syntomic sheaves.)

*Needs:* §R07.4.1; PadicPeriodRings §§4.1–4.3 `generalBasePeriodRings`; DerivedDeRhamCohomology §§PD.1–PD.7
(PD envelopes); DerivedModuleAlgebra §0.4 (cotangent complexes) and DerivedDeRhamCohomology §0.20 (syntomic morphisms);
Tau Ceti `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`
(`RingTheory/Syntomic/StandardSyntomic.lean`: affine syntomic charts).

**Checks.**

- For `n = 1, E(u)` lies in `J^cris_{1,π}`; crystalline `φ` vanishes on this kernel,
  while divided `φ₁` sends `E(u)` to the image of the unit `c = φ(E(u))/p ∈ S`.
  Thus `φ₁` on the reduction is distinct from reduction of `φ`.
- The torsion direct system uses multiplication by `p`; its limit is the `p`-divisible
  coefficient sheaf. The hatted period ring uses reduction maps and an inverse limit,
  and is `p`-adically complete and `p`-torsion free.
- In `Â_st, N(u) = −u` under `u = [π̃]/(1+X)`, and `Nφ = pφN`. Specialization `X ↦ 0`
  preserves filtration and `φ` but does not preserve `N: N(X)` specializes to `1` whereas `N(0) = 0`.

**Strongly divisible modules and their descent data.**

Construct `StronglyDivisibleModule`. Let `R = O_F` with ramification `e, S = S_R` the `p`-adic completion
of `W(k)[u, u^{ie}/i!]`, with `φ(u) = u^p, N(u) = −u` and `c = φ₁(E(u))`. Use
`I_N=breuilMonodromyIdeal` of §R07.4.1, generated by `u^i/⌊i/e⌋!` for `i≥1`.
The ring divisibility `φ(Fil^{k−1}S) ⊆ p^{k−1}S` defines `φ_{k−1} = φ/p^{k−1}`
for `1 ≤ k ≤ p`. For the module categories assume `1 ≤ k ≤ p−1`. `Mod^{k−1}_0`
(strongly divisible modules of weight `k`) consists of finite free `S`-modules `M` with
`Fil^{k−1}M ⊇ (Fil^{k−1}S)M, Fil^{k−1}M ∩ pM = p Fil^{k−1}M`, and `φ_{k−1} : Fil^{k−1}M → M` semilinear
with `φ_{k−1}(Fil^{k−1}M)` generating `M`; `Mod^{k−1}_{cris}` adds a `W(k)`-linear derivation `N` with `N(M) ⊆ I_N M, E(u)N(Fil^{k−1}M) ⊆ Fil^{k−1}M` and
`φ_{k−1}(E(u)N(x)) = cN(φ_{k−1}(x))` for `x ∈ Fil^{k−1}M`.
For general `k` this `N` is structure data. Under
Hypotheses 3.5, `Mod_dd` adds additive bijections `ĝ, g ∈ Gal(F/F′)`, with `ĝ(sx) = ĝ(s)ĝ(x)`, preserving
`Fil^{k−1}` and commuting with `φ_{k−1}` (and `N`), and `ĝ₁ ∘ ĝ₂ = (g₁g₂)^. Mod^1_{0,dd}` (`≅ Mod^1_{cris,dd}`
with its canonical `N`) is the category of strongly divisible modules with tame descent data (of
weight `2`). For a `p`-divisible group `G` over `O_F, M_π(G) = lim_n Hom_{(Ab/R)}(G(n), O^cris_{n,π})` with
`Fil¹` from `J^cris` and `φ₁` is a strongly divisible module `(p ≠ 2)`, and descent data on `G` relative to `F′`
is equivalent to descent data `ĝ` on `M_π(G)`.

The setting is Savitt's setting of §R07.4.27. Savitt's Hypotheses 3.5: `F/F′` is tamely ramified, `π` is
a uniformiser of `F` with `π^{e(F/F′)} ∈ F′`, and `g(π) = h_g π` with `h_g ∈ W(k)` for `g ∈ Gal(F/F′)`; `ĝ` acts
on `S = S_{O_F}` by `ĝ(Σ w_i u^i/⌊i/e⌋!) = Σ g(w_i) h_g^i u^i/⌊i/e⌋!`. The results of Breuil 2000 that
Savitt uses are Théorèmes 4.2.1.6, 4.2.2.5, 4.2.2.9 `(p ≠ 2)` and 5.3.2, Corollaire 4.2.2.7, Lemme
4.2.2.8 and Propositions 2.1.2.2 and 5.1.3. The syntomic sheaves `O^cris_{n,π}, J^cris_{n,π}` and the
construction `M_π` are Breuil's (Breuil 2000, §§2.3, 4.2); the comparison with the Dieudonné crystal
of §R07.4.18 is not used.

*Construction.* Breuil's functor: `M_π(G(n)) ∈ Mod^1_0` and `M_π(G)` is a strongly divisible module
(Breuil 2000, Cor. 4.2.2.7 and Lemme 4.2.2.8), and `G ↦ M_π(G)` is an anti-equivalence with strongly
divisible modules for `p ≠ 2` (Th. 4.2.2.9). Base change: for `g` with `g(π) = h_g π, M_π(G) ⊗_{S,ĝ} S ≅ M_π(ᵍG)` compatibly with `Fil¹, φ₁` and morphisms, and cocycles compose (Savitt, Proposition 3.3, after
BCDT01 Cor. 5.4.5). A `g`-semilinear `⟨g⟩ : G → G` with `[g]` a morphism over `R` is the same as an additive
`ĝ` on `M_π(G)` that is `ĝ`-semilinear and commutes with `Fil¹` and `φ₁` (Corollary 3.4); with the cocycle
condition this is descent data (Corollary 3.6, Definition 3.7). Canonical `N`: every finite free strongly
divisible module of weight two `(k = 2, p > 2)` has a unique `N` with `N(sx) = N(s)x + sN(x), Nφ₁ = φN` and `N(M) ⊆ I_N M` (Breuil 2000,
Prop. 5.1.3(1)); `ĝ` commutes with `φ`, since `ĝ(E(u)) = E(u)` when `π^{e(F/F′)} ∈ F′`, hence with `N` by
uniqueness (Savitt, §3.5). (Savitt 2005, §3.2, p. 14: strongly divisible modules; Savitt 2005, §3.3,
Definition 3.8, p. 17: the category with descent data; Breuil 2000, Théorème 4.2.2.9, p. 46:
Breuil's classification `(p ≠ 2)`.)

The API:

- `StronglyDivisibleModule`: An object of `Mod^{k−1}_0` for `1 ≤ k ≤ p−1`: finite free `S`-module
  with `Fil^{k−1}, φ_{k−1}`; general-weight `Mod^{k−1}_{cris}` also carries compatible `N`.
- `StronglyDivisibleModule.descentData`: The semilinear bijections `ĝ, g ∈ Gal(F/F′)`, with the
  cocycle condition. Their underlying data on a module over a ring with an action of `Gal(F/F′)`
  by ring automorphisms is the light structure `SemilinearDescentData` (additive bijections with
  `ĝ(s m) = g(s) ĝ(m)`, `ĝ₁ ∘ ĝ₂ = (g₁g₂)^` and `1̂ = id`, with
  `SemilinearDescentData.act_mul_apply`); compatibility with `Fil^{k−1}`, `φ_{k−1}` and `N` is
  imposed on the strongly divisible module.
- `StronglyDivisibleModule.monodromy`: For `k = 2` and `p > 2`, Breuil's unique `N`
  (Prop. 5.1.3), commuting with the `ĝ`, and `Mod¹_0 ≃ Mod¹_cris`.
- `StronglyDivisibleModule.ofPDivisible`: `G ↦ M_π(G)`, with descent data transported (Corollary 3.6).
- `StronglyDivisibleModule.ofPDivisible_antiequiv`: For `k = 2` and `p > 2`, an anti-equivalence between
  finite free strongly divisible modules and finite-height `p`-divisible groups over `O_F`.

*Needs:* `breuilSyntomicPeriods` above; §R07.4.18; §R07.4.1; §R07.4.30.

**Checks.**

- `StronglyDivisibleModule.unit_is_object`: `S` with `Fil^{k−1}S` and `φ_{k−1}` is an object of
  `Mod^{k−1}_{cris}`: its derivation has `N(S)⊆I_N`; after coefficient extension
  the unit has `N(S_R)⊆J_N`. The condition `N(S)⊆Fil¹S` would fail on `u`.
- `StronglyDivisibleModule.rank_one_character`: For `E = ℚ_p: S·e` with `Fil¹ = Fil¹S·e, φ(e) = a^{−1}e (a ∈ ℤ_p^×), ĝ(e) = ω̃^j(g)e` is an object (Savitt, Proposition 5.1).
- `StronglyDivisibleModule.not_strongly_divisible`: `M = S e` with `Fil¹M = Fil¹S·e + pM` contains
  `(Fil¹S)M`, but `e ∉ Fil¹M`, so `Fil¹M ∩ pM = pM ≠ p Fil¹M`: not strongly divisible.
- `semilinearDescent_ring`: ring automorphisms acting on the ring itself give
  semilinear descent data; the scalar action can be nontrivial.
- `semilinearDescent_sign`: with trivial scalar action of `ℤ^×` on `ℚ`, multiplication
  by the integer unit gives a nontrivial rank-one descent action.
- `semilinearDescent_not_double`: requiring the order-two element `−1` to act on `ℚ`
  by multiplication by `2` violates the cocycle condition, despite being an additive bijection.
- The countable direct sum of weight-two unit modules satisfies the filtration and
  Frobenius relations, but is excluded by finite rank and cannot represent a finite-height
  `p`-divisible group. The canonical-monodromy assertion applies only at `k = 2`.
- `StronglyDivisibleModule.zero`: The zero module, corresponding to the trivial `p`-divisible group.

### R07.4.32 Strongly divisible modules with descent data classify potentially Barsotti–Tate lattices

Prove `descentDataLatticeClassification`. Assume Hypotheses 3.5, `k = 2` and `p > 2`. `(1)` If `G` is a `p`-divisible group
over `O_F` with descent data relative to `F′` and `M` its strongly divisible module with descent data,
`T_p(G) ≅ Hom_{′Mod^1_0}(M, Â_cris)` as `G_{F′}`-lattices, and `Â_cris ⊂ Â_st` induces `Hom_{′Mod^1}(M, Â_cris) = Hom_{′Mod^1}(M, Â_st)`. `(2)` Every strongly divisible module `M` with tame descent data is
contained in `S[1/p] ⊗_{F₀} D` for a filtered `(φ, N, F/F′, ℚ_p)`-module `D` with `N = 0, Fil⁰D_F = D_F` and
`Fil²D_F = 0`. `(3)` If `ρ : G_{F′} → GL(V)` becomes crystalline over `F` with Hodge–Tate weights in `{0, 1}`,
then `T^{F′}_{st,2}(M) = lim_n (H_n(M)^∧(1))`, where
`H_n(M) = Hom_{′Mod¹}(M/pⁿM, Â_{st,∞})`, is an equivalence between
strongly divisible modules with tame descent data contained in `S[1/p] ⊗_{F₀} D^F_{st,2}(V)` and
`G_{F′}`-stable lattices in `ρ`. For a finite `p`-primary module `X`, write
`X^∧ = Hom_{ℤ_p}(X, ℚ_p/ℤ_p)`, with the contragredient Galois action and trivial action on
`ℚ_p/ℤ_p`; `(1)` is the cyclotomic twist. The quotient
`q_n : M/p^{n+1}M → M/pⁿM` gives the injection
`j_n : H_n(M) → H_{n+1}(M)`, `h ↦ h ∘ q_n`. The inverse-limit transition is its dual
`j_n^∧(1) : H_{n+1}(M)^∧(1) → H_n(M)^∧(1)`, sending a functional to its restriction along
`j_n`, with the same twist. Thus the dual is taken before the inverse limit.

The setting and the tameness hypotheses are those of §R07.4.27 and §R07.4.31. Breuil's period rings
`Â_cris ⊂ Â_st` (Breuil 1999b, §2.2.2, as described in Savitt §3.2) are used as Savitt describes them; Savitt's "filtered `(φ, N, F/F′, ℤ_p)`-module" in §3.5 means the module with `ℚ_p`-coefficients.

*Proof sketch.* `G(n)(O_{ℚ̄_p}) = Hom_{′Mod^1_0}(M/pⁿM, O^cris_{n,π}(O_{ℚ̄_p}))` as `G_F`-modules
(Breuil 2000, Th. 4.2.2.9 and §4.2.1); it is `G_{F′}`-equivariant: for `A` with a `Gal(F/F′)`-semilinear
`G_{F′}`-action, the bijection `G(n)(A) ≅ Hom_{(φ₁,Fil¹)}(M(G(n)), O^cris_{n,π}(A))` commutes with `g̃` by
a diagram of functorial squares and untwisting maps; pass to the limit (Savitt, Theorem 3.10).
`Â_cris ⊂ Â_st`: an `Â_st`-valued morphism lands in `Â_cris[1/p]` (Breuil 2000, Prop. 5.1.3 and `N = 0` on
`A_cris`), and the divisibility `p | φ₁((u − π)^i/i!)` for `i ≥ 2` (`p` odd) shows that `γ(M) ⊆ pÂ_st` implies
`γ(M) ⊆ pÂ_cris` (Proposition 3.11). `(2)`: forgetting descent data, Breuil 2000 Prop. 5.1.3(2) gives `D`
with `M ⊗ F₀ ≅ S[1/p] ⊗ D` and `D = ker N`; `ĝ` commutes with `N`, so it acts on `D` (Lemma 3.13). `(3)`: by
`(2)`, Theorem 3.10, Corollary 3.6 and Propositions 3.2, 3.11 it remains that `T^{F′}_{st,2}(M)` is a
`G_{F′}`-lattice in `ρ`, which is Breuil–Mézard's Lemme 3.2.3.1 with `G_{F′}`-maps in place of `G_F`-maps
(Theorem 3.14). (Savitt 2005, §3.4, Theorem 3.10, p. 18: Theorem 3.10; Savitt 2005, §3.5, Theorem
3.14, p. 21: Theorem 3.14; Savitt 2005, §3.5, Lemma 3.13 and the paragraph before it, p. 20: the
descent of the filtered module.)

*Needs:* §R07.4.31 `breuilSyntomicPeriods`; §R07.4.31; §R07.4.30; §R07.4.28.

**Checks.**

- `descentDataLattice_trivial`: `F = F′`: Breuil's classification of lattices in crystalline
  representations with Hodge–Tate weights `{0, 1}` for `p ≠ 2`.
- `descentDataLattice_rankOne`: rank one: the strongly divisible module of Proposition 5.1 gives the
  lattice `O_E(ε ω̃^j λ_a)` (Savitt, §5).
- For `F = F′ = ℚ_p`, `p > 2` and the strongly divisible module of `G = ℚ_p/ℤ_p`, the `Hom`
  groups are `H_n(M) ≅ ℤ/pⁿ`, with `j_n` identified with multiplication by `p` into `ℤ/p^{n+1}`.
  The dual transitions are reduction, so `T_st,2(M) ≅ ℤ_p(1)` is torsion-free and finite free of
  rank one. In contrast, dualizing the un-dualized `Hom` lattice `T_p(G) = ℤ_p` gives
  `Hom_{ℤ_p}(ℤ_p, ℚ_p/ℤ_p) ≅ ℚ_p/ℤ_p`, a torsion group, even after twisting.

### R07.4.33 Strongly divisible `R`-modules with tame descent data and the functor `T_st`

Construct `StronglyDivisibleRModule`. Assume `1 ≤ k ≤ p−1`. Let `R` be a complete local
noetherian flat `O_E`-algebra with
residue field finite over `k_E`, and `S_R = {Σ r_j u^j/⌊j/e⌋! : r_j ∈ W(k_F) ⊗ R, r_j → 0 m_R-adically}`. Use the ideal `J_N=I_N S_R=Σ_{i≥1} S_R·u^i/⌊i/e⌋!` from §R07.4.1,
compatible with coefficient maps. A strongly divisible `R`-module with tame descent data is a finitely generated free
`S_R`-module `M` with `Fil^{k−1}M ⊇ (Fil^{k−1}S_R)M, Fil^{k−1}M ∩ IM = I Fil^{k−1}M` for every ideal `I` of
`R, φ` semilinear with `φ(Fil^{k−1}M) ⊆ p^{k−1}M` generating it, `N` a derivation with `Nφ = pφN, E(u)N(Fil^{k−1}M) ⊆ Fil^{k−1}M` and `N(M) ⊆ J_N M`, and descent data `ĝ` commuting with `φ, N` and preserving
`Fil^{k−1}`. `T^{F′}_{st,k}(M) = lim_n T^{F′}_{st,k}(M/m_R^n M)`, with `T^{F′}_{st,k}(N) = Hom_{′Mod^{k−1}}(N, Â_{st,∞})^∧(k − 1)`, is a free `R`-module of rank `rk M` with continuous
`G_{F′}`-action, compatible with reduction `mod m_R^n` and with base change `R → R′` when `M ⊗_R R′` is
strongly divisible. For `k = 2` and `R = O_E` every `G_{F′}`-stable `O_E`-lattice in a potentially
Barsotti–Tate representation becoming crystalline over `F` is `T^{F′}_{st,2}(M)` for some strongly
divisible `O_E`-module with descent data `M`.

Here `∧` is the finite-level `ℚ_p/ℤ_p`-dual of §R07.4.32. Precomposition with
`M/m_R^{n+1}M → M/m_R^n M` embeds the level-`n` `Hom` group into the level-`n+1` `Hom` group;
restriction of dual functionals gives the transition in `T_st,k(M)`. The `Hom` realization
`N ↦ Hom_{′Mod^{k−1}}(N, Â_{st,∞})` is contravariant. Duality reverses arrows again, so
`T_st,k` is covariant, both at finite level and on strongly divisible modules.

The setting and the tameness hypotheses are those of §R07.4.27 and §R07.4.31. Savitt's exposition
follows Breuil–Mézard §3.2; the lemmas of [BM02] and [Bre99] it invokes (BM02 Lemmes 3.2.2.1–3.2.2.2
and 3.2.3.1, Prop. 3.2.3.2; Breuil 1999b, Lemmes 2.3.1.1–2.3.1.3) are steps of this target.

*Construction.* `IS_R ∩ Fil^{k−1}S_R = I Fil^{k−1}S_R`, using the unique expansion `Σ r_j(u)E(u)^j/j!`
with deg `r_j < e` (Savitt, §4). Reduction: for `I ⊇ m_R^n, M/IM` with the image filtration is an object
of `Mod^{k−1}_dd` with `R/I`-action; base change to Artinian `R′` is allowed if `N = M/IM` or `R′` is free
over `R/(p^r, I)` (Lemma 4.6); finite local `R → R′` surjective, or with every ideal of `R′` having a
power `(p^r)`, preserves strong divisibility (Corollary 4.7). `T^{F′}_{st,k}(M/IM) → T^{F′}_{st,k}(M/I′M)` is surjective and `T^{F′}_{st,k}(M/IM)` is free of rank `d` over `R/I` (Lemma 4.9),
with base change (Lemma 4.10); pass to the limit (Definition 4.11, Corollary 4.12). Every
`O_E`-lattice: `T` is `ℤ_p`-isomorphic to `T_st,2` of a strongly divisible `ℤ_p`-module `M` with descent data;
`O_E` acts on the `p`-divisible group by Tate, hence on `M`; `M/(Fil¹S)M` is `O_E`-torsion free, and
Breuil–Mézard's Prop. 3.2.3.2 argument makes `M` a strongly divisible `O_E`-module (Proposition 4.13).
(Savitt 2005, §4, Definition 4.1, p. 22: the definition; Savitt 2005, §4, Corollary 4.12, p. 24:
freeness of `T_st`; Savitt 2005, §4, Proposition 4.13, p. 24: every lattice arises.)

The API:

- `StronglyDivisibleRModule`: A strongly divisible `R`-module with tame descent data (Definition 4.1).
- `StronglyDivisibleRModule.tst`: `T^{F′}_{st,k}(M)`, an `R[G_{F′}]`-module.
- `StronglyDivisibleRModule.tst_free`: `T^{F′}_{st,k}(M)` is free of rank `rk M` (Corollary 4.12).
- `StronglyDivisibleRModule.baseChange`: `M ⊗_R R′` under Corollary 4.7, with `T_st(M) ⊗ R′ ≅ T_st(M ⊗ R′)`.
- `StronglyDivisibleRModule.exists_of_lattice`: Proposition 4.13: every `O_E`-lattice arises.

*Needs:* §R07.4.31 `breuilSyntomicPeriods`; §R07.4.31; §R07.4.32.

**Checks.**

- The coefficient ring has divided `φ_{p−1}`, but `k = p` is outside the module
  classification and `T_st` freeness/base-change range `1 ≤ k ≤ p−1`.
- `StronglyDivisibleRModule.zp_coefficients`: `R = ℤ_p, k = 2`: the category is `Mod^1_{cris,dd}`
  (Example 4.2).
- `StronglyDivisibleRModule.no_descent_qp`: `F = F′ = ℚ_p`: these are Breuil–Mézard strongly divisible
  `R`-modules with `N(M) ⊆ J_N M` (Example 4.3).
- `StronglyDivisibleRModule.semistable_excluded`: A Breuil–Mézard strongly divisible module with
  `N(M) ⊄ J_N M` (semistable, not crystalline) is not an object.
- `StronglyDivisibleRModule.tst_rank_one`: For the rank-one module of Proposition 5.1, `T_st,2(M) ≅ O_E(ε ω̃^j λ_a)` is free of rank one.
- `StronglyDivisibleRModule.baseChange_unramified`: `R → O_{E′}` for a finite extension `E′/E`
  preserves strong divisibility (Remark 4.8).

### R07.4.34 Breuil modules with descent data, and the maximal and minimal ones

Define `BreuilModuleModP`. A Breuil module over `O_F` is a triple `(M′, Fil¹M′, φ₁)` with `M′` a free
`k_F[u]/u^{ep}`-module of finite rank, `Fil¹M′ ⊇ u^e M′` a submodule and `φ₁ : Fil¹M′ → M′` additive with
`φ₁(hv) = h^p φ₁(v)` and `φ₁(Fil¹M′)` generating `M′`. `M ↦ M ⊗_{S₁} k_F[u]/u^{ep}` is an equivalence `T₀`
from objects of `Mod¹` killed by `p` to Breuil modules (quasi-inverse `M′ ↦ M′ ⊗ S₁`), extending to
descent data and to `R/I`-actions. If `M′` has `Fil¹M′ = u^e M′`, then for every `M″` and
identification `α : T^{F′}_{st,2}(M′) ≅ T^{F′}_{st,2}(M″)`, there is a unique morphism
`f : M″ → M′` with `T^{F′}_{st,2}(f) = α.symm` on underlying morphisms. The realization is
covariant, as in §R07.4.33. This is the
maximal-prolongation universal property; `f` is nonzero when the common realisation is nonzero.
Dually `Fil¹M′ = M′` gives the minimal one.

The setting and the tameness hypotheses are those of §R07.4.27 and §R07.4.31,
with `k = 2` and `p > 2`. Breuil 2000, Prop.
2.1.2.2 gives the equivalence `T`; the compatibility with Dieudonné modules (BCDT01 Th. 5.1.3(3)) and
Raynaud's maximal prolongation are used in the maximality argument.

*Construction.* `T₀` is an equivalence on objects killed by `p` (Breuil 2000, Prop. 2.1.2.2), compatible
with descent data (Savitt, Remark 3.9) and with `R/I`-actions (Breuil 1998, Prop. 2.2.2.1, as cited).
`Fil¹M′ = u^e M′`: the group scheme `G′ = G_π(M′)` is étale (BCDT01 Th. 5.1.3(3)), so it equals the
maximal prolongation `(G′)⁺` of its generic fibre by the universal property of the connected–étale
sequence; hence the generic-fibre identification whose dual twist is `α.symm` extends to
`G′ → G″`, and so to `M″ → M′`
(Savitt, Lemma 4.14). Uniqueness follows because maps between finite flat groups over `O_F`
are determined on the generic fibre; descent data and coefficient actions follow by this
uniqueness. Nonzero realisation forces the resulting morphism to be nonzero. Minimal:
the dual argument with multiplicative `G′` (Remark 4.15). (Savitt 2005,
§4, Objects killed by `p`, p. 25: Breuil modules; Savitt 2005, §4, Lemma 4.14, p. 25: maximal Breuil
modules; Breuil 2000, Proposition 2.1.2.2, p. 9: the equivalence `T`.)

The API:

- `BreuilModuleModP`: A Breuil module over `k_F[u]/u^{ep}`, with descent data and `R/I`-action as extra
  structure.
- `BreuilModuleModP.T0`: Objects of `Mod¹` killed by `p ≃` Breuil modules.
- `BreuilModuleModP.IsMaximal`: `Fil¹M′ = u^e M′`.
- `BreuilModuleModP.IsMinimal`: `Fil¹M′ = M′`.
- `BreuilModuleModP.exists_hom_to_maximal`: For maximal `M′` and any fixed isomorphism
  `α : T_st(M′) ≅ T_st(M″)`, the unique morphism `f : M″ → M′` inducing `α.symm`.
- `BreuilModuleModP.exists_nonzero_hom_to_maximal`: Under the additional hypothesis
  `T_st(M′) ≠ 0`, the morphism inducing `α.symm` is nonzero.

*Needs:* §R07.4.31 `breuilSyntomicPeriods`; §R07.4.33; §R07.1.24.

**Checks.**

- `BreuilModuleModP.rank_one_maximal`: `M′ = (k_E[u]/u^{e₁p})e` with `Fil¹ = u^{e₁}M′, φ₁(u^{e₁}e) = a^{−1}e` is maximal (Remark 5.6).
- `BreuilModuleModP.minimal_example`: `Fil¹M′ = M′` with bijective Frobenius linearisation,
  for instance `φ₁(e) = e` in rank one, is a minimal Breuil module (Remark 4.15).
- `BreuilModuleModP.not_generating`: `Fil¹M′ = u^e M′` with `φ₁ = 0` does not generate `M′` and is not a
  Breuil module.
- `BreuilModuleModP.zero`: For `M′ = M″ = 0`, both maximal and minimal conditions hold;
  the unique realisation identification is induced by the zero morphism. The nonzero
  corollary does not apply.
- Take `p = 5`, `F = F′ = ℚ_5` and two separately named copies `M′ = (𝔽_5[u]/u⁵)e′`,
  `M″ = (𝔽_5[u]/u⁵)e″` with `Fil¹Mᵢ = uMᵢ` and `φ₁(ueᵢ) = eᵢ`. Choose realization bases
  `t′, t″` matched by the basis identification, and fix `α(t′) = 2t″`. The unique lift to the
  maximal `M′` is `f(e″) = 3e′`, and `T_st(f)(t″) = 3t′ = α.symm(t″)`; it cannot equal `α`.
- `BreuilModuleModP.freeness`: Breuil modules arising as reductions of strongly divisible
  `O_E`-modules are free over `(k_F ⊗ k_E)[u]/u^{ep}`; general ones with an action of `R/I` need not be
  (Savitt, §4).
- In `k[u]/u^{ep}, u^e e` is nonzero but `φ₁(u^e e) = u^{ep}φ₁(e) = 0`.
  A nonzero minimal object can have bijective linearisation without injective semilinear `φ₁`.

### R07.4.35 Strongly divisible modules and Breuil modules of characters

Prove `stronglyDivisibleModulesForCharacters`. Let `F₁ = ℚ_p(ζ_p)` with `π = (−p)^{1/(p−1)}, e₁ = p − 1`, and `F₂ = ℚ_{p²}(ϖ), ϖ = (−p)^{1/(p²−1)}, e₂ = p² − 1`. `(1) M = S_{O_E}·e, Fil¹M = Fil¹S_{O_E}·e, φ(e) = a^{−1}e, Ne = 0, ĝ(e) = ω̃^j(g)e` is a strongly divisible `O_E`-module in `S_{O_E} ⊗ D^{F₁}_{st,2}(ε ω̃^j λ_a)`; the same over `F₂`, and for `ω̃₂^m(ελ_a)|_{G_{ℚ_{p²}}}` with `ĝ(e) = (1 ⊗ ω̃₂^m(g))e`. `(2)` The Breuil module `M_E(F₁/ℚ_p, e₁, a^{−1}, j) = (k_E[u]/u^{e₁p})e, Fil¹ = u^{e₁}M′, φ₁(u^{e₁}e) = ā^{−1}e, ĝ(e) = ω^j(g)e` has `T^{ℚ_p}_{st,2} = λ_ā ω^{j+1}`; over `F₂, M_E(F₂/ℚ_p, e₂, a^{−1}, j)` has `T = λ_ā ω^{j+1}` and `M_E(F₂/ℚ_{p²}, e₂, a^{−1}, m)` has `T = λ_ā|_{G_{ℚ_{p²}}} ω₂^{m+p+1}`. These Breuil modules are maximal.

The setting and the tameness hypotheses are those of §R07.4.27 and §R07.4.31. `T_st` is a Tate twist
of the dual of `V_st`, so Savitt's characters differ by duality and a twist from those of Savitt 2004,
Th. 6.3 (Savitt, Remark 5.5).

*Proof sketch.* `(1): Fil¹D^{F₁}_{st,2}(ε ω̃^j λ_a) = 0` forces `Fil¹M = {s(u)e : s(π) = 0} = Fil¹S_{O_E}·e`; `φ` and the descent data are read off Examples 2.13–2.14 (Propositions 5.1–5.2). `(2)`:
the Breuil module is the reduction of `(1) mod m_E: (u^{e₁} + p)e ∈ Fil¹M` gives `u^{e₁}e ∈ Fil¹M′`, and
`φ₁((u^{e₁} + p)e) = (u^{e₁p}/p + 1)a^{−1}e` gives `φ₁(u^{e₁}e) = ā^{−1}e`; then Corollary 4.12(1)
(Propositions 5.3–5.4). Maximality from `Fil¹M′ = u^e M′` and Lemma 4.14 (Remark 5.6). (Savitt 2005,
§5, Proposition 5.1, p. 26: rank-one strongly divisible modules; Savitt 2005, §5, Proposition 5.3,
p. 26: rank-one Breuil modules.)

*Needs:* §R07.4.34; §R07.4.33; §R07.4.29.

**Checks.**

- `characters_cyclotomic`: `j = 0, a = 1`: the Breuil module with `T = ω`, i.e. the mod-`p` cyclotomic
  character, is `M_E(F₁/ℚ_p, e₁, 1, 0)`.
- `characters_level_two`: the characters of level `2` appear only over `F₂` and through `ω̃₂^m`.

### R07.4.36 Kisin modules with coefficients

Define `KisinModuleCoeff`. For a `ℤ_p`-algebra `A, ′(Mod/𝔖)_A` consists of pairs `(𝔐, ι)` with `𝔐 ∈ ′(Mod/𝔖)` and `ι : A → End(𝔐)` a `ℤ_p`-algebra map, and `(Mod FI/𝔖)_A` is its full subcategory of objects
that are finite projective `𝔖_A`-modules; similarly `(Mod FI/S)_A`: finite projective `S_A`-modules `𝓜` with
`𝓜/Fil¹𝓜` finite projective over `A` and `φ₁(Fil¹𝓜)` generating `𝓜`. For `𝔐 ∈ (Mod FI/𝔖)_A: (1) 1 ⊗ φ : φ*𝔐 → 𝔐` is injective; `(2)` its cokernel is a finite projective `A`-module; `(3) (1 ⊗ φ)(φ*𝔐)/E(u)𝔐` is
finite projective over `A`; `(4)` if `|A| < ∞, 𝔐` is free over `𝔖_A` locally on `Spec A`. Base change `𝔐 ↦ 𝔐 ⊗_A A′` preserves the categories. `𝔐_A` is étale (resp. multiplicative) if the image of `1 ⊗ φ` is
`E(u)𝔐_A` (resp. `1 ⊗ φ` is an isomorphism); the dual `𝔐_A^* = Hom_{𝔖_A}(𝔐_A, 𝔖_A)`, with the Frobenius
built from `E(u)𝔐_A ⊂ φ*𝔐_A`, is again an object, `𝔐_A` is étale iff `𝔐_A^*` is multiplicative, and
`𝔐_A^{**} ≅ 𝔐_A`.

Kisin 2009's standing hypotheses in §1: `k` is finite, `p ≠ 2, K/K₀` is totally ramified with
uniformiser `π` and Eisenstein polynomial `E(u)`. For a `ℤ_p`-algebra `A, 𝔖_A = 𝔖 ⊗_{ℤ_p} A` and `S_A = S ⊗_{ℤ_p} A`.

*Construction.* `(1)`: for `𝔐` of constant rank `r, det(1 ⊗ φ)` divides `E(u)^r`, which is a
non-zero-divisor of `𝔖 ⊗` A because `𝔖/E(u)^r` is `ℤ_p`-flat (Kisin 2009, 1.2.2). `(2)`–`(3): 1 ⊗ φ` stays
injective after `⊗_A A/I`, so its cokernel is `A`-flat, and finite as a quotient of `𝔐/E(u)𝔐`; `(3)` from `0 → (1 ⊗ φ)(φ*𝔐)/E(u)𝔐 → 𝔐/E(u)𝔐 → coker → 0`. `(4)`: over a finite field `A, φ` permutes the maximal
ideals of `𝔖_A` transitively and `1 ⊗ φ` embeds `φ*𝔐` in `𝔐`, so the local ranks `r_𝔭 ≤ r_{φ(𝔭)}` are all
equal, and `𝔐` is free. Base change: `Fil¹𝓜 ⊗_A A′ ⊂ 𝓜 ⊗_A A′` because `𝓜/Fil¹𝓜` is `A`-projective (1.2.3);
duality as in (1.2.10). (Kisin 2009, §1.2.1, p. 10: the category; Kisin 2009, §1.2.2, Lemma (1.2.2),
p. 10: its basic properties; Kisin 2009, §1.2.10, p. 13: duality.)

The API:

- `KisinModuleCoeff`: An object of `(Mod FI/𝔖)_A`: a finite projective `𝔖_A`-module with `φ` and `A`-action.
- `KisinModuleCoeff.baseChange`: `𝔐 ↦ 𝔐 ⊗_A A′` (Lemma 1.2.3).
- `KisinModuleCoeff.dual`: `𝔐^* = Hom_{𝔖_A}(𝔐, 𝔖_A)` with the dual Frobenius (1.2.10).
- `KisinModuleCoeff.coker_projective`: `coker(1 ⊗ φ)` is finite projective over `A` (Lemma 1.2.2(2)).
- `KisinModuleCoeff.free_of_finite`: For `|A| < ∞`, locally free over `𝔖_A` (Lemma 1.2.2(4)).

*Needs:* §R07.4.2; §R07.4.1.

**Checks.**

- `KisinModuleCoeff.coeff_zp`: `A = ℤ_p: (𝔖, φ)` with its evident `A`-action is an object, and it is
  multiplicative.
- `KisinModuleCoeff.dual_etale_multiplicative`: The rank-one étale object `𝔖_A e` with `φ(e) = E(u)e`
  has dual the rank-one multiplicative object.
- `KisinModuleCoeff.not_projective`: `A = ℤ/p², 𝔐 = 𝔖/p` with its `A`-action is not in `(Mod FI/𝔖)_{ℤ/p²}`: it is not projective over `𝔖 ⊗ ℤ/p²`.
- `KisinModuleCoeff.zero`: The zero module, étale and multiplicative at once.
- `KisinModuleCoeff.coeff_zp_bt`: `A = ℤ_p: (Mod FI/𝔖)_{ℤ_p}` is `BT^φ_{/𝔖}`, finite free `𝔖`-modules of
  `E`-height `≤ 1` (compare §R07.4.2).

### R07.4.37 Multiplicative and étale finite flat groups in terms of `(Mod/𝔖)`

Prove `multiplicativeEtaleDictionary`. Let `p > 2` and `𝔐 ∈ (Mod/𝔖)` with Breuil module `𝓜` and finite
flat group `Gr^D(𝓜)` (Kisin 2009's covariant normalisation, composing with Cartier duality). Then
`Gr^D(𝓜)` is étale iff `1 ⊗ φ : φ*𝔐 → 𝔐` has image `E(u)𝔐`, and multiplicative iff `1 ⊗ φ` is an
isomorphism. For a finite `ℤ_p`-algebra `A` with `|A| < ∞` and `𝔐_A ∈ (Mod FI/𝔖)_A`, there are a maximal
multiplicative subobject `𝔐_A^m` and a maximal étale quotient `𝔐_A^ét`, with `𝔐_A/𝔐_A^m` and `ker(𝔐_A → 𝔐_A^ét)` in `(Mod FI/𝔖)_A`, and their formation commutes with finite base change `A → B`, and there are
natural isomorphisms `(𝔐_A^*)^m ≅ (𝔐_A^ét)^*` and `(𝔐_A^*)^ét ≅ (𝔐_A^m)^*`.

The setting is the Kummer frame of §R07.4.1. Kisin 2009 assumes `k` finite and `p ≠ 2` throughout §1.

*Proof sketch.* By dévissage reduce to `p𝔐 = 0`. By Breuil–Conrad–Diamond–Taylor 5.1.3 (as cited),
`Gr^D(𝓜)` is étale (resp. multiplicative) iff `Fil¹𝓜 = 𝓜` (resp. `Fil¹𝓜 = Fil¹S·𝓜`) (Kisin 2009, 1.1.15,
proof). `1 ⊗ φ` embeds `𝓜/Fil¹𝓜` into `S ⊗ 𝔐/Fil¹S ⊗ 𝔐 ≅ 𝔐/E(u)𝔐` with image that of `φ*𝔐`, so `Fil¹𝓜 = 𝓜`
iff `1 ⊗ φ` has image `E(u)𝔐`. `𝓜/Fil¹S·𝓜 ≅ φ*𝔐/E(u)φ*𝔐`, so `Fil¹𝓜 = Fil¹S·𝓜` iff `1 ⊗ φ` is an
isomorphism. Maximal objects (Kisin 2009, 1.2.11): `1 ⊗ φ^r : (φ*)^r𝔐_A → 𝔐_A` is injective for all `r`
(`φ` flat, 1.2.2(1)); put `𝔐_A^m = ∩_r (φ*)^r𝔐_A`. `𝔐_A/𝔐_A^m` is `u`-torsion free (Artin–Rees), and
`𝔐_A^m/u𝔐_A^m` equals the unit part of the decomposition `𝔐_A/u𝔐_A =` (nil) `⊕` (unit) for `φ` (a limit of
lifts `φ^r(x̃_r)`), so it is a direct summand; lifting a basis and Nakayama make `𝔐_A^m` free, hence the
maximal multiplicative submodule. Base change: `𝔐_A/𝔐_A^m` is projective over `𝔖_A`, and modulo `u` both
`𝔐_A/𝔐_A^m ⊗ B` and `𝔐_B/𝔐_B^m` are the nilpotent part, of equal `B`-rank, so the formation commutes with
`A → B`; `𝔐_A^ét = ((𝔐_A^*)^m)^*` is the maximal étale quotient because duality exchanges étale and
multiplicative, which gives the isomorphisms of `(3)`. (Kisin 2009, §1.1.15, Lemma (1.1.15), p. 10:
the dictionary; Kisin 2009, §1.2.11, Proposition (1.2.11) and its proof, pp. 13–14: maximal
multiplicative subobject and étale quotient.)

*Needs:* §R07.4.22; §R07.4.2; §R07.4.36.

**Checks.**

- `dictionary_multiplicative`: `𝔐 = 𝔖/p` with `φ = φ_𝔖: 1 ⊗ φ` is an isomorphism, so `Gr^D(𝓜)` is
  multiplicative of order `p`.
- `dictionary_etale`: `𝔐 = 𝔖/p·e` with `φ(e) = E(u)e`: the image of `1 ⊗ φ` is `E(u)𝔐`, so `Gr^D(𝓜)` is étale
  of order `p`.

### R07.4.38 Breuil modules with coefficients and the functor from Kisin modules

Prove `breuilModulesWithCoefficients`. Let `A` be a `ℤ_p`-algebra with `|A| < ∞`. The functor `𝔐 ↦ S ⊗_{φ,𝔖} 𝔐` of Kisin 2009 (1.1.10) induces an exact, fully faithful functor `(Mod FI/𝔖)_A → (Mod FI/S)_A`; it is an equivalence if moreover `p·A = 0`.

The setting is Kisin 2009's standing hypotheses of §R07.4.36. The target is the
full-faithfulness statement of Lemma 1.2.4 and the killed-by-`p` equivalence of Lemma 1.2.5.

*Proof sketch.* `𝓜 = S ⊗_{φ,𝔖} 𝔐` is an object of `(Mod FI/S)` by (1.1.10), with `A` acting by
functoriality; `𝓜/Fil¹𝓜` embeds via `1 ⊗ φ` into `𝔐/E(u)𝔐` with image that of `φ*𝔐`, which is `A`-projective
by (1.2.2)`(3)` (Kisin 2009, 1.2.4). Exactness and full faithfulness come from (1.1.11), which holds
for `p`-power-torsion objects without coefficients. `pA = 0: 𝓜` comes from `𝔐 ∈ (Mod FI/𝔖)` by (1.1.11);
if `𝓜` is free of rank `d` over `S_A, W ⊗_𝔖 𝔐 ≅ W ⊗_S 𝓜` is free of rank `d` over `k ⊗ A`, so a surjection
`𝔖_A^d → 𝔐` exists, and it is an isomorphism by comparing ranks after `S ⊗_{φ,𝔖}` (1.2.5). (Kisin 2009,
§1.2.4, Lemma (1.2.4), p. 11: Lemma 1.2.4; Kisin 2009, §1.2.5, Lemma (1.2.5), p. 12: Lemma 1.2.5.)

*Needs:* §R07.4.36; §R07.4.18.

**Checks.**

- `breuilCoeff_Fp`: `A = 𝔽_p`: the equivalence of objects killed by `p` of (1.1.11), with trivial
  coefficients.
- `breuilCoeff_Zp2`: for `A=ℤ/p²`, full faithfulness holds. There is also an
  equivalence on these coefficient subcategories: Caruso–Liu, Theorem 2.3.1 and
  Proposition 2.3.2, pp.9–10, give an exact torsion inverse for `r=1<p−1`.
  Applying it to multiplication by `p` gives `ker(p)=p𝔐`, and lifting a mod-`p` basis
  gives freeness over `𝔖/p²`.
- The zero coefficient object maps to zero, with zero filtration quotient and endomorphism group.

### R07.4.39 Étale `φ`-modules and `G_{K∞}`-representations with finite coefficients

Prove `etalePhiModulesWithCoefficients`. Let `A` be a `ℤ_p`-algebra with `|A| < ∞` and `ΦM_{𝒪_ℰ,A}` the
étale `φ`-modules over `𝒪_ℰ` with an `A`-action. `(1) T` induces an equivalence of abelian categories `T_A : ΦM_{𝒪_ℰ,A} → Rep′_A(G_{K∞})` (continuous representations on finite `A`-modules). `(2)` For `A → A′` finite,
`T_A(M) ⊗_A A′ ≅ T_{A′}(M ⊗_A A′)`. `(3) T_A(M)` is free of rank `r` over `A` iff `M` is free of rank `r` over
`𝒪_ℰ ⊗_{ℤ_p} A`. `(4)` For `A` local, `T_{𝔖,A}(𝔐) = T_A(𝒪_ℰ ⊗_𝔖 𝔐)` is a functor `(Mod FI/𝔖)_A → Rep_A(G_{K∞})` (free `A`-modules), compatible with finite base change.

The setting is Kisin 2009's standing hypotheses of §R07.4.36.

*Proof sketch.* `(1)` from Fontaine's equivalence `T` (§R07.4.5) with `A`-actions by functoriality. `(2): T_A(M) ⊗_A N → T_A(M ⊗_A N)` is an isomorphism for `N` free and both sides are right exact in `N`, so for
all finite `N` by a presentation and the five lemma (Kisin 2009, (1.2.8)). `(3)`: reduce to `A` Artinian
local; `M` is `A`-flat iff `T_A(M)` is; for A a field, `𝒪_ℰ ⊗ A` is a product of fields, `M` is projective,
and the Frobenius argument of (1.2.2)`(4)` makes it free; ranks agree by Fontaine `A`.1.2.4(i) (1.2.7).
`(4): 𝒪_ℰ ⊗_𝔖 𝔐` is free over `𝒪_ℰ ⊗` A by (1.2.2)`(4)` and `(3)` (1.2.9). (Kisin 2009, §1.2.7, Lemma
(1.2.7), p. 12: Lemma 1.2.7(4); Kisin 2009, §1.2.9, Lemma (1.2.9), p. 13: Lemma 1.2.9.)

*Needs:* §R07.4.5; §R07.4.36.

**Checks.**

- `etaleCoeff_cyclic`: `A = ℤ/pⁿ`: finite free `ℤ/pⁿ`-representations of `G_{K∞}` correspond to étale
  `φ`-modules free over `𝒪_ℰ/pⁿ`.
- `etaleCoeff_needs_flat`: the rank statement fails without flatness: a representation that is not
  `A`-flat gives an `M` that is not free over `𝒪_ℰ ⊗ A`.

### R07.4.40 Crystalline representations with coefficients and weakly admissible modules

Prove `crystallineWithCoefficients`. Let `A` be a finite local `ℚ_p`-algebra. `(Mod/K₀)_A` is the category
of weakly admissible filtered `φ`-modules with `A`-action, and `(Mod/K₀)_{A-fr}` the full subcategory of
those `𝓜` with `gr^•𝓜_K` a projective `A`-module. Then `(1)` for `𝓜 ∈ (Mod/K₀)_{A-fr}, gr^•𝓜_K` is finite
projective over `A ⊗_{ℚ_p} K` and `𝓜` is free over `A ⊗_{ℚ_p} K₀`; `(2) D_cris` and `V_cris` induce exact
equivalences between `Rep^cris_A` (`G_K`-representations on finite free `A`-modules, crystalline over `ℚ_p`)
and `(Mod/K₀)_{A-fr}`; `(3)` both commute with finite base change `A → A′` within these categories.

The setting is Kisin 2009's standing hypotheses of §R07.4.36. The input is the Colmez–Fontaine
theorem of §R07.4.13 with Fontaine's full faithfulness (§R07.3.3).

*Proof sketch.* `(1): Hom_{A⊗K}(𝓜_K, −) ≅ Hom_{K⊗K}(K, Hom_A(𝓜_K, −))` is exact because `K` is
projective over `K ⊗ K`, and descent gives projectivity over `A ⊗ K₀`; freeness by the Frobenius
argument of (1.2.7) (Kisin 2009, 1.3.2). `(2): 𝓜 ⊗_A N` lies in `(Mod/K₀)_A` (an abelian category),
`V_cris(𝓜) ⊗_A N ≅ V_cris(𝓜 ⊗_A N)`, hence `V_cris(𝓜)` is `A`-free; conversely `D_cris(V) ⊗_A N ≅ D_cris(V ⊗_A N)` and strictness of morphisms makes `gr^•` exact, so `gr^•D_cris(V)_K` is `A`-free (1.3.4). `(3)`: as
in (1.2.7), since `D_cris` and `V_cris` commute with `⊗_A N` (1.3.5). (Kisin 2009, §1.3.4, Proposition
(1.3.4), p. 15: Proposition 1.3.4; Kisin 2009, §1.3.1, p. 14: the category.)

*Needs:* §R07.4.10; §R07.3.3; §R07.4.13.

**Checks.**

- `crystallineCoeff_Qp`: `A = ℚ_p`: Colmez–Fontaine's equivalence for crystalline representations.
- `crystallineCoeff_E`: `A = E` a finite extension of `ℚ_p: E`-linear crystalline representations
  correspond to weakly admissible modules free over `E ⊗_{ℚ_p} K₀` with `E`-projective graded pieces.

### Examples

- The unit Kisin module `(𝔖, φ)` has `E`-height `0` and corresponds to the trivial representation
  and to `ℚ_p/ℤ_p`. A rank-one module `𝔖 e` with `φ(e) = λ E(u) e`, `λ ∈ 𝔖^×`, has `E`-height
  exactly `1`; these modules correspond to the lattices in `χ` times an unramified character, that
  is, to `μ_{p^∞}` and its unramified twists. `φ(e) = p e` has no finite `E`-height.
- For `K = ℚ_p`, `E(u) = u − p`. A Kisin module of rank two and height `≤ 1` that is the direct sum
  of a module of height `0` and a module of height exactly `1` is the module of the product of an
  étale and a multiplicative `p`-divisible group of height one.

### Dependencies

Layers R07.2 and R07.3; AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (Dieudonné crystal, Grothendieck–Messing);
§§R07.P2–R07.P5 and PadicPeriodRings §§3–4; §R07.3.0;
TauCetiRoadmap.LocalFieldsRamification Layer 3; TauCetiRoadmap.ProfiniteCohomology Layer 9; Mathlib
`PowerSeries`, `Polynomial.IsEisensteinAt`, `AdicCompletion`, `WittVector`, `PreTilt`,
`WittVector.fontaineTheta`.

## Layer R07.5: Local residual types

This layer computes residual representations of local Galois groups that the modularity and
Serre-weight roadmaps consume: the action of tame inertia on the `p`-torsion of formal groups and of
elliptic curves with ordinary, supersingular and multiplicative reduction; Serre's peu and très
ramifiée representations and his criterion for being finite at `p`; Savitt's residual types for
potentially Barsotti–Tate representations of tame type; the residual weights detected by
Fontaine–Laffaille theory; the inertial types of crystalline lattices with Hodge–Tate numbers `{0, 1}`; the peu ramifié classes and their integral lifts; and the Serre weights of `GL₂(F)` with their
compact inductions.

### R07.5.1 Inertia on the `p`-torsion of a formal group of height `h (e = 1)`

Prove `formalGroupTorsionInertia`. Let `e = 1`, A the ring of integers of `K, F` a one-parameter formal
group law over `A` of finite height `h, q = p^h`, and `V =` {`x ∈ m_s` : [p](x) `= 0`} the `p`-torsion of `F` (an
`F_p`-vector space of dimension `h` with its `G`-action). Then `V` carries a structure of `F_q`-vector space
of dimension `1` such that `(i)` every `s ∈ G` acts `σ_q`-semilinearly, where `σ_q` is the image of `s` in
`Gal(F_q/F_p)` through `Gal(k_s/k)`; `(ii) P_K` acts trivially and `I_t` acts through the fundamental
character `θ_{q−1}` of level `h`. Consequently the image of `I` in `GL(V)` is `F_q^*`, cyclic of order `q − 1`;
if `k = F_p`, the image of `G` is the normaliser of the Cartan subgroup `F_q^*` in `GL_h(F_p)`; and over `k̄`
the `h` characters of `I_t` on `k̄ ⊗ V` are the `h` fundamental characters of level `h`.

The setting is the tame notation of §R07.1.26. `e = 1` is used: `v(x) = 1/(q − 1)` for `x ∈ V ∖ 0`
requires the coefficients `a_i` of `[p]` to be divisible by `p` exactly for `i < q`.

*Proof sketch.* Height `h` means `a_i ≡ 0 mod m` for `i < q` and `a_q ≢ 0 mod m` in `[p](X) = Σ a_i X^i, a_1 = p` (Serre 1972, §1.9). For `x ∈ V ∖ 0, p + a_2 x + ⋯ + a_q x^{q−1} + ⋯ = 0`, and comparing valuations
gives `v(x) = 1/(q − 1)`; set `α = 1/(q − 1)`. Since `F(x, y) ≡ x + y mod m_α^+`, reduction `V → m_α/m_α^+`
is an injective `G`-homomorphism, so `P_K` acts trivially and `I_t` acts by `θ_{q−1}` (Serre 1972,
Propositions `6`–`7`). `θ_{q−1}` is surjective onto `F_q^*`, so `V` is stable under `F_q^*` inside the `k̄`-line
`m_α/m_α^+`; as `|V| = q` it is an `F_q`-line, and `s ∈ G` acts `σ_q`-semilinearly (Proposition 6).
Corollaries `1`–`3`: the image of `I` is `F_q^*`; for `k = F_p` every semilinear automorphism of the `F_q`-line
is realised; over `k̄` the `h` conjugates of `θ_{q−1}` appear. (Serre 1972, §1.9, Proposition 9, p. 269:
the proposition; Serre 1972, §1.9, Corollaire `3`, p. 270: Corollary 3.)

*Needs:* §R07.1.26; §R07.1.12.

**Checks.**

- `formalGroupTorsion_height_one`: `h = 1` (the multiplicative formal group `X + Y + XY`): `V = μ_p` and
  `I_t` acts by `θ_{p−1}`, recovering §R07.1.26 for `e = 1`.
- `formalGroupTorsion_height_two`: `h = 2`: the image of `I` is the non-split Cartan subgroup `F_{p²}^*`,
  of order `p² − 1`.
- At height `1`, full inertia acts through `θ_{p−1}`, while wild inertia `P_K`
  acts trivially; when `p > 2` these are distinct actions.

### R07.5.2 Inertia on `E[p]` for good ordinary reduction

Prove `ordinaryTorsionInertia`. Let `E` have good reduction of height `1` (`Ẽ` ordinary). There is an
exact sequence `0 → X_p → E_p → Ẽ_p → 0` of `G`-modules, `X_p` the kernel of reduction (cyclic of order
`p`); in a basis `(e₁, e₂)` with `X_p = F_p e₁` the image of `G` lies in the Borel subgroup `(* *; 0 *)`,
and `I_t` acts on `X_p` by `θ_{p−1}^e` and on `Ẽ_p` trivially. If `e = 1: (a)` the characters of `I_t` on the
semisimplification of `E_p` are `1` and `θ_{p−1}`; `(b)` if `P_K` acts trivially, the image of `I` is cyclic of
order `p − 1`, of the form `(* 0; 0 1)` in a suitable basis with `e₁ ∈ X_p`; `(c)` otherwise the image of `I`
has order `p(p − 1)` and the form `(* *; 0 1)`.

The setting is the tame notation of §R07.1.26. `E` is an elliptic curve over `K` with good reduction
over `A` (a Weierstrass model with coefficients in `A` and discriminant a unit), `Ẽ` its reduction over `k`
and `E_p = E(K_s)[p]`.

*Proof sketch.* `Ẽ(k̄)` has a point of order `p` (Hasse invariant nonzero), so reduction `E_p → Ẽ_p` is
onto a group of order `p` with kernel `X_p` of order `p`. `G` acts on `Ẽ_p` through `Gal(k_s/k)`, so `χ_Y = 1` on
`I`; `det E_p = χ̄` (Weil pairing) restricts to `θ_{p−1}^e` on `I_t` (Proposition 8), so `χ_X = θ_{p−1}^e`
(Serre 1972, Proposition 11). `e = 1: χ_X = θ_{p−1}` is surjective onto `F_p^*`, so the image of `I` is a
subgroup of `(* *; 0 1)` of order `p − 1` or `p(p − 1)`; the first case is `(b)`, the second `(c)`. (Serre
1972, §1.11, Proposition 11, p. 273: Proposition 11; Serre 1972, §1.11, Corollaire, p. 274: the
corollary, case `c`).)

*Needs:* §R07.1.26; ArithmeticGaloisRepresentations Layer 6 (Tate modules of elliptic curves and
abelian varieties).

**Checks.**

- `ordinaryTorsion_det`: the determinant of `E_p` on `I` is `θ_{p−1}^e`, consistent with `det = χ̄` from the
  Weil pairing.
- `ordinaryTorsion_canonical_lift`: for the canonical lift of an ordinary curve over `F̄_p` the
  sequence splits and case `(b)` holds; Serre gives no simple general criterion between `(b)` and `(c)`
  (Serre 1972, p. 274, Remarque).
- For good ordinary reduction and `p > 2`, wild inertia acts trivially on
  the semisimplification, but full inertia has characters `1` and `θ_{p−1}`.

### R07.5.3 Inertia on `E[p]` for good supersingular reduction

Prove `supersingularTorsionInertia`. Let `e = 1` and `E` have good reduction of height `2` (`Ẽ`
supersingular). Then `(a) P_K` acts trivially on `E_p`; `(b) E_p` has a structure of `F_{p²}`-vector space
of dimension `1` on which `I_t` acts through the fundamental character `θ_{p²−1}` of level `2`; `(c)` the
image of `I` in `GL(E_p)` is the non-split Cartan subgroup `C`, cyclic of order `p² − 1`; `(d)` the image of `G`
is `C` or its normaliser `N` according as `k` contains `F_{p²}` or not. Over `k̄` the characters of `I_t` on `k̄ ⊗ E_p` are the two fundamental characters of level `2`; in particular `E_p` is irreducible already as an
`I`-module.

The setting is the tame notation of §R07.1.26. `E` is an elliptic curve over `K` with good reduction
over `A` (a Weierstrass model with coefficients in `A` and discriminant a unit), `Ẽ` its reduction over `k`
and `E_p = E(K_s)[p]`.

*Proof sketch.* Every point of `E_p` reduces to the neutral element of `Ẽ` (no point of order `p`), so `t = x/y` identifies `E_p` with the kernel of `[p]` on the formal group `F` of the Néron model, of height `2`
since `|E_p| = p²` (Serre 1972, §1.11 `(2)`). Apply §R07.5.1 with `h = 2: (a)`–`(c)`, and the image of `G` is
`C` when `G` acts `F_{p²}`-linearly `(k ⊇ F_{p²})` and `N` otherwise (Serre 1972, Proposition 12).
Irreducibility: an `I`-stable line would carry a character of level `1`, but `θ_{p²−1}` has level `2`.
(Serre 1972, §1.11, Proposition 12, p. 275: Proposition 12; Serre 1972, §1.11, Corollaire, p. 275:
the corollary.)

*Needs:* §R07.5.1; ArithmeticGaloisRepresentations Layer 6 (Tate modules of elliptic curves and
abelian varieties).

**Checks.**

- `supersingularTorsion_tame`: the image of `I` has order `p² − 1`, prime to `p`, so `ρ̄|_I` is tame.
- `supersingularTorsion_irreducible`: `E_p` is irreducible as an `I`-module: a stable line would
  carry a character of level one, while `θ_{p²−1}` has level two.
- `supersingularTorsion_ramified`: the hypothesis `e = 1` is used; for `e > 1` the characters are
  other powers of fundamental characters, read off from the Newton polygon of `[p]` (Serre 1972,
  §1.10 and the Remarque on p. 275), and this target does not cover them.

### R07.5.4 Inertia on `E[p]` for multiplicative reduction

Prove `multiplicativeTorsionInertia`. Let `E` have multiplicative reduction, `v(j) = −m < 0`, and `q ∈ m`
the Tate parameter with `j = 1/q + 744 + ⋯`. Over an unramified extension `K′/K` with `[K′ : K] ≤ 2, E ≅ E(q) = 𝔾_m/q^ℤ` and there is an exact sequence `0 → μ_p → E_p → ℤ/p → 0`. The image of `I` in `GL(E_p)`
lies in `(* *; 0 1)`, and the characters of `I_t` are `1` and `θ_{p−1}^e`. If `e = 1: (a)` the characters of
`I_t` on the semisimplification are `1` and `θ_{p−1}`; `(b)` if `P_K` acts trivially the image of `I` is cyclic
of order `p − 1, (* 0; 0 1)`; `(c)` otherwise it has the form `(* *; 0 1)`. Case `(b)` holds if and only
if `q` has a `p`-th root in `K_nr`, which forces `v(j) = −v(q) ≡ 0 mod p`; so `v(j) ≢ 0 mod p` forces case
`(c)`.

The setting is the tame notation of §R07.1.26. The Tate curve over `K′` is
TauCetiRoadmap.EllipticCurves Layer 4 (its Galois-equivariant uniformisation `L^×/q^ℤ ≅ E_q(L)`); the
Kummer sequence `0 → μ_p → E_q[p] → ℤ/p → 0` is read off from it.

*Proof sketch.* The Néron model has type `(b_m)`; by Ogg, the smallest extension `K′` making `E ≅ E(q)` is
unramified of degree `≤ 2` (Serre 1972, §1.12, with footnote `3: K′ = K(√−c₆)`). `E(q)[p]` is an extension
of `ℤ/p` by `μ_p`; its class is the Kummer class of `q`, so `I` acts through `(θ^e_{p−1} *; 0 1)` on the
associated characters (Proposition 13). `e = 1`: as for good ordinary reduction, the image of `I` has
order `p − 1` or `p(p − 1)`. Case `(b): P_K` acts trivially iff `q^{1/p} ∈ K_t`; since `q ∈ K_nr` and `[K_t : K_nr]` is prime to `p`, this holds iff `q^{1/p} ∈ K_nr`, and then `p | v(q) = −v(j)`. (Serre 1972, §1.12,
Proposition 13, pp. 276–277: Proposition 13; Serre 1972, §1.12, p. 277: the criterion for case `(b)`.)

*Needs:* §R07.1.26; TauCetiRoadmap.EllipticCurves Layer 4 (the Tate curve).

**Checks.**

- `multiplicativeTorsion_tres`: the Tate curve over `ℚ_p` with `v(q) = 1` and `p` odd: `v(j) = −1 ≢ 0 mod p`, so case `(c)` holds and `E_p` is très ramifiée in the sense of §R07.5.5.
- `multiplicativeTorsion_peu`: if `p | v(q)`, then `q = p^{v(q)}u` with `u ∈ ℤ_p^*` has the Kummer class
  of the unit `u`, so `E_p` has trivial wild inertia or is peu ramifiée (the level-lowering case).
- For the Tate curve over `ℚ_p` with `v(q) = 1`, wild inertia acts nontrivially
  on the extension while the full-inertia semisimplification is `1 ⊕ θ_{p−1}`.

**Tate parameters for multiplicative curves.** Prove `multiplicativeTateParameter`.
For a finite extension `K/ℚ_p` and an elliptic curve with multiplicative reduction,
there is a unique `q∈K×` with `v(q)>0` and `j(E_q)=j(E)`, and
`v(q)=−v(j(E))`. There is an unramified quadratic character `η`, possibly
trivial, identifying `E` with the corresponding twist of `E_q`, and identifying
their torsion Galois modules by that twist. Construct `q` by inversion of the
integral series `j(q)⁻¹=q+⋯`, and use multiplicative reduction to identify the
splitting character. This target uses EllipticCurves Layer 4's integral Tate
series and uniformisation and Layer 5's Galois-equivariant quadratic-twist
comparison; ArithmeticGaloisRepresentations §6.1 supplies the residual
elliptic-representation adapter. Sources: Serre 1972, §1.12, Proposition 13
and footnote 3, pp.276–277; Silverman, *Advanced Topics*, V.5.3.

**Checks.**

- For `E_q`, the parameter recovered from `j(E_q)` is `q` and `η=1`.
- For nonsplit multiplicative reduction the splitting character is the
  nontrivial unramified quadratic character; its restriction to inertia is trivial.
- `v(j)≥0` is outside this target: the inverse series must be evaluated at
  an element of positive valuation. No Tate parameter is asserted for good reduction.

**The multiplicative finite-flat criterion.** Prove
`torsion_hasFiniteFlatModel_iff_dvd_valuation`. For any prime `p`, a finite
unramified extension `K/ℚ_p`, and an elliptic curve `E/K` with multiplicative
reduction and Tate parameter `q`,
`HasFiniteFlatModel O_K K̄ E[p] ↔ p ∣ v(q)`, equivalently `p ∣ −v(j(E))`.
The criterion concerns the actual torsion Galois module, including its extension
class. If the valuation is divisible by `p`, removing a `p`-th power from `q`
leaves a unit-Kummer class; §R07.5.6 constructs its model and §R07.6.8 removes
the unramified twist. Conversely, for odd `p`, uniqueness of models and
§R07.5.6 force the Kummer class to be a unit. For `p=2`, apply the
order-two subgroup/quotient argument of §R07.5.8 after strict henselisation
and use unramified descent. No coefficient-field descent at `p=2` is used.
Sources: Serre 1972, §1.12, pp.276–277; Serre 1987, §2.8, proof of
Proposition 4, pp.189–190, and §2.6, p.188; §§R07.5.6 and R07.5.8.

**Checks.**

- For `q=π^p u` with `u` a unit and `v(π)=1`, the unit-Kummer model gives
  finite flatness even when the extension is nonsplit.
- For `q=π`, the valuation is `1`, so `E_q[p]` has no model. Its
  semisimplification `μ_p⊕ℤ/p` does have a model.
- Twisting either example by the unramified quadratic character preserves
  the answer and `j`; split multiplicative reduction is not required.
- At `p=2` over `ℚ₂`, `q=−4` gives the unit square class `−1` and a
  finite-flat nonsplit module, while `q=2` gives the nonfinite class of `2`.

### R07.5.5 Peu ramifiée and très ramifiée representations

Define `IsPeuRamifiee` and `IsTresRamifiee`. Let `ρ : G_p = Gal(ℚ̄_p/ℚ_p) → GL(V) = GL₂(F̄_p)` with
`P_K` acting nontrivially. Then `D = V^{P_K}` is a `G_p`-stable line, `G_p` acts on `D` by `θ₂ = χ̄^β ε₂` and on
`V/D` by `θ₁ = χ̄^α ε₁` with `ε₁, ε₂` unramified, `0 ≤ α ≤ p − 2` and `1 ≤ β ≤ p − 1`. In the case `β = α + 1`,
let `K` be the field cut out by `ρ(I)` over `K₀ = ℚ_p^nr` and `K_t = K₀(ζ_p)` its maximal tame subextension;
Kummer theory gives `K = K_t(x₁^{1/p}, …, x_m^{1/p})` with `x_i ∈ K₀^*/K₀^{*p}, p^m = [K : K_t]`. `ρ` is
peu ramifiée if `v_p(x_i) ≡ 0 mod p` for all `i`, i.e. the `x_i` can be chosen among the units of `K₀`, and
très ramifiée otherwise. For `p = 2 (χ̄ = 1, α = 0, β = 1)` this applies to `ρ = (1 u; 0 1)` with `u : G₂ → ℤ/2` ramified.

Serre works over `ℚ_p`; only `ρ|_{G_p}` matters, and the definition depends only on `ρ|_I` and on
`K₀ = ℚ_p^nr`. In extension-type formulas, “`∗` peu ramifiée” denotes the total
unit-Kummer condition, including wild-trivial extension classes. It agrees with
`IsPeuRamifiee` on the nontrivial-wild domain; §R07.5.13 gives the total `H¹` comparison.

*Construction.* `V^{P_K} ≠ 0` since `P_K` is pro-`p`; it is a line because `P_K` acts nontrivially; it is
`G_p`-stable because `P_K` is normal (Serre 1987, §2.4). `β = α + 1` gives `Gal(K_t/K₀) = (ℤ/p)^*, K_t = K₀(ζ_p)`, and `Gal(K/K_t) = ρ(P_K)` elementary abelian with the cyclotomic action of `Gal(K_t/K₀)`;
Kummer theory with the cyclotomic action puts the Kummer generators in `K₀^*/K₀^{*p}` (2.4.6). The
condition (2.4.7) is independent of the choice of the `x_i`: the subgroup they generate in
`K₀^*/K₀^{*p}` is determined by `K`, and `v_p` induces `K₀^*/K₀^{*p} → ℤ/p`. (Serre 1987, §2.4,
(2.4.6)–(2.4.7), p. 186: the definition; Serre 1987, §2.4, p. 186: units, and très ramifiée.)

The API:

- `IsPeuRamifiee`: The Kummer generators of `K/K_t` can be chosen among units of `K₀`.
- `IsTresRamifiee`: The negation, in the case `β = α + 1`.
- `kummerSubgroup`: The subgroup of `K₀^*/K₀^{*p}` generated by the `x_i`.
- `isPeuRamifiee_iff_valuation`: Peu ramifiée iff `v_p` vanishes `mod p` on the Kummer subgroup.
- `isPeuRamifiee_of_unit`: Under nontrivial wild inertia, a Kummer class of a unit
  gives a peu ramifiée representation.

*Needs:* §R07.1.26.

**Checks.**

- `isPeuRamifiee_sqrt_neg_one`: `p = 2, K = ℚ₂(√−1)`: the class of `−1` is a unit class, so `(1 u; 0 1)`
  is peu ramifiée.
- `isTresRamifiee_sqrt_two`: `p = 2, K = ℚ₂(√2): v₂(2) = 1` is odd, so `(1 u; 0 1)` is très ramifiée.
- `not_extension_sensitive`: `β ≠ α + 1`, e.g. `ρ|_I = (χ̄² *; 0 1)` nonsplit with `p ≥ 5`: the peu/très
  distinction is not defined.
- `tate_curve_tres`: The `p`-torsion of the Tate curve `E(q)` over `ℚ_p` with `v(q) = 1` is très ramifiée.
- `tresRamifiee_characters`: très ramifiée is possible only if `ε₁ = ε₂`, and then `m = 1` or `2` (Serre
  1987, §2.4, Remarque 1).

### R07.5.6 Finite flat extensions of `ℤ/p` and `μ_p` over `ℤ_p^nr`

Prove `finiteFlatKummerExtensions`. Let `R` be the strict henselisation of `ℤ_p`, or a finite étale
extension of `ℤ_p` over which the relevant groups are constant, and `K = Frac R`. `(a)` Every extension `0 → ℤ/p → J → μ_p → 0` of finite flat `R`-group schemes splits. `(b)` Extensions `0 → μ_p → J → ℤ/p → 0` with `J`
killed by `p`, in
the category of fppf `F_p`-modules represented by finite flat `R`-group schemes, correspond to `H¹_fppf(R, μ_p) = R^*/R^{*p}`, and restriction to `K` sends
the class to the Kummer class of the extension of Galois modules in `K^*/K^{*p}`. Consequently a
Galois extension of `F_p`-modules `ℤ/p` by `μ_p` over `K` prolongs to a finite flat `R`-group scheme
killed by `p` if and only if its
Kummer class is represented by a unit, i.e. if and only if wild inertia acts trivially or
it is peu ramifiée.

The notation is that of §R07.1.26, with `K = Frac R`. For `p` odd, `R` has `e = 1 < p − 1`, so
prolongations are unique (§R07.1.30); for `p = 2` the argument uses only the connected–étale sequence
and Kummer theory.

*Proof sketch.* `(a) J` is finite flat over a henselian base; its connected component `J⁰` maps
isomorphically onto `μ_p` (the étale sub `ℤ/p` meets it trivially), giving a section (Serre 1987, §2.8,
proof of Proposition 4). `(b)` Over `R, J → ℤ/p` has fibre over `1` a `μ_p`-torsor. In the killed-by-`p`
category this determines `J`: adjoining a local
lift of `1` identifies `J` with `μ_p × F_p`, and changing the lift gives exactly the torsor cocycle;
`μ_p`-torsors are `H¹_fppf(R, μ_p) = R^*/R^{*p}` by the Kummer sequence and Pic `R = 0`. On generic
fibres the fppf Kummer class maps to the Galois Kummer class in `K^*/K^{*p}`; a class lies in the
image of `R^*/R^{*p}` iff it is represented by a unit, which is peu ramifiée (§R07.5.5) when the
extension has nontrivial wild inertia. Uniqueness of the prolongation for `p` odd: §R07.1.30 `(e = 1 < p − 1)`. (Serre
1987, §2.8, proof of Proposition 4, p. 190: the Kummer class of a finite flat extension is a unit
class; Serre 1987, §2.8, proof of Proposition 4, p. 190: part `(a)`.)

*Needs:* §R07.5.5; §R07.1.34; §R07.1.30; §R07.1.24.

**Checks.**

- `finiteFlatKummer_unit`: the extension of `ℤ/p` by `μ_p` attached to `u = 1 + p ∈ ℤ_p^*` is finite flat
  over `ℤ_p`; the one attached to `p` is not.
- `finiteFlatKummer_local`: `(a)` uses that `R` is henselian local: there the connected component `J⁰` is
  an open and closed subgroup. Over a non-local base such as `ℤ` there is no connected–étale
  decomposition to split along (`ℤ/p` and `μ_p` are both étale over `ℤ[1/p]`), and `Ext¹` must instead be
  computed by gluing (§R07.1.39).
- Over `ℤ₂` the law `(a,i)(b,j) = (ab(−1)^{ij}, i+j)` on `μ₂ × ℤ/2` gives a
  nonsplit extension with a trivial torsor above `1: (1,1)² = (−1,0)`. It is not
  killed by `2` and lies outside the fppf `F₂`-module classification.

### R07.5.6a Finite coefficients and the finite-flat Kummer comparison

For a continuous representation on a finite-dimensional `𝔽̄_p`-space, import
ArithmeticGaloisRepresentations §1.4's `residual_descent_finite_field` to choose a finite
field `k/𝔽_p` and a model `V_k`. Define `IsFiniteFlatResidual` by existence of a finite
flat model `HasFiniteFlatModel ℤ_p ℚ̄_p V_k` from §R07.1.24a, with `k`-action
and a coefficient-linear points identification.
Here `p>2`. Prove independence of the chosen model and invariance in both directions
under finite coefficient extension. Raynaud full faithfulness (`e=1<p−1`) extends every
scalar endomorphism and its algebra relations uniquely to the model. Coefficient enlargement
is tensoring in the finite-flat `𝔽_p`-linear category. For descent from `k'` to `k`,
restriction of scalars gives a model of a direct sum of copies of `V_k`; a `k`-linear projection
onto one copy extends uniquely and its idempotent splits. Models that become isomorphic
after coefficient extension therefore give the same predicate.

Prove `finiteFlatKummerCoefficients`. For the strict henselisation `R` of `ℤ_p`, or a finite
étale extension sufficient to trivialize the unramified characters in question, put
`k_R=k⊗_{𝔽_p}(ℤ/p)_R` and `k_R(1)=k⊗_{𝔽_p}μ_p`. These are rank-one `k`-objects of
order `#k`. In the exact category of finite flat fppf `k`-modules over `R`,
`Ext¹(k_R,k_R(1)) ≅ (R×/R×p)⊗_{𝔽_p}k` as `k`-spaces, and extensions in the opposite
order split. The generic-fibre map is the tensor extension of the Kummer inclusion
`R×/R×p → K×/K×p`, `K=Frac R`; it commutes with coefficient extension and unramified descent.
In particular the image consists precisely of the coefficientwise unit classes.
This Ext category is killed by `p`; extensions in the category of all abelian sheaves need
not satisfy this formula.

*Proof sketch.* Choose an `𝔽_p`-basis of `k`, apply §R07.5.6 to the components of an
extension, and impose `k`-linearity. The scalar compatibility identifies these component
classes with `H¹_fppf(R,μ_p)⊗_{𝔽_p}k`, independently of the basis. The same calculation
on generic fibres gives the claimed map and unit criterion; connected–étale splitting gives
the opposite-order vanishing. Faithful coefficient extension detects the valuation-zero
condition. (Serre 1987, §2.8, pp.189–190, the finite-field-vector-scheme formulation and
order-`p` Kummer proof; Raynaud 1974, Proposition 3.3.2; §R07.5.6's Kummer torsor construction.)

AlgebraicModularFormsAndSerreWeights, *Finite flatness and peu ramifiée extensions*, consumes
`IsFiniteFlatResidual` and `finiteFlatKummerCoefficients` for odd `p`, including coefficient
extension and unramified descent. That consumer owns the all-prime shape-specific
peu-ramifiée equivalence, including the dyadic maximal-model argument, agreement with this
API at odd primes, and the local-weight application.

*Needs:* ArithmeticGaloisRepresentations §1.4; §R07.1.24a; §R07.1.30; §R07.5.6;
TauCetiRoadmap.ModularCurves Layer 0E (effective descent).

**Checks.**

- For `k=𝔽_p` the comparison is exactly §R07.5.6; for `k=𝔽_{p²}` each end object
  has order `p²`, rather than order `p`.
- A unit class tensored with any `c∈k` prolongs; the class of the uniformizer tensored
  with `c≠0` does not. Enlarging `k` does not kill its nonzero valuation component.
- Twist a nonzero unit-Kummer extension of `1` by `χ̄` by an unramified scalar character
  `λ_a`, with `a∈𝔽_{p²}∖𝔽_p`. It remains finite flat, has inertial determinant `χ̄`
  and nontrivial wild inertia. At a Frobenius lift `Φ` with `χ̄(Φ)=1` its trace is
  `2a∉𝔽_p`, so it need not admit a two-dimensional `𝔽_p`-model.
- The split extension corresponds to zero and is preserved under every coefficient enlargement.

### R07.5.7 Serre's finite-flat criterion: finite with `det = χ̄` on inertia

Prove `finiteFlatWeightTwoCriterion`. Let `p` be odd and `ρ_p : G_p → GL₂(F̄_p)` continuous with `det ρ_p|_I = χ̄`. Then `ρ_p` is finite at `p` in the finite-coefficient sense of §R07.5.6a if and only if either `(i) I_t` acts through the two fundamental characters `ψ, ψ^p` of level `2`, or `(ii) ρ_p|_I ≅ (χ̄ *; 0 1)` with the extension trivial on `P_K` or peu ramifiée.
Equivalently, by Serre's Proposition 3, finite with `det|_I = χ̄` is Serre's weight `k(ρ_p) = 2` (Serre
1987, Proposition 4); the weight recipe itself belongs to AlgebraicModularFormsAndSerreWeights
R15.`4`.

`p` odd; `ℚ_p` has `e = 1 < p − 1`, so Raynaud's results apply. The `p = 2` analogue in the reducible case
is §R07.5.8; Serre says the case `p = 2` is similar and gives no details.

*Proof sketch.* Only if: by Raynaud (§R07.1.32 (iii), Raynaud Corollary 3.4.4) the tame characters
are `ψ^{a+pb}` with `a, b ∈ {0, 1}`; with `ψψ′ = χ̄` this leaves `(i)` or `{1, χ̄}` (Serre 1987, §2.8). In the
level-`1` case with `P_K` nontrivial, `ρ_p` and the prolongation `J` are reducible: `0 → A → J → B → 0` with
`A, B` rank-one `k`-objects of order `#k` for a finite field of definition `k`,
one étale and one multiplicative. Raynaud full faithfulness extends the `k`-action. Over a
finite étale `R` killing their unramified characters, either
`0 → k_R → J → k_R(1) → 0`, which splits, or
`0 → k_R(1) → J → k_R → 0`, whose `k`-linear Kummer class is coefficientwise a unit
by §R07.5.6a. This is the peu ramifiée condition when wild inertia is nontrivial. If:
case `(i)` prolongs by Raynaud's Théorème 3.4.3 (§R07.1.32 `(ii)`) with exponents `(1, 0)`; case `(ii)`
prolongs over a finite étale `R` by §R07.5.6a's `k`-linear Kummer construction from unit classes and descends to `ℤ_p`
(effective descent, TauCetiRoadmap.ModularCurves Layer 0E), as in Serre 1987 §2.8, `(b)`. (Serre 1987,
§2.8, Proposition 4, p. 189: Proposition 4 (`k = 2` iff `det|_I = χ` and finite at `p`); Serre 1987, §2.8,
proof of Proposition 4, p. 190: the 'if' direction and its two cases.)

*Needs:* §R07.1.26; §R07.5.6a; §R07.1.32; §R07.1.30; TauCetiRoadmap.ModularCurves Layer 0E.

**Checks.**

- The unramified `𝔽_{p²}` scalar twist of the unit-Kummer extension in §R07.5.6a
  satisfies case `(ii)`, with no two-dimensional `𝔽_p`-model. The criterion applies to it
  using end objects of order `p²`.
- `finiteFlatCriterion_elliptic`: `E[p]` for `E/ℚ_p` with good reduction and `p` odd: finite
  (abelian-scheme torsion), `det = χ̄`, and ordinary (type `ii`) or supersingular (type `i`).
- `finiteFlatCriterion_tres`: `(χ̄ *; 0 1)` très ramifiée, e.g. the Tate curve with `v(q) = 1`, is not
  finite; Serre's weight is then `p + 1`.
- `finiteFlatCriterion_level_two_exponent`: a representation on which `I_t` acts through `ψ² ⊕ ψ^{2p}` (`ψ` of level two) is not finite at `p`: for `e = 1` Raynaud's exponents lie in `{0, 1}`
  (§R07.1.32), and `ψ²` is not of the form `ψ^{a + pb}` with `a, b ∈ {0, 1}`; a criterion that
  allowed every level-two character would accept it.

### R07.5.8 The dyadic dichotomy for unipotent representations

Prove `dyadicFiniteFlatDichotomy`. Let `p = 2, u : G₂ → ℤ/2` surjective with fixed field `K = ℚ₂(√d)`,
and `ρ = (1 u; 0 1) : G₂ → GL₂(F₂)`. Then `ρ` is finite at `2` if and only if `d` can be chosen a `2`-adic
unit, i.e. `K = ℚ₂(√5)` (unramified), `ℚ₂(√−1)` or `ℚ₂(√−5)` (discriminant `(4)`); for `K = ℚ₂(√±2), ℚ₂(√±10)`
(discriminant `(8)`) `ρ` is très ramifiée and not finite. This is the finite-flat input behind Serre's `p = 2` weights: `k = 2` in the first cases and `k = 4` in the last.

For `p = 2, μ₂ = ℤ/2` as Galois modules, so `ρ` is simultaneously an extension of `ℤ/2` by `μ₂` and by `ℤ/2`.

*Proof sketch.* A finite flat model `J` of `ρ` has a closed subgroup of order `2` (the closure of the
fixed line) and quotient of order `2`; over `ℤ₂^nr` each is `ℤ/2` or `μ₂` (§R07.1.34 at `p = 2`). `(ℤ/2, ℤ/2): J` étale, so `ρ` is unramified: `d = 5`. `(μ₂, μ₂): J` multiplicative, so over `ℤ₂^nr` it is `μ₂²`, whose
generic points carry the trivial action: `ρ` unramified again. (`ℤ/2` sub, `μ₂` quotient): splits
(§R07.5.6 `(a)`), impossible for `u ≠ 0`. (`μ₂` sub, `ℤ/2` quotient): the class is a unit class of `ℤ₂^* / ℤ₂^{*2}` (§R07.5.6 `(b)`), so `d` is a unit up to squares: `d ∈ {5, −1, −5} mod` squares. Conversely each
unit class gives a finite flat model. The discriminant of `ℚ₂(√d)` is `(4)` for `d ≡ 3 mod 4, (1)` for `d ≡ 1 mod 4` and `(8)` for `2 | d`, so the finite cases are exactly those of discriminant dividing `4`. (Serre
1987, §2.6, p. 188: the `p = 2` dichotomy; Serre 1987, §2.6, Exemple, p. 188: the example.)

*Needs:* §R07.5.6; §R07.5.5; §R07.1.34.

**Checks.**

- `dyadicDichotomy_examples`: `ℚ₂(√−1)`: finite (peu ramifiée), weight `2`; `ℚ₂(√2)`: not finite (très
  ramifiée), weight `4` (Serre 1987, §2.6).
- `dyadicDichotomy_global`: Serre 1987, §4.5, Remarque `(2)`: the `2`-torsion of `y² + xy + y = x³ − x² − x − 14` (conductor `17`, discriminant `−17⁴`) is a nonsplit extension of `ℤ/2` by `μ₂` that is finite flat
  over `ℤ`, with `u` cutting out `ℚ(i)`; at `2` this is `ℚ₂(√−1)`, of discriminant `(4)`, peu ramifiée as the
  dichotomy requires.

### R07.5.9 Savitt's reductions for tame principal-series types: ordinary or level two

Prove `savittReductionPrincipalSeries`. Let `ρ : G_{ℚ_p} → GL₂(E)` be indecomposable, potentially
semistable with Hodge–Tate weights `(0, 1)` and tame principal-series type `τ(ρ) = ω̃^i ⊕ ω̃^j` with `i ≢ j (mod p − 1)`. After twisting by `ω̃^{−i}` one may take `i = 0`. Then `ρ` is crystalline over `F₁ = ℚ_p((−p)^{1/(p−1)})` and its filtered module is `D_{x₁,x₂}: φ(e₁) = x₁e₁, φ(e₂) = x₂e₂, N = 0, Fil¹`
spanned by `π^{j}e₁ + e₂`, with `x₁, x₂ ∈ O_E` and `v_p(x₁x₂) = 1`. Excluding the two cases of Savitt's
Lemma 6.8 (`v_p(x₁) = 0, j = 1, x₁² ≡ w`, or `v_p(x₂) = 0, j = p − 2, x₂² ≡ w`, where the reduction has
nontrivial centraliser), there is a `G`-stable lattice whose reduction `ρ̄` is: `(1)` if `v_p(x₁) = 0`, the
non-split extension with sub `λ_{x̄₁^{−1}}ω` and quotient `λ_{x̄₁w̄^{−1}}ω^j`; `(2)` if `v_p(x₂) = 0`, the
non-split extension with sub `λ_{x̄₂^{−1}}ω^{1+j}` and quotient `λ_{x̄₂w̄^{−1}}`; `(3)` if `0 < v_p(x₁), v_p(x₂) < 1`, then `ρ̄|_{I} ≅ ω₂^{1+j} ⊕ ω₂^{p(1+j)}`, independent of `x₁, x₂`,
and `ρ̄` is irreducible as a `G_{ℚ_p}`-representation. Here `I = I_{ℚ_p}` is full inertia;
the displayed sum of characters is itself reducible over `F̄_p`. In
cases `(1)` and `(2) ρ` itself is reducible (an extension of two characters), so a residually reducible
`ρ` of this kind is ordinary up to twist; in case `(3) ρ̄` is irreducible. Here `λ_a` is the unramified
character sending arithmetic Frobenius to `a` and `w ∈ O_E^×` is determined by `D` (Savitt's notation).

`p` is odd; `E/ℚ_p` is a finite coefficient field with ring of integers `O_E` and residue field `k_E`; `ω̃`
and `ω̃₂` are the Teichmüller lifts of the fundamental characters `ω` (level `1`) and `ω₂` (level `2`) of `I`,
written additively in exponents; a Galois type is `τ(ρ) = WD(ρ)|_{I}` (§R07.4.27); Hodge–Tate
weights `{0, 1}` in Savitt's normalisation, in which the potentially Barsotti–Tate representations are
those of §R07.4.30. The strongly divisible modules `M_{x₁,x₂}` with tame descent data inside `S_{F,O_E} ⊗ D_{x₁,x₂}` (`F = F₁` in cases `(1)`–`(2), F = F₂ = ℚ_{p²}((−p)^{1/(p²−1)})` in case `(3)`) are those of
Savitt's Proposition 6.9; their reductions are computed through the Breuil modules of §R07.4.34.

*Proof sketch.* Classify the filtered modules with descent data of type `ω̃^0 ⊕ ω̃^j` and Hodge–Tate
weights `(0, 1)`: weak admissibility forces `x₁, x₂ ∈ O_E` with `v_p(x₁x₂) = 1` (Savitt, Proposition 2.17,
p. 9). Write down the strongly divisible `O_E`-modules with descent data `M_{x₁,x₂}` (Proposition 6.9,
pp. 31–33) and check the strong-divisibility axioms (§R07.4.33, §R07.4.32). Reduce modulo `m_E` to
Breuil modules with descent data and identify sub and quotient with the rank-one Breuil modules
`M_E(F/ℚ_p, e, a, j)` of §R07.4.35 (Propositions 5.3–5.4); non-splitting in `(1)`–`(2)` uses that there is
no nonzero map `M′ → M₁` (Lemma 4.14), which needs `w ≠ x₁²` when `j = 1` (Theorem 6.11, proof, p. 34).
Case `(3)`: restrict the descent data to `Gal(F₂/ℚ_{p²})` and map to the rank-one module `M_E(F₂/ℚ_{p²}, e₂, √−w, n)` for `n = p(j − p)` or `j − p` (Theorem 6.11(3), proof, p. 35). In cases `(1)` and `(2)` the
filtered module has a `φ`-stable weakly admissible line, so `ρ` is reducible (Savitt, Example 2.13 and
the proof of Corollary 6.15, p. 38). (Savitt 2005, §2.2, Proposition 2.17, pp. 8–9 (arXiv `v3`): the
filtered modules `D_{x₁,x₂}` of tame principal-series type and weights `(0, 1)`; Savitt 2005, §6.2,
Lemma 6.8 and Proposition 6.9, pp. 30–31 (arXiv `v3`): the excluded cases and the strongly divisible
modules `M_{x₁,x₂}`; Savitt 2005, §6.3, Theorem 6.11, pp. 34–35 (arXiv `v3`): the three reductions
`(1)`–`(3)`; Savitt 2005, §6.4, Proposition 6.18, p. 39 (arXiv `v3`): the application to weight-two
newforms of level `Γ₁(pN)`.)

*Needs:* §R07.4.27; §R07.4.28; §R07.4.32; §R07.4.33; §R07.4.34; §R07.4.35; §R07.1.26.

**Checks.**

- `savittReduction_newforms`: the weight-two newform case (Savitt, Proposition 6.18): for `f ∈ S₂(Γ₁(pN), χ_p^jχ_N)` with `j ∈ {1, …, p − 2}`, the reduction of `ρ_{f,p}` is ordinary (case `(1)` or
  `(2)`) when `f` has slope `0` or `1` and is `ω₂^{1+j} ⊕ ω₂^{p(1+j)}` on `I` when the slope lies in `(0, 1)`.
- `savittReduction_excluded`: in the excluded case of Lemma 6.8 `(v_p(x₁) = 0, j = 1, x₁² ≡ w)` the
  two characters `λ_{x₁^{−1}}ε` and `ω̃λ_{x₁w^{−1}}` have the same reduction, so `ρ̄` has nontrivial
  centraliser and the theorem makes no claim.
- In the level-two case, restriction to wild inertia `P_{ℚ_p}` is `1 ⊕ 1`. The
  distinct characters on full inertia are exchanged by Frobenius and give irreducibility
  for `G_{ℚ_p}`, not irreducibility of their direct sum on inertia.

### R07.5.10 Residual types of potentially Barsotti–Tate representations of tame type (Conrad–Diamond–Taylor, Savitt)

Prove `savittResidualTypes`. Let `ρ : G_{ℚ_p} → GL₂(E)` be potentially crystalline with Hodge–Tate
weights `{0, 1}` and `T` a `G`-stable `O_E`-lattice such that `T/m_E` has only scalar endomorphisms. Write {a}
for the representative of `a mod p − 1` in `{0, …, p − 2}`. `(1)` If `τ(ρ) = ω̃^i ⊕ ω̃^j` with `i ≢ j (mod p − 1)`, then `(T/m_E)|_{I} ⊗ F̄_p` is one of: an extension of `ω^j` by `ω^{1+i}` (sub `ω^{1+i}`, quotient
`ω^j`); an extension of `ω^i` by `ω^{1+j}`; or `ω₂^{k} ⊕ ω₂^{pk}` with `k = 1 + {j − i} + (p + 1)i`. `(2)` If
`τ(ρ) = ω̃₂^m ⊕ ω̃₂^{pm}` with `p + 1 ∤ m`, write `m = i + (p + 1)j` with `i ∈ {1, …, p}` and `j ∈ ℤ/(p − 1)`;
then `(T/m_E)|_{I} ⊗ F̄_p` is one of: an extension of `ω^{1+j}` by `ω^{i+j}`, peu ramifiée when `i = 2`;
an extension of `ω^{i+j}` by `ω^{1+j}`, peu ramifiée when `i = p − 1`; `ω₂^{p+m} ⊕ ω₂^{1+pm}`; or `ω₂^{1+m} ⊕ ω₂^{p(1+m)}`. `(3)` Without the hypothesis on endomorphisms, the semisimplification of the reduction of
every such indecomposable `ρ` (outside the reducible cases of Savitt's Lemma 6.8) is still the
semisimplification of one of the listed forms; only the list of lattices with non-scalar
endomorphisms is not determined. Equivalently (Gee's reformulation): `ρ̄ : G_{ℚ_p} → GL₂(F̄_p)` has a
potentially Barsotti–Tate lift of type `ω̃^i ⊕ ω̃^j` only if `ρ̄|_{I}` is one of the forms in `(1)` (peu
ramifiée when `i = j`), and of type `ω̃₂^m ⊕ ω̃₂^{pm}` only if it is one of the forms in `(2)`; the
converse holds when `ρ̄` is decomposable (type `(1)`) or has only scalar endomorphisms. In particular,
if `ρ̄` is reducible, `ρ̄ ≅ χ̄₁ ⊕ χ̄₂` up to semisimplification with `(χ̄₁/χ̄₂)|_{I} = ω^{i−1}` or
`ω^{1−i}` in the supercuspidal case.

`p` is odd; `E/ℚ_p` is a finite coefficient field with ring of integers `O_E` and residue field `k_E`; `ω̃`
and `ω̃₂` are the Teichmüller lifts of the fundamental characters `ω` (level `1`) and `ω₂` (level `2`) of `I`,
written additively in exponents; a Galois type is `τ(ρ) = WD(ρ)|_{I}` (§R07.4.27); Hodge–Tate
weights `{0, 1}` in Savitt's normalisation, in which the potentially Barsotti–Tate representations are
those of §R07.4.30. Conrad–Diamond–Taylor's conjectures 1.2.2–1.2.3 are the statements `(1)`–`(2)`;
Savitt proves them for `p` odd. The Breuil–Mézard multiplicities `µ_gal(2, τ, ρ̄)` of Savitt's Theorems
1.3–1.4 are read off from the same list and belong to LocalGaloisDeformationRings R08.`4` (the
deformation rings).

*Proof sketch.* Part `(1)`: twist by `ω̃^{−i}` to reduce to type `1 ⊕ ω̃^{j−i}`; by Proposition 2.17 the
filtered module is `D_{x₁,x₂}`; apply §R07.5.9: `v_p(x₁) = 0` or `v_p(x₂) = 0` gives the two reducible
forms, `0 < v_p(x_i) < 1` the irreducible one, unique because irreducible (Savitt, Corollary 6.15,
proof, p. 38). Part `(2)`: by Proposition 2.18 the filtered module is `D_{m,[a:b]} ≅ D_{pm,[bw:−a]}`;
Theorem 6.12 computes the reductions in the cases `v_p(a) = v_p(b), v_p(b) > v_p(a)` and `v_p(b) < v_p(a)`; there are at most two non-trivial reductions with trivial endomorphisms (Savitt, Corollary
6.15, proof, p. 39). Part `(3)`: Remark 6.17 — in every indecomposable case outside Lemma 6.8 Theorems
6.11–6.12 compute the reduction of at least one lattice, hence the semisimplification. Gee's
reformulation: the 'only if' direction is Savitt's Theorems 6.11–6.12 (and 1.3–1.4 when `ρ̄` has
scalar endomorphisms); the converse for decomposable `ρ̄` uses decomposable lifts (Gee 2011, Theorem
4.6.1, proof). The reducible supercuspidal case: the first two forms in `(2)` have characters `ω^{i+j}, ω^{1+j}`, whose ratio is `ω^{±(i−1)}`; this is the form used by Newton–Thorne (2021), proof of
Proposition 3.7. (Savitt 2005, §1, Theorems 1.3–1.4, pp. 2–3 (arXiv `v3`): the Conrad–Diamond–Taylor
multiplicities, stated in terms of the residual forms; Savitt 2005, §2.2, Proposition 2.18, pp. 9–10
(arXiv `v3`): the filtered modules of tame supercuspidal type; Savitt 2005, §6.3, Corollary 6.15 and
Remarks 6.16–6.17, pp. 38–39 (arXiv `v3`): the residual forms `(1)`–`(2)` and the remark on non-scalar
endomorphisms; Gee 2011, §4.6, Theorem 4.6.1, p. 21 (arXiv `v2`): Gee's restatement: which residual
representations have potentially Barsotti–Tate lifts of a given tame type; Newton–Thorne 2021, §3,
proof of Proposition 3.7, p. 143: the reducible tame supercuspidal case in the form `(χ̄₁/χ̄₂)|_{I} = ε^{±(i−1)}`.)

*Needs:* §R07.5.9; §R07.4.27; §R07.4.32; §R07.4.34; §R07.5.5; §R07.1.26.

**Checks.**

- `savittResidual_p3`: `p = 3`, type `1 ⊕ ω̃ (i = 0, j = 1): k = 1 + 1 + 0 = 2`, so the irreducible
  residual form is `ω₂² ⊕ ω₂^{6} = ω₂² ⊕ ω₂^{−2}` (`ω₂` has order `8`), and the reducible forms are
  extensions of `ω` by `ω` and of `1` by `ω²`.
- `savittResidual_peu`: for the scalar case `i = j` in Gee's form: a très ramifiée extension of `1` by `ω`
  has no potentially Barsotti–Tate lift of type `1 ⊕ 1`, because a lift of that type is crystalline
  with weights `{0, 1}`, hence comes from a `p`-divisible group, and its reduction would be finite flat
  (§R07.5.7); dropping the 'peu ramifiée' clause gives a false statement.
- Every listed fundamental character is trivial on wild inertia `P_{ℚ_p}`;
  full inertia `I_{ℚ_p}` is necessary to distinguish the tame residual types.

### R07.5.11 Fontaine–Laffaille residual types: the reduction determines the weights

Prove `flResidualWeights`. Let `K/ℚ_p` be unramified with residue field `k = F_{p^f}`, and `ρ : G_K → GL_n(ℤ_p)` a lattice in a crystalline `ℚ_p`-representation whose unlabelled Hodge–Tate
weights lie in a fixed interval `[a, a + p − 2]` (after a common shift). Then `ρ̄|_{I_K}^{ss}` is the
direct sum, over
the Jordan–Hölder factors of the Fontaine–Laffaille module of `ρ̄`, of the products of fundamental
characters given by Theorem 5.3 (§R07.3.9), and determines the multiset of unlabelled Hodge–Tate
weights in this fixed interval of length `< p − 1`. For `K = ℚ_p`, a finite coefficient field `E/ℚ_p`, and a two-dimensional
crystalline `E`-representation with an `O_E`-lattice `T` and unlabelled weights `(0, k − 1), 1 < k < p` (Breuil–Mézard), after extending residual scalars to `F̄_p`: if `V` is reducible, `V ≅ V(µ₁, µ₂)`, then `T̄ ≅ (ω^{k−1}λ(µ₂^{−1}) ∗ ; 0 λ(µ₁^{−1}))`, with `∗` peu ramifiée when `k = 2`; if `V` is irreducible (`V ≅ V(µ, ν)` with `ν ∈ m`), then `T̄ ≅ Ind_{G_{ℚ_{p²}}}^{G_{ℚ_p}} θ_{k−1} ⊗ λ(µ^{−1/2})`, so `T̄|_{I} ≅ ω₂^{k−1} ⊕ ω₂^{p(k−1)}` and `det T̄ = ω^{k−1}λ(µ^{−1})`. Choose an arithmetic Frobenius lift `Φ` with `ω(Φ) = 1`.
Here `θ_r` is the character of `G_{ℚ_{p²}}` defined by `θ_r|_I = ω₂^r` and
`θ_r(Φ²) = −1`, where `r = k−1`; choose either square root `µ^{−1/2}` in `F̄_p`.
The two choices give isomorphic inductions, since the unramified quadratic twist
restricts trivially to `G_{ℚ_{p²}}`. In particular two crystalline `ℚ_p`-representations whose
weights lie in the same such interval and differ cannot have isomorphic reductions (e.g. the adjoints of residual representations
of weights `{−1, 0, 1}` and `{−2, 0, 2}` are not isomorphic for `p` large).

The first assertion uses `ℤ_p`-lattices. The two-dimensional coefficient assertion is
over `ℚ_p` and uses unlabelled weights: restrict scalars to `ℤ_p`, transport the commuting
`O_E`-action through the full faithfulness of §§R07.3.11 and R07.3.14, and realize the
quotient by a uniformiser of `O_E` using the torsion subquotient compatibility of
§§R07.3.12 and R07.3.17. This specialized bridge is part of this target; the general
labelled coefficient theory stays with the owners named under Scope and ownership.
`K` unramified `(e = 1)`; the interval of length `≤ p − 2` is the safe range of §R07.3.11; `λ(µ)` is the
unramified character sending arithmetic Frobenius to `µ`; Breuil–Mézard use the covariant `V_st,k`,
which explains the inverses.

*Proof sketch.* The reduction of a lattice in the essential image is `U_S` of a torsion
Fontaine–Laffaille module (§R07.3.17, §R07.3.12); its Jordan–Hölder factors are the simple objects
`M(h; i)` (§R07.3.8) and inertia acts on `U_S(M(h; i))` through the characters of Theorem 5.3
(§R07.3.9), whose exponents are the filtration jumps. When the weights lie in an interval of length
`< p − 1` the exponents are recovered from the characters (the base-`p` digits are in `[0, p − 2]`), so
`ρ̄|_I^{ss}` determines the weights. For the two-dimensional `O_E`-case, use the preceding restriction-of-scalars bridge
to realize `T/m_E` through a torsion module with commuting `O_E`-action. Breuil–Mézard's
explicit rank-two computation then gives the two cases: `(i)` the reducible `V(µ₁, µ₂)` is an
extension of `λ(µ₁^{−1})` by `ε^{k−1}λ(µ₂^{−1})` and the Fontaine–Laffaille reduction keeps the
extension, peu ramifiée when `k = 2` (finite flat, §R07.5.7); `(ii)` the irreducible `V(µ, ν)` reduces to
an irreducible module with filtration jumps `0, k − 1` and level-`2` inertia characters (Breuil–Mézard,
Proposition 4.1.1, proof). (Breuil–Mézard 2002, §4.1, Proposition 4.1.1 and its proof, pp. 30–31:
the reductions of two-dimensional crystalline representations of weights `(0, k − 1), 1 < k < p`, in
the reducible and irreducible cases; Newton–Thorne 2026, §5, Proposition 5.4 and its proof, pp.
39–40, and the proof of Lemma 5.7, pp. 40–41 (arXiv:2212.03595v2): Fontaine–Laffaille theory used to
show that residual representations determine Hodge–Tate weights in small ranges.)

*Needs:* §R07.3.14; §R07.3.9; §R07.3.17; §R07.3.12; §R07.3.8; §R07.3.11; §R07.1.26; §R07.5.5.

**Checks.**

- `flResidual_supersingular`: `k = 2, V` irreducible: `T̄|_I = ω₂ ⊕ ω₂^p`, the supersingular elliptic
  curve case (§R07.5.3).
- In the induced basis `Φ` has determinant `−θ_{k−1}(Φ²) = 1` before the twist,
  hence `µ^{−1}` after it; on inertia the determinant is
  `ω₂^{(p+1)(k−1)} = ω^{k−1}`. Setting `θ_{k−1}(Φ²) = 1` instead would
  give `−µ^{−1}` at `Φ`, a different determinant since `1 < k < p` implies `p` is odd.
- `flResidual_endpoint`: at the endpoint weight `k − 1 = p − 1` the characters `ω^0` and `ω^{p−1}`
  coincide, so the reduction no longer determines the weights; the length `< p − 1` hypothesis is
  needed.
- For `ℚ_p` and `p` odd, `ℤ_p` and `ℤ_p(p − 1)` have isomorphic mod-`p` reductions,
  although each has a single weight. They do not lie in the same interval of length
  at most `p − 2`; that common fixed interval is required for weight recovery.

### R07.5.12 Inertial types of crystalline `ℤ_l`-lattices with Hodge–Tate numbers `{0, 1}`

Prove `crystalline01InertiaTypes`. Let `K/ℚ_l` be finite unramified and `r : G_K → GL₂(ℤ_l)` crystalline
with Hodge–Tate numbers `{0, 1}` for every embedding `K ↪ ℚ̄_l` (coefficients `ℤ_l`, not a larger ring of
integers). Then either `(r̄|_{I_K})^{ss} ≅ 1 ⊕ ε̄_l^{−1}`, or `r̄|_{I_K} ≅ ω_{l,2}^{−1} ⊕ ω_{l,2}^{−l}`,
where `ε_l` is the `l`-adic cyclotomic character and `ω_{l,2}` a fundamental character of level `2` (the
convention is that `ε_l` has Hodge–Tate number `−1`). In the first case, if `r` is ordinary, `r̄` is an
extension of an unramified-times-`ε̄_l^{−1}` quotient by an unramified sub (read off from the
connected–étale sequence of the `l`-divisible group).

`K/ℚ_l` unramified (`e = 1 < l − 1` when `l > 2`); the statement fails if `ℤ_l` is replaced by the ring of
integers of a larger extension of `ℚ_l`, since then further rank-one `F`-vector-scheme types occur.

*Proof sketch.* `r^∨` is the Tate module of a height-two `l`-divisible group `G` over `O_K` (§R07.4.20,
§R07.4.23 for `l = 2`), of height `2` and dimension `1`, since each embedding contributes the Hodge–Tate
numbers `{0, 1}` (§R07.1.19); so `G` is neither étale `(dim G = 0)` nor of multiplicative type `(dim G^D = 0)`. So `r̄^∨` is the generic fibre of the finite flat group scheme `H = G[l]` over the completed maximal
unramified extension, of order `l²` and killed by `l`, neither étale nor multiplicative. Raynaud's
classification (§R07.1.29, §R07.1.32; Raynaud, Proposition 3.2.1 and Theorem 3.4.3) leaves four
inertial possibilities: `1 ⊕ ε̄^{−1}, ω₂^{−1} ⊕ ω₂^{−l}, 1 ⊕ 1, ε̄^{−1} ⊕ ε̄^{−1}`. For `l = 2, 1 = ε̄^{−1}` and the claim holds; for `l > 2, det r` is crystalline with all Hodge–Tate numbers `1`, so `det r|_{I} = ε_l^{−1}`, which excludes `1 ⊕ 1` and `ε̄^{−1} ⊕ ε̄^{−1}` (ACC, Lemma 7.1.8, proof). (ACC 2023,
§7.1, Lemma 7.1.8(1) and its proof, pp. 1091–1092: the two possible residual inertial types, with
the remark that the coefficients must be `ℤ_l`.)

*Needs:* §R07.4.20; §R07.4.23; §R07.1.19; §R07.1.29; §R07.1.32; §R07.1.26.

**Checks.**

- `crystalline01Types_elliptic`: the dual `l`-adic Tate module of an elliptic curve over `ℚ_l` with good
  ordinary reduction falls in the first case, with good supersingular reduction in the second
  (compare §R07.5.2 and §R07.5.3).
- `crystalline01Types_coefficients`: with `O_E`-coefficients, `E ⊋ ℚ_l`, a rank-two crystalline
  `O_E`-lattice with labelled weights `{0,1}` at one embedding and `{0,0}` or `{1,1}` at others can have
  other residual inertial types, which is why the lemma insists on `ℤ_l`.
- For `l = 5, det E[5] = ε̄₅` and `det E[5]^∨ = ε̄₅⁻¹`; the displayed
  negative-exponent types belong to the dual Tate module in this Hodge–Tate-number convention.

### R07.5.13 The peu ramifié subspaces `H¹_f(G_L, F_l(ε̄χ̄))` and `H¹_f(G_L, ℤ_l(εχ))`

Define `peuRamifieH1`. Let `L/ℚ_l` be finite and `χ̄ : G_L → F_l^×` (resp. `χ : G_L → ℤ_l^×`) unramified.
`H¹_f(G_L, F_l(ε̄_lχ̄))` is the kernel of the composite `H¹(G_L, F_l(ε̄_lχ̄)) → H¹(G_{L^nr}, F_l(ε̄_l)) ≅ L^{nr,×}/(L^{nr,×})^l → ℤ/l`, the last map induced by the valuation; `H¹_f(G_L, ℤ_l(ε_lχ))` is the
kernel of `H¹(G_L, ℤ_l(ε_lχ)) → H¹(G_{L^nr}, ℤ_l(ε_l)) ≅ lim_r L^{nr,×}/(L^{nr,×})^{l^r} → ℤ_l`. If `χ̄`
(resp. `χ`) is nontrivial, `H¹_f = H¹`; and `H¹(G_L, F_l(ε̄_l))/H¹_f(G_L, F_l(ε̄_l)) ≅ F_l`. For `L = ℚ_l`
and `χ̄ = 1`, a class `c` lies in `H¹_f` exactly when its extension `ρ_c` of the trivial character
by `ε̄_l` has trivial wild inertia or is peu ramifiée in the restricted sense of §R07.5.5.
Equivalently its Kummer generator can be taken to be a unit. On the nontrivial-wild domain
this is precisely Serre's predicate; the kernel also contains the zero and wild-trivial classes.

`L/ℚ_l` finite, `L^nr` its maximal unramified extension; Kummer theory `H¹(G_M, μ_{l^r}) ≅ M^×/(M^×)^{l^r}` for a field `M` of characteristic `0` is TauCetiRoadmap.ProfiniteCohomology Layer 9
(Hilbert `90` and Kummer theory); over `L^nr` the twist by `χ̄` disappears because `χ̄` is unramified.

*Construction.* Restriction to `G_{L^nr}` kills the twist by the unramified `χ̄` and lands in the Kummer
group of `L^nr` (Kummer theory). The valuation `v : L^{nr,×} → ℤ` induces `L^{nr,×}/(L^{nr,×})^l → ℤ/l`;
`H¹_f` is the kernel of the composite. If `χ̄ ≠ 1` the image of restriction lies in the `χ̄`-isotypic part
for the Frobenius action, on which the Frobenius-invariant valuation map vanishes, so `H¹_f = H¹`. For
`χ̄ = 1` the composite `H¹(G_L, F_l(ε̄)) ≅ L^×/(L^×)^l → ℤ/l` is surjective (a uniformiser maps to `1`),
giving the quotient `F_l`. If wild inertia acts trivially, the extension splits after the tame
base change to `L^nr(ζ_l)`: its remaining tame Galois group is pro-prime-to-`l`, so
`H¹` with these finite coefficients vanishes. Restriction from `L^nr` to `L^nr(ζ_l)` is injective
by restriction-corestriction, so its Kummer class over `L^nr` is zero and its valuation vanishes.
When wild inertia is nontrivial, §R07.5.5 identifies that valuation condition with Serre's
unit-Kummer condition. The `ℤ_l` version is the inverse limit over `r` of the same construction. (ACC
2023, §7.2.1, p. 1098: the definition of `H¹_f` for `F_l(ε̄χ̄)` and `ℤ_l(εχ)` through the valuation, and
the two facts `H¹_f = H¹` for nontrivial `χ̄` and `H¹/H¹_f ≅ F_l`.)

The API:

- `peuRamifieH1`: `H¹_f(G_L, F_l(ε̄χ̄))` as a subspace of `H¹(G_L, F_l(ε̄χ̄))`.
- `peuRamifieH1Int`: `H¹_f(G_L, ℤ_l(εχ))` as a `ℤ_l`-submodule of `H¹(G_L, ℤ_l(εχ))`.
- `peuRamifieH1_eq_top`: `χ̄ ≠ 1` implies `H¹_f = H¹`.
- `peuRamifieH1_quotient`: `H¹(G_L, F_l(ε̄))/H¹_f ≅ F_l`.
- `peuRamifieH1_iff_isPeuRamifiee`: For `L = ℚ_l, χ̄ = 1` and every class `c, c ∈ H¹_f` iff wild inertia acts trivially on `ρ_c` or `IsPeuRamifiee(ρ_c)`.
  The second disjunct includes the nontrivial-wild hypothesis of §R07.5.5.
  Under nontrivial wild inertia this reduces to the restricted peu ramifiée iff.

*Needs:* §R07.5.5; TauCetiRoadmap.ProfiniteCohomology Layer 9.

**Checks.**

- `peuRamifieH1_Ql_finrank`: For `L = ℚ_l, l` odd, `χ̄ = 1: dim H¹ = 2` and `dim H¹_f = 1`.
- `peuRamifieH1_nontrivial`: For `χ̄` nontrivial unramified, `H¹_f = H¹`.
- `peuRamifieH1_uniformiser`: The Kummer class of a uniformiser of `L` is not in `H¹_f(G_L, F_l(ε̄))`: a
  definition using all of `H¹` fails this.
- `peuRamifieH1_unit`: The Kummer class of a unit of `O_L` lies in `H¹_f(G_L, F_l(ε̄))`.
  For `L = ℚ₃`, the unit `4` gives a nonzero example: a `3`-adic unit cube is `±1` modulo `9`,
  whereas `4` is neither. Its wild action is nontrivial and it satisfies Serre's predicate.
- The zero class lies in `H¹_f` and gives `ρ₀ = 1 ⊕ ε̄_l`, with trivial wild inertia
  and two-dimensional wild invariants. For odd `l` the cyclotomic summand is tamely
  ramified. Its Kummer extension becomes trivial after the tame base change.
- For `L = ℚ₂`, the nonzero unit class `5` defines the unramified quadratic extension
  `ℚ₂(√5): (1+√5)/2` has polynomial `X²−X−1`, irreducible and separable modulo `2`.
  This class lies in `H¹_f` and satisfies the trivial-wild disjunct.

For `L = ℚ_p` and `χ̄ = 1`, the Kummer-class description is: the class
of `x ∈ ℚ_p^×` lies in `H¹_f` exactly when `p ∣ v_p(x)`, which is the predicate
`IsPeuRamifieeClass p x`. Its tests are `isPeuRamifieeClass_of_valuation_eq_zero` (units),
`not_isPeuRamifieeClass_p` (the class of `p` is très ramifiée), `isPeuRamifieeClass_one`
(the zero Kummer class, with trivial wild inertia), and `isPeuRamifieeClass_pow`
(`p`-th powers represent that same zero class). The predicate is total on Kummer classes;
it agrees with §R07.5.5's restricted predicate when wild inertia is nontrivial.
For a Tate curve with `p ∣ v(q)`, its torsion is wild-trivial or peu ramifiée in that
restricted sense, according to its Kummer class.

### R07.5.14 Integral peu ramifié classes lift residual ones

Prove `peuRamifieIntegralLifting`. For `L/ℚ_l` finite and `χ : G_L → ℤ_l^×` unramified with reduction
`χ̄`, the reduction map `H¹_f(G_L, ℤ_l(ε_lχ)) → H¹_f(G_L, F_l(ε̄_lχ̄))` is surjective.

*Proof sketch.* If `χ̄ ≠ 1, H¹_f = H¹` on both sides and the cokernel is `H²(G_L, ℤ_l(εχ))[l]`, which is
dual to `H⁰(G_L, ℚ_l/ℤ_l(χ^{−1})) = 0` by local Tate duality (TauCetiRoadmap.ClassFieldTheory Layer 5,
`tateDualityPairing_perfect_mixed`). If `χ ≠ 1 = χ̄`, duality gives an exact sequence `H¹(G_L, ℤ_l(εχ)) → H¹(G_L, F_l(ε)) → F_l → 0`; the image is contained in `H¹_f(G_L, F_l(ε))`, which has codimension one
(§R07.5.13), so equals it. If `χ = 1` the claim is the surjectivity of `lim_r O_L^×/(O_L^×)^{l^r} → O_L^×/(O_L^×)^l`. (ACC 2023, §7.2.1, Lemma 7.2.2 and its proof, pp. 1098–1099: surjectivity of the
reduction map on `H¹_f`, by the three cases.)

*Needs:* §R07.5.13; TauCetiRoadmap.ProfiniteCohomology Layer 9; TauCetiRoadmap.ClassFieldTheory
Layer 5 (local Tate duality).

**Checks.**

- `peuRamifieLifting_trivial`: `χ = 1, L = ℚ_l`: the map `ℤ_l^× ^ `(`l`-adic completion) `→ ℤ_l^×/(ℤ_l^×)^l`
  is visibly onto.
- `peuRamifieLifting_full_H1`: on the full `H¹` with `χ = 1` the map is still onto `H¹(G_L, F_l(ε))`
  (Kummer theory), but onto `H¹_f` is the content needed for ordinary points; with `χ ≠ 1 = χ̄` the full
  `H¹(G_L, F_l(ε))` is not in the image.

### R07.5.15 Serre weights of `GL₂(F)` and their compact inductions

Define `SerreWeight`. Let `F` be a non-archimedean local field with ring of integers `O_F`, uniformiser
`ϖ`, residue field `k_F` of characteristic `p, G = GL₂(F), K = GL₂(O_F)` and `Z` the centre. A Serre weight
is an irreducible smooth representation `σ` of `KZ` on a finite-dimensional `F̄_p`-vector space on which `Z`
acts by a character; its restriction to `K` factors through `GL₂(k_F)`, and for `F = ℚ_p` the Serre
weights are `Sym^r F̄_p² ⊗ det^s (0 ≤ r ≤ p − 1, s mod p − 1)` with `ϖ` acting by a scalar. `I(σ) = c-Ind_{KZ}^G σ` is the space of functions `f : G → V_σ`, compactly supported modulo `Z`, with `f(kg) = σ(k)f(g)`, with `G` acting by right translation. Its Hecke algebra `End_G(I(σ))` is identified, by
Frobenius reciprocity, with the convolution algebra of compactly supported `(mod Z)` functions `φ : G → End(V_σ)` with `φ(k₁gk₂) = σ(k₁)φ(g)σ(k₂)`. Barthel–Livné: `End_G(I(σ)) ≅ F̄_p[T]` for the Hecke operator
`T` supported on `KZ diag(1, ϖ)^{±1} KZ`, and `I(σ)` is a free `F̄_p[T]`-module (of infinite rank). For `F = ℚ_p`, extend `σ = Sym^r F̄_p² ⊗ det^s` to `KZ` by requiring `p·I₂` to act as `1`,
and normalize `T` by the highest-weight projection at `diag(1,p)^{−1}` as below. For `λ ∈ F̄_p^×`, the
quotient `I(σ)/(T − λ) ⊗ (χ∘det)` is irreducible
unless `(r, λ) ∈ {(0, ±1), (p − 1, ±1)}`, where it has length `2` with constituents a character and a
twist of the Steinberg (special) representation; for `F = ℚ_p` and `λ = 0, I(σ)/(T)` is irreducible
(Breuil), and these are the supersingular representations.

Other central-uniformiser actions are treated through the separate character twist `χ∘det`.
`F` non-archimedean local with finite residue field of characteristic `p`; coefficients `F̄_p`; smooth
means every vector has open stabiliser. Smooth representations and compact induction are
TauCetiRoadmap.SmoothRepresentationsOfLocalGroups' (Layer SR.2, with the Hecke algebras of Layer
SR.1); the Serre-weight Hecke algebra here is the `σ`-isotypic version of its permutation Hecke
algebra.

*Construction.* Define `σ, I(σ)` and the convolution description of `End_G(I(σ))` (Breuil 2003,
§§2.3–2.4). The support of the Hecke algebra is `KZ\G/KZ`, indexed by `diag(1, ϖ^n)`; the operator `T` of
the double coset of `α = diag(1, ϖ)` with `φ(α^{−1})` the projection onto the highest weight line
generates it (Barthel–Livné, Prop. `8`, as quoted by CDN, (1.5)). Freeness of `I(σ)` over `F̄_p[T]`
(Barthel–Livné, Th. `19`; Breuil 2003, Remarque 3.1.4). The irreducibility and length-two statements
are Barthel–Livné's classification, summarised in Breuil 2003, Théorème 2.7.1; `λ = 0` for `F = ℚ_p` is
Breuil 2003, Théorème 1.1. (Colmez–Dospinescu–Nizioł 2023, §1.2.1, p. 14 (arXiv 2204.11214v2): Serre
weights, `I(σ), End_G(I(σ)) ≅ F̄_p[T]` and freeness, quoting Barthel–Livné Prop. `8` and Th. `19`; Breuil
2003, §§2.3–2.4 and 2.7, Théorème 2.7.1 and Remarque 3.1.4, pp. 6–10: compact induction, the Hecke
algebra as a convolution algebra, the operator `T`, Barthel–Livné's classification and freeness;
Breuil 2003, Théorème 1.1, p. 3: for `F = ℚ_p` the quotients `I(σ)/(T)` are irreducible.)

The API:

- `SerreWeight`: An irreducible smooth `F̄_p[KZ]`-module with central character.
- `SerreWeight.sym`: For `F = ℚ_p: Sym^r ⊗ det^s` with `0 ≤ r ≤ p − 1`.
- `compactInduction`: `I(σ) = c-Ind_{KZ}^G σ` as a smooth `G`-representation.
- `heckeOperatorT`: The Hecke operator `T ∈ End_G(I(σ))`.
- `endEquivPolynomial`: `End_G(I(σ)) ≅ F̄_p[T]` as `F̄_p`-algebras.
- `compactInduction_free`: `I(σ)` is free over `F̄_p[T]`.

*Needs:* TauCetiRoadmap.SmoothRepresentationsOfLocalGroups Layer SR.2 (compact induction).

**Checks.**

- `sym_dim`: `dim Sym^r F̄_p² = r + 1`; there are `p(p − 1)` Serre weights of `GL₂(ℚ_p)` up to the action
  of `ϖ`. At the pins: the labels `(r, s)` of the Serre weights `Sym^r ⊗ det^s` of `GL₂(F_p)` form
  `SerreWeights.Label p`, with `SerreWeights.card_label` (`p(p − 1)` labels) and
  `SerreWeights.finrank_sym` (homogeneous polynomials of degree `r` in two variables over `F_p` have
  dimension `r + 1`). At `p=2` there are two labels (the determinant label is unique);
  at `p=3` there are six (three symmetric powers and two determinant twists).
- `trivial_length_two`: For `σ` trivial and `λ = 1, I(σ)/(T − 1)` has length `2` (trivial character and
  Steinberg).
- `not_finite_dim`: `I(σ)` is infinite-dimensional, and so is `I(σ)/(T)`: a definition with ordinary
  induction from `KZ` (not compact support) gives a different, non-admissible module.
- `compactInduction_frobenius`: `Hom_G(I(σ), π) ≅ Hom_{KZ}(σ, π|_{KZ})` for every smooth `π`.
- For `p = 5`, twisting the trivial-weight `λ = 1` length-two quotient by an
  unramified `χ` with `χ(5) = 2` gives central scalar `4` and Hecke eigenvalue `2` when
  the twist is absorbed into `σ`. The exceptional `±1` list uses the central scalar `1` normalization.
- At `p = 5`, the natural weight and its `det²` twist both have dimension `2` and
  determinant `det`, but traces `3` and `2` at `diag(2,1)`; these invariants do not distinguish weights.


### Examples

- For `E/ℚ_p` with good supersingular reduction and `p` odd, `E[p]|_{I} ≅ ω₂ ⊕ ω₂^p` (level-two
  fundamental characters), irreducible over `F_p`; with good ordinary reduction `E[p]|_{I}` is an
  extension of `1` by `ω`.
- For the Tate curve `E_q` over `ℚ_p`, `E[p]` is finite at `p` exactly when `p ∣ v(q)`: the Kummer
  class of `q` is peu ramifiée exactly then.

### Dependencies

Layers R07.1, R07.3 and R07.4; TauCetiRoadmap.LocalFieldsRamification Layer 4;
TauCetiRoadmap.EllipticCurves Layer 4; TauCetiRoadmap.ProfiniteCohomology Layer 9;
TauCetiRoadmap.SmoothRepresentationsOfLocalGroups Layer SR.2; ArithmeticGaloisRepresentations Layer
6.

## Layer R07.6: Deformation and ramification consequences

The last layer draws the consequences used by finiteness and modularity arguments: the torsion of an
abelian scheme is finite flat, Fontaine's bound on the ramification of finite flat group schemes
over `𝒪_K` (with Krasner-type embedding criteria and the lifting lemma behind it), Illusie's
obstruction theory for lifting homomorphisms, finite flatness as a deformation condition with its
tangent space, the behaviour of finite flatness under base change and twisting, Raynaud's theorem
that the determinant of the Tate module of a `p`-divisible group is `χ^d`, and the stability of the
mod-`p` image over the cyclotomic tower.

### R07.6.1 Torsion of abelian schemes is finite flat, and elliptic curves with good reduction

Prove `abelianSchemeTorsionFiniteFlat` as the compatibility of the torsion and tower supplied
by AbelianSchemesAndArithmeticModuli §A3.2 `multiplicationAndDensity` and §A4.5
`BarsottiTate.ofAbelian` with this roadmap's generic Galois realization. For an abelian scheme
`A/S` of relative dimension `g` and an integer `n ≠ 0`, those suppliers give `A[n]` finite locally
free of rank `|n|^{2g}` and `[n]` an isogeny; they give `A[p^∞]` of height `2g`. If `S = Spec R` with `R` a DVR of
mixed characteristic `(0, p)` and fraction field `K`, the Galois module `A_K`[p^v](K̄) is the generic
fibre of the finite flat group scheme `A[p^v]`, and `T_p(A_K) = T_p(A[p^∞])`. In particular, for an
elliptic curve `E/ℚ` with good reduction at `p`, its minimal Weierstrass model over `ℤ_p` is an elliptic
curve (an abelian scheme of relative dimension `1`), and `E[p^v]` is the generic fibre of a finite flat
`ℤ_p`-group scheme of order `p^{2v}`.

For an integer `n ≠ 0`, multiplication `[n]` is an isogeny, finite locally free of rank `|n|^{2g}`
(AbelianSchemesAndArithmeticModuli §A3.2
`multiplicationAndDensity` and §A4.5 `BarsottiTate.ofAbelian`; for elliptic curves
TauCetiRoadmap.ModularCurves Layers
2A and `7E`).

*Proof sketch.* Consume `multiplicationAndDensity` and `BarsottiTate.ofAbelian`,
including their base-change and truncation identities. Over a DVR the generic fibre of `A[p^v]` is
`A_K[p^v]`, so its `K̄`-points
are the Galois module `A_K`[p^v](K̄), and the Tate modules agree (§R07.1.8). Good reduction: a
Weierstrass model over `ℤ_p` with unit discriminant is smooth and proper with geometrically connected
genus-`1` fibres, i.e. an elliptic curve over `ℤ_p`. (Stix 2012, §9.2, example `(6)`, p. 56: `A[p^∞]` of an
abelian scheme.)

*Needs:* §R07.1.6; §R07.1.8; AbelianSchemesAndArithmeticModuli §A3.2
`multiplicationAndDensity` and §A4.5 `BarsottiTate.ofAbelian`; Mathlib
`WeierstrassCurve.HasGoodReduction`.

**Checks.**

- For a positive-dimensional elliptic scheme, `A[0] = A` is not finite; the supplier
  applies to `n ≠ 0`, including `n = −1`, whose torsion has rank one.
- `abelianTorsion_11a1`: `E =` 11a1 at `p = 3: E[3]` is the generic fibre of a finite flat `ℤ₃`-group
  scheme of order `9`.
- `abelianTorsion_bad_reduction`: at a prime of bad reduction the statement is false in general: for
  the Tate curve with `v(q) = 1` and `p` odd, `E[p]` is très ramifiée and not finite (§R07.5.7).
- `abelianTorsion_rank`: `A[n]` has rank `n^{2g}`, not `n^g`: for an elliptic curve, `E[2]` has rank
  `4`, with three nonzero points of order `2` over `K̄` when `2` is invertible.

### R07.6.1a Herbrand theory over complete DVRs with perfect residue field

Prove `perfectResidueHerbrand`. Let `K` be complete discretely valued with perfect residue
field of characteristic `p>0`, and `L/K` finite Galois. Its mixed-characteristic case is
supplied by PadicPeriodRings §2: the ramification prerequisite of `senUpperBreaks` and the
different inputs of general-base `periodTraceIdeal` and `senTowerEstimates`.
This target owns the equal-characteristic extension, `char K=p`; the combined statement
uses the supplied mixed-characteristic case. The following contract holds in both cases.

Use the existing congruence carrier `Ideal.ramificationGroup` for the maximal ideal of `O_L`
and its real-indexed ceiling extension `TauCeti.IsLocalRing.ramificationGroupReal`.
Use Serre's normalization
`φ(s)=∫₀ˢ [G₀:G_t]⁻¹ dt` for `s≥0`, extended by `φ(s)=s` on `[-1,0]`, and its inverse `ψ`.
The contract comprises strict monotonicity, continuity, the inverse identities, subgroup
compatibility of lower numbering, tower compatibility of the Herbrand functions and quotient compatibility of upper
numbering for every normal subgroup, and the different formula
`v_L(𝒟_{L/K})=Σ_{j≥0} (|G_j|−1)`, with `v_L` normalized to have value group `ℤ`.
It includes the absolute upper filtration by inverse limit and invariance of inertia,
nonnegative upper ramification and the normalized different after completed maximal unramified
base change, with the finite extension there obtained by compositum. In mixed characteristic
this is the supplied algebraically closed residue reduction used in §R07.6.5.

These are extensions of LocalFieldsRamification Layer 3 on the same local-ring congruence
carrier: PadicPeriodRings owns the mixed-characteristic theory, and this target proves the
equal-characteristic theory. In each case require agreement of all groups, functions and
different ideals with LocalFieldsRamification when the residue field is finite. Use
`TauCeti.IsLocalRing.lowerIndex` for the local-ring index, without assuming local compactness.
(Serre, *Local Fields*, IV §§1–3, especially Propositions 4 and 14;
Fontaine 1985, §§1.1–1.3, pp.517–518 and §2.1, p.525.)

*Needs:* PadicPeriodRings §2 (`senUpperBreaks` ramification prerequisite and general-base
`periodTraceIdeal`, `senTowerEstimates` different inputs); LocalFieldsRamification Layer 3
(finite-residue interface); Mathlib `differentIdeal`;
Tau Ceti `Ideal.ramificationGroup` (`RingTheory/Ideal/RamificationGroup.lean`) and
`TauCeti.IsLocalRing.lowerIndex` (`RingTheory/LocalRing/RamificationGroup.lean`).

**Checks.**

- `K=Frac W(𝔽̄_p)` is permitted despite its infinite residue field. For odd `p`,
  `K(ζ_p)/K` is tame of degree `p−1`, with `G₀=G`, `G₁=1` and different exponent `p−2`.
- On finite extensions of `ℚ_p`, the groups and `φ,ψ` are the supplied LocalFieldsRamification
  objects, including the tame slope `1/e` after the last lower break.
- A finite unramified extension has `G₀=1` and unit different; after completed maximal
  unramified base change its compositum extension is trivial and has the same upper inertia.
- Completed maximal unramified base change of `ℚ₃(ζ₉)/ℚ₃` retains its ramification index,
  lower breaks, upper breaks and normalized different.
- For any perfect `k` of characteristic `p`, the Artin–Schreier extension of `k((t))`
  given by `y^p−y=t⁻¹` has degree `p`, lower and upper break `1`, and different exponent
  `2(p−1)`. The element `y⁻¹` is a uniformizer, and each nonidentity automorphism changes
  it by an element of valuation `2`.

### R07.6.2 Fontaine's normalisation of the ramification filtration

Define `fontaineLowerIndex`. For `L/K` finite Galois with group `G` and `g ∈ G`, let `i_{L/K}(g) = v_K(a_g), a_g` the ideal of `O_L` generated by the `(g − 1)x, x ∈ O_L`, and for real `i` let `G_(i) = {g : i_{L/K}(g) ≥ i}`. `φ_{L/K}(i) = Σ_{g∈G} min(i, i_{L/K}(g))` is piecewise linear, increasing and
bijective with inverse `ψ_{L/K}`; `u_{L/K}(g) = φ_{L/K}(i_{L/K}(g))` and `G^(u) = {g : u_{L/K}(g) ≥ u}`,
so `G^(u) = G_(ψ_{L/K}(u))`. Put `i_{L/K} = sup_{g≠1} i_{L/K}(g)` and `u_{L/K} = sup_{g≠1} u_{L/K}(g) = φ_{L/K}(i_{L/K})`. Comparison with Serre's lower and upper numbering: `G_j = G_((j+1)/e_{L/K})` and `G^v = G^(v+1)`, i.e. `G^(u) = G^{u−1}`. The `G^(u)` are compatible with quotients, so they define closed
subgroups `G_K^(u) = lim_L Gal(L/K)^(u)` of `G_K`, and `u_{L/K}` is the least `u` with `G_K^(u+ε) ⊆ Gal(K̄/L)`
for all `ε > 0`. The different satisfies `v_K(𝒟_{L/K}) = u_{L/K} − i_{L/K}`.

`K` is complete for a discrete valuation with perfect residue field `k` of characteristic `p`; `v_K` is
normalised by `v_K(K^*) = ℤ` and extended to `K̄`; for `L/K` finite Galois with group `G, e_{L/K}` is its
ramification index and `a^m_{L/K} = {x ∈ O_L : v_K(x) ≥ m}` (Fontaine 1985, §1). Serre's lower and
upper numbering, Herbrand's functions, compatibility with quotients (Local Fields IV, Prop. `14`) and
`v(𝒟) = Σ i_G(g)` (Local Fields IV, Prop. `4`) are supplied in this generality by
PadicPeriodRings §2 in mixed characteristic and §R07.6.1a in equal characteristic, agreeing
with LocalFieldsRamification Layer 3 for finite residue fields. This
target adds Fontaine's shifted normalisation and the invariants `u_{L/K}, i_{L/K}`.

*Construction.* Fontaine's `i_{L/K}(g)` is Serre's `i_G(g)` divided by `e_{L/K}` (`v_K` rather than `v_L`),
which gives `G_j = G_((j+1)/e_{L/K})`; Herbrand's `φ` is rescaled the same way, giving `G^v = G^(v+1)`
(Fontaine 1985, 1.2(i)). Compatibility with quotients is Serre's Local Fields IV, Prop. `14`, in the
shifted numbering (1.2(ii)). `v_K(𝒟_{L/K}) = Σ_{g≠1} i_{L/K}(g) = Σ_g min(i_{L/K}, i_{L/K}(g)) − i_{L/K} = φ_{L/K}(i_{L/K}) − i_{L/K} = u_{L/K} − i_{L/K}` (Proposition 1.3, from Local Fields IV,
Prop. `4`). (Fontaine 1985, §1.1, p. 517: Fontaine's lower index; Fontaine 1985, §1.2, Remarque i), p.
518: the dictionary with Serre; Fontaine 1985, §1.3, Proposition, p. 518: Proposition 1.3.)

The API:

- `fontaineLowerIndex`: `i_{L/K}(g) = v_K(a_g) ∈ (1/e_{L/K})ℤ ∪ {∞}`.
- `fontaineUpper`: `G^(u) = {g : φ_{L/K}(i_{L/K}(g)) ≥ u}`.
- `fontaineUpperBreak`: `u_{L/K} = sup_{g≠1} u_{L/K}(g)`.
- `fontaineUpper_eq_serreUpper`: `G^(u) = G^{u−1}` in Serre's upper numbering.
- `valuation_different_eq`: `v_K(𝒟_{L/K}) = u_{L/K} − i_{L/K}`.

*Needs:* Mathlib `differentIdeal`; §R07.6.1a.

**Checks.**

- `cyclotomic_upper_break`: for `n ≥ 1` and `(p,n) ≠ (2,1), u_{ℚ_p(ζ_{p^n})/ℚ_p} = n` and `v_p(𝒟) = n − 1/(p − 1)`. At `(p,n) = (2,1)`
  the extension is the identity, its upper break is `0` and its different is the unit ideal.
- `tame_upper_break`: A nontrivial tamely and totally ramified extension has `u_{L/K} = 1`.
- `unramified`: `L/K` unramified: `i_{L/K}(g) = 0` for `g ≠ 1, u_{L/K} = 0` and `𝒟_{L/K} = O_L`.
- `shift_non_example`: For `p` odd and `ℚ_p(ζ_p)/ℚ_p`, Serre's `G^v` is trivial for `v > 0` while Fontaine's
  `G^(u)` is
  all of `G` for `u ≤ 1`: the numberings differ by one.

### R07.6.3 Embeddings from approximate homomorphisms: the property `(P_m)`

Prove `krasnerEmbeddingCriterion`. Let `L/K` be finite Galois and `m ≥ 0` real. Consider `(P_m)`: for
every algebraic extension `E` of `K`, if there is an `O_K`-algebra homomorphism `O_L → O_E/a^m_{E/K}`, then
there is a `K`-embedding `L → E`. Then `(i)` if `m > u_{L/K}, (P_m)` holds; `(ii)` if `(P_m)` holds, `m > u_{L/K} − e_{L/K}^{−1}`. The key identity: for `O_L = O_K[α]` with minimal polynomial `P` and `β` algebraic over `K`,
with `i = sup_g v_K(β − gα)` and `u = v_K(P(β))`, one has `u = φ_{L/K}(i)` and `i = ψ_{L/K}(u)`.

The setting is Fontaine's ramification notation of §R07.6.2. Krasner's lemma is Mathlib's
IsKrasner.krasner (complete base).

*Proof sketch.* Prop. 1.4: `v_K(β − gα) = min(i, i_{L/K}(g))` after conjugating `β`, so `v_K(P(β)) = Σ_g min(i, i_{L/K}(g)) = φ_{L/K}(i)` (Fontaine 1985, 1.4). `(i)`: a lift `β` of the image of `α` has `v_K(P(β)) ≥ m > u_{L/K}`, so `i > ψ(u_{L/K}) = i_{L/K}` and some conjugate `g₀α` is closer to `β` than to any other
conjugate; Krasner's lemma gives `g₀α ∈ K(β) ⊆ E` (1.5). `(ii)`: reduce to `L/K` totally ramified with `α` a
uniformiser and `P` Eisenstein; the tame case uses an extension of degree `e_{L/K} − 1`; in the wild
case perturb `P` by a `X^s` to an Eisenstein `R` with a root `β`, and show that a `K`-embedding `L → E` would
force `e_{L/K}·ψ(m) ∈ ℤ`. At the boundary `m=u_{L/K}−1/e_{L/K}`,
put `d=|G_(i_{L/K})|`. Immediately below the last lower break, `φ` has slope `d`, so
`ψ(m)=i_{L/K}−1/(e_{L/K}d)` and
`e_{L/K}ψ(m)=e_{L/K}i_{L/K}−1/d`, a noninteger in the wild case (1.5).
(Fontaine 1985, §1.5, Proposition, p. 519: Proposition 1.5; Fontaine 1985, §1.4, Proposition, p.
518: Proposition 1.4.)

*Needs:* §R07.6.2; Mathlib `IsKrasner.krasner`.

**Checks.**

- For `L=ℚ₃(ζ₉)`, `K=ℚ₃`, the values are `e=6`, `i_{L/K}=1/2`,
  `u_{L/K}=2`, `d=3` and boundary `m=11/6`. Thus `eψ(m)=8/3`; substituting
  the upper break for the lower break would give the incorrect `35/3`.
- `krasnerCriterion_trivial`: `L = K: (P_m)` holds for every `m ≥ 0`, and `u_{L/K} = 0`.
- `krasnerCriterion_tame_boundary`: for `K = ℚ₃` and `L = K(ζ₃), e_{L/K} = 2`
  and `u_{L/K} = 1`, so `(P_{1/2})` fails; for `L = K, (P₀)` holds.
- `krasnerCriterion_tame`: nontrivial tame totally ramified `L/K` of degree `m′ > 1`
  (so `e_{L/K} = m′`): `(P_m)` holds for `m > 1` and fails for `m = 1 − 1/m′` (the tame case of the proof of `(ii)`).

### R07.6.4 Lifting through topologically nilpotent divided powers and the bound on `u_{L/K}`

Prove `lciLiftingAndRamification`. Let `K` have characteristic `0` and absolute ramification `e = v_K(p)`.
`(a)` For a finite extension `L/K, m ≥ e/(p − 1)` suffices for divided powers on
`a^m_{L/K}`, and `m > e/(p − 1)` suffices for topological nilpotence. For a nonzero proper
ideal `a^m_{L/K}`, the exact criteria use its least nonzero valuation `c`: divided powers
iff `c ≥ e/(p − 1)`, and topological nilpotence iff `c > e/(p − 1)`. `(b)` Let `B` be a finite flat, locally
complete intersection
`O_K`-algebra with `a ∈ O_K` killing `Ω¹_{B/O_K}` and `Ω¹_{B/O_K}` flat over `B/a`. For `S` finite flat over `O_K`
and `I ⊆ S` an ideal with topologically nilpotent divided powers, for every `O_K`-homomorphism `u : B → S/aI`
there is a unique `ū : B → S` whose composite with `S → S/I` equals
`B →^{u} S/aI → S/I`. The map `ū` need not reduce to `u` modulo `aI`; in particular `B → S` is determined by its
reduction to `S/I`. `(c) B_K = K ⊗ B` is étale; if `L` is the smallest subfield of `K̄` containing `u(B)` for
all `O_K`-homomorphisms `u : B → O_K̄`, then `L/K` is Galois and `u_{L/K} ≤ v_K(a) + e/(p − 1)`; hence
`v_K(𝒟_{L/K}) < v_K(a) + e/(p − 1)`, and `G_K^(u) ⊆ Gal(K̄/L)` for `u > v_K(a) + e/(p − 1)`.

The setting is Fontaine's ramification notation of §R07.6.2.

*Proof sketch.* `(a)`: for `x` of valuation at least `c, v_K(x^n/n!) ≥ nc − e v_p(n!)`.
The bound `v_p(n!) ≤ (n − 1)/(p − 1)` gives the criteria in terms of `c`; taking
`n = p^r` gives necessity and detects the equality boundary (Fontaine 1985, 1.6). `(b)`: reduce to `B` local
with residue field `k`; lifts `x_j` of a basis of `m_B/(m_B² + m_K B)` make the `dx_j a (B/a)`-basis of `Ω¹`;
`B = O_K⟦X₁, …, X_h⟧/(P₁, …, P_h)`, and the Jacobian in `B` satisfies
`J = (∂P_i/∂X_j) = aU` with `U` invertible; a
Newton iteration through the divided-power filtration `I^{[n]}` constructs `ū` with the
prescribed reduction modulo `I`, uniquely (1.7(i)`(a)`, pp. 520–521). `(c): B_K` is étale since `Ω¹_{B_K/K} = 0`; `L` is the compositum of the Galois closures of the
factors of `B_K`; for `m > v_K(a) + e/(p − 1), a^m_{E/K} ⊆ aI` with `I` topologically nilpotent PD, so `(b)`
lifts the reduction modulo `I` of each approximate point to an `E`-point; injectivity of
reduction modulo `I` on exact `O_K̄`-valued points makes `J(L) → J(E)` injective, which forces a `K`-embedding `L → E: L/K` satisfies `(P_m)` (1.7(ii)).
If `L/K` is unramified, `u_{L/K} = 0`. Otherwise `a` is a nonunit (a unit would make `B` étale over
`O_K`), so `v_K(a) ≥ 1`. By Proposition 1.5(ii),
`u_{L/K} ≤ v_K(a) + e/(p − 1) + 1/n` with `n = e_{L/K}`; if `p ∤ n, L/K` is ramified tame and
`u_{L/K} = 1 ≤ v_K(a)`; if `p | n, n(p − 1)u_{L/K}` and `n(p − 1)v_K(a) + ne` are integers divisible by `p`
within `p − 1` of each other, so `u_{L/K} ≤ v_K(a) + e/(p − 1)`. Corollary 1.8 follows from Proposition
1.3 since `i_{L/K} > 0` when `L/K` is ramified. (Fontaine 1985, §1.7, Proposition, pp. 520–521:
Proposition 1.7; Fontaine 1985, §1.8, Corollaire, p. 524: Corollary 1.8.)

*Needs:* §R07.6.3; §R07.6.2; Mathlib `DividedPowers`; Mathlib `KaehlerDifferential`.

**Checks.**

- `lciLifting_unit`: `a` a unit: `Ω¹_{B/O_K} = 0, B` is étale, `L/K` is unramified and `u_{L/K} = 0`;
  in particular `B = O_K, a = 1` gives `L = K` and `u_{L/K} = 0`.
- `lciLifting_muP`: `B = O_K[X]/(X^p − 1)` (the group `μ_p`) with `a = p: L = K(ζ_p)`, and `u_{L/K} ≤ e + e/(p − 1)`; for `K = ℚ_p` and `p` odd, `u = 1 ≤ 1 + 1/(p − 1)`;
  for `p = 2, L = K` and `u = 0`.
  Its Jacobian is `J = pX^{p−1}`, so `U = X^{p−1}` is a unit, whereas `J` is not.
- `lciLifting_reduction_boundary`: `p = 3, B = ℤ₃[X]/(X³−1), a = 3, S = ℤ₃` and
  `I = 3ℤ₃`. The map `X ↦ 4 mod 9` is an approximate point; its reduction modulo `I`
  lifts uniquely to `X ↦ 1` in `ℤ₃`, which is not `X ↦ 4` modulo `aI = 9ℤ₃`.
- For `K = L = ℚ₃` and `m = 1/4, a^m = 3ℤ₃` has least valuation `c = 1 > 1/2`.
  Its divided powers `x^n/n!` are topologically nilpotent even though `m < 1/2`.
  In `ℚ₃(√3)`, the ideal generated by `√3` has `c = 1/2`: divided powers exist but
  are not topologically nilpotent.

### R07.6.5 Fontaine's ramification bound for finite flat group schemes

Prove `fontaineRamificationBound`. Let `K` have characteristic `0` and absolute ramification `e, n ≥ 1`,
and `J` a finite flat commutative group scheme over `O_K` killed by `pⁿ`. Let `H` be the kernel of the
action of `G_K` on `J(K̄)` and `L = K̄^H`. Then `G_K^(u) ⊆ H` for every `u > e(n + 1/(p − 1))`, and
`v_K(𝒟_{L/K}) < e(n + 1/(p − 1))`. Equivalently: in Serre's upper numbering `G_K^v` acts trivially on
`J(K̄)` for `v > e(n + 1/(p − 1)) − 1`; with the valuation `v₀` normalised by `v₀(p) = 1, v₀(𝒟_{L/K}) < n + 1/(p − 1)`. For `K = ℚ_p` and `n = 1`, the normalised different of `L` at a prime above `p` satisfies `δ(L_λ) = v_p(𝒟_{L_λ/ℚ_p}) < 1 + 1/(p − 1)`.

The setting is Fontaine's ramification notation of §R07.6.2. Fontaine's proof cites Grothendieck's
embedding of a finite flat group scheme in a Barsotti–Tate group, which is §R07.1.40 `(J ⊂ A[p^n] ⊂ A[p^∞])`, and the identification `Ω¹_{B/O_K} ≅ B ⊗ ω_J` (Fontaine, *Groupes p-divisibles sur les corps
locaux*, Astérisque `47`–`48, n`° 4.3), which is part of this target. For `e = n = 1`, the case
SmallRamificationAndAbelianVarietyBaseCases uses, the embedding is not needed (Fontaine 1985,
2.2(a)).

*Proof sketch.* Reduce to `k` algebraically closed (Fontaine 1985, 2.1). `(a) ω_J` free over `O_K/pⁿ: J_k`
is the product of an étale group and a connected group with affine algebra `k[X₁, …, X_h]/(X₁^{p^{r₁}}, …, X_h^{p^{r_h}})` (Dieudonné), so `B` is a local complete intersection, and
`Ω¹_{B/O_K} ≅ B ⊗ ω_J` is a free `B/pⁿ`-module; apply §R07.6.4 with `a = pⁿ, v_K(a) = ne`. `(b)` General `J`:
embed `J` in a Barsotti–Tate group `Γ`; then `J(K̄) ⊆ Γ_{pⁿ}(K̄)`, and from `0 → Γ_{pⁿ} → Γ → Γ → 0` one
gets `0 → ω_Γ → ω_Γ → ω_{Γ_{pⁿ}} → 0` with `ω_Γ` free over `O_K`, so `ω_{Γ_{pⁿ}}` is free over `O_K/pⁿ` and
`(a)` applies to `Γ_{pⁿ}`. `e = n = 1: O_K/p = k` is a field, so `ω_J` is free and `(a)` applies directly
(Remark 2.2(a)). Translation: `G^(u) = G^{u−1}` (§R07.6.2) and `v₀ = v_K/e`. (Fontaine 1985,
Introduction, Théorème A, p. 515: Théorème A; Fontaine 1985, §2.1, Théorème 1, p. 525: Théorème 1;
Fontaine 1985, §2.2, Remarque a), p. 526: the case `e = n = 1`.)

*Needs:* §R07.6.4; PadicPeriodRings §2 (perfect-residue Herbrand theory, different and
completed maximal unramified comparison); §R07.6.2; §R07.6.1; §R07.1.6; §R07.1.40; §R07.1.17.

**Checks.**

- `fontaineBound_mu`: `J = μ_{pⁿ}` over `ℤ_p: L = ℚ_p(ζ_{pⁿ})` has `u_{L/ℚ_p} = n ≤ n + 1/(p − 1)`, except
  `(p,n) = (2,1)`, where `L = ℚ₂` and `u = 0`; and
  `v_p(𝒟) = n − 1/(p − 1) < n + 1/(p − 1)`: the bound is sharp up to `1/(p − 1)`.
- `fontaineBound_etale`: `J = ℤ/pⁿ` (étale): `L = K` and the bound is trivially met; for the `p`-torsion
  of an elliptic curve with good reduction over `ℤ_p, L_λ` has `δ < 1 + 1/(p − 1)`.
- For `J = μ₂` over `ℤ₂`, the splitting field is `ℚ₂` itself, with upper break `0`
  and unit different; the dyadic `n = 1` exception agrees with the bound.

### R07.6.6 Illusie's obstruction theory for lifting homomorphisms of flat commutative group schemes

Prove `illusieObstructionHomomorphisms`. Let `A` be a commutative ring, `G` and `H` flat, finitely
presented commutative group schemes over `A` and `u : H → G` a homomorphism. Let `B₁, B₂ → A` be
square-zero thickenings with augmentation ideals `J₁, J₂` and a morphism `B₁ → B₂` over `A`, let `G̃₁` be a
flat lift of `G` to `B₁` and `G̃₂` the induced lift to `B₂`, and let `K` be a cone of the map of Lie
complexes `ℓ̌_H → ℓ̌_G`. `(i)` For `i = 1, 2` there is an obstruction class `o_i ∈ Ext¹(H, K ⊗^𝕃 J_i)` that
vanishes exactly when there is a flat commutative lift `H̃_i` of `H` to `B_i` with a homomorphism `ũ_i : H̃_i → G̃_i` lifting `u`. `(ii) o₂` is the image of `o₁` under the map induced by `J₁ → J₂`. Special case:
with `G = 0, K = ℓ̌_H[1]` and the class lies in `Ext²(H, ℓ̌_H ⊗^𝕃 J_i)`, the obstruction to deforming `H`
itself. (For `u = id` the cone is zero and the statement is empty: `G̃` itself is a lift.)

`A` any commutative ring; `Ext` is computed in the derived category of fppf abelian sheaves on `Spec A`;
construct `ℓ_G = Le_G* L_(G/A)` from DerivedModuleAlgebra §0.4 along the unit section `e_G`,
and its derived dual `ℓ̌_G = RHom_A(ℓ_G, A)`, the Lie complex, as in §R07.1.11.
These common group-specific constructions belong here for all the flat, finitely presented
commutative groups in this statement; finite-flat perfectness, determinants and the
abelian-isogeny Hodge triangle belong to HodgeTateAndCanonicalSubgroups.

*Proof sketch.* `(i)` is Illusie, Complexe cotangent et déformations II, Théorème VII.4.2.5(i), with `A = ℤ` and base ring `ℤ` there, up to the shift convention in `K` (Scholze, Theorem 3.2.1, proof). `(ii)` is
Illusie's Remarque VII.4.2.6(i). The construction uses the cotangent complex of group schemes and
the transitivity triangle for `H → G` (DerivedModuleAlgebra §0.8). (Scholze 2015, §III.2.1, Theorem
III.2.1 and its proof, p. 31 (arXiv:1306.2070v2; published §3.2.1, Theorem 3.2.1, pp. 975–976): the
obstruction class `o_i ∈ Ext¹(H, K ⊗ J_i)`, its vanishing criterion and functoriality in the
thickening, citing Illusie VII.4.2.5–4.2.6; Scholze 2015, Corollary III.2.2 and Remark III.2.3, p.
32 (arXiv `v2`): the canonical-subgroup lifting with explicit constants, and the alternative through
the deformation theory of rings.)

*Needs:* DerivedModuleAlgebra §0.4 (the full cotangent complex); DerivedModuleAlgebra §0.8
(the transitivity triangle); TauCetiRoadmap.ModularCurves Layer 0B.

**Checks.**

- `illusieObstruction_canonical_subgroup`: as used in Scholze, Corollary 3.2.2: for `G` finite locally
  free over a `p`-adically complete flat `ℤ_p^cycl`-algebra `R` and `C₁ ⊂ G ⊗ R/p`, if `p^ε` is homotopic to
  zero on `ℓ̌_{(G⊗R/p)/C₁}` with `ε < 1/2`, then `C₁` lifts to `C ⊂ G` with `C ⊗ R/p^{1−ε} = C₁ ⊗ R/p^{1−ε}`
  (the canonical subgroup).
- `illusieObstruction_needs_flat`: for non-flat `H` (e.g. a closed subscheme that is not a subgroup
  scheme flat over `A`) the obstruction group is not defined in this form.
- For `u = id_H`, the cone of `ℓ̌_H → ℓ̌_H` is zero and the obstruction vanishes;
  the given lift of the target also lifts the source and the homomorphism.
- For `G = 0`, the cone is `ℓ̌_H[1]`, so the obstruction lies in
  `Ext²(H, ℓ̌_H ⊗^𝕃 J_i)`, retaining the Lie complex rather than the coLie complex.

### R07.6.7 Finite-flat model closure and Fontaine–Laffaille extension spaces

Prove `flatDeformationTangentSpace`. Let `K/ℚ_p` be finite with ring of integers
`O_K`, put `G = G_K` and `q = p^r`. `(i)` Finite `W(F_q)[G]`-modules whose
underlying Galois modules have finite flat models over `O_K` are closed under
finite sums, submodules and quotients, without a ramification bound. This
includes marked isomorphism invariance, finite coefficient change and injective
descent: a coefficient fibre product embeds in the product of its two factors.
The condition on a complete local coefficient module is imposed on every
Artinian quotient, as specified below.

`(ii)` Over `K = ℚ_p`, `p > 2`, let `V` be a finite-flat `F_q`-representation.
An `F_q`-linear Galois self-extension killed by `p` is finite flat precisely
when it comes from a self-extension of its Fontaine–Laffaille module `M` in
`MF_tor^{[0,1]}` with commuting `F_q`-action. This category means the scalar
category of §R07.3.4 equipped with a ring map `F_q → End(M)` preserving the
filtration and divided Frobenii; extensions and splittings respect this action.
It does not require the labelled coefficient deformation category. Since
`e = 1 < p−1`, §§R07.3.11 and R07.3.18 transport these actions through their
contravariant fully faithful functors. The variance reverses a self-extension
and leaves its self-Ext space unchanged. Define `H¹_f(ad V)` as the subspace
of continuous `H¹(G,End_(F_q) V)` represented by these finite-flat
self-extensions. Equivalently, a cocycle gives an `F_q[ε]/(ε²)`-action on the
extension, with `ε` the composite of its quotient and inclusion; changing a
splitting changes the cocycle by a coboundary.

Identify `H¹_f(ad V)` with this coefficient-linear `Ext¹(M,M)` and compute it
as `Hom_(F_q)(M,M)` modulo the change-of-splitting image
`{[R,X_M] : R preserves the filtration}`, where `X_M` is the matrix of the
divided Frobenii. For rank two, filtration type `(0,1)` and
`End_G(V) = F_q`, its dimension is `4−(3−1) = 2`. The general formula,
without the scalar-endomorphism hypothesis, is stated below.

LocalGaloisDeformationRings owns the generic lifts and strict equivalence
(F.1.1–F.1.4), universal rings (F.2.5), the condition/quotient correspondence
(F.3.1–F.3.2), and the common coefficient Fontaine–Laffaille category (§1.6).
Its §4.1 applies the present closure and Ext calculations to the finite-flat
condition, Schlessinger's criteria and representing quotients. Thus the order
is scalar R07.3 and this model/Ext interface, then those generic and coefficient
interfaces, then its §4.1. Over `ℚ_p`, the representing-ring consequences there
include Ramakrishna's `W(F_q)⟦T₁,T₂⟧` for rank-two finite-flat `V` with
`det V|_I = χ̄` and `End_G(V) = F_q`, when `q = p` or `V` is irreducible; in the irreducible case
`R(V) = W(F_q)⟦T₁,…,T₅⟧` with a three-generated kernel onto the flat ring.
These ring assertions use that roadmap's representability and lifting theory.

*Proof sketch.* Schematic closure gives subobjects and quotients; finite
products give sums and coefficient fibre-product closure. Full faithfulness
and the finite-flat dictionary identify the self-extension classes.
Filtration-preserving changes of splitting act by the displayed commutator;
the kernel is `End_G(V)`. Sources: Ramakrishna 1993, §1, Proposition 1.1,
pp.270–271; §2, Lemma 2.1, p.272; §3, Lemmas 3.1–3.2, pp.274–275;
§4, Lemmas 4.3–4.4, p.280. The representing-ring applications are
Theorem 1.1 and Proposition 1.2, pp.271–272, Theorem 3.1, pp.275–278,
and Theorems 4.1–4.2 and Corollary 4.1, pp.279–281.

The closure interface uses `HasFiniteFlatModel` from §R07.1.24a. State the
following named targets for finite discrete `p`-primary `G_K`-modules, using
equivariant additive maps throughout:

- `HasFiniteFlatModel.of_addEquiv`: transport a model along an equivariant
  additive equivalence.
- `HasFiniteFlatModel.prod`: products of models give models of finite products.
- `HasFiniteFlatModel.of_injective`: an injection into a module with a model
  gives a model by schematic closure of the generic subgroup.
- `HasFiniteFlatModel.of_surjective`: a surjective image of a module with a
  model has the quotient by the closure of the generic kernel as a model.
- `HasFiniteFlatModel.of_jointlyInjective`: if a finite family of equivariant
  maps from `M` into modules with models has zero common kernel, then `M` has
  a model; embed it into the product. This includes coefficient fibre products.
- `HasFiniteFlatModel.of_forall_quotient_pow`: for a complete noetherian local
  `ℤ_p`-algebra `A` with finite residue field of characteristic `p` and a finite free continuous
  `A[G_K]`-module `T`, requiring models for `T/m_A^n T` for every `n≥1`
  is equivalent to requiring models for `T/IT` for every open ideal `I`.
  Each open `I` contains a power of `m_A`, so use the quotient target. This is
  an adic condition on finite quotients; it does not give a finite group scheme
  whose points are the infinite module `T`.

These targets have no ramification bound. When coefficient actions are part of
the models, maps and kernels retain those actions. Sources: Ramakrishna 1993,
§1, Proposition 1.1 and Theorem 1.1, pp.270–272; §2, Lemma 2.1, p.272;
§R07.1.20 and ModularCurves Layer 0C for closure and finite flat quotients.

Prove `flatTangent_finrank_le` without a scalar-endomorphism hypothesis. Over
`ℚ_p`, `p>2`, let `V` be a finite-flat `k`-representation, `k` a finite field
of characteristic `p`, and let `M` be its coefficient Fontaine–Laffaille module
with weights in `{0,1}`, meaning a scalar object with commuting `k`-action
as above. Define `H¹_f(ad V)` by the finite-flat self-extensions above,
equivalently by their coefficient dual-number lifts. Identify it with the
killed-by-`p`, coefficient-linear `Ext¹(M,M)`.
Writing `n=dim_k M` and `d=dim_k Fil¹ M`, the matrix-extension calculation gives
`dim_k H¹_f(ad V)=h⁰(ad V)+d(n−d)`: filtration-preserving endomorphisms have
dimension `n²−d(n−d)` and the kernel of the change-of-splitting map is
`End(M)=End_{G_{ℚ_p}}(V)`. Thus in rank two,
`dim_k H¹_f(ad V)≤h⁰(ad V)+1`, with equality for filtration type `(0,1)`.
This extension-space bound has no representability hypothesis. Sources:
Ramakrishna 1993, Lemmas 3.1–3.2 and 4.3–4.4,
pp.274–275, 280, applied without replacing the endomorphism kernel by scalars;
§§R07.3.11 and R07.3.18.

*Needs:* §R07.1.20; §R07.1.24; §R07.1.24a; §R07.3.11; §R07.3.4; §R07.3.18; §R07.5.7.

**Checks.**

- `flatDeformation_supersingular`: `ρ̄ = E[p]|_{G_{ℚ_p}}` for `E/ℤ_p` supersingular, `p > 2`: absolutely
  irreducible (inertia acts through the two level-`2` fundamental characters), finite flat with `det = χ̄` and `End = F_p`, so `dim_(F_p) H¹_f(ad ρ̄) = 2`. The corresponding ring presentations use
  LocalGaloisDeformationRings §4.1.
- `flatDeformation_range`: for `p = 2` or for `e ≥ p − 1` the Fontaine–Laffaille computation is
  unavailable (part `(ii)` is not claimed), although part `(i)` still holds.
- The zero module and the identity equivalence satisfy the closure targets.
  The diagonal `M→M×M` tests injections; projection `M×N→M` tests quotients.
- For `A=k[ε]/(ε²)` the maximal-ideal quotients stop at `n=2`: the residual
  model alone is insufficient. The target includes the actual dual-number lift.
- For `V=k(1)⊕k`, `h⁰=2` and the flat tangent space has dimension `3`;
  scalar endomorphisms cannot be assumed. For a Schur module of type `(0,1)`
  the dimension is `2`, recovering part `(ii)`.
- For trivial `V=k²`, `d=0` and both `h⁰` and the flat tangent dimension are
  `4`. For `V=k(1)²⊕k²`, `d=2`, so the excess over `h⁰` is `4`;
  the bound with excess `1` is specific to rank two.

### R07.6.8 Finite flatness under unramified base change, finite extension and twisting

Prove `finiteFlatBaseChangeTwist`. Let `K/ℚ_p` be finite with ring of integers `O_K` and `V` a finite
discrete `ℤ_p[G_K]`-module (a finite étale `K`-group scheme). `(i)` If `K′/K` is unramified (possibly
infinite, e.g. `K′` the completion of `K^nr`), `V` is finite flat over `O_K` if and only if `V|_{G_{K′}}` is
finite flat over `O_{K′}`; existence of a model can therefore be tested after
restriction to inertia and completion of the maximal unramified extension.
`(ii)` If `V` is finite flat over `O_K`, then `V|_{G_{L}}` is finite flat over `O_L` for every
finite `L/K`. (iii) Twisting by an unramified character preserves finite flatness; twisting by a
ramified character need not. `(iv)` When `e(K/ℚ_p) < p − 1` the model is unique (§R07.1.30), so the
generic descent datum extends uniquely to that model. When `e ≥ p − 1`,
individual models can differ (already at `e=p−1`), while a canonical maximal
model supplies descent of existence in `(i)`.

Here "finite flat" means `HasFiniteFlatModel O_K K̄ V` (§R07.1.24a).
In `(i)` the unramified extension is algebraic, or the completion of an algebraic
unramified extension, with the natural map on absolute Galois groups.

*Proof sketch.* `(ii)` Base change of a finite flat `O_K`-model along `O_K → O_L` is a finite flat model
of `V|_{G_L}`. `(i)` ⇐: for `K′/K` finite unramified Galois, use the
maximal model of §R07.1.24. Its conjugates are maximal models of the same generic
group, so the unique generic-identity isomorphisms supply an effective cocycle;
fpqc descent is ModularCurves Layer 0E. Pass to a Galois closure for a general
finite unramified extension. For an algebraic unramified extension, finite
presentation descends the model and its generic identification to a finite stage.
For its completion, first apply §R07.1.38 over the uncompleted unramified DVR
to glue the completed model to the given generic group, then descend to a finite
stage. `(iii)` An unramified character is the generic fibre of an
étale group scheme (§R07.1.2), and tensoring with it is a descent twist of the model; a ramified
character of order prime to `p` twists `ℤ/p` into a non-finite-flat module when its inertial exponent is
not in `[0, e]` (§R07.1.32). `(iv)` By §R07.1.30 and §R07.1.31. (Raynaud 1974, §2.2, Proposition 2.2.2
and Corollaire 2.2.3, pp. 260–261: the partial order on prolongations, maximal and minimal models,
used for Galois descent of a canonical model; Raynaud 1974, §3.3, Théorème 3.3.3 and Corollaire
3.3.6, p. 268; §3.4, Théorème 3.4.3, p. 270: uniqueness for `e < p − 1` and the inertial exponents of
finite flat `F`-vector schemes.)

State `HasFiniteFlatModel.of_isUnramified`: a finite `p`-primary module with
trivial inertia has the finite étale model of the residue-field Galois module.
State `HasFiniteFlatModel.twist_unramified` for a finite coefficient module
with a model and a continuous unramified scalar character valued in its
coefficient units: split the character over a finite unramified extension and
descend a model with the twisted descent datum. State
`HasFiniteFlatModel.coeff_baseChange` and `HasFiniteFlatModel.coeff_descent`
for finite fields `k⊂k′` of characteristic `p>2` over `ℤ_p`, using
coefficient models: `V` has a model iff `k′⊗_k V` does. The extension is a
finite direct-sum construction; descent uses restriction of scalars and a
coefficient-linear projection onto `V`, extended and split on models by
Raynaud full faithfulness. These are §R07.5.6a's coefficient invariance in
named form. Sources: Stix 2012, Theorem 33, p.35; Raynaud 1974,
Corollaires 2.2.3 and 3.3.6, pp.261, 268; Serre 1987, §2.8, pp.189–190.

*Needs:* §R07.1.24; §R07.1.24a; §R07.1.30; §R07.1.31; §R07.1.32;
§R07.1.38; §R07.1.2; §R07.5.6a; TauCetiRoadmap.ModularCurves Layer 0E.

**Checks.**

- `finiteFlatTwist_unramified`: `V = μ_p ⊗ λ` for `λ` unramified of order dividing `p − 1`: finite flat
  (an étale twist of `μ_p`).
- `finiteFlatTwist_ramified`: over `ℚ_p (e = 1 < p − 1)` the character `ω²` (second power of the mod-`p`
  cyclotomic character) on `F_p` is not finite flat when `p > 3`, since Raynaud's exponents for `e = 1`
  are `0` or `1` (§R07.1.32), although `ω²` is a twist of the finite flat `ω`.
- A trivial-inertia module with nontrivial Frobenius has a finite étale model;
  the unramified-model target does not require a trivial whole Galois action.
- Extending a nonzero uniformizer-Kummer class from `𝔽_p` to `𝔽_{p²}`
  does not make it finite flat; unit classes are finite flat over both fields.
- Over `ℤ₂` the two models of the constant order-two generic group remain
  distinct after unramified base change. Descent of existence uses a canonical
  model, and does not assert uniqueness of every model.

### R07.6.9 Raynaud: the determinant of the Tate module of a `p`-divisible group is `χ^d`

**Marked full-BT deformations and effectivity (`BarsottiTate.markedUniversalDeformation`).**
Let `R` be a complete Noetherian local ring with residue field `k` of characteristic
`p`, and `X₀/k` a `p`-divisible group of height `h` and dimension `d`.
The functor on Artinian local `R`-algebras with identified residue field `k`
assigns isomorphism classes of pairs `(Y, α : Y_k ≅ X₀)`, with isomorphisms
respecting `α`. Prove that it is prorepresented by
`𝒪 ≅ R⟦T₁,…,T_(d(h−d))⟧`. Its tangent space is
`Hom_k(ω_(X₀), Lie(X₀^D))`; lifting across small extensions is unobstructed,
and an automorphism reducing to the marked identity is the identity.
The full-tower rigidity and deformation calculation give Schlessinger's
conditions, finite tangent dimension and smoothness; apply
SchemeAndStackFoundations §4.4's `schlessinger_prorepresentable` and
`smooth_iff_powerSeries`. Smoothness of a single truncated-BT stack does not
replace these full-tower assertions.

For every level `n`, the universal formal group gives compatible finite free
Hopf algebras over `𝒪/m_𝒪^a` of rank `p^(nh)`. Apply
SchemeAndStackFoundations §4.8's `coherentFormalModuleEquivSpec_effective`
for the ideal `m_𝒪`, and its full faithfulness to the Hopf maps, including
maps into tensor products. Completeness and the fixed free ranks give finite
free Hopf algebras over `𝒪`. Their algebra and group identities, level
inclusions, torsion kernels and exact level sequences are detected on all
reductions, using complete-local flatness and Nakayama. Section R07.1.6's
`BarsottiTate.ofHopfTower` assembles an effective family over `Spec 𝒪`.
For every marked `X/R`, construct the continuous local `R`-algebra map
`s_X : 𝒪 → R`; its pullback family is isomorphic to `X`, with the given
marking, compatibly at every level. This gives the marked section used below.
Source: Illusie 1985, Theorem 4.4 and Corollary 4.7, pp.171–179
(full-BT lifting and rigidity); Corollary 4.8, pp.179–180, for perfect `k`.
For arbitrary `k`, use the same full-BT small-extension calculation and
Schlessinger, over the given coefficient ring `R`; no Witt lift of `k` is
assumed. The effectivity is Stacks Tag 087W applied to the finite-level Hopf
algebras. Raynaud 1974, proof of Theorem 4.2.1, p.273, uses this effective family.

*Needs:* §§R07.1.6, R07.1.11 and R07.6.6;
AbelianSchemesAndArithmeticModuli §A4.CR.7.2 (Grothendieck–Messing);
SchemeAndStackFoundations §§4.4 and 4.8.

**Checks.**

- For an étale group (`d = 0`) or a multiplicative group (`d = h`),
  the deformation ring is `R` and the marked lift is unique.
- For `X₀ = μ_(p^∞) × ℚ_p/ℤ_p`, there is one parameter; the split lift
  corresponds to the section with multiplicative Serre–Tate coordinate `1`.
  For `X₀ = μ_(p^∞)^d × (ℚ_p/ℤ_p)^(h−d)`, there are `d(h−d)` parameters.
- For a fixed `X/R`, pulling back the effective family's `p^n`-torsion along
  `s_X` gives `X[p^n]` with its inclusion into level `n+1` and its marking.
  A formal family on `Spf 𝒪` alone does not give the generic points of
  `Spec 𝒪` used in the purity argument.

Prove `raynaudDetTateModule`. Let `R` be a strictly henselian DVR of mixed characteristic `(0, p)` with
fraction field `K` and `X` a `p`-divisible group over `R` of height `h` and dimension `d`. Then `Gal(K̄/K)` acts
on `det T_p(X) = Λ^h T_p(X)` through `χ^d`, where `χ` is the `p`-adic cyclotomic character (the character of
`T_p(μ_{p^∞})`). For a general complete DVR `R` with perfect residue field, `det V_p(X) = χ^d ·`
(unramified character).

Raynaud's §4 standing hypothesis: `R` strictly henselian of unequal characteristic (no restriction on
`e`); Tate's Hodge–Tate decomposition gives the statement only on an open subgroup (Raynaud, Remarque
4.2.2).

*Proof sketch.* Reduce to `R` complete and, by dévissage along the connected–étale sequence, to `X` with
connected special fibre (§R07.1.9). Apply `BarsottiTate.markedUniversalDeformation`
to `X₀`, with the marking induced by `X/R`: let `S = Spec 𝒪`,
`𝒪 ≅ R⟦T₁,…,T_(d(h−d))⟧`, and `𝒳/S` the effective universal family.
Lemma 4.2.3: a connected `X₀` over `k` deforms over `k⟦T⟧` to a `p`-divisible group that
is ordinary at the generic point (Cartier's typical curves); so `𝒳` is ordinary at the generic point `x`
of the special fibre of `S`, of dimension `d`. At the strict henselisation at `x, 𝒳` is an extension of
`(ℚ_p/ℤ_p)^{h−d}` by `μ_{p^∞}^d`, so `Λ^h T(𝒳) ⊗ T(μ_{p^∞})^{⊗(−d)}` is unramified at `x`; it is unramified
in characteristic `0` points, hence at all codimension-one points, hence everywhere by the purity
contract of PurityOfBranchLocus §2.1 (SGA 1 `X` 3.1; Stacks Tag 0BMB) and §2.2
(the global corollary).
After completion, `R` is an excellent regular DVR and `𝒪 = R⟦T₁,…,T_m⟧` is excellent,
regular and strictly henselian. For each finite quotient of the determinant character,
use the normalization of `Spec 𝒪` in its generically étale cover: excellence makes it
finite and the source is normal. Purity then applies to the codimension-one
unramifiedness, and strict henselianity makes the resulting finite étale cover trivial.
Pull back along the marked section `Spec R → Spec 𝒪` defined by `s_X`
to recover `X` and its determinant (Raynaud, Théorème 4.2.1, proof).
(Raynaud 1974, §4.2, Théorème 4.2.1, Remarque 4.2.2, Lemme 4.2.3 and the proofs, pp. 272–274: `det T(X) = χ^d` by deformation to the ordinary case and purity.)

*Needs:* PurityOfBranchLocus §2.1 (purity of the branch locus, SGA 1 `X` 3.1,
Stacks Tag 0BMB) and §2.2 (the global corollary for finite normal covers with dominant components
over excellent regular local bases); §R07.1.8; §R07.1.14; §R07.1.9; §R07.1.19;
`BarsottiTate.markedUniversalDeformation` and its effectivity and marked-section assertions above.

**Checks.**

- `raynaudDet_examples`: `X = μ_{p^∞}: h = d = 1` and `det = χ`; `X = ℚ_p/ℤ_p: d = 0` and `det` is trivial;
  for an elliptic curve with good reduction, `det T_p(E) = χ` (Weil pairing), with `d = 1`.
- `raynaudDet_strictly_henselian`: the statement is about `det` of the integral Tate module over a
  strictly henselian base; over a non-strictly-henselian `R` the determinant can differ from `χ^d` by an
  unramified character (e.g. an unramified twist of `μ_{p^∞}`).
- For a regular local `A` of dimension `2` with maximal ideal `m`, the finite subalgebra
  `B = {(a,b) ∈ A × A : a − b ∈ m}` agrees with `A ×` A in codimension one and
  generically, but is not étale at `m`. It is not normal. Applying purity to its
  normalization, rather than to an arbitrary finite cover, is essential.

### R07.6.10 Good reduction and the mod-`p` image over the cyclotomic tower

Prove `cyclotomicImageStability`. Let `A/ℚ` be an abelian surface (more generally an abelian variety)
with good reduction at a prime `p ≥ 3`, and `ρ = ρ_{A,p}` its mod-`p` representation. Then `ρ(G_{ℚ(ζ_p)}) = ρ(G_{ℚ(ζ_{p^n})})` for every `n ≥ 1`. The local input is that the field `K` cut out by `ρ|_{G_{ℚ_p}}`
cannot contain `ℚ_p(ζ_{p²})`.

Good reduction at `p` makes `A[p]` the generic fibre of a finite flat `ℤ_p`-group scheme (§R07.6.1), so
Fontaine's bound applies with `e = n = 1`.

*Proof sketch.* `Gal(ℚ_p(ζ_{p^n})/ℚ_p(ζ_p))` is cyclic of `p`-power order, so it suffices to rule out
`ℚ_p(ζ_{p²}) ⊆ K`. If `ℚ_p(ζ_{p²}) ⊆ K`, the normalised different satisfies `v_p(𝒟_K) ≥ v_p(𝒟_{ℚ_p(ζ_{p²})}) = 1 + 1/(p − 1) + (p − 3)/(p − 1)`. Fontaine's bound (§R07.6.5 with `e = n = 1`)
gives `v_p(𝒟_K) < 1 + 1/(p − 1)`, a contradiction for `p ≥ 3`. (BCGP 2025, §6.4, Lemma 6.4.2 and its
proof, p. 149 (arXiv:2502.20645v1): the image of `ρ_{A,p}` on `G_{ℚ(ζ_p)}` and on `G_{ℚ(ζ_{p^n})}` agree
for good reduction at `p > 2`, by Fontaine's bound against the root discriminant of `ℚ(ζ_{p²})`.)

*Needs:* §R07.6.5; §R07.6.1; §R07.6.2.

**Checks.**

- `cyclotomicImage_p3`: `p = 3: v_3(𝒟_{ℚ_3(ζ_9)}) = 1 + 1/2 + 0 = 3/2`, which already violates
  Fontaine's bound `v_3 < 3/2`.
- `cyclotomicImage_mod_p`: the statement is about the mod-`p` image only; for a positive-dimensional
  abelian variety, the field of `A[p²]` contains `ℚ_p(ζ_{p²})` (the Weil pairing puts `μ_{p²}` in it), so the analogue for `ρ_{A,p²}` is false.
- `cyclotomicImage_dimension_zero`: for `A = Spec ℚ`, every torsion representation is trivial,
  its local splitting field is `ℚ_p`, and both cyclotomic restrictions have trivial image.

### Examples

- For `E/ℚ` with good reduction at `p`, `E[p]` is the generic fibre of the finite flat group `ℰ[p]`
  over `ℤ_p`, so `E[p]` is finite at `p` and, by Fontaine's bound, `G_{ℚ_p}^{(u)}` acts trivially on
  it for `u > 1 + 1/(p − 1)`.
- `det V_p(μ_{p^∞}) = χ` (`d = 1`) and `det V_p(E) = χ` for an elliptic curve with good reduction
  (`d = 1`, height `2`).

### Dependencies

Layers R07.1–R07.4; AbelianSchemesAndArithmeticModuli Layer A3; DerivedModuleAlgebra §§0.4, 0.8;
PadicPeriodRings §2 (mixed-characteristic perfect-residue ramification);
PurityOfBranchLocus §§2.1–2.2 (purity for finite normal covers of regular bases);
TauCetiRoadmap.LocalFieldsRamification Layer 3; Mathlib `differentIdeal`, `IsKrasner.krasner`,
`DividedPowers`, `KaehlerDifferential`, `WeierstrassCurve.HasGoodReduction`.

## Downstream consumers

- **FaltingsFinitenessAndIsogenyTheorems** uses `ℓ`-divisible groups over the valuation ring of a
  finite extension of `ℚ_ℓ`, their Tate modules, formal groups, dimension, invariant differentials
  and Raynaud's absolute different (§R07.1.8, §R07.1.12, §R07.1.14, §R07.1.17), Tate's generic-fibre
  theorem and Raynaud's determinant theorems (§R07.1.33, §R07.6.9).
- **SmallRamificationAndAbelianVarietyBaseCases** uses simple finite flat groups, Oort–Tate over
  rings of integers, étale groups over `ℤ[1/N]`, gluing and the Mayer–Vietoris sequence (R07.1) for
  its classifications over `ℤ` and `ℤ[1/ℓ]`. Its §3.3 specializes R07.G5's
  `admissible-global-ext-vanishing` and `admissibleConnectedEtaleFiltration`
  after its own simple two-group classification establishes admissibility.
- **HodgeTateAndCanonicalSubgroups**, **IgusaVarietiesAndTorsionConcentration**,
  **ShimuraCompactifications**,
  **HilbertModularVarietiesAndShimuraCurves** and **AlgebraicModularFormsAndSerreWeights** use the
  Hasse invariant of a `BT₁` (§R07.2.21), Illusie's obstruction class (§R07.6.6), universal covers
  (§R07.2.25), slopes and the covariant module (§R07.2.16, §R07.2.20).
- **LocalGaloisDeformationRings** uses Fontaine–Laffaille modules
  (R07.3), Kisin modules with coefficients, finite-height lattices and Kisin's full faithfulness
  (R07.4), and the finite-flat model closure and self-extension space (§R07.6.7).
  Its Layer 4 uses `GaloisModel`, `HasFiniteFlatModel` (§R07.1.24a), the named
  closure targets and the endomorphism-sensitive bound `flatTangent_finrank_le`.
  Its F.1.1–F.1.4, F.2.5, F.3.1–F.3.2 and §1.6 precede its §4.1's
  Schlessinger and representing-ring applications; R07.6.7 consumes none of them.
- **SerreWeightAndLevelOptimisation** §§2.9 and 3.3 uses
  `card_points_quot_multiplicativePart` (§R07.1.3) with its cyclotomic-subgroup
  and unramified-quotient hypotheses, and the local-model interface of §R07.1.24a.
- **EllipticCurveModularity** and **ClassicalSerreModularity** use
  `HasFiniteFlatModel` through `IsFiniteFlatResidual`, the gluing equivalence
  (§R07.1.38) and `torsion_hasFiniteFlatModel_iff_dvd_valuation` (§R07.5.4).
- **AlgebraicModularFormsAndSerreWeights** imports `IsFiniteFlatResidual` and
  `finiteFlatKummerCoefficients` (§R07.5.6a) for its odd-prime coefficient Kummer and
  unramified-descent input. Its all-prime finite-flat/peu-ramifiée equivalence, including
  the dyadic maximal-model argument and agreement at odd primes, and local-weight application
  are owned there.
- **PadicHodgeTheory** consumes the finite-`K`, finite-coefficient `B_HT`, `D_HT`, labelled
  weights and Sen module/operator of §§R07.P7.1–R07.P7.2. A Laurent presentation of `B_HT`
  is identified with the supplied direct-sum presentation by a graded Galois-algebra
  equivalence, transporting the same invariant functor and weight/Sen API. Extensions to
  arbitrary perfect residue fields and arbitrary semilinear `ℂ_p`-representations, and
  differential/Robba comparisons, preserve these specializations. Full Dieudonné–Manin
  theory is supplied by CrystallineCohomology §CR.4.7; §R07.2.15 here owns its group-theoretic
  application. PadicHodgeTheory also uses the Fontaine–Laffaille categories, the ring `S`,
  the raw functor `U_S` with its endpoint analysis, and the translated
  `flIntervalRealization` (R07.3) and imports the filtered modules, weak admissibility and the
  Colmez–Fontaine theorem (§R07.3.1, §R07.3.2, §R07.4.13).
- **ClassicalSerreModularity**, **SerreWeightAndLevelOptimisation**, **EllipticCurveModularity**,
  **GL2ModularityLifting** and **PotentialModularityAndCompatibleSystems** use the residual types of
  R07.5 (inertia on `E[p]`, Serre's finite-flat criterion, Savitt's residual types, residual
  weights) and Fontaine's conjecture for weights `{0, 1}` (§R07.4.20).
- **AInfCohomology** uses Breuil–Kisin modules with torsion and the all-weight Kisin functor
  (§R07.4.15, §R07.4.16).
- **CohomologyComparisons** uses the Fontaine–Laffaille lattice correspondence and full faithfulness
  (§§R07.3.15–R07.3.17), the all-weight Kisin functor and its lattice comparisons (R07.4), and
  Illusie's obstruction class (§R07.6.6).

## References

- **Mazur 1977.** Barry Mazur, *Modular curves and the Eisenstein ideal*, Publ. Math. IHÉS 47,
  33–186; I §§1–5, pp.43–61, and II §17, pp.130–131.
  <https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf>
- **Bloch–Kato 1990.** Spencer Bloch and Kazuya Kato, *L-functions and Tamagawa numbers of motives*, The Grothendieck Festschrift I, 333–400. <https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf>
- **Fontaine 1994, Le corps des périodes.** *Le corps des périodes p-adiques*, Astérisque 223, 59–111. <https://www.numdam.org/item/AST_1994__223__59_0.pdf>
- **Fontaine 1994, Représentations semi-stables.** *Représentations p-adiques semi-stables*, Astérisque 223, 113–184. <https://www.numdam.org/item/AST_1994__223__113_0.pdf>
- **Liu–Tian–Xiao–Zhang–Zhu 2022.** *On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*, Invent. Math. 228, 107–375. <https://doi.org/10.1007/s00222-021-01088-4>
- **Conrad, Kisin survey.** Brian Conrad, *Survey of Kisin’s paper Crystalline representations
  and F-crystals*, Definitions 2.4.4–2.4.5 and equation (2.4.6).
  <https://math.stanford.edu/~conrad/papers/luminy.pdf>
- **Caruso–Liu 2007.** Xavier Caruso and Tong Liu, *Quasi-semi-stable representations*,
  Theorem 2.3.1 and Proposition 2.3.2, pp.9–10.
  <https://www.math.purdue.edu/~tongliu/pub/quasi.pdf>
- **Nizioł 1993.** Wiesława Nizioł, *Cohomology of crystalline representations*, Duke Math. J. 71, 747–791. <https://webusers.imj-prg.fr/~wieslawa.niziol/duke1993.pdf>
- **Patrikis 2019.** Stefan Patrikis, *Variations on a theorem of Tate*, Mem. Amer. Math. Soc. 258; locators use arXiv:1207.6724v4. <https://arxiv.org/abs/1207.6724v4>

- **ACC 2023.** P. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. Le Hung, J. Newton, P. Scholze, R. Taylor, J. Thorne, *Potential automorphy over CM fields*, Ann. of Math. 197 (2023), no. 3. <https://annals.math.princeton.edu/2023/197-3/p02>
- **AGHMP 2018.** Fabrizio Andreatta, Eyal Z. Goren, Benjamin Howard, Keerthi Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, Ann. of Math. 187 (2018), no. 2. <https://arxiv.org/abs/1508.00178v3>
- **Anschütz–Le Bras 2023.** Johannes Anschütz, Arthur-César Le Bras, *Prismatic Dieudonné theory*,
  Forum Math. Pi 11 (2023). <https://arxiv.org/abs/1907.10525v4>
- **BCGP 2021.** George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Abelian surfaces over
  totally real fields are potentially modular*, Publ. Math. IHÉS 134 (2021).
  <https://arxiv.org/abs/1812.09269v3>
- **BCGP 2025.** George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni, *Modularity theorems for
  abelian surfaces*, arXiv:2502.20645v1. <https://arxiv.org/abs/2502.20645v1>
- **Berthelot 1980.** Pierre Berthelot, *Théorie de Dieudonné sur un anneau de valuation parfait*,
  Ann. Sci. ÉNS (4) 13 (1980), 225–268. <https://www.numdam.org/item/ASENS_1980_4_13_2_225_0/>
- **Bhatt–Morrow–Scholze 2018.** Bhargav Bhatt, Matthew Morrow, Peter Scholze, *Integral p-adic
  Hodge theory*, Publ. Math. IHÉS 128 (2018). <https://arxiv.org/abs/1602.03148>
- **Breuil 1999.** Christophe Breuil, *Une application du corps des normes*, Compositio Math. 117
  (1999).
  <https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/corpsdesnormes.pdf>
- **Breuil 1999b.** Christophe Breuil, *Représentations semi-stables et modules fortement
  divisibles*, Invent. Math. 136 (1999), 89–122; §2.2.2 is the completed-period-ring
  construction described in Savitt 2005, §3.2, pp. 12–13.
- **Breuil 2000.** Christophe Breuil, *Groupes p-divisibles, groupes finis et modules filtrés*, Ann.
  of Math. 152 (2000), 489–549.
  <https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/p-divisibles.pdf>
- **Breuil 2003.** Christophe Breuil, *Sur quelques représentations modulaires et p-adiques de
  GL₂(ℚ_p). I*, Compositio Math. 138 (2003), 165–188.
  <https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/GL2%28Qp%29I.pdf>
- **Breuil–Mézard 2002.** Christophe Breuil, Ariane Mézard, *Multiplicités modulaires et
  représentations de GL₂(ℤ_p) et de Gal(ℚ̄_p/ℚ_p) en ℓ = p*, Duke Math. J. 115 (2002).
  <https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/multiplicite.pdf>
- **Brinon–Conrad 2009.** Olivier Brinon and Brian Conrad, *CMI summer school notes on p-adic Hodge
  theory*, preliminary version, 2009. <https://math.stanford.edu/~conrad/papers/notes.pdf>
- **Cais–Lau 2017.** Bryden Cais, Eike Lau, *Dieudonné crystals and Wach modules for p-divisible
  groups*, Proc. London Math. Soc. 114 (2017). <https://arxiv.org/abs/1412.3174v2>
- **Caraiani–Scholze 2017.** Ana Caraiani, Peter Scholze, *On the generic part of the cohomology of
  compact unitary Shimura varieties*, Ann. of Math. 186 (2017), no. 3.
  <https://arxiv.org/abs/1511.02418>
- **Conrad–Diamond–Taylor 1999.** Brian Conrad, Fred Diamond, Richard Taylor,
  *Modularity of certain potentially Barsotti–Tate Galois representations*, J. Amer. Math.
  Soc. 12, 521–567; locators use the author version.
  <https://math.stanford.edu/~conrad/papers/cdtmaster.pdf>
- **Colmez–Dospinescu–Nizioł 2023.** Pierre Colmez, Gabriel Dospinescu, Wiesława Nizioł,
  *Factorisation de la cohomologie étale p-adique de la tour de Drinfeld*, Forum Math. Pi (2023).
  <https://arxiv.org/abs/2204.11214v2>
- **D'Addezio 2023.** Marco D'Addezio, *Parabolicity conjecture of F-isocrystals*, Ann. of Math. 198
  (2023), no. 2. <https://arxiv.org/abs/2012.12879v4>
- **Demazure 1972.** Michel Demazure, *Lectures on p-divisible groups*, Lecture Notes in Math. 302,
  Springer, 1972, Chapter III.8, as transcribed on the nLab (revision of 9 June 2012).
  <https://ncatlab.org/nlab/show/Demazure,+lectures+on+p-divisible+groups,+III.8,+Dieudonn%C3%A9+modules+(p-divisible+groups)>
- **Faltings 1999.** Gerd Faltings, *Integral crystalline cohomology over very ramified
  valuation rings*, J. Amer. Math. Soc. 12 (1999), 117–144.
  <https://doi.org/10.1090/S0894-0347-99-00273-8>
- **Fontaine 1985.** Jean-Marc Fontaine, *Il n'y a pas de variété abélienne sur Z*, Invent. Math. 81
  (1985), 515–538. <https://www.imo.universite-paris-saclay.fr/~fontaine/varabZ.pdf>
- **Fontaine–Laffaille 1982.** Jean-Marc Fontaine and Guy Laffaille, *Construction de
  représentations p-adiques*, Ann. Sci. École Norm. Sup. (4) 15 (1982), no. 4, 547–608.
  <https://www.numdam.org/item/ASENS_1982_4_15_4_547_0/>
- **Gee 2011.** Toby Gee, *Automorphic lifts of prescribed types*, Math. Ann. 350 (2011).
  <https://arxiv.org/abs/0810.1877v2>
- **Kedlaya 2004.** Kiran S. Kedlaya, *A p-adic local monodromy theorem*, Ann. of Math. 160 (2004),
  93–184; arXiv:math/0110124. <https://arxiv.org/abs/math/0110124>
- **Kedlaya 2005.** Kiran S. Kedlaya, *Slope filtrations revisited*, Doc. Math. 10 (2005), 447–525;
  arXiv:math/0504204 (locators use the arXiv pagination). <https://arxiv.org/abs/math/0504204>
- **Kim 2012.** Wansu Kim, *The classification of p-divisible groups over 2-adic discrete valuation
  rings*, arXiv:1007.1904v3. <https://arxiv.org/abs/1007.1904v3>
- **Kisin 2006.** Mark Kisin, *Crystalline representations and F-crystals*, Algebraic Geometry and
  Number Theory (in honour of V. Drinfeld's 50th birthday), Progr. Math. 253, Birkhäuser, 2006, pp.
  459–496. Page numbers refer to the author's version at
  <http://people.math.harvard.edu/~kisin/dvifiles/wam.dvi>
- **Kisin 2008.** Mark Kisin, *Potentially semi-stable deformation rings*, J. Amer. Math. Soc. 21
  (2008), no. 2, 513–546. Page numbers refer to the author's version at
  <http://people.math.harvard.edu/~kisin/dvifiles/def.dvi>
- **Kisin 2009.** Mark Kisin, *Moduli of finite flat group schemes, and modularity*, Ann. of Math.
  (2) 170 (2009), no. 3, 1085–1180. Page numbers refer to the author's version at
  <http://people.math.harvard.edu/~kisin/dvifiles/bt.dvi>
- **Kisin 2009b.** Mark Kisin, *Modularity of 2-adic Barsotti–Tate representations*, Invent. Math.
  178 (2009), no. 3, 587–634. Page numbers refer to the author's version at
  <http://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi>
- **Lipnowski–Tsimerman 2018.** Michael Lipnowski, Jacob Tsimerman, *How large is A_g(F_q)?*, Duke
  Math. J. 167 (2018). <https://arxiv.org/abs/1511.02212v1>
- **Liu 2013.** Tong Liu, *The correspondence between Barsotti–Tate groups and Kisin
  modules when p = 2*, J. Théor. Nombres Bordeaux 25, 661–676.
  <https://www.numdam.org/item/10.5802/jtnb.852.pdf>
- **Newton–Thorne 2021.** James Newton, Jack A. Thorne, *Symmetric power functoriality for
  holomorphic modular forms, II*, Publ. Math. IHÉS 134 (2021).
  <https://pmihes.centre-mersenne.org/volume/PMIHES_2021__134_/>
- **Newton–Thorne 2026.** James Newton, Jack A. Thorne, *Symmetric power functoriality for Hilbert
  modular forms*, Ann. of Math. 203 (2026), no. 1; locators use arXiv:2212.03595v2 preprint pagination. <https://arxiv.org/abs/2212.03595v2>
- **Oort–Tate 1970.** Frans Oort and John Tate, *Group schemes of prime order*, Ann. Sci. École
  Norm. Sup. (4) 3 (1970), 1–21. <https://www.numdam.org/item/ASENS_1970_4_3_1_1_0/>
- **Pilloni 2020.** Vincent Pilloni, *Higher coherent cohomology and p-adic modular forms of
  singular weights*, Duke Math. J. 169 (2020).
  <https://projecteuclid.org/journals/duke-mathematical-journal/volume-169/issue-9/Higher-coherent-cohomology-and-p--adic-modular-forms-of/10.1215/00127094-2019-0075.full>
- **Pink 2005.** Richard Pink (notes by the participants), *Finite group schemes (lecture course, WS
  2004/05)*, ETH Zürich lecture notes, February 2005 (printed page = PDF page − 4).
  <https://people.math.ethz.ch/~pink/ftp/FGS/CompleteNotes.pdf>
- **Ramakrishna 1993.** Ravi Ramakrishna, *On a variation of Mazur's deformation functor*,
  Compositio Math. 87 (1993), 269–286. <https://www.numdam.org/item/CM_1993__87_3_269_0/>
- **Raynaud 1974.** Michel Raynaud, *Schémas en groupes de type (p, …, p)*, Bull. Soc. Math. France
  102 (1974), 241–280. <https://www.numdam.org/item/BSMF_1974__102__241_0/>
- **Savitt 2005.** David Savitt, *On a conjecture of Conrad, Diamond, and Taylor*, Duke Math. J. 128
  (2005), 141–197. <https://arxiv.org/abs/math/0404327v3>
- **Scholze 2015.** Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*,
  Ann. of Math. 182 (2015), 945–1066. <https://arxiv.org/abs/1306.2070>
- **Scholze–Weinstein 2013.** Peter Scholze, Jared Weinstein, *Moduli of p-divisible groups*, Camb.
  J. Math. 1 (2013). <https://arxiv.org/abs/1211.6357>
- **Schoof 2003.** René Schoof, *Abelian varieties over cyclotomic fields with good reduction
  everywhere*, Math. Ann. 325 (2003), 413–448. <https://www.mat.uniroma2.it/~schoof/abcyc.pdf>
- **Schoof 2005.** René Schoof, *Abelian varieties over Q with bad reduction in one prime only*,
  Compositio Math. 141 (2005), 847–868. <https://www.mat.uniroma2.it/~schoof/abvar1prime.pdf>
- **Schröer 2023.** Stefan Schröer, *There is no Enriques surface over the integers*, Ann. of Math.
  197 (2023), no. 1. <https://arxiv.org/abs/2004.07025v3>
- **Serre 1972.** Jean-Pierre Serre, *Propriétés galoisiennes des points d'ordre fini des courbes
  elliptiques*, Invent. Math. 15 (1972), 259–331.
  <https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0015/LOG_0024.pdf>
- **Serre 1987.** Jean-Pierre Serre, *Sur les représentations modulaires de degré 2 de Gal(Q̄/Q)*,
  Duke Math. J. 54 (1987), 179–230.
  <https://doi.org/10.1215/S0012-7094-87-05413-5>
- **Stacks Project.** The Stacks project authors, *The Stacks project*, online.
  <https://stacks.math.columbia.edu/tag/0BNI>
- **Stix 2012.** Jakob Stix, *A course on finite flat group schemes and p-divisible groups*, course
  notes, Heidelberg, revised 18 September 2012.
  <https://www.math.uni-frankfurt.de/~stix/skripte/STIXfinflatGrpschemes20120918.pdf>
- **Tate 1967.** John T. Tate, *p-Divisible groups*, Proceedings of a Conference on Local Fields
  (Driebergen, 1966), Springer, 1967, pp. 158–183.
  <https://www.math.purdue.edu/~tongliu/teaching/598/p-divisible.pdf>
- **Wintenberger 1983.** Jean-Pierre Wintenberger, *Le corps des normes de certaines extensions
  infinies de corps locaux; applications*, Ann. Sci. ÉNS (4) 16 (1983), 59–89.
  <https://www.numdam.org/item/ASENS_1983_4_16_1_59_0/>
- **Yu 2026.** Chia-Fu Yu, *Introduction to Dieudonné modules and supersingular abelian varieties
  revisited*, arXiv:2603.11506v1 (12 March 2026). <https://arxiv.org/abs/2603.11506>
- **de Jong 1995.** A. J. de Jong, *Crystalline Dieudonné module theory via formal and rigid
  geometry*, Publ. Math. IHÉS 82 (1995), 5–96. <https://www.numdam.org/item/PMIHES_1995__82__5_0/>
- **de Jong 1998.** A. J. de Jong, erratum to *Crystalline Dieudonné module theory via formal
  and rigid geometry*, Publ. Math. IHÉS 87 (1998), 175.
  <https://www.numdam.org/item/PMIHES_1998__87__175_0/>
- **Illusie 1985.** Luc Illusie, *Déformations de groupes de Barsotti–Tate
  (d'après A. Grothendieck)*, Astérisque 127 (1985), 151–198.
  <https://www.numdam.org/item/AST_1985__127__151_0/>
- **Sharifi.** Romyar Sharifi, *Iwasawa Theory*, 189-page lecture notes, §4.5, pp.114–117.
  <https://www.math.ucla.edu/~sharifi/iwasawa.pdf>
- **Česnavičius 2019.** Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168
  (2019). <https://arxiv.org/abs/1711.06456>
