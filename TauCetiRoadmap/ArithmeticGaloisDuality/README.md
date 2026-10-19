# Roadmap: continuous cohomology of profinite groups, part II — compact coefficients and arithmetic duality

**Summary.** This roadmap continues Tau Ceti's ProfiniteCohomology roadmap in the two directions
that roadmap leaves out — non-discrete coefficients and the Hochschild–Serre spectral sequence —
and uses them to build global arithmetic duality. Starting from Mathlib's `continuousCohomology`
and ProfiniteCohomology's exact sequences, Shapiro's lemma and cup products, it uses the tower `lim` and `lim¹` supplied by
DerivedModuleAlgebra §1.T.1 and the continuous cochain comparisons supplied by
PerfectoidTowers §P9.0 to prove Tate's inverse-limit theorem and the passage from finite to compact and rational
coefficients; the spectral sequence of a group extension with its transgression; the Galois group
`G_{K,S}` of the maximal extension of a number field unramified outside a set of places `S`, the
`S`-idele class formation and the corresponding class-field inputs for global function fields;
Tate's duality theorem for class formations, the Poitou–Tate nine-term sequence, global finiteness,
the cohomological dimension of `G_{K,S}` and Tate's global Euler characteristic formula; all-place
`Ш` duality, Grunwald–Wang with its exact dyadic obstruction, character roots and duality for tori;
continuous cochains with compact and cofinite coefficients in the derived category, compact
support and Nekovář's derived local and global duality; the Greenberg–Wiles formula; the
first-order calculations for adjoint coefficients; and the numerical inputs of Taylor–Wiles and
Khare–Wintenberger patching (local counts at auxiliary primes, dual-Selmer killing, the dyadic
case). Every statement keeps its archimedean and `p = 2` terms and names the pairing, the sign and
the topology it uses.

The layers are:

| Layer | Title | Headline targets |
| --- | --- | --- |
| R02.1 | Compact coefficients, limits and continuous extensions | Tower supplier contract, Tate's inverse-limit theorem, rationalisation, `HomPt`, the splitting torsor, continuous factor-set extensions, unbalanced cochain products |
| R02.2 | The Hochschild–Serre spectral sequence, transgression and residue maps | `HochschildSerre.spectralSequence`, transgression as a cup product, descent along open subgroups, Laurent residue sequences, supplied procyclic `H¹` |
| R02.3 | Restricted ramification and the `S`-idele class formation | Multiplicative completion, S-unit rank and fundamental-system adapters, finite Galois localization, `maxUnramifiedOutside`, `galoisGroupS`, finiteness of `H¹(G_S, M)`, localisation maps, `S`-idele classes, `PClassFormation`, function-field class-field inputs, `Шⁱ`, exponent-two fields |
| R02.4 | Arithmetic duality and local–global obstruction groups | Tate's duality for class formations, Poitou–Tate duality, `cd_p G_S ≤ 2`, global Euler characteristic, function-field Poitou–Tate, finite compact support, all-place `Ш` duality, Grunwald–Wang, character roots, torus duality |
| D7 | Derived continuous cohomology and compact arithmetic duality | derived tensor and limit comparisons, Grothendieck local duality, admissible coefficients, `RΓ_cont`, compact Hochschild–Serre, derived local duality, compact support, derived Poitou–Tate duality, lattice Poitou–Tate, abelian-variety local duality, dual local conditions and mapping-fibre duality |
| R02.5 | Selmer duality and dimension formulas | Greenberg–Wiles formula, change of one finite local condition, rank-one numerics |
| D8 | Adjoint coefficients and first-order lifts | trace-zero adjoint duality, first-order cocycle comparison, determinant derivative |
| R02.6 | Auxiliary primes and patching numerics | Taylor–Wiles local count, dual-Selmer killing, the group theory of Taylor–Wiles primes, odd and dyadic auxiliary primes, archimedean adjoint dimensions |

The layer labels are the stage labels other roadmaps cite. They are built in the order
R02.1, R02.2, R02.3, R02.4, D7, R02.5, D8, R02.6 (see *How to read the build*).

## Scope and ownership

**Owned here.** Continuous cohomology with compact, lattice, rational and torsion
coefficients using PerfectoidTowers §P9.0's comparison with Mathlib's carrier, Tate's inverse-limit
theorem, the long exact sequences that need a continuous section, rationalisation and the discrete
quotient `V/T`; the pointwise `Hom` with its
splitting torsor and connecting-map cup formula, and the continuous `Hom` from a profinite source
with its evaluation cup product; topologies on factor-set extensions and the
continuous Schreier classification; unbalanced cochain products. The Hochschild–Serre spectral
sequence of a closed normal subgroup with its edge maps, multiplicativity, transgression,
degeneration, finite-index descent and compact-coefficient variants; residue sequences of Laurent-series fields. The group `G_{K,S}`,
Hermite's finiteness theorem with ramification outside `S`, finiteness of `H¹(G_S, M)`, localisation
maps with the modified archimedean groups, `S`-ideles, S-unit cardinality and reindexing adapters, multiplicative completion and its unit injections,
`S`-units and `S`-idele classes, finite Galois localization and Sha kernels, `P`-class
formations, the `S`-class formation with its reciprocity and the `S`-unit Kummer sequence; the
class-field inputs for global function fields (ideles and `S`-units, restricted ramification, the
equal-characteristic specialization and comparisons for the supplied finite local duality,
the Euler characteristic prime to the characteristic, the global class formation); absolute and
relative `Шⁱ` and the cyclotomic power kernel; exponent-two ramification fields, quadratic fields with one new ramified prime, the
antiunit class-field rank and the absence of `ℤ_p`-extensions unramified at `p`. Ext of discrete
modules, Tate's duality for a `P`-class formation and for the `S`-idele classes, archimedean local
duality, the restricted products `Pʳ_S` and their self-duality, Poitou–Tate duality, global
finiteness, cohomological dimension, high-degree cohomology of units, the decomposition map and
the modular cyclic induction it uses, the global Euler characteristic, the function-field
Poitou–Tate and Euler theorems, finite compact support, all-place `Ш` duality with transfer
adjunction, Grunwald–Wang with its dyadic obstruction (ClassFieldTheory expressly leaves it out),
character roots and their local Brauer obstructions, totally real base change with prescribed
local behaviour, Tate's vanishing of `H²(G_K, ℚ/ℤ)`, torus duality and function-field central
obstructions. The derived coefficient algebra the duality theorems need (perfect amplitude,
Tor and arithmetic coefficient comparisons for the imported module-derived tensor product,
the comparison of module-derived limits with the explicit tower API, Grothendieck
local duality for complete local rings, the derived composite spectral sequence, flatness of adic continuous
functions, the Hilbert–Samuel Euler function); admissible coefficients, continuous cochains in the
derived category with finiteness and base change, compact Shapiro and Künneth statements, derived
local duality, compactly supported cochains with their cup products and Euler characteristic,
derived Poitou–Tate duality including the dyadic case with real places, lattice and rational
Poitou–Tate sequences, `Ext` of abelian varieties by `G_m` on the big étale site of a field, local
duality for abelian varieties and isogenies. The Greenberg–Wiles
formula for finite discrete coefficients and the rank-one numerics of Layer R02.5;
perfect pairings, dual local conditions and parametric mapping-fibre duality in D7.7;
trace-zero adjoint duality and first-order cocycles; the Taylor–Wiles
and Khare–Wintenberger numerics of Layer R02.6.

**Tau Ceti roadmaps this roadmap builds on.**

- *ProfiniteCohomology* (Layers 1–12). The canonical carrier `TopRep`, `continuousCohomology` and
  its compatible-pair functoriality (Layer 1); the explicit low-degree complex, with conjugation and
  the triviality of inner conjugation in degrees `≤ 2` (Layer 2); the comparison isomorphisms
  (Layer 3); the finite-quotient colimit description (Layers 4 and 10); the long exact sequence
  through degree two, inflation–restriction and the five-term sequence with its explicit
  transgression (Layer 5); the long exact sequence in every degree (`delta`, `longExact_exact`,
  Layer 10); restriction, corestriction and conjugation (Layers 2, 6 and 10); coinduced modules and
  Shapiro's lemma in all degrees (Layers 7 and 10); cup products (Layer 8 in degrees `p + q ≤ 2`,
  Layer 12 in all degrees);
  Hilbert 90 and Kummer theory (Layer 9); cohomological dimension (Layer 11). That roadmap excludes
  the Hochschild–Serre spectral sequence and all theorems for non-discrete coefficients, profinite
  Sylow theory and Schur multipliers. The spectral sequence and arithmetic coefficient theory are
  owned here, using PerfectoidTowers §P9.0's cochain comparisons; the last two are not used.
- *HeightsAndUnits* §4.2 owns S-unit rank and fundamental systems on Mathlib's `Set.unit`
  carrier. Section R02.3.0c supplies their arithmetic cardinality, reindexing and completion adapters.
- *ClassFieldTheory*. Class formations and fundamental classes (Layer 2), Tate's theorem and the
  Tate–Nakayama isomorphisms (Layer 3), the abstract Artin map (Layer 4); the local Brauer group,
  the local invariant, local Tate duality and the local Euler characteristic for finite modules in
  mixed characteristic (Layer 5); the local class formation and reciprocity for every
  nonarchimedean local field (Layers 6–7); the global Brauer sequence and the archimedean
  invariants (Layer 10), the global class formation and Artin reciprocity (Layer 11), global
  existence and the norm index (Layer 12) and the class fields of Layer 13, all for number fields.
  ClassFieldTheory leaves out global class field theory of function fields and the Grunwald–Wang
  theorem; Layers R02.3 and R02.4 here supply exactly what this roadmap needs of them.
- *GlobalNumberFields* (mixed finite/real weak approximation, Layer 1; ideles and idele class
  groups, Layer 6; the connected component and ray
  classes, Layer 7; norms of ideles, Layer 8), *NumberFieldArithmetic* (unramified sets of primes,
  Layer 1; relative discriminants, Layer 4; different exponents, Layer 6), *Chebotarev* (Layer 10),
  *ProfiniteProPGroups* (supernatural orders, Layer 1), *RepresentationTheory/InductionRestriction*
  (Brauer induction, Layer 6), *ReductiveGroups* (Layers 4–7, tori and their character lattices `X*(T)`, used
  for torus duality) and *AlgebraicCurves* (function-field divisors, the product formula and the
  finiteness of `Cl⁰` over a finite field, Layers 3 and 5).

**Further roadmaps this roadmap builds on.**

- *PadicPeriodRings* §0.1 supplies `procyclic_H1_equiv_coinvariants`, natural in the
  coefficient module, for discrete torsion, finitely generated `ℤ_p` and finite-dimensional
  `ℚ_p` coefficients with the stated continuous actions, together with its Checks.
- *PerfectoidTowers* §P9.0 supplies lifting continuous cochains along surjections of discrete
spaces,
  continuous cochains into inverse limits, and the comparison with Mathlib's homogeneous cochains
  for jointly continuous actions in all degrees. Topological comparisons use the quotient topology
  on cohomology; comparisons in derived categories use the underlying modules.
- *AdelicAlgebraicGroups* §§1.1–1.2 supply integral models, the topology of affine adelic
  points and their restricted-product realization; §1.5 supplies compact open local subgroups.
  Its §3.4 **Finiteness of class numbers** supplies finiteness of
  `T(F)\T(𝔸_{F,f})/U` for a number-field torus and a compact open subgroup `U`.
  R02.4.6 here constructs the modified archimedean quotient, its compactness modulo the closure
  of rational points, torus local duality, the completed sequence and realization of its image
  by actual adelic points.
- *EllipticCurves* Layer 7 *Selmer structures, the Selmer group, and Sha* supplies
  local-condition subgroups and the Selmer subgroup for a general discrete Galois module.
  Layers R02.5–R02.6 use this carrier for finite coefficients, with annihilators and
  quotient pairings from §§D7.7.1–D7.7.2. The dual local conditions and parametric
  derived fibre duality are constructed in §§D7.7.1–D7.7.6.
- *SchemeAndStackFoundations* Layer 2: dualising complexes over Noetherian rings and the normalised
  local dualising complex (§2.21 *Dualising complexes*, `DualizingComplex`, `NormalizedDualizing`),
  local cohomology of modules (§2.7 *Cohomology with supports and local cohomology*,
  `localCohomology_colimit_ext_comparison`), the derived tensor product and internal Hom (§2.18
  *Derived categories of quasi-coherent complexes*, `derivedTensor`, `derivedHom`, of which the
  affine case is used, through `DQCoh.affineEquiv`), and the comparison of étale cohomology of a
  field with Galois cohomology (§2.15, `etale_galois_comparison`). The module-derived tensor product
  uses DerivedModuleAlgebra §0.2 and EnhancedDerivedSheaves §E1.8.DMA.1's affine comparison
  with §2.18.
- *DerivedModuleAlgebra* §1.T.1 owns the tower shift, `lim`/`lim¹`, Mittag–Leffler,
  six-term and Milnor APIs. Its §0.2 owns K-flat resolutions, the module-derived tensor product
  `DerivedDeRham.derivedTensor`, derived extension of scalars, model independence and exactness.
  D7.1 uses this functor for perfect amplitude, Tor and arithmetic coefficient change. Layer 1 §1.1 owns
  the general module-derived limit `DerivedDeRham.derivedLimit`; its Milnor proof reuses DerivedModuleAlgebra §1.T.1's
  shift calculation after a degreewise-surjective replacement. D7.1 owns the comparison
  `CompactCoefficients.moduleDerivedLimit_compare` with that early explicit tower API.
  Layer 1 also supplies the derived completion reflector `DerivedDeRham.derivedCompletion`
  (§1.3) and the comparison of derived completion with ordinary completion for complexes with
  finitely generated cohomology over a Noetherian ring (§1.5), used by *Grothendieck local duality
  for a complete Noetherian local ring*. Section 1.M.1 supplies Matlis duality for arithmetic
  coefficients, and §S.1 supplies the first-quadrant double-complex spectral sequence with its
  convergence, edge maps and exact-row consequences.
- *EnhancedDerivedSheaves* §E1.8.DMA.1 supplies the affine comparison `derivedTensor_affine`
  with SchemeAndStackFoundations §2.18.
- *AbelianSchemesAndArithmeticModuli* Layer A2: the dual abelian scheme with its Poincaré bundle
  (`AbelianScheme.dual`, §A2.2) and its elliptic comparison `AbelianScheme.dual_elliptic`,
  `a ↦ O([−a] − [0])`, and *AlgebraicModuliForArithmeticGeometry* Layer 4: banded gerbes
  and their classification by `H²` of the band (`gerbeClass`, §4.20, derived classification on
  arbitrary sites); both are used for local duality of abelian varieties.
- *ArithmeticGaloisRepresentations*: decomposition, inertia and wild inertia groups at a place and
  restriction to them with coherent change of embedding (Layer 2, §2.1); the Dickson classification
  of finite projective images (Layer 4, §4.4) and the residual image in characteristic two with
  `H¹(SL₂(F₀), M₂(F)) = 0` (Layer 4, §4.7); Chebotarev density for global function fields
  (Layer 5, §5.13 / **Chebotarev for function fields**); the adjoint, the trace-zero adjoint and the
  perfect trace pairing over any coefficient ring (Layer 7, §7.2); `H¹(SL₂(F), ad⁰) = 0` for `#F ≠ 5` in odd
  characteristic (Layer 7, §7.7); Tate's vanishing `H²(G_F, ℚ/ℤ) = 0` for a number field
  (Layer 7, §7.6 / **Projective lifting**).
- *EtaleCohomologyFoundations* §§F.0.A0, F.0.A2 supplies field fundamental groups,
  their arithmetic exact sequence and descent. Section R02.3.0d uses these with
  ArithmeticGaloisRepresentations §2.1 to define finite localization and Sha kernels.
  Sections R02.4.5a–R02.4.5b give the absolute finite-coefficient Poitou–Tate
  consequences and the order-two Grunwald–Wang alternative. Section R02.4.6
  gives all-place duality with transfer adjunction, the function-field case and
  the exact exceptional triples and obstruction class.

**Library declarations used, not restated.** Mathlib's `continuousCohomology`, `TopRep`,
`CategoryTheory.Functor.IsMittagLeffler`, `RestrictedProduct`, `tateCohomology`, `groupCohomology`,
`CategoryTheory.Abelian.Ext`, `DerivedCategory`, `CategoryTheory.Tor`,
`CochainComplex.mappingCone`, `CochainComplex.mappingCocone`,
`ContinuousCohomology.tateShafarevich` with `mem_tateShafarevich` and
`tateShafarevich_eq_ker_pi`, `Representation.asAlgebraHom`, the spectral-object machinery,
`AdicCompletion`, `Module.length` and `Polynomial.hilbertPoly`; Tau Ceti's
`Representation.toSubmodule_range_asAlgebraHom`, `ContinuousMap.discreteTopology`,
`TauCeti.ofDiscreteModule`, `TauCeti.DiscreteRep`, `TauCeti.InternalHom` with `homAction` and
`evalPairing`, `TauCeti.exists_continuous_section`, `TauCeti.FactorSet`, `TauCeti.KummerCoeff`,
`TauCeti.kummerShortExact`, the periodicity of Tate cohomology of cyclic groups, Artin's induction
theorem `TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`,
`TauCeti.traceBilinForm` with `traceBilinForm_nondegenerate`, the trace-zero ideal `TauCeti.slIdeal`
(which is `ad⁰`; no second trace-zero submodule is defined) and `TauCeti.Place` for function fields;
Mathlib's `Algebra.IsUnramifiedIn` for unramifiedness at a finite place, quantified explicitly over
the places outside `S` as NumberFieldArithmetic §1.2 prescribes. Tau Ceti also proves Sylow
detection for group cohomology
(`TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` and
`TauCeti.groupCohomology.isZero_of_isZero_sylow`), which *Finite-group universal coefficients and
Sylow detection* cites rather than restates; the triviality of inner conjugation on continuous
cohomology in every degree (`TauCeti.ContinuousCohomology.map_eq_id_of_inner`), which *Localisation
maps and the modified local groups* cites; the topology of factor-set extensions and their
profinite-group structure (`TauCeti.FactorSet.Extension.homeomorphProd`,
`TauCeti.FactorSet.Extension.isTopologicalGroup`,
`TauCeti.FactorSet.continuous_canonicalSection`,
`TauCeti.FactorSet.continuous_rescaleEquiv` and `TauCeti.ProfiniteGroupExtension.ofFactorSet`) and
the classification of continuous profinite extensions by `TauCeti.ContCohomology.H2`
(`TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv`), which *Continuous topology on
factor-set extensions* and *Continuous Schreier classification and automorphisms* cite; and the
class-formation structure of ClassFieldTheory Layer 2 (`TauCeti.ClassFieldTheory.ClassFormation`
with its `fundamentalClass`), on which *P-class formations* builds.

**Not in this roadmap.** `ℓ`-primary coefficients over a global function field of characteristic
`ℓ` (flat and Artin–Schreier duality); the finiteness of Tate–Shafarevich groups of abelian
varieties; Iwasawa cohomology and its control theorems (SelmerIwasawaCohomology); deformation rings,
their presentations and patching, which use the numerical statements of Layers R02.5, R02.6 and D8
as inputs; and Galois representations attached to automorphic forms.

## Conventions

- **Groups and coefficients.** `G` is a profinite group in Mathlib's unbundled classes
  (`[Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]`). Coefficients are objects of Mathlib's `TopRep R G`; a discrete
  module enters through Tau Ceti's `TauCeti.ofDiscreteModule`; smoothness is
  `TauCeti.IsSmoothDiscrete`, equivalent to joint continuity of the action for discrete
  coefficients over a topological group. A finite-type module over a complete Noetherian local ring `R` carries
  its maximal-ideal-adic topology; a cofinite (Artinian) module carries the discrete topology. The
  two regimes stay separate throughout, and a topology is forgotten only on entering a category of
  complexes of modules.
- **Cohomology.** `Hⁱ(G, M)` is Mathlib's `continuousCohomology i M`, the cohomology of the
  homogeneous continuous cochains, compared with explicit inhomogeneous cochains
  `C^•_cts(G, M)` by ProfiniteCohomology Layer 3 for discrete `M` and by PerfectoidTowers §P9.0 for
  compact
  and rational coefficients. No third cohomology theory is introduced.
- **Towers.** Inverse systems are indexed by `ℕ`. `lim` and `lim¹` are the kernel and cokernel of
  `1 − shift`, `(a_n) ↦ (a_n − φ_n(a_{n+1}))`. A `lim¹` term is carried explicitly in every
  comparison until a Mittag-Leffler argument removes it.
- **Number fields and places.** `K` is a number field with a chosen separable closure `K^s`. For a
  set `S` of places containing the archimedean places, `K_S ⊆ K^s` is the maximal subextension
  unramified at every finite place outside `S`, and `G_S = G_{K,S} = Gal(K_S/K)`. Archimedean
  places are always in `S` and impose no condition on `K_S`. `R_{K,S}` is the ring of `S`-integers.
  For each place `v` an embedding `K^s ↪ K_v^s` over `K` is chosen; it gives the decomposition map
  `G_v → G_K → G_S`, and every statement is independent of the choice.
- **Local groups at the places.** `Hʳ(K_v, M)` means `Hʳ(G_v, M)` at a finite place and Tate
  cohomology `Ĥʳ(G_v, M)` of the finite group `G_v` at an archimedean place, in every degree,
  including degree `0`: at a real place `H⁰(K_v, M) = M^{G_v}/N_{G_v}M`, and at a complex place
  every group vanishes. Write `C_v^ord(X) = C_cont(G_v, X)` for the ordinary deformation-local
  complex at every place, and `C_v^mod(X)` for the arithmetic-duality local complex: the same
  complex at finite places, the complete Tate complex at real places, and zero at complex places.
  Ordinary restriction followed by the natural map `q_v : C_v^ord → C_v^mod` gives modified
  localisation; on real `H⁰` this is the quotient by norms. Thus `H⁰(G_v, X)` always denotes
  ordinary invariants, whereas `H⁰(K_v, X)` follows the modified convention. The Euler
  characteristic and the ordinary deformation fibre use ordinary invariants. At a finite place
  where inertia acts trivially on `M`,
  `Hʳ_un(K_v, M)` is the image of inflation from the residue-field Galois group. For
  finite-dimensional cohomology over a field `k`, write `hⁱ(G, M) = dim_k Hⁱ(G, M)` and
  `hⁱ(F, M) = hⁱ(G_F, M)` for a global field `F`. Ordinary local dimensions use `hⁱ(G_v, M)`;
  unramified dimensions use `dim_k Hⁱ_un(F_v, M)`.
- **Duals.** For a finite discrete `G_S`-module `M` of exponent `m` with `#M` a unit in `R_{K,S}`,
  the dual is `M^D = Hom(M, μ_m)` with the contragredient cyclotomic action `(σf)(x) = σ(f(σ⁻¹x))`
  and the evaluation pairing into `μ_m`. The Pontryagin dual `M^* = Hom_cts(M, ℚ/ℤ)` and the
  Matlis dual `D(M) = Hom_R(M, E(k))` are different functors and are always named.
- **Compact support.** For a map `res : A → B` of complexes, the compactly supported complex is
  Mathlib's mapping fibre `CochainComplex.mappingCocone res`, whose differential is
  `(a, b) ↦ (da, −res(a) − db)` in degree `n` on `Aⁿ ⊕ Bⁿ⁻¹`. A compact-first cup product has
  local coordinate `a_S ∪ res(b)`; a
  compact-second product has local coordinate `(−1)ⁱ res(a) ∪ b_S` for `a` of degree `i`.
  Arithmetic compact support uses `B = ⊕ C_v^mod`; for coefficients of residue characteristic
  `p`, under `(P)` its archimedean summands are acyclic, so it agrees with the finite-place fibre.
  Section D7.7.4 constructs duality for a parametric mapping fibre with local conditions
  using the modified diagram and its maps `q_v`.
- **Transgression.** The transgression and the inhomogeneous cochain conventions are those of
  ProfiniteCohomology Layer 5; with them the second differential of the Hochschild–Serre spectral
  sequence of a central extension with class `u` is `d₂ = −u ∪ (·)`. For the carry cocycle
  of `ℤ/9 → ℤ/3`, the normalized lift has `dF(1,2) = −1 = 2` in `𝔽₃`
  (*d₂ as cup product with the extension class*).
- **The coefficient-prime hypothesis.** Write `(P)` for: `p` is odd, or `K` has no real places.
  For discrete `p`-primary `G_S`-modules, if `S` contains every place above `p`, then under `(P)`
  global cohomology vanishes above degree two. For finite `S` and finite `p`-primary coefficients,
  modified compactly supported cohomology lives in degrees `0` to `3`. Finiteness and perfectness
  require the separate coefficient and finite-`S` hypotheses of their targets. At `p = 2` with real places, ordinary global
  cohomology can be unbounded and the modified compactly supported complex can have negative
  cohomology. For finite `2`-primary coefficients with all places above `2` in `S`, the global
  groups in degrees `i > 2` are the sums of the real Tate groups of those coefficients; their
  nonvanishing determines unboundedness. Both complexes retain their full degrees.
- **Euler function.** For a complete Noetherian local ring `R` of dimension `d` and a finite
  `R`-module `M`, `e_R(M)` is `d!` times the coefficient of `X^d` in the cumulative Hilbert–Samuel
  polynomial `n ↦ length(M/m^{n+1}M)`; a finite-length module over `ℤ_p` has `e = 0`.
- **Adjoint coefficients.** For a representation on `V = kⁿ`, `ad = End_k(V)` with the conjugation
  action and `ad⁰ = ker(tr)`. No statement divides by `n` or by `2`: when the characteristic of `k`
  divides `n`, the dual of `ad⁰` is `ad/k·1`, not `ad⁰`.
- **Global function fields.** A global function field `F` has characteristic `ℓ`, and every
  function-field statement takes coefficients of order prime to `ℓ` and a nonempty set `S` of
  places; there are no archimedean places.

## Exact supplier contracts

### From Mathlib (pinned)

- `continuousCohomology n X : TopModuleCat k` for `X : TopRep k G`, the homology of the homogeneous
  continuous cochains (`RepresentationTheory/Homological/ContCohomology/Basic.lean`); `TopRep`
  (`RepresentationTheory/Continuous/TopRep.lean`), whose operators are continuous one at a time;
  joint continuity is a separate hypothesis wherever a statement uses it.
- `CategoryTheory.Functor.IsMittagLeffler` and `CategoryTheory.Functor.ofOpSequence`: towers are
  functors `ℕᵒᵖ ⥤ AddCommGrpCat`, and the Mittag-Leffler condition is Mathlib's.
- `ContinuousCohomology.tateShafarevich`, `ContinuousCohomology.mem_tateShafarevich` and
  `ContinuousCohomology.tateShafarevich_eq_ker_pi`: all-place localization kernels for
  `TopRep ℤ (Field.absoluteGaloisGroup K)`, with ordinary degree-zero local cohomology.
- `RestrictedProduct` with its topology: the restricted products `Pʳ_S` and the ideles.
- `tateCohomology` and `groupCohomology`: the modified archimedean groups and the cohomology of
  finite quotients.
- `CategoryTheory.Abelian.Ext` with `Ext.comp` and `covariantSequence_exact`, existence of `Ext`
  from enough injectives (`hasExt_of_enoughInjectives`, `IsGrothendieckAbelian.enoughInjectives`),
  `DerivedCategory`, `CochainComplex.mappingCone`, `CochainComplex.mappingCocone` with
  `CochainComplex.mappingCocone.triangle`, `HomologicalComplex₂.total`, the spectral
  objects `HomotopyCategory.spectralObjectMappingCone`,
  `CategoryTheory.Abelian.SpectralObject.spectralSequence` with `IsFirstQuadrant` and
  `coreE₂CohomologicalNat`, and `CategoryTheory.Tor`.
- `Field.absoluteGaloisGroup`, `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`, the Krull
  topology, `IsDedekindDomain.HeightOneSpectrum`, `Set.integer` and `Set.unit` (`S`-integers and
  `S`-units), `ClassGroup`, `Algebra.IsUnramifiedAt` and `Algebra.IsUnramifiedIn` (a finite place
  `v` is unramified in `L` when `Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal`: every prime of `𝓞 L` over
  `v` is unramified; "unramified outside `S`" is `∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal`,
  with no wrapper predicate, as NumberFieldArithmetic §1.2 prescribes),
  `NumberField.finite_of_discr_bdd`, `NumberField.IsTotallyComplex`, `FunctionField`.
- `AdicCompletion.of`, `AdicCompletion.map`, `AdicCompletion.ofTensorProduct` and
  `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`;
  `PadicInt.toZModPow` for the quotient-tower completion comparison.
- `NumberField.Units.exist_unique_eq_mul_prod`, `NumberField.Units.rank`,
  `NumberField.Units.finrank_eq`, `IsIntegral.of_pow`, `RingOfIntegers.instFintypeClassGroup`,
  `Nat.card_coe_set_eq`, `CommGroup.torsion` and `AddCommGroup.equiv_free_prod_directSum_zmod`
  for global units, S-unit rank and fundamental systems.
- `Submodule.orthogonalBilin`, `Submodule.orthogonalBilin_map`, `LinearMap.IsPerfPair` and
  `Submodule.map_le_iff_le_comap` for dual local conditions.
- `PontryaginDual`, `AdicCompletion`, `Module.length`, `ringKrullDim`, `Polynomial.hilbertPoly`,
  `Ideal.exists_pow_inf_eq_pow_smul` (Artin–Rees), `localCohomology`, `Subrepresentation`,
  `Matrix.det_one_add_smul`, `DualNumber`.

### From Tau Ceti (pinned)

- `ContinuousMap.discreteTopology` (`TauCeti/Topology/CompactOpen.lean`): compact-open
  continuous maps from a compact space to a discrete space are discrete.
- `TauCeti.addRestrictedProductOfFinite` with `TauCeti.addRestrictedProductOfFinite_apply`:
  the additive restricted product over a finite index type is the full product.
- `Representation.toSubmodule_range_asAlgebraHom`
  (`TauCeti/RepresentationTheory/AsAlgebraHom.lean`):
  `Subalgebra.toSubmodule ρ.asAlgebraHom.range = Submodule.span R (Set.range ρ)`.

- `TauCeti.RingTheory.DedekindDomain.SInteger.Unit`: `Set.unit_fg`,
  `Set.unit_fg_of_units`, `Set.unitValuation`, `Set.unitValuation_ker` and
  `Set.unitEmptyEquivUnits`. Section R02.3.0c supplies the additive finite-generation,
  cardinality, reindexing and completion adapters on Mathlib's `Set.unit` carrier; the additive
  transport of the supplied multiplicative valuation has coordinates `−ord_v`.

- `TauCeti.ofDiscreteModule`, `TauCeti.DiscreteRep`, `TauCeti.IsSmoothDiscrete`: discrete modules
  as topological representations.
- `TauCeti.InternalHom`, `TauCeti.homAction`, `TauCeti.InternalHom.evalPairing`: the conjugation
  action on `Hom(M, N)` and the evaluation pairing; the pointwise `Hom` of Layer R02.1 agrees with
  it for finite sources (the continuity instance of `InternalHom` assumes a finite discrete source).
- `TauCeti.exists_continuous_section`: normalized continuous sections of profinite quotients.
- `TauCeti.FactorSet` and `TauCeti.FactorSet.Extension`: normalized factor sets and their group
  extensions. Their topology (`TauCeti.FactorSet.Extension.homeomorphProd`,
  `TauCeti.FactorSet.Extension.isTopologicalGroup`,
  `TauCeti.FactorSet.continuous_canonicalSection`, and
  `TauCeti.FactorSet.continuous_rescaleEquiv`, which assumes `ContinuousMul M`), the profinite
  extension `TauCeti.ProfiniteGroupExtension.ofFactorSet` and the classification
  `TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv` (continuous equivalence classes of
  extensions of `G` by a compact abelian group `M` correspond to
  `TauCeti.ContCohomology.H2 G (Additive M)`) are consumed as stated by Layer R02.1.
- `TauCeti.ContCohomology.H1` and `TauCeti.ContCohomology.H2`: continuous crossed homomorphisms and
  continuous `2`-cocycles modulo coboundaries, the low-degree descriptions the compact-coefficient
  comparison supplied by PerfectoidTowers §P9.0 is checked against.
- `TauCeti.ContinuousCohomology.map_eq_id_of_inner`: for smooth discrete coefficients and a locally
  compact group, inner conjugation acts trivially on continuous cohomology in every degree; used for
  the independence of the localisation maps of Layer R02.3.
- `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` and
  `TauCeti.groupCohomology.isZero_of_isZero_sylow`: for a finite group, restriction to a Sylow
  `p`-subgroup is injective on the `p`-primary part of cohomology, and cohomology vanishing on Sylow
  subgroups vanishes; cited by Layer D7.
- `TauCeti.ClassFieldTheory.ClassFormation` with `fundamentalClass`: the class formations of
  ClassFieldTheory Layer 2, from which the `P`-class formations of Layer R02.3 are built.
- `TauCeti.KummerCoeff`, `TauCeti.kummerShortExact`: `μ_n` as a discrete Galois module and the
  Kummer sequence.
- `TauCeti.ClassFieldTheory.dualityMap0_kummerCoeff_bijective`,
  `TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective` and
  `TauCeti.ClassFieldTheory.dualityMap2_kummerCoeff_bijective`, from
  `TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.FiniteModule`: finite local Tate duality
  in degrees `0`, `1`, `2` for every `IsNonarchimedeanLocalField K`, finite discrete continuous
  `G_K`-module killed by `n`, and `IsUnit (n : K)`, including equal characteristic. These use
  explicit low-degree cohomology. Section R02.3.2 transports their coefficient dual, cup products
  and invariant to the canonical cohomology and `ℚ/ℤ` pairing, using
  `TauCeti.ClassFieldTheory.muNRepH2Equiv` and `TauCeti.ClassFieldTheory.h2MuEquivZMod`.
- `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`, `tateCohomologyIsoOdd` and
  `TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`: Tate cohomology of cyclic groups.
- `TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`: Artin's induction
  theorem.
- `TauCeti.traceBilinForm`, `TauCeti.traceBilinForm_nondegenerate`, `TauCeti.slIdeal`,
  `TauCeti.mem_slIdeal_iff`: the trace form of `gl_n`, nondegenerate over every commutative
  semiring, and the trace-zero ideal, which is `ad⁰` in Layers D8 and R02.6 (as a Lie ideal of the
  commutator Lie ring on matrices, a local instance in Tau Ceti and Mathlib; as a Lie subalgebra it
  is Mathlib's `LieAlgebra.SpecialLinear.sl`, `TauCeti.slIdeal_toLieSubalgebra_eq_sl`).
- `TauCeti.Place`, `TauCeti.Place.degree`: places of a function field.

### From TauCetiRoadmap roadmaps

- `HeightsAndUnits` §4.2: the rank identity and the fundamental system with a unique
  torsion-factor/integer-exponent decomposition for number-field S-units on Mathlib's `Set.unit`
  carrier, for finite sets of finite places. Section R02.3.0c consumes these statements.
- `ProfiniteCohomology`: the exported declarations of its §2 table, in particular `TopRep`,
  `continuousCohomology`, `res`, `infl`, `coeffMap`, `continuousFiniteQuotientColimit`,
  `continuousCohomology_preservesFilteredColimits`, `delta`, `longExact_exact`, `transgression`,
  `fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q`, `corestriction`, `corestriction_comp_res`,
  `corestriction_mackey`, `shapiroIso`, `coindAcyclic`, `dimensionShiftIso`, `cup`, `cup_res`,
  `cup_infl`, `cup_projection`, `evalPairing`, `kummerIso`, `hilbert90`, `cd_p`, `scd_p`. These are
  consumed with their stated hypotheses (discrete coefficients). Compact and rational coefficients
  use the cochain comparisons supplied by PerfectoidTowers §P9.0; their arithmetic theory is built
  here.
- `ClassFieldTheory`: `ClassFormation` and its fundamental classes, the Tate–Nakayama
  isomorphisms, the abstract Artin map, the local invariant, `tateDualityPairing_perfect_mixed`,
  `finite_H`, `eulerCharacteristic_mixed`, `cd_p_absoluteGaloisGroup_eq_two`, the local Artin map,
  the global Brauer sequence and the global class formation for number fields.
- `GlobalNumberFields` Layers 1 and 6–8, `NumberFieldArithmetic` Layers 1, 4 and 6, `Chebotarev`
  Layer 10, `ProfiniteProPGroups` Layer 1, `RepresentationTheory/InductionRestriction` Layer 6 and
  `AlgebraicCurves` Layers 3 and 5, and the tori of `ReductiveGroups`, as listed under *Scope and
  ownership*.

### From further roadmaps

| Supplier | Exact interface consumed |
| --- | --- |
| PadicPeriodRings | §0.1: `procyclic_H1_equiv_coinvariants` for discrete torsion, finitely generated `ℤ_p` and finite-dimensional `ℚ_p` coefficients, with its continuity hypotheses, naturality and Checks. |

- `EllipticCurves` Layer 7 *Selmer structures, the Selmer group, and Sha*:
  local conditions and the Selmer kernel for a general discrete Galois module.
  Finite dual local conditions use §§D7.7.1–D7.7.2 here.
- Supplied by EtaleCohomologyFoundations §§F.0.A0, F.0.A2: field fundamental groups,
  the arithmetic fundamental-group sequence and descent, used in §R02.3.0d.
- Supplied by PerfectoidTowers §P9.0: lifting continuous cochains along surjections of discrete
  spaces, inverse-limit cochain comparisons, and the all-degree comparison with Mathlib's
  homogeneous cochains for jointly continuous actions, with quotient topologies on cohomology
  in topological statements and underlying modules in derived categories.
- Supplied by DerivedModuleAlgebra §1.T.1: the tower, shift, `lim`/`lim¹`,
  Mittag–Leffler, six-term and Milnor APIs used by compact continuous cochains.
- Supplied by DerivedModuleAlgebra §S.1: the first-quadrant double-complex spectral sequence,
  with its E₂ identification, abutment filtration, convergence, edge and five-term maps,
  exact-row consequences and naturality.
- Supplied by DerivedModuleAlgebra §1.M.1: Matlis duality for arithmetic coefficients.
- Supplied by EnhancedDerivedSheaves §E1.8.DMA.1: `derivedTensor_affine`, the affine comparison
  of module-derived tensor with SchemeAndStackFoundations §2.18.
- `SchemeAndStackFoundations` Layer 2: §2.21 *Dualising complexes* (`DualizingComplex A ω` for a
  Noetherian ring, with `biduality`; `NormalizedDualizing A ω` for a Noetherian local ring,
  `RHom_A(κ, ω) ≅ κ[0]`); §2.7 *Cohomology with supports and local cohomology*
  (`localCohomology_colimit_ext_comparison`, `localCohomology_module_comparison`); §2.18 *Derived
  categories of quasi-coherent complexes* (`derivedTensor`, `derivedHom`, `DQCoh.affineEquiv`);
  §2.15 (`etale_galois_comparison`: étale cohomology of a field is Galois cohomology); §2.9
  (`Gm`, the multiplicative group as a sheaf on the big site); the big étale site of a scheme is
  Mathlib's `etaleTopology` on schemes over it, as in its conventions.
- `DerivedModuleAlgebra` §0.2 *Derived tensor products on module derived categories*:
  `DerivedDeRham.derivedTensor`, derived extension of scalars, `derivedTensor_flatModel`,
  `derivedTensor_triangulated`. Layer 1: §1.1 *Derived limits of towers*
  (`DerivedDeRham.derivedLimit`, `derivedLimit_surjective`, `derivedLimit_milnor`), using the
  DerivedModuleAlgebra §1.T.1 shift/Milnor calculation with the same `CompactCoefficients.Tower.lim` and
  `CompactCoefficients.Tower.limOne` after forgetting scalars; §1.3 *The derived completion reflector*
  (`DerivedDeRham.derivedCompletion`, `DerivedDeRham.completionUnit`); §1.5 *When ordinary quotient
  towers compute completion* (for a Noetherian ring, the derived completion of a complex with finitely
  generated cohomology has the adic completions of its cohomology modules as cohomology).
- `AbelianSchemesAndArithmeticModuli` Layer A2, §A2.2: `AbelianScheme.dual`, the dual abelian
  scheme with its Poincaré bundle (over a field, the dual abelian variety), and
  `AbelianScheme.dual_elliptic`, the elliptic comparison `a ↦ O([−a] − [0])`.
- `AlgebraicModuliForArithmeticGeometry` Layer 4: banded gerbes and band-preserving morphisms
  (§4.2) and their classification by `H²` of the band, `gerbeClass` (§4.20).
- Supplied by ArithmeticGaloisRepresentations §2.1 / **Decomposition and inertia groups**:
  `GaloisRep.decompositionGroup`, `GaloisRep.inertiaGroup` and the wild inertia group;
  §2.1 / **The local embedding**: `GaloisRep.localEmbeddingMap`;
  §2.1 / **Local restriction**: `GaloisRep.localRestriction` and its change-of-embedding
  isomorphisms. Supplied by ArithmeticGaloisRepresentations §4.4 / **Dickson's theorem**:
  `GL2Subgroup.dickson_projectiveImage`; §4.7 / **Characteristic two**:
  `GL2Subgroup.sl2_submodules_charTwo` for the invariants and submodules, and the target's
  `H¹(SL₂(F₀), M₂(F)) = 0`; §5.13 / **Chebotarev for function fields**.
  Supplied by ArithmeticGaloisRepresentations §7.2 / **The adjoint**: `ContinuousRep.ad`,
  `ContinuousRep.adZero`, `ContinuousRep.adQuot`, `ContinuousRep.tracePairing_perfect`
  (the trace pairing on `ad ρ`); §7.2 / **The trace pairing on matrices**:
  `tracePairing_matrix_perfect` (on `M_n(A)`); §7.7 / **`SL₂` with adjoint coefficients**:
  `ResidualImage.h1_SL2_adZero_eq_zero`; §7.6 / **Projective lifting** for Tate's vanishing.

## How to read the build

Layer R02.1 extends continuous cohomology to compact, rational and torsion coefficients and adds
the continuous algebra (pointwise `Hom`, factor sets, unbalanced products) that the arithmetic
layers use. Layer R02.2 builds the Hochschild–Serre spectral sequence and the transgression. Layer
R02.3 sets up `G_{K,S}`, the localisation maps, the `S`-idele class formation and the
function-field class-field inputs. Layer R02.4 proves the duality theorems for finite and finitely
generated coefficients: Tate's theorem for class formations, Poitou–Tate, finiteness,
cohomological dimension, the Euler characteristic, the function-field forms and the local–global
obstruction groups. Layer D7 then lifts these to the derived category with compact and cofinite
coefficients (it needs the global finite theorems of R02.4, which is why it comes after R02.4
despite its label), and ends with the lattice Poitou–Tate sequences, abelian-variety duality and the dual-local-condition package of D7.7.
Layer R02.5 turns duality into Selmer dimension formulas; Layer D8 does the first-order adjoint
calculations; Layer R02.6 uses
R02.5 and D8 for the patching numerics. Within each layer the targets are listed so that nothing is
used before it is stated.

## Layer R02.1: Compact coefficients, limits and continuous extensions

This layer extends continuous cohomology from discrete coefficients to compact and rational ones,
working throughout with Mathlib's `continuousCohomology`. It uses DerivedModuleAlgebra §1.T.1
for `lim`, `lim¹`, the Mittag-Leffler criterion and the Milnor sequence, and PerfectoidTowers §P9.0
for the inverse-limit and homogeneous–inhomogeneous cochain comparisons; proves Tate's inverse-limit
theorem and the long exact sequences that need a continuous set-theoretic section; treats a lattice
`T`, its rationalisation `V = T ⊗ ℚ_p` and the discrete quotient `W = V/T` separately; and adds
three pieces of continuous algebra: the pointwise `Hom` with its splitting torsor, continuous
factor-set extensions with their Schreier classification, and the unbalanced cochain product of a
group and a quotient. A `lim¹` term is carried explicitly until a Mittag-Leffler argument removes
it, and the completed tensor product is compared with the ordinary one only for finitely generated
modules, where they agree.

### R02.1.1 Tower algebra supplier

Supplied by DerivedModuleAlgebra §1.T.1: `CompactCoefficients.Tower`, its shift,
`Tower.lim`, `Tower.limOne`, Mathlib's Mittag–Leffler condition on the underlying
functor, vanishing of `lim¹` for Mittag–Leffler towers, the six-term sequence and
the Milnor exact sequence for degreewise-surjective towers of complexes.
Arithmetic coefficient comparisons use this algebra with PerfectoidTowers §P9.0's inverse-limit
cochain comparison.

### R02.1.2 Continuous cochains into inverse limits

Supplied by PerfectoidTowers §P9.0: *Lifting continuous cochains along finite surjections*,
*Continuous cochains into an inverse limit*, and *Comparison with the canonical carrier for
compact coefficients*. The comparison requires a jointly continuous action and applies in all
degrees;
topological cohomology carries the quotient topology, and derived comparisons use the underlying
modules.

**Tate's inverse-limit theorem.** Let `G` be profinite and `T = lim T_n` with finite discrete
`G`-modules `T_n` and surjective transitions. Then for every `i > 0` there is a short exact
sequence

```text
0 → lim¹ H^{i−1}(G, T_n) → Hⁱ(G, T) → lim Hⁱ(G, T_n) → 0.
```

In particular `Hⁱ(G, T) = lim Hⁱ(G, T_n)` when every `H^{i−1}(G, T_n)` is finite.

*Proof sketch.* By *Continuous cochains into an inverse limit* (PerfectoidTowers §P9.0),
`C^•(G, T) = lim C^•(G, T_n)` with surjective transitions, and *The Milnor sequence for towers of
complexes* (DerivedModuleAlgebra §1.T.1) gives the short exact sequence. Finite groups
`H^{i−1}(G, T_n)` form a Mittag-Leffler tower
(`Tower.isMittagLeffler_of_finite`), so `lim¹ = 0` ([Rubin, *Euler
Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.3,
printed p. 152 (PDF p. 162)). *Needs:* *Continuous cochains into an inverse limit*
(PerfectoidTowers §P9.0); *The Milnor sequence for towers of complexes* (DerivedModuleAlgebra §1.T.1);
*Mittag-Leffler towers have vanishing `lim¹`* (DerivedModuleAlgebra §1.T.1);
*Comparison with the canonical carrier for compact coefficients* (PerfectoidTowers §P9.0).

**Checks.**

- For `T = ℤ_p(1) = lim μ_{pⁿ}` over a field `K` of characteristic `≠ p` and `i = 1`: the groups
  `H⁰(K, μ_{pⁿ})` are finite, so Kummer theory gives `H¹(K, ℤ_p(1)) = lim K^×/K^{×pⁿ}`.
- For trivial `G` and `i = 1`: `H¹(1, T) = 0`, and indeed `lim¹ T_n = 0` (surjective
  transitions) and `H¹(1, T_n) = 0`.
- For `T = ℤ_p` with trivial action and `i = 1`: `H¹(G, ℤ_p) = Hom_cts(G, ℤ_p) = lim Hom(G, ℤ/pⁿ)`.

**Continuous sections of coefficient surjections.** A continuous surjective homomorphism of
profinite groups has a continuous normalised (identity to identity) set-theoretic section. For
coefficient modules it is applied to a continuous surjective additive homomorphism `T → T''` whose
source and target are profinite as additive groups. An arbitrary continuous surjection of compact
spaces, or even of compact groups, has no such section.

*Proof sketch.* The kernel is closed; Tau Ceti's `exists_continuous_section` gives a normalised
continuous section of the quotient map by it, which is transported along the induced isomorphism
of topological groups ([Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter I, §1,
Exercise 4, p. 11 (PDF p. 25)). *Needs:* Tau Ceti `TauCeti.exists_continuous_section`.

**Checks.**

- The section need not be a homomorphism: `ℤ/4 → ℤ/2` has continuous normalised sections but no
  additive one: `CompactCoefficients.sections_zmod_four_two_isEmpty` states that
  `CompactCoefficients.Sections` of the reduction map is empty.
- Profiniteness is needed: the squaring map `z ↦ z²` of the circle group is a continuous
  surjective homomorphism of compact groups without a continuous section (a continuous square root
  on the circle does not exist).
- The identity homomorphism of a profinite additive group has the identity as its unique
  set-theoretic section, which is continuous and additive.

**Long exact sequences for continuous cohomology.** Let `G` be profinite and `0 → T' → T → T'' → 0`
an exact sequence of topological `G`-modules with jointly continuous actions, in which `T' → T` is
a topological embedding onto a closed subgroup (automatic for compact Hausdorff modules) and
`T → T''` has a continuous set-theoretic section (for instance by *Continuous sections of
coefficient surjections*). Then `0 → C^•(G, T') → C^•(G, T) → C^•(G, T'') → 0` is exact, and there
is a long exact sequence in continuous cohomology, natural in the short exact sequence, which
agrees with Tau Ceti's long exact sequence when all three modules are discrete.

*Proof sketch.* `Cⁱ(G, T) → Cⁱ(G, T'')` is surjective by composing with the section, and
exactness in the middle uses that `T'` carries the subspace topology; the rest is the long exact
sequence of a short exact sequence of complexes ([Rubin, *Euler
Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Definition 2.1,
printed pp. 151–152 (PDF pp. 161–162); [Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §7,
Lemma 2.7.2, p. 137 (PDF p. 154)). *Needs:* *Continuous sections of coefficient surjections*;
*Comparison with the canonical carrier for compact coefficients* (PerfectoidTowers §P9.0);
ProfiniteCohomology Layers 5 and 10
(the long exact sequence through degree two, and in every degree).

**Checks.**

- Without a continuous section the cochain sequence need not be right exact: for `G = ℤ_p` acting
  trivially and the continuous bijection from `ℤ_p` with the discrete topology to `ℤ_p` (kernel
  `0`), the identity `G → ℤ_p` is a continuous `1`-cochain with no continuous lift, since a lift
  would be locally constant on the compact `G` and so have finite image.

### R02.1.3 Lattices, rational and torsion coefficients

**Continuous cochains into `V` land in a lattice.** Let `X` be a compact space, `T` a finite free
`ℤ_p`-module and `V = T ⊗ ℚ_p`. Then every continuous `f : X → V` lands in `p^{−n}T` for some `n`;
hence `C(X, V) = ⋃_n C(X, p^{−n}T) = C(X, T) ⊗ ℚ_p`. With `X = Gⁱ` this gives
`Cⁱ(G, V) = Cⁱ(G, T) ⊗ ℚ_p`.

*Proof sketch.* `f(X)` is compact, hence bounded in the `p`-adic norm, and the lattices `p^{−n}T`
are open and exhaust `V` ([Rubin, *Euler
Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.4,
printed p. 152 (PDF p. 162)). For `T = ℤ_pᵈ` the boundedness step is
`CompactCoefficients.exists_pow_smul_mem_lattice`. *Needs:* nothing beyond Mathlib's `p`-adic
numbers.

**Checks.**

- For `X = ℤ_p` and `T = ℤ_p`, the map `x ↦ x/p` lands in `p^{−1}ℤ_p` and not in `ℤ_p`.
- Compactness is needed: on the discrete noncompact space `ℕ`, the continuous map `n ↦ p^{−n}`
  lands in no `p^{−n}T`.
- For empty `X` both sides are `0`.

**Rationalisation of lattice cohomology.** Let `G` be profinite and `T` a finitely generated
`ℤ_p`-module, with the `p`-adic topology and a continuous `G`-action. Then
`Hⁱ(G, T) ⊗ ℚ_p ≅ Hⁱ(G, T ⊗ ℚ_p)`, and `Hⁱ(G, T)` contains no nonzero divisible subgroup. The
elements of `Hⁱ(G, T)` divisible by every `pⁿ` form the subgroup `∩_n pⁿHⁱ(G, T)`, which for
torsion-free `T` is the term `lim¹ H^{i−1}(G, T/pⁿT)` of the Milnor sequence; it can be nonzero
(Check), and it vanishes, so that `Hⁱ(G, T)` has no nonzero divisible elements, when every
`H^{i−1}(G, T/pⁿT)` is finite.

*Proof sketch.* The torsion submodule of `T` is killed by a power of `p` and contributes nothing
after `⊗ ℚ_p`; for the torsion-free quotient *Continuous cochains into `V` land in a lattice* gives
`C^•(G, V) = C^•(G, T) ⊗ ℚ_p`, and `⊗ ℚ_p` is exact. For torsion-free `T`, the sequences
`0 → T → T → T/pⁿT → 0` (multiplication by `pⁿ`) give `pⁿHⁱ(G, T) = ker(Hⁱ(G, T) → Hⁱ(G, T/pⁿT))`,
so `∩_n pⁿHⁱ(G, T)` is the kernel of `Hⁱ(G, T) → lim Hⁱ(G, T/pⁿT)`, the `lim¹` term of *Tate's
inverse-limit theorem*. That sequence also shows that `Hⁱ(G, T)` is an extension of an inverse limit
of groups killed by `pⁿ` by the `lim¹` of such a tower. Both are weakly `p`-complete in Jannsen's
sense (`Hom` and `Ext¹` from `ℤ[1/p]` into them vanish), this property passes to extensions, and a
weakly `p`-complete group has no nonzero `p`-divisible subgroup, which gives the divisible-subgroup
statement ([Jannsen, *Continuous étale
cohomology*](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf), §4, Proposition 4.8 and
Corollary 4.9, p. 227, Remark 4.14(b), p. 228; [Rubin, *Euler
Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.4,
printed p. 152 (PDF p. 162), which states the result after Tate). *Needs:* *Continuous cochains
into `V` land in a lattice*; *Tate's inverse-limit theorem*; *The six-term sequence of `lim` and `lim¹`* (DerivedModuleAlgebra §1.T.1).

**Checks.**

- For trivial `G` and `i = 0`: `T ⊗ ℚ_p = V`.
- For `G = ℤ_p` and `T = ℤ_p` with trivial action: `H¹(G, ℤ_p) = ℤ_p` and
  `H¹(G, ℚ_p) = Hom_cts(ℤ_p, ℚ_p) = ℚ_p`.
- `V` is not an inverse limit of finite modules: `Hⁱ(G, V)` is the colimit of
  `Hⁱ(G, T) → Hⁱ(G, T) → ⋯` under multiplication by `p`, not a limit.
- Divisible elements need the finiteness hypothesis: for `G = ∏_{j≥1} ℤ/pʲ`, `T = ℤ_p` and `i = 2`,
  the tower `Hom_cts(G, ℤ/pⁿ) = ⊕_j Hom(ℤ/pʲ, ℤ/pⁿ)` consists of countable groups and is not
  Mittag-Leffler (the image of `Hom(G, ℤ/p^{n+k+1})` in `Hom(G, ℤ/pⁿ)` is strictly smaller than that
  of `Hom(G, ℤ/p^{n+k})`, already on the factor `j = n + k`), so
  `∩_n pⁿH²(G, ℤ_p) = lim¹ Hom_cts(G, ℤ/pⁿ) ≠ 0`, although `H²(G, ℤ_p)` has no nonzero divisible
  subgroup.

**Cohomology of the discrete quotient `W = V/T`.** Let `G` be profinite and `T` a finite free
`ℤ_p`-module with continuous `G`-action. Then `W = V/T` with the quotient topology is discrete (`T`
is open in `V`), so it is a discrete torsion `G`-module, and
`Hⁱ(G, W) = colim_n Hⁱ(G, W[pⁿ])` with `W[pⁿ] = p^{−n}T/T ≅ T/pⁿT`.

*Proof sketch.* Cohomology of discrete modules commutes with filtered colimits (ProfiniteCohomology
Layer 4). Write `W = colim_n W[pⁿ]` under inclusions; multiplication by `pⁿ` identifies `W[pⁿ]`
with `T/pⁿT`, the inclusions becoming the maps `T/pⁿT → T/p^{n+1}T` induced by multiplication by
`p` ([Rubin, *Euler Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter I, §2,
Example 2.1, printed p. 3 (PDF p. 13)). *Needs:* *Comparison with the canonical carrier for compact
coefficients* (PerfectoidTowers §P9.0); ProfiniteCohomology Layer 4.

**Checks.**

- For `T = ℤ_p` with trivial action, `W = ℚ_p/ℤ_p` and
  `H¹(G, ℚ_p/ℤ_p) = Hom_cts(G, ℚ_p/ℤ_p) = colim Hom(G, ℤ/pⁿ)`, whereas
  `H¹(G, ℤ_p) = lim Hom(G, ℤ/pⁿ)`: `T` is a limit, `W` a colimit.
- For `T = 0`, also `V = W = 0`, and all these cohomology groups vanish.
- For `T = ℤ_p`, `W[pⁿ] = p^{−n}ℤ_p/ℤ_p`. Under multiplication by `pⁿ`, its
  inclusion into `W[p^{n+1}]` becomes multiplication by `p` from `ℤ/pⁿ` to `ℤ/p^{n+1}`;
  the lattice tower instead uses reduction in the opposite direction.

**The sequence `T → V → W` and the torsion of `H¹(T)`.** Let `G` be profinite and `T` a finite free
`ℤ_p`-module with continuous `G`-action. The sequence `0 → T → V → W → 0` gives an exact sequence
`V^G → W^G → H¹(G, T)_tors → 0`, and `ker(H¹(G, T) → H¹(G, V)) = H¹(G, T)_tors`.

*Proof sketch.* *Long exact sequences for continuous cohomology* applies because `W` is discrete,
so every section `W → V` is continuous, and `T → V` is a closed embedding. By *Rationalisation of
lattice cohomology*, the kernel of `H¹(G, T) → H¹(G, V) = H¹(G, T) ⊗ ℚ_p` is the torsion subgroup
([Rubin, *Euler Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter I, §2,
Lemma 2.2(ii) and its proof, printed pp. 3–4 (PDF pp. 13–14)). *Needs:* *Long exact sequences for
continuous cohomology*; *Rationalisation of lattice cohomology*; *Cohomology of the discrete
quotient `W = V/T`*.

**Checks.**

- `H¹(G, T)` is torsion-free when `W^G` is divisible (for example `W^G = 0`): the image of `V^G` is
  the maximal divisible subgroup of `W^G`.
- For `G = ℤ_p` acting on `T = ℤ_p` through `1 ↦ 1 + p`: `V^G = 0`, `W^G = p^{−1}ℤ_p/ℤ_p ≅ ℤ/p`,
  and `H¹(G, T) = T/(γ − 1)T = ℤ/p` is all torsion.

### R02.1.4 Pointwise `Hom` and the splitting torsor

**Pointwise Hom of discrete modules.** Let `Γ` be profinite and `C`, `A` discrete `Γ`-modules, with
no finiteness condition on `C`. Define `Hom_pt(C, A)` as the group of additive maps `C → A` with the
topology induced from `A^C` (pointwise convergence) and the conjugation action
`(g·u)(c) = g·u(g⁻¹c)`. Evaluation `Hom_pt(C, A) × C → A` is jointly continuous and equivariant, and
the action of `Γ` is jointly continuous. For finitely generated `C` the topology is discrete, and
for finite `C`, `Hom_pt(C, A)` is Tau Ceti's `InternalHom` with `homAction`. No derived-functor (`Ext`)
interpretation is attached to `Hom_pt` when its topology is not discrete.

The API:

- `CompactCoefficients.HomPt`: `Hom(C, A)` with the pointwise topology.
- `CompactCoefficients.continuous_eval`: evaluation `Hom_pt(C, A) × C → A` is jointly continuous
  when `C` is discrete.
- `CompactCoefficients.discreteTopology_of_fg`: finitely generated `C` gives the discrete topology.
- `CompactCoefficients.homPt_equiv_internalHom`: for finite `C`, `Hom_pt(C, A)` is Tau Ceti's
  internal Hom with `homAction`.

*Proof sketch.* The topology is induced from the product; evaluation is continuous because the
projections are; for finitely generated `C`, evaluation at finitely many generators isolates `0`
([Harpaz–Wittenberg, *The Massey vanishing conjecture for number
fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §5, Lemma 5.5, p. 19
(author final version)). *Needs:* Tau Ceti `TauCeti.homAction`.

**Checks.**

- For discrete `A`, evaluation at `1` identifies `Hom_pt(ℤ, A)` with `A` as a
  topological additive group.
- Evaluation at the two basis vectors identifies `Hom_pt(ℤ², A)`
  with `A²`, with its product topology; it is discrete for discrete `A`.
- For the zero source, `Hom_pt(0, A) = 0`.
- `CompactCoefficients.homPt_not_discrete`: for `C = ⊕_ℕ 𝔽₂`, `Hom_pt(C, 𝔽₂) = 𝔽₂^ℕ`
  with the product topology, which is not discrete.

**The splitting torsor.** Let `Γ` be profinite and `0 → A → B → C → 0` an exact sequence of
discrete `Γ`-modules (jointly continuous actions) that splits additively. Then the additive
sections form a continuous affine `Hom_pt(C, A)`-torsor, with `Γ` acting by conjugation, where
`Hom_pt` carries the pointwise topology and not the discrete one. A section `s` gives the
continuous `1`-cocycle `γ(g) = g s g⁻¹ − s` with values in `Hom_pt(C, A)`; replacing `s` by `s + u`
changes `γ` by `d⁰u`; and the class `[γ] ∈ H¹(Γ, Hom_pt(C, A))` vanishes if and only if there is a
`Γ`-equivariant additive section.

The API:

- `CompactCoefficients.Sections`: the set of additive sections.
- `CompactCoefficients.sections_sub_mem_ker`: two sections differ by a map `C → A`.
- `CompactCoefficients.sections_nonempty_iff`: the set is nonempty if and only if the sequence
  splits additively.
- `CompactCoefficients.splittingClass`: the class `[γ] ∈ H¹(Γ, Hom_pt(C, A))`.
- `CompactCoefficients.splittingClass_eq_zero_iff`: `[γ] = 0` if and only if an equivariant section
  exists.
- `CompactCoefficients.pointwiseHomRepresentation`: the conjugation representation on
  `Hom_pt(C, A)`.
- `CompactCoefficients.pointwiseHomRepresentation_apply`: the action is `(g·f)(c) = g·f(g⁻¹·c)`.

*Proof sketch.* Two sections differ by a map `C → A`; conjugation preserves sections; the cocycle
identity `γ(gh) = γ(g) + g·γ(h)` is formal; continuity of `γ` into `Hom_pt` is continuity of each
`g ↦ γ(g)(c)`, which holds because `B` and `C` are discrete ([Harpaz–Wittenberg, *The Massey
vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf),
§5, Lemma 5.5, p. 19 (author final version); the source uses the discrete topology on `Hom(C, A)`,
which is correct only for finitely generated `C`). *Needs:* *Pointwise Hom of discrete modules*.

**Checks.**

- `torsor_equivariant_split`: an equivariant splitting gives the zero class in
  `H¹(Γ, Hom_pt(C, A))`.
- `torsor_zero_class`: if `A = 0`, the only section is the inverse of `B ≅ C` and its splitting
  class is zero.
- `torsor_discrete_fails`: for `Γ = 𝔽₂^ℕ`, `C = ⊕_ℕ 𝔽₂`, `A = 𝔽₂` with trivial actions and
  `B = A ⊕ C` with `g·(a, c) = (a + Σ gᵢcᵢ, c)`, the section `c ↦ (0, c)` gives
  `γ(g) = (c ↦ Σ gᵢcᵢ)`, a homeomorphism `Γ → Hom_pt(C, A) = 𝔽₂^ℕ`; it is not continuous into
  `Hom(C, A)` with the discrete topology, since its image is infinite and `Γ` is compact.

**The connecting map is cup product with the torsor class.** In the situation of *The splitting
torsor*, with cup products on continuous cochains formed with the jointly continuous evaluation
pairing `Hom_pt(C, A) × C → A`: for every `m ≥ 0` and continuous `m`-cocycle `c` with values in `C`,
`s ∘ c` is a continuous cochain with

```text
d(s ∘ c)(g₀, …, g_m) = γ(g₀)(g₀·c(g₁, …, g_m)),
```

so the connecting map `Hᵐ(Γ, C) → H^{m+1}(Γ, A)` is `∂[c] = [γ ∪ c]`. For finitely generated `C`
this is the formula with the discrete `Hom` and Tau Ceti's discrete cup product (*Finitely
generated `C`: the discrete case*).

*Proof sketch.* Direct computation on inhomogeneous cochains: `d(s ∘ c) − s ∘ dc` collects to
`(g₀ s g₀⁻¹ − s)(g₀·c(g₁, …, g_m))`, and `dc = 0`; no `Ext` interpretation is used
([Harpaz–Wittenberg, *The Massey vanishing conjecture for number
fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §5, Lemma 5.5, p. 19
(author final version)). *Needs:* *The splitting torsor*; *Pointwise Hom of discrete modules*;
*Long exact sequences for continuous cohomology*; ProfiniteCohomology Layers 10 and 12.

**Checks.**

- For `m = 0` and `c ∈ C^Γ`, the formula reads `∂c = (g ↦ g·s(c) − s(c)) = (g ↦ γ(g)(c))`, the
  usual connecting map on invariants.

**Finitely generated `C`: the discrete case.** If `C` is finitely generated as an abelian group, then
`Hom_pt(C, A)` is discrete, the splitting class lies in the cohomology `H¹(Γ, Hom(C, A))` of a
discrete module, and *The connecting map is cup product with the torsor class* holds with the
discrete `Hom` and the discrete cup product. This covers finite `C`, the case of every application
of Harpaz–Wittenberg's Lemma 5.5, whose printed statement is correct exactly in this generality.

*Proof sketch.* By `discreteTopology_of_fg` the continuous cochains of the discrete module
`Hom(C, A)` are those of `Hom_pt(C, A)` ([Harpaz–Wittenberg, *The Massey vanishing conjecture for
number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §5, Lemma 5.5,
p. 19 (author final version)). *Needs:* *Pointwise Hom of discrete modules*; *The connecting map is
cup product with the torsor class*.

**Checks.**

- For `Γ = ℤ/2` acting on `B = 𝔽₂²` by `σ = [[1, 1], [0, 1]]`, `A = 𝔽₂e₁` and `C = B/A`: the section
  `c̄ ↦ e₂` gives `γ(σ) = id ∈ Hom(C, A) = 𝔽₂`, so `[γ]` is the nonzero element of
  `H¹(ℤ/2, 𝔽₂)`; `B` has no equivariant splitting, and `∂ : C^Γ = 𝔽₂ → H¹(Γ, A) = 𝔽₂` is an
  isomorphism, matching `B^Γ = A`.

**Continuous Hom from a profinite source.** Let `Γ` be profinite, `P` a profinite abelian group with
a jointly continuous `Γ`-action and `A` a discrete `Γ`-module with jointly continuous action. Write
`Hom_cts(P, A)` for Mathlib's `ContinuousAddMonoidHom P A` (`P →ₜ+ A`) with its compact-open
topology. This topology is discrete. The conjugation action `(g·f)(x) = g·f(g⁻¹x)` sends continuous
homomorphisms to continuous homomorphisms and makes `Hom_cts(P, A)` a discrete `Γ`-module with
jointly continuous action, and `Hom_cts(P, A)` is the union, over the `Γ`-stable open subgroups
`W ⊆ P`, of the groups `Hom(P/W, A)` of the finite quotients. Evaluation `P × Hom_cts(P, A) → A` is
jointly continuous (Mathlib's `ContinuousEval` instance on `ContinuousAddMonoidHom`) and
equivariant, so the cup product of inhomogeneous cochains formed with it,

```text
Cⁱ_cts(Γ, P) × Cʲ_cts(Γ, Hom_cts(P, A)) → C^{i+j}_cts(Γ, A),
```

takes continuous cochains to continuous cochains, satisfies `d(a ∪ b) = da ∪ b + (−1)ⁱ a ∪ db`, and
induces `Hⁱ(Γ, P) × Hʲ(Γ, Hom_cts(P, A)) → H^{i+j}(Γ, A)` on Mathlib's `continuousCohomology`, the
compact coefficient `P` entering through *Comparison with the canonical carrier for compact
coefficients* (PerfectoidTowers §P9.0). If `G` is profinite, `H` a closed normal subgroup acting
trivially on `A`, and
`H^ab = H/H′` (`H′` the closure of the commutator subgroup) carries the conjugation action of
`G/H`, then `H¹(H, A) ≅ Hom_cts(H^ab, A)` as discrete `G/H`-modules, compatibly with
`H¹(H, A) = colim_U H¹(H/(H ∩ U), A)` over the open normal subgroups `U` of `G`. For infinite `P`
neither the algebraic `Hom(P, A)` nor the topology of pointwise convergence can replace
`Hom_cts(P, A)` with its compact-open topology (Checks).

The API:

- `CompactCoefficients.discreteTopology_continuousAddMonoidHom`: for compact `P` and discrete `A`,
  the compact-open topology on `P →ₜ+ A` is discrete.
- `CompactCoefficients.continuousHomRepresentation`: the conjugation action on `Hom_cts(P, A)`, a
  discrete module with jointly continuous action.
- `CompactCoefficients.continuousHomCup`: the cup product formed with the evaluation pairing.
- `CompactCoefficients.h1Equiv_continuousHom`: `H¹(H, A) ≅ Hom_cts(H^ab, A)` as `G/H`-modules for
  `H` acting trivially on `A`.

*Proof sketch.* `ContinuousMap.discreteTopology` gives `C(P, A)` the discrete topology, and
`P →ₜ+ A` carries the topology induced by `ContinuousAddMonoidHom.toContinuousMap`. By
compactness of `Γ` every open subgroup of `P` contains a `Γ`-stable one; a continuous homomorphism
factors through such a finite quotient and takes finitely many values, so its stabiliser is open. Continuity of the product cochains is joint continuity of
evaluation composed with continuous cochains; the Leibniz rule is the computation of
ProfiniteCohomology Layer 12 with this pairing. With trivial action the continuous `1`-cocycles on
`H` are the continuous homomorphisms `H → A`, which factor through `H^ab`; the conjugation action of
`G/H` on `H¹(H, A)` is the conjugation action on `Hom_cts(H^ab, A)`, and the finite levels are
compared by inflation (ProfiniteCohomology Layer 4). ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Notations and Conventions, p. vii (PDF
p. 7): the continuous dual of a profinite abelian group is a discrete torsion group;
[Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4, Theorem
2.4.4, printed p. 114 (PDF p. 131), which uses `H¹(H, A) = Hom(H^ab, A)` with continuous
homomorphisms; Mathlib `Topology/Algebra/Group/CompactOpen.lean` for the compact-open topology on
`ContinuousAddMonoidHom`.) *Needs:* *Comparison with the canonical carrier for compact
coefficients* (PerfectoidTowers §P9.0); *Pointwise Hom of discrete modules*; ProfiniteCohomology
Layers 4 and 12; Mathlib
`ContinuousAddMonoidHom`; Tau Ceti `ContinuousMap.discreteTopology`.

**Checks.**

- For finite `P`, `Hom_cts(P, A)` is `Hom_pt(P, A)` with its discrete topology, and the cup product
  is the discrete one of *Finitely generated `C`: the discrete case*.
- For `P = ∏_ℕ 𝔽₂` and `A = 𝔽₂` with trivial actions, `Hom_cts(P, A) = ⊕_ℕ 𝔽₂` consists of the
  linear forms that depend on finitely many coordinates, while the algebraic `Hom(P, 𝔽₂)`, the full
  linear dual of an infinite-dimensional space, is strictly larger.
- In the same example the topology of pointwise convergence on `Hom_cts(P, A)` is not discrete: a
  basic neighbourhood of `0` imposes finitely many conditions `f(x₁) = ⋯ = f(x_k) = 0` and so contains
  an infinite-dimensional subspace of `⊕_ℕ 𝔽₂`.
- For `G = H = ℤ_p` and `A = ℤ/p`, `H¹(ℤ_p, ℤ/p) = Hom_cts(ℤ_p, ℤ/p) ≅ ℤ/p`.

### R02.1.5 Completed tensor products, continuous extensions and unbalanced products

**Completed tensor products and finite reductions.** Let `R` be a complete Noetherian local ring
with maximal ideal `m`, and `T`, `M` finitely generated `R`-modules with their `m`-adic topologies
(hence complete). Then `T ⊗̂_R M` is Mathlib's `m`-adic completion (`AdicCompletion`) of
`T ⊗_R M`, and it is canonically `lim_n (T/mⁿT ⊗_{R/mⁿ} M/mⁿM)`; each reduction
`(T ⊗_R M)/mⁿ` is the tensor product over `R/mⁿ` of the reductions. Since `T ⊗_R M` is finitely
generated, it is already complete and `T ⊗ M → T ⊗̂ M` is an isomorphism. If `T` is finite
projective, `T ⊗_R M` is complete for every `m`-adically complete `M`. The identification with the
ordinary tensor product is not made for modules that are not finitely generated.

*Proof sketch.* Apply the universal property of adic completion to `T ⊗ M`. Compute the reductions
by right exactness of the tensor product; finite generation makes completion agree with the
inverse limit of the reductions. For projective `T`, write it as a direct summand of a finite free
module and use completeness of `M` ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§2.1–2.3, pp. 51–53;
§§3.1–3.2, pp. 75–78; §4.1, pp. 95–96; [Nakamura, *Zeta morphisms for rank two universal
deformations*](https://arxiv.org/pdf/2006.13647), Appendix B, Lemmas B.29–B.31, author
pp. 104–106; journal pp. 285–288). *Needs:* *`lim` and `lim¹` of a tower* (DerivedModuleAlgebra §1.T.1); Mathlib `AdicCompletion`.

**Checks.**

- `T = R` gives `M`, and the reduction at `mⁿ` is `M/mⁿM`.
- The zero module stays zero.
- Finite generation is needed: for `R = ℤ_p`, `T = R` and `M = ⊕_ℕ ℤ_p`, the ordinary tensor
  product `M` is not complete; its completion is the module of sequences tending to `0`.

**Continuous topology on factor-set extensions.** Let `G` be profinite, `M` an abelian profinite
group with a jointly continuous `G`-action, and `α` a normalised factor set that is jointly
continuous. Tau Ceti's `FactorSet.Extension` of `G` by `M` with factor set `α`, with the product
topology transported from `M × G`, is a profinite group: its operations and its canonical section
are continuous and rescaling is a homeomorphism. All of this is in Tau Ceti and is cited, not
rebuilt: `TauCeti.FactorSet.Extension.homeomorphProd`,
`TauCeti.FactorSet.Extension.isTopologicalGroup`,
`TauCeti.FactorSet.continuous_canonicalSection`,
`TauCeti.FactorSet.continuous_rescaleEquiv` and the profinite extension
`TauCeti.ProfiniteGroupExtension.ofFactorSet`. What is built here is the class of `α` in Mathlib's
continuous cohomology: read as a continuous inhomogeneous `2`-cocycle with values in the compact
module `M`, `α` defines a class in `H²(G, M)` (`continuousCohomology 2`) through *Comparison with
the canonical carrier for compact coefficients* (PerfectoidTowers §P9.0); the class depends only on
`α` up to rescaling, and
it is the class of the extension in `TauCeti.ContCohomology.H2` under the same comparison.

The API:

- `CompactCoefficients.factorSetClass`: the class of `α` in `H²(G, M)` of `continuousCohomology`.
- `CompactCoefficients.factorSetClass_rescale`: factor sets related by Tau Ceti's rescaling have the
  same class.
- `CompactCoefficients.factorSetClass_eq_extensionClass`: the class agrees, under the degree-two
  comparison, with the class in `TauCeti.ContCohomology.H2` of `ProfiniteGroupExtension.ofFactorSet`.
- `CompactCoefficients.factorSetClass_eq_zero_iff`: the class vanishes exactly when `α` is the
  coboundary of a continuous normalised `1`-cochain, that is, when the extension has a continuous
  homomorphic section.

*Proof sketch.* The topology and its continuity properties are the cited Tau Ceti declarations.
Compare the factor set and its class with `α` through the comparison between inhomogeneous and
homogeneous cochains, using the coefficient maps and naturality of rescaling ([Kaletha, *Rigid inner
forms of real and p-adic groups*](https://arxiv.org/pdf/1304.3292v5), §3.2, pp. 10–12, citing NSW
Theorem 2.7.7; [Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §2.7, Theorem 2.7.7, pp.
142–143). *Needs:* *Comparison with the canonical carrier for compact coefficients*
(PerfectoidTowers §P9.0); Tau Ceti
`TauCeti.FactorSet`; Tau Ceti `TauCeti.FactorSet.Extension`; Tau Ceti
`TauCeti.FactorSet.Extension.homeomorphProd`, `TauCeti.FactorSet.Extension.isTopologicalGroup`,
`TauCeti.FactorSet.continuous_canonicalSection`,
`TauCeti.FactorSet.continuous_rescaleEquiv` and `TauCeti.ProfiniteGroupExtension.ofFactorSet`.

**Checks.**

- `factor_trivial_product`: trivial action and trivial factor set give `M × G` with the product
  topology, and the class `0`.
- `factor_zero_kernel`: for `M = 0` the extension is `G` itself and `H²(G, 0) = 0`.
- For the trivial factor set and a nontrivial action the extension is `M ⋊ G` with the product
  topology, and the class is `0`.
- For `G = M = ℤ/2` with trivial action, the factor set with `α(σ, σ) = 1` and all other values `0`
  gives `ℤ/4` and the nonzero class of `H²(ℤ/2, ℤ/2) ≅ ℤ/2`; a definition that ignored `α` would
  give `0`.
- A discontinuous factor set is excluded even though it defines an abstract group: for
  `G = 𝔽₂^ℕ`, `M = 𝔽₂` and a discontinuous homomorphism `φ : G → 𝔽₂`, `α(g, h) = φ(g)φ(h)` is a
  `2`-cocycle, but multiplication on `M × G` is not continuous.

**Continuous Schreier classification and automorphisms.** Let `G` and `M` be profinite, `M` abelian
with a given continuous `G`-action, and consider extensions `1 → M → E → G → 1` whose maps are
continuous and topologically exact (`M → E` a closed embedding, `E → G` a quotient map); the
topology on `E` and the given action are part of the equivalence relation. Tau Ceti's
`ProfiniteGroupExtension.contCohomologyClassEquiv` identifies continuous equivalence classes of such
extensions with `TauCeti.ContCohomology.H2`; transport it to the compact-coefficient `H²` of
`continuousCohomology` by *Comparison with the canonical carrier for compact coefficients*
(PerfectoidTowers §P9.0). In
addition, the automorphisms of `E` inducing the identity on `M` and on `G` correspond to continuous
`1`-cocycles `Z¹(G, M)`, and their quotient by conjugation by elements of `M` is `H¹(G, M)`. No
finiteness or countability assumption on `G` or `M` is needed, since continuous normalised sections
of profinite quotient maps always exist.

*Proof sketch.* The equivalence, the realisation theorem and the splitting criterion are in Tau Ceti
(`TauCeti.ProfiniteGroupExtension.contCohomologyClassEquiv` and the surrounding results), cited and
not rebuilt, including independence of the chosen normalised section; *Comparison with the canonical
carrier for compact coefficients* (PerfectoidTowers §P9.0) transports the class to
`continuousCohomology`. For an
automorphism `σ` over both ends, `f(g) = σ(s(g))s(g)⁻¹` satisfies the continuous cocycle identity,
and `σ` is recovered from `f` in the product coordinates; conjugation by `m ∈ M` changes `f` by the
coboundary of `m` ([Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §2.7, Theorem 2.7.7, pp.
142–143; [Kaletha, *Rigid inner forms of real and p-adic
groups*](https://arxiv.org/pdf/1304.3292v5), §3.2, pp. 10–12). *Needs:* *Continuous topology on
factor-set extensions*; *Comparison with the canonical carrier for compact coefficients*
(PerfectoidTowers §P9.0); Tau Ceti
`TauCeti.exists_continuous_section`.

**Checks.**

- A split extension has class zero.
- For a central split extension the automorphisms over both ends are the continuous homomorphisms
  `G → M`.
- `1 → ℤ/2 → ℤ/4 → ℤ/2 → 1` has the nonzero class of `H²(ℤ/2, ℤ/2) ≅ ℤ/2`, while `ℤ/2 × ℤ/2` has
  class zero; the automorphisms of `ℤ/4` over both ends are `x ↦ ±x`, matching
  `Hom(ℤ/2, ℤ/2) = ℤ/2`.

**Unbalanced cochain products.** Let `Δ → Θ` be a surjection of finite groups, `A` a `Δ`-module, `B`
a `Θ`-module, and `A ⊗ B` the tensor product with the diagonal `Δ`-action, `B` inflated from `Θ`.
For integers `i > j′ ≥ j ≥ 0`, let `C^{i,j′}(Δ, A)` be the degree-`i` cochains whose last `j′`
variables factor through `Θ`. For `j > 0`, cochains `C^{−j}(Θ, B)` are those of the complete
(Tate) resolution of `Θ`, not ordinary cochains. There is a contraction product

```text
C^{i,j′}(Δ, A) × C^{−j}(Θ, B) → C^{i−j, j′−j}(Δ, A ⊗ B),   (f, g) ↦ f ⊔ g,
```

obtained by summing over the `j` quotient variables (Kaletha §4.3), and at `j = 0` it is the
ordinary cup product. For `i > j′ ≥ j > 0` it satisfies
`d(f ⊔ g) = df ⊔ g + (−1)ⁱ f ⊔ dg` and is compatible with the quotient maps. At `j = 0`
no further differential identity is asserted. No assertion is made outside `i > j′ ≥ j ≥ 0`.

The API:

- `ArithmeticDuality.quotientFactoringCochains`: the submodule of cochains whose last variables
  factor through `Θ`.
- `ArithmeticDuality.unbalancedProduct`: the finite contraction product in the range
  `i > j′ ≥ j ≥ 0`.
- `ArithmeticDuality.unbalancedProduct_leibniz`: the differential identity for `j > 0`.
- `ArithmeticDuality.unbalancedProduct_zeroDegree`: at `j = 0` it is the ordinary cup product.
- `ArithmeticDuality.factoringDifferential`: `d` preserves the condition on the last `j`
  variables for `j < i`; the case `j = i` is excluded.
- `ArithmeticDuality.productTensorIso`: identification of the coefficients `A ⊗ B` with the tensor
  product of representations.
- `ArithmeticDuality.unbalancedProduct_one`: in degree `−1`, `f ⊔ g` is the sum over `a ∈ Θ` of
  `f(g₁, …, gₙ, s(a)) ⊗ (π(g₁⋯gₙ)a)·b`, independent of the chosen lifts `s`.

*Proof sketch.* Define the factoring submodule inside the inhomogeneous cochains and take the
negative terms from the complete resolution. Write the finite summation formula and prove
independence of the lifts from the factoring condition. Expand the differentials and cancel
consecutive terms; the surviving boundary terms give the displayed Leibniz sign ([Kaletha, *Rigid
inner forms of real and p-adic groups*](https://arxiv.org/pdf/1304.3292v5), §4.3, pp. 19–20,
product formula and differential identity). *Needs:* *Comparison with the canonical carrier for
compact coefficients* (PerfectoidTowers §P9.0); ProfiniteCohomology Layer 12; Mathlib
`tateCohomology`.

**Checks.**

- `unbalanced_zero`: a zero input gives zero output.
- `unbalanced_ordinary`: at `j = 0` the product agrees with the ordinary cup product.
- `unbalanced_odd_sign`: for `i = 3` the second term of the differential has coefficient `−1`.
- The sum is over `Θ`, not over `Δ`: summing over `Δ` multiplies the result by
  `|ker(Δ → Θ)|`, for example by `2` for `ℤ/4 → ℤ/2`, which kills it on `2`-torsion coefficients.

### Examples

- The tower `ℤ ←p ℤ ←p ⋯` has `lim = 0` and `lim¹ ≅ ℤ_p/ℤ ≠ 0`, while `ℤ/p^{n+1} ↠ ℤ/pⁿ` has
  `lim = ℤ_p` and `lim¹ = 0`: surjective transitions are Mittag-Leffler, multiplication by `p` is not.
- For `G` profinite and `T = ℤ_p` with trivial action, `H¹(G, ℤ_p) = Hom_cts(G, ℤ_p) = lim H¹(G, ℤ/pⁿ)`
  by Tate's inverse-limit theorem, since the groups `H⁰(G, ℤ/pⁿ) = ℤ/pⁿ` form a Mittag-Leffler
  tower; `H¹(G, ℚ_p) = H¹(G, ℤ_p) ⊗ ℚ_p` by rationalisation.
- For `C = ⊕_ℕ 𝔽₂` the pointwise topology on `Hom(C, 𝔽₂) = 𝔽₂^ℕ` is the product topology, not the
  discrete one; with the discrete topology the splitting cocycle of Harpaz–Wittenberg's Lemma 5.5
  is not continuous, which is why the pointwise `Hom` is used.

### Dependencies

- DerivedModuleAlgebra: §1.T.1 (tower algebra and Milnor).
- PerfectoidTowers: §P9.0 (continuous cochains and their comparison with the canonical carrier).
- TauCetiRoadmap ProfiniteCohomology: Layers 3, 4, 5, 10, 12.
- Libraries: Mathlib `CategoryTheory.Functor.IsMittagLeffler`, Mathlib `continuous_pi_iff`,
  Mathlib `continuousCohomology`, Tau Ceti `TauCeti.exists_continuous_section`, Tau Ceti
  `TauCeti.homAction`, Mathlib `AdicCompletion`, Tau Ceti `TauCeti.FactorSet`, Tau Ceti
  `TauCeti.FactorSet.Extension`, Mathlib `tateCohomology`, Mathlib `ContinuousAddMonoidHom`.

## Layer R02.2: The Hochschild–Serre spectral sequence, transgression and residue maps

TauCetiRoadmap ProfiniteCohomology constructs the five-term inflation–restriction–transgression
sequence. This layer builds the full Hochschild–Serre spectral sequence of a closed normal subgroup
of a profinite group with discrete coefficients, using the first-quadrant double-complex
spectral sequence supplied by DerivedModuleAlgebra §S.1, and identifies its edge maps with inflation and restriction, its low-degree sequence
with ProfiniteCohomology's explicit five-term sequence, and its second differential with the
transgression. It then proves the consequences: degeneration when the quotient has cohomological
dimension at most one, descent along open subgroups of index prime to the coefficients,
inflation–restriction for compact and rational coefficients, the transgression as a cup product
with the extension class and its compatibility with norms, and the residue sequences of
Laurent-series fields. The spectral sequence for compact coefficients, built from derived
relative invariants, is *Relative compact Hochschild–Serre* (Layer D7).

### R02.2.1 The Hochschild–Serre spectral sequence

Supplied by DerivedModuleAlgebra §S.1: the first-quadrant double-complex spectral sequence,
its E₂ identification, abutment filtration, convergence, edge maps, five-term sequence,
exact-row consequences and naturality.

**The Hochschild–Serre spectral sequence.** Let `G` be a profinite group, `H` a closed normal
subgroup and `A` a discrete `G`-module, with jointly continuous action (a smooth discrete
representation; continuity of each operator separately, as in `TopRep`, is not enough). There is a
first-quadrant spectral sequence

```text
E₂^{pq} = Hᵖ(G/H, H^q(H, A)) ⇒ H^{p+q}(G, A),
```

natural in `A`, whose edge morphisms `Hⁿ(G/H, A^H) → Hⁿ(G, A) → Hⁿ(H, A)^{G/H}` are inflation and
restriction. For an open subgroup `G′` with `H′ = H ∩ G′`, restriction and corestriction are
morphisms of spectral sequences between `E(G, H, A)` and `E(G′, H′, A)`. A pairing `A × B → C`
gives cup products `E_r^{pq}(A) × E_r^{p′q′}(B) → E_r^{p+p′,q+q′}(C)` with
`d_r(α ∪ β) = d_rα ∪ β + (−1)^{p+q} α ∪ d_rβ`. For compact coefficients see *Inflation–restriction
for compact and rational coefficients*.

The API:

- `HochschildSerre.spectralSequence`: `E(G, H, A)` with `E₂^{pq} = Hᵖ(G/H, H^q(H, A))`.
- `HochschildSerre.abutmentIso`: the abutment is `Hⁿ(G, A)` (`continuousCohomology`).
- `HochschildSerre.edgeBottom_eq_inflation`: the bottom edge map is inflation.
- `HochschildSerre.edgeLeft_eq_restriction`: the left edge map is restriction.
- `HochschildSerre.map`: naturality in the discrete `G`-module `A`.
- `HochschildSerre.res`: for any open subgroup `G′ ≤ G`, with `H′ = H ∩ G′`, restriction gives a
  morphism `E(G, H, A) → E(G′, H′, A)`, agreeing with restriction on the abutment.
- `HochschildSerre.cor`: for the same open subgroup, corestriction gives a morphism
  `E(G′, H′, A) → E(G, H, A)`, agreeing with corestriction on the abutment.
- `HochschildSerre.cup`: an equivariant bilinear pairing of coefficients gives products on each
  page `r ≥ 2`, satisfying the graded Leibniz rule, the product on `E_{r+1}` being induced by the
  one on `E_r`.

*Proof sketch.* Apply `H⁰(H, −)` to the standard resolution `A → X^•(G, A)` by induced modules, and
form the double complex `C^{pq} = Cᵖ(G/H, H⁰(H, X^q))` with `d′` the cochain differential and
`d″ = (−1)ᵖ` times the differential of `X^•` (*The spectral sequence of a first-quadrant double
complex* (DerivedModuleAlgebra §S.1)). Since `Cᵖ(G/H, −)` is exact on discrete modules, the vertical cohomology is
`Cᵖ(G/H, H^q(H, A))` and `E₂^{pq} = Hᵖ(G/H, H^q(H, A))`. The rows are exact in positive degrees
because each `H⁰(H, X^q)` is an induced `G/H`-module (ProfiniteCohomology Layer 7), so by the
exact-rows statement the abutment is `Hⁿ(X^•(G, A)^G) = Hⁿ(G, A)`, the homogeneous continuous-cochain
cohomology, which is Mathlib's `continuousCohomology` for discrete `A` (ProfiniteCohomology
Layers 3 and 10). The edge maps, the morphisms along `(G′, H′)` and the cup products are checked on
the double complex (NSW II §4, Exercises 1, 3 and 5) ([Neukirch–Schmidt–Wingberg, *Cohomology of
Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4,
Theorem 2.4.1, printed p. 111 (PDF p. 128); [Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4,
Exercises 1, 3, 5, printed p. 119 (PDF p. 136)). *Needs:* *The spectral sequence of a
first-quadrant double complex* (DerivedModuleAlgebra §S.1); ProfiniteCohomology Layers 3, 7, 10 and 12; Mathlib
`continuousCohomology`.

**Checks.**

- `trivial_subgroup`: for `H = 1`, `E₂^{p0} = Hᵖ(G, A)` and `E₂^{pq} = 0` for `q > 0` (a single
  row).
- `whole_group`: for `H = G`, `E₂^{0q} = H^q(G, A)` and `E₂^{pq} = 0` for `p > 0` (a single column).
- `z4_nondegenerate`: for `G = ℤ/4`, `H = 2ℤ/4` and `A = 𝔽₂`, the differential
  `d₂^{0,1} : H¹(H, 𝔽₂) → H²(G/H, 𝔽₂)` is nonzero, being minus the class of the non-split extension
  `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0` (*d₂ as cup product with the extension class*); so `E₂ ≠ E_∞`.
- For `G = G₁ × H` with `G₁` acting trivially on `A`, the spectral sequence degenerates at `E₂`
  (NSW (2.4.6)).

**Degeneration of the Hochschild–Serre spectral sequence.** Let `G`, `H` and `A` be as in *The
Hochschild–Serre spectral sequence*.

1. If `H^q(H, A) = 0` for all `q > 0`, then inflation `Hⁿ(G/H, A^H) → Hⁿ(G, A)` is an isomorphism.
2. If `1 → H → G → G/H → 1` splits and `H` acts trivially on `A`, then inflation
   `H^*(G/H, A) → H^*(G, A)` is a split injection and every differential into the bottom row
   vanishes.
3. If `G = G₁ × H` with `G₁` acting trivially on the `H`-module `A`, the spectral sequence
   degenerates at `E₂` and `Hⁿ(G, A) ≅ ⊕_{p+q=n} Hᵖ(G₁, H^q(H, A))`; this isomorphism is not
   canonical and is not claimed to be functorial in `A`.
4. If `H^q(H, A) = 0` for `q > 1`, there is a long exact sequence
   ```text
   ⋯ → Hⁿ(G/H, A^H) → Hⁿ(G, A) → H^{n−1}(G/H, H¹(H, A)) → H^{n+1}(G/H, A^H) → ⋯.
   ```
   If `A` is a torsion module and `cd(G/H) ≤ 1`, then for `n ≥ 1` the sequence
   `0 → H¹(G/H, H^{n−1}(H, A)) → Hⁿ(G, A) → Hⁿ(H, A)^{G/H} → 0` is exact.

*Proof sketch.* (1) All rows except `q = 0` vanish. (2) The splitting makes the bottom edge maps
split injections, so `E₂^{*,0} = E_∞^{*,0}` and the differentials `d_r^{*,r−1}` into the bottom row
vanish (NSW (2.4.5)). (3) For trivial `G₁`-coefficients `C^•(G₁, B) ≅ C^•(G₁, ℤ) ⊗ B`, so the double
complex is a tensor product with a complex of flat `ℤ`-modules, and the Künneth argument
degenerates it (NSW (2.4.6), after Jannsen). (4) Two nonzero rows, or, when `cd(G/H) ≤ 1` and `A` is
torsion, two nonzero columns (ProfiniteCohomology Layer 11), in *The spectral sequence of a
first-quadrant double complex* (DerivedModuleAlgebra §S.1) (NSW II §4, Exercise 4; Lemma 2.1.3) ([Neukirch–Schmidt–Wingberg,
*Cohomology of Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf),
Chapter II, §4, Theorem 2.4.6, printed p. 118 (PDF p. 135)). *Needs:* *The Hochschild–Serre
spectral sequence*; *The spectral sequence of a first-quadrant double complex* (DerivedModuleAlgebra §S.1); ProfiniteCohomology
Layer 11.

**Checks.**

- (1) with `H = 1` is the identity `Hⁿ(G, A) = Hⁿ(G, A)`.
- The splitting in (2) is needed: for the non-split `ℤ/4 → ℤ/2` and `A = 𝔽₂`, inflation
  `H²(ℤ/2, 𝔽₂) → H²(ℤ/4, 𝔽₂)` is zero.
- (3) for `G = ℤ/2 × ℤ/2` and `A = 𝔽₂`: `Hⁿ(G, 𝔽₂)` has dimension `n + 1`, the number of pairs
  `p + q = n`.
- The torsion hypothesis in (4) is needed: for `G = Ẑ`, `H = 1` and `A = ℤ`, `cd(Ẑ) = 1` but
  `H²(Ẑ, ℤ) ≅ H¹(Ẑ, ℚ/ℤ) = ℚ/ℤ ≠ 0`, while both outer terms of the sequence vanish for `n = 2`.

### R02.2.2 The low-degree sequence and the transgression

**The five-term sequence and the transgression.** Let `G` be profinite, `H` a closed normal
subgroup and `A` a discrete `G`-module. In the Hochschild–Serre spectral sequence the differential
`d₂^{0,1} : H¹(H, A)^{G/H} → H²(G/H, A^H)` is the transgression, so the five-term exact sequence of
the spectral sequence,

```text
0 → H¹(G/H, A^H) → H¹(G, A) → H¹(H, A)^{G/H} → H²(G/H, A^H) → H²(G, A),
```

is the inflation–restriction–transgression sequence of ProfiniteCohomology Layer 5 (`transgression`,
`fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q`), not a second construction. If `n ≥ 1` and
`Hⁱ(H, A) = 0` for `0 < i < n`, then `Hᵐ(G/H, A^H) ≅ Hᵐ(G, A)` for `m < n` and

```text
0 → Hⁿ(G/H, A^H) → Hⁿ(G, A) → Hⁿ(H, A)^{G/H} → H^{n+1}(G/H, A^H) → H^{n+1}(G, A)
```

is exact.

*Proof sketch.* The five-term sequence is that of *The spectral sequence of a first-quadrant double
complex* (DerivedModuleAlgebra §S.1), with edge maps inflation and restriction (*The Hochschild–Serre spectral sequence*). For
`d₂^{0,1} = tg`: an element of `H¹(H, A)^{G/H}` is represented by an `H`-invariant `1`-cocycle `x` of
the resolution; `G/H`-invariance gives `b` with `d(b_{σ,ρ}) = ρx − σx`, which may be taken
`G`-invariant, normalised and factoring through `G/H × G/H`; the cocycle `∂b` represents
`d₂^{0,1}`, and `y_σ = x_{1,σ} + b_{1,σ}(σ)` has the properties defining `tg`, with `∂y = ∂b`
(NSW (2.4.3), proof of Moser and Stix). The extended sequence is the vanishing-rows case of *The
spectral sequence of a first-quadrant double complex* (DerivedModuleAlgebra §S.1) ([Neukirch–Schmidt–Wingberg, *Cohomology of
Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4,
Theorem 2.4.3, printed p. 113 (PDF p. 130)). *Needs:* *The Hochschild–Serre spectral sequence*;
*The spectral sequence of a first-quadrant double complex* (DerivedModuleAlgebra §S.1); ProfiniteCohomology Layer 5.

**Checks.**

- For `G = ℤ/4`, `H = 2ℤ/4` and `A = 𝔽₂` every term is `𝔽₂`: inflation in degree one is an
  isomorphism, so restriction `H¹(G, 𝔽₂) → H¹(H, 𝔽₂)` is zero, the transgression is an
  isomorphism and inflation `H²(ℤ/2, 𝔽₂) → H²(ℤ/4, 𝔽₂)` is zero.

**d₂ as cup product with the extension class.** Let `G` be profinite, `H` an open normal subgroup
acting trivially on the discrete `G`-module `A`, `H′` the closure of the commutator subgroup of `H`,
`H^ab = H/H′`, and `u ∈ H²(G/H, H^ab)` the class of `1 → H^ab → G/H′ → G/H → 1`. Under
`H¹(H, A) = Hom_cts(H^ab, A)` (*Continuous Hom from a profinite source*, Layer R02.1), for `p > 0`
the differential

```text
d₂^{p−1,1} : H^{p−1}(G/H, H¹(H, A)) → H^{p+1}(G/H, A)
```

is `x ↦ −u ∪ x`, the cup product formed with evaluation `H^ab × Hom_cts(H^ab, A) → A`; in
particular `tg(x) = −u ∪ x`. The same holds for a closed normal subgroup `H` acting trivially on
`A`, with `u` the class in continuous cohomology `H²_cts(G/H, H^ab)` with the profinite coefficient
module `H^ab`, and with the cup product of *Continuous Hom from a profinite source*: continuous
cochains paired through the jointly continuous evaluation into the discrete module
`Hom_cts(H^ab, A)`, which carries its compact-open topology, not the pointwise one.

*Proof sketch.* For finite `G`: the projection `H → H^ab` is a `G/H`-invariant class `ε`, and
`tg(ε) = −u` by a cochain computation with a section `s` of `G → G/H`. Moreover `d₂^{p,1} = δ ∘ δ`
for the two short exact sequences cut out of `0 → A^H → X⁰(G, A)^H → Z → H¹(H, A) → 0`, and cup
products with `ε` commute with both connecting maps, so `d₂(z) = δδ(ε ∪ z) = −u ∪ z`. General
`G`: pass to the finite quotients `G/W` for open normal `W ⊆ H`, using the compatibility of cup
products with inflation and `H¹(H, A) = colim_W H¹(H/W, A)` (ProfiniteCohomology Layers 4 and 12).
Closed `H`: the same argument with `u` in the cohomology with compact coefficients of Layer R02.1
and the mixed cup product of *Continuous Hom from a profinite source*
([Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter II, §4,
Theorem 2.4.4, printed p. 114 (PDF p. 131)). Harpaz–Wittenberg's formula
`d₂^{1,1}[β] = [β ∪ f]` is this identity for their extension, up to sign. *Needs:* *The
Hochschild–Serre spectral sequence*; *The five-term sequence and the transgression*; *Comparison
with the canonical carrier for compact coefficients* (PerfectoidTowers §P9.0); *Continuous Hom from
a
profinite source* (Layer R02.1); *Continuous Schreier classification and automorphisms* (Layer
R02.1); ProfiniteCohomology Layers 4 and 12.

**Checks.**

- For `G = ℤ/9`, `H = 3ℤ/9` and trivial `A = 𝔽₃`, identify `3a ∈ H` with `a ∈ 𝔽₃`.
  The section `s(i) = ī`, `ī ∈ {0,1,2}`, has carry cocycle
  `u(i,j) = ⌊(ī + j̄)/3⌋`. The transgression lift `F(t) = ⌊t̄/3⌋ (mod 3)`
  extends `id_H` and vanishes on the section. Thus
  `dF(s(i),s(j)) = F(s(j)) − F(s(i)+s(j)) + F(s(i)) = −u(i,j)`.
  In particular `(dF(1,1), dF(1,2)) = (0,2)`, whereas `(u(1,1),u(1,2)) = (0,1)`.
  By `TauCeti.ContCohomology.transgressionCochain_apply` and
  `TauCeti.ContCohomology.transgression_eq_mk_cocycle`, the pinned raw cochain has this
  representative up to a coboundary from its choice of conjugation primitives; hence
  `tg(id_H) = −[u]`. Summing over `j = 0,1,2` at `i = 1` gives `2` for `−u` and `1`
  for `u`; coboundaries have sum zero, so the two classes differ.
- For `G = ℤ/4`, `H = 2ℤ/4` and `A = 𝔽₂`: `H^ab = H ≅ ℤ/2`, `u` is the nonzero class of `ℤ/4`, and
  `tg(id_H) = −u ≠ 0`, as in `z4_nondegenerate`.
- For a direct product `G = Q × H` the extension `1 → H^ab → Q × H^ab → Q → 1` splits, so `u = 0`
  and every `d₂^{p−1,1}` vanishes.
- A closed, non-open `H`: for `G` the group of unipotent upper triangular `3 × 3` matrices
  over `ℤ_p`, `H ≅ ℤ_p` its centre and `A = ℤ/p`, `G/H ≅ ℤ_p²` and `u ∈ H²_cts(ℤ_p², ℤ_p)` is the
  Heisenberg class; `tg` sends the reduction `H^ab = ℤ_p → ℤ/p` in `Hom_cts(H^ab, ℤ/p) ≅ ℤ/p` to
  `−ū`, the reduction of `−u`, which is nonzero because the extension of `ℤ_p²` by `H/pH` is not
  abelian. This matches `H ⊆ [G, G]`, which makes restriction `H¹(G, ℤ/p) → H¹(H, ℤ/p)` zero.

### R02.2.3 Descent along open subgroups, norms and compact coefficients

**Restriction and corestriction descent for finite index.** Let `G` be a profinite group, `U` an
open subgroup of index `n` and `A` a discrete `G`-module.

1. `cor ∘ res = n` on `Hⁱ(G, A)`.
2. If `U` is normal and multiplication by every prime dividing `n` is an automorphism of `A` (for
   example, `A` is `ℓ`-primary with `ℓ ∤ n`), then `res : Hⁱ(G, A) → Hⁱ(U, A)^{G/U}` is an
   isomorphism for every `i`.
3. If `A` is `ℓ`-primary and `ℓ ∤ n`, then `res : Hⁱ(G, A) → Hⁱ(U, A)` is injective.

Arithmetically: for a finite extension `L/K` of degree prime to `ℓ` and an `ℓ`-primary discrete
`G_K`-module `M`, `Hⁱ(K, M) → Hⁱ(L, M)` is injective, with image `Hⁱ(L, M)^{Gal(L/K)}` when `L/K` is
Galois; the same holds for `ℤ_ℓ`-lattices `T` and for `V = T ⊗ ℚ_ℓ` with continuous cohomology.

*Proof sketch.* For an open normal subgroup `U` of index `m`, define continuous restriction and the
transfer over the finitely many cosets on continuous cochains. The standard homotopies give
`cor ∘ res = m`, and `res ∘ cor` is the sum of the conjugations by `G/U`. When `m` is invertible on
the coefficients, averaging over `G/U` makes `G/U`-invariants exact, so the Hochschild–Serre edge
map is an isomorphism for discrete coefficients. The same coset maps and homotopies apply to
lattice and rational continuous cochains; no finiteness of `Hⁱ(U, T/pⁿT)` is required
([Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), Chapter I, §5,
Corollary 1.5.7, printed p. 51 (PDF p. 67)). *Needs:* *The Hochschild–Serre spectral sequence*;
*Degeneration of the Hochschild–Serre spectral sequence*; *Tate's inverse-limit theorem*
(Layer R02.1); *Rationalisation of lattice cohomology* (Layer R02.1); ProfiniteCohomology Layers 6
and 10.

**Transgression and norm compatibility.** Let `1 → Γ_L → Γ_K → H → 1` with `H` a finite quotient of
`Γ_K`, `A` a finite discrete `H`-module (so `Γ_L` acts trivially) and `H′ ≤ H` a subgroup, not
necessarily normal. The transgressions `tg_H : H¹(L, A)^H → H²(H, A)` and
`tg_{H′} : H¹(L, A)^{H′} → H²(H′, A)` satisfy

```text
cor_{H′}^H ∘ tg_{H′} = tg_H ∘ N_{H/H′},
```

where `N_{H/H′}` sends an `H′`-invariant class to the sum of its translates by representatives of
`H/H′`. If `Δ = Γ_L^ab` (a profinite group, with the continuous evaluation convention) and
`u ∈ H²(H, Δ)` is the pushed-out extension class, then `tg_H(x) = −u ∪ x` under evaluation
`Δ × Hom(Δ, A) → A`. For `A = μ_m` with `m` prime to the characteristic of `K` and `μ_m ⊂ L`,
Kummer theory identifies `H¹(L, μ_m)` with `L^×/L^{×m}`, `N_{H/H′}` becomes
`x ↦ ∏_{h ∈ H/H′} h(x)`, and on classes of elements of the fixed field `K′` of `H′` this is the
field norm `N_{K′/K}`. Signs are those of the normalised inhomogeneous differential of
ProfiniteCohomology.

*Proof sketch.* Express `tg` by the factor set of the extension and the negative pushforward
formula. Comparing coset representatives in the transfer, the differences form a coboundary. Under
Hilbert 90 and Kummer theory, corestriction becomes the norm; insert this into the square
([Merkurjev–Scavia, *Galois representations modulo p that do not lift modulo
`p²`*](https://www.math.ucla.edu/~merkurev/papers/Negligible.pdf), §2, Lemmas 2.3 and 2.5,
pp. 6–7). *Needs:* *d₂ as cup product with the extension class*; *Restriction and corestriction
descent for finite index*; ProfiniteCohomology Layer 9.

**Checks.**

- A non-split extension gives a nonzero transgression: for `K = ℚ`, `L = ℚ(√2)`, `H = ℤ/2` and
  `A = μ₂ = 𝔽₂`, the class of `2 + √2` in `L^×/L^{×2}` is `H`-invariant
  (`(2 + √2)(2 − √2) = 2 = (√2)²`) and cuts out `ℚ(ζ₁₆)⁺`, cyclic of degree `4` over `ℚ`; it does not
  come from `ℚ^×`, so its transgression is the nonzero element of `H²(ℤ/2, 𝔽₂)`.
- A split extension gives zero transgression.
- `H′ = 1`: the square says `tg_H(N_H(x)) = 0`, as it must, since `N_H = res ∘ cor`; in the previous
  example `N_H(2 + √2) = 2` is a square in `L`. For `H′ = H` both `N_{H/H}` and `cor_H^H` are
  identities.

**Inflation–restriction for compact and rational coefficients.** Let `H` be a closed normal
subgroup of the profinite group `G` and `T` a topological `G`-module that is discrete, a finitely
generated `ℤ_p`-module or a finite-dimensional `ℚ_p`-vector space.

1. `0 → H¹(G/H, T^H) → H¹(G, T) → H¹(H, T)` is exact.
2. If moreover `H¹(G, S)`, `H²(G, S)` and `H¹(H, S)` are finite for every `G`-module (resp.
   `H`-module) `S` of finite `p`-power order, then
   ```text
   0 → H¹(G/H, T^H) → H¹(G, T) → H¹(H, T)^{G/H} → H²(G/H, T^H) → H²(G, T)
   ```
   is exact.

The full spectral sequence for compact coefficients is *Relative compact Hochschild–Serre*
(Layer D7), whose `E₂` term uses derived relative invariants rather than `H_cts(H, T)`.

*Proof sketch.* (1) is the cochain proof of the discrete case (ProfiniteCohomology Layer 5), which
does not use discreteness. (2) For `T` finitely generated over `ℤ_p`, apply *The five-term sequence
and the transgression* to the discrete modules `T/pᵐT`; the hypotheses make every term finite, so
the inverse limit over `m` is exact (*Mittag-Leffler towers have vanishing `lim¹`* (DerivedModuleAlgebra §1.T.1)), and
*Tate's inverse-limit theorem* (Layer R02.1) identifies the limits with the cohomology of `T`. The
terms with coefficients `(T/pᵐT)^H` need one more step, since `(T/pᵐT)^H` is not `T^H/pᵐT^H` in
general and the transitions of the tower `((T/pᵐT)^H)_m` need not be surjective: its limit is
`(lim T/pᵐT)^H = T^H`, the groups are finite, and replacing each term by its stable image (the
Mittag-Leffler condition) gives a tower with surjective transitions, the same limit and the same
limit of cohomology groups, to which Tate's theorem applies. For a
`ℚ_p`-space `V`, choose a `G`-stable lattice `T₀` and tensor the sequence for `T₀` with `ℚ_p`
(*Rationalisation of lattice cohomology*, Layer R02.1) ([Rubin, *Euler
Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Proposition 2.5,
printed p. 152 (PDF p. 162)). *Needs:* *The five-term sequence and the transgression*; *Tate's
inverse-limit theorem* (Layer R02.1); *Rationalisation of lattice cohomology* (Layer R02.1);
*Mittag-Leffler towers have vanishing `lim¹`* (DerivedModuleAlgebra §1.T.1); ProfiniteCohomology Layer 5.

**Checks.**

- For `G = ℤ_p × ℤ_p`, `H` the second factor and `T = ℤ_p` with trivial action (the finiteness
  hypotheses hold: `G` and `H` are pro-`p` groups with finite cohomology in each degree for finite
  coefficients, and `H²(ℤ_p, ℤ_p) = 0`), the sequence is
  `0 → ℤ_p → ℤ_p² → ℤ_p → 0 → H²(G, ℤ_p)`; tensoring with `ℚ_p` gives the sequence for `ℚ_p`.
- For `H = G` the sequence reads `0 → 0 → H¹(G, T) → H¹(G, T) → 0 → H²(G, T)`.
- Part (1) needs no finiteness: it holds for every profinite `G` and `T = ℤ_p`, where it says that
  `Hom_cts(G/H, ℤ_p) → Hom_cts(G, ℤ_p) → Hom_cts(H, ℤ_p)` is exact on the left and in the middle.

### R02.2.3a Supplied `H¹` of a procyclic group

Import `procyclic_H1_equiv_coinvariants` from PadicPeriodRings §0.1, with its coefficient
hypotheses, naturality and Checks. For a procyclic residue Galois group `Γ ≅ Ẑ` with arithmetic
Frobenius `σ`, use the supplied identification `H¹(Γ, C) ≅ C/(σ − 1)C` in the unramified local
calculations of Layers R02.3 and R02.6. Use the supplied declaration directly.

*Needs:* PadicPeriodRings §0.1 (*`H¹` of a procyclic group*).

### R02.2.4 Residue sequences of Laurent-series fields

**Laurent-field residue and Witt sequences.** Let `k` be a perfect field, `m` an integer with
`gcd(m, char k) = 1`, and `K = k((t))`. The tame inertia sequence and the uniformiser `t` give split
exact sequences, for `q ≥ 1`,

```text
0 → H^q(k, μ_m^{⊗r}) → H^q(K, μ_m^{⊗r}) → H^{q−1}(k, μ_m^{⊗(r−1)}) → 0.
```

The residue map is canonical; the splitting, which depends on the chosen uniformiser, is cup product
with the Kummer class of `t`, and the residue is normalised to send that class to `1`. For a
complete discretely valued field `K` with perfect residue field `k`, the Witt sequence

```text
0 → Br(k) → Br(K) → H¹(k, ℚ/ℤ) → 0
```

is exact and split by a uniformiser; here `Br(k) → Br(K)` is the unramified embedding through the
valuation ring, not a field embedding `k → K`, which need not exist in mixed characteristic. The
finite-coefficient statement excludes coefficients divisible by `char k`; the Brauer statement has
no such restriction and is proved separately from perfectness of the residue field.

*Proof sketch.* The inertia subgroup `I ⊂ G_K` has quotient `G_k`, and on coefficients of order
prime to `char k` its cohomology is that of the tame inertia, of cohomological dimension one, with
`H¹(I, μ_m^{⊗r}) = μ_m^{⊗(r−1)}`; the long exact sequence of *Degeneration of the Hochschild–Serre
spectral sequence* (4) then applies, and the Kummer class of the valuation splits it. Compute the
residue of the class of `t` and use the projection formula for the splitting. For the Brauer group,
use the valuation sequence on units over finite unramified extensions; perfectness of the residue
field gives unramified splitting fields and cohomological triviality of principal units. Pass to the
colimit over finite extensions and use `H²(G, ℤ) = H¹(G, ℚ/ℤ)` ([Harpaz–Wittenberg, *The Massey
vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf),
§3, Remark 3.4, pp. 10–11; [Chan, *Lectures on
Orders*](https://web.maths.unsw.edu.au/~danielch/Lect_Orders.pdf), §8.1–8.3, Theorems 8.1, 8.7,
8.10 and Lemma 8.9, pp. 24–30). *Needs:* *Degeneration of the Hochschild–Serre spectral sequence*;
ProfiniteCohomology Layers 9 and 11; ClassFieldTheory Layer 5 (local fields, that is, finite
residue field; the Witt sequence for an arbitrary perfect residue field is proved here).

**Checks.**

- `q = 1`, `r = 1`: `K^×/K^{×m} ≅ k^×/k^{×m} ⊕ ℤ/m`, the second factor the valuation mod `m`
  (principal units are `m`-divisible).
- For algebraically closed `k`, `Br(k((t))) = 0`.
- For finite `k`, `Br(K) ≅ ℚ/ℤ`.
- The coprimality hypothesis is needed: for `K = 𝔽_p((t))` and `m = p`,
  `H¹(K, ℤ/p) = K/℘(K)` (Artin–Schreier) is infinite, while `H¹(𝔽_p, ℤ/p) = ℤ/p`.

### Examples

- For the trivial subgroup the spectral sequence is concentrated in the bottom row,
  `E₂^{p,0} = Hᵖ(G, M)`, and for `H = G` in the left column, `E₂^{0,q} = H^q(G, M)`; a construction
  that confused the two filtrations fails one of these.
- For the extension `1 → ℤ/2 → ℤ/4 → ℤ/2 → 1` with trivial `𝔽₂` coefficients, `d₂` on `E₂^{0,1}`
  is `x ↦ −u ∪ x` with `u` the nonzero class of `H²(ℤ/2, ℤ/2)` (over `𝔽₂` the sign is invisible),
  so the spectral sequence does not degenerate at `E₂`.
- For `G = Ẑ ⋉ ℤ_ℓ(1)` (a quotient of the tame Galois group of a local field) and a torsion
  discrete `G`-module `M`, the quotient `Ẑ` has cohomological dimension one, so the spectral
  sequence for `H = ℤ_ℓ(1)` breaks into short exact sequences
  `0 → H¹(Ẑ, H^{q−1}(H, M)) → H^q(G, M) → H⁰(Ẑ, H^q(H, M)) → 0`.

### Dependencies

- Earlier layers of this roadmap: R02.1.
- PerfectoidTowers: §P9.0 (comparison with the canonical carrier).
- PadicPeriodRings: §0.1 (procyclic `H¹`).
- DerivedModuleAlgebra: §S.1 (the first-quadrant double-complex spectral sequence); §1.T.1
  (Mittag–Leffler towers and Milnor).
- TauCetiRoadmap ProfiniteCohomology: Layers 3, 4, 5, 6, 7, 9, 10, 11, 12.
- TauCetiRoadmap ClassFieldTheory: Layer 5.
- Libraries: Mathlib `HomotopyCategory.spectralObjectMappingCone`, Mathlib
  `CategoryTheory.Triangulated.SpectralObject.mapHomologicalFunctor`, Mathlib
  `CategoryTheory.Abelian.SpectralObject.IsFirstQuadrant`, Mathlib
  `CategoryTheory.Abelian.SpectralObject.coreE₂CohomologicalNat`, Mathlib
  `CategoryTheory.Abelian.SpectralObject.spectralSequence`, Mathlib `HomologicalComplex₂.total`,
  Mathlib `continuousCohomology`.

## Layer R02.3: Restricted ramification and the S-idele class formation

This layer sets up the arithmetic objects of global duality over a number field `K` and a set
`S` of places of `K` containing the archimedean ones: the Galois group `G_S = G_{K,S}` of the
maximal extension unramified outside `S`, Hermite's finiteness theorem and the finiteness of
`H¹(G_S, M)`, the localisation maps with their modified archimedean groups, the `S`-ideles,
`S`-units and `S`-idele classes as `G_S`-modules, `P`-class formations and the fact that
`(G_S, C_S)` is one, with its reciprocity law and the Kummer sequence for `S`-units. It also states
the class-field inputs for global function fields that the function-field duality theorems of
Layer R02.4 need, since ClassFieldTheory treats global fields of characteristic zero only;
Chebotarev density for global function fields is supplied by ArithmeticGaloisRepresentations
§5.13 / **Chebotarev for function fields**. Finally
it defines the locally trivial groups `Шⁱ`, describes the cyclotomic power kernel, and proves four
class-field applications: exponent-two ramification fields, quadratic reciprocity for one new
ramified prime, the antiunit class-field rank and the absence of `ℤ_p`-extensions unramified at
`p`.

### R02.3.0a Comparison of the multiplicative completion with Mathlib adic completion

Import Mathlib `AdicCompletion (p) A` and its canonical map and functoriality. Identify its quotients
with `A/p^m A`, or `Aˣ/(Aˣ)^(p^m)` in multiplicative notation, and identify `AdicCompletion (p) ℤ` with
`ℤ_p`. Transport its module and inverse-limit topology through these identifications. The finitely
generated tensor comparison is the existing ofTensorProduct theorem, not a new completion
construction.

`p` prime; no finiteness on `A` for the definition. Rubin's Definition I.6.2 double-dual completion
agrees with this `Â` for finitely generated `A`. No such agreement is asserted for general `A`: a
`p`-divisible group has zero quotient-tower completion but can have nonzero `p`-primary characters.
Example I.2.1 uses the inverse limit, which is the object used here.

The construction proceeds as follows. Definition: `AdicCompletion (span {p}) A`. `ℤ_p ⊗ A ≅ Â` for
finitely generated `A`: `AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian` over the
Noetherian ring `ℤ`. `AdicCompletion(p)ℤ ≅ ℤ_p`: both are `lim ℤ/p^m` (`PadicInt.toZModPow`).

(Rubin (1999 draft), Chapter I, §2, Example 2.1, printed p. 3 (PDF p. 13); Rubin (1999 draft),
Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).)

The named operations and identities are:

- `ker_adicCompletion_of_span` — `ker(A → Â) = ⋂_m p^mA` for Mathlib's `AdicCompletion.of` at the
  ideal `(p) ⊆ ℤ`; Mathlib's `AdicCompletion.of_injective_iff` covers only the Hausdorff case.
- `adicCompletion_int_equiv_padicInt` — `AdicCompletion(p)ℤ ≅ ℤ_p`, making `Â` a `ℤ_p`-module.
- `pCompletion` — the abbreviation for Mathlib's `AdicCompletion` at the ideal `(p) ⊆ ℤ`; no other
  completion carrier is introduced.

**Checks.**

- A finite group of order prime to `p` has `Â = 0` (`ℤ/2` with `p = 3`).
- `ℤ̂ = ℤ_p`: `ℤ_p ⊗ ℤ → ℤ̂` is bijective.
- `ℚ` is `p`-divisible, so `ℚ̂ = 0`.
- For `A=ℚ_p/ℤ_p`, every `A/p^mA` is zero, so `Â=0`. The identity `A→ℚ_p/ℤ_p` is a nonzero `p`-primary
  character, and evaluation at a nonzero element gives a nonzero character double dual. Thus the
  double-dual and quotient-tower notions differ outside the finitely generated setting.
- `CompletionChecks.pCompletion_infinite_free_not_surjective`: for the free direct sum
  `A=⨁_ℕ ℤ`, `ℤ_p ⊗ A → Â` is not surjective (`∑ p^i e_i` is not a finite sum).
- For `ℓ ≠ p`, `ℤ_ℓ` is `p`-divisible, so its completion is 0 although `ℤ_p ⊗_ℤ ℤ_ℓ ≠ 0`.

Thus completion of `Fˣ` must retain its quotient tower when `Fˣ` is not finitely generated.

*Needs:* Mathlib `AdicCompletion`; Mathlib `AdicCompletion.of`; Mathlib `AdicCompletion.map`;
Mathlib `AdicCompletion.ofTensorProduct`; Mathlib
`AdicCompletion.ofTensorProduct_bijective_of_finite_of_isNoetherian`; Mathlib `PadicInt`; Mathlib
`PadicInt.toZModPow`.

### R02.3.0b Completion of global units

For a number field `F`, the unit group `E_F = 𝓞_F^×` is finitely generated, so `ℤ_p ⊗ E_F ≅ Ê_F`; and the
map `Ê_F → (F^×)^` induced by `E_F ⊆ F^×` is injective, because `E_F ∩ (F^×)^{p^m} = E_F^{p^m}`: a `p^m`-th
root in `F` of a unit is a unit.

`F` a number field, `p` prime, `m ≥ 0`.

Prove this as follows. `E_F` is finitely generated by Dirichlet's theorem
(`NumberField.Units.exist_unique_eq_mul_prod`: every unit is torsion times a product of fundamental
units); apply §R02.3.0a. If `x ∈ F^×` and `x^{p^m} = u ∈ E_F`, then `x` and `x^{−1}` are integral over `𝓞_F`
(`IsIntegral.of_pow`), so `x ∈ E_F`. Hence the subspace topology on `E_F` from the `p`-adic topology of `F^×`
is its own `p`-adic topology, and the completion map is injective.

(Rubin (1999 draft), Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).)

The image is closed but not all of `(F^×)^`; the quotient `(F^×)^/Ê_F` involves the ideal group. The two
statements are `units_pCompletion_injective` and `units_pow_of_pow_eq`.

**Checks.**

- For `F = ℚ` and `p` odd, the units `{±1}` have zero `p`-adic completion.
- For `F = ℚ` and `p = 2`, their completion is `ℤ/2`; the class of `−1` remains nonzero in the completion of `ℚ×`.
- If `x ∈ F×` and `x^(p^m)` is a unit, every finite valuation of `x` is zero; a field root cannot
  introduce a nonzero valuation.

*Needs:* §R02.3.0a (Comparison of the multiplicative completion with Mathlib adic completion);
Mathlib `NumberField.Units.exist_unique_eq_mul_prod`; Mathlib `IsIntegral.of_pow`; Mathlib
`NumberField.RingOfIntegers`.

### R02.3.0c The S-unit theorem and the completion of S-units

**S-unit rank and cardinality adapter.** For a number field `K` and a finite set
`S ⊆ IsDedekindDomain.HeightOneSpectrum (𝓞 K)` of finite places, put `U = Set.unit S K`.
HeightsAndUnits §4.2 supplies the rank identity
`Module.finrank ℤ (Additive U) = NumberField.Units.rank K + Nat.card S` and identifies the torsion
with the roots of unity. The finite-generation input is the pinned `Set.unit_fg` and its
specialization through the base-ring units `Set.unit_fg_of_units` from
`TauCeti.RingTheory.DedekindDomain.SInteger.Unit`. Its additive module adapter here is
`Set.unit_moduleFinite : Module.Finite ℤ (Additive U)`, with `hS : S.Finite`.

`sUnits_finrank_ncard` takes the supplied rank identity as a hypothesis and rewrites it with
`S.ncard` using Mathlib's `Nat.card_coe_set_eq`; adjoining all archimedean places gives the equivalent
rank `#S_total − 1`. The module adapter uses the pinned finite-generation theorem and Mathlib's
additive-group/module conversion. The supplied
`Set.unitValuation`, transported additively, has coordinates `−ord_v`; its image has finite index
in `ℤ^S`, and need not be the whole lattice.

(Milne, *Algebraic Number Theory* (version 3.08), Chapter 5, Theorem 5.11 and its proof, p. 90;
HeightsAndUnits §4.2.)

**Checks.**

- `K = ℚ`, `S = ∅`: `U = {±1}`, so `Additive U` is a finitely generated `ℤ`-module of rank 0.
  Both `Nat.card S` and `S.ncard` are zero, and adjoining `∞` gives
  `#S_total − 1 = 0`.
- `K = ℚ(√2)`, `S = ∅`: `𝒪_K^× = ±(1 + √2)^ℤ` has rank 1. Both archimedean places count in `S_total`; adding
  the unique finite prime above 2, generated by `√2`, gives S-units `±(1 + √2)^ℤ (√2)^ℤ` of rank `2 = 1 + Nat.card S`.
- `K = ℚ(√−5)`, `S = ∅`: the class group has order 2, the units are `{±1}`, and the rank is 0. Taking
  `S = {𝔭}`, `𝔭 = (2, 1 + √−5)`, gives rank 1 with `Nat.card S = S.ncard = 1`; the S-unit 2 has principal
  ideal `(2) = 𝔭²` and order 2 (transported valuation `−2`), so the valuation image has index 2 and
  finite index (not surjectivity) is the correct statement.
- `K = ℚ`, `S = {(2)}`: the additive transport of the pinned `Set.unitValuation` sends 2 to `−1`, 1 to 0
  and `2ᵐ` to `−m` for `m ∈ ℤ`. The group identity in `Multiplicative ℤ` becomes additive zero; the image
  still has rank 1.

*Needs:* HeightsAndUnits §4.2 (S-unit rank and torsion); Mathlib `Set.unit`,
`Nat.card_coe_set_eq`; Tau Ceti `TauCeti.RingTheory.DedekindDomain.SInteger.Unit`
(`Set.unit_fg`, `Set.unit_fg_of_units`, `Set.unitValuation`, `Set.unitValuation_ker`,
`Set.unitEmptyEquivUnits`).

**Reindexing fundamental systems of S-units.** For a number field `K` and a finite set `S` of
finite places, put `U = Set.unit S K` and `r = NumberField.Units.rank K + Nat.card S`.
HeightsAndUnits §4.2 supplies a family `ε : Fin r → U` such that each `u ∈ U` has a unique pair
`(ζ, e) ∈ CommGroup.torsion U × (Fin r → ℤ)` with `u = ζ · ∏ᵢ εᵢ^{eᵢ}`.
`sUnits_fundSystem_reindex` takes this supplied existence statement as a hypothesis and gives the
same unique-pair decomposition on any finite index type `I` with `Fintype.card I = r`.

Choose a bijection `I ≃ Fin r`, transport the family and exponent vector along it, and use
invariance of the finite product under reindexing. The inverse bijection transports uniqueness.

(Milne, *Algebraic Number Theory* (version 3.08), Chapter 5, the fundamental-system description on
p. 85 and Theorem 5.11 on p. 90; HeightsAndUnits §4.2.)

**Checks.**

- For `F = ℚ` and `S_f` empty, `r = 0`, the product is empty and every S-unit is its unique torsion factor `±1`.
- For `F = ℚ` and `S_f = {(2), (3)}`, the family `(2, 3)` gives the unique decomposition `±2ᵃ3ᵇ` with `a, b ∈ ℤ`;
  the family `(4, 3)` misses 2 and cannot be a fundamental system.
- For `F = ℚ(√−5)` and `S_f = {𝔭}`, `𝔭 = (2, 1 + √−5)`, the S-unit 2 is a fundamental generator although
  its `𝔭`-valuation is 2. A fundamental system need not map to the standard basis of the entire
  valuation lattice.
- Interchanging the two indices in the `ℚ` example interchanges the exponents without changing `ζ`.

*Needs:* HeightsAndUnits §4.2 (the unique-pair fundamental system); Mathlib `CommGroup.torsion`
and finite-product reindexing.

**Completion of S-units.** This completion adapter applies the S-unit theorem: for a number field `F`
and a finite set `S` of places containing the archimedean ones, `𝓞_{F,S}^×` is finitely generated, so
`ℤ_p ⊗ 𝓞_{F,S}^× ≅ (𝓞_{F,S}^×)^`, and `(𝓞_{F,S}^×)^ → (F^×)^` is injective.

`S` finite, containing the archimedean places.

Prove this as follows. Apply `Set.unit_moduleFinite` above and the finitely generated
tensor/completion comparison of §R02.3.0a. An element of `F^×` whose `p^m`-th power is an S-unit has
valuation zero outside `S`, so it is an S-unit; apply §R02.3.0b.

(Rubin (1999 draft), Chapter I, §6.2, Definition 6.2, printed p. 14 (PDF p. 24).)

**Checks.**

- For `S = S_∞` the comparison and injection are those of §R02.3.0b.
- For `F = ℚ`, `S = {∞, ℓ}` with `ℓ` a prime and `p` odd, the completed S-unit group is `ℤ_p`, generated by `ℓ`;
  the sign factor disappears.
- For the same `F` and `S` with `p = 2`, the completion is `(ℤ/2) × ℤ₂`. The sign survives and injects into
  the completion of `ℚ^×`, so discarding all torsion would give the wrong comparison.

*Needs:* §R02.3.0a (Comparison of the multiplicative completion with Mathlib adic completion);
§R02.3.0b (Completion of global units); §R02.3.0c (S-unit rank and cardinality adapter, `Set.unit_moduleFinite`);
Mathlib `Set.unit`.

### R02.3.0d Finite Galois localization and Sha kernels

**Finite Galois localization and Sha kernels.** Let `K` be a number field and `A` a finite discrete
`Γ_K`-module, with `Γ_K = Field.absoluteGaloisGroup K`. For `i ≥ 1` and a finite set `S` of places
of `K`, define the Tate–Shafarevich kernels
`Ш^i` and the localization defect:

```text
Ш^i(K, A)   = ker( H^i(K, A) → ∏_{all v} H^i(K_v, A) ),
Ш^i_S(K, A) = ker( H^i(K, A) → ∏_{v ∉ S} H^i(K_v, A) ),
defect_S(A) = coker( H¹(K, A) → ∏_{v ∈ S} H¹(K_v, A) ).
```

The restriction maps use the decomposition embeddings, and the groups do not depend on that choice. In
the Poitou–Tate sequences, real places enter through Tate's modified groups `Ĥ^i(K_v, A)`. These agree
with the ordinary groups in positive degree, and that comparison is stated with the definition. The
Cartier dual is `A^D = Hom(A, μ_∞)`, with `Γ_K` acting by `(σf)(a) = σ(f(σ⁻¹a))` and with the
evaluation pairing `A × A^D → μ_∞`.

The API:
- `FiniteGaloisLocalization.sha`: Mathlib's `ContinuousCohomology.tateShafarevich (fun v => K_v) A i`
  for `i ≥ 1`; at `i = 0` use the localization kernel after quotienting real invariants by norms.
- `FiniteGaloisLocalization.shaS`: the kernel that requires vanishing at every place outside `S`.
- `FiniteGaloisLocalization.dual`: the Cartier dual, with its contragredient cyclotomic action and
  evaluation pairing.
- `FiniteGaloisLocalization.naturality`: maps of coefficient modules commute with localization and
  restriction, and induce maps on the kernels and on the localization defects.

*Proof sketch.* Build the restriction maps from the decomposition maps and continuous cohomology, and
form kernels and cokernels for finite discrete coefficients. Conjugation acts trivially on cohomology,
so the result does not depend on the decomposition embeddings. Construct the evaluation pairing with
`A^D` and record the archimedean modification.

Sources: [Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), §2.6,
Proposition 2.5 and Lemma 2.6, pp. 1018–1019; [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1),
Definitions 8–9, p. 10, and Lemma 10 with its proof, p. 11 (arXiv v1).
*Needs:* EtaleCohomologyFoundations §§F.0.A0, F.0.A2 (field fundamental groups, arithmetic sequence
and descent); ArithmeticGaloisRepresentations §2.1 (decomposition embeddings); ProfiniteCohomology
Layers 1 and 7;
ClassFieldTheory Layers 5, 10 and 12.

**Checks.**

- `Ш^i_∅(K, A) = Ш^i(K, A)`, and `Ш^i(K, A) ⊆ Ш^i_S(K, A)` for every finite `S`. A definition that
  required vanishing on `S` instead of outside `S` would give `Ш^i_∅ = H^i` and fail the first identity.
- For `A = 0`, every kernel and every localization defect is zero.
- Take `K = ℚ` and `A = ℤ/2`, so `H¹(ℚ, ℤ/2) = ℚ×/ℚ×²`. The class of `−1` has nonzero image in
  `H¹(ℝ, ℤ/2) = ℤ/2`, since `−1` is not a square in `ℝ`. Real cohomology in positive degree need not
  vanish, so dropping the archimedean places changes the localization maps.

### R02.3.1 The group `G_{K,S}`, finiteness and localisation

**The Galois group `G_{K,S}` of the maximal extension unramified outside `S`.** Let `K` be a number
field with separable closure `K^s`, and `S` a set of places of `K`, possibly infinite, containing
the archimedean places. Let `K_S ⊆ K^s` be the compositum of the finite extensions of `K` in `K^s`
that are unramified at every finite place outside `S`, and let `G_S = G_{K,S} = Gal(K_S/K)`, the
quotient of `G_K` by the closed normal subgroup `H_S = Gal(K^s/K_S)`, with its Krull topology. The
ring of `S`-integers is `R_{K,S} = {a ∈ K : ord_v(a) ≥ 0 for all finite v ∉ S}`. For a finite
extension `F` of `K` inside `K_S`, the places of `F` above `S` are again written `S`, and
`F_S = K_S`. Let `P` be the set of primes `ℓ` such that `ℓ^∞` divides the supernatural degree
`[K_S : K]`; it contains every `ℓ` that is a unit in `R_{K,S}`. Over a global function field the
corresponding objects are *Function-field places, ideles and `S`-units* and *Restricted
ramification over a global function field*, with local inputs *Local inputs at places of a global
function field*.

The API:

- Unramified outside `S`: a finite subextension `L` of `K^s/K` is unramified outside `S` when
  `∀ v ∉ S, Algebra.IsUnramifiedIn (𝓞 L) v.asIdeal`, that is, every prime of `𝓞_L` over a finite
  place `v ∉ S` is unramified over `𝓞_K` (Mathlib's `Algebra.IsUnramifiedIn`, built on
  `Algebra.IsUnramifiedAt`); archimedean places impose nothing. Following NumberFieldArithmetic
  §1.2, the quantified statement uses Mathlib's predicate directly and no wrapper predicate is
  defined.
- `RestrictedRamification.maxUnramifiedOutside`: `K_S` as an intermediate field of `K^s/K`.
- `RestrictedRamification.galoisGroupS`: `G_{K,S} = Gal(K_S/K)` with its Krull topology, a
  profinite group.
- `RestrictedRamification.mem_maxUnramifiedOutside_iff`: a finite extension `L ≤ K^s` of `K`
  satisfies `L ≤ K_S` if and only if every finite place outside `S` is unramified in `L`.
- `RestrictedRamification.isGalois_maxUnramifiedOutside`: `K_S/K` is Galois.
- `RestrictedRamification.toGaloisGroupS_surjective`: the restriction homomorphism
  `G_K → G_{K,S}` is a continuous surjection with kernel `H_S`.
- `RestrictedRamification.maxUnramifiedOutside_mono`: `S ⊆ S′` gives `K_S ≤ K_{S′}`, and
  restriction `G_{K,S′} → G_{K,S}` is a continuous surjection.
- `RestrictedRamification.maxUnramifiedOutside_of_le`: for `F ≤ K_S` finite over `K`,
  `F_{S_F} = K_S`, and `Gal(K_S/F)` is the open subgroup of `G_S` fixing `F`.
- `RestrictedRamification.cyclotomic_le_maxUnramifiedOutside`: if `S` contains the places above
  `ℓ`, then `K(μ_{ℓ^∞}) ≤ K_S`, so `ℓ ∈ P`.
- Finite subextensions unramified outside `S` contain the bottom field and are closed under
  composita, subextensions and normal closure in `K^s`; enlarging `S` preserves unramifiedness.
  Keep Mathlib's quantified `Algebra.IsUnramifiedIn` statement as the field-level predicate.
  The corresponding targets are `RestrictedRamification.unramifiedOutside_bot`,
  `RestrictedRamification.unramifiedOutside_sup`, `RestrictedRamification.unramifiedOutside_of_le`
  and `RestrictedRamification.unramifiedOutside_normalClosure`. Their directed union is `K_S`;
  `RestrictedRamification.mem_maxUnramifiedOutside_iff_exists` expresses membership of an element
  in one finite such subextension.
- For finite `L/K` in `K^s`, the following are equivalent: every absolute inertia group over
  `v` is contained in `Gal(K^s/L)`; every prime `w` of `L` over `v` has
  `w.asIdeal.ramificationIdx (𝓞 K) = 1`; and `v` is unramified in `L`.
  This is `RestrictedRamification.inertia_le_fixingSubgroup_iff`. Use all primes above `v`;
  for nonnormal `L/K` one chosen inertia group fixing `L` only controls the corresponding local
  extension. ArithmeticGaloisRepresentations §2.1 supplies the absolute inertia groups and their
  finite-level comparisons; NumberFieldArithmetic §§1.3–1.5 supplies the ideal-theoretic bridge.
- For any integer `n ≥ 1`, adjoining `μ_n` is unramified outside the places dividing `n`.
  Thus `RestrictedRamification.rootsOfUnity_mem_maxUnramifiedOutside` places every `n`-th root of
  unity in `K_S` when `S` contains these places. If `u ∈ E_{K,S}` and `xⁿ = u`, then
  `K(x)/K` is unramified outside `S ∪ {v : v ∣ n}`
  (`RestrictedRamification.sUnit_root_mem_maxUnramifiedOutside`). No assumption that `μ_n ⊆ K`
  is needed: away from `S` and `n`, the polynomial `Xⁿ − u` has invertible derivative at every root.
- `RestrictedRamification.IsUnramifiedOutside S M` for a smooth discrete `R`-linear `G_K`-module
  means that every inertia group at a finite `v ∉ S` acts trivially on `M`. Its action descends
  uniquely and continuously to `G_{K,S}` exactly when this predicate holds. The kernel `H_S` is
  the closed normal subgroup generated by these inertia groups, so smoothness makes triviality
  pass to the closure. For a continuous linear representation `ρ` with Hausdorff coefficient module, prove
  `RestrictedRamification.isUnramifiedOutside_iff_factors`: the ramification predicate
  `GaloisRep.IsUnramifiedOutside S ρ` of ArithmeticGaloisRepresentations §2.2 is equivalent to
  a continuous factorisation of `ρ` through the restriction `G_K → G_{K,S}`. The factorisation
  uses the quotient topology; for discrete modules its descended action is smooth discrete.

*Proof sketch.* `K_S/K` is Galois: the Galois closure of a finite extension unramified outside `S`
is a compositum of its conjugates, hence unramified outside `S` (NumberFieldArithmetic Layer 1,
unramified sets of primes and their behaviour in towers and composita). `H_S` is the closed
subgroup fixing `K_S`, and `G_S = G_K/H_S` carries the quotient topology (Mathlib
`InfiniteGalois.IntermediateFieldEquivClosedSubgroup`). A finite `L ⊆ K^s` lies in `K_S` if and only
if `L/K` is unramified outside `S`, since composita of extensions unramified outside `S` are
unramified outside `S`. `S ⊆ S′` gives `K_S ⊆ K_{S′}` and a continuous surjection
`G_{S′} → G_S`; if `S` is the set of all places, `K_S = K^s`. For `F ⊆ K_S` finite, an extension of
`F` unramified outside `S_F` is unramified outside `S` over `K`, so `F_S = K_S`. If `ℓ` is a unit in
`R_{K,S}`, then `S` contains the places above `ℓ`, and `K(μ_{ℓⁿ})` is unramified outside `ℓ` and
`∞`; so `K(μ_{ℓ^∞}) ⊆ K_S` and `ℓ^∞` divides `[K_S : K]` (ProfiniteProPGroups Layer 1).
([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I,
§4, opening paragraph, p. 48 (PDF p. 56); [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, definition of `P`, p. 48
(PDF p. 56).) *Needs:* NumberFieldArithmetic Layer 1; ProfiniteProPGroups Layer 1; Mathlib
`Field.absoluteGaloisGroup`; Mathlib `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`; Mathlib
`Set.integer`. The lattice and inertia comparisons also use NumberFieldArithmetic §§1.3–1.5
and ArithmeticGaloisRepresentations §2.1. For the local unramified closure and inertia criterion
see [Milne, *Algebraic Number Theory*](https://www.jmilne.org/math/CourseNotes/ANT.pdf),
Corollaries 7.51–7.52 and Theorem 7.58; the root statements follow by Hensel lifting of the
separable reduction of `Xⁿ − u`. The lattice and module interfaces follow the design used by
the Imperial College London FLT project.

**Checks.**

- For `K = ℚ` and `S = {∞}`, `K_S = ℚ` and `G_S = 1`: every number field
  of degree `> 1` has `|disc| > 2` (Mathlib `NumberField.abs_discr_gt_two`), so it ramifies at
  some finite prime. A definition that ignored ramification would give `K^s`.
- For `K = ℚ` and `S = {2, ∞}`, a root `i` of `x² + 1` in `K^s` lies in
  `K_S`, and so do `√2` and every `ζ_{2ⁿ}`.
- For the same `S`, a root of `x² − 3` does not lie in `K_S`,
  since `3` ramifies in `ℚ(√3)`.
- If `S` is the set of all places, `K_S = K^s` and `G_S` is Mathlib's
  `Field.absoluteGaloisGroup K`.
- For `K = ℚ` and `S = {2, ∞}`, `2 ∈ P` because `ℚ(ζ_{2^∞}) ⊆ K_S`; for `S = {∞}`, `G_S = 1` and
  `P = ∅`.
- For `S = {2, ∞}`, the compositum of `ℚ(i)` and `ℚ(√2)` is still unramified outside `S`, as
  are all its subfields. Each element of the infinite cyclotomic union already belongs to a
  finite cyclotomic level.
- With `u = 2`, `n = 3` and `S = {2, ∞}`, `ℚ(∛2)` is unramified outside `{2, 3, ∞}`; the new
  prime `3` cannot be omitted, since its discriminant is `−108`.
- A character of `G_ℚ` cutting out `ℚ(√3)` fails to factor through `G_{ℚ,{2,∞}}`, while the
  character of `ℚ(i)` factors. Both modules use their smooth discrete actions.

**Hermite: finitely many extensions of bounded degree unramified outside a finite set.** Let `K` be
a number field, `S` a finite set of places of `K` and `n ≥ 1`. Then only finitely many subfields
`L ⊆ K^s` with `K ⊆ L` and `[L : K] ≤ n` are unramified at every finite place outside `S`
(`RestrictedRamification.finite_unramifiedOutside_of_finrank_le`). The fields are counted as
subfields of the fixed `K^s`, as in Mathlib's `NumberField.finite_of_discr_bdd`.

*Proof sketch.* For such `L`, `|disc(L)| = |disc(K)|^{[L:K]} · N_{K/ℚ}(𝔡_{L/K})` (tower formula
for the relative discriminant, NumberFieldArithmetic Layer 4). The relative discriminant
`𝔡_{L/K}` is supported on the finite places of `S`, and at each such `𝔭` its exponent is bounded
in terms of `n` and the residue characteristic by the tame and wild bounds for the exponent of the
different (NumberFieldArithmetic Layer 6). So `|disc(L)|` is bounded by a constant depending on
`K`, `S` and `n`, and Hermite's theorem `NumberField.finite_of_discr_bdd`, applied to the subfields
of `K^s`, gives finiteness. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Lemma 4.9, p. 56
(PDF p. 64).) *Needs:* NumberFieldArithmetic Layers 4 and 6; Mathlib
`NumberField.finite_of_discr_bdd`.

**Checks.**

- For `K = ℚ`, `S = {2, ∞}` and `n = 2` the fields are exactly `ℚ`, `ℚ(i)`, `ℚ(√2)` and `ℚ(√−2)`,
  the quadratic fields of discriminant `−4`, `8` and `−8` together with `ℚ`.
- Finiteness of `S` is needed: if `S` contains every finite place, all the quadratic fields
  `ℚ(√q)`, `q` prime, are admitted for `n = 2`.
- The degree bound is needed: for `S = {2, ∞}` the fields `ℚ(ζ_{2ⁿ})`, `n ≥ 1`, are pairwise
  distinct and all unramified outside `S`.

**Finiteness of `H¹(G_{K,S}, M)`.** Let `S` be a finite set of places of the number field `K`
containing the archimedean places, and `M` a finite discrete `G_S`-module, of any order (`#M` need
not be a unit in `R_{K,S}`). Then `H¹(G_S, M)` is finite
(`RestrictedRamification.finite_H1_galoisGroupS`). In particular `Hom_cont(G_{F,S}, 𝔽_p)` is
finite for every finite extension `F` of `K` in `K_S` and every prime `p`.

*Proof sketch.* Choose a finite Galois `F ⊆ K_S` such that `Gal(K_S/F)` acts trivially on `M`
(`M` is finite and discrete, so the kernel of the action is open). Inflation–restriction
(ProfiniteCohomology Layer 5) gives
`0 → H¹(Gal(F/K), M^{Gal(K_S/F)}) → H¹(G_S, M) → H¹(Gal(K_S/F), M)`, and the first group is
finite. Since `F_S = K_S`, `H¹(Gal(K_S/F), M) = Hom_cont(G_{F,S}, M)`. The kernel of such a
homomorphism cuts out an extension of `F` of degree at most `#M` unramified outside `S`, and only
finitely many homomorphisms have a given kernel. *Hermite: finitely many extensions of bounded
degree unramified outside a finite set*, applied over `F`, gives finitely many such fields, so
`Hom_cont(G_{F,S}, M)` is finite. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Lemma 4.9, p. 56 (PDF
p. 64).) *Needs:* *The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*;
*Hermite: finitely many extensions of bounded degree unramified outside a finite set*;
ProfiniteCohomology Layer 5.

**Checks.**

- For `K = ℚ`, `S = {2, ∞}` and `M = ℤ/2`, `H¹(G_S, ℤ/2) = Hom(G_S, ℤ/2)` has order `4`: the
  trivial character and the characters of `ℚ(i)`, `ℚ(√2)` and `ℚ(√−2)`. For `S = {∞}` it is `0`,
  although `2` is not a unit in `ℤ`.
- Finiteness of `S` is needed: for `S` the set of all places, `H¹(G_K, ℤ/2) = K^×/K^{×2}` is
  infinite.
- Finiteness of `M` is needed: for `K = ℚ`, `S = {2, ∞}` and `M = ℚ₂/ℤ₂` with trivial action,
  `G_S` surjects onto `Gal(ℚ(ζ_{2^∞})/ℚ) ≅ ℤ₂^× ≅ {±1} × ℤ₂`, so `H¹(G_S, M)` contains
  `Hom_cont(ℤ₂, ℚ₂/ℤ₂) ≅ ℚ₂/ℤ₂`.

**Localisation maps and the modified local groups.** For each place `v` of `K` fix an embedding
`K^s ↪ K_v^s` over `K`; it gives `G_v = Gal(K_v^s/K_v) → G_K → G_S`. Let `M` be a discrete
`G_S`-module (every element has open stabiliser, so the action `G_S × M → M` is continuous). The
localisation maps are `loc_v : H^r(G_S, M) → H^r(K_v, M)`, where `H^r(K_v, M) = H^r(G_v, M)`
(continuous cohomology) for `v` finite and `H^r(K_v, M) = Ĥ^r(G_v, M)`, Tate cohomology of the
finite group `G_v`, for `v` archimedean; so `H⁰(ℝ, M) = M^{Gal(ℂ/ℝ)}/N M` and `H^r(ℂ, M) = 0`. For
`v` finite with `I_v` acting trivially on `M`, the unramified subgroup `H^r_un(K_v, M)` is the image
of inflation `H^r(g_v, M) → H^r(G_v, M)`, where `g_v = G_v/I_v`. Up to the canonical identification
of the local groups attached to two embeddings, `loc_v` does not depend on the chosen embedding.

The API:

- `RestrictedRamification.localCohomology`: `H^r(K_v, M)`: continuous cohomology at finite `v`,
  Tate cohomology `Ĥ^r(G_v, M)` at archimedean `v`.
- `RestrictedRamification.locMap`: `loc_v : H^r(G_S, M) → H^r(K_v, M)`, natural in `M`.
- `RestrictedRamification.locMap_indep`: changing the embedding by `g ∈ G_K` replaces `G_v` by
  `gG_vg⁻¹`, and the two localisation maps agree after the isomorphism
  `H^r(G_v, M) ≅ H^r(gG_vg⁻¹, M)` given by conjugation by `g` and `m ↦ gm` on coefficients.
- `RestrictedRamification.locMap_delta`: for a short exact sequence `0 → M′ → M → M″ → 0` of
  discrete `G_S`-modules, `loc_v` commutes with the connecting homomorphisms; at archimedean `v`
  this includes the comparison `H^r → Ĥ^r` (the identity for `r ≥ 1`, the quotient by norms for
  `r = 0`), which commutes with connecting homomorphisms.
- `RestrictedRamification.unramifiedSubgroup`: `H^r_un(K_v, M) ≤ H^r(K_v, M)` for finite `v` with
  `M^{I_v} = M`.
- `RestrictedRamification.unramifiedH1Equiv`: for `M` unramified at `v`, inflation is an
  isomorphism `H¹(g_v, M) ≅ H¹_un(K_v, M)`; for finite `M`, `H¹(g_v, M) ≅ M/(Frob_v − 1)M`.
- `RestrictedRamification.unramifiedSubgroup_two_eq_bot`: for finite `M` unramified at `v`,
  `H²_un(K_v, M) = 0`, because it is the image of `H²(g_v, M) = 0`.
- `RestrictedRamification.locMap_eq_restriction`: at finite `v`, `loc_v` is the restriction to the
  decomposition group along ArithmeticGaloisRepresentations' `GaloisRep.localEmbeddingMap`
  (Layer 2, §2.1), the map underlying its `GaloisRep.localRestriction`.

*Proof sketch.* Two embeddings differ by an element of `G_K`, which conjugates `G_v`; conjugation by
an element of `G_S` acts trivially on the cohomology of `G_S`, so `loc_v` is independent of the
choice. In degrees `≤ 2` this triviality is ProfiniteCohomology Layer 2
(`explicitConj1_eq_id_of_mem`); in every degree it is Tau Ceti's
`TauCeti.ContinuousCohomology.map_eq_id_of_inner` (for smooth discrete coefficients, by a prism
homotopy on the coinduced resolution; Neukirch–Schmidt–Wingberg, Proposition 1.6.3, p. 61). `loc_v`
is the map of the compatible pair `(G_v → G_S, id_M)`, so it commutes with connecting homomorphisms
(ProfiniteCohomology Layer 10); at archimedean `v` compose with `H^r → Ĥ^r`. `H⁰_un = H⁰`; inflation
`H¹(g_v, M) → H¹(G_v, M)` is injective, so `H¹_un ≅ H¹(g_v, M)`; for finite `M`, `H²(g_v, M) = 0`
because `g_v ≅ Ẑ` has cohomological dimension `1` (ProfiniteCohomology Layer 11), so `H²_un = 0`.
`loc_v` agrees with the restriction to the decomposition group of ArithmeticGaloisRepresentations
Layer 2. ([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
Chapter I, §4, statement of the main theorem, p. 55 (PDF p. 63).) *Needs:* *The Galois group `G_{K,S}`
of the maximal extension unramified outside `S`*; ProfiniteCohomology Layers 2, 10 and 11; Tau Ceti
`TauCeti.ContinuousCohomology.map_eq_id_of_inner`;
ArithmeticGaloisRepresentations §2.1 / **Decomposition and inertia groups**
(`GaloisRep.decompositionGroup`, `GaloisRep.inertiaGroup` and wild inertia),
§2.1 / **The local embedding** (`GaloisRep.localEmbeddingMap`) and §2.1 / **Local restriction**
(`GaloisRep.localRestriction` and change-of-embedding isomorphisms); Mathlib `tateCohomology`.

**Checks.**

- `complex_zero`: for `v` complex, `H^r(K_v, M) = 0` for every `r` and `M` (Tate cohomology of the
  trivial group), including `r = 0`.
- `real_modified_H0`: for `v` real and `M = ℤ/3` with trivial action,
  `H⁰(K_v, M) = Ĥ⁰(ℤ/2, ℤ/3) = 0`, whereas the ordinary invariants are `ℤ/3`; a definition using
  ordinary `H⁰` fails this test.
- `real_two`: for `v` real and `M = ℤ/2` with trivial action, `H^r(K_v, M) = ℤ/2` for every
  `r ≥ 0`.
- For `v` finite and `M = ℤ/m` with trivial action, `H¹_un(K_v, M) = Hom(Ẑ, ℤ/m) ≅ ℤ/m`, the
  unramified characters.
- For `K = ℚ`, `v = 2` and `M = ℤ/2`, the class of `ℚ₂(i)/ℚ₂` in `H¹(ℚ₂, ℤ/2)` is not in `H¹_un`,
  while the class of `ℚ₂(√5) = ℚ₂(√−3)` is.

### R02.3.2 Global function fields: class-field inputs

**Function-field places, ideles and `S`-units.** Let `F` be a global function field: a field
with Mathlib's `FunctionField 𝔽_q F` for a finite field `𝔽_q` algebraically closed in `F`, of
characteristic `ℓ`. Its places are Tau Ceti's `TauCeti.Place 𝔽_q F` (normalised discrete
valuations trivial on `𝔽_q`), each with residue degree `deg v = [κ(v) : 𝔽_q]`, completion `F_v`
and normalised absolute value `|x|_v = q^{−deg v · ord_v x}`. Define
`GlobalFunctionField.ideles F` as the restricted product of the `F_vˣ` with respect to the
`O_vˣ` (Mathlib's `RestrictedProduct`), with `Fˣ` embedded diagonally, the idele class group
`ideleClassGroup F = ideles F / Fˣ`, and the degree `ideleDegree : ideles F → ℤ`,
`(a_v) ↦ Σ_v deg v · ord_v(a_v)`. For a nonempty set `S` of places define the `S`-units
`sUnits F S = {x ∈ Fˣ : ord_v x = 0 for v ∉ S}`, the `S`-class group `sClassGroup F S`, the
quotient of the divisor group by principal divisors and divisors supported on `S`, and the
`S`-idele classes `C_S(F) = ideles F / Fˣ · ∏_{v ∉ S} O_vˣ`. The API:

- `ideleDegree_principal`: the degree vanishes on `Fˣ` (the product formula); so it descends to
  `ideleClassGroup F`.
- `ideleDegree_surjective`: the degree is onto `ℤ` (F. K. Schmidt: a divisor of degree one exists).
- `compactSpace_ideleClassGroup_degree_zero`: the degree-zero idele classes form a compact group,
  and `ideleClassGroup F ≅ ker(deg) × ℤ` once an idele of degree one is chosen.
- `sUnits_exact`: `0 → O_{F,S}ˣ → Fˣ → ⊕_{v ∉ S} ℤ → Cl_S(F) → 0` is exact, the third map being
  `x ↦ (ord_v x)_{v ∉ S}`.
- `finite_sClassGroup`: `Cl_S(F)` is finite when `S` is nonempty.
- `sIdeleClasses_exact`: `0 → C_{F,S} → C_S(F) → Cl_S(F) → 0`, where
  `J_{F,S} = ∏′_{v∈S} (F_vˣ, O_vˣ)` and `C_{F,S}` is the image of
  `J_{F,S} × ∏_{v∉S} O_vˣ` in `C_S(F)`, equivalently `J_{F,S}/sUnits F S`.
  The product defining `J_{F,S}` is restricted even when `S` is infinite.

*Proof sketch.* The product formula and the finiteness of the degree-zero divisor class group
over a finite constant field are TauCetiRoadmap AlgebraicCurves Layers 3 and 5; finiteness of
`Cl_S(F)` follows because a place of `S` has positive degree, so `Cl_S(F)` is a quotient of
`Cl(F)/⟨[v]⟩`, an extension of a finite group by a finite cyclic group. Surjectivity of the
degree is F. K. Schmidt's theorem; compactness of the degree-zero classes is the function-field
case of the compactness of norm-one idele classes (Neukirch–Schmidt–Wingberg, *Cohomology of
Number Fields*, VIII §1, (8.1.26), p. 443, which records the degree sequence and its profinite
completion; VIII §3, pp. 452–455, for `C_S`, `Cl_S` and the finiteness of `Cl_S` for nonempty `S`;
(8.3.5), p. 455; [Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
I §4, pp. 49–50, Lemma 4.1, for the restricted product and exact sequence). *Needs:* Tau Ceti
`TauCeti.Place`, `TauCeti.Place.degree`; Mathlib
`FunctionField`, `RestrictedProduct`; TauCetiRoadmap AlgebraicCurves Layers 3 and 5 (divisors,
the product formula, finiteness of `Cl⁰`).

**Checks.**

- `ff_sUnits_rat_infty`: for `F = 𝔽_q(t)` and `S = {∞}`, the `S`-integers are `𝔽_q[t]`, the
  `S`-units are `𝔽_qˣ` and `Cl_S(F) = 0` (a principal ideal domain); a definition that also
  inverted `t` would give more units.
- For `F = 𝔽₂(t)` and `S` all places, the family of one uniformizer at every place is not
  an idele: it has infinitely many nonunit coordinates. Here `J_{F,S} = ideles F`,
  `C_{F,S} = C_S(F) = ideleClassGroup F` and `Cl_S(F) = 0`.
- `ff_sClassGroup_empty`: for `S = ∅` the quotient of the divisor group by principal divisors
  surjects onto `ℤ` by the degree, so it is infinite; finiteness genuinely needs `S ≠ ∅`.
- `ff_ideleDegree_place`: for the place `v` of `𝔽_q(t)` given by a monic irreducible `π` of
  degree `d`, the idele equal to `π` at `v` and `1` elsewhere has degree `d`, not `1`; a degree
  that forgot `deg v` would give `1`.

**Restricted ramification over a global function field.** For a global function field `F`, a
separable closure `F^s` and a nonempty set `S` of places, let `F_S ⊆ F^s` be the compositum of the
finite separable extensions unramified at every place outside `S`, and `G_{F,S} = Gal(F_S/F)`
with its Krull topology. For each place `v` fix an embedding `F^s ↪ F_v^s` over `F`; it gives
`G_v → G_F → G_{F,S}` and the inertia subgroup `I_v ⊆ G_v`. The API:

- `GlobalFunctionField.maxUnramifiedOutside`, `galoisGroupS`: `F_S` and `G_{F,S}`, functorial in
  `S` exactly as in the number-field case.
- `constantField_le_maxUnramifiedOutside`: every constant field extension `𝔽_{q^n} F` lies in
  `F_S`, so `G_{F,S}` surjects onto `Ẑ = Gal(𝔽̄_q F/F)`.
- `pow_eq_one_mem_maxUnramifiedOutside`: for `n` prime to `ℓ`, `μ_n(F^s) ⊆ F_S` (the constant
  field extension `𝔽_q(μ_n)F` is unramified everywhere). Since `G_{F,S}` surjects onto `Ẑ`, every
  prime, `ℓ` included, lies in the set `P` of primes `p` with `p^∞ ∣ [F_S : F]`.
- `kummer_unramified_iff`: for `n` prime to `ℓ` and `a ∈ Fˣ`, `F(a^{1/n})/F` is unramified at
  `v` exactly when `n ∣ ord_v(a)`.

*Proof sketch.* As for number fields (*The Galois group `G_{K,S}` of the maximal extension
unramified outside `S`*): composita and Galois closures of extensions unramified outside `S` are
unramified outside `S`. Constant field extensions are unramified at every place, and an
`n`-th root of a constant generates a constant field extension when `ℓ ∤ n`. The Kummer criterion
is the prime-to-`ℓ` tame computation at `v` (Neukirch–Schmidt–Wingberg, VIII §3, pp. 452–453,
(8.3.2)–(8.3.4), for `F_S`, the constant field extensions and the Kummer sequence for
`S`-units with `n` prime to `ℓ`). *Needs:* *Function-field places, ideles and `S`-units*;
Mathlib `Field.absoluteGaloisGroup`, `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`.

**Checks.**

- `ff_constant_field_in_S`: for every nonempty `S`, `𝔽_{q²}F ⊆ F_S`; so `G_{F,S}` is never
  trivial, unlike `G_{ℚ,{∞}} = 1`.
- `ff_artin_schreier_ramified`: for `F = 𝔽_p(t)` and `S = {∞}`, the Artin–Schreier extension
  `y^p − y = t` is unramified away from `∞` and lies in `F_S`, while `y^p − y = 1/t` is ramified at
  `t = 0` and does not; `p`-primary ramification is wild and is not governed by the Kummer test.
- `ff_kummer_test`: for `ℓ ≠ 2`, `F(√t)/F` is ramified exactly at `t = 0` and `t = ∞`
  (`ord_0 t = 1`, `ord_∞ t = −1`), so it lies in `F_S` for `S = {0, ∞}` but not for `S = {∞}`.

**Local inputs at places of a global function field.** Let `F_v` be the completion of a global
function field at a place `v`, a local field of characteristic `ℓ` (isomorphic to
`𝔽_{q_v}((t))`), and let `M` be a finite discrete `G_v`-module of order prime to `ℓ`, with
`M^D = Hom(M, μ_m)` for `m` its exponent. Prove `functionFieldLocal`:

1. `cd_p(G_v) = 2` for every prime `p ≠ ℓ` (and `cd_ℓ(G_v) = 1`).
2. The invariant `inv_v : Br(F_v) = H²(G_v, F_v^{s×}) ≅ ℚ/ℤ` restricts to
   `H²(G_v, μ_n) ≅ ℤ/n` for `n` prime to `ℓ`.
3. For `0 ≤ i ≤ 2`, cup product and `inv_v` give a perfect pairing of finite groups
   `Hⁱ(G_v, M^D) × H^{2−i}(G_v, M) → ℚ/ℤ`, and the unramified subgroups `H¹_un(F_v, M)` and
   `H¹_un(F_v, M^D)` are exact annihilators when `M` is unramified.
4. `#H⁰(G_v, M) · #H²(G_v, M) / #H¹(G_v, M) = 1` (the normalised absolute value of `#M` is `1`,
   because `#M` is prime to `ℓ`).

ClassFieldTheory Layers 5 and 6 supply the local invariant and the local class formation of every
nonarchimedean local field. The finite perfect pairing in (3) specializes the imported theorems
`TauCeti.ClassFieldTheory.dualityMap0_kummerCoeff_bijective`,
`TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective` and
`TauCeti.ClassFieldTheory.dualityMap2_kummerCoeff_bijective` with `n = m` and `K = F_v`;
`IsUnit (m : F_v)` follows from `ℓ ∤ m`. Identify the supplied
`TauCeti.AbsoluteGaloisGroup F_v` with `G_v` and `M^D` with
`TauCeti.InternalHom G_v M (TauCeti.KummerCoeff F_v m)`, compare explicit cohomology with
Mathlib's `continuousCohomology` through ProfiniteCohomology Layer 3, and prove that these
comparisons carry the evaluation cup products to each other. Transport the target invariant
through `TauCeti.ClassFieldTheory.muNRepH2Equiv` and `TauCeti.ClassFieldTheory.h2MuEquivZMod`,
followed by `a mod m ↦ a/m mod ℤ`. This identifies the supplied bijections with the displayed
pairing. The unramified-annihilator comparison and the equal-characteristic Euler formula are
arithmetic targets here.

*Proof sketch.* The prime-to-`ℓ` part of `G_v` is controlled by the tame quotient
`Ẑ^{(ℓ′)}(1) ⋊ Ẑ`, which gives (1); (2) follows from the local invariant and Kummer theory.
For (3), use the supplied finite duality with the coefficient, cohomology and invariant
comparisons above. Two unramified classes cup to zero because the residue-field `H²` vanishes;
(4) and finite duality give the complementary subgroup orders and hence exact annihilators.
For (4), use Tate's local Euler characteristic formula for `#M` prime
to the characteristic, where the right side `‖#M‖_v` is `1`
(Neukirch–Schmidt–Wingberg, (7.1.8), p. 376; (7.2.6), whose statement covers local fields of positive characteristic and modules of order prime to it, p. 380; (7.2.9),
p. 383; (7.2.15), p. 387; (7.3.1), p. 392; Milne, *Arithmetic Duality Theorems*, I, Corollary 2.3,
p. 28, and Theorem 2.8, p. 31). *Needs:* TauCetiRoadmap ClassFieldTheory Layers 5 and 6 (the local
invariant and class formation); Tau Ceti
`TauCeti.NumberTheory.ClassFieldTheory.Local.Duality.FiniteModule`; ProfiniteCohomology Layers
3, 8, 9 and 11 (cohomology and cup-product comparisons, Kummer theory, cohomological dimension).

**Checks.**

- For `F_v = 𝔽_q((t))` and `M = ℤ/n` with `ℓ ∤ n` and `μ_n ⊆ 𝔽_q`, `#H¹(G_v, ℤ/n) = n²`
  (unramified and tame characters), `#H⁰ = #H² = n`, and the Euler characteristic is `1`.
  The supplied degree-one duality pairs each unramified cyclic subgroup perfectly with the
  opposite tame quotient; the two unramified subgroups are exact annihilators.
- For `M = ℤ/ℓ` the formula fails: `H¹(G_v, ℤ/ℓ) = F_v/℘(F_v)` (Artin–Schreier) is infinite, so
  the hypothesis `ℓ ∤ #M` cannot be dropped.
- `cd_ℓ(G_v) = 1`, not `2`: the `ℓ`-primary part behaves differently.

**The class formation of a global function field.** Prove `GlobalFunctionField.classFormation`:
for a global function field `F`,

1. the sequence `0 → Br(F) → ⊕_v Br(F_v) → ℚ/ℤ → 0`, the last map the sum of the local invariants,
   is exact;
2. `(G_F, C)`, with `C = colim_L C_L` the idele classes of the finite separable extensions, is a
   class formation with invariant `inv : H²(G_F, C) ≅ ℚ/ℤ` induced by the sum of the local
   invariants. For every finite Galois extension `L/F`, its reciprocity map
   `C_F/N_{L/F}C_L ≅ Gal(L/F)^ab` is compatible with the local reciprocity maps of
   ClassFieldTheory Layer 7; the finite-extension hypotheses are `[FiniteDimensional F L]`
   and `[IsGalois F L]`. The norm groups of finite abelian extensions are exactly the open
   subgroups of finite index of `C_F`;
3. for a nonempty set `S` of places, `(G_{F,S}, C_S)` with `C_S = colim C_S(L)` over the finite
   subextensions of `F_S` is a class formation, `H¹(G_{F,S}, C_S) = 0`, `H²(G_{F,S}, C_S) ≅ ℚ/ℤ`
   (the supernatural order of `G_{F,S}` is divisible by every prime, because `F_S` contains the
   constant field extensions) and `H³(G_{F,S}, C_S) = 0`; and the reciprocity map gives the exact
   sequence `0 → C_S(F) → G_{F,S}^ab → Ẑ/ℤ → 0`.

This is the function-field counterpart of ClassFieldTheory Layers 10–12, which state global class
field theory for number fields only. *Proof sketch.* The cohomology of the ideles is the sum of
the local cohomologies (Shapiro over the decomposition groups); the class field axiom for cyclic
extensions follows from the Herbrand quotient of the idele classes and the first and second
inequalities, which for function fields use the degree map in place of the archimedean places;
the Brauer sequence and the invariant then follow as for number fields, and the `S`-version is
obtained by passing to the quotient by the units outside `S` (Neukirch–Schmidt–Wingberg, VIII §1,
(8.1.1), p. 426, (8.1.17), p. 437, (8.1.21), p. 440, (8.1.23), (8.1.24) and (8.1.26),
pp. 441–443; VIII §3, (8.3.9), p. 457, (8.3.10), p. 458, and (8.3.15), p. 461;
[Poonen, *A brief summary of the statements of class field theory*](https://math.mit.edu/~poonen/papers/cft.pdf),
§§2.4–2.6, p. 4, for the Artin image, norm functoriality and abelian norm groups). *Needs:*
*Function-field places, ideles and `S`-units*, *Restricted ramification over a global function
field*, *Local inputs at places of a global function field*; TauCetiRoadmap ClassFieldTheory
Layers 2–4 (class formations, Tate's theorem and the abstract Artin map), Layer 5 (local
invariants) and Layer 7 (local reciprocity); ProfiniteCohomology Layer 7 (Shapiro).

**Checks.**

- For `F = 𝔽_q(t)`, `Br(F) → ⊕_v Br(F_v)` is injective and the quaternion algebra `(t, c)` with
  `c ∈ 𝔽_qˣ` a nonsquare and `q` odd is ramified exactly at `t = 0` and `t = ∞`, with invariants
  `½, ½` summing to `0`.
- Let `E = 𝔽₃(t)`, `G = PGL₂(𝔽₃) ≅ S₄`, `H = ⟨t ↦ −t⟩`, `F = E^G` and `L = E^H`.
  The involution is a transposition on `ℙ¹(𝔽₃)`, so `Aut_F(L) = N_G(H)/H ≅ C₂`, while
  `L ∩ F^ab = F` since `⟨H, A₄⟩ = S₄`. Restriction on abelianized absolute Galois groups
  is onto and preserves the integral constant-field Frobenius coordinate; Artin injectivity
  and norm functoriality give `N_{L/F}C_L = C_F`. Thus the finite reciprocity formula needs
  the Galois hypothesis.
- The reciprocity sequence has `Ẑ/ℤ`, not `0`, as its cokernel: the constant field extensions
  give a quotient `Ẑ` of `G_{F,S}^ab` that the degree only hits on `ℤ`.
- The class formation is stated for `G_F`, not for `G_{F,∅}`: with `S` empty the `S`-idele class
  group is not the right coefficient module, which is why every `S`-statement assumes `S ≠ ∅`.

### R02.3.3 `S`-ideles and the `S`-class formation

**S-ideles, S-units and S-idele classes.** Let `S` contain the archimedean places. For a finite
extension `F` of `K` in `K_S` put

```text
J_{F,S} = ∏′_{w∈S} F_w^×   (restricted product with respect to the local units Ô_w^×),
R_{F,S} = the ring of S-integers of F,   E_{F,S} = R_{F,S}^×,   C_{F,S} = J_{F,S}/E_{F,S},
U_{F,S} = ∏_{w∉S} Ô_w^× ⊆ J_F,   C_S(F) = C_F/U_{F,S},   Id_{F,S} = Pic(R_{F,S}).
```

Let `J_S`, `E_S`, `C_S` and `U_S` be the direct limits over the finite `F ⊆ K_S`. They are discrete
`G_S`-modules, and `0 → E_S → J_S → C_S → 0` is exact. At each level
`0 → C_{F,S} → C_F/U_{F,S} → Id_{F,S} → 0` is exact, and `Id_{F,S} = 0` when `S` omits only
finitely many places (Milne, Lemma 4.1).

The API:

- `RestrictedRamification.sIdeles`: `J_{F,S}` as a restricted product, with its locally compact
  topology.
- `RestrictedRamification.sUnits`: `E_{F,S} = R_{F,S}^×` embedded diagonally, a discrete subgroup
  of `J_{F,S}`.
- `RestrictedRamification.sIdeleClasses`: `C_{F,S} = J_{F,S}/E_{F,S}` and `C_S(F) = C_F/U_{F,S}`.
- `RestrictedRamification.limitModules`: `E_S`, `J_S`, `C_S` and `U_S` as the filtered colimits
  over the finite subextensions `F ⊆ K_S` along the inclusions `E_{F,S} → E_{F′,S}`, `J_{F,S} → J_{F′,S}`, and so on, with their `G_S`-actions, under which every element is fixed by an open
  subgroup.
- `RestrictedRamification.sIdeleClasses_exact`: `0 → C_{F,S} → C_F/U_{F,S} → Pic(R_{F,S}) → 0` is
  exact.
- `RestrictedRamification.pic_eq_bot_of_cofinite`: if `S` omits only finitely many places,
  `Pic(R_{F,S}) = 0`.
- `RestrictedRamification.sIdeles_all`: if `S` is the set of all places, `J_{F,S} = J_F`,
  `E_{F,S} = F^×` and `C_{F,S} = C_F`, the idele class group of GlobalNumberFields.
- `RestrictedRamification.integralUnitsOutside K S` is the subgroup of finite ideles whose
  components have valuation one at every finite `v ∉ S`. Its membership theorem is
  `RestrictedRamification.mem_integralUnitsOutside_iff`; additive orders at these places are zero.
  At `S = ∅` it equals Tau Ceti's `IsDedekindDomain.FiniteAdeleRing.integralUnits`
  (`RestrictedRamification.integralUnitsOutside_empty`), and
  `RestrictedRamification.integralUnitsOutside_mono` states
  `S ⊆ T ⇒ integralUnitsOutside K S ≤ integralUnitsOutside K T`.
  At all finite places it is the whole finite idele group
  (`RestrictedRamification.integralUnitsOutside_univ`). By contrast, `U_{F,S}` consists of local
  units outside `S` extended by one at `S`; it is antitone in `S`. Its inclusion into
  `integralUnitsOutside F S` and its use in `C_F/U_{F,S}` retain this distinction.
- For a finite Galois extension `L/K`, a finite place `v` of `K` and an explicitly chosen
  `w ∣ v`, put `D_w = MulAction.stabilizer Gal(L/K) w`. After additive transport, define the
  local multiplicative groups as `Rep ℤ D_w` and construct
  `RestrictedRamification.semilocalUnits_coinduced`:
  `Additive (∏_{w′∣v} L_{w′}^×) ≅ Coind_{D_w}^{Gal(L/K)} Additive L_w^×` as `Rep`s.
  The integral version `RestrictedRamification.semilocalIntegralUnits_coinduced` replaces
  `L_w^×` by `Ô_w^×`. Use ArithmeticGaloisRepresentations §2.1's action on finite places,
  its finite-level stabilizer comparison with NumberFieldArithmetic §5.6, and Tau Ceti's
  `TauCeti.semilocalEquiv` and completion
  transport maps. Changing `w` to `σw` gives the conjugate stabilizer and the canonical
  conjugation isomorphism of coinduced modules; the comparison commutes with evaluation and
  satisfies the composition law for two changes of place.
- Assemble these local isomorphisms with the restricted-product conditions into `sIdeles` as
  a Galois representation. The diagonal S-unit map is a morphism of representations and
  `sIdeleClasses` is its cokernel in `Rep ℤ Gal(L/K)` at each finite Galois level.
  Colimits recover `limitModules` with `TauCeti.IsSmoothDiscrete`; the topologies on the finite
  level idele groups and the discrete topology on the colimit are separate constructions.
  This coinduction interface follows the Imperial College London FLT project.

*Proof sketch.* Inside `J_F`, `F^× ∩ U_{F,S} = 1` and `J_{F,S} ∩ (F^× · U_{F,S}) = E_{F,S}`, so
`J_{F,S} → C_F/U_{F,S}` has kernel `E_{F,S}`. The cokernel is
`J_F/(J_{F,S} · U_{F,S} · F^×) ≅ (⊕_{w∉S} ℤ)/im(F^×) = Pic(R_{F,S})`. The transition maps are the
idele inclusions of GlobalNumberFields Layer 8 and are Galois equivariant; every element is fixed
by an open subgroup, so the limits are discrete `G_S`-modules, and filtered colimits preserve
exactness. A Dedekind domain with finitely many primes is a principal ideal domain. ([Milne,
*Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4,
Lemma 4.1, p. 49 (PDF p. 57).) *Needs:* *The Galois group `G_{K,S}` of the maximal extension
unramified outside `S`*; GlobalNumberFields Layers 6 and 8; Mathlib `Set.integer`; Mathlib
`Set.unit`; Mathlib `RestrictedProduct`; Mathlib `ClassGroup`; ArithmeticGaloisRepresentations
§2.1 (the action on places and decomposition stabilizers); Tau Ceti `TauCeti.semilocalEquiv` and
`IsDedekindDomain.FiniteAdeleRing.integralUnits`; ProfiniteCohomology Layer 7 (coinduction and
Shapiro); NumberFieldArithmetic §5.6 (finite-level place action and completion transport).
The local coinduction description is the one used in Milne, Chapter I, proof of
Lemma 4.4, p. 51 (PDF p. 59).

**Checks.**

- `s_units_rat_infty`: for `K = F = ℚ` and `S = {∞}`, `E_{ℚ,S} = {±1}`, `J_{ℚ,S} = ℝ^×` and
  `C_{ℚ,S} = ℝ^×/{±1} ≅ ℝ_{>0}`.
- `s_units_all`: if `S` is the set of all places, `E_{F,S} = F^×`.
- `s_classes_all`: if `S` is the set of all places, `C_{F,S} = C_F`, and `C_S` is the idele-class
  module of the global class formation (ClassFieldTheory Layer 11).
- For `K = ℚ` and `S = {2, ∞}`, `E_{ℚ,S} = {±1} × 2^ℤ`.
- For `K = ℚ(√−5)` and `S = {∞}`, `Pic(R_{K,S}) = ℤ/2`, so `C_{K,S} → C_K/U_{K,S}` is not
  surjective: the cokernel `Id_{K,S}` cannot be omitted.
- The finite idele of `ℚ` with component `2` at `2` and `1` elsewhere belongs to
  `integralUnitsOutside ℚ {2}` and not to `integralUnitsOutside ℚ ∅`. Thus this group increases
  with `S`; `U_{ℚ,{2,∞}}` instead has component `1` at `2`.
- For `L = ℚ(i)` and `v = 5`, there are two places above `v` and `D_w = 1`; the semilocal
  module is the product of two copies of `ℚ₅^×`, with the Galois group swapping them.
- For `L = ℚ(i)` and `v = 3`, there is one place and `D_w = Gal(L/ℚ)`; coinduction from the
  whole group is the original local module. Choosing the other place above `5` gives the
  same semilocal representation under the swap, also for the integral units.

**The S-idele classes as a quotient of the idele classes.** Let `S` contain the archimedean
places; `S` may be finite. Then `lim_F Pic(R_{F,S}) = 0` over the finite `F ⊆ K_S`, so the maps
`C_{F,S} → C_F/U_{F,S}` induce an isomorphism `C_S ≅ C^{H_S}/U_S` and an exact sequence
`0 → U_S → C^{H_S} → C_S → 0` of discrete `G_S`-modules, where `C` is the idele-class module of
`K^s`. Moreover `H^r(G_S, U_S) = 0` for `r ≥ 1`; hence `C_S^{G_S} = C_K/U_{K,S}`, and
`H^r(G_S, C^{H_S}) → H^r(G_S, C_S)` is an isomorphism for `r ≥ 1`. The same holds over every
finite `F ⊆ K_S`.

*Proof sketch.* If `S` omits only finitely many places, Lemma 4.1 gives isomorphisms at every level
(the source says "when `S` is finite" at this point; for finite `S` the groups `Pic(R_{F,S})` are in
general nonzero). In general the cokernel of the limit map is `lim_F Pic(R_{F,S})`. By class field
theory `Pic(R_{F,S}) ≅ Gal(F′/F)` for the maximal unramified abelian extension `F′` of `F` in which
the places of `S` split completely, and `Pic(R_{F,S}) → Pic(R_{F′,S})` corresponds to the transfer
`Gal(L/F)^ab → Gal(L/F′)`, where `L` is the maximal unramified abelian extension of `F′` in which
the places of `S` split completely, so that `Gal(L/F′)` is the commutator subgroup of `Gal(L/F)`;
the principal ideal theorem makes this transfer zero. Since `F′ ⊆ K_S`, the limit vanishes
(ClassFieldTheory Layer 13). Next, `H^r(G_S, U_S) = lim_F ∏_{v∉S} H^r(Gal(F_w/K_v), Ô_w^×)`:
finite-group cohomology commutes with products and Shapiro's lemma reduces to a decomposition group
(ProfiniteCohomology Layers 4 and 7); `H^r(Gal(F_w/K_v), Ô_w^×) = 0` for `r ≥ 1` because `F_w/K_v`
is unramified (ClassFieldTheory Layer 6). `(C^{H_S})^{G_S} = C_K` by Galois descent for idele
classes (ClassFieldTheory Layer 10), and the long exact sequence in every degree
(ProfiniteCohomology Layer 10) gives the rest. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Proposition 4.3,
p. 50 (PDF p. 58); [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Lemma 4.4, p. 51
(PDF p. 59).) *Needs:* *S-ideles, S-units and S-idele classes*; ClassFieldTheory Layers 6, 10 and
13; ProfiniteCohomology Layers 4, 7 and 10.

**Checks.**

- For `K = ℚ(√−5)` and `S = {∞}`, the class of `𝔭 = (2, 1 + √−5)` generates `Pic(R_{K,S}) = ℤ/2`,
  and it dies in the Hilbert class field `F′ = K(i)`: there `𝔭O_{F′} = (1 + i)`, since both ideals
  have square `(2)`. So the limit kills a class that is nonzero at the bottom level.
- For `K = ℚ` and `S = {∞}`, `G_S = 1` and `C_S = C_ℚ/∏_q ℤ_q^× ≅ ℝ_{>0}`, matching
  `C_{ℚ,S} = ℝ^×/{±1}`.
- If `S` is the set of all places, `U_S = 0`, `H_S = 1` and the sequence reduces to `C_S = C`.

**P-class formations.** Let `P` be a set of primes. A `P`-class formation is a profinite group `G`
(with no further condition), a discrete `G`-module `C` and injective homomorphisms
`inv_U : H²(U, C) → ℚ/ℤ` for the open subgroups `U ≤ G`, such that: (a) `H¹(U, C) = 0` for every
open `U`; (b) `inv_V ∘ Res_{V,U} = (U : V) · inv_U` for open `V ≤ U`, and for `V` normal in `U` the
composite `inv_{U/V}` of inflation `H²(U/V, C^V) → H²(U, C)` with `inv_U` is an isomorphism onto
`(U : V)⁻¹ℤ/ℤ`; and (c) for `ℓ ∈ P`, `inv_U` induces `H²(U, C)(ℓ) ≅ (ℚ/ℤ)(ℓ)`. When `P` is the set
of all primes the `inv_U` are isomorphisms, which is a class formation in Milne's sense; `P = ∅`
gives the class formations of Artin–Tate, where only the isomorphisms for the finite layers `U/V`
are required.

The API:

- `ClassFormation.PClassFormation`: the structure `(G, C, (inv_U))` with injective invariant maps
  satisfying (a), (b) and (c).
- `ClassFormation.PClassFormation.ofClassFormation`: a ClassFieldTheory class formation, whose
  invariant maps are bijective, is a `P`-class formation for every `P`.
- `ClassFormation.PClassFormation.quotient`: for a class formation `(G, C)` (all invariant maps
  bijective) and a closed normal subgroup `H`, `(G/H, C^H)` is a `P_H`-class formation, where
  `p ∈ P_H` if and only if every `pⁿ` divides `(G : V)` for some open `V ⊇ H`, that is, `p^∞`
  divides the supernatural index `(G : H)`. The input is a class formation, not an arbitrary
  `P`-class formation.
- `ClassFormation.PClassFormation.restrict`: restriction to an open subgroup is again a `P`-class
  formation.
- `ClassFormation.PClassFormation.invPrimaryEquiv`: `H²(U, C)(ℓ) ≅ (ℚ/ℤ)(ℓ)` for `ℓ ∈ P`.
- `ClassFormation.PClassFormation.fundamentalClass`: `u_{U/V} ∈ H²(U/V, C^V)`, the class of
  invariant `1/(U : V)`.

*Proof sketch.* A class formation of ClassFieldTheory Layer 2 (in Tau Ceti the structure
`TauCeti.ClassFieldTheory.ClassFormation`, with `fundamentalClass`) whose invariant maps are
bijective is a `P`-class formation for every `P`. For `H` closed and normal in `G`, `(G/H, C^H)` is
a `P`-class formation with `P = {ℓ : ℓ^∞ divides (G : H)}`: since `H¹(H, C) = 0`, inflation
identifies `H²(U/H, C^H)` with the colimit of the `H²(U/V, C^V)` over open `V ⊇ H`, which `inv_U`
maps onto the elements of `ℚ/ℤ` whose order divides the supernatural index `(U : H)`
(ProfiniteCohomology Layer 10, ProfiniteProPGroups Layer 1). ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §1, a generalization, p. 25
(PDF p. 33).) *Needs:* ClassFieldTheory Layer 2; ProfiniteCohomology Layer 10; ProfiniteProPGroups
Layer 1.

**Checks.**

- `class_formation_empty`: `ofClassFormation` with `P = ∅` holds for every class formation; for
  `P = ∅`, condition (c) is empty and only the finite-layer isomorphisms of (b) are required.
- `class_formation_primary`: for `p ∈ P` the invariant map on the `p`-primary part of `H²(U, C)` is
  bijective.
- `class_formation_index_one`: for `V = U`, `H²(U/U, C^U) = 0`, so the fundamental class `u_{U/U}`
  is `0`, matching `1/(U : U) = 0` in `ℚ/ℤ`.
- `G = Ẑ`, `C = ℤ`, with `inv_U` from the connecting map of `0 → ℤ → ℚ → ℚ/ℤ` and a chosen
  generator, is a class formation (Milne Example 1.6(a)).
- With `G = Ẑ`, `C = ℤ` and `H = ∏_{ℓ≠p} ℤ_ℓ`, `quotient` gives `(G/H, C^H) = (ℤ_p, ℤ)`, a
  `{p}`-class formation but not a class formation, since `H²(ℤ_p, ℤ) = ℚ_p/ℤ_p ≠ ℚ/ℤ`: the invariant
  maps are injective, not bijective.
- `(G_K, C)` for a number field `K` is a class formation (ClassFieldTheory Layer 11), hence a
  `P`-class formation for every `P`.

**`(G_S, C_S)` is a P-class formation.** Let `K` be a number field and `S` a set of places containing
the archimedean ones. Then `(G_S, C_S)` is a `P`-class formation, with `P` the set of primes `ℓ`
such that `ℓ^∞` divides `[K_S : K]`, and `C_S^{Gal(K_S/F)} = C_F/U_{F,S}` for every finite
`F ⊆ K_S`. Its invariant maps are those of the global class formation `(G_K, C)`, transported along
`H^r(G_S, C^{H_S}) ≅ H^r(G_S, C_S)`.

*Proof sketch.* `(G_K, C)` is a class formation (ClassFieldTheory Layer 11), so `(G_S, C^{H_S})` is
a `P`-class formation by the quotient construction of *P-class formations*
(`ClassFormation.PClassFormation.quotient`). *The S-idele classes as a quotient of the idele
classes* gives `H^r(G_S, C^{H_S}) ≅ H^r(G_S, C_S)` for `r ≥ 1`, and the same for every open
subgroup `Gal(K_S/F)` (as `F_S = K_S`); transport the invariant maps. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Proposition 4.2, p. 50
(PDF p. 58).) *Needs:* *P-class formations*; *The S-idele classes as a quotient of the idele
classes*; *The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*;
ClassFieldTheory Layer 11.

**Checks.**

- For `K = ℚ` and `S = {∞}`, `G_S = 1` and `P = ∅`; the axioms hold trivially, and nothing is
  asserted about `ℓ`-primary parts.
- For `K = ℚ` and `S = {2, ∞}`, `2 ∈ P` since `ℚ(ζ_{2^∞}) ⊆ K_S`, so
  `H²(G_S, C_S)(2) ≅ ℚ₂/ℤ₂`.
- If `S` is the set of all places, `P` is the set of all primes and the structure is the class
  formation `(G_K, C)` itself.

**Reciprocity for the S-idele classes.** Let `K` be a number field, `S` a set of places containing
the archimedean ones, and `D_S(K)` the identity component of `C_S(K) = C_K/U_{K,S}`. Then
`D_S(K) = D_K U_{K,S}/U_{K,S}`, it is divisible, and

```text
0 → D_S(K) → C_S(K) → G_S^ab → 0
```

is exact, the second map being induced by the global reciprocity map. The same holds over every
finite `F ⊆ K_S`.

*Proof sketch.* For `S` the set of all places: the reciprocity map `C_K → G_K^ab` is surjective
with kernel the identity component `D_K`, which is divisible (ClassFieldTheory Layer 12;
GlobalNumberFields Layer 7). `U_{K,S}` is compact, so `C_K → C_S(K)` is proper and the image of
`D_K` is closed; it is the identity component of `C_S(K)`, and divisible as a quotient of a
divisible group. The image of `U_{K,S}` in `G_K^ab` is the closed subgroup generated by the inertia
groups at `v ∉ S` (local units map onto inertia, ClassFieldTheory Layers 7 and 11), which is
`Gal(K^ab/K_S ∩ K^ab)`, the kernel of `G_K^ab → G_S^ab`; the snake lemma gives the exact sequence.
([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I,
§4, Lemma 4.5, p. 51 (PDF p. 59).) *Needs:* *`(G_S, C_S)` is a P-class formation*; *S-ideles,
S-units and S-idele classes*; ClassFieldTheory Layers 7, 11 and 12; GlobalNumberFields Layer 7.

**Checks.**

- For `K = ℚ` and `S = {∞}`: `C_S(ℚ) = D_S(ℚ) ≅ ℝ_{>0}` and `G_S^ab = 1`.
- For `K = ℚ` and `S = {p, ∞}`: `C_S(ℚ) ≅ ℝ_{>0} × ℤ_p^×`, `D_S(ℚ) = ℝ_{>0}`, and the sequence
  identifies `ℤ_p^×` with `G_S^ab = Gal(ℚ(μ_{p^∞})/ℚ)`.
- The statement is for number fields only: for a global function field the reciprocity map on
  `C_S(F)` is injective with cokernel `Ẑ/ℤ` (*The class formation of a global function field*).

**The Kummer sequence for S-units.** Let `S` contain the archimedean places and let `m` be a unit
in `R_{K,S}`, that is, `S` contains the places above `m`. Then `0 → μ_m → E_S → E_S → 0`, the last
map `x ↦ x^m`, is an exact sequence of discrete `G_S`-modules, `H⁰(G_S, E_S) = E_{K,S}`,
`H¹(G_S, E_S) ≅ Pic(R_{K,S})`, and

```text
0 → E_{K,S}/E_{K,S}^m → H¹(G_S, μ_m) → Pic(R_{K,S})[m] → 0
```

is exact.

*Proof sketch.* `E_S` is `m`-divisible: for `a ∈ E_{F,S}`, `F(a^{1/m})/F` is unramified outside
`S`, since `m` and `a` are units at every finite place outside `S`; so `a^{1/m} ∈ E_S`, and the
kernel of `x ↦ x^m` is `μ_m ⊆ K_S`. Next, `0 → E_S → K_S^× → Div_S → 0`, with `Div_S` the colimit
of the divisor groups `⊕_{w∉S} ℤ` of the `R_{F,S}`. Since the places outside `S` are unramified in
`K_S`, `Div_S^{G_S} = Div(R_{K,S})` and `H¹(G_S, Div_S) = 0` (Shapiro's lemma and
`H¹(finite group, ℤ) = 0`, ProfiniteCohomology Layer 7). `H¹(G_S, K_S^×) = 0` (Hilbert 90 for the
Galois extension `K_S/K`, ProfiniteCohomology Layer 9), so the long exact sequence gives
`H¹(G_S, E_S) = coker(K^× → Div(R_{K,S})) = Pic(R_{K,S})`. The long exact sequence of
`0 → μ_m → E_S → E_S → 0` (ProfiniteCohomology Layer 5) gives the Kummer sequence; for `S` the set
of all places, `E_S = K^{s×}` and it is Tau Ceti's `TauCeti.kummerShortExact`. ([Milne, *Arithmetic
Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of
Lemma 4.12, p. 59 (PDF p. 67); [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, proof of Corollary 4.18,
p. 63 (PDF p. 71).) *Needs:* *S-ideles, S-units and S-idele classes*; *The Galois group `G_{K,S}` of
the maximal extension unramified outside `S`*; ProfiniteCohomology Layers 5, 7 and 9; Mathlib
`ClassGroup`; Tau Ceti `TauCeti.kummerShortExact`.

**Checks.**

- For `K = ℚ`, `S = {2, ∞}` and `m = 2`: `E_{ℚ,S}/E_{ℚ,S}^2 = ⟨−1, 2⟩ ≅ (ℤ/2)²` and
  `Pic(ℤ[1/2]) = 0`, so `H¹(G_S, μ₂)` has order `4`, as in *Finiteness of `H¹(G_{K,S}, M)`*.
- For `K = ℚ(√−21)`, `S = {𝔭₂, ∞}` with `𝔭₂² = (2)` and `m = 2`: `Cl(K) ≅ (ℤ/2)²` and `[𝔭₂]` is
  nontrivial, so `Pic(R_{K,S}) ≅ ℤ/2`; `E_{K,S} = {±1} × 2^ℤ`, and `H¹(G_S, μ₂)` has order
  `4 · 2 = 8`, the `Pic[m]` term contributing.
- The hypothesis on `m` is needed: for `K = ℚ`, `S = {∞}` and `m = 2`, `E_S = {±1}` and
  `x ↦ x²` is not surjective on it.

### R02.3.4 Locally trivial classes

**Absolute and relative locally trivial groups.** Let `F` be a global field and `M` a finite
discrete `G_F`-module, of order prime to the characteristic of `F` when `F` is a function field.
For `i ≥ 0` let `Шⁱ(F, M)` be the kernel of the localisation map
`Hⁱ(G_F, M) → ∏_v Hⁱ(F_v, M)`, the product over all places `v` of `F`, archimedean ones included,
with the local groups of *Localisation maps and the modified local groups*. In degrees `1` and `2`
the Tate groups at a real place are ordinary cohomology (`Ĥⁱ = Hⁱ` for `i ≥ 1`); in degree `0` the
modified group `Ĥ⁰` is used. For a finite Galois extension `K/F` with `G_K` acting trivially on
`M`, let `Ш¹(K/F, M)` be the kernel of `H¹(Gal(K/F), M) → ∏_v H¹(Gal(K_w/F_v), M)`, where `w` is a
place of `K` above `v`. For a finite separable extension `F′/F`, restriction maps `Шⁱ(F, M)` into
`Шⁱ(F′, M)` and corestriction maps `Шⁱ(F′, M)` into `Шⁱ(F, M)`, by the compatibility of
localisation with restriction and the Mackey decomposition over the places above `v`. No finite set
`S` of places enters the definition.

The API:

- `ArithmeticDuality.absoluteSha`: `Шⁱ(F, M)`, the kernel of the localisation map to the product
  over all places. Its arithmetic instance, with `loc_v` the maps
  `ContinuousCohomology.map (Field.absoluteGaloisGroup.map (algebraMap F F_v)) (𝟙 _) i`,
  is Mathlib's `ContinuousCohomology.tateShafarevich` (ordinary `H⁰` there, modified `H⁰` here).
- `ArithmeticDuality.relativeSha`: `Ш¹(K/F, M)`, the kernel of restriction from `Gal(K/F)` to all
  the decomposition groups `Gal(K_w/F_v)`.
- `ArithmeticDuality.mem_absoluteSha`: a class lies in `Шⁱ(F, M)` if and only if all its
  localisations vanish.
- `ArithmeticDuality.sha_res_cor`: restriction and corestriction preserve the kernels.

*Proof sketch.* The groups are kernels of products of localisation maps. In the relative case,
restrict the cohomology of the finite group `Gal(K/F)` to every decomposition subgroup. For
restriction and corestriction, compare with each local map: restriction commutes with
localisation, and `loc_v ∘ cor = Σ_{w|v} cor_{F′_w/F_v} ∘ loc_w` by the Mackey decomposition.
([Qian, *Potential automorphy for `GL_n`*](https://par.nsf.gov/servlets/purl/10388233), §2,
Lemmas 2.1–2.2 and proofs, published pp. 1245–1246; [Neukirch–Schmidt–Wingberg, *Cohomology of
Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.6, definition
preceding Theorem 8.6.7, pp. 481–485.) *Needs:* *Localisation maps and the modified local groups*;
*Local inputs at places of a global function field*; *The class formation of a global function
field*; ProfiniteCohomology Layer 10; §R02.3.0d *Finite Galois localization and Sha kernels*.

**Checks.**

- For `M = 0`, `Шⁱ(F, M) = 0` in every degree.
- For zero localization maps, `ArithmeticDuality.absoluteSha` is the whole source group; for a
  one-component identity localization it is zero.
- `absolute_sha_nonzero_local`: the class of `ℚ(i)` in `H¹(ℚ, ℤ/2)` is not in `Ш¹(ℚ, ℤ/2)`, since
  its localisations at `2` and at `∞` are nonzero.
- `relative_sha_identity`: for `K = F`, `H¹(Gal(F/F), M) = 0`, so `Ш¹(F/F, M) = 0`.
- `Ш⁰(F, M) = 0` for every `M`: at a finite place `v`, `H⁰(G_F, M) → H⁰(F_v, M)` is the inclusion
  `M^{G_F} ⊆ M^{G_v}`.
- `Ш¹(F, ℤ/n) = 0` for trivial action (`n` prime to the characteristic): a cyclic extension in
  which every place splits completely is trivial, by Chebotarev (ArithmeticGaloisRepresentations
  §5.13 / **Chebotarev for function fields**, in the function-field case).

**Cyclotomic description of the power kernel.** Let `F` be a number field, `p` a prime, `r ≥ 1` and
`K = F(μ_{pʳ})`; localisation is over every place of `F`, archimedean ones included. Inflation
identifies `Ш¹(F, μ_{pʳ})` with

```text
Ш¹(K/F, μ_{pʳ}) = ker( H¹(Gal(K/F), μ_{pʳ}) → ∏_v H¹(Gal(K_w/F_v), μ_{pʳ}) ).
```

The group `H¹(Gal(K/F), μ_{pʳ})` is zero unless `p = 2`, `r ≥ 2` and `−1` lies in the image of
`Gal(K/F) → (ℤ/2ʳ)^×`, in which case it is `ℤ/2`. Hence `Ш¹(F, μ_{pʳ})` is `0` or `ℤ/2`; a nonzero
`H¹(Gal(K/F), μ_{pʳ})` does not by itself make `Ш¹(F, μ_{pʳ})` nonzero. Let `L/F` be a finite
extension linearly disjoint from `K`, with `μ_{pʳ}` the same roots of unity over `L`. Then
restriction `H¹(Gal(K/F), μ_{pʳ}) → H¹(Gal(LK/L), μ_{pʳ})` is an isomorphism, but it need not
identify `Ш¹(F, μ_{pʳ})` with `Ш¹(L, μ_{pʳ})`, because the decomposition groups can shrink. If
`p = 2` and `[L : F]` is even, corestriction is zero on `Ш¹(L, μ_{2ʳ})`.

*Proof sketch.* Over `K` the coefficient module is constant, and by Chebotarev an everywhere-split
cyclic extension is trivial, so `Ш¹(K, μ_{pʳ}) = 0`; inflation–restriction, globally and locally,
gives the identification with `Ш¹(K/F, μ_{pʳ})`. The group `Gal(K/F)` is a subgroup of
`(ℤ/pʳ)^×`; compute its cohomology by cyclic resolutions, where the only nonvanishing case is the
dyadic one in which `−1` acts. Linear disjointness identifies the ambient groups. Every class of
`Ш¹(L, μ_{2ʳ})` is the restriction of a class `y` of the ambient group, which has exponent `2`, so
its corestriction is `cor ∘ res (y) = [L : F] · y = 0`. ([Neukirch–Schmidt–Wingberg, *Cohomology of
Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §9.1, Propositions
9.1.5–9.1.6, pp. 526–527; [Qian, *Potential automorphy for
`GL_n`*](https://par.nsf.gov/servlets/purl/10388233), §2, Lemmas 2.1–2.2 and proofs, published
pp. 1245–1246.) *Needs:* *Absolute and relative locally trivial groups*; *Restriction and
corestriction descent for finite index* (Layer R02.2); Chebotarev Layer 10.

**Checks.**

- For `F = ℚ` and `r = 2` with `p = 2`: `H¹(Gal(ℚ(i)/ℚ), μ₄) = ℤ/2`, but the decomposition group
  at `∞` is all of `Gal(ℚ(i)/ℚ)`, so `Ш¹(ℚ, μ₄) = 0`.
- For odd `p`, `H¹(Gal(K/F), μ_{pʳ}) = 0`, so `Ш¹(F, μ_{pʳ}) = 0`.
- For `F = ℚ` and `r = 3` with `p = 2`: `Gal(ℚ(ζ₈)/ℚ) = (ℤ/8)^×` contains `−1` and the ambient
  group is `ℤ/2`, yet `Ш¹(ℚ, μ₈) = 0` because `2` is totally ramified in `ℚ(ζ₈)`; the nonzero class
  of `16` appears only when the place `2` is left out (see Examples). So the condition on `−1` is
  not the same as the special case of the Grunwald–Wang theorem.

### R02.3.5 Kummer fields and class-field applications

**Exponent-two ramification fields.** Let `F` be a number field and `S` a finite set of finite
places of `F`. Let `F(S) ⊆ F^s` be the maximal abelian extension of `F` of exponent two that is
unramified at every finite place outside `S`; ramification at the real places is allowed and no
splitting condition at infinity is imposed. Then `F(S)` is finite over `F`: by Kummer theory and
the ray-class correspondence it corresponds to the finitely many square classes
`a ∈ F^×/F^{×2}` with `ord_v(a)` even at every finite `v ∉ S` and `F_v(√a)/F_v` unramified at the
dyadic `v ∉ S`. If `S ⊆ S′` then `F(S) ⊆ F(S′)`. Because real places may ramify, `F(∅)` can be
larger than the maximal exponent-two subextension of the Hilbert class field.

The API:

- `ArithmeticDuality.exponentTwoField`: `F(S)`, the compositum inside `F^s` of the quadratic
  extensions of `F` unramified at every finite place outside `S`.
- `ArithmeticDuality.exponentTwoField_mono`: `S ⊆ S′` gives `F(S) ⊆ F(S′)`.
- `ArithmeticDuality.exponentTwoField_contains`: every quadratic extension unramified at the finite
  places outside `S` lies in `F(S)`.
- `ArithmeticDuality.exponentTwoField_finite`: `F(S)/F` is finite.
- `ArithmeticDuality.exponentTwoField_le`: `F(S)` lies in the maximal extension `F_{S ∪ S_∞}`
  unramified outside `S`.

*Proof sketch.* By class field theory, `Gal(F(S)/F)` is the maximal exponent-two quotient of a ray
class group whose modulus is supported on `S` and the real places, which is finite. Equivalently,
by Kummer theory the relevant square classes form a subgroup of an extension of
`Pic(R_{F,S})[2]` by `E_{F,S}/E_{F,S}^2` (with `S`-units for `S` together with the archimedean
places), and both are finite. The compositum of the quadratic extensions is identified by the parity of valuations and
the dyadic conditions. ([Newton–Thorne, *Symmetric power functoriality for Hilbert modular
forms*](https://api.repository.cam.ac.uk/server/api/core/bitstreams/6bd9d94f-51d3-42e2-9cb1-ffc812189ac5/content),
§5, definition of `F(S)`, p. 38; Lemma 5.3 and proof, author pp. 39–40.) *Needs:* *The Galois group
`G_{K,S}` of the maximal extension unramified outside `S`*; ClassFieldTheory Layers 12 and 13;
ProfiniteCohomology Layer 9.

**Checks.**

- `ℚ(∅) = ℚ`, since every quadratic field has a ramified finite prime.
- `ℚ(i) ⊆ ℚ({2})`, although `ℚ(i)` is ramified at `∞`.
- `ℚ({2}) = ℚ(i, √2)`, of degree `4`, the compositum of `ℚ(i)`,
  `ℚ(√2)` and `ℚ(√−2)`.
- `ℚ({2}) ⊆ ℚ({2, 3}) = ℚ(i, √2, √3)`, of degree `8`.
- For `F = ℚ(√3)` the class number is `1`, but `F(∅) = F(i)`: the fundamental unit `2 + √3` has
  norm `+1`, so the narrow class number is `2`, and `F(i) = ℚ(√3, √−3)` is unramified over `F` at
  every finite place and ramified at both real places.

**One new ramified prime and quadratic reciprocity.** Let `F` be a number field, `H/F` the ray
class field of modulus `8∞`, where `∞` is the product of all real places, and `w ∤ 2` a finite
place of `F` that splits completely in `H`. Then `w = (λ_w)` for a totally positive `λ_w` that is
a square in each dyadic completion of `F`. Let `S` be a finite set of finite places with `w ∉ S`;
`S` may contain dyadic places, and `F(S)` is as in *Exponent-two ramification fields*, with
ramification at infinity allowed. If `w` splits completely in `F(S)H`, then
`F(S ∪ {w}) = F(S)F(√λ_w)`. If `v ≠ w` are finite places, both prime to `2`, outside `S` and split
completely in `F(S)H`, then `v` splits completely in `F(S ∪ {w})` if and only if `w` splits
completely in `F(S ∪ {v})`.

*Proof sketch.* Since `w` splits completely in the ray class field of modulus `8∞`, it has a
generator `λ_w ≡ 1 mod 8` that is positive at every real place, and such a `λ_w` is a square in
each dyadic completion. Kummer theory for square classes and Hilbert reciprocity show that adding
`w` enlarges the exponent-two quotient by at most one; `λ_w` supplies the new class, since its
valuation at `w` is odd. For the symmetry, all Hilbert symbols `(λ_v, λ_w)_u` with `u ∉ {v, w}`
vanish (positivity at the real places, squares at the dyadic places, units elsewhere), and the
product formula equates the two remaining quadratic residue symbols. ([Newton–Thorne, *Symmetric
power functoriality for Hilbert modular
forms*](https://api.repository.cam.ac.uk/server/api/core/bitstreams/6bd9d94f-51d3-42e2-9cb1-ffc812189ac5/content),
§5, Lemma 5.3 and proof, author pp. 39–40.) *Needs:* *Exponent-two ramification fields*;
ClassFieldTheory Layers 10 and 13; GlobalNumberFields Layer 7.

**Checks.**

- For `F = ℚ`, `H = ℚ(ζ₈)`; a prime `w ≡ 1 mod 8` splits completely in `H`, and `λ_w = w` is
  positive and a square in `ℚ₂`.
- For `F = ℚ`, `S = ∅` and `w = 17`: `ℚ({17}) = ℚ(√17)`, ramified at `17`, so the new quotient is
  nontrivial.
- For `F = ℚ`, `S = ∅`, `v = 17` and `w = 41`: `(41/17) = (7/17) = −1` and `(17/41) = −1`, so
  neither prime splits in the other's field, as the symmetry requires.
- A dyadic prime does not satisfy the conclusion: `ℚ({2}) = ℚ(i, √2)` has degree `4` over
  `ℚ(∅) = ℚ`, so adding `2` adds two independent quadratic characters.

**The antiunit class-field rank.** Let `p` be an odd prime, `F₂/F₁/F₀` a finite tower of totally real
number fields, and `K₀/F₀` a CM extension. Put `K_i = K₀ F_i`, with complex conjugation `c`.
Fix a finite place `v₀ ∤ p` of the lower field `F₀` that splits in `K₀/F₀`, and set
`T_i = {w a finite place of K_i : w | v₀}`, for `i = 0, 1, 2`: these sets contain every place
above the original `v₀`. Let `Δ_i` be the Galois group of the maximal abelian pro-`p` extension of
`K_i` unramified outside `p`, and `Δ_{i,0}` its largest quotient in which every place in `T_i`
splits completely. Define `d₀(K_i,T_i) = rank_{ℤ_p} ker(Δ_i → Δ_{i,0})^{c=−1}`. Then

```text
d₀(K_i,T_i) = rank_{ℤ_p} (closure of im(O_{K_i,T_i}^× → ∏_{w|p} O_{K_{i,w}}^×(p)))^{c=−1},
d₀(K₂,T₂) ≥ d₀(K₁,T₁).
```

Here `(p)` means pro-`p` completion, the minus part is the image of `(1−c)/2`, and the closure is
taken in the product of local units. No Leopoldt hypothesis is imposed.

For the Maire lower bound, assume that `K₀ = L F₀` for an imaginary quadratic field `L/ℚ` in
which `p` and the residue characteristic of `v₀` split; that `F₁/F₀` and `F₂/F₀` are solvable;
that `[F₁:F₀]` is even and `K₁/F₁` is everywhere
unramified at finite places; that `v₀` splits completely in `F₁/F₀`; that every place above `p` in
`F₁` splits completely in `F₂/F₁`; and that there is an intermediate field `F₀ ⊆ E ⊆ F₁` with
`E/F₀` abelian of odd degree `d > 1`. Then
`d₀(K₂,T₂) ≥ d₀(K₁,T₁) ≥ d`. The same `T_i` index the units and the splitting quotients in
this inequality. In particular, a chosen prime of `F₁` or `F₂` cannot replace all the primes
above `v₀`.

*Proof sketch.* Global reciprocity and finiteness of the class group identify the splitting kernel,
up to finite groups, with the image of the `T_i`-units in the local units modulo global units.
The minus part of the global units of a CM field is finite, giving the displayed rank identity.
Inclusion into the local units of `K₂` takes the closure at level `1` into the closure at level `2`;
norm composed with inclusion is multiplication by `[K₂:K₁]`, hence is injective after tensoring
with `ℚ_p`. This proves monotonicity. The lower bound is the application of Maire's Proposition 19
in Newton–Thorne's proof, with `F₀` denoting their `F` and `L` their imaginary quadratic `K₀`.
([Newton–Thorne, *Symmetric power functoriality for Hilbert modular
forms*](https://arxiv.org/pdf/2212.03595v2), Lemma 3.4(1)–(4) and proof, pp. 16–17;
Maire, *On the Zℓ-rank of abelian extensions with restricted ramification*, Proposition 19,
J. Number Theory 92 (2002), pp. 376–404, with addendum, 98 (2003), pp. 217–220.)
*Needs:* ClassFieldTheory Layers 11 and 12; GlobalNumberFields Layer 8;
§R02.3.0c *The S-unit theorem and the completion of S-units*, using the pinned
`Set.unitValuation`, `Set.unitValuation_ker` and `Set.unitEmptyEquivUnits`.

**Checks.**

- For `K` imaginary quadratic (`F = ℚ`) and `v₀ = ℓ ≠ p` split in `K` as `𝔩𝔩̄`: `O_{K,T}^×` has
  rank `2`, its `c = −1` part is generated up to torsion by `α/ᾱ` with `(α) = 𝔩^h`, `h` the class
  number, and `α/ᾱ` is not a root of unity, so its image in the local units has infinite order and
  `d₀ = 1`.
- With no place imposed (`T = ∅`), `Δ₀ = Δ` and the `c = −1` part of `O_K^×` is finite, because the
  unit ranks of `K` and `F` agree; both sides are `0`.
- For any CM `K/F`, if `T` consists of just the two places above one split finite place of `F`,
  the `T`-unit valuation sequence tensored with `ℚ` has minus part `ℚ[T]^{c=−1} ≅ ℚ`, since
  ordinary global units have zero minus rank and the class group is finite. Thus the closure
  has rank at most `1`, regardless of abelian subfields of `F`.
- Under the lower-bound hypotheses with `[E:F₀] = 3`, complete splitting of `v₀` gives at least
  three conjugate pairs in `T₁`. The bound is `d₀(K₂,T₂) ≥ d₀(K₁,T₁) ≥ 3`, compatible with the
  valuation upper bound `d₀(K₁,T₁) ≤ #T₁/2`; imposing only one conjugate pair gives rank at most
  `1` instead.

**No `Z_p`-extension unramified at p.** Let `F` be a number field, `p` a prime and `S` a finite set
of finite places of `F` containing no place above `p`; write `G_{F,S}` for the Galois group of the
maximal extension of `F` unramified at every finite place outside `S` (this is `G_{F, S ∪ S_∞}` in
the notation of *The Galois group `G_{K,S}` of the maximal extension unramified outside `S`*, so real
places may ramify). Then the maximal abelian pro-`p` quotient of `G_{F,S}` is finite: each inertia
group at `v ∈ S` contributes a finite cyclic `p`-group (the `p`-part of the residue field units
`k_v^×`), the real places contribute only finite `2`-torsion, and the quotient unramified
everywhere is finite (the `p`-part of the narrow class group). In particular `G_{F,S}` has no
quotient `ℤ_p^r` with `r > 0`. Consequently, if `V` is a finite-dimensional vector space over a
finite extension of `ℚ_p` with a continuous action of `G_{F,S}` through a finite quotient, then
`H¹_cts(G_{F,S}, V) = 0`.

*Proof sketch.* Local reciprocity makes the pro-`p` inertia image at each `v ∈ S` finite, since
`v ∤ p`; the unramified quotient is controlled by the finite class group. A torsion-free `ℤ_p`
quotient kills these finite inertia images and cannot survive in the finite unramified quotient.
For `V`, restrict to an open normal subgroup `G_{F′,S}` acting trivially on `V`, where `F′` is the
field cut out by the action; `S_{F′}` again avoids `p`, and `H¹(G_{F′,S}, V) = Hom_cont(G_{F′,S}, V)`
vanishes because the image of a nonzero continuous homomorphism to `V` would be a quotient `ℤ_p^r`
with `r > 0`. Then descend by inflation–restriction, using that the finite index is invertible in
`ℚ_p`. ([Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles
method*](https://arxiv.org/pdf/1207.4224), §4, proof of Lemma 4.14, author pp. 52–53; journal
pp. 367–368.) *Needs:* *Restriction and corestriction descent for finite index* (Layer R02.2);
ClassFieldTheory Layers 7, 12 and 13.

**Checks.**

- If `S` contains the places above `p`, the conclusion fails: the cyclotomic `ℤ_p`-extension of
  `F` is unramified outside `p`, so `G_{F,S}` has a quotient `ℤ_p` and `H¹(G_{F,S}, ℚ_p) ≠ 0`.
- For `F = ℚ`, `p` odd and `S = {ℓ}` with `ℓ ≡ 1 mod p`: the maximal abelian pro-`p` quotient of
  `G_{ℚ,S}` is the `p`-part of `(ℤ/ℓ)^×`, cyclic of order `p^{v_p(ℓ−1)}`; so
  `H¹(G_{ℚ,S}, 𝔽_p) ≠ 0` while `H¹(G_{ℚ,S}, ℚ_p) = 0`.
- Finiteness of `S` is needed for the finiteness of the abelian pro-`p` quotient: for `F = ℚ`,
  `p` odd and `S` the set of all primes `ℓ ≡ 1 mod p`, the degree-`p` subfields of the `ℚ(ζ_ℓ)` give
  infinitely many independent cyclic `p`-extensions.

### Examples

- `K = ℚ`, `S = {∞}`: `K_S = ℚ` and `G_S = 1`, since every number field other than `ℚ` has a
  ramified prime. `S = {2, ∞}`: `ℚ(i)`, `ℚ(√2)` and every `ℚ(ζ_{2ⁿ})` lie in `K_S`, and `ℚ(√3)`
  does not.
- At a real place and `M = ℤ/3` with trivial action, `H⁰(K_v, M) = Ĥ⁰(ℤ/2, ℤ/3) = 0` while the
  ordinary invariants are `ℤ/3`; at a real place and `M = ℤ/2`, `Hʳ(K_v, M) = ℤ/2` for every `r`.
- `Ш¹(ℚ, μ₈) = 0`, but the kernel of `H¹(ℚ, μ₈) → ∏_{v ≠ 2} H¹(ℚ_v, μ₈)` contains the class of
  `16`, which is an eighth power in `ℝ` and in every `ℚ_v` with `v` odd, but not in `ℚ₂`. This is
  the order-two phenomenon recorded by the cyclotomic description of the power kernel.

### Dependencies

- Earlier layers of this roadmap: R02.2.
- TauCetiRoadmap NumberFieldArithmetic: Layers 1, 4, 6.
- TauCetiRoadmap ProfiniteProPGroups: Layer 1.
- TauCetiRoadmap ProfiniteCohomology: Layers 1, 2, 3, 4, 5, 7, 8, 9, 10, 11.
- ArithmeticGaloisRepresentations: Layer 2, §2.1 (decomposition, inertia and wild inertia groups;
  local restriction and change of embedding); §5.13 / **Chebotarev for function fields**.
- TauCetiRoadmap GlobalNumberFields: Layers 6, 7, 8.
- TauCetiRoadmap ClassFieldTheory: Layers 2, 6, 7, 10, 11, 12, 13.
- Earlier targets: §R02.3.0d *Finite Galois localization and Sha kernels*.
- TauCetiRoadmap Chebotarev: Layer 10.
- Libraries: Mathlib `Field.absoluteGaloisGroup`, Mathlib
  `InfiniteGalois.IntermediateFieldEquivClosedSubgroup`, Mathlib `Set.integer`, Mathlib
  `NumberField.finite_of_discr_bdd`, Mathlib `tateCohomology`, Mathlib `Set.unit`, Mathlib
  `RestrictedProduct`, Mathlib `ClassGroup`, Tau Ceti `TauCeti.kummerShortExact`.
- TauCetiRoadmap AlgebraicCurves: Layers 3 and 5, and TauCetiRoadmap ClassFieldTheory: Layers 3–5, for the
  global function-field targets of R02.3.2; Tau Ceti `TauCeti.Place`, `TauCeti.Place.degree` and Mathlib
  `FunctionField` there as well.

## Layer R02.4: Arithmetic duality and local–global obstruction groups

This layer proves global duality for finite and finitely generated `G_S`-modules. It builds `Ext`
in the category of discrete modules, proves Tate's duality theorem for a `P`-class formation and for
the `S`-idele classes, and identifies `Ext` into the `S`-units and the `S`-ideles with global and
restricted-product cohomology; summing local dualities is not enough, and the global input is
Tate's theorem. With the local terms (finite places from ClassFieldTheory, archimedean places here,
unramified classes as exact annihilators, the restricted products `Pʳ_S` and their self-duality) it
proves the Poitou–Tate nine-term sequence, finiteness of `Hⁱ(G_S, M)` for finite `S`, the bound on
`cd_ℓ G_S`, surjectivity onto finitely many local `H²`, the high-degree cohomology of the `S`-units
and Tate's global Euler characteristic formula. It then gives the function-field counterparts
(nonempty `S`, coefficients prime to the characteristic), the finite compactly supported cochain
complex, all-place `Ш` duality with its transfer adjunction, Grunwald–Wang with its exact dyadic
obstruction, roots of characters and their local Brauer obstructions, totally real base change with
prescribed local behaviour, Tate's vanishing of `H²(G_F, ℚ/ℤ)`, duality for tori, and injectivity of
central obstructions over function fields. Sections R02.4.5a–R02.4.5b state the finite-coefficient forms over the absolute Galois group of a number field; the other arithmetic duality targets use `G_S` and global fields of either characteristic.

### R02.4.1 `Ext` of discrete modules and Tate's duality for class formations

**Continuous-to-abstract cohomology.** For profinite `G` and a smooth discrete `R`-linear module
`M`, forgetting continuity of cochains defines
`ArithmeticDuality.continuousToAbstract r : Hʳ_cont(G, M) →ₗ[R] Hʳ_abs(G, M)`, with abstract
cohomology Mathlib's `groupCohomology` of the underlying `Rep R G`.
In degree one, `ArithmeticDuality.continuousToAbstract_injective` proves injectivity, and
`ArithmeticDuality.mem_range_continuousToAbstract_one` identifies its image as the classes
having a continuous cocycle representative. A representative into discrete `M` is locally
constant. These maps commute with coefficient maps and with restriction along continuous group
homomorphisms, in particular local decomposition maps. Degree two has the forgetful map;
injectivity in that degree is not part of this target.

*Proof sketch.* Include continuous cochains in all cochains. Every degree-one coboundary is
`g ↦ g·m − m`, continuous by smoothness, so the intersection of the abstract coboundaries with
the continuous cocycles is precisely the continuous coboundaries. This proves injectivity and
the image description. In degree two, abstract coboundaries may use discontinuous one-cochains,
so this argument only constructs the map. Restriction commutes with the inclusion on cochains.
([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
Chapter I, §0, continuous-cochain convention and (0.1); Mathlib's low-degree cohomology and
Tau Ceti's `TauCeti.ContCohomology.B1`, `B2`.) *Needs:* ProfiniteCohomology Layers 2–3;
Mathlib `groupCohomology`; Tau Ceti `TauCeti.IsSmoothDiscrete`.
This comparison follows the continuous-class interface of the Imperial College London FLT project.

**Checks.**

- For finite discrete `G` every cochain is continuous, and the comparison is an isomorphism
  in every degree.
- For trivial `M`, degree one is the inclusion of continuous homomorphisms into all abstract
  homomorphisms. For `G = ∏_{n∈ℕ} ℤ/2` and `M = ℤ/2`, an abstract linear functional which does
  not factor through finitely many coordinates gives a class outside the image.
- A continuous cocycle and any cohomologous abstract cocycle differ by a continuous
  coboundary, so the second representative is continuous too; restriction preserves this property.

**Ext of discrete G-modules.** Let `G` be a profinite group. The category `DiscreteRep ℤ G` of
discrete `G`-modules is a Grothendieck abelian category, and `Ext^r_G(M, N)` is Mathlib's
`Abelian.Ext` in this category (Ext of discrete modules, not of all topological representations).
It has long exact sequences in both variables and a Yoneda product
`Ext^r_G(M, C) × H^s(G, M) → H^{r+s}(G, C)`, and `Ext^r_G(ℤ, N) ≅ H^r(G, N)` (Mathlib's
`continuousCohomology`), naturally in `N` and compatibly with connecting maps. If `M` is finitely
generated as an abelian group, there is a long exact sequence

```text
0 → H¹(G, Hom(M, N)) → Ext¹_G(M, N) → H⁰(G, Ext¹_ℤ(M, N)) → H²(G, Hom(M, N)) → Ext²_G(M, N) → ⋯
```

so `Ext^r_G(M, N) ≅ H^r(G, Hom(M, N))` for every `r` when `N` is divisible by the order of every
torsion element of `M`; moreover `Ext^r_G(M, N)` is torsion for `r ≥ 1`, and `Ext^r_G(M, −)`
commutes with filtered colimits of coefficients. More generally, if `G = lim G_i` and
`N = colim N_i` compatibly, with `N_i` a discrete `G_i`-module and the action on `M` factoring
through every `G_i`, then `Ext^r_G(M, N) = colim_i Ext^r_{G_i}(M, N_i)`.
For an open subgroup `U ≤ G` and a discrete
`U`-module `M`, Shapiro's isomorphism `Ext^r_G(Ind_U^G M, N) ≅ Ext^r_U(M, Res_U N)` holds.

The API:

- `DiscreteExt.isGrothendieckAbelian`: `DiscreteRep ℤ G` is Grothendieck abelian, hence has `Ext`
  groups.
- `DiscreteExt.Ext`: `Ext^r_G(M, N) := Abelian.Ext M N r`.
- `DiscreteExt.extZeroEquiv`: `Ext⁰_G(M, N) = Hom_G(M, N)`.
- `DiscreteExt.extIntEquivCohomology`: `Ext^r_G(ℤ, N) ≅ H^r(G, N)`, natural in `N` and compatible
  with connecting maps.
- `DiscreteExt.yonedaPairing`: `Ext^r_G(M, C) × H^s(G, M) → H^{r+s}(G, C)`, given by `Ext.comp`.
- `DiscreteExt.extEquivCohomologyHom`: for `M` finitely generated and `N` divisible by the orders of
  the torsion elements of `M`, `Ext^r_G(M, N) ≅ H^r(G, Hom(M, N))`.
- `DiscreteExt.ext_colimit`: for `M` finitely generated and `G` fixed, `Ext^r_G(M, −)` commutes with
  sequential (more generally filtered) colimits of coefficients; the form in which `G = lim G_i`
  varies as well is Milne's Remark 0.10.
- `DiscreteExt.extShapiro`: for `U` open, `Ext^r_G(Ind_U^G M, N) ≅ Ext^r_U(M, Res_U N)`, for the
  induction and restriction functors on discrete modules.
- `DiscreteExt.ext_isTorsion`: `Ext^r_G(M, N)` is torsion for `r ≥ 1` and `M` finitely generated.

*Proof sketch.* `DiscreteRep ℤ G` is abelian, its filtered colimits are exact (they are computed on
underlying groups), and `⊕_U ℤ[G/U]` is a generator; so it has enough injectives
(`IsGrothendieckAbelian.enoughInjectives`) and `Ext` groups (`hasExt_of_enoughInjectives`).
`Ext^r_G(ℤ, −)` and `H^r(G, −)` are universal `δ`-functors on discrete modules, since `H^r` is
effaceable by coinduced modules (ProfiniteCohomology Layers 7 and 10). For finitely generated `M`,
`Hom(M, −)` sends injectives to `(−)^G`-acyclic modules and `Ext^s_ℤ(M, −) = 0` for `s ≥ 2`, so the
spectral sequence `H^r(G, Ext^s_ℤ(M, N)) ⇒ Ext^{r+s}_G(M, N)` has two rows and is the displayed long
exact sequence (Milne, Example 0.8); divisibility of `N` kills `Ext¹_ℤ(M, N)`. Both rows commute
with filtered colimits for finitely generated `M` (with varying `G = lim G_i` as well, since then
`H^r(G, N) = colim_i H^r(G_i, N_i)`), which gives the colimit statements by the five lemma, and both
are torsion in positive degree. Induction is left adjoint to restriction and both
are exact, which gives Shapiro's isomorphism. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §0, Example 0.8, p. 7 (PDF
p. 15).) *Needs:* ProfiniteCohomology Layers 7 and 10; Tau Ceti `TauCeti.DiscreteRep`; Mathlib
`CategoryTheory.IsGrothendieckAbelian.enoughInjectives`; Mathlib
`CategoryTheory.hasExt_of_enoughInjectives`; Mathlib `CategoryTheory.Abelian.Ext`; Mathlib
`CategoryTheory.Abelian.Ext.comp`; Mathlib `CategoryTheory.Abelian.Ext.covariantSequence_exact`;
Mathlib `continuousCohomology`.

**Checks.**

- `ext_degree_zero`: `Ext⁰_G(M, N)` is the group of `G`-equivariant homomorphisms; for `M = ℤ` it
  is `N^G`.
- `ext_int_first`: `Ext¹_G(ℤ, N)` is the continuous `H¹(G, N)`; in every degree `Ext^r_G(ℤ, N)`
  agrees with Mathlib's `continuousCohomology` of `N`.
- `ext_divisibility_needed`: for `G = 1`, `Ext¹(ℤ/2, ℤ) = ℤ/2` (more generally
  `Ext¹(ℤ/m, ℤ) = ℤ/m`) while `H¹(1, Hom(ℤ/m, ℤ)) = 0`; the comparison with `Hom`-cohomology cannot
  drop the divisibility hypothesis.
- `ext_trivial_group`: for `G = 1`, `Ext^r_G = Ext^r_ℤ`, so `Ext^r(ℤ, N) = 0` for `r ≥ 1` and
  `Ext^r(ℤ/m, N) = 0` for `r ≥ 2`.

**Tate's duality theorem for a class formation.** Let `(G, C)` be a `P`-class formation, `ℓ ∈ P`
and `M` a finitely generated discrete `G`-module. The Yoneda pairing
`Ext^r_G(M, C) × H^{2−r}(G, M) → H²(G, C)` followed by `inv_G` defines
`α^r(G, M) : Ext^r_G(M, C) → H^{2−r}(G, M)^*`. Then:
(a) `α^r(G, M)(ℓ)` is bijective for every `r ≥ 2` (for `r ≥ 3` the target is zero, so
`Ext^r_G(M, C)(ℓ) = 0`), and `α¹(G, M)(ℓ)` is bijective when `M` is torsion-free;
(b) `α¹(G, M)(ℓ)` is bijective for every `M` provided `α¹(U, ℤ/ℓ^m)` is bijective for every open
`U ≤ G` and every `m ≥ 1`;
(c) `α⁰(G, M)` is surjective (respectively bijective) for every finite `ℓ`-primary `M` provided, in
addition, every `α⁰(U, ℤ/ℓ^m)` is surjective (respectively bijective).
For `M = ℤ`, `α⁰` is the reciprocity map `C^G → G^{ab}` and `α²` is `inv_G`. Every assertion is
about `ℓ`-primary components with `ℓ ∈ P`.

*Proof sketch.* For torsion-free `M` with `N = Hom(M, ℤ)` (Milne, Lemma 1.9),
`Ext^r_G(M, C) ≅ H^r(G, N ⊗ C) = colim_U H^r(G/U, N ⊗ C^U)`; by Tate–Nakayama (ClassFieldTheory
Layer 3), cup product with the fundamental class `u_{G/U}` gives
`Ĥ^{r−2}(G/U, N) ≅ Ĥ^r(G/U, N ⊗ C^U)`, and the colimit of the torsion groups `Ĥ^{r−2}` along the
maps `(U : V)·Inf` has zero `ℓ`-part: for each fixed open normal `U` and every `m`, there is an
open normal `V ≤ U` with `ℓ^m | (U : V)`, since `ℓ^∞` divides the supernatural order of `G`
(`ℓ ∈ P`). Choosing `m` to kill a given `ℓ`-primary torsion class makes its transition image zero. So
`Ext^r_G(M, C)(ℓ) = 0` for `r ≥ 4`, and for `r = 3` when `M` is torsion-free. For `M = ℤ` and
`M = ℤ/m` (Milne, Lemma 1.7) the maps `α^r` are described through `rec_G` (ClassFieldTheory Layer 4)
and `inv_G`, the Yoneda and cup-product pairings agreeing (ProfiniteCohomology Layer 12). For
general `M`, embed `M` in `M_* = Ind_U^G M` with `U` acting trivially on `M`, with cokernel `M_1`;
Shapiro for `Ext` and for cohomology (*Ext of discrete G-modules*, ProfiniteCohomology Layer 7) and
the five lemma on the resulting ladder (Milne, (1.9.1)) give the theorem by descending induction on
`r`. ([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
Chapter I, §1, Theorem 1.13, p. 25 (PDF p. 33).) *Needs:* *Ext of discrete G-modules*; *P-class
formations* (Layer R02.3); ProfiniteCohomology Layers 7 and 12; ClassFieldTheory Layers 3 and 4.

**Checks.**

- `M = ℤ`, `r = 2`: `Ext²_G(ℤ, C) = H²(G, C)`, `H⁰(G, ℤ)^* = ℚ/ℤ`, and `α²` is `inv_G`, an
  isomorphism on `ℓ`-primary parts by the axioms of a `P`-class formation.
- `M = ℤ`, `r = 1`: both sides vanish (`H¹(G, C) = 0` by the axioms, and
  `H¹(G, ℤ) = Hom_cts(G, ℤ) = 0`), as (a) requires for torsion-free `M`.
- `M = ℤ`, `r = 3`: `Ext³_G(ℤ, C) = H³(G, C)` vanishes, its finite layers being
  `Ĥ¹(G/U, ℤ) = 0` by Tate–Nakayama.
- For `G = ℤ_ℓ`, `U = ℓⁿℤ_ℓ` has finite index `ℓⁿ`; choosing `V = ℓ^{n+m}ℤ_ℓ` gives
  `(U : V) = ℓ^m`, so the transition multiplier kills an element of order dividing `ℓ^m`.

**Tate's global duality for the S-idele classes.** Let `K` be a number field, `P` the set of primes
`ℓ` with `ℓ^∞ | [K_S : K]` (it contains every prime that is a unit in `R_{K,S}`), `ℓ ∈ P`, and `M` a
finitely generated discrete `G_S`-module. Then
`α^r(G_S, M)(ℓ) : Ext^r_{G_S}(M, C_S)(ℓ) → H^{2−r}(G_S, M)^*(ℓ)` is an isomorphism for every
`r ≥ 1`, and `α⁰(G_S, M)(ℓ)` is surjective for finite `M`. The description of the kernel of `α⁰` as
a norm image (Milne, Theorem 4.6(b), which needs a sufficiently large auxiliary field) is not part
of the statement: *Poitou–Tate duality and the nine-term exact sequence* obtains its first three
terms by Pontryagin duality instead. For function fields (Milne, Theorem 4.6(c)) see
*Prime-to-characteristic function-field Poitou–Tate duality*.

*Proof sketch.* By *Reciprocity for the S-idele classes*, `D_S(F)` is divisible and
`0 → D_S(F) → C_S(F) → Gal(K_S/F)^{ab} → 0` is exact for every finite `F ⊆ K_S`; with Milne's
Lemma 1.7 describing `α` through the reciprocity map, `α¹(U, ℤ/ℓ^m)` is bijective and
`α⁰(U, ℤ/ℓ^m)` is surjective for every open `U ≤ G_S`. Apply parts (a)–(c) of *Tate's duality
theorem for a class formation* to the `P`-class formation `(G_S, C_S)` of *`(G_S, C_S)` is a P-class
formation*. ([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
Chapter I, §4, proof of Theorem 4.6, p. 53 (PDF p. 61).) *Needs:* *Tate's duality theorem for a
class formation*; *`(G_S, C_S)` is a P-class formation* (Layer R02.3); *Reciprocity for the S-idele
classes* (Layer R02.3).

**Checks.**

- `M = ℤ/ℓ^m`, `r = 1`: since `H¹(G_S, C_S) = 0`, `Ext¹_{G_S}(ℤ/ℓ^m, C_S) = C_S(K)/ℓ^m`, and `α¹`
  is the reciprocity map `C_S(K)/ℓ^m → G_S^{ab}/ℓ^m = H¹(G_S, ℤ/ℓ^m)^*`, bijective because its
  kernel `D_S(K)` is divisible.
- `M = ℤ`, `r = 2`: `α²` is `inv : H²(G_S, C_S)(ℓ) → (ℚ/ℤ)(ℓ)`, a bijection.
- `K = ℚ`, `S = {∞}`: `K_S = ℚ` (Minkowski), so `G_S = 1` and `P = ∅`; the statement is empty, and
  nothing is claimed for `ℓ ∉ P`.

**Descent of Kummer coefficients to restricted ramification.** Let `K` be a number field,
`m ≥ 1`, and `S` contain every finite place dividing `m`. On the existing discrete carrier
`TauCeti.KummerCoeff K m`, construct a jointly continuous `G_{K,S}`-action whose pullback
along `G_K → G_{K,S}` is the pinned Kummer action. With `K^s = SeparableClosure K`,
`RestrictedRamification.kummerCoeffS_exists` supplies the continuous representation and its
compatibility with `AlgEquiv.restrictNormalHom`. The action is unique, its topology remains
discrete, and coefficient power maps for divisors of `m` are equivariant. Use this action to
form `TopRep.of` over `G_{K,S}`; forgetting the action to an abstract cyclic group does not
preserve the arithmetic coefficient.

*Proof sketch.* `RestrictedRamification.cyclotomic_le_maxUnramifiedOutside` places
`μ_m` in `K_S`: apply the prime-power case and combine the primary factors. The kernel of
restriction fixes these roots. Surjectivity of restriction gives a unique descended action;
the quotient Krull topology and the open stabilizers of roots give joint continuity on the
discrete carrier. Power maps commute with field automorphisms. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), I, §4, definition of `M^D` before
Theorem 4.10, p. 56; pinned Tau Ceti `FieldTheory/GaloisCohomology/Coefficients.lean`,
`TauCeti.KummerCoeff`.) *Needs:* *The Galois group `G_{K,S}` of the maximal extension unramified
outside `S`* (Layer R02.3), including `cyclotomic_le_maxUnramifiedOutside`; Tau Ceti
`TauCeti.KummerCoeff`; Mathlib `AlgEquiv.restrictNormalHom`.

**Checks.**

- For `m = 1` the coefficient is zero and the descended action is trivial.
- For `K = ℚ`, `m = 3`, `S = {3, ∞}`, complex conjugation acts by inversion on `μ₃`;
  the descended coefficient has cohomology orders `1, 3, 1` in degrees `0, 1, 2`.
- If `K` contains `μ_m`, the descended action is trivial and the pinned Kummer cyclic
  identification is equivariant; over `ℚ` at `m = 3` it is not equivariant for the trivial action.
- Without the place above `3`, `ℚ_S = ℚ` for `S = {∞}` and its trivial Galois group cannot
  pull back to the nontrivial action on `μ₃`.

**The dual `M^D = Hom(M, E_S)`.** For a finite discrete `G_S`-module `M` put `M^D = Hom(M, E_S)`.
Suppose that `#M` is a unit in `R_{K,S}`, and let `m` be the exponent of `M`. Then `μ_m ⊆ K_S` and
`M^D = Hom(M, μ_m) = Hom(M, K^{s×})`; this is Tau Ceti's `InternalHom G M μ_m` with its `homAction`
and its equivariant evaluation pairing `M^D × M → μ_m`, so no second finite dual is introduced.
Evaluation `M → M^{DD}` is an isomorphism, `M ↦ M^D` is an exact contravariant functor, and
`#M^D = #M`. Without the unit hypothesis these conclusions fail (Checks).

*Proof sketch.* `Hom(M, E_S)` lands in the roots of unity of `K_S`; when `m` is a unit in
`R_{K,S}`, `μ_m ⊆ K_S` (the extension `K(μ_m)/K` is unramified outside the places dividing `m` and
the archimedean places), so `Hom(M, E_S) = Hom(M, μ_m) = Hom(M, K^{s×})`. This is Tau Ceti's
internal `Hom` of a finite discrete module into a discrete one, with its equivariant evaluation
pairing. Since `μ_m` is cyclic of order `m`, `Hom(Hom(M, μ_m), μ_m) ≅ M` for `m`-torsion `M`, and
`Hom(−, μ_m)` is exact on `m`-torsion groups. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, before Theorem 4.10, p. 56
(PDF p. 64).) *Needs:* *S-ideles, S-units and S-idele classes* (Layer R02.3);
*Descent of Kummer coefficients to restricted ramification*; Tau Ceti `TauCeti.InternalHom`;
Tau Ceti `TauCeti.InternalHom.evalPairing`; Tau Ceti `TauCeti.KummerCoeff`.

**Checks.**

- `M^D` is Tau Ceti's `InternalHom(M, μ_m)`, and its pairing with `M` is
  `InternalHom.evalPairing`, landing in `μ_m ⊆ E_S`.
- `(ℤ/m)^D = μ_m` and `μ_m^D = ℤ/m` with trivial action, for `m` a unit in `R_{K,S}`.
- For `#M` a unit in `R_{K,S}`: `M ↦ M^D` is exact, `#M^D = #M`, and evaluation `M → M^{DD}` is an
  isomorphism.
- `K = ℚ`, `S = {∞}`: `K_S = ℚ` and `E_S = {±1}`, so `(ℤ/3)^D = Hom(ℤ/3, {±1}) = 0` and
  `(ℤ/3)^{DD} = 0 ≠ ℤ/3`; the unit hypothesis cannot be dropped.

### R02.4.2 The local terms

**The defined local Tate pairing.** Let `K_v` be a nonarchimedean local field, `n ≥ 1`
invertible in `K_v`, and `M` a finite smooth discrete module killed by `n`. Define
`LocalDuality.invariant` on Tau Ceti's explicit `H²(G_v, μ_n)` as
`TauCeti.ClassFieldTheory.muNRepH2Equiv` followed by
`TauCeti.ClassFieldTheory.h2MuEquivZMod`. Define `LocalDuality.localTatePairing` by applying this
invariant to `TauCeti.ContCohomology.explicitDualityPairing11`, with the dual argument first:
`H¹(G_v, Hom(M, μ_n)) × H¹(G_v, M) → ℤ/n`. Its two curried maps to the additive duals are
bijective (`LocalDuality.localTatePairing_perfect`); with the induced `ℤ/n`-module structures
this is `LinearMap.IsPerfPair`. The pairing into `ℚ/ℤ` is its composite with `a ↦ a/n`.
Transport it to canonical continuous cohomology through ProfiniteCohomology Layer 3.
`LocalDuality.localTatePairing_mk` identifies its value on cocycles `a`, `b` as the invariant
of the two-cocycle `(g, h) ↦ a(g)(g·b(h))`. Swapping to the module-first cup introduces a minus
sign in degree `(1,1)`, as in Tau Ceti's `dualityMap1_eq_neg_explicitDualityPairing11`.

For a finite field `k` of characteristic `p` invertible in `K_v` and finite-dimensional
`k`-linear `M`, use `M^* = Hom_k(M, k)(1)` and the `k`-valued invariant
`H²(K_v, k(1)) ≅ k`, obtained by extension of scalars from the normalized `𝔽_p` invariant.
The resulting `LocalDuality.localTatePairingField` is a perfect `k`-bilinear pairing; its
cocycle formula is the same evaluation cup. This is the pairing for `k`-linear local conditions.
For compact, lattice and rational coefficients D7.4 and D7.7.2 give the corresponding defined
pairings and comparisons. At real places use the complete Tate cup and the defined Brauer
invariant into `½ℤ/ℤ`; at complex places use zero. Thus the archimedean pairings below also have
specified maps and cocycle formulas.

*Proof sketch.* Compose the supplied evaluation cup with the supplied normalized invariant.
The three bijections of finite local duality imply perfectness; the supplied cocycle formula
gives `localTatePairing_mk`. Extension of scalars gives the field-valued invariant and pairing;
composition with the field trace recovers the finite additive duality. For the real group use
its complete periodic resolution and the real Brauer invariant.
([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
Chapter I, Theorem 2.1, Corollary 2.3 and Theorem 2.13; Rubin, Chapter I, Theorem 4.1.)
*Needs:* ClassFieldTheory Layers 5 and 10; ProfiniteCohomology Layers 3 and 8; Tau Ceti
`TauCeti.ContCohomology.explicitDualityPairing11`,
`TauCeti.ContCohomology.explicitDualityPairing11_mk`,
`TauCeti.ClassFieldTheory.muNRepH2Equiv`, `TauCeti.ClassFieldTheory.h2MuEquivZMod` and
`TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective`.

**Checks.**

- For `K_v = ℚ_ℓ`, `ℓ ≠ p`, `M = ℤ/p`, an unramified character paired with the Kummer class
  of a uniformizer evaluates by local reciprocity, with the dual-first cup sign above.
- For the zero coefficient module both arguments vanish and both curried maps are bijective.
- For `k = 𝔽_{p²}`, the pairing and annihilators are `k`-linear, with dimensions measured over
  `k`; no factor of two enters Greenberg–Wiles dimensions.
- At a real place with `M = ℤ/2`, the nonzero degree-one classes pair to `½ mod ℤ`;
  at a complex place both modified cohomology groups are zero.

**Local duality at the archimedean places.** Let `G = Gal(ℂ/ℝ)`, `M` a finite `G`-module and
`M^D = Hom(M, ℂ^×)`. For every `r ∈ ℤ`, cup product gives a nondegenerate pairing of finite groups
`Ĥ^r(G, M^D) × Ĥ^{2−r}(G, M) → Ĥ²(G, ℂ^×) ≅ ½ℤ/ℤ`. For `K_v = ℝ` or `ℂ`, `G_v = Gal(ℂ/K_v)` and
finite `M`,
`#H⁰(G_v, M) · #H⁰(G_v, M^D) / #H¹(G_v, M) = |#M|_v`, with ordinary (not Tate) `H⁰` and the
normalised absolute value (`|m|_v = m` for `v` real, `m²` for `v` complex). Only finite `M` is
treated.

*Proof sketch.* Odd-primary parts have zero Tate cohomology since `#G = 2`; by dévissage along a
composition series (long exact sequences and the five lemma) reduce to `M = ℤ/2` with trivial
action. There both sides are `ℤ/2` in every degree, and the pairing is computed directly using the
periodicity of the Tate cohomology of a cyclic group (Tau Ceti `tateCohomologyIsoEven`/`Odd`);
`Ĥ²(G, ℂ^×) = Br(ℝ) ≅ ½ℤ/ℤ` (ClassFieldTheory Layer 10). For the Euler formula the complex case is
immediate; in the real case `1 − σ` on `M^D` is adjoint to `1 + σ` on `M`, and the Herbrand
quotient of a finite module is `1`. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, proof of Theorem 2.13,
p. 35 (PDF p. 43).) *Needs:* ClassFieldTheory Layer 10; Mathlib `tateCohomology`; Tau Ceti
`Rep.FiniteCyclicGroup.tateCohomologyIsoEven`; Tau Ceti `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`;
Tau Ceti `TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`.

**Checks.**

- `M = ℤ/2`: `Ĥ^r(G, ℤ/2) = ℤ/2` for every `r`, `M^D = μ₂ ≅ ℤ/2`, and the pairing
  `Ĥ⁰ × Ĥ² → ½ℤ/ℤ` is the perfect pairing `ℤ/2 × ℤ/2 → ½ℤ/ℤ`.
- `v` real, `M = ℤ/3` with trivial action: `M^D = μ₃`, on which complex conjugation acts by
  inversion, so the left side of the Euler formula is `3 · 1/1 = 3 = |3|_v`; with Tate
  `Ĥ⁰(G, ℤ/3) = 0` in place of `H⁰(G, ℤ/3)` it would be `1`.
- `v` complex: `G_v = 1`, and the formula reads `#M · #M = |#M|_v`.

**Unramified classes are exact annihilators.** Let `v` be a finite place of `K` and `M` a finite
`G_v`-module, unramified at `v`, whose order is prime to the residue characteristic of `v`; let `m`
be its exponent. Then `M^D = Hom(M, μ_m)` is unramified, and `H¹_un(K_v, M)` and `H¹_un(K_v, M^D)`
are exact annihilators of each other under the local Tate pairing
`H¹(K_v, M) × H¹(K_v, M^D) → H²(K_v, μ_m) ⊆ ℚ/ℤ`.

*Proof sketch.* `M^D` is unramified because `μ_m ⊆ K_v^un` for `m` prime to the residue
characteristic. Orthogonality: the cup product of two inflated classes is inflated from
`H²(g_v, μ_m) = 0` (ProfiniteCohomology Layers 11 and 12). Counting: `#H¹(g_v, N) = #H⁰(g_v, N)`
for finite `N` (from `0 → N^{Frob} → N → N → N_{Frob} → 0`), so
`#H¹_un(M) · #H¹_un(M^D) = #H⁰(K_v, M) · #H⁰(K_v, M^D)`. Local duality gives
`#H²(K_v, M) = #H⁰(K_v, M^D)`, and the local Euler characteristic with `|#M|_v = 1` gives
`#H¹(K_v, M) = #H⁰(K_v, M) · #H⁰(K_v, M^D)` (ClassFieldTheory Layer 5). The two orthogonal
subgroups have complementary orders, so each is the annihilator of the other. This counting
argument replaces the source's `Ext` argument; it is where the hypothesis on the residue
characteristic is used. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, Theorem 2.6, p. 30 (PDF
p. 38); [Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
Chapter I, §2, proof of Theorem 2.6, p. 31 (PDF p. 39).) *Needs:* *Localisation maps and the
modified local groups* (Layer R02.3); ProfiniteCohomology Layers 11 and 12; ClassFieldTheory Layer 5.

**Checks.**

- `M = ℤ/m` with `m` prime to the residue characteristic: `H¹(K_v, ℤ/m) = Hom(G_v, ℤ/m)` and
  `H¹(K_v, μ_m) = K_v^×/K_v^{×m}`; the unramified characters and the classes of units
  `O_v^× K_v^{×m}/K_v^{×m}` are exact annihilators, matching the fact that local reciprocity sends
  units onto inertia.
- Orders in the same case: `#H¹_un(K_v, ℤ/m) = m`, `#H¹_un(K_v, μ_m) = #μ_m(K_v)`, and
  `#H¹(K_v, μ_m) = m · #μ_m(K_v)` is their product, as exact annihilation requires.
- For `K_v = ℚ_p` and `p` odd, `M = ℤ/p` is unramified but `μ_p` is ramified. Its unramified
  `H¹` is zero, whereas the annihilator of the unramified characters is the nonzero Kummer
  subgroup of units. The prime-to-residue-characteristic hypothesis cannot be removed.

**Restricted products of local cohomology and `Ш^r_S`.** Let `M` be a finite discrete
`G_S`-module; no hypothesis on `#M` is needed here. For `r ≥ 0`, `P^r_S(K, M)` is the restricted
product over `v ∈ S` of the local groups `H^r(K_v, M)` (complete Tate cohomology at the archimedean
places) with respect to the unramified subgroups `H^r_un(K_v, M)` at the finite places where `M` is
unramified, formed with Mathlib's `RestrictedProduct`. The localisation `β^r`, the product of the
restriction maps `H^r(G_S, M) → H^r(K_v, M)`, lands in `P^r_S(K, M)`, and
`Ш^r_S(K, M) = ker β^r`. Since `H⁰_un = H⁰` at unramified places, `P⁰_S(K, M)` is the full product,
compact; `P¹_S(K, M)` is locally compact with the restricted-product topology; and for `r ≥ 2`,
`H^r_un = 0` (`g_v ≅ Ẑ` has cohomological dimension one), so `P^r_S(K, M) = ⊕_{v∈S} H^r(K_v, M)`
with the discrete topology. The unramified subgroups and this direct-sum description are
established here; the topology is Mathlib's.

The API:

- `PoitouTate.restrictedProductCohomology`: `P^r_S(K, M)` as Mathlib's `RestrictedProduct` of the
  `H^r(K_v, M)` over the `H^r_un(K_v, M)`.
- `PoitouTate.beta`: `β^r : H^r(G_S, M) → P^r_S(K, M)`, the product of the localisation maps.
- `PoitouTate.sha`: `Ш^r_S(K, M) := ker β^r`;
  `PoitouTate.sha_eq_ker_localization`: this is the intersection of the kernels of the maps
  `H^r(G_{K,S}, M) → H^r(K_v, M)` indexed by `v ∈ S`.
  `PoitouTate.beta_apply` evaluates `β^r` at a place of `S`.
- `PoitouTate.sha_eq_absoluteSha`: when `S` equals the set of all places, transport through
  `K_S = K^s` and `G_{K,S} = G_K` identifies `Ш^r_S(K, M)` with
  `ArithmeticDuality.absoluteSha`, using the same modified archimedean groups in every degree.
  For a general `S`, unramified localisation outside `S` need not vanish, so inflation need not
  send `Ш^r_S` into the all-place kernel, even when `#M` is a unit in `R_{K,S}`.
- `PoitouTate.compactSpace_P0`: `P⁰_S(K, M)` is compact for finite `M`.
- `PoitouTate.locallyCompactSpace_P1`: `P¹_S(K, M)` is locally compact.
- `PoitouTate.restrictedProductCohomology_eq_sum`: for finite `M` and `r ≥ 2`,
  `P^r_S(K, M) = ⊕_{v∈S} H^r(K_v, M)`, discrete.
- `PoitouTate.sha_map`: `Ш^r_S` is functorial in `M` and under restriction to a finite extension
  `F ⊆ K_S`.
- `PoitouTate.finite_restrictedProductCohomology`: for `S` and `M` finite, `P^r_S(K, M)` is finite.

*Proof sketch.* A class comes from `H^r(Gal(L/K), M)` for a finite Galois `L ⊆ K_S`, and at every
`v` unramified in `L` its localisation is unramified (Milne, Lemma 4.8); so `β^r` lands in the
restricted product. `H¹(K_v, M)` is finite for finite `v` (ClassFieldTheory Layer 5, `finite_H`),
so `P¹_S` is locally compact for the restricted-product topology
(`RestrictedProduct.topologicalSpace`). The inclusion of a restricted product into the full
product is injective, so its localisation kernel is the intersection of the coordinate kernels
over `S`. For `S` all places, the defining ramification condition on `K_S` is vacuous and these
are exactly the maps defining the absolute kernel. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, statement of the main
theorem, p. 55 (PDF p. 63); [Harpaz–Wittenberg, *The Massey vanishing conjecture for number
fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §7, before Lemma 7.6,
p. 28 (author final version).) *Needs:* *Localisation maps and the modified local groups* (Layer
R02.3); ClassFieldTheory Layer 5; Mathlib `RestrictedProduct`; Mathlib
`RestrictedProduct.topologicalSpace`.

**Checks.**

- For a finite index set, Tau Ceti's `TauCeti.addRestrictedProductOfFinite` identifies the
  restricted product with the full product through the coordinate inclusion.
- For index set `ℕ` and zero distinguished subgroups, the same coordinates identify the
  restricted product with the direct sum of the local groups: the families with finite support.
- If every localisation is zero, `Ш^r_S` is the whole global group.
- For `S` all places, `G_{K,S} = G_K`, and `Ш^r_S(K,M) = Ш^r(K,M)` for every `r ≥ 0`, with the
  same Tate-modified archimedean groups on both sides.
- For `K = ℚ(√−35)`, `L = ℚ(√5,√−7) = K(√−7)`, trivial `M = ℤ/2` and `S` consisting of the
  place above `2` and the complex place, the character of `L/K` is a nonzero element of `Ш¹_S`.
  The quadratic discriminants give `disc(L) = 5·(−7)·(−35) = 1225 = disc(K)²`, so `L/K` is
  unramified at every finite place. It splits over `2`, since `−7 ≡ 1 mod 8` is a square in `ℚ₂`.
  At either place above `3`, `K_v = ℚ₃` because `x²−x+9` has two distinct roots modulo `3`,
  whereas `−7 ≡ 2 mod 3` is nonsquare. Thus inflation has nonzero localisation outside `S`;
  `Ш¹(K,ℤ/2) = 0` by Chebotarev. Here `S` already contains every coefficient-prime place.
  The discriminants and fields are recorded in [LMFDB 2.0.35.1](https://www.lmfdb.org/NumberField/2.0.35.1)
  and [LMFDB 4.0.1225.1](https://www.lmfdb.org/NumberField/4.0.1225.1); the splitting-at-`S`
  interpretation is Milne, Chapter I, Example 4.11(i), pp. 57–58.
- The real Tate group `Ĥ⁰(C₂, ℤ/2) = ℤ/2` is nonzero, so the dyadic real
  contribution is kept.
- Over `ℕ`, the restricted product of copies of `ℤ` with respect to the zero
  subgroups is the direct sum.
- Agreement: for `r = 1, 2` the archimedean Tate groups are ordinary cohomology, so `Ш¹_S` and
  `Ш²_S` agree with Harpaz–Wittenberg's `Ш`.
- `K = ℚ`, `S = {2, ∞}`, `M = ℤ/2`: `H¹(G_S, ℤ/2)` corresponds to `ℚ(√−1)`, `ℚ(√2)`, `ℚ(√−2)`, all
  ramified at `2`, so `Ш¹_S = 0`.
- `Ш¹_S(K, ℤ/m) = 0` when `S` has Dirichlet density `> 1/2`: a cyclic extension in which every place
  of `S` splits is trivial by Chebotarev (Milne, Example 4.11(i)).
- Over `ℚ` with `S` all places, `Ш¹(ℚ, μ₄) = 0` (Harpaz–Wittenberg §7), hence `Ш²(ℚ, ℤ/4) = 0` by
  Poitou–Tate.
- `K = ℚ`, `S = {3, ∞}`, `M = ℤ/3`: `P⁰_S = H⁰(ℚ₃, ℤ/3) × Ĥ⁰(ℝ, ℤ/3) = ℤ/3`, and `β⁰` is bijective,
  as Poitou–Tate requires since `H²(G_S, μ₃) = 0`; with ordinary `H⁰` at `∞` one would get
  `P⁰_S = (ℤ/3)²` and exactness at `P⁰_S` would fail.

**`β¹` is proper.** For every set `S` and every finite `G_S`-module `M`, the inverse image under
`β¹_S(K, M)` of every compact subset of `P¹_S(K, M)` is finite; in particular `Ш¹_S(K, M)` is
finite.

*Proof sketch.* Restriction to a finite `F ⊆ K_S` splitting `M` has finite kernel
`H¹(Gal(F/K), M)` (inflation–restriction), so one may assume `G_S` acts trivially on `M`. The sets
`P(T) = ∏_{v∈S∖T} H¹(K_v, M) × ∏_{v∈T} H¹_un(K_v, M)` with `S ∖ T` finite are open, compact
(Tychonoff) and exhaust `P¹_S`, so every compact subset lies in one of them. An element of
`(β¹)^{−1}(P(T))` is a homomorphism `f : G_S → M` whose fixed field is unramified at every
`v ∈ T`, hence unramified outside the finite set `S ∖ T`, of degree dividing `#M`: there are
finitely many by *Hermite: finitely many extensions of bounded degree unramified outside a finite
set*. ([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
Chapter I, §4, Lemma 4.9, p. 56 (PDF p. 64).) *Needs:* *Restricted products of local cohomology
and `Ш^r_S`*; *Hermite: finitely many extensions of bounded degree unramified outside a finite set*
(Layer R02.3); ProfiniteCohomology Layer 5.

**Checks.**

- `K = ℚ`, `S` all places, `M = ℤ/2`, and the compact set `P(T)` with `S ∖ T = {2, ∞}`: its inverse
  image is the group of quadratic characters unramified outside `2`, of order `4` (the fields
  `ℚ(√−1)`, `ℚ(√2)`, `ℚ(√−2)` and the trivial character).
- `S` infinite: `H¹(G_S, M)` can be infinite (for `S` all places and `M = ℤ/2`, it is
  `K^×/K^{×2}`), but `Ш¹_S(K, M)`, the inverse image of `0`, is finite.

**Character duality for the arithmetic topological groups.** For the Hausdorff locally compact
abelian groups of bounded exponent occurring here (profinite groups, discrete groups and restricted
products of finite groups relative to subgroups), construct evaluation biduality as a topological
isomorphism. Every continuous character of a closed subgroup extends continuously to the ambient
group. A strict short exact sequence, with the subspace topology on the closed subgroup and the
quotient topology on the quotient, gives a strict exact dual sequence. Prove the product/direct-sum
identifications for finite groups and the restricted-product identification relative to annihilator
subgroups. Use Mathlib's Circle-valued `PontryaginDual` on the multiplicative form of an additive
group. If the exponent divides `m`, every character lands in the `m`-th roots of unity in Circle;
`a/m ↦ exp(2πia/m)` identifies these with `(1/m)ℤ/ℤ` and hence with the `ℚ/ℤ`-valued characters.

*Proof sketch.* Finite abelian-group duality supplies separation and character extension at finite
levels. Compactness identifies profinite biduals and turns their characters into finite-level
characters; discrete bounded-exponent groups are unions of finite subgroups. For a restricted
product, its open compact product subgroup and discrete quotient determine its dual, with the
annihilator subgroup as the dual open compact subgroup. Apply closed-subgroup extension and
quotient biduality to obtain exactness with the stated topologies. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Notations and Conventions, pp. vii–viii;
I, Proposition 0.20(b), pp. 14–15; I, §4, pp. 55–62.) *Needs:* Mathlib `PontryaginDual`;
finite abelian-group duality from *The dual `M^D = Hom(M, E_S)`*.

**Checks.**

- For `A = ℤ/m`, evaluation identifies `A` with its bidual, and the character `1 ↦ 1/m`
  generates its dual.
- The compact group `∏_ℕ ℤ/2` is dual to the discrete group `⊕_ℕ ℤ/2`; changing either topology
  loses the topological bidual identification.
- Dualising `0 → 2ℤ/4 → ℤ/4 → ℤ/2 → 0` gives an exact sequence, including surjective
  restriction of characters to `2ℤ/4`.
- Closedness is essential: the finite-support subgroup of `∏_ℕ ℤ/2` is dense and proper;
  its annihilator is zero, so annihilators recover its closure rather than that subgroup.

**`P^r_S(K, M)` is dual to `P^{2−r}_S(K, M^D)`.** Let `M` be a finite `G_S`-module whose order is a
unit in `R_{K,S}`, and `r ∈ {0, 1, 2}`. The sum over `v ∈ S` of the local pairings
`H^r(K_v, M) × H^{2−r}(K_v, M^D) → ℚ/ℤ` identifies `P^r_S(K, M)` with the Pontryagin dual of
`P^{2−r}_S(K, M^D)`, algebraically and topologically. Hence there are continuous maps
`γ^r_S(K, M) : P^r_S(K, M) → H^{2−r}(G_S, M^D)^*`, defined as the dual of
`β^{2−r}_S(K, M^D)` through this identification.

*Proof sketch.* At finite `v` use local Tate duality (ClassFieldTheory Layer 5), at archimedean `v`
*Local duality at the archimedean places*. The dual of a product of finite groups is the direct
sum of their duals, which pairs `P⁰` with `P²`. For `r = 1`, at almost every `v` the module is
unramified of order prime to `v`, and `H¹_un(M)`, `H¹_un(M^D)` are exact annihilators (*Unramified
classes are exact annihilators*); so the dual of the restricted product relative to `H¹_un(M)` is
the restricted product relative to `H¹_un(M^D)` (*Character duality for the arithmetic topological groups*).
([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I,
§4, before Theorem 4.10, p. 56 (PDF p. 64).) *Needs:* *Restricted products of local cohomology and
`Ш^r_S`*; *The dual `M^D = Hom(M, E_S)`*; *Local duality at the archimedean places*; *Unramified
classes are exact annihilators*; *Character duality for the arithmetic topological groups*;
ClassFieldTheory Layer 5; Mathlib `RestrictedProduct`.

**Checks.**

- The duality is topological: the compact `P⁰_S(K, M)` is dual to the discrete `P²_S(K, M^D)`, and
  the locally compact `P¹_S(K, M)` to the locally compact `P¹_S(K, M^D)`.
- `K = ℚ`, `S = {3, ∞}`, `M = ℤ/3`: `P⁰_S(ℚ, ℤ/3) = ℤ/3` and
  `P²_S(ℚ, μ₃) = H²(ℚ₃, μ₃) ⊕ Ĥ²(ℝ, μ₃) = ℤ/3 ⊕ 0`, Pontryagin dual to each other.

**Ext into the S-units and the S-ideles.** Let `M` be a finitely generated `G_S`-module whose
torsion subgroup has order a unit in `R_{K,S}`. Put `M^d = Hom(M, E_S)` globally and
`M_v^d = Hom(M, K_v^{s×})` separately as a `G_v`-module. For finite `M`, restriction
identifies these duals; for free coefficients the local terms use `M_v^d`. At a finite
place `v` where `M` is unramified,
`Hom(M, Ô_v^{un×})` is a `g_v`-module. Then:
(a) `Ext^r_{G_S}(M, E_S) = H^r(G_S, M^d)` for every `r ≥ 0`;
(b) for `v ∉ S`, `H^r(g_v, Hom(M, Ô_v^{un×})) = Ext^r_{g_v}(M, Ô_v^{un×})`, and both vanish for
`r ≥ 2`;
(c) if `M` is finite or `S` omits only finitely many places, `Hom_{G_S}(M, J_S)` is the restricted
product over `v ∈ S` of the ordinary groups `H⁰(G_v, M_v^d)` with respect to the
`H⁰(g_v, Hom(M, Ô_v^{un×}))` (the full product when `M` is finite), and
`Ext^r_{G_S}(M, J_S) = ∏′_{v∈S} H^r(K_v, M_v^d)` for every `r ≥ 1`, relative to the
unramified images of `H^r(g_v, Hom(M, Ô_v^{un×}))` at finite unramified places.

*Proof sketch.* (a): `E_S` is divisible by the integers that are units in `R_{K,S}` (*The Kummer
sequence for S-units*), so the comparison of *Ext of discrete G-modules* applies. (b):
`Ô_v^{un×}` is divisible by `#M_tors` and cohomologically trivial (ClassFieldTheory Layer 6), so it
has an injective resolution of length one. (c): `J_S = colim_{F,T} J_{F,S⊃T}`, with
`J_{F,S⊃T} = ∏_{w∈T} F_w^× × ∏_{w∈S∖T} Ô_w^×`, over finite `F ⊆ K_S` splitting `M` and finite
`T ⊆ S` containing the archimedean places, the places where `M` ramifies and those dividing
`#M_tors`. `Ext` commutes with this colimit (in the form of Milne's Remark 0.10) and with products
in the second variable, and Shapiro
reduces to the decomposition groups. At `v ∈ S ∖ T` use (b) with `T` in place of `S`; at `v ∈ T`,
`Ext^r_{G_v}(M, K_v^{s×}) = H^r(G_v, M_v^d)` (ClassFieldTheory Layer 5). ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Lemmas 4.12 and 4.13,
pp. 58–59 (PDF pp. 66–67); [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Remark 4.14, p. 61 (PDF
p. 69).) *Needs:* *Ext of discrete G-modules*; *S-ideles, S-units and S-idele classes* (Layer
R02.3); *The Kummer sequence for S-units* (Layer R02.3); *Restricted products of local cohomology
and `Ш^r_S`*; ClassFieldTheory Layers 5 and 6; ProfiniteCohomology Layer 7.

**Checks.**

- `K = ℚ`, `S = {∞}`, `M = ℤ` (Milne, Remark 4.14): `G_S = 1`, so `Ext²_{G_S}(ℤ, J_S) = 0`, but
  `∏′_{v∈S} H²(K_v, M_v^d) = Ĥ²(Gal(ℂ/ℝ), ℂ^×) = ½ℤ/ℤ`; the hypotheses of (c) cannot be dropped.
- `M = ℤ`, `K = ℚ`, `S` all places: the global dual is the countable `ℚ̄^×`, whereas
  the local dual at `p` is the uncountable `ℚ_p^{s×}`; they are not isomorphic.
- `M = ℤ`, `S` all places: `Hom_{G_S}(ℤ, J_S) = J_K` is the idele group, a restricted (not full)
  product of the `K_v^×`.
- `M = ℤ/m`, `m` a unit in `R_{K,S}`: (a) reads `Ext^r_{G_S}(ℤ/m, E_S) = H^r(G_S, μ_m)`.

### R02.4.3 Poitou–Tate duality

**Poitou–Tate duality and the nine-term exact sequence.** Let `K` be a number field, `S` a set of
places containing the archimedean ones (possibly infinite), and `M` a finite `G_S`-module whose
order is a unit in `R_{K,S}`; the archimedean local terms are the Tate groups. Then:
(a) `Ш¹_S(K, M)` and `Ш²_S(K, M^D)` are finite, and there is a canonical nondegenerate pairing
`Ш¹_S(K, M) × Ш²_S(K, M^D) → ℚ/ℤ`;
(b) `β⁰` is injective, `γ²_S(K, M)` is surjective, and `im β^r = ker γ^r_S(K, M)`
for `r = 0, 1, 2`, so that

```text
0 → H⁰(G_S, M) → P⁰_S(K, M) → H²(G_S, M^D)^*
  → H¹(G_S, M) → P¹_S(K, M) → H¹(G_S, M^D)^*
  → H²(G_S, M) → P²_S(K, M) → H⁰(G_S, M^D)^* → 0
```

is an exact sequence of locally compact groups and continuous homomorphisms; in the order written
the groups are finite, compact, compact; discrete, locally compact, compact; discrete, discrete,
finite;
(c) for `r ≥ 3`, `β^r : H^r(G_S, M) → ⊕_{v real} H^r(K_v, M)` is bijective.
The pairing in (a) is the canonical Ext-defined pairing, natural in `M`: for `f : M → N`,
`⟨f_* a, b⟩ = ⟨a, f^D_* b⟩`.

*Proof sketch.* Take the long exact `Ext_{G_S}(M^D, −)` sequence of `0 → E_S → J_S → C_S → 0`.
Replace `Ext^r(M^D, E_S) = H^r(G_S, M)` and `Ext^r(M^D, J_S) = P^r_S(K, M)` for `r ≥ 1` (*Ext into
the S-units and the S-ideles*, with `M^{Dd} = M`), and `Ext^r(M^D, C_S) = H^{2−r}(G_S, M^D)^*` for
`r ≥ 1` (*Tate's global duality for the S-idele classes*; the primes dividing `#M` are units in
`R_{K,S}`, hence lie in `P`). This gives exactness from `H¹(G_S, M)` on, and the isomorphisms
`H^r(G_S, M) ≅ ⊕_{v real} H^r(K_v, M)` for `r ≥ 4`. The map `P²_S(K, M) → H⁰(G_S, M^D)^*` is
surjective, being dual to the injection `H⁰(G_S, M^D) → P⁰_S(K, M^D)` (`S` contains a finite place
when `M ≠ 0`); with the previous step this gives (c) for `r = 3`. For the first three terms,
dualise the exact sequence `H²(G_S, M^D) → P²_S(K, M^D) → H⁰(G_S, M)^* → 0` (the previous steps for
`M^D`) using *`P^r_S(K, M)` is dual to `P^{2−r}_S(K, M^D)`* and exactness of Pontryagin duality on
these locally compact groups from *Character duality for the arithmetic topological groups*;
this is the alternative of Milne p. 62 and avoids Theorem 4.6(b).
(a): exactness identifies `Ш¹_S(K, M)` with the dual of `Ш²_S(K, M^D)`; `Ш¹` is finite by *`β¹` is
proper*, hence so is `Ш²`. Naturality: the `Ext` sequence is natural in
`M^D`, and the Yoneda and cup-product pairings are natural (ProfiniteCohomology Layer 12). ([Milne,
*Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4,
Theorem 4.10, p. 56 (PDF p. 64); [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, end of the proof of
Theorem 4.10, p. 62 (PDF p. 70).) *Needs:* *Ext into the S-units and the S-ideles*; *Tate's global
duality for the S-idele classes*; *`P^r_S(K, M)` is dual to `P^{2−r}_S(K, M^D)`*; *`β¹` is proper*; *The
dual `M^D = Hom(M, E_S)`*; *Restricted products of local cohomology and `Ш^r_S`*; *S-ideles, S-units
and S-idele classes* (Layer R02.3); *Character duality for the arithmetic topological groups*;
ProfiniteCohomology Layer 12.

**Checks.**

- `K = ℚ`, `S = {3, ∞}`, `M = ℤ/3`: `H²(G_S, μ₃) = 0` (a `3`-torsion element of `Br(ℤ[1/3])` has
  zero invariant at `∞`, hence at `3`, and `Pic(ℤ[1/3]) = 0`), and correspondingly
  `β⁰ : ℤ/3 → P⁰_S = ℤ/3` is bijective.
- `K = ℚ`, `S = {2, ∞}`, `M = ℤ/2`, `r = 3`: by (c), `H³(G_S, ℤ/2) ≅ Ĥ³(ℝ, ℤ/2) = ℤ/2 ≠ 0`; the real
  terms do not vanish in high degree at `p = 2`.
- `S` all places, `M = ℤ/2`: `H¹(G_S, ℤ/2) = K^×/K^{×2}` is infinite and carries the discrete
  topology, while `H¹(G_S, μ₂)^*` is profinite; the topological types listed in (b) are in this
  order.

### R02.4.4 Finiteness, cohomological dimension and the Euler characteristic

**Finiteness of Galois cohomology with restricted ramification.** Let `S` be finite and `M` a finite
`G_S`-module whose order is a unit in `R_{K,S}`. Then `H^r(G_S, M)` is finite for every `r`
(`RestrictedRamification.finite_cohomology_galoisGroupS`).

*Proof sketch.* `P^r_S(K, M)` is finite for `S` and `M` finite, and `H⁰` is finite. `H¹` and `H²`
are finite because `Ш¹_S(K, M)` and `Ш²_S(K, M)` are (part (a) of *Poitou–Tate duality and the
nine-term exact sequence*, for `M` and for `M^D`); for `r ≥ 3` use its part (c). ([Milne,
*Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4,
Corollary 4.15, p. 62 (PDF p. 70).) *Needs:* *Poitou–Tate duality and the nine-term exact
sequence*; *Restricted products of local cohomology and `Ш^r_S`*.

**Checks.**

- `K = ℚ`, `S = {3, ∞}`, `M = ℤ/3`: ordinary `H⁰` has order `3`.
- With the same `K`, `S` and `M`, all groups in degrees `r ≥ 3` vanish, since the real Tate
  groups of odd-order coefficients vanish.
- `K = ℚ`, `S = {2, ∞}`, `M = ℤ/2`: the groups in degrees `r ≥ 3` have order `2`;
  finiteness does not imply eventual vanishing.

**Cohomological dimension of `G_{K,S}`.** Let `ℓ` be a prime that is a unit in `R_{K,S}`. For every
finite `ℓ`-primary `G_S`-module `M` and `r ≥ 3`, `H^r(G_S, M) ≅ ⊕_{v real} Ĥ^r(G_v, M)`. Hence
`cd_ℓ(G_S) ≤ 2` if `ℓ` is odd or `K` is totally imaginary. If `ℓ = 2` and `K` has `r₁ ≥ 1` real
places, `H^r(G_S, ℤ/2) ≅ (ℤ/2)^{r₁} ≠ 0` for every `r ≥ 3`, so `cd₂(G_S) = ∞`.
For arbitrary finite `M` with order a unit in `R_{K,S}`, odd `#M` or a totally imaginary `K`
gives vanishing in every degree `r > 2`
(`RestrictedRamification.subsingleton_cohomology_galoisGroupS_of_two_lt`).

*Proof sketch.* Part (c) of *Poitou–Tate duality and the nine-term exact sequence* applies to finite
`ℓ`-primary `M`, since `#M` is a power of `ℓ`, a unit in `R_{K,S}`. For `ℓ` odd the Tate cohomology
of `ℤ/2` with `ℓ`-primary coefficients vanishes; for `K` totally imaginary there is no real place.
So `H³(G_S, A) = 0` for every finite simple `ℓ`-torsion `A`. By ProfiniteCohomology Layer 11,
`cd_ℓ(G) ≤ n` if and only if `H^{n+1}(G, A) = 0` for every simple discrete `ℓ`-torsion `A`, and such
`A` are finite. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Theorem 4.10(c), p. 57 (PDF
p. 65).) *Needs:* *Poitou–Tate duality and the nine-term exact sequence*; ProfiniteCohomology Layer
11.

**Checks.**

- `K = ℚ`, `S = {3, ∞}` and `ℓ = 3`: the real Tate terms vanish, so `cd₃(G_S) ≤ 2`.
- `K = ℚ`, `S = {2, ∞}` and trivial `M = ℤ/2`: the real term gives `Hʳ(G_S, M) = ℤ/2` for every `r ≥ 3`.
- With `K = ℚ(√−5)`, `p = 2` and `S` only the complex place, `(P)` holds but the prime above 2 is
  omitted. The unramified quadratic extension `ℚ(i, √5)/K` and Minkowski's discriminant bound
  give a finite maximal unramified extension of even degree: its root discriminant is `√20`,
  whereas the lower bound in absolute degree `n` is `(π/4)(nⁿ/n!)^{2/n}`, tending to
  `πe²/4 > √20`. Thus `G_S` contains `C₂`. For `M = Coind_{C₂}^{G_S}(𝔽₂)`, Shapiro gives
  `H⁴(G_S, M) = H⁴(C₂, 𝔽₂) = 𝔽₂`. All modified archimedean terms are zero, so `H⁴_c` is also
  nonzero. Parity alone gives neither bound. (Milne, *Algebraic Number Theory*, Chapter 4,
  Theorem 4.3, proof of Theorem 4.9 and Remark 4.11.)

**Surjectivity of `H²` onto finitely many local `H²`.** Let `M` be a finite `G_S`-module whose order is
a unit in `R_{K,S}`, and `T ⊆ S` a finite subset omitting at least one finite place `v₀` of `S`.
Then `H²(G_S, M) → ⊕_{v∈T} H²(G_v, M)` is surjective. In particular (take `S` to be all places)
`H²(K, M) → ⊕_{v real} H²(K_v, M)` is surjective.

*Proof sketch.* By part (b) of *Poitou–Tate duality and the nine-term exact sequence*, the image of
`β²` is the orthogonal complement of the image of `β⁰` in the duality between `P⁰_S(K, M^D)` and
`P²_S(K, M)` (*`P^r_S(K, M)` is dual to `P^{2−r}_S(K, M^D)`*). Given `a ∈ P²_S(K, M)`, let `χ` be the
character of `P⁰_S(K, M^D)` it defines; `H⁰(G_S, M^D) → H⁰(K_{v₀}, M^D)` is injective, so the
restriction of `χ` to `H⁰(G_S, M^D)` extends to `H⁰(K_{v₀}, M^D)`. Correcting the component of `a`
at `v₀` by the element of `H²(K_{v₀}, M)` dual to that extension (ClassFieldTheory Layer 5) makes
`a` orthogonal to `im β⁰`, hence in `im β²`. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Corollary 4.16, p. 62 (PDF
p. 70).) *Needs:* *Poitou–Tate duality and the nine-term exact sequence*; *`P^r_S(K, M)` is dual to
`P^{2−r}_S(K, M^D)`*; ClassFieldTheory Layer 5.

**Checks.**

- `K = ℚ`, `S = {2, ∞}`, `T = {∞}`, `M = ℤ/2 = μ₂`: `H²(G_S, μ₂) → H²(ℝ, μ₂) = ℤ/2` is surjective;
  the quaternion algebra `(−1, −1)`, ramified exactly at `2` and `∞`, maps to the generator.
- `T` may not contain every finite place of `S`: for `K = ℚ`, `S = T = {p, ∞}` (`p` odd) and
  `M = μ_p`, `H²(G_S, μ_p) = 0` (Examples) while `H²(ℚ_p, μ_p) = ℤ/p`.

**High-degree cohomology of the S-units.** Let `ℓ` be a prime that is a unit in `R_{K,S}`. For
`r ≥ 3`, `H^r(G_S, E_S)(ℓ) → ⊕_{v real} H^r(G_v, K_v^{s×})(ℓ)` is an isomorphism; in particular
`H^r(G_S, E_S)(ℓ) = 0` if `ℓ` or `r` is odd. With `S` the set of all places,
`H³(K, K^{s×}) = 0` for every number field `K`.

*Proof sketch.* From `0 → E_S → K_S^× → Div_S → 0` (*The Kummer sequence for S-units*) and
`0 → Br(K) → ⊕_v Br(K_v) → ℚ/ℤ` (ClassFieldTheory Layer 10), `H²(G_S, E_S) → ⊕_{v real} Br(K_v)` is
surjective. The Kummer sequence `0 → μ_{ℓ^n} → E_S → E_S → 0` and part (c) of *Poitou–Tate duality
and the nine-term exact sequence* for `μ_{ℓ^n}` give a map of exact rows ending in
`H³(G_S, E_S)_{ℓ^n}` and `⊕_{v real} H³(G_v, K_v^{s×})_{ℓ^n}`; the five lemma gives `r = 3`, and
induction along the continued diagram gives `r > 3`. For `r` odd,
`H^r(G_v, ℂ^×) = Ĥ¹(ℤ/2, ℂ^×) = 0` at a real place (Hilbert 90 and periodicity); for `ℓ` odd the
`ℓ`-part of the Tate cohomology of `ℤ/2` vanishes. With `S` all places every `ℓ` is a unit, and
`H³` is torsion, so `H³(K, K^{s×}) = 0`. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Corollary 4.18, p. 63 (PDF
p. 71); [Harpaz–Wittenberg, *The Massey vanishing conjecture for number
fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §3, Remark 3.1, p. 9
(author final version).) *Needs:* *Poitou–Tate duality and the nine-term exact sequence*; *The
Kummer sequence for S-units* (Layer R02.3); *S-ideles, S-units and S-idele classes* (Layer R02.3);
ClassFieldTheory Layer 10; Tau Ceti `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`.

**The explicit Poitou–Tate cochain pairing.** Let `K`, `S` and `M` satisfy the hypotheses of
*Poitou–Tate duality and the nine-term exact sequence*. Its canonical pairing has the following
cochain description, independent of all representatives and primitives and natural in `M`.
For `a ∈ Ш¹_S(K, M)` and `a′ ∈ Ш²_S(K, M^D)`, represent them by cocycles `α`, `α′`, choose local
primitives `α_v = dβ_v`, `α′_v = dβ′_v` and a global `E_S`-valued `2`-cochain `ε` with
`α ∪ α′ = dε` (possible since `H³(G_S, E_S)` has no element of order dividing `#M`); then
`(β_v ∪ α′_v) − ε_v` is a local `2`-cocycle with class `c_v`, and `⟨a, a′⟩ = Σ_v inv_v(c_v)`. With
the Leibniz rule `d(x ∪ y) = dx ∪ y + (−1)^{deg x} x ∪ dy` of ProfiniteCohomology,
`d(β_v ∪ α′_v) = α_v ∪ α′_v = dε_v`, while `d(α_v ∪ β′_v) = −α_v ∪ α′_v`; so the cocycle can also be
written `−(α_v ∪ β′_v) − ε_v`, which differs from `(β_v ∪ α′_v) − ε_v` by the coboundary
`d(β_v ∪ β′_v)`. Milne's printed formula uses another sign convention for cup products.

*Proof sketch.* *High-degree cohomology of the S-units* kills the `#M`-torsion in
`H³(G_S, E_S)`, so `ε` exists. The Leibniz rule gives the local cocycle identities above.
At almost every finite place choose unramified primitives; the resulting local class has zero
invariant, so the sum is finite. Changing representatives or primitives changes it by local
coboundaries or the sum of
invariants of a global class, which is zero by global reciprocity. Compare the connecting
Ext class with the cup product to identify the formula with the canonical pairing. ([Milne,
*Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), I, §4, explicit
pairing, p. 65 (PDF p. 73); [Harpaz–Wittenberg, *The Massey vanishing conjecture for number
fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §7, proof of Lemma 7.7,
p. 29.) *Needs:* *Poitou–Tate duality and the nine-term exact sequence*;
*High-degree cohomology of the S-units*; ProfiniteCohomology Layer 12.

**Checks.**

- For `a = 0`, take `α = β_v = ε = 0`; the formula gives zero for every `a′`.
- With `deg β_v = 0` and `deg β′_v = 1`, the two local formulas differ by
  `d(β_v ∪ β′_v)`, so their invariants agree.
- For `K = ℚ`, `S = {2, ∞}`, `M = ℤ/2`, ordinary global `H³(G_S, M)` is nonzero;
  the primitive uses vanishing of the relevant torsion in `H³(G_S, E_S)`, not in `H³(G_S, M)`.

**Surjectivity of the decomposition map.** Let `G` be a finite group, `K` a finite extension of
`ℚ_p` containing the `|G|`-th roots of unity, and `k` its residue field. Reduction of
`G`-stable integral lattices gives a well-defined decomposition homomorphism
`d : R_K(G) → R_k(G)`, independent of the lattice and compatible with induction, and `d ⊗ ℚ` is
surjective. (Integral surjectivity also holds, by Serre's Theorem 33, but only the rational form is
needed: it is what carries Artin's induction theorem over to the modular Grothendieck group in
*`R_{𝔽_p}(G) ⊗ ℚ` is induced from cyclic p′-subgroups*.)

*Proof sketch.* Construct `d` from stable lattices over the valuation ring and prove independence of
the lattice using finite-length quotient filtrations. Induction commutes with reduction because the
coset module is finite free. By the characteristic-change theorem used in the proof of Milne's
Lemma 2.10 (Serre, *Linear representations of finite groups*, §16.1, Theorem 33), the Brauer
characters of the simple `k[G]`-modules are linearly independent functions on the `p`-regular
conjugacy classes, and restrictions of ordinary characters span these class functions once the
splitting field is large enough; so the decomposition matrix has full row rank, which is the
rational surjectivity. Combine `d` with Artin's induction theorem (RepresentationTheory/InductionRestriction Layer 6),
and pass back from a finite splitting residue field by restriction of scalars, whose composite with
extension of scalars is multiplication by the degree. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, proof of Lemma 2.10, p. 32
(PDF p. 40).) *Needs:* RepresentationTheory/InductionRestriction Layer 6.

**Checks.**

- `G = ℤ/p`: `R_k(G) = ℤ` (the only simple module is trivial), `R_K(G) = ℤ^p`, and `d` sends every
  character to its degree; `d` is surjective and not injective.
- `p ∤ |G|`: reduction is a bijection between irreducible representations, so `d` is an
  isomorphism.

**`R_{𝔽_p}(G) ⊗ ℚ` is induced from cyclic p′-subgroups.** For a finite group `G`,
`R_{𝔽_p}(G) ⊗ ℚ` is generated by the images of `Ind_H^G : R_{𝔽_p}(H) ⊗ ℚ → R_{𝔽_p}(G) ⊗ ℚ`, as `H`
runs over the cyclic subgroups of `G` of order prime to `p`.

*Proof sketch.* Artin's induction theorem: in characteristic `0`, `#G` times every virtual character
is an integral combination of characters induced from cyclic subgroups
(`TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`). *Surjectivity of the
decomposition map* transfers this to `R_k(G) ⊗ ℚ` for a large finite field `k`, and restriction of
scalars from `k` to `𝔽_p` to `R_{𝔽_p}(G) ⊗ ℚ`. It remains to pass from cyclic `H = H_p × H′` to its
prime-to-`p` part `H′`: a simple `k[H]`-module `N` is inflated from `H′`, and
`[Ind_{H′}^H N] = |H_p|·[N]` in characteristic `p`; divide by `|H_p|` only after passing to the
rational Grothendieck group. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §2, Lemma 2.10, p. 32 (PDF
p. 40).) *Needs:* *Surjectivity of the decomposition map*; Tau Ceti
`TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`.

**Checks.**

- `G = ℤ/p`: the only cyclic `p′`-subgroup is `1`, and `Ind_1^G [𝔽_p] = [𝔽_p[G]] = p·[𝔽_p]` in
  `R_{𝔽_p}(G) = ℤ`; the induced classes span `R_{𝔽_p}(G) ⊗ ℚ` but only `pℤ` integrally, so the
  statement cannot be made without `⊗ ℚ`.
- `p ∤ |G|`: the statement is Artin's induction theorem for `𝔽_p`-representations.

**The Euler characteristic quotient is multiplicative.** Let `S` be finite. For finite
`G_S`-modules `M` whose order is a unit in `R_{K,S}`, let
`χ(G_S, M) = #H⁰(G_S, M) · #H²(G_S, M)/#H¹(G_S, M)` and
`φ(M) = χ(G_S, M) · ∏_{v arch} |#M|_v / #H⁰(G_v, M)`, with ordinary `H⁰(G_v, M) = M^{G_v}`. Then
`φ(M) = φ(M′) · φ(M″)` for every short exact sequence `0 → M′ → M → M″ → 0` of such modules. In
`Suggested.lean`, `EulerCharacteristic.eulerChar` is the quotient `#H⁰ · #H² / #H¹` of three
cardinalities and `EulerCharacteristic.archFactor` the archimedean factor `#H⁰(G_v, M)/|#M|_v`.

*Proof sketch.* Truncate the long exact sequence at
`H⁵(G_S, M′)′ = ker(H⁵(G_S, M′) → H⁵(G_S, M))`; all terms are finite (*Finiteness of Galois
cohomology with restricted ramification*). For `r ≥ 3` replace `H^r(G_S, −)` by
`⊕_{v arch} H^r(G_v, −)` (part (c) of *Poitou–Tate duality and the nine-term exact sequence*);
`[P³] = [P⁴]` because the Herbrand quotient of a finite module is `1`, and periodicity of the
cohomology of a cyclic group identifies the kernel in degree `5` with
`C = ker(⊕_{v real} H¹(G_v, M′) → ⊕ H¹(G_v, M))`. The exact sequence
`0 → ⊕ H⁰(G_v, M′) → ⊕ H⁰(G_v, M) → ⊕ H⁰(G_v, M″) → C → 0` computes `#C`, and
`#M = #M′ · #M″`. The real places thus enter through the periodicity of Tate cohomology, not
through a truncation at degree `2`. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §5, Lemma 5.3, p. 69 (PDF
p. 77).) *Needs:* *Finiteness of Galois cohomology with restricted ramification*; *Poitou–Tate
duality and the nine-term exact sequence*; ProfiniteCohomology Layer 10; Tau Ceti
`TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`; Tau Ceti
`Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`.

**Checks.**

- `K = ℚ`, `S = {2, ∞}`, `0 → μ₂ → μ₄ → μ₂ → 0`: `χ(G_S, μ₄) = 2/4 = 1/2` while
  `χ(G_S, μ₂)² = 1`, so `χ` alone is not multiplicative; the archimedean factor corrects it,
  `φ(μ₄) = ½ · 4/2 = 1 = φ(μ₂)²`.

**The equivariant Kummer Euler class.** Let `p` be prime, `S` a finite set of places of a
number field `K` containing the archimedean places and all places above `p`, and `L/K` a finite
Galois extension inside `K_S`. Suppose that `Δ = Gal(L/K)` has order prime to `p`, that `L` is
totally imaginary and contains `μ_p`, and, if `p = 2`, that `L` contains `μ₄`. Write `S_L` for the
places above `S`, `S_{L,f}` for its finite places and `S_∞(L)` for its archimedean places. In the
Grothendieck group of finite-dimensional `𝔽_p[Δ]`-modules, with the conjugation action on
cohomology and the permutation action on places, prove

```text
[H⁰(G_{L,S_L}, μ_p)] − [H¹(G_{L,S_L}, μ_p)] + [H²(G_{L,S_L}, μ_p)]
  = −[𝔽_p[S_∞(L)]].
```

This target owns the following equivariant comparisons, including their compatibility with
field automorphisms and coefficient maps. Put `U = E_{L,S_L}`, `A = Pic(R_{L,S_L})`, and let
`B_S(L)` be the kernel of `Br(L) → ⊕_{w∉S_L} Br(L_w)`. Construct exact sequences

```text
0 → U/U^p → H¹(G_{L,S_L}, μ_p) → A[p] → 0,
0 → A/pA → H²(G_{L,S_L}, μ_p) → B_S(L)[p] → 0,
0 → B_S(L)[p] → 𝔽_p[S_{L,f}] → 𝔽_p → 0,
```

where the last map sums the local invariants, using `1/p ↔ 1` to identify their `p`-torsion with
`𝔽_p`. Prove the S-unit character calculation
`[U/U^p] = [μ_p] + [𝔽_p[S_L]] − [𝔽_p]` and the class-group cancellation
`[A[p]] = [A/pA]`. In particular these are equalities of representation classes, not only of
dimensions. The action on the `μ_p` term is cyclotomic.

*Proof sketch.* The first two sequences come from the long exact sequence of
`0 → μ_p → E_S → E_S → 0` over `L`, with `H¹(G_{L,S_L}, E_S) = A`. For the second sequence,
identify `H²(G_{L,S_L}, E_S)(p)` with `B_S(L)(p)`: apply cohomology to
`0 → E_S → J_S → C_S → 0`, use `H¹(G_{L,S_L}, C_S) = 0`, and identify the map from the `p`-primary
part of `H²(J_S)` to `H²(C_S)` with the sum of the local invariants. Include the needed
`p`-primary comparison `H²(G_{L,S_L}, J_S)(p) ≅ ⊕_{w∈S_{L,f}} Br(L_w)(p)`. It follows by Shapiro
and the local inflation comparison: the cyclotomic tower in `K_S` has local degrees divisible
by arbitrarily large powers of `p` at every finite `w∈S_L`, so restriction kills local
`p`-primary Brauer classes in the limit. At `w∤p` its Frobenius acts by the integer `#k_w > 1`,
of infinite order in `ℤ_p^×`; at `w|p` the local cyclotomic degrees are unbounded. All invariant
maps commute with field automorphisms. The global Brauer sequence then gives the third sequence;
`S_{L,f}` is nonempty because it contains the places above `p`.

For the S-unit character, use the full logarithmic embedding of ordinary units, whose image
spans the sum-zero hyperplane on `S_∞(L)`, and the valuation sequence
`0 → 𝓞_L^× → U → ℤ[S_{L,f}] → Cl(𝓞_L) → A → 0`.
Class-group finiteness gives the rational character of `U/μ(L)` as the permutation character on
`S_L` minus the trivial character. Reduce its `ℤ_p`-lattice using *Surjectivity of the decomposition
map* and retain the torsion contribution `μ(L)/μ(L)^p ≅ μ_p` as a `Δ`-module. Devissage of the
finite `p`-primary part of `A`, applied to multiplication by `p`, gives `[A[p]] = [A/pA]`.
Finally `H⁰(G_{L,S_L}, μ_p) = μ_p`; the Kummer sequences cancel its class and the class-group
terms, and the finite-place terms cancel against the Brauer contribution, leaving exactly
`−[𝔽_p[S_∞(L)]]`. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), I, §4, proofs of Lemmas 4.12–4.13,
pp. 59–60, and Corollary 4.18, pp. 63–64; II, §2, Proposition 2.1 and Remark 2.2(a), pp. 163–165,
for the S-integer Brauer calculation; I, §5, Theorem 5.1, p. 67, for the Euler formula.) *Needs:*
*The Kummer sequence for S-units*; *S-ideles, S-units and S-idele classes*; *`(G_S, C_S)` is a
P-class formation* (Layer R02.3); *Ext into the S-units and the S-ideles*; *Surjectivity of the
decomposition map*; ClassFieldTheory Layers 5, 6 and 10; ProfiniteCohomology Layers 7 and 10;
Mathlib `NumberField.Units.logEmbedding`, `NumberField.Units.finrank_modTorsion`
and `NumberField.RingOfIntegers.instFintypeClassGroup`. The S-unit character and the `p`-primary
idele comparison are supplied here from these inputs.

**Checks.**

- `K = ℚ`, `p = 3`, `S = {3, ∞}`, `L = ℚ(ζ₃)`: write `1` and `ε` for the trivial and sign
  representations of `Δ = ℤ/2`. Here `μ₃ = ε`, `[U/U³] = [ε] + [1]`, `A = 0`, `B_S(L)[3] = 0`,
  and `𝔽₃[S_∞(L)] = 1`; thus the Euler class is `[ε] − ([ε] + [1]) = −[1]`.
  Tensoring by `M ⊗ μ₃⁻¹` gives `−[ε]` for `M = ℤ/3` and `−[1]` for `M = μ₃`. Taking
  `Δ`-invariants gives logarithmic Euler characteristics `0` and `−1`, respectively. At the real
  place their ordinary invariants have orders `3` and `1`, their archimedean factors are `1` and
  `1/3`, and their global Euler characteristics are `1` and `1/3`. This paired check applies to
  the intermediate representations as well as to the final formula.
- `Δ = 1`, `L = ℚ(i)`, `p = 2`, `S_L` the places above `2` and `∞`: `dim H⁰ = 1`,
  `dim H¹ = 2` (the classes of `i` and `1+i`), `H² = 0`, and the Euler class is `−[𝔽₂]`.
- For a finite `p`-primary class-group summand `A = ℤ/p²` with trivial `Δ`-action,
  `A[p]` and `A/pA` each contribute one trivial representation. They cancel even though
  `A` itself is not an `𝔽_p`-vector space. If `S_{L,f}` has one place, its Brauer kernel is zero;
  in general it has dimension `#S_{L,f} − 1` with the specified permutation action.

**Tate's global Euler characteristic formula.** Let `S` be a finite set of places of the number
field `K` containing the archimedean places, and `M` a finite `G_S`-module whose order is a unit in
`R_{K,S}`. Put `χ(G_S, M) = #H⁰(G_S, M) · #H²(G_S, M)/#H¹(G_S, M)` (ordinary cohomology, even when
`K` has real places). Then

```text
χ(G_S, M) = ∏_{v arch} #H⁰(G_v, M) / |#M|_v,
```

where `H⁰(G_v, M) = M^{G_v}` is ordinary (not Tate) cohomology and `|·|_v` is the normalised
absolute value. For a totally complex `K` the right side is `(#M)^{−[K : ℚ]/2}`; this case is the
milestone `eulerChar_galoisGroupS_of_isTotallyComplex` of `Suggested.lean`. Equivalently
`χ(G_S, M) = ∏_{v arch} #Ĥ⁰(G_v, M^D)/#H⁰(G_v, M^D)` (Milne's Remark 5.2(a), p. 67, prints
`H⁰(G_v, M)` in this denominator; the `ℤ/3` check below shows that `M^D` is meant). Moreover
`χ(G_S, M) · χ(G_S, M^D) = ∏_{v∈S} χ(K_v, M)`, where
`χ(K_v, M) = #H⁰(K_v, M) · #H²(K_v, M)/#H¹(K_v, M)` is formed with the local groups of the
Conventions (Tate groups at the archimedean places).

*Proof sketch.* *The Euler characteristic quotient is multiplicative* reduces to `M` killed by a
prime `p`, a unit in `R_{K,S}`. Choose a finite Galois `L ⊆ K_S` splitting `M` and containing `μ_p`
(`μ₄` if `p = 2`). The quotient `φ` defines a homomorphism on `R_{𝔽_p}(Gal(L/K))`.
*`R_{𝔽_p}(G) ⊗ ℚ` is induced from cyclic p′-subgroups* reduces to modules induced from such
subgroups: Shapiro identifies the global Euler characteristics, and Mackey decomposition at
archimedean places identifies the ordinary-invariant factors and normalised absolute values.
Thus, replacing `K` by the corresponding fixed field, assume `Δ = Gal(L/K)` has order prime
to `p`. The extension `L` is totally imaginary.

Apply *The equivariant Kummer Euler class*. Put `W = M ⊗_{𝔽_p} μ_p⁻¹`, where
`μ_p⁻¹ = Hom_{𝔽_p}(μ_p, 𝔽_p)` has the inverse cyclotomic action. Since `G_{L,S_L}` acts trivially
on `W`, cup product gives `Hⁱ(G_{L,S_L}, M) ≅ Hⁱ(G_{L,S_L}, μ_p) ⊗ W` equivariantly.
Hochschild–Serre and the exactness of `Δ`-invariants give

```text
log_p χ(G_{K,S}, M) = −dim_{𝔽_p}(𝔽_p[S_∞(L)] ⊗ W)^Δ.
```

For odd `p`, decompose the permutation module into the orbits over the archimedean places of `K`.
A complex place has trivial stabiliser and contributes `dim M`. At a real place the stabiliser
is generated by complex conjugation `c_v`, which acts as `−1` on `μ_p`; hence `W^{c_v=1}` has
dimension `dim M^{c_v=−1}`. Consequently
`log_p χ = −r₂(K) dim M − Σ_{v real} dim M^{c_v=−1}`, exactly the logarithm of the displayed
archimedean product. For `p = 2`, the odd-order group `Δ` acts trivially on `μ₄`, so the reduced
base field contains `μ₄` and is totally imaginary; the same computation gives
`log₂ χ = −r₂(K) dim M`. Induction and multiplicativity recover the formula for the original
field and all finite coefficients, including `2`-primary modules over fields with real places.
Finally, the finite nine-term sequence gives the asserted product with `χ(G_S, M^D)`, using
local Tate groups at archimedean places. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §5, Theorem 5.1 and footnote 13,
p. 67 (PDF p. 75); Lemma 5.3 and Lemma 5.4(a), pp. 69–70, for multiplicativity and the
equivariant tensor comparison.) *Needs:* *The Euler characteristic quotient is multiplicative*;
*`R_{𝔽_p}(G) ⊗ ℚ` is induced from cyclic p′-subgroups*; *The equivariant Kummer Euler class*;
*The Hochschild–Serre spectral sequence* (Layer R02.2); *Poitou–Tate duality and the nine-term
exact sequence*; *The dual `M^D = Hom(M, E_S)`*; ProfiniteCohomology Layers 7 and 12.

**Checks.**

- Milne's footnote 13: `M = ℤ/2` and `S` the places above `2` and `∞` give `χ(G_S, M) = 2^{−s}`, `s`
  the number of complex places (each real factor is `2/2`, each complex factor `2/4`).
- `K = ℚ`, `S = {3, ∞}`, `M = ℤ/3`: `H⁰ = ℤ/3`, `H¹ = ℤ/3` (the cubic subfield of `ℚ(ζ₉)`),
  `H² = 0`, so `χ = 1 = #H⁰(G_ℝ, ℤ/3)/|3|_∞`; with Tate `Ĥ⁰(ℝ, ℤ/3) = 0` the formula would give
  `1/3`. Here `M^D = μ₃` has `Ĥ⁰(ℝ, μ₃)` and `H⁰(G_ℝ, μ₃)` both trivial, matching the equivalent form,
  whereas `#Ĥ⁰(ℝ, μ₃)/#H⁰(G_ℝ, ℤ/3) = 1/3` would not.
- `χ(G_S, M) · χ(G_S, M^D) = ∏_{v∈S} χ(K_v, M)` for `K = ℚ`, `S = {3, ∞}`, `M = ℤ/3`: the left side
  is `1 · 1/3`, and the right side is `χ(ℚ₃, ℤ/3) · χ(ℝ, ℤ/3) = 1/3 · 1` with Tate groups at `∞`
  (ordinary groups at `∞` would give `1/3 · 3`).

### R02.4.5 Global function fields and finite compact support

**Prime-to-characteristic function-field Poitou–Tate duality.** Let `F` be a global function field
of characteristic `ℓ`, `S` a nonempty set of places of `F`, and `M` a finite discrete
`G_{F,S}`-module of order prime to `ℓ`, with exponent `m` and `M^D = Hom(M, μ_m)`. With the
ordinary local groups at the places of `S` (there are no archimedean places) and the restricted
products `P^r_S(M)` relative to the unramified subgroups,

```text
0 → H⁰(G_{F,S}, M) → P⁰_S(M) → H²(G_{F,S}, M^D)^*
  → H¹(G_{F,S}, M) → P¹_S(M) → H¹(G_{F,S}, M^D)^*
  → H²(G_{F,S}, M) → P²_S(M) → H⁰(G_{F,S}, M^D)^* → 0
```

is an exact sequence of locally compact groups. The kernels `Ш¹_S(F, M^D)` and `Ш²_S(F, M)` are
finite and perfectly paired by cup product and the sum of the local invariants. Restriction,
corestriction and coefficient maps satisfy the corresponding dual adjunctions.
`H^r(G_{F,S}, M) = 0` for `r ≥ 3`, and if `S` is finite every `H^r(G_{F,S}, M)` is finite.

*Proof sketch.* The function-field class formation and idele inputs are *The class formation of a
global function field* and *Local inputs at places of a global function field*. Build the diagram of
`S`-units, `S`-ideles and `S`-idele classes from *Function-field places, ideles and `S`-units* and
*Restricted ramification over a global function field*. The degree-zero idele classes are compact,
and completing the degree factor replaces `ℤ` by `Ẑ` with uniquely divisible quotient `Ẑ/ℤ`
(there is no connected component as for number fields). The prime-to-characteristic Kummer sequence
and Shapiro's lemma for the unramified units identify the `Ext` terms with global and restricted
local cohomology. Apply *Tate's duality theorem for a class formation* and the finite local
invariants to the exact idele sequence, following NSW §§8.4–8.6: Theorem 8.6.7 gives the finite
kernel pairing and Theorem 8.6.10 the nine-term sequence. The projection formula and the
normalisation of local invariants give the adjunctions. For nonempty `S`, the completed
function-field class formation and NSW Theorem 8.3.17 give `cd_p G_{F,S} ≤ 2` for `p ≠ ℓ`; for
finite `S`, Kummer theory, finiteness of `S`-class groups and of `S`-units modulo `m`, and the
Hochschild–Serre argument of NSW Theorem 8.3.20 give finiteness. None of this uses the number-field
theorem *Poitou–Tate duality and the nine-term exact sequence*. ([Neukirch–Schmidt–Wingberg,
*Cohomology of Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.3,
Theorems 8.3.17 and 8.3.20, pp. 462–465; §8.6, Theorems 8.6.7 and 8.6.10, pp. 485–492.) *Needs:*
*P-class formations* (Layer R02.3); *Tate's duality theorem for a class formation*; *Ext of
discrete G-modules*; *The dual `M^D = Hom(M, E_S)`*; *Local inputs at places of a global function
field* (Layer R02.3); *The class formation of a global function field* (Layer R02.3);
*Function-field places, ideles and `S`-units* (Layer R02.3); *Restricted ramification over a global
function field* (Layer R02.3); ProfiniteCohomology Layers 7, 10, 11 and 12.

**Checks.**

- For finite `S` the alternating product of the orders in the sequence gives
  `χ(G_{F,S}, M) · χ(G_{F,S}, M^D) = ∏_{v∈S} χ(F_v, M) = 1`, the local Euler characteristic being
  `1` for coefficients prime to the residue characteristic.
- `H³(G_{F,S}, ℤ/2) = 0` (`ℓ ≠ 2`), in contrast with a number field with a real place, where
  `H³(G_S, ℤ/2) ≠ 0`: there is no archimedean Tate term.
- `S = ∅` is excluded: then `P⁰_S = 0` while `H⁰(G_{F,∅}, ℤ/m) = ℤ/m`, so the sequence cannot begin
  with an injection.

**Finite arithmetic compact support.** Let `F` be a global field, `M` a finite discrete
`G_{F,S}`-module, and `S` a finite nonempty set of places of `F` containing the places where `M`
ramifies, the places dividing `#M` and, for a number field, the archimedean places; for a function
field assume `#M` prime to `char F`. Let `res = Σ_v loc_v : C(G_{F,S}, M) → ⊕_{v∈S} C_v(M)` be the
sum of the localisation maps of cochain complexes, where `C_v(M)` is the continuous cochain complex
of `G_v` at a finite place, the complete (Tate) cochain complex of `G_v` at a real place, and zero
at a complex place. The finite compactly supported complex `C_c(G_{F,S}, M)` is the mapping fibre
`Cone(res)[−1]`, with the sign of the Conventions; its cohomology `H^i_c(G_{F,S}, M)`, `i ∈ ℤ`, sits
in the long exact sequence of the fibre, is finite in each degree, and is natural in `M` and in the
localisation diagram; for `M = μ_m` the sum of the local invariants defines the invariant map
`H³_c(G_{F,S}, μ_m) → ℚ/ℤ`.
If `M` is `p`-primary and `(P)` holds (`p` odd, or `F` without real places), the
archimedean complexes are acyclic and `C_c` is the fibre of the localisation to the finite places of
`S`. If `p = 2` and `F` has a real place, `H^i_c` can be nonzero in negative degrees and the global
cohomology can be unbounded above. For finite coefficients its groups in degrees `i > 2` are
the sums of the real Tate cohomology groups of `M`, so nonvanishing depends on `M`; both
complexes retain their full degrees.

The API:

- `ArithmeticDuality.finiteCompactCochains`: the mapping fibre of the finite arithmetic
  localisation map.
- `ArithmeticDuality.finiteCompactCohomology`: its cohomology in each integer degree.
- `ArithmeticDuality.finiteCompact_exact`: the long exact sequence of the localisation fibre.
- `ArithmeticDuality.finiteCompact_map`: naturality in the coefficients and in the localisation
  diagram.

*Proof sketch.* The fibre of a map of complexes is a complex, and its triangle gives the long exact
sequence. Finiteness follows from finiteness of the global and local cohomology (*Poitou–Tate
duality and the nine-term exact sequence* and its function-field form) and the five lemma; at real
places use the complete resolution of `Gal(ℂ/ℝ)`. The degree-`3` invariant map is the sum of the
local invariants on the local `H²` terms. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.3.1, pp. 122–123; §5.7.2–5.7.4,
pp. 131–133; [Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.6, Theorems 8.6.7 and
8.6.10, pp. 485–492.) *Needs:* *Localisation maps and the modified local groups* (Layer R02.3);
*Poitou–Tate duality and the nine-term exact sequence*; *Local inputs at places of a global function
field* (Layer R02.3); *The class formation of a global function field* (Layer R02.3);
*Prime-to-characteristic function-field Poitou–Tate duality*.

**Checks.**

- `GaloisCohomology.compactCohomology_identity`: the mapping fibre of an identity map is acyclic.
- `finite_support_no_local`: a zero local complex gives back the global cochain complex.
- `finite_support_h0`: `H⁰` of the fibre is the kernel of localisation on `H⁰` when the local complex
  has no cohomology in negative degrees.
- Under `(P)` with `S` finite and nonempty, `H⁰_c = 0`: `S` contains a finite place `v`, and
  `M^{G_{F,S}} → M^{G_v}` is injective.
- `F = ℚ`, `S = {2, ∞}`, `M = ℤ/2`: `H⁰_c ≅ Ĥ^{−1}(ℝ, ℤ/2) = ℤ/2 ≠ 0`, a contribution of the real
  place in degree `0` that the ordinary finite-place fibre would not see.

**Function-field arithmetic finiteness and Euler characteristic.** Let `F` be a global function
field of characteristic `ℓ`, `p ≠ ℓ` a prime, `S` a nonempty finite set of places, and `M` a finite
`p`-primary discrete `G_{F,S}`-module. Then each `Hⁱ(G_{F,S}, M)` is finite, `cd_p G_{F,S} ≤ 2`,
and `#H⁰(G_{F,S}, M) · #H²(G_{F,S}, M)/#H¹(G_{F,S}, M) = 1`. If `M` is a finite-dimensional vector
space over a finite field `k` of characteristic `p`, the alternating sum of the `k`-dimensions of
the `Hⁱ(G_{F,S}, M)` is zero. Compact support and local duality use the ordinary local groups at
the places of `S`, and there is no archimedean factor.

*Proof sketch.* *Prime-to-characteristic function-field Poitou–Tate duality* gives the local–global
pairing, finiteness for finite `S` and the bound `cd_p ≤ 2` for nonempty `S`. NSW Theorem 8.7.4
gives the Euler characteristic, whose archimedean product is empty, hence equal to `1`; its proof
uses the `S`-unit and Kummer class cancellation and the same modular-induction method as the
number-field formula. Convert cardinalities into dimensions over the finite coefficient field.
([Neukirch–Schmidt–Wingberg, *Cohomology of Number
Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.3, Theorems 8.3.17 and
8.3.20, pp. 462–465; §8.7, Theorem 8.7.4, pp. 505–509; [Fakhruddin–Khare–Patrikis, *Lifting and
automorphy of reducible mod p Galois representations over global
fields*](https://arxiv.org/pdf/2008.12593), §2, p. 10.) *Needs:* *Prime-to-characteristic
function-field Poitou–Tate duality*; *Local inputs at places of a global function field* (Layer
R02.3); *The class formation of a global function field* (Layer R02.3).

**Checks.**

- `F = 𝔽_q(t)`, `S = {∞}`, `M = ℤ/m` with `m` prime to `q`: `H⁰ = ℤ/m`, `H¹ = ℤ/m` (only the
  constant extensions are unramified outside `∞` at prime-to-`ℓ` level), hence `H² = 0`; the Euler
  characteristic is `1`, with no real-place correction.
- In the same example with `k = 𝔽_p`, `m = p`, the dimensions are `1, 1, 0`, with alternating sum
  `0`.
- `S = ∅` is excluded: for the function field of a curve of positive genus, `G_{F,∅}` is the
  fundamental group of the complete curve and has `cd_p = 3`.

### R02.4.5a Finite-coefficient Poitou–Tate input

**Finite-coefficient Poitou–Tate input.** Let `K` be a number field, `A` a finite `Γ_K`-module and
`A^D` its Cartier dual. Fix a finite set `Σ` of places containing the archimedean places, the places
above the primes dividing `|A|`, and the places where `A` is ramified. For `v ∉ Σ`, let
`H¹_nr(K_v, A) ⊆ H¹(K_v, A)` be the subgroup of unramified classes. Then:

1. The local Tate pairings `H¹(K_v, A) × H¹(K_v, A^D) → ℚ/ℤ` add up to a perfect pairing between the
   restricted products of the `H¹(K_v, A)` and of the `H¹(K_v, A^D)`, taken with respect to the
   unramified subgroups outside `Σ`. Under this pairing, the images of `H¹(K, A)` and `H¹(K, A^D)` are
   exact orthogonal complements of each other.
2. For every finite set `S` of places, the Pontryagin dual of the localization defect
   `coker(H¹(K, A) → ∏_{v∈S} H¹(K_v, A))` is `Ш¹_S(K, A^D)/Ш¹(K, A^D)`.
3. There is a perfect pairing `Ш²(K, A) × Ш¹(K, A^D) → ℚ/ℤ`.

The maps are the localization maps of §R02.3.0d *Finite Galois localization and Sha kernels*. Real
places enter
through Tate's modified groups in degree zero and through the ordinary groups in positive degree.
Statements (1) and (3) specialize global duality to `Γ_K` and the localization carriers of
§R02.3.0d; statement (2) identifies the dual of the finite-set localization defect.

*Proof sketch.* Apply §R02.4.3 *Poitou–Tate duality and the nine-term exact
sequence* with its set of places taken to be all places of `K`, which that theorem allows. Then its
group `G_S` is `Γ_K`, every order is a unit in `K`, its dual `Hom(M, E_S)` is the Cartier dual, and its
kernels `Ш^r_S` are the kernels `Ш^r` of §R02.3.0d *Finite Galois localization and Sha kernels*
(`PoitouTate.sha_eq_absoluteSha` identifies them with the all-place kernels, which are cut out by the
same localization maps). Its restricted product `P¹` uses the unramified subgroups at the finite
places where the module is unramified; that differs from the choice in (1) at finitely many places,
which does not change a restricted product. Exactness at `P¹`, with the self-duality *`P^r_S(K, M)` is
dual to `P^{2−r}_S(K, M^D)`*, says that the image of `H¹(K, A)` is the exact annihilator of the image of
`H¹(K, A^D)`, and symmetrically; this is (1). Part (a) for `M = A^D`, with `A^{DD} = A`, is (3). For
(2), a family over the finite set `S`, extended by zero outside `S`, annihilates the image of
`H¹(K, A)` exactly when, by (1), it is the localization of a class of `H¹(K, A^D)` that vanishes
outside `S`, that is, of a class of `Ш¹_S(K, A^D)`; two such classes give the same family exactly when
they differ by an element of `Ш¹(K, A^D)`. The subscript `S` of this roadmap is the finite set of
places at which vanishing is not imposed; the `S` in §§R02.4.2–R02.4.3 is the set of allowed
ramification, here all places.

Sources: [Demarche–Lucchini Arteche–Neftin](https://www.numdam.org/item/10.5802/aif.3104.pdf), §2.6,
equation 2.3 and Proposition 2.5, pp. 1018–1019, which state the pairing and the finite-`S` quotient and
refer to the original global duality theorem; [Schmidt–Wingberg](https://arxiv.org/pdf/math/9809211v1),
Definitions 8–9, p. 10, and Lemma 10 with its proof, p. 11 (arXiv v1).
*Needs:* §R02.3.0d *Finite Galois localization and Sha kernels*; §R02.4.2 *Restricted
products of local cohomology and `Ш^r_S`* (`PoitouTate.sha_eq_absoluteSha`) and *`P^r_S(K, M)` is dual to
`P^{2−r}_S(K, M^D)`*, R02.4.3 *Poitou–Tate duality and the nine-term exact sequence*; ClassFieldTheory
Layer 5; ProfiniteCohomology Layers 1 and 7.

**Checks.**

- For `S = ∅`, the localization defect is the empty product `0`, and `Ш¹_∅/Ш¹ = 0`, as (2) requires.
- For `A = ℤ/n` the dual is `A^D = μ_n`, and for `A = μ_n` it is `ℤ/n` with trivial action. So (3)
  pairs `Ш²(K, ℤ/n)` with `Ш¹(K, μ_n)`, which is the group computed in *Grunwald–Wang and its
  exceptional class*. A dual without its Galois action would pair `Ш²(K, ℤ/n)` with `Ш¹(K, ℤ/n)`.
- At a real place, `H¹(ℝ, ℤ/2) ≅ ℤ/2` and `H¹(ℝ, μ₂) = ℝ×/ℝ×² ≅ ℤ/2` pair perfectly into
  `H²(ℝ, μ₂) ≅ ½ℤ/ℤ`: the cup product of the two nontrivial classes is the class of Hamilton's
  quaternions. So the real terms cannot be omitted.

### R02.4.5b Grunwald–Wang and its exceptional class

**Grunwald–Wang and its exceptional class.** Let `K` be a number field, `m ≥ 1`, and `T` a finite set
of places of `K`. Let `Ш¹_T(K, μ_m)` be the group of classes in `K×/K×^m` that are `m`-th powers in
`K_v` for every `v ∉ T`. Then `Ш¹_T(K, μ_m)` is either zero or cyclic of order two. The second
alternative is the Grunwald–Wang exceptional case. It requires `8 | m` and that `−1` is not a square in
`K`, together with further conditions on `K` and its dyadic places. In particular `Ш¹_T(K, μ_m) = 0`
whenever
`8 ∤ m` or `μ₄ ⊂ K`. For `T = ∅` this says that `Ш¹(K, μ_m)` is zero or of order two.

By §R02.4.5a *Finite-coefficient Poitou–Tate input*, prescribing local characters of order dividing
`m` at the
places of `T` is obstructed exactly by the dual of `Ш¹_T(K, μ_m)/Ш¹(K, μ_m)`. So every cyclic local
prescription has to allow for the exceptional class.

Over `ℚ`, comparing valuations at every prime and signs at the real place shows that a rational number
which is a fourth power (respectively an eighth power) in every completion is a fourth (respectively an
eighth) power. Hence `Ш¹(ℚ, μ₄) = Ш¹(ℚ, μ₈) = 0`, and duality gives `Ш²(ℚ, ℤ/4) = Ш²(ℚ, ℤ/8) = 0`.
These are statements about the everywhere-local kernels. They do not remove Wang's obstruction to cyclic
degree-eight prescriptions at a dyadic place (the unramified dyadic prescription in §R02.4.6).

*Proof sketch.* `μ_m` is the direct sum of the `μ_{p^r}` over the prime powers `p^r` exactly
dividing `m`, and `Ш¹_T(K, μ_m)` splits accordingly; fix one `p^r` and put `L = K(μ_{p^r})`. If
`a ∈ K^×` is a `p^r`-th power in `K_v` for every `v ∉ T`, then every place of `L` not above `T`
splits completely in the Kummer extension `L(a^{1/p^r})/L`, which is therefore trivial by
Chebotarev. So `a ∈ L^{×p^r}`, and by inflation–restriction the class of `a` lies in
`H¹(Gal(L/K), μ_{p^r})`. The cyclotomic character embeds `Gal(L/K)` in `(ℤ/p^r)^×`, and `Gal(L/K)`
acts on `μ_{p^r}` through it. A computation with cyclic groups, after splitting off `{±1}` when
`p = 2`, shows that this `H¹` is zero unless `p = 2`, `r ≥ 2` and `−1` lies in the image of
`Gal(L/K)`, in which case it has order two. Hence `Ш¹_T(K, μ_m)` has order at most two, and it is
zero when `μ₄ ⊂ K`, since the image then lies in `1 + 4ℤ`. For `r = 2` and `√−1 ∉ K`, the nonzero
class of `H¹(Gal(L/K), μ₄)` is that of `−4 = (1 + √−1)⁴`; but `−4` is a fourth power in `K_v` only
when `√−1 ∈ K_v`, which fails at infinitely many places by Chebotarev, so this class is not in
`Ш¹_T(K, μ₄)` and the exceptional case needs `8 | m`. Over `ℚ`, argue with valuations and the real
place as above. The degree-two vanishings follow from statement (3) of *Finite-coefficient
Poitou–Tate input*. §R02.4.6 *Grunwald–Wang with its exact dyadic
obstruction* refines this alternative to the exact exceptional triples and the generator of the
exceptional class.

Sources: [Harpaz–Wittenberg, *Massey vanishing*](https://arxiv.org/pdf/1904.06512v2), §7, Lemma 7.6 and
the argument following it, PDF pp. 28–31. These pages give the computation over `ℚ` and the order-two
alternative, which they cite to Artin–Tate, *Class Field Theory*, Chapter X, Theorem 1;
[Conrad, *Lifting global representations with local
properties*](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Appendix A, Definition A.1,
p. 31, whose special case requires `8 | m` and that `−1` is not a square.
*Needs:* §R02.3.0d *Finite Galois localization and Sha kernels*, §R02.4.5a *Finite-coefficient
Poitou–Tate input*;
ClassFieldTheory Layer 5 (Kummer theory); ProfiniteCohomology Layer 5 (inflation–restriction);
Chebotarev Layer 10.

**Checks.**

- `Ш¹(ℚ, μ₈) = 0`, but `Ш¹_{2}(ℚ, μ₈) ≅ ℤ/2` (the case `T = {2}`), generated by `16`. The reason is
  the factorization `x⁸ − 16 = (x² − 2)(x² + 2)(x² − 2x + 2)(x² + 2x + 2)`: one of `2, −2, −1` is a
  square in every `ℚ_v` with `v ≠ 2`, so `16` is an eighth power at those places, while `v₂(16) = 4` is
  not divisible by 8. This is the exceptional class for `T = {2}`. A statement asserting
  `Ш¹_T(K, μ_m) = 0` for every `T` fails here.
- For a degree-64 `C₈ × C₈` extension `L/ℚ` in which `16` is an eighth power in every completion but
  which contains none of `√−1`, `√2`, `√−2`, `Ш¹(L, μ₈) ≅ ℤ/2`, even
  with `T = ∅`, generated by `16`. The local-power hypothesis places `16` in the kernel, while the
missing quadratic square roots prevent it from being an eighth power in `L` (Harpaz–Wittenberg,
proof of Lemma 7.7).
- Outside the exceptional case the group vanishes: `Ш¹_T(K, μ_p) = 0` for every prime `p` and every
  finite `T`, since `8 ∤ p`. So the order-two alternative must not be asserted in general, and must not
  be dropped when `8 | m`.

### R02.4.6 All-place kernels, Grunwald–Wang and character roots

**All-place Sha duality and transfer adjunction.** Let `F` be a global field and `M` a finite
`G_F`-module of exponent `m` prime to the characteristic of `F`, with `M^D = Hom(M, μ_m)` carrying
the contragredient cyclotomic action. The kernels `Ш¹(F, M^D)` and `Ш²(F, M)` of localisation to
all places of `F` (for the absolute group `G_F`, not for a finite `S`) are finite and perfectly
paired by cup product and the sum of the local invariants. For a number field the archimedean
terms are the complete Tate groups, which agree with ordinary `H¹` and `H²`. For every finite
extension `L/F`, restriction and corestriction preserve these kernels, and
`⟨cor x, y⟩_F = ⟨x, res y⟩_L` for `x ∈ Ш¹(L, M^D)` and `y ∈ Ш²(F, M)`, and symmetrically
`⟨res x, z⟩_L = ⟨x, cor z⟩_F` for `x ∈ Ш¹(F, M^D)` and `z ∈ Ш²(L, M)`; coefficient maps satisfy the
corresponding dual adjunction.

*Proof sketch.* Enlarge a finite `S` so that it contains the ramification of a representative, and
compare all-place kernels using the unramified annihilators. Apply finite Poitou–Tate (or the
all-place class-formation theorem) to obtain the finite pairing. Compare cup product, transfer and
the sums of invariants using the projection formula and the normalisation
`inv_L ∘ res = [L_w : F_v]·inv_F` of local invariants. ([Neukirch–Schmidt–Wingberg, *Cohomology of
Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §8.6, Theorem 8.6.7
and the explicit pairing, pp. 485–489; [Qian, *Potential automorphy for
`GL_n`*](https://par.nsf.gov/servlets/purl/10388233), Proof of Lemma 2.1, p. 1246; [Harpaz–Wittenberg,
*The Massey vanishing conjecture for number
fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), §7, Lemmas 7.6–7.7,
pp. 28–30.) *Needs:* *Absolute and relative locally trivial groups* (Layer R02.3); *Poitou–Tate
duality and the nine-term exact sequence*; *The dual `M^D = Hom(M, E_S)`*; *Restriction and
corestriction descent for finite index* (Layer R02.2); *Local inputs at places of a global function
field* (Layer R02.3); *The class formation of a global function field* (Layer R02.3);
*Prime-to-characteristic function-field Poitou–Tate duality*; ProfiniteCohomology Layer 10;
§R02.4.5a *Finite-coefficient Poitou–Tate input*.

**Checks.**

- `F = ℚ`, `M^D = μ₄`: `Ш¹(ℚ, μ₄) = 0` (a rational number that is a fourth power at every place is a
  fourth power), hence `Ш²(ℚ, ℤ/4) = 0`.
- `F` totally imaginary (for instance CM): the archimedean local groups vanish and the pairing is a
  sum over finite places only.
- Normalisation: for `L/F` of degree `d`, `x ∈ Ш¹(F, M^D)` and `y ∈ Ш²(F, M)`,
  `⟨res x, res y⟩_L = ⟨x, cor res y⟩_F = d·⟨x, y⟩_F`; a pairing over `L` normalised without the local
  degrees would give `1` or `d²` in place of `d`.

**Grunwald–Wang with its exact dyadic obstruction.** Let `F` be a number field, `S` a finite set of
places of `F`, and for `v ∈ S` let `χ_v : F_v^× → ℂ^×` be a continuous character of finite order
(at a real place, the trivial or the sign character); let `n` be the least common multiple of their
orders. Let `s = s_F ≥ 2` be the largest integer with `η_s = ζ_{2^s} + ζ_{2^s}^{−1} ∈ F`, and let
`S_F` be the (possibly empty) set of dyadic places `v` with `F_v(μ_{2^{s+1}})/F_v` biquadratic. The
special case is: `F(μ_{2^{s+1}})/F` biquadratic, `v₂(n) > s` and `S ⊇ S_F` (Conrad's convention,
with `S_F = ∅` allowed). Outside the special case the kernel of `F^×/F^{×n} → ∏_{v∉S} F_v^×/F_v^{×n}`
is trivial, and there is a finite-order idele class character `χ` of `F` of order `n` with
`χ|_{F_v^×} = χ_v` for every `v ∈ S`. In the special case this kernel is generated by
`a = (2 + η_s)^{n/2}`, and the obstruction is `∏_{v∈S_F} χ_v(a) = ±1`: a global `χ` of order `n`
with these restrictions exists if and only if it is `1`, and if it is `−1` there is one of order
`2n`. The dyadic places are part of the statement; excluding them from `S` gives a sufficient
condition for the absence of an obstruction, not its definition.

*Proof sketch.* Global reciprocity turns the problem into extending finite-order characters of the
local idele factors to the idele class group. Compute the annihilator through the global `n`-th
power kernel, by finite duality. The explicit dyadic cyclotomic calculation identifies the kernel
and the product obstruction. If the obstruction is nontrivial, replacing `n` by `2n` removes the
kernel restriction. ([Conrad, *Lifting global representations with local
properties*](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Appendix A, Definition
A.1, Remark A.2 and Proposition A.3, pp. 31–32; [Boxer–Calegari–Gee–Newton–Thorne, *The Ramanujan
and Sato–Tate conjectures for Bianchi modular forms*](https://arxiv.org/pdf/2309.15880), §5.3, Lemma
5.3.1 and Remark 5.3.2, author pp. 55–56; published pp. 49–50.) *Needs:* *All-place Sha duality and
transfer adjunction*; *Cyclotomic description of the power kernel* (Layer R02.3); ClassFieldTheory
Layer 12; GlobalNumberFields Layer 6; §R02.4.5b *Grunwald–Wang and its exceptional class*.

**Checks.**

- `F = ℚ`, `n = 8`: `s = 2`, `S_ℚ = {2}`, `a = 16`; for `χ₂` unramified of order `8`,
  `χ₂(16) = χ₂(2)⁴ = −1`, so no global character of order `8` restricts to `χ₂` (there is one of
  order `16`).
- If `S` contains no dyadic place, then either `S ⊉ S_F` or `S_F = ∅` (empty product `1`), so a
  global character of order `n` always exists.
- In the `F = ℚ`, `n = 8` example, twisting `χ₂` by an unramified character `μ` of order dividing
  `4` leaves the obstruction `χ₂(16)μ(16) = −μ(2)⁴ = −1` unchanged: an unramified twist does not in
  general remove it.

**Character roots and local Brauer obstructions.** Let `F` be a number field, `E` a field of
characteristic `0` with algebraic closure `Ē`, `χ : G_F → μ_N(Ē)` a continuous character of finite
order, and `m ≥ 1`. The power sequence `1 → μ_m → μ_{mN} → μ_N → 1` (`x ↦ x^m`) has trivial
`G_F`-actions and gives `δχ ∈ H²(F, μ_m(Ē)) ≅ H²(F, ℤ/m)`; `χ` is the `m`-th power of a character
`G_F → Ē^×` if and only if `δχ = 0` (the root may need a finite extension of `E`). The class `δχ`
has nonzero localisation at only finitely many places; at such a place, after adjoining `μ_m`, any
local extension of degree divisible by `m` kills its invariant. For `m = 2`, `ℤ/2 = μ₂` canonically
and `δχ` is a `2`-torsion Brauer class, so injectivity of `Br(F) → ⊕_v Br(F_v)` detects its
vanishing. More generally, for `m` prime, restriction `H²(F, ℤ/m) → H²(F(μ_m), ℤ/m)` is injective
because `[F(μ_m) : F]` divides `m − 1`, and over `F(μ_m)` the class is an `m`-torsion Brauer class;
so `Ш²(F, ℤ/m) = 0` and local vanishing of `δχ` again implies `δχ = 0`. For composite `m`, local
vanishing determines `δχ` only up to `Ш²(F, ℤ/m)`, which can be nonzero (dual to `Ш¹(F, μ_m)`, see
*Grunwald–Wang with its exact dyadic obstruction*); the identification of `ℤ/m` with `μ_m` (and so
with Brauer classes) requires `μ_m ⊆ F`.

*Proof sketch.* The power sequence is a short exact sequence of discrete modules with trivial action;
take its connecting map. Inflation from a finite quotient shows that only finitely many
localisations can be nonzero, since unramified local `H²` with trivial finite coefficients
vanishes. After adjoining roots of unity the local class is a `μ_m`-Brauer class, and restriction
multiplies the local invariant by the local degree. For `m` prime use the global Brauer sequence
over `F(μ_m)` and `cor ∘ res = [F(μ_m) : F]`, prime to `m`; for general `m` keep the all-place kernel
and its dual `Ш¹(F, μ_m)`. ([Qian, *Potential automorphy for
`GL_n`*](https://par.nsf.gov/servlets/purl/10388233), Proof of Lemma 2.1, pp. 1245–1247;
[Boxer–Calegari–Gee–Newton–Thorne, *The Ramanujan and Sato–Tate conjectures for Bianchi modular
forms*](https://arxiv.org/pdf/2309.15880), §5.3, proof of Lemma 5.3.3, author p. 56.) *Needs:*
*All-place Sha duality and transfer adjunction*; ProfiniteCohomology Layers 5 and 11;
ClassFieldTheory Layers 5 and 10.

**Checks.**

- If `χ = ψ^m` already, then `δχ = 0`.
- An unramified local character has an `m`-th root in `Ē^×` (take an `m`-th root of the value at
  Frobenius); correspondingly the local obstruction vanishes.
- `F = ℚ`, `m = 2`: the quadratic character of `ℚ(√5)/ℚ`, with values in `{±1} ⊆ ℚ^×`, is the
  square of a character of `Gal(ℚ(ζ₅)/ℚ) ≅ ℤ/4`, whose values `±i` are not in `ℚ`; the quadratic
  character of `ℚ(i)/ℚ` has no square root at all, its obstruction being the quaternion class
  `(−1, −1) ≠ 0`.
- Composite `m` can carry a global obstruction: `Ш²(ℚ(√7), ℤ/8)` is dual to `Ш¹(ℚ(√7), μ₈)`, which
  contains the class of `16`. It is an eighth power in every completion of `ℚ(√7)` (at the dyadic
  place because `ℚ₂(√7) = ℚ₂(i)` and `16 = (1 + i)⁸`; at an odd place because one of `2`, `−1`, `−2`
  is a square there; at the real places because `16 > 0`), but not in `ℚ(√7)`, which contains none of
  `√2`, `√−1`, `√−2`. So for `m = 8` local vanishing does not force `δχ = 0`; for `m` prime no such
  class exists.

**Totally real local base change with avoidance.** Let `F` be a number field, `L` a number field
(the avoidance field), `T` a finite set of rational primes, and `Σ` a finite set of finite places of
`F` with integers `d_v ≥ 1` (`v ∈ Σ`), such that `d_v = 1` whenever `v` lies above a prime of `T`.
(a) There is a totally real finite Galois extension `M/ℚ`, linearly disjoint from `L` over `ℚ`, in
which every prime of `T` splits completely, such that `d_v` divides `[(FM)_w : F_v]` for every
`v ∈ Σ` and every place `w` of `FM` above `v`. No solubility is asserted in (a).
(b) If `d_v = 2` for every `v ∈ Σ`, `M` can moreover be chosen soluble, with `[M_u : ℚ_p]` divisible
by `2[F_v : ℚ_p]` for every `v ∈ Σ` above `p` and every place `u` of `M` above `p`; after base change
to `FM` the invariant of every class in `Br(F_v)[2]`, `v ∈ Σ`, is killed, so a finite list of
classes in `Br(F)[2]` supported on `Σ` dies in `Br(FM)`.
(c) If `F` is totally real, `d_v ≤ 2` for every `v ∈ Σ`, and the primes of `T` are odd, a totally
real quadratic extension `F′/F` can be used instead: `F′_w ≠ F_v` at the places `v ∈ Σ` with
`d_v = 2`, the places of `F` above `T` split in `F′`, and `F′ ⊄ FL`.

*Proof sketch.* (a) The field construction is the one used in the proof of BCGN Lemma 5.3.3:
weak approximation together with Krasner's lemma realises finitely many prescribed local
extensions by one global extension, and an auxiliary place makes it linearly disjoint from the
avoidance field. Put `Σ₊ = {v ∈ Σ : d_v > 1}`; every requirement outside `Σ₊` is automatic,
and no prime below `Σ₊` belongs to `T`. For each prime `p` below `Σ₊` fix a finite extension
`E_p/ℚ_p` of degree divisible by `d_v[F_v : ℚ_p]` for every `v ∈ Σ₊` above `p`
(an unramified one will do). Choose `n ≥ 5`,
at least every `[E_p : ℚ_p]`, and local monic separable polynomials of degree `n`: over `ℚ_p` one
with a root generating `E_p`; over `ℝ` one with `n` distinct real roots;
over `ℚ_q` for `q ∈ T` one with `n` distinct roots in
`ℚ_q`; at further auxiliary primes, one irreducible and one with an irreducible factor of degree
`n − 1`; and at an auxiliary odd prime `q₀`, outside all the previous primes and unramified in the
Galois closure `L̃` of `L`, one of the form `(x² − q₀)·(n − 2 distinct linear factors)`. By weak
approximation choose a monic `g ∈ ℚ[x]` close to all of them; by Krasner's lemma `g` has the same
local root fields. Let `M` be the splitting field of `g`. It is totally real (all roots of `g` are
real), every prime of `T` splits completely in it, and each completion of `M` above `p` contains
`E_p`, so `[(FM)_w : F_v]` is a multiple of `[F_v E_p : F_v]`, which is divisible by `d_v`
for `v ∈ Σ₊`. For `v ∈ Σ ∖ Σ₊`, divisibility by `d_v = 1` holds without a local prescription.
The irreducible auxiliary polynomial makes the root action transitive; the `(n − 1)`-cycle
makes a point stabilizer transitive on the other roots, so the action is doubly transitive and
hence primitive. A primitive permutation group containing a transposition is `S_n`
(Mathlib `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem`, as inventoried in
PolynomialGaloisGroups). Thus `Gal(M/ℚ) = S_n`, and the inertia group at `q₀` is
generated by a transposition; so every nontrivial Galois subextension of `M` (namely `ℚ(√disc g)`
and `M`) is ramified at `q₀`, whereas every subfield of `L̃` is unramified there. Hence
`M ∩ L̃ = ℚ`, and `M` is linearly disjoint from `L`. (b) Follow the soluble construction in the proof
of ACC Theorem 7.1.11; the local degree is then even over each `F_v`, which kills `Br(F_v)[2]`, and
Brauer injectivity concludes. (c) By weak approximation in `F` choose a totally positive `d ∈ F^×`
that is a non-square in `F_v` for the `v ∈ Σ` with `d_v = 2`, a square in `F_v` for `v` above `T`,
and of odd valuation at an auxiliary place `v₀` unramified in `FL̃/F`; then `F′ = F(√d)` is ramified
at `v₀`, so `F′ ⊄ FL`. The resulting fields are used in *Roots after prescribed totally real base
change*; *Character roots and local Brauer obstructions* and *Grunwald–Wang with its exact dyadic
obstruction* do not provide the field construction. ([Boxer–Calegari–Gee–Newton–Thorne, *The
Ramanujan and Sato–Tate conjectures for Bianchi modular forms*](https://arxiv.org/pdf/2309.15880),
§5.3, Lemma 5.3.3 and proof, author pp. 55–56; [Allen–Calegari–Caraiani–Gee–Helm–Le
Hung–Newton–Scholze–Taylor–Thorne, *Potential automorphy over CM
fields*](https://annals.math.princeton.edu/2023/197-3/p02), Proof of Theorem 7.1.11, pp. 1103–1104;
[Boxer–Calegari–Gee–Pilloni, *Abelian surfaces over totally real fields are potentially
modular*](https://arxiv.org/pdf/1812.09269), §8.5, proof of Theorem 8.5.2; §9.2, proof of Lemma
9.2.7, author pp. 249, 257.) *Needs:* GlobalNumberFields Layer 1
(`GlobalNumberFields.weakApproximation_denseRange`); Mathlib
`Mathlib.Analysis.Normed.Field.Krasner` (`IsKrasner.krasner`); Mathlib's primitive-group
recognition theorem `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem` and the
permutation-action API inventoried in PolynomialGaloisGroups, *What Mathlib provides*.

**Checks.**

- A prime `p ∈ T` below `v ∈ Σ` splits completely in `M`, so `(FM)_w = F_v` and `[(FM)_w : F_v] = 1`:
  the hypothesis `d_v = 1` there is necessary.
- For `F = ℚ(√2)`, `L = ℚ`, `Σ = {v | 3}`, `d_v = 1` and `T = {3}`, the prime `3` is inert,
  so `[F_v : ℚ₃] = 2`. Here `Σ₊ = ∅`, no `E₃` is prescribed, and `M = ℚ` satisfies (a).
- `Σ = T = ∅`: `M = ℚ` satisfies (a) for every `L`.
- `F = ℚ`, `Σ = {2}` with `d₂ = 2`, `T = {13}`, `L = ℚ(i)`: `M = ℚ(√3)` satisfies (a): it is real,
  ramified at `2`, `3 ≡ 4² (mod 13)`, and `ℚ(√3) ∩ ℚ(i) = ℚ`; for `L = ℚ(√3)` it fails, and
  `ℚ(√10)` works instead.

**Roots after prescribed totally real base change.** Let `F` be a CM field,
`η : G_F → ℚ̄_l^×` a character of finite order, `m ≥ 1`, and `L` a number field. There is a
totally real finite Galois extension `M/ℚ`, linearly disjoint from `L`, such that
`η|_{G_{FM}} = ψ^m` for a character `ψ : G_{FM} → ℚ̄_l^×`. If `T` is a finite set of odd primes
such that `η` is unramified at every place above `T`, then `M` can be chosen with every prime of `T`
split completely and `ψ` unramified at every place above `T`. No solubility of `M` is asserted in
general. For `m = 2`, in the situation of ACC Theorem 7.1.11, `M` can be taken soluble with local
degrees `[M_u : ℚ_p]` divisible by `2[F_v : ℚ_p]`: Brauer injectivity kills the obstruction, and a
quadratic Grunwald–Wang twist makes each of finitely many square roots unramified at the prescribed
places. If instead `F` is totally real and `η` is totally even (trivial on every complex
conjugation) and unramified at the places above an odd prime `p`, a suitable totally real quadratic
extension `F′/F`, in which the places above `p` split and which is linearly disjoint from `L`, makes
`η|_{G_{F′}}` a square; for totally real `F` local square roots at real places exist only for even
characters. Coefficients are algebraically closed of characteristic `0` throughout.

*Proof sketch.* Taking roots successively, it suffices to treat `m` prime: if `m = m₁m₂` and
`η|_{G_{FM₁}} = ψ₁^{m₁}`, apply the prime case again to `ψ₁` over the CM field `FM₁`, with avoidance
field the Galois closure of `LM₁`, and use that a compositum of totally real Galois extensions of
`ℚ` linearly disjoint in this way is linearly disjoint from `L`. For `m` prime, the obstruction `δη`
lies in `H²(F, ℤ/m)`, which restricts injectively to `H²(F(μ_m), μ_m) = Br(F(μ_m))[m]` because
`[F(μ_m) : F]` divides `m − 1` (*Character roots and local Brauer obstructions*). Its local
invariants vanish outside the finite set of places where `η` ramifies, and at the places above `T`,
where `η` is unramified. Apply *Totally real local base change with avoidance* to that finite set,
with local degrees divisible by `m[F(μ_m) : ℚ]`, keeping `L` and the splitting conditions at `T`;
restriction multiplies local invariants by local degrees, so every local invariant of `δη` dies over
`F(μ_m)M`, and Brauer injectivity over `F(μ_m)M` together with the injectivity of restriction kills
`δη` over `FM`. To make `ψ` unramified above `T`, twist it by a character `ε` with `ε^m = 1` whose
restrictions to the inertia groups above `T` are `ψ^{−1}` (these have order dividing `m`, since `η`
is unramified there), given by *Grunwald–Wang with its exact dyadic obstruction* with no
obstruction, since no dyadic place is involved. ([Boxer–Calegari–Gee–Newton–Thorne, *The Ramanujan
and Sato–Tate conjectures for Bianchi modular forms*](https://arxiv.org/pdf/2309.15880), §5.3, Lemma
5.3.3, author p. 56; published p. 50; [Allen–Calegari–Caraiani–Gee–Helm–Le
Hung–Newton–Scholze–Taylor–Thorne, *Potential automorphy over CM
fields*](https://annals.math.princeton.edu/2023/197-3/p02), Proof of Theorem 7.1.11, pp. 1103–1104;
[Boxer–Calegari–Gee–Pilloni, *Abelian surfaces over totally real fields are potentially
modular*](https://arxiv.org/pdf/1812.09269), §8.5, proof of Theorem 8.5.2, author pp. 248–249; §9.2,
p. 257.) *Needs:* *Character roots and local Brauer obstructions*; *Grunwald–Wang with its exact
dyadic obstruction*; *Cyclotomic description of the power kernel* (Layer R02.3); *Totally real local
base change with avoidance*.

**Checks.**

- `η = 1`: `M = ℚ` and `ψ = 1`.
- `η = ψ₀^m` already over `F`: the obstruction vanishes and any `M` (for instance `ℚ`) works.
- `F` totally real, `m = 2`, `η` odd at a real place `v`: `η_v` is the sign character, which has no
  square root on `Gal(ℂ/ℝ)`, so the evenness hypothesis cannot be dropped.

**Tate vanishing for trivial Q/Z coefficients.** For a global field `F`, `H²(G_F, ℚ/ℤ) = 0`, where
`ℚ/ℤ` carries the trivial discrete action (in positive characteristic, for the part prime to
`char F`). Equivalently, every class in `H²(F, ℤ/n)` (trivial action) dies under some coefficient
inclusion `ℤ/n → ℤ/N`. This concerns the direct limit of trivial cyclic coefficients, not the
Brauer group `H²(F, μ_∞)`; and it is a statement about the absolute group `G_F`, not about
`G_{F,S}`. For a number field the vanishing is supplied by ArithmeticGaloisRepresentations
§7.6 / **Projective lifting**; this target adds global function fields and the finite form.

*Proof sketch.* The long exact sequence of `0 → ℤ → ℚ → ℚ/ℤ → 0` with trivial action, and the
vanishing of positive-degree cohomology of `ℚ` (averaging over finite quotients), give
`H²(G_F, ℚ/ℤ) ≅ H³(G_F, ℤ)`. For a number field this is supplied by ArithmeticGaloisRepresentations
§7.6 / **Projective lifting** (equivalently Milne's Corollary 4.17: the odd-degree integral
cohomology of `G_F` vanishes). For a global function field, Milne's Remark 1.12 gives strict cohomological dimension two away from the
characteristic from the global class formation, so the prime-to-characteristic part of `H³(G_F, ℤ)`
vanishes. Commutation of cohomology with filtered colimits of finite cyclic trivial coefficients
gives the finite form: every class in `H²(F, ℤ/n)` dies under some `ℤ/n → ℤ/N`. For `G_{F,S}` the
corresponding strict-cohomological-dimension statement is open in general (it involves
nonvanishing of regulators; Milne, Remark 1.12). ([Conrad, *Lifting global representations with
local properties*](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), Introduction,
Remark 1.1, pp. 1–2; [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), I, Remark 1.12, p. 24; Corollary 4.17 and
proof, p. 63.) *Needs:* *All-place Sha duality and transfer adjunction*; *Cyclotomic description of
the power kernel* (Layer R02.3); *Local inputs at places of a global function field* (Layer R02.3);
*The class formation of a global function field* (Layer R02.3); ProfiniteCohomology Layers 4 and
11; ArithmeticGaloisRepresentations §7.6 / **Projective lifting**.

**Checks.**

- The trivial action is essential: `H²(F, μ_∞) = Br(F) ≠ 0`, for instance the quaternion algebra
  `(−1, −1)` over `ℚ`.
- `F = ℚ`, `n = 2`: the class of `(−1, −1)` in `H²(ℚ, ℤ/2) = Br(ℚ)[2]` is nonzero, and it dies under
  `ℤ/2 → ℤ/4` (`1 ↦ 2`), being the connecting image of the quadratic character of `ℚ(i)/ℚ` for
  `0 → ℤ/2 → ℤ/4 → ℤ/2 → 0`; the coefficient enlargement is needed, as the class itself is nonzero.

**Local torus evaluation and modified adelic points.** Let `T` be a torus over a number field `F`
and put `X = X^*(T)`, with its discrete Galois action. Choose a finite set `S₀` containing the
archimedean places and a smooth torus model `𝒯` over `𝒪_{F,S₀}`. This target includes existence of
such a model: spread a finite splitting extension and descend the split torus after enlarging
`S₀`. At finite `v ∉ S₀` put `U_v = 𝒯(𝒪_v)`, a compact open subgroup of `T(F_v)`; at the finitely
many finite places in `S₀` choose any compact open subgroup `U_v`. Define `P⁰(T)` as the restricted
product of the finite-place groups relative to `U_v`, times `Ĥ⁰(F_v,T)` at real places and zero
at complex places. The real factor is `T(ℝ)/N T(ℂ)`, with its finite quotient topology.
Changing the model, enlarging `S₀` or changing the exceptional compact open subgroups gives the
canonical topological identification.

For a topological abelian group `B`, define `B^∧ = lim_U B/U`, where `U` runs through its open
subgroups of finite index, with the inverse-limit topology. The canonical map has dense image;
`P⁰(T)^∧` means the completion of this entire restricted product. For a discrete torsion group
`A`, write `A^D = Hom(A, ℚ/ℤ)` with the compact-open topology, equivalently the inverse limit
of the finite duals of its finite subgroups. This applies also to groups of unbounded exponent.

Evaluation `T(F_v^s) × X → F_v^{s×}`, cup product and the local invariant give a perfect pairing
`T(F_v)^∧ × H²(F_v,X) → ℚ/ℤ` at a finite place. At a real place use the perfect pairing
`Ĥ⁰(F_v,T) × Ĥ²(F_v,X) → ½ℤ/ℤ`; the complex-place factors vanish. At a good finite place,
the image of `U_v^∧` and `H²_un(F_v,X)`, the image of inflation from `H²(G_{κ_v},X)`
for the residue-field Galois group, are exact annihilators.
Thus the finite sum `θ(t)(a) = Σ_v inv_v(t_v ∪ loc_v(a))` defines a continuous homomorphism
`θ : P⁰(T) → H²(F,X)^D`, natural in `T` and zero on the image of `T(F)` by reciprocity.
Construct its unique continuous extension `θ^∧` to `P⁰(T)^∧` by extending its maps to each finite
dual `A^D`, for `A ⊂ H²(F,X)` finite. The adelic comparison supplies a surjection
`q : T(𝔸_F) → P⁰(T)`, the identity at finite places and the Tate quotient at infinity;
the sum of evaluation invariants on actual adelic points is `θ ∘ q`.

*Proof sketch.* Use torus character evaluation and local Tate–Nakayama duality, with Kummer
reductions at every positive integer. Integral evaluation has zero invariant because
`Br(𝒪_v) = 0`; local duality identifies the exact integral annihilators. Every global lattice
cohomology class is unramified outside finitely many places, so the sum is finite. Compare
models through the supplied adelic topology and check that local evaluation factors through
the real norm quotient. ([Harari–Szamuely, *Arithmetic duality theorems for
1-motives*](https://www.imo.universite-paris-saclay.fr/~david.harari/articles/motive.pdf),
§2, Theorem 2.3, Proposition 2.9 and Theorem 2.10, author pp. 9–14, specialized to `[0 → T]`;
[Harari, *Le défaut d’approximation forte pour les groupes algébriques
commutatifs*](https://www.imo.universite-paris-saclay.fr/~david.harari/articles/ant.pdf),
§1.1, author pp. 1–2, and §2, pairing and definition of `θ`, pp. 7–8.)
*Needs:* *Tate's duality theorem for a class formation*; *Local duality at the archimedean places*;
ProfiniteCohomology Layers 9 and 12; ClassFieldTheory Layers 5 and 10;
ReductiveGroups (tori and character lattices); AdelicAlgebraicGroups §§1.1–1.2 and §1.5.

**Checks.**

- For `T = G_m` at a finite place, `F_v^×/𝒪_v^× = ℤ`, whereas its completed valuation factor
  is `Ẑ`; the local perfect pairing uses the latter.
- For `G_m` at a real place, `Ĥ⁰(ℝ,G_m) = {±1}`; at a complex place the modified factor is zero.
- At a good place for `G_m`, an unramified character evaluates through the valuation and
  pairs trivially with `𝒪_v^×`, exactly the specified integral subgroup.

**The completed all-place torus sequence.** With `F`, `T`, `X`, `P⁰(T)` and the completion of
*Local torus evaluation and modified adelic points*, construct the finite perfect pairing
`Ш¹(F,T) × Ш²(F,X) → ℚ/ℤ` and the exact sequence of continuous homomorphisms
`P⁰(T)^∧ → H²(F,X)^D → Ш²(F,X)^D → 0`.
The first map is `θ^∧`; the second restricts a character to `Ш²(F,X)` and, via the finite
pairing, identifies its value with an element of `Ш¹(F,T)`. This target owns the passage from
finite Poitou–Tate to the completed lattice/torus sequence, for number fields with all real
terms retained.

*Proof sketch.* Use the Kummer sequences for `T[n]` and its finite dual `X/nX` for every `n > 0`,
their compatibility with evaluation, and finite Poitou–Tate. In these diagrams distinguish
`B^♭ = lim_n B/nB`, with quotient topologies and divisibility as the indexing order, from
`B^∧`: construct `(B^♭)^∧ ≅ B^∧` for `B = T(F)` and `B = P⁰(T)`.
Prove that the finite-level localization maps `T(F)/nT(F) → P⁰(T)/nP⁰(T)` are strict with finite
kernels, and that `T(F)^♭ → P⁰(T)^♭` is strict with closed image and profinite quotient
`P⁰(T)^♭/im(T(F)^♭)`; these assertions supply exactness through the two completion procedures.
For multiplicatively written groups, `nB` means the subgroup of `n`th powers. Identify the
connecting map using the finite Sha pairing from class-formation duality for finitely generated lattices.
([Harari–Szamuely, *Arithmetic duality theorems for
1-motives*](https://www.imo.universite-paris-saclay.fr/~david.harari/articles/motive.pdf),
§4, Corollary 4.9 and Remark 4.10; §5, Lemma 5.3, Proposition 5.4, Theorem 5.6 and proof,
author pp. 30–37, with
[Corrigenda](https://www.imo.universite-paris-saclay.fr/~david.harari/errata/reviscorcrelle.pdf),
corrections to journal pp. 120 and 123, corrigenda p. 5;
[Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf),
I, paragraph following Corollary 4.21, p. 66; [Harari, *Le défaut d’approximation forte pour les
groupes algébriques
commutatifs*](https://www.imo.universite-paris-saclay.fr/~david.harari/articles/ant.pdf),
§2, proof of Theorem 2, author pp. 10–11, specialized to `[0 → T]`.)
*Needs:* *Local torus evaluation and modified adelic points*; *All-place Sha duality and transfer
adjunction*; *Tate's duality theorem for a class formation*; *Ext of discrete G-modules*;
*The Milnor sequence for towers of complexes* (DerivedModuleAlgebra §1.T.1); ProfiniteCohomology Layers 7 and 9.

**Checks.**

- For the zero torus, all three groups and both maps are zero.
- For `T = G_m`, `Ш²(F,ℤ) = 0` by Chebotarev, so the completed evaluation map is surjective.
- For `F = ℚ` and `X = ℤ`, `H²(F,X) = Hom(G_F,ℚ/ℤ)` has unbounded exponent, since cyclotomic
  extensions have cyclic quotients of arbitrarily large order; the sequence uses all `n`.

**Torus quotient compactness and adelic image realization.** For the number-field torus and
modified group above, put `K_T = ∏_{v finite} U_v × ∏_{v real} Ĥ⁰(F_v,T)`, with zero complex
factors. The image of `T(F)` has finite index in `P⁰(T)/K_T`. Its projection also has finite
index in `P⁰_{outside S₀}(T)/∏_{v∉S₀} U_v`. The quotient
`P⁰(T)/closure(im(T(F)))` is compact Hausdorff. Consequently
`im(θ) = im(θ^∧)` in `H²(F,X)^D`, and this is also the image of evaluation from the actual
points `T(𝔸_F)`.

*Proof sketch.* Apply AdelicAlgebraicGroups §3.4 **Finiteness of class numbers** to the compact
open subgroup `∏_{v finite} U_v` of the finite adelic points. The modified archimedean factors
are finite, so finitely many translates of the compact group `K_T` cover the quotient by
rational points. Passing to the closure makes the quotient Hausdorff while preserving
compactness. Since `θ` kills rational points, its image is compact and closed in the profinite
target. The dense canonical image of `P⁰(T)` in `P⁰(T)^∧` makes `im(θ)` dense in
`im(θ^∧)`; closedness gives equality. Surjectivity of `q` identifies this with the actual adelic
image, preserving evaluation and the modified real-place convention.
([Harari, *Le défaut d’approximation forte pour les groupes algébriques
commutatifs*](https://www.imo.universite-paris-saclay.fr/~david.harari/articles/ant.pdf),
§2, Lemma 3, author p. 5, Lemma 4 and proof, p. 10, and remarks after Theorem 2, p. 11.)
*Needs:* *Local torus evaluation and modified adelic points*; AdelicAlgebraicGroups §3.4
*Finiteness of class numbers*, with its §§1.2 and 1.5 adelic topology and compact open levels;
Mathlib compact images and Hausdorff quotients by closed subgroups.

**Checks.**

- For `T = G_m`, the finite-index assertion is finiteness of the ideal class group; removing
  the archimedean norm factors gives a compact quotient modulo the closure of `F^×`.
- For `F = ℚ(√2)` and `T = G_m`, the powers of `1 + √2` and `{±1}` form an infinite countable
  subgroup inside the compact integral box, exactly its rational points. This intersection is
  not closed, so the rational-point closure is essential for the Hausdorff quotient.
- `ℤ → ℤ/n` is onto for every `n`, but `ℤ → Ẑ` has dense proper image. Finite-level
  surjectivity alone cannot replace the compactness and closedness argument.

**Torus Sha duality and adelic annihilators.** Let `T` be a torus over a number field `F` with
character lattice `X^*(T)`. Then
`Ш¹(F, T)` and `Ш²(F, X^*(T))` are finite and perfectly paired. The image of `T(𝔸_F)` in
`Hom(H²(F, X^*(T)), ℚ/ℤ)`, given by the sum of the local evaluation invariants, is the annihilator
of `Ш²(F, X^*(T))`; here `H²(F, X^*(T))` is discrete and its dual carries the compact-open topology.
In the torsor application of Harpaz–Wittenberg, the obstruction character changes by the negative
of this pairing.

*Proof sketch.* *The completed all-place torus sequence* supplies the finite Sha pairing and
identifies the completed evaluation image with the kernel of restriction to `Ш²(F,X^*(T))`.
*Torus quotient compactness and adelic image realization* realizes exactly this image by
actual adelic points. Use the evaluation of *Local torus evaluation and modified adelic points*
and check the source's torsor sign. ([Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), Chapter I, §4, Theorem 4.20 and
Corollary 4.21 and the following paragraph, pp. 65–66; [Harari, *Le défaut d’approximation forte
pour les groupes algébriques
commutatifs*](https://www.imo.universite-paris-saclay.fr/~david.harari/articles/ant.pdf),
§2, Theorem 2, author pp. 10–11; [Harpaz–Wittenberg, *Zéro-cycles sur les espaces homogènes et
problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf), §2,
Propositions 2.6–2.7, author p. 11.) *Needs:* *The completed all-place torus sequence*;
*Torus quotient compactness and adelic image realization*;
*Local torus evaluation and modified adelic points*.

**Checks.**

- `T = G_m`: `Ш¹(F, G_m) = 0` by Hilbert 90, and `Ш²(F, ℤ) = 0` since
  `H²(F, ℤ) = Hom(G_F, ℚ/ℤ)` and a character trivial at every place is trivial (Chebotarev).
- `T = G_m`: the map `𝔸_F^× → Hom(H²(F, ℤ), ℚ/ℤ) = G_F^{ab}` is the global reciprocity map; it is
  surjective for a number field, matching the annihilator of `Ш²(F, ℤ) = 0`.
- `T = R^1_{L/F} G_m` for `L/F` cyclic: `Ш¹(F, T) = 0` by the Hasse norm theorem, so
  `Ш²(F, X^*(T)) = 0`.

**Function-field central obstruction localization.** Let `F` be a global function field of
characteristic `ℓ`, and `A` a finite abelian group of exponent `e` prime to `ℓ`, with trivial
action, and assume `μ_e ⊆ F`. Then `H²(G_F, A) → ∏_v H²(G_{F_v}, A)` is injective. More generally
the same holds for a finite `G_F`-module of order prime to `ℓ` whose Tate dual is constant. The
roots-of-unity hypothesis makes the dual action trivial; an isomorphism `A ≅ A^D` depends on
choices.

*Proof sketch.* The root-of-unity hypothesis makes `A^D = Hom(A, μ_e)` a constant finite module. A
locally trivial class in `H¹(F, A^D)` is then an everywhere-split finite abelian extension, trivial
by function-field Chebotarev (ArithmeticGaloisRepresentations §5.13 / **Chebotarev for function fields**),
so `Ш¹(F, A^D) = 0`; by *All-place Sha duality and transfer
adjunction*, `Ш²(F, A) = 0`, which is the injectivity. ([Wood, *Nonabelian Cohen–Lenstra
moments*](https://par.nsf.gov/servlets/purl/10152050), §3, Lemma 3.2 and its proof, published
p. 389.) *Needs:* *All-place Sha duality and transfer adjunction*; *Local inputs at places of a
global function field* (Layer R02.3); *The class formation of a global function field* (Layer
R02.3); ArithmeticGaloisRepresentations §5.13 / **Chebotarev for function fields**.

**Checks.**

- `A = ℤ/n` with `μ_n ⊆ F`: `A^D = μ_n ≅ ℤ/n` is constant, `Ш¹(F, ℤ/n) = 0` by Chebotarev, and
  hence `H²(F, ℤ/n) → ∏_v H²(F_v, ℤ/n)` is injective.
- All places of `F` are nonarchimedean: the product has no archimedean factor and none is added.

### Examples

- For `K = ℚ`, `S = {p, ∞}` with `p` odd and `M = μ_p`: `H⁰(G_S, μ_p) = 0`; by the `S`-unit Kummer
  sequence `H¹(G_S, μ_p) = ℤ[1/p]^×/(ℤ[1/p]^×)^p ≅ ℤ/p` (generated by `p`; `−1` is a `p`-th power)
  since `Cl(ℤ[1/p]) = 0`; the Euler characteristic formula gives
  `χ(G_S, μ_p) = #H⁰(G_ℝ, μ_p)/|p|_∞ = 1/p`, hence `#H²(G_S, μ_p) = 1`, consistent with the Brauer
  sequence: an element of `Br(ℤ[1/p])[p]` has invariants at `p` and `∞` summing to `0`, and the
  real invariant has order at most `2`.
- At a real place, `Ĥ⁰(ℝ, ℤ/2) × Ĥ²(ℝ, ℤ/2) → H²(ℝ, μ₂) = ½ℤ/ℤ` is perfect: the archimedean terms
  of Poitou–Tate cannot be dropped.
- Grunwald–Wang over `ℚ`: there is no cyclic degree-eight extension of `ℚ` whose completion at `2`
  is the unramified extension of degree eight, because `16` is a local eighth power away from `2`.

### Dependencies

- Earlier layers of this roadmap: R02.2, R02.3.
- TauCetiRoadmap ProfiniteCohomology: Layers 1, 4, 5, 7, 9, 10, 11, 12.
- TauCetiRoadmap Chebotarev: Layer 10.
- DerivedModuleAlgebra: §1.T.1 (tower algebra and Milnor).
- TauCetiRoadmap ClassFieldTheory: Layers 3, 4, 5, 6, 10, 11, 12.
- TauCetiRoadmap AdelicAlgebraicGroups: §§1.1–1.2, §1.5 and §3.4 (torus adelic topology,
  compact open levels and finite class sets).
- TauCetiRoadmap RepresentationTheory/InductionRestriction: Layer 6.
- Earlier targets: §§R02.4.5a–R02.4.5b *Finite-coefficient Poitou–Tate input* and
  *Grunwald–Wang and its exceptional class*.
- ArithmeticGaloisRepresentations: §5.13 / **Chebotarev for function fields**;
  §7.6 / **Projective lifting**.
- TauCetiRoadmap GlobalNumberFields: Layers 1, 6, 7.
- PolynomialGaloisGroups, *What Mathlib provides*: the Mathlib primitive-group recognition API.
- Mathlib `IsKrasner.krasner`, `Equiv.Perm.subgroup_eq_top_of_isPreprimitive_of_isSwap_mem`.
- TauCetiRoadmap ReductiveGroups: tori and their character lattices.
- Libraries: Tau Ceti `TauCeti.DiscreteRep`,
  Mathlib `CategoryTheory.IsGrothendieckAbelian.enoughInjectives`,
  Mathlib `CategoryTheory.hasExt_of_enoughInjectives`, Mathlib `CategoryTheory.Abelian.Ext`, Mathlib
  `CategoryTheory.Abelian.Ext.comp`, Mathlib `CategoryTheory.Abelian.Ext.covariantSequence_exact`,
  Mathlib `continuousCohomology`, Tau Ceti `TauCeti.InternalHom`, Tau Ceti
  `TauCeti.InternalHom.evalPairing`, Tau Ceti `TauCeti.KummerCoeff`, Mathlib `tateCohomology`, Tau
  Ceti `Rep.FiniteCyclicGroup.tateCohomologyIsoEven`, Tau Ceti
  `Rep.FiniteCyclicGroup.tateCohomologyIsoOdd`, Tau Ceti
  `TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`, Mathlib `RestrictedProduct`, Mathlib
  `RestrictedProduct.topologicalSpace`, Mathlib `PontryaginDual`, Tau Ceti
  `TauCeti.ClassFunction.natCard_nsmul_mem_indVirtualCharacters_isCyclic`.

## Layer D7: Derived continuous cohomology and compact arithmetic duality

This layer puts continuous cochains with compact and cofinite coefficients into the derived
category and proves Nekovář's derived local and global duality. It first develops the coefficient
algebra this needs: perfect amplitude and the Tor spectral sequence for the module-derived tensor
product supplied by DerivedModuleAlgebra §0.2, the comparison of its §1.1 derived limits with
the DerivedModuleAlgebra §1.T.1 tower API. Using Matlis duality from DerivedModuleAlgebra
§1.M.1, it proves Grothendieck local duality for a normalised dualizing complex, the spectral
sequence of a composite of derived functors, flatness of continuous functions into an adic ring, and the Hilbert–Samuel Euler
function. It then defines admissible and ind-admissible coefficients, the derived continuous
cochain functor with its finiteness and base-change properties, the compact Hochschild–Serre
spectral sequence, the local duality morphisms with their invariant trivialisation, compactly
supported cochains with their cup products and Euler–Poincaré characteristic, and derived
Poitou–Tate duality, including the case `p = 2` with real places, where compactly supported
cohomology lives in negative degrees as well. It ends with the lattice and rational Poitou–Tate
sequences and local duality for abelian varieties and isogenies, which use these derived
statements.

### D7.1 The coefficient algebra

**Derived tensor, perfect amplitude and Tor.** Let `R → R′` be a homomorphism of commutative
rings. The left-derived tensor functor `R′ ⊗^L_R − : D(R) → D(R′)` between Mathlib's derived
categories of modules is the derived extension of scalars supplied by DerivedModuleAlgebra
§0.2, using `DerivedDeRham.derivedTensor` and its K-flat models. Use its exactness and the
`derivedTensor_affine` comparison supplied by EnhancedDerivedSheaves §E1.8.DMA.1 with
SchemeAndStackFoundations §2.18. Call
`C ∈ D(R)` perfect with amplitude in `[a, b]` if it is represented by a bounded complex of finite
projective `R`-modules in degrees `[a, b]`; then `R′ ⊗^L_R C` is represented by the degreewise
tensor product, again in degrees `[a, b]`. For such `C` there is a convergent spectral sequence

```text
E₂^{−i,j} = Tor_i^R(R′, H^j(C)) ⇒ H^{j−i}(R′ ⊗^L_R C),
```

whose edge maps `R′ ⊗_R H^j(C) → H^j(R′ ⊗^L_R C)` are the canonical coefficient-change maps. These
are isomorphisms when `Tor_i^R(R′, H^j(C)) = 0` for all `i > 0` and all `j`, in particular when `R′`
is flat over `R`, and not in general. Convergence is asserted for bounded perfect `C`, not for
arbitrary unbounded tensor products.

*Proof sketch.* The ordinary Tor is Mathlib's `CategoryTheory.Tor`; compare it with the cohomology
of tensor products with resolutions. Use the supplier's model independence,
`derivedTensor_flatModel` and `derivedTensor_triangulated` on Mathlib's `DerivedCategory`. For
a bounded complex of finite projective modules the degreewise tensor product computes the derived
one. Filtering the total complex of a resolution (Mathlib `HomologicalComplex₂.total`) gives
`E₂^{−i,j} = Tor_i(R′, H^j(C))`; only finitely many `j` occur, so each total degree has a finite
filtration and the spectral sequence converges although `i` is unbounded. The spectral sequence is
that of Mathlib's integer-indexed spectral objects, restricted to this bounded strip. ([Nekovář,
*Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §1.2, pp. 33–40; §2.1, p.
51; §4.2, pp. 97–100; [Pottharst, *Analytic families of finite-slope Selmer
groups*](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), §1, Theorem 1.1, Lemma 1.3 and Theorem
1.4, pp. 1574–1578; [Stacks Project](https://stacks.math.columbia.edu/tag/064M),
More on Algebra, Definition 15.60.13, tag 064M, with Lemma 15.60.12, tag 064L.) *Needs:*
DerivedModuleAlgebra §0.2 *Derived tensor products on module derived categories*
(`DerivedDeRham.derivedTensor`, derived extension of scalars, `derivedTensor_flatModel`,
`derivedTensor_triangulated`); EnhancedDerivedSheaves §E1.8.DMA.1
(`derivedTensor_affine`, the comparison through SchemeAndStackFoundations §2.18
`DQCoh.affineEquiv`); Mathlib
`DerivedCategory`; Mathlib `HomologicalComplex₂.total`; Mathlib `CategoryTheory.Tor`; Mathlib
`HomotopyCategory.spectralObjectMappingCone`; Mathlib
`CategoryTheory.Abelian.SpectralObject.spectralSequence`.

**Checks.**

- For `R′ = R`, `R ⊗^L_R C ≅ C` and the spectral sequence is concentrated in the column `i = 0`.
- For `R′` flat over `R`, `H^j(R′ ⊗^L_R C) = R′ ⊗_R H^j(C)`: the edge maps are isomorphisms.
- For `R = ℤ`, `R′ = ℤ/2` and `C = ℤ/2` in degree `0` (perfect, with amplitude `[−1, 0]`),
  `Tor₁^ℤ(ℤ/2, ℤ/2) = ℤ/2` gives `H^{−1}(ℤ/2 ⊗^L_ℤ ℤ/2) = ℤ/2`, which the underived tensor product
  misses.

**Residual criterion for perfect amplitude.** Let `(R, 𝔪, k)` be a Noetherian local ring,
`a ≤ b` integers and `C ∈ D^b_fg(R)`, meaning bounded cohomology with finitely generated
cohomology modules. Then `C` is represented by finite free modules in degrees `[a, b]` if and
only if `H^i(k ⊗^L_R C) = 0` for every `i` outside `[a, b]`. This target includes
constructing a bounded-above finite free resolution of every such `C`.

*Proof sketch.* Construct a bounded-above finite free resolution of `C`. Over the local ring,
split off contractible summands with unit differential entries to obtain a minimal resolution.
Its reduction modulo `𝔪` has zero differentials; residual vanishing and Nakayama remove all
terms outside the interval. The forward implication is degreewise tensoring. ([Stacks
Project](https://stacks.math.columbia.edu/tag/068V), More on Algebra, Lemma 15.79.2, Tag 068V;
[Lemma 15.66.5](https://stacks.math.columbia.edu/tag/064U), Tag 064U.) *Needs:* *Derived tensor,
perfect amplitude and Tor*; Mathlib `DerivedCategory`; Mathlib's Nakayama lemma.

**Checks.**

- For `C = R[0]`, the residual complex is `k[0]`, detecting amplitude `[0, 0]`.
- For `R = ℤ_p`, `C = ℤ/p[0]`, residual cohomology occurs in degrees `−1` and `0`;
  the correct perfect interval is `[−1, 0]`, not `[0, 0]`.
- For `R = k[ε]/(ε²)`, `C = k[0]`, a minimal resolution has differential multiplication
  by `ε` indefinitely; residual cohomology survives in every nonpositive degree, so `C` is not perfect.

**Module-derived limits and the explicit tower API.** Let `R` be a commutative ring and `(K_n)`
an `ℕ`-indexed tower of cochain complexes of `R`-modules, with `R`-linear transitions. Use
DerivedModuleAlgebra §1.1's `DerivedDeRham.derivedLimit`, not a separate module-derived limit.
For each integer `j`, let `A_j : CompactCoefficients.Tower` be the underlying abelian-group tower
of `H^j(K_n)`. The comparison `CompactCoefficients.moduleDerivedLimit_compare` gives natural
additive isomorphisms from the underlying groups of the module `lim H^j(K_n)` and
`lim¹ H^j(K_n)` to `A_j.lim` and `A_j.limOne`, respectively. They commute with maps of towers,
the six-term connecting map, and every map in `derivedLimit_milnor`, identifying it with

```text
0 → A_{j−1}.limOne → H^j(derivedLimit K) → A_j.lim → 0.
```

For degreewise-surjective transitions, `derivedLimit_surjective` identifies the middle term with
`H^j(lim K_n)` and the whole sequence with DerivedModuleAlgebra §1.T.1's *The Milnor sequence for towers of complexes*.
The module `lim` and `lim¹` use the kernel and cokernel of the same `R`-linear shift; their
underlying additive carriers are `Tower.lim` and `Tower.limOne`, with the induced `R`-action.

*Proof sketch.* Forgetting scalars preserves products, kernels, cokernels and the shift map.
Its kernel/cokernel identifications give the comparison, and naturality of the snake lemma gives
compatibility with the connecting map. Apply the early Milnor proof to a degreewise-surjective
replacement from DerivedModuleAlgebra §1.1; its natural long exact sequence identifies all the Milnor maps. ([Stacks
Project](https://stacks.math.columbia.edu/tag/091D), More on Algebra, Lemmas 15.89.1, 15.89.3–15.89.4,
tags 091D, 0CQD, 0CQE; Lemmas 15.88.1, 15.88.9–15.88.10, tags 07KW, 07KX, 07KY.) *Needs:*
DerivedModuleAlgebra §1.T.1 *`lim` and `lim¹` of a tower*, *The six-term sequence of `lim` and `lim¹`* and *The Milnor sequence
for towers of complexes*; DerivedModuleAlgebra §1.1 `DerivedDeRham.derivedLimit`,
`derivedLimit_surjective`, `derivedLimit_milnor`.

**Checks.**

- For the constant module tower `M[0]`, the comparison is the diagonal map on `lim`, `lim¹ = 0`,
  and the Milnor projection in degree zero is the identity of `M`.
- Over `ℤ`, for `K_n = [ℤ → ℤ/p^{n+1}]` in degrees `0, 1`, the comparison sends the Milnor
  injection `lim¹ p^{n+1}ℤ → H¹([ℤ → ℤ_p])` to the explicit `ℤ_p/ℤ` identification in DerivedModuleAlgebra §1.T.1.
- For `K_n = ℤ[0]` with transition multiplication by a prime `p`, the comparison gives
  `H⁰(derivedLimit K) = 0` and `H¹(derivedLimit K) = (mulTower p).limOne ≅ ℤ_p/ℤ ≠ 0`;
  this tower has no surjective transitions, so its ordinary limit does not compute its derived limit.

Supplied by DerivedModuleAlgebra §1.M.1: *Matlis duality for arithmetic coefficients*,
including the contragredient action, evaluation biduality and the finite-type/cofinite-type
comparison on complexes. Its comparison with a normalised dualizing complex and local
cohomology is constructed by the following target.

**Grothendieck local duality for a complete Noetherian local ring.** Let `(R, 𝔪, k)` be a complete
Noetherian local ring of dimension `d`, `E = E_R(k)` an injective hull of the residue field,
`D = Hom_R(−, E)` the Matlis dual and `ω` a normalised dualizing complex of `R`
(SchemeAndStackFoundations Layer 2, §2.21 *Dualising complexes*, `NormalizedDualizing R ω`:
`RHom_R(k, ω) ≅ k[0]`). Prove `localDuality`: for every `K ∈ D^b_{fg}(R)` there is a natural
isomorphism `RHom_R(K, ω) ≅ D(RΓ_𝔪(K))` in `D(R)`, so that `Extⁱ_R(K, ω) ≅ D(H^{−i}_𝔪(K))`. Its
first step, `RΓ_𝔪(ω) ≅ E[0]` (that is, `H^i_𝔪(ω) = E` for `i = 0` and `0` otherwise), is part of
the target: it is proved from the colimit description of local cohomology and is not a restatement
of the normalisation `RHom_R(k, ω) ≅ k[0]`. The duality diagram of Layer D7 uses Nekovář's
normalisation `ω• = ω[−d]`, for which `H^i_𝔪(ω•) = E` exactly when `i = d`. The isomorphism is
compatible with the biduality
maps `K → RHom(RHom(K, ω), ω)` and `M → D(D(M))`, and it is the comparison
`𝒟 = RHom_R(−, ω•) ≅ D ∘ Φ`, with `Φ = RΓ_𝔪(−)[d]`, that the derived local and global duality
theorems use (Stacks Project, Dualizing Complexes, Theorem 47.18.3, Tag 0A84, and §47.16–47.17 for
normalised dualizing complexes over local rings; Nekovář, *Selmer complexes*, §§2.5–2.8, pp. 54–61).

*Proof sketch.* The case `K = R` does not suffice: triangles, shifts and summands generated by `R`
give only `Perf(R)`, a proper subcategory of `D^b_{fg}(R)` when `R` is not regular (Check). Three
steps are used instead. (1) `RΓ_𝔪(ω) ≅ E[0]`: by `localCohomology_colimit_ext_comparison`,
`RΓ_𝔪(ω)` is the homotopy colimit of the `RHom_R(R/𝔪ⁿ, ω)`; induction on length from the
normalisation gives isomorphisms `RHom_R(N, ω) ≅ Hom_R(N, E)[0]` functorial in modules `N` of finite
length, and `E` is the union of its submodules `E[𝔪ⁿ]` (Stacks, Lemmas 47.16.4 and 47.18.1, Tags 0A7Q
and 0A82). (2) For every `K ∈ D(R)`, `RΓ_𝔪(K) ≅ C ⊗^L_R K` for the extended Čech complex `C` of a
finite set of generators of `𝔪`, and `RΓ_𝔪` is right adjoint to the inclusion of the complexes with
`𝔪`-power torsion cohomology (Stacks, Lemmas 47.9.1 and 47.10.1, Tags 0A6R and 0955). Hence
`RHom_R(RΓ_𝔪(K), E[0]) ≅ RHom_R(RΓ_𝔪(K), RΓ_𝔪(ω)) ≅ RHom_R(RΓ_𝔪(K), ω) ≅ RHom_R(K, RHom_R(C, ω))`,
and `RHom_R(C, −)` is the derived completion `Λ_𝔪` (`DerivedDeRham.derivedCompletion`), so
`D(RΓ_𝔪(K)) ≅ RHom_R(K, Λ_𝔪 ω)`; this is the comparison with derived completion of Stacks
Theorem 47.18.3 (Tag 0A84, with More on Algebra, Lemma 15.93.13, Tag 0A6E). (3) The completion is
removed because `R` is complete: the cohomology modules of `ω` are finite, so `Λ_𝔪 ω` has as
cohomology their `𝔪`-adic completions (DerivedModuleAlgebra §1.5; Stacks, More on Algebra, Lemma 15.96.4, Tag 0A06), which
are the modules themselves over the complete ring `R` (Stacks, Algebra, Lemma 10.97.1, Tag 00MA);
thus the unit `ω → Λ_𝔪 ω` is an isomorphism and `RHom_R(K, ω) ≅ D(RΓ_𝔪(K))`. The isomorphism is the
adjoint of the evaluation `RΓ_𝔪(K) ⊗^L_R RHom_R(K, ω) → RΓ_𝔪(ω) ≅ E[0]`; restricting to
`K ∈ D^b_{fg}(R)` gives the statement, and the biduality compatibility follows from Matlis biduality
for the finite and Artinian cohomology modules. *Needs:* SchemeAndStackFoundations Layer 2 (§2.21
*Dualising complexes*: `DualizingComplex`, `NormalizedDualizing`; §2.7 *Cohomology with supports and
local cohomology*: `localCohomology_colimit_ext_comparison`; §2.18: `derivedTensor` and `derivedHom`
of modules); DerivedModuleAlgebra Layer 1 (§1.3 *The derived completion reflector*:
`DerivedDeRham.derivedCompletion`; §1.5 *When ordinary quotient towers compute completion*);
*Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1); Mathlib `localCohomology`.

**Checks.**

- For `R = k` a field, `d = 0`, `ω = k`, `RΓ_𝔪 = id` and `E = k`: the statement is
  `Hom_k(K, k) ≅ Hom_k(K, k)`, linear duality.
- For `R = ℤ_p`, `d = 1`, `ω = ℤ_p[1]`, `E = ℚ_p/ℤ_p`, and `K = ℤ_p`: `H¹_𝔪(ℤ_p) = ℚ_p/ℤ_p` and
  `H⁰_𝔪(ℤ_p) = 0`, and the two sides agree; dropping the shift in `ω` puts the answer in the wrong
  degree.
- For `K = ℤ/p` over `ℤ_p`: `Ext¹(ℤ/p, ℤ_p) = ℤ/p`, matching `D(H⁰_𝔪(ℤ/p)) = D(ℤ/p) = ℤ/p`; a
  formula that used ordinary `Hom` would give `0`.
- A non-perfect `K`: for `R = k[ε]/(ε²)` (`d = 0`; `R` is self-injective, so `ω = R` and `E = R`)
  and `K = k`, which has infinite projective dimension and is not in the thick subcategory generated
  by `R`, `Extⁱ_R(k, R)` is the socle `εR ≅ k` for `i = 0` and `0` for `i > 0`, matching
  `D(H⁰_𝔪(k)) = Hom_R(k, R) = k`; the statement for `K = R` alone does not reach this `K`.

**Derived composite spectral sequence.** Let `F : 𝒜 → ℬ` and `H : ℬ → 𝒞` be additive left-exact
functors between abelian categories, where `𝒜` and `ℬ` have enough injectives, and suppose that `F`
sends injective objects to `H`-acyclic objects. Then for every `X ∈ 𝒜` there is a natural
convergent first-quadrant spectral sequence

```text
E₂^{a,b} = R^aH(R^bF(X)) ⇒ R^{a+b}(H ∘ F)(X),
```

with a finite filtration in each total degree, whose edge maps are the canonical maps
`R^aH(F(X)) → R^a(H ∘ F)(X)` and `R^b(H ∘ F)(X) → H(R^bF(X))`. In *Relative compact
Hochschild–Serre* it is applied with `𝒜` the ind-admissible coefficients and `F` the relative
invariants, and the acyclicity hypothesis is verified there.

*Proof sketch.* Resolve `X` injectively, form a Cartan–Eilenberg resolution of `F` applied to that
resolution and apply `H`, obtaining a first-quadrant double complex. The acyclicity hypothesis
identifies one of its filtrations with `R(H ∘ F)(X)`; the other gives the displayed page. Use the
double-complex spectral sequence and identify the edge maps.
([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §3.6.3–3.6.5,
pp. 92–93.) *Needs:* *The spectral sequence of a first-quadrant double complex* (DerivedModuleAlgebra §S.1);
Mathlib `DerivedCategory`.

**Checks.**

- If `F` is exact, `R^bF = 0` for `b > 0` and the spectral sequence collapses to
  `R^aH(F(X)) ≅ R^a(H ∘ F)(X)`.
- If `H` is exact, only the column `a = 0` survives and `H(R^bF(X)) ≅ R^b(H ∘ F)(X)`.
- The acyclicity hypothesis cannot be dropped: for `F = H = Hom_ℤ(ℤ/2, −)` on abelian groups and
  `X = ℚ/ℤ`, the injective `ℚ/ℤ` is sent to `ℤ/2`, which is not `H`-acyclic; `H ∘ F = Hom_ℤ(ℤ/2, −)`
  gives `R¹(H ∘ F)(ℚ/ℤ) = 0`, while the would-be `E₂` page is the single row `b = 0` with
  `E₂^{1,0} = Ext¹(ℤ/2, ℤ/2) = ℤ/2`.

**Adic continuous-map flatness.** Let `R` be a complete Noetherian local ring with finite residue
field, with its `𝔪`-adic topology, `K` a compact Hausdorff totally disconnected space, and `M` a
finitely generated `R`-module with its `𝔪`-adic topology. Then the `R`-module `C(K, R)` of
continuous functions is flat, and the canonical map

```text
C(K, R) ⊗_R M → C(K, M),   f ⊗ m ↦ (x ↦ f(x)m),
```

is an isomorphism. With `K = Gⁿ` for a profinite group `G` this applies to continuous cochains with
finite-type coefficients. For `M` not finitely generated the map need not be surjective (Check);
in particular completed tensor products are not replaced by ordinary ones. Pro-free coefficient
products, with their product topology, go through a perfect resolution instead (*Nakamura cochain
tensor comparisons*).

*Proof sketch.* Write `C(K, R)` as the inverse limit of the modules `C(K, R/𝔪ⁿ)` of locally constant
functions. Each of these is a filtered colimit, over finite clopen partitions of `K`, of finite free
`R/𝔪ⁿ`-modules, and the transition maps of the tower are surjective. Apply Stacks Lemma 15.28.4 to
this tower: by Artin–Rees the Tor towers of finitely presented modules are pro-zero, which gives
flatness and the commutation of the tensor product with finite modules. At every finite clopen
partition, `M ⊗_R C(K, R/𝔪ⁿ) = C(K, M/𝔪ⁿM)`. Completeness of the finite module `M` identifies the
limit with `C(K, M)`; the comparison sends `f ⊗ m` to `x ↦ f(x)m`. ([Nakamura, *Zeta morphisms for
rank two universal deformations*](https://arxiv.org/pdf/2006.13647), Appendix B, Lemma B.29 and
proof, author pp. 104–105; journal pp. 285–286; [Pottharst, *Analytic families of finite-slope
Selmer groups*](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), §1, Lemma 1.3(1),(5),
pp. 1576–1577; [Stacks Project](https://stacks.math.columbia.edu), More on Algebra, §15.28, Lemma
15.28.4, tag 0912; proof uses Lemma 15.28.3.) *Needs:* Mathlib `AdicCompletion`.

**Checks.**

- For `K` a point the map is `R ⊗_R M ≅ M`.
- For `M = R` it is the identity of `C(K, R)`.
- For `R = ℤ_p`, `K = ℤ_p` and `M = ℤ_p[[T]]` with its `(p, T)`-adic topology (not finitely
  generated over `ℤ_p`), the continuous function `x ↦ T^{v_p(x)}`, `0 ↦ 0`, has values spanning
  `ℤ_p[T]`; it is not in the image of `C(K, ℤ_p) ⊗ M`, whose elements take values in finitely
  generated submodules.

**Hilbert–Samuel Euler function.** Let `R` be a commutative Noetherian local ring with maximal
ideal `𝔪` and `M` a finitely generated `R`-module. There is a unique `P_M ∈ ℚ[X]` with
`P_M(n) = length_R(M/𝔪^{n+1}M)` for all sufficiently large `n`; it records cumulative lengths, not
the lengths of the graded pieces `𝔪ⁿM/𝔪^{n+1}M`. For `d` with `ringKrullDim R = d`, put
`e_R(M) = d! · coeff_d(P_M)`, a nonnegative integer. This function is additive on short exact
sequences of finitely generated modules, equals `length_R(M)` when `d = 0`, vanishes when
`dim Supp(M) < d`, and for a domain `R` equals `e_R(R) · rank_R(M)`. It differs from the
multiplicity normalised by `dim Supp(M)`. *Euler–Poincaré characteristic with compact support* uses
it for complete `R` with finite residue field.

The API:

- `ArithmeticDuality.hilbertSamuelPolynomial`: the unique `P_M ∈ ℚ[X]` agreeing with
  `n ↦ length_R(M/𝔪^{n+1}M)` for all large `n`.
- `ArithmeticDuality.hilbertSamuelPolynomial_eventual`: there is `N` with
  `P_M(n) = length_R(M/𝔪^{n+1}M)` for every `n ≥ N`.
- `ArithmeticDuality.hilbertSamuelEuler`: the `ℕ`-valued Euler function at a given `d`, built from
  `d!` times the coefficient of `X^d` in `P_M`.
- `ArithmeticDuality.hilbertSamuelEuler_coefficient`: when `ringKrullDim R = d`, its cast to `ℚ` is
  `d! · coeff_d(P_M)`.
- `ArithmeticDuality.hilbertSamuelEuler_exact`: for an exact sequence `0 → M′ → M → M″ → 0` of
  finitely generated modules and `d = ringKrullDim R`, `e_R(M) = e_R(M′) + e_R(M″)`.

*Proof sketch.* Give the associated graded ring and module their `𝔪`-adic filtrations. Finite
generation of `𝔪` and of `M` makes them a standard graded Noetherian algebra over the residue field
and a finite graded module. Prove the graded Hilbert–Serre theorem by induction on the number of
degree-one generators, splitting off the submodule killed by a power of a chosen generator and using
the exact multiplication sequences. Mathlib's `Polynomial.hilbertPoly` computes the rational Hilbert
series; summing the graded lengths gives the unique eventual cumulative polynomial. For nonzero
`M`, its degree is
`dim Supp(M)`, by a prime filtration and the dimension theorem; `d!` times its coefficient
in ambient degree `d` is a nonnegative integer (and the zero module gives the zero polynomial).
For a submodule in a short exact sequence, Artin–Rees (Mathlib
`Ideal.exists_pow_inf_eq_pow_smul`) shows that the induced filtration is good and changes only
lower-degree coefficients; extracting the common ambient degree `d` gives additivity, including the
finite-length case `d = 0`. For a domain, localise a prime filtration at the zero ideal; only the
full-dimensional factors contribute. A field gives length equal to dimension, and `ℤ_p` gives free
rank and kills finite `p`-power torsion. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §4.6.5, pp. 108–109, especially
4.6.5.3–4.6.5.6; [Stacks Project](https://stacks.math.columbia.edu), Commutative Algebra,
Proposition 10.58.7 (tag 00K1), Proposition 10.59.5 and Lemma 10.59.10 (§10.59, tag 00K4), Lemma
10.62.6 (tag 00L8); Intersection Theory, Definition 43.15.1 (tag 0AZV) and Lemma 43.15.2
(§43.15, tag 0AZU).)
*Needs:* Mathlib `Module.length`; Mathlib `ringKrullDim`; Mathlib `Polynomial.hilbertPoly`; Mathlib
`Ideal.exists_pow_inf_eq_pow_smul`.

**Checks.**

- `euler_multiplicity_field`: for a field `k` (`d = 0`), `e_k(k^r) = r`.
- `euler_multiplicity_zp_free`: over `ℤ_p` (`d = 1`), `e_{ℤ_p}(ℤ_p^r) = r`.
- `euler_multiplicity_zp_torsion`: for a finite `ℤ_p`-module `M` killed by `pⁿ` (`d = 1`),
  `e_{ℤ_p}(M) = 0`, although `length(M) > 0` when `M ≠ 0`.
- For `M = ℤ_p`, `P_M(n) = length(ℤ_p/p^{n+1}) = n + 1` and `e = 1`; the graded lengths
  `length(pⁿℤ_p/p^{n+1}ℤ_p) = 1` are constant and would give `0` at `d = 1`.
- Additivity on `0 → ℤ_p → ℤ_p → ℤ/p → 0` (multiplication by `p`): `1 = 1 + 0`.
- For `R = k[[x, y]]` (`d = 2`), `P_R(n) = (n + 1)(n + 2)/2` and `e_R(R) = 1`; `M = R/(x)` has
  infinite length, `P_M(n) = n + 1` and `e_R(M) = 0`, since `dim Supp(M) = 1 < 2`.

### D7.2 Finite groups and products

**Finite-group universal coefficients and Sylow detection.** Let `G` be a finite group. For an
abelian group `A` with trivial action and every `n ≥ 0` (with `H_{−1} = 0`) there is an exact
sequence

```text
0 → H_n(G, ℤ) ⊗ A → H_n(G, A) → Tor₁(H_{n−1}(G, ℤ), A) → 0,
```

which splits, though not naturally. Since `H_n(G, ℤ)` is finite for `n ≥ 1`,
`H^{n+1}(G, ℤ) ≅ Ext¹(H_n(G, ℤ), ℤ)` for every `n ≥ 0`. For a finite field `k` with trivial action
the evaluation pairing identifies `H^n(G, k)` with the `k`-linear dual of `H_n(G, k)`. For a Sylow
`ℓ`-subgroup `P` and a `G`-module `M`, restriction `H^n(G, M) → H^n(P, M)` is injective on the
`ℓ`-primary part, because `cor ∘ res = [G : P]` is prime to `ℓ`; this cohomological form is Tau
Ceti's `TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` (with the
vanishing criterion `TauCeti.groupCohomology.isZero_of_isZero_sylow`) and is cited. In homology the
maps go the other way, and corestriction `H_n(P, M) → H_n(G, M)` is surjective onto the `ℓ`-primary
part, because `cor ∘ tr = [G : P]` for the transfer `tr`; this homological form is proved here.

*Proof sketch.* The coinvariants of the bar resolution form a complex of free abelian groups
computing `H_•(G, ℤ)`. Its cycles and boundaries are free abelian, being subgroups of free
abelian groups. Their degreewise short exact sequences give the tensor/Tor universal-coefficient
sequence in each fixed degree. Choose splittings of the free-group sequences to obtain its
noncanonical splitting. Finiteness of positive-degree integral homology removes the `Hom(−, ℤ)` term
of the cohomological sequence. Over a field, dualise the finite-dimensional chain complex. Sylow
detection in homology is the index identity for corestriction and transfer; in cohomology it is the
cited Tau Ceti statement. ([Calegari–Dimitrov–Tang, *The unbounded denominators
conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §4.5, pp. 661–663.) *Needs:*
*Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1);
*Restriction and corestriction descent for finite index* (Layer R02.2); ProfiniteCohomology Layer
10; Mathlib `groupCohomology`; Tau Ceti
`TauCeti.groupCohomology.eq_zero_of_pow_nsmul_eq_zero_of_map_sylow_eq_zero` and
`TauCeti.groupCohomology.isZero_of_isZero_sylow`.

**Checks.**

- For `G = C_m`, `H₁(C_m, ℤ) = ℤ/m` and `H²(C_m, ℤ) = Ext¹(ℤ/m, ℤ) = ℤ/m`.
- For `G = C₂` and `A = ℤ/2`, `H₂(C₂, ℤ) = 0` but `H₂(C₂, ℤ/2) = Tor₁(H₁(C₂, ℤ), ℤ/2) = ℤ/2`: the
  Tor term is needed.
- If `char k` does not divide `|G|`, then `H^n(G, k) = 0` for all `n > 0`.
- For `G = C₂`, `H_{2j+1}(G, ℤ) = ℤ/2` for every `j ≥ 0`; the integral bar complex
  is unbounded and not perfect, but the degreewise universal-coefficient sequence still applies.

**Continuous Künneth for products.** Let `k` be a finite field with trivial action. For a finite
family `G₁, …, G_r` of profinite groups, the continuous cohomology of the product is the graded
tensor product, with Koszul signs, of the continuous cohomology algebras:
`H^•(∏ G_i, k) ≅ ⊗_i H^•(G_i, k)`. For an infinite family `(G_i)_{i∈I}`, continuous cochains with
values in `k` factor through a finite product of finite quotients, so `H^n(∏_I G_i, k)` is the
direct sum, over finitely supported multi-indices `(n_i)` with `Σ n_i = n`, of
`⊗_i H^{n_i}(G_i, k)` (factors with `n_i = 0` contribute `k`). In particular, if `H¹(G_i, k) = 0`
for every `i`, then `H²(∏ G_i, k) = ⊕_i H²(G_i, k)`.

*Proof sketch.* Apply Künneth for finite groups over a field to each finite quotient and compare
the signs of cup products. Continuous cochains with discrete coefficients are the filtered colimit
of the cochains of finite quotients (ProfiniteCohomology Layer 4). For an infinite product,
compactness and local constancy force dependence on finitely many coordinates; take the directed
colimit over finite sets of coordinates. ([Calegari–Dimitrov–Tang, *The unbounded denominators
conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §4.5, pp. 661–665.) *Needs:*
*Finite-group universal coefficients and Sylow detection*; *Degeneration of the Hochschild–Serre
spectral sequence* (Layer R02.2); *Derived tensor, perfect amplitude and Tor*; *Matlis duality for
arithmetic coefficients* (DerivedModuleAlgebra §1.M.1); ProfiniteCohomology Layer 4.

**Checks.**

- For `G₁ = G₂ = C₂` over `𝔽₂`, `H²(C₂ × C₂, 𝔽₂)` has dimension `3`: two axis terms and the mixed
  term `H¹ ⊗ H¹`.
- For `G₁ = G₂ = A₅` over `𝔽₂`, `H¹(A₅, 𝔽₂) = 0` and `H²(A₅, 𝔽₂) = 𝔽₂` (Schur multiplier `ℤ/2`),
  so `H²(A₅ × A₅, 𝔽₂) = 𝔽₂²` with no mixed term.
- For `∏_ℕ C₂` over `𝔽₂`, `H¹ = Hom_cts(∏_ℕ C₂, 𝔽₂) = ⊕_ℕ 𝔽₂`, not `∏_ℕ 𝔽₂`.

### D7.3 Admissible coefficients and continuous cochains in the derived category

**Admissible compact and cofinite coefficients.** Let `R` be a complete Noetherian local ring with
finite residue field and `G` a profinite group. An `R[G]`-module `M` is admissible if the image
`A_M` of `R[G]` in `End_R(M)` is a finitely generated `R`-module and `G → A_M` is continuous for
the `𝔪`-adic topology of `A_M`. Let `S(M)` be the set of `G`-stable finitely generated
`R`-submodules on which the action is continuous for their `𝔪`-adic topology. `M` is
ind-admissible if it is the filtered union of `S(M)`, equivalently if every element lies in a
member of `S(M)`. Admissible modules are ind-admissible. For finitely generated `M`, admissibility
is continuity of the action for the `𝔪`-adic topology; for Artinian (cofinite-type) `M` it is
continuity of the action for the discrete topology. An ind-admissible module carries no topology
of its own; only the members of `S(M)` are topologised.

The API:

- `ArithmeticDuality.actionSpan`: the `R`-span `A_M` of the image of `G` in `End_R(M)`, for a
  representation in Mathlib's sense; it equals `Subalgebra.toSubmodule ρ.asAlgebraHom.range`
  by Tau Ceti's `Representation.toSubmodule_range_asAlgebraHom`, using Mathlib's
  `Representation.asAlgebraHom`.
- `ArithmeticDuality.IsAdmissible`: `A_M` is finitely generated and `G → A_M` is continuous for its
  `𝔪`-adic topology.
- `ArithmeticDuality.admissible_of_finite`: a finite discrete module with jointly continuous action
  is admissible.
- `ArithmeticDuality.admissible_of_finiteType`: a finitely generated module with continuous action
  for its `𝔪`-adic topology is admissible.
- `ArithmeticDuality.IsIndAdmissible`: every element lies in a finitely generated stable
  subrepresentation whose action is admissible, equivalently continuous for its `𝔪`-adic topology.
- `ArithmeticDuality.isIndAdmissible_of_isAdmissible`: an admissible module is ind-admissible (the
  cyclic submodule `A_M · m` generated by an element is stable and admissible).

*Proof sketch.* Impose finite generation and `𝔪`-adic continuity on the span of the image of the
representation (Mathlib `TopRep`, Tau Ceti `TauCeti.DiscreteRep`), and work with stable
subrepresentations (Mathlib `Subrepresentation`). Finite sums and images of members of `S(M)` are
again members, so `S(M)` is filtered and its union is the ind-admissible part `j(M)`. Admissible
modules form an abelian full subcategory closed under subobjects, quotients, finite direct sums,
restriction, tensor products and Hom; closure under extensions in all `R[G]`-modules is not part of
the statement. The ind-admissible modules are closed under subquotients, colimits and tensor
products. Their exact inclusion into all `R[G]`-modules has the right adjoint `j`, and applying `j`
to injective embeddings of `R[G]`-modules gives enough injectives (Nekovář 3.3.5). ([Nekovář,
*Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§3.2.1–3.3.6,
pp. 75–81; §4.1, pp. 95–96.) *Needs:* *Adic continuous-map flatness*; *Completed tensor products
and finite reductions* (Layer R02.1); *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1); Mathlib
`TopRep`; Tau Ceti `TauCeti.DiscreteRep`; Mathlib `Subrepresentation`; Mathlib
`Subrepresentation.toRepresentation`.

**Checks.**

- `admissible_trivial`: the image algebra of a trivial representation is the cyclic `R`-span of
  `Id`, including the case of the zero module.
- The zero module has zero image algebra.
- `ArithmeticDuality.continuous_of_isAdmissible`: for a finitely generated module with the
  `𝔪`-adic topology, admissibility implies joint continuity of the action.
- Every trivial representation is ind-admissible, since each element lies
  in its cyclic `R`-submodule, even when the module is not finitely generated.
- `ℤ/pⁿ` with `G` acting through a continuous character `G → (ℤ/pⁿ)^×` is admissible, with finite
  image algebra; `ℤ_p(1)` for `G = G_{ℚ_p}` is admissible with image algebra `ℤ_p`.
- For `G = ∏_ℕ ℤ/2`, a homomorphism `φ : G → 𝔽₂` with non-open kernel, and `M = 𝔽₂²` with `g`
  acting by `(1 φ(g); 0 1)`, the image algebra is finite but `G → A_M` is not continuous: `M` is
  neither admissible nor ind-admissible.

**Continuous cochains in the derived category.** Let `R` and `G` be as in *Admissible compact and
cofinite coefficients*. For `M` finitely generated with continuous `𝔪`-adic action, or of cofinite
type with continuous discrete action, let `C_cts(G, M)` be the continuous inhomogeneous cochain
complex, compared with Mathlib's homogeneous complex for `TopRep` and regarded as a complex of
`R`-modules. For a general ind-admissible `M` define `C_cts(G, M)` as the filtered colimit of
`C_cts(G, N)` over `N ∈ S(M)` (Nekovář 3.4.1); no topology on `M` is used. Bounded below complexes of
coefficients are totalised with the Koszul sign. The functor is exact on ind-admissible
coefficients and, by the hypercohomology spectral sequence, preserves quasi-isomorphisms, so it
defines `RΓ_cts` on bounded below complexes. Let `RΓ_der` be the derived functor of invariants in
the ind-admissible category (not in discrete modules). There is a canonical comparison
`RΓ_der → RΓ_cts`; it is an isomorphism in degrees `0` and `1`, and in all degrees for discrete
coefficients killed by a power of `𝔪` and when `cd_p(G) ≤ 1`; it is not asserted in higher degrees
in general. For an inverse system of discrete coefficients satisfying the Mittag-Leffler condition,
the comparison is instead with Jannsen's continuous cohomology of the system, whose Milnor sequence
keeps the `lim¹` term. Joint continuity of the action is part of every hypothesis.

The API:

- `ArithmeticDuality.algebraicContinuousCochains`: the homogeneous continuous cochain complex of a
  topological representation, as a complex of `R`-modules (the topology forgotten).
- `ArithmeticDuality.algebraicContinuousCohomology`: its cohomology.
- `ArithmeticDuality.algebraicCohomology_compare`: this cohomology agrees with the underlying module
  of Mathlib's continuous cohomology.
- `ArithmeticDuality.continuousCochains_d_squared`: the differential of the complex squares to zero.

*Proof sketch.* Compare homogeneous and inhomogeneous cochains for each finitely generated part,
and take their filtered colimit in modules for general ind-admissible `M`. A quotient of a finitely
generated module has a continuous section and a submodule carries the induced topology; hence the
continuous-cochain functor is exact, and filtered colimits preserve exactness (Nekovář 3.4.2).
Totalise bounded below coefficient complexes; the hypercohomology spectral sequence of the
truncations gives preservation of quasi-isomorphisms (3.5.4–3.5.6). Construct the comparison from
injective resolutions to continuous cochains; Nekovář 3.6.2 gives degrees `0` and `1`, and 4.4.1 and
4.4.6 give the stated all-degree cases. Apply Jannsen 2.2 in the category of inverse systems under
its Mittag-Leffler hypothesis, and use the Milnor sequence to separate its derived-limit statement
from invariants derived in the ind-admissible category. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§3.3–3.6, pp. 79–93; §§4.1 and
4.4, pp. 95–96 and 102–104; [Jannsen, *Continuous étale
cohomology*](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf), §2, Theorem 2.2, pp. 215–216.)
*Needs:* *Admissible compact and cofinite coefficients*; *Comparison with the canonical carrier for
compact coefficients* (PerfectoidTowers §P9.0); *The Milnor sequence for towers of complexes*
(DerivedModuleAlgebra §1.T.1);
*Derived tensor, perfect amplitude and Tor*; *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1);
ProfiniteCohomology Layer 10.

**Checks.**

- `cochains_d_squared`: the differential of the homogeneous continuous cochain complex composes to
  zero.
- `cochains_homogeneous`: in each degree the complex is Mathlib's module of continuous homogeneous
  cochains `G^{n+1} → M`.
- `cochains_zero`: the zero cochain has zero differential, and for `M = 0` the complex is zero.
- `H⁰_cts(G, M) = M^G`, and for trivial `M`, `H¹_cts(G, M) = Hom_cts(G, M)`; for `G` trivial,
  `Hⁱ_cts(G, M) = 0` for `i > 0`.
- For `G = ℤ_p`, `R = ℤ_p` and `M = ⊕_ℕ ℤ_p` with trivial action (ind-admissible, not finitely
  generated), the colimit definition gives `H¹ = ⊕_ℕ Hom_cts(ℤ_p, ℤ_p) ≅ ⊕_ℕ ℤ_p`, whereas
  continuous cochains for the discrete topology on `M` give `H¹ = 0` (a continuous homomorphism from
  `ℤ_p` to a discrete torsion-free group is zero).

**Relative compact Hochschild–Serre.** Let `R` be a complete Noetherian local ring with finite
residue field, `G` a profinite group, `H` a closed normal subgroup and `M` an ind-admissible
`R[G]`-module. Derive the relative invariants `Γ(G, G/H, −) : M ↦ M^H` between the ind-admissible
categories. The Grothendieck spectral sequence

```text
E₂^{a,b} = H_der^a(G/H, R^bΓ(G, G/H, M)) ⇒ H_der^{a+b}(G, M)
```

is natural and convergent, with a finite filtration in each degree; it uses no identification of
`R^bΓ(G, G/H, M)` with continuous cohomology of `H`, and that identification can fail already for
`b = 1` (Check). It is a spectral sequence of continuous cochain cohomology whenever the comparisons
`RΓ_der → RΓ_cts` for `G` and for `G/H` and the identification `R^bΓ(G, G/H, M) ≅ H^b_cts(H, M)` all
hold; for a general closed `H` these are hypotheses. Separately, let `M` be finitely generated and
`H` open normal, and suppose that `H` satisfies (F) for finite-length coefficients. Then the finite
quotient `G/H` gives the usual continuous Hochschild–Serre spectral sequence
`E₂^{a,b} = H^a(G/H, H^b_cts(H, M)) ⇒ H^{a+b}_cts(G, M)`, as the inverse limit of the spectral
sequences with finite coefficients, after checking finite diagonal filtrations and the
Mittag-Leffler condition at each finite level. Cofinite-type and ind-admissible `M` follow by exact
filtered colimits. Without (F) the Milnor `lim¹` terms remain.

*Proof sketch.* Relative invariants have the exact left adjoint inflation and therefore preserve
injectives. Apply *Derived composite spectral sequence* in the ind-admissible categories.
Construct the comparison after restricting injective resolutions as in Nekovář 3.6.4; restriction
to a closed subgroup need not preserve injectives, and the low-degree comparison does not give the
higher ones. For open `H` and finitely generated `M`, all finite-level cohomology of `H` and of the
finite quotient has finite length under (F). Finite filtrations and exact inverse limits identify
the pages and the abutment with continuous cohomology, using Tate's and Jannsen's limit theorems and
the Milnor sequence. General ind-admissible coefficients are filtered unions of finitely generated
ones. The cyclotomic closed-subgroup example of Nekovář 3.6.4 shows that ordinary `H_cts(H, M)`
cannot replace the relative derived invariants. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§3.6.2–3.6.5, pp. 91–93;
§§4.2.1–4.2.2, pp. 96–97; §§4.4.1–4.4.7, pp. 102–104; [Jannsen, *Continuous étale
cohomology*](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf), §2, Theorem 2.2, pp. 215–216.)
*Needs:* *The Hochschild–Serre spectral sequence* (Layer R02.2); *The Milnor sequence for towers of
complexes* (DerivedModuleAlgebra §1.T.1); *Admissible compact and cofinite coefficients*; *Derived tensor, perfect
amplitude and Tor*; *Derived composite spectral sequence*; *Continuous cochains in the derived
category*; *Tate's inverse-limit theorem* (Layer R02.1).

**Checks.**

- For finite coefficients killed by a power of `𝔪` it is *The Hochschild–Serre spectral sequence*
  (Layer R02.2).
- For an open normal subgroup the quotient is finite, and the edge maps are inflation and
  restriction.
- For `K = ℚ_p(μ_p)`, `G = G_K`, `H = G_{K(μ_{p^∞})}` and `T = ℤ_p(1)`, the ordinary `H¹(H, T)` is
  an Iwasawa module that is not ind-admissible as a module over `G/H`; it is not `R¹Γ(G, G/H, T)`.

**Cohomological finiteness and perfect amplitude.** Let `R` be a complete Noetherian local ring with
finite residue field `k` of characteristic `p`, and let `G` be a profinite group satisfying (F): the
cohomology of every finite-length discrete module has finite length, equivalently `Hⁱ(U, k)` is
finite-dimensional for every open subgroup `U` and every `i`. Then for admissible `T` of finite type
the groups `Hⁱ_cts(G, T)` are of finite type, and for admissible `A` of cofinite type the
`Hⁱ_cts(G, A)` are of cofinite type. If moreover `cd_p(G) ≤ e`, these groups vanish for `i > e`,
and for a bounded complex `T` of admissible modules that is perfect over `R` with amplitude in
`[a, b]`, `RΓ_cts(G, T)` is perfect over `R` with amplitude in `[a, b + e]`. Perfectness is a
statement about `R`-modules, not projectivity over `R[G]`; both (F) and the bound on `cd_p(G)` are
used. For a finite extension `K_v` of `ℚ_ℓ` (any `ℓ`), `G_v` satisfies both with `e = 2`; for a
number field `K` and a finite set `S` of places containing the places above `p` and `∞`, `G_{K,S}`
satisfies them with `e = 2` under (P) (`p` odd or `K` without real places). Finiteness of `S` is
needed for (F) and the bound on `cd_p` alone does not give it (Check). When `p = 2` and `K` has a
real place, `cd_2(G_{K,S}) = ∞` and the bound fails (Check).

*Proof sketch.* Reduce finite-type coefficients modulo `𝔪ⁿ` and use finite-length cohomology and
the Mittag-Leffler condition. Use Matlis duality for cofinite-type coefficients. Surjectivity in the
top degree removes the possible `lim¹` in degree `e + 1`. Finite residual amplitude and finite
generation give an object of `D^b_fg(R)`. For flat finite-type coefficients, construct flat
cochain models with their compatible reductions using Pottharst Theorem 1.1 and Lemma 1.3.
For a general coefficient complex perfect in `[a, b]`, prove residual derived base change before
asserting perfectness: resolve `k` by finite free modules in a bounded-above resolution and
use its increasingly long finite truncations. Continuous cochains commute with tensor by finite
free scalar modules with trivial `G`-action; the coefficient amplitude and `cd_p(G) ≤ e` move
the truncation errors below any fixed degree, as in Nekovář 4.2.9. This gives
`k ⊗^L_R RΓ_cts(G, T) ≅ RΓ_cts(G, k ⊗^L_R T)` without assuming that `RΓ_cts(G, T)` is perfect.
The right side has cohomology only in `[a, b + e]`; apply *Residual criterion for perfect amplitude*.
([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §4.2.1–4.2.9,
pp. 97–100; [Pottharst, *Analytic families of finite-slope Selmer
groups*](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), §1, Theorem 1.1 and Corollary 1.2,
pp. 1574–1576; proof pp. 1577–1578.) *Needs:* *Continuous cochains in the derived category*;
*Finiteness of Galois cohomology with restricted ramification* (Layer R02.4); *Cohomological
dimension of `G_{K,S}`* (Layer R02.4); *Derived tensor, perfect amplitude and Tor*;
*Residual criterion for perfect amplitude*; *Matlis duality
for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1).

**Checks.**

- For `G = G_{ℚ_p}` with `p` odd and `T = ℤ_p`: `H⁰ = ℤ_p`, `H¹ ≅ ℤ_p²`, `H² = 0` (dual to
  `μ_{p^∞}(ℚ_p) = 1`) and `Hⁱ = 0` for `i > 2`; `RΓ_cts` is perfect with amplitude in `[0, 2]`.
- For a perfect `T` concentrated in degree `0` the interval is `[0, e]`.
- For `p = 2`, `K = ℚ` and `S = {2, ∞}`, `Hⁱ(G_{ℚ,S}, 𝔽₂) ≅ Hⁱ(ℝ, 𝔽₂) = 𝔽₂` for every `i ≥ 3`, so
  `RΓ_cts(G_{ℚ,S}, ℤ₂)` is not perfect.
- `S` must be finite: for `p` odd, `K = ℚ(μ_p)` and `S` the set of all places, (P) holds and
  `cd_p(G_{K,S}) = cd_p(G_K) = 2`, but `H¹(G_K, μ_p) = K^×/K^{×p}` is infinite (the valuations at
  primes above infinitely many rational primes give independent classes), so (F) fails for the finite
  module `μ_p`.

**Compact Shapiro and projection formulas.** Let `G` be a profinite group, `H` an open subgroup, `R`
as above and `T` a finitely generated `R`-module with continuous `H`-action. Since `G/H` is finite,
the induced and coinduced modules agree and are the finite direct sum `Coind_H^G T = ⊕_{G/H} T`
with the product topology. Evaluation gives a quasi-isomorphism
`C_cts(G, Coind_H^G T) ≃ C_cts(H, T)`, which modulo every `𝔪ⁿ` is Shapiro's lemma for discrete
coefficients. For a finite projective `R`-module `L` with continuous `G`-action, the projection
formula `Coind_H^G(T) ⊗_R L ≅ Coind_H^G(T ⊗_R Res L)` is compatible with cochains, cup products and
local restriction and corestriction. For coefficients `L` that are not finite projective, the
derived tensor product and its Tor spectral sequence are used instead.

*Proof sketch.* Give the coinduced module of ProfiniteCohomology Layer 7 the finite product
topology. Reduce modulo `𝔪ⁿ`, apply Shapiro for discrete coefficients and pass to the limit of
cochains with the Milnor sequence. Write the finite-coset tensor map and check equivariance,
evaluation and compatibility with cup products. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§8.1.1–8.1.6, pp. 189–194;
§§8.2.1–8.2.3, pp. 200–201; [Rubin, *Euler
Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §4, Definition 4.1,
Proposition 4.2 and Remark 4.3, pp. 155–156.) *Needs:* *Continuous cochains into an inverse limit*
(PerfectoidTowers §P9.0); *Completed tensor products and finite reductions* (Layer R02.1);
*Continuous
cochains in the derived category*; ProfiniteCohomology Layer 7.

**Checks.**

- For `H = G` the comparison is the identity.
- Modulo `𝔪ⁿ` the quasi-isomorphism is Shapiro's lemma for `T/𝔪ⁿT` (ProfiniteCohomology Layer 7).
- For `H = 1` in `G = ℤ_p` the coset space is infinite, and `∏_{G/H} T` with the product topology
  is not `C(G, T)` (it contains discontinuous functions); this is why `H` is open.

**Nakamura cochain tensor comparisons.** Let `G = G_{ℚ,Σ}` for a finite set of places `Σ` containing
`p` and `∞`, or `G = G_{ℚ_ℓ}`. Let `A` be a complete Noetherian local `O`-algebra with finite residue
field (`O` the ring of integers of a finite extension of `ℚ_p`), and `ρ` a finite free `A`-module
with continuous `G`-action. For every finitely generated `A`-module `M`, the natural degreewise map
`C_cts(G, ρ) ⊗_A M → C_cts(G, ρ ⊗_A M)` is an isomorphism, and the cochain modules are flat over
`A`. Let `P = ∏_I A` be pro-free, with its product topology, and suppose that `C_cts(G, ρ)` is
perfect, that is, that there is a quasi-isomorphism `N → C_cts(G, ρ)` from a bounded complex `N` of
finite projective `A`-modules. This holds for `G = G_{ℚ_ℓ}`, and for `G = G_{ℚ,Σ}` when `p` is odd,
by *Cohomological finiteness and perfect amplitude*. For `p = 2` real places can make global
cohomology unbounded, so perfectness remains an explicit hypothesis in the global case, as in
Nakamura's Lemma B.31; it can hold for particular `ρ` (Checks). Under it,
`P ⊗ N ⊗ M → C_cts(G, P ⊗ ρ ⊗ M)` is a quasi-isomorphism, with the
tensor topology of the source on the target coefficients. For smooth
admissible `Γ`-modules the comparison passes through the filtered union of their fixed parts, which
are finitely generated over `A`, as in Corollary B.32.

*Proof sketch.* Apply *Adic continuous-map flatness* degreewise with `K = Gⁿ`, which uses that `M`
is finitely generated with its adic topology, and compare with the cochain model of *Continuous
cochains in the derived category*. For pro-free coefficients use the bounded projective model and
pro-free flatness, then compare each specialisation to a finite module. For smooth admissible
modules take exact filtered colimits of their finitely generated fixed parts. ([Nakamura, *Zeta
morphisms for rank two universal deformations*](https://arxiv.org/pdf/2006.13647), Appendix B,
Lemmas B.29–B.31 and Corollary B.32, author pp. 104–106; journal pp. 285–288.) *Needs:* *Continuous
cochains in the derived category*; *Cohomological finiteness and perfect amplitude*; *Completed
tensor products and finite reductions* (Layer R02.1); *Derived tensor, perfect amplitude and Tor*;
*Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1); *Adic continuous-map flatness*;
*Compact Shapiro and projection formulas*.

**Checks.**

- `M = A` gives the identity.
- `M = A/I` gives the reduction `C_cts(G, ρ)/I ≅ C_cts(G, ρ/Iρ)`.
- For `p = 2`, `Σ = {2,∞}` and trivial `ρ = ℤ₂`, restriction gives
  `H^{2j}(G_{ℚ,Σ},ℤ₂) = H^{2j}(ℝ,ℤ₂) = ℤ/2` for every `j ≥ 2`; this complex is unbounded
  and not perfect.
- For the same `G = G_{ℚ,Σ}`, let `F = ℚ(i)`, `H = G_{F,Σ_F}` and
  `ρ = Ind_H^G ℤ₂`. This continuous rank-two finite-free representation has
  `RΓ_cts(G,ρ) ≃ RΓ_cts(H,ℤ₂)` by compact Shapiro, perfect with amplitude in `[0,2]`
  since `F` is totally imaginary. Its real restriction is the regular `ℤ₂[C₂]` module,
  whose Tate cohomology vanishes in every degree.
- For `A = ℤ_p`, `ρ = ℤ_p` with trivial action and `M = ℤ_p[[T]]` (not finitely generated), the
  degree-one map is not surjective: a continuous `f : G → ℤ_p[[T]]` taking the value `Tⁿ` on
  `U_n ∖ U_{n+1}` for a decreasing basis `(U_n)` of open subgroups has values spanning `ℤ_p[T]`.

### D7.4 Derived local duality

**The local invariant map as a quasi-isomorphism.** Let `K` be a global field of characteristic
different from `p`, `v` a nonarchimedean place of `K` (in the global setting, `v ∈ S_f`) with
decomposition group `G_v`, and `R` a complete Noetherian local ring with finite residue field of
characteristic `p`. For `n ≥ 0` local class field theory gives
`inv_v : H²(G_v, ℤ/pⁿ(1)) = Br(K_v)[pⁿ] ≅ ℤ/pⁿ` (5.1.3), and `cd_p(G_v) = 2`; for number fields
these are ClassFieldTheory Layers 5 and 7, and for global function fields (where `p` differs from
the characteristic of `K_v`) they are *Local inputs at places of a global function field* and *The
class formation of a global function field* (Layer R02.3). Hence for every admissible or
ind-admissible `R`-module `A` with trivial action, writing `A(1) = A ⊗_R R(1)`,
`inv_v : H²_cont(G_v, A(1)) ≅ A` and `Hⁱ_cont(G_v, A(1)) = 0` for `i > 2`, and the map
`i_v : A[−2] → τ_{≥2} C_cont(G_v, A(1))` induced by `inv_v^{−1}` is a quasi-isomorphism (5.2.1.1).
For a complex `A•` with trivial action this gives `RΓ_cont(G_v, A•(1)) → A•[−2]` in `D(R)`, and for
a bounded below complex `A•` of injective `R`-modules a homotopy retraction
`r_v : τ^{II}_{≥2} C_cont(G_v, A•(1)) → A•[−2]`, unique up to homotopy (5.2.1.3).

*Proof sketch.* The finite local invariant and `cd_p(G_v) = 2` come from ClassFieldTheory for
completions of number fields and from *Local inputs at places of a global function field* for
completions of global function fields of characteristic different from `p`. Pass from finite
coefficients to the ind-admissible coefficient `A(1)` by the direct and inverse limit comparisons
and Nekovář Proposition 3.2.5. The truncation has cohomology only in degree two, identified with
`A` by the invariant, so it is `A[−2]` in the derived category. For a bounded below injective target
`J[−2]`, represent the inverse morphism by a chain map, unique up to homotopy. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.1.3 and §5.2.1,
(5.2.1.1)–(5.2.1.3), pp. 114–115 (Numdam; PDF 123–124).) *Needs:* *Admissible compact and cofinite
coefficients*; *Continuous cochains into an inverse limit* (PerfectoidTowers §P9.0); *Tate's
inverse-limit
theorem* (Layer R02.1); *Local inputs at places of a global function field* (Layer R02.3); *The
class formation of a global function field* (Layer R02.3); ClassFieldTheory Layers 5 and 7.

**Checks.**

- For `K_v = ℚ_ℓ` and `A = ℚ_p/ℤ_p`, `H²(ℚ_ℓ, μ_{p^∞}) = Br(ℚ_ℓ)[p^∞] ≅ ℚ_p/ℤ_p` by `inv_v`, and
  `H³ = 0`; the local bound `cd_p(G_v) = 2` is used, not a global one.
- At a real place the statement fails: `Hⁱ(Gal(ℂ/ℝ), μ₂) = ℤ/2` for every `i ≥ 1`, so the truncation
  is not `A[−2]`; `v` must be nonarchimedean.
- The chain-level retraction `r_v` needs `A•` injective (K-injective); in the derived category the
  morphism `RΓ_cont(G_v, A•(1)) → A•[−2]` exists for every `A•`.

**The local duality morphisms `α_{J,X}`.** Let `K` be a global field of characteristic `≠ p`, `S` a
finite set of places containing those above `p` and the archimedean ones, `S_f` its nonarchimedean
part, `G_{K,S} = Gal(K_S/K)`, `G_v` (`v ∈ S_f`) the decomposition groups through fixed embeddings,
and `R` a complete Noetherian local ring with finite residue field of characteristic `p`. Assume
(P): if `p = 2`, then `K` has no real place (the case `p = 2` with real places is *Duality when `p = 2` and `K` has real places*). Fix `v ∈ S_f`, a bounded complex `J` of injective `R`-modules and
`r_{v,J}` as in *The local invariant map as a quasi-isomorphism*. For a bounded complex `X•` of
admissible `R[G_v]`-modules put `D_J(X•) = Hom•_R(X•, J)`. The evaluation
`ev₂ : X• ⊗_R D_J(X•)(1) → J(1)`, the cup product and `r_{v,J}` give a morphism of complexes
`C•_cont(G_v, X•) ⊗ C•_cont(G_v, D_J(X•)(1)) → J[−2]`, hence by adjunction

```text
α_{J,X•} : C•_cont(G_v, X•) → D_{J[−2]}(C•_cont(G_v, D_J(X•)(1))),
```

and a morphism `α_{J,X} : RΓ_cont(G_v, X) → D_{J[−2]}(RΓ_cont(G_v, D_J(X)(1)))` in `D^b(R)`
independent of `r_{v,J}`; symmetrically `α′_{J,X}` comes from `ev₁`. They induce pairings
`Hⁱ_cont(G_v, X) ⊗ H^j_cont(G_v, D_J(X)(1)) → H^{i+j−2}(J•)` (5.2.2.1). Two choices of `J` are used
(5.2.3): (A) `J = I[n]` with `I` an injective hull of the residue field, so that `D_J` is Matlis
duality; (B) `J = ω•[n]` for a dualizing complex, so that `D_J` is Grothendieck duality. In both,
`ε_J : X → D_J(D_J(X))` is a quasi-isomorphism for `X` with cohomology of finite type, and in case
(A) also of cofinite type. In case (B), `ω•` is a bounded complex of injective `R`-modules with
finite-type cohomology, normalised by `Hⁱ_𝔪(ω•) = E_R(k)` for `i = dim R` and `0` otherwise; put
`𝒟 = RHom_R(−, ω•)`, `Φ = RΓ_𝔪(−)[dim R]` and `D = Hom_R(−, E_R(k))`. Biduality for `𝒟` and the
comparison `𝒟 ≅ D ∘ Φ` are *Grothendieck local duality for a complete Noetherian local ring*.
`Ext_R(−, ω•)` means hyper-Ext into the complex `ω•`, not Ext into a canonical module.

The API:

- `GaloisCohomology.dualizingHom`: the Hom complex `D_J(X•) = Hom•_R(X•, J)`.
- `GaloisCohomology.localDualityMap`: for complexes `A`, `B`, `J` and a morphism of complexes
  `β : A ⊗ B → J[−2]`, the adjoint `A → Hom•(B, J[−2])`; for the cup product followed by `ev₂` and
  `r_{v,J}` it is `α_{J,X•}`.
- `GaloisCohomology.localDualityMap'`: the adjoint `B → Hom•(A, J[−2])` of the pairing composed
  with the signed swap, on the same Hom complex; for the arithmetic pairing it is `α′_{J,X•}`.
- `GaloisCohomology.localDualityPairing`: the induced pairing
  `Hⁱ(A) × H^j(B) → H^{i+j}(J[−2])`; for the arithmetic pairing it is (5.2.2.1).
- `GaloisCohomology.localDualityMap_indep`: homotopic pairings induce homotopic duality morphisms;
  a homotopy between two choices of `r_{v,J}` identifies the resulting maps.

*Proof sketch.* The adjunction `Hom(A ⊗ B, C) = Hom(A, Hom(B, C))` (Nekovář 1.2.6) turns the pairing
into `α`. Independence of `r_{v,J}`: two retractions into the K-injective target are homotopic.
*Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1; Nekovář 2.3.2) gives `ε_J` in case (A), and
*Grothendieck local duality for a complete Noetherian local ring* (Nekovář 2.6, 2.8.11) in case (B).
([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.2.2–5.2.3,
pp. 115–116 (PDF 124–125).) *Needs:* *The local invariant map as a quasi-isomorphism*; *Continuous
cochains into an inverse limit* (PerfectoidTowers §P9.0); *Matlis duality for arithmetic
coefficients* (DerivedModuleAlgebra §1.M.1);
*Continuous cochains in the derived category*; *Grothendieck local duality for a complete Noetherian
local ring*; ProfiniteCohomology Layer 12; SchemeAndStackFoundations Layer 2, §2.21
(`NormalizedDualizing`).

**Checks.**

- `dualizing_hom_degree`: the degree-`n` term of `Hom•_R(A, J)` is `∏_i Hom_R(A^i, J^{i+n})`.
- `dualizing_zero`: a zero first complex gives the zero duality map.
- `dualizing_infinite_biddual`: the `𝔽₂`-linear bidual map of `⊕_ℕ 𝔽₂` is not surjective.
- For `R = ℤ_p`, `J = ℚ_p/ℤ_p` and `X = ℤ/p`, `D_J(X)(1) = μ_p` and the pairing
  `H⁰(G_v, ℤ/p) × H²(G_v, μ_p) → H²(G_v, μ_p) ≅ ℤ/p` is Tate's cup-product pairing (5.1.4).
- Without the finiteness hypotheses `ε_J` need not be a quasi-isomorphism: for `X = ⊕_ℕ ℤ/p` and
  `J = I`, `D_J(X) = ∏_ℕ ℤ/p` and `X → D_J(D_J(X))` is not surjective; then `α` need not be an
  isomorphism either.

**Derived local Tate duality.** Let `K_v` be the completion at a nonarchimedean place `v` of a
global field of characteristic different from `p`: in characteristic zero any finite extension of
`ℚ_ℓ`, including `ℓ ≠ p`; in positive characteristic the local inputs are *Local inputs at places of
a global function field* (Layer R02.3), as in *The local invariant map as a quasi-isomorphism*. Let
`R` be a complete Noetherian local ring with finite residue field of characteristic `p`, and use the
notation `J`, `ω•`, `𝒟`, `Φ`, `D` of *The local duality morphisms `α_{J,X}`*, with biduality and
`𝒟 ≅ D ∘ Φ` given by *Grothendieck local duality for a complete Noetherian local ring*; `Ext` into
`ω•` is hyper-Ext into that complex. Assume (i) `J = I[n]` and `X ∈ D^b_{R-ft}` or `X ∈ D^b_{R-coft}`
(bounded, with cohomology of finite type, resp. cofinite type) of admissible `R[G_v]`-modules, or
(ii) `J = ω•[n]` and `X ∈ D^b_{R-ft}`. Then `α_{J,X}` and `α′_{J,X}` are isomorphisms in `D^b(R)`
(Proposition 5.2.4), and `α_{J[n],X}` is `α_{J,X}` shifted (Lemma 5.2.5). Consequently, if
`T, T* ∈ D^b_{R-ft}` and `A, A* ∈ D^b_{R-coft}` are related by the duality diagram
(`T* = 𝒟(T)`, `A = Φ(T)`, `A* = D(T)`), then so are `RΓ_cont(G_v, T)`,
`RΓ_cont(G_v, T*(1))[2]`, `RΓ_cont(G_v, A)` and `RΓ_cont(G_v, A*(1))[2]`, and there is a spectral
sequence

```text
E₂^{i,j} = Ext^i_R(H^{2−j}_cont(G_v, T*(1)), ω•) = Ext^i_R(D(H^j_cont(G_v, A)), ω•) ⇒ H^{i+j}_cont(G_v, T)
```

(Theorem 5.2.6). On cohomology, cup product gives `Hⁱ(G_v, T) ≅ D(H^{2−i}(G_v, A*(1)))` and
`H^j(G_v, A*(1)) ≅ D(H^{2−j}(G_v, T))` (5.2.10).

*Proof sketch.* (i): triangles and truncation reduce to a single module, and Lemma 5.2.5 to
`J = I`; for `X = T` of finite type, `α_T` is the limit of the `α_{I,T/𝔪ⁿT}`, which are Tate's local
duality (5.1.4) for finite modules, and the comparison maps `u₁, …, u₈` are quasi-isomorphisms by the
Mittag-Leffler lemmas (Nekovář 4.1.2, 4.2.4); dually for `A` of cofinite type. (ii): reduce to
`J = ω•[d]` and compare with `J = I` through `Φ_{−d}` and the trace, using Nekovář 2.8.12, 1.2.13 and
3.5.8. Theorem 5.2.6: combine the isomorphisms of 5.2.4 with Nekovář 4.3.1 and 2.8.1; the spectral
sequence is 2.8.6 applied to the diagram. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.2.4–5.2.6 and 5.2.10,
pp. 116–121 (PDF 125–130).) *Needs:* *The local duality morphisms `α_{J,X}`*; *The local invariant map
as a quasi-isomorphism*; *The Milnor sequence for towers of complexes* (DerivedModuleAlgebra §1.T.1); *Mittag-Leffler
towers have vanishing `lim¹`* (DerivedModuleAlgebra §1.T.1); *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1);
*Cohomological finiteness and perfect amplitude*; *Derived tensor, perfect amplitude and Tor*;
*Grothendieck local duality for a complete Noetherian local ring*; ClassFieldTheory Layer 5.

**Checks.**

- For `X = M` a finite `ℤ/pⁿ[G_v]`-module, `R = ℤ_p` and `J = ℚ_p/ℤ_p`, the statement on cohomology
  is Tate local duality `Hⁱ(G_v, M) × H^{2−i}(G_v, M^∨(1)) → ℚ_p/ℤ_p` of ClassFieldTheory Layer 5.
- For `R = ℤ_p`, `ω• = ℤ_p` (`H¹_𝔪(ℤ_p) = ℚ_p/ℤ_p`), `K_v = ℚ_p` with `p` odd and `T = ℤ_p`:
  `H¹(ℚ_p, ℤ_p(1)) ≅ ℤ_p²` and `H²(ℚ_p, ℤ_p(1)) ≅ ℤ_p`, and the spectral sequence gives
  `H⁰(ℚ_p, ℤ_p) = ℤ_p`, `H¹(ℚ_p, ℤ_p) ≅ ℤ_p²` and `H²(ℚ_p, ℤ_p) = 0`.

**Functoriality and symmetry of local duality.** Let `K`, `S`, `S_f`, `G_{K,S}`, `G_v` and `R` be as
in *The local duality morphisms `α_{J,X}`*, with (P): if `p = 2`, `K` has no real place (the case
`p = 2` with real places is *Duality when `p = 2` and `K` has real places*). For a morphism
`f : X• → Y•` of bounded complexes of admissible `R[G_v]`-modules: `α_{J,X•} = α′_{J,D_J(X•)(1)} ∘ (ε_J)_*`;
the squares formed by `α` and `α′` with `f_*` and `(D_J(f)(1))_*` commute; and
`D_{J[−2]}(α′_{J,X•}) ∘ ε_{J[−2]}` is homotopic to `α_{J,X•}` (Proposition 5.2.7, Corollary 5.2.8).
In the self-dual case `f : X → D_J(X)(1)`, with `g = D_J(f)(1) ∘ ε_J`, the pairings satisfy
`∪_g = ∪_f ∘ s₁₂`; in particular `g = ±f` gives `∪_f ∘ s₁₂ = ±∪_f` (5.2.9). These are the sign
conventions used throughout the layer.

*Proof sketch.* (i) from Nekovář 1.2.12 and the commutative diagram of cup products and evaluation
maps (1.2.9). (ii) from 1.2.11; (iii) from (1.2.7.1), 3.4.5.4 and 1.2.14, with the involution `𝒯`
homotopic to the identity. 5.2.9 from (1.2.7.1) and a derived version of 1.2.10. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.2.7–5.2.9, pp. 119–121
(PDF 128–130).) *Needs:* *The local duality morphisms `α_{J,X}`*; *Derived local Tate duality*.

**Checks.**

- For `X = 0` or `f = 0` all identities are trivial.
- Let `μ_p ⊂ K_v`, `X = ℤ/p`, `J = ℚ_p/ℤ_p`, and `f : ℤ/p ≅ μ_p = D_J(X)(1)` given by the symmetric
  pairing `(a, b) ↦ ζ^{ab}`, so `g = f`. With `s₁₂(x ⊗ y) = (−1)^{ij} y ⊗ x`, the identity
  `∪_f ∘ s₁₂ = ∪_f` says that `∪_f` is skew-symmetric on `H¹(G_v, ℤ/p) ≅ K_v^×/p`: the relation
  `(a, b)(b, a) = 1` of Hilbert symbols.

### D7.5 Compact support and derived global duality

**Continuous cochains with compact support.** Let `K` be a global field of characteristic `≠ p`, `S`
a finite set of places containing those above `p` and the archimedean ones, `S_f` its
nonarchimedean part, `R` a complete Noetherian local ring with finite residue field of
characteristic `p`, and `X` a bounded complex of ind-admissible `R[G_{K,S}]`-modules. Define the finite-place model of
*Finite arithmetic compact support* (Layer R02.4) by

```text
C_c(G_{K,S}, X) = Cone(res)[−1],   res : C(G_{K,S}, X) → ⊕_{v∈S_f} C(G_v, X),
```

the mapping fibre of the morphism of continuous cochain complexes `res`, with differential
`d(a, b) = (da, −res(a) − db)`. It has its exact triangle, long exact sequence and change-of-embedding
homotopy equivalence. Under (P) (`p` odd or `K` without real places), this represents the
modified arithmetic fibre, since `C_v^mod` is acyclic at every archimedean place. It does not
include ordinary archimedean cochains `C_v^ord`. Under (P), if `X` has cohomology of
finite type, resp. cofinite type, so does `C_c(G_{K,S}, X)`, and it is bounded. When `p = 2` and `K`
has real places, ordinary global cohomology and the finite-place fibre can be unbounded;
boundedness depends on the coefficients. Both are bounded for the induced coefficients in the
Nakamura Check. Dyadic duality uses the construction with Tate cochains at the real places,
*Duality when `p = 2` and `K` has real places*.

The API:

- Mathlib's `CochainComplex.mappingCocone res_{S_f}` and
  `CochainComplex.mappingCocone.triangle`: the compactly supported complex
  `C•_{c,cont}(G_{K,S}, M•)` and its fibre triangle (5.3.1.1), with
  `GaloisCohomology.compactCochains_diff` recording the differential.
- `GaloisCohomology.compactCohomology`: its cohomology `Hⁱ_{c,cont}(G_{K,S}, M•)`.
- `GaloisCohomology.compactCohomology_exact`: the long exact sequence (5.3.1.2).
- `GaloisCohomology.compactMap`: the map of compactly supported cochains induced by a commutative
  square of localisation maps.
- `GaloisCohomology.compactCochains_embedding`: a change of embeddings gives a homotopy
  equivalence of cones.
- `GaloisCohomology.compactCochains_finite`: over the Noetherian ring `R`, if global and local
  cohomology are finitely generated in the relevant degrees, so is the cohomology of the fibre; the
  cofinite-type and amplitude statements use *Cohomological finiteness and perfect amplitude*.
- `GaloisCohomology.compactCochains_diff`: `d(a, a_S) = (da, −res_{S_f}(a) − da_S)`.

*Proof sketch.* The cone of a morphism of complexes is a complex, and the triangle is the shifted
cone triangle. Change of embeddings: the first square commutes up to the homotopy
`h_v = α′*_v ⋆ h_{σ_v}(M•) ⋆ inf` and the second strictly; `Cone(id, (σ_v)_*, h)` is a homotopy
equivalence with inverse `Cone(id, (σ_v^{−1})_*, h′)`, by Nekovář 1.1.7 and a 2-homotopy. Lemma
5.3.2 follows from Nekovář 4.2.7 for the global and local terms and the long exact sequence.
([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.3.1–5.3.2,
pp. 122–123 (PDF 131–132).) *Needs:* *Finite arithmetic compact support* (Layer R02.4); *Admissible
compact and cofinite coefficients*; *Continuous cochains in the derived category*.

**Checks.**

- The signed mapping-fibre differential composes to zero.
- The residue characteristic is essential: for `p = 3`, `R = 𝔽₂`, `K = ℚ`,
  `S = {2, 3, ∞}` and trivial `X = 𝔽₂[0]`, `(P)` holds but
  `Ĥ^i(C₂, 𝔽₂) = 𝔽₂` for every integer `i`; the finite-place fibre omits a nonacyclic real term.
- `GaloisCohomology.compactCohomology_no_local`: a zero local complex recovers the global
  cohomology.
- `GaloisCohomology.compactCohomology_zero_of_injective`: if local `H⁻¹` vanishes and
  localisation on `H⁰` is injective, then `H⁰` of the fibre vanishes.
- For `K = ℚ`, `S = {p, ∞}`, `p` odd and `M = 𝔽_p`: `H⁰_c = H¹_c = H³_c = 0` and `H²_c ≅ 𝔽_p`, so
  `χ_c = 1 = dim 𝔽_p^{G_ℝ}` (Theorem 5.3.6).
- For `p` odd the complete Tate cohomology of `Gal(ℂ/ℝ)` with `p`-primary coefficients vanishes, so
  adding Tate terms at the real places does not change `C_c`; for `p = 2` it can change it.
- For `p = 2`, `K = ℚ`, `S = {2, ∞}` and `M = 𝔽₂`: `Hⁱ(G_{ℚ,S}, 𝔽₂) ≅ Hⁱ(ℝ, 𝔽₂) = 𝔽₂` and
  `Hⁱ(ℚ₂, 𝔽₂) = 0` for `i ≥ 3`, so `Hⁱ_c = 𝔽₂` for every `i ≥ 4`: the finite-place fibre is
  unbounded and does not give Poitou–Tate duality (5.7).
- For the same `K`, `S` and `p = 2`, take `X = Ind_{G_{ℚ(i),S_F}}^{G_{ℚ,S}} ℤ₂[0]`.
  Compact Shapiro and the absence of real places in `ℚ(i)` give perfect global amplitude
  `[0,2]`, as in the Nakamura Check. The finite local terms have amplitude `[0,2]`, so the
  finite-place fibre has amplitude in `[0,3]` and is bounded. The real restriction is the regular
  `ℤ₂[C₂]` module, whose complete Tate cohomology is zero.

**Cup products with compact support.** Let `K`, `S`, `S_f`, `G_{K,S}`, `G_v` and `R` be as in *The
local duality morphisms `α_{J,X}`*, with (P): if `p = 2`, `K` has no real place (the case `p = 2` with
real places is *Duality when `p = 2` and `K` has real places*). For complexes `A•`, `B•` of
ind-admissible `R[G_{K,S}]`-modules there are two cup products into `C•_{c,cont}(A• ⊗ B•)`:

```text
_c∪ : C•_{c,cont}(A•) ⊗ C•_cont(B•) → C•_{c,cont}(A• ⊗ B•),
      (a, a_S) _c∪ b = (a ∪ b, a_S ∪ res_{S_f}(b)),
      d((a, a_S) _c∪ b) = d(a, a_S) _c∪ b + (−1)^{deg(a, a_S)} (a, a_S) _c∪ db        (5.3.3.2)

∪_c : C•_cont(A•) ⊗ C•_{c,cont}(B•) → C•_{c,cont}(A• ⊗ B•),
      a ∪_c (b, b_S) = (a ∪ b, (−1)^{deg a} res_{S_f}(a) ∪ b_S),
      d(a ∪_c (b, b_S)) = (da) ∪_c (b, b_S) + (−1)^{deg a} a ∪_c d(b, b_S)        (5.3.3.3)
```

The involutions `𝒯` extend to compact support and are homotopic to the identity, the product
diagram with `s₁₂` commutes (5.3.3.4), and both products are compatible with `∪` through
`C_c → C` (5.3.3.5). Here the products land in `A• ⊗ B•`; Nekovář's cochain cup product (§3.4.5)
lands in `B• ⊗ A•` and is composed with the signed symmetry of the tensor product before these
formulas and the evaluation maps are compared. These are the sign conventions for compact support
used throughout the layer.

The API:

- `GaloisCohomology.compactCupLeft`: `_c∪ : C_c(A) ⊗ C(B) → C_c(A ⊗ B)`.
- `GaloisCohomology.compactCupRight`: `∪_c : C(A) ⊗ C_c(B) → C_c(A ⊗ B)`.
- `GaloisCohomology.compactCupLeft_leibniz`: the Leibniz rule for `_c∪`.
- `GaloisCohomology.compactCupRight_leibniz`: the Leibniz rule for `∪_c`, with the sign
  `(−1)^{deg a}`.
- `GaloisCohomology.compactCup_forget`: compatibility with `∪` through `C_c → C`.
- `GaloisCohomology.compactCupLeft_coordinates`: the global coordinate is `a ∪ b` and the local
  coordinate is `a_S ∪ res(b)`.
- `GaloisCohomology.compactCupRight_coordinates`: the global coordinate is `a ∪ b` and the local
  coordinate is `(−1)^i res(a) ∪ b_S` for `a` of degree `i`.

*Proof sketch.* The Leibniz rules follow from those of `∪` and the differential
`d(a, a_S) = (da, −res(a) − da_S)`, since `res` is multiplicative on cochains. The sign
`(−1)^{deg a}` in `∪_c` comes from moving `d` past `a`. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §3.4.5, pp. 83–85; §5.3.3,
pp. 123–124 (PDF 132–133).) *Needs:* *Continuous cochains with compact support*;
ProfiniteCohomology Layer 12.

**Checks.**

- `degree_one_sign`: for `deg a = 1`, `a ∪_c (b, b_S) = (a ∪ b, −res(a) ∪ b_S)`.
- `empty_S_f`: for `S_f = ∅`, `C_c = C` and both products are `∪`.
- `no_sign`: without the sign `(−1)^{deg a}`, `∪_c` fails the Leibniz rule for `a` of odd degree.

**The global invariant map on `H³_c`.** Let `K`, `S`, `S_f`, `G_{K,S}`, `G_v` and `R` be as in *The
local duality morphisms `α_{J,X}`*, assume (P) (if `p = 2`, `K` has no real place; the case `p = 2`
with real places is *Duality when `p = 2` and `K` has real places*), and assume `S_f ≠ ∅` (automatic
for number fields, an extra hypothesis for function fields). The cokernel of
`H²(G_{K,S}, ℤ/pⁿ(1)) → ⊕_{v∈S_f} H²(G_v, ℤ/pⁿ(1))` is `ℤ/pⁿ`, via the sum of the local invariants.
The compact-support long exact sequence and `cd_p ≤ 2` therefore give
`H³_c(G_{K,S}, ℤ/pⁿ(1)) ≅ ℤ/pⁿ` and `Hⁱ_c = 0` for `i > 3`. Passing to ind-admissible `A` with
trivial action gives `H³_c(G_{K,S}, A(1)) ≅ A` and `Hⁱ_c(G_{K,S}, A(1)) = 0` for `i > 3`, so the
rowwise good truncation `τ_{≥3} C_c(G_{K,S}, A(1))` is `A[−3]` in the derived category. For a
bounded complex `J` of injectives, totalise these rowwise truncations and represent the inverse of
the invariant isomorphism by a trace map into `J[−3]`, unique up to homotopy. Localisation on `H²`
need not be injective (Check), and the trace is not identified with the cone in (5.4.1.2).

*Proof sketch.* Use the last three terms of finite Poitou–Tate duality for `μ_{pⁿ}`: localisation
followed by the sum of local invariants has cokernel `ℤ/pⁿ`, while the kernel of localisation can
contain `Pic(O_{K,S})/pⁿ`. Combine this with the compact-support long exact sequence and the global
and local bounds on cohomological dimension to get the degree-three trace and the vanishing above
it. Pass to the stated coefficients by limits, take the rowwise good truncation in degree three and
totalise. Represent the inverse morphism into the K-injective complex `J[−3]`; two choices differ
by a homotopy. ([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf),
§5.4.1, pp. 125–126 (PDF 134–135); [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), I, Lemma 4.12, pp. 58–59, Corollary 4.18,
p. 63; Theorem 4.10, pp. 56–57.) *Needs:* *Continuous cochains with compact support*; *The local
invariant map as a quasi-isomorphism*; *Poitou–Tate duality and the nine-term exact sequence*
(Layer R02.4); *The Kummer sequence for S-units* (Layer R02.3); *Prime-to-characteristic
function-field Poitou–Tate duality* (Layer R02.4).

**Checks.**

- For `p = 2`, `K = ℚ(√−21)` (class group `(ℤ/2)²`, the prime above `2` non-principal) and `S` the
  places above `2` and `∞`, `Pic(O_{K,S})/2 ≅ ℤ/2` injects into `H²(G_{K,S}, μ₂)` and vanishes
  locally, so localisation on `H²` is not injective; the trace uses only the cokernel.
- For `A = ℚ_p/ℤ_p`, `H³_c(G_{K,S}, μ_{p^∞}) ≅ ℚ_p/ℤ_p`, and `H⁴_c = 0` because
  `H³(G_{K,S}, μ_{p^∞})` and `H³(G_v, μ_{p^∞})` vanish under (P).
- In the derived category the inverse of the invariant isomorphism exists for every `J`; the
  chain-level trace into `J[−3]` uses that `J` is K-injective.

**Derived Poitou–Tate duality.** Let `K`, `S`, `S_f`, `G_{K,S}` and `R` be as in *The local duality
morphisms `α_{J,X}`*, with `J`, `ω•`, `𝒟`, `Φ`, `D` as there, and biduality and `𝒟 ≅ D ∘ Φ` given by
*Grothendieck local duality for a complete Noetherian local ring*; `Ext` into `ω•` is hyper-Ext
into that complex. Bounded statements assume (P): `p` odd or `K` without real places; for `p = 2`
with real places see *Duality when `p = 2` and `K` has real places*, in the unbounded derived category.
For a global function field, `char K ≠ p`, `S ≠ ∅`, and the finite case is *Prime-to-characteristic
function-field Poitou–Tate duality* (Layer R02.4), not the number-field statement. For
`X ∈ D^b` of admissible `R[G_{K,S}]`-modules, the cup products `_c∪` and `∪_c` with `ev₂`, `ev₁` and
the trace `r_J` of *The global invariant map on `H³_c`* give maps

```text
_cβ_{J,X} : RΓ_cont(G_{K,S}, X) → D_{J[−3]}(RΓ_{c,cont}(G_{K,S}, D_J(X)(1))),
β_{c,J,X} : RΓ_{c,cont}(G_{K,S}, X) → D_{J[−3]}(RΓ_cont(G_{K,S}, D_J(X)(1))),
```

and their primed versions, independent of choices, and pairings
`Hⁱ_{c,cont}(G_{K,S}, X) ⊗ H^j_cont(G_{K,S}, D_J(X)(1)) → H^{i+j−3}(J•)` (5.4.2.1). Under (i)
`J = I[n]` with `X` of finite or cofinite type over `R`, or (ii) `J = ω•[n]` with `X` of finite type,
these maps are isomorphisms (Proposition 5.4.3); they are natural and symmetric as in 5.2.7
(Proposition 5.4.4). If `T, T*, A, A*` are related by the duality diagram, so are
`RΓ_cont(G_{K,S}, T)`, `RΓ_{c,cont}(G_{K,S}, T*(1))[3]`, `RΓ_cont(G_{K,S}, A)` and
`RΓ_{c,cont}(G_{K,S}, A*(1))[3]`, with spectral sequences

```text
E₂^{i,j}  = Ext^i_R(H^{3−j}_{c,cont}(G_{K,S}, T*(1)), ω•) ⇒ H^{i+j}_cont(G_{K,S}, T),
′E₂^{i,j} = Ext^i_R(H^{3−j}_cont(G_{K,S}, T*(1)), ω•)     ⇒ H^{i+j}_{c,cont}(G_{K,S}, T)
```

(Theorem 5.4.5).

*Proof sketch.* As for Proposition 5.2.4, reduce to a finite discrete `ℤ/pⁿ[G_{K,S}]`-module `M`,
where the statement is a variant of Poitou–Tate duality (5.1.6): the non-obvious maps of the
nine-term sequence are the cup products
`∪_c : Hⁱ(G_{K,S}, M) × H^{3−i}_c(G_{K,S}, M*(1)) → H³_c(G_{K,S}, ℤ/pⁿ(1)) ≅ ℤ/pⁿ` and `_c∪`
(Nekovář cites [Ni, Lemma 6.1] and NSW 8.6.13). Proposition 5.4.4 is proved as 5.2.7, with the
diagram of 5.3.3.4 replacing that of 3.4.5.4, and Theorem 5.4.5 as 5.2.6, from Proposition 5.4.3.
([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.4.2–5.4.5,
pp. 126–128 (PDF 135–137).) *Needs:* *The global invariant map on `H³_c`*; *Cup products with compact
support*; *Derived local Tate duality*; *The local duality morphisms `α_{J,X}`*; *Poitou–Tate duality
and the nine-term exact sequence* (Layer R02.4); *Tate's global duality for the S-idele classes*
(Layer R02.4); *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1); *Cohomological finiteness and perfect
amplitude*; *Prime-to-characteristic function-field Poitou–Tate duality* (Layer R02.4);
*Grothendieck local duality for a complete Noetherian local ring*.

**Checks.**

- For `X = M` finite over `ℤ/pⁿ` and `J = ℚ_p/ℤ_p`, `β_c` gives
  `Hⁱ_c(G_{K,S}, M) ≅ H^{3−i}(G_{K,S}, M^∨(1))^∨`, the duality behind *Poitou–Tate duality and the
  nine-term exact sequence* (Layer R02.4).
- For `K = ℚ`, `S = {p, ∞}`, `p` odd and `M = 𝔽_p`: `Hⁱ_c(G_{ℚ,S}, 𝔽_p)` and
  `H^{3−i}(G_{ℚ,S}, μ_p)` both have dimensions `0, 0, 1, 0` for `i = 0, 1, 2, 3`
  (`H¹(G_{ℚ,S}, μ_p) = ℤ[1/p]^×/p`, spanned by `p`).

**Duality after localising the coefficients.** Let `K`, `S`, `S_f`, `G_{K,S}`, `G_v` and `R` be as
in *The local duality morphisms `α_{J,X}`*, with (P): if `p = 2`, `K` has no real place (the case
`p = 2` with real places is *Duality when `p = 2` and `K` has real places*). Let `𝒮 ⊆ R` be a
multiplicative set. Admissible `R_𝒮[G]`-modules and their continuous cochains are defined through
filtered families of finite-type `R`-submodules (Nekovář §§3.7 and 5.6); `R_𝒮` is in general
neither complete nor local, and the adic definition is not applied to it directly. With these
definitions, Nekovář 5.2.1–5.2.2, 5.2.7–5.2.9, 5.4.1–5.4.2 and 5.4.4 hold with `R` replaced by `R_𝒮`.
Let `ω•` be the normalised dualizing complex of *The local duality morphisms `α_{J,X}`* (biduality and
`𝒟 ≅ D ∘ Φ` by *Grothendieck local duality for a complete Noetherian local ring*; `Ext` into `ω•`
is hyper-Ext into that complex). If `J = ω•_{R_𝒮}[n]`, so that `D_J = 𝒟_{R_𝒮,n}`, and the
cohomology of `X` is of finite type over `R_𝒮`, then

```text
α_{J,X} : RΓ_cont(G_v, X) → 𝒟_{R_𝒮,n−2}(RΓ_cont(G_v, 𝒟_{R_𝒮,n}(X)(1)))
```

and `_cβ_{J,X}`, `_cβ′`, `β_c`, `β′_c` are isomorphisms (Proposition 5.6.3).

*Proof sketch.* Dévissage reduces to an admissible `R_𝒮[G_v]`-module `X` of finite type over
`R_𝒮`; then `X = 𝒮^{−1}Y` with `Y` of finite type over `R` (Nekovář 3.7.3), and `α` is the
localisation of `α_{ω[n],Y}` from 5.2.4; similarly with 5.4.3. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §3.7, pp. 93–94; §5.6,
Proposition 5.6.3, p. 130 (PDF 139).) *Needs:* *Derived local Tate duality*; *Derived Poitou–Tate
duality*; *Grothendieck local duality for a complete Noetherian local ring*.

**Checks.**

- For `R = ℤ_p` and `𝒮 = {pⁿ}`, `R_𝒮 = ℚ_p` and `ω•_{ℚ_p} = ℚ_p`; for `V = T[1/p]` with `T` a
  lattice, the local statement on cohomology is
  `Hⁱ(G_v, V) ≅ Hom_{ℚ_p}(H^{2−i}(G_v, V^*(1)), ℚ_p)`, the rational case used for lattice and
  rational Poitou–Tate.

**Local duality over finite and local coefficient fields.** Let `K` be a finite extension of `ℚ_p`
and `κ` one of: a finite field of characteristic `p`, a finite extension of `ℚ_p`, or a local field
of characteristic `p` with finite residue field. Let `V` be a finite-dimensional `κ`-vector space
with continuous `G_K`-action and, when `κ` is a local field, a `G_K`-stable `O_κ`-lattice with its
adic topology. Then `Hⁱ_cts(G_K, V)` is finite-dimensional and vanishes outside `{0, 1, 2}`, the
local Tate pairing `Hⁱ(G_K, V) × H^{2−i}(G_K, V^∨(1)) → κ` is perfect and `κ`-linear, and
`χ(G_K, V) = −[K : ℚ_p] dim_κ V`. The finite-field case is finite local duality; the two
local-field cases follow by limits over lattices and cofinite-type duals and by localisation. Other
complete fields of characteristic `p` are not covered.

*Proof sketch.* For finite `κ` use the local duality pairing and Euler characteristic of
ClassFieldTheory Layer 5. For local `κ`, use reductions of the lattice over the valuation ring and
cofinite-type duals; finiteness is *Cohomological finiteness and perfect amplitude*. Invert the
uniformiser and identify the dual with the `κ`-linear `V^∨(1)`. Transport the invariant and the
Euler characteristic from the finite levels. (Böckle–Juschka, *Equidimensionality of universal
pseudodeformation rings in characteristic p*, §3.4, Theorem 3.4.1 and proof, pp. 20–21;
[Böckle–Iyengar–Paškūnas, *On local Galois deformation rings*](https://arxiv.org/pdf/2110.01638),
§3.3, Lemma 3.17, author p. 18; Paškūnas–Quast, *On local Galois deformation rings: generalised
reductive groups*, §3, Lemma 3.1, equations (13)–(14), published p. 19.) *Needs:* *Derived local
Tate duality*; *Cohomological finiteness and perfect amplitude*; *Duality after localising the
coefficients*; ClassFieldTheory Layer 5.

**Checks.**

- For `K = ℚ_p` with `p` odd and `V = κ = 𝔽_p`: `h⁰ = 1`, `h² = dim H⁰(ℚ_p, μ_p) = 0`, so `h¹ = 2`
  and `χ = −1 = −[K : ℚ_p]`.
- The twist is needed: for `V = 𝔽_p` and `p` odd, `H²(ℚ_p, μ_p) = 𝔽_p` is dual to `H⁰(ℚ_p, 𝔽_p)`,
  whereas pairing with the untwisted dual would involve `H⁰(ℚ_p, μ_p) = 0`.

**Duality when `p = 2` and `K` has real places.** Let `K` be a global field of characteristic `≠ p`, `S`
a finite set of places containing those above `p` and the archimedean ones, `S_f` its
nonarchimedean part, `G_{K,S} = Gal(K_S/K)`, `G_v` the decomposition groups through fixed
embeddings, and `R` a complete Noetherian local ring with finite residue field of characteristic
`p`; assume `p = 2` and that `K` has at least one real place. Replace the local target of `res` by
the sum of the ordinary cochains at the finite places of `S` and the complete Tate cochains at
every real place, and let `Ĉ_c` be the mapping fibre. Ordinary global cohomology can be nonzero in
infinitely many degrees: for finite `M` its groups in degrees `i > 2` are the sums of the real
Tate groups of `M`. The global cochains are not truncated; `Ĉ_c` may have cohomology in
negative degrees. For finite `M` the pairings
`Hⁱ(G_{K,S}, M) × Ĥ_c^{3−i}(G_{K,S}, M^D) → ℚ/ℤ`, with `M^D = Hom(M, E_S)`, are perfect for every
integer `i`, and `Ĥⁱ_c = 0` for `i > 3`. The corresponding derived duality for coefficients of finite
or cofinite type holds in the unbounded derived category. After inverting `2`, the finite-place
fibre `C_c` and Tate-modified fibre `Ĉ_c` agree and the bounded comparison is restored. The fibre
using ordinary cochains at every place retains the cone of the maps `q_v` from the ordinary to the modified local diagram (Conventions).

*Proof sketch.* These are the classical statements with Tate cohomology at the real places (NSW
Chapter VIII), restated by Nekovář; the constructions of 5.3 are repeated with `Ĉ` at the real
places. ([Nekovář, *Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf),
§5.7.1–5.7.6, pp. 130–133, formulas on printed p. 133.) *Needs:* *Continuous cochains with compact
support*; *Derived Poitou–Tate duality*; *Local duality at the archimedean places* (Layer R02.4);
*Poitou–Tate duality and the nine-term exact sequence* (Layer R02.4).

**Checks.**

- `Ĥⁱ(Gal(ℂ/ℝ), ℤ/2) = ℤ/2` for every `i ∈ ℤ`; for `K = ℚ`, `S = {2, ∞}` and `M = ℤ/2`,
  `Ĥⁱ_c(G_{ℚ,S}, ℤ/2) ≅ Ĥ^{i−1}(ℝ, ℤ/2) = ℤ/2` for every `i < 0`, dual to
  `H^{3−i}(G_{ℚ,S}, μ₂) ≅ H^{3−i}(ℝ, μ₂) = ℤ/2`.
- With `ℚ₂`-coefficients the real Tate terms vanish (`Ĥⁱ(ℝ, V) = 0` for a `ℚ₂`-vector space `V`), so
  `Ĉ_c` and the finite-place `C_c` agree after inverting `2`.
- For `M = 0`, all global and compactly supported cohomology groups vanish, including at real
  places.
- For `K = ℚ`, `S = {2,∞}`, `F = ℚ(i)` and `M = Ind_{G_{F,S_F}}^{G_{K,S}} 𝔽₂`, the real
  restriction is the regular `𝔽₂[C₂]` module, with zero Tate cohomology. By Shapiro and
  `cd₂(G_{F,S_F}) = 2`, `Hⁱ(G_{K,S},M) = 0` for `i > 2`, and `Ĉ_c` has no negative cohomology.
- For trivial `V = ℚ₂`, the ordinary archimedean complex has `H⁰ = ℚ₂` at a real place even
  after inverting `2`. It cannot be inserted into the finite-place fibre without its comparison
  term `ℚ₂[0]`.

**Euler–Poincaré characteristic with compact support.** Let `R` be a complete Noetherian local ring
with finite residue field of characteristic `p`, `K` a global field, `S` a finite set of places
containing those above `p`, the infinite places and the ramification, and assume (P): `p` is odd or
`K` has no real places. For a finite discrete `𝔽_p[G_{K,S}]`-module `M`,

```text
Σ_{q=0}^{3} (−1)^q dim_{𝔽_p} H^q_c(G_{K,S}, M) = Σ_{v|∞} dim_{𝔽_p} M^{G_v}.
```

More generally, for a bounded complex `T•` whose terms are finite-type admissible
`R[G_{K,S}]`-modules,
`Σ_i (−1)^i e_R(Hⁱ_c(G_{K,S}, T•)) = Σ_{v|∞} Σ_q (−1)^q e_R((T^q)^{G_v})`, where `e_R` is the
Euler function of *Hilbert–Samuel Euler function*, normalised by `dim R`; the right-hand side uses
the terms `T^q`, so finite-type terms are assumed, not only finite-type cohomology. `e_R` agrees
with length only in dimension zero; finite-length torsion over a positive-dimensional domain
contributes zero. The coefficient ring is commutative; the noncommutative refinement of Nekovář
§5.3.7 is not part of the statement.

*Proof sketch.* For residual finite coefficients combine the finite compact-support long exact
sequence with the global and local Euler characteristic formulas; the remaining terms are the
ordinary invariants at the infinite places. For finite-type terms filter the cochain complexes by
powers of the maximal ideal. The graded spectral sequence and good filtrations give finite graded
modules, and Artin–Rees controls changes of filtration. Use Hilbert–Serre and evaluate the
normalised generating functions at `1`, keeping track of the vanishing of lower-dimensional terms,
as in Nekovář §4.6. Apply additivity of the Euler function to the compact-support triangle and
truncate the bounded complex of terms. Under (P), arithmetic finiteness and cohomological dimension
make the alternating sums finite. ([Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §5.3.5–5.3.7, pp. 124–125
(PDF 133–134).) *Needs:* *Continuous cochains with compact support*; *Tate's global Euler
characteristic formula* (Layer R02.4); *The Euler characteristic quotient is multiplicative* (Layer
R02.4); *Derived tensor, perfect amplitude and Tor*; *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1);
*Hilbert–Samuel Euler function*.

**Checks.**

- For `K = ℚ`, `S = {p, ∞}`, `p` odd and `M = 𝔽_p`, the left side is `0 − 0 + 1 − 0 = 1` and the
  right side is `dim 𝔽_p^{Gal(ℂ/ℝ)} = 1`: the ordinary invariants at the real place appear, not its
  Tate cohomology (which is `0`).
- For `R = ℤ_p` and `T = ℤ/p`, both sides are `0`, while over `R = 𝔽_p` the same module gives `1` on
  each side: the residual dimension formula is a different specialisation.
- For `K` totally imaginary and `T = ℤ_p` over `R = ℤ_p`, the right side is `r₂ = [K : ℚ]/2`.

### D7.6 Lattice coefficients and abelian varieties

**Poitou–Tate for lattices and rational coefficients.** Let `F` be a number field, `S` a finite set
of places containing those above `p`, the infinite places and the ramification, and `T` a finite
free `ℤ_p`-module with continuous `G_{F,S}`-action; put `V = T ⊗ ℚ_p`, `W = V/T` and
`T^D = Hom(T, ℚ_p/ℤ_p)(1)`. The finite Poitou–Tate sequences for `T/pⁿT` pass to the lattice–torsion
duality sequence, by inverse limits of compact groups on the lattice side and direct limits of
discrete groups on the dual side. Every global and local comparison goes through the Milnor
sequence

```text
0 → lim¹ H^{i−1}(T/pⁿ) → Hⁱ_cts(T) → lim Hⁱ(T/pⁿ) → 0,
```

whose `lim¹` term vanishes because the finite levels are finite. Rationalisation then gives the
`ℚ_p`-linear Poitou–Tate sequence and finite-dimensional duality. The local unramified subgroups
and the topologies are carried along by the same limits. When `p = 2` and `F` has a real place, the
sequence uses the complete real-place correction of *Duality when `p = 2` and `K` has real places*;
the bounded rational comparison holds after inverting `p`. Compact and discrete duals are taken by
Pontryagin (Matlis) duality, rational duals by `ℚ_p`-linear duality.

*Proof sketch.* Write the finite nine-term sequences, with transition maps adjoint under the finite
evaluation pairings. Apply the Milnor sequence to each cochain complex and use the exact sequence
`0 → T → V → W → 0`; finiteness of arithmetic cohomology gives the Mittag-Leffler condition for the
relevant towers. Take inverse limits of compact finite exact sequences and exact direct limits of
the discrete duals, treating the local unramified subgroups by the same finite reductions.
Rationalise, using that the images of compact cohomology are bounded, and check the normalisation
by the sum of local invariants. ([Rubin, *Euler
Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Appendix B, §2, Propositions
2.3–2.5, pp. 151–152; §3, pp. 153–154; [Nekovář, *Selmer
complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), §§5.2, 5.4, 5.7, pp. 116–133.)
*Needs:* *Poitou–Tate duality and the nine-term exact sequence* (Layer R02.4); *The Milnor sequence
for towers of complexes* (DerivedModuleAlgebra §1.T.1); *Tate's inverse-limit theorem* (Layer R02.1);
*Rationalisation of lattice cohomology* (Layer R02.1); *The sequence `T → V → W` and the torsion of
`H¹(T)`* (Layer R02.1); *Duality when `p = 2` and `K` has real places*; *Adic continuous-map flatness*.

**Checks.**

- For `F = ℚ`, `S = {p, ∞}`, `p` odd and `T = ℤ_p(1)`: `H¹(G_{ℚ,S}, ℤ_p(1)) = lim ℤ[1/p]^×/pⁿ ≅ ℤ_p`,
  generated by `p`, and `H¹(G_{ℚ,S}, ℚ_p(1))` is one-dimensional; the `lim¹` term vanishes.
- Reduction modulo `pⁿ` is derived, not termwise. Degreewise `C_cts(G, T)/pⁿ = C_cts(G, T/pⁿT)`
  for `G = G_{F,S}` and each `G_v` (*Adic continuous-map flatness*), and the cochain complexes are
  `p`-torsion-free, so `RΓ(T) ⊗^L ℤ/pⁿ ≃ RΓ(T/pⁿT)` for the global, local and compactly supported
  complexes, compatibly with the localisation triangle. On cohomology this gives
  `0 → Hⁱ(T)/pⁿ → Hⁱ(T/pⁿT) → Hⁱ⁺¹(T)[pⁿ] → 0` in each term, and the lattice sequence does not reduce
  termwise to the finite one: for `p` odd, `F = ℚ(μ_p)` and `T = ℤ_p(1)`, `H⁰(G_{F,S}, T) = 0` while
  `H⁰(G_{F,S}, T/pT) = μ_p`, the difference being `H¹(G_{F,S}, T)[p] ≅ μ_p`.
- For `p = 2` and `F = ℚ`, `Ĥⁱ(ℝ, V) = 0` for the `ℚ₂`-vector space `V`, so the rational sequence
  has no real-place correction.

**Abelian-variety Ext on the big étale site.** Let `F` be a field of characteristic `0` with
separable closure `F^s` and absolute Galois group `G_F`, and let `(Sch/F)_ét` be the big étale site
of `Spec F`: Mathlib's `etaleTopology` on schemes over `Spec F`, as in the conventions of
SchemeAndStackFoundations. An abelian variety `A`, its dual `A∨` (AbelianSchemesAndArithmeticModuli
§A2.2) and `G_m` (SchemeAndStackFoundations §2.9, `Gm`) are abelian sheaves on this site through
their functors of points, and `Extⁱ_F(−, −)` is Mathlib's `CategoryTheory.Abelian.Ext` in the
category of abelian sheaves on `(Sch/F)_ét`, which has enough injectives. The small étale site of
`Spec F` does not do: its abelian sheaves are the discrete `G_F`-modules and lose the geometry of
`A` (Check). Then:

- over `F^s`, `Hom(A, G_m) = 0`; `Ext¹_{F^s}(A, G_m) ≅ A∨(F^s)` (Barsotti–Weil: an extension
  `0 → G_m → E → A → 0` goes to the class in `Pic⁰(A_{F^s})` of the `G_m`-torsor `E → A`); and
  `Ext^q_{F^s}(A, G_m) = 0` for `2 ≤ q ≤ 4`;
- restriction to the small étale site is exact and preserves injectives, so
  `Hʳ((Sch/F)_ét, B) ≅ Hʳ(G_F, B(F^s))` for every commutative group scheme `B` of finite type over
  `F`, through `etale_galois_comparison`;
- the edge maps of the spectral sequence `Hᵖ(G_F, Ext^q_{F^s}(A, G_m)) ⇒ Ext^{p+q}_F(A, G_m)` give
  isomorphisms `Hʳ(G_F, A∨(F^s)) ≅ Ext^{r+1}_F(A, G_m)` for `0 ≤ r ≤ 3`, functorial in `A`;
- restriction to the small site followed by `etale_galois_comparison` sends `A` and `G_m` to the
  discrete modules `A(F^s)` and `F^{s×}` and carries the Yoneda composition
  `Ext^{r+1}_F(A, G_m) × Hʲ((Sch/F)_ét, A) → H^{r+j+1}((Sch/F)_ét, G_m)` to the composition of
  `Ext^{r+1}_{G_F}(A(F^s), F^{s×})` with Galois cohomology.

*Proof sketch.* A morphism from the proper connected `A` to the affine `G_m` is constant. The
Barsotti–Weil formula identifies extensions by `G_m` with `G_m`-torsors that are primitive for the
group law, that is with `Pic⁰`; the vanishing of `Ext²`, `Ext³` and `Ext⁴` over `F^s` is Breen's,
valid when `6` is invertible, which characteristic `0` gives. Restriction to the small site is
exact and preserves injectives (Stacks, Étale Cohomology, Lemma 59.99.1, Tag 0758), so it computes
cohomology and is compatible with Yoneda products. Derive `Hom_F(A, −) = (Hom_{F^s}(A, −))^{G_F}`
with *Derived composite spectral sequence* to obtain the spectral sequence, which degenerates in the
stated range. In characteristic `0` every commutative algebraic group is smooth, so the functor of
points from commutative algebraic groups to these sheaves is exact and carries the `Ext` groups,
the isomorphisms of Milne's Lemma I.3.1 and his pairing (I, Proposition 0.16) to those here.
([Milne, *Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), I, §0,
Propositions 0.16–0.17, pp. 11–12; I, §3, Barsotti–Weil formula and Lemma 3.1, pp. 40–41; II, §5, Remark
5.7(b), printed p. 203 (PDF p. 211), for Breen's vanishing and `Ext^r_{U_Et}(A, G_m) = H^{r−1}(U, A^t)`
for `r ≤ 4`; [Stacks Project](https://stacks.math.columbia.edu/tag/0757), Étale Cohomology, §59.99,
Lemma 59.99.1, Tag 0758; [Groechenig–Wyss–Ziegler, *Mirror symmetry for moduli spaces of Higgs
bundles via p-adic integration*](https://arxiv.org/pdf/1707.06417), §3.2, Lemma 3.8 and Remark 3.11,
author pp. 17–18.) *Needs:* AbelianSchemesAndArithmeticModuli Layer A2, §A2.2 (`AbelianScheme.dual`,
the Poincaré bundle); SchemeAndStackFoundations Layer 2, §2.9 (`Gm`) and §2.15
(`etale_galois_comparison`); *Derived composite spectral sequence*; Mathlib `etaleTopology`;
Mathlib `CategoryTheory.Abelian.Ext`; Mathlib `hasExt_of_enoughInjectives`.

**Checks.**

- The small site gives the wrong answer: for `F` algebraically closed, abelian sheaves on the small
  étale site of `Spec F` are abelian groups, and `Ext¹_Ab(A(F), F^×) = 0` because `F^×` is
  divisible, hence injective; on the big site `Ext¹_F(A, G_m) ≅ A∨(F) ≠ 0` for `A ≠ 0`.
- `Hom_F(A, G_m) = 0`, so the identification starts in degree `1`: `Ext¹_F(A, G_m) ≅ A∨(F)`.
- For an elliptic curve `E` over `F^s`, use the supplier's `AbelianScheme.dual_elliptic`,
  `P ↦ O_E((−P) − (O))`. The extension attached to `P` is the `G_m`-torsor of that line
  bundle, trivial exactly when `P = O`; for `P` of order three it differs from
  `O_E((P) − (O))`. Also
  `Ext²_{F^s}(E, G_m) = H¹(F^s, E∨) = 0`.

**Local abelian-variety duality and gerbe evaluation.** Let `F` be a finite extension of `ℚ_ℓ` for a
rational prime `ℓ`, `A` an abelian variety over `F` and `A∨` its dual
(AbelianSchemesAndArithmeticModuli Layer A2, `AbelianScheme.dual`). `Ext` is taken in abelian
sheaves on the big étale site `(Sch/F)_ét`, and the identifications
`H^r(F, A∨) ≅ Ext^{r+1}_F(A, G_m)` for `0 ≤ r ≤ 3` are those of *Abelian-variety Ext on the big
étale site*. Yoneda composition `Ext^{r+1}_F(A, G_m) × H^{1−r}(F, A) → H²(F, G_m) = Br(F)` and the
local invariant give perfect pairings `H^r(F, A) × H^{1−r}(F, A∨) → ℚ/ℤ` for `r = 0, 1`,
continuous for the `ℓ`-adic topology on `A(F)` and the discrete topology on `H¹`: `A(F)` is
profinite, `H¹(F, A)` is torsion and of cofinite type, and `H^r(F, A) = 0` for `r ≥ 2`. A torsor
`t ∈ H¹(F, A∨)` gives `α_t ∈ Ext²_F(A, G_m)`; forgetting its group structure, `α_t` is a
`G_m`-gerbe on `A`, whose class in `H²((Sch/A)_ét, G_m)` (AlgebraicModuliForArithmeticGeometry
§4.20, `gerbeClass`) is the composite of `α_t` with the canonical map `ℤ[A] → A` from the free
abelian sheaf on the sheaf represented by `A`. The exported compatibility is the rational-point
square: for `a ∈ A(F)`, the pullback `a*α_t ∈ Br(F)` of the gerbe along `a : Spec F → A` is the
Yoneda composite of `α_t` with `a : ℤ → A`, so `inv(a*α_t)` is the value at `(a, t)` of the pairing
for `r = 0`. Hence the character of `t` on `A(F)` is `a ↦ inv(a*α_t)`, a nonzero torsor gives a
nontrivial character, and its integral against Haar measure is zero.

*Proof sketch.* The identifications and the comparison of Yoneda composition with Galois
cohomology are *Abelian-variety Ext on the big étale site*. Under them the pairing is Milne's, and
local duality for abelian varieties with its evaluation normalisation is Milne, I, Theorem 3.2 and
Corollary 3.4. For the square: pullback of a class in `H²((Sch/A)_ét, G_m)` along `a` is
precomposition with the map `ℤ = ℤ[Spec F] → ℤ[A]` induced by `a`, whose composite with
`ℤ[A] → A` is `a : ℤ → A`; the gerbe classification commutes with this pullback (§4.20, change of
site). Translation invariance of Haar measure kills the integral of a nontrivial continuous
character. ([Groechenig–Wyss–Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic
integration*](https://arxiv.org/pdf/1707.06417), §3.2, Lemma 3.8, Theorem 3.10 and Remark 3.11,
author pp. 17–18; [Groechenig–Wyss–Ziegler, *Geometric stabilisation via p-adic
integration*](https://arxiv.org/pdf/1810.06739v2), §6.5, opening Tate-duality and torsor-character
discussion, author p. 42; [Milne, *Arithmetic Duality
Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), I, Lemma 3.1, p. 40; Theorem 3.2, p. 41;
Corollary 3.4, p. 43.) *Needs:* *Abelian-variety Ext on the big étale site*; *Derived tensor,
perfect amplitude and Tor*; *Matlis duality for arithmetic coefficients* (DerivedModuleAlgebra §1.M.1); *Derived local Tate
duality*; ClassFieldTheory Layer 5; AbelianSchemesAndArithmeticModuli Layer A2, §A2.2
(`AbelianScheme.dual`); AlgebraicModuliForArithmeticGeometry Layer 4, §4.20 (`gerbeClass`, the
classification of banded gerbes by `H²`); SchemeAndStackFoundations Layer 2, §2.15
(`etale_galois_comparison`: étale cohomology of a field is Galois cohomology).

**Checks.**

- The square needs `α_t` to come from `Ext²`: the class in `H²((Sch/A)_ét, G_m)` pulled back from a
  nonzero `b ∈ Br(F)` along the structure map has `a*β = b` for every `a ∈ A(F)`, a constant and
  not additive function, whereas `a ↦ a*α_t`, the Yoneda composite with `a`, is additive and
  vanishes at the origin.
- For the zero torsor the character is trivial and its integral is the volume of `A(F)`.
- For `t ≠ 0` the character is nonzero, so its integral is `0`, not the volume.
- For an elliptic curve `E/ℚ_ℓ`, `E(ℚ_ℓ) ≅ ℤ_ℓ × (finite)` is profinite and
  `H¹(ℚ_ℓ, E) ≅ ℚ_ℓ/ℤ_ℓ × (finite)` is its continuous dual; the abstract dual `Hom(ℤ_ℓ, ℚ/ℤ)` is far
  larger, so the duality is one of topological groups.

**Self-dual isogenies and their local index.** Let `F` be a nonarchimedean local field of
characteristic zero, so that every isogeny kernel is finite étale (inseparable kernels in positive
characteristic would need fppf cohomology), and `φ : A → B` an isogeny of abelian varieties over
`F`. The local sequence

```text
0 → ker φ(F) → A(F) → B(F) → H¹(F, ker φ) → H¹(F, A) → H¹(F, B) → H²(F, ker φ) → 0
```

is dual to the corresponding sequence for `φ∨ : B∨ → A∨`, with the degree-two kernel term dual to
degree zero. If `ψ : A ≅ B∨` satisfies `ψ∨ ∘ φ = φ∨ ∘ ψ` (an identity of morphisms, not just an
equality of kernel orders) and `deg φ` is prime to the residue characteristic, then
`|B(F)/φA(F)| = |ker φ(F)|`; the last hypothesis is needed (Check).

*Proof sketch.* Form the long exact sequences of the isogeny and of its dual, using the vanishing of
higher local cohomology of abelian varieties. Yoneda composition and adjunction of connecting maps
compare each arrow under local duality. Use `ψ` to identify the two dual sequences; the Euler
characteristic of the finite kernel, of order prime to the residue characteristic, makes the order
of `H¹` the square of that of `H⁰`, which gives the index formula. ([Groechenig–Wyss–Ziegler, *Mirror
symmetry for moduli spaces of Higgs bundles via p-adic integration*](https://arxiv.org/pdf/1707.06417),
§3.2, Construction 3.14, Lemma 3.15 and Proposition 3.16, author pp. 18–19.) *Needs:* *Local
abelian-variety duality and gerbe evaluation*; *The dual `M^D = Hom(M, E_S)`* (Layer R02.4);
ClassFieldTheory Layer 5.

**Checks.**

- For the identity isogeny both groups have order one.
- For `φ = [n]` on an elliptic curve `E/ℚ_ℓ` with `ℓ ∤ n`, `|E(ℚ_ℓ)/nE(ℚ_ℓ)| = |E[n](ℚ_ℓ)|`; for
  `n = ℓ` the left side has an extra factor `ℓ` from `E(ℚ_ℓ) ⊇ ℤ_ℓ`, so the prime-to-residue
  hypothesis is needed.
- Local duality pairs `H⁰(F, ker φ)` with `H²(F, ker φ∨)`, not with `H¹`: for `φ = [2]` on `E` with
  `E[2] ⊆ E(F)`, `H⁰(F, E[2]) ≅ (ℤ/2)²` is dual to `H²(F, E[2]) ≅ (ℤ/2)²`.

### D7.7 Dual local conditions and mapping-fibre duality

Fix `p` prime, a finite extension `Φ/ℚ_p` with ring of integers `O` and `D = Φ/O`.
For an `O`-lattice `T` with continuous Galois action put `V = T ⊗_O Φ`, `W = V/T`,
and `W_M = M⁻¹T/T` for nonzero `M ∈ O`. In Rubin's notation the star already
includes the Tate twist: `T* = Hom_O(T,O(1))`, `V* = T* ⊗_O Φ`,
`W* = V*/T*` and `W*_M = M⁻¹T*/T*`. The coefficient pairings have targets
`Φ`, `D` or `O/MO` as specified below. Sections D7.7.3–D7.7.6 instead write an
untwisted coefficient dual followed by `(1)`, and keep its coefficient ring explicit.

#### D7.7.1 Perfect pairings and dual local conditions

Let `O` be the ring of integers of a finite extension `Φ` of `ℚ_p`, and `D = Φ/O`.
The annihilator `F^⊥` is taken in the category of the pairing:

- For a perfect `Φ`-bilinear pairing `b : X × X′ → Φ` of finite-dimensional spaces, use a
  `Φ`-linear subspace `F : Submodule Φ X`.
- For finite modules paired into `O/MO` (or `ℤ/n`), use submodules over that coefficient ring.
- For a finitely generated compact `O`-module paired perfectly with a cofinitely generated
  discrete `O`-module into `D`, use closed `O`-submodules and continuous `O`-linear maps.
  Submodules of the compact finitely generated module are closed; all submodules on the discrete
  side are closed. Quotients carry the quotient topology.

Applied to the local Tate pairings `H¹(K, A) × H¹(K, A^*) → Y` for `A = V, W_M, T` and
`A^* = V^*, W^*_M, W^*` (Rubin, Theorem 4.1), `F^⊥` is the dual local condition `F^*` of Mazur–Rubin,
Definition 1.6. Arithmetic pairings are the defined maps of R02.4.2 and D7.4, transported as in
D7.7.2, and their perfectness is proved there. The general linear-algebra statements below take
a pairing and its perfectness hypothesis.

In each of these categories, prove `F^⊥⊥ = F`. In the rational case, the annihilator of an arbitrary
`O`-submodule equals that of its `Φ`-linear span, so its algebraic double annihilator is
`span_Φ F`. In the compact/discrete case, the assertion follows from character duality and
closedness. For adjoint maps `π : X → Z` and `ι : Z′ → X′`, meaning
`b_Z(π x, z′) = b(x, ι z′)`, prove `(π F)^⊥ = ι^{−1}(F^⊥)` and, for perfect pairings,
`(π^{−1} G)^⊥ = ι(G^⊥)`. The rational maps and both subspaces are `Φ`-linear; the finite maps are
linear over their coefficient ring; the compact/discrete maps are continuous `O`-linear maps,
whose images in these categories are closed. For finite `X`, prove `#F · #F^⊥ = #X`; for rational
spaces prove `dim_Φ F + dim_Φ F^⊥ = dim_Φ X`. The induced pairing `(X/F) × F^⊥ → Y` is perfect
in the same category, with `F` satisfying its stated linearity and closedness hypotheses.

(Rubin (1999 draft), Chapter I, §4, Theorem 4.1, printed p. 8 (PDF p. 18); Mazur–Rubin (arXiv v1),
§1, Definition 1.6, p. 5 (arXiv v1).)

The finite two-module `ℤ/n` statements differ from Tau Ceti's `FiniteBilinearModule`
(`TauCeti.FiniteBilinearModule.orthogonalComplement_orthogonalComplement` and
`TauCeti.FiniteBilinearModule.IsNondegenerate.card_mul_card_orthogonalComplement`):
that API uses one finite group with a symmetric `ℚ/ℤ`-valued pairing and retains its radical
in general. Here the pairing is perfect between two modules, so no radical term appears.

The named operations and identities are:

- Perfectness of a pairing `b : X × X′ → R` into the base ring is Mathlib's `LinearMap.IsPerfPair`
  (both curried maps bijective); rational statements take `R = Φ` and `F : Submodule Φ X`,
  and the finite prototypes take `R = ℤ/n`. For `Y = Φ/O` or `O/MO` and compact
  or discrete modules, perfectness means that the curried maps are isomorphisms onto the continuous
  character duals `Hom_cont(−, Y)`.
- `orthogonal_orthogonal` — `F^⊥⊥ = F` for perfect pairings of finite modules, of `Φ`-spaces, and of
  finitely generated compact `O`-modules against cofinitely generated discrete ones, with `F`
  a submodule in the category specified above.
- `orthogonal_map_eq_comap` — `(π F)^⊥ = ι^{−1}(F^⊥)` for adjoint `π`, `ι`,
  using Mathlib's `Submodule.orthogonalBilin_map`.
- `orthogonal_comap_eq_map` — `(π^{−1} G)^⊥ = ι(G^⊥)` for adjoint `π`, `ι` and perfect pairings.
- `card_mul_card_orthogonal` — `#F · #F^⊥ = #X` for finite `X`, `b` perfect.
- `quotientPairing_perfect` — For a perfect pairing in the finite, finite-dimensional or
  compact/discrete dual categories above, `F^⊥=F′` induces a perfect pairing `(X/F)×F′→Y`, with the
  rational `F : Submodule Φ X`, and closed `F` and quotient and dual topologies in the
  compact/discrete case.
- `orthogonal` denotes Mathlib's `Submodule.orthogonalBilin` for these bilinear pairings;
  `mem_orthogonal_iff` states membership as vanishing against every element of `F`, and
  `orthogonal_anti` states `F ≤ G ⇒ G^⊥ ≤ F^⊥`. In the compact/discrete character setting use
  the same vanishing definition with continuous characters. Dual arithmetic conditions use the
  defined local pairing, with the order of its arguments fixed as in R02.4.2.

**Checks.**

- For a perfect pairing, `X^⊥ = 0` and `0^⊥ = X′`.
- The standard pairing `ℤ/p × ℤ/p → ℤ/p`: `0^⊥ = ℤ/p` and `(ℤ/p)^⊥ = 0`; the pairing on `(ℤ/p)²` with `F` the
  first axis gives `F^⊥` the second axis.
- `K = ℚ_ℓ` with `ℓ ≠ p` and `ℓ ≢ 1 (mod p)`: `H¹(K, ℤ/p) ≅ ℤ/p` is all unramified, and its orthogonal
  complement in `H¹(K, μ_p) = K^×/K^{×p} ≅ ℤ/p` is 0, which is `H¹_ur(K, μ_p) = 𝒪_K^×/𝒪_K^{×p}`.
- For the zero pairing `F^⊥ = X′` for every `F`, so `F^⊥⊥ = X ≠ F` whenever `F ≠ X`.
- The pairing `ℤ×ℤ→ℤ` given by `(x,y)↦3xy` is nondegenerate, but its curried maps have image `3ℤ` and are
  not bijective. Thus it fails `LinearMap.IsPerfPair`.
- The unique pairing between two zero modules is perfect, including both surjectivity requirements.
- For multiplication `ℚ_p × ℚ_p → ℚ_p` with the `ℤ_p`-submodule `F = ℤ_p`, the annihilator is zero
  because `1 ∈ F`, and its double annihilator is `ℚ_p`. The quotient `ℚ_p/ℤ_p` is nonzero, so it
  cannot pair perfectly with `F^⊥ = 0`. The lattice is closed but is not a `ℚ_p`-linear subspace.

Perfectness means that the curried maps identify each argument with the appropriate algebraic or
continuous character dual of the other. Bilinear nondegeneracy alone is insufficient: the zero
pairing has `F^⊥=X′` for every `F`, and a nonperfect injection need not give the quotient-dual
comparison.

*Needs:* Mathlib `Submodule.orthogonalBilin`; Mathlib `PontryaginDual`; Mathlib
`Submodule.map_le_iff_le_comap`.

**The local-condition menu.** Use the Selmer structure and localisation-kernel carrier of
EllipticCurves Layer 7, with submodules over the coefficient ring when the action is linear.
For a finite place `v`, define `LocalConditions.unramifiedClasses` to be the image of inflation
`H¹(G_v/I_v, M^{I_v}) → H¹(G_v, M)`, equal to the kernel of restriction to `H¹(I_v, M)`.
This definition includes ramified `M`; it agrees with R02.3.1's `unramifiedSubgroup` when inertia
acts trivially. Define `LocalConditions.strict = ⊥` and `LocalConditions.relaxed = ⊤`.
For a set `Q` of places, `LocalConditions.relaxAt Q L` replaces `L_v` by `⊤` at `Q`, and
`LocalConditions.strictAt Q L` replaces it by `⊥`. Prove the pointwise inclusions
`strictAt Q L ≤ L ≤ relaxAt Q L`, monotonicity in `L`, monotonicity of `relaxAt` in `Q`,
antitonicity of `strictAt` in `Q`, idempotence and the corresponding inclusions of Selmer groups.
Finite `Q` preserves the condition of being unramified almost everywhere.
Define the dual family by `L_v^⊥` using the defined local Tate pairing. It interchanges strict
and relaxed, takes `relaxAt Q` to `strictAt Q` on the dual family and conversely, and recovers
the original family after two duals. The Selmer group is the supplier's infimum of comaps;
its membership theorem and monotonicity use these actual submodules, without auxiliary
submodules whose membership characterisation is assumed.

*Proof sketch.* Inflation–restriction gives the kernel description; submodule operations give
the inclusions. Vanishing against `⊥` or `⊤` and perfectness give the duality identities.
(Mazur–Rubin, *Controlling Selmer groups in the higher core rank case*, §1, Definitions 1.1,
1.2 and 1.6; Milne, Chapter I, §0, inflation–restriction.) *Needs:* EllipticCurves Layer 7
*Selmer structures, the Selmer group, and Sha*; ProfiniteCohomology Layer 5;
R02.3.1 localisation and unramified subgroups; R02.4.2 defined local Tate pairings.
The named menu follows the Imperial College London FLT project's Selmer interfaces.

**Checks.**

- With `Q = ∅` both changes return `L`; enlarging `Q` enlarges the relaxed Selmer group and
  shrinks the strict one.
- For trivial `M = ℤ/p` at `v ∤ p`, unramified classes are exactly the unramified characters;
  strict classes are zero and relaxed classes are all of `H¹(G_v, M)`.
- At any finite place, including `v ∣ p`, the kernel of restriction to inertia agrees with
  the inflation image, although its dual need not be the unramified condition on `M^*`.
- The annihilator of `⊥` is `⊤` and that of `⊤` is `⊥`; hence relaxing at `Q` makes the dual
  condition strict there.

#### D7.7.2 Compatibility of the local pairings for `T`, `V`, `W` and `W_M`

Let `K` be a finite extension of `ℚ_ℓ`, `ℝ` or `ℂ` and `T` a `p`-adic representation of `G_K`. The local Tate
pairings of Rubin's Theorem 4.1 are compatible with the coefficient maps: for `c ∈ H¹(K, T)` and
`d ∈ H¹(K, V^*)`, `⟨φ(c), d⟩ = ⟨c, φ^*(d)⟩` in `D`, where `φ : H¹(K, T) → H¹(K, V)` and
`φ^* : H¹(K, V^*) → H¹(K, W^*)`; and for `c ∈ H¹(K, T)`, `d ∈ H¹(K, W^*_M)`,
`⟨π_M(c), d⟩_M = ⟨c, ι_M(d)⟩` in `O/MO ⊆ D`, where `π_M : T ↠ W_M = M^{−1}T/T` and `ι_M : W^*_M ↪ W^*`.

The pairings of Rubin's Theorem 4.1, perfect by the local duality of §R02.4.

Prove this as follows. Each pairing is cup product followed by the invariant map, so the identities
are the naturality of the cup product in the coefficients (ProfiniteCohomology Layer 12) together
with the compatibility of the invariant maps `H²(K, Φ(1)) → Φ`, `H²(K, D(1)) → D` and
`H²(K, O(1)/M) → O/MO` with the maps `O(1)/M ↪ D(1)` and `Φ(1) ↠ D(1)`. For the lattice and rational pairings, the
continuous cochains and limits use PerfectoidTowers §P9.0's cochain comparisons and Layer R02.1's
coefficient theory.

(Rubin (1999 draft), Chapter I, §4, proof of Proposition 4.3, printed p. 9 (PDF p. 19).)

Each identity uses its specified coefficient pairing and the supplier's compatible invariant maps.

**Checks.**

- For zero cohomology classes both coefficient-compatibility identities give zero.
- At finite level `W_M`, the value lies in `O/MO` and its image in `D` agrees with the lattice/discrete
  pairing; changing either coefficient map independently breaks the stated adjoint identity.
- If `φ(c) = 0`, then `c` annihilates every class in the image of `φ*`; this is the kernel/image test for
  the two adjoint maps.

*Needs:* Layer R02.4; §R02.1.2 (*Long exact sequences for continuous cohomology*);
TauCetiRoadmap.ProfiniteCohomology Layer 12.

#### D7.7.3 Local conditions and derived orthogonal complements

Given specified local complexes `C_X,C_Y` with the supplier perfect degree-two cup duality and maps
`U_X^+→C_X`, `U_Y^+→C_Y`, include a chosen nullhomotopy of their cup product as orthogonality data. Put
`U_Y^−=Cone(U_Y^+→C_Y)`. The adjoint `U_X^+→RHom(U_Y^−,J)[−2]` defines `Err_v` as its cone. Derived
complementarity means `Err_v` is acyclic; `H¹`-annihilation alone does not imply it. The arithmetic
instance uses `C_v^mod` on both sides: ordinary cochains at finite places, complete Tate cochains at
real places and zero at complex places. Ordinary archimedean cochains do not supply the required
degree-two duality. At finite places, for complementary finite-free coefficient subcomplexes `X^+,Y^+`
under `X⊗Y→J(1)`, the coefficient adjoint `X/X^+→D_J(Y^+)(1)` gives the vanishing criterion.

Bounded local conditions and coefficient finiteness/cofiniteness satisfying Nekovář 6.2.5; under (P)
modified archimedean complexes are acyclic. At `p=2` with real places use the supplier complete Tate
duality in the unbounded derived category. `J` is the chosen injective or dualizing coefficient
complex.

The construction proceeds as follows. Form the actual cones and the chain-level adjoint using the
nullhomotopy. Define the error cone and its long exact sequence; derive the comparison with ordinary
`H¹` annihilators only under the necessary `H⁰`/`H²` hypotheses. For elementary subcomplexes, use the
supplier derived local duality and the coefficient exact triangle to identify the error with the
cohomology of the coefficient adjoint cone.

(Nekovář, §§6.2.1–6.2.7, pp. 137–140; §6.7, pp. 151–154; §5.7.1–5.7.2, pp. 130–132.)

The named operations and identities are:

- `LocalConditionMorphism` — A morphism `U^+→C` into the explicitly supplied local complex.
- `localMinus` — The cone of `U^+→C`.
- `localDualError` — Cone of the cup-adjoint `U_X^+→D(U_Y^−)[−2]`.
- `derivedComplement_iff` — Derived complementarity iff the error cone is acyclic.
- `localDualError_congr` — Compatible quasi-isomorphisms and nullhomotopies give equivalent error cones.

**Checks.**

- The zero and identity local-condition maps are derived complements under perfect local duality.
- Adding a nonzero degree-zero complex with zero map to `U^+` leaves its `H¹` image unchanged but
  changes the error cone.
- For a zero coefficient pairing on nonzero modules, `H¹` cup annihilation does not produce
  complementary derived local conditions.
- At a real place with `T=𝔽_p` trivial and `p` odd, `C_v^ord` has `H⁰=𝔽_p` and `H²=0`, so it cannot have
  perfect degree-two self-duality; `C_v^mod` is acyclic.

*Needs:* §D7.4 (*Derived local Tate duality*); §R02.4.2 (*Local duality at the archimedean places*);
§D7.5 (*Duality when `p = 2` and `K` has real places*); §D7.7.1 (Perfect pairings and dual local
conditions).

#### D7.7.4 Duality for a global mapping fibre with local conditions

Let `F_X=Fib(C_global(X)⊕⊕U_X,v^+→⊕C_v^mod(X))`, and `F_Y` similarly, with modified localization
`q_v∘res_v`, the arrow `loc−i` and pairings/nullhomotopies on the modified diagram as in §D7.7.3.
Transport the Layer D7 global compact-support duality to a map `F_X→D_J(F_Y)[−3]`. Its error triangle
has third vertex `⊕_v Err_v` computed on that diagram. It is an isomorphism if the local adjoints are
quasi-isomorphisms, and otherwise the error cone is part of the statement. Under (P) the local
target can be replaced by the finite-place sum, retaining any `U_v^+` at archimedean places in the
source. This theorem is parametric in local-condition maps. For an ordinary deformation fibre,
compare its ordinary local diagram with the modified diagram through the maps `q_v` of the Conventions;
retain that archimedean comparison before applying arithmetic duality.

Finite `S`; bounded admissible complexes with the supplier’s finite/cofinite or dualizing coefficient
hypotheses; condition (P): `p` is odd or `F` has no real places. Chain-level orthogonality data, not
just orthogonal `H¹` subspaces. For `p=2` with real places this construction/theorem requires §D7.5
(*Duality when `p = 2` and `K` has real places*).

Prove this as follows. Import the compact-support triangle and its perfect degree-three duality. Use
the local nullhomotopies to define the fibre pairing; use the octahedral axiom on the global and
local duality triangles. Identify the third vertex with the finite direct sum of local adjoint cones
(Nekovář 6.3.4). Take cohomology for the exact error sequence.

(Nekovář, Theorem 6.3.4, pp. 142–143; §5.7.2–5.7.5, pp. 131–133.)

**Checks.**

- Over a field, complementary conditions pair `H^i(F_X)` with `H^(3−i)(F_Y)`, rather than degree `2−i`.
- A nonacyclic `Err_v` is retained even if the `H¹` local conditions annihilate each other.
- For `F=ℚ`, `S={p,∞}`, `T=𝔽_p` trivial and `p` odd, the strict ordinary fibre has an extra `𝔽_p` in `H¹`
  relative to the modified fibre; (P) does not remove it.
- At `p=2` with a real place, use the complete Tate local diagram and the unbounded supplier duality.

*Needs:* §D7.7.3 (Local conditions and derived orthogonal complements); §D7.5 (*Derived Poitou–Tate
duality*); §D7.5 (*Continuous cochains with compact support*).

#### D7.7.5 Strict ordinary and inertia ordinary annihilators

For a perfect Tate-dual pairing `M×M^*(1)` and saturated `G_v`-stable `M^+⊂M`, put `M^−=M/M^+` and
`(M^*(1))^+=ann(M^+)`. The strict ordinary condition is `im H¹(G_v,M^+) = ker(H¹(G_v,M)→H¹(G_v,M^−))`;
its dual is the corresponding strict ordinary condition for the dual coefficient filtration,
whenever derived coefficient complements and their exact cohomology hypotheses hold. The inertia
ordinary condition `ker(H¹(G_v,M)→H¹(I_v,M^−))` contains it, with quotient exactly
`im[H¹(G_v,M)→H¹(G_v,M^−)]∩H¹_ur(G_v,M^−)`. Thus its annihilator is a subcondition of the strict dual,
cut out by pairing with this correction. Equality requires this correction to vanish.

The quotient and dual lattice must be saturated/finite free in the compact case. Perfect local Tate
pairings are imported; no assumed universal equality between strict and inertia ordinary conditions.
In this derived-pairing notation `M^*(1)` is the coefficient-appropriate untwisted linear dual
followed by the Tate twist; for a lattice paired with a discrete module the target is `Φ/O`. Rubin’s
separate star notation already includes its Tate twist.

Prove this as follows. Use the long exact sequence for `0→M^+→M→M^−→0` to identify the strict image
with the kernel. Use inflation–restriction for `I_v` to compute the difference between the two
kernels. Apply §D7.7.3 to complementary coefficients; identify the dual of the larger condition by
orthogonality to the calculated correction.

(Nekovář, §6.7.1–6.7.6, pp. 151–153; §8.9.6–8.9.7, pp. 240–244.)

**Checks.**

- `M^+=M` gives the relaxed condition and strict dual.
- `M^+=0` gives strict zero but inertia unramified; these differ when `H¹_ur(M)≠0`.
- For `M^−` trivial rational at `p`, `H¹_ur(M^−)` has dimension one, so it cannot be dropped.

*Needs:* §D7.7.3 (Local conditions and derived orthogonal complements); §R02.1.2 (*Long exact
sequences for continuous cohomology*); §R02.2.2 (*The five-term sequence and the transgression*).

#### D7.7.6 Nonsingular torsion classes away from p

For `K/ℚ_ℓ` finite with `ℓ≠p` and a finite `O`-torsion `G_K`-module `R`, define `H¹_ns` as the kernel of the
singular map `H¹(K,R)→H¹(I_K,R)^(Fr=1)`. This is `H¹_ur` and the map is surjective, by residue
cohomological dimension one. The cup pairing `H¹_ns(K,R)×H¹_ns(K,R^∨(1))→Φ/O` vanishes. This assertion
is annihilation, not exact complementarity for arbitrary ramified `R`; exactness for unramified finite
modules comes from the supplier theorem.

Finite torsion `R`; Tate dual is `Hom_O(R,Φ/O)(1)`.

Prove this as follows. Apply the inertia Hochschild–Serre edge sequence with vanishing residue `H²`.
Identify nonsingular classes with inflated residue `H¹`. Their cup factors through residue `H²` of the
Tate coefficient, which vanishes. Invoke exact-annihilator theory only with its separate unramified
hypotheses.

(Liu–Tian–Xiao–Zhang–Zhu, Definition 2.2.2 and Lemma 2.2.3, p. 124.)

**Checks.**

- With `R = 0` the nonsingular group and the singular quotient both vanish.
- For an unramified `R = ℤ/p` over `K/ℚ_ℓ`, `ℓ ≠ p`, residue coinvariants give `H¹_ns = ℤ/p`; the singular
  map remains surjective.
- If the residue order is 1 modulo `p`, take `R = ℤ/p` and its dual `μ_p`: both unramified groups can be
  nonzero, but their cup product is zero because it factors through residue `H²`.

*Needs:* §R02.2.1 (*The Hochschild–Serre spectral sequence*); §R02.4.2 (*Unramified classes are
exact annihilators*).

### Examples

- For `R = ℤ_p`, `T = ℤ_p(1)` and `K = ℚ_p`, derived local duality pairs `RΓ(ℚ_p, ℤ_p(1))` with
  `RΓ(ℚ_p, ℚ_p/ℤ_p)[2]`; on `H¹` this is Kummer theory: `H¹(ℚ_p, ℤ_p(1)) = (ℚ_pˣ)^∧` is dual to
  `H¹(ℚ_p, ℚ_p/ℤ_p) = Hom(G_{ℚ_p}, ℚ_p/ℤ_p)` by local reciprocity.
- The mapping fibre of an isomorphism is acyclic: if the localisation map is the identity of a
  complex, every `Hⁱ_c` vanishes; if the local complex is zero, `Hⁱ_c` is the global cohomology.
- At `p = 2` with a real place, `H^{−1}_c` can be nonzero: the modified compactly supported
  cohomology of `ℤ/2` over `ℚ` with `S = {2, ∞}` is the complete Tate cohomology of `Gal(ℂ/ℝ)`,
  shifted by one, in every negative degree.

### Dependencies

- Earlier layers of this roadmap: R02.1, R02.2, R02.3, R02.4.
- PerfectoidTowers: §P9.0 (continuous cochains and their comparison with the canonical carrier).
- SchemeAndStackFoundations: Layer 2, §2.21 *Dualising complexes* (`DualizingComplex`,
  `NormalizedDualizing`); §2.7 *Cohomology with supports and local cohomology*; §2.9 (`Gm`); §2.15
  (`etale_galois_comparison`); §2.18 *Derived categories of quasi-coherent complexes*
  (`derivedTensor`, `derivedHom`; the affine case `⊗^L_A`).
- DerivedModuleAlgebra: §0.2 *Derived tensor products on module derived categories*; Layer 1,
  §1.1 *Derived limits of towers*; §1.3 *The derived completion reflector*; §1.5 *When ordinary
  quotient towers compute completion*; §1.T.1 (tower algebra and Milnor); §1.M.1
  (Matlis duality for arithmetic coefficients); §S.1 (the double-complex spectral sequence).
- EnhancedDerivedSheaves: §E1.8.DMA.1 (`derivedTensor_affine`).
- TauCetiRoadmap ProfiniteCohomology: Layers 4, 7, 10, 12.
- TauCetiRoadmap ClassFieldTheory: Layers 5, 7.
- AbelianSchemesAndArithmeticModuli: Layer A2, §A2.2 (the dual abelian scheme).
- AlgebraicModuliForArithmeticGeometry: Layer 4, §4.20 (classification of banded gerbes).
- Libraries: Mathlib `DerivedCategory`, Mathlib `HomologicalComplex₂.total`, Mathlib
  `CategoryTheory.Tor`, Mathlib `HomotopyCategory.spectralObjectMappingCone`, Mathlib
  `CategoryTheory.Abelian.SpectralObject.spectralSequence`, Mathlib
  `CategoryTheory.IsGrothendieckAbelian.enoughInjectives`, Mathlib `AdicCompletion`, Mathlib
  `Module.length`, Mathlib `ringKrullDim`, Mathlib `Polynomial.hilbertPoly`, Mathlib
  `Ideal.exists_pow_inf_eq_pow_smul`, Mathlib `groupCohomology`, Mathlib `localCohomology`, Mathlib
  `TopRep`, Tau Ceti `TauCeti.DiscreteRep`, Mathlib `Subrepresentation`, Mathlib
  `Subrepresentation.toRepresentation`, Mathlib `etaleTopology`, Mathlib
  `CategoryTheory.Abelian.Ext`.

## Layer R02.5: Selmer duality and dimension formulas

This layer uses EllipticCurves Layer 7 *Selmer structures, the Selmer group, and Sha*
for finite discrete coefficient modules. Sections D7.7.1–D7.7.2 supply their dual
conditions and perfect quotient pairings. It proves the Greenberg–Wiles formula,
the effect of changing one finite local condition and the rank-one numerics for GL₁.

### R02.5.1 The Greenberg–Wiles formula

**The Greenberg–Wiles formula.** Let `F` be a number field, `M` a finite discrete `G_F`-module with
`nM = 0`, and `M^* = Hom(M, μ_n)` (the dual `M^D` of Layer R02.4). For each place `v` fix a
subgroup `L_v ⊆ H¹(G_v, M)`, with `L_v = H¹(G_v/I_v, M^{I_v})` for all but finitely many `v`, and
let `L_v^⊥ ⊆ H¹(G_v, M^*)` be its annihilator under local duality. Then the Selmer groups
`H¹_L(F, M)` and `H¹_{L^⊥}(F, M^*)`, the preimages of `∏_v L_v` and `∏_v L_v^⊥` under
localisation, are finite, and

```text
#H¹_L(F, M) / #H¹_{L^⊥}(F, M^*) = (#H⁰(G_F, M) / #H⁰(G_F, M^*)) · ∏_v #L_v / #H⁰(G_v, M),
```

where all but finitely many factors of the product are `1`. Here `H⁰(G_v, M)` is ordinary
cohomology at every place, the archimedean ones included.

*Proof sketch.* For finite `v` with `v ∤ #M` and `M` unramified at `v`, the exact sequence
`0 → H⁰(G_v, M) → M^{I_v} → M^{I_v} → H¹(G_v/I_v, M^{I_v}) → 0` (the middle map `Frob_v − 1`) gives
`#L_v = #H⁰(G_v, M)`, so almost all factors are `1`. Choose a finite set `S` of places containing
the archimedean places, the places dividing `#M`, the places where `M` is ramified and those where
`L_v` is not the unramified subgroup. Then `0 → H¹_L(F, M) → H¹(G_S, M) → ⊕_{v∈S} H¹(G_v, M)/L_v` is
exact by the finite Selmer-kernel definition (EllipticCurves Layer 7 *Selmer structures, the Selmer group, and Sha*), and
`H¹(G_S, M)` is finite (*Finiteness of Galois cohomology with restricted ramification*, Layer
R02.4). The same sequence for `M^*`, dualised with local duality, gives
`⊕_{v∈S} L_v → H¹(G_S, M^*)^∨ → H¹_{L^⊥}(F, M^*)^∨ → 0`; here `(H¹(G_v, M^*)/L_v^⊥)^∨ ≅ L_v` by the
quotient pairing of §D7.7.1 *Perfect pairings and dual local conditions*, and outside `S` the unramified subgroups are exact annihilators (*Unramified classes
are exact annihilators*, Layer R02.4). The segment

```text
0 → H⁰(G_S, M) → ⊕_{v∈S} H⁰(F_v, M) → H²(G_S, M^*)^∨ → H¹(G_S, M) → ⊕_{v∈S} H¹(G_v, M) → H¹(G_S, M^*)^∨
```

of Poitou–Tate (with Tate's modified `H⁰(F_v, M) = M^{G_v}/(1 + c)M` at the real places), with
`⊕ H¹(G_v, M)` replaced by `⊕ L_v`, gives an exact sequence whose alternating product of orders,
combined with Tate's global Euler characteristic formula for `M^*`, yields the formula.
([Darmon–Diamond–Taylor, *Fermat's Last
Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.3, Theorem
2.18, p. 61 (author PDF, revised 9 September 2007); [Darmon–Diamond–Taylor, *Fermat's Last
Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.3, Theorem
2.19, p. 62 (author PDF, revised 9 September 2007).) *Needs:* *Poitou–Tate duality and the nine-term
exact sequence* (Layer R02.4); *Tate's global Euler characteristic formula* (Layer R02.4); *`P^r_S(K, M)` is dual to `P^{2−r}_S(K, M^D)`* (Layer R02.4); *Unramified classes are exact annihilators* (Layer
R02.4); *The dual `M^D = Hom(M, E_S)`* (Layer R02.4); *Finiteness of Galois cohomology with restricted
ramification* (Layer R02.4); *The Galois group `G_{K,S}` of the maximal extension unramified outside `S`* (Layer R02.3); ClassFieldTheory Layer 5; EllipticCurves Layer 7 *Selmer structures, the Selmer group, and Sha*;
§§D7.7.1–D7.7.2 (perfect pairings and dual local conditions).

**Checks.**

- For `M = 0` every term is `1`.
- `F = ℚ`, `M = 𝔽_p` with `p` odd, `L_v = H¹_un` at every finite `v` (including `v = p`) and
  `L_∞ = 0`: `H¹_L(ℚ, 𝔽_p) = 0`, since no cyclic `p`-extension of `ℚ` is unramified everywhere, and
  `H¹_{L^⊥}(ℚ, μ_p)` consists of the classes in `ℚ^×/ℚ^{×p}` with every valuation divisible by
  `p`, that is `±1`, so it is `0`. The right side is `(p/1) · (1/p) = 1`, the factor `1/p` coming
  from the real place, `#L_∞/#H⁰(G_ℝ, 𝔽_p)`. With Tate's `Ĥ⁰(ℝ, 𝔽_p) = 0` in place of ordinary `H⁰`
  the right side would be `p`.
- `F = ℚ`, `M = ℤ/2`, `L_v = H¹_un` at every finite `v` and `L_∞ = H¹(ℝ, ℤ/2)`: `H¹_L(ℚ, ℤ/2) = 0`;
  `L_2^⊥` is the classes of even valuation and `L_∞^⊥ = 0`, so `H¹_{L^⊥}(ℚ, μ₂)` consists of
  positive rationals with all valuations even, modulo squares, and is `0`. The right side is
  `(2/2) · (2/2) · (2/2) = 1`, the last two factors from `v = 2` and `v = ∞`.

**Greenberg–Wiles dimensions and the strict–relaxed bound.** Let `k` be any finite field of
characteristic `p`, `F` a number field, `M` a finite-dimensional continuous `k`-linear
`G_F`-module and `M^* = Hom_k(M, k)(1)`. Let `L_v` be `k`-linear local conditions, unramified
almost everywhere, with duals under `LocalDuality.localTatePairingField`. Write `hⁱ` for
`Module.finrank k` of the corresponding cohomology, and `l_v = Module.finrank k L_v`.
The target `SelmerDimensions.greenbergWiles` is the identity in `ℤ`

```text
h¹_L(F, M) − h¹_{L^⊥}(F, M^*) = h⁰(F, M) − h⁰(F, M^*) + ∑_v (l_v − h⁰(F_v, M)).
```

The sum has finite support; `h⁰` is ordinary invariants at every place, including real and
complex ones. The dual uses the cyclotomic twist over `k`, and all dimensions are over `k`.
`SelmerDimensions.greenbergWiles_le` gives the one-sided bound
`h¹_L ≤ h¹_{L^⊥} + h⁰(F, M) − h⁰(F, M^*) + ∑_v (l_v − h⁰(F_v, M))`.
It also permits replacing each local contribution by a proved upper bound.

For disjoint finite sets `S`, `Q`, with `S` containing the archimedean places, all places above
`p` and all ramification of `M`, let `L` be strict at `S`, relaxed at `Q` and unramified elsewhere.
The dual is relaxed at `S`, strict at `Q` and unramified elsewhere. Local Euler characteristic
at `q ∈ Q` gives `h¹(F_q, M) − h⁰(F_q, M) = h⁰(F_q, M^*)`, so
`SelmerDimensions.strict_relaxed` states

```text
h¹_L = h¹_{L^⊥} + h⁰(F, M) − h⁰(F, M^*) − ∑_{v∈S} h⁰(F_v, M) + ∑_{q∈Q} h⁰(F_q, M^*).
```

In particular `SelmerDimensions.strict_relaxed_le` gives
`h¹_L ≤ h¹_{L^⊥} + h⁰(F, M) + ∑_{q∈Q} h⁰(F_q, M^*)`.
If `h⁰(F, M) = 0` and every last summand is at most one, then
`h¹_L ≤ h¹_{L^⊥} + #Q`. This supplies the strict-at-framing-places bound used with the
relative tangent formula by GlobalGaloisDeformations §5.8. For `M = ad⁰ ρ̄`, the dual is
`(ad ρ̄/k·Id)(1)`; it can be replaced by `(ad⁰ ρ̄)(1)` only when the rank is invertible in `k`.

*Proof sketch.* Use the `k`-bilinear local pairings and take dimensions in the Poitou–Tate
argument for the order formula. Equivalently every finite `k`-space has order `#k` raised to
its `k`-dimension. The field trace relates the `k`-dual to the additive dual without changing
the primary coefficient field. Substitute the strict and relaxed conditions and the local Euler
formula to obtain the displayed specialization, then discard the nonpositive terms for the bound.
([Darmon–Diamond–Taylor, *Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
§2.3, Theorems 2.18–2.19, pp. 61–62.) *Needs:* *The Greenberg–Wiles formula*;
R02.4.2 defined field-valued pairings and local Euler characteristic;
D7.7.1 *The local-condition menu*; ArithmeticGaloisRepresentations §7.2 (the adjoint dual).

**Checks.**

- Extending `𝔽_p` to `𝔽_{p²}` doubles the additive `𝔽_p`-dimensions and preserves the displayed
  `k`-dimensions. There is no residue-field-degree multiplier in the formulas over `k`.
- For `F = ℚ`, trivial `M = k`, odd `p` and unramified finite conditions with strict real
  condition, both Selmer groups vanish. The global contribution `1` is cancelled by the real
  contribution `−1`; using modified `H⁰` would give the wrong answer.
- If the strict–relaxed dual Selmer group vanishes, `h⁰(F, M) = 0` and every auxiliary
  dual invariant space is one-dimensional, the strict–relaxed Selmer dimension is at most `#Q`.
- In characteristic two and rank two, use `(ad/k·Id)(1)` in the dual Selmer group; the trace
  pairing on `ad⁰` is degenerate and cannot identify that group with the dual.

**Changing one local condition.** Let `F`, `M` and `L = (L_v)` be as in *The Greenberg–Wiles
formula*, and let `L′ = (L′_v)` be a second family of local conditions with `L_v ⊆ L′_v` for every
`v` and `L_v = L′_v` for all but finitely many `v`. Then `H¹_L(F, M) ⊆ H¹_{L′}(F, M)`, the dual
Selmer groups shrink, `H¹_{L′^⊥}(F, M^*) ⊆ H¹_{L^⊥}(F, M^*)`, and

```text
#H¹_{L′}(F, M) / #H¹_L(F, M) = (∏_v [L′_v : L_v]) · #H¹_{L′^⊥}(F, M^*) / #H¹_{L^⊥}(F, M^*).
```

Suppose `L′` is obtained by relaxing at one finite place `q ∤ #M` at which `M` is unramified, with
`L_q = H¹_un(G_q, M)` and `L′_q = H¹(G_q, M)`. Then `L′_q^⊥ = 0`, so `H¹_{L′^⊥}(F, M^*)` is the
kernel of `loc_q : H¹_{L^⊥}(F, M^*) → H¹(G_q, M^*)`. Since classes of `H¹_{L^⊥}(F, M^*)` are
unramified at `q`, this is also the kernel of `H¹_{L^⊥}(F, M^*) → H¹_un(G_q, M^*)`.

*Proof sketch.* Divide the two instances of *The Greenberg–Wiles formula*; the global `H⁰` terms and
the unchanged local factors cancel. The inclusions and kernel description follow from the
definitions of the kernel Selmer group and change of local conditions
(EllipticCurves Layer 7 *Selmer structures, the Selmer group, and Sha*), with `H¹(G_q, M)^⊥ = 0` and `H¹_un(G_q, M)^⊥ = H¹_un(G_q, M^*)`
(*Unramified classes are exact annihilators*, Layer R02.4). ([Darmon–Diamond–Taylor, *Fermat's Last
Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.3, before
Theorem 2.18, p. 61 (author PDF, revised 9 September 2007).) *Needs:* *The Greenberg–Wiles formula*;
*Unramified classes are exact annihilators* (Layer R02.4); EllipticCurves Layer 7 *Selmer structures, the Selmer group, and Sha*;
§§D7.7.1–D7.7.2 (dual local conditions), with the two finite Greenberg–Wiles instances above.

**Checks.**

- `F = ℚ`, `M = 𝔽_p` (`p` odd) with `L` as in the second check of *The Greenberg–Wiles formula*,
  relaxed at a prime `q ≡ 1 mod p`: `[L′_q : L_q] = p²/p = p` and `H¹_{L^⊥}(ℚ, μ_p) = 0`, so
  `#H¹_{L′}(ℚ, 𝔽_p) = p`; the new class is the character of the degree-`p` subfield of `ℚ(ζ_q)`.
- With `q ≢ 0, 1 mod p` instead, `H¹(ℚ_q, 𝔽_p) = H¹_un(ℚ_q, 𝔽_p)` has order `p`, so
  `[L′_q : L_q] = 1` and relaxing at `q` changes neither Selmer group.
- For `M = 0`, all local conditions are zero and both Selmer groups have order one; the
  quotient formula reads `1 = 1`.

### R02.5.2 Rank-one Selmer numerics

**Rank-one Selmer numerics.** Let `F` be a number field with `r₁` real and `r₂` complex places, `p`
an odd prime with `ζ_p ∉ F`, and `M = 𝔽_p` with trivial action. Take `L_v = H¹_un(F_v, 𝔽_p)` at
every finite place, including the places above `p` (the unramified subgroup, not all of
`H¹(F_v, 𝔽_p)`), and `L_v = 0` at the archimedean places. Then

```text
dim Sel_L(F, 𝔽_p) − dim Sel_{L^⊥}(F, μ_p) = −(r₁ + r₂ − 1).
```

Here `Sel_L(F, 𝔽_p) = Hom(Cl_F, 𝔽_p)`, and `Sel_{L^⊥}(F, μ_p)` sits in the Kummer sequence
`0 → O_F^×/O_F^{×p} → Sel_{L^⊥}(F, μ_p) → Cl_F[p] → 0`, whose unit term has dimension
`r₁ + r₂ − 1`. The Greenberg–Wiles factors use ordinary invariants, globally and at the
archimedean places. If `ζ_p ∈ F` (so `r₁ = 0`), the term `h⁰(F, μ_p) = 1` changes the right side
to `−(r₁ + r₂) = −r₂`.

*Proof sketch.* Apply *The Greenberg–Wiles formula*: `h⁰(F, 𝔽_p) = 1` and `h⁰(F, μ_p) = 0`; each
finite place contributes `dim H¹_un(F_v, 𝔽_p) − h⁰(G_v, 𝔽_p) = 1 − 1 = 0`, and each archimedean
place contributes `0 − h⁰(G_v, 𝔽_p) = −1`. The descriptions of the two Selmer groups come from the
class-field dictionary (unramified characters are characters of the class group) and from Kummer
theory with Dirichlet's unit theorem, as in *The Kummer sequence for S-units*; at `v | p`, `L_v^⊥`
is the subgroup of unit classes, the annihilator of the unramified characters.
([Calegari–Geraghty, *Modularity lifting beyond the Taylor–Wiles
method*](https://arxiv.org/pdf/1207.4224), Author §8.2, pp. 77–78; published §8.2, journal p. 402.)
*Needs:* *The Greenberg–Wiles formula*; *The Kummer sequence for S-units* (Layer R02.3);
ClassFieldTheory Layer 13.

**Checks.**

- `F = ℚ`: both Selmer groups vanish (`Cl_ℚ = 1`, and `ℤ^× = {±1}` is trivial modulo `p`-th powers),
  and the difference is `0 = −(1 + 0 − 1)`.
- `F = ℚ(√2)`, `p = 3`: `Cl_F = 1`, `Sel_L = 0`, and `Sel_{L^⊥}(F, μ₃) = O_F^×/O_F^{×3} ≅ 𝔽₃`,
  generated by `1 + √2`; the difference is `−1 = −(2 + 0 − 1)`.
- `F = ℚ(ζ₃)`, `p = 3`, where `ζ_p ∈ F`: `Cl_F = 1` and
  `Sel_{L^⊥}(F, μ₃) = O_F^×/O_F^{×3} = μ₆/μ₂ ≅ 𝔽₃`, so the difference is `−1 = −r₂`, while
  `−(r₁ + r₂ − 1) = 0`: the formula for `ζ_p ∉ F` cannot be used unchanged.

### Examples

- For `M = 0` both Selmer groups and every local term vanish, and the formula reads `0 = 0`. For
  `M = 𝔽_p` with the condition `L_v = 0` at every `v ∈ S`, the formula computes the difference
  between the strict Selmer group of `𝔽_p` and the relaxed Selmer group of `μ_p`.
- With no invariants on either global module, the difference of Selmer dimensions is the sum of
  the local excesses `dim L_v − h⁰(G_v, M)` over `S`, including the archimedean places.
- For `F = ℚ(√2)` and `p = 3`, with unramified conditions at the finite places and `0` at the two
  real places, `Sel_L(F, 𝔽₃) = 0` and `Sel_{L^⊥}(F, μ₃)` is the line spanned by the fundamental
  unit `1 + √2`, matching `−(r₁ + r₂ − 1) = −1`.

### Dependencies

- Earlier layers of this roadmap: R02.3, R02.4, D7.
- EllipticCurves: Layer 7 *Selmer structures, the Selmer group, and Sha*.
- Earlier targets: §§D7.7.1–D7.7.2 (perfect pairings and dual local conditions).
- TauCetiRoadmap ClassFieldTheory: Layers 5, 13.

## Layer D8: Adjoint coefficients and first-order lifts

This layer makes the first-order calculations behind deformation rings precise without assuming
that any deformation problem is representable. It proves trace duality for the adjoint
representation without dividing by `n`, identifies first-order lifts with continuous one-cocycles
in the adjoint module, and identifies the determinant derivative with the trace.

### D8.1 Adjoint coefficients and first-order lifts

**Trace-zero adjoint duality without division by `n`.** Let `k` be a field, `n ≥ 1`, `V` an
`n`-dimensional `k`-vector space, `ad = End_k(V)` with the conjugation action, and
`ad⁰ = ker(tr : ad → k)`. The adjoint and trace-zero adjoint representations, the perfect trace
pairing and `(ad⁰)^∨ ≅ ad/k·Id` over any coefficient ring are ArithmeticGaloisRepresentations Layer
7, §7.2 (`ContinuousRep.adZero`, `ContinuousRep.adQuot`, `ContinuousRep.tracePairing_perfect` on
`ad ρ` and `tracePairing_matrix_perfect` on `M_n(A)`), cited; Tau Ceti's `TauCeti.traceBilinForm` used below is
the bilinear form of the latter pairing on `Matrix n n k`; this target adds the
criterion for the restricted pairing on `ad⁰` and the boundary `δ` in continuous cohomology, which
the fixed-determinant calculations use. The trace pairing `(X, Y) ↦ tr(XY)` on `ad` is perfect and
invariant under conjugation, and `tr` is surjective (`tr(E₁₁) = 1`), whether or not `n` is
invertible in `k`. Dualising `0 → ad⁰ → ad → k → 0` through the trace pairing gives the equivariant
exact sequence `0 → k·Id → ad → (ad⁰)^∨ → 0`, so `(ad⁰)^∨ ≅ ad/k·Id`. The restriction of the trace
pairing to `ad⁰` is perfect exactly when `n ≠ 0` in `k`; if `char k | n`, then `Id ∈ ad⁰` and the
radical of the restricted pairing is `k·Id`. Only the self-duality of `ad⁰` needs `n` invertible.
`ad⁰` is Tau Ceti's trace-zero ideal `TauCeti.slIdeal k n` (`TauCeti.mem_slIdeal_iff`; as a Lie
subalgebra it is Mathlib's `LieAlgebra.SpecialLinear.sl`), and no second trace-zero submodule is
defined; the pairing is Tau Ceti's `TauCeti.traceBilinForm` (nondegenerate by
`TauCeti.traceBilinForm_nondegenerate`), and the criterion for `ad⁰` is
`Adjoint.traceBilinForm_restrict_slIdeal_nondegenerate_iff`. For a profinite group `G` acting
continuously on `V` through `ρ` (with `k` discrete), these sequences give long exact sequences of
continuous cohomology. The fixed-determinant theory is built from the trace map itself, and the
boundary `δ : H⁰(G, k) → H¹(G, ad⁰)` of `0 → ad⁰ → ad → k → 0` is kept: it vanishes when `n` is
invertible in `k` (`Id/n` splits the trace equivariantly), and it is injective when `char k | n` and
`H⁰(G, ad) = k·Id`, since then `H⁰(G, ad) → H⁰(G, k)` sends `Id` to `n = 0`.

*Proof sketch.* With matrix units, `tr(E_{ij}E_{kl}) = 1` if `(k, l) = (j, i)` and `0` otherwise,
so the trace pairing is perfect; `tr(E₁₁) = 1` gives surjectivity. Dualise the kernel–cokernel
sequence and identify the orthogonal complement of `ad⁰` with the scalar matrices. Restricting to
`ad⁰`, the radical is `ad⁰ ∩ k·Id`, which is `k·Id` or `0` according as `n = 0` in `k` or not.
Apply continuous cochains to the exact sequence of `G`-modules and take its long exact sequence.
([Khare–Wintenberger, *Serre's modularity conjecture
(II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1.4–4.1.6 and remark after
Lemma 5.3, pp. 41–42, 47–48; Paškūnas–Quast, *On local Galois deformation rings: generalised
reductive groups*, §1.4.2, published p. 7; §13, Lemma 13.22, published p. 67.) *Needs:*
ArithmeticGaloisRepresentations Layer 7, §7.2; Tau Ceti `TauCeti.traceBilinForm`;
ProfiniteCohomology Layers 5 and 10; Mathlib `groupCohomology`.

**Checks.**

- `char k = 2`, `n = 2`: `tr(Id) = 2 = 0`, so `Id ∈ ad⁰` and `tr(Id·X) = tr X = 0` for every
  `X ∈ ad⁰`: `Id` lies in the radical of the restricted pairing.
- `n` prime to `char k`: `ad = ad⁰ ⊕ k·Id` and `ad⁰` is self-dual under the trace pairing.
- `char k | n`: the full trace is still surjective (`tr(E₁₁) = 1`), and the dual of `ad⁰` is
  `ad/k·Id`, not `ad⁰`.

**First-order Galois cocycle comparison.** Let `G` be a profinite group, `k` a field with the
discrete topology, `A` any associative unital `k`-algebra with the discrete topology, and
`ρ₀ : G → Aˣ` continuous. Give `A` the adjoint action `g·X = ρ₀(g)Xρ₀(g)⁻¹`.
Mathlib's `DualNumber A` is `A[ε]`, with central `ε` and `ε² = 0`.
Every continuous lift `ρ_ε : G → A[ε]ˣ` reducing to `ρ₀` is uniquely
`ρ_ε(g) = (1 + ε c(g)) ρ₀(g)` for a continuous `c ∈ Z¹(G, ad ρ₀)`, and every such cocycle gives
a lift. This is an equivalence between actual lifts and cocycles, natural under restriction
and equivariant algebra maps. Conjugation by `1 + εX`, `X ∈ A`, changes `c` by
`g ↦ X − ρ₀(g)Xρ₀(g)⁻¹`; hence equivalence classes form `H¹(G, ad ρ₀)`.
Framed lifts form `Z¹(G, ad ρ₀)` and their stabilizer is `1 + ε H⁰(G, ad ρ₀)`, containing
`1 + ε Z(A)`. The algebraic identities hold for every ring `A`; continuity is imposed
for the continuous-cohomology equivalence.

For `A = End_k(V)` with `V` finite-dimensional of dimension `n ≥ 1`, write `ρ` for the
representation on `V`. The trace-zero and
determinant statements are basis-free corollaries; choosing a basis gives the matrix versions.
Since `det(1 + εX) = 1 + ε tr X`, the derivative of the determinant is
the trace: `det ρ_ε = det ρ` exactly when `tr ∘ c = 0`, i.e. `c ∈ Z¹(G, ad⁰ ρ)`, and equivalence
classes of lifts with fixed determinant form `ker(H¹(G, ad ρ) → H¹(G, k)) = H¹(G, ad⁰ ρ)/δ(H⁰(G, k))`,
with `δ` the boundary of the trace sequence. In `Suggested.lean` the lift is
`Adjoint.firstOrderLift ρ₀ c : G → (DualNumber A)ˣ`, the cocycle criterion is
`Adjoint.firstOrderLift_mul_iff`, and `Adjoint.firstOrderLift_existsUnique` gives the unique
cocycle of any lift. `Adjoint.continuous_firstOrderLift_iff` identifies continuity of the lift
with continuity of its cochain for discrete coefficients and continuous `ρ₀`.
The reduction identity is `Adjoint.firstOrderLift_fst`; the matrix
determinant identity is `Adjoint.det_one_add_eps`. The coboundary identity for first-order
conjugation is `Adjoint.firstOrderLift_conjugation`. The matrix-valued reading uses the canonical
isomorphism `DualNumber (Matrix n n k) ≅ Matrix n n (DualNumber k)`.

*Proof sketch.* Write a unit reducing to `ρ₀(g)` as the pair `(ρ₀(g), c(g)ρ₀(g))` in
`DualNumber A`. Its inverse is `(ρ₀(g)⁻¹, −ρ₀(g)⁻¹c(g))`. Compare the second components of a
product to obtain the cocycle equation; no commutativity of `A` is used.
Conjugation by `1 + εX` gives the displayed coboundary. For `End_k(V)`, expand the determinant
in a basis, and check that the trace commutes with
conjugation and with restriction; conjugation by any `1 + εX` preserves the determinant, which
gives the quotient by `δ(H⁰(G, k))`. ([Khare–Wintenberger, *Serre's modularity conjecture
(II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1, pp. 39–42; [Darmon–Diamond–Taylor,
*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf),
§2.6, Lemma 2.39 and proof, p. 75; the comparison of extensions with cocycles is recalled from
§2.4.) *Needs:* *Comparison with the canonical carrier for compact coefficients* (PerfectoidTowers
§P9.0);
*Trace-zero adjoint duality without division by `n`*; Mathlib `groupCohomology`.

**Checks.**

- `n = 1`: `ad ρ = k` with trivial action, the trace and the derivative of the determinant are the
  identity, and the lifts are `H¹(G, k) = Hom_cts(G, k)`.
- Conjugation by a scalar `1 + ελ` gives the zero coboundary; framed lifts modulo conjugation are
  `Z¹(G, ad ρ)/(ad/H⁰(G, ad ρ)) = H¹(G, ad ρ)`.
- `char k | n` and `H⁰(G, ad ρ) = k·Id` (for instance `n = 2`, `k = 𝔽₂`, `ρ` absolutely
  irreducible): `δ` is injective, so the fixed-determinant classes form `H¹(G, ad⁰ ρ)/k`, of
  dimension `dim H¹(G, ad⁰ ρ) − 1` when finite; ignoring the boundary would count one dimension too
  many.
- For a noncommutative algebra the order of multiplication is essential: the second component
  of the lift is `c(g)ρ₀(g)`, and its inverse has second component `−ρ₀(g)⁻¹c(g)`.
- An equivariant change of basis for `End_k(V)` conjugates both the lift and its cocycle,
  and preserves the trace-zero condition and the determinant derivative.

### Examples

- Over `k = 𝔽₂` with `n = 2` the identity has trace zero, so `ad⁰` contains the scalars and the
  trace pairing on `ad⁰` is degenerate; the dual of `ad⁰` is `ad/k·1`.
- `det(1 + εX) = 1 + ε·tr X` over `k[ε]`, so a first-order lift has constant determinant exactly when
  its cocycle takes values in `ad⁰`.

### Dependencies

- PerfectoidTowers: §P9.0 (comparison with the canonical carrier).
- TauCetiRoadmap ProfiniteCohomology: Layers 5 and 10.
- ArithmeticGaloisRepresentations: Layer 7, §7.2 (adjoint and trace-zero adjoint, trace pairing).
- Libraries: Mathlib `groupCohomology`, Mathlib `DualNumber`, Mathlib `Matrix.det_one_add_smul`,
  Tau Ceti `TauCeti.traceBilinForm`.

## Layer R02.6: Auxiliary primes and patching numerics

This layer proves the cohomological inputs to the Taylor–Wiles and Khare–Wintenberger patching
arguments: the local cohomology at a Taylor–Wiles prime, the
group-theoretic criterion for auxiliary primes, the conditional dual-Selmer killing calculation,
the relative tangent and relation bounds, the existence of odd and dyadic auxiliary sets,
finite-order determinant twists and the archimedean adjoint dimensions. Every statement keeps its
`p = 2` and archimedean terms; no argument divides by `n`, and division by `2` occurs only where
the characteristic is assumed different from `2`.

### R02.6.1 Local counts and the group theory of auxiliary primes

**Local cohomology at a Taylor–Wiles prime.** Let `ℓ` be odd, `k` a finite field of characteristic
`ℓ`, `ρ̄ : G_ℚ → GL₂(k)` continuous, and `q ≡ 1 (mod ℓ)` a prime at which `ρ̄` is unramified and
`ρ̄(Frob_q)` has distinct eigenvalues in an algebraic closure `k̄` of `k`, that is, `ρ̄(Frob_q)` is
regular semisimple; the eigenvalues need not lie in `k`. Inflation identifies the cohomology of
`Gal(ℚ_q^ur/ℚ_q)` with the unramified groups `Hⁱ_un(ℚ_q, −)` for `i = 0, 1`. Then

```text
H⁰_un(ℚ_q, ad⁰ρ̄) = H⁰_un(ℚ_q, ad⁰ρ̄(1)) = k,   H¹_un(ℚ_q, ad⁰ρ̄) = H¹_un(ℚ_q, ad⁰ρ̄(1)) = k.
```

This is the hypothesis that *The group-theoretic input to Taylor–Wiles primes* produces. The
splitting of a deformation at `q` into two characters (DDT, Lemma 2.44) needs the eigenvalues in
`k`, which a finite extension of `k` provides (DDT, proof of Theorem 3.42, p. 100); that splitting
is not part of this target.

*Proof sketch.* Over `k̄`, `Frob_q` acts semisimply on `ad⁰ρ̄ ⊗_k k̄` with eigenvalues `x, 1, x^{−1}`,
where `x ≠ 1` is the ratio of the eigenvalues of `ρ̄(Frob_q)`; since `q ≡ 1 (mod ℓ)`, the twist `(1)`
does not change them. For the procyclic group `Gal(ℚ_q^ur/ℚ_q)`, `H⁰` and `H¹` of a finite module
`N` are the kernel and cokernel of `Frob − 1` on `N` (PadicPeriodRings §0.1, *`H¹` of a procyclic
group*). Their `k`-dimensions are unchanged by extending scalars to `k̄`, so both are
one-dimensional. Over `k` itself, `H⁰_un(ℚ_q, ad⁰ρ̄)` is the trace-zero part of the centraliser
`k[ρ̄(Frob_q)]`, a two-dimensional algebra (`k × k` or a quadratic field) on which the trace is onto
because `tr(1) = 2 ≠ 0`. ([Darmon–Diamond–Taylor, *Fermat's Last
Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, Lemma
2.46 and its proof, with `x ∈ k̄`, p. 81 (author PDF, revised 9 September 2007).) *Needs:*
PadicPeriodRings §0.1 (*`H¹` of a procyclic group*).

**Checks.**

- The twist matters only through `q mod ℓ`: if `q ≢ 0, 1 (mod ℓ)` and `q ∉ {x, x^{−1}}` in `k̄`, then
  `Frob_q` has eigenvalues `qx, q, qx^{−1}` on `ad⁰ρ̄(1)`, none equal to `1`, so
  `H⁰_un(ℚ_q, ad⁰ρ̄(1)) = 0` while `H⁰_un(ℚ_q, ad⁰ρ̄) = k`.
- The distinct-eigenvalue hypothesis is needed: if `ρ̄(Frob_q)` is scalar, `Frob_q` acts trivially
  on `ad⁰ρ̄` and `H⁰_un(ℚ_q, ad⁰ρ̄)` has dimension `3`.
- Rationality of the eigenvalues is not needed: for `k = 𝔽₇` and `ρ̄(Frob_q) = [[0, −1], [1, 0]]`,
  the eigenvalues `±√−1` do not lie in `𝔽₇`, the centraliser is `𝔽₇[ρ̄(Frob_q)] ≅ 𝔽₄₉`, and its
  trace-zero part is the line spanned by `ρ̄(Frob_q)`, so `H⁰_un(ℚ_q, ad⁰ρ̄) = H¹_un(ℚ_q, ad⁰ρ̄) = k`.

**The group-theoretic input to Taylor–Wiles primes.** Let `ℓ` be odd, `ρ̄ : G_ℚ → GL₂(k)` with
`ρ̄|_{G_L}` absolutely irreducible for `L = ℚ(√((−1)^{(ℓ−1)/2} ℓ))`, and for `m ≥ 0` let `F_m` be the
extension of `ℚ(ζ_{ℓ^m})` cut out by `ad⁰ρ̄`. Then for every `n ≥ 1`,
`H¹(Gal(F_n/ℚ), ad⁰ρ̄(1)) = 0`, and for every nonzero `ψ ∈ H¹(G_ℚ, ad⁰ρ̄(1))` there is `σ ∈ G_ℚ`
with `σ|_{ℚ(ζ_{ℓⁿ})} = 1`, `ad⁰ρ̄(σ)` having an eigenvalue other than `1`, and
`ψ(σ) ∉ (σ − 1) ad⁰ρ̄(1)`. By Chebotarev, primes `q` with `Frob_q` close to `σ` are Taylor–Wiles
primes of level `n` with `res_q ψ ≠ 0`.

*Proof sketch.* Inflation–restriction for `F_n/F₀/ℚ` (*The five-term sequence and the
transgression*, Layer R02.2): the `G_ℚ`-invariants
`H¹(Gal(F_n/F₀), ad⁰ρ̄(1))^{G_ℚ} ≅ Hom(Gal(F_n/F₁), ad⁰ρ̄(1)^{G_ℚ})` vanish by absolute
irreducibility over `L`. `H¹(Gal(F₀/ℚ), ad⁰ρ̄(1)^{G_{F₀}})` vanishes unless `ℓ` divides
`#Gal(F₀/ℚ)` and `Gal(ℚ(ζ_ℓ)/ℚ)` is a quotient; by the classification of the projective image
(ArithmeticGaloisRepresentations Layer 4, §4.4, `GL2Subgroup.dickson_projectiveImage`) this leaves `ℓ = 3` with image `PSL₂(𝔽_{3^r})`, where `H¹(SL₂(𝔽_{3^r}), ad⁰) = 0`
(ArithmeticGaloisRepresentations §7.7 / **`SL₂` with adjoint coefficients**,
`ResidualImage.h1_SL2_adZero_eq_zero`; the target also records the `#F = 5` exception). So
`ψ(G_{F_n}) ≠ 0`; some `g ∈ Gal(F_n/ℚ(ζ_{ℓⁿ}))` of order prime to `ℓ` fixes a nonzero element of
`ψ(G_{F_n})`; lift `g` to `σ₀` and take `σ = τσ₀` with `τ ∈ G_{F_n}` chosen so that
`ψ(τ) + ψ(σ₀) ∉ (σ₀ − 1) ad⁰ρ̄(1)`, which is possible since
`ψ(G_{F_n}) ⊄ (g − 1) ad⁰ρ̄(1)` (the source writes `ψ(G_F)` here). ([Darmon–Diamond–Taylor,
*Fermat's Last
Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, proof
of Theorem 2.49, p. 83 (author PDF, revised 9 September 2007); [Darmon–Diamond–Taylor, *Fermat's
Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8,
end of the proof of Theorem 2.49, p. 84 (author PDF, revised 9 September 2007).) *Needs:*
ArithmeticGaloisRepresentations Layer 7, §7.7 (`ResidualImage.h1_SL2_adZero_eq_zero`); *The five-term
sequence and the transgression* (Layer R02.2);
ArithmeticGaloisRepresentations Layer 4, §4.4 (`GL2Subgroup.dickson_projectiveImage`).

**Checks.**

- For `ψ = 0` no such `σ` exists, since `ψ(σ) = 0 ∈ (σ − 1) ad⁰ρ̄(1)`: the hypothesis `ψ ≠ 0` is
  needed.

**Archimedean adjoint dimensions.** Let `k` be a field of characteristic different from `2` and
`n ≥ 1`. For a rank-`n` representation at a real place whose complex conjugation has eigenspaces of
dimensions `a` and `b` (`a + b = n`), `h⁰(G_v, ad⁰) = a² + b² − 1`; at a complex place
`h⁰(G_v, ad⁰) = n² − 1`
(`Adjoint.finrank_slIdeal_centralizer_involution`, for the real case). If every real conjugation is
balanced, `|a − b| ≤ 1`, then

```text
Σ_{v|∞} h⁰(G_v, ad⁰) = [F : ℚ] n(n − 1)/2 + l₀,   l₀ = r₁⌊(n − 1)/2⌋ + r₂(n − 1).
```

This is the archimedean contribution in the numerical coincidence of Calegari–Geraghty. Balancedness
is a hypothesis: it is not implied by the value of the trace of complex conjugation in `k` (Check).

*Proof sketch.* Diagonalise the involution using the idempotents `(1 ± c)/2`. Its centraliser is
`End(k^a) ⊕ End(k^b)`; impose the single trace equation, which cuts it down by one dimension
because the trace is surjective, without dividing by `n`. Insert the balanced dimensions and sum
the real and complex contributions. ([Calegari–Geraghty, *Modularity lifting beyond the
Taylor–Wiles method*](https://arxiv.org/pdf/1207.4224), §8.4, author pp. 80–81; published journal
p. 406.) *Needs:* *Trace-zero adjoint duality without division by `n`* (Layer D8); *The
Greenberg–Wiles formula* (Layer R02.5).

**Checks.**

- For `F = ℚ`, `k = 𝔽₃`, `n = 2` and `c = diag(1, −1)`, the trace-zero matrices commuting
  with `c` are `diag(x, −x)`, so `h⁰(G_∞, ad⁰) = 1`. The norm `1 + c` acts as multiplication
  by `2` on these invariants, so `Ĥ⁰(G_∞, ad⁰) = 0`; its dimension cannot replace the ordinary one.
- A scalar conjugation (`a = n`, `b = 0`) has `h⁰(ad⁰) = n² − 1`, larger than the balanced value
  for `n ≥ 2`; for `n = 1` both are `0`.
- In characteristic `3` with `n = 5`, `(a, b) = (3, 2)` and `(0, 5)` both have trace `1` in `k`, but
  `h⁰(ad⁰)` is `12` and `24`: the trace in `k` does not detect balancedness.

### R02.6.2 Dual-Selmer killing and auxiliary sets

**The conditional dual-Selmer killing calculation.** Let `ρ̄` be as in *Local cohomology at a
Taylor–Wiles prime*, `Q` a finite set of Taylor–Wiles primes for `ρ̄` (each as in that target), and
`∅` a Selmer structure on `ad⁰ρ̄` that is unramified at the primes of `Q`, with dual Selmer group
`H¹_{∅*}(ℚ, ad⁰ρ̄(1))`. Write `Q` also for the structure obtained from `∅` by relaxing the condition
at the primes of `Q`; its dual structure `Q*` is strict at `Q`. If the restriction map

```text
H¹_{∅*}(ℚ, ad⁰ρ̄(1)) → ⊕_{q∈Q} H¹_un(ℚ_q, ad⁰ρ̄(1))
```

is an isomorphism, then `#Q = dim_k H¹_{∅*}(ℚ, ad⁰ρ̄(1))` and `H¹_{Q*}(ℚ, ad⁰ρ̄(1)) = 0`. It is an
isomorphism as soon as it is injective and `#Q = dim_k H¹_{∅*}(ℚ, ad⁰ρ̄(1))`; it is injective if
every nonzero class has nonzero restriction at some `q ∈ Q`.

*Proof sketch.* Each `H¹_un(ℚ_q, ad⁰ρ̄(1))` is one-dimensional (*Local cohomology at a Taylor–Wiles
prime*), so injectivity and the count give the isomorphism. Relaxing at `q` makes the dual condition
strict (*Changing one local condition*, Layer R02.5), and the restriction at `q ∈ Q` of a class in
`H¹_{∅*}` lies in the unramified part; so `H¹_{Q*}` is the kernel of the displayed map.
([Darmon–Diamond–Taylor, *Fermat's Last
Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §2.8, Lemma
2.46(c), p. 81 (author PDF, revised 9 September 2007).) *Needs:* *Local cohomology at a Taylor–Wiles
prime*; *Changing one local condition* (Layer R02.5); EllipticCurves Layer 7 *Selmer structures, the Selmer group, and Sha*;
§§D7.7.1–D7.7.2 (finite dual local conditions).

**Checks.**

- For `Q = ∅` the map is an isomorphism exactly when `H¹_{∅*}(ℚ, ad⁰ρ̄(1)) = 0`, and then `#Q = 0`.
- If the dual Selmer group has dimension one and `Q = {q}` with a generator restricting
  nontrivially, the map is an isomorphism and imposing strictness at `q` kills the group.
- For the same one-dimensional group, a prime where the generator restricts to zero leaves
  the whole group in the kernel; the count `#Q = 1` alone does not kill it.

**Khare–Wintenberger tangent and relation bounds.** Let `F` be totally real, `k` a finite field of
characteristic `p`, `ρ : G_F → GL₂(k)` continuous and totally odd, absolutely irreducible on
`G_{F(μ_p)}` if `p` is odd and with nonsolvable image if `p = 2` (as in KW II §4), and `S` a finite
set of places containing those above `p`, the infinite places and the ramification of `ρ`. Consider
the fixed-determinant global deformation problem of KW II §4, with the local conditions `L_v` of
KW §4.1.4, and use `ad⁰` together with its true dual `(ad⁰)*(1)`. The local tangent conditions are
compared with `ad` through the exact trace sequence `0 → ad⁰ → ad → k → 0`, keeping the image of
`H⁰(ad) → k` and its connecting map. Put `δ_p = 1` if `p = 2` and `δ_p = 0` otherwise. The relative
framed tangent count is

```text
g = h¹_L(ad⁰) − δ_p + Σ_{v∈S} h⁰(G_v, ad) − h⁰(F, ad),
```

and Wiles' formula and the local exact sequences give `g = h¹_{L⊥}((ad⁰)*(1)) + |S| − 1` for this
problem. If a presentation of the deformation ring as a quotient of a power series ring by an
ideal `J` comes with an injection `Hom(J/𝔪J, k) ↪ H¹_{L⊥}((ad⁰)*(1))` given by its obstruction map,
then the number of defining relations is at most `h¹_{L⊥}((ad⁰)*(1))`.

*Proof sketch.* Use the trace exact sequence, the image of its connecting map, and the
identification of the tangent space with Galois cohomology (*First-order Galois cocycle
comparison*, Layer D8). Apply *The Greenberg–Wiles formula* (Layer R02.5) to `ad⁰` and its true
dual, and substitute the local and global invariant dimensions of KW Lemma 4.3. For the relation
bound, take dimensions in the given injection `Hom(J/𝔪J, k) ↪ H¹_{L⊥}((ad⁰)*(1))`.
([Khare–Wintenberger, *Serre's modularity conjecture
(II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1–4.2 and Lemmas 4.3–4.4,
pp. 39–43; Lemma 4.6, pp. 44–45.) *Needs:* *The Greenberg–Wiles formula* (Layer R02.5); *Trace-zero
adjoint duality without division by `n`* (Layer D8); *First-order Galois cocycle comparison* (Layer
D8).

**Checks.**

- For `p = 2`, `ad⁰` contains the scalars and the trace pairing on `ad⁰` has radical `k·Id`, so
  `(ad⁰)*(1)` is not `ad⁰(1)` (*Trace-zero adjoint duality without division by `n`*, Layer D8); for
  `p` odd they agree.
- For `p = 2`, `H⁰(F, ad) = k·Id` and `tr(Id) = 2 = 0`, so `H⁰(F, ad) → k` is zero and the count
  changes by `δ_2 = 1`; for `p` odd the trace is surjective on scalars and `δ_p = 0`.
- At a real place over `𝔽₂` with `c = [[1, 1], [0, 1]]`, the ordinary invariant dimensions
  on `ad` and `ad⁰` are both `2` and their trace map is zero. Thus `dim L_v = 1` and
  `h⁰(G_v, ad) + dim L_v − h⁰(G_v, ad⁰) = 2 + 1 − 2 = 1`, the local contribution in KW's count.

**Odd-prime Taylor–Wiles auxiliary sets.** Let `p` be odd, `F` totally real and unramified above `p`,
`k` a finite field of characteristic `p`, and `ρ : G_F → GL₂(k)` totally odd and absolutely
irreducible on `G_{F(μ_p)}`, as in KW II Lemma 5.2(1), with the local conditions at `S` exactly
those of KW §4.1.4 (no adequate-image hypothesis replaces these). For each `n ≥ 1` there is a set
`Q_n` of primes, disjoint from `S`, of size `h¹_{L⊥}((ad⁰ρ)*(1))`, with `Nq ≡ 1 (mod pⁿ)` and
distinct residual Frobenius eigenvalues for `q ∈ Q_n`, such that the new strict dual Selmer group
vanishes. At each such prime the full local cohomology has `h¹(ad⁰ρ) = 2` and `h⁰ = 1`, while the
unramified `H¹` is one-dimensional. The local fixed-determinant framed generator count is
`|Q_n| + |S| − 1` in the problem of KW. For `p = 2` the argument is replaced by *Dyadic auxiliary
primes and the cyclotomic residual*; the source notes that this dual-Selmer argument can fail for
`p = 2`.

*Proof sketch.* The targets over `ℚ` earlier in this layer are the case `F = ℚ` and are not
invoked for general `F`; their arguments are run over `F`. Prove KW Lemma 5.2(1), the vanishing of
`H¹(Gal(KF_m/F), (ad⁰ρ)*(1))` for `K` the field cut out by `ad⁰ρ` and `F_m = F(ζ_{p^m})`, by the
inflation–restriction and Dickson argument of *The group-theoretic input to Taylor–Wiles primes*
over `F`: since `F` is unramified above `p`, `Gal(F(ζ_p)/F) ≅ (ℤ/p)^×`, and absolute irreducibility
on `G_{F(μ_p)}` gives it on every `G_{F(ζ_{p^m})}`. For each nonzero dual class choose a Frobenius
with nonzero evaluation and distinct eigenvalues, then apply Chebotarev over `F`. Choose enough
independent localisation functionals to kill the finite-dimensional dual Selmer group, as in *The
conditional dual-Selmer killing calculation* with `ℚ` replaced by `F` (KW Lemma 5.3). At `q ∈ Q_n`,
`Nq ≡ 1 (mod p)` and distinct eigenvalues give `h⁰(ad⁰ρ) = h⁰((ad⁰ρ)*(1)) = 1` by the computation of
*Local cohomology at a Taylor–Wiles prime*; apply local finite duality and the local Euler
characteristic for the full and unramified counts (KW Lemma 5.4). ([Khare–Wintenberger, *Serre's
modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §5.3–5.4,
Lemma 5.2(1) and its proof, which runs DDT's argument over `F`, Lemmas 5.3–5.4 and Proposition 5.5,
pp. 47–48.) *Needs:* *The five-term sequence and the transgression* (Layer R02.2); *Changing one
local condition* (Layer R02.5); ArithmeticGaloisRepresentations Layer 4, §4.4 and Layer 7, §7.7;
PadicPeriodRings §0.1 (*`H¹` of a procyclic group*); EllipticCurves Layer 7
*Selmer structures, the Selmer group, and Sha*; §§D7.7.1–D7.7.2; *Khare–Wintenberger tangent and relation
bounds*; Chebotarev Layer 10; ClassFieldTheory Layer 5.

**Checks.**

- At `q ∈ Q_n` the local Euler characteristic (zero for `q ∤ p`) gives
  `h¹(G_q, ad⁰) = h⁰(ad⁰) + h⁰(ad⁰(1)) = 1 + 1 = 2`, while the unramified `H¹` has dimension `1`.
- For `p` odd the trace pairing on `ad⁰ρ` is perfect (*Trace-zero adjoint duality without division
  by `n`*), so `(ad⁰ρ)*(1) ≅ ad⁰ρ(1)` and the dual Selmer group is that of `ad⁰ρ(1)`.
- The construction fails for `p = 2`: there `(ad⁰)*(1) ≅ ad/k·1`, whose only irreducible
  submodule is `ad⁰/k·1`, and an element `σ` with distinct eigenvalues `α ≠ β` acts on it with
  eigenvalues `α/β` and `β/α`, neither equal to `1`, so `(σ − 1)` is onto that submodule and the
  choice `ψ(σ) ∉ (σ − 1)M` of the argument is impossible there (KW II, remark after Lemma 5.3,
  pp. 47–48).

**Dyadic auxiliary primes and the cyclotomic residual.** Let `F` be totally real, `k` a finite field
of characteristic `2`, `ρ : G_F → GL₂(k)` with nonsolvable projective image, `S` a finite set of
places containing those above `2`, the infinite places and the ramification of `ρ`, and `n > n₀`,
where `n₀` is the maximal real cyclotomic level as in KW II §5.5. Use the full adjoint `ad ρ`,
including the scalar matrices, not `ad⁰` or a self-dual replacement. Let `F_n = F(μ_{2ⁿ})`, and let
`F̃_n` be the special Kummer extension of KW Proposition 5.6, with its disjointness from the field
cut out by the dual classes; both are hypotheses of the construction. Then there is a set `Q_n` of
primes of cardinality `h¹(S, ad ρ) − 2` with `Nq ≡ 1 (mod 2ⁿ)`, distinct Frobenius eigenvalues and
`q` split in `F̃_n`. The strict full-adjoint `H¹` is the inflated cyclotomic scalar group
`H¹(Gal(F_n/F), k)`, of dimension two; this residual does not vanish. The `S`-split local condition
gives `h¹ = 2 − Σ_{v∈S} h⁰(G_v, ad ρ) + 2|Q_n|`. For `t = 2 − |S| + |Q_n|`, the Galois group of the
maximal abelian `2`-extension of `F` unramified outside `Q_n` and split at `S`, modulo `2^{n−2}`, is
isomorphic to `(ℤ/2^{n−2})^t`.

*Proof sketch.* Use the Dickson classification and KW Lemma 4.3(5) to identify the cyclotomic `H¹`
in the full adjoint. Prove the special Kummer disjointness of Proposition 5.6 using scalar cocycles
and its `2`-power degree calculation. Choose Frobenius evaluations by Chebotarev outside the
cyclotomic scalar residual. Apply Wiles' formula twice, with the scalar and local counts, to obtain
the two dimension formulas. Use Kummer duality and the constraints from `S`-units for the rank of
the abelian quotient. ([Khare–Wintenberger, *Serre's modularity conjecture
(II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §5.5, Proposition 5.6, Lemmas
5.8–5.10, pp. 48–53.) *Needs:* *Khare–Wintenberger tangent and relation bounds*; *Cyclotomic
description of the power kernel* (Layer R02.3); *The Kummer sequence for S-units* (Layer R02.3);
Chebotarev Layer 10; ArithmeticGaloisRepresentations Layer 4, §4.4 (`GL2Subgroup.dickson_projectiveImage`) and
§4.7 / **Characteristic two**: for `F₀` of order `2^r`, `r ≥ 2`, the target provides
`H¹(SL₂(F₀), M₂(F)) = 0`, and `GL2Subgroup.sl2_submodules_charTwo` provides the invariants and the
`SL₂(F₀)`-submodules of `M₂(F)`, namely `0`, the scalars, `ad⁰` and `M₂(F)`.

**Checks.**

- The count subtracts two: classes inflated from `Gal(F_n/F)` vanish at every `q` with
  `Nq ≡ 1 (mod 2ⁿ)`, since such `q` split completely in `F_n`, so the two-dimensional residual
  cannot be killed by auxiliary primes.
- For `F = ℚ` and `n ≥ 3`, `Gal(F_n/F) = (ℤ/2ⁿ)^× ≅ ℤ/2 × ℤ/2^{n−2}`: its `𝔽₂`-dual is
  two-dimensional, matching the residual, and its exponent is `2^{n−2}`, the exponent in the
  abelian quotient.
- At a real place with `k = 𝔽₂` and `c = [[1, 1], [0, 1]]`, `h⁰(G_v, ad) = 2`, while
  `Ĥ⁰(G_v, ad) = 0`: both the invariant group and the norm image have order `4`. Substituting
  the Tate dimension would increase the `S`-split dimension formula by `2`.

**Finite-order determinant twists.** Let `F` be totally real, `v` a finite place of `F`, and `ψ, ψ′`
continuous `p`-adic characters of `G_F`, with values in `O^×` for the ring of integers `O` of a
finite extension of `ℚ_p`, such that: they have the same reduction; through class field theory they
agree on open subgroups of the local units at the places above `p` and have equal restrictions to
the units at `v`; and `ψ(c) = ψ′(c)` for every complex conjugation `c ∈ G_F`. KW II Lemma 7.10 is
stated for characters of `F^× ∖ (𝔸^∞_F)^×`, which are trivial on the archimedean idele components;
the parity condition is what this becomes for Galois characters. For `p` odd it follows from equal
reductions, since `(ψ′/ψ)(c)` is a square root of `1` in `1 + 𝔪_O`; for `p = 2` it is independent of
the other conditions (Check). Then `ψ′/ψ` has finite `p`-power order and is totally even. After a
finite extension of the coefficient field and a passage to a totally real cyclic (hence soluble)
extension `F′/F`, split at `v` and linearly disjoint from a given finite extension of `F`, there is
a character `ζ` of finite `p`-power order, unramified at `v`, with `ζ² ψ|_{G_{F′}} = ψ′|_{G_{F′}}`.
For `p` odd one can
take `F′ = F`; for `p = 2` the extension `F′` comes from the Grunwald–Wang construction, with an
auxiliary place that preserves disjointness. Only `ψ′/ψ` and `ζ` have finite order; `ψ` itself need
not.

*Proof sketch.* Through the Artin map, `ψ′/ψ` is trivial on the archimedean idele components (the
parity condition), on an open subgroup of the units above `p`, and, being continuous into the
pro-`p` group `1 + 𝔪_O` (equal reductions), on an open subgroup of the units away from `p`; so it
factors through a ray class group, and its finite order is a power of `p` because its values lie in
`1 + 𝔪_O`. For `p` odd, multiplication by two is
invertible on characters of `p`-power order. For `p = 2`, choose the cyclic totally real extension
with prescribed local splitting and an auxiliary Frobenius condition, then take a square root and
adjust it to be unramified at `v`. ([Khare–Wintenberger, *Serre's modularity conjecture
(II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §7, Lemma 7.10 and proof, p. 69.)
*Needs:* *Grunwald–Wang with its exact dyadic obstruction* (Layer R02.4); *Character roots and local
Brauer obstructions* (Layer R02.4); ClassFieldTheory Layers 7 and 12; Chebotarev Layer 10.

**Checks.**

- For `ψ′ = ψ`, `ζ = 1` and `F′ = F` work; the relation is `ζ²ψ = ψ′`, with the ratio `ψ′/ψ`.
- For `p` odd and `ψ′/ψ` of order `p^m`, `ζ = (ψ′/ψ)^{(p^m + 1)/2}` satisfies `ζ² = ψ′/ψ`, with values
  in the same group of roots of unity.
- For `p = 2` and a nontrivial character `ψ′/ψ` of order `2^m`, `m ≥ 1`, any square root
  on the same Galois group has order `2^{m+1}`, so its values need `μ_{2^{m+1}}`; this is why the coefficient field may have to be extended.
- The parity condition is needed for `p = 2`: take `F = ℚ`, `ψ = 1`, `ψ′` the quadratic character
  of `ℚ(i)/ℚ` and `v = 3`. Both reduce to `1`, `ψ′` is trivial on the units `1 + 4ℤ₂`, and both are
  unramified at `3`, but `(ψ′/ψ)(c) = −1`. After any totally real base change `F′` a complex
  conjugation `c′` of `F′` still has `ψ′(c′) = −1`, while `ζ(c′)² = ζ(c′²) = 1` for every character
  `ζ`, so `ζ²ψ = ψ′` has no solution: this input is excluded.

### Examples

- At a real place with `ρ̄(c)` having eigenvalues `+1, −1` (`n = 2`, `a = b = 1`),
  `h⁰(ad⁰) = a² + b² − 1 = 1`; for `ρ̄(c) = 1` (`a = 2`, `b = 0`) it is `3`; an odd `ρ̄` is in the
  first case.
- For `q ≡ 1 (mod ℓ)` and `ρ̄(Frob_q)` with distinct eigenvalues, `H¹_un(ℚ_q, ad⁰) ≅ k`, spanned by the
  unramified class of a nonzero trace-zero element commuting with `ρ̄(Frob_q)` (the diagonal
  direction when the eigenvalues lie in `k`).

### Dependencies

- Earlier layers of this roadmap: R02.2, R02.3, R02.4, R02.5, D8.
- Earlier targets: §R02.4.2 unramified annihilators
  and §§D7.7.1–D7.7.2 dual local conditions.
- PadicPeriodRings: §0.1 (procyclic `H¹`).
- EllipticCurves: Layer 7 *Selmer structures, the Selmer group, and Sha*.
- ArithmeticGaloisRepresentations: Layer 4, §4.4 (`GL2Subgroup.dickson_projectiveImage`) and §4.7 (`GL2Subgroup.sl2_submodules_charTwo`); Layer 7, §7.7
  (`ResidualImage.h1_SL2_adZero_eq_zero`).
- TauCetiRoadmap Chebotarev: Layer 10.
- TauCetiRoadmap ClassFieldTheory: Layers 5, 7, 12.
- Libraries: Mathlib `groupCohomology`.

## Worked examples

- **`G_{ℚ,{p,∞}}` with `μ_p` coefficients.** For an odd prime `p`, the `S`-unit Kummer sequence gives
  `H¹(G_{ℚ,S}, μ_p) ≅ ℤ/p`, generated by the class of `p`; Tate's Euler characteristic formula gives
  `χ = 1/p`, hence `H²(G_{ℚ,S}, μ_p) = 0`; Poitou–Tate then identifies `Ш²_S(ℚ, μ_p)` with the dual
  of `Ш¹_S(ℚ, ℤ/p)`, the characters of `G_{ℚ,S}` of order `p` that are trivial at `p` and `∞`, and
  both vanish.
- **The real place at `p = 2`.** For `M = ℤ/2` over `ℚ` and `S = {2, ∞}`, the modified groups
  `Ĥʳ(ℝ, ℤ/2) = ℤ/2` are nonzero in every degree; they appear in the nine-term sequence, make
  `Hʳ(G_S, ℤ/2) ≅ Hʳ(ℝ, ℤ/2)` for `r ≥ 3`, and give compact support negative degrees.
- **Grunwald–Wang.** `16` is an eighth power in `ℚ_v` for every `v ≠ 2` but not in `ℚ₂`; hence no cyclic
  extension of `ℚ` of degree `8` is unramified of degree `8` at `2`, and characters of order `8` with
  prescribed restriction at `2` may need order `16`.
- **Tate's inverse-limit theorem.** For a field `K` of characteristic different from `p`, the groups
  `H⁰(G_K, μ_{pⁿ}) = μ_{pⁿ}(K)` are finite, so their `lim¹` vanishes and
  `H¹(G_K, ℤ_p(1)) = lim H¹(G_K, μ_{pⁿ}) = lim Kˣ/Kˣ^{pⁿ}`, the `p`-adic completion of `Kˣ`.
- **Adjoint duality in characteristic dividing `n`.** Over `𝔽₂` with `n = 2`, `ad⁰ ∋ 1`, the dual of
  `ad⁰` is `ad/𝔽₂·1`, and the Greenberg–Wiles formula for `ad⁰` pairs it with `(ad/𝔽₂·1)(1)`, not
  with `ad⁰(1)`.

## Downstream consumers

- **SelmerIwasawaCohomology**: multiplicative completion and the S-unit adapters,
  dual local conditions, the long exact sequences and rationalisation of Layer R02.1;
  the carrier comparison supplied by PerfectoidTowers §P9.0; `G_{K,S}` and the localisation maps of
  Layer R02.3; Poitou–Tate
  duality; compact support, derived local and global duality and the compactly supported Euler
  characteristic of Layer D7. Its §2A.4 consumes `Adjoint.det_one_add_eps` and the
  `𝔽₂` involution Check from Layer D8.
- **Deformation and modularity lifting** (GlobalGaloisDeformations, DeformationAndDerivedPatchingAlgebra,
  OrdinaryAutomorphicFormsAndModularityLifting, GL2ModularityLifting,
  PotentialAutomorphyInfrastructurePartII): Layers R02.3–R02.6, D7 and D8, in particular Poitou–Tate,
  the Greenberg–Wiles formula, the first-order adjoint calculations and the auxiliary-prime numerics.
- **Euler systems and Iwasawa theory** (EulerSystemsAndKolyvaginSystems, HeegnerPointEulerSystems,
  KatoEulerSystems, IntegralIwasawaTheory, NoncommutativeAndEquivariantIwasawa,
  PhiGammaModulesAndIwasawaCohomology, PadicFamilies, PadicHodgeRegulators, RankZeroOneBSD,
  GeneralizedHeegnerCycles, ArithmeticStatistics): compact and rational coefficients (R02.1), the
  Hochschild–Serre and inflation–restriction statements (R02.2), Poitou–Tate (R02.4) and the derived
  duality of D7.
- **Étale and motivic cohomology** (ClassicalAdicEtaleCohomology, DiamondEtaleCohomology,
  DeligneWeightsAndPurity, LefschetzPencilsAndVanishingCycles, IgusaVarietiesAndTorsionConcentration,
  CrystallineCohomology, MotivicEtaleKTheory, ArithmeticKTheory, KTheoryFiniteLocalFields,
  StableHomotopyKTheory, HabiroNumberFields, ShimuraCompactifications,
  PadicHodgeTheory, ExcursionOperatorsAndSpectralAction): Tate's inverse-limit theorem of R02.1, the spectral
  sequences of R02.2 and the derived duality of D7.
- **AnabelianGeometryAndNonabelianChabauty**: local duality over coefficient fields, using the
  carrier comparison supplied by PerfectoidTowers §P9.0.

## References

- J. S. Milne, [*Algebraic Number Theory*](https://www.jmilne.org/math/CourseNotes/ANT.pdf),
  course notes, version 3.08 (2020).
- B. Mazur, K. Rubin, [*Controlling Selmer groups in the higher core rank case*](https://arxiv.org/abs/1312.4052v1),
  arXiv v1; locators use its preprint pagination.
- Y. Liu, Y. Tian, L. Xiao, W. Zhang, X. Zhu,
  [*On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives*](https://doi.org/10.1007/s00222-021-01088-4),
  Invent. Math. 228 (2022), 107–375; locators use the version of record.

- J. S. Milne, [*Arithmetic Duality Theorems*](https://www.jmilne.org/math/Books/ADTnot.pdf), second
  edition, author PDF; printed page = PDF page − 8.
- J. Neukirch, A. Schmidt, K. Wingberg, [*Cohomology of Number Fields*](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf),
  second edition, electronic version 2.3 (2020); pages are printed pages.
- J. Nekovář, [*Selmer complexes*](https://www.numdam.org/item/AST_2006__310__R1_0.pdf), Astérisque 310 (2006).
- K. Rubin, [*Euler Systems*](https://swc-math.github.io/notes/files/99RubinES.pdf), Annals of Mathematics
  Studies 147, author draft; printed page = PDF page − 10.
- The Stacks Project, [More on Algebra, §15.88](https://stacks.math.columbia.edu/tag/07KW), [Algebra, §10.86](https://stacks.math.columbia.edu/tag/0594),
  [Dualizing Complexes, §47.18](https://stacks.math.columbia.edu/tag/0A84).
- U. Jannsen, [*Continuous étale cohomology*](https://epub.uni-regensburg.de/26684/1/jannsen12.pdf), Math. Ann. 280 (1988).
- H. Darmon, F. Diamond, R. Taylor, [*Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), author PDF (2007).
- J. S. Milne, [*Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf), course notes.
- B. Conrad, [*Lifting global representations with local properties*](https://virtualmath1.stanford.edu/~conrad/papers/locchar.pdf), 2011.
- D. Chan, [*Lectures on Orders*](https://web.maths.unsw.edu.au/~danielch/Lect_Orders.pdf), 2011.
- Y. Harpaz, O. Wittenberg, [*The Massey vanishing conjecture for number fields*](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf),
  Duke Math. J. 172 (2023); [*Zéro-cycles sur les espaces homogènes et problème de Galois inverse*](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf).
- C. Khare, J.-P. Wintenberger, [*Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Invent. Math. 178 (2009).
- F. Calegari, D. Geraghty, [*Modularity lifting beyond the Taylor–Wiles method*](https://arxiv.org/pdf/1207.4224), Invent. Math. 211 (2018).
- G. Boxer, F. Calegari, T. Gee, J. Newton, J. Thorne, [*The Ramanujan and Sato–Tate conjectures for Bianchi modular forms*](https://arxiv.org/pdf/2309.15880).
- G. Boxer, F. Calegari, T. Gee, V. Pilloni, [*Abelian surfaces over totally real fields are potentially modular*](https://arxiv.org/pdf/1812.09269).
- P. Allen et al., [*Potential automorphy over CM fields*](https://annals.math.princeton.edu/2023/197-3/p02), Ann. of Math. 197 (2023).
- N. Fakhruddin, C. Khare, S. Patrikis, [*Lifting and automorphy of reducible mod p Galois representations over global fields*](https://arxiv.org/pdf/2008.12593).
- M. Groechenig, D. Wyss, P. Ziegler, [*Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*](https://arxiv.org/pdf/1707.06417),
  Invent. Math. 221 (2020); [*Geometric stabilisation via p-adic integration*](https://arxiv.org/pdf/1810.06739v2).
- T. Kaletha, [*Rigid inner forms of real and p-adic groups*](https://arxiv.org/pdf/1304.3292v5).
- K. Nakamura, [*Zeta morphisms for rank two universal deformations*](https://arxiv.org/pdf/2006.13647).
- J. Newton, J. Thorne, [*Symmetric power functoriality for Hilbert modular forms*](https://api.repository.cam.ac.uk/server/api/core/bitstreams/6bd9d94f-51d3-42e2-9cb1-ffc812189ac5/content).
- V. Paškūnas, J. Quast, *On local Galois deformation rings: generalised reductive groups*, Forum Math. Pi (2026).
- G. Böckle, A. Iyengar, V. Paškūnas, [*On local Galois deformation rings*](https://arxiv.org/pdf/2110.01638).
- G. Böckle, A.-K. Juschka, *Equidimensionality of universal pseudodeformation rings in characteristic p*, Forum Math. Sigma 11 (2023).
- A. Merkurjev, F. Scavia, [*Galois representations modulo p that do not lift modulo `p²`*](https://www.math.ucla.edu/~merkurev/papers/Negligible.pdf).
- F. Calegari, V. Dimitrov, Y. Tang, [*The unbounded denominators conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf).
- M. M. Wood, [*Nonabelian Cohen–Lenstra moments*](https://par.nsf.gov/servlets/purl/10152050), Duke Math. J. 168 (2019).
- L. Qian, [*Potential automorphy for `GL_n`*](https://par.nsf.gov/servlets/purl/10388233).
- J. Pottharst, [*Analytic families of finite-slope Selmer groups*](https://msp.org/ant/2013/7-7/ant-v7-n7-p02-p.pdf), Algebra Number Theory 7 (2013).
